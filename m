Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA339F531CE
	for <intel-xe@archiver.kernel.org>; Mon, 13 Apr 2026 21:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F24910E0B1;
	Mon, 13 Apr 2026 21:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d9d3WKLG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D8610E0B1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Apr 2026 21:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776116020; x=1807652020;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aAz2Ttbx4A8gOdgbkY9R+oUJas5twVo2wRAi9niRpQo=;
 b=d9d3WKLGBuwp2TO8vr0ntPCpHLjWJWOs1pII4KoAHeSE0zYn53iBhh+X
 CmYUUyx1j+x5//c8uc6+nvXb1SR01/patBlotTSAMbWUkD5K8S6Ud5uP9
 9XJit/hF2R2HjVsr2Bh8+8zwVXLuT7EmRTx4BmV1rRs0S2X6kNtzjLAwd
 dfRoTKotjARrLVI73GTiovJvAhULOHMRLoOFDqc4oRT/VYEALXhBV/sWp
 kFwk5IUTNZp+u1v7T5yGrdDPso4nL8cCHErB39oHVucz/tCoJFoIInG8I
 6tsX+X5pDgeC3hAoRl7ittzGPWHPqnhjJkB3XE20IDAgapAqq0NjhNN4O w==;
X-CSE-ConnectionGUID: DitRZYyGSvWPzrd8X6mcsw==
X-CSE-MsgGUID: dzCegGfvSIaB+FhEzufkaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88138339"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="88138339"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:33:40 -0700
X-CSE-ConnectionGUID: kd1wIqTMSRmARRwJaFXNtQ==
X-CSE-MsgGUID: +XZZohMASUa7POfrj/QohA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; d="scan'208";a="234300235"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 14:33:39 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 14:33:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 13 Apr 2026 14:33:37 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 13 Apr 2026 14:33:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dl0fFdDjnG8fyR8R7frqZ3kKfdYXjmb+QG/601GhLBx5wuBVo9nYAvzjn6eOpinFkEYJ00E3Y+xwxo9ABp6VqCihmtUot5cWBBk8AjyR6BTNjOo7R/eHO7hnZ2uFzhz4J8LuVjCg6THvAx3OU154brM4XE07wWcgIc7pqQTULsM6R9DoZTMRTakDQppu55s5nQAlWwvQcB5hQuEpw3tafCLeN8R1b2fp+oE6niLTs6sttLtaltApsoP29YTtliOAKf1wkOkIpAfuc8kebQjkZEkLBIIm03bAFR2sIfZd5wvtMZEEXl9lCGuM/NCAeq/EGHzf7e/YW8ha/Ad1q52HTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX2khzHW/ntLOtVcA+/Zjpz1pgf05uFsk2nH39SfOmA=;
 b=nTU1x2uZiocwhRxGw0sySqqFewwU1PCdHUewqru3JhYOOfZJvx2Vl/0XZuYFHgd8WRTFURtHir1Idr4xlqP+Xi79XaGjShtc/SP0wj0GMnUhOsn+QANqHY1hXnrzuLmasODVW2MroF/mDSDE1yALtNOhlQjYOyISdqccfhrRr32HDLfsOCacejh+Xx0kCafilXvsHdWmGEmzIkfs47g5nZbrTw+wCK5yeq0xwCdlWOnYrdOfcp8cdlz8xfCxJgnKSVTRymYNd9+P8kw5YHabY3JMT2o7FL3Bfhmp8UV44ZfBLbakffBF112egfQYXFgWFcpbT0aQRlp/OUiAouLEqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by DM6PR11MB4675.namprd11.prod.outlook.com (2603:10b6:5:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 21:33:34 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 21:33:34 +0000
Date: Mon, 13 Apr 2026 14:33:30 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>
Subject: Re: [PATCH 1/5] drm/xe/multi_queue: Store primary queue and position
 info in LRC
Message-ID: <ad1hKtgHQf84pyqg@nvishwa1-desk>
References: <20260409203714.1887402-7-umesh.nerlige.ramappa@intel.com>
 <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260409203714.1887402-8-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|DM6PR11MB4675:EE_
X-MS-Office365-Filtering-Correlation-Id: 56afea42-8091-4bb1-421e-08de99a450cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Wp1G1yMH5lLtM4BV5QJLme4mR5IpzQCUCKDRouI4v3MBIFa5d+GZOLcC55ZEAgUo8SGMGtGNGr5qcudiwAgDdQP4pYuqv4hwvYtNJkYbf9Da2qBu+NXiicQJOtLatfCASCNWRMV4uKwMFmKzbjyVFuZAamCMwbdQVRere0mC39yEFSSNWHalb7aK9XKyC8dRcifSQkxgv7SSKqqN1Y4Qoqz2mWs4HdpZzLsMlSe4f0RWvZHji5J/bnNf83FBExyFJHTj7RRunIk4oUM/pc39nA7S2mKt160WputG+G9pi9Z7jZDZMXLbWS+DR5SjGjNkDsp6oi+N4UhLApi9rsui3eAdOpv328kPnctp3GjIeqxkntt4wSZciFWm8KSyR/Z2CmP7fZA17OLb5QVfUIaxLDp42u7EvMEtZ9xvRsWGF7OTmz5dJdIUgfudM/K9Q/BTtHhgjLW8E6t51iktBoc9csFWtTCQEkuHMcBaLk1kTkwBjZ/JyfZtQabBBH9EwUwGiPtu7XCb2ePkgKGrjzPgjacwKXh85q25cJ7SzgEvTOJ0y+CUOkqzNhrzV3TMk4ZlUx0GbB+xWKl20CnWClGh3H449cMqPqyP7w/AYLEVRGOWk+d8oWlJuIrmVHXbTIdclpUo/p7HcS4gYQBUm/VJpQDt649G3arQCi186Q3gDE+9LkSU3HLVoctFUhFiY71HQJB2y4UhvDVPXyub8gqWnws24uLbrz5ICZER0X1ik3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4IqYRhHJ8XHdwgxNksYkerxzsxwP+rOM/0Y8Jz2pdsCSLhUspQOn7sF/sYma?=
 =?us-ascii?Q?kH2/fFYHc8CuG0yWqYXV1XQD+UXCU2GGPte29sbBTpHtQiMDkGdK5Q+VP7Fm?=
 =?us-ascii?Q?4fk7QS3D9aXylQ9bUZ/z99MjmMBVLuD95ESvIIPwwKR9CGHV0RnNlC1AHYur?=
 =?us-ascii?Q?7mh+BsCdNW8Osx1D3wxceykHncOH4E98BbUHbY7PWJLhHvh+NYSOJuZx3AO+?=
 =?us-ascii?Q?zCHl9151yT5FDtvx4DYv8gjNYzwweMqM5n1NMwJs8xq4tN5Z26pzKLhGcAol?=
 =?us-ascii?Q?ROxxSNHNC8/hPRQy5YWLFtI9GX1AOEHGPQ95HZJQ201iLQ7MQghBEfUHzJMO?=
 =?us-ascii?Q?n5p/lrYThGB+ZRfedfOoH/BMtuj9+yILr08M2qCIw93bGoacfTaRVejkTHlM?=
 =?us-ascii?Q?SKlExa3XDk1q3QHefElDEAgAFF0unoZm9lBEsJ+R5cLSK7f/dC5jqPTzo6YJ?=
 =?us-ascii?Q?Vh3tvj+6rQIylsqamYdlCGdEDfWsf/++0T0dHp5HKcKU4VI9l2dZv2Q5gZJe?=
 =?us-ascii?Q?ICKpuOGLBT+XovHE1d/jgE4q4c4sjL1RG3Kzwl+q3Bd91ZxkLaNmnepcicG4?=
 =?us-ascii?Q?cduTLk9UXUtbW2Ummsu2/70rxcWRDtKucxCdNM+zASGFpobPRkiMZUcbqVB+?=
 =?us-ascii?Q?JszSzR/UISv/8w8Mkz8A4jZmFyXGmpxBEtfgcA5tkiy6ntHBxXsSaJ5UI7ij?=
 =?us-ascii?Q?dVO1AcrUicfzlyIzHcSw0eeTwaZUsIiUCDvZksNt7aBj3gLY3SlKeKVFWDS9?=
 =?us-ascii?Q?dtz226zAoi0aSN80/jbax7p6yt4siXIoFZpDfVekkp/xRxSyDuPlURK762rq?=
 =?us-ascii?Q?os/IGtR4kC5+Pei1DjkcZrXQ9wIq/TbuRnetmtVngnzWjNKCYEZ2g2hz5CpM?=
 =?us-ascii?Q?J7RB0M1D+fDsCpfUi+sLTKK5itQ1Cy5fgygR4HAhBFg9wsiXplDcWT+efBh4?=
 =?us-ascii?Q?iiTY2z0+gr7fkfU0bV7LHjLEEObYug9QQu7tIXlMgSi1aEdJNMoz/ocepAWU?=
 =?us-ascii?Q?44svz+ItkVYn5ADI/SGK5kHSuhv7PYn5ZwJ+V+SrU3eDA4u648AzFhQnkkv2?=
 =?us-ascii?Q?WTxRuqsHnEcb11f7QDTaeMKyhQl2x3rgZ0XuN3G1jIWr5lBkvaUwXa/L7VHX?=
 =?us-ascii?Q?/I7sp034tYN/amYGiLxIVP5BKWkKLljpEKuviVK0PVTS/WEK/rj0MlZBm/sH?=
 =?us-ascii?Q?CjtPO+50/xHKxFH8RM1t59IJHhqraA4Y4Aevfydq6rK+CFlPe/EJgzcvVCPu?=
 =?us-ascii?Q?Na8bJRGNwmHQwjNJTgxxMq4MNvN6m8fTESFjFnh5GbkynOkCMyfuhDclaMmC?=
 =?us-ascii?Q?RRhSLCXbCIJvul0GTo4Tz0MqGkj6Pq3Bu1BBk/gcFw1cb6mnC5G3szFwADKf?=
 =?us-ascii?Q?DnlZrVQA+TiWzpb04b0dLSQg1+Xoq2BlrRsj7dRuDUhVpzX6TfBdn0KWuTmd?=
 =?us-ascii?Q?O4/XRPLrY6AdEFk85o8ix72TWp4+O3l1ZVckrkNVj0Uy7TdaI9IOULKVbl6+?=
 =?us-ascii?Q?IA1ExFGUzTX6gr/7oZ9/CoL8BVYW+sDfPX6uP5QAZTReOTb0Py4VlQOded0z?=
 =?us-ascii?Q?ozU57BOsxRf2tPPMxv2VJGg435ZOSBfIZLiatLnTAbnqRpQSe2g3UUjWW4/n?=
 =?us-ascii?Q?6s3hOanhDumlGEDB78qFniTWo25K6AEiDuG5CNdbyl22Em6VTVaoO/aemjT2?=
 =?us-ascii?Q?342d+/65xaYsBiKJpfHsHKcNfjhMCUX7vgRxmO/d+cDs/jOQunWpnIet4XkW?=
 =?us-ascii?Q?wARVx/00ciuSeAYKFTbCDR65CWY4SX8hrPfpyn6hiFTJzOY1mPh/?=
X-Exchange-RoutingPolicyChecked: FalvZ713R4j3m+kJ8mJzt/ZBFNwtLwEy10eYGhylA1KTafpFexxZXOeY1EycWBEISGIWNcSWDxuAzFIqKG/0cBvyKFWkSFQyUiaM+Ug9A+mHWi7fcaQ0/sYDQdrYduburkA00uGrAz5hH7MbktJUELdl8JAq3AvPojBzzllbmZfIhNougkAd0GwJWFKW20HTNPZxmeQXv6ZJgWCnYsImOG+rjBauvfDbGixetyxIL5OQNXclgd7aWeun+/9CEjlD167dQUWiRrr4WalCbzj9m0PgUIHEfcGA4gyI92hXi+6/j9cNbm0zzj7pB7BvDqUOm6E35mnUdFtpIyQCVLotIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56afea42-8091-4bb1-421e-08de99a450cb
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 21:33:34.3465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRiw23hGaR7ophwKPtaqqW9EVRzJpI/vQxtDfuAFFZd2wi/l3n3QAtUrKdtZEaC+XjNvbOguDgmEjgjz/fqbwuzdrYt8XTRsnQN71TC253i9oFlCYvnPGvR85zKjgBcd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4675
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

On Thu, Apr 09, 2026 at 01:37:16PM -0700, Umesh Nerlige Ramappa wrote:
>Given an LRC belonging to the secondary queue, in order to check if its
>context group is active, we need to check the LRC of the primary queue.
>In addition to that we want to compare the secondary queue position to
>CSMQDEBUG register to check if the queue itself is active.
>
>To do so, store primary queue and position information int the LRC.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
> drivers/gpu/drm/xe/xe_exec_queue.c |  8 +++++++-
> drivers/gpu/drm/xe/xe_lrc.h        |  5 +++++
> drivers/gpu/drm/xe/xe_lrc_types.h  | 10 ++++++++++
> 3 files changed, 22 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>index b287d0e0e60a..4fb02eda77b4 100644
>--- a/drivers/gpu/drm/xe/xe_exec_queue.c
>+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>@@ -275,8 +275,14 @@ static void xe_exec_queue_set_lrc(struct xe_exec_queue *q, struct xe_lrc *lrc, u
> {
> 	xe_assert(gt_to_xe(q->gt), idx < q->width);
>
>-	scoped_guard(spinlock, &q->lrc_lookup_lock)
>+	scoped_guard(spinlock, &q->lrc_lookup_lock) {
> 		q->lrc[idx] = lrc;
>+		if (xe_exec_queue_is_multi_queue(q)) {
>+			lrc->multi_queue.primary = q->multi_queue.group->primary;
>+			lrc->multi_queue.pos = q->multi_queue.pos;
>+			lrc->multi_queue.valid = 1;
>+		}
>+	}
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index e7c975f9e2d9..b544c8169967 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -90,6 +90,11 @@ static inline size_t xe_lrc_ring_size(void)
> 	return SZ_16K;
> }
>
>+static inline bool xe_lrc_is_multi_queue(struct xe_lrc *lrc)
>+{
>+	return lrc->multi_queue.valid;
>+}
>+
> size_t xe_gt_lrc_hang_replay_size(struct xe_gt *gt, enum xe_engine_class class);
> size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
> u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>diff --git a/drivers/gpu/drm/xe/xe_lrc_types.h b/drivers/gpu/drm/xe/xe_lrc_types.h
>index 5a718f759ed6..93972536214a 100644
>--- a/drivers/gpu/drm/xe/xe_lrc_types.h
>+++ b/drivers/gpu/drm/xe/xe_lrc_types.h
>@@ -63,6 +63,16 @@ struct xe_lrc {
>
> 	/** @ctx_timestamp: readout value of CTX_TIMESTAMP on last update */
> 	u64 ctx_timestamp;
>+
>+	/** @multi_queue: Multi queue LRC related information */
>+	struct {
>+		/** @multi_queue.primary: Primary queue corresponding to this LRC */
>+		struct xe_exec_queue *primary;

We don't really need the reference to primary queue here (as usually it is the
queue that has pointer to LRC).
We can just have pointer to primary queue's LRC (as primary_lrc).

>+		/** @multi_queue.valid: LRC belongs to a multi queue group */
>+		u8 valid;

NIT...We don't need the valid flag. We can check 'primary_lrc != NULL' instead.

Other than that, patch LGTM.
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>+		/** @multi_queue.pos: Position of LRC within the multi-queue group */
>+		u8 pos;
>+	} multi_queue;
> };
>
> struct xe_lrc_snapshot;
>-- 
>2.43.0
>
