Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D91C369B4
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 11:16:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108110E733;
	Tue, 15 Apr 2025 11:16:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VfBhEkLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27CC10E733
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 11:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744715797; x=1776251797;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=eFlvmpvGloTjDmnIsXZut2DpE0sVrpVzzdYb6tIiumQ=;
 b=VfBhEkLHGov5u+g6621tfVHVeNMUUbwDOcRE2/BOq0N3ug3fTI8Pxi6o
 rfqIHL6yIUBj1ix37vu3vZ+RoefPWkM4Xmn5MS4p5xzDZiGNOaCU+o9Ph
 ZxJXVHkZ7NL2ceA4AJBpe+UuOUs2k4+v2d1hs6cXxxMOEsUJ3mGia7Ydl
 zSuqP9z52t3FWuu1lF/Itzn4SQSu9jG7RNfniKblqACosPE+3qh5iy5Va
 H1TLqVqO1iV4tOft1J75thkTzNwrkN054QtgbmS6L5cgUN/egHHIEWkig
 R7UPZZvfoWltFVyJBWcm+yNwd6erx0xwWVwTDZKHUXh8MK7wEl7mXwbvK w==;
X-CSE-ConnectionGUID: co52WDbAR6i/D55Qbma7jA==
X-CSE-MsgGUID: MNhYTNKjSQKkgqWSXwRN/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45932369"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45932369"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:16:37 -0700
X-CSE-ConnectionGUID: rdzdb18XTz66XIwXF5mWzw==
X-CSE-MsgGUID: FtaEcSPtT4a9ppC7INe0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130619277"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 04:16:35 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Harry Austen
 <hpausten@protonmail.com>
Cc: intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH] drm/xe: Allow building as kernel built-in
In-Reply-To: <5ztkuw7ip5seoonhtnypq4wkpjnh3okq4fzdnbmmsiadt467fv@ar236dcnik6w>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250412220137.3892-2-hpausten@protonmail.com>
 <5ztkuw7ip5seoonhtnypq4wkpjnh3okq4fzdnbmmsiadt467fv@ar236dcnik6w>
Date: Tue, 15 Apr 2025 14:16:32 +0300
Message-ID: <87cyddr7xr.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 14 Apr 2025, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Sat, Apr 12, 2025 at 10:07:21PM +0000, Harry Austen wrote:
>>Fix Kconfig symbol dependency on KUNIT, which isn't actually required
>>for XE to be built-in. However, if KUNIT is enabled, it must be built-in
>>too.
>>
>>Fixes: 08987a8b6820 ("drm/xe: Fix build with KUNIT=3Dm")
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>>Signed-off-by: Harry Austen <hpausten@protonmail.com>
>>---
>> drivers/gpu/drm/xe/Kconfig | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>index 9bce047901b22..b65bd6b9e65d4 100644
>>--- a/drivers/gpu/drm/xe/Kconfig
>>+++ b/drivers/gpu/drm/xe/Kconfig
>>@@ -1,7 +1,7 @@
>> # SPDX-License-Identifier: GPL-2.0-only
>> config DRM_XE
>> 	tristate "Intel Xe Graphics"
>>-	depends on DRM && PCI && MMU && (m || (y && KUNIT=3Dy))
>>+	depends on DRM && PCI && MMU && (m || (y && KUNIT!=3Dm))
>> 	select INTERVAL_TREE
>> 	# we need shmfs for the swappable backing store, and in particular
>> 	# the shmem_readpage() which depends upon tmpfs
>>@@ -51,7 +51,7 @@ config DRM_XE
>>
>> config DRM_XE_DISPLAY
>> 	bool "Enable display support"
>>-	depends on DRM_XE && DRM_XE=3Dm && HAS_IOPORT
>>+	depends on DRM_XE && HAS_IOPORT
>
> this wouldn't work with i915 also built-in. Does it now?

I don't think so.

BR,
Jani.

--=20
Jani Nikula, Intel
