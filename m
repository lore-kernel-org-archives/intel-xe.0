Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C750C5DF97
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:31:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC40710EDB9;
	Wed, 26 Aug 2026 19:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SviLhsov";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6D10E335
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787772663; x=1819308663;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5T57Qewf+cvZI5nq8H7c+gPSRFndhM3ko3lBygh1Jj8=;
 b=SviLhsov0h8vcFv0P69Cyx3uwekrfo1rpwaSQwb08u5mMbNjzUPiIyaR
 1jDK1Y18dbz0E40XobNy1MFLIm2I+1EX/szx/vbtlkjjuYKEDpGnmUeSY
 wygghkKPz82UATWD+su0394+Utf/uDj83jHtYQ8SBHx48+It7gjvTbo88
 Hz6VfDIPnoN8JJkJ81uNiDe6H4DNCI9FyVTU1XCO+8e5Y4z/nUc0+5ZTC
 mIOHkYbjhy6ri/SGjy/2wGVKQasFeL1lWWpwSFStEmrH4326z7sRKu/L+
 zHPh6d/8Xg/fn8coklvR5DaSyYWDBsM87bzhvkWw/1466l9b1bUbsccpG A==;
X-CSE-ConnectionGUID: f2UR2jGJQKartyimKntIHg==
X-CSE-MsgGUID: AbFYCnCeTEGHEN1b8P+UqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105640716"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="105640716"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:31:03 -0700
X-CSE-ConnectionGUID: XnEsUxZiQOqEsob08ef5+w==
X-CSE-MsgGUID: ViktkhMxTPKYNHxFmDOChA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="297553302"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:31:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:31:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:31:02 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shuBjKaHOPfgSMmTGICQqybpURkMqPyEvGcfprCR8Y2R1XCRtyogaf5pj9Z9bWIrKp3qi0lI05D4E9Q6lqg1JDO54HXQijMapIsLt3wLn8cwaHTetkAT+OCEoVNXqauDCXczFASlOpO1TqPHjkZtvd7ToiCpZf4xJ6GV+BLMUWX2Drr5jFPEbAEnASge52JPQGoXk8b47mfjtLnQbyliB2JrXfR7thA2mNsMzD3lLF2sj+c24TVYM6wt2wxH5q5Lg2+szklPs0uBvpqRWTpfMBFA4uzi/KmR+yUFUYfp+Tr+Lb11idEkrs34lFGIAfVkDKd1LqPf+2/THRV8GD+RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbKu//aFCHmWodU4ruo3xNQe0U+ljIkxO7YhlDDP8pk=;
 b=EaOaWuJjH9PPaJ/bUF+lvqJDTGLsXLhbgZ0x7SChuEc97o71FqZH2EnRRvV+QZba/rcveNN2+oaS/rczQDPCLe973BIJ9rRHvhpGK5kh1XR//yWQxVDa2Wl8WBRyqxhB8nVmvzYYeurGWNcrNafB94/e5A4fxiy1UW4/1XdU7EEjPsnXadRvhOqHK2P4sYuM6L3PxbT97JUYn7Pqz0ZlxsnupqlCBdIjPkOmQL2uYXUhMP+N2FSKmTd3UHGdti7nNM8b6LXRSaIB5UvTwzF4kRle726njx1RRf5s1qpU6Ks3+IcFb7okWZjUwPt44XYJ/Pid/9PC2LpzDaSZ9rd6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by IA3PR11MB824491.namprd11.prod.outlook.com (2603:10b6:208:626::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 19:31:00 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%2]) with mapi id 15.21.0360.005; Wed, 26 Aug 2026
 19:30:59 +0000
Date: Wed, 26 Aug 2026 12:30:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <ao8-8NPZpFCiBSQB@nvishwa1-desk>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260826112533.3289978-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0359.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::34) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|IA3PR11MB824491:EE_
X-MS-Office365-Filtering-Correlation-Id: 11ffe502-d17a-4c78-804f-08df03a88e89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Rc2aPBeqfXeRUe4A6BIw2OPvCANuzBq2sZ47V24GM9OCbH84ZRBRJs82La2WjSQBIO4HX9CA9iWcYTvv/EYeeZS8LdgkmonyMYbxeoPJzmmYxUjEkI2Wq9sidU+cBmuCbh91/w6UOSz6Vu+P0fSeij+b8YIfKpThjv0xg4JKoQbM6ooVxEd5KCOx8nnFxPSv+vr1dUpB6LH5LJ4xpG6yMq6MKDIcTjEFLKjGqsVg0cGiMK1F5TlinWE8AhyJG2FuyIF6JRcmMeQhb+ppQ8OEgwLPJe2o2se/cI8mLFmPBiP2aZc2so8mZAQSKhu8FE3mXL3icbbQdKhPN6ZBsdkBDMelqRubzRpGf0iJNpH54UgvCEmxDOIGfN/uLDtphZY3Uq/4Hckfa/OKodRrgkq+RcvtoSSWMYqc49X77E5oW3YuAMYmL48y4jLjpynucAn2tOi4vkiO9/ee8uQvMLo+CqhoF+wJ/aHr43E7FD5Phcuvchorq//56Ah8lS45m//CoHFpVQkqbRK5pHCze4lorIoMBIFk5qCPqlEA11gGdXD342Wso3oQjHlcUebFZU/Bdj8+WMcmQxdfY5TKYqsC8NDyHbnKqeJvH41PimKZlAzU+yY4sTC4Tnt4dwLrHYjtClqQens7pMwPYZVGE+0cRQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a88B3QQLqvVonkt9GuzR/aBedeokjpwnThbwCt70imJtZ7F3YU72s9YoT1PB?=
 =?us-ascii?Q?6jpzexBfO8dMDW1f7DXFjLQggGIneARUUT6IRQo4kg5x+X64ByAuwmiR3nCM?=
 =?us-ascii?Q?bQkZ8yYwIx0Rku0bpb5cRCuggosjU4YXPljw6Ylp2FqTAUnl2N58VCw6kR6B?=
 =?us-ascii?Q?VkrTL/HRPjVtF3yIOQHUMmYCHOryGpk7SPYhu4Tut3Rce5OT5fSSSgDRCFi9?=
 =?us-ascii?Q?UcfKDTO9M6KGKSFSkTJsSSa6UkbQEKzV+J1BjPQplkuH+2m18uA+BsmbA0Mg?=
 =?us-ascii?Q?HjeZLDGnDdwxvAuMx9bFourK5Vccp/gRBTRu+HD/3dtlHTZi1R1zjxVLHtSW?=
 =?us-ascii?Q?XcHop6AWwsD2ssvw0QaC0yTQc3HdQOgrQIQSZazCHhyL7O2CjuJcyhK6N92d?=
 =?us-ascii?Q?9EhvI4MAW02rGbat9uYeDLIy5PnK73K+nkjxqbNBcfC+7z2Hd33yKXaFSDJk?=
 =?us-ascii?Q?LmGomDGrMxYQK1cULS4mejqElfX7Vr6O+4LJkqdXoBJiB/aEGJCxXi18w2jm?=
 =?us-ascii?Q?pdUM+b270R71oChYSvAcVvIOZZU1FWVOvkUBEFvJsWgEVcFdQ9WP5CWDTvSv?=
 =?us-ascii?Q?Ek1ISKF+BJKtJB6jjQ0Pv7BYT4SSXzWnPWTZuIXeC6TzjorJ55PbJ386kI5R?=
 =?us-ascii?Q?upZVKRWe4kOoobQhW+XF25V6RLePiAYgRNWK23HEkKOexrkofAOIji5lE/P/?=
 =?us-ascii?Q?dM+Iuh61cxfMROV3MBdeT4dKv/ZsThsiu8edId55nQ51I9tBIpJffWtpJ+1M?=
 =?us-ascii?Q?i7AO3HOF105ha4mrMJwS4EbP/rNQWXWHVeGcNhvQKZwmPwFFJJ6zYvMzVEIE?=
 =?us-ascii?Q?WYU7nvNhH+oBk2DGmJCl/ARL8IClPA98F1AryfTrNN6rdZIQuVK6fN2Cme+T?=
 =?us-ascii?Q?xaT7+htA/h2+OB9VnGp1UeVrmq4SSKZuqWs/OYAw2olF1UZPg0DZ31aCnTe0?=
 =?us-ascii?Q?DWcX98fxMcQnGQkWIE5NMRPsMY0c6+AbgpwuI5C2goHsnEV1qF72N7PnmWMv?=
 =?us-ascii?Q?sbSOE5zuQ1FLO9F51AdjYjWY18rFixqb6gk3gknrUdDNkj2YJd34y8qiMKFl?=
 =?us-ascii?Q?kiNN6JUIF7sujBkDqn6pfUqnYCDnUk8VlfQPVdMgckm+Ci0IUT12PthP4sJY?=
 =?us-ascii?Q?kE+ivghuv2E+ZpanFEiggkD8XYx293407BztfkT1q5iMKjf0fE4q8U15tRxu?=
 =?us-ascii?Q?W+NrnatSPSwCXnuBNguJDKedxDOicNQcXa8+v4cHoCOtl/ryVhfT+YNACaw/?=
 =?us-ascii?Q?sOqfladXBcUYaOHLelb8cxS16S/k8TigrXjRVkFZ6qT4XYRIJ6wnByMOn02e?=
 =?us-ascii?Q?nFMe20H/2TY53WIH9kO3xUNRmPAj186dNemxbfxLs7hqwzsuFA3Mie8v9H1z?=
 =?us-ascii?Q?0ibxA+pxhKU/Ja1ptX8Cl6dSqmMI5kg3HJqtEKB3b+mTjzzfZI/wY7O9S8BD?=
 =?us-ascii?Q?ooltowukZ+nsczeoEdhn6fBycrNJTDw7wUrwWfIb/1YeoSmr9XVNoYaxFJVB?=
 =?us-ascii?Q?zTqByRv/gbKd5/RwV2mKVS+jqNa40sW9EtqyIT8bKoz29tZMDJh1izq7qVhX?=
 =?us-ascii?Q?tHj0ya5i4CbPpC/ZazIi4M95HRvy1CtwLkaCj8O2U1SlKJIBXo6VVVDQoYpD?=
 =?us-ascii?Q?HeE79WE4aL/cHDP00PpAkGuyDxvpE+j69+DSAQkmtNW1CuFbJ4SV0REoJuaA?=
 =?us-ascii?Q?CXbHntdgvFq+yDt10n838tlVbV7wAVin0J3RnfyISS2aMwbO0pXURM3QI3uf?=
 =?us-ascii?Q?9Oo4IoZQZhB/tld9MdtVShFo9A1jtpEPWoIbD0W6FOR6ujgXotb4?=
X-Exchange-RoutingPolicyChecked: rVT79mh9ctmCHX7e84DouMh2xNx8tgkysrkhdNfELrDWz0rtPF3lSASWFnUSvqB2CPq0iIGXUyjmghtvszcReA6tTqEHEmiKRAEHkAio+Ghj86/7txQlZ2OfaQw2xEWID7bTgQRlHxiQPpljkltyZf/v2YfxR8DI+yyWbcwW51Qr2SszlsYyJiLh1zkoIrumyYMjgeO5WbuKGGvru1ZY5Ur4ZUn1Q0/Ix/gNe1LWSNmf2/xec6pF2EseFZNIxaMAiMygd9tfN1yBLpCBoFkZMhD+V7Z2G2ifSHt76JN7savZroUTeDIC8491bO2FU+bqmmi+efFjfCc0Av2hCEIrgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 11ffe502-d17a-4c78-804f-08df03a88e89
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:30:59.2318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjYk489wrsU+sFUoZzhV39qLkvzkYdWy6oqYOymZXKoDu8O5Ehj9vULDOzdG5MFpF+o57h+9rMAc3gQCMHEoZP+VSJejHcnWFN9izRhTcgcFBqBKdTUXxjvMVP5+WL0j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB824491
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

On Wed, Aug 26, 2026 at 04:55:32PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation
>within the requesting VF across all engines.
>
>v2:
>- Refactor with new helper xe_tlb_inval_issue_op_wait() and address
>  nits (Niranjana)
>v3:
>- Avoid TOCTOU issue around CT state (Matt Brost)
>v4:
>- Propagate real send errors instead of masking as -ECANCELED (Sashiko)
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 25 +++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> 4 files changed, 72 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..665483bf2e67 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,29 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+/*
>+ * Emit INVAL_FULL (intra vf) to invalidate engine TLBs across all engines
>+ * within the VF.
>+ */
>+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
>+{
>+	struct xe_guc *guc = tlb_inval->private;
>+	u32 action[] = {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
>+	};
>+	int ret;
>+
>+	ret = send_tlb_inval(guc, action, ARRAY_SIZE(action));
>+
>+	/* CT unavailable means nothing runs on the engines; treat as cancelled. */
>+	if (ret == -ENODEV || ret == -ECANCELED)
>+		return -ECANCELED;

Looks like we don't need the check 'ret == -ECANCELED' here (redundent).
Basically, we only need,
if (ret == -ENODEV)
      ret = -ECANCELED;

Also, It seems bit odd that other functions like send_tlb_inval_all(),
send_tlb_inval_lmmtt() etc, has similar structure and similar documentation in
xe_tlb_inval_types.h (regarding -ECANCELED), but doesn't do this conversion.
So, they are not treating XE_GUC_CT_STATE_DISABLED (where guc_ct_send returns
ENODEV) as a 'cancelled' state. May be here also we should do that for now,
if we need fix, then it will be a fix for all of these callback functions later.

Niranjana

>+
>+	return ret;
>+}
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -346,6 +369,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> 	.all = send_tlb_inval_all,
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.ppgtt = send_tlb_inval_asid_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>@@ -354,6 +378,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
>
> static const struct xe_tlb_inval_ops guc_tlb_inval_ctx_ops = {
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.all = send_tlb_inval_all,
> 	.ppgtt = send_tlb_inval_ctx_ppgtt,
> 	.initialized = tlb_inval_initialized,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c b/drivers/gpu/drm/xe/xe_tlb_inval.c
>index bbd21d393062..7c3bf32d9258 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -301,26 +301,56 @@ int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> }
>
> /**
>- * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
>+ * xe_tlb_inval_issue_op_wait() - Issue a TLB invalidation and wait
>  * @tlb_inval: TLB invalidation client
>- *
>- * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
>- * caller can use the invalidation fence to wait for completion.
>+ * @op: backend invalidation hook to issue
>  *
>  * Return: 0 on success, negative error code on error
>  */
>-int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>+static int xe_tlb_inval_issue_op_wait(struct xe_tlb_inval *tlb_inval,
>+				      int (*op)(struct xe_tlb_inval *tlb_inval, u32 seqno))
> {
> 	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> 	int ret;
>
> 	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
>-	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval->ops->ggtt);
>+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, op);
> 	xe_tlb_inval_fence_wait(fence_ptr);
>
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue a TLB invalidation for the GGTT. Completion of TLB is asynchronous and
>+ * caller can use the invalidation fence to wait for completion.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
>+{
>+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt);
>+}
>+
>+/**
>+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within a VF
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue INVAL_FULL (intra vf) to flush engine TLBs across all engines
>+ * within the requesting VF.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
>+{
>+	if (!tlb_inval->ops->ggtt_full)
>+		return -EOPNOTSUPP;
>+
>+	return xe_tlb_inval_issue_op_wait(tlb_inval, tlb_inval->ops->ggtt_full);
>+}
>+
> /**
>  * xe_tlb_inval_range() - Issue a TLB invalidation for an address range
>  * @tlb_inval: TLB invalidation client
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h b/drivers/gpu/drm/xe/xe_tlb_inval.h
>index a76b7823a5f2..665072b4b81d 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
>@@ -20,6 +20,7 @@ void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> 		     struct xe_tlb_inval_fence *fence);
> int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval);
> void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct xe_vm *vm);
> int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> 		       struct xe_tlb_inval_fence *fence,
>diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>index 3d1797d186fd..d77be1aedc91 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @ggtt_full: Full engine TLB invalidation within a VF
>+	 * @tlb_inval: TLB invalidation client
>+	 * @seqno: Seqno of TLB invalidation
>+	 *
>+	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
>+	 * failure
>+	 */
>+	int (*ggtt_full)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>+
> 	/**
> 	 * @ppgtt: Invalidate per-process translation TLBs
> 	 * @tlb_inval: TLB invalidation client
>-- 
>2.46.0
>
