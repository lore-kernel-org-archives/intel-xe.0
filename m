Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F5DC982DA
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 10:00:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBA810ED4F;
	Fri, 18 Sep 2026 10:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OxZBzcQI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5DE10ED4F
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789725638; x=1821261638;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xxigzKvX0yg7DMrDvs4h4QJdtYqE0xrn7J9ZCjB5iaA=;
 b=OxZBzcQIGrw2lTMe7ObYm3QzTfFS3RD078Mbc/ExBUuuC6kVte5uSL7M
 0zg3yZsmlnKdzX/UTYKwe5+MvsIK7U4jnK+MajJgGJps6YK3K3BVrGE17
 8isPnFd5jiM45cr7dCkwegV91lZYHv8/CYzXIychvTOA2WSw5iSyOcZQZ
 SER5lAVy/QGGJ4jddH1k6LQfevtnbTWIf91/UAhCO8duuNF8FQyNDOAZJ
 Kb3PNfFeG9rBfK7B3pAneUIFLO68MlsvvAhalrf6hnbJJLPxLLjmwC9id
 VB5KsENWVHjPnaf1S81RokNHAarfl24OrwtHDFsx+oIOjiOJRsV0hoPhC A==;
X-CSE-ConnectionGUID: o9KFdjRBQJCaPrBBNXGCmg==
X-CSE-MsgGUID: y7Ew0UIdQoKKTvSqzDOkSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90352240"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="90352240"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:00:37 -0700
X-CSE-ConnectionGUID: 1LI5JC33QLSrIoQUsUvcoA==
X-CSE-MsgGUID: zFOrpkY2St6nte6WOClU3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2515847"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:00:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:00:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 03:00:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 03:00:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXW7zonGAetdCVXuY5LiC4qAGEURANeGYCDIiIooKfBr0zWATtJO1Vs5/aQAmgdZ2W6PVM6bBz9EzGETBO4wVpQqu+qSO0sE8dPTbfBBeiQf2+wHAyy1GiUf6pWHEQYW1aLwCYG8poOvQKBDFhr+i9xH252PQ4NoQ0zN90JXR+xBng9F/dcxS4imdAV1x7mVs7lImqOB7TZwAfF7FOCmu6qYRCWOxdkhsfBWZ/d4hgAfJHVEyH5QXJmwoC396+v4YWMum5tXMx3FqnVulXlxYw2d/ubrr7nM87QwWOLj1Xpsjsfwa9X64IPXpxNL+ntKQW/l4sffHIzxog5gVMTmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi16ebajJ5L52giRcScj8SXWRpTd1N5FaBSXNR0aUzc=;
 b=tCiLxxdOpN/dRFzGVGZfyeIqIvNp/76Y2DhOc2ODxcP+pEUcrh20dVeGfKMlDJthDaV5JAanxsnmHs6tP+pIzA1Nev5qRDssYq+d0Z7OGLhYRYqOOF00LuBpVYK/cflJSB8qwZPN4bxI4x3fCkHdpG23Qn34yEtLY1CJI4miyAD7i1+SmqulhxjQExRw/wv9dZWnhlP8UyHzPSCVt1/2eYM1bfJKI5vrXSjoinBuBWzIwitFEodoGnhEmlR5W0TnNMQS15D73THbaz3Tu9JcRTvgaWio2pjXu5tqSm6m+HZGQflLmZURnPmK378QpNhkGhMtzJ+m5ai9GyQgGJxM5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by LV2PR11MB938507.namprd11.prod.outlook.com (2603:10b6:408:413::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:00:33 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:00:32 +0000
Date: Fri, 18 Sep 2026 06:00:17 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 3/5] drm/xe/hwmon: Fix memory controller thermal data
 handling
Message-ID: <aq0LsWns8riUXYGo@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910182756.638830-4-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR06CA0009.apcprd06.prod.outlook.com
 (2603:1096:4:186::17) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|LV2PR11MB938507:EE_
X-MS-Office365-Filtering-Correlation-Id: 6eccc980-7d33-4b4d-0aa8-08df156bad60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: AKwjovWRZncC8vT+25xor3Zbv1YsVV/iPkf0yhz0bd8iGyP4JB2KR/aYLsHgJgbjVVl+wcTNLLsGfr+WqpXof62edI/l9jhbk5ND6SuUYpfM9SIBaTAwbf6PVuGqg4aJ8xhBiLi2KPjdlpPJZmHk0YrW6LssvQT9mDMqBydOosXzo0bHaOTpqSo2lI3i6l//mNv/2f0N6gBiH7hAyYoTLkkhx4JtoZ05I5orhnaA0hELKVsQJskY9PXnQsog0adejBx6wFkFXoNxJ8vF4G1SB9kp/v7mIm9+nKMm0Khl2sTOz5o3WbMN1zSmOKsUs8mT1BSiNFWke2SR4i2StcEw9ssaR5is4NvK/SllyYpgavjtqQZaAukFIRlT5CuoqNouz23R1fEEv85JtNSiJA/52UlgRxkx7PrJB50J3zivrjoxYI0Kk46hEDg0W39xKIo6r6D6nljKOQn6bq6wn2PIVztDvAYBaDejRsnsXUNiTKJhKggpnfVzNTlDW0HzyleH+tgb4EUomAMEN/5/YxAQJFclfvZJlkkJBUO4rODdBal3nafVeyUt8Ova3nsJ3pgK+a/jLVeiemjLIA7l7dn7pFA/LuC0w+pQ/0bPu/BssUPOtOYAAekHwM8MAasKr63dR7qG4UO3/MzVCW8C0Fh53ZdRUUZ5Jg7s3yiQXr0o5Ws=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nJhd/b1ViR+E9++Xv0cgdfngdGVYd5K/+3DtCFPpWzEtSJmrxHzwpdsIZIO2?=
 =?us-ascii?Q?12D6s9PbXvMvW0P8u6OYMakdWl8tu3ru5hTsse2hxBtiJ1GGvLK4HZEzXB3r?=
 =?us-ascii?Q?aquN12G/gXIfy8urLepDZ8bI5wnNarUqysGPcz3H/RHaQ6uY6gzpRvzFDxYN?=
 =?us-ascii?Q?BG5C5nOpxjZY9/D5YXkI39StqU0iOyU77iSnA0/vIiFudbPrfb/CkuX8+6l2?=
 =?us-ascii?Q?H2XKtfiNntIfJyqAFcj06b4oIePSiqZTSMu7wlgJtv+m2V3b4cngs2y9TG+a?=
 =?us-ascii?Q?7QcbfWo1FpMZ+doRkGHfFy6qe0BDRU4lht4FiCheHSS6eaZOLGFNUMv0NBxJ?=
 =?us-ascii?Q?QphvXeBN3g8G5PChUQ1lvPQ9I+sfPk7slYQsYtfS7eEhIY1fwHg+hEVvkYJb?=
 =?us-ascii?Q?hvWZKlQQFWdc9F9aurQf0ujcQPqKD2fBLxA85K5QfBuhLwEqYizgJhxvX+Uu?=
 =?us-ascii?Q?GRv8f6j9AngKzF3sACXrLS41gLdo79Et1kfRT9aEwd6I4boXBZo8hGkAUfCV?=
 =?us-ascii?Q?BFGr9r+c8vO98cVZvMz7ctMb6Gzpunx95C70uUHnMdqcE+xRrJWmmn7qQKpU?=
 =?us-ascii?Q?0gdK6c1RYqcpQlipgDQW/sGNEH8AgGIgRuuCQThsj+ACZBrhRL/a2Y2v10Kn?=
 =?us-ascii?Q?FD9L0q/+hqoJVAoQE899+nTagONJiKYLtu0T1y0cp+F5LdEUPQ2HdajPaJb+?=
 =?us-ascii?Q?YhRRMW4W2/gXgIttMKLUI1gO7ishSWHE3vr2NsiNK+1mDjeUEKMtm6LLmr40?=
 =?us-ascii?Q?cYU1q/FFY6XMkku2nR3UPVCWnYdnpR1bNnUKJnt8amQa4zocHioQhIFDxfIh?=
 =?us-ascii?Q?RA/Q/hEONb7TnMqQW4c6LzEOjJEFtnANv0GhNKmzjASmtbSNl4optpP3zG5L?=
 =?us-ascii?Q?ZwmZuFwfkZfNHUGXU8qe5iFON2r1hctxscQN7OtqNAZ/rn15zzb4tNAsnjKv?=
 =?us-ascii?Q?2iZ2a966iRgud8lZWyCY1hx39B6s05D7M2szw3u39sVLaG+J+ZTIqvpNTa1Z?=
 =?us-ascii?Q?IH1GVGfD6D1kfUJk3EMzxJhq/XxwW4GyLQMgiaxf9Cb1385KStgmvUMc1a0m?=
 =?us-ascii?Q?HSV/Rs49MwVAgKlJ5TIOPvEFyCEcllZajOYD7p59p1JiUH9XmSS+Fe6JgoDu?=
 =?us-ascii?Q?9ZuHCCXr00NIqwgV0Hr/j8nsdr0UcLBasY2gcFVlLXgk5eUwrDKIdsBiB4tn?=
 =?us-ascii?Q?v2fVy/0RhGDA3/dGVL7wkhfTn1OhVhq0zLy3ZjSYxCcon5i2yl0X8seUWvay?=
 =?us-ascii?Q?fgAFL2T3oaVd5l9h5FsHAvy+m7vOmmze5QyGY/DZ/mZGp6gf8BZf2L7NfF6/?=
 =?us-ascii?Q?HejgwGezETupTY0FJqc8+Ihu85/j5tCj2571vfm/nYq0wnxRe+GSQoEcP7h7?=
 =?us-ascii?Q?18Z87oQh1j2AWbCzJ1lSilv+jjQmSQ6iJVxjSox0+I7yLe0UQ84F9GyhxBRV?=
 =?us-ascii?Q?shLPZHgzf4FNYyKWH3+ks1V3q88a6sGdrbl9nX0iLatQLH2P4wdRgnPxOVWo?=
 =?us-ascii?Q?NsIccUYzuvxArOHnb6Tye5YMvecNWW4e8SfYv5uuH+vLh+Z3h/z7Kqq9ZkCZ?=
 =?us-ascii?Q?ax9ThFlUWC1r7n5g7yDDOBVgGRsKhvTSNljm0ZTfpNl6BqCaQKkrfigHZ1zx?=
 =?us-ascii?Q?MTqCyO7NrUqnmCK+N8fCdtg5ZIX3whCs2B9clFvEH+VcbzeQT9uayA0S22Pp?=
 =?us-ascii?Q?iv3t6IqIvGuBytZju/aCsplIRRQehWowp4QLC77WFzXu34BsxvuEfuw4Hd1x?=
 =?us-ascii?Q?SCikYgQobA=3D=3D?=
X-Exchange-RoutingPolicyChecked: d7KI7vbr20GPtwEgll4UR+P+M3zG/i2waH44xBjlYdM9DXfiuT0eG6Zy32AK024zFnM26WDHMNOx1IAAL/AodnTIcboeZAh8DH0KcXb5AybR2Z47iZcJU8YsEORPy/sNHi1vCAV5tFJmrlnQ9CbniEBkoeRlqN3+aUGnC4ocx84JVBTa7/zrnSt71+J7lgrGEcDPtETSwS/jUuTShYAyZfGDL3gPLdnMgoczo+0TXsa3c/nobkZOQw6GMgRwtYywb3m3ZE/fgKPhdEMHYnvalR/4Cuqk25K/GC+txjXQbZJyM9HP/AE+N84tH4GNEGJzDNzOIwCa5BxipRT1oRvCHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eccc980-7d33-4b4d-0aa8-08df156bad60
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:00:32.7213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y8Vqx8Sup6kE+FGZIdbwaIstWi4cCnhTm/FBK4QSQhBijzOb7Wu3Spz8oBeEabTtuhgFoX3ZtVs5Hd86QaRieQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB938507
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

On Thu, Sep 10, 2026 at 11:57:54PM +0530, Karthik Poosa wrote:
> Read all required thermal groups in get_mc_temp() and use an aligned
> u32 buffer for PCODE accesses to avoid unaligned memory accesses and
> ensure correct MC temperature reporting.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Fixes: 3a0cb885e111 ("drm/xe/hwmon: Expose memory controller temperature")

please move this to be the first patch of the series or send this
standalone.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index a60a6a731d88..c682c5a33650 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -148,8 +148,12 @@ struct xe_hwmon_thermal_info {
>  	u8 count;
>  	/** @vram_count: number of VRAM temperature sensors available for the platform */
>  	u8 vram_count;
> -	/** @value: signed value from each sensor */
> -	s8 value[U8_MAX];
> +	union {
> +		/** @value: signed value from each sensor */
> +		s8 value[U8_MAX + 1];
> +		/** @dword: sensor values as dwords, u32-aligned for pcode reads */
> +		u32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
> +	};
>  	/** @vram_label: vram label names, dynamically allocated based on vram_count */
>  	char (*vram_label)[MAX_LABEL_SIZE];
>  };
> @@ -910,16 +914,16 @@ static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u32 value, bool i
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> -	u32 *dword = (u32 *)hwmon->temp.value;
>  	int ret, i, count = 0;
>  	s32 average = 0;
>  
> -	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
> +	for (i = 0; i < DIV_ROUND_UP(hwmon->temp.count, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> -				    (dword + i), NULL);
> +				    &hwmon->temp.dword[i], NULL);
>  		if (ret)
>  			return ret;
> -		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
> +		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i,
> +			hwmon->temp.dword[i]);
>  	}
>  
>  	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> -- 
> 2.25.1
> 
