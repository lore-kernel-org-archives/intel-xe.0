Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1259F513E4
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 22:10:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A8710E2E2;
	Thu,  5 Mar 2026 22:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vyfbe6HD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EA6D10E2E2
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 22:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772748600; x=1804284600;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iDKaM1UXiUGzrvSzBUhEdhHAOrGqt016Ei7MkszDtCg=;
 b=Vyfbe6HDBLPfhpdwC4GtnSGsZX0MIKpQmUrRqK6h+uuicvxPEz6zJO3L
 N42DcvSN/hCqOHzs4Caxv112FIm7ZiQoZAvGxwHQPgmeAKrq5IzYqtAmP
 oTpPbIj8K3pw4dnZgkLDp+h/E5LRys1+enz0tNPV4gLCuasi54Q0pqIZg
 FeGJbTuPi0NPcuB06TZPYyF0mK7hOvHo/RD6JEuFH8cLgcWtD2CZqr9F+
 thyTD6XA0YYhiN8YAa5Y6o10lhrFndzQmdquoj71cXtLbkikpeliU2pXF
 X97V1LwozGx+5FWDWZRdcqJXoHspe0pMxr2IOMbq4tIZvSx6QSxL31guQ Q==;
X-CSE-ConnectionGUID: jYT+/slGRyiP6ZECdyhS2A==
X-CSE-MsgGUID: SeLE230CR76Bg9/BgbYHZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73924829"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73924829"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:09:59 -0800
X-CSE-ConnectionGUID: CCeBxVM7QRCeHgkZzvrvrg==
X-CSE-MsgGUID: O8DyRZJ0QTSvnhCqX5MfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="217057295"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 14:09:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:09:59 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 14:09:59 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 14:09:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqLpiwXW12XKGPpOlYUj0FXWI7zCKIC6vSts6Y9+s7sWcnvmteP26GlDkI0TZhMs6Dz5iNlkIX8COAM+MoEj9LWL+zEXi1CIM3o3WjT6BbDtybwP4q/u0wIJJhM8D6WFHWCFzVeTqd5GOvD88Enwl66wmzR/fOEUwP07xR7uKEv9oD/3BJ476WNN5jbhqLu3v4Sc9AoFMilyO5aknRpaxWL/1CAV2EWP9H0Xkx8Ju1P5n8uSkEzy6yGdnplQAWGmy0qPbSXUKMavC99MdpI85V0PZk5TeAE3xfLIqfJKh4/DOqwDpA3hFCTeQzJEr7AwwfSdCRPkTHk0LEi/1caB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC8ZDGN7wr/xQ7pFCCdeuwolqDXkKe7MLDYPB0HWuS0=;
 b=UFSP0o7UDxh1Paq/XuA+rsgCGLtJdS3qZy/uHDdOvAVPexlwjJ0I0cYIfhBBdVR5ciOt7vgKh6fXu+bMp9rudtQ9oPTJjTZeHZXWqAzm1M506d5Wgz/u00XS+raFU7UWzaL1Y/V3J+B5ILmw09BRmCFRnHj8s9uDb8Erj6Q0zmECNue1HmqPeLEWn/p9dWXeXAMUQlI9WMFGmzrPbXY5rSWgrWiVofzD48SbaDncPRl2B3CXQ0P3ug5tfzaIWszjnJlRyZagRc6EUSWxZhQ1z64hZ/n3O1Y95e6PGQaYo2ACFyKLiinC2XVzbWCbN2NPE3UlfonCZNAOt1sVy8xAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:09:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:09:55 +0000
Date: Thu, 5 Mar 2026 14:09:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/7] drm/xe: Drop unused IS_PLATFORM_STEP() and
 IS_SUBPLATFORM_STEP()
Message-ID: <20260305220953.GQ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-2-5020d5289dea@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260305-extra-nvl-p-enabling-patches-v1-2-5020d5289dea@intel.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 66838d29-9dba-4494-8694-08de7b03eec6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: q7nnNVcAls7ct6GXO2wzezjMx3b7VAe2QU/6bClOdLYnRL0qPOVxd/Tx0d3ZE5A0h3hEj4cRPirjAAlhZDJIm50lezh0YAK0XeAp/yXr5MmaPFcnCI2pN4DFxFI+xcahdYK/ppLo4WWbzivAr5v/XWtsHud+KHi8HGTIz63yVbPQbkSVy7GbjmZPhVf2yCHEahwzMdwRGMJAhqL3R5Wben1PPIVCf0YyJpvpkqbANbSVDf2kVEd/5RVcJRIcIAo8sr57He263TTgakuagNbbLnkA9GBbqfouMz+uV1bAspXoWYcVSR5fmvQXgVgEKVzOxL2EL+iST/1VHlgsa8zrxO+Le+IiScQi03IIPmumeD6mgl8qHp2AsWfNK7ECYRQzWlxgo1K4vQCJtwtl2X2fwPBlF7NpyaBhYByt/hhXDF2EUqm23vawg9EsQqnPxDIuf7EKWmQhDJLhnwmuN+8jkGheHAkWiKQEA/8xVNQvqcU1XL7RaAnLOt32BdIHuc013/3Z3k0si2tpJefuPVG6tKH7grDSHuYq95wJfZxmrMblYiHUvH5mdlklaiB0Vjt5tC1c7OLdx8N7sR+Cp1DIIflgpcx0PViV6xvikbE6uqDVy327yPMkJ+OUq2I/rOV5G7hlviFgNdoxZVfMAe7IveNQLf+XPNOCvFRXLVoJOjb8Ivlm0eHK+tqUaibVnjvFA7JdcjlxbgCbK1Xp/9KPECwuI7N+1PScQm6kPy1mPyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l/hT9CCPnTgXS2atNv91zgp10cuK779N3ax2U5qSkGBdgncdCFJqLDpgdsmX?=
 =?us-ascii?Q?CeuQPLpa4ixo8aKRLrj0fmhtuOo5gXic4cA+g4tlkLdyq38vb6Kw4si9eyPk?=
 =?us-ascii?Q?6V/U+5YkH+jwezEbi1qAUUVn0BCqtNch8pEtt2FiVp4yxE7GE/dr7/wgusip?=
 =?us-ascii?Q?F63W6o2ANXGulxLSgQsPofsNRKlQyZOW32JAxiRzc4Qjw9n2F0IkvEyYmARG?=
 =?us-ascii?Q?aSj+G2vanCrbyiny/s8+EaJKN80QXluQ3ya2JNO57U1qP+PM6FRvJhVecQv6?=
 =?us-ascii?Q?hK33F5qZyf/Vbg3YjDupg7vZV0f+0z97Joym6MkTTiCtUGhX+HjfvMPulM5L?=
 =?us-ascii?Q?UEtoX8iECueTITCbANFYAe5U55fZQnH7KyxCi9tY4drsB3r0LfkGmU8Y8U6p?=
 =?us-ascii?Q?EJslXLMMJ3n6HdswnsrNqyj6feZ0EuBpweMYPQSo01C8lPYDtgwfyB/YZTOA?=
 =?us-ascii?Q?0pS2eRP1IdSMvtioaj0/omECYNZtwi1OqFmOkCf6uoJdKKrk3HeEBdOIuCRy?=
 =?us-ascii?Q?afnd2rHQ0Ob2QKhWqELm9aN6rcmDT+MJvktau/3ZFb37UUdHJvlmWDnCCE0F?=
 =?us-ascii?Q?DhXGvyh3tQNzjadiq2BQoVsf/84PCy287JQOwnv2exRfastqUj0vY5wF/96w?=
 =?us-ascii?Q?a42Ogi+81PIs5OTbm+4FIyCyyGZ1J4ShcyRQFXJd45bnNslw3fTXNHI5OG9J?=
 =?us-ascii?Q?6BTDo1OvTKrl5/yk+X1rhZcaEkQ1OYiSJEwCQ5gDEa2izccvjUrWgoOjXBRJ?=
 =?us-ascii?Q?tGV3eNXUrxGiR9jy/TxjbCp3ww2cSN2IAsbjEElxU18wOj9nlR/AWKGfHVdk?=
 =?us-ascii?Q?xR9CvM0ROO4DHrCF/tkSLWeb7HkM28hdibk481SYZG1OWxr/h5ECf6OVEUMe?=
 =?us-ascii?Q?OBg6AZwm1jOgOXK6ar0l+KOCIFcFoPUcfSzH+tr4V470NdZtVnbUnMpaAE0Q?=
 =?us-ascii?Q?sA51gJuoo03CfkG+exqf7pn4liLm9arfoMamy2T5rl0qEY9T1WYchy5dQS4b?=
 =?us-ascii?Q?8LQqDmpD4K7sexDYS7iOnLduotXMfE/yWFB+ds93azGEct6jKGrYbA8DG+3k?=
 =?us-ascii?Q?ChFGh/QaRBDk3L+cxLUwfZAOP27A060o3Bc3v0IyVJ+/bYoLs9qMB/cDo95C?=
 =?us-ascii?Q?Q4JPHcDWWtNTISvPtzOjD/Zqb7bHItKY5/q7pTj51RjmPknD4PcrwWe2xjy0?=
 =?us-ascii?Q?acZi0mGEktDXHo3w9Bcv/g1jR1f5ZdRm5j5fqrGlHHss6MiT9t93PfAqg1T8?=
 =?us-ascii?Q?UHRTJDto9B5Gya3CO9/j85fOd1bQN/vpd8pNHV9mKTejlZK98KiplS5DqdgX?=
 =?us-ascii?Q?Nf1FzysP8ywqTb+GShMiYDrEFIrunHzmi1em53azNQl2hQ9sR4tpJe9mFfuL?=
 =?us-ascii?Q?QZa5pfVrj0UXZVQSej0BW4a4b6xd0g3IYdg9pOhsq+U3Ebx3co8+pjkP/ltU?=
 =?us-ascii?Q?4O2MCS/I6RalUGyNZrkr2yyiZg9UPITwlqFk6NB69orgetD+QpdHla7fK3ey?=
 =?us-ascii?Q?SOxZoqEqPEjGHQxvmljebwDp9bgg64bdCqSy/HQrqAgVGHZOyiJbr48Y2+GT?=
 =?us-ascii?Q?HIVrf7VUqZkCBjlzm2mTlSf1jjq7YMt0+VPDTNLrwIfwPK49VAZEE1iUUoaf?=
 =?us-ascii?Q?ob6fC//TN6CVexZQagoLsjQN5FWE11utydLTSvZDskUFTd/k4pPgGHdEXvTz?=
 =?us-ascii?Q?juJDDyxggb4vFjIAT5nPOxxV4GRrInaezTVdoVEfCiuGUDMgHfIES3ECQXPz?=
 =?us-ascii?Q?QRLJp2v0QwsH73Uvx0v1IAkkWDN8xrQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66838d29-9dba-4494-8694-08de7b03eec6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:09:55.6611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4BKYDqsdoJQ/NQ8rdwmQX+Zo99l/iDrPiLsGCbWWSO54cLJAjv4Pg1jeBKmr6T6tvv70i+baxNAZnjBTLIurltaC4ex8gHrjcht4+X7B5I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
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

On Thu, Mar 05, 2026 at 09:02:29AM -0300, Gustavo Sousa wrote:
> The macros IS_PLATFORM_STEP() and IS_SUBPLATFORM_STEP() are unused now
> and can be simply dropped.  Furthermore, in upcoming changes we will add
> logic to read platform-level step information from PCI RevID and keeping
> those macros around would potentially cause confusion.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Looks like these have been unused since

  87c299fa3a97 ("drm/xe/guc: Port Wa_14014475959 to xe_wa and fix it")
  63bbd800ff01 ("drm/xe/guc: Port Wa_22012727170/Wa_22012727685 to xe_wa")

respectively.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e9032014923d..85451cef3c25 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -81,16 +81,6 @@ enum xe_wedged_mode {
>  
>  #define XE_MAX_ASID	(BIT(20))
>  
> -#define IS_PLATFORM_STEP(_xe, _platform, min_step, max_step)	\
> -	((_xe)->info.platform == (_platform) &&			\
> -	 (_xe)->info.step.graphics >= (min_step) &&		\
> -	 (_xe)->info.step.graphics < (max_step))
> -#define IS_SUBPLATFORM_STEP(_xe, _platform, sub, min_step, max_step)	\
> -	((_xe)->info.platform == (_platform) &&				\
> -	 (_xe)->info.subplatform == (sub) &&				\
> -	 (_xe)->info.step.graphics >= (min_step) &&			\
> -	 (_xe)->info.step.graphics < (max_step))
> -
>  /**
>   * struct xe_device - Top level struct of Xe device
>   */
> 
> -- 
> 2.52.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
