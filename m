Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6E1CD5BB1
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 21:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E448310E563;
	Tue, 26 May 2026 21:18:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7xRsnAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E576310E563
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 21:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779830292; x=1811366292;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fK0tYCxMj9ZD8w3DoXicNlns+XiHWxLyt6ZE1GvAJFg=;
 b=I7xRsnABS3c+qjzgJM6f41vxU+QQsf8cAF3Wv8lnubfFb/e0nQa2+Ref
 xDntofVcQaW0rKfWItg+4JoIpf/ZmkUtk3s+dj8Xp3ciyFRQwzS3m9yJc
 7mPsJrIz8CwgHVW3qn5/uUdooeSD7wo5kJWXOYn58yTyKd3lQEF4I1hb8
 dzOo6PUj5NR9sC719NwiIlIxDfXJznT1dv6Pj6qWMUIMdRor2M1mMVJ58
 slriKW7bIO880tRc2JQWvH8gUK2wHmN85mOduqn9lHJOLrXRxDiSUJ9nw
 xEjQjcNW7sLzzJQN/5us0hYrafTLSRyPNQK3+Y0f8u+htOJSaVtntJ/QJ g==;
X-CSE-ConnectionGUID: 2LiwjoEWTyiq3N/UFnBVjQ==
X-CSE-MsgGUID: SKEymAwWRO+Y5TBvx4M/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79689467"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79689467"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:18:11 -0700
X-CSE-ConnectionGUID: S2N7CM24REq9eaZ6RrO+0w==
X-CSE-MsgGUID: RsRfCoBNQMmkMnDXiTMJiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="246294998"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:18:10 -0700
Date: Tue, 26 May 2026 23:18:07 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 1/7] drm/xe: Use raw device ID to find sub-platform
 descriptor
Message-ID: <ahYOD4M54XQH0Lp3@black.igk.intel.com>
References: <20260526195452.20545-1-michal.wajdeczko@intel.com>
 <20260526195452.20545-2-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526195452.20545-2-michal.wajdeczko@intel.com>
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

On Tue, May 26, 2026 at 09:54:46PM +0200, Michal Wajdeczko wrote:
> We don't need the partially initialized xe_device pointer to
> find the sub-platform descriptor, as for the descriptor lookup
> only the device ID is required and it can be obtained directly
> from the pci_dev.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e2a1232c4fbf..59b18a80100b 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -576,14 +576,14 @@ static bool id_blocked(u16 device_id)
>  }
>  
>  static const struct xe_subplatform_desc *
> -find_subplatform(const struct xe_device *xe, const struct xe_device_desc *desc)
> +find_subplatform(const struct xe_device_desc *desc, u16 devid)
>  {
>  	const struct xe_subplatform_desc *sp;
>  	const u16 *id;
>  
>  	for (sp = desc->subplatforms; sp && sp->subplatform; sp++)
>  		for (id = sp->pciidlist; *id; id++)
> -			if (*id == xe->info.devid)
> +			if (*id == devid)
>  				return sp;
>  
>  	return NULL;
> @@ -1065,6 +1065,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	struct xe_device *xe;
>  	int err;
>  
> +	subplatform_desc = find_subplatform(desc, pdev->device);

Nit: Probably not worth looking up the subplatform yet in case we fail
early, but upto you.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>

>  	xe_configfs_check_device(pdev);
>  
>  	if (desc->require_force_probe && !id_forced(pdev->device)) {
> @@ -1099,7 +1101,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>  	pci_set_drvdata(pdev, &xe->drm);
>  
>  	xe_pm_assert_unbounded_bridge(xe);
> -	subplatform_desc = find_subplatform(xe, desc);
>  
>  	pci_set_master(pdev);
>  
> -- 
> 2.47.1
> 
