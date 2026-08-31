Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26C3C61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 11:00:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FAAE10E277;
	Mon, 31 Aug 2026 11:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dWLpNN2q";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB5910E277
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 11:00:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0AD1260213;
 Mon, 31 Aug 2026 11:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9403A1F000E9;
 Mon, 31 Aug 2026 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788174018;
 bh=8cQVbEDMzkFiKP1qG6qSlNhLxe2nzO3t3N7nemKYKbI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=dWLpNN2qRnqYKR/JLNHQIfCbbaqy6M4OL5Vh5cyUxPoMZ0D2XiZ1lYYBz/Y1caLNd
 A2glLabwGtBtr+9sB8A5r1KwTUDjfWOC86TMoHeUv3btweO9jxRx6PJHZfLjqQTN9L
 WT8Z6dPbpwRIB4inJqfb1hMxaYRCdlpARaDYgSbugungIVnuv1t3SE1tnUrmUX3VvA
 IeMqehmQS3HzDIV9BhzTELgdbro2loeYmdGfrsDyLmRpAe9H4/i3CivGVe9OkfSBZh
 kSTDbd2LMTo4Q1kRPhBW449o/kBX9gxse1TBINPJy/GtD/LXEiWEJ8nN/vUYvpJ+hF
 9PEeK+ZV3l/ZA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/9] drm/xe/sysctrl: Log group and command ID on
 mailbox failure
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-19-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-19-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:00:18 +0000
Message-Id: <20260831110018.9403A1F000E9@smtp.kernel.org>
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
- [Low] Missing xe_log.h header and xe_log_err definition causes a compilat=
ion failure.
--

commit 2afdd4e6d2ae348d6cec426e07181e76137fd2f6
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Log group and command ID on mailbox failure

This commit updates the error logging for mailbox command preparation and
execution failures to include the group ID and command code.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe=
/xe_sysctrl_mailbox.c
> index 87e6568202795..d5e391c045c60 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -353,7 +353,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>  				      cmd->data_in, cmd->data_in_len,
>  				      &mbox_cmd, &cmd_size);
>  	if (ret) {
> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> +		xe_log_err(xe, SYSCTRL, ret, "Failed to prepare command %#x.%#x\n",
> +			   group_id, command_code);

[Severity: Low]
Does this cause a build failure?=20

The xe_log_err macro and the SYSCTRL log category appear to be undeclared in
this file. Is it possible that a required include header is missing here, or
perhaps a prerequisite patch that defines these logging facilities was drop=
ped
from the series?

>  		return ret;
>  	}
> =20

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D8
