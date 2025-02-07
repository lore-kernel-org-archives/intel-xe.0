Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADB9C02194
	for <intel-xe@archiver.kernel.org>; Fri,  7 Feb 2025 11:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91BAD10EAD0;
	Fri,  7 Feb 2025 11:31:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxzIXZUX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C7310EAD0
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Feb 2025 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738927908; x=1770463908;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Wb0hsfTTnTRmhEL8ww3UqP/fexlksr+t8tKH8Zj3IB4=;
 b=CxzIXZUXabwGiigzQ2cY80zI2eqrynnWH/r9Trw1DMJK3tshdl/qcaH3
 ZlDjvmzanod033QQUIZ3th64vdCvrWrYR0mkYojtqIPrVIRmuZGor2fsS
 iomWWkFxIfrrewQWwscgkQQnrLCCyoAjyjV/BuwvEjFI3yvuY6jY+bhF3
 ZYzEC7b5xs23/6KzGgKdUweU9EySDOv/h1UwhNus6FbLIlO8sMRu6IQ1/
 8aisgzuTiPKw03NVMqVDXwMwKUUMW+kqszwxPfAdgBWo0Wklz/BaZzWf6
 NxYfJWTaAk8Zm1HcYr6p1ex6aObHFYmdP5GB+Gb4g1uO7oXOChGGjeXLV g==;
X-CSE-ConnectionGUID: bY8xhHgTT0iyrYiHxWHXrQ==
X-CSE-MsgGUID: PmikPRuVS8mjooYrRUferg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39438492"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="39438492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 03:31:48 -0800
X-CSE-ConnectionGUID: EMole33sRxitdegVQPeWtg==
X-CSE-MsgGUID: 2sD8R3pDRM+GejjaHVwodQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116699298"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 03:31:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 03:31:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 03:31:47 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 03:31:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXcmBTZfxhLqGl2dsC33JxouFqior0DGAlIzRz518F533eTkK0zwNgzulO4zdZmQg1AMAD123FTK2QSGvH3VTw0UZjMNbrLhwMk3dlp/aC7zGPNtNjYS4G/tYb/KC79KPYhu6e3mgit8YRNO0AMrRhsbQLMULOo4C4+1z7egCj1kp9IH/JJPgzNb76kgcMt13abBo9MGDJ4oSoj08b83+Xkpn53/4cEPibPZjkGVT7YhbHKk9dhV6h9kIi36VGTKnTDD1gL/ZmlrGnGsy5PgQWv5gvPKKlASa46Ro7GRQxgDrmcfSuEzEp3mgM7cNzhSlTgAdZJYPDGckdyhUbE9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6VF5+PmquVzyEB0Ujh5UcqfaAiaiVbLGJB2qcvHTbw=;
 b=bk40yZeSEXo9FaCKtyQk25e88iWdNDUyGuh/9lf3Vf4MPpspJiTC2TKaeGVyLsWwLdbRSU/Fdy9x1/ejX6RRHOriCEo46tu8KuHdfVbAlyAcTlXU/Qo4o2/ww4o711iOVbpE/NrVD1QFUhh1OAjkorzlAuBOAmVDYXs6h0AEiIUfHlXrVuOnNhshMRm7D4HykGgwChXSgCNdRcrzLY+Fm+K8x8tykBhpkGqwzXzeMfVyplcW0Rsr/zDSyRVc1vqdnKvEEwQRRhRf3zWFOaWWX/FgoHj7D7ZgOe+psauL+ToAjn4jSLnied/u1DLATS7mKeVgFt9BlRQMrqdGfZXa6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.12; Fri, 7 Feb 2025 11:31:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8398.021; Fri, 7 Feb 2025
 11:31:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?=
 <michal.winiarski@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v4 1/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Fri, 7 Feb 2025 12:31:11 +0100
Message-ID: <20250207113111.853821-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250207113111.853821-1-piotr.piorkowski@intel.com>
References: <20250207113111.853821-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f2ddf73-b64e-4dd8-bb21-08dd476af8db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmY1am9jY2NnbjdTWUpuS3FrQ1lOL2t6SjRZT2l4VUo2MGtWV0pPRUFLRmhB?=
 =?utf-8?B?dmp0NFVFaUxyc2tJNEE5dWc2alhrOXBvYWZ4L1gwTk5jRUhHTEtDLzlOTmxl?=
 =?utf-8?B?Wk1MUEc5YkNUYlV3MnQ3SEc0NEQyYVJPVXVtYytCR3NRakxtbEQ1UVNrOHNp?=
 =?utf-8?B?WHptWC9MU1Y0UThjV0IvTk5XckxubTl0OW9vV0lzanlOd0M4UDFCZk1FMVp5?=
 =?utf-8?B?amxOSFFHaXU3ZG5JSDZoQlNjbzBlYWxIZlhMemMvakt6ektOV1h5bHBReC9z?=
 =?utf-8?B?NDIySHYzZzhudXdxZFpyTGhKeU93aWRhY1hqK3luNmkwUkpXcXFqdGhaRnhI?=
 =?utf-8?B?c1RNTGV2alpqUkx5dGEyemZyc1pMNXhHdW5weE4ycTloSGVIcG5HNkpmNklU?=
 =?utf-8?B?Y1l2cmxUUGVDWkl0cjVaakoxMTJqV1JrdlFvaklMZ3Z2L3dlMGduM0F3cTBU?=
 =?utf-8?B?NDNPY1l2UFBmb25STDZuV1JDMlFRNGQwbXR0NGhldzYwYmRTeVFiRUVRaktn?=
 =?utf-8?B?MVJQR0xyLzFWaCtyNEJZdklLM0JUYThQMEROSHBwK2p1U25UMTJvZjYycklO?=
 =?utf-8?B?TkFIYXZQRk02cU5iTWw4MVNFSElzZ3ZJSi9pbElVWmFxWlZlOTczZ3dPMGlH?=
 =?utf-8?B?eE1rMjVQZW94NGE0QzJOZUxqQUNSR0ZlTFU3NlhMVTRkUC9vVzVpSWhlcVhK?=
 =?utf-8?B?alBScWRTRElDVVU5dDlNSXVZdHN4RTFSOHVjSzNvZ1lMY1JHdlJmSUM1R0xw?=
 =?utf-8?B?Q0NyOGd1cGMxOXJsT1JMbUFzVnhKeEJNOGhVN096YmdBZXNHTmovYWRBYVBY?=
 =?utf-8?B?S3p5OHA0MngwNFFseUF3R0dCVjFsdy9EZnh1UUZlSUlCRUJWRDN6N204WGpT?=
 =?utf-8?B?eC9IU2xST2k5cnA2aksySUhiL2MxSXBwbldrNEN5dThlSHFUZzR4VVNGQ3dz?=
 =?utf-8?B?UU9sU2I5REkzYk5PYVNrMFBQdXh1THZoajVuZFlEMjhoSSsya3RZY3NveVQy?=
 =?utf-8?B?aEgxTHA0SEQwaFNmT2pyN0JJZnFUTnE3ZGc2azlpd252YzdYNXU5YXduUDl0?=
 =?utf-8?B?eG5kMkZacGVIa2FoY1NaWjh5eXhCMDJVM2VMa1ZVa1JFaHJqZEdwTEEvSGJI?=
 =?utf-8?B?RHlBdVA4RlpGT1l4eEkra2p4VGtNVUJJaDJkaGNueFdwdndWMVRINXR3Nmg2?=
 =?utf-8?B?aE10SmYvQ0U4U3pCMkZlOFVaaXZEMkhCMWd3ZDJoRURNTGRLRUJUalk5d3dl?=
 =?utf-8?B?WVIzR25ZTkRFRUI1bGpmUm5CMTVFb2hRSklrN2tMZkgwMXQ3R2crYU4xT090?=
 =?utf-8?B?R2ZFZXlzQllmQW9lNXJLMWJsdHB6ZzkwcHUybnNYaUZkZE9kTUlkS2VUMlkx?=
 =?utf-8?B?Tm5hU2RYRkpqU0RibFN1UmRZUVR2YTFDMHdJZ0dMbng2MlhSSnpNYnhPWUhn?=
 =?utf-8?B?RTlLSlBRNXVmb1ZIaWYrcXFzYXFWTEovWXJaSy9iWmdvc21wcS9IU3dEWHlQ?=
 =?utf-8?B?dmFtOFRWTmMzd0lSeFVYSmZFak0yS09DQnpiSHo1ZGN3S1plNHZmWCtBV3do?=
 =?utf-8?B?d0hsTVFZbWZHNGMvTnNQRTQvYXUxcFJ4VTRKdFNNbVh1cFRRVGdXTzEra2xw?=
 =?utf-8?B?bzFudHM5YmFFeCt1ZGhDT0RFTnN5WitEaG1xMkNCTXVWTkt1SUIrankwY3BI?=
 =?utf-8?B?M0QrU2ZCKzM5dGFNYm8zRENEemR3ck1FeTRXZnM5akdhZXNObUVuT3hFSUpj?=
 =?utf-8?B?LzQ0VGRaK0xJdmRja0tzTHFFNWdTcUpUR09vOEJ6eEpMMWZTVXhyTVcyNmIv?=
 =?utf-8?B?dGcvaFh2QUdQUnUxL0NhUG81WkJ2NG9YOS8rRExzeUtYc0VTVG1YbCthd3Jj?=
 =?utf-8?Q?cjrsmzHoVgwaS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmdCOHp1UXNBZXV4c0JZSGdjbk5iR2krbjJPOE9TVjcwU253djM1N2lqcGVk?=
 =?utf-8?B?cTBEakJURDhJM2N1cm9ydDFPU1Y5STBpZUcrVFE4MXdsaFJqdlg2QkRoY2N6?=
 =?utf-8?B?ZmE3OHBJRFRnVlRrWklHTDB0TUptNXBqVVFRRTRNRFpzM0h4MnoyYkQxOVdY?=
 =?utf-8?B?TFhhcjYyRmFuUjRXeWhiSmJVb2JIV2tZOU9FMXJlcXg0Z0kraVUzMFp6Sm9v?=
 =?utf-8?B?U01iSlN5dTl0dFRoUTBxaE5lNTNLb0NMeCtxNHNXQjB1TjJwdkF2WW1vbDMz?=
 =?utf-8?B?VmsyTndrbzU1Ujh4cCt6U0VwNmRkbmpvZndXMFJMQ0ZxTkh2Z1NGQVJVazA3?=
 =?utf-8?B?b1JnVVBjWDBCSkNqMkE0UDVTRFNXTzBEa0ZkN1dtcVRHQlo5R3lpRjYwNXRl?=
 =?utf-8?B?Sy92a0FHQU5ZcXdyaGZ6K1lHYnprbHlkbXBVVHJCZHovbFdMVmw0S1ZXemR1?=
 =?utf-8?B?RXBuUndIQzEzUXlFRWdPTWxvRXAxSjVoNjdQamt0a0NMcmdXWkkyeDYvckVF?=
 =?utf-8?B?aVk2aXc1TGRwUFBmMW9sUTAxZE9TSExNV0U3T0Q5R3Q5eXJLT0VuS2xnM01a?=
 =?utf-8?B?eHZOYitTeC8rZTQ0cUw5KzZma2NNbkUxZlkvSHlNdFg3d09jT2RLenFRL0VU?=
 =?utf-8?B?VmFqalhSd0FOSTdqUFg1YWtzV2tjcUt5cHd6MktPQk9EMzFhbmZUcy9oVmN0?=
 =?utf-8?B?SnVMQjNraCtwa3o2YVBYRlRGQUVPdGhoc2ZFN3RmRDU3U3ZNeSt3NFcycWc5?=
 =?utf-8?B?V0ZMVGNhdERJZUdKcUl4eGZOR3psNlowenpGV3V6TnlIQkRXWkdjQXBKUW8v?=
 =?utf-8?B?TGdEaytYOEMrQVdpeEhaVmozcFNrcWQrSUxqTEg4ZkZVTmptOHlDdXRWak53?=
 =?utf-8?B?cnBXdGhjdCs0V1NqcUdwcHlPMEwrd25BcHN1Vnk0VmVTM3daMTN5ZDdtbG1I?=
 =?utf-8?B?QlVKUjcrVm1GQVhrRjBoOTFHeHYvOUkwNlZLcXNjY0lzeTZySzYrUnJHZWdz?=
 =?utf-8?B?aVBCenZ1SGlPNUc5SVFwQVZtc0FHdTk2MXVGUHVTNXdVM1NzWHF4RzV2NkZ1?=
 =?utf-8?B?d3BTY1lvNGZkRXVLNWhsL0xCM2lFODY5WVN4Z1UrZDY4UXFHN2htRnM0MEZC?=
 =?utf-8?B?VDcwY3pvdU96TEsrNFNzaXY5T28vdGRtQkFhSDIyM293eDdhdkF0VWI1cnhE?=
 =?utf-8?B?ZTc1MHZtTGhXeWhGVi9oNXpFRTk5akN4YkJOWEg3NElubkNjNldIaHZHak55?=
 =?utf-8?B?T1dkMEhzcWtGQVNTeXhyQ3JhSTYzMUN6TldmWHNlZVNIZGR1QkRqWmJuNmp5?=
 =?utf-8?B?YVBUeDZndlZ2ZUhnd21YdmxXaTJaZWNTSVp3a1hPSXpsQ0tGcFJ5aks2MThJ?=
 =?utf-8?B?eno0M200TU9rKzBZNDBHdmJTRUhqUzVJWmQvVS92TE8wMDIwUjlEYzhBRGJn?=
 =?utf-8?B?SDJUU0dBb1RHQ3NlRTFqV1g1QnZsREdVRzV2eGZxcXVNLzFoY2NPRGx4d2hB?=
 =?utf-8?B?b1lBTXdjOEVHOEZtNnA0Q1Z0SmlzNnJUaFFBR2xya1FRTU9rYThuVTl3emIx?=
 =?utf-8?B?YzdtL01MZEJyUWVHbUlJRWZ5RmpsSll4QlVvVndOdFZXTm1rN2RVOVVZek9o?=
 =?utf-8?B?aUZvN0F2em1qNFlaZjhxa1ZxOVdGTGVKRkVzTmF0dzdmN1gwNUM4cXB2UVVY?=
 =?utf-8?B?bGtFNUp4RTNqakhtYkhHbG41RCtGL2hIZFpPUUZvcnlUdDJUdm01amdhZHZQ?=
 =?utf-8?B?bCtwcGpyUFg3UTlzNXdaM3Z5OWEzK1gxZWNoU3NsVkFrU1BPbk9hRVBVazJw?=
 =?utf-8?B?NGFPdEpFSm1uL2JHMk5EaDhOWUxBU1dNSTFLMHpZbmFvYW1TT2JVR3B2NFBq?=
 =?utf-8?B?Z3hhakFqQjhHWjV2WFVubThRVWJ3QW0vUEZCRkQ0UUtEcllNLzAveGhqOFI4?=
 =?utf-8?B?R05rckJZZVpWYnZPemthd1drK2xZZXZVRFJVQVJYTlhtVzlzQzZSSmJZb25a?=
 =?utf-8?B?YVNuUzR5ODFMN2J4NnBnVFJJKzBodmhodjM4VE5yZlpMZjU1TUg0K2EyQzk1?=
 =?utf-8?B?M0N2T3NQeHVXbVl0ZWhZcWIvbTlPTjE0NWJXL0JvS01NeDFHZjNNeGZYQnVN?=
 =?utf-8?B?eDBaZEpsQnFqdHppaTFWRE8yWFJTSWk2anMyM3hnc2hKaUF0blNFbUtubEFB?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f2ddf73-b64e-4dd8-bb21-08dd476af8db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 11:31:32.4593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jqtmPm54byMAWt6IeIhfBJMY0rYnk4itwmFmGIHnooBjVmKz15i21eqem9FYO0l1R7Ze1KSCDvApen9c6IFDtgifz0FBbDqyxmtJJm3cfYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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

So far, the main condition for using LMTT has been to check that
the device is a discrete gfx.
Let's add a dedicated function to check if the device supports LMTT
as not all future discrete GPU platforms will require LMTT.

v2:
 - use xe_has_device_lmtt only when necessary - leave IS_DGFX for other
   things related to LMEM provisioning
v3:
 - remove IS_SRIOV_PF condition from xe_device_has_lmtt (Michal
   Wajdeczko)
 - keep IS_SRIOV_PF asserts in LMTT-related code (Michal Wajdeczko)
v4:
 - update commit description

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Michał Winiarski <michal.winiarski@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 21 +++++++++++++--------
 drivers/gpu/drm/xe/xe_lmtt.c               |  4 ++--
 3 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index fc3c2af3fb7f..0bc3bc8e6803 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -170,6 +170,11 @@ static inline bool xe_device_uses_memirq(struct xe_device *xe)
 	return xe_device_has_memirq(xe) && (IS_SRIOV_VF(xe) || xe_device_has_msix(xe));
 }
 
+static inline bool xe_device_has_lmtt(struct xe_device *xe)
+{
+	return IS_DGFX(xe);
+}
+
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
 
 void xe_device_snapshot_print(struct xe_device *xe, struct drm_printer *p);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index b1d994d65589..5c3e9e5bd051 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1336,7 +1336,7 @@ static void pf_reset_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	struct xe_tile *tile;
 	unsigned int tid;
 
-	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	for_each_tile(tile, xe, tid) {
@@ -1357,7 +1357,7 @@ static int pf_update_vf_lmtt(struct xe_device *xe, unsigned int vfid)
 	unsigned int tid;
 	int err;
 
-	xe_assert(xe, IS_DGFX(xe));
+	xe_assert(xe, xe_device_has_lmtt(xe));
 	xe_assert(xe, IS_SRIOV_PF(xe));
 
 	total = 0;
@@ -1434,7 +1434,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 		if (unlikely(err))
 			return err;
 
-		pf_reset_vf_lmtt(xe, vfid);
+		if (xe_device_has_lmtt(xe))
+			pf_reset_vf_lmtt(xe, vfid);
 		pf_release_vf_config_lmem(gt, config);
 	}
 	xe_gt_assert(gt, !config->lmem_obj);
@@ -1454,9 +1455,11 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	config->lmem_obj = bo;
 
-	err = pf_update_vf_lmtt(xe, vfid);
-	if (unlikely(err))
-		goto release;
+	if (xe_device_has_lmtt(xe)) {
+		err = pf_update_vf_lmtt(xe, vfid);
+		if (unlikely(err))
+			goto release;
+	}
 
 	err = pf_push_vf_cfg_lmem(gt, vfid, bo->size);
 	if (unlikely(err))
@@ -1467,7 +1470,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 	return 0;
 
 reset_lmtt:
-	pf_reset_vf_lmtt(xe, vfid);
+	if (xe_device_has_lmtt(xe))
+		pf_reset_vf_lmtt(xe, vfid);
 release:
 	pf_release_vf_config_lmem(gt, config);
 	return err;
@@ -1981,7 +1985,8 @@ static void pf_release_vf_config(struct xe_gt *gt, unsigned int vfid)
 		pf_release_vf_config_ggtt(gt, config);
 		if (IS_DGFX(xe)) {
 			pf_release_vf_config_lmem(gt, config);
-			pf_update_vf_lmtt(xe, vfid);
+			if (xe_device_has_lmtt(xe))
+				pf_update_vf_lmtt(xe, vfid);
 		}
 	}
 	pf_release_config_ctxs(gt, config);
diff --git a/drivers/gpu/drm/xe/xe_lmtt.c b/drivers/gpu/drm/xe/xe_lmtt.c
index a60ceae4c6dd..89393dcb53d9 100644
--- a/drivers/gpu/drm/xe/xe_lmtt.c
+++ b/drivers/gpu/drm/xe/xe_lmtt.c
@@ -164,7 +164,7 @@ int xe_lmtt_init(struct xe_lmtt *lmtt)
 	lmtt_assert(lmtt, IS_SRIOV_PF(xe));
 	lmtt_assert(lmtt, !lmtt->ops);
 
-	if (!IS_DGFX(xe))
+	if (!xe_device_has_lmtt(xe))
 		return 0;
 
 	if (xe_has_multi_level_lmtt(xe))
@@ -486,7 +486,7 @@ u64 xe_lmtt_estimate_pt_size(struct xe_lmtt *lmtt, u64 size)
 	u64 pt_size;
 
 	lmtt_assert(lmtt, IS_SRIOV_PF(lmtt_to_xe(lmtt)));
-	lmtt_assert(lmtt, IS_DGFX(lmtt_to_xe(lmtt)));
+	lmtt_assert(lmtt, xe_device_has_lmtt(lmtt_to_xe(lmtt)));
 	lmtt_assert(lmtt, lmtt->ops);
 
 	pt_size = PAGE_ALIGN(lmtt->ops->lmtt_pte_size(level) *
-- 
2.34.1

