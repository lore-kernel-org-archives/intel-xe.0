Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE30C77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 12 May 2023 06:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B94B10E4DF;
	Fri, 12 May 2023 06:19:02 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A3110E4DF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 May 2023 06:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683872339; x=1715408339;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=R5oKJPJYPJXcO1n5n42aA/13wdALB1hdAR28F9APQL0=;
 b=LNBR2zy53WfrrZ0clL6PUS0LbpQKZVIPoQYr5SLJXFi86Sn54vQ74upw
 Anflie8tFLvn6v5BxLD4K13m2+9lGweax60O4DcaPH5IGyBrfw5RcRD2d
 5Ungmc7jzk7gIv6cXtuuW2EruQrsF5h4cak9zXBepx64f37QhFG0PP5MX
 VObBiGBY9ocf+tiREpW5ttEAdDDqTqHSD8bl/JKqS/b2ZVZl/Koi01fh+
 tLM9hs/xxM9ae1zUYvFT52clxwvhGgSP24hPfZOIoamV6uIBDaqvTJuHZ
 brt76FDrIh85vHkKxLmUNuAlc1bRsL70gMLxnzOFb1f1cemptYY+pWI6v w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="340025489"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="340025489"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="844293388"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; d="scan'208";a="844293388"
Received: from rschau1-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.62.60])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 23:18:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, intel-xe@lists.freedesktop.org
In-Reply-To: <20230511194822.626036-1-gustavo.sousa@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230511194822.626036-1-gustavo.sousa@intel.com>
Date: Fri, 12 May 2023 09:18:54 +0300
Message-ID: <878rdukr75.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 0/2] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

On Thu, 11 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
> This is a v2 of this[1] single-patch series.

Thanks, LGTM.

>
> [1] https://patchwork.freedesktop.org/series/117559/
>
> Gustavo Sousa (2):
>   drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
>   drm/xe: Call exit functions when xe_register_pci_driver() fails
>
>  drivers/gpu/drm/xe/xe_module.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)

-- 
Jani Nikula, Intel Open Source Graphics Center
