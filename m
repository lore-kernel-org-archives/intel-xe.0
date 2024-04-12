Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBED3C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F7DC10F702;
	Fri, 12 Apr 2024 15:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G6WntW9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A53E910F702
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712936373; x=1744472373;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p018USd4UAWcKkPWPwAgcmyiQN1lLEN3PjtRyGbeLNU=;
 b=G6WntW9WFMtwIiOm7w1oKYVtjV1vu46Jn+lPGdm7yMg3SX+b6uVwSyII
 kp2kb4ezJslB1yYy0CVR64tnkxVvdsrhqxVEFtfUwF63dkfFfqfMoA8IC
 +jcsj4rb1m2ucLjrW0czJc3PetlIfV1U5ySrNRbKFUEdoK1YonLqH2CJS
 6qnswxVmDxfYjRBzV8REIPcxB1w056XtsAHP3Voue5g68B2wrlSlH8vZM
 qt0EfNQPyLamDOP7F7bkmxUxRGMU1g9Yvk4bfnbzNy2wYRmD3PBODdpmG
 QL1IwAWxrCUDoOLKUA5rWSPCQI/cUl7XBJnSDrk1WQ58egIam8nx6maAy w==;
X-CSE-ConnectionGUID: OCb4oE8KSqe6LlZLMr9mgw==
X-CSE-MsgGUID: KaaH0hDxTwm/i3HrFljj6w==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19107942"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19107942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:38:59 -0700
X-CSE-ConnectionGUID: DNoIONClS4Gtw+j/wM3Qbg==
X-CSE-MsgGUID: fpvy/wT/R6K1clSEYueCWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25809938"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:38:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:38:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:38:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjZc0ek6sGk94q5CfZxu5E73eo0OKHTiFi6ASyGW0wObXEf6H0cX2ke6qqzLvvUbMtbK8anW2qnFP9Yvf6N/8+0RYH2XJhHED0X/QJ0Ex0/2hbyUbOtxb+M+hjpKVgvQoQmQJdNmTJYBG6s5+4lVbd6bgoC3LMKxzv9RMA27abEOodU7dVUU1oCfIRs0RRI7fc5d4fCnlBctnWjdLzLyx+1s37F6oKJWf/IUUJ7/1Tw8NSbsXCeP816qX2LwbiucgtbdQL2BiLZIhljuUoA9MyLn8Se02g38/o2X2ZnrsWlP2qWyrZXRARHmEVa61m/hFcTAAiUsszvK2+zGkcSeKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whUYReXr4UJCBhBJIlLLxRL9ZNfSsdG2ZtohzavMXL4=;
 b=H1PRAQ1MTy8F3N8LfNHhK7i85q9tsRaqS2PQpmjQQzXTFj8cNmGsOf9vAQrbKNa0BXesjm+nScDEadC6pksNsCWTVr8qoRxdrBayM2zxdoUxtdifhQxJmASc0E6Ox1/kMpWFwc8+oK6BbGhhAOHRDxXpiOjNTODg7BiK16pQjso5xeF9JtsPgEYZTyEWH2wOKCeTaUzBfJgcvEgOOKBrKeKJjJghkhXn/DJR5qyM/T5diWIe5hqxI6wX+lm6Fbr7B4n7kEMwrl936mYWX1bXU7vgOFWuQHhJngwsiaFt32X9mzGRs9fvTagnJKucFKh7/Z1m+ljczSksXyuvSIvOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 15:38:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 15:38:56 +0000
Message-ID: <65eec198-9c26-47b3-b917-e6a1dc11855e@intel.com>
Date: Fri, 12 Apr 2024 21:08:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/xe/gt: Abort driver load for sysfs creation
 failure
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-6-himal.prasad.ghimiray@intel.com>
 <44mscm2sqcsqruroglajhv3xc4yo4xevsta6o3kcz6hogm4mfv@cewqpbneksds>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <44mscm2sqcsqruroglajhv3xc4yo4xevsta6o3kcz6hogm4mfv@cewqpbneksds>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: a060ac91-9bed-4ff2-bd60-08dc5b06a9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NO9YEI2chPSaP4Xa8cUJWPnL2ofuskS9BXC0JtqxIcrAvs1GZgKcvLilc+0CenB+R3abkn36RMhGex1MKCpEfFp525ldNv3j212Iea5ZNK/QJWa+c18AcHh2KPfnboAoHr6U2AIVd57tU/xqWQ4p4ccsdfHnZtbjwHdSyJYMkkK62+yvie/+Avf5kp/2ghN7QBuZsrQv5v7sLsCh6XxXKIhH7Muom9LSnjQsHwDIf68LXUHzK7lC/tHfwYRnYYMfO6Bx3czB7wgWMvI/MZxq1qYXvgoKpws/gRDCZioYVnuD+rf6QJrJvUI0gfOasjeRbHAhA4qAk8/43xuZ+trxx8zUJu3OdhQnoINgQdYzXapJSG1pOS00yQSxTgrFd9Xj4yaTDluuy0hyGcwqfGbdRhPn1aeL6EwP2lNYRwhAbM2KivbsRj3nH10wuKv/SWrzTHdZ1Il8zf+WasxyncZXB0kYYmZ1rqlpNx0y8Ecv7jme/K84ezMnYd30loZVM2f9N2ElDkKkFKfFMO8GjTGK9urVKgTMpRAqUlVnVeZnPHbPBI366qlMwNT+ijsjGamc0PNkDCJ41VvExDn2EWKoXcjj5KyBpXQBtO2g8NXx+7FaSRZGmQ2CY7nunafbtyeENkDNn+c8awohhAzyJWx7ETG0AcwaskNaV+nxgp1yK4k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JkS29IeHJ1UWJpU2RhRHJ4bTNjK1VyVEYvWXBmeW9TK0NCVitKSGZNQWEv?=
 =?utf-8?B?Nk9iMjNiMHJ3ZmhuY3FEcXhLQnJGMEZ4RkFjREJ1OW9VUnhpWUptRVUvYjRk?=
 =?utf-8?B?MEFxaWt5WmQrNDF4MTVlUEE4d2ZxUFA4OEZUNW9HTU9ZZzZoQlhEb2N2WFZQ?=
 =?utf-8?B?cTREdGczcXFRV3dvaHdaWVhNSE1UUWV5UlpobzNSWHJuRjcrNE9NU3VmN0lu?=
 =?utf-8?B?dm5qdXVxdVdqd2lTbmpyWjdrZGlmZ2oxY2ljL1pFWkJnejJXaDlDbDFKdlYw?=
 =?utf-8?B?cWx5MUhkMHV2dlYwQWpDQlVuWStEdjRZT08xVUlKMnNPR2p5ck5xTzdFcUph?=
 =?utf-8?B?bEhLNU50b1pYcTlGYzNCOUJ1YlZoNUJBanVpM3hPL3Z4M0t2Yk01NUNMRnp3?=
 =?utf-8?B?c3lpYzZkZXFrblh1RWlxdTFHYU9IcnJUM1dUemVqMmJsQzgzYkZXeW9EYjYx?=
 =?utf-8?B?MkUvN2pWdlFOWmVuOW9YQ2RMV1pQU29vUUVLNE1KejNzMWduNG01NmRGM1FT?=
 =?utf-8?B?c2ZUN1hEajZMdXEwSHZ0MmJZV3RPby9UaTJ1LzB0cGlPZXkxZ25DVyszVkFN?=
 =?utf-8?B?WnVPRlBQeTZmYitDVktCNTR1VkdLYS9QNEZXT05KWUVhMmpYekkrdFVuUEo4?=
 =?utf-8?B?b0dlZGI3aTZFSDR0SDc3RFRpNk5qODZTc3lvU2lia2o2eTZveXZmMTN5R3dx?=
 =?utf-8?B?eGZzdDNLUFg2Ri9yaGk0Qmh6bmxrTmNTcUlITGdLbGVMQmFabktRVWQvVG43?=
 =?utf-8?B?VmY4enZ0L0hZVkZSTHJlei9vV3JDYktHQnpTaldXU2hJWFR4cWgzalF6N0JP?=
 =?utf-8?B?MTFFdlFqc2tCSjNwK2l2Q05oaEt5YXdyMTJMdFoyYVZxTzI0aVJ0Mm9kNi9W?=
 =?utf-8?B?R0UyWGtzT256Z0MybDFFNzRFaGErMkVHYUJ4Q3RNcCsza1kxbjB1UjFCMW9z?=
 =?utf-8?B?WktwNVhCVGhPdElBbEp1S2lQY3MwQVZiWWt6K1FaNVN2TlRvanQzcmk0dnhG?=
 =?utf-8?B?U0hJVFB5YkRUVURaRUIwVXhud3c3UERCbGs1M3dYd2tpeFhON25QTnJDdk9k?=
 =?utf-8?B?VHh4SXNjNDgwd21TaCthNzdPUXNDTnBBckdscnJicnhiTUowbXZLYVVVMXBr?=
 =?utf-8?B?U1k3Vjg1cm1tQ0NuTzQ3aUlrTFo2VEdkaStPQ1FPM2tBeFNnTVJ5bmNoMlN0?=
 =?utf-8?B?WHRWR2dabXJ6eFo3TzVqNDZvbThyd05DZUltWVFpbHFkS3MzN3Y5eDJieGNL?=
 =?utf-8?B?WW5mbHgyTmVZcWtpdVdEUlRJZ28zTFRQWjdQVkFlUnAzZHJNMnA2Qm44ZFNr?=
 =?utf-8?B?azJkMGk1WitEUmF2NHBTRy9HQjZadDNVUDk1U0NaZVZ2T3paeDFNSmRtdzRY?=
 =?utf-8?B?a3hqalRsbWhyUEI5eGVJS0NScFVsR0xpRTl2OG9HRG4xK1NLOTV0aGxMMGgy?=
 =?utf-8?B?WUJvVGNtOXVxSGYwV2JLMmJwZmNuZWZDZmUvTDVJdndDdWxPWlFhUDFZekNV?=
 =?utf-8?B?ZTZvbmF2WTBPM3Nreks2S1ZhTFd6QkM2UnFVenhpRUtDNDZaenVCK1ZuT3R4?=
 =?utf-8?B?cTluVTRmTFRvamRKcXlkOExZaElZa280VnZTZWFicGswekpUWVFhdmROT0lS?=
 =?utf-8?B?MUR4ZDM5ZmV0UVdPb3g0RFpIN0R3VmdsOWxmMXl2UzlhWmdmeVpRSFZTcDh0?=
 =?utf-8?B?N20rUWU3OE8xR0VldDlvYnpOZ0gxUlE3azVYb0FSektKRjJjN2Q5V0svV2Nx?=
 =?utf-8?B?YnJaaVp6YlpqeU4zaXh4WE9ENUtoUDlVMlRWc0QxOE4zbnVwMGlKbytqc2ZD?=
 =?utf-8?B?SU5sKzVqc0F6QzRCNmpyU3VvYUVZTER5YUZWZ1ZzT3NDbFIyU1pGVFgrOWdC?=
 =?utf-8?B?MmcvMjlVS3FkZTNodUcwbnB2QlZnNm1XTFRaMDRkN2c0Q2Q5S01LeW8xYjl1?=
 =?utf-8?B?WWJBUTBMNi81QUpVeEVPdFFWNWdtNDV4ZytEdlhDS1RUTGNIZ25xRUJ0RmxE?=
 =?utf-8?B?c1FTV0cybmlHYy9WR1NwOTBEMFMrTjZmV2w5bmJWUjgyNWVTVDArTEtDbHNR?=
 =?utf-8?B?OTFNbkRSM2JQWXZjS2thWjljVzA1cWg2Z2pZdnlFTThQOGY2Y3dpa2RSRUxK?=
 =?utf-8?B?d2V3cTJVaXljckdlbzB0MVhMWDRXRHNUN2ZFODFrYUoyMVJIM0ZLdHdNWlZv?=
 =?utf-8?B?ZXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a060ac91-9bed-4ff2-bd60-08dc5b06a9f3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:38:56.2089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y7b7lNBthRBYEGL7wZFO782/GGd+DmKPEiCNBTuFsK1r/1cakv/4ZZUx5Cx7mU+AukU3+YkDsrRwA1unVIvnocwFRsxZxAHX3hbh3C7Xo5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 12-04-2024 19:00, Lucas De Marchi wrote:
> On Fri, Apr 12, 2024 at 01:32:43PM +0530, Himal Prasad Ghimiray wrote:
>> Instead of allowing the driver to load with incomplete sysfs entries in
>> case of sysfs creation failure, we should terminate the driver loading.
>> This change ensures that the status of all gt associated sysfs entries
>> creation is relayed to xe_gt_init, leading to a driver load abort if any
>> sysfs creation failures occur.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt.c                    | 16 ++++++----
>> drivers/gpu/drm/xe/xe_gt_freq.c               | 29 ++++++++++---------
>> drivers/gpu/drm/xe/xe_gt_freq.h               |  2 +-
>> drivers/gpu/drm/xe/xe_gt_idle.c               | 17 ++++-------
>> drivers/gpu/drm/xe/xe_gt_idle.h               |  2 +-
>> drivers/gpu/drm/xe/xe_gt_sysfs.c              | 15 ++++------
>> drivers/gpu/drm/xe/xe_gt_sysfs.h              |  2 +-
>> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 11 +++----
>> drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  2 +-
>> drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  6 ++--
>> 10 files changed, 47 insertions(+), 55 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index dca0e9fb3315..089e4513c7e3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -360,7 +360,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>             xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>>     }
>>
>> -    xe_gt_idle_sysfs_init(&gt->gtidle);
>> +    err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> +    if (err)
>> +        goto err_gt_sysfs_create;
>
> see comment on previous patch about just re-using the current label.
>
>>
>>     /* Enable per hw engine IRQs */
>>     xe_irq_enable_hwe(gt);
>> @@ -374,9 +376,7 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>
>>     err = xe_hw_engine_class_sysfs_init(gt);
>>     if (err)
>> -        drm_warn(&gt_to_xe(gt)->drm,
>> -             "failed to register engines sysfs directory, err: %d\n",
>> -             err);
>> +        goto err_gt_sysfs_create;
>>
>>     /* Initialize CCS mode sysfs after early initialization of HW 
>> engines */
>>     err = xe_gt_ccs_mode_sysfs_init(gt);
>> @@ -549,13 +549,17 @@ int xe_gt_init(struct xe_gt *gt)
>>
>>     xe_mocs_init_early(gt);
>>
>> -    xe_gt_sysfs_init(gt);
>> +    err = xe_gt_sysfs_init(gt);
>> +    if (err)
>> +        return err;
>>
>>     err = gt_fw_domain_init(gt);
>>     if (err)
>>         return err;
>>
>> -    xe_gt_freq_init(gt);
>> +    err = xe_gt_freq_init(gt);
>> +    if (err)
>> +        return err;
>>
>>     xe_force_wake_init_engines(gt, gt_to_fw(gt));
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c 
>> b/drivers/gpu/drm/xe/xe_gt_freq.c
>> index 32b9a743629c..a0c57332d362 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
>> @@ -222,33 +222,34 @@ static void freq_fini(struct drm_device *drm, 
>> void *arg)
>>  * @gt: Xe GT object
>>  *
>>  * It needs to be initialized after GT Sysfs and GuC PC components 
>> are ready.
>> + *
>> + * Returns: Returns error value for failure and 0 for success.
>>  */
>> -void xe_gt_freq_init(struct xe_gt *gt)
>> +int xe_gt_freq_init(struct xe_gt *gt)
>> {
>>     struct xe_device *xe = gt_to_xe(gt);
>>     int err;
>>
>>     if (xe->info.skip_guc_pc)
>> -        return;
>> +        return 0;
>>
>>     gt->freq = kobject_create_and_add("freq0", gt->sysfs);
>>     if (!gt->freq) {
>> -        drm_warn(&xe->drm, "failed to add freq0 directory to %s\n",
>> -             kobject_name(gt->sysfs));
>> -        return;
>> +        drm_err(&xe->drm, "failed to add freq0 directory to %s\n",
>> +            kobject_name(gt->sysfs));
>
> lib/kobject.c:kobject_create_and_add()
>
>         retval = kobject_add(kobj, parent, "%s", 
> name);                              if (retval) {                 
> pr_warn("%s: kobject_add error: %d\n", __func__, retval);
> and the other case return without log message is about memory allocation
> fail. It's kernel policy not to log on that. So just remove the message
> here rather than s/warn/err/.
>
>> +        return -ENOMEM;
>>     }
>>
>>     err = drmm_add_action_or_reset(&xe->drm, freq_fini, gt->freq);
>> -    if (err) {
>> -        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> -             __func__, err);
>> -        return;
>> -    }
>> +    if (err)
>> +        return err;
>>
>>     err = sysfs_create_files(gt->freq, freq_attrs);
>> -    if (err)
>> -        drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: 
>> %d\n",
>> -             kobject_name(gt->freq), err);
>> +    if (err) {
>> +        drm_err(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
>> +            kobject_name(gt->freq), err);
>> +        return err;
>
> same as above:
>
> fs/sysfs/file.c:sysfs_create_file_ns()
>
>         if (WARN_ON(!kobj || !kobj->sd || !attr))
>                 return -EINVAL;
>
>> +    }
>>
>> -    xe_gt_throttle_sysfs_init(gt);
>> +    return xe_gt_throttle_sysfs_init(gt);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.h 
>> b/drivers/gpu/drm/xe/xe_gt_freq.h
>> index f3fe3c90491a..b7fddbe7b9b6 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_freq.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_freq.h
>> @@ -8,6 +8,6 @@
>>
>> struct xe_gt;
>>
>> -void xe_gt_freq_init(struct xe_gt *gt);
>> +int xe_gt_freq_init(struct xe_gt *gt);
>>
>> #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index bc1426f8d731..581c8ce75858 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -152,7 +152,7 @@ static void gt_idle_sysfs_fini(struct drm_device 
>> *drm, void *arg)
>>     kobject_put(kobj);
>> }
>>
>> -void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> {
>>     struct xe_gt *gt = gtidle_to_gt(gtidle);
>>     struct xe_device *xe = gt_to_xe(gt);
>> @@ -160,10 +160,8 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle 
>> *gtidle)
>>     int err;
>>
>>     kobj = kobject_create_and_add("gtidle", gt->sysfs);
>> -    if (!kobj) {
>> -        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> -        return;
>> -    }
>> +    if (!kobj)
>> +        return -ENOMEM;
>>
>>     if (xe_gt_is_media_type(gt)) {
>>         snprintf(gtidle->name, sizeof(gtidle->name), "gt%d-mc", 
>> gt->info.id);
>> @@ -180,14 +178,11 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle 
>> *gtidle)
>>     err = sysfs_create_files(kobj, gt_idle_attrs);
>>     if (err) {
>>         kobject_put(kobj);
>> -        drm_warn(&xe->drm, "failed to register gtidle sysfs, err: 
>> %d\n", err);
>> -        return;
>> +        drm_err(&xe->drm, "failed to register gtidle sysfs, err: 
>> %d\n", err);
>
> ditto
>
>> +        return err;
>>     }
>>
>> -    err = drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> -    if (err)
>> -        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> -             __func__, err);
>> +    return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, 
>> kobj);
>> }
>>
>> void xe_gt_idle_enable_c6(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 69280fd16b03..75bd99659b1b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -10,7 +10,7 @@
>>
>> struct xe_gt;
>>
>> -void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>> +int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>> void xe_gt_idle_enable_c6(struct xe_gt *gt);
>> void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> index c69d2e8a0fe1..21ed87715da7 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
>> @@ -29,7 +29,7 @@ static void gt_sysfs_fini(struct drm_device *drm, 
>> void *arg)
>>     kobject_put(gt->sysfs);
>> }
>>
>> -void xe_gt_sysfs_init(struct xe_gt *gt)
>> +int xe_gt_sysfs_init(struct xe_gt *gt)
>> {
>>     struct xe_tile *tile = gt_to_tile(gt);
>>     struct xe_device *xe = gt_to_xe(gt);
>> @@ -38,24 +38,19 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>>
>>     kg = kzalloc(sizeof(*kg), GFP_KERNEL);
>>     if (!kg)
>> -        return;
>> +        return -ENOMEM;
>>
>>     kobject_init(&kg->base, &xe_gt_sysfs_kobj_type);
>>     kg->gt = gt;
>>
>>     err = kobject_add(&kg->base, tile->sysfs, "gt%d", gt->info.id);
>>     if (err) {
>> -        drm_warn(&xe->drm, "failed to add GT sysfs directory, err: 
>> %d\n", err);
>> +        drm_err(&xe->drm, "failed to add GT sysfs directory, err: 
>> %d\n", err);
>
> looking at lib/kobject.c, we can apply the same reasoning as above.
> We even dump the stack in this one.
>
>>         kobject_put(&kg->base);
>> -        return;
>> +        return err;
>>     }
>>
>>     gt->sysfs = &kg->base;
>>
>> -    err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>> -    if (err) {
>> -        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> -             __func__, err);
>> -        return;
>> -    }
>> +    return drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> index e3ec278ca0be..ecbfcc5c7d42 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
>> @@ -8,7 +8,7 @@
>>
>> #include "xe_gt_sysfs_types.h"
>>
>> -void xe_gt_sysfs_init(struct xe_gt *gt);
>> +int xe_gt_sysfs_init(struct xe_gt *gt);
>>
>> static inline struct xe_gt *
>> kobj_to_gt(struct kobject *kobj)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> index 9c33045ff1ef..93d08d682dd8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>> @@ -236,19 +236,16 @@ static void gt_throttle_sysfs_fini(struct 
>> drm_device *drm, void *arg)
>>     sysfs_remove_group(gt->freq, &throttle_group_attrs);
>> }
>>
>> -void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> +int xe_gt_throttle_sysfs_init(struct xe_gt *gt)
>> {
>>     struct xe_device *xe = gt_to_xe(gt);
>>     int err;
>>
>>     err = sysfs_create_group(gt->freq, &throttle_group_attrs);
>>     if (err) {
>> -        drm_warn(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>> -        return;
>> +        drm_err(&xe->drm, "failed to register throttle sysfs, err: 
>> %d\n", err);
>
> ditto
Noted. Will fix in next version
>
> Lucas De Marchi
>
>> +        return err;
>>     }
>>
>> -    err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, 
>> gt);
>> -    if (err)
>> -        drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, 
>> err: %d\n",
>> -             __func__, err);
>> +    return drmm_add_action_or_reset(&xe->drm, 
>> gt_throttle_sysfs_fini, gt);
>> }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h 
>> b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> index 3ecfd4beffe1..6c61e6f228a8 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>> @@ -10,7 +10,7 @@
>>
>> struct xe_gt;
>>
>> -void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>> +int xe_gt_throttle_sysfs_init(struct xe_gt *gt);
>>
>> #endif /* _XE_GT_THROTTLE_SYSFS_H_ */
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c 
>> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> index daab970f8be8..62ce4fd1775d 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
>> @@ -691,9 +691,9 @@ int xe_hw_engine_class_sysfs_init(struct xe_gt *gt)
>>         keclass->eclass = hwe->eclass;
>>         err = xe_add_hw_engine_class_defaults(xe, &keclass->base);
>>         if (err) {
>> -            drm_warn(&xe->drm,
>> -                 "Add .defaults to engines failed!, err: %d\n",
>> -                 err);
>> +            drm_err(&xe->drm,
>> +                "Add .defaults to engines failed!, err: %d\n",
>> +                err);
>>             goto err_object;
>>         }
>>
>> -- 
>> 2.25.1
>>
