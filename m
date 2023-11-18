Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BDCC47071
	for <intel-xe@archiver.kernel.org>; Sat, 18 Nov 2023 04:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9485D10E0C7;
	Sat, 18 Nov 2023 04:26:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FFD10E094
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Nov 2023 04:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700281595; x=1731817595;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b8bbsdVeBBJ8XSg6yQ+289sEONeROHOQxlNShV4hOb8=;
 b=BF/Czd4CmnxhskVCr8MthEh19k+KZ4KezjeLzfYQqAjxlEesmsaSLPI0
 XX1e7xCLFsbZBlcgNrejvne3ghMZPNraJHU4ciE2i3+jq4N4/ejmpT9NN
 lYGlVA/M5VtKc2z73feaMQ5JirP/8RxJJnyg2TRRN3qAqgn9e3BJtzdOX
 hafs+WuZ8HC0bM9WDd/yPW3VePTan5P3Gw4ICjB/cIx3yjolpvvuKhjom
 Ikjs7IPg1KP10lQjZEGc0mS17bEVEkmvj8dIvlyxuLmVvR8o6yciLpYhr
 mHUrqSlQSHmNqkUjmUQ4DvvvDgSJZn/ZtkMxcWWPvH7Fzax+Xm4Mbzm+3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="10065655"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; d="scan'208";a="10065655"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 20:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="715724385"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; d="scan'208";a="715724385"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Nov 2023 20:26:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Fri, 17 Nov 2023 20:26:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Fri, 17 Nov 2023 20:26:33 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Fri, 17 Nov 2023 20:26:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kC3TxLn1D99hTT6upHcQ0jGrHqyuu0d8wHXLSJDbEff0gYO0eLSCYNy1hpkjDNOzzJr39MQmvTqqxEvuDVnzSe/uYhCpCvfpDs6gDakLi44W5eWDXhn9AlxUzdzXLBFJWpLQTsLLImAd9BQhH3IoZAKVzrA1G5VVumMMOJSQDl734NOdh1K8+2iPN//K4bU8p+n8mbORURhAneUVJijW3vbgtMsWqg68QKGZLy3kSB2U8NJwyEAOHiS8u9bSJIS/A802be0TcKOfMgW3EA9fMUljWDYkn/4TTd30dhoOrGym1a6rn73EAozXsbc1ESZsWdPxYOT2WY1MBBaFNueD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZSTnPl2A+EHzbV1wEkG8E0vYi0vPw2SGKkbpzbWJpc=;
 b=Ue/EZtGky7RIgYaBXyqUJTmks5NwDqF4mD2QtgVjqK0ozgFRw5vBUOZt1chD5QJt8ZPE2RsviL3hdgBzbIrUOSn4lrr0hqMnPMwZ+FfL+7BhH/bfo1CJSyOgxOPKKSKlP+/cB8kyTSIJaMQK8jdXgWxSgaCgt/Qc5fR7OVUu54gcq2HB+VIeHEciuQIQUDE0i/lPsYRZqRniHRHlNCYWh1XAGCyIXM5OY7NZNB6UdTWaRkyh3GMXwjJaDxWjUkAgqsZnfoP7l3blDLDyr16NXXncDb3w1xIMWv1myuhQGH9MTwwb3bfTgI9P6jXcLj/rz5TfxNxajghA365ArF37mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Sat, 18 Nov
 2023 04:26:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.021; Sat, 18 Nov 2023
 04:26:30 +0000
Date: Fri, 17 Nov 2023 22:26:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <tjo5gaqxjpzvfqsrdqlk7yphlmch6qvpcv6u3byimeawzygggp@n2lzhh7zvsg4>
References: <20231117231411.631895-1-lucas.demarchi@intel.com>
 <20231117231411.631895-2-lucas.demarchi@intel.com>
 <20231118001507.GD1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231118001507.GD1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: edd18041-55ec-4bb4-bc2d-08dbe7ee8960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XxCGi8zPoNbLg4xHNtRhvnubk9YamZnrcBSo8z37mPDZ2yVVZgvsVTvVQ9xlnmnupMg4IUoCIojpKALeEyiXHtUPAoJySSuRgg5X/RNpv+IM067fowKdDpngzDEA0F6YSFPjiPcIV8bMOFeLY5VTzY5nR/GVsnry1vx5aGkKjhSfmF7A6dhgmKNyKMVm9SN5WA9c9cPS/f5NSFcVajlZKqV79qBUgXU4Iz1oQTIGNfAQ3exAKZtRVrisaei5fQC353QGPcuvCyWx31yOXwkHaKwkgxuvSISA/t8YMrVG6bPVks79LBGNrds2Jr81aZkTVF1EJNs5dSLT+3CsUUy8yCm9CbHia5x/i380yudDio/o3tckpwIGaudTNKfVZyShfhbQATKtmKsHZDQ/h7xPxqlj1mJJ4isikUD8pOJjZJIGt4XnL2Itq8OxdYb1e5HNszhpACPS3Xfg9cHMVHUGWdweraCD+9zIJ/+vu3Mn2G/MgZJd9+T21YV7tRYBzD8fRpqOrnm53Jwe6NFamlUandrQmSR/dYeUYAukSNWgQZpVPuHQGggdnFoapXAhPq2L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(396003)(39860400002)(376002)(136003)(366004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(38100700002)(83380400001)(82960400001)(107886003)(26005)(9686003)(6506007)(6512007)(478600001)(6666004)(33716001)(6486002)(5660300002)(86362001)(41300700001)(66476007)(66946007)(66556008)(6636002)(316002)(8676002)(8936002)(4326008)(6862004)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tpO5XRfOv/kEP2lqF9MSBscM6W8ZPtUpxsp3KGRkRTR2HcZDLFqpxxEPWY1O?=
 =?us-ascii?Q?752yiTLFlSZwIFUxigaHpzapguRRVMFO6GmrxcdQVQDhqcvLNGTdgiForj81?=
 =?us-ascii?Q?RK5wvFrPcNHRubwrlm/vLoAvHy0BliynUKRGKWWfOYBcZCq+KXNIegYaq47B?=
 =?us-ascii?Q?Lt6JCsqPwBtpqNFBpb1b9Tm422CanWNEL3vRucT4UWbeye/6ordvly9DrQKd?=
 =?us-ascii?Q?4lEltIzJbl3YD+7X9M+sa7GyhM9gitJPuV1NS/ULPR6kewy7g0XNT+kw4/CQ?=
 =?us-ascii?Q?zKUKYLzzH0dc9b10vA3UYs3mqXvR7UZkhN+bSDIXMQO4j4mPLUn13PLinTga?=
 =?us-ascii?Q?ZHtW7WfYYOVZB/L3F/VY6kj08R6KufVgFz47wAyqh0F1z3c3hKZ0zq34lQcH?=
 =?us-ascii?Q?5wMRabUm5pALFwQNqTScucPmLK8ujbAQRJPC6J5WfQYu12OIdBRkivM2KwnX?=
 =?us-ascii?Q?IWRJ7P5wOq0GaeNPc8i2POLVWFjj6/GncTSRTRMPkh1dn15gM52YgUsNESFv?=
 =?us-ascii?Q?4AmpWIdDOS73f9KYXfRa8028g/xusym9nfK+RBWEVCLxikp5crbYweXSNzTR?=
 =?us-ascii?Q?rHj0qS1Lr8AxZO10a3/Qfh/ZtwQDRYlDxxKGdUsFLSWcO1S07L2CSoAoef3Q?=
 =?us-ascii?Q?TTIyAWH87/9Lqa+gpXFgeG/1Re5r0+yO+RTEC/V1Ii/HwgJKgX/LbowAiC0u?=
 =?us-ascii?Q?ZLPbdUeHAetSLzi/ZYio4EoCy6+cAeWKIJfvpGpeMm/mkP0hSE/ZiBp1kH5x?=
 =?us-ascii?Q?9kEzBRoglDbALmHLXAmDDeTn4Jnk0sV4ECMbNfF+a6UHNYxbEdzOc36UCKf+?=
 =?us-ascii?Q?QZdz8PvlimPy85WQ+BrlWz3d6t+hvr/LHhLTdUkLQQ3S49m6xtU0WdPKkCDu?=
 =?us-ascii?Q?FwDk+W9avWPsxPef/ZiW0FWt4liTOMHm4IP5begMGrfo2BhCMcHcuOmrsw/R?=
 =?us-ascii?Q?lRNL75H0NXkuHbwkHRtJDpvdKdtEYQddvJNBcIe5cBMEpTOlXHhtySSGVVV0?=
 =?us-ascii?Q?CBTqSnjuZz5TfytwA/DraloaMkNwmI2ceuIoim62qEwuKqWmVdEdu/sx8xSE?=
 =?us-ascii?Q?AHTEebk7fNlP2G63Si6+QAOHrp6GP/h3WvM3erXjVud5Fq8xtHoltJ/hslDV?=
 =?us-ascii?Q?UEV8JwH4NQ0Zy9LBbq92Zih4D6n/bq7jB4nck2kH6JYwhluD7ehXl/l1+7eN?=
 =?us-ascii?Q?Kt62ktL1MaPp8S+HYlnJT38x0drVc7IIjHL8yjrve4K3LXbMUkrFaUIMSVqZ?=
 =?us-ascii?Q?04jl3HzhKJWXGZN5pnJ34QEMT4LAU3uV2slLeCWlYJmtUz+M4+/EQwNyHhVq?=
 =?us-ascii?Q?XfYqJxRlKYRJCb0J/5JgZgvQ/1yd6OZXN8MuARzRKlB1v3M489pmzNmBSFK/?=
 =?us-ascii?Q?QJ/rJmcRCMU29OlKK6x+YwyCq7Q8S9Nlq2YN6kCRYLqDzA912HoORfrLEfth?=
 =?us-ascii?Q?jC7VUJvd78j6bgkLek8ChmoyQBsGzess0e7U6qiIKV3DMfifSmNMw9JlYgkm?=
 =?us-ascii?Q?bkM8SRMyhBeQEyap+CVKUtXd95HRFK3tm8+0hDN8L1zGmuY86pzLieeUexJH?=
 =?us-ascii?Q?kUahkCiZdWIS78T5OPL9qXx7erARdVXqPunPFZwy0Q8Mu0cCDf1YAgbDeBVu?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: edd18041-55ec-4bb4-bc2d-08dbe7ee8960
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2023 04:26:29.7855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsfwEHwsA6Zk2nEmjG0CS0OO59C5NUGmRr3J9z2t2gbv33QDIb2DN4Z65UIK9EHTPppwUczvsdlHbnfqVaMT51PNYC/24iPBSqKa2no+29A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe/kunit: Move fake pci data to
 test-priv
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
Cc: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 17, 2023 at 04:15:07PM -0800, Matt Roper wrote:
>On Fri, Nov 17, 2023 at 03:14:09PM -0800, Lucas De Marchi wrote:
>> Instead of passing as parameter to xe_pci_fake_device_init(), use
>> test->priv to pass parameters down the call stack. The main advantage is
>> that then the data is readily available on other functions by using
>> kunit_get_current_test().
>>
>> This is a preparation to fix the initialization of fake devices when
>> they were supposed to be using GMD_ID.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_pci.c      | 16 +++++++++-------
>>  drivers/gpu/drm/xe/tests/xe_pci_test.h | 17 +++++------------
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c |  4 +++-
>>  drivers/gpu/drm/xe/tests/xe_wa_test.c  |  7 ++++++-
>>  4 files changed, 23 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci.c b/drivers/gpu/drm/xe/tests/xe_pci.c
>> index a40879da2fbe..d1bc029f7a13 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci.c
>> @@ -7,6 +7,7 @@
>>
>>  #include "tests/xe_test.h"
>>
>> +#include <kunit/test-bug.h>
>>  #include <kunit/test.h>
>>  #include <kunit/visibility.h>
>>
>> @@ -106,14 +107,15 @@ void xe_call_for_each_media_ip(xe_media_fn xe_fn)
>>  }
>>  EXPORT_SYMBOL_IF_KUNIT(xe_call_for_each_media_ip);
>>
>> -int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>> -			    enum xe_subplatform subplatform)
>> +int xe_pci_fake_device_init(struct xe_device *xe)
>>  {
>> +	struct kunit *test = kunit_get_current_test();
>> +	struct xe_pci_fake_data *data = test->priv;
>>  	const struct pci_device_id *ent = pciidlist;
>>  	const struct xe_device_desc *desc;
>>  	const struct xe_subplatform_desc *subplatform_desc;
>>
>> -	if (platform == XE_TEST_PLATFORM_ANY) {
>> +	if (!data) {
>>  		desc = (const void *)ent->driver_data;
>>  		subplatform_desc = NULL;
>>  		goto done;
>> @@ -121,14 +123,14 @@ int xe_pci_fake_device_init(struct xe_device *xe, enum xe_platform platform,
>>
>>  	for (ent = pciidlist; ent->device; ent++) {
>>  		desc = (const void *)ent->driver_data;
>> -		if (desc->platform == platform)
>> +		if (desc->platform == data->platform)
>>  			break;
>>  	}
>>
>>  	if (!ent->device)
>>  		return -ENODEV;
>>
>> -	if (subplatform == XE_TEST_SUBPLATFORM_ANY) {
>> +	if (data->subplatform == XE_SUBPLATFORM_UNINITIALIZED) {
>
>Is this case possible with any of our current tests?  It doesn't look
>like it is.

humn.... I'll dig the git history later to nd out why I added it as I
don't remember.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
