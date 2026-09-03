Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A47C624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:19:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39ECE10E256;
	Thu,  3 Sep 2026 20:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ckji3UoY";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C068110E256
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:19:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 69A69412BC;
 Thu,  3 Sep 2026 20:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C40E1F00A3D;
 Thu,  3 Sep 2026 20:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788466767;
 bh=Q+TFQ4p4bOTeLZw077XDf72rQ4DOGQiCar/x/lonzIE=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Ckji3UoYX0S1/NvNdeAFF+9yw8j7M5s+lSu3/i87W60llrGJbvRCxPAFXOSRmsTpT
 kcLnyCxKquBbY4uec753wrurRMejBKcqvbDgUfLmy5/VDqH5vImHHZlWoA2vgKGyO2
 urbpeyL4I++/J/eh4IHftg4bg8FEGwhxnEwvdUOMRXb4ufq1bNmtk7DUJXmnWFcauK
 OLniwtAb5cIFtjGQEiIJd3g2ZnnveJCKmO8RQU+5BMTZQloyHClW/knkpW0+s9OqMU
 YFUBlq7umR+TTuWZnFWym5D2SnCZ0ijXs9+lSge67oQI9fzMiSFBFNtmFLd2LskjPc
 FszL/H/sLmOnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/18] platform/x86/intel/pmt: refactor rc with a
 return value
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-23-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-23-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:19:26 +0000
Message-Id: <20260903201927.2C40E1F00A3D@smtp.kernel.org>
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
- [Medium] Inverted logic in `enable_show` causes the sysfs attribute to ou=
tput 1 when the device is disabled and 0 when it is enabled.
--

commit 861c9b2ba4669926e83219067272a187332bb551
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

platform/x86/intel/pmt: refactor rc with a return value

Upcoming changes will include possible failures from HW accesses.
Refactor pmt_crashlog_rw() with a return value.
Update all necessary usage to use the return code.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index 831cff743803e..808f2b695a7f7 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c

[ ... ]

> @@ -312,9 +332,14 @@ static ssize_t
>  enable_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
> -	bool enabled =3D !pmt_crashlog_disabled(crashlog);
> +	bool enabled;
> +	int ret;
> +
> +	ret =3D pmt_crashlog_disabled(crashlog, &enabled);
> +	if (ret)
> +		return ret;
> =20
> -	return sprintf(buf, "%d\n", enabled);
> +	return sysfs_emit(buf, "%d\n", enabled);

[Severity: Medium]
Does this code invert the logic for the enable sysfs attribute?

Looking at enable_show() in drivers/platform/x86/intel/pmt/crashlog.c,
pmt_crashlog_disabled() populates the enabled variable with the hardware's
disabled state (true if disabled, false if enabled).

Because the value is no longer negated like the original code
(!pmt_crashlog_disabled(crashlog)), reading the enable sysfs file will
incorrectly output 1 when the device is disabled and 0 when it is enabled.

>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D3
