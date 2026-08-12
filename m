Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8206BC5DF66
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 22:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A5A10F145;
	Wed, 12 Aug 2026 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="anEKCeic";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9C110E452
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 19:49:06 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 707C44360F;
 Wed, 12 Aug 2026 19:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AB51F000E9;
 Wed, 12 Aug 2026 19:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786564146;
 bh=mIiYCyunHSAru4MR+UWnqBBkttfdqRgo+95iD8ilCBc=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=anEKCeicrCRn4Q+6f0m1J8yPclz8t1Q+WbhPGWLlwG4P+qyYldrrSoU4DOT146jFs
 iO7F3jMGKEtGi1A6JzKJ8FIw3YtGgCJlcDGgTOt2GoJVZvBiHqZqEOW9IdhlrIHhOH
 jd4WCCj0vnmf2eSzcbNxWWnXpIVN4EOMeoAUKJUsVJF5t4C0AcibI9MAFKsCeC4y0t
 253zmoFhd7834Ex+E3u0Suh7tJFgXSCHXfZvNSLItMoCyc6GOqtWg2H27/pSYlLW5c
 YXrvdftYIzHKRyg0jbgueodkb/VoLNckhzOf/adbpUgqHfkW3QB/4hlD8I7ar1c0OC
 Ia+0Kfe9fUfGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 02/10] platform/x86/intel/pmt: Add register access
 callbacks
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260812193742.2170188-14-michael.j.ruhl@intel.com>
References: <20260812193742.2170188-12-michael.j.ruhl@intel.com>
 <20260812193742.2170188-14-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:49:05 +0000
Message-Id: <20260812194906.29AB51F000E9@smtp.kernel.org>
X-Mailman-Approved-At: Wed, 12 Aug 2026 22:17:09 +0000
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
- [Medium] Missing error propagation in pmt_crashlog_rmw and pmt_crashlog_r=
c when register callbacks fail.
--

--- Patch [2]: [PATCH v2 02/10] platform/x86/intel/pmt: Add register access=
 callbacks ---
commit 63beb7f9cb719c6439cef978b14d03ae4aa7a626
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: Add register access callbacks

This commit augments the PMT callback infrastructure to allow registered
drivers to customize read and write access to the control paths.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index f936daf99e4d2..5923ad7abbd98 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -129,7 +129,19 @@ static void pmt_crashlog_rmw(struct crashlog_entry *=
crashlog, u32 bit, bool set)
>  {
>  	const struct crashlog_control *control =3D &crashlog->info->control;
>  	struct intel_pmt_entry *entry =3D &crashlog->entry;
> -	u32 reg =3D readl(entry->disc_table + control->offset);
> +	u32 guid =3D entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb && entry->cb->read_reg) {
> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return;

[Severity: Medium]
Should pmt_crashlog_rmw() be updated to return an int so that this error co=
de
can be propagated to the caller?=20

Since it currently returns void, any sysfs write handlers that trigger this
path will silently swallow the error and falsely report success to userspac=
e if
the underlying hardware access fails.

> +		}
> +	} else {
> +		reg =3D readl(entry->disc_table + control->offset);
> +	}

[ ... ]

> -	writel(reg, entry->disc_table + control->offset);
> +	if (entry->cb && entry->cb->write_reg) {
> +		err =3D entry->cb->write_reg(entry->dev, guid, reg, control->offset);
> +		if (err) {
> +			pr_err("%s: failed to write reg: %d\n", __func__, err);
> +			return;

[Severity: Medium]
Similarly, should the error code be propagated here rather than returning
without notifying the caller of the failure?

> +		}
> +	} else {
> +		writel(reg, entry->disc_table + control->offset);
> +	}
>  }
> =20
>  /* Read the status register and see if the specified @bit is set */
>  static bool pmt_crashlog_rc(struct crashlog_entry *crashlog, u32 bit)
>  {
>  	const struct crashlog_status *status =3D &crashlog->info->status;
> -	u32 reg =3D readl(crashlog->entry.disc_table + status->offset);
> +	struct intel_pmt_entry *entry =3D &crashlog->entry;
> +	u32 guid =3D entry->header.guid;
> +	u32 reg;
> +	int err;
> +
> +	if (entry->cb && entry->cb->read_reg) {
> +		err =3D entry->cb->read_reg(entry->dev, guid, &reg, status->offset);
> +		if (err) {
> +			pr_err("%s: failed to read reg: %d\n", __func__, err);
> +			return false;

[Severity: Medium]
Is returning false the correct behavior when the read callback fails?=20

This masks the error code from the caller and treats the read failure as if
the bit is unset. This could lead to incorrect evaluations, for example cau=
sing
sysfs read handlers to return an inaccurate hardware state. Should we propa=
gate
the error instead?

> +		}
> +	} else {
> +		reg =3D readl(crashlog->entry.disc_table + status->offset);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812193742.2170=
188-12-michael.j.ruhl@intel.com?part=3D2
