Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7FAC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 00:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4712410E164;
	Tue, 11 Jun 2024 00:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RziJlGZt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB2910E164
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 00:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718066179; x=1749602179;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ypv/BV/uVhpghcF8+/nUrOMo4MSNPFvbLJxC1G6wNUM=;
 b=RziJlGZtSBXD/XKXiyeNzHrM7Ni7zDB7opv8QBTYIB4+GmspAeRv+jXN
 KK9Bmcfmm8M5J+qsO/NOHGnSgVoJH6Syvfx2FSUt/ExS9PvugHYghHBDA
 cfO+2Ic3LOddVsMLnK4dgg4TDvb2fkNozaCDt60qbRR29Xe9IvbbV+FRo
 TLEVTTXh9hAE4222/XC+USxiKYs58UfmkTekeaej9T0YYpCvD4Bt1FsL/
 6EoQ0tfNhO6a4LpCrSLy0+Ddc1T63XeSoHmatmwO6uM/aPWJDin5+P/ke
 O559AkUvlSv5PxarO5nMU8TvZB00pLrrNdovpsm+pBg8y/Ypul2PNDXeF Q==;
X-CSE-ConnectionGUID: dGtwcONHQ6C8BecqDNHXYQ==
X-CSE-MsgGUID: btFtmWkoScCz6lBKTd+QRQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14879116"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14879116"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 17:36:18 -0700
X-CSE-ConnectionGUID: Z+c29iUSR1qqe43VIqz6VA==
X-CSE-MsgGUID: y0e+QI5rTj+r1598Atrr/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="43656753"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 17:36:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 17:36:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 17:36:17 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 17:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CKKxhCGT6jh/4iXnIp7umdmDgS3C6Y8K5d7LrrV8mfyNUku68LM18txgSJ5RROIH17qRPwnoqQJL+adYPtdtFSjct2K0qTKnkczHfD2MyBP3RzAxGe/qOnbVRY2asP64g9NDtNm4EOFunDTrkr4+Uyp5MGAjO+Ln5GLSeYIESUtNyTnW1Ruc9a1Ph5znR1t50VAyK8Z7Ig4jsyVYu4D55B5Lfcqa/WNxrO7Z8TxGe3KSK2pemPOx6GTn/VA/LLQmExRyi+ul1VtvOUc2BXPlyQeGTvOV6jTYr3q0vZw5cqPVHqsxvLB5GF+g6wOOQt8TCMonyXzGC72QRqzssBHIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4gevk8D9nlRgeShTtD+bpTCynOSzGGT7ptR2ohqkkY=;
 b=E1TJjxqAC4pn38qiw+V11vvvcop0wSRIiGFhnnPhutmxQ2FTeSI7fj0CA0Z16eRtZUa51/pMH7M2/FnEdITXzeGty85Yba67h5H2hD1u7mQjIhqhUuED5uUzSF+sqQCa+/BFucBOdWR0HZ8X0s9KTS2XPQxTeJs7a94XJckMuDZrzmzPcpxvy5zadaqMGEW2otrGjoa9PmIrYUEWq1in9+Eyjfkg2qz0bolTzYN5sJnNkalj6Zgx9eVV8woFBxd87/q59GoD6FrXZF1/Mq9lzNST6nyqdMibj3ZsDiQST6HscGFDSE4uiQr9GPvIn3X9d93AeTYNIHIiT2l+J2CY7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 00:36:15 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 00:36:15 +0000
Message-ID: <10e2758b-b446-4a5d-a51b-fbd1df688f13@intel.com>
Date: Mon, 10 Jun 2024 17:36:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/10] drm/xe: Sample ctx timestamp to determine if
 jobs have timed out
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-11-matthew.brost@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240610141823.2605496-11-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0019.prod.exchangelabs.com (2603:10b6:a02:80::32)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: fd90652c-38a1-449f-0278-08dc89ae804d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anNrSG96NWE5eDlSM0theXlWREZyUzM4Umg5eGYzT1ZXU1JPTFZmbExiVU5U?=
 =?utf-8?B?WDg5cTJGRlh3ZVlIUmJndDF6Qmt4YTFhWG93WFAydGpZZjJ0TTNzbE9Zb1FS?=
 =?utf-8?B?eVVUOHBPMzVsaXU1UHR2RDdBZXd4SFFGUTR4Nk5tdkt1L2p0SnNKeUJ5NFR5?=
 =?utf-8?B?WldlWnhTbjVFVWpPY24zNzJZZDhsMUdUY1d6SDJ1TndtZFcwa3VWVGZ5Kzcz?=
 =?utf-8?B?c2t1SWxTR0VXQjM5SXZZQ0NVbUZCWVdQSENjUWdvR1UyQ1ErbTJjci9lQ2d3?=
 =?utf-8?B?WVhtVXNJUEhablNoRFZqZTBlWDA2Y3VpaDZOOVVSRGFSMnR6cTJrSWFLTThz?=
 =?utf-8?B?WFZEWi9uOElQcEx6VzlZcFNPeW5EZEFIcnUvVTZ4UXNtejBHVEM5d2d1cVl5?=
 =?utf-8?B?Q3VRSEdMWHU5bnoycDE4WmtyNWZCc2NDUnpqMkdIMFFqMDdIdXJlU0JRVmJn?=
 =?utf-8?B?UU5sZnIyd1FQRFl1dm11Q1NCRWlwbHIzYjd1NWlqcHlUZjNJQ05RakRMNnpP?=
 =?utf-8?B?MjBnQ0hneTI1azBGalU4eEFBRGQzVU9KZFdHdmlIVTdQUmN4ZDRLanlnNEpC?=
 =?utf-8?B?S0VUR2NjV0NSRVlpQThldkVHWW1wVkpUWkpIVlBLWTFxcVBYN3djaXBLNVpG?=
 =?utf-8?B?b0RMUWxuVlR0cmt4ZjBRcHBueEMxTXBPYVBob011UzVUbVdSU1dFTkFCdVhC?=
 =?utf-8?B?ei9BRGVjNHJ1UWo3TUdkam9XQlJKU2JMalBWcUVaaVVSai9wMnhEY3pjSE53?=
 =?utf-8?B?Q3EvbzhwK2tNNUNuNzdLV1RHTVVSK1lKMXJLT3hIR2Z4VlVaVHBmNGZCS3Fi?=
 =?utf-8?B?MkMvdThLaXV6emMvekIxWlRRaytITExyb0VTdExRVDhWdkV3QkdQWWFYWWly?=
 =?utf-8?B?QlAxY1NsZEs5UCt0cDRmSWJLZlEySkN1UytWMm1OT1B1L25YSTk1dktWajVW?=
 =?utf-8?B?dnNUS1B2QzZwZHhBanN4VnRuaTlSb2ZaNmNuVlRjY2VQUVdNMWJYTmtlTHBY?=
 =?utf-8?B?eGdEMTBHelBuWmNhamR5SGtxa2lxNE1PenpIcmo0UVdQaStXWHZoYVJ6S0dz?=
 =?utf-8?B?L0lZZWZxQzBwUU9qZ0NleGFyNW9IRlRYNlR3YTRqQkFGbmRWeFkzWUpFbXpt?=
 =?utf-8?B?R0p1V0wxdE5xTjhCKzFlNDdLYUtaV2drQmYvcWR2elA5L3pVSGJyQkJ5WnhX?=
 =?utf-8?B?YXRWSlhkN0NycktBT29VYTFSUlQ3SkxCTjk1ejhRYk9SUDJZQWd1cC9qTHlm?=
 =?utf-8?B?ajNmaWdZMGlwVFFlMmVNNWdxcVp5ZFp0Nk9nK1FwSXYySmczVVFJeWpNaUQ1?=
 =?utf-8?B?M3ZPY2c0UWFxUXd5eVNGQXBHVUJiYXJXSGppbnBKa29DQncyYUd5L21oelEw?=
 =?utf-8?B?encwdG9DWEdTVEN0R2txNTRTemZ3YWtBM1U5bEs5bU1SWEx4bFVaZS9qVWdH?=
 =?utf-8?B?KzVxY2VPK0J6VlNYaVNaTUpxVWdCRkloNXcyRTB1SE9nWTdIYW1pdzN4RjNU?=
 =?utf-8?B?MDJnMVBSVFB0OGRYOVpVMUNyREthc0VYWmdOYlJ0dmxPQUo0amRhQTF6ZDlY?=
 =?utf-8?B?WDUwOVJEL2RrR2xxWDNCUk5YVmNWM0xqUWlXVE16YndCSmE0S3pVY1pmb080?=
 =?utf-8?B?RlNOV2l1Wk9ITE4zS0tpNHMxS3RPa2VIT2ZENS9vY2tiVE5xbGZwcjc0a2pN?=
 =?utf-8?B?eC9LSWFxWDNIRjdUWllmVGNGQ0owTEtKU2FDY2pKZWpNNng4UDhkK01PNm82?=
 =?utf-8?Q?R1VmKhBl6ENcHSaXAO2v0AuREmJozN3IL8fcELO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z29kQjBueGVTL096OU9wYU9SN0VMT0FHektXVXZITDEySTR6Vmk5YUlCM3pM?=
 =?utf-8?B?RitzRGx4ZnF3YzNqN1FvLzVVNExYNlJiU2pJOElFZGszaXVkU1pOeTNjbmx6?=
 =?utf-8?B?MzdOZFhBVUE2WTR1eHFmdnFPM3BmZGRQcHVtMVhPaTBCTHNOekVua05IZDB1?=
 =?utf-8?B?VXloOGVXRHZIbkxoM0FsVUlHYUdERWJZbUZUcnlYbis4czFGMVUrY3VIMEMz?=
 =?utf-8?B?WkM3M0JSWHRHUW1FN1FzRStldWZxeVl5UW5tSGdUcE9aa1FEVm9qRWM5dkdp?=
 =?utf-8?B?ekRibElpM3hlTlJudWxRaFZZZjkrTVZjMitqMFZrUFZVZXYxa3NRUnEvM3Zp?=
 =?utf-8?B?OW9ZVXdaaStKU2hubDNkTjFRVGh2OUVkdkY0Z0pydHZEdlpxQTVPRllVd2ln?=
 =?utf-8?B?d0R4NVUxeU1IbUdrTVRjcXRrVkZMMjZmUk1weEVXOXU4K3FSdHdRb3UxRUFB?=
 =?utf-8?B?VHpqZ29FeU5PUWhuWUI3eU9nZ0FWbXkranNwbkZKZldOZEg4WmFTckJoSmtt?=
 =?utf-8?B?SzVLcHZHTENjTmU3bmdTSDg0OXd4Q2Q0YTBZVVhuODZHVkZ5QlR3b0dmVFRL?=
 =?utf-8?B?Q2piajluRDR4SkVEOU9leW52VFVNbHIvSXNxdzhaUTg2UmE2aE5oaUhKQjhy?=
 =?utf-8?B?YTllcEFabUlMRkg1Wk1RUHZ6aTNRZFNkTWM0WnZxaHRRdFZac1hZNmFIbDM1?=
 =?utf-8?B?eDRGaGpuN1pVRWM4cWl0S2pZTHNxMlVyeHZ2bnQxQ09oYk1zRzUxMjN6a3JC?=
 =?utf-8?B?QzloNkkyYTYxbXdLV3JJajFUenZaMGl2WHZRczNRMTZOM0ZUeU1waHBKYkEz?=
 =?utf-8?B?L1JSdXhmUWlqNmxxd0dCT29JdkNSOTR1WWgwQVZrRzBuYWp0dGtBNGZKV1pK?=
 =?utf-8?B?YTNDR1dFa2tnMis2Zk9IU1ZNRHVwclRUWWlqeFlQbWhnSXlLaTVzUWtneWVV?=
 =?utf-8?B?YVZaSEZkRGJtdFZ6QXRjRXpMcDlCNGRCcVZESUlzdTV0c2MwbUthTmNhYnk3?=
 =?utf-8?B?UmdXcEpyeUMvVnF1TWVaOXVHS0tIdUMvVUNZcUwwQlNJd3ZTcUMxZ1ZqajMz?=
 =?utf-8?B?TWtBV2hLeEYrdldHNDZLYUxjVjg5OE93NytDREFRV24yUzUzQ3dsckNoWUdR?=
 =?utf-8?B?dHBYQkRtMnIvUVU1RnBpdytlMmJ3c0RMTWRXMmdBdk5Oai9EOFZKMjd5WlRX?=
 =?utf-8?B?enJTeDNPWE8zU3dybWkwVGRma1d5Z1JDdVdLc0NJNEdlaEJMT1hsU1pjR0xw?=
 =?utf-8?B?VGFNU2ptUkd4cTZyTk9KZnNFbDZiVFhNTVI3emdhRTBtZFhHUjZBalhMQUph?=
 =?utf-8?B?L0x2SExjV3JzeHVWWWtJak5CUThhOEdROXc1cU1wU3VZSjk5N3U0eU1MSGkr?=
 =?utf-8?B?NmloVzI5dzEyT0VVNDkyRDc3eEJ1TlhUMC9oRDZTd3JYYmYvNGdOa1JodGlD?=
 =?utf-8?B?dVd5TTh2SjJHZDZ0SEtoUXdpYWxrZlRaRVN3NUEyTTFqS1djc3Fra3NVUnpi?=
 =?utf-8?B?cHNhdk9LUHc0QWZ5SVBlY085M3dXc3ljLzlkbmtwSXNCVGxMc2Jxd0Z3eXQv?=
 =?utf-8?B?djNzQ2JaS0JGQkJQTWcvbnp5MkdNb1R5cFhONU93TWcxUUwvWWZYc01WMXpy?=
 =?utf-8?B?TFJJYXIwNlBuNGlZOUVXTEVuS2dkdkFDVEtzSUdCbUVKWHRFN3Z0bUZ0Y2hi?=
 =?utf-8?B?T3FKbkxXeTdjSjdvZzFnWEdLek1KTFNwb1piS1Q5d2o0eEJQV0QyMjlEd1Ux?=
 =?utf-8?B?OGtvd2NCbkV6YnlCSzIzMzBZODJwaVVVQTZENFlzTkE1MTFTK1VFUW1zNVFM?=
 =?utf-8?B?czJKd3V6T2xidzBJWkVKZ2JnQ24rU25HcXdVYzVJVDVCQXc0cTFSUnlqdVFT?=
 =?utf-8?B?NUZ3TVlZWTJpRVBzWFBrOHhHanh3cDdlcm5PQVg5R0pKYVM1R29jVjdtd0VF?=
 =?utf-8?B?anFvSlBHUjdwalZkRG84WG9uNGlpbE90MkQxV3F6UHJKclRoT0lvZUwyeXA3?=
 =?utf-8?B?UWd3emtOb000SjdkWUsvWnlRcEpqZ254LzlZUHdhREtOcm1FNmlvUnAyWWVN?=
 =?utf-8?B?aGhIN1ZlMk1JUytHSGUwLzhYMXMrM0V4aHN0M1ZGdlRIU1dLT1BPY3VKZ0ox?=
 =?utf-8?B?amU3WFRtNnNSYWNFaGNZT0F2QlFMZjJ5VXhOOU9wNForeHZhN2tOc0pYWTZw?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd90652c-38a1-449f-0278-08dc89ae804d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 00:36:15.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2w52gDdA4relNPZmfWB5S0QFH+f2emTcgRB+Yu7HsQkBcZxIFmf2jsKHOwhtAKU1U7R2zKDAkbgoN7rnIBUoTm+DFU5hRp3BtqrNZ+//C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
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

On 6/10/2024 07:18, Matthew Brost wrote:
> In GuC TDR sample ctx timestamp to determine if jobs have timed out. The
> scheduling enable needs to be toggled to properly sample the timestamp.
> If a job has not been running for longer than the timeout period,
> re-enable scheduling and restart the TDR.
>
> v2:
>   - Use GT clock to msec helper (Umesh, off list)
>   - s/ctx_timestamp_job/ctx_job_timestamp
> v3:
>   - Fix state machine for TDR, mainly decouple sched disable and
>     deregister (testing)
>   - Rebase (CI)
> v4:
>   - Fix checkpatch && newline issue (CI)
>   - Do not deregister on wedged or unregistered (CI)
>   - Fix refcounting bugs (CI)
>   - Move devcoredump above VM / kernel job check (John H)
>   - Add comment for check_timeout state usage (John H)
>   - Assert pending disable not inflight when enabling scheduling (John H)
>   - Use enable_scheduling in other scheduling enable code (John H)
>   - Add comments on a few steps in TDR (John H)
>   - Add assert for timestamp overflow protection (John H)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 297 +++++++++++++++++++++++------
>   1 file changed, 238 insertions(+), 59 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 3db0aa40535d..8daf4e076df4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -23,6 +23,7 @@
>   #include "xe_force_wake.h"
>   #include "xe_gpu_scheduler.h"
>   #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc.h"
>   #include "xe_guc_ct.h"
> @@ -62,6 +63,8 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>   #define EXEC_QUEUE_STATE_KILLED			(1 << 7)
>   #define EXEC_QUEUE_STATE_WEDGED			(1 << 8)
>   #define EXEC_QUEUE_STATE_BANNED			(1 << 9)
> +#define EXEC_QUEUE_STATE_CHECK_TIMEOUT		(1 << 10)
> +#define EXEC_QUEUE_STATE_EXTRA_REF		(1 << 11)
>   
>   static bool exec_queue_registered(struct xe_exec_queue *q)
>   {
> @@ -188,6 +191,31 @@ static void set_exec_queue_wedged(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
>   }
>   
> +static bool exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_CHECK_TIMEOUT;
> +}
> +
> +static void set_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static void clear_exec_queue_check_timeout(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_CHECK_TIMEOUT, &q->guc->state);
> +}
> +
> +static bool exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_EXTRA_REF;
> +}
> +
> +static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +
>   static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>   {
>   	return (atomic_read(&q->guc->state) &
> @@ -920,6 +948,107 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	xe_sched_submission_start(sched);
>   }
>   
> +#define ADJUST_FIVE_PERCENT(__t)	(((__t) * 105) / 100)
> +
> +static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
> +{
> +	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
> +	u32 ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
> +	u32 ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
> +	u32 timeout_ms = q->sched_props.job_timeout_ms;
> +	u32 diff, running_time_ms;
> +
> +	/*
> +	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
> +	 * possible overflows with a high timeout.
> +	 */
> +	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
> +
> +	if (ctx_timestamp < ctx_job_timestamp)
> +		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
> +	else
> +		diff = ctx_timestamp - ctx_job_timestamp;
> +
> +	/*
> +	 * Ensure timeout is within 5% to account for an GuC scheduling latency
> +	 */
> +	running_time_ms =
> +		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
> +
> +	drm_info(&guc_to_xe(exec_queue_to_guc(q))->drm,
xe_gt_info

> +		 "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%u, timeout_ms=%u, diff=0x%08x",
Any reason to print the diff as hex?

> +		 xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		 q->guc->id, running_time_ms, timeout_ms, diff);
> +
> +	return running_time_ms >= timeout_ms;
> +}
> +
> +static void enable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +	int ret;
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +
> +	set_exec_queue_pending_enable(q);
> +	set_exec_queue_enabled(q);
> +	trace_xe_exec_queue_scheduling_enable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +
> +	ret = wait_event_timeout(guc->ct.wq,
> +				 !exec_queue_pending_enable(q) ||
> +				 guc_read_stopped(guc), HZ * 5);
> +	if (!ret || guc_read_stopped(guc)) {
> +		drm_warn(&xe->drm, "Schedule enable failed to respond");
xe_gt_warn

> +		set_exec_queue_banned(q);
> +		xe_gt_reset_async(q->gt);
> +		xe_sched_tdr_queue_imm(&q->guc->sched);
> +	}
> +}
> +
> +static void disable_scheduling(struct xe_exec_queue *q)
> +{
> +	MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
Should there not also be an assert that pending_enable is not set?

> +
> +	clear_exec_queue_enabled(q);
> +	set_exec_queue_pending_disable(q);
> +	trace_xe_exec_queue_scheduling_disable(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +}
> +
> +static void __deregister_exec_queue(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	u32 action[] = {
> +		XE_GUC_ACTION_DEREGISTER_CONTEXT,
> +		q->guc->id,
> +	};
> +
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_destroyed(q));
> +	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_enable(q));
> +	xe_gt_assert(guc_to_gt(guc), !exec_queue_pending_disable(q));
> +
> +	set_exec_queue_destroyed(q);
> +	trace_xe_exec_queue_deregister(q);
> +
> +	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> +		       G2H_LEN_DW_DEREGISTER_CONTEXT, 1);
> +}
> +
>   static enum drm_gpu_sched_stat
>   guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   {
> @@ -928,9 +1057,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
>   	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
> +	struct xe_guc *guc = exec_queue_to_guc(q);
>   	int err = -ETIME;
>   	int i = 0;
> -	bool wedged;
> +	bool wedged, skip_timeout_check;
>   
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
> @@ -942,49 +1072,53 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   		return DRM_GPU_SCHED_STAT_NOMINAL;
>   	}
>   
> -	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> -		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> -		   q->guc->id, q->flags);
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> -		   "Kernel-submitted job timed out\n");
> -	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> -		   "VM job timed out on non-killed execqueue\n");
> -
> -	if (!exec_queue_killed(q))
> -		xe_devcoredump(job);
> -
> -	trace_xe_sched_job_timedout(job);
> -
> -	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
> -
>   	/* Kill the run_job entry point */
>   	xe_sched_submission_stop(sched);
>   
> +	/* Must check all state after stopping scheduler */
> +	skip_timeout_check = exec_queue_reset(q) ||
> +		exec_queue_killed_or_banned_or_wedged(q) ||
> +		exec_queue_destroyed(q);
> +
> +	/* Job hasn't started, can't be timed out */
> +	if (!skip_timeout_check && !xe_sched_job_started(job))
> +		goto rearm;
> +
>   	/*
> -	 * Kernel jobs should never fail, nor should VM jobs if they do
> -	 * somethings has gone wrong and the GT needs a reset
> +	 * XXX: Sampling timeout doesn't work in wedged mode as we have to
> +	 * modify scheduling state to read timestamp. We could read the
> +	 * timestamp from a register to accumulate current running time but this
> +	 * doesn't work for SRIOV. For now assuming timeouts in wedged mode are
> +	 * genuine timeouts.
>   	 */
> -	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> -			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> -		if (!xe_sched_invalidate_job(job, 2)) {
> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> -			xe_gt_reset_async(q->gt);
> -			goto out;
> -		}
> -	}
> +	wedged = guc_submit_hint_wedged(exec_queue_to_guc(q));
>   
> -	/* Engine state now stable, disable scheduling if needed */
> +	/* Engine state now stable, disable scheduling to check timestamp */
>   	if (!wedged && exec_queue_registered(q)) {
> -		struct xe_guc *guc = exec_queue_to_guc(q);
>   		int ret;
>   
>   		if (exec_queue_reset(q))
>   			err = -EIO;
> -		set_exec_queue_banned(q);
> +
>   		if (!exec_queue_destroyed(q)) {
> -			xe_exec_queue_get(q);
> -			disable_scheduling_deregister(guc, q);
> +			/*
> +			 * Wait for any pending G2H to flush out before
> +			 * modifying state
> +			 */
> +			ret = wait_event_timeout(guc->ct.wq,
> +						 !exec_queue_pending_enable(q) ||
> +						 guc_read_stopped(guc), HZ * 5);
> +			if (!ret || guc_read_stopped(guc))
> +				goto trigger_reset;
> +
> +			/*
> +			 * Flag communicates to G2H handler that schedule
> +			 * disable originated from a timeout check. The G2H then
> +			 * avoid triggering cleanup or deregistering the exec
> +			 * queue.
> +			 */
> +			set_exec_queue_check_timeout(q);
> +			disable_scheduling(q);
>   		}
>   
>   		/*
> @@ -1000,15 +1134,61 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   					 !exec_queue_pending_disable(q) ||
>   					 guc_read_stopped(guc), HZ * 5);
>   		if (!ret || guc_read_stopped(guc)) {
> +trigger_reset:
>   			drm_warn(&xe->drm, "Schedule disable failed to respond");
xe_gt_warn

> -			xe_sched_add_pending_job(sched, job);
> -			xe_sched_submission_start(sched);
> +			clear_exec_queue_check_timeout(q);
> +			set_exec_queue_extra_ref(q);
> +			xe_exec_queue_get(q);	/* GT reset owns this */
> +			set_exec_queue_banned(q);
>   			xe_gt_reset_async(q->gt);
>   			xe_sched_tdr_queue_imm(sched);
> -			goto out;
> +			goto rearm;
>   		}
>   	}
>   
> +	/*
> +	 * Check if job is actually timed out, if restart job execution and TDR
if so

> +	 */
> +	if (!wedged && !skip_timeout_check && !check_timeout(q, job) &&
> +	    !exec_queue_reset(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_check_timeout(q);
> +		goto sched_enable;
> +	}
> +
> +	drm_notice(&xe->drm, "Timedout job: seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
xe_gt_notice

> +		   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +		   q->guc->id, q->flags);
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> +		   "Kernel-submitted job timed out\n");
> +	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
> +		   "VM job timed out on non-killed execqueue\n");
> +
> +	trace_xe_sched_job_timedout(job);
> +
> +	if (!exec_queue_killed(q))
> +		xe_devcoredump(job);
> +
> +	/*
> +	 * Kernel jobs should never fail, nor should VM jobs if they do
> +	 * somethings has gone wrong and the GT needs a reset
> +	 */
Seems like the above two WARNs should at least be after this comment and 
maybe inside the 'if(!wedged)'?

> +	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
> +			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
> +		if (!xe_sched_invalidate_job(job, 2)) {
> +			clear_exec_queue_check_timeout(q);
> +			xe_gt_reset_async(q->gt);
> +			goto rearm;
> +		}
> +	}
> +
> +	/* Finish cleaning up exec queue via deregister */
> +	set_exec_queue_banned(q);
> +	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
> +		set_exec_queue_extra_ref(q);
> +		xe_exec_queue_get(q);
> +		__deregister_exec_queue(guc, q);
> +	}
> +
>   	/* Stop fence signaling */
>   	xe_hw_fence_irq_stop(q->fence_irq);
>   
> @@ -1030,7 +1210,19 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	/* Start fence signaling */
>   	xe_hw_fence_irq_start(q->fence_irq);
>   
> -out:
> +	return DRM_GPU_SCHED_STAT_NOMINAL;
> +
> +sched_enable:
> +	enable_scheduling(q);
> +rearm:
> +	/*
> +	 * XXX: Ideally want to adjust timeout based on current exection time
> +	 * but there is not currently an easy way to do in DRM scheduler. With
> +	 * some thought, do this in a follow up.
> +	 */
> +	xe_sched_add_pending_job(sched, job);
> +	xe_sched_submission_start(sched);
> +
>   	return DRM_GPU_SCHED_STAT_NOMINAL;
>   }
>   
> @@ -1133,7 +1325,6 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   			   guc_read_stopped(guc));
>   
>   		if (!guc_read_stopped(guc)) {
> -			MAKE_SCHED_CONTEXT_ACTION(q, DISABLE);
>   			s64 since_resume_ms =
>   				ktime_ms_delta(ktime_get(),
>   					       q->guc->resume_time);
> @@ -1144,12 +1335,7 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   				msleep(wait_ms);
>   
>   			set_exec_queue_suspended(q);
> -			clear_exec_queue_enabled(q);
> -			set_exec_queue_pending_disable(q);
> -			trace_xe_exec_queue_scheduling_disable(q);
> -
> -			xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -				       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +			disable_scheduling(q);
>   		}
>   	} else if (q->guc->suspend_pending) {
>   		set_exec_queue_suspended(q);
> @@ -1160,19 +1346,11 @@ static void __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
>   static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   {
>   	struct xe_exec_queue *q = msg->private_data;
> -	struct xe_guc *guc = exec_queue_to_guc(q);
>   
>   	if (guc_exec_queue_allowed_to_change_state(q)) {
> -		MAKE_SCHED_CONTEXT_ACTION(q, ENABLE);
> -
>   		q->guc->resume_time = RESUME_PENDING;
>   		clear_exec_queue_suspended(q);
> -		set_exec_queue_pending_enable(q);
> -		set_exec_queue_enabled(q);
> -		trace_xe_exec_queue_scheduling_enable(q);
> -
> -		xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> -			       G2H_LEN_DW_SCHED_CONTEXT_MODE_SET, 1);
> +		enable_scheduling(q);
>   	} else {
>   		clear_exec_queue_suspended(q);
>   	}
> @@ -1434,8 +1612,7 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	/* Clean up lost G2H + reset engine state */
>   	if (exec_queue_registered(q)) {
> -		if ((exec_queue_banned(q) && exec_queue_destroyed(q)) ||
> -		    xe_exec_queue_is_lr(q))
> +		if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   			xe_exec_queue_put(q);
>   		else if (exec_queue_destroyed(q))
>   			__guc_exec_queue_fini(guc, q);
> @@ -1615,11 +1792,13 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   		if (q->guc->suspend_pending) {
>   			suspend_fence_signal(q);
>   		} else {
> -			if (exec_queue_banned(q)) {
> +			if (exec_queue_banned(q) ||
> +			    exec_queue_check_timeout(q)) {
>   				smp_wmb();
>   				wake_up_all(&guc->ct.wq);
>   			}
> -			deregister_exec_queue(guc, q);
> +			if (!exec_queue_check_timeout(q))
> +				deregister_exec_queue(guc, q);
>   		}
>   	}
>   }
> @@ -1657,7 +1836,7 @@ static void handle_deregister_done(struct xe_guc *guc, struct xe_exec_queue *q)
>   
>   	clear_exec_queue_registered(q);
>   
> -	if (exec_queue_banned(q) || xe_exec_queue_is_lr(q))
> +	if (exec_queue_extra_ref(q) || xe_exec_queue_is_lr(q))
>   		xe_exec_queue_put(q);
>   	else
>   		__guc_exec_queue_fini(guc, q);
> @@ -1720,7 +1899,7 @@ int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	 * guc_exec_queue_timedout_job.
>   	 */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;
> @@ -1750,7 +1929,7 @@ int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>   
>   	/* Treat the same as engine reset */
>   	set_exec_queue_reset(q);
> -	if (!exec_queue_banned(q))
> +	if (!exec_queue_banned(q) && !exec_queue_check_timeout(q))
Why the !check_timeout here and in the reset_handler above? Surely we do 
want to do all the relevant clean up if the context has just been reset 
and/or triggered a cat error? If this is because otherwise internal 
state is going to get messed up when the timeout check resumes 
processing then it should have a comment to explain that.

John.

>   		xe_guc_exec_queue_trigger_cleanup(q);
>   
>   	return 0;

