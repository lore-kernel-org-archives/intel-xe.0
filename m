Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB73FE7717F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 09:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C7B10E2E8;
	Thu, 12 Dec 2024 09:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QC9VuXp8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D88A10E2E8
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733995530; x=1765531530;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eqHvAvcUS6S34i/0rF19PjvlLK54ZkbSqoCugumTnIs=;
 b=QC9VuXp8SEUH7v96G9wodWu86a3eZWtGWlC67pykaHXenjS5AyrawmQn
 dbQ34iRFzAlGqkUPLx8H3DbmEOTCkUegU6y+3xf9JBD2gajFXZ9oBA5N9
 nzqvTBtYWulhl2G3gLs4LoZyILaVcC8D/aJQcTXX1GcaU0znsLL2PuJZp
 P5ywwfgh6nJSJlALdOKuukAT76CzqMZImRP4FVwqIGvoR4L3AxKBy31Ai
 sGlX5++mFEN38dTzXTkXhOWAmnUxxR79LY5wIZ32DMdvUX2PYagjZ617H
 JZn6GQQAKk3Od0krMB/4ELW4wdiZvQFST/rgojNFSn0g9SGBOGgsUXXnu Q==;
X-CSE-ConnectionGUID: kfNVHmqvTX+Mzrgg1qFkNg==
X-CSE-MsgGUID: N42mrN7pRQSUCUEOIpZvFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38336675"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38336675"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:25:30 -0800
X-CSE-ConnectionGUID: TA0atadcTN6ZrQcF+8yhxg==
X-CSE-MsgGUID: N5YyZl3zTCOvC06bnLaGzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,228,1728975600"; d="scan'208";a="96597622"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.91])
 ([10.245.245.91])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 01:25:29 -0800
Message-ID: <ead377cc-188f-49e7-83ff-916e666fdf8e@intel.com>
Date: Thu, 12 Dec 2024 09:25:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove a redundant argument check
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, matthew.brost@intel.com
References: <20241211235036.348143-1-gwan-gyeong.mun@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241211235036.348143-1-gwan-gyeong.mun@intel.com>
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

On 11/12/2024 23:50, Gwan-gyeong Mun wrote:
> Remove a redundant check for the extensions member variable of the
> drm_xe_vm_create structure from the xe_vm_create_ioctl function.
> 
> Fixes: f3e9b1f43458 ("drm/xe: Remove async worker and rework sync binds")
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

