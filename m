Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CD2C624D0
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 19:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCB810EEEC;
	Tue,  1 Sep 2026 19:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VvI4DF1F";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AD410EF01
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Sep 2026 19:45:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 39A7943CC5;
 Tue,  1 Sep 2026 19:45:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A71F000E9;
 Tue,  1 Sep 2026 19:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788291913;
 bh=Byups0tXpFyYet4eWIfcIySkm7dzvtrb/397dVrXgBA=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=VvI4DF1F7ZaT6HJ7aqKzn2+donjyt38z/CiYrCkuMowZyZtP8O4ReOMJqYZLYw55n
 yyzrE725KSey+2AQKuIZS6VqmHjCX0NMm4g1cS4LV370pqXxM9TwHo5L45BUupLdcM
 7D8RJNwU8xKKIsO5oTQysGSbbCsuqFk+2Ruu1EuCOK6addLEtL5gNxzdCmP/Yb4YUI
 ADVM/jP5AgS1eY2qnBlxMue19JxQQUyo19Nj8qWLWiQUeI3OpSrCQRd9h5+qjO+4PW
 4UY8x+9LNKmjPjiDwCwNhZkNhMtbAdGr7MNuJ/HrWfvH4BJlbKGMZzM1n9r6uh5KSb
 78fcWlE27qDfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/18] platform/x86/intel/pmt: Add register access
 callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260901192736.626777-24-michael.j.ruhl@intel.com>
References: <20260901192736.626777-20-michael.j.ruhl@intel.com>
 <20260901192736.626777-24-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 19:45:12 +0000
Message-Id: <20260901194512.E53A71F000E9@smtp.kernel.org>
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
- [High] In `pmt_crashlog_rc()`, an error from `pmt_crashlog_read_reg()` in=
correctly returns `false` (which evaluates to integer `0`) instead of propa=
gating the error code. This tricks callers into assuming the operation succ=
eeded, leading to the use of uninitialized stack variables.
--

commit e8f90b7603dd0762e0fc5325b88546ddb36185c1
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Add register access callbacks

Some HW does not have direct MMIO access to PMT control and data
features. Augment the current callback infrastructure to allow a
registered driver to customize read/write access.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
[ ... ]
> @@ -147,7 +181,13 @@ static int pmt_crashlog_rmw(struct crashlog_entry *c=
rashlog, u32 bit, bool set)
>  static int pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit, boo=
l *state)
>  {
>  	const struct crashlog_status *status =3D &crashlog->info->status;
> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
> +	u32 reg;
> +	int ret;
> +
> +	ret =3D pmt_crashlog_read_reg(entry, &reg, status->offset);
> +	if (ret)
> +		return false;

[Severity: High]
Does returning false here incorrectly mask the error code as success?

The function pmt_crashlog_rc() returns an int. Returning false evaluates to
0, which tricks callers into thinking the register read was successful.

For example, when a sysfs attribute calls clear_show():

drivers/platform/x86/intel/pmt/crashlog.c:clear_show() {
    bool cleared;
    int ret;

    ret =3D pmt_crashlog_cleared(crashlog, &cleared);
    if (ret)
        return sysfs_emit(buf, "read error: %d\n", ret);
    else
        return sysfs_emit(buf, "%d\n", cleared);
}

If pmt_crashlog_read_reg() fails and returns an error code, ret will be 0,
and sysfs_emit() will leak the uninitialized stack variable cleared to
userspace.

A similar issue occurs in trigger_store(), where the code will branch on an
uninitialized disabled variable if the register read fails. Should this
instead propagate the ret value?

> =20
>  	*state =3D !!(reg & bit);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901192736.6267=
77-20-michael.j.ruhl@intel.com?part=3D4
