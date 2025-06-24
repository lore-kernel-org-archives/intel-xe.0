Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DF1C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 15:39:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F2F10E5F1;
	Tue, 24 Jun 2025 15:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5LNelA5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24C310E5F1
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750779568; x=1782315568;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IGQTJNjKR6fvmEYWyJuR3DEz2SofnOxg9BQ1YUvS/+I=;
 b=N5LNelA5nBs5g1CG0l502b4Yo6tu/tcwPL7wq0S4Sg3q+ffsBZNfuhrH
 NVaKkCuMdJK1zavaLLESgwGa93erQ7Sk2qCIGehKblZFqpI+uefIt98iC
 HTfVYjN+pFqqD4k7/P/bXNlELHRONXPfmJwSCnNKZoLMJ4Lq//cQn/bg8
 r0A3QpUa8Spk5lOXLJdz3sLKdTyer3dbozh/SObBJ96XuMrTDYInmIrpp
 J5yG9Hy9gjUsCQqaSUFvlp2iOcqE/1RFc65Jt+pDzqHsSSe5GGtp/Te7R
 cbaXGsotPfgO0c6rnDKApFANxS+1rcffBbHnU4YNmgEFV83lqY/Tg87XJ Q==;
X-CSE-ConnectionGUID: jrHQEe2qQVqzGRDl6X4J2g==
X-CSE-MsgGUID: oxpBiVscRY2yFcyzOcMTOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="78450230"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="78450230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:39:19 -0700
X-CSE-ConnectionGUID: vgTtJhK8TD+5kS3o/Skicw==
X-CSE-MsgGUID: xxsLXXgTRfuKlxMBb1VbgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="152448820"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:39:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:39:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 08:39:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IyUgCJBuqCA5JB0s9oDOZUGfgbWFPKiESC9HvKG7f5grN77TvwWQyQx6Teuq38GcRnl1Rm48m1N0K8169stJ1OuQkvGIbyzEGTTX9eGpHAZBakd3t+K88BDVFVgHas3Y2BJ6j8yMXW66MgpiRK6xJrXTgL+FzCkrvEQxUXSlFEfaHmR0QczMbLDOe+SqUf4MB1BwR5nH8C05DieWPaamC4XEnQ7P7m0YZj2s1dxWNkBuCJ5kQRXrZds4vE7txjSH8LwLJ7eOlddd+c4aZW+E+7TcMeQ16IU3Rltz7qjId1UF+tH0D7xJp3uoTmsyavLKY8WPV8FSm7CiBlAfSPhm5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmo55hDSIEzDs6jtpLwoFnXdOibtYCwfUW/lMbkau8c=;
 b=T0AKVfSqxMUii5iM76az9BQi2M+1jfO47VzyLQYoc0YkG++jLzJHCDD0qwRzGtTco2BsItLLyQxO5WnFP5ZCzlgVFlGx0Gw1ciyi+Hc+dAgqs+MdWY8PDGFR4vVxsYXFm5zZZ6W4HtWD9VwO3FovscoxcBQKEcdrcLqoy5HQ/gTAYemxgae/36meAjphLC4JBzpQFGAotuud58HikgQ9rYWZObCsAvQOpzIMnBl6i86eyGRGzfDfbiJ+nNogW6lLrTtVGO1Ffac5eZLv4zg6GZzTkhuMdkZI0yhbf+wE+Rh7yjQEmeLPcHkWBRPfOR8lJi+nKd34wFCP0960WfaTAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7122.namprd11.prod.outlook.com (2603:10b6:510:20d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 15:39:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:39:12 +0000
Date: Tue, 24 Jun 2025 08:40:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v9 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aFrHA26oGpfD99b8@lstrano-desk.jf.intel.com>
References: <20250624100010.12254-1-satyanarayana.k.v.p@intel.com>
 <20250624100010.12254-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624100010.12254-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR13CA0111.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: a6514586-bbb1-4ec5-26a8-08ddb33544bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTF4R3k3TU16OStRT3IwUUpEdlZSTmdZTDExWDNibmVnM2RPY05DMjJPcXpk?=
 =?utf-8?B?MzJvYU9vSDJUVGdDQXY1UEJNdkdrOHA1RmRYR0lvOW5MYWNWUVNrQTdqbG5j?=
 =?utf-8?B?THh2ejUwcmk4bmp5WTRsV1BiekM4WUMzaVM0OUE4QUM5aTBlbTFaejBUNlVz?=
 =?utf-8?B?SWc5QmVjMWZVcXc2d25WZi9PRjdmNlo5TVozWVVwQ1p3dFRPWnJ2Z1U4U3N1?=
 =?utf-8?B?bnpIUkwvbEtqVW0vdzlJdndmMGFVZ3VWRlhFNXpXL2ViWVpXSGd6Sm5VRERz?=
 =?utf-8?B?ZU9nbDlteU5uSVFlN2pNeHI2TkVJeDBPdTFiM2JwZU9ER0ppU2xuVG04OGJE?=
 =?utf-8?B?aUdwVEU3TG9zN3JsbU9CNEpjQlIxWlNXaUpCUVZsejVTTkx4OXAvWVVwS0Fz?=
 =?utf-8?B?R0xjeUNHdWF2U2lqZ1VISFUyZWVmK3liM3htMlJDZEpJSE5RcXFpVEJ2dmpp?=
 =?utf-8?B?V3BUTFN4TUxDaFVvcUI5VDJ0WjB3N2J2L2k1U1cxcHJaeWJtTThMVFlWS3hG?=
 =?utf-8?B?KzBNVHFnclFta0tSMkhsV0p1enc1THpZNlhsODVqQ0wzSE8yd3o0OEowNWVn?=
 =?utf-8?B?bnp1bFBuMnBlb1J1QjBUMGlJYkZvTW5nalRocnE5V2t3Z0ZiTFZmRWFQUEJO?=
 =?utf-8?B?Zmt2KzN1RTQyUENGYUZ1SngxbzBsL0ZCaFhpQjdzWlVvMXZSYWxnZGc0MlN6?=
 =?utf-8?B?eU80NHVVRWdNajFONDgyVElJSUtacGF1ZmNteERPdklxRzlXRFJpUE1TRklB?=
 =?utf-8?B?UTBLSDk3dzQySGErdkJOWkU3VFRSZFJPK0xQMk9Xc2s3eVYyd0d4UVUwZFBV?=
 =?utf-8?B?NThFK0cxbE9LTC9ZZk16WDEvanoxNE9zOWtWZTVLQ0tzUHpBcmw3U3N5SUdX?=
 =?utf-8?B?NER1OGFmN0tSMCtUM2Via3lDYTdvSjduZ3Z3UUo5YXB0dGsyTjZzRFdIMjFV?=
 =?utf-8?B?YTZzR0g2aWFwSC94cDFSMzRBaFBDWXZBMHBOSmR0bHpxQXhjS2FuOGdOTGdm?=
 =?utf-8?B?UCtMNUVSaDlnanBodS9RU0pFaEdpelYwVzZNa2NUanFVRlF5aDgwOWR2Nmlv?=
 =?utf-8?B?L2pma1hhbWRJY2p0RXR1TUg4V3ZOU2taMlMrQVA5NEFUZmJxZUNKbXk5c0FO?=
 =?utf-8?B?bEVQT2t4YmNrQkZtcGxrckU5Vmw3bnJEV2pQd252d2xMMU9zRTU5dGVyRmVQ?=
 =?utf-8?B?TE91ZjJSdXZ5MGo0RXZ3V0NkVFJDdVMwZmQvZGhqNDU5azd6WVNlNDV2Y3Jr?=
 =?utf-8?B?Vk96b0VPZnFGNlQrOFN3cmhkV29zR0swNFR1SXhLR0tpakVKUzdXU1Rqd0lS?=
 =?utf-8?B?azFuOUNWNUo4eDV5MXhwbk9ZQWJ2dlgyVmM0RWVmV2NuNjdLL3k2ZmozcHo4?=
 =?utf-8?B?dDM0WS91VzdFcGt6SVZ6TDNJb1gzUkU3anhGdU5iWENUTjdPdm9hWnQ0UStY?=
 =?utf-8?B?ZEptWllLOUk4WEM1bUZYa1QwODNSelRQNlJnUEsxQzliOG41R2ZycGRmaWZJ?=
 =?utf-8?B?Y2ZpZWovQlJUcXhzTHZlYkhITnZLSkswY1I4Q25tZ2lUMVhBOHJ3dG5ZMUVK?=
 =?utf-8?B?U0lCM2hFbFBYSzZmdmpZbUJURExqYnFmblViUE9menF4VWwxNzlsRG5xNGhj?=
 =?utf-8?B?QmdmeHhUTFJ1Y05LbW44LzBYZ2dNYXFWcVBhdDN3YzVNOEs5aVRuNXlOYWpp?=
 =?utf-8?B?RzFkZlo1SnZOR0lKOW9DVkg1eS92eUpzdkFHdTh1alo0blYrSzV4WFRsOHdz?=
 =?utf-8?B?YU9vZzUwQ1ZMWEpQN3luRldXZXpuOXJmWFkydzB2REU4UmdsUHJqcmx1Mk1O?=
 =?utf-8?B?Mk9YeEZZaHBLUENuNWc3cXpmYVBxaUVXOVgraDVPektZaHlBMnlXUXJCUEVu?=
 =?utf-8?B?eW5BNUdmMlVyS24wNnl1SnFqbFVZcnR0aGtmeWhvWE9yL3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZrQm51MHlEL3BqOGQyT3RKUDFsL1d5eGthNGhXcmwrSFV3NUJHekFlL0ly?=
 =?utf-8?B?Rks4L3IxU0VoNTIzYmlyTEc5blBKcnVVK0FPZjBPcWVpemVkeW5zZC8rS0FM?=
 =?utf-8?B?TlRCVS8rMThzeE9jenlJZ2gwUDk2YjhzV0ZOUUtVRXZIdjR3c1NGR3hUS0lM?=
 =?utf-8?B?bUl3Y2hvRUFlQWFna3h6SnQrRkRCbFd5czFzQXZWNjZTMit1VC9xUGppeVg0?=
 =?utf-8?B?SHRVMlJYOUhsdTNRUy9ta044T3N1bWZEUjhCbE1Ba1VDK3VoekJpMWNRY1Nx?=
 =?utf-8?B?aHNDZmUrZmV4Ulh6amR1bDNGVEZmMUlPZW1sazRKTUJSYitvdmtpbUlQTkEw?=
 =?utf-8?B?SWpBbFNtWnY0bG9vQkFzdU9PTnpaUVVNMlY4L1FDUGFFS1FmcVFtYlROZTla?=
 =?utf-8?B?cVNnRHRJeW1aL2dTQk9YcGxnL0tXKzdjalFYMG5VMjhPZFZYYnhmMEtTZ0tt?=
 =?utf-8?B?VDBKNmNWNHR6aDdCcFdxVlVlbGU2c2FTTXZ3c0JOdkZxeXhVODUvUlI0a1Rx?=
 =?utf-8?B?QmwxazQyNW85WXREUjc2SHk1SVQ2aVdIR1c0U0syTUF6L09zaXZQRjFvSEND?=
 =?utf-8?B?T3QrMm1lbm9vMm9uMmpBaEN6dDBhUTBLNy9mSGVicGJMTnB4dkJEUGFpd21B?=
 =?utf-8?B?TDdEaXJWaG9jWTh3YVl6QWlER2lPdWdRUWhnZGFwK05FQkZEMFg1RUZUanZq?=
 =?utf-8?B?N3VnZHNzVzF6NysxREdvbkJQMFB1YTY0NG55SnV4dENybVRKelBIZDNQTnY3?=
 =?utf-8?B?TGhlUmZvdUlndS9qT0ViZHpHbWt3ekNJZ2twOWRuQlc3Q1RXeGIybXdXclpM?=
 =?utf-8?B?UmRFR0YvUHpoRnd4M2JiaU1hVnNWU1RoMndXeFR4ay9DY1lvQWphOGV6a3l3?=
 =?utf-8?B?b0dZSWV1UVoyNUV0MWZrVUxRaUlkUHBwMmNXNk8xRTdZNzYwOGIwTDhwUVZy?=
 =?utf-8?B?eCsxaUJ1a2tkejVOQ1FKeGdXQ09pUWVVRFFtTEo0a2pFWDg2Y244bzU2QnpW?=
 =?utf-8?B?UEVMU2hwam9HVkowZU54YmtyL1ZvakFjaFZOTWkranFxcU5hejZYZGF6ZlhQ?=
 =?utf-8?B?bVV1RjR3Tm1ZNnpoeHVnZjhHWTNKWWdlUHZCZjBCQ1dIZ01LOUVZS1laS2Zv?=
 =?utf-8?B?YTJod2F2REhtQnBoWnZkRm9iemk0UlJQaHhlbTJZdkJRTzhPd0oybkdqN21K?=
 =?utf-8?B?dHd5cTFVQXpRSW1OR2REVERIR1pMQk1sb2lFQ2VZdDNXRTduM3Q5SzFva0pT?=
 =?utf-8?B?SXBLT09YWTR0RzBiOVVkUjZrR3BVRkJBd09uRHRLbGt3YzRkaWVsdEdPbEdx?=
 =?utf-8?B?cGlJMWErNXY2am83L3RuQ1A2NFZ6VDFWK0I5Umw5Y2owSThqTHp5b0dEN1FN?=
 =?utf-8?B?eTRHNThUNEd5UnJBRXU0SUt1Zk9qdFpoS0JjQ3duejd2YlduS2VNV0FHZktv?=
 =?utf-8?B?bGJxd3dkU1VNRTlQZjREWjNzYUdNckRPMmRvQ1pJbFpnSlhySHA3YnppbTdw?=
 =?utf-8?B?TlIrUkljelFxWUtwWC9JZURxWVNLT3FVcUxEZEcveTNrdHUvV0RJNDFOYks3?=
 =?utf-8?B?WldQUWh4MnlqTFRGajJjMVkxNVg3M1d5K25HTUZ2djR2ZytSYzZYaUFYeERG?=
 =?utf-8?B?UExrOUEzbUxTYkJIVGZINE5FN1hsZ3M1MTVWdW1WSkoxOU10SWI2MGJTNkRQ?=
 =?utf-8?B?cWFHcFQvVkhEclpEUHpwcUFqb0s5eGE1Tmo3cWE5SmtTS0YreEIvSUhjZVll?=
 =?utf-8?B?WXVuNFJuZ1NvM3BseGYvdWYxTjdWTlQyYTI1dnRadkQwcExDeVhBMFdrdHRv?=
 =?utf-8?B?VmYxbTlYdWJsSzNGOFZuYzRSc09zVWUxMUZnbXc1YUdlald6RlZDUHFSZ29M?=
 =?utf-8?B?Tm5FSVNsRWNXVnVVclFSaHJPNk1ZeHJTeC9yNWsyR3NrbnJnenVEckNOaUcv?=
 =?utf-8?B?REUvcmo0a1pub0V3b25VejJQZ3pmMWdGTTV5QnJPWFlYWUcvYWY5dDFQYTli?=
 =?utf-8?B?em1rWkNjaWFnalJQVDhmajM2bll5eC94bGR1UkZEWEI0Z1ZNNXZuUFJTd1Zw?=
 =?utf-8?B?SGplU2JBelV5UGgzRnNIMGhxNW1hdGVvTGc5L0JNUVpjRWpYU1lFK0QvZDRR?=
 =?utf-8?B?Vi9HTytjVjhzSG5LR0llWDFaU2t4R3N3bXNDNTlSS3RubUNzY1E1amZYUTJN?=
 =?utf-8?B?alE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6514586-bbb1-4ec5-26a8-08ddb33544bb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:39:12.6291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLmi2BW7KDwafb1d861B1XPMIrRtVssLY64ZT/R1s9SmIY++NXhXO1uJl3rR7au4+bdWO+rRVAJtNVxYbNubUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7122
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

On Tue, Jun 24, 2025 at 03:30:08PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> ---
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V8 -> V9:
> - Initialized CCS read write contexts for only root tile (Matthew Brost).
> 
> V7 -> V8:
> - None.
> 
> V6 -> V7:
> - Fixed review comments (Michal Wajdeczko & Matthew Brost).
> 
> V5 -> V6:
> - Added id field in the xe_tile_vf_ccs structure for self identification.
> 
> V4 -> V5:
> - Modified read/write contexts to enums from #defines (Matthew Brost).
> - The CCS BB pool size is calculated based on the system memory size (Michal
> Wajdeczko & Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  19 ++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 208 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  45 +++++
>  10 files changed, 336 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index eee6bac01a00..853970ab1314 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -141,6 +141,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o \
>  	xe_tile_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index e160e7be84f0..b7922668741c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -929,6 +929,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6aca4b1a2824..1b52db967ace 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -235,6 +236,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..404844515523 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +

This function will blow up on the non-root til as bb_pool will be unitialized.

> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;

An easy fix, if bb_pool is NULL skip the printing.

Other than that patch LGTM.

Matt

> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..87911fb4eea7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_VF_CCS_INIT_NEEDED(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..9000d618978d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gpu_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |       Register save LRCA     |         |
> + *      |           |                     |           with Guc           |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |       Register restore LRCA  |         |
> + *      |           |                     |           with Guc           |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-------------------------    |         |
> + *      |           |                    [ ]  Allocate main memory.  |   |         |
> + *      |           |                    [ ]  Allocate CCS memory.   |   |         |
> + *      |           |                    [ ]  Update Main memory &   |   |         |
> + *     [ ]<------------------------------[ ]  CCS pages PPGTT + BB   |   |         |
> + *      |          [ ]<------------------[ ]  cmds to save & restore.|   |         |
> + *      |           |                    [ ]<------------------------    |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VF Paused -------------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |CCS save |
> + *      |           |                     |                              |completed|
> + *      |           |                     |                             [ ]<------[ ]
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VM Migrated -----------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ---------------------------- VF Resumed ------------------------------------
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |  Notify VF_RESFIX_DONE       |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |restore  |
> + *      |           |                     |                              |completed|
> + *      |           |                     |                             [ ]<------[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |  VF_RESFIX_DONE complete     |         |
> + *      |           |                     |       notification           |         |
> + *      |           |                    [ ]<---------------------------[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      :           :                     :                              :         :
> + *      ------------------------- Continue VM restore ------------------------------
> + */
> +
> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> +{
> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> +	struct sysinfo si;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> +
> +	/**
> +	 * We need below BB size to hold PTE mappings and some DWs for copy
> +	 * command. In reality, we need space for many copy commands. So, let
> +	 * us allocate double the calculated size which is enough to holds GPU
> +	 * instructions for the whole region.
> +	 */
> +	bb_pool_size = ptes * sizeof(u32);
> +
> +	return round_up(bb_pool_size * 2, SZ_1M);
> +}
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	u64 bb_pool_size;
> +	int offset, err;
> +
> +	bb_pool_size = get_ccs_bb_pool_size(xe);
> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> +		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
> +
> +	offset = bb_pool_size - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	int err;
> +
> +	xe_assert(xe, IS_SRIOV_VF(xe));
> +	xe_assert(xe, !IS_DGFX(xe));
> +	xe_assert(xe, xe_device_has_flat_ccs(xe));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		ctx->ctx_id = ctx_id;
> +
> +		migrate = xe_migrate_init(tile);
> +		if (IS_ERR(migrate)) {
> +			err = PTR_ERR(migrate);
> +			goto err_ret;
> +		}
> +		ctx->migrate = migrate;
> +
> +		err = alloc_bb_pool(tile, ctx);
> +		if (err)
> +			goto err_ret;
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..6dc279d206ec
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_TYPES_H_
> +#define _XE_SRIOV_VF_CCS_TYPES_H_
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> +		struct xe_device *___xe = (xe); \
> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		})
> +
> +enum xe_sriov_vf_ccs_rw_ctxs {
> +	XE_SRIOV_VF_CCS_READ_CTX,
> +	XE_SRIOV_VF_CCS_WRITE_CTX,
> +	XE_SRIOV_VF_CCS_CTX_COUNT
> +};
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @id: Id to which context it belongs to */
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
