Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB907CA6004
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78E7010F5EF;
	Wed,  7 Oct 2026 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="plEwQNrl";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A1C10E12D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Oct 2026 16:09:25 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-c2afa22e1dcso112894566b.1
 for <intel-xe@lists.freedesktop.org>; Tue, 06 Oct 2026 09:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791302964; cv=none;
 d=google.com; s=arc-20260327;
 b=fQHMs8ioUkE2UdtxkONsUQWonnpqWietK1ykZPlTO+zfkjdzY0OF4qUbYhynyL29sL
 tsv+NZgmtnqe1fdcrFnfHfU5sBeH3i5EbE7N6KVC4Jw7wHqv8Kr9+qPcO0lR01IFNUFb
 DSgeafuoshC8of8TkbRQcqis0QAdoeHTe3j7MzQdvt5AQ4Q6bSXyWMr5Z+GJXIky6yko
 +HGMcM+a1etlmhz8RQiGE1VD8QWCv+5MSIg9mOF+VALqGiHST1hhjK9PEEHR6uhmnMR6
 3EX4PfXse9TmK0RTfSGALzOmKT2vLR3hVsybXWLHD/kCz1osZEwk9KO5FBtpZ/ozuZno
 NAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
 fh=oiDIoNsKBdywabFL/+NxqL+E9ZZirZlCliw7BMtW8UE=;
 b=osWE6VGMzjGKwpYIgIwhIr4vqnCu+j0u+Qn4RfOm1Y+yFpKa4oBRYCOx6ejMDHJtIC
 Cfop1m4WOFj0AyGy/THAcjkoW4N+em/PNBNcy+Rbqt1V8SPGb5obIUpWYdoiXZsZenbp
 DJh8qFpWMO+oAII7RC7TyTGIefZS7o7/DQsg2WGwRFUU/pvMRbyHHXWRjcMyJ7zzRr2N
 Z6e/4L3FyAPiXsjtiXPsLkp2wiM/5vNSfy97xknO+mqUCrkVd7GYrpwHV2a52XgZMkLD
 DyUdYWD0isyXEvTaD6vhq75NPxrEZUUYKjdK3ojsWey46NeWI2OTarUmJCiCW+EAkFER
 1d4g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791302964; x=1791907764; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
 b=plEwQNrlMzsQd3Isq9+RihNRY1j4ilg4ew6ZqWTMV65VCgZXNwzSul6z/Vbt6qIni2
 cN7jb+UUhk8hxAEPszmY0tdCXIJ00FgsKaWiw0qbNb3kVuCA0YWv9f9y9NqQoK3AtFyy
 5T6hcUAwLficWpmWlM5plRZdrdDMYh1SILNbYcH/ndPXW39gYfjkPHbmIXmQXfaaysJx
 ujc4K3ZQzjKrpDN68u9fZ12V+zEK4ISkRdN5uo4AwTw080elGU7dkKmxeTHMw5jCBt7M
 HtByqWHHpT4eFf/iD9VKjuivhygq0U/wdI0UVuluL/hd4LYxiJwTOvEP7jvcNqLNwkuA
 7a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791302964; x=1791907764;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3usypQk1aH/wgn8+3d6DUOUXO79QcDW+qxXIhYKt0d8=;
 b=dpGaCY/RgdyzkhhQxKO+4EFlI2wrftEa9SpdhZcAH4W4FRtyjFi+lOpIrTVjZd9TLc
 NdJ/NnFEIDyph4pTZhoz9ppMHFtC5t3xCslSf0jffP8tcE839mIYpQyN3/drAT1tXGjC
 yWsfGEjXYXVo6IU1L3aiQGNifmASDNwZ6VtJgic8mQLiGPbeeucgv0FvVo6LEjNzJ/yV
 o/LWGTVjIS53T4Vx16tRxkspJ7yFAqcGWI7SJSdWB6o3qoQYCtSRypgUZTf/3Itxbk9b
 6UdttPt1haGnI3r7BiXP+hVqxHiFa+L0eFftVewzPxj393TwqvykZGrPNh7hpc7cUi1J
 apdg==
X-Gm-Message-State: AFq9FYJ33gX8lrqvNq5QE8jP4Mx18JSXu+3YzN/PlV/HBvAFt/OOmoW6
 opNLbb9M6BJUOv8aBVTBqjIkXyrvi81E4vZFZmto6yHji6kLR8AhDLBHqkKHRBbnq+liLdcZgcH
 Pj76IV+b5MxpsDs+OvLXhCSYh78ctAcg=
X-Gm-Gg: AYBFou1SgzyZafdQzv4V3c9h+C4aYtJiERuBTCNJAm1CYLZh3l+JvyOz0cvVLzDW5sn
 zP5RQ45aHV0S68zywbiotdpZaIOs8UoD0DpXaqgf8+UY2cNTXp12wYz8FbtFd1h0QS4hyPSp34S
 Dqvxbwg5Xe8AMkAfEOHPNvJqcmPIFfU6P+V7Kavd/rHmkpKzE2eqlbsMqD7I7nvAmwdAGmRLbxp
 Vkl11lUqORNU7Pe8w4028HXFXUdu9s7Tpbuu8XO8RQ3Q8b4HJ/pdpld+edk26uggG+JY5GUuM9K
 MqHpZX/EL4PZfdmFERiQsipZXBy04TMiczvoJdQcSYJQLYaT9STH29f/oOB+dN/wW24LGUYIWEr
 WbCtpWFU9JV0fFjBu/0pprfCbTMlsvFcIDNL9W+vTDVVdiwTvzO84VvSpSj43HvrBB9wzbMvqjg
 ==
X-Received: by 2002:a17:907:9608:b0:c2e:350b:7220 with SMTP id
 a640c23a62f3a-c3169faf310mr221144966b.9.1791302963551; Tue, 06 Oct 2026
 09:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <5893371ab206c97d5d2f1d72eb149d5ace4250e2@intel.com>
 <20260924211852.436787-1-conor10@gmail.com>
In-Reply-To: <20260924211852.436787-1-conor10@gmail.com>
From: Conor Svensson <conor10@gmail.com>
Date: Tue, 6 Oct 2026 17:09:11 +0100
X-Gm-Features: AclHuK8euk8GLEFfAD6Rnbhy2sHY5UC2jDl_5n4HYrsNEmactwXBlRsXbHOqyPw
Message-ID: <CALr9iFoWV7YVSb9Hi+kUUmZP5wUhGwaKf1XTa67KViqj1=4b3A@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Configure protocol converter only for TMDS
 outputs
To: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
 airlied@gmail.com, simona@ffwll.ch, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 07 Oct 2026 14:05:56 +0000
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

Hi Jani,

A gentle follow-up on this patch. Following your advice on the
original RFC, I investigated the root cause and posted the findings
and testing results to the GitLab issue:

https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180#note_3679658

The revised patch replaces the device-specific quirk with a change to
the protocol-converter configuration. Feedback on the approach and
whether this belongs in i915 or the DP helper would be appreciated.

Thanks for your time,

Conor


On Thu, 24 Sept 2026 at 22:19, Conor Svensson <conor10@gmail.com> wrote:
>
> intel_dp_configure_protocol_converter() currently writes the HDMI/DVI
> output-selection control for every DP 1.3+ branch. The write is only
> meaningful for a TMDS downstream output; a native DisplayPort output should
> not be switched to the HDMI/DVI protocol-converter mode.
>
> An Anker 565 branch (Synaptics OUI 90:cc:24) changes its downstream port
> descriptor from DisplayPort to DVI immediately after this write. i915 then
> derives a 165 MHz TMDS limit on the next hotplug probe and drops the
> monitor's native modes. Skipping the write for non-TMDS outputs prevents
> the transition.
>
> The existing dfp.min_tmds_clock classification is nonzero for HDMI/DVI
> outputs and zero for native DisplayPort outputs, so retain the write for
> the protocol-converter cases that need it. Colour-conversion controls are
> unchanged.
>
> Tested on a ThinkPad L14 Gen 4 with an Anker 565 A8388 hub and a Dell
> S3422DWG:
>
> - native 3440x1440@59.973 after DP recovery
> - three USB-C reconnects on the first USB-C port
> - one test on the second USB-C port
> - suspend/resume on the second port
> - HDMI through the hub at 3440x1440@59.973, with HDMI-specific modes
>   present
>
> On the unpatched control kernel, the live descriptor changed from
> 08 f0 01 1e 00 00 00 00 to 0a 42 00 00 00 00 00 00 across the 0x3050 write.
>
> Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17180
>
> Root-cause findings and validation details were added to the linked issue.
>
> Assisted-by: LLM Codex GPT-6
>
> Signed-off-by: Conor Svensson <conor10@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index ffddf4b33..cdc3d7786 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -4422,14 +4422,17 @@ void intel_dp_configure_protocol_converter(struct intel_dp *intel_dp,
>         if (!drm_dp_is_branch(intel_dp->dpcd))
>                 return;
>
> -       tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
> +       /* HDMI/DVI output selection only applies to TMDS downstream ports. */
> +       if (intel_dp->dfp.min_tmds_clock) {
> +               tmp = intel_dp_has_hdmi_sink(intel_dp) ? DP_HDMI_DVI_OUTPUT_CONFIG : 0;
>
> -       ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
> -                                    DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
> -       if (ret < 0)
> -               drm_dbg_kms(display->drm,
> -                           "Failed to %s protocol converter HDMI mode\n",
> -                           str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> +               ret = drm_dp_dpcd_write_byte(&intel_dp->aux,
> +                                            DP_PROTOCOL_CONVERTER_CONTROL_0, tmp);
> +               if (ret < 0)
> +                       drm_dbg_kms(display->drm,
> +                                   "Failed to %s protocol converter HDMI mode\n",
> +                                   str_enable_disable(intel_dp_has_hdmi_sink(intel_dp)));
> +       }
>
>         if (crtc_state->sink_format == INTEL_OUTPUT_FORMAT_YCBCR420) {
>                 switch (crtc_state->output_format) {
>
> base-commit: 703cd271db3a35088460ab3fec0a96bd48e7fe04
> --
> 2.55.0
>


--

Conor Svensson

Schedule a Meeting

+44 (0) 7497 376 365

LinkedIn  X (Twitter)
