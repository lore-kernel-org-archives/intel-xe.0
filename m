Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D3BC5475B
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F28210FA6F;
	Thu, 14 Mar 2024 10:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxs5h0e8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455DF10FA50
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710413747; x=1741949747;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Tx/zqgWApRoe9anGanYWOYyAAck+008HCR5kFZY1ozA=;
 b=cxs5h0e88giqDblwFMQ4oPAu9omNWapBYnlmTDZV9xP7VudeBxZztit+
 Cjk/O+Q6BueUHrhoG2beYmgO9MJudU1WLHfIcilT7QQK0vB06QDAUwo59
 6akEedp7lNDfzppdgB77BKW4XhjfrCNY9Cqx677n71gJM3CTbxjZAte1m
 iI6n/CRs8vqwuTTQWz3ttb9WH9DaMVkqzcVGHzOXV+Rc5zbuiY3jJWpN7
 LNWc/OOj4HpBJa1eerRs5O/FgqqOnvPf1pwHcp9/5kVGem9Y/+xRz9mv5
 uMJdgbC+fgNRxYVlLTBYdqi1mZNQlYIhe2PYOGYk9qy3AWs+wOuJYt3ss Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30663473"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30663473"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16904782"
Received: from unknown (HELO [10.245.244.240]) ([10.245.244.240])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:55:44 -0700
Message-ID: <41ec2264-95e0-4832-963a-2d47f0b3669a@intel.com>
Date: Thu, 14 Mar 2024 10:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Fix out-of-bounds warning in
 vm_bind_ioctl_check_args
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240314095442.32153-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240314095442.32153-1-nirmoy.das@intel.com>
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
> Modify how bind_ops is assigned and used within the for loop to
> accommodate both array and single bind scenarios which should prevent
> out-of-bounds access warning from static code analysis tool.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

As discussed offline, current thinking is to just ignore this one. Looks 
like false positive. Also we still end up doing &(*bind_ops)[i] so 
probably it still complains.

> ---
>   drivers/gpu/drm/xe/xe_vm.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cbb9b8935c90..0b742d8d82a5 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2839,15 +2839,16 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   	}
>   
>   	for (i = 0; i < args->num_binds; ++i) {
> -		u64 range = (*bind_ops)[i].range;
> -		u64 addr = (*bind_ops)[i].addr;
> -		u32 op = (*bind_ops)[i].op;
> -		u32 flags = (*bind_ops)[i].flags;
> -		u32 obj = (*bind_ops)[i].obj;
> -		u64 obj_offset = (*bind_ops)[i].obj_offset;
> -		u32 prefetch_region = (*bind_ops)[i].prefetch_mem_region_instance;
> +		struct drm_xe_vm_bind_op *cur_ops = &(*bind_ops)[i];
> +		u64 range = cur_ops->range;
> +		u64 addr = cur_ops->addr;
> +		u32 op = cur_ops->op;
> +		u32 flags = cur_ops->flags;
> +		u32 obj = cur_ops->obj;
> +		u64 obj_offset = cur_ops->obj_offset;
> +		u32 prefetch_region = cur_ops->prefetch_mem_region_instance;
>   		bool is_null = flags & DRM_XE_VM_BIND_FLAG_NULL;
> -		u16 pat_index = (*bind_ops)[i].pat_index;
> +		u16 pat_index = cur_ops->pat_index;
>   		u16 coh_mode;
>   
>   		if (XE_IOCTL_DBG(xe, pat_index >= xe->pat.n_entries)) {
> @@ -2856,7 +2857,7 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>   		}
>   
>   		pat_index = array_index_nospec(pat_index, xe->pat.n_entries);
> -		(*bind_ops)[i].pat_index = pat_index;
> +		cur_ops->pat_index = pat_index;
>   		coh_mode = xe_pat_index_get_coh_mode(xe, pat_index);
>   		if (XE_IOCTL_DBG(xe, !coh_mode)) { /* hw reserved */
>   			err = -EINVAL;
