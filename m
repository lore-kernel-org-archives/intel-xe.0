Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041D0CA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 10:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A309C112059;
	Fri,  9 Oct 2026 10:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I3R5ldkz";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C4F112059
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 10:38:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 0309A40283;
 Fri,  9 Oct 2026 10:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9681F000FF;
 Fri,  9 Oct 2026 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1791542328;
 bh=TbraoCYNuhZidAN2Xlp0xFnOcPdx/6IBJKJ9v0PkDck=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=I3R5ldkzn5IRDHTHPQ4sRTNS/ZerEn0+yd0GaJmgCvI9anzS++ognRcIXwE5d24E2
 cGp20PlOWpygfVTsFF8FTtszJZYeU1F1w5N6/UH7mBM5/QwNvdLWed6AxymCrtDRM1
 xXblpgr0wl3CRnoZq8JW4VWPOpVAR3wctkUQBff6O9gDNbJgVDa1VUHrlpfsl5wYs9
 6UE0sLoHlfbdAwgH6N0sAA4EqDxXKZye/1YU9HWG+yqIzRivB3qNIZzhSu6tqy7f1w
 IxtpXeVp66pvJ+XRDvw8VSLyn8341RX2vSJFoIoG7bQQojEq38Oh1sHRjXJgf9HSTF
 5KgjEU8uVbMXw==
Message-ID: <sashiko-outbox-165246@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/12] drm/xe/cper: Emit cper record to trace buf
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261009104602.1075405-22-badal.nilawar@intel.com>
References: <20261009104602.1075405-14-badal.nilawar@intel.com>
 <20261009104602.1075405-22-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 10:38:48 +0000
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
- [Low] trace: xe_error_cper uses %pU instead of %pUl for guid_t formatting
--

commit 2df74abeb761bb9cbc4580031c2be3af5f19e10b
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Emit cper record to trace buf
   =20
This commit introduces the xe_error_cper tracepoint to emit assembled CPER
records to the trace buffer. The events carry the device name, platform ID,
FRU ID, severity, and the Intel error section header so tools can pick them=
 up.

> diff --git a/drivers/gpu/drm/xe/xe_trace_cper.h b/drivers/gpu/drm/xe/xe_t=
race_cper.h
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_trace_cper.h
[ ... ]
> +TRACE_EVENT(xe_error_cper,
> +	TP_PROTO(struct xe_device *xe,
> +	    const guid_t *platform_id, const guid_t *fru_id,
[ ... ]
> +	TP_fast_assign(
> +	    __assign_str(dev);
> +	    __entry->sev =3D severity;
> +	    memcpy(__entry->platform_id, platform_id, UUID_SIZE);
> +	    memcpy(__entry->fru_id, fru_id, UUID_SIZE);
> +	    memcpy(__entry->ihdr_raw, ihdr, sizeof(struct xe_cper_sec_intel_err=
_hdr));
> +	    __entry->cper_len =3D cper_len;
> +	    memcpy(__get_dynamic_array(cper), cper, cper_len);
> +	    ),
> +
> +	TP_printk("dev=3D%s severity=3D%d platform_id=3D%pU fru_id=3D%pU "
> +		"intel_err_hdr_raw=3D%s cper_len=3D%u cper_raw=3D%s",

[Severity: Low]
Since platform_id and fru_id are guid_t types (which are little-endian per
UEFI/CPER specifications), shouldn't this use the %pUl format specifier
instead of %pU?

The Linux kernel's %pU specifier assumes a big-endian uuid_t layout. Using
it here will cause the first three groups of the UUID to be byte-swapped in
the trace output, which might break correlation with platform specifications
and CPER tooling.

> +		__get_str(dev), __entry->sev,
> +		__entry->platform_id, __entry->fru_id,
> +		__print_hex(__entry->ihdr_raw,
> +		    sizeof(struct xe_cper_sec_intel_err_hdr)),
> +		__entry->cper_len,
> +		__print_hex(__get_dynamic_array(cper),
> +		    __entry->cper_len))
> +);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009104602.1075=
405-14-badal.nilawar@intel.com?part=3D8
