Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62435C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 15:34:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C210E882;
	Thu,  3 Jul 2025 15:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PO1hIz2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A94510E882
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751556847; x=1783092847;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kv4ynDDghliuAay2lCVPu8ehTJ2BwZdGfEzCDF2UHK8=;
 b=PO1hIz2f/3wpE3vadiNUooF2ri7Cye90ve1QFTT3Bc+3n1COS/g2Px8v
 MCzPtdA6U7hLbY0eDRR1TVx4QYEtrvd/6sNOJ6P+O9UsRPy19Xkh/a2iV
 64QDGhJhVHK7+0h8JRhyAf4tpmbAZFCqT3cHJAjUUVdLjZ9C5c5fW8Wiq
 NYJrtYlI/pujdg5q3yeqMDjTjsFRpWNzJMdkp8L/nDx6SNjxLGdwhwzH3
 BjDtkpxYi5PrhLZEBxlOfaIM9wUaW8rfmVqiPukXiHVMf7kuCVw7N64eC
 D6Op0EMZcazkgk1O4fSZ9LaDDIi+bv4tmRsqZ86U6ejIApuTDo71Lr5j0 Q==;
X-CSE-ConnectionGUID: 2avC7QYfRriPSzNnyk4EhA==
X-CSE-MsgGUID: QD/7U5FrT6WYhlyGLFQvJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54028945"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="54028945"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:34:07 -0700
X-CSE-ConnectionGUID: sTKCQxfITai61Gn7csQ2Ug==
X-CSE-MsgGUID: xGJYCnPaQg+tqgbteZmRQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; d="scan'208";a="154969343"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 08:34:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:34:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 08:34:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 08:34:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EslMJAoB5aTiCRa7Jfp5UdcKCzOTzP6eYu/EVJOSLWd+1ub0PH1uVFuLVdwVrTdKszRrlt8FHqRFYC1URy1TT5WmpzUZxAZsgjPfNzEgPcCbxMit0PpzMptWRjCNNCW9Qer88vp0By6trHO06yrbJje8loc3M53k4QhXqpiJjY4u1wXk5aVIJholCiRDXfJmDruaIvebCmzQY8LH5ZFeVef75ZOQzQZZdxYqXTK4lh7PiR6YpL1plMDrbojXxgUrB3jgywKpDobRDFRvRUM4YUX3PREstWmVEyAgLVz0tpuSdcZqGwg5hGE+F8lzOHmJFmjPdItELZwD1FavygWNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzccyXrxmtHXG1sVdUq3c74kA4ii4dzed8X5lVOvpPo=;
 b=w6utRO7NgrOsQYFXI8lKcs8oU6AK2HClW2QqUyq9XFn8Y7fJirvZWZAA1Zr4ZQ6wFktetcdNavnyYR9z9ltLOdT0ng0ANhBm2mThL1v7ZK8yG1vPDfqjv8QrsKHbmZ4AHyKQSxmyiAPDbjg8lvC9QX3cjpsJnjDZP9RQ0Cb5s6tU09LEljBPFPJaoICa5KL40MiEb56BtlbHtkdMvSsSnG7FaDgZAhcZKsoh2gA1R3/+9gWBy+RH4ZjnBg3D6+cjGB4LYnpjqGmTqTuPaYjyS35hnXVkAqxxl+HQ8KHRMdyPxVO4Mc5rTxIq+nf0MaO+2ABduzz5xJklRGEKNb/Xjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 15:34:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 15:34:02 +0000
Date: Thu, 3 Jul 2025 08:35:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe: Remove unused code in
 devcoredump_snapshot()
Message-ID: <aGajUCWLlJ1veMOR@lstrano-desk.jf.intel.com>
References: <20250703062024.3441918-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-4-shuicheng.lin@intel.com>
 <20250703074105.3461107-5-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250703074105.3461107-5-shuicheng.lin@intel.com>
X-ClientProxiedBy: MW4PR03CA0260.namprd03.prod.outlook.com
 (2603:10b6:303:b4::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: 0595e858-f2eb-47c7-a768-08ddba4709b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wx9Px0GP/mnblEpW5a7hZEZoGC8AIJrsAme1MR722OvZlGxvET2T4E5Bf9hr?=
 =?us-ascii?Q?vvtwC43YupXzooaNCJS2k6dzVW7dsCi26loGrSw2wPFXvoUdlVoey4bC7sFm?=
 =?us-ascii?Q?6KJW1hWZTWkZ0X6eyEnRiZXGFvb15iTYKLDwh4h1epWtX00ltKBka2CUwP/d?=
 =?us-ascii?Q?hzGkYDIC0hJOw22HaQlv2LbDA9aHltw9JKClFUX9Z9GJ4euleHc1ieor3llI?=
 =?us-ascii?Q?pBH2hC8ZKTzhjxfc8BsH0l1inXMZWwFhX+bIwSolg/bAd0IuEU8RYBN42jz7?=
 =?us-ascii?Q?Ov1nRmFXOGplkKFS1hFIPINer1ADQanvot7ig7uQQfVwQ0fpD2baPHzOLnGy?=
 =?us-ascii?Q?p8/uQfSiVHed1qlkUh0gjZbrRq8ZxBlrMpNqjsDyB/wLdKknmGkFlMNeQGzp?=
 =?us-ascii?Q?ZeRuIxFe19M/a2vX0tUp9xrKAXvmvl3IcTKO15jBA57y+geOF3ik06RqkPV8?=
 =?us-ascii?Q?E3c3bbEPmOkBg4l5DGxnR9Tj63rBUazBr9UXWvWeYawkV0rYO530egPV2Eow?=
 =?us-ascii?Q?/P/XWSRe7JcBFGD8On3N5yh57w9MFzylCQfLDeB9U05jXvGlYivDn7+X+81T?=
 =?us-ascii?Q?HmpLuXqFcMrNayT6zaLVwCuPxkt7rpESEIy/8dX9PGJ0FyA0ARKZo8M4W4PW?=
 =?us-ascii?Q?jrvowObDUvy4+Tt0AfP2h35bVOha7/dj3xrK7W6D5sKqJqcHEIPnu5caF4bw?=
 =?us-ascii?Q?Ra3hDnDjZc3ARWu13rJekoRq1zO8o2ipOko1jdcdSQAoEyUPwXw97awYM8RO?=
 =?us-ascii?Q?YCwFeqwNUq6eLAwLA9clV6i+6PK0+a5PyykMHzwcAiAN2Q1RxWBQWaHzoIRd?=
 =?us-ascii?Q?1Ndx7+2d8Z0N4ux/aWM8r6BrMu+MW3QLZswSC0cwqc62rzL3IMvECV4v8v1x?=
 =?us-ascii?Q?ziichCKKPmxATKnleNe6G20hrKjj6AGcf3EJv8xcgIU17QUlCNrAfbHq5VgE?=
 =?us-ascii?Q?OdEMCktoTukwKNX+WQr1sgnfIkJyExrIJimHuM7kNF5YHq/XJjjlelTjBirp?=
 =?us-ascii?Q?0tcX5E6rgYmDUecn8eaZ+xSHom2/18//UdU5JymuqsqjdpNluCaM1aoq+iHE?=
 =?us-ascii?Q?wKgb7huI7wjUL5NcSMr0RlBVt87pNMF7+dN03Ut2mdEgeM8KGOWHM/FPoK4W?=
 =?us-ascii?Q?sVvFXX7dRUkkLXLcwgrnINJNhXP3gSzl+jn5iuipCe7qX/8wDFM2SSeX679J?=
 =?us-ascii?Q?yUTLGjqxlV9874ih5vXc/mFlXYi0Htm1N5gWPgGebqhNbHscLxBjnDdIUxN+?=
 =?us-ascii?Q?m/ZakZ7VtOR3yDIYQqc8KgmB2VXc1LhdZlpZxJGQZLyJ9oJJO7rskTurxrHX?=
 =?us-ascii?Q?j7d+KtuO3VB2u97DTkVQHWfAF2EFbhWRHbv7WoVhRw2Osmv3jr1hUe96jF94?=
 =?us-ascii?Q?ntJ3iMm3uH512sGA6nWqjhnp0gzU8+nWsV3QoOVA0cOxtLse6CMVEVBh8gp8?=
 =?us-ascii?Q?Ucx+o8goWUY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l2+g3rHI2PeuN8/JCOcpXnEIt+NE07/ZHNjs7+y5J+5y/no68707w3+TWZEg?=
 =?us-ascii?Q?hCst4tPUVt2IGuqJhcP4ijBpGeocL+sWe0jeqWp3TiSlJEPkphak7xH9Xm4B?=
 =?us-ascii?Q?L+Xd3LdnfC6yOh6IYKkm9l+RTiMLePnPWVRDVM7umDZqV91a//2yB3lThnyp?=
 =?us-ascii?Q?CbmLMP8sDfwLxHTFNWDy5GNcTtPkH0PR0Atj3D8EikIqWKwFvxu4V51EMelT?=
 =?us-ascii?Q?KBybJabqzhfQyEgVApN9isVEZYTlbr1MHXsiJTYNL0OcCP6tKwl9wT8bQl73?=
 =?us-ascii?Q?B8sVxM0E74J2b4tML/4CwxzsV6YcPVf3/0GVPm8c/RGbm7kI5lqlRK0LYx7O?=
 =?us-ascii?Q?xj2gma/iKfWs0JHutHdUOWis+Uw1rz7TC11SDSX+hl6xhnvR71t2TAcYGrf8?=
 =?us-ascii?Q?pBp3ABfwhERCuC73A/sXpv+2KfePzTln1PkRY3nDbrtY2huo3piD147Dpkh5?=
 =?us-ascii?Q?ULey1GaLoFf98ZHmZAZP1NvzZdOk/sUt3XfxVH4XbdBwNzMdhpTYJryUHqqm?=
 =?us-ascii?Q?g+hhiQZDwno2++LiRvpZNV05y2zVU9FxmfdNTfwxj3FOllXau6/qbWV07skb?=
 =?us-ascii?Q?Y4i4+XGJg06Sp4oI4YCYiNs9RixxJ/BfJNcxzhhowo/Ntknv676B5kL5hlpy?=
 =?us-ascii?Q?ZlJiVc5UvODnnDSEqSOSI2IZbNL0HFx8c+utTAB12sdahowr0I+080pOE/fy?=
 =?us-ascii?Q?wVQIWWDYRVu/NIUiRa1rPOQKBpWV3D6gvZpJwgV8VuLSanXRZ+IgN+izldYO?=
 =?us-ascii?Q?+oHiw3++5+d/56tapIcMTiDbVLVPc2ceraWjtSxlMEcSP/RoZrULYBK1OocL?=
 =?us-ascii?Q?SBn3ZP96xHZtVym7n46c6bIxeCoNoCnE8fb5H3g0Yz7LqmNCxL7MXxWBf3vs?=
 =?us-ascii?Q?VgZ51PWYvaA7wkMAKDtH1Wi9QxjAn+BgcxGwZeceAIiLYO72BHpuGCzKM32b?=
 =?us-ascii?Q?jpMqh8SdWACnhQviuNsQqOaMAV7oNb/lCMRg1+7rllaV6JArLigXtDTTy3W1?=
 =?us-ascii?Q?Ha4a2I2mAZoMGzzKUBkJ0ULQ7I6OsSqHK/BW4UNaQIVajdTWux2qZCW/hfY2?=
 =?us-ascii?Q?DWfgKf4zgGIPRKpGjSe/U6qj9yFCpOT4+dpsCkFsQ5ZVkgbWJwajONopnRg/?=
 =?us-ascii?Q?s5W2THGRbxxObvkOSfPlxl82hjZMbi+XoLFltFH8Q3xSyOeT1UxwhIiixcCj?=
 =?us-ascii?Q?biQCBFpetC6PyqNfUi6wvgwwIJK89oAmH9/W3r+LdnAImH63JEb9ZWyyA+8X?=
 =?us-ascii?Q?/BkuCUeniUbqkKaxuIXOEup5YlO+wcIEJGPUApyYzYlUpvDMqmbQZCrDhWqS?=
 =?us-ascii?Q?CJYB9Zbqls3fgIaaJMctaVdoJpck83YUBJiCBxtFqip1QNSCtk3QCLgv9ksf?=
 =?us-ascii?Q?irX18uldIGy6D73HrTXSf1L4jzjOK3dqsDLCRnMwQ9YycPTb/FDoqY5Q/2nM?=
 =?us-ascii?Q?curFAMnEZYEA/0Aof5c8HpfnZ1ocPnFxP717Bv/5kGG7wwBSy2QpRCV8iQYl?=
 =?us-ascii?Q?5+2JlyFf9DYnFIf8BKIJB1gH2dMO2ewQ6oYsOPLgJqFp3Ad8CS4YNCyGWQgZ?=
 =?us-ascii?Q?RwO5tyl5VQZRPop79EuQEas9jZ/vGiCvgWZhKTTnpTzt4zqy/QRFl+0Hk0Hy?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0595e858-f2eb-47c7-a768-08ddba4709b3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 15:34:02.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eAXnreayz36Tt8y2+1JU3MauUa4motkQCiqpetqhOZReA6a6TePQCovruYaVdZ/mpif3XJAo0gAvozieNyIyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
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

On Thu, Jul 03, 2025 at 07:41:07AM +0000, Shuicheng Lin wrote:
> The deleted code is no longer needed bacause patch ecb633646391("drm/xe/guc: Plumb GuC-capture
> into dev coredump") has removed the related usage code.
> Remove the code to tidy up the function.
> 
> Cc: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 7a8af2311318..94625010abc4 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -313,13 +313,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  {
>  	struct xe_devcoredump_snapshot *ss = &coredump->snapshot;
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> -	u32 adj_logical_mask = q->logical_mask;
> -	u32 width_mask = (0x1 << q->width) - 1;
>  	const char *process_name = "no process";
> -
>  	unsigned int fw_ref;
>  	bool cookie;
> -	int i;
>  
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
> @@ -335,14 +331,6 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	INIT_WORK(&ss->work, xe_devcoredump_deferred_snap_work);
>  
>  	cookie = dma_fence_begin_signalling();
> -	for (i = 0; q->width > 1 && i < XE_HW_ENGINE_MAX_INSTANCE;) {
> -		if (adj_logical_mask & BIT(i)) {
> -			adj_logical_mask |= width_mask << i;
> -			i += q->width;
> -		} else {
> -			++i;
> -		}
> -	}
>  
>  	/* keep going if fw fails as we still want to save the memory and SW data */
>  	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> -- 
> 2.49.0
> 
