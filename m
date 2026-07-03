Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71720C43602
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jul 2026 13:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3383B10E5EF;
	Fri,  3 Jul 2026 13:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1U/W6SC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7036110E5EF
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jul 2026 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783083738; x=1814619738;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aX/Ys8vaLA/CdwA0jigHucxGT5lMfCv6gkbuMu2oqr0=;
 b=J1U/W6SCcYNSy1U+aP1Wovp/l5LXLK/0Qh5Vgnn1d3Lf0f4GQLIe0YPt
 w9A3wkcD9Y1L5ZQ6e/pbCSdhwsu/qAsdaWA0er9ZhvziZLeOLiwMjfmz1
 M3LJ7YhpKY9lFrbRRZkc2xiSfaT+C12I/pPmOMCHipnQZcOYFNmFYVWAs
 5SLR2YyuwhqFYdI82K+EP7ZntSDgqGm/QxwVQWsUQ6KkNgyTHIquTrjwL
 3uVWk7ZlX1p0j1A6zNN1DaDnHeelc04qP11DjjpjFiM2AmtKLDmt3jvIn
 KJSXM/3ka6N7BImmRIRIy138qZaocz+D59WS/mQZ+ixPvrnXgFh7KmOJe g==;
X-CSE-ConnectionGUID: X+NY0ejAQnKSWiPV2oeJNw==
X-CSE-MsgGUID: rpClYVtDSTWX+hSiN2NjZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83819486"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="83819486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:02:17 -0700
X-CSE-ConnectionGUID: yeNw2fZ7QtGl9rPKqg2eJQ==
X-CSE-MsgGUID: Vsgmg6GyRX+Avqh+HHrZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; d="scan'208";a="277439114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 06:02:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:02:16 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 3 Jul 2026 06:02:16 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 3 Jul 2026 06:02:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JzCrF4P3wZPd9NTlu6fV6Z/yqx8ilk34YKIVgQpaXZl3HAf9cOm5qIMiIpZFjN8riYrvW0grM9XFKsvFhJtAegDgQKvcN/+I6S3pWieUEfhLEeaCQVw/fio5IZPURr7uza6t215uaCp+0DA2piX2R3XdarZdp9lNLPJKZVrh3WaXLSE8gz2ZIr81ycikWHkxnPb/on3zu8uM4srikbpr1CEGJJzHtXdkkfGdsFzzGf5lWsRJlCI4WI9d8OXZtvtMeUXB/I3x8FufuluXNXTP7rtBV+X9h4KXMy2HzYOw4JCAblQJsyX1KohrxYUN8jxqf/wKtKIMQD9A26bcXV5yDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12ZGbgBY5M0uGn4tTljT0Yft76ttMEJcATVxTyJocWI=;
 b=hL3XOOe5qUxnxu+QMrvDYsyjJk6a0AXYqX9YY+6nlcGbAinL6tQS/XRN6ynfM3Uv8z20AB9WTbP2sMsCK7Rwip84PYbDcgkNoQcUHw3t4U0WcKssJKOBd4JCS3EPQlTwX55+6meI/SrdxHf02qqYJbhw+qme5v5X5eJc3j9TQQaqpYdrkve0BDx1UFekVSepSvgg4pe8M5BtIaCEfFx14mrB+jqb7nDg4+qTpwYBRuhqUqjw+saLiV6B6dVqRORGpi1IMu6yvmt4+VStp3h4nX9tteuJvcVCe723jZBHLaujUCSFwcwHhm1zjGlaRpWdG2B5CcQpEjVL8tthqUc9VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 13:02:12 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 13:02:06 +0000
Message-ID: <44fb1c8d-2a72-4c65-97b8-b95ec23a9bfa@intel.com>
Date: Fri, 3 Jul 2026 18:31:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 2/5] drm/xe: Add RAS logging helpers
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>
References: <20260630115503.407158-7-mallesh.koujalagi@intel.com>
 <20260630115503.407158-9-mallesh.koujalagi@intel.com>
 <6b6e6259-a4bb-4d79-a87f-a8b21e22e923@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <6b6e6259-a4bb-4d79-a87f-a8b21e22e923@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA0PR11MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 8053352f-ed7f-4b48-3ea4-08ded903484f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|3023799007|11063799006|56012099006|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: fNLJO0XrxXWRPwlSpj5E16KoyUAJaIRs+2xUOr4c75JnemKrSBRdQta0r6DLwRQIeo1YJYUlTyUxctL9ZSuxO302L9u3BWrggJwg9iXGbeq3xe+gwyAZ1xml4een6N5N7kOxgszPlsKUVTc6F3DNFA921dTs1ukzjYkJhC/Z8jFByoJoPHpVqV5oQ4A8Wd+hIR3VZuQC09rvLZwJJn2JpRoouNqZNeIz3o785ZF7j3gXdy+aRoWUocU1cE4V/7NFo+Bb/vOdQ9EBXCIVdVPKD/V6xbJXP8cqhwkReR0tCnuJtYW87psIB6GZAx2XUtHsYp23YZ7bbYCNhHuZ6LzVpYDfp3UpGpuP/oCo+Q8tWjGEjhbJfLbgkgiGJt6JMHv6z0JfoRUT9mROZgT5e11p/jy7lHyGZIw37mlv/LXc0cHa/jvlsVw6XWJG7XHZBT2HMjtE8LqNe3CnxVtL++SSiYUuGzEEzyRR1/2142BHlYPi8P04uME/fddnkCF5ZRKFo10MMcAAZHH0/ZfJHBJfYYZ698Vu5lGGWZ/O/OX8JfYcdf7RWHN31uGOt6FOHnUocxxCyU2AD4epddV+gTMq5S0fJE4bLrn0jkxX8t7kpJEEMD+faQMGXJsBTLcVS0giGg4dsqt/dKPA3M0eiCiFfUrMqz8Rrd1AO68Pgcxl4xw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(3023799007)(11063799006)(56012099006)(4143699003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVN3V0NDeDJ6Q1NuMVpOaVNWbUYxeDUxYTdBWExYUm41YnJiRHUyREU5bmhP?=
 =?utf-8?B?Q2Y4Z2hmMXFKbHR2MTJGK0U4QTJkU05XTmFBYW9Gb0FmTUlHdjJvMUVrcUJN?=
 =?utf-8?B?UkYxekpUUlBUZTN2bFFqdHZhVzlOakg5cDlpdTh2WkpUK3Q0a2J2NUpkQytI?=
 =?utf-8?B?MWZVdytuZElUb1EvYVZFb3ozbUUvdUlxKzM4aEowRDEwVHBOcTJzS0hRejZC?=
 =?utf-8?B?cGxVTEhGdldhMUlFQlZLQjhHd0g5dVZEVUpLU2pGMnVSTDd5bkV3eitkQWk1?=
 =?utf-8?B?c2Y0dkFCNmxGSnVBaExhY0RKU1E1OWFMam9IUjJ0VXRVMEpKdlFaTmlKWnh4?=
 =?utf-8?B?MmRMelNyUi9uU0haaVN0czk0cFlISnM1VmsxaW9Razg1N3BpV3B6OTVSY1VI?=
 =?utf-8?B?SnQ1RDRPbmlHNmcvLy9CWGNXMCtNVnFuUGZSRkMvanlvaGhxV3F5anpCR2xK?=
 =?utf-8?B?WDhMN2VydEN0YTlUaDFYZ1pFNVU1S3N6bHJuRlMxQmxYYkFLYWcrNGVUVXQ1?=
 =?utf-8?B?NzZXT2orNnJ1cUR5WWVQRVAzajBaQzA5ODFiSktnbGdGalZ6anpvZng4U2Qy?=
 =?utf-8?B?QnluOGFldlZyU2s0UUtVa0xXQzZRTzJpeFRxQkRzMEJLcFRxcjJla2ZvNnZi?=
 =?utf-8?B?QUQxZTBHUmV6MC9vc1lobEtlZWFnMGIxczhxWmFRQys5bi9ZWFlXM2hEcHhT?=
 =?utf-8?B?VU51QVJURGoxN0RSOFd6QkU5ZWlQbURlOExOUmdqMlZuSVFXLzh4UU5KdlVl?=
 =?utf-8?B?ZG96UFRsb1Z6RmZlZDR1RTNDZDFkeDBGRXRQSjRsS1p6WXhHRklGb2t5ZWkz?=
 =?utf-8?B?NWxRQi9rQWRXNGQ2RHBaMDJXL3RteUNyMHF2dUViaTN2UFdtazdOTDFhZys4?=
 =?utf-8?B?U1hQWUc5Nk9Td1hUditkbkw0Nk5tR3AxanRSVmxZKzA3RlNJK3pWc09iWFVp?=
 =?utf-8?B?MmxseGZWZ1ZYQ3EwcWNnWHlaSFZuVE5oRzNUVVluSFJJTDl1VzJNYkNqMTZa?=
 =?utf-8?B?Q2dqMldsL0l1NGtPcWtVREFuTnlqdnhhVnFzWmJjQTBHM2xRU3BkNmhjWXI4?=
 =?utf-8?B?NUdHaEgzeXpvSGllaW9pQWZKVXIrbFBnaUhRdDJUYkdOWDV2M0prOWhMd3c1?=
 =?utf-8?B?R3hOWlloMC9lcUR1NmZnbGIyUXZldXVFSVlNRWZlN1dHRDl2Z3pKL1Q0OTY2?=
 =?utf-8?B?WDd0ak1jeXZvY2JHNEdCQ3l6MWVheFFkeXBRQysrcW9leUxtKzAzbk5Oemlu?=
 =?utf-8?B?YlpVcWVrQXRXc2NHK2EvaTNySTJmV2dvcDNqWHpyWmhpRExMNGR4UGNSTzJk?=
 =?utf-8?B?UWJUQWVHUVZEYXlZOThPelFCTjhHL3hZMEI1aGhUcWJtMlhrSTIvdU5mMlJJ?=
 =?utf-8?B?cDBQbFBIbC90ZWNlNE9QWk85RjJGYTcweFFHUm9wOTJ5UlJpbllnSVU2ejFQ?=
 =?utf-8?B?TkVQdXhWVitvakRBZXhmcVBRVWxpYUhxKy91NlBDaTRNNnpOMG45MUhpQ05R?=
 =?utf-8?B?ZlhLcHJOeEcrMC9nYm5IR2NlcGMzSFhETWRxNFRWZXBLUWpqb1EzV2pPcDh4?=
 =?utf-8?B?Q1psb2kybUtXSkkxNEtNZkpncXBiMHVlOHBqTGI5U1JBc2RWY0xIVGlFekFZ?=
 =?utf-8?B?REx3aDJYZkZQbTJnUXVmMTVLMHdGUC9SRkVUU2hrY0l3Y0JaUlF4NWtRTzNz?=
 =?utf-8?B?MDhnalFqNGF2R0lxQks0RmV2TkplVnkyM3E0VUIwb096VFE4bzl4SHJ3Zm9Q?=
 =?utf-8?B?K2RwNEhTSk5ySm9PWjlnL0NnWUdoMmVwMFNXUC9DSC8yMWlPeXhmSHFjMnJh?=
 =?utf-8?B?enNmUUJDckNnYTlrNGxZcmRTbTVJUm8wNXhrV3NmVXJ5V1h0S3ZuY0k4NExR?=
 =?utf-8?B?Tkxuc2FJTXVQbzhjODk4d3hsL25NL25OR2RrZXJCbnNoeVIvaVhjanhwSUh3?=
 =?utf-8?B?cmxZZUljblc4dXVCMnB6dW9GNjdBNWZ0WFdESlJxUEttbms0MGhCbE9Ka1dt?=
 =?utf-8?B?V3RaN2V6ZjNSQis0d3U0M05tWW5BeUhDUExmeUMxV1Evb2FBQkdUTitld1BC?=
 =?utf-8?B?VzFGNGxPbk5yM0xFd3dkb2RRZkVobCtZQ21JQ3BOSEtScytQdFU3eDEvTXUv?=
 =?utf-8?B?cGxpVjJaR1U5aHJZbkJ4dmJUcTJjaVMweEhIQ2h5NWtBajBUU1V6Q0dYQ0F1?=
 =?utf-8?B?TW1PSTlZdnkzK21hRnJsN0dBTTdwbmhDZkpaS1NLVS9YcndqZmtjMko5MEI5?=
 =?utf-8?B?aWJtVVo3VnNabEJvNmJQMmR5eWhFME5OV1lSNm91a2lHTHk2SFN6SzVGUHhT?=
 =?utf-8?B?dVA3MFBxUGYrOXNSSGNiSnVXNTRZTStHWmFWVGpHWUJqUEVTOFdkS0cvdVho?=
 =?utf-8?Q?ZZP9KVvYINihsOVQ=3D?=
X-Exchange-RoutingPolicyChecked: JWNULS/UpXKxoBRoQrIMsNp8Lj6We/yqYOOk+3Jhbmfhwjotazwm3RoOYL7SDtaEQMbOvsIURGiNW4cKiJsKgDI6dm2Y59++fszXVmw5MynyEJFbU9sLfnXMsKrxUvWYzfg+9o1867osmu02SdOaNrRCUNimG1suI20dFbt35hzT6rdDjzwluxs+LW99HSCjQjlZ99J1gEEaFdOknXus0gRh7oG7sbmpLreDKVBgSR9cce/s5M0bBRuBv8SZKW1yusBjPasZoPL5ch6TOAjErvBVOe7RqksAuYuV+zYpcKWFDGFbT3mGWjGMI6t2JvqrTZokbfOwUzky0D5gBeV7MQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8053352f-ed7f-4b48-3ea4-08ded903484f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 13:02:05.9307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJCGTfHoNXUYAAqRdfMxCP82W+t8wdRzRw1xqb0bc1nB2SMxw69/adaRFOLI1Va1VS6bhtc9umptDCvf7kaEdrhvYyOsauYaTn5dRf24W2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7307
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


On 03-07-2026 04:45 pm, Tauro, Riana wrote:
>
> On 30-06-2026 17:25, Mallesh Koujalagi wrote:
>> Add xe_ras_log_(*) macros to report Xe driver errors in a
>> consistent, structured format.
>>
>> Exposes one macro per error category (probe, wedged,
>> survivability, firmware, GT TDR, memory fault, IO bus). Each macro
>> hard-codes the correct SIG_ID and severity for that category, so
>> callers only need to pass the device or GT handle, errno, and message.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v3:
>> - Refer "Tile%u" and "GT%u" strings. (Michal Wajdeczko)
>> - Remov xe_cper_severity_str(). (Michal Wajdeczko/Riana)
>> - Declare __xe_ras_log() function to xe_ras_log.h. (Michal Wajdeczko)
>> - Make macro function properly.
>> - Remove *_FIRST and *_LAST macro. (Michal Wajdeczko/Riana)
>> - Add sig id documents. (Riana)
>> - Change macro function same prefix as the file.
>> - Handle __xe_ras_log() function with variable format.
>>
>> v4:
>> - Handle CONFIG_UEFI_CPER properly.
>> - Add CPER_SEV_RECOVERABLE in __xe_ras_log().
>> - Add xe_ras_log_runtime_fw() and xe_ras_log_device_fw() macros.
>> - Update commit message.
>> - Remove document. (Riana)
>> ---
>>   drivers/gpu/drm/xe/Makefile     |  1 +
>>   drivers/gpu/drm/xe/xe_ras_log.c | 65 +++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras_log.h | 62 +++++++++++++++++++++++++++++++
>>   3 files changed, 128 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_log.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index e5a04253e73b..cac19c21be08 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -114,6 +114,7 @@ xe-y += xe_bb.o \
>>       xe_query.o \
>>       xe_range_fence.o \
>>       xe_ras.o \
>> +    xe_ras_log.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>>       xe_ring_ops.o \
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.c 
>> b/drivers/gpu/drm/xe/xe_ras_log.c
>> new file mode 100644
>> index 000000000000..928fa4f45cdc
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.c
>> @@ -0,0 +1,65 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_ras_log.h"
>> +
>> +/**
>> + * __xe_ras_log - Emit a structured RAS log entry
>> + * @xe: xe device instance
>> + * @gt: GT instance where the error occurred, or NULL if device-wide
>> + * @sig_id: signature ID from xe_sig_ids.h identifying the error class
>> + * @cper_sev: CPER severity (one of CPER_SEV_FATAL, 
>> CPER_SEV_RECOVERABLE, etc.)
>> + * @errno_val: negative errno describing the error condition
>> + * @fmt: printf-style format string
>> + * @...: format arguments
>> + *
>> + * Formats the message and emits a kernel log line via drm_err() for 
>> fatal
>> + * events or drm_warn() for all others. CPER record generation and 
>> hex dump
>> + * are planned as follow-ups.
>> + *
>> + * Format:
>> + *   [xe-err] SIG_ID = <id> Severity = <sev> Location = <loc> Errno 
>> = <n> Message = "<msg>"
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...)
>> +{
>> +    char loc[32];
>> +    struct va_format vaf;
>> +    va_list ap;
>> +
>> +    if (gt)
>> +        snprintf(loc, sizeof(loc), "tile%u/gt%u",
>> +             gt->tile->id, gt->info.id);
>> +    else
>> +        snprintf(loc, sizeof(loc), "device");
>> +
>> +    va_start(ap, fmt);
>> +    vaf.fmt = fmt;
>> +    vaf.va = &ap;
>> +
>> +    if (cper_sev == CPER_SEV_FATAL || cper_sev == CPER_SEV_RECOVERABLE)
>> +        drm_err(&xe->drm,
>> +            "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%pV\"",
>> +            sig_id,
>> +            IS_ENABLED(CONFIG_UEFI_CPER) ? 
>> cper_severity_str(cper_sev) : "unknown",
>> +            loc, errno_val, &vaf);
>> +    else
>> +        drm_warn(&xe->drm,
>> +             "[xe-err] SIG_ID = %u Severity = %s Location = %s Errno 
>> = %d Message = \"%pV\"",
>> +             sig_id,
>> +             IS_ENABLED(CONFIG_UEFI_CPER) ? 
>> cper_severity_str(cper_sev) : "unknown",
>> +             loc, errno_val, &vaf);
>
>
> There were few comments regarding this from both me and Michal from 
> previous rev that were agreed by you but not fixed.
> Also let's close comments from previous rev before sending new revisions.
>
I checked with the Arch team. Even though this is logged using drm_warn(),
we still want the output to be prefixed with xe_err because it is used
for error handling paths. These messages are generated when correctable
or other hardware errors occur, so having an explicit xe_err tag helps
identify them as error-related events in the logs.

Thanks,
-/Mallesh

> Thanks
> Riana
>
>> +
>> +    va_end(ap);
>> +
>> +    /* TODO: Add CPER record driver handler */
>> +    /* TODO: Add RAS dump cper hex handler */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_log.h 
>> b/drivers/gpu/drm/xe/xe_ras_log.h
>> new file mode 100644
>> index 000000000000..3f94e6747e86
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_log.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_LOG_H_
>> +#define _XE_RAS_LOG_H_
>> +
>> +#include <linux/cper.h>
>> +
>> +#include "xe_sig_ids.h"
>> +
>> +struct xe_device;
>> +struct xe_gt;
>> +
>> +/*
>> + * Common backend helper
>> + */
>> +__printf(6, 7)
>> +void __xe_ras_log(struct xe_device *xe, struct xe_gt *gt,
>> +          u16 sig_id, u32 cper_sev, int errno_val,
>> +          const char *fmt, ...);
>> +
>> +/*
>> + * Driver error reporting macros
>> + */
>> +
>> +/* FATAL */
>> +#define xe_ras_log_probe(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_PROBE, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_wedged(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_WEDGED, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_survivability(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_SURVIVABILITY, CPER_SEV_FATAL, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +/* RECOVERABLE */
>> +#define xe_ras_log_runtime_fw(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_RUNTIME_FW, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_device_fw(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_DEVICE_FW, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_gt_tdr(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_GT_TDR, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_mem_fault(xe, gt, errno, fmt, ...) \
>> +    __xe_ras_log((xe), (gt), XE_SIG_MEM_FAULT, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#define xe_ras_log_io_bus(xe, errno, fmt, ...) \
>> +    __xe_ras_log((xe), NULL, XE_SIG_IO_BUS, CPER_SEV_RECOVERABLE, \
>> +             (errno), fmt, ##__VA_ARGS__)
>> +
>> +#endif /* _XE_RAS_LOG_H_ */
