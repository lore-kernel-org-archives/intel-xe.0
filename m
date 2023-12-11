Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D212C4167D
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 21:24:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B4610E507;
	Mon, 11 Dec 2023 21:24:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA72B10E507
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 21:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702329880; x=1733865880;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=hrIxzusv7QlE7K4WjDnq+cFLG445KBJgDhmRtnkewp8=;
 b=CVU2cysyNydOURtq6UMJQYoMtqhRczeZ7T247gijtZH8hiZujUy7goFy
 wQDZZPmzRQl106YrKV9aFhC7VXN9/GurgzCHspg5J812ZUiug1fcx56VF
 yorscZEomjjAJwBqdgplnoQW9++kws3TUBdzJCTiPGidU4d+lmoSQq0dB
 NusU5+xaoE0yYydtW6OB6qrT6R09Rhq4WVElZXNTq4VYA4fWr3etV6suH
 pn5hroZOPdNtghcQTKguGZ0F0sB/F6S+jZPA5FYsQmqxYEAv/0SZCILkf
 0rpyYBPv8kI179kbJA+ewNNiulEzespoGaNN8eM1ZgzfcgnBd6B55HK6D w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="459023761"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="459023761"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 13:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="722961152"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; d="scan'208";a="722961152"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 13:24:40 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:24:40 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 13:24:39 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 13:24:39 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 13:24:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ua2Bu9lj2UBBN3X2BF2Pxlf60g8R3e+lVgX9MayVbxK2K3feDwiQTZNGAfWpr5WvmgIP44MytzfttwFnYwYyakNj+dn/X8leVlkBJaA3kE7rRNvPMrOMyaa015CqF8JAMVXOxmQj+mnAcyDGW4svFBaqMbkdc3cRJ8eF8+LBm7xY74j6DsXtNNEFUWl2nmnjADDAY4Old9c9NPcRQBmdHgWyxcBMKU24Rxy7+VPJI+xppw+gA0o72PPvrqtXPhtqf01ul45XXPA6skgu8Zqi5JYBsUvMFTDGEJOlvSAv4FwWuakuyRP/u0ToFn1dSqd8A0uvUog4CR1KpE3XmwNknQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJ96qBvNHwciVZA5kv0Nw0tCuuroB7PbqA30f4O+AZA=;
 b=gVhFBv+azgpuD6ivsNtrz5vUEAecR7swMso/GADBAr2bbktfAqidvUfxNMgFvylFwX7Ygsa2wu1yFj6SuT9U48xvN87309BxtU0MEhAuhfZGbUsOf6Kp85TeATfR8W/0Cv2iGh3tr3PK3klbyofxNpper35pxdUjnVi7k5aZi1TBisAku5D82D1coRSd/CDlSrwZFdvy29eM+qTg7C7u9Dzqd6fwOwictdTvdRSG3kuWB0EaPUYeL1UlelYLd+xL2KQ81fi1CjQmp4g0dEVWK2Pohjxi2avMbPtI1J7vo6a5FG2cBtFeisK180maWL1lUjtj7tPdaLo83c6RMnp2xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4903.namprd11.prod.outlook.com (2603:10b6:510:36::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Mon, 11 Dec
 2023 21:24:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 21:24:33 +0000
Date: Mon, 11 Dec 2023 16:24:30 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use DRM_GPUVM_RESV_PROTECTED for gpuvm
Message-ID: <ZXd-Dg6Jux1a7dJY@intel.com>
References: <20231209144917.4459-1-thomas.hellstrom@linux.intel.com>
 <20231209144917.4459-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231209144917.4459-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4903:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff05b14-995a-4bb7-5ce9-08dbfa8f9189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mau9Go/PTbXVQUJmLmKcqQXUDMi8jatuT3Uwjy6WApV90/iKKGsFNabK5JqOUnCC11w1KgjW9SmI+1vxJF1EyaWrqgov7Ahs4tcBSgnp+YUry49ZGSKKzzE9/HNsDXejgmCTKQrO2kZ1nhEnySDTj0XNNw3PXaDh6Su6yMDJP/CHOquP5IgRne3DS68vg8GvRS6XOpSh6hxB1LrnMYBVAFWN6bth4KXnl/p8dK5wLETCQdLYR61oips2Fft8qCdoOYJ6788wSxp+Cz8695nDIwVnZyLyxEP/NtT96tRrdtdWBnSpIcGRouAI05dPblI3iYKk7TXpkeuhngNEGfJ0lPRujRPW2fbf10D0r+rxrp9t3GXSjjZCLTSmw7pkzF5pIQBpTEswO775Bjo95KM0vsSU5xqjZj3dM7Z5t+MD7vD34PkHBOYBhJb65soNGYLDPZ4VnYJpNLQnZrbQ/HtKa5Rp/A59zTyALLky+Lqp00RsD5tQFExcIrjG4DLlAM8pkRMA70ViIWqM1HGGA1FWpygbu+jjWx2ETG1Kyl0aqKVCs6N0Jz5BaQHlBEUctd2cfl1N0ZA1WOIEDDq1gqBqAGg7xVq1Ga0SZRh73WU3fZ2M88s16BK6ouuphHK6XYzT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(230173577357003)(230273577357003)(1800799012)(451199024)(64100799003)(186009)(4326008)(8676002)(8936002)(44832011)(6512007)(6506007)(5660300002)(2616005)(36756003)(6916009)(66556008)(66476007)(66946007)(316002)(6486002)(478600001)(41300700001)(2906002)(82960400001)(86362001)(26005)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3qG47LXXYyM3l/8ZKj5YvCXhtBANN8ZN1gOsWPM8+YX3gYFuhB1AUTzZc0?=
 =?iso-8859-1?Q?VafsAS/iSO6CDChv0qdOggDoCEUrXnRbeDuPqbnqoLC7XIGbPm6Olq58O9?=
 =?iso-8859-1?Q?CewKEilDLv8wUj6YpqctKzgv5CngAYSJds5BMz2SyVYuDLwiwqv8MEi+U9?=
 =?iso-8859-1?Q?bPwejPFipPUifJkevA6sPfW3TxvX1o1INUjmoW2NLLcKrq3Ij7OvZvfVlk?=
 =?iso-8859-1?Q?WqdPqkgCobU/x8Kk6kmRmFz3dRKChKuU0dCPWMr1T5VF123vIILCAkA31O?=
 =?iso-8859-1?Q?wBoe9/J8APuIRFFkn307v688r5QG5IGsOU5OsB7/z51XKNjnldH0uKFwAN?=
 =?iso-8859-1?Q?mr+8BLr/U03OxlBZHJXrMC1sbyPhYvr98d8ZTd06IodPbWAkJTJ+w4k4cf?=
 =?iso-8859-1?Q?erH5mq/xRME+YZ44xeF91vaV2nddJ31f5cGzkMDXFdbk/WCzLDfIiUISZ1?=
 =?iso-8859-1?Q?WZQZYZyT9ji/mwpMwngVyWQiC0EGBEU6hMeud7+8wUrOjcNAgmCREZ15uX?=
 =?iso-8859-1?Q?CVBLl9hhI9dv9hcVo57SjC3VsRVFiH28/s1x6IlqGXCpk2UAv27qCZSw4I?=
 =?iso-8859-1?Q?D31c7n0LePh/4LTmdolYl1aXmD61qVNVhDuTrbZtVGjaUkfoIuglsgrrHr?=
 =?iso-8859-1?Q?udGNPKVn9UAMDj3AKtF3RSTL8+wJ7X42/OuSM4FWgauY1abpls6byZ3ZqY?=
 =?iso-8859-1?Q?0wo+QZaPL5ZjFxsGQ+0J5ieTwDXbbf3QQrZ1ReXl3lkGO/owQmgxOr+15x?=
 =?iso-8859-1?Q?7kIgRUgNlaBCExRImXPTcwv+T5H/MTemM59b8UVPIucnIixf4I/97lqJLJ?=
 =?iso-8859-1?Q?9k47+0mww8+hMOYLKc5j+vpUt8wSOQNV5Kzwd9jWOaxj56CDsvRMZx3xNa?=
 =?iso-8859-1?Q?rqIust3pxzO+Dv/vpdhMUNON4/ORh5JwDdCz0i0ehj00ENdJrbgrO4kOgi?=
 =?iso-8859-1?Q?ijNutNf7yctqd+5o9DFyWd19LhQxNERSHPbjaHfnHJfK9gXikaOPylAyMz?=
 =?iso-8859-1?Q?z3BBmsSO9ALFtMsMS1gECSRmfrnA8Gjokp/EclIyMPolLhTWNTBnVp7CuA?=
 =?iso-8859-1?Q?f/WkJA98ahQXqF+yaKm3SvXQysKXz81jsl+/3kkEnETxUNKJZDK4JfmslB?=
 =?iso-8859-1?Q?gR3rxOS50OdP+TF+7rfGyJ7COobcIBjPWn7UT40j0UI5OU6q+IEYllfaGX?=
 =?iso-8859-1?Q?k5xaunjs7R2Xdi9Dom+2QFS+dpmA5BlNaDRViAufdptdWmkna1msACOimy?=
 =?iso-8859-1?Q?Q+2Wv8ofpGLts/XfN5/WpEfd4NDmL1LUq3NOBswvNfzOhOyky4a2U3yjNj?=
 =?iso-8859-1?Q?CGJDEXYp85zu1eDa0sBed5nRIxkAzRyMXzdEGUb83vWczbfoGlfxJP2ES5?=
 =?iso-8859-1?Q?mGZ194JdRLMLbbDiZlf93O6Dje5KbazT9uvsUGZQjCuR6H+FJTI+7C0LOf?=
 =?iso-8859-1?Q?UVIheVzjqjOeli0qnk9FepGAVYxGhur06ty6iez3Up8IHX+ChPE4mmkhZa?=
 =?iso-8859-1?Q?wFt2shcI+h9aeoPIiG1trbBYZCj5ZXWLicJxz3TiyAAoss3g/Vw7HnRjpf?=
 =?iso-8859-1?Q?T5elYpfYl2Dbtk7fldVFabyPLdAAB/8zI9r2dz5Zz2fPa89Shdug5jCVss?=
 =?iso-8859-1?Q?1uvv23pUDNusGE4yLmSSdztfKaFMEnUqn3P6SE8w7yJUALiLWK6zByAA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff05b14-995a-4bb7-5ce9-08dbfa8f9189
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 21:24:33.4337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E6ewK4dIfO4BmJiRZOND/H4E5wfOKxGjA4LBc65X1jZywezuHpZyjTpydTbyO087WAjl1q22UrnidJTqiq+sjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4903
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sat, Dec 09, 2023 at 03:49:17PM +0100, Thomas Hellström wrote:
> Use DRM_GPUVM_RESV_PROTECTED to use corse-grained locking for the
> evict and external object list.
> Since we are already holding the relevant RESV locks, for now at least,
> we don't need the fine-grained locking.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2c35395ff5d4..c0fcb49e9137 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1231,8 +1231,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>  		goto err_no_resv;
>  	}
>  
> -	drm_gpuvm_init(&vm->gpuvm, "Xe VM", 0, &xe->drm, vm_resv_obj,
> -		       0, vm->size, 0, 0, &gpuvm_ops);
> +	drm_gpuvm_init(&vm->gpuvm, "Xe VM", DRM_GPUVM_RESV_PROTECTED, &xe->drm,
> +		       vm_resv_obj, 0, vm->size, 0, 0, &gpuvm_ops);
>  
>  	drm_gem_object_put(vm_resv_obj);
>  
> -- 
> 2.42.0
> 
