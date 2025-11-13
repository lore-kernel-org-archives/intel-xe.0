Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97A6CDB462
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 23:28:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680F810E960;
	Thu, 13 Nov 2025 23:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAh4nDKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FC410E960
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 23:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763076495; x=1794612495;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VHbPaxKbL1/J1FM+4qES8rRNqaSmivekJgXBla+t6PA=;
 b=CAh4nDKLudzsrTVaJzOvggkIO+zVaOYNS4vagjRkIsNGsXH4jHQ5/+bx
 Hd90+LVTp3+zEWYTH9ghpLbwJMviJITnqHkhBj1Yd5bOwGnyii+2/foUZ
 SU1ji3amG7y624xUVE+62lS8MAYPXJAR4jvC4ja4o0Da4HhwbUrIoDxBQ
 q+yNHRL2rhL+b6K7HmC8Jqgf8Q26j+C8SqSHtiME7IRT7U1cJto/3+ZSy
 ECN93b8PhfahT2/78c0n/Qv5WrRs7dnU6rmmOc9LXvaNC+xGhEaYDsYkl
 SiCxGbbcXS/l4X058UnV+LsQQ2GbvM0LxzEsCEl13HWArNzG6wlpYojH1 g==;
X-CSE-ConnectionGUID: 5yqIVw2nQIqlJCGGZuatHA==
X-CSE-MsgGUID: wiyHs+oIQFeaj5SqOd7nCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65106282"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65106282"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:28:14 -0800
X-CSE-ConnectionGUID: IQjGoNbZSguhqh76ICcGyw==
X-CSE-MsgGUID: fPMqAoklRQa2RGaxZHPLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; d="scan'208";a="194619915"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 15:28:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 15:28:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 15:28:14 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.38) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 15:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uaQ+vq/N6onlXeW/JMnPN0NS1q3LUwJOoMndA9tI25EMSa7ifx2xIustujRFCLJQ6iyQ/4oGAqJRkz9l9ShJjwp9vAgrRnbKwQE8aC1SDKbJ+X4yWzcd5ItIalVQgcnyuZiJK5Kr4jOIUPzfXiAAGgVp6sriP9cUje6Hz5hOpPAvitVIyEGkXjms9mBYkcrqLjDRnxWfRPwiZliElLg/W7WmGlbf3CFDwixCMrXDCcqE5YFQ9h8GnjdIxt2ePHhCsjx2qcVfa5Cd+NB89ga18H2iPOvkE2Vohj43lzgGcJpYXOm6KX1hXHkjP0p389f1c+Cl19zn4ga9lJ7ahxGM1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGzXvAHN/099Ry23WQdqoIdUkL0GZytgPFnZJH7IROM=;
 b=fl0+hgw7+APd+OjoneHGVam4VSbjc/LZ6PZ4++vcyG0KcOUQVHEIWuHf4516GqfKX9M+LWbUg3F8Ucx0x/kuY3nmx1zYAt9qx0Lgr/WHPzXO5J1Hy/I7mZX7rR88DC5zdstG+zjsCpltwnjW8TtCphv0s5upzlq24iNuZB5QOyssRNUz5p1XxQD09kVDyUUuyCZnsPO7bTNeMMP5/PhUZm+x4HtW7J8Ix+pSFCLDnAljStfDDTlHufQh41BQ0+dgj7z0USnzsXzxJz0VZsecAp1PAWFZCAZF7x4A4vCKerWLuzKIQ6Ij6dalHtTFZplPoAhsCLKGO3/SHsNJw2ZYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 23:28:11 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 23:28:11 +0000
Date: Thu, 13 Nov 2025 15:28:08 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/30] drm/xe/mocs: Use scope-based cleanup
Message-ID: <20251113232808.GQ3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-42-matthew.d.roper@intel.com>
 <176304061624.3698.11188036014431727920@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <176304061624.3698.11188036014431727920@intel.com>
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|CO1PR11MB4995:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c25c87d-e12b-43c3-9cf4-08de230c4f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tgxadcgBRbjWR6X/dSfvwidd1Jmtxo4Rymv5jbgJoYTJEYBoLGx0NbIgKZ9u?=
 =?us-ascii?Q?G5i2Kuj/LrU8ypBHUnL90UqAVQVi44T3KLKUx9KUFkhd3UA0EgBaNxV+sZhZ?=
 =?us-ascii?Q?GX6m+2tIFH/ExxV/GZ1meGZznLa7QNls6jhkPZaKMKdqZtw13jSux+Art30F?=
 =?us-ascii?Q?kY7XG+pnvCkRKZMEEcokQ9RZVUG77f/Ru3xPQJojLWSCWFFQOdjipbi1FR7r?=
 =?us-ascii?Q?QI2deDV7ummKmzO5ceBXBhwMr7FmtQgg2bUdqr+VTEabmlO9MANg8fWjJjaL?=
 =?us-ascii?Q?whZqp/oxxngOEJRfWZUKy5EWkcI8rtWpzQo3VucO4F5uj963sa7CBDheQ264?=
 =?us-ascii?Q?xQsEDuLm1Lzu6HBfxiqQDzIc5O44Peg1f62agyoOUYV4rATAfxh95Kx2/Xsz?=
 =?us-ascii?Q?NPaZnfma5fl3UvzluP6qtPQy6opaJpUTLHEa5Fa77aOKm+/lbV1N0QGu60U4?=
 =?us-ascii?Q?9o64AWYrHVimz5RSa8PmUT+sfnKmI94/4rDCh2R9R8LS7AXtZ2cORk2/NTQS?=
 =?us-ascii?Q?aAGHitMWhOw5kOiKhR03bv/QH8R7G09o4ghqgCYPsFW8IbvNwrnPYYFMJsqy?=
 =?us-ascii?Q?ojZJ9qdtFvzRvfPD0U8Rzfleoh+eOdLeq6Lyt3rJgMByoUR06wNzsVuzc6p5?=
 =?us-ascii?Q?prWpF1EH2aH6xV81wYFk7t41CZ6pRx5u+OMIYNmk8eFdA1ovE7gM5TKWlhAg?=
 =?us-ascii?Q?OOmqYDSRL9IIASyyCJFQaHe0I0eG6R63JZ2cgMqQ4og8WHCGvMvDFgk+JkEe?=
 =?us-ascii?Q?8cUJm1gzZNN3GFDVrdslNj5uRkiBpVWgjpPf8nyBPo1AZN4xJ7dVFH+L8lPE?=
 =?us-ascii?Q?B7Zhl7O70voU0XZBTK8Rl2mmP3aYwL9hldsLgdbmTQTCTYEyYCroM5UqPlOy?=
 =?us-ascii?Q?Sp1KAjsfcYqfYF59S7sXnU2IOTOFzIEUkg/9VhOipj5ggULNs84XHtcQ7r6j?=
 =?us-ascii?Q?woDBs04XsWbw6UQjJjAQvEHnFQJ3br+2JW2hi6G8F1iHV2DyC5pXNwup/EYp?=
 =?us-ascii?Q?yKxIj6i4hOqq5pFiBYia9leKC6JfPkki9nw5AAbUQouCBi8L31br6qPHmoXO?=
 =?us-ascii?Q?JsgXsM5sTPUwXOTAtfVDHB32eOD8hRk/1Ao/c5BWEQwqDzW/QhZIVvDWxd9C?=
 =?us-ascii?Q?n+9fWLjOE3iENL2Ok1nbY0nHdYs539JhPhn85JnqArI9MIRyHi0QvriQ443k?=
 =?us-ascii?Q?tytBvPQ1o6n0+9+2tqEsNo/pGqxfPdMNd1MgaQ8h8J23xns/E0u9h7V7WUWv?=
 =?us-ascii?Q?h7bfDJXHjygqCTLB6GCsEjG4UKQggCuiwNQ8uisGfnL3t2HqcHNmAHTBOhtH?=
 =?us-ascii?Q?8R57mfhO8UenDOD0lIEE45kBmK9UAxV9V/70xrhE+A7w0bdkhpBCr5YnV+YQ?=
 =?us-ascii?Q?U7LwpCt71PkKzN8eW3JJYNNvjwMBvk8h3y1Yr3PAKglevwB7ZTJPOk7aWzQS?=
 =?us-ascii?Q?LI3p8TVc7bmpslOAbE3obWQBjfV9dbNy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x9+92m73dCjA2hJkB7zLGk8t5P7H1nN0GR2UkxqmIUSaFgCHDn+XDHiSgt9L?=
 =?us-ascii?Q?Quh3MzeW/c+PspcIVbrBS3AqJ5S6AdgvulB4oxw/3i5xllP7ZtoWi3IW++O7?=
 =?us-ascii?Q?rQZPJkQVVJEDlvwWHtHeVqYjecQ3L1OeCokX+ocFfZN/zBZxjXP+jrIbq1AP?=
 =?us-ascii?Q?lhJSjCvhU9OSzOA70j47detYTY8MT+dXOIWmIRebexRibajuNVse7Pka1xMq?=
 =?us-ascii?Q?qf+WA3i4Z+SmyptAqMqHMEHEOaV4l+jmJq3dTQdzOfkVphRzd+geW+teNhww?=
 =?us-ascii?Q?F2J5nG95eB8UbVGy7mGu2FT2ZqWoJTHDlxlxfI1QUGxlIci9srKDMrhsRi0J?=
 =?us-ascii?Q?vfowCSWzy82bdwuLmkHalsB1XS2psvROwVARdtdKwFa/hB2p3dmj6V0y2tKT?=
 =?us-ascii?Q?caXNKyMIsNr6czvqTmN+GMZTPvCpZVdZLeAXRYu7vMfRikrlcEBwQnBUqOjG?=
 =?us-ascii?Q?LH+TY0axieYYmjeqZxLDhQKEjcG0xYMShIGktcgVtSl3moieXaJdrgPAUYU4?=
 =?us-ascii?Q?cp5eblWVYGBjfnQa/zJjqkHKa6+pX1RNvJC6nonX0BEVDq5eRqTbuVWzoilH?=
 =?us-ascii?Q?Vind9RbfRaJjcxA8N6rCpGkN4qyaSYs7OVpgKVW0a/E8NYOYjbbePXDbNP8a?=
 =?us-ascii?Q?icUF+Rd7XkvMmJLGR3vRQeYcLJ3dttKJixkggT9YUZJDDR5xrYXBA/nZMlQu?=
 =?us-ascii?Q?6wvMQ4RiZ89SOWIhRk4p8f8yK4lhJS6pvS3L6MkVTkB/3zYkoWBMV10tFmki?=
 =?us-ascii?Q?VRnnBTMBex69dhXwwMyPiYUxGGMiXbfWl439453bbj+DJhJBxzEKHZ8VYohg?=
 =?us-ascii?Q?rHoBOTcbjMrctheSOV0kfdP63Vh8ZtfrGqYAU43Reb4FrRS4neGzzpTlODD/?=
 =?us-ascii?Q?VhqOrx70S4GszR1UWfz6WJ6/GI4PA774t+KGkGYMulPQXaaFW8YwJPJSB8AY?=
 =?us-ascii?Q?ImcFZsgkz0e9mAP2c+MzyiQz3gdYh0ZKOaTrQw8FDSfqsNUM67ZjBV3l80XR?=
 =?us-ascii?Q?oWDvEIzNiZNr3yTavImdwSJq5K9RO2nBQIB6zIWHKSYYMKXDrRUtKbcSe467?=
 =?us-ascii?Q?FV8yrsQy/vwJrj1PaDOx+hfXsgY/prS4CV0p6Y1Q8du8KlDB8AgWtpNimr6T?=
 =?us-ascii?Q?eWc/shbMsB2+CIuY4wafo24K/SsTJ6bkXyTSu6I5g7EZz2jlgVlr493roW9E?=
 =?us-ascii?Q?Sa4ftEe9qDyEH3A0OmYDckRjEGlZgaK4eTrpKhXKqznDXrR0cimZSMKxM8Ct?=
 =?us-ascii?Q?hsciYiHMjDvmvXqBZbjlrnmUwff5pOc6stzLPcHwCzky+n2R/MD4vEIW1tQr?=
 =?us-ascii?Q?PrhuYCts5deLaS6gGITYOxi7/YTwj+xLwZy2JqtC18OxznY+2tm+EMvVj66i?=
 =?us-ascii?Q?JoKugNZwyuoq3n6fbRgfMGaPfG895X27VZot8HlqzuuhdH8QFObviy9OT36f?=
 =?us-ascii?Q?Wp60iKPrTy867/56TjRdSxjuh0uA5zRb+EOLYhjghxkEUtDy+7A5grkRAXk8?=
 =?us-ascii?Q?Yu1wV2se2ZMc2LKB5e+vN0LpL+r12rL2uXJjw+ga0LqVH7nUZtBRglZLIc7W?=
 =?us-ascii?Q?iNPrldlzXkFPT4xaHOJpTc9/8YkP1S0udeCm6/d7/5rwdeyH9/KCLjcBOksK?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c25c87d-e12b-43c3-9cf4-08de230c4f62
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 23:28:11.3146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lFk++UtDOsjctyn5jqGsWaJKVZre6bvcnKdVBp9obkmtKuL/IsjLu3bN5/SOjmFuRytETtzHLGAnNgs+Vxym392A3GTrFjLf1dJVEVC5Nbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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

On Thu, Nov 13, 2025 at 10:30:16AM -0300, Gustavo Sousa wrote:
> Quoting Matt Roper (2025-11-10 20:20:28-03:00)
> >Using scope-based cleanup for runtime PM and forcewake in the MOCS code
> >allows us to eliminate some goto-based error handling and simplify some
> >other functions.
> >
> >Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> >---
> > drivers/gpu/drm/xe/tests/xe_mocs.c | 17 ++++++-----------
> > drivers/gpu/drm/xe/xe_mocs.c       | 18 ++++++------------
> > 2 files changed, 12 insertions(+), 23 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >index 0e502feaca81..53a0c9c49f85 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >@@ -43,14 +43,12 @@ static void read_l3cc_table(struct xe_gt *gt,
> > {
> >         struct kunit *test = kunit_get_current_test();
> >         u32 l3cc, l3cc_expected;
> >-        unsigned int fw_ref, i;
> >+        unsigned int i;
> >         u32 reg_val;
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> >-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL))
> >                 KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");
> 
> Shouldn't KUNIT_ASSERT_TRUE_MSG() be called with false here?
> 
> This issue was already present and is unrelated to the patch. However,
> since we are touching this, maybe we could fix it with something like:
> 
>     KUNIT_ASSERT_TRUE(test,
>                       xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL));

I noticed this earlier, but figured the fix should probably be a
separate patch.  Either moving the forcewake check into the condition
like you mention here, or replacing the assertion with
KUNIT_FAIL_AND_ABORT should fix it.  I'll include a patch that does one
of those with the next revision of the series.


Matt

> 
> The patch it self looks good to me, so
> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> The suggested fix could be sneaked into this patch or we could leave it
> for a separate patch. Your call.
> 
> --
> Gustavo Sousa
> 
> >-        }
> > 
> >         for (i = 0; i < info->num_mocs_regs; i++) {
> >                 if (!(i & 1)) {
> >@@ -74,7 +72,6 @@ static void read_l3cc_table(struct xe_gt *gt,
> >                 KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
> >                                     "l3cc idx=%u has incorrect val.\n", i);
> >         }
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > static void read_mocs_table(struct xe_gt *gt,
> >@@ -82,14 +79,14 @@ static void read_mocs_table(struct xe_gt *gt,
> > {
> >         struct kunit *test = kunit_get_current_test();
> >         u32 mocs, mocs_expected;
> >-        unsigned int fw_ref, i;
> >+        unsigned int i;
> >         u32 reg_val;
> > 
> >         KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
> >                               "Unused entries index should have been defined\n");
> > 
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >-        KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
> >+        KUNIT_ASSERT_NE_MSG(test, fw_ref.domains, 0, "Forcewake Failed.\n");
> > 
> >         for (i = 0; i < info->num_mocs_regs; i++) {
> >                 if (regs_are_mcr(gt))
> >@@ -106,8 +103,6 @@ static void read_mocs_table(struct xe_gt *gt,
> >                 KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
> >                                     "mocs reg 0x%x has incorrect val.\n", i);
> >         }
> >-
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > }
> > 
> > static int mocs_kernel_test_run_device(struct xe_device *xe)
> >diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> >index 6613d3b48a84..0b7225bd77e0 100644
> >--- a/drivers/gpu/drm/xe/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/xe_mocs.c
> >@@ -811,26 +811,20 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p)
> >         struct xe_device *xe = gt_to_xe(gt);
> >         enum xe_force_wake_domains domain;
> >         struct xe_mocs_info table;
> >-        unsigned int fw_ref, flags;
> >-        int err = 0;
> >+        unsigned int flags;
> > 
> >         flags = get_mocs_settings(xe, &table);
> > 
> >         domain = flags & HAS_LNCF_MOCS ? XE_FORCEWAKE_ALL : XE_FW_GT;
> >-        xe_pm_runtime_get_noresume(xe);
> >-        fw_ref = xe_force_wake_get(gt_to_fw(gt), domain);
> > 
> >-        if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
> >-                err = -ETIMEDOUT;
> >-                goto err_fw;
> >-        }
> >+        guard(xe_pm_runtime_noresume)(xe);
> >+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), domain);
> >+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, domain))
> >+                return -ETIMEDOUT;
> > 
> >         table.ops->dump(&table, flags, gt, p);
> > 
> >-err_fw:
> >-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> >-        xe_pm_runtime_put(xe);
> >-        return err;
> >+        return 0;
> > }
> > 
> > #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >-- 
> >2.51.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
