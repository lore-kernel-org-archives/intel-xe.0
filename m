Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FCCC98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 14:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A1310FADB;
	Fri, 25 Sep 2026 14:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BvPnOVK2";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF2810FADB
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 14:05:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7FFBF60136;
 Fri, 25 Sep 2026 14:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C46F1F000FF;
 Fri, 25 Sep 2026 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790345120;
 bh=tvHQhJcp108u9TbtLyiQy1nHaell83ptmM0DX0uHk8w=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=BvPnOVK2nRruENu7SQSPsTOqylGhZKrW6EQhBzlHyL00wuQOYjvEuvmwKHzdBxqN3
 wkt2ZmH9gnWCK4OIIz/+f7do075ULaiahDzmQjBd7eKo0e+kAIUK+fzbyVgmU0yhKr
 2iYosNRKz5EYgGF4yDzm62hwRt6+hgR8MIXfh42zbmewiQUu7duvfGK4x0okgrN/qT
 AFx1p4HkPpAwas7dT3K9Gra1rdGgWKTRycNT8Hcmg0crMNDlGZosS1YGCyOwtWnLkg
 6yn36O4BQMafoWKY0Cyxs6oXcSche9xzN9A/n9sQqmraIxsUzk8Wn6GVkXCv7QprxH
 aJC8S8SfNZbKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] drm/xe/sysctrl: Add generic mailbox passthrough
 debugfs entry
To: =?utf-8?b?QW5vb3AsIFZpamF5?= <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925135521.1804299-8-anoop.c.vijay@intel.com>
References: <20260925135521.1804299-5-anoop.c.vijay@intel.com>
 <20260925135521.1804299-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 14:05:19 +0000
Message-Id: <20260925140520.0C46F1F000FF@smtp.kernel.org>
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
- [Medium] drm/xe/sysctrl: resplen=3D0 triggers kernel warning in mailbox d=
ebugfs
- [Low] drm/xe/sysctrl: debugfs write parsing fails with multiple spaces
--

commit f1b559774e8c577604cfb968a849e4f8ab4d694e
Author: Anoop Vijay <anoop.c.vijay@intel.com>

    drm/xe/sysctrl: Add generic mailbox passthrough debugfs entry
   =20
    Add a "mailbox" debugfs entry that allows any System Controller
    mailbox command to be issued for bring-up and debug. group and
    command are supplied by the caller as the first two tokens of every
    write, followed by optional per-command response timeout and
    response-length overrides and the payload bytes:

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe=
/xe_sysctrl_debugfs.c
> index 10675cd774ee1..ba904cb245124 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
[ ... ]
> +static ssize_t xe_sysctrl_mailbox_write(struct file *file, const char __=
user *ubuf,
> +					size_t len, loff_t *offp)
> +{
[ ... ]
> +	if (token && strstarts(token, "timeout=3D")) {
> +		if (kstrtouint(token + strlen("timeout=3D"), 0, &timeout_ms) ||
> +		    timeout_ms > XE_SYSCTRL_MB_MAX_TIMEOUT_MS) {
> +			xe_err(xe, "sysctrl: invalid mailbox timeout (max %u ms)\n",
> +			       XE_SYSCTRL_MB_MAX_TIMEOUT_MS);
> +			return -EINVAL;
> +		}
> +		token =3D strsep(&tmp, " \t\n");
> +	}
> +
> +	if (token && strstarts(token, "resplen=3D")) {

[Severity: Low]
Could the token parsing in xe_sysctrl_mailbox_write() fail if there are
multiple spaces between the timeout=3D and resplen=3D arguments?

Since strsep() is only called once after parsing the timeout argument,
multiple spaces would result in an empty token being evaluated here.

This would cause the strstarts(token, "resplen=3D") check to fail and
potentially treat the optional argument as payload data instead.

> +		unsigned int resplen;
> +
> +		if (kstrtouint(token + strlen("resplen=3D"), 0, &resplen) ||
> +		    resplen > XE_SYSCTRL_MB_MAX_DATA_SIZE) {
> +			xe_err(xe, "sysctrl: invalid mailbox resplen (max %zu bytes)\n",
> +			       (size_t)XE_SYSCTRL_MB_MAX_DATA_SIZE);
> +			return -EINVAL;
> +		}
> +		resp_len =3D resplen;
> +		token =3D strsep(&tmp, " \t\n");
> +	}
[ ... ]
> +	scoped_guard(mutex, &entry->lock) {
> +		entry->group =3D group;
> +		entry->command =3D command;
> +		entry->timeout_ms =3D timeout_ms;
> +
> +		xe_sysctrl_create_command(&cmd, group, command, input_len ? input : NU=
LL, input_len,
> +					  entry->response_buf, resp_len);

[Severity: Medium]
If a user writes a mailbox command with resplen=3D0 via debugfs, does this
introduce a regression that triggers a kernel warning?

The entry->response_buf array pointer is passed unconditionally as the
response buffer to xe_sysctrl_create_command().

This causes cmd.data_out to be non-NULL, while cmd.data_out_len is 0.

Later in xe_sysctrl_send_command(), this would fail the assertion:
xe_assert(xe, !cmd->data_out || cmd->data_out_len);

> +		cmd.timeout_ms =3D timeout_ms;
> +
> +		guard(xe_pm_runtime)(xe);
> +		status =3D xe_sysctrl_send_command(entry->sc, &cmd, &out_len);
> +		entry->status =3D status;
> +		entry->response_len =3D status ? 0 : out_len;
> +	}
> +
> +	return status ? status : len;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925135521.1804=
299-5-anoop.c.vijay@intel.com?part=3D3
