Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E97EC77B7C
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 09:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F39B10E55B;
	Tue, 24 Jun 2025 09:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IYiuDyCb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92FDB10E55B
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750756960; x=1782292960;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=16bhv/0INBm23Duy1DuI1GYf2geVLhMNLS2b6x6GQRI=;
 b=IYiuDyCbqS9ERmInD36k1GeS1ZyuCFvWFBfYDyMYjFPiAIccEucBWpGz
 jsmjHXCRgeUNZOKQehRrxpdvmUmMXgtOY/fHKNSryixYhgO4kTVQPeMKN
 +a02paEE+5UCUPDkpDOD4DWZ3uwOGQWNobpNZcrBdxmunBdQ2f7D+WhPy
 SoV2Lql3MOLgqIl/cexGI2JecJND5Z/vjBa8TlciGkok9aJ7sqJpfMq/k
 fqK0li0gK4YbrF4bSK/cYxR0TL5lc6m3DKM9/UldUb7Tr3gOq8QB6DGum
 yYWcdUUXR4Q2NZlEAxNlNg2iSEatVJ1n1oS0yVOMs6Xlzde5h+qcs4u2I A==;
X-CSE-ConnectionGUID: y0jvhy5FTNW/3TaMG0e6eA==
X-CSE-MsgGUID: D6x6xPMzQ8ygRUdhCI4mlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="53081928"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="53081928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:39 -0700
X-CSE-ConnectionGUID: 62M8MCliRPiPoCI2BI+Cpw==
X-CSE-MsgGUID: GH5as7kOR/i2phV7zCBiag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; d="scan'208";a="151346100"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 02:22:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 02:22:36 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 02:22:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7gUKpn1tEHRUo8os1jxqJrwujnoqOnpuCa5bAJB815vnrIzQvdI9P4CCaj4stS5yI4Nr3uANVfZQ8ek36Yq9V8Z2hEzB0CMrB2NFaGjkJ7SV9g9vjHzpGStQ3Vfla+WlUXfN7Ou0zHvwlFcejTuhjhb2SQHZBPhl44QdJO2L/zxNU88G2NvsUzdMru2B5MUq44hN1EDWTIXplWNHmy+AN49rnW9HS/8HPJ6w+Xr3DjV1JOsO4XtFj58SYdQPQ48Ob8FDurwkaveqwdreTsrw/LIkTwmC4YvhTyn3T+6zEjs+Lb8WQQlfChSxNqCrKPKJmXBGictOfzASw+Jki8pTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IoH7hh1Bfhc3Yxg4WfouqyHzTL8y6a5jCfLyzG+0sE=;
 b=YN8RcLtIREjQX0MVWcaAh7WL0IXv2SXnpJPxD/vd1kJYXqSYPCe7Tw8TlufHNShQj4HFcbcnWQkml/fsQxOHkuaIDcRmrB+iR17jkLRGjzTHIW6X04JBVhXRO61dgGj2LeQwnTSMhQPpis9BrE56ewjYRaqlpxTLL+rDLLYh9/Ei4YTUB7/qmFQfrXfftdQNoN6cqwAcdHOw96p92CBjcmjAE50AHL09jzr9e1Ql/WKpsiT6KxAvr3FDkH8DpRWYMUXxmhQpcmBKoYp1CbbjmgB57S7QyRsZxdivBtUpt9WZomlQ5mGXyt3gnRMfWOoVd38865W1lZvIrXIVs13OOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB7690.namprd11.prod.outlook.com (2603:10b6:8:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 09:22:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 09:22:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Tue, 24 Jun 2025 11:22:11 +0200
Message-ID: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR0301CA0100.eurprd03.prod.outlook.com
 (2603:10a6:6:30::47) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d9d3274-35fb-4afb-e97a-08ddb300a1f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFpweDFMREY4ZFBjVm45RlpBc04zOXpyUUsxR0tydHpKWERUUXU3Mi9KbHNU?=
 =?utf-8?B?RithbzZUaE1nYmtoMnYybW9pVXc1TDdXOUgvdVhyVHhrekw4QnhBbkYrREJn?=
 =?utf-8?B?bnVYWHREcjdFOXQzbEJpeVRqcGpOZmJzd3IrR2RSaWZGLy9ubzgvRU9ZRFZy?=
 =?utf-8?B?eVN4dzRKRy9mVzZjcjhTNEZ4c0FUN1BEejB1WDY4M0F4NkVNNWJBZUwyVUph?=
 =?utf-8?B?Y21YZEM0V2FVc2hWOTExc1VGZXhLN094OFRLazkxWmd5SmNNUDZxMXdFQm9R?=
 =?utf-8?B?NFFaUXNaaEd1ZXExWDFlQnVjUTV4Zm5SMVBaZDlRbmZQSFYxdGptYmp6R0xa?=
 =?utf-8?B?Ym5sZ2ZnQXJ1V0Z2aXo2OGJkU201eEswRXJoWXZMa2c3ZkNzTWdYTnc3a25v?=
 =?utf-8?B?WGxXTzFOYVVhK2FVeDFwdG9Xb2ZDbTdiSURRdnBydFVTU1lQdml1OHJ2VG5Q?=
 =?utf-8?B?Mm9TaitaZXhnSHoxS3pMSzlVUHVFWWROMjVPWERXVnpFQ25wNEQ1ZExiczNM?=
 =?utf-8?B?OXlFVCs0L0VhaVRRYlBad1dpb0VqazZ0d01TczBMRXRjbkJLaFJ2c0lmQnFM?=
 =?utf-8?B?Q2RyTkptb1hLaWlad0tDajZ6c2FSb3dkYWdIcHZPT0ZwQzhCaElBSjZTQ0hJ?=
 =?utf-8?B?M3hGUHIwVVlrTVZnckxZMjVCVU93TWI3NHhDMDVCVjIvdm5UdVNZQkJsNUVY?=
 =?utf-8?B?YXQxOW94ZWpmazZOOVo1Z2V0VGZNSm80S2Rad0l6TXNPL2xMTlhJaHRPWWhl?=
 =?utf-8?B?Y2ZJYnNUWmZ1NXZWYW9ITmhNVDl5ZzhKeTdpdE53bkJ4ek1FMUwzUDhveFF6?=
 =?utf-8?B?QW1nd2tOaVpGVmowS09WWUkvRHhiVDlvTHpyNXNXa1lqWWhjTElRSms5cmNB?=
 =?utf-8?B?N0trTEZON0lOQVVsUFYwbWk4UGJZNnplUjk5b0FwQllSbzNKMGl3aW1LM29Z?=
 =?utf-8?B?WVZoeEthV3B2a1AwRG83b3lsNmtJaDhuUCszNkxpUXFvV2o0MmVuSHhoalZ5?=
 =?utf-8?B?d21VZk5ZTmVPUDlXZERabVF5SklqNm9zYmszWWJUT1ZEUXFzRmJzTlowbklG?=
 =?utf-8?B?T0dFMUhoR1J1ZXdybjdrVGtlVmJwc2RtYUNYT3NEazRFQ0NxWmM3ZkhSYW5N?=
 =?utf-8?B?YmhaTDNiU2ZzZWR2ZWJEMndVZXl5M1ZKU0lxWU5tK3RDUFREUk5aRXRqK2gw?=
 =?utf-8?B?aXhJYit1bjYwVjNXMnc4TnBRNmpiVGFsVHhsaHRTRFFUZ093c0pINDBMSVZN?=
 =?utf-8?B?NmdGZGpWQTNlRTVWRnFkN201T3ZLTDZuZEIwUTYwNkllNk1CL1k4STlPaEx1?=
 =?utf-8?B?eUttTjRnZmJLSWJDbjY3VERSSG54L2Q4MFExWkxsRzRIeFJRWVBkbEpRUk03?=
 =?utf-8?B?WmlYZlRZOXo2bG5vdFVvVWhZK2N4MVlEV1hpOHNDTVVVdDZkTEhsMmR6ZnZU?=
 =?utf-8?B?ZnY5NDIxc21YTUw4RWM2QkxoL1VhRVRFeWdweFNVZTZsK1NhY1o0MXR1ZVM2?=
 =?utf-8?B?b3JWNU92a0dQWHEvZ0VrOUxEblQzT2RXY21qM3h1amhKcXlMcHNlYlVuY0JQ?=
 =?utf-8?B?TXNreWRDRDJmTDh6OEk0WmpLUkxZd2o5TjE2RFFOb0ZxSnlaYk5SRTdDTThh?=
 =?utf-8?B?OUZ4NEg4MUU5eDMzTXRJUUgyWktPbi9BUjdWY29aY05jSEtRTXBRTmZja1ps?=
 =?utf-8?B?QnRPZkpRd29rNkxFT2Q4LzlTOGdFZkFrb1BwM2ZISm9rMWlSeUE5dXpxTmhS?=
 =?utf-8?B?Y3g4QnR0OFdOcnl5eENsb21Ub2hQc0lkcnRmVTR4aGZNemZEUHJwZzVlZklx?=
 =?utf-8?B?YkxpQ0FwRUFVRFNCV2tsaThZenpHR2NLb0tRVHFHWGN2VFE1aC8rRUExQzNr?=
 =?utf-8?B?Y3F5OFNRN1lCRDVBMWxZNERQbGlxWkZ1TXZGUWpGcFR1aHFjYkVKcWdLb01J?=
 =?utf-8?Q?X0Cdrz31qeM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUJBTktTbTJRTm9kZ3lPam5qZitHU2FvL0NKUVcvZXVkZDBXWlVIanlOYlVP?=
 =?utf-8?B?cWJlV0ZjcEV4Wi9UcVdxaTA3bGk3NXR2cTh1NHVzanN5eExUSUhqR09SWXdF?=
 =?utf-8?B?VkRzZWVVQjQyM2FZanIvZjI1K0RkbGhaN3l1NWdRaFRUWnQ1UjBJSG96QnE0?=
 =?utf-8?B?VjRYelNmQjN6bGdvTGcrUW9wOU1SeGxVNzRwODVyOXd3SGFFUEhETG5wTUR6?=
 =?utf-8?B?bVFJclFpSEhoL1JuUXE1T0FvbUkvUERpZGhia2JISEp3dXRtak84MzNuWGZR?=
 =?utf-8?B?RG9RMVZ2V1F2czBFdDZCSm1MOGIvVkhPKzYyWjBwNkdIQ2M0QXRCQk00QUo4?=
 =?utf-8?B?NjM1Q3RQTTFnTW9zaTFuYWxnNFh6Vmt0YnBRN2tEc3ZjSlFkNVE4Z2VjdDNC?=
 =?utf-8?B?bTFlTXI2RjMzUThXYTB1SDVabVZxbjRJLy85QzNyNWtXbFdHME9WN21kellE?=
 =?utf-8?B?dkE5SHFSemZZTlNwbSsyZHJMWmtDcnk2M29zdzAveGZrL2ZiN3J6VjR4cXNB?=
 =?utf-8?B?M3dRRVFEU3R3TWdyRjV4Qk5XUThOem0rcXdtSFZMM0ZlWENjTldoYjl6ZSsz?=
 =?utf-8?B?YmtCMjBuNFQ4OW02cnRUZE8zNVNoSGFTd0szTnY5dmlXenVPdWk1VTV1a2o1?=
 =?utf-8?B?V3hXY0N5NWlCeGhpNXdVamUwYXVTUDhKSEJQK3Y1Ry92TDhBenhsajR2NWVM?=
 =?utf-8?B?MnhlMDYyNURKMnRtUjh5d09EanBCWmdaRGN4MmxMd1VhN3p1V0VXVUl3aHdn?=
 =?utf-8?B?WUM0N3JvSEMwc0VycGxVUjMyR1RydUdUR3dYaTlsWEVNUjgrZmtGNm1BcGlt?=
 =?utf-8?B?b29oWHpFMmJHVkdPVWRSdVdCYWRBUFB6aEFrN1VFQ1VUNTNzd0txY2F0WWVL?=
 =?utf-8?B?RWhrZEFhYXlXSFh0ZkFaWDE3RlcwdGt2N0dJMzZWYlNlRnRiS3dBWG9JQlYr?=
 =?utf-8?B?K2tnNmh2YzN6dnVYYzRhTWdPakIrYU9WM2lQM080M0JXeUJGb0loc3pMcWsv?=
 =?utf-8?B?ZWxHbDByLzFiNTlJUjFMK2cvT3o2N3dyK3poRERGRDh6eFY0U1ZFRnRTYnkr?=
 =?utf-8?B?NFNSUWZFeUJldk9jVUkrTUNsbjBub1puMis3elVnS1FxL1pBKzU4aytiWE9a?=
 =?utf-8?B?d2Q3K0prbzZEUGFtcFdyM0x6NzNuUFhpVUlFR0d3VFpIN0IrWWxsWk8vTG1p?=
 =?utf-8?B?cmdqa1NjTG5acjRDK0VudUNCL2wwTlVjWmJZUTZHK1FlRXAvSjN6VjBXUWJN?=
 =?utf-8?B?dlh2V1ZCcm9SRmJFTDFqcDY1L1FuN2pBOFNBR0FLcm9CNkxuVGVjRnUxY3JW?=
 =?utf-8?B?R2s0ZG0rRWNhL1dLN24zN2tNT0puZUVVTjdTbE02SW5mS1VzeEVNU2Y0Z3hC?=
 =?utf-8?B?dUxnNjc1YnZtVzFKSjVpekpRMHoydUVXbXZDdWI3RjhHSkpPNHVNRitBcjhy?=
 =?utf-8?B?a1lRSHlqczdESURmUDRLME54OWJEblR4THdzQUR3MWd3eEZ6L3RGWHdyQjJS?=
 =?utf-8?B?ekc2cXZXM2VmbkJ3YmR2UkVGVkJaUkl1WDR5WkNiWFY3MDlBQWtjVDhOTEc0?=
 =?utf-8?B?T3dPNmI1a3VtZWNVeUhhNmNRNzUzcFU1M0xZUEl3NmpGQTBqeWRhVG9hTFMv?=
 =?utf-8?B?WUhnQnZRMmhycHlMbEcwOGUxdzg5NGpvYTJzbVlQM0VMTFcrZ0x2dHh2ZGtY?=
 =?utf-8?B?cWpTWktRcFlBYXJETlBZNmZXVlNRM1FFaU8vQWNDRUpMT1cwN3FCTGtGV05W?=
 =?utf-8?B?Y0JxK3pMSWlFdFZxazZTdWxlQWwrbDRWdGZmbmJteXJ3dGZvOEJiOFFsREIz?=
 =?utf-8?B?N1RTdHhGT2pycnF0Z3ZQN3hoSmF0c3phTXRsZVFENmtvaWpjZmpDMC9sdHVS?=
 =?utf-8?B?NkxZRVg3OGtwS1NDWm1HZ2xFUWFMR1NybnVieERwYTNJV0JzRTlKSU5YZm9N?=
 =?utf-8?B?bVRZM1VHL3ptaW1XZnZzOGxnRmpkWU9vbVRIV2lzamgza2Z5SzdqZW9GeXBx?=
 =?utf-8?B?dXFiVG9Mc21zRWdHVkxVT0JpM0FqYW4vbjNQWkJZK3VTVWVUOE42QnRWMjJW?=
 =?utf-8?B?TU4wSi9YS1AvVHB5ajNBczVGVEpPbVZ1OGR0SnVpTmxSL2ZKSy9mUjhhdFM3?=
 =?utf-8?B?TlNjNVViUElRbzNxaE1SMDJXcEpBZXRJU2lQbXlTS0hhZUlLazRSZlJlUHdL?=
 =?utf-8?B?K0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d9d3274-35fb-4afb-e97a-08ddb300a1f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 09:22:25.7325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eWSQH0j79LhWSx4GLEaeVqI0ZOBa9+M40lZWEtFWWa6adH+2LT6k1EBBTCk1RMPTUOFTh/0LFcz+9+XmENLRSIi48mVaEgXnudKvhssIfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7690
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

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>

Piotr Piórkowski (2):
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   2 +-
 drivers/gpu/drm/xe/xe_assert.h                |   2 +-
 drivers/gpu/drm/xe/xe_device.c                |  19 +++
 drivers/gpu/drm/xe/xe_device_types.h          |  14 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  12 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  18 +--
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   4 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  17 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  57 ++++---
 drivers/gpu/drm/xe/xe_tile.h                  |   2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  18 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 152 +++++++++++-------
 drivers/gpu/drm/xe/xe_vram.h                  |   4 +
 18 files changed, 217 insertions(+), 123 deletions(-)

-- 
2.34.1

