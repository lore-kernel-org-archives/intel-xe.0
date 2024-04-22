Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4D9C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 12:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA323112A4C;
	Mon, 22 Apr 2024 12:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="io64s5I0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBACA112A50
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713788069; x=1745324069;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nER9pc0yKV2scq2RMRHQ6kUcmpIDU1JToOk+icUXzR8=;
 b=io64s5I04iP6xETBA84iRS34BEbjqOQgQfAqbDWE1kTHiQRrCqTLrlqB
 TowXP1se5V3AFkpDN2YPnWhNDUs6l3WuAIasxiTFTvodSqAHdgmxVQcTO
 JalrGYRqUbHno4FA1/DpGlw+CdqhC1wv++75vVeFv8eAWbI+nE7r3S1OT
 HcN6uSQlgdrs454BIINBsHl9r9UZpxpkPevRbOeAhfROC6eiCMMzINwiL
 Xb7LLDeS4NfPzoSNejE05G4JCBpgBQAF/u134zfdpnXa3Z4jNi2YtN/kI
 7PBGoupB2P1PW53ovIoF5bI9NJksWAN771Vv6lVvLczz3TryNPbE6GWW5 g==;
X-CSE-ConnectionGUID: 9bivMoiRR8SQEZbM5Tp0Hw==
X-CSE-MsgGUID: cLbgc7sdS0y/bmGLL2MKCQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9435226"
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; 
   d="scan'208";a="9435226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 05:14:29 -0700
X-CSE-ConnectionGUID: kwSFUCZ7Q5S66WYebcemtg==
X-CSE-MsgGUID: 6zbxstHXQj2GdMLuTyLi3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,220,1708416000"; d="scan'208";a="24604774"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 05:14:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:14:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 05:14:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 05:14:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 05:14:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elYdaAI1+lQddoyaQxZQ8aM4JS5Hhtpcmgj+/TuqkJZSuztLYNLJCwy0mWpXK1RHpfnbehsf6BvU6c3rWlYpCzuMfxjj7QT8yvrjEMm0dVZ2FoTV2QHin0aQOBcDebQONTBA+cwNi6DrKs6Hxj+QAUq10m1PVEvrRyKXJLythkSMp3n03h9Hm4z+0O5PB5GZOv/WvfHYwnIoujXflkGPBPL5hgAAjF9ahC3TTgrmpDKpPgrOTEBzZRwr8937OJ6DHs3aEjfrTnKeVJftdNUIlHdBARnIoVFPiNLz+tsFX/LSxAbe4l8GXZX2XPnhhGu56JDnpls8SUZu7WRPeeZ4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JJZxNDzN2cCia1MJLQ4KKhvIjK4H1DQfZttO3a6xCU=;
 b=ltF8KBsIimwENycKygN3xQU4AOTbyn+w49ZMQkaiZnxWDkvjchwpWC8BSG5JX9759VnX2ahfGP2O1J8muSgi3dkfr4YCANmYqPECDU3iX7RsTKIjwVQwoYrO712UYBbeFRbVEZPhT0GTIVajtOOhjXjmeNFEE5qXk9AaDIw64eFXagiDEJsTA+7ZEBpD4Tu6xzrWShk3KPfuVQK+thHxGgJoZKY+ldKR6D0bL1mDg+QIDaCJUXgAshVAcICeddXu7tyLFj7+S7r1hyOqcT1DGTeJj/fYomYorTe2NoAF8pAffsRSpyJcwLAtQdyV5GsSb9u0A/12Ng+KEv/zM2F5wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 12:14:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::b867:cbf6:e190:6eb%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 12:14:26 +0000
Date: Mon, 22 Apr 2024 14:14:23 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/guc: Update VF configuration KLVs definitions
Message-ID: <20240422121423.cq325sg5c4u6mwj7@intel.com>
References: <20240419123543.270-1-michal.wajdeczko@intel.com>
 <20240419123543.270-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419123543.270-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI0P293CA0010.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a66e4d-5c64-4298-7171-08dc62c5c0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDR5aEEvZDB0T3YwWlE0ZlNMRDVabmZvUjJjU282SE52NThRM2FPY01QRkR2?=
 =?utf-8?B?TzBNUWt3eXk0QVJBSTV6azFKM2hFajkvSVFYa2ZMK3p5eXVNd0cydXZETnRT?=
 =?utf-8?B?SmlUVlJjWklKM0Z0dTY2cytjWWVmSTFyUmVuNVFwWWkzZFJQb2tFRGVyalJG?=
 =?utf-8?B?R2NMbGVlbmRtKzl1eW9sVmJmMFA3amw4L1JmRHRYMzVhd3ZGVGdPa3lRS2Fv?=
 =?utf-8?B?cm1YZThON2VoOHVOOFM0WWJiMzJ2RXVjMS9UTXJxclBKa3BjQ2NNdjU3a2JH?=
 =?utf-8?B?Yzg5Z2dZT2pQY2NtY1crQ21CbThZd1l4eXJBTHJzRm9PdHVxVXNweUlxVDFH?=
 =?utf-8?B?U3EwU3drSDcybUQ0azRHVGNWV1R4S0FUMzI2a2hOUDFwaUduQkZQZHdETHp2?=
 =?utf-8?B?THptZUsyeExPWXNhYUdFZTdubUNPeDRlaHJid21FdnNnSy9TYXVEQ3JQN0ZK?=
 =?utf-8?B?a3M5NmpybiszMlllV3pxR1NWQlR1UGs1dFBaNmNNNVpSY24ra2U1OFhnRHdL?=
 =?utf-8?B?MDU0dXFrZGdFb25RZTlLSTdDWE5vTnhsZklBK3B3enU5UjJ4WjJtTVZsZW9v?=
 =?utf-8?B?NlhQdEVhbGFmS0IxVm1RSjh0LzVVc2FFeTBYbUhYWXM3cmw3aklxY0dGOVA4?=
 =?utf-8?B?bkhmSUhUSHV5M1ltMmttRUk1dThOc2FTQTVvZVR5Wk5wLytyNGF0NjNIM1hz?=
 =?utf-8?B?L2F0bWc3ZzlsdU54VmRpV3d3T0NnNGVJUFNTSEdhRGNQc1JQSUFERzB0d3d5?=
 =?utf-8?B?aG5UN0FqNzNGNmY1WWVhMGlYdzZNbUx4bUZzRmZoa243VjZBTVR1bmlnYUFz?=
 =?utf-8?B?WC9pcFRiNHlmSlR0YnNLaFZUcSsrNVRQYmRmZ0E0bDU2QjlNNlFpcE9kZ0FV?=
 =?utf-8?B?ZlJLbTl5QWVnMlJzRDRMS0dIQjRJUUtQdXUySGFLY3pCVm9UWm1EWTBRM0pq?=
 =?utf-8?B?NHpyMnVHVkFkbzRCQllxNXZsckFWQ2ExVmRMakswYWdiMW9pRlFrdXpvL2o2?=
 =?utf-8?B?cFVqak1mc0pDdGFUVmdFT0NMNEl3bER0OSs5SEJnZFRCK2R3d0l6RWx2Mjh6?=
 =?utf-8?B?RGcrM3ZXUi8ybHZ2dk8zdWJVa25EbTNrdldLQm01QXJoQ0tlVUh6MHdCbWNH?=
 =?utf-8?B?Mmx5MTNybTlrZGM1LzBNdWp1ZitSRXk5NUYxQ3BYMzhWM3RYWHlvMzZWaEdH?=
 =?utf-8?B?VUxQaVluMTlYSU00ZS9BY0NuRWJhMG9SYTJCOUVIMlF4bTlHUGoyZ2h5NlpG?=
 =?utf-8?B?a05iYXBMU0NVQ3h3cVhMZ2NobDRqdjIxTm9VcWpGeFdsSXVrQVZUWWlNbWhF?=
 =?utf-8?B?MTVXM1FSNUY3Tks2cEwzcS96aVNWRnM0VVpMNmFjZCtlQWxSU24vYnR5RWRH?=
 =?utf-8?B?Szc5cU5EWVhEMDJyS3h6OFBjbkZxOEt0TnhoZ0hvd09NdVR4bkwvUXh6Sk1U?=
 =?utf-8?B?WTNUTWMrUDFjSWI3cko1WmZoMlIwd2dTRE00M2xPWGdqVWIwSnVWWHdjMVA0?=
 =?utf-8?B?aThOQzVWSldSZ3hXWnp1bU5iS3JVNkZLTC9HdExueWwxM0p1MW5iOUg2dVdk?=
 =?utf-8?B?TmpjNEt4VmVCWHR5VDVxU1cyRkVSc3dHeE5TNUFlYWFBWmpFQnpZWTd0cEZP?=
 =?utf-8?B?OVU4Q0tRRElwa1RVdUUvRWVGNERSZkcwY0Vxb25sNkd2NEVvb3puRVlPdi9P?=
 =?utf-8?B?M1BvUHJFZEFWenY4eG02K0lydFBDeUlzUVg0cUNKclRTSUpLbmVWV2NRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpXNW9CbjJpZlh0TlVYVENFWkNaMUtONW1GYURUcnY0SlpxdmN2WFhRc3Iz?=
 =?utf-8?B?RldZUi9iV1NUSTg5cXQyb3YvdVdES3Zabzh6MVB3SE1XQzNMbkh4THA1TnNP?=
 =?utf-8?B?U2N5V2I1QldjZ3BueFhpaVROYzFWSEV6bEhWM0hDc3RPenhoV2hoRmRIT0hN?=
 =?utf-8?B?VW1JOG9zYnlZQkNPMG5DVXNrL1IwZmVmdndwWi9iU3dRZDBWZjBZMEI3RHpC?=
 =?utf-8?B?cllvZzhyazRxMEZ1WkgvYUlESWRheEF3NXBJSng2VzJEZng0cTBlZnp4OE5N?=
 =?utf-8?B?Q3hULzdwOUNZV3NlZnpYWDFYTkZDQXhCMVYzcEkwMG50NnJXRDN4YWorajZr?=
 =?utf-8?B?c3BJdExLQzMwMXhNZnFoUkNZTDJHc2haMVdZeERqT21aMVI5aGFLd2hlSWk5?=
 =?utf-8?B?eDlGY2pEejExSmZvdUhleEdSc3M5K1FSYzFBNHlxcmNSelBCZm5EdHRBZ09k?=
 =?utf-8?B?RmxMY0o0dmViaHJXcmRXZ2hHcXhHMGtWd2VhODlZUTUwV3VQWUU3VnkrS05Q?=
 =?utf-8?B?S3VNQlZzenlNcXBwMDVqRmxCeXJDSy8rTlpCODNBU2VxTmR1eU0xN1dEVlA2?=
 =?utf-8?B?ajR3Y1NXZUpkZUgwNG8xaG1vVC9Wd2NUbmZMeHQwRkxiQ1k0QkRBd0VaWjdr?=
 =?utf-8?B?bXpzeHpoOE1yV1o3bmJjL3lpdElkblNLanRKVGJXY2NFRGx0b0JUQ1NjUDVz?=
 =?utf-8?B?OCsvVmxYbzFQbmJaNk1FM2huZzRXTGltck9SRFoxY3dYZER4S1dQcVJNUk5H?=
 =?utf-8?B?ekRzSW5Na0Q5RHNQYTBMVVVWaGx4OENTSjNXY2tDRE9hL1dRKzB5TmJ4WDBP?=
 =?utf-8?B?MDEwRHFGNVdNd2gzL2llTWJBcml0VXdBRGVYeHZSMDNGTlMvdEhaOTF1VTNp?=
 =?utf-8?B?ZzkyMytyTWE1VjFMWlNtSjJQYmE5bHJOOTZ5RVZnRTRhVUNCUWVXUnpKam1p?=
 =?utf-8?B?ZzBjS1pnMDk0c3ZDMmFUcEQraHl6aldsOENxSUVxZzFudTA5bHBGRHd5Z2ZU?=
 =?utf-8?B?V3A4blA0MDkraFlRdU9idHdHKy9FNXVqdG5XTmVJOUVtbmVORjBDZml6cUFy?=
 =?utf-8?B?cGJuMGgwbXFMTGI3TnFpT2xxdkduNGthK1AwU3VOV1cvc3hpeTRZTWJ1Tmx4?=
 =?utf-8?B?OXVZQlpaVy9XNmtjaW41cTI1bDZycnYrQXFqQVM1RXQzZlNHREJkejRrOVpH?=
 =?utf-8?B?MUtVZzAxQzJBSjdsRklwMmRmVGJBMnFKcWN2aTcyTGZIS1hPWnUzUlA3dXBn?=
 =?utf-8?B?NnlKdStjcUc0UkxGZSs4dWs0eVF6ZThHbDB5UURWY0tzdEg2aUJXRlFMM3Rs?=
 =?utf-8?B?MVRhUlQrU1pPU2huQXptbW1iTTFkVEpNa3l4Y2VyNGlMdHRtb2lBRkMzeEhk?=
 =?utf-8?B?TWlqcFo4dmJJeUhJTHpzZzRmbGVGRnBXRHEwOHFKQnR2NzZEUkVQSFF2bXF5?=
 =?utf-8?B?YlJXT2JrUVZxTElSSVh3cUpYc04yUDcwamh2SFRRNjhzVXZzSGlzaGdpSkdx?=
 =?utf-8?B?Z0o5UkpuaElzSkdnZDQwbjhlQmpGY0M1Y3hJaCtzbzZ3SUUzVGk0MEo3b2xE?=
 =?utf-8?B?QXp0TU9UTS9XVW5aRXl6cFZVNjZ4d2xIcWptcGtRRUI4OHQ4STBnYVdDdU5X?=
 =?utf-8?B?dmswcmdrNVRKL1JrcytDS1Z4bnJmUGdaeGhFZm9DUVpqa2ZPV0g5bnh3cUx6?=
 =?utf-8?B?ZXpORTVSeG1QYTI1ZlRpa0phSGFxSEtBU05TdWh3VGRtM1RFNTlGSFlMSVhQ?=
 =?utf-8?B?azJqRDA1NktNdCtEbU8rMERMZy83L0JjSkpERzhacUNqQVdxdzVCOHVsMjRE?=
 =?utf-8?B?L2tUQ0kvUDNKMG9HR0NGdTMxWm5BZ2tHaUJaOEU0OC90ZzMwS1NlT1BvL0cw?=
 =?utf-8?B?M2FKUjNIQVhmQUIrVTBsdHoxK0VaN3Y0aEpYN2J1Q0E0emtxSW1LVld4eGln?=
 =?utf-8?B?aytHY1BOU1JZdmxjWm9MZkxZVGtNNTdTR09oY3VoZ0s1amJDcjJRYnl2akNr?=
 =?utf-8?B?QkR6bUp4QkV1cWRFaVBTZGpucFYvOUhGSXdQdGZ5dHByeXkzTkJhZWpuYVJK?=
 =?utf-8?B?aWlpazVQYk1LUHN2Z05UU0lHN1R2UGF1VlBuU01zREx3WmpjK25vKzhSL2sr?=
 =?utf-8?B?dGRJcmFMRWkyaDV6MlJtS3Q5dldCYmRwbS9uRlF2SGx2ZURUeVVwV2Nvalll?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a66e4d-5c64-4298-7171-08dc62c5c0a0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 12:14:26.0935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dc087wztNK8YVWbAHMoe2Kc1OWtrw6AxxO3RhpnGcH/4Spsy4bYCwiS1YaH+G6NSs9sqzZyXzrrhl7zgPvmwitKh97B6UqrXGikm8QYqqiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-kwi-19 14:35:42 +0200]:
> GuC firmware specification says that maximum value for the execution
> quantum KLV is 100s and anything exceeding that will be clamped.
> The same limitation applies to the preemption timeout KLV.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 511cf974d585..e53ffaee2fcd 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -201,7 +201,11 @@ enum  {
>   *      it to take effect. Such cases might typically happen on a 1PF+1VF
>   *      Virtualization config enabled for heavier workloads like AI/ML.
>   *
> + *      The max value for this KLV is 100 seconds, anything exceeding that
> + *      will be clamped to the max.
> + *
>   *      :0: infinite exec quantum (default)
> + *      :100000: maximum exec quantum (100000ms == 100s)
>   *
>   * _`GUC_KLV_VF_CFG_PREEMPT_TIMEOUT` : 0x8A02
>   *      This config sets the VF-preemption-timeout in microseconds.
> @@ -219,7 +223,11 @@ enum  {
>   *      on a 1PF+1VF Virtualization config enabled for heavier workloads like
>   *      AI/ML.
>   *
> + *      The max value for this KLV is 100 seconds, anything exceeding that
> + *      will be clamped to the max.
> + *
>   *      :0: no preemption timeout (default)
> + *      :100000000: maximum preemption timeout (100000000us == 100s)
>   *
>   * _`GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR` : 0x8A03
>   *      This config sets threshold for CAT errors caused by the VF.
> @@ -291,9 +299,11 @@ enum  {
>  
>  #define GUC_KLV_VF_CFG_EXEC_QUANTUM_KEY		0x8a01
>  #define GUC_KLV_VF_CFG_EXEC_QUANTUM_LEN		1u
> +#define GUC_KLV_VF_CFG_EXEC_QUANTUM_MAX_VALUE	100000u
>  
> -#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY	0x8a02
> -#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN	1u
> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_KEY		0x8a02
> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_LEN		1u
> +#define GUC_KLV_VF_CFG_PREEMPT_TIMEOUT_MAX_VALUE	100000000u
>  
>  #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_KEY		0x8a03
>  #define GUC_KLV_VF_CFG_THRESHOLD_CAT_ERR_LEN		1u


Your code is ok:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

But since you are already updating the doc for these values, wouldn't you like to maybe correct
a typo in the doc ? If you don't correct it, it will probably stay there forever.... :

(...)
 * _`GUC_KLV_VF_CFG_EXEC_QUANTUM` : 0x8A01
(...)
 *      That said, when the PF is changing this value from 0xFFFFFFFF to
 *      something else, it might never take effect if the VF is running an
 *      inifinitely long compute or shader kernel. In such a scenario, the
 *      PF would need to trigger a VM PAUSE and then change the KLV to force
 *      it to take effect. Such cases might typically happen on a 1PF+1VF
 *      Virtualization config enabled for heavier workloads like AI/ML.

 Typo: inifinitely, should be infinitely

Tha same for GUC_KLV_VF_CFG_PREEMPT_TIMEOUT

Thanks,
Piotr
> -- 
> 2.43.0
> 

-- 
