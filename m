Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB1CECD6CA
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 17:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC9910E634;
	Wed, 11 Feb 2026 17:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y+OvRg9t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286D10E634
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 17:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770830102; x=1802366102;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=6JzDioM3RNytEWQqLtshEnRmGyDspGMQ9nuBt5Vceoo=;
 b=Y+OvRg9tdloX8yjek9vTq3bBqUWgPZjznpqPVvdzLMLW9Bmm/1/0sqNj
 eeGxgdoUfMPYHEZzseSqYDck532h+XxoTDQX8eTuaWkvsOZ8CqveoEW+U
 xwiPJ2WWj9et49xrPOLacHeNKv6nd4nrqvtKdmV1VJN0Czzlm4Bsv/aai
 4/mFEusaCaS30iMbLHk9BGcqBS+Ei2GArci2X4qmvA6IdpUVZ2iLd5vtG
 0HK/PzsCgOQkiqEHUzoXGVNJKuDJ35EUNcFEaXJdF8rzp9BE5WgFtvWC4
 sxkQoW+hS95NIl1281F/LGPJDgRgq24ULWtS6AoKUVhoUabjLGU5pSfZ9 Q==;
X-CSE-ConnectionGUID: pmAKqPjWTiyhXXO/dmGUdA==
X-CSE-MsgGUID: ywPSS5QJQQimEig9WGQOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="59553517"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="59553517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:15:01 -0800
X-CSE-ConnectionGUID: tp928IamTYKjH1pjrj/jeA==
X-CSE-MsgGUID: aOeyQ0ueSG2gCPA2xcz87A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; d="scan'208";a="211219946"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 09:15:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:15:00 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 09:15:00 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 09:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cst3LS1y2nTAbPKHnNcB4y/7+GVQr+0PkJ05afzYK3m+3P/MbRGHFB68WdcbR1XxdYJC5Q7butC83TmDs+zILNUruggSuyDHESitNJctFYmRTRYw5eUFURJ8nb87yK+rNJxe9XSiGZrnuzSZ2dVccpU3Lf2CqGf2TnYZyBHWNlT0IoZ7sCTR8UnkXQJZxUEcQCtaFNcLjcuMv4KEwch2AaH/aluXXoBJsWj/zVmmbSt5ypNs9GnPk07JzCmGaJFPw0/Y5N6/kQmbsY1Plgj+c9ZNBSsdQuoRM6jSFzNtPhc/6uZG6+KQapfSJ366YTDuQgZ22WEac3sBF2b2FlS25A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNEry8JTk9jEOjBhJevZ1zZo96yevcoLPya63p3/VfM=;
 b=a9EKuUdSOabWd42dG/A+FvnsT+LYmAjPBGu+9+2Jb3Stm9OUTeHTGUJHwK9E8izDF3J6uNQNI9wcv44mNFtiP94dBazXQntx6ZU+thm1Z1P+bOHc/fTJ6dlP9dIOreqaLB9ZtjidIfchr0vojEsL1TshD8LzqSwSKlD6hWIBmVDx9RqKGnRfqlfXreuEs6qUm8pusLNs/GTKXFnoWxjROgluvC/f7Ewl0BP2dD0E2zoztoMKPK0Lt3g8zSPHCNDbRnsseeuQP7YqWoQye2y7O2lA5GKdSezIxTJM93Yer4+MWdH/OVWGXWdHrDdnAOjNSYv+X+9V9qM2BkefauY2Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ2PR11MB7474.namprd11.prod.outlook.com (2603:10b6:a03:4ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 17:14:54 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::efd5:501b:c890:26b0%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 17:14:54 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1] drm/xe: Force EXEC_QUEUE_FLAG_KERNEL for kernel internal
 VMs
Date: Wed, 11 Feb 2026 18:14:41 +0100
Message-ID: <20260211171441.3246686-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TL2P290CA0014.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ2PR11MB7474:EE_
X-MS-Office365-Filtering-Correlation-Id: ad6bc01f-7eed-44c5-0892-08de69911331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVhHaytEbDhYL0VHanRhZWZtR1pBRVpzNGtBMFpwSUVxSXNSU20vL2d2OVkw?=
 =?utf-8?B?Z2h2eXViQnUwMVJpeWJ0RGY5Z3kybXI3cnhyR0JnUUlTVVJDbnlVRWpuUThQ?=
 =?utf-8?B?ektiNERGS284c1lqNUFuL0pGbk85TUhpdXRaVzRmZy9mTEd6ZG45OSthaDZI?=
 =?utf-8?B?T1RJWWoxK0RHbDR1eVdDTDBXTlRPZWVaV1dLVWNwY09IZGV6bjd4ejA3eUsv?=
 =?utf-8?B?OUYxRVVWMmVwTHZac0NnT0o2a1JBM2IraG0yQm5oMElQUnhXM3lCN05GRGR6?=
 =?utf-8?B?VVV0aTZMRjRZVnFPZUt5ZmZLdWQrRENPbFZYekhGd1VpOW5udnYzZVl0Zmtt?=
 =?utf-8?B?SmpnYlh2T1dLVU0xQkdYaGNxbzRwVEJHVnZQMWRHYnhieVA4WDFVakpTUEFO?=
 =?utf-8?B?T21WL2MvOVB0TUJNREtyZ1UveDVCNm5NcGE0aktoQkZpVzV2MjlMKzVFWUxU?=
 =?utf-8?B?dWdBdTJjcTM0RmJBOXdXY0hpeHZMRXQwNzFURTRCNEM2VDRGV25RbEkvYnVm?=
 =?utf-8?B?T1FISWpNS1NycC9UR3VMUURpcXNEbDE5MmphMUU4emk3N2M4WC83eU1JYW4r?=
 =?utf-8?B?NmtBL1NzMnFhekxQYzBsRlYxSTZkcHZ3d2FydlBGYWRFVGNwVU9QSUpVSXZa?=
 =?utf-8?B?Mit5TVV2REhvRlBiL3RvUEdBOHk0Ykpob3lXTWRwbk83WW5QQlYrUW4yRUZB?=
 =?utf-8?B?MkhQcGl2c0lEMmExeFNseGh6TXB5UjhiaEpMMnhPSWYzV2hSdkRVb2NRRitI?=
 =?utf-8?B?QWpQUEZQOHpDM29ZUjFpT0pSTUxUcDIrTXhWbVhiaWpjOHAwcjQvV2FSNGhp?=
 =?utf-8?B?Q2VkK0xkWksvUUc0bFlnVHVrM3l0bG8zaWVZWllkenVOQjRFaHUreU5DT0R0?=
 =?utf-8?B?ZHd3eFZKdXhZR0pqY2hlcjVkNGlmVnlmVkpscHFhbnNwcXBRVWtuN2dubmE2?=
 =?utf-8?B?cGYzUVBmZUJ6dFAyeVFIOVZIVGJRb05lU2x0cUNubndTVFQ5c0xlZTIwL3hx?=
 =?utf-8?B?NlFXYnV2Y1lNQVk3UGNWMm9lQWJnd0hLN1BDMWpoVTVjd1dRSDY2S2RuWVI1?=
 =?utf-8?B?MXRyU205T0xHbk0vWmhSd3ladFErU1RYYXlsbHYrem8rNzZWa1l3NGRrVzRi?=
 =?utf-8?B?T3VZUThJUjBKUFcyMkVpTUNzd2JXSll4aFI5eExwT1hUTjMxMWlnc204cHdi?=
 =?utf-8?B?T1ZMUi9oNkRGU1BZd3V4SS9ycURYRTN2SnNqY2NrNWJSUGRSYWgrZ3JhMWdx?=
 =?utf-8?B?T0hrbmJIKzFUYkJMVGpOaG5KQkJCc0xHbUQ3WTYzQW12WGdDb3ZHazBJY1ZZ?=
 =?utf-8?B?Z3R5VTIwcVVPZkRWM1lXM1RNR2lNNG81RW1lUHpNTDF3V21STzZzYThDcGRW?=
 =?utf-8?B?Mnl6NWM4cDlTOGJUL01icHpHWjcvNnRQSlYzOU54UkhObm5ocVdsWTVCNmhK?=
 =?utf-8?B?TFJlUlRCWElNYWE5WnQwSGZ5RFZFdjhjR004VzFnMnFMM2NITkhETi9oYzJW?=
 =?utf-8?B?ZFovNnJlV3B6YjFpM1dCSmRQMmhoc2w3OTJ3R1NPWGtpMkFSNFBTZDhZelRv?=
 =?utf-8?B?QWwyTzJ1OUZ6eVZvTWtKSXgwV1FLaldxQ2pGMXVncDRuemdPOEg3NkFZTGYy?=
 =?utf-8?B?eklRWHNmcFFNQUppTDhVaXVhRVZDc2k1Umg0M1VRYmYrQVhXR29leTRneWNO?=
 =?utf-8?B?U0pMY3lxU1JTVm9pOG9GYlgxekNwUXEwZlBFb1M4VzU4bWNXa1g3T3B3OFZV?=
 =?utf-8?B?Sm9Sbm5GUlNIdE5tUllEdUJGd2l4UTh0NHJOaU1VTENHR0xpQmdSYk5tRHE0?=
 =?utf-8?B?c1BxS3RlRjNPdmUySjlZWFpTQTFLaTJBYzYrOEhGNEJuK3F3cXVZUEE4bGVu?=
 =?utf-8?B?ZmIrYkx6blpmYUdpRkEwSE9HbXNYVzRjLzRja2NXRzkyMTN1OXZ6anlVdkdP?=
 =?utf-8?B?Vi9PVy96MG9rTWVzQVVwb0x5czd2RFZOOUVPaWN1bktGb2p3enFLYzBQTzd5?=
 =?utf-8?B?R0hUT2xNS2pHZ2M0NzFGcDNPNkJuT0cwdW51YlVVZGtyTmcySHJJbFBhSDVE?=
 =?utf-8?B?dThHZzlSaHF6S05nVFAvcGZEditqUUNDS0t3TS9lT2hOVlI5NEY2OXBSSkNL?=
 =?utf-8?Q?ogAI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEx5Zk5oV1RKRFZxSVhvYi9lNHc3YUhGY2JraGE2dWZhV1Bpbk5aUmNhcjVV?=
 =?utf-8?B?MjczY1ZDUzQzY2NWa2orMUNucTMyVU9ZZWs1TTZlRHJoQUIyVG9MWWRlQzZs?=
 =?utf-8?B?YmV1bUtCMVZFckE2c1N2VG1YQXJrckk2b01mdldxcGF0elJxaUJiM1M4d3dF?=
 =?utf-8?B?emZKYStLeVFFL3Vac3BlNXQxMkNVSFFYTEVpdElrYWNucVVHK2dQblJWa2Zn?=
 =?utf-8?B?cjlYQk1mN3BLeUdQZHk5cEdzb1cyWG1kbkkrNzBVVTJUMnNLdm92cDlMZ2Rq?=
 =?utf-8?B?cG5waU1Vd2czTmZWRFNqVTE3UWtxOU1KSzBMbVRMUEgxQWtuN0Q4dE11cDcz?=
 =?utf-8?B?ZVNZZnk5dXJSNHRrZkcrd3FKK3VlMEhrZnRaMUNENnpNYnRpS2Y1NGtDT3Jn?=
 =?utf-8?B?QWd4eTRkOUdYSmlhbEpWS2MyWTQyZ0Q3UjZCMytiamxxUTFvdXJhdkthSjd3?=
 =?utf-8?B?N0ttVkZVT0R6MW1Oc2c2SWhiMGR0V1N3QjZUMkJZcUN5Rnc0dzBlcThBUXlz?=
 =?utf-8?B?aHVqNFk4Rm9FRCtUNkFwOWMwNDB6QmdhNXhLdGFRb0Q5RjZ2SUFXZDB1cDNM?=
 =?utf-8?B?REJhNmFMdlNnUkhoM21wNmZxUlFvVGlXaDJSL2xSZlVhWlJXR2tWUlZuRmxJ?=
 =?utf-8?B?V0ZXZWtUOHkydG5XOWJmVnZaQkZUbFlHa0FXalZER2M4d2JGTDNkNmFKdGdx?=
 =?utf-8?B?ZnhJVE83R0I2dGhxKzBjd2FZcDJUYm5lM1BMNmdKdkxiVDVWUVdYNkN3TG5j?=
 =?utf-8?B?NWU2SzhqN3RYRXprRHdUYytVVFJmc3lnY09uVGpwS0RQQS9wMEF0ZzBnUzk3?=
 =?utf-8?B?Z2RHeWZkK2M2SkhBY09OQmtrSktGdnhESTBCQnRjeWNNdVF0cDhUZmR0cTB1?=
 =?utf-8?B?R25OMFJWb0xYajlMZllhZW9hRTNHV3VOM2JCeTJORnlPTjl6Rko5ZHRvU1Q4?=
 =?utf-8?B?UDV3TkpJbUMrNGNjcExYeUZtek4vUnNxM0FYRDdLdkJDd3hoTHVEU0Nxakgw?=
 =?utf-8?B?NkhUb3dyaitzbGxOWkFnQk50RzQzbGszamZWN1B6Ly9DWjQ3c3hybE1HcHV3?=
 =?utf-8?B?RzBOc1RIOXo1YmM3NWpra1FPWnhjME9CeSsvdlgza2JmMUFxVi91eVdLbE0z?=
 =?utf-8?B?T3NYYlFWbHV3MVhVQ1lMN1g0K0dzZ2RVSHlBeHc3T0pWZzF2UkhoY2krNWgv?=
 =?utf-8?B?ekxvV0hmaGFVVHI3RWtQUFNuSDhKTERZTkEzTk5rZ3MwbTB2bk8wQ3BJNk9v?=
 =?utf-8?B?eG9IRzdsY21nTjB4WDZKZmU2eHpzUTVRSXpzRHpmWTQyY3JKLzd5V2F4TkYv?=
 =?utf-8?B?eHEvamhMczdPS1hXVjJ0V1VkZ0g3RUU1cmtRVXFJcXNxbDl4SWlCTFBZV0Zv?=
 =?utf-8?B?Y2ZiTkdTZUkyc09rdFlvVTFVNkZiQ2JLNEVVSzVnQ01yU0RXZXA3RndDNkJJ?=
 =?utf-8?B?SUhMQU9OMVNTVlBMdCtub1JvUlhwVm1ENk5lUEptaW5Qb3EwTFFhUGtDai85?=
 =?utf-8?B?Q1VnME1VN2R1ODBQYXVKMHFuVVVlMGl3Q0VRK2RMVGxTaFdUTnlKTnpZbFpT?=
 =?utf-8?B?WHlrSDc3K3NZYnA0OExzYlY2UGNoZXNwVnN1SHNTWXBJNXhzZXBkbkRWSURj?=
 =?utf-8?B?dlBCUS9VM0tMQ2RRZ3h6dWRpVVVWamNpVkFPaWZyUk1MenhBbCtVWmdwTUZm?=
 =?utf-8?B?MUU0bXRJdjFuRTF4OU9yZHR4d2w1YjNIWlpRYzJhQm9uUGUwSFJPcnprdWMw?=
 =?utf-8?B?SGNtN2NaUWljZ3BxeTBrQ3ZSYXJkeEVEL2ZqVXRCL2dxQVNWTStFWll4V0tF?=
 =?utf-8?B?ZXM3R2cvZ0pTcFVseld6blNoY2JXNXNNL3FLTTZMdnpSYUJkQzFzS2RkdGNx?=
 =?utf-8?B?UHdtRGw0ZUsxL2pCeEZGMjB3eGhsM3VXdytRaUdndTZkaHptR01aaXd4ek9G?=
 =?utf-8?B?TnFzNGNUNWZyZm9pUmUxcE5yRlhGYzJFcWdHM2tIS0tHVzhqbHVBQXJlbWtM?=
 =?utf-8?B?RUVEUjk1R1dMemRpSFdQUVhXMXBvWGN0aHYyK2xpbktnY05sMDZQR2ZPZ3Vm?=
 =?utf-8?B?c1VYNzJaUmxRY0NmZXZxRmx3dXliRlBiZ2VFRjBsalE5aUVCcXJJb3ptL0FW?=
 =?utf-8?B?UHAwdzAwWGNTQWFsaURsR3VrVFppdkVqTnhsWnlSd0JrSFZVUXc4LzRpS2hO?=
 =?utf-8?B?U0M0VGJqcXJSbHJDSytzT1YraER4NjRHSkhFMFc0WlBPU09CMVloVDFQYnZS?=
 =?utf-8?B?STgzT3pWUUZmODNQcjJmaTg1T21zQjBFQkJHVWc1MEF5Rm4wVEY5UUJxSHpx?=
 =?utf-8?B?dVE2RE9teHFoeWFncFAzR2xydlJpYThLNDdLd1VHNVZOcG5KLzNTUGhJVy9M?=
 =?utf-8?Q?zCg2cPPvQdmGxx3Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6bc01f-7eed-44c5-0892-08de69911331
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:14:54.7761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrhIBPeSqf5tlSpqhadFTOSp5o8dSy4bidSkZo7mkQgG245yaG+2fs2q66DO9vVrlSHfJrbD3wy7Gu7JDPDX3W19DDvBIYOV/SJx0Z0oq04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7474
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

VMs created without an associated xe_file originate from kernel
contexts and should use kernel exec queues. Ensure such VMs
create bind exec queues with EXEC_QUEUE_FLAG_KERNEL set.
Let's ensure bind exec queues created for kernel VMs are always
marked with EXEC_QUEUE_FLAG_KERNEL.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 8fe54a998385..708e8c7becf8 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1657,6 +1657,9 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 			if (!vm->pt_root[id])
 				continue;
 
+			if (!xef) /* Not from userspace */
+				create_flags |= EXEC_QUEUE_FLAG_KERNEL;
+
 			q = xe_exec_queue_create_bind(xe, tile, vm, create_flags, 0);
 			if (IS_ERR(q)) {
 				err = PTR_ERR(q);
-- 
2.34.1

