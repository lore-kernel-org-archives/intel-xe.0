Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE9BC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 10:22:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8068810E216;
	Mon, 27 Nov 2023 10:22:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0439510E216
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 10:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701080561; x=1732616561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3o+npj9jOEmjcNKgp6HeqMCBwmJRxTBnjhFOeOoNLeU=;
 b=cShFtRzfcdVACfKypSIutGBe+3ST68KUKoN91JnXau9F/7xovmkEECQr
 z5oTvHtkU4iRWrtPHrNVGHsQCFkTy+IVRUrmDLnW+UFv7zqONIwJcIl9T
 MtnrQiiov6O/ys7uX7ILO+KpAEzQRpVWUzJcSEpqT7zLdABTPzWAE2zwP
 hH4u0WBmq0gwFOZw1bvKbAYiCTNqlpZmJx+t0gr5PJ0XfjCyDLAgZ0Igj
 e8wpPz90QxoET20TRV4NV255KDtb0OhB9Fj68MPmFqrEe+dyJnZqPVDZU
 mDslsTVDNZPiCCawKvbOfGHGyWEZaGL7PQmfPIAUigHNC9mkd4fHoGln9 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372026084"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="372026084"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 02:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="768123272"
X-IronPort-AV: E=Sophos;i="6.04,230,1695711600"; d="scan'208";a="768123272"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 02:22:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 02:22:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 02:22:40 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 02:22:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKQyLGL4YuADYIoHZaHTWDnOa95UqIVbqIivYaIFMxTaepPSkam4SGMHruS4LrhXhByRLau2eFcVTWUpPNmQGrHtodTMVLcB58J6XX8WoWRdSxv1Yk1WwkHQAbhi9m3wi/gxhFHRLuNe/Br0mv1/JcA3uqg4jO0v3vrY45++cXFvoPIg7M9R4/3bXTdcfnX8F3lyONGuhdtF1gzZD2hIDqApijV+MSwgnPlhXW3SIoAlyZKUUYmDb6G0hlsJDcHYJQTfIQJf7n2M8gBMrI8ro+Tc5mJ1pXAhRHPPbwTQk+1XeATeOTQXxP4KvFzHCqiowHOaxkQfyj/cn9Q+klBYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlb4UXpM1/MzBTuVGZpgTVyEqqz5bOrkz9G0jWQzHMM=;
 b=esGu8sNdhdy69Cb2URLE1pOcjWDIZktnZloPe1EVKeaOsBmFXae28ufMKdX87Sh3s2PxgJzL5Kx4unxw4/gbHnYm1ivX2/UXKehtTYMhDsxhJnNqMwsXW915IpajWpEO7eBc2IMVss5s3qCpAN+bjKeB3wLTC/LJxPWq/2f7Nvu7od4ornbmBllFo+fsHvzyZQpMiBDax9awmbt2m5I4eisO4+5ZKR/OPGIt91TyNuh2Lr/URrt93J9ZTc10NeGHjSyZMqFsFaxsf1+/z6ncpJV3RaaEQvOJolO1NVnp/oROtkVF9Qtt2lzwIEW9LfPvo88lR1f2z8K7Df8UYrrDgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Mon, 27 Nov
 2023 10:22:37 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 10:22:37 +0000
Message-ID: <a999ddee-cd7e-4119-94a7-89d9199bd473@intel.com>
Date: Mon, 27 Nov 2023 15:52:30 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231127100249.168117-1-sujaritha.sundaresan@intel.com>
 <20231127100249.168117-2-sujaritha.sundaresan@intel.com>
 <87wmu38pu5.fsf@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <87wmu38pu5.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0087.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::12) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f09b4f-07d2-44cb-55a6-08dbef32c700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uCMHNCpj0NLwZXA/SpkHsP/ajTrBPxfdboLhx9GBN9qDd+FbmsRENkFM50vBtrCRlWZ1uo4uCZk0SAf+0zbaQFCU3jA5Y7U47s3Jq13i5Z3Z19r89ppozf3eFgO03JyPG1jOXzgKA2RV0xaWifLji4bUUcygUppO3qEstQsR/JFlyvf+lWX0S/MWMNPB6x/yrcc5uM7KnJEUOMZBQ+4mYSYHF5u1YmNg7Nea3i/ji+VXr+T9C4yVSr5aBEcAoHIMYFxfxRczLfKd1L3U0hKnC86alCUziMeiuAA/kS5ngYABTujsXY0swgoLnPeK5w/ksT+TFN/8hulLRC77yGYaJF2iyWcB/qz4/9huLw+O//PhOKNRNeeb5PDQPPmLnmZCjOmuLryLvpjsCB4kBU37N275Ok5hJZK2EXgksHcSIWoSDUYE2bY5ObGt8W3yly/ndPeRdSq72JG0TZvXlGn9vVq/CWacZhOx9hZCUbgqnQuwko1I4nLwxvvShV9SHYOa5FuakXe0yyak3c4KCOnnwbu+mOhDbyO4D9iFkUZ6NYeiH+Z0ZTA3gi1kCjay695f4BfH36j+ITc844XWvveVFUpN7/TpoQkEmFZeJ7KkUyXLIrowJuVIxuTEUot9sxg+gkKJ8t9osiopHpUZeytGWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(376002)(136003)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(31686004)(26005)(6486002)(2616005)(6506007)(53546011)(6666004)(478600001)(6512007)(38100700002)(82960400001)(86362001)(31696002)(36756003)(5660300002)(41300700001)(2906002)(66946007)(83380400001)(30864003)(66556008)(66476007)(316002)(4326008)(8936002)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVFPZHlhTVJNVkl6V3Yxa2hoRTFVQUdtZjI1ZFhDdVY5YkRHQ3FMYUtVaGMv?=
 =?utf-8?B?Q1RpWUR4TGx6Sk5DYlhDcmE4dndpZWU2elpnaFdweW5GNTVzYU9zYXZsWTBo?=
 =?utf-8?B?R3dMZllJL2dOdjcyQVF4Z0ZvZzB2L3A3eWhhcUo5eWNUb1h3SzZwVVUyRHA2?=
 =?utf-8?B?ZVUyU25Lc3krbFRwYlVnMDNLZUtiT3RlOExMYnMzWWliMU8wdW9RRmhGb1dF?=
 =?utf-8?B?MzJyNXg2VjVSVXVpamMvNEFTTEJpWld2YnNVWXRDbVNONjBtSlpaSUdUdzZm?=
 =?utf-8?B?UzVwL1o4cmUzZVhuQUYrbjI5UG9tamhFYitPTFpsbU02eVRYVy9LRndoZzBB?=
 =?utf-8?B?cFpTdVhwUFNMSmpLVDdoR0Q5eGpoY0FTZU5TQldMbjE0c3pPUTZyR0RScGhL?=
 =?utf-8?B?czUxa0FuODludTZTZndPYzF2SjFiQVdMZkFjTmpOM29YQTJlSkc0TXlHMTE4?=
 =?utf-8?B?cENmb1B0S2w1R1BMaW44S29Xc2cyWlA3R0JSQXNiVXhDVllPdFV3TFJsWFpX?=
 =?utf-8?B?c2YxR2dhY0pFNHdMV0dSQ2l1ejFNbDFwc2VxMTk5NVlGK2loRkQvT1ZldVl5?=
 =?utf-8?B?UmRYenlhYjUvMUwyTXlEY2xHKzdjRC9KYnd0MVRTdEhpcHJQcmZCTlFBTklH?=
 =?utf-8?B?LzVMRkViSXRQK1BJL1F0NHdYbUNaVURheGk3YVpEdUhUaGVIc2NNNVYxM0ZW?=
 =?utf-8?B?L3ZzQlY4T1BFd0FIZFE0OFZFemtYUzhmZHlPV3dlK29KRFp6WmtpbXNoc0VB?=
 =?utf-8?B?ZGltbjNmOXY4SkJPM21OUXRkUGEyT1NFbGhBMXdlRzNmZzdQYlNGV2JJNm1o?=
 =?utf-8?B?cXk0cWdmWFlRdWJidHBScGN5RDM2bng2SjEwK05rVmphc1BUV3pwMWIvTkp0?=
 =?utf-8?B?bWwyQWprbER1Wnp4OFBWWlI1cWJhOWs5bFpsY1lBd0tLWURQZDVDNjlhTGxL?=
 =?utf-8?B?bHhPNm04Ukx6cTlzOXgyMGJwQ2xJYVBuZUIranZ6RmZlR29NVGVjU3ZDOTRS?=
 =?utf-8?B?VHo4Zzl0eEJrRnFRNEVabXUrODZTUmR3anArVzMrV2EvM2hSZU1pTkJUZU9U?=
 =?utf-8?B?UGJyZytuaUJDa3RxMkNnMjQ0MVAxUGIzYnRqSGNBVEFuNFpHMUJhKzB6UTkz?=
 =?utf-8?B?VXFNaFp6WE1IMmxoZllzOFE3V1duWFU5WmxtN3RlaVlIZk84Tmp5MW9hOGNO?=
 =?utf-8?B?YXpzWWlrakMyRUd2eDg5Y3dOanA2SmN6LzFkZWwzTGMvbmhJNURMQzJTeGNz?=
 =?utf-8?B?U2g3ZUFoZkxwSHBDejI2YUVoc2IyQnVId1ZRdzBoTm9EdW9zS2tYd3Z4OUhX?=
 =?utf-8?B?STVrVXRkY0lRNVpYQTVhR1FXRHAyRElEZWI0bVNyRytyK3RDaGJBM1JJREZU?=
 =?utf-8?B?QTdDaVU0TXZ5THQ0SFhaOThKUFpINncyVUdZQno2QWYwQzZ4RDl3ZWJMM3Zs?=
 =?utf-8?B?UCtDajlVeHAzY3JmR0psNGxieUdGdkdPTFhaSUdFR25WYzl0YmhvemIrT1FU?=
 =?utf-8?B?TnFzSHo3UEQzTlZWQVc2bE5yRVJRZjgzVytSUU5nQi9ReEVEdkhYUmNtZTF4?=
 =?utf-8?B?VXl1V2pMV1RoU25VcDZza3M5cytkL3pMb2NhTURaQlhoNEpoWDN0elVNZjhU?=
 =?utf-8?B?b2dUdUN1M0lwSFp6dklaOEFmcjErSVAvSFY3Nms4SFE4TXJXUTZoRExBSm5L?=
 =?utf-8?B?OUhZSzN0dFVWNkluZHRsbGRrMFgzVXpvWXFsT1pZRithbWhISFdtRk5tMWlJ?=
 =?utf-8?B?UEdwL3lCa2Z6a25jRnBaSWd5dDhaa2I1ZHVqLzdacmd2U1NVV1cyYXU0dS92?=
 =?utf-8?B?TWt2SlZDWGx0NENqZk01MEpMUmFCVnNCRHliU3RYVFZ6RitXODQ5SVMyTVBE?=
 =?utf-8?B?bGgzU1FQTUZDZzJXazkvdjZUV1czQndIZkVrb3Q1VXBJY1BUR1RSZmhXYXhW?=
 =?utf-8?B?b1BpKzVpY052RGxqSVA5QUtOaUR6Mng1WjZIUVVWWFdFcEw0bnZjTmNJa2ZN?=
 =?utf-8?B?TkROemFyQUUxalVRd2J5Yy8rVTllajJUZmE5OG4rWlllaXdhNTJvdklPSUZQ?=
 =?utf-8?B?K0M4UkVQb2ZjRE5GZGIvUUFwek5oczM3WFZnakp0VkVRTmQ1WTEzOFQxeEx5?=
 =?utf-8?B?V0VWZUduMk56c1gycFpzY3ErOTYrWDNrYTVXU2FtakxRN2R0V2lXZ1RPMDJn?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f09b4f-07d2-44cb-55a6-08dbef32c700
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 10:22:37.2410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjBT8e/IQQD3BL7lXQ0QJdjqJoJIf/ufI92iAcIdoETXIKELc2ShqXQiTBzj6S/bf2wXiFuznUsa/3yzFwytRtR98XxW3lacazKIGbNbbMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/1] drm/xe: Add a new sub directory for gt
 frequencies
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 11/27/2023 3:45 PM, Jani Nikula wrote:
> On Mon, 27 Nov 2023, Sujaritha Sundaresan <sujaritha.sundaresan@intel.com> wrote:
>> Add a new sub directory "freq" for gt frequencies and rename
>> exisiting frequency sysfs attributes to align with devfreq
>> requirements.
> The cover letter says this does much more, so the commit message here is
> not accurate.
>
> OTOH when a commit message says "Also", it's usually a hint it should be
> a separate patch. Often functional and non-functional changes should be
> separated, so it's easier to review each part.

Hi Jani,

Sure I can probably split the name change and the directory addition.

Thanks,

Suja

>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_types.h     |   4 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 125 ++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |   3 +
>>   3 files changed, 82 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>> index d3f2793684e2..ea1e05a46288 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "xe_force_wake_types.h"
>>   #include "xe_gt_idle_sysfs_types.h"
>> +#include "xe_guc_pc_types.h"
>>   #include "xe_hw_engine_types.h"
>>   #include "xe_hw_fence_types.h"
>>   #include "xe_reg_sr_types.h"
>> @@ -270,6 +271,9 @@ struct xe_gt {
>>   	/** @gtidle: idle properties of GT */
>>   	struct xe_gt_idle gtidle;
>>   
>> +	/** @frq: frequencies of GT */
>> +	struct xe_gt_frq frq;
> This seems unnecessarily terse to me.
>
> BR,
> Jani.
>
>> +
>>   	/** @exec_queue_ops: submission backend exec queue operations */
>>   	const struct xe_exec_queue_ops *exec_queue_ops;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index e9dd6c3d750b..d0b625d8b1dc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -57,15 +57,15 @@
>>    * Xe's GuC PC provides a sysfs API for frequency management:
>>    *
>>    * device/gt#/freq_* *read-only* files:
>> - * - freq_act: The actual resolved frequency decided by PCODE.
>> - * - freq_cur: The current one requested by GuC PC to the Hardware.
>> - * - freq_rpn: The Render Performance (RP) N level, which is the minimal one.
>> - * - freq_rpe: The Render Performance (RP) E level, which is the efficient one.
>> - * - freq_rp0: The Render Performance (RP) 0 level, which is the maximum one.
>> + * - act_freq: The actual resolved frequency decided by PCODE.
>> + * - cur_freq: The current one requested by GuC PC to the Hardware.
>> + * - rpn_freq: The Render Performance (RP) N level, which is the minimal one.
>> + * - rpe_freq: The Render Performance (RP) E level, which is the efficient one.
>> + * - rp0_freq: The Render Performance (RP) 0 level, which is the maximum one.
>>    *
>>    * device/gt#/freq_* *read-write* files:
>> - * - freq_min: GuC PC min request.
>> - * - freq_max: GuC PC max request.
>> + * - min_freq: GuC PC min request.
>> + * - max_freq: GuC PC max request.
>>    *             If max <= min, then freq_min becomes a fixed frequency request.
>>    *
>>    * Render-C States:
>> @@ -97,18 +97,29 @@ pc_to_gt(struct xe_guc_pc *pc)
>>   	return container_of(pc, struct xe_gt, uc.guc.pc);
>>   }
>>   
>> -static struct xe_guc_pc *
>> -dev_to_pc(struct device *dev)
>> -{
>> -	return &kobj_to_gt(&dev->kobj)->uc.guc.pc;
>> -}
>> -
>>   static struct iosys_map *
>>   pc_to_maps(struct xe_guc_pc *pc)
>>   {
>>   	return &pc->bo->vmap;
>>   }
>>   
>> +static struct xe_gt_frq *dev_to_frq(struct device *dev)
>> +{
>> +	struct kobject *kobj = &dev->kobj;
>> +
>> +	return &kobj_to_gt(kobj->parent)->frq;
>> +}
>> +
>> +static struct xe_gt *frq_to_gt(struct xe_gt_frq *frq)
>> +{
>> +	return container_of(frq, struct xe_gt, frq);
>> +}
>> +
>> +static struct xe_guc_pc *frq_to_pc(struct xe_gt_frq *frq)
>> +{
>> +	return &frq_to_gt(frq)->uc.guc.pc;
>> +}
>> +
>>   #define slpc_shared_data_read(pc_, field_) \
>>   	xe_map_rd_field(pc_to_xe(pc_), pc_to_maps(pc_), 0, \
>>   			struct slpc_shared_data, field_)
>> @@ -385,11 +396,11 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>>   	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>>   }
>>   
>> -static ssize_t freq_act_show(struct device *dev,
>> +static ssize_t act_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct kobject *kobj = &dev->kobj;
>> -	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_gt *gt = frq_to_gt(frq);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	u32 freq;
>>   	ssize_t ret;
>> @@ -410,13 +421,13 @@ static ssize_t freq_act_show(struct device *dev,
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	return ret;
>>   }
>> -static DEVICE_ATTR_RO(freq_act);
>> +static DEVICE_ATTR_RO(act_freq);
>>   
>> -static ssize_t freq_cur_show(struct device *dev,
>> +static ssize_t cur_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct kobject *kobj = &dev->kobj;
>> -	struct xe_gt *gt = kobj_to_gt(kobj);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_gt *gt = frq_to_gt(frq);
>>   	u32 freq;
>>   	ssize_t ret;
>>   
>> @@ -439,21 +450,23 @@ static ssize_t freq_cur_show(struct device *dev,
>>   	xe_device_mem_access_put(gt_to_xe(gt));
>>   	return ret;
>>   }
>> -static DEVICE_ATTR_RO(freq_cur);
>> +static DEVICE_ATTR_RO(cur_freq);
>>   
>> -static ssize_t freq_rp0_show(struct device *dev,
>> +static ssize_t rp0_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   
>>   	return sysfs_emit(buf, "%d\n", pc->rp0_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rp0);
>> +static DEVICE_ATTR_RO(rp0_freq);
>>   
>> -static ssize_t freq_rpe_show(struct device *dev,
>> +static ssize_t rpe_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   	struct xe_gt *gt = pc_to_gt(pc);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   
>> @@ -462,22 +475,24 @@ static ssize_t freq_rpe_show(struct device *dev,
>>   	xe_device_mem_access_put(xe);
>>   	return sysfs_emit(buf, "%d\n", pc->rpe_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rpe);
>> +static DEVICE_ATTR_RO(rpe_freq);
>>   
>> -static ssize_t freq_rpn_show(struct device *dev,
>> +static ssize_t rpn_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   
>>   	return sysfs_emit(buf, "%d\n", pc->rpn_freq);
>>   }
>> -static DEVICE_ATTR_RO(freq_rpn);
>> +static DEVICE_ATTR_RO(rpn_freq);
>>   
>> -static ssize_t freq_min_show(struct device *dev,
>> +static ssize_t min_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> -	struct xe_gt *gt = pc_to_gt(pc);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>> +	struct xe_gt *gt = frq_to_gt(frq);
>>   	ssize_t ret;
>>   
>>   	xe_device_mem_access_get(pc_to_xe(pc));
>> @@ -510,10 +525,11 @@ static ssize_t freq_min_show(struct device *dev,
>>   	return ret;
>>   }
>>   
>> -static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>> +static ssize_t min_freq_store(struct device *dev, struct device_attribute *attr,
>>   			      const char *buff, size_t count)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   	u32 freq;
>>   	ssize_t ret;
>>   
>> @@ -540,12 +556,13 @@ static ssize_t freq_min_store(struct device *dev, struct device_attribute *attr,
>>   	xe_device_mem_access_put(pc_to_xe(pc));
>>   	return ret ?: count;
>>   }
>> -static DEVICE_ATTR_RW(freq_min);
>> +static DEVICE_ATTR_RW(min_freq);
>>   
>> -static ssize_t freq_max_show(struct device *dev,
>> +static ssize_t max_freq_show(struct device *dev,
>>   			     struct device_attribute *attr, char *buf)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   	ssize_t ret;
>>   
>>   	xe_device_mem_access_get(pc_to_xe(pc));
>> @@ -568,10 +585,11 @@ static ssize_t freq_max_show(struct device *dev,
>>   	return ret;
>>   }
>>   
>> -static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>> +static ssize_t max_freq_store(struct device *dev, struct device_attribute *attr,
>>   			      const char *buff, size_t count)
>>   {
>> -	struct xe_guc_pc *pc = dev_to_pc(dev);
>> +	struct xe_gt_frq *frq = dev_to_frq(dev);
>> +	struct xe_guc_pc *pc = frq_to_pc(frq);
>>   	u32 freq;
>>   	ssize_t ret;
>>   
>> @@ -598,7 +616,7 @@ static ssize_t freq_max_store(struct device *dev, struct device_attribute *attr,
>>   	xe_device_mem_access_put(pc_to_xe(pc));
>>   	return ret ?: count;
>>   }
>> -static DEVICE_ATTR_RW(freq_max);
>> +static DEVICE_ATTR_RW(max_freq);
>>   
>>   /**
>>    * xe_guc_pc_c_status - get the current GT C state
>> @@ -664,13 +682,13 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc)
>>   }
>>   
>>   static const struct attribute *pc_attrs[] = {
>> -	&dev_attr_freq_act.attr,
>> -	&dev_attr_freq_cur.attr,
>> -	&dev_attr_freq_rp0.attr,
>> -	&dev_attr_freq_rpe.attr,
>> -	&dev_attr_freq_rpn.attr,
>> -	&dev_attr_freq_min.attr,
>> -	&dev_attr_freq_max.attr,
>> +	&dev_attr_act_freq.attr,
>> +	&dev_attr_cur_freq.attr,
>> +	&dev_attr_rp0_freq.attr,
>> +	&dev_attr_rpe_freq.attr,
>> +	&dev_attr_rpn_freq.attr,
>> +	&dev_attr_min_freq.attr,
>> +	&dev_attr_max_freq.attr,
>>   	NULL
>>   };
>>   
>> @@ -950,6 +968,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   	struct xe_tile *tile = gt_to_tile(gt);
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct xe_bo *bo;
>> +	struct kobject *kobj;
>>   	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>>   	int err;
>>   
>> @@ -965,9 +984,15 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>>   
>>   	pc->bo = bo;
>>   
>> -	err = sysfs_create_files(gt->sysfs, pc_attrs);
>> -	if (err)
>> +	kobj = kobject_create_and_add("freq", gt->sysfs);
>> +	if (!kobj)
>> +		return -ENOMEM;
>> +
>> +	err = sysfs_create_files(kobj, pc_attrs);
>> +	if (err) {
>> +		kobject_put(kobj);
>>   		return err;
>> +	}
>>   
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2afd0dbc3542..a48c22687ca8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -31,4 +31,7 @@ struct xe_guc_pc {
>>   	bool freq_ready;
>>   };
>>   
>> +struct xe_gt_frq {
>> +};
>> +
>>   #endif	/* _XE_GUC_PC_TYPES_H_ */
