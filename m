Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73046CD343B
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 15:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353DF10EE03;
	Wed,  6 May 2026 15:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQxYlmsi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DCF10EDEA
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 15:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778082085; x=1809618085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pd8/IeJAIebEc7p5lrTWV1zKAaNd9cJUvRQh+/TXPvI=;
 b=UQxYlmsijYr1iwVobeEUYDFLk0HFxwaRrHhw8JNZQCC92ygyntONiMZA
 iQ4iXv4F+E7L+0EdWWgqpStq1QMrzfAFvEEF5QCbq6CaJ/1PGy5uZX0ct
 W/ovwEfPT3Vh/6iyW79bV3GC13UdH3cSN4MBGL4825RrpzrybhuNLg2gW
 i1FIdBPyFubiTfYPk1HUpDTtQvHR3U1ZbzzmDaPVHdrpG2xzYltEvbpln
 gnFrEs9qyEJpIWFwVLFm19XEDBWC45oO7LWpWcgmSttoaJxeN4IuXsEIa
 wFasVe1Zh15IicPpL9S6rJGfQfeoEIU9H4uoypmxHj+hLD/EKx9IPd0eq g==;
X-CSE-ConnectionGUID: PxT4rbEgRGGvMZqb5gpmWQ==
X-CSE-MsgGUID: vrqDo7CURimBATaj30+PWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="78867697"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="78867697"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:41:25 -0700
X-CSE-ConnectionGUID: /UW9HnHBQyGkIZ0bh3iPEg==
X-CSE-MsgGUID: VTAKKBkoTtmeZYWYYoa7QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="235173236"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 08:41:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:41:23 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 08:41:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 08:41:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ilrz/LwPYO8uxPvRojn73wmcCR2cA38C+oEGx1Io36Pp65EYQFM+4YI37EbMEmr/6/6UfNsfm4qH8J3KVAqWwm3rcFU2q2WZeKQM9xb3oyy0D4jixg58uaAdOuwkmb6wfe/VA3A0h9IiogpPwb3hcg6satzCCSPb4Bl+YZ9BqGB2QR/fae7pe+VPTMo/XXYFKcb39UKt7zKrj6dUG9p/F7Pi9WPbiVyLILPT+jdRV7b3wlHuR/ytavqHgEaG0iXPKUktWi06Rz4nVfSWLfDlmZOUUEIZ2miR3oRBm5o2otmuGBi6Y7pOfcQxTT++Mejr87sCMTUeBl19gX31kZaYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTTsaqHXuCYNtHXi/tgioghZ4ihdyqIgNlV+/ShmSFg=;
 b=kKRlnmn2Is9/Gt3TFDm6dgIkjc6wpgE5eGUYe8Za5oGCNxOZeC34PXld1qc5TlEWwCV1QKY79JxB1/oW47duM/YJqx63sCN/Z1r8RcCv9kQ1m+CwS6+Xy7tE0iawNB0VDrD3uxXDBrmnU2aZAx0n6+M6w3DoiekNgRvetxPwnZy1YweI5jMPRmM1xMpWU9Vi3rR1W7zHfyEOGpQwCS5fINykhpkeAijoxwCOZOWZ3gHU5hY7Ig1WaQKFOslCRzV/9xYQaauxNbxVYEbxuAjn6egZdoFCr/RiPdUdcoX8VQqMfOQilUsmaQrKldLiAmqKU7hiCn9NC08vpu3fIP6mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Wed, 6 May 2026 15:41:20 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 15:41:20 +0000
Message-ID: <50cfbb65-2546-4106-92d5-160b87d3317e@intel.com>
Date: Wed, 6 May 2026 21:11:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] drm/xe: Skip device access during PCI error
 recovery
To: Anshuman Gupta <anshuman.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-19-riana.tauro@intel.com>
 <vtkxftaqr2aaiv7pjo5nxiv6f3eataby3qfpildmz3jko4fhoh@oxuppfnttdzv>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <vtkxftaqr2aaiv7pjo5nxiv6f3eataby3qfpildmz3jko4fhoh@oxuppfnttdzv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 0397b45d-e74c-458c-1a07-08deab85eb77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: WOZgFxBGvpit2ccKz/F6t+bFP6vIJWf4v7vGDz9b4e9/H77lH3hnQ5NfyPNV9KRQKzErYT05IgujKWIeB2zdfnTto3UdS48M4R4j+aPd6nyJkPbd9ccbeNIQp6DYJBrglh1U6yFpbAQXpg348YY6zGOpFxQAWHihVZCnIFtJlyjOCj/M3HPF4kLrPtucU3OzNOp16LP7CHDaIBKEqsNHV6rYzW7nHfqTzvUg5Q6EIY1oupNUobsSrNaqy56jR1M6cEMyTlUod8fzG2ujNH1Wdf1uqPYueBLvo5awBMRl5ONqA/FWJHcHKbvjLdtZfAWz68coDpwOHHcm1i9F/6cWAbGjsujl2kFoUwnTYaYatmzOrFvpUWSpG2rGHybawXAVgWWdX8Lgfad2wN/r9RQKIih2XqN+ebib2NOVlJ9pKLPn9HvTZG8bzB/SrR/Mdsd4d7hGLg3B8N/uoHzsrU6FmG15OyuDQgRg5BTSLCHqmgDi6yztT3R7IUbBmV0YML4Jkcll7/LMTe8uxPkBllO4QGeTEmCjqELhr6JWW5O7OIIZyODvukOx+xyWXhHwVZIY4xZ3QiQEqzBCXf408bFMhjEziA6K+ZHu/Yy+bS1Q3/ufB0nJ3i3fzbqi6hcDsWEToJUOwNUAxRNtOlC/CH7QjKeo95pvByRAfs6xOQnYCeE5DEOX1EzJ+wTMu20Fob4JUpYE4OFFxFoalIgU2I7YbA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekhsN3cvYUtoejEvTmZjSGpKdmFRR2Fac01Va3VtREtLcHNYMUt6YzI2SWRp?=
 =?utf-8?B?L25LVm5pc0JyRndDQ2wrNDI2T3JYUFM4MzZOMVkrSjhoTUExQTZYVFVVbUJC?=
 =?utf-8?B?Q3FLZU9TUVhzcThBRWhTNzR0Mk5yVFVRWWxQTk1aYTU3a3paWWg0SHE5bWpw?=
 =?utf-8?B?aGtIVkYxdktMWDg2TUJGWkhPd2xsb3NNMTRvZFRKL293MndrV1ZOSHpSOFNh?=
 =?utf-8?B?cm5vRU9sM2hKQXVKdjZ6SHIwUXo5NjNUcGl1MkZMVGtaczEwUHZreHhCQStE?=
 =?utf-8?B?c2lNb2NPYk1kSGxvTUJ3NXZXSDJnU09kaXN2R2NEdjJrd1BZVnl0OUkzS3NJ?=
 =?utf-8?B?YkwzVnpaV3NxbjhZd1FyTmxCdDNIRU5FRWpRcGNLbEZxanlQaW1hWjVxQTVI?=
 =?utf-8?B?Snl3eUt1NExQNmxINDRXYWh5aTNDTlYwUE9vUENPSGc0SEFGSVcxQnZiQWF0?=
 =?utf-8?B?c0dacDl0ZVdlbnpMRWpEcTFHZHlGYnE1OXd5K3JmTEZmYmNhZG9qYk1UOEEv?=
 =?utf-8?B?dEJVMkZSYzUyVnlRUFViRWxsZVU5Kyt6bVREaEE5Ums1NEEveFZFMlJLZWlR?=
 =?utf-8?B?L0dDbnVpSFZtbHpaRE4xdDVsdWJhcUJZc3kyRG9QN1R6WW0rc0xROG1MUEdh?=
 =?utf-8?B?MGwrN0RqZTB4cTlWaHI5TUJ3ODBpeWVNeXRwVWZaTFU3dGFQSHVkZk1wSksz?=
 =?utf-8?B?Y1VIdWMxS3RUSkh3cmU0V0VNNFc4SzUvdjQ5VW1wYUwxa2ZuYXQ2MlNxVmJL?=
 =?utf-8?B?RXJCemF3TVBWSUlEZ1NqWUlpcnM5QzRLeWQxUjJNWWxxZTZmVXBRZ2htMkNI?=
 =?utf-8?B?REVTNXlOVkhiblFISXAwYkJCTEtuTlkxL2hvUnZ2NVR5WWxicnZDNlFpd1l4?=
 =?utf-8?B?Yk5oOTVLN09Xb0trdmY4TnFIME1ZRW02S213TW5DOUJmQytqSGxBUWQ4RCtI?=
 =?utf-8?B?a3lKVmZOVW41djFqZG9OVDU2WDE1U0E4VktpWkdRUUF2TUF2RVV4QmREaTR2?=
 =?utf-8?B?c1hRM3BtS3dWc2paQndacWtCWmJSQmNkVHVlcnJiL2E2Y2ZWRnBuWWlTUXJQ?=
 =?utf-8?B?YStaSzJsMjZJTUxNSnJLRi9oR2xwcFE2M2lVRklydk5Yd2laaFp3ME8yMFds?=
 =?utf-8?B?Um9pSk92bU1VdkJXTElFbURYU0p2QUp2NHlKWWlkZXJIbEc5VHNhclJQUU9E?=
 =?utf-8?B?a3JBeS9neTZZa2FaWFlYY1NPU1hQclF0SzlkaGN6ZXord3pHY1JKUXk4Kysw?=
 =?utf-8?B?dmsvd2lhUHZZZGdrMTNzd1pJTGF6WWNWcVdoQTlTdXhXRGY4QmtXSHJvZWh1?=
 =?utf-8?B?MmdOeEZaaHFUcVVlS0RrekhPMWdIYzNyQWtzNm9MVTNEQ0FLTE1KV1p4R0ZF?=
 =?utf-8?B?VGx0QkJnZ09hTExOVkp0TzFEbWVCOE5XcWQ2MGt0Z3pMYzhFZ256Ym8zT2Ey?=
 =?utf-8?B?NmdEKzhpUk9nRDA4dm5kdkZ5N0JzMTJrZE85WU5EbnJOM2poTExpbUVhVzBL?=
 =?utf-8?B?RTlaUTM0V3l0czNJMFY4TDlkUHYyWERIUE0wNCtJVG1WWGc3eTZvTUxmdisr?=
 =?utf-8?B?d0RwUWNXMDJMSlU1ckxZd1lFaTJ1MHBjUTE3TnVpakxOdFd5OEk4MzdEWnkw?=
 =?utf-8?B?US80a1VneFJZa3NXV0I3bnRMVXQrOHEvTzV3Tjd0TUoxeU9ZT2pzSThFVy9R?=
 =?utf-8?B?c09hSk50eS9XTDE1WkZPUEc5YVhtU3BaTUU3SWRqZ3p0Tk1DNWRlNzFzUTBU?=
 =?utf-8?B?cDBBZXA4aGlEaysyUklBQWxpc09JcW4zYVpFRlR0bTRCaGFXWGFJOTcrZGZj?=
 =?utf-8?B?aHpIbllhdzNVM0F3eFUrUlNMWTZCamRRMUFsZEF6WVFETW9TUTJOKy9LSmUx?=
 =?utf-8?B?cGJSMDVEYU4wQ0srUWNxd0RneGlMK3phWVVTRVdrSDFFdXBEUkVUYW1Vb09i?=
 =?utf-8?B?a2JHeXdxdUx3cHBydmN2WmVsMEFEMFRlY1RPUzFvVUhSQjJkZDBJbkZiVmNp?=
 =?utf-8?B?N2xIMjl1czNsK2FZRWZaTGZ5MTRlUTIxVUF5MVArSkw0bWdUaE83MnQxZ0p3?=
 =?utf-8?B?RjZ1UTJEWXZRQWlneWxhZ3QxNFNveVE0NG1YWVNUQ3pMUm52bjFCY2VYQVJa?=
 =?utf-8?B?K2NkaFVKbm96OUNqU3BuZnpEVktqVUc5VjhKV1BQM2RWMlZhOGRtOTlpcXNH?=
 =?utf-8?B?YXdEK2l6UVQ0RkFRUVN2cVBERW1mN2thTVc0YU5TRTdJeEVXdnRGRWtSajFw?=
 =?utf-8?B?aFBlb1ZEb3lQQW9kSEFtZkN3Ny92UjNncE1PMDFLSUY1U0M2d1dvcTRNVlVM?=
 =?utf-8?B?alZnNnZ5eXlnNkNxT21pLyt0T25rNjhwTFZKZDVVWTVtNHV4V3IvZz09?=
X-Exchange-RoutingPolicyChecked: GqhZ7rhCuDMLu6tedXspNgWb6RvxLbyQoUOqtC0HYVC4p37TwYkZZx87nlCHHO6qmaxnbX3GRCD6IgMLy4EfkoUN9D9aKeVAGt0xavYwasWh3n7NIw2XglowGkZKJ4Ya/Fqq9ultltzs8wByZ5n6i0/VqB1FirYyy0RH/UO70l8avwzOGgGCY8kqhruM0eK99FoKsHnFo50KOza02e/MzN8gNi0d3wt7uTE4HD2ys8symLLocWNvJZ1FO+uOzYebfgik8D/Q5Rhnt9lW7/rb7C7I6WiVKN1OwVNBFjHWW+QXYdXIn2E/1bX9PHuMO/Eg0RYEo+Cy481LXtFqduFacg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0397b45d-e74c-458c-1a07-08deab85eb77
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:41:20.4291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhzNRox/2ug45FUi5ANfx+yJ5E2SWXpXDie2NbD6duJFr81Ot/WlCjJ+mlCbXMSO0ycuA7NcOoEhEXsSeIuNfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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


On 4/30/2026 6:28 PM, Anshuman Gupta wrote:
> On 2026-04-17 at 14:28:16 +0530, Riana Tauro wrote:
>> When a fatal error occurs and the error_detected callback is
>> invoked the device is inaccessible. The error_detected callback
>> wedges the device causing the jobs to timeout.
>>
>> The timedout handler acquires forcewake to dump devcoredump and
>> triggers a GT reset. Since the device is inacessible this causes
>> errors. Skip all mmio accesses and gt reset when the device
>> is in recovery.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add check in worker (Mallesh)
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c         | 14 +++++++++++---
>>   drivers/gpu/drm/xe/xe_guc_submit.c |  9 +++++----
>>   2 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 8a31c963c372..5ea5524d83af 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>>   	if (xe_device_wedged(gt_to_xe(gt)))
>>   		goto err_pm_put;
>>   
>> +	if (xe_device_is_in_recovery(gt_to_xe(gt)))
>> +		goto err_pm_put;
>> +
>>   	/* We only support GT resets with GuC submission */
>>   	if (!xe_device_uc_enabled(gt_to_xe(gt)))
>>   		goto err_pm_put;
>> @@ -977,18 +980,23 @@ static void gt_reset_worker(struct work_struct *w)
>>   
>>   void xe_gt_reset_async(struct xe_gt *gt)
>>   {
>> -	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (xe_device_is_in_recovery(xe))
>> +		return;
> How is this synchronize with xe_device_set_in_recovery() a mid flight
> reset can still hit the device which already passed the check
> xe_device_is_in_recovery() check.


There might be a race when gt reset is already in progress and there is 
an AER.
Since this is an error path, some -ECANCELLED errors should be 
acceptable. Currently we
see a similar behaviour if device gets wedged and gt reset is in progress.

A better approach would be to cancel all workers which will be done in
[PATCH v6 0/8] Introduce Xe PCIe FLR - Raag Jadav 
<https://lore.kernel.org/intel-xe/20260423100017.1051587-1-raag.jadav@intel.com/> . 
This series will be integrated with
existing PCI error handlers once it is merged. Will add a TODO in the 
cover letter
and the first patch.

A similar TODO exists in the FLR series "TODO: Add PCIe error handling 
callbacks using similar flow."

Thanks
Riana

>
> Thanks,
> Anshuman
>>   
>>   	/* Don't do a reset while one is already in flight */
>>   	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>   		return;
>>   
>> +	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>> +
>>   	xe_gt_info(gt, "reset queued\n");
>>   
>>   	/* Pair with put in gt_reset_worker() if work is enqueued */
>> -	xe_pm_runtime_get_noresume(gt_to_xe(gt));
>> +	xe_pm_runtime_get_noresume(xe);
>>   	if (!queue_work(gt->ordered_wq, &gt->reset.worker))
>> -		xe_pm_runtime_put(gt_to_xe(gt));
>> +		xe_pm_runtime_put(xe);
>>   }
>>   
>>   void xe_gt_suspend_prepare(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 10556156eaad..1f32fb14a5c1 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1522,7 +1522,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	 * If devcoredump not captured and GuC capture for the job is not ready
>>   	 * do manual capture first and decide later if we need to use it
>>   	 */
>> -	if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q) && !xe->devcoredump.captured &&
>>   	    !xe_guc_capture_get_matching_and_lock(q)) {
>>   		/* take force wake before engine register manual capture */
>>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>> @@ -1544,8 +1544,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   	set_exec_queue_banned(q);
>>   
>>   	/* Kick job / queue off hardware */
>> -	if (!wedged && (exec_queue_enabled(primary) ||
>> -			exec_queue_pending_disable(primary))) {
>> +	if (!xe_device_is_in_recovery(xe) && !wedged &&
>> +	    (exec_queue_enabled(primary) || exec_queue_pending_disable(primary))) {
>>   		int ret;
>>   
>>   		if (exec_queue_reset(primary))
>> @@ -1613,7 +1613,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>>   
>>   	trace_xe_sched_job_timedout(job);
>>   
>> -	if (!exec_queue_killed(q))
>> +	/* Do not access device if in recovery */
>> +	if (!xe_device_is_in_recovery(xe) && !exec_queue_killed(q))
>>   		xe_devcoredump(q, job,
>>   			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
>>   			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>> -- 
>> 2.47.1
>>
