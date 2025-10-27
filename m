Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743FDCCF9EA
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 22:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388E810E1AD;
	Mon, 27 Oct 2025 22:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIY/nNTI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EDA910E1AD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761602660; x=1793138660;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ifNc5yrHdMy499WsETnapMZaH9/iTloS5kcXQiUiCQ0=;
 b=HIY/nNTI/FIdDq61OxkhPz2NLwGDtIGPxjCz9D+bXyKYUCNLyWUSegXl
 XWPa/kB/7uRVuMX3EG6rv3sg87tEzMBq2pwllYbN/dpUKtutMsb7uHU1x
 n0HePFfDN/8oha3ZtsvQ5pQSmwELjyKqzYifSgJFzqn4hAPEFLq2f/4yr
 IXPxevP7waVJ8+BTML8w/m3X0eIbonaCaoLWpYIo2O5D+AOHxkHOyAwLO
 /K1sno5tcVRjyr88dhrPjpcUI5oRbRtvSeP7tPzuoE45bZOh0FVBZQXOf
 ZzORjAiAH/cPIiUWg1yQ49yzFgMr8RIJ0cBhNLIxsEe4S1ea3S2KFtFE+ A==;
X-CSE-ConnectionGUID: BezFuCg5Q6qkDr0kCLeSpA==
X-CSE-MsgGUID: uvJcEFinSDq5oavYceKfLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63622097"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63622097"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 15:04:20 -0700
X-CSE-ConnectionGUID: LGzFmiNxSCCiwhG7A7cLtQ==
X-CSE-MsgGUID: dyspHHbnRNieSj+yucEXxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="185632156"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 15:04:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:04:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 15:04:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 15:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYSgwErKgFxiehsKFBGh1nNiS/EDXsQGY9jma43VeVyNmIsgt/6e0ipmraREYDlAJCDjTtYqFGhENWjQAx7H5aGDwO+bHRNzqUhKxK8szLxJEkcVZuYA+MkV1OYBf6RENnffMU+RvPPRBQy1HxUHY1Rmj+5cc/lZJL6Kll8yujzv2jeeNFIn6x5Btbvh4K8hEHOFOO3plUn0MQrQtv6twsVbuVLUuSYvPqLQtUyhRoxsaChnIKw7xkVnWI65RHs5KssIky47eeNlZuB5nsB4y6fQyBZqXlB2KudE9hhS53lnp+GKOmysCAeAedVBKnd0KN3HblWgaO+OUBJ6SjZveg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xERVPtLnabqBPIIyHhsCTju434Wuqnr0mRhOK8NKOjw=;
 b=eqWcPuKLkQVmrjVnGGDfTWe3CLYemnyfRsBj1qsu9jNAH8Rnx+MGwqkQjShjVSR1kkpQZhS3rxJJz8aUw0YuItshRXsAK9an47O5jfL8bHAWk7k+MC73Bnd7voZ069XAbSE/+e9gmQ91JVMyo8N0Jc2EXrtkuxmdNDAL9KvW++5cj7tr3Pjdm8991aa7q3ltr6pNSxqgcnCvX4tua7JVgCkd/r2BK6bz9USW6Dm0Xh2EQ/yVJYGswsdHPhflSKOuv6+JuIWEC8v6C5wsgLI3En08Jrqmk8tdW060/MgEaezRZUnW+YaoUI1qCuxktmRUnVdFLvHtC3Hu5d6RCcUAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 22:04:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 22:04:07 +0000
Date: Mon, 27 Oct 2025 15:04:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@intel.com>
Subject: Re: [PATCH] drm/xe: Fix uninitialized return value from
 xe_validation_guard()
Message-ID: <aP/sVL0juxf2YjIw@lstrano-desk.jf.intel.com>
References: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: d92fa163-70d9-457d-5cfb-08de15a4bfe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jgi9iMK1p82G1dSwyo6sFJS/8Dl3dFXOKrkdCuMW/9Y+NyVe6pxQl23r/7?=
 =?iso-8859-1?Q?eDOc/p1Fzyg/iMlOIlMyQvELaAta8NgKAdI5V1ogfjaiq5jll5m6NQsQBa?=
 =?iso-8859-1?Q?hm2uBlpLuYe5KO9OekHjMvgwq4p5EBmltXuhUcPcQ5m/m5Cu9UmyRtsQdy?=
 =?iso-8859-1?Q?zdLGC7qVeCfyPzjM8mNbV0Bq34D0+CVFA9GCUir1DQIfjhe6bkQfa7kULG?=
 =?iso-8859-1?Q?b46B6I/Gx34xa1jfudGdNfwQf/hviIgaxh89QEGi0lcI5YYAA9Bb2K/jWP?=
 =?iso-8859-1?Q?lA28fzmp0jB9SliHV0RZCX8ea2n7nac7O35X4tWj7NH40qx/pHSUicVosN?=
 =?iso-8859-1?Q?l9v3/hgNGrC9/bRjaRLpnJsY4lBPVjs7hO8HGatw1AMrjQicOHYFKSrkoF?=
 =?iso-8859-1?Q?c2HP5/OwiAyaAsnuW4wf6C1vNyBetK71zya/9rNo6Nsh2b7b1n8L28dGSj?=
 =?iso-8859-1?Q?cyHV2HBzVy4yxme3kd4lXDXLh94U6qqshLlgYd7SNOa/2Q9Lolvs+M5L6D?=
 =?iso-8859-1?Q?artkWfkPiOeIArDIRHnIRUj9EFHOVh9bFic/XmUsbgVo85c/EEgHbqaOUR?=
 =?iso-8859-1?Q?+XTo8dIDgKTnAxPdGtX0TuT0atr+xojXtLNw2EXDUHrIYBoZTMaKOeJ1vy?=
 =?iso-8859-1?Q?E3Lti45cOLAGc6+fytGJhqKZ4UI+Qr0kO0h0nsdhVjTsUmiE7x//WvqFY2?=
 =?iso-8859-1?Q?/jrEjZTTcsE17L6GqxBlykmaZ1dli0tAvWn+E2V5Td5NCAI2eSIggaWrq9?=
 =?iso-8859-1?Q?guHrHMbybvAJohoSW9cxeTP/AkTXr163q0g/S6N4ioHmdunx7H0z+vu/ME?=
 =?iso-8859-1?Q?Z9YjkOga/SoEGuDpX9/LmVxvrAXm7+0KjBeiSKz2AXstS9Y2BLGPcHR/0C?=
 =?iso-8859-1?Q?5A3t1UESu1RclH4N4OkpAhJXmcEWFttWdjEL6S2MQhSsMXMwf1mSh8zeBI?=
 =?iso-8859-1?Q?G11YORtZchDi+l693hEknv5gSwxAyOrbPcr7+BZOBcd/gBN8MEgShrnt98?=
 =?iso-8859-1?Q?hCmKG2oAlY8S4JRUX9Wpjpb+enkR6Lk2laQlcf6zo8Mer8ix7Q77nYx4L7?=
 =?iso-8859-1?Q?ej2Yn4GDWu0xGpd1oeN+FHFghOBcK2ZEGo1XPRh/aZRVu8/6cR9W6dZIcB?=
 =?iso-8859-1?Q?KhvRNTRByuHVOMftmBBfv19HE0EnEaU1ex1fbC3piGXdgSMlGSQY3tUneh?=
 =?iso-8859-1?Q?OIViSjyvM1WVh3I5ec5l1lLB99SkyInmTSeoijnOfBrpk+676nzJDgEvqb?=
 =?iso-8859-1?Q?HtyxKRTHz7O78BoDn/ufhb5lscUOFr+RiwZ4B+K6OllWbLk+g5+jvkOARu?=
 =?iso-8859-1?Q?pR/9exvc0/6mv8qbC0Yw4pkHu4camGrYL6qiJjyMhpWGfsfLAhY08ajiF6?=
 =?iso-8859-1?Q?WKE6WIL3iij0sUiYrFZx/ChyjwPXIMKHKXXQSwEgzmdHtFaBKoCC/uHsMn?=
 =?iso-8859-1?Q?lfKVQOw+9fy5YDrsGxNQ+CoLXR3SvAu4cPW9AuyvTKQJBTnTVTrmPlJLox?=
 =?iso-8859-1?Q?IlIZEoYgtw5gp8exxKq8fo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?QzTUoTwayz8N4+4mGyG0fbkPq40XzUuhBRHunAbWNi8n9ZHzVSroZqeLLk?=
 =?iso-8859-1?Q?MmkFVSqi1fB579FStGPekGDsMm13lXeXtx956otNDTcNJHRU5HatOin6N7?=
 =?iso-8859-1?Q?kChPemL1kOEiCpIIu2qwjJdPYwSWE3/rZTdlL2IujIujbWtwqRC/Rebgyy?=
 =?iso-8859-1?Q?S54HhpAk+iN0NlPE0ssv4Y4gXOEn2AXwc7QPGkqMAGsW8nmq7MFfZFg8oC?=
 =?iso-8859-1?Q?FLn6rj14yFLiYBdhtCCMhlshH2a1OuPnZLsy9WGB/pnGV494y2+2C7PJ4T?=
 =?iso-8859-1?Q?tfdFCyGwu5cLSJ5Ieau1dEFkaeMq3VQ/tgpWpeTYKRUMU4wNwcnlRDTCqV?=
 =?iso-8859-1?Q?nS4K28Fv2q+YDJ1gRFehkdqLdeE97d+ZL4NqDZpNGw3g33ZfWMD9+ru/be?=
 =?iso-8859-1?Q?1/XP3KIE+YW/eQVwr2c0nF9/D9tHIIVeTqgmuTpm+CTYpEJEDlLt/wLffh?=
 =?iso-8859-1?Q?wm7t5sRVQ0XjHHnez+XeXKKpsahZ8wBZwewYkbGaHtuM9yGE4hwxSEZqDH?=
 =?iso-8859-1?Q?u7T68eFv4wwfLmPOGnuG/Jh73xMUf3Wk2ZUjAi3AD/MEvmcGbV8itfYG6t?=
 =?iso-8859-1?Q?Pmg3rtqaxNajpW/1StL6E0hfWhDUEf26BAPu0gxQGHS2A68D3+kaDDaNyD?=
 =?iso-8859-1?Q?avEsQOxWIqq4gQKPAwQkEmAoKoyGnxcUW9DQnNze3tOR3y0XEnbeGO01uO?=
 =?iso-8859-1?Q?Uhc1t4PwK1nhytbEzybkiw/Ejq8+9/fNOM7Y3MG7oeGBGn/zVRSdDGZZLy?=
 =?iso-8859-1?Q?qTp8HE79wcgWsAfrJhUvQPr+v2uqnV/fCvesGfOemNEIpVZK/Ap6Zf9AKn?=
 =?iso-8859-1?Q?EGvGva73bEkrzyYOuEirDCGzHBZat86Pa4SB8cIl7WaPLL3KPz1AcSPCi+?=
 =?iso-8859-1?Q?OiztC8y43tsG0ie7k+GzT+Rs55dBc3I/mSJGhOIbO1WwFORjoLhBM/SVSa?=
 =?iso-8859-1?Q?YEkC/tBQXsvQz5CwX6fqV7G0+MwrJViBumaRU0ljZgXEk33n3T83z87Tsr?=
 =?iso-8859-1?Q?lxnedlDvTYlnZ1C9ym2V7qzWX5PcHqQyEd/DkfvIF07BXx+WN9rql0WLvV?=
 =?iso-8859-1?Q?Fv0fySP5J8yXCuPF9keuVy3vprqI80koK6s9ByYJBmonsBb9kOVEYXQPig?=
 =?iso-8859-1?Q?KTAYdEys9y3eOszBsArvQQ+rswJQPmVAIZG8uUNa+/1BEVm2hj0X3fHUW4?=
 =?iso-8859-1?Q?Ut2I76LdcGQKqZJvYJytojg0ksaOIohXsBXcfmLsChWYzGd+BlWXN//27K?=
 =?iso-8859-1?Q?+/Cdobc+KYVH80eTCCh66ozZK6+REL4VgkS7jDfgjne7M8+jnxjWOZ3u3Y?=
 =?iso-8859-1?Q?zKMlBmoIUgXSGBSEWf/n7I7I87S2YY96ONtIIHv9nAXffj2Ki7E47S+Dl4?=
 =?iso-8859-1?Q?HcgXh5Q/pVM7oJe0haNCwJd9c8VSHbZO3AM+TtJO+TsPBAMeS3GsYj7cmE?=
 =?iso-8859-1?Q?HSA5TtAKFzvrjpnTy17XV/wiPHe4kNA4WoG0wM0KLLwybn6mVBUIS/6n3P?=
 =?iso-8859-1?Q?lHSLE7ejG8y7uwkg3gQ8CvwWCaK2bDomemyYlBLOBbWth7h8Q7EvLp759M?=
 =?iso-8859-1?Q?xyU/Q9utwqdE2lkDIIq8TqDE+e3oraTHcB9EGWttDkVdOko1+141Lbpg7F?=
 =?iso-8859-1?Q?v1IKMp0jqj0C6WS6EH5TnmGGaLRDA9I8oGQ2CPXfYYC5p3Qa7o8e3/PQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d92fa163-70d9-457d-5cfb-08de15a4bfe7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 22:04:07.3437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9KBmz8pgRRp2HaEV2VRzYmGkbgVLhlNaEADY02NYDkklXzer5FZ5DfIyT+QKja1SFD3ZzQvHc6EndFHb2+LchA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
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

On Mon, Oct 27, 2025 at 02:12:28PM +0100, Thomas Hellström wrote:
> The parameter _ret is assigned in xe_validation_guard() not
> realizing we're assigning a parameter in a function rather than
> in a macro. That means it's value is not propagated to the caller.
> 
> Fix this by making the _ret parameter a pointer.
> 
> Fixes: c460bc2311df ("drm/xe: Introduce an xe_validation wrapper around drm_exec")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6220
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_validation.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index fec331d791e7..b2d09c596714 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -166,10 +166,10 @@ xe_validation_device_init(struct xe_validation_device *val)
>   */
>  DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
>  	     if (_T) xe_validation_ctx_fini(_T);,
> -	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
> -	       _ret ? NULL : _ctx; }),
> +	     ({*_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
> +	       *_ret ? NULL : _ctx; }),
>  	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> -	     struct drm_exec *_exec, const struct xe_val_flags _flags, int _ret);
> +	     struct drm_exec *_exec, const struct xe_val_flags _flags, int *_ret);
>  static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>  {return *_T; }
>  #define class_xe_validation_is_conditional true
> @@ -186,7 +186,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>   * exhaustive eviction.
>   */
>  #define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
> -	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
> +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
>  	drm_exec_until_all_locked(_exec)
>  
>  #endif
> -- 
> 2.51.0
> 
