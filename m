Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39214D3B9A9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 08:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E740610E695;
	Wed, 10 Dec 2025 08:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnJf2gSX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F8D10E695
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 08:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765354819; x=1796890819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=iXK+pHlNHov/zwV6QduEIq9LMU6MBNAQyiKI+xdvNIo=;
 b=HnJf2gSX6XPPfpwv9nt9WYuBT3/k2uqJGDK+F21+Y1yDypP2T2zRQsVM
 vx4muwXRruOj9wn5Kkac6er6Ehz7ox+zFXO2yaWYVqrFRlABFgi88LXPT
 nYiOs2Nq8930Y5NbRB/UwzZsFQkkKa3g4iyiCOFvxEjK5DX5V192SC6Ca
 Tzj+mxg5SjJtCLFZQxiGo8MHtXtB3PwRipC33kM5vQ9MtrA8r9i5SA4LH
 nnNy75t0L2jccDly5w7EZ9yHCHVuNrl+Ux9khi5TEn6Y0Xbi5c8CeHu+3
 OL9WeSpa4oKSWyO/Vb+3CmeYwpsPMAluEXum094h+6ZNo07PBTvNBzNN6 A==;
X-CSE-ConnectionGUID: pqo4olaeSzKvIOibF4Mldw==
X-CSE-MsgGUID: ihNfUyYjQaOS9x52wKt08Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71169414"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208,217";a="71169414"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:20:18 -0800
X-CSE-ConnectionGUID: xxkbHqipT5WMCm4GwM853Q==
X-CSE-MsgGUID: WnmBtlZ5QKy0qo2Fq8D9kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; 
 d="scan'208,217";a="201380018"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 00:20:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:20:17 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 00:20:17 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 00:20:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awHdcNyWqsrAl+bCE2gAye1YFz86xF6zwsSbeVNArYzNIR1Jx/4H8p0EXL3zqVtkUJfrEyatj2nnaCDLkLiKqMxkL2U5bMt2D1zpUFWzMRBR8ih+mSWY2mY8X40jt9zO/Ce5Bzeq5cK2eRTaeN4XT8huIEFQsRyL7l0YKScTmJ0lg+y/L6AHpt33wW3fBmDWpdFy5dYzGVZiVDS+XwUTdJqrj98m+8h61orHIoS2mSqmA3MsTN+eMgCYLwtR/XpCECgBTatznF7yyqj2S2SAVNcpdXz3NuQMWylHr5KMugmhac2zbvelM1uT4fJEPVvQYNgLyJ71BJdaBOnBWaf0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1msaL0OSmeUe4HJ6e2em+r4ehdSqe6VMvS+jq2VtiM=;
 b=CoxnGJmoHr8z+Jgb1jTX4Me5Wa8YfHw/sULgyarfwcG+6ZHuQsRwjO9SRUXsVLIDtqknNTDKo84863JWvPrfFrHkdJeUaCTNOWcJ0+TtMhrJMPXzwW9M7e912Nzk+MlFcHewfCakQ+Id0JRhO/M3Pvdpru4jMr9p+orulh/RTTW7Jflo5KE/K29EqU3VQD7yXMbuHy8jgZ6TdbeEQAAwz65w/DxskIFEHfVMcrnu8RmwDACat2TW4fB/VPXRE5vj7NmTozCCMKfraGn3CoTaMd8X4ObVQLHKe26unnl2P4uQSnJcY1kQ6fdGCPpqeJzHeZZCJXMLS9fw3kND197KVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 08:20:10 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 08:20:10 +0000
Content-Type: multipart/alternative;
 boundary="------------njxO2iI2N57yejSnbvZDLJL9"
Message-ID: <25411a0e-aba2-4884-8007-fc2264f0fdfa@intel.com>
Date: Wed, 10 Dec 2025 13:50:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm/xe/hwmon: Read temperature limits using pcode
 mailbox
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251202145013.3273400-1-karthik.poosa@intel.com>
 <20251202145013.3273400-2-karthik.poosa@intel.com>
 <f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com>
X-ClientProxiedBy: MA0PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BN9PR11MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a50937-f15e-4e92-d08c-08de37c4eef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVM5OHJCeCtuZVZtM3VocU02cDRZRVE5c0RFTE9HWkYxeG56RktkWXB2T1pk?=
 =?utf-8?B?K3RZeWFGQmVXSHNCV2R0TkoyVUdUcFJhbW1GaGlWWC9rTzlydmxEd2cvRk9F?=
 =?utf-8?B?N2F5OHZRLzRTbnRDRlhEanUxc056anJjTm53Nks3MFBHQ1ArYmFGRDNBQjJo?=
 =?utf-8?B?SjhzTGxkaVY4NUJCL0tuOGpCQ01ObWVBZUkxQXVUTThWUWJaTFgrQnl2R3Bu?=
 =?utf-8?B?U0xlVU5ySjZhbG9IOTVEdzYzNm9MUFBmTHkwbzhIRWdDMFRNVlBHa3J6Yk9r?=
 =?utf-8?B?YW83c01KRCtlbEQrV0Y0d3Z1RkJjSU1DYUtNMG9vdDdtb3JNWW9xWWdhL29K?=
 =?utf-8?B?VE1xamZhcW1SbXNjNjZiTFZlcVJ0ZG0wQ2V2N3pOUkZPczJVeFJXMFdqMERR?=
 =?utf-8?B?ZWI2UExqb3hkclFqRDVDSnhZR0ZCSTc3Q0Z6eFl5MFhqZmpQY3NDU2M3Y3pV?=
 =?utf-8?B?dmZZRUpKN1kxeEZ2OWVXc3NMN2tlZFFUUXFpVTRyZDhscFp2Zk82T25zaUJH?=
 =?utf-8?B?dFdadGJwZDBHV291Wno2T3kxclhCTG5tVng2WGlzUlIzRTBtaHlZN1RtSDhy?=
 =?utf-8?B?NmNPdVlLWXdQcklFRU1nK3l3TFJ5VlZ6N3VSMVN0Ylp2dXh3KzlITmJjUnRz?=
 =?utf-8?B?T05CSGNDY3RVSzk3SGJxN0pjRGJJV3RzbWNVQlduMmxLQVY5NGtpZjZSeWtV?=
 =?utf-8?B?S20xdG5hSzN4WEJsRkM3bE5hWXpJd1ZMNU5zQkw4cHluWFhoZy9CcXAwRWs4?=
 =?utf-8?B?ZHg2WEREYjRCZHpjVGhHS0dUVDNwWUpjeXFaVVRYVENCdXAyVDlkM3dzYUt2?=
 =?utf-8?B?TnJBQVBQaDE0d0Zva3JURXZnU1hXMXIxNmhsRzJIelBvVmw3WjRpMnRMZzMx?=
 =?utf-8?B?WkgyaWsxTEh0RE9nZkFhZlNYbjJiTW1RNXlDV1dCUDFZNHFudmNVRTJBVitR?=
 =?utf-8?B?UlBycDRiTUpHU0VsLzBsaEtVYW0zYnBjdmJHcXBiMjdRNHN6NHdrZTdBcytW?=
 =?utf-8?B?K2ZDNTdjSVZhbFl6V3BqZjRhb2tkczQvZlh6ckdVQSsxdDBxeTcybVJCSmRT?=
 =?utf-8?B?NnN4WEVFTFVaYnl4Qk9nUThSOU1ISmw3ZkFjSTM1anpXTlUreVR3SUVzOVcx?=
 =?utf-8?B?NVl3Z3NoRkdlbUtjb1YrWkFWZkpYTmJQMFlIL0lGaEY3R1NxTUZJSE5odWZs?=
 =?utf-8?B?T256eER0ZEIvTG05ZXlYWW9oaXprRTh4eHBQcHhZQzByVERFZjZ2TThOUVgz?=
 =?utf-8?B?TzIwaG5aTElnMUJYRy9LUUZBbEZXUnJyd3RtUzBUcjdxYWFlWmNxdlRreTdP?=
 =?utf-8?B?cmpLSEh3U0p1N0JWNTJibkR4a0lBMU5ycTErOUxHNXBGaDVPTXhEMmZYZ0Fl?=
 =?utf-8?B?TUEvNzRaT0tQZFk1Y3FSRlRIak13MWx2Wm5HNEtrZVJnVjl2bkJ2ejUza2kz?=
 =?utf-8?B?cmRTNzJ6d3ViNFBNRVJTYkpJS2s3ajFnbEg1Z01rTWRSd01GRk1tOTBiSVZU?=
 =?utf-8?B?VG1GOVN1UGpKQmxLcy9mOTk5ZTRXemZMNUFaeHlzWWFGRlNneGI2RDFMaUM4?=
 =?utf-8?B?VGZaSklRdUZyUGxKTHVPTUJTdnVmZm5HK25KTUZFMzR5MGpLaGJlTWg4N1M0?=
 =?utf-8?B?LzBhQmp3UHFCcndYem55TVhTa091VDRGc0V4bnNJYVRwc0tTQzdRL0x2Smhy?=
 =?utf-8?B?S3NCbi9lN011dG5ROWo2VjRJcno5c1dIY0pab0FZK25JS2wyQnd0YTJ0ZTV5?=
 =?utf-8?B?bkhaL0xvUkx6dWNXNTRCTzhCZFVwbzRGTEhyckw3U2RHVkp6em9kelVqWU9Y?=
 =?utf-8?B?R0U2V002TTM0YVp1ZDNFZ1h3SXlNV3JZaWZGdExpMkpnZUNOak1IT0JTV281?=
 =?utf-8?B?ZGxqR0ZCd2ZJQmFaV2pDSXNvVmNtcWNkT2pQOUtNamwrdkhNNDJ2RjNGTngr?=
 =?utf-8?Q?zEkyTzJu3XiCmLdGF/VpjPLfutlbOiqI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE5FWmwreHVSbXdMd0xzbFRmeHFPakFiUmtiUG84UjlUSDE4RVNiYTh2Y0Jy?=
 =?utf-8?B?MkpXZkpONkFnN0ppNDQ4ZVdVWXF4MSttZlFYcm02OU10N0lTYzhkbnFJL0NF?=
 =?utf-8?B?OVhMMjJHQnY2SWRKQTVuT2UvMWRKZEhNdkRQVjBqWnVqNlZQdEhIa2RJczY3?=
 =?utf-8?B?WEZaTmVrQ1U1UmxrelZxWTlPUWhXOWhNS2hnM041QnFzUWt1SjdPU1BvZm9Q?=
 =?utf-8?B?VVR4a3IxUVRLSGhiQ0JwMDJYVkE3VWZsRnhoNGpwQUxMeFd0YjVBUFZldTB2?=
 =?utf-8?B?VUUxaW5TREZ2SzRzNkprb09PSlcxRGJkc093SS85Z2k5V0M0a0VuMGI0MUpM?=
 =?utf-8?B?aUFPaVZ3QXlWbTJOeWNEb2E5NmI5bVRlQWpRYzlvZ0FHSEFCSk51dzl3cjV0?=
 =?utf-8?B?T20welR5QllidHZZanBWc2JVRU10YkZkVFNaQnRlWDgrNFFPVmgycFBmampt?=
 =?utf-8?B?dlNTcHVUZDd1SEsxakZxS3lKcC9laWlvWnhaeHBXWDRFSTZxcmp5ZXJBM3FJ?=
 =?utf-8?B?bXF1VXFVNndxU1doV0NXazBlQlBIb295TjVmQ3RGSXFRR0pQd2EwMVA4Q2FR?=
 =?utf-8?B?SUhDdmY4cDZZcVVEcG4vNUZGUHAweElISDZIaFhZRFdySzZ2cGREeXJsb3J6?=
 =?utf-8?B?S1dGU0dqRGRWSUpZeU5pS1VwbjBzVmFnbFF4VThldVUrc0huZmRyVTdsL1po?=
 =?utf-8?B?WGVNb0N2Ym1vaXBNbnE4NG4xYndrRklTM3AveUJFUVhjRmlQZmhXUnZkWVBz?=
 =?utf-8?B?cjdOZjcvNkhZb2t0aVVjNk5oRDYyTHZQUFliNUY2eDZHOUZ3QVVjaER3dEtV?=
 =?utf-8?B?YW0vZUlnOTVhRHpUYVZBczR3Vk5RbHRVWWlhaThaK0l6TWFTQnBXVVdocFJJ?=
 =?utf-8?B?QVNYd0pzMnduZU0vTFVBRHVwN3ptUFlISDVoUUo3RXd0TGswWDUrMytVRG9v?=
 =?utf-8?B?Vld5Rkp3Qml2dzZBNXJyQ1NtMXQ1QkZsQlo2OVRLVmo5aGtpRng3aGlyaitL?=
 =?utf-8?B?MFhyNFdQNjVNMnNub1RuVTZIdXRVSHZ3ZWhQMGdiTlE3M0dNaXZtY2p0bEIw?=
 =?utf-8?B?RDFsa0EyRzRRcjlQTDZHQmdPOVBQL1BtRGJhUmwzOGlDd2FVUlh3SXRqT1RD?=
 =?utf-8?B?VWE2Y2ROL21IaTlVejhOQzFmZ3FTSWI1OHcreXVjYnhBaGV3SVZMaHVRWUcv?=
 =?utf-8?B?VFM4Y1RyTjN6RmN4Q0h3b2VxU3UrUC9hT2ltbzZmVXUzUHZIbXQwOVBzTERU?=
 =?utf-8?B?aE9XK2paRGIzT2pmN1NrTm02bVdScGJObEM3ZXlKS2psN0htWmRBazJsZE44?=
 =?utf-8?B?dzlpZjJ2K3BYaUdEcS83eittOWpncStGTGg4bHcxQ2ZsV0xpSjVqRVhXTklz?=
 =?utf-8?B?NDVOek8rdnBpMkhFMVQvSUdMdkw3bHpzTHQxaG9PWW1jOUlETnY4ZG11clN3?=
 =?utf-8?B?anAxRGJCQWh4OEMyTm5pVEJMcGVRbEZxWm00Y1FERVNEKzZNcUJzRkpFYmNi?=
 =?utf-8?B?R0RIRndUbldsTXpBdmRYTmc2b1RkQ3YyQTU0dEU2alVjNkRpU0pQUjJLMEEx?=
 =?utf-8?B?bWZpTFdtUzBvaHV1TnIzOFpJUFRnUkg1TWR4d2VmNVo2R0lZYmYzcU81NWJ4?=
 =?utf-8?B?eTVTWmNFZTdnakxVRTZkdDRJRU9sZ05sSmtVbWtNVHJTZ1BmNlVJSC9IcVU5?=
 =?utf-8?B?eTYyWW1CcFJnWWpFVDZIbXRzVjF3S1pkSzB0dkFnd1JuUjU5ZlBnVFY4Q01C?=
 =?utf-8?B?b3lKR1FXb0tTbmx5dlBNR3NsaWtJV00vMkV3eGxjc0J3dnJOdTFzTm5MRUE0?=
 =?utf-8?B?TE1QbGpLaGJTSjJWZWd1WVZsc0Q4RlJ1MVhyWlEzd0hWZkZJcVhSdE43bWlr?=
 =?utf-8?B?WGN4YTNIWUF2aGtFMlp4bktrN3V3VVlDeFRIbE9FRndDZ0g5SS9ucmhrbVRT?=
 =?utf-8?B?TWtmYUdIVTllSVhLNm4zem5VNXFyajFGM25ZNWpYUEpXZjNMNEU4SThvMTNH?=
 =?utf-8?B?WDk5QjBXelFHS0lFU1RyMUs1TlRybVBLSklkM2t4UGFnV0lrdUpId2t1Q1Bq?=
 =?utf-8?B?YzN6M0Y4Rmg1NXhYaDVNaDhFSDlnRlZ5anNjZDFZTngzU1JQazY0cVFMZzFa?=
 =?utf-8?Q?3y+Vy9pXJz1P5A4AlWCbEINmV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a50937-f15e-4e92-d08c-08de37c4eef3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 08:20:09.9163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yPE/mDitOJCuMGU1wHCC7nNtMidgvqZEUtxYf1VpyGC3YkLPZXD/L0yeMtSDd2IaA0xSEiSDYLERt63JgUn/iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
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

--------------njxO2iI2N57yejSnbvZDLJL9
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 03-12-2025 14:59, K V P, Satyanarayana wrote:
>
> On 02-Dec-25 8:20 PM, Karthik Poosa wrote:
>> Add support to read temperature limits using pcode
>> thermal mailbox commands.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c     | 44 ++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_pcode_api.h |  5 ++++
>>   2 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index ff2aea52ef75..df1df55c2499 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -53,6 +53,14 @@ enum xe_fan_channel {
>>       FAN_MAX,
>>   };
>>   +enum xe_temp_limit {
>> +    TEMP_LIMIT_PKG_SHUTDOWN,
>> +    TEMP_LIMIT_PKG_TJMAX,
>> +    TEMP_LIMIT_MEM_SHUTDOWN,
>> +    TEMP_LIMIT_PKG_CRIT,
>> +    TEMP_LIMIT_MEM_TJMAX,
>> +};
>> +
>
> Enums are defined in this patch, but never used. Move to appropriate 
> patch where these are used.
Moved to version 2
>
> Also, sort enums in alphabetical order like below.
These are arranged in the same sequence as they appear in the mailbox data.
Alphabetical sorting is not possible here.
>
> enum xe_temp_limit {
>     TEMP_LIMIT_MEM_SHUTDOWN,
>     TEMP_LIMIT_MEM_TJMAX,
>     TEMP_LIMIT_PKG_CRIT,
>     TEMP_LIMIT_PKG_SHUTDOWN,
>     TEMP_LIMIT_PKG_TJMAX,
> }; 
>
>>   /* Attribute index for powerX_xxx_interval sysfs entries */
>>   enum sensor_attr_power {
>>       SENSOR_INDEX_PSYS_PL1,
>> @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
>>       u64 time_prev;
>>   };
>>   +/**
>> + * struct xe_hwmon_thermal_info - to store temperature data
>> + */
>> +struct xe_hwmon_thermal_info {
>> +    union {
>> +        /** @limits: temperature limits */
>> +        u8 limit[8];
>> +        /** @data: limits data dwords */
>> +        u32 data[2];
>> +    };
>> +};
>> +
>>   /**
>>    * struct xe_hwmon - xe hwmon data structure
>>    */
>> @@ -137,7 +157,8 @@ struct xe_hwmon {
>>       u32 pl1_on_boot[CHANNEL_MAX];
>>       /** @pl2_on_boot: power limit PL2 on boot */
>>       u32 pl2_on_boot[CHANNEL_MAX];
>> -
>> +    /** @thermal_limits: Temperature info */
>> +    struct xe_hwmon_thermal_info temp;
>>   };
>>     static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon 
>> *hwmon, u32 attr, int channel,
>> @@ -689,6 +710,25 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       NULL
>>   };
>>   +static int xe_hwmon_pcode_read_thermal_limits(struct xe_hwmon *hwmon)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    int ret = 0;
>> +
>> +    if (hwmon->xe->info.platform <= XE_PVC)
>> +        return -ENXIO;
>
> Write a helper function with bool return type which returns true if 
> the feature is supported and false if the feature is not supported.
>
> This way we can add more unsupported platforms in the helper function.
>
> -Satya.
Added has_mbx_thermal_info flag instead of helper in v2
>
>> +
>> +    /* Read thermal info */
>> +    ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, 
>> READ_THERMAL_LIMITS, 0),
>> +                &hwmon->temp.data[0], &hwmon->temp.data[1]);
>> +    drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x 
>> val1 0x%x\n", ret,
>> +        hwmon->temp.data[0], hwmon->temp.data[1]);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>>   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
>>   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 
>> *uval)
>>   {
>> @@ -1263,6 +1303,8 @@ xe_hwmon_get_preregistration_info(struct 
>> xe_hwmon *hwmon)
>>       for (channel = 0; channel < FAN_MAX; channel++)
>>           if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, 
>> channel))
>>               xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
>> +
>> +    xe_hwmon_pcode_read_thermal_limits(hwmon);
>>   }
>>     int xe_hwmon_register(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 70dcd6625680..16201da0cf6b 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -65,6 +65,11 @@
>>   #define       FAN_TABLE                1
>>   #define       VR_CONFIG                2
>>   +#define    PCODE_THERMAL_INFO            0x25
>> +#define    READ_THERMAL_LIMITS            0x0
>> +#define    READ_THERMAL_CONFIG            0x1
>> +#define    READ_THERMAL_DATA            0x2
>> +
>>   #define   PCODE_FREQUENCY_CONFIG        0x6e
>>   /* Frequency Config Sub Commands (param1) */
>>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0    0x0
--------------njxO2iI2N57yejSnbvZDLJL9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03-12-2025 14:59, K V P,
      Satyanarayana wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com">
      <br>
      On 02-Dec-25 8:20 PM, Karthik Poosa wrote:
      <br>
      <blockquote type="cite">Add support to read temperature limits
        using pcode
        <br>
        thermal mailbox commands.
        <br>
        <br>
        Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
        <br>
        ---
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp; | 44
        ++++++++++++++++++++++++++++++-
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_pcode_api.h |&nbsp; 5 ++++
        <br>
        &nbsp; 2 files changed, 48 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
        b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        index ff2aea52ef75..df1df55c2499 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        @@ -53,6 +53,14 @@ enum xe_fan_channel {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAN_MAX,
        <br>
        &nbsp; };
        <br>
        &nbsp; +enum xe_temp_limit {
        <br>
        +&nbsp;&nbsp;&nbsp; TEMP_LIMIT_PKG_SHUTDOWN,
        <br>
        +&nbsp;&nbsp;&nbsp; TEMP_LIMIT_PKG_TJMAX,
        <br>
        +&nbsp;&nbsp;&nbsp; TEMP_LIMIT_MEM_SHUTDOWN,
        <br>
        +&nbsp;&nbsp;&nbsp; TEMP_LIMIT_PKG_CRIT,
        <br>
        +&nbsp;&nbsp;&nbsp; TEMP_LIMIT_MEM_TJMAX,
        <br>
        +};
        <br>
        +
        <br>
      </blockquote>
      <br>
      Enums are defined in this patch, but never used. Move to
      appropriate patch where these are used.&nbsp;<br>
    </blockquote>
    Moved to version 2
    <blockquote type="cite" cite="mid:f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com"><br>
      Also, sort enums in alphabetical order like below.&nbsp;<br>
    </blockquote>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">These
      are arranged in the same sequence as they appear in the mailbox
      data.&nbsp;</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Alphabetical
      sorting is not possible here.</div>
    <blockquote type="cite" cite="mid:f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com"><br>
      enum xe_temp_limit {
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;TEMP_LIMIT_MEM_SHUTDOWN,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;TEMP_LIMIT_MEM_TJMAX,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;TEMP_LIMIT_PKG_CRIT,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;TEMP_LIMIT_PKG_SHUTDOWN,
      <br>
      &nbsp;&nbsp;&nbsp;&nbsp;TEMP_LIMIT_PKG_TJMAX,&nbsp;&nbsp;&nbsp; <br>
      };&nbsp;</blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <blockquote type="cite" cite="mid:f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com"><br>
      <blockquote type="cite">&nbsp; /* Attribute index for
        powerX_xxx_interval sysfs entries */
        <br>
        &nbsp; enum sensor_attr_power {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SENSOR_INDEX_PSYS_PL1,
        <br>
        @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 time_prev;
        <br>
        &nbsp; };
        <br>
        &nbsp; +/**
        <br>
        + * struct xe_hwmon_thermal_info - to store temperature data
        <br>
        + */
        <br>
        +struct xe_hwmon_thermal_info {
        <br>
        +&nbsp;&nbsp;&nbsp; union {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @limits: temperature limits */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 limit[8];
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @data: limits data dwords */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 data[2];
        <br>
        +&nbsp;&nbsp;&nbsp; };
        <br>
        +};
        <br>
        +
        <br>
        &nbsp; /**
        <br>
        &nbsp;&nbsp; * struct xe_hwmon - xe hwmon data structure
        <br>
        &nbsp;&nbsp; */
        <br>
        @@ -137,7 +157,8 @@ struct xe_hwmon {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 pl1_on_boot[CHANNEL_MAX];
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @pl2_on_boot: power limit PL2 on boot */
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 pl2_on_boot[CHANNEL_MAX];
        <br>
        -
        <br>
        +&nbsp;&nbsp;&nbsp; /** @thermal_limits: Temperature info */
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_hwmon_thermal_info temp;
        <br>
        &nbsp; };
        <br>
        &nbsp; &nbsp; static int xe_hwmon_pcode_read_power_limit(const struct
        xe_hwmon *hwmon, u32 attr, int channel,
        <br>
        @@ -689,6 +710,25 @@ static const struct hwmon_channel_info *
        const hwmon_info[] = {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL
        <br>
        &nbsp; };
        <br>
        &nbsp; +static int xe_hwmon_pcode_read_thermal_limits(struct xe_hwmon
        *hwmon)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_tile *root_tile =
        xe_device_get_root_tile(hwmon-&gt;xe);
        <br>
        +&nbsp;&nbsp;&nbsp; int ret = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (hwmon-&gt;xe-&gt;info.platform &lt;= XE_PVC)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENXIO;
        <br>
      </blockquote>
      <br>
      Write a helper function with bool return type which returns true
      if the feature is supported and false if the feature is not
      supported.
      <br>
      <br>
      This way we can add more unsupported platforms in the helper
      function.
      <br>
      <br>
      -Satya.&nbsp;<br>
    </blockquote>
    Added has_mbx_thermal_info flag instead of helper in v2
    <blockquote type="cite" cite="mid:f805573a-cd4b-4ce1-821b-7f28aae532d2@intel.com"><br>
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; /* Read thermal info */
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_pcode_read(root_tile,
        PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;hwmon-&gt;temp.data[0],
        &amp;hwmon-&gt;temp.data[1]);
        <br>
        +&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;thermal info read ret
        %d, val 0x%x val1 0x%x\n&quot;, ret,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwmon-&gt;temp.data[0], hwmon-&gt;temp.data[1]);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; /* I1 is exposed as power_crit or as curr_crit depending on
        bit 31 */
        <br>
        &nbsp; static int xe_hwmon_pcode_read_i1(const struct xe_hwmon
        *hwmon, u32 *uval)
        <br>
        &nbsp; {
        <br>
        @@ -1263,6 +1303,8 @@ xe_hwmon_get_preregistration_info(struct
        xe_hwmon *hwmon)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (channel = 0; channel &lt; FAN_MAX; channel++)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_hwmon_is_visible(hwmon, hwmon_fan,
        hwmon_fan_input, channel))
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_hwmon_fan_input_read(hwmon, channel,
        &amp;fan_speed);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; xe_hwmon_pcode_read_thermal_limits(hwmon);
        <br>
        &nbsp; }
        <br>
        &nbsp; &nbsp; int xe_hwmon_register(struct xe_device *xe)
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
        b/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        index 70dcd6625680..16201da0cf6b 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        @@ -65,6 +65,11 @@
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FAN_TABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VR_CONFIG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2
        <br>
        &nbsp; +#define&nbsp;&nbsp;&nbsp; PCODE_THERMAL_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x25
        <br>
        +#define&nbsp;&nbsp;&nbsp; READ_THERMAL_LIMITS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0
        <br>
        +#define&nbsp;&nbsp;&nbsp; READ_THERMAL_CONFIG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1
        <br>
        +#define&nbsp;&nbsp;&nbsp; READ_THERMAL_DATA&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x2
        <br>
        +
        <br>
        &nbsp; #define&nbsp;&nbsp; PCODE_FREQUENCY_CONFIG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6e
        <br>
        &nbsp; /* Frequency Config Sub Commands (param1) */
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; PCODE_MBOX_FC_SC_READ_FUSED_P0&nbsp;&nbsp;&nbsp; 0x0
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------njxO2iI2N57yejSnbvZDLJL9--
