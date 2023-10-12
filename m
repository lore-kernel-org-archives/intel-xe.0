Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49070CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 10:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9A1886A4;
	Thu, 12 Oct 2023 10:32:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0864B886A4
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697106741; x=1728642741;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SPbkoRtxr+Ruh6svyO6eBpMJiXvMdPXbC6reCKdEY8s=;
 b=kLbnu8uMglw84OWZXn3s7CTXkx6ZApIk+tal0mAwTJQqVEJsEeb76Bnb
 G/tbzHXtun4NqhOeL+BgBvOxhdcb3Fo0rCEhqnAv+pLVPz1XT1UmavkeT
 0VFqFg6Yq0vfmI5VxEcUSh5mbBP1CgRzC45IK50xtYm126Doe6Ll7i+Xl
 0YOse0PaKXigChuNZbsXoA12IEPbByMffrtXmpxSSY+mZiQUVAdwlB+mC
 5bYhRHmXXphbWuL6EW+0w/yqPH0JqovB/xzkrqK38tKtOK20xhLGsWDDR
 kZi0uBipTzjoLtnSUq1ssRYDvVgvHhU/XDcpnhznaM17xsHhactHrX6ZJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="384736577"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="384736577"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="927941935"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="927941935"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 03:32:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20231012102622.810974-3-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012102622.810974-1-suraj.kandpal@intel.com>
 <20231012102622.810974-3-suraj.kandpal@intel.com>
Date: Thu, 12 Oct 2023 13:32:17 +0300
Message-ID: <87zg0o168e.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v4 2/3] drm/i915/hdcp: Move checks for gsc
 health status
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

On Thu, 12 Oct 2023, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> Move checks for gsc components required for HDCP 2.2
> to work into intel_hdcp_gsc.c. This will also help
> with XE refactor on HDCP's side.
>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Link: https://patchwork.freedesktop.org/patch/msgid/20231009095537.653619-2-suraj.kandpal@intel.com

Backports of upstream commits *MUST* have the cherry-pick
annotation. Otherwise this'll just pop up as another commit that needs
to be fixed before we merge upstream.

You'll get it with 'git cherry-pick -x'.


BR,
Jani.


> ---
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  8 +-------
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.c | 14 ++++++++++++++
>  drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |  1 +
>  3 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
> index 8cca4793cf92..c89da3568ebd 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
> @@ -173,14 +173,8 @@ bool intel_hdcp2_capable(struct intel_connector *connector)
>  
>  	/* If MTL+ make sure gsc is loaded and proxy is setup */
>  	if (intel_hdcp_gsc_cs_required(i915)) {
> -		struct intel_gt *gt = i915->media_gt;
> -		struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
> -
> -		if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> -			drm_dbg_kms(&i915->drm,
> -				    "GSC components required for HDCP2.2 are not ready\n");
> +		if (!intel_hdcp_gsc_check_status(i915))
>  			return false;
> -		}
>  	}
>  
>  	/* MEI/GSC interface is solid depending on which is used */
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> index 4ab640b4e7ec..69af416cffe6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.c
> @@ -12,6 +12,20 @@
>  #include "i915_utils.h"
>  #include "intel_hdcp_gsc.h"
>  
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915)
> +{
> +	struct intel_gt *gt = i915->media_gt;
> +	struct intel_gsc_uc *gsc = gt ? &gt->uc.gsc : NULL;
> +
> +	if (!gsc || !intel_uc_fw_is_running(&gsc->fw)) {
> +		drm_dbg_kms(&i915->drm,
> +			    "GSC components required for HDCP2.2 are not ready\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  static int
>  gsc_hdcp_initiate_session(struct device *dev, struct hdcp_port_data *data,
>  			  struct hdcp2_ake_init *ake_data)
> diff --git a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> index 704acd3ed46b..dcbf9b0b22c6 100644
> --- a/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> +++ b/drivers/gpu/drm/i915/display/intel_hdcp_gsc.h
> @@ -26,5 +26,6 @@ ssize_t intel_hdcp_gsc_msg_send(struct drm_i915_private *i915, u8 *msg_in,
>  				size_t msg_out_len);
>  int intel_hdcp_gsc_init(struct drm_i915_private *i915);
>  void intel_hdcp_gsc_fini(struct drm_i915_private *i915);
> +bool intel_hdcp_gsc_check_status(struct drm_i915_private *i915);
>  
>  #endif /* __INTEL_HDCP_GCS_H__ */

-- 
Jani Nikula, Intel
