Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88445C02199
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 23:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5251F10EBB5;
	Fri,  7 Feb 2025 23:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gy9dzHZ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8879010E350
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 23:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738972270; x=1770508270;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sbNulqfaAYkDzHBLNhiuMoRnu6TZoQnQiNkuu6pwlHg=;
 b=gy9dzHZ5uzb2YBXj5U2KM7NhaH+xBnV2p8pKDPE7DL6ZAPaKsJHe6sXW
 ZsQ87PAW5LoImurLd64eNs+Z6K3RoTCfxQrl1Tsh0SE1A9HeSpkgefhLY
 jCoOUMLjyKknG5UCYaKa39xeD9DP2itaHY4fsZ++lhcofzIigBx4JuBHy
 +RbA+PxAibzx40fCtE+6y5iIrw/xy9RIjxe8DJrdX6Lojaa9SIPFXjK4H
 hMI1W3S7tAiwD9LCvjVeDqP7qZIh8dpvg9ifPyDh6hBzAM0h+IsAOvSLY
 3mUmyRL9+eZ3TUh48WFbHSvCAwkw9LPL/xrcUaovawr2/V79Wvw2JIMlc Q==;
X-CSE-ConnectionGUID: 4UH6yxF6RRidZG2hEOXaug==
X-CSE-MsgGUID: kTPWMw9EQHK76GaC/MhQ8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="51012667"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="51012667"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 15:51:10 -0800
X-CSE-ConnectionGUID: Dd0AsLlNQ4uPHktEnyKPog==
X-CSE-MsgGUID: +SHITZsWTR6wfPanQJ8ihg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116263227"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 15:51:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 15:51:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 15:51:06 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 15:51:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCA0+HZSV7F8faApSNPNlf69kKc5TflTuOFNlaQNegjiqe8ayOtHY6rT1U4UA7CTdaqYHdq43zxzjx4tG3RI6xdXcF8RgRygEkTvYOXGgpGh3IIqu4nfKm6ajUA3ukq494Y0P9hx2PKGiKPeebqlGqA6cXCxQJtpl5QNYVbXr1NKem6g52bVC0cNR677AjhwbEFUXYVZ0b0GXsmw3oF4H0I0bFAtnMKJiCnXAgVXqaWC9l3VB2oLYT2tkXb4nGkdNJe0OpmHw9n8s0wI6FLuW47jYO8jRneOSiIP8EE/dmKVK1f6ltHQRsUZwr/QURMLMb8/PXYR+B3aWu1foyGlvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B1BW8rfkdYSSeqG4TPcL420fX32W0x9/CmWHvfr+r0=;
 b=oLWsT9qxnJzxreDN62w0C3pecUMB4OGvbWP6xHTuDup7d81iwTgedgjSyT2W0vddBbcA1jlarFovjhBorRnYkyfRWiZ84XnkMfoIosOHobG7lpZxPAlX979I0vJOcwLvVMqofIJqRrPooR6kAafhdrQDfHDNyIu8oihKD0H0yv2tfCc7BM9iNhE9jZQTLfBgSLaXHW1lFQQRqyTERpZqOEXxXFUKQ6XH3HVRL3uZG/qfQpwZw0EboIiinM06ujhm84bS3sf1SbhwY64dqjLDqHKdqWFUe3cw4TgM/DD0d7eMV8gfaVDW7fBUONqb4FsQWTVpWl1f2Q+bIrlEAVEYGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Fri, 7 Feb
 2025 23:50:58 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 23:50:58 +0000
Date: Fri, 7 Feb 2025 15:50:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v5 6/8] drm/xe: Add support for per-function engine
 activity
Message-ID: <Z6acYB7CgxNRCK4O@orsosgc001>
References: <20250206104358.3436519-1-riana.tauro@intel.com>
 <20250206104358.3436519-7-riana.tauro@intel.com>
 <b6020e99-5e20-42d7-a0f9-169ed068b983@intel.com>
 <9d7b9617-e7aa-4c24-80ad-34e81b3ebaac@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <9d7b9617-e7aa-4c24-80ad-34e81b3ebaac@intel.com>
X-ClientProxiedBy: MW4PR03CA0157.namprd03.prod.outlook.com
 (2603:10b6:303:8d::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6020:EE_
X-MS-Office365-Filtering-Correlation-Id: e1981f00-6b9e-42e2-e60e-08dd47d24524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE94Mk95Ykw4WllBb1dBNTZRQXEwZjUyRG5ubE56aTRpT2xiS3VtWERJYnZR?=
 =?utf-8?B?MU9DVDh1K2QyYzFCRmJTeUl0a0tGRXVpRnhhMCtTUUpVUzVqdU8zZ3lGZGJn?=
 =?utf-8?B?K0hDcUxDeXUyVUFackJrNlJudWRaRUlRWUx2Z0Q0K2prSjFZWk91elYvc21s?=
 =?utf-8?B?U2ZLdnNXWW0xRDJQNFlpUjBjcXhVeHFocVEwU2pTK3EwOXkwVDh3TWlEazVG?=
 =?utf-8?B?b01ib2h1UldZTmtRcWdBbnlxU3NweExXZElwT3lrYWpyMkhSNC81UDJFOWd0?=
 =?utf-8?B?bjZEemlYQzV1RkFhVEpxZWhES3RreWhhN2dEUnJMNVNnbG44MGhpblEyV0ZI?=
 =?utf-8?B?U2Faei93Q253SWxGanRRUGhUUXA5UGZJVUVaU3FWcEF3c05wSndYTzhnQlRz?=
 =?utf-8?B?akNGVitWZlRpQThUUUVjc1NTbkM5b3B4NXNMTnBTaE9sM1hZUDlwMFhRa2FX?=
 =?utf-8?B?NFlHMHJsT3RGOVBXZUIxT3dwdXpIemQ5L2pZekJhWnRycEdxeWFYVWlIdzYy?=
 =?utf-8?B?dnFIS01nd3laMmdQaTl5UnV4SFAzSEF2YXN3OTd1cEIzbFRUbHczdFUvRDM2?=
 =?utf-8?B?NWpsek9YUURsM3NhUU0vanlSVXhWSlFKc0N1SXVrbWNiaUZabHphclBHS3lX?=
 =?utf-8?B?dDZRNjhhcTBkQ1d5NWprSXdaaThwaFpnejlFMEJldHNsZlh3dGNQQUwwMVVN?=
 =?utf-8?B?Ly94WVpUSnRkNEIvaWQ2b2R0bWJwbmJ6NFpuczFuOWdEQnZKU3hSQ0JkWnpY?=
 =?utf-8?B?aGpUWjVMWHNpSkFsT2JmU29SYWc4eUllM25LMVBYWEZVNzRQdXg2S0xoVFBk?=
 =?utf-8?B?T2xPK3JNZVRzaDlQa1Iya3pETmpPZWMrUnNyWWRYcVZjbnBsTmZub2lURWJS?=
 =?utf-8?B?czI0Ym01dTRCeDljZzQ1K0RGTUJzMm5TMEVTT1VvRWVFaDZiTUZhK0ZSUVlo?=
 =?utf-8?B?SVFGUXFzOHdVOTRic29DMGppaXRRYjNLd3Jqa2kybW8vazJWUnFOR3JicHZ0?=
 =?utf-8?B?MTd5QnVuUmgrNjErTjU3U1RsdkVwYndVTHhxYWlYRXZzR0dBSkZkYWlEaW83?=
 =?utf-8?B?VnhnbVltSkhIU1dDR2F4dzcrYlBGQ1BmdGxNT2ZVQzg4d3BvcnFCTEQxQTV3?=
 =?utf-8?B?bkkveE4rN0VHRFRDTy9abVBOdWJDMWoyUEJrdC9YRkNhMzFWZHk1bDRyT042?=
 =?utf-8?B?eEZMOGtSY0FESVQ0bGtNV25aa2w3YXJJNldUcHRMN21IS3lzSTNBSnNzUjZP?=
 =?utf-8?B?UUlxTVlMVThsK2Z4ejJjcm05ckNOUVEzUmY0QTRXaXRuSFdYVFN1bVB5SFhj?=
 =?utf-8?B?UndEMXY3aTdYKzlTQjZSY3NsT2YwSzJwR3Ircmtla25ZTHBMWUNCQTdabmRw?=
 =?utf-8?B?L1FVR250SWlPRFlOTGpyNlpBd0xVRC9ORDdtRGJnRTdiWjFWSXROakh4NWxu?=
 =?utf-8?B?WFdwK1FKa0g5RnJ0b1NveWVDMExvU3FZYU16SEdYOHUrWnZsVEYyZkVpSTlQ?=
 =?utf-8?B?dVRJR3g4bGNGS2VzK1pHVzVoc2wyZWV5QVpLRmJXeEhGVUFMR0NLbDlTeGpF?=
 =?utf-8?B?dlVlNTM1S3pZVExMSXZxVGE1VGxWNW05N1pMazBoRzFkeTljaDlHRmZna1ZV?=
 =?utf-8?B?a3BUa3AramZKa1dWNmRoaE4wZTV1bkRtUnFmQksxNGsvQWNabnRuS3Q3a0R1?=
 =?utf-8?B?eTRTNExSR1FCVzQ0RjRPZTY4dnEzWnd0NnZRMSt1b3JxR2M2M1lFdVNrU0lq?=
 =?utf-8?B?cDFxS1FkZ2JqZmpqa2JKVkcvcFhFb2t6RUVYUVdTS3p6OFFUOGxWcGxPVWJy?=
 =?utf-8?B?UFhBMVFlUVNNR29iOGZvTmNITlBySDRQbU5VSkovS0svL3hJMFgwN0czSDRR?=
 =?utf-8?Q?xkprcXyWWyuuj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJMeW10U3IzWkJ1MDJub3l2b2VxcGZWeFk4a3BoZmxMV2NyQlFvd0lsazQ5?=
 =?utf-8?B?dlQ3MTl2RUNqS0g5LzhRZ012NFJ3WUdLNXRENU8rQXNmT05XUnY5dFBjMzNS?=
 =?utf-8?B?d3h6WVhSTk4zNGlDYW5nQ3NIRU1NMUZTTk5uNEFxZ0tUcy9tN042NC8wY3BV?=
 =?utf-8?B?WFRMZ1FZVnpoL0pDSktua2VGa3pVN2JjUXphWUFsa2U4WGdCQVpxek01L2F5?=
 =?utf-8?B?ayt3aS9KUDViZlZCWjNDcWs0UDArUHk0NTE5TTA4OEJMbnR1R0VKUjlWOGdx?=
 =?utf-8?B?ZS9aY1MyZXFPanI2RUpWc0RCS2s0N1h1MTdRNHpLSE5aSzJtWHdjOEVFRkIx?=
 =?utf-8?B?STlmR1lyWDRBTHpidUVlMjJkNFlUak5ka0RpcVlnUTkwY05xMHc3WDF2QkRh?=
 =?utf-8?B?MHFuVlROQi9rVlBoSk9NWDFVTUtnb2tka1MrOUUySG85eDF2R3lwOFhObDhS?=
 =?utf-8?B?K2U4djBGKzNxeHlldHFKTjZPZlViSGk0eWhsNE1aTHV1NVovd2pqVVduUnhG?=
 =?utf-8?B?ZDBiZWE0aEdsbGFFaCt2UlJYT1I0aDBPaE4wUElSUTNCNFlVS3lzQSsxY1M3?=
 =?utf-8?B?RHYwaUYycjMrdlh3M3hxSEJuYkIvYUJnWnBSYlBaeHFJWHNMODlhMUVvd3J1?=
 =?utf-8?B?TmU4M254MERTeDZPWUdoVUxiL3N3T2tzVnoxenZQUkRiU1N0NytPYnhFbXc4?=
 =?utf-8?B?TGtkOFVZNzlWd2VRTHJmMEdtMzBlbnFXMUNOUlJHQ2tMY1djZHg1WjJXeE5a?=
 =?utf-8?B?bjZkS2xDODBSWXhLZ1BaQWZvZUhJcUdWdjNsV0RnZUpGVEI2STBkZVMxUlZp?=
 =?utf-8?B?REtzUWUyZVNyL3l0VHpLNmJBVFZHdEVKVkN5eXlTSngwejk3cXQ5ZXlJcjdC?=
 =?utf-8?B?YWk4S21YUis5Qm1LZjVoalA0aDN1cGRpM3BzSEx1RVBRZnpqLzd2M0lVSUNx?=
 =?utf-8?B?aWJrV1pLWG13UTVpRk1SVEFCWHEraWpGckp6citENEVHcmlkT3NkOSsyUVM3?=
 =?utf-8?B?Q0tEOUZqMHZWVmkyYVhlQThXM0VsY0piVEE4SDBWTzduRmQ2VDl1cTlaQmNy?=
 =?utf-8?B?Q1FBeTB1dVRMWWYzWkx3cVlDWjJWYTZZdDBHNmljYWQ4T0xLZVIwZ1puclY0?=
 =?utf-8?B?UVRIUTVuVHRFeWpTSTRlb093MlRTeGZuUE9tTE5NQzJUT0xkaVpjRGg3cGJw?=
 =?utf-8?B?Y0p3SVhxOWhHNURnV05aM0xDRzJiY2lLdFZMdnBkZW9JOFZjaXh6ODJsY3Uv?=
 =?utf-8?B?aFN6YXQ1N2JkSGJ0eThtTkJzUURvZEszckZvcEJacG1NWG03ZjFzbUp1QkNj?=
 =?utf-8?B?eHhaYnlGbXpsTlFiOVNkbmhFSVVVUDFUUERkcFhXOVpxVVFtNnVMR0hwd2Va?=
 =?utf-8?B?ZFZ5WWIzYmxlNjFtcmNPdW44STVQZTBGZ29XRVhUL0NvbmFvSXVYWStWRGxR?=
 =?utf-8?B?cVE3aER2d0tSdkFQT3U0UG9lTHRHRDg0WTJONVMyY0YvZ3FleGs3bTNnaG9K?=
 =?utf-8?B?R1hFa05vd3lRMjdXSEJKZDNjR1NkWHI2a0RweWZkSWk2anFnc0duVzZORGZQ?=
 =?utf-8?B?YzI2QmxRenVJNFZUQXJMMUFQdktVMnpBVGhvbE1hSkxnYmw4blZEeGdCT0lQ?=
 =?utf-8?B?TWxLMzRXei8xb2tGVW1qR3ZQWDZMb3RYRm5wREhYYTZXdzRiYUcybW1iOHBy?=
 =?utf-8?B?VGk4UmVoM2VWbmJFK21MVTZKS0FyNmw3TDdFd1BHenFQdkFYQ0dSUEprcCto?=
 =?utf-8?B?MzFpYnQvNUFKdEJ5R09YV1RMMlJheUlyTzB4aENhUEJpUnNQZndhSnVoUWxs?=
 =?utf-8?B?ZWtKY2tUZWdJVmNiaGd3RjJXN05IK1RVcWRkRGxXbzgwM1NEWWdLQnNlL0pT?=
 =?utf-8?B?WjBHNUFwQnVQRHFYdnNDZExDaDJGSzB0cDl5VFhFMi9FV0dMaTNnV1JFWG1B?=
 =?utf-8?B?b1ZLeWF4NWt5K2RyL2hBK2M5WWhBbENJZXByVlFEbmFxYk5sL0tNYTNTK215?=
 =?utf-8?B?MFNtUWtKejVuTURzdGFOWU5hMDdKUzNycjh0a3AwRnFKb05xNGtFcm5qMm41?=
 =?utf-8?B?SVhTZEFDVm9QbEFEVGhRVVVFWFB4RVlhOG4wanh2Zk40YmMyR21LaXZ0MFpE?=
 =?utf-8?B?VG0rTlArbUx0Rk1iTCtiL0ZtLzZyVVhUWmVNSWtESUtDUkQ5VTIvL2xQUllB?=
 =?utf-8?Q?Cz/i6s+onCPUXCITsEzoJmk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1981f00-6b9e-42e2-e60e-08dd47d24524
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 23:50:58.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4sKn8qNlop9WV1MTx4VtLn7TxcVuMB7BoCI9kC1jNfcg8m1h+1RqjrLDrYES8Ti8qMCwMm3TEQKlJOVUtVZP3r/rJZxqA3WnbcLneZziNwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6020
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

On Fri, Feb 07, 2025 at 01:41:26PM +0530, Riana Tauro wrote:
>Hi Michal
>
>On 2/7/2025 12:36 AM, Michal Wajdeczko wrote:
>>
>>
>>On 06.02.2025 11:43, Riana Tauro wrote:
>>>Add support for function level engine activity stats.
>>>This is enabled when sriov_numvfs is set and disabled when vf's
>>
>>VF's
>
>will fix this
>>
>>>are disabled.
>>>
>>>v2: remove unnecessary initialization
>>>     move offset to improve code readability (Umesh)
>>>     remove global for function engine activity (Lucas)
>>>
>>>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>  drivers/gpu/drm/xe/abi/guc_actions_abi.h      |   1 +
>>>  drivers/gpu/drm/xe/xe_guc_engine_activity.c   | 208 +++++++++++++++---
>>>  drivers/gpu/drm/xe/xe_guc_engine_activity.h   |   5 +-
>>>  .../gpu/drm/xe/xe_guc_engine_activity_types.h |   8 +-
>>>  drivers/gpu/drm/xe/xe_pmu.c                   |   4 +-
>>>  5 files changed, 192 insertions(+), 34 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>index ec516e838ee8..448afb86e05c 100644
>>>--- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>+++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>>>@@ -141,6 +141,7 @@ enum xe_guc_action {
>>>  	XE_GUC_ACTION_CLIENT_SOFT_RESET = 0x5507,
>>>  	XE_GUC_ACTION_SET_ENG_UTIL_BUFF = 0x550A,
>>>  	XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER = 0x550C,
>>>+	XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER = 0x550D,
>>>  	XE_GUC_ACTION_NOTIFY_MEMORY_CAT_ERROR = 0x6000,
>>>  	XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>>  	XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.c b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>index 5d67fe38639a..0ab9112466f1 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.c
>>>@@ -15,35 +15,62 @@
>>>  #include "xe_hw_engine.h"
>>>  #include "xe_map.h"
>>>  #include "xe_mmio.h"
>>>+#include "xe_sriov_pf_helpers.h"
>>>  #include "xe_trace_guc.h"
>>>  #define TOTAL_QUANTA 0x8000
>>>-static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>+static struct iosys_map engine_activity_map(struct xe_guc *guc, struct xe_hw_engine *hwe,
>>>+					    unsigned int index)
>>>  {
>>>  	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>+	struct engine_activity_buffer *buffer;
>>>  	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>-	size_t offset = 0;
>>>+	size_t offset;
>>>+
>>>+	if (engine_activity->num_functions) {
>>>+		buffer = &engine_activity->function_buffer;
>>>+		offset = sizeof(struct guc_engine_activity_data) * index;
>>
>>maybe we should assert that index < num_functions?
>
>This function gets called from get_active_ticks and get_total_ticks
>
>is_function_valid does this check
>
>+	if (engine_activity->num_functions && fn_id >= 
>engine_activity->num_functions)
>+		return false;
>>
>>>+	} else {
>>>+		buffer = &engine_activity->device_buffer;
>>>+		offset = 0;
>>>+	}
>>>-	offset = offsetof(struct guc_engine_activity_data,
>>>+	offset += offsetof(struct guc_engine_activity_data,
>>>  			  engine_activity[guc_class][hwe->logical_instance]);
>>>  	return IOSYS_MAP_INIT_OFFSET(&buffer->activity_bo->vmap, offset);
>>>  }
>>>-static struct iosys_map engine_metadata_map(struct xe_guc *guc)
>>>+static struct iosys_map engine_metadata_map(struct xe_guc *guc,
>>>+					    unsigned int index)
>>>  {
>>>  	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>-	struct engine_activity_buffer *buffer = &engine_activity->device_buffer;
>>>+	struct engine_activity_buffer *buffer;
>>>+	size_t offset;
>>>+
>>>+	if (engine_activity->num_functions) {
>>>+		buffer = &engine_activity->function_buffer;
>>>+		offset = sizeof(struct guc_engine_activity_metadata) * index;
>>>+	} else {
>>>+		buffer = &engine_activity->device_buffer;
>>>+		offset = 0;
>>>+	}
>>>-	return buffer->metadata_bo->vmap;
>>>+	return IOSYS_MAP_INIT_OFFSET(&buffer->metadata_bo->vmap, offset);
>>>  }
>>>  static int allocate_engine_activity_group(struct xe_guc *guc)
>>>  {
>>>  	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>-	u32 num_activity_group = 1;
>>>+	struct xe_device *xe = guc_to_xe(guc);
>>>+	u32 num_activity_group;
>>>+
>>>+	/*
>>>+	 * An additional activity group is allocated for PF
>>>+	 */
>>>+	num_activity_group = IS_SRIOV_PF(xe) ? xe_sriov_pf_get_totalvfs(xe) + 1 : 1;
>>>+
>>>  	engine_activity->eag = kmalloc_array(num_activity_group,
>>>  					     sizeof(struct engine_activity_group),
>>>@@ -59,10 +86,11 @@ static int allocate_engine_activity_group(struct xe_guc *guc)
>>>  }
>>>  static int allocate_engine_activity_buffers(struct xe_guc *guc,
>>>-					    struct engine_activity_buffer *buffer)
>>>+					    struct engine_activity_buffer *buffer,
>>>+					    int count)
>>>  {
>>>-	u32 metadata_size = sizeof(struct guc_engine_activity_metadata);
>>>-	u32 size = sizeof(struct guc_engine_activity_data);
>>>+	u32 metadata_size = sizeof(struct guc_engine_activity_metadata) * count;
>>>+	u32 size = sizeof(struct guc_engine_activity_data) * count;
>>>  	struct xe_gt *gt = guc_to_gt(guc);
>>>  	struct xe_tile *tile = gt_to_tile(gt);
>>>  	struct xe_bo *bo, *metadata_bo;
>>>@@ -105,10 +133,17 @@ static bool engine_activity_supported(struct xe_guc *guc)
>>>  	return false;
>>>  }
>>>-static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe)
>>>+static void free_engine_activity_buffers(struct engine_activity_buffer *buffer)
>>>+{
>>>+	xe_bo_unpin_map_no_vm(buffer->metadata_bo);
>>>+	xe_bo_unpin_map_no_vm(buffer->activity_bo);
>>>+}
>>>+
>>>+static struct engine_activity *hw_engine_to_engine_activity(struct xe_hw_engine *hwe,
>>>+							    unsigned int index)
>>>  {
>>>  	struct xe_guc *guc = &hwe->gt->uc.guc;
>>>-	struct engine_activity_group *eag = &guc->engine_activity.eag[0];
>>>+	struct engine_activity_group *eag = &guc->engine_activity.eag[index];
>>>  	u16 guc_class = xe_engine_class_to_guc_class(hwe->class);
>>>  	return &eag->engine[guc_class][hwe->logical_instance];
>>>@@ -125,9 +160,10 @@ static u64 cpu_ns_to_guc_tsc_tick(ktime_t ns, u32 freq)
>>>  #define read_metadata_record(xe_, map_, field_) \
>>>  	xe_map_rd_field(xe_, map_, 0, struct guc_engine_activity_metadata, field_)
>>>-static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>+static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe,
>>>+				   unsigned int index)
>>>  {
>>>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
>>>  	struct guc_engine_activity *cached_activity = &ea->activity;
>>>  	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>  	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>@@ -138,8 +174,8 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>  	u64 active_ticks, gpm_ts;
>>>  	u16 change_num;
>>>-	activity_map = engine_activity_map(guc, hwe);
>>>-	metadata_map = engine_metadata_map(guc);
>>>+	activity_map = engine_activity_map(guc, hwe, index);
>>>+	metadata_map = engine_metadata_map(guc, index);
>>>  	global_change_num = read_metadata_record(xe, &metadata_map, global_change_num);
>>>  	/* GuC has not initialized activity data yet, return 0 */
>>>@@ -182,9 +218,9 @@ static u64 get_engine_active_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>  	return ea->total + ea->active;
>>>  }
>>>-static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>+static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe, unsigned int index)
>>>  {
>>>-	struct engine_activity *ea = hw_engine_to_engine_activity(hwe);
>>>+	struct engine_activity *ea = hw_engine_to_engine_activity(hwe, index);
>>>  	struct guc_engine_activity_metadata *cached_metadata = &ea->metadata;
>>>  	struct guc_engine_activity *cached_activity = &ea->activity;
>>>  	struct iosys_map activity_map, metadata_map;
>>>@@ -193,8 +229,8 @@ static u64 get_engine_total_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>>>  	u64 numerator;
>>>  	u16 quanta_ratio;
>>>-	activity_map = engine_activity_map(guc, hwe);
>>>-	metadata_map = engine_metadata_map(guc);
>>>+	activity_map = engine_activity_map(guc, hwe, index);
>>>+	metadata_map = engine_metadata_map(guc, index);
>>>  	if (!cached_metadata->guc_tsc_frequency_hz)
>>>  		cached_metadata->guc_tsc_frequency_hz = read_metadata_record(xe, &metadata_map,
>>>@@ -236,10 +272,35 @@ static int enable_engine_activity_stats(struct xe_guc *guc)
>>>  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>  }
>>>-static void engine_activity_set_cpu_ts(struct xe_guc *guc)
>>>+static int enable_function_engine_activity_stats(struct xe_guc *guc, bool enable)
>>
>>IMO it's cleaner to have separate 'disable()' function that will prepare
>>and send tailored action params
>>
>>>  {
>>>  	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>-	struct engine_activity_group *eag = &engine_activity->eag[0];
>>>+	u32 metadata_ggtt_addr = 0, ggtt_addr = 0, num_functions = 0;
>>>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>>>+	u32 action[6];
>>>+	int len = 0;
>>>+
>>>+	if (enable) {
>>>+		metadata_ggtt_addr = xe_bo_ggtt_addr(buffer->metadata_bo);
>>>+		ggtt_addr = xe_bo_ggtt_addr(buffer->activity_bo);
>>>+		num_functions = engine_activity->num_functions;
>>>+	}
>>>+
>>>+	action[len++] = XE_GUC_ACTION_SET_FUNCTION_ENGINE_ACTIVITY_BUFFER;
>>>+	action[len++] = num_functions;
>>>+	action[len++] = metadata_ggtt_addr;
>>>+	action[len++] = 0;
>>>+	action[len++] = ggtt_addr;
>>>+	action[len++] = 0;
>>>+
>>>+	/* Blocking here to ensure the buffers are ready before reading them */
>>>+	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
>>>+}
>>>+
>>>+static void engine_activity_set_cpu_ts(struct xe_guc *guc, unsigned int index)
>>>+{
>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>+	struct engine_activity_group *eag = &engine_activity->eag[index];
>>>  	int i, j;
>>>  	for (i = 0; i < GUC_MAX_ENGINE_CLASSES; i++)
>>>@@ -256,36 +317,106 @@ static u32 gpm_timestamp_shift(struct xe_gt *gt)
>>>  	return 3 - REG_FIELD_GET(RPM_CONFIG0_CTC_SHIFT_PARAMETER_MASK, reg);
>>>  }
>>>+static bool is_function_valid(struct xe_guc *guc, unsigned int fn_id)
>>>+{
>>>+	struct xe_device *xe = guc_to_xe(guc);
>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>+
>>>+	if (!IS_SRIOV_PF(xe) && fn_id)
>>>+		return false;
>>>+
>>>+	if (engine_activity->num_functions && fn_id >= engine_activity->num_functions)
>>>+		return false;
>>>+
>>>+	return true;
>>>+}
>>>+
>>>+static int engine_activity_disable_function_stats(struct xe_guc *guc, bool enable)
>>>+{
>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>>>+	int ret;
>>>+
>>>+	if (!engine_activity->num_functions)
>>>+		return 0;
>>>+
>>>+	ret = enable_function_engine_activity_stats(guc, enable);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	free_engine_activity_buffers(buffer);
>>>+	engine_activity->num_functions = 0;
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int engine_activity_enable_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>>>+{
>>>+	struct xe_guc_engine_activity *engine_activity = &guc->engine_activity;
>>>+	struct engine_activity_buffer *buffer = &engine_activity->function_buffer;
>>>+	int ret, i;
>>>+
>>>+	if (!num_vfs)
>>>+		return 0;
>>>+
>>>+	/* This includes 1 PF and num_vfs */
>>>+	engine_activity->num_functions = num_vfs + 1;
>>>+
>>>+	ret = allocate_engine_activity_buffers(guc, buffer, engine_activity->num_functions);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	ret = enable_function_engine_activity_stats(guc, enable);
>>>+	if (ret) {
>>>+		free_engine_activity_buffers(buffer);
>>>+		engine_activity->num_functions = 0;
>>>+		return ret;
>>>+	}
>>>+
>>>+	for (i = 0; i < engine_activity->num_functions; i++)
>>>+		engine_activity_set_cpu_ts(guc, i + 1);
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>  /**
>>>   * xe_guc_engine_activity_active_ticks - Get engine active ticks
>>>   * @hwe: The hw_engine object
>>>+ * @fn_id: function id to report on
>>>   *
>>>   * Return: accumulated ticks @hwe was active since engine activity stats were enabled.
>>>   */
>>>-u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe)
>>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
>>>  {
>>>  	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>  	if (!xe_guc_engine_activity_supported(guc))
>>>  		return 0;
>>>-	return get_engine_active_ticks(guc, hwe);
>>>+	if (!is_function_valid(guc, fn_id))
>>>+		return 0;
>>>+
>>>+	return get_engine_active_ticks(guc, hwe, fn_id);
>>>  }
>>>  /**
>>>   * xe_guc_engine_activity_total_ticks - Get engine total ticks
>>>   * @hwe: The hw_engine object
>>>+ * @fn_id: function id to report on
>>>   *
>>>   * Return: accumulated quanta of ticks allocated for the engine
>>>   */
>>>-u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe)
>>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id)
>>>  {
>>>  	struct xe_guc *guc =  &hwe->gt->uc.guc;
>>>  	if (!xe_guc_engine_activity_supported(guc))
>>>  		return 0;
>>>-	return get_engine_total_ticks(guc, hwe);
>>>+	if (!is_function_valid(guc, fn_id))
>>>+		return 0;
>>>+
>>>+	return get_engine_total_ticks(guc, hwe, fn_id);
>>>  }
>>>  /**
>>>@@ -303,6 +434,25 @@ bool xe_guc_engine_activity_supported(struct xe_guc *guc)
>>>  	return engine_activity->supported;
>>>  }
>>>+/**
>>>+ * xe_guc_engine_activity_function_stats - Enable/Disable per-function engine activity stats
>>>+ * @guc: The GuC object
>>>+ * @num_vfs: number of vfs
>>>+ * @enable: true to enable, false otherwise
>>>+ *
>>>+ * Return: 0 on success, negative error code otherwise
>>>+ */
>>>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable)
>>>+{
>>>+	if (!xe_guc_engine_activity_supported(guc))
>>>+		return 0;
>>>+
>>>+	if (enable)
>>>+		return engine_activity_enable_function_stats(guc, num_vfs, enable);
>>>+
>>>+	return engine_activity_disable_function_stats(guc, enable);
>>>+}
>>>+
>>>  /**
>>>   * xe_guc_engine_activity_enable_stats - Enable engine activity stats
>>>   * @guc: The GuC object
>>>@@ -320,7 +470,7 @@ void xe_guc_engine_activity_enable_stats(struct xe_guc *guc)
>>>  	if (ret)
>>>  		xe_gt_err(guc_to_gt(guc), "failed to enable activity stats%d\n", ret);
>>>  	else
>>>-		engine_activity_set_cpu_ts(guc);
>>>+		engine_activity_set_cpu_ts(guc, 0);
>>>  }
>>>  static void engine_activity_fini(void *arg)
>>>@@ -350,7 +500,7 @@ int xe_guc_engine_activity_init(struct xe_guc *guc)
>>>  		return ret;
>>>  	}
>>>-	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer);
>>>+	ret = allocate_engine_activity_buffers(guc, &engine_activity->device_buffer, 1);
>>>  	if (ret) {
>>>  		xe_gt_err(gt, "failed to allocate activity buffers%d\n", ret);
>>>  		kfree(engine_activity->eag);
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity.h b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>index 9d3ea3f67b6a..765397b959e0 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity.h
>>>@@ -14,6 +14,7 @@ struct xe_guc;
>>>  int xe_guc_engine_activity_init(struct xe_guc *guc);
>>>  bool xe_guc_engine_activity_supported(struct xe_guc *guc);
>>>  void xe_guc_engine_activity_enable_stats(struct xe_guc *guc);
>>>-u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe);
>>>-u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe);
>>>+int xe_guc_engine_activity_function_stats(struct xe_guc *guc, int num_vfs, bool enable);
>>>+u64 xe_guc_engine_activity_active_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
>>>+u64 xe_guc_engine_activity_total_ticks(struct xe_hw_engine *hwe, unsigned int fn_id);
>>>  #endif
>>>diff --git a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>index 81002c83d65e..d95ec6a74b30 100644
>>>--- a/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>+++ b/drivers/gpu/drm/xe/xe_guc_engine_activity_types.h
>>>@@ -79,14 +79,20 @@ struct xe_guc_engine_activity {
>>>  	/** @num_activity_group: number of activity groups */
>>>  	u32 num_activity_group;
>>>+	/** @num_functions: number of functions */
>>>+	u32 num_functions;
>>>+
>>>  	/** @supported: checks if engine activity is supported */
>>>  	bool supported;
>>>-	/** @eag: holds the device level engine activity data */
>>>+	/** @eag: array with entries to hold engine activity stats of global, PF and VF's */
>>>  	struct engine_activity_group *eag;
>>>  	/** @device_buffer: buffer object for global engine activity */
>>>  	struct engine_activity_buffer device_buffer;
>>
>>do we need both device ad function buffers ?
>
>If we have a single buffer, then every time num_vfs is
>set, the device buffer(XE_GUC_ACTION_SET_DEVICE_ENGINE_ACTIVITY_BUFFER 
>= 0x550C) needs to be disabled and then the function buffers need
>to be created and vice versa on disable.
>
>Would be better to have two buffers. @Umesh thoughts?

I think the native vs SRIOV flows are easier with separate buffers as 
long as we are only allocating the required buffers.

Thanks,
Umesh
>
>Thanks
>Riana
>>
>>for non-PF case (native) we can still buffer[1]
>>for PF case we will allocate buffer[1 + totalVFs]
>>and in the future
>>for PF case we will allocate buffer[1]
>>
>>>+
>>>+	/** @function_buffer: buffer object for per-function engine activity */
>>>+	struct engine_activity_buffer function_buffer;
>>>  };
>>>  #endif
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index 5b5fe4424aba..a758fc517048 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -242,9 +242,9 @@ static u64 read_engine_events(struct perf_event *event, u64 prev)
>>>  	if (!hwe)
>>>  		drm_warn(&xe->drm, "unknown pmu engine\n");
>>>  	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>>>-		val = xe_guc_engine_activity_active_ticks(hwe);
>>>+		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>>>  	else
>>>-		val = xe_guc_engine_activity_total_ticks(hwe);
>>>+		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>>>  	return val;
>>>  }
>>
>
