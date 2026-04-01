Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B022910F6FBF
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 16:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6BC10EDEF;
	Wed,  1 Apr 2026 16:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="QdwcxziO";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC76810EDEF;
 Wed,  1 Apr 2026 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1775060342;
 bh=Ox5N/EQWGT6jxdtcCGMpXBmaSsSunHevEAW5VY5jkHI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QdwcxziOOpH5WpYMKQVc0f+eq5b+1MZ5ORgf3fhc9VENZzefDn3/SHUjW8Yt0XJOL
 4R+BZ6nyeUqP8yUhrsWdAqPKOe+ksFm0lJJfdGd+Z3Ry17iQrzkj3x3IWPgZ4fQfbH
 eyQN+m9J0RWKbUdcLSofDsD6UBvhBnMDIy1Eewx0xc+Q6HuRVpK1tpjqGFpz1oLFyS
 XbCcAIIO4uYv7DjNALUFhaktIvpVUXl7ZIXWtAbIylKqQihfA3KhAZQ55FqC74984T
 67v+aOc4TYG/U4N0aeCTPOonBg3XUvHUrbVj1E4fGJ5V5bG7qLuyTIu+DEf0DNQhFg
 U8zysh5YGBcyA==
Message-ID: <6f14905d-74bd-4722-ba67-08361e779c17@lankhorst.se>
Date: Wed, 1 Apr 2026 18:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/i915/display: Sync state to BIOS for seamless
 handoff
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Juasheem Sultan <jdsultan@google.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Manasi Navare <navaremanasi@google.com>,
 Drew Davenport <ddavenport@google.com>, Sean Paul <seanpaul@google.com>,
 Samuel Jacob <samjaco@google.com>, Rajat Jain <rajatja@google.com>
References: <20260317220908.130968-1-jdsultan@google.com>
 <20260317220908.130968-3-jdsultan@google.com>
 <08c99b0d-6adb-423b-9c4b-2e8add00f5d3@lankhorst.se>
 <CAH6Pru5Me2pY31JF2GP61k3gy8XDaLfmH7U6jpAwXoYvGEZBwA@mail.gmail.com>
 <acZX6htfhw4v0G8c@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <acZX6htfhw4v0G8c@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hey,

Den 2026-03-27 kl. 11:11, skrev Ville Syrjälä:
> On Thu, Mar 26, 2026 at 04:10:13PM -0700, Juasheem Sultan wrote:
>> Hi,
>>
>> Thanks for looking at this.
>>
>> You're saying instead of manually adopting the state that I should focus on
>> modifying the comparisons that we do to determine if we can perform a
>> fastset?
> 
> We don't want any fuzzy fastset hacks anywhere. I intentionally killed
> all that stuff because it was making it impossible to trust that the
> software state actually represents what the hardware is doing.
> 
> Someone needs to figure out what exactly is the difference between
> the states between the GOP and the driver, and then figure out where
> that difference is coming from.

In some cases the firmware may have different considerations for setting a mode,
not necesssarily worse than what the display driver is using, just different.

In this case userspace requests a mode for example 1920x1080, but it doesn't
particularly care what pll's are used or anything nor has it a way to specify
it at all.

Until there is a major change like disabling the screen, what are the downsides
taking over the inherited mode from the firmware, and postponing changing the
display mode?

Having a flicker-free boot is a desired feature to have, and something intel
handles a lot better than the other drivers.

Kind regards,
~Maarten Lankhorst

>>
>> -Juasheem
>>
>> On Wed, Mar 18, 2026 at 5:00 AM Maarten Lankhorst <dev@lankhorst.se> wrote:
>>
>>> Hey,
>>>
>>> Den 2026-03-17 kl. 23:09, skrev Juasheem Sultan:
>>>> Align DP timings and C10 PLL state with BIOS values if within a 0.5%
>>>> clock threshold. This prevents minor mismatches from triggering a full
>>>> modeset during the first atomic commit, ensuring a flicker-free handoff.
>>>>
>>>> Signed-off-by: Juasheem Sultan <jdsultan@google.com>
>>>> ---
>>>>  drivers/gpu/drm/i915/display/intel_display.c | 67 ++++++++++++++++++++
>>>>  1 file changed, 67 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>>> b/drivers/gpu/drm/i915/display/intel_display.c
>>>> index c4246481fc2f..22e5e931f134 100644
>>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>>> @@ -6397,6 +6397,71 @@ static int
>>> intel_atomic_check_config_and_link(struct intel_atomic_state *state)
>>>>
>>>>       return ret;
>>>>  }
>>>> +
>>>> +// Helper function to sanitize pll state
>>>> +static void intel_sanitize_pll_state(struct intel_crtc_state
>>> *old_crtc_state,
>>>> +             struct intel_crtc_state *new_crtc_state)
>>>> +{
>>>> +     int j;
>>>> +
>>>> +     for (j = 4; j < 9; j++) {
>>>> +             if (new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] !=
>>>> +
>>>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j]) {
>>>> +                     new_crtc_state->dpll_hw_state.cx0pll.c10.pll[j] =
>>>> +
>>>  old_crtc_state->dpll_hw_state.cx0pll.c10.pll[j];
>>>> +             }
>>>> +     }
>>>> +}
>>>> +
>>>> +/*
>>>> + * intel_dp_sanitize_seamless_boot - Snap driver state to BIOS state
>>> for seamless handoff.
>>>> + * @state: the atomic state to sanitize
>>>> + *
>>>> + * This function compares the driver's calculated new_state with the
>>> inherited BIOS state
>>>> + * (old_state). If they are within a small threshold (e.g., 0.5% for
>>> clock), it "snaps"
>>>> + * the new_state to match the BIOS state exactly. This prevents minor
>>> state mismatches
>>>> + * that would otherwise force a full modeset (and a screen flicker)
>>> during the initial
>>>> + * kernel handoff.
>>>> + */
>>>> +static void intel_dp_sanitize_seamless_boot(struct intel_atomic_state
>>> *state)
>>>> +{
>>>> +     struct intel_display *display = to_intel_display(state);
>>>> +     struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>>>> +     struct intel_crtc *crtc;
>>>> +     struct intel_encoder *encoder;
>>>> +     int i;
>>>> +
>>>> +     for_each_oldnew_intel_crtc_in_state(state, crtc, old_crtc_state,
>>> new_crtc_state, i) {
>>>> +             /*
>>>> +              * We must check old_crtc_state->inherited because
>>> new_crtc_state->inherited
>>>> +              * is cleared at the start of intel_atomic_check for
>>> userspace commits.
>>>> +              */
>>>> +             if (!old_crtc_state->inherited ||
>>> !new_crtc_state->hw.active)
>>>> +                     continue;
>>>> +
>>>> +             if (intel_crtc_has_dp_encoder(new_crtc_state)) {
>>>> +                     int old_clock =
>>> old_crtc_state->hw.adjusted_mode.crtc_clock;
>>>> +                     int new_clock =
>>> new_crtc_state->hw.adjusted_mode.crtc_clock;
>>>> +                     int threshold = old_clock / 200; /* 0.5% */
>>>> +
>>>> +                     if (abs(new_clock - old_clock) <= threshold) {
>>>> +                             new_crtc_state->hw.pipe_mode.crtc_clock =
>>> old_clock;
>>>> +
>>>  new_crtc_state->hw.adjusted_mode.crtc_clock = old_clock;
>>>> +                             new_crtc_state->pixel_rate =
>>> old_crtc_state->pixel_rate;
>>>> +                             new_crtc_state->dp_m_n =
>>> old_crtc_state->dp_m_n;
>>>> +                     }
>>>> +             }
>>>> +
>>>> +             for_each_intel_encoder_mask(display->drm, encoder,
>>>> +                             new_crtc_state->uapi.encoder_mask) {
>>>> +                     if (intel_encoder_is_c10phy(encoder)) {
>>>> +                             if
>>> (!new_crtc_state->dpll_hw_state.cx0pll.ssc_enabled)
>>>> +
>>>  intel_sanitize_pll_state(old_crtc_state, new_crtc_state);
>>>> +                     }
>>>> +             }
>>>> +     }
>>>> +}
>>>> +
>>>>  /**
>>>>   * intel_atomic_check - validate state object
>>>>   * @dev: drm device
>>>> @@ -6447,6 +6512,8 @@ int intel_atomic_check(struct drm_device *dev,
>>>>       if (ret)
>>>>               goto fail;
>>>>
>>>> +     intel_dp_sanitize_seamless_boot(state);
>>>> +
>>>>       for_each_new_intel_crtc_in_state(state, crtc, new_crtc_state, i) {
>>>>               if (!intel_crtc_needs_modeset(new_crtc_state))
>>>>                       continue;
>>>
>>> This might fix boot state, but in a way that complicates the code
>>> considerably.
>>>
>>> Have you considered updating intel_pipe_config_compare instead?
>>>
>>> Kind regards,
>>> ~Maarten Lankhorst
>>>
> 

