Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAABBCA5FED
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 06:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91C710FE66;
	Fri,  9 Oct 2026 06:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvpadvqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A1F010FE66
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Oct 2026 06:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791526692; x=1823062692;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hiTamafWtqib7U/9XjN1xObYDRgky4XBBbYIlKqh3eM=;
 b=QvpadvqXi6iv4DRk3xXDqZz9Rwra8sov3WWOhtEJtjXuvDiZjYAJllz4
 Vu/xgqstR12hv05rMTSbwp1txgEPdMzwep3EA7s5j3aQjdb5Ji1WmkVhi
 /67yuKEVwAwAS3yNJpCvsOxUzvztTpAV+nUSi8sRQvmIcMNt/jkPt+Cbb
 2cDfGEI/chNi7+p4w6aVCBEhh/+uR2Nz2E2PNc/kBH8dRSu5SZvXxRl5G
 G2JKaR2dBzBfFuXsYSvlEcAr8e0K2veJMqxncFb8WhoDKDIjDbURbPEnQ
 o6VaqiDsPueDYIFI9VUre5TIKgFw5hzRMiYGH8EUAnauMZ/EeuEdbUcr7 g==;
X-CSE-ConnectionGUID: Up1H1YTbTjqWkWD5H4of2Q==
X-CSE-MsgGUID: f6n+iHHWSUmR8Mim/wz2QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="312707"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="312707"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:18:12 -0700
X-CSE-ConnectionGUID: djZKfdHIQ6eoyy6pPMipuQ==
X-CSE-MsgGUID: faErAb05SF2bgzsNA8IAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="311828"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 23:18:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:18:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 23:18:11 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 23:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iYL5eRC1MvQGPJboxzYKUxZ8n4Hys8FN3I8guib10wzjvwU0Uffox7i/yiTODy/DrCPbFny1RAZE6y9ysUvOpL2asq1ZlY0bQvWMIMKMZQDjcmfBJ6v7IIR50q4oykeH/wDZSleSPcnrndMUhPkSznzld7ceTjXpwOjLVBoM5AGh57S1ubNB6Izha1cgJQOOlEjVCfzD9UrcepWwcbkeDqdd4PMkxCmJlkqKaJcYKDIcKTIfH/CUiUpSheT2EX2hQ7N2Nxx4W8Mn/hKcBc19rtix3CWqeEVWfHCloSrCIvz/K0id81rpZ4wAVpLcaZ8bsuId7kWzGtK0aQ1eZuYQEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNhtvNMWUFuuCKZySDdLDbVApkqSTd9PMASTM6XjBFc=;
 b=TagE1Tc0KCW/uibLfi4dCMxy4Y2xmBvt5yZU8GNvDeM+1TlWy8pM3sBzCYs8CQW3nfzsleErYjfup5kaV693uqbKtCT7ub7prg3qRFX03nKvwT4nMrrn+tzuU3g9v3QMddTPDHgdm+0S/ox7eEMvGlcg2RZ5OLOOk+mxtSg2QNW0CxjMid7fzFQjHEXYio+o/+6dAo2b0bIrP3GYvJIIpET0fV6+PPoKuLgXb6U/72MjQOwuvPZ4b4GyhEpfuAIPcWyrzS9FecDoe75o/tCa2NaSuVFXr4RRoFAMJ0Kp/119UupRj9ww5q0TckSQJzR9eGaG6L7yLh3nMIZjQe0+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LVUPR11MB9811.namprd11.prod.outlook.com (2603:10b6:408:39c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 06:18:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 06:18:03 +0000
Message-ID: <eb666210-4696-48fa-9ed4-cc4331ff6377@intel.com>
Date: Fri, 9 Oct 2026 11:47:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] drm/xe/xe_ras: Report device memory errors using
 SIGID
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <daniele.ceraolospurio@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>
References: <20260906172604.2215987-14-badal.nilawar@intel.com>
 <20260906172604.2215987-22-badal.nilawar@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260906172604.2215987-22-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::7) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LVUPR11MB9811:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c36558d-d6d5-4241-eb0a-08df25cd130b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: JkD1HV9Ctqet41P3d899NGigVwU/A+7ffA/bF8zqDYdlH4QQYqWFTH3d9iX8DuIcRUrkyWsS4BV+JeG2tKCDEYDJG552kPGw/zm9hwVKo5FWZpwzbYyjUwCUsULJR+xydMagbFBTY0lp+5I4Z1r6NgBWQt/l5DzkOQtJjIOmJ3B/9bTQDUnwXHKUaT/fNpVK03Ih1fORG9KT6zckjqMTjqZ738rEgRsqoEYdBXnRc/TU39h6bNeReD+3x8wvdFsX7EQnv662X1XXi+foEUqNrSVZyP6PXffCYrDZkGaosks1/e8+2LiieTCaPPwqV1sx5ASXXERWn5NsX4q1b3Z9tIrCmQSdgYb9OyPHYFN0SHIxD4U0z1/fiFAG1ihrV+OTX02SFL7QmlXGGJlLAzTw7ml1sD7ASG810O5FXfPM/rt/ZdVTiBGcvG2wCPHQ2KBj/QkD06qZ/gutqTLYk/iX00lCObFrCy9oaVfowiG6WEFHXoYIjJzgkr0cytqheBk3PQWZ2Z8a/6MXI2YfWYBcA7Ac02GnCuCG25lKvTWGfw9RSGNcK2GndB1Om+QHsHW8+h3SHXbEg+TJmGw5ljHW5L2WvxN/sgEvjTeVBokwefJiiGsm8PmLXZ9QSW7STVcM5womXa9oz/6wb6NYQ0HCQzn4bupzx/g8CKhBn0Rmn+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFUZlJvU2o4MmU0TG5ZRUpTbzNNd3BLWWtBUWI4T3ducy8vODRqS0ZIajEy?=
 =?utf-8?B?ekRVQkVLM3BzeTd1WWJLSU90R0ZIRHNsYlRyNWthZEtRVEJUYkhvenJSYXhC?=
 =?utf-8?B?NTZNd2FwZWovL3ZQN3NrZ3dOQWE2Ry9YMW5PNEw4cGQrWGtVMXJya0g1UGdL?=
 =?utf-8?B?b2FPRHBFWStHVW9FeFY4L0gyM0d5STcrR0cvdVh4aWFaZmN3MXUvMWxvUHhJ?=
 =?utf-8?B?MkE5bjVWWHpkRmNMazhDWXRDd3JGeHpaampudHlycWdlbUxTOEVVT01XZm1Z?=
 =?utf-8?B?TmVzRjgrS3p5Q3VsbjlsaFEwOHRoTks0cnl6RCtCc0hnVDVBbnU3RGRnNTRW?=
 =?utf-8?B?VzhRTVRiRnIrVW5zVXpoL0FLVnF3Nll5cXhpVmpaMXF3Zi9GSDc4NEh4ZmVP?=
 =?utf-8?B?RVZPczE3QWptRXhneXB0eEh4WXI0ckxXWWJtMXBKQTdTcDdXMm95dUM5YnpZ?=
 =?utf-8?B?NG5ldVZTTFh3bHJCZGdPQmNSQnBoYUZQeFlWaFpTbm1nUVhzaVRtc1ZHZEY1?=
 =?utf-8?B?V3AxR3gxZ2VobVRkYmhDQXJMam1xRWYrY0RvZC83K3RjeEx2OUU5MWJtaDR0?=
 =?utf-8?B?QmlKeFZiWUZDZDR1cWNMY0NWV3lCWHpja1ZIN3ZsVVBnRWZrV3pqeHYvaU91?=
 =?utf-8?B?T1dZSi96U01ZZzZDak5vNm5PRW5KdE1mRnZIL1pZcjZvbEtXMkNPbWJYdXZL?=
 =?utf-8?B?SzN3Z213MFM0bm1iQkJ0SnhySUpWYWpGbERqanBScTArUU0wUHRTK3VQZll6?=
 =?utf-8?B?VUhkcnN2VGdjNXRsazJJcjlLekt6RnFhK2gzcnJ4RTVINnpxalVUemhRald3?=
 =?utf-8?B?WjluQVBFWVpZQlZ5RDgvVndoMmpKcGp2TTJnQVdxa0VyV29nMnJyLzVVdXFo?=
 =?utf-8?B?SEx1U1FZNlByWkRFcVhjU3VGZDYwRTFHUUwrbld0LzhRUWhrVS9sZnFwV2FZ?=
 =?utf-8?B?YS9RYVZDcUZ4MmpYSDY2RHpiK0N4blRJTTFuYk80VFhIajFrVTQ2RnhKbnM4?=
 =?utf-8?B?TzNJTDMzd0o4NHlzNU9oWFNTMHVwVVluZzlGUUM5d3hqeWEzdDJRQktrYTV1?=
 =?utf-8?B?K0R0N2FOQ0MrN2R5SjJMWTlwdzJ0VW5rV0E5emJsS0FCY2NhMGVoUzBRQlAx?=
 =?utf-8?B?bDhvR2pJKzZZTXFleGJxczJQRnl3QVF5TStLeCtXOTFZQlhzSHlVRGMxY2VX?=
 =?utf-8?B?K3h6SExkbmZjNENESmlrSkxFQUQveXdmdGwwWm1sMEVyMEtya0ZSWXhSYmgx?=
 =?utf-8?B?WDRod0g3MXc1Z1JaTTIyOWlIVEZwKzRJbVBLVW9NT3l5MkhZbXhJK0w4V0lB?=
 =?utf-8?B?RTJuc0JqM092ZHMrWDRGMUQwcDJpQWJIcDUxZGlaNzI1b1pkZlgvSDcrT1dM?=
 =?utf-8?B?RUQvUWIvemNzTWtxdHlsMS9manZncFIwS3dvTVdGNTBpaUlVRlRRdjdSbEFm?=
 =?utf-8?B?b1czbmhzT2FtZ3FWU3p2Ukt4cVAyS2hBQ2sxUEt1Y0V4WW1TeXVVWFkxU3hT?=
 =?utf-8?B?WER3SXowMyt0cDFZVncvTmpVTG9abkdpSUVXbWFiY3MvcStxdUxPR3B6MW8w?=
 =?utf-8?B?V3poQytmNjF6OU9EclB6NU4rdnMzN2RvYVRlQUN2d0pmTVN6UGc1TDJPdnN3?=
 =?utf-8?B?Z3I4U0JGcUR6VkFrenBJVFFDbStlWkpTVlNzTHc0UEl1VElhQTAzSXJRcHNP?=
 =?utf-8?B?dFdmc1lVQUY0c3VsRVMwNjZ4Vm4veUhIZEpmcnFvdGxCVnR2TjRIcXVjM25m?=
 =?utf-8?B?bnBxT1dkVUN3a3RDWkRTUXNYSjZCeWR6YnJnYmovbWgxSDBoSkt1UkpmQ3hH?=
 =?utf-8?B?Y05OSnlZbVQrWk5ML2dLRnp6OERPWkpoRld3ZWhlZnRneWZhRElqanZvRGhy?=
 =?utf-8?B?QmNjMzQ0MlY0K0dzT2xBL3dnMHpodmpwZEM4RDFNckNsSldRajFOTjJMMEI3?=
 =?utf-8?B?OVNNNjViT3dUaWNsVG1HUnFhRFM1cFJGS1dnQWdLbmVFTkFuM0ZLaTlhZmFX?=
 =?utf-8?B?VlJDcGNyNlJLV1ZzeEVqK2x6NlpOUnNzWUljdDd6Mk1XTStQSVBuTFhvRDhX?=
 =?utf-8?B?TXJCVitsN3pXaTdwUkQ2NW9QS2VxMEVrSW1BNnNCbzI5dHRFWE9ITEZCWkh2?=
 =?utf-8?B?Ty9IZjlKSTlPalFKNnZ5MzMyUXZpWGRycXhnYVJCT1lvOUNsTjg2OUJra0l1?=
 =?utf-8?B?Vnk0djlxa0gvbW9xT2RoODZlREdvdnc0UlBUQWw3dnhoLzdPNThEQ25Gdy9H?=
 =?utf-8?B?M3BBV3NUblpYbGVScUM3Ylk4VFlJek1NYVpsUUtRQjdVMzBzYzYvOU1hSktt?=
 =?utf-8?B?K2tVSFpsUVlYYWJaMmp0WjZydEVJeEhxRWd5UlJOaUUwMWlxUEY3dz09?=
X-Exchange-RoutingPolicyChecked: iPAqxMuDXxW9enRbizwUlJcpbJUiNjkz9b4NcaTTHGU/vY4Yxan4cRl5NA/66Ynm5vdJRpnQeqxVe9dRvy+KiKJ4SY9eGwq/GFII48QcHP6ysE6A7Xt9LXPCzlpoE6DRjh992Mf4gSUbVCC8PNY7YJnHcDS18PKiU9rJxn0P69SlH28wrpinS48pze5GF0ydmqfAP0A/uQk16Rhm0l3etBIx1PoIx+woybYjZZO2Q6M9T6o+6BMD2LcgSTyLvy5VcgsYA80k8370n8hNuPNQVh2+ybShK1Bswovjr+BeuXDO7KP4foALPv7nesUhWCJFeu2m7Myf2ms4jtaWm7JDOA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c36558d-d6d5-4241-eb0a-08df25cd130b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 06:18:03.3163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGUQY/jPtkz8mWv7eyoLl8B3i8yNPSZX2lJIVqjQuEwkZVJyGe+sYv/zSNgeUfvrEnsNa85jIFo/aXedlovQSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9811
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


On 06-09-2026 22:56, Badal Nilawar wrote:
> Use xe_log_comp_info helper to report device memory errors.
>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 288dbc0942f5..3a7f80370827 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c

I think we should convert the  general log in xe_ras_process_errors to 
sigid log otherwise we will miss the
other errors reported.

Same comment for the core-compute and soc internal errors.

Thanks
Riana

> @@ -387,14 +387,17 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	 */
>   	switch (info->category) {
>   	case XE_RAS_MEMORY_POISON:
> -		xe_info(xe, "[RAS]: Poison error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Poison error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DATA_PARITY:
> -		xe_info(xe, "[RAS]: Data parity error detected\n");
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Data parity error detected\n");
>   		break;
>   	case XE_RAS_MEMORY_DB_ECC:
> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
> -			info->sw_address);
> +		xe_log_comp_info(xe, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
> +				 "Double-bit ECC error detected at sw address 0x%llx\n",
> +				 info->sw_address);
>   		/* TODO: Add page offlining for Double-bit ECC error */
>   		fallthrough;
>   	default:
