Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9093606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 27 Oct 2026 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.a=rsa-sha256 header.s=default header.b=fbJ6jWUa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE6A10F5DC;
	Tue, 27 Oct 2026 14:31:13 +0000 (UTC)
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D7D10F5E6;
 Tue, 27 Oct 2026 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1793111464;
 bh=v25y1zDWjFykQvL7kfA9EQW0RVClhE2vGK5OLwCjvtc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fbJ6jWUaMFAhyhZXdd0kJhFHU0U1FH8fCp0aDFjm2XKFwxegf+mE9gsnWr9BJ2UGl
 jovOI5F04pABYwcF7Fe9VRQ3uNvDJn+dLpaOJqUrLZgE08EBM8wF+3QMgZdrV+j3dq
 q97t/DoN378Ss4WEYMn5ZHFMlPK6xWaVr5ivc7nCnr3d5dAzqKiEBOt6zUndZOlvpT
 FoS41IjnEJbzOd5TXBVVCNzQS7fzrFoW8pzAggS/diAwh8b+Q/gpu0tq/SNxW4kHtF
 fG/ZeJcx5V74Id3YL+CCKQdMolHlvHT2t+Fmd1LSEHhlEBhBVwHAcwVnhbtAWZBl9l
 H4Yy6xulaz5jw==
Message-ID: <c28c27da-ccc4-454c-8c3b-e34808fccf97@lankhorst.se>
Date: Tue, 27 Oct 2026 15:31:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/i915/display: Seed skl_cdclk_init_hw() with
 SKU-max, not zero
To: Arun R Murthy <arun.r.murthy@intel.com>, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?Q?Polo-Fran=C3=A7ois_Poli?= <polo.code.dev@gmail.com>
References: <20260804-cdclk-v1-0-484864b1aafd@intel.com>
 <20260804-cdclk-v1-1-484864b1aafd@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20260804-cdclk-v1-1-484864b1aafd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 8/4/26 11:28, Arun R Murthy wrote:
> skl_cdclk_init_hw() has a recovery path that runs when skl_sanitize_cdclk()
> has decided the pre-OS CDCLK state is not usable and zeroes
> display->cdclk.hw.
>
> Seed with the SKU-permitted maximum instead (as read from SKL_DFSM), so
> the recovery path lands on a cdclk that satisfies every pipe on the SKU.
> The very first atomic commit that follows will dial cdclk down to what
> active pipes actually need via the normal skl_modeset_calc_cdclk() path.
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16595
> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> Tested-by: Polo-François Poli <polo.code.dev@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_cdclk.c | 65 +++++++++++++++++++++++++++++-
>  1 file changed, 64 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cdclk.c b/drivers/gpu/drm/i915/display/intel_cdclk.c
> index a53d887271778193fd400b9199ad841d5d9730fe..19f3ef8adfcded378428924539db9336834278ea 100644
> --- a/drivers/gpu/drm/i915/display/intel_cdclk.c
> +++ b/drivers/gpu/drm/i915/display/intel_cdclk.c
> @@ -1288,6 +1288,31 @@ static void skl_sanitize_cdclk(struct intel_display *display)
>  	display->cdclk.hw.vco = ~0;
>  }
>  
> +/*
> + * Seed cdclk from the SKU-permitted maximum. Used by skl_cdclk_init_hw()'s
> + * recovery path when skl_sanitize_cdclk() has decided the pre-OS CDCLK state
> + * is not usable and has zeroed display->cdclk.hw.
> + * Seed with the SKU top instead: it is guaranteed to satisfy every pipe on
> + * the platform, and the very first atomic commit will dial cdclk down via
> + * skl_modeset_calc_cdclk() once per-pipe min_cdclk is known.
> + */
> +static int skl_cdclk_init_hw_seed(struct intel_display *display, int vco)
> +{
> +	u32 limit = intel_de_read(display, SKL_DFSM) & SKL_DFSM_CDCLK_LIMIT_MASK;
> +	int max_cdclk;
> +
> +	if (limit == SKL_DFSM_CDCLK_LIMIT_675)
> +		max_cdclk = 617143;
> +	else if (limit == SKL_DFSM_CDCLK_LIMIT_540)
> +		max_cdclk = 540000;
> +	else if (limit == SKL_DFSM_CDCLK_LIMIT_450)
> +		max_cdclk = 432000;
> +	else
> +		max_cdclk = 308571;
> +
> +	return skl_calc_cdclk(max_cdclk, vco);
> +}
> +
>  static void skl_cdclk_init_hw(struct intel_display *display)
>  {
>  	struct intel_cdclk_config cdclk_config;
> @@ -1311,9 +1336,14 @@ static void skl_cdclk_init_hw(struct intel_display *display)
>  	cdclk_config.vco = display->cdclk.skl_preferred_vco_freq;
>  	if (cdclk_config.vco == 0)
>  		cdclk_config.vco = 8100000;
> -	cdclk_config.cdclk = skl_calc_cdclk(0, cdclk_config.vco);
> +
> +	cdclk_config.cdclk = skl_cdclk_init_hw_seed(display, cdclk_config.vco);
>  	cdclk_config.voltage_level = skl_calc_voltage_level(cdclk_config.cdclk);
>  
> +	drm_dbg_kms(display->drm,
> +		    "cdclk: init seed cdclk=%d vco=%d volt=%d (SKU-max, no per-pipe min_cdclk yet)\n",
> +		    cdclk_config.cdclk, cdclk_config.vco, cdclk_config.voltage_level);
> +
>  	skl_set_cdclk(display, &cdclk_config, INVALID_PIPE);
>  }
>  
> @@ -4231,6 +4261,39 @@ void intel_cdclk_read_hw(struct intel_display *display)
>  	cdclk_state->logical = display->cdclk.hw;
>  }
>  
> +/**
> + * intel_cdclk_sync_hw_state - Adopt the HW-asserted cdclk into SW state.
> + * @display: display instance
> + * @hw_config: the cdclk configuration as currently read back from HW
> + *
> + * This helper reconciles the SW state to match what HW is currently asserting.
> + * It updates display->cdclk.hw and the committed cdclk_state's actual/logical
> + * so that any following atomic commit sees a truthful baseline and will
> + * naturally attach a cdclk_state (via intel_cdclk_atomic_check()) to raise
> + * cdclk when the workload demands it.
> + */
> +void intel_cdclk_sync_hw_state(struct intel_display *display,
> +			       const struct intel_cdclk_config *hw_config)
You're defining the function here, but using it in patch 2.

Can you move this part to the second patch?
> +{
> +	struct intel_cdclk_state *cdclk_state =
> +		to_intel_cdclk_state(display->cdclk.obj.state);
> +
> +	if (!intel_cdclk_clock_changed(&display->cdclk.hw, hw_config))
> +		return;
> +
> +	drm_dbg_kms(display->drm,
> +		    "cdclk: syncing SW state to HW after drift (sw %d/vco %d/ref %d -> hw %d/vco %d/ref %d)\n",
> +		    display->cdclk.hw.cdclk, display->cdclk.hw.vco, display->cdclk.hw.ref,
> +		    hw_config->cdclk, hw_config->vco, hw_config->ref);
> +
> +	display->cdclk.hw.cdclk = hw_config->cdclk;
> +	display->cdclk.hw.vco = hw_config->vco;
> +	display->cdclk.hw.ref = hw_config->ref;
> +
> +	cdclk_state->actual = display->cdclk.hw;
> +	cdclk_state->logical = display->cdclk.hw;
> +}
> +
>  static int calc_cdclk(const struct intel_crtc_state *crtc_state, int min_cdclk)
>  {
>  	struct intel_display *display = to_intel_display(crtc_state);
>
With that changed, for both patches:
Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
