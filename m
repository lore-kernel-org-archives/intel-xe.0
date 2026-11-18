Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02101606A325
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hmM+78oY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC32510FFAF;
	Wed, 18 Nov 2026 19:17:03 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C785E10FFAF
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 19:16:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 81BF040779;
 Wed, 18 Nov 2026 19:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 129521F000C6;
 Wed, 18 Nov 2026 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795029417;
 bh=o3y/MuhXXyW4aUaVwNCN7iWDehTi4A6ISdwG8IkeQIk=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=hmM+78oYQaQyKfUv3B8+W5ZmICVYwcXSgnti3FaDfojnGhHLQXQaoLlGO2TnAKfmR
 QV/qgEMsu5eoEe7yfgTtuncml0dhWnvfAvPiKuX7VcHstoE3oHr8szGl2PzGtxkv4d
 V5/OlBkAfnVrwj9mMCpxE5sXT8GGNdVDy+NrHgSkzlcV4ucm4AhYzXuQsx6lzdbp3S
 5rxwMQBwm5wGTPjYjefVKvKvqSdqGde+TYOaOj4ZgQUq+S/51a6bqM6NQKqC/Wjt3q
 GdlvQJmG06ug4qpHIndr00lmWiELnQCnvmRn38Srx7qhbCqkrAVnffPf6S6B2lHEg3
 U90pysFBRRV+g==
Message-ID: <sashiko-outbox-221836@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/xe/survivability: Fix infinite loop in aux info
 traversal
To: "Sk Anirban" <sk.anirban@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261118185015.3164387-2-sk.anirban@intel.com>
References: <20261118185015.3164387-2-sk.anirban@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 19:16:56 +0000
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] drm/xe: incomplete aux info cycle check in
  populate_survivability_info()
- [Low] drm/xe: missing Fixes trailer for populate_survivability_info()
  loop fix
--

commit 19aa3366e7f1461b958c38d850bd5cc574ab58b4
Author: Sk Anirban <sk.anirban@intel.com>

> drm/xe/survivability: Fix infinite loop in aux info traversal
>
> Stop traversing the aux info linked list when an entry references
> itself, preventing an endless loop and soft lockup during probe.
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>

[Severity: Low]
Should this include a Fixes: tag for f4e9fc967afd ("drm/xe/xe_survivability:
Redesign survivability mode") or 5e940312a2ac ("drm/xe: Add functions and
sysfs for boot survivability")?

> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index d73cdad0b3a9c..1e868c52eb730 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -170,8 +170,14 @@ static void populate_survivability_info(struct xe_de=
vice *xe)
>  	if (reg_value & AUXINFO_SUPPORT) {
>  		for (id =3D REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
>  		     id >=3D AUX_INFO0 && id < MAX_SCRATCH_REG;
> -		     id =3D  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
> +		     id =3D  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id])) {
>  			set_survivability_info(mmio, info, id);
> +			if (REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]) =3D=3D id) {
> +				xe_warn(xe, "survivability: %s points to itself, stopping aux info w=
alk\n",
> +					reg_map[id]);
> +				break;
> +			}
> +		}
>  	}
>  }

[Severity: Medium]
Can populate_survivability_info() still spin forever if the AUX_INFO0..4
registers form a cycle of two or more nodes (for example, AUX_INFO0 pointing
to AUX_INFO1 and AUX_INFO1 pointing back to AUX_INFO0)?  Tracking visited
registers in a bitmask or bounding the walk to MAX_SCRATCH_REG - AUX_INFO0
steps would stop multi-node cycles as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118185015.3164=
387-2-sk.anirban@intel.com?part=3D1
