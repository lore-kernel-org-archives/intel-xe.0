Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF3E2CA0EEB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 00:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E41510E02C;
	Wed, 20 Aug 2025 00:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwQ4k3ov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F5E10E02C
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 00:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755650114; x=1787186114;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=mwyBA2BIkR17/FLIb2IrXBSHYG3AnYb7r2X/b5Adm0Q=;
 b=VwQ4k3ovwxq40A0yaeBWGkD81A917NoIBhwrv49PdR2ws10ZiDCaZDBx
 SsShFik8GOfoehRnWqGFUVLIhf6WGWWjz1+eI9VieBt+j+M0y3JN/IRQd
 4hIbt6kzoWQ1frfz/4r/mAkmEe/WVdlb+GxCBXxBiSboYlUqJaTqZIzpH
 gSwyE+oQHHq2Yk7uhS+so0tc6+Jm95nO+mkSpZ1KToOL88H3pbffe4oC3
 fVGgW0KPeyGUiSY3ZD6SO43I+MpFYtV6j6//Nyddxt03bZ9dqG6xbC9yI
 1nEgOTCagV1WVFNS+OqPKUxkqK02vfe7rF22jZMeKVNbrSpSNZahnJKtM Q==;
X-CSE-ConnectionGUID: EEyLdzLiREuNe7dwsKwynA==
X-CSE-MsgGUID: Y3E9jKTGTbuNIrtuoKs7ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69289257"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="69289257"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:35:13 -0700
X-CSE-ConnectionGUID: 4qYrn4tyQPWUFaL1at7krg==
X-CSE-MsgGUID: dZX73lZMSmm0ZZekllnx1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="168331919"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 17:35:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:35:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 17:35:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 17:35:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yr4wWnpNIYsiE/rTnEL6JOMZR8Z/puHxmqMk0kCw++xkmioXVpgt2gFFTgQfbNg9quQg4HYwtmLzn75pgKLLOFlAFTBXyCI8mHYd3uazHI/U1MpwUQV8SKlxOQw8JBrpEd07H2sAK69otOSXDqhzZD/fp3DCM5lQieqqmSAzk6cZeRREC0iCD176E7AW74avifztD1CkvPyhqhHnD99P4L6lIhcYNg9SJl6FEEIT4ZBKDR/XOV+9Zggg5vav5/GL2DNiYl+2LYJVf6VR/JbC0YTx3GOnMMl75wA2tuPjyo66Z26KyLPlL3jgZe+tMmZzyYwcrkVtx73dRiF7WtXUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCK/kM9mbKVr3UZpeJ7/R1grp9gfscmcR24OWMaaF84=;
 b=KO1PTFV4qNJz3HxlA/IezlJvObmVIAoe0MWF8TWZOgvZAwxUmrzOkFFjBX6Q4nnGGMCtn+5JG0QeLTb/FTtdJ/+zEZQ0pLYXxM6HxcmNVW5YS8S6SkdLovwOzaiwMJhq3Tp0qFnUNCPCXs1GQptBv2/eZLch6nqpG2o0XIpjrbvt7g3F/e1KKtSD88j99xkT1fZFuNghUim+9lNL4gro9C1wLbiStt0Jq42pl2zG7Lx64LwFkpyfnFBiGySQTZTBVrnyaI6mDTzSIGlJii3CwbpCSHx5ybCGxpGQa/g3prQGklTgKjPpOfcYCUIGLPo7LHhni9+J3pS8xCy00fsWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 00:35:10 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 00:35:10 +0000
Date: Tue, 19 Aug 2025 17:35:07 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/xe_sync: avoid race during ufence signaling
Message-ID: <aKUYOzi09QwH/bgt@lstrano-desk.jf.intel.com>
References: <20250819184402.1761459-3-zbigniew.kempczynski@intel.com>
 <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250819184402.1761459-4-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: MW4PR04CA0038.namprd04.prod.outlook.com
 (2603:10b6:303:6a::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b83365-49d9-4aea-6355-08dddf816b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlVpSEtlbW90V1VpSmE5ZEt3Y2dOVzYyRXBZOERyS3ZCckhmcXQ4dTFpbjV6?=
 =?utf-8?B?Mk80Z1ZnVURQbkFuZThRbFlkT3gzVnhlQmlxTjJXMS95TmMyemNZVTliVFBk?=
 =?utf-8?B?ZTVha1A3MWYwMHBrZ0ZYdy84QjdVa2hKUnQ2RVNHTk9xdCtHeW5JeVNEc0dK?=
 =?utf-8?B?MG1wOC92NlkxMHpaODJGV21EazVjb1l0bTBoWG1ZUS9pZG1maVlQUnA0Nm1X?=
 =?utf-8?B?Y2RkRnVwV2lpdzgzaHQyNkRrdDF2S3E0ZTRxODFjRi9CbWV0TjF6UHBuWTVZ?=
 =?utf-8?B?YW9kVjVscW4rb1VsdzJBYkhlUzF0aFpDRjFJdVVJbGp5T3JGMktlN0xhOHJp?=
 =?utf-8?B?ZmtGcFpMc1hXRHlFZUU2SzZhREkyajllMEgvVzN6Qi9xOENlU2F0TEQyclRJ?=
 =?utf-8?B?d1NSalRrZnE1bHlZMks2ZUFQeC9XQWVsbXV5Mmg1aHdLYzI0eWxtdno2NVE0?=
 =?utf-8?B?eCtwYzB0ODM1cEZJU1c0djJQSklnalJDaGpnYlpNSnhlTEZmZjgzVStmK2ZW?=
 =?utf-8?B?TnI0VVhHZlhIbEgyWlY2bW40ZGhDdmtmQmJkazlCblh0TldXRkRDZVNwSXlj?=
 =?utf-8?B?alJibFY5dUI2L0NLVUcvWXh4cHJkZDRSVExyM3lraUwyNTIzK1R2THFheE9v?=
 =?utf-8?B?K0l6bzFCa25weTdwVlM4TkpmR3E0RGpOTStRd2dtd3dLV3d6Z3VEZmtEeGEx?=
 =?utf-8?B?V0QrZzBDUE05WitKaTRCdjZxMitFa2wrSXVsUVh2L29KUjV1bncrd1RDVUxW?=
 =?utf-8?B?cUh1cmhmK0FtQmxXU3ZyM1E5bmVNZk1iZVhFNWc0bVhFeUx3ZU1CV1ZtOURo?=
 =?utf-8?B?UkJPNlQwMXNCbm5qWVZZaXNSMGNHa0RIWFAyZXQ1WFQrVldGWmpmV2s5VVZr?=
 =?utf-8?B?bnU1RzlKcXVtV0pEN1BnRWlSbW50bk9QRGRBYmxObEpZUUNXTWljaEFPcnZ5?=
 =?utf-8?B?VGJXZGFrbC9iTjN4b0hNOTFTU1VKQ1ozWlNYL1JJbi9mS1FHejd6WHNGUFl6?=
 =?utf-8?B?KzIxK3dxUWxQaFVaK0lMK2RYMXJJbkNZQ2FWY3RIZnpmcy9yVnVYNkxMSmFK?=
 =?utf-8?B?cktKZEFLaUVJNGNiRFJKdy82WFJOZWdoUkFlNGdrY21UbVZNZVdZdGZpYjhr?=
 =?utf-8?B?RVZIQUhqQStDTmJaZ2V6eWR1NkVpVTk2OGMra29HVHIxVFJybncrdURLdDNC?=
 =?utf-8?B?MUlJS1BNbVRPNG5rQ1RPMHlidGhMckRMb21SSGlvc1BHZWdSNXRlOHpSR2lt?=
 =?utf-8?B?QmFDenpUV2MyVU5WMndXT1l1TXJJVkJpT00zTmZNc0llNmNhUTJCRjJQU2dV?=
 =?utf-8?B?V3JiMENNT2RCTXN1eHYwTFRXY0YzempTdnBISTR1Ny9UTHg2WFM3USs1cHZu?=
 =?utf-8?B?TTV6SzJOcUZGMGlvaVhNUGRWM2tDelFyVlFjMmRUYmNmbDdhWithTTd5VGp3?=
 =?utf-8?B?SDZwK3RqK0hlV2dVMys1WWN1Sk5PRlM0OGVFZnovM3VHd01QSnM4WS9hQ2ZT?=
 =?utf-8?B?L2VEM0xzMWRobGQ2M1BYRXBNc2JNT2ZrR0hwVVRxV2VtS3luNHIvK2JzbnFP?=
 =?utf-8?B?RDVKTkNsaS92RVFWSllHbldsdUN4d3YzWE1OK2RkaGQxMDNhQ3lvUW11Z2w4?=
 =?utf-8?B?VEdXYUd2L292Y3NWckJ0NXdSSVg1Mm43MHpST1ZwMEp1aUc3Z2Y2NkN4ZHlZ?=
 =?utf-8?B?VnNvcEo1SW5rZk9xYjBGSHhhTHUwMDVFMUtrVTZaY2MrZjRPa2lhY2FoNnlu?=
 =?utf-8?B?eW1zdlh5VGh2RW5QbUE0YXZYYWp6cDFvRnhSRFRlWDNyQVhMOGF5d3Jscjlq?=
 =?utf-8?Q?nJmd/miuZPQ/JRXwrxBPq6izqiD5sghkDuUTY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3BTVU9oQlFFYXYzR2JMc21GOEhJQWZLSDE1UHZJQ3B5SjhkR1hUMmZyRmU4?=
 =?utf-8?B?WjR4UkFEcXIzVXZSQ05jSnVHL1RUc1AvMUd5VFFKMlA0Tlk4M0U5NE51N1lJ?=
 =?utf-8?B?VWtDcXVXdW5EaDhScEhnREt5ekdZdWZ5ellDK01ZeHo2NzRkNlNhRHh0VTll?=
 =?utf-8?B?SnIwRWJMUlFaU0UwMzMxbW5oOENzQjhkT1p1cHJoOEhmWnVuK2dXamhyWWZ2?=
 =?utf-8?B?R2o0eDZWK2NzNlAyZWx0MzlWblZZNGtKMzlmWlNvZm43Q0tpK2FNbE90YkR6?=
 =?utf-8?B?WHoyZzZGZldtYWNxcnhBdzdtZkl0RXF4TGF4bjFMUEhRNVdmMHlJWGpBaTUr?=
 =?utf-8?B?SXpJd3VsRWdLRnRCcklFcXd5U1ZPRlNLRlE3WFBYalp4VzZQQUlTNUR6TExh?=
 =?utf-8?B?NlFPVVIrYlZsMFI2UWROSlJPODNiakRMNFJ5N1ZhVjFpNVVoa1U1QTh6TXdF?=
 =?utf-8?B?NG0zZENCQytEekIvNFlnTWJTeExhUGxHWnVpT1JDS1ByaTlYT1F6bTJ3clZ6?=
 =?utf-8?B?WHNJMTBta0JvVmFsTzlaMklDSllQaDFzTUhkOXhTUWs2SDFKTkExU0RBQXFR?=
 =?utf-8?B?Znp2TVVwYTEyVm9KS0R1akN2OUsxTnQzQlZXdk9NLzB5cGRuQWFZdDZ1SDBa?=
 =?utf-8?B?N1M4TjFoZnlxWUVrc0hjd0lhdENqcUtmSmV5WGFvUTBKNFhIM2Nwbm1POTkv?=
 =?utf-8?B?bmhuOVVqclBESytPOG9YczhWejl1OGtzaWc2S0RWZGhZaHdZVDVuN1FqQU9R?=
 =?utf-8?B?RitiNU5mdXJ2NE5qaEJLc2x3TVVuSklhZ3dBUnZVa21DTzhRWUJRNnJJZXha?=
 =?utf-8?B?NGVSei9lMzJMU3BseFRkREd2ZjFyVTJTWFd3U21ZMHVrMjhkZ2g4L2dqREhO?=
 =?utf-8?B?OU16NVhVNHo1R3Bhd1J4WU82OFIzc3ZJVktXWWxNOVB1Nk1nQnhzbm93bG1r?=
 =?utf-8?B?eG1ZdVJZZWVXdjVoM1F2b1NTYlVxNGNkVjZaRCttS0hVYmdnaEcwRXFYVkRn?=
 =?utf-8?B?VVE3UXdKbEVRRzBxd1dyOWtBSHh3U1BYN09keU81M2hNcTgzQTIwZDRmTXRL?=
 =?utf-8?B?T005dFYrNjNYWkUvN2pUTFJvZG9nQnRYR3JlY3RTSE9raGROYk84QzFVWDdr?=
 =?utf-8?B?a3h1bE5DVmtWUzRFYTJ0a3VpZ3llandxZEpJZ0NGQkFhNk02TDZQTksxVy9B?=
 =?utf-8?B?WGpTa1JxNTh0T0lmcG9iaXlzNnlvZytudDZXMng3NDBKcXhadkY3QThyOGVN?=
 =?utf-8?B?VlBLbzVoRjJtUkpWampjNFgyZnN2RnUxcWlPZ1dKTWZOVEVQUm1NTWNDcEJ3?=
 =?utf-8?B?bngxaFNoN1Y0TUowVSt2ZWFNZHlVclpLSUxxb28zaW9pbmJneWt5Q0d2T2dC?=
 =?utf-8?B?b1lQandwOE9JWFlKOGZNdFJMV2xiRW5qNitBMlR2eVNXcEJQek9Mb2Z0UURH?=
 =?utf-8?B?Y1VkUEdtT1Y3d25QNkJFUzdxanJtNG9VeEVUbUNsWkRCSlp1a3ArYXQxa3ph?=
 =?utf-8?B?VVJTSnpTR0JLdUNPOUhlUjBiWWUxT28yYW1JZk5XUnRqNDI1MkUvclpDMXI1?=
 =?utf-8?B?MWVoTFpXUVFPQy9GbEtBelhkVVUxR1EyZWV2ZkZmMmYrSWtNckYxMlR5TytV?=
 =?utf-8?B?RXNodWw3eWN3dGc1WGRBK3o4WWZsZ3ZBS3RZZHNRd3pBZkhtS3gyWUNhZnhB?=
 =?utf-8?B?Y05TdHFhVktMWFhJK3JmOXJ2M3k1OUdYWC9IR0pqQVpQZWR5R0dlSHo0YW44?=
 =?utf-8?B?b0pMQ3pCR0NsWTBYZlE2ajJBMVBtWTArNC9SNldUeHZRNUVjaEo2U20vTnVR?=
 =?utf-8?B?enFuSHVSSzNNMWlSMVM0b0VpNlVnTUIzRTNtK1BETDZKVlh3Vk9jSXBtN1hZ?=
 =?utf-8?B?U2FWVzYzSFpYaVYrYjU2VElXZmVPNmRSSitVbHNJZmliWGs0WUJXYmVCODUz?=
 =?utf-8?B?cnAwbmd6YnRBeGtGcE5QbTBsR1lRc3VDQVJoeUwyRDNLNUdLWE9ESEtwbUox?=
 =?utf-8?B?TlBLb2dCc3ZPUURJRUNtbG1XUUV0SWltVkhKMVNaZFAvTm9GcGZLY2RTalpX?=
 =?utf-8?B?dytqb2tuRW9tMGYzT2lPMmhsMGhrVlFmMHN4T2tIQzZyT3l3cVA2dW1EMjdE?=
 =?utf-8?B?cGdpVGdhOENiSDFuTG9ubEp5SlhUK0diQzJIYmMwNENUM3R0akpCajVWeVJs?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b83365-49d9-4aea-6355-08dddf816b7a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 00:35:10.5119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Jmxpjj9fwIAyTbVZ6658gZq0bbJRjGqvKFwviEmWoEqUtRn+Ms6AKtrM8tOIDCvx1tgWrG0t+JbPB1afp7iJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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

On Tue, Aug 19, 2025 at 08:44:04PM +0200, Zbigniew Kempczyński wrote:
> During vm-bind ioctl ops execute fence may be signaled during the call.
> If vm-bind syncs to user-fence it creates a race because signaling
> happens in the worker. This means control may return from vm-bind
> ioctl and consecutive vm-bind operation to same vma (unmap) may happen
> on still not signaled user-fence. This finally ends with -EBUSY error
> because even if vma operations completed fence still exists but
> userspace was unblocked with copy_to_user() call.
> 
> Instead of releasing user-fences in workqueue for already signaled
> ops put them synchronously in the same vm-bind ioctl call.
> 

I'm not really following this explaination. I think the actual problem
is in user_fence_worker() the copy to user to done before
WRITE_ONCE(ufence->signalled, 1). If there were re-ordered, I think
that would fix this problem.

Matt

> Fixes: 977e5b82e090 ("drm/xe: Expose user fence from xe_sync_entry")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5536
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sync.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
> index f87276df18f2..8becc3755649 100644
> --- a/drivers/gpu/drm/xe/xe_sync.c
> +++ b/drivers/gpu/drm/xe/xe_sync.c
> @@ -103,6 +103,15 @@ static void kick_ufence(struct xe_user_fence *ufence, struct dma_fence *fence)
>  	dma_fence_put(fence);
>  }
>  
> +static void kick_ufence_sync(struct xe_user_fence *ufence, struct dma_fence *fence)
> +{
> +	if (copy_to_user(ufence->addr, &ufence->value, sizeof(ufence->value)))
> +		XE_WARN_ON("Copy to user failed");
> +	WRITE_ONCE(ufence->signalled, 1);
> +	user_fence_put(ufence);
> +	dma_fence_put(fence);
> +}
> +
>  static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  {
>  	struct xe_user_fence *ufence = container_of(cb, struct xe_user_fence, cb);
> @@ -244,7 +253,7 @@ void xe_sync_entry_signal(struct xe_sync_entry *sync, struct dma_fence *fence)
>  		err = dma_fence_add_callback(fence, &sync->ufence->cb,
>  					     user_fence_cb);
>  		if (err == -ENOENT) {
> -			kick_ufence(sync->ufence, fence);
> +			kick_ufence_sync(sync->ufence, fence);
>  		} else if (err) {
>  			XE_WARN_ON("failed to add user fence");
>  			user_fence_put(sync->ufence);
> -- 
> 2.43.0
> 
