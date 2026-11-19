Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F15606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 13:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jzyqTvQ3
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0297F10E882;
	Thu, 19 Nov 2026 13:17:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5510E885
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795094269; x=1826630269;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=hv+iURcgFD+jrHZ1EHailOhj9FbSOzQDpkA2Y7X24t4=;
 b=jzyqTvQ3KS2htLqxH4Yzn0taVD9Ocr6X9PE5BWx/y/EU6MzvwmJTK5co
 VXBZfsnXoFuE+XF8n40gyUY4uGU52h4OU2ahDlBypJ+/x5+qtypwKmpNz
 rcL3pZwvi3theXMw7VdZiAHXDKKIIWB8iL5jxMtt2EfMekSyX6DJCvVGc
 8qhd8jXI0SaT59Zhn+yQMHUIUcbmKqHXeaNW03J98ks2mKFU9wVEM6B9W
 KLRW3pqL4S4fh2e3t2ErahBgEYva7d87ODsZuoG3gst9dVCGKKHkiu031
 jM+9ImZo1qQYx8KDkcfIdmUddTdGWmDNSNsJnK1R9F8MZ8yGvfzLWZQ4y Q==;
X-CSE-ConnectionGUID: YlG/LerbRjGPEyiBqK2FsA==
X-CSE-MsgGUID: AzVCQdlOTb20zwkjlKA9AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3832837"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3832837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:17:49 -0800
X-CSE-ConnectionGUID: no/pkl4XR4ePKEbQVmk8+Q==
X-CSE-MsgGUID: J+0eubFsR+Wa3rJWX96VCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10467550"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.91])
 ([10.245.245.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 05:17:49 -0800
Message-ID: <c7655943615f2018687a987d646e4173c457d7d8.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.BAT: failure for drm/xe: Add a
 per-client debugfs file reporting bo NUMA node distribution (rev5)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 14:17:46 +0100
In-Reply-To: <179502680832.46043.561995994803801529@9ac1b63fe3ea>
References: <20261118134203.646500-1-thomas.hellstrom@linux.intel.com>
 <179502680832.46043.561995994803801529@9ac1b63fe3ea>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, 2026-11-18 at 18:33 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: Add a per-client debugfs file reporting bo NUMA node
> distribution (rev5)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/177016/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-6175-
> e7c60d65b141a5bd0916a4aecf0423496da8455c_BAT -> xe-pw-177016v5_BAT
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-177016v5_BAT absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-177016v5_BAT, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (15 -> 15)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-177016v5_BAT:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@xe_multigpu_svm@mgpu-migration-prefetch:
> =C2=A0=C2=A0=C2=A0 - bat-bmg-3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][1] -> [DMESG-WARN][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-6175-e7c60d65b141a5bd0916a4a=
ecf0423496da8455c/bat-bmg-3/igt@xe_multigpu_svm@mgpu-migration-prefetch.htm=
l
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/bat-bmg-3/igt@xe=
_multigpu_svm@mgpu-migration-prefetch.html
>=20
> =C2=A0=20

Unrelated.

>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * Linux: xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c -> xe-pw=
-
> 177016v5
>=20
> =C2=A0 IGT_9197: 9197
> =C2=A0 xe-6175-e7c60d65b141a5bd0916a4aecf0423496da8455c:
> e7c60d65b141a5bd0916a4aecf0423496da8455c
> =C2=A0 xe-pw-177016v5: 177016v5
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177016v5/index.html
