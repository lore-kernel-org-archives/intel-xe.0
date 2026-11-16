Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B891606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAJZmqWN
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5417810ED4A;
	Mon, 16 Nov 2026 09:07:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B330010ED6C
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:07:26 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6F935408FA;
 Mon, 16 Nov 2026 09:07:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8CF1F000C4;
 Mon, 16 Nov 2026 09:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794820046;
 bh=du6EiwRCMnt7VVpc0bQV9V4JsJprjTZTSNKkxgnzh70=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=kAJZmqWNlB89UnmnU4KvkSXKpgP4hX+3wQOvN6dhnKXV8WUkiApWr3BwZPCdOig6Q
 l/jth67GGCwXWbH2IdATWnGwtVgahhiZht5RuQ3jAODJcmfCTf1yTf/cUs+CBwm1Vv
 xekCVFKtDU7ojzmsYwGP2/CXusTVjZBcXaCa4c4ZNiO1QaOVwXsoBLM8nGiV2iEaCH
 anlIGF+W28qqZy4FLxQ2MfSkPuCcCVIZiV2hwU+Usk3uiJyuz3zmOzPlFvkKVuvuSS
 3JJ+Hh7k1Fu+VcQpOMqooRUwqen38nIi5fi/C/P4fd2VZIPrZKFFqvMoIz8xaW8XOr
 wOtRXdBHigjsg==
Message-ID: <sashiko-outbox-216583@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] drm/xe/drm_ras: Protect against unplugged or wedged
 device
To: "Raag Jadav" <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261116085343.1972825-1-raag.jadav@intel.com>
References: <20261116085343.1972825-1-raag.jadav@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 09:07:25 +0000
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

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Critical] drm/ras: use-after-free in drm_ras_nl_list_nodes_dumpit()
  [1]
--

commit f10baa8a8d01dd4d47e42403a4abd3c074961edc
Author: Raag Jadav <raag.jadav@intel.com>

drm/xe/drm_ras: Protect against unplugged or wedged device

This commit adds drm_dev_enter() and xe_wedged() checks around DRM RAS
counter and threshold callbacks and event reporting to prevent accesses on
unplugged or wedged devices.

> diff --git a/drivers/gpu/drm/xe/xe_drm_ras.c b/drivers/gpu/drm/xe/xe_drm_=
ras.c
> index 7554803aae11a..c0c1acb84e890 100644
> --- a/drivers/gpu/drm/xe/xe_drm_ras.c
> +++ b/drivers/gpu/drm/xe/xe_drm_ras.c
> @@ -5,6 +5,7 @@
> =20
>  #include <linux/bitmap.h>
> =20
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_ras.h>
> @@ -12,10 +13,33 @@
>  #include "xe_device_types.h"
>  #include "xe_drm_ras.h"
>  #include "xe_ras.h"
> +#include "xe_wedge.h"
> =20
>  static const char * const error_components[] =3D DRM_XE_RAS_ERROR_COMPON=
ENT_NAMES;
>  static const char * const error_severity[] =3D DRM_XE_RAS_ERROR_SEVERITY=
_NAMES;
> =20
> +static int drm_ras_counter_get(struct xe_device *xe, struct xe_drm_ras_c=
ounter *info,
> +			       u32 error_id, int *idx)
> +{
> +	if (xe_wedged(xe))
> +		return -ECANCELED;
> +
> +	if (!info || !info[error_id].name)
> +		return -ENOENT;
> +
> +	/* Must be last */
> +	if (!drm_dev_enter(&xe->drm, idx))
> +		return -ENODEV;

[Severity: Critical]
This problem wasn't introduced by this patch, but can
drm_ras_nl_list_nodes_dumpit() race with device teardown and trigger a
use-after-free or NULL pointer dereference on node and node->device_name
[1]?

CPU0                                    CPU1
cleanup_node()                          drm_ras_nl_list_nodes_dumpit()
                                          xa_for_each_start(&drm_ras_xa, ..=
.)
  drm_ras_node_unregister(node)
    xa_erase(&drm_ras_xa, node->id)
  cleanup_node_param(node)
    kfree(node->device_name)
    node->device_name =3D NULL
  /* node freed via drmm */
                                          nla_put_u32(..., node->id)
                                          nla_put_string(...,
                                            node->device_name)  <-- UAF / N=
ULL

drm_ras_nl_family enables parallel_ops, and xa_for_each_start() only holds
rcu_read_lock() inside xa_find() and xa_find_after(), returning node to the
loop body without any lock, RCU protection, or reference held.  Meanwhile,
cleanup_node() in xe_drm_ras.c unregisters the node with xa_erase(), frees
and clears node->device_name, and lets drmm free the drm_ras_node itself, so
a concurrent netlink dump can dereference NULL in strlen() or read freed
memory.

[1] https://sashiko.dev/#/bug/linux-f54f18de-e95f-4d99-b86c-f90c2c59b668

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116085343.1972=
825-1-raag.jadav@intel.com?part=3D1
