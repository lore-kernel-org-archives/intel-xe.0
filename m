Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6354C77B73
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 13:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1E810E1CF;
	Fri, 26 May 2023 13:03:08 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEE310E1CF
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 13:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685106185; x=1716642185;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/HhWbJ+v5c9pdmD7i/ce/4X8ZzWNPyVAxZFzmR2jSOM=;
 b=OH87omj7Aykg2z7FoiP0pLdhoKfi2gB+1Hre7fGtxfTInpvIgXQ3UIgm
 /126p3S7hppF4cOH/HwQAsYlphdN9o4GLPuqmtPNvemooaJlA6Wdq2v4p
 SAGWMQHR6Xhm4pJfBXkn4Zyf84GbpIDveaOtNWFcgGvrNzQPCdQsX3J0y
 gWpaFrJ9RNBWhnSqdzEL8e3PRA8sP15ebO81K3sm7Aq6RL0fwZM1+xMg0
 Ubdjaekuo0dN/ZcK8gsPL6QOCfH0CWiTh2g03vzzFMrIzgkc0gIS34VXB
 CdGmNwocO76UgTThaQTO300beSIQsxYho5eodfpnb+7mgw62dhXsGF4TU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="357448440"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="357448440"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 06:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="705204035"
X-IronPort-AV: E=Sophos;i="6.00,194,1681196400"; d="scan'208";a="705204035"
Received: from binis42x-mobl.gar.corp.intel.com (HELO [10.249.254.65])
 ([10.249.254.65])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 06:02:47 -0700
Message-ID: <0ff025da-9d8d-d7bb-80a1-f7623578e210@linux.intel.com>
Date: Fri, 26 May 2023 15:02:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230526121101.1619278-1-maarten.lankhorst@linux.intel.com>
 <20230526121101.1619278-3-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230526121101.1619278-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 2/5] drm/xe: Add debugfs files to evict
 everything.
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


On 5/26/23 14:10, Maarten Lankhorst wrote:
> Easy for testing, when you just want your BO evicted.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Do we have some documentation somewhere about what our debugfs entries 
are doing that needs updating?

Also can we evict stolen memory?

/Thomas

> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 7827a785b020..0a2f1becb5c6 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -94,6 +94,15 @@ static const struct file_operations forcewake_all_fops = {
>   	.release = forcewake_release,
>   };
>   
> +static int evict(void *data, u64 val)
> +{
> +	struct ttm_resource_manager *man = data;
> +
> +	return ttm_resource_manager_evict_all(man->bdev, man);
> +}
> +
> +DEFINE_DEBUGFS_ATTRIBUTE(evict_all_fops, NULL, evict, "%lld\n");
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -119,15 +128,21 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   			sprintf(name, "vram%d_mm", mem_type - XE_PL_VRAM0);
>   			ttm_resource_manager_create_debugfs(man, root, name);
> +
> +			sprintf(name, "vram%d_evict", mem_type - XE_PL_VRAM0);
> +			debugfs_create_file(name, 0644, root, man, &evict_all_fops);
>   		}
>   	}
>   
>   	man = ttm_manager_type(bdev, XE_PL_TT);
>   	ttm_resource_manager_create_debugfs(man, root, "gtt_mm");
> +	debugfs_create_file("gtt_evict", 0644, root, man, &evict_all_fops);
>   
>   	man = ttm_manager_type(bdev, XE_PL_STOLEN);
> -	if (man)
> +	if (man) {
>   		ttm_resource_manager_create_debugfs(man, root, "stolen_mm");
> +		debugfs_create_file("stolen_evict", 0644, root, man, &evict_all_fops);
> +	}
>   
>   	for_each_gt(gt, xe, id)
>   		xe_gt_debugfs_register(gt);
