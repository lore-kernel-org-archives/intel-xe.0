Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE41CC7EE2A
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:02:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B92F10E752;
	Wed, 25 Jun 2025 15:02:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOyIHAFx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE9710E752
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863728; x=1782399728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E5yOy8A1uUbRVp3AroQqouG5LORTjTBuIWdtgbZ9qvo=;
 b=WOyIHAFxvX6+9r/2S4z5A/R6mAFVtV6GjYpsIHcxdSGl2kui2bpVtUgA
 RKhg8L0QNYnijsjPMYoZ3Jv4jFgcBYjYA3UcMuDKiqYGyeqptPN07LaTm
 napLwm5TxGl3rrtc51Bh3i+eMiEIdCSzBXl16UxM4+gJeD76djXEWsuvl
 39VxYc3j4z9O/BaHXv80E0ZJHZQpIZ2smP6rQ2jTIAmfCtea3bIxJTCQ/
 0LGyyxH+GVZZOMQQpNPn0HM0NuAEgpr3Pe1UTTMHqoNOwGlyniQ1p52qN
 v2gL6ShIgFfVwrJUwyuWyf00sk07gNs7ElLv5HJIF10CuCmo2Mo4OZZj8 g==;
X-CSE-ConnectionGUID: 2kH4ShuwTfqSHoJAwhHgHg==
X-CSE-MsgGUID: umbgWIDNRcGy/JyJTzzOoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64494841"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="64494841"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:08 -0700
X-CSE-ConnectionGUID: 9NDd1HWQQnG5YAfsGsbKPw==
X-CSE-MsgGUID: ZCMl4QGtSwOiHAeOzvMrBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="158003041"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:02:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:07 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:02:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:02:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caRJy/4CgImhl2jbgCKNJGZd0kq+fFFLu3H8qfJnx+zccwNRQ7kTC30xSOW2c8DS7LV/cmZnFJYxMVhPHIDbf0+egn2ePrRut4sqPnoFkeBFLjdxhmY1IgfiRW2ZV3/yaQiFhwORxrH/Cwz4ilHpzi3krvYVwYmePEG+quCzNUpzwiVn4r7DJ42VJ3TqsEhG32Fx4Ba5Y9fh5yOK3tHQGYg3lmDtHoqZJpt/D4EqOWnv6mSbOv7NjBaO+5dPTkVzzPKTyRnoTovWH+5Z0MHDEU6ph3FcLrEgx5JKqzzMcqgI5Yw/wUthphLrXrF/ZSAH97jW6TkojV/M06oDeXk4LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMh6SkacUNWcZ6Fh9Iv7W2LDqN3ccR+jl+z858LFXDw=;
 b=EJod5Q5nxiFcpCtsNxrz/oO279Q5eAz4qofbDas27+mvX9nLv/dJf4oBBNt5vLP/82AKD2j6pANSwVLkqBxT04005uH7orBFMp38Yp6kpJeWljNL9MXHB84mbZSbOZ46PWRq1HGYSfARWTP2UoxJ3JUXlht6Kkkg87FNrhmC4LxD8lu8lgWrpL6pq3gmxG+Y2M6fAfUUeIZRYTWeeo9l3AMvuR6VIuOVFoK6Asosz7oalOIlBXAlr5jUu0aehGVvodZaWDlxzF7+BG9B9Mw6p7WurCBGoxuE4GKRiaQ1jY8bQc0TUvgUQC+mNOABx0bm3cmOl+UI0mAeu1PFIrrV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA4PR11MB9130.namprd11.prod.outlook.com (2603:10b6:208:56c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Wed, 25 Jun
 2025 15:01:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:01:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v5 2/4] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Wed, 25 Jun 2025 17:01:14 +0200
Message-ID: <20250625150116.3166615-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
References: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0088.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA4PR11MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f65ca11-c696-4363-e66a-08ddb3f92f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkZlYVlpWW01Wm9rZ0tqaGwydkVkTHpVbnJnM0JnYWpMNGV3ZkdtVlE5N0R5?=
 =?utf-8?B?N2J2YVFwa2Fka1hOcW5rQzBpR2xJSEx6UFBjUGliblgvaW9vUFJKSHpUTGp3?=
 =?utf-8?B?ZFZCWDUvd3ZwYjhpS210bnlieWdsWkttcXA4Nk9PU2xLUS9NSXFPaHBxcHVh?=
 =?utf-8?B?UElBTzk3cGdiUDRCWkxNdGtqMjNrZ2dySkdORTZXR00zZEQ1VmFpd0t2WlBD?=
 =?utf-8?B?MDY5a3E1OFgrUTNQV1Uzc1QrWU55TVRsMXRSek1RMTBtbVh5ejJDL1ZYMjlo?=
 =?utf-8?B?eFllQ0tvd3FlMGNzc25Qc3dBQnZzRkpyd1F0QTlSYUdQdlFLd3lOYTVIZW5t?=
 =?utf-8?B?WUQ0cDJOZi9KelpOMEF4QWlVa29YWVp4b0lEWjdtVDVBMDlnNElmSHEvZGdi?=
 =?utf-8?B?c0kydlEvcXZEQXhXTlZBRXJRM2JtaDFNT2M4cTM3Y0xJeHJmcmdTT0FCcHQx?=
 =?utf-8?B?TThIYXprZ0pVcnlkN3cvV2FmdjMvRkU5MjdkR29RR09DTnJ4cWMwSmF2MXlr?=
 =?utf-8?B?RVhOalBUUkRQbUYyTzB0N1ZRN28rNlhVTjlHbmpwYkVGejVNV1ltbW01VExH?=
 =?utf-8?B?MHBlbXkvT0dVbmszME5KR0pSQjJkZjMwUHQ5Q1IrS09yV0g2b3Ard24xRmlm?=
 =?utf-8?B?bzBvSFZXTXpzeXp5am9iejBzUzhJNXlNaEc5ckVFRnUzZThad1NsSDkxbWI3?=
 =?utf-8?B?ZGVUNXNubVpwanpJZ3lZWm9mT0Zqb2FHMzhrMWJEMnVNd1pZelNZSVRFeDZw?=
 =?utf-8?B?NU4zWEk4emR2Q2ltRGl0Q2xwbkNRaUJMTFFJNjhSc0VTMi9YYUdvWnE3Ymdy?=
 =?utf-8?B?azV1UFVqZ1lOUnFFNkM5R1hVMUJQZEFHSGhxajA4VnQ1SkdnZCtXbHQ0ejA4?=
 =?utf-8?B?dXllQWZNT3llTS96Ny95UTFWTmJrU0lFK1ZxM0djeEFnY3ZQckgxanIxRGUx?=
 =?utf-8?B?RmpTUTJLdzYxcnJNLzhPbURNM0p1OVpoanNSZElrSURqZlBoN01sNG1HZkFR?=
 =?utf-8?B?UXpTdkFoalgzUFBLMVJiWFdsd3dxNDhraW5TS2dQRityVVZoYjJmbjBlNzRn?=
 =?utf-8?B?aytoWUd6SGJiZEZ0ZEFWTXlUY0lYNUVyYnErOUpWWE4vRW5QUlpDV3RPcUlE?=
 =?utf-8?B?S0Q2ZXdCUG9hdE5jQ1QydHpPODdUZUlDMmJiNXFvbnFHd1hMaWUrc1VpSG1W?=
 =?utf-8?B?MVAzRW1LN1JDMmhsQ21tWWxRampIQWI0MXBKS2pGZUtraXF5bjk2WUc1V2NO?=
 =?utf-8?B?YWRVaXpScTlRQWpFR3VLZVpkTE1CMVhQZElIVjFOSVJFclNNOGlmRU05Sngx?=
 =?utf-8?B?MTJCd1VXdmlWaFZzcTJjSFdFQWdMTERGdXoxZHJSdUo4TWo3Qm9nN2x4anI0?=
 =?utf-8?B?MEtEOFd5S1picFd6Q2RTa1hyNi9zRDV4WjVzVWlYbUJkVGloelBxZDRpYjhh?=
 =?utf-8?B?ckp1eTJyK3ZXSjZqclRTOG5DaGlRMWkycjZhYjVnbkh2bWwyVklyTGFCdW95?=
 =?utf-8?B?cGkwcFlpOE1uTEF3S3RvQWRIemJnSWVwbW9QMFdLblBqNzJvb3FYb3pVOE53?=
 =?utf-8?B?Mngya2xuY0FxZDdUSGtna1RCbFJBSE91T3JPM2dvcmY5YXpYa0tBWmw2eHRN?=
 =?utf-8?B?RW5WdzgwTU43Q0NBQS9Hc0QwaXhXWUVEa2lvMHVsV1E5K3pDYzI4ckFhb1ZV?=
 =?utf-8?B?K2NNQnQ1YVljQlZURlBQcmN1WWEwSVZFRmhVdS8rZ3paclpEcktRalVlMHJl?=
 =?utf-8?B?bVpaSEM4b082MFJUeG5jd3ovaVZ3bytrU3VmemNTL1FITnUzREk0MnhvZy9x?=
 =?utf-8?B?d1FibXhTK2hsb3d2c0ZwNHcrSFJpZXVrUTJvelU4eTNGSWtVREdncEJZSGpH?=
 =?utf-8?B?OUFUWWhlcEhaVkZzakFsTUFrMkZnYnNCZmQ0Wk9ySWxpWmQ3RXI2cHdGK3VI?=
 =?utf-8?Q?yR1x4U4oBOs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVFIZ056VHRLNkF3eHVZYnc1V2F4VkY2dlVzbkMwalJuaFNLYUFuc2RhU29W?=
 =?utf-8?B?Zk13VnRzNVpiRHFlV3BleHdqR2pJT3dhcCtJQ0hIcFNxK1Y2TnF2TUhaTEhv?=
 =?utf-8?B?Y0tNVzJ1NG9MQ0dJRURQU2txYTBwT1g3ZHB3dTlUcTZuVVNkV25oQlY2ak9u?=
 =?utf-8?B?UHZBMVZ2S2l4NlRKUzk1SVloeUtXOHhtS0RqRUFnSy9mV0VGNmdPZ2NKeUFI?=
 =?utf-8?B?ZUxBNGZWcHovY2xBVVBkMFRNSlpBV09rWVV5bUY1bzd3QzBKM3cxNnBmUC9m?=
 =?utf-8?B?NFdrcVRDaERrdzZ3TWlvUEFtRXNwbFpYRWJJMWJ5S2VmdzBGT2p4QTVFRFhG?=
 =?utf-8?B?Mk5WUk8yelZhTjRQR2dRYm55NGlCSnpVUERwMU8zajBHM29nbllHMllXTHN5?=
 =?utf-8?B?dXBuZHZQZ2ZDbGtIK1BpdGpNbE05SkRtcXhFdTN0ZEJGK0kwTmZWZUViby9v?=
 =?utf-8?B?ZmdpR2tMbm5LUjFXTkJFTWg0WEE1Qk5xdlpjanExVnM4SU5nZjVTaS9BVVlF?=
 =?utf-8?B?SWFtdjk1MWRQaklFWGV1dTV1MDV6UDBXaFZZbWR2dEJaclJRa0VjNWFFS1Nh?=
 =?utf-8?B?WGhFVTB2dnVlcHN2U2g0ZDNxM2pRMGFpODhMSyttNzFxekIwb29DM0VCdTEx?=
 =?utf-8?B?bUpqQVlPZnNLYVdXVEdWM0FYMUtLU0k1dkZBc2kzeUJsYVN2M0Exa2pkTWhH?=
 =?utf-8?B?VEo3WFlIQ1N4TFNOQS9TMno2WlRDcG5lNnVvbmJrdmQ3Zy9pazZFZk8ybDc2?=
 =?utf-8?B?dEUvQjIrYmltSlpUTk5YSkpyeUpVR09sKzFwUEc2Q0IzUkFwdmhaMncxNkpQ?=
 =?utf-8?B?SEFvZHVybFk3TmdzRFFjcExIUTQ1eXdQS3JmYTRKZWQwYTJ0ZnNrZzg4Y3Ex?=
 =?utf-8?B?WFlycC9tRUJpL3kxSkczbUhoSmtaOEU1QlNRa3JFaVhxWlZBSEF4TGpCWjJ0?=
 =?utf-8?B?MS8rUTZjL0NTUlZVbDhoRTZVdU5wdHZmaHRxYXVVUHZGODkyUy82ZEtBZXpo?=
 =?utf-8?B?d1p1eTkwdVlrU3FJZWREYU96WlhSZFNWRWRLbHIvS3lBd1Zmc0ZyckkyS0ZR?=
 =?utf-8?B?eFM4T3BlVDV1RCtnTEM3MmJqYlRmOTZuc1NLL2NaTktaODFTNXYzdGliOTVH?=
 =?utf-8?B?dTN2YjJZRHorVEVqQkUyTkY0dkxGNTk0MEtab2pQR1k3TkRQNzhody8ybGcy?=
 =?utf-8?B?Y1VUS1haVkh0aFZpOXdBZC8wSVIvUkM0RGpiTFpra29Ud0U3dlEyS3JkMCtX?=
 =?utf-8?B?RWRwaFZQTE1TSlAxcUJoREMwVlNwaC9sYndBME5hSmhERUI3SzZWQ0FDeHdL?=
 =?utf-8?B?QU1KTTdlUlNwVWdBMXgxUkU2WjAvV3VlQk1WMys0SW5nZXN1TGJyTHNsY2ZL?=
 =?utf-8?B?WUthZVVreGhjZzVad2s0dUNsenJ4V1hDY0ExLzJzRm81QUI3V3pkTXZsNlMw?=
 =?utf-8?B?VlVoSVd6ZTAyU2wxSE53a0lscnY3dEQxaHNjNTVaZUplOHBwa012dWJ0d1hK?=
 =?utf-8?B?K0k1aDJLYjd3bmJ0UHVDaDFUU2ptd1VVd3NHbENhT2lHNGM5eExCaW9MZjk4?=
 =?utf-8?B?QjI0TWxxUk9pbVc4bFdJTTFRRUdCTS8rOEoxWUVkTWhpd1R1L1J2YmRVdFpK?=
 =?utf-8?B?MTRleUJueXZzTHZzbE1yZlo3Q2plZHFraFIyQ3ZQNDZKRk5DOG9XSFZMbUZS?=
 =?utf-8?B?RTRCaytMMDlrTndsWFdCKzl1dk00QzBaR1NTZlJTbmExcHAxSGNnb0JMc1RQ?=
 =?utf-8?B?eTVrYkhOSFNrNHNoUXBKVncrV0hoM0lFN0ZFcmFZOUtsVUNMb1VYUjM4RWE1?=
 =?utf-8?B?ZGQvek9hNXFuTk85cEwzamMrenRBYXJ0ZkRZWTE5LzRuTEd6ZTJMMGJwZTlE?=
 =?utf-8?B?TXdpTVIyVmYrVllWZUZGVlZjYXRTTzREV3BJVjc2bTF2WE9ZeEg2anZ3aXJ1?=
 =?utf-8?B?aEx4bGVNYmVFdVJ0TEVjR2FOaDFhU1JLWWJueDVueUlwL2xCeWI1bVVZR1ht?=
 =?utf-8?B?VVFvT1pqNE5pQXppeklyOXkzZUpGTThqRTc1L0xCWHp2OWlkaFRRSHFqcFFV?=
 =?utf-8?B?dGNxWkhVNVBsNHUxTGdnWmZEYzhaYVR1TUZHbHozcDlGcFlxY0VBY0llQm9k?=
 =?utf-8?B?c2RZU0loN1J4SUwwU09LZ1NZTmNCbzdDMjRGbXFuREZVczBoakF1bE1sSk5r?=
 =?utf-8?B?MVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f65ca11-c696-4363-e66a-08ddb3f92f85
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:01:38.4657 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9pk/R0+xZ55EccYXsrLQfL2UvpG+FZ2pQxY/twEKzW0DPD3MPfBeqgWMfXpbKb6wO/uxsLcacHmOuRIOQemOISF9RfwpPf6nX0FPuR7/GCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9130
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  4 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 +++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 64 ++++++++++---------
 15 files changed, 122 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5e846f0bec21..dc8547640d44 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..97b58c0ff39a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..da357dd42546 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,9 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
+						     __tile->mem.vram->actual_physical_size :	\
+						     0, 1,					\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd17c1354ab3..86f8ca6a96e9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -686,6 +686,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -730,6 +745,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..a7bcda67d05f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..c0bd23aaaa23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 26418e9bdff0..98d79c118e45 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -302,16 +302,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -366,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -502,7 +497,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
@@ -516,7 +511,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -679,7 +674,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
-	return &tile->mem.vram;
+	return tile->mem.vram;
 }
 
 /**
@@ -726,7 +721,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
 			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
+			       &tile->mem.vram->dpagemap,
 			       xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 672faa0b67f1..c64a4d1a5bb9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,6 +94,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -131,8 +158,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -167,7 +194,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..7e3980bcb4e6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
-					       xe->mem.vram.io_size);
+	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
+						xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -279,10 +279,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,44 +329,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

