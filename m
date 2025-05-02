Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248C3C3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 13:42:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D254E10E93D;
	Fri,  2 May 2025 13:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkBBpkOZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADA410E93D
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 13:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746193348; x=1777729348;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Q+hZM7uByt0irl9trRa6ddRYG7VY6aQewidDkCUQaPU=;
 b=VkBBpkOZ5BC17xaewIMv7jVParcCKfrFrNw23L3U9pwhginV5l/VsA5Q
 pK9wA1LQ79cmcMKrdflls+2Dbaocct6Ax32OHL4RS4FrlUW0eUIVksOZ9
 G9eXcBZUcy28VRmZdzSd3/qTE6DiOZo+QPF5JXHH+j4Ue8+/ZeSBSOeF9
 bhb3wq744TosvjOzSZ+U+v37yM6uajuK2kMC5kCWMLTqoQHibpkKLOWe0
 CXOjCRu7hytUhoxCGX0SHb2uH+mQpo1zFh2ix6vJBWGdvv9WPbC6tFzu3
 aD4oZAVnUomZf4ilksoJqSjmNSIcj5yJgC/tuSrRJ+pu2jM3RdNCLBKBA w==;
X-CSE-ConnectionGUID: Wo+IDf/FQR+WrGXUQgGIEw==
X-CSE-MsgGUID: 00WcBUOaQiOTulnr/qb97A==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="51685648"
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="51685648"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:42:28 -0700
X-CSE-ConnectionGUID: tSAxu9RiTzeqKiY+Vk7Uww==
X-CSE-MsgGUID: zSnKMNrfT3aUt11QsI+kUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,256,1739865600"; d="scan'208";a="135162900"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO [10.245.246.151])
 ([10.245.246.151])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 06:42:26 -0700
Message-ID: <62989f8bbb1d8f57fea227f7afdbc753b492dbcf.camel@linux.intel.com>
Subject: Re: [PATCH v6 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
Date: Fri, 02 May 2025 15:42:23 +0200
In-Reply-To: <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
References: <20250430121912.337601-1-himal.prasad.ghimiray@intel.com>
 <20250430121912.337601-20-himal.prasad.ghimiray@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
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

On Wed, 2025-04-30 at 17:49 +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
>=20
> v2: rebase
>=20
> v3:
> =C2=A0=C2=A0 - use xa_for_each() instead of manual loop
> =C2=A0=C2=A0 - check range is valid and in preferred location before addi=
ng to
> =C2=A0=C2=A0=C2=A0=C2=A0 xarray
> =C2=A0=C2=A0 - Fix naming conventions
> =C2=A0=C2=A0 - Fix return condition as -ENODATA instead of -EAGAIN (Matth=
ew
> Brost)
> =C2=A0=C2=A0 - Handle sparsely populated cpu vma range (Matthew Brost)
>=20
> v4:
> =C2=A0=C2=A0 - fix end address to find next cpu vma in case of -ENOENT
>=20
> v5:
> =C2=A0=C2=A0 - Move find next vma logic to drm gpusvm layer
> =C2=A0=C2=A0 - Avoid mixing declaration and logic
>=20
> v6:
> =C2=A0 - Use new function names
> =C2=A0 - Move eviction logic to prefetch_ranges
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray
> <himal.prasad.ghimiray@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pt.c |=C2=A0 58 ++++++++---
> =C2=A0drivers/gpu/drm/xe/xe_vm.c | 197
> +++++++++++++++++++++++++++++++++++--
> =C2=A02 files changed, 234 insertions(+), 21 deletions(-)
>=20

I was thinking a bit around the UAPI, and prefetching foreign device
regions. That doesn't really fit into the current UAPI.

What are your thoughts here. IMO this should align somewhat to what we
do for madvise().

Let's say we want to prefetch into a foreign device memory region
identified by an fd? I figure we could add that later as an extension.=20

But how does the UMD API for this look? Do we cover current usage with
the existing UAPI syntax?

/Thomas

