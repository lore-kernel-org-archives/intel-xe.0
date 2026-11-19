Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFCC606A320
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OvHtpg00
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EF410E43B;
	Thu, 19 Nov 2026 11:04:52 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 571AB10E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 11:04:46 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 17A86407C0;
 Thu, 19 Nov 2026 11:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D167A1F000C4;
 Thu, 19 Nov 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795086286;
 bh=26LVQHYasPbb4XQ1P0sptpfWJjDZVrCOtUqGB/hMDW4=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=OvHtpg00dsi5vyxEWe0Ak0RZhBYt8jWKvR5U1FqoxGMFxBmsb/d/40wm5ARdlcRn5
 Zr0ydJuyaHrSOHGE78If+Z5HOrmlXE6OZ/X5LCfUDidbh/nl3pNufGHp4mm5c0W1HZ
 BHN/4L5nJa/UlN817vHjfyTJLvjNk2XJ6Wfq0ExwLEP0lu5YKytWmGKPobmWuUd6pL
 h9BtDDmc/T7xKvK5I7FFkVmKflNlBAJlOgOg3w5xGwHB9LaNLZSOq4PlFbJhqopR5a
 KJb5e40ssBbFD9jHO5rTEUd0lUJpTFWc7EZRrPqy03lvOGPuQ1Xipf10ym+8S4cNqL
 1KiG+hCWVX9rw==
Message-ID: <sashiko-outbox-223004@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: "Sk Anirban" <sk.anirban@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261119104300.3401464-2-sk.anirban@intel.com>
References: <20261119104300.3401464-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:04:45 +0000
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
- [Low] drm/xe/survivability: duplicate MMIO read in
  populate_survivability_info()
--

commit e6c70594563ece060377037415229cf64bafe989
Author: Sk Anirban <sk.anirban@intel.com>

drm/xe/survivability: Fix infinite loop in aux info traversal

This commit replaces the linked-list traversal of AUX info scratch
registers in populate_survivability_info() with a linear loop from
AUX_INFO0 to MAX_SCRATCH_REG to avoid infinite loops when a register
points to itself.

> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index d73cdad0b3a9c..b3b6c89bed6f4 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -166,12 +166,12 @@ static void populate_survivability_info(struct xe_d=
evice *xe)
>  			set_survivability_info(mmio, info, POSTCODE_TRACE_OVERFLOW);
>  	}
> =20
> -	/* Traverse the linked list of aux info registers */
> +	/* Read all aux info registers and store the non-zero ones */
>  	if (reg_value & AUXINFO_SUPPORT) {
> -		for (id =3D REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
> -		     id >=3D AUX_INFO0 && id < MAX_SCRATCH_REG;
> -		     id =3D  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
> -			set_survivability_info(mmio, info, id);
> +		for (id =3D AUX_INFO0; id < MAX_SCRATCH_REG; id++) {
> +			if (xe_mmio_read32(mmio, PCODE_SCRATCH(id)))
> +				set_survivability_info(mmio, info, id);
> +		}
>  	}
>  }

[Severity: Low]
Does this read every non-zero PCODE_SCRATCH(id) register twice over MMIO?
set_survivability_info() is just:

drivers/gpu/drm/xe/xe_survivability_mode.c:set_survivability_info() {
	info[id] =3D xe_mmio_read32(mmio, PCODE_SCRATCH(id));
}

Calling set_survivability_info(mmio, info, id) directly in the loop would
read each register once.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119104300.3401=
464-2-sk.anirban@intel.com?part=3D1
