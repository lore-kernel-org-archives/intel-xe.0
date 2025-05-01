Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFADEC369DC
	for <intel-xe@archiver.kernel.org>; Thu,  1 May 2025 13:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E92210E09F;
	Thu,  1 May 2025 13:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoC4s58B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6806B10E09F
 for <intel-xe@lists.freedesktop.org>; Thu,  1 May 2025 13:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746107955; x=1777643955;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+CfxkXiUUh+jUOzg8IhUwANzf7s1S/SbAA3AwrRcqHk=;
 b=hoC4s58BXROJcvRLFBbxn78mwLV134EFP78oZTa84nfvem2aWsktjIci
 2svQJnzBHgRnm2ZoP6pTYdEnt5G39gKCT5foWDELzj7db+SFSqhKYEqdD
 FOW3r8p6GqsD3rUm46eRSMU6XcsLHp78lhQmcaosCNluDBNDC4GV70Pay
 FfPgVkcKuB7pZWEo90s5WE1VJa6gC9lQYfBGroYlHRywvy0dTorKRaha9
 3zp+I/pedfunP0YpghG7TKYLMqMh3xD3mP8p0I9Kip3bnV39PAiGoI/SI
 xDo9AZDQ6sTIFldWB96jamu6Ye1htpAcQ5EGhQhTch7HW2SIKXreDC7sm A==;
X-CSE-ConnectionGUID: /Obtz6kmRuOJoQiGw2zEnw==
X-CSE-MsgGUID: RPejYzW7Q6mGgizSBNt2Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="51590593"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="51590593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 06:59:13 -0700
X-CSE-ConnectionGUID: XPurqkqTTvG6fuP6/OuElQ==
X-CSE-MsgGUID: eGyzHvYwQlKqUS61hN9+Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139535521"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 06:59:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 06:59:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 06:59:11 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 06:59:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrJWmWAn9yTLJwvObC0JxiCLLg/VFmrJMdeFsshjI1HYq7vUFvxzjNOX1oKXijMo5/Z0jAQ4M4ilM1t0kQ09awKPGiKI/2SzqWUEIbv/yY2y8Qzps3L9dAo+VBJ30wxrQbUgtxX4hJYQA6XxnGeOLwtBo1rp9XJQ0IU7f4HimBXp7UqPVXr//gAAAlnTo1/80Z/Z7w48qsLtT+3FuVc0PRQEEPsnOo7E+39jJFLF4ka/dOmjMD4xMQKSk8Bm5l4wJuDcxmIcCkz31tJ/5Mh+YHCQ7WBXJnKYzYw2lwBGCRUOtQPK/ROzDe3ALbc31IXa6VQlDqCrlj6AjOsfFsnfvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lDjxpMomDdTvd9rAHdApkVd2TD4mUThaCz41Pv99+/o=;
 b=Z3pEiAw9GnNsjn0BJExeol9BPN42Bji+9hT/DkpW2tC3yV+s4XFUU6zdjWSABvG9BXkoSOOoV6ErOIxEDe23CQ8/y+3VhnfAYfpHFCK+FDHjtdWyjJQEhkLqbFaxyQXPHUqV7k4nF3jRscYjHffAepERKUY8Xvqa/1a6C/HP6VkCxUfwKEvDPf+r8zuoYTMNzgmJnVL0/9+X6/zECmhxLHPzJYuJYfVKp6G8nniCDnftTHlUj7OU4Pfu+JPslNIETVOZlAo1c1AUfHwx+NZnnNb48pc8Y9MC7xWVtBffdbaO4KwzgD09N/ICHq1gQkLFKs0VM+AZ0yHUQ8a3+keexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Thu, 1 May
 2025 13:58:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Thu, 1 May 2025
 13:58:27 +0000
Date: Thu, 1 May 2025 08:58:23 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe: Add WA BB to capture active context utilization
Message-ID: <s7uk6zzqcgystu7di6op4htlfryxcmlcgy3dnt7nhkh6dnmruh@tdocgfrdx3zi>
References: <20250425191039.1551559-1-umesh.nerlige.ramappa@intel.com>
 <5j337myfuaurqwhfswcv52vx652lqws4rqg7gpnydkk3hdif45@mgv2ptjocqx5>
 <aBJr2IosrFA_zGNR@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aBJr2IosrFA_zGNR@unerlige-desk.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0256.namprd04.prod.outlook.com
 (2603:10b6:303:88::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c3f649-be1c-4a5a-e23c-08dd88b83f15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pnPAAC5ErgbylMa+u6t1u0MMJluAMDk9hRiKN5a35WnpJxeU68iCalR/5+lj?=
 =?us-ascii?Q?RA8/POsc7ZoRNnb24gpbCJ35rvLj3VXKx9fU0HQR7tQHrV2p83JvilTkW/jK?=
 =?us-ascii?Q?3eIzh2BBLxf1KpMJuPsl2Zi0yFt754aqMW0KzVzvjvOOhmuFufscs06vLxIz?=
 =?us-ascii?Q?5Ny1f1S4JMT+gqWl5rzfI7xduubLEwk5SsT6Br5uvbb3j914sFzLejFEZglm?=
 =?us-ascii?Q?GHlcBZs6AJFQ9RNpw6MpOBTOT+QEmw10ipiqxRm6w24wK9ruaEpzSdpERf7S?=
 =?us-ascii?Q?IP73GBGuKbOKYyUR64D4k51PJRMD/mm/6v3Mgg5tcrfAIzgYaVv4ViWdjfBE?=
 =?us-ascii?Q?NZD1/0ICQEU6Y0gcUyNkU1TPcsTo40vrUjf9HicaJKntSqamhlsU6fbTKiyp?=
 =?us-ascii?Q?XDyuyj7A09VKKwu2qlGLELHGmBFRJUY28m/piHNk+9lwXiiqX2cnUFvIHKlk?=
 =?us-ascii?Q?ELi0pnqbzyFh0STvHMzSyLG0YHKLQZQnA0NnTEKsqgwms33OpMNy8bAgwxC4?=
 =?us-ascii?Q?s/aycOTU8LwGbwi8Rzw4iD+k1EQnPwF13rC+OSnanHXUKD9YBOFDBoR+2emB?=
 =?us-ascii?Q?MU/szC4OPOicW71/ZPv2XUugw7ZgV6h0PHvJh/3XgRb3rxWJlsNUhGVD6MWu?=
 =?us-ascii?Q?B8IOZy4T8pqP3OK3ErEtUKYM2o3EvovSUeNjfbJA7yLlniEybBTQtK0kZcwU?=
 =?us-ascii?Q?96T1NGYb3BZjEbi1VjyAAY/DMrOyCuo22opprHExoUkStKs3NHjAI8zHg2oo?=
 =?us-ascii?Q?egIsAfUk/3wOCHkwAVDUfr8aWeHKgq+lAU0P+Pd+LdRQnRH/G4J17ILGKLPu?=
 =?us-ascii?Q?5JcAo1d5ELnuZZzdtieEtTsAeMSwNzlZyyPaSe0EC9giYH4/climFCxq233g?=
 =?us-ascii?Q?xnKCh/9Y5EQwYG9C4U2JvQqpOfkbAp2YQYPCW7XHX91HYBJHZjwt9wTCmThF?=
 =?us-ascii?Q?lAqG3IIb1EIWOKYIPGOTmkODOl2UtvBUxl6h2Nt6BzOECm4TlATbDq7MCL+5?=
 =?us-ascii?Q?OE85j6vUP0OVlZtkCYyuo6bQIQaB80qlDbDp4cuqCUbM6YcmrQjqhVkUxV+J?=
 =?us-ascii?Q?UwIuM6Q1gYTFd2bgevOuN9JH9beKRrLt6x18hh1c77EQfG00vIZBMhDt2kSX?=
 =?us-ascii?Q?de0tj92h7SMoCqLLbFR/maK0qBD8jeLCgFiDyxJuMfeABYMVgu7Yc4m7yYEJ?=
 =?us-ascii?Q?AEawuG9/S2jE+9RKDZfuP81eZDZme2DNkn3QdsAZ6EcuJp0aYQ88cvErpm7z?=
 =?us-ascii?Q?8IPfgtISSpAuPTfg0vVQVoDEA2YQ+xyD9S4ybevMN9IwQCSneg2I40IV4uJg?=
 =?us-ascii?Q?qBckSTb5TPVkmCby4ks3wDuvCf3xjIpeb9gA30EodN5S9yWRwBRHL6NGrgbp?=
 =?us-ascii?Q?ENxK2zG+16epk/VNK+uJYHjPOiHue1v7u73UfSwcoXjVEME7eu9Nu9itBS0B?=
 =?us-ascii?Q?xjvYx4I9Imc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0s7+xQZaEO4z80nZ76zeHZmstde9az4n+/OypI/JpYYknfgrpp8TWUnwegTR?=
 =?us-ascii?Q?O7Qwq3YY0CKElkMRUosw0uJwQSNQPBaz7t2flLzRRiclCplzyq0p8jYgfvNE?=
 =?us-ascii?Q?+DJhIQ2NBOvhw8SIRDXn4LfnRiTnSmU86Omg/McuIQy0xdBf6oGtcvepgFw6?=
 =?us-ascii?Q?uT3Um9T1ONlT/yQ0yspOdWPqwIAzTL+H4E37tz/qo0gy5/naqFEyrqyAL4KC?=
 =?us-ascii?Q?RKwleq4NIYgraEnAo+3kYCgd5lMdmi4qW/sKmSuZeN6jaxxhPH7fFaaMafeX?=
 =?us-ascii?Q?i2tOef1k1gx6QfwH9aZU3zKQwa5k4ii5CCI4XdiqavciTd1H6+qgnbuY9Gv3?=
 =?us-ascii?Q?ZGXjXnkbudALYaEgfZvadylYSp0GTax6pUcv/a9fear47Rz3zSaPYWctxzKS?=
 =?us-ascii?Q?6qIw9VmRoDyvIiIVlbW5U7/Br+KMFK/f+xBwR8JI1IOUbe39Z3dbZGZFbvWF?=
 =?us-ascii?Q?ojJn4HOkxYdSBUAIcF/VXmaRG0R02NamIo3K8sAQHiaM94dWG9rhjUoIJPEu?=
 =?us-ascii?Q?G3671z5/NpgvOksM/6ELO/YR2w8ELumpcVTWPuV+WDDlvbuaZYx/ciuY67fu?=
 =?us-ascii?Q?MdDYr/syIrzYgyjCvBeDAxAfbu8atcyactZ9dYhKKyFgIWrjsC809gju/2Zp?=
 =?us-ascii?Q?/GiNU8Vo2y5W/VvYCCFM8wIrqSyb2XH8waBxQg0+6Ojppwejeyvtg68cq5hn?=
 =?us-ascii?Q?Nc3K0nhbbNR3vtGVia/jSoWzWQG06L1wuoy1CkXmDYJ1LgPKeQ5M9jj5F+ee?=
 =?us-ascii?Q?P3YH8to73ssNEg7CR3GfnsCJ5DWtykEc+CImEUw5Z1TgUo3nlj7GL55vxoKv?=
 =?us-ascii?Q?0l15yONGz6HEp3NzyGq3r+NTBXFWD2ok4tL9HxbXUEKAx0CjZ7BJboHWrq3a?=
 =?us-ascii?Q?lcDkSzs5dYEq7DjHxdRuCe35yGepVJ4h4ZH/btOAcNNB4jnfqmsDZkRfBA5m?=
 =?us-ascii?Q?2IgcQWqiC+2D/L6y+d81Hc5nhCuIjYqL7HnWN2L4kPWle+q4f6muHKchqmyJ?=
 =?us-ascii?Q?5J3pMezxXV6M+HjQL0TT97OwfFBGaqUsC5/kkVZesPyLWDCIUEguTNBGcgUD?=
 =?us-ascii?Q?IfP4SnLNT1XiC9R4MJQv6gnneJUv/CZJI9fZTUYXEYwaXpJPMd1g/9ARdkna?=
 =?us-ascii?Q?iH20HmGuaxnNfCDsw4HHA267DizE8fBmusmiUWQi3rd4K0xb+KKsNyGJYy/q?=
 =?us-ascii?Q?pGsfdc8RrliPZsY1piQjirfyT046Ux2IK+bhFD+4MHk25RpA4PgU1RSXZqjR?=
 =?us-ascii?Q?1kUBwECrPflnxdu/ZAhs212aVZeSlrnWmgAEoGeMGhCLEkhdYVz540027QsW?=
 =?us-ascii?Q?It7VJkcpYmEUixe8lxZUo3wlI3w309jTEEy+CBeGJtwwfOkbob1hB/AcS0uf?=
 =?us-ascii?Q?0oZ0P6p55QKPRxDQMNtxXc7Lm+Hjcm3nWQy4SwdKhL72q1AFu9A8VAtizG9u?=
 =?us-ascii?Q?T80WDWVr9Wh8pr7mV5lABmr4mPxojxK5/zpVZxwhpgPpidArpvoY53yB1YbH?=
 =?us-ascii?Q?BK9aSugz9xYXXMJ4b7Qy74qXGwKk7onQArkADeMHLVxi63VI56lBDgSG+r5c?=
 =?us-ascii?Q?D5jBoHBtF9XCFDT/yvLSHQxoMfrsRFG2j+RXL53bDss9YtO/DeDfV5QYJ6Ok?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c3f649-be1c-4a5a-e23c-08dd88b83f15
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 13:58:27.2017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4dgaQ0Dx+t1pp5IE+dndS2el4R2KEx7h923382xUxda09aX/CtWwSuFYSgAbws8kWbstd3myghAcS2LQv5jjnPVzureFBiTe/f2Td1PxdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
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

On Wed, Apr 30, 2025 at 11:28:40AM -0700, Umesh Nerlige Ramappa wrote:
>>>u32 xe_lrc_update_timestamp(struct xe_lrc *lrc, u32 *old_ts)
>>>{
>>>+	u32 ctx_lrc, ctx_reg, engine_id;
>>>+
>>>	*old_ts = lrc->ctx_timestamp;
>>>
>>>-	lrc->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
>>>+	ctx_lrc = xe_lrc_ctx_timestamp(lrc);
>>>+	if (ctx_lrc == 1) {
>>
>>so in the rare case this clashes with a real sched-out value, the
>>outcome will be that we will read a bogus timestamp and the math will be
>>totally invalid. Maybe start using the entire u64 counter for this since
>>it would then not wrap in practice?
>
>I was trying to keep it compatible with platforms without 64 bit 
>CTX_TIMESTAMP. Also th issue is reported on DG2.

DG2 is not even officially supported. If we can make it very unlikely on
DG2 and impossible on Xe2 and later, let's do it.

Lucas De Marchi
