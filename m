Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F1FC5DF97
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 00:41:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A039410E043;
	Mon, 24 Aug 2026 00:41:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HImFP1fZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B5610E043
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 00:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787532071; x=1819068071;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VA0jyxFxvBKW/v5Twv0yQzOQl+3k4mCPv/BTC5Ut56s=;
 b=HImFP1fZQBM3PkBmwyyOQIGI0OvrsZguc4cicQHXkI/wFZMUh6DsamJ3
 6R+eLBuLd0m0Ua4tKnTkkSscozfJrlbXnFDj/6kY551GeZQ68NzgNiuo1
 pTxXscmQmDAbtMKXBl/NZkXWhCdzevGeWAQISejkDsS+Jlz8bCbTo4Jqo
 apykrXnqJ+mGbq/SrjXw3i/bA8GKIL+BBdSkwd+WQS+ipxvQIfB6s6wfc
 gnOk/4iml6cJmDtzCjuGXWLrFLaIBanIqbyly8YvG+4QMecNvPfKHOsJk
 460i0yG611C0GLm6MN0fo39KJ5uSgMRV+PhcORR9tgXKZ3kwZPMINCpV3 g==;
X-CSE-ConnectionGUID: Cm/0e6DARfOTgWTe/HhDyQ==
X-CSE-MsgGUID: /bCoxpdpTpqCwjspDNBZhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="113514994"
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="113514994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:41:10 -0700
X-CSE-ConnectionGUID: 3QptlaG5R3Gsoe2FybKd8w==
X-CSE-MsgGUID: VI+pNapvRyqharmC48dqDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,239,1779174000"; d="scan'208";a="267424089"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2026 17:41:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:41:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Sun, 23 Aug 2026 17:41:09 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sun, 23 Aug 2026 17:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xcict1yYW14Hk57OF2iQotPjsvROPVAvIjlRYwmGHcnRqzpVX7lnmUHdY4m2Jz6ZNGzLKr2lIJmzAli3THyX81WU2mLyntGw10i5+giKWsIteYICuxx943cwK3i0u+VTs1mroOKZ9u2v2CB8Wk6BAdwFE5snPR0ewagk7ok/0E9LrtCIRxWu8wvOLDR0DQrvG4O15yNoLlxy2Hlq/RANBj4trkcVs8gPHSzNuO+reZpDPLJRzu2X45VR2LqUZSlS3+mXt2HoGYja8ANa5PsFd6Q927ttHQ0pIN4UHLGRf3ofpeRlyPALy5TR2e8wNDUqgnwOvxU7XXZiAvbcyaKtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye1eg8yTwPh6/yK7TdA1Mm326XwpA3gKLqBQerJoMVs=;
 b=CAKf4hnEYLKStvA072aNwJgkAy2Jis8hdMsY4VYGB364H1T99HNtL3HqAt30wTK3RUM4nyuHyG5nuwMcFLpTckFw/dEHNi90EJ0+mELPMfQoarhU4bj4IB7jY8VGlxBVUHO4KVH5MDVa+TcWsfBGno7h9Oeh8/is1nNMJKKutlpDSnfVVHlWL2bw5fd3C4mVzLEmx0zwcJlJhkB5mR5ThhxF4/rEsNw7Wp1xzS4Q0xQ+zwLdWrs2bCtO67GwP/Uwe0h/GNFTGt4qD5aipUvHd3AgLNPpQ+KEOaTtbahvgBiVLygS2N0a3Sjg4+/fBCLE3hTcIetV9u2LUEx7ycAu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LVWPR11MB9905.namprd11.prod.outlook.com (2603:10b6:408:3be::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 00:41:07 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 00:41:07 +0000
Date: Sun, 23 Aug 2026 17:41:04 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>
CC: <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/tlb_inval: add FULL_INTRA_VF GGTT
 invalidation helper
Message-ID: <aouTIKK-XivDxamR@nvishwa1-desk>
References: <20260821074238.3000501-1-tilak.tirumalesh.tangudu@intel.com>
 <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260821074238.3000501-3-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: SJ0PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::26) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LVWPR11MB9905:EE_
X-MS-Office365-Filtering-Correlation-Id: b71c7387-e459-4cc4-477f-08df017862bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: VMpZmdgFbiwD3U5+6FwADaoZnnHTR20pkrvS5JBecLLhF6m3mbksLIDKfegE8MKJxLt7jFo5B6BMFZ72r1SaD/FBASUKZfiWjMtG+lrxEm8f/I+MUEUsY/Z2fePdSnhSo77J5aDRcXjCtgYzD3tzCm8cK4O0YUKYdYn3n/UbquBgLZqXZMWhmWae8+VDYD9xikk08hNq4ddGz3wWRXru1oV66v7qSgEArtAcbWODgyHhkQYTBdlXD19UmZr/5WHW0iE5sV+FNq+1IdGyjr/IoYnpWas7TcR4nkuI28DcoqMcQ4yk/JOXE7qx5KNX3QHmlrF5m7/odFHxlB09bzi+Dc41jJPaW7r6wd/AVa95QQkHUnGNONayWbqTVQFAAHMjDYS/aLov2uwC7BPOUyhewCNso/grO1RkGR5PTCxyXQ4VwEMoCg9Vh8V6PJhxkSLCRIdnWe3BZfetqwnA96AtqFG5mACx+ae+xxvzill1ZvyNhAI1W7r2RFZaKCv5hrhYUObHwQUzrvlcyqMhw+dcxy+//uzLPWXNau46GdAvIj5KbR1d6FoZDxMW0jK/SB+P0ARlcLhD7I9Ag+9mDf1Vwy7evVHNSmLeMsWMYhvQaeO2DQa1wxPDlhQ18zxX9JidPMlVO3bxzSvdTggZIBrzNBjabEOiSgbbz3BAtZQEZLA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1hnqu4eRi3x4gxBNcTWGB8WKgwyTA2MlDElOPF7XqAxet50bPccHnE87Kk4+?=
 =?us-ascii?Q?ujxxEk35UykfvLVzlcqKjPV1DpOlrA1AXXqZTU/zqCsqtO8ZrQ7Wa6Vily88?=
 =?us-ascii?Q?VMZ9tcDMi5t7TLEFSLNlTMK75t65q/hl1/uPhufVnpIwtkpGH3USD89sfY/L?=
 =?us-ascii?Q?TUdXj+BW1YGK7xh4jX2bKteevC/WCOKklEeIzSfx+PWOY5I1o3Az/aeSCNOL?=
 =?us-ascii?Q?lMSZV4WmmKEMpQvvoA1Xki8zFHimZa9QVp5YZIHZYnIXJ3EUcpqic6D0oDY/?=
 =?us-ascii?Q?y+Xutw6bLgGa/BQ01NsLedRG2TSJDllyQ2h6HAMuRzyRvfV/8c2b7QZBPxyk?=
 =?us-ascii?Q?jIG9kv+V26ZveW//SoWunFk5E635n0LlxjTnL+HrZ34kF6GyqVac1wnJaCUI?=
 =?us-ascii?Q?aXsKj2yuCWKV/Bb4Pdt4IeW+DG5JmnNcuX4RmMf+jO2pFK4DHaS8dq39ILIj?=
 =?us-ascii?Q?S2X3+6o8eRV/lTk/6D82HuQQxoVarmVzq+/Rk6qBe/9Gd4grCf/f5Sq1wHgu?=
 =?us-ascii?Q?vKxKut+2as3OngirozKdi6S5hpl7prDAZbcSGgBL25A6OVgbN1SnW9DBVJq1?=
 =?us-ascii?Q?9ojmgGXOZ0gBppNpN6O3l+7Sl/ZDYwFz7PqhCCugA1NHwUIwDkBDNeaExqrl?=
 =?us-ascii?Q?6QX0lC9ht4CaSB717e1tINn9Hz8/kiAU7GcSgVD580oMk2hNYznhhNjXnQ3g?=
 =?us-ascii?Q?5EnhOw1icc/xcq6woHqHrmrB+ua9CveSnwdkgQLMvQ8+BjpXSF2loMUtM4+2?=
 =?us-ascii?Q?BlpVPOuMVNRtM8YCAiVddCZI4ARI2Xvt5NbwJnWgbLpYZ4Ud3/MB0D8S35Mu?=
 =?us-ascii?Q?SzOqvyn5Vl4kY/Fv15dfcPt0S5mPx5ygrXwu8ur6mqLTQ5sHOnjlOmPgWeQB?=
 =?us-ascii?Q?WygSOqqu691TeXI0wAPEpmV/X9qyJCf35mre05XE8trMzpaC699M9BnYzY8B?=
 =?us-ascii?Q?0a5mGR+AwS5uXC5N8BmeGSaqs2Rqr/vM2Jip8alaT+igYfM0fE755y3wCCIG?=
 =?us-ascii?Q?E30LFIE370vOWWJdQqxGY0IktN5gA+memPzihpJ8D3JyN9ZgN0CellxJYTSu?=
 =?us-ascii?Q?G2Pdah360C5sDK1zzsi49EDpeQ6+wmADC8F/Ed1/V8cNyYgtdJ2f9zqXRlXg?=
 =?us-ascii?Q?1H02JV6XPOdBwmq76p1KTx6qUa8TOka0A37T9BVDQ/s6qqU9br0XYo6iWxrR?=
 =?us-ascii?Q?6oFb0qHc7wEjHrsx1Ya1U1HtNmIwoLt/FI8O2RHQ5bbIk17T3zaViPkA2qh5?=
 =?us-ascii?Q?kzLH/AoMKCZD07YaUCjlHgZ8R5CMi+/8Y8ADxaJHPJjfXFe39RnSWFJTPCum?=
 =?us-ascii?Q?5oxn1q8a5KqWqZ5+uz7hs6ufZ5AoJwsj7wzVxQ8lR9/92xLUdhk5W/xwTvwz?=
 =?us-ascii?Q?1APYc7PbNT/d420Mxpn3TxFIhNAAd3h7AqZ/TovLo3wJbVAittOx8ubJdXWZ?=
 =?us-ascii?Q?WC8RQ2oNE8ZQx9dFghBjxHKJZw1jfn7glz71u/cBE/5VgZ/XXuweW3b+wbCT?=
 =?us-ascii?Q?2kXbWePEzm9mdT/5DaCJ2DpFFPX7Q4YFhGxx8qf50KhKvsajO8B5/725odqu?=
 =?us-ascii?Q?a7NDUW+1OdpZXIXmuhEzxQkRG7PpIQB5qxKqDxr8pI4wbBl9pcn7HS2pTn7x?=
 =?us-ascii?Q?rmtZn7WTklOuAcAfN+1HCRwnajJxW34Gfa9EF8TNLq2foTuh4VXZ+92Kh/RI?=
 =?us-ascii?Q?D07YnMEzycfv7KroC4U0qlM/tcy7Od7SkdN+slxJUNSoMWVLdSDnCfgkWt4T?=
 =?us-ascii?Q?PDf4gYCvGrMUvt6Di24oTpU4jtx8iCxfmU8nb5pinp6+JFExibyo?=
X-Exchange-RoutingPolicyChecked: Mogu5ibcNrlRVyNQWPrW9LIWb1yBrRANM/5RTTN7fsxsTov1h/oB4HgqMRZL9O32vUiAcBo7DIWCg09QEdeC8pofi52YiY9vubesN+UQJ/6rO0SZKaMwcZ77dBGS7a1bNnhj40rQSNLVQwv2x2nxIRN1SUhB4nQ626a6RzS/WpH+uzqtLcWVFGKG41+qJPOz1XqtHKrkfpCMnrRTLiUe3Jm4Q3QnW8GKEyE1pl9VK16SUhxNKBlAEvUyKtgrN5rQYKunCocgmX2AUdUPF8Zuc2slOc72ulweosoSsJtN6k+ezBItglcUK9sxGSAwq3psGm7CbGJnbaI15XduOS+RhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b71c7387-e459-4cc4-477f-08df017862bf
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 00:41:07.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cftL073qJLt0M40Qirs7T6qFELX1TGQUskPjK06tX0O7Hzy95RD+aoS+4Vw9vHY5HY6F7Tmv4HBLwxpPuYUctbhH0Lz4R0WKUXpIxz3TbbsjD98T6Ohp4wB4q8hVB23P
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

On Fri, Aug 21, 2026 at 01:12:37PM +0530, tilak.tirumalesh.tangudu@intel.com wrote:
>From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>
>Add xe_tlb_inval_ggtt_full() and its GuC backend
>send_tlb_inval_ggtt_full() for full engine TLB invalidation
>within the requesting VF partition across all engines.
>
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>---
> drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 21 +++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.c       | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_tlb_inval.h       |  1 +
> drivers/gpu/drm/xe/xe_tlb_inval_types.h | 10 ++++++++++
> 4 files changed, 57 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>index 046d0655122f..9c7a02827902 100644
>--- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
>@@ -98,6 +98,25 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval, u32 seqno)
> 	return -ECANCELED;
> }
>
>+/*
>+ * Emit FULL_INTRA_VF to invalidate engine TLBs across all engines
>+ * in the VF partition.
>+ */
>+static int send_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval, u32 seqno)
>+{
>+	struct xe_guc *guc = tlb_inval->private;
>+	u32 action[] = {
>+		XE_GUC_ACTION_TLB_INVALIDATION,
>+		seqno,
>+		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),

NIT...The commit title says INTER_VF but the macro here says INVAL_FULL. It would
be good to be consistent.

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
>index bbd21d393062..aa12c7d95448 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval.c
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
>@@ -321,6 +321,31 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> 	return ret;
> }
>
>+/**
>+ * xe_tlb_inval_ggtt_full() - Full engine TLB invalidation within VF partition
>+ * @tlb_inval: TLB invalidation client
>+ *
>+ * Issue FULL_INTRA_VF to flush engine TLBs of all engines in the
>+ * requesting VF partition.
>+ *
>+ * Return: 0 on success, negative error code on error
>+ */
>+int xe_tlb_inval_ggtt_full(struct xe_tlb_inval *tlb_inval)
>+{
>+	struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
>+	int ret;
>+
>+	if (!tlb_inval->ops->ggtt_full)
>+		return -EOPNOTSUPP;

Not sure if we need this check as ops->ggtt_full is always set.
But should be fine.

>+
>+	xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
>+	ret = xe_tlb_inval_issue(tlb_inval, fence_ptr,
>+				 tlb_inval->ops->ggtt_full);
>+	xe_tlb_inval_fence_wait(fence_ptr);
>+
>+	return ret;
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
>index 3d1797d186fd..02a356bfef47 100644
>--- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>+++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
>@@ -36,6 +36,16 @@ struct xe_tlb_inval_ops {
> 	 */
> 	int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
>
>+	/**
>+	 * @ggtt_full: Full engine TLB invalidation within the VF partition

NIT...May be say 'within a VF/PF partition' just to be specific?

In any case,
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana

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
