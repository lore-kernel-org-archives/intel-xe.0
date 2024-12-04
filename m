Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8B4E7716D
	for <intel-xe@archiver.kernel.org>; Wed,  4 Dec 2024 21:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D52D10E2B7;
	Wed,  4 Dec 2024 21:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0bvGeIg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA10B10E2B7
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Dec 2024 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733346310; x=1764882310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0ofdfKcq/zTKpwwg+Fu22vVPZUJo6fOXK3NXxBfmbl0=;
 b=Z0bvGeIgH2ZXp3dEzyEtLHwCnUKHt26Wc3qxcHmF6XbGE5gt5scJIgrI
 xP3Gdb3KzawkU3e8IFGHW2XSyivFhxa18DmlUe0vDQWQdQLq+CnnK+exD
 8iH8O/QJE8i+IBaCjfsuPz9GgPzvIw3kw70GqHUjXLs9ytehqJayGimHv
 DsM/KFy/oiVyem6JTwdY3VH3RCtw5R8tRtaSH7PDm3kEJ82LPhjNDSzSl
 2Px8H7aoMCMhEtcyxt6xtlmwZiPvPdumkDs4oebjdH++XouzK+VESGcol
 s4Xl0wZ7GNnbc1P7oVDu8+TQnLTWTkSAZ/u3rpcaKjKTHkf2coUTy997x w==;
X-CSE-ConnectionGUID: pj3RMDF1SHynqD80WUKJNw==
X-CSE-MsgGUID: ZgASvJ2vSIWVENbmD2bhRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33780987"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="33780987"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 13:05:10 -0800
X-CSE-ConnectionGUID: jZDkN1u3RDO8BkeCa9XsRA==
X-CSE-MsgGUID: CMCr807YQVK9vN/OoX3HbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93957823"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 13:05:10 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 13:05:08 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 13:05:08 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 13:05:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WT9XwuXeOodIfVJAnm1Sq0ltVxNjunGGDflRoZR21irwOAj5fKgz61xglFrP29rg2Hy0+2qZ5HtvpsURJnBgQQKNgjHkCQr35mbzIq/VCQsmbK2jep4R2MM/eQmLM7cVnWwSqy3QaAsWmBD30F+lwLBGi/GLLy5QApU94/sG1rrSaOIWMbHXflyCQSv3dWcoOjo3aRRn2/tYsgCQ7T1lppe7rDQvH22mMFiZ9wjNYmqLV3QDjv0ZRAC7+ht8DVA+HrKjLx9F76hg+OWERPkizj+vCI/kOzDxZKjr8sg3LyM7ZMtRBxQttiWoWhoasznbwaY8SqL/WClbCn0V/tAqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LmHU4RvaAEQcf/tihbb+QQp54MCwEklYWnRQKxA6Kc=;
 b=bSiqeNmzZ/YVWuJCjLuxu1GixjFW6KKWjGm9frql1JdPFP6yZg7LJf8F7MDg+j7g0M4pheNUW2xV/BWikJM9RO1MH9DI/dWGW1wboYXWdGLkjnWLMxNqtpVueZn0Q7/WaQs9axZFk4y9uzo3NrY2rdquNb2oe2eB5J9GaUE1slfD2Z1v9RDD9DyLKFUIgEO/1Y5xxd3TAtKyL8TWJAkzX0PYv7Q7dtD0JUh0f+9w9/W6xq3qzn9V7KeCYMK5jdnEwWzBatk1S2klyH9EUFLkP5puymWAWKHz0PDV37/9VQMTU7QezxFOKLSzN1YCv+8nvPNkiFU80DDQUtxs/EI/xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB7016.namprd11.prod.outlook.com (2603:10b6:806:2b6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Wed, 4 Dec
 2024 21:05:03 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%6]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 21:05:02 +0000
Date: Wed, 4 Dec 2024 13:05:41 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/2] xe/oa: Use MI_LOAD_REGISTER_IMMEDIATE to enable
 OAR/OAC
Message-ID: <Z1DEJVuW/16/g4EW@lstrano-desk.jf.intel.com>
References: <20241127003127.42560-1-umesh.nerlige.ramappa@intel.com>
 <20241127003127.42560-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241127003127.42560-3-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:a03:338::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ab74c51-f1d0-4df4-aec0-08dd14a75220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?75idzel+TE4kPotSjpvHVpiCzVZmylPh5F5TD8knfy6uM7JqSQ3iDLDf4Bll?=
 =?us-ascii?Q?BBwph+GtGppJ8/74r1dlr8IOLefybFk9ktNwFdYt0BZL7fFU7EAi3ghDLiFp?=
 =?us-ascii?Q?a6j3RF3xAqBrpbesgQ6W7LYpTWcpQT/BOO8lbD/gCYTFlr2c0Mmgr10rsMko?=
 =?us-ascii?Q?AAyuRKYPMjIhjQ9lVHY6mzwGx8oi2V99eHKacF0h4tJPWghP6WX29jazVUgY?=
 =?us-ascii?Q?fXQ+TCb4SRSLrpB6mn5g75s5jqbs42zyOFroRUIecq2EwrXW4rgMPxu/6X7h?=
 =?us-ascii?Q?4T64FO1ctd9OjYnxxmZ6Aliql+Kc0YJeF+Q4NUfAiDCEEVb19ectcH4pxhcC?=
 =?us-ascii?Q?rbCmL14yMk814DqIgbz2iG+7u8dtzK0/Am1Yt9vd0x/N+tWKBehxcp7v496s?=
 =?us-ascii?Q?NWZWMc2aeY3BqMGJkg9JL+jnSxuFZLO2M42BpjebnLQI9pZFkSi1mbUKhbwE?=
 =?us-ascii?Q?AQyrJ6ndsbTqb4+E4c/rTtUhiTyVzAqucofG0ILCrsACxIgro1dbBQQrZ+P2?=
 =?us-ascii?Q?y2D7AdqKxXWdlG9kTe7U/nQ9eSE2HSRdAOw9zqaLQMK9rNxqgqW4v7hYLrqy?=
 =?us-ascii?Q?+0kEvEdbMhPQw+Gvm1GPLQT3XPM7HI/AXww0Y4nOeoHvL5Rt33RgPX744zDO?=
 =?us-ascii?Q?mpUnctLuiHJ8rkXpwpW/lJdRH6/7QAeD2wRviG5vycueG0ZxURB62GdFAwwH?=
 =?us-ascii?Q?1AH+NFkoYgV/YmZPg0qcLC6MsnM+oQdDUG7nY9Ipvro0mrbDi7quvXaT9cug?=
 =?us-ascii?Q?zp7lhZm8fZe3lAT/275vUca7g1KVM/i8KPzzsI0lUdavvGRe2eG7XAswuiDZ?=
 =?us-ascii?Q?7BczzMtVSpzyla9zrlExbStBkhI1atn2XoWvCJn7Kc7GxDB2dFQH+TsWeR4N?=
 =?us-ascii?Q?8lGznsjRGwqjSrfbfpUNNrY4fOuL5sinYZ2A77TS2/YwN93WTBvEg9NpKYPd?=
 =?us-ascii?Q?wTuSONDA0skaBTFGAusxNdn/uJJsulWW+m04GDIJMGeOkBPUcN8UmY42Nu5n?=
 =?us-ascii?Q?whaLM9uWtYO4d10raFNFvTE06WhIecpl1c2+c/qkBQArdU9IBgrcNJjmQ4pe?=
 =?us-ascii?Q?MyB54eyPWr+k7aNcyxVNnCUQ+UkmmTCu3AmsEZAO474fTghEy/Snk0rvz7Rj?=
 =?us-ascii?Q?FxjaLT2/0l1rMoMQrRPfWyNTaYlgiQnQVlKVmtssM+WUYk70Ox/vfJix9xo8?=
 =?us-ascii?Q?BlU/BSPokm8BA4FmiOywNp1FDyCIYH/A2+3Ynb7jKPhS3pydLPOxJz4zy/WN?=
 =?us-ascii?Q?n26hOfPhhZ48vnK1kDtIqSJYRBRTozgOyRBZvwEh3HM3SiMyeKfBgVf0brR6?=
 =?us-ascii?Q?apS8V23wdwcexINmhtkdB5BaztQZNUWQcckDyWapfY+Uow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nvp/2t9BBKY9b6G7agj0CkufHPtMUGMImpPe1Gg+ONel9MK1f4GAtwXTXstO?=
 =?us-ascii?Q?YvtTvijTFWJBXgFP/QhiEhmkaSCmJrVh+VlheZz0Lq8+OsW74uNgh6Nk/+/l?=
 =?us-ascii?Q?JZgko29vxOwv5V/Op8xj1e6YXdV4UqgXwCHDe4Dtj8aOWonNEor9p+koKrIG?=
 =?us-ascii?Q?88TO2jwlUdTarbOvCAmXpDCULLE89ps1MYwk2UrCj7mXJ3K1nvTPynIIWlGG?=
 =?us-ascii?Q?srjaB867x5kO2h/SuS20HfgaP3ARbvPvKLjk5Hy3pub32RN0uueRoSwC5/qa?=
 =?us-ascii?Q?6xVujxpDZo5NHMxT5QaHCd+b5ruxfwO2EX5BPCOxT0c8ugPMJQDQPlucVYS1?=
 =?us-ascii?Q?PD4S78sdrWH1hdpz9dCjOL5Mh2mTvf76f3oo9MUSDd02ek8Abrn5l5wvPcJ+?=
 =?us-ascii?Q?xt1tMF0iLOxiFr57+MYScGnPf8q6vZTPaVb5s/KUuWwgTexIwSQx9TkMwbdA?=
 =?us-ascii?Q?6N3Ns8LZgCamdqFXHKXcz1vhrY56yvWuPIwi8rxKNmxjSL97Mh39XxqCfVna?=
 =?us-ascii?Q?Yz2/JPysZf9SZ6Yad/2eLFpxFXlsr5TBbSqTu7Pj3PboHhNCSaicIqvPbgUO?=
 =?us-ascii?Q?AyGT+wlZj8JuZmCK1Hj6uFLZAhe9dac6G/Ml6FBWqMEmed+IP0nEMJiNU+Mv?=
 =?us-ascii?Q?QZO7BNa5IoQ8AbHe9Tq6laxpHUWJVVAwczn+4cyohLaiCsSe9Jfj7vq8WBGC?=
 =?us-ascii?Q?3yQhsn7Rxi0fr7ZG+GHKkYl194qtQu1K7avKnNRhX3PiogFi0gRb/CgUHic9?=
 =?us-ascii?Q?sHbQLT3WG3ySX7KohWiqgJSmhw/SQdFhKJ8T0/AGIWIhVdfAXGTyJU8xVMrG?=
 =?us-ascii?Q?9oMxb1czvq4RNc3bkHYWf46BVoNttGvPICXfLj7rAm1S9SrmOhR3Gv/65+Ce?=
 =?us-ascii?Q?zf0H/wERxJea8sh41RjXEqjiy/5NDE9F8H59LHX3TRSIabOjLRKxz88dPS4g?=
 =?us-ascii?Q?9x7LDXwO7blaopeVCZG4BRzLM4dRjTdEFbJIJIHo0DkoW8RIkMpa2YvE5mOb?=
 =?us-ascii?Q?5Oxqyd/BP43s6M1yudyfQGrJvIx2gDXhtI4Wu+txlXMrFxbcT2ZOt9GtTZtT?=
 =?us-ascii?Q?5Pq3iAfXCC3iYg1gWHvnIade30gWcQQ9oxncpxFSWNiFEzhoLsVte42lUOse?=
 =?us-ascii?Q?etY9Jqac5Ebe53IuPNzPS0Ofe6lQpMCpo0P+FQKU38h2Y4McdIdycbHtgTcE?=
 =?us-ascii?Q?8O7Inkpue0g1fKEUONIrStR5hOKR7c6zZLw6g6mV6dZ2GUbr+nPa52PXR0Ig?=
 =?us-ascii?Q?bXLP7V4JeaqFy/6H5xHxcF77Fjll2yFhWnUkiWp5zyw1apauDYIzeIT2Sl+w?=
 =?us-ascii?Q?coi4Qj+Zt2nsylpoAHdLjFNyYe50hrt8CGEMXIGtuol6aPIAIGcCc88gxtQY?=
 =?us-ascii?Q?csU1cKCzwJmdlYIYOFYlx8B4LqxIYUeLbkIwMb/3K7CT12AHx8Smvy1k5Gli?=
 =?us-ascii?Q?ay2O3da8lEbHgzWKUAhKSSWog4T6gA1+xKWnFooOQKERWuOVqnzBPSnKvlOa?=
 =?us-ascii?Q?4s1mCeIw335eOQv2GOn7EpbEbsJZuLKZy/j2y1da69eObpXgkMClfWsJdKe7?=
 =?us-ascii?Q?3jnEY5R5n/9kiTJvwZCLv8WVZ92gAlH5tbIPzq5DVxdNDSL67a/Y2ZEDBTbq?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab74c51-f1d0-4df4-aec0-08dd14a75220
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:05:02.8498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MjNkFPtGwgzs4SdCoqBwMmXQEGR2IWOOqM4IjTxo0YrEnF72w5PgjzYYX0HYus/N2oji85NMTn3+5XG2DQjKyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7016
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

On Tue, Nov 26, 2024 at 04:31:27PM -0800, Umesh Nerlige Ramappa wrote:
> To enable OAR/OAC, a bit in RING_CONTEXT_CONTROL needs to be set.
> Setting this bit cause the context image size to change and if not done
> correct, can cause undesired hangs.
> 
> Current code uses a separate exec_queue to modify this bit and is
> error-prone. As per HW recommendation, submit MI_LOAD_REGISTER_IMM to
> the target hardware context to modify the relevant bit.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_oa.c | 68 ++++++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 8dd55798ab31..73c07fee6409 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -719,27 +719,55 @@ static int xe_oa_modify_ctx_image(struct xe_oa_stream *stream, struct xe_lrc *lr
>  	return err;
>  }
>  
> -static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri)
> +static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *reg_lri, u32 count)
>  {
> +	struct xe_exec_queue *q = stream->exec_q;
> +	struct xe_sched_job *job;
>  	struct dma_fence *fence;
>  	struct xe_bb *bb;
> +	long timeout;
>  	int err;
>  
> -	bb = xe_bb_new(stream->gt, 3, false);
> +	bb = xe_bb_new(stream->gt, 2 * count + 1, false);
>  	if (IS_ERR(bb)) {
>  		err = PTR_ERR(bb);
>  		goto exit;
>  	}
>  
> -	write_cs_mi_lri(bb, reg_lri, 1);
> +	write_cs_mi_lri(bb, reg_lri, count);
>  
> -	fence = xe_oa_submit_bb(stream, XE_OA_SUBMIT_NO_DEPS, bb);
> -	if (IS_ERR(fence)) {
> -		err = PTR_ERR(fence);
> +	if (q->vm) {
> +		down_read(&q->vm->lock);
> +		xe_vm_lock(q->vm, false);
> +	}
> +
> +	job = xe_bb_create_job(q, bb);
> +	job->ggtt = true;

Need to set this after the IS_ERR(job) check.

> +	if (IS_ERR(job)) {
> +		err = PTR_ERR(job);
>  		goto free_bb;

You need to unlock the VM here.

Matt

>  	}
> -	xe_bb_free(bb, fence);
> +
> +	xe_sched_job_arm(job);
> +	fence = dma_fence_get(&job->drm.s_fence->finished);
> +	xe_sched_job_push(job);
> +
> +	if (q->vm) {
> +		xe_vm_unlock(q->vm);
> +		up_read(&q->vm->lock);
> +	}
> +
> +	timeout = dma_fence_wait_timeout(fence, false, HZ);
>  	dma_fence_put(fence);
> +	xe_bb_free(bb, fence);
> +
> +	if (timeout < 0) {
> +		drm_dbg(&stream->oa->xe->drm, "OA load with LRI failed %ld\n", timeout);
> +		return timeout;
> +	} else if (!timeout) {
> +		drm_dbg(&stream->oa->xe->drm, "OA load with LRI timed out\n");
> +		return -ETIME;
> +	}
>  
>  	return 0;
>  free_bb:
> @@ -751,8 +779,6 @@ static int xe_oa_load_with_lri(struct xe_oa_stream *stream, struct xe_oa_reg *re
>  static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  {
>  	const struct xe_oa_format *format = stream->oa_buffer.format;
> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>  
> @@ -762,13 +788,17 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +	};
> +	struct xe_oa_reg reg_lri[] = {
> +		{
> +			OAR_OACONTROL,
> +			oacontrol,
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
>  			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE),
>  		},
>  	};
> -	struct xe_oa_reg reg_lri = { OAR_OACONTROL, oacontrol };
>  	int err;
>  
>  	/* Modify stream hwe context image with regs_context */
> @@ -778,14 +808,12 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
>  		return err;
>  
>  	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
>  
>  static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  {
>  	const struct xe_oa_format *format = stream->oa_buffer.format;
> -	struct xe_lrc *lrc = stream->exec_q->lrc[0];
> -	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>  	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>  		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>  	struct flex regs_context[] = {
> @@ -794,14 +822,18 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>  			enable ? OA_COUNTER_RESUME : 0,
>  		},
> +	};
> +	struct xe_oa_reg reg_lri[] = {
> +		{
> +			OAC_OACONTROL,
> +			oacontrol
> +		},
>  		{
>  			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
> -			regs_offset + CTX_CONTEXT_CONTROL,
>  			_MASKED_BIT_ENABLE(CTX_CTRL_OAC_CONTEXT_ENABLE) |
>  			_MASKED_FIELD(CTX_CTRL_RUN_ALONE, enable ? CTX_CTRL_RUN_ALONE : 0),
>  		},
> -	};
> -	struct xe_oa_reg reg_lri = { OAC_OACONTROL, oacontrol };
> +       	};
>  	int err;
>  
>  	/* Set ccs select to enable programming of OAC_OACONTROL */
> @@ -815,7 +847,7 @@ static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>  		return err;
>  
>  	/* Apply reg_lri using LRI */
> -	return xe_oa_load_with_lri(stream, &reg_lri);
> +	return xe_oa_load_with_lri(stream, reg_lri, ARRAY_SIZE(reg_lri));
>  }
>  
>  static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
> -- 
> 2.34.1
> 
