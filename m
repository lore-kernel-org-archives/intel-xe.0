Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034A7103E2E9
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 22:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69A110E32E;
	Wed, 11 Mar 2026 22:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIRG7nCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE7C10E32E
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 22:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773267878; x=1804803878;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6WYYpV+f/Btdw/aoLydeDOkBTFexjI1v44ErN/YOdhc=;
 b=UIRG7nCLTdqfC8tXYVU9mfCcAuxGX35ze2LdJleyeF/dpPtJTFf1YNfd
 KEDXmlxPCNbAsysbE/SYVRrysHavQTCab/3VourIB6ppr0dEPaArsuMs+
 ls0EEByWpU5omiaNgMfXbGcaSwKk+rTXDQGK3PX8LlSnIslwoPmNECM/e
 vkKNaXdDEI8FpnmSfQoEWx9ZsEgbKtU6OdvYXMmH068Emih8gaT0SqCpl
 iSxLufr+vQLlKNdnvIrIxr/t/NjeDji+em50KKp1XFdQ7wUQkA+soaCfx
 Y91xgf4zJlL+chmy3yQbaaXl1+/0AcoUlUV3udBXT86oB9OUPlP/lctKA g==;
X-CSE-ConnectionGUID: zzn81zg4TS68Py+opbSFGA==
X-CSE-MsgGUID: ynn9PokET3WvKWxObsPEzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74543072"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="74543072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 15:24:37 -0700
X-CSE-ConnectionGUID: aM7f+F7jSF+81Hz9dczdig==
X-CSE-MsgGUID: yvA+W8UYSh64NdSBw/3bNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="217226400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 15:24:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 15:24:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 15:24:36 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 15:24:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yk1sD7re+oAljdv/xbrOL3JbKeO4EFDNxHuTRw0RkpUINzI3mweaUjjJsEJOVW2d5OUr5paMXuQGsTkxvHZpzgSJ/x85snZHNDtFYXB2+efh6ZfgpySXzMT3Go+euCAcopPBPzlynvMqvTaZUSqD8cj7S3Vk/WVcUYQlKOBNfKyOK9yw+olMU5hOuI7p95Z05d2VYtMmlDDhkCHPaV7vyz67AYhtBdwLQg8obdkci5eKjXo4/GkijsyReKDTKevYzPUK8S1gvwZRTnJCcRNQprmg4IoOqgb6NvPDkS+lvYmLNaNMnXORp3NJCBIn4L0yiPnRUv8jKkmCzt1a1MnIFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybvxzvh3iK4bCWd/bwXJIrA/1tKQRyQQecWQjCqgl8M=;
 b=mxHd5Jl37GRTr+ZOY/rt1lvpbDDV02hKgyrJQqzCyvGZpwTXN7ZWMR1CNf7Cpwf0VwCmOo7bAawXYRdKRxct9Di7wpLNz/QgUkfURRkStxn/icSiv9nV5V6w+FJsXHluAWbn+IR3ccwe8wgdMJ3aA48aMUyswCgLyFm4ZiTbd57vBbSmawAOom1EPV4+8aQsrXLqcJdC+kYcgDtLEGBUf06WB2hlFlhqg8iJ2OSu3QxQxcQsDUODfmZ1a7xjWakY6oQ6F/CZ9OLUFmf2xtqiwFygGrT4ue7Bz6WLCpUL62KIRybuLzADLXSUgvqqHLIhAB7/85AHmRY6ounZimVRxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8704.namprd11.prod.outlook.com (2603:10b6:610:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.3; Wed, 11 Mar
 2026 22:24:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 22:24:32 +0000
Date: Wed, 11 Mar 2026 18:24:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, "Juha-Pekka
 Heikkila" <juhapekka.heikkila@gmail.com>, "Michael J. Ruhl"
 <michael.j.ruhl@intel.com>
Subject: Re: [PATCH v21 8/9] drm/xe/display: Add support for AuxCCS
Message-ID: <abHrndHyYUgm7KoP@intel.com>
References: <20260310123453.54346-1-tvrtko.ursulin@igalia.com>
 <20260310123453.54346-9-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310123453.54346-9-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: BY5PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::18) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8704:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9166d0-d318-48ba-902b-08de7fbcf7f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info: vz+mYIm0xpwxzMTfIku6H02dpOQe9hCSo27efFd/noG0tXoNJWyqXqwbVMW3sSKZr4oSo1wZ7WFK8x6SFXd0n6THiFeMYjU/onS4Vu5RSxQVb3ygtYk3EtIKuVmaqFskUDILfGkBZsnjH0YfjWxWMslVpjBRSpowo1DGSekNmpT9xvedtZE7PWHMbd8/ciC3Sgg5oNwFE43KRhpu5kL0iQVJi1MmjjlFrhiOhwqVsKlAlvbObW/Ly5powDKuCeo5IdSYknXxmUSvDyZ9TN/csifR+04inSOuiJIis88RMyCUp6p42GiaIzsdTOY4WXtb4eTXb4OUEKES0NlMZ4vufd+JQ9yvI8KV1vSlvDE33vJcCwbSZ4ug0DmOdmqmpcoM/at+EkFJv3ZUE//VVZxAk+iwmGEbDlYR8cfYPJIgGyjwIkF1U4LEzc6263vjMhpJX4QYCgaRYHyoAjKNvnKdSZc3Rx7RzEFPkYAW8Vkf17kU5kMnnHlhzQcIu9bClpxgSN0/PcDIol2eQggXZO5Ew7pL8E69O5bewmlMPPHFrut717LrbHz+CW7GSvxZPy9ktMQIcK+SWLouiplInPEK574Gh0JIvlZLr3cHYT37UMPBISPls8AXH1ZovzFS6N4SuGJdSE5dAgkU/P837KmkpI5lYd+dzD/JhgASYa80hzsQe2zYZ92XAzIfmjVQ0oEsqCdu0ez5LZNHcW7DAb7QwSC/MrCEFUYU+tPLN0m3CPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?RNWynkq2/GBKXCO7RhyqVmCyOyPpBEaaEzocHiA6VAnYCDUqYhZBsawtda?=
 =?iso-8859-1?Q?0cS3JuXezR9ZAhxqMnde0V4FIZg5kSz/QjOPv/AjEiQac6MAZftZNomhBm?=
 =?iso-8859-1?Q?4p/DT/w3hGS4l/YuliHu048czJriA2jBh9WQvgdLq2d3YFE0U20Ep/R10J?=
 =?iso-8859-1?Q?VKJ4xKl4vY8CYoWAkdfcpopDJGhQIcGP76tzNoYjYutLJKr+xbpyyo/kP9?=
 =?iso-8859-1?Q?KmqPsGZqqtTJqAavvqvk6NEC3uEnzTtANWMnxfm1A6rSsC7ElCD3T//1pw?=
 =?iso-8859-1?Q?7F4y/PMFuYqcHa1Hx7q8gPdftVp0Qoxjimq776FgpX0zD3u96687Mt5n3h?=
 =?iso-8859-1?Q?RFvj5SCjZYLY/w8lR5c0ay7L8M12nOBBBRgHOcXtg59bvHssS5m+H23vD0?=
 =?iso-8859-1?Q?c3QEZAR+j6TB5Q/5KAxvopqOcLbNOhX8DdsBvp47HNvjXOO2XmKwf8ATMe?=
 =?iso-8859-1?Q?aIYwXbxjOhMb16mxFgSyvDNnDIfRKvuRWv+0L/+YfbFGphFUzeojE/E6hh?=
 =?iso-8859-1?Q?CC3RXHgWVfhnG/+V2z5B0JUevGz1K5psiHtPEaEXxexqN5+tsnGjThrgrs?=
 =?iso-8859-1?Q?jVPMxeyuQnN8gQKsqokVzNjRwhWu+/1jE9UNtEeHgBo2CK+5jNUDJa2YMC?=
 =?iso-8859-1?Q?pJi5H3yGvDZl5O9n5W4N4cXcva9QHMujiwq435IV8DuhczoFpI6x0eYHKK?=
 =?iso-8859-1?Q?XKkA0DOOD3QgOld1PPRvimT9d/Q0XI6YVcHbTVbajfDBIHfboDt2zX6iYj?=
 =?iso-8859-1?Q?OQj/e+SrIn60kGEqBv3D2X5vDJ+vzWt36l9NDAop646WWAXYJorpTKrpuD?=
 =?iso-8859-1?Q?lSAaXxu0atrtXOY2EXrXazuPAZzenWGutuO1LU1HyhO05y5WyP+hWw9TbX?=
 =?iso-8859-1?Q?gsNFvwrGdMrj8nfYNsArVjAE5ADvlk3wNZDvpJxlgn9vwzMJqfW/K/C3Q8?=
 =?iso-8859-1?Q?eruE9GmeSX+5X9k9ezYLGrz2cv4eWijSqC598Rt8BYM4mp/vyHe87QxHLi?=
 =?iso-8859-1?Q?AEJsXynUl8MEhuviJ/pt4bANthjLKvEgKxwM7PavFRgxE1yrGIKkGMH/fx?=
 =?iso-8859-1?Q?3h3Zcrt1Ym3OGZ4V13ZvZ3kCFDmPLbEjcN9VjSyOcdsqWHKMoiOpDcyEgv?=
 =?iso-8859-1?Q?3fSNNVbeJ8/J8B2mh1lORCUzUJAaYcRejlOCE7cETN97qAFeoHEBWsAqjn?=
 =?iso-8859-1?Q?LwxZQhBVLN/LpbBe1qXCmq05oR1dUafqAiyHFNXY7o/HaRo7Kftv59i8/T?=
 =?iso-8859-1?Q?6TAhsJSMi+H81PrngrI8lIF7xxXOtgSG5PQvk768svh2bw0yY/dECuaR8G?=
 =?iso-8859-1?Q?Xiu7nFP/5c8oD9U96v8XxshhnscgFHF+dWJoV+b071jOo6/3PrH1fGy+Q2?=
 =?iso-8859-1?Q?LwnK2mRr3NKKEB5zZLjuaEMJ3lz3QqVKssStF9rBjL65DWlq7HGklXr3Ac?=
 =?iso-8859-1?Q?q9967emQJZSqlL1W4D/QdbHzApMdnZmuQhIXxUU9RzE4K1zKsp6fp5fJnL?=
 =?iso-8859-1?Q?V9HL8DUdfNx0jhDBAn4g1782e2sDqY+aiVFr/kwj/cG5efkN8zruUbv07T?=
 =?iso-8859-1?Q?Id1c7qwQiAqrsX0h6ugYZSGeGP/8vB3czjeIHASn34c4QXgO0Fd3tLFSSq?=
 =?iso-8859-1?Q?iGy5Cc3TJ1o6V4x8EfubtjeiqccIfZ3ZYFYu/OlS7rJl/hbP96P8wkx6mX?=
 =?iso-8859-1?Q?3lPa2FrDHFtJjoHi2JgtlpLe/RgLZ2k+8btP5t8AxCGwtQBSWpQfUXxSBN?=
 =?iso-8859-1?Q?/cMOzC8X/HZhe/iNN30jLXL3tHtBHLIvRqyLP+p8aqgJ67jFPtigHVHeul?=
 =?iso-8859-1?Q?pu7puLryTnpqTA6QtUy0XqvyMFP4Zys=3D?=
X-Exchange-RoutingPolicyChecked: mKPUSr0UPOgRAGEJAsDcvtFZBmYVLylNfWefa4/302tWg0rUitbypjhNrCgGY/76yHBO+F6CtTHcpotiFv+dp32Ou7U7ZoDIi+QG3funm3rlx7bXORhXUvUWfnChRGtLTsJxvp/4mVRAee057KZoIwRF/E/JEqpda3CFD4wu5Up3gKEAEjsX1Cc93lzpCkRQJ8d2rtQMjeHXNMqniW+TJbqOup5mVo39fUW7QkPewroTXSb9QyLjCHFKh2RCQLhhrhph+sCFYpehVNXwOP2Xfxo3BPkbvrOJLSudAvB3ERE1n05Iqr8hJhL7e4psMZJ5HqJcYphuDAKbkp8e3qYnAQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9166d0-d318-48ba-902b-08de7fbcf7f9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 22:24:32.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKVYZcVb43FHsKNrwuXh1eLnJZaDYwLn5p/Gz5wfcc2pZrSYu0+oYrTGsx7vpJsDawlmYPjqantB/OsnAleOUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8704
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

On Tue, Mar 10, 2026 at 12:34:52PM +0000, Tvrtko Ursulin wrote:
> Add support for mapping the auxiliary CCS buffer into the DPT page tables.
> 
> This will allow for better power efficiency by enabling the render
> compression frame buffer modifiers such as
> I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS in a following patch.
> 
> We do this by refactoring the code a bit so handling for the linear
> auxiliary frame buffer can be added in a tidy way. Also replace some
> hardcoded constants.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I hope one of them can review this patch.

To me, it would be easier if we could split this patch into smaller
easier to follow patches.

> ---
>  drivers/gpu/drm/xe/display/xe_fb_pin.c | 111 ++++++++++++++++++-------
>  1 file changed, 81 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> index df7d305c6fcd..fe4b66e5c3ad 100644
> --- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
> +++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
> @@ -49,33 +49,94 @@ write_dpt_rotated(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs, u32 bo_
>  	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>  }
>  
> +static unsigned int
> +write_dpt_padding(struct iosys_map *map, unsigned int dest, unsigned int pad)
> +{
> +	/* The DE ignores the PTEs for the padding tiles */
> +	return dest + pad * sizeof(u64);
> +}
> +
> +static unsigned int
> +write_dpt_remapped_linear(struct xe_bo *bo, struct iosys_map *map,
> +			  unsigned int dest,
> +			  const struct intel_remapped_plane_info *plane)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
> +						 xe->pat.idx[XE_CACHE_NONE]);
> +	unsigned int offset = plane->offset * XE_PAGE_SIZE;
> +	unsigned int size = plane->size;
> +
> +	while (size--) {
> +		u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +
> +		iosys_map_wr(map, dest, u64, addr | pte);
> +		dest += sizeof(u64);
> +		offset += XE_PAGE_SIZE;
> +	}
> +
> +	return dest;
> +}
> +
> +static unsigned int
> +write_dpt_remapped_tiled(struct xe_bo *bo, struct iosys_map *map,
> +			 unsigned int dest,
> +			 const struct intel_remapped_plane_info *plane)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> +	const u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo,
> +						 xe->pat.idx[XE_CACHE_NONE]);
> +	unsigned int offset, column, row;
> +
> +	for (row = 0; row < plane->height; row++) {
> +		offset = (plane->offset + plane->src_stride * row) *
> +			 XE_PAGE_SIZE;
> +
> +		for (column = 0; column < plane->width; column++) {
> +			u64 addr = xe_bo_addr(bo, offset, XE_PAGE_SIZE);
> +
> +			iosys_map_wr(map, dest, u64, addr | pte);
> +			dest += sizeof(u64);
> +			offset += XE_PAGE_SIZE;
> +		}
> +
> +		dest = write_dpt_padding(map, dest,
> +					 plane->dst_stride - plane->width);
> +	}
> +
> +	return dest;
> +}
> +
>  static void
> -write_dpt_remapped(struct xe_bo *bo, struct iosys_map *map, u32 *dpt_ofs,
> -		   u32 bo_ofs, u32 width, u32 height, u32 src_stride,
> -		   u32 dst_stride)
> +write_dpt_remapped(struct xe_bo *bo,
> +		   const struct intel_remapped_info *remap_info,
> +		   struct iosys_map *map)
>  {
> -	struct xe_device *xe = xe_bo_device(bo);
> -	struct xe_ggtt *ggtt = xe_device_get_root_tile(xe)->mem.ggtt;
> -	u32 column, row;
> -	u64 pte = xe_ggtt_encode_pte_flags(ggtt, bo, xe->pat.idx[XE_CACHE_NONE]);
> +	unsigned int i, dest = 0;
>  
> -	for (row = 0; row < height; row++) {
> -		u32 src_idx = src_stride * row + bo_ofs;
> +	for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++) {
> +		const struct intel_remapped_plane_info *plane =
> +						&remap_info->plane[i];
>  
> -		for (column = 0; column < width; column++) {
> -			u64 addr = xe_bo_addr(bo, src_idx * XE_PAGE_SIZE, XE_PAGE_SIZE);
> -			iosys_map_wr(map, *dpt_ofs, u64, pte | addr);
> +		if (!plane->width && !plane->height && !plane->linear)
> +			continue;
>  
> -			*dpt_ofs += 8;
> -			src_idx++;
> +		if (remap_info->plane_alignment) {
> +			const unsigned int index = dest / sizeof(u64);
> +			const unsigned int pad =
> +				ALIGN(index, remap_info->plane_alignment) -
> +				index;
> +
> +			dest = write_dpt_padding(map, dest, pad);
>  		}
>  
> -		/* The DE ignores the PTEs for the padding tiles */
> -		*dpt_ofs += (dst_stride - width) * 8;
> +		if (plane->linear)
> +			dest = write_dpt_remapped_linear(bo, map, dest, plane);
> +		else
> +			dest = write_dpt_remapped_tiled(bo, map, dest, plane);
>  	}
> -
> -	/* Align to next page */
> -	*dpt_ofs = ALIGN(*dpt_ofs, 4096);
>  }
>  
>  static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
> @@ -138,17 +199,7 @@ static int __xe_pin_fb_vma_dpt(const struct intel_framebuffer *fb,
>  			iosys_map_wr(&dpt->vmap, x * 8, u64, pte | addr);
>  		}
>  	} else if (view->type == I915_GTT_VIEW_REMAPPED) {
> -		const struct intel_remapped_info *remap_info = &view->remapped;
> -		u32 i, dpt_ofs = 0;
> -
> -		for (i = 0; i < ARRAY_SIZE(remap_info->plane); i++)
> -			write_dpt_remapped(bo, &dpt->vmap, &dpt_ofs,
> -					   remap_info->plane[i].offset,
> -					   remap_info->plane[i].width,
> -					   remap_info->plane[i].height,
> -					   remap_info->plane[i].src_stride,
> -					   remap_info->plane[i].dst_stride);
> -
> +		write_dpt_remapped(bo, &view->remapped, &dpt->vmap);
>  	} else {
>  		const struct intel_rotation_info *rot_info = &view->rotated;
>  		u32 i, dpt_ofs = 0;
> -- 
> 2.52.0
> 
