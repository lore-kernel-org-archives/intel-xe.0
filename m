Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB65C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 08:54:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4796910E6D4;
	Wed, 21 May 2025 08:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4WU3RPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76A810E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747817662; x=1779353662;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RKil8gCut8zUA9NLbr8Qsh3miGidXWGHk9MdbzNr+n8=;
 b=m4WU3RPqmecH3L/lvDC68WW8x2c6cvHKuMRwQsgZeVEqWR9/lVe8L+LT
 S9EgqVpLhict1SKtZRPkBzAk3p7H7W6O51EQCe45yLSNeJR+QEZZfQqcU
 vwvaH3AsqWsH6y5/OpzPNh9+UVz6ybrbXfJuXE/+av7CFm+wxH0OTDLbv
 Cp56Apado/1Kc8+Dwq9k7sfLpV81KVQqzRauwHXNJRL2iLa7I+7zp5yqm
 Pg2YC99GiZaH3WpESGUWezYUkc5jO7LfjX3yzzhC3VSQn5F5vqndQl4Pa
 HJL+WJioyiSXEaLfzCmNpLmfAt4bhNBunHj6Ujrma8+6q9P+3i7A9XDpF g==;
X-CSE-ConnectionGUID: OKKCmYo8RWyje4i5pHcLkQ==
X-CSE-MsgGUID: 5MiyzQkpRsaSAxXGdiypjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53593119"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53593119"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:54:20 -0700
X-CSE-ConnectionGUID: /8lFr3uqS0SuF8Oa3i8jYQ==
X-CSE-MsgGUID: 1ZK3t0+1ThCGa0GL8vZ5Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140039346"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:54:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 01:54:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 01:54:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 01:54:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2gvgv61wVBn0xIFiMu5oU5lYlc6LXqIIbLnoYniLKp73q3S4UNNCMeXKK8GRE1z5k/T+5u3uyKG3JssHYfZvj0QX2h1lm5xf7z2IzwMUraalkjCfHVpqX4xpfmNU9WXouQ/g+lJc1QXe9yPtP9rFGtn2MJnk0+Ua8+7oMJ+o8UkeuSqc5qAwoQHASka3Si2pKiFjDBuHzgGKXLNZi5MbekTVbfN/DNN3+ZeZ2ew68+hSYu6hWA91qjoutCffwE6HZBrNSlDmkvYBxJLAozPxVoJSeu1WBswnF0jeiOkTlCZCivVavGdPBfWE4ckD+Qe8Gb4oAi2NOVwVMY6BZHu0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MT41OMWM7r/NPHmw6GwQhDFLYShGJINd/XbOYEJl8uM=;
 b=cL/7n3t1ctKHWRnr2XEvXAIje4WluC0OOOpKu2Or30QufHKR2ZrL6QjWitEwhib5NjNQHKO/n4vT1zUk+R2hvM3cLa6omxHDNIbKHlnt1Oq/xPYK9oIQgUzibeNMtfcYn21dT3w03/Ols9msZl3ukZxKn5+49BZJndc4avtff8Zd1Sn6COPTuoztMs89A9y0+2VsyZsKCJb3miE0rJhN87GhpZA4YGbIdCZG17k5QTFouCOUaDbfpfR+gmPyvz17Qq3BY0CB4MmtWLjy49EaP//UK0M9LYIRXJ+Hd6bSCykSuqFnQyurodjigj9s5usfNQPkEFFzZy0HVYyNcVNOfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 08:54:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 08:54:16 +0000
Message-ID: <2d3beecb-2323-4174-9898-2f15ed700248@intel.com>
Date: Wed, 21 May 2025 14:24:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/32] drm/xe/uapi: Add uapi for vma count and mem
 attributes
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-31-himal.prasad.ghimiray@intel.com>
 <aCUGXIya4wohGME5@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUGXIya4wohGME5@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::24) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ1PR11MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f79e844-428e-4379-ae48-08dd984510ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y01Nd1dJZnA4c2t0Rm1Uamk0c1hiYUtBYzRQR0NPV1o1Q29CYzdUbTBEZnRO?=
 =?utf-8?B?Q1Jvdy9DV1dWY3daS21mTGZYRDZxblc1b0xxZlF5S2YxdUlBSnNjdzBiT3FO?=
 =?utf-8?B?K3draXd1dHJXQUNUeitOaDRsNVNXaStsZFg5RzNnUlFJaW14ZGk4UFJ0bk1V?=
 =?utf-8?B?UVVrRVhtVjJuL0RpSlZ3QlBkUG13cGlHdVBOYzVnanh6bklYQW9tbVRJNW5Q?=
 =?utf-8?B?T3dxUXplTkdqOHZQeEJOTXpUWHExRmFTWHhBTlY1SFA5azRlbWg2N0gxYVJm?=
 =?utf-8?B?TE1GdnJUVjZkYkM0cGJOY3g2N1dzdTVCeWhlK00rWjJ0M1hiSUhIRnZMM0JQ?=
 =?utf-8?B?aUkzaFY5SnFCRTNMNnhSN0RSb20yQ29kR2h2ZVpyTStjY0JtUDFLdlNaSm9I?=
 =?utf-8?B?cHl1c3VyK01Fb2tWWUtoVVRLRlEzaGhuZ2RjanhMaTVvcDZOdXJuMFFDM3BU?=
 =?utf-8?B?QWdIQUZjMmszVEM3Y1dqUTVCKy9PY1ZaQWJPNzNKUWlKcGFnT3duSkJEU3M3?=
 =?utf-8?B?djNQRnRmUWVQcGI1aVlLWmlWZTJLTUJXSGxPQURLazYrdS9ORjRLUXJHZzk0?=
 =?utf-8?B?cmV0a0pXWldEVDhVYkNLbENQVmdtUnpNQ1VIVnQ3NjdRWEFXT3diZjJ6YldT?=
 =?utf-8?B?M1Fxdnl6czhGVWY3VEVPTHdjdHozNlhTRWtPTTFaUnV2VHdXS3ZJN01TQmRs?=
 =?utf-8?B?SzJSM3lvbU1OZW4vZ0ZwZGVBUmJ6cFY0WXFOaXB4UUY3UVpZNEVIN0oxY0pm?=
 =?utf-8?B?Y2dMZTczb2ptY0NpZm03dEc4b2tOMExHVXl3eWZ2Sk5PUDJsbFRYU3QzSzFh?=
 =?utf-8?B?Qm9hUnJvbC9YKzFKcEd2bkVRMGQ4MEVyUWNHQVRyNjcvSVhXNktsa0NmbnZv?=
 =?utf-8?B?b0x0Y0NOVEJMdE1KTFFMVHhpenA0Wk85bUpiSU5RMVhjNjQzOG8zdVNOcTBQ?=
 =?utf-8?B?alZHNE9WMXkvQThzTmVWMWFFVlNnQXdycE9EU2xnZVAxZzVIb1lTTmRYL1FD?=
 =?utf-8?B?SXZTM3hQSm5yeUJyTWlQMGQwdTFKa3VQbHhNb291bFg2UTFJZ0pZSHl0Y3Nn?=
 =?utf-8?B?UmllRDV5a2hKNmtGMjh2RXhvUks0V1lWYlVPSmZ5eFJFamlSZ3BkQkpNV2Jk?=
 =?utf-8?B?QmRjWEQ2bURoV0JMbFNMOTFyMDhzOTgwS3dtSU9hdVphWXY3MUQwTHBQTGY1?=
 =?utf-8?B?RnA2MHI0NlF5enFiUisvL1QrcDJXdFBuaTU1OGVTblNyTFNtUWZUUE5HZG5U?=
 =?utf-8?B?V09lVHUvS2FxQTU3SEp2OWRBSTRMeE9jc2h2RFhPYXdNVW11Y2ZocEFEU3Jj?=
 =?utf-8?B?Z3NPN1VyQUJtNzR5WDBYOSs3UWRxMmlGNllZSmtSS3l5MlcrYU83ZVVqUjBX?=
 =?utf-8?B?NGJNZ1pXWWs4ZmpPelZIUlY2dFFCZ2YzbkduNnFWREtTTmJ4VUxnS0dUTk9s?=
 =?utf-8?B?ZzNwU3RFQ1dzUENSdW8zZks5VGxlU1VFV1RqVUdyZzBtcllSZHNmOUJCZnZo?=
 =?utf-8?B?ZzcxWi8zZnpNSjJWdWtOeERYa3QvTXFuMXEzVlQ2SFVHWktUenRGVzV5Yk9K?=
 =?utf-8?B?QkMrclI5N25HTnhSM0JiQ2ttQyt2VjhjV3MwSWdwdHRrcWRSeUpGcEwxMWtq?=
 =?utf-8?B?NFYrS0JISGJJNlp1ck5GVkY3elNuZjl5ekFjOFRERFpUTWxkbGF2SEpXTUx1?=
 =?utf-8?B?Q1dQbUJ6Y0FMMkNUdTZUZkg4Tm13NGNFVWR1RmpnaDRNbmltWFRZa1o2SCtq?=
 =?utf-8?B?SDE2Um94NjRzL2dXRmdTVHhWRk1tS1R2SGsra1dtcWxkTzVzYWR4SmtPWEc3?=
 =?utf-8?B?R0Y0YXdpL2FXTHh6NGJDd3UxTEZuZ002aTBaaXFpNUhXeHM5UFYycC9vRFR3?=
 =?utf-8?B?V2tEVEliOS8xU3pUNnI3eVZNSnBqZ1E1djVYdTJkVmQwNWg2Z1I4amttNFlx?=
 =?utf-8?Q?Su4q5Cw2tOw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lpeEE0S2licFJRWHQ2L0IzN1dDL29WYWZ0YWdxL0lJOG1OZXlJTnVnVUtj?=
 =?utf-8?B?SjJNQVY3VlZ4NDZhMFpJd2xTbTFUbXlMVFRWNXRhdGUrUEFYWFc2MWVXVktK?=
 =?utf-8?B?QU1FVnp1bHJCa3pRREdkUGlPQWsvUXdKM1h6MVNVV0wreFFZTFFuRXBpUHNH?=
 =?utf-8?B?cnBtbnZWT2RGZmlHSnVQemcwcEFlamRUUFphbnlzaDQzZzhEdHdUQ21DelBl?=
 =?utf-8?B?S3czZkdWQzdjTDJpWHErQjBWdUd5bXdCcW5xRWdnSGlKY2dMQTkvZ2VLWWxS?=
 =?utf-8?B?aXhsMEVxUlE2ZU9LQWRLeHFGU3ZpUDI1OGM3V1pLMzU2NkVqZGhSSlF4cHZm?=
 =?utf-8?B?b2NHcFJwNXRoc3A2TEJZQXdKTUowZFNhZ0RKYzRwc0cxK2pPa3JhcnV4Y1Aw?=
 =?utf-8?B?VlN6YXNTVUx5cm1oV2N3eitraVpxSmh5WG1RLzlkdkxqR1R4am9SRDdJMEpK?=
 =?utf-8?B?cWs0RzAyWlJtM2RtTkpZZ3paeDdjMDhXNEFtSGRhbmdxSEUycit1SWtsVnN2?=
 =?utf-8?B?bXNsMGNEdjBxdk8vUGp5ZE1jc3F3RnoveTVRYitXa2wyL0lVemJiRUVqYTYy?=
 =?utf-8?B?ZVJaQmU3NVpSSkZOZjBvMDhJTE13T1VnUURHZWNHYUFtQlIwK3pIaitYbGJi?=
 =?utf-8?B?TWpmNlRPM3crQ2xxdzhjREt6SGJISlNESm9QS3ArUHZKeExzSGh4MzVzZEFN?=
 =?utf-8?B?RHNGNTBDRU5pbEcveE0zdEZMYWsyenBCbFRNTCs5MVlYS3lHNXhFVVVKdGpy?=
 =?utf-8?B?NTFHNWROaWZXRm5tQUd1RWdXNFUzSjR2SXpTaUM3dmxDQ0pOeUpkUlBYWHRD?=
 =?utf-8?B?NEJLZE9ydWFCUFJWN3NoMWwzcXJUaG1PUi9uV3FKUW9mOFV1ZERWOTFOcXhR?=
 =?utf-8?B?RHRhcWdkQXFTWkpTQWZJZGNtK3hYbnVtZHJKT1RLb2ttd2FheXdudTNkTW1t?=
 =?utf-8?B?bkdpZ3RaRWgwUk9qMThsZlFEVEZoWVRlSGYySW9aL3FnTTJJZDVCakNIVWhz?=
 =?utf-8?B?a3d6cDRVaTZmazN1c1Nqek5QRTlORjI3VVBoQTBSblI2NGNEUFQ4RjJxcEV2?=
 =?utf-8?B?Mlhac3ZSV1pCUDNobEV1R1Q4RXJ0UDBETGc5ZDRiREt5bi9YandWUCtpald5?=
 =?utf-8?B?V0xUTVl2Tm91bnVVT0Z1YWlzQzdObE43UGg0cjg2eVpFUHNubUQzUUJnMURv?=
 =?utf-8?B?RUx2eHlXbDRSdFhOQS9ydlpnMDJjOVgvSmdmZHNtTkE2Z2ZXUHBmVDNYdlZv?=
 =?utf-8?B?UmpGb0ZYeXZ2QnIrUGhyeFpNdGJrcHMvMEI5b0xyS3NqUzNvZHR5ek9ZZ0Rn?=
 =?utf-8?B?Rm5Cb3hGQmc0b0ttNld5Um1LYzROTDlRV1RkOE9zSmx4b0dzZGNYSmc1VkJ0?=
 =?utf-8?B?MklsS0Z1c3N0WWpGZTA4MWVmc1UzSUN5VS93QXZrd3YxcHgvYTYrbHUvbERR?=
 =?utf-8?B?NTlYMDhJNGxlL1BKMjdJcnBJcWhZOUxHditIaXVWQnpCWllEZUdTQ3oyRTk3?=
 =?utf-8?B?U3BSdWRSRmRuYmFUaERCVTNWZkxDVCs4akNvaCtNZGFrblNnQUlhNkNOMm1I?=
 =?utf-8?B?cTZrSVpDZWs4SEFTdTdzeDI1TTVLQUQ2Ry9BYTlpdFZ2OXhqUkVncmE4bWtO?=
 =?utf-8?B?RlM4c1N1SUlWVVgrN3hUNkVTMVhFTGJkNWFxeTNzSm9LVVhCdTUveXZ3cVRj?=
 =?utf-8?B?NGVjNWZKMysveTZRa1grcUlkZUZ4NDQrd21rRVJ6U0JBcnhyWGxzZUc3VTJB?=
 =?utf-8?B?QnY3dEVYd1NLN2VSVlVYUHZuNHhhc25OSXd1cC8vczh0WGYxSjZrV21lZFY5?=
 =?utf-8?B?VXZpT3JSdTVrcDhEejhZL3ZDQzFwaktZVjVmUXE4cnVEam11OFhIZjFKT2E0?=
 =?utf-8?B?UjZ4N2lMRVFaS3p4VHJLdVd6Sm9xTnZ1bzV2OUdLSW1JVlc1L2gzbWNFTDRJ?=
 =?utf-8?B?Ylo0QlpEeFg4YThEbHZzY2Z6UUZ0TWMwVGE3RHliQ2x1cFNVajlLTUhQUlZ4?=
 =?utf-8?B?MHR3NHFLYkZSSEdIa3RTTXNpdzFCTWxLT2JoMFJPZTFSaWNuUnppYkNLdDNo?=
 =?utf-8?B?dVVQZ0pDN2hTWEVCdlAwU3UrQ0dEUWlZdWpJa0hjcHV6U2luWHRJTnBYSjFq?=
 =?utf-8?B?blpRVkVzV2J2akRjbWZlZkRYOWxNWXRZYTFCNXJnelZKTUFjY3J4c2dnS0JK?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f79e844-428e-4379-ae48-08dd984510ca
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:54:16.1431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGNsURlTjnwTnXy1GIqRirfUmoKSHHOJc8qFSGtOqgBohV3UNLTi446OESaYRtoBCYVzmQvuuGW4fQ7xkMvZkqaSXmnk3Wzf01ik5gK3k4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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



On 15-05-2025 02:38, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:17PM +0530, Himal Prasad Ghimiray wrote:
>> -DRM_IOCTL_XE_VM_QUERY_VMAS: Return number of VMAs in user-specified range.
>> -DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS: Fill VMA attributes in user-provided
>>   buffer.
>>
> 
> Replied to wrong version eariler...
> 
> 
> I can't remember if we landed on if this is needed? I thought the answer
> was - no not needed.

Will hold on this, till UMD confirms whether they need it or not.

> 
> If it is needed could be make this a single IOCTL. e.g. Call in once
> with num_vmas == 0 + NULL vector, IOCTL returns num_vmas, then called
> again with num_vmas != 0 + non-NULL vector. Generally we try not burn
> IOCTL numbers, rather overload functionality.
> 
> Matt
> 
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c |   2 +
>>   drivers/gpu/drm/xe/xe_vm.c     |  94 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h     |   3 +-
>>   include/uapi/drm/xe_drm.h      | 115 +++++++++++++++++++++++++++++++++
>>   4 files changed, 213 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 3e57300014bf..968c24c77241 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -198,6 +198,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS, xe_vm_query_vmas_ioctl, DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_VMAS_ATTRS, xe_vm_query_vmas_attrs_ioctl, DRM_RENDER_ALLOW),
>>   };
>>   
>>   static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index e5246c633e62..f1d4daf90efe 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2165,6 +2165,100 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>>   	return err;
>>   }
>>   
>> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data,
>> +			   struct drm_file *file)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_vm_query_num_vmas *args = data;
>> +	struct drm_gpuva *gpuva;
>> +	struct xe_vm *vm;
>> +
>> +	vm = xe_vm_lookup(xef, args->vm_id);
>> +	if (XE_IOCTL_DBG(xe, !vm))
>> +		return -EINVAL;
>> +
>> +	args->num_vmas = 0;
>> +	down_write(&vm->lock);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, args->start, args->start + args->range)
>> +		args->num_vmas++;
>> +
>> +	up_write(&vm->lock);
>> +	return 0;
>> +}
>> +
>> +static int get_mem_attrs(struct xe_vm *vm, u32 *num_vmas, u64 start,
>> +			 u64 end, struct drm_xe_vma_mem_attr *mem_attrs)
>> +{
>> +	struct drm_gpuva *gpuva;
>> +	int i = 0;
>> +
>> +	lockdep_assert_held(&vm->lock);
>> +
>> +	drm_gpuvm_for_each_va_range(gpuva, &vm->gpuvm, start, end) {
>> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
>> +
>> +		if (i == *num_vmas)
>> +			return -EINVAL;
>> +
>> +		mem_attrs[i].start = xe_vma_start(vma);
>> +		mem_attrs[i].end = xe_vma_end(vma);
>> +		mem_attrs[i].atomic.val = vma->attr.atomic_access;
>> +		mem_attrs[i].pat_index.val = vma->attr.pat_index;
>> +		mem_attrs[i].preferred_mem_loc.devmem_fd = vma->attr.preferred_loc.devmem_fd;
>> +		mem_attrs[i].preferred_mem_loc.migration_policy = vma->attr.preferred_loc.migration_policy;
>> +
>> +		i++;
>> +	}
>> +
>> +	if (i <  (*num_vmas - 1))
>> +		*num_vmas = i;
>> +	return 0;
>> +}
>> +
>> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_vma_mem_attr *mem_attrs;
>> +	struct drm_xe_vm_query_vmas_attr *args = data;
>> +	u64 __user *attrs_user = NULL;
>> +	struct xe_vm *vm;
>> +	int err;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->num_vmas < 1))
>> +		return -EINVAL;
>> +
>> +	vm = xe_vm_lookup(xef, args->vm_id);
>> +	if (XE_IOCTL_DBG(xe, !vm))
>> +		return -EINVAL;
>> +
>> +	down_write(&vm->lock);
>> +
>> +	attrs_user = u64_to_user_ptr(args->vector_of_vma_mem_attr);
>> +	mem_attrs = kvmalloc_array(args->num_vmas, sizeof(struct drm_xe_vma_mem_attr),
>> +				   GFP_KERNEL | __GFP_ACCOUNT |
>> +				   __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
>> +	if (!mem_attrs)
>> +		return args->num_vmas > 1 ? -ENOBUFS : -ENOMEM;
>> +
>> +	err = get_mem_attrs(vm, &args->num_vmas, args->start,
>> +			    args->start + args->range, mem_attrs);
>> +	if (err)
>> +		goto free_mem_attrs;
>> +
>> +	err = __copy_to_user(attrs_user, mem_attrs,
>> +			     sizeof(struct drm_xe_vma_mem_attr) * args->num_vmas);
>> +
>> +free_mem_attrs:
>> +	kvfree(mem_attrs);
>> +
>> +	up_write(&vm->lock);
>> +
>> +	return err;
>> +}
>> +
>>   static bool vma_matches(struct xe_vma *vma, u64 page_addr)
>>   {
>>   	if (page_addr > xe_vma_end(vma) - 1 ||
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 377f62f859b7..0b2d6e9f77ef 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -193,7 +193,8 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>>   			struct drm_file *file);
>>   int xe_vm_bind_ioctl(struct drm_device *dev, void *data,
>>   		     struct drm_file *file);
>> -
>> +int xe_vm_query_vmas_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>> +int xe_vm_query_vmas_attrs_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
>>   void xe_vm_close_and_put(struct xe_vm *vm);
>>   
>>   static inline bool xe_vm_in_fault_mode(struct xe_vm *vm)
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index ab96dee25f6c..177ee3a1c20d 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -82,6 +82,8 @@ extern "C" {
>>    *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>>    *  - &DRM_IOCTL_XE_OBSERVATION
>>    *  - &DRM_IOCTL_XE_MADVISE
>> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS
>> + *  - &DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS
>>    */
>>   
>>   /*
>> @@ -104,6 +106,8 @@ extern "C" {
>>   #define DRM_XE_WAIT_USER_FENCE		0x0a
>>   #define DRM_XE_OBSERVATION		0x0b
>>   #define DRM_XE_MADVISE			0x0c
>> +#define DRM_XE_VM_QUERY_VMAS		0x0d
>> +#define DRM_XE_VM_QUERY_VMAS_ATTRS	0x0e
>>   
>>   /* Must be kept compact -- no holes */
>>   
>> @@ -120,6 +124,8 @@ extern "C" {
>>   #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>>   #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>>   #define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>> +#define DRM_IOCTL_XE_VM_QUERY_VMAS		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS, struct drm_xe_vm_query_num_vmas)
>> +#define DRM_IOCTL_XE_VM_QUERY_VMAS_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_VMAS_ATTRS, struct drm_xe_vm_query_vmas_attr)
>>   
>>   /**
>>    * DOC: Xe IOCTL Extensions
>> @@ -2063,6 +2069,115 @@ struct drm_xe_madvise {
>>   
>>   };
>>   
>> +/**
>> + * struct drm_xe_vm_query_num_vmas - Input of &DRM_IOCTL_XE_VM_QUERY_VMAS
>> + *
>> + * Get number of vmas in virtual range of vm_id
>> + */
>> +struct drm_xe_vm_query_num_vmas {
>> +	 /** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
>> +	__u32 num_vmas;
>> +
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +	 /** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>> +struct drm_xe_vma_mem_attr {
>> +	 /** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @start: start of the vma */
>> +	__u64 start;
>> +
>> +	/** @size: end of the vma */
>> +	__u64 end;
>> +
>> +	struct {
>> +		struct {
>> +		/** @val: value of atomic operation*/
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} atomic;
>> +
>> +		struct {
>> +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
>> +			__u32 val;
>> +
>> +		/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} purge_state_val;
>> +
>> +		struct {
>> +			/** @pat_index */
>> +			__u32 val;
>> +
>> +			/** @reserved: Reserved */
>> +			__u32 reserved;
>> +		} pat_index;
>> +
>> +		/** @preferred_mem_loc: preferred memory location */
>> +		struct {
>> +			__u32 devmem_fd;
>> +
>> +			__u32 migration_policy;
>> +		} preferred_mem_loc;
>> +	};
>> +
>> +	 /** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>> +/**
>> + * struct drm_xe_vm_query_vmas_attr - Input of &DRM_IOCTL_XE_VM_QUERY_MEM_ATTRIBUTES
>> + *
>> + * Get memory attributes to a virtual address range
>> + */
>> +struct drm_xe_vm_query_vmas_attr {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @vm_id: vm_id of the virtual range */
>> +	__u32 vm_id;
>> +
>> +	/** @num_vmas: number of vmas in range returned in @num_vmas */
>> +	__u32 num_vmas;
>> +
>> +	/** @start: start of the virtual address range */
>> +	__u64 start;
>> +
>> +	/** @size: size of the virtual address range */
>> +	__u64 range;
>> +
>> +	union {
>> +		/** @num_vmas: used if num_vmas == 1 */
>> +		struct drm_xe_vma_mem_attr attr;
>> +
>> +		/**
>> +		 * @vector_of_ops: userptr to array of struct
>> +		 * drm_xe_vma_mem_attr if num_vmas > 1
>> +		 */
>> +		__u64 vector_of_vma_mem_attr;
>> +	};
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +
>> +};
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
>> -- 
>> 2.34.1
>>

