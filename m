Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CD8C5DF85
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 19:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378A910E02D;
	Wed, 19 Aug 2026 19:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="C7XCqPwo";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DDF10E02D
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 19:22:28 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id DA04F40B69;
 Wed, 19 Aug 2026 19:22:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01461F000E9;
 Wed, 19 Aug 2026 19:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1787167348;
 bh=sFbVnC76P7s9EigftWfozkk8Tj1fq/NE3bO3tMVokA8=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=C7XCqPwo/gMjXSTej8IlPrMMlZMvxaFT/Gb3iSuJCLJvYahxN1TDkGa3JTBHQD9tk
 87Qhppo/4EmqDAeEru/6m3JndiGzMtLsRYkE48ez2bUE2RmAAKsjNiVxJwvgLeVPcs
 6Yrxz8gEqdm2HXLD/4rDLdKLAjdsG5Ln2zTTlUx2MJeRBRu6fHcriMz9sdcC2RgnLr
 VUeUhpftGjHsgBfq1bauamtmvnilb42F4e1B1XfyWCDxSz7HdRajsteijtKt0FZ+rI
 0BIwr1if6fQM7k2eeNAL395N7yUmAyKCBw8eoQ4fqqTArI12SnKRbo1PRtAgosn6mO
 l5GX/AL97jAyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] drm/xe/memirq: Report errors using structured
 xe_log API
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
References: <20260819191442.1957986-1-dnyaneshwar.bhadane@intel.com>
 <20260819191442.1957986-6-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:22:28 +0000
Message-Id: <20260819192228.A01461F000E9@smtp.kernel.org>
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
- [Medium] Loss of diagnostic precision by downgrading the logging context =
from tile-level to device-level.
- [Low] The `memirq_err()` macro was left defined in the file despite all i=
ts calls being replaced.
--

--- Patch [5]: [PATCH 05/12] drm/xe/memirq: Report errors using structured =
xe_log API ---
commit 081cec958cab790284a251bc663834e4569a80b2
Author: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

drm/xe/memirq: Report errors using structured xe_log API

This patch replaces memirq_err() calls with xe_log_err() using the
MEMIRQ component tag for memory-based IRQ failures.

> diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memir=
q.c
> index 9dfe965cb46ec..45eae58d418f0 100644
> --- a/drivers/gpu/drm/xe/xe_memirq.c
> +++ b/drivers/gpu/drm/xe/xe_memirq.c

[Severity: Low]
This isn't a bug, but did you mean to also remove the definition of
the memirq_err() macro at the top of this file? It appears to be
dead code now that all invocations have been replaced.

[ ... ]

> @@ -232,7 +233,7 @@ static int memirq_alloc_pages(struct xe_memirq *memir=
q)
>  	return 0;
> =20
>  out:
> -	memirq_err(memirq, "Failed to allocate memirq page (%pe)\n", ERR_PTR(er=
r));
> +	xe_log_err(xe, MEMIRQ, err, "Failed to allocate memirq page (%pe)\n", E=
RR_PTR(err));

[Severity: Medium]
Does this change lose diagnostic precision by downgrading the logging
context from tile-level to device-level?

By explicitly passing the xe device instead of the available tile
variable, the location type resolves to the device, omitting the
specific failing tile ID from the structured log.

[ ... ]

> @@ -370,7 +371,7 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, stru=
ct xe_guc *guc)
>  	return 0;
> =20
>  failed:
> -	memirq_err(memirq, "Failed to setup report pages in %s (%pe)\n",
> +	xe_log_err(memirq_to_xe(memirq), MEMIRQ, err, "Failed to setup report p=
ages in %s (%pe)\n",
>  		   guc_name(guc), ERR_PTR(err));
>  	return err;
>  }

[Severity: Medium]
Similarly, does passing memirq_to_xe(memirq) here instead of resolving
the tile or GT lose subsystem context for this log message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819191442.1957=
986-1-dnyaneshwar.bhadane@intel.com?part=3D5
