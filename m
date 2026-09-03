Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE56C624D7
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 20:26:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E77710E464;
	Thu,  3 Sep 2026 20:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Oeq5Q1ku";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3510E464
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 20:26:37 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 057DC40A8E;
 Thu,  3 Sep 2026 20:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C511F000E9;
 Thu,  3 Sep 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788467196;
 bh=DZlJBrj7vPEtf5sJDUsAp6mJKos7B+iRcbY272Rt+8A=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=Oeq5Q1kuXzxG117mBHjQy2uigmMqi5wdGomK6eftTAcIuGRfsO+8Zk2xmRu/0RW3B
 EnLLsJtrGtglwp5mtcKznMPd4uvIuT/Kl3W9UK7zQ1eIRLKGjVlm8QiHHg+0YTxz/v
 enEIKvtce7d3s+sslKBOcNNTS0S7FesS5+ocLWKZI1d2Hc9RvJoJ1PovC72NCV6Cxs
 ZJNh+pnSg6jRXZuUaDFMmYTt0023F0HCV9k6sfM+uDFla908ggrtC8g2xTwwEOXnz3
 TXDIUJh9g4k/hSEQuIvnm20k0EHj0pz5oMDzqzedN8AywRDB4gM/hF6j4qH+CyPpvc
 cYEccMbmAFOCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 08/18] drm/xe/vsec: Use correct pm state get
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260903201002.1064889-28-michael.j.ruhl@intel.com>
References: <20260903201002.1064889-20-michael.j.ruhl@intel.com>
 <20260903201002.1064889-28-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 20:26:36 +0000
Message-Id: <20260903202636.B1C511F000E9@smtp.kernel.org>
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
- [High] Missing `.read_reg` and `.write_reg` callbacks in `xe_pmt_cb` leav=
es PMT crashlog control registers unprotected against accesses while the GP=
U is in D3cold.
--

commit a8bb406382664649dde97aed435f17b6cfd1536b
Author: Michael J. Ruhl <michael.j.ruhl@intel.com>

drm/xe/vsec: Use correct pm state get

This commit updates the PM runtime checks in the telemetry read path to ens=
ure
the device is properly awakened when reading crashlog data, as crashlog nee=
ds
to be collected at all times. It also adds a check for the WATCHER capabili=
ty
type for completeness.

> diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
> index dd7723ba6c1c2..468a221378faf 100644
> --- a/drivers/gpu/drm/xe/xe_vsec.c
> +++ b/drivers/gpu/drm/xe/xe_vsec.c
> @@ -158,9 +159,18 @@ int xe_pmt_telem_read(struct device *dev, u32 guid, =
u64 *data, loff_t user_offse
> =20
>  	telem_addr +=3D offset + user_offset;
> =20
> -	/* indicate that we are not at an appropriate power level */
> -	if (!xe_pm_runtime_get_if_active(xe))
> -		return -ENODATA;
> +	/* Always allow crashlog. Telemetry, only when powered */
> +	switch (cap_type) {
> +	case CRASHLOG:
> +		xe_pm_runtime_get(xe);
> +		break;
> +	case TELEMETRY:
> +		if (!xe_pm_runtime_get_if_active(xe))
> +			return -ENODATA;
> +		break;
> +	case WATCHER:
> +		return -EINVAL;
> +	}

[Severity: High]
This is a pre-existing issue, but since this patch is addressing PM runtime
protection for the crashlog data path, it seems the control registers are s=
till
left entirely unprotected.

While xe_pmt_telem_read() now handles PM state correctly for data reads,
xe_pmt_cb lacks .read_reg and .write_reg callbacks:

drivers/gpu/drm/xe/xe_vsec.c:
static struct pmt_callbacks xe_pmt_cb =3D {
	.read_telem =3D xe_pmt_telem_read,
};

When userspace accesses PMT crashlog control attributes (like enable, clear=
, or
trigger) via sysfs while the GPU is in D3cold, pmt_crashlog_read_reg() and
pmt_crashlog_rmw() fall back to direct MMIO access:

drivers/platform/x86/intel/pmt/crashlog.c:pmt_crashlog_read_reg() {
	...
	if (entry->pdata->cb && entry->pdata->cb->read_reg)
		return entry->pdata->cb->read_reg(entry->pdata->cb_data, offset, reg);
	*reg =3D readl(entry->disc_table + offset);
	...
}

Because the callbacks are NULL, the fallback access hits powered-down PCIe =
MMIO
space. Does this cause PCIe unsupported requests (UR) and lead to Advanced =
Error
Reporting (AER) panics, system freezes, or returning invalid data to usersp=
ace?

Could .read_reg and .write_reg callbacks be added to xe_pmt_cb to protect t=
he
control registers during D3cold?

> =20
>  	mutex_lock(&xe->pmt.lock);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903201002.1064=
889-20-michael.j.ruhl@intel.com?part=3D8
