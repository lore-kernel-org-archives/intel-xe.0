Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742C3C77B7C
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD3810E53B;
	Wed, 24 May 2023 17:16:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BEA10E53B
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684948609; x=1716484609;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fgrseOL90RtJIc4YPYIVR6K7hp777KgjrJsy7ZEoSq0=;
 b=ZjZT0O4kanrOBJf+8/vSdj7Utw6PlnpXFtcAIBEnrXOAwgyNveNdVYrw
 +bBVQ6cY4u5QaC0k41hPXIFMbFD5uYI14lPZhqGzIFq3nKAirUCJlu0in
 uPPI7iBRYdY8kBb/rB3gKGJk21ZpNMLP8wL5bZIr5zgUgbPFgRoGN3qt/
 jxb0zY8Xawh50l1gQWtezKwV07oQ93TYKi5ZMOfbBo0jZ5WoGIKUotGCV
 Gr+/VCZaXva7jplRc/ixgsmQVm5VdtNRcZVQ5WhSu+1THZ0trcsQ5oJ8t
 TTM37VTlHRme2PQLeIoXl7/BUsLAC+F30P5ml86Qs5RWTSmlRS53dRywg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="352480295"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="352480295"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:16:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="794287412"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="794287412"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 24 May 2023 10:16:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 10:16:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 10:16:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 10:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHJksH0yrZ3RxkS4jJbEAGKbANQus/jN+AytkmIydJBegl1dnRXwh3Cza8cstnfN46gi5jj2O1NlKtP4DrFOvd3pHeo26gd2E1VNigZNQa0SquMJBPcerY40No+lQ5oXi6jSwYrqSIb0Zppo2NVmEWS+Qla1InOMNVWyQdFEhi2pQBAIHtfxeysyMwKqm4K4BDTCEz1ovAEFe8ahtEO+hnKETHM5exkgYU5wE4Y9TLK9OU3ORyu3GWZGFep7sGUnTu1nNbGE5k0ezpXsyBZeV4Gt3NT0vNhM4xoGcpQ6AAp93Lv0lCZoz1OnkBwXto0oQdlKRPeKHqjJvMv1c50QNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MpYbv8lVuROu/xSSvgEaW0lgmmpUk4pZXraB1dW2GuI=;
 b=W66r4LKn68NabCdcYE9Gba7XON+KkJlsY2CEurUeRwHRk0w9HBNFC2pY4b+4YJu8gVq1CLQ0sCQHQdY242ohhHxOAuU8K3ovX4lS0xlzEGuNfVHm2WB3HQj8n/RkgBDI33KUm8IIwdFkmufdhSmIqEoNb8RbV9M2AHRhbwtSR765UgXTWJQijgVRVFbZF0eEOnxofZFVC/e2/QRHadkfK/1S8wpwRFUxEOh+JHLyLT2wmzzjp8oUXUoskRvBa1Z3d0Wt4qFHInu7Gr52B2QersSeVjSn2Q/Z617pkErFh808z4eMYriw7bqM7fu4xnJyposbLaHn2yVPVENqbMSqXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 17:16:40 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:16:40 +0000
Date: Wed, 24 May 2023 10:16:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
Message-ID: <ZG5GblTlw6haMIdj@nvishwa1-DESK>
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
 <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
 <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
 <CY8PR11MB6940B04E9E0799F7A9C35083C3409@CY8PR11MB6940.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY8PR11MB6940B04E9E0799F7A9C35083C3409@CY8PR11MB6940.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|DS0PR11MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: 414ad5cd-74fb-43e2-73bd-08db5c7aa36f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Iv1ovG/1e23o5x4eAZElmcJHj/sScaCIqm1rcjp7TtUtr4XRTKV9xY+O2qRebWlIA5LKYaHO1mpVTWLeZE20KEg9FhomE3hDjHt2ibJFdurnz/D/9nFHQyMOOzzO4K2U6fv4E/oHFPAQt+8YPKykq9OefQ231LEsv+G39347eQJagFvDExveIcNMnIQMrUS/5LcYQKjnEnn04nT0bWMZouEcexepibBTT0IWoA6cFuAFGZYkx0bNhK4WqmuWf3V0LOgRvB9AAeREk1qPcvAv3Qlz7chO8+Nd8c1/J8QOKuk338EO9KPepQYhfQeAkCei74GTqXlONz5kHghePUiUklZaP2KXXTtCSRTOsxiOEHD7L/oBzPiaE+iDEhq8gG6pMYmjjj10wse2n9Xz2pbl8I7DIMREHd5LjDx3W01NRb7FM0JF7s/j4Ge16Xow7rd6pwCcNX7etCrj5Dnf8/OMSqrWx6RTBaiYu0LzUqnBqMC3r4W+0TNTh+WvGAJ5QY7s6OIPYG+zH1C2KIi/gwChm8kAo0F8BpmuE3O918mRGIc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(2906002)(54906003)(66574015)(5660300002)(8676002)(44832011)(6862004)(8936002)(6666004)(41300700001)(4326008)(66556008)(66476007)(66946007)(316002)(6636002)(478600001)(6486002)(6512007)(9686003)(53546011)(33716001)(26005)(6506007)(86362001)(38100700002)(186003)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jmdaZE/isrKoBTajYLdp3T6PR72vKXU7B+m1MDV/kcUenYaDiTdqxk2inI?=
 =?iso-8859-1?Q?lZkgz+781v6aVII1NUqJAX6of51u0oF+dx8DRAVm0sibojZtM/fdReT3fV?=
 =?iso-8859-1?Q?l8PxkyT5a6yw8a6bWi0H8UvMUAz4B0lRxMCgw0gtqx5WploCpeaU3ZKTbx?=
 =?iso-8859-1?Q?MowDIlxEDZDMYTP1sEJYM7kEtRRsQIj24SvOo0wNtNUH0qyWMO+44tSJKw?=
 =?iso-8859-1?Q?vAChUtPJIgja12MlxBPcvx/cJFleLjbjxGeo9b4QWgSGXndBQZI8haSd9O?=
 =?iso-8859-1?Q?AzRmeiCMj8e3SIBAE0F3/sxtxA29ew/OMa218PviWR9rO6mS74SZUHy/yq?=
 =?iso-8859-1?Q?k+jQaWDGTadHzTIs/w6ENMxKa1rZKy+NcGDG15ZKBy6EevoPt6U43sC1Xa?=
 =?iso-8859-1?Q?pi4EUSRV6SLHb6D+E5nIKduPxUHUE8W6+xHUrPsib2PG3r2e/6oUDf1G8k?=
 =?iso-8859-1?Q?XpfoOr/uh5IsyQun+oR5Au+Ot0VlynMDHySX+tObiNDAaNW+eYAg5vNi4F?=
 =?iso-8859-1?Q?8syFl1i5Vtm2mzvJ5KEANylXocUp9uaoSeWf9BAtrJ7QtU5s9IuTKhgq3e?=
 =?iso-8859-1?Q?iEf1VBmVYT9wZ+gcOZPzAG5h/RiTjAGvuwEJ3TEYnxP95eQQ3SY1J5VGep?=
 =?iso-8859-1?Q?IKItN03TMT7o0wWQgoSIvQDg9mB7rLWkJfCaYo3O0yCbFJJyszReK39O2d?=
 =?iso-8859-1?Q?r0MUo7olQsOlJZXz62n5c9TdltVZFglFr0Pbf/1mcMYzoWDiOAPZ1/ZoVA?=
 =?iso-8859-1?Q?okhQh9+CrhTFKxnT2u1to00GahyfduAlsNvl5bznVOB26j6EQGWgoXnJ2j?=
 =?iso-8859-1?Q?+QcyuqjpS3Daovq2iBFiskIqGshVnFLMUoKcJmcvO4oWlVu8/Wa7Oe+nVU?=
 =?iso-8859-1?Q?5DVsnuiclazZVmXZh1OLFT1JNU4PSuPSh9BZUDkJCoH3RlyTOrr2hZlJST?=
 =?iso-8859-1?Q?yEyPO1iDPZK94Llg2e3axPwJQ7UTFmaPbv53e8if8jge05m7GqqamzcYNM?=
 =?iso-8859-1?Q?8kPpuafhF8m0+n9SsvCMFM9TmKu5OOOlK1OLBwxH5dGsU7Y2RHsaoi32WH?=
 =?iso-8859-1?Q?fWxUpKctp8xECY1QjXTgSqRzF0f1tM6+KINOTg1SUwfMzMyYtmJF9ceFd7?=
 =?iso-8859-1?Q?9yulpyurRMMF3tceHXaqCg1nusaEfod1rFvUcrAu0e+Abc3SS2XVzBrxYv?=
 =?iso-8859-1?Q?+agydFQx3R5cWdWU6smUfOHJm/RfTLkC+ck+Rj6qllT/WWVTPVg8RmxhSX?=
 =?iso-8859-1?Q?XnzCHIkygxBZB3+CrbyMyzv0CZiHWgZYLN1KTU6K9BJEXvGgAcNwbmaJ0x?=
 =?iso-8859-1?Q?du3TIM8xfGSod3LWdzu3AD4oNh0YKRcx2gXD4oqGGrUKpX3yLmnaEvea5y?=
 =?iso-8859-1?Q?g0aSIaT7yFM5L8jlrspeP60AYqhY76X/bzN/IPVPqGSW73DatPNq40JlBf?=
 =?iso-8859-1?Q?4wWAs5RSSr3CFQi3x7y+mL/gvCzKNLsl5BiZYFeZ2zDXrDHFbTMpFmzBKJ?=
 =?iso-8859-1?Q?Xj7VYmZTKLnYa1ep5EbuoWnH11qMMUY9ms3Dfq34+dYcoIGFFNIIT1fI/X?=
 =?iso-8859-1?Q?2bObT5Ohe3Hdw/m1/2jvFmxQiSEoGe9eJ+28dxgQxNxiNlZjgoQ5w4hM6k?=
 =?iso-8859-1?Q?rvYoxTWF/oNoQLzg7F3lOFpFkoELIOPYQcIqPSfHyM8J+pAINJmxoPEk1Y?=
 =?iso-8859-1?Q?EU83uh2UTc01vE+fiNc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 414ad5cd-74fb-43e2-73bd-08db5c7aa36f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:16:40.2448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eUEFDtI2egiEiQvxgYDzhvjbI9E/bTF4GgQhQ2v/lexEG8dkDia15VK6AZr37J/Rh71LylMxEKBLalxGAHnKQEC2xcfTf6cxMiWWhe59IVud7qWvyWcu10pwsVPtOmOm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7997
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
Cc: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 01:43:26PM -0700, Chang, Yu bruce wrote:
>Specific to this particular patch, if following the same patch below for upstreaming i915, the change looks good to me.
>
>https://patchwork.kernel.org/project/intel-gfx/patch/b0f6e50a8cdfc484f2dc18d3215e86465e2e1f1c.1627551226.git.leonro@nvidia.com/
>
>So, with that,
>
>Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>
>

Thansk Bruce. One difference with i915 is that i915 using max segment size of 0xffffffff.
But, this patch uses 0x7ffff000. This is due to below scenario.
Say, an sg table with total size of 0x200000000 (8G) has 3 segments of below length.
sg1: 0xfffff000
sg2: 0xfffff000
sg3: 0x2000

Now, iommu_dma_map_sg() loop, we get,
iter#1 (sg1): s_length = 0xfffff000, pad_len = 0
iter#2 (sg2): s_length = 0xfffff000, pad_len = 0x1000
This is due to fact that iommu code doesn't want to cross dma segment boundary (0xffffffff).
So, it pads previous segment (sg1) with pad_len so that sg2 iova can start from dma segment
boundary. So, this causes sg1 length (0xfffff000 + 0x1000) to overflow and become 0!
This ends up iommu_map_sg() returning a value less than iova_len and hence iommu_dma_map_sg()
fails. By using a max segment size of 0x7ffff000, we can ensure padding will never cause overflow.

This patch circumvents this overflow issue. I am not sure why we don't see this in i915 though
(may be something else is taking care of it or probably we never hit this scenario).

Niranjana

>Thanks,
>Bruce
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> Niranjana Vishwanathapura
>> Sent: Wednesday, May 17, 2023 10:33 PM
>> To: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Hellstrom, Thomas <thomas.hellstrom@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
>>
>> On Wed, May 17, 2023 at 08:01:08AM +0200, Thomas Hellström wrote:
>> >Hi, Niranjana
>> >
>> >On 5/16/23 20:44, Niranjana Vishwanathapura wrote:
>> >>Specify maximum segment size for sg elements by using
>> >>sg_alloc_table_from_pages_segment() to allocate sg_table.
>> >>
>> >>Signed-off-by: Niranjana Vishwanathapura
>> >><niranjana.vishwanathapura@intel.com>
>> >>---
>> >>  drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
>> >>  drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
>> >>  drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
>> >>  3 files changed, 31 insertions(+), 6 deletions(-)
>> >>
>> >>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> >>index c82e995df779..21c5aca424dd 100644
>> >>--- a/drivers/gpu/drm/xe/xe_bo.c
>> >>+++ b/drivers/gpu/drm/xe/xe_bo.c
>> >>@@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>> >>  	if (xe_tt->sg)
>> >>  		return 0;
>> >>-	ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
>> num_pages,
>> >>-					0, (u64)num_pages << PAGE_SHIFT,
>> >>-					GFP_KERNEL);
>> >>+	ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
>> >>+						num_pages, 0,
>> >>+						(u64)num_pages <<
>> PAGE_SHIFT,
>> >>+						xe_sg_segment_size(xe_tt-
>> >dev),
>> >>+						GFP_KERNEL);
>> >>  	if (ret)
>> >>  		return ret;
>> >>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> >>index 7e111332c35a..a1c51cc0ac3c 100644
>> >>--- a/drivers/gpu/drm/xe/xe_bo.h
>> >>+++ b/drivers/gpu/drm/xe/xe_bo.h
>> >>@@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
>> >>*deferred);
>> >>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>> >>+/*
>> >>+ * xe_sg_segment_size() - Provides upper limit for sg segment size.
>> >>+ * @dev: device pointer
>> >>+ *
>> >>+ * Returns the maximum segment size for the 'struct scatterlist'
>> >>+ * elements.
>> >>+ */
>> >>+static inline unsigned int xe_sg_segment_size(struct device *dev) {
>> >>+	size_t max = min_t(size_t, UINT_MAX,
>> dma_max_mapping_size(dev));
>> >>+
>> >>+	/*
>> >>+	 * The iommu_dma_map_sg() function ensures iova allocation
>> doesn't
>> >>+	 * cross dma segment boundary. It does so by padding some sg
>> elements.
>> >>+	 * This can cause overflow, ending up with sg->length being set to 0.
>> >>+	 * Avoid this by ensuring maximum segment size is half of 'max'
>> >>+	 * rounded down to PAGE_SIZE.
>> >>+	 */
>> >
>> >Is this a bug in the IOMMU code? In any case, shouldn't the fix on our
>> >side be using
>> >
>> >dma_set_seg_boundary() and
>> >dma_set_max_seg_size()
>> >
>> >to set reasonable values that avoid that problem?
>> >
>>
>> Thanks Thomas.
>> Hmm...I am not fully familiar with the iommu code here, but letting
>> sg->length overflow may be an oversight?
>>
>> Looks like dma_set_max_seg_size() doesn't enforce upper limit to sg
>> segment size while sg_table is created. We need to use
>> sg_alloc_table_from_pages_segment() to specify that. It seems
>> dma_set_max_seg_size() is used to specify the maximum segment size the
>> created sg_table has while doing the dma mapping. The iommu code doesn't
>> even complain when it runs into an sg element with size more that the one
>> set through dma_set_max_seg_size() during mapping.
>> So, driver must ensure that. I think we would still need this patch and update
>> it to call dma_set_max_seg_size() also.
>>
>> Yah, looks like we can call dma_set_seg_boundary() to set a very large
>> segment boundary say (0xffffffffffff) such that the maximum sized BO fits
>> into it (ie., we never run into any BO crossing the segment boundary). But I
>> am not sure if that is the right approach.
>> I am not seeing many drivers calling dma_set_seg_boundary() (pci probe
>> sets it to default 0xffffffff). Our GPU may not enforce any dma segment
>> boundary, but not sure somewhere else there is one.
>>
>> Any thoughts on which approach we should follow?
>>
>> Niranjana
>>
>> >/Thomas
>> >
>> >>+	return round_down(max / 2, PAGE_SIZE); }
>> >>+
>> >>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> >>  /**
>> >>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
>> >>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> >>index 2aa5bf9cfee1..5c2fdfc0e836 100644
>> >>--- a/drivers/gpu/drm/xe/xe_vm.c
>> >>+++ b/drivers/gpu/drm/xe/xe_vm.c
>> >>@@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma
>> *vma)
>> >>  	if (ret)
>> >>  		goto out;
>> >>-	ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
>> >>-					0, (u64)pinned << PAGE_SHIFT,
>> >>-					GFP_KERNEL);
>> >>+	ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt,
>> pages,
>> >>+						pinned, 0,
>> >>+						(u64)pinned << PAGE_SHIFT,
>> >>+						xe_sg_segment_size(xe-
>> >drm.dev),
>> >>+						GFP_KERNEL);
>> >>  	if (ret) {
>> >>  		vma->userptr.sg = NULL;
>> >>  		goto out;
