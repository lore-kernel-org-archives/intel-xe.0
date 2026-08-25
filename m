Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3174C61DBD
	for <intel-xe@archiver.kernel.org>; Tue, 25 Aug 2026 17:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5940C10E16D;
	Tue, 25 Aug 2026 17:54:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n7wwPTCA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0326610E16D
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Aug 2026 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787680448; x=1819216448;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TlbjZTVq2fYV5mMJieT/iRw121Zs4N45gAw+n31FijQ=;
 b=n7wwPTCAnCS058HEBOG55MrOfH82Zz5DBFmNtvnNEFjgA8W5CeQmxzgb
 A6FYvDGZlKaU9yYgRD1ZDGLkruqhzBp+Zst9kMB8ExoszEMI2YcgM4k9o
 fymzBIgT4cb1Msjwoo0JwfmZcMeyAw/4IQlwk/F0giDi9/ymWKkUKEl5C
 9M3EJ49XXw+QPNV5jqptu7ayZLTkuF9pEZ+bAGoTuCPJ51j/alQRcabfF
 iH+DhEjOZVuuG3g70WMjjKxZ8HR68DxIqST+J54H109haSyJxvKmDURkF
 xol75jD9tbKaVYegPk+m7vCal7Rx/1Nm3M1GzY+mqUOHiVyia7Rp0g9EK Q==;
X-CSE-ConnectionGUID: wpSUM8qZRnSEexxpVhWjWA==
X-CSE-MsgGUID: qeofa9TBQI6IpEd41EeqVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98829841"
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="98829841"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:54:07 -0700
X-CSE-ConnectionGUID: qjk00W7tSVGwmS2iwrJQOg==
X-CSE-MsgGUID: +77tOyXFSVuQZ4FA1WE6NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,243,1779174000"; d="scan'208";a="267381800"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 10:54:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 10:54:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 25 Aug 2026 10:54:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 25 Aug 2026 10:54:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKwZcPeV0hHuDJTD6L77IThwz/62eNOCLCRMjFtR71at5BRMRjm4Arhg7y1irAhudp7UwIQENJU0m9N55IHzx+5CXlUpCmPHWlBvDCypyD6mqVQVvtqwW98xqXWurFhaa32EhdBiVT4gUVJ/lwydUJNW64H5ZqkEQ+eVSo/EC4VHXvVwYybgCC5ZSQ22T4uil5tvpxWSH13GTBkuBiQuKGO+1ggokiJDrT1KCAX4Z21CWswSlriQvVap9PGBLorkGxgOs8HwtIFO0qiu79ZoA0Sbz5oClBCfzww7R3zl0UZX1AGSbOOj0vKJAnpXJeci9p0Ij8t7SABRe9BS6m3Msw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exDbif5Ll9N+mra5Ihrvr17PX/6oQWFAVWebXyjWkhs=;
 b=yNMkbtsymGPFwNmXODqQ/+2uTo0GIFW5DmidfyE4s/XqkZUUOx2y7Tj078vfq3h/z/bfW4vAhWat8LmpgbKb4bTRbTs+NDoo2rJrbzilvBPJdKfzzwiqqyfSPiFcO9n0TLBZXXBcFFTyy07//1Tj8U0WRwBawOsuXauuqp0rK7uUmLwCz818BrFAL1LDyurriz59wrjEO2T8jh2DZVlrcb2GCu5w2AHpLQYVy0eSmbcHxKpeYvAgw9fRd0lP6dETofeGV+gXhTuq49gNe3TYAForqXBl7SuZGve48saiyp/BYFUUoPoXr+UnHBYYtaD6MSB2ew2BtFoGask/uO4s1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 17:53:58 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.006; Tue, 25 Aug 2026
 17:53:58 +0000
Date: Tue, 25 Aug 2026 10:53:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <tilak.tirumalesh.tangudu@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to
 scratch
Message-ID: <ao3WtGrBnfpnzTxA@gsse-cloud1.jf.intel.com>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
 <aoyK1aBEIb9lcOZk@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aoyK1aBEIb9lcOZk@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4820:EE_
X-MS-Office365-Filtering-Correlation-Id: 448c189c-84e2-4b11-fa24-08df02d1d6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: giFNd/yVVpWbJYol3C0KsdX1QJaQUNRXVfkHlej5oHApIM8SCRU0Nr3onRy+tRM9DtY1tpnmw50qsVAx53ekEG0aW22wSs2ycQydlYJZBED+xsVkpYFdi2aYW5YMNLeKGYbSxM4uFPEEg7dQWw2x4FYKQQsP8cY4XGpB0nC1wZJxpVcLAGz8pIhCu/eSV10i38185kzqSK18gaJB5U51gsQ30yReW5JjiIXsR4W9Hm1hXAWzSoQLUuXi9vcZhZkOukHnfFCkymGB36cpg0VfNFK7GDz9uWjFjb69JM7xTD2vQCmCppb52MZN8L3YeGOnAYWNqtbNhjo240BURu6wr3usV2uj1z+GOFnkCvT+9ZtsGwzwiQwvqmiTGgM0zBaWvZEbJTtB3N2IUA76Q25ugxZWgkjCRdqwfR6UdfmTU6oH+XKUKuzCiQdmXFNNL0d/cXN9raPctHsOuCXH0hUyWuCghTX135nLaMlWl9rBHlqs4OY84taszM57XKzgIo9dDyQqInudo56N85QCDm1IvhBF3Od1mpIIy2Jau3gH3pTlqPeO1I+0Iiqe/vUE6DKgwu+VA7s0LF0cgCwGhiUHXzuXhKA1Mb45nDMhiXhdvlBLA+0WX1ocuie7icGm8bZh/x2EDn2yeXd57/oJk53N8l4pfV72RuZzyrXK0Sc3uiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Uw5rPudg2Ab58DyY1V2h3CiB/h+zrLv5XYjcBaZeC1z8nZAoatabKapmFyTe?=
 =?us-ascii?Q?LepTB9LEEZSLQbscOlx0zPOwjfmaMTmke6xfVPsH/8Y4HwqCHqKeT5SQaWC/?=
 =?us-ascii?Q?HaPXRAfzbDx1UFFy89vjI7TsFh74qteYV1RsCioeJYfp/gXvuvr8kIPWsnrm?=
 =?us-ascii?Q?aJjBais4JMIQ23oY4zW+MS8Ov7WQw5RJnAZ3zekcBAjtb9CsGrAm/SuF7h0b?=
 =?us-ascii?Q?SKTwTtrsOvpqA/DotyIVgaD1YhdrqJI5Pw9nRP6vmwj0iLoQYhZmtIMmzzNo?=
 =?us-ascii?Q?V2wEgRjE78H1Zi+DoBphl9oOYspb8RbPLLnwdUlovdm5dEbsICEvTrwM3ucI?=
 =?us-ascii?Q?WLk4KIqjdUUDKQsFKLA+mFny/IF7zw8ti+R/Iak1haXfrsx/TIqOMjQjuRv+?=
 =?us-ascii?Q?8p5bNuja6Yo7VhFSwgmO4E1T8KciKHngAntiitz8YYTrg/do5ggGZqeMsKbA?=
 =?us-ascii?Q?UXNcUwRiCwsm2My43ySTCaTFa7s1sHoMot8YXMXyH0t1psFCHAMDjAlLbXgF?=
 =?us-ascii?Q?ukyC7PpY/rVmJpdbUzwRHVOZHqPB2S8pPBOI/TH1hRJeJ2C1bc9DQ7B6jnjf?=
 =?us-ascii?Q?Kk8oEZqVpE0kDXduBb8s8Ku7eLAQ4VKlcM8+JS2tbVG+IMVrprMtOvh4QECm?=
 =?us-ascii?Q?r61MpQw2x4DRpsdRxE+lEhGDeM+mEpzLBTGuCasz8GkJvF6qNEUGo6I1RQgD?=
 =?us-ascii?Q?ObK+xGeBavGNz3cXwDxXw5ZSRPQVwWrLXzcB/y1xxIJ5fmlH7adAv4ejqr6y?=
 =?us-ascii?Q?WULScb0QHE+X8ZOCBhPbzRL4bv6fGHV2jvFymn6SGGbu4XR2WR5A73i5hnbE?=
 =?us-ascii?Q?kjCHGWzmBlWfOYH5K2BrYfklStfMFssSZTf6d/uKzK/ZRL2sdk3/CwWZaR/E?=
 =?us-ascii?Q?+9f7324ifwmz0TAM0ANWxP8vZeLjqvtefrond7pteU3UPxW8q1idQCLh3n1V?=
 =?us-ascii?Q?b+OqtJGpaaAQ8SPsCqFQCbavmhRCvceKRuJUdyAu/xAqhfTyfQX949D5GvzY?=
 =?us-ascii?Q?B7ZdBowXIAuOuH07txIt+0hIvUdsfBVMSnyx9E9uVgs785YVw1vIl7t571Hf?=
 =?us-ascii?Q?rxbgag3tI0O1i/+lchscBbv1SmP0bz8Y8wgx4H4vy90sYJ99MXdE95y4+1TK?=
 =?us-ascii?Q?WvG9CMA3E7JBDUKgMzNjxOQ6Hg7FrzV5raq/tBSpzs4QucvvqU32Xim2UF2I?=
 =?us-ascii?Q?O8J4pSsF5R1BYQZAKnQW/ZthwEwoUy9xb59sa3zlxAhocJPiN1Nf/qC6ENhm?=
 =?us-ascii?Q?G122dz5ER3WG7RX9khKqSibE3p8DYPu9JSA8OeOVmNue5hgZN1VnJTZ6PWZK?=
 =?us-ascii?Q?if+JgRsiyVOCHXktjAkiv3JSbRUtg/T2dW+fnEeTQtciHd5gSRz+ILN2l4WT?=
 =?us-ascii?Q?x8g9CVqXmUTlWOWy7C2L+dG15VljfbVsuBug3u6ENO+IzN+Mg+lsRisn5YRh?=
 =?us-ascii?Q?18jG3n+FhV0wdcOive50Yv2uOt6KTFOlp1MjJ7m+fAYj3nDNB0eb4WDgCRdL?=
 =?us-ascii?Q?lQESVlSMWeKS/mVbpCz6EU8R7y/Xk91oAdpv8UV8RC14hR8c93mbcmE2rx3b?=
 =?us-ascii?Q?wDIf6wwkeyd8kuvB4+G6xHR2pHK3Ss4+gJz3YU745rcHAQLW5iNxo4nC7Bto?=
 =?us-ascii?Q?FSPR0Qb6zlOC7yBfP98zYy2vsedgEG3c1r+nWDhwtqKQCYEDPd4CdiD01+rc?=
 =?us-ascii?Q?i1i1moyv7dDYnQGUIXWeLMfCoS9hoVp1L5u9OuHimBTTpFVomcy07FbeM7Cj?=
 =?us-ascii?Q?E3+Teuow0A=3D=3D?=
X-Exchange-RoutingPolicyChecked: AMbnv7jMRPdCYzbqOnwWmaJnJ4FiEorrwBffvweUl9hNh9shsai4QEXwVeIZuJMfFa8PmLSb1hmYuRzZw4K76Vx3uRXvI2w6Ws5kEG1GIMdyoT/x0zzl7juDnXJf+P+kWxY/6WPBzPSwVK+tzObF2tCAvMlViyqIIrylv86Gn0t6BhiKZ5wPk26RE6uage6/75uJa5wBs2GGQ9YU0TN9u6JBqSkfiPB5E5Od7XJMEBaH95NRQ++aZYh8w3h21sT1T3KEVcEvnwyyJTBfMQUTlWngQJ0QrZANOkGzDtAEnRnTy5c4967pNvS1HIow+nAVvEcnajmK7tOFRz7fxa/Pmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 448c189c-84e2-4b11-fa24-08df02d1d6b1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 17:53:58.4988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJgqYKzN4PXQG3dR/SnvWWJgSA/KqsYLiyieub+gkApHbIEp5hXeyJrh2+gNP+65bJb0H2VJ77L5WHtX593b1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4820
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

On Mon, Aug 24, 2026 at 11:17:57AM -0700, Niranjana Vishwanathapura wrote:
> On Mon, Aug 24, 2026 at 10:04:56PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
> > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > 
> > xe_ggtt_clear() wrote a scratch PTE across the range for both
> > initial_clear() and the node_remove() unmap path.
> > 
> > On unmap the scratch PTE hides stale-TLB gaps: after the range is
> > invalidated a re-walk lands on the still-valid scratch PTE, so a stale
> > engine TLB translation for the freed range never faults and the
> > invalidation gap stays invisible.
> > 
> > Add an explicit use_scratch bool. initial_clear() keeps writing scratch.
> > On multi-queue platforms, where engines cache GGTT independently,
> > node_remove() writes PTE=0 so a stale translation to a freed range
> > faults and the gap becomes observable; other platforms keep scratch.
> > 
> > v2: Add xe_gt_has_multi_queue() helper and other knits-Niranjana
> > 

I'm a little confused about the rationale here. Can you elaborate on why
this is being done?

I also don't really like that we boot with the entire GGTT pointing to
scratch pages and then, over time, as we map and unmap entries in the
GGTT, it gradually becomes populated with unmapped entries that no
longer point to scratch.

This means the behavior can change over time. For example, immediately
after boot, prefetches into unmapped GGTT regions do not fault because
they hit scratch pages. Later on, the same prefetch may fault because
the corresponding GGTT entry no longer points to scratch.

The answer for scratch needs to be either "on" or "off", not something
that changes dynamically at unmap time. I'm fine with deciding to turn
this off, but the behavior needs to remain consistent for a given boot
and platform.

Matt

> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_ggtt.c | 47 ++++++++++++++++++++++++++----------
> > drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++
> > 2 files changed, 47 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 8ec23862477f..4cddd69f0e99 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -20,6 +20,7 @@
> > #include "regs/xe_regs.h"
> > #include "xe_assert.h"
> > #include "xe_bo.h"
> > +#include "xe_gt.h"
> > #include "xe_gt_printk.h"
> > #include "xe_gt_types.h"
> > #include "xe_map.h"
> > @@ -257,23 +258,36 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> > 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> > }
> > 
> > -static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
> > +/**
> > + * xe_ggtt_clear() - Clear a range of GGTT page-table entries
> > + * @ggtt: the &xe_ggtt to clear
> > + * @start: start of the range (GGTT address)
> > + * @size: size of the range in bytes
> > + * @use_scratch: true fills the range with the scratch PTE (init-time clear so
> > + *		 engines walking free holes read zeros safely); false writes
> > + *		 PTE=0 so a stale HW TLB entry faults instead of silently
> > + *		 landing on scratch.
> > + */
> 
> NIT...Kernel-doc not really needed for static functions. General comment section
> should be good. I prefer keeping it simple with general comment, but leaving it
> as is is fine too.
> 
> In any case,
> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> 
> > +static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size,
> > +			  bool use_scratch)
> > {
> > -	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), XE_CACHE_WB);
> > 	u64 end = start + size - 1;
> > -	u64 scratch_pte;
> > +	u64 pte;
> > 
> > 	xe_tile_assert(ggtt->tile, start < end);
> > 
> > -	if (ggtt->scratch)
> > -		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
> > -			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
> > -							     pat_index);
> > -	else
> > -		scratch_pte = 0;
> > +	if (use_scratch && ggtt->scratch) {
> > +		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile),
> > +						 XE_CACHE_WB);
> > +
> > +		pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
> > +		      ggtt->pt_ops->pte_encode_flags(ggtt->scratch, pat_index);
> > +	} else {
> > +		pte = 0;
> > +	}
> > 
> > 	while (start < end) {
> > -		ggtt->pt_ops->ggtt_set_pte(ggtt, start, scratch_pte);
> > +		ggtt->pt_ops->ggtt_set_pte(ggtt, start, pte);
> > 		start += XE_PAGE_SIZE;
> > 	}
> > }
> > @@ -459,7 +473,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> > 	/* Display may have allocated inside ggtt, so be careful with clearing here */
> > 	mutex_lock(&ggtt->lock);
> > 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
> > -		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
> > +		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, true);
> > 
> > 	xe_ggtt_invalidate(ggtt);
> > 	mutex_unlock(&ggtt->lock);
> > @@ -473,12 +487,19 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
> > static void ggtt_node_remove(struct xe_ggtt_node *node)
> > {
> > 	struct xe_ggtt *ggtt = node->ggtt;
> > -	bool bound;
> > +	bool use_scratch, bound;
> > +
> > +	/*
> > +	 * Addition of a secondary queue while a multi-queue context is live on
> > +	 * HW requires proper GGTT TLB clearing, so use faulting PTEs here.
> > +	 */
> > +	use_scratch = !xe_gt_has_multi_queue(ggtt->tile->primary_gt);
> > 
> > 	mutex_lock(&ggtt->lock);
> > 	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
> > 	if (bound)
> > -		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
> > +		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
> > +			      xe_ggtt_node_size(node), use_scratch);
> > 	drm_mm_remove_node(&node->base);
> > 	node->base.size = 0;
> > 	if (bound && node->invalidate_on_remove)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 65a4655b0994..92d934d50244 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
> > 	return gt->info.multi_queue_engine_class_mask & BIT(class);
> > }
> > 
> > +/**
> > + * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
> > + * any engine class.
> > + *
> > + * @gt: the GT object (may be NULL)
> > + *
> > + * Return: true if any engine class on @gt supports multi queue, else false
> > + */
> > +static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
> > +{
> > +	return gt && gt->info.multi_queue_engine_class_mask;
> > +}
> > +
> > #endif
> > -- 
> > 2.46.0
> > 
