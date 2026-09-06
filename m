Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2A3C79F85
	for <intel-xe@archiver.kernel.org>; Sun,  6 Sep 2026 17:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59A10E088;
	Sun,  6 Sep 2026 17:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lUYQu7S3";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06F110E088
 for <intel-xe@lists.freedesktop.org>; Sun,  6 Sep 2026 17:23:43 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C77B41895;
 Sun,  6 Sep 2026 17:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A77A1F00A3A;
 Sun,  6 Sep 2026 17:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788715423;
 bh=tcvjCC3AU6mQdCcWjYMNDLMAoQ63TQL7MZz+I96m3z8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=lUYQu7S3DBlRgE4Ay6CChBjqFHFrdulrWptKFfFHseDw1kAl5oXHPSHlK/84FFuFO
 mkoKLV3DIuIhQurN3ug6xXep9SR/Sgz7fHA950yk1G1ZtaSN6EMjM4xRN/XbcvUaBX
 PLCeHL5TtArkA2ixctdCuF5IgOnoHXhAKeLT360x/L8K6g42vBOOs0A0R0gN23Qs3E
 1VANl8RbwPMjvMVPX6Avp15jvEySGg30Z4Lxi0Yje7ZScMBv4BziG35ta7ejYPox3J
 YoLXpT5q1mD1HMz0lxC0Lcy5x0WPxjEdTpuU+Vpb2I7hr3U2XNCIiqS1SZ/1OdQsae
 vvVksXB58UQkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/12] drm/xe/cper: Retrieve the error counter record
 for CPER reporting
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260906172604.2215987-16-badal.nilawar@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-16-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 06 Sep 2026 17:23:42 +0000
Message-Id: <20260906172343.2A77A1F00A3A@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Fetching error counters from the generic logging emission path int=
roduces a might_sleep() restriction into generic logging macros.
- [High] xe_emit_hardware_error_cper reads MMIO registers via sysctrl comma=
nd without ensuring the device is awake, leading to potential system crashe=
s or PCIe AER errors if called when the device is in D3cold.
- [Medium] The patch introduces redundant, synchronous sysctrl mailbox comm=
ands to fetch counter values that the driver either already possesses or fe=
tches again immediately.

Pre-existing issues:
- [High] Preexisting logic bug causes xe_emit_hardware_error_cper to immedi=
ately abort for hardware SIGIDs, making the newly added code unreachable.
--

commit ea598ea85d76d6f40d20fe1e15edf6a22c8e705c
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Retrieve the error counter record for CPER reporting

Retrieve the error counter record required to build a CPER record when
one is not provided by the caller.

> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index e8017e3ee3a09..f04a91223a43c 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
[ ... ]
> @@ -26,6 +28,8 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev, =
int cper_sev, enum xe_sig
>  				 struct xe_ras_get_counter_response *response)
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +	struct xe_ras_get_counter_response local_resp =3D {};
> +	struct xe_ras_get_counter_response *counter_response =3D response;
> =20
>  	if (!xe)
>  		return;
> @@ -33,5 +37,16 @@ void xe_emit_hardware_error_cper(struct pci_dev *pdev,=
 int cper_sev, enum xe_sig
>  	if ((int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START)
>  		return;

[Severity: High]
This isn't a bug introduced by this patch, but does this condition in
xe_emit_hardware_error_cper() prevent the newly added code from executing?

Since hardware SIGIDs are strictly greater than or equal to
INTEL_SIGID_GPU_XE_HARDWARE_START, checking if sigid is greater than or
equal to this constant seems to cause an immediate return for all hardware
errors, silently disabling the CPER record emission.

> +	if (!counter || !xe_ras_counter_is_valid(xe, counter))
> +		return;
> +
> +	if (!counter_response) {
> +		counter_response =3D &local_resp;
> +		if (xe_ras_get_counter_response(xe, counter, counter_response)) {

[Severity: High]
Does fetching error counters from the generic logging emission path
introduce a sleep restriction into logging macros?

If a generic macro like xe_log_comp_fatal() is called from an atomic contex=
t,
this synchronous fetch via xe_ras_get_counter_response() will invoke
xe_sysctrl_send_command(). The underlying sysctrl command asserts might_sle=
ep()
and waits on a mutex, which could cause a bug or deadlock if triggered from=
 an
interrupt handler or spinlock.

[Severity: High]
Also, does this hardware access ensure the device is runtime-resumed?

The sysctrl command path uses guard(xe_pm_runtime_noresume)(xe), which
increments the usage counter but avoids waking a suspended device. If this
logging path executes while the device is in D3cold, will the subsequent
MMIO reads hit powered-off hardware and trigger unhandled PCIe AER errors?

[Severity: Medium]
Finally, does this force a new mailbox command to fetch data that the caller
might already possess?

For example, in xe_ras_process_errors(), the driver already executes a
mailbox command that returns the counter values. However, it passes only a
pointer to the generic logging function, forcing
xe_emit_hardware_error_cper() to issue an entirely new, redundant synchrono=
us
mailbox command to fetch the same value. Can this be optimized to reuse the
existing data and avoid extra latency during error handling?

> +			xe_err(xe, "[RAS]: CPER: failed to get counter, skipping record\n");
> +			return;
> +		}
> +	}
> +
>  	/* TODO */
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260906172604.2215=
987-14-badal.nilawar@intel.com?part=3D2
