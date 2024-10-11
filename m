Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7147DD0EE3F
	for <intel-xe@archiver.kernel.org>; Fri, 11 Oct 2024 21:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFC310E2E2;
	Fri, 11 Oct 2024 21:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGzlKg3B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202DA10E2E1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Oct 2024 21:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728680996; x=1760216996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=su6FDl0RaUQ/buJquqKp0033i+qroGtsWVbuXgk4nNE=;
 b=NGzlKg3BDERBLmavWybyog85ZYF06ABhchy7APHlJJGBjcWp/c5WlUGT
 d8GpdTUejC/+JZUxQ2Au3Ppb/Z/4Enk3d8J9OAcCpVBPbe1JlbVJwncLP
 WRrBpR0ktev9KRTlInTcs9SO9WDSRi9GqrmMvOxCJ5Ii8WmYOvpPzOPBT
 E0ffsEfbxeDvvt7FP7JEfa/Ohb2dNziqcCoR9KGF0Xonl7qB5lLL7/ujs
 FsMkMExU5w1I6s3n+UGBfjxYKHyyq1RZic4Lt3K5/rlsYzBGHcHc+EG60
 pJr9FtBgp6DrxifZhzlRAUg4mqp4Tac1Cc+yR7cQhxDAZvTLXKvBTx89C w==;
X-CSE-ConnectionGUID: +gHYrVTGRRimtVTm4anvfg==
X-CSE-MsgGUID: 7QFvXdSpShKjFM+FHXHs7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28047900"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="28047900"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 14:09:56 -0700
X-CSE-ConnectionGUID: WeVyWtlITJWCMrssKFGpMw==
X-CSE-MsgGUID: jjTL/1OVRsCNKv7ZHxEo4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; d="scan'208";a="77835013"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 14:09:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:09:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 14:09:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 14:09:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 14:09:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDyILAIaPYbNOeVZDaMdDzFd4BT+lysxiihmWosr4wCUOUImJyncuffyNdaYtjaqJSLacOpXWxk2L4SsJnLEkejGdX3P+PVnBqX/5K4rjYuEVt0mJviuKrE6UmR4UMhdLp7luamG1BSxLg9JVmnsZhJjU4y3uNZahipBi+0Bkxke3msHH7vRbHvRv4MqFin2iGylNAzACtPdQz6L5QY4sWrTy00Jo733TbLEn+XKlC1YqnQVGvgO0528sE4j9Cv3pOnW5PwTKyIqkOh2POAZ1F7oUW9FMhdyoiVrJbssCpvaI9kcAuXEi291TL6FE0KYNh1IGoEpkaKIAZURDJoy5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goI5byV3nZ5PBHr/z2BOFOzpIOspAqq7xJvm03Vl4yg=;
 b=DK+GHj4zR399mqEO87N/Hdc+Ke5cme6GOYwWmAQzagSSKiX/EUF/d/6D8ZOQzUDWDMg+4zzWIt+4VisooklrpLDlhdU4XzA9+ZM0Eqb1d05uoZF9+GD73CgwN04tVbg80Tkz+OMdgs46CQfiCzNaOKAkTrK2n5/6U51tBG6Uv4B2rNm0Mijl/0/MBvQ3eXWExwjzr7Su6PtZFupBGOeCGiAgZ0N7CrhtGtm+QPnfCxjSdNW1aFCZrTTjT2iZ+Fg5OXEaU1IY18S/MMf+nb6gc6ZnCza0frbTkyszQtU7QnHvJL0wsbRusNWSfK2fTvwSbr5hBI237B34WWuchpGaKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Fri, 11 Oct
 2024 21:09:53 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8048.017; Fri, 11 Oct 2024
 21:09:53 +0000
Date: Fri, 11 Oct 2024 14:09:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Sai Teja Pottumuttu
 <sai.teja.pottumuttu@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Szymon Morek <szymon.morek@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe/query: Increase timestamp width
Message-ID: <20241011210949.GA5725@mdroper-desk1.amr.corp.intel.com>
References: <20241011035618.1057602-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241011035618.1057602-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:254::10) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: c12343f4-419f-4762-013e-08dcea390cd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hiOqRhKS1faeIXCMLuku7H5r3t61GLfWrloerr7yjMOyDkfYLEsu4CmTpSwV?=
 =?us-ascii?Q?lubf+tIRO201Uteyj8I2aEAyF1lhz03+eXrF7Ykg4nV6KJzTULRCc6sdF4IB?=
 =?us-ascii?Q?QDRQePvWJ+r/fbBXVLvhJolOAH1UELc0hXewIcy83yN3noLOPxt+w55h+RA7?=
 =?us-ascii?Q?kW6z6r427WzmIKSD9sCnDJoVuxv8pucncLuzcdctobiw1RVwsYmmVGGZtNe+?=
 =?us-ascii?Q?I6myieCvcfb30pOSar24I3T+bU6P6YEiNkCGtx04yPXAV21U/LRjbZ4RaCVZ?=
 =?us-ascii?Q?MiQRl50LuNL0z8W89lNsdXjybJlskA/+nq1I1khq+ZdPdUzPk5oK0U4oTM3q?=
 =?us-ascii?Q?SbVvSa+FerUw9wtoD9Mf3aMHx2GHcldZWYYDbnb5w1X9eD5DqBvUB+mIxqd2?=
 =?us-ascii?Q?B8A0aY4CaHnUIXzg0Ub/vpQuG7ONh4vIFR5pEBEGfrA4b+6QdyekKKyI7WoL?=
 =?us-ascii?Q?jhP8pckGbZobo2zmTUdHYDg8p4ddx33GNhx3RNq95Ze4ZT5qdRYZFYcwxtru?=
 =?us-ascii?Q?zg8JdUXzvkipOocpzI/cQry0XvOfE8UmR4weEEG18PWrU5q/tlY57IhweBg6?=
 =?us-ascii?Q?7hKbOxq3lMFeEfJwmpwf4t5/ExH2RmBcdAn4e62XtmaW4fdxg8cWJdpZKQqS?=
 =?us-ascii?Q?PcUT1oU91P/M9FpH1w1l/iGJQpfql7CeCYJ4AsnFWcw/+EgmvunTUyw8e/Nf?=
 =?us-ascii?Q?qLxtDwSNudRm6gI9+lhOIiQ8dF/XIw5lepdOpVL6ftL3hKA46Su81ZeW6HeT?=
 =?us-ascii?Q?0B1TIIij38k0X9tUxhVrFiti84wDRZ3k5AXtE9XXApScjzosd+J9BjONXKNj?=
 =?us-ascii?Q?aOogRLL73cvAy2ww4u0EPjxdl2mhdKGe+YnnYcoEYwFS4i6bm2Qe+rumpxtv?=
 =?us-ascii?Q?hyJEe1T+bun1hDA14Uxv93N4rP/Hx+8LzgsV+iVWX00swsMbkNwWvYSAADfh?=
 =?us-ascii?Q?R+w8er5DDCLHvxlAfRH28YcHs302OX0k2Tr64VfbB5w2lM/EKm/9I0AeMRGU?=
 =?us-ascii?Q?O11i13JQnvrrQoVcDTjVF1OpFKrpPvq2AlffUU/ht+GUhoJOrLEORTrdMg/C?=
 =?us-ascii?Q?67jhn1YfdKsv4Hfh8GOR1tyRLRC0FwAdZGT5eQLv0CZc4ijaMugmgdf5N0dI?=
 =?us-ascii?Q?+F7fdTM1c9u9B4b4TQ0XZGzytb1JhgXpwi+HzY08jqxCNkhCfBrKNW2CIH7f?=
 =?us-ascii?Q?GZceSIqqPxeYBXox4bgoxuXP758AXsazIXOi2RGehlnA1BKhT8eoDmCLT6Lj?=
 =?us-ascii?Q?MKPsVx6G7EdgQEeUiTCh2rtPLAQqOKGfAyfJ/EDFBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fGm851o8RpVkOlkkP/qf51hAxInSl5wV0fUUCKedZAVGiSjYYpXiErZ6i+V8?=
 =?us-ascii?Q?Fb3rspS7y9KxoqobK7OC+Gie61yWjsn8gvEvsmCRBmZTy4SG+cmEiDJ6F8y6?=
 =?us-ascii?Q?3sAuT2v8TYGufEdFRZeOiK3ueraSQ0AjnYekd856bOSsVnVCtc70scZmkLzB?=
 =?us-ascii?Q?FCOenhGzLQ9Bxk9skO2RqAAfcHeciYMSNHUoaiqu6Yi+aDbmLKNCkTSM9Cbd?=
 =?us-ascii?Q?iD9VfFg9w9c+685oaPF9uFFhrOxfpzduyzvCTeZwIuHg10FAqsOOvQ+eCDpI?=
 =?us-ascii?Q?E20a4HWFNmvDJp5kCteY7TRbrR9aTNm6bGTdUepfvChSCh+TlteqIyUoAlr1?=
 =?us-ascii?Q?oZKa8adBdwfae/PKBig+mqftvMN/WpNHndBAyW3iUvWLDeSXZ69UrJgG7xcP?=
 =?us-ascii?Q?aket1xrnZXY6JmDwWXfLLxi+sDdfdrMj4/1BR3Q3VeJFpsAwM8I3M4rEHW2e?=
 =?us-ascii?Q?Lm0M3ZYwbTs4e5GeeIk5tkg7qBIRtZIQmcSc/5eB4M73/8dub+O4i8/obVIY?=
 =?us-ascii?Q?rEkMZpV97Vk81h0d1bsfHRxtzOL4v1I30LYImROf+JMtEvSiQK7rBWCeh9Xb?=
 =?us-ascii?Q?zm9Q3KJOZps6YlF1lvfJoMLflCVqwYXDPiH2CxhX0qCtobLT+WOSu94O300s?=
 =?us-ascii?Q?ngn9lAMCjdCQcxsvhgKD28X0XYX0YyYEMWtQEfKFqQTil1/jM3JvxT6WnjIq?=
 =?us-ascii?Q?kYP6sRoPMrcY95bCc6iNE6jOtdreEuR1GZ8nOwwBi2a/6rvOVjP7NHW69Emt?=
 =?us-ascii?Q?Cgc3BaUD4YdA3rSOmq7XkUvPjlGGbJIWPiTzXR2XEPsRbMrSbSwNO3glOKbG?=
 =?us-ascii?Q?N7joLbmAfEBIiFDCl8obzw7DH8C/7vB0cVUG5zpskpH3GKKS6lAdYrskcVzX?=
 =?us-ascii?Q?+J/MYBUPMtU0hrYG15iFK9cBEtWqAARm6+mFMnJ08CPgm3c7pbH1xCI6DpS+?=
 =?us-ascii?Q?50q2x5KvWfXQFtF3YUAkkvYYSncmhKT1oy3zYz7jCHvwl5hrpsQKh8788qir?=
 =?us-ascii?Q?vvxlKQ0AEpJLbr7U1ywRxbrfO+AmO7ol5AADfYRLAl44scB00v5loEvyRj4x?=
 =?us-ascii?Q?ofqQZ4hEF5VY/JpFTsccj80w3Hpql9aPLmC5nfRMsWo7hCRPgtMbBKylL+sk?=
 =?us-ascii?Q?NsIuVeKSy0/BW/6qh2/RA1lz1NdM4bvwHHKwhauqbTLlqqMpUw1Afs2hz5Ks?=
 =?us-ascii?Q?em8h4zKh2nWIIojKKA1ee3M5Ih+vzrjgSi/X1NcB9jZJwibw37CG7b1GAee4?=
 =?us-ascii?Q?PoStU2GA1Y68N63HPfbOj2YjFMicTCQuFoRuYrH0bhBWm3P/xGZtwOlU/3rY?=
 =?us-ascii?Q?9nr47sfvZps5MNaxD9HopEYVGXqD0a1MuYyU3q9ErKLqc/wxJ2r7OIdo3MUu?=
 =?us-ascii?Q?ITUsPJy/DyZOPd8DIkVr0n5GW/l+2Xw1uEg+tQ8opZNt3aYchXvJb4yNDRQE?=
 =?us-ascii?Q?O0nLSpzoqKpD9eT7TC3U5OxxW8uRIgNmXcmItPEMudW50+i8IjulmCSbE9Cd?=
 =?us-ascii?Q?nePl+GK8JPRy9SVwgGszYbAHmk+pSVjrdAXyEPRfaEfdNi/yJekZBCsuWTCN?=
 =?us-ascii?Q?18JyXqVHv4B2Mk7FaskH+HdmOcaKHCfXUyD99JoDY7Oi5NhrNHlhyuKsfZBn?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c12343f4-419f-4762-013e-08dcea390cd2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 21:09:52.9968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTWQogTxS1huYP8O/N8DsUbuLJ+E45uSDul46UAD8pIv1ycIbS6MfznP050iq+1gROc3dGJtikbfko2k6vtkKDjTqxAI3Lo4nPmrD6HgICY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
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

On Thu, Oct 10, 2024 at 08:56:16PM -0700, Lucas De Marchi wrote:
> Starting with Xe2 the timestamp is a full 64 bit counter, contrary to
> the 36 bit that was available before. Although 36 should be sufficient
> for any reasonable delta calculation (for Xe2, of about 30min), it's
> surprising to userspace to get something truncated. Also if the
> timestamp being compared to is coming from the GPU and the application
> is not careful enough to apply the width there, a delta calculation
> would be wrong.
> 
> Extend it to full 64-bits starting with Xe2.
> 
> v2: Expand width=64 to media gt, as it's just a wrong tagging in the
> spec - empirical tests show it goes beyond 36 bits and match the engines
> for the main gt
> 
> Bspec: 60411
> Cc: Szymon Morek <szymon.morek@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_query.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 158629971eab3..07093af0b32e3 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -164,7 +164,11 @@ query_engine_cycles(struct xe_device *xe,
>  			  cpu_clock);
>  
>  	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	resp.width = 36;
> +
> +	if (GRAPHICS_VER(xe) >= 20)
> +		resp.width = 64;
> +	else
> +		resp.width = 36;
>  
>  	/* Only write to the output fields of user query */
>  	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> -- 
> 2.46.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
