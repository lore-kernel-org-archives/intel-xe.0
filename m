Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89ABC54E5B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 20:10:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F3A10E4C9;
	Tue, 14 Nov 2023 20:10:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B4010E4B6
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699992629; x=1731528629;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ANsO/oWP9OV2clqXJrTlTqkAGJetlM00OmGHTpTls+g=;
 b=cN1iRHP0BE0OFJd1YUqSwe8x6DLl6Qa/3N5zGLYn6Uepq90ezntovCMr
 +zbe0xlOhuA5ID9gZyV2D02Tf6nlla/WrrbjN7sBSz+ruXhFScMXqOqgz
 F6JWqAt7v8XBj6nAwgcAes28tCNGTe7/ZLIkzEcYehKtxxv6f/Y9pddfD
 aj02e3g3SRgBuzWdTDLaBYmiOYJldT1FMS19EVI55nyFdn3pkgVF/4qTe
 FxETei9zfnV9jrZIbnGAtLU74SekGjgKvF4k4Tswgt4qubdapdE+I5B2T
 3WohblYv9hAP+Q5DFbI2NIMnyJY4u+jRW7S8D9M0ZQ+W2IC5N+DMf8Nzj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="375775231"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="375775231"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 12:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938236518"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="938236518"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 12:10:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 12:10:28 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 12:10:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 12:10:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 12:10:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhZFe2dV6GP1ywei1wLBAHaVjRBQPmwNuZ+gTiCtv/S7/78G15IgYxdo7gqONvAglhWHVgfUZmjYw7YqlE0izS8lCACvXg77OECsSJW6zIaYF2Or0kmCouPDnh3YuF5SRpyMWbQZNYhWo2MBGEV9mzOWpRXXy+dCvXSSJt5cpiBRT1sa2SSNYT9osJ/FSHDHSh22zVWXmVqLqRx/xirKWqqN3VgNSfRk+NxR5OxWi5IvGD8R1gqz19U4AbEyMXNgcER2OF6czoew17htHJ/WSaOpEAYuRztOX8ras5ONwCZKy0RDdYmM3LoMZs7d7vfoK2MMPVhyY6tROh9xBlQTaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5sU9zB5g2o8YVgLtNnm/+Hr6btIyZINmt9es808vko=;
 b=LxbaKN4oVSUBVtyl70wzNnVJ/WRWtQrCSPv9tuK02a9w8Cm81OnxBIANk0TjVyJ6eusQNTFqPYzBtmwq3GpolIX0CUcbdJsI0L6bNorSO6o5gMmv+R28n0Owbes4x7IdJkRkCuTtnGEFrSk6ljN1SltnjnePcIO2vcnHAZ3ct0DblRBiWIcv2SqEKPEtrSvkieKcbNJWKNeAA1wUUTHqV8vjdiUhRC9yDSWXq1rxwwaYgYCF7vqDhUjP1OyPuE32MCsj7w9oGDH/UtWpBWIhoWWKXhScIFEN4CPq4f03Z4ZBEcxWuWG4Rv6CJ40ghyMnU8J73pAzoqVgzWsDH/X9zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by SA2PR11MB4986.namprd11.prod.outlook.com (2603:10b6:806:114::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.32; Tue, 14 Nov
 2023 20:10:26 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::c947:cbd4:3870:c36e%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 20:10:26 +0000
Message-ID: <c54da398-bec3-4989-b26a-e22b77a2d323@intel.com>
Date: Tue, 14 Nov 2023 12:10:23 -0800
User-Agent: Mozilla Thunderbird
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231114004604.4439-1-niranjana.vishwanathapura@intel.com>
 <20231114004604.4439-3-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20231114004604.4439-3-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::43) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|SA2PR11MB4986:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cf0d6d-085a-4be5-9352-08dbe54dbd76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQPymobdzE6p4R6Dizw8ntoaSzyeheaqY1gMwQcQKNnldk26OuYqet3KICCoUnixPuJyfDOm4+pxIYLqs83tAP6mAMQt7ZsVLlwwQm0S20zbXeB7rnFOaVAOSTL9a35LtCBVLvsOaBrz81uajhDQWy8P+0GF3muOoUqXuI2y94ndnoEAqdyftEgOJ/v/cbt1+5lINUjF39j9j2f/9ULR8XQVcRVfLMDfMZMH22QixLfYnm4e/FGe36Ppf8/ZUQdLIHk3DqM9xL7u9Qig9tl1HXceemP8vGLkNEhAICIfZVafcdxfbYe3VKItASZBsuH/96OjB2+5MJ5mgLKEqFVly0acZp/71ov/RYE9f3WInRH6TuC8ndVvhknVkNNJzkp3RTiCpXRcNGdBPxtf7LMM7cxNQQOqHgYWS9WOLXXYiTifXVhqBZ5zEq/4URC8s1uRLMFtwEcVcvTkryFkF0HXDt7/FnN33djtC+1FHcRdmcL3+kAm7QnbAdj/tIg2q8cmsGZ77xEbgzZGOHyG3m1opWuy0KyJpJal8iv/65uRwJRIcJkSFZKL4XgNbJItsj/i+LQfNAEapOwc6fMjoE+WqBhjs/sxiOtRpV+X7M4k5+a/d9D2NZ7AhNW2iAm07dpm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(31686004)(8936002)(8676002)(6512007)(2906002)(26005)(53546011)(6666004)(6506007)(83380400001)(38100700002)(41300700001)(478600001)(82960400001)(5660300002)(2616005)(6486002)(316002)(966005)(66946007)(36756003)(66556008)(66476007)(86362001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0dFMXd0bmpZMmNnYUJZS3lJUUp5ckpBTkh2a0VVSTVXOGFMRVZScWhPQXp0?=
 =?utf-8?B?ZnhHSmhyZHc0U1IvSWZpWjBBRGtWemV4UG4wd0Z3enluMjI4SDV1VFR2emd4?=
 =?utf-8?B?WU5WVzVXa3BCY3ZBWVpCVE1UOFA0YVUzcEYxTU51OG15UThzWGo1blB5UVBY?=
 =?utf-8?B?aGJ4RGlQTzMrTU1aL0IrMTVSYjhzLzA1ZG1McWVTcGtXZXNqejRvR1ZNck45?=
 =?utf-8?B?T2l5bG41dTVpZzFIajVOV1pTUVJUZHpUSzd2RE4wOHgzbzBZY0tTTXNwREZh?=
 =?utf-8?B?NXVzWEJLM09Rai9nU2pQOWllY3BQQmVSQkhDd0RuaFFiWHN1NFoxZStTejVK?=
 =?utf-8?B?My9oT2tJT1o1NlJqSFpBc21SaFlJSDFhd1g0YU1RYWlXbzN5WFdwOURvRGdJ?=
 =?utf-8?B?VnFTdzVvMGFTUHRNTmd4eFI5ekw3Nmw3Zzk5OHNjTVlGdUJhcFZoeVB5TmRu?=
 =?utf-8?B?cEJna3QxaEloc0FpZ0s0dnZtV3MveEVURzE0REJ4OUJ3eVowbFdTVHhIb3Ny?=
 =?utf-8?B?dThjTjBVUzRZdWR3eWtHRWN5eXd0Y2tCMGZGb09oZENOZER2RWFyQXY1S2V6?=
 =?utf-8?B?UnhtekdRWExCUXg0ZVZoTURLdjlvTjR2bGlzYWdxSzNOZ01IQ1k3Q3BRV2Nv?=
 =?utf-8?B?dFE4bUNJanFVY1hhdlBBWmFWZTdseWl0eUhhMHM3ckZmRXUxKzhhdElxSFFQ?=
 =?utf-8?B?VHFQYUM4ZmpMUVlCa1RVOVQ0aVdCem9tbGUwelZGME5kSXNRMWQ2RHFKT0I4?=
 =?utf-8?B?UHZ1aHZuQ1FmRC9iR0F3ODVkVTVjeWZPWVp4MUp3bVBWR0tENCtEakt4VGJ5?=
 =?utf-8?B?bEsxZHZpQ3I5OUNRNnFCaVhyYW9hMTg5QkhadkpUY3ByM0pNMmt0WTRoSHY5?=
 =?utf-8?B?Y2hCSjdDSTN1NGg3WU9MWXZXNEJxWTVyclA0UzlLUEN5T0ZwcFdYcGxCNDhV?=
 =?utf-8?B?UlpFODJqZnFHM0JTb0VIME1oMktGeVkzVU5EL2VZNFBNV0JHcVFNdjhBTUtH?=
 =?utf-8?B?K01FanRnYWhwd0h3Wm01RnZmMTdMdW1iQk4yanI5dDVqNTZtbmVNYVkxTjBB?=
 =?utf-8?B?RU1rdll4enhkVC9uNlpvb1NJQzdhc0syZDNWbUtqQXlwVUlPNjZVejRKWWxm?=
 =?utf-8?B?cDR2NVh1cFoyNWJWd1JYM1dLUVQ3N1VaeVlMQzg0ZmdaZHdXdzRCcG53UTdQ?=
 =?utf-8?B?NGFsUzdKdE15SE10Ni9TWkQ4cG5JKzBSZ2pUOW5iMU0xNHNSOHRVVzFkZ1pu?=
 =?utf-8?B?NzN5ZzNTVFdBSVc5MFdMMTN2dzM0Q2thb0lDNjFQN1BiZzFUZFJDVkswaGtF?=
 =?utf-8?B?dmZSQi9GaEJpaGUxWm1nZ2VWL1NjZzNCTEFyM0FlNEg4VzMrejRDZUFLZUFa?=
 =?utf-8?B?WlFLNUZWSzFPN0RkZ2RxWENpc1RiV1F3Q2JSSUFLUCsxcTVDMFpvc0xuRjk0?=
 =?utf-8?B?T1Q0MUdlTUlqY3VNVWJrbHYvTE5tQ2djdVBvdHFwNC9kZkpMUzNJSjlOdTNh?=
 =?utf-8?B?R1YvOXpLcngyUFVDNW9NSm56YU95UEdOK3p3TzdkR2FhWDcrVlljaU14eXFi?=
 =?utf-8?B?OTdNc2xob1Q3Q3lOT042WUwvclorM0ZkTXhTY3NCd2VpM2o1RkNsU2tFa2ds?=
 =?utf-8?B?bmxBWkRTZWovNm9wZjZadko3bHhhTUdLQ2xrMDZGdTlyUCtZVktJWXh0Y0pI?=
 =?utf-8?B?b1pXU0s2ZXdPajdsTUd4REthclZjakY4T21QWnpDT0hUUEkvQ2tQSkQyMkdW?=
 =?utf-8?B?VFBuRGxDWkFKRUtmVURaV0RvWEpmMjhGL3ZkS0VQWmVEaU1nYUgxNFFPWU5a?=
 =?utf-8?B?aFZYZTUyMmFEbCt1NisrRWUwUVVHZGM1L3U3NlZwbHhLclp5d09veDNDVGdQ?=
 =?utf-8?B?Nm5lem43MDAwYVVWWG8xMjNCSnB6VmZIVWxRZVBBYzRvOCtEamdvQ1k1QlBP?=
 =?utf-8?B?bC9nWEV4VHFkNmtOTjJDeEtnSkRreDRCUmJwUGtBbzloOU1kaDdFb0pTMTdT?=
 =?utf-8?B?NHgrZFF5Z0ZZbWdUaDZXMnNPUHdyWDM3Y2QvKzhrVXdLd0NoS1ltY0Q1RG5v?=
 =?utf-8?B?TUJXdndsQXBvL0JMNVNQQ2xyUWJSWlNyK2RRRWtCeDIyQzF0SzR0a3cxOWF2?=
 =?utf-8?Q?RzGqvVYqZl2vHT8vY/FNJpb48?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cf0d6d-085a-4be5-9352-08dbe54dbd76
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 20:10:25.8690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4vL4dNPzxPq5YmcZqFMZktaogYaJ2ZwBBFg3j60em17LAcM2hrTXwh6bXRcdhpkmnfukwif29WnzEYAcAvRBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4986
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v3 2/2] drm/xe: Avoid any races around ccs_mode
 update
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



On 11/13/2023 4:46 PM, Niranjana Vishwanathapura wrote:
> Ensure that there are no drm clients when changing CCS mode.
> Allow exec_queue creation only with enabled CCS engines.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c       | 9 +++++++++
>   drivers/gpu/drm/xe/xe_device_types.h | 9 +++++++++
>   drivers/gpu/drm/xe/xe_gt_sysfs.c     | 9 +++++++++
>   3 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1202f8007f79..27e6f0bf423e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -73,6 +73,10 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>   	mutex_init(&xef->exec_queue.lock);
>   	xa_init_flags(&xef->exec_queue.xa, XA_FLAGS_ALLOC1);
>   
> +	spin_lock(&xe->ccs_mode.lock);
> +	xe->ccs_mode.num_drm_clients++;
> +	spin_unlock(&xe->ccs_mode.lock);
> +
>   	file->driver_priv = xef;
>   	return 0;
>   }
> @@ -105,6 +109,10 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>   	xa_destroy(&xef->vm.xa);
>   	mutex_destroy(&xef->vm.lock);
>   
> +	spin_lock(&xe->ccs_mode.lock);
> +	xe->ccs_mode.num_drm_clients--;
> +	spin_unlock(&xe->ccs_mode.lock);
> +
>   	xe_drm_client_put(xef->client);
>   	kfree(xef);
>   }
> @@ -228,6 +236,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>   	xe->info.force_execlist = force_execlist;
>   
>   	spin_lock_init(&xe->irq.lock);
> +	spin_lock_init(&xe->ccs_mode.lock);
>   
>   	init_waitqueue_head(&xe->ufence_wq);
>   
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index be11cadccbd4..3382281146aa 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -297,6 +297,15 @@ struct xe_device {
>   		struct ttm_resource_manager sys_mgr;
>   	} mem;
>   
> +	/** @ccs_mode: ccs mode */
> +	struct {
> +		/** @lock: Ensure there are no clients while setting ccs_mode */
> +		spinlock_t lock;
> +
> +		/** @num_drm_clients: number of drm clients */
> +		u64 num_drm_clients;
> +	} ccs_mode;

I think future features also want to track drm_clients?
Such as EU debugger: 
https://lists.freedesktop.org/archives/intel-xe/2023-November/017903.html
Above proposes xarray (or linked list) of drm clients.

Maybe rename above to 'clients' to match the sub-structure that EU 
debugger will introduce later?   Then they don't miss this and they can 
remove the num_drm_clients in favor of testing if list is empty?

-Brian


> +
>   	/** @usm: unified memory state */
>   	struct {
>   		/** @asid: convert a ASID to VM */
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index e53221c2894f..c4779efd65b4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -48,6 +48,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   	       const char *buff, size_t count)
>   {
>   	struct xe_gt *gt = kobj_to_gt(&kdev->kobj);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	u32 num_engines, num_slices;
>   	int ret;
>   
> @@ -66,12 +67,20 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>   		return -EINVAL;
>   	}
>   
> +	spin_lock(&xe->ccs_mode.lock);
> +	if (xe->ccs_mode.num_drm_clients) {
> +		spin_unlock(&xe->ccs_mode.lock);
> +		return -EBUSY;
> +	}
> +
>   	if (gt->ccs.num_engines != num_engines) {
>   		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>   		gt->ccs.num_engines = num_engines;
>   		xe_gt_reset_async(gt);
>   	}
>   
> +	spin_unlock(&xe->ccs_mode.lock);
> +
>   	return count;
>   }
>   
