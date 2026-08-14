Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F91C5CFCF
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 17:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB71010F6B5;
	Fri, 14 Aug 2026 17:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PMqPmvR9";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F15010F6B5
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 17:26:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 6A5FD60008;
 Fri, 14 Aug 2026 17:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963141F000E9;
 Fri, 14 Aug 2026 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1786728413;
 bh=pTvbR4jRc6fQpcEk2xu7KRKFN3TUOuSdhruSvOh88bw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=PMqPmvR9z+gkyCVW7kJZ1U8NNYcR29cI57X2n1zITd0uXOmj+IDzb2Z/hZ2sFJV0J
 Io3NyRE6bCtwLi9qkqhqyJmqng1vqaKDjox2oA6g/cIGesnHbUsGX9hqeXUAX/zTBn
 kSldxjo73e/KiSoisEzt7q1u8SWa7QMwYtOTBZfAn+6Y5oFOlutfUOxNFVODXzjrE2
 RaL6dNiWKcvMe1jCAc0T8yGis58IcgrqQPVapQ7Fn8PQjqZW311grc8PbiWOHwEepn
 4oIoEqqfo6RnMwu8c0UpCGpz0VWhpFpGy9CkuGWz9N0HKtEdH6S5MV+V1HUUdXTElX
 9npwck2qibaqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 20/33] drm/xe/survivability: Report 'boot status'
 using SIGID
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260814171801.13347-21-michal.wajdeczko@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-21-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 17:26:51 +0000
Message-Id: <20260814172652.963141F000E9@smtp.kernel.org>
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

Pre-existing issues:
- [High] Potential infinite loop in `populate_survivability_info()` due to =
unvalidated hardware-provided linked list.
--

--- Patch [20]: [PATCH v5 20/33] drm/xe/survivability: Report 'boot status'=
 using SIGID ---
commit 777c3378750db72921a668da05900b90d4fd8d8e
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>

drm/xe/survivability: Report 'boot status' using SIGID

This commit updates the driver to report 'boot status' and other scratch
register details using the xe_log_info() macros. It also adds a helper to
decode the boot status code and changes the pdev parameter to xe.

> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm=
/xe/xe_survivability_mode.c
> index 4c506027fa94c..0ace10ae500af 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
[ ... ]
> @@ -172,18 +173,32 @@ static void populate_survivability_info(struct xe_d=
evice *xe)
>  	}
>  }

[Severity: High]
This is a pre-existing issue, but is there a risk of an infinite loop in
populate_survivability_info() if the hardware returns a cyclic linked list?

Looking at the loop that traverses the aux info registers just above this
point in the function:

	if (reg_value & AUXINFO_SUPPORT) {
		for (id =3D REG_FIELD_GET(AUXINFO_REG_OFFSET, reg_value);
		     id >=3D AUX_INFO0 && id < MAX_SCRATCH_REG;
		     id =3D  REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, info[id]))
			set_survivability_info(mmio, info, id);
	}

If the PCODE firmware returns a value in AUXINFO_HISTORY_OFFSET that points
to the current register index or creates a cycle among the registers, could
this loop run indefinitely without a limit to the iteration count?=20

An infinite loop here might result in a kernel thread hang during device
probe.

> -static void log_survivability_info(struct pci_dev *pdev)
> +static const char *boot_status_str(u8 boot_status)
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814171801.1334=
7-1-michal.wajdeczko@intel.com?part=3D20
