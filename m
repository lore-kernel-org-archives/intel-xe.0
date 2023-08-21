Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5523AEE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 14:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224C610E274;
	Mon, 21 Aug 2023 14:23:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9060D10E274
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 14:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692627824; x=1724163824;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HlA+3aaCTACVcGY90ePUK9aQymfW/0gDbRhKi7h3Fro=;
 b=bc2X2Tw/feDCfHdChOI/ejh8KhzIYVzZA5aEVenhdLpU1kyMegrymmRo
 O2iyWZzjTcdbfVXi18FgTumnOkZXEWY0oRooYWJPKo/LewuOjqWDpHNj7
 zvVLp//lL5bIzP7PbLTI7pKKlaKjTdSbnM2J3fJ1uFXts7gQjsvn6P74G
 c4OgtizdvNVKRpqBRe3j5eVZVG7d9+m+iN1BnWnG8wPgT5UmByfHviwAj
 0MOlTtG1wJci+PzCcy3K6o4D3E0dnufAl4tZNSdupRdFZ7bTmqW3AKqmP
 8HDpAORdrkFNUeWT5q3cOGJOZs2ceauzQTkNJMPMXAamc16zuw4esiXye w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="459970678"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="459970678"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 07:23:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735848903"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="735848903"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 07:23:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 07:23:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 21 Aug 2023 07:23:42 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 21 Aug 2023 07:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/zz2zzmIAxNkiH1vMSHWCM70THwT2NZX5HgjJ0jqR50n4z7tGpfnq7tpTcxvVYRu67HLJNXMusHQmNv4X3bqSZSHY87TJRM6UprRfNBnEJDNTaEvGzQwILyljGUseF//qdz4woPC2g989DJ6OrguIJBYf7EGkstNkJ2eXW7stziJVmBDtDlfAUtu3D6/kPCYiGwIWJaBRg/wTH2hykSzuGw68GiquxkehpEeIYWaXbfMHuLEulzqlIZx804rXDYwQM7o3aLaNtBPNm0VJlXnI+93oFpv8oAgJP5HNH1bVEHm4QwxWl4OGJ/TYZiDhzi9UXRT2qTJTI3FY+6ibH4Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q3g388jFMOqx5vtK/qu9756PJfeQQnfJQwglyFQKgs=;
 b=ZGFE74FbRVzorPpBMyDfiu6tL3KX3k5KWrDLoSrgwjdiFccGQzWsnDSVGHDZmWns34JbYanHz4Vq9IEs5SzKjU8Bn4vbbZ5gNVqXgB8FVvCWWfGfONyiZ1GbCP4Sym0qQ6yk0qPJoApXkw7AenPdC6wKHBpfjXOwGp8dlw/6AR7k/nKmCXJak1UWzXbw4n442W1JCMe32OBBcb5u+uOCFUFyg6yn6J0gtU1KSMqGoiJoHUkOIn4M+r3x6ck+Jdm2Fwmq33wjVcTxkVmGYRpClUdyDGX2N0mpcDATUfxnFLtIuAuDWl/+Svw7t/0eZtBVa9n/cNWtRCrNQICDvUqwZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 LV2PR11MB5976.namprd11.prod.outlook.com (2603:10b6:408:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 14:23:39 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6699.020; Mon, 21 Aug 2023
 14:23:39 +0000
Date: Mon, 21 Aug 2023 07:23:36 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230821142336.GA6080@mdroper-desk1.amr.corp.intel.com>
References: <20230818220824.700519-1-lucas.demarchi@intel.com>
 <20230818220824.700519-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230818220824.700519-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR07CA0101.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::42) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|LV2PR11MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2394a9-74b3-4ff5-7956-08dba25236c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +k0zjDluUEVsEvTeRsQS3hGG2EBYpZNunYiHWG3QFZxB8kr4y5bVrMABbKOeT92xxA4lqezDPrkH6xZvHKFXb7QC9N9j8l/S+zGcBFbJR8NcWhx+rJih55m2MV/FfLLOWfg6XkHRG7JNgmbi1pXXjyNKPt9G/BloSa2ILIf5lMX+v7mnsC9KQ4Yt+NyQascvoVqkUdoZTCxY0NlEl1zIdn9YR99fw57eP8PzDHR7EKxpAHZam9eXfAaHj24nMHs9lT5eWX0lSPYPCnLMmw5Q9+5Kl8NvShG0HK0QkjlX/nUa5y9ympMsPlagzm10JCxj/k2qAPTMiNx2MJmOmn02sgklC0RA/3YnHDbVlThNlAvPH/ZgyIY+vRKZaAbQtuA/4ljExWw+BTxq2XSgh+Nb+2aEfY3PTeKGftSCbtGHMQkSjmkZweHmFFBjlA2pEAmifEtbPBGhGN9yRpEOcUDr3mHy2FeGUdp8+mWq9nAqAgfhByO3SExXRn8oond472wUmjkuHhedF/UC947hl7mTesSJX4xgEK1INu02w9s/ewnEAy+baPjGWBQUegVD7+v3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(346002)(376002)(366004)(1800799009)(451199024)(186009)(66476007)(41300700001)(66946007)(6666004)(6636002)(316002)(66556008)(6506007)(6486002)(82960400001)(38100700002)(26005)(1076003)(8676002)(8936002)(6862004)(4326008)(5660300002)(6512007)(2906002)(86362001)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FuN3U9e4YWR2N/wdq1sD1d/6nhnFS77Q2Obe2wLqNDrfWv7oJh4lfYeVA96y?=
 =?us-ascii?Q?oR5BCZ/6JumTXSfLbPgwEnyAGiYhXm8mT+e7UqEbpMwK7m1dTJm3kYyomd/x?=
 =?us-ascii?Q?chCOlezcRkff8VJ9wf7/Vn5dLqU4/taneo7P2yYjq9ivlpLPzLetBYQdjFBw?=
 =?us-ascii?Q?lgF3JMz2pF1apUPBYarDMk9D8CzYe5Abu+IvywUCCeUDXrURQQxrVQ8vyxAZ?=
 =?us-ascii?Q?7UcOfx8omVnmprXpcMzuIsStk358AwBE2X3ZsawPauliOTkz3RVKeD93rMtj?=
 =?us-ascii?Q?0st8uwhMnRX69cJYtGT5b9OuAKJ1SCGgZp77QdAE9HdgTecdrQHsA5avJdN/?=
 =?us-ascii?Q?7U4IbF8PRiGedn26Axj1QyMfD8OzKlfAhI0mdAg8qAvx8NOFshgdK8dLVTJ6?=
 =?us-ascii?Q?mWe0oLGCdRUBqY8RbhSeWWp2+82I5FA4e5qChzJXzGFybA5g/TEsBfGQDB2z?=
 =?us-ascii?Q?pF+y7MA07+t7thbnNcNIKT6q9vQeiwyXObKdazlvUaevOoY1T83gBxD0uBCT?=
 =?us-ascii?Q?/KgsnZqmyj/+vMztTyK5bsqD0im3FeoKcpbL9JpxP/tbiC6ASTN5DFXsoMak?=
 =?us-ascii?Q?cvqEcd81oL143YzzYa1hfwvbn9CqJMt8l6bUW2+Btc7h39f8mYv7+rn/bryM?=
 =?us-ascii?Q?OkwWhYfE5DuzYxITNWoZgxWIRuYaiFOIZ7JlN+LxIZSYOKvLnM8leQ12Yu91?=
 =?us-ascii?Q?HnVUYYhbyxEyz+2HKz19SYYtnUfNAgs46LE+GtAGmPNFEhz5t+BayKlSuxVu?=
 =?us-ascii?Q?7MnlyffJ+awM94Jl6TfW2QhRDp3un9YTVm/h89bPyyf6jKKEoCJdm1EGDFG3?=
 =?us-ascii?Q?oBhSpE01JLElzUeiCvfpvGuie+34hEUUtPyHR3OcoeC3w8VWvtlfC7cakwCT?=
 =?us-ascii?Q?t/OYlmyBwoY4LZEMxBxHnq2j8AQfmJukQ0fkrxJznPKtaBZCqFjn7PpUt2kX?=
 =?us-ascii?Q?xB7mZ8WVc4Gc/UsAbxvOmx5kq0WZ4B4vmNPPtBdy8vCKdxR4zLaGHlOn51Rg?=
 =?us-ascii?Q?yzj6lLTnvIIUHDSLOuCSbc5vZMSxt8KxbPvv8IisXyhxpmY/n5eaD3R/YC3T?=
 =?us-ascii?Q?5XLp5HxwpdHgW6HJ++Kss1mDfQmoSWEKYXx2m6bvqKtUEIHIoV54YBmg1XEV?=
 =?us-ascii?Q?QG1jG3Bn3ZNQNyf7EqK0Q6axzY5bYR6QwcbKToOBhx8H9A+NiP5rRv2r3Cpk?=
 =?us-ascii?Q?GAz3fXB3mi5dOyp2tfw75nCJqCrMMsfRT/GvHGqIl9/aNhupRtfi+RHtonR/?=
 =?us-ascii?Q?BjwP1W173QgBQWdkNlOsD8FIJKIIuoWChqxJdjpBSimb2DrmHL5EW2DskUKx?=
 =?us-ascii?Q?5LRaNYOr2r+ac6ZvBZ8qRoqkx4wp3X6FcpCqjsqtlChzLaUXLSOPuzC5NewK?=
 =?us-ascii?Q?enEHd7IK49CuPH6TSfYXm5DebU10GjPN+MK/kgVVGTXFo2/8tsaxVHSyQ1f4?=
 =?us-ascii?Q?VT+w9u/CgHkiq4Igoj9oZMY7zwxy++JNzedRkFz+KB5/BF5tzZsP6AtGIcm9?=
 =?us-ascii?Q?IcAW6PHC20wtEAkJB5Py9g9Z0VbjAAZewTPMAWgE18KEWPhCrIkFozbSSkaW?=
 =?us-ascii?Q?7l0StC+YlljDzxeF4XgSdXeaYOS0/gvKlMUjOupqyyXLOUC1x0nHp6FcalZK?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2394a9-74b3-4ff5-7956-08dba25236c8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 14:23:39.4820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQgiCgW9aEHg5rFIS+aVPS65Bbq9yStZPpLwitP2G8rlL+K+k1I9J1M+RBCqwUt3y+p+Zbj/8UIUHy4FLloRr73hc0wgp8fthLqLO7aCVWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5976
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 09/15] drm/xe/xe2: Define Xe2_LPM IP
 features
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 03:08:18PM -0700, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> Xe2_LPM media is represented by GMD_ID values 20.00 and 20.04.

I don't see 20.04 listed in the latest bspec.  I think 20.00 is the only
version now.


Matt

> It provides 1 VD + 1 VE + 1 SFC.
> 
> Bspec: 70821, 70819
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ed6c4bf8c63b..fdd2eba1b91f 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -221,6 +221,12 @@ static const struct xe_media_desc media_xelpmp = {
>  		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>  };
>  
> +static const struct xe_media_desc media_xe2 = {
> +	.name = "Xe2_LPM",
> +	.hw_engine_mask =
> +		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0), /* TODO: GSC0 */
> +};
> +
>  static const struct xe_device_desc tgl_desc = {
>  	.graphics = &graphics_xelp,
>  	.media = &media_xem,
> @@ -344,6 +350,8 @@ static struct gmdid_map graphics_ip_map[] = {
>  /* Map of GMD_ID values to media IP */
>  static struct gmdid_map media_ip_map[] = {
>  	{ 1300, &media_xelpmp },
> +	{ 2000, &media_xe2 },
> +	{ 2004, &media_xe2 },
>  };
>  
>  #define INTEL_VGA_DEVICE(id, info) {			\
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
