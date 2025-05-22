Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DCAEC54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 22:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD24010E16E;
	Thu, 22 May 2025 22:03:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VYBt1BKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4CF10E16E
 for <intel-xe@lists.freedesktop.org>; Thu, 22 May 2025 22:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747951433; x=1779487433;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vKwW+v4OFj+blJgA1P6ndSXww8qzvtZIrHHToKQR0Zc=;
 b=VYBt1BKUy9pWTnMAumBB6uL7CJXHjMINjBzeYS/SIXp2wI6xNc58k1xG
 onK+YZ/jM2TmEweQIVKgLo2rY/1m0Mizu+cSyv5Hs+A/CY3CoyeSmUHKJ
 6q4W/cx1yOmQIolkkWZ0XsZIVukVhIYZ/BPSxc3Ve1kKW0c8Sc7JYuSfV
 +QC6ATMkzglTqAsGuNKbPAQ5ncjxvPwZr9gg8oucFV7bTv6WNCGS3K83i
 ptQrV5E3+N6kZf5I74dBGlPgskwsbQtEp1akAs9vSJ2GVAjvLHyy26l+9
 k4bLJ9Ka16uHJJNxahjQLHcIy+oJ7RzAqgYTsTG+JS1ulz5HAhRU50hjt w==;
X-CSE-ConnectionGUID: uF6wQndKRX6Wy4GLCC1s7A==
X-CSE-MsgGUID: XmeueLCJSA2lhjA2xhex4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60249243"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="60249243"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:03:35 -0700
X-CSE-ConnectionGUID: 8k5yuPMjRzutM/60qDrUfg==
X-CSE-MsgGUID: D7SFze4/QLiMaPhxi4u36Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; d="scan'208";a="140850895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 15:03:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 15:03:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 15:03:03 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.86) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 15:03:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRE9P9bsqdbSU4gS6ebu7LeJckrCYUNH/tC5nojrzFJ02Vf6Y1lhJCeg0H1WT48Q1OqKBsym/cArpEfikIkkvZvmmAOsrZBNzSENn1Kg5KtrTVWgNL0G7RbWrmRBgfijPjxmXczqF7c/RC5+tzg5N43I6jPDYznNyEun0H4CMgdU36C11KdKYo6rLf/3o82L0MvuBDy3L19mmlz44sTV8NSQupxNCpNvWyzXQU6IV11zHu8ZitqSNBM5vIFS02ehcZZTP5y3wODdL5KBefGSXOc+EAnN5o+xvuSf413N9Xrm5NuOdSzgnlQMbaDCIsM63sIp0b41ilxHhc91LFpskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbmyQEuMx06jz+t8kL+/Zs/1EVSo8nUd44susWv9b0g=;
 b=PS/d41bfEuyKxDjdqsSblcx/bbA41DskUUy2RUvrrtKnCnrPxEnMUH0567vdBul5etoC6ZLGR7i4h8iFQp296924GGTH1DYqFuFmKTsTUNL5a+M07QXG02lbFAkeVNsWZbAnQ/KRsoWpkTFLq64uSakpD3OjcmSsFLvDg0aP5Nx5j1eI/KXQTTu5eu5+j6FZNMUS+YZgnywknF7AiYB3VcFTtSn54YjH606gnFLacXgm0sRNu+aAgx4VmNUT5bVx9UnPfge5jXBZbbkNzlPSkPqts+Q+EDMG0eTlrhH6GeMz5Su0Qr9c8cTPAz3xETbm5RWv7BKXiCGIdZUsbsWlrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 22:02:55 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 22:02:55 +0000
Message-ID: <26de888e-259a-4a7c-a1e8-dac621fb310d@intel.com>
Date: Thu, 22 May 2025 15:02:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/xe/pxp: Decouple queue addition from PXP start
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250522204602.3921904-5-daniele.ceraolospurio@intel.com>
 <20250522204602.3921904-8-daniele.ceraolospurio@intel.com>
 <c33e0a6d-b4f8-4bb1-9046-ced814253b88@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <c33e0a6d-b4f8-4bb1-9046-ced814253b88@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: 13649e68-c05c-4084-bdd5-08dd997c67bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V00rSW9kMW5pZStMS3QydWErMlROWkNtejBNYnlyWjM3ak5YNnlKSzNLMkwr?=
 =?utf-8?B?NVNGU25sWlpObjVxdzRVdVhGTUxQTlBYZ2F4dEhveVBvT3ZTaDNIdXZaOUNp?=
 =?utf-8?B?cG5aZGU5eHJiSElUQjNMNWNYQnowclRLTnUvS25MNVNYRER3bWFzeWs4UE9X?=
 =?utf-8?B?cytJcmlob0RqYkRQWno0ZjgzNER5K0JpUWxIRGtpMnVzL1daK0l3QlA5dzJ1?=
 =?utf-8?B?SmUrS0xjdEpwUit0Ni8xeDZPeXovaTR3MU5BazIrZlhkUFVGRVJiUWJhZDZp?=
 =?utf-8?B?VWVQS3J0TlJDWTc2M0JLSmxuTWprOVVYK2trY1ZiOEtQSzZiK201bVY2UVBz?=
 =?utf-8?B?V1FXZEZiUHA4M2M1QTVlVURjVWlsRGM2a0hZWUN3eVRwdFJkMUNIaFdzRXV4?=
 =?utf-8?B?QkFBYVE4RzZrUVJSWEJSMCtmbnVxSmVscmVZM1UxcE4xVHZTem5FbjQ5QTZO?=
 =?utf-8?B?U1gweWFaN3NIQm11T3lYMEhqSGxNQWp5SENVRHBOZ3lXUkxKOTlWUEtyd3dZ?=
 =?utf-8?B?c2IyelBkTUgwQytTakQ4S0NhekJ5dFFHeHNjU1pJZEZka3dmelJmSDJmV2JC?=
 =?utf-8?B?RVFxUFFGWVR5bkhCMkZtTjJEVC85MlJFaVE4OUZWQzZZK0J2d0N6RjJBNXVF?=
 =?utf-8?B?bnpBb05SeHdTbjdGQVdsRCsza1RwcEkrOHpDT1RTKzFqMkhSTTBOUUJod2NC?=
 =?utf-8?B?TVBtRUszcUV5SmlzbTJWcm93cXBselZsTFdxZWxZanJjdDcvRFZBaWdRQTBH?=
 =?utf-8?B?RWNpRTg0bzhadUt6eit2d00zSXI5eHRybFRYcWkwUWlVQ29HVGdOdjdOOEFt?=
 =?utf-8?B?V2ZDcHBUL0xTNnB0YUt5QlYxeXE5azJVNzNKejYvQlp2VytkTDZudGxZSFJ2?=
 =?utf-8?B?aWkxMURBQWpOTmxGMmxuL3pzUC92S1R3SzFnSi9XUnVjcUQxc2k5TEdWZ0Z1?=
 =?utf-8?B?OTJGUHpPN1RDQWZWTGRGUUVEM1R3R0dPaXVUY0Juc2Jvd3pFVzZGdEw4bFY3?=
 =?utf-8?B?Q0kzRjJKL0k0dTZCU3VscGk1UlpqU0JBMXJMYThyOEhyNmJZbkpmNXJPREhz?=
 =?utf-8?B?YnZiNkZJZUtCWWlnc2xnVjBRVzZYUlo2K1VSV01ERmFiSDF1cXNHdHBYZ25r?=
 =?utf-8?B?TUVrVnhjblB3eFoybWduUVNqR2pialBGNFVodlVIdGFoV0JLLzREclJuZE1Y?=
 =?utf-8?B?OEpXcDg2S3hKZVZRVTdsSEFMZGZ3SDhSQVIrb1YrYzJpZS9GenVYZzF3NWt5?=
 =?utf-8?B?T2FXeGtPOGRPbkVjbzA0REVKdllid1QzSmxtd0l6bFF0Y1VFdEVDa2xuWkpC?=
 =?utf-8?B?UXhlaklLd2ZqVFUzUk5mbUVmMXVVa3AyMXNRaWlQcjk3MWFzQmFNUXBnVEFS?=
 =?utf-8?B?TjF4L01qTUVDWmVDelgvQVVpc3hJM3RraUd0WVVIMVpuaW05cW9yVGN2Um1l?=
 =?utf-8?B?TFRSQWM3TEl1bnpBUWR2U3VZSUQySE1wWm50STY1NVFZa3BjaEw2WVVJa3Yr?=
 =?utf-8?B?d042amhlSTBiZysyZ2hBSU1ka1JNSTROL0h5a21HV1J5M0cvbStUNEVhYnhL?=
 =?utf-8?B?V2JmeUJ1aVRXdW5PQTAyRUVMeXNJaVBTUDQ4WmJ0UnVxQzhibXQ5amlLOFJ0?=
 =?utf-8?B?VGZnL29NWkphWWZnQjNXK0o0MzM1Z3d5QlBLejVpV0x0NmpsTlI3NStYeE1j?=
 =?utf-8?B?N2xGbnFUamg1RWZsMlU0UmtQZTBXWndBK2phK1p1b0s5WS9hK3V5KzBoSVlP?=
 =?utf-8?B?QWFyOURHNERENEFRLzFLUXlhaTNLK3d6b0phRHdVbFN3ZlU4U2xJR01wbkFv?=
 =?utf-8?B?Qm5xOTRoZmlxOXJ1REJremNaODZHeHhLOXNTdHYxQmdjdklQK2p3bW40czd2?=
 =?utf-8?B?Qk5xQVN2SHVlWFIxK3FRTlRzWlZVSFc3ZVR6cXZHRklSSXZKR3J5aEZnMkY1?=
 =?utf-8?Q?U45Bc8WXWks=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEFUTVNXdHBrd1BhV04yanRkUS80aWM2eVdrdzFiVTZkRm4xQ0xWU0RORmJp?=
 =?utf-8?B?SFF3ekVQbzFyMEZpemNPdzNuNzBxUURZYk1SL016aFZYa2tPdFkxaTMyWDU1?=
 =?utf-8?B?Q0JWbVJRUER1SnYxOS9GVi9GcWVsV2ZBQ0J1SmEvMDhjZE02MXRQRkQ0OGw0?=
 =?utf-8?B?KzNWdFE4Y0VlMTUwVXR5Z05pcmxDWGFBTTVSQzdtOXlRUk9JZlRac1VZUHA3?=
 =?utf-8?B?RElDVkgrTEdLSUpFVlJUS3RGempvNXJBbkxScTlqUDJMaG9jd1V5WlFTUVRU?=
 =?utf-8?B?TkFNN1FhdkZ6UVNNanRnbzFINTRrZUdXVUZPcGFMY0R5NUlyc1FIWXhkc2ZY?=
 =?utf-8?B?WkJPT1hoVVVqZkNqMENmWGM2TmpWWDJMMHN6OXN4Wkl2TW1HTGJmcHFXSllh?=
 =?utf-8?B?OUtIM2szRFNiVGsrcWY0dHdtbDhyd2lXL05TRnNPQld2TnFFQVpobzQwRzJV?=
 =?utf-8?B?dWZnSmFvTk5nRUlBYmtiMXVnTitXREdsNGd2WGhGalJQbTd6c21mWCs0aDNV?=
 =?utf-8?B?bkdLVEFZc2x4TEkrcEp5bSs4cWdZaGttSzk1aHc0cTR6aGo5WFRYZTAreUFa?=
 =?utf-8?B?eVFnVnZ5UWxhZXFWQklpWVNSSFZRQ25CSTVjSEpEc2NNak9ObVByT05VaHFk?=
 =?utf-8?B?T1VTUm44T2NFcSt1Q3MxYVVmMkVYQXVwTDdaSHFEMDlCLzNDSjBod1F2a0x2?=
 =?utf-8?B?d1NhVkVPV3d4eUpPdlBIOHZXbTRoeUltUm9JbEdaUkpkbDRkT09pcGFBeEhj?=
 =?utf-8?B?R2lNK3dkMWdSR0pKdmMycjFjdjQ1YTBwOEZSZms5NnFiZ2hudXVWb0hqZXl5?=
 =?utf-8?B?QzdUNjlDT0FWTG5oZHhlUjVVemV4eE52TlgzZWJYMEJGQTdHUHVJUEo2MWU0?=
 =?utf-8?B?SkZQMW9IOTlKK0wySXkzUHpjMExFcWdrV0lJbGdlYmVVamRQeFl1OFJZMTlK?=
 =?utf-8?B?ZlZBaTZRcW82WXRCUi8wenVVenNFckNKbmpjSXBSc1REQTczK1drcllzSFpR?=
 =?utf-8?B?dWhGUmVVc09oV3A3cWEwZzJVT201Umk3enUycjVSMS95RldVZVNxQWhpbWxJ?=
 =?utf-8?B?YkFucWJIRnZtV2NzNmN3VTdlcDlBZzJhSzV1Q3NWWWdxK3dqeVJWN1FWVGpU?=
 =?utf-8?B?WWJkbFplVTZlS01HUkcrZngxb3RHcmVzVHhEMEpIMkRtRktEa1FsMHhzS3NZ?=
 =?utf-8?B?Ym5waENpeStKUUtvTzM4bHFuQmRYUExmdkg0OEROenJnZ2pBaTRuQ1Q1UnhM?=
 =?utf-8?B?bUpRWmxZcFR0WVNhQlFCcWg1RmMvUnFZeGx3QUM5N2owODlqMUlkMzYwWUQy?=
 =?utf-8?B?alpXT3JacWI3MWtSVGFKS2wzTURKYy9ha25DZkh2LzlZTXRMdnJ0RENOU3hp?=
 =?utf-8?B?UDJKWUZySUFUelQ0Z21zUHV5Rk5GSzNZcnFncjJFVldqbTlmblMzdTNib0hQ?=
 =?utf-8?B?K1VkZTNEN2tpL2JWd09lSFpmeGpBZzJTcTk1bDFXKzNvaXZ1WWRnbVpGZStz?=
 =?utf-8?B?cENkQWFEanRKZDBYNTdORzV1S09mSEhBNnFKUTB6RUtEZDNIdzdrUFZKRnpT?=
 =?utf-8?B?ZjAvRnhOZEdMMmE4elhWRXZkRitpYVdJSmxIZXZVZmZuamdibEhUeGMrdHJs?=
 =?utf-8?B?VW9HaU9JYStGbG9zN0p5aUFZODdIQkg4dTB4UjBiaE0xbEVuWWJjTDZIa3FU?=
 =?utf-8?B?d3lFNERjR3FtTjZ6OHNZdExYYWc3WEJLaGpUeFRLMGdsQzhQaER6c0dIYzJX?=
 =?utf-8?B?OXV2bDFWNVBvNEx3UUJDWVh4UHAyeXlFZ09xQW0rSkl0Q09EU0wwRERNRWxE?=
 =?utf-8?B?dm9aRjJDZEo2aWZDc0YvbEhHNTlFUXJBM2d0MkNIWHhrWE1pclRZYTVPTitD?=
 =?utf-8?B?QXU0akRqa0t2UGhkZkN0SzQwNUpWYkxkWWpBb050MFNyeUo1Q1ZmUXJhRWdL?=
 =?utf-8?B?SW9NN3psb2hMZjd4VElDbVQyU2NKVzVFZVpxOXptd0ZKUVFwQmZlOW5SWGJN?=
 =?utf-8?B?V0JvVm9sbThpbFlUWlJxblZtbzZSRjBjMDhLdDcrb0t5OWM5dG01SzJQRVh1?=
 =?utf-8?B?NnQ0Z2gyc09OeGpjclIvditoU3h1UUZSSkJBdVhYTjFaelQrSEtRdms5Z2Er?=
 =?utf-8?B?UUhucUFNamw1SjZaZHFJSDF0eFJkVXdKS3R6RThHREI0UWxtTXlpdVQ4b0x4?=
 =?utf-8?Q?SuatVUc0NTi/yxjkfNJIWDQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13649e68-c05c-4084-bdd5-08dd997c67bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 22:02:55.3655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8/SnwJaXdvj0KKNZXF0AJfV88TweLtgUbF9VeMD57/iAEndXG/hxh0/teF2dbC6rMQrh1y/dBeRdV70zMY5F728mfDN4pM2Yk+pLQ3baOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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



On 5/22/2025 2:26 PM, John Harrison wrote:
> On 5/22/2025 1:46 PM, Daniele Ceraolo Spurio wrote:
>> Starting PXP and adding a queue to the PXP queue list are separate
>> actions. Given that a queue can only be added to the list if PXP is
>> active, the 2 actions were bundled together to avoid having to
>> re-lock and re-check the status to perform the queue addition after
>> having done so during the PXP start. However, we don't save a lot of
>> complexity by doing so and we lose in clarity of code, so overall it's
>> cleaner to just keep the 2 actions separate.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pxp.c | 143 ++++++++++++++++++++++--------------
>>   1 file changed, 87 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>> index b5bc15f436fa..32ee38e11811 100644
>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>> @@ -504,36 +504,41 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp 
>> *pxp, struct xe_exec_queue *q, u8 t
>>       return 0;
>>   }
>>   -static void __exec_queue_add(struct xe_pxp *pxp, struct 
>> xe_exec_queue *q)
>> +static int __exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue 
>> *q)
>>   {
>> -    spin_lock_irq(&pxp->queues.lock);
>> -    list_add_tail(&q->pxp.link, &pxp->queues.list);
>> -    spin_unlock_irq(&pxp->queues.lock);
>> +    int ret = 0;
>> +
>> +    /*
>> +     * A queue can be added to the list only if the PXP is in active 
>> status,
>> +     * otherwise the termination might not handle it correctly.
>> +     */
>> +    mutex_lock(&pxp->mutex);
>> +
>> +    if (pxp->status == XE_PXP_ACTIVE) {
>> +        spin_lock_irq(&pxp->queues.lock);
>> +        list_add_tail(&q->pxp.link, &pxp->queues.list);
>> +        spin_unlock_irq(&pxp->queues.lock);
>> +    } else if (pxp->status == XE_PXP_ERROR || pxp->status == 
>> XE_PXP_SUSPENDED) {
>> +        ret = -EIO;
>> +    } else {
>> +        ret = -EBUSY; /* try again later */
>> +    }
>> +
>> +    mutex_unlock(&pxp->mutex);
>> +
>> +    return ret;
>>   }
>>   -/**
>> - * xe_pxp_exec_queue_add - add a queue to the PXP list
>> - * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>> - * @q: the queue to add to the list
>> - *
>> - * If PXP is enabled and the prerequisites are done, start the PXP ARB
>> - * session (if not already running) and add the queue to the PXP 
>> list. Note
>> - * that the queue must have previously been marked as using PXP with
>> - * xe_pxp_exec_queue_set_type.
>> - *
>> - * Returns 0 if the PXP ARB session is running and the queue is in 
>> the list,
>> - * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are 
>> not done,
>> - * other errno value if something goes wrong during the session start.
>> - */
>> -int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>> +static int pxp_start(struct xe_pxp *pxp, u8 type)
>>   {
>>       int ret = 0;
>> +    bool restart = false;
>>         if (!xe_pxp_is_enabled(pxp))
>>           return -ENODEV;
>>         /* we only support HWDRM sessions right now */
>> -    xe_assert(pxp->xe, q->pxp.type == DRM_XE_PXP_TYPE_HWDRM);
>> +    xe_assert(pxp->xe, type == DRM_XE_PXP_TYPE_HWDRM);
>>         /*
>>        * Runtime suspend kills PXP, so we take a reference to prevent 
>> it from
> Just spotted that this block of code needs to be removed. It is now 
> done at the level above in xe_pxp_exec_queue_add() and therefore 
> should not do a second pm get at this level.

Good catch. Looks like CI had caught this (PXP RPM tests went from pass 
to skip) but weirdly the email report didn't include this change. Will fix.

Daniele

>
> John.
>
>> @@ -543,30 +548,24 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>         /* get_readiness_status() returns 0 for in-progress and 1 for 
>> done */
>>       ret = xe_pxp_get_readiness_status(pxp);
>> -    if (ret <= 0) {
>> -        if (!ret)
>> -            ret = -EBUSY;
>> -        goto out;
>> -    }
>> +    if (ret <= 0)
>> +        return ret ?: -EBUSY;
>> +
>>       ret = 0;
>>     wait_for_idle:
>>       /*
>>        * if there is an action in progress, wait for it. We need to wait
>>        * outside the lock because the completion is done from within 
>> the lock.
>> -     * Note that the two action should never be pending at the same 
>> time.
>> +     * Note that the two actions should never be pending at the same 
>> time.
>>        */
>>       if (!wait_for_completion_timeout(&pxp->termination,
>> - msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS))) {
>> -        ret = -ETIMEDOUT;
>> -        goto out;
>> -    }
>> + msecs_to_jiffies(PXP_TERMINATION_TIMEOUT_MS)))
>> +        return -ETIMEDOUT;
>>         if (!wait_for_completion_timeout(&pxp->activation,
>> - msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS))) {
>> -        ret = -ETIMEDOUT;
>> -        goto out;
>> -    }
>> + msecs_to_jiffies(PXP_ACTIVATION_TIMEOUT_MS)))
>> +        return -ETIMEDOUT;
>>         mutex_lock(&pxp->mutex);
>>   @@ -574,11 +573,9 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>       switch (pxp->status) {
>>       case XE_PXP_ERROR:
>>           ret = -EIO;
>> -        break;
>> +        goto out_unlock;
>>       case XE_PXP_ACTIVE:
>> -        __exec_queue_add(pxp, q);
>> -        mutex_unlock(&pxp->mutex);
>> -        goto out;
>> +        goto out_unlock;
>>       case XE_PXP_READY_TO_START:
>>           pxp->status = XE_PXP_START_IN_PROGRESS;
>>           reinit_completion(&pxp->activation);
>> @@ -586,8 +583,8 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>       case XE_PXP_START_IN_PROGRESS:
>>           /* If a start is in progress then the completion must not 
>> be done */
>>           XE_WARN_ON(completion_done(&pxp->activation));
>> -        mutex_unlock(&pxp->mutex);
>> -        goto wait_for_idle;
>> +        restart = true;
>> +        goto out_unlock;
>>       case XE_PXP_NEEDS_TERMINATION:
>>           mark_termination_in_progress(pxp);
>>           break;
>> @@ -595,29 +592,25 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>       case XE_PXP_NEEDS_ADDITIONAL_TERMINATION:
>>           /* If a termination is in progress then the completion must 
>> not be done */
>>           XE_WARN_ON(completion_done(&pxp->termination));
>> -        mutex_unlock(&pxp->mutex);
>> -        goto wait_for_idle;
>> +        restart = true;
>> +        goto out_unlock;
>>       case XE_PXP_SUSPENDED:
>>       default:
>>           drm_err(&pxp->xe->drm, "unexpected state during PXP start: 
>> %u\n", pxp->status);
>>           ret = -EIO;
>> -        break;
>> +        goto out_unlock;
>>       }
>>         mutex_unlock(&pxp->mutex);
>>   -    if (ret)
>> -        goto out;
>> -
>>       if (!completion_done(&pxp->termination)) {
>>           ret = pxp_terminate_hw(pxp);
>>           if (ret) {
>>               drm_err(&pxp->xe->drm, "PXP termination failed before 
>> start\n");
>>               mutex_lock(&pxp->mutex);
>>               pxp->status = XE_PXP_ERROR;
>> -            mutex_unlock(&pxp->mutex);
>>   -            goto out;
>> +            goto out_unlock;
>>           }
>>             goto wait_for_idle;
>> @@ -639,27 +632,65 @@ int xe_pxp_exec_queue_add(struct xe_pxp *pxp, 
>> struct xe_exec_queue *q)
>>       if (pxp->status != XE_PXP_START_IN_PROGRESS) {
>>           drm_err(&pxp->xe->drm, "unexpected state after PXP start: 
>> %u\n", pxp->status);
>>           pxp->status = XE_PXP_NEEDS_TERMINATION;
>> -        mutex_unlock(&pxp->mutex);
>> -        goto wait_for_idle;
>> +        restart = true;
>> +        goto out_unlock;
>>       }
>>         /* If everything went ok, update the status and add the queue 
>> to the list */
>> -    if (!ret) {
>> +    if (!ret)
>>           pxp->status = XE_PXP_ACTIVE;
>> -        __exec_queue_add(pxp, q);
>> -    } else {
>> +    else
>>           pxp->status = XE_PXP_ERROR;
>> -    }
>>   +out_unlock:
>>       mutex_unlock(&pxp->mutex);
>>   -out:
>> +    if (restart)
>> +        goto wait_for_idle;
>> +
>> +    return ret;
>> +}
>> +
>> +/**
>> + * xe_pxp_exec_queue_add - add a queue to the PXP list
>> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
>> + * @q: the queue to add to the list
>> + *
>> + * If PXP is enabled and the prerequisites are done, start the PXP 
>> default
>> + * session (if not already running) and add the queue to the PXP list.
>> + *
>> + * Returns 0 if the PXP session is running and the queue is in the 
>> list,
>> + * -ENODEV if PXP is disabled, -EBUSY if the PXP prerequisites are 
>> not done,
>> + * other errno value if something goes wrong during the session start.
>> + */
>> +int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q)
>> +{
>> +    int ret;
>> +
>> +    if (!xe_pxp_is_enabled(pxp))
>> +        return -ENODEV;
>> +
>> +    /*
>> +     * Runtime suspend kills PXP, so we take a reference to prevent 
>> it from
>> +     * happening while we have active queues that use PXP
>> +     */
>> +    xe_pm_runtime_get(pxp->xe);
>> +
>> +start:
>> +    ret = pxp_start(pxp, q->pxp.type);
>> +
>>       /*
>>        * in the successful case the PM ref is released from
>>        * xe_pxp_exec_queue_remove
>>        */
>> -    if (ret)
>> +    if (ret) {
>>           xe_pm_runtime_put(pxp->xe);
>> +        return ret;
>> +    }
>> +
>> +    ret = __exec_queue_add(pxp, q);
>> +    if (ret == -EBUSY)
>> +        goto start;
>>         return ret;
>>   }
>

