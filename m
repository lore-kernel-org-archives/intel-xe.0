Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF37AC5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 03:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1BF10E245;
	Wed, 26 Aug 2026 03:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODlpY35Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7007710E245
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 03:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787716346; x=1819252346;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RTdP2+85yu4qo2q9HJiTzWXGxpo00QSq+i9mYlKs/1M=;
 b=ODlpY35Yb0G7OYyl93butBzoh69KvLbPWm5z8AT2ErTvrpB+5EwOBAZi
 ieDLtjLOoSVNbaB/byjeZ/YkWHl3e3DAXj5cegn2xt35+3q343dxKbqt2
 A5pPOqUqwtrxY5bXC7znqKtu8vl+CERMPJ+MGXLf0E5GcuN+ymEaCIQ6K
 h3rDkJnAt7Y5utv9KVvRTtj6jJjajexJmM+cwBzOS22z4DSmuGAier1Tw
 jgcPMW0sVMJoABqUrwCIrcA6qULS4VfrjAuLu+UYSYFXRbSuJ1JYL2RAz
 eb3Y1QhjE0yATlhXM18SmizzkWAjtsdn96t/Al6PVjk9kCt2nyLgvSDpA Q==;
X-CSE-ConnectionGUID: iDUDldA7Q865tnErO8XRUA==
X-CSE-MsgGUID: 8Li/EU2xTC2eQzTGHUG52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88049706"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="88049706"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 20:52:25 -0700
X-CSE-ConnectionGUID: zEvcU1baTlu/bW3tmLog+w==
X-CSE-MsgGUID: JJJidhWHQbGo+RM0cI/4fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271259294"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 20:52:25 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 20:52:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 20:52:24 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.36) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 20:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpxQ6/jP4L0aYRgRWveJwMBH7V3T7YMBlSGg11h5kFaew7CJvQOmKAEdZbBAeuJDK5jO6Mc4ylnFBRDD1c5+OWZNpvt69PSIaaGo+J5gXqbc931CeTJRM380CypC+mwjAnN+GXn6yLt3sfq1NsCH+sx+JR98r4Y2vH2gnxzFuXV5uRWq+Hpz+9QraURHkCLE1yBsw2DOpEtE6tb55mSbkmVJpebc3YtPAM3m1JE7Qc5ZCeNxp9GBknx/AE8G9GSt0naFomHRL7/UUoqwjp8wR/V9YXLpAjRTxZaq/D1u/U7z88y0DsGTH234oNweElK5Ynwp29D0xKlHqhi1PTdVEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tSX+uez5LRAY5Nxj+J4NoZL4OjBu1vXpD1Kxnvfi1ag=;
 b=b255F7mMaOTY5GV5sffUABLo/Gic9keLFLXloJzB8mQQ+00j7xyGgqBt9/8F8jSG1a0AzZycKqnH7KC/1edxyBqh6H8eKyf8sM8awzWEMkK0JXAgBki2Tkyb8dPo4LfynT1z/zDlZ6mujVEgatSTgAL1gVi8d6aMxV1hIRiL5psh6rJr893wAddtlocEZMpha3u8fDIC9wTY2FyU5HrEhsTc+mKXeMyXOb4z0H8rJFU86A+fA7hvcFCkGSWAes55UXAfYmm3Fazv9aiKK8x6oIFRpvGkqiaa+kB60yck7x/we3gRR/KtoTSBFEAKl1VXAlO/rH5nY59CS1X2wI0S5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 03:52:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 03:52:21 +0000
Date: Tue, 25 Aug 2026 20:52:18 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v1] drm/xe/sysctrl: Read mailbox phase bit from hardware
Message-ID: <ao5i8u9qkhq1IRSX@soc-5CG1426VCC.clients.intel.com>
References: <20260825172827.3801591-2-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260825172827.3801591-2-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: bd529489-96c1-4cea-d57d-08df03256e3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|10067099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: FgFiL8rrm2LRpAIZrYGZoYoAqhO6KWAYajdUIpW1EaHkpmWjuWXMxAf0i53CMejnYn66U93Rd/yvgVRqkFpYAH29HcXHscHIDN3iZ6zCkmTX/V1oY2Ksku9EjRSimCnqqJsBslPQejBugBLm8sMpBs8fbA+NU5nrbq+vJd+pq8VQ5QmdmQpeb6BKmd5oqr95WhhLvW/FKSPJFLDHYqEtg+bTpw/FHRj7IkHA8eDm1/HINjl4DOJSgVMHPoJIie4gkLptKNtnGtH8xvu063LOecrDVZmjksvNy5c/OVceH5E6sg+NSzJEFiLmiSJnhhjvIvR4QczDrKzHqkv+XstfcF824hYK9lbX6WPoWqxfEDaXxZPqJ+gi3PXsYc8IrzPTtz0pGCBwsld9dGR7vJd6d8L/j24DrQ3Rzyg1A1ZB/rSR3eOzQgD3GDszpgxOfKBKNvPafErPMu+jsHxl9jOOuqFZvUazBuLe53lEhpr5xDk/vPUle3fFtUPimQewrTEhkgoVaY6Cv5eT53XvSQGzYzI1oSIN1+7gzPGjaX5gFCl50y0C8nsxZjcfPllEW3+9xJTLd/94nSSkMf8rqkJMYS8NiRTJNo6DkuPp1zhtHVVVDMdbaE9CSzGwUlIOcHfPo8TcLhAao0uY0C7l/hdy3JBFmpO2NXS8y//TuhhLpJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(5023799004)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MG94K2tzWEF1OERmNHpSdk52UDZ0LzB6Z1N6Wm8rWWdSeDRLTjhhVy8wd01X?=
 =?utf-8?B?a2U0Z1lvdHRycHA1OFVpU2t4UlAxaTMyNTNKZS9NOUpPS3Q2dldDZWoyVnBz?=
 =?utf-8?B?cERIdlZ4Y0NJRTN0WEl5UHhjaWRPUmVVOWdRSTZpVWlySmtkUFEzNzVQSGdK?=
 =?utf-8?B?dTlaRGZJNEJJMk4rL053WGJFUnNidi9Na3ZqWkdSQjlpRlRLMVlNMDVPY1Jp?=
 =?utf-8?B?dnoyM0pNWk1iejJuNENnbE43MTQ2NEV2cGZkanppN2ErTElPWWQybkJ6Mk05?=
 =?utf-8?B?ZFBrcThHOUJSSTkzOFhYUmZMSnpreWZHQmp0MXlDd1RPZHQ1QzMwWmdTcVU2?=
 =?utf-8?B?SFdSNUIxak53WXdJeVhZbmJnTlBCb2JZTExXWUdzVEkxSFdEOGZCZndtaWpZ?=
 =?utf-8?B?V2xvbkxyWGVYUGFUTVI0RWdPUEpxc24walRHQ3Fub1ZRM3RrZThGblpqTlgx?=
 =?utf-8?B?cjRVR3ZKcVFWY05YOWc5dG9TY3g0Y1IrNEtYU3ZCcU5HOWYxdm1wcXJHTzhO?=
 =?utf-8?B?WVoydEZLcVVmamU0RU1zUXpWSXM2czA3Y1NyeGcxMXUrMWI1VWZsZ2c0U0kx?=
 =?utf-8?B?ekpaQjhHS3J5TTRsWngwR1ZvRHUycHZLaUZONjkxZUFyQzdnSWFOckxOYlRt?=
 =?utf-8?B?OUVtWlMxM21CaWw4Y1lydWNRY0xZK0Z4VThPc1A4V3ZMOFBpYU81STBOMTRM?=
 =?utf-8?B?eFh1Uk1HRmNwWDFmZytkZWhnaHhaUVZlWm9FRzFJMVk3a2hZWjl6UFZ3ckFi?=
 =?utf-8?B?MnFOdHlWNzdtSmpES0xRbHp3dXk5T3hqMnBPQ2x5dFd6N2lBaGU2RTVwMVpK?=
 =?utf-8?B?ZlA4Z2NGUWhubjY5UHU5WUY5aUxQbjJRVWFxeGhlNnRPV3JaN1l1SHVEeUFz?=
 =?utf-8?B?WlFHT2JNNk01b1FrcTUyOWNvTXhEakRVdVhXUnBZcy9kZmMvVVBjVzNrMUhS?=
 =?utf-8?B?OEJSVEZleVZLY0V2MFM3TXB6UlE1MGlrWjhGaThlQW9VVFBzMmZLK0lKSTlT?=
 =?utf-8?B?WnVjY0xOSG90Vkp6M1RBbnJJcW5uaE1XY2dtZDE2bzZGckxTT09GOC94STZC?=
 =?utf-8?B?S3pOMnVjVW15K24xVmxiZmxLTXQ3dXQvVmIySTBzMWZZelhodmdtellhS0Vp?=
 =?utf-8?B?T1FtL2lnTTJxS2ZJNVcwcVJTdWdhT2x1RG41UVFVcHRoZml6L2hKM0FJc1Vh?=
 =?utf-8?B?UDBnM0dTcGlLSGxnUWhwb0tuTWZZUmFiTnZnTTA1RDJkMDVzaXJwUXBtdThi?=
 =?utf-8?B?YXJvd2FudFNWZ3ZXazNpMTB0dno4TzZrekNVWDdxVWl4NEpETWM4eTFZSVhx?=
 =?utf-8?B?clk0SC81VWplSFJIb3RiVkZqUjJsZjkwVVE4M1VaVk9aeWtsamxRamZGa0xF?=
 =?utf-8?B?SHBFVTk5Zk5JeDhiQTZmSDRMbSt1ZzZ2WVliS29rR3ltdHpCYjR6QWJkT0Qz?=
 =?utf-8?B?UGNneEpnbHhjZzIySitQblUvQ2h6dTV2MjVFZmVZdmJYZ0xmYTVrQUt2bWRw?=
 =?utf-8?B?akZCUklQUEg5WGhpNDJkYzRZaTZmVlhVSFhZZitwNkhkTzJrb2lEQXpoNjVs?=
 =?utf-8?B?bnpUR25RY2pNekFoM3AycXIvUmZLMGJhOTl1TGZqVk9YWXNma2dQWlVRTGt5?=
 =?utf-8?B?M3ErbElkRFh0V1p3ZGVyeHREMTZUNmI2MEZzVm9qb253TFNaM2tBVEtIN0NX?=
 =?utf-8?B?SmpYOVRqYnFKR0F1L2w1NDVhL1grc0JRcjBjTUFOR2REekh2VlB5NlVhQ0Mw?=
 =?utf-8?B?Zm0zLzhSWWVYcm5GeEpNdUZkVzlReGFjRmszRGhsWkpKUUZhT0JUV0dXd0xM?=
 =?utf-8?B?K2krZnV0NjRvTTJidnNXWGRQdFc5NWgwRTQ0Vml0a2Vvb3h5K0owRVExeUJi?=
 =?utf-8?B?eGcrbmxYeXMzeVNQMXhvc0lWMkx2S1I1SFkwSmNhOGJLcGZyQW9OclNWck5B?=
 =?utf-8?B?WHNneTIyS3BXeXRveFE2ZnEzUzYvN2h4amplU3pWMTl5MGpzQW5SV1gvSDZU?=
 =?utf-8?B?aitRUTVqcnU2L2syemVBYy9aSERkZmRqOXRIOWdqVDR2ZlRzNk4yRXJKYVhj?=
 =?utf-8?B?YW45RlR3N044TVE5eGxNb3NnelB1emJwSldQY0JUVEsvdjBGY2R1bzdsbmNY?=
 =?utf-8?B?U05Send5b1Bjd0VCd1I2MFB2YUdDdXNIOG10YmE3U3V6V1BVaWNkMGJOOE5T?=
 =?utf-8?B?NEt4MCswS1VyQnVmb1ZRbzNwSFlWRWZCYVZyZjlKTi9BRVI3dWRxWHh0TWZv?=
 =?utf-8?B?R2g3Rkp5VlJFNlJkd3NPRWNWWTJwckVoRGhyWGxCRXdJa3hBUE9RN0phM2hM?=
 =?utf-8?B?aVJQS3cyckxsb1RjOThPRDFqL3RodVF4QkJzWEx4WURlTjI3Z3JDT3ZiTllL?=
 =?utf-8?Q?7xEtLIoovC7JJRgg=3D?=
X-Exchange-RoutingPolicyChecked: n44R/1Mh1FgbpzmgnmG79o/q+qHlCo0K1BC8WCjNvHeeDfp2hcZn74qNG/Sp5ykrS29jY7Q/1MxTjTdlKZxTOlVG82zibJJYFaHVtd1t92sPpwz1mPicDUw0KU1j1uoricpPgF1CYAgMgnaKUn7hN3gCeBoeIS0on7LRU+J9XgqCDFo+HKnCqe8insUcryABK7w7qtlRB8UNPAY5e7cwpWn36ugihKWfpF7xkEApOCCg16YSFQf/pxkEhKpZijsVP0DXctFtNnB/2i9r/ib4RlZemndyn/veXN5H3ZtNGnvob3viFc/WgoGuObuN+g8SxocO8vAsW4NYY4cELrZb+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd529489-96c1-4cea-d57d-08df03256e3f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 03:52:21.0970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I9q6xfiRFKXEs10r/JwVd8D3UT9GcFjKKBffcFJNxhiBLZbXgiajnP1E3g7+Na5AxvhS38yPpP5mqLyDJ6QY7FxcmA2B+XLWMfhRaNFs72k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
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

On Tue, Aug 25, 2026 at 10:28:28AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>The mailbox PHASE bit in SYSCTRL_MB_CTRL is toggled per-message and
>was tracked in software as sc->phase_bit, reset to 0 on error paths.
>If the cached value ever drifts from what the hardware last saw, all
>following messages carry the wrong phase and get silently misread by
>firmware.
>
>Drop the cache and read PHASE directly from SYSCTRL_MB_CTRL before
>each frame instead, removing xe_sysctrl_mailbox_init() and its call
>sites along with it.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Regards,
Umesh
>---
> drivers/gpu/drm/xe/xe_sysctrl.c         |  7 +------
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 22 ++++------------------
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  1 -
> drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ---
> 4 files changed, 5 insertions(+), 28 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 1db20be8158b..62ccc9be71b4 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -85,7 +85,6 @@ int xe_sysctrl_init(struct xe_device *xe)
> 		return ret;
>
> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>-	xe_sysctrl_mailbox_init(sc);
> 	INIT_WORK(&sc->work, xe_sysctrl_work);
>
> 	return devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>@@ -114,12 +113,10 @@ void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl)
>  * @xe: xe device instance
>  *
>  * Invoked during system resume (S3/S4 to S0) and runtime resume from D3cold.
>- * Restores SoC remapper configuration and reinitializes mailbox interface.
>+ * Restores SoC remapper configuration.
>  */
> void xe_sysctrl_pm_resume(struct xe_device *xe)
> {
>-	struct xe_sysctrl *sc = &xe->sc;
>-
> 	if (!xe->info.has_soc_remapper_sysctrl)
> 		return;
>
>@@ -127,6 +124,4 @@ void xe_sysctrl_pm_resume(struct xe_device *xe)
> 		return;
>
> 	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>-
>-	xe_sysctrl_mailbox_init(sc);
> }
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index e13eebaac1d0..72baf1aa4b3a 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -145,6 +145,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 	struct xe_device *xe = sc_to_xe(sc);
> 	u32 ctrl_reg, total_frames, frame;
> 	size_t bytes_sent, frame_size;
>+	bool phase;
>
> 	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>
>@@ -153,7 +154,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 		return -EBUSY;
> 	}
>
>-	sc->phase_bit ^= 1;
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	phase = !(ctrl_reg & SYSCTRL_FRAME_PHASE);
> 	bytes_sent = 0;
>
> 	for (frame = 0; frame < total_frames; frame++) {
>@@ -161,7 +163,6 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>
> 		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
> 			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>-			sc->phase_bit = 0;
> 			return -EIO;
> 		}
>
>@@ -169,13 +170,12 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
> 			   REG_FIELD_PREP(SYSCTRL_FRAME_CURRENT_MASK, frame) |
> 			   REG_FIELD_PREP(SYSCTRL_FRAME_TOTAL_MASK, total_frames - 1) |
> 			   SYSCTRL_MB_CTRL_CMD |
>-			   (sc->phase_bit ? SYSCTRL_FRAME_PHASE : 0);
>+			   (phase ? SYSCTRL_FRAME_PHASE : 0);
>
> 		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>
> 		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
> 			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>-			sc->phase_bit = 0;
> 			return -ETIMEDOUT;
> 		}
>
>@@ -321,20 +321,6 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
> 	command->data_out_len = response_len;
> }
>
>-/**
>- * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>- * @sc: System controller structure
>- *
>- * Initialize system controller mailbox interface for communication.
>- */
>-void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>-{
>-	u32 ctrl_reg;
>-
>-	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>-	sc->phase_bit = (ctrl_reg & SYSCTRL_FRAME_PHASE) ? 1 : 0;
>-}
>-
> /**
>  * xe_sysctrl_send_command() - Send mailbox command to System Controller
>  * @sc: System Controller instance
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>index fb434cc165b2..f0d5e3d7f5e3 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -26,7 +26,6 @@ struct xe_sysctrl_mailbox_command;
> void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
> 			       void *request, size_t request_len, void *response,
> 			       size_t response_len);
>-void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> 			    struct xe_sysctrl_mailbox_command *cmd,
> 			    size_t *rdata_len);
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>index 66ba24f43017..98c2f473f7c6 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -26,9 +26,6 @@ struct xe_sysctrl {
> 	/** @cmd_lock: Mutex protecting mailbox command operations */
> 	struct mutex cmd_lock;
>
>-	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>-	bool phase_bit;
>-
> 	/** @work: Pending events worker */
> 	struct work_struct work;
>
>-- 
>2.43.0
>
