Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7850DCDE008
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jun 2026 09:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B5A10E327;
	Fri, 26 Jun 2026 09:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1+TlJFv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC0710E327
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jun 2026 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782465915; x=1814001915;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T6A2NQ1uge3EN16kJZXeN+EuNYSqUgbmXnYQaBq+d48=;
 b=J1+TlJFvs/HRMm3q1Bxn0mfyJZ3xYk1nZyx2BL/pmU+auJ0kqDTaasqX
 3xWLIyJYJ2q40eAnE/NNO0rZFDgkPHpUEcWcMVjLoOR9lrVWZM1SUGrT1
 Ks7rn9YXe9AFdDXrYHGHKPfdS0gF0CcjMPK2A6GpnAaRU/coAi+12cPm3
 Yus+7zJ27CVbolxuVSa9fujASsowRRsi+OPpBKpYDw0j4EYSlkGHR0xSi
 BZZrDuU50Ld1dY8UukJcz93obdN0RJ0jcM4L7CZXOPEDApPj0LUAZa6KN
 XsD8A/ALUat0X4BLqeW6ZpAIfbqVcOr/+gAuGevAM9fzhWcHmnL/z+yfd A==;
X-CSE-ConnectionGUID: 3Tg8PC3oTPqPuNHYvLpSbQ==
X-CSE-MsgGUID: 75fijg30RTiPL37FT03KeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83136294"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="83136294"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:25:14 -0700
X-CSE-ConnectionGUID: jAWEnrFVSZKKMKA51yE8fg==
X-CSE-MsgGUID: MO7DgkOSSsOSM+NVQMC6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; d="scan'208";a="256179837"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2026 02:25:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:25:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 02:25:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.58) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 02:25:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3Qu2kFdPrbMNGBehMjKLXhzuRg3E8QjxVnIni2jPX/Gipprfc57hTjEAlb+rgFSL70Ml1e+pSDp36gVXI0N9GJkMqUNpm82pECMYGEBtNN1emIS1nbiN07mpGgdPcdM6t9mG+3P1Qkwixd1e1yqT1n7/4KcrUwvfiROxGsN6zPSHR6nTk/Z39Sjd5Bm46no8kgtcDl6lv5LYiBfF4PDldbeRoBzdZhiryekcwkjTqdKviHjexYcZtuPGUsb1sEV32nv6kLPhD6auP3zG30I2VbMJf9q5+ddMFLsxNDVE5/15Ga3YPeg53MepznjGStSXvu4YS77bd4v/x0v+GbFzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCI90w6XfKpCyLN7nv2wU7J9IPM8Ihe8EF7eMQ8aKzc=;
 b=QHGmdIc7UxJhNv+hYkPpCz5PKhtZ1J5MoNc44LcU0cG361qE26HbjKOeEGhVbaJz4RKMbqW4tusBc8VOcCK7ovL53aVCgcTi59aemtGgc7B0xosTlyAzaEU/i5Coq38LDWEw8BaP6W7IJp83NARSntHuUU/tVOChjE+RYDnsJgJUGfuuQ5/Hc/FGOdQ5r0nhU+Ah0hjpYfUn56lsHz1Kmh2oFVP4R1co34lE013YmMv+mKRYNhG7LLl/wsnFm99rW0N2D2RDlbEle8SgzEEnOyl2Ts82dqy033tJ22ecCRUNXksiv5CMhhdhZg19x4Z37Veok9ovAv0aPmSqj2820g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8837.namprd11.prod.outlook.com (2603:10b6:806:468::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Fri, 26 Jun
 2026 09:25:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 09:25:05 +0000
Date: Fri, 26 Jun 2026 02:25:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: Reject duplicated properties for
 EXEC_QUEUE_SET_PROPERTY
Message-ID: <aj5Fb6SnyYlRZgSf@gsse-cloud1.jf.intel.com>
References: <20260624111421.1258364-1-michal.winiarski@intel.com>
 <20260624111421.1258364-2-michal.winiarski@intel.com>
 <48752ea7-2c8e-4695-860f-c02a618ec3d2@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48752ea7-2c8e-4695-860f-c02a618ec3d2@intel.com>
X-ClientProxiedBy: SJ0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d754618-5ec7-46be-6c1e-08ded364cee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: +oBAIEt9HkY+OtlKSE/kbVI7VHjBr5EFKxAmF5XQj/wFtEbIrDiLQqAAELhFlrPbdfqWGuIfWyOWUbfgsr0izTrijq1oTKbxNM1P8UFRGspj+/Psd7If90W4VoQmCEKPWYAyFSg2BDvF54TNQFZX8+ydRgewRZFR3237A194WjyMGGqOnAPTYJS6gJNyb6BlsKa0A/WCl+zRyjQKFrQKETzcoDUoApw4kJVLRepOGG0mEcNZPDBt/ZeQhzC65SECNfIoqOUDoTrtQeZypua7+U94rArsvc/1i4lMB2qK02Ylx1CIE9DUDQQNKntN/oO1rLHnIwdCsJcB6R0eFyENgrzEh1pwHOJj7eY6Krs/NZDty7ReqE7DuOz9EDBZbvCnRzbVTqnsOhrRyjm3u0yYbNVovXtQjdaQPXkBdPILkr4q2bJ6+d9Q3h3wuMZ2jCaspJrGrrz8mKTlTARTW43qKd58Kqd3hJIc0GO6aDjXDMcpyO9pufGdchQFQl+p0jUReZGGxys0JcsUN0Mqv3cAtRkMuf/9+58FV98oY6vnpuWjFM2CgiS+4C8Quvr1H6+MlJ2mp0adIqzS8SMydRnb44h0gn6yfSXubH3uHmt1f9hTv1GchNqPo4OMaS+XxUJFatemP0nZpWePUsed34pjeicVv+jTGIe/Dzmbfdoyano=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWd6dGs4N2p5L2pxa3VaNm52RUZPMHdVekhSdzE2eVkycVBMYkljRDNnczFM?=
 =?utf-8?B?S1VWejhoY3Qvb0FORUE1MmpmU0lRN25RWnBmMXA1SUYzbkMySHo1L3pSeG55?=
 =?utf-8?B?M1B1MGcrV0RGeEpteUprdDZZYmV4Q3VjU1ZSTzBUSFhDZFFQMTlHcExza1JK?=
 =?utf-8?B?eGtoQXRsYk5MQ2wxZkFydVZXZmZCWDdzUWpVUmlLUVk0TlYzUTZNamMrR3JF?=
 =?utf-8?B?Tm91ZTFab2ZFS3dTWGVMZzA2TGU3UEJEaDd6WnhmVFQzdy9IbVl1R2loaUl0?=
 =?utf-8?B?THQ0V3U1VTlqcDBETW93dWNsdFNlWCsvYWxBRXpUU1Nzb1lrdUltbTNuc0ls?=
 =?utf-8?B?MDZBWXZsQm5wcUcwR0krN1JqbTIzWVVKMHF2ME96K3RyRUlob2c3UGpsbHJS?=
 =?utf-8?B?RUxOYkJyeUgrVERsQUNYRHRGSFlJQ0Jxbk16ckIzOW5zWlBKVFU1SGRadXov?=
 =?utf-8?B?Z1lXU0tPSWZEU1UvZDdCVExGd2Vqb0Y5U0RhRmtITTJtVDlwcGkvNFA1Y1Av?=
 =?utf-8?B?OWZucWVRTXhxcVczc1k3ZDZncmw2eDZCTnluSWdGYXg5Ylg3aXFNNHJ2cVVr?=
 =?utf-8?B?ejN4cWx4T0RKWnQzQ1NZUzZmd2tXMTQ3dm5NWk9GUGx1eTRqQkdqVER6R3VD?=
 =?utf-8?B?WHhxQVh2Yzd6UjlqL1dDdnNRNFBxdWw5RjJEakJDK3VQR3dKcFFaWVc3ZGp6?=
 =?utf-8?B?WW02bENmNWtHeEF0djhxNzlNdDJodHZEY2RXZ1lnUlRYK1JaTVp1d0p1aVVC?=
 =?utf-8?B?Y1YrNVo2VmZJSUFsMkFsUUc3dHluK2VESnJKQ3BTM2NkNUFxWVQvbjl3a09j?=
 =?utf-8?B?MGt2TkVGM21oTGZPM1k0c3BTRnFVL0hYQ2pMdkxoMUxlRUNzWTlaNWVXYXhI?=
 =?utf-8?B?UjlZcU1oeURNN2xuaUdhaGxpd2lCSGwxeEhpVkJ2R3RtSkpPR3R3REVrT2ti?=
 =?utf-8?B?RGRBcWowYy9xdG1PT0p0blhGL3dMejVWbG1Bak1ZMDZ3RytFellSUEhKNTRK?=
 =?utf-8?B?VE1xU0ZyczFxbUZ6S1h0aytqUlVVdlhPTWZsZDVlQkRjVHY5YjlnUmE1S1cy?=
 =?utf-8?B?STRWTGp3Q08ydW1uVnhTWXBhZlJhcUZxMGR5M09oSlRCU3FCekhYWERTUm5P?=
 =?utf-8?B?SlFKZlgvbHBSdE9MY245V2JmaXZRNXo3dWphMUVtbGNqbmFrM3Z0eEZDa1VD?=
 =?utf-8?B?aFBoc2xwdlVSQzBxOVNaOWJYMkdyWlF5SVhJWEJyZGVlOFp6YTdhY0NxazQv?=
 =?utf-8?B?N1lxRUFZZ01TWTV2VjczNjROSVNvVTcrbk8xUFgweHRrb2FVUjB4eFJJU25Z?=
 =?utf-8?B?ZzRBZUR2djl1bEJQSENYeS82T2ZHcGNxOGIwZ0VnMDlJMkxJRUFrZnRxMDRs?=
 =?utf-8?B?MkYzMzFra3E5aGE1bTkxaVJRN2Yxdm1yclpNUks1ckNxaVZpZThvUU45RnRv?=
 =?utf-8?B?REVhSkdGSTNhZkVaWElRT1RPczJqYWcwQ2ZHSVh5N3k4a2pPNWtsWWQrS3R0?=
 =?utf-8?B?MnlhR25WakFYcUorM3BUUDVnWnhHR2hWWkFhcndrRUEyQjdmbEhqWDNnaUlD?=
 =?utf-8?B?SjJZNklLd1NQZjQ2LzBHdU14OE9MTDArdUgyZnp2R05WVUZncmN4c3g4eFJV?=
 =?utf-8?B?ZTl6VFRXUktvODJPQVR3dE0zdEVNem8wODRGVWJhMkhPSTZvdkppNk1yTGtU?=
 =?utf-8?B?MjhKaEh1ci9ZWE9KNUJXZHNyanRIVWxMeG1OcjAvWXZVY3JNbUgzU3lRbUtx?=
 =?utf-8?B?cmx6ME53Y041OHJEZEZUZ0t5amptV0E0d1dmWGhpOFEwR09HK3RYREhPc3Bw?=
 =?utf-8?B?U21NVjZ3ZjEyWG9tbG9ySUNlNzRZTlVWdHM1TWlnKzhSMDFqMmRBclducUgz?=
 =?utf-8?B?MUJlbDdGbjljZm81dFVUdkxKeCtHVjgzU3c4SlZlQXdyQXRLUkNqYmZEOUNU?=
 =?utf-8?B?bmlyWWpQblFOWVp3ZWM3WVc4aGtUNE41NmpxSjBCNG9EMm9Rb0t3MlNzT2RH?=
 =?utf-8?B?TjJoMytpTlNubjZmYkE2SWllSm5Pa29ZWmRzNjNhWG5sWk1aeC9uRTFNZDZ6?=
 =?utf-8?B?UzZNc09yc2tQRzRldWFYRkd1bFd6S01HNE5URGtIRk1HR0VYakQ3REdwV3Qr?=
 =?utf-8?B?UTRmbFZXWE9MZ3JmMFdoYmxtNVN0WDBNaFpqaGhLTVJTcHdoekZKbldvOVoz?=
 =?utf-8?B?OWpWNGw2UFFKNUFPZ3VtZjlYVi9tWW5maHZXRGtyZlg4dkRJN2hHb1hYUXJW?=
 =?utf-8?B?WTJGUGoyMXZzdW9DSVBYTFlPWU11U3BMOVM3YSt4L2toRjhmTThoaDdKUURa?=
 =?utf-8?B?dmpwWDIyUGtpMzlMTk9Vam14N2lpemlLb2ZBNFFDWXdKdDdlZjRRUU5Va2NS?=
 =?utf-8?Q?zymYwmLf5jpAgO2o=3D?=
X-Exchange-RoutingPolicyChecked: QeLtHXBa/kFT9K1ZbJxtRG7Q+heX0JUdiaE0AqWa0BdRvAe1ZqFG+sF+/Pu7RVWCyHtrRQT1m0CHeEdHxHiJEamsz1Ga46YR6wKfead0La8T/QA0cPZtTz22RwXBta9mYOw8v93Mxcv+/w61yxWbba5faEoII9jDVjfv+pzD7s0kzpzOBF/mWuucYijBfa/9ndYSDOSw7qNmsfhpUfc/N/Fi0Otr515khUXFsWiM4+RMxUPy9EGXdnG4Kv3OCcZjCAzgtUnNPWKtewCqypo1H9ndATFsRrJn+Cj/hQwc26us6/MIg6TPCTE2NJ6QK/4o/t7s+Jo+JSOTpV0nm7V/CQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d754618-5ec7-46be-6c1e-08ded364cee1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 09:25:05.5632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vz2lrAhXyo75b4t0ontZcZpksoAppXJi00UI6gbtHGeczzEpOTOEVWfLY8DG1JyuBcu1THH6pEQu95eT4krvpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8837
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

On Wed, Jun 24, 2026 at 05:27:01PM +0530, K V P, Satyanarayana wrote:
> 
> On 24-Jun-26 4:44 PM, Michał Winiarski wrote:
> > All of the properties are idempotent - setting them multiple times on
> > the same exec_queue within a single IOCTL doesn't make sense.
> > Return an error when duplicated property is found.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_exec_queue.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 663decb19304d..c5edff8397353 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -1112,6 +1112,9 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
> >   	if (!exec_queue_set_property_funcs[idx])
> >   		return -EINVAL;
> > +	if (XE_IOCTL_DBG(xe, *properties & BIT_ULL(idx)))
> > +		return -EINVAL;
> > +
> 
> Any reason to return -EINVAL? If it is already set, can't we return success?
> 

It is not a valid use case to use any property twice. If that changes,
we can revisit this, but for now this looks correct for the current uAPI.

With that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> -Satya.
> 
> >   	*properties |= BIT_ULL(idx);
> >   	err = exec_queue_user_ext_check(q, *properties);
> >   	if (XE_IOCTL_DBG(xe, err))
