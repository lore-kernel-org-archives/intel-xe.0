Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F0C79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A8E710E088;
	Sun,  6 Sep 2026 17:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I5ZRLJrk";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32A10E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:27:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 87F3D40290;
 Sun,  6 Sep 2026 17:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488C11F00A3A;
 Sun,  6 Sep 2026 17:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715662;
 bh=UwdarWbPtLTnTBbQX/taCiRl+Ok6vEgunPQJHsLj2cQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=I5ZRLJrk81rRcukRvk4PQK5rJl268lDAb+KPeaKJbLxfGO6S1lo5J+3BMRk7hOCRS
 VgES7xnbhLr+w9cpxVHALpuw8ibXA9oUnjgNqCLmAFMAmQYVXY50Hyfe/oyDqOdDvW
 jXRTwFmxe+nZLojod644y5X+pCIoh8denZLvZYYB5wU5AejluGHvu3D9V63oXMcmpV
 sNuBXZN2e0ZtFdYfx3E3PBCqNW379YcGRUBcX9s5064zFQXO2Xp56TP9mvEK2hpvr4
 0wXSMdq6VxKyOfY0SP1ypGuIfzntGX8IJOtWAnbrG/tvWeOwLnx1QdRiXq3ZM6feTX
 z1Ca2UYffu01g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/12] drm/xe/xe_ras: Report device memory errors
 using SIGID
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-22-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-22-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:27:41 +0000
Message-Id: <20260906172742.488C11F00A3A@smtp.kernel.org>
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

New issues:
- [Medium] Double-bit ECC memory errors are incorrectly reported with CPER_=
SEV_INFORMATIONAL severity despite being severe enough to trigger a device =
reset.

Pre-existing issues:
- [High] Hardware CPER records are silently discarded due to an inverted SI=
GID check.
--

commit 0369a03d8670385fb852c68b7ab519615f2c4e05
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/xe_ras: Report device memory errors using SIGID

This commit updates device memory error reporting to use the
xe_log_comp_info helper. It maps memory errors like poison, data parity,
and double-bit ECC to this new telemetry interface.

> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 288dbc0942f58..3a7f80370827e 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

[ ... ]

> @@ -387,14 +387,17 @@ static u8 handle_device_memory_errors(struct xe_dev=
ice *xe, struct xe_ras_error_
>  	 */
>  	switch (info->category) {
>  	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter=
),
> +				 "Poison error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DATA_PARITY:
> -		xe_info(xe, "[RAS]: Data parity error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter=
),
> +				 "Data parity error detected\n");
>  		break;
>  	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx=
\n",
> -			info->sw_address);
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter=
),
> +				 "Double-bit ECC error detected at sw address 0x%llx\n",
> +				 info->sw_address);

[Severity: Medium]
Will this incorrectly report double-bit ECC memory errors with
CPER_SEV_INFORMATIONAL severity despite being severe enough to trigger a
device reset?

The xe_log_comp_info macro hardcodes the CPER severity to
CPER_SEV_INFORMATIONAL. After logging, the switch statement falls through
to the default case and returns XE_RAS_RECOVERY_ACTION_RESET.=20

Could this break automated fleet management that acts on CPER severities
because a severe uncorrectable double-bit ECC error is logged as
informational while the driver actually resets the GPU?

>  		/* TODO: Add page offlining for Double-bit ECC error */
>  		fallthrough;
>  	default:
>  		return XE_RAS_RECOVERY_ACTION_RESET;
>  	}

[ ... ]


This isn't a bug introduced by this patch, but looking at the broader
telemetry handling in drivers/gpu/drm/xe/xe_cper.c:

> void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enum=
 xe_sigid sigid,
> 				 struct xe_ras_error_class *counter,
> 				 struct xe_ras_get_counter_response *response)
> {
> 	struct xe_device *xe =3D pdev_to_xe_device(pdev);
>       ...
>=20
> 	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
> 		return;
>       ...

[Severity: High]
Are hardware CPER records being silently discarded here due to an inverted
SIGID check?

When xe_emit_hardware_error_cper() is called to emit a record for a hardware
error, the sigid parameter is greater than or equal to
INTEL_SIGID_GPU_XE_HARDWARE_START, which is the base value for all hardware
SIGIDs.=20

This condition evaluates to true, causing the function to immediately return
before any CPER record is emitted, rendering the logging API calls
completely ineffective for hardware faults.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D8
