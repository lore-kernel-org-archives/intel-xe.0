Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADCBC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AC6410F854;
	Thu, 14 Mar 2024 10:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kpiJJD1U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4D510F854
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710411894; x=1741947894;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=gy0RYec7UdOMNo0hKgF1tNPsyE1FWTnnoZF1Li6q3FI=;
 b=kpiJJD1U6OqjTNVOyx/cNqTRY40M/W9wUhDqxHeoGLPU+563p+vcvuAw
 /C6NgplLJ2VxdrVKrEAtxpqAHJzsqZEMOd3cbSHfIhWCUgPcIJP8VXVXl
 Vd6BB8dLNzAIU8/8zuJzMtUgqYgjeK9nJEWJ3aFTgYHTtORcB/pSXc4Jm
 Vh8k5f6+kkLA1sDEBQ9v9uuC/y3CXbgid1S7eXfUi7ihsoQFfYrFfXjUF
 KuiARXCssxQId5KGSfjOLQfi78ZRJvMkQo8Dqat0GSeCIusnkHVEGCI7W
 YJp19PUkg/4xjTUCBQjcMYTzPTP8QZXAjAob7afG+u/P/m+iU9H9Pioxv Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5348567"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5348567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12132246"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:24:52 -0700
Message-ID: <56ca1611-ebe3-4d90-9f7d-58706140b415@intel.com>
Date: Thu, 14 Mar 2024 10:24:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Fix potential integer overflow in page size
 calculation
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240314095442.32153-1-nirmoy.das@intel.com>
 <20240314095442.32153-2-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314095442.32153-2-nirmoy.das@intel.com>
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

On 14/03/2024 09:54, Nirmoy Das wrote:
> Explicitly cast tbo->page_alignment to u64 before bit-shifting to
> prevent overflow when assigning to min_page_size.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
