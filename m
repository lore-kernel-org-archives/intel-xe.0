Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A4C6C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 12:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D49310E5DE;
	Wed, 21 Feb 2024 12:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M7CXfry2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AB610E5DE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 12:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708517260; x=1740053260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BSsecVgBacIa+aYYZX4fhe66dcsN22zo2Jzbj7FJW54=;
 b=M7CXfry2z645qZHkbKX16dO25IiKZGMAi4rzB9TRzgQo8TEnenW45SMm
 fPRJLNnUqYMN96CJN+ahretkLzYog5OxL+tGmhfyKArXv2216Zeq6dlgN
 rPvE/FID4CzL1q21bZZ/rkvTtnHgxdtQT66jUK7ApMeNW3cpPOaM9G7Eo
 qraWXiopJW3oGLQy43U+HIxcBdwFN5ca5LtCvG3f5H2HkefbUCBX+CTe9
 bwz35EE/++tL6PS2xz4A2NCPeCSoevpBiZ7z2+TwcQwcDmerh7kcfIstk
 hPNPVs6dFoZdXpr4CxrReJ3fSFo6g9VqZHelqpYJiaHmqgdGxXN2fXfmc g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="13230595"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="13230595"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 04:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="827338805"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="827338805"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 04:07:39 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 04:07:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 04:07:39 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 04:07:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnSWUmE7IiheK+8k6rDdeVC5NKs8JOvGs0ioXL6sVpgHiigrDSpEIeSOn6G0t3I4Awk9a/UrowtKnlBeamdtgZ/NW23wEvHCNSRv9qBX7Hn3+rmdJ+XSC0/LpBGsjnhlhPbYwiXTz0ReGhPxzaxJOg8614bD7acFAiDR3Cp5exEWuuGWFTa334lJTLbnyjxeiH+apaVd/gINwYffnD0to6ZjY+RE8gX9anEudcM8GKrem9Lp9Q4ce4mnbbdk4gvjdPX7RNpxolc7W/bO7wAD/CKKrsEfPwNIs77QYPSyUUTGLKLJCaAkCjOMD+/qhWTkTyDtdFzyicqhCnkfm0OXsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=km1vKrqcCZrXpryREodCKvjUf1sJNESmQJUOPstE1dY=;
 b=OIMq6U7U3N8UEWeEkQUMfayaD1k8+hOkekBdVOm1IYlMgLjmam652nrjWymRwYW3Y5adILXPTGz2CmL8/wfqsrvh+lCXB0DlIAnhkwfgGh6XPX2ahbxbYo+HOUm+6LJk17/iN12Dl63bIGDNkqLhg8F+OC+o1/v/OYYETNxiPqFm126B2QdgI7Qqe9jtPtqmg/B1TbY/X+DeUEsenjINYPuPv7bq/eXT5gUqqMTlCPf97W1ViPog934zoX+ZHndb2u3il4ghoDcI4D1UDA/njEDozl206g9c0Bn7jsxdr1vCBFkt+oWeI3SwsjIY/Vp7pmkKlBlqTtJB1SjNr6NsTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Wed, 21 Feb
 2024 12:07:36 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::63b7:3499:79a1:2796%2]) with mapi id 15.20.7292.036; Wed, 21 Feb 2024
 12:07:36 +0000
Date: Wed, 21 Feb 2024 13:07:30 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
Message-ID: <ZdXngrtmc58-Zyfj@fdugast-desk.home>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0355.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::34) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 85bb882e-a989-485f-2490-08dc32d5b163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WNAmZwIPDenvC2TmFtcUTWyz0IyETaJuA8XM58iboIVsKRiM3M0wLLOpfgWcZ8FimEqNif7cb4m+nZDl//0WrZcyy/yzFJ6pdiJ11cjv/QhZ6DeBo6N5BriLj3ezIZZXtn+auSdxcBs3f4gQfVKiDKspoxNMH0cyeB0QTLh4Fjzye4bse4Jn4MrqBeL+r1JavPzpeRqGqyEiozk2VEpsqCHPqQ8Fsz4afF+1V0RVaAy7zOGppJhtcwQd1ngMgd8rLwtoCmCyaxFIegF8Rf0kKAXxbfgGzAx0NYfTiK2TTDl7E3emm3eiNCyhwDWHKeY1Tp6WS746mUW0amQc1uGOn9asa1aKkyzL3gzEnkb0plywFC9bT0gl9EJiNRiL5nuk2c9kk7mQbLkTvBG5DDD584L4AU9pBtMdySWx9QRAy9zh0kDeDdPJqDZOZ7p1ODTNAshpzD0LVmXoboze5dR0ITWpJ013Xwn+kpkS5fADSlyD0LYp0FqyKhPkcudPWy2HfryOzSIzva7XCDLIg6nJnmRg5R5P+s00WGOT6DF/z0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7u8cxeir4rBkzA1GkAIVq4YY5OC4oYEDtrTa8gzQMLSNX4+vsRvkJa3ANxQs?=
 =?us-ascii?Q?ahrwWr2peZcB31SgzPrQhtF3izUmItzGG9gTit4pxayveZXwFBc/dOfzSdMU?=
 =?us-ascii?Q?1TzhNRCgI5gAXfd1IU823DVe+Fj8DeQUTJ7VDbzx3txS8Uqxz8ICNsVTZIAs?=
 =?us-ascii?Q?/jMcRgM/bcULHQp6vArIY1OpfnwPWIzYgJccJoBHDRtISh+yMS0mACMUL/ra?=
 =?us-ascii?Q?Hoa19eZX7lqpP921KKtgugfSM7BZo5JuQj0hR2D8Wlaw7+N7E0ivJJVV/Tr5?=
 =?us-ascii?Q?Vmf9mfXIaLEhhDhrwfNRe7nOCqGA2Oc9PwAUOutKIYdzqGnB1PwprHsWBqHd?=
 =?us-ascii?Q?n2iJN8CnOj55AndOlGd1i/vlOvC02YFtf15yKYNvLgDJRVuJFcMSPfKji5Cu?=
 =?us-ascii?Q?srZMXsnJRout0ovEu+vkJVRjj/eJRrmXoPyhkRqELJEGUHsTSZfYdrX/ch2I?=
 =?us-ascii?Q?saioplHjb+6ZnYLKODFrr5/jm7Anr59lCcrdl/w7Z4Iety8YwYQ32+F3ZHRd?=
 =?us-ascii?Q?0Z3X6xyLons5seuOq0/aKYWnX6VON6UJKpHfIDx13JJbiapKM57l8OX/YGBA?=
 =?us-ascii?Q?0oSjlKuOUcGdAlMdkGe6t+hJv7BW8o+n5dTsJY5FA4NYJaNc48CYEjqid9Df?=
 =?us-ascii?Q?4IJJAwWZD7DWvX4EJtUP9Gez6DcAdfxw68QQxQ+4l4Knari/kWEAWKlPm4tF?=
 =?us-ascii?Q?Wy4JdeFKSCtLqVWtgohs5JYvpu9CXp+zWDDO0H+jTEOfCpMkrXeFJnGTyVi9?=
 =?us-ascii?Q?ayy2XwwoMEpOfoAhd6oaucIiGKIdcjPswNhxBsB5kBwrHh15SY6yn1ugOUpq?=
 =?us-ascii?Q?AKiAOSIsuUTNqG4E+tauru8Pp1+6OuDdjsiqh96SQX6lMvAXMbN9TPDht6Tp?=
 =?us-ascii?Q?IdXl8BYknUDg2S4DUz+EVXHaQswIwF6ej0thx8jBDD+Gk4spIXgSZ/RmwmeZ?=
 =?us-ascii?Q?QygGmDxH2+ejo97Ps2N+hwwjBQt7l1ookGKk1Ua8Mdzm2AtfZ2g3T9RkKbxS?=
 =?us-ascii?Q?mPZKbXFmVxa3gpzDI9+afsn50ejSraMc6QD4OPl+ArqEF8tjVKQ0EfZBzEda?=
 =?us-ascii?Q?4bUA1J4Id+07R+tlm5Q+T38S6g0Iw4KxMJG1BPt0fb3aaIZq/IxIMmF6iAh8?=
 =?us-ascii?Q?D7d1EhCRLpY2DRjTyU/PLkmLX5Wahv9iJbNuadbates8JBnSi7CZU6rZBj0F?=
 =?us-ascii?Q?wn0MJ3/cmBRFtFm3ondKNTA3vNxigrAnQK+OHAhj5CZ0iYqCgvtlezTQ+O6L?=
 =?us-ascii?Q?py+qOHZk8JSp2kzbtCCCpw25y8IkRQb2VP3QByKOoFrxU+0GGS0ObC0uZVMb?=
 =?us-ascii?Q?K0DXwmdmRF3V38aV+ZnLiUFvY6B9JrRofspcPCynNOSJkrTuIlVoRPW7LlNZ?=
 =?us-ascii?Q?+cuPRkxfnZO0Mm3t+D938tUwXnB2ZP6lSDLnKnyvvoA8HnUAxu2oUiMNEbJV?=
 =?us-ascii?Q?Dg/AQA7qr2TfUAD6nF07PhyS2BR2WqfRiHDGm51XAPaTBEOoBb0TLBAr6WEZ?=
 =?us-ascii?Q?soBkJoIxS64ZV6tyD3UjJM4WLbpAw3PKzNpgubnQwmX/L2i6VRyqqad663kh?=
 =?us-ascii?Q?NtIpRombeaMrfpR7vvTTJIwoEg9Xwq+MszvBvr5TZywnJbvRCHmMWXZ92dtb?=
 =?us-ascii?Q?Cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bb882e-a989-485f-2490-08dc32d5b163
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2024 12:07:36.7335 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sN8WtI+LI69oYykmPRK5AgSGqf3ugR8FAji47oYZYRfogY5d++SZgllpfxRwrZzJ5K78doV3ISqSTedJB+vjIHZPcnR0b7mGQ0o7qC8C2Gw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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

On Thu, Feb 15, 2024 at 02:34:17PM -0500, Rodrigo Vivi wrote:
> Replace outdated information with a proper PM documentation.
> Already establish the rules for the runtime PM get and put that
> Xe needs to follow.
> 
> Also add missing function documentation to all the "exported" functions.
> 
> v2: updated after Francois' feedback.
>     s/grater/greater (Matt)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pm.c | 108 +++++++++++++++++++++++++++++++++----
>  1 file changed, 97 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ab283e9a8b4e..64ffb9a35448 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -25,21 +25,46 @@
>  /**
>   * DOC: Xe Power Management
>   *
> - * Xe PM shall be guided by the simplicity.
> - * Use the simplest hook options whenever possible.
> - * Let's not reinvent the runtime_pm references and hooks.
> - * Shall have a clear separation of display and gt underneath this component.
> + * Xe PM implements the main routines for both system level suspend states and
> + * for the opportunistic runtime suspend states.
>   *
> - * What's next:
> + * System Level Suspend (S-States) - In general this is OS initiated suspend
> + * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3 (suspend to ram),
> + * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume`. They
> + * are the main point for the suspend to and resume from these states.
>   *
> - * For now s2idle and s3 are only working in integrated devices. The next step
> - * is to iterate through all VRAM's BO backing them up into the system memory
> - * before allowing the system suspend.
> + * Runtime Suspend (D-States) - This is the opportunistic PCIe device low power
> + * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
> + * `xe_pm_runtime_resume` systems that PCI subsystem will call before transition
> + * to D3. Also, Xe PM provides get and put functions that Xe driver will use to
> + * indicate activity. In order to avoid locking complications with the memory
> + * management, whenever possible, these get and put functions needs to be called
> + * from the higher/outer levels.
>   *
> - * Also runtime_pm needs to be here from the beginning.
> + * The main cases that need to be protected from the outer levels are: IOCTL,
> + * sysfs, debugfs, dma-buf sharing, GPU execution.
>   *
> - * RC6/RPS are also critical PM features. Let's start with GuCRC and GuC SLPC
> - * and no wait boost. Frequency optimizations should come on a next stage.
> + * PCI D3 is special and can mean D3hot, where Vcc power is on for keeping memory
> + * alive and quicker low latency resume or D3Cold where Vcc power is off for
> + * better power savings.
> + * The Vcc control of PCI hierarchy can only be controlled at the PCI root port
> + * level, while the device driver can be behind multiple bridges/switches and
> + * paired with other devices. For this reason, the PCI subsystem cannot perform
> + * the transition towards D3Cold. The lowest runtime PM possible from the PCI
> + * subsystem is D3hot. Then, if all these paired devices in the same root port
> + * are in D3hot, ACPI will assist here and run its own methods (_PR3 and _OFF)
> + * to perform the transition from D3hot to D3cold. Xe may disallow this
> + * transition by calling pci_d3cold_disable(root_pdev) before going to runtime
> + * suspend. It will be based on runtime conditions such as VRAM usage for a
> + * quick and low latency resume for instance.
> + *
> + * Intel systems are capable of taking the system to S0ix when devices are on
> + * D3hot through the runtime PM. This is also called as 'opportunistic-S0iX'.
> + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be called for
> + * S0ix.
> + *
> + * This component is no responsible for GT idleness (RC6) nor GT frequency

Isn't it s/no/not/? Or s/no/neither/ + s/nor/nor for/? In any case:

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

Francois

> + * management (RPS).
>   */
>  
>  /**
> @@ -178,6 +203,12 @@ void xe_pm_init_early(struct xe_device *xe)
>  	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
>  }
>  
> +/**
> + * xe_pm_init - Initialize Xe Power Management
> + * @xe: xe device instance
> + *
> + * This component is responsible for System and Device sleep states.
> + */
>  void xe_pm_init(struct xe_device *xe)
>  {
>  	/* For now suspend/resume is only allowed with GuC */
> @@ -196,6 +227,10 @@ void xe_pm_init(struct xe_device *xe)
>  	xe_pm_runtime_init(xe);
>  }
>  
> +/**
> + * xe_pm_runtime_fini - Finalize Runtime PM
> + * @xe: xe device instance
> + */
>  void xe_pm_runtime_fini(struct xe_device *xe)
>  {
>  	struct device *dev = xe->drm.dev;
> @@ -225,6 +260,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
>  	return READ_ONCE(xe->pm_callback_task);
>  }
>  
> +/**
> + * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> + * @xe: xe device instance
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_runtime_suspend(struct xe_device *xe)
>  {
>  	struct xe_bo *bo, *on;
> @@ -290,6 +331,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
> + * @xe: xe device instance
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_runtime_resume(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
> @@ -341,22 +388,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative error
> + * code otherwise.
> + */
>  int xe_pm_runtime_get(struct xe_device *xe)
>  {
>  	return pm_runtime_get_sync(xe->drm.dev);
>  }
>  
> +/**
> + * xe_pm_runtime_put - Put the runtime_pm reference back and mark as idle
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative error
> + * code otherwise.
> + */
>  int xe_pm_runtime_put(struct xe_device *xe)
>  {
>  	pm_runtime_mark_last_busy(xe->drm.dev);
>  	return pm_runtime_put(xe->drm.dev);
>  }
>  
> +/**
> + * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
> + * @xe: xe device instance
> + *
> + * Returns: Any number greater than or equal to 0 for success, negative error
> + * code otherwise.
> + */
>  int xe_pm_runtime_get_if_active(struct xe_device *xe)
>  {
>  	return pm_runtime_get_if_active(xe->drm.dev, true);
>  }
>  
> +/**
> + * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie parent bridge
> + * @xe: xe device instance
> + */
>  void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
>  {
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -371,6 +443,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
>  	}
>  }
>  
> +/**
> + * xe_pm_set_vram_threshold - Set a vram threshold for allowing/blocking D3Cold
> + * @xe: xe device instance
> + * @threshold: VRAM size in bites for the D3cold threshold
> + *
> + * Returns 0 for success, negative error code otherwise.
> + */
>  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>  {
>  	struct ttm_resource_manager *man;
> @@ -395,6 +474,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>  	return 0;
>  }
>  
> +/**
> + * xe_pm_d3cold_allowed_toggle - Check conditions to toggle d3cold.allowed
> + * @xe: xe device instance
> + *
> + * To be called during runtime_pm idle callback.
> + * Check for all the D3Cold conditions ahead of runtime suspend.
> + */
>  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>  {
>  	struct ttm_resource_manager *man;
> -- 
> 2.43.0
> 
