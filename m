Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7C18C55184
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 11:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F33E10E320;
	Mon,  3 Aug 2026 11:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4HwJG6y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B4710E295;
 Mon,  3 Aug 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785758106; x=1817294106;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=ZKbQz9yCKx2mi+sao6+xZxH4y/dcJxLJqj/Hwe6Yyh0=;
 b=k4HwJG6yMNW8cHwS25b5VNnGimx2ygTyiuVf46ZN4uHV/Dm94sIzk8kl
 WDjnZR/U3YUI98uPyFuSqKYjaox8YT797AFB1JT29uhaZLzY463lGdx1n
 R4ToHJ4ghWyNfOCX6JfjIas2cyXfDQfZGRtAkz1Jl6mUEYb5E9+7Reicb
 XTXR0Cpe1JDd0+JU3TEyBKYOUoy6gYuCaUUPVxve3UHv/C6v2i5C71y5D
 fp9fyVo92S1SoNVxaQBSs0ZxJPs5gzoNodfvNoBeGw31SiZN1FbnNoeFL
 s400JyMRyIY0+YVFgCrJl05/XdEDMbDZIQiwHbIuELUX3a+qoLmidJ981 g==;
X-CSE-ConnectionGUID: BSWdh/6TRWS9ntZIMeAsgA==
X-CSE-MsgGUID: MV0h0w/TT82jPI+QqHtv+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="103831863"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="103831863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 04:55:06 -0700
X-CSE-ConnectionGUID: VXl+k2e7T3GVMt+raduMSQ==
X-CSE-MsgGUID: e67yAUubRJCgyXD4o2uZ6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="261791730"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.30])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 04:55:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/{i915, xe}/display: add core workaround query to
 display parent interface
In-Reply-To: <DS4PPFE901A304FB7CAB444AB9AF146CF3BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260728162514.594285-1-jani.nikula@intel.com>
 <20260728170257.615855-1-jani.nikula@intel.com>
 <DS4PPFE901A304FB7CAB444AB9AF146CF3BE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Mon, 03 Aug 2026 14:55:01 +0300
Message-ID: <90df57bc7908d2f6adefc0b2cd8f19c562d0e6e3@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 03 Aug 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
> Should we maybe have a comment documenting when it is okay to use this, basically use this only if unavoidable and when
> Required info is available in only core driver to avoid it being misused in future.

Makes sense, v3 with some comments sent.

> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

Thanks,
Jani.

-- 
Jani Nikula, Intel
