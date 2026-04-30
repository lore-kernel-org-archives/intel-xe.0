Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9189FF886F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 05:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1F110E0D8;
	Thu, 30 Apr 2026 05:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O+eYDSIb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2491F10E0D8
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 05:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777527904; x=1809063904;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=t0H37Zv7coSKsbUOkEo410CixREtb6LdhNxz+muOKHI=;
 b=O+eYDSIbKj5X34fLjRDEizX47FAixiMbsUgYgjRZkIDvwsPd/TDGA6tY
 rO0SH/LRNNF7Fg3EV50QOtjOsqRmGfVhOXfVOtyL9iSwqR2f9AG2Lf5Lh
 TB9q4scd2q0Hkk9pHRbiWrxcnKHyeiofs+py4GmTZqmwRe40YWIraoJFN
 Qvrw24/qxdHNC+66874BF16ZH6INjgC1RfyWcUZsyKOj1xjh1XxyxQDlw
 1FaSdko19FC4pTC2NmlhwZ5hXMGm6K8MoZuLoTbBmyIDBwqWk9ij6Bk+S
 8z7isxqSKxjv1RA0wPJv+q/oh8pY+Bhtwmk6hGN3PrCLxEzmpj3Zavmri A==;
X-CSE-ConnectionGUID: 6veKoCznSyGsH0Q46mLTzw==
X-CSE-MsgGUID: 77VDIl3/Tki4MjBSRKBuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="82323583"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208,217";a="82323583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:45:04 -0700
X-CSE-ConnectionGUID: 2FgEVyxPSimwpgtbR8tSpw==
X-CSE-MsgGUID: wurWy+vdS5aXt7tgUryvDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
 d="scan'208,217";a="257810429"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:45:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:45:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:45:03 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:45:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=conw73M8/vy5PxDixJ94mgRViTuicfqF5ZUB814UbGtPIq3Zq223b5bJrBtzUOlhSS44zaaCmEYlvewcVhpQsrfUWKadTN+CABwL4ekmzCaQS5qUXJJr2PcSKcaDhmkYMAPMsIrKObKmq1/XssdlQiIdidiu+uyrqG5Jct5OkKHX8CeCeMR0+2iFLV34CnjGhXjnZfGcXC+hAESczVDX+UuN2myUoIB3GAo0ZVvegjFuf8Z1hHARqLouqHuLLOE6UNuC9Ih/tu3oz/glZ87arMvfRwDAFRNEx0Y2OixyKU0aLF1w1ksse9r+eG78ZJ3KUHEtPcrVqOFRAHiDx7LEvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ki3fRyNHDu12er7Ye9Q03RXZYAuXPbEsS7vFzAGfaLw=;
 b=Enl2InWNB3kYir4UUfZHNPAwmcuwmP9YKnnqg13l1vZUICsBuryQQIwwNWnuDeEacyr21ji+VIa7jBLLDML2J6nDo3ftT1VnyqFVr/fT1BqXuhZSieog+8pKC1VnAj29YZcFfD6TdEddbsJk67DupP1vg4n0oD8LZp3ciQXXG6ZGPKdVHYzZ1ZQoTuF9KwcRZOQ1qrmMAx6kTn1dmtCBGDBLGcR7FpnL4wrDR+O5fen59fmvce//KdUSYoAqVVHfNPe92zZ+X4BLsqNMMusePBDUsZd+gvUr8FTdAQgLkoSLz1wNL9hiNIx/WCEKnPOuly3uYgVba/j55LmSi7Numg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ5PPF33E90C8BE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 05:44:55 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 05:44:55 +0000
Content-Type: multipart/alternative;
 boundary="------------W11mNnqkka63vnlOwg5oL9nA"
Message-ID: <0147a59a-d976-4543-a2e6-ff7d33d7d1ac@intel.com>
Date: Thu, 30 Apr 2026 11:14:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] drm/xe/guc: Allow to replace xe_guc_irq_handler()
 with stub
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260428142722.582-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ5PPF33E90C8BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9b0c86-814f-4b9a-00b2-08dea67b9b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: fZ5mbbZSPDB0+z+CAJHPKeRsMkrmNKdAM7P98dr/saB/1M2X7pOeEFhoFjkYfZsHQ17VLoAu04nWEKm3C0Vp9hkb3IWVMHte6uTCtNAze2nZOrVJzRj7s8UN76EbP0D4suFj/9xFGwvzpF9F9Agk9qhxTNZ/5ur4t+sBbzrKXywjuKBOSrgUlb8jXjOcDnInW50kPl6L51LzENuCO0ohk1Qn1mMEl1BSlsYTanvP55gz2qU6MwECFNcXfsXAyNWFwWArgY5Iu11lXkFXFD5uEzIeVn+sAz6JuGxkDQxuFFb8ayRTA5siLxHl3VV9ErxFYucglaLojWSyjB/WJ9Llh4UQbKM9mzOCEz6grVia3LtZGeZBVZK33VO6SA8DsnGAPSqJ+ipsMLa8lLHCY1dIrujxGxxKTJ2U9JF2SkY3aMJB+BHZaT7rJRAGXzjR5hHl1pvnBKi8V4Z0zqAV+ZdjgVTdsAZgo4wlFBM0BVybUoYFCz828AG9oOYf02+/Mi4Ycqh4aMXMp7usMGof2TXVtj8tTdoHOQq6yMgk1zNe/ujAdczcz9x97mQ7G61L+nCd174sc9hcy3ipPZ9vCW2BoDkJLxr4k8JfmcixgB0LB7DdKQffku+7T9X9lfMytWwfPVrq8ZDxBq7SRDq9iQgmoDzcOOIuUUfxJdVDpagxgMIK5DpyBX5ECxc/+SQpPlGcor6bZWe0BC11+hTf0e5nrJ6n4fMPzOEs5wCEInoyRXg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVpRNmtGeWcrTXlacjhHNUJ1bEJac2VHZ1dvRVVKS0luTGd0Qjl4TFhUdEFO?=
 =?utf-8?B?OGlIN1ZLKzZyanRSMFQ0S0RkVkd1WStSNk1paXZlSTM0ODEvSzlYcVp3T1VR?=
 =?utf-8?B?NG94Qi9mWjJ0V1NhUHYxVUxnQ3I2dGY5U0JoSWhGVEhZekVTVGUrcCtrcHUz?=
 =?utf-8?B?c0x3Wmt5YnJGT1pIak81cG1nOC9oSWdhdDgva01Da3ZObENGR1VYd2hWYUhn?=
 =?utf-8?B?WFVNRUZYcDRXdWVLWk45T2hJTy80SzdRREk3aGRRUFg2WndWQVRxSmxoTzVU?=
 =?utf-8?B?bmRubVUwUVdSRzZJd283WW5SelloSGVjWkNEaXdLNG01WUxUc0QzQ2JHU09k?=
 =?utf-8?B?eWgzVzJnOFErWGoyNU15Nk42RVZqOVowVGczUjNuNUlFekdxeUlmbmpuRjY5?=
 =?utf-8?B?ZGxaK3pXWXBCckNIRzZPQmM3T1VycWVSbzdiZVFRdTNjNjdNYkxZVFZoRWpt?=
 =?utf-8?B?T1REMjBxOXVPSkJwQzd1T1hIMW9idHRUWnludVd6YktBTWRtWGlCaTR3OWRn?=
 =?utf-8?B?LzNYMW5hU2lrVjlkWnZDU0NCUnh5S29jQTJPZlRwZm5jZFVHQzhDZlJ0NUJa?=
 =?utf-8?B?MzFwYTN6cW92R0tmd3VXcy91Z055d1kwak1KSy85c3Qra3hpWkNwUXFhdHJW?=
 =?utf-8?B?VWNSMTVXTzBEWWRhbk1UWDYyZDdwVHcyVzNJamRXNkRQcy9VbzNWZ0NiU0Nv?=
 =?utf-8?B?OUNwZXpmVXdIaHRGdEYxRUNTWTY5b1BUbnh0UHRIWFgvL2dncHovNXAwL2o0?=
 =?utf-8?B?VDNOOExMbWhmY0hZd21FeVJnNm5qTlJZekpLUjdGVnFjSnV0b1FaYXVqSWdh?=
 =?utf-8?B?OWo0c1lhV1VwYnA2WWFjQlBvYmJiSjVuVmt5NlZWd21VQnkwMjFieU1OUFlU?=
 =?utf-8?B?OElsNXJINTkwVCs4dStDdzN2WUkweXhseUpxN0toaEY1V3cyUS9xVndFREt5?=
 =?utf-8?B?UHF4OEt4WmN3N2dFZjBNbUpyUVludjc4VDJsZVBvYUNabjdhZXExc1ZESVlL?=
 =?utf-8?B?d29BNWcxbUprc0ZqYSszVkR2UUkxUFdtOFNGZTJDU1E0b0duVDFXdXEzTDNu?=
 =?utf-8?B?NklDaVQwUDVwTUhhZVluUjZPdTdjSm9DVjFmaEZOcWxodzhQL2FEWWlWdFhM?=
 =?utf-8?B?ejRzOHRqdjFFOW1JaUhRM0o1OEZXK3drckdSVk43NjZ5ZktkQ0d6OVVGTW8y?=
 =?utf-8?B?dGtLUVhjc0ZJekFtb1ErUmpQRHBmOXZrWUN1Uy8ydEFEUHVOemwybUc3aUM5?=
 =?utf-8?B?SGRxeFBzZHpPNUtWZ3J0TW9KL042cHdaeG5rWFJMbE1wUzRsWktmUlg2QVho?=
 =?utf-8?B?aVFSVG5FeCtYNXpBTkxtUXd2aW1yRFBScm1ualZIVjE3KzJQV05pNUxMNkxn?=
 =?utf-8?B?d1VJdmdRSnJaMFdDZVBnczgzQ3FpUENYRjdYRFcySEhmOVJTMHl4ZEo4S3o1?=
 =?utf-8?B?dFE0b01kMVA4cExBSDVwaStUOENFK1l5eDF1UGxob2JBdWYyV2Q1RVB3c1dM?=
 =?utf-8?B?c2p1WUFhUkpWYmd1d3J0WmVZRFdJMmRSWGVQTTIxbDNCYis4d2ZWeU1kcGY2?=
 =?utf-8?B?Q1hYL1l1c2dtVkhpaGY1TWsvaDVmNUtCa1gwTXNERkRxZ1FCNEdVOW1VaFVi?=
 =?utf-8?B?R3VQNTcvZExOS2hBMmp6SUVjK2lmS2VreDV0K1BqbXRyZHRVSlhMK3FjZk5L?=
 =?utf-8?B?NXowTnRmdUZXdEVReU5jd09YRldIWmxUNXV2NzRyMUI0SlZCaUFlbHo0OGo0?=
 =?utf-8?B?YW1PTFBxbjFST1J5MmJtSktuTnFzWlRvenFPMytNZjBLVXJFazdmTDdUWm9M?=
 =?utf-8?B?eiszOGg4a3VuS1JkZnBTYkNGM1g5czlwamZma2pHTklHNStFN1o0QU9rQU0y?=
 =?utf-8?B?MWFhTUF0SUpoQlg4NWp4UXJsYVhFTXVScmkwSFJTMVhESWxEWGxMU2lSM2Rk?=
 =?utf-8?B?V0xZNlVCK2RCWG1OZ3pjKzVPUm00MlFOZ2NKRDNLaFh6VGZJdUhIZHY1UFp2?=
 =?utf-8?B?d3ptdXM5bVB3QUV4RWtkcTN0SGs1aWdsVzNCQTdkT2YxdjBaeDBobkFKR1dX?=
 =?utf-8?B?SVllVmhmcUwxWjh0bXF1Q0xDZUFUQmw5NXlyWkdncHk1NjRTbWhoM3R2MVRz?=
 =?utf-8?B?UUlzeGx2aFFRaE9JYVNOS2hVUVQxNmxERHpoN0dmNTFwdGkwV3N6QzRINXpj?=
 =?utf-8?B?bFRSVkRHc0hLL0RmbmE0RFEwT1FrRll0VUhGbi9HN0diTS9jaWI2RERxRzRV?=
 =?utf-8?B?VVgrZlplaExsWVphcjl6UERWQ1RNUXF2WU95ejFFWDNKNExFQ1BXN2hjSjVK?=
 =?utf-8?B?S29NVEhHQUZ5bzlwYmRDRkNSTzY1WEE3QzJhWU4wQUZUK09pcFdQSzdJM3dM?=
 =?utf-8?Q?cb72pnfHHHdPZSsU=3D?=
X-Exchange-RoutingPolicyChecked: UG3qS6Nj32a3hMEht6iUuW5ugF7ipOFl4qvH/NEH8oQ+4CR+YVPDODFVKj/uM+WZ1AJ1wICN8Sprw0con2tOHcoCSYuM0KdoEwcmEmUzLgSmKTMh8yZhxf9JLHKDBTLK9lh/MBZgkrX3MVE9PycWO0B2R77ujkifH34P5jhPpDXrkDlON6a+csizNtvOR7l7R34GW4qUwmYrN4O0iFAh3S8La7E2Ip9wd5NIPKOqMHNWE2CShRmHHtHylH/63733WvqJ4tyxpTm6UvPBUAlPB+ue+sFJLdz4/K/e4xcnXs0ESmwsH/agcUzfi3NukHg/Eg2tqgjsdkAKB0Iczszgjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9b0c86-814f-4b9a-00b2-08dea67b9b16
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:44:55.2046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9twRvPdZzW3dpvTYiRl+VMCx0MvEtiFKkHYATMuiZ1d+vaO9+SdBpyAokLwbTSY6oDKRSEhDYi7uwjX8elXejxw8y95eib9erHfala9pBks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF33E90C8BE
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

--------------W11mNnqkka63vnlOwg5oL9nA
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28-Apr-26 7:57 PM, Michal Wajdeczko wrote:
> We want to use replacement functions in upcoming kunit tests.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index e468b638271b..13228b0bd63c 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -7,6 +7,7 @@
>   
>   #include <linux/iopoll.h>
>   #include <drm/drm_managed.h>
> +#include <kunit/static_stub.h>
>   
>   #include <generated/xe_wa_oob.h>
>   
> @@ -1675,6 +1676,8 @@ static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
>   
>   void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_guc_irq_handler, guc, iir);
> +
>   	if (iir & GUC_INTR_GUC2HOST)
>   		xe_guc_ct_irq_handler(&guc->ct);
>
LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com 
<mailto:satyanarayana.k.v.p@intel.com>>

--------------W11mNnqkka63vnlOwg5oL9nA
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28-Apr-26 7:57 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260428142722.582-3-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index e468b638271b..13228b0bd63c 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -7,6 +7,7 @@
 
 #include &lt;linux/iopoll.h&gt;
 #include &lt;drm/drm_managed.h&gt;
+#include &lt;kunit/static_stub.h&gt;
 
 #include &lt;generated/xe_wa_oob.h&gt;
 
@@ -1675,6 +1676,8 @@ static void xe_guc_sw_0_irq_handler(struct xe_guc *guc)
 
 void xe_guc_irq_handler(struct xe_guc *guc, const u16 iir)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_guc_irq_handler, guc, iir);
+
 	if (iir &amp; GUC_INTR_GUC2HOST)
 		xe_guc_ct_irq_handler(&amp;guc-&gt;ct);

</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P &lt;</span><a href="mailto:satyanarayana.k.v.p@intel.com"><span style="font-family:Aptos">satyanarayana.k.v.p@intel.com</span></a><span style="font-family:Aptos">&gt;</span></p>
    <blockquote type="cite" cite="mid:20260428142722.582-3-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------W11mNnqkka63vnlOwg5oL9nA--
