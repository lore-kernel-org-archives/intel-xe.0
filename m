Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAF0C7EE22
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 12:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFC310E087;
	Tue,  9 May 2023 12:48:00 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9530810E087
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 12:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683636478; x=1715172478;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=QEIQpSmjK1UXi56N+a5Ob8St1y/pPO6v4J7owWeJ9/o=;
 b=OWIMOlPita/0515eEya/uPBEoinMj4swpQ/rOCpifMz3JlrMNKlI/9Al
 9vf99YgzaF4BoEHkKba6M2gd/HZwtO58nAAFRnkOiE/quM8QqXKdF25ri
 ZYNjEiLNX8MQLgI/J+VaDtsdlvwAgA90QH01IZSPfe9HdWlHyUwPOI27H
 VE++M/tvMeqzHy7gfjOLVo2hZ+c3jFWPWrQBxY0qwXziqjVGUs5zwKhRV
 jRK1kLTUe9Ke0tYrba5C6ACVJW0r8tn4OxHUkl2TO5yth5nMh4rRahghB
 gl9YU8TApn3nuB7aZh4hVEoCOjJaDHf7WvtoYd0uumG8UXJlJ0t1PvKso w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="330275129"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="330275129"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:47:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="945259250"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; d="scan'208";a="945259250"
Received: from jparkkin-mobl.ger.corp.intel.com (HELO [10.249.254.236])
 ([10.249.254.236])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2023 05:47:55 -0700
Message-ID: <ef984a4c-82a3-4e4d-f0ad-2d50558b3051@linux.intel.com>
Date: Tue, 9 May 2023 14:47:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20230502001727.3211096-1-matthew.brost@intel.com>
 <20230502001727.3211096-9-matthew.brost@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230502001727.3211096-9-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v2 08/31] drm/xe: VM LRU bulk move
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


On 5/2/23 02:17, Matthew Brost wrote:
> Use the TTM LRU bulk move for BOs tied to a VM. Update the bulk moves
> LRU position on every exec.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c       | 32 ++++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_bo.h       |  4 ++--
>   drivers/gpu/drm/xe/xe_dma_buf.c  |  2 +-
>   drivers/gpu/drm/xe/xe_exec.c     |  6 ++++++
>   drivers/gpu/drm/xe/xe_vm_types.h |  3 +++
>   5 files changed, 40 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 3ab404e33fae..da99ee53e7d7 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -985,6 +985,23 @@ static void xe_gem_object_free(struct drm_gem_object *obj)
>   	ttm_bo_put(container_of(obj, struct ttm_buffer_object, base));
>   }
>   
> +static void xe_gem_object_close(struct drm_gem_object *obj,
> +				struct drm_file *file_priv)
> +{
> +	struct xe_bo *bo = gem_to_xe_bo(obj);
> +
> +	if (bo->vm && !xe_vm_no_dma_fences(bo->vm)) {
Is there a reason we don't use bulk moves for LR vms? Admittedly bumping 
LRU doesn't make much sense when we support user-space command buffer 
chaining, but I think we should be doing it on exec at least, no?
> +		struct ww_acquire_ctx ww;
> +
> +		XE_BUG_ON(!xe_bo_is_user(bo));

Also why can't we use this for kernel objects as well? At some point we 
want to get to evictable page-table objects? Could we do this in the 
release_notify() callback to cover all potential bos?

/Thomas


