Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1055ECA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 19:57:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C727E10EAB3;
	Thu, 28 Aug 2025 19:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grNlaLOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B367410EAB3
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 19:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756411051; x=1787947051;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=a6gAjVcYfAAOND59HaQkzR8LYDj+N/BllgfmIFJupWA=;
 b=grNlaLOBP6nqqx6cRy57ap63YQTYpzbDi4R94kpkY2ct9nYNHEFbLr9N
 uL2nGQREmUMSYQ5KWfYbZuILT4KQkTxEACYH8MlqKGWeO5VvF7i+YF9Mr
 XX/C65XSIQRkMWqM8j9+L76bV4yQZnHVzG1fzBGXDBgaocRiDAXI+O2LM
 vnBOG+u7rRpWD9yYALJ/puIJftGA+ak8dGHVWIUiOf5nDTpx37un9O448
 b6dUaKsVrQEFSV3ADBRWzxmOk6XDLGjSzxZGQTWo+EXdKnOcYCQliZlF/
 fPoeH8kBiPxnw4OGQDF9H82OprBwP4QSfEzhR3WXI86Qm8JHciER4iMCs w==;
X-CSE-ConnectionGUID: 5OAy4A3mTqq42pUVJFZn3g==
X-CSE-MsgGUID: cGoI0qGcRq6IRTWuZxWWRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58620714"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58620714"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:57:31 -0700
X-CSE-ConnectionGUID: 4iinC78XTZm3zXQlxSw6oQ==
X-CSE-MsgGUID: +dj8v94lTki4C43W28x6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169720145"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 12:57:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:57:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 12:57:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 12:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jb6+bMWzEmKJeu89LVCHfKyaZp7CZRon705pguRDKgVItjOscbUtCLXFS9KIIcpn5CyAKe95negjTSsvd3G2b3x3dbFzDTq4mFDZ8pbjZmQMQHS9Idbt2ehZAz0yMOiPl6Fj2NjHQCbCmefP3wJ+X270DIakMMDRLhQajWd8fK3hHwsUn+7+dNtXr353LUxBvGwMMzQqzAjLzb1+Zbh1XnbTqiXATXch7fN9obYSoKuwynwb2U7EE7a2mydE/vuPTozfgTKewNLMzMc1LrdvpUNkogTopMX/vO4BSUnxfHlZDkcuD53NbACZJH69w3/XfSQNWpjqGcSH5sVzMnazPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAamZWn5Xi59Qk3DXAsZxKLyo44N7XWExBvSf+UbEHA=;
 b=Xt8qMT+737zmDdCMrxuhiwgojqXKbBMzqiuScl5Pg1ypU35lHNHoQlnSa8UFjM9a3HuS7AqCCqIGSFtVvH4Fc1HmIzhaaxR4QbnWyhPBkTZ5NQqPh0rjPT0AJkTGrUAJHll5pxcdpWr23tg+vEmmHYyOiA4m0FEH32Yz6b/XaPAyhDR/KK1UAQ48O1HhpCrvgqWOihbTHoFrZ8W4mpSjdWdYdLBeTeV97HN4u0AOTaa1EyRMryswLJYeZHiLF+ZlUfR4y7kbsvd9Vo4gIS8frRXZYxMyx+xcyzLXdBDWHoXmwSPOnxFylgLHu4Omi7kr4FpRHPotVTrzFHXwCdBUOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH3PR11MB7324.namprd11.prod.outlook.com (2603:10b6:610:14f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 19:57:24 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 19:57:24 +0000
Date: Thu, 28 Aug 2025 12:57:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Summers Stuart <stuart.summers@intel.com>
Subject: Re: [PATCH v3] drm/xe/guc: Add devm release action to safely tear
 down CT
Message-ID: <aLC0oPvt1ZqgEVat@lstrano-desk.jf.intel.com>
References: <20250828104432.23695-1-satyanarayana.k.v.p@intel.com>
 <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cb231cc7-0173-4b7f-8d1d-b480ac76bb6a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0201.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::26) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH3PR11MB7324:EE_
X-MS-Office365-Filtering-Correlation-Id: 2021a8d8-a963-4cdb-c438-08dde66d1b63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cVFYegqyFsss5lxf+9aAgy+Kzb0Y0yjeve1CPPklKnaPkKu/ct+NztsEcQd7?=
 =?us-ascii?Q?fvs7USCLMwqXSa7+PcbeSOb//jCvW+pUXJNtf2Ecu7k16o1ORkuVvVfIL67b?=
 =?us-ascii?Q?xJGIbyW574NmmVfhQc4Uk2ACXQvLgw0tX/saJBXM3W6Q0sncmEFv+w82fku8?=
 =?us-ascii?Q?w7KekmOoyC74qG2orHxMDvNndyJ4xjVL16RoK7FLMDz809NBl70jWbBiiL8q?=
 =?us-ascii?Q?rHTtzYCIBZC36iAwRoMqSPOd1Nepgi6e3WnB5JVJpK9xpxe3z0+nNDHfL0Fe?=
 =?us-ascii?Q?Q4Huwp8m8GTfJN+80uRCpTkGZxb6jwWlWrsDEZCxA8XvTVGQiyNqGSwG59m2?=
 =?us-ascii?Q?wSKv9vwpxHkpIcpPdkkgARJptiQvmHlMQ5BclJaxle8aJzxHfp2kO+F55qdV?=
 =?us-ascii?Q?0VJlLPo0XPDeqFCOFE6EEbO9z5QEpTwwb8iM9ZzEJp7T2W7C+HTdgBBmj6Fq?=
 =?us-ascii?Q?aRbqCZz7bubRMFfxadiliGSkX/KUzMQUDmaksWQmQ2OkvsZSUjQ1qy/rOQR+?=
 =?us-ascii?Q?7ByisnNPcKVXsiHvp/tGqJzL3k08CLbB6IbjNN3rbLKhsuL+RTxc8/wPbwuh?=
 =?us-ascii?Q?iXak3IOO8kJwMc9WzpJlre3EGTTp+bp84LTBstJS8YAbhk29M549UpFn2vbT?=
 =?us-ascii?Q?86KdgdqV1appTcaiWbE9P+Gp/AaMq85+D1MYssiQ5PZA+VhcQC2Vx8CScSpI?=
 =?us-ascii?Q?b1OmjYXqrUwb/B+SxGZ6pLS7W6tMx1PKFE7U12Zl3uMm48xTDyWivo7wzqpM?=
 =?us-ascii?Q?2qoz930+yT9xyUoJ3F+X2Ry34clelS8NnZfDHM2d9yMH7dspDJ9Nf/nwlxcC?=
 =?us-ascii?Q?8AM+0cAJp6RCELGG+so545Fg7ceAIwz0AQEvVnMJtusLfdKFNJWYC2CB2A0+?=
 =?us-ascii?Q?B9X1qNrHEneNRWhr2/LOOjScgLC37sJEXNMncCVM+nFZ4tWdhYDwP6VmnmvO?=
 =?us-ascii?Q?IpWuWXDGmtY3EE/K0VmtEtDLgqpoYncb2OY29UBEQkjPN/ukjkIvxEKWRrDp?=
 =?us-ascii?Q?96/q16ktZpaW62n6CFK58gZOgcQDcPGnbYd0s4nSZRKQVJzC/Mk9pTJdgUcO?=
 =?us-ascii?Q?efBU2Nyah9kTzIuHwT2V+MpUVUcOHcqdGTDsiYEdeGOeMn8Q7hGG3NWrSJ37?=
 =?us-ascii?Q?tR2dH5fNNiWQ7b9ZIUfv91OgHozsJHLsokWlwByIrtbOvTiDXxwZL9Od7Y4f?=
 =?us-ascii?Q?D3AQoVhCy2prRV8iLnVAjAghZRR4dQgrhJvqbvFVpe2ywnpInteKzxFJ59z3?=
 =?us-ascii?Q?9FoXQhy6OE48J5U/iimpnwCskgKRRaDHGZ2IGXyDi0irO6girIB6tNL5yJsy?=
 =?us-ascii?Q?Ws1e6jF8TzYKSWCcaVEFKb0ZrFRTI1JcUjseEolIxPwQ/D5SyG+Wuwzpgwyx?=
 =?us-ascii?Q?4bsgkB5z2zD3uGhZaWmMhToQQ/AtGVM+rkPpmoFxnZ2y+fjbpis5FgqoF7iZ?=
 =?us-ascii?Q?6ycKCAC20Mw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x1QuPqeVkAofDnTARLNWoTyiL0sV1POQIctNSSJGCBuEun4meTGFdtZSfmEz?=
 =?us-ascii?Q?vmOd1AODBgrqsyttRiY7vOVJZiQM1vx1srEVTq1PmT6VAchWchq8ztGMydne?=
 =?us-ascii?Q?Y82ghaabKV6nJRH/KQZgPHDyuc0DrPTwDlNuFhQd5GOS3XD03vuoLIVH04CZ?=
 =?us-ascii?Q?2tIJxY6CI1t3S0U0rrXTxvITIrvryf8RuBUkjHou6V3QnAul4Z+Jk9KyeUaY?=
 =?us-ascii?Q?pIX8XPTFRLkB1bIdB0Yav80UoYLoHY2QZhK9VosNPQVUU9N7fp+67q/p6cFy?=
 =?us-ascii?Q?po2wiOgo481ihssdmeFynEc+UFnQoaC9MGk85+3rg+ekq943US4s4Q2SbhR0?=
 =?us-ascii?Q?M7nrIryNNGZOoWWiDEB4NQOkTs/A6RIXDyWhbAHmcxu+IiuecTqq+jLjZXm/?=
 =?us-ascii?Q?PYgTdJZeYDr7Kg4Jsv+0vDfoT68oZRV3nIu8PedLS6w05a/JrUruhb2A8lxT?=
 =?us-ascii?Q?7aSaNvn4A/I9A0IkYsq5wCB9QzvmP2BWiy2ysykAnYuR5hqI82HlqCfVXspr?=
 =?us-ascii?Q?yJalINQqwGCEQr2h710At2IqemqI/DS3qf23NncmbKrBCYLBi61ZZaOv7vbt?=
 =?us-ascii?Q?uZ1nYOj+xXuyWDQvOrgX8rSkloFx08SPSRNARRqzJnyBIcqPgn843sRUl/oE?=
 =?us-ascii?Q?rWPyHuyLj+ZwUAGqmqH/us4qYi+ebKBALjbyJDdYq6+XZ3azcqVwnvsn7K3s?=
 =?us-ascii?Q?b0AxSxOND1JLB5fevcCWMevYGZfIAiTjeXOBwj2j/LLrImRhxXj27dTvzCF+?=
 =?us-ascii?Q?G2oxtY1IDqi1HayT/AtrUN0Qfiv/OpMQ6EW73J6oLHMfUIFJAclTt1SAbpR/?=
 =?us-ascii?Q?dnBxXOatDF7/eV9KzWiRStNngtars+xm7nNQNGc3veAmsGhtEHKk8T0hlq+S?=
 =?us-ascii?Q?ZXRHzCCe8IUP7oPLXRY3GeJHck7i6PJ+HP6/G4JscwUkXNoCDCaheTG11PXF?=
 =?us-ascii?Q?LtG7+S+/1DlP7DY0s3aQUjZGM4ec5xqRNrMZ7q0zAgykjTeDQ0bDPV/ms8rj?=
 =?us-ascii?Q?VgIrZAvEWToxeYFBKbvtJID0FxTAjHzt0I4BU1xgsdgjn9ZEDpIlakeRahX7?=
 =?us-ascii?Q?/ma8WpMU2SPSJoOvh5391DN3TtFY55+720cNYcKoxner5XbKMdY4buPZjiml?=
 =?us-ascii?Q?4X+xi1aX6fmjm0pOJZzPbfBHhPPI36geLQVL60edgjuPr7aGwiAEVYjmvKc/?=
 =?us-ascii?Q?3K7JcQ7iS83jz88+hn+hSUgnu2Q99iAcZIHF5X0Mcg6Jfrgg5sHByr8AQix2?=
 =?us-ascii?Q?wd0bnpnr9inUQSM1LBoAHspeNMArgsqgz/uSB4zL9DXDtS18x2Aws570g+k5?=
 =?us-ascii?Q?h+hjFKotM9bPsKTATqdJLs/w3QVsMcSWcIzLE4MII/XqLlNG6iDfAqdNKEmv?=
 =?us-ascii?Q?mR769PtcwiJFCQwp+hMWYnvDXKQiLL3Wu0O4mU1I7WJM8q4JKJPddN8rsVdE?=
 =?us-ascii?Q?z3fQozthOO1Q8/oRt8WkgX8itnmma7YwXmVTJUM/pBo5YdVVZVYVU1cH5UIg?=
 =?us-ascii?Q?3nh6/jBwhYTW+Hm2OHFhn64MFyGMz8U3W9lwTVDUhWNN1k8jNyZ69R6wnpOk?=
 =?us-ascii?Q?dOUl5vIqHCA7RdG3jB04GTHSbT0bl9pKCQvNpSw+02jNH92B+BZbVfM3qcPR?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2021a8d8-a963-4cdb-c438-08dde66d1b63
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 19:57:24.3662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HEXGufthMkrO6HVob7CUUuJcZfh6qWPq6PxvX/ehBtNuWDhuIB48NQGVY9J+TXm1j09Yk7FxtVhxeOUVJ9OvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7324
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

On Thu, Aug 28, 2025 at 07:21:02PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 8/28/2025 12:44 PM, Satyanarayana K V P wrote:
> > When a buffer object (BO) is allocated with the XE_BO_FLAG_GGTT_INVALIDATE
> > flag, the driver initiates TLB invalidation requests via the CTB mechanism
> > while releasing the BO. However a premature release of the CTB BO can lead
> > to system crashes, as observed in:
> > 
> > Oops: Oops: 0000 [#1] SMP NOPTI
> > RIP: 0010:h2g_write+0x2f3/0x7c0 [xe]
> > Call Trace:
> >  guc_ct_send_locked+0x8b/0x670 [xe]
> >  xe_guc_ct_send_locked+0x19/0x60 [xe]
> >  send_tlb_invalidation+0xb4/0x460 [xe]
> >  xe_gt_tlb_invalidation_ggtt+0x15e/0x2e0 [xe]
> >  ggtt_invalidate_gt_tlb.part.0+0x16/0x90 [xe]
> >  ggtt_node_remove+0x110/0x140 [xe]
> >  xe_ggtt_node_remove+0x40/0xa0 [xe]
> >  xe_ggtt_remove_bo+0x87/0x250 [xe]
> > 
> > Introduce a devm-managed release action during xe_guc_ct_init() and
> > xe_guc_ct_init_post_hwconfig() to ensure proper CTB disablement before
> > resource deallocation, preventing the use-after-free scenario.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Summers Stuart <stuart.summers@intel.com>
> > 
> > ---
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com> (with #rev1)
> > 
> > V2 -> V3:
> > - Fixed review comments (Michal).
> > 
> > V1 -> V2:
> > - Fixed review comments (Michal & Matt B).
> > ---
> >  drivers/gpu/drm/xe/xe_guc.c    | 12 +++++-----
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 40 +++++++++++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
> >  3 files changed, 46 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 37d06c51180c..ed0da4ebd928 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -706,14 +706,8 @@ static int xe_guc_realloc_post_hwconfig(struct xe_guc *guc)
> >  		return ret;
> >  
> >  	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ads.bo);
> 
> btw, IMO this should be moved (in separate patch) to existing function:
> 
> 	xe_guc_ads_init_post_hwconfig()
> 
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = xe_managed_bo_reinit_in_vram(xe, tile, &guc->ct.bo);
> > -	if (ret)
> > -		return ret;
> >  
> > -	return 0;
> > +	return ret;
> 
> maybe just drop the chunk with reinit(ct.bo) without reformatting rest of the code
> 
> 
> >  }
> >  
> >  static int vf_guc_init_noalloc(struct xe_guc *guc)
> > @@ -847,6 +841,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> >  	if (ret)
> >  		return ret;
> >  
> > +	ret = xe_guc_ct_init_post_hwconfig(&guc->ct);
> > +	if (ret)
> > +		return ret;
> > +
> >  	guc_init_params_post_hwconfig(guc);
> >  
> >  	ret = xe_guc_submit_init(guc, ~0);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 848065a25c44..0b88cfb05e7b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -39,6 +39,8 @@ static void receive_g2h(struct xe_guc_ct *ct);
> >  static void g2h_worker_func(struct work_struct *w);
> >  static void safe_mode_worker_func(struct work_struct *w);
> >  static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> > +static void guc_ct_change_state(struct xe_guc_ct *ct,
> > +				enum xe_guc_ct_state state);
> >  
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >  enum {
> > @@ -252,6 +254,13 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  }
> >  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_probe() */
> >  
> > +static void guc_action_disable_ct(void *arg)
> > +{
> > +	struct xe_guc_ct *ct = arg;
> > +
> > +	guc_ct_change_state(ct, XE_GUC_CT_STATE_DISABLED);
> > +}
> > +
> >  int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe = ct_to_xe(ct);
> > @@ -268,10 +277,39 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  		return PTR_ERR(bo);
> >  
> >  	ct->bo = bo;
> > -	return 0;
> > +
> > +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> >  }
> >  ALLOW_ERROR_INJECTION(xe_guc_ct_init, ERRNO); /* See xe_pci_probe() */
> >  
> > +/**
> > + * xe_guc_ct_init_post_hwconfig - Reinitialize the GuC CTB in VRAM
> > + * @ct: the &xe_guc_ct.
> 
> remove trailing dot
> 
> > + *
> > + * Allocate a new BO in VRAM and free the previous BO that was allocated
> > + * in system memory (SMEM).
> 
> make a note that this BO reinit is only for DGFX
> 
> > + *
> > + * Return: 0 on success, or a negative errno on failure.
> > + */
> > +
> > +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct)
> > +{
> > +	struct xe_device *xe = ct_to_xe(ct);
> > +	struct xe_gt *gt = ct_to_gt(ct);
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	int ret;
> > +
> > +	if (!IS_DGFX(xe))
> > +		return 0;
> 
> hmm, I'm wondering if this is good that we will have two different
> unwind points where we will disable CT (one for DGFX other for !DGFX)
> 
> maybe we should just reinit(bo) for DGFX but replace disable_action
> unconditionally ?
> 

You will guc_action_disable_ct regardless if this DGFX or not.

Can we really not nit pick this too much, rev1 worked, albiet the
layering being slightly incorrect. This is a clear issue and I hit from
time, customers can potentially hit, it would be nice to agree
upon something soon.

Matt

> > +
> > +	ret = xe_managed_bo_reinit_in_vram(xe, tile, &ct->bo);
> 
> hmm, maybe we should assert that CT is still/already disabled when
> we do this re-initialization? near the start of the function
> 
> > +	if (ret)
> > +		return ret;
> > +
> > +	devm_release_action(xe->drm.dev, guc_action_disable_ct, ct);
> > +	return devm_add_action_or_reset(xe->drm.dev, guc_action_disable_ct, ct);
> > +}
> > +
> >  #define desc_read(xe_, guc_ctb__, field_)			\
> >  	xe_map_rd_field(xe_, &guc_ctb__->desc, 0,		\
> >  			struct guc_ct_buffer_desc, field_)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index 18d4225e6502..16d82c0e6cde 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -73,4 +73,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
> >  
> >  long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
> >  
> > +int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> 
> put it closer to the existing ct_init() declaration
> 
> > +
> >  #endif
> 
