Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FCCCCA470
	for <intel-xe@archiver.kernel.org>; Wed,  1 Oct 2025 14:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6787610E0D0;
	Wed,  1 Oct 2025 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ix8gaipL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3109310E36D
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Oct 2025 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759329465; x=1790865465;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZpkGeSNpuoYYv/8Q9HklGySbQAY/AyBGDN4Lkt+GVBQ=;
 b=Ix8gaipLN5Bx+WDOtVS/X2GWVedz/zWVHcA8CD+SEMbg3HLxKw9VKbY1
 klDYr/tSue9vrv6cV2mz+a4Bg37/4I93wCEPyULyx1I91Y5GBotlMAZTt
 qndhoLVIWS56pKp4BMuhay9SG/Thob7BiiGT6yE+vLWlTTt49d5YKpkA7
 jlGoQSD+2nfsZseO48JENMqkVJJob13qMZwR5muyGHwe7ybTje+rhq5We
 gRAFqTaHSxqfe0NdrHJlWm9xiwA3Xej7bZPlUQNwHMAwDHauW4zoc5GPu
 efOPsTW55B6NA40rz7T2ZWLDpYF6suTGRimGltB4wOr7Ad/PBsr+2NuWx A==;
X-CSE-ConnectionGUID: f490LzfSSWO5PxyRLetoaQ==
X-CSE-MsgGUID: iUrHaAsGTQmbDjyZ0c0u+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="71851442"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="71851442"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:37:44 -0700
X-CSE-ConnectionGUID: Y8qR5u/bTm+w6lemqWe6QQ==
X-CSE-MsgGUID: pO5j8gq9SLSNqPFSh6mRGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="179221537"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 07:37:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 07:37:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 07:37:42 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 07:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLLgjpSi6iS4U/bpzkVwByI2FPPxAtTu2WaQ0X9kaPs4qoQrO9n7fALZRnIEYlRTnYn+1KPg34Zg4/zU78vFUdrols4cuyonw5C2xCTGBPyuzUo3vkW/T/ZyDEsCcAQkqfdIT5fdh16Dc3EAnBAWX9JjzGc6kxy4NATlVHH7rXtB1Zi4eDYyf+2S4iBnjkNOsOyxfQPn6COJIQUavUl90RGtW9BzPzRe14PSmYgbuXHQJ3eIpN43KMrWUoDcakFScGXfapbt+rZxIgEC8p8GjINs13z/9XHyw8QGmvGVsL7EI5/9/3nA6XaZDUhB+Oi9KpxzUHNHXS6o+zpix2Qcww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYTKt0Pi+PNalbBxzLZnx/x2kuE6x91WxKW8zaSUnOE=;
 b=ysKxeAXxgxVlO12SA3Sp5eYOsVYuoYSK04m/Db+bLXDQkE0cnMLgQy2N+6P0HHYlh7DVjeFgsvgH80g6vSuijjXa2xk/wIzcVR62AuyQIXAPVQfGoR7RP5nqBtf147vksLDPRPECpChVG9IIPD5Um8v0mA4pJu637JCj1wOgwhlX9XRAWb4EoynFV+gViG/a456YZ8sbbwkdfzXquiiGHZnPRC8uFTlq+iLdEaztJNFWwchCXKUfJgI7UF1QpS/r11aRZ+oPl6ARgeznfd2gEMAcrH9vg5zo2TQkxoI/r9/aiKR2cHxYujpQytYv66DaBkgyy9psQbackynhHU+20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 14:37:40 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Wed, 1 Oct 2025
 14:37:40 +0000
Message-ID: <bd5f4907-5ff3-407a-b385-86533e4e58af@intel.com>
Date: Wed, 1 Oct 2025 16:37:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 28/36] drm/xe/vf: Replay GuC submission state on pause
 / unpause
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-29-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-29-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0079.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::20) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|CO1PR11MB5090:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d13425d-3a7b-45b2-fb0c-08de00f812d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1RhcWoyd2ZWaGxGc0lqU0tDRTgrSXhIRGkzYTJGWXNBM2M0Q2R1SmhKZmVp?=
 =?utf-8?B?Vk90TG5ZODYwcDQ0SzJHQStub1d2ZEpTNFpEVm94T2ZReU9zZk1ieWRTM0k4?=
 =?utf-8?B?ZHVhUXJlUGU1Y3JiQzYvelY3cG1wZkJLUUd2c1MvbUpPVzhhSFBHTEVmM2Ru?=
 =?utf-8?B?VlhiWEJQMUIySFBTejZ0VFRnSDZ3NmVTSDEvOE5kd2xKd29HVmZyTWlDc0Ur?=
 =?utf-8?B?UmI3Wjk4UWRQbFFFRG9qRHZSM0Q5eWV0eDh1cTJxa042Y1VuRWowSDRnaXZE?=
 =?utf-8?B?Uyt3UHBWbWxVWW1NZkphaWl4N0lWTS9ZRmtyWG54REFBZEdQeUdCOXkvSjJ2?=
 =?utf-8?B?cVppNHRRUWl4bDlnRTFENFlwa1MyUSs3MXdic1RuSjZMNWtpUi9SRlY2enVC?=
 =?utf-8?B?VGZqQ2x5U3RzeUpIWTRkMS8wbGVHUFRkSGZjTUhSYy84b0Z0bXRlMjhjWDFi?=
 =?utf-8?B?b3NlKyt0QnpTdE1qQUxtSjlLZnFkWDRJbUNHYjRJL0g3eFd0eVZua3F4aXNk?=
 =?utf-8?B?UFkzSkpwOWZiZU5yNGpqSFlkYit6UTg4dUVVako0elFKUVBEeGJNdGxNT3lU?=
 =?utf-8?B?TzV5UlpBVGxtVldEdWtQN3NrOWNGUlFZQURCTVltYlZva2hCNzY3Z0N2VFh2?=
 =?utf-8?B?QTZORE5ENHQ0WHJHaFozelRJbVdGWGRrdkhSYXFzbWhRZ3ltZ1llZ3Znd25H?=
 =?utf-8?B?ZzdlRnFWNng2VHpSTDR3S1UyWmZzVXBLcEJoU0VyaVVwVUNvQmVVVnRCZmJ0?=
 =?utf-8?B?empGQW1Xa2pvRVZzRkNDbnRDVkFuTHgzQVBaMWhBOXdncTZXZHBiaEYwbGJy?=
 =?utf-8?B?MGkxTThQTXU4OHZFc1d0ckZJSzNqT0tOaWp5VGczaURRalFuTUQvTTR3aXJT?=
 =?utf-8?B?YnoxdXk2WXIveVRqSWpkU1B4OTcwOTFOTVZGWGM5UTNBYzk3aVlvSmV2Y0Y5?=
 =?utf-8?B?VG5Rc0V1ci9kcVh6Z0trU2FlMkJIT3c0TCtLdUQ1L2gva0RNaktobXFTci85?=
 =?utf-8?B?Ymk4dzRVa01iUmpIVStobnlwNENpdTQzTUh3ZUFYekJYbGpIbHRRNElhQlNM?=
 =?utf-8?B?azhOa3VaeXhSRW1jZWNzT2hicFNmTU5RdXFtSk9nMmc5MDk5Qy9tTCt6YXp4?=
 =?utf-8?B?eVA2ZHc3OGRSNnE5VHdDUjV5V3ZyaFE1ZGZadmNvWUkvaGppVWtmdUZmblRz?=
 =?utf-8?B?Nnl0U0s4RUpnQW43NUJLeGtISDB4TnQ5aExsQVJ6RzNXUE82YUZCaCtCajMw?=
 =?utf-8?B?MndsbjBoN3c2Z2hEVmIza2tGTDJobjJtN1Y0di80YTNlc2J6bHJPVm1pR3hk?=
 =?utf-8?B?QmZiQUZEa1pDQUgrV21jM2FSYmFXanc0WXZUL0YxMmlVNFdKaERIZGhaK2Zj?=
 =?utf-8?B?VVowRWhYWlpyaWtkbHVrdFhZRUhtNTAyT05ocW9oRDYvS1k1UExReFBiM2F2?=
 =?utf-8?B?YURZNXpsbm9MdkwrcEMrU3VkOGQvaUd2OWFrMTQwTWN5THgwUEFiZEMzUHpi?=
 =?utf-8?B?Q1R1MExwUUhwMEpyaUVKdXFVV0lNTHAvTmpyNjV4WVlKRFF2L28xaWhiKzFC?=
 =?utf-8?B?a21BTSsxLzVWSnNid2piKzZJUHBkK3doQmVkbEE1WE5GM3BzR2IvUGFsWXZ1?=
 =?utf-8?B?NjRqUWhHVVlraFhCaWZMOVJMa3VVVm16Q04wc3J2aE5nd3NaWi9kQ3lRaU50?=
 =?utf-8?B?QWJoaTlqZ3RVODk0Z3h4UGpsOEVpd1U1bUQ4SER6MFhReXJ5dHczZjd3YXdC?=
 =?utf-8?B?dGxTZ0YvNHYwTW9iQ1lZLzZTZnYvUnlzRlg3VGh3azdydE9BSW5qZjAxOUtn?=
 =?utf-8?B?VDgydFBHaWxyWVEwbnM4YTlFQzY3S3B1a1FlNGVYWldCSzE0OFVqYmR6eDE3?=
 =?utf-8?B?MXFLOHh5amFFNER3UXRxSlFoYlBpbktWNURnajNqMDREZGdQUWE5MlRqaXd1?=
 =?utf-8?Q?/Y7aaIZ5Sgx3PStjwjGEY8H3PkscDCLG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0ZrUlhaNjF1Y1pXbk02NjB6RmxqdDRTTmdNOFA1WnJQVGFhWUF6MlkzRXNm?=
 =?utf-8?B?aGhxU1A5b2hoekMzYWFXSGo2V2ZhQng2ZTl6UVZIQ3lDbGk4R2JwTXdVeDlE?=
 =?utf-8?B?RTZIdm51T3l0QzhvS3dVdHdNbFJVdkN2QjQvMGxkRFpaTWg1dmFXVk44Q241?=
 =?utf-8?B?K1FIdmdtRHpsWkRQYmNoN3FGNjVJZDlXVnRXUzJJbVlyT0pEK09zVXl6aTAr?=
 =?utf-8?B?T3F3L0R6dmcxdFJ3K3FYak1JUmt3NkpGWWxrS1FGV3RucHZKL01tTUZtL2I3?=
 =?utf-8?B?VWZsTUxVREhEcEpTdUpySmVKemFrN3FOL0U2eXBTc0RaWkZhKzBYZzM3TFdF?=
 =?utf-8?B?VUJ5Rzh2aHo2VFJXSkVlMG4xL1FwU09yWm1PcEFNOVdrTzdUbnZudTN6TlhO?=
 =?utf-8?B?bGJheFZQL1JSUlBZSUNReHV5VVlaMlEvbitFMFd5WDhST2w5QXpuMW5mZ2Rk?=
 =?utf-8?B?akI5SGUzYVFnN3Q0c2gwL1VHU2FBa1RxZnd1N3c3OVJQRWh5R0YwVkRxdm1H?=
 =?utf-8?B?MkNnQnJacXBFY2dKYWtycjhrVUtSNkM4NTdLSEo4blRoMnB5MGlTQ3F3Zno2?=
 =?utf-8?B?U3ZnVkdDTmllcEgxTzd2Rm12NjkrRUNZWTI1ZlV6Qzcxb2g5MEYxd2QxMlZw?=
 =?utf-8?B?cHBlY1FoNllMQXNmcnBNTXltVS9OM2NSc1hLeWxpbUU3U1M3V2NUMlZuUnMv?=
 =?utf-8?B?YjlNYTJrVFpqZzdrQk4yUitKZDlJd2RkVUhZRkphcGFjYk1XeTNKNTd6MEx5?=
 =?utf-8?B?Q2svNHFLL0UwUGw3b0RMejNYUXZzaEtPeEl5RVFRQUQwZkZKQ0hsVCtUUkQ4?=
 =?utf-8?B?dWxBdXJhMDc0aEdCSkJSRmd1dUtsSERDZ1F6OWU0KzdHeDY3WFNXSmtJd3VT?=
 =?utf-8?B?S1FaY1VRTWRMV3BzWXZnL2JxUTJ4RWhEZHdjNnllaytuUTBVRW9uYm1xM0Fy?=
 =?utf-8?B?MFlybjNRYmI3TUVveGNqYkZrV0Y0SmN5T1FiNW0zaFdrWC9IVXdyckhKREEz?=
 =?utf-8?B?Rk95MHM0cDh6clNnOWZIRmtCSUlYZW1XSkhEaktJanVvMWN5NUhQUWZBSjdK?=
 =?utf-8?B?ZHljbjhQUDNCcTZBR1Fzb0l1bUNEWHdHbDhDYTdyY3kwTXp6S2FHSEQ1Rm5X?=
 =?utf-8?B?SGlHRWZsWGZaSktWUnJEWmhPQTk2dFhXTGdhVHU5ZTdEYWNNSFZ3TFZQQncz?=
 =?utf-8?B?cTVSbG9NaXZRd1VsTXFDbEE3WmU4ZURtVzJmbWtKa2l3c05UN2tIWTRCYU95?=
 =?utf-8?B?YjFwV0FIZ3dMUC9zUG9WTllpTEQzdEw1VlRhTkUrRDNQcVNid3grUEJiOFZC?=
 =?utf-8?B?cDZQK2xLYjQ4b2ZGQzRCUDJ5VTJWMzhZSkhGYlczaWRDOWxkN2p2ZDZNcVYw?=
 =?utf-8?B?eEJsNXhqcDNqN2JyNmlDb2RJanV6ZHNmUlpDK1VkQlUvaVpGUDZZS3RDSzV0?=
 =?utf-8?B?SEdWM2ZBV1YySmcxTXo3K0ZQb21MUEJOZEtuTjVZdEgxSGFNYlpqNTBVcVA0?=
 =?utf-8?B?b3I4VVVDTkYwcEkzUmZMaEZaQWY3Ni9LcXc1RmpZRHdwd29lUXJVZSt5bWNN?=
 =?utf-8?B?bGE2MlV4MHM3Zm5WeWh1Q3NOQzNmUTAxQXRRTFB3aTVxaWRHSFkwcWlFRk0z?=
 =?utf-8?B?dzRwL1JreDA5NDVGZkY4YlN5S213L3Q5dUF6enNFeDlKaWFQZHF1UmxYVGdv?=
 =?utf-8?B?czVYWlcxQlNLaEtwSjdzdXNadG1SRTV2amZIdnBmcHBQejcyckNBSTc1MTFx?=
 =?utf-8?B?azNyMFIxMUxISmU2RHBiSSsvM3lqMkdZaEltYzVHZWxsQVZhTWZ5cEJWaEda?=
 =?utf-8?B?MEo1MVFOZFdCUWpwU2JQL3MwcHo3bDhKdVN0bzJ0NWwrYkptR2lFY1MrWFc3?=
 =?utf-8?B?NXNVNDdoeFg4dXZZZmMxZEtJU204ZDhNcGRCTVRES0JwN055eDR5MHRQMEZY?=
 =?utf-8?B?SVMyL2JaZUZHZEFsSHUwUXlCeGpVczVBbjErTzNxS2MrZVlRQkFqZGhScXhy?=
 =?utf-8?B?ZnpSYk41V05JL1BJMzJKaHQ1Vys0YXZUTXpveXZCb1lGakdZc2d0UDVibEFF?=
 =?utf-8?B?QlhjanBGdkQ2aWpCRHdNU053bWVKaGszUi9LanVFcVA0UTF0bjBLZTlEdVUz?=
 =?utf-8?Q?XWGJB5YEYf2Kn8mCkPA1M5c3g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d13425d-3a7b-45b2-fb0c-08de00f812d0
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:37:40.2924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJuqN2jzEM/RuIrhZ9mIC2rGoUQSF8y+651Gu5IPV8G6E1dRGCrefjqfmZ84TAfdfCHhK5d08fxn/F8+GQXdeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> Fixup GuC submission pause / unpause functions to properly replay any
> possible state lost during VF post migration recovery.
>
> v3:
>   - Add helpers for revert / replay (Tomasz)
>   - Add comment around WQ NOPs (Tomasz)

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gpu_scheduler.c        |  14 ++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h        |   2 +
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c          |   1 +
>   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h |  15 ++
>   drivers/gpu/drm/xe/xe_guc_submit.c           | 242 +++++++++++++++++--
>   drivers/gpu/drm/xe/xe_guc_submit.h           |   1 +
>   drivers/gpu/drm/xe/xe_sched_job_types.h      |   4 +
>   7 files changed, 264 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> index 455ccaf17314..af300adc7e1a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> @@ -135,3 +135,17 @@ void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>   	list_add_tail(&msg->link, &sched->msgs);
>   	xe_sched_process_msg_queue(sched);
>   }
> +
> +/**
> + * xe_sched_add_msg_head() - Xe GPU scheduler add message to head of list
> + * @sched: Xe GPU scheduler
> + * @msg: Message to add
> + */
> +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> +			   struct xe_sched_msg *msg)
> +{
> +	lockdep_assert_held(&sched->base.job_list_lock);
> +
> +	list_add(&msg->link, &sched->msgs);
> +	xe_sched_process_msg_queue(sched);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index e548b2aed95a..010003a6103a 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -29,6 +29,8 @@ void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
>   		      struct xe_sched_msg *msg);
>   void xe_sched_add_msg_locked(struct xe_gpu_scheduler *sched,
>   			     struct xe_sched_msg *msg);
> +void xe_sched_add_msg_head(struct xe_gpu_scheduler *sched,
> +			   struct xe_sched_msg *msg);
>   
>   static inline void xe_sched_msg_lock(struct xe_gpu_scheduler *sched)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 9f33561b91c6..0d94867dce8e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1217,6 +1217,7 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>   static void vf_post_migration_rearm(struct xe_gt *gt)
>   {
>   	xe_guc_ct_restart(&gt->uc.guc.ct);
> +	xe_guc_submit_unpause_prepare(&gt->uc.guc);
>   }
>   
>   static void vf_post_migration_kickstart(struct xe_gt *gt)
> diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> index c30c0e3ccbbb..a3b034e4b205 100644
> --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> @@ -51,6 +51,21 @@ struct xe_guc_exec_queue {
>   	wait_queue_head_t suspend_wait;
>   	/** @suspend_pending: a suspend of the exec_queue is pending */
>   	bool suspend_pending;
> +	/**
> +	 * @needs_cleanup: Needs a cleanup message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_cleanup;
> +	/**
> +	 * @needs_suspend: Needs a suspend message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_suspend;
> +	/**
> +	 * @needs_resume: Needs a resume message during VF post migration
> +	 * recovery.
> +	 */
> +	bool needs_resume;
>   };
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 99ea9b3507cd..497a736c23c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -424,6 +424,11 @@ static void set_exec_queue_destroyed(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
>   }
>   
> +static void clear_exec_queue_destroyed(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_DESTROYED, &q->guc->state);
> +}
> +
>   static bool exec_queue_banned(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_BANNED;
> @@ -504,7 +509,12 @@ static void set_exec_queue_extra_ref(struct xe_exec_queue *q)
>   	atomic_or(EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
>   }
>   
> -static bool __maybe_unused exec_queue_pending_resume(struct xe_exec_queue *q)
> +static void clear_exec_queue_extra_ref(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_EXTRA_REF, &q->guc->state);
> +}
> +
> +static bool exec_queue_pending_resume(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_RESUME;
>   }
> @@ -519,7 +529,7 @@ static void clear_exec_queue_pending_resume(struct xe_exec_queue *q)
>   	atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>   }
>   
> -static bool __maybe_unused exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
> +static bool exec_queue_pending_tdr_exit(struct xe_exec_queue *q)
>   {
>   	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_PENDING_TDR_EXIT;
>   }
> @@ -1079,7 +1089,7 @@ static void wq_item_append(struct xe_exec_queue *q)
>   }
>   
>   #define RESUME_PENDING	~0x0ull
> -static void submit_exec_queue(struct xe_exec_queue *q)
> +static void submit_exec_queue(struct xe_exec_queue *q, struct xe_sched_job *job)
>   {
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_lrc *lrc = q->lrc[0];
> @@ -1091,10 +1101,13 @@ static void submit_exec_queue(struct xe_exec_queue *q)
>   
>   	xe_gt_assert(guc_to_gt(guc), exec_queue_registered(q));
>   
> -	if (xe_exec_queue_is_parallel(q))
> -		wq_item_append(q);
> -	else
> -		xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +	if (!job->skip_emit || job->last_replay) {
> +		if (xe_exec_queue_is_parallel(q))
> +			wq_item_append(q);
> +		else
> +			xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
> +		job->last_replay = false;
> +	}
>   
>   	if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>   		return;
> @@ -1147,8 +1160,10 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>   		if (!exec_queue_registered(q))
>   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> -		q->ring_ops->emit_job(job);
> -		submit_exec_queue(q);
> +		if (!job->skip_emit)
> +			q->ring_ops->emit_job(job);
> +		submit_exec_queue(q, job);
> +		job->skip_emit = false;
>   	}
>   
>   	/*
> @@ -1865,6 +1880,7 @@ static void __guc_exec_queue_process_msg_resume(struct xe_sched_msg *msg)
>   #define RESUME		4
>   #define OPCODE_MASK	0xf
>   #define MSG_LOCKED	BIT(8)
> +#define MSG_HEAD	BIT(9)
>   
>   static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
>   {
> @@ -1989,12 +2005,24 @@ static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg
>   	msg->private_data = q;
>   
>   	trace_xe_sched_msg_add(msg);
> -	if (opcode & MSG_LOCKED)
> +	if (opcode & MSG_HEAD)
> +		xe_sched_add_msg_head(&q->guc->sched, msg);
> +	else if (opcode & MSG_LOCKED)
>   		xe_sched_add_msg_locked(&q->guc->sched, msg);
>   	else
>   		xe_sched_add_msg(&q->guc->sched, msg);
>   }
>   
> +static void guc_exec_queue_try_add_msg_head(struct xe_exec_queue *q,
> +					    struct xe_sched_msg *msg,
> +					    u32 opcode)
> +{
> +	if (!list_empty(&msg->link))
> +		return;
> +
> +	guc_exec_queue_add_msg(q, msg, opcode | MSG_LOCKED | MSG_HEAD);
> +}
> +
>   static bool guc_exec_queue_try_add_msg(struct xe_exec_queue *q,
>   				       struct xe_sched_msg *msg,
>   				       u32 opcode)
> @@ -2278,6 +2306,105 @@ void xe_guc_submit_stop(struct xe_guc *guc)
>   
>   }
>   
> +static void guc_exec_queue_revert_pending_state_change(struct xe_exec_queue *q)
> +{
> +	bool pending_enable, pending_disable, pending_resume;
> +
> +	pending_enable = exec_queue_pending_enable(q);
> +	pending_resume = exec_queue_pending_resume(q);
> +
> +	if (pending_enable && pending_resume)
> +		q->guc->needs_resume = true;
> +
> +	if (pending_enable && !pending_resume &&
> +	    !exec_queue_pending_tdr_exit(q)) {
> +		clear_exec_queue_registered(q);
> +		if (xe_exec_queue_is_lr(q))
> +			xe_exec_queue_put(q);
> +	}
> +
> +	if (pending_enable) {
> +		clear_exec_queue_enabled(q);
> +		clear_exec_queue_pending_resume(q);
> +		clear_exec_queue_pending_tdr_exit(q);
> +		clear_exec_queue_pending_enable(q);
> +	}
> +
> +	if (exec_queue_destroyed(q) && exec_queue_registered(q)) {
> +		clear_exec_queue_destroyed(q);
> +		if (exec_queue_extra_ref(q))
> +			xe_exec_queue_put(q);
> +		else
> +			q->guc->needs_cleanup = true;
> +		clear_exec_queue_extra_ref(q);
> +	}
> +
> +	pending_disable = exec_queue_pending_disable(q);
> +
> +	if (pending_disable && exec_queue_suspended(q)) {
> +		clear_exec_queue_suspended(q);
> +		q->guc->needs_suspend = true;
> +	}
> +
> +	if (pending_disable) {
> +		if (!pending_enable)
> +			set_exec_queue_enabled(q);
> +		clear_exec_queue_pending_disable(q);
> +		clear_exec_queue_check_timeout(q);
> +	}
> +
> +	q->guc->resume_time = 0;
> +}
> +
> +/*
> + * This function is quite complex but only real way to ensure no state is lost
> + * during VF resume flows. The function scans the queue state, make adjustments
> + * as needed, and queues jobs / messages which replayed upon unpause.
> + */
> +static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_job *job;
> +	int i;
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	/* Stop scheduling + flush any DRM scheduler operations */
> +	xe_sched_submission_stop(sched);
> +	if (xe_exec_queue_is_lr(q))
> +		cancel_work_sync(&q->guc->lr_tdr);
> +	else
> +		cancel_delayed_work_sync(&sched->base.work_tdr);
> +
> +	guc_exec_queue_revert_pending_state_change(q);
> +
> +	if (xe_exec_queue_is_parallel(q)) {
> +		struct xe_device *xe = guc_to_xe(guc);
> +		struct iosys_map map = xe_lrc_parallel_map(q->lrc[0]);
> +
> +		/*
> +		 * NOP existing WQ commands that may contain stale GGTT
> +		 * addresses. These will be replayed upon unpause. The hardware
> +		 * seems to get confused if the WQ head/tail pointers are
> +		 * adjusted.
> +		 */
> +		for (i = 0; i < WQ_SIZE / sizeof(u32); ++i)
> +			parallel_write(xe, map, wq[i],
> +				       FIELD_PREP(WQ_TYPE_MASK, WQ_TYPE_NOOP) |
> +				       FIELD_PREP(WQ_LEN_MASK, 0));
> +	}
> +
> +	job = xe_sched_first_pending_job(sched);
> +	if (job) {
> +		/*
> +		 * Adjust software tail so jobs submitted overwrite previous
> +		 * position in ring buffer with new GGTT addresses.
> +		 */
> +		for (i = 0; i < q->width; ++i)
> +			q->lrc[i]->ring.tail = job->ptrs[i].head;
> +	}
> +}
> +
>   /**
>    * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
>    * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> @@ -2287,8 +2414,12 @@ void xe_guc_submit_pause(struct xe_guc *guc)
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   
> +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> +
> +	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		xe_sched_submission_stop_async(&q->guc->sched);
> +		guc_exec_queue_pause(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
>   }
>   
>   static void guc_exec_queue_start(struct xe_exec_queue *q)
> @@ -2337,11 +2468,92 @@ int xe_guc_submit_start(struct xe_guc *guc)
>   	return 0;
>   }
>   
> -static void guc_exec_queue_unpause(struct xe_exec_queue *q)
> +static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> +					   struct xe_exec_queue *q)
>   {
>   	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct drm_sched_job *s_job;
> +	struct xe_sched_job *job = NULL;
> +
> +	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> +		job = to_xe_sched_job(s_job);
> +
> +		q->ring_ops->emit_job(job);
> +		job->skip_emit = true;
> +	}
>   
> +	if (job)
> +		job->last_replay = true;
> +}
> +
> +/**
> + * xe_guc_submit_unpause_prepare - Prepare unpause submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be prepared for unpause
> + */
> +void xe_guc_submit_unpause_prepare(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xe_gt_assert(guc_to_gt(guc), vf_recovery(guc));
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		guc_exec_queue_unpause_prepare(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
> +static void guc_exec_queue_replay_pending_state_change(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	struct xe_sched_msg *msg;
> +
> +	if (q->guc->needs_cleanup) {
> +		msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
> +
> +		guc_exec_queue_add_msg(q, msg, CLEANUP);
> +		q->guc->needs_cleanup = false;
> +	}
> +
> +	if (q->guc->needs_suspend) {
> +		msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, SUSPEND);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_suspend = false;
> +	}
> +
> +	/*
> +	 * The resume must be in the message queue before the suspend as it is
> +	 * not possible for a resume to be issued if a suspend pending is, but
> +	 * the inverse is possible.
> +	 */
> +	if (q->guc->needs_resume) {
> +		msg = q->guc->static_msgs + STATIC_MSG_RESUME;
> +
> +		xe_sched_msg_lock(sched);
> +		guc_exec_queue_try_add_msg_head(q, msg, RESUME);
> +		xe_sched_msg_unlock(sched);
> +
> +		q->guc->needs_resume = false;
> +	}
> +}
> +
> +static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	bool needs_tdr = exec_queue_killed_or_banned_or_wedged(q);
> +
> +	lockdep_assert_held(&guc->submission_state.lock);
> +
> +	xe_sched_resubmit_jobs(sched);
> +	guc_exec_queue_replay_pending_state_change(q);
>   	xe_sched_submission_start(sched);
> +	if (needs_tdr)
> +		xe_guc_exec_queue_trigger_cleanup(q);
> +	xe_sched_submission_resume_tdr(sched);
>   }
>   
>   /**
> @@ -2353,10 +2565,10 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
>   	struct xe_exec_queue *q;
>   	unsigned long index;
>   
> +	mutex_lock(&guc->submission_state.lock);
>   	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> -		guc_exec_queue_unpause(q);
> -
> -	wake_up_all(&guc->ct.wq);
> +		guc_exec_queue_unpause(guc, q);
> +	mutex_unlock(&guc->submission_state.lock);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index fe82c317048e..b49a2748ec46 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -22,6 +22,7 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>   int xe_guc_submit_start(struct xe_guc *guc);
>   void xe_guc_submit_pause(struct xe_guc *guc);
>   void xe_guc_submit_unpause(struct xe_guc *guc);
> +void xe_guc_submit_unpause_prepare(struct xe_guc *guc);
>   void xe_guc_submit_pause_abort(struct xe_guc *guc);
>   void xe_guc_submit_wedge(struct xe_guc *guc);
>   
> diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> index 7ce58765a34a..13e7a12b03ad 100644
> --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> @@ -63,6 +63,10 @@ struct xe_sched_job {
>   	bool ring_ops_flush_tlb;
>   	/** @ggtt: mapped in ggtt. */
>   	bool ggtt;
> +	/** @skip_emit: skip emitting the job */
> +	bool skip_emit;
> +	/** @last_replay: last job being replayed */
> +	bool last_replay;
>   	/** @ptrs: per instance pointers. */
>   	struct xe_job_ptrs ptrs[];
>   };
