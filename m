Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED96FC369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 18:11:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A913410E39D;
	Thu, 17 Apr 2025 18:11:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsPMJ+uw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA0610E39D
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 18:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744913467; x=1776449467;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lvVzOpBVBvI3THC4YUCdYRRMm2Ea4DytEB/IU5OlS0g=;
 b=hsPMJ+uwphfuFui1dAvbiG2ScPkYuBncJox9RjRtUU2NeVKgCbbwI+DD
 SGQsLT/mS5h7x2qHhPAFlBRVWYd01/EI7vHp1tVWH1wIjO39hF1od0qzY
 0F89M9qew4FULgjK1FR7+gDog99+yU4N3lTIuawMj2ECF0k8BxHYL4WtN
 rkJi/K3Ks1PVnmHBDshbnzW4UY5NxqGP2AlsIUqGj7mE9WxvdDrIR3PSC
 kImO6ko0JnoIM1e7KZPh3zCE6O7jKSnOA/EaEh3yMPJLxuah++R6WZHCs
 6rt3fMn99n+vl6n4AAn4cvan0up4cFR5dBgzkay1lQvGjBdKb99O8HQsj A==;
X-CSE-ConnectionGUID: 4cLcoLnZQ+CxcBx8BsZubw==
X-CSE-MsgGUID: AkxDn/NfTwSPYkjIFLIV/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46657537"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46657537"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 11:11:01 -0700
X-CSE-ConnectionGUID: oghNkrAWSUuJJliwNBpaaA==
X-CSE-MsgGUID: ymdVwru6S8abs7lTy7ZWHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="135728292"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 11:10:59 -0700
Received: from [10.245.81.148] (nowickik-mobl5.ger.corp.intel.com
 [10.245.81.148])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id B8AA034957;
 Thu, 17 Apr 2025 19:10:57 +0100 (IST)
Message-ID: <14387ed9-074a-48ac-822a-d1d7b3f6260e@intel.com>
Date: Thu, 17 Apr 2025 20:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/4] drm/xe/vf: Divide GGTT ballooning into allocation
 and insertion
To: Tomasz Lis <tomasz.lis@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250415222030.3616494-1-tomasz.lis@intel.com>
 <20250415222030.3616494-2-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250415222030.3616494-2-tomasz.lis@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 16.04.2025 00:20, Tomasz Lis wrote:
> The balloon nodes, which are used to fill areas of GGTT inaccessible
> for a specific VF, were allocated and inserted into GGTT within one
> function. To be able to re-use that insertion code during VF
> migration recovery, we need to split it.
> 
> This patch separates allocation (init/fini functs) from the insertion
> of balloons (balloon/deballoon functs). Locks are also moved to ensure
> calls from post-migration recovery worker will not cause a deadlock.
> 
> v2: Moved declarations to proper header
> v3: Rephrased description, introduced "_locked" versions of some
>   functs, more lockdep checks, some functions renamed, altered error
>   handling, added missing kerneldocs.
> v4: Suffixed more functs with `_locked`, moved lockdep asserts,
>   fixed finalization in error path, added asserts
> v5: Renamed another few functs, used xe_ggtt_node_allocated(),
>   moved lockdep back again to avoid null dereference, added
>   asserts, improved comments
> v6: Changed params of cleanup_ggtt()
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---

hmm, still not 100% happy with all this gt<->tile dance that seems to be
unavoidable right now, likely we need to do little refactor and move
some stuff to xe_tile_sriov_vf.* files, but that's really not your
fault, so let this is in as-is and try to cleanup later,

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

