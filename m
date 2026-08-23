Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CB4C5DF8C
	for <intel-xe@archiver.kernel.org>; Sun, 23 Aug 2026 21:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD8C10E06F;
	Sun, 23 Aug 2026 21:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/sSJJP1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4DC10E06F
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Aug 2026 21:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787520152; x=1819056152;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aLCoy7o0RQKoE7B45PTRjZRNVMAYEPmV9KYr1bUtwvw=;
 b=E/sSJJP1d2rJnDsVIw/rCj6ZVQSaUeNoImGAsPGBz5S6cucyjo59n8c3
 L6GImCleiVo4OsG9Yj1/5k3c9Q9AZug7pytHAjz7vYyirtz3p2cIhWIbq
 OOEUQ/IxHViy45ONOU748V+mSxwhEefUYMsJGU9Tp9JR6o8ZtzliswnUG
 X6xEneoj/YSIHc9aS1tw+uSHzJqQmn2it5KrwM3vfV8OIaP1WZziewvCp
 HZgkURuJEJiGj5pj12PqApkNKVxdmLy435tZcu+4Vu7Q2/RUaXCGTKRnT
 xGfxXZiO4Tmcy2InpLPyPeluwxUtbOAVWtouKa3+mR57awcdom5GI88fW A==;
X-CSE-ConnectionGUID: JGIWWXbHQLOIZz4SItTnLQ==
X-CSE-MsgGUID: xCkSpe/FQN+GOsCigwa6Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88034367"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="88034367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 14:22:32 -0700
X-CSE-ConnectionGUID: Dpf46bcJT4+cGRuU3RAXTg==
X-CSE-MsgGUID: JSemJ5xmRpenGtbMgwuWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="296740312"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 14:22:32 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 14:22:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 14:22:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 14:22:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwEtCwHuhz/P7ZuA7EIcW7amHh9rLUu03mntmJkmxdVEZj7Hp+8li4bfj44U2qJHOXinSYuWCk55k4FZH3RnhgZGJnFBzu6IUDXK7SCa+Ri7SlCD7ExFMTPO1afuZdalIC0/wRP8AUvJS40kuXMWaqsfnaPdzkkouwrMSTZwM251XpeNOju6XwbFYBEVjFE9frCrBNWApwujEe+lhpLPmGs6cF+uaf7SZiezQzpi9lCU3j2NS4liTrMa+xNRmLYouTgF6Ichg3I6pUPTzLygv0cq8ICz1Re542R8jpDlbHqeDgJ3VXztnM2WR0A7A8Ekl/BQD85r8stStW0rmUzFeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNiRRZ3QYjVYiwP5RskUaOdWMmD3HN3i+6ki4k3vW7U=;
 b=hFnykvqTJzeV3Kc4Z7OZCmJS6rEm35KL07dPZ652MaccipYVV6lIsKlI8j5WrEsR3t41rh3tSLi7si+5RqPv2ZMqD03jzTSb/TxfSPWJctlawXcpopEzvMUa537HSC8x+K9xALVLs1sIxrQ4omzhwE9Lcupghe6WjvBwEAfAQr70GTN58BMdcBW+Xu88aRZZDnBLWgbKOOukuHWxZ3DNabVsWYhMGwiAI96PuiPS6j6AJpdSpgfw9QMlIHdUP67j86nCW53/vZbazsJHkYWd3BZNf6VBJptt8oek31AN+qMGD0PgPLDack+g6vdtw1r4oZzVbLjhCWvPtXzvO3wO5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Sun, 23 Aug
 2026 21:22:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0339.012; Sun, 23 Aug 2026
 21:22:25 +0000
Message-ID: <face4f61-b67c-4dca-ae02-a32cef75dbc9@intel.com>
Date: Sun, 23 Aug 2026 23:22:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] drm/xe: Add a new debug focused configfs group
To: Matt Roper <matthew.d.roper@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <daniele.ceraolospurio@intel.com>, <shuicheng.lin@intel.com>
References: <20260820210639.107524-12-stuart.summers@intel.com>
 <20260820210639.107524-16-stuart.summers@intel.com>
 <20260821220853.GG681121@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260821220853.GG681121@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d2::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: bdec892f-6a23-4a33-ecb2-08df015ca0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|6133799003|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: QFZ44Zb0q27rXka2uOz6GJCbGkC0NFRix547jCfJvWrWkjnjsNYooM8sEuJ2WLUUSs+n5FzvCSmZ8hCnMoQMR5QG3CJxtGHHBSL2p4Cm5AAGafSPICOJ6kaA7D1P4jobyJPE/UQ8qfGlituJMXVWA2NQyf71C0a63H87qGdqzX3VKvd/4pAOF7ASdB54dSw3A3fVzbyjCXSS6sUGpmnxQQEoqwNj1ytGA1lHwZwOrQfOjqu49Tgz8kQ9hf2IStmYdHa+hjXcBhcFsffgC05GJhKThFLc3O2rHbj9KY8pwOOhMGdifB0i/HyFMJLXbcqufFA9b9jv+UQXLbyedROsp0CB6mYUlG6CWpGTklVtSnMHiLp7dtita5UXRdOiv6xTBOq+p1/N8OVv3cN1zYnmNEn3n3hEU6D8BLGlJe3ndvq2S2YoXGMgQ2/VPCkwFLUY62FlpCubQdrHjSFdre+hzhGOjWJhdNqakisfcoIk1kw7jjT+QfHPeTuyqLeSj5MV9SiVpzedFbqCJBa0xKJjuhHfS1jvgGxKoc9BELlF0nVTATh26S16xAWlcnouVhb/3vldjDk+xXerKRfAO3QS7ItmDhpxWW7WFTK6e+qBjJ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(6133799003)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHhVek1ET2xrbW8rRUZQQjRoWCttUFJGaTFYMEtYdFJrT2I4ZDdyajVpNkV4?=
 =?utf-8?B?YkNwTU5aaGJsZ1FtQ2x6Q0dRQ0sxNmtlWmg1UGNMNDc0ZWZudUUrYkVycW02?=
 =?utf-8?B?UHkvU3dsNWZxZTNnUVFMZE5GWXNRZjlsMjBJUE1zYTZTRSsyY1p0dUZwZDZD?=
 =?utf-8?B?aThMRkw3aUtydWVTbHpoWW1MYjh1YnFRMGpQWURVZUxrUEREZlpYcURlcW5Y?=
 =?utf-8?B?ZGJLR3VjU1MzSUNYK3BueW9jNXdrTlAzTVVnZGtzdG9aWW8xOVpFcjRqVnly?=
 =?utf-8?B?OEI4Mk5vZVhLbjRaQldDV1RIWnRqQmJobTgzdEMyN0gwT3VDbEg2S0lJOXVH?=
 =?utf-8?B?QnJKS3VPSFJqTW5qN1d0d2pFVnZEczQ3NmMweitNRTErM2U0Z3ZNMjJhREg2?=
 =?utf-8?B?RDRHUllvMlNOb2V4MWpnb0ppZ1ZIWkRobkRFSFFKYmVxbXpuMDFPeHJYTENP?=
 =?utf-8?B?bGpEdkcycjRwdG5pMDF2bVBzQmx0U0FBR3lwNWVhUVZ1M2RFNGtCR0tiYTRG?=
 =?utf-8?B?QSt1aGIxNEpDZEV1a1pOVVNLNjJLOE5EbG9DNXIxeW5vTytWVWFqT2VheVRz?=
 =?utf-8?B?eVpVcCtuWXBrSnF2dnl5MFlQYXR6Wkw2YVIzWmMyQmdOclNWYVZCMTM4OWJ0?=
 =?utf-8?B?eHV4QzEwbEpzc0hmM1o1MGNtT2RWWDRsZmxiRHkwRURDaGF2Zk5kMDZhRDZF?=
 =?utf-8?B?c3pqQWZIS1FnQzNtODhiRE4wbHJPRmNlOWNyeER1TlNOWkxBWW5nZkZaRmpr?=
 =?utf-8?B?QnYzODZlMU43U0w1QTBsUXlFeHVLbXBpM3hIWExUS25ISmovWElZK005enJF?=
 =?utf-8?B?Q3hLUTRpZHNjS2FWc0ZPQWIvU01IRzZ6U1FvZllCREZaVW51ejJXZ1lNeE1U?=
 =?utf-8?B?QkQ5blBhRHplV1dqSDN1dDhwS2hqazl0dlBGSEJPdEV3NC9TendhVzgyNWRm?=
 =?utf-8?B?Y1VCZHhIRUl5aU9KWnlBMDB6QXFrMkphc2lFbGZpcVVNQnZtMW1XcDk3ZldI?=
 =?utf-8?B?TmF0S01XTWRRdkEvMFloeUJvRnpFVGlhTmdTVU9qZU1KVk13UEVDUFl0WVIr?=
 =?utf-8?B?cDAzUUlMZ3F3dnc3WHIzNG5PU2o4NWN1S21TQUtkV3VQbkduUXg1Z1A2VW1w?=
 =?utf-8?B?eDZkdlJCWTNTZTNvVHlrN3I1UlBmak5qaXBXdy8wYVQrKzRzd1kyRU9PbnNl?=
 =?utf-8?B?MnFzbnptRlRWaWhVT2YwbkF4Q3B6blZXR1o3V1RXQ084cllaYkczcEpJV1lr?=
 =?utf-8?B?cWtjZlRJenFwMGhNTWVTM1pMNzI4NjM0ZnkwZWJpTDRDT2h5c1l4NHEweDdM?=
 =?utf-8?B?T2NUVHB5WEc0THNBa1B2eWJQcVd5akRudTRCa3ZiRjlmU0pVNHJudkkxOHNK?=
 =?utf-8?B?NXBuOXp3R2R0aUdiTVVROUJWaGZ0VEdVdUEvcEhMMFpUNDRKdEhZZ0czS3RL?=
 =?utf-8?B?R0NScXdXcjd0Tk1NSkFNOVRLM2FRUFROWmNBWTNpU3lmSmhpQ2Q4ZENKbVh5?=
 =?utf-8?B?UUlPTmZxQnUxOWdmMHc5aEU3VEttaVhjdlo5UXhYakozR1YwMFdpNTRJT0Y0?=
 =?utf-8?B?Nmd2Q3FYWVAvdUxYcFpYM1h0ZVpnUjQzQTNVZFhZai9iN1gwMC9HeXB2a3FC?=
 =?utf-8?B?d3I2TTZWRG9PNE5tK3lWYUxVbFVHMi8xY1M5L0lxbUtqaUZpbXBvRFFvVjRk?=
 =?utf-8?B?enk4R0lCTGxLL3ZOcTZTVi9DbGUxK2V3MitsV09qMkJmTzJCWFhMQytHTFVX?=
 =?utf-8?B?QUtxZHJ2WjlsZlZyek9wMUVhdWZlK1FSUW81T3BZWFZzUnpzY2Z3REJnVlIz?=
 =?utf-8?B?QlBWWTFwMW93bzlRWGlxd2RjZXdJMG9GVjBpd0tXdXNacXVxblBPUkZoVnJr?=
 =?utf-8?B?V3NnMXNuSk1lMjZWREFFQTRXN010U21qUWh4WnYxaGhkSnFwbjhidk5Xci9x?=
 =?utf-8?B?aDhacjdUWFpVTlJJanBUYlVMZjA5SXpQak42ZTV3eEV1MFJ6V3lETVVBNFR0?=
 =?utf-8?B?WGFwWlp4WW9CUXFnSWFUb0pUWGNndmlGcEh6UTZiYXJQRGtmQ1pjaTNLaG1x?=
 =?utf-8?B?TGQzcXlGU05nZXhrWXFGcUFKOHN5RG1YVmNzNXJVNGkwZERUdE4vVzFNaE1W?=
 =?utf-8?B?WHNkemJZOWgzckxoMlZabXpCYllpeVJUU1lPNjcxTEJxWHRyTEE5NW93bzJW?=
 =?utf-8?B?YmdmVHZrVURWcisrbGw1ay9yL2xmN1dxYzZTdk5qUGRJbXVtNnY4WUVONzli?=
 =?utf-8?B?a2FVMUdFck5ORjI0N3lRVC9obG9GTWhSSWpGUmlSdGMzbndVZDJzbmRuY1J0?=
 =?utf-8?B?VXFRQnBXNlJPQ0xUY1hXSVAwQXhMTExPNW0xWnFUYjhWenp4eURCZEFWVStK?=
 =?utf-8?Q?vleGCka9D85hKOGQ=3D?=
X-Exchange-RoutingPolicyChecked: GlxLT3gvLqw9a3r65PZb0p707sf27/hyFnYd0XBGDckzDR7uArXqNwJ9c5gv+Qh85sip9YX1Svp88qwZXfaBYrtKlTxDheVAN2tKXwZS0hHu8ythYoDuxpW2DoYZ8wpYuv1mO9WG3+tzGqDS2Z1N7mQ6u66QZcPc8xPu5R1Mwg8crnMZmKFJ7WBMCdaOXUn9m11sVo4VZbBdnFfk0Qy2hBoy5MRJ4vFGJMNFZ2cb7i7NgbbfB1vMrd/b1CC8uEjDdWT1ekGAuo1voRbtpmsL1szw4Sf7DPdiRNjQcGNwBomsrkbrwbkON3rXMDWc170PCO7al0TbX6zBIgCSR+IwHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bdec892f-6a23-4a33-ecb2-08df015ca0c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2026 21:22:25.7261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8en/smyqOcY8cZxCBVEIECWdV48rJGIhNe9En+fucAEZaaGckoxAVR+gTs2IKs+ReTCxhEPHZmxZpnWzUYQ3BU6DKmGKFRLPJw5cfdEeXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
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



On 8/22/2026 12:08 AM, Matt Roper wrote:
> On Thu, Aug 20, 2026 at 09:06:43PM +0000, Stuart Summers wrote:
>> Add the skeleton code for a new debug specific configfs group.
>> Just add the structure for now. Actual debug content will be
>> added in a subsequent patch.
>>
>> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>> Assisted-by: Copilot:claude-sonnet-4.6,claude-opus-4.7
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/Makefile            |  2 ++
>>  drivers/gpu/drm/xe/xe_configfs.c       |  5 +++++
>>  drivers/gpu/drm/xe/xe_configfs_debug.c | 14 ++++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs_debug.h | 13 +++++++++++++
>>  drivers/gpu/drm/xe/xe_configfs_types.h |  3 +++
>>  5 files changed, 37 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.c
>>  create mode 100644 drivers/gpu/drm/xe/xe_configfs_debug.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 92134709d998..0b71f311c9c4 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -163,6 +163,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
>>  
>>  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>>  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> 
> Not really an issue with your patch here, but since we're messing with
> kconfig stuff it reminds me --- I'm not sure our pre-existing configfs
> kconfig handling is entirely correct (and I think I've seen kernel test
> robot warnings about that too).  The concern is that our header file
> does a typical IS_ENABLED(CONFIG_CONFIGFS) type of check to decide
> between extern function declarations or noop stubs.  But if Xe is built
> into the bzImage, but configfs is configured as a .ko, then Xe can't
> reach the configfs functions.  I believe there's an IS_REACHABLE() that
> maybe we should be using instead, although I haven't got around to
> actually looking closer and trying it out myself.

I was already trying to use IS_REACHABLE [1] but Jani is against it [2]

[1] https://patchwork.freedesktop.org/patch/696103/?series=159395&rev=1
[2] https://lore.kernel.org/intel-xe/e22a535a6405412aaeb0f2251733840b72c93b56@intel.com/

> 
> Your actual changes in this patch look okay to me.
> 
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Matt
> 
>> +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) := xe_configfs_debug.o
>> +xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
>>  
>>  # graphics virtualization (SR-IOV) support
>>  xe-y += \
>> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> index 029c9f682c8e..33aea1150c86 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs.c
>> +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> @@ -14,6 +14,7 @@
>>  
>>  #include "instructions/xe_mi_commands.h"
>>  #include "xe_configfs.h"
>> +#include "xe_configfs_debug.h"
>>  #include "xe_defaults.h"
>>  #include "xe_gt_types.h"
>>  #include "xe_module.h"
>> @@ -1242,6 +1243,10 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>>  		config_group_init_type_name(&dev->sriov, "sriov", &xe_config_sriov_type);
>>  		configfs_add_default_group(&dev->sriov, &dev->group);
>>  	}
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	config_group_init_type_name(&dev->debug, "debug", &xe_configfs_debug_type);
>> +	configfs_add_default_group(&dev->debug, &dev->group);
>> +#endif
>>  
>>  	mutex_init(&dev->lock);
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> new file mode 100644
>> index 000000000000..45617282cec5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <linux/configfs.h>
>> +#include <linux/module.h>
>> +
>> +#include "xe_configfs_debug.h"
>> +#include "xe_configfs_types.h"
>> +
>> +const struct config_item_type xe_configfs_debug_type = {
>> +	.ct_owner	= THIS_MODULE,
>> +};
>> diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> new file mode 100644
>> index 000000000000..5f938450aed2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#ifndef _XE_CONFIGFS_DEBUG_H_
>> +#define _XE_CONFIGFS_DEBUG_H_
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG) && IS_ENABLED(CONFIG_CONFIGFS_FS)
>> +struct config_item_type;
>> +extern const struct config_item_type xe_configfs_debug_type;
>> +#endif
>> +
>> +#endif /* _XE_CONFIGFS_DEBUG_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h b/drivers/gpu/drm/xe/xe_configfs_types.h
>> index 3be7d6160b4c..e22b9424f719 100644
>> --- a/drivers/gpu/drm/xe/xe_configfs_types.h
>> +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
>> @@ -22,6 +22,9 @@ struct wa_bb {
>>  struct xe_config_group_device {
>>  	struct config_group group;
>>  	struct config_group sriov;
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	struct config_group debug;
>> +#endif
>>  
>>  	/*
>>  	 * Fields sorted by type (largest first) then name: struct arrays,
>> -- 
>> 2.43.0
>>
> 

