Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC8AEDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C0F10E161;
	Tue, 10 Sep 2024 18:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d2kpcNxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB8F10E161
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991567; x=1757527567;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Jn6wCIbjD/2ALEEqdiMQVrCEraMQQm+o4CL7N+CaTcI=;
 b=d2kpcNxI4chraQ213lCO39wrba02v01+NiiI+o7XUFpDno2GmEg7dF+i
 0I+KMPPMg2guoOfhb28NmqVWQ/wgFG9+Ft64rcywNt6x08c8e2aKwBPxA
 2G7WpXWE2PgldlXIpTKDc1/vIoNOFh/QAuMCM9GIyBxBAjtmst8ZElprk
 nFthJ8Vj37Wp88HlaahMDTxEXd/mEz5vytm+aP7AAyg/Tkcst96RublHj
 Mt+eJT7K4qlh90f4aE677bC3izgz2ekQZX6QlFcPO+XYNdpqOFBphxags
 hhZwqnFACxgI09DHb9mDWxVV8o8C64AlSd/kkSkbnBMSKXm8YlOfv5y+e g==;
X-CSE-ConnectionGUID: k8ePADL3REO+AqJGonzPtQ==
X-CSE-MsgGUID: 36x3CRvCQfOc1gl0G4G96g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="42277987"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="42277987"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:06:07 -0700
X-CSE-ConnectionGUID: T8w99pFaSUeLTDFB+Dnneg==
X-CSE-MsgGUID: kXU6H+NPTJeBetjNjhF7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="67123507"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:06:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:06:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:06:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:06:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjaCmteVBrNKBBa5hQoTX9LjINCTemm1HZYHQK6XEdeVqCs23a4CQnreKhezFCzpz06rTBVwhLkQvr/YOOMTKz4wdnDfpSM26hJokvJOukSm8rvUdtMKUeXeVImvKD3Q2+b+kYkSFXwID++4jRswAmm1SZPTcqaCSzJmKRNdnjTtU20brqrsmplZKuzNbPlX/FaXB8KlFxY9qQZc+r5g8tecY/23aexHxq9BEYKnQXlCp0lvKU7VqzceapdJcp/C6g3ebbYf40ftkfj092CyTDP/EWuH5f8dRFfbvBAeVdOxN37AKVt5U9Q6pOugGiTTPGViNq1Wmc574OxNG6KyGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcoiMD+Zsyo56pqUWPWuUp3Egw1Z6/9bh/kusryilD8=;
 b=aO6xg/85MRYUfIrMdzVPBKsuZRMYaBoBpd00w6b+VP+TDAYW+GshuI7s1ZZ5eAAeTD+WZW9fmiU6YnFiAdDyRinhYEaBKcgv1t3AEHn6arcdREDepMIpEGeFPcQzi3MhBI0UyuoqyMHHtfNXoVuypkhoigOQq7qAraWDpeLoLen7Q0BJPB4JaKOZzIgcY4CqbcSn9alc2WKDc49PWpKZHa4kOKUWzZpe5+CgrYDAAfF+tMKGERUBrd9roXjAmHaaRuhgF998hPs7C8qiqN8wIF7z77DyxtJujesFoEy+lj8g0nZvtlsOoExvGOrgGUGi0YDkKvQOwuw0nSJn5PfUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 18:06:00 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:06:00 +0000
Date: Tue, 10 Sep 2024 14:05:57 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 17/43] drm/xe/device: Convert register access to use
 xe_mmio
Message-ID: <ZuCKhbxv8e6gVhaD@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-62-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-62-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0116.namprd04.prod.outlook.com
 (2603:10b6:303:83::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 23931b57-ee1a-47eb-32a5-08dcd1c339f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?frciRoo3FNYzaMaSkoKiIPN0Oeqi+lXcyDVc73NOv7jrM8J49rhcmwdTmax6?=
 =?us-ascii?Q?e0BvcXuH9kC51Lfindll4tN287YK3wrE5nDdiTiUdnYfOVcuxKeZe8Nvr4N5?=
 =?us-ascii?Q?uL5isj7HcK9FI+9tgaZukUOeRkCmm6QnrhyqwqEs6ePfcp1tEPGUz0i2ljrf?=
 =?us-ascii?Q?5mriMoQOxiwDTfUo4t2Bn7vEsBNDyJjcfJz3DVQJXdi5cTHu5BrhzFs1U112?=
 =?us-ascii?Q?lCPCmxXCm+B0XS3bpYb1dJa+8TeDAsHTGCmVgVdpSDVXE36m8LMLC0Aj3G8y?=
 =?us-ascii?Q?7BJZnz7IhQHqgcv/jgUaNtlsuiDA/NU8rW8+aWLpWh+JLamI/blCOiHffG5Z?=
 =?us-ascii?Q?dQnpAzxP55SZErWkWqaSo4GcuwbqyAKkJwec6EitoEzymFBgEgboTXPXMSbK?=
 =?us-ascii?Q?mMQfeFOUOXUU2fG6AEBvFHsOtIrfJw4dBqWbtT3tsY8+ZcTuQdVNxwZvtoeo?=
 =?us-ascii?Q?wuqvV6Jyl/mYNZ6akMQZVwO7aEFcQOhmY2COg09RHeJ3Pwbwh6VEe0iCnrtk?=
 =?us-ascii?Q?IC0qDyA1zKKwBr1+eIq+0gHI3kYWLEDa6ik+bsjGvJuPoREKyiWMZSavH/pu?=
 =?us-ascii?Q?AjDmjm1Czh2nO7FFdyj54150rfiT2vHuXZwPY0Rs72qKm9X5QhykrwNSbVYK?=
 =?us-ascii?Q?jH5EYO8XvD2aMfqeEjulv3+xuwTqjQjklw+u2yLDLax9J/ZEi332uZzG18Ss?=
 =?us-ascii?Q?U6rT7uo9nroDfQcuIaFa+NpTtujVMCWJvvM74Rn80tiwI2tKfC3f6c7yUGZ7?=
 =?us-ascii?Q?dMEfl+SKI6fhvv7/pHzlrZcnVo9Lu78Ex5+Jo85vEf9hR2LZsILWtTOu5fNh?=
 =?us-ascii?Q?H8cEkhFRrfcUByaBJOFIauAZJiTaw09wx17Vex/GgLx5Gm8a8Ojvg53Hw72r?=
 =?us-ascii?Q?CKBEwTDQbVsx56R93ea0uCgKkpjYn32/CmoQWdOUskE+2eVnv5vhZQ+wMxV/?=
 =?us-ascii?Q?qINcakWGr64qUY8htSHdLz2cwlQmObjve+HqUrVMSF9f8F+UQ5H6HyZFSmht?=
 =?us-ascii?Q?2BRv347eVE0uKzYvasURA3fWALoTnIMiS29QgMULlsw9sfC/MN6/2maeoMbG?=
 =?us-ascii?Q?TOhrNGUTnZVPHA2kk+WUU+pEUPKDSSaW74bUTTVC7bxLUIvNE73x4wLqBXvc?=
 =?us-ascii?Q?Vm3Rd+hGSrz1ifTDtNQ1PdxGnnAgQUJOpmVmq5CC6DT1lmVtoBk/Nnba2WcJ?=
 =?us-ascii?Q?oIbaOISDTa2jQ6dduAh/JH4tn3OqVGUrS/Zr+BheTvB8S6n+/4k9geQN9dsO?=
 =?us-ascii?Q?eG5lGCGckVsYMuRniwDBHqvGvWkvfvLjCCZUOetA1peUfoC76SiFBjHAoBob?=
 =?us-ascii?Q?uIXjHtXasmSm1bp9diJURedc18P1ndcrttPenUg50SgLvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PJjH+2wYXvd+aFMFRTIXHqZ/4l5Oafim/aedXTh9q5GuYK4LQnOqYOoN8fAu?=
 =?us-ascii?Q?sPMEjaQyG9IEsgVTZ10RTd5+5Rb6m3rJE5ftXSyofgYH6L+TSY0jP6VQpW2w?=
 =?us-ascii?Q?xYBYpbWEsObHxaflqf/RxnCZFe4PQrmj21rJISuF0VEYWiyEYzvJXQmJL73A?=
 =?us-ascii?Q?cHXxMJiWSLuCyMdxsZyDSzauvTzn2m4sAxaKpB6OO2+WkHdPLU/URKHKOVm5?=
 =?us-ascii?Q?SE9ahbu0dpAtiip8Ha1i+fJFgHwkCEYjXutaNkpErSWd3EalJ4J7xtSEuCX/?=
 =?us-ascii?Q?/Y+zM09FxnplEQNqMdXN5fx9NrgnI9m01+oWP1B3l9l1mku6Usmz+f+InAEf?=
 =?us-ascii?Q?+Q9rkjIovxDsG0bxEq9CAkRylqC+20Ht4Xu6qB/ugYFlbOW9H6OI7VlalPyJ?=
 =?us-ascii?Q?Aopxgk+VN5EoQTxbdjjz7uiOlD2AXuIPznOdWDSPwo8RPFnZUFNmaGiR8GMS?=
 =?us-ascii?Q?OotOxbQFc5uFEWBdwvPQsD7OgDzkvFTHIIaAya0X///AlwzuSbyA1YawIqQD?=
 =?us-ascii?Q?FCJ1Q3Oa+SnfouuXKK/ytI08xVcjCGaclyBpcX2xfuatGHyWTHVt4QyHHXu3?=
 =?us-ascii?Q?CiKIgOoooNW2Q2+bH0MbDD57r9KppZj4y2VfNNoOGH1Gwz2Xib70q1YoObLU?=
 =?us-ascii?Q?nQRAiH8Vt8u63pR42z3ZD6FHL9vMrFR1zYY8pz/w8QtCZVh//alvymKhiOpy?=
 =?us-ascii?Q?1XPxBRKl1uePMlwO1tzn/nDPO3n0jFyJs1ardl8b5mPoi6E2a2R4CSn+HmPO?=
 =?us-ascii?Q?EL+VDSNBNUJWUOLbPXnCe6GoeMw3lsezyk7un7j+cxvEX5S7gvWyDGbvt8W/?=
 =?us-ascii?Q?GiFDTINjiK46DfkIo1MnA5z0zvgeByXslxaclumwU77mHVTgBXEX9HlTkvYL?=
 =?us-ascii?Q?8WdFl53Qs28nTXI9ULaLqlpfdoxYcFA8plyikBPGxEW9IzB8dDzxUlm7DP4K?=
 =?us-ascii?Q?6K9JXjUL+A20WtS+0GPJ7ir38q5GbSAUWvH3eYXQxgADTnjd2d8NyS2HHsmD?=
 =?us-ascii?Q?0t0ytYuoli9fJqx6QoDBGWEYZDFRydH8pp7r3QWSd/jbEkQqe+nUBc9kVUYF?=
 =?us-ascii?Q?d15/d8HkJ/p671pKAV1MKCD68c3T4fuu1uojdS/FEXg5PitA8L2xK8kY7Lvb?=
 =?us-ascii?Q?ie/mczs9QFzduvkwC2hDQvZBswMqHm9Kw5XZPfCfkHzD77lnJwn2XKNpPf8J?=
 =?us-ascii?Q?iIulGF8bp0ZT8ADkr7cdTOTbQ7MD9ogYZIaFC0CUFkzEbO2MoZ3uCHrhIfAl?=
 =?us-ascii?Q?ybSZaDZIOSV5+Fc6221jPpQfMXPfyErx09kQ7gqWehLmSGa9Fd2rFuvnbX9Z?=
 =?us-ascii?Q?7zDVT//8ROS2uQ/S5rt+zlmZPHwdaqGKhTbhgdrQ878+d6CFoaQnECgRLUVc?=
 =?us-ascii?Q?PZQkB0ODo74fHXsxF2w9yQOH+DtCTzfHb4LRXVEPzpDxG7+pF6+2Flg9P/xb?=
 =?us-ascii?Q?ykEKDAHOckfKHEypQ1bgpdX66qynDAttpjZvd9aMm1N4EM3H7FagLpCU8Dus?=
 =?us-ascii?Q?9xDbeIRHyRhwAjSb9fwP+JJ0Atw7aV2Ds3pnDh30e1oiYQ4+OmVLR2ze7FKU?=
 =?us-ascii?Q?8SGpdAR+eSx6eFLqvTkD5Ox+O59WM1UKF/aL3KCqLT7uJGQddQ9Ce2elA1gX?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23931b57-ee1a-47eb-32a5-08dcd1c339f3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:06:00.2971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z08AQIeOJzNGwagqKFcS9uE524917cCfCA/dJ9qluclb5mNAH2fBqkuVRTGWL9T1yByizqkOJa4eUWXpzwt/Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
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

On Fri, Sep 06, 2024 at 05:08:06PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 37 ++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 449b85035d3a..cca17422bc2a 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -399,10 +399,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  static void xe_driver_flr(struct xe_device *xe)
>  {
>  	const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a 3s wait */
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>  	int ret;
>  
> -	if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> +	if (xe_mmio_read32(mmio, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
>  		drm_info_once(&xe->drm, "BIOS Disabled Driver-FLR\n");
>  		return;
>  	}
> @@ -418,25 +418,25 @@ static void xe_driver_flr(struct xe_device *xe)
>  	 * is still pending (unless the HW is totally dead), but better to be
>  	 * safe in case something unexpected happens
>  	 */
> -	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "Driver-FLR-prepare wait for ready failed! %d\n", ret);
>  		return;
>  	}
> -	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
>  
>  	/* Trigger the actual Driver-FLR */
> -	xe_mmio_rmw32(gt, GU_CNTL, 0, DRIVERFLR);
> +	xe_mmio_rmw32(mmio, GU_CNTL, 0, DRIVERFLR);
>  
>  	/* Wait for hardware teardown to complete */
> -	ret = xe_mmio_wait32(gt, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
> +	ret = xe_mmio_wait32(mmio, GU_CNTL, DRIVERFLR, 0, flr_timeout, NULL, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "Driver-FLR-teardown wait completion failed! %d\n", ret);
>  		return;
>  	}
>  
>  	/* Wait for hardware/firmware re-init to complete */
> -	ret = xe_mmio_wait32(gt, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
> +	ret = xe_mmio_wait32(mmio, GU_DEBUG, DRIVERFLR_STATUS, DRIVERFLR_STATUS,
>  			     flr_timeout, NULL, false);
>  	if (ret) {
>  		drm_err(&xe->drm, "Driver-FLR-reinit wait completion failed! %d\n", ret);
> @@ -444,7 +444,7 @@ static void xe_driver_flr(struct xe_device *xe)
>  	}
>  
>  	/* Clear sticky completion status */
> -	xe_mmio_write32(gt, GU_DEBUG, DRIVERFLR_STATUS);
> +	xe_mmio_write32(mmio, GU_DEBUG, DRIVERFLR_STATUS);
>  }
>  
>  static void xe_driver_flr_fini(void *arg)
> @@ -487,16 +487,15 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return err;
>  }
>  
> -static bool verify_lmem_ready(struct xe_gt *gt)
> +static bool verify_lmem_ready(struct xe_device *xe)
>  {
> -	u32 val = xe_mmio_read32(gt, GU_CNTL) & LMEM_INIT;
> +	u32 val = xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT;
>  
>  	return !!val;
>  }
>  
>  static int wait_for_lmem_ready(struct xe_device *xe)
>  {
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);
>  	unsigned long timeout, start;
>  
>  	if (!IS_DGFX(xe))
> @@ -505,7 +504,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  	if (IS_SRIOV_VF(xe))
>  		return 0;
>  
> -	if (verify_lmem_ready(gt))
> +	if (verify_lmem_ready(xe))
>  		return 0;
>  
>  	drm_dbg(&xe->drm, "Waiting for lmem initialization\n");
> @@ -534,7 +533,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  
>  		msleep(20);
>  
> -	} while (!verify_lmem_ready(gt));
> +	} while (!verify_lmem_ready(xe));
>  
>  	drm_dbg(&xe->drm, "lmem ready after %ums",
>  		jiffies_to_msecs(jiffies - start));
> @@ -813,11 +812,9 @@ void xe_device_shutdown(struct xe_device *xe)
>   */
>  void xe_device_wmb(struct xe_device *xe)
>  {
> -	struct xe_gt *gt = xe_root_mmio_gt(xe);

This lmem_ready change from gt to xe should deserve a separate change.

But up to you

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> -
>  	wmb();
>  	if (IS_DGFX(xe))
> -		xe_mmio_write32(gt, VF_CAP_REG, 0);
> +		xe_mmio_write32(xe_root_tile_mmio(xe), VF_CAP_REG, 0);
>  }
>  
>  /**
> @@ -858,7 +855,7 @@ void xe_device_td_flush(struct xe_device *xe)
>  		if (xe_force_wake_get(gt_to_fw(gt), XE_FW_GT))
>  			return;
>  
> -		xe_mmio_write32(gt, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
> +		xe_mmio_write32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST);
>  		/*
>  		 * FIXME: We can likely do better here with our choice of
>  		 * timeout. Currently we just assume the worst case, i.e. 150us,
> @@ -866,7 +863,7 @@ void xe_device_td_flush(struct xe_device *xe)
>  		 * scenario on current platforms if all cache entries are
>  		 * transient and need to be flushed..
>  		 */
> -		if (xe_mmio_wait32(gt, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
> +		if (xe_mmio_wait32(&gt->mmio, XE2_TDF_CTRL, TRANSIENT_FLUSH_REQUEST, 0,
>  				   150, NULL, false))
>  			xe_gt_err_once(gt, "TD flush timeout\n");
>  
> @@ -889,9 +886,9 @@ void xe_device_l2_flush(struct xe_device *xe)
>  		return;
>  
>  	spin_lock(&gt->global_invl_lock);
> -	xe_mmio_write32(gt, XE2_GLOBAL_INVAL, 0x1);
> +	xe_mmio_write32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1);
>  
> -	if (xe_mmio_wait32(gt, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
> +	if (xe_mmio_wait32(&gt->mmio, XE2_GLOBAL_INVAL, 0x1, 0x0, 150, NULL, true))
>  		xe_gt_err_once(gt, "Global invalidation timeout\n");
>  	spin_unlock(&gt->global_invl_lock);
>  
> -- 
> 2.45.2
> 
