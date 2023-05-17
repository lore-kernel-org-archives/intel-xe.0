Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E278CC77B7D
	for <intel-xe@archiver.kernel.org>; Wed, 17 May 2023 16:53:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F64710E063;
	Wed, 17 May 2023 16:53:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E46B10E22C
 for <intel-xe@lists.freedesktop.org>; Wed, 17 May 2023 16:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684342403; x=1715878403;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=zlM3kP4hp5rN0Hs4WN9Ekg9zOlY4tsi7W+q+UIJUi8I=;
 b=STvnx4GEjbmWPS9VeaEsILnEA2fZi/OEsxTrSybeyA/H/VEf0fURnNaW
 FSFcV2CFsYCcWKP/b97GKS9yojwStdaYUa6V7wZXO/qBLBiTScE5BgZU7
 J2G81fPaZKIrFuY9OPSv6Z2aKAwQXEKlh16RSz7lC4Fc6Pr21E5NXlSvB
 iNk4d00EQ80oxcmCREDZqHVjclrPFgvSoHaP7PMRtMxYi1gmUPNFi0Uob
 OyyU7iPXJveLP6uoTTgiby6BcG+gf7jZkdc+T359ziRXRUlZEiJSA77hE
 FzryGjDz91K+lbNldo+f1nF8J5EPHAyAbwlZjj1sngT8ZvSkpV0hLZaNm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="351836789"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="351836789"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="948343965"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; d="scan'208";a="948343965"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.183])
 ([10.249.254.183])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:53:21 -0700
Message-ID: <a61c079e8dca1179d4a3344e8b887bf0df0bcb80.camel@linux.intel.com>
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Date: Wed, 17 May 2023 18:53:18 +0200
In-Reply-To: <20230502001727.3211096-31-matthew.brost@intel.com>
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-31-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Subject: Re: [Intel-xe] [PATCH v2 30/31] drm/xe: remove async worker,
 sync binds, new error handling
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

Hi, Matthew

Some quick comments below. I really need to apply this patch to see the
resulting code so I'll do a full review in the next version where I
have something that applies cleanly.

/Thomas

On Mon, 2023-05-01 at 17:17 -0700, Matthew Brost wrote:
> Async worker is gone, all jobs and memory allocations done in IOCTL.

Done synchronously?

>=20
> Async vs. sync now means when do bind operations complete relative to
> the IOCTL. Async completes when out-syncs signal while sync completes
> when the IOCTL returns. In-syncs and out-syncs are only allowed in
> async
> mode.
>=20
> The error handling is similar to before, on memory allocation errors
> binds are pause, VM is put in an error state, and the bind IOCTL
> returns -ENOSPC. The user is allowed to issue sync unbinds, with the
> reclaim bit set, while in an error state. Bind operations without the
> reclaim bit set are rejected with -EALREADY until the exits the error
> state. To exit the error issue a restart bind operation which will
> pick
> up where the original failure left off.

What about -EINTR?

>=20
> TODO: Update kernel doc

This is done in the next patch in the series, right? so we can drop
this TODO?

>=20
> Signed-off-by: Matthew Brost <mattthew.brost@intel.com>
> ---
> =C2=A0drivers/gpu/drm/xe/xe_engine.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 7 +-
> =C2=A0drivers/gpu/drm/xe/xe_engine_types.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A0drivers/gpu/drm/xe/xe_exec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 --
> =C2=A0drivers/gpu/drm/xe/xe_sync.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +-
> =C2=A0drivers/gpu/drm/xe/xe_sync.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/gpu/drm/xe/xe_vm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 712 ++++++----------------
> --
> =C2=A0drivers/gpu/drm/xe/xe_vm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 -
> =C2=A0drivers/gpu/drm/xe/xe_vm_types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 37 +-
> =C2=A0drivers/gpu/drm/xe/xe_wait_user_fence.c |=C2=A0 43 +-
> =C2=A0include/uapi/drm/xe_drm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 79 +--
> =C2=A010 files changed, 213 insertions(+), 726 deletions(-)
>=20

