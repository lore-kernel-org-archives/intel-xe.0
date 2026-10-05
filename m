Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC18CA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 14:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597210E5D4;
	Mon,  5 Oct 2026 14:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vt7khBmn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D953710E5D4
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 14:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791209107; x=1822745107;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=97Unq8GYne1dXa/+Rs78hwZVM6jkCTdmePc3rV39aMs=;
 b=Vt7khBmnRvgHRT1q475dcCnEEKDjDr5jGyq6RMsQBtx0BvdgbHXVjb+y
 TI8xeddmrylUimL93cqd9hjYKUu/gkRTV8KnYdeYsAlxuBNhqThXmwsxY
 c+0WV1fZrVyQ1ZVVCNiwil3wOAuEEfJiKR+EDF8Tf6SpenBetGRlhlBUG
 /tc8jaA5Ei87xCuKuTX0Q1G67iLB+KPJAEj92ohEMO5fIEU1I5YU5oMRC
 X0DJG/4/FBFv+k5+TSDhdyF/nKM+JLp4Tolc1s83B69ap1iiY1YibVX2j
 nokPVn3QouDWCMOs7oCEcaP4v19SoALubTrcx2mrZRmLKbcvMDBoYTMLj w==;
X-CSE-ConnectionGUID: ZGHz6fBXSMCdKDmUA7c9Jw==
X-CSE-MsgGUID: NbGX1Q5ZSRi8KEM8vt2zEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102397445"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="102397445"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:05:07 -0700
X-CSE-ConnectionGUID: DIgbAAcNTMK+xp9pQgzHFA==
X-CSE-MsgGUID: AheZbWIcQlSSWCIcAWw0/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="841514"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.196])
 ([10.245.245.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 07:05:05 -0700
Message-ID: <5e673ef2-0a88-4dc2-a4be-ebdab0523d9d@intel.com>
Date: Mon, 5 Oct 2026 15:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Don't allow XE_VALIDATION_UNIMPLEMENTED outside
 of debug builds
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20261005135135.161447-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20261005135135.161447-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 05/10/2026 14:51, Thomas Hellström wrote:
> The XE_VALIDATION_UNIMPLEMENTED macro is only intended for convenience
> use during development. It is not allowed in production builds.
> 
> Ensure that by conditioning it on CONFIG_DRM_XE_DEBUG.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

