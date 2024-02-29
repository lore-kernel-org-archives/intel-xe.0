Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D720EC54798
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 21:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B31610E633;
	Thu, 29 Feb 2024 21:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abdAR9QW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65DA10E635
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 21:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709241831; x=1740777831;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=y58SVjakF/w/UMkhDzdR7jKc9YP4PJyefxHSF1ZPd+E=;
 b=abdAR9QWrSVLVzFlirJzMjjn8RWE/gNv82EmJHrLzvD7w7E1Orglt4c7
 oLNnv5vrSEBBqaGxuENhLIZs2X45VTuRV8irZ6LElqW+I22zyifGWBInO
 RhwJo+0hmLhCnJjcAfNjgNCQhffTnhrpOGlXCP2AOOEG4xPTZsrEkpaDg
 gWmkuqp5fDAiEGKR/dAqpn6Rq0FeJNIs/iz/ovZdezRVRmc/cqDKRO4l2
 cRY9VwP6UOaRVL17ceSktJ8S1RJBZu4fqdJ0H/AK+and+kquuBc8RbS8g
 bRUZYG3Kegtenb/cKsB4s3iQfy01aqLGSegc6LAm/y4GduCYzJm5IHJzr g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="29177379"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="29177379"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 13:22:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; d="scan'208";a="12649155"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 13:22:57 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:22:56 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 13:22:56 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 13:22:56 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 13:22:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWj60Xc+0eaZn+XQ3SkeVJsNp9keKKPO0/usbIpNOV3WAnK2bmoKTx5eZWd0i5GS1dyLUNkD3pUZBWPv91+bjQl1KVRqqgkvdFriNKym+oN4MXlXq4bXYdj35tSYxCEPuh7h5LQCt4vt28XcuX2hkn19W3PNCNgnhmPZ6w2Gly77i4QAlHRgZa+66YiuR/aSP30lQ/nBKi9zU/NQS92p7VcuHhSR8pPw0qNaMYmbCpIvWRnm8xI28URhLs0pKiKBDeBIlJlAKC1X/avEU8/zwP47snx8oWM79TWLjcLmy/fILnZ1+6ESFETwOacTuGZlCOn7zocxfknhWD8yT3xPFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ewQ0Nr3dUUSIhsApabOzhREUiWbWNnR1bCoJ+EVxq30=;
 b=MlNLhlLKulQZshhE00IatGoEr2Wju/j0OA3DNH1goEoovlP63VeLn37uWlZw6dmAjsiPPOANgVOFqceIk1BuSXw/JCI5C7TIFF1GbZVbLfZQWS7buH5i7w8uzTYIpTezW5affof8gxgGTJMGAPXUt3Sm2u4X3rgoPoTvhajI3VYpYIm5bsVQoa5z1DlGv68kKRBZlA94SAqRRbKqHcWltvHk0giKueCHWXhaNbKmDrV25OxVSeQ8I7n2WsDvaAgvPS3toNM2iUGomtARDq9PhBZg9s9rmtSFzNEpXalUBxBgzJkPfexPx8iEoV+5Y2Be4wbJoVih9qACZ0MkePbICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Thu, 29 Feb
 2024 21:22:54 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 21:22:54 +0000
Date: Thu, 29 Feb 2024 13:22:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ruthuvikas Ravikumar
 <ruthuvikas.ravikumar@intel.com>
Subject: Re: [PATCH 3/5] drm/xe/mocs: Move warn/assertion up
Message-ID: <20240229212251.GQ5347@mdroper-desk1.amr.corp.intel.com>
References: <20240228061048.3661978-1-lucas.demarchi@intel.com>
 <20240228061048.3661978-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240228061048.3661978-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ2PR07CA0015.namprd07.prod.outlook.com
 (2603:10b6:a03:505::28) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a354460-b3f0-4e12-5eec-08dc396c9770
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BdGM1ozbYZH9ORlRglDlgFBN5CQF9zmBYhJrbX1AYmlx0sGKPOalMJdUHYsNhnAVmQYz+e2OMCx/t7ADKDlIQojqhIUfkCKgwbpFP54GnMYlYWlNOuPxuxE6rXjFTdElOrn7v/19b8KCZqi8+7vOX7DpF62q1njmutHSeQyJJ5CdveBPwTMsp9lR1vaoGj8zO/ZysVtSwmryXRWIRyCmlgdeOzJq2L92I5pBC2aKPNztNULQKB5nWWs7NjhCJ91mrB/OnoT4N4FuK5dm6pyGVJ0qwcyC+5q0B06rr+/F9jNI7Y2C9sEiqi+7EIH6tG6pdtCsPTbTptzZCeqbH1Y0RFR0l2PajUYYX1+Ztkrb8oPrsQxRfNrYfrq4+d2UtzvgLpJ2tyMBkB8XjJDFv0u6O43ol7E4eyZ7Yxyw244sxW7bCh3HIHLIyV31dwDnF/MiDV03Na8VSPmx+sm4DuST5J7JjC173ogh7hRcjfRXVSUsoDxzKpsbOczjZJGXOpe+MtKMAHezcUKt3b+K6kcn8fswZ4wqJb2KYqJPELhYtPa3Rho89CgOeEkf8TomWeaIFnEBr5SGo6SVKNkICCsSI5W8QLBO08A6XG1N8syg9FTGdv1LJPkEbEBnigvW0KCyn/LalAZFHM6lO10tVUOXrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CDCCULxFmz/Hhk56KS+IF4F4gCPztw9s0i2OR9UM5EaVaZg0XspehL0/+J/H?=
 =?us-ascii?Q?XcCFVTRwnrt//nWXcP7UXCpDyy5ZTwbJJ2wTEVg5MMqVP7sTfbgPZGOpeKty?=
 =?us-ascii?Q?ZSXJACFAwgObQrNNy1TVcCIlk9qFt0zJcxpBAa3VSxlm23XexgFO1uBbIV80?=
 =?us-ascii?Q?eFHc8E66T//Ov7wUehUOPpMSrXpr7NlW5EUnuvGiRKev1md8tFoOOCLuh0Hs?=
 =?us-ascii?Q?EOWE7p1GkyaMvWe0gdPKpaB36HZ/2gMkMctQF/o/4A49RekZgXHqM1n+/wXw?=
 =?us-ascii?Q?xdLyQSoEGQ7A8mZiG8w+/4fKhTAG/VeOh3ZNKNZt6F+j2BoKgCFQaxxUkU4M?=
 =?us-ascii?Q?/eZIzgTkAXUwdBwYytJLDBHvRBVobcaXdG4OEm90+giDNIqlnSost59ZK3P6?=
 =?us-ascii?Q?R+pwcRxN6snICGYlmmD2MU+7pFWC5SAgbbqygNUPe7H3kWERI+Y/SsV5W3f/?=
 =?us-ascii?Q?xEesauNAJ1+3O1XXZqTlECL1NCGHImEEFMSYMIvQBsJ/l9MwaXBfZEfJCPWR?=
 =?us-ascii?Q?IhqvgU+ywblHtlTGyfbi2/nzB2kIbZzUOevET1oz8rYRtMxUMpixodxTh4sE?=
 =?us-ascii?Q?mFajdb5L/EvDrIouhwlK1PBJg6ARGdyKpETfcI+ARt2RLVRqIZtq8+8m+s7M?=
 =?us-ascii?Q?B+lY5MNzdON1iBY1rtyYz7gyc6K/KJC0sWk+hqrQG4SbIh5dvSjxq/Arh2Ep?=
 =?us-ascii?Q?AC4bPnZU5xjtQTiNNuFuOwCQnZaYb4aRzuVsujzct2wIo3NhiZxFFAIlQTYP?=
 =?us-ascii?Q?YUyf4cAZZ7QFS9Tc0psza5nFPIWfPXVf7N0H9D4Vg5cW5+aEj6K2NeYdZPsl?=
 =?us-ascii?Q?poZrTOK5LKCR8F6SCKUM2jTAsE0cmwLKGm9g1r8kZhceSOboozq/+w2aUm1Q?=
 =?us-ascii?Q?l2o1xtP3R739HJTvQuMI1UjnYnYtNezN6cMJpCm1PEeWjuKcAPrAborADsCv?=
 =?us-ascii?Q?6qubkv0PKaoPGnuU2w8em+1q3hovpK8GRlABlV417gQ4zxwrs+kEQLJwVt4Z?=
 =?us-ascii?Q?boNlrNgaPu/1flsts/3kP/WKx3IYDQbekZOiWqR8ed2mwTw+HflUufpTY4kc?=
 =?us-ascii?Q?0VkrxH0+TCvc018crAjVWW9wHYwZUyOxEK+1RcS7eSnloDy/ooHN8/7g8/42?=
 =?us-ascii?Q?8n4mDuqHbk62m7V9c3F5+U/PoFS/XzdGJen4F076fI4gO/Q3dVkgMguzC2ru?=
 =?us-ascii?Q?+g+qiy5WA66t+ziOl3S5mq3OGYSB88yA8skN3bZZE2IiTXodaSunnUnBe4sX?=
 =?us-ascii?Q?CIEMhD3VwBO/zPJ7onVCQeG/ubsUQlocu1GHcebls64kdUfC/kQu6/I9sSCu?=
 =?us-ascii?Q?SYsESg5mFlaLAjWrWI/Pncld9aBOwflqnNB4SAsJB63DebLbisrjetgQSpGc?=
 =?us-ascii?Q?X5RZyAdU5UfQbkPAehkVQidOt0qMzfnkGF79ac07crxG+VgEzopCWY1SUq9M?=
 =?us-ascii?Q?UcACEeS0GVX7BW3/+kAQ/x5JnwovdSAM1n4kI/7bTJFB1oYsnLxI68Eq6JT/?=
 =?us-ascii?Q?VZjX2yCbrEnNrddjR4HRIcAe9seAbQmp4/unBKmGojqX2yaDd5CeOn8ncrT+?=
 =?us-ascii?Q?i8Ws8CnJo0VUiePAhGhBiwABqcRonm+2t/qtoou597jHER+webYCct9n+/Fb?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a354460-b3f0-4e12-5eec-08dc396c9770
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 21:22:54.0711 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4p4ViQatv2r9eUn8jmV0akbFSCmBUCwFHAKXMAZ1/AjOylAIqkoM5VmM4eyFc+bEnpqt0cVNHJrE8eUgiqWa6bImFPnPW0eyj48E0xKO3CU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
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

On Tue, Feb 27, 2024 at 10:10:46PM -0800, Lucas De Marchi wrote:
> The warn-once in __init_mocs_table() to make sure there's an index set
> for unused entries is more a sanity check that should be done as the
> first thing in that function. The kunit test replicates the same check,
> so also move it up and turn it into a failure condition for the test.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_mocs.c | 5 +++--
>  drivers/gpu/drm/xe/xe_mocs.c       | 4 +++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index 7c91e01c47a3a..9787546e42249 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -79,11 +79,12 @@ static void read_mocs_table(struct xe_gt *gt,
>  
>  	struct kunit *test = xe_cur_kunit();
>  
> +	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
> +			      "Unused entries index should have been defined\n");
> +
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>  	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
>  	mocs_dbg(&gt_to_xe(gt)->drm, "Global MOCS entries:%d\n", info->n_entries);
> -	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
> -		      "Unused entries index should have been defined\n");
>  
>  	for (i = 0; i < info->n_entries; i++) {
>  		mocs = get_entry_control(info, i);
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index bdb755b963238..60ab34fd213fb 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -470,9 +470,11 @@ static void __init_mocs_table(struct xe_gt *gt,
>  	unsigned int i;
>  	u32 mocs;
>  
> -	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
>  	drm_WARN_ONCE(&xe->drm, !info->unused_entries_index,
>  		      "Unused entries index should have been defined\n");
> +
> +	mocs_dbg(&gt_to_xe(gt)->drm, "mocs entries: %d\n", info->n_entries);
> +
>  	for (i = 0; i < info->n_entries; i++) {
>  		mocs = get_entry_control(info, i);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
