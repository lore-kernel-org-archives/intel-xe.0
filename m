Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC3FF885A
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A1710E13D;
	Tue, 28 Apr 2026 20:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4WcokRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6732D10E13D
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 20:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777407472; x=1808943472;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2iPBbipiO2YXUwCNuVc/gl5xtCTD36uci3YOlCrY8wc=;
 b=S4WcokRW6HcI7I0cVKvZsEYAh4v63jiKuEeh1Bi1D5HMaVbbt3XQbXkD
 gc4RVELaeLBNlto95d95HkCwul4zaQRbETIW1Jb7LHZj1yPeg3KvzKIAz
 HbdwaVUZZ/5ebjwKTGlBFjegyB51Yc8hKg5KetAnUIahr+4XX6hzl6w2/
 AGBeZrdJPhngA8T96czOQKhMilkMr7Y+LpFBiLFLWODDAa+e/T18XIsLA
 wlsB0VJPVlQMVGqD8VC3f1tY1xLzK33TsPXyaEb/hLeVQ5sUndFHzzAsU
 13lZ8Q/WGf0vZX53ElHimJ+7IaMqW0WQXhXD44oD8MEJM88iQxMOj+Efh A==;
X-CSE-ConnectionGUID: wEek4SEtSFWXmAyDowSF0A==
X-CSE-MsgGUID: yrKciWjQQVezGY/MwTfKjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="65859632"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="65859632"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 13:17:52 -0700
X-CSE-ConnectionGUID: LYAd8oNTS2qXM7kWBUqcJw==
X-CSE-MsgGUID: kTOlV3aiS3GLx4JN9/+wUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="264442530"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 13:17:52 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 13:17:48 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 13:17:48 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 13:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxdUXEreH1KcKGNanlwHlK5uSmFZihIwgD45KWL0qns4g3BbmwrP7p/wBeFDAuXQKTm0RIePD9kfMjt4FEGtfRzoWNZRv6CCN3Ulp2+8cj8Cde6WXjy4FM9+9FzoE6Wt9pHJC/AO4mCUu9ynjpAV6wqdzJVa++KC9RungOayJQXOe+S8tQutvQ0akPaoeRQ3YbJ7ASMXvx5eKqyP6DRaDtgyyn+mqpWp5Ea/PMLg6UMAGfj+RB208eFOmpWegOrBNG/OwMbVplfPejXv9ISKgL/p3Rw6+gof/k/Yhf6/RrMTMwu2hpMREP6JeXqGc5XBOD8RYvDSERZBmjWXS2ZVUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iPBbipiO2YXUwCNuVc/gl5xtCTD36uci3YOlCrY8wc=;
 b=IJV03ZVnxhMk455RffEX+xsxHjJK3FbFA057pHrewWTIAprU9F/XYmTkU3ORR1uQs5LVsac0onZOr89m7W4a9lSnReDHvNap3mqge0EsacZqM1HMJ+7BoxJadjgxK6zi2tB4qNpBdb7c2FbsCo9+nYu+fL3AxgkOWanxOKGlIVnIhGyzt+iokYlF+KmpYpDJAl2X9+O/+f3jureD3noyQXrugYZ8osaqrBqQIuqyM3vTz9vPJfv+D+0NWyLtY6JkEopZ803UhoRTOlpmaDQwc+z8Gw67pyUl6SvCfPmDU4Xprs0Eo/9sHDTTzHQfjSHNPqSw2rKhfJKP6KpNumk5FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW5PR11MB5763.namprd11.prod.outlook.com (2603:10b6:303:19a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.17; Tue, 28 Apr
 2026 20:17:27 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%3]) with mapi id 15.20.9870.013; Tue, 28 Apr 2026
 20:17:26 +0000
Message-ID: <f567b250-a525-4a33-8c90-b752be1b8861@intel.com>
Date: Tue, 28 Apr 2026 13:17:23 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Test_GuC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
 <177733609550.16228.13948296768016079225@5ab824fced77>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <177733609550.16228.13948296768016079225@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:303:8e::13) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW5PR11MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 84b2dd0e-52e6-4e02-4eba-08dea5632aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: xaR4kiLlPOGoJKXH0cICO16b8FYt4dthB/YZrOQvz+MyGgrzHk0L62Cbxb3ifTpSvFXpyFV3jnuHUgI96bFQZAk3xxidLPVh0Jb8hVXPVvWtmvUkjCPPFZMBBnm91jHlR/IYbG+dM85eC99Coerc4seQ4w5UBIi1aM3jxm3PoBXpIcag0M1s5P0YPNrZKQUo9/1+reQdKge9MAN7Jsg+Qo8WQ6xbYTOsEP7a8mZuj0m6EIcVkKyMdx2qicGaEDMJjTCZ3l+HQRoEvuf2w239bQErtZ0A/ZoFpGvaKGhHOlfRQSMY5/CyHgGfmvgMLU6542gC9bL+Dqm4DwMT6k34hG5xpi+IbVJUHXGMUbdHJu3luqS2nF1345na/g33sX4ik3JiTM2t/eURwSHCwgbCP0cNmhRP2lj9BTdKvaI91yDual/kCzcstevDybIXyY+Y9nh6Tkm2OE/6BEY1b1yUMZIUMY3GbjqVRVaQhngMpfjiHuiId0GQNT5Tmw9mSqcKJBSZ9hD3NBag4QTMGDliMg5//fwNcLAaI5RhpsNDO97tZahb3G/uOrkM9E2OQ3DvA8xdecu7d3a2P320P3XVbGzazTA7YpM5Vp1FPenUXMfntcq/Bv8UgqWNFhJePEA5kfYYJalZ/79HRjONGkO/XKfu0dulHsMQlUWV8LobtyrSy4uetl29s0xwCWpKPDosFEujRzPcoX8YCEsOpsLIfvywqN7qJq2u3ZFeaz3joWQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHN2ckRNYWVtai9GbnRhMUhaOU5wZlMvdkJ3d1BGcGpQQko3U2V1NFMzVGEw?=
 =?utf-8?B?SWlrblJ5a3VMTEhxMS9iTjR0MWVtRU5WTDBSQjFOM050bzhzZ08zVW9weVRC?=
 =?utf-8?B?WG1mRm9WdjV2cVZDeXZwdCt2cDlyajBudUNCb0JyYUxqVWkzWnp4TklWbDFX?=
 =?utf-8?B?R0NFZnZ1cGMzSnA4N0lMSVYxZkNPaTVlellzZ0F5R3p1OXdWT1ZLRzRmOUh3?=
 =?utf-8?B?dm82TWU1K3Y4bUZYQm52MG1NRXpMQ1NEc3dQaktBUUt0RG9vVWNnNnY3Z3dk?=
 =?utf-8?B?WnBocDVQY1UxK2NoT3k5ZXoxcG0wNjdGbnNDT3N3UTZ0NWdKbUc4VnVYZUp1?=
 =?utf-8?B?NCtnays0U0lrTGpwTXlObHZMUWJVakh1eGtrcVhEQUdDV1BpV3FnR0pRM003?=
 =?utf-8?B?d3FoaVpVWlBKR3h0MVBmeDFhLzFFZ0cxUG43cGVrL1FjSU5pRWxFU0xNd3pY?=
 =?utf-8?B?VnVkM05qMC9oTzVpOHF3ZVVzSWFodklIdUZVNjZEOGpsd0l3cm5QMmsxY1g0?=
 =?utf-8?B?OTJQdnY2eDMveGxKWVdrR040SWJOY24vM3N1bmhPanp0ZWVnb1lhMzUrbXhK?=
 =?utf-8?B?YWIxSTVtZDV1L1ErdHZGVk9uUStsd2x5YXBQaytYN2xwODFwMWltdnB0N3pV?=
 =?utf-8?B?Vmx1SFdDZElLM1RJSUZ1NEg1aTJoYUd1UlNiUmR0MjJ6NkloQUpLVWc3a0lG?=
 =?utf-8?B?SUJrWGwzREcwaTdBdytGUEJlUEcwcC8wa2pIM0lIK1BBVFhCUldBNmhxZ0tG?=
 =?utf-8?B?aTcwaEF1a1BrZEE3WU1KQ0hUdkM3bGNxRkZsakZGM2VPb04ya3NFdnZNVGY1?=
 =?utf-8?B?Tmh3ZzVyK3FsUGd3L3ZMQnZKNks3dUVvRkxWRUNZN3U1TXFnMitLaHV4TXZo?=
 =?utf-8?B?QTd2a0NHakx1Qm0xaDVLRHRXK0szamVqN3hIUm9yeTNiUndzWEFqVEFBQUpR?=
 =?utf-8?B?OEdxb2hXcWxNSUhwcGdxSzVyTG8rMEIxWjFMN21KUzVoTVBjZThDa1dDUjRi?=
 =?utf-8?B?OVRzSkMzVUQxUVBIeEFvN2tqZmJlU1hjdEQ0TXRxT0N6VUhpZ21Ba3ZnbmhT?=
 =?utf-8?B?STAvOUU4WmxyUHdmV2dSei9MUHV5WWN5cGdpOWREY2FtNS9PUndINmd5NEd5?=
 =?utf-8?B?YWFkOHhLdzRScnMvaWZ2QWpwWVlhTGcycFROQldKbGo4NHBLSlFEem1zZ2ty?=
 =?utf-8?B?Zkx6OGtJMDMxQ2JKMHZ1Smp5RGtQdFJodk8vRnI0VGlBVTZBUldYeTlMQ2g5?=
 =?utf-8?B?Vlh6eFp0VUloZ3RLUUpXQlNKMklvNVNNSUcwYksrU2ltNHlFMzJQSGpFVHVn?=
 =?utf-8?B?UW1KaHJCNE91cXVpajc2U3lUQzZIU1dpVFNvMFFPV1k1VytmaVF3ejdjZ2xn?=
 =?utf-8?B?RHFaUFIxeUQyREVGNWZjV013UXVGN3hZQWszV0dMUFloMXUvWHZHdlhValB1?=
 =?utf-8?B?QVJqOVQ3ZkR4SUQrY0JPMUc3NGpUSTZUZHcvNk5uOVlnMlltLzlDTjYzelZC?=
 =?utf-8?B?MHF0NnVtNHJxTkVrbGpSY0JoL0JodXhheXRaYUdDaTZ2elprZjJmYzdVd2Jn?=
 =?utf-8?B?WnFIaU5TdGh6czdxU3A5cFhhVDkxSE5XTFhnZmF0NEU3UC92ZTJuVm9QR2JR?=
 =?utf-8?B?eDBXWHFrWjNISFNPZ0RRb1pwSUxrMElNeGNhd2UzdzVrQ0dQUWhCeVR0ckQr?=
 =?utf-8?B?N1ArT2pmOWxVb0pidjdNcjVUdjZIRHRaWlJWZTZIbGpaV0hhbUl5RVNNVU42?=
 =?utf-8?B?ekFxK2U3NHdvd1dHLy9CRnNsTnpyM2p2ejVzZ2c2TUNYTzFWU0xsemdXQXdD?=
 =?utf-8?B?aDZXenpSazkwYklNamd1azBTZ0FHTWVqK3NjZWtmWlJFQ0F6dmI0VjdsUXNj?=
 =?utf-8?B?Slh4OGF2d2o4Y1NiYWVxeUVBWi9qeFF6QVg4RkFKRmlZZVdLblRYeFp5Ui9I?=
 =?utf-8?B?c1hISWZXMjlmM1JERmJQY1N1M2t1ODdQRjVBK1hLQk1ma3RIMFZJSFU3OU94?=
 =?utf-8?B?aG5odEVyVS9wTSt0Q3JnYm51RXRkckFwZ3VyS3RFNVp1WGNOY1Nlb00yeit3?=
 =?utf-8?B?bmxuQ25ueXdLZXVsQ2NzNG5MVDlxcHNVU0h0a0F5LzlmajNVcVlhRWNsenAz?=
 =?utf-8?B?MWdPTU9zcnlGZG0rbllOM3ZhNEZhYmxvZXQxOXRraS9iYlQ2YjU5b2NSaENl?=
 =?utf-8?B?WE5IdFhSUmtQc2pNYklzWElEb2RRSmsxT01EQmJ5bVU1N3UvZUNPaW5DTlRi?=
 =?utf-8?B?T2N3RlNLdWlGT2RYcS9abVY1d1V2dFR0Uk9zTFowMTVaVkhTRnNucGozeVNw?=
 =?utf-8?B?WWsyb0Q3ZkF3dkc5NndtM2hzV1dRSXpjRkx3aHZiQlAzcS90akttNFNleXIy?=
 =?utf-8?Q?GpoLjXcaXL9n4Jis=3D?=
X-Exchange-RoutingPolicyChecked: hDAF9Ypr8j6+AfFj401FEtpYycfwUDEpCBrDHVCh0a+zolHnjqHqBRTUeOEQpu6HCm2rA7q27RoKAL3/D9Xvg2J+MNPx4elkkSs8zP60oRd5CXz7IstMK3qQiiG+30ixWCWaLlDDgAg8+2ifuRCdirhktOLGllXn6du5HAMP9dNVntHelpPE0ecbwmB//KbfEJcCIH55ODa3NaQgU5Q2ZW/nTsu8vJ+8DYOo7dVeybTD4hXjieqEyYKfTtah3qjQHW+PKWmgWh62Q+Bv6te5I54yVEa1rx/CB/1n6AJxxaOMPb8sDEfeMAfCkl1YCH38iauxDawtFwjEwMYWB+wsoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b2dd0e-52e6-4e02-4eba-08dea5632aa1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 20:17:26.9713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J40sLXuOGIZqylkELSyC9zEVKSvAj27GLs0oQPBIcfcLScQzyyDIhucaj3YYyl35HZJ3pRniaUwIk4Hh5p+au/OVLqsyE2V9lsdPnDX94l0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5763
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


Triggering rerun now that shards-bmg-9 is removed from pool.
