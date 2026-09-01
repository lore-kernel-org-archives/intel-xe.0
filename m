Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274D1C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F8610EEC9;
	Tue,  1 Sep 2026 19:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="V7gPBSRm";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07D9D10EEC9
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:38:29 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 141176025F;
 Tue,  1 Sep 2026 19:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C54A1F000E9;
 Tue,  1 Sep 2026 19:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788291507;
 bh=1VgyWrMrNgGjaucJuwSBddKy67tE+EuSkid2OuqsgKo=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=V7gPBSRmGjauJ85hYgr18ScTt93y4rNINyCkvbCzcCyaneHG1odVsGdXOjxAI2x9C
 Qu15S94rtRTmRjUORPmVK/JgzW5KmpjskonV5tvkIis83ycGpZir0kRYjQGalXrzal
 h6Iu5pr/99WHOIrOcRfP9JAofDYJkQwc4LMuvJtYVw0H2Bb3ustdPHjsUAlqIM0WEy
 4FG0rTQpQFgJkYAM9kLIKkXXQMdrUYk1NIztI6YYKM95vmpc8zbo06O7AzjEaQPkU0
 cjsMHj/oWQp6JxnFfwe8hGqYx9aUdbqJef41R7kSs60jmWi/GTDMiMTyqwVikH7vaO
 5yW/Ygw2hO1+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/18] platform/x86/intel/pmt: refactor rc with a
 return value
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-23-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-23-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:38:27 +0000
Message-Id: <20260901193827.9C54A1F000E9@smtp.kernel.org>
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
- [High] Missing error check for `pmt_crashlog_complete` in `trigger_store`=
 leads to use of uninitialized variable and dropped error codes.
- [Medium] Sysfs `show` callbacks incorrectly emit string error messages in=
to the output buffer instead of returning negative error codes, breaking th=
e sysfs ABI.
- [Medium] Logic inversion in `enable_show()` causes it to incorrectly retu=
rn the disabled state instead of the enabled state.
--

commit 812a753233238ae00d9b825c5eb2c3d208aac022
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: refactor rc with a return value

This commit refactors pmt_crashlog_rw with a return value to handle possible
failures from hardware accesses. It updates the usage of various crashlog
functions to use the new return codes.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
[ ... ]
> @@ -236,9 +238,14 @@ static ssize_t
>  clear_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> -	bool cleared =3D pmt_crashlog_cleared(crashlog);
> +	bool cleared;
> +	int ret;
> =20
> -	return sysfs_emit(buf, "%d\n", cleared);
> +	ret =3D pmt_crashlog_cleared(crashlog, &cleared);
> +	if (ret)
> +		return sysfs_emit(buf, "read error: %d\n", ret);

[Severity: Medium]
Does this break the sysfs ABI by emitting an error string into the buffer on
failure instead of returning a negative error code? Userspace applications
might see a successful read containing a string like "read error: -5\n" and
fail to parse it as an integer. This pattern seems to be repeated across
other sysfs show functions modified in this patch, such as consumed_show(),
enable_show(), error_show(), rearm_show(), and trigger_show().

> +	else
> +		return sysfs_emit(buf, "%d\n", cleared);
>  }
[ ... ]
> @@ -312,9 +332,14 @@ static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> -	bool enabled =3D !pmt_crashlog_disabled(crashlog);
> +	bool enabled;
> +	int ret;
> =20
> -	return sprintf(buf, "%d\n", enabled);
> +	ret =3D pmt_crashlog_disabled(crashlog, &enabled);
> +	if (ret)
> +		return sysfs_emit(buf, "error: %d\n", ret);
> +	else
> +		return sysfs_emit(buf, "%d\n", enabled);

[Severity: Medium]
Did the logic for the enable attribute get inverted here? The previous code
negated the result of pmt_crashlog_disabled(), but the new code assigns the
disabled state directly to the enabled variable and emits it. Should enabled
be negated before emitting?

>  }
[ ... ]
> @@ -422,7 +466,8 @@ trigger_store(struct device *dev, struct device_attri=
bute *attr,
>  	}
> =20
>  	/* we cannot trigger a new crash if one is still pending */
> -	if (pmt_crashlog_complete(crashlog))
> +	ret =3D pmt_crashlog_complete(crashlog, &complete);
> +	if (complete)

[Severity: High]
Does this code read from the complete variable without checking if the
hardware read failed? If pmt_crashlog_complete() returns an error, complete
remains uninitialized on the stack. The error code in ret is also silently
overwritten by the subsequent pmt_crashlog_set_execute() call. Should there
be an if (ret) return ret; check before evaluating complete?

>  		return -EEXIST;
> =20
>  	ret =3D pmt_crashlog_set_execute(crashlog);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D3
