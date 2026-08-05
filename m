Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAD4C56201
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 10:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BF710E1DC;
	Wed,  5 Aug 2026 10:33:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQEydVBv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 394A910E1DC
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785926008; x=1817462008;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yoYA04IoQA7jbFUcBhNJH473za9qOl/7JYDPgFmVd04=;
 b=GQEydVBvfyC4mZs5wkkiDYBZIPFTQCTDx79mtfm4uv58AmihPtd36ubj
 DXWccqu0hZbih1XRRSFNlvSztxn8AqVTGOoZSfy0YiYKNlPWsD2Zd4nFZ
 hyDO/xr8R/sFsMyLi62rqspwdomePN2QBfID3KFYAGvCs8hEnhKPnK9dR
 vFVG4txV5auDqqJ6WEwQFAJHM5n4GSL+tOLCLYE0z80WpSP1o5lgYnD/6
 znBOO5S6bxSOb/GGViFKPkp/wkHAgCp3PVAF2vw98unwKj8dtw4fyHf2g
 y4Ulih8lYKH6LzgbJBOcQ5MaQDkAAssniDs+5VW10n3o1AIcD4ou+UrC3 w==;
X-CSE-ConnectionGUID: xDankZp/QNOiCIpD/pMx3g==
X-CSE-MsgGUID: 6hxHmFVVSg++MoEUo42jdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86506339"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="86506339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:33:27 -0700
X-CSE-ConnectionGUID: riTWNnL5QVSqPFmMdAuiCA==
X-CSE-MsgGUID: i4J5FhNQTWuJQdFMjyfKdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; d="scan'208";a="263762317"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO [10.245.244.90])
 ([10.245.244.90])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 03:30:47 -0700
Message-ID: <88b53afb-d7c1-4da1-9708-d0843be27b6d@intel.com>
Date: Wed, 5 Aug 2026 11:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] drm/xe/guc_ads: allocate UM queues in a separate BO
To: Jia Yao <jia.yao@intel.com>, intel-xe@lists.freedesktop.org
Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, stable@vger.kernel.org
References: <20260804165057.129529-1-jia.yao@intel.com>
 <20260804165057.129529-2-jia.yao@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260804165057.129529-2-jia.yao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 04/08/2026 17:50, Jia Yao wrote:
> Move the UM queues into a dedicated UC BO (ads->um_queue_bo) and avoid
> CPU memset operations on it, which eliminates the CPU as a potential
> cacheline-polluting agent and helps maintain consistency between GAM
> writes and GuC reads.
> 
> Fixes: 9c57bc08652a ("drm/xe/lnl: Drop force_probe requirement")
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Signed-off-by: Jia Yao <jia.yao@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

