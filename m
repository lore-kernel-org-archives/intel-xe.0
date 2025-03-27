Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921BEC3600B
	for <intel-xe@archiver.kernel.org>; Thu, 27 Mar 2025 10:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC4A10E2C2;
	Thu, 27 Mar 2025 10:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhUR1dnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053A510E2C2
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Mar 2025 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743071932; x=1774607932;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=3cchGJLuIAY3+SDCrgS5GcM8XdZr9+P4exUG653R0l0=;
 b=ZhUR1dnBp/VNpZbQ0UivXS9sSRwDSoDcaLpM7DDUH4tMPdw5vvelqyd4
 9oxHD0ZSFQ2LmulUaNChyKtLPVmUXowxdefe5lgBwqbIXGmYnm8QyhUES
 JdIpkUByQVk8cDqv4yni6CnC85zXFxFV6nFt/ow/m8EK9GNN6RnF/Gy9N
 4McrnirFcigPpZxcWed2ZnlAsB/dXg8AOm7XYlZ/AVfC/gudA9Rfghr/B
 AiH8c5VCGcKUxynEEbGpTudM0q381xOxf1bfshYoqYbWfTVD5G2nZ5z+M
 MB92YbCqMotxnF2flr6WdArzybE2xsf3nSiGlRcwTRHWUD1vJe17VpHYZ A==;
X-CSE-ConnectionGUID: ktyLy9EWSr2SKthiygEX8g==
X-CSE-MsgGUID: sOKzXPLVSo2zOaiIuZsXew==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44519657"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="44519657"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:38:35 -0700
X-CSE-ConnectionGUID: TFClKgztSnywFAE7yQF4Dg==
X-CSE-MsgGUID: YH3VE7GwTWev3LhDnoXuCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130194319"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.246.40])
 ([10.245.246.40])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:38:34 -0700
Message-ID: <490eeda2502174eb3ec1666769c04328d861ee7e.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Xe.CI.Full: failure for drm/xe: xe-only
 patches from the multi-device GPUSVM series (rev6)
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 27 Mar 2025 11:38:22 +0100
In-Reply-To: <174306849199.10489.15925522959679318289@e6b6f09ec485>
References: <20250326080551.40201-1-thomas.hellstrom@linux.intel.com>
 <174306849199.10489.15925522959679318289@e6b6f09ec485>
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

On Thu, 2025-03-27 at 09:41 +0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
>=20
> Series: drm/xe: xe-only patches from the multi-device GPUSVM series
> (rev6)
> URL=C2=A0=C2=A0 : https://patchwork.freedesktop.org/series/146383/
> State : failure
>=20
> =3D=3D Summary =3D=3D
>=20
> CI Bug Log - changes from xe-2854-
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8_FULL -> xe-pw-146383v6_FULL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>=20
> Summary
> -------
>=20
> =C2=A0 **FAILURE**
>=20
> =C2=A0 Serious unknown changes coming with xe-pw-146383v6_FULL absolutely
> need to be
> =C2=A0 verified manually.
> =C2=A0=20
> =C2=A0 If you think the reported changes have nothing to do with the
> changes
> =C2=A0 introduced in xe-pw-146383v6_FULL, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> =C2=A0 to document this new failure mode, which will reduce false
> positives in CI.
>=20
> =C2=A0=20
>=20
> Participating hosts (4 -> 4)
> ------------------------------
>=20
> =C2=A0 No changes in participating hosts
>=20
> Possible new issues
> -------------------
>=20
> =C2=A0 Here are the unknown changes that may have been introduced in xe-
> pw-146383v6_FULL:
>=20
> ### IGT changes ###
>=20
> #### Possible regressions ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][1] ->=
 [INCOMPLETE][2]
> =C2=A0=C2=A0 [1]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@kms_async_flips@alternate-sync-async-fl=
ip.html
> =C2=A0=C2=A0 [2]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_async_flips@alternate-sync-async-flip.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [I=
NCOMPLETE][3]
> =C2=A0=C2=A0 [3]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-4.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][4] +4 other tests skip
> =C2=A0=C2=A0 [4]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_plane_multiple@2x-tiling-none.html
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][5] +4 other tests skip
> =C2=A0=C2=A0 [5]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_plane_multiple@2x-tiling-yf.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][6] +2 other tests skip
> =C2=A0=C2=A0 [6]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_plane_multiple@2x-tiling-yf.html
>=20
> =C2=A0=20

These failures are not related.
/Thomas


> New tests
> ---------
>=20
> =C2=A0 New tests have been introduced between xe-2854-
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8_FULL and xe-pw-
> 146383v6_FULL:
>=20
> ### New IGT tests (96) ###
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.80] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-a-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.83] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.79] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-b-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.62] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.80] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-2-pipe-d-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.79] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-3-pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.73] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-c-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-a-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-b-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-2-pipe-c-hdmi-a-3:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.79] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-b-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.72] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-3-pipe-c-dp-2:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.70] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-4@pipe-d-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-b-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.82] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-c-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-dp-4-pipe-d-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-b-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-c-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-a-hdmi-a-6-pipe-d-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-a-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-c-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-dp-4-pipe-d-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-a-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-c-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-b-hdmi-a-6-pipe-d-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-a-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-b-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-dp-4-pipe-d-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-a-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.73] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-b-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-c-hdmi-a-6-pipe-d-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-a-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.75] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-b-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-dp-4-pipe-c-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-a-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-b-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-none@pipe-d-hdmi-a-6-pipe-c-dp-
> 4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.82] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.71] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-a-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.77] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.64] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.74] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-b-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.78] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-dp-4-pipe-d-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.67] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.76] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.69] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-c-hdmi-a-6-pipe-d-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.68] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-a-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.73] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-b-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-dp-4-pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-b-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.65] s
>=20
> =C2=A0 * igt@kms_plane_multiple@2x-tiling-x@pipe-d-hdmi-a-6-pipe-c-dp-4:
> =C2=A0=C2=A0=C2=A0 - Statuses : 1 pass(s)
> =C2=A0=C2=A0=C2=A0 - Exec time: [0.66] s
>=20
> =C2=A0=20
>=20
> Known issues
> ------------
>=20
> =C2=A0 Here are the changes found in xe-pw-146383v6_FULL that come from
> known issues:
>=20
> ### IGT changes ###
>=20
> #### Issues hit ####
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][7] -> [FAIL][8] ([Intel XE#3701] /
> [Intel XE#3718] / [Intel XE#827])
> =C2=A0=C2=A0 [7]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip=
-atomic.html
> =C2=A0=C2=A0 [8]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_async_flips@alternate-sync-async-flip-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2=
:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][9] -> [FAIL][10] ([Intel XE#3701] /
> [Intel XE#827])
> =C2=A0=C2=A0 [9]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip=
-atomic@pipe-c-dp-2.html
> =C2=A0=C2=A0 [10]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-dp-2.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-suspend-resume:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][11] -> [DMESG-WARN][12] ([Intel
> XE#4543]) +4 other tests dmesg-warn
> =C2=A0=C2=A0 [11]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resum=
e.html
> =C2=A0=C2=A0 [12]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-9/igt=
@kms_async_flips@async-flip-suspend-resume.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][13] ([Intel XE#3719] /
> [Intel XE#911]) +3 other tests fail
> =C2=A0=C2=A0 [13]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_async_flips@async-flip-with-page-flip-events-atomic.html
>=20
> =C2=A0 * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-
> 1-linear:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][14] -> [FAIL][15] ([Intel XE#911])
> +3 other tests fail
> =C2=A0=C2=A0 [14]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip=
-events@pipe-a-edp-1-linear.html
> =C2=A0=C2=A0 [15]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>=20
> =C2=A0 * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][16] ([Intel XE#1124]) +3
> other tests skip
> =C2=A0=C2=A0 [16]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_big_fb@4-tiled-16bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][17] ([Intel XE#2327]) +6
> other tests skip
> =C2=A0=C2=A0 [17]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_big_fb@x-tiled-32bpp-rotate-90.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][18] ([Intel XE#316])
> =C2=A0=C2=A0 [18]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_big_fb@x-tiled-32bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][19] ([Intel XE#1407])
> =C2=A0=C2=A0 [19]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-6/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html
>=20
> =C2=A0 * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][20] ([Intel XE#316]) +1
> other test skip
> =C2=A0=C2=A0 [20]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_big_fb@y-tiled-64bpp-rotate-270.html
>=20
> =C2=A0 *
> igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][21] ([Intel XE#1124]) +3
> other tests skip
> =C2=A0=C2=A0 [21]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][22] ([Intel XE#1124]) +11
> other tests skip
> =C2=A0=C2=A0 [22]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
>=20
> =C2=A0 * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][23] ([Intel XE#1124]) +1
> other test skip
> =C2=A0=C2=A0 [23]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-3/igt@=
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][24] -> [SKIP][25] ([Intel XE#2314] /
> [Intel XE#2894]) +2 other tests skip
> =C2=A0=C2=A0 [24]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays=
-1920x1080p.html
> =C2=A0=C2=A0 [25]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][26] -=
> [SKIP][27] ([Intel XE#2191])
> =C2=A0=C2=A0 [26]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displa=
ys-2160x1440p.html
> =C2=A0=C2=A0 [27]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][28] ([Intel XE#2314] /
> [Intel XE#2894]) +1 other test skip
> =C2=A0=C2=A0 [28]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][29] ([Intel XE#367])
> =C2=A0=C2=A0 [29]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_bw@linear-tiling-1-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][30] ([Intel XE#367])
> =C2=A0=C2=A0 [30]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-466/ig=
t@kms_bw@linear-tiling-3-displays-2160x1440p.html
>=20
> =C2=A0 * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][31] ([Intel XE#367]) +2
> other tests skip
> =C2=A0=C2=A0 [31]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
kms_bw@linear-tiling-4-displays-1920x1080p.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][32] ([Intel XE#787]) +191
> other tests skip
> =C2=A0=C2=A0 [32]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][33] ([Intel XE#455] /
> [Intel XE#787]) +5 other tests skip
> =C2=A0=C2=A0 [33]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-9/igt=
@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-1.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][34] ([Intel XE#2887]) +1
> other test skip
> =C2=A0=C2=A0 [34]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-3/igt@=
kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
>=20
> =C2=A0 *
> igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-
> hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][35] ([Intel XE#787]) +8
> other tests skip
> =C2=A0=C2=A0 [35]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.h=
tml
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][36] ([Intel XE#2652] /
> [Intel XE#787]) +4 other tests skip
> =C2=A0=C2=A0 [36]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][37] ([Intel XE#3432]) +2
> other tests skip
> =C2=A0=C2=A0 [37]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][38] ([Intel XE#2887]) +14
> other tests skip
> =C2=A0=C2=A0 [38]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-
> 6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][39] -=
> [INCOMPLETE][40] ([Intel
> XE#2705] / [Intel XE#4522])
> =C2=A0=C2=A0 [39]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [40]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][41] ([Intel XE#455] /
> [Intel XE#787]) +38 other tests skip
> =C2=A0=C2=A0 [41]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-0-75:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][42] ([Intel XE#306])
> =C2=A0=C2=A0 [42]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_chamelium_color@ctm-0-75.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-max:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][43] ([Intel XE#306])
> =C2=A0=C2=A0 [43]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-6/igt@=
kms_chamelium_color@ctm-max.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][44] ([Intel XE#306])
> =C2=A0=C2=A0 [44]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_chamelium_color@ctm-max.html
>=20
> =C2=A0 * igt@kms_chamelium_color@ctm-red-to-blue:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][45] ([Intel XE#2325]) +1
> other test skip
> =C2=A0=C2=A0 [45]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_chamelium_color@ctm-red-to-blue.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][46] ([Intel XE#373]) +7
> other tests skip
> =C2=A0=C2=A0 [46]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_chamelium_edid@dp-edid-change-during-suspend.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][47] ([Intel XE#2252]) +8
> other tests skip
> =C2=A0=C2=A0 [47]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
>=20
> =C2=A0 * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][48] ([Intel XE#373])
> =C2=A0=C2=A0 [48]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
>=20
> =C2=A0 * igt@kms_chamelium_frames@hdmi-aspect-ratio:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][49] ([Intel XE#373]) +2
> other tests skip
> =C2=A0=C2=A0 [49]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_chamelium_frames@hdmi-aspect-ratio.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][50] ([Intel XE#3278])
> =C2=A0=C2=A0 [50]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_content_protection@atomic.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][51] ([Intel XE#1178])
> =C2=A0=C2=A0 [51]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_content_protection@lic-type-0@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-1:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][52] ([Intel XE#455]) +7
> other tests skip
> =C2=A0=C2=A0 [52]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_content_protection@lic-type-1.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][53] ([Intel XE#2341])
> =C2=A0=C2=A0 [53]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_content_protection@lic-type-1.html
>=20
> =C2=A0 * igt@kms_content_protection@srm:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][54] ([Intel XE#1178]) +1
> other test fail
> =C2=A0=C2=A0 [54]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_content_protection@srm.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent@pipe-a-dp-2:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][55] ([Intel XE#1188])
> =C2=A0=C2=A0 [55]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_content_protection@uevent@pipe-a-dp-2.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent@pipe-a-dp-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][56] ([Intel XE#1188])
> =C2=A0=C2=A0 [56]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_content_protection@uevent@pipe-a-dp-4.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-256x85:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][57] ([Intel XE#2320]) +1
> other test skip
> =C2=A0=C2=A0 [57]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_cursor_crc@cursor-offscreen-256x85.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-random-512x170:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][58] ([Intel XE#2321]) +3
> other tests skip
> =C2=A0=C2=A0 [58]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_cursor_crc@cursor-random-512x170.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-32x32:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][59] ([Intel XE#1424]) +1
> other test skip
> =C2=A0=C2=A0 [59]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_cursor_crc@cursor-sliding-32x32.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-sliding-512x512:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][60] ([Intel XE#308])
> =C2=A0=C2=A0 [60]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_cursor_crc@cursor-sliding-512x512.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][61] -> [SKIP][62] ([Intel XE#2291])
> +5 other tests skip
> =C2=A0=C2=A0 [61]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legac=
y.html
> =C2=A0=C2=A0 [62]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][63] -=
> [SKIP][64] ([Intel XE#309])
> +3 other tests skip
> =C2=A0=C2=A0 [63]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modese=
t-vs-cursor-atomic.html
> =C2=A0=C2=A0 [64]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][65] ([Intel XE#2291])
> =C2=A0=C2=A0 [65]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][66] ([Intel XE#309]) +2
> other tests skip
> =C2=A0=C2=A0 [66]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][67] ([Intel XE#309])
> =C2=A0=C2=A0 [67]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-3/igt@=
kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
>=20
> =C2=A0 *
> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][68] ([Intel XE#323])
> =C2=A0=C2=A0 [68]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][69] ([Intel XE#323])
> =C2=A0=C2=A0 [69]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
>=20
> =C2=A0 * igt@kms_cursor_legacy@single-bo:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][70] ([Intel
> XE#3226]) +1 other test incomplete
> =C2=A0=C2=A0 [70]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_cursor_legacy@single-bo.html
>=20
> =C2=A0 * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][71] ([Intel XE#1508])
> =C2=A0=C2=A0 [71]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_dirtyfb@drrs-dirtyfb-ioctl.html
>=20
> =C2=A0 * igt@kms_dp_link_training@uhbr-mst:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][72] ([Intel XE#4354])
> =C2=A0=C2=A0 [72]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_dp_link_training@uhbr-mst.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][73] ([Intel XE#2244])
> =C2=A0=C2=A0 [73]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_dsc@dsc-basic.html
>=20
> =C2=A0 * igt@kms_dsc@dsc-fractional-bpp:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][74] ([Intel XE#2244])
> =C2=A0=C2=A0 [74]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_dsc@dsc-fractional-bpp.html
>=20
> =C2=A0 * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][75] ([Intel XE#4422])
> =C2=A0=C2=A0 [75]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
>=20
> =C2=A0 * igt@kms_feature_discovery@display-2x:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][76] ([Intel XE#702])
> =C2=A0=C2=A0 [76]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][77] ([Intel XE#702])
> =C2=A0=C2=A0 [77]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-4/igt=
@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][78] -> [SKIP][79] ([Intel XE#2373])
> =C2=A0=C2=A0 [78]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_feature_discovery@display-2x.html
> =C2=A0=C2=A0 [79]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_feature_discovery@display-2x.html
>=20
> =C2=A0 * igt@kms_feature_discovery@psr1:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][80] ([Intel XE#2374])
> =C2=A0=C2=A0 [80]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_feature_discovery@psr1.html
>=20
> =C2=A0 * igt@kms_flip@2x-busy-flip:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][81] ([Intel XE#1421])
> =C2=A0=C2=A0 [81]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_flip@2x-busy-flip.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][82] -> [FAIL][83] ([Intel XE#3321])
> +2 other tests fail
> =C2=A0=C2=A0 [82]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [83]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][84] -=
> [FAIL][85] ([Intel XE#301])
> +7 other tests fail
> =C2=A0=C2=A0 [84]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-h=
dmi-a6-dp4.html
> =C2=A0=C2=A0 [85]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][86] ([Intel XE#310]) +1
> other test skip
> =C2=A0=C2=A0 [86]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_flip@2x-flip-vs-panning.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-panning-vs-hang:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][87] ([Intel XE#2316]) +2
> other tests skip
> =C2=A0=C2=A0 [87]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-panning-vs-hang.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][88] -> [SKIP][89] ([Intel XE#2316])
> +4 other tests skip
> =C2=A0=C2=A0 [88]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interrupt=
ible.html
> =C2=A0=C2=A0 [89]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_flip@2x-plain-flip-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][90] -=
> [SKIP][91] ([Intel XE#310])
> +1 other test skip
> =C2=A0=C2=A0 [90]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interrup=
tible.html
> =C2=A0=C2=A0 [91]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_flip@2x-wf_vblank-ts-check-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][92] -> [FAIL][93] ([Intel XE#2882])
> +1 other test fail
> =C2=A0=C2=A0 [92]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check-interrupti=
ble@ab-dp2-hdmi-a3.html
> =C2=A0=C2=A0 [93]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_flip@2x-wf_vblank-ts-check-interruptible@ab-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][94] ([Intel XE#3321]) +2
> other tests fail
> =C2=A0=C2=A0 [94]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_flip@flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][95] ([Intel XE#301]) +3
> other tests fail
> =C2=A0=C2=A0 [95]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][96] -> [FAIL][97] ([Intel XE#301])
> +1 other test fail
> =C2=A0=C2=A0 [96]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.ht=
ml
> =C2=A0=C2=A0 [97]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_flip@flip-vs-expired-vblank@a-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][98] -> [FAIL][99] ([Intel XE#301] /
> [Intel XE#3149]) +1 other test fail
> =C2=A0=C2=A0 [98]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.ht=
ml
> =C2=A0=C2=A0 [99]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_flip@flip-vs-expired-vblank@c-edp1.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-suspend-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][100] =
-> [INCOMPLETE][101] ([Intel
> XE#2049] / [Intel XE#2597]) +1 other test incomplete
> =C2=A0=C2=A0 [100]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.=
html
> =C2=A0=C2=A0 [101]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_flip@flip-vs-suspend-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@wf_vblank-ts-check:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][102] -> [FAIL][103] ([Intel XE#3149]
> / [Intel XE#886])
> =C2=A0=C2=A0 [102]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check.html
> =C2=A0=C2=A0 [103]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-2/igt@=
kms_flip@wf_vblank-ts-check.html
>=20
> =C2=A0 * igt@kms_flip@wf_vblank-ts-check@a-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][104] -> [FAIL][105] ([Intel XE#886])
> +2 other tests fail
> =C2=A0=C2=A0 [104]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-1/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
> =C2=A0=C2=A0 [105]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-2/igt@=
kms_flip@wf_vblank-ts-check@a-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][106] ([Intel XE#455]) +13
> other tests skip
> =C2=A0=C2=A0 [106]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-9/igt=
@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][107] ([Intel XE#1401] /
> [Intel XE#1745]) +1 other test skip
> =C2=A0=C2=A0 [107]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling
> @pipe-a-default-mode:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][108] ([Intel XE#1401]) +1
> other test skip
> =C2=A0=C2=A0 [108]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling@pipe-a-d=
efault-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][109] ([Intel XE#2293]) +5
> other tests skip
> =C2=A0=C2=A0 [109]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-vali=
d-mode.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][110] ([Intel XE#2293] /
> [Intel XE#2380]) +5 other tests skip
> =C2=A0=C2=A0 [110]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][111] ([Intel XE#651]) +1
> other test skip
> =C2=A0=C2=A0 [111]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][112] ([Intel XE#2311]) +26
> other tests skip
> =C2=A0=C2=A0 [112]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][113] ([Intel XE#656]) +13
> other tests skip
> =C2=A0=C2=A0 [113]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@drrs-slowdraw:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][114] ([Intel XE#651]) +12
> other tests skip
> =C2=A0=C2=A0 [114]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-slowdraw.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][115] -> [DMESG-FAIL][116] ([Intel
> XE#4543]) +9 other tests dmesg-fail
> =C2=A0=C2=A0 [115]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren=
-pri-shrfb-draw-blt.html
> =C2=A0=C2=A0 [116]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][117] ([Intel XE#4141]) +15
> other tests skip
> =C2=A0=C2=A0 [117]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [DMESG-FAIL][118] ([Intel
> XE#4543]) +1 other test dmesg-fail
> =C2=A0=C2=A0 [118]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][119] =
-> [SKIP][120] ([Intel XE#656])
> +6 other tests skip
> =C2=A0=C2=A0 [119]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscr=
n-pri-indfb-draw-blt.html
> =C2=A0=C2=A0 [120]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][121] ([Intel XE#2312]) +7
> other tests skip
> =C2=A0=C2=A0 [121]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][122] ([Intel XE#656]) +3
> other tests skip
> =C2=A0=C2=A0 [122]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][123] ([Intel XE#651]) +5
> other tests skip
> =C2=A0=C2=A0 [123]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-9/igt=
@kms_frontbuffer_tracking@fbcdrrs-suspend.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][124] ([Intel XE#656]) +10
> other tests skip
> =C2=A0=C2=A0 [124]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-6/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][125] ([Intel XE#2352])
> =C2=A0=C2=A0 [125]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][126] ([Intel XE#653]) +1
> other test skip
> =C2=A0=C2=A0 [126]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][127] ([Intel XE#653]) +9
> other tests skip
> =C2=A0=C2=A0 [127]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][128] ([Intel XE#2313]) +20
> other tests skip
> =C2=A0=C2=A0 [128]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 * igt@kms_hdmi_inject@inject-audio:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][129] ([Intel XE#1470] /
> [Intel XE#2853])
> =C2=A0=C2=A0 [129]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_hdmi_inject@inject-audio.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][130] ([Intel XE#3374] /
> [Intel XE#3544])
> =C2=A0=C2=A0 [130]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_hdr@invalid-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][131] =
-> [SKIP][132] ([Intel XE#455])
> =C2=A0=C2=A0 [131]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [132]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][133] -> [SKIP][134] ([Intel
> XE#1503])
> =C2=A0=C2=A0 [133]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> =C2=A0=C2=A0 [134]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_hdr@invalid-hdr.html
>=20
> =C2=A0 * igt@kms_joiner@basic-max-non-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][135] ([Intel XE#4298])
> =C2=A0=C2=A0 [135]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
kms_joiner@basic-max-non-joiner.html
>=20
> =C2=A0 * igt@kms_joiner@invalid-modeset-force-big-joiner:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][136] ([Intel XE#3012]) +1
> other test skip
> =C2=A0=C2=A0 [136]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_joiner@invalid-modeset-force-big-joiner.html
>=20
> =C2=A0 * igt@kms_panel_fitting@legacy:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][137] ([Intel XE#2486])
> =C2=A0=C2=A0 [137]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_panel_fitting@legacy.html
>=20
> =C2=A0 * igt@kms_plane@plane-panning-bottom-right-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][138] -> [DMESG-WARN][139] ([Intel
> XE#2932]) +1 other test dmesg-warn
> =C2=A0=C2=A0 [138]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-susp=
end.html
> =C2=A0=C2=A0 [139]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_plane@plane-panning-bottom-right-suspend.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-yf:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][140] ([Intel XE#2393]) +1
> other test skip
> =C2=A0=C2=A0 [140]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_plane_lowres@tiling-yf.html
>=20
> =C2=A0 * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25=
:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][141] ([Intel XE#2763] /
> [Intel XE#455]) +3 other tests skip
> =C2=A0=C2=A0 [141]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe
> -b:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][142] ([Intel XE#2763]) +5
> other tests skip
> =C2=A0=C2=A0 [142]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
>=20
> =C2=A0 *
> igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe
> -a:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][143] ([Intel XE#2763]) +19
> other tests skip
> =C2=A0=C2=A0 [143]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
>=20
> =C2=A0 * igt@kms_pm_backlight@fade-with-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][144] ([Intel XE#870])
> =C2=A0=C2=A0 [144]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_pm_backlight@fade-with-suspend.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc5-psr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][145] ([Intel XE#2392]) +1
> other test skip
> =C2=A0=C2=A0 [145]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_pm_dc@dc5-psr.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][146] ([Intel XE#1129])
> =C2=A0=C2=A0 [146]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-466/ig=
t@kms_pm_dc@dc5-psr.html
>=20
> =C2=A0 * igt@kms_pm_rpm@basic-pci-d3-state:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][147] -> [DMESG-WARN][148] ([Intel
> XE#4173]) +2 other tests dmesg-warn
> =C2=A0=C2=A0 [147]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@kms_pm_rpm@basic-pci-d3-state.html
> =C2=A0=C2=A0 [148]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@kms_pm_rpm@basic-pci-d3-state.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][149] ([Intel XE#1439] /
> [Intel XE#3141] / [Intel XE#836])
> =C2=A0=C2=A0 [149]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_pm_rpm@modeset-lpsp.html
>=20
> =C2=A0 * igt@kms_pm_rpm@modeset-non-lpsp:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][150] =
-> [SKIP][151] ([Intel XE#836])
> =C2=A0=C2=A0 [150]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html
> =C2=A0=C2=A0 [151]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_pm_rpm@modeset-non-lpsp.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][152] ([Intel XE#1489]) +2
> other tests skip
> =C2=A0=C2=A0 [152]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
>=20
> =C2=A0 * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][153] ([Intel XE#1489]) +1
> other test skip
> =C2=A0=C2=A0 [153]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-4/igt=
@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
>=20
> =C2=A0 *
> igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-
> b-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [FAIL][154] ([Intel XE#4570]) +3
> other tests fail
> =C2=A0=C2=A0 [154]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-5/igt@=
kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.ht=
ml
>=20
> =C2=A0 * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][155] ([Intel XE#1489]) +7
> other tests skip
> =C2=A0=C2=A0 [155]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
>=20
> =C2=A0 * igt@kms_psr2_su@page_flip-xrgb8888:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][156] ([Intel XE#2387])
> =C2=A0=C2=A0 [156]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_psr2_su@page_flip-xrgb8888.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][157] ([Intel XE#1122]) +1
> other test skip
> =C2=A0=C2=A0 [157]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_psr2_su@page_flip-xrgb8888.html
>=20
> =C2=A0 * igt@kms_psr@fbc-pr-primary-render:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][158] ([Intel XE#1406])
> =C2=A0=C2=A0 [158]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_psr@fbc-pr-primary-render.html
>=20
> =C2=A0 * igt@kms_psr@fbc-psr-sprite-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][159] ([Intel XE#2850] /
> [Intel XE#929]) +5 other tests skip
> =C2=A0=C2=A0 [159]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_psr@fbc-psr-sprite-render.html
>=20
> =C2=A0 * igt@kms_psr@pr-suspend:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][160] ([Intel XE#2850] /
> [Intel XE#929]) +4 other tests skip
> =C2=A0=C2=A0 [160]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_psr@pr-suspend.html
>=20
> =C2=A0 * igt@kms_psr@psr-basic:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][161] ([Intel XE#2234] /
> [Intel XE#2850]) +16 other tests skip
> =C2=A0=C2=A0 [161]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_psr@psr-basic.html
>=20
> =C2=A0 * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][162] ([Intel XE#2939])
> =C2=A0=C2=A0 [162]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>=20
> =C2=A0 * igt@kms_rotation_crc@bad-pixel-format:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][163] ([Intel XE#3414]) +1
> other test skip
> =C2=A0=C2=A0 [163]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_rotation_crc@bad-pixel-format.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][164] ([Intel XE#3414] /
> [Intel XE#3904]) +1 other test skip
> =C2=A0=C2=A0 [164]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_rotation_crc@bad-pixel-format.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][165] ([Intel XE#2330])
> =C2=A0=C2=A0 [165]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][166] ([Intel XE#3414])
> =C2=A0=C2=A0 [166]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
>=20
> =C2=A0 * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][167] ([Intel XE#3414] /
> [Intel XE#3904]) +1 other test skip
> =C2=A0=C2=A0 [167]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>=20
> =C2=A0 * igt@kms_setmode@basic-clone-single-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][168] ([Intel XE#1435]) +1
> other test skip
> =C2=A0=C2=A0 [168]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
kms_setmode@basic-clone-single-crtc.html
>=20
> =C2=A0 * igt@kms_setmode@clone-exclusive-crtc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][169] -> [SKIP][170] ([Intel
> XE#1435])
> =C2=A0=C2=A0 [169]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
> =C2=A0=C2=A0 [170]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_setmode@clone-exclusive-crtc.html
>=20
> =C2=A0 * igt@kms_vrr@flipline:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][171] ([Intel XE#1499])
> =C2=A0=C2=A0 [171]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_vrr@flipline.html
>=20
> =C2=A0 * igt@kms_vrr@seamless-rr-switch-drrs:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][172] ([Intel XE#1499])
> =C2=A0=C2=A0 [172]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
kms_vrr@seamless-rr-switch-drrs.html
>=20
> =C2=A0 * igt@kms_writeback@writeback-check-output:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][173] ([Intel XE#756])
> =C2=A0=C2=A0 [173]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_writeback@writeback-check-output.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-copy-linear-0xfd:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][174] ([Intel XE#1123])
> =C2=A0=C2=A0 [174]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@xe_copy_basic@mem-copy-linear-0xfd.html
>=20
> =C2=A0 * igt@xe_copy_basic@mem-set-linear-0x3fff:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][175] ([Intel XE#1126])
> =C2=A0=C2=A0 [175]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@xe_copy_basic@mem-set-linear-0x3fff.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-read-event:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][176] ([Intel XE#2905]) +3
> other tests skip
> =C2=A0=C2=A0 [176]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@xe_eudebug@basic-read-event.html
>=20
> =C2=A0 * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][177] ([Intel XE#2905] /
> [Intel XE#3889])
> =C2=A0=C2=A0 [177]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
xe_eudebug@basic-vm-bind-ufence-sigint-client.html
>=20
> =C2=A0 * igt@xe_eudebug@discovery-empty:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][178] ([Intel XE#2905]) +10
> other tests skip
> =C2=A0=C2=A0 [178]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
xe_eudebug@discovery-empty.html
>=20
> =C2=A0 * igt@xe_eudebug_online@single-step-one:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][179] ([Intel XE#2905])
> =C2=A0=C2=A0 [179]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@xe_eudebug_online@single-step-one.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][180] ([Intel XE#2905])
> =C2=A0=C2=A0 [180]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-8/igt@=
xe_eudebug_online@single-step-one.html
>=20
> =C2=A0 * igt@xe_evict@evict-large-multi-vm:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][181] ([Intel XE#261] /
> [Intel XE#688]) +1 other test skip
> =C2=A0=C2=A0 [181]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-4/igt=
@xe_evict@evict-large-multi-vm.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][182] ([Intel XE#688])
> =C2=A0=C2=A0 [182]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-6/igt@=
xe_evict@evict-large-multi-vm.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][183] ([Intel XE#2322]) +11
> other tests skip
> =C2=A0=C2=A0 [183]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][184] ([Intel XE#1392]) +2
> other tests skip
> =C2=A0=C2=A0 [184]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [PASS][185] =
-> [SKIP][186] ([Intel
> XE#1392]) +6 other tests skip
> =C2=A0=C2=A0 [185]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-def=
er-bind.html
> =C2=A0=C2=A0 [186]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
>=20
> =C2=A0 *
> igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race
> :
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][187] ([Intel XE#1392]) +1
> other test skip
> =C2=A0=C2=A0 [187]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-2/igt@=
xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [INCOMPLETE][188] ([Intel
> XE#2594])
> =C2=A0=C2=A0 [188]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
xe_exec_fault_mode.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][189] ([Intel XE#288]) +11
> other tests skip
> =C2=A0=C2=A0 [189]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@xe_exec_fault_mode@once-bindexecqueue-rebind.html
>=20
> =C2=A0 * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][190] ([Intel XE#288]) +7
> other tests skip
> =C2=A0=C2=A0 [190]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html
>=20
> =C2=A0 * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][191] ([Intel XE#2360])
> =C2=A0=C2=A0 [191]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
>=20
> =C2=A0 * igt@xe_media_fill@media-fill:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][192] ([Intel XE#560])
> =C2=A0=C2=A0 [192]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-1/igt@=
xe_media_fill@media-fill.html
>=20
> =C2=A0 * igt@xe_oa@invalid-create-userspace-config:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][193] ([Intel XE#2541] /
> [Intel XE#3573]) +2 other tests skip
> =C2=A0=C2=A0 [193]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@xe_oa@invalid-create-userspace-config.html
>=20
> =C2=A0 * igt@xe_oa@invalid-oa-metric-set-id:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][194] ([Intel XE#2541] /
> [Intel XE#3573]) +2 other tests skip
> =C2=A0=C2=A0 [194]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@xe_oa@invalid-oa-metric-set-id.html
>=20
> =C2=A0 * igt@xe_oa@oa-tlb-invalidate:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][195] ([Intel XE#2248])
> =C2=A0=C2=A0 [195]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
xe_oa@oa-tlb-invalidate.html
>=20
> =C2=A0 * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [F=
AIL][196] ([Intel XE#1173])
> =C2=A0=C2=A0 [196]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-433/ig=
t@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html
>=20
> =C2=A0 * igt@xe_peer2peer@write:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][197] ([Intel XE#2427])
> =C2=A0=C2=A0 [197]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
xe_peer2peer@write.html
>=20
> =C2=A0 * igt@xe_pm@d3cold-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][198] ([Intel XE#2284]) +1
> other test skip
> =C2=A0=C2=A0 [198]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
xe_pm@d3cold-mocs.html
>=20
> =C2=A0 * igt@xe_pm@d3hot-mmap-vram:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][199] ([Intel XE#1948])
> =C2=A0=C2=A0 [199]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@xe_pm@d3hot-mmap-vram.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][200] ([Intel XE#1948])
> =C2=A0=C2=A0 [200]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
xe_pm@d3hot-mmap-vram.html
>=20
> =C2=A0 * igt@xe_pm@s2idle-vm-bind-unbind-all:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][201] -> [DMESG-WARN][202] ([Intel
> XE#2953] / [Intel XE#4173])
> =C2=A0=C2=A0 [201]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
> =C2=A0=C2=A0 [202]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@xe_pm@s2idle-vm-bind-unbind-all.html
>=20
> =C2=A0 * igt@xe_pm@s4-basic:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [PASS][203] -> [ABORT][204] ([Intel
> XE#1794])
> =C2=A0=C2=A0 [203]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-6/igt@xe_pm@s4-basic.html
> =C2=A0=C2=A0 [204]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-2/igt@=
xe_pm@s4-basic.html
>=20
> =C2=A0 * igt@xe_pm@s4-mocs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [PASS][205] -> [ABORT][206] ([Intel
> XE#1794])
> =C2=A0=C2=A0 [205]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@xe_pm@s4-mocs.html
> =C2=A0=C2=A0 [206]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-9/igt=
@xe_pm@s4-mocs.html
>=20
> =C2=A0 * igt@xe_pm@vram-d3cold-threshold:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][207] ([Intel XE#579])
> =C2=A0=C2=A0 [207]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-1/igt@=
xe_pm@vram-d3cold-threshold.html
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][208] ([Intel XE#579])
> =C2=A0=C2=A0 [208]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@xe_pm@vram-d3cold-threshold.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-config:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 NOTRUN -> [SKIP][209] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [209]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@xe_query@multigpu-query-config.html
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][210] ([Intel XE#944])
> =C2=A0=C2=A0 [210]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-1/igt@=
xe_query@multigpu-query-config.html
>=20
> =C2=A0 * igt@xe_query@multigpu-query-mem-usage:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][211] ([Intel XE#944]) +2
> other tests skip
> =C2=A0=C2=A0 [211]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
xe_query@multigpu-query-mem-usage.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][212] ([Intel XE#944])
> =C2=A0=C2=A0 [212]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@xe_query@multigpu-query-mem-usage.html
>=20
> =C2=A0 *
> igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][213] ([Intel XE#4130])
> =C2=A0=C2=A0 [213]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
>=20
> =C2=A0 * igt@xe_sriov_flr@flr-vfs-parallel:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 NOTRUN -> [SKIP][214] ([Intel XE#4273]) +1
> other test skip
> =C2=A0=C2=A0 [214]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-7/igt@=
xe_sriov_flr@flr-vfs-parallel.html
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 NOTRUN -> [S=
KIP][215] ([Intel XE#4273]) +1
> other test skip
> =C2=A0=C2=A0 [215]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@xe_sriov_flr@flr-vfs-parallel.html
>=20
> =C2=A0=20
> #### Possible fixes ####
>=20
> =C2=A0 * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][216] ([Intel XE#4543]) ->
> [PASS][217] +7 other tests pass
> =C2=A0=C2=A0 [216]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> =C2=A0=C2=A0 [217]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-4/igt=
@kms_big_fb@x-tiled-8bpp-rotate-0.html
>=20
> =C2=A0 * igt@kms_cursor_crc@cursor-offscreen-128x42:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][218] ([Intel XE#4173]) ->
> [PASS][219] +11 other tests pass
> =C2=A0=C2=A0 [218]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.h=
tml
> =C2=A0=C2=A0 [219]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-1/igt=
@kms_cursor_crc@cursor-offscreen-128x42.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][220] ([Intel XE#2316]) ->
> [PASS][221] +3 other tests pass
> =C2=A0=C2=A0 [220]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-i=
nterruptible.html
> =C2=A0=C2=A0 [221]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][222] ([Intel XE#3321]) ->
> [PASS][223]
> =C2=A0=C2=A0 [222]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2=
-hdmi-a3.html
> =C2=A0=C2=A0 [223]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][224] =
([Intel XE#310]) -> [PASS][225]
> +3 other tests pass
> =C2=A0=C2=A0 [224]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_flip@2x-plain-flip-fb-recreate.html
> =C2=A0=C2=A0 [225]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_flip@2x-plain-flip-fb-recreate.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][226] =
([Intel XE#2882]) ->
> [PASS][227]
> =C2=A0=C2=A0 [226]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-434/igt@kms_flip@2x-plain-flip-fb-recreate-inte=
rruptible.html
> =C2=A0=C2=A0 [227]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[228] ([Intel XE#2049]) ->
> [PASS][229] +1 other test pass
> =C2=A0=C2=A0 [228]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_flip@flip-vs-blocking-wf-vblank@a-d=
p4.html
> =C2=A0=C2=A0 [229]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-466/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-dp4.html
>=20
> =C2=A0 * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][230] ([Intel XE#886]) -> [PASS][231]
> +1 other test pass
> =C2=A0=C2=A0 [230]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-8/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp=
1.html
> =C2=A0=C2=A0 [231]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
>=20
> =C2=A0 *
> igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@p
> ipe-a-valid-mode:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-FAIL][232] ([Intel XE#324] / [Intel
> XE#4543]) -> [PASS][233] +1 other test pass
> =C2=A0=C2=A0 [232]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-=
32bpp-xtile-downscaling@pipe-a-valid-mode.html
> =C2=A0=C2=A0 [233]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-val=
id-mode.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][234] =
([Intel XE#656]) -> [PASS][235]
> +7 other tests pass
> =C2=A0=C2=A0 [234]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscr=
n-shrfb-plflip-blt.html
> =C2=A0=C2=A0 [235]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-plflip-blt.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][236] ([Intel XE#1471]) ->
> [PASS][237] +1 other test pass
> =C2=A0=C2=A0 [236]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-1/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-1=
-size-64.html
> =C2=A0=C2=A0 [237]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_plane_cursor@overlay@pipe-a-hdmi-a-1-size-64.html
>=20
> =C2=A0 * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][238] =
([Intel XE#616]) -> [PASS][239]
> +1 other test pass
> =C2=A0=C2=A0 [238]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-=
6-size-64.html
> =C2=A0=C2=A0 [239]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-463/ig=
t@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
>=20
> =C2=A0 * igt@kms_plane_lowres@tiling-4:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[240] -> [PASS][241]
> =C2=A0=C2=A0 [240]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-435/igt@kms_plane_lowres@tiling-4.html
> =C2=A0=C2=A0 [241]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_plane_lowres@tiling-4.html
>=20
> =C2=A0 * igt@kms_plane_scaling@2x-scaler-multi-pipe:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][242] =
([Intel XE#309]) -> [PASS][243]
> +1 other test pass
> =C2=A0=C2=A0 [242]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_plane_scaling@2x-scaler-multi-pipe.=
html
> =C2=A0=C2=A0 [243]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html
>=20
> =C2=A0 * igt@kms_setmode@invalid-clone-single-crtc-stealing:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][244] =
([Intel XE#455]) -> [PASS][245]
> +1 other test pass
> =C2=A0=C2=A0 [244]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_setmode@invalid-clone-single-crtc-s=
tealing.html
> =C2=A0=C2=A0 [245]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_setmode@invalid-clone-single-crtc-stealing.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][246] ([Intel XE#771] / [Intel
> XE#899]) -> [PASS][247]
> =C2=A0=C2=A0 [246]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
> =C2=A0=C2=A0 [247]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_universal_plane@cursor-fb-leak.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][248] ([Intel XE#899]) -> [PASS][249]
> =C2=A0=C2=A0 [248]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-c=
-edp-1.html
> =C2=A0=C2=A0 [249]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-4/igt@=
kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
>=20
> =C2=A0 * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [FAIL][250] ([Intel XE#899]) -> [PASS][251]
> =C2=A0=C2=A0 [250]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-=
c-hdmi-a-1.html
> =C2=A0=C2=A0 [251]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
>=20
> =C2=A0 * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][252] =
([Intel XE#1392]) ->
> [PASS][253] +5 other tests pass
> =C2=A0=C2=A0 [252]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexec=
queue-userptr-rebind.html
> =C2=A0=C2=A0 [253]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-433/ig=
t@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
>=20
> =C2=A0 * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [ABORT][254] -> [PASS][255]
> =C2=A0=C2=A0 [254]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_i=
octl_ops_create.html
> =C2=A0=C2=A0 [255]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
>=20
> =C2=A0 * igt@xe_module_load@many-reload:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [DMESG-WARN][256] ([Intel XE#2953] / [Intel
> XE#4173]) -> [PASS][257]
> =C2=A0=C2=A0 [256]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-8/igt@xe_module_load@many-reload.html
> =C2=A0=C2=A0 [257]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-6/igt=
@xe_module_load@many-reload.html
>=20
> =C2=A0 * igt@xe_oa@buffer-size:
> =C2=A0=C2=A0=C2=A0 - shard-lnl:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][258] ([Intel XE#4541]) ->
> [PASS][259]
> =C2=A0=C2=A0 [258]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-lnl-5/igt@xe_oa@buffer-size.html
> =C2=A0=C2=A0 [259]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-lnl-7/igt@=
xe_oa@buffer-size.html
>=20
> =C2=A0 * igt@xe_pm@s4-multiple-execs:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [ABORT][260] ([Intel XE#1794]) ->
> [PASS][261] +1 other test pass
> =C2=A0=C2=A0 [260]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> =C2=A0=C2=A0 [261]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-2/igt=
@xe_pm@s4-multiple-execs.html
>=20
> =C2=A0 * igt@xe_wedged@wedged-mode-toggle:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [ABORT][262]=
 ([Intel XE#3075] / [Intel
> XE#3084] / [Intel XE#4582]) -> [PASS][263]
> =C2=A0=C2=A0 [262]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-466/igt@xe_wedged@wedged-mode-toggle.html
> =C2=A0=C2=A0 [263]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@xe_wedged@wedged-mode-toggle.html
>=20
> =C2=A0=20
> #### Warnings ####
>=20
> =C2=A0 * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-
> hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][264] =
([Intel XE#787]) -> [SKIP][265]
> ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
> =C2=A0=C2=A0 [264]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen1=
2-rc-ccs-cc@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [265]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[266] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][267]
> ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel
> XE#4522])
> =C2=A0=C2=A0 [266]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs.html
> =C2=A0=C2=A0 [267]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[268] ([Intel XE#2705]) ->
> [INCOMPLETE][269] ([Intel XE#2705] / [Intel XE#4522])
> =C2=A0=C2=A0 [268]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html
> =C2=A0=C2=A0 [269]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [INCOMPLETE]=
[270] ([Intel XE#1727] / [Intel
> XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][271] ([Intel XE#1727] /
> [Intel XE#3113] / [Intel XE#4522])
> =C2=A0=C2=A0 [270]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs@pipe-c-hdmi-a-6.html
> =C2=A0=C2=A0 [271]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-
> a-6:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][272] =
([Intel XE#455] / [Intel
> XE#787]) -> [SKIP][273] ([Intel XE#787]) +6 other tests skip
> =C2=A0=C2=A0 [272]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-r=
c-ccs-cc@pipe-d-hdmi-a-6.html
> =C2=A0=C2=A0 [273]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-433/ig=
t@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
>=20
> =C2=A0 * igt@kms_cdclk@mode-transition-all-outputs:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][274] =
([Intel XE#4440]) ->
> [SKIP][275] ([Intel XE#4418])
> =C2=A0=C2=A0 [274]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.h=
tml
> =C2=A0=C2=A0 [275]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-434/ig=
t@kms_cdclk@mode-transition-all-outputs.html
>=20
> =C2=A0 * igt@kms_content_protection@atomic:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [FAIL][276] =
([Intel XE#1178]) ->
> [SKIP][277] ([Intel XE#455])
> =C2=A0=C2=A0 [276]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-463/igt@kms_content_protection@atomic.html
> =C2=A0=C2=A0 [277]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_content_protection@atomic.html
>=20
> =C2=A0 * igt@kms_content_protection@lic-type-0:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][278] ([Intel XE#1178]) ->
> [SKIP][279] ([Intel XE#2341])
> =C2=A0=C2=A0 [278]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_content_protection@lic-type-0.html
> =C2=A0=C2=A0 [279]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_content_protection@lic-type-0.html
>=20
> =C2=A0 * igt@kms_content_protection@uevent:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][280] =
([Intel XE#455]) -> [FAIL][281]
> ([Intel XE#1188])
> =C2=A0=C2=A0 [280]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [281]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_content_protection@uevent.html
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][282] ([Intel XE#2341]) ->
> [FAIL][283] ([Intel XE#1188])
> =C2=A0=C2=A0 [282]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_content_protection@uevent.html
> =C2=A0=C2=A0 [283]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_content_protection@uevent.html
>=20
> =C2=A0 * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][284] ([Intel XE#3321]) ->
> [SKIP][285] ([Intel XE#2316])
> =C2=A0=C2=A0 [284]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interr=
uptible.html
> =C2=A0=C2=A0 [285]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-4/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>=20
> =C2=A0 * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [FAIL][286] ([Intel XE#2882]) ->
> [SKIP][287] ([Intel XE#2316])
> =C2=A0=C2=A0 [286]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate-interr=
uptible.html
> =C2=A0=C2=A0 [287]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_flip@2x-plain-flip-fb-recreate-interruptible.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][288] =
([Intel XE#651]) -> [SKIP][289]
> ([Intel XE#656]) +3 other tests skip
> =C2=A0=C2=A0 [288]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [289]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][290] =
([Intel XE#656]) -> [SKIP][291]
> ([Intel XE#651]) +13 other tests skip
> =C2=A0=C2=A0 [290]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndsc=
rn-spr-indfb-fullscreen.html
> =C2=A0=C2=A0 [291]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-432/ig=
t@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][292] ([Intel XE#4141]) ->
> [SKIP][293] ([Intel XE#2312]) +6 other tests skip
> =C2=A0=C2=A0 [292]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [293]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][294] ([Intel XE#2312]) ->
> [SKIP][295] ([Intel XE#4141]) +6 other tests skip
> =C2=A0=C2=A0 [294]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-=
spr-indfb-draw-blt.html
> =C2=A0=C2=A0 [295]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-8/igt@=
kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html
>=20
> =C2=A0 * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][296] ([Intel XE#2312]) ->
> [SKIP][297] ([Intel XE#2311]) +9 other tests skip
> =C2=A0=C2=A0 [296]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-prims=
crn-cur-indfb-move.html
> =C2=A0=C2=A0 [297]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-2/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-move.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc
> :
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][298] ([Intel XE#2311]) ->
> [SKIP][299] ([Intel XE#2312]) +15 other tests skip
> =C2=A0=C2=A0 [298]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnds=
crn-cur-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [299]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][300] ([Intel XE#2312]) ->
> [SKIP][301] ([Intel XE#2313]) +12 other tests skip
> =C2=A0=C2=A0 [300]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-blt.html
> =C2=A0=C2=A0 [301]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-3/igt@=
kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][302] =
([Intel XE#656]) -> [SKIP][303]
> ([Intel XE#653]) +7 other tests skip
> =C2=A0=C2=A0 [302]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-pri-indfb-draw-blt.html
> =C2=A0=C2=A0 [303]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-435/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render
> :
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][304] =
([Intel XE#653]) -> [SKIP][305]
> ([Intel XE#656]) +3 other tests skip
> =C2=A0=C2=A0 [304]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scnd=
scrn-pri-shrfb-draw-render.html
> =C2=A0=C2=A0 [305]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-464/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-shrfb-draw-render.html
>=20
> =C2=A0 *
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][306] ([Intel XE#2313]) ->
> [SKIP][307] ([Intel XE#2312]) +12 other tests skip
> =C2=A0=C2=A0 [306]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-=
pri-indfb-draw-mmap-wc.html
> =C2=A0=C2=A0 [307]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-6/igt@=
kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>=20
> =C2=A0 * igt@kms_hdr@brightness-with-hdr:
> =C2=A0=C2=A0=C2=A0 - shard-bmg:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 [SKIP][308] ([Intel XE#3374] / [Intel
> XE#3544]) -> [SKIP][309] ([Intel XE#3544])
> =C2=A0=C2=A0 [308]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> =C2=A0=C2=A0 [309]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-bmg-1/igt@=
kms_hdr@brightness-with-hdr.html
>=20
> =C2=A0 * igt@kms_pm_dc@dc9-dpms:
> =C2=A0=C2=A0=C2=A0 - shard-adlp:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 [SKIP][310] ([Intel XE#734]) -> [FAIL][311]
> ([Intel XE#3325])
> =C2=A0=C2=A0 [310]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-adlp-6/igt@kms_pm_dc@dc9-dpms.html
> =C2=A0=C2=A0 [311]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-adlp-8/igt=
@kms_pm_dc@dc9-dpms.html
>=20
> =C2=A0 * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][312] =
([Intel XE#362]) -> [SKIP][313]
> ([Intel XE#1500])
> =C2=A0=C2=A0 [312]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-wi=
th-chamelium.html
> =C2=A0=C2=A0 [313]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-436/ig=
t@kms_tiled_display@basic-test-pattern-with-chamelium.html
>=20
> =C2=A0 * igt@xe_peer2peer@read:
> =C2=A0=C2=A0=C2=A0 - shard-dg2-set2:=C2=A0=C2=A0=C2=A0=C2=A0 [SKIP][314] =
([Intel XE#1061]) ->
> [FAIL][315] ([Intel XE#1173])
> =C2=A0=C2=A0 [314]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-2854-14c330bc015ded4a1f1dd1f=
5aeb8617077aaa7e8/shard-dg2-432/igt@xe_peer2peer@read.html
> =C2=A0=C2=A0 [315]:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/shard-dg2-433/ig=
t@xe_peer2peer@read.html
>=20
> =C2=A0=20
> =C2=A0 [Intel XE#1061]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
> =C2=A0 [Intel XE#1122]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> =C2=A0 [Intel XE#1123]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> =C2=A0 [Intel XE#1124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> =C2=A0 [Intel XE#1126]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> =C2=A0 [Intel XE#1129]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> =C2=A0 [Intel XE#1173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
> =C2=A0 [Intel XE#1178]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> =C2=A0 [Intel XE#1188]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> =C2=A0 [Intel XE#1392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> =C2=A0 [Intel XE#1401]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> =C2=A0 [Intel XE#1406]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> =C2=A0 [Intel XE#1407]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> =C2=A0 [Intel XE#1421]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> =C2=A0 [Intel XE#1424]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> =C2=A0 [Intel XE#1435]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
> =C2=A0 [Intel XE#1439]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> =C2=A0 [Intel XE#1470]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
> =C2=A0 [Intel XE#1471]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471
> =C2=A0 [Intel XE#1489]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> =C2=A0 [Intel XE#1499]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
> =C2=A0 [Intel XE#1500]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
> =C2=A0 [Intel XE#1503]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> =C2=A0 [Intel XE#1508]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
> =C2=A0 [Intel XE#1727]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> =C2=A0 [Intel XE#1745]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> =C2=A0 [Intel XE#1794]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> =C2=A0 [Intel XE#1948]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
> =C2=A0 [Intel XE#2049]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> =C2=A0 [Intel XE#2191]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> =C2=A0 [Intel XE#2234]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> =C2=A0 [Intel XE#2244]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
> =C2=A0 [Intel XE#2248]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
> =C2=A0 [Intel XE#2252]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> =C2=A0 [Intel XE#2284]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> =C2=A0 [Intel XE#2291]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
> =C2=A0 [Intel XE#2293]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> =C2=A0 [Intel XE#2311]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> =C2=A0 [Intel XE#2312]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
> =C2=A0 [Intel XE#2313]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> =C2=A0 [Intel XE#2314]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
> =C2=A0 [Intel XE#2316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
> =C2=A0 [Intel XE#2320]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> =C2=A0 [Intel XE#2321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
> =C2=A0 [Intel XE#2322]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> =C2=A0 [Intel XE#2325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
> =C2=A0 [Intel XE#2327]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> =C2=A0 [Intel XE#2330]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
> =C2=A0 [Intel XE#2341]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
> =C2=A0 [Intel XE#2352]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
> =C2=A0 [Intel XE#2360]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
> =C2=A0 [Intel XE#2373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
> =C2=A0 [Intel XE#2374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
> =C2=A0 [Intel XE#2380]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> =C2=A0 [Intel XE#2387]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
> =C2=A0 [Intel XE#2392]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
> =C2=A0 [Intel XE#2393]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
> =C2=A0 [Intel XE#2427]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
> =C2=A0 [Intel XE#2486]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
> =C2=A0 [Intel XE#2541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> =C2=A0 [Intel XE#2594]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
> =C2=A0 [Intel XE#2597]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> =C2=A0 [Intel XE#261]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> =C2=A0 [Intel XE#2652]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
> =C2=A0 [Intel XE#2705]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
> =C2=A0 [Intel XE#2763]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> =C2=A0 [Intel XE#2850]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> =C2=A0 [Intel XE#2853]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
> =C2=A0 [Intel XE#288]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> =C2=A0 [Intel XE#2882]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> =C2=A0 [Intel XE#2887]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> =C2=A0 [Intel XE#2894]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
> =C2=A0 [Intel XE#2905]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> =C2=A0 [Intel XE#2932]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
> =C2=A0 [Intel XE#2939]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> =C2=A0 [Intel XE#2953]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> =C2=A0 [Intel XE#301]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> =C2=A0 [Intel XE#3012]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> =C2=A0 [Intel XE#306]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> =C2=A0 [Intel XE#3075]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
> =C2=A0 [Intel XE#308]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> =C2=A0 [Intel XE#3084]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
> =C2=A0 [Intel XE#309]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> =C2=A0 [Intel XE#310]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
> =C2=A0 [Intel XE#3113]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> =C2=A0 [Intel XE#3124]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> =C2=A0 [Intel XE#3141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> =C2=A0 [Intel XE#3149]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
> =C2=A0 [Intel XE#316]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> =C2=A0 [Intel XE#3226]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
> =C2=A0 [Intel XE#323]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> =C2=A0 [Intel XE#324]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
> =C2=A0 [Intel XE#3278]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
> =C2=A0 [Intel XE#3321]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
> =C2=A0 [Intel XE#3325]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
> =C2=A0 [Intel XE#3374]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
> =C2=A0 [Intel XE#3414]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> =C2=A0 [Intel XE#3432]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
> =C2=A0 [Intel XE#3544]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
> =C2=A0 [Intel XE#3573]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
> =C2=A0 [Intel XE#362]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> =C2=A0 [Intel XE#367]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> =C2=A0 [Intel XE#3701]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
> =C2=A0 [Intel XE#3718]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
> =C2=A0 [Intel XE#3719]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3719
> =C2=A0 [Intel XE#373]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> =C2=A0 [Intel XE#3889]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
> =C2=A0 [Intel XE#3904]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
> =C2=A0 [Intel XE#4130]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
> =C2=A0 [Intel XE#4141]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
> =C2=A0 [Intel XE#4173]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
> =C2=A0 [Intel XE#4273]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
> =C2=A0 [Intel XE#4298]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
> =C2=A0 [Intel XE#4345]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
> =C2=A0 [Intel XE#4354]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
> =C2=A0 [Intel XE#4418]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
> =C2=A0 [Intel XE#4422]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
> =C2=A0 [Intel XE#4440]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4440
> =C2=A0 [Intel XE#4522]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
> =C2=A0 [Intel XE#4541]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4541
> =C2=A0 [Intel XE#4543]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> =C2=A0 [Intel XE#455]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> =C2=A0 [Intel XE#4570]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4570
> =C2=A0 [Intel XE#4582]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4582
> =C2=A0 [Intel XE#560]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
> =C2=A0 [Intel XE#579]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
> =C2=A0 [Intel XE#616]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> =C2=A0 [Intel XE#651]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> =C2=A0 [Intel XE#653]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> =C2=A0 [Intel XE#656]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> =C2=A0 [Intel XE#688]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> =C2=A0 [Intel XE#702]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
> =C2=A0 [Intel XE#734]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
> =C2=A0 [Intel XE#756]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> =C2=A0 [Intel XE#771]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
> =C2=A0 [Intel XE#787]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> =C2=A0 [Intel XE#827]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
> =C2=A0 [Intel XE#836]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> =C2=A0 [Intel XE#870]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> =C2=A0 [Intel XE#886]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> =C2=A0 [Intel XE#899]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
> =C2=A0 [Intel XE#911]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> =C2=A0 [Intel XE#929]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> =C2=A0 [Intel XE#944]:
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>=20
>=20
> Build changes
> -------------
>=20
> =C2=A0 * IGT: IGT_8284 -> IGT_8285
> =C2=A0 * Linux: xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8 -> xe-pw=
-
> 146383v6
>=20
> =C2=A0 IGT_8284: 8284
> =C2=A0 IGT_8285: 8285
> =C2=A0 xe-2854-14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8:
> 14c330bc015ded4a1f1dd1f5aeb8617077aaa7e8
> =C2=A0 xe-pw-146383v6: 146383v6
>=20
> =3D=3D Logs =3D=3D
>=20
> For more details see:
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146383v6/index.html

