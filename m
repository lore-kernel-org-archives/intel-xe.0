Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F056C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:17:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E008B10E464;
	Thu,  3 Sep 2026 20:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="P24Y9TS2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D8210E464
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:17:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 849A660219;
 Thu,  3 Sep 2026 20:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138211F00A3D;
 Thu,  3 Sep 2026 20:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788466664;
 bh=Y8jG9qHdTlsuZfK82DM118AhlcDMoJl8Ie8g4T2OP/Q=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=P24Y9TS2oUEOwlQ2PLYewRMHScETtlOZGvSCmNDRoms+jKF9ebWrOD5ksa9TMpkIC
 rmg28v9oLgyAqJp3RUNa4hnCALBsd6pPvZ7Nf2nbSoHXf/qmjBPUo26438Ne2p8nLr
 rSUU851BUxZ/VmAaDqI0G1u91pxnzBa1J5F9z4HilHWQ/nJqQLXMPBCUXvOD7ht4+w
 /nZTBBT69Z9qfKV4cl/qyZomUbeZKDStglPSfMgsnF0T7aqvb8xlLMlaavlZEscQKY
 ArzSvTj109MQFpS3bqetxlVpHQszmcMrLfT0wV9QCiOWmYh3aAKFZd2txhtJFXk4y7
 st0njbsqVvQGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 09/18] drm/xe/vsec: Add DOC text for VSEC
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-29-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-29-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:17:43 +0000
Message-Id: <20260903201744.138211F00A3D@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Incorrect kernel-doc tag for return value in `xe_pmt_telem_read`.
- [Low] The newly added documentation file `xe_vsec.rst` is not included in=
 any Sphinx `toctree`.
--

commit 011373dcf20ed7018b1279370ae8b1af346ffff5
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Add DOC text for VSEC

This commit adds the necessary files and documentation text to use the DOC
system for the VSEC component.

> diff --git a/Documentation/gpu/xe/xe_vsec.rst b/Documentation/gpu/xe/xe_v=
sec.rst
> new file mode 100644
> index 0000000000000..1a87548489ea9
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_vsec.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +=3D=3D=3D=3D=3D
> +VSEC
> +=3D=3D=3D=3D=3D

[Severity: Low]
This isn't a bug, but should this newly added documentation file be included
in a Sphinx toctree, such as the one in Documentation/gpu/xe/index.rst?=20

Without a toctree entry, the document remains orphaned. This triggers a Sph=
inx
build warning stating that the document isn't included in any toctree, and=
=20
makes the text unreachable from the main generated documentation tree.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 468a221378faf..5223bfe50ede6 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
[ ... ]
> @@ -140,6 +151,17 @@ static int xe_guid_decode(u32 guid, int *index, u32 =
*offset)
>  	return 0;
>  }
> =20
> +/**
> + * xe_pmt_telem_read - Given a device and a PMT GUID, read data into a b=
uffer
> + * @dev: valid Xe device
> + * @guid: PMT GUID (from the PMT discovery struct)
> + * @data: buffer to place data in
> + * @user_offset: a user offset relative to the beginning of the data to =
read
> + * @count: bytes to read
> + *
> + * Returns -EINVAL for VF and PMT WATCHER requests
> + *         count   number of bytes read on success
> + */

[Severity: Low]
This isn't a bug, but does this return value description violate the=20
kernel-doc format?=20

The scripts/kernel-doc tool expects return values to be formatted using the=
=20
"Return:" section header. Not formatting this correctly causes the tool to =
fail=20
to parse the return value, which can trigger a warning and render incorrect=
ly=20
in the generated HTML documentation.

>  int xe_pmt_telem_read(struct device *dev, u32 guid, u64 *data, loff_t us=
er_offset,
>  		      u32 count)
>  {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D9
