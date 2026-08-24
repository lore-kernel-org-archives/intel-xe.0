Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3890EC5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 18:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C071E10E584;
	Mon, 24 Aug 2026 18:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvxNOCdC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B73D10E584
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 18:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787595650; x=1819131650;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=N3r3rvrWIrWw10rwUMZkURz6hE1JyhJZjJ9EehtWk0o=;
 b=IvxNOCdCehg8150jtqNPC0tz6ctd/vBPCGzPT+LQfq5J/czOxzpMpoiS
 ZnU2Yi5bEfK75hJyjZkkl/3zdNVEv1WD5dfbK252eQZs/HpwN6wZeafCK
 sBhasw1U+bVsMoZaBLx16hOWzPhD+Cb9ySh4LEmDn7I0KNAG7eQEVm9Pa
 52gUVpd8gNUFMsCL+mhdnQzkOjX3dH1pbiNbYOBCg8g2osAToEtRxgBm4
 UlAQoyPSbkH634PozVvdz3Ui86KeBwD9PLtg5SxZ1CdVDet883YPfrYkc
 MHDELYq9D9/vRyIwhBRE2wF79TqaX0byLvbbl2OuI5H9XmdCy2RLNxt0C A==;
X-CSE-ConnectionGUID: JXTuFee3TeKiDOqXsEGSVQ==
X-CSE-MsgGUID: e099oGzHRG+dVoRQYTJfnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98731539"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="98731539"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:20:50 -0700
X-CSE-ConnectionGUID: ZJlPg2C5QtujKdV8azhmMw==
X-CSE-MsgGUID: If/CurF1SByoe8Q7REsS/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; d="scan'208";a="265293766"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 11:20:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:20:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 24 Aug 2026 11:20:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 24 Aug 2026 11:20:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMET///tv+USsxUpZbnrlZJYytw4cG1W2YJtQJKld5efikkT2CqenPYeKSjGfLFhgEs2LvziWhha79wAO6Y0tMt42J+7LhqlKOZit7zgk/2uQ0mPUf1IZppBtdZUk/JBcr3dJxUp8Li6bkeymoCuU8sucCX3MIGHcb1p6jUMq6plBkLyv6IT+CjYEUlMECtMUCQMVSXYZCUVVP5rpufBxWse2h+r59bpdFWFLEPdvtfZHVy9M8LwPXqXMOB/JZEcMvms5c5DS6YGcXbVOj7RnGbXbpXxWeQ1KGYu22jSczg93EC53ZXeMSRdhARkfwa27jF4lQiInMEPB3krf4JUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAFJcBprm1ZRn5bbnVuUl7z2snjOmxHb3D3MTJDNhAw=;
 b=fwIgvKFUJ1t1YoO+KFgcwsXCinKx/wFzAE2EgGsR4HDnpDZEinGjSgrRa81LFVvtnhQYB1dpyCjbb+67nsEnoyCVSaHJ3YbnvSXZlQl9cHy4tNmu0GH8lK4FjwOjpSBJuJ6nNu14eW4wi7sLCfS0ZhbrzARNeHUtpU3bK+3OGTHadS4nSK4gzABQm5ulM9azoRllQ50qq28QhrCcnJvx8zjPNNn4PgEjBcmQTgrCVQkQw70/UXuru4PSw5yFjgxPyMYIr+rIyQ6Vm3+NHI+TcCBir5IEUAeAX6wEzZrp+O7W7Z6WihlcBQEuOfu1GAPaLxTTcBoJCWoIv3o3E5gN0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by MW5PR11MB5929.namprd11.prod.outlook.com (2603:10b6:303:194::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 18:20:45 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 18:20:45 +0000
Date: Mon, 24 Aug 2026 11:20:42 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add xe_tlb_inval_ggtt_full() GGTT
 invalidation helper
Message-ID: <aoyLeksg0_JG_r-d@nvishwa1-desk>
References: <20260824163458.3129935-1-tilak.tirumalesh.tangudu@intel.com>
 <20260824163458.3129935-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260824163458.3129935-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|MW5PR11MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 1815394f-d99d-49e7-19e9-08df020c6a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OMQ3sV2Q9H46EWQiT+0IWRMU2Og7OPVSHercKmgplRg77EJHCXDJulAUjWUPwXXLRGi48hLLiAaECu67LJ7gBL+hLB9WUm4zS+WurN/MI8kiXg3GW/OI9Mxg4tlXMiBDEsGifhKybFb+rYlGp6Ee3Zyhl3vbMgQlXdwToRnAp70mLJGT4fxQigrrKsPxHtwIqGkoNySsKq5Iu36FMGKPfFRQSt8sSeVB7/+C4rJcq7y+FBxw/CqfftpPdNDA91n2+yo2FjQSS+Qu/a35wD429k5mqFkNRG8DCG4RzDKHNXRcThFSO/qbrpzmgrgEGnWWXYzFe3MSgjj6HCw1K6NzUt0sb05mVwdekRKybD2ROoCvW66KqCqMRoJ8jQ1CPXrCKMgcewjG5QBOWhL+BX5mo15F5ntIbC83Z0yBm5LeUtnj/+vupEgazQeISesU6uIougcKm2ZH3ZA1XCfb7/lXBUb8aSl4KB8snlEwv4/+p5MDpVyeK1vDfRGZ+iSQUn2m9eGvXory8eHTIIwXxzhiav4SwSzOkRt+du1h9MbgAWCLdX7/jCfbvLdX+BaNlPeIxs/+FiHSViS9q5LUxhBB8/bndyqSVzaDYuP5w/joFx9giMBI7zn4zLAB8z3UK3fNa5DY/nclpQmrIeOTtN5H/vF/2OGqKghg/NqO6K9lYf4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ShCbqyuhbYqziCIhn4Qxi/a9c8XljsekC1KPD2fy+Zc2UFuR2DZ9RzzRzGGW?=
 =?us-ascii?Q?YZNYEaIQ3uTQOUMRhRLn6pd8VqZwRWFbpYk1q8wSnCX62lKLIipDvxcAoK4b?=
 =?us-ascii?Q?6pR7xwX7ABdaEyt3ryoea6XAhQZqDJKOyRybqTdVKgttb/Ua/FMy6SbJu2pH?=
 =?us-ascii?Q?l1n9pAximk/wvpsRIPkaWTUyVzfbuFwsgz97suO/yKWrmxp7sVTrJoBidMix?=
 =?us-ascii?Q?DgntgklBBa/eEYHJrLIyaItdiUsyy5WkZ6f/kPSpohuKFTwdgllzVSj7T8mB?=
 =?us-ascii?Q?fx0n0CIONWbyGJW/0meaYnoCLzoTCzFXsY62JC6n+JgxU/bpvv8TVEOCUYzh?=
 =?us-ascii?Q?P9X8z7PUxYiq+O3QCnAfiEV/RXjacfL9MvSXhLRwwtud/CstCwxLQgbT4WfP?=
 =?us-ascii?Q?LRU83Biw3ljTdqdiW5hat5YmlQDuquub2c/zppkrlul7zJZBrnzkefyQZjtw?=
 =?us-ascii?Q?cmLpTuJrBQKsx8STRC95BhEid5+XhAJJpjTC2RgTlMuWclkjXQaH8OkkIX5b?=
 =?us-ascii?Q?jmTZYfuDVJhJ2f8C32beNXS1h53q7DMXqlCl0/CMDQkYI02Q2GbWyHFcQGfR?=
 =?us-ascii?Q?UHylpYl77BVsRAFfD3kRQpEMOVce4znS+PAXmxgFyKK+yiwmkalifKMPa59H?=
 =?us-ascii?Q?8Amu8Qu5NtofK5hFGmT6qpLuZoc6yvATNcNT5krrSUvulbX2Pyo0heDl3qWm?=
 =?us-ascii?Q?qQZ1OO4pRXs9vJwXrsEntLOYxg20WxAc4tjRBb9S0evKio9WjDoAURpRoZLF?=
 =?us-ascii?Q?dP2neRYx/HfSEio9bNyyjXeOxq8yVgF4YcAhfjL7evVMlRUIbHNCwJmHeCAC?=
 =?us-ascii?Q?3/ypx5P7mgiTkeyYCWJXA3RhTwNvVNPKmqNoL8FCujN39yiGauL2SihmFlJy?=
 =?us-ascii?Q?Rh5XdOtB1XNYXZcfvWDZRv4zPHIruVQr/Z/ep+V+XHwSCjJUW0MP5Y4ZTORi?=
 =?us-ascii?Q?gX/X/vPYcKCNjX9zarvGsrLo6t4yAtbzZXOsY6LkMQsSfsQze6K5FNyd/uB1?=
 =?us-ascii?Q?pVd+M1L5GboextUZcNM9UC8wUWNhWpmpvR0pyKn/wXoWtC1Vam/Rg3jSR93x?=
 =?us-ascii?Q?z7Iy026tPpN0zZ3OC2ToLa+pEUXAduOxx271zR/RHxJ+ugizvwsm7ae9GE1O?=
 =?us-ascii?Q?xWYoTVmkqu/pK2yLgC7SDkzKaTCvI5uNpSeAXnITxXTAcNmL9osq3PgWSfNM?=
 =?us-ascii?Q?S0FySMJMfrfYa2ZTlG7H6wZZS8Cv35KR8jSMrPT7BeaqsvyYfdCmhVOf9C3/?=
 =?us-ascii?Q?S7M5egAze4W7H3l8kHMolHGrheJjIIZ5H3/EDVPQzkiXL3wiEgyYpe3wvNPz?=
 =?us-ascii?Q?7RVYb8LyJQaJ+8S8C3YSNXSEydZzOPjNoAOfdOcwhCPFb6Sh18WwhNy0ZqL9?=
 =?us-ascii?Q?xqAbjqJNrZCHthv44Pk4fRV3TZb3vPqGxx90y3bpT4OwolBMecQ29L9/Gx6U?=
 =?us-ascii?Q?+TRDTdslTuTkPzWGkjMnyJ+mTm+MMAl3S85Slx0RMGyAajgm75u2w0Mc21Ph?=
 =?us-ascii?Q?OgpDiATccraIl5TcwAuWXUc4Eh3KJU2vgwKPnI9MO1ooWVeWKxBGtTGFGUSs?=
 =?us-ascii?Q?X2udgxs5WqTeLGMlP4WVrzywsgRVJVZ3r0GSpr94s7MKDF6vBjgCeI2Bb5Id?=
 =?us-ascii?Q?iICr1v1vmbkoLp8IbgsftGEV7NeQKmiULG71tBx0SN4GMdI9NmUYnYZHV3HH?=
 =?us-ascii?Q?QQmoGMhdB26MX2OzDlOuxJ8esZC3r4uiXPpyJWix+tiX1DV9XEIj4hvjDDen?=
 =?us-ascii?Q?L5cg4u0p8XUqcikpFQ1UaE5WvSuJCyhY6IWIecM1bKCSN882PRf8?=
X-Exchange-RoutingPolicyChecked: pKdQUQK+4QrqisBRWaD8N6eIuzfwP2F9fiZpywoIr0RjpJdZROqb7WkhfpQUX3paHkVZCgMBR4R2V175XLjX0Y7pnmJ79SoPHXyVOSZZplxjbrnerIe0Cq8zGADYn8SxOR5149EiJ3Y77egV2BjDyFjZHq7H/TYQN37tUgM/d9YK35NWpP4XTQPTV22/bgqvJ9L/EaulWSPba0c4e+VsRDbuV1f6/TyXTCWP9MF90x8tY9ZYsCJdZv33/KTv8GyaZgoJuVpWbfV8q845TKi4c6PA0RCg6QcFKl6ZQwwwxDyPYtEQVYheg/EoZyCUxoqh2bksqcAUmTTeTyGeodTKJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1815394f-d99d-49e7-19e9-08df020c6a16
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 18:20:45.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vePsIzJUX//HGYZurBRbAHsZAyG/lC/jguJXNeft/QLU2/JOAG1iCA2BrlBQ+qbGiFhuuhf2JaizMMxX2uNuqH5MpvIFWAN/9+V8wANrUsceFnKapgyrGj/YDxm6+idr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5929
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

On Mon, Aug 24, 2026 at 10:04:57PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation
>within the requesting VF across all engines.
>
>v2: Refactor with new helper xe_tlb_inval_issue_op_wait()
>    and other knits. -Niranjana
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 42 +++++++++++++++++++++----
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++
> 4 files changed, 68 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..08dc2ee4cbff 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
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
>+
>+	if (!xe_guc_ct_enabled(&guc->ct) || !guc->submission_state.enabled)
>+		return -ECANCELED;
>+
>+	return send_tlb_inval(guc, action, ARRAY_SIZE(action));
>+}
>+
> static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> 			     u64 gpu_addr)
> {
>@@ -346,6 +365,7 @@ static long tlb_inval_timeout_delay(struct xe_tlb_inval *tlb_inval)
> static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
> 	.all = send_tlb_inval_all,
> 	.ggtt = send_tlb_inval_ggtt,
>+	.ggtt_full = send_tlb_inval_ggtt_full,
> 	.ppgtt = send_tlb_inval_asid_ppgtt,
> 	.initialized = tlb_inval_initialized,
> 	.flush = tlb_inval_flush,
>@@ -354,6 +374,7 @@ static const struct xe_tlb_inval_ops guc_tlb_inval_asid_ops = {
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

Kernel-doc not really required for static functions, general comment (or no comment)
would do.

Anycase, LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

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
