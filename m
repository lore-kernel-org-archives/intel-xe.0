Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D55AC369CB
	for <intel-xe@archiver.kernel.org>; Sat, 26 Apr 2025 04:40:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C07710E1EE;
	Sat, 26 Apr 2025 04:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMhMjneO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D0710E1EE
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Apr 2025 04:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745642448; x=1777178448;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Y6I8Brhe8tLbpoq1H3Pb2gXVFUWG+2oBsRMUsoaa/8E=;
 b=VMhMjneONAYV9Ov8KTXT5MKGN2/LQKmGq+k99dhhWCIZMUj4K/lhnCGu
 wXlNWwttDr3JwPlNIK0fhlftDv/OS9g/iRJ5d5AEO737sNCem8F9pazTB
 HXjVIksYUoJHPL0r1KYiIEQ4N1em2HGZ0TL9sRUgOqOD5Q4BX8BlXGfbz
 TDpbrFuQV4bcD21nhOUr2ek4yDF+sepy2a0hr/nEzHKr2jw8lnIYOv89u
 sf0IWmZiLZ8VUF+n3d7lrOQgGyMzD8GvDByFk+oMWOnpW9QrN6uUGKRc7
 p0ALtHT2ImkiTgMDgK59fxXO76Lc545Xnte+dj9Zmb7I+KjiSnFc72+Tb g==;
X-CSE-ConnectionGUID: FXhxidu4Qwmgrml7yIJ+sg==
X-CSE-MsgGUID: q1OqWcxlQUaQ1Cy4q917ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="50977032"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="50977032"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:40:45 -0700
X-CSE-ConnectionGUID: 2XeTBDuKSuGCadVNYUwajg==
X-CSE-MsgGUID: 1Z/yr5bHRgyjBiRs0iwP4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; d="scan'208";a="132804001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 21:40:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 25 Apr 2025 21:40:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 25 Apr 2025 21:40:44 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 25 Apr 2025 21:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H27aF/6fiOjGyAKm9ZcRzQNIiEw4feP2v3lJCdwRo33LW7v+IxWMYHQ0XlJI2PKuVTSpRJEKTXMnHiiPlCU1CZB6sYBGw6wlEUytAlfC3I0yJnn6gJLl4rAQbIbJG766Pg1h7Oi2OWuELOdjuU8ay6j/f7z8eejxg8378yBaHWp7dPZDdz6w41oL6Dgv0nQBNKBWXghTTI0z8D1JZ9hvZRMfeoBkJI+NTaW21zSbEwgxCGL6fHgQAk+D6ObibfoV/myKGczRGgUXZqd16+zY71B/7PhErBqIVkUkJEMGI+WsTV+NcZit8PPoCNbBuV6gdPMN3Vi7MimmTggBMhr/rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1rkAgqXGx9GIhVmusP/5jLbBk5nNj7Y4g7s2q3tMWs=;
 b=kzfrY5SPUkF7EZBK+c/unjaQwTI/9IYO//SYgLiju43kLV0GeQKPCDcmNUAjIgS3k/qxkzXBpPbnYhjNk7zAvEs/2zqRuFs0Gn6J7XQI9yw56NXxmJYbepLWyFwqZReQptWpm8FsyOTmOuuVuUui3P+clss0RUtOScJPj0Qmz34r1c8SLg2rwXW4eFhcGJD9qUhvJOe6y8Iax/VZI4KnXQ490MRSuE6dzDCvL2loZER8wo+OwgMPU2GSB8UGfhCHHtl1glrzZfnXVtTpgQBiUuVZ72l6zbz1bQy6eoiQWW2mJTDZtD9kM0DJdlKzjTQA/8VvaOdAcBw4FM5jodfH/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB6964.namprd11.prod.outlook.com (2603:10b6:930:57::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Sat, 26 Apr
 2025 04:40:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8678.025; Sat, 26 Apr 2025
 04:40:39 +0000
Date: Fri, 25 Apr 2025 21:42:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Save CTX_TIMESTAMP mmio value instead of
 LRC value
Message-ID: <aAxkGScKPwgsCr6g@lstrano-desk.jf.intel.com>
References: <20250426002951.1795492-1-umesh.nerlige.ramappa@intel.com>
 <20250426002951.1795492-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250426002951.1795492-2-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB6964:EE_
X-MS-Office365-Filtering-Correlation-Id: a48326e9-2d50-4b7a-7018-08dd847c7ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9f0tvolAaOcL7V0AqAxP0Agr0hM84Qq5r2MbyT81PxXha7JPeTZZynB/CdBQ?=
 =?us-ascii?Q?DpGWzDCAYrtFGrm0W7v3k5EyyB/aWW8+rAWYgo04djfTy7r4Ox/Gp94WKk0a?=
 =?us-ascii?Q?Rw5jYlBXk4bCkx+hKwogOd6m++1rNdoe0rkcVYcvhKuKpEbjV4q/urQYkKML?=
 =?us-ascii?Q?cA5Y4vrMnEXqXpTQAqjPHjNZyD8va98l1S900fkl4nve/uRqgmTXMKJ5Lmlj?=
 =?us-ascii?Q?lV58SumVDdko998vWXHFg1R3Y2WN6+NHGLAHtAsl3TyvhHFLipPzdw9C/sLT?=
 =?us-ascii?Q?54+f7FezGdTkIHQ+iNS6wb0AZAmJEhM4sBhSenerhszgfLY85Q4lkYs5GQk9?=
 =?us-ascii?Q?CkIboGc4+uxESJk4v9qEfn+29WMs/i8Gt4d49d8tbdu310W2AittYylxwSLg?=
 =?us-ascii?Q?hS/wqhF4mCl62SDInhcCkXcsVqvwVpHiMm9Q6sle3LDsjoAF/z9iQ9jcVBSe?=
 =?us-ascii?Q?Yoeh77e1fRbeDI3dL0Jl/TnfECNGoy2frbrLCLq2hAgQgMBwwl7rY8ZVRzpj?=
 =?us-ascii?Q?lZy3iA0xEHw6LKU1YYcXP6Ij0HvembBZaChv9SRdw0KjVdo23IcRLdFylAvd?=
 =?us-ascii?Q?LFzX5Dsq06KSnjdebyWPtZzks8t9qOZOTWoKd8h5aJzfUhR/WKMcdYhi/fB0?=
 =?us-ascii?Q?aCxZCZe+W+rbv8eGMtZs5PmGQXqNW4as3BPS50xiKN1esJwQDBbOk2KDvn/b?=
 =?us-ascii?Q?XEE8EQa5zjO/gHmc/vZxQTwBkwcAWy3nIIuY4PauDz+MMFGZKQqevDqvZBLN?=
 =?us-ascii?Q?aUd4pGTwBnMJUO6T9BWzamD76+4AXbHbTovSJT15NiOsoCpn13fmxuPKhax8?=
 =?us-ascii?Q?dF50q3CVvYrzQwv6vSy8tpB2R//UgE8amFQ6Bo7XQZd/peyYF51UiF0liwek?=
 =?us-ascii?Q?fe1GlUBCstkB8kdD7ZiFi7sBLX2l+HAjJcB9UasvYyhI/IBNAynEt0he7Pfb?=
 =?us-ascii?Q?/BQs5p2pshX2auSYi7H2/bhe/1MlAWt5mSs0FpfU6XeZQu3zNp9Frz1UV1ob?=
 =?us-ascii?Q?4+FJup7LSV9FnV27osJX6q2PK4Uixt62SMf0uVQ1p/UQbTZHABuC/WLtcJ+T?=
 =?us-ascii?Q?zRdz/M071+YDP76GA/nhgxihtLtKEED2w+hye8XCG6YCMw8i9VNa056r3pBu?=
 =?us-ascii?Q?GZUGi/2W4cXyv1MS6F6nLYiyIxK4adyqz63w/+wnY2+SG02wZlCnOZET3PX3?=
 =?us-ascii?Q?BSyTAykWmBUiusn2Vko2nXKYEP+YYiE2znf5VjK6FlYZLscX8MR5MrKzuVhL?=
 =?us-ascii?Q?kjogZ9GAaDIZ9P7Oncm8fCDwxSP6ZugTk3WAkkTVoa07RymvbciHFbHRaEbr?=
 =?us-ascii?Q?8FHGd8SvVrM04LhD4H76quXcA0TBWUHF87r896x4KDzp2juFGwrmWh6ff0bO?=
 =?us-ascii?Q?l/PMZB1MLRyAjQ41NALqRX0mCCk79PUpLigNqcBoL5JVza6aYySWID64IRDk?=
 =?us-ascii?Q?amb5AjN9CdY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4nzWnhTf45Pt+Qc3Kz5vQ1bg68TC87kLpJK7mhJ+9igInnCKPKDC9+t/JDw/?=
 =?us-ascii?Q?mKeUpTIdIfihA7Z6igyWMwKL0Gn54e68Bvymq+A9dzP5PmSaaQTwnHsq5y9F?=
 =?us-ascii?Q?WAgcO7fui0MS5JRu1VwecXRovXrr6CoVYBHJeyvrqy8SKY+GaLgFcdH3xL/q?=
 =?us-ascii?Q?7u5ZJHHrow8B4Jud9LRGXZHUcecSCl5sHmgbyDr2nW0JjxfXm2CJd/CBWtWb?=
 =?us-ascii?Q?kdKoRliC1dYEWKSyzUXNYUGILf+ZArmc54IhnDa2Hm1uCciOpPnDihI+u5Fq?=
 =?us-ascii?Q?yS7QMZHcIUPeLJzaImAHw4wfSlpJNZoPHniLIP3/23LS+t/BWTw5CwrC4juy?=
 =?us-ascii?Q?na5mzbPpdy7iXiy4oSZxjQqMsyEvCqYUwsSSNO9Ht2a0544baSwp9v09e6UZ?=
 =?us-ascii?Q?a+Ck0BxsoKv0ofCLN41L9hoszGBmP5EA97KCHmUy6OfPhnvok5SDQWRfJ63w?=
 =?us-ascii?Q?FhwH6KRnyyMjbQ4WYPg1pVa8TZZeLqqZzXuMi5km1Vc+3L2/D/k3PdN93a3E?=
 =?us-ascii?Q?Nwns+RyCiFEwdvkAqzHgpoBwGiLrejEf+dQbLW6Ht6s+B6A2aEZLqQ+GFVJk?=
 =?us-ascii?Q?l/EAwGq3avGRI1i6G7905d9fr7uQWF+oJ3r1tWefR7d2PSOvTipW4D6olBdh?=
 =?us-ascii?Q?WeEkPIPA2cKoZoeUu92KMsf2Fz/D+Zq8JLJ0so+rXAI/Bhatvfb8LqZgSGxz?=
 =?us-ascii?Q?dgXZ5fGeNj63BFD845FxJwWwBUK4LPxRbItj2igFcXL2wjFXkuBcCwru7rl6?=
 =?us-ascii?Q?YVCvZcK6sa2WKTJGdaax3yyIJtFPWO5UGCd1/d6PtF1pXRuh/wxm6L1cyFAw?=
 =?us-ascii?Q?pyZhl0WT1vcjhnDXw8G/a9qSREXepjf9V5UUXpC+6VRNV5+5nLVGB7XQ/MbP?=
 =?us-ascii?Q?8rtB8NnsiwS7fduhSxdN8aOneZn/MkcI5OgX5zIcHKpS2vPwoTONo+21uyPe?=
 =?us-ascii?Q?n/w1tM1rqVT3EahQprsKxAzoBnQ4Z7bGGbmv4wBd8g3AZM8AWXtinSWryLa8?=
 =?us-ascii?Q?1MKUcg/aAsLpAxovUL69ZgPr7/mMMaz3Q/4HnHV7+7DO8NJIsM9F+UxmDShz?=
 =?us-ascii?Q?cVyIMWvv1LlwRkIB5gXKT9p75Lx7bBCHTrsE2SQ/YOTyTxip6noxjnmNAw0P?=
 =?us-ascii?Q?695gXNhfZA2UHD2vuzcaffjy3w0lOsZUEj55CkL1fWaKUoYDsXu3dNBNNQXx?=
 =?us-ascii?Q?eajqIbSVA9WXw5HgcN2G2+YOsst6f1kFyLTQV87M0mHKd1FIoEX1TJMIZurt?=
 =?us-ascii?Q?l+PC/JuDNJFQhigSHANcybS3XwNLRIAiqB1D0J1+Tmz67nz/o+5/WxD4kEZS?=
 =?us-ascii?Q?lNxTfvOpdX7aLbZX78Ni4ifumwZ0xz1XUI0cIB/a9bTv7RHzNT50MA7cJlcw?=
 =?us-ascii?Q?EE+5Y80wO2Vsir362Oq9MIwO8Fqdw/HjXuBiHcEtpYOcXb2aQOT3M3HTvLl0?=
 =?us-ascii?Q?K2ewvn8i8GTXJKZ2VMohY8/59c6XOMLUb4+G+AhDhNlZCAsbSd2mnVw9ykny?=
 =?us-ascii?Q?EmIYKQWrmZu3Qv80Cm4PkrqQ9mQMvP4HEXdzzLkEJ87bIwp/enLRud0gCZsx?=
 =?us-ascii?Q?izmUc1yNejaEskLNEDb5siEZexPaOjW1UghmOlKiH0f9KCOscGSmwaYV8A5Q?=
 =?us-ascii?Q?SA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a48326e9-2d50-4b7a-7018-08dd847c7ecc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2025 04:40:39.6166 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: riQ0GyP9Kw5hP569yFADP72CfM/rEpwDLMCeVogz+3pxFkkAfytmXOkb1DGforQlKi6RNPE9CYMWb7WIPjm4xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6964
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

On Fri, Apr 25, 2025 at 05:29:49PM -0700, Umesh Nerlige Ramappa wrote:
> For determining actual job execution time, save the current value of the
> CTX_TIMESTAMP register rather than the value saved in LRC since the
> current register value is the closest to the start time of the job.
> 
> Fixes: 65921374c48f ("drm/xe: Emit ctx timestamp copy in ring ops")
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index a7582b097ae6..bc1689db4cd7 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -234,13 +234,10 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  
>  static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
>  {
> -	dw[i++] = MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
> -		MI_COPY_MEM_MEM_DST_GGTT;
> +	dw[i++] = MI_STORE_REGISTER_MEM | MI_SRM_USE_GGTT | MI_SRM_ADD_CS_OFFSET;
> +	dw[i++] = RING_CTX_TIMESTAMP(0).addr;
>  	dw[i++] = xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
>  	dw[i++] = 0;
> -	dw[i++] = xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> -	dw[i++] = 0;
> -	dw[i++] = MI_NOOP;
>  
>  	return i;
>  }
> -- 
> 2.43.0
> 
