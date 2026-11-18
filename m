Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED4F60A2608
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 14:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrq7EMuO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42E10E803;
	Wed, 18 Nov 2026 14:17:19 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5150F10E803
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 14:17:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 78E546223B;
 Wed, 18 Nov 2026 14:17:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1473C1F000C5;
 Wed, 18 Nov 2026 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795011432;
 bh=WYVOlG8j2JyBaRe7yhJOwOBGwnDFwkffUCYjSdUToSw=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=lrq7EMuOvrbl1myrQ8v2Q2xkzFuiVDBMrFtLXvS60zRqFRE2/OMRvl3L3wIiydu44
 ULwv7bZeK6evnG19amgePTr4cs0/iV8uuCyxze7GdPU5TRn3+ZOK25pgNPTH4bl53h
 24YXtAbZ/KoM+UehmLRRAinuyxxwKiKKe4dJJQ7XFkXRefDaCC/lv+iWYX8y7/PHPd
 eyUACE7eIbqlkFkjX+OQGYu41qwFPC9P2ltvR0MAJWPjRveRK+hT17HebyfTYBwWBt
 Z60X8j7Yj6vrUS09QfItmUQ3Mge0tVhilV7do4+r/BOghxQ6KIaeQlKCvqMvqpx4YI
 dFp1uJaMdleKQ==
Message-ID: <sashiko-outbox-221179@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] drm/xe: Expose CRI maximum memory frequency and
 bandwidth in sysfs
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261118135536.293953-4-naresh.kumar.g@intel.com>
References: <20261118135536.293953-1-naresh.kumar.g@intel.com>
 <20261118135536.293953-4-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:17:11 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] drm/xe: unintended KernelVersion change for device_uid in sysfs
  ABI doc
--

commit 0b847a1115478ad39cc690b1b4bde83c429e6218
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

drm/xe: Expose CRI maximum memory frequency and bandwidth in sysfs

This commit exposes read-only tile#/memory/max_freq and
tile#/memory/max_bw sysfs attributes reported by PCODE MEMORY_CONFIG on
Crescent Island and documents them in the Xe sysfs ABI.

> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Docume=
ntation/ABI/testing/sysfs-driver-intel-xe-gpu
> index 4dc4afc3961d9..13d471e0ea082 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
> @@ -1,6 +1,6 @@
>  What:		/sys/bus/pci/drivers/xe/.../device_uid
>  Date:		October 2026
> -KernelVersion:	7.4
> +KernelVersion:	7.5
>  Contact:	intel-xe@lists.freedesktop.org

[Severity: Low]
Was the KernelVersion change on the existing device_uid entry (added in
commit "drm/xe/cri: Expose device UID through sysfs") unintended when
updating the version for the new max_bw and max_freq entries?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118135536.2939=
53-1-naresh.kumar.g@intel.com?part=3D3
