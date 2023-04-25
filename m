Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DAB8C6FD18
	for <intel-xe@archiver.kernel.org>; Tue, 25 Apr 2023 09:13:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696A089701;
	Tue, 25 Apr 2023 09:13:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42810E6E3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Apr 2023 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682414037; x=1713950037;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZdSPtvH10piMArfV05dAYBAVW59uNvOlNYVA3gSZng8=;
 b=J3QwaRYzUVpjTqnjsa3ZnECdvja5FxerGCL9zp1lVxdgRUckpmzhpDN5
 8Pb1kg+xmQe7N6NIhJqaa2An6mlRvYTBa+464FXkggdSHB4w/5eLZCvF0
 QOgAPma1eRtnVLGYVddjSO+N7N7Poqd7hkBnMbpTI7/bUbarJO3FhHdhq
 2hl6sfFRyYbkkWZ0uUgD/90J+DF1oZmYaFG5Ac7GZhaB9Umf7Pocy5tlk
 GNWpwNJIRSz1OUJcV1q+m2asTi6GSklLNs/DxR7WSA/npy94yu+nNkIFL
 hRbBuFr60IxsBxB8OiiZCC34jCf8tDTL1LNpjXwX9UNlulZg4oXsQjAm7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="349498543"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="349498543"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:13:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="939693603"
X-IronPort-AV: E=Sophos;i="5.99,225,1677571200"; d="scan'208";a="939693603"
Received: from yuyingfa-mobl.ccr.corp.intel.com (HELO [10.249.254.18])
 ([10.249.254.18])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2023 02:13:55 -0700
Message-ID: <5abe59c9-41f8-a817-6700-ad626b5082a3@linux.intel.com>
Date: Tue, 25 Apr 2023 11:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
References: <20230425091026.3499175-1-francois.dugast@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230425091026.3499175-1-francois.dugast@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix build without CONFIG_PM_SLEEP
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


On 4/25/23 11:10, Francois Dugast wrote:
> Build without CONFIG_PM_SLEEP (such as for riscv) was failing due
> to unused xe_pci_runtime_* functions.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e512e8b69831..14be0259a222 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -710,7 +710,6 @@ static int xe_pci_resume(struct device *dev)
>   
>   	return 0;
>   }
> -#endif
>   
>   static int xe_pci_runtime_suspend(struct device *dev)
>   {
> @@ -768,6 +767,7 @@ static int xe_pci_runtime_idle(struct device *dev)
>   
>   	return 0;
>   }
> +#endif
>   
>   static const struct dev_pm_ops xe_pm_ops = {
>   	SET_SYSTEM_SLEEP_PM_OPS(xe_pci_suspend, xe_pci_resume)
