Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B00C98318
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 16:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD2C10E18B;
	Thu, 24 Sep 2026 16:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nR1k39bq";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E745410E18B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 16:35:41 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id CB20C40229;
 Thu, 24 Sep 2026 16:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC151F000FF;
 Thu, 24 Sep 2026 16:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790267741;
 bh=ZocbSG0ys8khPCLcy7evQ1A6ZUGNquc9YZcxBEUBv1c=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nR1k39bqTXHR6SDlPA9ZjF8bgICpNt+jJ756WzIyOSdSC4MF51bFLC7POhVkF22wS
 DJDPcPK8yOo6W2FksbFSZ364tAxgBnUvMu4/0S4yRtllg3pLEhu8LxNUD49VHTGkOA
 1+6/i8vyvsX15E2C4BIVl+e+7qN5BAebKFrtdiABEzNcRq5VlYmjku3i3GsqnMS3nj
 BKe3T1jc3Y/ddG3SvdMYvjZ1R4hue+938QiIBN6JcrBndL+xhgTvSvEE5XMiNY95zu
 4jgRZ4/cUJ6MtlTydIqWOAThf3SzzYJowDvsUAZSa48QmDUMJwRKHwzduqRdw3Ibkm
 mA6dLtkec3NRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 3/5] PCI: Move declaration of pci_rescan_remove_lock
 into public pci.h
To: "Benjamin Block" <bblock@linux.ibm.com>
Cc: "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>, linux-pci@vger.kernel.org,
 linux-s390@vger.kernel.org, "Heiko
 Carstens" <hca@linux.ibm.com>, intel-xe@lists.freedesktop.org, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>
In-Reply-To: <d15370f96120f007db5717839a313f1a7bbfe010.1790267348.git.bblock@linux.ibm.com>
References: <cover.1790267348.git.bblock@linux.ibm.com>
 <d15370f96120f007db5717839a313f1a7bbfe010.1790267348.git.bblock@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 16:35:40 +0000
Message-Id: <20260924163541.4AC151F000FF@smtp.kernel.org>
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

> So far it is possible to use and call the functions
> pci_lock_rescan_remove() and pci_unlock_rescan_remove() from any PCI
> code, including modules and architecture code; but the lock variable
> `pci_rescan_remove_lock` itself is private to objects residing in
> `drivers/pci/` via the header `drivers/pci/pci.h`.
>=20
> This makes it possible to use the lock - lock it, unlock it - from
> anywhere, but it is not possible to use lockdep annotations such as
> lockdep_assert_held(), or sparse annotations such as __must_hold() in
> modules or architecture code for PCI to make the usage more safe.
>=20
> Since it is useful for `pci_rescan_remove_lock` to have such
> annotations, move the variable declaration into `include/linux/pci.h`.
>=20
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Benjamin Block <bblock@linux.ibm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790267348.gi=
t.bblock@linux.ibm.com?part=3D3

