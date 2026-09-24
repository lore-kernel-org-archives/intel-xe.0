Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81540C9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 16:34:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3741210E18B;
	Thu, 24 Sep 2026 16:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jWa4tg2H";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8C10E18B
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 16:34:39 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 2694F413A1;
 Thu, 24 Sep 2026 16:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A1721F000FF;
 Thu, 24 Sep 2026 16:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790267679;
 bh=JWWjajoKKaZ8Si6/0f128se04N0OYCtGSb9K4RUbsKU=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jWa4tg2HopJFZ57W3h3ATvxcTw1J3dnru1bEMZh5zc3G3pIGO3LHW6slUGljdDpJs
 jGZPBsXnJNwNCIU1qy1d3Te5Fc5O+m8bhwlWGj5yL+N7bLoBKdEK9QvhmKCIbcw06W
 5DtWwHNxVaryQYbQ+Y2+sjs2poZwpPgy0FZOMfT8dNcCor/siPzOpupkXgnNY2tdpR
 Ov7I8Q1WJtyhyW+FLbs9Qzj9I2eeUoOhp9fL5uXHmTLXtj/tgN8MBbKs9TqEqiHdZV
 k9Ar/jI43pU0p7PDsuGE20/VvcrTI/QkimL4piimfpalStmyU7bdSyV/4rMY1GQGSp
 z4YE0xQnwW/HQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 4/5] PCI: Provide lock guard for pci_rescan_remove_lock
To: "Benjamin Block" <bblock@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 intel-xe@lists.freedesktop.org, "Heiko
 Carstens" <hca@linux.ibm.com>, linux-pci@vger.kernel.org, "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, "Vasily Gorbik" <gor@linux.ibm.com>
In-Reply-To: <33e55a5db13f7ed16234774803e8f0ec03ae8c5b.1790267348.git.bblock@linux.ibm.com>
References: <cover.1790267348.git.bblock@linux.ibm.com>
 <33e55a5db13f7ed16234774803e8f0ec03ae8c5b.1790267348.git.bblock@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 16:34:38 +0000
Message-Id: <20260924163438.9A1721F000FF@smtp.kernel.org>
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

> Make it possible to use guard() or scoped_guard() to lock, and
> automatically unlock `pci_rescan_remove_lock`.
>=20
> Since the actual mutex `pci_rescan_remove_lock` is always supposed to be
> taken and released using the functions pci_lock_rescan_remove() and
> pci_unlock_rescan_remove() it is not possible to simply use the already
> existing guards for `struct mutex`. Instead define a new guard
> `pci_rescan_remove` that will also call the functions in question, but
> is usable via guard() or scoped_guard().
>=20
> Reviewed-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Signed-off-by: Benjamin Block <bblock@linux.ibm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790267348.gi=
t.bblock@linux.ibm.com?part=3D4

