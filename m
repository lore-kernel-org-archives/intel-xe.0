Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFC2C54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 21:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DF811222B;
	Mon, 18 Mar 2024 21:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pc4GgEvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9511222B
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 21:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710796543; x=1742332543;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2mA3Idf/A4I6Jtsf+00wzxt38vnUl72mA6uJUxsSC4s=;
 b=Pc4GgEvBsYLaXV7g+c3esIlTT/9+V+c8RwnjndfQxm5dc+PwSpKVCCmY
 Mj702tYqOPALvoppbw9eRQKK3nraWk6u8tmxJ23XrrFcOzGocgbJ4fz5F
 g8gvq6VsYcUJTJXD2ouKuOfe4YURh73nm7H4nbLsYj3JbFAsF8FcZlwJM
 YIlkFE5nr43sAoWVNuvmqhUJ7AfJMTYa/ITB70yCEYp0lDZC/obbY8ThU
 R6s8vblqSM0VAXGx2VCyNoMARksa/gNpkg6BrRdUR96veieZTGNBSO9+7
 KuT5qEEYZXjl9X/aiZIgd23n0tr5QxiNnGP0FVa6ZZIvus5EVSvadJBuO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="6239723"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="6239723"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 14:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="13488026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 14:15:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:15:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 14:15:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 14:15:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 14:15:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0PR1kzAh8n73hAqA4ELypkEHIBMcsZ/DE6mMmbdphwIjqY9cTQEitSH5u7YTM1u15qYefuSs1iDhhwid4xM6Ed3dBME2AUyprUSkN8LLWpwPkiV0U2Ba6UKc6s0W6+URGcDx8ML/2TfYfVKskzV/pW99yxyDN/7WMbaNe7ZVVuwoggYbAHhoWetfgxnwupXB/mN9mCTyacDfsU+4QyW9JqKtb4Oia6o++zyhbHzi7XXxVQjvHyQeN2WND8h3AXErSBxeVzQgWsEIoxjtaFtaxA8jElbEBxpoKVk8qhGE1c/MfJulIhc2tyAax/z1My33MdgLBmYOy/33hytnyL2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft10mt0+aJ09Uq/NmU1AV2U9v7DGIfuIRmfKq4+GUws=;
 b=QdXY2cDAit0bgYnC/6YLsu6uzgAu0O2I10cbqciRi/bsBDjgFlMKXk0bkVaBRKjxZpbTpiNMLCy4fAXixnNHcRL1le+lFe3PsA0SVatMRL90BDdde+HGY1fzacK5P9y3Oy+J4h/DIH4VWnbM02hViz4DJ6OR7cwFrum+drFe9dD6ZLczZjjSPouhvw856mlKaCqgkCSaa73yQ5BvT+/rBvkllP9JOSP4lgQBvK1MwoxmaiL/mHvU5TSdKqfXg1IrwQDfh7ddWEPzxD9p8VnjuIvlnvYEDvBnMi5aNojf5Z/Axa6gX/SbSsti3BUI0+2VdvuMWbqJDLOOG0C6SDdPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 21:15:32 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 21:15:32 +0000
Date: Mon, 18 Mar 2024 17:15:28 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <lucas.demarchi@intel.com>,
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH v2 3/3] RFC drm/xe: add fault injection for lmem init check
Message-ID: <Zfiu8C6FJGA3xezD@intel.com>
References: <20240315100530.3051944-1-riana.tauro@intel.com>
 <20240315100530.3051944-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240315100530.3051944-4-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM6PR11MB4738:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1BoyChojEEC+IW+bSn2l1NacczoobBsgKAK4VkigeG/Hdr1sVUvPo8JMzL3cqrLx2dNKIquGp1iXfd0HV6+yiQD52LVJFwOKt7M8Q8AonuNlkhcMLPzOpuMt8nxn1Nsx1uHCwpzOFDr70jJBvZT2BDhJY/Wr3V/x/hJLzCp+ft1P+bka/dYoJzWdFBnTjwTPF5tfMf+QWGepu77x8vx/FVB0RFmyLx7mO31FMf/u7fv5HiiFw/dCrl9fyRexQaV8eGKupLzv47aX50+4eu2Uv3YYcUXeo/YbDl9JU+/JNlQK5TO9fVIWGv72sTyvxIpnoR0dVpjvRcYJy/LA6+ymb2PbPLsy8FlARQcr02KJwqi37bYrL1JMcZ6D1xP+ge4fk+vAHzPJ2/F7xaKpNyZBbbppv5f2RIQDFom747lPqCl1bhVXmAyXAB8UcDfpI8J0j2Byl4Z693UPCq1ab12gvR5zw8lDVfTQi55nWRIZYh4/Es7fkfeTjG5ydV5ZJTocfSXNTQ227yywzCGmkmtZk+wIKM1MJim8s6mDr2p9hS8fKZ/XEcyj2jAOK2eHQKai6en+d9YeGx/VFSZiCnZCa+xKru7XDVt/5go8B23s6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jfep4FTsOLF0mb3FBFGy3sKm4rPGBEK66heAtzrtav4UDeHO1TN4UCrZCB0k?=
 =?us-ascii?Q?zqlRLCUcGcOSSU9c6H7C7DuHKfzrMhV4bzYc1iLyvpaupX2LUxuYix1xxQH7?=
 =?us-ascii?Q?Y2Jp82WDdSgBoQTIDGcvWwWRkrmse8PanEu83zKZVfcCcNqrJzq/TPdF+/Qh?=
 =?us-ascii?Q?nx9X/Iw9WdluD8cG6s69GaabmDrc3TLUMDkmyJnTWhHAEnTpt09gfrWux17I?=
 =?us-ascii?Q?e0Pptl4UVAmMqMGtZJwnXyDlp2PlOogTVxt5kMNJV9YGAA931mNDzgQNd2PO?=
 =?us-ascii?Q?ny1NUye9QtytWKL31x1eGBnAL+oqYutsTCOmR414PKI3oSjGQNRLGqHYgLRV?=
 =?us-ascii?Q?d1N3eXlEKUMhhdPncrTzcNA/muFhrWhH6ypKNHAFDvu7KgPbNEoH5tBpLBON?=
 =?us-ascii?Q?/DEmow5cqRb6O/PNpFWMeLHnCHD5KO/KMMqyoDuDpwIySOZsNVUnC1MDX1Ve?=
 =?us-ascii?Q?Ab1M1JFwaQb6cifg4dbWpstvTMVR4rbX6lSgAZN/pG1Y7e+YghB4MOVkPB02?=
 =?us-ascii?Q?i5Wkx7XG99HPcbpj3igY4RugiGLw1C5WviFxhNoM/lMa86Ri+D215rdIRYrR?=
 =?us-ascii?Q?RCRbEqXIo6VuwnVhf3w2fqKYVJPoN2MQQ2cKO1HO8RY8XH3McLX7CNKO9SLq?=
 =?us-ascii?Q?/Hvj+OwUY6wHFUke/0tzbUv9z7gj/UnKWELcJIlv8ZMQid7STXC0BngnvfIj?=
 =?us-ascii?Q?+G+Z3uA9NrnQDruk1VuFQ4P6JhmB/1XvwbKTR3sXxAG8OwA1T07qfMsEIl3r?=
 =?us-ascii?Q?+x+zazVrOln8ktWrvERzZQ7V9/E6YKMw28WhaP9PDKbNe3tu0+b+fYX1F5ED?=
 =?us-ascii?Q?7WQ2VGmkDMa7qhHbcKPMGQgMVdSRzaER/MStl9DIFe5C/9rer9Ax8QPKGLtR?=
 =?us-ascii?Q?d+xeXNwxbzsDtDF/xiFgfkiUulIV/FJRjrIuyvYKnXTTucuK6793fK249K3M?=
 =?us-ascii?Q?vpGr598+pOrCN3/ZpIA5BQ/kL/z5gK7H7AyQpUgoZERzkgzmFFzPYYkX9i3f?=
 =?us-ascii?Q?XiUvI43PxFayxgZCClQ/8JTuRb7JjKU/Ez9EHp7bIZi1/5CW1GzRzfRI+0oC?=
 =?us-ascii?Q?0kfpjtnCkFAWe0ADK2PQ6MmT5REXoC39stGsNy/jFUAKd7bI82T8rFD9/XVI?=
 =?us-ascii?Q?eDOrn7U3d/yVYZ6tlxswvEEVQyD/Rk13PTjkY0hRm3ivhNLslxGUsVDwURwF?=
 =?us-ascii?Q?KHdhf6SgjKvjP9XGYEaxBpONLz/UOHdI70G4+TtFcfBoXXVI0dvAk7245vwu?=
 =?us-ascii?Q?yUoHL4qyDdhSKnZ5XRH01vhV9Yl+P6NBRBwBlPi6UJXxw17YyIU7mzceVHlO?=
 =?us-ascii?Q?nejMVpN5uB8GXWqi3vkl07xik7CwuVJ/SixMvtCDKszvaZl3wRRMHW11g6Z5?=
 =?us-ascii?Q?yviVJR9AAGaQ1tdUZBjlB1A9rtXgKm2i45l3kgsqfvcv+tfFb+piGZSF34vB?=
 =?us-ascii?Q?7LsWSB3V+zPyghAh041ZaJBtrkFBgcfSldcgJ1MobGDqdYacz9tqAbt39oGo?=
 =?us-ascii?Q?PWc4GbzlnEjbPR7WJKT4hpLPHamTXK7Vl6sT5ZTguM+tASh82sp1tHsycN7t?=
 =?us-ascii?Q?E9c0bLSSh6IERjB0OVKhKwXrGeK8P1o6DYFhRzrxVYcMotaLug680SHzeAoz?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f1481a-4715-404e-4ee3-08dc47908b91
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 21:15:32.4271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wA24XAOMERbSDZ5F1MxFK/MTq30GGQc7ONhy7Pp5mTm1wUU9DIFD6g1OFZ0VMk2okYkXZJ1Uswfnq1MB4uV2Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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

On Fri, Mar 15, 2024 at 03:35:30PM +0530, Riana Tauro wrote:
> add a boot time fault injection for lmem init check.
> This can be triggered by adding a modparam fail_lmem_init
> 
> xe.fail_lmem_init=<interval>,<probability>,<space>,<times>

Please let's avoid module parameters as much as we can.

Let's use the CONFIG_FAULT_INJECTION_DEBUG_FS
similarly to

fault_create_debugfs_attr("fail_gt_reset", root, &gt_reset_f\
ailure);

And then use it like this:

https://lore.kernel.org/all/20240315010843.194335-1-rodrigo.vivi@intel.com/

> 
> Adding this causes the lmem init check to fail causing
> the probe to defer.
> 
> v2: add fault injection (Lucas)
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 21 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_module.c |  5 +++++
>  drivers/gpu/drm/xe/xe_module.h |  3 +++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 50473329cce7..393610e95bd1 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -51,6 +51,10 @@ struct lockdep_map xe_device_mem_access_lockdep_map = {
>  };
>  #endif
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +DECLARE_FAULT_ATTR(lmem_init_fail);
> +#endif
> +
>  static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -431,6 +435,23 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		return 0;
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +	/*
> +	 * use fault injection to cause a lmem init failure to validate
> +	 * deferred probe. Set the verbose to 0 to  avoid dump stack
> +	 */
> +	if (xe_modparam.fail_lmem_init) {
> +		setup_fault_attr(&lmem_init_fail, xe_modparam.fail_lmem_init);
> +		lmem_init_fail.verbose = 0;
> +		if (should_fail(&lmem_init_fail, 1)) {
> +			/* add delay to reduce the number of deferred probe attempts */
> +			msleep(500);
> +			drm_dbg(&xe->drm, "Fault Injection lmem init failure\n");
> +			return -EPROBE_DEFER;
> +		}
> +	}
> +#endif
> +
>  	if (verify_lmem_ready(gt))
>  		return 0;
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 110b69864656..c4efbab430a7 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -48,6 +48,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>  MODULE_PARM_DESC(force_probe,
>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>  
> +#ifdef CONFIG_FAULT_INJECTION
> +module_param_named_unsafe(fail_lmem_init, xe_modparam.fail_lmem_init, charp, 0400);
> +MODULE_PARM_DESC(fail_lmem_init, "Fault injection. fail_lmem_init=<interval>,<probability>,<space>,<times>");
> +#endif
> +
>  struct init_funcs {
>  	int (*init)(void);
>  	void (*exit)(void);
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 88ef0e8b2bfd..ccbeacbc3efb 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -18,6 +18,9 @@ struct xe_modparam {
>  	char *huc_firmware_path;
>  	char *gsc_firmware_path;
>  	char *force_probe;
> +#if IS_ENABLED(CONFIG_FAULT_INJECTION)
> +	char *fail_lmem_init;
> +#endif /* CONFIG_FAULT_INJECTION */
>  };
>  
>  extern struct xe_modparam xe_modparam;
> -- 
> 2.40.0
> 
