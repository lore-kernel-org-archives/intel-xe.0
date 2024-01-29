Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87584C47422
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 10:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40F112839;
	Mon, 29 Jan 2024 10:38:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F53112850
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 10:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706524734; x=1738060734;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Rm4xsLlfw7faICnNavoHDp0lMfeq59OIFueeYHPsIS0=;
 b=Dr/B1W4IzNbUf1otWuK9VoHAv9CpF1JZg6SyDRq0P1W9kmySsABuKKdS
 GrB0ir6Vg4qHAMUdhSrHzwELfzqRSoXJlj4ao1HZVzUCNpcxkOijuXdHD
 9tI7eo4UDMDXDml/VMpm5y3DGFxLBAgOSI0Jh+w8T9HMgPTciLmfm5p8V
 LooEEPUBNIZ9LqB63ZUXOgKWirLO9aEvCO+Ap/s1xOge+wvTORveDJLHH
 w2u6ZnkCR0mQb4Sqmy2pt3Qs+19K+XMWZVI3HPGDGTJUZwmCN/soR6O1j
 tBPFSjPmBtAo4/lxlx+4SYGD40oSclUKfAiS43PemI7EBd9Ee0xuUObRa w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="400063393"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="400063393"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 02:38:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="858059860"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="858059860"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2024 02:38:53 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 02:38:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Jan 2024 02:38:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Jan 2024 02:38:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Jan 2024 02:38:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUEEA+hbweNb2tlHrtGudXWYQf6dy3+PULW5A4XwU0VIOwIFwYhLHiDKBbGaWtlR0Qdku0vDEeNKiMvJeaPShbtHVOyMD8NpX9ZZInaxSb7Evm2/GwmU8HqqcZWYAATpAw/pIDHi8FdUu0ezeQ58qZc0FEPdtNYmflGqVDTk0Iq0e6vrtQKrwEpJv1VXg64Noc1iaz+R4xiGlUBqPkTS8vL4QxMrRYPXw7fYz7IXwOyPuiSHW2onAfmZR6iNNOemjgo5GS7NcXogCkuBG+xr4xrkTW3EX/Yt9OWNIhCtz0ztd12g4z1tSbaseApX6nBSKH2aqGn39h8zESTjqvAy9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tund/+c4yTj9FaSuGA8yRThI6W2ugd7Kw9PCo95MPjI=;
 b=IyogeloBRQkW+LEDu/5hTXKMqqMkGzl82Vj0l1U7ZeRF0UJZ0NFiI6D+a5ZyUCYjD11kvvhIQChCjemM00be9iuOFRWpZeM6Ch6mmQtseWLBKmk9Q0GXGIGo03Wruf0V2hGvPwvqtCZM+favThf6CfUjur/SB2nax9KBX6ueO5cTRyGKMUVvPBO0xk4g+uPOEFO7hHu8I+VHUyETp9DyeVTq59ZlKV8bO52BNi7/bxX52jvwUinmBPqYfI+mQ98jz73Cxo//430spfdnjHSVX3BnGZFbqyjKIsoY3vmToPH6oADK6ycBMLl+4Td/KcygeBjxw4osdwYubF7QT1lo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH7PR11MB8526.namprd11.prod.outlook.com (2603:10b6:510:30a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Mon, 29 Jan
 2024 10:38:45 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::7d36:1951:b896:cb37%7]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 10:38:45 +0000
Date: Mon, 29 Jan 2024 11:38:39 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC 02/34] drm/xe: Document Xe PM component
Message-ID: <ZbeAL3ZAzy6GH-J9@fdugast-desk.home>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-3-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240126203044.1104705-3-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU6P191CA0001.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH7PR11MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d8e24c-980c-46ba-4d76-08dc20b67831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Da5onCC8SBcv8EYAEgxOcc0G5rw+GgDhp69Lp/ppmNGynigYQnIwN2q8esmVmnwPRV7bIFQybq59ZaakFZo7ho6mcZRDOsF6MAmB847WZ6/rz7Q9oarHoMaqiZ0cz1hIoPBsba16PiXvTvuMl/ktPAmli6bvxlTVthNRC80r04Sjo/F6+qudxAqwl0wlpWroDJX/Q/9PDDs0Ic46M9Aj+4B+sidAos1HfARa5VYiRk/kA0ib6RBWadfWORyAjsIbdeLDK92gyGF4e05qEYWRjL0nq6vNH/HpAUFTdCEEWHaMnZ98gC3qOJHxg95lH3YUjSzLD31o4MhM15GtUArHn+Ib41oy/QoUn+LkGmv1FIjdDJRbrDpVuZzmydY5tSJxiu/a9vRT+YHxzs+wS3Sa9kwKDCuzY04JUd7EwmMyaN4Xl4ubzwMqbdu8Iy4BAv16ylLSQkbYJPKFgIi0Cj8psOGttYjp2kGDuQ1RtVA1e9AZRKImIqlQOuslbZB9Jaaz+Kxop3GJKTaHTxVUvdARK4hHnF7PE737EOyTi+YS0FNono1oWtTrijRyW26Ey8md
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(26005)(6666004)(36916002)(6506007)(6512007)(9686003)(38100700002)(5660300002)(4326008)(6862004)(8936002)(44832011)(41300700001)(8676002)(2906002)(478600001)(6486002)(316002)(6636002)(66476007)(66556008)(66946007)(36756003)(86362001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFb1gQHNIM/WOgHpIAHlzlkn6vv+75LprYx/oeslREdt8lXMz37dc+gplBOT?=
 =?us-ascii?Q?HejLWGfqgqGLDRoLQTgoZc+a5TwnVL9wmwAjaUYgqKfNM2ynOfubZV5sYjLX?=
 =?us-ascii?Q?TV1XCJyJMQgewrH7HdMdA9Kxi9nWU9vX/9Z806rLhEXQytoB1J8u9VjRldu/?=
 =?us-ascii?Q?5iqwCkW08kUD/I7Y6nggTenAlgJRHJc+k4waVbDPDojqrNoZiKsTOZEMySdN?=
 =?us-ascii?Q?D4ppvT/eKvHv2Lh21vax4Xsz+Zfl4MFPlTf62Lcq8cI+KP2E47PlYStA65P1?=
 =?us-ascii?Q?TtvXJYzdLuWfigsPy+jjShaIcmvBwrBU45xi5SDxD4vrhikyOuBerlmPZnMK?=
 =?us-ascii?Q?6WwbrSdyMY8LPfLY5r4lr32mFUakMtzrNvttMWCoXvSxBQLgnNTLKtR7P9/H?=
 =?us-ascii?Q?10nB6PYrUIfA/JBr+yaLbUAydQ5U/4xZLNCfjYUZqKY/CrsxKmBkn2A8zvMj?=
 =?us-ascii?Q?MAT42l88j9gf8/bWf2XgVzbeVGUdgDqR1+9nHQkaY+0ejwe4vm4vTgdgwAcx?=
 =?us-ascii?Q?8wscWjfa4GrJcn1QQZbQ2pMlkxsjuooIq79nATBF8G/7vuTr27MPb1C8DJxT?=
 =?us-ascii?Q?ds31GTk+Xb4qNs8plaorV6fVHCiMiaVMZTGviXGmCzqHAHF63hEhkUeJockU?=
 =?us-ascii?Q?zBIEXORiqf+UOsUvqCV3KpMemHthOuFIkndaYkoyQU42e23sHM8l5a7RgJPC?=
 =?us-ascii?Q?QuCy71d84Zf5fDJYiKv4upuipe4pocimrBfQigBfwxaxV6mQYHpc8rWwUUAE?=
 =?us-ascii?Q?fccphF228FCUSS0efrIqIJDzDA48QSMd20ctSP0+XMQOhT3MOwDBF4utjKn9?=
 =?us-ascii?Q?xW0bPXl2aIzW+33dkpnnH9pcAC164WYU5voEg0ODWgDDexrQCX9bNt/kwOpX?=
 =?us-ascii?Q?dFFriACaXntVUQUyds6hAw4eb/rtgHSzPnnNF6ixIQSgbtoq2HIMl5J1CXQE?=
 =?us-ascii?Q?TyGP+gvd4++6P2OtqYlMGzVavL3MO7O/zRnI5LECyIBzaFusnnR6O35nxXFp?=
 =?us-ascii?Q?hoLxi3qh1lhrACGet8PzWaBj5BzkOGI1cmXB3/RMV15L6KLQMI8qCk/xL8MA?=
 =?us-ascii?Q?3zVYjlMPRIn3dZ+hWyz/pSGrodJ4sM0DHrooboa7/YNM55gtgFF/7Q+cEZnG?=
 =?us-ascii?Q?imR25Kbma2yUaseEJKa3qbRZEuaO6abm5GxrhLE+toy8bs1l9uw6dsT6oqP2?=
 =?us-ascii?Q?cBQd3hHzIEszPWXeWdKq+zCMxOCmY5yxqdH4nkNtGjjQfK1C2KWoGoswQqn9?=
 =?us-ascii?Q?VBcpPlbZlcCFnzvtQ0WU9wa1nYy0mdB81ptV6np6lnW2kFXoTCBx9y4PGN4e?=
 =?us-ascii?Q?kqO7If595PdpTU4JvuPb1wClajQVvgw17KjnvnW0qUJqR5G8wY7JLQ6IgbYF?=
 =?us-ascii?Q?uBhsho4N3ktRgHUtL+ZdKpbkiSpn8rUQADlSeYqQYXxCC6kkb9gV2kHnSc9A?=
 =?us-ascii?Q?dTRBH45jJrvAzDq6o8BhcALO4CC51DAXVgJg0rs1ypXzAh5FlyYE06yLEahl?=
 =?us-ascii?Q?7l929JqUaxeZ6J5os0SLa7HrLTIyInB7BTNdbCI3hCZEHJ2D7yIMOfVD8URw?=
 =?us-ascii?Q?HyyWhQWjqVTMElWNk0H/V2Y9gdKswAKwsyxLekp5TwdIw/BYxz9992YsMXs4?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d8e24c-980c-46ba-4d76-08dc20b67831
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 10:38:45.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Itpj/1xbzHu2LcYCQkNJSxlMtrA9o0Nh1JYCbjsuQEBc/LYS04YH5vBgojq9ONWyFxk7nggotT0iJoElbNEIFRJydjtUul7Snt++ChwIkwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8526
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jan 26, 2024 at 03:30:11PM -0500, Rodrigo Vivi wrote:
> Replace outdated information with a proper PM documentation.
> Already establish the rules for the runtime PM get and put that
> Xe needs to follow.
> 
> Also add missing function documentation to all the "exported" functions.
> 
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Hi,

Very helpful summary, I think the level of detail is spot on. Minor nits below.

Acked-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_pm.c | 107 +++++++++++++++++++++++++++++++++----
>  1 file changed, 96 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index d5f219796d7e..bd35fe9f6227 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -25,21 +25,45 @@
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
> + * S4 (disk). The main functions here are `xe_pm_suspend` and `xe_pm_resume` that

The sentence seems a bit long to me, maybe s/that/. They/?

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
> + * The main cases that need to be protected from the outer levels are: IOCLT,

s/IOCLT/IOCTL/

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
> + * are in D3hot, ACPI will assist here and run its _PR3 and _OFF methods to

If the "_PR3 and _OFF" reference is needed, maybe provide a pointer to those?

> + * perform the transition from D3hot to D3cold. Xe may disallow this transition

How?

Francois

> + * based on runtime conditions such as VRAM usage for a quick and low latency
> + * resume for instance.
> + *
> + * Intel systems are capable of taking the system to S0ix when devices are on
> + * D3hot through the runtime PM. This is also called as 'opportunistic-S0iX'.
> + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be called for
> + * S0ix.
> + *
> + * This component is no responsible for GT idleness (RC6) nor GT frequency
> + * management (RPS).
>   */
>  
>  /**
> @@ -169,6 +193,12 @@ void xe_pm_init_early(struct xe_device *xe)
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
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -189,6 +219,10 @@ void xe_pm_init(struct xe_device *xe)
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
> @@ -218,6 +252,12 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe)
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
> @@ -283,6 +323,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
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
> @@ -334,22 +380,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	return err;
>  }
>  
> +/**
> + * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
> + * @xe: xe device instance
> + *
> + * Returns: Any number grater than or equal to 0 for success, negative error
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
> + * Returns: Any number grater than or equal to 0 for success, negative error
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
> + * Returns: Any number grater than or equal to 0 for success, negative error
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
> @@ -364,6 +435,13 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
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
> @@ -388,6 +466,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
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
