Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5130C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 11:19:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C4510E194;
	Tue, 25 Aug 2026 11:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NBHa8k6L";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1BD10E194
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 11:18:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 3D33E43738;
 Tue, 25 Aug 2026 11:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2EA91F000E9;
 Tue, 25 Aug 2026 11:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787656739;
 bh=W3Df1UL40jkI4L7AIvy2oJCFwnD7P8yQtX9OtyEk9HI=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=NBHa8k6LprXqPvB86WPYIc+5LOHkFC0qvQcc62WrGPzDczdb7QRtEzbiMp7+p5xzL
 zezlMTsdifYQQHmBe5SLDSy31fo8Hh2QMMSxVUjAbSUJfpfdhoI+YA/Mfpu+RF/LC8
 AyMY7Zjwqvk5IbRkjAoTnKMBNBtvCzYLYBFQD9OfYREcPLbPvnwoiLBDtNkororwJH
 aZQnCZLludlSLX4gXhjEGf0OoPaLgcBiPm0ekgMMOtxxJO1pdpl6BWrB9rUntWe8Ys
 2wJr2nUOwg3bnZnFI2GLFAwMXGrV5Y7F+B0s4JgxODUHREo5rDJNZ6aWTG2HJVsVuV
 nw6ef7Hi/ZTPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] drm/xe/sysctrl: Report 'System Controller event'
 error using SIGID
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260825110542.1359776-16-mallesh.koujalagi@intel.com>
References: <20260825110542.1359776-9-mallesh.koujalagi@intel.com>
 <20260825110542.1359776-16-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 11:18:58 +0000
Message-Id: <20260825111858.F2EA91F000E9@smtp.kernel.org>
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
- [Low] The patch includes a nonexistent header `xe_log.h` and references u=
ndefined logging macros, breaking the build.
--

--- Patch [7]: [PATCH v5 7/7] drm/xe/sysctrl: Report 'System Controller eve=
nt' error using SIGID ---
commit 5dd0dcae7a92f1eec8f1bdc6337685ee71b3e2e4
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Report 'System Controller event' error using SIGID

This patch updates the error logging in xe_sysctrl_event.c to use the
xe_log() helpers for system controller events.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/x=
e_sysctrl_event.c
> index da395148ee9dc..7a3aa0aad6a35 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -5,6 +5,7 @@
> =20
>  #include "xe_device.h"
>  #include "xe_irq.h"
> +#include "xe_log.h"

[Severity: Low]
Does this header file exist? It seems the include of xe_log.h and the
subsequent uses of xe_log_err() and SYSCTRL in get_pending_event() will
cause a build failure. Was the patch adding this header and the logging
macros accidentally omitted from this series?

[ ... ]

> @@ -25,23 +26,26 @@ static void get_pending_event(struct xe_sysctrl *sc, =
struct xe_sysctrl_mailbox_c
> =20
>  		ret =3D xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");
>  			return;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825110542.1359=
776-9-mallesh.koujalagi@intel.com?part=3D7
