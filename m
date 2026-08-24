Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F18DC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:25:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5796110E584;
	Mon, 24 Aug 2026 18:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JtrTTHCk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 916DC10E584
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787595909; x=1819131909;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WGgJkIs9SmMlQlG3C9lDZKGzenma7yl5U/dxgBrHx5A=;
 b=JtrTTHCkil+zv4E2shUcoFOKEUQvl3OzWtHaGucwEC13l0SkTzVW8VBi
 IxvDdYCZoDFapZh8fGuzL4oPEFHFALQSysGPbJsNZ9GD6NBNWhSUry2Vr
 6VP/dV08+nzjRysJvS2hHgZxufCkLYKL/1UVHcEvuYrrKRhLDI16PmWgA
 yJf7F5g+CZ1NfxoMb4yr8EiM2w9+x5Cxv77a4YqWwIhDyv0KvV1lV1VK3
 MUfjLczGveelr5jKkkOoP8hIsBo30kzfmUTUV2JUQK1huyUSHFUC9hEjt
 jc0Bk/+PY5XElrHS1yvEez9U6ESoK8wulqFTOPqh+bY4Sgk7fTm+Vtg5z Q==;
X-CSE-ConnectionGUID: 3mXB51aCRJic4HgglrHaWw==
X-CSE-MsgGUID: O4vYLIYnR+uBROLRwFKGSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99403394"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="99403394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:25:08 -0700
X-CSE-ConnectionGUID: W4oWiSwOQtmINRBW+zcrIg==
X-CSE-MsgGUID: jcb67aaOR6uqAD1I+824jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="271273868"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:25:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:25:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:25:07 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:25:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8DvnsmqHzQ5UYNF2hO6ai/k08r4MHDGNUFSYw5R3/2bWAU5Wda7A/T66HGYnrO//mvprPRLT+9wYq3Tm65WX8IlVcLkG/+A9ngg/lm6/lbXalxfEi6clyszFNYE8cxe6lZYkUV8ChksFEKkPTk3FCPNLyXVi17l7UsXSHIcIeFXsd/c4vq/qwf/C5/E+3s4jFpFw1iyg8cubatF0WDY1woPPhF9BPkHPUGjxZ0PQpMoGW+pfGi1fVPa7d0LPa67WZEsDFgMrG+WeqXZdpQkDTUCm7tGJauldB7aWwWrVhiT6jlgFG7W2UdOd00ntcOjccBL+9uhMfXC9m5cI6R1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp/5vVDUUOa4M4LFpiMXiIxv6jqUlYdVTHIWzxT598E=;
 b=WeTy00GKtXmQmpn2opmBgqxaWhqL3Rt4ZqnnV+c3D2qkEATIrY4oJdmbUl+rnz5LH8NRDyglkCAPlrhEVT9NOroeS0fPF+a6JVijAGHFqFY4aUPKJXXPsTvaoHK/2umF6Ww4PN1TThJ5GC018ReVE1J8umSHG81B6uSsljSA3thRxY8NnK45K7pnrImhfkOKq/U6WgWB7PLZ7+VzAjSXSUT+wG5Pgv5fXutgkBT3Si3tpl9BdaiGUiNv8iQTPngCoEXikyQVLNPwqpmB4v/851kHDTKEnPtrzeoINor0PR+GhjsrvOQ75ykTM5ZqoRS2T5/VUjqm5Q4I3oVydgjwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSWPR11MB9738.namprd11.prod.outlook.com (2603:10b6:8:353::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:25:06 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:25:05 +0000
Date: Mon, 24 Aug 2026 11:25:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/ggtt: invalidate engine GGTT TLBs for
 multi-queue GTs
Message-ID: <aoyMf_amy6DwjvOi@nvishwa1-desk>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260824163458.3129935-4-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: BYAPR21CA0030.namprd21.prod.outlook.com
 (2603:10b6:a03:114::40) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSWPR11MB9738:EE_
X-MS-Office365-Filtering-Correlation-Id: 494a9461-f383-41f7-1a21-08df020d0545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Rp6tfCAjzFmC6sE7zHQDyO2+Pr+VEwN4gA+oswVj7VIW2M6xcYqCFXiFr3UiegZS0mcef1mKm7buY7iyUW6bBEIsAL52f95AAm9RyBZCBG2RwkM4AN/kfQu9Wbe4Rcx4q9Y/MmfDLzpDaLvEFEUWu2R6FfMihBMmgqGW5T86V07fcLzioGEKguGBsgKUTF75deh0lcRVIA9DhwjvRkcWxuKVABxdoyBUZmekdGerKbS/ZQwJCRssa/zIeSEs3PX/ZiiZ0vbeGVEdigvPO5ntmAHC5pc6zverzCQJRuD8xCI51Ov258EtvlQah0XVZF7uz4MYEJQFG0HSu3/LF/oLmI8yOotfrpJ5UfrVw5uETkxJd0DO0slW/rNG+HgAwZI4hGRYouslUNimKB9TCHWqjXOSNqHu0Bd3uXfOnMgRwCwGIHLKzUE78WiXTqGiskJyXDa/SCcbsLGlvdOWI5e11pwBuh/o5ZqrzBWskO+JmJu9nghWpIwg7u3tknsZSnS6+9CG1qJkRhXjfcEtevtA3Z/t/IrTasGA5mw+rnfY93kWx6uyhdnkfs/mRuAyuvH1mWhALGrPHsQmpGoFKRUfAK9iuMgqTMyhycDY9o61p3YESGj+oMPe9An2SmUrn7ICM1VYaONFGTLvWjA8npYJxFw7VIw1v4zg26KpFahaF6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yZZtanwEsPb763bC+dPr/9l9qh/7Flg0LXcTbHrEWcamYpW2K0HqXIWbQuGy?=
 =?us-ascii?Q?T+qEz8wGYf7cK2ntvqOOY/Xwmltc5AcD3A2ngXLZNdNqAD+T1IIIjt5blwtx?=
 =?us-ascii?Q?2rw/TLA91jVGBeEcWR2c+gMjU0Ic74fFrixITTkhClq2FwXOpWyAb06IjJUh?=
 =?us-ascii?Q?Ttu5Oq4Lvaw8S8aHOSS/R2Es1yYy4v8gTlPuU+k9Cn1QGnrhl/391cnIwm1u?=
 =?us-ascii?Q?P2oNy8XUCEfIvA/G2dQEU67h0WRAecJxhnMiW6K3fy90gwkhJmWnhxGOwRQb?=
 =?us-ascii?Q?mbpmBB8zmc6jtDUTv4Naa7p1SwZ76EOLXqQMYcprvQXN4CiKRUMBkJG4EdsN?=
 =?us-ascii?Q?luSNBr2bZzbNnuXk/3EKhwWEO+j7PZCoIBhnUiISdROomq9nADeoJgSbQLAW?=
 =?us-ascii?Q?U/IWt1/W8pnn32eA4pz5T53J0mQNTsTcMmKayPwRDfLj9QwIZVI9J5zm7/zi?=
 =?us-ascii?Q?+MITvEhXRqZzP+ilIeGLB8UQmiCCGshoNWU8vJxH5p9cFfo5lTUt08FIpLDL?=
 =?us-ascii?Q?RIfxxvNtX12Xr1JBZ3Ocxh7rwJXcP3VGi07lYVHFnZnkY5AB9t0wVHr0yu41?=
 =?us-ascii?Q?YpZ19S/TNJo3W5KoDlcbTZafGFk7pDXaM+XbVMcc/DD2/2aWfBlzLz9fZEEp?=
 =?us-ascii?Q?VRq8pepliTJ3CDSUn91fhxPQDI2eEoEYtbauFa8NmVmEXPl0NcME55RYMhTi?=
 =?us-ascii?Q?OXtFgD/KEmGKKk83xh2pKpheg7Clv7FzcetOFF+JHa1N2qpL+gHj4c7Px5LW?=
 =?us-ascii?Q?YFMY/lX43ZT1MODA6qmHqQ1JA2cXOK5gw8TMkvgQ4ayi1NfQxuia9by0+axS?=
 =?us-ascii?Q?X0lJI+fmRW0gmxf/or8smI7TnaPEgNQ8k6z9igZ8Cp1g2k7e81NNtOeO2rmj?=
 =?us-ascii?Q?SRxHPmEtSH1Ew8t1XvyuMBXLUMj12fO0t8+Ov9VgztaLsc55Qi92SYUBSEn3?=
 =?us-ascii?Q?E0ELDttW0Qahf/Y00pJaf2dtIQ68kMljuaML9FD389L/zXDaBo2MUHRtzRFd?=
 =?us-ascii?Q?y0UtePKlK2wypRLKU9sjQxyar+rH4TbgAeTBvdi2CozQx+T1KTvOpoa9Tq9M?=
 =?us-ascii?Q?uLiUNyg+lfPTC4cozUiXO8K8kLZAZdIPkz3td92GzOjKfv7WMI8tkOlTynGG?=
 =?us-ascii?Q?R7g6Bzij0D4mj8hAVExabX/a/r0VkFeoqtuDqCYVKBjLfF36+brTDsRi1VKf?=
 =?us-ascii?Q?lwK6gJSg7OiSkSGiw9i37Z0zTiGyrYNf4INFSMYF0z8UyoIv2u1W4KaJ7KVQ?=
 =?us-ascii?Q?csB/Zd2c4vwrECRmZ8PuqsEVO9NKY9AhOnEsMNCsN6BfIIZSPhgKzr7V9FeQ?=
 =?us-ascii?Q?oCXJbwVCM7ZKSKCmnufBqrJsAW+YbF3FEmWy42BtfamQE5jyKvVQAuNFr3a6?=
 =?us-ascii?Q?X32nRG5dJqvhUQ4YBVrddZQAbZJn4OT2LaEJeFXrQT2GC9jQqnWZCrqAmGPI?=
 =?us-ascii?Q?9oysCmUgfXFaaEfBCIounfc5JMK1xdfTQnx6pfTP2nv+tqvVDVf+o/6apkp9?=
 =?us-ascii?Q?FJbof2MTHzBKiHZN7Pqmis8v8E1c6/bzrX/Nh7XXnGpNDoNL8VVmR+9ARoj3?=
 =?us-ascii?Q?xbaPnoUS5uDQL/Z5vUpXivDUNiViclUfnwlq1v5oz/S6GruyWVb3s6+4Q9TQ?=
 =?us-ascii?Q?EVIV6Rjb6iPp6Rcewl/LqbTE5vM6997t6CKb8TXYiE8wGwfuhpW1tymZmjCI?=
 =?us-ascii?Q?wZBc5h0NCjhNNzJx2o5LocP9Pisd0gsmIzgiChy/CgbyYx2OrTCnNBVYKO4K?=
 =?us-ascii?Q?M0PAOxBi+x4Gigh8Ww5TPUgAknZv8Nmrm0+OTLMKjJXkv22On7ZG?=
X-Exchange-RoutingPolicyChecked: zkEihKREEJo7QHG3lUbfQcf6NQBUe45MAi6iammZi9Vbyd3M+nN+hAUWq1DAjkfxlW+1kQk1AavcwZ0GaFlkKSbB4hSqR9RXzAryielAiLl0Esy6lbEkUnuopVmOeRGxxLwF+j3DSAbVv/XyajO/YEbLxDzlFiWnFawIbplXgrc1NR8/n7TiGcDroz+93zhNPgRJZM15/za4xO7xa5HY0hO/kRLqdN+7mKAg3GpQzKb8qZqEL5B/emttSxvyIi/DJmOro0yQ7NsEC7EzQ/BMQw5oh/KRiqIttWEZaFTsukQFar5YEvt7zgJxmCOR5BeVPUiVXRSzE6Td6A7S4hAkvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 494a9461-f383-41f7-1a21-08df020d0545
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:25:05.8213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vPfU8fGK/2UzTqxZTE7ZgIBMERlq8TuaZOFy6VJh2BM/q9LsmIlHur5yxakq0Q4/WqvbgPKh/IdgrdwJ7xwbru4413g0ixSXlEGIvM4Nvq3U0qgLQQz7fxKbLFtbBEoI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9738
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

On Mon, Aug 24, 2026 at 10:04:58PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Engines cache GGTT translations in their own TLBs, which the
>xe_tlb_inval_ggtt() does not touch.
>After a GGTT unmap the engines can still hit the stale translation and
>read the old page.
>
>Issue an INVAL_FULL (intra vf) invalidation on GGTT unmap, gated on the
>GT having any multi-queue engine class.
>
>v2: Use xe_gt_has_multi_queue() helper and other knits. - Niranjana
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 23 ++++++++++++++++++++++-
> 1 file changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 4cddd69f0e99..0f8946fddbaa 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -464,6 +464,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO); /* See xe_pci_probe() */
>
> static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt);
>
> static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> {
>@@ -502,8 +503,11 @@ static void ggtt_node_remove(struct xe_ggtt_node *node)
> 			      xe_ggtt_node_size(node), use_scratch);
> 	drm_mm_remove_node(&node->base);
> 	node->base.size = 0;
>-	if (bound && node->invalidate_on_remove)
>+	if (bound && node->invalidate_on_remove) {
> 		xe_ggtt_invalidate(ggtt);
>+		/* Drain engine TLBs so a recycled range can't hit a stale entry. */

NIT...may be here or in xe_ggtt_invalidate_engine(), it is good to add a note
that for simplicity, flush the full TLB instead of context based invalidation?

>+		xe_ggtt_invalidate_engine(ggtt);
>+	}
> 	mutex_unlock(&ggtt->lock);
>
> 	ggtt_node_fini(node);
>@@ -612,6 +616,23 @@ static void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> 	ggtt_invalidate_gt_tlb(ggtt->tile->media_gt);
> }
>
>+/*
>+ * Drain engine-side GGTT TLBs on teardown so a recycled range's next
>+ * occupant can't hit a predecessor's cached translation.
>+ */

NIT...Given we have a has_multi_queue check in this function, perhaps add
"It is needed in multi-queue case because, ..."?

Anyway, LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

>+static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
>+{
>+	struct xe_gt *gt = ggtt->tile->primary_gt;
>+	int err;
>+
>+	if (!xe_gt_has_multi_queue(gt))
>+		return;
>+
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
