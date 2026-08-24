Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C2BC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECAA10E4CB;
	Mon, 24 Aug 2026 18:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+u0RwXt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E1D10E4CB
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787595486; x=1819131486;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MD0ZGCAwZenXXH5eRYUrjeE388P3VK+ywmsq+UkcL3s=;
 b=d+u0RwXtVl39m2vUr8WNQtJHkRBV/MXT5hRb4GYblf7+EVpEKymsOsQa
 dMwl2vLupJNWsPdhGcNcYGfYA7Y0SgWUdpvsEKL4/FOg+jket02TAAfm5
 3M0qxYot0VZH8+JLydWma/PHCFG9lIc6hOR8Iu7HMSRMUVz/a87CiSCC/
 dfDJESYNEdUXSRbzGO2/Xbm+JCSuVFyaIwfN3xLTyLGl5qtuU8Nfc4ZPE
 sHo+AQEyc5v5+9AHQVWR6TwmOWATXwhc9Opx4VMJDDphLTL+cOVvK0Z0l
 ATNcLAgMAGz4xn2NRBDbXpYXF8bignCI+Wav6Ao3D0NeOpMeCrYRDbu4R g==;
X-CSE-ConnectionGUID: CiA+WN1nRzmZw/PyeJtSVQ==
X-CSE-MsgGUID: lQ1MZ4WWSXyg401xJe4Ipg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98646009"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="98646009"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:18:02 -0700
X-CSE-ConnectionGUID: rvhThM9UQa2ohbQLw3KMoQ==
X-CSE-MsgGUID: l4UTNpqAQwuuwPSkoS0EjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="262771782"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:18:02 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:18:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:18:01 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.7) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:18:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dp7UC0a2Y8nadHVi5ouTEkoDHS/kJs8f2WLYtA5K5Ndcb1HoJWNYLX1BeHSiax/B0h+Ia16mOFw7pBZry5SKL6LmcHs0D+vll2gf3r5Kv/qda/zGuGouNAIcnsafH+4n2lDNcIGsDst50ivEIYJzBHp66qKt3yp6dw96Aq9nOoBE9sgLlCJyVypB6FAmzwD4ihDyxXGJ54b/c9ewHmnPNdmTP/VwXIyAb3DxRuW3HZjnFQ7/F5IZ+r5VvT7RnWHRRCSZXP1uJwtVSLek8XbnLla/a0CCTjvXHKIfhxZRCvBs/KV2KgtwC+7+bh/1DL6gZ3oVvYwKB8gDpyYytU42vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkuxg6aWE8VXOK/pRda0u+VhAdroJYB7DU4hn9pszi0=;
 b=jbLn4msbse8w0rYixv1CTM9We11e8kE1H2VkjNPkxRGhvEu0oXvra0FlB0dVrYjJz+utkUrgiYmx/fUHTpB3H9BUKezeOydleoU0owp1OgyI0F9q5tNtVAoVxuxW6CdnLey7aa72joy8jtry0HmVePy2thYARFn3ebaRzWlXhxG1DLOO1YR+KKg+GWrUEkVg/W5Aggis5NgcrEYjrigGmsgXf+mAiAjyxAV8HeTRZI9mHBshw+u2wrjhqZQi89VSqPUYCG0F+XSYOW1g4CBps03msta6OcjzkAgQsybii21VdImEExxPG9PHUD/X+EZt6qvmxDPow4E4ookijmvwcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DSM1PFC0B76D9CA.namprd11.prod.outlook.com (2603:10b6:f:fc02::14e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:18:00 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:18:00 +0000
Date: Mon, 24 Aug 2026 11:17:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/ggtt: stop mapping unmapped GGTT pages to
 scratch
Message-ID: <aoyK1aBEIb9lcOZk@nvishwa1-desk>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260824163458.3129935-2-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0222.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::17) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DSM1PFC0B76D9CA:EE_
X-MS-Office365-Filtering-Correlation-Id: 53055f11-277e-4ae0-049b-08df020c07d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: RTPxTupYvyA1pfj6SMoELAG6o9DY4TJ5qGlkfKWI87DhJHrdnZ/FvLgvzwlicOmaHhvK/o6ZRR7qBhM9D1Omj5I/f+yVIQYaVqVpTCJ8clvtpKTqM4NUELD9RGn/42XDNx4pHabLjwb9Qo4qFSUEgDqAflN/BBKk12WmQg5RhjqBEwsbo2FhUkEsaLcQeFpMq9b7H426drwrXK4YhHpIqd3xtu7O+/EwUuLuTAo7V2R9AQrEpZ7ZMzPZkN8K0g0f9+R+sMcfNpsRCsMKNxR0Fw12ihPlFUKZkbDBgPdnlqCDQ1HPx9x9TTVTviYz9mZwDko5+dhuRETS+V25XkSWFqVbfTNsUqdWdSmwftfqdwKe8bY2Frj/ugezzsZaz/ieDy226XANi7qc5W54T4qtSOkptewqaefLha2OApKfOWOEIIWjMC/mSHJCN97QJbJ1GGCbz4CdZuSpk8WgBTXSnCAuQb9aMlxhKnlmzFwqX9xSHKNZePvKwh8QWjHXrKl8zCNAiZwryUxdHMsM1UExeB8bvAk9BDJpxJbNS/RUeeQRaLGRMmgc+Wc2x1jLIaHUrv0HkcurTzp2TUlbLgalEopnD1dseI0ytt0dL4rcSDJx9sd+flSpAuMtHpaSuIlubOqpniM+IUhPloukS3RKpd+3DzYWH7yf/+SLP4AZzRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uj9eG7zREV9jjK1QiNqjd1oEoYKl+1diLBByWNKBkYlzQpupMv8sDTfGcdua?=
 =?us-ascii?Q?gUtHbMxSpGmdctD7ZXlaQx9ZJqduY9uPvK4r8Rj0xxKKLvVD5x9Hqz0c4X1D?=
 =?us-ascii?Q?0V9slcb2Dq2PL5dH1uo0Bqq1YKCWRKXiXIECaWd+y/gx2ms22r5/1LJlBiFR?=
 =?us-ascii?Q?60hgvOOG1n0xuQSNEa3wohqAcsAmeUNanp3P8q/FYcdcGGosovdts1MmZoud?=
 =?us-ascii?Q?WmPKF4fmMYtaPSs+Z4M2iUL/WxKvCAoS76C75yzupk9D6TrrgZ0INpvocU5K?=
 =?us-ascii?Q?ZJIUXLzBUcKg8orUki8Y4GR07/hy0GaBXaBHNWhvP9+oHuDpC/mqWwiiXdEc?=
 =?us-ascii?Q?ePmr0BmfMVavJ/66r6zRqCnSMbcscFq0TrNvTddQpIqKRTtnIkxMewCt5pOt?=
 =?us-ascii?Q?I+oMo2E0UhHiE0ZM+UDbFDfaRm3MPAaFrDTnzohJcVArNlL402gBBAo6orlN?=
 =?us-ascii?Q?mSayHyw11d+ta70hGZEzwpGIkn8F1gve2t2dLr2Vt/JK580HGYspn8xSDFk8?=
 =?us-ascii?Q?fY57kSDW9tQtQJ4/Ae85FJByapWX2Uwo19/7VoE8TkM8KMUiPGaRJhHRBR5n?=
 =?us-ascii?Q?9z3JlIdk5hjLC7z/Mq3B6RzL7+JkowyoDB0CkzUOs0czCXQiGwD8Y9dJ4g4Z?=
 =?us-ascii?Q?fFTsLo/ghhPPOG0ksiZwBWa5ZDrFOpbHRCS0vvU+NQ1x3E+SdJgkrjHznLxb?=
 =?us-ascii?Q?rpc3R9qc1jHvVWFoLn2UWCyMmZu2iVUOdoJVH82otq5JG78ncva2lbj0zmM6?=
 =?us-ascii?Q?104Kn6rY4OTmzoGebvCykPE8+HEwoHNMp4nCQ6TsQQ75jlPpbgMgp8LFYUKQ?=
 =?us-ascii?Q?yhBh+M+xeJYqu1XFVcheDO5BCxTyI3JaHmWBEAoJSvl2Jcwkq0Lq7zs7nEt3?=
 =?us-ascii?Q?Fk3oSf9KpBCsCrmowV+xhIY3XQ3PiviQQz011/5tYDVgx2sc66huGh/2L6K1?=
 =?us-ascii?Q?IkOAg2gMT/Rma7s9EGoJ0DlylDcsj6BmMiLERny9zN1hjfOxFXnI+7Aay7tA?=
 =?us-ascii?Q?fEF6rEJIjZamMe/imEZWMtHVKIRsZMWHyrDM3kfklaEtXCdW0bzX7x/djo0r?=
 =?us-ascii?Q?dvB2aMbXezfWV414+726R6iYL93/kNzeVmqWPTyv1xPfkPKBSH+p/eZfE4BN?=
 =?us-ascii?Q?gMSLpoALqCrqx5fZeRyeg7pJg874/ZDhSHwzPnFU9ykhoSph9tZzuGvtTJrv?=
 =?us-ascii?Q?PsHI+7rPwiISgScGXClWyki4gsqNOeGF2GHOrktb7UGvd18q9pgUTYE0tOBI?=
 =?us-ascii?Q?+G47ABSe9jviUvloG/doOh2pqEeBSdF51v707Uw/FAwGznbPZ0gjR73/IbS/?=
 =?us-ascii?Q?7z6Un7NTP8mf0ntMl0/53fllUOOnQSwYvYRMdSwGbqu+QFPYTC3eH0XqMd8h?=
 =?us-ascii?Q?mH48PAFAHLWjoO86VC3TGVEVlnxzHNUYaTdNe/K6ZC6Ao5IMrX6q4Xol4unD?=
 =?us-ascii?Q?rry/WZRkq/BF87vSFjXVhahBB3QW+1rM4Q9KFJ5LVTiJoI0XNopu075G7Z5K?=
 =?us-ascii?Q?3M/KxtXvxL6GlmG9JnbuMKlQCpx9TtmXgHDSqWCkxOGIeQI0qovX0rNBw1hV?=
 =?us-ascii?Q?+0Yl/Agzq3MPhBJHXu0sizT4ZdUSSkK5XIoPFflKSTHRgUalJRHAlPTniAoF?=
 =?us-ascii?Q?udRv/pNFTI++bNIGJNr0q1/QnMKulmax7gX+Fa+H49mR1OLC9VIsi6qD5pSP?=
 =?us-ascii?Q?mUfukS2XfsSSkgfrU0dkM61z17iHHJRgiw+/QebtCpuMD9jVKQ0S5GMNZxzg?=
 =?us-ascii?Q?zcem3Q4dCCh6Pj+xSLmT+GTTLjdK/3LJQpLnbp40lPXDnCBNlXxa?=
X-Exchange-RoutingPolicyChecked: Wk5kwcJ2dMl9rQgThqliJ8TooHpEszit0OTNrlwdfm1VFp4fYKa6ZotudglM38Sj2n0klMBR1WBH40dwl72voUYnA29spKrnG6mAP6JutsTw+yvrbicioXlsSG03VRcLNAPn5CN+tger2uw7iHqbpx0mrWSVcJdUFU546UWZr2gomAWlxvM7arABJihSz+cyfwJrVHsdlwq5ou1ZnXY2co+3HfbRWO/gXawOf65Cahr/v8EpX+duMoNDx06VBSoAtxejtU2eA9kgm58x1sIeRFyqMWMYRaMOmTzuPeJThWqU5Qgi5RN6pyRsmMHSziKJiWnS+6X5Cxm0mKoPSOeghg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53055f11-277e-4ae0-049b-08df020c07d5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:18:00.5664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZvqPWOoVAyu+SXQgZa7jwCP89VpvVczw6301od1FV5m7msR9xWxizLwoI6Xa/NDdUHXhjwxl36rJeHhNiQc63Bh8jFkAVF8AA6jkzb5yBuG0+BF13OOrZBspxX8h45Jt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSM1PFC0B76D9CA
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

On Mon, Aug 24, 2026 at 10:04:56PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
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
>v2: Add xe_gt_has_multi_queue() helper and other knits-Niranjana
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c | 47 ++++++++++++++++++++++++++----------
> drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++
> 2 files changed, 47 insertions(+), 13 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 8ec23862477f..4cddd69f0e99 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -20,6 +20,7 @@
> #include "regs/xe_regs.h"
> #include "xe_assert.h"
> #include "xe_bo.h"
>+#include "xe_gt.h"
> #include "xe_gt_printk.h"
> #include "xe_gt_types.h"
> #include "xe_map.h"
>@@ -257,23 +258,36 @@ static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
> 	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
> }
>
>-static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>+/**
>+ * xe_ggtt_clear() - Clear a range of GGTT page-table entries
>+ * @ggtt: the &xe_ggtt to clear
>+ * @start: start of the range (GGTT address)
>+ * @size: size of the range in bytes
>+ * @use_scratch: true fills the range with the scratch PTE (init-time clear so
>+ *		 engines walking free holes read zeros safely); false writes
>+ *		 PTE=0 so a stale HW TLB entry faults instead of silently
>+ *		 landing on scratch.
>+ */

NIT...Kernel-doc not really needed for static functions. General comment section
should be good. I prefer keeping it simple with general comment, but leaving it
as is is fine too.

In any case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

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
>@@ -459,7 +473,7 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
> 	/* Display may have allocated inside ggtt, so be careful with clearing here */
> 	mutex_lock(&ggtt->lock);
> 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
>-		xe_ggtt_clear(ggtt, ggtt->start + start, end - start);
>+		xe_ggtt_clear(ggtt, ggtt->start + start, end - start, true);
>
> 	xe_ggtt_invalidate(ggtt);
> 	mutex_unlock(&ggtt->lock);
>@@ -473,12 +487,19 @@ static void ggtt_node_fini(struct xe_ggtt_node *node)
> static void ggtt_node_remove(struct xe_ggtt_node *node)
> {
> 	struct xe_ggtt *ggtt = node->ggtt;
>-	bool bound;
>+	bool use_scratch, bound;
>+
>+	/*
>+	 * Addition of a secondary queue while a multi-queue context is live on
>+	 * HW requires proper GGTT TLB clearing, so use faulting PTEs here.
>+	 */
>+	use_scratch = !xe_gt_has_multi_queue(ggtt->tile->primary_gt);
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
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 65a4655b0994..92d934d50244 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -160,4 +160,17 @@ static inline bool xe_gt_supports_multi_queue(const struct xe_gt *gt,
> 	return gt->info.multi_queue_engine_class_mask & BIT(class);
> }
>
>+/**
>+ * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
>+ * any engine class.
>+ *
>+ * @gt: the GT object (may be NULL)
>+ *
>+ * Return: true if any engine class on @gt supports multi queue, else false
>+ */
>+static inline bool xe_gt_has_multi_queue(const struct xe_gt *gt)
>+{
>+	return gt && gt->info.multi_queue_engine_class_mask;
>+}
>+
> #endif
>-- 
>2.46.0
>
