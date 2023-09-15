Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37700EEAA7D
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 00:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D2710E0AE;
	Fri, 15 Sep 2023 00:08:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEE510E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Sep 2023 00:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694736528; x=1726272528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GYXpX7RJIlHV4iyJOnXuZKqa+OXvTbAQ66gWTRsvamM=;
 b=XT+cwl4pdKd57tR1prWug2P1syHEBqQCPvtXdkzR2+iMLWA/KYMYWpaz
 b4TtLShPf3eUHpEp98a73j1+dYOTTz3ZlSIWr5/rBjX5p+R1+faORbTj8
 PU/J1ANfi5RA0wosxNiAzJHxnZkI2MwVw8nK2Jb5Hn45XoSRVXjzIr0Ua
 c/l1c55c7zaYbG6zSj0wlKB8EPYK9aZcnj8tVcsPj/Y0ejultgHKR45lY
 GDR4S84nD+HCKEEc8xEifP6s3FFu6N7zpzpd/J7JVm+5SMbNWiT2+RlzB
 tz9tAo90HjKxjq3/E5IULkp8UrjovyHWZdl5i1HbAbcpcBskoRW8i66Hb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378030985"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="378030985"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 17:08:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="747991864"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="747991864"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 17:08:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 17:08:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 17:08:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 17:08:44 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 17:08:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eg282D9XmevvxC2uAHgsFJ1o9Lg3wOlpgUzGjWvw3n2bypdg7lnQ83TA/4UDRyXiLIaaRJOWoRVyfEXlRXnOvOQNLFKf3HgXYcEgzcttuCVfPgbdRi1pWc1JkTlUw3fOuSq1g9SUy3zdAl6hCIyw1vFldMGuiDnSX2OBrpWo+P83gZIT7sEMQFj+BSNOMYgyQIdlLlCZjCQIujlkDwXA7bPO8CgupyVcZ08JeoIW8MzHgRgMq9eqZfJGEO2xsDHUSKqldwylEm4mKGCAtySb5A+BRAv8bYyyo9bgXba3Fwf3EQxaafEEaPVYj7hOacg2a28ZSisokKD63AI41gNttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUKa1IEvOvmiq2cKXCj23nLlc8AEoKGEow5PiQXVbsA=;
 b=l5xqDMi8+wSrqzIRfmNsZ1tZXYG0eRT58v7qjT6NVjcFU00PbtGbYjlSTT+kkfObXpbvgn2M6aTYGDqLy7rAVfDLZSiUSpIosq/gBbmAfeIk7gtz3d5KlHtwy9fSX+yipgBSuGvXmyb8fKMykkBiZ8Z4I3PSYCcawrnFnQ6dHLsKxeXdHDlNXxiVH2ZBPwnir+D0/dO/9cHdAyff6CC0OxcoFH0VG72VsZ1DDsgBc0T3b+M4XIr0LB1Z78Tr01953OpKI661eUFQzAmv4uVprFaZHHJvKljv7/qokSST6/CNzds4dzHuFj5/2iPcxwF3+aL7btEETgHnV2pOw8HQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB8276.namprd11.prod.outlook.com (2603:10b6:510:1af::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.35; Fri, 15 Sep 2023 00:08:41 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 00:08:41 +0000
Date: Thu, 14 Sep 2023 17:08:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230915000837.GY2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230914153112.455547-8-matthew.auld@intel.com>
 <20230914153112.455547-12-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230914153112.455547-12-matthew.auld@intel.com>
X-ClientProxiedBy: SJ0PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::12) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e609cb-44de-41c7-cb91-08dbb57feacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HhG7KGG2oV2nsHmLVcxwVdguSX/jreojzwtw4ifmCpjPUioWUNdeQL+iDFshf14uGzJOLY2bn976HEi+eLIbOfFE7s6NSIPkWU+W+kNPAqyfrw86FAbVe/c9jPBmELjAqzT24JoKynnpECqltTbzN5rFMVQ0DnFbxOkrLyXVkprjl9ZIUy0gzhP2F/oztrk5XFLdiSMv0WKwf1LqfHuDO/Spry0blPJ9C70z9FAH4d/vNFSCPJD9Cof0IgUoTtFcqzamnrTjAN2Dxjc8Wg8fu2xz2I2dVIHcaMmtAAjv5a6gcqvJ55KEUw08Zort6RueNcpG4tGrnSl6tPMar5ddst/5TO2ySPi7dAJHZ9Rs4WtBb7cBVqbBxBbPOwGB45JdEUf/9MSMrf7jhB+zLYaBjnnQfvEFtc3u7fGPXReCvzIq5W2hAAtl+hjucLwRRhXPlBbEmd+Mt7SWjcfOK4eVrjceQsvJ397fYNl29AOSej37XPa/y6QVQ8HmcVyvu1skwMBbWUy98NJRmG6GH9X+sPh34hZjCtep8+InvZJ2uXSQtbijCzp3blaneOLKEbRb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(39860400002)(376002)(396003)(136003)(186009)(1800799009)(451199024)(6862004)(83380400001)(8676002)(4326008)(66574015)(316002)(41300700001)(5660300002)(8936002)(54906003)(6636002)(478600001)(66476007)(6506007)(6486002)(6666004)(66946007)(107886003)(66556008)(26005)(6512007)(1076003)(33656002)(2906002)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Iy/LQ/QvEElG/QypNc4n+ZWxAgC9BbUGwtuuW8NadsG8HlSciHez+3GkMJ?=
 =?iso-8859-1?Q?UFX29hKWqUk7/giDeE1RfkearVO74pi/8bghOqnxR+xbbUbPNESz3yeIf3?=
 =?iso-8859-1?Q?LAYb6OZBBXOJsacQpr1ssFKv1E5+Teepyl0ezAbJV8ek4PgpYKRN2TUVA0?=
 =?iso-8859-1?Q?ggOokJT1iSHP3nmj2mhguH7Guet6zRUUk9POsUYYbzQTXxg7zbo9vT9QLn?=
 =?iso-8859-1?Q?Elxvp6Oux8TVuROdqESTcUQHSIeORsCb5RsfZrRqb0cxMwiqp+royhMakg?=
 =?iso-8859-1?Q?Iisc1wQvrBjY5c/1/T9xuDP4QtTPVkxPyxLrT/u4kRwZt4/X7M6mOBv3cE?=
 =?iso-8859-1?Q?Qq3yiScmTXwuXqFTP/+i0QUaCk3DtWkJa51rYjmjAPVNZhVAsa6QX1jglz?=
 =?iso-8859-1?Q?fOp6mshHFdw6BAdD2tmUVclRHwEkPxmzTrfqu0ktusn91+5oXzFBtTZkLs?=
 =?iso-8859-1?Q?uEFPbWMK21GAHUtvyANJU2hWXVcNjxcE09yaNVAXuoEvu5ytZTMFbrz0p7?=
 =?iso-8859-1?Q?Ksk8kQsnT8W5xvZQku+ZteIwLyRuYHnvsP1cQXcYBv+fU4gRUmxnB+g631?=
 =?iso-8859-1?Q?pQvXr3N8/DO6rPRLC9Nki8fuaevTaXDUgoTgFyDOWvk5KuRsAMyF2NU4v9?=
 =?iso-8859-1?Q?LyKXfX0zsYTTXzmnJzOTZV6gNerXCRBM9Ol//gDYDvQKRB97427Cctkks3?=
 =?iso-8859-1?Q?Mm/nRz0vPOk10Kbfr2OPpPHwoyuHoY+Q3wdggiKuFuG/vNfTgXQJGV2rH2?=
 =?iso-8859-1?Q?PpQPW9gLzMzqy8ywKvNlrEB4sP5M4SOt9X09eAT15sb2qqa9AjzFuMY3m9?=
 =?iso-8859-1?Q?WDooHYil6dFT2x6H+BhgiSsQ3jeRszN1GS+7tuguwGhmfaRyVMwxAsggE1?=
 =?iso-8859-1?Q?53KVeibvX1CIVl1BIZP9aXvSa1tuJoqPaQBPzHzXllHUn+DXBootVb4LUb?=
 =?iso-8859-1?Q?VSeJmYfKtp7B91RJLmQMqe62qNCQSzCdVoa8v5YkbijFeSbG3R1dIFub28?=
 =?iso-8859-1?Q?J0G94KgHQ8mSZJ2g7Dn9eDN1Ko0jLuETOxwxOoyYIG4xL6wm7RAXEBbJxM?=
 =?iso-8859-1?Q?EMQDKd11HbTynEmaYlsr9vljBWeoHbGu3c4FMdo+P/nytrl/oCrgTQQ//6?=
 =?iso-8859-1?Q?7hop21TjFF6kMD6Tl6fSJ/PvnybcjWPpN1TfWXwf4WPeQFTrNjrGLVSAbr?=
 =?iso-8859-1?Q?zTMHUGkWFsEqH7n3u6XY+WkAH49yRTcjISnW/rkTDIePrgc0rZT0KFn9Sq?=
 =?iso-8859-1?Q?czR6j0Ir++5Ucx4tNZRWfluZczSGd9WI08z5GT2kjEEmYXHKXVrLDw0Bqc?=
 =?iso-8859-1?Q?WU/T0p4dCPqFsn+SMskAYUMuhhbJU+5+5jkojacw1PAqT2GhPFzrYCyEGK?=
 =?iso-8859-1?Q?Ud8FMlULE4GhFpjDP1kx/SKNx0KzPzWALvwaLJ+gU3Nsfdj27wGTiobGQM?=
 =?iso-8859-1?Q?Dp9z8+VrsREg4eowBvJSSSbzdiyh7v7QnuNlmo59ZWahXaF7K+n34oRmD8?=
 =?iso-8859-1?Q?SbtTz7O8RWFcZgDwYabAII02MxBY2AKKh/9sfmXiXDNGZqp53slH/cticm?=
 =?iso-8859-1?Q?Koims2khn8X/rg0Dalx4eBN8rBmryIRw2pFVTjM9zhkqspx12aUGK6hUNZ?=
 =?iso-8859-1?Q?6gZoiAdwYbdJXPK84W93T8ZhCPL6Zhze5OCsrwHJcg2utO8CtlSzvQAg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e609cb-44de-41c7-cb91-08dbb57feacf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 00:08:40.9280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MYZLI6I9UXfQTVvE1ebsAwNuMIkL4ZbLw1LmKROO6zwuG9cCTBQ+a4+7zS4WnoxVS0EuzJ+nmYFEYjTbzJvUqgXRcjkE5id+JsSoTfSqfDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8276
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/6] drm/xe/pat: annotate pat_index with
 coherency mode
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
Cc: Effie Yu <effie.yu@intel.com>, Filip Hazubski <filip.hazubski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Carl Zhang <carl.zhang@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 04:31:17PM +0100, Matthew Auld wrote:
> Future uapi needs to give userspace the ability to select the pat_index
> for a given vm_bind. However we need to be able to extract the coherency
> mode from the provided pat_index to ensure it matches the coherency mode
> set at object creation. There are various security reasons for why this
> matters.  However the pat_index itself is very platform specific, so
> seems reasonable to annotate each platform definition of the pat table.
> On some older platforms there is no explicit coherency mode, so we just
> pick whatever makes sense.
> 
> v2:
>   - Simplify with COH_AT_LEAST_1_WAY
>   - Add some kernel-doc
> 
> Bspec: 45101, 44235 #xe
> Bspec: 70552, 71582, 59400 #xe2
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Pallavi Mishra <pallavi.mishra@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Filip Hazubski <filip.hazubski@intel.com>
> Cc: Carl Zhang <carl.zhang@intel.com>
> Cc: Effie Yu <effie.yu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_pat.c          | 59 +++++++++++++++++-----------
>  drivers/gpu/drm/xe/xe_pat.h          | 18 +++++++++
>  3 files changed, 54 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 6c50d0f03466..959e095eb46c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -244,7 +244,7 @@ struct xe_device {
>  			 * @table: The PAT table encoding for every pat_index
>  			 * supported by the platform.
>  			 */
> -			const u32 *table;
> +			const struct xe_pat_table_entry *table;
>  			/** @n_entries: The number of entries in the @table */
>  			int n_entries;
>  		} pat;
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index fb490982fd99..f4fceb3fa086 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -4,6 +4,8 @@
>   */
>  
>  
> +#include <drm/xe_drm.h>
> +
>  #include "regs/xe_reg_defs.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> @@ -33,30 +35,30 @@
>  #define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
>  #define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
>  
> -static const u32 tgl_pat_table[] = {
> -	[0] = TGL_PAT_WB,
> -	[1] = TGL_PAT_WC,
> -	[2] = TGL_PAT_WT,
> -	[3] = TGL_PAT_UC,
> +static const struct xe_pat_table_entry tgl_pat_table[] = {
> +	[0] = { TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
> +	[1] = { TGL_PAT_WC, XE_GEM_COH_NONE },
> +	[2] = { TGL_PAT_WT, XE_GEM_COH_NONE },
> +	[3] = { TGL_PAT_UC, XE_GEM_COH_NONE },
>  };
>  
> -static const u32 pvc_pat_table[] = {
> -	[0] = TGL_PAT_UC,
> -	[1] = TGL_PAT_WC,
> -	[2] = TGL_PAT_WT,
> -	[3] = TGL_PAT_WB,
> -	[4] = PVC_PAT_CLOS(1) | TGL_PAT_WT,
> -	[5] = PVC_PAT_CLOS(1) | TGL_PAT_WB,
> -	[6] = PVC_PAT_CLOS(2) | TGL_PAT_WT,
> -	[7] = PVC_PAT_CLOS(2) | TGL_PAT_WB,
> +static const struct xe_pat_table_entry pvc_pat_table[] = {
> +	[0] = { TGL_PAT_UC, XE_GEM_COH_NONE },
> +	[1] = { TGL_PAT_WC, XE_GEM_COH_NONE },
> +	[2] = { TGL_PAT_WT, XE_GEM_COH_NONE },
> +	[3] = { TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
> +	[4] = { PVC_PAT_CLOS(1) | TGL_PAT_WT, XE_GEM_COH_NONE },
> +	[5] = { PVC_PAT_CLOS(1) | TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
> +	[6] = { PVC_PAT_CLOS(2) | TGL_PAT_WT, XE_GEM_COH_NONE },
> +	[7] = { PVC_PAT_CLOS(2) | TGL_PAT_WB, XE_GEM_COH_AT_LEAST_1WAY },
>  };
>  
> -static const u32 mtl_pat_table[] = {
> -	[0] = MTL_PAT_0_WB,
> -	[1] = MTL_PAT_1_WT,
> -	[2] = MTL_PAT_3_UC,
> -	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
> -	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> +static const struct xe_pat_table_entry mtl_pat_table[] = {
> +	[0] = { MTL_PAT_0_WB, XE_GEM_COH_NONE },
> +	[1] = { MTL_PAT_1_WT, XE_GEM_COH_NONE },
> +	[2] = { MTL_PAT_3_UC, XE_GEM_COH_NONE },
> +	[3] = { MTL_PAT_0_WB | MTL_2_COH_1W, XE_GEM_COH_AT_LEAST_1WAY },
> +	[4] = { MTL_PAT_0_WB | MTL_3_COH_2W, XE_GEM_COH_AT_LEAST_1WAY },
>  };
>  
>  static const u32 xelp_pte_pat_table[XE_CACHE_LAST] = {
> @@ -78,27 +80,35 @@ static const u32 xelpg_pte_pat_table[XE_CACHE_LAST] = {
>  	[XE_CACHE_WB_1_WAY] = XELPG_PAT_WB_CACHE_1_WAY,
>  };
>  
> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
> +{
> +	WARN_ON(pat_index >= xe->info.pat.n_entries);
> +	return xe->info.pat.table[pat_index].coh_mode;
> +}
> +
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache)
>  {
>  	WARN_ON(cache >= XE_CACHE_LAST);
>  	return (xe->pat_table).pte_pat_table[cache];
>  }
>  
> -static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> +static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> +			int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
>  
> -		xe_mmio_write32(gt, reg, table[i]);
> +		xe_mmio_write32(gt, reg, table[i].value);
>  	}
>  }
>  
> -static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
> +static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
> +			    int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
>  
> -		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i]);
> +		xe_gt_mcr_multicast_write(gt, reg_mcr, table[i].value);
>  	}
>  }
>  
> @@ -111,6 +121,7 @@ int xe_pat_init_early(struct xe_device *xe)
>  		xe->info.pat.table = pvc_pat_table;
>  		xe->info.pat.n_entries = ARRAY_SIZE(pvc_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> +		WARN_ON_ONCE(!IS_DGFX(xe) && !xe->info.has_llc);
>  		xe->info.pat.table = tgl_pat_table;
>  		xe->info.pat.n_entries = ARRAY_SIZE(tgl_pat_table);
>  	} else {
> diff --git a/drivers/gpu/drm/xe/xe_pat.h b/drivers/gpu/drm/xe/xe_pat.h
> index 2f89503233b9..809332ff08d5 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -28,9 +28,27 @@
>  struct xe_gt;
>  struct xe_device;
>  
> +/**
> + * struct xe_pat_table_entry - The pat_index encoding and other meta information.
> + */
> +struct xe_pat_table_entry {
> +	/**
> +	 * @value: The platform specific value encoding the various memory
> +	 * attributes (this maps to some fixed pat_index). So things like
> +	 * caching, coherency, compression etc can be encoded here.
> +	 */
> +	u32 value;

We probably want a blank line here to keep things readable.  Otherwise,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> +	/**
> +	 * @coh_mode: The GPU coherency mode that @value maps to. Either
> +	 * XE_GEM_COH_NONE or XE_GEM_COH_AT_LEAST_1WAY.
> +	 */
> +	u16 coh_mode;
> +};
> +
>  int xe_pat_init_early(struct xe_device *xe);
>  void xe_pat_init(struct xe_gt *gt);
>  void xe_pte_pat_init(struct xe_device *xe);
>  unsigned int xe_pat_get_index(struct xe_device *xe, enum xe_cache_level cache);
> +u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index);
>  
>  #endif
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
