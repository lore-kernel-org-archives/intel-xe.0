Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4697AC87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 16:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AE610E01F;
	Fri,  1 Aug 2025 16:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cf2O73Jo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 418A610E01F
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 16:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754066336; x=1785602336;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=GBgJuoATVvTAhqS6g4LdqGAPwUagEQCAndS0LugMBuY=;
 b=Cf2O73Jo2ysEvbGFvIP0ZaZfOyeTacsFICkyF6ie8f2CnHAh/zI42u1b
 nOdehmCu7ElxJwhUc3MK9e1BOO1uKyYIk/5RHJD5Jcyzc919I3iowGYO9
 xatDr6CN4B33HJ9bV1mJRhErEslUvK0Ie/vl4ZsWeacQENthNhvSQW134
 Ph3HNU4brlkGhWA4R7A3Aq7hKsihxl9KocXwQpoyrITkQGsrYX3m3Nyab
 1WZh9NAOF7yGizATwaf30ak172A8wApxMCiU77f8Gei6rTjrG5W697wmr
 MdMBqWglKJHXX2r0NAVUpzZ850R0tUVidmHIJ4UCsJngr7V2ZDYm9dOkP Q==;
X-CSE-ConnectionGUID: CC6OEWe0SweicTav5h8IRQ==
X-CSE-MsgGUID: +rDDA69qTnGEFbAQV/00Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56558472"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56558472"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 09:38:55 -0700
X-CSE-ConnectionGUID: GKqetev9SMCe44wp1A36ww==
X-CSE-MsgGUID: +/JO1pngSQGJiHkDMV/G1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168988250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 09:38:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 09:38:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 09:38:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 09:38:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYutABdI40V6GruhjCidfMYeagElZoLdan04bxb2fE4QbZMUgtmiGoB5AZb8JUMLG7EUnzPEFDdEYNC2fu74ZikutRHRgDsvWSaFeMtEYBYTHzCFsQUNbELmab7rAC3Yt/EDDIWRly4FPRlDY9oXqY4lp1qLTxQymDpW/tmsh2O0TYV/qmGn480dN9XfyPSS6oRlhJS4g2Do5dTB75Sqv8c6u+8Yy+9gCHl0m8+omy2AVnnOyYFE9ypmsn4iJKpVuvcardOHu5A2NAPetXn2Wbes3luAP/LCevZMPp5OCOECfpYUXbuuSZDT4903dpbRc9YQsiihqVyjbBy4q0cO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ulpDuxNVQaNH9H2IYnShj7EtRdE4lMwq29rsSbVLScI=;
 b=vdSem9F7gsWz3Zmq2xqvgtFmRpgD+IZo3CdOrjc49jT7xGuGBa/cVgnFhminHSmVoDRgdzUt+B60rTDyO/AIZ+820GAmjeMxItqf8MkGlH2OJ5CfUdVfU57VmnFpbxplZPk9xnf7jgZD5Dj4fbrbw7drxRp5RHRET5NNtCeXRFCbr5QKKA1hg10SyY/jFEQw+CP+Zk/aV2RA8uzhZMWeqzQ0PTMhL/k7YrATwdES9Q30LWEyjPUO8eaMRrdLTVozIQ1FPybTs97n62Y+jfFHqGKXaZDoYPpKzl6nc9U17nk1Mp5+gA1ecm5vRVpeEKOqjuvQ2VpJkWxIf2EROCqAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL3PR11MB6386.namprd11.prod.outlook.com (2603:10b6:208:3b6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 16:38:52 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Fri, 1 Aug 2025
 16:38:52 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250731220143.72942-2-jonathan.cavitt@intel.com>
References: <20250731220143.72942-2-jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <jonathan.cavitt@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>,
 <rodrigo.vivi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 1 Aug 2025 13:38:46 -0300
Message-ID: <175406632667.2044.15653899817314879579@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL3PR11MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: b6f8532d-f14e-4379-cc5c-08ddd119e61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW0wN0FQdkNLNldkQkl3cTR4YmFRaVRRaXQyM25pSUlSMmVaVmtxTFZBUU9k?=
 =?utf-8?B?alZFaC9ML2hVKzJGaTZZeVB5SjhFdmxGcjJhNUFFZFRzcGoxZUxNWlFMd1ZR?=
 =?utf-8?B?a0FhZjVzMS9JK3FUbFlpSmVuUXlBdWZUdmNqYWVFb2JGbDBHYkx2b0NGallu?=
 =?utf-8?B?azFPdHhJYnZDODhtU3N6WE9NSVE2TTlBUTUwY05leVA3UUluLzI4MTdlS2t0?=
 =?utf-8?B?OEJzUXJtQTlyMFdqTkw5VUFBY2p6RUF4Y01nN0l0Y0VvNUQvbFU1MHEvZmYz?=
 =?utf-8?B?bTlGcldmdDFyQ1A3QWR5WVJaejh0RUdwZ3c1cUlaVzI2dDgwTXNhKzdpWnpm?=
 =?utf-8?B?NGpWb1R4cG5CL1R6Rk9vN0lPRnJmYXlveC93S0s5ZS9hZlhySFNmNTdTTUJG?=
 =?utf-8?B?OGkxZmNZZERhR3B3ZUZ5RjdzSjc5aXhRTlUySlN0NjNSZ2tZNFNCVlY5SnF0?=
 =?utf-8?B?TWxnbTBrMjA2ZkdONG9NUG9ucVF3L29zTzJUbDZuRVVEeU11VWVlYVpBeG9v?=
 =?utf-8?B?bGxaaStRdjlmR3d5Mi9uN0FCM0xoNGx4bDFXMHUrM1A3YXRnT1JPbDdrVUlY?=
 =?utf-8?B?MTUyc2lGZmliaG9VdGM1R3NCcWZyQSt6VE4zZUZjajdPckRzTHBBM3hibkY1?=
 =?utf-8?B?TWpqUnBNaVJNTmpEeU9YOENKL0FBdE5HdHlOMHpxT1dwSTJ5b3hoVW53RXNE?=
 =?utf-8?B?dVo0YlpBZ2s0d0FzN2RNaWdCamc4VDZ1UWVySUovUVo1eTU0aFBMTnA2MUor?=
 =?utf-8?B?ZUpWUTUvWU5GN1BFVjhSeHd0WEE0cFlRRjJ6ZTRiQzBBZXc0b3RqTkNWanRh?=
 =?utf-8?B?M1JaTUxvbkYrWDFVdDFNelNhUEE2VDg0Si95NFArc3hnRHNWQ25xcWNZRGR0?=
 =?utf-8?B?MFFxcUlOWlJFaG51UHNmeS9TbWY3bHp6NGJTOVlQd0U4UFQ3Y3NSaGFsQ1Fj?=
 =?utf-8?B?ZHpzSXltcUphRTBSdDcvejdkR2lNTUhxeWVrT0d4TFhnKzMrM0R1N2pQMmNJ?=
 =?utf-8?B?dUwza0VwOFdTSk1MUjZiallhUy9QNFhoRHFuTTZiSnFwK216ZHhWdUhRdmg0?=
 =?utf-8?B?UFovZW9lWjNnZzNLaGtmb2E1TXhYUlNDR1VYeXlBeTQ4MFU3R3RaRkdIT0FP?=
 =?utf-8?B?VTh1SURENmdDYWJSckRxcVF2TDBmVzQ2Vm83emtQSkVZM25VSWx0VElmWTJE?=
 =?utf-8?B?aEVlTG5CMHJVSE1kYmNLK0xLQW5iNysyUDRRS2p5RFZzL1FubWpYWHRya3Fk?=
 =?utf-8?B?UDJ0Q1U4dEU5bGRSU2V2UWp0bUdWU1B6WTNITi91VG1WNTU0bVVXQkxKdmtl?=
 =?utf-8?B?RDFxVE1KUzV4QTFjYlE1ZS92UWE5Q2IrU0NQQ0JVb0E3TDR0YUFNQWZrMmVW?=
 =?utf-8?B?ckk5TTA5YTlsMTQrNFloV1k1Z2ZEUFkrc2Vnd0M3NVdxTjFKUDA1U1Vic1BY?=
 =?utf-8?B?cUNUNzkzNXg2cGlaTU1HQm1PNllYN3VadjhCNCtkS0xNZENvTlBFV09KcWg0?=
 =?utf-8?B?MEhuOGc0bjFJeG01ekwvcmwxMHd1TklFdlJjeTlSRWtwcGlLQnVhNVYrcnc2?=
 =?utf-8?B?VlVzMWVNU2JTcW5rU2V4MGlpT29vQ0g4L0xZQ0tYczg5QmlZWTJSMFBxM3pL?=
 =?utf-8?B?OWtQQURDNnlwTjN4R0Z3c1RLM2praWNLcm5kclFvNkowNG85cmd6R2x2UkZZ?=
 =?utf-8?B?VUNraWZYREJhQ1FvRStKb3JBRFpwT1BPZmNWUUhCMWU4b3NkSUtzYTRTZmtO?=
 =?utf-8?B?RXRHbVpaeldtYUF2VE8yczJPQU1UWTNnd3dyTmRDczZGbFYrZEtJQWJaMnZQ?=
 =?utf-8?B?ak91M0VucGdDZXU5RDZDT3ZJelhWN1UxSERVemJld21UZWF4b2tpWXg4WFdC?=
 =?utf-8?B?U3hRQ1NkRjNjUm1aeW9kbld2TmtydndVem9sb2lqWUFqRXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEk3VWNHVkNFUC95ZzI1anBJYmRNZEh6TERteDdEZGVnZ3l1Mis4L2NHM1Yy?=
 =?utf-8?B?UHROYkt1WXB2QXYvNGhhRE15ZHQ5Q0piOXQ4LzhkMDc0TmJzWXkzeXAxenZQ?=
 =?utf-8?B?RTdJMFFodjF3UXJCWDhNK0oxeFZnQVUwdVpDTnB1ckVDUzRFeEt5SWFIUW1B?=
 =?utf-8?B?U2srYkZKNm4vWktCYmxEUTR1VzBxQjdUU01kQnhoNUxrUFN1a1daZWpWKysv?=
 =?utf-8?B?Y05Sdm5RWUxjSHg1T0xhdTJ0UCswWFk0cWpkRnkydktxL3lxYVUzaEpEWmJa?=
 =?utf-8?B?WUtyM3lZQjY3YUtuRHpiTCs0b21ZcHJRNWovYlE2bUdCZDNiYmlpTEViZUxU?=
 =?utf-8?B?ZVRJSWVpaGFRSWhZOGRRQ09Lc0JCOWwzNjBKTXduU1dTV2RreXdKNzZMeGs0?=
 =?utf-8?B?VHFQZUJUVXlYZHVyZDRYRFJUZmppVmNkUnZNZGQ1VlNndnBSMGMwSlg5bDBZ?=
 =?utf-8?B?RHdyTTY5c2pZcU16K3Erc1d2QXdYY2VIaXRvQlEzZ215MFJsOUQyKzJiNVBw?=
 =?utf-8?B?djRPVG5tY0VGZE1TSFFjcWZ1UE5oeE94NEVXSjFBMklTdHJsTFgvMEJNWWVp?=
 =?utf-8?B?ZTFKcmVQQlBYaUxseFJRVnZRYnFnZUxLSHBBcW5HaG5vQ29oNDZNNUpPRkdS?=
 =?utf-8?B?bDY0V1dVMzMveFJEZHNDb0ZPYnI0NlptTXdLTzlmZWZGVjdGSmYzZ3JGT3BC?=
 =?utf-8?B?bzhzNzJ3ZWdNYnVsWkpxV2dteklVdVhYTis0TDdvdU9RVFRJc0d3cTZ6amp2?=
 =?utf-8?B?Z1JDTmdhOE83NEVFb0VwYWNsdU5Ja2FXSFlDUmVldVFuQkEzM0ZsOVR5YTFE?=
 =?utf-8?B?M01wQ05LTzJCOUE3OUpEYkdrRGxqV0xTU3RTZEUvYWNyQ1gxd2cxZm9xRDEw?=
 =?utf-8?B?ckZXTUswY05ZQm9IVFErSnFDU0tHVGs2QnpLQ3BQbkFIRWl1WitQaG1VaitS?=
 =?utf-8?B?cFRlQ0p4cUlKUnhOeGFSRXBESnBZQlpuZml3bFkvKzBWRTB1dlhyTGQ3QUpK?=
 =?utf-8?B?K2FrTkZsdUh6b1I2NmFvSG5zUlF1L2VxTTZPTjR4aStJOFMzd3g0UERob0py?=
 =?utf-8?B?UVRZa0RoQ0twejVNbTBhVTdHTkx1MHd1L1ZJVXJ4S3crdWJ2Vm4wYnkwVXRt?=
 =?utf-8?B?YTUwcHhRN1g2TVE4RVUwb2hJL3NURWFoRjQwSGszeFFIb2VSVURMNy9KRXdH?=
 =?utf-8?B?UkI5QzVMY00xRmlCRklua2xURUZmK3VRbTNMcjdzWnBXLzh4L0NsZnZ1TFhB?=
 =?utf-8?B?RzFMa1pnWFViUU1KR0hKUTlEQmZjVGcvcWlITWVoZGloTHV5dS9zUjNQbmc3?=
 =?utf-8?B?c3dxcmxvQ01TNDhiazJhR1c5V1dINDVjSXg1d0UyMVRqQmZFKytJNEc4bmMy?=
 =?utf-8?B?QTk5eXRQdlJydzJzMG0xSXB0SmM2Qm4ramVKTTVuU3lFNHBLeFR5RXJCZWJw?=
 =?utf-8?B?WlBNU2ZVN3ArMllTdUdjNWxyN20vU1BqSjFXRmxONjJvYXRZWjFNRGp0aGVV?=
 =?utf-8?B?SWYrZEk2NXpVd2lSYUJLTnRwb2dsUHdkTVBuSmhUZWdxdDdPZGV0WjRCc010?=
 =?utf-8?B?RkhDZVdrbCtDYUU1RVZQeHYzZVprZmtYcTR1Y2Y3R3Jod2ZsMjFYWnI4Umhy?=
 =?utf-8?B?L3ZHUmtXdUpKZDQrNm9RR1JQWXptTnZyeFMxZXkvM0M5RXlGNXBidW9UbFZp?=
 =?utf-8?B?ZWMrckNGd20yeFhQMWcyS2dxRVpCcXkyNGRpa09obUowSEF2Q09lTkRjQXIw?=
 =?utf-8?B?eTFQeWpkb0lXeXRIeXQzNitpVWtDVWZ1aTBiNUdjMTBBbjJPeVhqM2lvblFJ?=
 =?utf-8?B?aTVDS0ZNb0ZkdDlId1hCS2hobEFIeUVkWkJoeHMvclllN0NnTVpLUCtvNnl6?=
 =?utf-8?B?WFJ6YnozY2x1MEFjdzVMMlJsY2JKNm54WkhBSXFFRHd1MHVTOU9DY1hBMjlK?=
 =?utf-8?B?RUJqd2VESTVLMW55dzYrYXNWV2ZTWXpPVElPblo2Q1JaaWM4aS90S2t5cTRq?=
 =?utf-8?B?VXFTYm85RkV6NGRGNnBkanBvcjIvT3Y0ZStzSlJkM2oxMTRjeVBUUE41dnBD?=
 =?utf-8?B?NWRETmpneGpoZTFKRTRSN0JsNWZmT0hXQjBFRUZUOGhQUThLbmdjbnNiMWVX?=
 =?utf-8?B?Wm5iZUczejhEai9OMmlsLzFkYW1IU3I4SnVsTUhINnpBbCt5TGc4WkpySm9U?=
 =?utf-8?B?SHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f8532d-f14e-4379-cc5c-08ddd119e61c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 16:38:52.3385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZckavkXlEG77sd+raR2CkgBfQVgdYQEPvKHwXsh0NGFpRATGBU+k8gVJUcV8RLB4WE4a4DSZdbgwjvJv3QDbzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6386
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

Quoting Jonathan Cavitt (2025-07-31 19:01:44-03:00)
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
>and 30.03.
>
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.co=
m>
>Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
> 1 file changed, 12 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 22a98600fd8f..535067e7fb0c 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>           XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISA=
BLE))
>         },
>+        { XE_RTP_NAME("13012615864"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(2004),
>+                       FUNC(xe_rtp_match_first_render_or_compute)),
>+          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>+        },
>=20
>         /* Xe2_HPG */
>=20
>@@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>         },
>+        { XE_RTP_NAME("13012615864"),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>+                       FUNC(xe_rtp_match_first_render_or_compute)),
>+          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>+        },
>=20
>         /* Xe2_LPM */
>=20
>@@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] =3D {
>           XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DIS=
ABLE))
>         },
>         { XE_RTP_NAME("13012615864"),
>-          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
>+                       GRAPHICS_VERSION(3003),
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>         },
>--=20
>2.43.0
>
