Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BC9C9830D
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 06:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2A210E586;
	Fri, 25 Sep 2026 06:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EoH9+86K";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1CBC10E586
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 06:51:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5B3224087E;
 Fri, 25 Sep 2026 06:51:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA091F000FF;
 Fri, 25 Sep 2026 06:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790319116;
 bh=N33u774Ho5vfiGqNU4WFGnlxnG5c3P8N1lqqR5pNHsg=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=EoH9+86KA9pIaOfImBSUTZ3Tu12PXME+gsr8LmXdS0xUjH7uEMcMX5Z9VcNLAE+HY
 B0Yrd7SkrStcmJ/Vre2gvlWFkYtLU/uZMBrm942yYqHzraS8ylb8I0HfK8Ag2pS43I
 WD2uxIPt/V9+MFuW/y0P81nDjCda+Io62vIGYKkxe2HVFGsuGCBbZwSgoM828rdH1F
 uHwntC9zuUrc4qg+Y0aY8IVYZFem+pIDHUBRMY1pcSACWECML+/PxmnNtfz6ZDqNyn
 kT//OHIBzoBMzJDRRekVbwIykhtIdIbmfBxZAcsCxnrakWA6Dt4b1umhjOuT79Ls0w
 Ksd5eh/ok1UbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 23/24] drm/xe: add migrate ULLS period configfs
 attribute
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260925045320.1325860-24-matthew.brost@intel.com>
References: <20260925045320.1325860-1-matthew.brost@intel.com>
 <20260925045320.1325860-24-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 06:51:54 +0000
Message-Id: <20260925065156.1EA091F000FF@smtp.kernel.org>
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
- [Low] xe: format string mismatch for u32 configfs attribute
--

commit 11e688bb0c4319099fe2944add90b93a411505ab
Author: Matthew Brost <matthew.brost@intel.com>

drm/xe: add migrate ULLS period configfs attribute

This commit adds a configfs attribute to control the migrate ULLS period.
The period specifies how long in milliseconds migrate ULLS remains active
before exiting, primarily intended for performance tuning.

> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_con=
figfs.c
> index f1555a9d31170..3f09dd17f80e0 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
[ ... ]
> @@ -631,6 +648,33 @@ static ssize_t enable_multi_queue_store(struct confi=
g_item *item, const char *pa
>  	return len;
>  }
> =20
> +static ssize_t migrate_ulls_period_ms_show(struct config_item *item, cha=
r *page)
> +{
> +	struct xe_config_device *dev =3D to_xe_config_device(item);
> +
> +	return sprintf(page, "%d\n", dev->migrate_ulls_period_ms);

[Severity: Low]
Since dev->migrate_ulls_period_ms is an unsigned 32-bit integer (u32),
could writing a value greater than INT_MAX via configfs cause it to be read
back as a negative number due to the "%d" format string?

Would "%u" be more appropriate here to preserve the read/write round-trip
property for userspace?

> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925045320.1325=
860-1-matthew.brost@intel.com?part=3D23
