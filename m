Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCE1EE20B5
	for <intel-xe@archiver.kernel.org>; Fri,  6 Feb 2026 16:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ECE910E06A;
	Fri,  6 Feb 2026 16:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyLYaq/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE43410E06A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Feb 2026 16:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770394671; x=1801930671;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=03xZMG2cYlWiNLvVy6tN9qAnfqERTrXw8hpe8HGW/OE=;
 b=hyLYaq/fk/k4Me67ZKjn7EKTERor0ojHgqpiCeykPfDi6vjWRXVscY8G
 fPVbDv5P4Mrdz3DmO24L/Y0LyPelegIoN1YNaqObQ+dZSmj7UkD+wDaUY
 B1Y1DJscBo8bvENSyWyNHQ9TDu1c4px8Yw5roAEWHXyFwvI+b2BBDNcWH
 PQzRLEPFYgsLWe6pW8ASDD9B4+LOQiW7cOz42neYlB2lthA0HKMOiugCH
 kugz6p9JO3y6M0xma1RyDtqAoByekue5aYxQvGQLvHvw17lCs56yQnlTd
 EiPevlqfFMGc0BCUOE6eFLmX/N6wpLL+8FBmy0lPbz6ZfnI0oK4bgU2IK A==;
X-CSE-ConnectionGUID: 5g5un/KRRZGUAUSlHIAeHw==
X-CSE-MsgGUID: 4RMdcuerS6ukpnxubitkXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71640189"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="71640189"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 08:17:51 -0800
X-CSE-ConnectionGUID: DueY4vStSWG2JPHjs8LITQ==
X-CSE-MsgGUID: 1YkrJdQmRVCccUgIogIK7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="210585304"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO [10.245.244.244])
 ([10.245.244.244])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 08:17:48 -0800
Message-ID: <65de6e6accc8e4344d9d068523fe01a6ecc3cff0.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/3] drm/xe/sa: Add lockdep annotations for SA
 manager swap_guard
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>, 
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>
Date: Fri, 06 Feb 2026 17:17:46 +0100
In-Reply-To: <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
References: <20260204164642.3509298-5-satyanarayana.k.v.p@intel.com>
 <20260204164642.3509298-7-satyanarayana.k.v.p@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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

Hi

On Wed, 2026-02-04 at 16:46 +0000, Satyanarayana K V P wrote:
> Annotate the SA manager init path to model taking swap_guard while
> under
> reclaim context. This helps lockdep catch potential circular
> dependencies
> between fs_reclaim and swap_guard in debug builds.
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
>=20
> ---
> V1 -> V2:
> - None.
> ---
> =C2=A0drivers/gpu/drm/xe/xe_sa.c | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
> index b738102575d4..5efbb5a09f77 100644
> --- a/drivers/gpu/drm/xe/xe_sa.c
> +++ b/drivers/gpu/drm/xe/xe_sa.c
> @@ -89,6 +89,12 @@ struct xe_sa_manager
> *__xe_sa_bo_manager_init(struct xe_tile *tile, u32 size,
> =C2=A0 if (ret)
> =C2=A0 return ERR_PTR(ret);
> =C2=A0
> + if (IS_ENABLED(CONFIG_PROVE_LOCKING)) {
> + fs_reclaim_acquire(GFP_KERNEL);
> + might_lock(&sa_manager->swap_guard);
> + fs_reclaim_release(GFP_KERNEL);
> + }
> +
> =C2=A0 shadow =3D xe_managed_bo_create_pin_map(xe, tile, size,
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XE_BO_FLAG_GGTT |

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

In addition to this, a couple of comments to the code that is already
in the driver:

It would be beneficial for understanding if a document section was
added for the typical usage flow of the shadow buffer, something like
the below (hope I got this correct).

*) Clearly stating the use-case: That the whole buffer is bound to HW
and can execute at any time. The shadow buffer is part of a double
buffering scheme so that updates are visible to the hardware
atomically.

*) The flow:
-lock()
-Swap buffers: The buffers are identical. The buffer bound to hardware
becomes the shadow.
-Update the primary buffer.
-Flush the cpu buffer to primary on DGFX (BTW IIRC this was missing in
the code). -Point the HW to the primary buffer.
-sync the shadow to the primary.
-unlock()

In addition perhaps more lockdep asserts an also perhaps pin the lock
in swap buffers and unpin in sync to shadow so that if anybody releases
the lock in between you'd get a warning.

But this can be done as a follow-up, (beware the possibly missing cpu
buffer flush, though). I think it's worth spending some time on this.

Thanks,
Thomas
   A.=20
