Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD870C77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 30 May 2023 19:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FF610E124;
	Tue, 30 May 2023 19:57:57 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEB510E124
 for <intel-xe@lists.freedesktop.org>; Tue, 30 May 2023 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685476675; x=1717012675;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YEF4CfQAkRS8MuyvbZjBuAAGWSP7ZIo+GIB4C55MTq4=;
 b=W6ZMGmVx6qTe4l+tXgLxkboEABXlz5Rd6s3Trfot48e4ETxBIH4tI1Bj
 KWldjzv/vL6Ac1Wa6xbjR0gl5JkmFDEcvTRs0kNP+jNo1Hv1vW9XEvMbg
 6i1YPADxEJ4DtsWNzYRevzKu1bQjfnuzojfrEXutQIM7WU/N/JGgYjiWR
 nyFnKq5uZ7/AlwAEEcsf9k4bIyokLQgVU1waJcRmjnbqft0aro9ExgyQn
 /31mqi77Rtfvr7+PX8mrUmbdujYBGFyo/nEDFaXNZJK4s4s8eXp0AtE3q
 jD3yU6heqMBV70/G3s3JkVYIzMHhOmR9D5ymCfRwHRiQqcd0r1PaNHOvR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418519289"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="418519289"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 12:57:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709755352"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; d="scan'208";a="709755352"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 30 May 2023 12:57:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 12:57:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 12:57:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 30 May 2023 12:57:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLSpsaUrq8nY0aJQBDqvqDNaAn5dJfVwqpBg3ZHmwo2yalqU5KikjeTs7/8s6h+8K1MLVpv1BsapodJw0CTeI65ZRljQRZaBs8l0MlP2pWPQjElhYr4xBDg9RrQEYvZp5MPUa7QueaJFqzBel2lt4AzORJ0JCZrtK3llJ4hTawAc6wGUnyZ7G27WC1hJ6s8rgsEUg7cdAvSDFKWj8vDgZXl6gFHrsNPslNVaJra2BE8OVo8xQuu3+6Ad5gc7KF4DEfqO6A6ZDS1TKFrIjNWkBsXJgTh4argLqx8pwnJzdvp0FbkQfVnJvbrmIMqrl1eBlElVOSsA2b5yEgB7i1X4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pY+Vn0iofAJe5giuOIQ5ZMyybmvGrNYrS7vI9ZINamI=;
 b=Nxkg0BuqdDZrfa4E9plXYbQ5Hkowx7ir9EuYWAIAclye2Xr/hzK7LjWJgC5mBvj1CtKb5iKmFQwEcqLFNo3/ygtyeMHE5goBetL59hrfYUhpw24r4Df5sl5FQrb9uJ3G3twBsTu95RtvffBcmWOitoiMGfjQhq4LhV7PkA0AG8jG2GQDF788v5pkEni9f1k+DOSop3YWGnm2VbpJd9QMn3moxPe0hhhOqMdJ992VMoTF6vedvEF2rESGcddnmE/WJU/S46izv3cZHl94/sKHIJAUADBltalFuhep3eqA57ZXNDjQ2t1xnCcc1FqWfdFN+4LXJDenYXUtS7X57xTADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6945.namprd11.prod.outlook.com (2603:10b6:806:2a8::19)
 by SA2PR11MB5161.namprd11.prod.outlook.com (2603:10b6:806:fa::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 19:57:52 +0000
Received: from SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::5be:1594:850b:fd62]) by SN7PR11MB6945.namprd11.prod.outlook.com
 ([fe80::5be:1594:850b:fd62%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 19:57:51 +0000
Date: Tue, 30 May 2023 12:57:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Message-ID: <ZHZVN6NOZw1hAcJK@nvishwa1-DESK>
References: <20230525193528.25251-1-niranjana.vishwanathapura@intel.com>
 <a0112b3f617356d507f055f081dc72071607ea0e.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0112b3f617356d507f055f081dc72071607ea0e.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0107.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::48) To SN7PR11MB6945.namprd11.prod.outlook.com
 (2603:10b6:806:2a8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6945:EE_|SA2PR11MB5161:EE_
X-MS-Office365-Filtering-Correlation-Id: 54edfc9a-4b4e-44f2-87b2-08db61482675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wEA24MAlAvTX84Y1hHjGooYvHnEgDPJ7t7M1LIdjXCsSqjSiiz/Oa5LXKrF0/MWKGOF9Xlv0g4ZlMNnWPdkAJXxzJEoi7Ja1jht1NNA4rmweyR0a2DJeYvq56o+dCW4ncmzmJmSn9QlMjCQfqoYX9QCT6F572ZP83oKV9gvejpXTCmHjaXwq87G5GqhvxE3ihu/M+i7w5jboPHxSQ/A6Jr/6DfD4qgiapkjTDuMSyk+bINX4dx3zqQUYSetHaro8Yvq6dsZ3rnKddVprfU9+/qBcsqJcZMjKe3wRwZF45CJHAZ8cnDxCm0JwLXt8TmBufGlyT+F1zvwY/kurtUVLFV71cQNfsDxIwZklUCHYxVzJBnOCTfYAou6HjtcztmWK7DpZa8Va/6DSRsVCxjE7t22LtiiL7399qUkB7xtXt7RJPp5F/mOhzsnOUb33t2SjRYc1s4o/kb+9ymdMDCKKZvMM1fGvJiKfINxC4Uw2Y6SXj0cw/krlYhzIs/ILrYCHKPRn7KJYiPPKA8NsFXyzQAf+9FZHzWhEGfkamhwIc40gxspMQqOR22QVD8YKNVaB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6945.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(478600001)(54906003)(8936002)(8676002)(6862004)(44832011)(5660300002)(2906002)(86362001)(33716001)(82960400001)(6636002)(4326008)(66556008)(66476007)(66946007)(316002)(38100700002)(41300700001)(186003)(107886003)(9686003)(26005)(6512007)(6506007)(6666004)(6486002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?obcOgUltoVWtuM2QvOUyDMsWhIqp+Wi77xMsgqEqcacWuz1/l/NBdUX9rj?=
 =?iso-8859-1?Q?yWui9QnSBi+/0nmjnkiScybIEFGFIveGQQXq43RaH3TSHcnYFP53+YEtE2?=
 =?iso-8859-1?Q?YcMQJqykbrjbaa4gPrOJHnxABf/FPAO8b1SBVie9ATa4QT+Ppz5T2Pk1mx?=
 =?iso-8859-1?Q?MFa39elNgFmRzIHeLR8dlYVnILsSoSmeYpU1lTlyDOoGbgSFwfN+aJfLFV?=
 =?iso-8859-1?Q?bHIHRJnnuUddgUEUF3jSTlna+TfMA0LH1BxNGOoSdjVm1MFbP5e68XIFAj?=
 =?iso-8859-1?Q?8zj7ALaCQB6zRkqlqzyWrofBkTDid/ER9aKRq1C80G985n0XsYXN5+OUNk?=
 =?iso-8859-1?Q?6TKGlywdzRCIgltBy12lwuQeGYedZFdA0oplcuFmPYJVhhe2Hu5KHX+yB6?=
 =?iso-8859-1?Q?CuwIb4SHYakAIzSIEQLSSuUFgXDklmq9W083Q+Eb8nK+04e9mk1O4m0ifg?=
 =?iso-8859-1?Q?l+USzhY5sVpDHeLX8M6uJ5bOhyn6ssxWmiDiixiXuePdKEI/+gizCaZloB?=
 =?iso-8859-1?Q?C9lkpSct0CHihF1JuUc82fos6NGa5B2+EsxWhDreGZELCYzBrHKyV9xJ1k?=
 =?iso-8859-1?Q?GE3jC5uHUy8nicBvfGU+2z7ovtP/nUcBrz0xi2m2uQ6wIVWpe1EWFAbUQK?=
 =?iso-8859-1?Q?X8YcWYQMMG7vf5mtmkSZh6pB6I/BUugPJt2fc1l80aWEsFjF5Ht4RwHGtE?=
 =?iso-8859-1?Q?i5/aI0UU/pDrt55RklxT/bg8TRvRgGQAEL84NrqHVFEYHwFtzgygIfTmLP?=
 =?iso-8859-1?Q?SafuESNYZjvSeNnEGl73JQlwAQJcJ/r3LIjqEwm47r+aU36gdgfs/7OFNv?=
 =?iso-8859-1?Q?vTfRWoD7n2O0yXevs8seOV//XVHyacPAJjnI5DLCey2mqIUgFkgRzCcOmb?=
 =?iso-8859-1?Q?jUWtGFaNnGIt4dSt2kDOKPTHc5SqX5oNRNofLF3jP5fhe2FZGraQKz0U5D?=
 =?iso-8859-1?Q?KTgx1eZWye1doL4Q33gCcsVhejx2uQa3A4D+JNpfnGFzFGP0Ns0GlRAwsf?=
 =?iso-8859-1?Q?M/iNZh937IItQqSErECCdbZvIiLh43ZYpXJJkjuC9eJJzPjZAnyOeq15l9?=
 =?iso-8859-1?Q?ktmjBN4hx0hIBCsDx6Szjc+FhlmgGEOQbZ059nwIGcP23l6cJGwMHUGozR?=
 =?iso-8859-1?Q?HBB4BSOcfAvm1/y21B5BBJX3OlrWMUzmXTZiwZs+SK0XH4xflyiwZpfO6z?=
 =?iso-8859-1?Q?lvmxug8YGn0zbh8KtMpVNAtS9eELeWBdTa9LlWxDQddoah0caLkkdI46VN?=
 =?iso-8859-1?Q?MWeEMCVy3efXq1tdIQ0bvz/3Uj2sx10CQOFVl9Btvo6hlfv60CXrGwJcTn?=
 =?iso-8859-1?Q?TaP3EjGG3yM/NgjwbDiJOzm9kjo2Ps4zfHX0hrg4k1C2JcrUFVfdQcSQI9?=
 =?iso-8859-1?Q?VRePuLnaqp1qU5B74WYbFxMsmUv/2c1odWmlQalExxWL8JTUlBJK+soXeo?=
 =?iso-8859-1?Q?EojGsCUS50m2Wn5wtnh659jFjgCS2NZYgytjVubjOJ5V9qY1RJXDh29A5f?=
 =?iso-8859-1?Q?YUc6xtidMvSCqxlc6ajFCa/fioqduCVsLypi2AI8yvy4GX1r+scMXl2yt4?=
 =?iso-8859-1?Q?UH12eHCUZiP/xgnmNvSIeMuGjRg/njqxS+wEr+YvINw/RDszed/VllKXBF?=
 =?iso-8859-1?Q?AG7yBNHvI2IqFyMucikoKjjvVWtMTPMfXXXWrDH48JjHH7gBwd1lQjMB8M?=
 =?iso-8859-1?Q?JO0UT/PQv12StCvf7fI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54edfc9a-4b4e-44f2-87b2-08db61482675
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6945.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 19:57:51.5746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oJ0G+0Ac5vaB9AnKwkUWmRp5nuU/xXdizEAQesys6yT+9ER7BPFtGowVr8jjwQBvJDBrE/LwifVf7OfN3QvSa+98OUVdpmakISvvwDfi5QPGWR4oXrFi8/kL8cdxCk3m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5161
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Apply upper limit to sg element
 size
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, May 26, 2023 at 02:12:23AM -0700, Hellstrom, Thomas wrote:
>Hi, Niranjana.
>
>On Thu, 2023-05-25 at 12:35 -0700, Niranjana Vishwanathapura wrote:
>> The iommu_dma_map_sg() function ensures iova allocation doesn't
>> cross dma segment boundary. It does so by padding some sg elements.
>> This can cause overflow, ending up with sg->length being set to 0.
>> Avoid this by halving the maximum segment size (rounded down to
>> PAGE_SIZE).
>>
>> Specify maximum segment size for sg elements by using
>> sg_alloc_table_from_pages_segment() to allocate sg_table.
>>
>> v2: Use correct max segment size in dma_set_max_seg_size() call
>
>OK, I've finally read up a bit on the code, and as you say
>dma_set_max_seg_size() doesn't affect the sg_alloc_table_from_pages()
>code at all, so we must use sg_alloc_table_from_pages_segment() as you
>say.
>
>The problem stems from the iommu code trying to align scatterlist
>elements to dma segment boundaries, and the scatterlist::length can
>overflow pretty much regardless of the value of the segment boundaries,
>as you said previously.
>
>But the size of the padding can never exceed the length of an sg
>element, because then the sg element would have fit and no padding
>needed. So that the only restriction needed would be
>scatterlist::length must never exceed UINT_MAX / 2, which was pretty
>much the version 1 of the patch. So some comments below:
>
>>
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c   |  8 +++++---
>>  drivers/gpu/drm/xe/xe_bo.h   | 21 +++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_mmio.c |  7 ++-----
>>  drivers/gpu/drm/xe/xe_vm.c   |  8 +++++---
>>  4 files changed, 33 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index c82e995df779..21c5aca424dd 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>>         if (xe_tt->sg)
>>                 return 0;
>>  
>> -       ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
>> num_pages,
>> -                                       0, (u64)num_pages <<
>> PAGE_SHIFT,
>> -                                       GFP_KERNEL);
>> +       ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt-
>> >pages,
>> +                                               num_pages, 0,
>> +                                               (u64)num_pages <<
>> PAGE_SHIFT,
>> +                                               xe_sg_segment_size(xe
>> _tt->dev),
>> +                                               GFP_KERNEL);
>>         if (ret)
>>                 return ret;
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 7e111332c35a..a1c51cc0ac3c 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
>> *deferred);
>>  
>>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>>  
>> +/*
>> + * xe_sg_segment_size() - Provides upper limit for sg segment size.
>> + * @dev: device pointer
>> + *
>> + * Returns the maximum segment size for the 'struct scatterlist'
>> + * elements.
>> + */
>> +static inline unsigned int xe_sg_segment_size(struct device *dev)
>> +{
>> +       size_t max = min_t(size_t, UINT_MAX,
>> dma_max_mapping_size(dev));
>
>dma_max_mapping_size() should be unrelated? perhaps
>
>	struct scatterlist __maybe_unused sg;
>	size_t max = 1ULL << (sizeof(sg.length) * 8);

Thanks Thomas,
'(1ULL << (sizeof(sg.length) * 8) - 1)' is UINT_MAX which is used above.

Regarding whether to limit the 'max' to  dma_max_mapping_size(dev), I am
not sure, xe_sg_segment_size() does similiar to i915_sg_segment_size.
Though it sounds logical to limit max segment size to that imposed by the
iommu driver, I am not seeing intel iommu driver defining 'max_mapping_size'
function and not many drivers using dma_max_mapping_size() function. What
do you suggest?

>
>> +
>> +       /*
>> +        * The iommu_dma_map_sg() function ensures iova allocation
>> doesn't
>> +        * cross dma segment boundary. It does so by padding some sg
>> elements.
>> +        * This can cause overflow, ending up with sg->length being
>> set to 0.
>> +        * Avoid this by ensuring maximum segment size is half of
>> 'max'
>> +        * rounded down to PAGE_SIZE.
>> +        */
>> +       return round_down(max / 2, PAGE_SIZE);
>> +}
>> +
>>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>>  /**
>>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c
>> b/drivers/gpu/drm/xe/xe_mmio.c
>> index c7fbb1cc1f64..4c270a07136e 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -11,6 +11,7 @@
>>  #include "regs/xe_engine_regs.h"
>>  #include "regs/xe_gt_regs.h"
>>  #include "regs/xe_regs.h"
>> +#include "xe_bo.h"
>>  #include "xe_device.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_mcr.h"
>> @@ -26,11 +27,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>         unsigned int mask_size = xe->info.dma_mask_size;
>>         int err;
>>  
>> -       /*
>> -        * We don't have a max segment size, so set it to the max so
>> sg's
>> -        * debugging layer doesn't complain
>> -        */
>> -       dma_set_max_seg_size(xe->drm.dev, UINT_MAX);
>> +       dma_set_max_seg_size(xe->drm.dev, xe_sg_segment_size(xe-
>> >drm.dev));
>
>Should not be needed then?
>

After dma mapping, the iommu code in __finalise_sg() function
contanenates segments based on dma address while subjecting the
sg element length to maximum segment size specified here. Though
at this stage where dma mapping is already done, we probably need
not adhere to our maximum segment size, I thought it is probably 
better to stick to spcified maximum segment size throughout.

Niranjana

>>  
>>         err = dma_set_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>>         if (err)
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index a0306526b269..4d9c8de8b348 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma *vma)
>>         if (ret)
>>                 goto out;
>>  
>> -       ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages,
>> pinned,
>> -                                       0, (u64)pinned << PAGE_SHIFT,
>> -                                       GFP_KERNEL);
>> +       ret = sg_alloc_table_from_pages_segment(&vma->userptr.sgt,
>> pages,
>> +                                               pinned, 0,
>> +                                               (u64)pinned <<
>> PAGE_SHIFT,
>> +                                               xe_sg_segment_size(xe
>> ->drm.dev),
>> +                                               GFP_KERNEL);
>>         if (ret) {
>>                 vma->userptr.sg = NULL;
>>                 goto out;
>
>Thanks
>/Thomas
>
