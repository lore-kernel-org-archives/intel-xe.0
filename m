Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99E4C53219
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 08:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8549310EAF9;
	Wed, 29 Jul 2026 08:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiW50MXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0EE10EAF5
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Jul 2026 08:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785312389; x=1816848389;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Q3C/FHpKQpQZdsKEsVLRkftJAORVGjT9rHUI3u473lo=;
 b=NiW50MXJMPxG9USUxifGKXExwUFIB4zxx5xgSS0MjwSFVnMOrLxHYJxC
 XHhIAwodI7sA+4BvbnV5AMa7fI6Yxc0kVgdekxqaH5PiL2UkGBkVmYtcR
 jOEbAF0ortiCoGuGMLaryRsU2ECpJzFhfQdNegTjc3l3wlmSTCylciJQX
 H8PKT4hwCr6rC4/+icld5F3hvDEz5v7CeFu3AZO9HPO01NBI0hqswPYCA
 3nSZT0QgojmWW/Pyweppr3HAqU4xpJ0E13sk5E0PVPN3t2MSFlsnd4T9n
 AmLcdgoBfFIPTDxWXHyAuf/WqNMMnwCpbi4jztTC4vgl/luxoCt7VUyhn g==;
X-CSE-ConnectionGUID: EmKa9EJySTKhuFBpdJBdiw==
X-CSE-MsgGUID: JB1fObLrRgakxjAP5aGZYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86030573"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="86030573"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:06:29 -0700
X-CSE-ConnectionGUID: 8qtJIOb8TY6Iw8GaPPHPVg==
X-CSE-MsgGUID: 0apPYgqwTE2U5HTwU9K4hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="298163037"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.212])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 01:06:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH v2 08/22] drm/xe/log: Add SIGID log helpers for components
In-Reply-To: <20260728161039.579-9-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728161039.579-1-michal.wajdeczko@intel.com>
 <20260728161039.579-9-michal.wajdeczko@intel.com>
Date: Wed, 29 Jul 2026 11:06:23 +0300
Message-ID: <62dadb83a10fe3c30db950a60e968582ed54a304@intel.com>
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

On Tue, 28 Jul 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> Our component list already defines relation between the component
> name, identified by the TAG, and its numerical identifier and the
> assigned SIGID. We can also already prepare location identifier
> based on the pointer type used to emit the log entry. Add helper
> that will prepare SIGID, COMPONENT and LOCATION parameters for
> xe_log_emit() using provided componentn TAG and the pointer.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: rebased/simplified (Michal)
> ---
>  drivers/gpu/drm/xe/xe_log.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 43deaf93ce3e..b0f50aa35a96 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -85,4 +85,22 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>  	xe_log_from((any), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
>  		    (data), (len), fmt, ##args)
>  
> +/**
> + * xe_log_comp() - Emit a structured SIGID log entry on the component behalf.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @TAG: the component tag to use
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style free text format string (not a stable interface)
> + * @args: arguments for the @fmt format string
> + *
> + * The SIGID will be determined from the component's @TAG.
> + * The component identifier will be determined from the component's @TAG.
> + * The location used to emit SIGID entry will be based on the @any pointer type.
> + */
> +#define xe_log_comp(any, cper_sev, TAG, data, len, fmt, args...) \
> +	xe_log_from((any), (cper_sev), (int)XE_LOG_COMPONENT_##TAG##_SIGID, \
> +		    XE_LOG_COMPONENT_##TAG, (data), (len), fmt, ##args)

I understand you want to use a short TAG at call sites, but the string
concatenation means cscope/global can't find any of them, and you have
to resort to git grep.

BR,
Jani.

> +
>  #endif

-- 
Jani Nikula, Intel
