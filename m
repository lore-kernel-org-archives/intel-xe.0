Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC4BC9830E
	for <intel-xe@archiver.kernel.org>; Thu, 24 Sep 2026 16:44:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACF610E18B;
	Thu, 24 Sep 2026 16:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xn+Gumji";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64C6A10E55A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Sep 2026 16:44:07 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4B23D401F2;
 Thu, 24 Sep 2026 16:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7A151F000FF;
 Thu, 24 Sep 2026 16:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790268247;
 bh=TTeN3d4CFaPrQNo2R9gxfHf6c99d6TAVrA/sBkk6KjM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Xn+GumjiV+szrSaOrHsFMO8e25nKEnKaQTcHZk6cy2g1fmRraZnNVMVRl6bq8ci0h
 QTRdlXBChl/dPPDKNCEjSZuYToqAZwJUOZP5M5bl5AMA6ouUo21dyg1XDAqPMwE9nx
 ve/lKSgWVl8Bw9SvGGhKioRaHgs5bLjU3TDJRdDzlpXphSQN9gLjhaFNusVJRfFROD
 Z9qFtw8CE1QagvhBImjvKvJsPrSGM4GFZkLfhxoSB6VD97eTNmLblutYyOebzOufUs
 yXSfPQzMvVjdMpg4Jm785qxtEMnAimsVCO15tarUcTXRYN00XdQH+4s+6A1eTwRlRA
 MLYat8moZTI+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/5] s390/pci: Fix circular/recursive deadlocks in
 PCI-bus and -device release
To: "Benjamin Block" <bblock@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily
 Gorbik" <gor@linux.ibm.com>, "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian
 Borntraeger" <borntraeger@linux.ibm.com>, intel-xe@lists.freedesktop.org,
 linux-pci@vger.kernel.org
In-Reply-To: <845f3fd0e94294765ea10454823c21e464d2f4bd.1790267348.git.bblock@linux.ibm.com>
References: <cover.1790267348.git.bblock@linux.ibm.com>
 <845f3fd0e94294765ea10454823c21e464d2f4bd.1790267348.git.bblock@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 16:44:06 +0000
Message-Id: <20260924164406.B7A151F000FF@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] pci: mixing goto and cleanup helpers in __zpci_event_error and p=
ci_base_init
--

commit 703530c4b98b53581e1625ffc110fa9701e163ee
Author: Benjamin Block <bblock@linux.ibm.com>

s390/pci: Fix circular/recursive deadlocks in PCI-bus and -device release

When removing PCI device or PCI bus objects there are a couple of
call-chains where it is possible that the kernel runs into a circular
deadlock involving the central pci_rescan_remove_lock.

> diff --git a/arch/s390/pci/pci.c b/arch/s390/pci/pci.c
> index d64c544b32b0c..4fc3e3dc87ad1 100644
> --- a/arch/s390/pci/pci.c
> +++ b/arch/s390/pci/pci.c
[ ... ]
> @@ -1208,7 +1212,8 @@ static int __init pci_base_init(void)
>  	if (rc)
>  		goto out_irq;
> =20
> -	rc =3D zpci_scan_devices();
> +	scoped_guard(pci_rescan_remove)
> +		rc =3D zpci_scan_devices();
>  	if (rc)
>  		goto out_find;
> =20

[Severity: Medium]
Is it intentional to mix goto-based error handling with scope-based cleanup
helpers here?

The pci_base_init() function contains multiple goto statements for error
handling, and this patch introduces a scoped_guard() into the same routine.
The cleanup.h guidelines state that usage of goto and cleanup helpers should
never be mixed in the same function.

[ ... ]
> diff --git a/arch/s390/pci/pci_event.c b/arch/s390/pci/pci_event.c
> index f317a1465dad8..268f435677ae3 100644
> --- a/arch/s390/pci/pci_event.c
> +++ b/arch/s390/pci/pci_event.c
[ ... ]
> @@ -382,6 +382,7 @@ static void __zpci_event_error(struct zpci_ccdf_err *=
ccdf)
>  	pci_dev_put(pdev);
>  no_pdev:
>  	mutex_unlock(&zdev->state_lock);
> +	guard(pci_rescan_remove)();
>  	zpci_zdev_put(zdev);
>  }
> =20

[Severity: Medium]
Can this introduction of guard() into __zpci_event_error() also cause issues
with mixed cleanup paradigms?

In __zpci_event_error(), there are goto statements used for error handling,
and this patch introduces a guard() right at the cleanup label. Mixing goto
with cleanup.h helpers in the same function goes against the subsystem
guidelines.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790267348.gi=
t.bblock@linux.ibm.com?part=3D5
