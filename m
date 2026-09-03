Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20884C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35B810F5D3;
	Thu,  3 Sep 2026 14:13:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ak0EdXgI";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009F810F5D3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:13:30 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 786E760546;
 Thu,  3 Sep 2026 14:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E5941F00A3D;
 Thu,  3 Sep 2026 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788444810;
 bh=yVRnkZAhOHsjgn45q7Y4SdhuY3ifq3z58TOZ8KJ8Zac=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=ak0EdXgIH2jogo20zyafi17Pj0jg2wpXWCY7bbzgFnD28Qf3LOfNaYimSN+DFugEi
 ICjcMBShD/jk0uGf4qI5qrUTN/FpKvc5pyMtEOQsvWV9Hj4QAEQ9u43M0SpDO27Nzj
 3AmXPQZQ+YEaYTcqe3YdxzszZ9B/2EOtj/zNL+Fx3W2IolSx7SfKhdnAbh3PKWWB1p
 Oq2WXBOF8th+0TrCkNd0SKhCERbmFFSAOrRto1jpj1CXa6LDAMqCs9XkCzP01tX3M+
 ho8rrn/ffse4pIHB4ooGwDUw6/Qlw3p3UttwHQ3F/Ih4TPTRaCO/Wc5zVBABYDqIk/
 3a0jPCcJUOqgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] drm/xe/sysctrl: Add RAS error injection debugfs
 interface
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903140340.83500-9-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:13:29 +0000
Message-Id: <20260903141330.0E5941F00A3D@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing PM runtime resume before accessing hardware in debugfs ope=
n and show callbacks causes system hangs.
- [Low] Jumping over a `guard()` declaration using `goto` causes compilatio=
n errors and violates cleanup subsystem rules.
- [Low] Concurrent writes to the debugfs file will race on `entry->status`,=
 causing the `write` syscall to return the result of another thread's comma=
nd.
--

commit 69962a1ffd2b865557dbedee272e0256b239b328
Author: Anoop Vijay <anoop.c.vijay@intel.com>
drm/xe/sysctrl: Add RAS error injection debugfs interface

This commit adds a debugfs interface for exercising the System Controller's
RAS error injection command. The command is used to validate RAS error
detection and recovery paths, and its access is gated on the diagnostic
firmware being ready.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> index 2144d9d43fba5..258479d605cbe 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
[ ... ]
> @@ -122,6 +123,127 @@ static const struct file_operations xe_sysctrl_loop=
back_fops =3D {
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file, cons=
t char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
[ ... ]
> +	tmp =3D kbuf;
> +	while ((token =3D strsep(&tmp, " \t\n")) !=3D NULL) {
> +		if (*token =3D=3D '\0')
> +			continue;
> +
> +		if (kstrtoul(token, 0, &val))
> +			goto inval;
[ ... ]
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  &req, sizeof(req), resp_hdr_only,
> +				  sizeof(resp_hdr_only));
> +
> +	guard(xe_pm_runtime)(xe);
> +	entry->status =3D xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +
> +	return entry->status ? entry->status : len;

[Severity: Low]
Can concurrent writes race on the shared entry->status field here?

Because multiple threads can write to the ras_error_inject debugfs file at
the same time, Thread A's status could be overwritten by Thread B before
Thread A returns. This would cause an incorrect syscall return value for one
of the threads. Could this status be stored in a local variable instead of
the shared entry struct?

> +
> +inval:
> +	xe_err(xe, "sysctrl: invalid ras_error_inject token '%s'\n", token);
> +	return -EINVAL;

[Severity: Low]
Does this goto inval branch jump over the guard(xe_pm_runtime)(xe)
initialization?

Jumping into the scope of a variable declared with __attribute__((cleanup))
leaves it uninitialized, causing the cleanup function to execute on garbage
memory when returning. GCC and Clang will typically reject this with a build
error. This also violates the kernel cleanup subsystem guidelines against
mixing goto and guard() in the same function.

> +}
> +
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void *da=
ta)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +	struct xe_device *xe =3D sc_to_xe(entry->sc);
> +
> +	seq_printf(m, "Command: group=3D0x%02x cmd=3D0x%02x\n", entry->group, e=
ntry->command);
> +	seq_printf(m, "Diag firmware ready: %s\n",
> +		   str_yes_no(xe_sysctrl_is_diag_fw_ready(xe)));

[Severity: High]
Does checking xe_sysctrl_is_diag_fw_ready(xe) here access hardware MMIO
without first resuming the device?

The xe_sysctrl_is_diag_fw_ready() function sends a mailbox command, which
uses guard(xe_pm_runtime_noresume). Without a prior xe_pm_runtime_get_sync()
(which is correctly used in the .write callback via guard(xe_pm_runtime)),
accessing this when the GPU is in D3cold can cause a system hang or abort.

> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAIL=
ED" : "SUCCESS");
> +
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras_block_id> <ras_sub_block_id> <err_type> [par=
ams]\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject\n");
> +
> +	return 0;
> +}
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct =
file *file)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry =3D inode->i_private;
> +	struct xe_device *xe =3D sc_to_xe(entry->sc);
> +
> +	if (!xe_sysctrl_is_diag_fw_ready(xe)) {

[Severity: High]
Are we also missing a PM runtime resume here in the open callback?

Similar to the .show callback above, this calls xe_sysctrl_is_diag_fw_ready=
()
which issues an MMIO command. A user opening this file when the device is
suspended could trigger a hang.

> +		xe_err(xe, "sysctrl: diag firmware not ready, ras_error_inject unavail=
able\n");
> +		return -ENODEV;
> +	}
> +
> +	return single_open(file, xe_sysctrl_ras_error_inject_show, inode->i_pri=
vate);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903140340.8350=
0-6-anoop.c.vijay@intel.com?part=3D3
