Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC71E7716C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 11:49:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C85510E39E;
	Thu,  5 Dec 2024 11:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ISNCpRt5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70910E39E
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733399362; x=1764935362;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HpgCqcQgadH9xbPyDGY4Jd/D7LVuhdiU7dq4x6fyhn0=;
 b=ISNCpRt5KsAO5V8zU4vVxYB5gchBBwlhb0gSE9fTGo0Z0Zj3HiEZegPg
 u+nW4ctMNqocBpmwt8flUIp6XhY63xEPnS7uCMG9yuxb2OJ1C3EI0a9vG
 9FhBkK8O0xejCESYWqoFjyyEudWbdPNVUuVwW+ycCfb5N9mmwE6B2u4v4
 RbTAjUkj7fYLfKKtEZ2BtOwX6CRYkKU9YLyKvQ6GHb6Nn6ZkupGgE5qk1
 t73svxUrr7f3rr/R+oHjToij1W4+9TPDqqgaDvUq1cC4n3rxEvCb6F1Sj
 RnCR8iZagGe0m2hbNjXowSn37+LtifQ3lTeqFVIKAlOTdalWYeEVb/2XG g==;
X-CSE-ConnectionGUID: ahZyjGxsTly9HbQQ70rBtQ==
X-CSE-MsgGUID: 3hIdsU4ESAa9b40jz7JSPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45085156"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="45085156"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:49:22 -0800
X-CSE-ConnectionGUID: uoKWUxDnStC4dclRFRCVNg==
X-CSE-MsgGUID: L201Uj6OSrmGm7aMe836/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99111425"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO [10.245.244.50])
 ([10.245.244.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:49:21 -0800
Message-ID: <01abf9d9-f1c4-4ac4-a69a-c9f1ae36bd4e@intel.com>
Date: Thu, 5 Dec 2024 11:49:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Wait for clear fence operation to complete
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20241205114702.1963303-1-nirmoy.das@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241205114702.1963303-1-nirmoy.das@intel.com>
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

On 05/12/2024 11:47, Nirmoy Das wrote:
> Ensure the clear operation completes before proceeding, as the clear
> fence is not attached to the BO's dma-resv object.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

In theory it is all single timeline underneath, so the later copy job 
would anyway happen after the clear, and we should wait for that. So 
hopefully in practice this is not issue.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/tests/xe_bo.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 3e0ae40ebbd2..c9ec7a313c6b 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -49,6 +49,13 @@ static int ccs_test_migrate(struct xe_tile *tile, struct xe_bo *bo,
>   			KUNIT_FAIL(test, "Failed to submit bo clear.\n");
>   			return PTR_ERR(fence);
>   		}
> +
> +		if (dma_fence_wait_timeout(fence, false, 5 * HZ) <= 0) {
> +			dma_fence_put(fence);
> +			KUNIT_FAIL(test, "Timeout while clearing bo.\n");
> +			return  -ETIME;
> +		}
> +
>   		dma_fence_put(fence);
>   	}
>   

