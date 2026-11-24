Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC92606A322
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 00:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ci8isPpx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FC710E080;
	Tue, 24 Nov 2026 00:54:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A828A10E080
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 00:54:50 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8270C61FEE;
 Tue, 24 Nov 2026 00:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0671F000C4;
 Tue, 24 Nov 2026 00:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795481689;
 bh=zrjNK/ApVCV5Dlq3qitAblU7iHdAyuEjPrWqvyDD0ZU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Ci8isPpx0ZozdggIGrHhmSH03tyTcXgc+WJ7uNwO3pVRwOtsf4iNzv6Qu1aKpDGfq
 7MQ5kIS5dBEk6MtjmaHZoRC5gsdwpuV5GC+Wk9GvYk3SAG6zDQIODxlTkMIBaanXgv
 2IQHByaNLEtmh1ON6alMko9SX4p47Xb9+tHjG0SEeYmcpiFSNersV0RBJY9VeI4XKD
 9hPghH533aYrBSxbs/jx5gwX3fOo1ScMwv7j4WDTe/hjbKjUuY3giFxg4vJm83k3IF
 n/lPmKsKa7fp73kPpjVoJy8Is1HZaH1VuhBfKZ0ayNl908qmmbXiaRWVK7bY+8XjrA
 9bUa1egf46pPg==
Message-ID: <sashiko-outbox-230321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 19/19] drm/xe/vsec: Support survivability mode for CRI
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261124003856.4145635-40-michael.j.ruhl@intel.com>
References: <20261124003856.4145635-21-michael.j.ruhl@intel.com>
 <20261124003856.4145635-40-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 00:54:48 +0000
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
- [Medium] drm/xe/vsec: missing drm_dev_exit() on error path in
  xe_pmt_discovery_read()
--

commit 38f533a6bd45b3629c4e0dbd2ca1908d30115ea3
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Support survivability mode for CRI

This commit adds a VSEC configuration for Crescent Island in survivability
mode, exposing only the PUNIT crashlog PMT capability.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index 851d02d6ed250..21bd71608fa55 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c

[ ... ]

> @@ -738,6 +763,13 @@ void xe_vsec_init(struct xe_device *xe)
>  		}
>  		break;
> =20
> +	case XE_VSEC_CRI_SURVIVABILITY:
> +		xe->pmt.base_offset =3D CRI_PMT_OFFSET;
> +		xe->pmt.survivability_mode =3D true;
> +		info->priv_data =3D &xe_cri_pmt_cb;
> +		xe->soc_remapper.set_telem_region(xe, CRI_IDX_TELEM_DISCOVERY);
> +		break;
> +
>  	default:
>  		drm_err(&xe->drm, "Unsupported platform: %u\n", platform);
>  		return;

[Severity: Medium]
Does xe_cri_pmt_cb's .read_discovery callback, xe_pmt_discovery_read(),
leak the drm_dev_enter() SRCU read lock when xe_pm_runtime_get_if_active()
fails?

drivers/gpu/drm/xe/xe_vsec.c:xe_pmt_discovery_read() {
	if (!drm_dev_enter(&xe->drm, &idx))
		return -ENODEV;

	if (!xe_pm_runtime_get_if_active(xe))
		return -ENODATA;
    ...
dev_exit:
	xe_pm_runtime_put(xe);
	drm_dev_exit(idx);

	return ret;
}

If the PMT auxiliary driver probes or is rebound while the Xe device is
runtime suspended, returning -ENODATA directly without calling
drm_dev_exit(idx) leaves the SRCU read lock held, causing a lockdep
warning and hanging subsequent drm_dev_unplug() calls during driver
unbind or hot-unplug.  Note that dev_exit also calls xe_pm_runtime_put(),
so a separate label before drm_dev_exit(idx) is needed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124003856.4145=
635-21-michael.j.ruhl@intel.com?part=3D19
