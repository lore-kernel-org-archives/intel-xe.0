Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77B3C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2A10FD84;
	Thu, 14 Mar 2024 20:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/ELLWgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C9210FD84
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710448826; x=1741984826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e1NKKPW5RRDvj4XG50vlk4ZB1e8aO3BtVtQyBjkH1IQ=;
 b=V/ELLWgSq/Ah4ct+qvXWROkQyCLjYbrl49QqDdvdsmhUjqzweQIUMjIe
 5k10Q9y1j0nqa/Aj6Jrri430Afb7A0AaLpSgiu/hOfxS5HQCxmQeKl06B
 Jh119zTg9uwXEWdQ5FJsuAhBawbvPwQ6nOzP0v0QqdjfJctNKjW1RIwrU
 g31XYzo1qaqb3nkEVU2Cp/iEUw7Xz6R3E4wTLF0qIBpi8QkJTNR4kxWr7
 u9lek75LXmQra8t5cW+999ZAQXAg5eCr2VU+w0o18WnvjW3YUFnSPCzRW
 lsniYCxeTbMNqjqYfx7FMJhqSDCrj1vg+45VY1BhS6Pf0iht8IIknSJ9M A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="9077726"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="9077726"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="12331954"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:40:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:40:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:40:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:40:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KHsc/lbtu2ztLoFixAdYwKDpiuw8oqJDvE0fcu08TdH9nZP5gYZ6/xs/iTGn130irj4yvp9gNGJxZ8EZzQgt28JJ/yqxZS+/P58yUCYHtaCIrZEnzYR6AEWAn4Y+sZE31FNsERL8Wsi0wQQwzU5bHIzoPU/DivHZLzEBpqujhWoonXQY10v0XA3DycwDCMzWDAjljxIr+dAh4Asj9zOsYnLqtk9L2BG8O92vtkaySAQgGSCocouSdhBU2UOcLpCQ65gA/e7bvduDlfhU0kMQxmTfKwViyArsoCvqh7ZzQ+9rA2SEr8QM85sLrgvAVSPDn3g7vzNdkY3dIrYFLZHaew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+WmhNKDKcvZnyb/fXipI0biIRGkFS+gOmTAJiwij+U=;
 b=ANIGTV+a7yjGVZmu/F/x/0tU10IPxRmosQixzVb/lTgJOtDm+TTCJpjBj+lxMgE6zlHx/usQpjDgj9rxW7eYXcj4Yn/+qwqnNgfNOUMLXlcxmq4/U6dnwzrqWt4VAd7C6P6COtwJ2wV0Dg8TlltxS6CXeTdcoz3snASt33i5zt+GtM/yZbSHCRX512em48Meb9aVu7UQ/uihDecW0GwSFZWleM9qiOEzxCu04HTABHMoHOB4spuB2vqMXTu1aA/nzHPf/Z4eRBDGOGbvYHtD0drCBNIbAq8jPPCJbPR/cZl1M+Ehb1dT9RlCuHERPtdta+mHlWpl0Yr9cA4/GD1iqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Thu, 14 Mar
 2024 20:40:18 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%6]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:40:17 +0000
Date: Thu, 14 Mar 2024 13:40:15 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/6] drm/xe: Mark VF accessible interrupt registers
Message-ID: <20240314204015.GD2837363@mdroper-desk1.amr.corp.intel.com>
References: <20240314173130.1177-1-michal.wajdeczko@intel.com>
 <20240314173130.1177-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240314173130.1177-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR17CA0006.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN2PR11MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a1c804-0ec1-4fcb-dea8-08dc4466f584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2bEbQswLFAB1QePVO7ZzPyYXhIA09q3r6kbXPriv0VyPspB5k2EwdQud3KUcnI25TiX3SmcOVm49pWn12EqhfUc9faZcY59d3aE2BCpuTmhse6MtDCLc+1rRRkvVKvRYRkvkW/ZvJleFmg5yOT/DotWFLLr0KzuYNsNvfjBFXzxzSQXuulSz49OsxZCOMRUjRGlxBLooScdp7stv5PJns5nNAyu1fNlZSW6o1Hnp5KsjrMgZAUUPo83yw05qtzwrIoN71KHPjccEZ5eadu9WowTNBMxkgKSVgKGvAWk/HP5/6q/ohK9O1FkzpHLlfJusmVUzRrEQ1WrTjkpN7Qixb0nSUMkYCWDqLMoQElrDk5JnR7Hnif3Rw2WcXt8knaghoVimrhH9GS4ZZuktQ1Ka8UzagViNjKHbTtOGPyHzHxBCEaC7bAkx5Zu0BZcPO4x8UYmNHChlU6Wl+/k70dsXQXqTvsxJJYorklxZRQnqr3qkAawlIWDFS616aO3zRGxBvrwcAk5nMnoKj8DCXeOTix4YHiUfXQbImXvD2tY8HG+Lu51HCngw9Pmp7Yk4PBnBCdmC/NAKAg82WWFyv2BJVM+7Cq7s7326aNeellCWdR6hKwH5ysks2r2rynzgiteqv3z8+t8faC8I2Wa/QS83NBMoFyTSwYHtrltfyG1SVnc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o80ifjNgVgkWcJpjWcijxu1gybgOaWlxffErH5PAI3kIVaaHkOC5pQfvB/XF?=
 =?us-ascii?Q?p26354J+ADW9wrPPCzrn/VFFU3g9ncL+Sx8TvvqIssp/BlrDqyhIHw1t0rQu?=
 =?us-ascii?Q?e4c+mfRn6LWMyGsWuO59vtlJ2JeVfoXH0OkxTBk77S05GldjA8vCz8jBfYOn?=
 =?us-ascii?Q?7hV04IElkGpfyzgh3Hvr1/TbR+5FLIPQoVgq1S7gHj7ghKiwfApzFgeufs7Y?=
 =?us-ascii?Q?N52liUxcKFlrZQkjd5Ujlm0cs/SAaA1bqLPHUapoVKjJ2geBgUy4oKW4ZhBl?=
 =?us-ascii?Q?Zo0yqwJ2sW/5q7nTmL+OgI3OsVOUHH24siuJt0U7TfSnZ8QPHtWiXPRb48aD?=
 =?us-ascii?Q?LLesbRWO3+08rD/+6HyFusy15J+/EdB9b6EplMzAzvBuXIs3pV0+UIdM4sGE?=
 =?us-ascii?Q?iYySv3VKWVIRtXwNVuJM2i2oIuGGx3pepDaGUazxqCFt5xnAec5LzYTxIZgC?=
 =?us-ascii?Q?glXXel8d7zmRfjXuEMuWoBp5WV6XHygFEUIUWHE6ATGovBzCYrLirX/9Pav4?=
 =?us-ascii?Q?Ffb8KcCbP0ZwilagYN0oSCRp8aiCaBJkH6w775RbEUeXoO++YpWCHWb9Xz2u?=
 =?us-ascii?Q?mZZZyc0h6Su0Da9rdukCQaIWQuCfp53UrS8hy85TwZXgph9aAOv80b9WU1LM?=
 =?us-ascii?Q?tWIAsoA4s4P1ksQM+4KnIRyWxhkCud5WzhdMO9HVBWNVzmbI9/L3kSNGvRZt?=
 =?us-ascii?Q?UIqLISCG3mdXDlfsFD+QXvpE1ys59IY/Ok9CkT8JdRLAQc/7945FWtGHvxH8?=
 =?us-ascii?Q?97hph0i2xNHWLhLdVJ5CB6Gv5sdKPp0mXugx+RmbbwHr4x3wPFskcheG7vTo?=
 =?us-ascii?Q?/9zSYc5D73D6PU1Exn82LN0xgWux5/Jd3xMv8S++DkFrwUy2wiJTKGSG112J?=
 =?us-ascii?Q?rZe1xCGS6O9a+3RBan+UgWOUjG6MwPFNKjlg+Um94Bm/4YJyjsssTgYFv14m?=
 =?us-ascii?Q?BaugAQ3KsT4zToRAaU7gOyGq0dbhtLCg2U5oA72wVxBbLMVLOcFpahnXeUes?=
 =?us-ascii?Q?BSOja2Hca6/oL3cOtFAsoOoh/wojSKR1f/uMfyoA89jTIVPMcFBhxEl6+s/3?=
 =?us-ascii?Q?uFYbUC/2AneVkTTwqTOIhkCGmMl717NoF/+usi00c5V1wlfN2LOp5W8rzOjf?=
 =?us-ascii?Q?xQUAFv49yu/Iu5nDL2Sfq/Z+Jgv+nHKxgYbBKIUIgR9vAe6btiiCSZ96/lps?=
 =?us-ascii?Q?JQ/mWzMC6t0cSKQfbpTTTXg9K/c91jpI0L88+J/WDUFDX81U9OTBuuUO5qLj?=
 =?us-ascii?Q?rLhqKxAaA6gvXIwdAUwJClI95p/hB7pYT42DoN4mthetnvb1K03nWRpOMZPe?=
 =?us-ascii?Q?EDVDimsYHvtNzOzNIgpo1E720K3E4HJc9SlAkPfKrX7VupzZ+cpDXIMJrPqB?=
 =?us-ascii?Q?tPlcMxHD8V/kUBkHEhuxhmn4iyJyBD2DMNS06UsHcawoJnM7wK0Uw/l+qV//?=
 =?us-ascii?Q?ZmdVWE0a3vbgyssbOWMkflKnlwtu7y6ntilOOhyANu2jPT6RbsNr3n62eCCP?=
 =?us-ascii?Q?rbLowjeabWdAEksglb2tcPw1hhKscENAvoDYny1l0dLdOTUudrqqj5gNE5zi?=
 =?us-ascii?Q?5ZOltqg2FqjU5ngpxEMlfIdAwwk//VgGK8exF9GkFowdAvswYEoP9FPydJ8Z?=
 =?us-ascii?Q?Kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a1c804-0ec1-4fcb-dea8-08dc4466f584
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:40:17.7507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDabf8B4hq0Ra9qQa8ZtdEyDoqG+qZS4q3ZHK32RpzJV3VNieuPG97rnftzjYII+byEfyfpKmKwUhnpotBNH2JKLkjfej4otvlRkCSKCAys=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

On Thu, Mar 14, 2024 at 06:31:29PM +0100, Michal Wajdeczko wrote:
> Interrupt registers 1900xx are VF accessible but only until version
> 12.50 as on newer platforms VFs are using memory-based interrupts.
> 
> To avoid complexity, we mark those registers with XE_REG_OPTION_VF
> unconditionally, as IRQ handling on newer VFs is different anyway.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
> v2: explain when those regs are really VFs accessible (Matt)
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 40 ++++++++++++++++------------
>  1 file changed, 23 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 15ac2d284d48..9513a11c5236 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -439,7 +439,13 @@
>  #define GT_PERF_STATUS				XE_REG(0x1381b4)
>  #define   VOLTAGE_MASK				REG_GENMASK(10, 0)
>  
> -#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4))
> +/*
> + * Note: Interrupt registers 1900xx are VF accessible only until version 12.50.
> + *       On newer platforms, VFs are using memory-based interrupts instead.
> + *       However, for simplicity we keep this XE_REG_OPTION_VF tag intact.
> + */
> +
> +#define GT_INTR_DW(x)				XE_REG(0x190018 + ((x) * 4), XE_REG_OPTION_VF)
>  #define   INTR_GSC				REG_BIT(31)
>  #define   INTR_GUC				REG_BIT(25)
>  #define   INTR_MGUC				REG_BIT(24)
> @@ -450,16 +456,16 @@
>  #define   INTR_VECS(x)				REG_BIT(31 - (x))
>  #define   INTR_VCS(x)				REG_BIT(x)
>  
> -#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030)
> -#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034)
> -#define GUC_SG_INTR_ENABLE			XE_REG(0x190038)
> +#define RENDER_COPY_INTR_ENABLE			XE_REG(0x190030, XE_REG_OPTION_VF)
> +#define VCS_VECS_INTR_ENABLE			XE_REG(0x190034, XE_REG_OPTION_VF)
> +#define GUC_SG_INTR_ENABLE			XE_REG(0x190038, XE_REG_OPTION_VF)
>  #define   ENGINE1_MASK				REG_GENMASK(31, 16)
>  #define   ENGINE0_MASK				REG_GENMASK(15, 0)
> -#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c)
> -#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044)
> -#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048)
> +#define GPM_WGBOXPERF_INTR_ENABLE		XE_REG(0x19003c, XE_REG_OPTION_VF)
> +#define GUNIT_GSC_INTR_ENABLE			XE_REG(0x190044, XE_REG_OPTION_VF)
> +#define CCS_RSVD_INTR_ENABLE			XE_REG(0x190048, XE_REG_OPTION_VF)
>  
> -#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4))
> +#define INTR_IDENTITY_REG(x)			XE_REG(0x190060 + ((x) * 4), XE_REG_OPTION_VF)
>  #define   INTR_DATA_VALID			REG_BIT(31)
>  #define   INTR_ENGINE_INSTANCE(x)		REG_FIELD_GET(GENMASK(25, 20), x)
>  #define   INTR_ENGINE_CLASS(x)			REG_FIELD_GET(GENMASK(18, 16), x)
> @@ -468,16 +474,16 @@
>  #define   OTHER_GSC_HECI2_INSTANCE		3
>  #define   OTHER_GSC_INSTANCE			6
>  
> -#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4))
> -#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090)
> -#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0)
> -#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8)
> -#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac)
> -#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0)
> +#define IIR_REG_SELECTOR(x)			XE_REG(0x190070 + ((x) * 4), XE_REG_OPTION_VF)
> +#define RCS0_RSVD_INTR_MASK			XE_REG(0x190090, XE_REG_OPTION_VF)
> +#define BCS_RSVD_INTR_MASK			XE_REG(0x1900a0, XE_REG_OPTION_VF)
> +#define VCS0_VCS1_INTR_MASK			XE_REG(0x1900a8, XE_REG_OPTION_VF)
> +#define VCS2_VCS3_INTR_MASK			XE_REG(0x1900ac, XE_REG_OPTION_VF)
> +#define VECS0_VECS1_INTR_MASK			XE_REG(0x1900d0, XE_REG_OPTION_VF)
>  #define HECI2_RSVD_INTR_MASK			XE_REG(0x1900e4)
> -#define GUC_SG_INTR_MASK			XE_REG(0x1900e8)
> -#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec)
> -#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4)
> +#define GUC_SG_INTR_MASK			XE_REG(0x1900e8, XE_REG_OPTION_VF)
> +#define GPM_WGBOXPERF_INTR_MASK			XE_REG(0x1900ec, XE_REG_OPTION_VF)
> +#define GUNIT_GSC_INTR_MASK			XE_REG(0x1900f4, XE_REG_OPTION_VF)
>  #define CCS0_CCS1_INTR_MASK			XE_REG(0x190100)
>  #define CCS2_CCS3_INTR_MASK			XE_REG(0x190104)
>  #define XEHPC_BCS1_BCS2_INTR_MASK		XE_REG(0x190110)
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
