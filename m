Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75104C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 16:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F80B10EF82;
	Fri,  2 Feb 2024 16:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxQgyPfc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D710EF82
 for <Intel-Xe@lists.freedesktop.org>; Fri,  2 Feb 2024 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706893007; x=1738429007;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ta0iQckTpPlwPWhZ/HY5Lk0oJf4OouAN2i0mauwhj2w=;
 b=nxQgyPfcjuUZ2Sxkc/Pt5F6WYObxnfw1XQqfzeX9DT1td2Z6sveNcdzc
 ACXgKg9FpR7f0hgdG6RNxbW0Q+pshrp09xMQRb94RcrwfBpVtMvHByA5N
 NeaWEwHf273aV5TrEiv+GgdqaFTkeulq0pu8kwLB35lzThyQuse85TtYQ
 yV0/ndrSu9+4oEV50cYKgLfLR2NUZc8RLyWALQPXvFXbIEJLoThwC03Gg
 kr7rvIzurjJRxF4dX51vuEY1AGbFSZHHv+8GTxcl+pccobbPhX/euuhxn
 4N6gnRzukTQ8qOOw9DcmtcDLU0XxIDiWRPcze1LoB5K82PoqOhJh3qXtm A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10798502"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10798502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 08:56:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4729270"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 08:56:46 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:56:45 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 08:56:45 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 08:56:45 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 08:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RqsMsH2ht85qbfA6jlkbhMzS4tdW28CymkhOYq4nK5Qcnet/RKioykglWExjiJmInqDn3FzWQpglfntGK8aPir4hmRzTOlpBNo1RBjh8mFvO53m2ka+YcYutSgzPvLDCRnFBbgT/nqnjuJx/AHewsONcBJ0VmchhNkPXaagApXFLUKD1MrRLAhVfcRZhbiNl/7yo6kH/qITf1DevpX1NEUfqX1iXHNfDeAaHUQ8s0oY0MRI334rMxao1TXBjaLyCKmO5HxF/ucQ/sihGI6MxasKrB+q1nYE85M1sgB3Aa6OI4g0M9DlXbuCGX3r4icJTfO4REw5595Gu3XcCjScOzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89vkzqIfQGFWc34Mgo2ITwe3jINWdAtubLE7kIEs5PQ=;
 b=IC4+GEEzqxzjUeLY6exRlEjoOxLt4oY/QOJtxaPgdENUmUAj1T8UhBvbQxIQWzG1h3+1SMtlvXvB7gLhDuNl9bf8hBwBX96JOAJrcoOlrt876OHKkHmESraUv7PopEdFMh/PhKbv9ktbXuPb+sOtUtXXM+OhLxzrFSZR8newU1hxTqNrlChaF61WPckIJnN4H/LPozYrT/dj6Q81iSuVclik4ET+qW4GzSrhPknPDpA50k8sRcOs7qlFJDPftcm2Y/g+Mkd6c2GF60UyVkMIAU6P0gtuvpeHZAXi3ZXDBvFkw9yNYRhXcnHXQ8qoDjjzWS+Go3NOJJhDoIUbj7NkBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4835.namprd11.prod.outlook.com (2603:10b6:303:9e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Fri, 2 Feb
 2024 16:56:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Fri, 2 Feb 2024
 16:56:43 +0000
Date: Fri, 2 Feb 2024 10:56:41 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/guc: Update to GuC firmware 70.19.2
Message-ID: <w63lpuqykxkgo73ryhmlslzj3uc64vai22prrzubiyakftd3bk@adwdanyes32g>
References: <20240202073050.1986142-1-John.C.Harrison@Intel.com>
 <20240202073050.1986142-3-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240202073050.1986142-3-John.C.Harrison@Intel.com>
X-ClientProxiedBy: SJ0PR03CA0010.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4835:EE_
X-MS-Office365-Filtering-Correlation-Id: be67855d-dfa0-4607-4328-08dc240fef05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qiz2lmOwLlH6u7suN74v6qp9BRk9yrs7q3xBkGyd4Z1+QvEZ9QdVdIX4Huri0zRfUZHZXdfJfiKa4YwnucE8nNZ5/WjMzfwot1Z4nuPbgad/rxh/hxSkjLYlcL7nT8CRBTvyjtUghe2BuRr+eHHhIKs8nuIKDRNZ8PRu83SauPUl+DlmP9FXqT3F1qBB4stpZ7PuwE1qAB7J9fb8nRfCubP1GLQGOx90xI49UGTksHcshQVY0NzEUpB27r7Imd/oFzHU6+4uLjNy93Mnw177zXJ7ljvof/w/gv8HeG8YINMNV7Jp6bf3fPVbKtL59x8+o4e4EG7GgkpSAiwpOUe/rRtxdB6XpRoD77IumLlrQci3nDYVbNMnaYwu9vibuc2b/698kLeyQBPhGtRdIVpfYhczbyub/8fkBuslYq7p+wfIAugbTa8dhu/rsty/Vd4s1SSD4egog6B/FNd87eJdGYGQn1F08jI30nxs4YHBrXh8vhAw6ey2rgZniC9XPBTBzriMFPM+rn5HytXtNmoeesvFbvq6PuhXpnmvtiVINVkkmp+hAW4NhkMbeA2Tor67
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(33716001)(26005)(41300700001)(316002)(6636002)(66556008)(82960400001)(66476007)(6512007)(9686003)(478600001)(83380400001)(6486002)(6506007)(38100700002)(66946007)(2906002)(86362001)(5660300002)(34206002)(4326008)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KGy+Vwc62UoSXEk15xZ14kyvACzIRmexMipp+adLVFV4BSBCBvGd9WjAyLY+?=
 =?us-ascii?Q?FZF3ixXYDeorLdYhIdSGUCB6NIXCbqNi+HXsUNPfjeHHWjNo0ieMge1HFwlb?=
 =?us-ascii?Q?kRJ/uTx7aN2gqsGQG24D7wtrbwYoOgl81zQx/NKQvJvbjGi2wAQKZwoly23l?=
 =?us-ascii?Q?f1P2Nd/RViQdnABx4OD5CnYKE1bp7O7ZIhvukKX3kzUknJxsa9/nfNUuSJzn?=
 =?us-ascii?Q?gpB1cITfPcqI7A5mOAh6u0Y82BNBH9VFV03nh9g9BdNlS9PI/6Sfc0tzfpkx?=
 =?us-ascii?Q?FuDy/EC/04ZwQBZFdNMIxDKoO3/Z3tRslWCatu0XguuoS0pL8Y/VLSXM4wp3?=
 =?us-ascii?Q?6j3KKMoupJxlyB1D4AY40zTUPeDXLS9t99kyq/TEUt+gauxEdhiiNj0gJqvh?=
 =?us-ascii?Q?4raep3GeblmeWuHoqXhh/Y9basWBlQfFoq9R5/g2pEgOMlpm/gdyQONe1TJR?=
 =?us-ascii?Q?hS26QCLfZVvdG48mLstY1o1cKaPIvgHqVt/l2RhMNBWiyo7uZsjiESTf7PzY?=
 =?us-ascii?Q?/j1drIk209jyOeKhbCP0fgY2P+CpU1hSL9iVf7zLpPxA1MLV/14qKKmT7X8H?=
 =?us-ascii?Q?8q5KSJKmpxWmJh/oOsc9UKeaNquzAj1D86lEylGR3tehImdtQ4jfWmZ21Ja9?=
 =?us-ascii?Q?LVVPUza2T3dOZFlyGxtIU4Zed0rWHTwN8avbmGVAw9vBCoPZwWOQxNgvssUM?=
 =?us-ascii?Q?4N35FdazKUzZb9zasZj8t7BsTjF18lW0KH4AP8LqSqyDlsVEdZAOrTsDSi+0?=
 =?us-ascii?Q?dhoX7Cjrdxb9zVxMHUytcleeWgjk++1Ug5jRlR9r8UNVyGU2lDMHdkMPBthL?=
 =?us-ascii?Q?7d+445OFT5pOZzZQH0Kp6Jfd2EeHwxpObpkU2xdNGzss+D0FfQnTzeFdD1xG?=
 =?us-ascii?Q?rhWpcccw7uWviH26D58Hod4atvjqviSMupVHVZEtSohIe0MDbsknWUnhDULL?=
 =?us-ascii?Q?MjIxZXIQvMOtUSoud3r07ks5Hqbgfv88hEMf2n6uEp79PUAnPm3/b0YEmfhG?=
 =?us-ascii?Q?aLWDv1X6nbMjowyGt5FPJPIZO82Tyg/SkoEcNviCJcGRlXLXtyrtCHBzOY7+?=
 =?us-ascii?Q?7pqnZA2kyq2QIhuecck4wJj141QOjrvFRt9xKKvjgwrUYmDGT5jj3SBmjVDt?=
 =?us-ascii?Q?+A5k/4qGy5u4SwkrAY0jijFL+CyaXmfyIa+p+v9qACF9c2zOGJnYNnHWx2QB?=
 =?us-ascii?Q?76B4wMxtTG0OWNe8RL9PR/9e5kyorIE1nL+xFpbc4ZfZ4kQ2/w4pU5c+Qhbn?=
 =?us-ascii?Q?6hdGkrjckM4GPrfB6Jm+Bb1W1CmzBDO6Muf/chkTR7qsdXL8f4SkrdTVMRnU?=
 =?us-ascii?Q?3pKTVsq74djVFy7ENVuO4d+7fzQir8LUskOLMh+QEV0xExnMgUYXRnrODvQ1?=
 =?us-ascii?Q?ahrQbxf1jhqECKIi0kWQgY+B0EzSx/n3CrUWIZcYsoARCSVmYRDD9QJrFkrn?=
 =?us-ascii?Q?CBYQXq8GdEb98Tc817jpoEHD3ZB1D56hn300q0fvImAa/waPozQz/g5tOAtM?=
 =?us-ascii?Q?kusCFI07tTMd2qh/IG4GWxtX8R/Ogp7xHB+F9XkQJn5b/WkGIkSf455ezJ4k?=
 =?us-ascii?Q?lv4c/DvMDBDVvZioalFJrGGq9Bzaty3G9TnBx4Zi7CQJ8BZdtoPRkRA77IRc?=
 =?us-ascii?Q?9Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be67855d-dfa0-4607-4328-08dc240fef05
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 16:56:43.4238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDV4LzPBnbpbcu6HxBg77BeAAEdGl3DWfl9/BBdFaTynZfMQNfYfikMBBGV+ooF/qKu9inmj3RT/tOx34qEcYkv3wWBqnAaG2srCocuhmec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4835
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

On Thu, Feb 01, 2024 at 11:30:49PM -0800, John.C.Harrison@Intel.com wrote:
>From: John Harrison <John.C.Harrison@Intel.com>
>
>API compatibility version: 1.8.2
>
>Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

once this passes CI and those firmware blobs are available in
linux-firmware repo,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index d3f0fe2101a7..d896c98dd0bb 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -103,14 +103,14 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>-	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 7, 0))	\
>-	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 5, 0))	\
>-	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 5, 0))	\
>-	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>-	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 5, 0))	\
>-	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>-	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))	\
>-	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 5, 0))
>+	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
>+	fw_def(DG2,		major_ver(i915,	guc,	dg2,	70, 19, 2))	\
>+	fw_def(DG1,		major_ver(i915,	guc,	dg1,	70, 19, 2))	\
>+	fw_def(ALDERLAKE_N,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>+	fw_def(ALDERLAKE_P,	major_ver(i915,	guc,	adlp,	70, 19, 2))	\
>+	fw_def(ALDERLAKE_S,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>+	fw_def(ROCKETLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))	\
>+	fw_def(TIGERLAKE,	major_ver(i915,	guc,	tgl,	70, 19, 2))
>
> #define XE_HUC_FIRMWARE_DEFS(fw_def, mmp_ver, no_ver)		\
> 	fw_def(METEORLAKE,	no_ver(i915,	huc_gsc,	mtl))		\
>-- 
>2.43.0
>
