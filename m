Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08E7C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 14:13:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A218410F5D3;
	Thu,  3 Sep 2026 14:13:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jdxciZk8";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA0710F5D3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 14:13:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E33DF6053C;
 Thu,  3 Sep 2026 14:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5811F00AC4;
 Thu,  3 Sep 2026 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788444836;
 bh=gkuBwdZrTjxZzk5+CD1rRG+SEf6z8D/ZmHhPrWrVJ1A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=jdxciZk8ksJdFZyJurfKhpZlf1IvYnwGdZZuM2XwYLnBhD3KHiexSHkXv+XciLpCE
 UxSYBl32eSGSLr/d0IgntcMNOyvYtpvjLU5iO3ZKpHFMbPoOk534TWEun4A35/L8Nj
 A4ZTc7Q3TBQR9Fj9qR6v8NP3xX9n9qH585I61AZT20tYXL8Eagm4+D5BfrJBGW0D7l
 TF9hHY0Ht+NWpIlM8Xt/MPmqdrz4WF4hz3cnApuLZz9jAEKb7lIm5e2zY1y3ZL1bQZ
 HUTPgvCxLLd2b/oWD8P5S7aYjEHYQAX3Qub01Qd8V6rNkGJNPMVx3RDTpqJpmvL2rQ
 /hfN5V+VwE67A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] drm/xe/sysctrl: Add sysctrl debugfs
 infrastructure and loopback test interface
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903140340.83500-8-anoop.c.vijay@intel.com>
References: <20260903140340.83500-6-anoop.c.vijay@intel.com>
 <20260903140340.83500-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 14:13:56 +0000
Message-Id: <20260903141356.6F5811F00AC4@smtp.kernel.org>
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
- [Medium] Concurrent reads and writes to the loopback debugfs entry cause =
data races and expose inconsistent state.
--

commit b7da09a9e8ead758b95d7f60c29e7f7b90c922ce
Author: Anoop Vijay <anoop.c.vijay@intel.com>
Subject: drm/xe/sysctrl: Add sysctrl debugfs infrastructure and loopback te=
st interface

This commit adds debugfs support for exercising the System Controller mailb=
ox
interface from userspace. It introduces the sc/loopback entry which sends an
arbitrary byte payload to the Core group's inverted-loopback command.

[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> new file mode 100644
> index 0000000000000..2144d9d43fba5
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -0,0 +1,157 @@
[ ... ]
> +static ssize_t xe_sysctrl_loopback_write(struct file *file, const char _=
_user *ubuf,
> +					 size_t len, loff_t *offp)
> +{
[ ... ]
> +	xe_sysctrl_create_command(&cmd, entry->group, entry->command,
> +				  input, input_len, entry->response_buf, input_len);
> +
> +	guard(xe_pm_runtime)(xe);
> +	entry->status =3D xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +	entry->response_len =3D entry->status ? 0 : out_len;

[Severity: Medium]
Does this code leave the shared debugfs entry fields vulnerable to data rac=
es
if multiple userspace processes write to the loopback file concurrently?

It appears that entry->status, entry->response_len, and entry->response_buf
are modified here directly without any synchronization protecting the entry
structure itself, as sc->cmd_lock inside xe_sysctrl_send_command() only
serializes the hardware mailbox sequence.

> +
> +	return entry->status ? entry->status : len;
> +}
> +
> +static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)
> +{
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +	size_t i;
> +
> +	seq_printf(m, "Command: group=3D0x%02x cmd=3D0x%02x\n", entry->group, e=
ntry->command);
> +	seq_printf(m, "Status: %d (%s)\n", entry->status, entry->status ? "FAIL=
ED" : "SUCCESS");
> +	seq_printf(m, "Response: %zu bytes\n", entry->response_len);
> +
> +	if (entry->response_len) {
> +		seq_puts(m, "Response data:\n");
> +		for (i =3D 0; i < entry->response_len; i++) {
> +			if (i && (i % 16) =3D=3D 0)
> +				seq_putc(m, '\n');
> +			seq_printf(m, "%02x ", entry->response_buf[i]);

[Severity: Medium]
Can a concurrent write to the loopback file cause torn reads or inconsistent
state to be returned here?=20

Since the entry fields are read locklessly, it seems possible to observe a =
new
buffer's contents alongside an old buffer's length, or a mismatched status,
returning garbage diagnostic output to userspace.

> +		}
> +		seq_putc(m, '\n');
> +	}
> +
> +	return 0;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903140340.8350=
0-6-anoop.c.vijay@intel.com?part=3D2
