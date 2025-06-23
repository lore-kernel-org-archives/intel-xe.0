Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86065C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 16:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C82E10E430;
	Mon, 23 Jun 2025 16:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMAfX1C8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F34010E069
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750696711; x=1782232711;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fW61ewQ54+Q0iQj6jIoZz6KMPnHOOy5tOIFofFrjjI8=;
 b=VMAfX1C8RB9JDioZPbZXI64KviANfLuALivYu3C3MTcCItknyqTp70Al
 GRSg0ssxK7SehiegNm82ZTcEDFN2SMeeWULLM+axMW97S4Q15OeE+vzxS
 KRAdv5Sgm1psmd3ROG9TUkwm0BD44p9V2IvBfQ85EsWQIwRSrZlqcHF1/
 dCh6S1yRuP05+8fY0aoqjq/rUAa7q36C5UnTFtjOdDR1Fv4pLqJsJB/uN
 wXW9+mgDqOQOeta4NY1M6IeUH694Dy976ZePp+c8XRdQSBHX64qYgCUGL
 wCx9nU65r6impCGd3k3Z+iMPh8BnaIFrWt2FjDeIzFZbAy+fOe54HOZTZ g==;
X-CSE-ConnectionGUID: HHHoIGKTQNmL6mTQ7AcTCg==
X-CSE-MsgGUID: vicqXq0/SgGfgwY3J4yfAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53052209"
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="53052209"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:38:31 -0700
X-CSE-ConnectionGUID: L55tRkjaRi+Oq9U0yZBxfQ==
X-CSE-MsgGUID: su2+KJIqRX6YsFAQDcp7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,259,1744095600"; d="scan'208";a="152344437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 09:38:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:38:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 09:38:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 09:38:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rAkFQI7JgJzxvGrFHmPfPnBbrepfhONpiBWF3hhu5wRSe5GIdgAlMQAHkqb5Qa9VN3JXzyCCStoA0RbPwDjhXBlrfG9xPJyft76gdoz9BNyoZ0eSFD/IAS6ZmIrvfPoIjnlssIlyspKfztsIBfuzXC2ywsRTp+b/vPux1bVW+9MlqF2W/Hz0xcOALvtaijd/BlLrAVAFeakBotJOj8J0szZ2wsNTA9RvkYZRsaC2j24AmSBTkAxH1epNsm8gHCo2Ksu0WA1oPHPyBxV0hk0D1HYCpQ1GRJTvUGubSt4z+HSUUHtMtxeXL5WL6kALdi+4tthOKVIgAinwi3hIK6n0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5iWxCSOKf06DXtHBgIc/bhMYp+dA8WdPgmlG/T3plw=;
 b=U+q9B5wMACCEwCniUmHRsa6eSYb8+pLbG7xfz8kED5mX+pT89zZTcojKk8M1T2eRB7fbOxaLyAYCNbfZrfdonQ4tVC++hiChBxIQlWpexes1ImNfb5tiovD7i9+yql4U7zOSxBCFWr7GebsOxi8jZcGqU31Yl8Ke21CDV0cLEgJzQUZtVeaGytvNAdX7qnwvZm2TNg9ozyvtkuO3vDR7p3cCdiA0Ou7dBOiOSyL3t66ZVpzIn7Rj7Dbuyqx5qPLY5AdqrhY+6qfxQlM+BnkrG8mIwaeXhN9NQGiIt5lUNmjK4HEECOikeTQueI2maS3vUWuKtdZdgH8QAA4Kkw6v0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA1PR11MB8794.namprd11.prod.outlook.com (2603:10b6:806:46a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Mon, 23 Jun
 2025 16:38:23 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 23 Jun 2025
 16:38:23 +0000
Date: Mon, 23 Jun 2025 18:38:20 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Unify the initialization of VRAM regions
Message-ID: <20250623163820.cpxq5fnjf5ap3h7s@intel.com>
References: <20250528074743.2027563-1-piotr.piorkowski@intel.com>
 <20250528074743.2027563-3-piotr.piorkowski@intel.com>
 <b294c57b-65f0-4bfb-b361-a6b3669f5933@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b294c57b-65f0-4bfb-b361-a6b3669f5933@intel.com>
X-ClientProxiedBy: DUZPR01CA0136.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::24) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA1PR11MB8794:EE_
X-MS-Office365-Filtering-Correlation-Id: e364e1cd-840f-4a38-2038-08ddb2745e6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dGhOZmFYNElUMlBqWnV5UGdjc3JpSE1SaDdOV25YblN2d1lpU0dXY1VRcG1X?=
 =?utf-8?B?WVJhaDBESjZ1RUdTSzlZQVA3aUVnelA4eDAyZUdMYldhdERrNzFvRXR5ckJa?=
 =?utf-8?B?azM2cVlaLzFGbGZZWDBzelVidGdMQ29UMTFJVk5NYTdmZ0d5WWZXUndXL3Vi?=
 =?utf-8?B?MCtaQ3pQSDM1bjRMUzUvYVV3dlZ6alNSSWlyb3VzdkdWT2pHTU82dnhPUm9Z?=
 =?utf-8?B?UURrdjVXcDlGalpWaVhpWjV5c0xvMzdQZ2daYUtleVpCTkFTM1Y1RHhxSHNR?=
 =?utf-8?B?aW9yY2RSNVVsUnZOVHZrVlBPemxQajdxWEhmN1VjTzBPeVRMSy94cU40MG5T?=
 =?utf-8?B?SlVXdHROZzFVL2pudG9KbjkxWjgrNElMNVhma2hidjIyT0FkSXFsYVdnWUpk?=
 =?utf-8?B?SElEc3p5UmhGcFNaNTRYSVBBWHdjN2ZYNlJEU1ZOUGwzbitXNnVlL1FIYnlV?=
 =?utf-8?B?b3JBVGhQZ0dQbVJoNnZTUFhWeUZNWkJQdDVKVEd6d1F5RWxJdmhDR1piZGlR?=
 =?utf-8?B?czB6dWZPQWgvVDNHd2hxeS9rVkxEcDZ0eWNpcEZHdzk2bFVWWUh5bWxEK0p6?=
 =?utf-8?B?cWpsTEYwM3ZNSG9CbWdVTlhUZklzN1cySXd5OHIrU2NRNWpKbGZKSC9GcWkv?=
 =?utf-8?B?SmVrRVpFOUhUMDBWMm9qL0c3cUJidVRDTUFIeTVZMEFhWG1XZWl4Rmp5ekVo?=
 =?utf-8?B?bW5laUZ6aDRmbFpmYzdJSWRBV0ZBVXJHQitjMXdBTFJ0aFZhazFHdHJOa1ZO?=
 =?utf-8?B?VjVQTkpDSDJWdjJrTUplckM3b2pVanJxZldZUWlUUVNQZlRzYWZHbUdnVXpK?=
 =?utf-8?B?bGVZdzNDVW5lMkk3aDJuTGpocU55RDNjM1V6WDIwTkxtc0FtOGxJVnNReC9k?=
 =?utf-8?B?N3NnbUIxOFJvZUVrQ1ZIUGtRL1p2aEtpQnhBVnQ2YnNKWHd2WjY2QVBha3ly?=
 =?utf-8?B?S1p0am5xQUJUZGo1Z3lVVWRFU1FLYnhBZHpKZHdiOVZucFBGZkhSOUc1SnlC?=
 =?utf-8?B?NEZxVVQvNVRyYkYyZ0VzeWpJK2VFTnVOQTdxbTZReXY4MkZOc0dUdVlYOTJF?=
 =?utf-8?B?SXAwS2FMOURNWm9YbTBEM2lIcWdVNk1FVW44RXhFUEUramcyeUhsUmdodE4w?=
 =?utf-8?B?aWc2bGkrVTg1K3MzSmljbnJKRHlXN0F1QmlRcXFremZJaDJYdklXRG1mT3NO?=
 =?utf-8?B?d3VURDJJNmRxTExFcENmUXI0UUJxVlVLQVhSbDhxMkE3ZFVHQ1pOMDhtSnRI?=
 =?utf-8?B?NURQeUEzSjBIc3pkZmpHMlhLb2RUTmQyME8yZ2MyYmtXbGlVTzlCUGlabm9k?=
 =?utf-8?B?NkNlWjJ4Qlk0UG8vc1FoaFdKT2xBcEh6QUJXb0Y1emNkN29QSGJRYUpZTGtE?=
 =?utf-8?B?V3VteGJaeExjOHVHMFczVWxRM3pScmZBb2M4TnFEYU5pRVV6N1lxZW11RkIy?=
 =?utf-8?B?TU1qRmk0K3FRM2ZXZkNRM0tLZ3JEYUp3NjNMVWtLSlRNNmRDc29QUWlXeDJS?=
 =?utf-8?B?eFZYdG5ielFQYWJpQ2dwY2NzSXdyMDI4TXN1MkRNN2tWaTRJdWFLeTEzUFpR?=
 =?utf-8?B?TytaVE0vcXdVWlJCUW9ld1doRjB3VWpIQzVCRjRMVXEvbTUwakV6R1BWaHQr?=
 =?utf-8?B?NmpZVlo2NHlmMnZDaGdmUk5PZzg0R2ZXYkpEenY4NHpjcWhpVnNqMHF4dkp6?=
 =?utf-8?B?RFI1K1dJcE96SjVreXNna0dQTWxkY0g1SmQxMzNqalVMdWgzQU90cTRmQVdM?=
 =?utf-8?B?MW1wcHFlQzdnc3haRmNtalVERTIzSCtPWGxjL1hnbzZuanlMeTYvc2tIbDJS?=
 =?utf-8?B?NWxPVDNIclluV28yK3pMTlhBRGZCZVdyU1F4cXdxcUFteHhCcWVmQXhrM0pH?=
 =?utf-8?B?Z1ZiVFFadXdYTW9lYXBFbkp5Uk9EZk5aQVBCdFcrM0toazlzYmpKUXJoYTdU?=
 =?utf-8?Q?eIqePwCBQcE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXI3VWxjeUpvamRsVWFpdXZCS1UzWHFFUHNiWlhndGg1b3ZpWG85NFlwdHRa?=
 =?utf-8?B?VzlmRU9uSWpOazNjLzg5c2RkRWlldGFWbk9PLzVlS1l0VXhYc0lCNENKQmg0?=
 =?utf-8?B?TlZpM1VvellvbTd6MGl0cWJTREh4alVOdFIrNmxYTDhPLzBYYm1jWDl4eEpF?=
 =?utf-8?B?TU1vNGxpY05WTnRuWE5mUTM0ZTlYVTVkYWxLR29mbTJIN21BOU9Ubm1VNW9I?=
 =?utf-8?B?R0FOUHJLSncwenVMbEU4Y0dmZXI4VXY5VHg4QTZIcUMwWk5TaEhGakJETnhs?=
 =?utf-8?B?K2xPc21CQm8yTVNkcG5OQ0hXc2VZRUFXYU9TRTlCcTU1bDRJaXppSitBRGlm?=
 =?utf-8?B?aVd1N2FWbUVOZnNabG5yMHEzczZjTFN0ZC9sek8rZTlYL2Era0c1V2R2ZFpK?=
 =?utf-8?B?RGNkSktlV05RaFRmUDN4OGZGNFhPYlpUQlVhdDIzb0dtTFZTc2VYV3lVNnFS?=
 =?utf-8?B?ZzBmSWE5K3pmamw1cUlQUEVSak55K1RGK2pkano2TVBFQmNTcmhUWkp0ZVpC?=
 =?utf-8?B?WHJiZXlGMlArSmFXaTkyZUJNMmFEWUZHWnBjSmN5TGFJcmhWTHhxUThod2Nr?=
 =?utf-8?B?SEM2emxCZUNjRVh5MFI1a3N0NnhFQ0hZc0ZOS081Mnozd0VrTVJLSm9tR3Fm?=
 =?utf-8?B?a243N1hpVUZ1OHBVZ2ZoN2V2dXNvY3JlTy9OeG8wSHRyMjBHMDRsU284T2oy?=
 =?utf-8?B?eTRiSmJSZk1MYW12VkxncHVOem5tbkFid3JiOG9LZWJIb3dpTlN2MGtTcUlr?=
 =?utf-8?B?RGRmWE9uOWRQWFpqWVV5VGg5elZiR0RBcTFFbmpaaTFQSGxSNlZMVWxJS0F1?=
 =?utf-8?B?TFJzZTFTMWUxK1k1eG11WVV5QVpVUllVazdBWFJsNXoxNkxkUmF4djFLVTBP?=
 =?utf-8?B?NUY4Y2RjSzg0L1lZZDVQcDA4R0VQRE5pcTZjQk5FOUJTdy81ZE51cGhuclZE?=
 =?utf-8?B?SWRQT1cvek9MdnNNTTU2UTJRY1U4NVFNVjVQTHltTGF5L2FURldqVXlPcGRI?=
 =?utf-8?B?Y2VCTmM4eDVEZjRscGxnM2dRMUU0UmdZUHlPbVNrUWxncEpDQ0c3bXR1Zmdt?=
 =?utf-8?B?b1VNaFpmUGFKbk9Lc0J2STloUzFocDEvbUJMMHl2TGpuOWd2ZVNMQVZGNXpB?=
 =?utf-8?B?REcxTjYxcFMrazIxNWxqOHhJRFZPcHpwbDFtbUVZd1JhSzF5enlBZlp2eFVW?=
 =?utf-8?B?VTVwb3p2SkxLTUN0Qkh2bUsrWWVCQ0JwbFVGSFMvU1RhMktZa0YvOWVNU2g0?=
 =?utf-8?B?akgzRlk4dFBFNFlpVmpWa2tRcWp6bno5a1d1Rk1RVEdHVU82WTlGZkpORUM0?=
 =?utf-8?B?cy9oc0I4TmFwbEpIWkx3MU16cjFVaS9SZUFjS2FCbzg3VWFNK2N3NVFIblph?=
 =?utf-8?B?am5qTEZJSzZNaThQM09pdHk3SEFIRWxQMllKUUUyN0sxZGR6bnZQVmNrMEYw?=
 =?utf-8?B?SWt1Smd5MFpDejZEMUhuUWU1R3JFSHhibDdCQWtGQ045SFJuSGNCTWNleXdE?=
 =?utf-8?B?SWdHS3MzK1pBWEh1SHJiU0Rsckx0UktJNkVHU2M5bzI2cEpPa1NpSHhzY2FQ?=
 =?utf-8?B?SzlyR25GK1F0cVg1R0QxQmxzSUN3NisrY0NYYWZzb2ZJMitYWjRGaUg1TEla?=
 =?utf-8?B?clIrK1I5UFJJK2s5U1dPS2lrc1paQ3dwcFZCL2djMGJ6OVQ2RzdWZ1N2S2xN?=
 =?utf-8?B?eExFS1dNanJzWnlCdlBOYXRoTmFPcHdxVXhSTHNxNDNBV2NkQm50bjErQi8v?=
 =?utf-8?B?bHNDWGhqVHp2OXM1cVdCbGxqN0tjQm5Wb3JmYnJDbjQ0cEY4a2l1ZmpiUXkv?=
 =?utf-8?B?QXFQaDg4WUlkbWRBU3F2Skw0SUVPaXpxQVl5ZHBCUi9VeW9LTmxmZGp1eGV4?=
 =?utf-8?B?YmhpR3dWYUsvQ1J0S3o2V2xmMlJzcU8xUWRDOCszWm50bWE0SXhObE0yVGx5?=
 =?utf-8?B?Tk1PNUplOUJqWm5sdjd6WjV5WE5RRnhtSzlPSSt4VWpMMmpPbW9IdUhhblk0?=
 =?utf-8?B?clE4QWM2UDI4ZExPU0dwTXdzajM4RnJWTlFlRlNRUjZjemFOak5ObmZzOEk5?=
 =?utf-8?B?TC95alJSTHZMWUpmSUlhZmJ2dXJOdUVSUUFESGhraUhIeWNYWitkUkl6TjR3?=
 =?utf-8?B?M0tjYWh4cGRPRDZFVVA3SlFPaWRCVVVtL0JsMDIxd2dDaWNGSW9sNHh2dWJS?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e364e1cd-840f-4a38-2038-08ddb2745e6f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 16:38:22.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r68yDUCt55/K5X4GLTTrmUKE8evgucI9OVjGJhboopnrM9GBALbpJuNZnu78n9bZKePGg40YeuZakdOCorxXTfrjEnsdjH0TLQmDCuppK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8794
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

Matthew Auld <matthew.auld@intel.com> wrote on pią [2025-cze-20 11:52:21 +0100]:
> On 28/05/2025 08:47, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > Currently in the drivers we have defined VRAM regions per device and per
> > tile. Initialization of these regions is done in two completely different
> > ways. To simplify the logic of the code and make it easier to add new
> > regions in the future, let's unify the way we initialize VRAM regions.
> > 
> > v2:
> > - fix doc comments in struct xe_vram_region
> > - remove unnecessary includes (Jani)
> > 
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > Cc: Stuart Summers <stuart.summers@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.c       |   4 +
> >   drivers/gpu/drm/xe/xe_device_types.h |   8 ++
> >   drivers/gpu/drm/xe/xe_gt_pagefault.c |   4 +-
> >   drivers/gpu/drm/xe/xe_query.c        |   2 +-
> >   drivers/gpu/drm/xe/xe_tile.c         |  30 +----
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
> >   drivers/gpu/drm/xe/xe_vram.c         | 175 ++++++++++++++++++---------
> >   drivers/gpu/drm/xe/xe_vram.h         |   5 +
> >   9 files changed, 154 insertions(+), 93 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index a80e892d6959..9793f1a6dab8 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -862,6 +862,10 @@ int xe_device_probe(struct xe_device *xe)
> >   	if (err)
> >   		return err;
> > +	err = xe_vram_init_regions_managers(xe);
> > +	if (err)
> > +		return err;
> > +
> >   	for_each_tile(tile, xe, id) {
> >   		err = xe_tile_init_noalloc(tile);
> >   		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index cba1eed9ed6a..7af14c429684 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -74,6 +74,12 @@ struct xe_pxp;
> >   struct xe_vram_region {
> >   	/** @tile: Backpointer to tile */
> >   	struct xe_tile *tile;
> > +	/**
> > +	 * @id: VRAM region instance id
> > +	 *
> > +	 * The value should be unique for VRAM region.
> > +	 */
> > +	u8 id;
> >   	/** @io_start: IO start address of this VRAM instance */
> >   	resource_size_t io_start;
> >   	/**
> > @@ -106,6 +112,8 @@ struct xe_vram_region {
> >   	void __iomem *mapping;
> >   	/** @ttm: VRAM TTM manager */
> >   	struct xe_ttm_vram_mgr ttm;
> > +	/** @placement: TTM placement dedicated for this region */
> > +	u32 placement;
> >   #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
> >   	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> >   	struct dev_pagemap pagemap;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 7a8f87709e39..51d88cdb693e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -138,7 +138,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
> >   	/* Lock VM and BOs dma-resv */
> >   	drm_exec_init(&exec, 0, 0);
> >   	drm_exec_until_all_locked(&exec) {
> > -		err = xe_pf_begin(&exec, vma, atomic, tile->id);
> > +		err = xe_pf_begin(&exec, vma, atomic, (tile->mem.vram) ? tile->mem.vram->id : 0);
> >   		drm_exec_retry_on_contention(&exec);
> >   		if (xe_vm_validate_should_retry(&exec, err, &end))
> >   			err = -EAGAIN;
> > @@ -575,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
> >   	/* Lock VM and BOs dma-resv */
> >   	drm_exec_init(&exec, 0, 0);
> >   	drm_exec_until_all_locked(&exec) {
> > -		ret = xe_pf_begin(&exec, vma, true, tile->id);
> > +		ret = xe_pf_begin(&exec, vma, true, (tile->mem.vram) ? tile->mem.vram->id : 0);
> 
> Would it make sense to pass along the tile instead, and just use
> tile->vram->placement directly inside xe_pf_begin, where needed?
> 

Yes, that's a good idea.

> >   		drm_exec_retry_on_contention(&exec);
> >   		if (ret)
> >   			break;
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 99189d15d4a5..a3b59949e31e 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -409,7 +409,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >   			gt_list->gt_list[id].near_mem_regions = 0x1;
> >   		else
> >   			gt_list->gt_list[id].near_mem_regions =
> > -				BIT(gt_to_tile(gt)->id) << 1;
> > +				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
> >   		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
> >   			gt_list->gt_list[id].near_mem_regions;
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index 8303ebd90099..7beb87124f3b 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -7,6 +7,7 @@
> >   #include <drm/drm_managed.h>
> > +#include "xe_bo.h"
> >   #include "xe_device.h"
> >   #include "xe_ggtt.h"
> >   #include "xe_gt.h"
> > @@ -18,6 +19,7 @@
> >   #include "xe_tile_sysfs.h"
> >   #include "xe_ttm_vram_mgr.h"
> >   #include "xe_wa.h"
> > +#include "xe_vram.h"
> >   /**
> >    * DOC: Multi-tile Design
> > @@ -115,11 +117,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
> >   	if (!IS_DGFX(xe))
> >   		return 0;
> > -	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
> > -	if (!vram)
> > -		return -ENOMEM;
> > -
> > -	vram->tile = tile;
> > +	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
> > +	if (IS_ERR(vram))
> > +		return PTR_ERR(vram);
> >   	tile->mem.vram = vram;
> >   	return 0;
> > @@ -157,21 +157,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >   }
> >   ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
> > -static int tile_ttm_mgr_init(struct xe_tile *tile)
> > -{
> > -	struct xe_device *xe = tile_to_xe(tile);
> > -	int err;
> > -
> > -	if (tile->mem.vram->usable_size) {
> > -		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
> > -		if (err)
> > -			return err;
> > -		xe->info.mem_region_mask |= BIT(tile->id) << 1;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >   /**
> >    * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
> >    * @tile: The tile to initialize.
> > @@ -189,11 +174,6 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
> >   int xe_tile_init_noalloc(struct xe_tile *tile)
> >   {
> >   	struct xe_device *xe = tile_to_xe(tile);
> > -	int err;
> > -
> > -	err = tile_ttm_mgr_init(tile);
> > -	if (err)
> > -		return err;
> >   	xe_wa_apply_tile_workarounds(tile);
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index d9afe0e22071..3a9780d39c65 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -337,12 +337,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> >   	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
> >   }
> > -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
> > +/**
> > + * xe_ttm_vram_mgr_init - initialize TTM VRAM region
> > + * @xe: pointer to Xe device
> > + * @vram: pointer to xe_vram_region that contains the memory region attributes
> > + *
> > + * Initialize the Xe TTM for given @vram region using the given parameters.
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> > +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
> >   {
> > -	struct xe_device *xe = tile_to_xe(tile);
> > -	struct xe_vram_region *vram = tile->mem.vram;
> > -
> > -	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
> > +	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
> >   				      vram->usable_size, vram->io_size,
> >   				      PAGE_SIZE);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index cc76050e376d..87b7fae5edba 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -11,11 +11,12 @@
> >   enum dma_data_direction;
> >   struct xe_device;
> >   struct xe_tile;
> > +struct xe_vram_region;
> >   int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
> >   			   u32 mem_type, u64 size, u64 io_size,
> >   			   u64 default_page_size);
> > -int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
> > +int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
> >   int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
> >   			      struct ttm_resource *res,
> >   			      u64 offset, u64 length,
> > diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> > index 18124a5fb291..5f68fe4d414a 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.c
> > +++ b/drivers/gpu/drm/xe/xe_vram.c
> > @@ -19,6 +19,7 @@
> >   #include "xe_mmio.h"
> >   #include "xe_module.h"
> >   #include "xe_sriov.h"
> > +#include "xe_ttm_vram_mgr.h"
> >   #include "xe_vram.h"
> >   #define BAR_SIZE_SHIFT 20
> > @@ -136,7 +137,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
> >   	return true;
> >   }
> > -static int determine_lmem_bar_size(struct xe_device *xe)
> > +static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
> >   {
> >   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > @@ -147,16 +148,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
> >   	resize_vram_bar(xe);
> > -	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
> > -	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
> > -	if (!xe->mem.vram->io_size)
> > +	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
> > +	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
> 
> > +	if (!lmem_bar->io_size)
> >   		return -EIO;
> >   	/* XXX: Need to change when xe link code is ready */
> > -	xe->mem.vram->dpa_base = 0;
> > +	lmem_bar->dpa_base = 0;
> >   	/* set up a map to the total memory area. */
> > -	xe->mem.vram->mapping = ioremap_wc(xe->mem.vram->io_start, xe->mem.vram->io_size);
> > +	lmem_bar->mapping = ioremap_wc(lmem_bar->io_start, lmem_bar->io_size);
> 
> I guess we were missing the cleanup for this, if we fail before registering
> the cleanup action?
> 

I can use here devm_ioremap_wc

> >   	return 0;
> >   }
> > @@ -287,6 +288,92 @@ static void vram_fini(void *arg)
> >   		tile->mem.vram->mapping = NULL;
> >   }
> > +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
> > +{
> > +	struct xe_vram_region *vram;
> > +	struct drm_device *drm = &xe->drm;
> > +
> > +	xe_assert(xe, id < xe->info.tile_count);
> > +
> > +	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
> > +	if (!vram)
> > +		return NULL;
> > +
> > +	vram->id = id;
> > +	vram->placement = placement;
> > +	vram->tile = &xe->tiles[id];
> > +
> > +	return vram;
> > +}
> > +
> > +static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
> > +{
> > +	struct drm_device *drm = &xe->drm;
> > +
> > +	if (vram->io_size < vram->usable_size)
> > +		drm_info(drm, "Small BAR device\n");
> > +
> > +	drm_info(drm,
> > +		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> > +		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
> > +	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> > +		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
> > +		 &vram->io_start, vram->io_start + (u64)vram->io_size);
> > +}
> > +
> > +static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
> > +			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
> > +			    u64 region_size, resource_size_t remain_io_size)
> > +{
> > +	/* Check if VRAM region is already initialized */
> > +	if (vram->mapping)
> > +		return 0;
> > +
> > +	vram->actual_physical_size = region_size;
> > +	vram->io_start = lmem_bar->io_start + offset;
> > +	vram->io_size = min_t(u64, usable_size, remain_io_size);
> > +
> > +	if (!vram->io_size) {
> > +		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> > +		return -ENODEV;
> > +	}
> > +
> > +	vram->dpa_base = lmem_bar->dpa_base + offset;
> > +	vram->mapping = lmem_bar->mapping + offset;
> > +	vram->usable_size = usable_size;
> > +
> > +	print_vram_region_info(xe, vram);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_vram_init_regions_managers - Init all VRAM TTM managers.
> > + * @xe: the &xe_device
> > + *
> > + * Return: 0 on success, error code on failure
> > + */
> > +int xe_vram_init_regions_managers(struct xe_device *xe)
> > +{
> > +	struct xe_tile *tile;
> > +	u8 id;
> > +	int err;
> > +
> > +	if (!IS_DGFX(xe))
> > +		return 0;
> > +
> > +	for_each_tile(tile, xe, id) {
> > +		if (!ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
> > +			err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
> > +			if (err)
> > +				return err;
> > +			xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
> > +		}
> > +
> 
> This can't stay in xe_tile_init_noalloc()?
> 

Now that I think about it, I don't know why I didn't put it there.


Thanks for the review.
I'll prepare a new version as soon as possible.
 - Piotr

> 	}
> > +
> > +	return 0;
> > +}
> > +
> >   /**
> >    * xe_vram_probe() - Probe VRAM configuration
> >    * @xe: the &xe_device
> > @@ -298,82 +385,52 @@ static void vram_fini(void *arg)
> >   int xe_vram_probe(struct xe_device *xe)
> >   {
> >   	struct xe_tile *tile;
> > -	resource_size_t io_size;
> > +	struct xe_vram_region lmem_bar;
> > +	resource_size_t remain_io_size;
> >   	u64 available_size = 0;
> >   	u64 total_size = 0;
> > -	u64 tile_offset;
> > -	u64 tile_size;
> > -	u64 vram_size;
> >   	int err;
> >   	u8 id;
> >   	if (!IS_DGFX(xe))
> >   		return 0;
> > -	/* Get the size of the root tile's vram for later accessibility comparison */
> > -	tile = xe_device_get_root_tile(xe);
> > -	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> > +	err = determine_lmem_bar_size(xe, &lmem_bar);
> >   	if (err)
> >   		return err;
> > +	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
> > -	err = determine_lmem_bar_size(xe);
> > -	if (err)
> > -		return err;
> > +	remain_io_size = lmem_bar.io_size;
> > -	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> > -		 &xe->mem.vram->io_size);
> > -
> > -	io_size = xe->mem.vram->io_size;
> > -
> > -	/* tile specific ranges */
> >   	for_each_tile(tile, xe, id) {
> > -		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
> > +		u64 region_size;
> > +		u64 usable_size;
> > +		u64 tile_offset;
> > +
> > +		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
> >   		if (err)
> >   			return err;
> > -		tile->mem.vram->actual_physical_size = tile_size;
> > -		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
> > -		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
> > +		total_size += region_size;
> > +		available_size += usable_size;
> > -		if (!tile->mem.vram->io_size) {
> > -			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> > -			return -ENODEV;
> > -		}
> > +		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
> > +				       region_size, remain_io_size);
> > +		if (err)
> > +			return err;
> > -		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
> > -		tile->mem.vram->usable_size = vram_size;
> > -		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
> > -
> > -		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
> > -			drm_info(&xe->drm, "Small BAR device\n");
> > -		drm_info(&xe->drm,
> > -			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
> > -			 id, tile->id, &tile->mem.vram->actual_physical_size,
> > -			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
> > -		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
> > -			 id, tile->id, &tile->mem.vram->dpa_base,
> > -			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
> > -			 &tile->mem.vram->io_start,
> > -			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
> > -
> > -		/* calculate total size using tile size to get the correct HW sizing */
> > -		total_size += tile_size;
> > -		available_size += vram_size;
> > -
> > -		if (total_size > xe->mem.vram->io_size) {
> > +		if (total_size > lmem_bar.io_size) {
> >   			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
> > -				 &total_size, &xe->mem.vram->io_size);
> > +				 &total_size, &lmem_bar.io_size);
> >   		}
> > -		io_size -= min_t(u64, tile_size, io_size);
> > +		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
> >   	}
> > -	xe->mem.vram->actual_physical_size = total_size;
> > -
> > -	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> > -		 &xe->mem.vram->actual_physical_size);
> > -	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
> > -		 &available_size);
> > +	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
> > +			       lmem_bar.io_size);
> > +	if (err)
> > +		return err;
> >   	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
> > index e31cc04ec0db..4453d2ecc249 100644
> > --- a/drivers/gpu/drm/xe/xe_vram.h
> > +++ b/drivers/gpu/drm/xe/xe_vram.h
> > @@ -6,8 +6,13 @@
> >   #ifndef _XE_VRAM_H_
> >   #define _XE_VRAM_H_
> > +#include <linux/types.h>
> > +
> >   struct xe_device;
> > +struct xe_vram_region;
> > +struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
> > +int xe_vram_init_regions_managers(struct xe_device *xe);
> >   int xe_vram_probe(struct xe_device *xe);
> >   #endif
> 

-- 
