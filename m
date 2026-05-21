Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD79ACD5BAF
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 23:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9382910E044;
	Thu, 21 May 2026 23:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HMdthxBC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6A710E044
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 23:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779405299; x=1810941299;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JE5kh1fGDxfkp7I2pOZ23Fujycg8SM16GTGdLPfZFwM=;
 b=HMdthxBCusVVBWKp8tlOn3EDR+N563BYU/OVG+DAZw7pffoeyVuepN0i
 59OEYmKQo6T+pRVVoIXgZXe7qwroy4YJCgSTNmWGnLDhAt8NiDe4OkJRD
 ihG+NmV5DnS0PwLVaRjiUA7Ab8syraSgqe4x4oZQHoQZfMbj8PnEm4hl4
 drl4eqhQAFYJYFIxneA//qfYY/nA2nsWPbdBNCWvjjvJHLQk2zkn6CRFo
 C8F6TVdBelZkav+azwxHAASQbfvEKRTJ/xlGfg9ZcoB8CMUi+70dNcyeY
 WuHNQ39sVg8jU3cyor+3f0bUPfHV0/JoC7N62/tRIF7NJ/p0xYOHHUeCw w==;
X-CSE-ConnectionGUID: 28Zdw7TaR6q9HwpImpLUVA==
X-CSE-MsgGUID: h+/S9kaZQAut58TMT0KmUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80064090"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="80064090"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 16:14:58 -0700
X-CSE-ConnectionGUID: vGjnk7Y3QrSH4FOUUfDZJw==
X-CSE-MsgGUID: poSETgCxStiD9vaI2MMhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="238085152"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 16:14:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 16:14:57 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 16:14:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 16:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVU+uGn84h7O7hCRLUjBz9nI+Ap9Uj2tjEjk3xAUIt0q6oyG/Pj780aX18A4tPZ8jPEL7MPx3tGVih0FbZluo6smt0B6SN6dLwqMMNigAXtxIYrBdLVD3I8DnB4z4uLT6hOFQZI/u/XnRgQexoL1BecLT3APZqZGMXXLbhJOp50vWEyZc/fIp3W4fvCJB0i5MnQgKv0Lolv5y/uQ5CX56w/fJ2gFcF2+X7cx6+svkw3w/pjU350/8+gnDhwlU9yHRj9lBgoaDvFId6eyKI0v6Xkzv6OkgbcJct2JeG/QxJVTnNU9KoGv0vY68Xo9Whcv+8kFgRYQlqp7LjjKFhRfWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lyhufx6VoEvfsM00PAVSnNuiEynVnSm4+KuSvBWDZZc=;
 b=fekN6DKdeF1mbzlFu+9DZ22cfg+AQ5PWcKpLj3MIxIpGHsSMHZJZ9kpwcs7RiF9F4cDeAUsJczBvdooaVmFba0xvULmz2LSv0eCBffxDPONx7uSkLyqoK2EafljC4Ufb6eY24PLul1wJjJ3uKz68K3O9OaqMEEqOx2dB54qSDw46+hJUJBqpk8e2BJswqRO8Ne3idU4d/2I0ppEK10IZwfGRi+86cF5lDBV9s+HnvC8iax2fztJCApnxMipu3/YabDjuxvEfjqSSnHFKhdiA2vCmMUGNGgLH9c7aBuocEY94k1Vpwmc2afsYU0g7uhQFm7Jw41sflmAjb3DaQt5fvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 23:14:54 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::d9e7:a12b:6ecd:996f%4]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 23:14:54 +0000
Date: Thu, 21 May 2026 16:14:50 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA
 whitelists
Message-ID: <ag+R6ndpufdiwMej@soc-5CG1426VCC.clients.intel.com>
References: <20260518234716.1540123-1-ashutosh.dixit@intel.com>
 <20260518234716.1540123-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260518234716.1540123-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0296.namprd03.prod.outlook.com
 (2603:10b6:303:b5::31) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: ea404a69-3b23-4368-ed21-08deb78ec42e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|4143699003|11063799006|6133799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 9E4RqOlaBEO80S3/JObdDHNjM79UUTwymkz7xm4d+IxBmXKFqgz7NkkKUz0pGBkF95mDLq8bVafEhZw0aVXqbXmupv9WZ3KKtzZP7jrKir0Xl415AaX9bx4w5IvRwFL5tHqQMG4NuPvAUcqVJRdP4mHVDGYBTTRQjx8zEoEWomj2HbRS7/e252tqt8bk25DfHA86CvUfcQl3QFSZc+x+XeBrNZtVQN+W0Dmw+q82lYJzZ5FUzv3G6rx14XGiZPYML4WZ3a7Enuf2T944oxrSblyDEjIDvsPNYH0+GQk0hO3SNd+mQVSum8fLGRFyk9FYY9GUSoIchyA8ha6IfxCVQ16KTSsdsVWuuxMSeFSTW6iU99d9gunT4Gq+qq76tBaXmZYYahxqRyRCRnjyqMOrh2XxzDL3mmYFNfIBNa3/6LCIZsQaO/8jDzQSsbeShPdoFT/H4zjEY2J92zggc7TVf4+S08/fqyWfMLLPYbRfpcrAtmtjS4G5GFratKQX94nxDchW07sRXg/iTVlLTBC2yMssKuJiNgHUYYJ9j0nlC1iVgomsWpqQevZf+6QldbHolGFCgeTCnVEWT4OSmdM4/dF21jx2oPI9/F0sNIsYd0tcmGi6xM2TZQdNl1qcmcbfGXl8KkvS8WTURbYqNO4xQZEG36U7QB9U2URAHQps7ZGkWKt8039FT1t1HiZgj6Ua
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(4143699003)(11063799006)(6133799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2U3SGZxY0V2RFZXNlp2WTdnMDc5Z1A2MjdvTTMvTlhqdGsxQWdxNStCMEd0?=
 =?utf-8?B?U1ZQS0xKcm1ZMGNGTHVVSUpGcWs1NllwZlZzSTVLYlBSRFlsRUVlOGdvRzM0?=
 =?utf-8?B?MHZnOWFDenlIV2RmMVBzbTljTWlSZjFXYjgzTkwwLzJteFNnUS8yamU2N2RT?=
 =?utf-8?B?YlU1WjJCYnd4dnF2RlBsUHkvSE1yYko4TGxldXo1V0hjQ2RmeVpDOHQ5cG8y?=
 =?utf-8?B?dmxzY3lsYzFoa3BMaGJEbnNBVjNqZHRVWVlVREFIcXp2cnpkcDhCWmdEdU1w?=
 =?utf-8?B?N3JMK3pwclBiUjltd2tNRXAzajFnbk5ub1FHb2xKd0hNbHVwdjR5cFYxMlZ1?=
 =?utf-8?B?Z0ZCY1IzTTE2OWZBWWsvN3UweVJkU05RVHQrRmdnNHJkU08vaVVRcDJ5eEVR?=
 =?utf-8?B?SHpyVGo2bGNJRW9RK3hzNVBWSTJEbWVCeGpFZHFWWlFwQXNlTm9aR1UrOENV?=
 =?utf-8?B?YkdSWGtnbTVLM2ZIdmd4eWpWVjVCeFZkMFU2eEI4a09XREtnU3hYQXVFck9E?=
 =?utf-8?B?YXNwN1NmUFVReUxrZVM2NlNiS3lvdWV6cDRQTHJINEM0OFZqekh1SVFHSXNy?=
 =?utf-8?B?ejRoOW93T1lQcXpHVi9hb2lDZmxtTVhVWlBjR1M2UGtrM3JwNm91cnB4K0F5?=
 =?utf-8?B?N2JYeWtCYXBvWFdmTGRiZk0ydW5xVW9tdHpVbVNscTdKemdoblNuNHhXbi9C?=
 =?utf-8?B?SkRnTk5udWl1SW42S29CTlhscFRidi9jS0dPOVkxNitHQmVjWWpQWkhxSE5i?=
 =?utf-8?B?RC9qaHB6c1pZVDVsYWFKa3FwVFBEdWNNTlhMNGp4NXhibnB5Q0pwU2lLdkdC?=
 =?utf-8?B?eGhrQnNnNC9NVXpwdHE1SEljdHFyVUd4TEd4VWIxWDFZUmd3N25ZQ0MvK3dP?=
 =?utf-8?B?WDU5NGYvSllkVURlZDFwNHVLdWtEQ0dZWU9OaFJ6MDRMSWk0SVN2dzZzaElW?=
 =?utf-8?B?V2FzNzBnY1ZwRmYxdXZqbVpmS0p2Mldob2FVc1J3WXIxSnNyMlQ2UitTN2hI?=
 =?utf-8?B?THc1TVlxNFc3WVJ1bmFyZXNlZVYvOURSbDIwblZhSmc1KzBLb2hKeXRodFJi?=
 =?utf-8?B?ODIvZGJOTG1RSVFsWHExa29NbXJHRWxZUWoxR0dneHAwdlQrMzNaVXF3Y2pl?=
 =?utf-8?B?cVhQTGFiREpzZnhxRkxGaUtyS0xQbkV0eFcyRy9HemFNOXZ2UzBxY2hpTzFv?=
 =?utf-8?B?OTh6QUJlMktKZ1owZmpxcEhReE5sZXF2SVhBTlJHL3FrRzJsejNPd2pIdGpx?=
 =?utf-8?B?eEpzdU1oeHFxZ2xWWllaS0RGTXhORmxsM3NFY0dQRlJiNUl3SjQ3a0dZY2ZD?=
 =?utf-8?B?c0xzVDVkczdHVzczTnRuQ1pLUzhlT29TUzc0NWpKT29aVUM0a3Bickp4T1RL?=
 =?utf-8?B?elVzU0pMd1JiUXFGdjlESTRxckxPVTgrckJVdngrUXYvVnpVZk5MVmZjWEZj?=
 =?utf-8?B?bDhlR3QwVEFUQnBiTXE2UEJCaW9IZW8zaDFMNlptNytlTHY2ZENWZjVDUGlC?=
 =?utf-8?B?ZkFMTDN5b1J0bUlYQzZDVEhvMlExWSt0eWdKWmFKd0tOTjg4RjE3Rzh5UHMv?=
 =?utf-8?B?L0YyNk5NRFVROVdvN1V3ZG5iTFpid1JCOXAwVHYrYVphN05IUWFaVUd1RDMw?=
 =?utf-8?B?RWY5Mi9FMTYwcjhFRTJuSDZrd1FENG5JNjQ3NDdBaUpUd3VYWmN4a0hHazI1?=
 =?utf-8?B?YlpEYkdwMG5iYjdIaGNYcjdpZ0xuZDU5bS9nZndRNHh1bWVsUUwzTks4a3JW?=
 =?utf-8?B?NEhnU2FGQkwyYXdoZjVmd1ljRHZtOCszckJ3eHlvVHhLUEoxVCtkRndaMDBV?=
 =?utf-8?B?ZTVjaEF4aHNUZjFLRDNiVDluN1pNUzM0L2luNnRNNGJBN0RUVWFaVVY0Y1FT?=
 =?utf-8?B?Uy9vNVBhRDRhZjhCd0NybFlpRkZCT3IzSG0zZjg3M0Uzenc4c29mSmorQ3ky?=
 =?utf-8?B?MUxIQWhwRzE5TFJZa21FZ1MwQkZTUTJOek9YU2tSTUs5K0JYRzVva1Yvb1pE?=
 =?utf-8?B?cTF4cWlPSi9kLzFjdjRwWVQ4M0VzL3Vhc1NyeHBwMnRhL0RqWUtPeVFHU1Jm?=
 =?utf-8?B?KzV3d2JJRUJWM2p0alJkYnFSZzFhazZYS3lvaGtSSjJFeXljSFdQL2M2ZTU0?=
 =?utf-8?B?VEluMjhSblhrY1E2dVlrNWx1Z0kyNW1EQ0QvbWlnZkd6eVM0Nk15dFhTWUYy?=
 =?utf-8?B?eHQxYXd4YWR0TmZrWEdSRmo0R0ZOZGlSZG1QNVZ5VmRORUc1cG92UDM2eTF6?=
 =?utf-8?B?STE5U1hwMWppdlZMKzlldzU5U291YUUrSnpQVHFqZitvVURUcS9mK0Y5bmZv?=
 =?utf-8?B?bFI3NzZvenJjYzJRNkdxRXZJbXhNOUdMMnZZbFU2UXYwWjZXalErOUM4Tzh5?=
 =?utf-8?Q?ZKwhjYUw0hR6WOXWkIy3Pxd+nRbNQ9gmwZI2E?=
X-Exchange-RoutingPolicyChecked: Moni+wOdLUbdoUbX0v+WDHDRHS5QwSHpNHWkIf+qS9X0aCTgt1N2vS1hvKKfE/OAGHpeL4P5b9Yb8X6WrNHJ5V/UA3zLYhy2V9kEQI1yO1rL4/KnjtSc9ZWWTL9j+A0T7HDwxtyrY6kbdORV2VOV+oTQUSRvG6ht+9W8N374AycHGVcTlzBQhAFk7+itYs+hudstXT9GPtIhicf2kZpsLFscLlklVJP2euZef6DX65t5tFPVwRHeyDeBnFhNbBsOxFx7YCN08BvRQdY5vXdCEvwbA2pYHHvYAAfInwYrY8889ZoCAlUtHiueonEmxFiuPqwZGyDs3OMYDVqx7l4gqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ea404a69-3b23-4368-ed21-08deb78ec42e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 23:14:54.1498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G55nwF1lIwqJv3l2IjuyltRWpt2Qos4lD9T+bnTcYO2Vz8p0d1q9AKJKgkc6G9JXqZ9TGZiDjvgHBTeumQFg+/PRWim4vlZIOk5BFcDuz4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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

On Mon, May 18, 2026 at 04:47:08PM -0700, Ashutosh Dixit wrote:
>Unconditionally whitelisting OA registers is a security violation. Set
>RING_FORCE_TO_NONPRIV_DENY bit in OA nonpriv slots, so that OA registers
>don't get whitelisted by default after probe/reset/restart.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 7 ++++---
> 1 file changed, 4 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index fb65940848d7a..d6a5d499373bc 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -105,9 +105,10 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
> 	},
>
> #define WHITELIST_OA_MMIO_TRG(trg, status, head) \
>-	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW), \
>-	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD), \
>-	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4)
>+	WHITELIST(trg, RING_FORCE_TO_NONPRIV_ACCESS_RW | RING_FORCE_TO_NONPRIV_DENY), \
>+	WHITELIST(status, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_DENY), \
>+	WHITELIST(head, RING_FORCE_TO_NONPRIV_ACCESS_RD | RING_FORCE_TO_NONPRIV_RANGE_4 | \
>+		  RING_FORCE_TO_NONPRIV_DENY)

status and head should be clubbed into one slot, starting with status 
and RANGE_4. Maybe that can be a patch before this one.

Umesh
>
> #define WHITELIST_OAG_MMIO_TRG \
> 	WHITELIST_OA_MMIO_TRG(OAG_MMIOTRIGGER, OAG_OASTATUS, OAG_OAHEADPTR)
>-- 
>2.54.0
>
