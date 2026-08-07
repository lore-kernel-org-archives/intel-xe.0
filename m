Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C5E6C2A09B
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 18:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1193210E44B;
	Fri,  7 Aug 2026 18:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LA8Ov29a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627CA10E44B
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 18:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786128842; x=1817664842;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5yJwFDyCy5dElGxBESfSw8pLGT6jEXDd4UwBb9FhhsU=;
 b=LA8Ov29aqeBuI9GlGNgsxVWTxfS0sPiOg/g4+O7FUu6h/GwWfpYJxmSe
 nqRpnig2XGRTk+WVvu+tTNHFZZ5/EbxOZFp9lKZiTmMdKNUw+bu7EyxMe
 cc8JDGY9z4+wklWqPZf9ghiGNVd/cMX5iWtfNRPn7mwNejuYu21Na31VM
 cpvIXJqhGx8fKpr5tn+gSnA30bZvMkDLLbpJZaBGMuHZlyWIp/fWysRmZ
 Gy211ZjOoHj8LdC5sLbf6u9Pjz/enrWm9Mux5J1FtkxrSkLjJ9pJhIrgO
 omTJ/JIPvTpy1Joz6k+4UZHcIEZZhKgkC6yr392y/JbtZMKmP+AzFx68k g==;
X-CSE-ConnectionGUID: wYE4ppU9QlqqmTajIueCRA==
X-CSE-MsgGUID: ZDG5clrYTKKMuLK5Wobsxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="97342229"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="97342229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:54:01 -0700
X-CSE-ConnectionGUID: LwIC5QQATKWIUu012DuzFg==
X-CSE-MsgGUID: 2uhp1QD/TwG671o7UD0SLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="285848228"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 11:54:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:54:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 11:54:00 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.18) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 11:54:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoqDM3hSn3BpllkRPP6ZSMqEGyccY1p6QYl3V7JxXGLYkb8YWdu7hy0zFrS85dwcHLK3c02Zia021x5jHMUllqq+HxtA56iYyDPNcAyY/CvYzkIyfcmz0UU3Ss8I39UA04tHAiCN+jW5M4TNQBCseMbI5jHRdN6m5isQPaNEADscFSV51MvUH1uWoVqf2WAYEkphwnuG9WM+Dio5+zTZM1y4Dk3rBAtvDoYWaRs1/VoCm6YKKaAtY+cK2DBfwhLYCEkfUtZR/GBgKvknBi0QvgjpbRCzGg+JBLZTla53kMSwiC+TYW4MtsBbckgZvSOu2FePznTXiTJVu9AGdIOmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8Cxc4w+C0erss2jjL/ALktyJKmwwWIlc1/lewhQ9Xs=;
 b=a/2+sTCQwQW24s4MD75djybYpVoll5zxvtIw0KEDtdws3M709A7FqH+E8riiC94PLo41TzDdbeyULF9FZ27m+BB2AxYok+f6w+XpqGS5LS6re5LbKAufEq2cc7N9bncQArMEErDcrKdwrfbtN12eejmyozy2Y79iPBJvY61AgzFiBGbnx6AbfprvngUXUOHfGeQqy/i+oVPp749Rrc4EqaOGkyZTO8Jumbvv6SZ5LnBeoGVTjEYU6+8oWv8EUoO1MgaZmnkHpklQzDSE0txMyB0obAOZeZx6uChu4L6GZGijxrShpVTBusvdlBrxraVlxiE5JzaIxAiWslO+Ne+1sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by DM3PPFD2F4A0090.namprd11.prod.outlook.com (2603:10b6:f:fc00::f50)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 18:53:58 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Fri, 7 Aug 2026
 18:53:58 +0000
Date: Fri, 7 Aug 2026 14:53:54 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v3 2/4] drm/xe/sysctrl: Add sysctrl debugfs infrastructure
Message-ID: <anYpwtF4LHYpxUYV@intel.com>
References: <20260807145621.2938848-6-anoop.c.vijay@intel.com>
 <20260807145621.2938848-8-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807145621.2938848-8-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|DM3PPFD2F4A0090:EE_
X-MS-Office365-Filtering-Correlation-Id: 9166b0d2-05d8-4696-579b-08def4b53ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PlmpbXG7B8GmhsF7UUkIM4+Fzb4Qr8A7N0FatOLzUPxrRPqkowpzXbrLed5qBR5gWnjTMoQ83X3JErhoLziZnE7ZSw9s+9afaDK5wnzNAeNIuT9iIf8HCsrHLFH0/r0KGKL/nhMub8dMS8mRFIOm33LOeLXBqdHpXKyX2EugjclrJFbabVbiGlSr7rUTPzXnH19RBbZDbgrgRvOFTSnhCtZG2UVm7HhN2eWJmGhiSOqSuE9/ZTG9XNKYQt7wfnngISUkBETpUnf/5t+4vwYYQm/2n29uiithNbssvS4ZKBPKWb9/E7X8xZcqvpYWFFQ2RVP/eATq1WttSZqqjidbh2NQo1iqeNmOFzVDPj1bDF4vYa1s+2ZO83thk1R2ZDXm00J+9PPVQbBZw5TmqU3J2iM5pXmaoYPHdZlYX5tHjb7CFt6PVyZiyRVSJ8wn37T5dFUbxrIMVfONfJcEMxHWJlg1rzsYC7Gn1dIER0QDibxgd+/hxpniFAt+HJgextAm8VQZHY3d8BsDFkDYCevqy/tIgEHoHEOiWaS8p8emx1p/L4i7jw/5o90pTZBviUvLlhpFakZgudJgJjjkMAxqgLSNxjykd2b7z+pH4Wwsmsh7dtxaGKOXp6+OCwnDWfWzhwrFVMC2Q9265ReMSM3+Orte3fN+XcwZtddBf8DAxUc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?eVPwDQJ3C71h3Hx3PiXOdVrhlqsVrLhl9LwYuln8jzHTEPi1fSnlo9Jzm+?=
 =?iso-8859-1?Q?HIzY6DuN/oUiXmoYC/8XZk5/FWkCOqI/la35S0hSE/8YlZ9E6AD9FsiXPt?=
 =?iso-8859-1?Q?2S9/8IfoQuES9vT5TRX3SfayU4vXFJnfa2VZ9j7QZ0AFi3AMjkZAZeGBOn?=
 =?iso-8859-1?Q?C3+X2wpYlGbu5QZWEin2NGFWf1SIAbQl9wcgadCws1GaEKjS/1fwpQPhxe?=
 =?iso-8859-1?Q?B+avWNhaelmO0OhN8fkqpLHJhxBibLfzaudzFxPoQGaY3CZBQLVmLOk5ax?=
 =?iso-8859-1?Q?QeFllVj8Eq3voVIkJj/BemTlp6i/l/hN7knzOd+ddOQGdm0tLw/0gWKsBi?=
 =?iso-8859-1?Q?G/cADH6XXC7a9v6By8ebMd94Fy8YmCBneqvzXg/C1Z/qgOlF2M8u2LyWew?=
 =?iso-8859-1?Q?EWRNYSv8ugH1XBV2eCyH4R1x0Zy2eYCciACWr0cQiKlpomxPh5faGW1svc?=
 =?iso-8859-1?Q?ZnRvhpIQjRpjkmINqb32MoZCcAgzytXeOGAeUzu5yyHEpgCRmDLQzXgGI3?=
 =?iso-8859-1?Q?BkEMzcoeotpq7zt66mRK0Pn37lzZL/pd/XqiQmzOBEi0exlCRRed6XvmQd?=
 =?iso-8859-1?Q?93sROKfSseQXMTgY11ORCIPBUz+XFSnFbI/FgsGlCiNj8rWrn0IQEB3lgo?=
 =?iso-8859-1?Q?A7Tp9ovaDMlsPmYDrG04RnTnyQAmB/7/2Nsud3kzrZvoOEVe+WRUGBCVrQ?=
 =?iso-8859-1?Q?Gnr9lUTCsbXZM02C48kOGWlb7wksiUAFNqWx07CkVRoApbNy8yAi74oNyj?=
 =?iso-8859-1?Q?+ggwMfZxxvyJteG472VZ5iC787htNcwj3prLamql8do4sKEKzbm0C7kvWD?=
 =?iso-8859-1?Q?3LbsWQsByPL2kaU1paoT9GQqFAS0iyUQ+2vqUJLn7gvLa9us/roS78ZcHD?=
 =?iso-8859-1?Q?GfDQS79a1fUjiEdr1Tr5j1TKlipT43o0Huumq93PIZyi20HrUT1EQsnOhD?=
 =?iso-8859-1?Q?AH/WDyUtZGQQ1LdH4TwWBCasqkpNyXBKVWcE5oc84deWKlTdOHkulz4L6Y?=
 =?iso-8859-1?Q?AfKYawYGq3BN2FseTzfW+Gm9Xx5upZLZOyodbEIjfmUz88SuoFwA7T8eHJ?=
 =?iso-8859-1?Q?EbRs6o89c2E+etNoMVZCFT1pafCrIHtw5Mb687ZmO6Vjoc+5YaZSVUN9xJ?=
 =?iso-8859-1?Q?3+DVyYJasS88Yys4HfV3gOamKcxBpn1TTDgjnaNjoYJZ4QHTLH1DdcuYAo?=
 =?iso-8859-1?Q?UmLjSrSOTotdJKS9hmqODOm92js7eROdq0ho2VwEcIrYe8K85fIdcxR4j5?=
 =?iso-8859-1?Q?LAalUMkNmCG+MGuxVFMSY2fl8mfYVMWX988dTkTESVqCN0hgkpHvOpH7r5?=
 =?iso-8859-1?Q?PNJzpRElJhKC0KavOb9kfc+0yZ2oW80BBCIMe4dlIqCb9LT5aRiQHmCKSr?=
 =?iso-8859-1?Q?m1sI3wFkLRR76tPZWNPpr7raNOWpsCpPWjChbXKUxEMPjMrtxnsACiCrje?=
 =?iso-8859-1?Q?D9nDJfTD80S2RM8odtsI4ppcN/pF73paYkeLpmSsd5CgBw5XK6Oad1qYWc?=
 =?iso-8859-1?Q?ufkP5T8Nsa6DUOwzi1snmpwXUs5++AE7cCqIDJjWR5/ACgS5UFrkgvmBxd?=
 =?iso-8859-1?Q?iY58KaHrhJs1GBgSvAWV+KP1zBNgmEQ29JVZoB2X7/PWSYQnyhqhMX3ZFM?=
 =?iso-8859-1?Q?BnValCJPFGLDS+q3hONTb8VESat8LDxpj9TyBMVnOT0jbH0eC+glDfNLE7?=
 =?iso-8859-1?Q?4awMb2EhICUmZ/UzDmj3sQw8pJMjisiB3HIq67SBrwRaoZci6aQPnvO2LQ?=
 =?iso-8859-1?Q?wjhjv8VISjro1VgR4E/CrqulL0Gc1bhCOBDpOhSJOuUa9cIVpTFoHCaqLU?=
 =?iso-8859-1?Q?Yl7w649eAg=3D=3D?=
X-Exchange-RoutingPolicyChecked: qo2e53Je1V9VqKfpD1Ag2bfQfrxSavPSmS8IyA15y4H/+rL4Z9toAJJlUji0eF9d86x22s1QvXrtPsJXw94FGd44Gc0rBW57tdxRGhFUcDiY5Yl22SUrWS7Ttw29FKvAITgl2gF71fdDeGlS64QlYDAZylHwF6JvwW9Hz5Tct7/f9nSyHyDITePDpmBAMbLgiY+GuuxJqGzG0+N+Gl2LbjyhMazcT2Pvvb7CwqpUybp8jfSNopODlj5a/1tKaKLljQRrvv5J5CmiysTGk6xtJkXSaIr8ZxICzjLmKlDCxjhG4kC7tpd/Yz5A98lDstmrNmo/WwGxMKSwCdmLjNTrrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9166b0d2-05d8-4696-579b-08def4b53ce2
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 18:53:58.2895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6c7LvN7rDlxRnBgBM9SZy6YFnIKjhxANkz5XIkaqgg18zx2FMnvt4b/QrEar+gzMCxUtWHjRX8MZUqTaa/zGyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD2F4A0090
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

On Fri, Aug 07, 2026 at 07:56:23AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add basic debugfs support for sysctrl. This patch adds necessary
> types and registration hooks.
> 
> Changes:
> - Add debugfs structure to xe_sysctrl_types.h
> - Add xe_sysctrl_debugfs.h header
> - Add xe_sysctrl_debugfs_register() stub
> - Wire up sysctrl debugfs registration
> 
> No functional changes, debugfs directory created but empty.

I know that we all keep asking smaller patches that are easier
to review. But as everything in life, we need to find the good
balance. In this case I believe it would be good if this was
squashed with the patch 3...

(more below)

> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile             |  1 +
>  drivers/gpu/drm/xe/xe_debugfs.c         |  5 +++++
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 27 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.h | 14 +++++++++++++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h   |  7 +++++++
>  5 files changed, 54 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 44ed055439d4..f083451608ff 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -127,6 +127,7 @@ xe-y += xe_bb.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
>  	xe_sysctrl.o \
> +	xe_sysctrl_debugfs.o \
>  	xe_sysctrl_event.o \
>  	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 8de78cd0aa03..666290d83bfe 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -30,6 +30,8 @@
>  #include "xe_sriov_pf_debugfs.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_step.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_debugfs.h"
>  #include "xe_tile_debugfs.h"
>  #include "xe_vsec.h"
>  #include "xe_wa.h"
> @@ -770,6 +772,9 @@ void xe_debugfs_register(struct xe_device *xe)
>  
>  	xe_fault_inject_debugfs_register(xe, root);
>  
> +	if (xe->info.has_sysctrl)
> +		xe_sysctrl_debugfs_register(&xe->sc, root);

Here is where you put the check if the fw is loaded... ideally...

> +
>  	if (IS_SRIOV_PF(xe))
>  		xe_sriov_pf_debugfs_register(xe, root);
>  	else if (IS_SRIOV_VF(xe))
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> new file mode 100644
> index 000000000000..0238ff093831
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <linux/debugfs.h>
> +
> +#include "xe_device.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_debugfs.h"
> +#include "xe_sysctrl_types.h"
> +
> +/**
> + * xe_sysctrl_debugfs_register - Register debugfs entries for System Controller
> + * @sc: xe_sysctrl instance
> + * @parent: parent debugfs directory
> + */
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent)
> +{
> +	struct dentry *root;
> +
> +	root = debugfs_create_dir("sc", parent);
> +	if (IS_ERR(root))
> +		return;
> +
> +	sc->debugfs.root = root;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> new file mode 100644
> index 000000000000..d1414ac3562e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_DEBUGFS_H_
> +#define _XE_SYSCTRL_DEBUGFS_H_
> +
> +struct dentry;
> +struct xe_sysctrl;
> +
> +void xe_sysctrl_debugfs_register(struct xe_sysctrl *sc, struct dentry *parent);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 66ba24f43017..d50a35fefb7a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -11,6 +11,7 @@
>  #include <linux/workqueue_types.h>
>  
>  struct xe_mmio;
> +struct dentry;
>  
>  /**
>   * struct xe_sysctrl - System Controller driver context
> @@ -34,6 +35,12 @@ struct xe_sysctrl {
>  
>  	/** @event_lock: Mutex protecting pending events */
>  	struct mutex event_lock;
> +
> +	/** @debugfs: Debugfs entries */
> +	struct {
> +		/** @debugfs.root: Root debugfs directory */
> +		struct dentry *root;
> +	} debugfs;
>  };
>  
>  #endif
> -- 
> 2.43.0
> 
