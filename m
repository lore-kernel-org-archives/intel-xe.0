Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020D8E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 15:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B340310E6F5;
	Thu, 19 Feb 2026 15:23:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WeGZZrFF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5EDC10E6FA
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771514591; x=1803050591;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=o/6hEsz8KKtqaK8OI1+A9+OAXkF72XVI3CfKpLG7mGE=;
 b=WeGZZrFF5I8Tl7c7j/Hs/4Ud3cFPikF6ZrueOj1gPTammAUScPmcl8Ic
 f2nBS8CUMsjq9+grN8xdXM1JszS38fKSqnFtT1qAKzKWtVrc7Lh2iz2cp
 SZmvw1MzLt0I6aGnYmHY0gvNPYnImVs2Klv9/6omVYOlkcwsXXQoMBJoj
 FxE0vmh+uWJ2PHPxEZBjtD71z+VpjF33B+bidncRwGggyIh1Bwctd50p8
 etYQhxdg4A5/qntlmWa8JMekC6uFnjvKm1Y2Z70k29gTP+4+RgUeRFiNg
 bsUxp1qdKBk3sx+LkJEqv67If7hz3i0VA03iiF3xzAn65xoReD9cFZZQt w==;
X-CSE-ConnectionGUID: CcL6kk41TjSrFvF3w1FWsg==
X-CSE-MsgGUID: oUjqawSGRh+yO/ZKgr4iEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="72485811"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="72485811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:23:10 -0800
X-CSE-ConnectionGUID: nwHyT0SjQdi3XPK9ZSWyiA==
X-CSE-MsgGUID: CcJnjaSkRYKgAxML9g0A3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="213632284"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:23:10 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:23:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 07:23:10 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:23:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkrMCOPzpwyqo679442gYXJYqkZrB1IwkcKM1Mkh+lql6Gdc88a5efVCzbjigFHe4Bx9fa9TsL43WfHtNUvS5O67OULtOXGYMWR+1tEkPg//d0s8Ly8X/ZArNqVABAtzGbX7SmnB/gB7Qn0btoYfIHnY6k+c0raCuEol0U4fkRpl44eaYABTK0JApeudtsvuAc2npQUA2VN0v7sk+PYMUlu0rLmFx+K1Dg+f0p/woXHYFDCpjFRHJlKhjHYOaq7uwI6WwLuGSbJS78Y3k5gVs9+zNtfumQknImMT/QS6DhFvHgntwohoOA+PnhC1RizYGbv/2eA/Ej9SeZWKG2fRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXNvfKNJJjLyo9OY4gn9W8nRNEWVrwbBbApEVrXLYBc=;
 b=GQu9Z6Y7oykQCelHpeLpZ+Xfeva4yFL0WUIDvewwEjGCB5bMAD2jfwogYIBy4zbOoESsluKkQKaHdq54KK9rrjOMkhKCnSuirufjEX9xXkT/OYIgVCXkXQf9Fy6WOcH3aciBPfN7leYUcelao5yUe8bv5rfgoonHM4UVqw6ev0oZ74wjTtPK69RXuEKqmOgUSzThLWbD2fqhxlfJa2L1rzT+pCFYiAPZA8qyppVIiErU+6Qr3tzMi4s+g1IR192yuV3PpqqFLHnGcvOXaQWl/klq9Q1r3n0IkEk2JxktNlRrMx75LXUWj4WmhGzgzFDCBrLkyq1QE14jfUxV3B5JQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF3A51834D3.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::821) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:23:04 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:23:03 +0000
Date: Thu, 19 Feb 2026 07:23:01 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?=
 =?utf-8?Q?re_for_drm=2Fxe=2Fwa=3A_Stee?= =?utf-8?Q?r?= RMW of MCR registers
 while building default LRC (rev3)
Message-ID: <20260219152301.GB4694@mdroper-desk1.amr.corp.intel.com>
References: <20260206223058.387014-2-matthew.d.roper@intel.com>
 <177068603722.239534.11287797524339298519@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177068603722.239534.11287797524339298519@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0237.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF3A51834D3:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ec01f9-bfb2-45eb-5060-08de6fcac630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TbeApSZ4ZsIOwT8Q3SyJDGBCcn2Q94iI7c12dg2a2Ge12xoUtRiV3EQPFvXW?=
 =?us-ascii?Q?7OUTejdYSk3HC2z7VxUE/ma2+v3QKS4NB6Sb8EpCYW/35P5QXlGCBJhf9PFe?=
 =?us-ascii?Q?Sn6UsNijupnGOQJ8sGn5Dpr0D5plBAykxsmPMli8we0dbyO6/frbCxzWbDab?=
 =?us-ascii?Q?I1Ei1sDqnpefU12HamQWvdqEEkLufMH8rESp7a5pg+J0RTX0ULtg8TyaGFIe?=
 =?us-ascii?Q?Z4cWvKN1pL1zjD2R5pGvz9t+w7y82M6CZA3WXvbkUYcL19jFcoNyzlo4U26A?=
 =?us-ascii?Q?shbhxcOw3T/dR+IeKvY4PsFLxRX9XHLT9EU1U+RMkxYIEBrew6arnp7knsoc?=
 =?us-ascii?Q?stnnwEAJ5hlBK+hql88mfiGSPCcwL5GOQWMkBovWXDnN6HZTME8lEHrd7NYp?=
 =?us-ascii?Q?96zOyUEDSxlXs0x71sDvc0VlAkS5ccdxLhwauw4j4yVpDYXcUCOlhcg+jQhp?=
 =?us-ascii?Q?/dZS6iFIBhfYWLGoNlm383/Xl/hKxzeXv+IpTYeIO8Xl68Rfwe63MNX88Y7M?=
 =?us-ascii?Q?6MF5lR2GHrpLQEwfczXVl+j8NEUKb8PeOhkcRucAqcby+8utvZo7zxZ3kFF/?=
 =?us-ascii?Q?PZOU5wsILO8zsT03cCDgFImjEkufK12QU6ZIVl76Aeyexl8pn99rxE6rcM+Q?=
 =?us-ascii?Q?Y16S7/ceeqwDaVSfPTC30egYQcUGrDbw26/haFZnUYjoyoVVjswI+bnCrIJJ?=
 =?us-ascii?Q?l/Jz/chhkOCIhTe4NFbTvrHfIhZdqbKKi70UmtsAPz8uW62ANwTBUrrEoB87?=
 =?us-ascii?Q?jYnmImlB9/KEU8YC9JB5xDJOS4MlmhfbKgrZPzXPWD/S96TkhZ6w9C5dH4XS?=
 =?us-ascii?Q?fDeG0sPNqQLhlf3yT9rMbdMdBYXR4MmdCUryLHhARiFr5XJ1RYewci0xTfyz?=
 =?us-ascii?Q?Ltuy9S1o5f4T6jVuCieDezzOHoe84G1eNY4Hhp1m7x8XVoAW17MtBdubQjPY?=
 =?us-ascii?Q?BX9gTohoZEliYqyg9Rxp+voqGP4QAAPJqy6fmmxIwU4wBhkCyIXBHABkd3DO?=
 =?us-ascii?Q?1LUgx9m0JQjdGgT8YM/bDME45i82NrrzpwFMGBeTagIogU0WKMOSB3QEapmu?=
 =?us-ascii?Q?71JMOra9Nqp2RSMSLU8IvcNTB6ZjJ0L/CQ/7hZRwLMNa/grsjREMYqnPLhHe?=
 =?us-ascii?Q?rENd4YWk7Bi4z51TnbHmsj1HgZD7gohOqEF1qLrUyjHedC6O0CGBtOMlYS1K?=
 =?us-ascii?Q?4MLhgtXeGSKqjNUaNezBdTQoJJi7OUUGVemZxwmqYot4vj5g7SULe3stgODF?=
 =?us-ascii?Q?Sqj0Xr6sFLw9UtogUNiQJuBaL70zrYetEHL84KCWlTSXCGfZZEV3r5i7jTTi?=
 =?us-ascii?Q?LxGxBTQ4LZJwu+9PLm5W7V2xOMhm2FoJn280wBKtAAJiOUG5Ft+CVrBwMvsB?=
 =?us-ascii?Q?2/FToSA8dRCp/pA9dEonitiHerh8kkdM0jslj/dD8tkuGjZcCGTV+ug5+08f?=
 =?us-ascii?Q?mR3XlBwJIHbJWTKantgUfUtE2Q3Rl47yzQEMJhL6kBp08/hQbgD2bMlW6+iG?=
 =?us-ascii?Q?n80h9q7lTwtGS1ca+ZZtOGpiSvVJEak4pCFB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Fa49Sn2YtkotKAYFf+pZOJvqAz5FE4jgzbHhEqgclnQSGlvuzWvRIZbuksQS?=
 =?us-ascii?Q?1LQxuZQdX69nPOIP+qeElns7kFmWLvm7zSODV2NM7VEK6/aO6otFkP1CX4Td?=
 =?us-ascii?Q?Jdy+O+rjLHRuZB23BlEKMHHhBP5rR/dU0YK8P12tRHzh2SJUyG0nkoau++HU?=
 =?us-ascii?Q?qwwbxkSPgPe/bCcaD5SpahUdgYCFnSwMu/DG1rDkRrA2Pk0Z1cOn7YvFyHp7?=
 =?us-ascii?Q?H5lYG9ma2z+Cs0bFSU8jJTxnuBRJFIGfIhZbOO/yG3+sfdYg4m7qZsa07vyu?=
 =?us-ascii?Q?cq4pkUjqQ/O2JtUbPFMdWbTMQUYuBpC8xgOKGYUv5wLRp8esHJpjW3Y540x6?=
 =?us-ascii?Q?W8/l4xhvl7diTsOPVkoEYqjZt+Z3Y/93uoZMuCJ7R4/xioh2eS5CF8asBXMi?=
 =?us-ascii?Q?Q0vE5Zzl1/NCPOOtLO1fBg1NNLVySIjwWCIvHvqdzft7zXunum95VDnPDml3?=
 =?us-ascii?Q?Sr45QhaYdGNu0hZqPBC0g7Kk900gXRlJZ/RKO7Qui8sqxB9cvi4ZAnSph5Fu?=
 =?us-ascii?Q?csoti10p3QQPAce6h1EZDX5yh7ZCOr4DPBKdXMP6xJwtwg1eaMNuvLK2bN+Y?=
 =?us-ascii?Q?wq9IPB4nGs6EHGLwDy9hXTuOYkBvMXIuqLFSlse/FPu2iJGY9Y7zqvESgDyS?=
 =?us-ascii?Q?oh5MSkmKk8Q+wyaMMaAZVKRaFvMrZotTM7+tvLGvkj0HicYvaatxWqUFfAXt?=
 =?us-ascii?Q?0qiUVwDp6l63bp/OFgtvsNSIDtL71+U/zoyk3lZtf4wfyPz0ABytieHpiOr5?=
 =?us-ascii?Q?cRQCVK+rlpc2eY5ObJDeBaQkea2tg/+HXgbA0vfrRUxQitQ2/y7bfDdpBWWX?=
 =?us-ascii?Q?Sv+WFwCR4fyPyMrpjI3m5cHf7yMotWJajoh7dlPvGkuoBMLwB9Q4IV1atRxW?=
 =?us-ascii?Q?LL9FBDpjcy2My+XCIncwziDsdNHu7IA09nOrG5Di5Tu8CT5KNLntJLYiEybz?=
 =?us-ascii?Q?QeeBhoUZaHWuylXKdAJg9gKf4kwnT2igKC5qR4ujY3R5CqfBVYzvQ1iDpoj/?=
 =?us-ascii?Q?9+ptJ9SuZ/BW3FH5QprZnXvCyC9LQiKkHBOdYeyyIo8pdHf4eyss7U5r1slU?=
 =?us-ascii?Q?Mb147ptWgVid/yleDjsVdDAn5f3ArZbxO2YQ3RRqQlQGnYQnRIkmds2nzL4d?=
 =?us-ascii?Q?SCLJsEfNcIR8idnmDDOePSeTWVo3cgn/hxLQfCQx7KW3dXiRJ1/FVoaFH85S?=
 =?us-ascii?Q?uQCaflq8oMtTdFySGXuZSGrds6tHrlBOA+6+hSOr10NB7/VvfITvdkA/XbYE?=
 =?us-ascii?Q?gaSayLjIBPdr6TVMuEaM4j2Kdm6ngm9Iq/Chk+5ZayMIYwnbYWxis6wGcC3d?=
 =?us-ascii?Q?kLIOr1EjMmuoKYg/UMVqDe/4gCyXSsl353sJXv8iuidVX19Tk3kUAVT0CfjO?=
 =?us-ascii?Q?uzvmBDEg5g4+YjAK463pO/OGy+DeGRETG6BeoOvh8VDxGedxp5rEzw0Wh/ZM?=
 =?us-ascii?Q?TwbEEdFVlmBpFsJ/LkPVP6HhFoxqGV3Y51+NZR9ubcR69MAnlDKAYxrVQ+vQ?=
 =?us-ascii?Q?mbl79fW+m+oK1jAwH6MTrMeM19lC2hFLdhoS3+CljjHshTtiPSasl6wEA4pH?=
 =?us-ascii?Q?UcYBEvWYdpYxsIY14ZJkqiu2WQcAUFlfjB86lvT3GRfbTYRR3tJ18DZv1qVP?=
 =?us-ascii?Q?DyuMiv7TcGbTfEIMn+DFwJ2NjY2LdiO4UXOprFjH2JHQ0MNkf6BYnySQxdFh?=
 =?us-ascii?Q?e7/Mi6bd0ceO23+t/R4SW01skgnS/AoRkqLHMvMbPlwlH8xEm3EtDiED56XR?=
 =?us-ascii?Q?Jb+2u8VCzm8WtmMnVMCnLDrhDNDtgiY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ec01f9-bfb2-45eb-5060-08de6fcac630
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:23:03.6176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XgXCWY1OLNX+Aw5yQGK2sTdCy3MqTGuwWi2CRcPoX1VSe7SXufer533cHNW+uqoMbg9GhrMWRFDSU9TkwX5EdF+NUcA+/7ameN0TOBXzUGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3A51834D3
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

On Tue, Feb 10, 2026 at 01:13:57AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/wa: Steer RMW of MCR registers while building default LRC (rev3)
> URL   : https://patchwork.freedesktop.org/series/161300/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266_FULL -> xe-pw-161300v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161300v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161300v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161300v3_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1:
>     - shard-lnl:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-c-edp-1.html

System never came back from suspend.  Unrelated to this patch.

> 
>   * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise:
>     - shard-bmg:          [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-madvise.html
> 

It looks like there was a GuC job timeout on BCS8 (a KMD-reserved
engine), and the error handling eventually descended down to
get_ctx_timestamp(), which asserts that it isn't used on reserved
engines.  No previous hits on this specific test, but it has been very
rarely seen on other random tests, e.g.,
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7226 Not related
to this patch.  I haven't traced all the way through, but I suspect that
commit bb63e7257e63 ("drm/xe: Avoid toggling schedule state to check LRC
timestamp in TDR") may have introduced this.


Applied to drm-xe-next.  Thanks Bala for the review.


Matt

>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161300v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2233])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#2291]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#4633])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#4294])
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_fbcon_fbt@fbc-suspend:
>     - shard-lnl:          [PASS][15] -> [FAIL][16] ([i915#4767])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-lnl-8/igt@kms_fbcon_fbt@fbc-suspend.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-lnl-3/igt@kms_fbcon_fbt@fbc-suspend.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>     - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#2316]) +6 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-rte:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-1p-rte.html
> 
>   * igt@kms_pm_rpm@modeset-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp.html
> 
>   * igt@kms_setmode@clone-exclusive-crtc:
>     - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#1435])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-3/igt@kms_setmode@clone-exclusive-crtc.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_setmode@clone-exclusive-crtc.html
> 
>   * igt@xe_eudebug@discovery-race-sigint:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#4837])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@xe_eudebug@discovery-race-sigint.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [PASS][26] -> [INCOMPLETE][27] ([Intel XE#6321]) +1 other test incomplete
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2322])
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7136]) +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-prefetch.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#5625])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_multigpu_svm@mgpu-migration-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6964])
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@xe_multigpu_svm@mgpu-migration-prefetch.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [SKIP][33] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>     - shard-bmg:          [SKIP][35] ([Intel XE#2291]) -> [PASS][36] +3 other tests pass
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>     - shard-bmg:          [FAIL][37] ([Intel XE#5299]) -> [PASS][38]
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [SKIP][39] ([Intel XE#4354]) -> [PASS][40]
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_feature_discovery@display-2x:
>     - shard-bmg:          [SKIP][41] ([Intel XE#2373]) -> [PASS][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_feature_discovery@display-2x.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_feature_discovery@display-2x.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [SKIP][43] ([Intel XE#2316]) -> [PASS][44] +7 other tests pass
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_plane_lowres@tiling-4@pipe-d-dp-2:
>     - shard-bmg:          [ABORT][45] -> [PASS][46] +1 other test pass
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-8/igt@kms_plane_lowres@tiling-4@pipe-d-dp-2.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@kms_plane_lowres@tiling-4@pipe-d-dp-2.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][47] ([Intel XE#2311]) -> [SKIP][48] ([Intel XE#2312]) +16 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][49] ([Intel XE#4141]) -> [SKIP][50] ([Intel XE#2312]) +4 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-bmg:          [SKIP][51] ([Intel XE#2312]) -> [SKIP][52] ([Intel XE#4141]) +9 other tests skip
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][53] ([Intel XE#2312]) -> [SKIP][54] ([Intel XE#2311]) +15 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt:
>     - shard-bmg:          [SKIP][55] ([Intel XE#2312]) -> [SKIP][56] ([Intel XE#2313]) +13 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][57] ([Intel XE#2313]) -> [SKIP][58] ([Intel XE#2312]) +13 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][59] ([Intel XE#5021]) -> [SKIP][60] ([Intel XE#4596])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][61] ([Intel XE#1729]) -> [SKIP][62] ([Intel XE#2426])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][63] ([Intel XE#5466] / [Intel XE#6652]) -> [ABORT][64] ([Intel XE#5466])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/shard-bmg-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
>   [i915#4767]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4767
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266 -> xe-pw-161300v3
> 
>   IGT_8746: 8746
>   xe-4530-51b5b2d82487a590ad0bfd8c3908f82fa8277266: 51b5b2d82487a590ad0bfd8c3908f82fa8277266
>   xe-pw-161300v3: 161300v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161300v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
