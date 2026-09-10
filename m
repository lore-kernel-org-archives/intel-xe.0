Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C0AC79FBF
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E7510E27F;
	Thu, 10 Sep 2026 18:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R2qR4/xs";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A25310E27F
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 18:42:45 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 87EA96022C;
 Thu, 10 Sep 2026 18:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA8A1F000FF;
 Thu, 10 Sep 2026 18:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1789065764;
 bh=cmz1QObSvcT5eNQUqHarJ6eS5ebheu3jqWTskCvMcFY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=R2qR4/xsEvunPfiW49uLqjEVc3rr1GFu0gxwg7Q4fkv8UUP5T4nOfpqct6XEuER2p
 LblRElAGQoQ91ym7pggw1MNlXqJEQq1e6BP6XR740dSFbSTANNCI7DjHB5UuvcaaBo
 FNfSpTVks5teN38n5x0Z3fwjexK7scw534hZpGLkjbGB7EVBQl6zggBiDABgyylrsk
 3SENDhVJVSjHABSNIh5pkXSjkRFmz9Vp142iy8UDzfs/ztBF+zNbvFo+g8Tlw8rktk
 rDYg27UXuPisZBZVO6HkPK/U3mlfAl3L4i6tG55m2PTayjN1rnFI7AdQv6ZlUOwMSf
 +qPW355ANyr4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] drm/xe/hwmon: Detect unavailable temperature
 sensors
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260910182756.638830-2-karthik.poosa@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 18:42:43 +0000
Message-Id: <20260910184244.1DA8A1F000FF@smtp.kernel.org>
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
- [Medium] Repeated fallible PCODE mailbox reads during sysfs attribute vis=
ibility checks block driver probe and can cause flaky attribute registratio=
n.
- [Medium] Data race on `hwmon->temp.value` shared scratchpad buffer when `=
get_mc_temp()` is called lockless from sysfs callbacks.
--

commit daf20f08a8a78b5a377223b407b9b3a08568942e
Author: Karthik Poosa <karthik.poosa@intel.com>
Subject: drm/xe/hwmon: Detect unavailable temperature sensors

This commit introduces is_temp_available() to validate sensor presence duri=
ng
sysfs attribute registration. It uses hwmon_temp_is_visible() to hide
attributes for sensors that report invalid values, avoiding exposing=20
unavailable sensors to userspace.

> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d8..faed2f5da3947 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
[ ... ]
> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int chan=
nel)
> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio =3D xe_root_tile_mmio(hwmon->xe);
[ ... ]
> +	case CHANNEL_MCTRL:
> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> +	case CHANNEL_PCIE:
> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> +	default:
> +		return false;
> +	}
>  }
> =20
>  static umode_t
> @@ -973,14 +1019,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u=
32 attr, int channel)
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;

[Severity: Medium]
Is it safe to execute lockless hardware I/O from the sysfs visibility callb=
ack?

The xe_hwmon_temp_is_visible callback executes get_mc_temp without holding
hwmon->hwmon_lock. Because the sysfs core creates attributes one by one, an
aggressive userspace process can open and read an early attribute as soon as
it appears.=20

This could trigger a concurrent lockless execution of get_mc_temp from
xe_hwmon_temp_read while the sysfs core is still evaluating is_visible=20
for subsequent attributes. Both threads would concurrently execute=20
xe_pcode_read and perform unsynchronized writes to the shared=20
hwmon->temp.value array. Could this lead to torn or corrupted temperature=20
readings?

[Severity: Medium]
Could these repeated hardware reads cause flaky attribute registration and =
slow
down device probe?

During hwmon_device_register_with_info, the sysfs core sequentially evaluat=
es
the is_visible callback for every attribute in a group. For CHANNEL_MCTRL a=
nd
CHANNEL_PCIE, this now unconditionally executes blocking hardware mailbox r=
eads
(get_mc_temp and get_pcie_temp).=20

If the PCU mailbox is busy and times out for a single attribute's check, th=
at
specific attribute might be silently omitted while others in the same chann=
el
are successfully created. Should the sensor availability be probed once and
cached during initialization instead of evaluating it dynamically for every
sysfs attribute?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910182756.6388=
30-1-karthik.poosa@intel.com?part=3D1
