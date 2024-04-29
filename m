Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282E4C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 05:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C122D10E34F;
	Mon, 29 Apr 2024 05:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rktdba4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E1310E20D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 05:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714367859; x=1745903859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g9Fm3i7Yg1pW0M5R3Z1jBsda/XzjYG/e6rkF+4yONB0=;
 b=Rktdba4PMYIJAHN9hhomB8kmOj8fJw4fxUApZTCxuqiQ0cm1mUCQg+6z
 D0Nw2hAAhM8o1dc0UgVngfNXPknZlOpo28ZRtuHeL/l439QpGejhqV18o
 8JHxB0EAN1m6BY/MYmECuC9PORaJTFdiZ2+7XyX1h8B8VfIjy+Qnehcq2
 6p39iXhl8sz4O3dXheYNlQP3xr81CGivzHz5OFn9HDfod6qXdRCyFvMqk
 nPvdBU+zylb81P+EjBI73txBaA+R5rQaUtWkmq77MNFSsHnhelUIx38nF
 ydhIaw3AIzGFiHYhMlQsrwP9EoQaZLHVKvM7TlIJtzoy9lfl/AWAz+Fkh g==;
X-CSE-ConnectionGUID: QhJ2VaD+RNS+mM7s4YZNcQ==
X-CSE-MsgGUID: dxrRDMolTY6JksjQRQY+7g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10554193"
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="10554193"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 22:17:38 -0700
X-CSE-ConnectionGUID: cuYjCFn2QKGynf6eo18XGg==
X-CSE-MsgGUID: gekrs3bdRRC6G4Z2bH0sVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,238,1708416000"; d="scan'208";a="26101342"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 22:17:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 22:17:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 22:17:38 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 22:17:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZ5LSZZCAwefiEOAxPQe1dmnZJPhch0nEXnYiJVk4Tfst03/ciSYOXDCYEZ2MWZwprg4dOE5PKO8LTEFq2t6/1cCN8+6A9XgYNQAXLHGiQqUnRghHSh4vWxEj4ZKTjGMpavoXR5xfssbBemDJgqhby2vbbzmiq7+a3PLi6WJXaduUHaUppA0gXPs/JSEzoomYyRhs2//GWNdzVnzWAzub4K3NOpMy5JKgVQBAjbUN7fjyyFTIK/LP92wSVruBF5eZDJsxkhskKRO+k7x3UP07j1PZp9p0zRm+dDHXpadTK59pWOpCno745w+8Ol2OjFY5H6ABPYkRo8hL98qqok4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gnhi7UacngSdDWqjMbbfyVkFb8NONsC3AcG5sLfD438=;
 b=G3uc9cKLAb/IIqvEjZVjQgN+o2SnvuW71Ut2Jc+c2RxEfUipKSM5z7fTXeqFVrYYSCWEiSnWSyysuJGK822V205DWml408wRGexml81gpp5lAVp20MaZr4PE/4mEs+pH5yFwjJf+vqVFhFU6hP1wZSRYfJZIpm1/8b7caP3xAICeO8rPkNWEO3REukV0UCpF2Juz2IYfUonxFAaM9iS+Jbt02QHnJzUmaei2GZLUfKyb9GmLKwZaqSnLWkF9tg7HeoHZYh0zxWSLEbDvFo7y+DhdekRaSM3ElWcLfZxj6W1zR1gDMej620JTxAXMbOfN+SyvMyNRz5meRTb+S+sf5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 05:17:29 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 05:17:28 +0000
Message-ID: <3078aab8-f07f-40a4-bb0e-9b97aab8d464@intel.com>
Date: Mon, 29 Apr 2024 10:47:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/xe2lpg: Add permanent wa_14020756599
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20240426094947.2039436-1-tejas.upadhyay@intel.com>
 <20240426094947.2039436-2-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240426094947.2039436-2-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::8) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d31f68d-049c-453c-564a-08dc680ba996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1IySTQyKzFUY1hPOE5EeWI3cmkxYmpCeUtzQWo1VDA4Nm5LOWNJTFEzZFVa?=
 =?utf-8?B?UVpFaEhzam8wUFZNVFFGMDJqdkZkbjljSHNHVFVxd2dGWk5sYmxtQm5WZ25T?=
 =?utf-8?B?V3FrMnJUckpZRE83TmlHeE16VDlyNHJEV2Q3cWRURkxaR2ZRdTMwMGE0blhp?=
 =?utf-8?B?N29od2FWZ1QweC9weHAvSERzTDB5U2RGNURHSlVmQTZUZ21tZFRWZ2lpNmo2?=
 =?utf-8?B?UkhVdUxYY1hjU3hkdXNqYXpVenBVMGtwV2RNeCtLckgzbVM4WGdadDNXa2dx?=
 =?utf-8?B?bFdkYXpOOVZuQnZsVllxRHFhVTBsVWJ0OFNuYnlYRXFLMzhDUGtuZ050ZER4?=
 =?utf-8?B?bmk0eTQrSWd0MFJ6Uk5yOS9Tb1hzdTFWVW5EYVdjTndmS2pDNlRjenFWbHdW?=
 =?utf-8?B?aE1xYmZHZXdqRTJZb1hzMWxJVXlSV3h3OGFvN2JNQktkRHlscXdGK1ZjQ3BC?=
 =?utf-8?B?a2dsVW9QTVdXWlZ4bDNoRkgwYlE1T0xyU3BpeXBaYVB6bHh6dE12M2RJdDJF?=
 =?utf-8?B?M2xBOUVvZmdaYUVEdnd0QWdFS1ZiSjJXWEFWbys5Ni9USGhNNFM2SzhYVG5X?=
 =?utf-8?B?d1I4WXJNQ2hKeGtwbGExckZRNWs5b1N3L1NaeWxmT0VxaGxGVzZUMjJNRll2?=
 =?utf-8?B?SjJoMlpNOGU1QURUWkkwdzZaVzNVRXNvZmJDRXkzNSs3MlEyUVdWU2hueGVt?=
 =?utf-8?B?K3FFMHZPWHZQQVV6S0t1TlVVZzFjSEV5QW80TXNGVnRBUEJXNWNoSUZwcHRi?=
 =?utf-8?B?ZjNNQm1YeE82eERGamN0UmxWWHpTbm9DMTB6MEViQmRUbndjM0ZGQUNhdWRx?=
 =?utf-8?B?YXo3VUtIWjZ5ZHhlTldxaWVWdjJvK2lGWHpiWG9VeS83WC9MNUpKdTVaOTla?=
 =?utf-8?B?TlREcGxMT2lMQXhIL2VqblQ3WUp3aCtwYi9GcWlIaFZ5YWc1S1dleEVpT0dX?=
 =?utf-8?B?ZHBVMlQ2a3Z5QkxGM3ltMHQ5WC9TWDlVRk9UblhsNi81aVV1Nlg3MkNiMUYx?=
 =?utf-8?B?TG93MTFhUkF2UWU5L2ttYjVkQnZhNWZpL0ZJeXE1a29uRkVqd2dHK1o5RVNW?=
 =?utf-8?B?TTVmWnU3cnd0Q3JHa0V4Yk5tSnBBLzF6MzllQUFiQTh1Vk0zYnFUbDk5aWVk?=
 =?utf-8?B?K3N4Sng1eGJKckVpVmdRb0NNdkE1YXNMVHNLQmQ1VUpScXZLU1lhSTBzZTBo?=
 =?utf-8?B?bEVzYWtJY0dsZ2J3cERiU0YvWDB4blRONTZqdjIzT3NOWThrMzdWdndNMTZr?=
 =?utf-8?B?b251YnRFby9HQUkySWk2azY4UVhhSmtQTjZYMzZtUWJZMGJsRWE0WDhicm9R?=
 =?utf-8?B?ZDA1TVdadlV0dUxKN3Z4VGhNSlo2T1lscXlGZWc3VW5GdWxDOC9mbWFabDQ2?=
 =?utf-8?B?RWp2MXlVaWUwaGdtc3RaaVlXbEJlOGxaRnJKUmdSSXpjM2VaZVdlVVBrTXA5?=
 =?utf-8?B?VXVxY0l6K3Rod1FSeldzaEQ5VW1wUmxSOXBZVWcrVDhHMkEwOUpoMEtGM0dj?=
 =?utf-8?B?QjhTUHYyb0xUc3loSDJkQldTakwyNlBXdERSR2M5dDVScWpPQmoxcCtRV2R4?=
 =?utf-8?B?Tk5nRHZ0QjQzaWtOMVYrZjVxeWE5ZGJObm1QS1ZkbWs0aDdoQURJblNua1Q2?=
 =?utf-8?B?QUl5cTJjS1c1WnhYbVNGRWkrVk14U0pybGNYcFhZRGRBK2x6MWlyTHlmdXRv?=
 =?utf-8?B?Z0d6NTYzZzcxNnFSRTAwOXhHenZEcXRIL0RNMElneFdPeTdCSG83Wk9BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVvREVHNzY1NnBMU2hweUJZY1BkaFJlTExUT29nMWhPSDlCeThGQ0pmbWV0?=
 =?utf-8?B?T0UvSmdKL1NzbHRzV1Y3U1lxVzY2bHdRdFJla3dnK3ZUZ3FlYkJUQnlNMk9D?=
 =?utf-8?B?amV1RVJQM2k4UEVNNFYvVGpobVp5cWt1aVhnNlRsTWwzZDV4NHU3cUlhNS9a?=
 =?utf-8?B?OXdEWVRjK3ZyQy9ndkRxSmpjaUMvU21qZEc5UnVNenM1TXRsdDEzdUtaallV?=
 =?utf-8?B?QzFhQnBBNzZNSTZVOGNydndmRVhiUEJWZUlzODlTdVBCMG9MWCtpcE5kNDFT?=
 =?utf-8?B?Q3F3Q2c3T3hwVlBUZUd1c1pvNlRaYWxiUGhTdklOTHQwQlVXWU5sRXU4VG1y?=
 =?utf-8?B?Z3hWV3VmWFJWQm1VSk5rN3VnTEU3YlMvQmR4QlQ1MEJRQTNkRzkrOVEzNEo5?=
 =?utf-8?B?NHN0YmljZVpTL2t1L3MzVmpsUGhkU29yMk1xSlM0RVFxVGVqWmpyOG52eHIw?=
 =?utf-8?B?M3JzeFN4U2hsbkJnb2NHalRwQlFlaS9iYmcxbVNBUWRmYnJzZmdZQ29sVnNJ?=
 =?utf-8?B?UUllaHRFTzBHOTVSVVIzazl5dFRnc1MzdUVKRFNBbHhMRytZbkN4cEg2anl5?=
 =?utf-8?B?aDJzSjlaSWl5Snh6YlF1Zk1TVHVmNlM5SStJZjIyT1JBVWl4MHRxNFZxUzFM?=
 =?utf-8?B?RDBLM2VJS0o2UkpobDF4dkVkcDZLQVI1cmNTR2RPMklNTDRLeEhRM0FRK0Z0?=
 =?utf-8?B?VlUzRHJyUWZuaTVpZWdTL3p1TlcxNllURDZadG5COU02aWhXSXl2citCSkJF?=
 =?utf-8?B?M2R3elNIdm1DdEY2WWRrVDBPbGJaWEVtRE0wcnJmR0FyeWdsSHA5cE95OWwx?=
 =?utf-8?B?WGQ3dzJIbWt5a3ZRU0w3NU9qeGdMNHR2NUQzL0paZ3RQam4yRlpqYnY5eHBI?=
 =?utf-8?B?SUZIRkF0SHYyMEt5WXRBUk50c1p5SDZPTEE5WEUxQ2NaUE9TZEV0R0RaVmxY?=
 =?utf-8?B?UEQzYitLT2M5c0tqUHRuamxMeFk1Rld5UjBSSEtvSTRoczJ1eTVyS3N1d3ZC?=
 =?utf-8?B?Y1FtRVlYcnpjY3JKUDduaTNJSm1lWWdqWUhSalNMZlRsU2NaTmI5dVhvNlQ1?=
 =?utf-8?B?KzVKRE01eXV1OEx1cEgvUUxsR3N2dkVDVlpRVG55Y2pzK21kK2FQOGJXS2s4?=
 =?utf-8?B?QzhkWEE2ZUlHczVlL3hwTWxCUFlhTlVpNllmTCttMERSTmZyUGxVQ29Ud1oy?=
 =?utf-8?B?L05UVEZkL2pZM0wzK1RKSGE0SllQa01VWHkwTjBwRWRWaW9BeHlZNnNxYVdB?=
 =?utf-8?B?cCtZOG9aNmwrTE8yZnlSQlgxMHZ0WG9TMTVYYjJucWRmZWQ5cnZyTDBVaTht?=
 =?utf-8?B?L1ZGZ2Z2blJrekl3T0JKS2tFOVM2TURyYlVMYWhjMHEvWlIrOVI5S0l1ZTBa?=
 =?utf-8?B?d1B4dEo4amJOVUdudUwyWnBFam1TVk1nOEVlaDRmbU5lZXpiMGxUQkFsdW9X?=
 =?utf-8?B?RE9yZ1FHYnZPcG04SXM3QVp6dW02YU1XNitjUXVkTS9BN2ZHV0JBMnJwN3hr?=
 =?utf-8?B?bWFsVHN1cjlkTVlCVGdscFErSnF3WGd4QmJSMlM1YnB4Yi9tTU1FTVZjYUE4?=
 =?utf-8?B?OUdsLzNMcjNxd0dpazFFb3h3eGRZSFRXS3dlUnhUODV2a3VQUkkxYm9CRXRm?=
 =?utf-8?B?eE9yOXNsYUZ2L3oyRVl6eXkyT2xSR1NxbkZ1ZTE4SUhZbEk2dXJuTzlmWHFh?=
 =?utf-8?B?VDZwNllJL0FuakVwWDhqcnZzb2NhMnd0NHZTbnZEY1B4RldNYkJLT1ByMzRC?=
 =?utf-8?B?Uk9NMHl6eDVhQWVvY084b1kvVS9zUk5hb1hHcEJXMnU0MlB2bm4wUmZpWTVB?=
 =?utf-8?B?c3F0Q09tQ3M1aGlaMHk3K1NKbkNjR1l5bWFEeU9wVzFKaWdKMmkySlJOdHJQ?=
 =?utf-8?B?S015bkxtZEU2Y0RDUjFkTm9KTkNGRjNNMm4vSEVQdGRRR1NrMGtCWVYyLzdB?=
 =?utf-8?B?a1NmR012dFRuNXllY2hkUnExS29hNUtxSGJnZkN3L1RONUtTMmlndWZpa0dh?=
 =?utf-8?B?T3ZEbDl2dGMrME5sTXFxdFMzTEVIUEtRZjhJMTlDekhjL08yTjhTWHdKRVY1?=
 =?utf-8?B?QjZPRjgyZHdtSzQrT1JTQnJnL241YnpDSms5MjVVSTAyZ1Fpb2dVUzBTa0FG?=
 =?utf-8?B?UklReXcxbkFpVWo2TFVrYkxYejNYUDZHY21YZ1FKT3EwMlNudml4QnZ5VjBv?=
 =?utf-8?B?UHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d31f68d-049c-453c-564a-08dc680ba996
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 05:17:28.2385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kuFvFd961b3MBOcR30Ew/Twel0H4rPGakTBiXV7RcI0nlaQaNeQGb2wYwdX8bYFwIHlGYyMoExFxpkTfV0lSlGR9zh1UfKt3voPYyqNjzu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
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


On 26-04-2024 15:19, Tejas Upadhyay wrote:
> For xe2_lpg render Wa_14020756599 is applied to
> all steppings.
>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9d9b7fa7a8f0..c75946e70d84 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -678,6 +678,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   		       ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_2, TBIMR_FAST_CLIP))
>   	},
> +	{ XE_RTP_NAME("14020756599"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
> +	},


LGTM

Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>


>   
>   	/* Xe2_HPG */
>   	{ XE_RTP_NAME("15010599737"),
