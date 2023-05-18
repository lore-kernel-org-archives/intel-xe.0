Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6FBC77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 05:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E6510E4D7;
	Thu, 18 May 2023 05:33:26 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D64810E4D7
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 05:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684388004; x=1715924004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sCAu4VafHJ9BJrwiT812lkQ6ZREFtaBGR5653IXktuI=;
 b=JUXfWsr1MjSEjwchAb74tz2cA6MNCZtEZB7XzzcGwd1Ka0y/5nwfSZle
 12tA31efsKIn1hUv81Lxb9+DRDhh9mBDrwSl8eg6UfqnCpkL5qU/DlvR1
 VTXAJKTDpSLAuoC5sfcBgoDEhleSsQqV5MvsohOBVswNjU+bcdTELM9L0
 MC4TEuehtJ6rPKKzUNNXmLv4SJWNhoHJPxnA7e3x8OeaRlLSEFCleMrQW
 GpSxSFdWd9xHmeFEaQ0z2IcgrOFkQdjHG+7+g9eM2k5CqL7xQfg5E+LnS
 hSDABAla961virgkojEKCOiOA7DwDMdSQa2VWal7MmITDi5mSKAsgRpJi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="438312333"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="438312333"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 22:32:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="732731321"
X-IronPort-AV: E=Sophos;i="5.99,284,1677571200"; d="scan'208";a="732731321"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 17 May 2023 22:32:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 17 May 2023 22:32:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 17 May 2023 22:32:45 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 17 May 2023 22:32:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH7AG+5Wfn3/3CF+Qg8bXcBUoit12BGcasVy4cGexH7h4A1L2ED8/4S6irF00pCPs7aY2h5aBjJnYHreO6IJXFwTa86NYRTqDVVo+LhSRMSxxCOaqQd4uOLJgYd4hp/zjNMnexbfuhYYhzXN7V/2ySnAZ1cf+cAU7nEXjy2FX/1NGS5/x8CF78EjRan5/l27CxDN/sqnNPJXYkdIqef3OVftTOK8Uqi6tmSD+e1ch2k3rx9xIEZVXwdJqZUGZK32zt9XRq4R2qI6I8T5IO510UiYG4KE0VwgR0krLpP29LoYDo9gPZP7DQuKM/1d2jhgrzsHk4QxqZAWz3AftgRdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/DReo3LIOi2OFlxfCBPcDcnKGZlChc0tiKpz7SONcQ=;
 b=e6QpvhGi/WztuUKABLl6npPZCh1UwpUg5y9zzGe1SyePoZ/ATB5qytvqczVmaneow9tOVRmiWN8hcq8PG3lUgcNj9nSie+1lCi1mlk2u7iYDQb0ptnndwjb5jXtn+UHWlqjmPTRxeiN4Q3XrBXzhW4uZd4ZgS7O3mdNc3gjxlQYy/hXXhfDuxE56cgwnloEQxLXRN5JdLBsRJolKvZaMzc/yPXrFM3EJWoRAWwluO2+XRu1CNgwJV2FbpvtnGiHsKlRYUKQJj4zj8WGdzmnZ81ZZpNBMfNWGa5A3Hi5pgtmvFRj1CDFfa4dmbWUPuT4+MlNNXZ9NEsf1Gx8aTL/TDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 05:32:44 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6411.017; Thu, 18 May 2023
 05:32:43 +0000
Date: Wed, 17 May 2023 22:32:34 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
 <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW6PR11MB8389:EE_
X-MS-Office365-Filtering-Correlation-Id: 715d1f1e-84c0-4101-9391-08db57614d73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z2b1FyZ/rbdpp8Q8IxC9GpCi+3PoVrHnGkmageWRWYutDB43kb1IxgAYhaMF2op1mgcNdWq/dK3pLwqSPPAXvpLOd+Vuq/Q7RBzpR1vQVZe6ZNNlLBL6ONpAozc5rrUCZWmBK8MNP8JmSbYuPXS1GNR+lx+QR1E1Yhckd+QqIvu3v1HYz7qpbLxsg1CnFo1Fd3b7YYdJzGxt8ypFHcyr0Nj+KmyvcXeRSRCyAvYPzxn1lG5yxMeNRaIwzj6OYDbAvgFRtGuI3C4mSFmqXECXZaaLmN/Z4crqmyQctPEhE8gI7icPudp6kE8mOVvUt82F1FOTRfmfwGWFFSxx39N9qBZZesCqPn9t9pcDTaEDNHTRW1kAw3yFHPohPf5NbXyILJ7qm0eJVO4Vv2VEotxrAH+aJzOjpe0OQpOagxnaNvPGDKi43P77e4osbreFR87z6nWxuFhSeezkzXsIIZXiz3kM4jLRcIvE2w4HIWciJtZgkr1P/3/ez1Yt2xq8wh7t+g3sngUVjvNVbM0z67yUeUtGApx7o/hOqB5kYF2IaB9+zAYXhqg5VV5sW4z6LkyX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(478600001)(4326008)(316002)(44832011)(2906002)(8936002)(6916009)(41300700001)(66476007)(66556008)(66946007)(8676002)(5660300002)(6666004)(6486002)(9686003)(6512007)(6506007)(26005)(186003)(33716001)(82960400001)(66574015)(83380400001)(86362001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?wn66eOWWjRSP8QbohTTMmPe3XMmRPZx8x1xRQjPZlx7jUrdrf24bgOzFNI?=
 =?iso-8859-1?Q?rUN7mw5Iwn7HpUcQqf23sAqSSZr2+fS64j+TSze9JCjlktF8u10jEVd/gM?=
 =?iso-8859-1?Q?Y5EpbJBMbgzx/fvaPvbqdPwFlWH+X+zucdU9FSrqj0F0YMoiuOYMwTLf3S?=
 =?iso-8859-1?Q?VwN/8mqPGSNovw2NUd+5HHAMGc5TJWO7mMQjT/K2WDBU/av9J5ghCfqEOX?=
 =?iso-8859-1?Q?7z3GFGstC1k1Nzuh/FY+8s3NSrU1RUMI7rN/ZKztiGqXCc5Xv7uX0Y9seI?=
 =?iso-8859-1?Q?NUQQyp5EzZjmn+88xy3YVYWYAbUDUwL4QKV8fr0llXMt1fralB91X249u6?=
 =?iso-8859-1?Q?eCN72+PnlfMkG4DfOidlyxBT1RKhnQnhz5A6KPcJhaQ5mObMPKfhNiHbHU?=
 =?iso-8859-1?Q?cYwfBidzDCj8UygiHqDitgXSGgEPQSHVX04IByPqCnHk7czeUqx+qc1bIh?=
 =?iso-8859-1?Q?WSwHF2N1CMOclcV8lyJtPCaRcAt023lBYamiUbcCRiNpSRmRKQLmKtbRvf?=
 =?iso-8859-1?Q?fCCgq3Em7kO/zlPzdeL3LbhEElZ7q0oLlfP/8Rez4nHIwyHqFCXRFNezb+?=
 =?iso-8859-1?Q?YSCIVYTywiYo5d37QQnnq49eTgBNO//FUuvPUS1sOm6cnwT65QfvRyLbmP?=
 =?iso-8859-1?Q?aIV5W602ddGe+PSXKwYfokVrKZ1fozk7YDIxjrSAMjCvTPxMBSfHSvlg7V?=
 =?iso-8859-1?Q?lot9pJuLMbnDipd1E3GWbiW22narlvD7L07vcFRb8TvruLa1tO/O/tTGeu?=
 =?iso-8859-1?Q?S9nDEVJiuJZzTgZ78wLG9lZJ5MdBPZhFHDu2GE/3W5ovJXvYFn8waLiUUc?=
 =?iso-8859-1?Q?uf07dhO3X6oyBzH0mmADw61lmATyegGHtCrHIgnRwSKXLwTRfKzj6zkZO1?=
 =?iso-8859-1?Q?ZjnAAbGiBp8INV4Qw7po2MJ2qYD+NGifJUJB0EaVw8RC4DtOPrEjHEzKrL?=
 =?iso-8859-1?Q?5JzqBel8uNOkfK0AiDsmMGDgK/1AbjvIGsStZ/NmZis1TzuOZInphhfoX2?=
 =?iso-8859-1?Q?16PI2aat28H0yebuyRSehx10OTLWQ2eQieG/xrczhmsAy6PyakuWncGn3U?=
 =?iso-8859-1?Q?vuWERg82cwofS+wd7d5M6oQUYBPrSh8FD5tTO3QqE2AEokP8fDxFaS4noA?=
 =?iso-8859-1?Q?B9U0QA+ibb/iCKsdw5QG2N4nZJ/kl4y1I/QCURS9vwzs5Ig93FAkQuVZsS?=
 =?iso-8859-1?Q?aF2sp1kgJ+yAXsTdoFVQdYc3xBU9OAnjp0yQbj9z73CAMUv/W8CHR7F5fW?=
 =?iso-8859-1?Q?hK/1SRE9ZP5GSC7mRVmjuzlueT0TanpzOl9piN3yTEU64zog6l67uoxceX?=
 =?iso-8859-1?Q?lNhlgVcRZ/IG5RzWYpcBTc021AOQiRuWDI9nQXfQhZguy4x7Se8SIqEU85?=
 =?iso-8859-1?Q?yRoSTaGybhy9MEEX5fEg1Tm25slWeRru4oMrQbkPHHmmN62L+0FxOu30I5?=
 =?iso-8859-1?Q?rnm1m3dQz4GNpk1e3dLU+YEft513fguxt8cUf1eD1QFGGDLQt4PZ/tZP3h?=
 =?iso-8859-1?Q?62v8YoTmX+8BAoHCw63sgO6A61TmhxBx9gwF5YJ53c+0a9wZR9fEpRHMTI?=
 =?iso-8859-1?Q?d7IEyelhH6LrxMQ7JuEE8Q1kKsLck+57Wcl7+tij/lLT2ZvA23xsdvEjEM?=
 =?iso-8859-1?Q?kc0taMNiJkiuoy4MsnNYgQVJwGgqdqGvtslRpGeztyC5+m2GpjC6EvULOV?=
 =?iso-8859-1?Q?NI+K/VqlvBbE0lQBNLc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 715d1f1e-84c0-4101-9391-08db57614d73
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:32:42.9028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qQA1oP8BeOZY1VcupAopMqQ7mS6c2e90fpVIY23df23ltC8uGZva/TmzmkfT8TVclh82Zey6E9Gwt8tZHCu0fYHhtKuCwg3arbbO3qo4jbA8JD9H/ZR3DjlpgWyUYPY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
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
Cc: thomas.hellstrom@intel.com, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 08:01:08AM +0200, Thomas Hellström wrote:
>Hi, Niranjana
>
>On 5/16/23 20:44, Niranjana Vishwanathapura wrote:
>>Specify maximum segment size for sg elements by using
>>sg_alloc_table_from_pages_segment() to allocate sg_table.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
>>  drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
>>  3 files changed, 31 insertions(+), 6 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>index c82e995df779..21c5aca424dd 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.c
>>+++ b/drivers/gpu/drm/xe/xe_bo.c
>>@@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>>  	if (xe_tt->sg)
>>  		return 0;
>>-	ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages, num_pages,
>>-					0, (u64)num_pages << PAGE_SHIFT,
>>-					GFP_KERNEL);
>>+	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
>>+						num_pages, 0,
>>+						(u64)num_pages << PAGE_SHIFT,
>>+						xe_sg_segment_size(xe_tt->dev),
>>+						GFP_KERNEL);
>>  	if (ret)
>>  		return ret;
>>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>>index 7e111332c35a..a1c51cc0ac3c 100644
>>--- a/drivers/gpu/drm/xe/xe_bo.h
>>+++ b/drivers/gpu/drm/xe/xe_bo.h
>>@@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head *deferred);
>>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>>+/*
>>+ * xe_sg_segment_size() - Provides upper limit for sg segment size.
>>+ * @dev: device pointer
>>+ *
>>+ * Returns the maximum segment size for the 'struct scatterlist'
>>+ * elements.
>>+ */
>>+static inline unsigned int xe_sg_segment_size(struct device *dev)
>>+{
>>+	size_t max = min_t(size_t, UINT_MAX, dma_max_mapping_size(dev));
>>+
>>+	/*
>>+	 * The iommu_dma_map_sg() function ensures iova allocation doesn't
>>+	 * cross dma segment boundary. It does so by padding some sg elements.
>>+	 * This can cause overflow, ending up with sg->length being set to 0.
>>+	 * Avoid this by ensuring maximum segment size is half of 'max'
>>+	 * rounded down to PAGE_SIZE.
>>+	 */
>
>Is this a bug in the IOMMU code? In any case, shouldn't the fix on our 
>side be using
>
>dma_set_seg_boundary() and
>dma_set_max_seg_size()
>
>to set reasonable values that avoid that problem?
>

Thanks Thomas.
Hmm...I am not fully familiar with the iommu code here, but letting
sg->length overflow may be an oversight?

Looks like dma_set_max_seg_size() doesn't enforce upper limit to
sg segment size while sg_table is created. We need to use
sg_alloc_table_from_pages_segment() to specify that. It seems
dma_set_max_seg_size() is used to specify the maximum segment size
the created sg_table has while doing the dma mapping. The iommu code
doesn't even complain when it runs into an sg element with size more
that the one set through dma_set_max_seg_size() during mapping.
So, driver must ensure that. I think we would still need this patch
and update it to call dma_set_max_seg_size() also.

Yah, looks like we can call dma_set_seg_boundary() to set a very
large segment boundary say (0xffffffffffff) such that the maximum
sized BO fits into it (ie., we never run into any BO crossing the
segment boundary). But I am not sure if that is the right approach.
I am not seeing many drivers calling dma_set_seg_boundary() (pci
probe sets it to default 0xffffffff). Our GPU may not enforce any
dma segment boundary, but not sure somewhere else there is one.

Any thoughts on which approach we should follow?

Niranjana

>/Thomas
>
>>+	return round_down(max / 2, PAGE_SIZE);
>>+}
>>+
>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>  /**
>>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
>>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>index 2aa5bf9cfee1..5c2fdfc0e836 100644
>>--- a/drivers/gpu/drm/xe/xe_vm.c
>>+++ b/drivers/gpu/drm/xe/xe_vm.c
>>@@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>  	if (ret)
>>  		goto out;
>>-	ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
>>-					0, (u64)pinned << PAGE_SHIFT,
>>-					GFP_KERNEL);
>>+	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt, pages,
>>+						pinned, 0,
>>+						(u64)pinned << PAGE_SHIFT,
>>+						xe_sg_segment_size(xe->drm.dev),
>>+						GFP_KERNEL);
>>  	if (ret) {
>>  		vma->userptr.sg = NULL;
>>  		goto out;
