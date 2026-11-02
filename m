Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A906606A324
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KWZ14aGB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347DE10E095;
	Mon,  2 Nov 2026 18:48:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6776B10E095
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 18:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793645314; x=1825181314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/sRYzSOjW1ZHqML03aJeKSWowdi4CNpRj+cs4VbKkcA=;
 b=KWZ14aGBg/kLuRM/lLOldWHuSijdmNPSKhG+eFOQz9N6ZTk68qq2+MgM
 ev5jHRN6SH9EXiGZ0NJKUH+kuezBRm9U+mhINeG/CPJWefu4R0sAnn46U
 XS3vpX0e9dI3sVqiVQTgnP2o8iOS+0moKWCYJezPs3PrXnOhNf2SNdHZg
 ypjY9WXuCPuxD6iinvJfjHmJ+pyhrUjCBfYQnBvJg5I/Nq/adUyTtZqpw
 e5RdKeZVsjSZYPtN43HAzHV8nUTeEk2+YvoP/9vpT4bnu+BhkLjonXtfc
 uX1MjEEBDfdOawobypHfhULM71FDvJ094LhvXYrRvp+UDLym422WVlDRQ g==;
X-CSE-ConnectionGUID: 6UaEiaetRrSgfvb9fLv9iw==
X-CSE-MsgGUID: BIPEDUWRRt6J5NC6zO5zMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2380989"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2380989"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 10:48:34 -0800
X-CSE-ConnectionGUID: j6k+f4Q6RqiOPxrWX+sR3g==
X-CSE-MsgGUID: mIglx0mFRfi40wdMd074VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6195144"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 10:48:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:48:33 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 10:48:33 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:48:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hW1arbUcPF4PoAgmBWr2MutXblwAcwJfZOGXEYcRsANJUh+6bPUEJwXq0gIAD/fD/IvtiL5ZCV64IaaBEGAsVQMrEq7ZGakkrZHqjORAqUREsSwKa1kIlgPlDWapY+wxQq9dGn3L5csSi4smU7e0YWa8T9ACP9I4FGy7eoEu1Ml9InYLEEhhJJSMb++VbFgolfA6BFXEdzl4KcVwrbsUwUViSipd7P2IWnYS5NVSbnDfDh41LnYiYNJ+vTon46iWAVdF5X/LdVATjzr3bSv65qmx64pS2admuy/A0SdAwswda4y05RHprmr9KJAHW2D8eLGVeDm3CeKMCP4qorVYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09ghrTkXVh/f0hZb8cG2yeIuWFze162CXFa8WpkWsR0=;
 b=T40g1grr63D6HACS//Q/8m4iMQUo48J6jQ381WNqEVr7OuTCDutLrnujIpVM++QK9Jo/bPn4yDGp5dl3ETK2xcW3asOHcV8OIGKDnM4dPVgmUpVknQ+W9nFvaZ9bFC35J91QetW0/SPAdoDUwnFIhtmYHN4aVIoQh0JO+ecYhEh1sae4Uaad+rJnTf90Y+ww6AbuqCxnx8FDF9fZaWn39/fGoGQ3WZdC12j50AgTZ+P9HI0ZTMnlBJPToWBEnV7czvlDKlhmNnmKj/pVUNkjoOxHjlezHFZRoDqPY4f5wtlqwnmkfokfrchyY7gGNeVdtVhs6WKcWLXLFID0knkU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by SJ0PR11MB4957.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:48:31 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::4fa4:138e:7455:9384%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:48:31 +0000
Date: Mon, 2 Nov 2026 10:48:28 -0800
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 07/10] drm/xe: Replace MAXCNT comment with a comment
 on adjust_idledly()
Message-ID: <20261102184828.GA326958@msatwood-mobl>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-7-919fa1c27070@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261030-wa_16031259911-v2-7-919fa1c27070@intel.com>
X-ClientProxiedBy: SJ0PR03CA0069.namprd03.prod.outlook.com
 (2603:10b6:a03:331::14) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|SJ0PR11MB4957:EE_
X-MS-Office365-Filtering-Correlation-Id: 41bc11a0-9bd3-4ca9-f7c7-08df3911e3db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|23010399003|366016|261021123027099003|261021121427099003|11063799006|4143699003|56012099006|261026121527099003|261009223027099003|10067099003|18002099003|22082099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: xvMS9ELcCohWAR/EM7P6bErtPp/yiybDWY0Jq3XkX1gq2o5oHJBEK2y7v2r8KbxixyHlrhvmx7woFARjKhBdB5YJZDMi3zJVogvQlw6exFDff3eyl7+niPvYEA2za3XiD6CtgRpmtfGTOQMrVDO1S+ClQxHIjMcQkSt478R5L4Cro4UC+7XLzuCRSK8PAV0z5nFNZxWg88ZnOwx0WYhEwVbCUwNvihp+N75FuR/XCtPp0usrmKbFonMWQAlf73n12EhbwmV9tBOD5uvQyb6EVfWjFy/zjaWEnKw2+IYca1bOP0SuT7EE8Hfb3fG01UWVBeaA90kgiEvW5nktqXJMHYekCd7tEL5mgP9xEr7RL5bTIfWwRy4wHYPqHsuQA6Oosw+NUxqqflGTKNZVPl91CR3fKt+WM/jQzqSoBDydlYhSBGocc3tl4zvwwL4iXmBa7wmdR0dVXyEd1Na7FykCzIqThnH1p0o593v0Bsfv4qhQq/a12tfWKv75WKetwjTFH2btUfMK3ctohL23GSd88rAIXOIhOfqwcZ9fgcZ83ovN4O89a0vGGkF5P8Fw7T0AnkPw7IpIvnAw24i9U7vSWoc2NEEesbmLpUxvTl87apw7H2mfFYzuXboBXPSlFwjkVmZPPf2HpyAC/6Ch4jmueB2Zr5DK9ZyZpsIYUHxO6VQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(23010399003)(366016)(261021123027099003)(261021121427099003)(11063799006)(4143699003)(56012099006)(261026121527099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4U6IORV0bMAtQRZ7IO7IPc/df+WgrqXFiMO3+aYYjfg53JmZuZmErRuz+O+r?=
 =?us-ascii?Q?USmAARoFyzzfVm5PVEPTpgidJ36xwOkA7WrAsfnkEKZMPoZHWnrkstbjIuK5?=
 =?us-ascii?Q?LphWdMr8paKraLPIYhvnc+ZREILi9fMihsrreA4lBiB1tbDYnK0+oiHyAj4E?=
 =?us-ascii?Q?avnbPJrHd6Oek9VGZalw2K/Adoz31vxSblIXR4FUokf4CSho/PY+W87O7xWr?=
 =?us-ascii?Q?A9/hiMKrjq1FKTkYMbQmpOhdBnhWGJeZBzAahMFuEkT3A5xKgWNr7QrUDoP/?=
 =?us-ascii?Q?TK0DZQ4F0szAcrULIFZxolfq+maVVb99O5tJpLpufXnfAXgG1sNxRxJs2IiJ?=
 =?us-ascii?Q?xh8UKqZyPHWT6hoqHVfDG1DPRfiBznrlBYCtWt126R1cynHN5HBb9ppLTKxs?=
 =?us-ascii?Q?FLD6Mzh18KU/3khvuSL1emWnQeLc5pKDGptYORAhLHLMFPGbKhSzBAV9tKwt?=
 =?us-ascii?Q?sdFRX6qMiC+CBmr+9iT3TLMRb+xMgQADh2VX+tge3UZvPDflSUKuJmz89ISS?=
 =?us-ascii?Q?k0ucrASiKVgElfnZ+5y2LsgCUH+Rsibni1jPpbth9UnryS0nwR3GlN4yuyqJ?=
 =?us-ascii?Q?xJa7zQqB+DDRviqXOnEIhH+ZDVocO0srU7FnDD2Bu2D6loeFWYjywhrRx29F?=
 =?us-ascii?Q?KxQVU4NWl8S/qEDmTxSa11L4tkAoiPtbGQTWZ8m5EbdXjLW0vkSgwZDlci6L?=
 =?us-ascii?Q?1M+5WJFF1BQbO5VF/dftw0wn+8sFEwetK4lwx9Zy/SQYCBXu6gVLMoFF2lN2?=
 =?us-ascii?Q?ueVCz69Ibjp0DnGY+nSxqxRGgpRrMKbO4WONe/TxQ3JBD7PTu6YvE9fDnATD?=
 =?us-ascii?Q?Zkdsjcf7WZJOWeaOwibGSsbvbkvXWLcE6zguy/RjJ3QQ2Hv4LpokDTh1r+Nv?=
 =?us-ascii?Q?dNt4ZnI4OpZBVmvNJeeycTNoKVGzjHOeY70EelgzubZMZz3Kzn42BvNRSnGo?=
 =?us-ascii?Q?D/umPoq5LLHzEgNUdX19PBQy2Se1jnmEodqRUhdWA0OL3i26F1cjn1qlML8i?=
 =?us-ascii?Q?cY9oilbWrm3DcYWzN5ZvTYVdpd5qwYKYbKupuFEHRac96Bu4+66N9YtRV5/O?=
 =?us-ascii?Q?Hd89uoLAMmD77FcuZ5kKxTMWOlXbpJPuLzTk8Ss2Dp1sN9TFtLbOCGG3jFat?=
 =?us-ascii?Q?LEY5ZuvOYHtaNPifKVL9LbbHf7EA+qc3zbyjnhNlSF2USHB1/8DX+rf56uDb?=
 =?us-ascii?Q?AskGt20x/FY/cTov5efc040/Mijbi/Y78ncW9O9e13d5JtnxYInfEVQYt3aZ?=
 =?us-ascii?Q?H67AtB2LP060LJnsNQn01BIt7fzUjTblO/6dSQZHBaPXXhydDl2btREEzY+G?=
 =?us-ascii?Q?/plwkiM0bFg936BgwJxXi1Q9ZKwjXWJTikngt7PwVbBIknQ/HFRHT6tiY6kh?=
 =?us-ascii?Q?bZiYyGSVsn53cuYXLwyYE5ADLqALcIGPbB4v1TB3jWqfcbmERvWisG4U4rMY?=
 =?us-ascii?Q?9rTVGjEbHFVcqudoW9+0rcD1TVcqqCB6DfkcmcaSh4FaykmguKXyoMvq8F9J?=
 =?us-ascii?Q?Y/tNY+yOxJ3spkuuRbpqjVBGjmqc6R7kH2d6bgzLd9yNNvagOPj9hPe3qwUO?=
 =?us-ascii?Q?+/swS2Eqcvz4KX2GGq6Fi16i1T1iih+6gf0lKAZsv1Z7aqVNITofcvIkzbgq?=
 =?us-ascii?Q?NqFntO5GcbRUjsvMiH/tESlY5YskAFHXy0fI9WKi/majxsUYoGna50D1H9b7?=
 =?us-ascii?Q?irloXjiY2/+mbqGuD1Vsmv3bj2ByEq2aT45hU4w+YPOdx8tbmQ8M1otsY8WY?=
 =?us-ascii?Q?zv0IVtZNmDQdmeQbRJG6TuDIe/wwNtMTp3WZ74UI+N2D+2MRHwNVbR2sJh/J?=
X-MS-Exchange-AntiSpam-MessageData-1: 8I8i/meyTbSC6LFgskMk4lBn67sJ71xKwy8=
X-Exchange-RoutingPolicyChecked: XI5kuxvjokfcuaQjxaYheQ5BuT+BCBVxObN54tfpLWeCYGU6fK39VJaFP3SjpAnDoC3qOnxNsqz/eapRR7NQcuzuIQSNe8kjcZI3+smDu9OQ0HHtRRexLXwK98WNGEm9hw8IF14POhqDLkbYe9/TFFO92QTQ6WJKyfufL3imm90zS/IROFPBjWU1K/fHm8umKQNK9PqorplTigx2aIjBmdXwGBj/7IGWEA0uFnW9dOL8cVjJ3tv8bLOq5udwSy2vggIhzXfmLbURfVIdiSQf5WrHbrPa0V7OrJlKYKE0H885AB2JT8j6MNU0ABoNLnfmo5VxvLHhQNqV0LswlmEAZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41bc11a0-9bd3-4ca9-f7c7-08df3911e3db
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:48:31.3196 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /TaHC1IUD5V43hKhE00rdAOp/PJt7IiQATnBoEf5ip+QhKcGjNd0CmTB3dDsaT7/WdKTOpvrgi4KbUDUm18mMIq+zmehUSxrHLv0p19cAi0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4957
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 07:57:46PM -0300, Gustavo Sousa wrote:
> The adjust_idledly() function does more than what the comment on the
> call site says.  Drop that outdated comment and document
> adjust_idledly() at its definition instead.
> 
> v2:
>   - Add a comment above adjust_idledly() instead of just dropping the
>     call-site comment. (Matt)
> 
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 08bd8754ad09..7950e118ee1d 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -596,6 +596,9 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> +/*
> + * Apply workarounds that require adjustments to RING_IDLEDLY.
> + */
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> @@ -719,7 +722,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  			xe_hw_engine_enable_ring(hwe);
>  	}
>  
> -	/* Ensure IDLEDLY is lower than MAXCNT */
>  	adjust_idledly(hwe);
>  
>  	return devm_add_action_or_reset(xe->drm.dev, hw_engine_fini, hwe);
> 
> -- 
> 2.56.0
> 
