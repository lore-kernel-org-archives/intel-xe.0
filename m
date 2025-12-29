Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BB2E8FDB1
	for <intel-xe@archiver.kernel.org>; Mon, 29 Dec 2025 09:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDD910F2DA;
	Mon, 29 Dec 2025 09:11:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jg6bFOFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B9C10F2DA
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Dec 2025 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766999462; x=1798535462;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=5glWvSHYfAnWYZYA+9IupKjwdvuuOtDkGGNtA0krjVg=;
 b=jg6bFOFAhdKCwHOzSgOZ3Mii9JziMvmIJ7A4FKbLW+BsvpLMZd17BX1a
 zIuzx6glY+BwRIm7BB3p/7A0bQWP49rYtDm2zu1f4uiKf8UYe5iaZL23Q
 5fIA70xqS00kq0MmuM0k8eW/aaQVEBHGg9RkXk/oNcS2M9hPK80Edxke/
 Mkepbfmrau8DBj7T0hLFwwSnzAqtvbO+hMtkSHOU8/5k9O0ZPW1H5zIrK
 tvVUZ6qWxkXqyjHEos8q0R8cUocOst1DIaAX3OHgQT4VnIqfjcL5jRY++
 cuhOH+81bDzJy+YokhYc5vhg45sEngcb4IlWvVxgRp5BbW6NGntdiVwne w==;
X-CSE-ConnectionGUID: 5x8rn2atQi6zzItAP4i7eg==
X-CSE-MsgGUID: mpogRqdMTNu39e8U7L09Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11655"; a="94080082"
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="94080082"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 01:11:02 -0800
X-CSE-ConnectionGUID: DkLDttRfRlWbNvBuXSMDBA==
X-CSE-MsgGUID: e7yCtqKcT8CBd2DDMOawCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,185,1763452800"; d="scan'208";a="200607912"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.147])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Dec 2025 01:11:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe: Enable out of tree compile for Xe KMD
In-Reply-To: <20251224223046.2819609-2-umesh.nerlige.ramappa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251224223046.2819609-2-umesh.nerlige.ramappa@intel.com>
Date: Mon, 29 Dec 2025 11:10:56 +0200
Message-ID: <b131c1d8e94335d679db480f1442b6836a6056e8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 24 Dec 2025, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
> When trying to build the xe module out of tree, the compile fails to
> find the right trace header files and display paths.
>
> Both i915 and xe directories are copied to an out of tree location and
> the usual commands to build an out of tree module must be used to build
> xe.
>
> Based on the link below, modify the TRACE_INCLUDE_PATH to fix this.
>
> https://lwn.net/Articles/383362/
>
> In addition use relative path for display components in the Makefile

Please don't do any of this.

See include/trace/define_trace.h and the comment on TRACE_INCLUDE_PATH:

 * TRACE_INCLUDE_PATH if the path is something other than core kernel include/trace
 *     then this macro can define the path to use. Note, the path is relative to
 *     define_trace.h, not the file including it. Full path names for out of tree
 *     modules must be used.

See also commit 4e6d7719bdc5 ("drm/i915: Use correct path to trace
include").

If you are doing some weird out-of-tree hacks, you need to keep them,
well, out-of-tree.

> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/i915/Makefile                      | 4 ++++
>  drivers/gpu/drm/i915/display/intel_display_trace.h | 2 +-
>  drivers/gpu/drm/i915/gvt/trace.h                   | 2 +-
>  drivers/gpu/drm/i915/i915_trace.h                  | 2 +-
>  drivers/gpu/drm/i915/intel_uncore_trace.h          | 2 +-
>  drivers/gpu/drm/xe/Makefile                        | 6 +++---
>  drivers/gpu/drm/xe/xe_trace.h                      | 2 +-
>  drivers/gpu/drm/xe/xe_trace_bo.h                   | 2 +-
>  drivers/gpu/drm/xe/xe_trace_guc.h                  | 2 +-
>  drivers/gpu/drm/xe/xe_trace_lrc.h                  | 2 +-
>  10 files changed, 15 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 4db24050edb0..13a910a005fa 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -374,6 +374,8 @@ i915-y += \
>  	display/intel_vrr.o \
>  	display/vlv_dsi.o \
>  	display/vlv_dsi_pll.o
> +subdir-ccflags-y += \
> +	-I$(src)/display

In particular, I do not want display/ added to header search path
here. We're in the process of removing i915 includes of display headers,
and this makes it harder to track them.

BR,
Jani.

>  
>  i915-$(CONFIG_DRM_I915_DP_TUNNEL) += \
>  	display/intel_dp_tunnel.o
> @@ -419,6 +421,8 @@ i915-y += \
>  i915-$(CONFIG_DRM_I915_GVT) += \
>  	intel_gvt.o \
>  	intel_gvt_mmio_table.o
> +subdir-ccflags-$(CONFIG_DRM_I915_GVT) += \
> +	-I$(src)/gvt
>  include $(src)/gvt/Makefile
>  
>  obj-$(CONFIG_DRM_I915) += i915.o
> diff --git a/drivers/gpu/drm/i915/display/intel_display_trace.h b/drivers/gpu/drm/i915/display/intel_display_trace.h
> index 27ebc32cb61a..aa43f2a5510a 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_trace.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_trace.h
> @@ -853,6 +853,6 @@ TRACE_EVENT(intel_frontbuffer_flush,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/display
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE intel_display_trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/i915/gvt/trace.h b/drivers/gpu/drm/i915/gvt/trace.h
> index 63874d385c6f..235d51ee48ad 100644
> --- a/drivers/gpu/drm/i915/gvt/trace.h
> +++ b/drivers/gpu/drm/i915/gvt/trace.h
> @@ -378,6 +378,6 @@ TRACE_EVENT(render_mmio,
>  /* This part must be out of protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915/gvt
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 7ed41ce9b708..a074a5f542fc 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -721,6 +721,6 @@ DEFINE_EVENT(i915_context, i915_context_free,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE i915_trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/i915/intel_uncore_trace.h b/drivers/gpu/drm/i915/intel_uncore_trace.h
> index f13ff71edf2d..01219e97574b 100644
> --- a/drivers/gpu/drm/i915/intel_uncore_trace.h
> +++ b/drivers/gpu/drm/i915/intel_uncore_trace.h
> @@ -44,6 +44,6 @@ TRACE_EVENT_CONDITION(i915_reg_rw,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/i915
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE intel_uncore_trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index a6749dd6a725..00aa4634f10b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -201,16 +201,16 @@ endif
>  subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
>  	-I$(src)/display/ext \
>  	-I$(src)/compat-i915-headers \
> -	-I$(srctree)/drivers/gpu/drm/i915/display/ \
> +	-I$(src)/../i915/display/ \
>  	-Ddrm_i915_private=xe_device
>  
>  # Rule to build SOC code shared with i915
> -$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
> +$(obj)/i915-soc/%.o: $(src)/../i915/soc/%.c FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  
>  # Rule to build display code shared with i915
> -$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
> +$(obj)/i915-display/%.o: $(src)/../i915/display/%.c FORCE
>  	$(call cmd,force_checksrc)
>  	$(call if_changed_rule,cc_o_c)
>  
> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> index 6d12fcc13f43..f3ef77e2bcda 100644
> --- a/drivers/gpu/drm/xe/xe_trace.h
> +++ b/drivers/gpu/drm/xe/xe_trace.h
> @@ -515,6 +515,6 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE xe_trace
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 86323cf3be2c..8a687dcf09ba 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -258,6 +258,6 @@ DEFINE_EVENT(xe_vm, xe_vm_ops_fail,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE xe_trace_bo
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_trace_guc.h b/drivers/gpu/drm/xe/xe_trace_guc.h
> index 78949db9cfce..aac9eebd4815 100644
> --- a/drivers/gpu/drm/xe/xe_trace_guc.h
> +++ b/drivers/gpu/drm/xe/xe_trace_guc.h
> @@ -154,6 +154,6 @@ TRACE_EVENT(xe_guc_engine_activity,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE xe_trace_guc
>  #include <trace/define_trace.h>
> diff --git a/drivers/gpu/drm/xe/xe_trace_lrc.h b/drivers/gpu/drm/xe/xe_trace_lrc.h
> index d525cbee1e34..ada8f97a99e0 100644
> --- a/drivers/gpu/drm/xe/xe_trace_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_trace_lrc.h
> @@ -47,6 +47,6 @@ TRACE_EVENT(xe_lrc_update_timestamp,
>  /* This part must be outside protection */
>  #undef TRACE_INCLUDE_PATH
>  #undef TRACE_INCLUDE_FILE
> -#define TRACE_INCLUDE_PATH ../../drivers/gpu/drm/xe
> +#define TRACE_INCLUDE_PATH .
>  #define TRACE_INCLUDE_FILE xe_trace_lrc
>  #include <trace/define_trace.h>

-- 
Jani Nikula, Intel
