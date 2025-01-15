Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E500C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 08:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639C710E515;
	Wed, 15 Jan 2025 08:02:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bH/ibzqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73C410E515;
 Wed, 15 Jan 2025 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736928146; x=1768464146;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ypqx4aRCYYx1v+THS6lgZ4bxsIJDhTMYZo28YNo3gPM=;
 b=bH/ibzqQEpPMiJCxx27ftlESB9UpGvjoSbzNg6OS0Rg8GPW5MzDwhvUC
 APAlzfT0K+d2Jp972Qj3VJL400x5ZzMct9YwbLnjJtLxf9LxvRX1k67IZ
 F09SeLCImOUkH6JCF6t6ZuvteiFA6iSK3M+TYyKl1GmkOCrTU6jC7H9lQ
 vRPcZf5FT6dYAQ2fPw58L2btCO99Kt3s0Oorf4nUwLUEZR9WYy+ymHKf4
 Ls3awkFLVF1j2+CtPpbbxRYgd+Y+LQ4vc6dhIhEgFPC3pRpdwQYU9XzXc
 1Y2B8FSz/3g5GrYqSexEK+//2mCDwIs0DReagUO4OdxXaxb1rMrX4Gt5j g==;
X-CSE-ConnectionGUID: uSQ1hLYmTRmkL9Y2RzPPJQ==
X-CSE-MsgGUID: UYf0pyISQ8+doQq7MsRDJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="47835883"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="47835883"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:02:26 -0800
X-CSE-ConnectionGUID: 3mY2nSDtTdqIeS2e+Ada+A==
X-CSE-MsgGUID: PBOoDmCfRUaOhnOb0yz0Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109677856"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.51])
 ([10.245.246.51])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 00:02:24 -0800
Message-ID: <b0a4127bd7403d4dd9390be78f819f524d36b194.camel@linux.intel.com>
Subject: Re: [i-g-t] tests/intel-ci: Fix a syntax err in xe.blocklist.txt
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Oak Zeng <oak.zeng@intel.com>, intel-xe@lists.freedesktop.org, 
 igt-dev@lists.freedesktop.org
Date: Wed, 15 Jan 2025 09:02:20 +0100
In-Reply-To: <20250114173523.3267049-1-oak.zeng@intel.com>
References: <20250114173523.3267049-1-oak.zeng@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
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

On Tue, 2025-01-14 at 12:35 -0500, Oak Zeng wrote:
> The syntax in below lines are wrong:
>=20
> igt@xe_evict@*-multi-vm-cm*
> igt@xe_evict@*-threads-*
>=20
> With above, those xe_evict tests are not blacklisted from xe.ci.full
> category.
>=20
> Fix the issue by adding a dot (.) preceding star (*).
>=20
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0tests/intel-ci/xe.blocklist.txt | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-
> ci/xe.blocklist.txt
> index a9b647c1d..fc270198f 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -93,7 +93,7 @@ igt@sriov_basic@bind-unbind-vf$
> =C2=A0# Exclude xe_evict tests that are not expected to succeed
> =C2=A0# due to missing TTM exhaustive eviction
> =C2=A0##################################################################
> -igt@xe_evict@*-multi-vm-cm*
> -igt@xe_evict@*-threads-*
> -# igt@xe_evict@*-cm* # Rebind and VM_BIND may race.
> +igt@xe_evict@.*-multi-vm-cm.*
> +igt@xe_evict@.*-threads-.*
> +# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
> =C2=A0##################################################################

