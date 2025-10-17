Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEE3CCD199
	for <intel-xe@archiver.kernel.org>; Sat, 18 Oct 2025 02:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4011B10E1DC;
	Sat, 18 Oct 2025 02:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0mhKgSv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C44A10E1DC
 for <intel-xe@lists.freedesktop.org>; Sat, 18 Oct 2025 02:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760755605; x=1792291605;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lX/W4WyTs/OQKUtIE1rRb5UxS66BRPavUDBSJUR8ON8=;
 b=Q0mhKgSv4s3zgQQLFHt/CE+wUJDL0DgTZ6ajQMt/OwkAhSv33DbtsPm6
 rERgghK0Vn+psobLZe3zCFSK4xxEz6ai6On6dJYHNfIg31BJqLphx3WNC
 r5IsgQstnybOGLjC91OM/ad+1G7fHE5vGDbwogRTVwidls/RVD8Fxl97L
 rU99msglPW2VJrIxBtfGghqDbBAqiaNkNpg0QBvX83/8djTkE8LYEUqte
 nFcek+PXmeuDYK4PaSJppUPgMtlxFGhrwW4enhwQTQtMZ5VawB1kURKzC
 YgqYT0fnnZXr9vvkyNiGLxvLNRjMlnX9E0MqFf13D8o6vLUS6RswRDWjq w==;
X-CSE-ConnectionGUID: JfoK+lTtRtGjni/tZKt8ww==
X-CSE-MsgGUID: z6kSCG7ERWmXwVfd3JOUUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="80407771"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="80407771"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:46:44 -0700
X-CSE-ConnectionGUID: WCoGe3w3SE2MT2PePf/+ZA==
X-CSE-MsgGUID: YxBQZZGJTQ68w8QCAf/p6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; d="scan'208";a="187289732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 19:45:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:54:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 13:54:25 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 13:54:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IURHRhz0FfY/8WBPjMA60p0rC9e+4v5OKhiDcP3IMgW1s9lr44LqURSoCXqNRgV96sqxGeNJfVud8rL6OmMV9E09kFrp2oL9VurRfbG1NJC6C7ppGbhHbiosFiR3BYfb00tvNInQW3KcSSxchnEFYlAySAWwCd5tPxWp9xc9cXZr5uVBxytUbyCN81ggHnO/YlVdIfCNMaW8/WXLtDvVYTuUIaeH2GaNtJNsiOTf9mnM6sji+R+1mw4qkHcTbxQBHmTh3HxLwONBd2tGZnuJJKHeAPo+Q5JNO3IlH9GNwoWmWXpCGBxhpt9x0vsHzUUfqLBHH2cs5yT7dFe52KWQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtCIL6uACjwmwhs5K+2yv7VTwurtCCK60Aa1ZDNfXO8=;
 b=ojxDx9T9W2EFO/P0Ul6vt+xGvlm/cBFaNrFM5LCUKnKc0B9C7LpTAatE0hDjWmNGK16PRYxhzV++ekbf/IHJaXeLn84AzVmsUHENfmoRuDD9cotbaSvQH9+gC4iskSl7Sz1fIl5izQh/ruA+H9qprClQ4bzGNFtX9axTL6gBApGgDgXdg3DEkhNfurWDjNSrCRTDBplloAyq5ba2MYRM8VmHiGBLqkb6Fwzq3Dss/IIA+spXqt55zZ+A3FVy9Q+8QqskS2yZ5xturH19RSM5SIu/x7RRvkPEyBNBABcn6yRXHHxRQti72CubIGJNSqmYVjpF73s1ZnNUEPeZFUQTsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8746.namprd11.prod.outlook.com (2603:10b6:408:202::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 20:54:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 20:54:23 +0000
Date: Fri, 17 Oct 2025 13:54:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v7 05/12] drm/xe: Do not dereference ggtt_node in xe_bo.c
Message-ID: <aPKs/Gznyh9S6T/l@lstrano-desk.jf.intel.com>
References: <20251015074708.1654014-14-dev@lankhorst.se>
 <20251015074708.1654014-19-dev@lankhorst.se>
 <aPAZDgE+lzyg/wGG@lstrano-desk.jf.intel.com>
 <09dea8f0-afc8-4292-a63d-c6e8775e8540@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09dea8f0-afc8-4292-a63d-c6e8775e8540@lankhorst.se>
X-ClientProxiedBy: MW3PR06CA0023.namprd06.prod.outlook.com
 (2603:10b6:303:2a::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c39cc90-0bc4-4cb9-4185-08de0dbf59c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gepgxWBmrl9BGRE86fvKYnLGkMaNuee0Ny1m1FytkzC6PUB6Zeq8WCH4slB9?=
 =?us-ascii?Q?rhzH7Z3GvY7m8RqTpadpKfcpjwHqAoDa0TZNYyfcl2psvXyIuG4cnNHo061Z?=
 =?us-ascii?Q?WXf1HaisjtlIB/WWGMFufdhfPNeX+wYLUgH/Ez/5kTVABG1ZRejPKekJ46sz?=
 =?us-ascii?Q?F9HCq4bbj+UpXyr7nosbDqi5cBKCIxNbe9RmeclfxwBbev80V8I3NUJ7ZznG?=
 =?us-ascii?Q?63g+i39+Qmn9IgMBkkz8A4oX3qjdhHNSe5sM3Ih4kfX52voiPip4CpH8pxj4?=
 =?us-ascii?Q?GBfx2Tx/fdDeveiUS8en+LvQffV6qO8FdK7fQNhUDKXIReynWEG9doYjqOhX?=
 =?us-ascii?Q?GbbRR2WRtpQZA0irHunQ7UzADkQgvRMPK6cvzT0+e6aoibcjATjSl437QTBD?=
 =?us-ascii?Q?BFj1aWWo7i+FlOIq/YghHVE80cx1G8Koy2cgEo6EpNO+n770cU7E8Oc2Oya+?=
 =?us-ascii?Q?M4n63jf31GEL4Sed0tpAZh1jwoLnhWf/X+xEmIkBhzk3P0efq91DOaw280Ef?=
 =?us-ascii?Q?zN610C7+EeO2RXPUkB83Y+QOFmA+UsWdQokRCCXpGVDX/ZusOxiCI9CeJDQc?=
 =?us-ascii?Q?Mivl0G2Td5xbubIa8j3GMaYobdbaPbEMl09bkwBFAMETqvSe8w9x0kDPF4Cj?=
 =?us-ascii?Q?ya2hgxJvxEEt+IOcX+qUvbXMzgsBYCgOAZ/FbZtaDieeJnX81XFnzgfBcOqe?=
 =?us-ascii?Q?yc+PyvEKVrr1sNshx76gVqDkwHmzATqKF5HSL07Eg4KvqCBChhG+sGdCSseF?=
 =?us-ascii?Q?re3H0CRpmHztxFgvNEUylmcJLo35rGSkZyvRhyrTLnAxMrlSE+tVi+Z3sPQD?=
 =?us-ascii?Q?hJb/gOAaMge7S2wWRvBaiSC3p0E7PNsn2FasQukE73lp6dsIt3yTzcGBky2Z?=
 =?us-ascii?Q?qOMdqU58iRefiuYBS9P5lVGXVSNiYjmAm2GkxzxYg/K4W+qbmL/rsRxmnxcU?=
 =?us-ascii?Q?9FkAzrGfK7ZepRM/NdcdlauewBMp232rsUcCJnOCj6LZC7dtnYaDCHvImJCc?=
 =?us-ascii?Q?urzbbs8OYw7S0gWse6HJExUuvUoQ7AIe276x+bGc70kYWqsEhpv+z/6A9toK?=
 =?us-ascii?Q?pWS7R5nQPSPvtJk2jt5YUBc0+wCc5NzrHxjFjzbY1PLCXjWK/C4gN1yhqYvF?=
 =?us-ascii?Q?k9ScwQa8+9FD+OsptfuTimQztZS9YwaMCHoTejm/p1RtmMrYHHCx6upRpaXB?=
 =?us-ascii?Q?V30GMs+KuvxDDDxytQStx3/rantfyTgQoztM/8lBm4U3r8pg+NDCNoPFy8g9?=
 =?us-ascii?Q?UOdhqMvS+u4psCUbXAn/fui7ArDIziSVvqGapUZz450+o03Un+C661nBksfV?=
 =?us-ascii?Q?1oDqNI/rWqIPAdQpbqMr8V1GP563M3DGztp4ARF2UwtUqj3QCnlILEw3xbMj?=
 =?us-ascii?Q?M5/zTVKbWsuKtla9Qh/Dn9pzYhPTdomi4yRFJgpAwMjsrVxH79mlYJVU1RgV?=
 =?us-ascii?Q?6jMuovHAMXJLFfrLqr7hegpRqgjDAIcO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CrJSPUXzlulnSeEXDcCMukpgFhA5QLJCs43B7OyptL7ZRy8NW4Eldn6ILabd?=
 =?us-ascii?Q?LjNCo2kA0tQElrgQagYvt1ngb6D+u8Zc4qHYdCOILB5vBYNh8CWn+MMOROHe?=
 =?us-ascii?Q?+meSTqL6FIfjurbRE9i1uKoTTWlB6KDlXeQiBD8Y0jjqfqUv4BvQ+TOSo8vF?=
 =?us-ascii?Q?WkeMC1Z3aaigBafA+g7xFTNyZwcxExnU19kp5BPaime5BTRBeH93EUg8LmgO?=
 =?us-ascii?Q?n91BQidZiDgbRcQIMI3Kg6JB+op9DobtRzaY6CSBZhYE7/liXlDmTug/dW7Q?=
 =?us-ascii?Q?unyQIaTIVjckM1TJHFh1KCJaAzKVBtvgHVIPtga4lIAMWvCr5sFoawJXsTnt?=
 =?us-ascii?Q?L6HgcVPeb4K5kQtRfcYM1FUrXGzTyOQby2IiTQNebponOcr/bpD/0bZyhyJE?=
 =?us-ascii?Q?Dv/3/T2biQG/HMcHoOex+MLZfyxsXeY4q8l4uqF1ZEUge+X3H4+FqhpR0p7c?=
 =?us-ascii?Q?4rTinbSuMyj+WGWy87SA2JMP0CDkc60aL669t2X5VRcs96YrfchZjxvuVwwt?=
 =?us-ascii?Q?bEnv3RlkWmDczPUmF9Momabu78rxBes2s5EEa/NM2la8NnlFPjWYgD+T0D6G?=
 =?us-ascii?Q?XliXb1g2P4LRJx1hTk/qaUfHh+X6Vpc0eOmYFyzbO/2lDLblw+lBMps8tjfV?=
 =?us-ascii?Q?vZFcHYR7dIMlxfeJ57sz5YT868oFr7CGicZgzzix7RT8L7/JhFzpGzP+6v++?=
 =?us-ascii?Q?RRpvEdip2ApPB+5rCsuzgceXBMpwRRXVK/J3kx8L1EO+Qop8MXNuH3MgdXSz?=
 =?us-ascii?Q?Ym9UFzDHbHjsZNA05r1y8hhjl7/j+tgzLvHG/wKYmWITSown5thl1g7s6jIa?=
 =?us-ascii?Q?+AU7cwgc95HKaGbNl91A26wqt/Nct4zS2vkGoHlYrTM3aau4HV8C290HZeNT?=
 =?us-ascii?Q?ameIVQNcgM6glI561jiQOAm9lzTVcmblHa/Nr/2BI0ewhb11oK9ScEK66ufu?=
 =?us-ascii?Q?7MCrnRnK7r8PUiW/Ar590d7S7I9a3lnGQqpKZj3j7mFRQukshvP7in3/zGBH?=
 =?us-ascii?Q?6efQ+J3orQMSsd8kVT8PaLz/xLZiYqVR1jCDlWhA+bz1BEtYakOAW0JGk0gG?=
 =?us-ascii?Q?wUYTrOTkZcnoWKcbY7/ek0kEfKMj0e54UGKETtTYOHk7wDCGLcbqf5a6/o5G?=
 =?us-ascii?Q?ioIAnFnLX7AfNLIr5RshyEyi4Q6B15vaHn3S8MUnboXDgn8clFkV5FHd72nx?=
 =?us-ascii?Q?BmK7g47SXIIDKtv/rOgcuWIKnmirAkvagrYS2/9r3RrvRm9vF7jaDDlBnEYl?=
 =?us-ascii?Q?Fxegdu2ypA93hE5u3n0AHDvP+l8PDl3GSnYhg1ldPUhSTfvfC2La2Jp4QTYV?=
 =?us-ascii?Q?WqfYbF9TSvKi+M3+QO42Igjeqfh/wnfxvbPXF43PrwGb0DUaoRe3dqP/68D0?=
 =?us-ascii?Q?WaZWcRtQEgyK17kHo04Pxpg6uzfRuXYw7IAXhFcD1U1Aj/2k/j4uCViWWF9c?=
 =?us-ascii?Q?EvSVHVW0qG0IuxmJTnRGlGNBRC5vfCn0OB/aBLyoH5nMKqJDrhRg+VaoPw9t?=
 =?us-ascii?Q?fpGi9XKG5C30nRF2AcXqY98LoWRisKA1RgiJA5XT1X96hbo4/Kd4dyBF1Lmv?=
 =?us-ascii?Q?vkI7pd+IiYJgCbAmHFlykB7FI+U1/DTzbbLBG/yEZkRExqdVzlfkiiEzU+mI?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c39cc90-0bc4-4cb9-4185-08de0dbf59c7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 20:54:23.0626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxfOsrsCe2V42uL6hSXp0bc0FvZwpbV/cAXGPzHTwGveR+iw4rgSZ+KnawHiD+RmE58VTdcyY0sPZ6lo92dIEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8746
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

On Thu, Oct 16, 2025 at 08:33:19AM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> Den 2025-10-15 kl. 23:58, skrev Matthew Brost:
> > On Wed, Oct 15, 2025 at 09:47:14AM +0200, Maarten Lankhorst wrote:
> >> A careful inspection of __xe_ggtt_insert_bo_at() shows that
> >> the ggtt_node can always be seen as inserted from xe_bo.c
> >> due to the way error handling is performed.
> >>
> >> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> >> ---
> >>  drivers/gpu/drm/xe/xe_bo.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >> index 7b65020818738..c895214a7a570 100644
> >> --- a/drivers/gpu/drm/xe/xe_bo.c
> >> +++ b/drivers/gpu/drm/xe/xe_bo.c
> >> @@ -1700,7 +1700,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
> >>  	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
> >>  
> >>  	for_each_tile(tile, xe, id)
> >> -		if (bo->ggtt_node[id] && bo->ggtt_node[id]->base.size)
> >> +		if (bo->ggtt_node[id])
> > 
> > The additional checks beyond if ggtt node is present indeed look bogus.
> > But perhaps to be little parnoid, maybe call
> > xe_ggtt_node_allocated(bo->ggtt_node[id]) here?
> 
> A quick check of __xe_ggtt_insert_bo_at() shows that we never assign
> a created but not allocated node to bo->ggtt_node[id].
> 
> I'm getting rid of xe_ggtt_node_init() as an external call later anyway,
> so it's safe to remove here.
> 

Yes, I see that xe_ggtt_node_init is dropped later in the series.

Code makes sense with that.

Matt

> > 
> >>  			xe_ggtt_remove_bo(tile->mem.ggtt, bo);
> >>  
> >>  #ifdef CONFIG_PROC_FS
> >> @@ -3581,8 +3581,8 @@ void xe_bo_put(struct xe_bo *bo)
> >>  			might_lock(&bo->client->bos_lock);
> >>  #endif
> >>  		for_each_tile(tile, xe_bo_device(bo), id)
> >> -			if (bo->ggtt_node[id] && bo->ggtt_node[id]->ggtt)
> >> -				xe_ggtt_might_lock(bo->ggtt_node[id]->ggtt);
> >> +			if (bo->ggtt_node[id])
> > 
> > Same here, call xe_ggtt_node_allocated(bo->ggtt_node[id])?
> Same reasoning. :-)
> 
> > 
> > Matt
> > 
> Best regards,
> ~Maarten Lankhorst
