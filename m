Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A109A606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 02:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1V4Y7+U
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5396710EBBC;
	Fri, 20 Nov 2026 02:35:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4929D10EBBC
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 02:35:52 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 72F6A61207;
 Fri, 20 Nov 2026 02:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6721F000C6;
 Fri, 20 Nov 2026 02:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795142151;
 bh=qIbJs3K4Pvzru6gxhKmzCOIrIYP0qib2yT05sdTklYU=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=M1V4Y7+UbXxI/mM9URhB+9CDnwnvPZbVoYTvZpVeoljIv4I7Nd5AgdZez+pESSqT5
 yt10rPVyMZyaC9ge8qNnMt+hnulbBkYtCrzEFT6K+AlmXghtEW/TCkUlPg7PX4Kl7Y
 aTF0ty1bbA8wrYbkGT+CK2rccbM4u+u9s15FGdbdlxjj/KBbzY3dVxkQdN2yLEDIaa
 4iE4azMXqfjAqN93FUp45RX0MINoQuDpJUWzbt8V713tL6QjZt8R+eHRIfOwELDiaT
 tW7sfV4SfXnSPgOChAM0qGMlF+xNHzHEkMfhLPjOmxWuud2pFrD0EWgSIOj9SWa0u8
 n60H69Jsu2DGg==
Message-ID: <sashiko-outbox-224373@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] drm/xe: Add sysfs to disable RPe
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261120021606.1360244-4-vinay.belgaumkar@intel.com>
References: <20261120021606.1360244-3-vinay.belgaumkar@intel.com>
 <20261120021606.1360244-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 02:35:50 +0000
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
- [High] drm/xe: missing mutex_unlock() on error path in pc_init_freqs()
--

commit 8eaf500b6aad45a924c81aec805cef3e5c7913ef
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

drm/xe: Add sysfs to disable RPe

This commit adds a use_rpe sysfs attribute to control whether GuC SLPC
elevates the minimum GT frequency to the efficient frequency (RPe), and
disables RPe before stashing or adjusting frequency bounds.

> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_p=
c.c
> index 7e9700f16bfb6..68e54e0b756de 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c

[ ... ]

> @@ -1178,6 +1210,11 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
> =20
>  	pc_init_pcode_freq(pc);
> =20
> +	/* Restore use_rpe */
> +	ret =3D pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +	if (unlikely(ret))
> +		return ret;
> +
>  	/*
>  	 * The frequencies are really ready for use only after the user
>  	 * requested ones got restored.

[Severity: High]
Does this error return leave pc->freq_lock held when
pc_set_ignore_eff_freq() fails?  pc_init_freqs() acquires pc->freq_lock
at the start and releases it at the out label, so returning directly here
will deadlock any later caller that takes pc->freq_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120021606.1360=
244-3-vinay.belgaumkar@intel.com?part=3D2
