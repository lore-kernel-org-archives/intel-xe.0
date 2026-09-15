Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B93C88E75
	for <intel-xe@archiver.kernel.org>; Tue, 15 Sep 2026 19:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52C810E22B;
	Tue, 15 Sep 2026 19:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eWMxcesy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021A910E22B
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Sep 2026 19:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789499961; x=1821035961;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x4JTYyjZ+CQu4XQ+oXP+4kfrlrpdCBKBMz9toHdsMsI=;
 b=eWMxcesy3rXbuOaoZl5uc1lEOow1MwmnBogRe4c8blmeVrwHYPP4VksK
 YeIff6lnygzaWeEVPCZSOGOBs61vHveW/C1qKG50bDPAoOyfwPnOW9gIo
 OQ690yto21DcSnJ4UKVkP6soLHaX94/mAPu8POPPap3yRt/x/pAb9b0IP
 sd2CbVHRxWgvwsf1MOEmwfpMGLU9/l3S2VYSwI4OHpkQrhnSskYJIzfm9
 swjRnni9YBm5p7Gm3ESMYwUWXbqbUuY29ZxfLpawpEnsR+alfZ5OI0rQL
 Q2epqpv6P1msjZx0+94GKyHzCeWHbAw8KvExbCZ7t0o/px0b+MmaTt8Q3 Q==;
X-CSE-ConnectionGUID: DanWb2AyQCaFyAAsZWrYGw==
X-CSE-MsgGUID: 1CaE7OPjQ9K6VLSbt3N/0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89635312"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89635312"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 12:19:20 -0700
X-CSE-ConnectionGUID: OH84ZkNaRq6rVST3jwQo7g==
X-CSE-MsgGUID: mNR7ng3rS5SqT/G6I+wj4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="298161019"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 12:19:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 12:19:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 12:19:17 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 12:19:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lyk7qUuMbPteaYR1dwjkL3XeMwHdMyQokKWk4T808qLYI+RRpoJiFR+vcdw/KXVinAtPyvQghkKVd4o9E9Dv7YqfkakQ1bWIFdJtK8WSYZ4f0ZKv2WrinSNcrzyfgpZEXGyoZbRzIM9RIT4sVHp7Q66ZaNn4ukQk6Mitn5qLiXggsBjMzw1Rz3BVFFMf01XFKVuwd3NA1WxQfQoIGX6vzBApj1dNjCR38RzdD6QCZcX+TJsoQrMEfkzfD1RdtGJQGyF6kAtwh3FiEqfmlbJ2kRqBhR+ssSmv6PTI4fHxTD2P54skBT4kL/FxQnC0D9ax7Iy+qqaOzOiKR+LHuvbtZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7ndL3yTkLsn67F6h2Z2/XoXuFbpYYRD1yTZIBRGJjE=;
 b=r2uzxM1F+BXPKYmU3TIFtySm6+sEHEswN85gLZWochld5oeO/c4At2LKJsiheK4eYZDyjeIpg+1q+UW7wslHivOFTRuKOcSShHND+33WAZ1N3Fn8gf1jE1VEAGlxziQxtLUPEzt5bHV6qYHByEjcy3vPqigeqj7l3Kp+6ujUKHQAkTYnV52WEMl8ganjm16HjMXMlGexmtQ3r95OduLOklPa/woZqrFTT/SowJInix8HH5UA3Kqwq5sxUypPHtxsYIHTZPf2xj5K1OQB8SB/spas+5v7fJRqjkrJYq4L4uY1Z9nfnmI3CJ35VPzJfHMJ/i6T2WJRjseNBLF0lQx0+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA4PR11MB9081.namprd11.prod.outlook.com (2603:10b6:208:56e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 19:19:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 19:19:14 +0000
Date: Tue, 15 Sep 2026 12:19:12 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <aravind.iddamsetty@intel.com>, <mallesh.koujalagi@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe/guc: Use different error codes for GuC
 load errors
Message-ID: <aqmaMGd/Jjh559+S@soc-5CG1426VCC.clients.intel.com>
References: <20260903233958.475162-7-umesh.nerlige.ramappa@intel.com>
 <20260903233958.475162-8-umesh.nerlige.ramappa@intel.com>
 <cd1da898-c2ff-412c-8e87-5d7b59bd42a8@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <cd1da898-c2ff-412c-8e87-5d7b59bd42a8@intel.com>
X-ClientProxiedBy: MW4PR04CA0121.namprd04.prod.outlook.com
 (2603:10b6:303:84::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA4PR11MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e71b528-0277-426d-fd3c-08df135e3ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 3WMTLMXQgJvU9KOusJq/UVmL1pGXf1xc0FeptVYK1fFfMiIFsbyUCFRWy8uthAibi49QPqZYQKlul+1mWtQBhAVd9puSUsgsQwdbtibDQzNlR/w1a3YQvqlOqMrtsE2MehmSw+y8a2AAtzhDh5b5mF8fX5EyneaND/9YsnViQm4g3etU5Kpwjedg0AQhb1HEgw1mU8fzc5HkqDBkME8+lp6XVQcGsRJu74gtJu7kRLCGLgh7eZF72haZ7udPEioOwDczfJDaWJaM2eiWMNmFFYbP0bUtA3eGLoRqHTPEr+jVKPUMHpw7f0aCbFCIaRmC30dc7jQYnPLiOR0Smtl2nE4I1nAwsugPsLnJvBjmcNWrhYGZhtJ07AXYVLvzKFs16ph3X3PS8EFZ2Zw1m47/9oQ+293JaoTznJflkPrkoJlCRLL98B8QvXh/EteqHyy2pjbL6G5pHVaLZvyz9y3OmxAEYzwzelOOVrgLGQbEV/8tICKU9a4/zusJiSNWgKxaeDuMqV6kfKKDy7HUVRdWt+95Z7kM+us2p94Xpw9VpwL5a47mng4fIhu/LBaBEdquWjqnrMy90Sz2Ms1IXAG44iinUUsry1j/uD+mgEFKJ0dfTmR/+7yBkrXrSF4TCrzOS2o2+IesAJ6okwi0429SJ22nNUQyMzoFcZqPnm/0WNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnU1ZUdBODZ5REdKZW8vNXFDL0JDb25ua1E0SUdzRkFYTUdyZGo3QjJXZkNp?=
 =?utf-8?B?djdZNnBmZnhTMDJDNVhUNlR4ckxIWmRwcDJMb2RMTFZYdk15SjE0djJ2aFVZ?=
 =?utf-8?B?SUM4d2NHc01LVFBxSTdyd1B4VnlxQ3NOL2FOYkp5K1ByY21DZTNhdUZ2cm9B?=
 =?utf-8?B?RDBKZU1hVE9VbCsyQmtpZzBTTGc2OU8vd1NrSjZtWm5jTHloSFhaR1hNQTR6?=
 =?utf-8?B?S2lrQ0NoOHpZUnhkV0ZQWHZHZjdSemljeU0ycCtuQ2dCRlFUd1Q5YVREb0p2?=
 =?utf-8?B?UjFnZ0o3WThzVitZMnZhdTlwenV4NnhSNHFwZldMVWFOdnQzWTlPdFhNaHFt?=
 =?utf-8?B?NmhOZ0NLamFLMmhGWXorMDBlNnFZRXdZMFdGMmU3c3RxbGxSTitDa2g0TURZ?=
 =?utf-8?B?MTd3TCt2d3huM25CMWdEaUdTbWlFVzF2Y2VOV1JKQVpOZkROSUZnWStiY2Ft?=
 =?utf-8?B?MnBYRDhkRmpUTFlBTHY1UHM4aG5YTVJYenNQb0F3emJCcWFMMUhQaTk0M2Yv?=
 =?utf-8?B?aHVTZWd3SW9LT0VzTGlJV0lwZXFSOEZpUC8yMm5CZ2dneFNTMnI4a1VuUUpG?=
 =?utf-8?B?NCtVMmFqU3VFa2RYWEpBQ0dqVTlORms5U2Z1Y2pZTDUzenM5bGlzSTQ2NlJa?=
 =?utf-8?B?Y2JtRmZYY0NxOEFFT3hQZkZSbG90ZVA5Qno1SmtJazFPb3JOUnMyUnVNd29l?=
 =?utf-8?B?NDJWVUl5T1FqeVZUemlYeFhkVWlBN0txV1VMczE1a3Zpa2tvMTB6K1N0Y1hn?=
 =?utf-8?B?cE12T0pPWFZ3LzFEMkdROURuZGRaWHdkQitrZDJEV1lMKzhheVpNbFZSTVVL?=
 =?utf-8?B?RC9mNkdyd2o5M1pCTkgrMGRlL2dhU3RFVDVPbjNHVFhKL0VjWWY4TDlsOUVs?=
 =?utf-8?B?R3IreWx0R2dOMHlKdXYwSEd2aFR1d09Ibm5GSVZRR3M4bVBkdERuN2g1b0lE?=
 =?utf-8?B?VkhuUVNGMXo5MnF2VUNPOEMxV3hVcUpmVS93SkRzTXE5ZEg3T2ZpN3F6RHZH?=
 =?utf-8?B?M2NHOFF4RTlXVzRBaXo2MnZtSEZGeUZTL3R3U3RhajZRRGVyTUp6YS9xRTdv?=
 =?utf-8?B?VFgvcXVpSWRFZHBncDdVWnZYY0plaUtvNldqYUI2bVR6SzZ6QUVtY2dRdHZw?=
 =?utf-8?B?KzFkY0hlR1dKSWJodFBON2NXWkYvMXE3NzhGL0JvdzNlVFdQbG45d2NFREZS?=
 =?utf-8?B?clVvRVFRVU1va21wcVM3UEZIY05OdldIRVJDUVNZL2JMdHZXZG9rK0NOWjAx?=
 =?utf-8?B?dk5IUEt4aStpdVptaDJUN0tWYUpNbGhZOEp5Vnoxc1N2Y1ZkT1k3YXBQY09r?=
 =?utf-8?B?TmhyUUFFYU9UR2l5Z0lpU0FMTGFCSHZkRVJkY1BsK0puSlp6T2Q3UHRtOTMy?=
 =?utf-8?B?bm85M0tqVjJjVnZPN2tyYWY0ZGV5eDdZVSthYXEzZnFaTHBFbmxTUklsWEJa?=
 =?utf-8?B?N0kvWlk3TnFIdmMwTWdmdjBtem1Jem1JelEvQnRHRWhXcHJsTWhGY0NoM1NF?=
 =?utf-8?B?emgvMzdhODBXN2JEdFM0aXlYU05OdUF4MFdvekg0RjhPVkYvVHNkejlndXFU?=
 =?utf-8?B?SU14RDhkREkxcEdtKzZISjc2d042b25rZ0d1MHJQNk1oK2xWYzFKVDNwUnRO?=
 =?utf-8?B?Z0hEVXlBZ3p6aUluMWZiUVFQdng5MEp6YWdyVXFVRUlqVlZOWTF1b01UL0kv?=
 =?utf-8?B?dVY5YTFTRWI0TlI5d2YwekZzL0xLS3BTTS9yNS9XVnZFSkYrMkdPOXRFT3U0?=
 =?utf-8?B?emc0djU3Y0E2QnM0alhNRVBKamR1WlNmekxqeTllMlE0NzJJdkkxNVh6Rmta?=
 =?utf-8?B?WXhINmFxOVpGaTVkRVR2VzM1elpLTGFoYU4zdnlMWTcySCtTc0NUViszTm9W?=
 =?utf-8?B?S05jVGVqckM5cDN1dnd0T1Baem11cnNGSXEvUWNxSnhaNkpNc0NLcUgwMkoz?=
 =?utf-8?B?K3hYOGxKTStIajhrTzFtNmpXVjQrWDkxM21WcTkrQm9BNTJvZkcyTEpCckVJ?=
 =?utf-8?B?dzdQSG5BSlZLZG0ydFd1a0JYajBJbHBBd3V6ZzhuVDAvbEZZbjg0cWE0ZUh1?=
 =?utf-8?B?YmJNeCtoM3pwVXNPakhibDVVWi8yYkJCazlvbVJpT0lTU0RhWWhxT1pwdkZy?=
 =?utf-8?B?cWxCdTc4cUJ5clhDYzdic3NnUWNCQTM1RUhLd1dLMkh1dzZVVkNIVVdLeUhu?=
 =?utf-8?B?eURWMkgvNW1Ubnl5NFBNMzk3NkFUWlN3UFIxVlZzcVJPQW8wZldXZ1BlY2tx?=
 =?utf-8?B?Tkc4eTdLeDA4Nmc3MWlmcEZyWU9oUlFTWlh0UCtGR0tDbDlWcG5WTlFtWFFo?=
 =?utf-8?B?WW92TXZGQ2NCcGd4V1hEQzJEWklUMjR3VjFFc3lzOThPUkFZeGoyWnVKUUlo?=
 =?utf-8?Q?YH4xK3NufsfJf2jrtdBXalPZT3PTg+U1mznpi?=
X-Exchange-RoutingPolicyChecked: IQQLhz/s3TVb2svlvRthxUiwf1XUCWGHDyVBND7VdWu/OCDPpQIo+t5DjMKdC3AxMXqlp+pWQLd8XLVGa/tJCoX+xjCb/6R82sZrTCUGktjebYnlLmPXzbfkWH1GKaLyq0KlcbeRDW6sgmjzsw42xNdSfOxr7pTYePS7VmMGEXwyrKRcp9xNPu9qyehsgJvPldzY5gu8qWRHdW6jo+HcDhMRcK00auhA8xIT3L0N7Rd56WPt4sP/AIB/sZUOYJInvcc8NtVCnOJzyWek4vQ+XKWUJg1xyWjRQDKJHsUy/CI6meG1ggUdQZ0nRG4MNzeo05LDbxZCOji6FEwmSgkhjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e71b528-0277-426d-fd3c-08df135e3ad8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:19:14.6828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsBRYprjNj/qFH9mlfi0oztb7MaWloiqXlKOwof+/SnPRsJy9q56g5OfsDPtjUav572Wm/NoYSSrGcUs5cL6GngGhmHfGRn0zqMl+4OmOXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9081
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

On Tue, Sep 15, 2026 at 10:58:48AM +0200, Michal Wajdeczko wrote:
>
>
>On 9/4/2026 1:40 AM, Umesh Nerlige Ramappa wrote:
>> From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> Instead of always returning -EPROTO no matter what goes wrong, use
>> different error codes based on the error type.
>>
>> v2: split to its own patch
>
>nit: you can keep change log under ---

will change

>
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++----------
>>  1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index c7f8bbd4cb92..5285d4cecbc8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1144,8 +1144,8 @@ static void print_load_status_err(struct xe_gt *gt, u32 status)
>>   * Check GUC_STATUS looking for known terminal states (either completion or
>>   * failure) of either the microkernel status field or the boot ROM status field.
>>   *
>> - * Returns 1 for successful completion, -1 for failure and 0 for any
>> - * intermediate state.
>> + * Returns 0 for successful completion, -EBUSY for any intermediate state and
>> + * other errno values for failure cases.
>>   */
>>  static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>>  {
>> @@ -1157,20 +1157,22 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>>
>>  	switch (ukernel) {
>>  	case XE_GUC_LOAD_STATUS_READY:
>> -		return 1;
>> +		return 0;
>>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_BUILD_MISMATCH:
>>  	case XE_GUC_LOAD_STATUS_GUC_PREPROD_BUILD_MISMATCH:
>>  	case XE_GUC_LOAD_STATUS_ERROR_DEVID_INVALID_GUCTYPE:
>>  	case XE_GUC_LOAD_STATUS_HWCONFIG_ERROR:
>>  	case XE_GUC_LOAD_STATUS_BOOTROM_VERSION_MISMATCH:
>> +		return -ENOEXEC;
>>  	case XE_GUC_LOAD_STATUS_DPC_ERROR:
>>  	case XE_GUC_LOAD_STATUS_EXCEPTION:
>> +		return -EIO;
>>  	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
>>  	case XE_GUC_LOAD_STATUS_MPU_DATA_INVALID:
>>  	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
>>  	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
>>  	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
>> -		return -1;
>> +		return -EINVAL;
>>  	}
>>
>>  	switch (bootrom) {
>> @@ -1184,7 +1186,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>>  	case XE_BOOTROM_STATUS_MPUMAP_INCORRECT:
>>  	case XE_BOOTROM_STATUS_EXCEPTION:
>
>nit: maybe -EIO to match exception from GUC_LOAD ?

Leaving it as ENOEXEC as per original author and also since I don't have 
clarity on what the exception could mean.


>
>>  	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
>> -		return -1;
>> +		return -ENOEXEC;
>>  	}
>>
>>  	if (++*tries >= 100) {
>> @@ -1197,7 +1199,7 @@ static int guc_load_done(struct xe_gt *gt, u32 *status, u32 *tries)
>>  			  *status, ukernel, bootrom);
>>  	}
>>
>> -	return 0;
>> +	return -EBUSY;
>>  }
>>
>>  static int guc_wait_ucode(struct xe_guc *guc)
>> @@ -1213,21 +1215,21 @@ static int guc_wait_ucode(struct xe_guc *guc)
>>  	before_freq = xe_guc_pc_get_act_freq(guc_pc);
>>  	before = ktime_get();
>>
>> -	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries), load_result,
>> -			      10 * USEC_PER_MSEC,
>> +	ret = poll_timeout_us(load_result = guc_load_done(gt, &status, &tries),
>> +			      load_result != -EBUSY, 10 * USEC_PER_MSEC,
>
>nit: I'm wondering if maybe this "10" could be somehow derived
>from the GUC_LOAD_TIMEOUT_SEC ?

Not sure if it can be done in a clean way because the 
GUC_LOAD_TIMEOUT_SEC is different for debug driver (20s vs 3s in 
non-debug driver).

>
>>  			      GUC_LOAD_TIMEOUT_SEC * USEC_PER_SEC, false);
>>
>>  	delta_ms = ktime_to_ms(ktime_sub(ktime_get(), before));
>>  	act_freq = xe_guc_pc_get_act_freq(guc_pc);
>>  	cur_freq = xe_guc_pc_get_cur_freq_fw(guc_pc);
>>
>> -	if (ret || load_result <= 0) {
>> +	if (ret || load_result) {
>>  		xe_gt_err(gt, "load failed: status = 0x%08X, time = %lldms, freq = %dMHz (req %dMHz)\n",
>>  			  status, delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>>  			  xe_guc_pc_get_cur_freq_fw(guc_pc));
>>  		print_load_status_err(gt, status);
>>
>> -		return -EPROTO;
>> +		return ret ?: load_result;
>>  	}
>>
>>  	if (delta_ms > GUC_LOAD_TIME_WARN_MSEC) {
>
>just nits
>
>Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks,
Umesh
>
