Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B33CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 23:52:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1D510E108;
	Wed, 15 Oct 2025 23:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LeCUiy2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D7610E049
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 23:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760572334; x=1792108334;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YKTMW62q4/uiIaSL5bhw5jMOZBN4S1LWOg8R4bHMzxo=;
 b=LeCUiy2Xt1Tv3vsRSozuaoyveBiyCx7h7zjc5ixxz2UZmjwCGl0GRgHL
 q52MPGKeIfuLkOVaQR/p8MJJUYdvoJIC5LZ4FHwmXDMfR9iB62jm/WuFF
 zLctdtvIg0N1F4oLignaXNGzelpMPZ8QIM+3/TGwM594+/0FQmY1g/kSK
 Ief1rXzBDtGqxZ0s+IkqwXdSbdkhtevEtyli8SmqLI3ysDawqQ6QX3JLS
 AXoeVCRaSNxXga7+uSg0EfQKAcD69sQnc6N1Pd0o/Sc/MxBCoQLqAGRS4
 2KUKA4KtufWiXyn9DL1deeCTFk9ee2xfliY1mATKVpqKQ/5EP8iUVU5DX g==;
X-CSE-ConnectionGUID: x+P09kmTQT2YAJXJPMSNDw==
X-CSE-MsgGUID: sJLnryURRb2Npo52+mK/iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85376138"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="85376138"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:52:08 -0700
X-CSE-ConnectionGUID: YkwNu7KCRhKqmsbejsgoig==
X-CSE-MsgGUID: HVTriXb3QXKIS5VZRFsyYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182094713"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 16:52:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:52:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 16:52:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 16:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gidlp/UR51PEOeGeGFmAGJTjGnPdmgXeL81pmbk7JcI7/2Gb8EJNR//8RBUGJj+duh19ZzQlSLwwe4CC8g9b4eH76/JXrxYN/U67eIekA6LiNUZSerMrX7UpfJF398lIenGIUUBtm3JnKCBK/ZNP6Uyv82E2L+5zgOxEo2CRLFb+mjuMVKyVctCYznECVdIQbMNlbfPqOcxyyPlKN+be5Ay/KUG6sXuj6e3nfG4cG3nzp4/4UfbRCNXWsO3QkRdXccwU/JQNMJ8yUzWmgKQO65RXdbLIVTNFm33O2QOswiln/7xUTp2VyFWdf9eafWrvrBLF4GR8uy3TfYjAzr1MPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RotUbmcbd1n35XI3ROged2ayIWS8EpQUg/UlIG6k830=;
 b=k0e07de7BlQnHFReBh/4dN7fqNEzq0JgnSUXFY+qSH2frgAMU0+mY78e3pS64sexBOdRq6Kmp0N2LdHVO9U1CIe0RDIn/bay+y1xmo3TiTkAzghJJH0/j+T6p+t4xO6qo5XJpK52hdwsupKhBdBGNzwdN2L6zr2ufus7R1/9vRfC2t357l3EfD9bWqSuo3MlecddA8hQ9018Jvd5c8XmAURe3zwNGK8KtAujdy2FSLvTiTQ9sFPuY/uQ4I1WpVm7hjicaZ/akZZHC5AQLZgPr+AOBtxOBo5ZuEAHVVqtlep43oX9S75AmWkYyBkrk+ZYVnutSZe5SFY+XV2s9IU0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 23:52:03 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 23:52:03 +0000
Date: Wed, 15 Oct 2025 16:52:00 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH v2 18/22] drm/xe/irq: Split irq mask per engine class
Message-ID: <20251015235200.GL5409@mdroper-desk1.amr.corp.intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-18-b9189b3056a2@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015-xe3p-v2-18-b9189b3056a2@intel.com>
X-ClientProxiedBy: SJ0PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::16) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: bc182363-dd3f-4e9d-f6d8-08de0c45d6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CA6a2JEglLXf5CW6VV8sCDRbYz30+aHJkhc/1ncmqFSc8f6D4n7jDLJ2K/wt?=
 =?us-ascii?Q?hTuq/6DtpNivI+8nBXFQ2JhLFAhxg2HirmkGqH1Xi5oKoO/NFqRC5iUAunPf?=
 =?us-ascii?Q?voUY6Wk3/pipVc3Nn67vMWrKOZ2soKDV+S3KNImlLbVj3Eb3DDkEWuReVTU7?=
 =?us-ascii?Q?S8Ae6FA0JL05vkY+EoqVd6vTmLjcsC5HzHaSgjOdXK3gANOkCVpxWmxRLb9/?=
 =?us-ascii?Q?xzWMVgPTkYDHcbmBbUUEnVUw1Tzn+AsMJQASjcfJ85o1l4JwicU5aeOyps8z?=
 =?us-ascii?Q?LgSKS9yUWbpsSsgJDiPz4s2ry1gmOmp1TrOkHvkkcea52EEa0Ee8n9W7fc4B?=
 =?us-ascii?Q?BIK35gguGwLQAb5ecR65wDZ5QqSgyiJrqnq4gnQJ/p8k3KqOninKMV6+sWqZ?=
 =?us-ascii?Q?Zi+VsACL58XCwf+Yrc8IwgnTloTAMjyxr2mnbd/kaEzeKT1/2oOb/qo1PSEM?=
 =?us-ascii?Q?hF3Jvb1ZCmVhroNYIFLZ7o7fa8b8AgB6P0ONT2cnaj+3h01dkFXsI+ZgsO6J?=
 =?us-ascii?Q?o8Hh7OJRGaagD5DdjA5WC5DbnIOsSPcHmPeK0VK7l+mIslvZ2tfIErIjNMxM?=
 =?us-ascii?Q?NruMRNowqf/j9HXChuTwQ46zgPlGDj9L1l3wfYJCiRq2hjwaHODfhLmbwSmr?=
 =?us-ascii?Q?YDQGbZgfBn69gJ535sXvo10JGRch8xl/Uacfduz8nVs7hKrp9hpZt7f3uaKl?=
 =?us-ascii?Q?UceUpSVCbcK9aESam7Seb9jX2nkxq2gZdqFuSpz6VbEp36hy8F58TH2jSaX2?=
 =?us-ascii?Q?JP+HzzArW+Y5dJhw/LLjo+3TX9yPByMFSnFJhc657/2rick+5moCnY8taW/t?=
 =?us-ascii?Q?PpQZkBsFZVogrjsvJH7prx7pp/h2rvJOzOZ3L9DIi9Occ+Z6yfKu952VCvOz?=
 =?us-ascii?Q?1IRJWVsi8+BhUkYDCZ5d4WjclwyHhzAEVx6If8dsXhUFt132IJII4pJHQX1E?=
 =?us-ascii?Q?26O7Ocyp1AHyyuBOIfbpg2qHuQudKuBwRB1fXDGfWeGBaPbsUZGmhgpMDpYR?=
 =?us-ascii?Q?27MdC3G3YnDHTkW3rLR5tRv5BfGwwTOlqd4xc4az4/yf1xjnnOwXJlqyvNLn?=
 =?us-ascii?Q?8FEiiA6csk/piA1gv54uvlhsYugRbY+QUUFT/RENWjbFZdIYYI9EtrylralY?=
 =?us-ascii?Q?JBS3bBNsuy4Flr2OXCyVahdCVaqeQizKYGUE3L6hYt8HSYhKtsea0rY4Ji7T?=
 =?us-ascii?Q?6I/cVQZ3bd0bVdD16yeNheNGS2HYPC6sJMYB4tRKdBn7tqrdApUHegdWGL5W?=
 =?us-ascii?Q?MhFp9RC/ozbSEtOezCMrufsnXnapf/1hdLI23ilN+yvbd9CKsiA911FIx0at?=
 =?us-ascii?Q?GOrasMoHXhtUSCJNdbDR7sDB9YdyOUe3Y6UD18PoFYFbb5tbxqwCJvwWzSdZ?=
 =?us-ascii?Q?5lVizqIBu3w0GJl9TNgbtBJbpL/Phq5R6zISGS+FEsY3Qzxs9jYaO92zN9W4?=
 =?us-ascii?Q?cSQwCbqqzsxu1pdOHmeSH1WHHdyFOhEh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4XlvDWpYg2SKS5LfJoiypnlxsaikwNceo49GTiWoU2d/9jBXrUbV/0elalX?=
 =?us-ascii?Q?SLac+dC4+qIxEUUH0KuCBPqAy0qq3VPF4+Dl8GpCgRZc1ln1B2alLXbZ/ueZ?=
 =?us-ascii?Q?yDj76ZOejAPVp4YXhLuFkU4hiKdhXU6ggFoGr4oKFnT9Ev9UF2CCBdz6IQd7?=
 =?us-ascii?Q?EXA0710PYIoT3iK6BFEQ4jT5qjdnu24PypsM/fSAruWay5oDrqz3VCxgeMp5?=
 =?us-ascii?Q?9eK8GB63MDwKap3wvqunm5m+8MyAWt+w5OzgC85yrZvDjxYJIWxJHsxbSmgU?=
 =?us-ascii?Q?w5v6Zxuwht5eqYwS5VMDOzo0dPMWOh14f15xlBVWuWs2JcjA5brLf4Fwp5XA?=
 =?us-ascii?Q?+QuOPExXvpDwXRBB7AV6j7ttEVa6280gso6/eXaFgbwg3C61kfmEMVTGuBCl?=
 =?us-ascii?Q?wwn9qinJotRQsufj4q8wan29Tgz+OFqXKBSchbrkru/qYzKEFZrkKFJKXeut?=
 =?us-ascii?Q?bqCeIQj2jmC4phmdGLXeXqujLIWm/K0jmqPZYs+3kFgLBJX1QG5meZNoCIst?=
 =?us-ascii?Q?kXyIZUKuyxDBiL74086C+YFuj/D9ElD6ZuW7WOHPX8RKN1EMOO/+QX4Yd0iQ?=
 =?us-ascii?Q?W2J9PB+3gECIB1nIWgv47tnX2YWWwPY+1j4wzfunm4WSuuQyvm/WmNizhbBU?=
 =?us-ascii?Q?rsLVh2ltMZkqXxOqZz1VH8z9aXoiaMVVtuEhlIkEvXJdA5sm17rXhnLQb7oy?=
 =?us-ascii?Q?cmhdaU5qTdTxWbXk4MUsgVebH9ClMnkQOlAiUPPaqc+bjTQZk9Q5NQz5ZPd4?=
 =?us-ascii?Q?MYqO9EMj55UNIfoRHImSdnTk8vdf/RAJcAVLgvrJoNZZhMHNCbm1IkpwQGJc?=
 =?us-ascii?Q?sOqz4tS8ikfu2qSAuPAfgn48LzJuVKniUkbCWI5+98gltEreXIkZB4Wjkpav?=
 =?us-ascii?Q?v0I/bzbjvZeSvp0F0vkxJQaBjFf1PeikcAzokSB8TwWmU/EhyrSAzx4mE5V7?=
 =?us-ascii?Q?nM2TUyqW9fzW59jdVXb28kf596gsRQgYoT/RUm0JvjFAN9qFjZHbFkR7ZZrS?=
 =?us-ascii?Q?ZL0WR9vML9Njhn7RfvEx01dpdgUpzn3qC45VaZyX0Zcx/hVjX01DMePpxVli?=
 =?us-ascii?Q?v9+dyMHa0+Xpjbqgwwcb3kNB2NsTy5KuR/vhtlWYNxeaU54yb45YtnnUX7J+?=
 =?us-ascii?Q?Wkw/H3V7SdVcAAQqInMHGh3G/AZHAN+Wa8MXPWZ4SDS9oz5XDCGbOepQGpSX?=
 =?us-ascii?Q?BkjO/q7hlRr91uTB/xCN4GsIERdvCsuoPXv4JsNUpoB146czdVqthKvdanNY?=
 =?us-ascii?Q?gRYEeKVlPmYJcHRGpyevyGT9oymaKLCg1XZGuqCZW1YKhUg+AgKXLHr4AJXw?=
 =?us-ascii?Q?3TfJWmb9oP0ycfv3wXFZPXzK1y8MQbqYQzPQST1fGw5P4qRDpLA0djPX4Kyl?=
 =?us-ascii?Q?Wf95MBYntW0w3LgNQooho5mr58Rewojp2e7zNDDc0+iogEojJpd1E/8shEpC?=
 =?us-ascii?Q?c863EZdLmJ+p6RE41C51mJwB1+i09m/OMxu7bYhWijuzxABCfT5XQekWlvAV?=
 =?us-ascii?Q?ZxO6i9wXFCiLdfZHWCW7BN3RHgJMc8aVGYh68UoYB7z2b/NT+BTkwekIN6sd?=
 =?us-ascii?Q?xL9vZJeWvJulrHZWxC/cY0W93HkS0ginTpsFltvL2tpuVnNXZyUq3lytDPom?=
 =?us-ascii?Q?wQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc182363-dd3f-4e9d-f6d8-08de0c45d6da
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 23:52:03.1829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /w5hzqwSKIMZfJdhrKalb/aGV2GZjuIY7ql5uXZWcaGHIx3r1EJroW1nCSb/TsXddj1rBMaf1Yld+R+WGGQguCFdhnAmobBgCd6mzV9xrz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6360
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

On Wed, Oct 15, 2025 at 03:06:33PM -0700, Lucas De Marchi wrote:
> Each engine class has a different bitfield structure in the hw. We've
> been just using a common mask for all of them, but this means that we
> could inadvertently set a wrong bit in one class while enabling
> something in another. Split them to make it more future proof.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 73 +++++++++++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9c3a85c4585ed..103804546b280 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -139,25 +139,28 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_mmio *mmio = &gt->mmio;
> -	u32 irqs, dmask, smask;
> -	u32 gsc_mask = 0;
> -	u32 heci_mask = 0;
> +	u32 common_mask, val, gsc_mask = 0, heci_mask = 0,
> +	    rcs_mask = 0, bcs_mask = 0, vcs_mask = 0, vecs_mask = 0,
> +	    ccs_mask = 0;
>  
>  	if (xe_device_uses_memirq(xe))
>  		return;
>  
>  	if (xe_device_uc_enabled(xe)) {
> -		irqs = GT_RENDER_USER_INTERRUPT |
> -			GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;
> +		common_mask = GT_RENDER_USER_INTERRUPT |

As a follow-up patch, this should probably be renamed to
GT_MI_USER_INTERRUPT since it doesn't have anything to do with render
these days (I think once upon a time this interrupts was only supported
on the RCS, but it's supported everywhere on all the platforms Xe
supports).

> +			      GT_RENDER_PIPECTL_NOTIFY_INTERRUPT;

This one will probably need a rename too.  The purpose is the same on
all engines (indicate that a flush command has finished), but the actual
flush command differs between engines...PIPECTL is only on rcs/ccs, and
MI_FLUSH_DW is used on the other engines.  So maybe
GT_FLUSH_COMPLETE_INTERRUPT or similar would be more accurate.

>  	} else {
> -		irqs = GT_RENDER_USER_INTERRUPT |
> -		       GT_CS_MASTER_ERROR_INTERRUPT |
> -		       GT_CONTEXT_SWITCH_INTERRUPT |
> -		       GT_WAIT_SEMAPHORE_INTERRUPT;
> +		common_mask = GT_RENDER_USER_INTERRUPT |
> +			      GT_CS_MASTER_ERROR_INTERRUPT |
> +			      GT_CONTEXT_SWITCH_INTERRUPT |
> +			      GT_WAIT_SEMAPHORE_INTERRUPT;
>  	}
>  
> -	dmask = irqs << 16 | irqs;
> -	smask = irqs << 16;
> +	rcs_mask |= common_mask;
> +	bcs_mask |= common_mask;
> +	vcs_mask |= common_mask;
> +	vecs_mask |= common_mask;
> +	ccs_mask |= common_mask;
>  
>  	if (xe_gt_is_main_type(gt)) {
>  		/*
> @@ -169,44 +172,62 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		u32 bcs_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_COPY);
>  
>  		/* Enable interrupts for each engine class */
> -		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE, dmask);
> +		xe_mmio_write32(mmio, RENDER_COPY_INTR_ENABLE,
> +				REG_FIELD_PREP(ENGINE1_MASK, rcs_mask) |
> +				REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>  		if (ccs_fuse_mask)
> -			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE, smask);
> +			xe_mmio_write32(mmio, CCS_RSVD_INTR_ENABLE,
> +					REG_FIELD_PREP(ENGINE1_MASK, ccs_mask));
>  
>  		/* Unmask interrupts for each engine instance */
> -		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, ~smask);
> -		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, ~smask);
> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, rcs_mask);
> +		xe_mmio_write32(mmio, RCS0_RSVD_INTR_MASK, val);
> +		val = ~REG_FIELD_PREP(ENGINE1_MASK, bcs_mask);
> +		xe_mmio_write32(mmio, BCS_RSVD_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, bcs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, bcs_mask));
>  		if (bcs_fuse_mask & (BIT(1)|BIT(2)))
> -			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS1_BCS2_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(3)|BIT(4)))
> -			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS3_BCS4_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(5)|BIT(6)))
> -			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS5_BCS6_INTR_MASK, val);
>  		if (bcs_fuse_mask & (BIT(7)|BIT(8)))
> -			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, XEHPC_BCS7_BCS8_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, ccs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, ccs_mask));
>  		if (ccs_fuse_mask & (BIT(0)|BIT(1)))
> -			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, CCS0_CCS1_INTR_MASK, val);
>  		if (ccs_fuse_mask & (BIT(2)|BIT(3)))
> -			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, ~dmask);
> +			xe_mmio_write32(mmio, CCS2_CCS3_INTR_MASK, val);
>  	}
>  
>  	if (xe_gt_is_media_type(gt) || MEDIA_VER(xe) < 13) {
>  		u32 other_fuse_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER);
>  
>  		/* Enable interrupts for each engine class */
> -		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE, dmask);
> +		xe_mmio_write32(mmio, VCS_VECS_INTR_ENABLE,
> +				REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
> +				REG_FIELD_PREP(ENGINE1_MASK, vecs_mask));
>  
>  		/* Unmask interrupts for each engine instance */

As a follow-up, we should probably add vcs_fuse_mask / vecs_fuse_mask
checks for these, and also handle the rest of the engines up to VCS7 and
VECS3 (since we have all of those in media_xelpmp's descriptor).

> -		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, ~dmask);
> -		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, ~dmask);
> -		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, ~dmask);
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));
> +		xe_mmio_write32(mmio, VCS0_VCS1_INTR_MASK, val);
> +		xe_mmio_write32(mmio, VCS2_VCS3_INTR_MASK, val);
> +
> +		val = ~(REG_FIELD_PREP(ENGINE1_MASK, vcs_mask) |
> +			REG_FIELD_PREP(ENGINE0_MASK, vcs_mask));

Was this one supposed to be using vecs_mask?


Matt

> +		xe_mmio_write32(mmio, VECS0_VECS1_INTR_MASK, val);
>  
>  		/*
>  		 * the heci2 interrupt is enabled via the same register as the
>  		 * GSCCS interrupts, but it has its own mask register.
>  		 */
>  		if (other_fuse_mask) {
> -			gsc_mask = irqs | GSC_ER_COMPLETE;
> +			gsc_mask = common_mask | GSC_ER_COMPLETE;
>  			heci_mask = GSC_IRQ_INTF(1);
>  		} else if (xe->info.has_heci_gscfi) {
>  			gsc_mask = GSC_IRQ_INTF(1);
> 
> -- 
> 2.51.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
