Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBE5C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  2 May 2023 19:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACFEF10E01F;
	Tue,  2 May 2023 19:13:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976EE10E01F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 May 2023 19:13:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5BFD562023;
 Tue,  2 May 2023 19:13:22 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id 99C6AC433EF;
 Tue,  2 May 2023 19:13:20 +0000 (UTC)
Date: Tue, 2 May 2023 15:13:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <ZFFgzdksP+U6XYwB@rdvivi-mobl4>
References: <20230425192624.168640-1-jose.souza@intel.com>
 <20230425192624.168640-15-jose.souza@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230425192624.168640-15-jose.souza@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 14/15] drm/xe/display: Disable PSR HW
 tracking by default in all display versions
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
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Apr 25, 2023 at 12:26:23PM -0700, José Roberto de Souza wrote:
> Of the platforms supported by Xe, only TGL and DG1 has PSR HW
> tracking.
> 
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
> index fbae60c179be1..376186bc02e51 100644
> --- a/drivers/gpu/drm/xe/xe_display.c
> +++ b/drivers/gpu/drm/xe/xe_display.c
> @@ -449,7 +449,7 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  	.has_hdcp = 1,							\
>  	.has_ipc = 1,							\
>  	.has_psr = 1,							\
> -	.has_psr_hw_tracking = 1,					\
> +	.has_psr_hw_tracking = 0,					\
>  	.color = { .degamma_lut_size = 33, .gamma_lut_size = 262145 }
>  
>  #define XE_LPD								\
> @@ -472,7 +472,8 @@ __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>  	.has_fpga_dbg = 1,						\
>  	.has_hdcp = 1,							\
>  	.has_ipc = 1,							\
> -	.has_psr = 1
> +	.has_psr = 1,							\
> +	.has_psr_hw_tracking = 0
>  
>  #define XE_LPDP								\
>  	XE_LPD,								\
> @@ -492,6 +493,7 @@ void xe_display_info_init(struct xe_device *xe)
>  		xe->info.display = (struct xe_device_display_info) {
>  			GEN12_DISPLAY,
>  			.has_modular_fia = 1,
> +			.has_psr_hw_tracking = 1,
>  		};
>  		break;
>  	case XE_ROCKETLAKE:
> @@ -511,15 +513,13 @@ void xe_display_info_init(struct xe_device *xe)
>  		xe->info.display = (struct xe_device_display_info) {
>  			GEN12_DISPLAY,
>  			.has_hti = 1,
> -			.has_psr_hw_tracking = 0,
>  		};
>  		break;
>  	case XE_ALDERLAKE_P:
>  		xe->info.display = (struct xe_device_display_info) {
>  			XE_LPD,
>  			.has_cdclk_crawl = 1,
> -			.has_modular_fia = 1,
> -			.has_psr_hw_tracking = 0,
> +			.has_modular_fia = 1
>  		};
>  		break;
>  	case XE_DG2:
> -- 
> 2.40.0
> 
