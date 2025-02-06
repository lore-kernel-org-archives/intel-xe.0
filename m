Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C2EC02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 15:06:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD3C10E885;
	Thu,  6 Feb 2025 15:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XiJ2xe1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2108510E885
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 15:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738854415; x=1770390415;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=X0Z4VBd0nHsSB8fWc5lCGoV0MyPyOpK2t1RIp4KkEZw=;
 b=XiJ2xe1msdgqht7VSttfa8UhVlaSa9jLOpBY+yTVymZ+VS2Vxxhcg3kH
 MzRlEQU71ogUWZFtoNsIzl6V/G7lwadg5QmXLkd5tu+BFg389uxuyIAdd
 0IO/KGQn+fXZZgyT1bx6P3gRECcHKaii+MCnEeWKZ/dwTL2q6K95pz51L
 tXz/Q+Rot3tEZTHIh9aarjdKN0wUAiMEU8CNFubFHVqIVh8A+6wt9dXC6
 L4NbPdEjGPVXz85vKLLlnOszDtaoNzQqXXTxnw9jeHX4sebQIJyKoEAmc
 hwU/9jXzGSlBPVQlKKoy0BHdWp7/FL9DiUb8ZL8+eBgqE7MNGnbHPUSxj w==;
X-CSE-ConnectionGUID: WrbACrqURzeAfhcfVGrV6Q==
X-CSE-MsgGUID: c0RZ4D5ISNSvyDqrZvG3SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64812743"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="64812743"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:06:55 -0800
X-CSE-ConnectionGUID: OAmNJHwlQpuqJkx44fqC/A==
X-CSE-MsgGUID: W5weSsR/TC+q+kWTfzRISA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115315830"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.47])
 ([10.245.246.47])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 07:06:53 -0800
Message-ID: <0a1a00602635a93f1f98af0f6bc0a64aaf1b2fd3.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Date: Thu, 06 Feb 2025 16:06:50 +0100
In-Reply-To: <20250205120150.896-1-michal.wajdeczko@intel.com>
References: <20250205120150.896-1-michal.wajdeczko@intel.com>
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

On Wed, 2025-02-05 at 13:01 +0100, Michal Wajdeczko wrote:
> Since commit a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning
> to worker") and commit 78d5d1e20d1d ("drm/xe/relay: Don't use
> GFP_KERNEL for new transactions") we should have no more lockdep
> dependencies on the reclaim path when running in the SRIOV mode
> so we believe that we can now mark SRIOV driver as reclaim safe.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_pm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 35dd1757b40b..12200be7b43d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -91,7 +91,7 @@ static struct lockdep_map
> xe_pm_runtime_nod3cold_map =3D {
> =C2=A0 */
> =C2=A0bool xe_rpm_reclaim_safe(const struct xe_device *xe)
> =C2=A0{
> -	return !xe->d3cold.capable && !xe->info.has_sriov;
> +	return !xe->d3cold.capable;
> =C2=A0}
> =C2=A0
> =C2=A0static void xe_rpm_lockmap_acquire(const struct xe_device *xe)

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

