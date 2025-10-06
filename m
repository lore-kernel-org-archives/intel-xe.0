Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B8DCCA471
	for <intel-xe@archiver.kernel.org>; Mon,  6 Oct 2025 22:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142810E03C;
	Mon,  6 Oct 2025 22:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWZOIIPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1101F10E03C
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Oct 2025 22:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759791441; x=1791327441;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=obhskvvanxs3D3aVFRqeqDDdlLM2MI+US7cvGQg+b7M=;
 b=DWZOIIPQlG3I2Y0eoGQOfBI4ZwRzTt46K6zJPq5CBhxEGSzBv2tngNmr
 7vUtrTgxisB2RF0tONuHSyWPW8CkqkCiOUEoi+QMIMC85A8gRmAYalJIE
 HK97gTr1khKc2JFRSSt0o8VszDHNt8hI8S0iuQ1GyJ8S0L2KScXDMkjYJ
 joCfe2v0ruSPD8YTIgXlIbEGycf2Y0Tx+gySAeWvhAihlqIhTQRJzFibo
 m9qUnib8GWMhrpzIMSBV2klmKEI9hYVqZkIvJkh3El3ewyOyv+XZqlkQl
 8c+qAGRPPT1Sc1x+o/eiIW7iuTVdThrvuU8GLKenof97qqBHnUhK1cQa7 w==;
X-CSE-ConnectionGUID: nd3/SkwMQHKugr1fDcdFsA==
X-CSE-MsgGUID: 1XgypQCuQtCdyEeJ8O4JMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61889169"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61889169"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:57:21 -0700
X-CSE-ConnectionGUID: ec78CkS7TT6wzhfIs+Bpkg==
X-CSE-MsgGUID: hs+aBSC+TpCvq0TIgJHlnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,320,1751266800"; d="scan'208";a="180412473"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 15:57:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:57:19 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 15:57:19 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.31)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 15:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwBUaWzlzi9yqY8lMu1YcqbvMqMycfVIbR5E0CHhfQhIH2s2LbhZxp9zfEhN7Yu52tbgvaw1MyzzMwD4k+MwZ2mISkgYdfpb3ZGYovgC6fO40TYOMV+IHGxJ+apeWM4UdRQDEi4nu4wS3exLWBckNOP8KJOj6gMc7M1HRz/mUkyn0yklXTIWKN84IVe5rsOA1dP9eFVbN+i3B5jCJglTyC4zjQC/q8BrMC3163stHgmvm+kaTGdEnqSH5DFv+NyGs7Em1o/Oek2Ctn7bTJCejeIHsIdohRdhefcVMx7RFrG3aU3JTBTXFBVTKdZ0vgwAxtlEQNAqNnakz9AHgbvOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mky6MMqyD6BtDZ5JnRNJccUzXYDzh8h6f9q0hHLIQjY=;
 b=Q4wvCqhdOJCL7JKVfTMbH1kwqnolOAdW8wMeBAY3LoCyEWpQ5ERWb3gewAzRE3LoqdlrqxKHciSrWCkFwgrKuT+aSld3j9DpdpT4lIETVoGBJQT7vTSnc9qs3HikDWc53Pj4zkEb+A6kFT5beUskIryre2stw063r1XCONWM/N12rl2a0YZNx8/ZS4yCpMYWP5WO/DwrnjZJwwkP9saGrCE0pF3Kk/fYdY2KnjwNbnwc5IQpZMHreSABH7rAnd3IsHGezlFJ+xprLFG9u4ne/hKPoodnjKYXlrWj+KanI0nVmkHxZ9DmSqIQx2pv0Z6SlUwTjDdlyHxwrpdj1qn3KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 22:57:12 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 22:57:12 +0000
Date: Mon, 6 Oct 2025 15:57:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 16/30] drm/xe/vf: Use GUC_HXG_TYPE_EVENT for GuC
 context register
Message-ID: <aORJRkuSj0gUHRpB@lstrano-desk.jf.intel.com>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-17-matthew.brost@intel.com>
 <35b47115-9a2c-4ec0-9b64-6a9de165880b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <35b47115-9a2c-4ec0-9b64-6a9de165880b@intel.com>
X-ClientProxiedBy: BY5PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfc04ce-288a-4cb3-198f-08de052baf90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tghLhPFOHCnVERJ8sg6EJ0bkCXHVp42FEyrK9THLxDTuC+Cxe6J89suxmoFw?=
 =?us-ascii?Q?U0Bm/6SivHvjhvyDaE+hWcjI/tDyQNxtBuEnrGo+GVVArMwiMYD5VLCy+I5A?=
 =?us-ascii?Q?RfqNjv1/16g/KkUzjJ2RUZruNN866Sa8/ihWoSfR/H0yjfHNgxye1tqX2Ulh?=
 =?us-ascii?Q?UvCmYZ8JuLVQtwlwhRh5sjMvY25qCReFuFahBuX5Tyi+3OVf2qC+tuUho8I1?=
 =?us-ascii?Q?ir0Pv82BTxvseadPM7/RZnBnGJxkaGtBvwLJBA1p3UDJtXbwVj0dZI3j4p4M?=
 =?us-ascii?Q?HWAs9aMrcuIgSUfiu6iZDQpUcDn08OXIk4nSN7dRu/Kf69nZJ9gLiAZgQNdU?=
 =?us-ascii?Q?2zMdPPK2H8E9cqsH57oE/zXLA7etcpzo8IQRysouyTAt755pyQwPflNcg/vo?=
 =?us-ascii?Q?XerXJmkrS1Imp/geN7FrDIA9t1iMhKRsrtuNQnikaVqva3IHVGMUrD/tK5Ll?=
 =?us-ascii?Q?ELXKuoUIIHAoHdWA/AxSNvcPy5CKnIt2+fm7LX0kyL3pcL4JzHtebfvKcb3r?=
 =?us-ascii?Q?sw9XarSecrGEHMZynEA0bvasxT8IoJhJt7eO0ulwGVbsz79NUeu1/kJeZBab?=
 =?us-ascii?Q?BrpnU3QWQmeD8NeBsZ1Ui4PPIGBKNdq5mj+l/hh7DnF0PHYFGi7j3pksszQM?=
 =?us-ascii?Q?So4x1RDXacBVGmcSc/WhP3/rbWU1KrcCF/ywxdX4Ow1B1TYtMTiqGQ88EoN2?=
 =?us-ascii?Q?gyl6qHzm7QgKLJugAvCYWfBWOskdjSgRJ2x0EqGqS3SfN4O7/j+g/ymMPXAe?=
 =?us-ascii?Q?5w+8ZXNUFvIsui9H4FKRvbEApS2gxmO2fvMeq+KtV2KdqUrOHRo+mDImqWbs?=
 =?us-ascii?Q?qRPdo6Eu8tpn6jacCY0G4QNic6RX57U4P3WelZ79XtyjEfEgn1vtcF49mooW?=
 =?us-ascii?Q?3J1TjUqBIWIV0H94Sv+2yHkjVKf939cs5k/x93t1ogCmrohJg1sAZDagACYp?=
 =?us-ascii?Q?GGQikOnLWG7mE1xOBwYz0iweFs3UVTmwCvC5nrKdRiIgD1nI407XlwsGusx6?=
 =?us-ascii?Q?bUiw+0f6gbzeKtbjDWHJesTLL4TxUfwNPlftr0FkWN8srYwZxnMLHObxeOTp?=
 =?us-ascii?Q?5aMZi1ASolNhgRGEsxwEr3xeEynlXRmMYGJjv7ad6++kbUm3Ys6wVhGXRyps?=
 =?us-ascii?Q?Fo8wQfgMm/l1gijj/SfRMYVBPACnYvv2SD/DrpXSh+/Pi6fvRCSNDh4C3uUA?=
 =?us-ascii?Q?n4AdBFz2zITWxiQYjokQ40Y1pLlKyY8gmHe+W1/ruij6XJWK+3O98XrRwhre?=
 =?us-ascii?Q?lUxliWd3rXfosRTG6D9hNOuQB0N+0N+uCS0HI/OA1t+IR2Jh0MozZStrJmWC?=
 =?us-ascii?Q?OtHVWkgH7/fQOCW5MV6KBWw1XnEByEo1ZXvumQJ6XAY2k/xQ1afzxmmxNmJw?=
 =?us-ascii?Q?vKDHCkd75bVf5cq5FPxUBUaDV6akHeHiRBkJ70BXmqZmtJzkOwcVuKBgomba?=
 =?us-ascii?Q?gt+lfkyjbJg4OJ6St3Jdg7jkP4Zn90Os?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/W+B/5iHYZXjz5bQ4MnytVfEUfaKZtv4NMdSZs2jaOBTHGnePnBXV5AxGKjB?=
 =?us-ascii?Q?yRbtK/4nCsra5rWr7eGAlM3ZWaY/cpUFDxKwaBE3AuUT4i+RgRyfGXZu7DDZ?=
 =?us-ascii?Q?RzwEUGXdddW7S6wfogA0eq/QSt1vYOcsBCCPd/yf5dqNQZX9yiN9RlFjj9HW?=
 =?us-ascii?Q?EF5DfkeZvdZc4D4h1IUvA50vInb0WFdYHCQDcQKYDk9SxiJAvzON30rWU87q?=
 =?us-ascii?Q?yQmEpDrRFWBHVIq5PRPvy3RbOSA7xOdMzmpG3J/zgv61aYnesKuUewkREath?=
 =?us-ascii?Q?NXw0puVV5wKCNedye0fzdGSf4sH1hFrkWCbV7sD4W0KS1tjqFcnln3267Sr6?=
 =?us-ascii?Q?UcN5uX6B4fT/DVSk6DwQK9lCUZuiulCJpjqnnk6YdeRRpHFxsPLQg4SqnFCs?=
 =?us-ascii?Q?sP8JnRIX60cUMSEWBnQryBuj9d2GwqmrewZ32DSB6kukfJkmh5IdmW+1COHl?=
 =?us-ascii?Q?mgf8OyWH4g24nPkyOsMqiFvVVWhhjkm1G7nsXdzy44nIm/En8pHpDqpQday9?=
 =?us-ascii?Q?nbhT1B6gZLMNqXwyesH4ufmhoW8/pCKrF7XOBKIiqap5XfSCIlqps0s8FF+3?=
 =?us-ascii?Q?LCdhqnDvovfmCwGX2FciA8De8fZBIwkyLWjkI8NlPeyqNcPrfA4tFYzUZ3iJ?=
 =?us-ascii?Q?5vOiYERtUaFDD2aySSV6+IyJoO4nOjq6XwDqDEAYLlqAmxDmEq6qwskKn/1p?=
 =?us-ascii?Q?TfyPPgSVIF5k1UUjaVTlgy2rEGubGoSdVYsE/3IF53EpNXIh3MXvb6a3CJKZ?=
 =?us-ascii?Q?iMabeKcOUvAK8oVaKalau6FHAhmBidSxf8SfSkYEjv7hiNnJE0hPqib8Rbd7?=
 =?us-ascii?Q?mUkdcVN23+p8i/WhNDSUmMBPx2Khtv3ndffLC8GorkmPchD9dv62S2vVD4PM?=
 =?us-ascii?Q?v3kyYLrzevQn81Im7k1Njcemz68FmxWf0nZd0l2SJsUh4vDcf68rAXE2fmsZ?=
 =?us-ascii?Q?H7f7TaCX5DF9v8SZyO2IwNPmYGoyDbcaMFcQuIztVVti4Ncy/8oRA4HzeXlY?=
 =?us-ascii?Q?TalMvw21lFzkNyFGjaDsgZopkQUe116czgHqXRj2hm9DjZ85W1oQeOgPAq1u?=
 =?us-ascii?Q?KapdPf/+s+nU0t7GL//rI80N1zRWrde+rvbeLgSVdG7MkCqvjE/ezfjyVkvn?=
 =?us-ascii?Q?YXqyzsS+4FlO4x5x626W58LurAEjRhvXPack16wFWYtt5/46UIlKKsZkeWss?=
 =?us-ascii?Q?v7j1cKD92Z6/5wgUgMLL6H+xqSJBv9ViYAoqGrE0rXrkwQtjUMQ/75RYzn23?=
 =?us-ascii?Q?Cih3ikTp1TwY+Ez4pDjUtBxyRLsWGNuwmUzaL/iV5Q/sFd6YMTd/BpdBsJfN?=
 =?us-ascii?Q?VB99JzxcVb8mDkLTPcoStzqQG4y/Py/WNxpmB0Sqi5GxH9bsXoqEp4BZ/z5X?=
 =?us-ascii?Q?amNKddJnYDOEPrI7x0tWJdvTkhJFuivI3qKuMBAbMSTS3+G6biKMdsjYJ/zl?=
 =?us-ascii?Q?O6wehUoPLZUWZXg7eD894sdl9WV+iY+hvo+65qiZf/uRO5x3scfzHWwIxoqH?=
 =?us-ascii?Q?9v4bTajEn0a7sluqwv2zSbI5UmRE6DkIEblnm+UOqIYHj6kjcqbC09E4RaJy?=
 =?us-ascii?Q?PkKgPwHhQGaQVAhPOCk0O96Xo33Te9FepNvBqHj2ElsgbpWVwS0UC2MmH50s?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfc04ce-288a-4cb3-198f-08de052baf90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 22:57:12.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DrNmxd3+pvE+cy79Hjoo0WR4CNfIDW+c7WNbZOI+AKKz9E/616qvztMeRiDyhHZXpNaZwkf8WOtiRukUze9HaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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

On Tue, Oct 07, 2025 at 12:21:02AM +0200, Lis, Tomasz wrote:
> 
> On 10/6/2025 1:10 PM, Matthew Brost wrote:
> > The only case where the GuC submission backend cannot reason 100%
> > correctly is when a GuC context is registered during VF post-migration
> > recovery. In this scenario, it's possible that the GuC context register
> > H2G is processed, but the immediately following schedule-enable H2G gets
> > lost.
> > 
> > A double register is harmless when using `GUC_HXG_TYPE_EVENT`, as GuC
> > simply drops the duplicate H2G. To keep things simple, use
> > `GUC_HXG_TYPE_EVENT` for all context registrations on VFs.
> > 
> > v5:
> >   - Check for xe_sriov_vf_migration_supported (Tomasz)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 33 +++++++++++++++++++++++++--------
> >   1 file changed, 25 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 9f0090ae64a6..3ac654cebc79 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -32,6 +32,7 @@
> >   #include "xe_guc_tlb_inval.h"
> >   #include "xe_map.h"
> >   #include "xe_pm.h"
> > +#include "xe_sriov_vf.h"
> >   #include "xe_trace_guc.h"
> >   static void receive_g2h(struct xe_guc_ct *ct);
> > @@ -736,6 +737,26 @@ static u16 next_ct_seqno(struct xe_guc_ct *ct, bool is_g2h_fence)
> >   	return seqno;
> >   }
> > +#define MAKE_ACTION(type, __action)				\
> > +({								\
> > +	FIELD_PREP(GUC_HXG_MSG_0_TYPE, type) |			\
> > +	FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |			\
> > +		   GUC_HXG_EVENT_MSG_0_DATA0, __action);	\
> > +})
> > +
> > +static bool vf_action_can_safely_fail(struct xe_device *xe, u32 action)
> > +{
> > +	/*
> > +	 * If we are VF resuming, we can't exactly track if a context
> > +	 * registration has been completed in the GuC state machine, it is
> > +	 * harmless to resend as it will just fail silently if
> > +	 * GUC_HXG_TYPE_EVENT is used.
> 
> Maybe add:
> 
> If the registration H2G fails with error other than ALREADY_REGISTERED, we
> will know due to the shortly following schedule-enable H2G failing.
> 

I've added this.

Matt

> Other than that, a second to Michal:
> 
> Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
> 
> > +	 */
> > +	return IS_SRIOV_VF(xe) && xe_sriov_vf_migration_supported(xe) &&
> > +		(action == XE_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC ||
> > +		 action == XE_GUC_ACTION_REGISTER_CONTEXT);
> > +}
> > +
> >   #define H2G_CT_HEADERS (GUC_CTB_HDR_LEN + 1) /* one DW CTB header and one DW HxG header */
> >   static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> > @@ -807,18 +828,14 @@ static int h2g_write(struct xe_guc_ct *ct, const u32 *action, u32 len,
> >   		FIELD_PREP(GUC_CTB_MSG_0_NUM_DWORDS, len) |
> >   		FIELD_PREP(GUC_CTB_MSG_0_FENCE, ct_fence_value);
> >   	if (want_response) {
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_REQUEST, action[0]);
> > +	} else if (vf_action_can_safely_fail(xe, action[0])) {
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_EVENT, action[0]);
> >   	} else {
> >   		fast_req_track(ct, ct_fence_value,
> >   			       FIELD_GET(GUC_HXG_EVENT_MSG_0_ACTION, action[0]));
> > -		cmd[1] =
> > -			FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_FAST_REQUEST) |
> > -			FIELD_PREP(GUC_HXG_EVENT_MSG_0_ACTION |
> > -				   GUC_HXG_EVENT_MSG_0_DATA0, action[0]);
> > +		cmd[1] = MAKE_ACTION(GUC_HXG_TYPE_FAST_REQUEST, action[0]);
> >   	}
> >   	/* H2G header in cmd[1] replaces action[0] so: */
