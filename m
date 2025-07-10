Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB7EC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 21:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E210E979;
	Thu, 10 Jul 2025 21:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExlAW5nR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0419010E979
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 21:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752183763; x=1783719763;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dQ/qFY6QIglQDwNjngOHiONj5fo/7bOHqB9z2vNff7o=;
 b=ExlAW5nRuIP3ODRxfxFAKns3LPlTiQnGR85f1T9sQdaoSjw3OUWOiDU5
 Y1E3uf1sph+/uzEL8MaGw0bg9WIx1/URcnvXyDsqSIpKn0/3kiHUHGoT7
 HVSsbepn/rUlIzBpWfE8H8xJFE5juat+ZHtv6oYsTknuqFKDhP3gvl/tj
 YIWkbquiQawVCG5Mepfmq1Xtp1BB6c7Qih/Ggcq2fBp+fGdQY22KcYMPj
 kOc05PSrsIrezsf4E0gFnRUmu8LEKsr2+aRIoilKEE6F+K5oB47EY5Fkh
 TVl1sqrpuOYVrCmePz7OQ3OiUCDHVkenR55v31Gc70sEtWSuJJ9pVHl/K A==;
X-CSE-ConnectionGUID: YfLtPzGCS425gaNjtwm7rQ==
X-CSE-MsgGUID: DgaBq7qpS2+BrdfsdJwrtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54329209"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="54329209"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:42:43 -0700
X-CSE-ConnectionGUID: X3OmqeaATLKjMtNn+kR/Dg==
X-CSE-MsgGUID: 5X14yMfKQmORcdls1VbgkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="160502391"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 14:42:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:42:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 14:42:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 14:42:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A02o7eryacefuevPKVKi7gbHpJBEcXMgaWiCPLiyKOJKHylbFm+qdgB0sxrPG+tHsO27QIS7qp526qokktJjc0pQqfqOJ2r1JlD+snxUPgRlgKo7rkvg1S0imz7E3spmHwteLANeTNKe4HfbRxljRKoRrStmCz5sNE0NIH3NQKAuadYvToY6rpP8SkptjI9vAu8XS20GtEJFWj76TDi6xOy1qc7Ipldo0GwQOil483/6EB32EiwVbypTH9lO/TB3GoXSSdrA6P8pVHctebMDQBaxYkdCp8DZobQ0t5EZbUz5GXqLHUs840g+HdWDjkhRS04+WU6aQixgDKzmUZUBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFNE/I70hjwfjQoZs1haV7g5va8IquZn5/My2DOuuWU=;
 b=WN4ta63HOmIsq5WzpnnXBDJm58T/jmtzcsjpfmLSfr0ocFu4nqe8Xjjxc9qBh2oHChJY11c7BbKpmsz7s7UC3YFgVvDU+ezFmFYuP/wZ8uhQFivykmpBtEACtFJCfHyxQHb31Ur9z2JKAbJeVbm0WZuzYT6ZN0Te7aV4M98XK/9D0zjPODNREGwtQ0sjE15/wZHDZxRZR5LIqYlKNMSzYpQdct7wfhiRRrdVcwJZmX6Jsw+8wmNAGYIdfMO7uXDhWLjJcTMgiG90dPJN+AfX8D8okrX42iU6vEB/BDV29vFmSFafsfWjry7OtaWjFPjGSl01w/o1r6nDGOxNOxoKFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN6PR11MB8170.namprd11.prod.outlook.com (2603:10b6:208:47c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Thu, 10 Jul
 2025 21:42:25 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 10 Jul 2025
 21:42:24 +0000
Date: Thu, 10 Jul 2025 16:42:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 1/6] drm/xe: prepare xe_gen_wa_oob to be multi-use
Message-ID: <gfb6jeivbql6p3iikj7hbmubunkfzx46zqwa2bjr46ebb5hiua@vfxym4zhasex>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
 <20250709221605.172516-2-matthew.s.atwood@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250709221605.172516-2-matthew.s.atwood@intel.com>
X-ClientProxiedBy: SJ2PR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a03:505::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN6PR11MB8170:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c5a81a-488d-48c2-6571-08ddbffaa876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uJDxRRMM0NILBfxZ6LJihcq95Uqfi6DTkLKduCHns8oCS6aDJJ4k8d65emhQ?=
 =?us-ascii?Q?FG14LWq9F8sTtn+IzSyy11NQnXvl8DxdLcOk0aSQ4XyRBQpz68HXudarC+5L?=
 =?us-ascii?Q?kEgHzHyJD/CvvkMTpUffApOEN4iVMZRlr+5kPzLG36sZbHqNqsrFTwy8R6mU?=
 =?us-ascii?Q?cw5rshiITNVkzaV4bPsOVZ6ez+7pnpAOUfPe9iSh30+puD15cW0IzXRfak7/?=
 =?us-ascii?Q?8DKbulydfXU9r/IrGdJiesrl/grMcKULJ0JsP1ABm2wJtEWw2xz37zLEdLGb?=
 =?us-ascii?Q?XpozHJgnpaRMNIHl/mb7FW7ekvHQQVP/JzEeV/GlVOmksLxZF790mH0fQ1ak?=
 =?us-ascii?Q?I3ZbCOKr5B+Cl7TDefG6wzWIGNb7+1ZeOKAKglLHROgZSUHhI7Dk32+uTmHQ?=
 =?us-ascii?Q?e5EUXjSsEButZm0+BvtKVw4pLq0y5LT8fEA4eQirSDx6l5FSQref/zzC/mbL?=
 =?us-ascii?Q?NjVtj7+bgZGBfez+sza+uUSZrup3mPaDdTrQ1L7AaK4+7hYMdXl9BgQVfwGL?=
 =?us-ascii?Q?TRCwSC7d56oGQYpcDKdkzC+8vAQy0dhSEY+VP8Sfni3rkp2guleKcdd5YgW7?=
 =?us-ascii?Q?wXL8UXl87bruv73m8IwjBIymW4RrL44vyXJEmxIGswp875W3Y+ztnyCVplzy?=
 =?us-ascii?Q?NlLVugk4lAjgHq0GTETPzcVb5cZw2bvbUmcykq65VN4gGH0HVY8UfiA86LBs?=
 =?us-ascii?Q?3VTLz8yaa4wEIWzpDWOrL1feeDwAR1s3Eh1TZ23QtXaeqvbpF1JSMHtnYfCo?=
 =?us-ascii?Q?hcXr46KBxnUz8dkJNPPDlySy65Ekh4c+NX5No1JtoEH/cbZ5vlXQZFZHp4Xd?=
 =?us-ascii?Q?QddzPsC1KMR+KNg7P0quEtVY4id2GKeZ4jjNnyIIhJw/Ypx9PiMN2F81XGXE?=
 =?us-ascii?Q?oXItDUTa5y8bS8Xy+VMmD8KQsanLn7U4hdP9ohNBMHkxulwXstU9GvRpbSUV?=
 =?us-ascii?Q?nUegSWB+9KhCwaRZe5b4ETVnmBZvdyZpHTfh2SPZ4NRKQ8LbydYiPJ9DgME/?=
 =?us-ascii?Q?PqcGoz45i72bXzz/jw9kqXXF23pKF7i06j3oBBeloHmIQV6QZXaZQtTPejRC?=
 =?us-ascii?Q?+6MK6aJp4sOjq0tNSfCb8irCXp6Cig4Yx3kGbVoijb0eeNQ9eDSP9zYCZDjM?=
 =?us-ascii?Q?MB17hB9tdIOlycqRDK1eYr3BCJHAGaZYXooRYPJPu988vu9f6VvXLflbJ0zz?=
 =?us-ascii?Q?7UcF9Pz/FUP+Wif1+ua3pr+Az6w6hrpmuXLYWkI46N17XjdNTT4fxqCaU1C/?=
 =?us-ascii?Q?AON1L72GFFulw2Fz+q92ogdGYUutlpzwT7ZiN9Z4JHNUnd5Fp7rY0aRMPk6C?=
 =?us-ascii?Q?uPvXRSlTqKiodK5oRF2RMaX0dLDWlAymGl3rF53PwmZBw1s+BpHq0KKD+My7?=
 =?us-ascii?Q?sQT7+3vcwJ2v1iiFDOZH9xa2/oKXeWTypZYvKFnkBB2S248VEallo/AQ7ZcL?=
 =?us-ascii?Q?Dge/oSYU6u8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJrDkE3o9NoDKusXiSF2vWNa33duRm1oSXSHQY9DlOaXNolthwjb5Vb5ZbUu?=
 =?us-ascii?Q?BAoJuHDhcLdqnhBc+5kn/AK/luhNVgFoL1gxeARhKdC9YJvVw7HlIt51pg7C?=
 =?us-ascii?Q?PGX1KTHKhXE4SgmzKAfx7RGNtx1Tf66JMwC5NCOVrKTLuV/1B1KRP2AV03LD?=
 =?us-ascii?Q?9A4FOcZtCQOHjTuFrFyHusX0yHaLEelMoXVRYPcLvLn3DThaP7ukQeZrwVBt?=
 =?us-ascii?Q?JHMnwweFJKCV+2OPZXAKy6amIUyt+5coXWb/jXG9D+zU7rj+A9Ry5xa4ZwIb?=
 =?us-ascii?Q?mJB7hn+Rv5UMlgBhkkuMuBLTa5SQGlnlLPvoZLeD3wf3qGU3yuL89+un1zo1?=
 =?us-ascii?Q?GfkVq40dPNFoKDn1pxqdJJ6K2n6oolexOG2BWinIon6eOEa9D831XIYISACn?=
 =?us-ascii?Q?GDmZPcjFa1x84aCViXEx1RxxUxEtIJpzcWxueZZMVcsLlHS6JxGcRBL1QheB?=
 =?us-ascii?Q?gsiNa2QpfN9nFkUUt/YaWYf/sp8HWghKE+0WsnhTvhz/Tab8iZPryTkhAY+K?=
 =?us-ascii?Q?2MUg19BNG+agGBQe9VYs4NvTDF8RCrYU6W8iof9Ei1h5F/9ZtJxblmWKB9Cd?=
 =?us-ascii?Q?YGhIpKa0EsmJsgMH7zc99i98LNOaD7mxAqtn1AaozwDUC46wL5zO+RTkzH+X?=
 =?us-ascii?Q?GDmxLGkjs/KadMJcP9zmUNAVqCrpxybfHezN65brzOzcotjcSpongKU6y7iG?=
 =?us-ascii?Q?gM0uDO4lXywcOa1GV1gmRU8qUSG+UPTemkFLqZ/tx3k46qanZPbgbCXjdsbA?=
 =?us-ascii?Q?CJb+/c/TIbu33/gyTaKYjP5CPWuQTEBq+BeEBtAIVt5AWCdb6d/7sAEmx2j7?=
 =?us-ascii?Q?QsvK9YXuv1vhQfO1e5qsVenNrHeR4qRJ7uoJKlCiWLMdXrMUyZExdvcbS/e2?=
 =?us-ascii?Q?V83c1iqjLPCvfttmF3umKx7Q+XNSTT2Z4vBnJeye8qXGMh3jMsadXLIqTLhd?=
 =?us-ascii?Q?1knyPYz+2qeDatN4rS0SHgeeEa3E4Q+SUy9224TyeHkhY5hkLNaSAGiruFmq?=
 =?us-ascii?Q?WjZS+LnV5Xd6eHlIcxUqPpdK0mkXutpeqIJ4m7BtGtUNsKmIgEqbNyAOb9r7?=
 =?us-ascii?Q?EILCYtRHtdV1GHdvE6r73yD7Kfne8FRLHO2N4sDb83zvJ4Epg4p+VVk0SIle?=
 =?us-ascii?Q?mFXeAFG4mdWjHSqmG9LIrFNMFbSENV5PwzNm1ypvu/nub11h4r6uRBIZj7OK?=
 =?us-ascii?Q?D6VXYoU20u0pJ/jJqfTmhX0ZVSxG8Zlh76vrXhn1/N4IIc3oZg7u8/vL5Bx4?=
 =?us-ascii?Q?YpXFUjeqVLDgiLBwQ1V29VfCZb6Y12hoVtblDaGfOz8DBvguGSDPfvEKI2Ur?=
 =?us-ascii?Q?4tgiLVy1QXi5lK3SPD6F9knBiA9rGfEJn5XpnqKj0/8V/q5/D15hCntDiXel?=
 =?us-ascii?Q?Lia1JbrVaZtvQ6roBH7iaVtbf4YLn/TojpDSM8JGGQMCthBZRMpnCZaLJfod?=
 =?us-ascii?Q?kE4fAnJXAik0nuC/CSRKP9CsDqlNUkL7vRtOYJq1mEoqJ3FDXScZoQl+Iaup?=
 =?us-ascii?Q?aTfmIr+9YSxNe6iwrSYW3KkP08JddX1C6bmO2R70iylc7yJQgbYK6wpDXFDO?=
 =?us-ascii?Q?fDCo+GZG9scFl8Stl2QsRZLeJFyZtNvxGwvfhJQXoj8oNoRDygB6iQZBsAD/?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c5a81a-488d-48c2-6571-08ddbffaa876
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 21:42:24.7375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pRJ7vcbqyEVRHyVmx5QHlyPfDl44s9ZRDHRGjaTkJfJB8uRUf4CW/jRJ/eTNoLh1b4pMfAXtfS5H5tNQOHrA8a0nu1Ux1RO6TZXK//L9Uc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8170
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

On Wed, Jul 09, 2025 at 03:16:00PM -0700, Matt Atwood wrote:
>There is a need for additional oob rules files. Make the current gen
>file more robust to support more files.
>
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gen_wa_oob.c | 45 +++++++++++++++++++++++++-----
> 1 file changed, 38 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>index ed9183599e31..6581cb0f0e59 100644
>--- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>+++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>@@ -18,8 +18,8 @@
> 	" *\n" \
> 	" * This file was generated from rules: %s\n" \
> 	" */\n" \
>-	"#ifndef _GENERATED_XE_WA_OOB_\n" \
>-	"#define _GENERATED_XE_WA_OOB_\n" \
>+	"#ifndef _GENERATED_%s_\n" \
>+	"#define _GENERATED_%s_\n" \
> 	"\n" \
> 	"enum {\n"
>
>@@ -52,7 +52,7 @@ static char *strip(char *line, size_t linelen)
> }
>
> #define MAX_LINE_LEN 4096
>-static int parse(FILE *input, FILE *csource, FILE *cheader)
>+static int parse(FILE *input, FILE *csource, FILE *cheader, char *prefix)
> {
> 	char line[MAX_LINE_LEN + 1];
> 	char *name, *prev_name = NULL, *rules;
>@@ -96,7 +96,7 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 		}
>
> 		if (name) {
>-			fprintf(cheader, "\tXE_WA_OOB_%s = %u,\n", name, idx);
>+			fprintf(cheader, "\t%s_%s = %u,\n", prefix, name, idx);
>
> 			/* Close previous entry before starting a new one */
> 			if (idx)
>@@ -118,7 +118,33 @@ static int parse(FILE *input, FILE *csource, FILE *cheader)
> 	if (idx)
> 		fprintf(csource, ") },\n");
>
>-	fprintf(cheader, "\t_XE_WA_OOB_COUNT = %u\n", idx);
>+	fprintf(cheader, "\t_%s_COUNT = %u\n", prefix, idx);
>+
>+	return 0;
>+}
>+
>+static int fn_to_prefix(const char *fn, char *prefix, size_t size)
>+{
>+	size_t len;
>+
>+	fn = basename(fn);
>+	len = strlen(fn);
>+
>+	if (len > size - 1)
>+		return -ENAMETOOLONG;
>+
>+	memcpy(prefix, fn, len + 1);
>+
>+	for (char *p = prefix; *p; p++) {
>+		switch (*p) {
>+		case '.':
>+			*p = '\0';
>+			return 0;
>+		default:
>+			*p = toupper(*p);
>+			break;
>+		}
>+	}
>
> 	return 0;
> }
>@@ -141,6 +167,7 @@ int main(int argc, const char *argv[])
> 		[ARGS_CHEADER] = { .fn = argv[3], .mode = "w" },
> 	};
> 	int ret = 1;
>+	char prefix[128];
>
> 	if (argc < 3) {
> 		fprintf(stderr, "ERROR: wrong arguments\n");
>@@ -148,6 +175,9 @@ int main(int argc, const char *argv[])
> 		return 1;
> 	}
>
>+	if (fn_to_prefix(args[ARGS_CHEADER].fn, prefix, sizeof(prefix)) < 0)
>+		return 1;
>+
> 	for (int i = 0; i < _ARGS_COUNT; i++) {
> 		args[i].f = fopen(args[i].fn, args[i].mode);
> 		if (!args[i].f) {
>@@ -157,9 +187,10 @@ int main(int argc, const char *argv[])
> 		}
> 	}
>
>-	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn);
>+	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn, prefix, prefix);
>+
> 	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
>-		    args[ARGS_CHEADER].f);
>+		    args[ARGS_CHEADER].f, prefix);
> 	if (!ret)
> 		fprintf(args[ARGS_CHEADER].f, FOOTER);
>
>-- 
>2.49.0
>
