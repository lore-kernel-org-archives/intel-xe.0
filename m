Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDB0C61DB9
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:54:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C0410E205;
	Tue, 25 Aug 2026 17:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C7SyAClh";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE51B10E205
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 7E19B40BA3;
 Tue, 25 Aug 2026 17:54:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377F21F000E9;
 Tue, 25 Aug 2026 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787680459;
 bh=YfxVlZ1jlEGMWCv/0Een2ccwkRiMqwsYvxNYptV6kRw=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=C7SyAClhwFnCCt4ny1GxXYNtNIcDyrvjFuCLjTshe/1ybKmnYfQOaNOn8CttrZBFQ
 m1us6ygYOmM+q9S9dL+/KJXu3MW+hl0+4BZg+NQm6g9DNb9qpK3JDNzqd3vP0naY9g
 iWfI09M/swHMJX7usLqgXvVhaQFQ79rVFRYlYoJGP6wCPgQd8PbJMhrm3kLk+zk92t
 gDxmlCfdnQ3vfVAylGhpWGETHZwnzYWpzG+1CFUcdRpgyU/7H3VvVWA7HFEglUn8Wg
 a4WQfejDoAunxBZH/MgfAeMXkJftza074fCAhUXHwC9xM1Yz5U8wEf0ZjXwt5til8X
 73UU9w0ThPUiQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] drm/xe/cper: Allow hardware error CPER
 reporting from xe_log
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825175916.1103841-20-badal.nilawar@intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
 <20260825175916.1103841-20-badal.nilawar@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 17:54:18 +0000
Message-Id: <20260825175419.377F21F000E9@smtp.kernel.org>
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

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Blindly casting and passing the optional `data` parameter in `log_=
emit_cper` to hardware CPER emission paths causes kernel crashes if the poi=
nter is NULL or an ERR_PTR.
- [High] Synchronous hardware CPER emission inside the `xe_log` backend int=
roduces blocking and sleepable operations into general-purpose logging path=
s, leading to deadlocks and panics when called from atomic contexts.
- [Medium] Missing payload length validation before casting `data` to `stru=
ct xe_ras_error_class *` allows out-of-bounds memory access.
--

commit cde7fec12b9f07e68b4ed966ff02eeef7dd8e6db
Author: Badal Nilawar <badal.nilawar@intel.com>

drm/xe/cper: Allow hardware error CPER reporting from xe_log
   =20
Add a public wrapper xe_emit_hardware_error_cper() to enable xe_log.c to
emit hardware error CPER records. This hooks into log_emit_cper() to report
hardware signatures.

> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 5549ef6966fd8..c78fc195c55bd 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
[ ... ]
> @@ -10,15 +10,25 @@
> =20
>  #include "xe_device.h"
>  #include "xe_log.h"
> +#include "xe_ras.h"
>  #include "xe_printk.h"
> =20
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >=3D INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
>  static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_si=
gid sigid,
>  			  u32 component, u32 location, const void *data, size_t len,
>  			  struct va_format *vaf)
>  {
>  	KUNIT_STATIC_STUB_REDIRECT(log_emit_cper, pdev, cper_sev, sigid,
>  				   component, location, data, len, vaf);
> -	/* TODO */
> +	/* TODO software CPER */
> +
> +	if (is_hw_sigid(sigid))
> +		xe_emit_hardware_error_cper(pdev, cper_sev, sigid,
> +					    (struct xe_ras_error_class *)data);

[Severity: High]
Will this block or sleep when called from atomic contexts?

When a caller invokes xe_log macros (such as xe_log_comp_fatal()) from an
interrupt handler or while holding a spinlock, this synchronously invokes
xe_emit_hardware_error_cper() from a general-purpose logging path.

The underlying hardware CPER emission path eventually calls get_counter(),
which invokes xe_sysctrl_send_command(). That function explicitly checks
for sleep and acquires a mutex:

drivers/gpu/drm/xe/xe_sysctrl_mailbox.c:xe_sysctrl_send_command() {
    might_sleep();
    ...
    guard(mutex)(&sc->cmd_lock);
    ...
}

Should this operation be deferred to a workqueue to avoid deadlocks when
logging from atomic contexts?

[Severity: Medium]
Could this cause an out-of-bounds read if the provided payload is smaller
than the expected structure?

The __xe_log_emit() API accepts an opaque data pointer alongside a length
parameter. Since this cast ignores the len parameter, if a caller provides a
valid payload that is smaller than sizeof(struct xe_ras_error_class),
downstream functions like get_counter() will read past the end of the buffer
when dereferencing it:

drivers/gpu/drm/xe/xe_ras.c:get_counter() {
    ...
    request.counter =3D *counter;
    ...
}

>  }
[ ... ]
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ff9d917b8e29c..b4cdb5ec64915 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -837,6 +837,29 @@ static void emit_hw_error_cper(struct xe_device *xe,
>  	}
>  }
> =20
> +/**
> + * xe_emit_hardware_error_cper() - Emit a hardware error CPER record
> + * @pdev: PCI device associated with the Xe device
> + * @cper_sev: CPER severity
> + * @sigid: Error signature identifier
> + * @error_class: Hardware error classification details
> + *
> + * Emit a CPER record for a hardware error
> + */
> +void xe_emit_hardware_error_cper(struct pci_dev *pdev, int cper_sev, enu=
m xe_sigid sigid,
> +				 struct xe_ras_error_class *counter)
> +{
> +	struct xe_device *xe =3D pdev_to_xe_device(pdev);
> +
> +	if (!xe)
> +		return;
> +
> +	if (counter && !ras_counter_is_valid(xe, counter))
> +		return;

[Severity: High]
Does this check handle error pointers or NULL pointers safely?

The xe_log_err() macro permits the data parameter to be an ERR_PTR
(e.g., ERR_PTR(-EIO)). Because an error pointer is not NULL, this check
will pass it directly to ras_counter_is_valid(), which will dereference it
and cause a kernel panic:

drivers/gpu/drm/xe/xe_ras.c:ras_counter_is_valid() {
    u8 severity =3D counter->common.severity;
    ...
}

Furthermore, if counter is NULL, this check is bypassed entirely, but the
pointer is later unconditionally dereferenced inside get_counter() when
emit_hw_error_cper() is called:

drivers/gpu/drm/xe/xe_ras.c:get_counter() {
    ...
    request.counter =3D *counter;
    ...
}

> +
> +	emit_hw_error_cper(xe, counter, NULL, sigid, cper_sev);
> +}
> +
>  /**
>   * xe_ras_process_errors() - Process and contain hardware errors
>   * @xe: xe device instance
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825175916.1103=
841-13-badal.nilawar@intel.com?part=3D7
