Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B481FC54E49
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 09:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D28610EFAA;
	Mon, 26 Feb 2024 09:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vuq7Pl5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA810EFAC
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 09:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708938363; x=1740474363;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OAMGngopj0jFC33tUwDSJTzc9vWjGu/15Sf2NCiYzZA=;
 b=Vuq7Pl5ffWHECeqqeYAXbCCbQL+9G/ySEw+uvFFjREjaHofuJXSj1JCJ
 SQvnr5WvKxw/ODEie/USh3JGqcbXwjht3DWusHUVovaQt35Mr9rjsJC4s
 mgmO2lfeTZbWrV7CGLKgzDhn6Dzhv6EaOwmFnTMczvdhn4Mjbo8iH5ywW
 P2oZK5b2Xp6nG/whIgQpz0bRvefsoV7i1GVENx70GRJr6bcZEdeNxSozE
 MFw8WdYkwFKkvSBSiPlj9p65d+qOsq2y3mojhD80pYZahZkq7+Wv6uioA
 1i58B3Sij2cXuZw55Pg1AtmqyvoRJyauECKyeqEmsKJkvouWcL7F7mCHk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="14628243"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; d="scan'208";a="14628243"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:06:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6631998"
Received: from hekner-mobl1.ger.corp.intel.com (HELO [10.249.254.134])
 ([10.249.254.134])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 01:06:00 -0800
Message-ID: <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: kernel test robot <lkp@intel.com>
Date: Mon, 26 Feb 2024 10:05:58 +0100
In-Reply-To: <20240225001448.81513-1-matthew.brost@intel.com>
References: <20240225001448.81513-1-matthew.brost@intel.com>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3 (3.50.3-1.fc39) 
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

On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
> Need to include io-64-nonatomic-lo-hi.h for writeq function.

As I understand it, the choice of header here determines the dword
write order on 32-bit systems that don't have an atomic writeq(),

So is writing the low dword first the correct order in this case?
Perhaps add a motivation in the commit message?

/Thomas


>=20
> Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com=
/
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_ggtt.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> b/drivers/gpu/drm/xe/xe_ggtt.c
> index 5d46958e3144..717d0e76277a 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
> =C2=A0
> =C2=A0#include "xe_ggtt.h"
> =C2=A0
> +#include <linux/io-64-nonatomic-lo-hi.h>
> =C2=A0#include <linux/sizes.h>
> =C2=A0
> =C2=A0#include <drm/drm_managed.h>

