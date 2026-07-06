Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC107C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 23:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17EB10EAF9;
	Mon,  6 Jul 2026 23:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoyESo7y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3C410E3E2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 23:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783382279; x=1814918279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tXfpr7v6yzYuhzHgqawwwjPVwMj6BYMAZ2JRDo9zk3o=;
 b=RoyESo7yeT6qbPHtR6ZhEWhft/FX/t6SILy8LIOuGt6b02pf71mq6Vql
 bERdHO4lHOHcIROujt/Z0MT6YzkXxQMHFr9gpe6iwDrdX9AHCJgb0Vb9g
 DNKsoXW/ld2ZZTFkCPdB4S8+5P+GO612Oxd38JXrFWhB1ydg7t37c/k2N
 xUMZ94RNp3hB1NbmpnhgTR0ox/pOBqE0uBZ+8xzgaUhrHLxSzV914gk/w
 w9ZntAHfkX2Ss/y/GXLk7ZlYaIsC1G1MlJkIK8WVsmZSLWe4RxVhkUp35
 tC/VWD+eu5TuKOJUmI9zb9yr9IOME6mKNLbb4EbllCEVEOX9YZ0mjNj1s w==;
X-CSE-ConnectionGUID: YaOcKhBaQfClA61EMvBHxw==
X-CSE-MsgGUID: usHq/pePQnuio7uYnNCEuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11839"; a="95405059"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="95405059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 16:57:58 -0700
X-CSE-ConnectionGUID: 6xXzl6YvSQSG5OulKarBFQ==
X-CSE-MsgGUID: tYgi/i6CS82CMlA2myKAjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="257421894"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 16:57:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 16:57:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 16:57:58 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 16:57:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9cSrB7VNJe5ryBVsc9J9028+eRqOov0mqWu7REK7p5vwPNiFA1l76eCWZ1XE1iv2HkvQEO6Yduy6piMuwadyc+oyegtt0/BD6nRRC5HP0XbQq1YMV/WPrLiY94Cb1kE/fYMu0tAzwy2H2lCuQLw6QOUwJb+cku7j0ZjCpkhSMjBp4cgijg9OV73FTN6K5V7wdMLCJgIAoa39znhidSwKPMS0Z9MiRG5L8Rluhlx6Yn4b747cPIIwCJzewZlsd1taolF+cVT5DTxvvykFPDeOX7i0fEzQO/6lBZp7iVggKxuVqHxckDU5TRLi3M8heroMBdn9TuWl01o4pFkfGMWJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUqVNblHSnJPOmAN325ZPbGrrL7EDs2kAHPqZIdVvSY=;
 b=gtAW+E6cZBZ/P/33A4pyMs1DbPD7DbyC11lFMRJ02vnNoHOCWThxB+y7kMo2E/1OpQihySKn+ZuR/5nNqXkBC8N1YbM63y7uDH+hMVHXUY5WWjYkHx9tmCSnnjXKiqYKQS5+A4xZX9iqcAAmWV0DxJOp+gwCAcsMueAlJ8TWea06X7zwE8LJVwBmfo0GJZU7SoflcPzEgz9m5MaaEg2w9s3OPiSTRm7pPqZpxddoFGsO3Z8mIxM6E3qU3kyh1crBmuDRopb/aEMqaWNjX6UfrmBYTdNMaX1fsQw83WDuanZDAEKkcHohk328zfAe3GE29Dn/iORfIbDH4ceIDXTeug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS0PR11MB7830.namprd11.prod.outlook.com (2603:10b6:8:f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 23:57:54 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Mon, 6 Jul 2026
 23:57:51 +0000
Message-ID: <21c1df90-0862-4056-ae65-4bcbce1640ef@intel.com>
Date: Tue, 7 Jul 2026 05:27:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 3/5] drm/xe: use xe_ras_log_wedged macro in
 xe_device_declare_wedged
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-10-mallesh.koujalagi@intel.com>
 <3684bbf3-e4c4-48f6-8f31-fcbd3f29e848@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <3684bbf3-e4c4-48f6-8f31-fcbd3f29e848@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS0PR11MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 021fc04b-b303-4e21-4090-08dedbba6398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|13003099007|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: sdJGiqM/EIS7sFZk5UEitR6V6OiM8vVMkVV+70EdY4y54YiIEP2kZ2ZtiEPR2E+7W22ymcay8VEHBYqgWx6LrwREYf0MXdqC1m0+D5Ob5oNszSQJ+LgWEKB9JoVb6JL64+zP1+2n/VNNgwpprensI+1GU9LX/PDkOSsOEndoAA8SkyUz9GopyVn8SaxuBDipKSuCxxlxTy1f7QvVZy0usNODb02ZzfoUcLEs0lJjKCiXKcMpxJ912PFW2EjFH4yHldiOWDyql69WptlQ+paFu7/QNZhprcuF1M9cgwX3JOyIzcBdQv9pB5YAEQVI6rd7Iwz0AmbvmrfnFhfIZmPw9AKfWxnuPMDy/MthXObL9tgfdFqpQU4eZ80YHLvaEnPW/w8rgXAUShV1DVouEfgugLgNTBXk2+TU1OUYy63bc5Y2ehw7xLHhrD0JSpaAbEpjQ8OLu5Wf813WosV7YUUv9f58ZXhzbVoxNPMX0A1lSphbza/j2lWzP7kbxeu64y0jnWzBtrzPQuUj/a3RwUdIm/UrRKpuLusnbwobAUWxGAIMqItrf8nQifDEXUB17v3pEiY8qdEb+7b8wmGWEI5ETjxPnRxp/SZRc7JwwzNpLWcrNkbXyjj0Gjh4FIwUg6vx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRVWkViRm5sVHNLTnNCdFFyM3dSRVRhc0NyVkhtSmMyQTN6eGljemo5WGs2?=
 =?utf-8?B?RWVwTXl5OEZCNTFkcmNoMTJYMnBhMWNIN2JjeHJaWjJscElIZ0F6YUsxNlFs?=
 =?utf-8?B?M1BlQzVMbVAwN2xaR2M4VkNmR0dSbGVsR09mc0RlNm9VWGVab1cwM1Y0bmxY?=
 =?utf-8?B?eTV0L2owYmNkeTlkNEdsSjZMQmE0UUo4Z3pXbDJuMDNXVEJuMkplRDExcllI?=
 =?utf-8?B?eHAxU0kyVzJQTGpMSDZMSTQ3czA2YTU1d0NaNzRCY1VPOGV4TllNcGFkWjZY?=
 =?utf-8?B?MmFTZlR3R1ovV2tIMis0NW9wWWkzR0hJcXZCdXhIeis5bGNwbTRsMlZqMEdM?=
 =?utf-8?B?VER1UkgxUTJ1d1VHOTUyUE1TZWZQcnFqbVgyNEIzMklXREVBWWRMWUJQdVJL?=
 =?utf-8?B?RW9jclY2MnZ2K3hnL29VNnUzbmpuVGNjT1RqcTMwSzJJZENQUFE5ZDNRUHpi?=
 =?utf-8?B?RGNOWlE4TzhERUd6bjNTR25hSzZhS0xWMzhqRjNGeTZ6T3FINUd2VFBGdlNR?=
 =?utf-8?B?b3VmWU1idmtzMTVmeCs3V294cURmRmJKZHp4ZW13TG1iMU5LQjVNbmtYMldn?=
 =?utf-8?B?L2prMU1PVmVrLy9BZTc1VS9VYTRYalBmOU53NFFGUnJsTDBlM1JZWGNUcTFH?=
 =?utf-8?B?WmswNi93QjEyeGlmYkducGVXMTZZeTNlVXRxNzQvcWpuOFhRYlRSVFpqREVB?=
 =?utf-8?B?N0IrRDJVU2VuSEhmNmhhckoyRjJZWFFHY2N5MklqbVZoc2YxeG5LSzVZekcy?=
 =?utf-8?B?aEtqOVgzS2xDU0JRU2g1QWFDZUhzNGd2YVJaRjFUcTJrQVcxbkc5RmFnSXh3?=
 =?utf-8?B?VUwyeFlyNGx5T2JMNjRCcVlmam1EK1dpMVJ6L3BCaUR4ZjJyaTZTcHFqK1VD?=
 =?utf-8?B?Y1JPQzl2QXYzUlFWS25Ha1Q5c05XaTJqd0hPV2xpUG5FYi9XbFlDazY3UGkx?=
 =?utf-8?B?eXV5NkRTc2V6UjAwK3ZrYVhhZEh3U1hDTDFRc2dZVWJVWng0cFcwUUhzMkxL?=
 =?utf-8?B?YzlTVDdtSDdYNjVaZnI4b3pSeEthb1NGL1k1VDhIcEVBNE5ySzRyY2tlNVJx?=
 =?utf-8?B?cGlZV0xCaFJpVllycm5qS0ZVUEpoWEhLMEdYREFzd0lmajVtSzJNcUpYQVpR?=
 =?utf-8?B?VDdOb2RYa05FVWhFK0R2VWIzZ21pV0RsWXpFeUZTODNVRGp1LzMrNFJLTERQ?=
 =?utf-8?B?dG9paVBXMVVZUm1NRlNDbjNDeHdKdDJuQkt0SCs4RHJBQ1lBUUtiQWRZdXQx?=
 =?utf-8?B?R1kyUUhsMXd4MjlocytXaFN2SjRZZ1hBNXppM0EzeHh5dEYvNENXb1RiWis1?=
 =?utf-8?B?ZVRkODhKdm5HNC9PUlFtZTJweGdyZzlYNllsckZtZExpSFE1NnNQVHlySzNQ?=
 =?utf-8?B?ZWJZdzlKWlVweXBjdVRlSVE4aEhiMGt4aGNQdmZ3ME5ldVNjcUFRcldmN0dq?=
 =?utf-8?B?Q0MxTXI0RnFvRDFITDJvTFlvckxoaTZqdzBzVVBEcjZGNGFiKzU5WTUrWkpy?=
 =?utf-8?B?eEZ6TXVUQUdpcFBiZ2IrSGlwZGFlenhKSXdSSTVSWTg3alFqaFFQTERjZjlr?=
 =?utf-8?B?WGdldE52aDhCdDREdW1XWmhHdVdram5uclJUT1JBMStIY2JJejhub1NaMlkw?=
 =?utf-8?B?SzVoSXJJc3RFTXQ0dC9ZNmNOZHh2ZWhEb2ZqWGVQSnZEM2tUNjdFWmpjSkpO?=
 =?utf-8?B?V0FoMHBkTmdUQXNySHlZK1Njc29IZVQ4Nld3MzNOVDBqSm51M0I2UGhWQm11?=
 =?utf-8?B?SGdvL21lVXdkb3ErcE4rVzFYQllxeHlGMHJKVXh3OUZrb2RoRTlhVDJnU1pa?=
 =?utf-8?B?d0dyMUY5SGJ2Z3BRd0hjVlJRYjJ3aTh2WWl4MGFuSUJMUG5Xc2lDRHNFYjli?=
 =?utf-8?B?RVQ0SDBaMVgvRUVTd0ozM3B6ZFVTMURPRDZmNWdiVGRTckZBeGl5RW9vUktu?=
 =?utf-8?B?RWY0anA4ellaVzdiVEVOZVlnU3NhU1I5U1ZpYkhSNlpnL3lCRnZVbHZBRjd5?=
 =?utf-8?B?VDRnRlNXRlZEYjhiNmtnd3FQN0xpNnI0TjJCbmZWQi95dHdnejFQTG80MkJ6?=
 =?utf-8?B?MTdKSGhrOHZMb3ZzcWZzbVU1T2NjaDZuUTlQWDA5MGZGd0pLWGkyWFoza3Q5?=
 =?utf-8?B?V2EvNklqUTh3NElqcUFVdC9HQm1YalVkd25raUsrOXprU2F4SENTcVRHUGI5?=
 =?utf-8?B?eHBDKzZuMGMvNjRaVHdpTkhtQ3l0ckVseEhXdVZvNEs2aUp6RkMrSmkrQ1pm?=
 =?utf-8?B?WWlNL2dQOFErRktoQXFyQ05hcnpQUHl6QmM4a2laaWp2QlJTQXNidzI1MHVr?=
 =?utf-8?B?T0x2RUZyUXQyMFdrZ1R5c0MyV2Znc21OV2JIRyswRXQ0U1VqbWROMDA3SXNJ?=
 =?utf-8?Q?q8u/VZHoIL1fbUiM=3D?=
X-Exchange-RoutingPolicyChecked: cnh8S5wlFK3yo1KJ2lUELOCK6AiUN5QCQjN+ZYaP5iZM0JW2umo4C06sXAq/Kilaa9wqDZAWGDyQpxM8+BLZI2qtuIT0mz8jQYA1XtLlsUi9Cbh6J03RzYE2+O3Zvsw/pSshM/HMgM7/sdnb2OZk/PSxSuAt0c0t47/71JtO2Qp/MqDSqe8tcQ455P76OMWYldVt8d5QgWNmejo7t7NP8ByTj08H4q/rebcJ1ST+ZG3MIESqQqPufWlhq+b7d2J2xTMswmjOPpQsH/qD0qJpIhnc+zSactTG3nvXsp0Ep8oRbpaH7pMm5Swrfkf3wPsdkDYPflAYCxvOOY8cI6LfHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 021fc04b-b303-4e21-4090-08dedbba6398
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:57:51.8035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jj3KDu24GdLfrB7Sp/KKMwAEC3/ntIyhv6sz+NN2gz0a6ET42mj/ZXIUMY6YM9prheUHe2OAPg0mfYY9NC6X71jwdEBwEXvH0bbnm4jnGC0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7830
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


On 06-07-2026 02:06 pm, Tauro, Riana wrote:
>
> On 30-06-2026 17:25, Mallesh Koujalagi wrote:
>> Replace the open-coded drm_err() call with xe_ras_log_wedged()
>> macro so that wedge events are reported through the unified
>> RAS/SIG logging path with a consistent format, CPER severity,
>> and errno.
>>
>> Signed-off-by: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
>> ---
>> v2:
>> - Rebase.
>>
>> v3:
>> - Update message in xe_ras_log_wedged().
>>
>> v4:
>> - Replace XE_RAS_WEDGED to xe_ras_log_wedged. (Dnyaneshwar)
>> ---
>>   drivers/gpu/drm/xe/xe_device.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index b6e49309a99f..7538ac7c7dfb 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -62,6 +62,7 @@
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_log.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1428,12 +1429,12 @@ void xe_device_declare_wedged(struct 
>> xe_device *xe)
>>       if (!atomic_xchg(&xe->wedged.flag, 1)) {
>>           xe->needs_flr_on_fini = true;
>>           xe_pm_runtime_get_noresume(xe);
>> -        drm_err(&xe->drm,
>> -            "CRITICAL: Xe has declared device %s as wedged.\n"
>> -            "IOCTLs and executions are blocked.\n"
>> -            "For recovery procedure, refer 
>> tohttps://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>> -            "Please file a _new_ bug report 
>> athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>> -            dev_name(xe->drm.dev));
>> +        xe_ras_log_wedged(xe, -EIO,
>
> Error code is changed for wedged.
> Please take a look at this patch [PATCH v2 1/2] drm/xe/guc: 
> distinguish wedged from recoverable cancellation - Sk Anirban 
> <https://lore.kernel.org/intel-xe/20260624194618.2793571-5-sk.anirban@intel.com/>
>
Those patches are called 
after  xe_device_declare_wedged()-->xe_gt_declare_wedged()-->xe_uc_declare_wedged(), 
I need to take a look.

Thanks,

-/Mallesh

> Thanks
> Riana
>
>> +                  "CRITICAL: Xe has declared device %s as wedged.\n"
>> +                  "IOCTLs and executions are blocked.\n"
>> +                  "For recovery procedure, refer 
>> tohttps://docs.kernel.org/gpu/drm-uapi.html#device-wedging\n"
>> +                  "Please file a _new_ bug report 
>> athttps://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>> +                  dev_name(xe->drm.dev));
>>       }
>>         for_each_gt(gt, xe, id)
