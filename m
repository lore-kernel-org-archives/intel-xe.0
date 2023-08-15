Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E26C001E0
	for <intel-xe@archiver.kernel.org>; Tue, 15 Aug 2023 18:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A661910E264;
	Tue, 15 Aug 2023 18:42:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7CE10E264
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Aug 2023 18:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692124919; x=1723660919;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=T9Zyrnp9OUqH679xNrXsXt2Zk/EUFXJL5eyaXa03oLc=;
 b=f5t1UBWYnrKql4YsfTxr+xvCWW96k++SdhLTj/wkC7x/9ui8XjohGKmV
 D1mlfIffhOimifVtnFtBpmDfgw053F1hg5anma/Wf6zlpq2UbrSpTcOVA
 Eq0Q3iwP/4Y/cN8AOdMd4yUxhZAh6vrxL932djKVIIroSskXDpMZ/361p
 Gt1a90Bw++T5DBuBtPtu236DdPCwSfjfs00NqTOC9XEzQ1hhJyujIqbtY
 UGqJ46ZkWJy4bgo0IUs9YmG7Z/UjTCF7gsrBGRkIMldb+2c2bYSwayB5M
 zQFa41LlCMemQ0sAki2wpqXt6Ybm0NJBHgtrp7rhZdY7zkEkFF9c/ljWC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="403326325"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="403326325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 11:40:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857523822"
X-IronPort-AV: E=Sophos;i="6.01,175,1684825200"; d="scan'208";a="857523822"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 15 Aug 2023 11:40:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 11:40:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 11:40:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 11:40:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 11:40:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dS9ATjMuUQL46gHodmu9VGgNsGtEKSaKRbmPit6k5QX0U5/Gdd0kGoHja/BUORSIghDrsluPkI6EJpyQ/rCYiSwu1RCiLoOVEWSYpsVKd0B6jEzT1qiSwbFXgbDk1PfWO87S9WOn12b8qy0pmSHo7YCgVc2pEV/3gKK0MBCLzrTvveq5U4IAOQVnOSQ2OXCwuc5jxweF5lZtWTDRnI/ZoPP0BWz/RVnBx0q8wfq72CA2zF6idvoXifmcy2eV5bdtWLr/l4WTmBb4XXd5MPAWd9UP8nO0/wpif9NlbozOhh4O2yXEuqYp+KuRe2mhKXacGhPMcU2cLuuQ7efhS+xmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bo/390QENb0caflUmoBq+KEQTpGA8tyXxXhqh/QW2YM=;
 b=eeHlX9d/SqL82atMt1At5YuXzP5dyHb9PuXr9bme3Stb+3ZoCfG2lgSo4w4aLwOKKPzsaZbNWJT2VHGMct9cebNX3yaTCS8EsXoS2fbWM8lTTQTOgxKYXPsIlts8V0mVDLv4389x/diLXx5NwYdoHkyDIcm+huoHMICy9s7HAJdJtcQ079g1gjWHPz7Z07QJftthiwQ946Q74KcACSQcHIJrp6acH+wgwaawqOyvo4/+Wutjp6d8TI9u77XKuMQrc5YNufwzXPDk8Ca2jkgSn2lAbRJEriDzBgSZ/hbP3uPqamyearyDxfQCeBkRHzHac8YpU3nGK8uqJ1fkXS1cfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 18:40:34 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::5f98:c6b:6aa8:4a8d%2]) with mapi id 15.20.6678.025; Tue, 15 Aug 2023
 18:40:34 +0000
Date: Tue, 15 Aug 2023 11:40:31 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>
Message-ID: <ZNvGn7kpYmtDMrH6@orsosgc001.jf.intel.com>
References: <20230814223734.375449-1-umesh.nerlige.ramappa@intel.com>
 <20230814223734.375449-4-umesh.nerlige.ramappa@intel.com>
 <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <4793cb528b5977e3bca6fe9d2883fbd8acd68625.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb28789-d8c4-43f7-eb3b-08db9dbf1c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S6HcbtLH+gvY1WUsRpTYQcGjo2gtLiIbflzqFVmuvoJWzCrLDGVK0wHgGUNK/L+dtRdZCOacMiRWsU2vpGxLKCawr9O9ALFqhruMhQro8g4QRLrNWDkfZM7UZhPZUOxbKsdRuaKYI0JpAe2tRqNQLS6zGwAWiWUDqFPlfq4cjL5uz2BGRET+gOOV+xtFd5e/WQwjIoPbaoZjklZPlMB6xmkYulN9byr0pWkXJIhA2GBG6TnyrK9DIPBQ9Nuu521nohhZenUDvToWkkYU3HEqZvj2mRl9SxjJLVgr1bTF1rOIjKnNGKxSAJgTy/NWQfjevvdzci5ff8dscb8eYWTAvuDLMuZABuCfkVcSdoZNAWkFgF4YrOuFb/lX94+eGUe6rk3RDe5S4u0zA6UNtCqYi5rr0XeSf/BiID/AbV1J2idn6P4q8KDCE298FXT20onLmGgbaFMSERyDmKM15qEyKPZ62+f0nkJwnRg908eTOGre7C8m98j2Lx1WEIV/8rs/OmwTupuKJG6hnrtnOHEK/AYdWkTQToU3CW8vlFpwOMwj1Jzq4bW0jAfCP6VTBfWZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(396003)(136003)(39860400002)(376002)(1800799009)(186009)(451199024)(41300700001)(8936002)(6666004)(38100700002)(54906003)(82960400001)(5660300002)(86362001)(66476007)(66556008)(66946007)(6636002)(316002)(4326008)(6512007)(478600001)(8676002)(83380400001)(6486002)(2906002)(26005)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlExYXRGR1hvZ21jUGtQWFZZeVlaNWttaXV6SE4rUG96dlMyYzh6ci92UUxM?=
 =?utf-8?B?T0FveE9ZdHM1ZFhhYmF4MSt2VU96R0JvaWt2QU5PVzZkR2xLWEVYVWJxVU9n?=
 =?utf-8?B?QytVNWlSbXhzcFZNaFRLSDN1WGt5ZVhKSWNXNEZZblpEekNDZDRoVVA5TnR6?=
 =?utf-8?B?N0U0dS9hTy9sZTdBK2VkckI1Wm1TOEY5WW1mUEI4M0dPTVFuRWpGZTMxMG1a?=
 =?utf-8?B?eHpqZ3RBU1p4RCsxRURFMWhURFZJbzlZV1hWMkJjbHdVd3ZuU2JXWHNoZWFj?=
 =?utf-8?B?QlgvYkVjaVFGQXZKTWpFMDVSQ0lrLy81S0NpL2FnTFRndHU5c1llemd1U0p4?=
 =?utf-8?B?NUpnOVYzZ29WOXVYTmlGK1g2bm92cEw5bGE1Q2h5bm1UaFRZQlJBRzFxVnA3?=
 =?utf-8?B?b3lJS2RVRldIZzJlTU15T2J0MUlRNHVHTkIwK0ZJZFpPZHpZSHEvY29MRnpp?=
 =?utf-8?B?NFpZbldKVUlVMVltU0IwKzMrUlQrWFkzNEg5U2twUVNPdUJVVGEwampIZzdI?=
 =?utf-8?B?OHVoTVNaQis0dHEyUUhkS0d3TkI5Y1NSWGcvZjZyQ0ZiOXBFTjIrV0F1Q3VH?=
 =?utf-8?B?cnRNaURIdXdkMWNiUzBMQ1ZDQzhWNWUvdXBZMUROekl0OVJacUNPdDZxcXds?=
 =?utf-8?B?czVGK3FTNDd4TWZkbHFENlNYemp6ZGtxcE9vYUJTSDAwQzA4d2xSYTBWWTMy?=
 =?utf-8?B?NWYxeU52UE1yeFZFSCtqRlhDdEpHZlRtbkQxY2RDMyt0eHlhdVZIWUJwYkx6?=
 =?utf-8?B?V0k4eDNHSStjMjhJa3hvYW9iTFA1SFhGUk5jTjR6REoyUEp5RkVmSW1nMFNH?=
 =?utf-8?B?WWJUYzcycWxRUU5PTldYNzNuSW5JeDZXNyt3YkJLL1ptdkpzU09qV2c2bFUr?=
 =?utf-8?B?ZklsaloreDdlOUt6dW9BZzNVaHQ4bmk4cXc1clpRVkxZYkxoVGNsVmppWmZw?=
 =?utf-8?B?S0VjVTVWZU1VRUY0dDRKd1htV3cxbnZoV3lpbG1zaGlRdFhwd2wzNWkraGhD?=
 =?utf-8?B?SEtMUHo4NXlOMDFtZTJxT29vKzVxU0xhdnBxSnVkMkk3MmRxbXBFUzh2VW9u?=
 =?utf-8?B?TFBSWXRramhhTndpUmYwSnFYZm5pd05vNWFJYU82N0dVWkoycGRZeU1nNUtS?=
 =?utf-8?B?UVltY3dTUCtoVnJGbVBGdW5nSUF2U01oMHNmemNOc2JkM3JFeDBNMy9USnZw?=
 =?utf-8?B?WUpsNmhuSHh1R0JHQkR2bEtiT2VqRm04L09CeSt2LzdNaEgxMjRiQ2dSVzdi?=
 =?utf-8?B?WXJqWHhvL2hUU3BqN3RaM1JOZFNZSmNmKytXNEFBVUswZGdJcXZSWUJRa2RG?=
 =?utf-8?B?NHNOWDZnYy90WHFIVmh4ZGFSNk5xeFZtcDlSSVVKOW5xcjE3UmZ3VVJrd1Zi?=
 =?utf-8?B?SGFaZjVRa0JNWmg2QlViRWIvVXRrNVJsVUFpUFNjYityQU5yNWxoMS80WHls?=
 =?utf-8?B?dVhteTFSdmpSdHdTWElsTzVHNjdlZEtrSW4ySVhmc2o0MXJHWlZqeDlycExi?=
 =?utf-8?B?a2dpNERaZS8zRDBzM1FMY2ttamNyM2NjOFAzaWZWZjM1NXJ4Q3R6cksvdEpR?=
 =?utf-8?B?b2twQ0NxblFiK3lhNjRoY1kwbCtDVDVZalUvNklXMGVldHlVcFRiSWI5eUU1?=
 =?utf-8?B?Z0ZZTmdQMGdqSjRvQ0FUTnFUQVFNOWZPaU55VFB4eklhZnR6Zm40ckZRRDVU?=
 =?utf-8?B?RWJDUWwzdndkVGVzOGpIdG1yVWhkRExkOGFqK1JLRHcrbjNHR2crcktzU0pF?=
 =?utf-8?B?WUZHZU84KzZkbmQ3WWlMWlpKNTRua0FqTUM2WUtBVSthVWNyM3pqcUllUnFY?=
 =?utf-8?B?ak9SZjNqNys5aTFJVUdVeExIMUpVcjlKc1lJNjEwNXhQK2FOSlZCWE5OZ0dj?=
 =?utf-8?B?bUdISGJYL2xwTDFUV0U2UXU4M3djS2NYYk02azVmaUhvejZoeDlOSC9KNXJT?=
 =?utf-8?B?dG95M3Iva3RSYmlwZ3ZZVUgrVGxGaGNucmRiUU5IcHNiSVhIOHAwcjk5TVhM?=
 =?utf-8?B?Ujg4SXBrZWw5d3I2UG5LOWFCTGdBRE9udWJFeXc5S01BTUR6MkJQK2VqTlFu?=
 =?utf-8?B?UFFWS040ZnAvSjQ2Yi93TjR2eTFaV1EyN2Y1Z1lPUGNtUGE5RWpwTmVBLzRa?=
 =?utf-8?B?dW1GaUJ5b3dpTCtxaXVHUW9Wb2JIRU8yZHNUVUhrY1NTZEZZZmdlT2R5WmNr?=
 =?utf-8?Q?00sh4c/zwILdRGq6m7HZ5aE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb28789-d8c4-43f7-eb3b-08db9dbf1c49
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 18:40:34.3353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kyd3yjfOUqf9zmWWpfB/k4/VlpOHKZoisYBOLjiA9Q/Pt1DPn7LQJHvBZa2qigY5V/bAgLoZZM/Ta2x2M/aWT2ShrVI8BobxMJVxqKdFeU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 3/4] fixup! drm/xe: Introduce a new DRM
 driver for Intel GPUs
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
Cc: "lionel.g.landwerlin@linux.intel.com"
 <lionel.g.landwerlin@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Matt, Rodrigo,

I have a uAPI change here that breaks UMDs. How do I land this and what 
UMDs should I inform for updating xe_drm.h?

Thanks,
Umesh

On Tue, Aug 15, 2023 at 07:03:42AM -0700, Souza, Jose wrote:
>On Mon, 2023-08-14 at 15:37 -0700, Umesh Nerlige Ramappa wrote:
>> struct drm_xe_engine_class_instance might get padded for 64-bit
>> alignment based on compiler used. Since engine information is kmalloced
>> in the query and drm_xe_engine_class_instance may be padded, it could
>> potentially leak some kernel memory to user.
>>
>> Add a rsvd field to struct drm_xe_engine_class_instance to make it
>> 64-bit aligned and zero out the field before returning to user.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_query.c | 7 +++++--
>>  include/uapi/drm/xe_drm.h     | 1 +
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 99a4800c7c53..b9d565264ceb 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -65,7 +65,7 @@ static int query_engines(struct xe_device *xe,
>>  		return -EINVAL;
>>  	}
>>
>> -	hw_engine_info = kmalloc(size, GFP_KERNEL);
>> +	hw_engine_info = kzalloc(size, GFP_KERNEL);
>>  	if (!hw_engine_info)
>>  		return -ENOMEM;
>>
>> @@ -78,7 +78,10 @@ static int query_engines(struct xe_device *xe,
>>  				xe_to_user_engine_class[hwe->class];
>>  			hw_engine_info[i].engine_instance =
>>  				hwe->logical_instance;
>> -			hw_engine_info[i++].gt_id = gt->info.id;
>> +			hw_engine_info[i].gt_id = gt->info.id;
>> +			hw_engine_info[i].rsvd = 0;
>> +
>> +			i++;
>>  		}
>>
>>  	if (copy_to_user(query_ptr, hw_engine_info, size)) {
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 86f16d50e9cc..53cd57342620 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -753,6 +753,7 @@ struct drm_xe_engine_class_instance {
>>
>>  	__u16 engine_instance;
>>  	__u16 gt_id;
>> +	__u16 rsvd;
>
>I don't think this change should be fixup, as this breaks the uAPI.
>Please ping the Rodrigo, Matt Brost... about what we should do here.
>But at least you need to sync with other UMD contacts about landing this change at the same time UMDs update their xe_drm.h.
>
>>  };
>>
>>  struct drm_xe_exec_queue_create {
>
