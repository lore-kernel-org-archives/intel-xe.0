Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51CC27C79
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 19:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5010E4CC;
	Mon, 17 Jun 2024 19:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M4ZsjNks";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D987D10E4CC
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 19:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718652043; x=1750188043;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3OCWkM1NQpbkPYHi95k5A4dTsVI7zCCJiWH8FkBs3pI=;
 b=M4ZsjNks+eGaEgWKGmnwcRkFAgoBr70NjDclpx4OycobXcQ6U80FG3ht
 8KoZwcj2eQS7/VpNamSYl9XQLktR0qGMWwvvQVq+bmGHT1bCYaVGS57Yc
 KLwWt3oIFBojMONEVuXEOxFNy5ZC0RV0yaA4QY6kTZ1Z7Ko9s9ZFbrOwu
 9OToUefj2HfPNyw/MlcmJ1mvofvf9+8wTThU4mL9GsFRuS+lBnIE4N5+l
 oE/Yb8ob0VsRGz8Eyss/pQGC/79rNfrGhBmvWMVnEZkxe5GfQ7i84swfv
 85pQPBolUEX3XrqEFpn0UVP+kZGD9FeJKzL4ripReW5gGXT0f7byxo4/Z w==;
X-CSE-ConnectionGUID: nL4/F7lGTL6Acy1t9nnYmQ==
X-CSE-MsgGUID: Q3+0gZ9kTia5FP9AX39dmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="12116140"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="12116140"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 12:20:42 -0700
X-CSE-ConnectionGUID: nqAUIO3oT7Sze/BNhzliPw==
X-CSE-MsgGUID: Z3XCxs7GRNqVBPdkbz//Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="46242812"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 12:20:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 12:20:41 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 12:20:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 12:20:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgjuvmfbM+UEro9DW8fsy/OQ2VLUGFK3Lz6PgToW9q3we8j4b2o1u9oBCoxHM+r+59X9Ng9y6GhxV5T4ZLt1M979Ci7JR87EMhFhPGxFUFl1daN+8a9OofEZl251HU3gPdsT0l/Ow5m/xQR2LAkITpXV8whsTCiiHbrjlMtB0g9y46FsROtXC2Ycx4Uza7rUWyaVI51Xeh5i4i8fxTSI3xRbRmPHkG6iX8kvaNyRF363mjMGHnOfPPd2gU5VwS3V5fA/ltSLO4p14JE69a+MzU3cJ5g73TqbzsHSwKWxGaKuBD5ER2uYMVvSOiAL1jraC+m/qYvQt0uFp/MKmIcjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxHAWJc/CwmUpYwyNGpUO0/tv9QWOVAznhnhMmPS7oI=;
 b=knifLCT+qRfITtoEfEj8LgsV9win4rujKhy3rnxE8ToC+u1qp0isHvtczIyOAbbgSmdBZVszgKjnklTOQprf7tknsOYwitbVh7PdbgJJjEYLC0cbnbkKbfkC99qwEioLqL6JmQR7CZd4bQC70R0a83+jBBQabidtrZmt/Yjm66KouNbGAXsroqmmikGvJe31ZFs/Pf0KVBtKD3OtKVJM24P3q2yHhbz5507/aokXOeBkj1IhgcKlBXH0j831UDC7LJFNFFH5UqrL8cJfv83Km+ojzXsgmZehEKLZQeL+PyT8nMZvOK6Of0584Uvx/Cn/3Sz7bZqErj16rDMvyOzZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 19:20:39 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 19:20:39 +0000
Date: Mon, 17 Jun 2024 12:20:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/5] drm/xe/rtp: Add match on any GT
Message-ID: <20240617192037.GI2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240617182518.280975-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0173.namprd05.prod.outlook.com
 (2603:10b6:a03:339::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fdfbccc-d4ca-4850-bd95-08dc8f02929f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/cv6LNRaITU6cVsykdfkRA/MugKZESHTlI26ksual0SMsx0kW23bSFGUPS1T?=
 =?us-ascii?Q?Wuqn2XrbDzoqJ6naCNeDMC/Vfw+2QrgNwZ4JHZ0FEstOgFe9eHLsBF9hl8vt?=
 =?us-ascii?Q?+ZtZSAvdn7nd5GHeVM7mdk63aUhTpDHn7YrTHnfVzGL6jfkAdXklBeeAMFOG?=
 =?us-ascii?Q?3GWaO6c2xK3DOlOdMI0trYYwquHINnuwUmrvLbZkzwfo0N/92KXM1crHSe7w?=
 =?us-ascii?Q?pLKPb02mgfjrslTPbULXd1Co5TjxLbBmrSwuF47ODHR8ijc6mG5hk8q32plY?=
 =?us-ascii?Q?s6ld2yMXxDU8Sa9HQtS/Jql2Rmh2X2qv04TkHm3Dx3av9sHTB7MFZ9l3xP3R?=
 =?us-ascii?Q?oz5/4uTBELlMxAbIootPEq+dwKFuGCu99cnq/ZvuUvoZpYnVuOcrlFKtbcSX?=
 =?us-ascii?Q?UzUGf6UP4WnntEfyE7jmBQu2emKPyr9ekkv2RHu69MzfR+GD1ONle4JkQibD?=
 =?us-ascii?Q?2k0O4MZIa73Z/KLqOeMzFU8OsaVVvJyrb9Lp9Dv62T6XNOnQNnao7Sat312j?=
 =?us-ascii?Q?m08T1SpJbRpy2UxZM8PRYi6A15ZgXTLoBOX4AnMYvHtjHDr8uYC32W/ZcLp/?=
 =?us-ascii?Q?BTTMuTSp2VAWKprMFw8fJ9PMUlzf8K9cMxYK8fd+N6v+IUHxchtdlFZ2kiL9?=
 =?us-ascii?Q?Cmw+gpTQjIxBRIS37KypcsIKGd7L7OiOhwOD6uXlp0wB9YcFyc3lzic+KeiL?=
 =?us-ascii?Q?IiHm/zBPR3n0b7O6QXqCzV2XT74S8Xpna/6ZeBBRWjlDB5Ysr0lHQE7zsrg1?=
 =?us-ascii?Q?9IUjVYvOtOmoej87udVG9h+2VQmKEtDG4wmzDx0GZXXLwVCK58F27e3P4GUb?=
 =?us-ascii?Q?gbFLiyeQZo5syHVEAqd9qDyY9JTT7iQxNl4DDmHoZe8WZ6dfxyvH8wVs2+tv?=
 =?us-ascii?Q?N6Kjhs+wg57pQn147waSqsg8ZPwgGVFdcq1Txwz3IHPm08/QYfey/3sHcXSy?=
 =?us-ascii?Q?bw5+TBlQQLH75aXPVto+LhDuucBM94CPJcv+4RCLdIbot7Im6jqHZIj0jAW+?=
 =?us-ascii?Q?QC/FNpodiMqrBGJQI5EnLF4mUOC7NXGQyh4n/ySlkEHndhkO/jxXtHDz33p4?=
 =?us-ascii?Q?OFiQkmHf+kTAlZOKTntavEIEDVp1Ye/qGLEa19vwYCvqCzCuKZU6nfpgk0pn?=
 =?us-ascii?Q?Q8mlI8U3kIzHAHHZadWAqBECmE0Tjnjs1IXXqpWRgE6wnrnpHz9M17LFQo+X?=
 =?us-ascii?Q?d41ywijDWGCLlr87k6AaatiFYq8lzX46O4wSH2BzktqqfYjDUJJ6u9mKYj/h?=
 =?us-ascii?Q?wZ5O+LCFtOqsqilnpvOAuCbP7HP6FoGKh+zIsYsOk//vf8ox48N5qt0cMy/j?=
 =?us-ascii?Q?z66Zw6Thxh3JAZWOyC8fjHHu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xmAboFOEeivF5LAeeC8AHdBs0AXsCoOrU7zA14RkvIrPIrhvf7q5r9JJ7koS?=
 =?us-ascii?Q?Ldi3Ult17oqiMF+ZPTVKO03+bxR28udoSEH1Sda2Nrt+wEQJHmsjhSa12WFz?=
 =?us-ascii?Q?8pxIqrOQ4AKRamEdsLuqiBcgZeKyjOW4MRsaku5X+7lw6RgYmjNSc0foLOrD?=
 =?us-ascii?Q?3azBaUTvPbb3qLHzZ7KxrA+ALSZGhGeTnGxlE1q7lnqtRMUZdJQj9xHe278o?=
 =?us-ascii?Q?lKGBUfr6oKKibsQNUnufyKMbGHRn0Yps0mAsLgZyH2r09HzlqLrLOVhSs8p0?=
 =?us-ascii?Q?h+dnhxnXtAgj2masTTYu2j5+CgiAqG4IWtBcNqtkeQbvNBZCk18om6IFPrNT?=
 =?us-ascii?Q?9hh13XaUJEiPkmOoTW/50C06zttnXPi9lLceFTGJvZPTM8g8kzoPpWLouGeK?=
 =?us-ascii?Q?EMJOK7RV+VcIvglRdfJedgVpN7OazdHscnR0yYe/bi9FZFH2KxbDV/9ovf/D?=
 =?us-ascii?Q?WEEzTr25GAGq6hqlOPpcuxjEUiiCwmmyNnCfJ3jrtMld/FdWwMc5ip53ZiQ9?=
 =?us-ascii?Q?OLGyQbIThtQCY9gkxxDl++ZsPJ2CgoLUCacUHwhXLrLUrMV6QZidkS5IW1DT?=
 =?us-ascii?Q?0y4a8vFTUnGZ5gAfpBp5SufHc2WzDOUn1vbJSiv5ymSqXs2KBoh3GnKHk2iU?=
 =?us-ascii?Q?KujQVaVWD9CTFOCD4iTMicD1BOkAxHpEGjrueAzy/uI0Gafh/1kk2XXx56a2?=
 =?us-ascii?Q?rx+yPgJ473WY9M9fUcB7lU5mqs3iY5bPWSFq4uezt41UmylwsQMjBLb9Z6NG?=
 =?us-ascii?Q?F1hivhYxuqJNwI9n9sppXeqg4gaW/AOZyB3hjiSsGU7266XGqcF8r+nXBduE?=
 =?us-ascii?Q?rBqWgra2i1D+6d79nTWrAEgAoedgDl1gljarNT6ryn1Gt/oGarGd7/CcSDvZ?=
 =?us-ascii?Q?1jIFPfU4SYI5y6NoPx4zqpYtClUgQ3EqYfo2wIsQNzsRhsSIocFLyyOO3IG/?=
 =?us-ascii?Q?HNCF6BhM2HSoAH8Qy3fl9LQBnU8BSsR893f3PP8xlHPTeffVBn/OMmRSbcJU?=
 =?us-ascii?Q?zBxknUaPwmhR4xFGJppL614EkrEn/qyfQbThHVqOiuqoPuyMnYvl/pZWcYgV?=
 =?us-ascii?Q?jBxmz7RneXC5J3HQXfy8IBMbHJCHz0nx44UMLWJjD8bQSdoHNGDSPkXo+O8m?=
 =?us-ascii?Q?WA7ScYv7zC/XBK9VsoFM6WHJT2K2gQH7DHSFWPR64EPMuE6Bx13oXrwAcYjv?=
 =?us-ascii?Q?fijcgZNqSKjB+h2eecUHqW/JeB+02K/phhn+ibeFS7yAIk/CqSlDM20ciZHr?=
 =?us-ascii?Q?I62OTNAQ/2eP4x2339upNZ0DC1RuwFYirFe3T7lRM4CX9ZjK+igG61mJaxS2?=
 =?us-ascii?Q?mdKEY9YdftyUeOA+qErKaF5yrQRAuLi2Fj3n2MDeYNvUzCsUod0BpCQvsMW7?=
 =?us-ascii?Q?BxoUP5P9PpPkBStE40O1Q0w12C+GduVKKBTMOG7SdR3YwGiBeV6/qM9vBe1u?=
 =?us-ascii?Q?oe9uvJMpKYaohGUB+mMsvR3rHhlc3MsVf3T6a5p9gIXop5g2k6xYKRm4SQqy?=
 =?us-ascii?Q?NIFuHuHUiy7IvgxdYfPOoSjvvR8vrMAsFdFtjiwzFxMGGAvjead4RikoStSL?=
 =?us-ascii?Q?vAtuU1/Ch4lQl4ZiuSPuXUTUYApeMaBIQyOcrJmC5F3TPXiNjtPKKERBehCi?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdfbccc-d4ca-4850-bd95-08dc8f02929f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 19:20:39.3458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AqDlOQmHLvvfJaj3rXf9/rAYTqWIC3C0KfWTLnxGLDKcEJxjq8DIey6kFeHMw49OSY/PAzQTzmDPQKt6zH7W2V3oyVbGNzxWNpIs87lL9Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
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

On Mon, Jun 17, 2024 at 11:25:17AM -0700, Lucas De Marchi wrote:
> One surprising factor of GRAPHICS_VERSION()/MEDIA_VERSION() matching for
> people adding new WAs is that it implicitly checks that the
> graphics/media IP under check is of that specific type and not that the
> device contains a media/graphics IP of that version. Add a new
> *_ANY_GT() variant that can be used in that case.

Isn't this patch missing the corresponding update to rule_matches() that
defines the logic for these new rules?


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_rtp.h       | 30 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_rtp_types.h |  2 ++
>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index bd5b5ba0fb31..ad446731192c 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -140,9 +140,23 @@ struct xe_reg_sr;
>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>  
>  /**
> - * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
> + * XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT - Create rule matching graphics version on any GT
>   * @ver__: Graphics IP version to match
>   *
> + * Like XE_RTP_RULE_GRAPHICS_VERSION, but it matches even if the current GT
> + * being checked is not of the graphics type. It allows to add RTP entries to
> + * another GT when the device contains a Graphics IP with that version.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_GRAPHICS_VERSION_ANY_GT(ver__)				\
> +	{ .match_type = XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,			\
> +	  .ver_start = ver__, }
> +
> +/**
> + * XE_RTP_RULE_MEDIA_VERSION - Create rule matching media version
> + * @ver__: Media IP version to match
> + *
>   * Refer to XE_RTP_RULES() for expected usage.
>   */
>  #define XE_RTP_RULE_MEDIA_VERSION(ver__)					\
> @@ -163,6 +177,20 @@ struct xe_reg_sr;
>  	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_RANGE,			\
>  	  .ver_start = ver_start__, .ver_end = ver_end__, }
>  
> +/**
> + * XE_RTP_RULE_MEDIA_VERSION_ANY_GT - Create rule matching media version on any GT
> + * @ver__: Media IP version to match
> + *
> + * Like XE_RTP_RULE_MEDIA_VERSION, but it matches even if the current GT being
> + * checked is not of the media type. It allows to add RTP entries to another
> + * GT when the device contains a Media IP with that version.
> + *
> + * Refer to XE_RTP_RULES() for expected usage.
> + */
> +#define XE_RTP_RULE_MEDIA_VERSION_ANY_GT(ver__)					\
> +	{ .match_type = XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,			\
> +	  .ver_start = ver__, }
> +
>  /**
>   * XE_RTP_RULE_IS_INTEGRATED - Create a rule matching integrated graphics devices
>   *
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 10150bc22ccd..1b76b947c706 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -42,9 +42,11 @@ enum {
>  	XE_RTP_MATCH_SUBPLATFORM,
>  	XE_RTP_MATCH_GRAPHICS_VERSION,
>  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
> +	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
>  	XE_RTP_MATCH_GRAPHICS_STEP,
>  	XE_RTP_MATCH_MEDIA_VERSION,
>  	XE_RTP_MATCH_MEDIA_VERSION_RANGE,
> +	XE_RTP_MATCH_MEDIA_VERSION_ANY_GT,
>  	XE_RTP_MATCH_MEDIA_STEP,
>  	XE_RTP_MATCH_INTEGRATED,
>  	XE_RTP_MATCH_DISCRETE,
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
