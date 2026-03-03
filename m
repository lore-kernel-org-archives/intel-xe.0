Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F24EC1451
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 14:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5777810E08A;
	Tue,  3 Mar 2026 14:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCFqsiT6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0C810E08A;
 Tue,  3 Mar 2026 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772547420; x=1804083420;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=ZzxHoTWdrXgtNLQ9C83dd1WtmbLvP0U/VOkEB5I53fo=;
 b=gCFqsiT6usXGedRPhLwDO3Gir6TsXoP3QGdM1+TiDw9X8PSjVTduPi/G
 VPITRQZ0uPDWARdkvCrJoxngo1A/o6FQB/m6dIEs6rmlYn9u8oEIbO75B
 ELE/7zoCYal0IFrdG0gWTi7jEN8W3dYG0FjtXrVz4/BQn1e90qjyLnWdr
 mWPBJr0YMQYuhpJLPt6goIyGpChPyrgQvDy+B2Pe9TVXqke3p21WuEAUn
 pIJb2BQW8jcJ5Dp8Z/cUi6fzf1f5+vxvR1Gyfz4IW3voBFlgLK+/JRf6c
 2Gu112vPJTmN6RTFYuRCju/KZ3fZp5aRwrl0A7nXD6LrDXxzFRT6pQaxg g==;
X-CSE-ConnectionGUID: xc/lhUsrRYG9GPn6YhkkTg==
X-CSE-MsgGUID: e0xXlrSSTWqgsV6Pzs0VDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73545949"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73545949"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:16:59 -0800
X-CSE-ConnectionGUID: nEtGD+u4Qky9jgG6cIXNoQ==
X-CSE-MsgGUID: ZKysNJxUQEeffppE+eReqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="248504615"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 06:16:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/i915/fbdev: stop debug logging i915_ggtt_offset()
In-Reply-To: <81365e1b-889e-a631-1227-6f766e279a65@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1772212579.git.jani.nikula@intel.com>
 <c3b84cb572c7ee94389e702aba4dcacb26c41673.1772212579.git.jani.nikula@intel.com>
 <81365e1b-889e-a631-1227-6f766e279a65@intel.com>
Date: Tue, 03 Mar 2026 16:16:53 +0200
Message-ID: <6432d3f46668852f151d45c0ee2d7b4268f91185@intel.com>
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

On Mon, 02 Mar 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> On Fri, 27 Feb 2026, Jani Nikula wrote:
>> The debug logging in fbdev is the only user of i915_ggtt_offset() in
>> display code. Just stop doing it to drop a dependency on i915_vma.h.
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>

Thanks for the review, series pushed to drm-intel-next.

BR,
Jani.

>
> BR,
> Micha=C5=82

--=20
Jani Nikula, Intel
