Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56894C531F8
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 16:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E35010E5C2;
	Thu, 23 Jul 2026 16:08:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m0kNVgWg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA60D10E5C2
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 16:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784822913; x=1816358913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bOQiQ5RwuaLKxlp24sAo6bgJxTVgptfet8xaY1Fkeic=;
 b=m0kNVgWgxDvzGrd5BoeizK2YOoU1MZvnvVpLeX2xUXNirxKFY1A7jHku
 14gkwQD49l8GEVAV/acjxnE51rnurn+R4Vuit6DjEUfig10fsfwDc1rwU
 /RJb7ZXVJVbo5/8GYwELctsLmWYZD8+4gvWgDjFNJZNLiOwWWvyXS8gwj
 CjQb5HPld3D9xzJs3FxfIZZSO8aclgeD7GcW87n21JdGLdQFHv9Huo3C9
 BDz9rh/eFxfwC2cXOe6t5xsx3+crvoWaAlwHE3Df5Yumg2ojLT0Cn4MqM
 Khbk8PHh45cWkyP92zpTLatUv0o1JyEqN+P7xft1UoP/Ifq1m58ClaQIm g==;
X-CSE-ConnectionGUID: bHRB+0XKQgilfr7P6PqDHA==
X-CSE-MsgGUID: ujAmDWtFQTi+f3J1kEBmKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96072515"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96072515"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:08:33 -0700
X-CSE-ConnectionGUID: L3qmbqH6TO+rtvKBRKTbkg==
X-CSE-MsgGUID: MdJkQRK2RAmBB9Z/o34qyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="296661878"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 09:08:32 -0700
Date: Thu, 23 Jul 2026 18:08:29 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: rodrigo.vivi@intel.com, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v6 2/2] drm/xe/xe_ras: Report correctable/uncorrectable
 error events to userspace
Message-ID: <amI8fbYTBETJpPM7@black.igk.intel.com>
References: <20260722094134.3036087-4-riana.tauro@intel.com>
 <20260722094134.3036087-6-riana.tauro@intel.com>
 <amDglMC44EIWChvp@black.igk.intel.com>
 <94fa85ed-5e7a-4347-9411-5a0f7209aaad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94fa85ed-5e7a-4347-9411-5a0f7209aaad@intel.com>
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

On Thu, Jul 23, 2026 at 08:33:35PM +0530, Tauro, Riana wrote:
> 
> Sashiko: [Severity: High]
> Does this code introduce a regression where an unexpected firmware response
> can
> cause an out-of-bounds memory access here?
> 
> Response: firmware level check is resolved by below commit. Should resolve
> on final rebase.
> https://lore.kernel.org/intel-xe/20260722143142.675658-1-raag.jadav@intel.com/
> <https://lore.kernel.org/intel-xe/23532ff4-498b-4d43-ae79-a1c4326491c5@intel.com/>

Yes, we shouldn't be at this point without valid severity or component,
but for safety we can atleast have xe_assert() against DRM_XE_RAS_ERR_*_MAX
in xe_drm_ras_event() so we catch them in CI if things break.

Raag
