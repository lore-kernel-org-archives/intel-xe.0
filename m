Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4923CCD98CF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 09:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60C210E997;
	Tue, 16 Jun 2026 09:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPZkhHps";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE25A89F27;
 Tue, 16 Jun 2026 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781603074; x=1813139074;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qSRv94D70lgzalpjg5g3E7F7yI+8EaUM/trmsh55Sas=;
 b=OPZkhHpsxvgZrjKqFLKcj5Vw5zHuDvuZLJ9/VbsePIbOOzLekLkiExFu
 4zEoO8qXRZL1nsjxVxZvEuUYTDrFwF0OzOHgxLwHP4QcnLr1vfwT1D65/
 g36McU86dbf9IP23NjCTeD1Ls9BkSWS+5H0hZ7MAXHU2NGXLp6qrNgqzO
 QfGd5MpnKelrO/IGFPgi7fv09teI7/0Y9vo46huF7U9b/2nr+/qpO5Xlo
 utOkptbOrqezA0FRxojSlpPpeNoBipWCBudJMq1noilEeOAL3kKRF0omS
 3DkzAndavJsNuAC285TqASpVNn2YY/fYcJjioTCbGjJAkXWR5xawUFbSS A==;
X-CSE-ConnectionGUID: kdWpa06pRritxiC9lCxhhw==
X-CSE-MsgGUID: yntxh/mSQ9G1o6ml3uAr5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82263318"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82263318"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:44:34 -0700
X-CSE-ConnectionGUID: 5AAVsjFKRkeP15iwRTgcng==
X-CSE-MsgGUID: bE+4gyM3SE6Pfam2RX9l/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252697427"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:44:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] drm/intel: drop driver include from mchbar_regs.h
In-Reply-To: <4c103455-61fe-eaa7-b5d0-72414ae4995e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260615152837.1898991-1-jani.nikula@intel.com>
 <4c103455-61fe-eaa7-b5d0-72414ae4995e@intel.com>
Date: Tue, 16 Jun 2026 12:44:30 +0300
Message-ID: <8e6df95bafcb9ad801e00fefb858d02e5f5f9643@intel.com>
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

On Mon, 15 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On Mon, 15 Jun 2026, Jani Nikula wrote:
>> Headers under include/ aren't supposed to try to include headers from
>> driver directories, such as i915_reg_defs.h. Remove it.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thanks, pushed to din.

BR,
Jani.

--=20
Jani Nikula, Intel
