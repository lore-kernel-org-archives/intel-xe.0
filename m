Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C951C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9803910E4E5;
	Thu, 13 Aug 2026 16:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3MscV4T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7518410E4E5
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786639599; x=1818175599;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eaWY5EHZdE08fh+8xpWp9+a0PJBSzCuNHQhZB4Xyj0w=;
 b=H3MscV4TRVteWG1QQ1UHSSjjvIByu+hVDsH1LR0mk77OZpA4N1lr3UcU
 azaO9Vwsh5w5Dbnx2RWDWPbyKxFWTexqv0jaxC83JrnoyMnIZQW3M/3Mz
 tc1quyJap/PEdiLFPig0k2vHNmvs7DolaNi3BuqftWLiQ26XTsYNknPH6
 opMFNTwItMpAY0LV+sNtlptWh0CjmidPNsFOOTbTpqgjdGS5/D1EE6eIo
 db9AWfWPZ5VlILg6N/fpBM2YqW/oi2Q+7LC0eakcJgcyMF0pzHdjVVmb2
 5D2drZKigRvJiUuRwwBC3Id6q41tQ6I6JoHVmfR4TeyIXmZ04tnk7Hddx A==;
X-CSE-ConnectionGUID: OcudSX10TwyQM3jn5EhIEQ==
X-CSE-MsgGUID: h6xE+lieS0mpxPkABo/oag==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104750861"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="104750861"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:46:39 -0700
X-CSE-ConnectionGUID: 8hs9plZ5S1qX+BTASkJy1A==
X-CSE-MsgGUID: HO/Vb97PSHuBpK7+aTs0Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="265979662"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:46:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:46:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:46:38 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:46:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvzdhmeNFLsMvRryctqQtrEzxFnBdpRPz9nJPIZl6pMDw4Y/drfvOMKZ6QSsRcmlFMrN8CP8EIos3QMFiL4Npno29X//6pGQfylHwCdk+66oECTUZ6mVybW7IkDEVzU6P8FhaOlSbYZRoZmywWDvr7Ng+WG0W3igeGZgSKlZaQIRbklL+xdV4kMly4aqBk0xdZIG+R2/45bCOlrkRD+RP9kLYt8sTv84FBDlDb+l2GKGGnwGCRoU73UB0x2ko+lt8fBNhWWwzL3FsQcEQCXFpjB4rdvOM5RMEsnGn8CvJs5wTt7xGpATXHBSHCK9+waYoaCDSXd8dg/3+mqqOxSFJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmX7CfpNqQT9vpHSANCgyUAs+eJ/Io87piUp5FHUi3Y=;
 b=wlvuRKcvP7HUs2hZFYt75cDwLSrnch6nZ4KpPo1xkvQ+muLvWtR/4/eio3EM4S0q8AGrNgYfUu8M4I0slgF92LK7VhTDrR/yUue8qwO3pyQ5Oy463otcp/JRWK7ZqQZTtuoB2eSNRjHzubaPkuCpxqz3aazra2pZcc+mpohI3KyXWAFL6sCuCd2JIL4D7jiwiBG42rfKSgeBOvVIMWPcccV0zNCRzWj49EInbNV77V24+4bTAUnZlOMSY+8zIeiUu4VJs8ZDsSH1yPu7E41Ng9QqQ3/iGwuYDj8xgMJ7HmojJ1vQCIHoEAnBUqO6DCLaNEQpS5qfLbQEs1JLf4EJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB7255.namprd11.prod.outlook.com (2603:10b6:8:10d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 16:46:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:46:35 +0000
Date: Thu, 13 Aug 2026 09:46:32 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v4 26/32] drm/xe/pcode: Report 'timeout, retrying' error
 using SIGID
Message-ID: <an306HdJdiz3V0qP@soc-5CG1426VCC.clients.intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-27-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260812191450.11690-27-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY1P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB7255:EE_
X-MS-Office365-Filtering-Correlation-Id: fab461d8-5921-430c-d05c-08def95a6fdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: yr2dLIaf9rtX/btCsGOkIY9nTDubIWuWpHb1W9owe8L2DJUJlIFlCRkY75sAZ5tzOzFtyIYWBV6rcfic7/F2UFRFC5jMvyJcmrY8mz5p0CmR/gRUnnzBkg2zA9X46IRV4v525vMMrtE+3uT3D3isxYtslbgCJkgPr/s7aIcCJ30Zmy6BYcOCxfvAoMsvyYhN4OVQPnZl+AbKv+szrMbuuez9KuhvJmTVCBHm2gB7m7GitQZgBLKcPl7em03KcXzzZVYoGgftfvjbzk3uBHTTC7POVEh3FLirVQdCrvDK4taXJ6AQENdUXe/8SLW7aRaJHlnd+DX7SYrxbGOgw+XHrDw3Fp58DxVJPJVxS9nxgUGxV+iBghfG/BnrQpmvLiDT0bLtI6HjKU9V45bBRDPF66586HWmtw65Men8Gm/PMosPegYYwayswRMWAKZm3HCVldQL2PAObQAkMSXITx1aTl2yyKlzPJttznib+w9asF8rgzq6PvBE1gl9C3ecEJ0l5VOY4OPjUF+pvbTxcSDV/tZuzJE7J8nc9xiqJIyYnxNG7FqQYRoyJOOTk9frjYYI+PP6QX3caw1kekNSNcUUXG9SIfgsEK2tuk7bvWowt+6RxbnV+RCVE8vA3/icbpWc4/zlBCettFZ0LVduhSEFOP4A0voAhE/eUJ4f4rADwXQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUpXT1lRdjBWKzE0cko1Q29XSXdCeE1yNFBIK1cwcWpPaU1PcmMwTm0xNk9C?=
 =?utf-8?B?N1gwV3lqQjQxNHNXV1Z2S05wK01pMnIzRGVJZ3ZhdzZBZ0RDUTdNNjZIb2l3?=
 =?utf-8?B?a3dTYlNoYkxMR1VHeVJ5OEdxZC9pbVA4NmtRYWFtZ0lKVWJMMERaR1V1N2R3?=
 =?utf-8?B?eVRsdlhWRFVuVHBIcVpPdVhuYzQ0SDd0WC9jNEs4MzJkZ2hSb3dUaWsxZFJk?=
 =?utf-8?B?SGhKSVdVc0VjMEszWFd3SVE1R2VjR1picVA4TndqRWFycXUrWi9rTnlDQ1hU?=
 =?utf-8?B?L2dpTHR1VVRPRm1oZlMrK1E4bEM2N1I2NXd0SFlTVmZzdW9RdXAxY0hYbkNr?=
 =?utf-8?B?M1FZUkF0TXozN0ZDcDFmWEp6cGU1b3oxLzRJZ1JnRjIwT3JFcWEwUGV6bjha?=
 =?utf-8?B?T2lORFNrSXVUSHlXZUxrTlhuOUY5T1ZxdGV6cWllSml1NkRoNzkxSi9vWDZ0?=
 =?utf-8?B?N2xTMUgwVWZzck1Mb3pTN2g2Z0ZyeEpKMFpWU0l4alBZTFMxSjVtRlMzeUxv?=
 =?utf-8?B?N3hEVGh5NzlzM25RMzRhRjh5eUlMOVU1T3NnSkhZcDhwaUgxeWFwMDVXazlM?=
 =?utf-8?B?aW0xdTkyVkRZM2U4V1ppTnVmN3FZSGFXTXRBR3RhRUMrbkVpa2VLRzJ3MzRT?=
 =?utf-8?B?NUc0cjVCYmxNamMvRzI3RmhOd3ZlL3U0QkRvSmtqWHdZcTMzdWM4NmpZR2NG?=
 =?utf-8?B?eWNoc1NrRVluUkswYWlGUTc3Rm0vZW4rRFNGVkFZbnRRcFc1TW5OSVc2NEpV?=
 =?utf-8?B?QVU5akI0RE9KRjZxbFFTNUJqOWlLNVhHQXd0UUdlSCtyamp0b2dNb1U0Z1pU?=
 =?utf-8?B?cmZ6NDgzYW1saGFrTnl0Rk5FMTd4ZWt3dUZuK2d0VU52dWI0WXhXcm9zTGM2?=
 =?utf-8?B?Ry9ma0Z3Y1B2ajNMQTA3cGRvTWFaWnRTZ1QrRzN3ZFFGb2dDeTliTTJqQnZE?=
 =?utf-8?B?NTkzS3VUT0hYcm1CRDVIejFTb3pjV3FvR0J3ZDBzS0N6MUF0UW5FVXhKcWxK?=
 =?utf-8?B?NXk1T2FMaS8vRWdndXFHK1hhNkJaL2JoemNHL1FMaTBxaldRaUt3a01sSS9F?=
 =?utf-8?B?d25IVDI0TFozeGNKQjJST3kvNm9DaUtnVy9nTUg4bXBNaGh3OG5BcVQyUUNE?=
 =?utf-8?B?WEpkZ0pkeDUxa21rMjlnS29HeCtxWE04N0RqNmMxYW1YRmVzZEp3dmwvMStG?=
 =?utf-8?B?b3Z6QWFJSFBRZGFRS3Uxc0psVWNUb3Raejc1aERxbXRYZllZOWZpRUFzdlNO?=
 =?utf-8?B?c1FmWXhtbVFMNlpuOHN2Qllubjd1Ty9NeGpOSlREQldHeG10cWlMbjJNcEtq?=
 =?utf-8?B?ZVR0RDh6Rm5rbXBYTjBabUdabkJYcjR2d0lVbFJvVWUxLzhOcFluOWYvQ09m?=
 =?utf-8?B?WkxlbUhTaHZJL1RhZlg3SU43SjRzdDA4NXNidWpkcjYxcVA4NWFramozcDVF?=
 =?utf-8?B?RUpHdHcwOFViT0FuN3FaUUoxMDlGWkNFNEpiOEFKK2tpWHBZT2NDS0F4TG94?=
 =?utf-8?B?NmsvUmF1eXhSVURtRTFEWWg3Ylk4dzBneEE5cnRKa0xDMkZVZjd1RmZJWm9V?=
 =?utf-8?B?eEZiWExrbklBcjkwOXpZc3g4bjRMUDhJVTdYdG1rOCtIdVRFajgvdnQ3WXl3?=
 =?utf-8?B?OFRGT0RuV2k0MzN2Y3VycUZZSDZHUzlmNmxKTGo4NDFCRk1DMTk4dTRyVTBD?=
 =?utf-8?B?QjFnSGNrZ3liNXhhRGhtVk5La1JWczR6LzdabGhKMmEwL2RnQ2Q3bm1xT0ph?=
 =?utf-8?B?Z1lPZmREVXFUbkNwbHhxQU1XSFB5ZzNKNmZ6TUI5TVZadWgyL0lKQUV0UWoz?=
 =?utf-8?B?SjBqc3dvZnkvZVRKbUtQSjlEMGtIMEcrL09rUnlkR2ZrSUhDb25OK0RIWVNP?=
 =?utf-8?B?OEVhNDhxV2dBTCtFRlNjMTBZZ0ZpQy9qbjNKanFJRG9XSnZ6MEhOQmlXR2Ux?=
 =?utf-8?B?L3RRczZBdER1bXJ0MDZCaFBjQnVSeFRqRnFnMlQ0VjdZaEw3TEVicUQzTlZU?=
 =?utf-8?B?b3pQaVBhOHB0UlYrZkdBR0Zjb1pjaGJab2xLQjhkYWt3cVd6VEtJbHgxQ1Bo?=
 =?utf-8?B?YXVGc1BoWFVGbTNML2dWdGJ5bkpjd0xEaUpnYXY5eUdtU25NeklPaURSUTMy?=
 =?utf-8?B?eUlPN1hBa2pNSWdmeFAxQUszZGVRNWU5VmxoM2RqbDNuLys4ME90ZERxZmZ5?=
 =?utf-8?B?ZWorc0ZDWGg0NW1DOHBsN08rbG1PVGZjbjhTcWNJdzNIQkxibzVEamNNT3Z5?=
 =?utf-8?B?NG96dnJCSmR1NmJuTklkYVJ0UUttcjVzaVhBQUhHUkRmTC9BeGdHcnRYa3l2?=
 =?utf-8?B?ZFJ0M1lMcXFYR2lpTks1b2xYMklEcm1VbUNMRWtsVHRQQUZvMzBpa1ZpcTRE?=
 =?utf-8?Q?Z+2/K1x3AK43q7V4=3D?=
X-Exchange-RoutingPolicyChecked: RTYL0ErmkRRP5BNdz0RxilIhWEjDobyUSPBlPC54ZTf5LfkwlTGLAI3bE/sTtwuPVbhGdqOPF9xt2k9yf/RrGkogZHI4MXQFy0jlP5LU66yXjN/0AGBW5tpK6kq5AjkrUGxGUSrPHedAJ7ks3qDr4ixhhr4Vkv2VXFFleAbdN8QRJrZqOnnuSgMKVTLNDn9kI4yBmI5JVy9IPLtxfHP/7ExV/0YUngwqVyS7GMyo2jv3Ea6WxviS0VmeWo1t71RQvb1PJ+c6oHUogcgl083NfRgez5RiVOQvL8ppykGATXMQHTYeWS7caebPFkQB5BVBbEyCqPQQbGikRaNP8CJ69Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: fab461d8-5921-430c-d05c-08def95a6fdc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:46:35.3673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QryHxbER/ZYPHzZg94SKcRqmQ0W5pTv1uNglUl7YAoyfdKtkoPwJ5jRITSeFP1z96qQytbHKdPLMp/RkKNqcyPiUDAFevfULb0vJKekQxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7255
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

On Wed, Aug 12, 2026 at 09:14:42PM +0200, Michal Wajdeczko wrote:
>Report 'timeout, retrying with preemption disabled' error using
>xe_log_err() helper.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Riana Tauro <riana.tauro@intel.com>
>Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pcode.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index 014632e11338..14b13a11d1d6 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -218,8 +218,7 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
> 	 * requests, and for any quirks of the PCODE firmware that delays
> 	 * the request completion.
> 	 */
>-	drm_err(&tile_to_xe(tile)->drm,
>-		"PCODE timeout, retrying with preemption disabled\n");
>+	xe_log_err(tile, PCODE, ret, "timeout, retrying with preemption disabled\n");
> 	preempt_disable();
> 	ret = pcode_try_request(tile, mbox, request, reply_mask, reply, &status,
> 				true, 50 * 1000, true);

+ Badal

Should we report the drm_err before retrying?

Should we add a new log to report a failure after retry?

Thanks,
Umesh

>-- 2.47.1
>
