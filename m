Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78C9D2CE17
	for <intel-xe@archiver.kernel.org>; Sun,  7 Dec 2025 21:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839C010E373;
	Sun,  7 Dec 2025 21:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TzRfCzC4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEA8610E373
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Dec 2025 21:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765144733; x=1796680733;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5NN7t43oFeY9cyH9UbX8TqItVSt+Ikfy/gFN1C66nSE=;
 b=TzRfCzC43qby8U/mnnTk9om+SvZeXU0wHj7LBeb3QGpO5baX5YzeN1ER
 p8kozfmxvDK4Q4hsyRg3m1/EulsFMrNr26BVgAbmtkngi6jR/uwf/LI4+
 Qy8aYA7Ofg4wTXbOgAoikjb86pkywrfatATdwqLReE4+V/M/8Y14aRODl
 Cee1aiX6bzfyYsNSXnAMRsddBfRGRZsAxouVrbRvVUnlQX91JAJGBYL4v
 CtlbqO7ULX3d12QGo7CRh9pjAjEJYr/NYDgeIF9tL2+rGzAR2Xv9fVaEM
 KlanzqT4YNJdzjhoyIL1TtXmIzuLcTw9oOoFLkuYoUKzzNoGV2VeHXO+T w==;
X-CSE-ConnectionGUID: UmBcQt2QQmeIwWMvlh4IuQ==
X-CSE-MsgGUID: MYyOS9UsQImchU4CnBDSbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="78208636"
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="78208636"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:58:52 -0800
X-CSE-ConnectionGUID: 7kVgXG3FRFKobLcHZsVEhQ==
X-CSE-MsgGUID: d9Mt4Re6Rzy3335nwz7okQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,257,1758610800"; d="scan'208";a="195805030"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2025 13:58:52 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:58:51 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 7 Dec 2025 13:58:51 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 7 Dec 2025 13:58:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUM+gJTPUR/NPOYZQcSDzxlALaHz31TozOJ2/1itffJv/q8nq0wnJumA+SbEhgfpCRX+W5qNCAl0I+Efji7X5DTCRs4i4jQKu0TfACK80WhwyfzULgOxsij2TiJzF+6Er5egErqe+PCU3MVmDTHSxErQzWdzOKI5yMJANXwcMV/mp4BdiIIAJwg5vFGXhaC9OMwFF9Xi9zHHdm4Ax4owd4SatWeBop1Z1RLHi27o5Ogtme1+eJMCGsoH1iPx4g8uS2sP3UYi+OKT5+Al9TQrK8taYbzM7cJThB0bt3DnDIp/PnluRGwrrZwPiuw1mcAwZY5v8x5VO5jhb7Oz/HVVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ3FpXHrf+lM/yLSWUN8COZHOh6s3pRtNbpul8j69nI=;
 b=R15vdS/Vzrx1ym/FPBkUpnCrlLM82mHJYdhZYJDTucH2BXfmikHW9gYoUtzYS+91XOjmlaPFrpnytYizB1z4zs98bKVptCcXMZeAEm8/+Z4dYjkZ1tp7bg6+S5ryJjmBSlxus9mwk+fnCUWf9BPq36va+GDdOlc5x7tXW8Sx2RQSdPXatfVgjljHPZ3maRleAYCAktlM0Fj1YuV2kRvWunoQDMrwu6QovyFBUox1UWr4/lFytBFhWK5KIhjyMW1FVQrkNirDiitllkIfeHTAGLWf/A16JLNQWbnrdngKCb9F7UMdqOHwARa2TpI+jT+Y6kt/XmAXgForoMv/sS44lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Sun, 7 Dec
 2025 21:58:49 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9388.013; Sun, 7 Dec 2025
 21:58:49 +0000
Message-ID: <00656e7e-09d7-47d8-80da-35f035c9db20@intel.com>
Date: Sun, 7 Dec 2025 22:58:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] drm/xe/sriov: Scheduler groups are incompatible
 with multi-lrc
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251206230356.3600292-13-daniele.ceraolospurio@intel.com>
 <20251206230356.3600292-17-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251206230356.3600292-17-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0025.eurprd08.prod.outlook.com
 (2603:10a6:803:104::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 97df617b-6ea9-4a7d-bc43-08de35dbcd41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cjZJRW1aUjZySExERGFrN3hqRmJSN0R1QnZRWlNpdFE1ZTAxTmNVWkZac01K?=
 =?utf-8?B?NTIxQWlTMTE2VFhvZDVPL0Q5ZUZEYWZHaGN0c1pnWmIxUFlvcS9Td1JSR0RU?=
 =?utf-8?B?eFZWWm1Zb052RHFXTVY0R1hFdHhiNTZmOG92c0FkcXorczN5bUp4a2FqMmly?=
 =?utf-8?B?VEZ2T0Zqc25KOFl1eDhtK3F6WVZaNldNWk9PdUZhUkU2VlhUOEdEcjMvK2VH?=
 =?utf-8?B?UHUreHVZZWJwQll5emF6UE9mTjY4YXJpRmY3VysyeFEwMi9GbTdLeis4aVBh?=
 =?utf-8?B?SnNiVjZUMnBoM1pwdkFzdklSL3pMT3pKZEFFMVRwSEU0dmxNeVUySzNUQzE0?=
 =?utf-8?B?RWlvSEdXSWFTRndLOEtkWmlrREJNYkdldEo3L1hFVXlUSFo4ZitwYWxIYnQy?=
 =?utf-8?B?dnMxdFUzUm1XQlpjZmtzSUk3emhicFBUU1ZBa2FQRTV4ZCtRVnlMamJYV0hF?=
 =?utf-8?B?QSt3OXc2TjB4UnFNOEw4Y0FWeTMwWlJZMW1yNk1DUUNaWStGU1I5NS9MRlQ4?=
 =?utf-8?B?dmdMRVROZTZYSmUyelFOdmJncitXQ1l4KzQwSjdMQlM2WHlwQ0hCV0lXRGxG?=
 =?utf-8?B?NWZSVDVqOVRWS0F6bzlDM1BLMUkwOFVKWHRsc1YwNGxoVTh1ZFdiVHltbGJC?=
 =?utf-8?B?WUxqcW5CVTRHMUtzTGxZN1ppNDdqRjdpRXQrSHlEeWw5bVZpMi84SUM4aGRB?=
 =?utf-8?B?aVIvTG91L01CTEF3SUJ2UnBiODR3N3dmMXI3K3dlWDEwQm5RUG5FaWp3bUwy?=
 =?utf-8?B?MGFqaUpJNmpERjlyMFBma0s4b0k1Yzhmc3BwTW83SkhWdVBFRDNuUTdraEpB?=
 =?utf-8?B?MzV3ZmgydHhMelFZRVFGUGdUNUx5OGF3MlBZcWR2NHpOaWpnV1hvTFpVcUFH?=
 =?utf-8?B?RFNvdUo3NlJ0cHh3bERPOVVxYmREajBNdHI4SEllSGJHUEtjUlR3cFlZT1dR?=
 =?utf-8?B?eUhxQnhYSzlwRTVYc1JkRlFESnQ2elM3S05LZS9NcnRJa0lXVjJTcVM1R0cw?=
 =?utf-8?B?Sy9LUU1nM3BSUnNSelNGWGYxMWR3QmlwcUU4dUNYdXUySzZ1UTZ1MjdsbWIr?=
 =?utf-8?B?b3JjU1M2NlZ4eWsvRkZYYVpuRklTcnJEeFIzK1dGM2pyZEdWemFNblBQNXE4?=
 =?utf-8?B?aUJUcmRlNENJWHBUZGFDT1ZkNXczVzlvdFVlVnZRbTU0eGMvTnVkM0FHWkRR?=
 =?utf-8?B?ejd4MkF1TnRjR1dKUEtYWFFWck1FS1l0ZGZ5MUxObm1QRnFJakFqVTVKYWo0?=
 =?utf-8?B?ZTlQTmVhcG1UajMxTnB2QWJTelVKYnpYVDJpeUloYjJqWisxNndYUEpzc2F1?=
 =?utf-8?B?WElWTkZLTGoxK1FEYWZoQ0xYdHJ4dERGdk1JN0ZIbk1lZVlENzN1UHJzZDJ5?=
 =?utf-8?B?N29EZHFzMzNRQlBkUzVkZEUyeFRSU3J0SkVVR2ZIVUJFa082eUVrQVVuRXpl?=
 =?utf-8?B?aE0wZms0TkVRUVdxdlgvK2NmYUxvM0FTMFI5QjJjY3FoLzNHbWl5Ti9zeVh2?=
 =?utf-8?B?Y0dVcVFRTG1WRDRXSjdHZ0p5RTZFeS9Yd3l6d3lQTmdDUXNHMnlJTXpxL3g2?=
 =?utf-8?B?Qm4wU0M5THBVRkdMNi9yNVVjZUtHckFwTCs0M3RGWmI5VnFYS2lsNzNEQVJG?=
 =?utf-8?B?TzJpWERpSlpMK0paOExCS0NIODhJT3hpLzhzTGZVbzRsSTVyTituRm1UMGFn?=
 =?utf-8?B?bzRPQnljZlozejBOMmp3QVRBZEI5MUdnUE03SUFpb2NtczdiOEtScXVKbjRk?=
 =?utf-8?B?U0EzVFBzdFN4c2RwQ2pPdTI0NTFOQUhNWE5LNEZDWnZOTFdaNmNYMEhwOGZ6?=
 =?utf-8?B?UW81SkQ1UmV3MUFNdm9VaDA5d3libFpZU3hLN2U5WmtzeGZsU2R1SWwwRk10?=
 =?utf-8?B?eHBIM0hDWDh2Rm1YNElOSUgxaWpadFpydmhjcjZUaW9Qb3J5bHpMOWczcllm?=
 =?utf-8?Q?MqteSMEeCLMCYo+xLHbJom6LIjcfZEvx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJ4dlhvV1ExWkh6WUprakxabHlISFZOTDF2RldqblZxQmwwNUlmQW81b2tZ?=
 =?utf-8?B?eWhsM25ualpLdWpqK1RObmw0Y0JrOUlOYVMvWElDbUF2cE0yOERvMjRVeCtF?=
 =?utf-8?B?bHJrYW55cFRKVlNmQ3Z3MTVDdmNCN1hTQW0wZW1CSHFDNmRoWDMvL1R2YTlk?=
 =?utf-8?B?NkRtT3ZiOFYwZjcxbXByYjd1TlNnOTlmL0REUHZ6Nms0L2hqSFEwOHRUY1lJ?=
 =?utf-8?B?ZEF4RC8zQU5odDlNMDhPQVhHVGZqcHZEb1RYMjhrWmZQMXltRTBXSnh0ZmdE?=
 =?utf-8?B?TzdLbmNaNmkzTkpUOWpSdW1YSEcyd3F5eWxBeThTemw1WXhMZU1SbkdwRGc1?=
 =?utf-8?B?ZEZ1SDNZRWRweVA0V3BMN3RZc1NDWTNIV0E1SldnSTNMRGlvME9sTmx3QlM3?=
 =?utf-8?B?eG1GbzczYUdsb1FYeW9BU2VZMGV6QWJQNitRSXBiNmREVzRGNFkxU20vVit1?=
 =?utf-8?B?SlN6OEpiVHBKM2FybnJNMVhyQnUrMTFHVkF6UWdhd2NvOEY0enQveG5RZTdo?=
 =?utf-8?B?Z2IrWk04NEMvdW90S1VlZ09ReEdUTWIyYm1nSk11a2lYYkFwUk1INEl3M2RU?=
 =?utf-8?B?aVRXN0JlaitwZVZ5eEJPM28xVDA1NWRLcFJub2dSelpGc1NqTVBGM3pJQUQy?=
 =?utf-8?B?aUFmak5wM01uTjN1aDREaTFNTWg0WHZrRy9ON1dDVXRGdkIwelJsb1hxY1M5?=
 =?utf-8?B?MkJ1MnlrR29Na2p3aHg3aTJYMW5sQ3J2eFBiVG1qV0NhMzE2RCt3VmVuZ3hi?=
 =?utf-8?B?cGdyMzVnZXZ6M2lmMXI2WUM5b1BIQUZNbWZJOWp6NnFDdHlRb04veGJlcUt6?=
 =?utf-8?B?UE93TFBQdGYxN3JSdGFFSU1pYXYrWHhIOFhCZDhUYTB5WE1mUCtQRjNrQmgr?=
 =?utf-8?B?UjNqTE5ob1BiUFI3T0lmQjRaNERSaXllZk0ydEVaS0lHRjlzYklNMTRTZ20x?=
 =?utf-8?B?emFTbVhOV3dDQVN4eWFjT0E3NVkyS3VKOGRpQzFOZHlWVkRQQ0ZtRTdhM1Qy?=
 =?utf-8?B?NHo5ZzlaZ1luNmpsampLWUc0VFNYS2Y0a1k1UEpUL2VORmNSOVVCTUpqanZv?=
 =?utf-8?B?UzZzbFRUWGh3RUJseEtpeVpOSGR5TFVkWGdBbmdDZTc0KzRWdnhMLy9iam9j?=
 =?utf-8?B?aURMZVk2djVsQnBPWUdxRW92YUpFNXlEZUJKZEZrc1hSc0NUckFkbEJiNUtr?=
 =?utf-8?B?TlJiUGVCTzVmNTNQUGs4VlRQV2dLVExERm1QazFYQVd0UEcvKzZQUUtoQzVh?=
 =?utf-8?B?dndpUU1EakRPbWJqSVFOb245ZlNhYW9teG5QeWRKRUtEN3FYckdHWms2WnZS?=
 =?utf-8?B?RDJLcTQxQ2MybXJaSlh0VjBZemxoMnlHL2hEM21ZWk5lQnhqTzBoNGVVQXdV?=
 =?utf-8?B?VXBIcHprWU5YV3J5aG9LbXFIK0hEcGNQWlBWaTR2eVBpU0NDQjBmZWlmalNF?=
 =?utf-8?B?R1V3cmpwTnNqcG9EQUtITHJlcEJNZTFJZmhtSDl2ejRLek14bTZ2NnR1MTJk?=
 =?utf-8?B?aXNsTi9TNHFucjIzY3RxbjdSK0VUMDlqQ2taZjNWL3NRbHRRQmZHTG8wcGRB?=
 =?utf-8?B?cmZqUmYzdWtQejdKL3UvRkRQRWxLUm10QXJuWUlMVmUvT3FRdjZScTh3dE03?=
 =?utf-8?B?NzVodUhkZ3M2cHNlR050d1lReG9RV1k2elVIL2hmN2p2ZWJKM1NaZnZQS1Vi?=
 =?utf-8?B?aFZqam9aSjRqdCtVVFNJYno5N1BJMDZFSFNyMHNJT0I4aEJlSlJRZW51TWpG?=
 =?utf-8?B?eFZIV2NFb0FUVHdaN0xvUnZ0T1Q2d1N3K3MraDlnNkRndDNxR0pQMFNTa1BJ?=
 =?utf-8?B?aDJ3bFdCTTEzMXJqWkk3WW5aaUY3VUo3Z2pnZWdYb0lyYWtJVFUva3E4Mnd1?=
 =?utf-8?B?N0ZXRnU4dFRMcnIySzhOWFl4ZXpmOENsU09GbmpLOHVoWktMSmUxcmhZUkRt?=
 =?utf-8?B?eHVSTmhhM2JBWHBDdGpraW5jRE1aZndhOGNNWDBBYmMwQ3puV3d2aEFzcldK?=
 =?utf-8?B?S3hhUzAxSjEyVWVNMG9vWnNodytqcDFFcTlnYVRwSldVUFV0MmtxZGVzd3Ni?=
 =?utf-8?B?Nnp5YytsRVREcWJDZXIyQmFBN3dTWEVORXkrdno1SWxmZC9BTTZpR0Z0K1Jz?=
 =?utf-8?B?R2dZY3VlRXdBVnpzenpvWlVVYlhWNVhpVVNSQnNreEFFUWV1TFBCWFc1bHV3?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97df617b-6ea9-4a7d-bc43-08de35dbcd41
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2025 21:58:49.2686 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Djz8CHfN6wVWLnxym20Kl53I0wIGJRAJd4ZUzqoiGdmPCci5epvGALjxSKh7z4lA7mDiO15g6J0KIhW9+1GKRMBQlPBP1vOGO18W2tJQA1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
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



On 12/7/2025 12:04 AM, Daniele Ceraolo Spurio wrote:
> Since engines in the same class can be divided across multiple groups,
> the GuC does not allow scheduler groups to be active if there are
> multi-lrc contexts. This means that:
> 
> 1) if a MLRC context is registered when we enable scheduler groups, the
>    GuC will silently ignore the configuration
> 2) if a MLRC context is registered after scheduler groups are enabled,
>    the GuC will disable the groups and generate an adverse event.
> 
> The expectation is that the admin will ensure that all apps that use
> MLRC on PF have been terminated before scheduler groups are created. A
> check on PF is added anyway to make sure we don't still have contexts
> waiting to be cleaned up laying around.
> On both PF and VF we block creation of new MLRC queues once scheduler
> groups have been enabled.
> 
> v2: move threshold handling to its own patch, move MLRC check to
>     guc_submit.c, hide SRIOV interals from exec_queue creation code,
>     better comments/docs (Michal)
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      |  7 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c         | 19 +++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c        | 17 ++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf.h        |  8 +++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c | 28 ++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c        | 60 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h        |  1 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h  |  2 +
>  drivers/gpu/drm/xe/xe_guc_klv_helpers.c    |  3 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c         | 21 ++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h         |  2 +
>  12 files changed, 169 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 45733a87183a..edb0546fb163 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -46,11 +46,18 @@
>   *      Refers to 32 bit architecture version as reported by the HW IP.
>   *      This key is supported on MTL+ platforms only.
>   *      Requires GuC ABI 1.2+.
> + *
> + * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
> + *      Tells the driver whether scheduler groups are enabled or not.
> + *      Requires GuC ABI 1.26+
>   */
>  
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY			0x3000u
>  #define GUC_KLV_GLOBAL_CFG_GMD_ID_LEN			1u
>  
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY	0x3001u
> +#define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN	1u
> +
>  /**
>   * DOC: GuC Self Config KLVs
>   *
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 226d07a3d852..df01c0664965 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -16,6 +16,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_sriov_pf.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
> @@ -718,6 +719,17 @@ static u32 calc_validate_logical_mask(struct xe_device *xe,
>  	return return_mask;
>  }
>  
> +static bool has_sched_groups(struct xe_gt *gt)
> +{
> +	if (IS_SRIOV_PF(gt_to_xe(gt)) && xe_gt_sriov_pf_sched_groups_enabled(gt))
> +		return true;
> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && xe_gt_sriov_vf_sched_groups_enabled(gt))
> +		return true;
> +
> +	return false;
> +}
> +
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file)
>  {
> @@ -810,6 +822,13 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			return -ENOENT;
>  		}
>  
> +		/* SRIOV sched groups are not compatible with multi-lrc */
> +		if (XE_IOCTL_DBG(xe, args->width > 1 && has_sched_groups(hwe->gt))) {
> +			up_read(&vm->lock);
> +			xe_vm_put(vm);
> +			return -EINVAL;
> +		}
> +
>  		q = xe_exec_queue_create(xe, vm, logical_mask,
>  					 args->width, hwe, flags,
>  					 args->extensions);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> index 0d97a823e702..fb5c9101e275 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> @@ -284,3 +284,20 @@ int xe_gt_sriov_pf_wait_ready(struct xe_gt *gt)
>  	pf_flush_restart(gt);
>  	return 0;
>  }
> +
> +/**
> + * xe_gt_sriov_pf_sched_groups_enabled - Check if multiple scheduler groups are
> + * enabled
> + * @gt: the &xe_gt
> + *
> + * This function is for PF use only.
> + *
> + * Return: true if shed groups were enabled, false otherwise.
> + */
> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> +
> +	return xe_gt_sriov_pf_policy_sched_groups_enabled(gt);
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> index e7fde3f9937a..1ccfc7137b98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_GT_SRIOV_PF_H_
>  #define _XE_GT_SRIOV_PF_H_
>  
> +#include <linux/types.h>
> +
>  struct xe_gt;
>  
>  #ifdef CONFIG_PCI_IOV
> @@ -16,6 +18,7 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt);
>  void xe_gt_sriov_pf_sanitize_hw(struct xe_gt *gt, unsigned int vfid);
>  void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt);
>  void xe_gt_sriov_pf_restart(struct xe_gt *gt);
> +bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt);
>  #else
>  static inline int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>  {
> @@ -38,6 +41,11 @@ static inline void xe_gt_sriov_pf_stop_prepare(struct xe_gt *gt)
>  static inline void xe_gt_sriov_pf_restart(struct xe_gt *gt)
>  {
>  }
> +
> +static inline bool xe_gt_sriov_pf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	return false;
> +}
>  #endif
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> index 1109fec99fc3..6a682d788b02 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c
> @@ -16,6 +16,7 @@
>  #include "xe_guc_buf.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_klv_helpers.h"
> +#include "xe_guc_submit.h"
>  #include "xe_pm.h"
>  
>  /*
> @@ -567,6 +568,19 @@ static int pf_provision_sched_groups(struct xe_gt *gt, u32 mode)
>  	if (xe_sriov_pf_num_vfs(gt_to_xe(gt)))
>  		return -EBUSY;
>  
> +	/*
> +	 * The GuC silently ignores the setting if any MLRC contexts are
> +	 * registered. We expect the admin to make sure that all apps that use
> +	 * MLRC are terminated before scheduler groups are enabled, so this
> +	 * check is just to make sure that the exec_queue destruction has been
> +	 * completed.
> +	 */
> +	if (mode != XE_SRIOV_SCHED_GROUPS_NONE &&
> +	    xe_guc_has_registered_mlrc_queues(&gt->uc.guc)) {
> +		xe_gt_sriov_notice(gt, "can't enable sched groups with active mlrc queues\n");

s/mlrc/MLRC

> +		return -EPERM;
> +	}
> +
>  	err = __pf_provision_sched_groups(gt, mode);
>  	if (err)
>  		return err;
> @@ -615,6 +629,20 @@ int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt,
>  	return pf_provision_sched_groups(gt, value);
>  }
>  
> +/**
> + * xe_gt_sriov_pf_policy_sched_groups_enabled() - check whether the GT has
> + * multiple scheduler groups enabled
> + * @gt: the &xe_gt to check
> + *
> + * This function can only be called on PF.
> + *
> + * Return: true if the GT has multiple groups enabled, false otherwise.
> + */
> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	return gt->sriov.pf.policy.guc.sched_groups.current_mode != XE_SRIOV_SCHED_GROUPS_NONE;
> +}
> +
>  static void pf_sanitize_guc_policies(struct xe_gt *gt)
>  {
>  	pf_sanitize_sched_if_idle(gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> index 6b3e294bc934..ceaf797ca21b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.h
> @@ -20,6 +20,7 @@ u32 xe_gt_sriov_pf_policy_get_sample_period(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_multi_group_modes(struct xe_gt *gt);
>  bool xe_sriov_gt_pf_policy_has_sched_group_mode(struct xe_gt *gt, u32 mode);
>  int xe_gt_sriov_pf_policy_set_sched_groups_mode(struct xe_gt *gt, u32 value);
> +bool xe_gt_sriov_pf_policy_sched_groups_enabled(struct xe_gt *gt);
>  
>  void xe_gt_sriov_pf_policy_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_policy_sanitize(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 97c29c55f885..48e11c1a2d08 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -438,6 +438,30 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt)
>  	return value;
>  }
>  
> +static int query_vf_sched_groups(struct xe_gt *gt)

s/query_vf_sched_groups/vf_query_sched_groups

and keep it closer to vf_cache_sched_groups_status

> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	u32 value = 0;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (MAKE_GUC_VER_STRUCT(gt->sriov.vf.guc_version) < MAKE_GUC_VER(1, 26, 0))
> +		return 0;

nit: maybe we can split above 'check' code from rest of 'query' code?

and as we have more and more cases where version check is needed, maybe it's also a time to add helper like:

	bool vf_runs_on_guc(gt, MAKE_GUC_VER)

> +
> +	err = guc_action_query_single_klv32(guc,
> +					    GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY,
> +					    &value);
> +	if (unlikely(err)) {
> +		xe_gt_sriov_err(gt, "Failed to obtain sched groups status (%pe)\n",
> +				ERR_PTR(err));
> +		return err;
> +	}
> +
> +	xe_gt_sriov_dbg(gt, "sched groups %s\n", str_enabled_disabled(value));
> +	return value;
> +}
> +
>  static int vf_get_ggtt_info(struct xe_gt *gt)
>  {
>  	struct xe_tile *tile = gt_to_tile(gt);
> @@ -564,6 +588,21 @@ static void vf_cache_gmdid(struct xe_gt *gt)
>  	gt->sriov.vf.runtime.gmdid = xe_gt_sriov_vf_gmdid(gt);
>  }
>  
> +static int vf_cache_sched_groups_status(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	ret = query_vf_sched_groups(gt);
> +	if (ret < 0)
> +		return ret;
> +
> +	gt->sriov.vf.runtime.uses_sched_groups = ret;
> +
> +	return 0;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_query_config - Query SR-IOV config data over MMIO.
>   * @gt: the &xe_gt
> @@ -593,12 +632,33 @@ int xe_gt_sriov_vf_query_config(struct xe_gt *gt)
>  	if (unlikely(err))
>  		return err;
>  
> +	err = vf_cache_sched_groups_status(gt);
> +	if (unlikely(err))
> +		return err;
> +
>  	if (has_gmdid(xe))
>  		vf_cache_gmdid(gt);
>  
>  	return 0;
>  }
>  
> +/**
> + * xe_gt_sriov_vf_sched_groups_enabled() - Check if PF has enabled multiple
> + * scheduler groups
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: true if shed groups were enabled, false otherwise.
> + */
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
> +
> +	return gt->sriov.vf.runtime.uses_sched_groups;
> +}
> +
>  /**
>   * xe_gt_sriov_vf_guc_ids - VF GuC context IDs configuration.
>   * @gt: the &xe_gt
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index af40276790fa..7d97189c2d3d 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -30,6 +30,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>  u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
> +bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>  void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg reg, u32 val);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..5267c097ecd0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -27,6 +27,8 @@ struct xe_gt_sriov_vf_selfconfig {
>  struct xe_gt_sriov_vf_runtime {
>  	/** @gmdid: cached value of the GDMID register. */
>  	u32 gmdid;
> +	/** @uses_sched_groups: whether PF enabled sched groups or not. */
> +	bool uses_sched_groups;
>  	/** @regs_size: size of runtime register array. */
>  	u32 regs_size;
>  	/** @num_regs: number of runtime registers in the array. */
> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> index 1b08b443606e..dd504b77cb17 100644
> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
> @@ -21,6 +21,9 @@
>  const char *xe_guc_klv_key_to_string(u16 key)
>  {
>  	switch (key) {
> +	/* GuC Global Config KLVs */
> +	case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
> +		return "group_scheduling_available";
>  	/* VGT POLICY keys */
>  	case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>  		return "sched_if_idle";
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index af43acf7baae..e8921219ac4e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2985,6 +2985,27 @@ void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p)
>  	mutex_unlock(&guc->submission_state.lock);
>  }
>  
> +/**
> + * xe_guc_has_registered_mlrc_queues - check whether there are any MLRC queues
> + * registered with the GuC
> + * @guc: GuC.
> + *
> + * Return: true if any MLRC queue is registered with the GuC, false otherwise.
> + */
> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	guard(mutex)(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		if (q->width > 1)
> +			return true;
> +
> +	return false;
> +}
> +
>  /**
>   * xe_guc_contexts_hwsp_rebase - Re-compute GGTT references within all
>   * exec queues registered to given GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 100a7891b918..49e608500a4e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -49,6 +49,8 @@ xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapsh
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
>  void xe_guc_register_vf_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
> +bool xe_guc_has_registered_mlrc_queues(struct xe_guc *guc);
> +
>  int xe_guc_contexts_hwsp_rebase(struct xe_guc *guc, void *scratch);
>  
>  #endif

