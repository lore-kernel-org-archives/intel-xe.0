Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B3CC76188
	for <intel-xe@archiver.kernel.org>; Mon,  3 Apr 2023 17:50:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B74610E514;
	Mon,  3 Apr 2023 17:50:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49E410E00A
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Apr 2023 17:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680544251; x=1712080251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a/EbyMuIdM7ArzA02TGEYkcRBL0+DyQ1Lrn8P7K4PTY=;
 b=GGl+nVHmXVf+5hoWHcTrSFUNc7khSJod2yT23VnaR3+0C61TYLRq1QNw
 v1ppOnTOl/83hugatLfRZ6eZRHpkaOBJNv0NuFiRHs6doB1G92jF64DSt
 bqmRUhIfIQfjUuw5tUMr8j4SxwV9xmWTbdOyxibC86ZoSktBmLupbXK5K
 hkjzcFKjrErOiDzmZQCclm+VZUeNVK2mZ4WteuYbX5zBwcD9Rx4cAiy30
 L/DY0G4x8bjZ+xPY9p1a2aqpxIsI1TWfj49BEDFMuaEMmbKz5KbV/g0KX
 MMUbjt7pnS7R7qDiXu5wwqo6SqZUaD2JSSzuOPHRbUQLF2RTXFjSPPsVa A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="321634259"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="321634259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 10:50:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="932131581"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="932131581"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2023 10:50:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 10:50:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 10:50:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 10:50:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 10:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbYkHXDW9D40GcUvJXfM08OIZo+UDcBBo9s7+vqSzmqyA2Jm07yGErW4Z8mBx6tFz+ffLQyQbmFiyLGnjpR8w0NfVJkgKtQ3LqMXcVQuVtvigdFUs5OT1dsV6ALGpAb4Ap843yyP/ZAnosG81GR9iGvfHqJLT8Ym4bCXRYsxUPssF7sh8vfSvKIvPWQox6MyAtRQ4MTlLZLCKVx/3ij8VZs2TfRQWW50I/E4oeop8kLVTVeJ1Yl7U7nDK+4UeSNdy4undjwlrrMlv5IKtrnglIXv0j5XyRvVY3HtVMDyNznp8N2LXn87i9ZV3AxGYUs88z1mQaCtlWjMoeXDu0LP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSDjC0JTBOXu8BJI8qMdlnZ7zDkox73xnmAaS0ZnExA=;
 b=M+D06zWIfckT6pPzD3rRPGHU84b1cO6CSpmv3zzoNpQ0xpvX8IOHMucxXj/CLCf4lj7aZw8voUK93lM3SWsP/Mw1aqtF3qiypv0cGUQ4uHI8yYIhzimCN+hGNUS+ZOCBMcfbDxyef2IcVVJsxAP43IEvlrVbZgUcH7GUvxN6kdPr5LY6MrdqGzRkNmTudlju9uVKz/5bR0g8p9HcslnGQeGyaRZ6JxkfAMpktoNLI2jlYzdGM4ER9BWNlxiYy2TBmiaiy12qBr4TKPX0YZfWq6+V1J6fNdGn4D8KgQrQgpVEWg9vg8Vz8GXGn81wzWSqaJWJd4Jx8c69LKHPXn+61g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.28; Mon, 3 Apr
 2023 17:50:48 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 17:50:48 +0000
Date: Mon, 3 Apr 2023 10:50:45 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230403175045.GV4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230331230902.1603294-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230331230902.1603294-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR02CA0012.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::25) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe160dc-3d28-49bd-f6a0-08db346bf4f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0cESUTCFrvEVLdoUItitdOwtOY35AIe+t3vovnk0zSJIU6IBMylSCig0v8tklsXzOOfoy/vwjOge7IiSDS70ddI7Zri2JKHqiEx7F//anWuc5S6YRL01KA5w6UCLZ33l5JRf5kjOp0yhCoI3q4QzlxbSWJHJ7L7QqtBYahYzltJmlHN2cV3SqrMVtvCiMHSNpG4rzHy8FJwroG2zPPt5Ly8vFi0moiDdaa13GXeDIARTMOPzj66KLd7867/DGz4fs4DDg4qTcCGx6spu/74wzOOwckuq1jIAqiDLajZptspFOsLrApG6iuN/tZQuEyTXVdx1lydFRRT86aqd4loDHUKaNH5ZS6Vhg37HOeS9prsnQiMeMQirf47l1SLzMrMsSkAScljQKb8rGANJqnzJOdxzDIVrLP2DMIH85UErCrKmgXVfmhXr0gA5mUwIuXggPPO3tHVyonHfNPyN1aj3lZN5RtOfQGnVT3U8sYWo/TXL4FAQErW2mCqQ+rGGqoyPbd56ila6zoCjoXgWIHp6FtDuzXwQ0Te91mfUSdfBCtxU6Y1c5S7ZMDVxEahO2bBc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199021)(83380400001)(6486002)(6666004)(186003)(33656002)(38100700002)(86362001)(1076003)(6512007)(107886003)(6506007)(26005)(82960400001)(66946007)(6636002)(2906002)(66476007)(8676002)(8936002)(4326008)(41300700001)(316002)(6862004)(5660300002)(66556008)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iR9pgT0zQxQ7EMY6DgT2fLS6mEu4iAgk2grKdpyb6iBpsui/A7vhJBey/gT8?=
 =?us-ascii?Q?LDuzE90zYb+nOtOytlMDMwSCpUq9f0F5O6PbOuG8TitKLZmHuTA5f3DT3SPc?=
 =?us-ascii?Q?Ql3ah9c+MyJy0sRYx6lOniuqqF+Dx4JWvQZHOq4CYqg/HScaWMg6FPn4CKrz?=
 =?us-ascii?Q?PgEvSVOUbdDgSveOxp3DY8v7/cN4RhznDeWmBuO3/qyIji0MOl05XCcq/Kg7?=
 =?us-ascii?Q?bcRUe+4ydldWYfPmMuNNzvirdCCxID563+nSSZAiK8qWFZ4aIsnYIbKTiKYg?=
 =?us-ascii?Q?3Ij/jnYOLf9LG1ANzY6Jth205SjUmp9IXTN3AtslXKcJC/MqxaU8FtItv4q0?=
 =?us-ascii?Q?MqfXi1tewx1M0KuGF9movLx7QPfleuONyoL6JTJ/9e1DeO/J2E4ARAKC/9Tw?=
 =?us-ascii?Q?5qxt7F/NRkUVVUSC6ETtrgmg5XD+XNq4sOqFkFWzV0Bwgbke/P0dJDQSvSz8?=
 =?us-ascii?Q?bAQbQCuNVsjY5dxJ5ZabDBt25tf3j0OEjHlYlEcBrkwTNPZa9YvTH7EIdJof?=
 =?us-ascii?Q?ksrTWhQf1f9Z40jWi5nJMMSda50AjEfIPbvCZghgq10LPiGtNi4ut3FmN9ep?=
 =?us-ascii?Q?tYkVZXeAgSYBuJ1o03a4TeohtFIv6En2+V14XbTIlnyxhyQIYSwGDgD45fqf?=
 =?us-ascii?Q?zzl/UU8ArxWe945cJWF+EhMXH5L+ZMa0kNQbjH+igf/FQP/emadsUo13wt8H?=
 =?us-ascii?Q?X9fZoKcoMiMMTCz3Mswsz4dNSL7oWNtqS86GjVlvaWHA19EpsQSKBA2297+Y?=
 =?us-ascii?Q?ZSw5sF6l/KHYH6XRZz8q9BZ97pStNmKCcVEJMaeDEKhAca0JZFwOcRfNdvmT?=
 =?us-ascii?Q?pRoHrNWvrPr0mnAKVuCnL1Owk/dWZPfjTs3bMBQq2GtCyq7PrGcsVvlxdVQp?=
 =?us-ascii?Q?+Ce62vmwjBDm2iCP03CA3v1pkIdeo+cGjeo9YT+F6Of/lwOTpDY4gndfO+i0?=
 =?us-ascii?Q?/hrKViVc9mfTSL6uDCSdeKa40e3FnouGVHHSmO9MSKf6cM799vipq7Qgplgs?=
 =?us-ascii?Q?VYp1woeLvDMBvPPGVdFTi/JxBYEJeCSRi7PArB7GzfAKMCQ+PoTnyCmurUZz?=
 =?us-ascii?Q?16CZgKTeqb1DDZ6bcBRAUNi3aAtKhrtqooUbRbWeSXfO7TGjrms0fCg7yWAU?=
 =?us-ascii?Q?BF6RXz9YeJTrxJMpS++8lHWT7O3PdCBhzFhQCSqDymgrnAR3b7yuAd7PQF5E?=
 =?us-ascii?Q?/5qWY55aq+AESTqFHMq5DT0y6+3gw0d00nxh/dj1pqmRetZTHmLoRKcsdFEC?=
 =?us-ascii?Q?2GmmwtCWpfSCwZglXrU5RWtWleYXcJZDdd9bhZt50CiNpdGw3sCxZtArAkb2?=
 =?us-ascii?Q?FfS7qqG2jhA9/hvLRO7TKK6xds+cCPFoiJiPpIBhuOea/AfeLFjZ/QD67ijw?=
 =?us-ascii?Q?Y+QB2tSBrCUGykC99EeO2P0eYA/HZUUzh41HFyTJ3xyNZ7QzKXlMK/An3jho?=
 =?us-ascii?Q?GLkVRlD/GqH1zJevlCuubqupjvk31dKd59hhgca1JfMkmxNRFKxusCSPUkz9?=
 =?us-ascii?Q?yzRhBzp0wH3iOralYh9zsDixbiv5cUnHT75MH3kYXIH1oDDm9m5RhnifLxz5?=
 =?us-ascii?Q?hitc8+uefMhzICRtymr0FjBLkLRcClDa5HJkpmWwbuIiEE1QJRwgiUKhYFzV?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe160dc-3d28-49bd-f6a0-08db346bf4f6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 17:50:48.0817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLUHkpcRFj07xdmg3ypxzqJkXyM6q+vXbRf0U7p2plxLgZAKOUWS2NN/UH4T/Xt1JGZf+8bal3lBYc3e6uI1w1iFhtBhZfJX6xwxnN6JgXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Fix platform order
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
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Mar 31, 2023 at 04:09:02PM -0700, Lucas De Marchi wrote:
> Platform order in enum xe_platform started to be used by some parts of
> the code, like the GuC/HuC firmware loading logic. The order itself is
> not very important, but it's better to follow a convention: as was
> documented in the comment above the enum, reorder the platforms by
> graphics version. While at it, remove the gen terminology.
> 
> v2:
>   - Use "graphics version" instead of chronological order (Matt Roper)
>   - Also change pciidlist to follow the same order
>   - Remove "gen" from comments around enum xe_platform
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pci.c            |  4 ++--
>  drivers/gpu/drm/xe/xe_platform_types.h | 12 +++++++-----
>  drivers/gpu/drm/xe/xe_uc_fw.c          |  4 ++--
>  3 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 91fed9d3105e..1844cff8fba8 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -286,11 +286,11 @@ __diag_pop();
>   */
>  static const struct pci_device_id pciidlist[] = {
>  	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
> +	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> +	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>  	XE_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_desc),
>  	XE_DG2_IDS(INTEL_VGA_DEVICE, &dg2_desc),
> -	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> -	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
>  	XE_PVC_IDS(INTEL_VGA_DEVICE, &pvc_desc),
>  	XE_MTL_IDS(INTEL_VGA_DEVICE, &mtl_desc),
>  	{ }
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index 72612c832e88..80c19bffe79c 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -6,27 +6,29 @@
>  #ifndef _XE_PLATFORM_INFO_TYPES_H_
>  #define _XE_PLATFORM_INFO_TYPES_H_
>  
> -/* Keep in gen based order, and chronological order within a gen */
> +/*
> + * Keep this in graphics version based order and chronological order within a
> + * version
> + */
>  enum xe_platform {
>  	XE_PLATFORM_UNINITIALIZED = 0,
> -	/* gen12 */
>  	XE_TIGERLAKE,
>  	XE_ROCKETLAKE,
> +	XE_ALDERLAKE_S,
> +	XE_ALDERLAKE_P,
>  	XE_DG1,
>  	XE_DG2,
>  	XE_PVC,
> -	XE_ALDERLAKE_S,
> -	XE_ALDERLAKE_P,
>  	XE_METEORLAKE,
>  };
>  
>  enum xe_subplatform {
>  	XE_SUBPLATFORM_UNINITIALIZED = 0,
>  	XE_SUBPLATFORM_NONE,
> +	XE_SUBPLATFORM_ADLP_RPLU,
>  	XE_SUBPLATFORM_DG2_G10,
>  	XE_SUBPLATFORM_DG2_G11,
>  	XE_SUBPLATFORM_DG2_G12,
> -	XE_SUBPLATFORM_ADLP_RPLU,
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e2c982b37e87..d1d2e6f0820d 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -43,11 +43,11 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>   */
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>  	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>  
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
