Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694ACCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 17:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29B8910E03C;
	Wed, 27 Aug 2025 17:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1FV+rxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C225B10E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 17:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756314230; x=1787850230;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VCQS0AgtK0OtpPRI5CuMahWKVLR/MtM1N2FVG6TWdhs=;
 b=B1FV+rxIfiXNGbjh9uJVj0CsIq4Ag+04eFoKpClVvVsLa5YM1Mmvv/Op
 ZHyzJy2rhAbjMaZqHaG8xgXC+81AjFw/iPx0kdfl8qiyCwSAXGguYf8z6
 5n1kvuMfiJeP2TbqmJh6ZHUa4MOjvqT9XZ4RXRDY+8guOQs+mBNV+XCXa
 GWjhaCGLlUCm8fC73B+tiCwfFup3A5kJAocpErg94Gud+UFzD4Uop6Njb
 Neld9kYdOGfD7haRd1ipSeDOINfmhPjkVXgQLsJH39CPdeU7fiI2LApOT
 VYiV2R5FRLg3mePGcWt6h0sQp82rm4wa6pKNZykf9X6fXQg3LoSLzLu8T Q==;
X-CSE-ConnectionGUID: wkvFbgsvQ/GGEpmnx38+wg==
X-CSE-MsgGUID: qk8s8qM0Trqiqm8YciKc4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="58667547"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="58667547"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 10:03:50 -0700
X-CSE-ConnectionGUID: BRDOvuFBQdi3VyFprtiRtA==
X-CSE-MsgGUID: oEkbyUowQCGnGs6JQZcxgA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 10:03:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:03:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 10:03:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 10:03:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKyFtUTbiYZrn25CEQZbSbVAT1Fo8/nplZSx0QNmMhKNv+xft60YZ3LY/kp6ymPT+YU3JURcpqnyXLNOGawTO5V8XLcswT8nEyQxXO6dXJxZhcvXCbFnf5CxTDy1XUx29IKAZFd7Z2iS5W+PABqfhZrwKS8feJwn5yIzMvo1jSa5TWYy08LynQA2vGsWBBGxkndCARLDKGoAlWabarzx7mxabkUGUP4XJgjGYTdZ5xceVOyUlavH7bZjKXtRNtfxuumwk31pwEPveV9M+OqHKq3UJBMDUtyje4hIv0Ucn2bpLS4gBenc4Te0qumYPR4RB2vAm4EfLWN9bYd5xfNtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoO3XL8tGkY6C3/JSPXUjThDbD+n5yuGZYqSK8fnAgE=;
 b=gtKiSZ8nPvbXb4UEfKeXSBbEg2AjjBnFmEFR76jeSFAg9+quVo/+oc6r1FvHyjt5XF9THtP+AK587zchzrNG8ERMxm0qb3xEayTRqfn08H3znT2bKN9lqo0i18gBF29HqQVF2JHRxLllOCjjMSxJr6z8z75E+bzGwd1A5TD1l1xZkSW/ZVzWsREVsbymanmvSKOeFWEosgmFJAUFFXRiagztjCp6X+O9yNhPR45NojDHvPGUKJt0/68ZtfCJSgDd0KQd4m7Nc5ucwHL6sMipwByt8aJVWvr1h9Cv4wP9mK0h8QKzfyM5m5kYaLM140x0ZVdn/NLGuWVeIr7+N8lLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 17:03:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 17:03:43 +0000
Date: Wed, 27 Aug 2025 12:03:38 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zhanjun Dong <zhanjun.dong@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH] fixup! drm/xe/guc: Add capture size check in GuC log
 buffer
Message-ID: <tqw3kju4valjd5lfj565ls6q4jchtjq3iljtac6kp2i42cpugf@qq76skwywzcv>
References: <20250826233035.860363-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250826233035.860363-1-zhanjun.dong@intel.com>
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 73fe2b3b-4ce9-457d-0391-08dde58badaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rK0cEq2SfkjtNysbo0fWG4jkFojm3GWYmgcEkmp7JILMFmXVlttFCvuEbcpP?=
 =?us-ascii?Q?mrWDO6aiBmSb8HORg3ASm0M6aVB3xLOx9lnKPtkWuFCVfA7NJFtecek0AbEo?=
 =?us-ascii?Q?/PcSIdx1CZRA3rj9Q9tSj7EIX0xhqLqZysAFdPSiSrmVqSNOA49uKK2hSBfj?=
 =?us-ascii?Q?mRVEr2umBy28LL7B7vbelUhdbX2Of+3oXrLhodKY1MQeZgLEk2g7Sf30LLCD?=
 =?us-ascii?Q?P1o5p6jpOvljCVk+yLpsoJ8eHEBeEHjCqHsUKiAyviPnZeHaW/gv4lLGrkWL?=
 =?us-ascii?Q?gTy29wHvb8Ceo4otXTfpH57lPe2QQvSHBnd3/Ar3NVpEUafKnZt351J0XwMG?=
 =?us-ascii?Q?wz0oYNMVMqrqhB+5UlDM+3pTYIfcAvcbvJNHa/MyetwfQL+MMbW4QI7Rjdgf?=
 =?us-ascii?Q?d3EvwIzKQU/zXE+epHQlf4qawI5cH7IMuJ/APRyIHgC9DF2k5lI3x459Rc+F?=
 =?us-ascii?Q?cZPH4B+oj2H/qnYcNGKDstuL7BdZol55EfQFYCIMMT8S3d9twGhJDl3X+vJX?=
 =?us-ascii?Q?4z6Ryhvl51YoljzwUFIQI4lwzM2RXTSG1do9U72bxUmNzqTz5WFTzI93iR2r?=
 =?us-ascii?Q?wCgkg1V5mEMzZgONYekpjP6OouP34WQZZsXgEXkvwnXIkiXp/u6PoRurqOYI?=
 =?us-ascii?Q?0vDgTaBtYzUbTyZlAnxGL38Nd4vF1gkyxprJK2EtcqEpeQe3KN6/GSpBN0fM?=
 =?us-ascii?Q?G117sPIfnpQzQxsu9GeAIPmpisXRA7s12CUjBy1oK9l9gkJ9dnKxwP29Z7bj?=
 =?us-ascii?Q?WAmJO4ldfyfFSFi52kEVIPFbsCod0ClDb378IbIMtIg/gdCBma4FZleKlAHQ?=
 =?us-ascii?Q?rsFKpuJlLMGC3M639A3kZjU7pGUKqJ2C8/sJYVyaqLPRjZJCndd1OQBw8M9l?=
 =?us-ascii?Q?hqlG3erENwA/+SJCkuQnpkcVXMELoUi37XCLWuh2zpEP4yPMqEZ0HemU0nvj?=
 =?us-ascii?Q?S7KsFOrkUdq3SEcrTXiqEKMBjgxSDLwOyL1fim6AOotMkGOPgC9yg7owDS8A?=
 =?us-ascii?Q?0Q/cbXVfPFnhUyVcQIM3YBYouYta9NPjYCe3V2gOQDHISsOWt7qy+raM35Np?=
 =?us-ascii?Q?jw3rtouKevzt2hm0ZAu+eU1NG23LJYF1bFWtj5QIU+flrN8Icu9osMQwAvz1?=
 =?us-ascii?Q?oJu8auJBH853CMR798B1qREdQqQe8wTGWH06my+NwoBwgi8y3TmoXMwULUST?=
 =?us-ascii?Q?vYrXdY615p5CcLR1ys6jEsvheILOWnKxBt+ptEqDH6jYdIvse1XX2gwJMiK/?=
 =?us-ascii?Q?/IOEXzAI3yUmJrrce17v1iFzd+MBSwOHn71gOCRJGV5wRYQLfONXX4w7Hngt?=
 =?us-ascii?Q?crolWTDxKH6G4nB26C01xw1R36uizenm0LyTVNdw50pqZmiQ8AYIIpWpvm7t?=
 =?us-ascii?Q?ihpA464bjPFnzgeLAEAO4zTPsuj5kyw8ZYTs7MXnifQFB1PslA+NlV4orXSA?=
 =?us-ascii?Q?R9t5ckuevAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AOmcCgcFt5HMfpmMMIA9fSgX3V5O05vmT21KqUy6Ce5N2zvnQvFI30RbDRgQ?=
 =?us-ascii?Q?sO7MkTPCwApr1WnMgQzzMU9hFhrDLztZ2sWzXEDPhfSgOXN2Q5AM1tSCzyRW?=
 =?us-ascii?Q?/5lhh5ffWEDAHQyUYKepWIrIUfYdxrr4Fbfb/zSH7+/9BZiGffDMq6/ChiHo?=
 =?us-ascii?Q?TDcinpGSL8by2Me2gPH7KI2m93jf8MMBJ2jaCP0pYydHg4cDe1KdjZKawEcO?=
 =?us-ascii?Q?O0yrS3odkhunl2s0GE67DTO3PhzPEP5M6Azb+GfhfXCK/jxXRf3LREihu/lv?=
 =?us-ascii?Q?9tAr61c+mdc2Glz6C15rb81OvPZ9XCWRIxjxis0I4/+lo0S2GzcMZb6nwssE?=
 =?us-ascii?Q?y1MqasKgPWVjRbdEKfkDLMx7kFcVPjyQpluYSfEGnQXpZ7NlzvhzWOI5Nron?=
 =?us-ascii?Q?zXrpWQiImslPHyu/qIqZ/uoSP4S1KmJE4mDvccGjBebXoO0xGsw2PXIfcz7E?=
 =?us-ascii?Q?AB58btUiB/UUVoIoyftY1wiazf97iRKNHVHd7KoBhTxiNI7RgEJ5ulOASmQG?=
 =?us-ascii?Q?NptYar/ZgakrB3vSr/oZctuh3PFoBdX3TuiP9R+rRrVfVmb4m/Ot30rVU4Ut?=
 =?us-ascii?Q?+cnsdpMBVsKjMnfNGTXeG8tQM5xLWcw6Zb6oe5WmbzPB93ebM31iRlXhj6Du?=
 =?us-ascii?Q?NiwLFq5LfaolP3UJKzvbgpSb1edoc6adr12DdE7QEeo94bE9L/X8Pb1er6Vg?=
 =?us-ascii?Q?MO39hTkTObQPpG1R7Sm5Xmcy0bkhfFfLdHaEgrFgxKME8W9rJrAqRsjnf/fq?=
 =?us-ascii?Q?86hSuokRSdlSgh87ud0WyhDAl9265LUqQFv3frLPcrkEHuxfwKkCVBGjkQhs?=
 =?us-ascii?Q?b0jo2zEXqDL7IqfaZljaWmlxqmY1opMoEUuUDD2kKRR/998TElvoe/aPF+Nj?=
 =?us-ascii?Q?uH3iaoupA61cfevkcNHa9MYf47yC18SHlwWVQup4HcM37dazH9+zIwZkj3QB?=
 =?us-ascii?Q?HSHhCNyOccVPxILmkBm1Qd+Mrv8kV3J5J8n277dW3EG0abKFyTxwFg4EqayS?=
 =?us-ascii?Q?UsAHd36v9sUOzsVQEybhk02Wel8cPJbXF+mL9YldBbP0A4fsWuGnPW/vQg3w?=
 =?us-ascii?Q?RfkznpJEzPetoJYXX+DXCrJx3rC4V1zC5z+uK/tXR2NLbOZcHC1BBHREGWCs?=
 =?us-ascii?Q?hEjcrWexRGNRVwDuYKFE9JrJm/OFzqS4liBjLvMfRzH1IqxXW2HVotp8RVJO?=
 =?us-ascii?Q?iCHXk9+9d9g+OKUjgHout7R0iiNTIAWuan8ATrZyDO8macesuNW/xtbuQe/q?=
 =?us-ascii?Q?fB8LCmUHf+isVWCcYhHUUJ0eelgoHwmaXt5WrOExFbeGQRQkQgCeYtWbhuvt?=
 =?us-ascii?Q?jnDK1/vHnVyJWLQC0VXJdxfhRf/9Vq4dqbiqFYurVspPpua7+oCVtCyFS2xk?=
 =?us-ascii?Q?S7ieT8XJjBuC20wdqXQit4ivu/q9lQ6IcUcHmpc0I5SwN3CNVTZRnP79ONLb?=
 =?us-ascii?Q?uFSgWPt8U+/P2PlrCT42KkOxlQcJ3zDBiTDUQup22uUC6bUeBDKmpuWodGom?=
 =?us-ascii?Q?qfuucLOBI9WiuP5tErqB2+BEKROPq5FNOFZtTbgFOGc0zezG35gkLhR+fZUP?=
 =?us-ascii?Q?19XCCbEkOcCbMIG03CAp5XG5NneIHKot2+I7/sto+jEtiPFjx2KotjrkIZG+?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fe2b3b-4ce9-457d-0391-08dde58badaf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:03:43.5610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnLBwKHYNpIeCQdw8niLi9/oDeHwI/wYEpHui7E/rFKfdKP51vr6fHIVQSElsHz4ufGT4Dj8iIOUEOgLydu8YgQar/X/yrjRPlwqXmy98cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
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

On Tue, Aug 26, 2025 at 07:30:35PM -0400, Zhanjun Dong wrote:
>Fixup buffer type value, make buffer types equal to guc_log_buffer_type
>in intel_guc_fwif.h.
>
>Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

this can't be a fixup, should rather be a standalone commit.

>---
> drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
> drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>index 554630b7ccd9..b1819679fa35 100644
>--- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>+++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>@@ -10,8 +10,8 @@
>
> /* GuC logging buffer types */
> enum guc_log_buffer_type {
>-	GUC_LOG_BUFFER_CRASH_DUMP,
> 	GUC_LOG_BUFFER_DEBUG,
>+	GUC_LOG_BUFFER_CRASH_DUMP,
> 	GUC_LOG_BUFFER_CAPTURE,
> };
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>index c01ccb35dc75..470c83ead543 100644
>--- a/drivers/gpu/drm/xe/xe_guc_log.c
>+++ b/drivers/gpu/drm/xe/xe_guc_log.c
>@@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log *log, enum guc_log_buffer_typ
> 	enum guc_log_buffer_type i;
> 	u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>
>-	for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
>+	for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {

other than the order we process it, there's no actual bug, right?

Lucas De Marchi

> 		if (i == type)
> 			break;
> 		offset += xe_guc_get_log_buffer_size(log, i);
>-- 
>2.34.1
>
