Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D86AC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DC310ECF1;
	Thu, 10 Sep 2026 22:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Atsp0A1n";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778E910ECF1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 22:14:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 338874398F;
 Thu, 10 Sep 2026 22:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E191F000FF;
 Thu, 10 Sep 2026 22:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789078490;
 bh=ZtPK6jVHccaV6uPnIErKB6+AHsoi4fYvVKGI49i9Ekc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Atsp0A1nMHgDRiY/NIjwlz3CZ8dRej/33Sg/4THkehWtUFtwgnhs4NM9MBID0rDPy
 1qeOyWUiBhHmL9MTmuW0oaEA8E/K6EhtSRVaVtjQVmsD++v2U9KJnvuiWRHKnsCkb2
 r24WfFEVRvZnAcDIAOWK1DjFHJYXWMj9AWJ5a3zJ9gIouIpTS3ryfXSrtSMC2+VpWc
 wsscjeKcXPiMlPEU3PTZ97LkrjysHwyyPC8ZeKWLV3e+DmZZrBrfZrpEGaXLiillAK
 sXhPYsOG+Zli94cDixlM3otf3b+IlCt6n2BwMBVmRVAoLEb5RqZtof43+UJlH7Osnw
 uXZiBhZ4x2UgA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
References: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 22:14:49 +0000
Message-Id: <20260910221449.E9E191F000FF@smtp.kernel.org>
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
- [High] The GT idleness check is bypassed when the autosuspend timer expir=
es, causing the device to incorrectly suspend while GT force wake bits are =
set.
--

commit 67a69146e56125d81bcb8e5c162581fbabbf0d56
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

    drm/xe: Inspect all forcewake bits for runtime idleness

    Inspect all GT force wake bits in the idle check for runtime suspend.
    This includes the ones not typically used by Xe KMD as well. Skip suspe=
nd
    when any of these bits are set, since it could mean someone is trying to
    keep the GT awake.
   =20
    Also add a call to pm_runtime_autosuspend() inside the idle check. This
    ensures a PM subsystem retry at a later time.

> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 1e04e8ef2611f..278cfd390364c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
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
> +
> +	return ret;
>  }

[Severity: High]
Since pm_runtime_autosuspend() is called here, when the autosuspend timer
expires, the PM core executes the .runtime_suspend() callback directly
(xe_pci_runtime_suspend() -> xe_pm_runtime_suspend()), completely bypassing
.runtime_idle().

Because xe_pm_runtime_suspend() lacks the hardware idleness check, does this
allow the device to incorrectly suspend while GT force wake bits are still
set?

Should the idleness check also occur within the runtime_suspend callback to
safely reject a suspend and force a retry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910215756.2393=
137-1-vinay.belgaumkar@intel.com?part=3D1
