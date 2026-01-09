Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6374FD26D71
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 17:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF210E78E;
	Fri,  9 Jan 2026 17:07:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaX0R2X8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCF610E78E
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 17:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767978463; x=1799514463;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PXEoKoXzGE9URBcKdkC2Ydzo2TZWmvKkpss8CNhbCd4=;
 b=TaX0R2X8IYPNCV6C/SAY5k3bO/ORsrTFlv9ARGE6gB2M1coiFU+5alXH
 BLyyy1R/iCx4d6weeiSP+hZjh4G6l8JRJ0Snc7U9StrVCjkl4rvfBD5RQ
 giM7t/sRaG1KZk1ub1BAhqL5+arNyDxan2ZHWvvwhVwixZtAI7OlMfuui
 F+a1dyTm6eRwjdl/Lj/wizZakDspPOFcmFtXQuMqfZKC7EU0fBGHKL1pf
 VlJyryWNyA8yc9u41KZCKFbq4023h9juD5IZ1YOoRmZxG5j1ZszThBm74
 BoBMZ5ijD4NklnRo8aEGSehL2M6sLWX07f+J23nIxZgZZStMccPVufmEY A==;
X-CSE-ConnectionGUID: MGnEU5ncQ22Eg7PbpQCdTA==
X-CSE-MsgGUID: igqHu4RnTAGlGmtO0/ZtrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="68366402"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="68366402"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:07:42 -0800
X-CSE-ConnectionGUID: 9vXxJPJfRiStGmCyBme0wA==
X-CSE-MsgGUID: hnFVHhwJQXCB+QEOMX7l2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; d="scan'208";a="226881210"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 09:07:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:07:42 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 09:07:42 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 09:07:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtEz/ddTKElWUjohopq2RZ12iSXlpWCT/MzH0FWhRTkTf5N2mHL8+vLqIprDOZLiJ/SU5aNOBKWn2mLbrPey2gwzjNmCDcCHFCfhIVRn63nXNAtGPVAn+KiPtOdZ4hwLWOnOcpH882dR4F5vUYpQCehoouaC9cOuXW1tNJrugomcqhSVqqqw+aI7vJW/rqVc3KF5rDFvggNsAe2D7LR6pNYZdO45lCOnWeKoEhkehWAtXTWTVvVvcoX9zo2FJgP/GQqFmBGLPPzBNQ6A5byZ1flaOClHvmuzfMfDkW8JGg122p15TM5g4XOOIlsDokwHXymhqQ14xPuXnIIV/Cc9KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeCeswPEJ3+UhhzYBl+iVe27Hk0DzudUsxjGwLEYKU0=;
 b=AnuXPnXvaK4dQa54b49VbW43Q7kfMmkr4AIF1VYMofBTUI0QsyEIHZzCq4bMkH/smONqlXoIPxDXZ/Ue6i5sMPx+q6O0y8FUZuGz342Cj5oj6hkO8ZSyip1z7kmU3gBMSs/3tBxk1uOAEaNEpeP/Yjq+kSCAGAOoOO+k9kLwn6m11ODcmg9f/lbTDtUj80mf9ykKE9ubtQqTQ7RcZeXfvvq/HcVddqNGUXw3woNYQCL7HkaeuvOfEJo4U/LcK59M++WP3PGwsLPwwG2rvcZ9l3WDyYvrSUHFsxgf970hWVTWpMfQ1k42Lqeurgve0nn6oylIClEU5MoNwNH5hZ/e9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB8545.namprd11.prod.outlook.com (2603:10b6:610:1bc::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 17:07:40 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::d269:c67e:1cc2:d1ca%6]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 17:07:38 +0000
Message-ID: <41e687d8-5d0c-4c4a-8986-8e297fc3e0f9@intel.com>
Date: Fri, 9 Jan 2026 18:07:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/xe/mert: Move MERT initialization to xe_mert.c
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260109151219.26206-1-michal.wajdeczko@intel.com>
 <20260109151219.26206-6-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260109151219.26206-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VE1PR08CA0001.eurprd08.prod.outlook.com
 (2603:10a6:803:104::14) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4fbd6d-c759-44b0-b1de-08de4fa197c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXloRFc0SE1HSVF1ZndqSXZJcG14ZmdzMzd6enVBaHhlYWN6ZEVHeFJxemtL?=
 =?utf-8?B?ZVRLSzE4V2kxbEtmKytidXJOcDdyT3IvUXZEcFVUWmNkQ2V0K0oyQVJrU2xQ?=
 =?utf-8?B?ekxNUVRXakhYUXNIVVoyWjliRk5zYzRmMlZRQTZKZ1ZuZS9kQmkyK1FZYS8w?=
 =?utf-8?B?NVRadEV1UmpjdjlCUU1VREszK3JSdWxtdVBrRzlpb3FqOWQzdjRYWXRUR2da?=
 =?utf-8?B?Q0k2OTBTRXJPd3h6M0lFVUhQUEV6cW50K2diQWMrSWNFRWRBWEJOY1JtWlZD?=
 =?utf-8?B?SlcvUDhVUDNHZGQwQWRVWnRrZmVUak9KenIyd1pFVEtuSHFsNTFOaEFkbEFS?=
 =?utf-8?B?S2YraWQyUU01aVhpOHh4RUE3bHRxTVpXY0VuSUpqalFBMUJIS2ZPOWRmK0wr?=
 =?utf-8?B?ZEtlbmRmcUFiWGhnQ1BkNkhoS3FoWU5ObmFHVGlpWkVwQnE4THFNRS82T0ZT?=
 =?utf-8?B?MXZ1Y29hTjJQZm1ZTi8xQ1N1dGhYM2h2V3VMb1ZOdVNoUVc1ekd2QStwYXBC?=
 =?utf-8?B?NEZDSVUxeXJxK1B4ZHlTNUJPRGNwNmhRTFFTZWhuUC9RN0prdld6QUZ4NUJw?=
 =?utf-8?B?eFlSNkNuVFVKeU5RNU9PbXN2OUhWdHp6SHhuRHJ0NnZFaHZ3UHpnMWl4M2lV?=
 =?utf-8?B?K1dQbjl6UE4yZUdJRFFPODFLd1l4RkcrMGI2SXZ4MEZJWHVDNDJHaUFCbFFR?=
 =?utf-8?B?TmtsbEY5anVISG5BeGZBWDVLZWVwQkhyVi9jQjhiYWZQZ2ZobG9GcnE1MU5q?=
 =?utf-8?B?ZVg5cGFQY2ZlZ2R2NFByY0ZRN0szdU1wQitXMHNVSVBjNkJqV2l0Q0M2Z2Nm?=
 =?utf-8?B?YVlTYyttVUNJV1YzMFhBQVJPamxDOC9QUDA5Q2V6akhsamdUbWlkSUZvT2Zr?=
 =?utf-8?B?d3hqRjFGRk1sZDVHQk9BSkpvcHdHV29rYVlZUW5Dd3AyNUlLc3Y2MVF2czQz?=
 =?utf-8?B?NjFzeVRjNEh4T2pDUHR3MjVIVjVOZzZXNi9GN1dLY0NUYUNjczAyazJmMWMv?=
 =?utf-8?B?WXREMDZwM0xZNlNTKytNU01oTGFBbkZmN3p1ZWFkeEN5VmM4azgyVmdoNFZN?=
 =?utf-8?B?TDRiV3FwQnBIZm5kaXR5WUtMR2hWa21KNDgreEpRSXJvOWtQekdYN0k2dlNP?=
 =?utf-8?B?SkhSTmdRRzRZM1IvVGhmcjFaN0dOeDBCME02RjJXK1RIaVIwQnJPdGx6bmUz?=
 =?utf-8?B?WlJiYTBiZHIyaThnRDRud2Iyd1pQbE1KYlhNSU1DUkh4cHZnZ25pNExLZWJR?=
 =?utf-8?B?eFZNSDVFNktqYmlJanV6L0cyalR6c0FIYlpDWUR1KzVyU3FnTTNEWW5CeStO?=
 =?utf-8?B?ZHlFVjhxMUdoRVJNUDBGNDVGOHJBbXBuY1M2aDJJK05JZG1wbTRkMDBMc3Nx?=
 =?utf-8?B?UlZmYldGb2RHNTlxTmtEakNQZWZaakI0SUJzOEhlL3lzU09udkJrbytLZnZL?=
 =?utf-8?B?elZGVXMwa3dabU5DTWJRL0NaWUFhL3FwR0JCSmdXNXFSU1VHN01iT1NtdjhN?=
 =?utf-8?B?Mmw4Q0I5S0NzdEtSNjFkVkg1QnVlTFVKaFIvSHpuejIvNTQ3Mnc2QUpWQ2Vt?=
 =?utf-8?B?NFUwVlhRNXNaNmxraXlEZ2g5blR5ZllXNElWN1BMZnJsd2NUNlg4MXhLSlJt?=
 =?utf-8?B?cWNVd1Q2eElNenJqZWp5bmduVGpzaE51S1FVR3Z1WTF5cS9tUU5CemtlVGky?=
 =?utf-8?B?dmhnM2lrMDhvY2t6WnNjSzJjWUtCcmp5QTU4MS9Iam5iWURZZWxYQW5WZTRl?=
 =?utf-8?B?VGRzLzN2N2g0eFY1SHNqVDJRZjdkYUdiYnBsUGtkb2luLzUzSko4N3F6emll?=
 =?utf-8?B?OTQ0bEVNYk84dEx4dUNFZm5NUW9ZaHFRZTRad283Q1BONm14d05EQmNsV3Mz?=
 =?utf-8?B?cVJpcGRHRG1TamJibmdSbktzUSs1K05Dc1l0RkI5TXpXNFZsYVNaOVJEc29E?=
 =?utf-8?Q?mCSjR82R3asni5600VPVm7kAd9RZycKT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTdzV1M1MVZ6TnhOMkhkZWNvRUY2bEN2cE9aZlFGMm9rcWdnQnFubmlna0d5?=
 =?utf-8?B?VXM5azdOQWtMenpjL3ZXUHd6cjl2cDV1bUk3dlRFSTRvSitSTkptTnVvSXIw?=
 =?utf-8?B?bmNKaWNXZFlLOUUxWGVyK05WRUttd2psZHJTMlRibVJJUUlsRW0rS215UlNa?=
 =?utf-8?B?NTNCeWt2djQ4ci9DeFpybmpQaTdsOTI2RkM5WWlZa25QaGZJU3ZUZlJsN3Vl?=
 =?utf-8?B?M3p6SnQ2cjB0QjZydDRxT0N3UnY4c0NFTGJzNUVQWlc3SXFOSmd3NlJKazRl?=
 =?utf-8?B?cEo1ZmM0bHR0b0EwcXYyUzZ5RUZLT3dpRk4vWDlYSjIzbHYrWlhZZ3FXSFhr?=
 =?utf-8?B?WTJxNUgxR2w1bDBHTW1GWlZZS0NLVldJYnhkMWNuVWV4TkxJQUV0Ymo5VEZv?=
 =?utf-8?B?bGF5WkluZm1saWJrdGRWbTFVM2UrTHcyWTBDQ3d4bkFlNStaWFMxdkltRzRK?=
 =?utf-8?B?U1N0a2w0WEcxL0NWR29rUFJTTVZrUno4MWNFNnhEWTBiVS9YUXpMRnRQWWV3?=
 =?utf-8?B?WnNya2laRU1LeCtraXN0RW1DenYrOGFsQ2ZDN3VoTDRhaTVoSSswZ25OL3dn?=
 =?utf-8?B?TVY1ejBIUHkya1dSYldCTE5YUlZ6bHFvZHNHMDJjQXFtbkhBMzBaT3lMSWlw?=
 =?utf-8?B?ZElIOVBjeG81aEVueDUwakd2S3hPanJoZ2FQVmNKdkx4QitOL2ZFb3ZOUGZz?=
 =?utf-8?B?WGYwdVNlSUp4Q0FVWEhiTis1UDNWdG5PT0oxalhRUHlMdjJLVDFKR3RoNWtO?=
 =?utf-8?B?VHE2WW1LbFhQemEzZ3dKOEZzS29IL2hBRkx4Z2FLWWVCVW5OZjhqRG8rVEdI?=
 =?utf-8?B?OG05RzMwTWNycW5aKzVWZjZiV0hHVHpFUWgramk2SSsvU2FIbzhOd3Y0UzA4?=
 =?utf-8?B?Vmp6cDNxRkRlQmVrR2xRM1FyTmZxdkhvZ2xXc0VyZHBqcCsyMUF0b1NRMjNM?=
 =?utf-8?B?cjJLZjRaOU4zK1RHOW9WN2x0b04zQkZKZ1ZTbzB2Z3ZhWVFkL0FrNkJhT3BV?=
 =?utf-8?B?NzRRNWVXbWlSa25aWmRnWUhFQjQxMUlwYXduWFRsQU9xdHpXczZvVk5CVVJa?=
 =?utf-8?B?MU1Ld1d3UGNKMFdLZk9jQ0srWHNSbVloUFlqSklMSXFjcHhSSXpIeG10MmVm?=
 =?utf-8?B?aTVTYm1qbmxiSDd0ZHg1aGVZT2ZpeUo2dTJWMkxXZVY5RlVnbnI4dDlBN1lr?=
 =?utf-8?B?MFFNQnZDMmc5VmlRRkk4bTdvcEFKWGl6QldnM3VPN0hYL3RIbmRWU204VG1R?=
 =?utf-8?B?WXNKdHJRTFRKUkgvMXpHbThYNERGcVNpdGo0MW04N3NMQzNqREFWQXYrVmVk?=
 =?utf-8?B?Z2JTVHNaSUJaRVk4MDBjYXVCdTNXSm1RVVA2d0ZnMDN3ZlZwdjFkc01rekk0?=
 =?utf-8?B?OVFuUDlhZVM3RmYrekpKOXFuQzYwOVI0ekdjdDRxUzJkVFFRNlhjbDlFdjEw?=
 =?utf-8?B?Vzl2dWdSTm1qYVliWlpYREFmZDJrcnVyRGF2bnRxWkEranJTNkk5MCtnaXJo?=
 =?utf-8?B?akZJY01qeXZTMmxVRmdUdzlsNWtLZElxemRscFJFb0tmSVRrbGVtV2k5Ri9B?=
 =?utf-8?B?WGorRG5MVzlHOVZYZ0VXTG14VjRDSmRkU2cxckFmOVdFZ2FWd3dUWVIwbzMz?=
 =?utf-8?B?OHh4SWwrcGFYV0lwS3FNRVF0dnhTTjdCOVlzdVRCUUlIRnM3MHZGQVNuSm9D?=
 =?utf-8?B?OVk3QWx5Q0RTd1RpYlhPZXoraDVTNXAyQnhBSE5rNXllcDVCd0p2YSs4WHdH?=
 =?utf-8?B?Rzh4c3BtTkxFeVBodEhrUnJzUG9QQUdqRUhlTmFHRGJIR1l3QktOT0ZNNGR1?=
 =?utf-8?B?Tm9qaHFCL2ROZ3FXUUFBMWZ4Q1NVTTNyd2FBZWVlajV4bzEyUzY2ZkxOaXRo?=
 =?utf-8?B?bjBnQVExWFdleDJpSEc2RDZNdUZ0OGZCRkxqbVVuUlNodUxsNGpkUTg0bkFs?=
 =?utf-8?B?Kzl6czZ0SWtKeWh0dkhLajVrUGxuOXdNeHROQ1Uybm14a2FXcUdtYjBwaDRo?=
 =?utf-8?B?UERlcllPSkRwSEtwbFc2L082ZmxDR0E2SmF1Ri81UU5BeE1XMm5JUDB5eXlQ?=
 =?utf-8?B?YUFXSURjcWVCVWVkQnRaQXBWZ3hDeEJaZmNNeGNiSnErVzNUU1FtOGdwZy9a?=
 =?utf-8?B?emhCTGg1Sm8xaVUwSW1lM1hDVmFkcTJaRklqOHVZMkYxNU9VMitrTWt6ck9z?=
 =?utf-8?B?NkVyV01lMmNkSUlGL3d5cktsbnRtanRraFdQLy9kUTB6VFZRZ1owNko1TWNY?=
 =?utf-8?B?ZnRWVFd0RHNCY001TGM2Q0dCTTJXRGJmNVhNL1BNdU1GbndGZUlOVk1idEh0?=
 =?utf-8?B?ODBtY3BDNlhJVThINmN4ZTN2Q3g3aW9rZEdzdG5xRkR3dlBBWk5vQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4fbd6d-c759-44b0-b1de-08de4fa197c4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:07:38.8961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGQl4ZIQPVowLdhMiDqpZ75Z+rxXrmpaP0HpQ+JgEIq0q5aEJpjiRZ61WnIkUZo5BezRfHtfRt3fgqxapKa8yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8545
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


On 1/9/2026 16:12, Michal Wajdeczko wrote:
> Most of the MERT code is already in dedicated file, no reason to
> keep internal MERT data structure initialization elsewhere.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_mert.c     | 13 +++++++++++++
>   drivers/gpu/drm/xe/xe_mert.h     |  1 +
>   drivers/gpu/drm/xe/xe_sriov_pf.c |  4 +---
>   3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_mert.c b/drivers/gpu/drm/xe/xe_mert.c
> index d139663c45ce..8ad6aa7f4e24 100644
> --- a/drivers/gpu/drm/xe/xe_mert.c
> +++ b/drivers/gpu/drm/xe/xe_mert.c
> @@ -11,6 +11,19 @@
>   #include "xe_mmio.h"
>   #include "xe_tile.h"
>   
> +/**
> + * xe_mert_init_early() - Initialize MERT data
> + * @xe: the &xe_device with MERT to init
> + */
> +void xe_mert_init_early(struct xe_device *xe)
> +{
> +	struct xe_tile *tile = xe_device_get_root_tile(xe);
> +	struct xe_mert *mert = &tile->mert;
> +
> +	spin_lock_init(&mert->lock);
> +	init_completion(&mert->tlb_inv_done);
> +}
> +
>   /**
>    * xe_mert_invalidate_lmtt() - Invalidate MERT LMTT
>    * @xe: the &xe_device with MERT
> diff --git a/drivers/gpu/drm/xe/xe_mert.h b/drivers/gpu/drm/xe/xe_mert.h
> index 44daeca094bd..fc977203692d 100644
> --- a/drivers/gpu/drm/xe/xe_mert.h
> +++ b/drivers/gpu/drm/xe/xe_mert.h
> @@ -25,6 +25,7 @@ struct xe_mert {
>   };
>   
>   #ifdef CONFIG_PCI_IOV
> +void xe_mert_init_early(struct xe_device *xe);
>   int xe_mert_invalidate_lmtt(struct xe_device *xe);
>   void xe_mert_irq_handler(struct xe_device *xe, u32 master_ctl);
>   #else
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 72423bb17e6f..6ce3c58e003c 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -90,7 +90,6 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>    */
>   int xe_sriov_pf_init_early(struct xe_device *xe)
>   {
> -	struct xe_mert *mert = &xe_device_get_root_tile(xe)->mert;
>   	int err;
>   
>   	xe_assert(xe, IS_SRIOV_PF(xe));
> @@ -112,8 +111,7 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
>   
>   	xe_sriov_pf_service_init(xe);
>   
> -	spin_lock_init(&mert->lock);
> -	init_completion(&mert->tlb_inv_done);
> +	xe_mert_init_early(xe);
>   
>   	return 0;
>   }
