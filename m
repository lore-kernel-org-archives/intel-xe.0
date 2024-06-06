Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D98C27C54
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 11:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCA110E902;
	Thu,  6 Jun 2024 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PX+4mwda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3110E902
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717673852; x=1749209852;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VXYP2GKJZKOzHdq96wo25DQ6+K5tD45MQnzN1VMz0II=;
 b=PX+4mwdaxr6f8b/yEsh2PztR3zkdxojcwLNdTfClqbFxOP0JBF9kSpQP
 oOVbqtKYByRvcPTPLuUpog0TpO6gGTo2BqHb03KmOtPjnuhEY/R6mWP97
 6L/SOo0BfDQ/tnumwia4dYeg9Fu9086sSUFnDuQUiBg5Wzoe+YkLeAvgB
 gT6NVxCQlUKRMv8ypaQZWd1x4LePFBwnIcYiKCFcwa14WypcM/6TViv+z
 VW1Eg38Ey6UggSDyRJsKmjsxAYYnKVURfm5dPoMcdO+dr6LGCiJprbOZm
 iEUsQbUFmzFEnUtmXhEl515ogGjJC4x5StVSfawGrjqEJyaHpnia3oUh0 Q==;
X-CSE-ConnectionGUID: jgFDggdPS2ic3tuHI/Kb5Q==
X-CSE-MsgGUID: MRlbrBsLSdiGV1gvuw0dLA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17268114"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17268114"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:37:32 -0700
X-CSE-ConnectionGUID: lXSPBSZhRh2VNA808mg6TA==
X-CSE-MsgGUID: gkMt/8MYTBKhvHU8721Aqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61127996"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 04:37:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:37:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:37:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 04:37:30 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 04:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUSrw2jGGWTHN4jZqDZXN5ZpmQ/E+5V52BuGSrvdxH7jcoM0M2a1h+FeVTvi7xaZOjYerCPR1EKgAsxoyZtpQuzyGcvnnA7tQsWNtq4umJHFLYmh6QUV3mApFqhH10Urxlo0VfZbKdMbfsgzQmSpw1pDs5op6XN1XeT/2/Rnam8ly3qLXvdA0XGl9qa/9OoXGqp9SPkwzhmr+X+63rTkfEhzJL3cXvQl6oW/BlLX1PtY2X0hoiFZwqSRoRB7r11XNjOZCMtQAMENZ4U/j1QwFwNDHoLzO0e3u047Vm2ADXSQ2YNob/vhC+XC6EKxa4jFy1mdq4IVxm2qTOAWTkGl4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OP8htHfF47dbPiuUFcgdIbUv3TueVrLWPUYmATX0gU=;
 b=WOowrj79LGR3GUKPIedzB+C2FQ1IRRi3wsswMmJ6vfgjwoShLn+chUYFlGccmxc8eywwtrJdKoagmuLRpzO10msLrJbwvdDudGNmsWyU8zth2OC5du7V0wLIXwLtgBRvxBYq/+m+q/HLvO0WwBIKv5g//FJtnkt2KykwnLgp6aWHsZZoGUsH/e6a5Yb7xJlp61Oyv+HuvqchZF7ZpcjxqeXvc5JpA70dtHWwBOCAMF8zfaCzU3Y4Z98GFPCqPEZXVblyQn3veLHks6zYfGr0a1hLnz7ts+fFGVx6R6uNyLDj2Wf7uZxzrHcmvC+DVOv/0yBuWU/TW2xCEfDB9xerAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.26; Thu, 6 Jun
 2024 11:37:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 11:37:26 +0000
Date: Thu, 6 Jun 2024 13:37:23 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe/vf: Custom uC initialization
Message-ID: <20240606113723.veuy3a26aeg7an56@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
 <20240604212231.1416-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604212231.1416-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1PR08CA0219.eurprd08.prod.outlook.com
 (2603:10a6:802:15::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB8070:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c72752-2bea-45cf-40b8-08dc861d0a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0VGL3B3L2hIL3JKbTkxeUczRDJmcU9YK2x2SS9MZWt2TjY0ZVZ3NjI3QW9T?=
 =?utf-8?B?czhnWEF5TFpCdmt2dUQwcFZYNC9ZakZXcUo3dStWekJLTXhlTUlyeTRlTzBm?=
 =?utf-8?B?MUZ1M0lRTXBDcEwxdk9yYytQWVdJV0xCWkx3dUdQOVU1VGxNK0RVVTNVUEtj?=
 =?utf-8?B?UVM2WlpIZCtpRC9VeTdEay9EVFJMR2QxUlVoRnorY0F1SXpSdmlkRlJoSnF0?=
 =?utf-8?B?eHc1d2lLSnoyVWdvWGRadG9TZWp5YWJrREdSV1hCcWE1NHpkVVRyQ2dHczYv?=
 =?utf-8?B?Vm1yVnh4N2xXSExUNm1qWklRVHE5UGRRcFJ5ZWJOMi93K0ZKVHE0bGFYOWZH?=
 =?utf-8?B?bkErOVBMZmtUV1lWT01aL1lLTTZjOVE3Q3k4WGQ1U08rTUk1ZzJBdTFTdDhG?=
 =?utf-8?B?M0t1dG5XQ0xpRUlZN1BWU1NIT3ZMOUI5SzZocHMySVhsbjJjNnhQVVFpWUUy?=
 =?utf-8?B?RWFqTU01aW5aZjQ0bitYL3RvS1k0Nk9sUVFaaHRvdGJaWmZRWFNMMmt0UTZ0?=
 =?utf-8?B?Rk14andMMUxNQ1B0blRsd21peVoxZWlNNGV0RitXNUFrQzNVZWhIL2pmUVVE?=
 =?utf-8?B?OUsxTmpsS0FMcWlSclE2VDEyTWxvR01mb2RCeWsxV05qT29zRmgxT0N5eDNl?=
 =?utf-8?B?Y01ZV0NrUEFET0NZNm9OSzZoeG4yTXpHOUhtUVdkb29MUVJWK1RSRTFUaVJa?=
 =?utf-8?B?b0VzVXhGeGhFNVZpVXdaU1JZK0R1ejBmdzM0TVh6eUtjcS9xazFSUjJUYzA1?=
 =?utf-8?B?ZVIwMnhkbExLbm85NDQycUdkYUZmbkZYci8ybGdvL1MydFpJMnlWcGtXYVcv?=
 =?utf-8?B?UlVHU1h4MEdUenNqWWllME0yU29IdDFJbDV3RkdDY0VYUGsrOU9WcGtnYnls?=
 =?utf-8?B?dmtHMFRiMnJHVC9xQTlmaWtTV2p0RmY4eWtSZEl2aWlKOCtsZVRtVURsUExU?=
 =?utf-8?B?MEJRb0lWZ01uK3VtYnU4NlhCbEdNS0ZrekE1eTd2RHdKeGdnR2tBTVlWNENU?=
 =?utf-8?B?NGxCekJvaWEzTGdubTRLVFIwLzV0VEw2OHRObVBKcitqUk1EUmMyZEJaelZk?=
 =?utf-8?B?MHhaL2FFY0l1WGtTSGlCSXA2SThPRDIvRVNxZ3pmbCt3V3dFdGRIS3hiRk5q?=
 =?utf-8?B?Z3pZc01zTmk4dG96bGxaRVdsak5XcmtUOGo5OHZkNWxRZDZ2SmJZNFZsbU1V?=
 =?utf-8?B?TUQyM2Y2eFdUaDRjZTFxN3BJZnVVTno2aGRZdWJnR1lMMFZTTEdFUjNjcEdM?=
 =?utf-8?B?N2RUMkhzbjZXQ1RYMkdIVVEvWFRBYng2SDd4VDFpYzU4OFpOeG1SWkhraUNY?=
 =?utf-8?B?Y2tTckw3czU3cUxHZzZHVlllaUFSWm5GcU9GeVlqWGdxWEJMSDlOQ0FPdE5U?=
 =?utf-8?B?N2ZZeGZMbTA5bVJTc1NlTnFlVU8vd2kzYllNc0xxdmVmL0sxZ2VVREpCOXdi?=
 =?utf-8?B?b3ozUnJNS3A1eTNPeTdTLzR4WUVoZGhwd3Q5bG1CcWd5VCs5dG03U3ZHSDZU?=
 =?utf-8?B?UjRpUUpVTkNxSjFsM0lnRWxOcE5OS0dPYWZ0Tm1SNm1IcERSYi96RUxMK2lZ?=
 =?utf-8?B?Z25pWG9sZlBxamJwVDFRRlNoNFMyRDFwSUNlYlFrcVhRbjh6VllyS1F2Z1pF?=
 =?utf-8?B?ZzZzN08vYU85d1pmc2Y1eG4xZ2FQV3ZKMTdFMUJmTDQvUmFNSkpGSkp4WUpE?=
 =?utf-8?B?ZlFlSWZSNEFpZTNQZHRxUllzSUJQYjYyTUhIOVl2a2U4b040MkhMWW16cjZ5?=
 =?utf-8?Q?0lTWV9q5C1nGffzbjcp1Fo4QSHZqn3xiDDVKT6T?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3pDVkVKVGZiMmx6V0pWRXQzS0thN0N1U3c2eVNWcGY4citudXJkblV2cDZi?=
 =?utf-8?B?YUd4dnk0czFOdFErTldnY1JBT1JOSDI0NW9tc0VFaFpCbTZmRHNDMndUUmc5?=
 =?utf-8?B?bjQ1YkNmMjRBQzFyNWFyb3hnMDBXekIrMUIxVHM5TmREZnJ6c3RoUlF3eGhW?=
 =?utf-8?B?VkRMUkZKS2svOHJrMnlucGlXOHhnVXpxUnYyRGVzelBTUEVrS3p1TlNMQ2VV?=
 =?utf-8?B?SFhXNFRRZEgranVsVldMV3Izc1JLZ1VOc1k3ZlYyWFFwcmRZN20vR2pvckcy?=
 =?utf-8?B?eFBvWEFxRDFPeWF6OHBOcVFmTkhYZVd3czNRYzBBQ1V5cS81OThWUWJPek1x?=
 =?utf-8?B?N3dPSVcvOU1tRmtHTXYya2E0MTVZRGlieUZ4b0J0ZkIzWUROclRSdUxJQTMr?=
 =?utf-8?B?SmF4R2dhakhGZWFndHZlLzFyZUZTNmRSb3lpYUIrbzFLZGVYMm5kOVRHVTl0?=
 =?utf-8?B?STlWaFZPZU55ejFvWFBzUkNBOVJpSVU2YWdrNTRVdlp5NlR6d29PTGhiYUIz?=
 =?utf-8?B?RndZZmE2TXk1cXorUWUyZWZGSVR1amtEaUdVT2xTS3l5ekRqY3Q2YVAwVGlX?=
 =?utf-8?B?OGphZDRKQkNkRFlWRHlmQnJCVUZrK2RzTVBWaHN1WjNaZHMwd3JNMG5MWldi?=
 =?utf-8?B?L1phZlBiSC9TMnVpM1NuZ0ZqQ09SdTBrcWNCcHRMZmVJMU8vWkV1RmVsMURS?=
 =?utf-8?B?Y3dBSjl3cWphdk9KZkdaQmdQTEpVVG00VVg1bHJLUStLZzdBYnJrWkk3eU9s?=
 =?utf-8?B?cDBIb3JTMVk5SkFiVDBKNmluMlkvYnZianFZOEdXOC9ONU9HbWZmbldzOEhu?=
 =?utf-8?B?OGxWdHhiT0dTYmdSaWNUV0VNc0lmakVvcEpOdmgzYVcxdlNlWjE2blRmb3ZR?=
 =?utf-8?B?dUZBZ0hKaHY4YjRtc3dxbFRLa0NreTRLTCs5RUM2eTREb2FvaENHMzJxRisr?=
 =?utf-8?B?SHFLQ2pvelNFdGttcHhYbmUwMzhlbCtuZUdCV0ZYNHdNK3FzUW16Q1VIei96?=
 =?utf-8?B?ektqd1BrRk1XL2pCVmFNMGVMV3NDREI1S3ZjUlpySDFKVmhKeFkxcEc0dU4v?=
 =?utf-8?B?eEhTeENCY2pZL3drRnUyclBVd3lFb1UzYnhUU1kycjMrNkM0cjduejZhV2tY?=
 =?utf-8?B?RDBqOTBsNFZaU3VZZFFycVJqNUxtdjF2NUpJZGJwazh6T1NPbk9STnZKczV5?=
 =?utf-8?B?V04zSWFFVlFwUllEMjd0Y0M4YWs1UGhHbXdHVlBzd2Q5VW5oRmthY3QwbStL?=
 =?utf-8?B?QXJ5NTZuRTVncERvVTBEc2E3ejQ0aENySVBvNUs5bVRWV3FWaXJzazdOYmhw?=
 =?utf-8?B?QlJCdWIzS1RaYVUrd29rdjN5eHNEMGR2K1hHSFg4ejlNS2pJaHNHS2Uxa1Yy?=
 =?utf-8?B?enMwaWxtYVAxT1FzSnM2S0FZT2JJNGljT2NOQkp3Q0NXQVI5dm9LQWk1dzRB?=
 =?utf-8?B?blBzV3RYSTd2RHFXU2hXTjVjZlNKL2p2dGlYajdjdDliWUNTclF6MVpJendI?=
 =?utf-8?B?RElBd1I1SkQ0Q2E2QVBraDVJdW90ZVlkbFUxY3NMd2ZZRmdFM0p0M1FXa2Nr?=
 =?utf-8?B?dnhKTE9BdVBHU3JTVDJqTCtSNTMyODFQV201ZXMwTUs5Um5UaCtlUjdoVnRk?=
 =?utf-8?B?UjczZk1SaXhXaFArcGM3VEN5UHM5TTIwNVA1TFl3QjBDQkdpdTVuU3hWdC9q?=
 =?utf-8?B?dmFRTFZsK2hEUVAvSzhFc2RDa2M2ZmJhaGhTWXdCb3dPeGdMekh3VTlUeTV4?=
 =?utf-8?B?ejVmWmpuU3FvRjErWldKeU81Z3FCUEJKSzZZT3czcFdrcWdFcmVYY0tWUWlX?=
 =?utf-8?B?RXJPa1lVRFJrcmRDV0c1dXRUSDNQUGdMUFdCM2UvYit5KzBRaUpvOTF6N2ZL?=
 =?utf-8?B?RVZJeUhkTitZdi85VGE2VzAreE9LVzFxUnhGYUFLYWVnbERUYWxVeEtQa0lL?=
 =?utf-8?B?Uk8xUGpsUTRpWHJ1MFhjY0dodkVZaXRDRW9zUFJjaTVod3FOTllMYit0MCtP?=
 =?utf-8?B?MGdGTXJxREt1WFFvcHhOU3pLS1QxN2R2OVd1OFQxek1OOUhjKzdIVHJ5R1Zh?=
 =?utf-8?B?Ujlid1BhSkwzUVJ3aS9GaE9xNmFCNkYxUzZhMG9wbkQrQXNhMHZmcG5TNWpL?=
 =?utf-8?B?dlJJOXpJRHhpRjZBSi9UYkFyQzhnNUxwZWpmZzdVa1dLb2NMOUdOR1M2U3pY?=
 =?utf-8?B?WGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c72752-2bea-45cf-40b8-08dc861d0a29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 11:37:26.3280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0K/XqmPTUSFBLRMnIVGPjbj0zr0uhVnaA1myJKpOzGaklcEJQz/TpksAoh3pSRCwfdsUXqFenTJT48z3+2SxjwR//E5RFYL21ZpTO7stKEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-cze-04 23:22:29 +0200]:
> VF drivers can't modify WOPCM registers nor upload firmwares to
> GuC, HuC or GSC.  Modify xe_uc initialization functions to skip
> those steps if running in the VF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 85808706d1c8..0f240534fb72 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -11,9 +11,11 @@
>  #include "xe_gsc_proxy.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_pc.h"
>  #include "xe_huc.h"
> +#include "xe_sriov.h"
>  #include "xe_uc_fw.h"
>  #include "xe_wopcm.h"
>  
> @@ -53,6 +55,9 @@ int xe_uc_init(struct xe_uc *uc)
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> +	if (IS_SRIOV_VF(uc_to_xe(uc)))
> +		return 0;
> +
>  	ret = xe_wopcm_init(&uc->wopcm);
>  	if (ret)
>  		goto err;
> @@ -141,6 +146,31 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>  	return 0;
>  }
>  
> +static int vf_uc_init_hw(struct xe_uc *uc)
> +{
> +	int err;
> +
> +	err = xe_uc_sanitize_reset(uc);
> +	if (err)
> +		return err;
> +
> +	err = xe_guc_enable_communication(&uc->guc);
> +	if (err)
> +		return err;
> +
> +	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
> +	if (err)
> +		return err;
> +
> +	uc->guc.submission_state.enabled = true;
> +
> +	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  /*
>   * Should be called during driver load, after every GT reset, and after every
>   * suspend to reload / auth the firmwares.
> @@ -153,6 +183,9 @@ int xe_uc_init_hw(struct xe_uc *uc)
>  	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>  		return 0;
>  
> +	if (IS_SRIOV_VF(uc_to_xe(uc)))
> +		return vf_uc_init_hw(uc);
> +
>  	ret = xe_huc_upload(&uc->huc);
>  	if (ret)
>  		return ret;

I would expand the commit description a bit, because you mention what we should
not do on VF, but here we also add a new vf_uc_init_hw function.

If you expand the description then LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.43.0
> 

-- 
