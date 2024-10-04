Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B1DCF8852
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 22:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72CE10E0CF;
	Fri,  4 Oct 2024 22:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYv08FCL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C582210E0CF
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Oct 2024 22:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728081963; x=1759617963;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6COmp0wN8Bjo2MxpZFEawOfEcFfaHssaNsCv0bsaiyw=;
 b=PYv08FCLe+gWDbHRXoldA+LSRYBIpr92ZfTTZS6Wu7zX1mi+mqK5917Z
 DBQVw3I+EZkqKICQwzTuNbHlNwZS9s4RmK0b3F4VYgdfzw5wnBdEH3erU
 QeJkjGtjh3ZSnNOuJMtoezR8ECFnQL5u1CYR4yFuq/OqQ93RzRUQQKPB4
 4HmHLWVJGfXlfNdBP4Dl8TOqZYqf46ydafgTx30vMrFm2h9CTaiNXT65P
 botDxcABJspYu4ewXwO7f6p/Ufp6tEk70gfw9Rxe1FsnCzgOF8W/zdBS5
 YxCKIOFz+idDl3YUJX65vTTzAj5avz3FSmuiEiM0KZkGHPo+8GNEl9/+Z A==;
X-CSE-ConnectionGUID: 4a4ThLK5RuCZ6hLiAsbzmw==
X-CSE-MsgGUID: KiqSxOVXTAmCcZRDEfXINQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37973215"
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="37973215"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 15:46:03 -0700
X-CSE-ConnectionGUID: bVRT7zSPRyGuyVW3pnyzIA==
X-CSE-MsgGUID: +Z5awcelR+KTQNQ/EW83gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,178,1725346800"; d="scan'208";a="74521468"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 15:46:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 15:46:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 15:46:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 15:46:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/JFBJ23okcqxSB6VmHtrANBuYuKkuDX/PXexX6mdld8jbZAmtyiRAWeXJNDT19GDlqOROJhj+gIwKiDO6Wn1uP7PVM2IPnNErT7Opc3P2tp7f1YUG+z4N01JDgXME6xxu4Zw3p/dPoI8/xoTW8fe/T24raHASoGBnBcdTURG8tlP4u6TOb45fC5dHXcAR54a+Wuoih8LIYSoQlWn82OmzaHGFw5syYCzqBaTUNuwNPUUd4hm6KE/ZmIcDSu8Z0zOWIoPczMTt39quqWg/kBdpwW+ge9UpRTtyKBENzxjQr3H519g2LD36SwSjrbDSdy/T/2pNksK0Gp31XKvP22uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wa6/2NyJhMzDZfCzdg0Z9xS3mLEciFgzZZUJZb1rDLI=;
 b=LR+5J2j3p1xAJ9rE0GihnCQMG1gvFQDNYYBuYhrQ5Z2F8eqRBRENbV2dPQtbGG58jzAGZ9jyklYcTO0OoWXbv+ytPYBFBUQD2omHGXc4rd5RHefEJcGxO5pq9jYCTqFNcA2XqpaHUBKK+y6gP4dveWz8LtjSfT0zoc5bKEQr42NB11RaAJIzPZYAkO/nOwjPwQLfD39c5EI8pQL0EVmOujsKnwVLKCTOwh2nHUadu/rVwkMA4QW6baS19aMUvAgqMcHeht2Ivqg0QtVXmY9GctQQp8WdjvO+rdT+BWPd4OSxbJ74H2WRpSlHQlcUH8SGnEHyWdcqMP53+Jw3WJjchA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN6PR11MB8218.namprd11.prod.outlook.com (2603:10b6:208:47c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 22:46:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 22:46:00 +0000
Date: Fri, 4 Oct 2024 15:43:39 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Haridhar Kalvala
 <haridhar.kalvala@intel.com>
Subject: Re: [PATCH 5/6] drm/xe/ptl: Add PTL platform definition
Message-ID: <20241004224339.GP5725@mdroper-desk1.amr.corp.intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-6-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241004220550.94308-6-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ0PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::18) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN6PR11MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a98b804-4938-4a36-7418-08dce4c600af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jaIu64kE9nijZvWTdbQEM8lvWVVGI0pkGgchLjCmOO+oxa1DTs8NP77Ju4Vj?=
 =?us-ascii?Q?gV01JpaTl7nphWnDlK+yyqOBY02kOlifWUdqmM3GfTwUuj0zJN0I//VhTfff?=
 =?us-ascii?Q?mZu+yyf6DqBzJb9lmXkW97bVUFWOSf7eAWCTn+btXBF+4Kg7Eygxfj1yTQJP?=
 =?us-ascii?Q?NEGVUIJoe3ZW2CkS8lVK17s2kUCekQ/hOpj1brzZs9zgASNqksUdGw7bsKFb?=
 =?us-ascii?Q?HQ1n9vXe9VPP7S7gI+qQvC5FktLqqAva8lwdftmZGszZJZzxYOrxYTamK4zn?=
 =?us-ascii?Q?8lLy1RGSmbfMGRGDueZy6K6Un8KypfDHEUE1fpS3SzwSxnTVIUJBoqgltXqu?=
 =?us-ascii?Q?mO+xVTZTMWdqnuSgG+m7/sUyqJOE3YyUFaXLvQjQPi6y4n8fXOx0LFqsn6Qe?=
 =?us-ascii?Q?jFLn1V75Fj18qUD0gkUsO06Z0zmSThZZwq/1J8ZKgkvgSLkRritfVlTzZai+?=
 =?us-ascii?Q?z10Pz6/5CG459KdjxOuhQC2Y52uNlnBDcA41Lsuh9Sw+w4fK4BVCR6H+k3X9?=
 =?us-ascii?Q?x4+ooQthH9U0TT4iw38e5eKkTPhDaLu+hb54GG9/dQ/Vq++xd5f3z5rJy+mp?=
 =?us-ascii?Q?aydU6mbKP/s2XgELFjboMg5CFLBD1f+qa4oteXXQvubk8Otymtr5tTCO2OyI?=
 =?us-ascii?Q?aKpjDAdCXMi4m1ikYQeFPu7+MzFnz6Oevp6iA2TdAh/xCd+Lr2cLX648tIUh?=
 =?us-ascii?Q?7MQbLQa2GF8kJ3svskKVJTtjgOKVUxPcehlq1YbgFmrb56DcCBEKKWB+m2kP?=
 =?us-ascii?Q?C8V4Bw6UIpl2M4ruaRTlA4XRG1+l5z9usuEur0/YpHLwyaaQ4PRQYJOwZaNc?=
 =?us-ascii?Q?AeSvnBTmYunCZ6RugKGWBhSe44EnrL4usXmBVzi5FPTXnYhePFYNr1Rq0PGT?=
 =?us-ascii?Q?NeMuHzPc16eXSAkr8H/VIsaU80fyfuyV11pIiHt5sg3PHZy68DAD8g7bZWHS?=
 =?us-ascii?Q?kWh4oSUc0DCK+9MmRjy8kIOvZyVJzxuaXJnM/Ncfjsw1ygfEMaLx4LYobWgd?=
 =?us-ascii?Q?uJQsPQlDPbQFXtTogdnCxU3NO+lmKpcIryMXYmh3LDMmFcA+LGvdvoQ5FmuO?=
 =?us-ascii?Q?qLsZXwhlDEwmDdMJuEw+I10D9hXIUk9Eu7frpJ7JOBZEzTQADJpZ+8YsF13l?=
 =?us-ascii?Q?L8MogWTHvpruqzUYtuRDeiiiDiePYGSp2mty28q3fLruql4gfTIHKZxjwlmX?=
 =?us-ascii?Q?eDYhy4SGOG4fjQZ40OhEhb7HqXMLegKc4GQJ8so62SF7kWfUU3FPXoXYqzWn?=
 =?us-ascii?Q?YPbX3QXrCJEg82aX+MoI7eiM6xWY1Xx3juN3BwJ9Iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vbuDFx7z896hhZRTzLEykZ6sC7gSAn3IUBdWWdRiChp/8F8n594GB4v5jwzK?=
 =?us-ascii?Q?Cn/d//rHfn2WnOPgC0wWP6MVydUHbeCIGuwVb+zrMb9CTPJtlc5dj+l5ljR+?=
 =?us-ascii?Q?VDis63iio3OBfWMbeVHky8vvhTt0VznTOJ32tEBz9Fp1gGnArzrxvyMhefgj?=
 =?us-ascii?Q?8qT1SfW4zTjkjgd2k/JZMp1rtIonHLkBks1Z2x59QhHOhBnj6FZtvoniIGaV?=
 =?us-ascii?Q?PILROWu2OzLQc4Z/xxCEazzYDYxgN/XZahaed22FZYwYgkZfLSpRHXIi6mhJ?=
 =?us-ascii?Q?cskxL327AmzQCiv2AEiuJdsWmlQ+YZhV0rDPNOhCwjOBkCyn9Dm8zsY3Kcme?=
 =?us-ascii?Q?vf9p3jRYTeSSo3LImmRFROglYefxk90uxpf48UMjnDPm3bNqZpagJgWKZiKT?=
 =?us-ascii?Q?dj5AgT2WKzOgPGp2+9fsCx8VgADeroQxJIPtYkpyZNznMDlboWD2JfhapKAy?=
 =?us-ascii?Q?g5ZetfqUQA4THB2eGx7fJVTLTtZjfPimZcGM4GODel+W+6G6MZq3MUaXarHa?=
 =?us-ascii?Q?Urjay1BJSetz1DeB5Q1DeV2CyMhcTt3L9UUgeEoT4JvQiT4QY7C7RGc6RFxJ?=
 =?us-ascii?Q?5lvlsDLnuERLMO7R1I4x7qTMuZ5DhfrP30XdLTwB0h8HZtl0Fk8voQBZgsvu?=
 =?us-ascii?Q?BquNmmjl9cKoYggRx2Iowj1PPRcz1D2fpi4Gp+zvgu8pSiTZpMl6cvtZSrKA?=
 =?us-ascii?Q?Fs84MvIltoNiXSzMBi/0EMoxLCa28uuNEUQ0iOrEDTbVnmK3rtZzLlfgAtSd?=
 =?us-ascii?Q?gd4Q6WKvQF+zVOIEOBwS9xwrj5rw7w64MC90IJ/P3YKTKJSqQ1m6mFu+enIr?=
 =?us-ascii?Q?lFvmPe5YSTxVQrViWbbo380DtfO5CAKasCnZ4BTevhmCWsCsjGRljlVJHBL/?=
 =?us-ascii?Q?oq2vf8DjL5I/f/Cxl+3FScPG2ZqfwEbIu588YP3PqTU0f61WwohbNv5EypMB?=
 =?us-ascii?Q?sr2fKrp7bdGuIN1EQRGMjroNo3LaGgzjQPYwEEQPMauaaWnAC045B+pQwuet?=
 =?us-ascii?Q?XwUm3b3cziIhP4UBdyNgJQiQdjT24oJE4Ofu7QgxCJt5l9HQhDUwnprw+1r8?=
 =?us-ascii?Q?bkpDlwW0gN1wHfKQfTyQyx8z9Vyy/sBOVFRxPsyGg/eHhmjDSGZJAovQIGgU?=
 =?us-ascii?Q?7n4ZDfI215cBQOLhVA8KtBM0LFEr+vj7g+EhGXxa2vgBvYKeVKsK9pFYS+dp?=
 =?us-ascii?Q?9w7yQDR0zB84C1kIbw+tMKDY9oRmesykybA4LEZCaX5k94I13AVdzcfmiXpz?=
 =?us-ascii?Q?ZHZXZEuI6a7mYHlwVImDG6k8si+nFhGuyUTckIFCdU86Y3fr1OVpjcKoLs51?=
 =?us-ascii?Q?lHciQ90N9Ka30eb1p6NHRokGDLxacOsgir3EZlQ/4j0Lm/cwzlkHuDxns5JR?=
 =?us-ascii?Q?OJYtMEK2tgci8yn3Yt3FuvIiyOgXizjvdbZTShHGBv1kUcgUDzxZDhRx3gW/?=
 =?us-ascii?Q?D8cAxV6iLH+k7EybW8CssWPW8C4yxlTbkN79hDNF9QYh5Yfa4S0fpHBxqFbP?=
 =?us-ascii?Q?mqBGGl6QhnM387ofJfESaflSnc5mxGTmnrAOGZj11e1NSDnmCd9exd9ASsh4?=
 =?us-ascii?Q?MkSpXX6pOyxNHwGfT7g4ttex4b3izxiZfQKGAuxam16LMIf9NNAE1OwWIDoa?=
 =?us-ascii?Q?Yw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a98b804-4938-4a36-7418-08dce4c600af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 22:43:44.6982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fwqX+6UVkmNUwGz4L/Jj565KUVPs19Icq2Y4JKwzewbDsY7Ckr0qTrXY4zbivV4mGkHGMnugC6i5z0KVc5IWEPmLIb19SnIkmnOGC219/68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8218
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

On Fri, Oct 04, 2024 at 03:05:49PM -0700, Matt Atwood wrote:
> From: Haridhar Kalvala <haridhar.kalvala@intel.com>
> 
> PTL is an integrated GPU based on the Xe3 architecture.
> 
> Bspec: 72574
> 

We usually treat bspec references as a git trailer, so we don't want the
blank line here.  Aside from that,

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c            |  6 ++++++
>  drivers/gpu/drm/xe/xe_platform_types.h |  1 +
>  include/drm/intel/xe_pciids.h          | 11 +++++++++++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 6b2dfe4b305f..c7711f6aa095 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -355,6 +355,11 @@ static const struct xe_device_desc bmg_desc = {
>  	.has_heci_cscfi = 1,
>  };
>  
> +static const struct xe_device_desc ptl_desc = {
> +	PLATFORM(PANTHERLAKE),
> +	.require_force_probe = true,
> +};
> +
>  #undef PLATFORM
>  __diag_pop();
>  
> @@ -405,6 +410,7 @@ static const struct pci_device_id pciidlist[] = {
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &lnl_desc),
>  	XE_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
> +	XE_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 79b7042c4534..d08574c4cdb8 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -23,6 +23,7 @@ enum xe_platform {
>  	XE_METEORLAKE,
>  	XE_LUNARLAKE,
>  	XE_BATTLEMAGE,
> +	XE_PANTHERLAKE,
>  };
>  
>  enum xe_subplatform {
> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
> index 65520a90c17c..6d8d013f74e0 100644
> --- a/include/drm/intel/xe_pciids.h
> +++ b/include/drm/intel/xe_pciids.h
> @@ -220,4 +220,15 @@
>  	MACRO__(0xE20D, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__)
>  
> +#define XE_PTL_IDS(MACRO__, ...) \
> +	MACRO__(0xB080, ## __VA_ARGS__), \
> +	MACRO__(0xB081, ## __VA_ARGS__), \
> +	MACRO__(0xB082, ## __VA_ARGS__), \
> +	MACRO__(0xB090, ## __VA_ARGS__), \
> +	MACRO__(0xB091, ## __VA_ARGS__), \
> +	MACRO__(0xB092, ## __VA_ARGS__), \
> +	MACRO__(0xB0A0, ## __VA_ARGS__), \
> +	MACRO__(0xB0A1, ## __VA_ARGS__), \
> +	MACRO__(0xB0A2, ## __VA_ARGS__)
> +
>  #endif
> -- 
> 2.45.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
