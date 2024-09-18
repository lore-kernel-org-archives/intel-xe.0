Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05634CDD548
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 16:16:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C771E10E1A9;
	Wed, 18 Sep 2024 16:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtFBoMYx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F0310E1A9
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 16:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726676187; x=1758212187;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4ZjJqTBeCH/OIWT9hxVpHoUdI74XTczSSTpOvCrD+0g=;
 b=VtFBoMYxOZ6d7wh4WCyWFXS95KsqDku8rMkeDq/3qyLjJ3o1GSKQ9SOZ
 2whsnveOv0uhR5t2Y3L1vSxKEJsgAN7vddnEHAU0mYwRj+MQARuo1dX6r
 MPzsZO670o6wIYc7Zzfq8eFxWJyFhmXusHkKXn7e8//Rr4hb0bHeuyPQG
 M/UXJGws5KfdJQkgNEyrO0GGi+yJHvZgSpn3u8t6DisKC3+purzjaDKkQ
 0iEO/t+fpHPqWjyerWiXoSBf4FoWv+eI1h93kAsqBA9/v7+G8SB+R9D2M
 mnGgvhCxzwEjqQptNaNdFG40LdPMEF9LSNfIKLqnvySdqa2SerVQCEkFd Q==;
X-CSE-ConnectionGUID: fxR1ypfJQem82ikDXu0YRw==
X-CSE-MsgGUID: ntGacetoTsqUZtA3Q5DFlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43075003"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="43075003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:16:27 -0700
X-CSE-ConnectionGUID: IAE+SI6TTfO3pf7SqvfMOg==
X-CSE-MsgGUID: r9fvpSbDQj+KTLM+80HmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="69918843"
Received: from carterle-desk.ger.corp.intel.com (HELO [10.245.245.137])
 ([10.245.245.137])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 09:16:22 -0700
Message-ID: <26f2f7e2-ef9e-497c-a86e-21369187c7d3@intel.com>
Date: Wed, 18 Sep 2024 17:16:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Use helper for ASID -> VM in GPU faults and
 access counters
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240918160503.2021315-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240918160503.2021315-1-matthew.brost@intel.com>
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

On 18/09/2024 17:05, Matthew Brost wrote:
> Normalize both code paths with a helper. Fixes a possible leak access
> counter path too.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
