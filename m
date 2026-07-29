Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29FCC53200
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jul 2026 15:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C33410ECA0;
	Wed, 29 Jul 2026 15:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EhykNc4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9E10EC90;
 Wed, 29 Jul 2026 15:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785338915; x=1816874915;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6vkCjcq8uJL/GSgnq3z1XYHKDsDnb/+M+a/28y6GOFc=;
 b=EhykNc4dUbYbG+wmMRN5MeU2f9+jo6sF3FDRIfkLFJvvCz8AlOtLPUf0
 49aUmeqgWyf7Tm/yhsqQ4d9EnKJu3WonVLFfH/jh7r32X+eZh9QxRARIL
 r6USUPTljFU7Fx8d0C/GJMHdDc+O6L0o+zKz/BUm+fKqbjJP0xDdN2rHZ
 XQLcz1IV56li7TBM+2AfcErdN6JkoPPfVpsJLDZAZfVjqZgbXAozEgHsY
 yobFR29WaJ6OavehKyYIp17Xno0AZClEO4bfy+dgVQdEvNMJSD9iai/qR
 X26iGAA36l6QyHjF1jngsmrPNVAtyYvFklFWyYDJURd8mpYiyBNEy/eyl w==;
X-CSE-ConnectionGUID: Hc2c65miSdiAscRykWJgrA==
X-CSE-MsgGUID: 3P+mqF4QQoWJ9KyaMG8Abw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86024811"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="86024811"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:28:34 -0700
X-CSE-ConnectionGUID: /TIu+FsGTeqBUkBqaNssIA==
X-CSE-MsgGUID: 1pbRcGoMTzi9tKGuAT5lXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="257361926"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 08:28:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:28:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 29 Jul 2026 08:28:33 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 29 Jul 2026 08:28:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sb999653TrM9vAk6pN42LqZskuAvZuAcBbvDwOSYBhqtgxps+6rS/QdiTOBWZlvvtIdR3x50A482+UqIRUG+K0HguB32hIM8vmK4xe02jF0OjZQUn61Iq54Qtqe+K3PMTo917hh2SPaGZSHHRwdzXDBcRZ8r64bgWckIn/NlLh9crWcDsgQfxKteRCPhOSWyQbf9KsCY+6PtsvsW4sBuk+y8qepZ+ZneHeEDcgjVFYhWPmjRQFrdVVZexKCUfVkSCOs0OJAHgNFHTvmmb0A+odD/spd9ee1H6YSP5rcN+PdVUPWNvAWpGAnwJhzVMsfdOALq+9qhiJLaUQASb7gqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+jJCCtLk+gAnObRrZya4V5zcPAsZu/ud0wrXa66978=;
 b=MYu/nbxGICvnrnnEw9a8hxUF7A5WHtwOVABoHmcvWAY3NU4meVrE34ZuaDv4VLJ4OejF+fZk2hN/KI8kH7ywYFGWHYKHbAUGSsW36A03rilbMMcDd1UlGrYS/h580JdJd+OlXi1kj3d+dUS8c7eU4kPNLrtxXk/lps/bLZvdb8mDFsLX7PsbGCw19Ti1FjdG10QOJPemIK2d7xAhoedcgUIgXfJFP8KhOR3lxy7vlmXoEh3H7zDaPqCQVbZQdPD3jXuesEQ17kdWirZtxU8y8zXQLU4VKMkipRDHpuQSKkZDCyy044CN7aLXNIsUpcrNSAVB9Ep3VnO7tP6oRjKnIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 15:28:31 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 15:28:31 +0000
Message-ID: <e3d02a2a-5500-4c61-8bfa-f016e32a1000@intel.com>
Date: Wed, 29 Jul 2026 20:58:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] drm/i915/cursor: Check joiner cursor commit status
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260706115629.2984258-1-nemesa.garg@intel.com>
 <20260706115629.2984258-2-nemesa.garg@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260706115629.2984258-2-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0287.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::19) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|MN2PR11MB4598:EE_
X-MS-Office365-Filtering-Correlation-Id: f8e30565-fa22-4bd5-356d-08deed860bc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: HnZQ0GI+POOy2QrX0+7BLA2il8KdvuGhf7kMZ6w0y3xGYf4SWBSJqGssyI3s38CvWYKPCFx/YllrwZ8RpN0l5nLb1Sc3J1W2bkPfVNsujdlMsHq2mU4L7QEeJe1Av9FDmO9g8jLShiY5PQeJCkBi1PZ4tk4vCmGMoyWrLl2ZvrB0SNTGgjB60Q7r5KKO+gFhuw4KCNBimCo1CUm9e+KoBxBj7r/tV53JO13ykl793jxS9QFkV+2w4cZW/Ezz0vzBRXqpPRguv4JNhLuMelriYEfgHigPOq30oDu2c90FdrJJ5Gc40NIiUCW3KDY+zvdYhMhLwQPhRDgN1z9Z6M0QLCIuZofexD/yZ/vPlCIT3/8gnukica0T9ki1IUbdnBOHQOo/SvVkfgM4x/9FcjgEWPODL6H3/7BkSIMkwgYOAfAMws0NpkiJPOxpYGbZ2FwJUAtcTeoAqPluQA4C+/vHDVOqxD4EEQ1uJvWj/BSgIkyvXwlAyxUWkU9qFQNZeBLM9t7MvHsx8ggIj4ADffnosgStyaGEM/HpWM4bEbnv1u7XSGgV9J1NJHdUyjlGCq9P0/OCfg/dHgb3TTqSFSpjtJsVlUzc+mHZ4nxBkGSWyqn8JUT7mdPKGWHz8N7SL69VwitFMMrya0DVFSetRUBV7Im7PbYZh2icLp8PACwWYPU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0lTcnkwRXNtMWxyNmQ2VE5mL0RCVmd1QkxSeU1wZ2lNQktNUnBUUlJwZm90?=
 =?utf-8?B?SVpkeUplOEFpN0hnbTVsYjJkZ0ZCSkZxb0JmUFVxSWN4UDczVW1DL05zVUt3?=
 =?utf-8?B?SU96VTRSNC9pK042L0oyQlcxbjFhcmk3WHFzeHdScG5pR21Fb3BPSDE0V1BO?=
 =?utf-8?B?anhIb1poT0dCaFMyUGFIRHlDNzVoV09OYTgzSHlpNzhJZHZDUmhGeUN5L0Q1?=
 =?utf-8?B?RHZTemFyd2lEc0I4QjdRRHJQZGFjcFdBNS9yd1NjQ09mNmRhMU9JdVlocFE1?=
 =?utf-8?B?M0RLL0lyU1hOekVHdGxLQURacWdlV0xZYlV5akx1NzV0ekZzeWNTMW8yeUNG?=
 =?utf-8?B?RGo3cnVYQjJSTndNVGdzOUxlczluSnZ0QmlSQWZab2hUNXBtN3dhOG9XREVY?=
 =?utf-8?B?RGkwdXRRcHVMd2lFZUk5djlGOEdzSEE5OWRJS01XdENEb01nVlp2MlVwR1hY?=
 =?utf-8?B?WFZTUW1lbWlpUlRWWGUyQjR1Q0VFdzUyUkRoTUNlS2pTUm1OOE9UZVRWZW1M?=
 =?utf-8?B?QVVMSS8rZXk4bC9IbXJ4N0pTL2dRVFRqYlAzRDJDU1ZGdVMvZlNlS2dNRjVw?=
 =?utf-8?B?UEJlVGNsWU9RblJNb2JJRXV3NnhjVS9PNkJ5VWRldzEvWXVTMmNpWXNwR0l4?=
 =?utf-8?B?Vm1PMjdCdzROL2pGdGplV0lFcEZJSkRETzJxTFdCZ29pVS9yVzVCSkRUc3Jz?=
 =?utf-8?B?MTltMXRHV2JiaGQ1NkdLMFMyak9PSzJzaVcvdjV1VWcvOTBUR2dDY0VTTjY5?=
 =?utf-8?B?NDdwMjBMYU9yeU8rS0pIdHh2QmpYVkJLYmwvcGpaVFN6ejIwcXB2czVKUDBT?=
 =?utf-8?B?Y282TktTQmhKdExFOUVTS1RtRmxpVXRzZkhHcW5JN2FjTkRndmtuUWxtUHcx?=
 =?utf-8?B?c1ZzUFM4TUhoVG9tMnZMZXU1K29HS3F2eStKblJ0SkJIWHFvcmtwekt1NStL?=
 =?utf-8?B?ZUxmN2FSWkQ4VGJ0MUFPS1pCZVNxQjUreVM4c0k5cmVDQms0SjFxNE5UdktB?=
 =?utf-8?B?cno5dWdUMEhkN3huYnd4Q3NaQ2lTZWZsREIwTXM2R2E5R3BUWUJsWTAxSFNu?=
 =?utf-8?B?R1dndkUrWDFoWWw4ZGpMRndzdDJIVkFyV1BSNFhuSWpZcXlCTG9MVkdld0pH?=
 =?utf-8?B?VnZDNkRUeTdoMU5jQ1UvOS9mcHhCMkcxbUZSdU5sSVNvZkdSYU4vRlBvb2Nq?=
 =?utf-8?B?S1VXSzMwMk9qQ2RDWXR4VStNMnhpUHA4RnlXNG1LR044VW1XV29VUVRKdVZE?=
 =?utf-8?B?d0poRlhLL3MzMk9sVHIzYlZDRDFaaUZpZnBDV25iejJoUmJTK3lCdXc1a1M3?=
 =?utf-8?B?RHUxR1pKUGF3MmtOa3NndFlnVzJ5eWZKanExamIrZ0gvZm1lajJDN1FtQ2FE?=
 =?utf-8?B?bm5DSlIybm50c1ZYY25rWkduZEgvb0xBSTZhYVo3TnYxb2pzUUpmNEVKMzRy?=
 =?utf-8?B?U0FQVmZqeE1NVG9ETmVabVF0THVCeUZxbm5xVFN3OE1vM2tUc2RkK0w1bkFV?=
 =?utf-8?B?dENHZGZEQ2pvSlovV2tVbmZjaE80KzNBZHJHUHBpd2FUTlFaRjByMGtPQnZJ?=
 =?utf-8?B?ZGF1d1pEcjQ2L0ZraTJoMDhIN3J2dlgyVDdlcHNTaXpaeG4yZ0JneFljNjhI?=
 =?utf-8?B?Z3pUVzc1c0RobVVrVnpUZ2xSV3R6SzJvbUNnVVJxeUlJczZvSVBPa0NNZ2Ez?=
 =?utf-8?B?Um5sbDBpSlp2Mnp6Wk9PaG9Cc1Z0L0diakxTZlNkWTRSckpkKyt0ZGVsdkhG?=
 =?utf-8?B?aFdZRnJsNGx0WmVFTUZWRDNDMW5mWVZiQS9aZFZYOTJINDVhbVpUaWxEQ0ll?=
 =?utf-8?B?QUxNdTU3Zmxhbm1hcTdPamI0Yjg4UGF3eUROc1RSVXFiMGlNL29BNWtXWWk2?=
 =?utf-8?B?cXMvNm1pU25yOEZOWFhYUGdPNjFWck5xdVJGMHFZeVdPUFJLVE1Mekp5Qklm?=
 =?utf-8?B?U3MvaUpCY3BLTitScElxdHhJQWxueFdmY3p2YTZwOGtOK0RjT1N6UXVFWHBE?=
 =?utf-8?B?YVFiTDRGNTVwcVo3ODkvUng4V290NGpnaUVKOWxhNHRFU2xkWi85Q0V3Y2xw?=
 =?utf-8?B?WEszU0NBcis0bTFTdXJvYkh3Nk9ZQlpTeHRyVEN2aGdGL2N3eXJWVUVYUDBT?=
 =?utf-8?B?cjAwQ3FxU01LRThRdVNxdXNONGZVQTNmZWdYSlJpNXVCalJiMlVjMGFXUm9C?=
 =?utf-8?B?ME1ZNUs1MndMZWh1S0dQTzBibHRwV0xvemRDc3FNRTZBRWhwZUFTMjhRSGRQ?=
 =?utf-8?B?S3lMcERKaFdraVd5d29tUWZqd0kyMlVMUGJLUFRES0J6bldJdEFGLzZxMWYv?=
 =?utf-8?B?ZjNubit0MytoeFBaSy85d2xrWUwwQXI2TCtBbTRSV2ZmQ2RoYXZCdTRHdUMr?=
 =?utf-8?Q?drZuuEnA18SeteJg=3D?=
X-Exchange-RoutingPolicyChecked: H1ddRNuYEjJQsDPo9cjHBr3A14ASRx3oJtHwiPek3LP72sRSj2KjK5xAoJrffq/WNdGUgfn1wUlhlrumt9TODLTo+eGUq/pcN6wrhGeDHir3uOKZ685z1RPR2diUNb5PJbD9XANwtUdJGdhvzzK789acTh3GP+W3zT/QIeu/MN80OmecFeBwpJ+Ud1jHk84OrDNBymGmIJKEO6FHje/FNYNx9e1uyqe+6CbIGW6BvA5PXvcjKFRLRFwNeV/xkuB3qJPu4YwX5aNhzNFSE9un0EQ4+OVx5eHnkZjzIPxX7MfJ0MnoW/99+pQJ2rZLGvw+ZdUHLe+3ebxYHBSNiaRzKw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8e30565-fa22-4bd5-356d-08deed860bc6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 15:28:31.5343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vcXyZjWBows/VK0S42fFhFicf+LAKXvZPsyhUWxmBC/ASnjSoAMGmT0hHDFx2T388qvdXw6lpIbUPr+u63BwR9wtpo95OjokEZ7G3v4n7Ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
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



On 7/6/2026 5:26 PM, Nemesa Garg wrote:
> In joiner mode, secondary cursor commits may still be running
> even when the primary cursor commit is done. Walking the secondary
> pipes also requires holding the secondary planes modeset locks.
> Add intel_cursor_lock_joined_planes() to acquire modeset locks
> for all secondary cursor planes. Check all joined cursor commit
> status before taking the fast path. If any commit is still pending,
> fallback to slow path.
> 
> v2: Use intel_crtc_joined_pipe_mask(). [Ville]
> v3: Lock secondary cursor CRTCs and planes. [sashiko]
> v4: Iterate the full joined mask uniformly in both helpers, no
>      primary special-case.
>      Move the parameter-change check above the lock acquisition so
>      we don't grab secondary locks just to fall to slow path. [Chaitanya]
> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_cursor.c | 69 ++++++++++++++++++---
>   1 file changed, 60 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_cursor.c b/drivers/gpu/drm/i915/display/intel_cursor.c
> index 88384dea868b..af7fc1f888c4 100644
> --- a/drivers/gpu/drm/i915/display/intel_cursor.c
> +++ b/drivers/gpu/drm/i915/display/intel_cursor.c
> @@ -13,6 +13,7 @@
>   #include <drm/drm_vblank.h>
>   
>   #include "intel_atomic.h"
> +#include "intel_crtc.h"

do we need this header here?
I think it is only needed for intel_crtc_get_vblank_counter(). Add it 
with the patch that adds the dependency.

>   #include "intel_cursor.h"
>   #include "intel_cursor_regs.h"
>   #include "intel_de.h"
> @@ -796,6 +797,50 @@ void intel_cursor_unpin_work(struct kthread_work *base)
>   	intel_plane_destroy_state(&plane->base, &plane_state->uapi);
>   }
>   
> +static int intel_cursor_lock_joined_planes(struct intel_display *display,
> +					   const struct intel_crtc_state *crtc_state,
> +					   struct drm_modeset_acquire_ctx *ctx)
> +{
> +	struct intel_crtc *pipe_crtc;
> +	int ret;
> +
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_plane *pipe_plane =
> +			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +
> +		ret = drm_modeset_lock(&pipe_crtc->base.mutex, ctx);
> +		if (ret)
> +			return ret;
> +
> +		ret = drm_modeset_lock(&pipe_plane->base.mutex, ctx);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}
> +
> +static bool
> +intel_cursor_joiner_commits_idle(struct intel_display *display,
> +				 const struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_crtc *pipe_crtc;
> +
> +	for_each_intel_crtc_in_pipe_mask(display, pipe_crtc,
> +					 intel_crtc_joined_pipe_mask(crtc_state)) {
> +		struct intel_plane *pipe_plane =
> +			intel_crtc_get_plane(pipe_crtc, PLANE_CURSOR);
> +		struct intel_plane_state *pipe_plane_state =
> +			to_intel_plane_state(pipe_plane->base.state);
> +
> +		if (pipe_plane_state->uapi.commit &&
> +		    !try_wait_for_completion(&pipe_plane_state->uapi.commit->hw_done))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
>   static int
>   intel_legacy_cursor_update(struct drm_plane *_plane,
>   			   struct drm_crtc *_crtc,
> @@ -833,15 +878,6 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	    crtc_state->joiner_pipes)
>   		goto slow;
>   
> -	/*
> -	 * Don't do an async update if there is an outstanding commit modifying
> -	 * the plane.  This prevents our async update's changes from getting
> -	 * overridden by a previous synchronous update's state.
> -	 */
> -	if (old_plane_state->uapi.commit &&
> -	    !try_wait_for_completion(&old_plane_state->uapi.commit->hw_done))
> -		goto slow;
> -
>   	/*
>   	 * If any parameters change that may affect watermarks,
>   	 * take the slowpath. Only changing fb or position should be
> @@ -855,6 +891,21 @@ intel_legacy_cursor_update(struct drm_plane *_plane,
>   	    !old_plane_state->uapi.fb != !fb)
>   		goto slow;
>   
> +	ret = intel_cursor_lock_joined_planes(display, crtc_state, ctx);
> +	if (ret == -EDEADLK)
> +		return ret;
> +	if (ret)
> +		goto slow;
> +
> +	/*
> +	 * Don't do an async update if there is an outstanding commit modifying
> +	 * any of the joined cursor planes. This prevents our async update's
> +	 * changes from getting overridden by a previous synchronous update's
> +	 * state.
> +	 */
> +	if (!intel_cursor_joiner_commits_idle(display, crtc_state))
> +		goto slow;
> +
>   	new_plane_state = to_intel_plane_state(intel_plane_duplicate_state(&plane->base));
>   	if (!new_plane_state)
>   		return -ENOMEM;

