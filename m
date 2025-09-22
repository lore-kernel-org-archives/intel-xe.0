Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AB7CA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 22:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BCBC10E52A;
	Mon, 22 Sep 2025 22:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkIB+Ajf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513F10E51A
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 22:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758580055; x=1790116055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pcgy618Ff877qCV8TQLWMvU+nwlTckJ0XAB1U98NbJM=;
 b=bkIB+AjfzByIl5wtYkwdNPKM3aUdUxVR8a2bkFC1xLhPvkn2IrygvdA1
 ljnDrPd4kHAtVOwFgwA0OkdBWuEAWYEhonVZQsqs7EmwkO5frlaF8hP3y
 2kWjQgfyGa1b0W7AEAzpjWBKWbEueWx1VVeG+UXX0SfeC5aAspyZr35Os
 qJguTVpiKoZKPPEaSr9BpbagzxeXxlJz7bsh53/hEFrC33SA9honBiuWM
 h+BIhDhoO61TiXpYS9K1izeeIc5ishFMgNpDzfExH91xzrEwmHzJoeiOA
 b8DJMlpn7wYvsvWHxvc63cTK1MxXKU3wViH/89YkoKrMWirm8h4bRk6Y/ g==;
X-CSE-ConnectionGUID: QXV2DlSDS66HZRTEzmIwYg==
X-CSE-MsgGUID: XvHvU4GES52fn4NyZOLtbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="86289762"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="86289762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:27:35 -0700
X-CSE-ConnectionGUID: zSIRt9shRyG1Gh+fiC8n4g==
X-CSE-MsgGUID: zPUi9MUMTumnNqQaaycwzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="180980561"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:27:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 15:27:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 15:27:34 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 15:27:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0AtVWIBT0FUlyDxvrXFru88XqvFkkcy3+k0VX3YEX9+xNQfkD4CGRJJC6xcN8NZ1ypXuvO+tjaWE9N7Y8dsvtueiMsjtOGeoF80CI4Jvo9/vbVpNwPLjRX3NpTpBUGnEvj1aotnOQ0sSzn/SW59POuSgXq2+2Wklg8sN047DiyqBWszkAXWI3B1J7BzjzhBUfHXB/IfWmfh1MTcTddAwrIF08O7bJY354XA5iCaIEBVUPnIZcxijlSLSoW6UDKuOb4RPt4PUwqn0aeJyi0FlsdRIa1i5f/XBNn4fmOBKJYu5yUUXxzlUboGDHj5vEOXH2aqRiyXdQnleDRx2maJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zmodZ+vgbB3XeHRLRaoIg0+x69eQ3JEdnBNI4ZJxMHs=;
 b=ky0xrzgbZ0VxZ3d27lLRu5VfkcR3PEYP4FO5I3cDQg5DzWEMPut8dHXHEox4KAlTJzRYRNyixW7TUUS72SMliGyOdHoWV4hVer31gmUUCz3oQsX9APRforTJbBwRXo1LK3LqFT/tTJ+XE6fcy1BCG5kSgL1aP3KGCHoA5P21w3GQiL686yI66I2RYGADjYr1LvFnDM6dwgHDS7EEVarGmx4pbeZWswQZhfmQ/Ex9Zttsa3yZmk40/jV2+++dAEA0CEINDUi9xNW9z+InYjU0E5Cttp8pcJz0TxKzqFUoPaY0zHuQM1lxk7MJ6BgwFczTq2SSOPh9kGJaBUM7enyy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7364.namprd11.prod.outlook.com (2603:10b6:930:87::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Mon, 22 Sep
 2025 22:27:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 22:27:31 +0000
Date: Mon, 22 Sep 2025 17:27:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Fix engine class parsing
Message-ID: <pmpedh4uz3b2fpkbmrxhutrkrfo6vxkovhyuychdrwlir6bl6x@da4gwlw3awd4>
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250922221209.110737-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0021.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7364:EE_
X-MS-Office365-Filtering-Correlation-Id: d5b084de-c4be-4f82-df5a-08ddfa273869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CIemrfGT6f11hq52UsA2lSwKPDYo04RpB/s4YIebib3Qof3J1Yo/9L+5ai46?=
 =?us-ascii?Q?EuVGU7SoqKvaBqixm1DJ0ybNMulBP2fL7/0UGHR6Y8NN6mrL6JO1U0aH0viL?=
 =?us-ascii?Q?OwxwiVYGCnYlbWu9vzVBsMJ93Sf/oQ+dJZqnxrx19GFfYPPaHHqNUVUIBwM0?=
 =?us-ascii?Q?QulhQJKLlB4CeTaPYed3HaUgMXQYDL5o4xN0SW+0a7wPd5kimClf6EM+ahhd?=
 =?us-ascii?Q?AA8diNPgTALXoLd48cMf0/6UkRtVah5jO94EqoXuT0+B+ajPk/UwMvTta9KO?=
 =?us-ascii?Q?38w7Vo7hO23yMqRJRa+z6ys4ht2rEKQPEdGYj9VPCV55/Aksw8hiBOd95tNW?=
 =?us-ascii?Q?jB3ksVVQppqmpQqBf2+vYP5lIrHo9eGo1LUGURKQVAtec6+yHhris1idOtTW?=
 =?us-ascii?Q?GziSNtt6iYnZ+FzyrbGLxt1o+F9pBn2WWGRYZh2prVvwnI/WlUD1VJP7iooR?=
 =?us-ascii?Q?ZTDpvuH2rVT8ymJkYP2QZGFJnuTbu4t5QieoGyF1VGkXu9EzAvWh6YCv35+o?=
 =?us-ascii?Q?7E1gtr21CGThx+1KHCW6iJQfNR6RwYJuVEdHsDJX9AzkpQbEy772bBtXFPI9?=
 =?us-ascii?Q?QH3QduDo4OgoenYi7XizlKPadwsJBSvMhGSQXrl9J2hUbZS2MhdrjwWlov5U?=
 =?us-ascii?Q?1IFLZ64uDKPp3SaVTPCGB+Ks45mpc7tEe2r4g/sMKe99bsUew/riEKFmw6A8?=
 =?us-ascii?Q?TjOrJop4d/bu+Hsh7fclLS42UhMm5H9RkcndOQHlfu/UiHTQ+ZVBMlQf348d?=
 =?us-ascii?Q?+xPE6MxsKx9OsyBZL2NMEF8xF7Fe2T7pEO18NJOR5XQov3NXTvOW61Et7qkM?=
 =?us-ascii?Q?WYn470GefgY461y5C8kVn2aovwAVBHvFXKpeCH95r6qwKEsNhcJ5Q+sfed6p?=
 =?us-ascii?Q?nSQGnLLuOw6jinnNie8NzFJjRby/7Jawisci2hv7mjflTCJNnLNGzBVlA1l5?=
 =?us-ascii?Q?LJJm8gBV+n205ddLD2zB/VQyaK15E60cj9WSxOI13vUiZvbdBzJpu7K/Pf5c?=
 =?us-ascii?Q?NUHd1PuZYWp/cj/iYD4WwpaXLCt+BuAgGnKRH06PjSUmRXBzsa3YX4Y0+5KV?=
 =?us-ascii?Q?rar3vlPYQYZuniLuF/NEeeZzO6p9HNtX5cEV83D925VJkL2a/Inj2UgbNbTY?=
 =?us-ascii?Q?bYz55n5WDg6bPr2j6xhFXPJHzPQXRRxbo3N3GyOJZTG2D9GXU6RtxByKYBkB?=
 =?us-ascii?Q?f7uBxhs1t3GTE3gyA4ibNSsLxUkcJKsuwnhy+RIlY9CFfR1CK1nwrXAcOQzz?=
 =?us-ascii?Q?B12vCgI1ACibogIhiry9/St+888tJXkASIsOxtTIFWLC0fjFi4tf354/isg8?=
 =?us-ascii?Q?gjoPLnEjKUd9Gt9/DvN+1W513daMuTs7aeLyVFzKKSWHX7YSndvqfZhLgppW?=
 =?us-ascii?Q?9U/1c4W7PUHSfA06FvxfUkgld5i4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gkk5TJV5XFd1lIUhcpraJ9H4rFR0LTfwl1Z30BMbakLUVnbP9mUBn6iwLJCE?=
 =?us-ascii?Q?7qFgZutubk04sloXqB4nXmvQjSx6wiK2hP/fBH2VUpno4gwDgwQhR1BqHhkw?=
 =?us-ascii?Q?yoB4Kg6LluEd6y0LXgPCJP+VKI5XbtFL5z6SZwxYH67NvX7tZsheC1FBYeHd?=
 =?us-ascii?Q?I/gezjEwfNJzZm6f9paPwpTYJr3xPmjXVowk9xrOFb093J1/x66Hlr3Ouxak?=
 =?us-ascii?Q?Hm9UG/1rQSYxOg6LBx62qDeqO3zDU3S3FrHpGFOo+vB5HN4KC3KLkbDu1gy8?=
 =?us-ascii?Q?KO1dcheZhPxo965rHz77/gkokU9WF++Hv99ziiCFc7VbHiyaw9fhSRQgTCjI?=
 =?us-ascii?Q?rp9eD+6tDoMBzIUCQuTdreNGk/NrLn5Rj+DbCIoN64eFVEFpxUvLFXxoUlmD?=
 =?us-ascii?Q?OVGkt2gDAwFfM56AqWBKmox19os9cmDRQLSoyOyNCAEmI7zY+pWJ5UhO98x2?=
 =?us-ascii?Q?NzWnq9Z/JINqit7gQ4GMXDc1LzLmNkHmGAMu90cHXliIgh7WuJUtCJBsLI31?=
 =?us-ascii?Q?+CM9OhE7214pAzhFNm1ITnQ/jGso0WSwZAsYVOCBZy+B8/0p79JR08F8uHsN?=
 =?us-ascii?Q?1LOZGvD+ncvwIFrn0i0UiKJzZI4n0AS86a6xMRoe+YS0CvbZr8bRWE5rIUC1?=
 =?us-ascii?Q?Rh99A7mv6WdorwXTGrOEbzzmBvOd57JQGdmWeljsuZ3ut4Vk1n1WWMPeuSKZ?=
 =?us-ascii?Q?OfXn1eD8LMcMBl6qSATFOFZGUrs6Iww7x9RDLw+vkEYbfZedcz2VQfy/VrWr?=
 =?us-ascii?Q?yYIzvc35OwBqVEDyMpzXlnQF9edfx50UUkrC6U3aBT6eJQPcr4oFHEnuDi53?=
 =?us-ascii?Q?HZMo+6eneYXyBfl/ZjkiCwL7aFNyyKxZWHQN6wY41iSSuQx8u8ZN5XQuYBbG?=
 =?us-ascii?Q?/orHYaRQeIYo9l9e3YFrqWESzwbo3Udh8sXSosWRVU/tGBIhlPLiqDRlp4xN?=
 =?us-ascii?Q?o0rEmwuHca7eFPSVG/GezfzIiXzCDsxtkzCJhqjuKWziWFLVIuZw36kmCCDY?=
 =?us-ascii?Q?MPIliKaHf9mmcOVYQUtlWZkEF5T4gJ26EybWCWIKuSbMT2wzOyozgnDcqA9b?=
 =?us-ascii?Q?qSOPaNrI2cH2SSl75FpAkdPiwBVJErDQWLYO3gOBEVguiJYvgdDxtT/czBeS?=
 =?us-ascii?Q?+A1aOMAg4pqOYxEmOXuHner0D6M6yym1dTdtmU2m8z8Ra1elRuOxB+xx5xyL?=
 =?us-ascii?Q?4qA3YGwjD5+ZWnoIvofu8WfX1FMgzstUf2/Iue8rIQxVB0yfF8uUgwEWgKMm?=
 =?us-ascii?Q?sYyRPAfuFvRYSY6aOJXm/VuwnVeB7LrEpqcr7L2LgMeHPu8XHERuAJSghn7A?=
 =?us-ascii?Q?iPRm5SQMCiSs6yGgKU/ESjUlxFJ4rpgXHtVEIoaFpZw2ZU8VMDTTbxC7wr7P?=
 =?us-ascii?Q?P8GBQsB0pIeS8du125e1j1yf0qWDwltEqZxw06C4YT6xxZbdA6fDr4E7ZmRs?=
 =?us-ascii?Q?/c9BmCN0ZLsDodiZXeHj+/mnqyzmQDOfbL2lBq/7MXtOUDB7BUJ5L1zN3xRQ?=
 =?us-ascii?Q?PreXyTUsCw4x8T7gYZyUn7lgFOqrPwmyK2tWKav8e4rk0gFIZB6/AqmkVVs2?=
 =?us-ascii?Q?W12WDwA7pKDoY0V6EuI6hL07oJpOZyRI0OdNv3MghzUL/a/SLjh1/OCZoD0R?=
 =?us-ascii?Q?Ng=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5b084de-c4be-4f82-df5a-08ddfa273869
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 22:27:31.5270 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ejis5Q+kZRtv6nCk+LrkZYyusoOdiFqUJQooOkHBhwOroUTrPUVhKwYMMojFEJpBs/kJ63tsJYycWSbf9FlTtwvqix5uiP2CJ+uvskRufNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7364
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

On Mon, Sep 22, 2025 at 03:12:10PM -0700, Lucas De Marchi wrote:
>If mask is NULL, only the engine class should be accepted, so the
>pattern string should be completely parsed. This should fix passing e.g.
>rcs0 to ctx_restore_post_bb when it's only expecting the engine class.
>

I forgot to add this...

Fixes: e2a9854d806e ("drm/xe/configfs: Allow to select by class only")


Lucas De Marchi

>Reported-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>Closes: https://lore.kernel.org/r/20250922155544.67712-1-jonathan.cavitt@intel.com
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_configfs.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>index 8a9b950e7a6d1..beade13efbae7 100644
>--- a/drivers/gpu/drm/xe/xe_configfs.c
>+++ b/drivers/gpu/drm/xe/xe_configfs.c
>@@ -324,8 +324,8 @@ static const struct engine_info *lookup_engine_info(const char *pattern, u64 *ma
> 			continue;
>
> 		pattern += strlen(engine_info[i].cls);
>-		if (!mask && !*pattern)
>-			return &engine_info[i];
>+		if (!mask)
>+			return *pattern ? NULL : &engine_info[i];
>
> 		if (!strcmp(pattern, "*")) {
> 			*mask = engine_info[i].mask;
>-- 
>2.50.1
>
