Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1657CD342C
	for <intel-xe@archiver.kernel.org>; Wed,  6 May 2026 08:03:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B14610ECF1;
	Wed,  6 May 2026 08:03:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUToxksA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5540010EA72
 for <intel-xe@lists.freedesktop.org>; Wed,  6 May 2026 08:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778054598; x=1809590598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xK2DZB8L+mPhBCDTb1Nu8u9Zzb9WpJEWSsZ5h7uYrbM=;
 b=DUToxksAiNbeN4uLs1P7kCFu7qACKHO6GQ7Mz3RM6vINZWyKx2doBmpp
 maYm9PDMQCHha1BYgvT9RFc2sx4Kh5qn2n1zT/HQLgx1XKIMMNqOx/K6y
 zTR0fTGVhMnDWy+7VSFgUAw1DDXp268ixHjchjGPQ3vPhc2xkGhlk7N9R
 Myc176f20fwdJ3/+NRi6u81U2ablDTLJlu/W/kuJ3R+pDO7rCE7vJ6cfZ
 6vfFxC6uTZzw1YaPTlPz3m2ktU4q1k3r4pIY3QZVguBFVy34KPyjhDSgC
 MUGcAmQY7tqBYPYrjN7YQsadlYR+Wgc1D7DTMAfQQqjbkNQJSnj+CoCEN g==;
X-CSE-ConnectionGUID: uk3QUAUYQm6LxL5iISLOlQ==
X-CSE-MsgGUID: E/3hzpU0SSmRdpDqc1dQLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="96404033"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="96404033"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:03:18 -0700
X-CSE-ConnectionGUID: mVXgMQQZTAW8pvunU3P9yw==
X-CSE-MsgGUID: +0eflEw2Qjm63qIEh6o2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="241070252"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:03:17 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:03:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:03:16 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:03:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M61SAWAGBl7Bdsvb8KJsYjFxDN/r3jjGMt+g5fPKz6iyZuSG+HhwerjHyGeTnSWAdrJoM7jQVIU9BGqkB4DGLJxlvJrbsTJNbFnGdfYbeGmj9ZfuwqmhRIiGCtbqkpZDF0kfaiJL8W1R0o9t35NaGsusfpLSlxoNOvFakiKiPRVRovwS9kRGrlpBwZJ0DN2cO0crXMaOqOUpeX8CIvGlsZxHC9bOFR5+EQEOuSDrWdFxlBMPVpTsZS4uYE25QoemJfsNvqZBrTuBsKBIoFRuppaaS7nkcUdFuWbXGzPmi/BxtKMORbsxU/m2ktmvRHeFGy2jGsym9Bz6DFPgR88rqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SB4mdXp0anfxSyWFVBD6z+WcH1EFi5WWSGrdqCHrMLc=;
 b=UR1RVGhxtmJWEAT5baBD7TBEbOd4O6NT0kB4pjTFvamJLa1vR1mqJ6Zy7flbIjpozYoqntiVs2srGNpvYDJSc7VqQsNZEA5TyXMa6A3n9y8vSP0Pu7FyVaGd3hwW+1esRoOdVpiriX1oZUCoH/sm7dUKaqv/vWMogrT3uRzuDdhDJwjc9VW69iezjjNRNfpgeGyCs/DCgPhdLTObnAGJ+IK8OjYF7dhl2z3UJGatzMSwSGkIjasU7LOJ/hV9iExYzYXhVP8O1TcKuMEMd4lTfkUFK/wUGWO9VprSBvCE+QEhh7qeK6CtQGV2InLMx/zgrT3Z3hpYE5eWj4QjE9BzNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SJ0PR11MB5919.namprd11.prod.outlook.com (2603:10b6:a03:42d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:03:13 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:03:13 +0000
Message-ID: <8c81ee71-14c1-49f2-ba7f-479ed9fabfc0@intel.com>
Date: Wed, 6 May 2026 13:33:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] drm/xe/xe_ras: Add support to get error counter in
 CRI
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260504065614.3832331-8-riana.tauro@intel.com>
 <20260504065614.3832331-10-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260504065614.3832331-10-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0245.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::7) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SJ0PR11MB5919:EE_
X-MS-Office365-Filtering-Correlation-Id: d79f0e4a-7a2e-485d-c1a2-08deab45ebe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: xo6YYM5VJmiZUUzKUSXZRIqID79J2d7CpzL/LZvATVMfEQp/m5iM6oJVacV+Z9WAIH8kGLLJiHjrbUx5pJQCLZ6sDQVl4E/XYV5pN8rLa96IA8urZM2/7mN42VFcNakXykxhjVy5KF9QbviLZ9XuN+uNBWFFN4co9IWLGRaC6nt8jzawt81f3JjkHB8xNggUx+rc9bbSgDYIWepdTxcf8xaxNxsYphN+/gMhoRARO3y0PhR7xDtzgK2bYOaB/JlfDsS0HpYJ94T4WjfwOw2OrbSjrlOpHqTARr2+UmnQHS8iK96Ks4vV9rbHMH9FR7vBZ9qmgbLgj6TlMO4wJoXsxQNoUbNDAGgSJCuJoEjGe4/EYvLHUa5cfqVAZTq6m6pUNI78QeqGJsA7gFYXEpq3o1fd3I8ooXDt/g6gNTCEVoriL3pXN6uRz7iGwauUE+w7Po6CUm57MMwd5ARFDU+AB8oCucWL2VEFG5g76/ovVi70YNm4u5VuQb/cKTZGJhyV7DjZXPPE8C2cBTQS0BjJvRLb4LDOBJJBXGp8MUpmzov4tY+gqmJkCrSaA/wEq330KUrPSSUg+21UMyc22gywtTSCGxK1RpVaMprM8FJmHXq7Pr0x1+YoakDhaJrRxksZXrB0W1mZUJ6LVHpAAzpwWaCpDtDGOSJ8J4GcmevMlkWaZiRwIUILRVJq2SHHA0ip
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGNEdkxjZElDSk9yL2lPR3F3T2wvUzdlYXd6cm9SQ0FSMzNHOWpLRlc3cnRm?=
 =?utf-8?B?d0pQY1gxa29QN1VyZzdhR0t5aXh0aUovOURDaXdjZkx3elRUUU5jc2doSlAw?=
 =?utf-8?B?NU4vcHFDcjVtR1hFMkZobllSWUNqK1M3RllqS3AyZUl3TWJ4K0l0QWtpRzRM?=
 =?utf-8?B?Q3J6eWpQNXFCWld5SjdYaW9XbTR5Z0NtSkplZzdUZWM0bUhSS2pnajlvb1pS?=
 =?utf-8?B?V3RvYXh2TndoSDRvcjZSeDZqVG5xcllnL0Z1TVkyd0pTWGY3eW5uYnh0SGFX?=
 =?utf-8?B?NTlIZVBxdUNIelBnU0UrdHEvUEV5Ymg4dmNTeFhiOGJjbDNSTGpibzZrQkhk?=
 =?utf-8?B?ZEI0QWxHRGFOdHczb3ZEaU93T080VDRBVDJMVUFONjJ5VXpSZElSeURJM1lT?=
 =?utf-8?B?bUlvK0FLMXR3cFduZk1kaEFNam0wSEM5dDRWQm40YTNHT3VjdkJqU3c4R0RO?=
 =?utf-8?B?eXVEa3lVdjYrc2R2SzBxbmRPRU13SjE5VnBYa2NId1prWnZ0VkhOc25Sb2JH?=
 =?utf-8?B?OUJZOGxUYlhlUWhMb29HMEJudkVkeFl5cU5NQzJRYk43Qy9xeW8yRlowbXR5?=
 =?utf-8?B?czBQbkRhQm1ycGFiajlZVmRTaGFHNSt2SkdkdnNKZjNMb0ZPZGpBaytQWlQ3?=
 =?utf-8?B?SjRpam5oMm4rbndadGQ4VGRMbW1UaTVrQnVvWkk3MjhtOU9MOWNjS2NKUlll?=
 =?utf-8?B?YXMyV0RKSTh0bXBrYmhUeTR3NU9YbmJWM2lOTld0QUFYK2U2UWVXT2NXOU9M?=
 =?utf-8?B?UDJMNU5PV2F1bTkxYi9FVWN0TlVUMmJkL3JNTnprajVGbWlVUkJXQ0VQbUFp?=
 =?utf-8?B?REdIdUExbzd0TDRORUdja0IrU3p6V0c4aEZEbFg1ajU1bHROUUJRMnRyY05L?=
 =?utf-8?B?dXp1VlJyb2w3bExWM3VPdW8rZTl4SnBNWTdwVFpHY2FPbFVpbDZkWjFEVFNo?=
 =?utf-8?B?Y3I0TW52VUlVNU8yVkdPNzZFc3Q5bGZKRWNwZ3lwYUZ0VlFnMG84KzdjVTB6?=
 =?utf-8?B?Smh1NmVJSmplVXJ5RU5INEdFR0txdEw4QmQ2ZHViNGtVR2x1OWd5SE9qU3J4?=
 =?utf-8?B?dU1BL1dFV1dwWjl1YkFoOUp0d3BZbWp0S0l4Vkt2NVNLODhZQmZ6dXdpYzdD?=
 =?utf-8?B?czBET2xnMGZHc0tvdjVDeUpObkJVMEFmU3I4aUVrYk5acm9oOVJBSWF5SUZj?=
 =?utf-8?B?QmlKUE4wcEc0QU9JNkRScWg1YjR3cmcyVmZMb1cxVENERHhhZ1psNUFDRFFU?=
 =?utf-8?B?ckZ0cCtEdUMyZENrKzRrWWZJejZKdSt4MkdHeWN4SHZ2MXlESXZHM1ozZmZE?=
 =?utf-8?B?UnlkaUgvandYdFptSDdJTjVWMWYxeC9keG1hMGNuYXI2cTEyajdVbGhhOVh3?=
 =?utf-8?B?ek9Lb1FTYlcyTlFBNENjdzNhTDhoVWxMdWZXVW5JMDBpMm8xemtCdzE2Wnpo?=
 =?utf-8?B?bDVTSDVDSU9uTEltckNhQXQ1aGJ0ZkJ1WFM5MnUwNWJpcTAwRmFEUHJ6cHRj?=
 =?utf-8?B?akZvMTN4TkVjWjZmYlFWdFZGR2NKRlpEbTZnR3hiTk5KUWJmZU5CUEppT3Fz?=
 =?utf-8?B?d080Um9UdUFMVkxxREVDR3FGV3B5aE1SdlR2Z0R6czRaUTZPNG1BUjk0QXdB?=
 =?utf-8?B?SUJ2M0o1N0xSUGZNTUR3Q0pCTkx0TTQ2T2VBdElac2lwWlVpdnNEVTdCeFl3?=
 =?utf-8?B?b2JZSUJEaTg4Z2Fwdm5wNGxreTV0QkNsWkRUQ1ZTcm1vYkRmWW5KSW8xWHFY?=
 =?utf-8?B?bllDTnB5QlJ4U1hVT0p5S2x1MnpGN2dmckVhVE9iQUNaYnBKQ0R1VWg0aElY?=
 =?utf-8?B?cWlWWDVZRmRkaEQxVGRjK2Q1STVuZ2t5cDViSkVPMUtqNnM4eTJQSWYrM1dK?=
 =?utf-8?B?cVZhNWl3K1ZMQ29uQTVlbjJaYUNXbmp5cUNSOUhTVUlIOFFvZnNKK095NDNC?=
 =?utf-8?B?RjdYN1Y1VE9aUk5taTc2WkJPeFhVOTJtV1BXSmVZM1grZTRPSFd1ejBrQnlG?=
 =?utf-8?B?R2tiak9MMzRFVGpQM3pEOW9KbklubUl0NHRnWDN1M0hablBIU1dJOVpYRUZk?=
 =?utf-8?B?VXRqVmN0MTdVNkFrc1duaFIwaWpRZm9nZXBwT1dPSkZNb1BwWm02WE1aY1lr?=
 =?utf-8?B?QVRIaGlwOUVYdVhVY2F1OVBIZWt0S0tpb080dE5aNUpFNFkzK3k0Si9JUjR1?=
 =?utf-8?B?RDdXU29EMUVLNzJTU0FKSGRNVEpFMGZMQkFIMERSbDBTem9oMFpKK0JwS3lI?=
 =?utf-8?B?Mkxta0VWRlFReUNxM3J0ZU1ybnBVYytjL0FoSk5iSFFpTjN6NUQvRGEwbDNs?=
 =?utf-8?B?c3VJdUo3NTRWSUVzQzhWclRaQVJmOTI0R29KekZnbzhvYWNEU0hrMlBwd2dF?=
 =?utf-8?Q?UIOqlaQNU1cqtd8s=3D?=
X-Exchange-RoutingPolicyChecked: p2oNsE4vvetits7G+DacgYjlpNQebnpKPufZsviNSrUhqknYIUijHTOARXaypTKnvu2ehP+7avTJTvfmhYFhLDoUXugjnWGH+twl+pDsmPz7+iU7AgiDHH07S2UFNq1jJ0akz655ZGcbJAw3wOjKNfA2ktlY3GcgBlk05m2KdjYaX3y9niKm5ETPqlKUQ6iMMAvHipOhv753kq+5zB7UjHEnWD8L7CQfh8qlNMdVTFdzDoUr0dqh1DnmbatiHPG3iGXjUzKlHn8y9NT+SGyoQnwmAPyZWEMEfAJUidRj9diyxrTxKrUI0c8etkX0Eq1FaKVASdkqj4z2AXhTXtIf8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d79f0e4a-7a2e-485d-c1a2-08deab45ebe3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:03:13.3756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uvu0D9Vmkd1g22AIoeM6+q/5hXksjALfXdG3Tbhxx/lFlMwkN8c8uYnPfMzKa+Vmwmsfg0n3e77U9myAaSAVjJ/sF/3DFh98INjfzpNMZeE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5919
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


On 04-05-2026 12:26 pm, Riana Tauro wrote:
> Add request/response structures and helper functions to query system
> controller to get error counter value.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: add structures for clear counter
>      move commands to sysctrl file
>      split functions
>      fix commit message (Raag)
>
> v3: fix log message
>      squash patches
>      change error code for sysctrl error (Raag)
>
> v4: rename function
>      remove unecessary macro (Raag)
>      add documentation for enum
>
> v5: rebase
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 91 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |  4 +
>   drivers/gpu/drm/xe/xe_ras_types.h             | 30 ++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |  2 +
>   4 files changed, 127 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..47a58ce3b3ca 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -4,11 +4,14 @@
>    */
>   
>   #include "xe_device.h"
> +#include "xe_pm.h"
>   #include "xe_printk.h"
>   #include "xe_ras.h"
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -50,6 +53,23 @@ static const char *const xe_ras_components[] = {
>   };
>   static_assert(ARRAY_SIZE(xe_ras_components) == XE_RAS_COMP_MAX);
>   
> +/* Mapping from drm_xe_ras_error_component to xe_ras_component */
> +static const int drm_to_xe_ras_component[] = {
> +	[DRM_XE_RAS_ERR_COMP_CORE_COMPUTE]	= XE_RAS_COMP_CORE_COMPUTE,
> +	[DRM_XE_RAS_ERR_COMP_SOC_INTERNAL]	= XE_RAS_COMP_SOC_INTERNAL,
> +	[DRM_XE_RAS_ERR_COMP_DEVICE_MEMORY]	= XE_RAS_COMP_DEVICE_MEMORY,
> +	[DRM_XE_RAS_ERR_COMP_PCIE]		= XE_RAS_COMP_PCIE,
> +	[DRM_XE_RAS_ERR_COMP_FABRIC]		= XE_RAS_COMP_FABRIC
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_component) == DRM_XE_RAS_ERR_COMP_MAX);

Inconsistent component ordering like

In UAPI:

CORE_COMPUTE(1)

Internal order:

DEVICE_MEMORY(1)
CORE_COMPUTE(2)

can you please make consistent ordering to easy to maintenance and no 
confusion.

Thanks,

-/Mallesh

> +
> +/* Mapping from drm_xe_ras_error_severity to xe_ras_severity */
> +static const int drm_to_xe_ras_severity[] = {
> +	[DRM_XE_RAS_ERR_SEV_CORRECTABLE]	= XE_RAS_SEV_CORRECTABLE,
> +	[DRM_XE_RAS_ERR_SEV_UNCORRECTABLE]	= XE_RAS_SEV_UNCORRECTABLE
> +};
> +static_assert(ARRAY_SIZE(drm_to_xe_ras_severity) == DRM_XE_RAS_ERR_SEV_MAX);
> +
>   static inline const char *sev_to_str(u8 severity)
>   {
>   	if (severity >= XE_RAS_SEV_MAX)
> @@ -66,6 +86,22 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
> +				u32 cmd, void *request, size_t request_len,
> +				void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr header = {0};
> +
> +	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd);
> +
> +	command->header = header;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -91,3 +127,58 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +static int get_counter(struct xe_device *xe, struct xe_ras_error_class *error_class,
> +		       u32 *value)
> +{
> +	struct xe_ras_get_counter_response response = {0};
> +	struct xe_ras_get_counter_request request = {0};
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	size_t rlen;
> +	int ret;
> +
> +	request.error_class = *error_class;
> +
> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_COUNTER, &request, sizeof(request),
> +			    &response, sizeof(response));
> +
> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +	if (ret) {
> +		xe_err(xe, "sysctrl: failed to get counter %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (rlen != sizeof(response)) {
> +		xe_err(xe, "sysctrl: unexpected get counter response length %zu (expected %zu)\n",
> +		       rlen, sizeof(response));
> +		return -EIO;
> +	}
> +
> +	*value = response.counter_value;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_ras_get_counter() - Get error counter value
> + * @xe: xe device instance
> + * @severity: Error severity level to be queried
> + * @error_id: Error component to be queried
> + * @value: Counter value
> + *
> + * This function retrieves the value of a specific error counter based on
> + * the error severity and component.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> +		       u32 error_id, u32 *value)
> +{
> +	struct xe_ras_error_class error_class = {0};
> +
> +	error_class.common.severity = drm_to_xe_ras_severity[severity];
> +	error_class.common.component = drm_to_xe_ras_component[error_id];
> +
> +	guard(xe_pm_runtime)(xe);
> +	return get_counter(xe, &error_class, value);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..74582c911b02 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,10 +6,14 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include <uapi/drm/xe_drm.h>
> +
>   struct xe_device;
>   struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> +int xe_ras_get_counter(struct xe_device *xe, enum drm_xe_ras_error_severity severity,
> +		       u32 error_id, u32 *value);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..74d85875cd63 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -70,4 +70,34 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_get_counter_request - Request for get error counter
> + */
> +struct xe_ras_get_counter_request {
> +	/** @error_class: Error class counter to be queried */
> +	struct xe_ras_error_class error_class;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved;
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_counter_response - Response for get error counter
> + */
> +struct xe_ras_get_counter_response {
> +	/** @error_class: Error class counter that was queried */
> +	struct xe_ras_error_class error_class;
> +	/** @counter_value: Current counter value */
> +	u32 counter_value;
> +	/** @timestamp: Timestamp when counter was last updated */
> +	u64 timestamp;
> +	/** @threshold_value: Threshold value for the counter */
> +	u32 threshold_value;
> +	/** @counter_status: Status of the counter */
> +	u32 counter_status:8;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved1: Reserved for future use */
> +	u32 reserved1[56];
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 84d7c647e743..b315847cbf64 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>   /**
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
> + * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    */
>   enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   };
>   
