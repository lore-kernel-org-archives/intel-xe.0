Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67CCFCCF9E5
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 18:44:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2010E54E;
	Mon, 27 Oct 2025 18:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ceaQLszu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC0B10E544
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 18:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761590686; x=1793126686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dCzTcb8hWc1jhOBOQ+Re7hgDhwT1FhAPRYRFcTJLuMA=;
 b=ceaQLszueH4riwyBn/jzlmwmjYeMFSQE2TIawh/HiuNDWAVvA4b1hen5
 FlNk6u8b/DgxVlFlyaBTQWcAjPWFRp47HZEVETMNpKCY+kI6jCX1519AR
 v4PtG9hZ5o45b6Jj0wuiVCvgLpbBbBLJlJGTW3HFYdfm+j8iTKkHzvcCS
 g3jUyUDudzU4HySGeRg6yNlpDYtV1sxHm66A68L/LkCCZLgT6gV3OcGKv
 urX9ZWL2CM76k95PR1+wx8GK5upPjmWuWzYQtEvHzj1KEcxFD6ngjM0gY
 Zl5ErskzVPfQIjN9EujQyYKKkJfc96npYqdhvTviE+yNXIv+zcXswFM7V w==;
X-CSE-ConnectionGUID: r+m3C9oQT3qeq8gdA9ZwaA==
X-CSE-MsgGUID: Ipdg5hylTk6/qIUfmKkWvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67518044"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67518044"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:44:46 -0700
X-CSE-ConnectionGUID: zSEtI6BKSxyZOOLZtPKT/g==
X-CSE-MsgGUID: Q+Qx/gPyT2+ijyp9JfDvug==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 11:44:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:44:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 11:44:45 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 11:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K8m6WCuk/9+xaVp193RUB1ksg+g+wH6qm96zdqKz1jNWY0iaFNq95hzVXKMMb9jGvkNcV8f7V1yKy0tetPBEEWGy5cYMUVKPSsjccjmfjFGE5yXSyA35Aiu3WZsXrhV9Qec8v6JN2NEIdEK+yFVtle5BY/kg69VEZa0kW13higetgB6bw10XXsRJXaAgGUD2dzwODskmBHXP2yIEM96N4yJ4QgMDyvkKi5sNhSNef8V8SNBLenUB/U/sCAmc4mNI60kRJPms4Sp8NksgnkfCsuiz/s9QKFH9GrBmJnRS0udfS8QsJG46K0dz9UVJNNEs/2pWXsnTbCaClbHgT1ym1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUgsmYxn2j7EpnN5DqgJEfmQWaWDwByUCd4mSY5zMZg=;
 b=An1bVgXYW0foViqIU5lMN2wzIainStgDV2M9b59a4Z/gb0WLm7Qthf/JJeUocG18QYvzzSsJ+/nXkGUCLvQp53+G7QvajTY/Two554Pv8sq0bNzwpxCxx+2EMApTFJ9/4NwRBXm+7jsebqXkWfkrDuG0l9SEkiK3prnleLFAaOWQeo2v+eVznAv+E6KmdLVt4q9ADJ4gqXGkWcSYsdGPqkMDyYWNwhTcjPC3tbwMdl2UyhrWp5E4oLCJzReaccMdTwUjG94JsBp8N/WU+F/knAFtvV1mAhziNXZDM1+CHz6A47q7ZD+ETAsm1lIuUUj7TZY+VWj57O9LVDLzqAuXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 18:44:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 18:44:38 +0000
Date: Mon, 27 Oct 2025 11:44:35 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v7 2/4] drm/xe/guc_submit: Introduce pause/unpause()
 helpers for PF
Message-ID: <aP+9kzsRKNvGXqiT@lstrano-desk.jf.intel.com>
References: <20251027123057.3738059-1-raag.jadav@intel.com>
 <20251027123057.3738059-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251027123057.3738059-3-raag.jadav@intel.com>
X-ClientProxiedBy: MW3PR06CA0026.namprd06.prod.outlook.com
 (2603:10b6:303:2a::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f00a7fd-1569-46ed-9a63-08de1588e1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N3+xyqDWp10+isgGfderSlf2JvKkTdo0Q61/Fhh18Ja+54765C5NpRlOvE/D?=
 =?us-ascii?Q?9aV5EHcW2yZm+rWmgZxCPMGP+wmlsUrUKieSzsn+wqWwCPsJw5tZoY3jtGFd?=
 =?us-ascii?Q?mqUzM4DKdfG6LLxdranBFcdmDBxSS0YHbdeGX/k9lq82cBbePxPZdLgEdaXQ?=
 =?us-ascii?Q?0PW6H6pR9ZDkkZk8EluTILUEPEo5CJIgOoLMpO7dFl1FlWczEfDEIB+P+Mf2?=
 =?us-ascii?Q?WsUKS1lpI5CYjIqVCkY4aRmLNjBt/66crQPmZiYaIdVEHgUA7K9L1JNtcn91?=
 =?us-ascii?Q?qZ1fwAJtPe6z6NI/jjjWoZ1dupdkVR6Km/k3CmPvN1pd1ztPMTe1CGMnEeA9?=
 =?us-ascii?Q?51/Kq7wHTUL8xKR6HCbR522wbl4LyoTq9hf5/+21zPKgcKF0YrR1ztki6bKw?=
 =?us-ascii?Q?8OyxnWEZLOmHUIJqrxvO72vO+iEPT+bv7tWewJ4pZ3d8SSgMiR2w4NFSe0jN?=
 =?us-ascii?Q?BhnQqmZGShhAk1zDqBP0/5Dh0q+SI/8y4zTRvnQi78295EG31KA+3tJpZ+OS?=
 =?us-ascii?Q?lf2EzbvHwqxPhSx7B1y8IZ0mKferxG67ppdOsLpszYjdLRG0fhHsJttx4n0H?=
 =?us-ascii?Q?aXTxT43yJosE24LCv8Cjbvgb3aUCSH0JFNILap2CI3yDAczkafMnjnzIu3RD?=
 =?us-ascii?Q?E4523pI9j+/fN7Yylg9vZIzXdrQhnwU2hmnjRhY0hepp9ngVvwOgiZX0MasP?=
 =?us-ascii?Q?PKqzmSd+/DqNqYO1siIHUVdB1OcjdmI1OcVKegoSqHyrrtSa4wuAmsHyl7/2?=
 =?us-ascii?Q?79y6Qqk4etZZ7wua90Gk8xr0cBHTRPNkH0IB02L/8vVyIaohEmoKF056znpU?=
 =?us-ascii?Q?rCyNORL68lJYk1DIcf+uF7eP4sM7jcj9YI0hap3ZV5BzpgPGCT74gnVZjjbg?=
 =?us-ascii?Q?tVKacqohJgBBUMtzjMk1OThY/l4YlH1T7TwplceYxN3y6bFJJI3cwBUI6bu/?=
 =?us-ascii?Q?Tcul/i2Qno8+MPGC8Ta5fpcU4MymGbGqS+QAkzHjAlAKO+kkp4xxBCP3Z9PI?=
 =?us-ascii?Q?olyO1LWqHmMqhv2j5Km0Hvj7LkHywdJndRcsx8/7RMKxCVX4TDYuAYfQQOlL?=
 =?us-ascii?Q?Vcs/lOeCqY9K9dARhoqlUDigYJA69GCQ7C5kpL8LLBk+qqpJhUZ+MGZsQHKn?=
 =?us-ascii?Q?liGMtCJwPHR/9BRcfL/mRFyH61u7tKUoH5qtDOTlqirUBwTTMem0bvruL/74?=
 =?us-ascii?Q?ohTjfXRLcbbKWYs8i3JPZe7S7+3jjAOtCuLN1tJk9dDs+g0/3TBccxFcaI0C?=
 =?us-ascii?Q?fD3h+U1sl2uJKKMNxh8/nDbAW7chUJ0qAHhNulJ2BUf5FknD5oPoukHVd0OM?=
 =?us-ascii?Q?cxFY71lKk0CjsAAr3VF/Fcg0wlapH+HVjhdbl/L6GDMuFSOjzqCLZEZ6kNsi?=
 =?us-ascii?Q?AiH/GyiwAiRVDZJCe5lyKHQEzaAgdAJ/CsiXGV2j1k/8GC7gzEcGdnNGN7vg?=
 =?us-ascii?Q?jp6hhvMcLAgXxej/kTGvTIgcmr2hD8mw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eEfWXkBAslUBgQEDgPhMPHpyaFwskHfk83V4uYpqwwRsBJy1nbLD2vraYGjj?=
 =?us-ascii?Q?D6nJGzoVjPo1n14Je4Pbm+4WQxqpYOU3KGRu4V+arPAMV+xsefQH3cqHjV0m?=
 =?us-ascii?Q?8rVVQOkUm9Eqw/gdhKEUtgnTsM2iXM+5GLnF5/771v/BOEm+EMKUmz+2mF5Y?=
 =?us-ascii?Q?NKCo81DLWCvq/JIxw7YTNZJePT/vJyjqCrpC1HlBGAr8/aJO4VgWnrPcChnO?=
 =?us-ascii?Q?cOyCPnyIrMSrR8dsChOBJ38fYj4XyA+jmqK+vZv3UaRHVk/1LW4DNNHSNyGp?=
 =?us-ascii?Q?Uyq28GFlH7iP0CXKhnb2vCbxT1AUPoJq8QEn9384ORzy1eiYPExzU70XPdTe?=
 =?us-ascii?Q?PYaH6IPsfkuAiLFtV9rEQ6dyZx0u0zgmVYEh1gov+2gV9sGzSVUsw8KfPUNF?=
 =?us-ascii?Q?Xt2xb2c9Tnql82Xv2h3LjlZM+k+ZPwG11bNJK1l7Ydd6nLaMwsr0IOe7VZbK?=
 =?us-ascii?Q?NtiVTrXWRB2/fMY5IE9yUNqO79XncNrrOmUE6XYwlBPA7U2IOddezW+Sz044?=
 =?us-ascii?Q?PS4feVDAbjjyYYtqjECHCmVWKa9rQIX0vCjFfWgfPD4hy9WXz2QdAO2PtFYd?=
 =?us-ascii?Q?GAAgJ7YrDiqX4hvPnyyxBCqAFnesebLVkyW0LZrA1R5L1adZe4doHfS/U8Ju?=
 =?us-ascii?Q?+JNbFrCLym8z0/BIo8eF6TtaIABerU3pdi6RtAbBOQt7HqMUtWZ/85rBizOS?=
 =?us-ascii?Q?Gt9h+mPyPEd4xYt91kcs3pWNyaYtDbSJ/guPAlRtsi6OdwcrCv838NMzWBEr?=
 =?us-ascii?Q?fxOaSZVaM2GqJTOVkerRhvUVVi1hNNvNhBgOCMeuWdHzUQiVSbDcyTGEj8jw?=
 =?us-ascii?Q?563ayxbcfI5Z1Tu/p57JKUMDdO/b7sFDj1E+uOT4P3RBcOe9SiQI/paQTToy?=
 =?us-ascii?Q?AifLa9tA8ZvMPHTVbKl3pLVk7qe2l0eQpRPj1RT8JIOPmSj3i7CsBwMISeqJ?=
 =?us-ascii?Q?Gbdbr/v7ng3+qYKUTiI17nR6dmoZi2cY0qW5dtTLmbcbVzCQTwsaOtvSGcGJ?=
 =?us-ascii?Q?1tK4paeo33yTuAtpCINoKkeAO27Zn5dqXV+gvIvXLkzmvH2QYmKbEddcO6Tq?=
 =?us-ascii?Q?pbuM+5aiJcfL5s0QTzMi/NrOLEclLWZmzxjXhYs/KnPy5FgEDhbgHEZ7ZEfq?=
 =?us-ascii?Q?E+0P16UVtWuUsW5qayAXTG0i3IO9gOsekD/ivunPKoHoqu4n99v2waCOJjzV?=
 =?us-ascii?Q?ez0EkQPz94GJX5u98yeiztp36PtXXRCMMSbGYiZS568NDkOMRSfnOcxnYCnV?=
 =?us-ascii?Q?xo45SS+b1QfDrJK0G16ymo/ILZIFz1TX+NOmiK/PphBuwkX8lReoaEPZSI3z?=
 =?us-ascii?Q?R/qUH9pS+kL/tp1lp5ogsZZnYlAttCzXBpkLnr9iYVZDco58WuJvE0VcQOzq?=
 =?us-ascii?Q?pjwwEHTyy6850ec445aVhJgI/ghxy2xQ75YvLAMNjn3uc73tzGIhgPP4VjQC?=
 =?us-ascii?Q?WsAxslWSHE4Aj3VumEhZ7AnsRXJCbT2AloAzckqiHAM7PpYDd2Mq3wn2KHwP?=
 =?us-ascii?Q?HohzvSGNwnmBXdJP2dUBhhFz11R9ESKxzWmW0F264aRfr3pMnvzqwTs3PvRP?=
 =?us-ascii?Q?a6j2bcfekJp+ieKt8RSRSknh3/sYeyEcvULmhKM4Oyh97SxRtxvYsj2WuK/j?=
 =?us-ascii?Q?QA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f00a7fd-1569-46ed-9a63-08de1588e1f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 18:44:38.5473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okilGLqL65ags+C1Gy09inOlW/9RdVoIKtZBctza+eTkhIHYkocJF4EELhJF0SN7HMZqFSsRcyA8/Mkd3kIS4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
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

On Mon, Oct 27, 2025 at 06:00:55PM +0530, Raag Jadav wrote:
> Introduce pause/unpause() helpers which stop/start further runs of
> submission tasks on given GuC and can be called from PF context. This
> is in preparation of usecases where we simply need to stop/start the
> scheduler without losing GuC state and don't require dealing with VF
> migration.
> 
> v7: Reword commit message (Matthew Brost)
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 0cb83e5faceb..ebaaa0b6ddfb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2161,6 +2161,21 @@ static void guc_exec_queue_pause(struct xe_guc *guc, struct xe_exec_queue *q)
>  	}
>  }
>  
> +/**
> + * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> + */
> +void xe_guc_submit_pause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_stop(&q->guc->sched);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  /**
>   * xe_guc_submit_pause_vf - Stop further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> @@ -2335,6 +2350,21 @@ static void guc_exec_queue_unpause(struct xe_guc *guc, struct xe_exec_queue *q)
>  	xe_sched_submission_resume_tdr(sched);
>  }
>  
> +/**
> + * xe_guc_submit_unpause - Allow further runs of submission tasks on given GuC.
> + * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> + */
> +void xe_guc_submit_unpause(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	mutex_lock(&guc->submission_state.lock);
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
> +		xe_sched_submission_start(&q->guc->sched);
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  /**
>   * xe_guc_submit_unpause_vf - Allow further runs of submission tasks for VF.
>   * @guc: the &xe_guc struct instance whose scheduler is to be enabled
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 0e7996836131..100a7891b918 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,8 +20,10 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc);
>  void xe_guc_submit_reset_wait(struct xe_guc *guc);
>  void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
> +void xe_guc_submit_pause(struct xe_guc *guc);
>  void xe_guc_submit_pause_abort(struct xe_guc *guc);
>  void xe_guc_submit_pause_vf(struct xe_guc *guc);
> +void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_unpause_vf(struct xe_guc *guc);
>  void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
> -- 
> 2.34.1
> 
