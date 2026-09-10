Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72588C88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 21:45:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155DF10E8BE;
	Thu, 10 Sep 2026 21:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XFbk6Up9";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7610E8BE
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 21:45:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3E8464145E;
 Thu, 10 Sep 2026 21:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021B41F000FF;
 Thu, 10 Sep 2026 21:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789076728;
 bh=c11GopBl69UyWpTfrUpnGgiKqJcTTICuLhYLe3cUu5I=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=XFbk6Up9cA8uYZN+LkBHyfI3XKjogvw9NYcipNZFiQaWsj9MXVU9tsFW4yLimuXj/
 TpJXGdNTZGfxjhYh8ylbqwk/g6sUm11vRwX7Zdu81lNY+73tgefMwTkc0lVh3EDJJi
 kNHfuaESWg7+hWIIIfiwi2L5Uep8kVuHT5zstoh/7+uUDvSV7aTapPpgSWReBF+sx4
 1YvEjE3jG3CPRNJeFjBtjMWAlhOFtOnSZ0kphzzrWkUVQdG3kxXD1xJ5lWB/Jy6IhR
 aB9oEKbW15nhayNhmul+yUrbH8rzsU5i9GZ1pOsPcBPACUBi2DeV+Obre5SpxKAlSJ
 oEYDCcUbtfE3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:45:27 +0000
Message-Id: <20260910214528.021B41F000FF@smtp.kernel.org>
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
- [High] The runtime PM autosuspend retry mechanism is broken, causing unco=
nditional suspension even when forcewake bits are set.
--

commit 87cc16a66c9eb41f1b093edd9b83a3cac1ad67b5
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
drm/xe: Inspect all forcewake bits for runtime idleness

This commit adds checks for all GT force wake bits in the idle check
for runtime suspend to avoid suspending while the GT is kept awake.=20
It also adds a call to pm_runtime_autosuspend() inside the idle check
to ensure a PM subsystem retry at a later time.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611f..278cfd390364c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c

[ ... ]

> @@ -1437,10 +1437,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>  {
>  	struct pci_dev *pdev =3D to_pci_dev(dev);
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	int ret;
> =20
>  	xe_pm_d3cold_allowed_toggle(xe);
> =20
> -	return 0;
> +	ret =3D xe_pm_check_runtime_idle(xe);
> +	pm_runtime_autosuspend(dev);

[Severity: High]
Does this cause an immediate suspension rather than a delayed retry?

When xe_pm_check_runtime_idle() detects forcewake bits and returns -EBUSY,
pm_runtime_autosuspend() is called to queue a retry. However, because
pm_runtime_mark_last_busy() is not called to update the timestamp, the PM
core calculates that the autosuspend timer is already expired.

This causes rpm_suspend() to execute immediately. Since the
xe_pci_runtime_suspend() callback does not re-check idleness, the device
appears to unconditionally suspend while forcewake bits are still active.

> +
> +	return ret;
>  }
> =20
>  static const struct dev_pm_ops xe_pm_ops =3D {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910212823.2358=
362-1-vinay.belgaumkar@intel.com?part=3D1
