Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F699F43857
	for <intel-xe@archiver.kernel.org>; Wed, 15 Apr 2026 16:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D11110E04F;
	Wed, 15 Apr 2026 16:10:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TOjNiPYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B7110E04F
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Apr 2026 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776269457; x=1807805457;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WrjxltwNgR8KTdKZZjSU0AIHM24y9BxQhNSrUC0Q6to=;
 b=TOjNiPYjcWjV0zHHbgB//B2xVBFKyA9W8iPyENTKrIIwbNFBvUu38MKY
 nQrBCK5fg3ZTkier8cbgSSH/2PplDIHt9/QGRjfXQxStyLcVkuib15LU8
 jpQM2gQLInYmd0mz8tRRqohwG512+lmAtSk4lM4djbsPjfpQpKppt/bGD
 LR67gWLpfy2us5Hq4soUnvtmreW4Fl1NMs4lMqYeI49Dtx3AcTzJNbPB9
 fjrfye/uyiNNKVqzlkz8Rx3q6/TNRDxmn0fuO8BTzx52kMxoO0uKhO/9s
 mtssh2STQ6VK/em0YxmeqXYH2D7QWRRRHIfti4XQ971a+faSMk0QtnDLw A==;
X-CSE-ConnectionGUID: sSHeCZx7QzaXqlwDMK8WWw==
X-CSE-MsgGUID: zOVDo9CpTGmp3s22QczvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="81126403"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="81126403"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:10:52 -0700
X-CSE-ConnectionGUID: Kl8FJEYgTZSTz5ryjdeH/w==
X-CSE-MsgGUID: FdlIpUE/QNmfiHc0SsfEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="230392947"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2026 09:10:53 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:10:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 15 Apr 2026 09:10:51 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 15 Apr 2026 09:10:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnDgAK2sPIZzVS2vPhunsRgrFgClpexLh5/vcspkaT83DN7hTMV+BuhgzQ0C/smjX0VzJYYoay6zS9D4i/8HTRWJLzvuJdehpLdreTrRznqVZz2uQ0k8exIayq/6F87P+J37UPxPkQqYSZPTh47TaLpau39WQQ+kv9Vb2bySvTrLyRgaZKee+hD2RaFiYtBR3s7XM5htwzyktRkFDbu1BDs1ICaCYwda5jXh0XWPpqUOSw84wkwlnSePOgdNeXVT2P6OwzLuU95nVIkNKiPnTtovBnk/gIlFUAEA/4a+VZn/NmbDMWJH+RQrkwItHQmtUQUWuRIBk9yIECDIrogX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10AuBxEOOceEn4AaB41Tb/KKIRCAeyp3cCLztWpYzpI=;
 b=J2sZAa7LhL4cjQFI2YtA4FraSyiVN9pmdNerLp4V8aau2RIiiPBj0e9Hj4CiLau6MWEguerh6VvjsaBn4l29q48lOaeyvrNBQQwtweMf1WudQk8AiD3QbxbIa8RabzHdboXLtZxfvC8+l/VWzIzDpb/nBTXdvLCzSHxNHkf68+aT/sv/j/K4YtzVW9NJn5D0zfTiwgjm7t6QuyDXkjb2nJuEehLUEXbtYqqFftQU9ZpoyD0SbR942gJu6r1fs4PmXanz6SgZq9npIDkX7cpuRnsAjZYX9yeUhcq9B0z3gn31BXbeSb+nhNGWVd4QGLHG1SKJod/UtbyBP8OODDlBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 16:10:43 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 16:10:43 +0000
Message-ID: <b30043f7-9143-4cd9-bfbd-38b6c5077153@intel.com>
Date: Wed, 15 Apr 2026 09:10:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <20260406140722.154445-8-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260406140722.154445-8-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0137.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6609:EE_
X-MS-Office365-Filtering-Correlation-Id: d89f34b9-2a75-410d-c73e-08de9b098b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: sGLnLplG7A9xelVhuJ3uSbhE7yHqpOfsgZv9qQonWAblhCxA+RLVh8ZK4TFK4uWr8NjljlCZC8CDiXkVRrbexKRlhV1wtXHbMmklR8uYmCrutXopTdtdnI0FfAwz78atWyvJ93omgHhD31qodeZUEm+GqgXhPWzL1Hb7c/e56QzmR6bVwX/hlhWUT/Tzj2E2P+QxJOT7aL38XTJ5V2g+tp4Yu0jActZp2IAePdBJ0oVxw+LKKaJ/+cggJIK1b0uno2iJmyXbV9l5JDOVdGhO6M+hPbV+rURCle+Bu7aRmT8OL84pQ9jIe6MK1zQFJW/7iCoSKLLAeW0nq9yLfelql4H6hamwdSZ4/rowzVHni900wvQat/ZLvSUdhfXP1YWmFG6SyawYNg6AT4Joyhi+BjLgT72sAJdRWcmazWegWeKOjqkWwmAu2ukm8KAyO22zmLrkF17NgT9TwGCTQz9dkNwGhYIiBIOoxgaAYUV4Ets93HzRoAFzfMQimJZR2sa66vEUmI0e2MglunwcQ/Puj3WDH+JapN5LGuQ9xcA72jvD1KyiD6LNvKm5F3BgKc+KEviS8X44PSM48pLetDSnvuBAJFZpHmuxmhzVlzei8jtgKpyBkFHORmxZJU7AgY4y9A8esIoW7gBDZp+s8vytcci+LHZJvzU5Np0DGLN7oAGNBAbGFDNU1FquGtOMb4KU9Se1/bfrIlXHR8cD0IH5v4bUVrosm3y9GDHDoyzWfQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGx2d0o3NEhiVzlVNlpVaWVwOWJSU0Q1aXV4MXdyb3FvNjhoS0hLc1pRR2xS?=
 =?utf-8?B?eWtQbDlHTnNVTEVycmpTdjRGenpUeklldy9NTEZsTlV2YlEzRGFRY0o5QVRm?=
 =?utf-8?B?UmpIVWJvUkY0M2RxSVFqNGUrbnIvTE9CWTFFcEZSWlFLTW9uZ01Md2FLaHlT?=
 =?utf-8?B?eC9oRmZDMWRIRUtRdXVKM3EwVlJTb3l4RlJPOE9PaFRFNGxvMXZzK2I4QjhR?=
 =?utf-8?B?VlNhVTdnekI2blU5ME9uUTVVRjFHTVFzUEdReVJnOUk4VmJWek1Cd0F4a1BV?=
 =?utf-8?B?dlNtUWlVcnBBMjJWQVZBemFsUGY2K05najlxQ043SDF1VFdUWEJlRmtxR21H?=
 =?utf-8?B?cWdtVHg5K0ZQZTY2UUtWREdVUDc4Rk5GV1B6dnQ4QXdVSWI4UTRKOExyNHVT?=
 =?utf-8?B?Z3I5UnY4Ris2d2pObkFQcHVXN3FoT3pHaExvMUp0bUtlcHN2RFFoQlpRdFYx?=
 =?utf-8?B?OEE5NVN4TXpXa2lKSm95UVZIOVdIRE9nL3QrSWRudHM5TDJrZVAzOWFsUklZ?=
 =?utf-8?B?dmgvMzNNblE1WStOeWJualNCa01vcEt3cHZMd2svVkh2OExReElFODRJKzkv?=
 =?utf-8?B?Z2lXdkxSQlVLMUF3cWhKNUc2U2ZpSFJkcjJlc3RjeUF5RHFqSHJxMzNoanVP?=
 =?utf-8?B?UkxXaGJhdDlPVXB0V0MyK0wvRVdFamU0dm5BdmllRDMyQlJUWVRid0xNbFdo?=
 =?utf-8?B?ZVBhYmlES1Ird21RN2xIbGhPMU5BWEl4Umo5b3AxZ1ZTa05TWVRwYVBqd1ZU?=
 =?utf-8?B?aTBhQk1ZNXRNNE8ra0hUTWEwdDJHMEdteXRiZTFpSzI5SVBUS2VVV2Z4c29D?=
 =?utf-8?B?YXE1OG5rN1c3aURxeWNCY05wTUdJdm1kVlpSc0h4SEFRT2hONUIzcDJ5bVJW?=
 =?utf-8?B?V1NBekpYWG5lMnNPck5LdkVYSnJzSWNnVWJ5WDhVZEpVZFlkK2YwajYyOGpM?=
 =?utf-8?B?REhYbmxrNkZsVnRWbGtnWEZDUVpQL3k1TWNsUEJYZlloOWVLTmk5dWFLM0Fr?=
 =?utf-8?B?THo4NkZwZ1pqam9nM0oyZmdXMzRwV2g0V0NiV1VtSTU0UVFZTjRrR3RMU0pI?=
 =?utf-8?B?SnRqNE4wS3Q0bmxuM1liZmFwdjZuOXRFQWRkSG1SbFd6RXhBSkx6cCtSUlNB?=
 =?utf-8?B?aCtUVCtFL1NnNVN5MDdoZ0VQKytMcjZSMGFseUo3cUNydlhTTFIyOFowS3NE?=
 =?utf-8?B?ZEZPQ3g0VmFZQ1ZnY1pKNnJmVWJrNnlzQ1dtYW5BWEl3bVhuSlhFamtoSzRp?=
 =?utf-8?B?L0ZLVHkxNVl1WkNGRG1pQlBaV2F1RXBjQWtsOFpQdFdpOGhMVVBnTDNpMUlD?=
 =?utf-8?B?RW8vaUhZT0RNWWNDaW9YczVhWUt5RERSbTRiVVZLVFJXN2tRbmhYTXpFVmRi?=
 =?utf-8?B?RlREZXhESFdZWDIzdXg2WHVZYWR6QWt4ZzYvMG1EWHRxOVplL3NGZmJpYjA0?=
 =?utf-8?B?MllRSFZGaVgxWWxHSFRrbWJ4aWJOc3lCYTRBWFIxb3hEWUttQzdyOUF3S1Vn?=
 =?utf-8?B?aGtORlJ3U2JDN1JjT1ppYWVDay80cUIzOHQ1UUViVjluZkhnODNvRG1MQWxu?=
 =?utf-8?B?T1k3Zk1uUHRZNWEvWFVSMGRFWk5WT1ZmTjdQZ2NnZXZ1WS9yMXEvNFBodmNU?=
 =?utf-8?B?Zjh4MHZ6eXNad1hCOGNHMXdSaHI2WTllaTVnbmRNMk93MG1QNDVCdG9Xb0ZX?=
 =?utf-8?B?TVdGVHdSQzRCWkFzMEJVWCtTWlczb2hYNGFZNCt4Q1hPYXZSeEd0cFpmVjg5?=
 =?utf-8?B?d2NYYUZYQ3hSNUdnbm4waVliUG1OcCtneWNsc1NMWnRJS010a1BKZEwvUXc4?=
 =?utf-8?B?NGJyb25laXV5Tm05QkJSaEJGSC9SWVRIN3oxdUZiV1BXc1RkZkw1NENyUDUw?=
 =?utf-8?B?TzlyQkRqY29hSS9qQTJnUnp0aEVwTXZvU2xhUEpWbW1xZzJKUC82UFFYNms5?=
 =?utf-8?B?ODN4MGQwNUFZaTJXMEF6V1Jtc3ZlOWNqeDZSbU9YSDdnYlhjYnVkRkQvYWRs?=
 =?utf-8?B?K0M5QUkwQ0Y4ekV0Qk9yUlVkTHpoYTF0b1JrT1pESkY0Nm9ia1p3ZHU2VnI5?=
 =?utf-8?B?NnFMcjNRNWNzdW9sbGphaDVnbStEaC9RUTRrNUhqQTVaKzFwTDhOelc1bndL?=
 =?utf-8?B?WnczVC9HeWtPc3ZqNmpHcE9ZTEtra2MvUW51dWl0TU5aVnFVVXJsU3dPRmx3?=
 =?utf-8?B?ZkduaEEwcW55STRBLyt6eFYyZDQvY0dibUszYU90T3lIRmtUZkhDd1JXOHV5?=
 =?utf-8?B?cWUrZzE3QTFna2FkQnVZbGlIUTZ4MllqcUNISTFlNUp2U0s5MHRoeDF6d1Qv?=
 =?utf-8?B?THg1QUx4WlJUTWxVSjVmNFduVTBQMzAwLzJDMzJ5cHRiZjNIdkN4cGIyaExE?=
 =?utf-8?Q?bLHa3Hx2+tB0M+tU=3D?=
X-Exchange-RoutingPolicyChecked: aEophXEi+x5JggQJDlorBUvjGx+vvQutl4c3F45JNMfWA5ok9bMioKmGqQxHtk5Yxxntn9LnubdJh0qYGb2WWwgls0AU64y6g5glmvfuJiKOhr8lspAyJF1hkpzRkVfTCuizv4Qq1idPUeUZSZD36DhM/s6xmq09HwLx3cIUIr/BGQVnRA6XnbST2o9ze3SpClWQia0TfsnkgyIi9jAio55DfslViwe/V83q45cTlxn2TrljbODBeWws6IhmyxxBEINxQ57MbETpJMp2VZpZs2C7rFKccAJFY4XQqUaRoTSsOudqNoMsaWlHBGjR8wHMBF6ERKUW4MrZnXSb0zQQ5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: d89f34b9-2a75-410d-c73e-08de9b098b53
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 16:10:43.1011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OrUOEpjKFCOI9MDdmknLeYHuikkwpzcf7gr6iCDPWokpR3wuYmHM7mnxfzIuo+7LZIrgUaYYEWNgsfdkiIBmpW+WEX1EfunhvavakLXN+uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6609
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



On 4/6/2026 7:07 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing an exec queue
> after PCIe FLR, introduce xe_exec_queue_reinit() helper. All the exec
> queue LCRs already exist but the context is lost on PCIe FLR and needs
> re-initialization.

Isn't this potentially problematic for userspace? If they have state 
saved in their LRCs, that state would be lost without any way for the 
user to know. New submission on those contexts might end up giving 
incorrect output without explanation.
IMO it'd be better to just kill all the contexts and be done with it. 
FLR is a full reset and I don't think apps are supposed to survive it 
without noticing.

Daniele

>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v2: Re-initialize migrate context (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c | 37 ++++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_exec_queue.h |  1 +
>   drivers/gpu/drm/xe/xe_lrc.c        | 17 ++++++++++++++
>   drivers/gpu/drm/xe/xe_lrc.h        |  2 ++
>   4 files changed, 53 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index b287d0e0e60a..dd99bf766926 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -331,9 +331,8 @@ static void __xe_exec_queue_fini(struct xe_exec_queue *q)
>   		xe_lrc_put(q->lrc[i]);
>   }
>   
> -static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> +static u32 xe_lrc_init_flags(struct xe_exec_queue *q, u32 exec_queue_flags)
>   {
> -	int i, err;
>   	u32 flags = 0;
>   
>   	/*
> @@ -356,6 +355,13 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
>   		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
>   
> +	return flags;
> +}
> +
> +static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
> +{
> +	int i, err;
> +
>   	err = q->ops->init(q);
>   	if (err)
>   		return err;
> @@ -379,8 +385,8 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   
>   			marker = xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>   
> -			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
> -					    xe_lrc_ring_size(), q->msix_vec, flags);
> +			lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state, xe_lrc_ring_size(),
> +					    q->msix_vec, xe_lrc_init_flags(q, exec_queue_flags));
>   			if (IS_ERR(lrc)) {
>   				err = PTR_ERR(lrc);
>   				goto err_lrc;
> @@ -402,6 +408,29 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>   	return err;
>   }
>   
> +/**
> + * xe_exec_queue_reinit() - Re-initialize exec queue
> + * @q: exec queue to re-initialize
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_exec_queue_reinit(struct xe_exec_queue *q)
> +{
> +	int i, err;
> +
> +	/* Re-initialize submission backend */
> +	q->ops->reinit(q);
> +
> +	for (i = 0; i < q->width; i++) {
> +		err = xe_lrc_reinit(q->lrc[i], q->hwe, q->vm, q->replay_state,
> +				    q->msix_vec, xe_lrc_init_flags(q, q->flags));
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
>   /**
>    * xe_exec_queue_create() - Create an exec queue
>    * @xe: Xe device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index a82d99bd77bc..445867d4da26 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -34,6 +34,7 @@ struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
>   void xe_exec_queue_fini(struct xe_exec_queue *q);
>   void xe_exec_queue_destroy(struct kref *ref);
>   void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
> +int xe_exec_queue_reinit(struct xe_exec_queue *q);
>   
>   static inline struct xe_exec_queue *
>   xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 9d12a0d2f0b5..a6421ac3765b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1593,6 +1593,23 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>   	return err;
>   }
>   
> +/**
> + * xe_lrc_reinit() - Re-initialize LRC
> + * @lrc: Pointer to the LRC
> + * @hwe: Hardware Engine
> + * @vm: The VM (address space)
> + * @replay_state: GPU hang replay state
> + * @msix_vec: MSI-X interrupt vector (for platforms that support it)
> + * @init_flags: LRC initialization flags
> + *
> + * Returns: 0 on success, negative error code otherwise.
> + */
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags)
> +{
> +	return xe_lrc_ctx_init(lrc, hwe, vm, replay_state, msix_vec, init_flags);
> +}
> +
>   static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
>   		       void *replay_state, u32 ring_size, u16 msix_vec, u32 init_flags)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index e7c975f9e2d9..514355ce3d6a 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -53,6 +53,8 @@ struct xe_lrc_snapshot {
>   
>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> +int xe_lrc_reinit(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_vm *vm,
> +		  void *replay_state, u16 msix_vec, u32 init_flags);
>   void xe_lrc_destroy(struct kref *ref);
>   
>   /**

