Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5652ECCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 17:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8AF10E2B2;
	Tue,  4 Nov 2025 17:47:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wz0mHtA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCD210E29A
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762278443; x=1793814443;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NMNRLta/ghWYCVNVZCcvs+yI/qFbl6NY9xU/sp4ppBU=;
 b=Wz0mHtA4AIbdfCzyxEZrUA6Tk1TmG273Khe3DiPOi27VpFRZxATXbp+4
 z7Ef+ROba+4wGCSgSlEpUgaZOhEVMWrcrbLSjG2QZJytXfGaI88Bk0LxF
 NLaurtwwLYMltD67A45YObvCSbg36n78xJlwQBUTagkrryKMhkMZ25AEX
 qEh/FusICk6K73thzuiwMQaWUV9qJZO7z4+eFAledqeSGmpU/KH0skXpM
 9Dwe2apjzc171plxiAj4rdyegeBAyOFL6F/IwqiOqkE7iB84mI9Iuoa+O
 zNSG5bAA1KccVMFoaj3KiI4cfrsodawYllSOuPrVePdMfZG7I8cbW2qpF w==;
X-CSE-ConnectionGUID: 6lfts2cVSYSoKbbErrACTw==
X-CSE-MsgGUID: +u7jJg4uSNGMUAKtzkVwtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64298357"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="64298357"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:47:22 -0800
X-CSE-ConnectionGUID: jtg7Fzj4RLuukyjZSzk9ig==
X-CSE-MsgGUID: CyJGfq0GSRGpJVnA8XLDgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="191315676"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 09:47:23 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:47:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 09:47:22 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.56) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 09:47:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVdJ73qVGeiUPhFVoH1BwIfKQhD73Q6kTQtEpB4NYJoYCB1cJ5mYLSZa2jWmExJR5ZOJRJJqoLY5SYXkwbTEoai14/Ie16K5FK11rTB5fL+s7cyg/6C2BOv7U5A6mxUmPcjEfgxIyLRzes0DFWmporFo2Ko4xfwdtOYUgtXTrbufiR4dczfTcIjN7BQaangQ0Rdr/A082XmOCKEQ7Cck2s7ofm+HaEE04OEGArnKnYyd8NqWieNbJB3AaJS9nmiZuLT2cU9LzWhPOjTR97gtQeXZbcnWhBddRpQPx78FOsRQHoiKSm29Li+rZtFgm1amq85/pEzoA655b3xAyyjbGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSlLBadhw2GMaiZzh75FPDoGrd0XGKfJIDANwlqanxM=;
 b=L1xUNbuhZggX8C9BBRQH9sLgLIIjZD4lpGgKWJbNA24ALZ6pp65pwAPit2ldMmdloD8RDzTDkWqxouPJ4h3boPeOWTgDGV5xlHCfG+SP4sx+IqYiUpoLKyuMPPXLDwoBMFnJxOrPR+kqJHAHdIh/Dsh3UxJCOMf7feDFr9pN9YtHMCx9UouC0LUIjNzuh3hQx7FBLipOYlHMmR2GoBZYY3C7sAFM9SijrSQwjCY2cpOG9UUD/A5UuIHaRBbo/fKHpBDeFp3h3N9xDR49vQI+VRewbA/gIXo4j7y0S9ZqiOZG/9SAyDkbrVZ8JYmWSNQg+iqr07NfK8MuEJAdG5pxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 17:47:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 17:47:13 +0000
Date: Tue, 4 Nov 2025 09:47:10 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v8 4/4] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aQo8Hsb068v0jQNf@lstrano-desk.jf.intel.com>
References: <20251030122357.128825-1-raag.jadav@intel.com>
 <20251030122357.128825-5-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251030122357.128825-5-raag.jadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0152.namprd04.prod.outlook.com
 (2603:10b6:303:85::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9e679e-8553-4545-cf2d-08de1bca2fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4tN3E1AqS7iW1v+1CDKNXFbsqrORTwJs8BxfciYG+CyTNrK08p8L6bcbwbL1?=
 =?us-ascii?Q?GlV72IScXWacKTRtNV8Nl890PhcXJbqzH7cBt3/1Do131LMqIjNh/1lKGo/p?=
 =?us-ascii?Q?Cg7zhs7FEwSzTy3GA9LLHxLZ+4OSuykzu8vjpNVMPagbkPDzgb34RcBwChsq?=
 =?us-ascii?Q?pLQb6rX05CHoatyFExCvQ7du/n+/ezH6k2x7cub2GsXsM0WFudAXQNOnh6IB?=
 =?us-ascii?Q?D4ALYO2ikTTAG7n50r1kyk7OScVAaSO2j8ESW2cdLrVl/x0KEB0lqCWRKda1?=
 =?us-ascii?Q?ADY+pFl8ro5VOWaxDcQ6B9s1Df1E4YvkT059o1wH/q8cE84/1u4tx0yG8pHN?=
 =?us-ascii?Q?P4cl8Y/q706QgODxvYrlcQgploP6T5sAmoa/rD8R3UF/DboMe7pK2Mw3txWZ?=
 =?us-ascii?Q?1dgJwniupzNlA0Hf+Es2Pt32AuUqVZPIA6Fy83i2VHxiim1wj9zmxamQr/tx?=
 =?us-ascii?Q?qF7NQygTsiobpTEPExZlvGxkqMQVch4gouoSRqdRAROcQtbDNPDxX+0MM+m6?=
 =?us-ascii?Q?oTYLFIv+m8pBu6E5AV3R1xLhF0bBLKjfPHzZBFHVNTaJbj7HGSLam0AZm7Dx?=
 =?us-ascii?Q?XX/QBazFO26F8d8f4tJAHpI0Y0YQ5n+LoKRt0PErHIzbd5u3QroJmfwyIdpP?=
 =?us-ascii?Q?GJklos55VEnPxQUSk7Nw6pYs57cFFvVtOgNAUlAXumPtpFYO5ZuLKQbVvc80?=
 =?us-ascii?Q?2bVcv1jZU3oCE7oyllHVdipJaVR5w3lEVScrVOkDZ5maY4xg1yry2bgfKqf/?=
 =?us-ascii?Q?DfH7jjamZRmU05Q7eLQaHN+F2p783rgV1/Bcl95pAM6jTEz/wrcJJP9oXdno?=
 =?us-ascii?Q?5IaIrnPOf8i0aKbWDJxdKYK9e1rLY+73CKMZ5YihEpbwzi1agafUqXwl61nw?=
 =?us-ascii?Q?Xuv99M3NBh7FrHWh/rD35hg/O+5efL+FZqX/fiMjDiyzy/ShBcQMpntHFAjH?=
 =?us-ascii?Q?Wx4eGOQKSLZEw2A9aILzKNrSRjFhE4DcBK2YTnVajoXP5fxcXaisRfzo2lRo?=
 =?us-ascii?Q?38igsbiVi6Zs9B9xC84BGfSb2z4sA4sbvdgE4eP1Al+/rmiKKh6YoLHlPE7p?=
 =?us-ascii?Q?Z6FTkAu8FzSUwhaopo5/ZfIPP90RFqWl6NK5cN4ZJl0aOv8UR9IbB/SncBWt?=
 =?us-ascii?Q?qY4bnL0AdVTXELxBTQqcCURYo9jQxubO0Zj+Exog+76Yz1nQfwifBd04yLxR?=
 =?us-ascii?Q?qbUf0qvJaPdyvn0N6TVW4nab9irjnWU6BsYpP67HABbaXIg28W//ZiOzsNkX?=
 =?us-ascii?Q?Hr9wFsqbfPZSmm9nSt+PdYEaPSeglyxenv7AqsImqS86n48FfwbWKAmXXqjz?=
 =?us-ascii?Q?gHMVsKws7QJDCEAz7zev0jFGhLM07IDk4BqAns0pXP7E5UwJpsdt3POiP9KV?=
 =?us-ascii?Q?Mx/oSSukS91WLGMaArDL8mnpyAsgw/DlDTVY1xSWSh+CQr8DLS1jdq4JBaOM?=
 =?us-ascii?Q?FEbBExrRvzfZDMZqFR5FOYXS2Xg2iAjT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UnOK3IayPVnOL2Ecd9ZxpX6PuP/VuW0vYYR8ioJPp/vJ9anTxYNGUZHhi6ce?=
 =?us-ascii?Q?/ypwPryPyF/4yqgpDaB2yQlwbUGVkhe6PZ3QttRJPMEG8bmXgh061l3aPElC?=
 =?us-ascii?Q?JvqGE4lAftBCKI4lkyJyDXQg6/zztUfQ68nhDxokbxzlt+Re1iZ7J/4akGv/?=
 =?us-ascii?Q?7fKEXaOl8sMzuXRUL+R6TDDMdBaG819o2ok7OfkZG9Jw6GsF2SSUbpS5qxt8?=
 =?us-ascii?Q?sxOeGRMcmZKxh8BLb7J89cLV98PpB3FB8rB+2PfmNMvRdjgVte+xvopVXcND?=
 =?us-ascii?Q?NADoj8NTviXP/q3akuATDQAy+b5Jta7fZOuOKiyX7dBSqUxQ2EeQSpZ7z8/2?=
 =?us-ascii?Q?FigboDYQQMqvhKXQoPFGQ070ttuxnbMapbMZXhp/Zk5/L2W7vH4Uzh/E5gDm?=
 =?us-ascii?Q?dCv/QDWqhaoVPdNQt4/xN/WAGU0UOeKzCQu/GvAAtYkV7sCOvM4q3zK6gOoj?=
 =?us-ascii?Q?KHXZWUOMjb8LyBeoxpq7gn9sLHZFwk9R/75dQiisPvu4vXbeovnhT5/WneRH?=
 =?us-ascii?Q?DvB5phe0N6Po4jHqTkKdIQMoQdMg+OMdDerlMkxKjJ9d9iOni/vVm9TVKwUf?=
 =?us-ascii?Q?2rtQmEmynKxQL61Iolgcmj55bLqf3MalH4V7FmktFTZCYcvQefK6TbapGBkZ?=
 =?us-ascii?Q?KLhOoDengiYWAcQoFAIYFE8zSF4b8TNYlL9+cSoZ+EuaFFQ+LxfYi9RQCm9i?=
 =?us-ascii?Q?K4g42xAkFZUYB+ZCZg5nqfMky5RbSeVvU7vPKbuVmL7t75spLqL8JzX+Ww2O?=
 =?us-ascii?Q?9+ptlt5H0ZEXmlsIUDyLMU/g3dv26HwP9F0VpVrTi/iAI0GjJQhw4VrQU7XW?=
 =?us-ascii?Q?Y4X7wwejlsoV3H+fu4T246cYTfTrn+tW+tFBHZWzoEY+67hTDa3F0Xk+t7UQ?=
 =?us-ascii?Q?7NKFAuWUHCYWml1ytLUOJVglEWZ6P37aywG2bfCXIHK2BKxjpPXnQqy/OHyP?=
 =?us-ascii?Q?tfjdD9rHauyhas4QPJBCM/lXnXS3L7sWQdzzhEYCaORybjrGKOfnbUdickuK?=
 =?us-ascii?Q?+ZbTIGoQT7pP3tpgja2mMjWJfnSQ6EUMRaiXYQ8PMK0Nnko2ulz3DHJgdiYz?=
 =?us-ascii?Q?FSdKuACk46OAT/Pe3QyEDVhSHsMwH5dc1eBWklXYfkBLk+HP4zhlgGEdqLRl?=
 =?us-ascii?Q?IWEwGXvJqIMtHTmJPEji5hQmEnI/+LOJb7HoAseATgRVTno1zzK0O5RrmwtM?=
 =?us-ascii?Q?iQIyWLyw4wkJv5RdpbyQB00fp2p4RfKPQ23ZoEJ/SpbcxjWuNhpZrwKY6YlM?=
 =?us-ascii?Q?1RvJC3xhh6irQwq99GBGckmlT99BzR4hnnZ2MrQsdzgl+PKVdSyyIayZ/K/Y?=
 =?us-ascii?Q?gpuJTfbn1tJHvmJb+xbwPPUEvJLH+DNIAz2iP2HN7CQ4rbQknBMDoZSbXR4j?=
 =?us-ascii?Q?LL6V3dAY0bHAm2T+3VjqEy+SjiHQAc9lJbnN/kAQfdVHx8yU2yVfWZXMFTq/?=
 =?us-ascii?Q?O1Pz9Zw7gJdf1TjAeEnMZGZTYLIMG/iKPrpRebAtmPii6dBx42Xs1ucJ1Wuq?=
 =?us-ascii?Q?s7FvFXbaqmVTKOeLDTjb63vIYQbxuouXOX+EM8JvO+UJg163KGpRtqycqyGq?=
 =?us-ascii?Q?rk/BLAF01epOjRGtlNXue1ykKmWZa1Ui7soj8/KtXvgmla72Iw7IntIt3mdw?=
 =?us-ascii?Q?+Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9e679e-8553-4545-cf2d-08de1bca2fd7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 17:47:13.6625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HV8TZD4SN93raALb1F+GtoLC/UWk119phvEJYoJqfta0Vu2DIdvfyF+IqHGoIiEjYk7AKR6QwAYXTUg3+FO8QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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

On Thu, Oct 30, 2025 at 05:53:57PM +0530, Raag Jadav wrote:
> If power state is retained between suspend/resume cycle, we don't need
> to perform full GT re-initialization. Introduce runtime helpers for GT
> which greatly reduce suspend/resume delay.
> 
> v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
>     Use runtime naming for guc helpers (Daniele)
> v3: Drop redundant logging, add kernel doc (Michal)
>     Use runtime naming for ct helpers (Michal)
> v4: Fix tags (Rodrigo)
> v5: Include host_l2_vram workaround (Daniele)
>     Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> 
> Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h     |  2 ++
>  drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc.h    |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
>  drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
>  drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.h     |  2 ++
>  9 files changed, 162 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 89808b33d0a8..0c300f8dd588 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -1008,6 +1008,66 @@ int xe_gt_resume(struct xe_gt *gt)
>  	return err;
>  }
>  
> +/**
> + * xe_gt_runtime_suspend() - GT runtime suspend
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_suspend(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime suspending\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_uc_runtime_suspend(&gt->uc);
> +	xe_gt_disable_host_l2_vram(gt);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime suspended\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
> +/**
> + * xe_gt_runtime_resume() - GT runtime resume
> + * @gt: the GT object
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +int xe_gt_runtime_resume(struct xe_gt *gt)
> +{
> +	unsigned int fw_ref;
> +	int err = -ETIMEDOUT;
> +
> +	xe_gt_dbg(gt, "runtime resuming\n");
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> +		goto err_force_wake;
> +
> +	xe_gt_enable_host_l2_vram(gt);
> +	xe_uc_runtime_resume(&gt->uc);
> +
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	xe_gt_dbg(gt, "runtime resumed\n");
> +
> +	return 0;
> +
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> +	return err;
> +}
> +
>  struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>  				     enum xe_engine_class class,
>  				     u16 instance, bool logical)
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 9d710049da45..94969ddd9d88 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -58,6 +58,8 @@ int xe_gt_suspend(struct xe_gt *gt);
>  void xe_gt_shutdown(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
>  void xe_gt_reset_async(struct xe_gt *gt);
> +int xe_gt_runtime_resume(struct xe_gt *gt);
> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>  void xe_gt_sanitize(struct xe_gt *gt);
>  int xe_gt_sanitize_freq(struct xe_gt *gt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index ecc3e091b89e..ee35f1d8c21b 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1607,6 +1607,40 @@ int xe_guc_start(struct xe_guc *guc)
>  	return xe_guc_submit_start(guc);
>  }
>  
> +/**
> + * xe_guc_runtime_suspend() - GuC runtime suspend
> + * @guc: The GuC object
> + *
> + * Stop further runs of submission tasks on given GuC and runtime suspend
> + * GuC CT.
> + */
> +void xe_guc_runtime_suspend(struct xe_guc *guc)
> +{
> +	xe_guc_submit_pause(guc);
> +	xe_guc_submit_disable(guc);
> +	xe_guc_ct_runtime_suspend(&guc->ct);
> +}
> +
> +/**
> + * xe_guc_runtime_resume() - GuC runtime resume
> + * @guc: The GuC object
> + *
> + * Runtime resume GuC CT and allow further runs of submission tasks on
> + * given GuC.
> + */
> +void xe_guc_runtime_resume(struct xe_guc *guc)
> +{
> +	/*
> +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> +	 * directly enable IRQ.
> +	 */
> +	guc_enable_irq(guc);
> +
> +	xe_guc_ct_runtime_resume(&guc->ct);
> +	xe_guc_submit_enable(guc);
> +	xe_guc_submit_unpause(guc);
> +}
> +
>  void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
>  {
>  	struct xe_gt *gt = guc_to_gt(guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index e2d4c5f44ae3..fdb08658d05a 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
>  int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>  int xe_guc_enable_communication(struct xe_guc *guc);
>  int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> +void xe_guc_runtime_suspend(struct xe_guc *guc);
> +void xe_guc_runtime_resume(struct xe_guc *guc);
>  int xe_guc_suspend(struct xe_guc *guc);
>  void xe_guc_notify(struct xe_guc *guc);
>  int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index e68953ef3a00..a7b8d16d4041 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
>  	stop_g2h_handler(ct);
>  }
>  
> +/**
> + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> + * @ct: the &xe_guc_ct
> + *
> + * Set GuC CT to disabled state.
> + */
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> +{
> +	/*
> +	 * Since we're already in runtime suspend path, we shouldn't have pending
> +	 * messages. But if there happen to be any, we'd probably want them to be
> +	 * thrown as errors for further investigation.
> +	 */

What would also be helpful here is an assert the G2H credits are in a
fully idle state too. We can do this in follow up if this has already
merged.

Matt

> +	xe_guc_ct_disable(ct);
> +}
> +
> +/**
> + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT and set it to enabled state.
> + */
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> +{
> +	xe_guc_ct_restart(ct);
> +}
> +
>  static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
>  {
>  	struct guc_ctb *h2g = &ct->ctbs.h2g;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index ca1ce2b3c354..5599939f8fe1 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
>  int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 7b089e6fb63f..56e1351776c0 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>  	}
>  
>  	for_each_gt(gt, xe, id) {
> -		err = xe_gt_suspend(gt);
> +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
>  		if (err)
>  			goto out_resume;
>  	}
> @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  
>  	xe_rpm_lockmap_acquire(xe);
>  
> -	for_each_gt(gt, xe, id)
> -		xe_gt_idle_disable_c6(gt);
> -
>  	if (xe->d3cold.allowed) {
> +		for_each_gt(gt, xe, id)
> +			xe_gt_idle_disable_c6(gt);
> +
>  		err = xe_pcode_ready(xe, true);
>  		if (err)
>  			goto out;
> @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  	xe_irq_resume(xe);
>  
>  	for_each_gt(gt, xe, id)
> -		xe_gt_resume(gt);
> +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>  
>  	xe_display_pm_runtime_resume(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..6a58b33248f5 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>  	return xe_guc_suspend(&uc->guc);
>  }
>  
> +/**
> + * xe_uc_runtime_suspend() - UC runtime suspend
> + * @uc: the UC object
> + *
> + * Runtime suspend all UCs.
> + */
> +void xe_uc_runtime_suspend(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_suspend(&uc->guc);
> +}
> +
> +/**
> + * xe_uc_runtime_resume() - UC runtime resume
> + * @uc: the UC object
> + *
> + * Runtime resume all UCs.
> + */
> +void xe_uc_runtime_resume(struct xe_uc *uc)
> +{
> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> +		return;
> +
> +	xe_guc_runtime_resume(&uc->guc);
> +}
> +
>  /**
>   * xe_uc_declare_wedged() - Declare UC wedged
>   * @uc: the UC object
> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> index 21c9306098cf..5398da1a8097 100644
> --- a/drivers/gpu/drm/xe/xe_uc.h
> +++ b/drivers/gpu/drm/xe/xe_uc.h
> @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>  int xe_uc_load_hw(struct xe_uc *uc);
>  void xe_uc_gucrc_disable(struct xe_uc *uc);
>  int xe_uc_reset_prepare(struct xe_uc *uc);
> +void xe_uc_runtime_resume(struct xe_uc *uc);
> +void xe_uc_runtime_suspend(struct xe_uc *uc);
>  void xe_uc_stop_prepare(struct xe_uc *uc);
>  void xe_uc_stop(struct xe_uc *uc);
>  int xe_uc_start(struct xe_uc *uc);
> -- 
> 2.34.1
> 
