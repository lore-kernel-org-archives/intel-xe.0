Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F02C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 00:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6497010E065;
	Thu,  9 Nov 2023 00:36:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B31910E065
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 00:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699490211; x=1731026211;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nSs3QskuHBOXPmnAqenLjCg85gjg+HbQ2g7oj5KIRSg=;
 b=bHCjjGxVmcbBFGBtLbd7q5PfLZgt1pu4tRQZHe3R+3fsKhElNMR6I2h+
 rdNNU1m5ur9sDM8a91sOF/A7mPsIiEcNXcXkH9aI9JZhyarN+01bQIGaI
 WecaPbvIryJubF39Fdq6f5b1nuyC+T9f/UwNElU2miCpVW/cEfCykCVeP
 R2pJmVvHoQ9i+YUqWNqqtuFrNmuOtBTZPrVfFgX5vDzp6exyBMJM0d982
 YWvPU/XnsbtdYhtyosLaiTWSCp7oxeLcd6ImTuWR+Pk5gAiv4LfPYtmUo
 5jMdPDRVVO32DfjhCknVVrlRdTKpj0qw5CDZZOIno422BN7tp4etYSqrw g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="389694860"
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; d="scan'208";a="389694860"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 16:36:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,287,1694761200"; 
   d="scan'208";a="4560041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 16:36:51 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 16:36:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 16:36:50 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 16:36:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f520d6eSvyUwKOFFuSaFWivy9ODDhBlnl5dFEj9TStZEZ5ZkL74Z/vZkjpo9EGjpq8f53Tv0HPGNLLOegO9t8c+Kf9FSXzfalFbXhDvNQr/ndVkZAV5oFHLyBBR6WSnmTsVff/5oppdlFoGkTjIRYUdAqXaphofCWMnCQTqvdDzTq5YtJM8qV2vxCWfDD32FBq21ShEW0ZTcuhAze3IKT/RaOXbaRh9r1efFQZ49qvfY6vKBv9fyfB4oVTDiyZEnnlqdxeu0175XQx7dsQUq2D6aMjBeP+rDKkmAfse4qDXWm9ExyTwz3nydr5uquVrbzzS24a7+p0mtZrd96FgQWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s76r8A8miIRGS9+ABRuYvr9zbGlhvB4cSp3Ar2SpmD4=;
 b=jC+2qxmt63UjcET2gmRSJNw4eUYw8wHtnebsFy3fp+AohdISaMZ/gZXw9YJFJWzNRAjWGJCUD3WDvVxWiHqVheeP2q1G/q5zUpWSkEnJ8psGSUVq/N2S7mr+bAgumsr4ADqKn966OV+wo2O5DyZXzNCofsKmgWPllId9JSWPeFFEGI1JgXEnkFEt+Qu1jmG7zn4VZqUJ8mahEwxl4VQ4fJPwfIdIdKQCIT+WQJZX0/NS7xMuYzWzdfpC0DInLJyW7K2YsMpwMtmzHYh6Y2sPMik1c//A3oQT/mLjuCW6pKh27VYAZYmIsWGo8L/C6Ad47RZmxpkEXc4Gfhy5+EIW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 00:36:47 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%6]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 00:36:46 +0000
Message-ID: <409505f4-0dac-4947-b70a-e579dda79ff3@intel.com>
Date: Wed, 8 Nov 2023 16:36:44 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20231020232553.3665409-1-vinay.belgaumkar@intel.com>
 <ZUU90ZrNCBIMb/3s@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <ZUU90ZrNCBIMb/3s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0335.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::10) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: b2394262-afad-4050-c202-08dbe0bbf431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jLHt5KRa2HryaECrIyXHuERLU3vVXsaTuODqc6X1k6yYq4oih66q78ovvZCv4wRD1lgGzigIq63Bs9EA6EyQY4LSyed+gaoci84TL/Q1hdfeMyUo0cgNBsWx9NBmZLitkPdLes4H5zcZwxvfdNU7t+th/t6nrkDx2dS+02liC/lajQ8XT/NiXn3h8j9FcJYbMthPudHdCpfjsk4xNjHAe3bA+xYZqA4iffvWLYBUunRun0zLeTT2AyNUgamoe0hLawziQRNkuVzIY0jxK7P42unChAIw7sKeYziZfldRWdY1uhO/bRtsTuoXaxqR7/wYgEhyAZdf0iX+y2Ijix43yTHw1iBUIpPzaI6L4CeT9ovT31eVh7PoqNKMDj5f81oOAYuF/dQslOrVodzS1U2ApEC7g5WtT6b7gQpyLzjXNSxSs7lpBBVsbReD1F3s4iCfO/gN9Tqs1mjqrg8O2xLXEvvFHFIfuH55B7EDSKBefewjPuMOOVtvh9vm/Ot6teo0ATbuB0Vdqf95ZTxvQu/4M1SAWM41DkDl4rFhdE0UkanE+Y79BpDliAII6i2AUKu/KoMm4zmKyAcgYzUzhUoYKQY4uF+dzwB8Fqvkq+Ab4ymMwDfwarTlx01aZhku33s3i32uBHUXP/dueYc0kkpIIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(366004)(136003)(39860400002)(346002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(53546011)(83380400001)(6512007)(26005)(82960400001)(2616005)(6506007)(8676002)(66556008)(66476007)(478600001)(6636002)(37006003)(316002)(66946007)(6862004)(4326008)(38100700002)(36756003)(8936002)(2906002)(41300700001)(86362001)(5660300002)(31686004)(31696002)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2xpVXhBVjhiTWQ2OFlST0lTQW9OdWFKdEM1ZjlMODRWMjJWZjJSVHdRZ3NP?=
 =?utf-8?B?bmdDb3loYnlWa1d2QVRGVlRYK3cwYjRCeW8wZmtHL0pOQmRMbWs0MzhDNUh5?=
 =?utf-8?B?aFp5YXR3czczcXh3WU1qM3ZsaHhFSnJLLytFRVBMM0xpUFZJaHNNSEVnaVli?=
 =?utf-8?B?R01wSGJEOWNGamx2Uy9vbDBjWkk1NzFRY09VQzB5Mk03ZmlNK0lCNFR3Yk1K?=
 =?utf-8?B?OVcwanR3UG9TajdGUnlGbUphZ3VGT2IwczgvZnJsSFl3NGM1K0xKdVlDMjBI?=
 =?utf-8?B?QitKYS9uQUhhbDMzb2NWTWYxZGlOWWVaUVZyc2c3bEZFY3liZWUvT3UrRE1K?=
 =?utf-8?B?anl4amtXRzVEeFBkRXRWZU9XMm5YY2kzbE44dzNYaDhYSUIvdnpwRWcwcjc2?=
 =?utf-8?B?OWJIbnVsYldqWEFFOGdpN05iMlRQMEtwM2YwUXdzekdMd3lNT2JVMUlVeXhM?=
 =?utf-8?B?UVdvbjd1Q0owQjc3UlhvcmJKM1NWbUVHczJhVWRmalkzRzJHbStvazNoWGdP?=
 =?utf-8?B?MVRSUzNRdThvbGlCekZFZlJvTGxaV3NHbnZVL1huNkRhcjFwOXYxb040RWlv?=
 =?utf-8?B?RlJla0x1RjU2Z045WjI1SFBvam1ORUpIaGhxOFhxVkxDNmFiV0FCOWlhbFdM?=
 =?utf-8?B?QnFudUFpRzVhOWNxMm5QcmlKS285NnpYbUVlK2RqZDNoTzhkb3JzS2lGdnBk?=
 =?utf-8?B?S2k2T3gyRk1zZUpSZndaUG9TTkRpaHM2TkJ1WFlsMlRDeFBIMG1pUzFxNHN2?=
 =?utf-8?B?QU1LZ2FkU1VkMFdhcTBTa0dsR3hNQnlRRGNwZHlhU3N5cFEwTUpiMEZiNld0?=
 =?utf-8?B?ZUlXeHJXMjMwcDduME9NOU10Q01oVlRDSVhuRThqdklHT2g3cEY0WlBwTGJN?=
 =?utf-8?B?ZGdtR0hpVG01dHVkWTB2cVZkQmhQTXZSalQ0OW9ENU0wc0loMnpHbDltY0Ft?=
 =?utf-8?B?azF1S0FzVHMvQThKSWxqUGVvNk1LeUllQ3VNM2hBNHVLeTBmbGFPeWx2NEtp?=
 =?utf-8?B?UmhGREJWSVFJU3pJdTdyQUI5c1VJRTJGNFI3MmNMSUk2TGdPa3Q4MFJCbWpr?=
 =?utf-8?B?cTZuNEE5VmNMcFFZRkQ5Y2RiL3g0MjFIWlg2aVc5YXNtdlhydjBDTjNXdi9u?=
 =?utf-8?B?ajRKN3hPUUZ6aVJ0bityeDE3Ykl1ZytEdjI3cFJlUnNURGZXRWRjd05OUHl3?=
 =?utf-8?B?NXIvcWkwajNXWDVqeXJzZ1UxbVA4U2pYQnIycHh4Z1hTSDE1MGJQR25INjM0?=
 =?utf-8?B?Nm5sWDR2U0ZPMlR4Ui90ZmUrdStkakI1K1JrbC9TZUpyMTlrejhvYVUySis1?=
 =?utf-8?B?M3hYSUtqM3NZNmdSOXkwV0I4SGVIemNkdFhDdVBSTzZKNmxZdGljcG81M21L?=
 =?utf-8?B?eSs3SUdpZk9yL0tMMURNckNxNXd2dDdkanl2UzZNMUNqYk5JVE1rMHl0WUs0?=
 =?utf-8?B?ZTlmeFQzM3J5Z0NuSXpkMytjdmwyZVMwOHlVODlXTkJTTEVQVzJBb2dVb2lX?=
 =?utf-8?B?SGJEaEplUUM3MkNzSTFXWnFaclB5QXhnZlpremFjNEZ6MlFNejFqa0hKZjVl?=
 =?utf-8?B?MmJvRy9uYlNPR2dTWGpaNjJHcmZZNHE3dGJybzVYd0VGb1JndmRQUWtxU0tF?=
 =?utf-8?B?eDNLRWl5MTB4OTBUVzhncWt6QkdlVWhxY1FPSEJYNy9HSVFIMkg0SndlSGlu?=
 =?utf-8?B?Ymhmc2ZuQXpsNk5MTXRVNnJ2a0lHQmE0WDBRTWlDbHhYOEpENU5DdThIZUFL?=
 =?utf-8?B?anFWZHk5dDBTcmpYZU1xY1FoVnZvUkhvT2ZqSUptdGIvbE9pK0RLS0hGT1lZ?=
 =?utf-8?B?bnlMc0xsc3VLMFE1UHZvY2Q4SG1jN3Q3N3RNMkxwYXdYVTFtYzcyS2RWMlpG?=
 =?utf-8?B?TlNVL0Z0alYxRnJ3cHdUYThvTnR1SEtWcXJrdC84L2JlanJsRFlITEN0QytQ?=
 =?utf-8?B?eDgyZmdjakFrT1drcnN5aFFmTExETS94ak1uNHM0K0Q3dWxxdnFTQlF5VUpQ?=
 =?utf-8?B?ei9zeTNTN2xyY0JwbnhMQTJ4RjBMSHlGYW1VOURBc3BVYWRvcy9UeDBDTjZJ?=
 =?utf-8?B?bjhUM2g0aFU5aWVDQjFTWUc3dDdsUXJ6NW1GcjhOUnVKeURqaU4wWHhNODVV?=
 =?utf-8?B?ZDJPL1lmR0gyeGFZaEtxeUNKOUZvcGVBY25OeWpaOURVMnJTQ2xBK1N0QVBJ?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2394262-afad-4050-c202-08dbe0bbf431
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 00:36:46.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTcXP5pKZ7BzW1e976n0pGNNXW18HETuUueEtAmKTG7KIHVEDW9CEn8VSKGoHP3F8b/m/AQ3Vdjunwc6/GXuEL6kdD0nV1JCeo0o/qtfBSI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Raise GT frequency before GuC load
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


On 11/3/2023 11:37 AM, Rodrigo Vivi wrote:
> On Fri, Oct 20, 2023 at 04:25:53PM -0700, Vinay Belgaumkar wrote:
>> Starting GT freq is usually RPn. Raising freq to RP0 will
>> help speed up GuC load times. As an example, this data was
>> collected on DG2-
>>
>> GuC Load time @RPn ~ 41 ms
>> GuC Load time @RP0 ~ 11 ms
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++
>>   drivers/gpu/drm/xe/xe_guc.c          |  3 ++
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 44 ++++++++++++++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>>   4 files changed, 53 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cd1821d96a5d..0e6fe2ee4a2c 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -244,6 +244,13 @@
>>   
>>   #define RPNSWREQ				XE_REG(0xa008)
>>   #define   REQ_RATIO_MASK			REG_GENMASK(31, 23)
>> +#define   SW_REQ_UNSLICE_RATIO_SHIFT		23
> please avoid shift and use the REG_FIELD_PREP and REG_FIELD_GET
ok.
>
>> +#define   IGNORE_SLICE_RATIO			(0 << 0)
> x | 0 = x
> so, please avoid it.
Sure.
>
>> +
>> +#define RP_CONTROL				XE_REG(0xa024)
>> +#define   RPSWCTL_SHIFT			9
> same here
>
>> +#define   RPSWCTL_ENABLE			(0x2 << RPSWCTL_SHIFT)
>> +#define   RPSWCTL_DISABLE			(0x0 << RPSWCTL_SHIFT)
> Please use REG_GENMASK and REG_FIELD_PREP
>
> something like
>
> #define   RPSWCTL_MASK		REG_GENMASK(something, 9)
> #define   RPSWCTL_ENABLE	REG_FIELD_PREP(RPSWCTL_MASK, 2)
> #define   RPSWCTL_DISABLE	REG_FIELD_PREP(RPSWCTL_MASK, 0)
ok.
>
>>   #define RC_CONTROL				XE_REG(0xa090)
>>   #define RC_STATE				XE_REG(0xa094)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 84f0b5488783..5af97982564a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -447,6 +447,9 @@ static int __xe_guc_upload(struct xe_guc *guc)
>>   {
>>   	int ret;
>>   
>> +	/* Raise GT freq to speed up GuC load */
>> +	xe_guc_pc_request_rp0(&guc->pc);
>> +
> I have a strange feeling with this. Semantically...
>
> guc_load asking guc_pc to do something...
>
> we will need to have a xe_freq component that is detached from
> the xe_guc_pc and then xe_freq exposes the sysfs and functions
> like this and then it requests to guc_pc when it makes sense.
>
> that can be done later, I agree, but we would need to at least
> give this function a better name....
sure.
>
>>   	guc_write_params(guc);
>>   	guc_prepare_xfer(guc);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index d9375d1d582f..e1543478c627 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -247,6 +247,12 @@ static u32 decode_freq(u32 raw)
>>   				 GEN9_FREQ_SCALER);
>>   }
>>   
>> +static u32 encode_freq(u32 freq)
>> +{
>> +	return DIV_ROUND_CLOSEST(freq * GEN9_FREQ_SCALER,
>> +				 GT_FREQUENCY_MULTIPLIER);
>> +}
>> +
>>   static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>>   {
>>   	u32 freq;
>> @@ -257,6 +263,28 @@ static u32 pc_get_min_freq(struct xe_guc_pc *pc)
>>   	return decode_freq(freq);
>>   }
>>   
>> +static void pc_set_manual_rp_ctrl(struct xe_guc_pc *pc, bool enable)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 state = enable ? RPSWCTL_ENABLE : RPSWCTL_DISABLE;
>> +
>> +	/* Allow/Disallow punit to process software freq requests */
>> +	xe_mmio_write32(gt, RP_CONTROL, state);
>> +}
>> +
>> +static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	pc_set_manual_rp_ctrl(pc, true);
>> +
>> +	/* Req freq is in units of 16.66 Mhz */
>> +	xe_mmio_write32(gt, RPNSWREQ, (encode_freq(freq) << SW_REQ_UNSLICE_RATIO_SHIFT)
>> +			| IGNORE_SLICE_RATIO);
>> +
>> +	pc_set_manual_rp_ctrl(pc, false);
>> +}
>> +
>>   static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>>   {
>>   	/*
>> @@ -685,6 +713,20 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>   	else
>>   		tgl_init_fused_rp_values(pc);
>>   }
>> +
>> +/**
>> + * xe_guc_pc_request_rp0 - Request RP0
>> + * @pc: Xe_GuC_PC instance
> some more information here on the purpose and usage of this function
> is needed. Specially because it should be avoided on regular cases.
Added.
>
>> + */
>> +void xe_guc_pc_request_rp0(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>> +	pc_init_fused_rp_values(pc);
>> +	pc_set_cur_freq(pc, pc->rp0_freq);
>> +}
>> +
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>   {
>>   	int ret;
>> @@ -918,8 +960,6 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   
>>   	pc->bo = bo;
>>   
>> -	pc_init_fused_rp_values(pc);
>> -
> hmmm... this also shows that we are then calling a function
> of this component before the component is initialized!!
>
> so, maybe we need a function called xe_guc_pc_init_early()
> and then this function by itself sets this pc->rp* stuff
> and manually force the freq to rp0. And we document that
> the pre_init or init_early needs to be called before GuC
> is loaded for faster loading of GuC.

Agree,

Thanks,

Vinay.

>
>>   	err = sysfs_create_files(gt->sysfs, pc_attrs);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 43ea582545b5..8bed5d9fc12a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -17,4 +17,5 @@ int xe_guc_pc_gucrc_disable(struct xe_guc_pc *pc);
>>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>> +void xe_guc_pc_request_rp0(struct xe_guc_pc *pc);
>>   #endif /* _XE_GUC_PC_H_ */
>> -- 
>> 2.38.1
>>
