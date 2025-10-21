Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0293CCD1AA
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 20:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C1410E641;
	Tue, 21 Oct 2025 20:36:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gZnXpDYM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D49C10E641
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761078989; x=1792614989;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0llB5Hyu0ZMu/3A7tiGYRME2i8mFqL102bGa7CIwElM=;
 b=gZnXpDYMmZclwQhnP/9lIFQrDRRyT1MLewcfQdnkv+LEOApIogDl5vVo
 NM6gYwe/J4u5kqq0mE4fODb1eeVUDuQXgijnoqkf01yV+3fjf+JNo5NL8
 MJiQmPCkl2JMdYPc3nvtvz69abVqGY/mjfiCXr6esvCC1tEbQS6iHlz93
 iTb/x9O+d0orsliXBjo2kKloDdQx4nmW06VATN4zdVttM24u1deKCPbA3
 AwtfXjrhpbEu8Ws2aIiw7caF+h1gOkZ2kQaPG60a/7kroLovyImo4PYMQ
 jzPM5Kv03Rtwlign5BqX++ISUYNr+AVPUaSeaCRPa2eWFw35vH8eZO06d w==;
X-CSE-ConnectionGUID: L2psFpldS1KXjFTR9odbOA==
X-CSE-MsgGUID: SB+WmIhNSayO+IYNa35Wiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62425265"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="62425265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 13:36:29 -0700
X-CSE-ConnectionGUID: QAXQV3atT56ghu5oU8efYg==
X-CSE-MsgGUID: YIPIquMeSs240MwCiwNnaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="183387450"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 13:36:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 13:36:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 13:36:28 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 13:36:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQgkYJ3E7/Jbe3MkKzcXloJ7SDXm7x5m81idZ/csq8SygjmiDoUGHaocddA8nzyMOhib6ILw0hbTf944251HPAuUaSabgCjJXpzgaOCHmRvnlWx+VtUQOL2PosyXb5qSkW+yvXgd8fBRwRdlBZDvBJUpPCZl2ri2mcY8lmQqREEhpjIYS+rqr9rnyqQ5JOiFAiG+qtBPLTTbPdGrGQMCzvrpkjbHRsJPnLClxz92JFdnhqJxU2kT/UrAiXnNEwtEe25GeXm0C54e/TFzo9gxDQkawJGjBQjjBdnt9siOcykku/V7/HLa9EQXg0Zef2suu5E3MawV3bUePubEXZGrqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WwnkAe24VHhcRbcV1DHmajvi5coOWmc5pKATd8ODyk=;
 b=IKEByCnffBnHZ1qIaXUa/U6T1wYwAYEVfwi8zHBYK1cyC24x0fjNPWlhzUbvPVPP3VWDZKKikluXfgF01IA9R4BkMxUn2V93qhJz9vR7if/gl7o5JhP52kRARdHkus3ECFfOZht33UKPLaLVsZBDuXiOa7ksd8qUyMxes8dUSf9JEzGFbxaLRD46F3V41PuTeuzFnKAM9TyzmjG3asXX/x8fzrcDW0r09MUXGKL5ViVj9Rc3wyU0i94vpnghWklGn+TPIcM0Z9DurXX+YGHDZRiE4e6vmDo/ssBsTjJUvJYA3Ahs1pFPTiriZ1clT6+Jg/biaHcNqa4/JtSfbpkO5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Tue, 21 Oct
 2025 20:36:25 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 20:36:25 +0000
Date: Tue, 21 Oct 2025 13:36:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Santa, 
 Carlos" <carlos.santa@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Avoid serializing unbind jobs on prior TLB
 invalidations
Message-ID: <aPfuxg77e8nwtoHI@lstrano-desk.jf.intel.com>
References: <20251017165217.493595-1-matthew.brost@intel.com>
 <20251017165217.493595-2-matthew.brost@intel.com>
 <8a2ee0e807fd17057df5c2253b19c623b0c23d3b.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a2ee0e807fd17057df5c2253b19c623b0c23d3b.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0295.namprd03.prod.outlook.com
 (2603:10b6:303:b5::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB6612:EE_
X-MS-Office365-Filtering-Correlation-Id: e9bab84d-5b88-4628-fd37-08de10e18137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1dSSlNZdENnM2ZGNkZiazRDTVlCSEM0bEo3QzYxQjAxUXZ3WDlKV05VQlZl?=
 =?utf-8?B?ZU9xRzFTR1pOa28vRXhqcE1TUERxL1Z1UWN6SDgzcS9BVnoyV1FvYnZSNTB6?=
 =?utf-8?B?OUNGdy9DUDZMaE9GcG9PUExDT3VkOENXZERLdGp6VTVMWllVZFN2SExONWk2?=
 =?utf-8?B?RDNmanNaTGxSUzc5WENSSEROQWVpUE9vZHBDTmVkVGMwaFQyR3IyQ2l5dnQ2?=
 =?utf-8?B?YS91bnZuL0o4SmwzSWxvbWpHMFpCbGZoNlNkdHZ3ZmxJNm91dmcrZFdRVnFW?=
 =?utf-8?B?NitOQVBaYURXQXJSek5Tb3RhLzdjcHNFdzkwbTZxWk50U3IzVUFRWnFDNmtW?=
 =?utf-8?B?UGNkeE5WNGJTMGdPRjk3MWpvcHhZbU1uZk9nU2FxVlJXeGNUVFllamQzNVpC?=
 =?utf-8?B?R1FyUzVjeXc3VVhRZEp1MlNnMG5QbDRKSTdnbUR5VlBkT2phZk9TbVlVRC9E?=
 =?utf-8?B?WDg5OTdPVlh2MVdyYUNuTi80VlRGdDhvVU5vWmQ0anVhQjFEQ0crcHpCTFpW?=
 =?utf-8?B?UFBMbHNBVTdLQ2MzWVJGUytxTTlJRFMwbUNZcFg4MEtoTjNwUHgzYnRQaU10?=
 =?utf-8?B?Z0V5RCsyVlBHQ1R2WjhMVThHcGZHN0w4MnBCZlZMWTFrd2RPTHNYcGNwU093?=
 =?utf-8?B?TmlKNkwyTU5YcXg4dGRTT25JSVdwVExWQk02SGJIMm5OY2lETWM5cVRtaVln?=
 =?utf-8?B?SUlwZFBpMVFUc3BESmFmbFlCZVlyZ3BGUnpKUmRNYk0xcks2QldUa0tqSTFM?=
 =?utf-8?B?ODVOTm8zSTNIcmxZdUpydFAzZHh2cGJSTnhVV3NxL1d4aUl4NWMwSU1XS0F3?=
 =?utf-8?B?RkpLZVNDKzREZ2tvZ0RCWDh1M1F2NVlTb2xqSnREYU90MnE1NFUzUENvVkpB?=
 =?utf-8?B?UkJvUFFGdGxGL1FlM2tRa2FSTmtaYWJmZTYyS044RFlERDBsdTZWMVFZZWtk?=
 =?utf-8?B?ejg1TWR1Wi9iVW8zYldJNlBOVjdxK3UzSmIxaEpVMlRMRURQbFRQZHh1SWdU?=
 =?utf-8?B?NG52L3VPbmd2QzNabkVYR0Q0MzM2Wk1mY2xZVWd0cUpkb0RKMHNpd2JzbHpl?=
 =?utf-8?B?UTJsdHNYMzM0Qm9KclB0WWVja2F0aHA4Lzdib1dTMC91akRIVDZQRXczL3dC?=
 =?utf-8?B?MmF6MjdSOU1adVFDQUxwcGhvT21vRUVOVWZJa3JrN2Exdy9IL0JnSXNRcExl?=
 =?utf-8?B?ckNCZWhGK0JEK01jVjFnSWR5L2dwWG1nVkx3R3RoQUZqejZmUXRBeXNqZitz?=
 =?utf-8?B?YXRNbmc3NVg0ZFJycWRVWE51bjRIWjZqUkRtdy9zUnE4a3g1LzlZSml5dXJs?=
 =?utf-8?B?dWVaT0ZvUFhOSENtSEg0bGhYdDdFSmN3am1DQ0dXeUNyTjBLQnNMZTNrV2tQ?=
 =?utf-8?B?L29QeEVqQzl1ZjVZOGN0bGoyTEY5YzNmZkk4UWMxNzdNM2tSOGpkSGNtN01I?=
 =?utf-8?B?bFllbEhvVUtONTN1RjAxQWh0c0djcjh0UUoyd0pqUTFxeE90Y3graHBDSUho?=
 =?utf-8?B?YUZHN3Vnb3doZ1lIdnc2dEJ4bFFCa0FPNUVRcVFzZXJNWVp6MnVuTklrTDVB?=
 =?utf-8?B?cjVRb2Y2M3FjSW5pRHVBRlIvL1BremFhbkN3b2RKWmE2QVVVdm5nak56RFVv?=
 =?utf-8?B?TU5SbWFCVVhNWEREcDhCL3pxUkpLUFJyUmRzeGpzbEl3RlNiTUpIcmViRVpO?=
 =?utf-8?B?L1Fid2s0b2RiRjN2UGc3Q0oyOTAzODUycjlpUUJabXVIYWVaNzdlV01RU20w?=
 =?utf-8?B?N0lFaXJCZ1RCcFhMWWZJYzF5UUdwWFF2dGZ1UFFhZDhPQmgvWEttQ0ZPWFRV?=
 =?utf-8?B?ekk5a1NVMXFnQlZ3WThYNk9TMnQrZUJ1NzJGdEFKVFY4eER0T0c0TW9maHYz?=
 =?utf-8?B?TWpKSTJqYmM1QlZlQ2R0Z3gvUmdVNWYrUlFtTE9yUVhsOVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGh3TXhSaTh6QS90eGd3SENHNHdMWi9QQU1SUTRGL2t0MXQ4UEg5TmlnbzVE?=
 =?utf-8?B?OTEyUzhuRmxhOHNLeVFoRVlGY1lQNVlGWVc0bSt4ejB0OTBmUXdESi82NXFr?=
 =?utf-8?B?VG8wdTFab2xWRHIyNnpSUEhQc1h6MXFXNUxuVWFpOFlHQnQ4b2l1UXFVVmhi?=
 =?utf-8?B?Zmd0bWNLMW1zdGYwZTJmRWhSR296WVdDUFFFVzhvdEdPbVdYNUdrbHpRUDlR?=
 =?utf-8?B?YmlIelVIYnhFWFU5STc3Qk9Qd1hVVXNGcUFBeVdDeFpuLzkwWFBHMnpMeGY2?=
 =?utf-8?B?WmZId2l2ZzY4Nk5QOGwzTVR0SHpEcW50ZCt3dTZNbFRRK2pSRjJlY1l3ZGFh?=
 =?utf-8?B?Yk0xZFhCL0Z6RUVYSFlzTE14d1p4b2t1THB2Yit3TnV4eUhLMW9iUTlqODlm?=
 =?utf-8?B?Qm54QW5rWFUwVE1YR25pRFBJczdMeVo1RWZWU29yS1F0aXdrZTVxb3dHcTVs?=
 =?utf-8?B?LzBkV2lCQlh3S25PdFUyVU1nc0h5d3hHam1YQlNhR1ZoRHkwTGdURGVETVFM?=
 =?utf-8?B?SHM2bU1TY2R1YWJZSUZjQURvS0N4ZjllalMvUVV2OHlvSlg2Z0g1T3dLTWdX?=
 =?utf-8?B?ZjVQbzBMd0oxeGlFTW5hZ2c1aTF4RVVTM3JjamMxdDZwaWgydWxNUmRlRHZY?=
 =?utf-8?B?UXFLcWZqdnBDOGdkUHkvcHpKdHRuVy9pdEpNTHZyRnNqcTltbkgxOU9TZ3FW?=
 =?utf-8?B?VWFEWVlzYjNyblVCVVJDREhKeHdYbFB6ejRaRlg0YWhzWkh3RFM4dXpua3U5?=
 =?utf-8?B?YVdFQktRZU1adG50TmZlTzZDV0Ewc2Zkd2llVGdZV3loblNidytUUG9JeCs5?=
 =?utf-8?B?cjFlWXhDajFTZC91dFZUQ0FvTGJPblpNSDFhb0E4TGUxdGlnVU9NWVhEcjhj?=
 =?utf-8?B?NU1SNERJejVFSUtwUWs0K3hzY0E4MWRIRGhXdUxNUGNYaVo2M0dOZnQ5azZM?=
 =?utf-8?B?OTJvKzAxMllSNDJRTXM1TktaWSswSVRQZU03bGZXUFlBOHhKZXBDMTF5WC9z?=
 =?utf-8?B?Z2ViRnJpSVd2WjNmZFM1S0NuamdLWjlyejVWR29pZGQ2UDVMQXMrWm0yYmZV?=
 =?utf-8?B?ZDhTb1cvTDB4eUdQUStIUkhMRXRJYSs5TERNZ09vWHlOTkFiY3FKZm5Wb2hQ?=
 =?utf-8?B?Tyt0QnZBaXc4NnZSbk1PK2lLblZGSHNUUUdtVjQzTGQ2MWxRditVYXhyZFFt?=
 =?utf-8?B?Q1ZHc0NtdzlQeVRZV2FTOHBLTGJsWGdJL000TExpK1JKRW50ZjNHMWNWMkN4?=
 =?utf-8?B?MkhGRW05QldRRVk4c0F4WmIwMTVBYmtkUkVaczF5Qk5hbnk2ZWNxcGlaeGlr?=
 =?utf-8?B?QXVBeWRvcTZCdjlMSW5Kb05IWTZsNzkwSHM1cDJGbDA5eEV4T0p5M2ZXcXdG?=
 =?utf-8?B?bHVac1JNc0VUZzhvbFM4eUUxWUo3N3RXN1dacGZremMzNCtzWHoxbmVoNmZD?=
 =?utf-8?B?cnZ5T3VweE8wQktzSUFvOTJnNG5RTG9oRkRKNTFCZGlTUjh0RTRJZURaOG5H?=
 =?utf-8?B?Vk4zZlAvZnRVUC9WVUtRaVQzemJ2UmRUZXdkQmJkYi9qVFdTaXgzMkRaQ3Yy?=
 =?utf-8?B?OVFxQkt3WjNVMjZJNGNJU0JWMjh4NWNyVWRaZVQvMHZhTzZvWnNSZExNQ2hs?=
 =?utf-8?B?V0ppbVBxUzg1dHByVGJSQ3BERHU2cnY5ejF6U2ViV3ZXNVdpRXZPVkdwMGRl?=
 =?utf-8?B?Z1JwYlptcU5DYUhmbFJlWk5hZVg5VENuSWxlU0loT0JKeDROVHRVR1JpeDVS?=
 =?utf-8?B?Qzc4eXJFYzF4czhXSGhvc0xrVkFWY1RyMjhvWVVPRUpZaHNYZDRGMzdIdXpr?=
 =?utf-8?B?TDRpRWxRTTdVYzBCV3d1aFVoQUJuZ3FEOFRkRXpkNytoc1dKSXFZdlJVWGg1?=
 =?utf-8?B?UldTdk1YYVh3TE1nazlybzRtUUVtRHFOUW9lbnFYZnB2VjVQamNXbWozdEti?=
 =?utf-8?B?aW01RVJWT2M1cnRtWW1OaytvSG5kUkFRK3BlRm9wSjAyTTF4b21JdTdsSGs0?=
 =?utf-8?B?UnBoaXM3WUZ0NW84VUlHMFNnbWpFeGRraVZPckxpQmtKRUE1OUJ3UXkxeGlX?=
 =?utf-8?B?TFcyU0hDN05iblRxaENaV21vaHZXVUtwb2NZRmpIVWdKNGp1S3NyREQwaWJG?=
 =?utf-8?B?eUlzb2lxZllTbVFRNnV6OUNVejlTY2F5MFJ2NWNSaFNxa01zZk9xcTRKZkNu?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9bab84d-5b88-4628-fd37-08de10e18137
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:36:25.6760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeMT8GeZanoJ21ZdUt0XzPSmrs5/Zeq2GmdniuBtaEXCpeeJSuAMhY4wvQdyJpJAzc/Qmx+Ehev36FflCaVH6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
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

On Tue, Oct 21, 2025 at 11:55:56AM -0600, Summers, Stuart wrote:
> On Fri, 2025-10-17 at 09:52 -0700, Matthew Brost wrote:
> > When a burst of unbind jobs is issued, a dependency chain can form
> > between the TLB invalidation of a previous unbind job and the current
> > one. This leads to undesirable serialization, causing current jobs to
> > wait unnecessarily for prior TLB invalidations, execute on the GPU
> > when
> > not needed, and significantly slow down the unbind burst—resulting in
> > up
> > to a 4× slowdown.
> > 
> > To break this chain, mask the last bind queue dependency if the last
> > fence's DMA context matches the TLB invalidation context. This allows
> > full pipelining of unbinds and TLB invalidations while preserving
> > correct dma-fence signaling semantics.
> > 
> > Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6047
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec.c          |  3 +-
> >  drivers/gpu/drm/xe/xe_exec_queue.c    | 18 +++++++++--
> >  drivers/gpu/drm/xe/xe_exec_queue.h    |  3 +-
> >  drivers/gpu/drm/xe/xe_pt.c            | 15 +++++++--
> >  drivers/gpu/drm/xe/xe_sched_job.c     | 44
> > ++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_sched_job.h     |  7 ++++-
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 14 +++++++++
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.h |  2 ++
> >  8 files changed, 98 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > b/drivers/gpu/drm/xe/xe_exec.c
> > index 0dc27476832b..6034cfc8be06 100644
> > --- a/drivers/gpu/drm/xe/xe_exec.c
> > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > @@ -294,7 +294,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > *data, struct drm_file *file)
> >                 goto err_put_job;
> >  
> >         if (!xe_vm_in_lr_mode(vm)) {
> > -               err = xe_sched_job_last_fence_add_dep(job, vm);
> > +               err = xe_sched_job_last_fence_add_dep(job, vm,
> > NO_MASK_DEP,
> > +                                                     NO_MASK_DEP);
> >                 if (err)
> >                         goto err_put_job;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 90cbc95f8e2e..d6f69d9bccba 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -25,6 +25,7 @@
> >  #include "xe_migrate.h"
> >  #include "xe_pm.h"
> >  #include "xe_ring_ops_types.h"
> > +#include "xe_sched_job.h"
> >  #include "xe_trace.h"
> >  #include "xe_vm.h"
> >  #include "xe_pxp.h"
> > @@ -1106,11 +1107,17 @@ void xe_exec_queue_last_fence_set(struct
> > xe_exec_queue *q, struct xe_vm *vm,
> >   * xe_exec_queue_last_fence_test_dep - Test last fence dependency of
> > queue
> >   * @q: The exec queue
> >   * @vm: The VM the engine does a bind or exec for
> > + * @mask_ctx0: Mask dma-fence context0
> > + * @mask_ctx1: Mask dma-fence context1
> > + *
> > + * Test last fence dependency of queue, skipping masked dma fence
> > contexts.
> >   *
> >   * Returns:
> > - * -ETIME if there exists an unsignalled last fence dependency, zero
> > otherwise.
> > + * -ETIME if there exists an unsignalled and unmasked last fence
> > dependency,
> > + * zero otherwise.
> >   */
> > -int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > struct xe_vm *vm)
> > +int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > struct xe_vm *vm,
> > +                                     u64 mask_ctx0, u64 mask_ctx1)
> >  {
> >         struct dma_fence *fence;
> >         int err = 0;
> > @@ -1119,6 +1126,13 @@ int xe_exec_queue_last_fence_test_dep(struct
> > xe_exec_queue *q, struct xe_vm *vm)
> >         if (fence) {
> >                 err = test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence-
> > >flags) ?
> >                         0 : -ETIME;
> > +
> > +               if (err == -ETIME) {
> > +                       if (xe_sched_job_mask_dependency(fence,
> > mask_ctx0,
> > +                                                        mask_ctx1))
> > +                               err = 0;
> > +               }
> > +
> >                 dma_fence_put(fence);
> >         }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h
> > b/drivers/gpu/drm/xe/xe_exec_queue.h
> > index a4dfbe858bda..99a35b22a46c 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> > @@ -85,7 +85,8 @@ struct dma_fence
> > *xe_exec_queue_last_fence_get_for_resume(struct xe_exec_queue *
> >  void xe_exec_queue_last_fence_set(struct xe_exec_queue *e, struct
> > xe_vm *vm,
> >                                   struct dma_fence *fence);
> >  int xe_exec_queue_last_fence_test_dep(struct xe_exec_queue *q,
> > -                                     struct xe_vm *vm);
> > +                                     struct xe_vm *vm, u64
> > mask_ctx0,
> > +                                     u64 mask_ctx1);
> >  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q);
> >  
> >  int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void
> > *scratch);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index d22fd1ccc0ba..bba9ae559f57 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1341,10 +1341,21 @@ static int xe_pt_vm_dependencies(struct
> > xe_sched_job *job,
> >         }
> >  
> >         if (!(pt_update_ops->q->flags & EXEC_QUEUE_FLAG_KERNEL)) {
> > +               u64 mask_ctx0 = NO_MASK_DEP, mask_ctx1 = NO_MASK_DEP;
> > +
> > +               if (ijob)
> > +                       mask_ctx0 =
> > xe_tlb_inval_job_fence_context(ijob);
> > +               if (mjob)
> > +                       mask_ctx1 =
> > xe_tlb_inval_job_fence_context(mjob);
> 
> Can we rename these ictx and mctx for consistency?
> 

Yes.

> Also, do we really need both of these here? Shouldn't we always have
> the primary GT inval (ictx) and so just need to check the one? My

The code as written, we'd only need to check primary GT but Matt R
eventually wants the driver to be able to boot without the primary GT.
There is a bit of work to done to that work but I didn't want to make it
worse in this patch.

> understanding is the reason being that we might be adding either one of
> these as the last fence so we need both checks. But in that case would
> it be better to check against all dependencies or even just the last
> two? Wouldn't that also help if multiple apps are trying to free at
> once here so we have interleaved unbind dependencies?
> 

Depending on how the bind is setup, we may check further dependecies
in dma-resv - see all the other checks in this function. This is
covering the case for last queue dependecy only which is at least
sufficent help with ChromeOS case where this is triggered with a burst
of user unbinds.

We might still have an issue with a burst of SVM unbinds where this can
serialize though, that would however likely need some DRM scheduler
changes though fairly similar to this patch. I can maybe think on that
one in a follow up in a later series. Also I probably should switch over
SVM unbinds to drain the entire garbage collector list and issue a
single unbind job too.

> > +
> >                 if (job)
> > -                       err = xe_sched_job_last_fence_add_dep(job,
> > vm);
> > +                       err = xe_sched_job_last_fence_add_dep(job,
> > vm,
> > +                                                            
> > mask_ctx0,
> > +                                                            
> > mask_ctx1);
> >                 else
> > -                       err =
> > xe_exec_queue_last_fence_test_dep(pt_update_ops->q, vm);
> > +                       err =
> > xe_exec_queue_last_fence_test_dep(pt_update_ops->q,
> > +                                                               vm,
> > mask_ctx0,
> > +                                                               mask_
> > ctx1);
> >         }
> >  
> >         for (i = 0; job && !err && i < vops->num_syncs; i++)
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > b/drivers/gpu/drm/xe/xe_sched_job.c
> > index d21bf8f26964..7cbdd87904c6 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_sched_job.h"
> >  
> >  #include <uapi/drm/xe_drm.h>
> > +#include <linux/dma-fence-array.h>
> >  #include <linux/dma-fence-chain.h>
> >  #include <linux/slab.h>
> >  
> > @@ -295,19 +296,60 @@ void xe_sched_job_push(struct xe_sched_job
> > *job)
> >         xe_sched_job_put(job);
> >  }
> >  
> > +/**
> > + * xe_sched_job_mask_dependency() - Determine if a dma-fence
> > dependency can be masked
> > + * @fence: The dma-fence to check
> > + * @mask_ctx0: First context to compare against the fence's context
> > + * @mask_ctx1: Second context to compare against the fence's context
> > + *
> > + * This function checks whether the context of the given dma-fence
> > matches
> > + * either of the provided mask contexts. If a match is found, the
> > dependency
> > + * represented by the fence can be skipped. If the fence is a dma-
> > fence-array,
> > + * its individual fences are unwound and checked.
> > + *
> > + * Return: true if the fence can be masked (i.e., skipped), false
> > otherwise.
> > + */
> > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> > mask_ctx0,
> > +                                 u64 mask_ctx1)
> > +{
> > +       if (dma_fence_is_array(fence)) {
> > +               struct dma_fence *__fence;
> > +               int index;
> > +
> > +               dma_fence_array_for_each(__fence, index, fence)
> > +                       if (__fence->context == mask_ctx0 ||
> > +                           __fence->context == mask_ctx1)
> > +                               return true;
> > +       } else if (fence->context == mask_ctx0 ||
> > +                  fence->context == mask_ctx1) {
> > +               return true;
> > +       }
> > +
> > +       return false;
> > +}
> > +
> >  /**
> >   * xe_sched_job_last_fence_add_dep - Add last fence dependency to
> > job
> >   * @job:job to add the last fence dependency to
> >   * @vm: virtual memory job belongs to
> > + * @mask_ctx0: Mask dma-fence context0
> > + * @mask_ctx1: Mask dma-fence context1
> > + *
> > + * Add last fence dependency to job, skipping masked dma fence
> > contexts.
> >   *
> >   * Returns:
> >   * 0 on success, or an error on failing to expand the array.
> >   */
> > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> > xe_vm *vm)
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> > xe_vm *vm,
> > +                                   u64 mask_ctx0, u64 mask_ctx1)
> >  {
> >         struct dma_fence *fence;
> >  
> >         fence = xe_exec_queue_last_fence_get(job->q, vm);
> > +       if (xe_sched_job_mask_dependency(fence, mask_ctx0,
> > mask_ctx1)) {
> > +               dma_fence_put(fence);
> > +               return 0;
> > +       }
> >  
> >         return drm_sched_job_add_dependency(&job->drm, fence);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> > b/drivers/gpu/drm/xe/xe_sched_job.h
> > index 3dc72c5c1f13..81d8e848e605 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > @@ -58,7 +58,8 @@ bool xe_sched_job_completed(struct xe_sched_job
> > *job);
> >  void xe_sched_job_arm(struct xe_sched_job *job);
> >  void xe_sched_job_push(struct xe_sched_job *job);
> >  
> > -int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> > xe_vm *vm);
> > +int xe_sched_job_last_fence_add_dep(struct xe_sched_job *job, struct
> > xe_vm *vm,
> > +                                   u64 mask_ctx0, u64 mask_ctx1);
> >  void xe_sched_job_init_user_fence(struct xe_sched_job *job,
> >                                   struct xe_sync_entry *sync);
> >  
> > @@ -93,4 +94,8 @@ void xe_sched_job_snapshot_print(struct
> > xe_sched_job_snapshot *snapshot, struct
> >  int xe_sched_job_add_deps(struct xe_sched_job *job, struct dma_resv
> > *resv,
> >                           enum dma_resv_usage usage);
> >  
> > +#define NO_MASK_DEP    (~0x0ull)
> > +bool xe_sched_job_mask_dependency(struct dma_fence *fence, u64
> > mask_ctx0,
> > +                                 u64 mask_ctx1);
> > +
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index 492def04a559..f2fe7f9fbb22 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -32,6 +32,8 @@ struct xe_tlb_inval_job {
> >         u64 start;
> >         /** @end: End address to invalidate */
> >         u64 end;
> > +       /** @fence_context: Fence context for job */
> > +       u64 fence_context;
> >         /** @asid: Address space ID to invalidate */
> >         u32 asid;
> >         /** @fence_armed: Fence has been armed */
> > @@ -101,6 +103,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> > struct xe_tlb_inval *tlb_inval,
> >         job->asid = asid;
> >         job->fence_armed = false;
> >         job->dep.ops = &dep_job_ops;
> 
> This means the "finished" context per the entity definition right? Can
> you either add a note here or change the job->fence_context name to
> reflect that? Or otherwise why is this adding the +1 here?
> 

The schedule context is entity->context, the finished context is entity
+ 1 - this is in DRM scheduler doc. I can add a comment to this for now,
and roll a better fix which is DRM scheduler helper to fish out the
finished context into this series [1]. DRM scheduler stuff moves slow so
that latter may take a minute and didn't want to block a fix on that.

Matt

[1] https://patchwork.freedesktop.org/series/155314/

> Thanks,
> Stuart
> 
> > +       job->fence_context = entity->fence_context + 1;
> >         kref_init(&job->refcount);
> >         xe_exec_queue_get(q);   /* Pairs with put in
> > xe_tlb_inval_job_destroy */
> >  
> > @@ -266,3 +269,14 @@ void xe_tlb_inval_job_put(struct
> > xe_tlb_inval_job *job)
> >         if (!IS_ERR_OR_NULL(job))
> >                 kref_put(&job->refcount, xe_tlb_inval_job_destroy);
> >  }
> > +
> > +/**
> > + * xe_tlb_inval_job_fence_context() - TLB invalidation job fence
> > context
> > + * @job: TLB invalidation job object
> > + *
> > + * Return: TLB invalidation job fence context
> > + */
> > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job)
> > +{
> > +       return job->fence_context;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > index e63edcb26b50..2576165c2228 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > @@ -30,4 +30,6 @@ void xe_tlb_inval_job_get(struct xe_tlb_inval_job
> > *job);
> >  
> >  void xe_tlb_inval_job_put(struct xe_tlb_inval_job *job);
> >  
> > +u64 xe_tlb_inval_job_fence_context(struct xe_tlb_inval_job *job);
> > +
> >  #endif
> 
