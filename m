Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A96BEED61A
	for <intel-xe@archiver.kernel.org>; Fri, 15 Sep 2023 17:43:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A0410E660;
	Fri, 15 Sep 2023 17:43:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66ECD10E65D;
 Fri, 15 Sep 2023 17:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694799835; x=1726335835;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LcYz/DM4jXaY/SlOn0cA2wlGc9FLim1d94xXd+pxndg=;
 b=Vl+0/U757vPi/BZqlfUNf7rY/KPcaXOrMRFeesZ0WXyh9J7xRdC0AU4L
 Lk/5u9JPq6QgkMB53T5y+/h6pLWX++VnzHfzvS6F/JPKceKg8kl+zAH0w
 E3T00E9oUucyC36a/J1H2jqf70Z1uOkTyWHqZYl4iUr+y4d4+Gu/mOLDT
 9bSOmKzdt2mkw2MfeBFF0Fdj7dzP42CuAupwByBHaSFKHP8lcwf3dbhS4
 Wi20L6+6tf/87QTHtpakyNXN1WBKLYmAtWb//MN475uooRTay0fHUICcL
 1AIlb03r3cdDkO8r07wg9rs8i1tAC9TKShEwIs7lCwdXuKgATPC1aeX6e g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445778410"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445778410"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 10:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721772873"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="721772873"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Sep 2023 10:43:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 15 Sep 2023 10:43:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 15 Sep 2023 10:43:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 15 Sep 2023 10:43:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U5t5Npyd9pCyH76E5ZRdMXrQ4fxgaf+p5A63KRl8/zAcA3pjzaSdVuJGXjc+oAqMRcM3ZlQLRIf1FKePuVRtZt5EaA1KWZKFYxfOhXccs8nUs9k2ouK6Vy0O8/4Lt0ViFoMiawjJRUTsQ976d/IX4jFV5ltXF9ALFxmZEtKiYRihhx2A4XkhdfMxuWz8DvxMMIp5olOorMvknBazjAI8pIk0IgiVHpArdAL+Lfy93diXA/q+Dd1EOOu1EgBLFmhhz4XMLtK/q7sUYHZd5S2CtzReKP116g3TSLn3LerWLmnH7CNA7HemEVLfrbWNdNAQT0AjGKvnSYhTmWRpNWwXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wFgCsgxhEBlGStZOWk59qfZU+sHyCv7cVFSAKejaxvg=;
 b=MO89+9CNxQzaOtf8I6iv1bSBTL7Yawf0QDEIUSwhBS/2nM0rp/WrSrtiji/STiBhA63p2o3hq4WbggH3kxX+1fzrLdSj/FuwKb9gCUJbUt/BJAhjsNctB6TxWaB8GvoLGlhjqXmTuyAjVd4RhdJ+WYKv3VLjt4iLH0lLYQq04AvbtzpRgqTwRSxF4tOWLyrIXkZU3O75gDOs9qVmZsmgPzZeo13zHtopG1Bqplz8sbTIjYa5RRMP8OJAVMnbbFuwcsXR0wKQRaaXGl6F4T6781JiHbrqTcFMK5DmAKwBdRnZVAHZROvtelw+a9SxyvWse8X/BwVroGg2/LuylDAbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 15 Sep
 2023 17:43:50 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Fri, 15 Sep 2023
 17:43:50 +0000
Date: Fri, 15 Sep 2023 10:43:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230915174346.GC2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
 <20230915132346.1845909-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915132346.1845909-3-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY5PR04CA0030.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: f36814b6-5536-44c7-4fba-08dbb61351ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7ZbS1fAJblG/Z+ZMolF2RMXFbQR3gn+AG7IH1LSuPzPHiCKw8r+qrksalaOlCyDrVQfh2eaZFt+qQaR3V4KsjvVUh6vCLmfFUoGHQedz/p+enpNv9gamMQsZPPwfe6p0ZHvCtk+T2BVqFBtAffpvd20mPVZ12EaTp6i77E6OnVPSjIfnZT6cGB5jxphiFk2Mw7AxwKHoViO5P8NX2ChOGOx5Sk8jM+zZKDyUIqRRJxCc27xrOmNvtuxT/v/eU1eZAIRHCRYsTog1ZsaGXQSHukDbTH9CoGOOskOdC35rSmiOZfdDRf0PrGP/6CmnTsxb9jBWMdAFcC+fHsYmuYGPopJAjN0UrEyQ+AK9MrPc40h+6tpweAbqHiJ0Uqr6isjI+EDtVNsLr51vJSE2o8D9higl/5SUySNgD7uxuvjG/298vZg+roOGqhDJMOdM79TxoVcCfZKuSQLZOSGMVfWeKNjoTg6f5u9fi7GQwXUR63l76K2StSSQZd2daf9AhJXAWeJ2FNDwaGDwkA3OKYrbH6MgzzDbG6Ga4mrm+22UOzxv5S/FnKEWh8fqQ2lX1mu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(478600001)(82960400001)(6506007)(38100700002)(6486002)(6666004)(86362001)(2906002)(33656002)(1076003)(6512007)(26005)(83380400001)(6862004)(66476007)(4326008)(5660300002)(41300700001)(316002)(66946007)(8936002)(6636002)(66556008)(8676002)(450100002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b/P4RVRmRkG2fQrFJUfX/xRXhvkxFsQCPPs5KogAIW4GZ2WhpBayP2d/FsfI?=
 =?us-ascii?Q?P1nr1WavXFkSLLTz4g3Uj8C9mjVVkTEv5WmzkyF8Wv8nhGwU7rFmtz6x19h+?=
 =?us-ascii?Q?3JvAU5ylFYgqrDp0Ysg1z/3iVnIl8mOsK2XnVHUC8UpIe0mpS8fDOOCCsiHN?=
 =?us-ascii?Q?BTNk1aPTUJZgib16UvlOvrtG7CuTF1nqyDzVOrSEGBFiDMpZuq84IcTlNl7M?=
 =?us-ascii?Q?L7hKxJp7wufJsUTSsPaN0oH+aI3E4Y6yn+hxSUvBUvVlov5wE7xGw7UhswUW?=
 =?us-ascii?Q?JwrcbDbEu6n/E1/B7pGxgNraMtgfFY8rd62ofpUOC00VupA9yzretWMUQTf8?=
 =?us-ascii?Q?NztU+KCnI2F+WVpv+n8wLjuXB6immiHK/IcRDDfOQcsoSBKUXck7YTUtjdLK?=
 =?us-ascii?Q?8LsH0dzW8pEUpfo7uWuxEDy7UbcJ24hl3Myt450GWwbsVsXQkGy1qyNGIdhH?=
 =?us-ascii?Q?hs/ya2/Igxeti3XtYtWj+9Z9AOyTxZEgaZKGq9sFxzYY5eO50Dg1IpyBk0sF?=
 =?us-ascii?Q?1nY72gG9uf0foSo12ea8phpsyb+HDG91GysVdAKjK9IOl5FzuDcHoaIRCDDE?=
 =?us-ascii?Q?WnMnRtcNW9C5Oc8ReLHY757PMjEoyGpCrusSEBINAXLbgZthUfpCX32vdV4r?=
 =?us-ascii?Q?R9xwMZhqAjvHo7bjVJrdaquApBb7gJVS65Fsu9kHrGXxN9ijPhtRxLJdYRrB?=
 =?us-ascii?Q?w1etx85jwPnNxXkhjf5kkWOz/8gvLAQ7A8EcqPvpjeXC+dVYbyVp4XpmcbNv?=
 =?us-ascii?Q?XulnTYZW5EbXZIrseVs/V7BCX6Sl3FZYFjRtyxORZh0FLmh/CUfXfQ3nbjwg?=
 =?us-ascii?Q?8qKVg694ygZHOQELNDyy1ytS+jprtpSxqFn8+RXkGdSXSMSIJL3d0xaJlH/K?=
 =?us-ascii?Q?hkbVpm9oaVp3uAtHzAyNJqa8Pc2QmorD+0o6nrGn3U/eI4Lhj46rLsLImTwd?=
 =?us-ascii?Q?UYtr8brp5AqlUArA2fFxaCA3NrUOYs1mPOby2Z/Gx5687/zsAPEaI7NrEsMh?=
 =?us-ascii?Q?TH8kvA+pfusuZjIunr0khM0ryw/2RaQVrbyiivEiA5KP2GiaRK4FICpk15dL?=
 =?us-ascii?Q?9ioGWgblcpN6qVXg2l1JYDKGKhU+bpAGMZaWUgULCmJjeXoQKHuS73tQ2HFg?=
 =?us-ascii?Q?dNsI/XzYja/UvjjCTEaDBjJxNcjKQBbmdPsDJUtvLGIn1Yt73QE5VJuMvVpI?=
 =?us-ascii?Q?EHrGoX+nNXVeMq8jzI5/6QfCm+cRTSld9/Kpg4zQ8nZhYdHrnAPehMLhSR7y?=
 =?us-ascii?Q?iV5V+ofsAEh1AeaQ7oQ0u9BdHBivqbFCsFcxjV2C5/uMad4Kj7STSHXjsSUb?=
 =?us-ascii?Q?mbGg8uWX5IC3/HsbG3TzhWGzpswU4OUd/b+CmAVQcwUD9R0AvAtpD9qgn0aw?=
 =?us-ascii?Q?5ptR9kfkdkjgIsQcAFg/EzM1DNWQpPa9jyvnuh3kxpJ3DuPQHLXC5lF5Mk08?=
 =?us-ascii?Q?JNu+LRT24GZfDBpiij7wkK9qklQzix2A6jDgLzBW9dm3FwYXqEEMBqwOCIN7?=
 =?us-ascii?Q?DPZ8Yv2+GkiteOIRbYxBr9FSFMscR7tx1CEXiWqx6rigYW3facYcIo+IZzsx?=
 =?us-ascii?Q?w1EC+2af8j+9164OFk1c777baxsGAfjPb+BrBG46O0IX2YUsxX+0O1kpGkq1?=
 =?us-ascii?Q?QQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f36814b6-5536-44c7-4fba-08dbb61351ec
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 17:43:49.9664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eu69k0Fes7u0sO7ly7Evpb4cIKnCcnUp1eL9mGYZOE3yqiFuvUvKUfYNojzQExCpp8CpPBWhTKF6kl5zO2RursW+wcVJckfLr2vHzj04R9E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t 02/14] lib/gpu_cmds: Remove prefix from
 gen7_fill_binding_table()
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 15, 2023 at 06:23:34AM -0700, Lucas De Marchi wrote:
> This function is used by pretty much all versions. It's odd to have a
> gen7 function end up calling next-gen functions and it's error prone:
> when adding something to e.g. a gen8 function to realize that behavior
> breaks previous platforms.

Even more confusing is that we have a gen11_filling_binding_table
function as well, but Xe_HP still uses the older "gen7" variant.  Maybe
we should incorporate the gen11-specific logic into the single
fill_binding_table function as well?  It looks like it only gets used in
one path (which winds up being ICL-specific, not even used for EHL/JSL
due to lack of media samplers).


Matt

> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  lib/gpu_cmds.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index bb35204fb..648451f74 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -259,8 +259,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  }
>  
>  static uint32_t
> -gen7_fill_binding_table(struct intel_bb *ibb,
> -			struct intel_buf *buf)
> +fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
>  {
>  	uint32_t binding_table_offset;
>  	uint32_t *binding_table;
> @@ -321,7 +320,7 @@ gen7_fill_interface_descriptor(struct intel_bb *ibb,
>  	uint32_t offset;
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> +	binding_table_offset = fill_binding_table(ibb, buf);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	intel_bb_ptr_align(ibb, 64);
> @@ -357,7 +356,7 @@ gen8_fill_interface_descriptor(struct intel_bb *ibb,
>  	uint32_t offset;
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, buf);
> +	binding_table_offset = fill_binding_table(ibb, buf);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	intel_bb_ptr_align(ibb, 64);
> @@ -803,7 +802,7 @@ xehp_fill_interface_descriptor(struct intel_bb *ibb,
>  {
>  	uint32_t binding_table_offset, kernel_offset;
>  
> -	binding_table_offset = gen7_fill_binding_table(ibb, dst);
> +	binding_table_offset = fill_binding_table(ibb, dst);
>  	kernel_offset = gen7_fill_kernel(ibb, kernel, size);
>  
>  	memset(idd, 0, sizeof(*idd));
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
