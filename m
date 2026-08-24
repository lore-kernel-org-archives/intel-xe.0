Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19165C5DF8C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 00:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A806E10E041;
	Mon, 24 Aug 2026 00:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgN84VYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5038E10E041
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 00:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787532976; x=1819068976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U8WEDm0UX3Qg0msLnL4vlyA53p19PMt4u6Euw6RCRXE=;
 b=jgN84VYdPlFl2BXdLR25W5RpLEwKaRoBw0GBUsljnB0LTkCZIueJm1VO
 SQT/VH5Rb6g3ptl1LHN5Pf9GkpxbjK6TJJW43SAAXQYSxmJ0YyP96gM0X
 bGWDGjgQ9P8XWaIjty1OZW2hgd5OSDv/Ca45rRUKcwTtsHybz6LEl8RdH
 rqIzPDXnR6fqfOC43zta5YgWSn0GqxMOB5fNIGEffNqZoPuqgvtQ5IJF0
 gm+//xG5ERziodqMWSAsv+vIYQtaAf4It8WNt33E/GECNfy81SdoLjwo3
 yzOHevlg89+iPFgglw9g88EExNvi/69Cz0xJkx8+fTI3wcarK2AUlWQnb A==;
X-CSE-ConnectionGUID: ae0/NwwoRDG6xy1WZdHYtQ==
X-CSE-MsgGUID: oxJgROJwQXiTxqKTXOkMeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88039731"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="88039731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:56:16 -0700
X-CSE-ConnectionGUID: z9PAaX4+Q22kwiFW1tAUCw==
X-CSE-MsgGUID: v/mjdnyGQk2pO6Ac1LSQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="268810804"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:56:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:56:14 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 17:56:14 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:56:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BxS0mpDV7HsO9KXdD0nPir9ctLFbND2r8uekqOH56cMmaMbBaASLdhAdV19wcOb4nfp1a4PqlrC5bVKTSSORQKVfZUEgrJw4W4zCbDLF5AYe8YhLsoOnWMyAToExPuVmVMRfIvhaLzSIEgDGqzAX8mEqha6RmmxWubAN5tmBRQlhl3vSHO3PPhgAkB7E+J99FjL5hnTJ3y/26a3aoGFZrnUeRaR+LGVW8UXOPSoh6C2HIvVG4sNiD5NLLScS9FJeNmd2TzE731QQdVwpZR61lETS+wSavRYFcxO+7A3Jivki5EATuTjsNk4/cThY6pjYrJ7tfzbyUw9wG5Tp+kgn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trZY5XvEPWUqVErYzrwzOMiXNIwbiByPYE+uoWTlACg=;
 b=Jkt28G4jMyLVf7UdZPG4A6HshLtgxfcPWEyCTG16a4AgAbO+8gZCIPBfFWta3srhei7x8UYtBCp76bwyPkynXF9/ZW7bJR0DkSOkGckv9wVl+fDDvLAP4rH0Wh0RXKuN69D9XCRek45UYzPUsHY4KpibuBtR1GJlc7YmbufL0i0+sBIrO8fr3hAP5nf4m4L+EkcbB8+7Ibg+3xhiHNYfVjMNJ2BUbMC+8nNE20iXYXhdQw/E5FSej83OAoAubW4063YuUQuOz3QPrvcEdMT9VlScisVF5rR6nGECbPecq1S42z9W2+qHVQz190EwXmGwryRK/GGMjEID1errc//C3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ1PR11MB6297.namprd11.prod.outlook.com (2603:10b6:a03:458::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 00:56:12 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 00:56:12 +0000
Date: Sun, 23 Aug 2026 17:56:09 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
Message-ID: <aouWqfHYxus0OuWq@nvishwa1-desk>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260821074238.3000501-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ1PR11MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: d168303c-5fb4-48f9-8592-08df017a7e2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Yv7RRQYTe6TGLGpo6FtqEL+HXDJN5T1drwsmG/iLno4gt8tg6uybw3vMRv0Aywo8t8EGATO+RxrIwBVr1TFQTaO7chNtZrpSMgnOG9ZJsrFGHdib/g4hOYmVAeB5/BD7vHPj3klT0N4MiAJPKz+p6nKe1uXUkXCW/J1Q63n3CAU2xYBeYz4HeL9F0+IYRuo1oBfyLGyxWboyKOZVvJLnuTrnR4wMO3Lv3XIgtRZPAyud62h/PrKgZGQ6qY7gzVn8D1bn0N1zpIQAXcthWIza/JutisVi5CXtJATbRdb2WPOo8LHVFbVx1ZIQoIL7qMGmB1mkLwSM59ko1gxpicBSUuVKe802DrFQdftvcaSmFBiN91sK9vGdXTlG+AkxhOAw6Ldgh4kKT+WBEyiDyha2xNV7lM2UWjkamh8/+jtLvlc9NRAGsTNSznkp5n532LxBt8BttXLhrbvGKjbaUaUNRLOJ/S67f5KFiaRoWqL4S6/NyFl4QR9Bhx5UzJuCR5WwrbbTlt/cFNSVX1lupQhYPB7P1uBfztzQQIdsTJFiUcQGdhVpK4dOajnClwUyy+ObkdkZzH0Wqoz0cfizK1wsvo7CrIAlxbkGN7ka/z/vvhekVAziTlnFASDPRnbxY2Ji1fKanZqltDZ3uylOj+FREB9W3e7CkXSAVQk41OrJ87E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5YHAln6BJYvXNFfz6GaHDR8cS+d7i4HQ1PdI+9wW2zEyuCPW8UyPIYKBNWY?=
 =?us-ascii?Q?mGvzwN1var+44E40hugycergfTX6fajBprHbmaDl0Fo/cHumXUeKcyORtiDc?=
 =?us-ascii?Q?YlKuXTnxFAXZ43HZ9X8S1KBPdHDbo2+9ZsCsWt3p4pZo+t6ySNSz+Ek+ha2+?=
 =?us-ascii?Q?NVGzuzFYdzfYaAxIo+sQE/mrysLVQGHS328DsQo5f3tQbGhiXrJpEQrPlqoE?=
 =?us-ascii?Q?yd2Acn78Dff+vNg2zgozSAEdMw2JaGr9oKckNnxuxkOz6UCh8D7y7yPPqnUt?=
 =?us-ascii?Q?2k+DtdnP+SvGoftij9bcW/6m2sWlM0QrZtGob0munkOiKzjvTDHXMaQcPkAS?=
 =?us-ascii?Q?PCWKlvNlgKVxa2xDBAi56JznfKMj/eAGNeG3FrGtLKWdKdTO3WnJRL6axpHB?=
 =?us-ascii?Q?ZPZNjsLhRNDGu02PyLST1ejENyRqMI3jo5OIy7tKORnix738rEKmTyAjfZsb?=
 =?us-ascii?Q?xvGnFVZDgMfay7fTvlmjchzA7kZ8yc3KijAW8InXqHbbzznv9yECzBhkG/oj?=
 =?us-ascii?Q?oozSDKmV4PSLBcxbwk9Zo8D0PRAk91przFzzxymnXgMzhhABICwbEskrjYUz?=
 =?us-ascii?Q?2aQO4VcwqmXS5s935/lI/Ir2L5GWcQEmLWDoniEJUkgslscerVbKI3HfB/Bh?=
 =?us-ascii?Q?xinYGaWFwl5X6AsDLlkNGCnzCNV443NpJ/M4KUbwFYunu183GJtOQ79jvsrn?=
 =?us-ascii?Q?O4xzDTUZf4BIl0OoOmi4s8xxo8aX9ZeLGe7MXvNIUxlgT4TomkLOS1NJgkU8?=
 =?us-ascii?Q?enJjJtwmJax+gZsbKNVZ7p2bkEH2yp0l1rt/PQqC18dG3OXdbIXbZXRpcqbk?=
 =?us-ascii?Q?RTDYfGyTBqanoyiUj75LUTOrVV9fMvMDAqZyfUoDvE9nVgzostBkq0QKM8Vv?=
 =?us-ascii?Q?tkbAf2yRzYlV8eUtyxxA8eIyQt+tCNHXw3ePzllxgmht1y3pO5u6k27ytyt1?=
 =?us-ascii?Q?geXuyB2SRPx89YXRyzsJ5QyHNH+ktN8EquQ8vrDUjdnU565y04yQPGe7i057?=
 =?us-ascii?Q?0CaAKejwyaeJ2WCjE+xDfdfyMibgj6rGuAy4kd8HzgcV6VBj/59cUX88/skF?=
 =?us-ascii?Q?9zJFK8gpZJYvZ9th2+0L/oWMKcrpkjlZFR8jpnyBEptp8AGzssA/m3KZfbpx?=
 =?us-ascii?Q?5V1hoVkAb3A3yMc/mNUdtWkwmhckTYvxdm39h2V988Z23kyvWqR6seqoMa0y?=
 =?us-ascii?Q?Euc2QjoFUxE8DqOxz+l/BNOEax5KiNwjeD3dgsKYkmriQDpCvMgNr5V6+YfI?=
 =?us-ascii?Q?k/XICee3omiyvsPBj84woff2shE5ydoYnf6SCJjdAu6heoUAeiSDszhNl8k1?=
 =?us-ascii?Q?SwfIy/T35kbunHIjjFmwC5fr3HJ2xMuhW5mlgizvm0pQ4+C9Qi9AjigHCKGx?=
 =?us-ascii?Q?DPD2VxtFiuAK8tLCGbymdqpnFhDmNf8ehR9YygP+UC5cuItqyLf3lKoDzeN+?=
 =?us-ascii?Q?Yt7EUYtUSx6zHN8EglSL66U31zIVEuNDw2svhvqSqSbkEb/B8Gsoe2m0IK8W?=
 =?us-ascii?Q?yUxlr/7bpfB7jucP23wk4L+c7yWXQa7uT8JWbKnrxYxMnoV7c7GDRB9+bg0m?=
 =?us-ascii?Q?qDgmBAchTFCUsvbpo0wNqIe5SS0z9uoWPuwIe7NnYBDSPaTQvR0BSUg5eiCI?=
 =?us-ascii?Q?yyxhIBYFbWkGc+X7P8vvsyHEBUrJAITlsci1eDDX82LvrRwnYFsAZnCxTUNh?=
 =?us-ascii?Q?CcYoJ4ox8rWQoKwxcsKzwR2lIzb10GFRO89OQdnSqx4o24QW51H9vbChyo6J?=
 =?us-ascii?Q?6kUi2BpLRj2ch3gzKcq1CTNr+oKmPUx9vNAVW91qMTv1z2AMKEEs?=
X-Exchange-RoutingPolicyChecked: a7jXTSRS5XdzzUn3MLMU8spz9zBE8kWy/f8r1aGh725QqGQUyy6bvx2ZnuUly20UmzRhdvNDaMoYiNG6dH7Yha/FsfKUE56AyzSSg2edI8trQgyPRS3W+6i7ppnopH6GTnsDECUZU8vilIIl/w2QTfl2ONO4C6X8XRuEINttqNv5P/5yulHMKHY9TwuISzLEi+bVV6E2ViYTLHQaK0ehdJg4kY7HzJo54tdk92Mml9LceabFDPkckxpiq9EP1PGzBBww8bPA++KqOQxNy4M5xrCasNW4vAZbsMNCqvJHigsrns3rsgMswp98ojqT78yNA3c2w2AqIPC0KLlnXa+9Mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d168303c-5fb4-48f9-8592-08df017a7e2b
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 00:56:12.6130 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vtaEpEdO7H7yPtlvO9nKL6za9OyjLsHQsA8mwugTOtLXNU3xhDa87Blnh/1uJUkEfo1EfOosqrAi06o2xcmwTG6rswSEe/he6zjS2rStCPky5buevODPWB66h0+tZmZ7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6297
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

On Fri, Aug 21, 2026 at 01:12:38PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Engines cache GGTT translations in their own TLBs, which the
>xe_tlb_inval_ggtt() does not touch.
>After a GGTT unmap the engines can still hit the stale translation and
>read the old page.
>
>Issue a FULL_INTRA_VF invalidation on GGTT unmap, gated on the GT
>having any multi-queue engine class.

NIT...probably good to keep the name consistent.
"Issue a INVAL_FULL (intra vf) invalidation...."?

>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 23 ++++++++++++++++++++++-
> 1 file changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 3564345fd740..60eb9a3d29cc 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -458,6 +458,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>
> static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>
> static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> {
>@@ -493,8 +494,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
> 			      xe_ggtt_node_size(node), use_scratch);
> 	drm_mm_remove_node(&node->base);
> 	node->base.size = 0;
>-	if (bound && node->invalidate_on_remove)
>+	if (bound && node->invalidate_on_remove) {
> 		xe_ggtt_invalidate(ggtt);
>+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */
>+		xe_ggtt_invalidate_engine(ggtt);
>+	}
> 	mutex_unlock(&ggtt->lock);
>
> 	ggtt_node_fini(node);
>@@ -603,6 +607,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> }
>
>+/*
>+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
>+ * occupant can't hit a predecessor's cached translation.
>+ */
>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>+{
>+	struct xe_gt *gt = ggtt->tile->primary_gt;
>+	int err;
>+
>+	if (!gt || !gt->info.multi_queue_engine_class_mask)
>+		return;
>+

As mentioned in other patch, probably good to abstract this into a
separate function with proper name and comment.

Niranjana

>+	err = xe_tlb_inval_ggtt_full(&gt->tlb_inval);
>+	xe_gt_WARN(gt, err, "Failed to invalidate engine GGTT TLBs (%pe)",
>+		   ERR_PTR(err));
>+}
>+
> /**
>  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
>  * @ggtt: the &xe_ggtt struct instance
>-- 
>2.46.0
>
