Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708BFC27C52
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 18:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255F510E5C6;
	Tue,  4 Jun 2024 18:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN4a0aZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D108010E5C6
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 18:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717526916; x=1749062916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Oi0ZGw7R5V4rAuLV3/1Di2M0mMeFCb3ABafNXO5VuDI=;
 b=YN4a0aZfxLcnedTLL8y+MWk4MVQOpA4wpSKtayjvKO9nEUv/2Pa+E7Pd
 Bg36p4t5a+tJ/JLtjyjkRYqBJEU9sr0jWt5aQdXynjaeP+jPLcDA9FZA5
 llnugFT90UIayF/ZopUcQ/tNIHe42GF4Fa2PyvdbZs/AaUK46YmNIXnwr
 td4nwdQFyN/wR2lRvI4FKNLBZuobmXt2z6VJ3wjPgLr2X5pXE19l7L2jK
 JQFZGkMgWjVSCvtflJ0vNdMCR65zrI8yCjUb0IP/cFJMEOXw+dWlBYqV8
 PNg9CZrQ6Nv28b8i1ekenpSKB8RdiruzZuErvI00vWbBIRbWUPWP4MA13 Q==;
X-CSE-ConnectionGUID: C24CIqTkTyO8EuWc9Gvf2w==
X-CSE-MsgGUID: 2WUEIRIESR60rmzyLiKVfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17035606"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="17035606"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 11:48:14 -0700
X-CSE-ConnectionGUID: WMN3J8EJTKGCYyzliVBJRg==
X-CSE-MsgGUID: FSmI9VUiSsGvMOwqXtGtkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="41880645"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Jun 2024 11:48:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 11:48:09 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 4 Jun 2024 11:48:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 4 Jun 2024 11:48:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 11:48:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/C0/UEtvTFYonIKKq9jFjXsuSHAH11Y4NBWdU8u43xlwOtCvCePdCASeneV6WsYstyOFKjjrIRLde2plWfBxmh+c2pe7rnLNmCJJSHfuSTFgupudAK265Qu4+RgHzEEp3FiEcE2Op2IyFFdGQWSZtQzbAEst3QtmW3YK+mac34kIk59hIElOgIFdeqm5UwUxwz1h+Iv0NFs37BnQqUHnYDBHHSkJIz76y8DHFqOJaIANPc7ujsIVfoovySC6dg4+E30pPCjYVjHlOifBRnZDvnsXnHmd7E8yX+9vJyrNDFTuJz98L+LHEd6iNLxXfzSsgEyUf3B6wqYBLujDB7EwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79F3x3vB9+QeHIbRTX+2rr+/6E5ggA2PPZIZDiqmm3U=;
 b=IBlYbp09pooyW+1hq9VR9X5hBZYPZ1Buye2pDf/6ol7xKDE73y8cCJuPtpuc3zSsWRxgJA8iMcrPduowbGVDh3VGmF6M4zO/Ay37vwP4nEFV7rwARUudTnaAOzNXlsjbpFt7VcEqzLbeVARVvq0n25WtEM3M3oXvJhIjocaOLaSNvc7thEjLcOfJnVXTOK05oEBXBF0QGVcbj3vjWIjySqWWfhrG1wexVrL3w/9FzxEtQxDoQNltLuZO33NUkhgMuO7I6pAEUwUju3R6qYAxtQhjINQw6mv4A3+JDTGw9qmlgQ8/ugwjnaFFxDug4Vop3GakZsBFm4wYTUoB6Ypd2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 18:48:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 18:48:05 +0000
Date: Tue, 4 Jun 2024 14:48:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v2 1/3] drm/xe: Cleanup force wake registers bit
 definitions
Message-ID: <Zl9hYn2IiuzgEoKc@intel.com>
References: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240603090147.1098639-1-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: SJ0P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::13) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: ad8d94b1-acb9-4730-9c96-08dc84c6de6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QxBXNTEdqku69Yja0oWN0o0RopvtOs0OjqzaVPVWZy42mIFbJNuICJkMpk+H?=
 =?us-ascii?Q?0cR3hmXdMoDdvHnzvyQPt6Qd2QV9q3U65tD+nKbu+XodO605F0W3xmNb4nXj?=
 =?us-ascii?Q?BTCRSCaOVILP4FuYmETl5cPk4Rufe3reN2hbF0GoV0VGew5UCV/lO0R8Nkfu?=
 =?us-ascii?Q?OlYtATx8N3QmfSYt47IteWcT3LfQr9FVLjRNAgv5Lz3La4Jl1mHh+lSVu+Gf?=
 =?us-ascii?Q?ZW0DAqWbPfP9O8gM7AVWu/b9Y4PTzIEdrJH02rIwYsYUDa8sGdQ+y/2RClSR?=
 =?us-ascii?Q?EFQcSd1f+eMxt/g5rOE76AWbH4cQzuxqZQ0BlEqAkVa5GQPKxHzFbooyDvXX?=
 =?us-ascii?Q?ymF5b2+yauGpP09OxAWTnF66s0sFMuVUC89NdHhSNC1PMqbqtv+B+cExdNBH?=
 =?us-ascii?Q?+wcGa96fkpmCYQrdHGhvvc3ynjjIhvQMg14H+ZOpe9q+TEnlJ+7fJdFgUKpi?=
 =?us-ascii?Q?Ir9kV4jEFsqZZpU5XYhnt9BUnnqSeafbmTBVG69gMyHAqNOmCJjaXFjHaFiO?=
 =?us-ascii?Q?tdM+s+CmnBypE9MVNB8pbgqIXtWhPnFv48Z7kghCeih8BVgVSHk1nohMcpie?=
 =?us-ascii?Q?Ddq1fqZpiDQAdECnURQhqr2ZBykJSehY8hbxnQYS2d1O+PTyY7+PyNIpMgoh?=
 =?us-ascii?Q?e9PAJBXG143aHPRMf3gvxRy+dQZOUzOYMkbD+aRw7pc1ZtEtqeZFpYQRHVdB?=
 =?us-ascii?Q?s1zrkQT6TcRTfQs9X9u1YoKbGS4nWC8gKpIP4hUe3bw1O5aKJwYtLBNOjDIC?=
 =?us-ascii?Q?oTkaHNbKkwbk/OLjLLlaqt8Xj9V2DALXIn6abgmuAcidSd+h0ELq425Rt7AL?=
 =?us-ascii?Q?xTD0yoJwUeb8xxxG3UwBKN3bynGR1ch6+GkkjZooOfjx5+NJMfTfkTNdOIWw?=
 =?us-ascii?Q?flJtj0A4zL9Fsjal2lxXKv0xwk32Rhia4JEcUuIeNJrfLF4z15rhzMUtF2BB?=
 =?us-ascii?Q?WHsB0clhE8OcE8kyCFMN+G/kNDnrwxBVRboT5vKLbC8qU9hXk1Lm4Kh7spI7?=
 =?us-ascii?Q?NpGbQgMCION4h7aGojidN/XUjoB02Xz34ADIRFxftIeOYXUCaD55eLee5bgb?=
 =?us-ascii?Q?VE7zC2/v2wVeTaxNRnbUbjfVj012sS2fz8CmdRjESkrapHHgauw+zAbQw7Ru?=
 =?us-ascii?Q?7iKNa3S8W/LDkuqng1KbL9ZE8Xr6C+bSyDW9SvQ48u3C/JB5fZPLfxXRUy4D?=
 =?us-ascii?Q?R0gxcF6bcJx/l50FGhxOUMlNPGjb//JV47z+3mX36xZCuExOfIKtGqUhVPHQ?=
 =?us-ascii?Q?xwKJ8+PaVxvreuxDdZyTANpHJ2kRLsRwbChd9f9xPw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xO5qLm74PAMV1ScX2MTf3dYm9fE018T9Gshhnq6R+NTih2rB23XTWYbW3dz+?=
 =?us-ascii?Q?on4FKo4F2f9mPAoPz7Y5M/y1haDjPMRkvqqs+7ZHCdicSuw2sFondAYChbRy?=
 =?us-ascii?Q?V/Ep2GHyQLmG206fYOuxj21FHLdZWUAsRjqOwqmS+uqrtHwjuwhQtiOoS8jj?=
 =?us-ascii?Q?LXOEe4e9Ig9C5aMcqjuktgpjpMzVnvzjVwvypw1iPgWcRnUf2SLIbMHHdwtV?=
 =?us-ascii?Q?1VgD9HsJb6qPx9Ck0TmVkqUWAmTGUDtDI9opKZwoRmG945XvUQwrqL6lSXds?=
 =?us-ascii?Q?1dPnRYP+/wdVDed3vAc+PegH6eWBgDblA85h7rHPd3XJ8aIhTJMGow4HjGV4?=
 =?us-ascii?Q?qf2APnG8A0hj7vgzg6yt1zlL1plLx5xnuW9hJNe9OA4J+dJRTKUOfG+sO5Cz?=
 =?us-ascii?Q?TADCPjtRLP8aVrS4zMNkoEypHaWDrT+LUBgXli0jIPG9KaRN7amDPzJe8FoU?=
 =?us-ascii?Q?Qszdv3kHbyejV7gq2xcks6fhLepoUPxvmcwGb1/ySclvd/g2wIPZu/U2BeYE?=
 =?us-ascii?Q?znATTSiR/oCYcfoBbtxp0dKcS+JfauuiAzkKwC0ldOAkOh8jyoA/7lzLb1/8?=
 =?us-ascii?Q?FiH0ikE/WK+7EpumEFZ/ATSXJJWuUtm2CnK9yjxthvDnCfuzkjie/VM85Az7?=
 =?us-ascii?Q?hsW0YmCTDMkTa6Jc7iJi8kJD4egX2fQoZ7NCbYUMfX5Ju3Iiqmjyh5Lg2Hv6?=
 =?us-ascii?Q?6lX532OdmKbEL2cBmqHu5I5GZT6X/tk580ToJ1oPbrm3VkGsbAgP8cHlJ8WH?=
 =?us-ascii?Q?zwG6sIGi1lIOu6Z7XGzo2VcLqhf7MB9BSl7rNW/oTbXaMxHIM7dO+QPGqijO?=
 =?us-ascii?Q?L6X+ywU/sbLfq78dwBxFip3CAg7IUgRNhpACYvOpwPi/3UzaT6GGZ8FsTjtk?=
 =?us-ascii?Q?kZm5NSUiAGfbnTEaj/mFeQHWd6mu6jXaMfHirRy6J4o7oBi66w8o9Bs8x9YL?=
 =?us-ascii?Q?+sQBjwPDDya/OlDPRCYejKwI+7Q3025bidQFUppKqqSyAW8yLDRCHyuTXkPg?=
 =?us-ascii?Q?nF7Me4DsaNW/aUj99BXBwFsUlrWiKnw1m5DSHUvnW8qV8mwrWPXFDk962MYs?=
 =?us-ascii?Q?6evYIvWHfFVEHwx6/zYpKyvGDlz9B4NW5HX4kBrE7GtSp1HyhqxEBkn+yqPl?=
 =?us-ascii?Q?hIjM3s3aNmgEVSMTnCs+Sp0wH3ETey3OFhIq1foMdUpkCKt6kJMRbGplqjQu?=
 =?us-ascii?Q?G6rJ74BCDaWOgjr0dhoSb1QplK538c6aVIgMPqTPmTxM6juqY86U+l9Gsk9g?=
 =?us-ascii?Q?s7hjjo6/JrJULnLyL5aQVC6LHGKtnw1m/k1FCgyHAfxH1GPy0V6WkJfhAQe9?=
 =?us-ascii?Q?+7r+0ZPpiaDc3Y0kSKL0An8qtCZI4xekhYJ+RwPDlT2ATWy/H5Ix0QJJK/6j?=
 =?us-ascii?Q?946/faVnvxgL67T7vVS8G3ZiDDGy7vDYQRHnSe+KeRbN94ubZhgeqkg0WJgv?=
 =?us-ascii?Q?lqH7rJ/RxjTEYsvZ/3+hbjBsbMF3t+bTvnleU8lNNYdVCN5lIv90wLGaU8ks?=
 =?us-ascii?Q?8C3TVcfiVyo8bHlguLsbVmKKE8V7h3JduvOy9bZRifS58sknIs7h+cjkhHwB?=
 =?us-ascii?Q?UGFcB3J+Y34BrUNZkkUteqyxc7gexesGxf3Ymc84?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8d94b1-acb9-4730-9c96-08dc84c6de6b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 18:48:05.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sy8Geok6Ld4AT2dmIWo1J7YX1Kc1FgXHlxfeS6fhzBr/22bNzoG/rNKWxrm6YlO6qar6tpsLXlzNudsNWtOjYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
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

On Mon, Jun 03, 2024 at 02:31:45PM +0530, Himal Prasad Ghimiray wrote:
> - Remove unused bit definitions.
> - Driver uses BIT(0) for waking/sleeping the domain and since the
> registers are masked respective mask bit BIT(16) needs to be set. Use
> defines for these bits and use them in domain initialization.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 ++++---
>  drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
>  2 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index d09b2473259f..441747f2d28a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -487,9 +487,10 @@
>  	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>  
>  #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
> -#define   FORCEWAKE_KERNEL			BIT(0)
> -#define   FORCEWAKE_USER			BIT(1)
> -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
> +
> +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
> +#define   FORCEWAKE_THREAD_XE			BIT(0)

Please keep it as FORCEWAKE_KERNEL since we already know that is
the multi-thread one reserved for kernel/kmd usage (xe, i915, windows,...)

> +#define   FORCEWAKE_THREAD_XE_MASK		BIT(16)

please do not define a bit, but a mask macro.

#define FORCEWAKE_MT_MASK(bit)  BIT(bit + 16)

just to be 100% with spec which says: "Note that mask bit is the data bit
offset + 16"

with that changed:

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


>  
>  #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>  #define MTL_MEDIA_MC6				XE_REG(0x138048)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 9bbe8a5040da..64721c01f30d 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT_MTL,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  	} else {
>  		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>  			    XE_FW_DOMAIN_ID_GT,
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  	}
>  }
>  
> @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_RENDER,
>  			    FORCEWAKE_RENDER,
>  			    FORCEWAKE_ACK_RENDER,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  
>  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>  		if (!(gt->info.engine_mask & BIT(i)))
> @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>  			    FORCEWAKE_MEDIA_VDBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  	}
>  
>  	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
> @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>  			    FORCEWAKE_MEDIA_VEBOX(j),
>  			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  	}
>  
>  	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    XE_FW_DOMAIN_ID_GSC,
>  			    FORCEWAKE_GSC,
>  			    FORCEWAKE_ACK_GSC,
> -			    BIT(0), BIT(16));
> +			    FORCEWAKE_THREAD_XE,
> +			    FORCEWAKE_THREAD_XE_MASK);
>  }
>  
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> -- 
> 2.25.1
> 
