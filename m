Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DFCCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 19:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FADA10EA73;
	Thu, 16 Oct 2025 19:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0vOsAGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0612910EA73
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 19:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760643229; x=1792179229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oBUYNWVzXxJxy/Hr1xjSodGW/1yCSw5zt8wrsfwTIwo=;
 b=j0vOsAGDPaNlRywN+qjpy94mUaq1fay1/xMDuUu7OOQcX0irEIMhc0/J
 JwREGiMYmaGMBhdnGi1kgnj539z2MgNB5E+Ekc5ifcIlv9jg7jCefJuL0
 3/Jzmnx53VsubZGUfnyS8lz+crebwpBd3CjiUDD7c8GT5kw/8K2x/nRqi
 jpPHKt4FJKlToCs/7z9UtHJTwhIMK5rfzcws31nLY9zVVwWo4kv2KUNgU
 hTC0UtWlrMgYO5PwGUSrLGf/FOpYqc2fHzdrRHr2glQxFDhj6pWWxPJ0A
 vjvify55xhh8+FZgxiRP/POP/F2EVjUJPL4v91qVQNMc0QHp9ffclvEYb A==;
X-CSE-ConnectionGUID: bGrxMyN3QsKkSzcuNxNU1g==
X-CSE-MsgGUID: 0IncEBdtRg6zud0wM+AhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="73966426"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="73966426"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:33:49 -0700
X-CSE-ConnectionGUID: LxF9gK1zTtKi5Jd45Lel7w==
X-CSE-MsgGUID: Pk6XJpeVS0qBFgAAf5sbOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="182223454"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 12:33:48 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:33:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 12:33:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 12:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtV0/YEeu+350c/AkFVESG1JWT8P8pEjOC/ELnuNH0xFg02TTb5bPU2PDCqoIhIKgpDEFmKUFzp+1uD8Yl8Wuxv0f3sY6BrFUljvgBPNPJogQjZ+6O9+ZNMHp2t++kjdcKlfuME2JmjLp7RkRr2EG9CFa++B0AxhOI9Q6fQdVUT1IYi+JlLQuxS3nQ3S6FzI5F2uH7YFa1su1G3k1KDoTjjfbDZ8y7Ab1qe6pMbD9rUFVVmAlhAH79BeL+CvsgD4aA/gZRsGhwAX+OasgFekkqGKgn5j2Cm95RGHFd319c+dP3V9ifMi74TGXU1RUt4CCA3xpiJXcvtcnosSYqEtkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scPq9RRKr95BvSOmpnfvFwvFIMmOubEMgW/3OClCjVo=;
 b=KZwgDwtJn2jlQOfEVlPGGjHKBIpIg7eKQCwGKWsnGu20PQzHrb5ygXL/ql0uNkbOlT/ATtTKC0jeiA09uTydLrOc0GMLALtJpYLn6mCuXI37jVSrtg5SDCN7MnjzrYfnmiaCzCmHGasLLKRUEuC2KPV43o9ckjfhY/l9DbMVxQFksrZKYLeUH145H1DCiWOddD2psVwM71Etrnmcj4ZUsbz+nNK+KffgWc6M05IMTKUWw2BFqQEw1J+1+Z4Oag9Y4ONG+8SNTJx+I23Ks+FPAuBansgg37S14Fw/dYC63R/GWeSN6dQwwnNXbZXBABKI3ljg8LRRvBTH3/L7GqT1ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS0PR11MB9504.namprd11.prod.outlook.com (2603:10b6:8:28f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 19:33:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 19:33:45 +0000
Date: Thu, 16 Oct 2025 15:33:41 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Change return type of detect_bar2_dgfx()
 from s64 to u64
Message-ID: <aPFIlVSfcIyiynIc@intel.com>
References: <20251009230239.2830207-5-shuicheng.lin@intel.com>
 <20251009230239.2830207-8-shuicheng.lin@intel.com>
 <d177de7d-a98a-43ea-88ff-f52d8349d22a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d177de7d-a98a-43ea-88ff-f52d8349d22a@intel.com>
X-ClientProxiedBy: SJ0PR05CA0149.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::34) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS0PR11MB9504:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d87e50-133a-4ae6-e720-08de0ceaec07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jZMBFqPGMiG+AXauoo6leguosFTjHrdH4fwYKEqrqb5jg/FkVULyp4iudqM5?=
 =?us-ascii?Q?tuklNYmdhRDzFiREcn3nt8A043HDsjVxv5Usa67yrYJ9x56p+S4KU96wyt59?=
 =?us-ascii?Q?YjXjvg2q9sVuOfOA7UqPcUHZ03RwSOfQJlm37LevOZFMLHoREmlXmoSVROVG?=
 =?us-ascii?Q?ZzyY9XnZLSRXd0acEcc2NLJocj3DvvYUhcktgGI+mij1pNV6gNNhdsgdzdB+?=
 =?us-ascii?Q?ryX0v72eYFWWM3eVvz2ndA31OogvEf5mMwzP9Sj/pMtrmpf17MixNmGA52fo?=
 =?us-ascii?Q?wMmDe6UvK+eUTLjiTTWh8OVa3K/bcptIL+apjy+Qf1PDOoww5Awuwvbvwouy?=
 =?us-ascii?Q?IyJKP/CWJpitXgroKjthckNzsGRUmVbQgQf06irIvd06Cj6q5AJ40yww1L2+?=
 =?us-ascii?Q?VY0bSKfu4FZ5u8HcU/gT052Hbp3Mx36kLx5AAQ2YdrQfpcW5J/mu+Pf/ynfM?=
 =?us-ascii?Q?bozWbSG4kUJzfzDPCOzh9+Z9kfu3yoKuaCBzMxZnHKiAD/r4ByCOS42I0srL?=
 =?us-ascii?Q?TFYDs+sW35BsVyIo7UCLeNCqbObXOl9ycqXG2gsVhBowYCZFXMnSQTgU6ypA?=
 =?us-ascii?Q?gBpIk9oLuKIHeftrt8iuRgmM/lT7xE2QY+ky3+pKU2oa+yqRoIllziK4hAtG?=
 =?us-ascii?Q?viGq1pjrh0DV6gXlfN/5ZD/3B6/cSSITiYpn7oDthSI0xbqsHqqCHCOkFpJd?=
 =?us-ascii?Q?8loIwYAWbGQD1O9mOp1naB5ckFr6a+9OW76RyO0f+7bkcZlB/jt8LuSO1K+y?=
 =?us-ascii?Q?DFp4p+qWerjwhrchKqhsw808qMTChZNorfjzq3N5ZSITvRI2H0tx65K8a364?=
 =?us-ascii?Q?6CYMyi8rfcAhbFdKkgbqFQi1mJJ7AsbVvNhTp57okB7e0LGfnSvZzhvvmpti?=
 =?us-ascii?Q?35k4EOaLo+sm8DB7tz88QwQCTdV/q20ObCdlzFybj10IKchX5VcR/iqBojKI?=
 =?us-ascii?Q?dGPFjzftw+V40Ve/KXHqOl0ZJCqYmeIcgJlT4gjj2KVGZc0rDNmlFRY5/Ohj?=
 =?us-ascii?Q?reasV1ezQjrhpPWFNlgJhhc/FP65D8igaLAqT2k8AB1BsE0H2OFCIzQ/IyxI?=
 =?us-ascii?Q?CLjpStReZHwLPHoHaAunXRfZ6m1C8VRrfPylwOt1/B6Qx9xYmi3bB6hoV4ZN?=
 =?us-ascii?Q?mTRsOFNUM1jT4+y93nqR2OK1QwARPNZM/fUT2Jnqp2Q5/46NOb+D+DMwPwcS?=
 =?us-ascii?Q?L0jgYZI61KXzVUBgiZWInFapBpScWVhnWfWtqvmpAgnWHPN9GvVttyZf/ysK?=
 =?us-ascii?Q?ru+NcxNkHKhAiKjVym0zeVlyp0wLkduQkWvC2M66XwcsjXBFimLw5Jg8kUAh?=
 =?us-ascii?Q?IicGNcox4flxXgfGTYkDIWuGGL9BVMK7p1ZxpnCIMommw96mrXlbKhBfLmh3?=
 =?us-ascii?Q?vVlL0Ldc7pGm4OxdqCjLWqLilS05FKEcKxrmh1t17VDiekjAqA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I4BkL34lHSz1f1/s/rWu6KRAbzgBEd7YZi7Mc5xGgu8yCj0Ssrt1/X+HlDhv?=
 =?us-ascii?Q?GOgqdli2fQ6KgGvEZCf1YuHS9wCWmqL+bMz9VF0njNyUzeW3Q/a4rQ0I3olt?=
 =?us-ascii?Q?KUYNbpObydMBxYUmFsRUzN0vRAqlrLO/TNsBns5bijmDR719tDlFVllulwkz?=
 =?us-ascii?Q?vEbhK9nyZfZUXapHGN39B/5axHgaC24ts+hhXBUG/6zDEl1gkH3aw+EfhcGT?=
 =?us-ascii?Q?GxJzrIY9qGJpAKd2tbMn4sNTXn+Qr9JjZXXlUPGnIO4X+CfKb8HS5mE+U+zF?=
 =?us-ascii?Q?4/5uaUSgDI+QjnY8bKRhazZ0a/y8ZLKhUKbtpsGHgAbtrSGIJxJPU23gDD1r?=
 =?us-ascii?Q?EO0Dlt67co/KFdc5obTJDZO6NN+2Jllum41jbXNzqzEcyzb0TpBn0YmXd/06?=
 =?us-ascii?Q?WL3uWgl8xGBXXzgD/MBjmFWpIcdBirba7hpy6/3UlchByxg3Tz0mQOuaKGhy?=
 =?us-ascii?Q?xbjNFlDNMfHRNLV6CtpUCWs+Opk68Yk2YEvprIBBuTZ+4nP2WSn3A1S1DWX/?=
 =?us-ascii?Q?ZgoZ3RcgEMOBhUYX0tQWS2lIMP4AtPmYpknGTisBKdIr0wvVzt6hbOdyQCxT?=
 =?us-ascii?Q?naoJYF6JXssFoJhrUiGCzLjbmXZCTrce1LJVuPguB+cnyt9p208uGf+fDRAr?=
 =?us-ascii?Q?GzjnRTeB/fCiWI0T+Eg1IuFjWzbuXTOZnaKRQnV4IVNlDyT/TqJFgURQsy4A?=
 =?us-ascii?Q?S0yyVwSXemSNX/yxR0m0hpGx1388B9VyaWER6uDGwKXf9oo3U1bcb2WPGi0P?=
 =?us-ascii?Q?3N2si+3AdxswZTqrwVJHSeNbZl5tuF8uv/FE2izsUXnF6KBjweVWL7Ff3DP6?=
 =?us-ascii?Q?0m32KO7rgMvQGmL/8rq+L2yU/hGXaVqR5T/BoF/U2XTrN8K53Ip8x++Dy/wv?=
 =?us-ascii?Q?G72VFE6LqLElaIKzoaWqAZr8/u7tlGV+wKeVW1pxJzPN3ol/POkeg+wh+j+r?=
 =?us-ascii?Q?Bcd9rI4ioNM0hUj3UMNCKKKaEYQSUFusgDqojdAm4D7F92F/8+HM4iXmfyZ8?=
 =?us-ascii?Q?MChvcvZmfCW4koPMyvP5DQse/vygWU16O5MU/zE7WBEra+Q42H8nNPv6dCts?=
 =?us-ascii?Q?7Bh39m0rm4YFfGUcNzkpFXeGE7PtDAUZW8ZYJsDOmbcle1pcOuT7UFEb6Iwu?=
 =?us-ascii?Q?AmlX4q2uKFufpD0HMyZjeGqxyx7zGkmHWPu3VE0/5+4nj/YF9+fUrsxWR30U?=
 =?us-ascii?Q?5F6bqcv2nhZ0gGVDfBHKs9ggHAGgatfRx2ZjPk8C0/LnXP1GBCEWiIM6+Fh3?=
 =?us-ascii?Q?hAX9hS2n9ttr3JckE7/RoQHz9geB7tF5OFHCeDKQmJ0QfpqSbOkz32vlkHiP?=
 =?us-ascii?Q?vkwD83n3D0Q2XnZSeH91H/s7tazibJnEMCfj5rMIyCo1YtT2Kz9o4PinlBy9?=
 =?us-ascii?Q?niPTlqH18EoUmEdEQIwMoyLN2RGSHOp8elLkto8YUSWPv7AK8TP2TsNt6fkg?=
 =?us-ascii?Q?hSicPiLtZPtGzuJ9EcqqDdUP+UJDxL4+R9ANSnnJ6qkSgO8YuIRiBGOHSzBc?=
 =?us-ascii?Q?PRXrXHGCB8HGAtalHwYhGAtjJ25LEXe8RRvmqgz82sz37Bh2Iovf/dLlDNug?=
 =?us-ascii?Q?V5pYnltwdgNI0zn3U8La5n4vBoraVEbKf2YCdafsvmf5HTRPa6RUicQksNmh?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d87e50-133a-4ae6-e720-08de0ceaec07
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 19:33:45.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtUpNjBwZNrVsMsP8euVAAH7G71dwzDrXbkhpIo5o8QJdFhNf8hxmZI/jzaTfHwJQ9LhdVJVPZ4FLODgAzMHbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9504
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

On Thu, Oct 16, 2025 at 10:57:40AM +0100, Matthew Auld wrote:
> On 10/10/2025 00:02, Shuicheng Lin wrote:
> > The function never returns a negative value, and the return value is
> > assigned to a u64 variable. Use u64 for better type correctness
> > and clarity.
> > 
> > v2: add assert to catch theoretical negative or zero stolen size. (Rodrigo)
> > 
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 9b00bdc8ef1a..e368b2a36bac 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -81,7 +81,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> >   	return wopcm_size;
> >   }
> > -static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> > +static u64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> >   {
> >   	struct xe_vram_region *tile_vram = xe_device_get_root_tile(xe)->mem.vram;
> >   	resource_size_t tile_io_start = xe_vram_region_io_start(tile_vram);
> > @@ -105,6 +105,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
> >   		return 0;
> >   	stolen_size = tile_size - mgr->stolen_base;
> > +
> > +	xe_assert(xe, stolen_size > wopcm_size);
> 
> This looks to be triggering:
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6359

And when I suggested it I thought it would be useless!
It already caught a bad bug! :)

It looks like we do need to change some logic now and
handle error conditions in this path and block the
code to move forward with invalid initialization.

> 
> >   	stolen_size -= wopcm_size;
> >   	/* Verify usage fits in the actual resource available */
> 
