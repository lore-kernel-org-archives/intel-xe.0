Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD68CAC598
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 19:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9FB10E58A;
	Wed, 17 Sep 2025 19:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SouZB4dx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63D610E58A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 19:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758138806; x=1789674806;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UqOhrVV1Er68Nq5521PX0ku4egdJfbfD1xmWb/CvuNc=;
 b=SouZB4dxaAakZBSJmE4AWVUikybhcurlh/YFJCZ4qVIp6IFr+i7SzXKK
 HV1MocprFv+2vm+Ka4M+JWjbmHSTxLlX78c4Xvo1A3LfK6RJgGc/zMGAy
 9BnJBG7ZvCUAzMWu80nfylvUtFhZC6sL80bbFb3U3QId6F6Yhg7qbMdAp
 oYXv73ypS6XYLSOSDY+FzEybR6a1xV5p4S0RF9FYJjiTsvpBoI2jXYB6b
 TY1evZOJyCGyvSqF9HpYS8fYIfzd0rhwUFw+DihwGpwXmeIKH6Un9Rtx+
 w++VoXfjFHijtBgSGEKQL8Y8dK8cwJeo/6f5965ozFiw0t1eDFVcYMVCf Q==;
X-CSE-ConnectionGUID: mTxx38qVR/md0jO8/q6ieg==
X-CSE-MsgGUID: NY5h3/13TMuyUk8fo7MnVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60406022"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60406022"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:53:26 -0700
X-CSE-ConnectionGUID: uZxzL/mlSni84TOn24qklQ==
X-CSE-MsgGUID: eMOmmJ3KTiO1j1BaWNaDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="180611071"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 12:53:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:53:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 12:53:25 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 12:53:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOmpwpOac1TiyxsoxolFPtHK+NbXpbKXVWZlMkEdUS+iBwMGygdDwniuj7tkI3Lj6+jiEsfutrFfnABo+I89xOdxqm5mdHY0CuDcyxhBLpxDEvjRSUpne4s+duuxry0+zLWB3DZJtKOBFQtQQGgiheztreIYxsmo30bdYNhUv3FghYLSLJILszKXWLT0hKXSLB0pjDAsi3lVs2xIQlLzKIarXUNNUn/OrWa5CA7Ecnv4Yl94HsWROBGbiEOEVvfMpO7d6RuPlkz9yPGWrgzpJEGLEtOS4gl0qYgeyyQIUoiwXnKz/EAR7msh2EQ4GIUEqXATbhq6Re9paWKd4tFKtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8oYid/ceUoBAjrLCWaoj8p/gLha7ws4f0bH2ZTG6RY=;
 b=fGBB4l8/Uc1xkUftN30jcAlhJMY2hvVRlWHiiY7j1OpyTXdbajQKW0ZgxPX57goBpMLtwPhhng5o6cbZyed8+KYXfiwS+/vt7A0aSv+t4OZRL1yrt4SqyIf3c5RcZUUVCwNmGfoMmfu+kASrcixzT+8cR643ABSgcz0/3miA19RQVd3oSi+dXjDfa5W3P+FCqTybh+Wl+aSKpSRlzWXIr2lALx1vBMt2vmzP68EfyDu+CUQXU5z2D7RCXtt3xEjDagNNIkkVMs6vU6SL67XzImCr14nGL/4k4p+wqZGpkWk28Aqtmf9A1h89ecaicYCt0wpdOXMbr8IDqdJGWIpLTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB8166.namprd11.prod.outlook.com (2603:10b6:610:182::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Wed, 17 Sep
 2025 19:53:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 19:53:22 +0000
Date: Wed, 17 Sep 2025 15:53:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v5 6/7] drm/xe/lrc: Allow to add user commands mid
 context switch
Message-ID: <aMsRqP6Jp-n1uOIi@intel.com>
References: <20250916-wa-bb-cmds-v5-0-306bddbc15da@intel.com>
 <20250916-wa-bb-cmds-v5-6-306bddbc15da@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250916-wa-bb-cmds-v5-6-306bddbc15da@intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB8166:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8d3584-e541-41bb-ad81-08ddf623db63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oAZR0KijF4eu2QI8ihXMMlj+5e2+0zC+U0gAa6Z6ZPFoJrKiVk2NY07hxOtF?=
 =?us-ascii?Q?yHxknFAnU4cJs3fEBuAabTSOmw94L1Z6WCkpAxz0qGHBVmDATFMfSQzlwatc?=
 =?us-ascii?Q?j1sajcpJJVk0G04J2t2JaBT3KCGn0EowMbtxLu6fnhqjq9Ef6haQ1FQBFB+S?=
 =?us-ascii?Q?ae9em+RODPYywJVNb/xtD+VWH696cOd1HVU62J2IAuwEfmECaojEexGgyCFP?=
 =?us-ascii?Q?jvvJCRNJTGdHeW+CyWDWs2OZE8lNsyEQd66vcDL5uaLrc76JVBNgMpfM7TW7?=
 =?us-ascii?Q?yFGxUpsrQKuycEfQAHH3ByVafKXeKWTA0v1paA/Y/zNZZ9UAtthib72Ubs5d?=
 =?us-ascii?Q?Ye18uEBtcIqxxiMPaG5ZYcz0ykHOpuUEK1VrGT/89asvdSMcqutenmq6beOl?=
 =?us-ascii?Q?U5yrjWBc9Q2jeaT1GJ4DrJEfYtBn4psgPtU8ZSQGepbRxzcTqH5rXZrvfHGC?=
 =?us-ascii?Q?10u9kpBxvv2tqLanRb0YUHxX870lfAcKPIckq1rqtKckCScyRFrppCfst5rr?=
 =?us-ascii?Q?YQ7q/cVKyKdz8mqwWPD2iHqc/bpD+KS80AyYWDLlDCUGPZLEjC73YXqud/cR?=
 =?us-ascii?Q?jPsUNUzY3DGviYz/meDEEyySAoQ7Dy8/SXg9Vsu2Np4cObpKLA/uv0Lj1+vJ?=
 =?us-ascii?Q?e2bgzXCIDgPH4xHJpRAG+Fctj0LZfoiTES20avSGV8USnsaH41qusVmqrFj7?=
 =?us-ascii?Q?/s63MePK+y3ZQOpQx8B+KPwuxD8w7f3wG3lmISTbUrHm5l++IgXS30uV0zgO?=
 =?us-ascii?Q?ET+AVUBu72neVd+EtzejjvnTkqOdiTL/HmsLlv6d83Xmi6V4ICq6K5rc2DYg?=
 =?us-ascii?Q?QgAyJZFlgg7o2eo5MG972oXNwlEGSdJ+5FHMU129P9Ua0nrMQ6QaP7DvRDY+?=
 =?us-ascii?Q?C9beWzAgrWhM32PMoCspf9GJ13/Tumb7zULBxIObR/axqxaSPOErnzijTEa/?=
 =?us-ascii?Q?a/vi7uUdu97KYnnT5GTzUAlq86mLe3131mpowLrzNVl/KQ3UU6FJShoa3Ywm?=
 =?us-ascii?Q?nK1iKgBCUYgF46c5PL6aI5f+1zTdcTK1jiQKygqbgVpcm51WgiIqonjShpOB?=
 =?us-ascii?Q?zCYwueeYjEoUjWVVytbhFc5WlL/2vYNoAxQ+3Uc0sKoaGK1Ds2kG7TJEqP0m?=
 =?us-ascii?Q?6pPiQtdfi1QjR4XVTvOPqUxRj6hHOknE07k+1uMFPs9d1oIpKz1gSXDogAXu?=
 =?us-ascii?Q?OzO0OeWaDHMt5X2kD+98C91ysoeLGYOoROblgVp1oemxOubmj9YwjFF8vTUW?=
 =?us-ascii?Q?0/tgLHENB47w23cstHSA4NlwJpRHw9pjFhjP4Qt9BajO/GL6eR4xgdRjl2UZ?=
 =?us-ascii?Q?ZpAvUl4l6I29wqIgqm+1VjKnKeGJ12VZ+1VT+pe7LpVk0pEx+vVbuLiSm5Na?=
 =?us-ascii?Q?W3K7ay4GliyU9OxaVsrh2eAU9jJjTy7IUkuv89QpeITra1Pxn3X5euA5h4u+?=
 =?us-ascii?Q?hHsJLhiGPxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zgxKbFYKJnECIR6B5RvPbYOUd/deGcQVW5xo/wUbaN+0MW2cmWA0itN0DF/9?=
 =?us-ascii?Q?JItRK8tKtbHEg4w0NmxBvuGFQf3p80j5TjQwPNZVunvsGbbQ8sXRDuSgdIoj?=
 =?us-ascii?Q?QZk0marwAsxr7WWywGs6phQK6cAJaXKz9OPxOuXyBiEB1SfWLAo5afLz0JG1?=
 =?us-ascii?Q?jlaM8S31n71Gr+ADi1eUAcSB1rIk7b4TndvQ9Fz2bDJiIPJKaWE08/UClFiP?=
 =?us-ascii?Q?pLCfqvAQ7yoB9m6v1H0Gx2ghM7aJpKW/+rclWpdtBabKmsPH+2TWNhTVEI72?=
 =?us-ascii?Q?UnQrDxAg6Wg6C1vR/F4kLGR1SZ4x70qd4iVFCKPs6HiupfIdIqG6aR5P+a3x?=
 =?us-ascii?Q?9I9mWLZjBFLLXbH/RXh6kNpA+8Kd2+6xqch0edm+s/K997+auvrPi61c8JYt?=
 =?us-ascii?Q?Qx1mlfst5xgcXc0yfIiIDwqMHZKNBbi2e64LcRpIkgFTtaseEmLJSCOEJxot?=
 =?us-ascii?Q?BTx6zMIS4xuL3oOrMPFwMSNZN2PJv7auF/+8lOH4WUwYoJTsiRkiLrphKxRs?=
 =?us-ascii?Q?ZQUaQ9bap3gjDzIaq5eviGO+F7nRB/UC1bFilRo1VWzPFVaxF66u2ARYJ6+a?=
 =?us-ascii?Q?/vruA8bYt9f4aIe6vh6nTSb8QVnqwB7RTtCys5aeFdcQdTI2Q2VLADLsPDaP?=
 =?us-ascii?Q?RXHfEaBs1CrW/BYZu9KtZy2G1dLaveWdnnZLmQ7DkSrweMJLOWkEgfkGXCkq?=
 =?us-ascii?Q?tMNl1kx1NhJOct5JBzZObQ634ZZs6C2Ty4CPwUhNo55x76JQL9WavAvSwqgC?=
 =?us-ascii?Q?T74Y4v0A3mJ/ycKOTzvA49jmFRQ3TpkSTDngZ6v7ODfOl5PG2eJbCvKH0/5K?=
 =?us-ascii?Q?fJyIyB3PtHGovyJm6oEZHlptc6LXNKd85aXBpmhaizHSISj06g3ReF+DTXvm?=
 =?us-ascii?Q?7zYa9LZR59Nnecl3gYUuET0kajXHv0IiFgZB50t9eBYysASUkeWdFeUkDjay?=
 =?us-ascii?Q?cCSsr2/WiWXhI3b9VTzi2P0/OUQiwAxqc9yzHHiKSq/YdhlLrW6qdHuGDA5W?=
 =?us-ascii?Q?4+myGmrjSCTXQCf8yhfZPfWsWLr6jLAoT/scx3ifOC4YXbuMv08VZIoS6x/5?=
 =?us-ascii?Q?2ElV8gCRKLmhk4IO2lY6qUsJhwGLwHgSGvajDpeRHd0m+h3kWblKcPHNQRW1?=
 =?us-ascii?Q?7JiVeHTOFWFdbkY86Cwb5jh4Tvqsv/5+dLr2A78bvtug5NqUYxePDyU8bXDS?=
 =?us-ascii?Q?rdONyHKulrpFkbukX/vbE4Ac+Hn4sLidlOCDUIKtpsqR8HuvAKwL+fyWByj2?=
 =?us-ascii?Q?g82qbgbm4LvUXKD1hi/JdYPBRvtxSoe07Wp5eLYsmMFuzrvllo3D9KxSZjBF?=
 =?us-ascii?Q?eiyeetmRAqauqynNn3Knr10YfrAf+RhAQdXlEKVEB83pOkm/L30xXNpbn0YP?=
 =?us-ascii?Q?XPNCScOCOCGYQ3QJihbWX+xL2gGnCPdZLew4u4wGlVV6QcwDSvBetfEEtzIm?=
 =?us-ascii?Q?50+syyqJ/9r/vhfmeNELqLAH1t1kzCJUqVzPrMXNIh5qdOpzQ48+M8Z/0ZvW?=
 =?us-ascii?Q?CmPMHZdOxqFoKE69cvUiH9FCpSSAa3f8sY3Bv3gvgFWFDWja8kTFj4+2hH6U?=
 =?us-ascii?Q?rPLzKoZWumGMcySuqdYiw6UpzPBUMuVHlZqkNqSLyv6ymv4k6zQCCcn2iJGV?=
 =?us-ascii?Q?cA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8d3584-e541-41bb-ad81-08ddf623db63
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 19:53:22.4492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bmXhMbcUExE04/TxAnkJ74UgZjKkHlh/5F/y9JmTiRqNIqUO5uWJDyAPJ6UmFYuKVJHK8Cu/ucrslPQENNTf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8166
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

On Tue, Sep 16, 2025 at 02:15:43PM -0700, Lucas De Marchi wrote:
> Like done for post-context-restore commands, allow to add commands from
> configfs in the middle of context restore. Since currently the indirect
> ctx hardcodes the offset to CTX_INDIRECT_CTX_OFFSET_DEFAULT, this is
> executed in the very beginning of engine context restore.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_configfs.c | 15 +++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_lrc.c      | 37 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 9a30dc958c35c..90bc5a4b5da71 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -897,6 +897,21 @@ bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> +/**
> + * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
> + * @pdev: pci device
> + * @class: hw engine class
> + * @cs: pointer to the bb to use - only valid during probe
> + *
> + * Return: Number of dwords used in the mid_ctx_restore setting in configfs
> + */
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
> +				       enum xe_engine_class class,
> +				       const u32 **cs)
> +{
> +	return 0;
> +}
> +
>  /**
>   * xe_configfs_get_ctx_restore_post_bb - get configfs ctx_restore_post_bb setting
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index eff2645b5f593..c61e0e47ed94c 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -19,6 +19,8 @@ void xe_configfs_check_device(struct pci_dev *pdev);
>  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
> +u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +				       const u32 **cs);
>  u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  					const u32 **cs);
>  #else
> @@ -28,6 +30,8 @@ static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
> +static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
> +						     const u32 **cs) { return 0; }
>  static inline u32 xe_configfs_get_ctx_restore_post_bb(struct pci_dev *pdev, enum xe_engine_class,
>  						      const u32 **cs) { return 0; }
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 0ab99c210d882..47e9df7750725 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -77,11 +77,17 @@ lrc_to_xe(struct xe_lrc *lrc)
>  static bool
>  gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
>  {
> +	struct xe_device *xe = gt_to_xe(gt);
> +
>  	if (XE_GT_WA(gt, 16010904313) &&
>  	    (class == XE_ENGINE_CLASS_RENDER ||
>  	     class == XE_ENGINE_CLASS_COMPUTE))
>  		return true;
>  
> +	if (xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
> +					       class, NULL))
> +		return true;
> +
>  	return false;
>  }
>  
> @@ -1133,6 +1139,35 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>  	return cmd - batch;
>  }
>  
> +static ssize_t setup_configfs_mid_ctx_restore_bb(struct xe_lrc *lrc,
> +						 struct xe_hw_engine *hwe,
> +						 u32 *batch, size_t max_len)
> +{
> +	struct xe_device *xe = gt_to_xe(lrc->gt);
> +	const u32 *user_batch;
> +	u32 *cmd = batch;
> +	u32 count;
> +
> +	count = xe_configfs_get_ctx_restore_mid_bb(to_pci_dev(xe->drm.dev),
> +						   hwe->class, &user_batch);
> +	if (!count)
> +		return 0;
> +
> +	if (count > max_len)
> +		return -ENOSPC;
> +
> +	/*
> +	 * This should be used only for tests and validation. Taint the kernel
> +	 * as anything could be submitted directly in context switches
> +	 */
> +	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
> +
> +	memcpy(cmd, user_batch, count * sizeof(u32));
> +	cmd += count;
> +
> +	return cmd - batch;
> +}
> +
>  static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
>  					       struct xe_hw_engine *hwe,
>  					       u32 *batch, size_t max_len)
> @@ -1283,8 +1318,10 @@ setup_indirect_ctx(struct xe_lrc *lrc, struct xe_hw_engine *hwe)
>  {
>  	static const struct bo_setup rcs_funcs[] = {
>  		{ .setup = setup_timestamp_wa },
> +		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	static const struct bo_setup xcs_funcs[] = {
> +		{ .setup = setup_configfs_mid_ctx_restore_bb },
>  	};
>  	struct bo_setup_state state = {
>  		.lrc = lrc,
> 
> -- 
> 2.50.1
> 
