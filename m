Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95BD6606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 18:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/+DQKOD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6A411268B;
	Thu, 26 Nov 2026 18:15:50 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5C6112687;
 Thu, 26 Nov 2026 18:15:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id A782C434F0;
 Thu, 26 Nov 2026 18:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E441F000CA;
 Thu, 26 Nov 2026 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795716943;
 bh=vXUdpwV50iEIK2ZAhsGHdWatwklczdM5W2M6mr/BWDs=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=c/+DQKODmGR+4gkbPxnovyR/S5eKhBrRsfiQwMeCUvM2GRyVr/W4wEbI5vrmNIIrC
 5RLHDdhid+7JeAjLDEKPwOr38gensRr76e0ho5+ZGRE4Rf6K5nA6uoCK3Xy7/hovic
 ZBa3XJyM5ZqMwFfhEyyTfI2NkfMYqEAUlQONpAtbZLrlInW4AoVOrZRfg25acbxa4d
 nNxBZaOxS2dLfbd4dEeyxlcH3Rey4OjPHqledBJTh0UKpCaiOTOZtVLsAvb3HhlDIm
 eXmy27MqU07DWn+wo/zotCm7+0B7sItHu/DU/LrWh/aPin1h8A9ndatueHrJwrbVhp
 zev66jql4OI3g==
Message-ID: <sashiko-outbox-236007@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/4] drm/i915/display: s/vbt_firmware/i915_vbt/
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
In-Reply-To: <20261126180614.224327-3-michal.grzelak@linux.intel.com>
References: <20261126180614.224327-1-michal.grzelak@linux.intel.com>
 <20261126180614.224327-3-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 18:15:42 +0000
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] drm/i915/display: renaming vbt_firmware modparam breaks ABI
  and xe naming
--

commit fa8f42fa4eb41bc75f83d0f076e1f8926cb58a41
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

drm/i915/display: s/vbt_firmware/i915_vbt/

This commit renames the vbt_firmware display module parameter and struct
intel_display_params member to i915_vbt.

> diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c b/driver=
s/gpu/drm/i915/display/intel_display_params.c
> index d14294933bcd7..74a75eb9f5eae 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> @@ -36,7 +36,7 @@ intel_display_param_named_unsafe(dmc_firmware_path, cha=
rp, 0400,
>  	"DMC firmware path to use instead of the default one. "
>  	"Use /dev/null to disable DMC and runtime PM.");
> =20
> -intel_display_param_named_unsafe(vbt_firmware, charp, 0400,
> +intel_display_param_named_unsafe(i915_vbt, charp, 0400,
>  	"Load VBT from specified file under /lib/firmware");

[Severity: Medium]
Does renaming the vbt_firmware module parameter break existing kernel
command lines and modprobe configurations while exposing an
i915-prefixed parameter on xe?

vbt_firmware has been used since commit ab3595bc4ff3 ("drm/i915/opregion:
let user specify override VBT via firmware load") to specify a firmware
file under /lib/firmware, so renaming it breaks existing
i915.vbt_firmware and xe.vbt_firmware setups and causes modprobe to fail
when vbt_firmware is configured in /etc/modprobe.d/.

In addition, intel_display_params.c is shared between i915.ko and xe.ko
and parameters in INTEL_DISPLAY_PARAMS_FOR_EACH are already namespaced
by the driver name.  Naming the parameter i915_vbt yields i915.i915_vbt
on i915 and xe.i915_vbt (as well as /sys/module/xe/parameters/i915_vbt
and debugfs xe_params/i915_vbt) on xe.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126180614.2243=
27-1-michal.grzelak@linux.intel.com?part=3D2
