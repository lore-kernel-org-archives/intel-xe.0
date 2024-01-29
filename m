Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F76C47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 21:03:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6610ED0B;
	Mon, 29 Jan 2024 21:03:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B753910ED0B
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 21:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706562192; x=1738098192;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=975x2pDDoJnLKXQDiiXY3PhjW/K59ypTsk0C+ZBiQz4=;
 b=Q/Yfq9NF72rBTIpIVMhVgmYoqWOUQCbH9zIh4rO0n0md9dxwtqe5XSnQ
 7NqP/aqOAHoVoURDsm5W3VWklVW8bpVu/lVD5i461pLvAOAd44o7TEFU9
 s7TJmbxMn+hCyXS2UNetxgcFJZxGXdiQRSkXl7qLH8FuMjtvr44+zzaEC
 ewZ9etF+1FBpZZQI9e/z3I25Vp1qnM3n/HYOEwWVJRQ3BtOHwD+2lcl3P
 L31KQs1jNffhq2okcZ1Z3OyjaFco9Ib46+1fsqGU7tAVCL02BDS/gGHpD
 V1VRYgxsjy7p9KtSrw2d9GERjn13bHbrEDCuilosA4LkBiPXD7/ENe3NB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="467343370"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="467343370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 13:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="821979370"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="821979370"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 13:03:11 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:03:11 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 13:03:10 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 13:03:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 13:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXoc9w7Q262jmcR9N7LBZ1WsCrc0lyU04qu4vZaAX/BG+/P5WIIPc8YFf6VMJiqsuq7IhNixrhyFXIFmEmpmUW64yVynd1pys4wkP4TwhJ2//jGR9x4V0WVUA+tsAdgtFYoMwGEhFZLyWXQYQG9jCQ4spZuSdR8gx2EHcNZOYKSzQLsvf5ANuvhgxGb0v7LywbieZw4Rw6TxLKRZQwIw77+yUGQ5yYvQs22LNQPKRb3UwllWRpEPqx2kvaJmp2DFQnR6wAgoDL0BBVMS0C4LxddR0Hq5pGBkD7SYH8qvJHRiVKdF0zLzgUk25KIMoKmcmmMMTfjN9Y1BrRaRnyvdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgWwHYkRnIJ9UHkbT/YKTZX7Eu22V5yHyIm1QFStmzY=;
 b=XpBIuN5DHi43RqKjrR9TmOwYZyQTxmRW/iA1GRsdGWdPAHYoSlRqOX3Nr6OmksV6HRlFyTXZIfs8dhF4Drm3Ml1XNsaZQarjBR8rrE9VeWJvNY4IsF4MLLbeLXbn2kJlmZNSWj92CmfMcvt5g7/VqHWhpL9FG6ihDD96rtqft+YkMTBnYEpfEzJdPC5nHJG5RkScBGraAYDwy9k9BQEZ1/q6Ax1WP34i4LAlAa5Z49MTj127SKbyjouLFA/kkdfWBd6Pm+o8ehKiBUQX5qZth2U6dtBS0PRiICZ+347m3Cbr6TOMPI/IC/+CRYCCbWO9jX3HTrT4m0CYA05i+4VAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB7586.namprd11.prod.outlook.com (2603:10b6:510:26e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Mon, 29 Jan
 2024 21:03:07 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 21:03:07 +0000
Message-ID: <e0be1c6e-c528-40b5-ada5-fc973e4623b4@intel.com>
Date: Mon, 29 Jan 2024 16:03:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Expose number of dss per group and
 helpers
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240126232308.305358-1-zhanjun.dong@intel.com>
 <20240126232308.305358-2-zhanjun.dong@intel.com>
 <c1dceee5cc5b45d8924302feda41264375f96345.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <c1dceee5cc5b45d8924302feda41264375f96345.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::14) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 2833279f-92e9-4028-0c30-08dc210db191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f4FPS4zsg6OlkJFH+2spO4nAf0HPjGzA8EUk8/f34H8oqALGxv/X+W8jFGlOfKb82crM6BOCnqF7y2hnXF6SHgLS2d8R1seR33XWR1tWjEBODmTMzsDeOG2A3NhAuFQzd3MH7QCraB4KTLwuguuBjw54e+sz/eLyWlIsUmc/O+pCbUYzTEXS231/bFjv9vkXqIxcCpOffOwKV3O0dRBByTjWX1111+lAwTDZXkpPzyy6sOPKAhcnchbBQqV7A4C0S4CPaV7u7+u9iJmJeXme3LzLuvbAM+zmjy0ueywdZX3BDklpIw/E4wQyjKrF32jD1i0hT5UuvoGT+YZ/aSzil6GbcjdvUIUCKEfEjN6AFDiiiwN4MobTR2mVlK+OXrEC9nIaSok5Vpm8kIeGZcSbPnGhpWnGSm2VCKPsFbvOI9nfrD3hC9+07TimZdkrtIv5N2IlNgYvkVTjqR1bGP7s/LHs7CFFmrwTUdMva+8a8lcYM7JvXg/5MhoTcMg7AV3CFTaP6lmdsqHDAoMKrsa+4w+XOw7qhm3f+ng7ajmuY3CH2MFd9ApkrAgqcKNfss3FHgjDpFkh9Fr5WW5a/momFZwUfQ21YFQANELyWwu7G+TDT+DFmEKykG1d6VL5MWTkY6/WUgEipJnZG8kPSuzGVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(110136005)(66476007)(66556008)(66946007)(86362001)(82960400001)(31696002)(6486002)(478600001)(316002)(38100700002)(6666004)(6506007)(2616005)(53546011)(8676002)(5660300002)(8936002)(26005)(83380400001)(6512007)(36756003)(2906002)(31686004)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG8rUEs5eDFDTTFNbzFNRld1Q09Zc2QrWEhmbm5RT3NyajJGZFo5Zkh4OFNm?=
 =?utf-8?B?aGZuYy9zQ2xKc093ZnhKN3Y2WlpSZWZzajAreVdFcHAwTjIyeGZEc3BVUnNJ?=
 =?utf-8?B?WUpzNHJPR2RhUy92S3JoQTJjTzVaNGtIK2QxeVZnbWQ0MGEweDlkYUxJOTNB?=
 =?utf-8?B?d2JEZmJuRjZzRlJLV1dXRjZoeWk5TW1yZno3ZlQ1a3JWSXhHY0c3cHhDVFZt?=
 =?utf-8?B?ODRsMHpWaXFXeHBPN2xKMmxJalNlNDI4NEdWUmE3a2F1RUZUc0prNHltR293?=
 =?utf-8?B?d2tNamllbHBJZDVwMUJwdUtzaXdZMU4vT29XczloL2NHcHNVOWc2UTNnS0V3?=
 =?utf-8?B?T1VSUHBHdzRFNUFXUWpac2FPd1lzeTNRY0FkbTZHdUszaVE2dTBLQytDRXo3?=
 =?utf-8?B?aExiSUxaclhPd21qaHhvdlRiS0llYWwrSEsvdHppV29POGFteWswU2hOWlFB?=
 =?utf-8?B?LzBFd0JjeXpsZFgxcXFySlZiVCtSbUhjbm82NHRRY0pVb1FCaW1LemVDZUhi?=
 =?utf-8?B?Vy9SeWNvVHk3YlNJWFF6MDhUaEhUdjh4MnJ3dnVQUTVFQmJxUmpzdlV4VmhF?=
 =?utf-8?B?NG5RRFh2bHhwVElPVTNSb1poYjZmZjZ0NHc2em9PSmozVUpiT1pxc2RpWTVU?=
 =?utf-8?B?Z2Rza1NNQXZ5UkR4SjlVRm90SU51VUhBVUJ0c1MzdlJRWndHRjFvSDhxa2Ru?=
 =?utf-8?B?SEFRb291Y0NRM2VGTEY4OHJXK1NsVWpuOE5nbWNLdTUwbUcySHlHTkFMalND?=
 =?utf-8?B?ZURWVUNBMjNDUnZ4TSsvdWQreEpMM2JRYzVyTk00NnRDaG81NTM3T2RHWVBW?=
 =?utf-8?B?ODY0SVhhRU0wRnBaYUFkWklURnoyREVpQlZ1SlZMcU1ZSXBYQWxZOWxLajhL?=
 =?utf-8?B?MHVHQVF1eGdIL2pzcVRDalMyaEJsVzRFTDNyVnoyMFVsdlB6OWhTM1NtNGVo?=
 =?utf-8?B?azRYV0pwNjhVL2sxMDB4cjV0amFxYmVGdVZnZ1Raam9pRkNRZWRSSUFWamdx?=
 =?utf-8?B?OGtaWXI0em1YUXpjbWNqR2w4NXJYZS83Y1A5aWhhZzhRZTFNblBTSURyYk1n?=
 =?utf-8?B?ZTRlZnkwTkpna2hScU1Pc1pZTFE2MUNiczRyUk5TY2ZGdGpocnpQZERSTTdu?=
 =?utf-8?B?Umo5NnVzNEJLOHZaazN0YTRSQUJqZmxvWWxIbGFsNHlzSGhGbFBjZUp3UEhx?=
 =?utf-8?B?dGJCVXVzaHlWbitURlZZQXdmTU8xKzg4Zm1SK09vWDNTMk5Ca0Rqdy9xOE9u?=
 =?utf-8?B?Qm1SdTIxdmUwVVJFdlFZL2E3ZkhBTEZtVDFSMGNzK2ZPUzV0ZWN4VFR0K2hm?=
 =?utf-8?B?dmRXeXE3bVhwckRuc3ExdkZyVVNFTjRrcll6RGZzOTdlWktzUkx6RWxTUklO?=
 =?utf-8?B?WldQWEt0dlhhVjArbjZzN0U5WnZhVFUzUzVxODZLN0lnOWhrV3p5ejRtMTBt?=
 =?utf-8?B?RXlkQkRqUWRWVDljRTdRbkc1Ris5M2dKSXQzSUJtbVNrMzB5SlhHYjJyaGRV?=
 =?utf-8?B?VWZ6RGVMMVhFTjR6RWxNMGdsMVBWanMvbm91NEVMa2xiSEErMXlFWU0vbU9h?=
 =?utf-8?B?MmM1LzlNSXE3TDc2VFVzNVBMZGxqTzcwZWZRenFyQTJ6ekZkd3EySXhoU3B5?=
 =?utf-8?B?LzBFQlFvMHdYTDYwcHB2OGFvMW5jQUxqZVRUUHZDLyt5cHlXRWhURElOVEk1?=
 =?utf-8?B?M0pDRUtwTEdicmVZcVc2QVB1NkYzMy9ZSU1veGkwT3dlajJEcDZkUmdRR1Iw?=
 =?utf-8?B?Q1F0eWN0Uy80ZDdSK21jS2JMenUxc2JaZ040WjNiMVpROEpGTDl6TmQzYjdQ?=
 =?utf-8?B?bktQTndKaEQrVHY0SzNZdUFXWVQ1aUNOZFpxMENyRTVVWmUrQ09nQmRzZ1RE?=
 =?utf-8?B?SFAvcW8vR1kyejhtbzhUNkx0cnliSWJjVnZiYmk0cW9UcGlxOEY2eUJtUzZa?=
 =?utf-8?B?eXJFMEpJckpxZDI0dndUZlBaMFQzNzVWMnBML1hBdjRaWlhtYmczazdLWXE2?=
 =?utf-8?B?aDVGZGd2a1BnQUp3QVNBL05lWE04UkR6THNFdzNPMittZTZ0ODJYNjFYK0Vr?=
 =?utf-8?B?SHRWRVQ5VzVzVTBFRm5yaHM2SG00aTNnNHp1QTIxL0xybUlyWjlJOTcreFdW?=
 =?utf-8?Q?EkQ4F9QwKHwZMXZnUyE3/iWi+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2833279f-92e9-4028-0c30-08dc210db191
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 21:03:07.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZR8j2Vc+qKJZ2RZbVNUbGuKS3rfkNEGIBybJ5DETOHDY7pDd3lgF+BaSsZ1emLSxFjKMzIgV2vgmFyIL6KvF9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7586
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

Thanks for take time review it. Please see my comments below.

Regards,
Zhanjun

On 2024-01-29 3:17 p.m., Summers, Stuart wrote:
> On Fri, 2024-01-26 at 15:23 -0800, Zhanjun Dong wrote:
>> Expose helper for dss per group of mcr, features like GuC register
>> capture will need this info to prepare buffer required.
> 
> I don't understand what this specifically has to do with GuC. Can we
> just list this as general functionality, not related to GuC (cover
> letter) or MCR (function names, see below)?

Yes, will move it from drm/xe/guc to drm/xe

> 
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_mcr.c          | 38
>> ++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_gt_mcr.h          | 17 +++++++++++
>>   drivers/gpu/drm/xe/xe_gt_topology.c     |  3 --
>>   drivers/gpu/drm/xe/xe_hw_engine_types.h |  3 ++
>>   4 files changed, 57 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> index 77925b35cf8d..f7002623f3b5 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>> @@ -291,11 +291,16 @@ static void init_steering_mslice(struct xe_gt
>> *gt)
>>          gt->steering[LNCF].instance_target = 0;         /* unused */
>>   }
>>   
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt)
> 
> I don't understand why we're tying this name to MCR. DSS are involved
> in more than just MCR negotiation/configuration.
> 
> I guess not a blocker, but I'd rather this just be something like:
> xe_gt_get_dss_per_group()
Sure, will be changed to this name

> 
>> +{
>> +       return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>> +}
>> +
>>   static void init_steering_dss(struct xe_gt *gt)
>>   {
>>          unsigned int dss = min(xe_dss_mask_group_ffs(gt-
>>> fuse_topo.g_dss_mask, 0, 0),
>>                                 xe_dss_mask_group_ffs(gt-
>>> fuse_topo.c_dss_mask, 0, 0));
>> -       unsigned int dss_per_grp = gt_to_xe(gt)->info.platform ==
>> XE_PVC ? 8 : 4;
>> +       unsigned int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>>   
>>          gt->steering[DSS].group_target = dss / dss_per_grp;
>>          gt->steering[DSS].instance_target = dss % dss_per_grp;
>> @@ -683,3 +688,34 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt,
>> struct drm_printer *p)
>>                  }
>>          }
>>   }
>> +
>> +/**
>> + * xe_gt_mcr_get_ss_steering - returns the group/instance steering
>> for a SS
>> + * @gt: GT structure
>> + * @dss: DSS ID to obtain steering for
>> + * @group: pointer to storage for steering group ID
>> + * @instance: pointer to storage for steering instance ID
>> + *
>> + * Returns the steering IDs (via the @group and @instance
>> parameters) that
>> + * correspond to a specific subslice/DSS ID.
>> + */
>> +void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
>> unsigned int *group,
>> +                              unsigned int *instance)
>> +{
>> +       int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +
>> +       *group = dss / dss_per_grp;
>> +       *instance = dss % dss_per_grp;
>> +}
>> +
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int
>> subslice)
>> +{
>> +       int dss_per_grp = xe_gt_mcr_get_dss_per_group(gt);
>> +       int index = slice * dss_per_grp + subslice;
>> +
>> +       if (index >= XE_MAX_DSS_FUSE_BITS)
> 
> Maybe interesting to print something here from a debugging perspective,
> especially on pre-silicon where maybe the fuse registers aren't set up
> correctly. Otherwise it's a bit of a goose chase trying to track down
> why the DSS count is 0, etc.
Sure, will add debug print for this out of range case.

> 
>> +               return false;
>> +       else
>> +               return test_bit(index, gt->fuse_topo.g_dss_mask) ||
>> +                      test_bit(index, gt->fuse_topo.c_dss_mask);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> index 27ca1bc880a0..1365b3e77226 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>> @@ -7,6 +7,7 @@
>>   #define _XE_GT_MCR_H_
>>   
>>   #include "regs/xe_reg_defs.h"
>> +#include "xe_gt_types.h"
>>   
>>   struct drm_printer;
>>   struct xe_gt;
>> @@ -25,5 +26,21 @@ void xe_gt_mcr_multicast_write(struct xe_gt *gt,
>> struct xe_reg_mcr mcr_reg,
>>                                 u32 value);
>>   
>>   void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer
>> *p);
>> +int xe_gt_mcr_get_dss_per_group(struct xe_gt *gt);
>> +void xe_gt_mcr_get_ss_steering(struct xe_gt *gt, unsigned int dss,
>> +                              unsigned int *group, unsigned int
>> *instance);
>> +bool xe_gt_mcr_dss_has_subslice(struct xe_gt *gt, int slice, int
>> subslice);
>> +
>> +#define _HAS_SS(ss_, gt_, group_, instance_)
> 
> Why do we have the ss_ parameter?
Oops, not used arg
> 
>> xe_gt_mcr_dss_has_subslice(gt_, group_, instance_)
> 
> Same comment as above, why is this tied naming-wise to "mcr"?
> 
>> +
>> +/*
>> + * Loop over each subslice/DSS and determine the group and instance
>> IDs that
>> + * should be used to steer MCR accesses toward this DSS.
>> + */
>> +#define for_each_ss_steering(ss_, gt_, group_, instance_) \
>> +       for (ss_ = 0, xe_gt_mcr_get_ss_steering(gt_, 0, &group_,
>> &instance_); \
> 
> IMO it's confusing calling get_ss_steering twice here. I understand the
> macro piece, but it would be nice if we could reduce this to one call.
The 1st call is the one time execution before code block running;
the 2nd xe_gt_mcr_get_ss_steering call will be run on every iteration, 
so this is by purpose and cann't be reduced.

> 
>> +            ss_ < XE_MAX_DSS_FUSE_BITS; \
>> +            ss_++, xe_gt_mcr_get_ss_steering(gt_, ss_, &group_,
>> &instance_)) \
>> +               for_each_if(_HAS_SS(ss_, gt_, group_, instance_))
>>   
>>   #endif /* _XE_GT_MCR_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c
>> b/drivers/gpu/drm/xe/xe_gt_topology.c
>> index a8d7f272c30a..e973eeaac7f1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>> @@ -11,9 +11,6 @@
>>   #include "xe_gt.h"
>>   #include "xe_mmio.h"
>>   
>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> -#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>> -
>>   static void
>>   load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs,
>> ...)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> index d7f828c76cc5..3e978a190041 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
>> @@ -65,6 +65,9 @@ struct xe_bo;
>>   struct xe_execlist_port;
>>   struct xe_gt;
>>   
>> +#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>> +#define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
> 
> Sorry maybe obvious, but why did you make this move?
Before we expose the dss per group, the XE_MAX_DSS_FUSE_BITS only being 
referenced within xe_gt_topology.c. After this patch, these 2 macros 
will be used by for_each_ss_steering macro and thus being refrenced. 
Move it from the .c to xe_hw_engine_types.h to provide this definition.

> 
> Thanks,
> Stuart
> 
>> +
>>   /**
>>    * struct xe_hw_engine_class_intf - per hw engine class struct
>> interface
>>    *
> 
