Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188FFC5DF97
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 00:32:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4719710E043;
	Mon, 24 Aug 2026 00:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iijvLIOK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D6610E043
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 00:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787531556; x=1819067556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2e03AdWJMCtAjvwRWk4/Pef/Lm4QyHaVZnqQe23CB1I=;
 b=iijvLIOKHlLUeW4XWMoS9X+e9ubXBoe1AVrf0MTvoJrLysvQt8RRiM6c
 9/BgSmiSM/pkADyV7bZd+XkXpTvpsSdVtKtw2KnDNwJwqmgMlGqw++L7V
 3PQvj0orhi/hpGZGZIfPDTficq20MpT6rIu5RQ4sm5ksr0cY9IPQBTh6M
 APH9RAA70E8vLLBMPgggpOY7xChe4cf9VB4yDhQHU5yOSpmd7M/pFvgey
 VcKY0EY8Oh+Lgz6Pe25shibMUjw5msclgEbRfwezjua4lVBQ6Dj7c9YFh
 /C234GUQ8CA17wW8dpSUzZnk83rF1koUOtJMAbaJP/m2pRsi+R8R7iepS A==;
X-CSE-ConnectionGUID: TrUEhg3+SAqOewa2HWRwpA==
X-CSE-MsgGUID: kZhdmfzpStGcylroVs/RCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="91653899"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="91653899"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:32:35 -0700
X-CSE-ConnectionGUID: Xo8G5V0/RiG08bN4f5dqng==
X-CSE-MsgGUID: 9IRdmhjbQIeEa+F/Qmlysw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="271064829"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:32:35 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:32:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 17:32:34 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dU6AorG1ZUPWqTyod/si7kcjS/qexrE7pCb9VYdzbyDTct/E0xG0NRknxFYfJx3ke8ksm0n81GBSfhA/Sr67bEkJMmoFUOPWv2rzVSeRaDU9cPju8192zhiebYN8rkV4fdullqMfvLWqsrYhPP1XJ+lQdrHsPtsEnBXWU+gDQnFhJ8XiwtMMp19fpRDjddSmaAVSSLJQJoQ+vaJ8SKX4sWtqvjNoBLOZMyimewd0F+VO4xKRFE3APU5Rp2TQXjaGHwVFLLBXk705idxWajcIo7B/2AIOk/6PptGlRbqp3iCObYQq17MbJCptpxUmI306FFVdnhQso+yv8b8V1oacGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uO0iEc3HSbKkP5Hix0SSKPErUD0/fOAt/K4IecAY3o0=;
 b=cBiIyUhFe/jdcTjQXPJDzfpV8iRjSbbEW+Oll8D7X3J9sxdexJtK5ijCrW4dFoIIP8/9x1b7jqYWP1X/I0bwOhcQarQuWpI/aZytjHelpN/IGT7HhdKBaSIjjVjcU9IqzEsJyvc+8BKX3gN9BYdPP0wYd2Ag45GyMUu7NXdLDy1XP+GzDlFfzKc2M0O0uByPUo1jAtLRFngiOV6U7AcIfgupVrXKteC0+iCYNAyYw7/PvQ3NMsXGuzIkIdYdbTBnmhsr+1XORXN/whgN2vNeU5YDn/T/g+Fjvq4CCgTyLsVN63mcNmuY9XXJ05/1vERcpYt6g24MzcC+ILbFZifj9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LVWPR11MB9905.namprd11.prod.outlook.com (2603:10b6:408:3be::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 00:32:33 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 00:32:32 +0000
Date: Sun, 23 Aug 2026 17:32:29 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to
 scratch
Message-ID: <aouRHYx3o9bTDhT3@nvishwa1-desk>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260821074238.3000501-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LVWPR11MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: d096eb34-db40-49ce-b206-08df01772fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 8Nrb5Mjuy7UWU2ga9sfYhLiw7b3zXTtv2O9EH6RFo9lpibSN8SHnKYbpLJnaj/0IcpGO1ZJHuKohuOOJBecuGZg0AwuU0FbFV36Y56DzPIiCIEtFmRPbvn8bJ+Clbmg1hRqnWjHgO/if/6gwZg6Gd17qRoeqQg4N36kRnZNVKhlmE3lULLs57flLjcS5z+UQyflqNTwQAy4qDRULmjxmIINfHM2MIyvkJxJNHPB3m9sj0Wo8GHSMYxnES7Kz9+QLlpz9Gu/X73bq7ha4qerJ/4BJVPq8IDsESXLlAKS6XQHm4WZz/Sawx0/WwTs8uh3UaaMFRm7o8slp1mapo22DgE1GRCsXDiYvwsEaJH7C7uO0p5aLzeFFvGWZnghE8hgTXvK3U2XaqpxcSAKNCP3gNZpXJ7O+48nL0bltiUaFaHFUpU7Gt8fdM6Ayo+QkN7JLw8qupB1Wr4OEe1BDJ2dbBYMmNO9/mmE2NuISHeyHQdT25cSYpMEbpOvNU1q8B5uu8jE/atMVlsrWEE8BIYpPU/+GFDgNWKw9XPkHwzACaQDC7anTNSAQx64mVmolvWXu+uKUKFmkU7UjQBq+8/LEGsEo7+fvVqQjUosDPKOJmy+F54p5NOkNDEeiZIT1oaotn61SqRQVUI3z6kG1r5TcyGpDVn0BkjDr1GZpbOCUgcw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B/GNZyUHJdkVgxVUMeHAticMZHhOpvVejVlHGu9Pi9Y9/Q5I/x7sfZFwZTZg?=
 =?us-ascii?Q?x8hBWg89tZrQzuxizGQ5Rhg3X9xlXCF67onhvlD2bFsnlAja1Q2i84ZILcmF?=
 =?us-ascii?Q?V2e6TVMCuOGxX3Nul8paDyhSHRKE4OLHhfFIcY9fxuRjot6Ri4CaNDv9yP8A?=
 =?us-ascii?Q?P691NqQTTaUjet/lIaq/cMxRTo9Y9P7bUyUD/+80YVIoPetU9eNuLm7/FwUO?=
 =?us-ascii?Q?5jdoKZ3KmBRFEeGMvtV83wVYSAvr8UiU7BKFW9qrYN2kiynkdcS+VOhiDkci?=
 =?us-ascii?Q?pZYsOGlNVPe3iYKXf59zSucxS3KjKW2ukb/dam50mCcWvevtFlNNmFyateIn?=
 =?us-ascii?Q?fpJbur8le+vsKp8zNdGQuIcJcWQRJ2u9qZFVwYPo9YFuHLRHyH/XIsF8Qql+?=
 =?us-ascii?Q?uuMleQtB+4y12p686kw/A4E/g9mq6MbGdP35IMdNC/GkcepF28ea4N5mL9yv?=
 =?us-ascii?Q?3EOEf2YORdGAirdWCUMxTVMpkbyct5TggIjyvbWS0x1P5S6AK8082GwSe4Ud?=
 =?us-ascii?Q?WaGa3D0q9UXgvNakF8+9Obh3RBw6EECD173CMqOdCV3x3ND6GsPvphQTEMDS?=
 =?us-ascii?Q?4CbQXOO6YSx8/5HcXBFcbrDgbs4DogSy2qFUWU7bKnTi6rThS6iUGOF4QuZ4?=
 =?us-ascii?Q?EkVGhFhvAg0q7SnbZdDn027EpurrgyRACjWIwQcKI1nlVq2Sqi+01dmCXcXd?=
 =?us-ascii?Q?pCEz86DVfG8RQflVimjxKBjQcCI+NhgI8rAgHqUsDZ8vXtRAexjkMhMXyiui?=
 =?us-ascii?Q?+NIwDDrIjCDB0rqXHR2H5NKt7xsni86vnCZvch67EE0WAds93S+tHgx8TBV2?=
 =?us-ascii?Q?Eks5B0ACzV3VlaTzKUVTaipzMO/aHnZYkRSeIQPVujgInc+HQDEK+xwPeUvO?=
 =?us-ascii?Q?NSEHn1fE4I+adhzCMDI3852xOEmGhgK4gLsicGYylwTNTy3evRV+LPht7/8o?=
 =?us-ascii?Q?Hn5bTsOIGyr0gVyB4amenmSHSjnttifOQLHIAKeifEfMuw1h+begw/Ej0WmI?=
 =?us-ascii?Q?wCnBkd52Hr5t9H0OIZ0EqL9S7XtVB7J9Nre2SS3J3BhhNqCwnXxqJmG3l8JW?=
 =?us-ascii?Q?/1Jzs+nHKPdiNt7jSa44AepJ8RWG5B+RAUPOnBWxWpAKrRUZTQW6U1gw+GGS?=
 =?us-ascii?Q?OAIVsNNN0asdzl/QnN8mcvqWEvi7uauvjL6/wkvAEWNV38c5FePmWq+Cwwpl?=
 =?us-ascii?Q?qunXibVS/W48TTUw7G+LMsxLSM6XWFhZQ8rnYkXjc93lNIKJ/dIHtOxjaaiR?=
 =?us-ascii?Q?7W5KiqwDR1T9qU/PAq6AjALc06kxcTnBWNYRBBSWLHdNlY2UqR+ZEzbP7qAa?=
 =?us-ascii?Q?UPY+JLBruZnC4RxWNDnmDJVShd87iMDoRs1JopDUO78anOqxrnayVJF/zALY?=
 =?us-ascii?Q?N0Zz8rm3UQfL4/UjVNJF/6wKm08n/h4xDVLbbj+VHv+IHKkKx2aTBN3lVJHm?=
 =?us-ascii?Q?v6IIKajuKWgctwyHHik1ayGxIQrxS7XgWNLRUPBvBOuqfM1c+0+9qRBbpMJJ?=
 =?us-ascii?Q?froZpmNAhwgehFbUK5N7eeBtu80i0SF4aprYsZvceCiJTmETQgWP/P1VZge9?=
 =?us-ascii?Q?3qhPIZgc97e7IcAmetnGeEUgDobcDL4PJ0KswTTM6Yvp7lQxHubv1za36dXE?=
 =?us-ascii?Q?8+bdt+bSkSP7cD7j6/6HLGxHRSEbPO2SxS1rBwtleTcdMFdPvZ3U/plbcz1S?=
 =?us-ascii?Q?ZxRJMCq8KWGmQvjcrCzqjsBxEJytClL/ayrogyxxdarr5UkMOsMeIEQZ5jJx?=
 =?us-ascii?Q?VHGBL7Dn5XyAZ/LXvZiuVZKSj3coCrig/jsjmvXtPLG4TXXpiIWu?=
X-Exchange-RoutingPolicyChecked: jhaO8G8GdNxexjKcSW0CEdpAwHUAfN9GznkQeZv54O1uALsVtEKCQMrI9Jq9qs7wsrEXzX2AfTnbZ2OGyDtUrb82eQUcz6B/DIIdM7ky6jVLdJOKy321dF3Ix8ERB7n8ATG483kG1ReorDJ29wqVTvb0NPUscVsslR0aQjGdLcz+rwv1S1lkL59rNtoicmCDf+1cvWn9pUxDulkc2Cu/klQTpPEz3QYz5xyUZ1irJx8kJR0LmkcQPpraLhMIoElUT2iUK1ZbMDSXDotj2bXgcRSDor38Pc49QTpG3rp6mPb6Iaba3J6THDE2Z3e15nGCXdZrZFrbBUS561B8PCzzBw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d096eb34-db40-49ce-b206-08df01772fc5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 00:32:32.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnzmdRiewyQIFWttOcnHIiaOY17x9yrjb/7qe4PqAHJfNOPCU4TvaunPhIGZk8lrz+4TXLxkV/6llcm9WIzSX675nq/0ZOzKOIJtcmC7ZJYSDmrko8BLPjZHAB2pU2Ng
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR11MB9905
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

On Fri, Aug 21, 2026 at 01:12:36PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>xe_ggtt_clear() wrote a scratch PTE across the range for both
>initial_clear() and the node_remove() unmap path.
>
>On unmap the scratch PTE hides stale-TLB gaps: after the range is
>invalidated a re-walk lands on the still-valid scratch PTE, so a stale
>engine TLB translation for the freed range never faults and the
>invalidation gap stays invisible.
>
>Add an explicit use_scratch bool. initial_clear() keeps writing scratch.
>On multi-queue platforms, where engines cache GGTT independently,
>node_remove() writes PTE=0 so a stale translation to a freed range
>faults and the gap becomes observable; other platforms keep scratch.
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 38 ++++++++++++++++++++++++------------
> 1 file changed, 25 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 8ec23862477f..3564345fd740 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -257,23 +257,31 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> }
>
>-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>+/*

Kernel-doc requires double asterisk.

>+ * @use_scratch: true fills the range with the scratch PTE (init-time clear so
>+ * engines walking free holes read zeros safely); false writes PTE=0 so a
>+ * stale HW TLB entry faults instead of silently landing on scratch.
>+ */
>+static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size,
>+			  bool use_scratch)
> {
>-	u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile), XE_CACHE_WB);
> 	u64 end = start + size - 1;
>-	u64 scratch_pte;
>+	u64 pte;
>
> 	xe_tile_assert(ggtt->tile, start < end);
>
>-	if (ggtt->scratch)
>-		scratch_pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
>-			      ggtt->pt_ops->pte_encode_flags(ggtt->scratch,
>-							     pat_index);
>-	else
>-		scratch_pte = 0;
>+	if (use_scratch && ggtt->scratch) {
>+		u16 pat_index = xe_cache_pat_idx(tile_to_xe(ggtt->tile),
>+						 XE_CACHE_WB);
>+
>+		pte = xe_bo_addr(ggtt->scratch, 0, XE_PAGE_SIZE) |
>+		      ggtt->pt_ops->pte_encode_flags(ggtt->scratch, pat_index);
>+	} else {
>+		pte = 0;
>+	}
>
> 	while (start < end) {
>-		ggtt->pt_ops->ggtt_set_pte(ggtt, start, scratch_pte);
>+		ggtt->pt_ops->ggtt_set_pte(ggtt, start, pte);
> 		start += XE_PAGE_SIZE;
> 	}
> }
>@@ -459,7 +467,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> 	/* Display may have allocated inside ggtt, so be careful with clearing here */
> 	mutex_lock(&ggtt->lock);
> 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>-		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, true);

Not sure if we really need to use scratch pte to begin with, but should be fine.

>
> 	xe_ggtt_invalidate(ggtt);
> 	mutex_unlock(&ggtt->lock);
>@@ -473,12 +481,16 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
> static void ggtt_node_remove(struct xe_ggtt_node *node)
> {
> 	struct xe_ggtt *ggtt = node->ggtt;
>-	bool bound;
>+	struct xe_gt *primary_gt = ggtt->tile->primary_gt;
>+	bool use_scratch, bound;
>+
>+	use_scratch = !(primary_gt && primary_gt->info.multi_queue_engine_class_mask);

I see this gets used in one another place in a later patch. It would be good to
abstract this out into a function. It also requires some documentation here.
Need to mention the case that addition of secondary queue when the multi-queue
context is live on HW requires proper tlb clearing.

Niranjana

>
> 	mutex_lock(&ggtt->lock);
> 	bound = ggtt->flags & XE_GGTT_FLAGS_ONLINE;
> 	if (bound)
>-		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node), xe_ggtt_node_size(node));
>+		xe_ggtt_clear(ggtt, xe_ggtt_node_addr(node),
>+			      xe_ggtt_node_size(node), use_scratch);
> 	drm_mm_remove_node(&node->base);
> 	node->base.size = 0;
> 	if (bound && node->invalidate_on_remove)
>-- 
>2.46.0
>
