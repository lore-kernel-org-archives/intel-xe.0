Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D409CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 13:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C57E10E011;
	Thu,  8 Oct 2026 13:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6q718Dg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15AB10E011
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Oct 2026 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791467394; x=1823003394;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x+99ZaAFV+gCxw8iAmTOssjQQKsKmYpaEzZ0n3fygJg=;
 b=k6q718DgC6Lgk+kr7dDUZXx+hLWn8DncDd+IDMVASS0F0IQS6zJyccda
 HiD/N1kPIMarc8SMC0Snfc6PK1lXzvB/brDCwyPJNYcQ/D0Kd8pky8ibL
 EWzSxQSsUJ4Kd+mXhliliBNkLyghlB0zKm8c6R/+M/jthcfxGw1aIjqFA
 1rSb6WtlHeh1H5rR4sSq+hDiqOw5Xezz3lP/HnnjVLW34861fAqAmoWx/
 2G/48YkKeiZNdQVDEuLM95RqK/tvcmCuXd3uHv84z4ps9m53SywZyd67n
 HXsDpeEf10TlPqzIgK6C/AdmE4IK+yaqexuBD2UyroccpLCBIzoKs90Hk w==;
X-CSE-ConnectionGUID: ZSOvX2upQ3i9w9UVybl9kQ==
X-CSE-MsgGUID: UhdoGGXhSiy8Zah02S4Axw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="259595"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="259595"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:49:54 -0700
X-CSE-ConnectionGUID: QnT3/1haRgaS5OvUjqjfZQ==
X-CSE-MsgGUID: SIuv/SrFSTGFpxSZv570vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="144345"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 06:49:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:49:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 06:49:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 06:49:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HSZAQFUaJgRaqwirbKoCvIrGzDHrXvJJHJmYGY6CEPvXPr6qKD+m0zVReqSOm4jEzALuYDCweXtX3qJRshboN+14nUZGCQA7kuMdm5cXrKGvB03atrs9Q80CCe90/JKdX5abGf4lwEre3K8k+QIhaU9cK0QvvOfQNInUhbOldIHHSQMS2DwdPM3dzZ/QCmND1NALvnObtYhg0Rl6CfKolsUzApfST0OeZ+4UM0QiT4s8H9mduWKyz89Mbm/59QBJDSyLDqnlX6EycImHHr/5VRS64cv+5YfxV1BIDNMCDFqxThs12R9Vm08dT2ro0T2T9JLu7+2k1KrJtSFUCWbK7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eVrsmzcK3KYK0ZmJWHXcoDybM+TgzoR6HT0921Hb8o=;
 b=iMt0lUlyFyhR9MmyZyBB2D7K8J9fwMJoCzcYxh5Ypy+a85f//654uJDEdWi7pP0dzRlptSjzBUtLXPahDKthXIpolG1Q0rkFVWuMDpWiecBD38QR4eYPI2+ndF75auCbHR9RIXLQD8g2RwYmGrVjgR2ovocLDYY40yeSBu0yFyBPpK7fR6585E6HwkolbZzTlJigvrr+/6lFNca6ZdtCKFmeXbU7SqFA6RsnhGoQSxNgu3Zo5FVfuhMDt1UrZKtJbEVUOE/l+O3FEfUGM0RI+x/m2DfefRoSDA/ZmvA9ytTOm9UM1/Tl67YA3+nnrkxM8KUOCt8l9wMQEWz3wztNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1SPRMB0026.namprd11.prod.outlook.com (2603:10b6:208:3fb::12)
 by DS0PR11MB7928.namprd11.prod.outlook.com (2603:10b6:8:fe::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.18; Thu, 8 Oct 2026 13:49:38 +0000
Received: from IA1SPRMB0026.namprd11.prod.outlook.com
 ([fe80::9f8a:191b:3db3:168a]) by IA1SPRMB0026.namprd11.prod.outlook.com
 ([fe80::9f8a:191b:3db3:168a%2]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 13:49:38 +0000
Message-ID: <bfffed76-059e-4513-97a9-c971c1a0ce42@intel.com>
Date: Thu, 8 Oct 2026 19:19:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/15] drm/xe/hwmon: Add CRI PCIe temperature sensor
 offset
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
References: <20261006033534.3583967-1-karthik.poosa@intel.com>
 <20261006033534.3583967-15-karthik.poosa@intel.com>
 <asaO9L1vpnNXmAIV@intel.com> <4ae3b310-bb73-4cc5-b4d4-ed0aa38ed045@intel.com>
Content-Language: en-US
In-Reply-To: <4ae3b310-bb73-4cc5-b4d4-ed0aa38ed045@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To IA1SPRMB0026.namprd11.prod.outlook.com
 (2603:10b6:208:3fb::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1SPRMB0026:EE_|DS0PR11MB7928:EE_
X-MS-Office365-Filtering-Correlation-Id: 3693717d-78c8-4526-695d-08df2542fe9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|11063799006|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: xpGYJw823HEqaudldr65BlGcYV4n7VV1D85HMoKEb09QTzD/GGrmOEsE2cqWq5YvTmKFZ1l9jWlGoZyhttGASfNapwnTHaEfd5M1n3AltbgrMGJQaEumwO64XeTNUtnfl62CX6lZt1uVjVkMUSn7gXWGk1BurgjwdMjc682YwuZIR81yXKNT4SjwYXyjqQ/v0elQj5i8pv+LNdDjBGgRb7nibegPoez2T+11ZMaEQmm9IAUdf7xcv97+VQmNz8LJjcMgYxkD2KElShO8KIFcwphbe0Y5XiPXScEjIKO6pU0B3BonhzK9C1Eb7yqwzK1fMcJjgpXrCNgD/mKpHrBAr4XIQQ78FUSLRD4hah2vjM1MlRSq36VbC9z3odzTscd4fq7Hl5CB5l7VqqVzDREs2DCLsuwG8pLzYy3+Ltzf+VLKfwc1p/zowyyRWJK4cFWXOlX6FIw+6RmeBQFc6wmEr816aheTUNUd9OxKvc/jdAZA/Ep57D+JHDhqEx1+h8MI7HZKdIQFrmTY+KkJ2GXUGfoHDCozh3c9dLZQCMrbrRSwpJha1D022B+oc1uVGYudRWLeoSofeJ17w5twMEXTqMtCTJg89pIEVbXyvU5EjY6Fs1b2YGx2xHnu/pRXF/UFJcJzeIVXu/ZVBwTUK7+dw5Ax4BJJT8hsyiefIlBOCpI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1SPRMB0026.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJKaENiSFBEWEk4MUcwZzhEd3kxeXBXdGt4Uk5hOVdFbGVoTVgxTDhjMFpS?=
 =?utf-8?B?eUlEdmF1eFovQnp0L2k5VmhCZnlQMStUeEJjcU9aK3Q2bk1QZE1kS01pbkhN?=
 =?utf-8?B?azNRZzdJMWpCQmsweXZ6S05vNUtsVjNudmdueGNST3hEbEtrM3R0TlFaTXd3?=
 =?utf-8?B?MkoxR1hnckI1ejhsN01Yd3NmT3pKQ1hmK3FXb0FYelRMVlc1Z2pIdEhuZ1pz?=
 =?utf-8?B?WnZPeGNJSVk5YkEvM1ZDZEczNTYzVWtieW5GaktNbFd0NU0vV2ROa25SNXVC?=
 =?utf-8?B?NXV1RG5STFRXK2wrV0t5SGYwTjF4QmpwZERKMXp1cjBiMXZ0MjdBSzhjajhV?=
 =?utf-8?B?OHU2MHVDTlJRVjRURHZuVGpxcjlXb3NZbHozVkkyUllabnpiV0xQWU5vTVhp?=
 =?utf-8?B?eGhmWU42N085M29wL1RpUWUrUTkwRGxYM2pLeFJxNjVNVHlHSkdUVWdWQWty?=
 =?utf-8?B?K3NmemlWR0FVY2JLVGREeFQrV0VYYlVsUk9RSWorV2ZPNEpGVUozMUQ5Qm9q?=
 =?utf-8?B?UTNyY3hIVXVLS0ZEcDRkS1pIZjlCRjJubWFieExKMDhqVm4rWXc4S0NldXBm?=
 =?utf-8?B?d0wwTDJzS1o4UTZLWE8wdFFxRzVJYWprQm00UHdIVEk2NDYzWHFUSUVlRjNl?=
 =?utf-8?B?Rnc0V2ZESGxZQUZwNnJISW5WNEtZOFRLWnNrSG5QQnRMZ2F4dkpjSy9JOUZB?=
 =?utf-8?B?aVRGQkV4cTk5NFNYTk5BaHF5VFVkYmxwWmliNWZkY2wxK2VpbEFtWWtocXE5?=
 =?utf-8?B?UER3NytLTjk4VWhPb1hpQlRVN01wUjJBYnJyYVJWUnVEcVQvMjBPamJXcVBz?=
 =?utf-8?B?UC9WMVV0OU41STdoKzVsRjBKU2lyOE0zT0lVU2FENzFmWkZ2cXJ2N2hRYkFx?=
 =?utf-8?B?VDRZNXpEMTlJTTZQdm9CZDMxNkdVWFB1NHI2Sk5rYkdDQ1ZMb3V0VytCMGYy?=
 =?utf-8?B?ZlZBVWgwMGZGYVJrTVFDZFlHWEJwNjBzSC9jN0U3dnlwRnF6ZEQxSUg1N3hZ?=
 =?utf-8?B?WGUvRFdHQTlwNiszYk4ycGorOEpwc3U1RDRTRHVxVU9qa2lzSVBhdXRraHFl?=
 =?utf-8?B?QysyMVNQd3g2VTA1QS9rNnhycGhuRTFnY1lFRkltQ3JtSUp1b1VSQ2l4V25o?=
 =?utf-8?B?L2JVZW1oV2dmdlNXSjRPZDNwVStNSjExOW0xU0t0U2lrN0l4RlRacURKaHN0?=
 =?utf-8?B?UDIwY2w2TjFXMVhHOC8rMmRtOXRpc3UrZXFLS1hRaHFCQjh0UkFzSUhrQmVW?=
 =?utf-8?B?aXBBRDlnNUQ5RmdqSzFhUFA5ZTM3N3pFV2IyMmZ5MGYrbStmWDJabnNUaWlv?=
 =?utf-8?B?VUVISFdOZmxQemQzL2VPZGozYmN6ekFuaHV2dmRXT0VCUWkzNmRacExNVVVM?=
 =?utf-8?B?Unc4ekdOcHZYMmJubGRPVDlMOFVTU3hFaTMzWVZpKzRHZnBZTzg5YVo5T2h2?=
 =?utf-8?B?NUFBemdDSXdhbW9TZ1hUeTkvR2FINUpBZWhHS0haYUNkVHF3dFNzc0NXanBk?=
 =?utf-8?B?S01WN3I3RmljWFQ2a1U1QXhyTDdaM3lKbGpPdklrZjdqbk1vR3hrQTZzUDNU?=
 =?utf-8?B?VDJtNFhab2JuRUlraVRmOHYyYTZBR2tRbXFzSzlyR2hwWkl4amhYc1BjRGkr?=
 =?utf-8?B?YURBL2h4V0cyK1FNTHY0SGgzSHVqN1BBNGM5STZ1bXRkamxzOEcySzQzTTV5?=
 =?utf-8?B?dmRSSU1pQ0t0MUhpVDhqdFpqdEdrMDcwNEQ3L3lqMmdhdWp4M2FRMENmdHk2?=
 =?utf-8?B?VjdjR0J6L2dkYVFkZXVQSFcxaCtGTU1LMzVKWFVrWkdRSXlSWkdicGg5Qk10?=
 =?utf-8?B?ckdvUTRTZDFnZURMWnNtWVRnV0dXN215V3JHRy9leUIzcWJFTDZ0Sk5rZm1l?=
 =?utf-8?B?OEMveDBoM3JEWmkybkNCTzF1Mk5TL0dSakRLdkErV2R5RGxNWWlHM0JnMUp1?=
 =?utf-8?B?dDUreEd0T0VxdmszelBBNEZKNXRya1VCbGpYWVNtUk50OWhmN2FYR0c0ejlv?=
 =?utf-8?B?VElDekIreUdSOVF5bEZPWU9MbDl0YXE1YjZDcTc0NTVDSk9VWk90WmdBUTlQ?=
 =?utf-8?B?TktYTmJ1Nld0alcvQnUrdXVmaXlZSmtPN1hlejgraHZoQjQ0bVFKYmpIWDRw?=
 =?utf-8?B?Tk1MWDk0NGY3S0pkOVJmSGxCRU5xMjhqbndpUUk4YWxaVUpBSitLanV1anlr?=
 =?utf-8?B?OUc5bnI1MmJORktJZHdaNXpFV0xtTlMzVWl4L2FFL3lBN2s2MmJNWE9YM2do?=
 =?utf-8?B?Znc4SVNJNmIreE8wemNiek95VFJzQU5OeGl4RTlrL2tRUEE0RnQ4YVJ6bGxX?=
 =?utf-8?B?ei9FS2VjR0VxN1NOeXg4SEpTK1daT0dkL1JaeHB0bGVvaVh1dEhZUT09?=
X-Exchange-RoutingPolicyChecked: et07orrMdOGneuO5OQni1p4XU1k99/wl57DpR3auKa+zaR4+89MDILvOVVv1wAMe3Ry50EQLOWS/Ltj5pvVO2L57xu7U6HPUolUDMDGmxVD0cqwOyw+f45BMgVuTtUNnmpSuGAWuQQWo+8NioCXxd4C+vHCrIap0QjYZHMH0CXonTeBsa7eSOXvKGokPu3yluKXOUG+8zqtM/p8EXgu+v9DzKte78nqZ1PKynuBuoyOB8oc0xrsQU8vftdcUR9SG3zWivQ9W8gyqWE0eXAG0mb/25+WGOQfkXIPQnGItc/YaZ1HVx2n6gCIqhI7+KyhdVyWjxyHRhbtoMq5XUE+bRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3693717d-78c8-4526-695d-08df2542fe9c
X-MS-Exchange-CrossTenant-AuthSource: IA1SPRMB0026.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 13:49:38.4169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxNZAsEMLf1loXVFqqqj4u1q4HR+bI5tf1PDX0fuLRe0aZidNmBFvZNvXX9uNmIWv+dMFGrT6cliNl+J1RXK9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7928
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


On 08-10-2026 00:11, Poosa, Karthik wrote:
>
> On 07-10-2026 23:57, Rodrigo Vivi wrote:
>> On Tue, Oct 06, 2026 at 09:05:33AM +0530, Karthik Poosa wrote:
>>> Describe the Crescent Island PCIe temperature sensor at byte offset 
>>> 20 in
>>> READ_THERMAL_DATA.
>>>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_pci.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 1cbd49933b2c..c7ab7b1abd25 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -482,6 +482,7 @@ static const struct xe_device_desc cri_desc = {
>>>       .has_i2c = true,
>>>       .has_mbx_power_limits = true,
>>>       .has_mbx_thermal_info = true,
>>> +    .pcie_temp_sensor_offset = 20,
>> wrong place and bad name and it should be squashed to the previous 
>> patch.
> by wrong place you mean, order here in the list alphabetically ?
also

having two patches seems right,

in previus one we are getting the offset,

this one enables offset of CRI

>>
>> But also, please disregard the rv-b that I gave there... seeing this 
>> again
>> this is a bad naming... I'm also bad with naming, but pcie_ as a prefix
>> seems something related to the pci spec itself, what is not the case,
>> so we need something different....
> how about .mbx_pcie_sensor_offset ?
>>
>>>       .has_mert = true,
>>>       .has_pre_prod_wa = 1,
>>>       .has_soc_remapper_sysctrl = true,
>>> -- 
>>> 2.25.1
>>>
