Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB637C44512
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 17:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA9DD10E3AE;
	Thu, 16 Jul 2026 17:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8Sk+BBx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3DD710E3AC
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 17:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784223885; x=1815759885;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=X+Lw7LWlpuzphTm53XpyYfjConK33l6VJJkcRDPXF3s=;
 b=Q8Sk+BBxg+080uWjqeHB7MEZuaXWOzyS+kEduCDiisyqtCY9h8QWKSE/
 VDPYa2FcDnpFVsHoQAUaPqlEZN2ZqasCclcpPrPyPwvSp0s9sv6HlVSi+
 R5PZ4WT0YERCjrPSIqpYMRdR6velfZdX5aIxz5RSXngWraA3khB56oltX
 E6GDEJvRWbhh04ahXUs3r6AmBxGzEfbqX5avLKkpH0x+Ez6Q36tNGSLV6
 JSpbD5eGwwUFmNDeVH1jWFo4+ZMfQZddF6cWWAdgFv6pCZXYU46lfZ5vO
 gHj2ej1n/0bYrKMJaLBJOa57jQ5bNG2AnMVTmkXi+qLfw2l4uMlU03M1Z w==;
X-CSE-ConnectionGUID: 5nrxm62kRp+j3cM/h5FmoQ==
X-CSE-MsgGUID: Mht07P3fT2encXpuOI78oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="83877310"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="83877310"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 10:44:44 -0700
X-CSE-ConnectionGUID: 4iMCOLM6QCSEemkcP9CWfw==
X-CSE-MsgGUID: tZGnvbFgRC2shyl0jYWKGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="256023331"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 10:44:44 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 10:44:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 10:44:43 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 10:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjjawGuXYZH6/BMCpprVN7828jXXleRB1vTaXN6uh0Glb4uXgq1QpQ3Ov/C1hOtApkB9UGa2sihOAT9IMBnJ8NvvhLdwh1MvIsaz7TrOgXT6FgcJVKP+DbMHBpF4xCBbvUOCHzBrV3NnVduzfiw293bZt1H2wHiwbJ5s9z74O8/v0menlTBmbHK5q2xu23MKleVexVeUl/lhR+tSKvu/SEwbap4BxQqvH0tBXf/jtZLXW/BeXqGUgcOd0F655u72FCqcEZO+TG1ErhTUtwlEKhupnU3MUuQ+MWbGUetNvAkH+SRqbr2kHUONNQzuRhRR7GO2jSmYOsvpsMo0nKmmww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+kkJj10he2/BaTd+Sf1Vk/Pl18qSuOQZSmAwssW2aw=;
 b=KuEjh0ZUrAkiDOFtclXC3XWJFI0FkDtnvv+UvcFvnToIxb2SImb+Mvin0/F2chhLtlIY/zhc9QLmwqccxEQdPK8N7oAK86KGAXkV50Ch57B5TQ7tFLiNFUa0b00pz11b/cEnZcsSybirYaYl9Hw83oz1q//91t3MUy+Vi0+LgguRfADLk5YSQSBTmNHWIH4t9/k5UX2xu5ntuzcU/zlswBsS+I0tPNGwWNKQBUEm2gZ/Sz4pfMP1gpuFpIt0DXf8/eKzfoa/6FkYVXEmA73dzvtQ+jKF/cZ5zneHuKP4hiDTTMWAZaRVO3UC4mhBp9ZUDm26bx/RvbJsgq7kt2BD6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV8PR11MB8581.namprd11.prod.outlook.com (2603:10b6:408:1e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Thu, 16 Jul
 2026 17:44:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 17:44:40 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/xe3p_lpg: Program TR_PTA_MODE
In-Reply-To: <20260714-tr_pta_mode-v1-1-6b6544af9d79@intel.com>
References: <20260714-tr_pta_mode-v1-1-6b6544af9d79@intel.com>
Date: Thu, 16 Jul 2026 14:44:36 -0300
Message-ID: <87ech27rsr.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV8PR11MB8581:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1e51ee-8a45-4d31-4f18-08dee361e96f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|11063799006|56012099006|6133799003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: jon0YY/JN8G5s4muD04aSVdoq9eBVZmV8zerNPzatVeM/G2faN9YHRymZel2FLgpR1RT7ME4fLWU8EpUaNHwROpVem7MtC6cYlrNEKmqBa0WsbmP5ZsW0uCXGt0nNvNVwOxoSvt/WEOFOC7JDp9lrID+y24ysDhkNjY6leUTHyJrjHeI0MYz4mMNlHRPgGqPHxrfLtLTwENqy7J6877Sq0rtFBKHzAh3+8dCua39UXM2DAXfasxWygny3vhwyg+w7QaEezqfANlc4atG5acyGTBg9CNYlNQyHhIBu7OWa6bhRJz/A7jXptYl+SuVswRMeBhp4wzahQoRdOynlpMfxSYF/H/3f3zM6xr7fcgdTRbZQuWd0ZtufB7E+hl2J2tSiuk2WAHAsJwCOTVOZk20RCnehY4dmVZlYEvkj7qM1D9Ta587j6bzZe5Ewtt75yXdrtigRp5rbTvnnx2DsGf1cwH4XBu+pFIsbFX5srKy3rfO69EHW9y/WW/9GRmzdL5Z4Hgle6NEcM45RpoC+G20hI2dGfYReCqDgeVD8upnNs699IV1Eu40bQdanaZCWMDOwZHi1ZrmQbkF0k8xc8TfEpgi+4nvx5pt1HJI1S5d26zf8h1VAza/G5Pnwmua8SR7ol75QA6rtl+baSLddOQq343naofBw/1pa8sPf+MkXL0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xkeifKaeMcHZ7PQFTlsIwlvCAiwk6LTxwKm0maXweTxmgKD5K7PII3sJmryy?=
 =?us-ascii?Q?PKK03oq75JrkCUQ9YgKOuteGdEU30Bf49ddtlsQnHz5uFgzBqsiQtIARi2jc?=
 =?us-ascii?Q?0mTC9Ua13+QmFRl0BQG0P1Z0Q+ksZC1/KrbhClfZ1GFTJ2PYo91xcwIiCVgC?=
 =?us-ascii?Q?tDerqBW/F4ev+2RQouH4Clw1ZXusFYyUhgNaEDuT8bHFISGIEg8SOETAbuT9?=
 =?us-ascii?Q?8LsFUJr8aGbLRqnMEtFy7Vvu2R1S+ESGMUKLYN0lSw4lLbNkFgVSsYftAx8V?=
 =?us-ascii?Q?8/THEfJM5IeBpGoOGL3OkYZMLdB0UXBH6GQeD5toWNRYNofPZElN+VLks9N9?=
 =?us-ascii?Q?CuYieyAPjvfmwZEihx3h7ZIm49rYbExNLHlu0jFhWa+QSzfZpldLgxGuW8NN?=
 =?us-ascii?Q?Hz3J8n3EDvqylwzHYgxyq/csDgd0uGLwRz3gMTdLd2c++SN8oUBhzZLXyQVW?=
 =?us-ascii?Q?nnAI+Cc2bsWDQELFoc0CUjSVp9HcYDhdOKBVAi6DVKym/MAq0+aztRhr5euH?=
 =?us-ascii?Q?KYOg0Q00ORlEA6E7JTvnYmjavEmW+bsbNe6jLFj+seGzJw0TJuSFKF7GKq96?=
 =?us-ascii?Q?vmsMXRU/a/ge5koKKVtcTLVVn48pIocST7UDCd2vEdiWRuQAJewF9p1CapKY?=
 =?us-ascii?Q?lvIIJ1CH1NRCf4yJUmXLW7VhsHUaVBVAd1Ad+enDcfLNYCREvxup5pSHRq7M?=
 =?us-ascii?Q?tj88t80rwaRhvmjiTflB1LOIs1tlqeFP/6SA3o0M2QHnG8aic6GlG5XtLnZK?=
 =?us-ascii?Q?jlt/eTbwtAlrkb0amG6xOTPz5mE1z/GTN8niq5dDtyb8Zlzwb9bpw0KNDgY/?=
 =?us-ascii?Q?nbLypcynbTOc2tTgnrPVHDZVp8T85KCqVlUDKM+XucjQBpbuA0m/NWEtJbFh?=
 =?us-ascii?Q?x90DM5cyYlxXBMo/FbydphViW47lmKiId3JlHTZ4Pr/MBmB1tvqzpQgdqm3s?=
 =?us-ascii?Q?YUQdFiCOaYA0tEqQufo6QKfQWw7az+TIjVee6Q4AggMeD9ftjCV7JJfoOD7w?=
 =?us-ascii?Q?NqqyS7CUUOj8a3d6Pic/rLv5QEib5v0W6AUJ9/fMBQrR/IwelOPEaGc3xWKE?=
 =?us-ascii?Q?xDFqogt3xSdZSt3/+dKn7QT6sKMuYkLYwNdk2gGOPJmaEdT0ZLRRM5smjiQJ?=
 =?us-ascii?Q?HbsolK6GZKT5sffeBc/49aGtnIWNFlfxlcHKqSHaei9Let6wNud/4jCPomNm?=
 =?us-ascii?Q?D8/B/4loLJbGT2lcUI9T5NrlL6AuSrIoxj9lkxz/IwEOYNDnu+5qg2Lgx449?=
 =?us-ascii?Q?g3uIWudp9LMjiuL8xizy/YkbJYrCFVs6KzUpReqI1Z5dtQTtkThv+NF38zX3?=
 =?us-ascii?Q?oKtTi42twKveLyqhHl3grmBWQe2f7MYswBQXrXRO8H5LjYyFSwwlIbNpJusG?=
 =?us-ascii?Q?eEoBtQWQTWC+r4IkzJiexMkgOrbdw2Z41pnYly7mMEY6HuAQgnT3/yTFouDg?=
 =?us-ascii?Q?Ph4636rF1cEfm0xH6S/Tdk8aFbnuJwMGxKT36oJtSdbXDYK4Z+UnTBKf4vLv?=
 =?us-ascii?Q?u3bMhEt9Udc7aCMiGFcD1Uf94ESSqDY/P8BA/fAdfxvNc7EpcZ5kRtpLgZDf?=
 =?us-ascii?Q?3caLtoUfMkGjO9foayN7LxYNs8gtVuZH6S6/XgIGVjmTu/r/IMXFs1ZELEhe?=
 =?us-ascii?Q?vOPTUSfU0op2X3yNs1CanZdavyA3Vzgj5FJMMte3IDq8OFIOShIEk2sNyHHX?=
 =?us-ascii?Q?2m4cYtTnJ5NUC3ftwnhfqCa1L77yAFa3KG1G0KMCJ8rqArgBxLvPE/bNePJf?=
 =?us-ascii?Q?ND16Qg+iTg=3D=3D?=
X-Exchange-RoutingPolicyChecked: D9eB7AE1OFzUb/l7CWCeDzbAaKarRIB2ppD0rhXj/YNTfJdsl0qaK2KPscT3ywT/clQ7LLWFFhR68zxodGIe00LUfs4Wg88NVGl1MKszyLGMW2aZBMGXie2ybKYfqO89v5rFqb3hLslUUSzX4eAC0tVnpXzFwivgLMfH/k5zu/V0YUp6GhoLj6zTCxZZ6nn+k/p5uXBpEYQne+f0qqgaeMIeoW9raLPSlXOJ4T/NTJ6mPCdTDIYIsb9hTPZkO6Bhz04TeyGyfxf08wjWoExW3L3FlPDN1GyseYcfoeCVRZjXLEfmYAyhZmOIh8ILnFRAEIB10fd7tjll5wdwSvumfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1e51ee-8a45-4d31-4f18-08dee361e96f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 17:44:40.4226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tA9+q47qNXyGHITTq0rTpRPbKPKCKppuSWtGar2oVwTV53FOcehKyt8rvJes4uNsC17a4Ml908RB4KgN08xAcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8581
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

Matt Roper <matthew.d.roper@intel.com> writes:

> Up until Xe3p_LPG, the PTA_MODE register controlled cacheability of
> accesses to the page tables for both PPGTT and TRTT.  Starting with
> Xe3p_LPG, PTA_MODE is now only responsible for the PPGTT accesses, and a
> separate register, TR_PTA_MODE is used to control the TRTT accesses. The
> currently recommeded value for TR_PTA_MODE differs from PTA_MODE on
> Xe3p_LPG.  Track and program this value separately in the driver.
>
> Note that even though the Xe3p_LP[G/M] IPs didn't add support for this
> new TR_PTA_MODE register until b-stepping, it's safe us to ignore that
> detail code-wise.  Writes of the unrecognized registers on a-step
> hardware will be silently ignored, and the reads on a-step will come
> back as 0x0 which happens to be the value we'd be trying to program on
> these IP versions anyway (for both graphics and media).
>
> The new TRTT-specific register also does not exist on Xe3p_XPC
> platforms.
>
> Bspec: 79814, 71582
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  4 +++
>  drivers/gpu/drm/xe/xe_pat.c          | 47 ++++++++++++++++++++++++++++++------
>  2 files changed, 44 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 022e08205897..de5acc994ce6 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -404,6 +404,10 @@ struct xe_device {
>  		const struct xe_pat_table_entry *pat_primary_pta;
>  		/** @pat.pat_media_pta: media GT PAT entry for page table accesses */
>  		const struct xe_pat_table_entry *pat_media_pta;
> +		/** @pat.pat_primary_tr_pta: primary GT PAT entry for TRTT page table accesses */
> +		const struct xe_pat_table_entry *pat_primary_tr_pta;
> +		/** @pat.pat_media_tr_pta: media GT PAT entry for TRTT page table accesses */
> +		const struct xe_pat_table_entry *pat_media_tr_pta;
>  		u16 idx[__XE_CACHE_LEVEL_COUNT];
>  	} pat;
>  
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index fad5b5a5ed4a..cde59270acc4 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -25,6 +25,7 @@
>  								   0x4800, 0x4804, \
>  								   0x4848, 0x484c)
>  #define _PAT_PTA				0x4820
> +#define _PAT_TR_PTA				0x48cc
>  
>  #define XE2_NO_PROMOTE				REG_BIT(10)
>  #define XE2_COMP_EN				REG_BIT(9)
> @@ -256,6 +257,7 @@ static const struct xe_pat_table_entry xe3p_xpc_pat_table[] = {
>  
>  static const struct xe_pat_table_entry xe3p_primary_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 3);
>  static const struct xe_pat_table_entry xe3p_media_pat_pta = XE2_PAT(0, 0, 0, 0, 0, 2);
> +static const struct xe_pat_table_entry xe3p_pat_tr_pta = XE2_PAT(0, 0, 0, 0, 0, 0);
>  
>  static const struct xe_pat_table_entry xe3p_lpg_pat_table[] = {
>  	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
> @@ -311,15 +313,18 @@ u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
>  	return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
>  }
>  
> -static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt)
> +static const struct xe_pat_table_entry *gt_pta_entry(struct xe_gt *gt, bool trtt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (xe_gt_is_main_type(gt))
> +	if (xe_gt_is_main_type(gt) && !trtt)
>  		return xe->pat.pat_primary_pta;
> -
> -	if (xe_gt_is_media_type(gt))
> +	if (xe_gt_is_main_type(gt) && trtt)
> +		return xe->pat.pat_primary_tr_pta;
> +	if (xe_gt_is_media_type(gt) && !trtt)
>  		return xe->pat.pat_media_pta;
> +	if (xe_gt_is_media_type(gt) && trtt)
> +		return xe->pat.pat_media_tr_pta;
>  
>  	xe_assert(xe, false);
>  	return NULL;

I think I would slightly prefer a separate function called
gt_tr_pta_entry(), because it is clearer that it is about the TRTT PTA
mode when compared with a call like gt_pta_entry(gt, true).

The patch looks good to me, so take that suggestion as optional.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

> @@ -329,7 +334,8 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
>  			int n_entries)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
> +	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
> +	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
>  
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg reg = XE_REG(_PAT_INDEX(i));
> @@ -342,13 +348,17 @@ static void program_pat(struct xe_gt *gt, const struct xe_pat_table_entry table[
>  
>  	if (pta_entry)
>  		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_PTA), pta_entry->value);
> +
> +	if (tr_pta_entry)
> +		xe_mmio_write32(&gt->mmio, XE_REG(_PAT_TR_PTA), tr_pta_entry->value);
>  }
>  
>  static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry table[],
>  			    int n_entries)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
> +	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
> +	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
>  
>  	for (int i = 0; i < n_entries; i++) {
>  		struct xe_reg_mcr reg_mcr = XE_REG_MCR(_PAT_INDEX(i));
> @@ -361,6 +371,9 @@ static void program_pat_mcr(struct xe_gt *gt, const struct xe_pat_table_entry ta
>  
>  	if (pta_entry)
>  		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_PTA), pta_entry->value);
> +
> +	if (tr_pta_entry)
> +		xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_TR_PTA), pta_entry->value);
>  }
>  
>  static int xelp_dump(struct xe_gt *gt, struct drm_printer *p)
> @@ -531,6 +544,16 @@ static int xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  	drm_printf(p, "Page Table Access:\n");
>  	xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  
> +	if (gt_pta_entry(gt, true)) {
> +		if (xe_gt_is_media_type(gt))
> +			pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_TR_PTA));
> +		else
> +			pat = xe_gt_mcr_unicast_read_any(gt, XE_REG_MCR(_PAT_TR_PTA));
> +
> +		drm_printf(p, "TRTT Page Table Access:\n");
> +		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
> +	}
> +
>  	if (xe_gt_is_media_type(gt))
>  		pat = xe_mmio_read32(&gt->mmio, XE_REG(_PAT_ATS));
>  	else
> @@ -577,6 +600,8 @@ void xe_pat_init_early(struct xe_device *xe)
>  		if (!IS_DGFX(xe)) {
>  			xe->pat.pat_primary_pta = &xe3p_primary_pat_pta;
>  			xe->pat.pat_media_pta = &xe3p_media_pat_pta;
> +			xe->pat.pat_primary_tr_pta = &xe3p_pat_tr_pta;
> +			xe->pat.pat_media_tr_pta = &xe3p_pat_tr_pta;
>  		}
>  		xe->pat.n_entries = ARRAY_SIZE(xe3p_lpg_pat_table);
>  		xe->pat.idx[XE_CACHE_NONE] = 3;
> @@ -700,7 +725,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer *p)
>  int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt);
> +	const struct xe_pat_table_entry *pta_entry = gt_pta_entry(gt, false);
> +	const struct xe_pat_table_entry *tr_pta_entry = gt_pta_entry(gt, true);
>  	char label[PAT_LABEL_LEN];
>  
>  	if (!xe->pat.table || !xe->pat.n_entries)
> @@ -731,6 +757,13 @@ int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p)
>  		xe->pat.ops->entry_dump(p, "PTA_MODE", pat, false);
>  	}
>  
> +	if (tr_pta_entry) {
> +		u32 pat = tr_pta_entry->value;
> +
> +		drm_printf(p, "TRTT Page Table Access:\n");
> +		xe->pat.ops->entry_dump(p, "TR_PTA_MODE", pat, false);
> +	}
> +
>  	if (xe->pat.pat_ats) {
>  		u32 pat = xe->pat.pat_ats->value;
>  
>
> ---
> base-commit: 9cf91140eff27765d402aedeea89505d52db121e
> change-id: 20260629-tr_pta_mode-b45fbb593987
>
> Best regards,
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
