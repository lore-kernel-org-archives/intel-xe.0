Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F9DCCD1A2
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:50:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C52D10E354;
	Sat, 18 Oct 2025 02:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpsTkCmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E3910E354
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755815; x=1792291815;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oTKzeVCCBD1jIf0UdzrcZ5Eld1dGtcfJchNlDj3Nsus=;
 b=gpsTkCmc3IuDkq1UFIzREyIcQ4mU1+Xp3XCs08YWhif7z46daLn7XWch
 gW8CDvuMR29xhTd17rXgCRGzFOR78n8Te2vTk9gteDywV2nbDrBooQGNe
 ChACq6M9k2D1UyAOaHbPCEJazD7bfIsALSrJWPJtu3OxUCmcIIVL0W0Ao
 K9hm/ZD0sQjtihC7Q5doa2RUFuMHqcq9fTrzVHSBqkSD0PVYBtqNlS7te
 Nvmv74pMUK2cliMpbzbIkYQROZ0d+MW3Cr997nRVfBtE6TtjG4IM1DSJm
 WedNYYOr84xohR27/CvhVoRXQaXEmPasx7cKYT0o5lAismmz8Wr+70P33 g==;
X-CSE-ConnectionGUID: +c2HlTUUSw6qVyGSYuYPQw==
X-CSE-MsgGUID: gRZd0xtcTxKOeCjdlL4LyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="50541909"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="50541909"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:15 -0700
X-CSE-ConnectionGUID: BsnccGtgRE6p+z68YpcpbA==
X-CSE-MsgGUID: TJkTC+qrT222WJhoWfl8ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="188177102"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:50:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:59:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 15:59:06 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 15:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kGf+yoCCk2jFFPNH03gb3lkQYjB6DQmViEqILY3Blox/GxaWozmsbIhMXyXWh65x+ozSPPIAZMdIFhqUzDqRV62hif1xB6g55qFIT/J2lrTnvHkVbn1OBrvBLx4JiT2vmZmKASLyks75BZyf8Ap6XtSLo7Pyv+ewyvyANwfS0jy4MK7+tmLrucMtsWFjIs+gHoygzqW6KFKRFpDGr9MHikfuHvKQ91lKpCyfLG8Li9CHmV1wwi3LXxRTorN2v2ySS5IfCsWgLsqYur3JCQf+fAaZG+hpHbrXPaAuu+DtbID9ZKhQTjhvIK0pCpvTgg9FhXVcFu2OWNKO3HhUzB60EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ho3+L9OS9YO80YX4v7rI2eFn4aaD4iXP7Pw3/JCaGCw=;
 b=aChIhuSDc/Q3sSSjMEBsvKy2Vy5YfIWf+fiXMuESgmSo/Ubd5O0/E5c3blAbBdj8/LQkNjJL+bOIJbN1PP1/gk09Kp9SILY2SYj9Dc4fRCD3A+D5FU4vh18TRbyCTlEajbxrsM3f7S/ar4ycT2hZCBNx0sZW8MvXYUaeEWmLJIcyNqPtQjtjt5AT/CW/zb2NjjqN0VO0WllBDtTaNQoDEBBIh19/R7gx3+ys9Kdvv84WSzrhtPEOfthwn31ZYo0F/dfiA0gpJPkNL770SxP1cA8KM/Uwpft1S1hEqk7pfkZNFGxsFZTEMCBsz3T5rtw6bRlIFvifm7wkqkcxqD0a3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB9455.namprd11.prod.outlook.com (2603:10b6:8:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 22:59:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 22:59:05 +0000
Date: Fri, 17 Oct 2025 15:59:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v7 1/3] drm/xe/migrate: Atomicize CCS copy command setup
Message-ID: <aPLKNpPcpffFepLo@lstrano-desk.jf.intel.com>
References: <20251017141226.924-5-satyanarayana.k.v.p@intel.com>
 <20251017141226.924-6-satyanarayana.k.v.p@intel.com>
 <aPJSNo8XM3cpGZCb@intel.com>
 <78cc87ee-6d2d-4a85-9e42-7836b97ea435@intel.com>
 <aPJgP9ShLrvSeXzU@intel.com>
 <34f2d811-6d95-450b-978f-e4fa2d21c986@intel.com>
 <aPJ0I7V4srCj6qo4@intel.com> <aPKJRxvJzdvEZ69f@intel.com>
 <20251017223516.GY1207432@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251017223516.GY1207432@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0211.namprd03.prod.outlook.com
 (2603:10b6:303:b9::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 18e2428f-aac4-450d-87d8-08de0dd0c55f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2w0NGhYWG9oRnk3S1ZIZkpCSFJsOFBOc2prelkzRGJVU0VJU0puRWcza1Zn?=
 =?utf-8?B?YkcxMHEyN0dOSzNTTit0S3hKaFc2TExDTGx1UGdId0lMRXpRSlNHa3d3ZTBj?=
 =?utf-8?B?YjI1Zmd0RVhqTGpEcWNjNW9Rbnd0RHgwSkFreGNNeWtKeWhaNTBVbmpxWmlR?=
 =?utf-8?B?NzRzT3V4NCtHclZCaHBmdnZrVFk3L091ZlBVVUVPMjdCMXNFY2p3dXJMeTBu?=
 =?utf-8?B?NHdBM0pSOWpJUWUwdGlEdlBheklPUWdXdnhzVDR1T1FmV1FFWEk2NmRhL0lr?=
 =?utf-8?B?WDJJdFBVek02YitrTTZiMWxyNXJuTjdMNUdjZDF5UXp6eWxXTTA4VmtXU3RK?=
 =?utf-8?B?UGxpUGV6d1gwZHVIa0ROb3grWXF1SWdublZjQVl3L05RWlV1RWd0TnhYNmZC?=
 =?utf-8?B?Z0FoaU81UHBGTHh4czRNWWR4RnhNTUIvRUtnVFBIM2tvaDIvaG93dnFZTEFX?=
 =?utf-8?B?OFdQa3hMbEFwZkorQjVVNldxWVpNbU5xR1ltZVdoMTRSdS9VR3lVTEtybXNQ?=
 =?utf-8?B?SlRCV3ZnQ2o2ZmZQWHRkWCtQRzdkZ1BYZitJUnlFTmRMSS9Bc3k0THNLaWwz?=
 =?utf-8?B?VDRuajdxdFhCdHV6VndnYUxmWjlkVm96bUJIM1YvemtrYzFhV1BqaFpRQnBz?=
 =?utf-8?B?ank5dlEyVFlvMU43UWU3WTA5N2xRN2p4ZmtrYWlNNldhckN0cTJ5OEx5OUJM?=
 =?utf-8?B?UU90M1FxTGMvVWhjckJwYjkxZ1NBMTNYak4zcjRvVTJNclhka0RLTGdxNFlZ?=
 =?utf-8?B?eVoxTFhjTWJtTDg3cGJMeXd6eFp4Rm81YlduMlYvNHJXZ2d0Zk13TWwxNFlW?=
 =?utf-8?B?WE1iOWd6bURwWWpsSkthUmJmK2pCUXpMZ0YxMC82aFQxNHJvRGI3eERLTVUx?=
 =?utf-8?B?WGltdzZMQTYxRjFxUzhHVHpXbGxZU0U2TkRtQUNuKzhuV2d3QVhyM3ByS1Jp?=
 =?utf-8?B?ZUJKVVBOdE1uT1h6bFY3aVBoeXFpZk9VL3NQLzg0MkdvM3RCN0VnTDlKcUJT?=
 =?utf-8?B?aGI4dy9aNjFDWjU4WklKRldRbXl4UU94RlpGWXZxa2dvdnhsM2FsRkx2Rmlo?=
 =?utf-8?B?Umd4UlZkZjg4TnJORGM2TWh6Z2JHK3ZRSm9nQVhHdWdPTDVFZzcvU043Y3oy?=
 =?utf-8?B?VnhuZkQvOEF4RURGdVBFbzI0UEw0cS9oSGlKdWprZUFLZHBZQVR5blV5NUVl?=
 =?utf-8?B?UW1wdlRaU2JhS2RHdEdxOW1tbG4zbllNeE5zU1RXVm1HNzBwVmhybWFYQ0NE?=
 =?utf-8?B?VzNlQTVQSW9pWDlBTEdVTkdXS2pnalQzRGxTbDBoRnU3b3BnNzVCNUZ2SXNK?=
 =?utf-8?B?L3FGWmIxZytiZUhCem9wQ3hpcmRDZnhSWXcxVFhxWEFjYkNXNzI0UWE3VFhX?=
 =?utf-8?B?cUJLK0t2ekY4d2psa2I1T09rdGpHMUpiZDdDRnhxQ3VMeUZYalpMZmRaaUlu?=
 =?utf-8?B?NEtrVm9RRk4yZy9PSUhPU1dPOXZIcHZYMkZyN3RKTGo3Kys3Z2YwZHRKTFZC?=
 =?utf-8?B?dGRQT2ZieSsyZUp3SW1BWVV6ekEwcG1ucUZqYWpDemNXa2lnWGtiUHdxVmdr?=
 =?utf-8?B?K0RqN1NZdkRZTDNuSlJMY0paM2JIS0F3MThSelkyeUlKVktqSVlXaEQ0NWg1?=
 =?utf-8?B?SHNiSmptVFBDVFJBdStrZkI5cGpnMXlmdHFsWkRsaGFSKzNrZ3o2ZkhnYUhy?=
 =?utf-8?B?RmZQczBPdWJ3V1liQitKcUtPa01zb1JrQXdTdnlwMDVQNjNMVk14T0E2Q2tC?=
 =?utf-8?B?SzllZFdZd3JIc21uQUFjMURVUFhkV0pSME42SWUvdzhyZlNNRndZY3k0MUlC?=
 =?utf-8?B?cHBDK3VsWmJ3ZkVFTWtJRlN6T1ZmTk1iSWdxcjlocHpLaXZSQzI3Ty9JVThN?=
 =?utf-8?B?ZTBCeTRqU2JyUk1EaHUxRllmUkw2OGtBbnpnd3FtM0FhKzVTYi94WmRiWHZr?=
 =?utf-8?Q?f7LDIvQCRDlWiUiNM11oo9i9bRgmvwuq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWNzZk5hakVUOC9nZ0thMk9hMkJwcXBpNGEyc0x1aGlySG82RGZpTGthM0xu?=
 =?utf-8?B?L3JjVk9qWkc4eTN1RGJPamp1eWRvcHhZVWlkZHpvSVZha1lMMWFMTFZEWTcr?=
 =?utf-8?B?cURBR2FmelhvdEpHT1k4Z0xKVE1pVitjM0d0UHpjWlBqQkxLYUNKMmFCOHNL?=
 =?utf-8?B?Z20zbnBtMVdYM0tndVZxaGlJWXQvVmVMSFRXdmlOckNucVFDTlVtNDNmMlJD?=
 =?utf-8?B?SWNsdHg3VHlhRE1uUjhVekZwVXRQMlYxY3hGSDB6M1NRQU12V3BDZSthZGhv?=
 =?utf-8?B?STZIR21Oem1YL0ZjMFR0U2FrWHMvdEl2bjBlcGQ5bjJYR25xNTNDNUZqUXlU?=
 =?utf-8?B?Z1Z1NWtZZ3NacjJUZXJIczYxMXdnOWpua1Z1VzUrTlRvdnZta0Iyek1CU0s4?=
 =?utf-8?B?M1BRWWpWem8xclRWVDVNVnZpMUhEaTIxc0hXTUxWVDE2YzBsbGVEM2FQVkVS?=
 =?utf-8?B?dkFJM0pBWXdSMk44YjdPY2kySkRXR2dJV0c3aXdEWUJPdzFDZXRXOXZKWmlP?=
 =?utf-8?B?K1NPMW9QS3VlVUFuQlFpbTdrUXQwQ3duSm9DSU1NcGxVRE83NnZKYjlxU1R3?=
 =?utf-8?B?KzEwbkRCZTlyYVA2cFJzaUdKbnpjODN4VkVkb0lGWWpnUVorWHF2V2tpbVUv?=
 =?utf-8?B?Ulc4d1JZalpsYy95UFVoR2JVbXFTVHBTRXZ2cnZBb05KeDI1Nmw5VE5lQnZt?=
 =?utf-8?B?WVFmRkZ6a3UyR1Zvd2Z2L09YVENVZDJFUmtiWmc3ZDZSY0lQRFlMUXplaU85?=
 =?utf-8?B?OUt0bWhkMG9KTUM3b3FLaU1nZ2FCT1FVWk5Rc0lTLzVOb3E5QmRickIza1Bu?=
 =?utf-8?B?MXlXaEI1Vnl3OXcxL1g0V2hYZGxZRGhmb1RsZE85K2c2SDdvVGY5ZzFRdGJP?=
 =?utf-8?B?OWFCdmhWcHUyczVUOG5hZkFUbmdNV0NRSUFESlFIb3ZqY21rS2orYlpYOHNT?=
 =?utf-8?B?NUdaRnNWa1hBWHdEQ2VXSlNDMTJyeVQyL1VaM0l5cVBpKy9Bc3FsK1pQNlpj?=
 =?utf-8?B?ZDBlbnJBUy8vR09WWS9pV0ZsUE5XajMrbzF1TEhNTmE1dUg4R2Q0M3M4MTZJ?=
 =?utf-8?B?M1JCbkNyU3E3OCtrZDZiS3diSjlBVDBOK0RKVkRka3hCb2ViRFlrelFzV3dh?=
 =?utf-8?B?ODJtNm5JcVlNL0JXZkJWd2VPVnlUaWNjUlNRUE90NGZOdUo5ZDUweDRrNXJK?=
 =?utf-8?B?ZVZHS3g4ODAyczIxQzA1enhVaFFUa0pud1Ztd0xpejBZWU53dHVYUEordnlQ?=
 =?utf-8?B?UkRvT3N6ZXpFMzJCUEVOM1AvZWR2MU9xd2NtY3pkYTZyOXl0U1F4SEE1M29S?=
 =?utf-8?B?U0dGWTNwLzlGN3ptNkd3V0huK3hHN1NCcWNsbGU4Y0pqSHo0TUFxbnpzeTZO?=
 =?utf-8?B?RUc2aTFPbHFNSnZvL1IvcmE1L0VlYnYzbGV4V1FnMTJxa2hoSVNpa1ZPMzRi?=
 =?utf-8?B?NitwVW9YTFhaWnhrcXR2MVBaUGFJVDVOVzdtbFczaFBmS0lQSkRHeEo4U3dQ?=
 =?utf-8?B?dm4xb1RkY2VQdmg0N05jM3l5aFV1Wmh0bDRkOVo5YWlTRTJ4ZC8xWmtZRm9E?=
 =?utf-8?B?c2NqK1lMS2tZdmFQMHZ3SFpETVphQlNpMmN2TmNiTk1qdGZ5dXdCbERqQkhp?=
 =?utf-8?B?UFlJdGVwbHg5M1d6b2FoYTZqeXQwTjhTellhTU1QdmJxdllmM0lsMVJNS3RF?=
 =?utf-8?B?U2k5Rk92cXM2QTZnNlJNa0h1dUFPYWdyWDV2RnFzN3JraVZKb3ZqbWZtVDBv?=
 =?utf-8?B?T1pQeWNVNE85Q1Nzd1hpelVGMXkxWTdEVjUySkJqeDZ6S3RBcUMveWNReFps?=
 =?utf-8?B?OE5UMTlGS05YTEJINzdsTmlOVnNEU04vQUpvN3BIZy9ibVM4b053a2hPd2FJ?=
 =?utf-8?B?dWVEeFdBUTJMUUpyRndBMGp5cFdSaWw0cHR6eFc4bThDVFhJRXFXYnhLSlN4?=
 =?utf-8?B?ZjJSR3pldVl4dHBZcTE1TG5zV0JSSmdBUmg1bXBjWHZVSUcrK2JWTDJFdk9R?=
 =?utf-8?B?d1pMc1JoUTIxMy8rMXRZZ0YzbHJoV1JKdUlNY3NoLzc5UU5YTGVvdDB3bmEz?=
 =?utf-8?B?M0cwZGJBUXN6akdUbStuTW53Q2c5UEpuS3VaaVFzZmdWclJMbFJlSkc0bW1p?=
 =?utf-8?B?NVcwaTB3alZDZGFxa2drYWJxSnB2QzJoQm1oTER3NGpQdFJCQ2lmVklvMjhE?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e2428f-aac4-450d-87d8-08de0dd0c55f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 22:59:05.0558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c52u05Zc8wcvBQRA/EOJtYqp6DnoT337XwUqTUwXtZ7AhTsB6DnPbcemq/KZQXZbMqpyIlo7zTNCWdvc4Jntfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9455
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

On Fri, Oct 17, 2025 at 03:35:16PM -0700, Matt Roper wrote:
> On Fri, Oct 17, 2025 at 02:21:59PM -0400, Rodrigo Vivi wrote:
> > On Fri, Oct 17, 2025 at 07:51:47PM +0300, Ville Syrjälä wrote:
> > > On Fri, Oct 17, 2025 at 09:59:48PM +0530, K V P, Satyanarayana wrote:
> > > > 
> > > > 
> > > > On 17-10-2025 20:56, Ville Syrjälä wrote:
> > > > > On Fri, Oct 17, 2025 at 08:46:37PM +0530, K V P, Satyanarayana wrote:
> > > > >>
> > > > >>
> > > > >> On 17-10-2025 19:57, Ville Syrjälä wrote:
> > > > >>> On Fri, Oct 17, 2025 at 07:42:28PM +0530, Satyanarayana K V P wrote:
> > > > >>>> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > >>>> save/restore while this sequence is being programmed, partial writes may
> > > > >>>> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> > > > >>>> instruction to write the sequence atomically.
> > > > >>>
> > > > >>> If this whole thing is so racy why don't you always add a new
> > > > >>> BB_END after new commands, and only replace the previous BB_END
> > > > >>> with NOOP _after_ the new commands have been fully written?
> > > > >>>
> > > > >> We maintain a suballocator for batch buffer management, with size
> > > > >> proportional to system memory (e.g., 16MB suballocator for 8GB SMEM).
> > > > >> Batch buffers are dynamically allocated from this pool based on the
> > > > >> number of active workloads. The entire suballocator region is submitted
> > > > >> to hardware for CCS metadata copy operations.
> > > > >>
> > > > >> We cannot insert BB_END commands after each individual instruction
> > > > >> sequence because additional GPU instructions may be appended later.
> > > > > 
> > > > > You *overwrite* the previous BB_END after the new commands have been
> > > > > appended.
> > > > We do not know where the new BB allocation will be. It may not be 
> > > > sequential and every BO has a BB. BBs are allocated and freed so often 
> > > > based on BOs getting created and destroyed. So, we can't use that approach.
> > > 
> > > Hmm, could perhaps use second level batches then. Each BO would gets
> > > its own second level batch, and the first level would just call them
> > > in sequence. Or is this already running as a second level batch?
> > 
> > This I'm not sure...
> > 
> > Matt, do you know?
> 
> My understanding of this feature is that we create two additional
> contexts (LRC's) and tell the GuC that they're special --- one should be
> scheduled whenever a VF is being stopped and the other should be
> scheduled when a VF is being started.  The intent is to use these
> contexts to do a "context switch" of the VF's CCS data --- saving it out
> when the VF is stopping and bringing it back in when the VF is resumed.
> 
> From a hardware point of view I think we could handle things however we
> like in the LRC's ring and/or batch buffers.  We could add all the
> necessary copy commands directly to the LRCs' rings if we wanted, or we
> can add them to batchbuffers, or add them to 2- or 3-level nested
> batchbuffers.  The current approach actually taken appears to be to
> allocate a large chunk of memory (ctx->mem.ccs_bb_pool) and do an
> MI_BATCH_BUFFER_START off to it.  That ccs_bb_pool is originally full of
> NOOP (nothing to do), but as the VF allocates buffers, suballocations of
> the pool are done for each buffer allocated, and those suballocations
> are filled with the necessary commands to copy the CCS data in/out.
> When a buffer is released by the VF, it's suballocation of the pool is
> wiped over with NOOPs.  Any time a VF starts/stops, the save and restore
> LRCs get scheduled by the GuC and execute their entire ccs_bb_pool as a
> single batchbuffer (mostly containing noops, but with sections of copy
> instructions scattered around).  
> 
>           Save LRC
> H +-----------------------+
>   | MI_BATCH_BUFFER_START |-------> +-------------------------------+
> T +-----------------------+         |            <noops>            |
>                                     +-------------------------------+
>                                     | instr's to copy CCS for a bo  |
>                                     +-------------------------------+
>                                     |            <noops>            |
>                                     +-------------------------------+
>                                     | instr's to copy CCS for a bo  |
>                                     +-------------------------------+
>                                     |            <noops>            |
>                                     +-------------------------------+
>                                     ~             ...               ~
>                                     +-------------------------------+
> 
> So the problem this patch is trying to address is when a suballocation
> of the pool is made, and the CPU is in the process of poking
> instructions into it with the CPU when the VF is stopped; part of the
> copy instructions will have landed in memory, other parts may not have.
> But the GuC will still execute the entire pool as one giant batchbuffer
> but the subsection that was being updated will be incomplete, possibly
> in harmful ways (e.g., an instruction started, but the addresses it
> referenced not yet filled in).
> 
> 
> The architecture document for this feature suggests the following:
> 
>         """
>         VF KMD can utilize standard cmd programming technique like
>         Shadow cmd buffer or ping/pong and swap BB_Start address to
>         avoid partially-updated BB is executed by GuC in case of middle
>         update pause.
>         """

I totally missed this in the SaS. I wonder if this was added recently or
I'm just bad reading.

> 
> So it sounds like you could have two "save LRCs," make the updates to
> the one that's currently inactive, and then tell the GuC to replace the
> current save context with the other one once you finish an update (if
> the GuC interface lets you do that --- I haven't checked).  Any time the
> GuC actually starts running something, it's a complete LRC, ring, and
> batchbuffer, and there are no racing updates to those from the VF KMD.
> 
> Alternatively, you could stick with a single context for each, but just
> create a shadow batch buffer instead of a whole shadow context and then
> patch the address that the MI_BATCH_BUFFER_START is jumping to after you
> update the inactive buffer.  If the batchbuffer is in the GGTT, then we
> only need an uninterrupted 32-bit update since the upper dword of the
> address is always 0.

Yes, I don't think it would be "two saved LRCs" rather, "two saved
BOs.".

On the surface, using two BOs sounds promising, but we’d need a
device-level lock to ensure that at most one thread controls which BO is
the shadow and which one the GuC sees. That might be fine, but it’s
something that needs to be considered.

Matt

> 
> There are probably also ways you could use MI_PREDICATE and/or
> MI_COND_BATCH_BUFFER_END to make the hardware execute the "ready"
> batchbuffer and not the "inactive, updating" batchbuffer without having
> to go back and patch the ring contents via the CPU, but I'd need to
> refresh my memory on the exact usage of those kinds of instructions.
> 
> 
> Matt
> 
> 
> > 
> > > 
> > > It might also be getting a bit complicated I guess, but at least it
> > > wouldn't have all obvious problems of the SIMD stuff:
> > > - looks like it will explode on non-AVX capable x86
> > > - will be broken on other arches until someone implements the equivalent
> > >   code (assuming the arch has such an atomic copy instruction
> > >   and supports in kernel SIMD stuff sufficiently to use it)
> > 
> > This is Pantherlake only. And the reason why I asked to add a
> > check with error/warn for IS_DGFX()...
> > 
> > which by the way is an assert... I still don't believe it is enough.
> > I believe a return with warn_on seems more appropriate to really
> > never try to run that code in case of a big future mistake.
> > 
> > > 
> > > > 
> > > > -Satya.>
> > > > >> Instead, a single BB_END marker is placed at the suballocator's end to
> > > > >> terminate execution.
> > > > >>
> > > > >> This patch ensures race-condition-safe CCS metadata save/restore
> > > > >> operations by guaranteeing atomic writes to the batch buffer, preventing
> > > > >> corruption regardless of when save/restore operations are triggered.
> > > > >>
> > > > >> -Satya.>>
> > > > >>>> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> > > > >>>> 8 dwords instead of 5 dwords.
> > > > >>>>
> > > > >>>> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> > > > >>>> chunks.
> > > > >>>>
> > > > >>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > >>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > >>>> Cc: Matthew Brost <matthew.brost@intel.com>
> > > > >>>> Cc: Matthew Auld <matthew.auld@intel.com>
> > > > >>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > >>>> Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > >>>>
> > > > >>>> ---
> > > > >>>> V6 -> V7:
> > > > >>>> - Added description explaining why to use assembly instructions for
> > > > >>>> atomicity.
> > > > >>>> - Assert if DGFX tries to use memcpy_vmovdqu(). (Rodrigo)
> > > > >>>> - Include <asm/cpufeature.h> though checkpatch complains. With
> > > > >>>> <linux/cpufeature.h> KUnit is throwing errors.
> > > > >>>>
> > > > >>>> V5 -> V6:
> > > > >>>> - Fixed review comments (Rodrigo)
> > > > >>>>
> > > > >>>> V4 -> V5:
> > > > >>>> - Fixed review comments. (Matt B)
> > > > >>>>
> > > > >>>> V3 -> V4:
> > > > >>>> - Fixed review comments. (Wajdeczko)
> > > > >>>> - Fix issues reported by patchworks.
> > > > >>>>
> > > > >>>> V2 -> V3:
> > > > >>>> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> > > > >>>> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> > > > >>>>
> > > > >>>> V1 -> V2:
> > > > >>>> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
> > > > >>>>     (Auld, Matthew)
> > > > >>>>     - Fix issues reported by patchworks.
> > > > >>>> ---
> > > > >>>>    drivers/gpu/drm/xe/xe_migrate.c | 112 ++++++++++++++++++++++++++------
> > > > >>>>    1 file changed, 91 insertions(+), 21 deletions(-)
> > > > >>>>
> > > > >>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> index 3112c966c67d..e0be7396a0ab 100644
> > > > >>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > > > >>>> @@ -5,6 +5,8 @@
> > > > >>>>    
> > > > >>>>    #include "xe_migrate.h"
> > > > >>>>    
> > > > >>>> +#include <asm/fpu/api.h>
> > > > >>>> +#include <asm/cpufeature.h>
> > > > >>>>    #include <linux/bitfield.h>
> > > > >>>>    #include <linux/sizes.h>
> > > > >>>>    
> > > > >>>> @@ -33,6 +35,7 @@
> > > > >>>>    #include "xe_res_cursor.h"
> > > > >>>>    #include "xe_sa.h"
> > > > >>>>    #include "xe_sched_job.h"
> > > > >>>> +#include "xe_sriov_vf_ccs.h"
> > > > >>>>    #include "xe_sync.h"
> > > > >>>>    #include "xe_trace_bo.h"
> > > > >>>>    #include "xe_validation.h"
> > > > >>>> @@ -657,18 +660,68 @@ static void emit_pte(struct xe_migrate *m,
> > > > >>>>    	}
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> -#define EMIT_COPY_CCS_DW 5
> > > > >>>> +/*
> > > > >>>> + * VF KMD registers two specialized LRCs with the GuC to handle save/restore
> > > > >>>> + * operations for CCS metadata on IGPU. The GuC executes these LRCAs during
> > > > >>>> + * VF state/restore operations.
> > > > >>>> + *
> > > > >>>> + * Each LRC contains a batch buffer pool that GuC submits to hardware during
> > > > >>>> + * VF state save/restore operations. Since these operations can occur
> > > > >>>> + * asynchronously at any time, we must ensure GPU instructions in the batch
> > > > >>>> + * buffer are written atomically to prevent corruption from incomplete writes.
> > > > >>>> + *
> > > > >>>> + * To guarantee atomic instruction writes, we use x86 SIMD instructions
> > > > >>>> + * (128-bit XMM and 256-bit YMM) within kernel_fpu_begin()/kernel_fpu_end()
> > > > >>>> + * sections. This prevents vCPU preemption during instruction generation,
> > > > >>>> + * ensuring complete GPU commands are written to the batch buffer.
> > > > >>>> + */
> > > > >>>> +
> > > > >>>> +static void memcpy_vmovdqu(struct xe_device *xe, void *dst, const void *src, u32 size)
> > > > >>>> +{
> > > > >>>> +	xe_assert(xe, !IS_DGFX(xe));
> > > > >>>> +#ifdef CONFIG_X86
> > > > >>>> +	kernel_fpu_begin();
> > > > >>>> +	if (size == SZ_128) {
> > > > >>>> +		asm("vmovdqu (%0), %%xmm0\n"
> > > > >>>> +		    "vmovups %%xmm0,   (%1)\n"
> > > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > > >>>> +	} else if (size == SZ_256) {
> > > > >>>> +		asm("vmovdqu (%0), %%ymm0\n"
> > > > >>>> +		    "vmovups %%ymm0,   (%1)\n"
> > > > >>>> +		    :: "r" (src), "r" (dst) : "memory");
> > > > >>>> +	}
> > > > >>>> +	kernel_fpu_end();
> > > > >>>> +#endif
> > > > >>>> +}
> > > > >>>> +
> > > > >>>> +static void emit_atomic(struct xe_gt *gt, void *dst, const void *src, u32 size)
> > > > >>>> +{
> > > > >>>> +	u32 instr_size = size * BITS_PER_BYTE;
> > > > >>>> +
> > > > >>>> +	xe_gt_assert(gt, instr_size == SZ_128 || instr_size == SZ_256);
> > > > >>>> +
> > > > >>>> +	if (IS_VF_CCS_READY(gt_to_xe(gt))) {
> > > > >>>> +		xe_gt_assert(gt, static_cpu_has(X86_FEATURE_AVX));
> > > > >>>> +		memcpy_vmovdqu(gt_to_xe(gt), dst, src, instr_size);
> > > > >>>> +	} else {
> > > > >>>> +		memcpy(dst, src, size);
> > > > >>>> +	}
> > > > >>>> +}
> > > > >>>> +
> > > > >>>> +#define EMIT_COPY_CCS_DW 8
> > > > >>>>    static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >>>>    			  u64 dst_ofs, bool dst_is_indirect,
> > > > >>>>    			  u64 src_ofs, bool src_is_indirect,
> > > > >>>>    			  u32 size)
> > > > >>>>    {
> > > > >>>> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
> > > > >>>>    	struct xe_device *xe = gt_to_xe(gt);
> > > > >>>>    	u32 *cs = bb->cs + bb->len;
> > > > >>>>    	u32 num_ccs_blks;
> > > > >>>>    	u32 num_pages;
> > > > >>>>    	u32 ccs_copy_size;
> > > > >>>>    	u32 mocs;
> > > > >>>> +	u32 i = 0;
> > > > >>>>    
> > > > >>>>    	if (GRAPHICS_VERx100(xe) >= 2000) {
> > > > >>>>    		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > > > >>>> @@ -686,15 +739,23 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
> > > > >>>>    		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
> > > > >>>>    	}
> > > > >>>>    
> > > > >>>> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> > > > >>>> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > >>>> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > >>>> -		ccs_copy_size;
> > > > >>>> -	*cs++ = lower_32_bits(src_ofs);
> > > > >>>> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> > > > >>>> -	*cs++ = lower_32_bits(dst_ofs);
> > > > >>>> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> > > > >>>> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> > > > >>>> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> > > > >>>> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> > > > >>>> +		  ccs_copy_size;
> > > > >>>> +	dw[i++] = lower_32_bits(src_ofs);
> > > > >>>> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> > > > >>>> +	dw[i++] = lower_32_bits(dst_ofs);
> > > > >>>> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> > > > >>>>    
> > > > >>>> +	/*
> > > > >>>> +	 * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> > > > >>>> +	 * save/restore while this sequence is being issued, partial writes may trigger
> > > > >>>> +	 * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> > > > >>>> +	 * write the sequence atomically.
> > > > >>>> +	 */
> > > > >>>> +	emit_atomic(gt, cs, dw, sizeof(dw));
> > > > >>>> +	cs += EMIT_COPY_CCS_DW;
> > > > >>>>    	bb->len = cs - bb->cs;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> @@ -1006,18 +1067,27 @@ static u64 migrate_vm_ppgtt_addr_tlb_inval(void)
> > > > >>>>    	return (NUM_KERNEL_PDE - 2) * XE_PAGE_SIZE;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>> -static int emit_flush_invalidate(u32 *dw, int i, u32 flags)
> > > > >>>> +/*
> > > > >>>> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> > > > >>>> + * save/restore while this sequence is being issued, partial writes may
> > > > >>>> + * trigger page faults when saving iGPU CCS metadata. Use
> > > > >>>> + * emit_atomic() to write the sequence atomically.
> > > > >>>> + */
> > > > >>>> +#define EMIT_FLUSH_INVALIDATE_DW 4
> > > > >>>> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *cs, int i, u32 flags)
> > > > >>>>    {
> > > > >>>>    	u64 addr = migrate_vm_ppgtt_addr_tlb_inval();
> > > > >>>> +	u32 dw[EMIT_FLUSH_INVALIDATE_DW] = {MI_NOOP}, j = 0;
> > > > >>>> +
> > > > >>>> +	dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > >>>> +		      MI_FLUSH_IMM_DW | flags;
> > > > >>>> +	dw[j++] = lower_32_bits(addr);
> > > > >>>> +	dw[j++] = upper_32_bits(addr);
> > > > >>>> +	dw[j++] = MI_NOOP;
> > > > >>>>    
> > > > >>>> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> > > > >>>> -		  MI_FLUSH_IMM_DW | flags;
> > > > >>>> -	dw[i++] = lower_32_bits(addr);
> > > > >>>> -	dw[i++] = upper_32_bits(addr);
> > > > >>>> -	dw[i++] = MI_NOOP;
> > > > >>>> -	dw[i++] = MI_NOOP;
> > > > >>>> +	emit_atomic(q->gt, &cs[i], dw, sizeof(dw));
> > > > >>>>    
> > > > >>>> -	return i;
> > > > >>>> +	return i + j;
> > > > >>>>    }
> > > > >>>>    
> > > > >>>>    /**
> > > > >>>> @@ -1062,7 +1132,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    	/* Calculate Batch buffer size */
> > > > >>>>    	batch_size = 0;
> > > > >>>>    	while (size) {
> > > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >>>>    		u64 ccs_ofs, ccs_size;
> > > > >>>>    		u32 ccs_pt;
> > > > >>>>    
> > > > >>>> @@ -1103,7 +1173,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    	 * sizes here again before copy command is emitted.
> > > > >>>>    	 */
> > > > >>>>    	while (size) {
> > > > >>>> -		batch_size += 10; /* Flush + ggtt addr + 2 NOP */
> > > > >>>> +		batch_size += EMIT_FLUSH_INVALIDATE_DW * 2; /* Flush + ggtt addr + 1 NOP */
> > > > >>>>    		u32 flush_flags = 0;
> > > > >>>>    		u64 ccs_ofs, ccs_size;
> > > > >>>>    		u32 ccs_pt;
> > > > >>>> @@ -1126,11 +1196,11 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
> > > > >>>>    
> > > > >>>>    		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> > > > >>>>    
> > > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >>>>    		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> > > > >>>>    						  src_L0_ofs, dst_is_pltt,
> > > > >>>>    						  src_L0, ccs_ofs, true);
> > > > >>>> -		bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> > > > >>>> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
> > > > >>>>    
> > > > >>>>    		size -= src_L0;
> > > > >>>>    	}
> > > > >>>> -- 
> > > > >>>> 2.51.0
> > > > >>>
> > > > > 
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
