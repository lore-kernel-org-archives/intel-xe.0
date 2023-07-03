Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7B0C30654
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jul 2023 19:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2961E10E22F;
	Mon,  3 Jul 2023 19:25:18 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF03A10E22F
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jul 2023 19:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688412315; x=1719948315;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KkQUaHqsLrmSbW2sR17FzcuvvfwfxQ4zw5zA7YZyypw=;
 b=gX+clQcQhzlX2NMK7QSO022CD1tIUaBWr5355DzaBkB5vSc/m0ahI6yF
 vYNERXeSB2mB0RWZnKnCnxp7Bshg1xMuswnro91d9zidBVy65+uzJc0dn
 OJMGQKx4+DVRmq4Nk4mO0W6eHG9/fmBLyDsCcRIQxkhrvztne5nHijt31
 kybOsKhIiNOaPyBptD1C5VNGzsHl+T6E4j0zbxGM0VcE8BViWjahBR49q
 r+x967X+tHAiXLBS7cddx0GO/O3OxRTeFKyUomv8Mr0vV0euyW79SO4/u
 QltiaquVBGLtfW5YsQQCUEm/A7vkn1x4h0ZkH0KNagqRtJ8ORN98uFr3Z A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362992782"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="362992782"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 12:25:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="695901692"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="695901692"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.251.218.33])
 ([10.251.218.33])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 12:25:12 -0700
Message-ID: <5b8cb119-d8a8-0b25-3b73-a174b1118d71@linux.intel.com>
Date: Mon, 3 Jul 2023 21:25:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, intel-xe@lists.freedesktop.org
References: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230703091933.3832500-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: make kobject type struct as
 constant
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


On 7/3/2023 11:19 AM, Tejas Upadhyay wrote:
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
>
> Take advantage of this to constify the structure definition to prevent
> modification at runtime.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_sysfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index 13570987a756..2c47059bef42 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -17,7 +17,7 @@ static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>   	kfree(kobj);
>   }
>   
> -static struct kobj_type xe_gt_sysfs_kobj_type = {
> +static const struct kobj_type xe_gt_sysfs_kobj_type = {
>   	.release = xe_gt_sysfs_kobj_release,
>   	.sysfs_ops = &kobj_sysfs_ops,
>   };
