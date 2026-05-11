Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1892CD37BE
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 22:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B30010E906;
	Mon, 11 May 2026 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iFT5/+Ii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282E810E906
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 22:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778538459; x=1810074459;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HJxs9T/GrUBL0hjGGldBZDt0j93SqxkLh7c/lk4T2yg=;
 b=iFT5/+IiA+M+V87Q6M5KXuG1okJttDI0XEGB7Mu1pGdu1w6W0Emf8wJn
 3FFOUrRqRYLdgzAl3cbrVh2p0XJdcBWZ5VrpPSweJxJfJnXZ51Sxe831e
 ck6QLJ0+8xcA1XTIu174BGskrVOVWypb6vUloqO1FraTr8RzEmbSzNSPQ
 wSifzX8z8AVapAt15yZLwB9MNJm9/C/VKXLOkpCLYwJC6UhYFRfYKNlJQ
 ou5pKIkAtWUDdmCItAlQv+ozCg7KjmS4AcwFIIlAofdAtfJX+rPtq4rI/
 TobzgnB34dhtCWXGwEhwIbvoESMrEFfRQEG4P2kYcK7fNmHBJvQdT7Wh/ w==;
X-CSE-ConnectionGUID: XYOzr5vCSguBgfx1GwsrSQ==
X-CSE-MsgGUID: rzjAYHY1QUqAnFDXa2MLZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79621047"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79621047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 15:27:38 -0700
X-CSE-ConnectionGUID: qeBxm7FIQvKAWs0jWGGGSg==
X-CSE-MsgGUID: olIyAi8jQwKkg4u5yaxEWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="242580856"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 15:27:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 15:27:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 15:27:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 15:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuTWigBzoHg94TU2VXCZevlxh1iPraWowHWelv8OW1S3kHpSKRJeHQueLoNMeZO8IZBOu7XeW2UKziCLCNUkpyq1PNaNt3inyOFzpmP4Tz8ZDVjb3OQNt8jyO9DSWfQRzmYg8EdN3N1s9WpcsomFTXVKSfEy42t/aZN/Lg1fm8vpbjd/G65rE66ojgrU9sCWgT01op2WK7vbO6/QmWEP/RbFLTeNIys/awEPgt8DMlpfmZnijVjW0ES2fkBsexWsijw0I1FdjXdiLp9LkVtjo2mjnfpO++ecI21AbLwxFhpWFX76lnU9rQjBYL4oqMkpBMnGV/1UWQnkbsetcgKoUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uD5P/KtaqtslLmh/VztQg+7AjSVN3aG8sNQldKRBU3I=;
 b=ivw83JXsLkkuX/AtXvNVFiaWAYuP9wB+tzQPBMmzzEI1xJHlQj1iWIQDwJsv2HBhaJhy7FXD7CXVHTh0RJRp6tqMcJs/BwPd95u1dDIe92SftAtYeTmWV/uBqk0Wt6KnSwo3MyINWxFpHihssjSOVC7oWSqggAP68GCkZlpwn6daw6vC8aWdMyhGCCqarecyvC8hwou9/pu6XMsnuVHORPSbOz+2mE9W7i66/gpOvuOy2VOuBntittIcNZ2dTgm7CuGs8NTZ8e3HXlmz9TJ1Mbc4uNVr0VYkL0bacyQA3gAIwRBmIdrresmQ4t8ODLLh5qqQNUrvf3fp73x5YwCTNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.23; Mon, 11 May 2026 22:27:35 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 22:27:34 +0000
Message-ID: <1aa068d9-f630-4d4d-b42c-d1937afd3730@intel.com>
Date: Mon, 11 May 2026 15:27:32 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Unify fault injection hooks for CSC, GT reset
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20260413045118.548328-2-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 9879c8fa-4215-41b6-b623-08deafac7fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: nd0Vfq5NgcMfcp7szlausct4pYufm7z1k3RRKKp2c4EYutT9mKQAxYd/VU3KHtiuKqEmQcUmn7uWPWbAgHswdk4RP2vFvsvUhTSJTwNs4TdZxKur7Cd0wq1fBYR4Tvwgukjh4A35VyPPiL2mhyF7fNQngTT/SLQuuR9tabWC8HqjW1GPHVTY+eZQX7oV4T02002Ayz/V+6K4CzKLq/ZN1NAUFmvUmqiDpxnlVvC91DTJpdANugIwsPSJup4NAg8D7xqDKFBaBlTkKdXfXRhzdnN4oQhx3rFUBgTmx7b+o8ZqVGwyDMVdAdYa7+H7le3Uf72h2hnhZuCdPAFMkfbitTwp41FtjF6f+wPVz1JiOLnZTjsEpR+HkWRA19n3Gs49PX5YQnPcsr3J31jIWQKCEYNeYV0KfUd5t9sRMNWf7ebLOypNJtntYP5d+BM9eGs3QOKJecj50hxd0w2lpC2HcWmtkGl4cW5ccf6mJXxvZ2j0oPBLwjqMnKFWKCn1wLUK3q8dJVIWgttdcuRZMVUpASbrvgmXWuXkaQOCEdsFI7gQtq/bAIjYwe45GwxnbupT25gloKEq8lnhwI1QEPdxLDXAW3Qsb0eBvxHsl1daa7QB5H3sfBABx3sd8WD0BGHb8XdF2tGn84jte5FYdm9STAs2RIMYlO6+fzPuqnMpZZ90HvoHk8Ja10XuZSq24OUh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2hDTWtIclJSOW0rcXJZSnFkMmR0eVdBOE82TG5YclpWTE96cnQ2eVBMMHkr?=
 =?utf-8?B?TDVSTUttZThhakdkd1cyV3RES2RCUzBKQzNaS3Fyck5MSktSMU1FTGFocmJw?=
 =?utf-8?B?U2hoRmJYZVMzV0RiRlEramFhaTlrZk5ZcTNtb0EvcWhKdThvTHRhRjJmUXZy?=
 =?utf-8?B?THpET2xtcitOOVBzdHRqZytCYVNCbzJUY3EyNUZGOWd0eHZyZDJ1NzVQWHVE?=
 =?utf-8?B?Qjh5Y3JWSzhublNOSkl1OFhGVTU5U0x4a0xKK0UzNWFTaHhleDZPb0NCWUJJ?=
 =?utf-8?B?L01GOXUwNmVUNXZnOG9TckErYmJqaDlqZUpScUNDSzJFZFpzOTN2V0hUQ3Jz?=
 =?utf-8?B?MVgwNHQzYWs4TzdxekV3T3ZicStLb0M4eXppTWM2WlhJYmxkSVEvNldlTEVW?=
 =?utf-8?B?L0haSHdpZEdjQzgwZGkvWko3QWJxdzJPQk9oTzFHbnhzZjNXN1Q5c2tGd010?=
 =?utf-8?B?cmc5OU92b0lvZTBWaHRldUd5RXR0SWpUbkorMlhmVkpONHdmajVyUmNBVlps?=
 =?utf-8?B?VitpRWdsRTVZM0IyNFA1eTdEUjRnbTI2VEEvMDk1S1VWUjlWZ1FPOUFJSGNG?=
 =?utf-8?B?Z3RDa1Rjd3Y0emdQdVg3NXAyelpZanhsQmQvc3BCc0d3MGtsMktueWVYcjYr?=
 =?utf-8?B?V0xEb3BEK0lZR1lZSFhWV0pDdWN2MDBzWUIvTFN2ODhsTGlFV1VBMFJDZHRW?=
 =?utf-8?B?YmR4enpZSlFNUGJIaGJmQjl5UDZ0d1Z3SFFNcGxOeE5RRkUyQ1FoZHBPRDZl?=
 =?utf-8?B?TTJlSmJjTDVLb2lrMURzYUs3cXU1TWo5VWIwVkRqWWw0ZkFvV08zTVlTem9S?=
 =?utf-8?B?Y05kMVlpYWVLMmxQd1NJUkRVdGwvcUlrMGZGYVRQK3ZkRWEySDhmM3JYcU9v?=
 =?utf-8?B?UkRmU0JZdWlDa1RMTUhnME1ycXpMc2l4Ynh5dk5RUkNVQUJQbmFvQXJNSUor?=
 =?utf-8?B?dk1DdHBqaGVSNVRnRC9aUU1ZOUM0Wm92WWZmd29iR0NsQXVuT1R5MkZNNXBP?=
 =?utf-8?B?Y0VGakFoL2dHZ0F1czNydnVmVWorQ2RIUkNjYVFCNC9yTTdMYTVONVNad0tO?=
 =?utf-8?B?OS91ZFJjY0F1TXRVYk5aWlRZb1NVL3FmdDA5MlQwT21lNHFTNlBZNlRaUWRE?=
 =?utf-8?B?Q0ppYzIxSW1rR2d4Q2JVZFhjVWwyZVVNcmo5VXViVSt4cE1GWEt4cTM4Uy9N?=
 =?utf-8?B?bDVIdkpwU0Qxb0Jzbng5cXhaNVpzV2NMMDhxWjZKQ21BcEdjbHJROWlaNm1G?=
 =?utf-8?B?eTk1NzFpUmFTUXJFWWRZVjBjeUFzUTFmMFdYU0d3bUpVZXc3cWo1ZDEzYURH?=
 =?utf-8?B?ZlQrUm95cUZ0TjdjNGhSWDU1dEQ0bVJGcjVSR2NXZ0VTTjJTM1lGWERDcHB5?=
 =?utf-8?B?aml5bGlvRlI3dGtwd0dFRlUxcjlxYWs2QUxrTGh1WW4yVFlBaGNJRXJDRHBj?=
 =?utf-8?B?ZGxUcnJ5L0NNcmpNM1FqVVNrRFNQbnBGNnhLZ01uUTRDTUVkZW5wSUdXTVlE?=
 =?utf-8?B?Ylh2clp0RE5XSkpVN1VmR1dCdysyK3dLUHRyQXFxejZDRllYSmZ0ckZFM054?=
 =?utf-8?B?UWp2ZVN3cnBRbnAwM0w1Q2dTSnVkQTNEWHQ4WEVsUlg3elR6K1BiYWlaR1RE?=
 =?utf-8?B?M2x0UUhLK0JLa21aOEdTa3JnU3pkcWJWMEpuTHErSlVLeUxXTm40N3BrTjRj?=
 =?utf-8?B?VCtPdzJMZ1IrVXFVbU9oK3pFRnQzdXl6ZzNibE9yYnRHK3BvU2JiZkJLdlNH?=
 =?utf-8?B?SW1mODNURlRDK1kvZmFmc0crbWlkUEFhNURuMTRlVG8yU1lmeWoxNFRrY3JX?=
 =?utf-8?B?eWVhaHV2ZXZ3dFYwdnZ5WWpoZ1Avb3ZwdWYvLzFLQW1EczYrMUQ0SWNVcklx?=
 =?utf-8?B?QU1uTkk3a0JxNVlQTG03VXhVanpTZHhtTTEva2UrQURXZCtaYll3Sys3Y2VU?=
 =?utf-8?B?YVpBUVBOWmNHeGVQNmNrZndvQnhFNktWZGVSNThnc0R1UElyTUw1MzVubjBQ?=
 =?utf-8?B?azVDVEN0VTdETk1XUTk5Ym52R1hXZDF1SUExQVNxNy9XQWc3bTU4U1Fac29I?=
 =?utf-8?B?TzgxL0lLeWxxSFhTRE9HWE45RkVQeUFzQjRYanMyL0RWMjY1L01YUDJZNGhL?=
 =?utf-8?B?SittQVYzcHJRWEVvWmd0LzFtdzh4Z3RUMkRpbnkvK3pZcmNKaDZHcnd3MzNr?=
 =?utf-8?B?WVdUUE9XeUM1bXRtZFN0QXp5NGFUQVViMFdsQUR2eFE3Skc0UllnYXUrMWY5?=
 =?utf-8?B?aE1IaGl0S0JSUG02TktBcFhQTC83NEdpSXlIbXVSL2Eyc01PVEdrdWh6YW5i?=
 =?utf-8?B?dlRHZHhnZU9WYmZrOXo3Uit6N1krcXY2MWhYdXFoVmdPNVpyRE1jdUx2MTBs?=
 =?utf-8?Q?M13l37Xfn3BHssGY=3D?=
X-Exchange-RoutingPolicyChecked: KukIHAAZrWaJ9AL+xOZBKZ06kagqpsgP8UE/fFClqcf8MpAuAtHv+TVDcAen58YBH02rqXWb0Dy/kN6+f30OtbnZgMlDDUQpCwB54jF1xniwhAJHMHEhHn1r8XDpwLYV0Nii7fx1FP0xyHQwLJCSdOrEjmLQCdHyyntec6dz73OJjluEqO/yUJMS55UHsyyrLDLWhe4GOKkXbMOkIZDGzBt+SHpif80FTlrh0vubAIb68xB835CjpvRKCcQ9WlkyJI4kYYhbsiVJJXQVwnA5hszaWhgvv5QfG9aSWjKSmTJKKWc4r0Smw7ad0Xq4KI8tNR4xkdD4cKSY0kBlPTH8xQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9879c8fa-4215-41b6-b623-08deafac7fb6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 22:27:34.7339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3CHa12l/3jXj+CyAuqFT/HeQuo2xqmKHPYn+wk3q5BYB0XXuBEI+ckFzHdnplWiapU6x2oNXOMFOyn6KyahwFZUj7lAsC2epvVFKk0smVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
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


On 4/12/2026 9:51 PM, Mallesh Koujalagi wrote:
> The fault injection code was scattered: the GT reset
> hook lived in xe_gt.h as an inline function with its own global
> variable, the CSC hook had a separate global in xe_hw_error.c with
> an extern declaration, and each was individually registered in
> xe_debugfs.c. Adding a new error type meant editing many files and
> copy-pasting the same boilerplate.
>
> Create a single, centralized fault injection module
> (xe_fault_inject.c/h) that manages all fault types through one
> table. Each type is just an entry in an enum and a one-line row in
> a descriptor array -- no more scattered globals, externs, or
> per-type inline helpers.
>
> Debugfs interface (under /sys/kernel/debug/dri/0/):
>   - fail_gt_reset         - GT reset failure
>   - inject_csc_hw_error   - CSC firmware error
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_debugfs.c      |  9 +---
>   drivers/gpu/drm/xe/xe_fault_inject.c | 63 ++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_fault_inject.h | 41 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt.c           |  5 ++-
>   drivers/gpu/drm/xe/xe_gt.h           |  8 ----
>   drivers/gpu/drm/xe/xe_hw_error.c     | 11 +----
>   7 files changed, 112 insertions(+), 26 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.c
>   create mode 100644 drivers/gpu/drm/xe/xe_fault_inject.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 110fef511fe2..affa4d2d613a 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -347,6 +347,7 @@ endif
>   
>   ifeq ($(CONFIG_DEBUG_FS),y)
>   	xe-y += xe_debugfs.o \
> +		xe_fault_inject.o \
>   		xe_gt_debugfs.o \
>   		xe_gt_sriov_vf_debugfs.o \
>   		xe_gt_stats.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index c9d4484821af..d0ff603a0b03 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -6,7 +6,6 @@
>   #include "xe_debugfs.h"
>   
>   #include <linux/debugfs.h>
> -#include <linux/fault-inject.h>
>   #include <linux/string_helpers.h>
>   
>   #include <drm/drm_debugfs.h>
> @@ -14,6 +13,7 @@
>   #include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt.h"
>   #include "xe_gt_debugfs.h"
> @@ -38,9 +38,6 @@
>   #include "xe_vm.h"
>   #endif
>   
> -DECLARE_FAULT_ATTR(gt_reset_failure);
> -DECLARE_FAULT_ATTR(inject_csc_hw_error);
> -
>   static void read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
>   				   u32 offset, const char *name, struct drm_printer *p)
>   {
> @@ -563,8 +560,6 @@ void xe_debugfs_register(struct xe_device *xe)
>   		drm_debugfs_create_files(debugfs_residencies,
>   					 ARRAY_SIZE(debugfs_residencies),
>   					 root, minor);
> -		fault_create_debugfs_attr("inject_csc_hw_error", root,
> -					  &inject_csc_hw_error);
>   	}
>   
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
> @@ -610,7 +605,7 @@ void xe_debugfs_register(struct xe_device *xe)
>   
>   	xe_psmi_debugfs_register(xe);
>   
> -	fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_failure);
> +	xe_fault_inject_debugfs_register(xe, root);
>   
>   	if (IS_SRIOV_PF(xe))
>   		xe_sriov_pf_debugfs_register(xe, root);
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.c b/drivers/gpu/drm/xe/xe_fault_inject.c
> new file mode 100644
> index 000000000000..775137930135
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
s/2025/2026?
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/fault-inject.h>
> +
> +#include "xe_device.h"
> +#include "xe_fault_inject.h"
> +#include "xe_platform_types.h"
> +#include "xe_sriov.h"
> +
> +static struct {
> +	const char *name;
> +	enum xe_platform platform;
> +	struct fault_attr attr;
> +} xe_fi_descs[XE_FAULT_INJECT_MAX] = {
Nit: Rename to xe_fault_inject_desc or something?
> +	[XE_FAULT_INJECT_GT_RESET]	= { .name = "fail_gt_reset" },
> +	[XE_FAULT_INJECT_CSC_HW_ERROR]	= { .name = "inject_csc_hw_error",
> +					    .platform = XE_BATTLEMAGE },
What happens if a fault injection type is valid for more than one 
platform (but not all)? I guess the platform checks will need to be in 
the handler functions instead of here?
> +};
> +
> +/**
> + * xe_fault_inject - Check if a fault should be injected
> + * @type: fault injection type to check
> + *
> + * Returns true if a fault should be injected for the given type.
> + * Controlled via debugfs fault injection attributes.
> + */
> +bool xe_fault_inject(enum xe_fault_inject_type type)
> +{
> +	if (type >= XE_FAULT_INJECT_MAX)
> +		return false;
Do we need to check for CONFIG_DEBUG_FS here?
> +
> +	return should_fail(&xe_fi_descs[type].attr, 1);
> +}
> +
> +/**
> + * xe_fault_inject_debugfs_register - Register fault injection debugfs entries
> + * @xe: xe device instance
> + * @root: debugfs root directory
> + *
> + * Creates debugfs fault injection attributes for all supported fault
> + * injection types. Platform-specific entries are only registered on
> + * matching platforms. Skipped for SR-IOV VF devices.
> + */
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root)
> +{
> +	int i;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
Looks like just the csc_hw_error injection has the VF check currently, 
not the gt_reset one. Was that a bug or intentional?
> +
> +	for (i = 0; i < XE_FAULT_INJECT_MAX; i++) {
> +		if (xe_fi_descs[i].platform &&
> +		    xe->info.platform != xe_fi_descs[i].platform)
> +			continue;
> +
> +		fault_create_debugfs_attr(xe_fi_descs[i].name, root,
> +					  &xe_fi_descs[i].attr);
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_fault_inject.h b/drivers/gpu/drm/xe/xe_fault_inject.h
> new file mode 100644
> index 000000000000..958213fe2eaa
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_fault_inject.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_FAULT_INJECT_H_
> +#define _XE_FAULT_INJECT_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_device;
> +struct dentry;
> +
> +/**
> + * enum xe_fault_inject_type - Fault injection types
> + * @XE_FAULT_INJECT_GT_RESET: GT reset failure injection
> + * @XE_FAULT_INJECT_CSC_HW_ERROR: CSC hardware error injection
> + * @XE_FAULT_INJECT_MAX: Number of fault injection types
> + */
> +enum xe_fault_inject_type {
> +	XE_FAULT_INJECT_GT_RESET,
> +	XE_FAULT_INJECT_CSC_HW_ERROR,

Nit: Can we name these as XE_FAULT_GT_RESET and XE_FAULT_CSC_HW_ERROR, 
since they are type of faults? Also, maybe have a xe_fault_inject_types.h?

Thanks,

Vinay.

> +	XE_FAULT_INJECT_MAX
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +bool xe_fault_inject(enum xe_fault_inject_type type);
> +void xe_fault_inject_debugfs_register(struct xe_device *xe, struct dentry *root);
> +#else
> +static inline bool xe_fault_inject(enum xe_fault_inject_type type)
> +{
> +	return false;
> +}
> +
> +static inline void xe_fault_inject_debugfs_register(struct xe_device *xe,
> +						    struct dentry *root)
> +{
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 8a31c963c372..7cbb9c3c2dc3 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -23,6 +23,7 @@
>   #include "xe_eu_stall.h"
>   #include "xe_exec_queue.h"
>   #include "xe_execlist.h"
> +#include "xe_fault_inject.h"
>   #include "xe_force_wake.h"
>   #include "xe_ggtt.h"
>   #include "xe_gsc.h"
> @@ -923,7 +924,7 @@ static void gt_reset_worker(struct work_struct *w)
>   
>   	xe_gt_info(gt, "reset started\n");
>   
> -	if (xe_fault_inject_gt_reset()) {
> +	if (xe_fault_inject(XE_FAULT_INJECT_GT_RESET)) {
>   		err = -ECANCELED;
>   		goto err_fail;
>   	}
> @@ -980,7 +981,7 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   	xe_gt_info(gt, "trying reset from %ps\n", __builtin_return_address(0));
>   
>   	/* Don't do a reset while one is already in flight */
> -	if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
> +	if (!xe_fault_inject(XE_FAULT_INJECT_GT_RESET) && xe_uc_reset_prepare(&gt->uc))
>   		return;
>   
>   	xe_gt_info(gt, "reset queued\n");
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index de7e47763411..c7278247215e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -6,8 +6,6 @@
>   #ifndef _XE_GT_H_
>   #define _XE_GT_H_
>   
> -#include <linux/fault-inject.h>
> -
>   #include <drm/drm_util.h>
>   
>   #include "xe_device.h"
> @@ -38,12 +36,6 @@
>   	xe_gt_is_media_type(gt_) ? MEDIA_VER(xe) : GRAPHICS_VER(xe); \
>   })
>   
> -extern struct fault_attr gt_reset_failure;
> -static inline bool xe_fault_inject_gt_reset(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> -}
> -
>   struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>   int xe_gt_init_early(struct xe_gt *gt);
>   int xe_gt_init(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
> index 2a31b430570e..87b2a2cc0ef7 100644
> --- a/drivers/gpu/drm/xe/xe_hw_error.c
> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
> @@ -4,7 +4,6 @@
>    */
>   
>   #include <linux/bitmap.h>
> -#include <linux/fault-inject.h>
>   
>   #include "regs/xe_gsc_regs.h"
>   #include "regs/xe_hw_error_regs.h"
> @@ -12,6 +11,7 @@
>   
>   #include "xe_device.h"
>   #include "xe_drm_ras.h"
> +#include "xe_fault_inject.h"
>   #include "xe_hw_error.h"
>   #include "xe_mmio.h"
>   #include "xe_survivability_mode.h"
> @@ -25,8 +25,6 @@
>   						 (PVC_COR_ERR_MASK & REG_BIT(err_bit)) : \
>   						 (PVC_FAT_ERR_MASK & REG_BIT(err_bit)))
>   
> -extern struct fault_attr inject_csc_hw_error;
> -
>   static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
>   
>   static const char * const hec_uncorrected_fw_errors[] = {
> @@ -160,11 +158,6 @@ static_assert(ARRAY_SIZE(pvc_master_local_nonfatal_err_reg) == XE_RAS_REG_SIZE);
>   						 pvc_master_local_fatal_err_reg : \
>   						 pvc_master_local_nonfatal_err_reg)
>   
> -static bool fault_inject_csc_hw_error(void)
> -{
> -	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&inject_csc_hw_error, 1);
> -}
> -
>   static void csc_hw_error_work(struct work_struct *work)
>   {
>   	struct xe_tile *tile = container_of(work, typeof(*tile), csc_hw_error_work);
> @@ -509,7 +502,7 @@ void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl)
>   {
>   	enum hardware_error hw_err;
>   
> -	if (fault_inject_csc_hw_error())
> +	if (xe_fault_inject(XE_FAULT_INJECT_CSC_HW_ERROR))
>   		schedule_work(&tile->csc_hw_error_work);
>   
>   	for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++) {
