Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC0FC9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 16:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0B610E18B;
	Thu, 24 Sep 2026 16:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FoxW9pBe";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68F710E18B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 16:38:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id F21D3601E4;
 Thu, 24 Sep 2026 16:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499941F000FF;
 Thu, 24 Sep 2026 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790267893;
 bh=Qk0YUqpY7jMzq883A6bxQZmXyF0o8ltW+Gu9+k2z1kA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FoxW9pBelCxhBVceRK3Y7omN3PeUwUZxldt6cY2drsTTIs2cpkKLb5FP/ecD5/3z7
 O9xCvNmTh0AEsOzzHNL+ZOaQTFoBDW4WAqb+yVvxp1CJYpz9P3XWB8A4z3EHtp4iOK
 LobhjP10soBgWp2CKgbjRZ734VDETrOt7P1PB2uhRqNJ3KPxqTVI+WwkUl1MoIvZt9
 HPjK5F9HPWPatJ8JdYFowDA92WjhbCFPVYHnWfK1YWCB3OOxKEy4iP/FOOdEGom/zM
 5S7b90mP9yGq+z6P2nexJ5J6BKgyryypJwerqH555XUAn6pdQTI9f4poHsu5TIUwJh
 KNDxvM5zKBNQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 2/5] PCI: Fix AB-BA deadlock between device_lock and
 pci_rescan_remove_lock in remove_store
To: "Benjamin Block" <bblock@linux.ibm.com>
Cc: "Vasily Gorbik" <gor@linux.ibm.com>, linux-pci@vger.kernel.org, "Heiko
 Carstens" <hca@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, intel-xe@lists.freedesktop.org,
 linux-s390@vger.kernel.org
In-Reply-To: <1f58bc47da3e119a0c72e721455041c18db6f3ec.1790267348.git.bblock@linux.ibm.com>
References: <cover.1790267348.git.bblock@linux.ibm.com>
 <1f58bc47da3e119a0c72e721455041c18db6f3ec.1790267348.git.bblock@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 16:38:12 +0000
Message-Id: <20260924163813.499941F000FF@smtp.kernel.org>
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

> From: Ionut Nechita <ionut.nechita@windriver.com>
>=20
> remove_store() calls pci_stop_and_remove_bus_device_locked() which
> takes pci_rescan_remove_lock first, then device_lock during driver
> release.  Meanwhile, unbind_store() takes device_lock first (via
> device_driver_detach), and the driver's .remove() callback may call
> pci_disable_sriov() -> sriov_del_vfs() -> pci_lock_rescan_remove().
>=20
> This creates an AB-BA deadlock:
>=20
>   CPU0 (remove_store)               CPU1 (unbind_store)
>   --------------------              --------------------
>   pci_lock_rescan_remove()
>                                     device_lock()
>                                     driver .remove()
> [ ... ]
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Reviewed-by: Benjamin Block <bblock@linux.ibm.com>
> Tested-by: Benjamin Block <bblock@linux.ibm.com>
> Signed-off-by: Ionut Nechita <ionut.nechita@windriver.com>
> Signed-off-by: Benjamin Block <bblock@linux.ibm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790267348.gi=
t.bblock@linux.ibm.com?part=3D2

