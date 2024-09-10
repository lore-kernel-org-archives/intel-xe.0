Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D2EDE9AB
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 18:12:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8874E10E8E5;
	Tue, 10 Sep 2024 18:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9cAMdnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8776210E8D8
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Sep 2024 18:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725991921; x=1757527921;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DuC29sn5bEwuvWAzXW56bTvgou5uwLVwvCucR2MP1IE=;
 b=e9cAMdnD2f5sYzjZuYu4OnpYQlzO7mhlqZqPqOF4gpgoq/71bKy/uLlz
 ixfMxfaHJu4GXeojPz+pt5mVv82ID7RyfJtsO9IsJbjs16fSVflCli+Ou
 T2VVTLwG48ElDKRRn2RSEGWUQD16RvN5AA5EhWXjCBq4/A9s5pjh8REzE
 QL+pBmqkSRVIXJ93UW7/b8+H13yHO5bL/Dq/dhPnGdIjgmJ6QUDWljB0D
 PdKV82+7brdRxNocMhLYkpYWP2SLzXs4jB7rPGD6QpzeWNyUohi/Z5ZYE
 BjQLeudxvfdAx6RVOV1mGsAEt3+SmcVegSCuQZ1Wud7TE+grx8yU84tkz g==;
X-CSE-ConnectionGUID: lObARJyYRHegc85tolp2Gw==
X-CSE-MsgGUID: yHC8Md9iRTO0iq10ppLeMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28539537"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="28539537"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 11:12:01 -0700
X-CSE-ConnectionGUID: nvvdvFg8SMeRW2Hqj0T8Rw==
X-CSE-MsgGUID: JOQ9ktF9TPGQnBfJwHjy8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="97943594"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 11:12:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:12:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 11:11:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 11:11:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsZEz7PZuJ5q+uQnwWYOEkrmy2Teiwjc78mGvDxZfad+bBAKDXzi8Xqn5tpKdjne4rm8fXcfYYhBDV+sFxKOQbYEDcuKzaFYp2ey3YbrzM2mBaNd7HDnX4GIXBl3iYQ66po/H1aIT4oc46iySqC01aMGSNqJ9nn5ueZlU/44KghEQ4BCKwczzGdwxpd41vZYEVOeXzqO75irPq2ZyclYTE6LkiMmWagxO9spd4/gCHF48tU6uJ1OJ+p3zjQyY/C9ymKoddg6BGi1YWZ7hyRSmqiw6fXWKTzl5VO9DGcN+0ozWA03xYCzaV+Di0PAvb8L6rqWnMPj7KLqQVY6uJ+l/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjGnr9pwGqi+w+F/iispyHfBdC0RbTHnfpSGK2ut/0A=;
 b=DFmGyCHJsartWXTcT/zNxxL4kJ4gb6Y+FiNVN4Z6t3EpYOysiMoazFigh5Z/6F6R1YRXzJECdP1vKU6iMnMW4nUVi1Ftb4d80BCTt0RnMh4Z+76h2Wt0Rpk1dP8wSoYVr/a4jV8YFIxJVc/Ha9+zqNhRy3pqbPXCcovfx9YEsSeGkLkuoOWNKB9HH37SgO6EvEjLqY6ML6PVQVFnBzLcSaWkRItNxlXginDuaUGYcwLywi1MKP4pHBk58JvePz/rbaWMFWsshpL8Lmt8gRlrzPDo/O8ZgDR4CHachw3VLa42c/3mQqPaUXR1wBSGVRxfDhxqcnHzwtzwOq12lsnwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Tue, 10 Sep
 2024 18:11:50 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Tue, 10 Sep 2024
 18:11:50 +0000
Date: Tue, 10 Sep 2024 14:11:48 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 32/43] drm/xe/topology: Convert register access to use
 xe_mmio
Message-ID: <ZuCL5GoI6BBJ3-dE@intel.com>
References: <20240907000748.2614020-45-matthew.d.roper@intel.com>
 <20240907000748.2614020-77-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240907000748.2614020-77-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB5984:EE_
X-MS-Office365-Filtering-Correlation-Id: 148de7e7-4771-4400-95f0-08dcd1c40ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8KRIL6b83cdi+GvE2QXTuaEUjMELjEZxPWBJOaIiqVC3gpa4+bkGRzyetIWn?=
 =?us-ascii?Q?Diz/JGXIFjjaE3sH7gGdAuPTfrB0GcV3rWARcH0xvEsaW4TxaWHguz97Gezn?=
 =?us-ascii?Q?Lverovxi5qS7IZb+K4psMJEvYGS/ESwmxJo+UHirStdQD6YMFQTGpfDn2nP1?=
 =?us-ascii?Q?whpzOWcTBN5o/KoOK8DzsmkTZun6DOBmJL2MCuAUICkBI8vkB83T98fk0Lsj?=
 =?us-ascii?Q?hvaFLjwWNN0L1nviPdnUhqSCBZUlG3ihYnfZvNO5vgMc37YXpBMWz/n+lO6w?=
 =?us-ascii?Q?35R5nKw/UID//JJzs55lirn/3gr259niVTjOPQHHyXSmHuyjiHrH1Mryx+pU?=
 =?us-ascii?Q?urNGzR/3J6MXZ3f+VrFM2Rio046qtmCj+eM5QOFwFiWUIHth/BtLZTzt29aQ?=
 =?us-ascii?Q?D7A0pgsp9bFQDCeESX8WkmhBma/Xq3uW/ZVVb9yslNMmCyRQyKkF8VgdT35A?=
 =?us-ascii?Q?DxdUIH81vJ41wBKa5h51r3YVhMcvubGMGRTDpi40U5T0qrz35HMnRGRo2jPP?=
 =?us-ascii?Q?T/mqnci6+oFxxOkMnRHwbcTyrYBTkTJL8SfHw8yVzdEvy5B2WowQ4P9N+8+v?=
 =?us-ascii?Q?I3eN1XfQMFP+A6+qPH6evzhXeoB9YGK2irkI9LkN0wDdQkaZDR1FZthADu4h?=
 =?us-ascii?Q?83PS6B4g+zCIKMCwX7N0uQw/PXiY7ShQkjlri3enIFMjo+0YAuvM8wydqStH?=
 =?us-ascii?Q?BHNsxoVjDENmdgFxXts2rJC2y3o+orEqUyhIwxTGmAAtEhLmNqfpLENQw1aF?=
 =?us-ascii?Q?AJYxYpIewuY0vXkxUMAfDGs6cSqkx/cjrH6FsnnJu+ITLYfb3gkTbfzq6ykR?=
 =?us-ascii?Q?vcmofsAL26li4zbSr+kR50pbzu1OhhJZpBfhXv9+5rRpz//uSFzACkWzXmfY?=
 =?us-ascii?Q?wRshCobA1lq1zujtJeU3rpRp3ISw1WkCbmF74tg6cEuydIX/XBNiEFKo/kOL?=
 =?us-ascii?Q?Gq+4A4jR32HstZtbz86nEyeGnDzhGdolrrwh0q6EKN1LI97FJqU/YueBDSaL?=
 =?us-ascii?Q?D14zlBCvMB3T1i6x+xIvxGSxCnLv9xcarus82Xfw8Ch27WFimwFFPFF6+HWV?=
 =?us-ascii?Q?JOJzVoyNYDeitZz0IJFstQWG/L/cuDc1pHD3aZKd9sAKlNft6Hy1C46Tdeqh?=
 =?us-ascii?Q?CzDY+02XOHXy7IbyK7UC65fXk+HmYnao9QN6uqBG3srSFs9O4LhrNIU2hCHD?=
 =?us-ascii?Q?8CvdsHsIpXmoBDrZClROvhGj5RZIg+9w1+OKKIojmGGv5EKu7I6yZnLYU59b?=
 =?us-ascii?Q?DU4VcftwrOLfPYeR5r/mqA0LhkUSUkwjZjMGhwXlPJk5RoRQ1ZypIJ0AYomc?=
 =?us-ascii?Q?HAF6G40J8JW4TYQ1KgskJ0G9G6+qbeh5nRC7/NChNTi1OA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cEQpToFTh8Sdo2j/8MzA1gOFRSAvJjgqo71WhBfG254hK+1jt6jtFiXUURy?=
 =?us-ascii?Q?MGxbyGduCddVKo1ODNNwuL8q3jXKh4F4eYrIWzYZRXwaw3eyFCJJhVnwbi79?=
 =?us-ascii?Q?10S5RZJlvDCti0wstzSddNMirj4E+dsa5ENssqjcsM5F7PDQ6M52TK6oIb92?=
 =?us-ascii?Q?+BnVBxIPA9btmflpMXZg3o9e7E9dgBWAZXIqUj10VKAIwjJ4sYy5xVYHnqSG?=
 =?us-ascii?Q?BCRPiG6ooux17PHf8fjGZ8RvjxfvXcl2l/VhuD8BlAIWGLEn7Emg7rSsZbVs?=
 =?us-ascii?Q?q0MItIoUb/TdBcgiwkTJ7SH1ATI2ebGZNw2dLpoW48E0FiR8RM0t3C4BWCQa?=
 =?us-ascii?Q?d3wWWpHFpUif9IUdV2G/GPx7OXiv6tBzybtt5P98Q6blV7ZwD+Vnf5kF19r8?=
 =?us-ascii?Q?xF2oSftd3f8zuvjJAajCKHwnhWtqYsu5KB4Rr7F9kND6etpMm+8FEOznR6Zo?=
 =?us-ascii?Q?mPa5TEBcO4CgQsXZUarULoqhwOB7FOVY4to0d1ZA0iaASam5BLfgJD6MJ1T1?=
 =?us-ascii?Q?cOtqfyz0at03DusRmi0bYlUC7EYNnHYHQ8qepvPOpmOdM8uj1ZHwHc1Jp4Rr?=
 =?us-ascii?Q?prg1s1ttWnPcggJpLmFr4CGpflhSPsf2pHH8U1aZKrrLZC2X7pfBC+ioj8tO?=
 =?us-ascii?Q?kcZa7NeFhVjUDZ0F9FNO69FK90bZ0fhygcVsUZdEtEBk/SAyhdRJdi7cG8m8?=
 =?us-ascii?Q?NlZ74Ar8vVIRHMdVcEp9a+gT0d7ij1lKWli64A4Cf/60ND0bc1u1nacZdUiy?=
 =?us-ascii?Q?0LJAtYWp2EyyC4YQqvmtY39o9IOI8tv83C/S+PPMKeFaZ5Upkae+JhDin0yd?=
 =?us-ascii?Q?NhD50TCatIRkk+IeL2KxHmzdaTuazUCg2F0dxHA4N0S0BFzcIkgHonsf7Yxw?=
 =?us-ascii?Q?Gu4QjuosgmdcbffEgj87nLsmipRLWj9MAbbbYmodpYr9l1wcSsmx/afL3Tdu?=
 =?us-ascii?Q?rbeX/4IZIz/JbiIi4Fmc3pQ1uq7jE30vgCnaFcoSsCHV+/aYwU4IdHIqKyux?=
 =?us-ascii?Q?cWk3/zpl890xJMHHy2utT67CpTrUSZOHG34WnvYrV8LATJQE2z19WQ+yhK0B?=
 =?us-ascii?Q?Dqd9h/5NfpWSXVzgHlBhS4rgxzvZZ0JFo5zW2lDPfXd9Gl4WAtkxhLh00Qbx?=
 =?us-ascii?Q?BTATF7AzXCsCNaHm4jJ7+yJ/SP7cvr7QPBZ1JjPaxVigYaHyK1Q3ofCSaR4y?=
 =?us-ascii?Q?1HKhj6FF4QPSgB/U4QHKstpUYIA62S+qJRqk2cRet0T2bw6taPgYDbHIFeqk?=
 =?us-ascii?Q?L/vtqI9W60PzkXvtyFi6eFmjeBi7HBEq5f/658IeihmJIXJ2F4BiuC+igPsq?=
 =?us-ascii?Q?LM4e+nCQDjxS2+dfoz9v55+vp6Hyw2QAAyR4T9kXTa7V5xi+MIHRF06NUfor?=
 =?us-ascii?Q?luc/8pbn0ZK+LTs0Jc0Lv8X9H+18VIkKC/ZcR25KYGHLrdvohlNBgJyiK81P?=
 =?us-ascii?Q?ZTsur8F0dpH0G+9Vb4b9SN6hrkx7sQHtm8uPiMCbQzN0K0iERNyzsGH9kBzr?=
 =?us-ascii?Q?XujaPeZoVIyjJObER3eJJU9fNq7k2jfAfydiMVvdJcATlQuQOw+zW3lOFvs7?=
 =?us-ascii?Q?g0s0xlWxtoI/o6IajHnySvXLUJRaS8kuJXn1EQ1oXHssO5UKhOuQ1FR1G9dE?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 148de7e7-4771-4400-95f0-08dcd1c40ae2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 18:11:50.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYameaebMI8xmKr0ZOwy2Ihy/t+9FC22L34A6PTSt8y/Yh6xtxRlpv3szo7tTDHmZRC8qAyJHFmY7U9sRhnsbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

On Fri, Sep 06, 2024 at 05:08:21PM -0700, Matt Roper wrote:
> Stop using GT pointers for register access.
> 

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_topology.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index 0662f71c6ede..651ba53623e5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -25,7 +25,7 @@ load_dss_mask(struct xe_gt *gt, xe_dss_mask_t mask, int numregs, ...)
>  
>  	va_start(argp, numregs);
>  	for (i = 0; i < numregs; i++)
> -		fuse_val[i] = xe_mmio_read32(gt, va_arg(argp, struct xe_reg));
> +		fuse_val[i] = xe_mmio_read32(&gt->mmio, va_arg(argp, struct xe_reg));
>  	va_end(argp);
>  
>  	bitmap_from_arr32(mask, fuse_val, numregs * 32);
> @@ -35,7 +35,7 @@ static void
>  load_eu_mask(struct xe_gt *gt, xe_eu_mask_t mask, enum xe_gt_eu_type *eu_type)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 reg_val = xe_mmio_read32(gt, XELP_EU_ENABLE);
> +	u32 reg_val = xe_mmio_read32(&gt->mmio, XELP_EU_ENABLE);
>  	u32 val = 0;
>  	int i;
>  
> @@ -127,7 +127,7 @@ static void
>  load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	u32 fuse3 = xe_mmio_read32(gt, MIRROR_FUSE3);
> +	u32 fuse3 = xe_mmio_read32(&gt->mmio, MIRROR_FUSE3);
>  
>  	if (GRAPHICS_VER(xe) >= 20) {
>  		xe_l3_bank_mask_t per_node = {};
> @@ -141,7 +141,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
>  		xe_l3_bank_mask_t per_node = {};
>  		xe_l3_bank_mask_t per_mask_bit = {};
>  		u32 meml3_en = REG_FIELD_GET(MEML3_EN_MASK, fuse3);
> -		u32 fuse4 = xe_mmio_read32(gt, XEHP_FUSE4);
> +		u32 fuse4 = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
>  		u32 bank_val = REG_FIELD_GET(GT_L3_EXC_MASK, fuse4);
>  
>  		bitmap_set_value8(per_mask_bit, 0x3, 0);
> -- 
> 2.45.2
> 
