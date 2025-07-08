Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1904C83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 19:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19DF10E1BA;
	Tue,  8 Jul 2025 19:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V/qP3BKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FA510E1BA
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 19:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752001367; x=1783537367;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qmdLP17IO0enjiodPkwRg8Rq5iSSJyz20uV21SohFPc=;
 b=V/qP3BKLEYkAajLWwo9WBH/iiy8B/sQnrTxnMcVntVphgAQXM6rhWliS
 STEf51ukDR/DHpmJYEU95Dt0hJRmzFusL/KK5dqAy78Sf+9iyPJrDGVKw
 iZSEPlsXSwX5ClU1zSNy0SW05++pk/+vS1H25vMq/vdhg3jkLgsdXX7Kp
 4sKtfbmBq+FR/XAjEkY/YgS719ZXYpOzClPignjJEEAWIlvXPLXf/FOrY
 n990UytK3K1id5X3ZFd48kYwWYU9SXfWv4RUt0tPaQ33TthwpWySf6Ygb
 oYtCDcptKEtcDSAW1UetTviuKbbDyRT/e2P4LJ5mcjwanFgqOwjKrUWMm Q==;
X-CSE-ConnectionGUID: uaBPjf7FQNmyOHJxYZA/ag==
X-CSE-MsgGUID: ViThxDt4QD+DmGXVGvYjyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="58018298"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58018298"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:02:47 -0700
X-CSE-ConnectionGUID: b0k8qL3FSmSUawWXr43rVA==
X-CSE-MsgGUID: pe3zyyt1SuymoF6iynpUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="186547099"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 12:02:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:02:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 8 Jul 2025 12:02:45 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.55)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 8 Jul 2025 12:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMyU1RJooAgkQN3xX8RHULxNiLe/Fy/XQXpF1Dm0+9Y8cl56+c3GaHGsuf2jcCxWxAwXz4wXmV/1F7+KEVYBYNKGvcVkoG3ccvISiRImsDRLnzwauASeesIzQ9JRD0Gkdhj0jzGgKPrS9iCCk6Hn0uR3M2PHLtfZLO6xo/mO3l/jhlA5TJX4j7W6kWJJrA9B/s0n8ML+jtYk+1c8GIw7PEebxOFh6WeJKs1MDWsWc3GcezXlmaILvmdm6dAFN4frKVRP0wiGq9Gi6oFPE0woAinuMwwUNM6AL3L2oQ4H351K/VT8YmimYEjIY/AhmyAhl0S3obsolwGW2Tn6R+xHfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QN01MYHHRURpoDvuPuUDE0/nA4pwtKfc0+3y5QZB68=;
 b=c9V2S5xFOLNfcf6MGA2rzIIEnkwKE2ZQJCso+lFFwqIYh1bN7o2tYvQsXVZi3FF0AbG6afOBC0LlTGetuOkI0F8SD0vskacTob4azHdQTDTH5lKXi7NL2di5cSC7GJy3K67VjhW1JGCfZx4MCUxW+lXO5BPgkkeALqG9c0KsPmLVHQ/+c5Mhv7nqtvAxOToWhzPU7RSXdZsVLkLbHZcI+cnyj1N65PEqzQfrTOzDYS9ST/NLWg9Xb7AXw4JrE74INQApnvgNG9f9p4a+JHqzeROGG4L2KwjbEohbdUVQHGNbzo5CXyLlsMMNzV+seqZytr5BY+FqsGtqoIHnaVWw8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB4821.namprd11.prod.outlook.com (2603:10b6:510:34::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Tue, 8 Jul
 2025 19:02:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 19:02:10 +0000
Date: Tue, 8 Jul 2025 12:03:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware
 initialization error.
Message-ID: <aG1rmorqfoFSTfyy@lstrano-desk.jf.intel.com>
References: <20250707231108.3217573-1-zhanjun.dong@intel.com>
 <CH0PR11MB5444BDF25578E61761DEE2E2E54EA@CH0PR11MB5444.namprd11.prod.outlook.com>
 <aG1oS2eHN875k//x@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aG1oS2eHN875k//x@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW3PR06CA0030.namprd06.prod.outlook.com
 (2603:10b6:303:2a::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB4821:EE_
X-MS-Office365-Filtering-Correlation-Id: 229146d2-5726-40ce-b32b-08ddbe51f158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GagEeXDmQLd2AD+hPZ1MwkjxXsff0XVnYi8N+cm9ECaRoEB29jQ6idIberOz?=
 =?us-ascii?Q?JUpfoOYcc5H1SZqgeHQBsY2TsuDaHE7s1tQrO4G/RqluHPraZawCcXxgKCpK?=
 =?us-ascii?Q?VRwi5RI3rB9O5GbPh0XOLwz9YO0al6x5zb409c2QRfxVeiOThzUg3KVtTH/F?=
 =?us-ascii?Q?lwnsqmnRh3vUm1KH9rHNg8w0QsKKM3ysMQ9qeUlA6FkR80oPzKpTTs69gGxb?=
 =?us-ascii?Q?u4PAAU1CFAYsMUTQ2ycTcqsG2XVr0lwSBUgxpMAbWpOUyDE6o/Y9jllaKehW?=
 =?us-ascii?Q?IHgxraL8/38LSEajw/AKONCZm9TZP1grpyES68n6EglSpLb/+a1x1qPGh/Pm?=
 =?us-ascii?Q?Pvqc9TmYHLXYAxfPq6n7DRnX3zQWPHzB9THGKiIYoi4X9VlfxBHwOou2GmmF?=
 =?us-ascii?Q?RWHiCi4Jp0Jf8gEUK/qKdxUD8wmONvID9i1hOQ43QHAAXOzAmSu0kl+vWmwM?=
 =?us-ascii?Q?t65FcGCpwpJfbSpv2hVW2IrIsx5LMHNTSPxYiwIY8DfyE+wA2SQ4N0TQESLQ?=
 =?us-ascii?Q?v1+igiZmLfwlQJjnHMaxR/JEnPdpqiXBOEqUEoQKPQBlS+E4I15Pd5U/E661?=
 =?us-ascii?Q?k75kHZNIPCPQpKBOG8L5YvM/YYwuYuudZjr+9G/jdwjap+WyXAKvCpF7Hst/?=
 =?us-ascii?Q?bQgJYPzFXWrStqb3sgAAr3IIPkG2ErW7ZcHx1QMlq2AH4IJioo+rRAiAaeGE?=
 =?us-ascii?Q?KfphmopkZ9X2+FR6ZpEeM1vi2xndyNRj68kLC2Tf8EKvm614ZaZqfhJi5IPV?=
 =?us-ascii?Q?vD2RiDJkCyHcBWpUumsaFTspyxPuqnQPSqq3FakZgshjG88Y0kC4f84xhBRw?=
 =?us-ascii?Q?/AfFCWzYqGPuwvlxJkqLj5jk07hi+v7QsWIhew77r7yVpK/ttB1ISgWn9FAf?=
 =?us-ascii?Q?+KblTHEJTImrCaKmmxmaUCP5uS6fGTpmxPqHqEuNwASss41iq0RLkC080jbB?=
 =?us-ascii?Q?mbna+9YeMCnYkzjnNbsn9/3hnu6RYnQyyIbajjJI2CB3ddVuAMcntGF/oWSL?=
 =?us-ascii?Q?g6FY6wJtHQFw7u7a2XOHYtKTpXPY0C5AKi4C78EGNQhxnp35Gek3ZbsHweZF?=
 =?us-ascii?Q?lf23CH6r1MhkEFTarQHHR2PpzDbjyal6PZHgB+pjo5if53HaqwO8pjMRqlSq?=
 =?us-ascii?Q?3o94ntF2eqTOzdQYRxbPdyZl4DKTkaKCCZa/q40i84joQrW1wQVZulOdIBxC?=
 =?us-ascii?Q?xQCbKZm+9ByoW1rQcmEr2JGjUSPVDmEEe7Uzc6u9JJJBpUC+/sCNF9QE4mgg?=
 =?us-ascii?Q?d5aUpcoP5cD8RUp5mhqT52KjT7E+TTNlUFdaIXCHedv7cOaz91sG6zj9IYTC?=
 =?us-ascii?Q?pnAvs9CaVTjbqzQoOflCI2w/cqyIryzZxrUx3MmzgLJ/ZIwNi2IgIb5wVlZv?=
 =?us-ascii?Q?hlkYN68=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bV2nIj5o4vdJcLAjAUdVDrxzV5p6IVREEDvrLbMXl5qONTokFYHpLJwbYktF?=
 =?us-ascii?Q?xjrE3VKnDvSdUkcNfN7kodmnjDCGGoSkbPPrjGC4KHjX7/TqpizDk3fh1Abb?=
 =?us-ascii?Q?YeMoc8R6IFfchTx0fg8/m3IVSWIP3m+vax7BFWpxCPIDb3krDpTHXc2oeVif?=
 =?us-ascii?Q?PXbgbf0fGBlk93JmfzkaILnC0vXhSjhCoMhvggkdYuOxQmEyuGDFeVMFOXB2?=
 =?us-ascii?Q?oBQjZhvjSEFEn0PILp47IzeZgRL3Et1OIM99ychB1MXrxNmPFZQRnoSV0F+2?=
 =?us-ascii?Q?87ANj7uPHjozGwQz+SNg7XNl+Ovgc8ZoI2JLtti9i1J6RFkEqof0cmgBYOAB?=
 =?us-ascii?Q?fzeVz5BYgj2HjLUCFB7M0JO6FCs8chE3H++2BXFe5WibP2TaDYGkeqns7EZG?=
 =?us-ascii?Q?6vQ5wiNhGY4tTAOC6WTzEGr64cwGMKfuTDH3eae6W8uGhnr6762uFAYm9Fro?=
 =?us-ascii?Q?EGj1MxoZJX+JkF396ifNjUU8rBEqQ8SZJT/fRobv633LtVMuRnZ6T9+uTpzV?=
 =?us-ascii?Q?PRl5yzoVWuq0hSOcRN+ARWtX7LpAL1dHnTc15FYvcQdQ9f8CwrzCireXCEc+?=
 =?us-ascii?Q?aEgKrVfNUROjBbHhLGEoF49UvDYwe9kZ8CXNvBhIU1m8zBXjHmgKTlPte1mq?=
 =?us-ascii?Q?Wx7N4pRjFVWb4BB3P7vj6e0Yv1YbiAQS4Fv4jZEn1ttvSoqrfIetkKDLIgdz?=
 =?us-ascii?Q?jtUE+V1I0TcyG6aJ20L2EtQOCamx62SCsNP4MzhX6qXk8pZOcGF9yJsjF4Q3?=
 =?us-ascii?Q?PbP6ffJoWIPv/2NIoLexC5XohvpfS74ckDadO9Ip45GZC+vXoXXBYFh7ubm3?=
 =?us-ascii?Q?sBtV2gNDqi1K1aQcXcnnqs5unDsQ80szJTGZ0WjgGsuFiZV4SDgbfRJ5QLdc?=
 =?us-ascii?Q?UWnFjpTKG2KTVHUWK9v1mVWi45eNVYst8h++HxSMisoJKavFv51GvCmjNqdR?=
 =?us-ascii?Q?CIstN3iQA3sfBGNQm0qb/uiJzmYSWdzDbLayot6mvPXEp+H/FiBcGxOzwQTs?=
 =?us-ascii?Q?ptwbEarsYQDUAeEGG0M8EWXD7z3wrQr7T/GrqORmIAtSR++/VnEMzf27iSyr?=
 =?us-ascii?Q?GL7l7I4OEqeal3yxY0d5eA0KdYWFHwnVkvf2RTAzcdZljqivZrFcyyYKyaFn?=
 =?us-ascii?Q?yWYs+f5vffQGd/1Sw4Js06/UqRkzzXxJzIZ6GCM7bvK7t4teskHbsEVD/Meg?=
 =?us-ascii?Q?eSTWkb8LWAAUJvMzl3Wtz6FqlzwNYD9AYyDcA/3y9hm/5KbJ4YWPMAq2m20B?=
 =?us-ascii?Q?bITPmrGzQgEOq/UScNcWsZWS7CGw43rgK/X2Y5CCbgMClLKrHkrtnF89gNB6?=
 =?us-ascii?Q?l21DthMj2Drj6hDBq5+fq7OphRbZEE0u2WMcLrrn+MZyM6a7Zlv9rZaqTr+2?=
 =?us-ascii?Q?oSLCbLwKfAD6mpZ4hDiIhiTp0GKaOnaQX2RJid0+R40V7kzcX1oK+ZdWlHgH?=
 =?us-ascii?Q?SMp9CKEMmGA06fyA3doUYN4bkP5hmTxXmDUTQ/4CFuCkt3HW4tg2+sITMBPx?=
 =?us-ascii?Q?6Ty1caZ/31DAbkxQLXiekkbQog0t2rv0JPe7ospTTp/lRcMqkSceeJCsWvxd?=
 =?us-ascii?Q?0uo3JNiqzNymTjstkmpTGtp+l3Oq3eENS+CCUgJDcwIC6QfoddadfXi5KQFO?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 229146d2-5726-40ce-b32b-08ddbe51f158
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 19:02:10.9073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIuEScmOh1jE/FzYEmI2/uZWwGumIOnAlUOnr/TGhD/teY+mzkR4KebfBrQbpAHGsVXTjl9JrUEjerTEpKFfuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4821
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

On Tue, Jul 08, 2025 at 11:49:47AM -0700, Matthew Brost wrote:
> On Tue, Jul 08, 2025 at 12:36:43PM -0600, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Dong, Zhanjun <zhanjun.dong@intel.com> 
> > Sent: Monday, July 7, 2025 4:11 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Dong, Zhanjun <zhanjun.dong@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Summers, Stuart <stuart.summers@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>
> > Subject: [PATCH v9] drm/xe/uc: Disable GuC communication on hardware initialization error.
> > > 
> > > Disable GuC communication on Xe micro controller hardware initialization
> > > error.
> > > 
> > > Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4917
> > 
> > I think you need to swap the order of the Closes and Signed-off-by,
> > but that can be done at merge-time if it's necessary, so there's no
> > need to create another revision for this change.
> > 
> > You might also need to remove the period from the commit name,
> > but that too can be a merge-time revision, so again, no need for
> > another revision.
> > 
> > Otherwise:
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> > 
> 
> Also the change log is typically above the tags, since it is pretty
> verbose for a simple patch, maybe just drop the change log.
> 

Ignore the above comment, I was just aware of [1].

[1] https://docs.kernel.org/process/submitting-patches.html#commentary

Matt

> Anyways:
> 
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> > > 
> > > ---
> > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > Cc: Stuart Summers <stuart.summers@intel.com>
> > > Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Change list:
> > > v9: Switched to xe_guc_sanitize
> > > v8: Fix kernel-doc style
> > >     Add error handling in vf_guc_min_load_for_hwconfig
> > > v7: Add kernel-doc for xe_guc_disable_communication
> > >     Unset submission_state.enabled as well
> > > v6: Skip disable ct on xe_guc_enable_communication error
> > > v5: Set wedge is excessive action, revert back to disable ct
> > > v4: Fix typo and add new line
> > > v3: v2 CI re-run
> > > v2: Remove unnecessary jump to err-out
> > >     Drop disable ct, switch to set wedge
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc.c |  8 ++++++--
> > >  drivers/gpu/drm/xe/xe_uc.c  | 18 +++++++++++++-----
> > >  2 files changed, 19 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 8573957facae..b1d1d6da3758 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -1219,13 +1219,17 @@ static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
> > >  
> > >  	ret = xe_gt_sriov_vf_connect(gt);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_out;
> > >  
> > >  	ret = xe_gt_sriov_vf_query_runtime(gt);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_out;
> > >  
> > >  	return 0;
> > > +
> > > +err_out:
> > > +	xe_guc_sanitize(guc);
> > > +	return ret;
> > >  }
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > index 6431ba3a2c53..3e0c3af235f2 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > @@ -158,7 +158,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> > >  
> > >  	err = xe_gt_sriov_vf_connect(uc_to_gt(uc));
> > >  	if (err)
> > > -		return err;
> > > +		goto err_out;
> > >  
> > >  	uc->guc.submission_state.enabled = true;
> > >  
> > > @@ -168,9 +168,13 @@ static int vf_uc_load_hw(struct xe_uc *uc)
> > >  
> > >  	err = xe_gt_record_default_lrcs(uc_to_gt(uc));
> > >  	if (err)
> > > -		return err;
> > > +		goto err_out;
> > >  
> > >  	return 0;
> > > +
> > > +err_out:
> > > +	xe_guc_sanitize(&uc->guc);
> > > +	return err;
> > >  }
> > >  
> > >  /*
> > > @@ -202,15 +206,15 @@ int xe_uc_load_hw(struct xe_uc *uc)
> > >  
> > >  	ret = xe_gt_record_default_lrcs(uc_to_gt(uc));
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_out;
> > >  
> > >  	ret = xe_guc_post_load_init(&uc->guc);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_out;
> > >  
> > >  	ret = xe_guc_pc_start(&uc->guc.pc);
> > >  	if (ret)
> > > -		return ret;
> > > +		goto err_out;
> > >  
> > >  	xe_guc_engine_activity_enable_stats(&uc->guc);
> > >  
> > > @@ -222,6 +226,10 @@ int xe_uc_load_hw(struct xe_uc *uc)
> > >  	xe_gsc_load_start(&uc->gsc);
> > >  
> > >  	return 0;
> > > +
> > > +err_out:
> > > +	xe_guc_sanitize(&uc->guc);
> > > +	return ret;
> > >  }
> > >  
> > >  int xe_uc_reset_prepare(struct xe_uc *uc)
> > > -- 
> > > 2.34.1
> > > 
> > > 
