Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E918C5AE59
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 03:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7B10E576;
	Wed, 28 May 2025 03:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBx3JmUh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFBA10E574
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 03:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748404779; x=1779940779;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Go3jy6Vg1Qd3lq3JR4NvETBDLbnZzJoXiym0DAGxUi0=;
 b=QBx3JmUh1GhycBiJZ7fv4yhCK36Cv1rJ+JXZwEKLPCyGhGrkNZFwdYiM
 8YOB3JWDhh2AIVWb8ffrhhpL2OorbQ4d/J5uKZt+R3MoH8kLncBnGl8hJ
 gwf+1c8AYqi113BNL6groR4C6t8ZFl7mO6RhhCOGeiVzgJoR8nRoSIeAC
 oH+B8dpE0wolt/G6kNBEcMsvV2rYmSXtw5GgoackC0g5Z+0k17dxb43tH
 X7syGx1WB+CxxVIZ5qD+QzqyneueXuT+71PUydqzZUimWgi44qEfoWEN6
 d93cKZ7zCFXcQ/gDvikNsA45EYXmdZ6P4fMqcWus81aDhgjK8gmaxndtD A==;
X-CSE-ConnectionGUID: /hRk+S3+Rc+AAm+Rm0UPPw==
X-CSE-MsgGUID: +KLSvTYST+aB8L48LA68sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="67827884"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="67827884"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:59:38 -0700
X-CSE-ConnectionGUID: o6hIufyhRg6VOzNXv331sA==
X-CSE-MsgGUID: /IM1MdHtT3C9D+svmyXpeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144066701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 20:59:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 20:59:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 20:59:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.71)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 20:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb23JmPYl91y/3O/X265ukmMkVMlHsqChMMfRj+BYdA95Jwm5hK/XXc0wlhvqmQVySu2CBkltp5NEy47LbkbNQUNeXO1kiwfeKvDO9AfX7xkcyXg0hCEjcht00p42HEVNdOz08aXG+wmAEMLsaXMV29oG+aJDt1qci1bni9QS9AVZrBOBEjHe0MGaRKGX3dOKxuR/isuIPyUYsyVi+T1Wl4F+xSE7RGC0STnz0Uh5bYEObGdP7aw5H16Z+TsN4xbIIiofjPi+SnxQHi1YDTJVZJD7nT5qV/Aswd3vHWpMbuEjb4V448eBp8jKDfz3KDk2/BLSGAqBHLqEG4Kth7wPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga3yBaXnGjzxyH7C3f6uqvyzy6yKIYz6GI+jauJPub8=;
 b=TjfD7JPM71SesNbmmPcbttkPEYp0PEuAo5zRLMCMKQTWvRqR45SlEsA6qMVfDwLqkV8E4ZLaXtdBVphLcRi+2JEVcIh4Wm+EUpC6LRfq/Nt1FhxlBM0HlvLRt0qlurO2JpR5ShLYLAeS0c+iLfIdGHlI2W/9JruLpXgwocQOFHhQuRdYsZMrOG6ycpE/I6pFjLoYZc8VP2jKVSzUTMEjV8Lg44LU0oaO46g6cfglWXtKPwafLQG7vwQQJhYZMLOzN4scQjM/fCKAbECGagxe18J2c4zgQOS91HfdzIBfE6O7e6Zm0OPIkRZDrUZNcWE6CepD6UqXD1h7G6/qOJdGdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB8002.namprd11.prod.outlook.com (2603:10b6:806:2f6::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 03:59:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.021; Wed, 28 May 2025
 03:59:29 +0000
Date: Tue, 27 May 2025 21:01:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/vf: Register CCS read/write contexts with
 Guc
Message-ID: <aDaKfOwKMmxm+V2o@lstrano-desk.jf.intel.com>
References: <20250521141141.17572-1-satyanarayana.k.v.p@intel.com>
 <20250521141141.17572-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521141141.17572-4-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:303:87::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 30b8839b-070f-491f-57ed-08dd9d9c0be8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWlQVEhlWXc0NXRkZXhhMTRmZ0dKaGw4cDdZNCtrS3d3bGlReFBiRWEzdlRu?=
 =?utf-8?B?d0YyaDdLQzRLMk9sMkVlM2d0a3lsMmZYZHptd3FpZmFhNlJRc0VNK0Q3d1BK?=
 =?utf-8?B?WmdDbm5zYnNyUGFGdGNoS29HMnFXQmFwRnFxQVV6UlNvQ0F3K1dGalBiRzM5?=
 =?utf-8?B?c3dHT0kyWmRLRUFPVVM0KzRqZ0dENjRkVFNpVFpIOWxuanQrUzFheUFvL0hX?=
 =?utf-8?B?OGtrTk1BdXNKZWFhTG45MUY5VG1jOWlOVWtTMDlFaWpsN1p0YWtXWjZmQ0V3?=
 =?utf-8?B?WjIxVUdwd1I4S3JUOXpERTRHbnBxVGlBOVZ6NDNHU1V2czEwWXBUVlpUMmJN?=
 =?utf-8?B?WUhiTmdWb2Z1SXU3T0tkM2dvMVNvK2RQaXlwTXJNZWJuOStjMnp2bjJOWXFk?=
 =?utf-8?B?UlFOWFlMNnF6Rmw4eGNBbGtSdTJJZ3ZPR0RQam81N05nbk11RW5mYURYMkUv?=
 =?utf-8?B?WUdOSVppRC9MK3dDT0J4RjJQeU84dEZZb3hMOU1VUGc2aUxiZ0lqQmFiYVc3?=
 =?utf-8?B?Sk1oejFZYlgxYzJUelBab2s3Wlhpb0loeXEyU1czT0dZcTVBaTc2NWZ1dE9u?=
 =?utf-8?B?S09maFdpZWZxejI3bThLdlU5azcxZmFJRnRJbk1KaGJxRXJUWk16STgyVjZp?=
 =?utf-8?B?TXYrZEVSd3FPY2xFOEN2NVF2ckZnamtMb3pVdEZpSXVYN281YnVwYzhIY3pO?=
 =?utf-8?B?b3ZHOG1sZ2J4QndrOEZzTFF4NWZDTjhPeUNnUk00cHpkMG42ejFQWEdIS204?=
 =?utf-8?B?TXVmRkxCQk9WY3ZMcWJwRTBUdWF6K2FkRVNtZUdtcW9ZVG0wSUFFTHIzTHVt?=
 =?utf-8?B?ZWZEZm1SM0dwNHFxcFVJSjc2ZG5EMkw4eEIxREc2NkFhSytRQnd3NDhIU1pJ?=
 =?utf-8?B?MFRibW1FeU1wUW14YktXcXBPRmlMdC90OGpzMFY2V0kyMWZKZE1mZjA5QjBo?=
 =?utf-8?B?NE9nalV3MlZ2YWM2UU5xRkppTVE1OGZLVmRuYkRVOXFHZUNkWVBoQjB4K05m?=
 =?utf-8?B?REthVzd2azdJWUt3ckZNUG5qUmxJTklWekNQTG40RS9YVk94NDErUndzUnN2?=
 =?utf-8?B?aXgrVThUZ1FiR05OOXNheE9BeWE2ZHJ1dkV4SUFTbmpvZkhkYWorYUVpWk52?=
 =?utf-8?B?QVMwSHBNV01QSElXU25DWjE3NmNQKzBQc3lkOXluMld4dHArODRmekYxQlFW?=
 =?utf-8?B?cjE2U2hPQmdOVUJINGpoczhzcnNlOWN2RmgwUXZ5dXNXbFZWdHB4Y0sxaTQ2?=
 =?utf-8?B?c0YxbXFFQ1ExYzlyVEp5QXVxZHlySnl0YkxpVVRZeEszWEZJNjRXNHNZbmtT?=
 =?utf-8?B?UmlLa2d6UnlScDRkM3BLUi9YZmViTThvUDRkNHZkWkhxOHZISktVTEg5RUYz?=
 =?utf-8?B?cXV6bE1GRmpSNzlpTkxWMENHQU13dlJCc05pK2Y1U08rY1hmRUdPaGU1YU9T?=
 =?utf-8?B?WDk3WndrT0JpaTRGSGFBbUhsNnU3Q1hPYnFua2NBaFBtd2ZiRG5HWTdyTHpk?=
 =?utf-8?B?Qzl0dEcxdmhudytHRUZGQmhRMmt5cVF0SzdROWlYODFkZk9PREgyaHZaV0Y0?=
 =?utf-8?B?d2Y0V2VPdG1zc0Z0MkZ2QTNjd1BjNnNrclNKT0MvaWhKT2EvMEdiTU5uS1Aw?=
 =?utf-8?B?ZGNiaDBZVUxUUEE4c1NkS2pjbTFDbVB4RkljeVF5TGc3ZWVwNnpPMmpyaEFn?=
 =?utf-8?B?M1FaQy9ZcXgwbVVla1drN1ZZZStIUm9PNXkwamcrS1psdlBOeUJlaHc5QmQx?=
 =?utf-8?B?Z3ZqNzFhUTJhVk91c0JMNTV6dlhXUWd5UEtBdjV4ajVZOWdCTXVUNWRRM3lV?=
 =?utf-8?B?Yy9XcFI0S1hvblpiYVc2NjRYWXd2N0lWeDJKVjA1ZzhseHFsSEMzQVpndy9V?=
 =?utf-8?B?ajRpSGo3MFB1MnVmT3ZraHllMG9PaEQvTDRPZEVTVm04ZEVaSEt0ZVNySEZC?=
 =?utf-8?Q?nGJUL0sPamU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zi9ZQXFkRVZibHlsTHNuOThiZkhxN3FNclNWTVovU2hKanQvRlRRVHpaZUV4?=
 =?utf-8?B?UUMxNjFPMitGL3AvR0orTkJwMkprZUxkSGtPT3IzWVg5Z2Y4cGd0RlZaQjBT?=
 =?utf-8?B?RmJueC9jdHVsMXVDM1g2RDExQ01veTE3ZFg2a1JBZHpIZjJ3TTdsOU16OFRX?=
 =?utf-8?B?TWY5N1ViSERSbGQxeWw3OHBpTHF6UVdtdXJ6Z3pPOTRrVHR5TnF5V3B2VGRK?=
 =?utf-8?B?QXMzTGhWQ01ybmgyaHFnQmhFeE5RQkhmckpBdXZGZEhqaTRLcGtYSUFRdXRu?=
 =?utf-8?B?b2NvQnNtT0tOamxUNEQ2cTlWeWVZWVJVVVAvMUhvamtiRTZtTlFmWGVhb1BI?=
 =?utf-8?B?M0JFc2ZVc3hJM1FrL2YzY0FOcldzRUZkT3VvZTZadmZBZDRjY1F6RHZZNStF?=
 =?utf-8?B?MSs3NE9Ybm5tR3pCc2NBeTdHMEZjWk15Tk1selQ4YUxUL1Z5elpoSTYrMnA1?=
 =?utf-8?B?M3hoN21tVXJtZGZEemhmOWMxMHdNYlRZV3lmelpOcy9JR2xvRFlQRWVQbXNo?=
 =?utf-8?B?SFNmeWVJa3U1SjI0cU5tMmRiUExpcEtaV1VadlY4UmRKYnhab1A3VlR5dUZx?=
 =?utf-8?B?UzRlY1pGTXloL1Z3M3BJclNSK3RJeW9UcmZnRC9ld2ZhR1FuUWdHdUcxVUxk?=
 =?utf-8?B?K3Vra1Q3WXpSajFscXAvVVdhaURpL0dvZTNzT1BHelpUYzVrZHY3cUVacDJO?=
 =?utf-8?B?RFlaRFJBVXZJbHZhcFZxeEttcnZOcnc4UzFNT3liQTlaUHB6Qk0yQnZ5NnJm?=
 =?utf-8?B?Ym1YZWl1RmtaQXhLTTVFRjFoRjdLeGJjWkF0bG9YT1o5NGs0UHZ1anFLejVC?=
 =?utf-8?B?MDBtQmlaVS90TmF0N0tsVUZjS3JrRks3clVwcHRxUW9QcTdHejNaekxqM3pX?=
 =?utf-8?B?ajE4L0FXcDllL3Q1eVd2TkVnQ2Z1OUZibnRWdFF0ZnJoOW9RV0V0aXBsenVs?=
 =?utf-8?B?bXphVHpibmVhbE9UanA2QjgxSk1VZ2l2dVlBMHVhcVBpQVdmam1vTlZkNXdv?=
 =?utf-8?B?bkhQbjdXdytwdE5DeHBQaFRwRFNUT2Y3bm1jS2VnWXFOejdIVTNuVmlmWHE1?=
 =?utf-8?B?cmJ6dm45ekNObUF1cnlFYzdKUUFKY0phVkUvZnBJTCtpN3RWbjY1UFhIQ3lH?=
 =?utf-8?B?MDZkS2JZOHl5VFlSRW5SbVNMUUdTQ1FBY20zYXM5ajFtc0pZZHVmWmF1dFVw?=
 =?utf-8?B?N1Z0ckdBSlg2WFpMWHo1NVJCMmJDalVtNCtFMUJCQXJKbVRrM3ZJSDVXZVR6?=
 =?utf-8?B?UHMrYUs4cFN0UjVMMFVLYnc2YytCcmhFRGNQSHFYbkR0VGFMUVhwNDlTNVZZ?=
 =?utf-8?B?bnVzMUI5b2d3YjlzaTdiM1FDNzZnNmQzWXYzU2JDZGt3aU9raEd2R0R6WFQw?=
 =?utf-8?B?bVMzeCtodm5yVVVEV3JOQmkwQlU3b2xnb3Q0NE5wcmxBdFpnZ0FxV0laS1F5?=
 =?utf-8?B?WHhEQTlvdUw1d0t0R25xN3RSS1lleGtINmtLUmtqSEVkSFlqNVpXbHJ6TURG?=
 =?utf-8?B?aTNxUWRUMmdnUE5aUytrSUtsTXBNWS9lSjRocUdSN2tWODFlYzRyU3hEQnUy?=
 =?utf-8?B?Ti9XU3FzV0pPcGN4Yi9hVEExV3crQVBIY1o3MHNFbVpHckE2T1JLWUx5bHZs?=
 =?utf-8?B?V2JiUjFXbEErN0hsTllORUJiTHBhZlpPckJ0cGZvVzN2R1R2eWV2ckV3YnFI?=
 =?utf-8?B?NWJ0bmFhRC84NHlXck1lQjdCL3ZBVnYzaUtXNHBqck1hRU5LdGlvbnJiNFFk?=
 =?utf-8?B?TytpdHVjTUhLVnZRR0hNR2U3QXBWL3pmSzArRFovdzBzVmNobjRablR0Um13?=
 =?utf-8?B?bEg3SEFLOU5VdGRJblh2SDhZTXVXeU5ELzViaXlPYWhUaC9IY3MreVVIdWUz?=
 =?utf-8?B?R2prY2wwc2hXUVhUOVVhWW41Y0x1STVycUFOUStybEl0R1kyYUtac3kyaUlO?=
 =?utf-8?B?R0huakx0U0RJb21RbzFkamtta3BuOHhLcG80cWphbnMzaUtIRDRVRnRXR3A2?=
 =?utf-8?B?L1NyV0ovTkdZNGt2V1hzc2VYMDBLYkVLWHA3b1lXdGlDdW1rNEFVYmlXRW0y?=
 =?utf-8?B?R09vZGhrZ2NTNnpzcUwxN29oNjJlU1YvS3VIdytVUk5BR1BjOHRnNzhpMllV?=
 =?utf-8?B?VXZ6QUJUeThNZ3h5REVlSUZLTHY1MlNROGtPVW9udEMzQnc5Sm9URTFiWFc1?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30b8839b-070f-491f-57ed-08dd9d9c0be8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:59:29.8189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMYtEbwRPf1yb1+BVVPXTNtCD//mcWRaCeysP0rv90ZmaaDXXa0keTKf4Lfpbsd/XkD8KFY/J+rUja0fUlR1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8002
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

On Wed, May 21, 2025 at 07:41:41PM +0530, Satyanarayana K V P wrote:
> Register read write contexts with newly added flags with GUC and
> enable the context immediately after registration.
> Re-register the context with Guc when resuming from runtime suspend as
> soft reset is applied to Guc during xe_pm_runtime_resume().
> Make Ring head=tail while unbinding device to avoid issues with VF pause
> after device is unbinded.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Made xe_migrate structure private as per review comments.
> - Created new xe_migrate functions to get lrc and exec_queue.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h     |  5 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c   | 37 +++++++++++-
>  drivers/gpu/drm/xe/xe_guc_submit.h   |  1 +
>  drivers/gpu/drm/xe/xe_migrate.c      | 32 ++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h      |  3 +
>  drivers/gpu/drm/xe/xe_pm.c           |  4 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 89 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  1 +
>  8 files changed, 170 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 6f57578b07cb..71a5208d0316 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -45,6 +45,11 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> +#define GUC_CONTEXT_NORMAL			0
> +#define GUC_CONTEXT_COMPRESSION_SAVE		1
> +#define GUC_CONTEXT_COMPRESSION_RESTORE	2
> +#define GUC_CONTEXT_MAX_TYPES			(GUC_CONTEXT_COMPRESSION_RESTORE + 1)
> +
>  /* Helper for context registration H2G */
>  struct guc_ctxt_registration_info {
>  	u32 flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80f748baad3f..fc50f354dba9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -531,7 +531,7 @@ static void __register_exec_queue(struct xe_guc *guc,
>  	xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>  }
>  
> -static void register_exec_queue(struct xe_exec_queue *q)
> +static void register_exec_queue(struct xe_exec_queue *q, int ctx_type)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -548,6 +548,9 @@ static void register_exec_queue(struct xe_exec_queue *q)
>  	info.hwlrca_hi = upper_32_bits(xe_lrc_descriptor(lrc));
>  	info.flags = CONTEXT_REGISTRATION_FLAG_KMD;
>  

xe_gt_assert(guc_to_gt(guc), ctx_type < GUC_CONTEXT_MAX_TYPES);

> +	if (ctx_type != GUC_CONTEXT_NORMAL)
> +		info.flags |= BIT(ctx_type);
> +
>  	if (xe_exec_queue_is_parallel(q)) {
>  		u64 ggtt_addr = xe_lrc_parallel_ggtt_addr(lrc);
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
> @@ -750,7 +753,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>  
>  	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
>  		if (!exec_queue_registered(q))
> -			register_exec_queue(q);
> +			register_exec_queue(q, GUC_CONTEXT_NORMAL);
>  		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
>  			q->ring_ops->emit_job(job);
>  		submit_exec_queue(q);
> @@ -2347,6 +2350,36 @@ static void guc_exec_queue_print(struct xe_exec_queue *q, struct drm_printer *p)
>  	xe_guc_exec_queue_snapshot_free(snapshot);
>  }
>  
> +/**
> + * xe_guc_register_exec_queue - Register exec queue for a given context type.
> + * @q - Execution queue
> + * @ctx_type - Type of the context
> + *
> + * This function registers the execution queue with the guc. Special context
> + * types like GUC_CONTEXT_COMPRESSION_SAVE and GUC_CONTEXT_COMPRESSION_RESTORE
> + * are only applicable for IGPU and in the VF.
> + * Submits the execution queue to GUC after registering it.
> + *
> + * Returns - Success or error
> + */
> +int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type)
> +{
> +	struct xe_guc *guc = exec_queue_to_guc(q);
> +	struct xe_device *xe = guc_to_xe(guc);
> +
> +	if (ctx_type != GUC_CONTEXT_NORMAL) {
> +		xe_assert(xe, IS_SRIOV_VF(xe));
> +		if (IS_DGFX(xe) || (ctx_type < GUC_CONTEXT_COMPRESSION_SAVE &&
> +				    ctx_type >= GUC_CONTEXT_MAX_TYPES))
> +			return -EPERM;
> +	}

Seems overkill to sanitize input, I'd just use xe_gt_asserts to make
sure the input values are sane.

> +
> +	register_exec_queue(q, ctx_type);
> +	enable_scheduling(q);

Do you need to enable scheduling? I suspect you don't as this is special
queue run by the GuC. I'd check with the GuC team on this. Also if head
!= tail of LRC this might get run... Again I'd check with the GuC team
as this doesn't look right.

> +
> +	return 0;
> +}
> +
>  /**
>   * xe_guc_submit_print - GuC Submit Print.
>   * @guc: GuC.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 9b71a986c6ca..f1a26d498339 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -39,5 +39,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
>  void
>  xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *snapshot);
>  void xe_guc_submit_print(struct xe_guc *guc, struct drm_printer *p);
> +int xe_guc_register_exec_queue(struct xe_exec_queue *q, int ctx_type);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 43de220b3109..4461af935409 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1099,6 +1099,38 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  	return err;
>  }
>  
> +/**
> + * xe_get_migrate_lrc() - Get the LRC from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to LRC on success, -EINVAL on failure
> + */
> +struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate)
> +{
> +	int err = -EINVAL;
> +
> +	if (!migrate)
> +		return ERR_PTR(err);

Seems overkill to check for NULL here.

> +
> +	return migrate->q->lrc[0];
> +}
> +
> +/**
> + * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> + * @migrate: Migrate context.
> + *
> + * Return: Pointer to execution queue on success, -EINVAL on failure
> + */
> +struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate)
> +{
> +	int err = -EINVAL;
> +
> +	if (!migrate)
> +		return ERR_PTR(err);

Same here.

> +
> +	return migrate->q;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index 2a2f6c4690fb..0867e79b6817 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -120,6 +120,9 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  			   bool copy_only_ccs,
>  			   bool read_write);
>  
> +struct xe_lrc *xe_migrate_get_lrc(struct xe_migrate *migrate);
> +struct xe_exec_queue *xe_migrate_get_exec_queue(struct xe_migrate *migrate);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index f64ebd7b854a..a47539ce98eb 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -22,6 +22,7 @@
>  #include "xe_irq.h"
>  #include "xe_pcode.h"
>  #include "xe_pxp.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace.h"
>  #include "xe_wa.h"
>  
> @@ -546,6 +547,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_pxp_pm_resume(xe->pxp);
>  
> +	if (IS_SRIOV_VF(xe))
> +		xe_sriov_vf_ccs_register_context(xe);
> +

Did you ever follow up on removing VF runtime PM suspend / resume flows
or converting them into SW only disables rather than blowing away GuC
state? Maybe out of scope for this series but I think that would make a
bit of sense and if we did that we wouldn't need to re-register the
contexts.

Matt

>  out:
>  	xe_rpm_lockmap_release(xe);
>  	xe_pm_write_callback_task(xe, NULL);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 0e8ff3d4b0c5..c58eb21e7084 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -7,6 +7,9 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue_types.h"
> +#include "xe_guc_submit.h"
> +#include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_sa.h"
>  #include "xe_sriov_printk.h"
> @@ -115,6 +118,82 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>  	return 0;
>  }
>  
> +static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
> +	u32 addr = ctx->mem.ccs_bb_pool->gpu_addr;
> +	u32 dw[10], i = 0;
> +
> +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> +	dw[i++] = MI_BATCH_BUFFER_START | XE_INSTR_NUM_DW(3);
> +	dw[i++] = addr;
> +	dw[i++] = 0;
> +	dw[i++] = MI_NOOP;
> +
> +	xe_lrc_write_ring(lrc, dw, i * sizeof(u32));
> +}
> +
> +static int register_save_restore_context(struct xe_migrate *m, int ctx_id)
> +{
> +	int err = -EINVAL;
> +	int ctx_type;
> +
> +	switch (ctx_id) {
> +	case XE_SRIOV_VF_CCS_READ_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
> +		break;
> +	case XE_SRIOV_VF_CCS_WRITE_CTX:
> +		ctx_type = GUC_CONTEXT_COMPRESSION_RESTORE;
> +		break;
> +	default:
> +		return err;
> +	}
> +
> +	err = xe_guc_register_exec_queue(xe_migrate_get_exec_queue(m), ctx_type);
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_register_context - Register read/write contexts with guc.
> + * @xe: the &xe_device to register contexts on.
> + *
> + * This function registers read and write contexts with Guc. Re-registration
> + * is needed whenever resuming from pm runtime suspend.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
> +{
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;
> +	int err;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			err = register_save_restore_context(ctx->migrate, ctx_id);
> +		}
> +	}
> +
> +	return err;
> +}
> +
> +static void xe_sriov_vf_ccs_fini(void *arg)
> +{
> +	struct xe_tile_vf_ccs *ctx = arg;
> +	struct xe_lrc *lrc = xe_migrate_get_lrc(ctx->migrate);
> +
> +	/*
> +	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
> +	 * submits this context to HW on VF pause after unbinding device.
> +	 */
> +	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +}
> +
>  /**
>   * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
>   * @xe: the &xe_device to start recovery on
> @@ -148,6 +227,16 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  			err = alloc_bb_pool(tile, ctx);
>  			if (err)
>  				goto err_ret;
> +
> +			ccs_rw_update_ring(ctx);
> +
> +			err = register_save_restore_context(migrate, ctx_id);
> +			if (err)
> +				goto err_ret;
> +
> +			err = devm_add_action_or_reset(xe->drm.dev,
> +						       xe_sriov_vf_ccs_fini,
> +						       ctx);
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5d5e4bd25904..1f1baf685fec 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -12,5 +12,6 @@ struct xe_bo;
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_register_context(struct xe_device *xe);
>  
>  #endif
> -- 
> 2.43.0
> 
