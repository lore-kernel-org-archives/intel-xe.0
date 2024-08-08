Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEB1C52D73
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 06:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD5810E044;
	Thu,  8 Aug 2024 06:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQa0/FGv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B15610E044
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 06:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723099662; x=1754635662;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0Yyn2RT+DI5ODtu5kGK27kBs9tHsrM9HsIVwjrW5j6g=;
 b=bQa0/FGv8fBofXcfIo/2a3UGBDAYwzT5J6ytYFT15gxuCJ1QJD1UcDcP
 JQhyChPuUb0MhjAh0tr+Y3YzS83bpRIqhmni+AwqhjwN6cdtWBipz9fXK
 9nyXpuFgH3A2454ncZXfTVW7qWhbHz666l+04qZqoCNyyYfLG8KLeLO0J
 SREyeYQSmtYel9YvoLfFflRSH2pK61wQcp8R1GOMm4dbIbUnI+08S6TeM
 H5VnNKowSuF5rz+x+t53jTRp5b3olpkxNMv1TCGVlEBnUeDqTA0ETdSnm
 QxiaQBSwRxBueOP13qPJHQvTmAsUsvR+/3oKqAtbfq4nXFAYJy8XE1OPm Q==;
X-CSE-ConnectionGUID: cao3izegTw29KV/OoTdf8A==
X-CSE-MsgGUID: L5mPAUt3QYKa28pHK7M2Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="32597213"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="32597213"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:47:42 -0700
X-CSE-ConnectionGUID: ToWvTOTQQYee4rj3S3EOyA==
X-CSE-MsgGUID: Fq/ane45QWSs+UUrfPQgaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="56805155"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 23:47:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:47:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 23:47:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 23:47:40 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 23:47:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoZcACOGSI1b5EMTTbj77dPLMCeWn8ziQfUQZxpouMD3HB1eb//urFQZqW1gmJiyRbQRO+30A7jMD0fe7e90ZpjqTPDoc2HhlaYiYArp4p1EV75BAbbdhUxG/FkrxuSQu/ZcSL39mdGMfaeGuxjx6ZP/BqN3xJ5BvS0Wa4FjchZ6ouGJ24AVJ8GyvYfTIasI99lHF1poZHMQVEuaLh2pQjyKPdPI4m8o0S9YnN7X85vQZNyrXQywBdqezO9RnxO6ACJ1Pi/CtByGYrGrrhoHkPTo8sAUOOrpwAbFcPVfRzCL72oxzbJ7DM/+AYrvI/2WjsCHezy+ZvFC8OFkzwFKig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fi2tv/0hDHtheN4aAXIk6IGUhhSGWS7edwdZR4KdlBk=;
 b=nkmP6+Of51Yw2Bmz0aryd1W3zHrwcNWsTT3155FBqqfWq5FE2kJ5vr7l2IchSDnD2ssLIFraXuiJycBHNDYRaDV7cClzraXrPdP4jqe9f02LsNs/etE4d/lDLY5BeMXwt8DwsO49i184Ncvp1tcmAhGaTmEM3KG4O7zidp1Bcxcu/GxKwLTVBz9tSTf0HhR+4Niv6N/FzC9W3x00MZPybBl9u2rKTMwqmN/aub1KIirDxOYQTI1qDUi4m2Lcp4X9M2heFPwW/HecL853Oe0lqwBXLuT4Qscw6N9uvng4x2LtwwByTL1hzWcks1tB66OK2Xc0AjEI1TUOu7ujDFSKOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 06:47:38 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 06:47:37 +0000
Date: Thu, 8 Aug 2024 01:47:35 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: fix WA 14018094691
Message-ID: <d7lncao7fhaksgmu7b2upxvdsba4bhhcmwo3wpwu3xy4wi2ley@ak7dosfjdprn>
References: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240807235333.1370915-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW2PR16CA0068.namprd16.prod.outlook.com
 (2603:10b6:907:1::45) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: 671f5a69-eca9-4710-59aa-08dcb775fdd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QdOnTmedVhpkzJxUmjUsvnBsnhpl03/dlHIzRxWLvMENPvaTX3PQ0+D+4h5t?=
 =?us-ascii?Q?3sGI1N87CIxZ9aN2oaCssS1szSQHWGIAT9lpZ+G7VAtZe3MxbWgBSYRYAK7O?=
 =?us-ascii?Q?YIWNJLbevVoHw85q/RF9+ixKd5doZVfTZWM1XEPtro/cwkZbVpp/BW3udPbz?=
 =?us-ascii?Q?lTgFFdGwQbv9UMX9/9cl/BSv4nm4nww0p14exGzBAel3ixEaHOqGdV2pxTX3?=
 =?us-ascii?Q?ix9PvYmDAxrp6O3mM4JhljQQuXzhuN31O8kHxcVZrYwgKqbMoyCUn+c6VoJD?=
 =?us-ascii?Q?lUDIwtFtigcCdpnurD2GHHXgglBBSTWf/96iRMuso2mecwnZut7amh9XEr/M?=
 =?us-ascii?Q?erGgfYnAYwJ/I4wTCnqatZ3OxOYXitZ8yfUxa0Gjl2Zf1MOjejxIU072dkqC?=
 =?us-ascii?Q?qFgu74FyarrGY9zpBZEe9lZ+BZl8mIkwBnlojgD0HwUbIQnqeb4XJZ1XbGoV?=
 =?us-ascii?Q?DSjLqZYBrcSc30MrQ57WBqsai+IvtYTGwTUGxsY02Otc0bwu0eMztzYkU5d6?=
 =?us-ascii?Q?zUXxjjLMoN2LvuZ1rztD9W7tKR1zV2USDS+N611esF2TZxTCZa2feuqtgHHZ?=
 =?us-ascii?Q?0Bwa/XPl/R3dCKeIOtSoRZHcGvUTnKJ5uRR71aX1o6UNkEmUNTRaAIkY5Cmk?=
 =?us-ascii?Q?OhSkHP+L2MgYgmycfMUkdB/yasQOqGCuf4sDhumD+OtNZaTf3J7Bkym+TGXz?=
 =?us-ascii?Q?VtpCgQhT4uSsHOR7OaAsrdZV3vj9bHKxmIIJCIW91BgU+FCPKQgjMckqIR8Y?=
 =?us-ascii?Q?NuzRdhQrZEpfueRf88CUBUYz0fKUgcffeXHE0ghAuXwsgyiixPWm/ZbFI88O?=
 =?us-ascii?Q?29PkW+xp0Y+0nZF1nWETYunwrhwz6SRUOBu95RmjgoM4mNHE/y0tOB6NOkD1?=
 =?us-ascii?Q?qdHTAzt0F8yghx4ZZqTKCNiClbH38XkbuYJjU7UGiezBwcby3Zc0lgEWVKdn?=
 =?us-ascii?Q?GXfd9IbKmUmw26x5+AiTurxdHsfsOJ2I701jo13oq2nFfXuvP1oVtpDvlNfI?=
 =?us-ascii?Q?cYecwJHUVC8Q1WcB7wF/cvMn6DOAV73T2tnOz7aYiwK7+0vJXkiOhZzd/kmq?=
 =?us-ascii?Q?Kvt7cuiZHc8kR95DBo4+2l8MGtAghOy0y8oYvsEwJzovZcBIitCi6c6Przt1?=
 =?us-ascii?Q?NpP8yh26L1HKkirnzUNNjpTuJMj1YHD36KPUDgGGrL/zYTYS6vjCM3qMzprG?=
 =?us-ascii?Q?kyhqTrrRDThIdiGKsxE3CaEPVz7Ksysm73RWBpxdkNFtbqMeezQBEkqxeCMW?=
 =?us-ascii?Q?/FIADAvxJ+g7xOkYvf9+tUdJvLMTHWaSopLInoSPSGYQr2F1INj+DzoyYhJB?=
 =?us-ascii?Q?+p9X4Y7Lk40b8jMEHimTs9naZTx2UFBkhfWA8FMs6DgtfA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VFp87f11cEIx44XggEpVGGWNw42UvepVNAdpcovF6DbbpJR1xHgqtnlxQZrX?=
 =?us-ascii?Q?olJF3NPfhztHwZVNHDbw2xu8VQTwZLBblCNTg6TTxglMSJioKpovDuF+WQHw?=
 =?us-ascii?Q?wi7OFgT/58M1gS3LbyS+VvBHta8jcHlDxoUhz3QNVKkj7q/pYKwR2FEQ/H2y?=
 =?us-ascii?Q?EL+y3LKWhnDvwbrS73O/UGsyU0hckezbuv+lDh8+pn1ThhfMVhQZULQd4/rs?=
 =?us-ascii?Q?UhNOjgjHfJM6lO1MqiGzZJQJr751ToUct4WTqUFN2Ev4dSStRrKE4tmTNbtX?=
 =?us-ascii?Q?UTQTT69HKA8l3qhnCr4F88mxiVcZ155tsLHTx+Gf222MQhD6D6Sbi9OvuYgS?=
 =?us-ascii?Q?CHvWh1N8/tW/w3wjOms3TVqNwQANVKzSEwVc894ktLQ1LDvStEE8TYjN4XP4?=
 =?us-ascii?Q?kJmtJgz4zU3AJHTKoYv2PKlutjAnzZ8lJK8Pca29Jq+GuQxbWy4UPhdh93ZX?=
 =?us-ascii?Q?YGM+ylRAyqVN13DfDmrwfPms/D39mZm1k1XAtwCZYBx8p0ewbbrCUrDkZaqe?=
 =?us-ascii?Q?kSAijG9IRzagTWAQvuJTGJV7y6enSa6zjocSSQnJcEp+gEJrAv6rlQxOlGT4?=
 =?us-ascii?Q?jBJZtg9+zphUATQ7io22GlecTBpHR07blTa1BzsEM5RvSwQE3i3Sy17kR55b?=
 =?us-ascii?Q?Upeas2NzxNhn6f6KT9eUAujDQLdydVH4k4Kj0e3J98aj+d4tLRz637emPhBs?=
 =?us-ascii?Q?rXhQ5n5ZoV70hpr72MYYkWf0ixj4DfMBDMxZTJivHM+HknBS9uYbbHcUGjm7?=
 =?us-ascii?Q?PpcyWKHe78QiYm9U9mlCdTxZhae8ktO/RIZ0iE0WbQAYeIzdZ4mGyMLR94KU?=
 =?us-ascii?Q?yTMT2DYCHs3pHR2o06zwBbqVsk2bpB97I3hvE0UVW6eUMPXhYmnIEZzYC11W?=
 =?us-ascii?Q?8+jEWqh65AEsfHBbHEbCXenRl+pKchmhDwLd0Ho75Cd0O+uqKX/4e/A9Qrcu?=
 =?us-ascii?Q?It6FitTOOiZt/O9qps4aXr2dBn8sTt07Y/T50IdRf0wYGSL1YozDruClWDO7?=
 =?us-ascii?Q?9SM+6cmgSPuGtXzeyi6rX3wiOCW620cz5quPGXON9wkksB6699FPWxLvakzx?=
 =?us-ascii?Q?YIDmAoLZclNuBxEOhve8B1z6FzaE/MmrmOi0JluRXeXiO9FudqJevECsrcIR?=
 =?us-ascii?Q?jK11jdEB4SOh6YmCO+Odk5VyRspFexlZn2qLPLpKESMUckUgKIno51h3aBaE?=
 =?us-ascii?Q?LDK0xhB49Igen326xlRoPR1BTqejqYqm8STn/N8kRS6FeOOXV2hNHxRqMZOt?=
 =?us-ascii?Q?vntEZr8yh1zlyzdHxxCfSz4+i0nk+pux9B7l/ihY5VXfCYpLdKS4xErcW/1d?=
 =?us-ascii?Q?N776tm+3GsPNXkUjl3qhiDpwi/Dxiwm1IePvcCWLL20N1+M8xjJA/3JYCivX?=
 =?us-ascii?Q?VEYrxPRCXQHdE0P44+IwBBuxobr/qCIKmJtbS0LQ+Gwm4dPW9H/22wlGVKWI?=
 =?us-ascii?Q?3G0w7xWqpsVlqWmXmjpo3eA8TA1sIDJbYKamdRQcMHFmQXmFdHWR8kImbJCw?=
 =?us-ascii?Q?nJspaGpD0P/nP2C+ZUdn6gumu1pDEx9d9r7QkAsDTzY+Xf2bKodcPgTtOb4R?=
 =?us-ascii?Q?G6+qm4m9Clty+5Qk6Dz9gtgbN3/FyF8iCuy5o7olWS8SrMCqF0CpSDVZIsH+?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 671f5a69-eca9-4710-59aa-08dcb775fdd5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 06:47:37.9111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aec59+MrNHvqRiPIoAaxkM/ThBeT+4a3gEurn31AjnafPy+411j7wAkthT2uj705UrHDMxUczEfdsByG1q0G9aG0CSE44PDMpYiY8KE3fGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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

On Wed, Aug 07, 2024 at 04:53:32PM GMT, Daniele Ceraolo Spurio wrote:
>This WA is applied while initializing the media GT, but it a primary

							 it is?

>GT WA (because it modifies a register on the primary GT), so the XE_WA
>macro is returning false even when the WA should be applied.
>Fix this by using the primary GT in the macro.
>
>Note that this WA only applies to PXP and we don't yet support that in
>Xe, so there are no negative effects to this bug, which is why we didn't
>see any errors in testing.
>
>v2: use the primary GT in the macro instead of marking the WA as
>platform-wide (Lucas, Matt).
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

typo above can be fixed while applying.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gsc.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>index f8239a13fa2b..77ce44e845c5 100644
>--- a/drivers/gpu/drm/xe/xe_gsc.c
>+++ b/drivers/gpu/drm/xe/xe_gsc.c
>@@ -260,7 +260,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> 	struct xe_tile *tile = gt_to_tile(gt);
> 	int ret;
>
>-	if (XE_WA(gt, 14018094691)) {
>+	if (XE_WA(tile->primary_gt, 14018094691)) {
> 		ret = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>
> 		/*
>@@ -278,7 +278,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>
> 	ret = gsc_upload(gsc);
>
>-	if (XE_WA(gt, 14018094691))
>+	if (XE_WA(tile->primary_gt, 14018094691))
> 		xe_force_wake_put(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
>
> 	if (ret)
>-- 
>2.43.0
>
