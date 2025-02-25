Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86A4C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 15:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73EA510E144;
	Tue, 25 Feb 2025 15:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir0UZ7rv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 799E810E144
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740498129; x=1772034129;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ek/I4WKBUhEdU1EO8MIc4wM2Kqz14rO6wG4OE72oilY=;
 b=Ir0UZ7rvlJHiwOHulNP8sfiYXS6w88mVs2Ecm43B3+XW1DyPoL9j3xSO
 GIrLBZKG7ajzcPox+6ZZ+f2KQ3zgqjf8gK1bPizYoRPBP+CflOLfjQp8F
 LtAK659bYoTKRnuwhIyWrPXsCYsa5S6RzhGcLJmuZ/6r/8wigV0QuI4OQ
 dQajEabfolhieulTSgOOjCxfnBETkUA/iL+x0qg4GKa60fwJWubUfTdVn
 CFxYSc6Y4HHkcQ2gtaZzevhg9B1m+7tKoQubt64XfejSwgnmg1hpLKdsh
 X0o01sAQk6hPzJqgNgZM2pQqhwe8wu2N7MnlJxTXJWigmjAZJEYGLJjbC Q==;
X-CSE-ConnectionGUID: 5AvF9NkkTL2Nmlaw0iouhA==
X-CSE-MsgGUID: ETaHD0m/SXCddZxKmzCecQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45094325"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="45094325"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:42:09 -0800
X-CSE-ConnectionGUID: LLlEM4nRSJid7x7U9yy8sg==
X-CSE-MsgGUID: o/VA/+o0QJiRcDLMaMq4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="153606463"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 07:42:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Feb 2025 07:42:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Feb 2025 07:42:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 07:42:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCYt6ojX6qkadrnekp4Za9fYo2A0SaopAHv2JDdFQDal1N9QWYwznlFoay42CkKBEyQWVf7+FbaUVOfVFSaUh4cJz3p+fuCRZu+a4vH0foE62PD4YhS8GoAvEp4xqrsxlkF3bGpUrrg2BzvcTZB0UA5DvUBfTZkd5YtvmpevRd5ysAl0qU7O7vVRsZOSTe0Vod0a1Gj3VpxD1O71emQwmLoXpbxqUYURZQtJ6V3/h50OQ2bgJJoZUCJI3wEPt0akkTpSr2EZvJ0kanWkGYuzF4BG2wduClyHHP+tB990SYmLcdNoqmrGzHTqlLxcaZPSx6BG5kokm+vWpwAK5qd/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XkxTAoZUAe4gHC9fudLU7q0wz6mXwjuGtL+NrSMk/U=;
 b=sudVU+x7svwadvJgrbPLf515bbqltjocauoblZwZRdwloHS8HPZG9rWH3wepW5pSxaWvV8ciWpR2OOUl5/yAopIy7d9MhqxD5LDUirLW1BVfAsaZMjKahlQfBwuGLPv8XeFTlWmwCzxz6cZAPqtZcPEfi1uELShzWC3TVPV51v7mb0Pq+F5PxRPlVnZuT4xdoUhzm3ZxaXFnTBB3xaB7inaxbwII29OfbaVAOHHuVXAjWRjWkKerep/kEIyBTVm+7ilNuN05s1qe1T2IOhaUHjCpHIIKEMHwNKnF4ZObtNLLCNBqysdDg7c91wKdh5+EHQCjjvEnt282uRzlK4M5JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8157.namprd11.prod.outlook.com (2603:10b6:8:187::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 15:41:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 15:41:18 +0000
Date: Tue, 25 Feb 2025 09:41:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/gt_stats: Detect and log overflow
Message-ID: <u2rjimcjpdknreojf22kyb3s6j4b7h6ki2zr6455nxgqxj4xzn@jpb6jxsp3chy>
References: <20250225131753.1170520-1-francois.dugast@intel.com>
 <20250225131753.1170520-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250225131753.1170520-2-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8157:EE_
X-MS-Office365-Filtering-Correlation-Id: 95fc3a1c-1b91-4fa6-8212-08dd55b2d87b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?abV40OyHwI/d/5AE66+92RD2+cgtZvnWb78v/naK+OPGk3Zlq1acv2uc3CZB?=
 =?us-ascii?Q?qZK8UIudZ0dVJ9jwa0XjsssdeSIWNlV7dBYGcsmDON+A8RWwNXapOfr4STbA?=
 =?us-ascii?Q?iu/rOhGndvIm3MhFu2nQ3h0e+5q5vtR6IoDm/VSSFmA5Gu7UWgVvRqMzKASR?=
 =?us-ascii?Q?3f89BqXHRmToGhbqhZeiOyJ5mQVnAYCetFqp1YLBuovJ/4w4Fcn+lvvqKh2C?=
 =?us-ascii?Q?Mx2c6zVKgkmqdCQVHwIKQUU3GKGI38cTZ8wq9jgA/Hjm//qgr303/Cqwsgmc?=
 =?us-ascii?Q?fmtFf7iqi7IHOKO73JA+OPlEO97mFvlez46EsirKcV4S39WWSkorf7jiOTyF?=
 =?us-ascii?Q?Kh+yObwkTxPsOd/OXlPdE43qQblSv0O+/8xWYev44IADxvddpIC8oLDGc9Cf?=
 =?us-ascii?Q?mzlodxSqOpHK/mUT5JprsbnHDnX65vTTTwAjy3CdiGB7c37Safgw0wLT+fWZ?=
 =?us-ascii?Q?MKkOEcG8k9vRcQYu4nUC2x+dG8CGx6RyJcVLZgwvYpTpqkjW1N4Clz9+Lmqa?=
 =?us-ascii?Q?no0Tp+/oIeiMmjEBHVp5gwtEn59JQxnSZUCnxBOYrKsWVANfaqL/tuPp60Ls?=
 =?us-ascii?Q?YvcL99D64kWymr2dkHTeQffX79jJV7lSkaTt9mNP1+5HpvFNgGKt4M0+cmfp?=
 =?us-ascii?Q?IKQOEWo7aKGBuXhGd8GWmMa811UoQ4t6gBpgBkAnQGZ8hfOMzFixmcu9u9ch?=
 =?us-ascii?Q?IzzHD3+dhYsrTykNUwkZBCF99X0Hu9yeJ40TiuDhEtAk9YolNEps9F9FyF0i?=
 =?us-ascii?Q?QhVZEmM/MsoxqpLKPDpyFLgeebTtulJD6HDh52yfK+NhbGEz1c5dE586gInd?=
 =?us-ascii?Q?L43oZoffZjkj83VWsFKxv4L1oZPNfrkPtZQZiXG1nL58G2x77UNYG5fhGwOd?=
 =?us-ascii?Q?OutC/i9pd8LZDXHFTndXjFcMligAxamrg5wXSaR07bYABzjtKbNHzm1BoAet?=
 =?us-ascii?Q?Jn5G/V3twQSuOyMUv0lkohWNev8oDWh+rcmz8mPBtYn2cmJcUPBxXjDuViif?=
 =?us-ascii?Q?TXigbD0Bph9QdLC1Pvlk0yww2ObwpubdL4Fehuo5j6avtk4huALw//5IjIX/?=
 =?us-ascii?Q?0IpJTfeLG89TEXnrXH6ANvwKs2gcOFMq0NqodGW0hoP8hmyThJVQil/uTL13?=
 =?us-ascii?Q?m0jcmWDRE1AeRLpz8EGrQIqcqUHG3WWHbi1eTjclTNZNzvs241rZmV2zneMw?=
 =?us-ascii?Q?qip0g08plWMXg8ceffbWhwxWsfJtJLHebjxNHho9eALgAP2oyVtCYF9ART4/?=
 =?us-ascii?Q?7sbu0gKKt020YmhjCzen36k4CG9O7hOMoDFCXYLo3pgSSTKnGtqJdoYGTdh9?=
 =?us-ascii?Q?WQDTgoLVmVtUG91uTXMlXuusVNgXBifIUMjaVfDn6/XcYaF7CawQY9uCR3Ea?=
 =?us-ascii?Q?5c+jUBbYTC+GBvxR42Mrq2kFZbBc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4JgJVxPwdKM4nOYEfzwV0gmh2LhSPmWw9i8QL00GdNu3L40k65of7p2nqA6k?=
 =?us-ascii?Q?3sip74y+dVEwD5MbffKldpANB8J0wfuQnaPUow5+h5bCuMJ/kG7Nj8QYOS2c?=
 =?us-ascii?Q?XmlOeY47iENlDtnGdc+N+6XBvU9Kwff4fu/yvmP7ltNJqjyQgwOufV7EzddU?=
 =?us-ascii?Q?cDMeh+5V+EzlJBrsn4oK6IZs/fUDja4PmHJe94t2vUyJZeF8hLtP0N5lYdCA?=
 =?us-ascii?Q?en9A23s8nvwvDEXPNZrBgpI3srj/x5R+LG5FYsFjZoi11oLTZNxE3A7joNnC?=
 =?us-ascii?Q?kRwUCfk+2BXKrdRrqgzXs96Kkggrkp/IJOsI+wP+RbC0xXnyElgNVR1fgDoQ?=
 =?us-ascii?Q?Z5VpeT+HNxLviTjun+Bk2SEf4zVPgkhx1m/PbD/ixG3ghE13QIFR16q55lMx?=
 =?us-ascii?Q?oXfdamfEJDfzy5pBqCGb2hvDvaNr6aGti2Z1LZRz88/dLGx+oRBap7/IARSm?=
 =?us-ascii?Q?vHc6hiHa5TAdafoLtw8hF2ntNs+lww1KtUkptvYFabZG2WBe10I/yFugAYJD?=
 =?us-ascii?Q?5xdRPdNQaAdiH4ozox0lJO1E3C7mG915ky/LyqRTiR5W+MsDXX3JG34RCfku?=
 =?us-ascii?Q?4nKGbGfPsw6Hb7zf/0dRFAIOLCkl3IT8aXPZ9cNLZkqtdhF21EWbtD4wj9pS?=
 =?us-ascii?Q?sbF1Ngo7OLLc7gC9OUFlEYGr1j7biVCwhYnkmvQ3BqmpkGIDxRjs0rHWOTtA?=
 =?us-ascii?Q?DzizebXhEqlqQv4OP5WTcP/MwtD4puBsf3JglePUNiqewYKkyHE1X0QM2879?=
 =?us-ascii?Q?1aIFKsCM6crRR9okoFVwr1flg0lftwtkof8uvt8rzB2bOKFIDLmWXlMJQY1+?=
 =?us-ascii?Q?W3P8CkLViarN4dE6Fhps+7+7UEj288Gp7ga8SCiU8gyWKDqJ05O10rqhqqGX?=
 =?us-ascii?Q?oTy5Bau84obwaOMfrPdLpf74zL+b4YrRT6mIpBRle2uR8jML17vV+7R5Ekqe?=
 =?us-ascii?Q?B7ZUzj+WysUfKZyhG/H246KNuORhInSY1N/8hZclT/xJLkkoMc81Vcbca4Wx?=
 =?us-ascii?Q?3pLpu538/ZGFzb3ktY8/iYJrkDU158Akj3XUPGt7Cb/F1JSyW7IRzy6lGy/q?=
 =?us-ascii?Q?Of7qUqGvcWI+tt6o1uKsYtcE7Grkh7kR8ds1o6gE/LZFrCgGcRJIildEO7YN?=
 =?us-ascii?Q?tOq1UtbIFZ6KQ4sn8f2yl21rx0KcnbiYemGkITHyBU8Uyh4hZReuzC5ecbs4?=
 =?us-ascii?Q?BWgRWlQHlrfGcdcpJutJZWyAJqOmfYc4c4MtwaSmSOaQAQehkl9XBiz5lGcv?=
 =?us-ascii?Q?dyK4R08IRkm6UM0Z3L5kNIlUP5H47geeirPM7DWtVMlN2Jj4l3hLwRtX6eZO?=
 =?us-ascii?Q?qyhAm2l5blpeyVdyfiBe68j407wkcZyJeORGw5+TlNL/XmlBJB3z+4gOl9wv?=
 =?us-ascii?Q?nnatRCCgv6vAFeYwLQsv7LdaQig+0HG80E4IzPyQufj33Ole+Kj+uvg0FNl2?=
 =?us-ascii?Q?FOM2g55Y5hL6TcWshxEhm7ySrIgr21uBbn6oB+IuRK+xsQ762vSx7Q4uA3Ql?=
 =?us-ascii?Q?cM3Hz6nXsfw75oOT/oHy627cptMhjNjL2xzSqfxv3K846VorZMKnML4d/FSp?=
 =?us-ascii?Q?eCrWlV0l+kP8fItDEDwKRPQWx4WMY69mcmG4Ck5cLkS9qNmHhXXOXwUJ+p1s?=
 =?us-ascii?Q?3A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 95fc3a1c-1b91-4fa6-8212-08dd55b2d87b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:41:18.2896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzuUc/R0p3b1ASGiJFWyT3QV4cjy+X3aJKYjH8Z/UZvDcpPTPLNgTwLs5wHwD7CplLCqlsmVcWzvSKvFMVunWJPI5t19aB0+CmUJNcgA+Ts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8157
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

On Tue, Feb 25, 2025 at 02:17:04PM +0100, Francois Dugast wrote:
>Check if the atomic counter limit has been reached and if that is the
>case, set the counter value to the new increment to prevent keeping
>a garbage value, and notify it in the kernel log as below:
>
>    [drm:xe_gt_stats_incr [xe]] GT0: stats vma_pagefault_bytes overflow, resetting
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_stats.c | 18 ++++++++++++------
> 1 file changed, 12 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c b/drivers/gpu/drm/xe/xe_gt_stats.c
>index 2e9879ea4674..753c081b68a6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_stats.c
>+++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>@@ -8,8 +8,15 @@
> #include <drm/drm_print.h>
>
> #include "xe_gt.h"
>+#include "xe_gt_printk.h"
> #include "xe_gt_stats.h"
>
>+static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>+	"tlb_inval_count",
>+	"vma_pagefault_count",
>+	"vma_pagefault_bytes",
>+};
>+
> /**
>  * xe_gt_stats_incr - Increments the specified stats counter
>  * @gt: GT structure
>@@ -24,13 +31,12 @@ void xe_gt_stats_incr(struct xe_gt *gt, const enum xe_gt_stats_id id, int incr)
> 		return;
>
> 	atomic_add(incr, &gt->stats.counters[id]);
>-}
>
>-static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>-	"tlb_inval_count",
>-	"vma_pagefault_count",
>-	"vma_pagefault_bytes",
>-};
>+	if (atomic_read(&gt->stats.counters[id]) < 0) {

why are we not using unsigned logic? it stops being atomic when you
update/read/set.

Lucas De Marchi

>+		xe_gt_dbg(gt, "stats %s overflow, resetting\n", stat_description[id]);
>+		atomic_set(&gt->stats.counters[id], incr);
>+	}
>+}
>
> /**
>  * xe_gt_stats_print_info - Print the GT stats
>-- 
>2.43.0
>
