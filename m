Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C6ECD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 08:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3669310ED5B;
	Wed, 13 May 2026 08:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MNINa9Zy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1A310ED5B
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 08:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778662605; x=1810198605;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2SojVKatFjU64zgg82ZCQ+UE1H/roBJItK3q4i1oAwU=;
 b=MNINa9Zyb2b7bsPStE2wmDoyvkf0VItJ4rkPK0TxJPQJB0TyjqQ4uKHv
 +NFHUHVazBRByUAoD5QqjNehi2wlxFfjKPaGzyrsIlkQAnOZHYkakdtum
 yJkpe4JAZOf7sHo7QGPlfn+byrUayoIti1i6UF/mtHfJQ98PHYCIJGgam
 zz9WljH/gQozoGcIJxWJgJjPJk1bYXUHSiGMPQ0NnppTWjIgDYiG4yFrc
 mo4jYvdh5josUYFOIoG6MA6CkQKSSPNk6oMhOCpeq/ywZuVhNeEa48GAG
 45jGhXeSvd9+1Kpz9Z71M9wrTqad4/MILy0IpDuS84ghqe/ZYa0sM/lo0 A==;
X-CSE-ConnectionGUID: kmf5qDCbRT61eQE+1jqhDw==
X-CSE-MsgGUID: 5i0VZ1dSRQKKDVtdhka57A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79296777"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79296777"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:56:44 -0700
X-CSE-ConnectionGUID: s87VAnuRS7y+RNKxcC8fVA==
X-CSE-MsgGUID: El794/81Q9qGib81lb6HmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="231639281"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 01:56:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/7] drm/xe/display: Drop xe_display_driver_remove() stub
In-Reply-To: <20260512183342.3374-3-michal.wajdeczko@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
 <20260512183342.3374-3-michal.wajdeczko@intel.com>
Date: Wed, 13 May 2026 11:56:38 +0300
Message-ID: <41f435fd1aa7c1522d32b431d85ad94b6cb0d72a@intel.com>
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

On Tue, 12 May 2026, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> The function was removed by commit d41d048043c4 ("drm/xe/display:
> Drop xe_display_driver_remove()") but we missed to remove its stub.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_display.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/display/xe_display.h b/drivers/gpu/drm/xe/display/xe_display.h
> index 76db95c25f7e..fb1db84db966 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.h
> +++ b/drivers/gpu/drm/xe/display/xe_display.h
> @@ -42,7 +42,6 @@ void xe_display_pm_runtime_resume(struct xe_device *xe);
>  
>  static inline int xe_display_driver_probe_defer(struct pci_dev *pdev) { return 0; }
>  static inline void xe_display_driver_set_hooks(struct drm_driver *driver) { }
> -static inline void xe_display_driver_remove(struct xe_device *xe) {}
>  
>  static inline int xe_display_probe(struct xe_device *xe) { return 0; }

-- 
Jani Nikula, Intel
