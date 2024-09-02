Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9D7CA0ED3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Sep 2024 15:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D4710E200;
	Mon,  2 Sep 2024 15:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QkgB3kGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4486910E331
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Sep 2024 15:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725289504; x=1756825504;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aM2M1skW5LhVYkR/tbIcHmk74Xz7+pSoqZ3GagdGiUY=;
 b=QkgB3kGhCwIBvJd/xexnoqyiehjZEBUWH0hG6InSG+kXW0lnJ85PVmmO
 JeWKfn5dw3oqROWJ2ngSlkKkQoBu3KGmrwNTljaS6ovnMu2IAWx8t6zex
 Zl6CchUUUpwfWY5LcXZn09mIvZxp3MpScHuoPRbE0rdO7xT4JPcor6+sO
 jHauSQ67UhEDL+BVSaKI7vaocM+07ExZkp2jBy0jes4oesXZkn9RoIS/Q
 cQjvf+K+U5Cjm0rMlHku6eedHp0BHzwh1vFlP8eckJVTcYPDxQ1nO1eeX
 iuHSooj+57AmjqiAifUKQyrgqXPhGZPVLOS/BmITk/cn4cZYdecGCpZKg A==;
X-CSE-ConnectionGUID: UIBDZuzSSQy4DcRqWTo+vw==
X-CSE-MsgGUID: 6ZD8r3VMQFSj8iDlMQlh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23740684"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23740684"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:05:03 -0700
X-CSE-ConnectionGUID: IjxuPAFOTmu93qd0mBvRbQ==
X-CSE-MsgGUID: AyBJyFc9QjCRjkrPhN1q5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69272422"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.130.175])
 ([10.245.130.175])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 08:05:01 -0700
Message-ID: <6c905752-e7ea-42ee-9a62-5bda06a38a32@linux.intel.com>
Date: Mon, 2 Sep 2024 17:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: fix missing 'xe_vm_put'
To: Dafna Hirschfeld <dhirschfeld@habana.ai>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com
References: <20240901044227.1177211-1-dhirschfeld@habana.ai>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240901044227.1177211-1-dhirschfeld@habana.ai>
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


On 9/1/2024 6:42 AM, Dafna Hirschfeld wrote:
> Fix memleak caused by missing xe_vm_put
>
> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>

Fixes: 852856e3b6f6 ("drm/xe: Use reserved copy engine for user binds on 
faulting devices")

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index fa4ed168b53b..df3ea337f55c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -252,8 +252,10 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>   							   gt->usm.reserved_bcs_instance,
>   							   false);
>   
> -		if (!hwe)
> +		if (!hwe) {
> +			xe_vm_put(migrate_vm);
>   			return ERR_PTR(-EINVAL);
> +		}
>   
>   		q = xe_exec_queue_create(xe, migrate_vm,
>   					 BIT(hwe->logical_instance), 1, hwe,
