Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B64AC79FB9
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 10:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5E610F3F4;
	Thu, 10 Sep 2026 10:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeP37498";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D398810F3F4
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789035635; x=1820571635;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bF7bmKV7xUSw+VdxUp7Kv475CxNTM2AaK+VvO8OH1gM=;
 b=DeP37498QCtEtcPw66JW/jqOFh49+KF16EIP1SoMUfyAaLl1eg6Jl3YJ
 CQxML+sEu5wtijXlq2FpZtpetfV7cYUbjAWG+CIe33evA3KAX4Kx67dju
 qvoILpWW1WANtTpyQE+fusD3nHfvCwkvlTYTw/HKXhZuBubh9r9ufAs3K
 8q0pW5h9xTcXWq29JQVYRgfrMHeYszQvsxlSaVbzC/mY3r+rxksEJItb4
 K8VrxVU/89ABQoW8hHA/WZt0tiifA7lNz/duiqXb898ZftfxEwqGx78hd
 +oi5okobqCc3s2ADgo0JiB9EAoukgdJCDdro6nwf842xII04p0qX67IYw A==;
X-CSE-ConnectionGUID: pcrDcnh6S3G7oWvHaxgMCQ==
X-CSE-MsgGUID: /UOb8hwxQuSR8CZ3ZyaW4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100073294"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="100073294"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:20:35 -0700
X-CSE-ConnectionGUID: 2EfctjnZQLexFBlHX3vuqg==
X-CSE-MsgGUID: nULOL98gSPGqYzeDxgMaIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="272097998"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 03:20:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:20:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 03:20:34 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 03:20:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvpjM61/XT0OPFQXN45m1XxE+WbYhTjYc3XL0S2UGP1Sy9T9m9oTiOZdJkeXzSmt+mrfRKEWs6Qsass9wcqCTcdCe8TNYnGXmK/YAa/WekuPrXjDp6QGyeQ86w3i49UAABIo6U3LYzHsLr5yxKV1rI9rSihly3MTwTKnNWSpDkFVpB3mtuvang7ce2qqO6DqKuPEWQc+LQiseBLsyXaw/9xUck3b6Cse0s3BkjErVzEyrdCAq04NlI0h/gaQU15tisGFMJnsD+1sWjej4L2yrC3aWDNXIJ2TkjblBOXJIYPZfpsQEPS6JQDcL+ci4WRQE418Sf7+BeDZtE37+gWLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwmTJNA7ZJ/VF9jtX8zyKMTNruoGN80kvLdGezcdDOg=;
 b=ufAGLp1IUNwXX3f1jC87sPNAT0jhaLDvL/XK6oHEB3wM1kvpNNJ0wFpViOvbioZjy9zGyOA9qF+Wq3rjlX7cIBVOGd9Sdgfupl4d+y2EEowLGAcTDiIZLwMyMUf3LNav0frRe5xQMaGTvqncK+zjIpYs1MfvC9gzyEDBoJAJXygqITmFsjE8b/vouo0eAQ4bKqmy66OTdqej33i6IdvSsT5USxtlkVxRo/UbmzpoD9zx0WLLi47Blyt40IrBz7q1F37TQ5nvt7+wO/8/xaBfAkEkj5JeTSMccNolLOIOJveFm1VjRIn8gfP957UaCq31Dp52x4T36C9mmTmCvr1ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22)
 by DS4PR11MB204441.namprd11.prod.outlook.com (2603:10b6:8:514::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 10:20:26 +0000
Received: from PH7PR11MB5885.namprd11.prod.outlook.com
 ([fe80::9e5b:e01e:24c0:204c]) by PH7PR11MB5885.namprd11.prod.outlook.com
 ([fe80::9e5b:e01e:24c0:204c%3]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 10:20:26 +0000
Message-ID: <62f487d6-a673-47ef-91c5-66232a0d910e@intel.com>
Date: Thu, 10 Sep 2026 12:20:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Fix wake_up race in handle_sched_done
To: Jakub Legowski <jakub.legowski@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>
References: <20260909070825.228551-1-jakub.legowski@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20260909070825.228551-1-jakub.legowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0057.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35a::15) To SA1PR11MB5900.namprd11.prod.outlook.com
 (2603:10b6:806:238::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5885:EE_|DS4PR11MB204441:EE_
X-MS-Office365-Filtering-Correlation-Id: fa79c26c-8da9-4473-75e5-08df0f2518dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ycRwoxhr/cDbGaptQIUcL/FtkVI2BneIaRCLxMWyl7bxgDGjxSd10X6ZHGGezFqlTvUlt4yk1nNWEw3N14Qj4kE41oSxsLRy8AZUS9Woda85W07M/cDleHy8OW1P8BKut+AEluHMgr+OcPDyXtuIu76bPV+LOujC5Elh+ExAptK8x40bqPso5qsYEWQdA8x2hm47L6Jz9sygtD2cve/fT3MjVqkveFG3ZSjRkKG3gNkP8sCUymv48mcOlgnPzDJx18rUGNIs85bUMPe+V7hZ8+gDg4Qqh2C7IpCYSuV3N8AFbRJnyf/uRjeoKPrYWwn3l+qptBn01mp+tr7MRhpxd6yZD5rMgbVzPiI0/QP4Q7LT7cUFTXuOA7oIwdb4mI37bF1d+selVMM6XJzsMbqEmeZ2Sq5ICY/UPDqOZtqCoL3AMAT6YkoYoO8BF6X3kbLODow6wfq/TJEEqTtG98pTgBnfRlAcVGF1G1nrYSYzxv9zOBAsKT9/pZ9zEwX2Jm8vKZdlQt2i4/ijJ2M0Mjuofzp3mm/QotYN6kd18MGd5ppiDJMDgqi8gBCLVOuiAak1Am1qJqv8FvbUBK6ocCAfH17jh6MmuL0/FhGh8lZWDkN7HRACvJCmy2IQhpv2sBbvqHIqDKSPHMkVHO7yq/C4T62cUW9mB8utXvfH8WFUwtA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5885.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHNjeDYrc1ZYbUVUWHJSemx6NVg2Z3MxRWJHbnJVQzVVUXlXVWhibTlTYk9z?=
 =?utf-8?B?RHQ2cHBFMFBmMjRINDRVdmdPRW1WLytCTDVmYUdyT1lOYkR1MWt3WkdGU211?=
 =?utf-8?B?T0M1STUxbXRvc3d0VFQwaFJIVEZyK093WWpLRHRGaW84bGdVM3BkYzVPYVlU?=
 =?utf-8?B?Y1E5L1VqUHBneUdJTDJVK3N6QVFPMThYanFjU3FxeUt5cmpYSGd6SFR3VWhV?=
 =?utf-8?B?UkRTK01icTh1by85NllxSlRjWVE1dXZOQlBuUXJIRkpyM2NtV0NVbzJkWDFR?=
 =?utf-8?B?VitjQmR2VWRGM2lHWWdmZENJTjlTSG5mTnhIaFVVWE1seVBoV21HYW9pTTlW?=
 =?utf-8?B?K3R6cjR3ZWpiNmI4c1VlZ3cwZGZaZ2RVUldlYUMrK0orQjhpZnZHSFd6ck9r?=
 =?utf-8?B?N25pakw4OTF0QUtwUzlQM0gwdVNxMEk1NDRrN3dSYjFHbjVjaVlrOFB4Ujd0?=
 =?utf-8?B?cUZmY2hUWjdJNmJGeHF5QUFIVUxPbXJWL1JZbG5YZENiV1NIU0RCb0ZsbFNv?=
 =?utf-8?B?NFpXTEo1RDRMM0RZMkp5cjBJK3U3NXNvN1lGTnlZQmFpeWdUTjM1WUFjaWI4?=
 =?utf-8?B?c2sxMW1qM3JOYmJMUitzeFN4c2tWdk9xT0U0TC92OE11azFmeXJEMERPbG1m?=
 =?utf-8?B?bVF4dzN0VjRuOWM1Q2pwRGVQaEJoV2JRZnJYaUw0ZWZ4OGRIMkFqN1oyR2Nw?=
 =?utf-8?B?K3J4WEJyNlpFUEd2OGpKbFNQMTNDczdQbnJsaCtWTE9zVkMzVjRMSTJWZFRS?=
 =?utf-8?B?SlVvMUJhY3RJdStFa0I4RGwyWjc3RWtIbmJWeXlFWktxWGVGeVY3RXhqSEsr?=
 =?utf-8?B?SURuS1ZidTIxUjNTbUpZbTdreERDNXFqSkZRam53RlR1bHpKTlA5WENDR1Np?=
 =?utf-8?B?a1E5Q2NuSHlIUDN6dkIzcElRcStKM2pEdDVBbjh3TWVZOHNtdlFwdW96TktU?=
 =?utf-8?B?M1hKMldMUkZ0bW1Qbk03Y1lnbkhFb2FRV0pqbURhRmcwQjdCRzdhK3U1dnI1?=
 =?utf-8?B?a1hpb29SRVZnZmJvTUFhb28vZXJmMmZsWHBHTk1XVjFmUENtcTV6M3hFL2Rl?=
 =?utf-8?B?ZUhJVUlwaHBwOGxLcnlSREIvODNwK0JxVWEzam05d3RqMjN4N0ZZNnd4bEsw?=
 =?utf-8?B?b1dmTXRHOXNEMEF0djFPMTZ3b0Q2K3IybFJlUlppbGdWM0hBNHdRc1hYbEIr?=
 =?utf-8?B?aWZDMFh5ZzVtYUdETzhpS2FSQXRVQXlNVFBEZW5Wa2NGc283bisvbExNVmZU?=
 =?utf-8?B?QzUxcnoyMkhRWnNPdzF2MHFBMVRGakkrdzZOTnJyNEdEa21GNUw1VzNzV1g2?=
 =?utf-8?B?Sml5VGkzRWNrMU9peitKTlg4Vldmc05mdlp5dzM5NVovaVlVM0JDV0xUNWht?=
 =?utf-8?B?bU1SdGRiUXJRcHJyMEhQMW1BTzEzcUhYd2x4b2hTaHo2bExPZ3hiYUYwVHZX?=
 =?utf-8?B?VFNFVDRMZE9KY21yRjdoMlkwQ1NwNzJJNXVSN2YrVnBzTFZLa0lJaVRnNDlD?=
 =?utf-8?B?bWo5MFAvd0lHWXpjYitjQktDdEFXQ3JVMUtKYkhtSkNnSGxGVk93ZkFwcUhu?=
 =?utf-8?B?MlEvY2J3RVhzL2MyMzlQT1JQQ2k3L2h6Um9pbkVhaVNSZDVMQWd5dFBRVTVZ?=
 =?utf-8?B?WlBoaTZFUkQ3Tm05bVcveHJJNjBzRHBhaTkxMldTWndZcWVyaWdmTjVIVFhC?=
 =?utf-8?B?ZDliNGVXT3B1d05tSm54NjR6MkZJd21DeEdIQWxDSmxlcUhlUFpBM1lCN2l0?=
 =?utf-8?B?UkFXVVFpbkxTc2hjUkxaRWZPR2hwSE1uSE5GTGdCRy9zcFg5Q0hkNGRMTVRz?=
 =?utf-8?B?a0RXcXc5Z2tBTHdrZnhvak0ySDZqMlVWNkJKL3pmQ0RZVTRFc3pNa2ZNeVps?=
 =?utf-8?B?NC9NYXU4SEVqdE9jbnVhZFR0UUQ4RmY5N2RTdVZkYk9QUUFoS1BmTVk0eE1n?=
 =?utf-8?B?L09tM2xVNTRFSUpZblpCbVJNUEt3Q1FjU2lPN3BrbUxFSWsvL1lBM01oS1c5?=
 =?utf-8?B?T1RJTkF6dnd5OFBYM1RiRUQ4TzE5NHAyMDBMWjlKcFo4bDZTYy9Xc0VUUDhy?=
 =?utf-8?B?RzRrbjhaQ2l5TmUwMFc4OWZsNGo3Wi8wKzQ3ZndYdzBPT0pnWmlUdTcyTStE?=
 =?utf-8?B?MU5yY3pyS3Q1U0hsNjdsZmFpSDlzU0pXdXVJSkE5cTBtU3JwOFVIc1pqb2JK?=
 =?utf-8?B?U2gzQ3hVV1FKbGtWZ3dqZGFiU1hTN01vUW56ZmpqWEhVRUNzWmJpRmZXd0Zl?=
 =?utf-8?B?ZHE0TlpuV2Y0NStrcmpVNXpRMEZMcVBjaVVxZFg0aWwxNVRpdnBMaFJ5bDhp?=
 =?utf-8?B?RU1JeXVMa055Y1VOSVN5ZVhLT3FVZlBES1d0WStBNVFJUEpEcFp6OVFJdVFh?=
 =?utf-8?Q?HohyHtxMwaHqVqPY=3D?=
X-Exchange-RoutingPolicyChecked: gmEj+h69EhNNkmaDjqE0QIBZ7Bm5Q7dRvZlj6kyxhMorrpO9lUSXH05TnWGJPW23y5tlKYoGT2MIh271EQlk2oS3NT9PyS5tsh4NOBCyVYLKAqzxvcg0gBwYWWyKNI/a8oWUNyvyAmauvg49jmUR1uJpZ4BhWKPMdZ0MF1arhpno5R4tv+PiD9WHRksw3OQYCgmnq3KHMkNlsqs87/+14aBcN7yfKs8lb6mSm8NXhmel2ekjph1aNparaAHF+Soup4FMKtAkx11vV+9ib7UFoWxRZc0EkV31R6DfcGCN/i7YWMSm+bB4z8bStnRRPglR314i/knTmRKSXLKxQf1hPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fa79c26c-8da9-4473-75e5-08df0f2518dd
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5900.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 10:20:26.4163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lU59nrzX7M9pmGRKdfmqOahWeZTWurWs4rkxj3c5k8vZznRbQmmH4EfrzuIJrFWZEewJn5Ihz4n1kWO2DjibkORJP3fFxKgVdDbekWWYtho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB204441
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

On 09/09/2026 09:08, Jakub Legowski wrote:

> Move wake_up_all() after clear_exec_queue_pending_disable()
>
> When a SCHED_DONE G2H arrives for a banned exec queue,
> handle_sched_done() calls wake_up_all() before
> clear_exec_queue_pending_disable(). This creates a race with the
> wait_event_timeout() in guc_exec_queue_timedout_job() that waits
> for pending_disable to be cleared:
>
>      smp_rmb();
>      ret = wait_event_timeout(guc->ct.wq,
>                   ...
>                   ...);
>
> This was observed as:
> [drm:guc_exec_queue_timedout_job [xe]] Tile0: GT0: Check job timeout: seqno=4294967169, lrc_seqno=4294967169, guc_id=4, running_time_ms=0, timeout_ms=5000, diff=0x00000001
>
> Moving the wake_up_all() (along with its smp_wmb())
> after all paths that clear pending_disable, ensuring that waiters
> always observe the updated state when woken.
>
> Same as for runnable_state == 1 in the beginning of
> handle_sched_done().
>
> Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99d8c807ff05..a181b5042293 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3239,25 +3239,27 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>   			clear_exec_queue_pending_disable(q);
>   			suspend_fence_signal(q);
>   		} else {
> +			bool destroyed = exec_queue_destroyed(q);
> +
> +			/*
> +			 * Make sure to clear the pending_disable only
> +			 * after sampling the destroyed state. We want
> +			 * to ensure we don't trigger the unregister too
> +			 * early with something intending to only
> +			 * disable scheduling. The caller doing the
> +			 * destroy must wait for an ongoing
> +			 * pending_disable before marking as destroyed.
> +			 */
> +			clear_exec_queue_pending_disable(q);
> +
>   			if (exec_queue_banned(q)) {
> +				/* Pairs with smp_rmb in guc_exec_queue_timedout_job */
>   				smp_wmb();
>   				wake_up_all(&guc->ct.wq);
>   			}
> -			if (exec_queue_destroyed(q)) {
> -				/*
> -				 * Make sure to clear the pending_disable only
> -				 * after sampling the destroyed state. We want
> -				 * to ensure we don't trigger the unregister too
> -				 * early with something intending to only
> -				 * disable scheduling. The caller doing the
> -				 * destroy must wait for an ongoing
> -				 * pending_disable before marking as destroyed.
> -				 */
> -				clear_exec_queue_pending_disable(q);
> +
> +			if (destroyed)
>   				deregister_exec_queue(guc, q);
> -			} else {
> -				clear_exec_queue_pending_disable(q);
> -			}
>   		}
>   	}
>   }

Apply suggested changes by Matthew.

Looks good.

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

