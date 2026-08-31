Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21CFC61DD3
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 11:00:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8385910E277;
	Mon, 31 Aug 2026 11:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="muJIsNgf";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CA210E277
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 11:00:49 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9CCC5401A5;
 Mon, 31 Aug 2026 11:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C72A1F000E9;
 Mon, 31 Aug 2026 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1788174049;
 bh=3ZrgBpKdE8o/+Z8JbVAfKS35LLf02NFgBH1iiGeL5IQ=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=muJIsNgfJbNX0gcV3GuWt/KudBc3rg+l8GmbFYPjtvPZOVv2hxWC65Nvg437ASdsX
 ZdeR21SudFcrmBlA5TUrKLWUU7e4GkUkk0LQ0xEzyiqgdrDF/LjAMbZZMP7I14ET3W
 vOUDnMyWNxUYVmBiWoRF1g6HQeIIM55TaGb6QO6D1vR86FoVWUxQ17C0Fk5OPlDArF
 r5L77GbZ2hnako5QeLnjK711+RyDar3pRDGmOGyEr8Vnv+7tS6qAditeZ9MOIFlhT0
 RpLg/4+J94a2iRoeq52I4gXbFUy+EGTxZkUmI5rjN2UXcx5e3b/VSR1CQadxtDNnXy
 JwxKQ7YoyryDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 9/9] drm/xe/sysctrl: Report 'System Controller event'
 error using SIGID
To: "Mallesh Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260831104456.1770605-20-mallesh.koujalagi@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-20-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 11:00:48 +0000
Message-Id: <20260831110049.5C72A1F000E9@smtp.kernel.org>
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
- [Low] The patch relies on a missing header file 'xe_log.h' and undefined =
logging macros and identifiers.
--

commit 6685ffdeb0695b8ea21292cfaa83d3bea319ad7d
Author: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

drm/xe/sysctrl: Report 'System Controller event' error using SIGID

This commit updates the System Controller event logging to use xe_log helpe=
rs
instead of the standard xe_err or xe_warn macros.

> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/x=
e_sysctrl_event.c
> index da395148ee9dc..5804d3649569c 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -5,6 +5,7 @@
> =20
>  #include "xe_device.h"
>  #include "xe_irq.h"
> +#include "xe_log.h"

[Severity: Low]
Is this header missing from the patch series? The xe_log.h file does not
appear to exist in the tree, which results in an immediate build failure
when applying this patch.

>  #include "xe_printk.h"
>  #include "xe_ras.h"
>  #include "xe_sysctrl.h"

[ ... ]

> @@ -25,23 +26,26 @@ static void get_pending_event(struct xe_sysctrl *sc, =
struct xe_sysctrl_mailbox_c
> =20
>  		ret =3D xe_sysctrl_send_command(sc, command, &len);
>  		if (ret) {
> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			xe_log_err(xe, SYSCTRL, ret, "Failed to get pending event\n");

[Severity: Low]
Are xe_log_err and SYSCTRL defined in the missing xe_log.h header? Without
those definitions, the get_pending_event() function fails to compile due to
undefined identifiers.

>  			return;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831104456.1770=
605-11-mallesh.koujalagi@intel.com?part=3D9
