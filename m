Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B557DCA9ED0
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 02:26:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 755E910E6F3;
	Tue, 13 Oct 2026 02:26:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AAD10E6F3
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 02:25:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E8321600D1;
 Tue, 13 Oct 2026 02:25:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 446B31F000FF;
 Tue, 13 Oct 2026 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791858357;
 bh=YbfrR2OG2ZWXHjxEwhrvqcQT93AYpiLkGMS+6tmw+Rc=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=JDOqWuMHUdyOwhxHNPZNStOXgrT2s3njRe+JYF8i4tmMg/UDmplvMws5guUZg3YDy
 giqopHPDQ7H5ZMn2ayfacukVMf8jE5SNUzVjkmIfwGJcFrkrPwvw1BirEBcfi/L8j/
 lgRWTtg9nKRwm9n8iRyPN/xkhAmLerK1BmCukHuRVRcHIa2lNFyXBkoJD5ZowieuC1
 CgxIPoxjqoynrJjRZUw+ezBapGgp8+WmjS3iXL4Y6Zkxr2X4OPCVvyUGFKRWYjkUym
 gyrYWWZf0NBWhc2tQdtmMwMwrlrXkvIol3EuWSAAthU/gcoonOvgB7aBckutY/SOPT
 wrcYmizVX7GIA==
Message-ID: <sashiko-outbox-168872@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 15/16] drm/xe: Validate thermal sensor count before
 reads
To: "Karthik Poosa" <karthik.poosa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20261013020636.447620-16-karthik.poosa@intel.com>
References: <20261013020636.447620-1-karthik.poosa@intel.com>
 <20261013020636.447620-16-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 02:25:56 +0000
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
- [Medium] drm/xe/hwmon: memory controller temperature incorrectly averages=
 PCIe sensor
--

commit 560df9ca7dd177faf766f62db4da531e993c1514
Author: Karthik Poosa <karthik.poosa@intel.com>

drm/xe: Validate thermal sensor count before reads

This commit adds boundary checks to verify that READ_THERMAL_CONFIG reports
enough entries for the platform-specific memory controller and PCIe sensor
indices before attempting to read thermal data.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7311f969f574f..702c739c9bf0a 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -920,6 +920,13 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long =
*val)
>  		end =3D hwmon->temp.count - 1;
>  	}
> =20
> +	if (end <=3D start || end > hwmon->temp.count) {
> +		drm_warn(&hwmon->xe->drm,
> +			 "memory controller range [%d, %d) is invalid for temperature count %=
d\n",
> +			 start, end, hwmon->temp.count);
> +		return -ENODATA;
> +	}
> +

[Severity: Medium]
If the firmware reports a thermal config count such that hwmon->temp.count =
- 1
exceeds the hardcoded PCIe sensor index, will get_mc_temp() mistakenly aver=
age
the PCIe sensor into the memory controller temperature?

While the validation added here allows hwmon->temp.count - 1 to be larger t=
han
the PCIe sensor index, get_mc_temp() statically bounds its loop using
end =3D hwmon->temp.count - 1. This could force the memory controller loop =
to
iterate past the intended MCTRL range and consume the PCIe sensor located at
that index:

    for (i =3D start; i < end; i++) {
        if (!mbx_temp_valid(hwmon, hwmon->temp.value[i]))
            continue;
        average +=3D mbx_temp_decode(hwmon->temp.value[i]);
        count++;
    }

Should end be explicitly capped at xe_hwmon_pcie_temp_index(hwmon) when
calculating the memory controller average to prevent polluting the statisti=
cs
with out-of-range sensors?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013020636.4476=
20-1-karthik.poosa@intel.com?part=3D15
