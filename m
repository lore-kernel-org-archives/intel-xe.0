Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B98E7E0BB
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 10:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4610E3BC;
	Mon,  9 Feb 2026 10:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IhwIxznJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1C710E3BC
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Feb 2026 10:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632375; x=1802168375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ygagtaHNZGxQpnooa2qum4kJvIzO11mkMsTqZDASYEY=;
 b=IhwIxznJpZSPyYERM5RquHpIbq8n3xL+FFLdxkD+bRLhFWwgQY8q7XlP
 J7XWqUdmSvrlekaohiXZw59oyWWYqONvyWjSxuhTvCkib3iaaIrHU1Utj
 apqxFMeWnsTQ16u8E8UWdJmws9+7Dba1zWWGYjQhL93XrIdCLhiFQoWa2
 ak6253XGegRZj/zB58aTvizcnlTEAGp5ZGmeDd77GhirCwmAa3IFjv3x9
 o0t3Vq50bfO0np3lO5H6SaNbyXJ0MpVi3smKv3kXqFO0k3MM9m5Cr+gy6
 fntllHsbdusYj3HVtX0DZxjeRFF4L4t0KtfnojUdX6TYFLVwojdMHHQ5W Q==;
X-CSE-ConnectionGUID: 4k5mdG8xSVuKgZUG5bzrxg==
X-CSE-MsgGUID: uowPaSFDQX6qhFHLRFu6sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="59306910"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="59306910"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:19:35 -0800
X-CSE-ConnectionGUID: jn8I32DbTTuXufrILqpMFA==
X-CSE-MsgGUID: XYz0sp4zRx2GFe7NevF31w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211271593"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:19:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:19:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:19:34 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:19:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XbZ08OvuGZhqiQKpnV+d73ZZLn1NFfufCvVgvq937n1fZmJvCNnFOtiz33xKueeW80QyNyRkyfcoijb/BcGDhK6IDgjJqtCi1xGgKWyhpNovxbzHbegzJduxwQHKKjaBCGpcLmCYDtB1ggqBc4bHXgPGFDt9WzkVJhM5CfGQYysbk13R6sdscFCWk1rtz3vZAKcupzlfRpQYbheWmMvoqx3hSX1fBrm6pSn4M0G3SENEJe+DAfPAKnlJvyeSiydKpSLO9zZYK4S48u3RW6FskkEg0hl2YqlB3JNuNlmmXPYsVm5h/Ggy0DbvB6jI3nDTPDkrbBM1VCht72SB5McrYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qINZN9/gq7WSmbGpHV97Q/1HC+qWDN+Iq3ptolCcmVQ=;
 b=Cg7oy7D7vGPNRzcEXl3r2JGnqV0698ym5a8n2b5WLFnd4+/SFO3y9mC4vZmKiiiTelYyONCymPrhdQRofLICpgiqCI8iq2pBRrmoThXwZM0yIm478gOA5iG6iHWo7xgdQHXDfwvn/llhNWIjMiMOT4yPnA1OH45XMNHsU1/omZqUt6duze4ZOMp53cTKWBFk8blCE0QcRoIAc9JxO00o8nps2kc+BCwbrmP7dchnNvF9puh0s8jU5bHpj2KJZoFacXfzr8C22d9a2n8zGZneKIRCNK9xiYOvLHd41l3kuJ/BxQ3elXJ8JpHJw0RaoKgRKFM+PZUMKGR0COdjgYNY1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 10:19:32 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 10:19:32 +0000
Date: Mon, 9 Feb 2026 15:49:25 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v3 2/2] drm/xe/cri: Enable HECI CSC support
Message-ID: <aYm0rZca1-mMwNCZ@bvivekan-mob1>
References: <20260203140639.2048912-3-balasubramani.vivekanandan@intel.com>
 <20260203140639.2048912-4-balasubramani.vivekanandan@intel.com>
 <CY5PR11MB6366EAF1E964F1C3BC072EDDED9BA@CY5PR11MB6366.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CY5PR11MB6366EAF1E964F1C3BC072EDDED9BA@CY5PR11MB6366.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0140.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 5257c47e-0199-4b1b-3db9-08de67c4b79c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU0zS2VvMDh5YlNvNTFjMkFtT3pWVGgyVkZuYmc0ZkY3dmtHdFpiVHBZL2ZO?=
 =?utf-8?B?azB0Mno3eUV1NUdlQS9RSXpLZ1JRSjZ4dzBVa1R1ZWlTU2hFT00zQmlHa1dR?=
 =?utf-8?B?VjZTdENLUTFocTNPdENCWmpIUGZ6SGtVdFBvVkk1MGZvZjRNUm5uMjQ4L1JV?=
 =?utf-8?B?THBRVWltQWdtR3EzM2pkSURTbjRWR090YzNMekZaY09Ta0huMG5JbUhGYU9z?=
 =?utf-8?B?NlgrbTVzQ0RxY3JVeENOcXN6dXM3REV2VUR2N2NFMW1aQUIyUTUxM1BER05H?=
 =?utf-8?B?bHNNT01zelFoMnc0WWNxLzg2OTdtWWVTaEJJUXNsYjBCTTIrb29rVkhiM0lH?=
 =?utf-8?B?Rnp5SHZBUi9OUFpxMFNYUUwxN3dZTURDK0Z4NUxiSENBUUMyYTZhRnRtbVZ0?=
 =?utf-8?B?M3B2Qy9kNFNZek16ekw1N2VEUzV3SnNDMm0rOVJqUjVLSmFtR0VzdjlaVVJz?=
 =?utf-8?B?UkY2VHlENGV2aytzNXZJVXVMU0pnRFFkdWloR3U1NE5NVStYc2ZwMTJ4azNI?=
 =?utf-8?B?TzAxd0hDVStxeFhlakYzdDAwNzdNaC9tNkdqTEVyNGw0dWx6cFlES1RYaTlz?=
 =?utf-8?B?NC83bkF0U0NTL3JKYlVmeVpUdElKcEQ3dEFxTEFEZHB5RlNoWHBRcmwyRnpt?=
 =?utf-8?B?Mit3UzUwTFBsa3FteWxSQnVKc0ZEMVZ3bDFpbU04M2NvYmtMVlQ0L2dzc3BW?=
 =?utf-8?B?eGd0RE9iTzFJSFRud3BHOUJocFBsZkRFdXJGY1AvajZQaXMxTTFxUlJqZlN3?=
 =?utf-8?B?UEc1Q0YzSXpMOXAzZTlyWERxZWUyTHBTV3JSdmxuRFR2c2xuODhOVTh1RGRB?=
 =?utf-8?B?aFNCVmN4dkpSYTUvdUVXcytwN25iZ3hxZVk5d1FvTzRwN2FuNm9iTFV0T3Jh?=
 =?utf-8?B?S3k2M00xMzVKTkk1VFp2Qi9YcjFVLzg0N3lOMG9VQ1JYNnh6TmJJZklYNTFG?=
 =?utf-8?B?Y2RNamRzVmJ2Z1FoMmlEalpvMUJSU2R0TlZ6RWJPUUVvQTF0dENXbjZaRjNC?=
 =?utf-8?B?RGVUOTNzREgyMlAwNUxhSC9rU2l6b2dmb3VwZUlRcG5GSGpzMjlnM2hITzda?=
 =?utf-8?B?cndCaDM2RkFRNTdnWnYxRkd1L1c2TmFIMFlFWXZkRUVLLzU3WVhjSGFKSEhx?=
 =?utf-8?B?NSs5R1YwVW5ubUo0SWlMd2NqbExSWmNhMUZYU0tqNkJBY2pzMHRWbnVtdE5u?=
 =?utf-8?B?RUpvOWQzUFVWTVliZXZabkdvcXlqK3pBNE9ZT3A0OE53RndWTTcxc0dtWkNh?=
 =?utf-8?B?UWF5OW5ibDJlL1U3aXAwMXBWdWxQRjVKbVJydnMyZkJaV2paT1FvdkJWWDBS?=
 =?utf-8?B?VkwzZlU0cU5QVWtkS1ZMN1NSWkp4TGlQMDA4YlgrVWNYVXdjRFBzYUdiRXdm?=
 =?utf-8?B?K3g1a2tRMEIwUVI0cGZyYWt0dmlDdHN4aHlQQ2YrZEVVa2NaME5TbThhTzV3?=
 =?utf-8?B?ZGt4d2JVOEU2S0RVczF3SzBubzRleDc4ZUg1cmtwQXdPMGoraFFQR1IzdVhD?=
 =?utf-8?B?UFF3MGxtRjMzOG1Ra3pZTzh2K3FQZm41ODVSa2tYUE5HTE9MZXoxZFIrcFZZ?=
 =?utf-8?B?WHN5SUdKT2VDU1lzeHZpazBUaDIxaERUUSttWTdINzVpSVZNWVNaUkxMb3FD?=
 =?utf-8?B?Q1JOTzQvNGs4NC9pdDJjbktlZUNXZkgwZlZkWTI2M1hIbFJ5blltNFIzaVht?=
 =?utf-8?B?bVFWZnpWRTdDOFBObHpFT3lVWVhXOGtJdHlMSVA4blpoWHNRa0ZUdkpwbEtl?=
 =?utf-8?B?dk5lVWZJMHd4eGpYcmZVc2N2MXJaZVlzdW4zbmZaMm4raXZYTGNhMlFrWWtX?=
 =?utf-8?B?NWVUeUxIUk84a3EzMWlYUkxRTjJZbXVEckQ3UVA0ZDExenFFZGNOZDZGL0h6?=
 =?utf-8?B?RjFUeFRoVnVRSHJGaEF5Y3JhQ1lwd3dodnVybzJKZ2U3bG1oS0FTSk1DMVNP?=
 =?utf-8?B?UUNlYWZTVEJ6ekl1UTd4amVPS0xhUmxtQmpQMTNtbUNrTGNDRlE3QWN6WUx0?=
 =?utf-8?B?VVBsUHdXKzRqVGpsalFBS1pscHFGekZPZjlCeW83YmZCTkhjalhJcTJTbitD?=
 =?utf-8?B?YzZVRm9jTnRGeDFuSVgzNjJKTWEwTkd5S0YyRkFBNWFXSEJKaHFIQldsZjg4?=
 =?utf-8?Q?O8ww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3F4NEVMUldwUzRmTFAvVkpqYWdOOFNiUWoxMVViQW5BZ1dEQVpKMm5ZVGNm?=
 =?utf-8?B?dHAxN1dUSGIzbEtkeEpUSVk0aEo4V0NpN1lZRmZGV1lobTVFY3p1bE8yYzBr?=
 =?utf-8?B?VkNrZzVTdjc0dTNlOUdEckhlVDFtd2ZCSUM2bWZMYUhHWDd6ZVkrVUQycVZj?=
 =?utf-8?B?SFR0NkJBMWF3dU11enNDSTQvQkh1ZlhBQTZ5UnNVOWZzNkF3ZDNIdmNjR1J5?=
 =?utf-8?B?cWY2SVFIUi85dVZQT1NkdVJOWVRFTUNqcWJlSkkrOUFPMkN1aHpCMFhsR21t?=
 =?utf-8?B?ejZ2NldBK0d1MTRyWXhHSjNmWE5rNnd2OFVPSUtjcEU2R2s2WWFFUjk1amJu?=
 =?utf-8?B?dWVtK1psZFVQS0h2M2MzdFRubXNTbVZjYjlKNHZnUkZ3K3BWa3J3R1VIMk5a?=
 =?utf-8?B?dWZzZlN2NTFzT3ErY2luSm5XL1VQSFFhU3NDY2ZsdmNNaVZ2VU04cHhzNEN1?=
 =?utf-8?B?S0NIQ0h2MThoclhhOVFPZ2dBRjIxaEt2ekQ1UWJmdzBaS3VHckR5dHBSajVw?=
 =?utf-8?B?SDVhTXRPK3hYQlJEUEtMMGdZaUYvdUV0MkZDNDZKdEdpVExoRkx5WHpNS01u?=
 =?utf-8?B?WnhVZzl6dG5VdDJHWm9TN2RwSi8wcmZQaXVIRW9MNzc3YjlhTnhtbUkydVNX?=
 =?utf-8?B?Y1lwVGFaZTEzMDZObmdibHB6RHRmK3o3UGYzRzM4emJZV0tuSzJ3Qlk1QVI1?=
 =?utf-8?B?dDFhUVB6OW1hR2lmdUpBMTJiSVJ1THJ1OTQ1VFFxdWFiT0ZpMDB0bFU2QTZo?=
 =?utf-8?B?ZnBYelVsRDhoMW44L1IzdHFxYyswd2lLTmxjeTZOSzVEVEpxVStJNjc5UFR3?=
 =?utf-8?B?RnhHOWJ2eFlqcjhYSUFubjhoMStuQ2RqdjRtUDhBMGdWanRJQU0ycTlUOVBE?=
 =?utf-8?B?K1BObUs5bGNoZUtZVmcwNlNEV2RDUWVNRG5kNDNTZFpUM0NjclJ3NTFKdTRm?=
 =?utf-8?B?SktMdmh0cnhLRG15b1JuSjd2dmh4WGZxd25iZjIwTFlGV0pWNnAwR0NOeWpJ?=
 =?utf-8?B?eFJ4cjkvOTI0TjhLZ0ZkUzI3dWNTaEdNTGQxMUZjMjR1WlQ4Y2RXRnZmbTFh?=
 =?utf-8?B?b1JBWHRPcWpLenFWQUpVOEF1eFlpd1JWRVZDWDFTcG51VnB4S0VOM2QyL1RY?=
 =?utf-8?B?YmRQd1MzSHFFaFM5WEs0Y0d0NjluOWwwWFhpcittZW81WHNyQmFCYjZ5QTYx?=
 =?utf-8?B?MGF2eVVWL2orYnFzWkVPQlhwMmlPVjZUVjRmNDhqR3ZnVlVFY0tLTk0xR2F1?=
 =?utf-8?B?bDZ0VEFCVFNjQXM4NER4M2Q3N09YaFdZWFhCUHo1dG14MFJhNTBpcklwbXRQ?=
 =?utf-8?B?dW5raERBQjE3N1Y5dlRCR1JyYVZPckNIUTBsRHpyY3FIQmttNmZYTzk3cXNI?=
 =?utf-8?B?MnJNN2RpUFA1YWxXTFN4cVpUa01iaUEvUVUzWThBdDVJYTVKY29HUmhiVkhC?=
 =?utf-8?B?c3FqaVJJaTZWL3o3V2ZHUWJGeTRoQTIxMzlPdHl6cFVNWVFSVzErUzA2RTRP?=
 =?utf-8?B?ZmsvWjVPUURyN1VtSlduZyswU2dUeTdWQVlUTDV5ZTBROWhyWXpBTzNyeEU5?=
 =?utf-8?B?YTRqdzdKY3RIVHRrQjdLVENZV1RYZnoxT2lsTkp2Z1BxNXNreHZGN0RWbXpp?=
 =?utf-8?B?ZXFNVEJtNlZoVmFsK0UxTzJOWTJEVFhGSjZJeTV6dmJXamZYWURHUlBpenhR?=
 =?utf-8?B?dVNzTjRoVmErUVdHSHRDcVprYmxCSzYrdHB5R1ltd1Zsa2pIYm1BNVpIMXVn?=
 =?utf-8?B?Kzl0V05tSjNrWHRRT1pqTmFOc21pSVpHZXJaaGkzQVQwNnVuRlE0aFJ3Ti9h?=
 =?utf-8?B?a2w2WmpZejA4WFEwV0pPNkFPcXBTYVViOXJySVdNS0UrUFc4clZ2cWxsMy95?=
 =?utf-8?B?NWxNYThUbkd4TkE5VGgwNHZKbjU5TFZJR1p6TFNNalByUG1yd2xPSEpwMFpj?=
 =?utf-8?B?TkhuOFBtd2d6UmlldVZlUUhrTHowby80Uk1RNiszY002QXVWWTVhNC8ybURu?=
 =?utf-8?B?NW1RMHVVVmZZNWs4NG5kSk5RYy9VaXVDOFBkVTRrZUpxaVNXRkNsVmNjQUEv?=
 =?utf-8?B?dWhiTXhCRHRSWVhVb0haTnQwa20zbk1rMHFyTzUzTmVaOHlkUnpXbSswdEFz?=
 =?utf-8?B?cmh5MUhXckx1M1k5VlJGWGNJUk5Hc0JXUGVhcXhFQ1pwQ0xwNE5OY3hWQXhr?=
 =?utf-8?B?Ryt3a0p5U3VZcUVWdWxuSGF5ejkydVBBbVZYcTgrRjU1MEVLMGZEVmR4S1lt?=
 =?utf-8?B?clpUd0ttVDFxRi94c2tOL1VZR25oeTUvemZLM2ZZYytJZ1N5alZ0cEVPR01N?=
 =?utf-8?B?UFJYczRtOWU0VU5YMXp3eHYvd1l0cFBjc1hCOEJNOGNjS1hBN2ZwWWxqZlJ0?=
 =?utf-8?Q?oFjCubqAu3Wer3Om0eqkmstN3iawGs/n/HRBi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5257c47e-0199-4b1b-3db9-08de67c4b79c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 10:19:32.5838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RwyTIU5tSR67Tr5WonYETvKH0LQ3TV4R9Y8r95J78JzS072i9InoEI0yh+ui0hAbWh20JTHlzwilJHrUl6q6fSlFCkSlEXglXGzcBaGTe25vuFBwcaZx5cGUrDFBHaNH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On 03.02.2026 19:49, Usyskin, Alexander wrote:
> > Subject: [PATCH v3 2/2] drm/xe/cri: Enable HECI CSC support
> > 
> > CRI supports CSC engine as a separate PCI endpoint. Enable
> > has_heci_cscfi flag.
> > 
> 
> Explain that it is only for fallback, default configuration does not require this flag

I will send a new revision which refactors the patch and eliminates the
need for setting this flag.

Regards,
Bala

> 
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pci.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index b5e8935fff1d..23b1a10911cb 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -430,6 +430,7 @@ static const struct xe_device_desc cri_desc = {
> >  	.require_force_probe = true,
> >  	.va_bits = 57,
> >  	.vm_max_level = 4,
> > +	.has_heci_cscfi = 1,
> 
> Should be in alphabetical order
> 
> - - 
> Thanks,
> Sasha
> 
> >  };
> > 
> >  #undef PLATFORM
> > --
> > 2.43.0
> 
