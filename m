Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74C4CEBF7D
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 07:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9166A10E348;
	Fri, 27 Sep 2024 07:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GmbW5Nl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCBD110E348
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 07:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727421282; x=1758957282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X0dHw6qYEhsYmhD9Nkv31SdR01+GyqWu9vIbZujc72c=;
 b=GmbW5Nl72peKmkPJBxK9YSfiJBQ0Rku5l6MMVCy2y0V4JBi0/aR3/c4b
 d5cHI/QmNChf+Wr6As5h5xYa4vuCBchArJoQPgkjyrHdMA8bhrgzfj0Fw
 ysWLQxwQn3ovTogz6XnipVt1uyGsIkqtJ9m+2KTqRd4T1agdaL5YI8dPU
 aK6bJcdGk1R2MBRNZMrYt2A/urCjG7Ob1OD8whFS93/diBjYZh1GtOGjl
 vKCK5rNM0NO+/f0yfXfShqf1UEkQQOYWWkTEZZfrd4qN6TMlN0zBiQRim
 C37bK4a8dLEMbmG2XAXV3Xr/cy1BYSjmxTmsbZfsj4k4OYI0KpSr3TL0r Q==;
X-CSE-ConnectionGUID: q8hx/xKKQeWBYLFTY1VGDA==
X-CSE-MsgGUID: ArhyxGg+TpWZojQqC7JKww==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26721267"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="26721267"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 00:14:41 -0700
X-CSE-ConnectionGUID: A5BObvtXR7uEH1wVJzlICQ==
X-CSE-MsgGUID: V04E4yruQyOqoTZyCXom2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="72754369"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 00:14:39 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 00:14:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 00:14:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 00:14:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 00:14:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/VTXSNEyP0mznepWcdpUkdanmFVqOgwdT1R4NRvDwmY+6VAftXaSo9mazx2iIiubaArR2grSMzV2bf3x/J4C88t9sHVWpF/vyL/y85lEbrU7qf/p0bpaH53r7LPrtoxC2D+BhmGazVE618njNxQk9bIXIW6CEXEVygRSbCqQr2zNbXGSCrNeulFkejDS/VL2vOKz8drBE+IQs1wJFlfPcb8MOrX8oV7IcUjxqSLhLCUVWjVtNhUWXqsu5GuDXP79hHsWubslNHTWpfgHIp0aScVX9qVRB7LVxAHbcIKFQ5ZmmN+VYPcsFo29nAJi+0TjCW+m/MLxHArd3Ob5PCasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HujUSMW2bqvzlHvmRFSHQ71CnOj/TiDhoqCAPXdIYAU=;
 b=Tm7tpQ3mo33PPGId9at5FOq4/JM7dW185WYn+4M3l4TnBITFLbN5YR9kZphP6NVGY6FqO+HsWyRMn8f5uE98KgIuDMj5fcWXyzSqN/uXGltAxxM9kn+oac3PbvKeNet0RDj8+uOwoij413OGUdhWGdIVIWFjzXUlnpJybx0xSaX+7vSASWs3usyeah9VOG1o2Ob7we/5ae+6xgC2gDx/WWti349vIASq0X3YDMKqva+o8cM8zwsAH+IrcfwDnnCoClmYooBDWYtAy86ZpFv8ijlzHqU0CGog2ZdPoJogQLARG8SnUR7/G08PzEtJ7j+J8orUAJhnMYxkmFxHAm0zYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Fri, 27 Sep
 2024 07:14:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 07:14:28 +0000
Date: Fri, 27 Sep 2024 07:12:17 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Resume TDR after GT reset
Message-ID: <ZvZa0T2vct5WDo97@DUT025-TGLU.fm.intel.com>
References: <20240724235919.1917216-1-matthew.brost@intel.com>
 <3a332ca8-fef1-4cbc-b82b-c8eb1090a318@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3a332ca8-fef1-4cbc-b82b-c8eb1090a318@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0171.namprd05.prod.outlook.com
 (2603:10b6:a03:339::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 14bc9ada-fea3-4af1-f7e3-08dcdec406c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?F+Z3BES7OtF+N7P9IOOnMLjX8O6vIjsuYAI2MuuYR6573tDyt7VDw5uwdj1s?=
 =?us-ascii?Q?X+/xivTgZPz99oVMu6JHL4VXtaVsxxD9NTFXOgdDhQT5QdrWlUXw8eSfLIVr?=
 =?us-ascii?Q?2vTKIN9pcaFe7IZ8PNkuc+4w9AG1c6r54drffDfSOrdIJbcDV/W0sKtcf0OQ?=
 =?us-ascii?Q?J7SvR4C9+tKoimWwgaPZezIVAWWcXbSsESwt8QcS6pH8HFMrrWrNv9whtbE0?=
 =?us-ascii?Q?W6S/7wIOZP87qUSqG0IB4SRfrtba+iqFrg4hcfiJUsltR4Pr7d/JQfbNbtCv?=
 =?us-ascii?Q?jnLiL41hbhMSRRnhk5K8jc4nPKlWVBkurQ72J8aa0bWcIpXaQXGRuMYCORyf?=
 =?us-ascii?Q?UD52h5fDoVjXvoizZ8YXrR0+t8n85dZrLXNpaQiJIEekzAAIvcO0T/R0LryF?=
 =?us-ascii?Q?u4VFzqsYllJCXeuhiKkRkkglYk4dmq8C7dotgfIjcFJioj98HNLWvYn8WSDi?=
 =?us-ascii?Q?T2tODAszK4CI2nXibOZgGMHnCxAUmNh31KrZWWrTPOyLralCcyUYEI5HXI0N?=
 =?us-ascii?Q?L40Qe1V6FLd4teLD/J8GbDRmpLrNcl7OcgfKuXwk30br9i2mout+wQA0I0fr?=
 =?us-ascii?Q?1D/xsKd8/9Wzga0fhypJVaXweg6C33FT7h6pVxVt7u9z2QtJAVJfYL7YVnMJ?=
 =?us-ascii?Q?HiRgFAN6PvUzQtpnxCoixMwDN6aVaZo+UOdYjO/dwe+fCltfoOsNsdOjXU6c?=
 =?us-ascii?Q?ioF4ym3n46ITQbcjAsIWaWiSlkVwHQ2uusAb5dXFEHKElNp9VFPjFTqQyRl5?=
 =?us-ascii?Q?TT7cob+OLZyVW19GW3bOyVTTA+RbvKadg6qo/tg8qKb2SIl4h/7of/DReW0w?=
 =?us-ascii?Q?MupvUaWQwjqmlCLFydCBfFfp6I7atYtYfNJVgAXCSeO3SJJ53ya9WzIUtfcr?=
 =?us-ascii?Q?/3bmRQjw0NNi+ozwI8eSaHroWbpdI4QdxXfyF/xhmY7aAOwLXzDpA4R0YRqG?=
 =?us-ascii?Q?2QJFgFTWtvwK3ajgKOXDdBWxFuSaTck2+F6tLNdDnBpjg+KnQulf3LAmHDMy?=
 =?us-ascii?Q?Q3R+WWCxuQs708mOL+Vm2otqAAfsOwiRC9gAp742qDxXcEyAX6fD+TMr2+DF?=
 =?us-ascii?Q?Ww6h0MjSaPKssJcSuiY9+OFaIj+lGyeEIHA84JrDukWQdkfIJzXkFK9g3u7X?=
 =?us-ascii?Q?QPADOMUYZmoi8N2IeaP7c4+m36ydKrdRuxhyrIecWnTvpqpJDozXbra/fs+X?=
 =?us-ascii?Q?F0sjzQyhVVAmjjpUWYvnE2/36Et7+Cl6AG1ojFSwAF7SdoLhGxPIXcGUaP4m?=
 =?us-ascii?Q?PsqKZZR1HPYYaze2bfL5m4BOyBoA8eh4fRP2z16b73+xjjp0NIy5iNV+S2bU?=
 =?us-ascii?Q?gZOfkHqpkpysnGy+h794iNbEiQplFYzVpIdJ+zuzkfv3qQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jp/MkJjJiiHBBts1kQmkg2DxEuLBJU0E5UOWKUcWh/uNRa7Es2EwXFzrq4qi?=
 =?us-ascii?Q?pWn8pjwiKm8fQlxq9sh9F4DzygG5Q06C/hFuIB8FTbXnq9gVEHOmMDPWTgpW?=
 =?us-ascii?Q?Jq0BHuAzoti5Q1H1x/lJVoupY8Y5r8ItPEXW/DO1ZMTfaOVATx3ci1Mx7BAq?=
 =?us-ascii?Q?vaRc12UB7d6S78JzIUJWwCw88To2JhqmWYCwIGIWhFztVz4goAXFa5iyTAP8?=
 =?us-ascii?Q?AZ4HKP0h134fA80A9qaA57uj0x4xxrze67L1QCme0fniYja34K5d/CZv8k2S?=
 =?us-ascii?Q?OHtUf4Y+gttiKifBUbJq3tsLSG+V4Scgf3hl+0OCOTierinBHpVGmgknA47X?=
 =?us-ascii?Q?f8g1CTYy76hA3Vx5TbcbksohcC9tt7q56qwTu6z8WGeUWlHQh12TmrIj/SNY?=
 =?us-ascii?Q?1ynjTC56XBrLM/wKC1Rh8486dNOnrrMVza4wdfdieKksr32xVuBCT/Uy5qfH?=
 =?us-ascii?Q?rZn7IhuL/AbUSD3tU/WMmSeGHaTw79+Zx8m7Zc9vDZoBH5FdFF1/PvQPdImP?=
 =?us-ascii?Q?DV7nh1Tb5fyxeMEhGx3bloSFMcDDBTFaaaDksh5ue3+WWVMhPoI6IsB0AkSk?=
 =?us-ascii?Q?tDmYT2sTiWkjyV7tRGH/DV3tB9RHfBsq4HH99dqlWKBtbyLZ8115k/FbcPXa?=
 =?us-ascii?Q?S8GD6T1DFFoBnaGBl3SNV6/4rMtr0k8OTmYccBqbe7sL0EbyR2nPlIYEogNR?=
 =?us-ascii?Q?HK4geiSP4Casd9B91gkhJQx2CDBn/FQjh1IfGEj48ZAaP6dAUQNfIneIPt1b?=
 =?us-ascii?Q?boUn/+2fxrLTYkXNkvEt5smp3MkMPGe6CD/2cCZxO2O+/svohSwXIEa592hW?=
 =?us-ascii?Q?eLADe6QvTHY+slD3fDuhh38445o4/qtshJ8vU+610rqaUQ54OFDU4bWEG0f4?=
 =?us-ascii?Q?+mw97ULReIxlYcQ0UPSBVHW7aPX7xS6rV1iyOKn3mt8T+VkDyEpqxmrGYO0t?=
 =?us-ascii?Q?bg3tDNdKIL+6hoYSXdleiIIODOgSIcljrRhNX/59DAjSkjnORCbJ0lpvXYOD?=
 =?us-ascii?Q?sd+It1BkJ0Klg3EkwZV11dODdoUr3l+x2hlhCtJYj/h+XZD3xFyY3I1qHzcQ?=
 =?us-ascii?Q?wVMyy6E7cyFgXZni/0MW+V+Fx3EBZL4BXgnlZrAb3zMlP/esYK+mJGRN87+3?=
 =?us-ascii?Q?0DpEzjIoAtQYJ6sEvmviuBUXrk6GRmFw67t6UzudMO1UMTSEyp1XzPf2mQM2?=
 =?us-ascii?Q?IUBZTvIl4jCbyWl5yFn5rNDyZE0+JCRniRV3l+0vap53ivCC+2Xrkq/YbkLi?=
 =?us-ascii?Q?WW6zcfXBvNo2KC8OtzuY+dE5OiiX0iFMB/MR9BjjC4nPQTazVfGgL9W1slN/?=
 =?us-ascii?Q?eRjX+EpCaXNwgZSJsFmCEg+kcDQX3ty4plPvIpVRzm6/V2SZ/FQVsCXHMda9?=
 =?us-ascii?Q?ORAyUvjUVZJKvqeSOlRWp0iuF/+rn8l/jWoYp1nx4Ea0Ncaz3SpRzzL2GQqB?=
 =?us-ascii?Q?J8AdXyVW1vZbj9YQr3JaYgYuDr2Ld4U9tMNC8xBv+LDGcppJnIfwybyso0r7?=
 =?us-ascii?Q?uOLNyaGB+IfBNd3s8QOP6Nw27nBjR6rjzOMRixcVUCO1RncQpuQfwc4isEzc?=
 =?us-ascii?Q?0BJASbsSoANSI1+7lyxgo2YOEKIqnmhBIo4PnQZe?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14bc9ada-fea3-4af1-f7e3-08dcdec406c0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 07:14:28.9025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0GIu7z7Qlgh7P5FAveoALvql93ThAvJiaQiA/lg0R2SBsTEqSvKXvX+8Y3VjMdw4cDZx1FDoCiaygHzz5Ipqsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
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

On Thu, Sep 26, 2024 at 07:25:22PM +0200, Nirmoy Das wrote:
> 
> On 7/25/2024 1:59 AM, Matthew Brost wrote:
> > Not starting the TDR after GT reset on exec queue which have been
> > restarted can lead to jobs being able to be run forever. Fix this by
> > restarting the TDR.
> >
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> 

Thanks for the review and helping make sure this didn't get lost on the
list.

Pushed.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 5 +++++
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.h | 2 ++
> >  drivers/gpu/drm/xe/xe_guc_submit.c    | 1 +
> >  3 files changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index e4ad1d6ce1d5..7f24e58cc992 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -90,6 +90,11 @@ void xe_sched_submission_stop(struct xe_gpu_scheduler *sched)
> >  	cancel_work_sync(&sched->work_process_msg);
> >  }
> >  
> > +void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched)
> > +{
> > +	drm_sched_resume_timeout(&sched->base, sched->base.timeout);
> > +}
> > +
> >  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> >  		      struct xe_sched_msg *msg)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index 10c6bb9c9386..6aac7fe68673 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -22,6 +22,8 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched);
> >  void xe_sched_submission_start(struct xe_gpu_scheduler *sched);
> >  void xe_sched_submission_stop(struct xe_gpu_scheduler *sched);
> >  
> > +void xe_sched_submission_resume_tdr(struct xe_gpu_scheduler *sched);
> > +
> >  void xe_sched_add_msg(struct xe_gpu_scheduler *sched,
> >  		      struct xe_sched_msg *msg);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 460808507947..2327e11ae311 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1768,6 +1768,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
> >  	}
> >  
> >  	xe_sched_submission_start(sched);
> > +	xe_sched_submission_resume_tdr(sched);
> >  }
> >  
> >  int xe_guc_submit_start(struct xe_guc *guc)
