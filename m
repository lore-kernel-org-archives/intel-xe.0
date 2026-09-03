Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 983EDC624A4
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD8710E123;
	Thu,  3 Sep 2026 14:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OwcLcRLK";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA5E010E123
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:16:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 0CB7460A56;
 Thu,  3 Sep 2026 14:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA091F00AC4;
 Thu,  3 Sep 2026 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788444972;
 bh=fgYzgBqbBUipXAQh0dXDsxc1+RlTlzLEFZYoxejGeDs=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=OwcLcRLKjiujf2lyqJiH3FqafpBosnuZYFPmtO4vL5zHUH4plMt/GZegn0GJyFdu8
 cYmbpkBX/87ucTZ+xuPnjXjQn1T9C2E2bRf0WKLDIvSZi7dzY/dTmkKkuPBKOUXRtu
 aWnsVOq3nTQzA6kzdVy0DSPuBh/Y/htOvHrLFdI7bNEhdVOY6TdRn78oRiEui1Wkx0
 w1pfd51DR+/kQkHxvEtuA8dnVTf2AHV4Prc31Q0LBlyVQnzHVqtJ1lFHyCGh8XZROf
 ZyW0oKej8PofqzIK5puUhnVimkjF6GaRn3ZwOq6VNfMYKxrjMHZuSs2/FJnlg1oK/O
 RvqKSFqDA6Erg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] drm/xe/sysctrl: Add System Controller get
 application status
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903140340.83500-7-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-7-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:16:12 +0000
Message-Id: <20260903141612.8CA091F00AC4@smtp.kernel.org>
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

Pre-existing issues:
- [High] If the firmware responds with more data than expected, `sysctrl_re=
ceive_frames()` exits its read loop early, permanently hanging the mailbox =
state machine.
--

commit b13ca50e46d24c8dd84b548f2ea15d17ffc919a8
Author: Anoop Vijay <anoop.c.vijay@intel.com>

drm/xe/sysctrl: Add System Controller get application status

Add support for querying System Controller firmware application
status. This allows callers to determine whether a given firmware
application has completed boot and post-boot initialization.

Link: https://lore.kernel.org/intel-xe/20260814095306.2482289-5-anoop.c.vij=
ay@intel.com/
Link: https://lore.kernel.org/intel-xe/20260814095306.2482289-6-anoop.c.vij=
ay@intel.com/

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysc=
trl.c
> index 62ccc9be71b45..5da591ade4e4b 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c

[ ... ]

> @@ -125,3 +127,83 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
> =20
>  	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>  }
> +
> +static enum xe_sysctrl_fw_status
> +xe_sysctrl_check_app_status(struct xe_device *xe, enum xe_sysctrl_app_id=
 app_id)
> +{
> +	struct xe_sysctrl_app_status_req req =3D {};
> +	struct xe_sysctrl_app_status_resp resp =3D {};
> +	struct xe_sysctrl_mailbox_command cmd =3D {};
> +	size_t out_len =3D 0;
> +	u32 flags;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_SYSCTRL_FIRMWARE_APP_NOTSUPP;
> +
> +	req.app_id =3D (u8)app_id;
> +
> +	xe_sysctrl_create_command(&cmd, XE_SYSCTRL_GROUP_CORE, XE_SYSCTRL_CMD_G=
ET_APP_STATUS_BY_ID,
> +				  &req, sizeof(req), &resp, sizeof(resp));
> +
> +	ret =3D xe_sysctrl_send_command(&xe->sc, &cmd, &out_len);

[Severity: High]
This isn't a bug introduced by this patch, but calling
xe_sysctrl_send_command() here exposes a pre-existing severe logic flaw in
the mailbox protocol handler.

If the firmware responds to this command with more data than expected, the
driver will permanently hang the mailbox state machine.

In drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:sysctrl_receive_frames():

	while (!done && remain) {
		frame_size =3D min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);

		ret =3D sysctrl_process_frame(sc, out, frame_size, timeout_ms,
					    &done);
		if (ret)
			return ret;

		remain -=3D frame_size;
		out +=3D frame_size;
	}

If the response payload is larger than the requested data_out_len,
sysctrl_receive_frames() strictly bounds its read loop by remain. When
remain drops to 0, the loop terminates before done is set.

This causes the host to stop reading the remaining frames and stop clearing
SYSCTRL_MB_CTRL_RUN_BUSY_OUT. The firmware is left waiting indefinitely
for the host to acknowledge the next frame, which will cause all subsequent
mailbox commands to time out or corrupt the mailbox state.

Does this need to be fixed in sysctrl_receive_frames() to properly drain
unexpected trailing data instead of abandoning the transaction?

> +	if (ret)
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +
> +	if (out_len !=3D sizeof(resp)) {
> +		xe_err(xe, "sysctrl: unexpected get app status response length %zu (ex=
pected %zu)\n",
> +		       out_len, sizeof(resp));
> +		return XE_SYSCTRL_FIRMWARE_COMM_FAILURE;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903140340.8350=
0-6-anoop.c.vijay@intel.com?part=3D1
