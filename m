Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC7CD98CF
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jun 2026 19:27:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3867010EB21;
	Fri, 12 Jun 2026 19:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5RPa8sD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25DEB10EB21
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jun 2026 19:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781292476; x=1812828476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LQpwae4+fC2Vz3QxmFB5x0bG4lLVRdU4o1PlP43eIQw=;
 b=C5RPa8sDZAMg6UrGGG4eKGxzCJDH0RJRQzikmw1M2V1T7A/R//hFO69Z
 URusnZ9aHi+r52A626vsVaaE3FyDklGBCCY00oVufOz4XtNk4EZMmSoxC
 usHydEZSIyu0pI2MbIozeQTtHYs5usigv9kRQdAeWcaLa75HljGGmySfI
 e/ZDq5PDQV1S3/R+vNTE9gLjceq24Dd41Nwn3YS+4V8JV72iclUo8zGox
 QcsqKBk0brVWtefG8QTGgEBWBTmlBlIdTUl+j7ZNc/nJMDEtTJvaqnb6p
 L2VTLlU3SqkytB+b2fwaYFX8zOMn8tF39viu4vq0mzX/5JGUP2kVGuEpt A==;
X-CSE-ConnectionGUID: UY6TVtixQhGtOrNTLz5Zsw==
X-CSE-MsgGUID: IgmNoCyJQ6C+N7XZVziXPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="82037549"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; d="scan'208";a="82037549"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:27:56 -0700
X-CSE-ConnectionGUID: v7JqEbUDROGrRff07/x8fg==
X-CSE-MsgGUID: sB7IJPZgSKWZVcISyAn14A==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 12:27:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:27:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 12:27:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 12:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIbHwcXPpAfos4P91FCeXa4matUdlxI2gYpPvHNMRwkglgtKUNeWvlVSqxjbjA3DgKHAw5FSl8wJwUm4S/AAoU5sb0lpXbpekVdAyOmWgCBRjgqG93GDdsM7osXvcEliUDHGO5YenpP+80XVb1e2FqeS+vPkUTV5GN18+/Tj1K+B8bG6EXuqSB8TXwiGB/asB+atxh+8HLNoQx+QXbz6cf3Nw7Ut6CZ72m2SxoMvzGPhLgm4u8aDQzMrs+6G76YtV3CHmQK1otwg/zZGj0tZEsX//F8kLh++cDHImimsm6W9xBV/b3/0iiczzNNEZqaQIimM4XD3umhMfNtVFKgl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hmuz303+MO9HzM+VXvDxXl7O6Wtb8GTrIFws4kbZfDY=;
 b=Rpuv6cK2ndUaRRsHlUEgMpEPnE5b1Pk9TI32D+LL9uVoB/KHrWdH1jlgqUg6YwKz2lJ/8QIUgFapfCxGEkQE4TxWWdd0cb4FemK7NB8c/O3Df292Bz7zKHOzPJc3yiIjho0XEhciRxDSnFoh9vEZNzOA8MtElNZAy5JtApSbjo3qtcXY1X8TWTP+miRz+kGGiMQT0ZcPVV9i+QxCAvBKCuxKfnQOfRV1vnoAoAeqv+vASt5K9GhX9pxgAAtgJlnPcKsoGn2FoSiazyVPp9IbaAQn2M5aNdWTMU5YVHkEqVT7LsDbSweqFXIWPGjxmIIJn7EjRCjDWm8uIDFe6NfHCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Fri, 12 Jun
 2026 19:27:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:27:50 +0000
Date: Fri, 12 Jun 2026 12:27:48 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/9] drm/xe/rtp: Generalize whitelist_apply_to_hwe
Message-ID: <aixdtFtj9IwnVsQE@soc-5CG1426VCC.clients.intel.com>
References: <20260608223624.3711760-1-ashutosh.dixit@intel.com>
 <20260608223624.3711760-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260608223624.3711760-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:303:8f::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd97a70-c55a-4220-bd7f-08dec8b8b0e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: Bie3x7o84b7jt4hmefc2GDp4rfXE5A98mfsQ7fWpVVBzmo7YWX3HuVKfOMd/TfuI5VuWSz+kJTJhgRiG3UYxd2F9HoMO7eQkql1b/RZDrT2dmi+2te0/gBcTm+4ytgLmmN6mDs++sKdIQd2N/kLp6i5PZCee4gqiNBOu8N7LvBL+Gk6MWCnoYmZn6mctAa9qwRhRlN3BJ3bFx8ekN98+Nml5eX9stbM7xnwijiv+SF017zeY2gMx/3Hz6NoGgLhgb91ewdRp/EoejtVvfG9uNUe1wawbeX0c5teh2a2/cD417hXuZkEzP7jUWNiyZ/imRIrUiGKChR5JFADpYZZduf+p3FLSmZV9ZaDlq6VzLgMSzpAfwb+JFXQXmXMZuWhcaXSSfIAm60pQV0DNkIBx/WQ6AfFAVC9S29UKbAQp1MKO/+AWAcH9Q/Fr85MZEiWTS7mijhkbNB88Yd8daAHdwyZDJ+HW5S/HQhuvGNqEn1SXs4Kn7peCdFEDgWS3hMaeVmwpuedQ+i912KuCxcedqogaff7uB1429Wd4FNd5AV9mSLE+Gd5EX042wAARlaf4+l4Ae1M4gnAPfHcOBDR0yH+dRlY2QMV2jxFSpMtZIAjqMvPbXU4W/i3t9P0XT1gLCFUHdBUGZtNm2PtD89IvvsIzdWAPozl+W7Yq5dmP5GzC0XrYXBib7T5UayJK8jrv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEk5OHRzenBHYnZ2ekJaenNTejRQYlhiazdpcjJPK0htMHlrWFlSa0VZbzNj?=
 =?utf-8?B?YXlFM0t5ZXdscnAyemtxZXpRRDBoOVVZS25IRVAwellCTEdsQTUrcTFaV05Y?=
 =?utf-8?B?cXE2R1k1YUFiSjc2aTdZM20xMjUzV1VSUk15SGRzcXhJTmFsZ210RzFQN3F6?=
 =?utf-8?B?QUNFYUpyR0lTS3JRTzZSeFpIUmZoTjlOWlJGcTN1cUU4cGQwdmJ0N2ZuRW5W?=
 =?utf-8?B?YnN4UElhTGoyUWt5NTd2YVNqRGFBdmFUSXN1Z1VSQ1RpMTNWOWxLVlMzWWpD?=
 =?utf-8?B?Z1NKR1ZVa2lOVHpDRk9ybnc1ZkthMXZuMUZSU3JYL3VtVDdNOEJ4dlArYlRI?=
 =?utf-8?B?UEE2OXp4QkRjRzdhZGRKUmpSa0hKdEtVbHpwR2lFNGlnckJWWjkwa0syT3ds?=
 =?utf-8?B?ZUcxdlZsUThKNDRsMXFZTmRsdEtpVWJESkcveWg5dmNkLy9PbXdaUjZ1TmdQ?=
 =?utf-8?B?Q3laa1h5WmoxQkpzYlpTam1MdFVjM1AxZm4zUHRPT3RhVWVOZVJuT09xMUtl?=
 =?utf-8?B?UEoxVTZCNXUvdmdYR3V1N0FQUUN5YlFRRkE1amlHMmw3Wm1PQnJOYnBFWnJ5?=
 =?utf-8?B?Q0o0NWVwYjFCTDRjcUU5L2JJdk9vZ2drWSs5QkVZUDFWazczTTdyWnlGelp0?=
 =?utf-8?B?dkYzVnoxQjlXOUNNSkZuYzVvMUYwZFFoUFpEMlRYdFZoM0hYR3p2VmtZdUx0?=
 =?utf-8?B?UUU3K1hhUmFIVTdpQldLeHZCejRSSHFoN2wzZDhKSnphRndjcW8rYnVlYWFI?=
 =?utf-8?B?TUNkbHMxMUx3eWpkZEk1azRPbk54NEdQdzNTTzgwVlYwQnN4bkFWOVJSNG82?=
 =?utf-8?B?cDJqWm13NXZySUxSQzF0Z2U3U2NKeWE3cG9Od2o5cnlIYjZBVlZCNk94SkZs?=
 =?utf-8?B?K0gvNGV4MW1DRDVGZWtWMFpRYmltWG9jQ3FYbW5DSE14Rlg5K0tZSXFZdU9U?=
 =?utf-8?B?Z3lkZUxxd3dteFhRRzdHdC9zSnBvdFY4d2VMK0lyL2ZQSVRab2ZxS2cvdWpw?=
 =?utf-8?B?eWdRNjZvUklVcHVPWGNFL0JUYjd2N0hpdXFNQllhc0wwdG5Ld0ROUHNQRUZa?=
 =?utf-8?B?aE56enNLTTVicThKQytNK2VubWpJY1AwYm5lMWRHVlRkbVJReC9GVTcyVXFG?=
 =?utf-8?B?bS94K1l0QTExRTFvWGF3KzdJbmZvbnhnT09EUnJaNnB6Mi9vNHNNby9tcDht?=
 =?utf-8?B?cmJLM28vUVFMZVRFNVB6ZFAveFhIU0t3dG9NZFQ1UXFzZzJqbjl0bUozaEYx?=
 =?utf-8?B?MkErZ1FQeG0yRFZNUGV3U05sZ0NZckxIbHNuUXozUDlzY3NPUWc4YWs1SjRR?=
 =?utf-8?B?dHcrUkMwUHdIdEo1R2RHVTBPSEk5MnkvNkVXemJiTkhMRkw2WlJnRWgwK3ZQ?=
 =?utf-8?B?K0d6OGRvTGtUdkt0WjBYOUtlOGRTN09KK1BPaXRRNlY3ZGxNSzI1ZXFBaEVv?=
 =?utf-8?B?UExqWW5ZTlNqZVNTUzk2ZXRMSW9kbkRXUCtGZ1ZlUlVqc2pRWWxiK081SE1Q?=
 =?utf-8?B?dEVrbXBJR2pKbkg5ck9UTnM0WGpQQ0RaUE1LVDJIc0V1T3V1NVp3b0JLS2JI?=
 =?utf-8?B?ZUNDUGhPUGRCcml4ZC9WenRWNlZ3NHF1RjFla1pHMGJ6aVNOVFJiaW00KzNS?=
 =?utf-8?B?alJUb25JWnlkbXRVMURwYys2S1VOakJFRE9rQ1U5Y2xtZzJRd0FoSlVmWm1Y?=
 =?utf-8?B?QTNOQ1BOelJrUHFIalR0YUlELytMOTZhamNrdmJpRDBmbW9OK1ZPVzJZVmlG?=
 =?utf-8?B?d05zckZZT052aE4yQ2dPVG9YMkVJYWE2OTRoUEdKYjB1NWpDWVVVNnQxL0dr?=
 =?utf-8?B?ZkNMMEd6NzF2L2czdVd0TTFHMHIwWHk3TmJtSXpBU2FaVFlLaElnTGpQMnl3?=
 =?utf-8?B?ejBEdGdVckxNNWloWkRjaWZnbWNIbnl2VWxCR1VqdHlKakhBN2F0N05sQnVF?=
 =?utf-8?B?WHVzVkZjeDF6Y3pwVElPbE42TG9NcFhtRmV4RnpuL2hWcXZNeGxRcy9DNE9V?=
 =?utf-8?B?OEFIUUg1dW5xaGkySG9GYlBlK2xsd1BOR1Qrb3NnMTJjREx3RERaK2todE9I?=
 =?utf-8?B?ZmJEUTNMc0hMRE5rVWw5Y0d0dEN3cG5LUGNuNUZlQUxDaTQxY0hxUlFxWThH?=
 =?utf-8?B?VEd0RlJTMFZmRjFtalhKMXdUcmd1a3ZPSkNXZHk2eW1YcmtJSmpWaEVSYlp4?=
 =?utf-8?B?WGNhQmV2bGtFVEVuUUlWQ0tNWk5ac25iNzd3c2lGanlySk1ZV0R0U0NzOW5z?=
 =?utf-8?B?QzAzVlNHSlZVYXdVOFo0TjRleEU1Yzh5T1ZKcXV3eEt1dGFITzNGNW9WNWV5?=
 =?utf-8?B?Y05STGJVOUk5UEdqdWEwNzRMV0dTVi8yYXNjSXN4Q3k5cEFMYjNpUGdCTU1p?=
 =?utf-8?Q?WtEr4+giENLlbYiM=3D?=
X-Exchange-RoutingPolicyChecked: DjPe4rnKLnZSv1ROXxQ9iI6n7e3mKl1VMqFHvXyHDEgjrKN8avOwoCwtZjyTUBWxyFmzt/FrKPpsQWpJHGVbA91GzfSKrOVkHHWqBzkR78BVVQBqlvHV7oRDAJbHp4MHed++aDn4DxqoHu1NIkc06I/KlwfEUCwt9PsTB5/0W/OPBTwwI2yYs330Z/Y2G5SFsAOx+mKgL8X2iQOsRlQVIYUV+vTn9o7aY5cNeI97BOJnGlxiY45R1KFg829Q3iH+FnJ6OCwP18raIym76dIpQ93wwnRmJVlckTdGY6eZFNkFyHLbEy8JTDObibo2MZuHLdd871vDL7Az40ngGUSLmA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd97a70-c55a-4220-bd7f-08dec8b8b0e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:27:50.1244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yu5ggUwQL+CvehgbQ62zZxaUXAoqQLsOkKtaiehOUEn+/6aBiVtvUVayE5OCiax92mU6hgpHY6etvBKmKBNQnJiwe+MGLBAZKhIFav36U+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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

On Mon, Jun 08, 2026 at 03:36:19PM -0700, Ashutosh Dixit wrote:
>Generalize whitelist_apply_to_hwe to construct both non-OA and OA
>whitelist nonpriv registers.
>
>v2: Rename slot_in arg of whitelist_apply_to_hwe to first_slot
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_reg_whitelist.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>index 571a8e6909422..0c01e289dc4bc 100644
>--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
>+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
>@@ -161,9 +161,10 @@ static const struct xe_rtp_table_sr oa_whitelist = XE_RTP_TABLE_SR(
> 	},
> );
>
>-static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
>+static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe, struct xe_reg_sr *in,
>+				  struct xe_reg_sr *out, int first_slot)

Once you start using hwe->nonpriv_slot as commented in the previous 
patch, the first_slot parameter can be dropped.

Umesh

> {
>-	struct xe_reg_sr *sr = &hwe->reg_whitelist;
>+	struct xe_reg_sr *sr = in;
> 	struct xe_reg_sr_entry *entry;
> 	struct drm_printer p;
> 	unsigned long reg;
>@@ -172,7 +173,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> 	xe_gt_dbg(hwe->gt, "Add %s whitelist to engine\n", sr->name);
> 	p = xe_gt_dbg_printer(hwe->gt);
>
>-	slot = 0;
>+	slot = first_slot;
> 	xa_for_each(&sr->xa, reg, entry) {
> 		struct xe_reg_sr_entry hwe_entry = {
> 			.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
>@@ -189,7 +190,7 @@ static int whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> 		}
>
> 		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
>-		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
>+		xe_reg_sr_add(out, &hwe_entry, hwe->gt);
>
> 		slot++;
> 	}
>@@ -212,7 +213,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
> 	int first_oa_slot;
>
> 	xe_rtp_process_to_sr(&ctx, &register_whitelist, &hwe->reg_whitelist, false);
>-	first_oa_slot = whitelist_apply_to_hwe(hwe);
>+	first_oa_slot = whitelist_apply_to_hwe(hwe, &hwe->reg_whitelist, &hwe->reg_sr, 0);
>
> 	xe_rtp_process_to_sr(&ctx, &oa_whitelist, &hwe->oa_whitelist, false);
> }
>-- 
>2.54.0
>
