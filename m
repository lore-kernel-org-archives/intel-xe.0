Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEA2C4828D
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC24F10E104;
	Thu,  1 Feb 2024 19:20:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K75q4Gpj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8F10E104
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 19:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706815238; x=1738351238;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=aztE2KV5oKZLqIeXeQ3MFhwG9y4cekzrXQ8z+hbx6NM=;
 b=K75q4GpjAIRU+5xgSub09bGbUSzKs8yu1Wp3QXJ9v771Uv+eDwAV78sz
 Qbop51KmHv8sKvOQVPWhdWsMNavA3YEQ0U1hD+07a+a6eE2cVHIqBr4uw
 h7bzJR2eWebkH33plhetzCUlDRwCW+QTx3MKPSCMxqHL3h2t0fr0AVoN4
 MGSQXdx/R6S/A6ss6IqVM1uXNzCR6dEkNcPL9c0v2pcy7UzcGlzmKTbtx
 uf6T7/CI4QmaPunzFEfxP+wVIXYEQhHuA7SwtKQUnXW2dc7lN+leEgUxu
 IU/gt8zBjbBxY0YDyaKbb9eviFt64Ed/Y+7Qy5GexNygP9HuLRSy6Whit w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407698600"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407698600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="912222862"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="912222862"
Received: from lhuot-mobl.amr.corp.intel.com (HELO [10.252.59.167])
 ([10.252.59.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:20:36 -0800
Message-ID: <aab39c9b-1913-404c-b3bf-3916732990fb@linux.intel.com>
Date: Thu, 1 Feb 2024 20:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix loop in vm_bind_ioctl_ops_unwind
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20240201175532.2303168-1-matthew.brost@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240201175532.2303168-1-matthew.brost@intel.com>
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

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

On 2024-02-01 18:55, Matthew Brost wrote:
> The logic for the unwind loop is incorrect resulting in an infinite
> loop. Fix to unwind to go from the last operations list to he first.
> 
> Fixes: 617eebb9c480 ("drm/xe: Fix array of binds")
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_vm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2ab863fe7d0a..3b145a9c70d5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2657,7 +2657,7 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>   {
>   	int i;
>   
> -	for (i = num_ops_list - 1; i; ++i) {
> +	for (i = num_ops_list - 1; i >= 0; --i) {
>   		struct drm_gpuva_ops *__ops = ops[i];
>   		struct drm_gpuva_op *__op;
>   
