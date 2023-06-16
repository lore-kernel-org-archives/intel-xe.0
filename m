Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F02EB64D8
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jun 2023 20:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3CDC10E685;
	Fri, 16 Jun 2023 20:33:17 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3A910E685
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jun 2023 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686947596; x=1718483596;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ow3+GFe3vKOlhIiJUyDQi0Z32bA8vlMBKP4hLW3DNlU=;
 b=OTzqhfa0R3bHxs+GerQDgHakIIAYzQGM5nfRE41bghOYsb55cmJvUHTb
 8BxkGhQareCkZ/NWiCinUCucd1XtiuTFBXzkRS9xqWzUZOC0GT/DbV50i
 EyRtqmnGnGLaY0GxMSwkLMI3zzRiuDjeliJxNhy/T5QVbuRgpfima2kFW
 M5nRUvAoFvLw0ISoIYS2JMNL3T2VKNcUzRTtCVtm6YnsHUyQj8Z39mULJ
 +87avX/Xuszjua6fHci2RzG4llQ+N9CZSc2lQL91aDnaOov/yk5tbMl+Y
 nXB88F0ox2JeAMLCdai/5U0FDasCaTN/zwKXHI8umAQLzIdeV8znlptaV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="422960652"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="422960652"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 13:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="663314134"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="663314134"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 16 Jun 2023 13:33:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 16 Jun 2023 13:33:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 16 Jun 2023 13:33:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 16 Jun 2023 13:33:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRFNEKZLJtCEF/ChAx/2k5EdFeUR9iTzq4ixX83ik0n3kN25SDjONIToLm7u5hekX1e/qMZkKxOjKtVgc53wF2ZRpz4JtxqH+7uN5Kr7wK0rbJC898ANRpmmGCr07oJIj7nXRWuVU59IW4taOwxquJJFl1fhM70TiylAqNcm56pQShvzmzEwALWYlGUx7iRg01W7rIplqfX/7ChJ/zkr/kKQT5VZv8OJE5oi2p5G8qBnCYSI78l0dZhuofktDJGX5Da/f/eQUWujqK6quYWFThzkQhoYpV1Meyye8G/+hxGCrW7RVl7NBnVJ8cFTPafwC6bjag9UYptbCB4nLV81YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JMnbSRuyGAfPYmZt7Nfj8X3Kp5H1k46GULLEB9czSPA=;
 b=Hi+t9xcxWFuoADiz2DBeECmpeDIW45mdQ1ygJGIm7SH/Wbo/TUQMQHC4milVr0T2NMCMjVMnV79KgvpPsujOEp2kECjK5seylp9VJGgsrnBjhj7oXbSkXs+olrf09V9K35MLVt2c41WLWaTSLeVIfm2a4lh3zicgYSYYzgRiGdIJ10nCs6q/r7shg/bVVfDiX+7ItiHd8BsqE8raT5MUZyvFYBAovOC9ZEymcNIwoMbhhJtsugO4dNSfGcKg5fd15u3cF77BOAUVta/Jpel3h2pRBtcnEAFHxoV/2bAEXIF/fXsouzaxjW9vG87pZrmJDvNzNUgJiwBrlYDzlXe7yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Fri, 16 Jun
 2023 20:33:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%5]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 20:33:12 +0000
Date: Fri, 16 Jun 2023 20:32:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZIzG5elB1mlrltsy@DUT025-TGLU.fm.intel.com>
References: <20230616095504.17084-1-thomas.hellstrom@linux.intel.com>
 <20230616095504.17084-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616095504.17084-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR16CA0018.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 46055fa0-a1a3-48d5-ad68-08db6ea8e762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /wc2++hDV8x0jKCyS+pNrXX6BDk+D1+gSjwrlO9h8qxRZFUFWC2g6XHPGLl8fKRiAm9OiNnPj1Lb3boJuWqdW40v66zU6hFObEGKGjRh7Z/FJQwzzmX2NGwARZXvn6GSOL4bS6Lu1dJeCd4H+FR82V5VoSWNh4AeP+E+v++8Cq8r5/1D1v5mSm7wXLiqaGUmS/a773w3tfXxZpbweyfA414wgxgMybPAVUYNlYu/Z09eI2ngQXxv/llWH5aTWnYSzZjitwHfTkAfuAs5vt/NF44kOFULHj1gQQbaETFXIt7vOwsPLhgC7u4NRUm50iwQQwftIEBbSxMAL+ApdvCMlrmjHpOaUMWCXjKcdbVsZ0wQRLOhabwl1HvEBKLQqk49jZgJYkpkeNg+2+jwQolFiMxHv1aPsqgg/wBztXkagd6YKA8hgTkqFqNbdnvZSeRYHell/so7m4GijN5RMRouTwNaWfSHLbw/xT7sE0QokMpoAIBTE1I6Jtg69m9l9SRcrL1xWjiFW0ay5NBN4nNshAYEsT8yAds9XnG2N08Uhv7KWxSJNNLQXsNsqLeNplB4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(396003)(39860400002)(136003)(376002)(451199021)(86362001)(82960400001)(38100700002)(5660300002)(316002)(8936002)(44832011)(41300700001)(8676002)(66556008)(6916009)(4326008)(66946007)(83380400001)(66574015)(66476007)(186003)(6512007)(6506007)(478600001)(26005)(2906002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Rr7VH6fxFe9wHiXXQn+6CwPIJteSVK15Zz6SXJgCdgK4nL3Abo5naeZqQE?=
 =?iso-8859-1?Q?z6aJ/TgVXjOqpeTLgqCsV2jxX3LHH7wmARsZTH/CgPO589Jb6VIOTHo3mK?=
 =?iso-8859-1?Q?44+3gnb2TcB2UbTAgTR6wEcKx8Bv5Lo0AlS8cSAMmcE5p7pZ+YvBkZQaln?=
 =?iso-8859-1?Q?GPLtH4T1ImqEXhb0Jh9re0QVr1jufwNvwQmxQc1nLBM1/0ghKroylbxmjS?=
 =?iso-8859-1?Q?nUsIwBSxhzmv/qD3FYHM9vFUE6UhIs8lDc0GBNNbG2dRV4gkqtWrlRaxA5?=
 =?iso-8859-1?Q?0s6gtTqh3WT+TjdzibPn4sHRFDAJi66MDGO2pl4PF0lko5sKRnhmtZ9DqC?=
 =?iso-8859-1?Q?LlRnIpxapHBcUu9+12FXre1qTEKrmX2YUgr00Poqafhskg5os8c0Y+ZExy?=
 =?iso-8859-1?Q?3i/jUDaD1dOGrLRiTAX+6kRmeyAB7fuKYQRl0aqlxqv04Pl1uw6C1082KI?=
 =?iso-8859-1?Q?L4waF3a1NTPew/xrgySVsU2/EeMjN/opF5I2IkKcr2QTURwP0BPacY3joD?=
 =?iso-8859-1?Q?fBXJAE/BVHVv0FwKvGcAE3qyWV0oqsMYQ+PHdVLlW+rPQkxCDW0YJg8PEw?=
 =?iso-8859-1?Q?ALbSAqj7uHHjcFompuINH9y6WS+WpKUMLOS5IjLEjDNXVYEF7cWBHwX2TR?=
 =?iso-8859-1?Q?5UbOdmNHfoIp3bMqCwEtc0zmgCFYfgkkc+pi7owS/L4nJVNgNLK7sgXsMS?=
 =?iso-8859-1?Q?4qhLuo1JGjGY07+T2WwoWTfaMcs7lIzZpIEDbxSD7ZKAML+CBdcYN4PJx5?=
 =?iso-8859-1?Q?RI7+Vtst6MlvE+V8hT82h5dFflufRCDa/bliif882FPd+D1f2zJvYL0LRg?=
 =?iso-8859-1?Q?olGKRcgz9Y57ANWDJNrNzd34abKdvX/BUpPdpzN3gGE0Y5HadcFx8cYNV9?=
 =?iso-8859-1?Q?2GoyG5YXIteNbX10NSzs+oC/c7HqVVkrn8HKVfRYK/4FNpy3H0Kxk/gl8j?=
 =?iso-8859-1?Q?datOOtsMsBcdxJBGXlKUBt7qvn6zc/8dBgYb7jPwpdMkPB5FoytCZ8X3zf?=
 =?iso-8859-1?Q?vYhwyXr/u0VkBl2Rph5HljvvTHeTPU679WGfYa4aMIqUXyJrgHsXhEFOba?=
 =?iso-8859-1?Q?JLtVfo5oscO3UZLtjQECBpI8peHvhSlzMKohYgK+WsTBvMdmFJAUiCciBE?=
 =?iso-8859-1?Q?FNy+ixr08ZAPgnGyg53BeCayP9y/YorXI7fcKyHq1Cx4uDvmOJ8ZUfIK3L?=
 =?iso-8859-1?Q?hM5JHEUQNNqTgEbUxBHn1Fs8VN9TC8UuxShQJySKE6pQ6/U51dR4seYbVn?=
 =?iso-8859-1?Q?PlkYU5gmgufMG5IfWBiJ+XYUqAqdoVLkolJ9njp500Emr5JqWqvKnozHdE?=
 =?iso-8859-1?Q?Cix2WqDUDF7q7ZqlwGaNB7ZmvIb3j34fKleTproZtvqOKHNOmrWiE8x9bS?=
 =?iso-8859-1?Q?dMWz6jBSgiuln3/LDDZkPaeIUvE51Zf75TC2qONXlIqfadetKkqSj5FWKj?=
 =?iso-8859-1?Q?lJ3RlZjEklAvuVwPPyenhvBA4WVWGC7BemIIuAJn5osbiKxEVMO2hTKyfe?=
 =?iso-8859-1?Q?fC313JrOGfMQF74EgoiX+fnhjt3sp8/YBT0XJHZn6EzdJCjWtWtktkpBlO?=
 =?iso-8859-1?Q?a1NNwQV/R4m1AmyiSKYMLotOaBy+N27fh2nZKQjnb3rrCsA5qzn/peL3qi?=
 =?iso-8859-1?Q?IaEnPonVa2s43Nc3iYGcFP+r0W6rfmHxnSwDwFUUwtIwZbYohuqzyDkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46055fa0-a1a3-48d5-ad68-08db6ea8e762
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 20:33:12.0181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K3evZmsCSyPKzD5Z9YCRUDr3inFDy1lxOkbwIR/SciNtIEkoULhCCv8Qv8EWkCtZtWnE6WuuNA7QsxAVoGD5Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/6] drm/xe/bo: Avoid creating a system
 resource when allocating a fresh VRAM bo
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 16, 2023 at 11:55:01AM +0200, Thomas Hellström wrote:
> When creating a new bo, on the first move the bo->resource is typically
> NULL. Our move callback rejected that instructing TTM to create a system
> resource. In addition a struct ttm_tt with a page-vector was created,
> although not populated with pages. Similarly when the clearing of VRAM
> was complete, the system resource was put on a ghost object and freed
> using the TTM delayed destroy mechanism.
> 
> This is a lot of pointless work. So avoid creating the system resource and
> instead change the code to cope with a NULL bo->resource.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 40 +++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 43d81f37a855..94dd11066f51 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -479,7 +479,6 @@ static int xe_bo_trigger_rebind(struct xe_device *xe, struct xe_bo *bo,
>   * to unconditionally call unmap_attachment() when moving out to system.
>   */
>  static int xe_bo_move_dmabuf(struct ttm_buffer_object *ttm_bo,
> -			     struct ttm_resource *old_res,
>  			     struct ttm_resource *new_res)
>  {
>  	struct dma_buf_attachment *attach = ttm_bo->base.import_attach;
> @@ -564,6 +563,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>  	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>  	struct ttm_resource *old_mem = ttm_bo->resource;
> +	u32 old_mem_type = old_mem ? old_mem->mem_type : XE_PL_SYSTEM;
>  	struct ttm_tt *ttm = ttm_bo->ttm;
>  	struct xe_tile *tile = NULL;
>  	struct dma_fence *fence;
> @@ -572,35 +572,28 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	bool needs_clear;
>  	int ret = 0;
>  
> -	if (!old_mem) {
> -		if (new_mem->mem_type != TTM_PL_SYSTEM) {
> -			hop->mem_type = TTM_PL_SYSTEM;
> -			hop->flags = TTM_PL_FLAG_TEMPORARY;
> -			ret = -EMULTIHOP;
> -			goto out;
> -		}
> -
> +	if (!old_mem && ttm) {

Just making sure I understand this, this is memory without a source and
not allocating in VRAM (no clear required), right?

Assuming I'm correct or even if I'm not can add a comment explaining
this as it took be a while to understand this.

>  		ttm_bo_move_null(ttm_bo, new_mem);
> -		goto out;
> +		return 0;
>  	}
>  
>  	if (ttm_bo->type == ttm_bo_type_sg) {
>  		ret = xe_bo_move_notify(bo, ctx);
>  		if (!ret)
> -			ret = xe_bo_move_dmabuf(ttm_bo, old_mem, new_mem);
> +			ret = xe_bo_move_dmabuf(ttm_bo, new_mem);
>  		goto out;
>  	}
>  
>  	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>  			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>  
> -	move_lacks_source = !resource_is_vram(old_mem) && !tt_has_data;
> +	move_lacks_source = !mem_type_is_vram(old_mem_type) && !tt_has_data;
>  
>  	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>  		(!ttm && ttm_bo->type == ttm_bo_type_device);
>  
>  	if ((move_lacks_source && !needs_clear) ||
> -	    (old_mem->mem_type == XE_PL_SYSTEM &&
> +	    (old_mem_type == XE_PL_SYSTEM &&
>  	     new_mem->mem_type == XE_PL_TT)) {
>  		ttm_bo_move_null(ttm_bo, new_mem);
>  		goto out;
> @@ -612,7 +605,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			goto out;
>  	}
>  
> -	if (old_mem->mem_type == XE_PL_TT &&
> +	if (old_mem_type == XE_PL_TT &&
>  	    new_mem->mem_type == XE_PL_SYSTEM) {
>  		long timeout = dma_resv_wait_timeout(ttm_bo->base.resv,
>  						     DMA_RESV_USAGE_BOOKKEEP,
> @@ -627,8 +620,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	}
>  
>  	if (!move_lacks_source &&
> -	    ((old_mem->mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> -	     (resource_is_vram(old_mem) &&
> +	    ((old_mem_type == XE_PL_SYSTEM && resource_is_vram(new_mem)) ||
> +	     (mem_type_is_vram(old_mem_type) &&
>  	      new_mem->mem_type == XE_PL_SYSTEM))) {
>  		hop->fpfn = 0;
>  		hop->lpfn = 0;
> @@ -642,8 +635,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		tile = bo->tile;
>  	else if (resource_is_vram(new_mem))
>  		tile = mem_type_to_tile(xe, new_mem->mem_type);
> -	else if (resource_is_vram(old_mem))
> -		tile = mem_type_to_tile(xe, old_mem->mem_type);
> +	else if (mem_type_is_vram(old_mem_type))
> +		tile = mem_type_to_tile(xe, old_mem_type);
>  
>  	XE_BUG_ON(!tile);
>  	XE_BUG_ON(!tile->migrate);
> @@ -693,8 +686,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  			xe_device_mem_access_put(xe);
>  			goto out;
>  		}
> -		ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict, true,
> -						new_mem);
> +		if (!move_lacks_source) {
> +			ret = ttm_bo_move_accel_cleanup(ttm_bo, fence, evict,
> +							true, new_mem);
> +		} else {

So this is doing a clear here and old_mem could be NULL so
ttm_bo_move_accel_cleanup could blow up. In this case we just need to
install the fence from the clear and assign the new_mem, right?

Matt

> +			dma_resv_add_fence(ttm_bo->base.resv, fence,
> +					   DMA_RESV_USAGE_KERNEL);
> +			ttm_bo_move_null(ttm_bo, new_mem);
> +		}
> +
>  		dma_fence_put(fence);
>  	}
>  
> -- 
> 2.40.1
> 
