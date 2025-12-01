Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90504D116F1
	for <intel-xe@archiver.kernel.org>; Mon,  1 Dec 2025 12:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D38510E138;
	Mon,  1 Dec 2025 12:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHwgFZh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94ABD10E05B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Dec 2025 12:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764593977; x=1796129977;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=J1S4t/SsxDERGeSDf7J7G6yJnzEVmmPdHJIjB/1c/Cc=;
 b=fHwgFZh7KRpK0cFgwMwf0APqqTFcteJPOaFYvyrv5wzZTKrnsUArYhEj
 V/+Idq+hLtE/vMkyFYLtzrkKyFBx09sG3GSlH4xlAPVcb70XWrmmpZqAI
 jpK7C1RVl/ar5JNC/D2fcClxq16+NyJLpBzcWKA7EK1Z4SubL56rQhdVp
 FR5xjlxSAxW/HJtFOm3ZkGhymEcfouF5QNrrsDrRNCOJs+h29yursDcXq
 93knJEIWg2sdmlqKMskXsh2nD/t9NRcTVOZxnikf8WzeDZQv109tMZrnS
 kP5iUD05btT4RHsoi2av10KWS1OuCoie4aj78wwz9uWtD04k/A1Z11FXR A==;
X-CSE-ConnectionGUID: OVLAPPPmRfaYlk360FESAA==
X-CSE-MsgGUID: phhihs7QTYy+606qV78E/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66566543"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66566543"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:59:36 -0800
X-CSE-ConnectionGUID: DM9+IbOSTbWuu/hw8bA3LQ==
X-CSE-MsgGUID: X5gETnJBRWSHG0I3hw6/3A==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:59:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:59:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 04:59:34 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:59:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcrovCmRXPj3GpWK9ExWPloiNpBJEUHJrv0VqD/7qYYpyzLGYb9P2X87b8MmFfd9q2zmurN3Sv+YudzbEXzWCs8CfLdawdp9CUfNaXXZqbspJmxOf46QD0WAXIQ9ywFTLNqYOLOC8aBeDUjIL1/7KgbJcBELq0GI6nRf48AMRfYxIre1M5QRrI1EQZ714PhAeMjaLOMdMlTcIp9L76GZG0lMA1atd/W9kNDY/R3Kmddav/khJkY4g7k+MRBVN/6om8bPw1iZ2cvQz55oXzBgRT2NKh/UaeCZos9d0KABrQHKoRCBq2gtlWw8dpa4nl2rhp7v5420xT/a+9grVC3B6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YnYlQ0aDO7lbiIKIzA2uwYRHPAb3AndfRWbUNR3qhMs=;
 b=wU75c3qBRRCZtJzIidsW6suKvApVirYaxk43jtDUv36Q3YVYMHYAE7RjH6RaZU+S78XIPu0SoR2eC0MuxYQ908tfzpwcwfZFgXf/1wE+0H6uBUZpG5TSa7Kx7ZNzXCAz52h3Zfpd/Mi7FQYfwJs9TO3+SNt64QuTFQXR78/PYeSURpq+U5IkzmDHBtlDHC4SpixumLwjlgssVS4FzYLioTD4+LmMCDO+/Ucv0tFeI6T8H7IpsyAacg1vp0jjHiTtnGncpVTc2Zwg0qdUt+e538BSk7GLCB63AQbGpd3y8kfjyz1isAnm+B8CYaQVcezi5MK06b2Mghc/kAu7Er20jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:59:32 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:59:32 +0000
Date: Mon, 1 Dec 2025 13:59:28 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Add tracepoints for VF migration state and
 data transfer
Message-ID: <qj3wiyjbq7nqdpmyzp5lzqxvhas5qrkix5wrfbt36v2m6unq7y@ujvgcavf52xm>
References: <20251127104131.591299-1-marcin.bernatowicz@linux.intel.com>
 <fcce0fd8-330e-4a69-9d11-9bbd85cf04e1@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcce0fd8-330e-4a69-9d11-9bbd85cf04e1@intel.com>
X-ClientProxiedBy: VI1PR0902CA0053.eurprd09.prod.outlook.com
 (2603:10a6:802:1::42) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: 01107449-730c-493a-53c1-08de30d97855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L3Rzd010MEczSU45Ymwra0pjeFc1ZktuVDR3UTVSSThDdk9hUkVYZW1tbWxl?=
 =?utf-8?B?Nit5dXk3amUvZTQ1N3FMZjlVZVE2QXB6bURLYTVINXkzK3ViU0xyN1h4Uk42?=
 =?utf-8?B?NHlZcVFybnNRNVNwVmJiakYxQ2srRXo4S1J6NVdpbGYwZHYxWWdzd21jODh3?=
 =?utf-8?B?WWQ2TU9GNFJYVktXUUNjZDRQTTVuQWNRZ3BQSGs3a25rQk81b1YzbFcyTkxN?=
 =?utf-8?B?OGhmWDZ3UDVUOGRhaVYxVUhPWEpodmVrZDl4bXFUSXpNQU1Dc3owK0QvaDJS?=
 =?utf-8?B?S0ZVNGtnUTJJUVptNzJhSTJIcHNUUExuOUg0bWpNb1ZDUUpGN3NDVlZ3WlZr?=
 =?utf-8?B?azNkNVRvUVBZU2wzOGcwejJJTVpObmIrVkJqYXMweUVPcHdaaDFBbmdPVU0r?=
 =?utf-8?B?aXlndWs0bytvWS9iOEFoNnBDVkxabTFoL0pndXB5NUROQWVhK0pNRXM3Mmk3?=
 =?utf-8?B?SVYzcTVUazNlSFZUUi9ZSmFLOTdOTSt4bjBhUnFEL2lhOThTN2Q4aFUrakQ5?=
 =?utf-8?B?R1ZsSEY5bkdNUHF3b2JKRVFqZktWOEhscnlTaG9NYU1abWdWZFBGdGI2VUZo?=
 =?utf-8?B?TFFBN1ZpMTRLTFk4MlhUV3QwUExCeFhOTDVZblduVUJUUDlhNVdUczhTYTNH?=
 =?utf-8?B?UVJtdDJoU0RIQ1NQaGdvaU1ONkhoYzhzOE9wckZnbmE4T054emxjdEZXbU1w?=
 =?utf-8?B?em0wbEdQL3ZDbGFPNTdhZlRGUHh2YXJMR3pUb2dNYVNNSjVtOTljMXRrUi9M?=
 =?utf-8?B?Z0RKdUZ0RzZUdmQzOTVobGVlbng0OE5iQjhMNzJnU3AvQmxBWDh1RE9EWi9F?=
 =?utf-8?B?V1AxeHNpL21iVFdReVhyRUJFclJvZEw1UitrL3cwYkw4bnZLTkVYSCtxcStq?=
 =?utf-8?B?dGVQMHhXNmorRzlYWTFOUkQ3dHFVWWpXbytNOU1ROXB0Y0MyZnAyVmFNZzZn?=
 =?utf-8?B?YWh5WHVIcEM4UisrZWpsT2paTSs4dGl5Z0xuTXV3d1VIdWNkdnFuRHR6WGpQ?=
 =?utf-8?B?S0FRV0Iydk4zdjg4djJROHI0Y1lKd1I5ZFBveDVzUnlMZkVGd0MxVVZyVUxm?=
 =?utf-8?B?cDQ2R2pBWWY2UUxRVG1sdUR0OFIzdXFQQVpZalFtOS8vN09nbnRLWUhNdC9m?=
 =?utf-8?B?UGVzWjhRY0x0L0ZLTDVwWHJqZDBqbGt0ZGNMSXVTeFppbStkTVppSVU1VkpP?=
 =?utf-8?B?OHBoRWM4cGlMTXFYanR3NmZxSVIvL1UydENMV2QvRUJLQlFtUkpYYkRaR0RH?=
 =?utf-8?B?REFKcFpHU1BsZEsxbmM1c1pWdXlWMStZK3NDNW5ZbjZtTWpTelBYZERtM0Jv?=
 =?utf-8?B?Vkg5a0YzbzVVU3ZnenlHaHVjVUoyQy9HNDh2VFRzZWMzZlhsOUtJaUM0cHNC?=
 =?utf-8?B?S2Z4RWQ2ZHU4RnpEU1U0a3BObUE3UHNoMno1RmxnaXJ2UGd1RGZDelVHRFlJ?=
 =?utf-8?B?eGZNbGlqVWpPUGFrYWl6YVN0eElBbnVsWWdDVUpZSm1zZm9PUGx3dHNxU0dJ?=
 =?utf-8?B?czYxdjA3TzBvdVI1ZmlKNGp3bW5aM1VscmdwZzZZbmIzaW9FSXFCRnY2ME96?=
 =?utf-8?B?VSs3QWl5YWRReklIN0NvMjZBQThvYjI4NDRUT1JNWjVoUVh3ZDk3K3Y3cndT?=
 =?utf-8?B?K0pMZGo5RUtKTHJIeXZBRFJWZDJDQXlZY2VrSDNVQ3gzUUgza21WS29VS25H?=
 =?utf-8?B?cm1mbXNtNEh4R3NOcnIrMWNXaGhoVVVMcG1aVm5VcjRmdUdWbEZudVl4M3Ex?=
 =?utf-8?B?U0diVWpQM2lCNUFsR3ljTmxxaVUyTWFJSmVPamNTTUVXbTZ4N2tuNnFCam4y?=
 =?utf-8?B?MzA2M1pnLzNVTDN1VUFjWkdEY3VXcWJMUExuUXRDdU1iV0VvMTE4ZWcyRDFw?=
 =?utf-8?B?NUZIWVRhb0E5MjdNbGJhbC9KMW5COFhwQmJEOGFBZUtsZVVlSWM3TnRHcVNO?=
 =?utf-8?Q?IohJHVmUDLsFdigTQShi16vlu62kePI1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JFTTAzeTYveEJsNTl1RHUraEdvNUJaQm5sbG05T3JzQXYvaE5NSGlreHZ0?=
 =?utf-8?B?RDZSMTk3VXNobk9EdXU5VnQzSmhLK0NQZllGS0hSbit6YkcxTit6YlF1Ukgy?=
 =?utf-8?B?OXJ4L0F0dkw4dlh0cXV6blZjaFg0R1VWYm55aFJvejAxdU9uMXJMejFxM291?=
 =?utf-8?B?NmpERHhSd3I1NGI0ekFiWXM1WUZhS0Vta1ZBVTE0Y1MvSi9veFR2UTJwam1u?=
 =?utf-8?B?Ly82Y0JQaWJsQTBlNFBtWmpYMnhvR2llajRZK0wxSkRhdm5VazZseUxtTkM5?=
 =?utf-8?B?aU96cjR0cmpxWVlRQWh5Smg2S3F2V2J3dW05T3Z2aThwcFFydCtSbk8vRlNQ?=
 =?utf-8?B?b0NmRjRNTjNBaFU0UnZVZmY1RjVIazdwMy9zUDlWc25iRUhjSFpseDB4dWhx?=
 =?utf-8?B?OUlRbFVrdEtLYTNXb0hOQXRJWWl3RTNIYjUyZnZuZk03ekJZTmcrNEdKYXhv?=
 =?utf-8?B?NStHZHI2QUR4WTFLVnVrRm9GYkZvMC95bWtYZnlOYjBmWFdrYjBFM2xrTity?=
 =?utf-8?B?SXVRR3hYOHd6RDRCT2R6aXhvdFFJZ2h1WWViN0dsSExRME9pZkRyYVgxN3VQ?=
 =?utf-8?B?Y3B0VUVsekg2SnQvQ3NzaG84ZFF6dHVlTG5GZDJOYjFzVjl0UUpXTzF0Y1ps?=
 =?utf-8?B?QWJnN0FKWExMT2kvUUZuNy9UUzU5RkxaamZKTUNPbmpYS3JiODU2bGQ2clFu?=
 =?utf-8?B?Z0RXQXpQd3lub1FEYnFNNU9vWWNSbWRMRGJEOWtJTU1KYUhHVTIwQjFjTXBO?=
 =?utf-8?B?VEcxdzNNZ3dWUHRuUzZ4YU1sTFRtYjdrKzdiOWJKekZrSEsrUnI1aE1yMDVa?=
 =?utf-8?B?TEhaelcwZFV2UWNKQ3h5YkhoTkE1SllYNUtkMlltelJtaFZLUUMrTG9jZEVr?=
 =?utf-8?B?d2JiMVpwN3g5T2lLOFljVFF2VVpPay8rR1lCUlNGZElZQTdyZFRFWFVLZllv?=
 =?utf-8?B?WWNwVk03VG9KZDUrSlgvdElBMENwV1ZiQUQ3QUwwNW9SdXRCNDB1UU4zeE1F?=
 =?utf-8?B?VzZxQWsyWm85WjZKaFZSWHhMbEYzM3FHVzMzQVovSlA0bTdiby9VK0JCNFRK?=
 =?utf-8?B?TEhZNHJIbnNqbVJXckRZTDh1MWVvUE5WM3UzbENhNXdpTjVPNUtFU3RFUVRS?=
 =?utf-8?B?akhhcjFsM3JZcXcva1FnUFFhVXI1a3FHN3JsOFhDMEZYZFRISlR5VmFxSm4w?=
 =?utf-8?B?SGVPVTFDZXFETThvZTROZGFqOEgza2RJb09wa01TcWpUQzZrRDFPUDJzbnZt?=
 =?utf-8?B?YS9HUFFEQVVlTTNKVnVUZVpOUWg4R2lma1MrbkpzTXdYRzJsa1o3U2o5TmpN?=
 =?utf-8?B?bkZUWkYyZ3pITmJVc0RzWmc4QTBVdExFK2xlaDM3MGV6RWUvMC9sRWk5M2lz?=
 =?utf-8?B?bDdNeXJWTHZZTXMrdnFlanhrWHFZb3JpYlNvbWtZYVRSekdtUmVoNFdjZzRp?=
 =?utf-8?B?MjY3VmZ2QlVlRzNCR2pYaUdLbUZQaTVmSmZpd1FVdVZDWVlWcmhEU2k2ZE81?=
 =?utf-8?B?a01NMlhKUGZocHhvYjdXSFNlNTcyTjBxVEFQUGc2WGZWRzcvZ2xIM0pQQW11?=
 =?utf-8?B?WDRMdVpaSjRqOHF4ZlliSHRDc3VNOGs0Y01Vd1BJSE5JeFNUL3gxNGR1LzBm?=
 =?utf-8?B?YW1WV1g5QVBGR0h4dTdaQTV6WTRNZG10Y1kyVi8wMFIwNFZsVWRRNGk3Y0Vq?=
 =?utf-8?B?TEFyNURtL3VkcE1DL0U2UERCWnZpWWVVRkptRGhuSW9ETVo0b3RyYStHTmFu?=
 =?utf-8?B?Z1FvT3d0TW5qMEJXY1dsaUZKZFFhUlN3dk5jRk03TVdtWnpSQ3FjdkZjRUcx?=
 =?utf-8?B?YzQ1N3VlamErUTlLT2tNYi9RYkV3YVZ2d3dLT2lTeVF0MUVTYkpGU0ZlU2d6?=
 =?utf-8?B?ZXV3aTNmNDFWVnV6WEhPQmFnMXVLcVU3aHk0K2J0c2JYOEc4bHhrRjNqSThW?=
 =?utf-8?B?c1lzbzNVMmVNOUYxQW16a3I1OTQrTHRpUjRobFVWQTA5YVhPZVAwZnpKSk1B?=
 =?utf-8?B?OG44RlJTL08yT09WbjhkdzF4eUxlQUFmRHNCTzZ4cGltTVkvVlBiSVFpRDRR?=
 =?utf-8?B?N0VyaHhNcVRJMko5VWN1QmJsdE9oZ2lDR0s5RTVCMHYxL2hoOHRLekhXUEpm?=
 =?utf-8?B?V2NRVmRER3U0L3VFNmloZlptYmFYZG5KaUpNNHZDS0lVUlVBRHpBL0dmZHhw?=
 =?utf-8?B?ZVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01107449-730c-493a-53c1-08de30d97855
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:59:32.4624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VQkba1rCKHA+kkuKyeoRlMTOpojMLq0H7FxrEcbJg0jqkXzNwLdWJSol+X/zK4ogmiAaQwoClYfKGKi+nKrNFjr380/DphO4cFOPIh9vqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
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

On Thu, Nov 27, 2025 at 04:30:16PM +0530, K V P, Satyanarayana wrote:
> 
> On 27-Nov-25 4:11 PM, Marcin Bernatowicz wrote:
> > VF migration currently provides no lightweight visibility into its internal
> > save/restore flow, making it difficult to measure migration latency, VF
> > stun time, or the amount of data transferred per VF and per data type
> > (VRAM/GGTT/MMIO/GuC).
> > 
> > This patch introduces two tracepoints that instrument the VF state machine
> > and each migration-data producer:
> > 
> >    * xe_sriov_vf_state
> >        - emits the tile/gt/vf identifier and the effective VF state
> >        - placed on SAVE_WIP, SAVED, RESTORE_WIP and RESTORED transitions
> >        - allows tracking the duration of individual save/restore phases
> >          for each VF
> > 
> >    * xe_sriov_vf_mig_data_chunk
> >        - records the type of migrated data (VRAM/GGTT/MMIO/GuC), direction
> >          (save/restore), offset and size in bytes
> >        - emitted once per chunk after it is produced/consumed
> >        - enables reconstruction of migration throughput and per-type byte
> >          distribution
> > 
> > These tracepoints are low-overhead when disabled and integrate with
> > existing tooling such as trace-cmd and perf. They make it possible to
> > correlate VF state transitions with data movement timings and to profile
> > migration behaviour under various workloads or provisioning scenarios.
> 
> These traces are useful to see where we are spending much time during
> migration.
> 
> Can we add some debugfs entries in PF which shows consolidated save and
> restore times for each component?

This can be extracted from tracing data, either using post-processing of
trace data or at data gathering time (via eBPF).

Also - I would suggest to skip static tracepoints for now, as this code
was added relatively recently, and I'd like to avoid having to maintain
semi-stable tracepoints, at least at this point in time.
It should be possible to implement most (all?) of this functionality
using dynamic kprobe/kretprobe.

Thanks,
-Michał

> 
> > 
> > Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> > Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  8 +++
> >   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 49 +++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_trace.h                 | 47 ++++++++++++++++++
> >   3 files changed, 104 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index bf48b05797de..de327ef14218 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -24,6 +24,7 @@
> >   #include "xe_sriov_pf_migration.h"
> >   #include "xe_sriov_pf_service.h"
> >   #include "xe_tile.h"
> > +#include "xe_trace.h"
> >   static const char *control_cmd_to_string(u32 cmd)
> >   {
> > @@ -836,6 +837,8 @@ static void pf_enter_vf_saved(struct xe_gt *gt, unsigned int vfid)
> >   		pf_enter_vf_state_machine_bug(gt, vfid);
> >   	xe_gt_sriov_dbg(gt, "VF%u saved!\n", vfid);
> > +	trace_xe_sriov_vf_state(gt, vfid,
> > +				XE_GT_SRIOV_STATE_SAVED);
> >   	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> >   	pf_exit_vf_mismatch(gt, vfid);
> > @@ -944,6 +947,7 @@ static void pf_exit_vf_save_wait_data(struct xe_gt *gt, unsigned int vfid)
> >   static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >   {
> >   	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP)) {
> > +		trace_xe_sriov_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> >   		xe_gt_sriov_pf_migration_save_init(gt, vfid);
> >   		pf_enter_vf_wip(gt, vfid);
> >   		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_PROCESS_DATA);
> > @@ -1113,6 +1117,8 @@ static void pf_enter_vf_restored(struct xe_gt *gt, unsigned int vfid)
> >   		pf_enter_vf_state_machine_bug(gt, vfid);
> >   	xe_gt_sriov_dbg(gt, "VF%u restored!\n", vfid);
> > +	trace_xe_sriov_vf_state(gt, vfid,
> > +				XE_GT_SRIOV_STATE_RESTORED);
> >   	pf_expect_vf_state(gt, vfid, XE_GT_SRIOV_STATE_PAUSED);
> >   	pf_exit_vf_mismatch(gt, vfid);
> > @@ -1195,6 +1201,8 @@ static void pf_exit_vf_restore_wait_data(struct xe_gt *gt, unsigned int vfid)
> >   static bool pf_enter_vf_restore_wip(struct xe_gt *gt, unsigned int vfid)
> >   {
> >   	if (pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_WIP)) {
> > +		trace_xe_sriov_vf_state(gt, vfid,
> > +					XE_GT_SRIOV_STATE_RESTORE_WIP);
> >   		pf_enter_vf_wip(gt, vfid);
> >   		pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_RESTORE_PROCESS_DATA);
> >   		pf_queue_vf(gt, vfid);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index d5d918ddce4f..0e8f5e8e5d7a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -25,6 +25,7 @@
> >   #include "xe_sriov_packet.h"
> >   #include "xe_sriov_packet_types.h"
> >   #include "xe_sriov_pf_migration.h"
> > +#include "xe_trace.h"
> >   #define XE_GT_SRIOV_PF_MIGRATION_RING_SIZE 5
> > @@ -86,6 +87,12 @@ static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
> >   	if (ret)
> >   		goto fail;
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_GGTT,
> > +					 true,   /* is_save */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> 
> We normally give zero for save and one for restore.
> Can we define some macros and use them instead of true and false for better readability?
> -Satya
> 
> >   fail:
> > @@ -108,6 +115,12 @@ static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
> >   		return ret;
> >   	}
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_GGTT,
> > +					 false, /* restore */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   }
> > @@ -274,6 +287,12 @@ static int pf_save_vf_guc_mig_data(struct xe_gt *gt, unsigned int vfid)
> >   	if (ret)
> >   		goto fail_free;
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_GUC,
> > +					 true, /* is_save */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   fail_free:
> > @@ -332,6 +351,12 @@ static int pf_restore_vf_guc_state(struct xe_gt *gt, unsigned int vfid,
> >   	if (ret < 0)
> >   		goto fail;
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_GUC,
> > +					 false, /* restore */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   fail:
> > @@ -442,6 +467,12 @@ static int pf_save_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid)
> >   	if (ret)
> >   		goto fail;
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_MMIO,
> > +					 true,   /* is_save */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   fail:
> > @@ -465,6 +496,12 @@ static int pf_restore_vf_mmio_mig_data(struct xe_gt *gt, unsigned int vfid,
> >   		return ret;
> >   	}
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_MMIO,
> > +					 false, /* restore */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   }
> > @@ -589,6 +626,12 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
> >   	if (ret)
> >   		goto fail;
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_VRAM,
> > +					 true,  /* is_save */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   fail:
> > @@ -672,6 +715,12 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
> >   	xe_bo_put(vram);
> > +	trace_xe_sriov_vf_mig_data_chunk(gt, vfid,
> > +					 XE_SRIOV_PACKET_TYPE_VRAM,
> > +					 false, /* restore */
> > +					 data->hdr.offset,
> > +					 data->hdr.size);
> > +
> >   	return 0;
> >   err:
> >   	xe_bo_put(vram);
> > diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/xe_trace.h
> > index 79a97b086cb2..0e714b754179 100644
> > --- a/drivers/gpu/drm/xe/xe_trace.h
> > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > @@ -464,6 +464,53 @@ TRACE_EVENT(xe_exec_queue_reach_max_job_count,
> >   		      __entry->class, __entry->logical_mask, __entry->guc_id)
> >   );
> > +TRACE_EVENT(xe_sriov_vf_state,
> > +	    TP_PROTO(const struct xe_gt *gt, u16 vfid, u32 vf_state),
> > +	    TP_ARGS(gt, vfid, vf_state),
> > +	    TP_STRUCT__entry(__field(u8,  tile_id)
> > +			     __field(u8,  gt_id)
> > +			     __field(u16, vfid)
> > +			     __field(u32, vf_state)
> > +			    ),
> > +	    TP_fast_assign(__entry->tile_id  = gt->tile->id;
> > +			   __entry->gt_id    = gt->info.id;
> > +			   __entry->vfid     = vfid;
> > +			   __entry->vf_state = vf_state;
> > +			  ),
> > +	    TP_printk("tile=%u gt=%u vf=%u state=0x%x",
> > +		      __entry->tile_id, __entry->gt_id,
> > +		      __entry->vfid, __entry->vf_state)
> > +);
> > +
> > +TRACE_EVENT(xe_sriov_vf_mig_data_chunk,
> > +	    TP_PROTO(const struct xe_gt *gt, u16 vfid,
> > +		     u8 data_type, bool is_save,
> > +		     u64 offset, u64 bytes),
> > +	    TP_ARGS(gt, vfid, data_type, is_save, offset, bytes),
> > +	    TP_STRUCT__entry(__field(u8,  tile_id)
> > +			     __field(u8,  gt_id)
> > +			     __field(u16, vfid)
> > +			     __field(u8,  data_type)
> > +			     __field(u8,  is_save)
> > +			     __field(u64, offset)
> > +			     __field(u64, bytes)
> > +			    ),
> > +	    TP_fast_assign(__entry->tile_id   = gt->tile->id;
> > +			   __entry->gt_id     = gt->info.id;
> > +			   __entry->vfid      = vfid;
> > +			   __entry->data_type = data_type;
> > +			   __entry->is_save   = is_save;
> > +			   __entry->offset    = offset;
> > +			   __entry->bytes     = bytes;
> > +			  ),
> > +	    TP_printk("tile=%u gt=%u vf=%u type=%u %s off=%llu size=%llu",
> > +		      __entry->tile_id, __entry->gt_id, __entry->vfid,
> > +		      __entry->data_type,
> > +		      __entry->is_save ? "save" : "restore",
> > +		      (unsigned long long)__entry->offset,
> > +		      (unsigned long long)__entry->bytes)
> > +);
> > +
> >   #endif
> >   /* This part must be outside protection */
