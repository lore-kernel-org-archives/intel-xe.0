Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC33CCAC582
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 19:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8C110E13D;
	Tue,  9 Sep 2025 19:55:50 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD8D10E13D
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 19:55:49 +0000 (UTC)
Message-ID: <f5a45e60-2972-4e1c-8cdf-048a045e0445@lankhorst.se>
Date: Tue, 9 Sep 2025 21:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/guc: Drop helper to read freq
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20250909-xe-iopoll-v2-0-4c7ae9726e8e@intel.com>
 <20250909-xe-iopoll-v2-3-4c7ae9726e8e@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <20250909-xe-iopoll-v2-3-4c7ae9726e8e@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

For 1-3,

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-09-09 kl. 18:02, skrev Lucas De Marchi:
> As the forcewake is already held during GuC load, there's no need to use
> a helper function to call xe_guc_pc_get_cur_freq(). Just call
> xe_guc_pc_get_cur_freq_fw() directly.
> 
> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e56c9c5c8845e..d8fc060c9682e 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1019,14 +1019,6 @@ static int guc_load_done(u32 status)
>  	return 0;
>  }
>  
> -static s32 guc_pc_get_cur_freq(struct xe_guc_pc *guc_pc)
> -{
> -	u32 freq;
> -	int ret = xe_guc_pc_get_cur_freq(guc_pc, &freq);
> -
> -	return ret ? ret : freq;
> -}
> -
>  /*
>   * Wait for the GuC to start up.
>   *
> @@ -1104,7 +1096,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  
>  		xe_gt_dbg(gt, "load still in progress, timeouts = %d, freq = %dMHz (req %dMHz), status = 0x%08X [0x%02X/%02X]\n",
>  			  count, xe_guc_pc_get_act_freq(guc_pc),
> -			  guc_pc_get_cur_freq(guc_pc), status,
> +			  xe_guc_pc_get_cur_freq_fw(guc_pc), status,
>  			  REG_FIELD_GET(GS_BOOTROM_MASK, status),
>  			  REG_FIELD_GET(GS_UKERNEL_MASK, status));
>  	} while (1);
> @@ -1115,7 +1107,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  
>  		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz), done = %d\n",
>  			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
> -			  guc_pc_get_cur_freq(guc_pc), load_done);
> +			  xe_guc_pc_get_cur_freq_fw(guc_pc), load_done);
>  		xe_gt_err(gt, "load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
>  			  REG_FIELD_GET(GS_MIA_IN_RESET, status),
>  			  bootrom, ukernel,
> @@ -1169,11 +1161,11 @@ static void guc_wait_ucode(struct xe_guc *guc)
>  		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>  			   delta_ms, status, count);
>  		xe_gt_warn(gt, "excessive init time: [freq = %dMHz (req = %dMHz), before = %dMHz, perf_limit_reasons = 0x%08X]\n",
> -			   xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
> +			   xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
>  			   before_freq, xe_gt_throttle_get_limit_reasons(gt));
>  	} else {
>  		xe_gt_dbg(gt, "init took %lldms, freq = %dMHz (req = %dMHz), before = %dMHz, status = 0x%08X, timeouts = %d\n",
> -			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), guc_pc_get_cur_freq(guc_pc),
> +			  delta_ms, xe_guc_pc_get_act_freq(guc_pc), xe_guc_pc_get_cur_freq_fw(guc_pc),
>  			  before_freq, status, count);
>  	}
>  }
> 

