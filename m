Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAABC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 09:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EB510E782;
	Mon, 31 Aug 2026 09:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l047AtHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA5510E782;
 Mon, 31 Aug 2026 09:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788167248; x=1819703248;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=9eSWmw09i6MwBaJCOQUo+go1cUHCpkxRUSGheAucYBQ=;
 b=l047AtHGaS+Sn8MZZ5LamtcfATMARIh4KZsP1PGacNKtQd9i0K3u/tgR
 xQrAEgrRgzwUynEClx0jmtcHiBB9VvMuYrOVwHx6VXDFaknj7HzuOrUFj
 r9ytJWv/PbWAThp9o3p6TztPUlvJ2IZ+ugrmuQW55+aZH75ZScbPFzqgZ
 +P4CK3YjsnS0+eW8gypXe6dXAuIiXNgt/cAzz8Kvc3T1jJnmhvi/ZVpi7
 j3gxUu+xkPDzKM5l2Jrcrz4xz14FF+TukTTgZdtCJIMQMqKnkNl6y9T2l
 hWfFFEVge7zCpsJO/FdXnK00UD9PNpdVeAXUxPFczJ6GfbbAPiqm1eQXc Q==;
X-CSE-ConnectionGUID: /swJQ5r2SEuKWfkkO1niiQ==
X-CSE-MsgGUID: DQPZOqbYRims3vrlqO7B8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87517599"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="87517599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:07:28 -0700
X-CSE-ConnectionGUID: 23BlEtc0RvOisqLpQDOgSw==
X-CSE-MsgGUID: vuJ3PmefRu+at0MatDXtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="266163872"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 02:07:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [PATCH v5 0/2] match *_PCODE_DATA naming with spec
In-Reply-To: <20260828190956.2622350-1-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260828190956.2622350-1-michal.grzelak@intel.com>
Date: Mon, 31 Aug 2026 12:07:24 +0300
Message-ID: <ec589248a09fcdc58dae59b1c87f0cb7313bfa0f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Fri, 28 Aug 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> Resend of [1]. Last time I messed up versioning in the changelog:
> mentioned change done from v4 to v5, while series was at v4.
>
> BR,
> Micha=C5=82
>
> [1] https://lore.kernel.org/intel-gfx/20260602223640.1375933-1-michal.grz=
elak@intel.com
>
> ---
> Changelog:
> v4->v5
> - clean changelog's versioning
>
> v3->v4
> - apply the rename to the read()'s signature as well (Sashiko)
> - split i915 changes from xe (Jani)
>
> v2->v3
> - resolve conflict from rebase
>
> v1->v2
> - rebase onto drm-tip (Jani)
>
> Micha=C5=82 Grzelak (2):
>   drm/i915/pcode: rename GEN6_PCODE_DATA to match spec

Pushed this one to drm-intel-next...

>   drm/xe/pcode: match argument naming with PCODE_DATAx

...and this one to drm-xe-next.

Thanks for the patches.

BR,
Jani.

>
>  drivers/gpu/drm/i915/display/intel_parent.c   |  4 ++--
>  drivers/gpu/drm/i915/display/intel_parent.h   |  2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c           |  2 +-
>  drivers/gpu/drm/i915/i915_reg.h               |  2 +-
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |  2 +-
>  drivers/gpu/drm/i915/intel_pcode.c            | 14 +++++++-------
>  drivers/gpu/drm/i915/intel_pcode.h            |  2 +-
>  drivers/gpu/drm/xe/display/xe_display_pcode.c |  4 ++--
>  drivers/gpu/drm/xe/xe_pcode.c                 |  4 ++--
>  drivers/gpu/drm/xe/xe_pcode.h                 |  2 +-
>  include/drm/intel/display_parent_interface.h  |  2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)

--=20
Jani Nikula, Intel
