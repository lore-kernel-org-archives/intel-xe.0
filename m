Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00231C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98F910F5D3;
	Thu,  3 Sep 2026 14:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G7oe5C/3";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4610F5D3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:12:40 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id B467F60A52;
 Thu,  3 Sep 2026 14:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1001F000E9;
 Thu,  3 Sep 2026 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788444759;
 bh=DAFqskpAxdhRvRQIcbVkY58mJFDMZJhprSA+DHx6IIM=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=G7oe5C/3qm8pVZgS19cmQYc8KHit+E9LBDH1FnYFQgOjfoUNI+IDrUMJFtZ7iaV/X
 81xLPvMAKXMZBq948aU7+XqlKiGLtPHEOs9qdXQYxF5zUsj6a50QpXcGVY9JVkWYBY
 kqrg8UUZSLtZ3aUNCyRSHmqvzjC9wEDM68UQbOWwy8ESdNZRZfBNwdB2FtekDjP5nt
 nmrGD4lgI9Th/vs4hGFY137FaRV2B4GOXU/dEjNVyQrIDf8nmxB7xr1vgiLBDdM86G
 7glekHDBA+ZCHb0EV0g2ruEYANJ1aXKFSQQspzDSK2C2l9EpawFMcMU9dIPzsK4ot0
 3otDrfStiHBZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903140340.83500-10-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-10-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:12:38 +0000
Message-Id: <20260903141239.4A1001F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Unprotected state modifications to the shared xe_sysctrl_debugfs=
_entry in the mailbox debugfs read/write paths.
- [Low] The mailbox debugfs write function fails to skip empty tokens when =
parsing the group and command IDs, causing valid user input with leading or=
 consecutive whitespace to be rejected.
--

commit e5d10f0b8e0daddacee17c1115009e5b3144b469
Author: Anoop Vijay <anoop.c.vijay@intel.com>

drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
   =20
Adds a generic mailbox debugfs entry that allows any System Controller
mailbox command to be issued for bring-up and debug.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> index 258479d605cbe..e5bc0a5dc31f8 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
[ ... ]
> +static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __=
user *ubuf,
> +					size_t len, loff_t *offp)
> +{
[ ... ]
> +	tmp =3D kbuf;
> +
> +	token =3D strsep(&tmp, " \t\n");
> +	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {

[Severity: Low]
Does this code reject valid user input with leading spaces? When parsing the
group ID in xe_sysctrl_mailbox_write(), if a user executes a command like
"echo ' 1 2' > mailbox", strsep() will return an empty string for the leadi=
ng
space. This causes kstrtoul() to fail and reject the command.

> +		xe_err(xe, "sysctrl: invalid mailbox group id\n");
> +		return -EINVAL;
> +	}
> +	group =3D (u8)val;
> +
> +	token =3D strsep(&tmp, " \t\n");
> +	if (!token || kstrtoul(token, 0, &val) || val > 0xFF) {

[Severity: Low]
The same parsing issue appears here for the command ID when there are
consecutive spaces. Can these be updated to skip empty tokens, similar to h=
ow
the payload byte parsing loop handles them?

> +		xe_err(xe, "sysctrl: invalid mailbox command id\n");
> +		return -EINVAL;
> +	}
[ ... ]
> +	entry->group =3D group;
> +	entry->command =3D command;
> +
> +	xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NUL=
L, input_len,
> +				  entry->response_buf, XE_SYSCTRL_MB_MAX_MESSAGE_SIZE);
> +
> +	guard(xe_pm_runtime)(xe);
> +	entry->status =3D xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +	entry->response_len =3D entry->status ? 0 : out_len;

[Severity: Medium]
Are these shared state modifications protected against concurrent access? If
two processes concurrently execute xe_sysctrl_mailbox_write() on the mailbox
debugfs file, could it cause a data race? This might corrupt the shared
xe_sysctrl_debugfs_entry state and mix command arguments or response data
from different threads.

> +	return entry->status ? entry->status : len;
> +}
> +
> +static int xe_sysctrl_mailbox_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +	size_t i;
[ ... ]
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i =3D 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) =3D=3D 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);
> +		}

[Severity: Medium]
Similarly, this shared state is read locklessly in xe_sysctrl_mailbox_show(=
).
Could a concurrent write operation interleave during this loop and cause
inconsistent or mixed-up data to be displayed in the debugfs output?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903140340.8350=
0-6-anoop.c.vijay@intel.com?part=3D4
