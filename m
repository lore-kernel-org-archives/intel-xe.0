Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578AFC02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 11:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1692310EAC9;
	Fri,  7 Feb 2025 11:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Swu2to6p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B92310EAC9;
 Fri,  7 Feb 2025 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738927259; x=1770463259;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qhJehbDnCc0pejxhvq0x4zcRJyh/4iNQH72cN1mBS5o=;
 b=Swu2to6pyXzSVrNwSkXrN6Dxf4z8wLw7Q4dEjJyxGt29OyN4OStpZMD4
 Yx+mVX1QKmT6VKVtELBzQBb0tTF45kO4UhgjF+bJLBWwLxu67r38riqab
 YJSTEZIxK6kwkvLkfti8Wce9A3Fo9Z76M/65PtvY2pkPqYpXCf//bSCoq
 2d8BX2CFjvARB285CejPlBWq3n3WKJjG6j0qfrmd4DQ+WQndmGeqQ3+ij
 dY5DBrCuRUWwnoPm+7B4GeIFne6fDE3vKidqRP+GB8M7Mo9hnrQkWc2wn
 6W5oBs4Z2c9udRK9BZ5VaT8FcDfZBrmC3rnJEh92vaU3NrTxTHixM33fI A==;
X-CSE-ConnectionGUID: HPWZnsVFS9edZPErjafd/w==
X-CSE-MsgGUID: vmxslODjQZmLk1auLVLLGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39591094"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39591094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:20:58 -0800
X-CSE-ConnectionGUID: xOJ3hMbDQIepXwrIHaDpxA==
X-CSE-MsgGUID: gkPwOPkpTx+o6AVrHntcPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="111463885"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.177.77])
 ([10.245.177.77])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:20:54 -0800
Message-ID: <9e4dc499-395f-4255-b854-12b665f37cdd@linux.intel.com>
Date: Fri, 7 Feb 2025 12:20:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add TTM reviewers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20250206103544.36971-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 2/6/2025 11:35 AM, Thomas Hellström wrote:
> Add Matthew Auld and Matthew Brost as TTM reviewers
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4dbf6a03e416..7a032ea9f109 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7931,6 +7931,8 @@ F:	include/drm/drm_privacy_screen*
>  DRM TTM SUBSYSTEM
>  M:	Christian Koenig <christian.koenig@amd.com>
>  M:	Huang Rui <ray.huang@amd.com>
> +R:	Matthew Auld <matthew.auld@intel.com>
> +R:	Matthew Brost <matthew.brost@intel.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
