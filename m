Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52AC4828F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 10:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C005710F3FE;
	Wed,  7 Feb 2024 10:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdKCAqNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B351131E0
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707301276; x=1738837276;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=4JtUwXiTbhNLUdWP6XgfLcvUoDDWRpQm0IrpkjXOT9o=;
 b=TdKCAqNEG/P4f5rYLeJNIQ2zytIdrnJq8tK22T1rq0PEIOONo14XvK0r
 qXFmIGRpa2zc6V9Z8bWnK8gebCkb8Cq7837+1xyh/s65IwZl88WWwllwU
 VIyiLr936gm5qGgANs+gI5BPHkiWwJj8TZYJv7Ddl2NFPsvll87AvmR/P
 r0kYBZa/Lei1FJGDE5L4QmhjaoKCuIic1DektSU4X70fbcnXLKh31YNsg
 3n4XVfeqnNw00H2fDnAu3uMUDxEK0XwCAg/J4l5nbUkXMZIPtA4eBNv7+
 SWS3XKwyRDOgbnf5jrZyOEaUxNDiYex8jxisQrInz8JnU125cfKtMdZc8 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4770122"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4770122"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="6068214"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.50])
 ([10.249.254.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 02:21:13 -0800
Message-ID: <3c73749869887da822c71f604b68c48e2199cc80.camel@linux.intel.com>
Subject: Re: [PATCH 0/2] drm/xe: support VM sharing between apps
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Moti Haimovski <mhaimovski@habana.ai>, intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, matthew.brost@intel.com
Date: Wed, 07 Feb 2024 11:21:10 +0100
In-Reply-To: <20240206141820.264977-1-mhaimovski@habana.ai>
References: <20240206141820.264977-1-mhaimovski@habana.ai>
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

Hi, Moti



On Tue, 2024-02-06 at 16:18 +0200, Moti Haimovski wrote:
> This first patch set introduces support for sharing a VM (or context)
> between
> applications that use different resources on the same Xe device.
>=20
> The first patch adds a refcount to the VM in order support managing
> it by
> multiple users/apps.
>=20
> The second patch exports the VM as a FD in order to allow other apps
> to use it.
>=20
> Follow-up series will include the driver code to provide full
> functionality for
> this feature.
>=20
> Bharat Jauhari (1):
> =C2=A0 drm/xe: support to export VM as fd
>=20
> Moti Haimovski (1):
> =C2=A0 drm/xe: add ref count to xe_file
>=20
> =C2=A0drivers/gpu/drm/xe/xe_device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 52 ++++++++++--
> =C2=A0drivers/gpu/drm/xe/xe_device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 6 ++
> =C2=A0drivers/gpu/drm/xe/xe_device_types.h |=C2=A0=C2=A0 3 +
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 121
> +++++++++++++++++++++++++++
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28=
 +++++++
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 27 ++++++
> =C2=A07 files changed, 232 insertions(+), 7 deletions(-)
>=20

Do we have any user-space drivers or applications available for review
that exercises this? (We must have for the uAPI changes before pushing
to drm-xe-next)

On the refcount to xe_file, I see that as a bit dangerous. If the
xe_file is alive but the file closed, I figure that opens up for hard-
to-track-down problems. Is there a way we could look at refcounting at
a lower level?

/Thomas


