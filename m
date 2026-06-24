Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23E2CDE001
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jun 2026 08:12:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B27710EDF7;
	Wed, 24 Jun 2026 08:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8QcgOfd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7DD210EDF7;
 Wed, 24 Jun 2026 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782288742; x=1813824742;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=R9BaisGGs03sDOVW59pplw/2RA5lc4PDyV0kbgwWnXU=;
 b=h8QcgOfdwlf+e5B4qL2yYIj7F5NFCEyReXD4pujeUwc16Ukv2ac/aloW
 a0XLqnlCZBGd7uyQL261qfmDxJihNHMuqyum7NgMIAGVOWQtPkCEvu4HS
 kEccEM9n/M8HdHUDr5sU/YAbx0XIbXpK8ZDbFg/H0KA2X6x4/2AOHigle
 EsaN9y/+yH7B3DjkA0y/4BWd5Ob4H9s/l30txosrQyi2n+TJIpLjnuKex
 RFG/cpxd7nlIanxOIYuBpdw9fq4zWaL1G+f6bBc0ywGLLCtLevLnMVzJy
 Op5UKozi2CEMVxtzYf8CBJvGxrlE5rPSMXcDidJ80MZqEBXlXL9rMo8p6 g==;
X-CSE-ConnectionGUID: 4m/UOnd1R4q/GLuz+XgTzA==
X-CSE-MsgGUID: Qa13rCYBSdOlSRuvyBQFJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100467777"
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="100467777"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2026 01:12:21 -0700
X-CSE-ConnectionGUID: gOG4P8nQQDO4TDvdwsFegw==
X-CSE-MsgGUID: irP+Qqx+RiK26ivmHAvWCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,222,1774335600"; d="scan'208";a="246853439"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 01:12:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Nemesa Garg <nemesa.garg@intel.com>, Imre Deak
 <imre.deak@intel.com>, =?utf-8?Q?Micha=C5=82?= Grzelak
 <michal.grzelak@intel.com>
Subject: Re: [PATCH v1 00/30] Comments applied to dp_link_caps
In-Reply-To: <20260623224619.1949975-1-michal.grzelak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260623224619.1949975-1-michal.grzelak@intel.com>
Date: Wed, 24 Jun 2026 11:12:15 +0300
Message-ID: <bd0e954b181d820e69a385b6698d596ce16f36f2@intel.com>
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

On Wed, 24 Jun 2026, Micha=C5=82 Grzelak <michal.grzelak@intel.com> wrote:
> To not block review of Imre's v2 of part2 series [1] I've applied my
> comments on top of it since they are not critical to the overall design,
> and can be looked afterwards; assuming they are at all valid :). Unlike
> previous times, now those resended patches should be free from
> disappointing mistakes like eg. duplication of From: tag or missing
> Signed-off-by: of resender.

Did you check with Imre before sending this?

Usually it's best to let the person doing the upstreaming to keep
posting new versions of their series at their own pace, instead of
sending series on their behalf. If you have your own work that depends
on the other person's changes, please just have patience, and keep them
in a local branch until the dependencies have been merged.


BR,
Jani.


--=20
Jani Nikula, Intel
