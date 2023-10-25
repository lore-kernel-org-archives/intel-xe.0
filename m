Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD65C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 09:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE5F10E614;
	Wed, 25 Oct 2023 09:25:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEA4A10E614
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698225957; x=1729761957;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Ad6cKQAf7BK8M5mAyy1D3ZaR45uSHqvddEso9LaDTjQ=;
 b=U5HVFLCqJYspNWw12yCPUiWvdykxXnEzDXQXZ8wu7j+2BDub0g7XjA7h
 MsWT1DqrGuh73jl+EPXYsH1Yn3jGtdXc1C7zdn44y9PXYd/NCZR7+6dIK
 q7Mr3EOeHAE+6kAPLd6majluXtnesj+OwwiVX2Yw342kQtbJAubKEkgqq
 aG8qEcuIc1mk21D1m/hDyiIK0GXHI+BgqTUa3v2gLwmgjLb48Osqf0wvr
 nDBALzME12zUT4PN0pbtDtv7WwAztASiXg033t91qlrlP1oWg+Qn1/XW4
 WFvceLixKzJdrtwrnmFLUzrodscJllcejGxAieLlJMXBDVMyACTkrZIbL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="473508426"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="473508426"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005946377"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="1005946377"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.33.83])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 02:25:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231023063420.3298731-1-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231023063420.3298731-1-jouni.hogander@intel.com>
Date: Wed, 25 Oct 2023 12:25:53 +0300
Message-ID: <87a5s79hpa.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 0/4] Revert remaining local fb tracking
 patches and backport
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 23 Oct 2023, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> There are still two local frontbuffer tracking patches. Revert these
> and backport same patches from upstream.

Thanks,

Acked-by: Jani Nikula <jani.nikula@intel.com>


>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>
> Jouni H=C3=B6gander (4):
>   Revert "drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base"
>   Revert "drm/i915/display: Move releasing gem object away from fb
>     tracking"
>   drm/i915/display: Move releasing gem object away from fb tracking
>   drm/i915/display: Use intel_bo_to_drm_bo instead of obj->base

--=20
Jani Nikula, Intel
