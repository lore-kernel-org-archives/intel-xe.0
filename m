Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5B5D6552C
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 10:27:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EB710EC31;
	Wed, 17 Dec 2025 10:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UP0etcPp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E19A10EC31
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 10:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765967229; x=1797503229;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/EPbSpFPEdQDl5bOl/KUWQiGDq25wiciZOJ7ePom2Ho=;
 b=UP0etcPp+E9qnHVxJE9j8vJVclnz6OV0px5OOheNjPiGtFOr2MyzjuCx
 EZyLYd9FHZjfAa3bHMiMI4/UzcbaPsEiEGd5x9fdniIxHPgZ+rD1Yaztm
 WMbE0pNoKZkZPZePLss3eCe5TW11+A6r49/yJclh5YLPxZzBBNbwSahNA
 Bo4KvmT/+14ADv5MipAwpLvJa4+JKb4ZlDACXq16hQtVu+azG9z5Z5ew6
 4eMd6eh0mZ4n10Eq85Lb5emT9XWLbR++pb5dvdj1weapYAhKQTEZfoTj9
 IjAlW27+MXHgVMvzorO6PhQb369e46AociNnUg40zyvSl0MvTVee8/xhe A==;
X-CSE-ConnectionGUID: Zn8KrcKYSYyVrRyme0wLtw==
X-CSE-MsgGUID: 2Z9Zv9obS9S8I/Sm0C2etw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71760290"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71760290"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:27:09 -0800
X-CSE-ConnectionGUID: 4dpPJKVBSACn17GVCXwEHA==
X-CSE-MsgGUID: AdLMtJnMRT+FsdPjmZ2+4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198155828"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO [10.245.245.182])
 ([10.245.245.182])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 02:27:08 -0800
Message-ID: <773d97c4-defc-422c-a3a9-c7769f367493@intel.com>
Date: Wed, 17 Dec 2025 10:27:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix NULL pointer dereference in xe_exec_ioctl
To: =?UTF-8?Q?Tapani_P=C3=A4lli?= <tapani.palli@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20251217061728.35768-1-tapani.palli@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251217061728.35768-1-tapani.palli@intel.com>
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

On 17/12/2025 06:17, Tapani Pälli wrote:
> Helper function xe_sync_needs_wait expects sync->fence when accessing
> flags, patch makes sure we call only when sync->fence exists.
> 
> Fixes NULL pointer dereference seen with Vulkan workloads:
> 
> [  118.410401] RIP: 0010:xe_sync_needs_wait+0x27/0x50 [xe]
> 
> Fixes: 4ac9048d0501 ("drm/xe: Wait on in-syncs when swicthing to dma-fence mode")
> Signed-off-by: Tapani Pälli <tapani.palli@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 730a5c9c2637..ea368f02cb9f 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -184,7 +184,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		if (xe_sync_is_ufence(&syncs[num_syncs]))
>   			num_ufence++;
>   
> -		if (!num_in_sync && xe_sync_needs_wait(&syncs[num_syncs]))
> +		if (!num_in_sync && syncs[num_syncs].fence &&
> +		    xe_sync_needs_wait(&syncs[num_syncs]))

In xe_sync_entry_parse() it looks like it will always populate the fence 
for the !signal case, otherwise throwing an error if that is not 
possible. And xe_sync_needs_wait() will only touch the fence if it's the 
signal case? So it seems like this should not be possible?

>   			num_in_sync++;
>   	}
>   

