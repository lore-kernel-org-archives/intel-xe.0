Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A9606A320
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 05:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YpemX8J9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB21C10E0D3;
	Fri, 20 Nov 2026 05:53:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1948510E0D3
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 05:53:02 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id D046160D4C;
 Fri, 20 Nov 2026 05:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 624DC1F000C6;
 Fri, 20 Nov 2026 05:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795153980;
 bh=0uFWD1IK7d3iOCw6Q0uOFRphtglXWNG1PAdeZnkAtI8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=YpemX8J9NQpeZf4OrzSuZ4FEuBKM2JcMKjyH79/6cwSA/ciRB4goLrLn/u2EItWtf
 E1ZLIjv+IlnKUxHlUCMuV0FGPHBPfPv46wPL8BDTKsXf6vJTDyT2UnPuGJtW+I8Fvn
 nMSVs3hs59BgGZmqiIl7HiL2h3pvcz8EKlv7S/dhPw+Ee4objv+tJJ5xHDa+ACIdEk
 CyvlRRvE5IxN9UsSjrGThbSBYa98WdmAeEAYPL2h0gV0khgkKGt3XA0mj2Xrgw5uUO
 jSgp1pYxIZgleaOP1uPOXZcT7MktZyd54ohSZ+KiydAU80962owGgzmdHjTZsNiX8R
 D93HSzebwZWUg==
Message-ID: <sashiko-outbox-224518@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/16] drm/xe/sysctrl: Use preallocated mailbox staging
 buffers
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261120054712.377573-19-stuart.summers@intel.com>
References: <20261120054712.377573-18-stuart.summers@intel.com>
 <20261120054712.377573-19-stuart.summers@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 05:52:59 +0000
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
- [High] drm/xe: firmware mailbox hang in sysctrl_receive_frames() [1]
--

commit ee97ee7c6a82e33cb4ded6d0131b1da9156a60a6
Author: Stuart Summers <stuart.summers@intel.com>

drm/xe/sysctrl: Use preallocated mailbox staging buffers

This commit embeds preallocated request and response staging buffers into
struct xe_sysctrl, protected by cmd_lock, to avoid GFP_KERNEL allocations
when sending mailbox commands.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index f1a231dfec1e9..2af73c62d32db 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c

[ ... ]

> @@ -231,14 +221,17 @@ static int sysctrl_receive_frames(struct xe_sysctrl=
 *sc,
>  	struct xe_sysctrl_mailbox_msg_hdr *hdr;
>  	struct xe_device *xe =3D sc_to_xe(sc);
>  	size_t remain =3D sizeof(*hdr) + data_out_len;
> -	u8 *buffer __free(kfree) =3D kzalloc(remain, GFP_KERNEL);
> +	u8 *buffer =3D sc->resp_buf;
>  	size_t frame_size;
>  	bool done =3D false;
>  	int ret =3D 0;
>  	u8 *out;
> =20
> -	if (!buffer)
> -		return -ENOMEM;
> +	lockdep_assert_held(&sc->cmd_lock);
> +
> +	xe_assert(xe, data_out_len <=3D XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof=
(*hdr));
> +
> +	memset(buffer, 0, remain);
> =20
>  	out =3D buffer;
>  	while (!done && remain) {

[Severity: High]
This problem wasn't introduced by this patch, but can the receive loop in
sysctrl_receive_frames() hang the firmware mailbox state machine [1]
if the firmware sends a response payload larger than data_out_len?

When remain reaches 0 before the hardware signals completion via done, the
loop exits early and stops calling sysctrl_process_frame() to clear
SYSCTRL_MB_CTRL_RUN_BUSY_OUT.  Because the remaining frames are neither
drained nor acknowledged, the mailbox state machine stalls and subsequent
xe_sysctrl_send_command() calls time out until a device reset.

[1] https://sashiko.dev/#/bug/linux-3329046e-adfb-4ef5-8005-36eb041a2bbd

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120054712.3775=
73-18-stuart.summers@intel.com?part=3D1
