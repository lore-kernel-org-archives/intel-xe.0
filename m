Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1767E7F143
	for <intel-xe@archiver.kernel.org>; Tue, 26 Sep 2023 23:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB8A10E435;
	Tue, 26 Sep 2023 23:24:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459A310E435
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Sep 2023 23:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695770694; x=1727306694;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ne5jtsIKk2FvUKAfbKDhOMwtRQneETWkRGK+hKYS3Os=;
 b=ZkSzSsF5oKrTFwJIpjRL+zGZDdYU83yJkM87HKqXq9BNF4yHYGuvIQgu
 vD5orxYE5pkH3O8+QKmrBhitwUBWX6z4nVG9sHohy/AAWJDjCfY8uPNMw
 Sy9ZpZq3ib264jLr6iMvR3wdO79uWMiurgBIrC3uhMJSNKUTQd6UWvzNc
 ARB73mFynQc4Pi7W2eJzU1lj8dLW53s7dvKLKvac44zebQrQ6TibPS4JB
 4XFL69s+uHD1MWTMZdPDI9cUDSvXS5aaDYk/0eMpAsG654K8ddcX1tr8d
 TqFgZVDH07qGwzjXeFSevzvgXSw75KDeravpj/z2q5Z3aX0OmgWZiSe1n A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="412604301"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="412604301"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="778315254"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="778315254"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 16:24:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 16:24:52 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 16:24:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 16:24:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzAK10lD8Qo1Uru21iXH1AKdZd36JS6a5I6cSJ2iLWvg5xvrlDI8xUNRyvnBJ7WBjigEcbLBqbk//1l0Cbn0LRZEQhQ6Ih1rCptg53FecrSwgaaDju+nQJi0z5Bs/lRr59rOXkX+qwtYcxc9lP1B4xn/AUQ6SECK3o1Q7tk/vQhTcdRIrHK1u/pUfTiYE7smOxIVufG6+MG8hOCZwY1D6Uv+6iWq5Ce6gA5dfGWKmzXM1q9ySG1O/GVrSZ5iFUFsRdvXFQlI/Uyf8+uuZAoJsgvlYYyHOCjNFQS6Yvm5rT2FDQIJQXinqDrLmu7AtYhsv6+/sgdSPD9U5caXWjVZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqM2iAEtNPhs2ZoCBqf+QfPib48L+zWYnL+Y4TVFg6Y=;
 b=THGQwcuuPCLp3OxqOIxLy9h6BEHV50lzpWeHPJuaJIpgakm06gaRFxBO/F87q/dNAfHGS3nYc2WZnwdk+80FWMN78Pw3dTV6gKPj+jJg2bYWgNxDR9uCMNzAwsJsScVd3RZSvU5yzyZZ+3A6dHKxGfEJ8eVLxC6Q0jFdsq7GSyspInaktNe1W4efg6aGGRfZM6tR39QTEBTANMtxX3ARRpEyC8m8Enno8a+JXiQzBXSlSFUa/QMfrdnJlmWdgxnckxsPTGfylae40UFDEWNoY8ydqXzcldfnadqv2xwrECpw1ECwziqxrLkv3PfHMHLibhFGPzMx9/JolMuon7rlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 23:24:45 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::48d9:4c34:35b:f66%4]) with mapi id 15.20.6768.029; Tue, 26 Sep 2023
 23:24:45 +0000
Date: Tue, 26 Sep 2023 16:24:42 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230926232442.GX2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230926223631.2807873-1-lucas.demarchi@intel.com>
 <20230926223631.2807873-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230926223631.2807873-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:334::9) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA1PR11MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ddf2954-e472-4e24-29e9-08dbbee7c504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iMJ3LM6pKy7si7JovXUqxPdg3CNfMv2kKSg030FeeFXWkNIxkfH95TjkvcBvQFftXdGt2CHpT1eDvHCQLXqRcx8q77omjGvM9jekCpEIK4Hm/NvvCskBZ1vWcHion0yYujsogj1wr71bcI4sufhcNj9m1MEt5CEai+blJ33U4Nbu1YkLoOaqddJfgyuxXxuTJx9amEpWiHxfJkYghV37M8WZ0AP+6TeWkLp2LWnuGJXOsWuOL69s3/aQHVLs5JQZmPJOdklmkrBhwcUovkKPjsJNLR+BDWaa7/4jGVizKmZ4nqGYYyc0JguSrwhOFZpeYzncVlfznm5hKvcpivqCvKk5jMYgiQCb/Yw84XUsQOdZcaGJ/8rS44WYYZvcks1xGsQ0G21IKDelPn6x/sbCwOSfC27ZxH7GN57p0zWa1f6YO7+DWNlVp1FMb61L4k+Q3VpI+gAqUAcGIzmuXvQsPG5q68pluReHBWiNdBJqWlxPNDVSntTs7t+CmdnQt/MWwVXZE0NiibzDw16CxUEUnMxZnnfPiWvTdRDzZGjJBzyZJas1FiWU4i2e7K9W3Rja
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(376002)(39860400002)(366004)(396003)(230922051799003)(451199024)(186009)(1800799009)(6486002)(6506007)(6512007)(1076003)(6862004)(6666004)(83380400001)(6636002)(2906002)(478600001)(316002)(66476007)(66556008)(66946007)(54906003)(26005)(8936002)(5660300002)(8676002)(41300700001)(4326008)(107886003)(38100700002)(33656002)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3ssvS1e88EgOh1q8n+t50SLEKW14RY8skCutKJFmy5vnIht4UCGjjg9zkY0c?=
 =?us-ascii?Q?Ox2MrHqos+E4lN/9Dl/YCTArXpEN/EHhnzPZY3VUUE0GShT2iSKNzroS9wWc?=
 =?us-ascii?Q?oGNSaaGU5B8jm/8dTyrsZy6a2itBGSu6rYJTtXXPh/HKwUOvyCxH8Y+2NfRT?=
 =?us-ascii?Q?Vm8EiyvH9m1j0hbH/cq2bmJo9wBKmF+d6d1qHGBm1Uy7hM0AygNswQWZaGo0?=
 =?us-ascii?Q?Xoli2UnrM3roh4cgnaE5EQB6OzJgNE91KV8xBjGA7BK8JlYtHxSyML/28ulR?=
 =?us-ascii?Q?Y1tN74mopqbYkNMTxxrtwSOJM6PzX2AZs9VLBmapfOxIffyJ/7HbXfqjo/y2?=
 =?us-ascii?Q?KAfRZTpYyRjzj4vnCkcPvEfNHb+8F+7K5YeI9v8qkXbTTIvTaJ2V/WDkFE8t?=
 =?us-ascii?Q?n1FKpCdoq2g9OB2ss+gtnVtlt0rJzRnYk9LoFJK/rxYOv2s3IpKFQt60Ycd0?=
 =?us-ascii?Q?0bbLcTMbHYpqPt3nR6UmUNLHw0qeh7rO+U3KgDlhD52CRxCheHwEM5GxcXzf?=
 =?us-ascii?Q?FVt2/VK+I3nK9nqb/CEHLltxJ0rtKYxSD+MkuY59e5k4/Ngkzz/3IPKI4Xle?=
 =?us-ascii?Q?lzNPjSvJdXhn/8GhtqLDdp/hluL0DoViMNGeAwAoOjfKjw13S2X2nvFhyHam?=
 =?us-ascii?Q?k7N6gWmgmVGJviuXj+TvdYxpBNPvKt32ce73ErgOBB0jYcFoFOmDPx57xvfA?=
 =?us-ascii?Q?Oic3iDUyRpEEK0Ssak6vHsEOT+BLzlO88zjjOg/VyVVr5AmVSajjNt4TttJH?=
 =?us-ascii?Q?eJ2igpdkElNB8m0hZLoLoZZVo2TtV2z1zgjdGBq2/nYN13VX8z9jQLVrVq/b?=
 =?us-ascii?Q?uCC1FE7iPiOolWocpnv2Sr+iqxH0u7t9dH+a1F5v2cZ/IcxPXTn8BKori62I?=
 =?us-ascii?Q?9gZA3BlqYj6v30qQjJ7ad38q/ptH91aOI4GXw/Tmmdw/HH65IdwUQ6nN5zEr?=
 =?us-ascii?Q?X5ygm6ZK9ZPvfRPiiXH7D+cTd/Hcw1i+BXxeSFuzoJLg0c/1Vot9cSY3PHFN?=
 =?us-ascii?Q?mn2ZANrEdM5fRVxjMBSvOAjiFeY3aL+FvhavDMs0ZJ7RF+dDBmt1ZPBihZbB?=
 =?us-ascii?Q?m1suzy0JtM4PQ1SlL2i2QYHGkOHqc+Te9B1gtrT9rniRbJvC1bMSynuGVD82?=
 =?us-ascii?Q?wO7CHvRy47Lru3Ij01WcV5cjq/r4dkUD3u/vy7WvczfuKKCpHkY4eKoSdEz1?=
 =?us-ascii?Q?+FckI0kXsQ6HPVzeCtLX0zC6t+x4EoIB9/oxDg0nliuGbOwXItxXekZh39Kw?=
 =?us-ascii?Q?BkXWXFkuaGtf6UW7DcatGZGv+Kcr3w8TQPDi4qYNyvBAtIpa2mQZ96knlKw8?=
 =?us-ascii?Q?sUELqD23q+1S6JKy/bxU2FnvVBUOefZZRao2BpUJ2N+fllcDETRcLBFvCXMu?=
 =?us-ascii?Q?o1LKIv3EjyT45DLxI8DaJMO4uM1mvslhTUxsNN0jiCpZw4VCeRHwABKAqrw9?=
 =?us-ascii?Q?MgkxX28jeUKZPbg9Tc3/5T2Hr8cdouApMHl/+r+sjx/9qMxxQQud/wwzuDsO?=
 =?us-ascii?Q?fps3PIgSagX0cEym+nQ8EFGTDOC+Ioe/Bzi6rYl0Ga7aZOXbjP+UnFehQ5xX?=
 =?us-ascii?Q?2MaF9sOG7qCgBoDf4Cr38h8jsnFLSX9LPZI18cvjPlYBuXeSwyKh6K0GeN9h?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ddf2954-e472-4e24-29e9-08dbbee7c504
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 23:24:45.6540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xvHI+YaPr96KdKZge76kwv9mUz9VWzNBMJCvkq2CsTbW8xoHAQU5JZCwyAybqYEveOdgcPgZuuvFXDIMOPf1q8PlDrnELNwas7jqfkJgj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 07/11] drm/xe/pat: Prefer the arch/IP names
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
Cc: intel-xe@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 26, 2023 at 03:36:27PM -0700, Lucas De Marchi wrote:
> Both DG2 and PVC are derived from XeHP, but DG2 should not really
> re-use something introduced by PVC, so it's odd to have DG2 re-using the
> PVC programming for PAT. Let's prefer using the architecture and/or IP
> names.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 114 ++++++++++++++++++------------------
>  1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 8418de44c646..234d0ccd97c9 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -14,57 +14,57 @@
>  								   0x4800, 0x4804, \
>  								   0x4848, 0x484c)
>  
> -#define MTL_L4_POLICY_MASK			REG_GENMASK(3, 2)
> -#define MTL_PAT_3_UC				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 3)
> -#define MTL_PAT_1_WT				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 1)
> -#define MTL_PAT_0_WB				REG_FIELD_PREP(MTL_L4_POLICY_MASK, 0)
> -#define MTL_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
> -#define MTL_3_COH_2W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 3)
> -#define MTL_2_COH_1W				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 2)
> -#define MTL_0_COH_NON				REG_FIELD_PREP(MTL_INDEX_COH_MODE_MASK, 0)
> -
> -#define PVC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
> -#define PVC_PAT_CLOS(x)				REG_FIELD_PREP(PVC_CLOS_LEVEL_MASK, x)
> -
> -#define TGL_MEM_TYPE_MASK			REG_GENMASK(1, 0)
> -#define TGL_PAT_WB				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 3)
> -#define TGL_PAT_WT				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 2)
> -#define TGL_PAT_WC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 1)
> -#define TGL_PAT_UC				REG_FIELD_PREP(TGL_MEM_TYPE_MASK, 0)
> +#define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
> +#define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
> +#define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
> +#define XELPG_PAT_0_WB				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 0)
> +#define XELPG_INDEX_COH_MODE_MASK			REG_GENMASK(1, 0)
> +#define XELPG_3_COH_2W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 3)
> +#define XELPG_2_COH_1W				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 2)
> +#define XELPG_0_COH_NON				REG_FIELD_PREP(XELPG_INDEX_COH_MODE_MASK, 0)
> +
> +#define XEHPC_CLOS_LEVEL_MASK			REG_GENMASK(3, 2)
> +#define XEHPC_PAT_CLOS(x)			REG_FIELD_PREP(XEHPC_CLOS_LEVEL_MASK, x)
> +
> +#define XELP_MEM_TYPE_MASK			REG_GENMASK(1, 0)
> +#define XELP_PAT_WB				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 3)
> +#define XELP_PAT_WT				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 2)
> +#define XELP_PAT_WC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 1)
> +#define XELP_PAT_UC				REG_FIELD_PREP(XELP_MEM_TYPE_MASK, 0)
>  
>  struct xe_pat_ops {
>  	void (*program_graphics)(struct xe_gt *gt, const u32 table[], int n_entries);
>  	void (*program_media)(struct xe_gt *gt, const u32 table[], int n_entries);
>  };
>  
> -static const u32 tgl_pat_table[] = {
> -	[0] = TGL_PAT_WB,
> -	[1] = TGL_PAT_WC,
> -	[2] = TGL_PAT_WT,
> -	[3] = TGL_PAT_UC,
> -	[4] = TGL_PAT_WB,
> -	[5] = TGL_PAT_WB,
> -	[6] = TGL_PAT_WB,
> -	[7] = TGL_PAT_WB,
> +static const u32 xelp_pat_table[] = {
> +	[0] = XELP_PAT_WB,
> +	[1] = XELP_PAT_WC,
> +	[2] = XELP_PAT_WT,
> +	[3] = XELP_PAT_UC,
> +	[4] = XELP_PAT_WB,
> +	[5] = XELP_PAT_WB,
> +	[6] = XELP_PAT_WB,
> +	[7] = XELP_PAT_WB,
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
> +static const u32 xehpc_pat_table[] = {
> +	[0] = XELP_PAT_UC,
> +	[1] = XELP_PAT_WC,
> +	[2] = XELP_PAT_WT,
> +	[3] = XELP_PAT_WB,
> +	[4] = XEHPC_PAT_CLOS(1) | XELP_PAT_WT,
> +	[5] = XEHPC_PAT_CLOS(1) | XELP_PAT_WB,
> +	[6] = XEHPC_PAT_CLOS(2) | XELP_PAT_WT,
> +	[7] = XEHPC_PAT_CLOS(2) | XELP_PAT_WB,
>  };
>  
> -static const u32 mtl_pat_table[] = {
> -	[0] = MTL_PAT_0_WB,
> -	[1] = MTL_PAT_1_WT,
> -	[2] = MTL_PAT_3_UC,
> -	[3] = MTL_PAT_0_WB | MTL_2_COH_1W,
> -	[4] = MTL_PAT_0_WB | MTL_3_COH_2W,
> +static const u32 xelpg_pat_table[] = {
> +	[0] = XELPG_PAT_0_WB,
> +	[1] = XELPG_PAT_1_WT,
> +	[2] = XELPG_PAT_3_UC,
> +	[3] = XELPG_PAT_0_WB | XELPG_2_COH_1W,
> +	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
>  };
>  
>  static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> @@ -85,11 +85,11 @@ static void program_pat_mcr(struct xe_gt *gt, const u32 table[], int n_entries)
>  	}
>  }
>  
> -static const struct xe_pat_ops tgl_pat_ops = {
> +static const struct xe_pat_ops xelp_pat_ops = {
>  	.program_graphics = program_pat,
>  };
>  
> -static const struct xe_pat_ops pvc_pat_ops = {
> +static const struct xe_pat_ops xehp_pat_ops = {
>  	.program_graphics = program_pat_mcr,
>  };
>  
> @@ -97,7 +97,7 @@ static const struct xe_pat_ops pvc_pat_ops = {
>   * SAMedia register offsets are adjusted by the write methods and they target
>   * registers that are not MCR, while for normal GT they are MCR
>   */
> -static const struct xe_pat_ops mtl_pat_ops = {
> +static const struct xe_pat_ops xelpg_pat_ops = {
>  	.program_graphics = program_pat,
>  	.program_media = program_pat_mcr,
>  };
> @@ -105,24 +105,24 @@ static const struct xe_pat_ops mtl_pat_ops = {
>  void xe_pat_init_early(struct xe_device *xe)
>  {
>  	if (xe->info.platform == XE_METEORLAKE) {
> -		xe->pat.ops = &mtl_pat_ops;
> -		xe->pat.table = mtl_pat_table;
> -		xe->pat.n_entries = ARRAY_SIZE(mtl_pat_table);
> +		xe->pat.ops = &xelpg_pat_ops;
> +		xe->pat.table = xelpg_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(xelpg_pat_table);
>  	} else if (xe->info.platform == XE_PVC) {
> -		xe->pat.ops = &pvc_pat_ops;
> -		xe->pat.table = pvc_pat_table;
> -		xe->pat.n_entries = ARRAY_SIZE(pvc_pat_table);
> +		xe->pat.ops = &xehp_pat_ops;
> +		xe->pat.table = xehpc_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(xehpc_pat_table);
>  	} else if (xe->info.platform == XE_DG2) {
>  		/*
> -		 * Programming is like PVC, but same table as previous platforms
> +		 * Programming like XeHP, but same table as previous platforms

This comment is even more confusing now that we're actually in the Xe_HP
block.  :-)  But assuming this comment is already going to get changed
by updates to the previous patches

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  		 */
> -		xe->pat.ops = &pvc_pat_ops;
> -		xe->pat.table = tgl_pat_table;
> -		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
> +		xe->pat.ops = &xehp_pat_ops;
> +		xe->pat.table = xelp_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
>  	} else if (GRAPHICS_VERx100(xe) <= 1210) {
> -		xe->pat.ops = &tgl_pat_ops;
> -		xe->pat.table = tgl_pat_table;
> -		xe->pat.n_entries = ARRAY_SIZE(tgl_pat_table);
> +		xe->pat.ops = &xelp_pat_ops;
> +		xe->pat.table = xelp_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(xelp_pat_table);
>  	} else {
>  		/*
>  		 * Going forward we expect to need new PAT settings for most
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
