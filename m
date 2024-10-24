Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFFDD0BB6C
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 08:14:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C0610E8E1;
	Thu, 24 Oct 2024 08:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hW728307";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D2310E8ED;
 Thu, 24 Oct 2024 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729757640; x=1761293640;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TXF6ovR1TBi2haoUGxUwIHyK1xLy/JPjSLbElEMAZjA=;
 b=hW728307UlZKbFYVZwApW54pOz+ovYvEDzZa6sYE6x7JTbNORxePhtdv
 xgLR2YEv8uIJA9eVPIPz5LRL9FYCNrgSTJMy5do3ZxLEXKci69RKv+gyw
 aYbVzn7hJkc4FDjXwzf1D3LrvJjBV5zWoQ6BbaFIuBfLEdtEUwFNO6Fj5
 CJH5a9IxQqg7LalO7b0Jd0aqIEDFsIMkVsk9lXDfO7nh6E+CF6yF4OR9Z
 /WiKNSAoBFMyeWdh3qhYgSR/YRnvVhkBO++V1lYAqBi8cNJ/c8x3YaheB
 eGgZbzG3YEG+HkYl3XFrGj+x4UKr5L/AHSo0l6nFWXvLznIOVEJiZ03SO A==;
X-CSE-ConnectionGUID: Sse4wPFGSdGIcpg4DSXpfA==
X-CSE-MsgGUID: ZlI41D4dQsepyTEyJrxJ3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29238649"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29238649"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:14:00 -0700
X-CSE-ConnectionGUID: D7eEdbwAQBiBJLjVZ6sVoA==
X-CSE-MsgGUID: h57IPhSvRJ223ppH7PzEJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="85312295"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.216])
 ([10.245.245.216])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 01:13:59 -0700
Message-ID: <77e88e57-eed1-402f-a171-16cb361f9244@intel.com>
Date: Thu, 24 Oct 2024 09:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] drm/xe: Add xe_bo_vm_access
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: mika.kuoppala@intel.com, thomas.hellstrom@linux.intel.com
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-2-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241021211835.1675640-2-matthew.brost@intel.com>
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

On 21/10/2024 22:18, Matthew Brost wrote:
> Add xe_bo_vm_access which is wrapper around ttm_bo_vm_access which takes
> rpm refs for device access.
> 
> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

