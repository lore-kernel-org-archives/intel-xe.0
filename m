Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE9BC77B7A
	for <intel-xe@archiver.kernel.org>; Thu, 25 May 2023 05:56:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD7B10ED08;
	Thu, 25 May 2023 05:56:05 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE7110EC69
 for <intel-xe@lists.freedesktop.org>; Thu, 25 May 2023 05:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684994162; x=1716530162;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cHjKbfjH8JSvM3KQqr5sns2vycj8we957TVbhtmmv9Q=;
 b=Mkk1TL5+/6ugrQlQ9cz2G14nAk1pohIXi9vJgnT60l1cmXmJsXm4WJXO
 T/bMKLCPLav/WdsC+PbAhEtcXEvNA3E668OtFr6TdOP3hdNmgdUtoHuY5
 JBhhl4/6Du6OvcmYdRJmFMzheRBEsA66oKf1RPGETPrwsNJcwWc7Ag9BU
 27wejO4mTR0L5ivW4KUWJS2Cru69+eMstRlPqdSSJyuE2LGIuvt2ZY2NC
 3FwVL1LrhsNp7wKUiFnEkbCACAHwDCCDR2EoPDUs/hkXWFkPaAL3lyGVr
 jfFcTWzDjnU01cNonJyPNoR05k6kFboAfBgGPJHD33+yH7NKlzpcSobl4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333411433"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="333411433"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 22:56:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="828903244"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; d="scan'208";a="828903244"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 24 May 2023 22:56:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 22:56:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 22:56:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 22:56:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 22:56:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcilrI2G3rZJ9WIugbdx8uXB9zbonmLufhgEbxge/QfyCjq0vFoEVOB/MZ6jaEr7yaK3XKIGuEZtolS/ai0tZtI0nFUfPK/j35MNTLzsgI2RtPMqM4ZNH+p0tjD0O/BemMWgh3KuHWxGevbsgZ8w6tr6RyMiAn+z1tBXUhTUmUiIP0+sYe3dX2ETtph6AT9rIFAS1LjmrrZAYpX/0gFk8iYtT6su00c3cViWpJJDjWihDU8vMzAmlNDR8qlbtmNfLRQoRMNuUFpyeON8WYtWX9gZMJFW+1JrfAfvtfme8HbiRaRyVSeOquB0Eae698cPAEBfwH21ZPAeAtyA6la8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/Gg+5r2qSxMR4/+xkOF+A2fCgoY5QXrBy6/5NkWEeQ=;
 b=dPC8QjiZEhjKfaNf3eRy+PGhh4oIKrGTOGBZuucv9U/0tWSKpTXFViHXd7zrJrzoE1/mufKgV93zq5wT1lupbK6ww6YMeTeeAS1JxmlkRU1my5eqL2BVYwXQqex02zRjN+9RvuK7iFXnuqesbva38quwykwcgWviOlHn50gWH3y1eJHlNsaSCEHZz7xGXS6bH13CPtvr+NsJcJbjITgQ3ylYgKsPPIgAZJbk9440pmlASE0foQL7PTaQwfSNc2Et/QFbUG3PXm6D03UIdoM8ls6cd4qDhKV55gBxdxyuUTiHmxEeW9/+ktfOaWrQzzBhYwVRRiZ1QkzzE42h3nPhqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.16; Thu, 25 May
 2023 05:55:54 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%5]) with mapi id 15.20.6411.028; Thu, 25 May 2023
 05:55:54 +0000
Date: Wed, 24 May 2023 22:55:45 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
Message-ID: <ZG74YYxaEJmvJKWs@nvishwa1-DESK>
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
 <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
 <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
 <649e27fc619fd2506f634248049de05e16f1130e.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <649e27fc619fd2506f634248049de05e16f1130e.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb7bc1d-8a1e-4cec-b76b-08db5ce4b335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jNoOhISodkIxuBv+CFA7TZVbn/yJR2vs35E0lCvmKVnQExHJYXZ8pzGklT9hA2c6eJoia7sM7yPLed0lIeYpmAD1d1Yq5tf32TLHwJZuTZE/SgC1fzUTstoi27EezgY9lGa7ssDlNnKJrXWoKqK9Dcblhx4N+/RnRtQCDqtkHMeMq/PFed11XNyoExTQGSQyaBylXgLDYcT/qSCSSrP56n/GGGZNSLWKMqMuLfgogtPwYGf+M95UjrKSSMX2z/KlrDkZRJS39iyYp8iw2g9lqnBRG9RRU3tI9fWRInJbvk5vk3Hm8HR7V0zZ9xy5edWctd9aB9xSngz2Zz9XsSB/9A6tmkZUn0CBjY8cQfoQu+rKPkGJ7JmjyQkOPQ7+FP/1bqUYx2O0o1nXYYrPSNw/7s09PLJJ5iIssT9V2FqQxlDOkyTl6kp0iu5r9H5QIe+FL4AcNYBXGY0DmINfQmuOsbgkOWKf7erM/1k/xe/EjY6Vu5dfLkepgOfyegpR+fAFhqt2hs23NuCo9RquZk75O73XOKMh7BRrtGGJsBoMWQfdCwq8NGCYuLyCy/bgcP3I
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199021)(86362001)(6636002)(4326008)(316002)(66946007)(66556008)(66476007)(478600001)(6486002)(6666004)(33716001)(8936002)(8676002)(6862004)(5660300002)(41300700001)(2906002)(44832011)(38100700002)(82960400001)(9686003)(6512007)(6506007)(26005)(186003)(53546011)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5iGmr0aDs8c5bUZI2imtHN8zFNG7j/RekDkN2UmluunC7dtNZK5M1mxVoR?=
 =?iso-8859-1?Q?6BrFLpUN8bM1QnBsTubSV8heN+4RyxGrkxZZwqUSdzJ6t1PK/NwOOzuCju?=
 =?iso-8859-1?Q?7K2h/e6I+4qqFhG+SXBzmKJxSyzCaz7x08G+o2kx//BbcWpJgNUkBHB4cI?=
 =?iso-8859-1?Q?TqEhanwlG2Puz80c5vYh1wIV6d87t7FzHM9vJQ4VIuscVA3DvHFwV+3ioM?=
 =?iso-8859-1?Q?UfOS2ZwXWTjlO1QLl9N/hKKwAvI1Xj/pKOkZX4S3jS92iwW/uPyvDKX6DO?=
 =?iso-8859-1?Q?aVT2AqsqcHrsfcelBlWUUwivGfXvRFA0ExUwQLL6KTX6+AnoVRlHMXIz2t?=
 =?iso-8859-1?Q?2XZsuaau4uEp8wlBKDP3SKBQljekmLYxY6iqaMG2AM6scz5M27smRHj/ry?=
 =?iso-8859-1?Q?4Cswkw0ycdFK6e0qIydnqRlxw/CKlYSZHf46VoixOozM1EKi+yIaY9semR?=
 =?iso-8859-1?Q?5GJucWUbHzR27WrmktAW4d9ifBpD/4kblKcAsCJE7K1i17c7Tv98WAJilG?=
 =?iso-8859-1?Q?jPcU1Dhefy0EhAjYEaqRsz02owkc8NANpL+bcGb+ZtSaet59RzA+1Sy8U0?=
 =?iso-8859-1?Q?BFJ6EWaszUL83YrHsfkQKliJ59+g5NmlCVH1f8JVvS6r2Zb36Y0aLlLlR9?=
 =?iso-8859-1?Q?zsO6hRfcyekzpJEdpVbLLt8Ko0f3xHHfk780FeO2pVVHhgBaBpwoZTxuiP?=
 =?iso-8859-1?Q?z7eWGJbmVqZYHMaEN61zkeChQt2zB5NwXFVaghkD3L8yR8GQxh8ssSx1fB?=
 =?iso-8859-1?Q?AkJJixMCScWFV/Zgwg49VENmvd4Ih3XjvDs5lsro+CyNrjrozmrGtXzdaQ?=
 =?iso-8859-1?Q?qgW6QLztoFGQreIPMixHq7BKJ6cSrtlPxsEkyHKYnupIArW4PaZ+GioE4d?=
 =?iso-8859-1?Q?qPwjTTVpF/0s3HAIoVwSMERw4PUQfi9yzv6WYwoG2gnYSdKZvAZg0I+acM?=
 =?iso-8859-1?Q?WUMXHQT8/YP2eASr0MWo+DRpx7e7LJtrojYggIXmKpnjaiVKHRE2nf1SHp?=
 =?iso-8859-1?Q?vqHNnMQ78CByKb2CaVoA1MkCV2Dt0Za+SSe/BVLhn3vPprAG+58bjIhVcC?=
 =?iso-8859-1?Q?yWYVTXXjdGf0JfJwvYmnohcoyHRBLkbEb1sM48JRSBl+vGtW9Mm49lkrb6?=
 =?iso-8859-1?Q?jKU5daXvbe8cwzTYfjySIQj4iqVZZvNI4EecFh4F8yOLUBMO+qmOMkukyg?=
 =?iso-8859-1?Q?ffReYdPkunF9jWPAOVOYGSDwJVLbTwNAWFVowKSlpg4SYvRXDXGHClpF6L?=
 =?iso-8859-1?Q?3URse0E3NNT93vJpFwWaStL4+zYExZFahHpVCH3I30bkqovER4S4bGK1Bm?=
 =?iso-8859-1?Q?su6QKLm8U8Xn97Tq+ikWz4Bd2Mo5j0E/6/hz9njceatov3i0S6/afjIgvm?=
 =?iso-8859-1?Q?JNF4lHqxAdUEqDv5ZYdTDMNS+t+EQXKqbERGY9ZbaKHY4iytbOXFubvSrd?=
 =?iso-8859-1?Q?tbWgM2rGBPpqmAhfDjtpoPi13t1Jou99+K50sJe2qUtJYavOiNJ0OiHk3D?=
 =?iso-8859-1?Q?4Q2jQ9hTNOXau96PSa13yWgEmpc3VQL4RT4neV+Tb7rkySRsdto2iMLY6L?=
 =?iso-8859-1?Q?9SooxZZglIU4+P8TIlfagHN7l1uQ5+P8y2mQuSZ6yrle66M+IVFKzeAX3t?=
 =?iso-8859-1?Q?5OfJ6O+6Zc5f31YQLuENBzMNhmrDGEIi0gemeYn9VuScHMtinAl+KGEB7h?=
 =?iso-8859-1?Q?Nsb1VoDRgb83Ur2aSNk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb7bc1d-8a1e-4cec-b76b-08db5ce4b335
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 05:55:53.7501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWtORJkPIZmEe1FY9jZAEXmGvZ1YK2AOVphDiJK2aeTauXzq0tCAi14BSJ5b5pldB20xORm7vIQtuOj6uakEYMuEE8jqwTXXCcikEIx+GIBYjsIhTCQjDBsl4V5ilMvX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 01:16:45AM -0700, Hellstrom, Thomas wrote:
>On Wed, 2023-05-17 at 22:32 -0700, Niranjana Vishwanathapura wrote:
>> On Wed, May 17, 2023 at 08:01:08AM +0200, Thomas Hellström wrote:
>> > Hi, Niranjana
>> >
>> > On 5/16/23 20:44, Niranjana Vishwanathapura wrote:
>> > > Specify maximum segment size for sg elements by using
>> > > sg_alloc_table_from_pages_segment() to allocate sg_table.
>> > >
>> > > Signed-off-by: Niranjana Vishwanathapura
>> > > <niranjana.vishwanathapura@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
>> > >  drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
>> > >  drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
>> > >  3 files changed, 31 insertions(+), 6 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
>> > > b/drivers/gpu/drm/xe/xe_bo.c
>> > > index c82e995df779..21c5aca424dd 100644
>> > > --- a/drivers/gpu/drm/xe/xe_bo.c
>> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
>> > > @@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
>> > >         if (xe_tt->sg)
>> > >                 return 0;
>> > > -       ret = sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
>> > > num_pages,
>> > > -                                       0, (u64)num_pages <<
>> > > PAGE_SHIFT,
>> > > -                                       GFP_KERNEL);
>> > > +       ret = sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt-
>> > > >pages,
>> > > +                                               num_pages, 0,
>> > > +                                               (u64)num_pages <<
>> > > PAGE_SHIFT,
>> > > +                                               xe_sg_segment_siz
>> > > e(xe_tt->dev),
>> > > +                                               GFP_KERNEL);
>> > >         if (ret)
>> > >                 return ret;
>> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
>> > > b/drivers/gpu/drm/xe/xe_bo.h
>> > > index 7e111332c35a..a1c51cc0ac3c 100644
>> > > --- a/drivers/gpu/drm/xe/xe_bo.h
>> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
>> > > @@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
>> > > *deferred);
>> > >  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
>> > > +/*
>> > > + * xe_sg_segment_size() - Provides upper limit for sg segment
>> > > size.
>> > > + * @dev: device pointer
>> > > + *
>> > > + * Returns the maximum segment size for the 'struct scatterlist'
>> > > + * elements.
>> > > + */
>> > > +static inline unsigned int xe_sg_segment_size(struct device
>> > > *dev)
>> > > +{
>> > > +       size_t max = min_t(size_t, UINT_MAX,
>> > > dma_max_mapping_size(dev));
>> > > +
>> > > +       /*
>> > > +        * The iommu_dma_map_sg() function ensures iova
>> > > allocation doesn't
>> > > +        * cross dma segment boundary. It does so by padding some
>> > > sg elements.
>> > > +        * This can cause overflow, ending up with sg->length
>> > > being set to 0.
>> > > +        * Avoid this by ensuring maximum segment size is half of
>> > > 'max'
>> > > +        * rounded down to PAGE_SIZE.
>> > > +        */
>> >
>> > Is this a bug in the IOMMU code? In any case, shouldn't the fix on
>> > our
>> > side be using
>> >
>> > dma_set_seg_boundary() and
>> > dma_set_max_seg_size()
>> >
>> > to set reasonable values that avoid that problem?
>> >
>>
>> Thanks Thomas.
>> Hmm...I am not fully familiar with the iommu code here, but letting
>> sg->length overflow may be an oversight?
>>
>> Looks like dma_set_max_seg_size() doesn't enforce upper limit to
>> sg segment size while sg_table is created. We need to use
>> sg_alloc_table_from_pages_segment() to specify that. It seems
>> dma_set_max_seg_size() is used to specify the maximum segment size
>> the created sg_table has while doing the dma mapping. The iommu code
>> doesn't even complain when it runs into an sg element with size more
>> that the one set through dma_set_max_seg_size() during mapping.
>> So, driver must ensure that. I think we would still need this patch
>> and update it to call dma_set_max_seg_size() also.
>
>OK, I must admit I don't fully understand the relationship between
>dma_set_max_seg_size() but I assumed it needed adjustment if we change
>the segment boundary, like below.
>
>>
>> Yah, looks like we can call dma_set_seg_boundary() to set a very
>> large segment boundary say (0xffffffffffff) such that the maximum
>> sized BO fits into it (ie., we never run into any BO crossing the
>> segment boundary). But I am not sure if that is the right approach.
>> I am not seeing many drivers calling dma_set_seg_boundary() (pci
>> probe sets it to default 0xffffffff). Our GPU may not enforce any
>> dma segment boundary, but not sure somewhere else there is one.
>
>Hm. I was thinking to set it to (0xffffffff >> 1), assuming that the
>iommu padding would then never overflow? Or maybe this wasn't what
>caused the overflow in the first place.
>

You mean setting max_segment to (0xffffffff >> 1)? (because setting
segment boundary to (0xffffffff >> 1) which is less than max_segment
doesn't solve the problem).
And this patch is about setting max_segment to (0xffffffff >> 1)
rounded down to page size. Yes, with this, iommu padding will never
overflow.
I tried 8G BOs on i915, but the BO sg table was more fragmented
there (though max_segment was 0xffffffff), hence did not run into
this issue. My guess is that we have this issue in i915 as well,
but somehow page allocation (by ttm?) resulting in more fragmented
sg element instead of physically contiguous pages, hence not seeing
this overflow issue.

Niranjana

>/Thomas
>
>
>>
>> Any thoughts on which approach we should follow?
>>
>> Niranjana
>>
>> > /Thomas
>> >
>> > > +       return round_down(max / 2, PAGE_SIZE);
>> > > +}
>> > > +
>> > >  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> > >  /**
>> > >   * xe_bo_is_mem_type - Whether the bo currently resides in the
>> > > given
>> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
>> > > b/drivers/gpu/drm/xe/xe_vm.c
>> > > index 2aa5bf9cfee1..5c2fdfc0e836 100644
>> > > --- a/drivers/gpu/drm/xe/xe_vm.c
>> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
>> > > @@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma
>> > > *vma)
>> > >         if (ret)
>> > >                 goto out;
>> > > -       ret = sg_alloc_table_from_pages(&vma->userptr.sgt, pages,
>> > > pinned,
>> > > -                                       0, (u64)pinned <<
>> > > PAGE_SHIFT,
>> > > -                                       GFP_KERNEL);
>> > > +       ret = sg_alloc_table_from_pages_segment(&vma-
>> > > >userptr.sgt, pages,
>> > > +                                               pinned, 0,
>> > > +                                               (u64)pinned <<
>> > > PAGE_SHIFT,
>> > > +                                               xe_sg_segment_siz
>> > > e(xe->drm.dev),
>> > > +                                               GFP_KERNEL);
>> > >         if (ret) {
>> > >                 vma->userptr.sg = NULL;
>> > >                 goto out;
>
