Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E869EC10F16
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 09:12:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3095A10ED72;
	Mon,  6 May 2024 09:12:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kDKClTQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A9110ED72
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 09:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714986747; x=1746522747;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/0NAM1MQTyhc+QWJp1/etjcL0+zZHf0Gzs7zpd/kEkw=;
 b=kDKClTQ/j5d3NzAN4FEAlPYXKN/LxfVXZTSLGRO4uad1eb6Vq85yZpRb
 AhqD9qadPOZ/MjFGmtODy23N1Kig0j42FD3YdWhg/+gxw0mZ8FBk5Bvbn
 WXWuxDl58vvw6NJq0gJU2qft6yURxDmdWbyrzqTWY1CBqEvR13VQoxa2x
 SQ7oyNXGH1g84uk/c6IKMn6Vf0kb+mzl0dnvX/uVnDUw5VExXKiByZG4A
 vShZarXxvn31u2mVA+0tDKAsm3UdyCnzYlO1i/CBy9a8Tat5LvonQ51Ue
 ReCQjtF1Iu57ydQ0OYVekBYz+NOVyolR48C78JLLb6pZakxIKzivDw3N0 w==;
X-CSE-ConnectionGUID: KSczjBwlQlCi6/pcAqyZTw==
X-CSE-MsgGUID: QIDXZ7t3TlC81CZpOGelQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="21278209"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="21278209"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:12:27 -0700
X-CSE-ConnectionGUID: xhZN7sA0RuC4LkdAVYD9NA==
X-CSE-MsgGUID: /hi5Ye47RlmUwaKoyg5l3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; d="scan'208";a="58987052"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.246.30.61])
 ([10.246.30.61])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 02:12:25 -0700
Message-ID: <97448dcd-c9fd-42ec-a5f5-348ff77c7ab7@intel.com>
Date: Mon, 6 May 2024 11:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] drm/xe/irq: move irq_uninstall over to devm
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240429121436.33013-9-matthew.auld@intel.com>
 <20240429121436.33013-14-matthew.auld@intel.com>
Content-Language: en-US
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240429121436.33013-14-matthew.auld@intel.com>
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

On 29.04.2024 14:14, Matthew Auld wrote:
> Makes sense to trigger this when the device is removed.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/xe/xe_irq.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 996806353171..8ee3c300c5e4 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -663,7 +663,7 @@ static irq_handler_t xe_irq_handler(struct xe_device *xe)
>   		return xelp_irq_handler;
>   }
>   
> -static void irq_uninstall(struct drm_device *drm, void *arg)
> +static void irq_uninstall(void *arg)
>   {
>   	struct xe_device *xe = arg;
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -723,7 +723,7 @@ int xe_irq_install(struct xe_device *xe)
>   
>   	xe_irq_postinstall(xe);
>   
> -	err = drmm_add_action_or_reset(&xe->drm, irq_uninstall, xe);
> +	err = devm_add_action_or_reset(xe->drm.dev, irq_uninstall, xe);
>   	if (err)
>   		goto free_irq_handler;
>   
> @@ -737,7 +737,7 @@ int xe_irq_install(struct xe_device *xe)
>   
>   void xe_irq_shutdown(struct xe_device *xe)
>   {
> -	irq_uninstall(&xe->drm, xe);
> +	irq_uninstall(xe);
>   }
>   
>   void xe_irq_suspend(struct xe_device *xe)

