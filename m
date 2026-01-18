Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC6AD4A5F4
	for <intel-xe@archiver.kernel.org>; Sun, 18 Jan 2026 14:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E4A10E2C9;
	Sun, 18 Jan 2026 14:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSd3j/i3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02C210E2C9
 for <intel-xe@lists.freedesktop.org>; Sun, 18 Jan 2026 14:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768747196; x=1800283196;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/sT2LBuJGtt74aVSGfxS4MXIWjRGHG6ID2qtUxhLygk=;
 b=jSd3j/i3OQJstbrFQqUK/TWsPRibb2gC/Eq3XhhnxAE8g2/KS9FZ6lFw
 hWT4m0Wmsqqn0Y8RgLhWjFF99OecS2OzTxBjKpEbm46/GMBL+ZL+pXNIq
 D44FmFMMGy/nF0ItrfbkXu7Vt1GjUU72a5Lq9IAj+gUhFpeKQaqIKXApL
 2QKsYAiHxRFUC9Ns/NM6yFX2Gax40CTJbT23+x4rpJ8rYW8sCEo9jD6YB
 QEgj8hC2D/l77l8gCD2Jq95pNRNSsyLB52HEsTtY2Gbds8NUNuA4o/jQj
 WAdLPmyfIhAl1yBNagPH4zLtwIkF6ALd04Xd82JUVXQi/RTmnfXxXRCBD Q==;
X-CSE-ConnectionGUID: SReMBrLTRpK/QaoNd3bD7A==
X-CSE-MsgGUID: BiM9qpaiRpqCtpWrk9JyXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80700639"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="80700639"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 06:39:55 -0800
X-CSE-ConnectionGUID: 1ZDgdVQoROyn3KTm+Sd2Hw==
X-CSE-MsgGUID: TweHwZeOQaKzAU/11VWF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; d="scan'208";a="209792654"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.5])
 ([10.245.244.5])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 06:39:53 -0800
Message-ID: <be4475588e406334276f011a11f918ab73f73bd6.camel@linux.intel.com>
Subject: Re: [PATCH v12 2/4] drm/xe: Update wedged.mode only after
 successful reset policy change
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>, intel-xe@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, rodrigo.vivi@intel.com, matthew.brost@intel.com
Date: Sun, 18 Jan 2026 15:39:51 +0100
In-Reply-To: <20260107174741.29163-3-lukasz.laguna@intel.com>
References: <20260107174741.29163-1-lukasz.laguna@intel.com>
 <20260107174741.29163-3-lukasz.laguna@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Lukasz,

On Wed, 2026-01-07 at 18:47 +0100, Lukasz Laguna wrote:
> Previously, the driver's internal wedged.mode state was updated
> without
> verifying whether the corresponding engine reset policy update in GuC
> succeeded. This could leave the driver reporting a wedged.mode state
> that doesn't match the actual reset behavior programmed in GuC.
>=20
> With this change, the reset policy is updated first, and the driver's
> wedged.mode state is modified only if the policy update succeeds on
> all
> available GTs.
>=20
> This patch also introduces two functional improvements:
>=20
> =C2=A0- The policy is sent to GuC only when a change is required. An
> update
> =C2=A0=C2=A0 is needed only when entering or leaving
> XE_WEDGED_MODE_UPON_ANY_HANG,
> =C2=A0=C2=A0 because only in that case the reset policy changes. For exam=
ple,
> =C2=A0=C2=A0 switching between XE_WEDGED_MODE_UPON_CRITICAL_ERROR and
> =C2=A0=C2=A0 XE_WEDGED_MODE_NEVER doesn't affect the reset policy, so the=
re is
> no
> =C2=A0=C2=A0 need to send the same value to GuC.
>=20
> =C2=A0- An inconsistent_reset flag is added to track cases where reset
> policy
> =C2=A0=C2=A0 update succeeds only on a subset of GTs. If such inconsisten=
cy is
> =C2=A0=C2=A0 detected, future wedged mode configuration will force a retr=
y of
> the
> =C2=A0=C2=A0 reset policy update to restore a consistent state across all=
 GTs.
>=20
> Fixes: 6b8ef44cc0a9 ("drm/xe: Introduce the wedged_mode debugfs")

This patch causes conflicts in the drm-xe-fixes branch that are not
trivially resolved since it seems to depend on various previous
patches.

This will likely make backporting also to earlier kernels a pain,
("dim fixes 6b8ef44cc0a9" indicates the fixed commit goes back to linux
6.11).

Could you please provide a backport of this patch that compiles and
works with the drm-xe-fixes branch?=20

Thanks,
Thomas


