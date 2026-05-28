Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBF1CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 19:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0503610F5BD;
	Thu, 28 May 2026 19:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljmBlU3V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CF410F5BD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779995948; x=1811531948;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eXarVsR6qNJaPC45f01wbyohpB8NYl+H4Dj2pd24DYs=;
 b=ljmBlU3VMhXqpZhtfqkS5/WHZEkybulHu/ZYhNZ6KU9f23Y7fW9XnQAQ
 c1/VAIVWhcD4iQpJ44NUeSdcIM93yjuW0N8csDU/xErpgBQ+0kHmwgvJC
 AVBlvtzmH3yQLgOQT4mFTfF8tjBHqRdljtfhXc8pAqDXStk67LYOmDSBE
 aQDDWTvtmagcKpWRYTtdp7fnrhZwx3NJJC8Lq9q4/+sPEK32P0CmUfO6r
 i3C6EXrtQJ6RJDlP/G8qwWzlb6n53mBqTZmeOMMZu1uxM0grzaU5npawt
 3uJwVvmG4hg/ERIFqmArh/vx0RC+jRSQnbnz/xG+B8VOa5u9HrVjs2jt/ w==;
X-CSE-ConnectionGUID: xDsieAtLQqm3STK7GfdlcQ==
X-CSE-MsgGUID: /duZU3DvSG+X1XT+Tay+xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="92321659"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="92321659"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 12:19:07 -0700
X-CSE-ConnectionGUID: TtERuaTTSxyvO5z/ZvrFUQ==
X-CSE-MsgGUID: rrhXxwiJQjugZU/kffbUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; d="scan'208";a="266522997"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 12:19:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 12:19:06 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 12:19:06 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 12:19:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6K6keqnqV8zsjlsQ8bCbm1te3C0Baqhiog0abAr94PJetrLHFhBhPMn9YqnXkiYJYzG5OQesaO1Q73Lb5JgDz4JbAzMDOqYNMm0Hyu1zuNIqrpCue0YoEfx2tgoy/ZgLHfn1SYVi9gvzYLnVENrqAJ+UKEjJYW+oczevVNEhVYp5CYh+U2C6aW0341WATQn9VJ7JFm4/l/CiZT6+X0vtVZAjSlBMC+Bn8GQDy78cLu2pu0C4IUMiYnXPP10daIrxVWksCNddjPddavEU14fK26pvbfZUXS54kCAdsxSehI1gGzxSrru/kyNM5QcazTIC+YWKkdBTQt6ogrCWox4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2/+qpLsxF/1HNYWHBO41hep0fc85KVg0FdYMB/Qf5g=;
 b=vxEovGyYNeRuTtRbqe/b/VqGKrj7BDkRsz47qqDBdcWZyVBy/Gm1Yjzz7FG7AzJP/1oChTiy6IPPVRcnmh9Crvgvg0uMbOj3CoKgLxAYTHutPP0b7Qn9ckaHw2Mmr0HNqvXYmlclDpkQhOUFXEUf7rh7lipcuVZVpbNSj0zQzeQAc7J0L22CTmrHt4eSSb1d7JTyIjPXWrzPX7xB2MCF8IcwHSEfV4g6BvyCxeyxdtPb6cv35v+tl1WiT5ZlTLGIpW+J9sxUvXQm1oHdUMyHPmcALIW2gRnWooW5DaO7hkTQT7dJ+/HXLqg5WmZ8V1yhxhMoQOFQStn3OrcAmzwRjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by IA3PR11MB8967.namprd11.prod.outlook.com (2603:10b6:208:574::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 19:18:35 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 19:18:32 +0000
Message-ID: <cf526083-efe8-4e99-98a2-7c35206c9d74@intel.com>
Date: Thu, 28 May 2026 21:18:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/guc: Reduce GuC log size from 8MB to 2MB
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-4-zhanjun.dong@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260511194924.2016315-4-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0016.eurprd08.prod.outlook.com
 (2603:10a6:803:104::29) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|IA3PR11MB8967:EE_
X-MS-Office365-Filtering-Correlation-Id: 2431a868-b95e-42d0-2e4e-08debcede857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: P1tDECL3jkG0wfu82QH7SFg72IE9G/oBHjMKMnkwe7ZxApj4xLCUf3yP6B4P2jK8dTzoOWgOOPG6DsKsdZ/9s9lQ5h8XafcN8CQgI7l1Bk8OEtHAjbuRu/mSBfHssUZMote43SVglh+jOis+TUDq9VWPJ48htDYAcas7vPis8NNwRnzUBhIJgPbaDZ/PAEIEXMgDpf0WBzQP9WQwyaYnjGtlhRHbMY5rpTjUZf2nvhYYDBdho8XbceUQn9jECvmzBToqY/G58NvzY1XgDPZu3gndFaxZN1zGcEfXgyjOv8bLaj8MmFzWR+KMMmT09nmuE0kFI8eGq5kXaaT9+kVL0cOA9wcZDHHX7AreZLJQ55Shpjfitn29Py6D12mvhgiVbgLu1r/Yar9SkjyD7wEkJbDDub2/pn/PMbR1q+ahyWuszv/B1Mkybcb07pPz6Jc2CMnU4fYxADOM6RkqSeL/nRBtfngxmKFmfBrh52wyFLsNUbPHu31gxt0VzrxPgN/sms8rF0prEF6m3DKIFVGpDckraHXhBLAYz02oEx1I788F+E+mHUE6yFc2ZuT3h2YIkqRXXyYgBD4wUmmTAy/y1s+aDCF4RyOKSN/2/2hbV9gwTFH7fKWL5SQqVC2BUHgBEgBIkLjbtNpK0+RkL1hkOByEE0umxPEVKYnX9pS6qbeVwca4YFnPXjdnypZEfXrX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Skd1Q1JTc0lwWFh1K09ybzdJWDBqVnE2NXJpRFZpeUI0RXdPSS9nNHlwWEEr?=
 =?utf-8?B?TFNwYlRTV1Q0QmplWjhXZzdtbFRsKzF5YmlrWmlxSVFsZ20zK3ZzSFFLRE1M?=
 =?utf-8?B?ZFZ1QXg3Zzg2dEs4RkRCamVDSHpabmVhQUFwN0xSWEl1VmpkQk42ck9LRkJo?=
 =?utf-8?B?ajM5UzhDOXlZV2xvZnhldk1XdXg5TjR1cjI4SHhlUFR3ODRTcTBWbGNHQlZ1?=
 =?utf-8?B?c1lPU2JFQnlGeGZDalhuSUR2UXJPYXpESE9DbHliUUt5cEdqVVQ5NHJLSEpv?=
 =?utf-8?B?WStzSTBpZ1hLcnhldHlFL011K1ZWcGlZdlhsYXhrMG1DNnhBeVkzT0JWcjN0?=
 =?utf-8?B?VnhWM1p5Nks5em5QY3h5eVRWWXNxUW5RSG9oZVNobnRtSDYwclNvczFkM1dT?=
 =?utf-8?B?UnJZUEcxR285dW5lN0wvY1pjZE56cWF5VEEvMDIwcHh1TzJta1k2UTZhVE05?=
 =?utf-8?B?cEdEL0RtSHRpQld0WStrZGRjUVRhMEZEUHZlRzJGTFB3RXJxZkdoZ0lXVGF1?=
 =?utf-8?B?M2NybnpZV3pSNVZUSThJM3J2VTE1VGx6MGZUa1lZZVp6aEdKSi9lREdndXJQ?=
 =?utf-8?B?M1hoT2lIeVBHY2JSNlJ4YXBWYTNLZEFPSzFuRko2R1Q4SkQzeTRQQjZPaVUy?=
 =?utf-8?B?dnVjLzBlMnhzeGJvVGxBeWNkVEpaYlNtT2VxaEFzMHBLQ3NFK2sySzJ5aEsr?=
 =?utf-8?B?VE83NmpPM2dpR3VpbXBaNjRzWWdGT0txbnhhSFdYUWtJSWk2OUFMWG9MZVNL?=
 =?utf-8?B?Yk9OcVhReVQxYVB0NUtNaGNGTXNxK0Zrb0V4TG1zYXl6cHEvMzBTV0Q0YnlC?=
 =?utf-8?B?VW0wTSt1V1BxTDgxdnEvMHU3U2RHTzdpWTIwOEJBVGk3eFEvbFZXMmFMN3Y3?=
 =?utf-8?B?c2xWV0M3RXhqMVkwSmZ5Y3NsOExuVVVaUDFtZFRnbHpPVHQrUTV0UnJ5eDFu?=
 =?utf-8?B?b05lcDY3d2NzeENON1BVRDU5R2lhK0xLVTJONFZSWmNhdzJ5YlpLZCtVbm9x?=
 =?utf-8?B?WnNYTkczN1ovY05tRHpsQUZNdGh4eGtPRUhTY3lvZkozVURsMzlaUTN1MkZ4?=
 =?utf-8?B?TDBGaDBEVXdGSU9aRmJ0dTJqQm5ZakZBdTN3L0w0YTFGVk4wdEFvUnJsS2to?=
 =?utf-8?B?ZnZxMldiREN1VjJ5UGtEY1N5cnJMZWRkMnFJQ3AxR2FmVzFvTHZTYWpUMVZB?=
 =?utf-8?B?RGl2bVBRbHZIU3U5Q09OcW1hdkdMSGpncW1xajNxTSt4UFJBcEpRbW9aaWpj?=
 =?utf-8?B?ckhjYmRmV3RaMzJZRG1LaWt6QVpFUEJxdjZtSzRkVlJtSFZEckpjazU5SWxx?=
 =?utf-8?B?UndOajh3TGZLRU9aN29vYll6VHgxOEY5ZFdMUWxLNmkwQk15RHdpbU1jVWFY?=
 =?utf-8?B?OERkWWxFd3FzU2Z2NThleFFIYytnVlpMdWJKQjh0SVhVR3VDTlNoU0pOUGFI?=
 =?utf-8?B?WGFhSjRGMWZ5VElGd0lpVkhabU5tZ24reCtVMlliSkVVNGNmalJPcHU3U0pP?=
 =?utf-8?B?eFdvbkQ5N1pScHZpQWtSMC9iaHNuc1Q4VjAzS01kZ3Rka3hBbVIrK3JoNE1K?=
 =?utf-8?B?bmMxc3hMQ0wwbDNQQy9qMG5WOFBrRmVlMnMxc2xhaVN1YXdDNFVnSXA5SGls?=
 =?utf-8?B?Y0dTazJZZkR2VGRSRkF1d1hHNkVSZWZNckFlSkhTMG1vb0FKdCt3MXBXMU1E?=
 =?utf-8?B?dnRYRFRYa21ERkpZYzh3eVMvWXgyVGJ1c242VzJtc3QvVU9rcTU3cU1KeWdS?=
 =?utf-8?B?RVRkS0dLdVRTOTQzOTN5NEcyeXI0T08wZ2k1akdzdmZtN3FEbllFVVozdThw?=
 =?utf-8?B?b0JxNVNrMTN0UmlkSTQycm5CQjJiQ3VFbitobFVQRWtWV25HbXdRdTE2WjNH?=
 =?utf-8?B?dGE3Y0o1SklHSlFzZVJYVGVLNGpueW9WQkpOR3U5eUtsOUtYTE9UTU5wWEhl?=
 =?utf-8?B?NWRsSUZsNHdCb3pqS25CY3drR0R3TVFjSU5kOHlGc0g2S0JTR1htMG1FdVRC?=
 =?utf-8?B?R21ieHFLNk5KcUVOdzFUSDdlMU50bUJndnRxUHVxYWZXeUhIdkhUREtXVHcr?=
 =?utf-8?B?V3QrTXhEU2VTRHhLY28rdVhJeisyRUZUQTdZVlRpSkpmVjFwdGRmMDFHYTNY?=
 =?utf-8?B?UWJHK2RneWZXbVhRTFdndkZhZEZaaUNPSWo3VStrUHJOaTZrcmxrTXhmNmxm?=
 =?utf-8?B?THdWb1pyZzhjL1AvVzJzVjRtalA2MTRoZnA1c1V2V1UrUmZYRXFRUU1jUFdB?=
 =?utf-8?B?MVFScDNXMTFFTXBsdHhhREE1b2xmVXJIM2dRY1lJSWw4Q2VMK2dhQ2pCeFBa?=
 =?utf-8?B?WW1UMTNHbkdtU1VRaTNMcnVjVWRJLzZ5K0gwWnBiMGhSclhtQ3loODFvZXRu?=
 =?utf-8?Q?aCE684+z/iMZIydM=3D?=
X-Exchange-RoutingPolicyChecked: MCZU3QwnvDDWO9rDOu8kTDfHEZyjudz620xvIe9SknjENca+tCnf/RQiO+A5hz8jN0kITLoXKUcoskxviSj7rQxDUFEeC9tWW3iSBLO7nVs5Ig9qKSXQoNg8Ct/FtShGGSLXjKCTiTfzVqpxS9j5bZ9pHaj9T+knOt5wmciTkoFzBLDUrH3IbZ4+lubRxbv3c1xljHrtUage2pCRBXoB/icoTC/dgTJMtB71nRyP7twFz0hM9uG4Syw1zo2qZ8DrEmcmPl/ffH3UtXRHOIxGoIW8Tt6CjpgFiis4sveeTOOHKTY29WvV1LigqPH0JDot3EUErz+4j8/b+dujhQBK1g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2431a868-b95e-42d0-2e4e-08debcede857
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 19:18:32.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSjEMR3cSh22C4o/KBosCr3j22JTWjwptPekJmd6Me50L0WHc9qwovjE4Wr/1O4ukVT8QY6WvOQlFFULhqGe9e3x0WCVSFNRsAnSmxqIAyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8967
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



On 5/11/2026 9:49 PM, Zhanjun Dong wrote:
> Reduce the default log buffer size to improve system responsiveness and

default log size is SZ_64K and is not changed by this patch

> readability. The previous 8MB threshold caused significant delays during

8MB size was used in CONFIG_DRM_XE_DEBUG

> log output and imposed a heavy load when printing to dmesg.

hmm, but that was on purpose, as any extra cost caused by such dump, which
should be sporadic anyway, we were willing to take just to be sure to do not
lost any information from the too small log

> 
> By reducing the size to 2MB, we maintain a sufficient history while
> ensuring faster flushing. With a typical 4:1 compression ratio, this 2MB
> buffer will result in approximately 512KB of compressed data, providing an
> efficient balance between log depth and system performance.

hmm, such dumps should be very sporadic, already after HW/FW being broken

so what do you mean by the 'system performance' here?

and maybe it would be sufficient just to introduce compression without
reducing the log size?

> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_log.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index d231def50692..44e81a54681f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -17,7 +17,7 @@ struct xe_device;
>  #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>  #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_2M
>  #elif IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> -#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_8M
> +#define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_2M
>  #define XE_GUC_LOG_CRASH_DUMP_BUFFER_SIZE	SZ_1M
>  #define XE_GUC_LOG_STATE_CAPTURE_BUFFER_SIZE	SZ_1M
>  #else

