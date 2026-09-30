Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9124CCA5FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 13:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501F810F40C;
	Wed, 30 Sep 2026 13:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nCU8Fjuy";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BA210F40C
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 13:44:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 317D440C4A;
 Wed, 30 Sep 2026 13:44:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA591F000FF;
 Wed, 30 Sep 2026 13:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790775895;
 bh=zNCn14RrXYBXURVM+d8qBWb2p9C1XG5euKRMB12NOaE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=nCU8FjuyeQpyka5Vm7ppGVkhawvnyEAOgXljNzcSzOvF/hHl++K+QBz66DGBz31Y7
 cHTDbGjRwRsDkNp87wnG9Wke61HNVeEuFpnPuE3DBHZHwbsR9Ah3+CvmkKr2YLNAMO
 GZVoF6+6v7B6yKmxH7+8VX7LrXOBUZpP8QmtHo4+7szVyRhO9xxgO30GW8mNibxOws
 EtX5hp4A/mFp9eVoznMfHdVaIMG0cY+UysVqjFA05xKP3bX13agkO9t3h0ZzRcSfz3
 LHaT70WLUs42vgdtylogLq3KL5P4vzTsgp7Axu8YXCMkVVUtgnIA134W15hpLMb7/O
 uIU0ufT+NCkTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] drm/xe/sysctrl: Add sysctrl debugfs
 infrastructure and loopback test interface
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260930133451.667270-6-anoop.c.vijay@intel.com>
References: <20260930133451.667270-5-anoop.c.vijay@intel.com>
 <20260930133451.667270-6-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 13:44:54 +0000
Message-Id: <20260930134454.DEA591F000FF@smtp.kernel.org>
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
- [Medium] drm/xe/sysctrl: mailbox hang due to truncated loopback response
--

commit ab3eed44be77711e6bb0819ac8607e94eabdf3d2
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Subject: drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback te=
st interface

This commit adds debugfs support for exercising the System Controller mailb=
ox
interface from userspace. It introduces the "sc/loopback" entry to send
arbitrary byte payloads to the Core group's inverted-loopback command.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> new file mode 100644
> index 0000000000000..0620a010198c5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c

[ ... ]

> +static ssize_t xe_sysctrl_loopback_write(struct file *file, const char _=
_user *ubuf,
> +					 size_t len, loff_t *offp)
> +{

[ ... ]

> +	if (input_len =3D=3D 0) {
> +		xe_err(xe, "sysctrl: no loopback payload given\n");
> +		return -EINVAL;
> +	}
> +
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  input, input_len, entry->response_buf, input_len);

[Severity: Medium]
Could passing input_len as the response_len cause a permanent mailbox hang?

If the firmware pads the loopback response such that it occupies more
16-byte frames than expected (e.g., input_len is 12, but the firmware
responds with a 16-byte payload requiring an additional frame), the
low-level mailbox routines might prematurely terminate the read loop.

In sysctrl_receive_frames(), if the hardware sends more frames than
input_len covers, the loop could exit early, leaving unread frames in
the mailbox with SYSCTRL_MB_CTRL_RUN_BUSY_OUT set. This would
permanently stall the state machine and cause all subsequent
communication to fail with -EBUSY.

Would it be safer to pass XE_SYSCTRL_MB_MAX_DATA_SIZE as the response
buffer length to safely drain any firmware response?

> +
> +	scoped_guard(mutex, &entry->lock) {
> +		guard(xe_pm_runtime)(xe);
> +		entry->status =3D xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->response_len =3D entry->status ? 0 : out_len;
> +		status =3D entry->status;
> +	}
> +
> +	return status ? status : len;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930133451.6672=
70-5-anoop.c.vijay@intel.com?part=3D1
