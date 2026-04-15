Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D23FA0C57
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 08:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604E010E6A7;
	Wed, 15 Apr 2026 08:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G88NLxPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728FD10E6A9
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 08:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776243285; x=1807779285;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GrQGY9NL8QJeuq8sQXuYXiI3np99Va0u5sZNXCQO4Ek=;
 b=G88NLxPk3OQS46F+P1yrWFzRxdpdSs8ws0p7G3C8xU/shi6d7VCw0OhY
 cn3lbxTgJx/KU7i4ReP9NQSiOY3IYqSnKmxRt2CgXZqImlD/v5aGKSfNa
 TnjVW8xYFGa7uKssZtVHsloYOdgLO1iofne3q8/JIk8MUT4JzajWFaX2I
 VBjzCHuNUA2TMukfXmDhq9JPyU4tnIql2+xnG6ckE8EDx+ahHdgXyj6rQ
 pvhoSEjv/rbkLI3UAvoVXuaRq1QnC28pkWezkV6d4a0RmzRicCCQY+5oI
 K+2ABXzOAk8SnsmXgYJRmyDe2SERudmrVRwnPL+AywcyASu4SgmZOwur3 Q==;
X-CSE-ConnectionGUID: y2JCoKsLRduVs+F4Vkl1Ng==
X-CSE-MsgGUID: Sosh/5OXQpWHbN810zchzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="76918499"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="76918499"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 01:54:44 -0700
X-CSE-ConnectionGUID: DmUXQZW+RPeti1SxtbBYvA==
X-CSE-MsgGUID: 25I2CSxVRy6cGt/NjwsEmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="227178896"
Received: from rvuia-mobl.ger.corp.intel.com (HELO [10.245.244.112])
 ([10.245.244.112])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 01:54:43 -0700
Message-ID: <9f9ae5d0-c857-406d-9a03-515021e725ef@intel.com>
Date: Wed, 15 Apr 2026 09:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] drm/xe/pat: Introduce xe_cache_pat_idx() helper
To: Xin Wang <x.wang@intel.com>, intel-xe@lists.freedesktop.org
References: <20260414211453.303679-1-x.wang@intel.com>
 <20260414211453.303679-4-x.wang@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260414211453.303679-4-x.wang@intel.com>
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

On 14/04/2026 22:14, Xin Wang wrote:
> Add an inline helper xe_cache_pat_idx() that wraps pat.idx[] read
> accesses with xe_assert() validation, catching any attempt to use
> an invalid PAT index at runtime.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
