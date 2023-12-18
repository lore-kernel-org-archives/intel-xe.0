Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BD1C46CD4
	for <intel-xe@archiver.kernel.org>; Mon, 18 Dec 2023 18:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25AB10E394;
	Mon, 18 Dec 2023 18:46:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B101D10E2D2
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Dec 2023 18:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702925173; x=1734461173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ruFk806251D+KcQRdnnv5sIJgFKZcRKA+rvTkvPzzcY=;
 b=F3FSgWNl/xbXuM3DDuv+XEdz0Rup7s9KPNyrolKL8Te6WB0Zzf/INwyJ
 QL5rhypt8wBNNmhr6AN8ryiqVt1vsb0fITvF4Nhs2eDkFUR035ORZ+T64
 OBKyiGDog52Kubdu8vFIs/UfRmMnM+fswXOCnG9Pcq9R4kZ5psQVcUbFb
 WLWSyqcoIMsKI8TIRMNQoMjB1MVU+0ku5RGBgj8LWtGvr7BnfmGhZ+uYM
 c4yg3StFfrWHoc18lGH/RQgzWPdSiwieNXz8NXzHgiedSNGNNVQ9Rnfar
 yC9bOkXdAGg18d7dWOXRqKvXojbHe04d7eQ+MB0Wiqk40/x0gJyioXk5g g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="2665308"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="2665308"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2023 21:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; d="scan'208";a="17043715"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2023 21:26:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 21:26:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 21:26:29 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 21:26:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 21:26:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WN6cmtD6gW7kEdyLd8mHeRVuiV8sAdi3P2K+iRg8BQphQK8z1chvvw7XSEv97r9saFS71rw7ju8+6qSKB6AkSZO0vgDu3GwLbI/x1A95USd5NlkR0t5ejrI0HJlHxHALRraRra/scHE9jqqWmf0bNETHu5QffszxaDlLJNR29ruhOSJgBvkWbUNjHsYVyjfauEZvfTfc9JkM5wIbJpy3Xy+n1/xVyn+2+RmPH4adQ7H0bsQWAilpv3XvrucvEE41BtfFqOy2UyRX6lN9bnlymZh6NDcIt/ivWatb8f484vFJCiXVlGytmNnuS+LyBQXh2IzMvvRZjhuF8folNqaZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YFlO2nardqLQea4NQn2e7nDaFUbb5p5KjieGCj1BaU=;
 b=cbLzRlTti4VRpLxxvup+rmap2WK5/xbs2Jzq+RXJAfWOXOMx3BMGOjoGlp+usAY568uJ3y0NxpiTqtEqMbDnT9pmjACMg2fpJL0TRjgDmJdb3JVZGfHexp0+xHi+s0k5Jnb0oSYMrkMchJy3p5lwH3pvBQfAf8ykjHIL6sCTK6/RAoSFLl9wXnVaXNzpHKtUwoYXlD5ZZac1QOrXKKp6Y7CJPNbBkCjP6dSluGZ9QmymFcN/RW3x0ZlZztPgWzwC7/SA1JNq3KYOKMHxhPIjGqFl98yonTvUc0Zz1SLzavviWh69uwy6cAnal2rFVsji2bZv65gxkTHm4U630ZFzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 05:26:26 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7091.034; Mon, 18 Dec 2023
 05:26:26 +0000
Message-ID: <e49a05d7-4115-456a-8c51-88445878dcea@intel.com>
Date: Mon, 18 Dec 2023 10:56:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/10] fixup! drm/xe/uapi: Reject bo creation of
 unaligned size
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20231214113144.251726-1-riana.tauro@intel.com>
 <20231214113144.251726-3-riana.tauro@intel.com> <ZXsDpzNOy7bhxPTv@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZXsDpzNOy7bhxPTv@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXPR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::25) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3e0b32-5c8e-4bcf-629d-08dbff89e0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wblG/+vovhrIOfi2bKOesmu8/l1d71Ebn7Za61/a36sCIdwEzXsv1sivBQbODY9qfDUKVwWn6VhWYm4gc22jBIQmR51J42wNWJAz1m0jCvvUFV9I8IGGiMmBku/OI7DVk5/4bEKD8Xq6QFAzibup1fJxio1KzALtA6wCKr9GpAW2EhkkmQUXnfB8CJuLW9NRfYPsVdb/Zm9xhabMslYgN3v3AgswxWMMKCQ20Y6mFjt3S67+u/NNP4dGcIrCFtjkY0vsN1r7LmTVFhTeOGpElD8LrpdAtOB5nNhrwKroWbHglnFVXzix0yrPgJbCraUmnM7o1xm1tJVfj/8luwqwWCknoODlsbyWD24VvupEetqKWub8W2ob1gQeZa3b4zV104HrV9FhXC4RRKw+3sj8vmF9EWou9zEc0uum4lyIpAMCUfw71DfUZKuQcC9zTa9RAu+Z33TuAxTe6Rq1ULBGckfpCgzDuHRJk3pZMUGQ0FCgVO1Cw4GIwSPvlXCqrKHDy+v4eov4v8tUZR5uy1bZ3Azeho71oSoB9tE2cfOTXzENPdROVBMBf8O2k1yGSc5sKbDIOZOzNlacywsVdrl63lgY/SZ6HK8ApAl7QsmrIR90+XDentFna88H+QGqSxrATB5YDDxXy7xTOOxu6GGezw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(31686004)(5660300002)(38100700002)(86362001)(31696002)(2906002)(2616005)(26005)(6506007)(82960400001)(53546011)(6512007)(6666004)(316002)(66556008)(66476007)(6486002)(36756003)(41300700001)(6636002)(37006003)(44832011)(478600001)(66946007)(4326008)(6862004)(8676002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2krU1Z3MUJFL3Z0c0VVdjkzdG1SSFBBY2ltVkdYRHhYRTBoNC9FelE5b25N?=
 =?utf-8?B?VFVVQWJKYm1lc0d4Q0orMGxoU0g2d1krNUg1bkhKcHRHSkVkaThyeGVhY013?=
 =?utf-8?B?Y05VWG01dWZ0Nk8vYTJDVXJnMUNpNzJzSHdVbVU5cFpid0Y1QXFvOWx4elJE?=
 =?utf-8?B?dkpyc0ZaSEExUzUwcHcxTmlaNGJGODRXclp3U29CdFFBYWhlUDBpU1cwMVRX?=
 =?utf-8?B?UGNmNU1lM2tYam9sZWRUOFdQL3RDNFY3YnFGK1B5RTViL1VMKzFYTlZ5WWw5?=
 =?utf-8?B?dnQyNWJYcUFHL1I1cjhrdHJCYU5VY1VGV2VWR1FmZTM4UjVacVpkRzNUVjJI?=
 =?utf-8?B?cTlyUEg3LzhzSTFZVEhtOU5wMmViWk51dDBRaVFiaW5wUmxwTHdHWS9pSW8w?=
 =?utf-8?B?cVhBSXpISUloUEJvQnY1VG5nMFczSVZVbmJmYklXRWtsMHh4S3RMM3NHTWRE?=
 =?utf-8?B?QU1ZZ2JXblYzejJmeERxVHRSWVR0TXY2dXhnMnVMYkZhT2sxMEVVTC84eGhO?=
 =?utf-8?B?MEtuaFNzN1R4Z3MvcncyQjY3L2VpVkkvNmFYaFpqN0FFaHpwQm5tbXdRUDRP?=
 =?utf-8?B?NXF1bGV3dVRCNURFRzBoL2VoL1VZaGVTZVB2bUl4NFlhOTNCeHFZS2hBRDA4?=
 =?utf-8?B?TXhvWmhkd1Q4L1FjeG9oYWt5TDJETjRHT1EvRVhRbWl5aVNWc0ZmTUhsc1Jx?=
 =?utf-8?B?aHdyazdSa0VmOUhZYllrZURqNmltNXdQRWszbjh3Z2Rlb3U5RDhteTdRMEJS?=
 =?utf-8?B?UU1pMHdrWjN3MzdQZ2tHUGNxMG91OFh5N2JiQXV4MnhGWUpsLzBUTm9kK2My?=
 =?utf-8?B?elB5ejZsSllkUnRxQkJwU2M2dmZxeVFHbk1CK3c4SEdnU3VSdlk0Y1grTG9k?=
 =?utf-8?B?NVhDRE1XTjdsMHU2cmFmN3pFWE84c3V2eGNnT3F3UWl6a2Y5dFMzSTE2K1NX?=
 =?utf-8?B?ZkxPU21KbHY4MGNoZUpSVnFBRjFJUjU3blZjUEcrMFhzUnMzWGpBc2trcmRu?=
 =?utf-8?B?ZUpmK2dRMmFVVUQ3dFlZWXU4cHhoazFPaHZuOXNjenpoR3J1Y1hWbDNNNG51?=
 =?utf-8?B?TTJEOWtGcHR1TktUc0xXb2lzSTVSa2NNUjQzMFVJa3ZKc2RyRldsMG1hY3dJ?=
 =?utf-8?B?a3F4RkYwRzBibkVLYm05Mzl0VXRDZGpSWWF0cmcyaG41a3NtYlppcUlJM09q?=
 =?utf-8?B?bVEvNE9jQzhLd0phQzQzYTRQOUJiQVN3bEVpenJlQzhuOHFYZHJjV01kL05u?=
 =?utf-8?B?bmErRmhPQ3laVGR4K0ZPUHdsRWpYQ3B5bEthbkt5Q05qbW1rd0dxMGRCODZM?=
 =?utf-8?B?UUg4cFdUMlNSY1lKYWQvdG8rOHJpRlhxQWQxTHZNSURWV2Q5c0pVZEdxRkUy?=
 =?utf-8?B?SjRvRWVCWjJrajg3SVRha0ZLeUVmU213ekVRRUhUMTFXVE55bGNCb1RHSmVH?=
 =?utf-8?B?OEVFYWtHV3czV2NkRWNDaFBJd2V6bTBUNWhDR0xFYkF4T08wVlNGQ0R3d2RJ?=
 =?utf-8?B?cTVVTjhNRXhKZXVPZGlqZWh2WGgxL3lBaVowcElVTC9WcytFSTBRN2J6bkt6?=
 =?utf-8?B?c2lyTk1OQ1dLWmxjSSsyNjQrZUt0WEU3UnZlaWF2QmFMYTExTjFlL1BiWndZ?=
 =?utf-8?B?TWkzVkZqRHArbkh2RG54WHZTaXlDZkE2R3Q2Sm9wSlJQZ2o2YzVWRXQwUGFN?=
 =?utf-8?B?OW9GaXVHbG90eVByb2djbWc0N2F0Y00ybUxQVUFSRENRdGtyREEySXpWRVk3?=
 =?utf-8?B?R0E3L3ZWWGRYQ1UrTmpnWEp3by9jV0dCNzhtckZEVGxQUzI3OUdCMHFWOW9V?=
 =?utf-8?B?VkY1bzREU3JxMWFvV3RsaTNIeVhhNlpPSk5sbmZnMWNxYjNCb0RXdDNaSWxn?=
 =?utf-8?B?YlpNUGtrYkxkNS9vTGEwZFhPRVJlRVl6MWhiemh4R3dzY2RXY3FoSk4zdjg4?=
 =?utf-8?B?VVVwK1dRUTBUL1g0SkwvWi83dktzdWxVa0RsVHVIS3B1cmdUWGorUWJ1Z0Ew?=
 =?utf-8?B?LzNsZWZ6alV6NVkxdWhDdjU5QldGK0l6bHFkcUpVbG1WTVRXZ0NMWnVrc1BU?=
 =?utf-8?B?YmR6a2xDNTFUWHF0Sy9qM21Qck9LSG1wanZ1S21TbkVlQy9NRTBSQ2NHaVM1?=
 =?utf-8?Q?2rDqnQ+MeRewLzYQ3wH/nQWBX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3e0b32-5c8e-4bcf-629d-08dbff89e0ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 05:26:25.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNXtXi/a6WrLSnhpf5hFD4ILLvYkU4paBXopEPMk1VUyoq3YThV/MrmackSmMpNsiRQXhXVDaDAaplhLWyBZ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
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



On 12/14/2023 7:01 PM, Vivi, Rodrigo wrote:
> On Thu, Dec 14, 2023 at 05:01:36PM +0530, Riana Tauro wrote:
>> From: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> We don't need this anymore since Ashutosh already put this as part of
> the PMU removal patch anyway.
> 
> But also, please no more !fixup patches. We are about to do our rebase
> to drm-next and will need stable hashes for stable 'Fixes:' tags
> and commit mentions.
Hi Rodrigo

I added this patch only for compilation as its going to be merged.
Wanted to rebase the pmu patches on top of the removal series.

Thanks
Riana

> 
>>
>> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_dma_buf.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_dma_buf.c b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> index bb6f6424e06f..9f6d571d7fa9 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_dma_buf.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2022 Intel Corporation
>>    */
>>   
>> +#include <drm/xe_drm.h>
>> +
>>   #include <kunit/test.h>
>>   #include <kunit/visibility.h>
>>   
>> -- 
>> 2.40.0
>>
