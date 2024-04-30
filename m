Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D332C10F16
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 14:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4DC510F40A;
	Tue, 30 Apr 2024 14:33:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BD+PpKwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D3110F40A
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 14:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714487628; x=1746023628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U22SGtOXaRbgKPMX6p1Nx9kNq9AWoQ5HZIWSag3OeMw=;
 b=BD+PpKwArg/LHvoTeaV6kTXQf71Qn8BUjeA5o/eCgNJrJWsPx3tgyjmo
 l7WHUrK+Cqd9nQFsQRwiqvp1dZ1X6uubS+4jYQEHVAaCsd1jo331y3eGr
 6sI8kQ3JvSh58hEdLrJEdnyhgwaK7UBlk9sTptM4u+TPx4FAVvsvXXFyW
 eWd5npa8LeQpIkBz8C8G6krZgJ2G6Ry6e4PHM4EYqCggxJOSmCo4HYaYG
 OosuXzD1h9EMEbsLYmPcZ32kQqwUVj+9dpghmeOWWIt89ym9+N0M71Fms
 7X1iffzd4/NkUBtfypXdlPxCFxhcED5wSKuOFVXrqz94q4geWBm+Y2XNd w==;
X-CSE-ConnectionGUID: OEoS9anmSa2uFw9EDFjwcw==
X-CSE-MsgGUID: bh1uzkafSemPf41HnFhX4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="10418596"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="10418596"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 07:33:47 -0700
X-CSE-ConnectionGUID: pXP9yfUKSs21h17QjnqMxw==
X-CSE-MsgGUID: 1OhaLlI/TQ22sn6GuJV0Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="26487655"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 07:33:47 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 07:33:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 07:33:46 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 07:33:46 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 07:33:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4di7/ipZHrT0sH3QFyDQom66C7Ff+4zugX7YLLRQkap/IHWalXrMZihPXTEn1RuTNuv3r9wJoH27YFpjuiOlHejv4Gdve+fgCKt4hLdMXpu2B+75rr9D+ooSk19L2WA50wiZnglaW0vibJ0RVEuktdW9/y4SAAuhWH0Hlldwr11ZwFtQM7RV15jTxntzBDm+h1B0zQdsp02LoI0p56M8Lp+uIJDGGpp9U/d7tDsh39Y+puahL2n8XUWNMoO19b1WuKrdISptB5OnQYttPKIMuxelJaBJOzErwPFyobMBLtJPo8xURc5FkO2PHx6ccD8FMKp2mDuOc5Y4y9h8FpxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTeeJqkFHMVbx/chf8sU2rjgTvqts90nFA/K8q+5Py8=;
 b=IMBlWZNJgr7A4tIlmaH1QBYKoQJNj8IBLIZBkRkrXJTo/1AzFcNRAx00ah7Pw/7vei84GH4884C0uVXau8zdLCgWblN6nBqAjMNCDXWxUh1Y/pr1s7bRRrCbaN76vxt/wDslsOY0xoyuLsBQe7DxEZdqMu2ectjxPJnpdukSocU+GnhUZZU+xmyonD+bZZmUGSeUHKDljqC1naa9+YASHCN/6RPZxFyfZeVKHLWPhRyCcNDIzE0FQIMnlYZxSaTUsZ09xDU9c362ZZgCU0NZCijzwmJVi26cpddO2jDhFj82HxdwLbisVPGmI7N+FG7ad+gpYPxg4tRwiMB6ZSk2Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Tue, 30 Apr
 2024 14:33:44 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::602d:c299:6d13:7e5a%3]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 14:33:44 +0000
Date: Tue, 30 Apr 2024 16:33:36 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2] drm/xe/gt: Fix assert in L3 bank mask generation
Message-ID: <ZjEBQMJUKdktH6ou@fdugast-desk.home>
References: <20240430114045.7-1-francois.dugast@intel.com>
 <z3yyivof7ofyqa2ckth4zd7pxlbxrt32uraewkkxyrunt5cakt@ttb2su5634yw>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <z3yyivof7ofyqa2ckth4zd7pxlbxrt32uraewkkxyrunt5cakt@ttb2su5634yw>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1923227a-b5c8-409f-bfc8-08dc692289c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3/Nj770bnsJg9y8SPBpPa1QrWuwoUpwVyQgaETqSyoDCQ+i40TFACibWps4l?=
 =?us-ascii?Q?Y6ija/bBTN4WkDaZ5bpAjA+MAeMNEA0p8GdXnsD1tI4IbrF/yy1uh/6pi/bg?=
 =?us-ascii?Q?BepOXHXkn1W0h7rDKNTDTT1hU9v/ou2C7bZ3shN9KUDLDQRZl4h2Swm2o+oz?=
 =?us-ascii?Q?6XFyBO/9YuHqbjAJD3Tq+XrdyhEBNLY17PrSNw6t0lCqeJNi77pNDiR5sUYG?=
 =?us-ascii?Q?ixr1k4QCg+SNDM9PbUHURVfKMkMnWtk4OL56+GdbYpn2qaANPdYEnfSkNYbo?=
 =?us-ascii?Q?9J2ZYWNBWyDEQ8J9gYPIrpSyfRaW+fZYfkpOw6xXUsT0lUFiFVrQnv7eB0JS?=
 =?us-ascii?Q?YJHpTUEf29XL+srp6NTWiDECYzaQTFwjtoF0eaIX7DVRGNlFeLSfnXP5MQBH?=
 =?us-ascii?Q?FaoW00jEzpAhInSBw29qmTyFTif4jIXzI25rTx+KzNB8NWJ+HdMaSodiMeM7?=
 =?us-ascii?Q?B4kJv8WcDqBUsW1h78E/uFl0I+PGeeZcFQm4rGornhADuvVxfeGR4a+IZ5di?=
 =?us-ascii?Q?TX/l09hm3yBQt/58BldobXq5Q2upW18ZPDKJxGwzli4pCHz09/ij8msZRgrJ?=
 =?us-ascii?Q?MQPTZ37O1Z4Ko1ytgYl4rWkjlUQzvVdNtg0irDZKO6wI+Z7DDTb7P5yaRz5X?=
 =?us-ascii?Q?0sHTV7aCv/yYsBMrOaEENHjxt1ku/Lb9i6BRqBLrxl53GYy2F8a+iXf4LIIn?=
 =?us-ascii?Q?YLIBg74KUlA2Nzg9Y1lh2ReAlJ+LT68pCImIvo7fQ5FFqRzpaXljMdtbVRtL?=
 =?us-ascii?Q?t05ryJwIgg9dHgpabmk6gpFq+SaFJsKHHFU7j3ALsRgfzh9ik8vpXo/L+uVc?=
 =?us-ascii?Q?za3PiAhwXfa2Emy3UQ3oZYNcGpG2KhkDIlaxb8LUJprCQEvfYOF7bLAM97NO?=
 =?us-ascii?Q?WG0drMm8IFWwK9jFsMwpQh02SPI99a0IDAvwQQWAbXPTqOfeCOyKFWMvaV5n?=
 =?us-ascii?Q?W43Z9K+Ilj/ImaeShoF3iBTDJCPLKS9awo2tjoEOQCrysYM4FpAudhsSr70y?=
 =?us-ascii?Q?1FLWX1KLXw0l7yy6MvEso/hiz+gWW53W25EcACUoKEFDOymUp50qxSk/kYjq?=
 =?us-ascii?Q?W133d9AwTsTLrs6R78LGonbBrXYdPu/3fpALO6gd8p3GeGotsrwNZ0sC/m2x?=
 =?us-ascii?Q?xNv/u24HoxbKTqJObyRjx255vGV882ufFwmylNspTiZt4olCCmj7+jn2E1wE?=
 =?us-ascii?Q?adC7I3TTGW12K2YyDiHzkoVL9thbB4Ol93kMmemcSOjyoRHor6dhJzq1TmA9?=
 =?us-ascii?Q?zOwezQJfBTpxKDLMcs/2tjTs7xOkx5AhT0MacIXM9g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UZSu0E3DlRZ8yTbQJ/kZBPGiI/4opF6iguw9cfOwadaQU3B1efKHUdbMAIZQ?=
 =?us-ascii?Q?gVS+Q5ShlnFUHZkTUJZjeaZcCMFeWQuHt1YPiLzsKeSDR8P+6qpdRYjjWeQu?=
 =?us-ascii?Q?7ebiu9f6GVLZKPRjrcIHdH6E/d9u1MU/hJwlFlIZkFFf9L430rSA3wbqZRYW?=
 =?us-ascii?Q?nNyAQXqlwDuLnFwk26DIuy95N7PMUCXaEo3e7QELID7Fkyo01To4ppBuWMMx?=
 =?us-ascii?Q?/Ac+aZX5UF27J8gD/SOVWlsY8W+w/MCYQH07xSbOofydt8iG3/pQzpekAeV8?=
 =?us-ascii?Q?R1eF2Ko5cgb1/afz33DrZV7HZtEkSVRwr9KWBjeH6Wy3rQ6SN8OhuPxa/m7J?=
 =?us-ascii?Q?9+qqx+fOocmXNoNAO6XJekKRrPd6cwId3KoLmNfoLOMIZOllrsLUkukmCIlr?=
 =?us-ascii?Q?Qc4qzftrpwmadO7dG3Sd8VjbFQI6IBaFBiAd0/d4cT3y1QcjJbEJ/cf6MoS/?=
 =?us-ascii?Q?7KYOWy8qi43qL2IHls1SqvgzN5O3SbRZV06RxP6kDGxgg5twVMdjpgOk6cYT?=
 =?us-ascii?Q?X+JCepfZlSpBrL2awsO7mIhyjyE3nRgHsefDchi56cl5p/LqACevKDmXGqks?=
 =?us-ascii?Q?Yy8GRs6u4GhCXffjLRNN8kaPuG3aDNavI0ZS1rAeeXb8YI0+2UhuNsgrFGhk?=
 =?us-ascii?Q?ACchB8AzJ4tsYsiDGMf9LLF/I75g6MI5qxYT/XW51tulm+axM+6tmwhbpFxF?=
 =?us-ascii?Q?DSsRQZtwzbS9CbrWPILDiVfInhLFHNwpt33onGGk5YL3FlO/emgexsvQ1O7o?=
 =?us-ascii?Q?sXKWIui7WHPoiMLoV+EGz4TDk/HueEiQzsR7oFGFVnZLQdMDX73bPB2wdfCC?=
 =?us-ascii?Q?19xBZK4Ig0rY5VjzVnV+oAVAXiFKaWCIY3VxRoAh9ay8yZB3ZWVWV3LpCg87?=
 =?us-ascii?Q?AaAx5W9e8mD0jMfaz/CeYGgI0LUfQ0UW2H0+Nawrv5FkGooXnJMpv2wl5Nno?=
 =?us-ascii?Q?bQRuYNZ+xRiL6sNRQ14ypy97TCunSy4MdXsuw4M6++hAmSN/KKmK9aPvgAVy?=
 =?us-ascii?Q?M8fF97TZsayy1P+QSic2GQm5UmccoBCkyz6kNYO+r3Vtala/FL1gvATuzPdM?=
 =?us-ascii?Q?e3Ci6A2Vqb+jG9p1bPeOkLN7LYOjk4GIlohfIZWVKaapth3tm5lhHDKY5NSe?=
 =?us-ascii?Q?qMtfa1X6DzQuAbPV8mtQlDIxGlDmwi4yRxPJmMoc0/M8SOyhDjRcP/P3UAws?=
 =?us-ascii?Q?4sKl7P4T3ChVdJnZWMHBCFMVN07XYjjnIsKxb1aCCeWG4Wiq9AGbJWjZP/4c?=
 =?us-ascii?Q?aLOSVGomOPu+r4bvZF55q+KkcBoq7VpFwCAgGIfsGjW0tq0SjEfAQvd6xHkh?=
 =?us-ascii?Q?Ab8MmAXc33ySt/ygWFT9MUpuURZLl3AJLTkr/AJN9fMM/enZ7vrCiNmcvWpA?=
 =?us-ascii?Q?yboivFHMhHiDfq5jbB/Y6oqTb8yrDDZa+W/9EbdgovFBStbijiTIfUHm9CWN?=
 =?us-ascii?Q?GHKviiJ6fJ22oMMj3X4Tj2g3QnihZr6CpgqLB0s2aCw5/O40qnTKaBJH48BB?=
 =?us-ascii?Q?LLjWDKmdsE4/rj1/t2pdnqppy13SCMvps3wJ+bAbYNIgj5ZIEiwiuEqkKXUT?=
 =?us-ascii?Q?xZLScHJHs1t9nq+3GZ9G9daBZ4mIEod/0LeVIb+jtXtvXHyYXnetbrckdMiD?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1923227a-b5c8-409f-bfc8-08dc692289c6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 14:33:44.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMG/rZMxWeE2Cw18AUuswpEgQL/p/K6ckqRvlozDJ/zjMhzcfcHokVhWp3HbGPhVHaNdfpjIRzAexCOx045Zc/864vqRTVHuUCY+cmUiXhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
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

On Tue, Apr 30, 2024 at 08:43:15AM -0500, Lucas De Marchi wrote:
> On Tue, Apr 30, 2024 at 11:40:45AM GMT, Francois Dugast wrote:
> > What needs to be asserted is that the pattern fits in the number
> > of bits provided by the user in patternbits, otherwise it would
> > be truncated when replicated according to the mask, which is
> > likely not the intended use of this function.
> > The pattern argument is a bitmap so use find_last_bit() instead
> > of fls(). The bit position starts at index 0 so remove "or equal"
> > from the comparison, and XE_MAX_L3_BANK_MASK_BITS would be the
> > returned value if the pattern is 0.
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gt_topology.c | 5 ++++-
> > 1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index af841d801a8f..efe9e5d6fd52 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -107,8 +107,11 @@ gen_l3_mask_from_pattern(struct xe_device *xe, xe_l3_bank_mask_t dst,
> > 			 unsigned long mask)
> > {
> > 	unsigned long bit;
> > +	unsigned long last_bit = find_last_bit(pattern,
> > +					       XE_MAX_L3_BANK_MASK_BITS);
> > 
> > -	xe_assert(xe, fls(mask) <= patternbits);
> > +	xe_assert(xe, last_bit < patternbits ||
> > +		  last_bit == XE_MAX_L3_BANK_MASK_BITS);
> 
> then if xe_assert() compiles to nothing we may be left with "unused
> last_bit" variable" :(.  I think it would be simpler if pattern was
> unsigned long long as apparently it would be sufficient for our needs
> and we could simply do
> 
> 	xe_assert(xe, pattern <= GENMASK_ULL(patternbits, 0));
> 
> As for XE_MAX_L3_BANK_MASK_BITS, the assert here doesn't seem sufficient
> as you want to check if the final result doesn't overflow the array.
> 
> 
> Wihout changing the pattern type, I think what we want is:
> 
> 	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits);
> 	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);

The array overflow check is a great addition, but the other assertion
would fail if the pattern is 0 as find_last_bit would return
XE_MAX_L3_BANK_MASK_BITS which is greater than patternbits.

What about this:

	xe_assert(xe, find_last_bit(pattern, XE_MAX_L3_BANK_MASK_BITS) < patternbits || bitmap_empty(pattern, XE_MAX_L3_BANK_MASK_BITS));
	xe_assert(xe, patternbits * fls(mask) <= XE_MAX_L3_BANK_MASK_BITS);

Francois

> 
> 
> Lucas De Marchi
> 
> > 	for_each_set_bit(bit, &mask, 32) {
> > 		xe_l3_bank_mask_t shifted_pattern = {};
> > 
> > -- 
> > 2.34.1
> > 
