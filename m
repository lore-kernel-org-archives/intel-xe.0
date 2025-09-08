Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC197CA1013
	for <intel-xe@archiver.kernel.org>; Mon,  8 Sep 2025 10:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C09D10E4BD;
	Mon,  8 Sep 2025 10:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L0G+E4S8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4071F10E4C6;
 Mon,  8 Sep 2025 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757326138; x=1788862138;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yv0ynS2pz5WJLY5xudp0NhwfkIIneS8CGj18mEWX4bQ=;
 b=L0G+E4S8e9NRCdhCE4zagYq9gYSbzfapjNPwvbSjANLQQ19kn3wbvktl
 9USrjQOgcObIkXL/CpfrW9pRyDj1Y+0YBQd3mG3L9nZgiAcsRrCd4S2Cp
 +uRS0eH5Srzlsxau8DoVufp+YRZv7mzuHjtvBxN/tmH6fkADM1XADWQUF
 hJnFtBtPhgmoSI7EHQdcjo1eXimgi9H/ibk2cYPpnVlZ45I5zZdDEW3BZ
 cRXt83RH9cNV4Q48YclsVOsXnPAqP8lGlxsUe9CYVJaDXrBKxxvp3svXg
 7wpFW4AOgk6cBfzHve+1B4GqQ77zeH/MN+fkbOqvWc1IhRVDWs4+cT9K6 Q==;
X-CSE-ConnectionGUID: v4Q/pqQMSDyrA/w3hm+Tvw==
X-CSE-MsgGUID: hDDLSlfjTTmCIvGtMQrmvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11546"; a="62212050"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="62212050"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:08:58 -0700
X-CSE-ConnectionGUID: sXhkcXAKShqz3zv+gpRAxA==
X-CSE-MsgGUID: x7CfLfZzTdGAkl46eLNy9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="173216543"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 03:08:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/power: fix size for for_each_set_bit() in abox
 iteration
In-Reply-To: <20250905155523.GC5752@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250905104149.1144751-1-jani.nikula@intel.com>
 <20250905155523.GC5752@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 08 Sep 2025 13:08:52 +0300
Message-ID: <ba480c6e5ab4971fcaec64d74545289b04f1ad3f@intel.com>
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

On Fri, 05 Sep 2025, Matt Roper <matthew.d.roper@intel.com> wrote:
> On Fri, Sep 05, 2025 at 01:41:49PM +0300, Jani Nikula wrote:
>> for_each_set_bit() expects size to be in bits, not bytes. The abox mask
>> iteration uses bytes, but it works by coincidence, because the local
>> variable holding the mask is unsigned long, and the mask only ever has
>> bit 2 as the highest bit. Using a smaller type could lead to subtle and
>> very hard to track bugs.
>>=20
>> Fixes: 62afef2811e4 ("drm/i915/rkl: RKL uses ABOX0 for pixel transfers")
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: <stable@vger.kernel.org> # v5.9+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Good catch.
>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Thanks, pushed to din.

BR,
Jani.

--=20
Jani Nikula, Intel
