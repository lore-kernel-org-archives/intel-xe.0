Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA531CF45BB
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 18:17:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190410E422;
	Mon, 12 Jan 2026 18:17:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZZemGWhl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6C610E111
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 18:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768241846; x=1799777846;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3D45ee95hW/XWqcbRz+59Au1ldf1BPK4ah1mywkTa7Y=;
 b=ZZemGWhl2HcuuNhIhJrdxxSbZ/tzm00if3Ro1miEH5c+hLcGsYbQ7DIx
 ATqpKliXq8LBQrYLfNYlU9yawMWPd2yHLBGQrQcHjxg4i3w7GjuWbACCK
 B/19jxiqDTxGKurikEnnA/Nd3p/wLyfnzqO3cZyTW2Hy3HRetsEUfo8yf
 6rGRIDc3A8FWPAl/9IUTIhPkLgS18K1UMI1hdL/F2S/KI3zyKu7LJZJh6
 W1Fm+0oKFM7kwEpYJrqKQKMQVPL4KPhvlgWv/dzTgQJZ4PC7MsQtyf81V
 P+UyQKgvEQm7Cf3rW0tpgx2lhIgmLEFjv9ak7u5Imq8oCOeHEgPeK7XrH Q==;
X-CSE-ConnectionGUID: Z4Kc8KqFSW+4pLZwezSOmQ==
X-CSE-MsgGUID: zH1GmoR5TueajwKB1GV4pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57075208"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="57075208"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:17:25 -0800
X-CSE-ConnectionGUID: RoVwjEMlTtG/6n+FqjDueQ==
X-CSE-MsgGUID: c1ZI7AHFSCmyzKiITMhGDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="203315849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 10:17:25 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:17:25 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 10:17:25 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 10:17:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eI4g7Wj6ijuh+J5kzL41Vgd/KbYN9YoTWQAb1nQtTZUr55cFDxpAOpTYpRqpVeHrqwvrKC+2mgVJbhELusdSK82p1E14RLLtGdccWQq9K/ktuOiMWca0qIN1cZXv0LRVGNV+3ErmWXBBPL2MqCsn/t2h9qBLvrLYV9Yv2lgB4a1KxFkDbe4GkRv+4dYrJJQB+4MPlERWGIf0/bS8gv6YsTTLln3hc9r6XG4E1Ceo+OGMGZVnONSaFR3kogH1ikVh5P7Tv2hs63KF2AmI6HV/QJU4zdkE5ieDMhEP87JMaKlU7EEf9fGLcAr02b/+nhuLgVp75g2l3GvN1WUNm/AytQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SCJWsZ9Nhy5dB1Kwq8U5/UAPbssnZmJTJ7K0rC9L/nk=;
 b=Jew7LzAU0uHWgUF0i/HECCNWKx0Z51LS+AvScFDyNTjL5xvp5sBoH3/gX9sWmzBk119kSm5j6ky5D5QL5D00Zx7WaxUo+S7XU7jo+3TAyFTaevp5JtlQHH75o7S7TNbPDBOa4vVJsSVVRAG46korlQPtL2hZBGoW3CBKvtnptq6Q0vz5vX8sl2G2rEcfD1UkjUbTk5bIwImuVJev86Yu59RTwoerpKlP38qS1J1/13kGfxq/h6ylaEqJ1rUH7Nvtuf06hDWpv7GD29sx0tukdzHHvaKrj6/IWAbv9FMs8kPrgOJlHDNiyBm3boMbPe/+B95eIUcqUhXuXEI6b4J0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by DS7PR11MB7781.namprd11.prod.outlook.com (2603:10b6:8:e1::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Mon, 12 Jan 2026 18:17:22 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::443e:8ff8:c5ac:1ac4%3]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 18:17:21 +0000
Date: Mon, 12 Jan 2026 10:17:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <matthew.brost@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Coalesce pagefault error handling
Message-ID: <20260112181719.GD458797@mdroper-desk1.amr.corp.intel.com>
References: <20260112061755.1569635-4-varun.gupta@intel.com>
 <20260112061755.1569635-5-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260112061755.1569635-5-varun.gupta@intel.com>
X-ClientProxiedBy: SJ0PR05CA0108.namprd05.prod.outlook.com
 (2603:10b6:a03:334::23) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|DS7PR11MB7781:EE_
X-MS-Office365-Filtering-Correlation-Id: 5942cd07-a3f9-4ba7-b3fc-08de5206d42b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fd/dwdsC5mlQFQTAfqdlWd0xzSVbglD4bc3lyUvznw1uB+gqHHqwTyX7teri?=
 =?us-ascii?Q?PYFwFI28Yycvp8UHyFAmG2H2QyJfH6IU2My7vRCk8fCipyDrP8iWKTvOstar?=
 =?us-ascii?Q?XgTx3OHim99AoheSprEUcrOkgWf9RugLFwFwqJfgcya04ep3gnqKqRzWxJD2?=
 =?us-ascii?Q?HcptpG1Tw45ytCvMjYrvyfr7inS5bzvGNStFaM36wjEg2cbwet886+O1Dzr6?=
 =?us-ascii?Q?1qDV7FjW9dOsJRfAftcWKmuRfDzmir3oOWQZdaJzQg4ptb/5Uw1qmmjsINJo?=
 =?us-ascii?Q?Fjt/9YH67cEfujb/J1hv/bhof/sCi5kLAUYENLCQ2xTEtcQUzvt1aQekrHXO?=
 =?us-ascii?Q?hiDw0a/PDlcoR4SS/C8+RMVYBpGH72CmcLd37UEmJuCDJDAZCQnrrUvSa354?=
 =?us-ascii?Q?HcUeZyQNcCZoPTSrjd8QZofxHAl68j5KseLSh5lpSphHJklFvXfpjajWcSXK?=
 =?us-ascii?Q?Pwkx5zMpHNpfQkuqwbYScO910l7yWNI8uEkH8BmW0U5p+MjMvYF/pPqqnsMe?=
 =?us-ascii?Q?K5KA7WHP0JPMDuaWg5pCuvu8X0MF3kORa8gJr5sqIGxzw2XOmAa063ZKrJ8Z?=
 =?us-ascii?Q?neJuChUTOyseS0yRENejcZmtluUd+/zTWmyVwjoFHhHWJ2O4pOaiMiZ+bW+u?=
 =?us-ascii?Q?4+lkF2/DCevoaEtwl1qDr48cUPxZG/1zfPxKJ5od4IY+VDkAs77szfP4/7xW?=
 =?us-ascii?Q?WN/l/7HeOiFvu83gnAxxI6qu/HQrby2F4tG0pz7UGm7J9HezcAcBAVSA6MrT?=
 =?us-ascii?Q?v+ZbpYEweILVxtfewv0npiHmFnG0XCYgNssUjksNCVQ6BgbeF+Mrldq4nMcz?=
 =?us-ascii?Q?hQnurrP+vZvwA9nTDXFYOZonmvIXOh4lGMgL1xvrTfu767aBwTZi4cwAVd2O?=
 =?us-ascii?Q?JDYZrrHcQm/NMV4nGcuqIly3JgVQRdrsT/lDS34VqiFzWNMtM0taVAzbtJjh?=
 =?us-ascii?Q?lH+t+WdgwO5wvEyZhIw6pLNVwEuMry2Zo0B0/W7dvwsYhs6cLpnJHOTNi+aG?=
 =?us-ascii?Q?BIp76rldzGryCAYInG5OKTUmt8lQfv4BAnG8ZzbSAGf7xRCuMxEqOM0X45ig?=
 =?us-ascii?Q?Z/ND3z8jgmrOJLV4/zxjk2yJzCIyV3O5IO7lWy4G8vEbfR/HmXWKo42cqrrC?=
 =?us-ascii?Q?xbGTvt4t/r49osGLIEYuN1DJOCfKpjbdVzZf1NfGppR4ahzugUxJ/eCpqpYY?=
 =?us-ascii?Q?drojL4xcz9RTt6x3BOQSr6dKj0uswZiKzHtwswCOhEDaBMTFu7yfMSQgHxpy?=
 =?us-ascii?Q?n6HNXQ+j1+PXDKVwTNa5/nVVd8HISJ013a5ipcbn7zKsi7EjW2LGXwEi4Cg8?=
 =?us-ascii?Q?S5MJ/3UOvNJLnwEAgLLaQ/DZZONTsYubi9nf43sOdtCILj36p2H4AmP9ZuLL?=
 =?us-ascii?Q?9KCIBJ8tMFnfyex19YzSNNrMrO50tMF3Rg6u/n8Oyst4KCszkbeRiYBL+yAV?=
 =?us-ascii?Q?zEdZ6buFN2F79B28TaHDeUj7yKfyth4ztwFOF9ppp71iYTnkQwKnhg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/Oescbhhg811KUbGbiOaxuAaVkHk5YL9ivgSxshOZ7SU8RTo+eABINhqVqrA?=
 =?us-ascii?Q?f8GRTPqqDwqNAyl6R+nY5D3+XSwe69S06igTvF+SBzD6OLsDWZMJdo5SIkhJ?=
 =?us-ascii?Q?8Xj6dR2I7i/X8HLO+5bemNn61/+z73vSh6S02S+rmjf9f3ifIIbt5qb/UXGW?=
 =?us-ascii?Q?TXwWn553l8IryWARNvIVcxjqwWFw0uRZAjMNNdO3gCLtOx095L7mOtpq2F6A?=
 =?us-ascii?Q?j+bNrg1EhBbiinkqHL/Sw8Ts5xt02eFwX+l67uYZQvTOSI4Oo0zRA5esdTnY?=
 =?us-ascii?Q?DdPMyYkcLGEkCHwR9CMdhiSAkx148Ez1Z8qgOZnLrPWMR5SYVQzQ6GyXcsGT?=
 =?us-ascii?Q?kTPboI5KWAqtoiyzwaLZPQhh74iDkvPvKCxPMKt8GPry66NJiCH71f8gcxIi?=
 =?us-ascii?Q?ND/90tpedYcQv887mLDLTybtea9kFF2pgYAHeh6t7MVGGcfiwJt0kCV0QUjK?=
 =?us-ascii?Q?yOnGhy/kH1BOjAUIjIqoIKAZwasffB7+ENh+MAQO/vr35128ZOJTvPwYe4TB?=
 =?us-ascii?Q?IPcWsh0+gm+Pg2922Zqla0b7Pc5ZvUmqnMIl9qpX7rXT9FLF7J7PZnHDIp9V?=
 =?us-ascii?Q?05U2PLaez0zdaAzubqqKoE05tSz7Vl1wLqD+B/x0KvopALjLXDpvcR7Neipx?=
 =?us-ascii?Q?j3St6ldz/gYkcP9+C8iczJG4GuZL8YndnvTUpKqZTM6vpMtdzg90GgbVMIm/?=
 =?us-ascii?Q?GDvdjV/Put4O6pbvAOfjw0DeDkDQhTN8xSMv05R7NeEml33UC5mjrTnF68oE?=
 =?us-ascii?Q?EvNQBBPO8g2xlCzHZ6gCXIPxq4bzIeo2CO9zJuKToPO6O8cK6Un10JIQtnIC?=
 =?us-ascii?Q?RQAIhNGOrdnmubxrsOrAgb3ja+0Zbv+isg0Ga2nN4ehpL+EsCVzabRHYT8d4?=
 =?us-ascii?Q?ZcVCila/EkuyJaxojIRINRbYGsSzgtfdVTokI7EgiWuqx0Tyu+O3/Dq9dnAg?=
 =?us-ascii?Q?87Mmw/cMl47mFpdqbOy7/+SgCEfB1rmpNrBaejosLcbJ5GwVSzsanab2wX5v?=
 =?us-ascii?Q?gpZswv69IpkdAd3Lvke1wpr5eZvyxZQ2kzh51T0c/ikPti9GtjNjC6BPvity?=
 =?us-ascii?Q?qIp53spFgQOmbfJyOHFHYJ1aIulsEDu5EP19ciEnAKfaMGlabFXjYeLzj/LT?=
 =?us-ascii?Q?hbR+NIx8kLE8PVwfgYEtN0BsWqp/s/GRG/MhVo8GOuojnVkUdmVkvIZ/xJQu?=
 =?us-ascii?Q?s4X98oZZUFMCI4CxBMxvmWelWGzcYL1HTHXQI9M4iFhydO+k0+HXAnrlUF+W?=
 =?us-ascii?Q?awWbRto5Ne6nOWvC7+y1EFBt0xV6Kv8BvgrJn02jbRNaSEThAobECIF+3Wqp?=
 =?us-ascii?Q?m+knaAYMwVX6VyExhWJwKTYryS/hiBAIFrnMImJ1L77lY+voFozbB9j1MKhQ?=
 =?us-ascii?Q?0oQ+eWgtfDgWwF1gYw4PgMd+T6Q4Q6evA/Fz+lHy6MkAMV//xa21rt7DxOTv?=
 =?us-ascii?Q?eccFtHETXoObJNE3jd21XyuVxnoV31CGLlhtPjUMpfIk9AKaWxpXcnmG4SsS?=
 =?us-ascii?Q?kd7kPjE79luc1SjJwwGZP7YJkcODzL1ePcXH6RJYaIkAwjpdfnWeaeRpF/yt?=
 =?us-ascii?Q?w7Qf03mDEQj6pRoFbM5EN7LlfCnC9RnASNrsrTgsxZtjDAwR4aqaTAlYRSDh?=
 =?us-ascii?Q?UUtY3Xy6La7sJ4oka43xK2Qqze7aClzckYL8xqNPnQHVjdKphLsqEBHNduf/?=
 =?us-ascii?Q?mDRURO1HwrRhU6QXHzQx3FdCaju6/JkiegyqZtGuGX5DR/h4jmZD2ZJDHIMZ?=
 =?us-ascii?Q?uZNpTvdsKM4R4WK6q93sznU1uNpdcak=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5942cd07-a3f9-4ba7-b3fc-08de5206d42b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 18:17:21.8054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9T2ItJ1x1j5LES30K5J+GyJQs4pPxFvM6SiLynT25UCFqrsEhLlqaCtmPOdZ0KZrjF2zujq6ZjKzG2qNLH5OG1SEv3XxsfmWSUorsY/VKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7781
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

On Mon, Jan 12, 2026 at 11:47:57AM +0530, Varun Gupta wrote:
> The page fault is only ever printed on when the fault handling fails.
> Use a single dbg with the fault response status and its details.

This commit message here seems to be a copy of the one from
https://lore.kernel.org/all/20251107-pagefault-prefetch-v1-1-93291d619126@intel.com/
but doesn't match the code changes below.  It looks like the change
below just renames the xe_pagefault_print() function and adds an
additional (currently unused) err parameter.

Maybe you intended some of the changes from patch #2 (incrementing the
stats counters) to be included in this patch?  Either way, the commit
message needs to be updated.


Matt

> 
> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pagefault.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..34dac4280b9d 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -221,7 +221,7 @@ static bool xe_pagefault_queue_pop(struct xe_pagefault_queue *pf_queue,
>  	return found_fault;
>  }
>  
> -static void xe_pagefault_print(struct xe_pagefault *pf)
> +static void xe_pagefault_error_account(struct xe_pagefault *pf, int err)
>  {
>  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
>  		   "\tFaulted Address: 0x%08x%08x\n"
> @@ -259,7 +259,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_print(&pf);
> +			xe_pagefault_error_account(&pf, err);
>  			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
>  				   ERR_PTR(err));
>  		}
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
