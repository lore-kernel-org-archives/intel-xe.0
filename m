Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2407DC4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 16:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E54DB10E302;
	Wed, 29 Nov 2023 16:13:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC2E10E302
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Nov 2023 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701274411; x=1732810411;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CiUvosduLvxbSea+f6O7pvd3Df2H4XBPLp3Q99xrIsM=;
 b=WiEHR9F43jnRRgRcC0THtG/bzoxfLPrP/a/GwkOKh1xD3lHcg+VsayvX
 tSPMqvqzuTmdI6lr5+Rmyvs0EuktCyhclObgl/YRE/NfjtzPkNc/It7hn
 izMCOqTBD2RctqYsZekQ2NCZpl3+tHsfQkJnlsAYC61YEB67qAgrl3/4O
 hqjRgaohLzpwoxvCJQlRDJXC2CO4LzKv5/HI0LcCG6vh2TNgEUflGyoYX
 y00qLvCWCOOPf82CuPghp2gaX4Mb6VSeG0oPzUFxJ0+QoqwTVdKvN/xdH
 iV5KiMe3O7gq/t6TRN6k5eqmz6zYa92vr6TYnzeV3yQr2OK1eMRExX4xi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372562751"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="372562751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2023 08:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="835068053"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; d="scan'208";a="835068053"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2023 08:13:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 29 Nov 2023 08:13:31 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 29 Nov 2023 08:13:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 29 Nov 2023 08:13:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imMllEIdASAx4Riixq4PQtaqNs5oTXd4potlANcYpUo2yNk4koZYxpqES2IEZNEZAmmjixfMsOoAlTzhTAZzm4p/Ofp+wt6/5szwxF8EZ3kS0zotDSFxZcwCChsP908n9k0WkJitOiqT6ZxPNkFeVwfApeWdzx2oQcHPWnyrPFaBWPUFDoDs+IPR7x/AvCKvtKVLD1thGYwDgWEdfhs0rixNcje2q5y9IiaPVg4Ko9aE+rTJPo7wC8ylZvYZGsomiat60JIGMmqk7UNMpLS/4foC8Pgwk3+xLjA6dUxNDWCL4kXAxzGlZ/jx0aenz3J5Bp/6jsVFB//vqwr6EzzwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pL/LmQvKkr2XTUcJpQWhQC1wZ4erdh1exalqel/JUn0=;
 b=TWYw0bXjaaWEOXXJ6BnwdpYXDcTXZF4Qegz+N6kqvKttG1JtEpThk8eFdeQStWWOqbFx5QeTxti9LJv7OxAZBzJ/ghUe0QtJaHPRgQVXPk+gRfbirMgtLDLtp1XRcriuLyNbVzdV+Xznpuvo7+oYG9nPRhZxKJ87lMSyIFVQLYC6+WxHGtpK6vldVvRYaOxiTYV7eISnhBuS+aCxOUs4nNJeMUrO4HVhoH89u0nLv+glqQpkwwSH5McUz0tQ5leL5mZwzUorK2Cm2SbPaeAIdi9JF5CWu/F50TBBhHIkgvs16hqMkQ50xdL3dmKSWKvzjTZSxZtsQO9dcRnkJ1NshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 16:13:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 16:13:05 +0000
Date: Wed, 29 Nov 2023 09:11:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <ZWcAQBRJwWrDhXdU@DUT025-TGLU.fm.intel.com>
References: <20231122042142.6648-1-krishnaiah.bommu@intel.com>
 <ZWZaukdzs0chi5LK@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZWZaukdzs0chi5LK@intel.com>
X-ClientProxiedBy: SJ0PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6a9487-d758-4c51-86bd-08dbf0f61166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sHopF4jDjPgjsUmuvBEJr9/3XmfRxO1j8U0slBpM+3ELE3eW/oywip3Q3TZZsdTuZ/unWhAj4fI1DvxvDf+EL8g+MPxrUnxRdrR71Y8MPIOJdYx2M5a6kOulU1wNMAfK8uQ1G1wNvLsyFcMl2VHPLq9skXuIXklKg1X3cgA998viGmRHqQa33PmUVA0uxl+MPwoJRVPd2JBFMUat1QwyvW9oupx9PnuXpbd65+rvRM0o2u7u3L4Ju5I/Gn/qfXJ4f415ePlC+qX4dLHSe+ZkrAAfichBTcVcL+vDPRakwYz8vG8/v5+hGzSqu1XFa4rBfRVsVJ9ohERBaInEJuqi1ZXOwIoEEDy30uwX4buO/PhrA0LZe65beaRuG4KHQogPXoOl2WUnNa8hGWFvV3FnRCn/9SpF/hJv7MBPalisRvv1bEUNTAOVOc2eoOc7ZlnWOXAe2HZi0GnuzE+yvzhGJuidKWNrbIkYywMyhi2Orn0aJ0cNkYb/wPRzMIGCkuqW/dj3n4l1pAtj2X2TJH1+SdOogHDHongJQG9zgXGigwU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(366004)(39860400002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(38100700002)(83380400001)(2906002)(86362001)(44832011)(5660300002)(8936002)(8676002)(6862004)(4326008)(6636002)(316002)(66556008)(66476007)(54906003)(66946007)(6486002)(966005)(478600001)(6666004)(41300700001)(6506007)(6512007)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ssLRJdm95UqJr/zK0taWJlgB68uAdU6azscLeTJJhNEakalqcwdcfgtx/SSQ?=
 =?us-ascii?Q?HZRve6SwzRwlUVWuE6eMCgkapbEE9KlInuiN1TT3GkYKFlPeAMlu+kLpP0Vs?=
 =?us-ascii?Q?55rR7lI8YXJ55OtJErA3GW0YHDqm09dl+loI9e/TYVdVtJC2esAy7f51xN/e?=
 =?us-ascii?Q?wxE6c8obqpyOXppFf+RrIdeMGtx4xVZKHMgXB03GXGqgEfeHTrkABzvfRL14?=
 =?us-ascii?Q?r3Ealml/wiOvK7iXQAvxJ765+YB75pWv0mupg7t4/ELp4eFjIgZzIwEk5i1F?=
 =?us-ascii?Q?/r2Sf67dXc6hKNYVaU+4rLUpdDcXo0blvjlpJNwymmR4hxNOWBVn4PIq1fMq?=
 =?us-ascii?Q?7zzxqBR31CKPKx1EAw2nN+gaWXpEKIbuTFJkLs0R7mZM1XxqGQDyF40VYDLi?=
 =?us-ascii?Q?sDXPIsZnS438ZWUlrPuNCwuA+r18NgM1OO64DtTT9Qh40WwHY6snHFJGfRxH?=
 =?us-ascii?Q?yohlTyXsXPlcPOBHYfcN0nA18RBgDfnevqM8O3O46CoC0rQdYx9VePe5Nd89?=
 =?us-ascii?Q?TjkJ4QeBCzoPu1mw3RgaZocDTIFYBtBISV7QVl5qeu/gFSGWyW57J9opaWNu?=
 =?us-ascii?Q?NSfScZ34YFIV+f4ZmbvCwrJNUeocITV2hsIiqJU+9I45PV8DQySm+5+OeE+B?=
 =?us-ascii?Q?+shyNEMEMY1IKpHeFAb4YudOGOGeO4lglv3kpUbqAcRrxGcR/z5mDHb54R4k?=
 =?us-ascii?Q?lw6RXNsoD2J6IW2wP3vEdTjvjROTZJlHPaxFwoHzfVps0QC6xMzzvs5anMaU?=
 =?us-ascii?Q?Wh6g+0unc8D0QPCo/4lfmtb6zupkLhggHnImgP3GzgRu12xr6xywZR6wtUHy?=
 =?us-ascii?Q?VeKPclgtNQrbNmjCewYEwmt+MqPdA+cBnY21w3tevWf4xcy73VRKZSeeOLZl?=
 =?us-ascii?Q?eU0wa/twsGy7wVlxPOaoJPgKXkNTuIEkv4RhZfJbN3FHoRf85hdd/yz4dPOI?=
 =?us-ascii?Q?VTpah13xejaMvN9pw2Dly+aLep/rg1U3zcbLRc83s9LeC07NvtzdxCPZlVWN?=
 =?us-ascii?Q?wHRaoL8fSNjPoLMucHXR1kTsQpySvcvogln9e9BEVmNZGKbR79Y+3r4i5ZNR?=
 =?us-ascii?Q?tT3wiyyLpbTwo9lCKQ5Y8adc22wQJKCmgfUxHbAeoCdLpS/J2miRkosrJ9kW?=
 =?us-ascii?Q?KTwAXclRI+2/88fePrnjGdkhFwqsPcP4dKmIhJ7Nh8ebFV8AtdL1S36zEucn?=
 =?us-ascii?Q?72s5d7bmWoEmTmHkdcrg+7zDQox9MbbpEwEeevBUL+HD9l5Anils2EBgVB0P?=
 =?us-ascii?Q?gmwHvgbZeszH9BXZFZnpCdmil3H3vj+wtzjKb9KvGa0dEK+rBMhMtqiDoi+m?=
 =?us-ascii?Q?Uo1PPOjpZ9NUHReFiKYq/QIt/k8ipgYbinHkTH6PY4In0fMiJpSWM6PslJ6J?=
 =?us-ascii?Q?knmH/PlKFKr9uo9P4aNFd2pg6noLLic/thvCihwyraHuNsVwy7pJOrbv3xAf?=
 =?us-ascii?Q?eyp4CGGJeZY/Bwu/mV2/S6ExU+4/UpyimbP/zfez2+kaIWHcDhMJtp+Loeqe?=
 =?us-ascii?Q?V9m+7PNZbicMm2snqaADNj4hQK4XuERXec19OtHU+NI9JQZzc7niniU62ERF?=
 =?us-ascii?Q?Yj1oaXUM6nE+HMdWhckKs4lXdLBaEDbnSFq/RJbbD3Rf1E47HxStWTNBvO84?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6a9487-d758-4c51-86bd-08dbf0f61166
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 16:13:04.9088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mTHJled8JcyO4dyv2NPV6GzBfSjJguB3/nfLr1s0ikSwbzurne08Zp095pnzjjq8NTh4dzxnlau/fHIj7eADwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] RFC: drm/xe: Return correct error code
 for xe_wait_user_fence_ioctl
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 28, 2023 at 04:25:14PM -0500, Rodrigo Vivi wrote:
> On Wed, Nov 22, 2023 at 09:51:42AM +0530, Bommu Krishnaiah wrote:
> > return correct error code if exec_queue is reset/engine is hung
> > remove the num_engines/instances members from drm_xe_wait_user_fence structure
> > and add a exec_queue_id member
> > 
> > v2: Addressed the review comments
> > 
> > Need to validated the changes
> > 
> > Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: Oak Zeng <oak.zeng@intel.com>
> > Cc: Kempczynski Zbigniew <Zbigniew.Kempczynski@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> 
> This patch here needs to replace my patch in Francois' series:
> https://lore.kernel.org/all/20231122143833.7-12-francois.dugast@intel.com/
> 
> I finally saw some sense in some engine information in there.
> 
> Brost, thoughts?
> 

I think the uAPI change here makes sense, an exec_queue_id is included
so if that exec_queue is killed one way or another any waiters on
ufences using the exec_queue are woken.

Matt

> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
> >  drivers/gpu/drm/xe/xe_execlist.c         |  7 +++
> >  drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++
> >  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 60 +++++-------------------
> >  include/uapi/drm/xe_drm.h                | 13 +----
> >  5 files changed, 37 insertions(+), 58 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > index 5ba47a5cfdbd..84ccf7242247 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > @@ -206,6 +206,8 @@ struct xe_exec_queue_ops {
> >  	 * signalled when this function is called.
> >  	 */
> >  	void (*resume)(struct xe_exec_queue *q);
> > +	/** @reset_status: check exec queue reset status */
> > +	bool (*reset_status)(struct xe_exec_queue *q);
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index e8754adfc52a..3b390f047108 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -446,6 +446,12 @@ static void execlist_exec_queue_resume(struct xe_exec_queue *q)
> >  	/* NIY */
> >  }
> >  
> > +static bool execlist_exec_queue_reset_status(struct xe_exec_queue *q)
> > +{
> > +	 /* NIY */
> > +	 return false;
> > +}
> > +
> >  static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> >  	.init = execlist_exec_queue_init,
> >  	.kill = execlist_exec_queue_kill,
> > @@ -457,6 +463,7 @@ static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
> >  	.suspend = execlist_exec_queue_suspend,
> >  	.suspend_wait = execlist_exec_queue_suspend_wait,
> >  	.resume = execlist_exec_queue_resume,
> > +	.reset_status = execlist_exec_queue_reset_status,
> >  };
> >  
> >  int xe_execlist_init(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 9e9e925c7353..e13792e49a67 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -852,6 +852,10 @@ static void simple_error_capture(struct xe_exec_queue *q)
> >  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
> >  {
> >  	struct xe_guc *guc = exec_queue_to_guc(q);
> > +	struct xe_device *xe = guc_to_xe(guc);
> > +
> > +	/** to wakeup xe_wait_user_fence ioctl if exec queue is reset */
> > +	wake_up_all(&xe->ufence_wq);
> >  
> >  	if (xe_exec_queue_is_lr(q))
> >  		queue_work(guc_to_gt(guc)->ordered_wq, &q->guc->lr_tdr);
> > @@ -1392,6 +1396,14 @@ static void guc_exec_queue_resume(struct xe_exec_queue *q)
> >  	guc_exec_queue_add_msg(q, msg, RESUME);
> >  }
> >  
> > +static bool guc_exec_queue_reset_status(struct xe_exec_queue *q)
> > +{
> > +	if (exec_queue_registered(q))
> > +		return exec_queue_reset(q);
> 
> probably just rename the original function and use that directly.
> 
> > +
> > +	return false;
> > +}
> > +
> >  /*
> >   * All of these functions are an abstraction layer which other parts of XE can
> >   * use to trap into the GuC backend. All of these functions, aside from init,
> > @@ -1409,6 +1421,7 @@ static const struct xe_exec_queue_ops guc_exec_queue_ops = {
> >  	.suspend = guc_exec_queue_suspend,
> >  	.suspend_wait = guc_exec_queue_suspend_wait,
> >  	.resume = guc_exec_queue_resume,
> > +	.reset_status = guc_exec_queue_reset_status,
> >  };
> >  
> >  static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
> > diff --git a/drivers/gpu/drm/xe/xe_wait_user_fence.c b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > index 4d5c2555ce41..97af879ee923 100644
> > --- a/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_wait_user_fence.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_device.h"
> >  #include "xe_gt.h"
> >  #include "xe_macros.h"
> > +#include "xe_exec_queue.h"
> >  
> >  static int do_compare(u64 addr, u64 value, u64 mask, u16 op)
> >  {
> > @@ -58,27 +59,6 @@ static const enum xe_engine_class user_to_xe_engine_class[] = {
> >  	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> >  };
> >  
> > -static int check_hw_engines(struct xe_device *xe,
> > -			    struct drm_xe_engine_class_instance *eci,
> > -			    int num_engines)
> > -{
> > -	int i;
> > -
> > -	for (i = 0; i < num_engines; ++i) {
> > -		enum xe_engine_class user_class =
> > -			user_to_xe_engine_class[eci[i].engine_class];
> > -
> > -		if (eci[i].gt_id >= xe->info.tile_count)
> > -			return -EINVAL;
> > -
> > -		if (!xe_gt_hw_engine(xe_device_get_gt(xe, eci[i].gt_id),
> > -				     user_class, eci[i].engine_instance, true))
> > -			return -EINVAL;
> > -	}
> > -
> > -	return 0;
> > -}
> > -
> >  #define VALID_FLAGS	(DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | \
> >  			 DRM_XE_UFENCE_WAIT_FLAG_ABSTIME)
> >  #define MAX_OP		DRM_XE_UFENCE_WAIT_OP_LTE
> > @@ -130,14 +110,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  			     struct drm_file *file)
> >  {
> >  	struct xe_device *xe = to_xe_device(dev);
> > +	struct xe_file *xef = to_xe_file(file);
> >  	DEFINE_WAIT_FUNC(w_wait, woken_wake_function);
> >  	struct drm_xe_wait_user_fence *args = data;
> > -	struct drm_xe_engine_class_instance eci[XE_HW_ENGINE_MAX_INSTANCE];
> > -	struct drm_xe_engine_class_instance __user *user_eci =
> > -		u64_to_user_ptr(args->instances);
> > +	struct xe_exec_queue *q = NULL;
> >  	u64 addr = args->addr;
> >  	int err;
> > -	bool no_engines = args->flags & DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP;
> >  	long timeout;
> >  	ktime_t start;
> >  
> > @@ -151,35 +129,17 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  	if (XE_IOCTL_DBG(xe, args->op > MAX_OP))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, no_engines &&
> > -			 (args->num_engines || args->instances)))
> > -		return -EINVAL;
> > -
> > -	if (XE_IOCTL_DBG(xe, !no_engines && !args->num_engines))
> > -		return -EINVAL;
> > -
> >  	if (XE_IOCTL_DBG(xe, addr & 0x7))
> >  		return -EINVAL;
> >  
> > -	if (XE_IOCTL_DBG(xe, args->num_engines > XE_HW_ENGINE_MAX_INSTANCE))
> > -		return -EINVAL;
> > -
> > -	if (!no_engines) {
> > -		err = copy_from_user(eci, user_eci,
> > -				     sizeof(struct drm_xe_engine_class_instance) *
> > -			     args->num_engines);
> > -		if (XE_IOCTL_DBG(xe, err))
> > -			return -EFAULT;
> > -
> > -		if (XE_IOCTL_DBG(xe, check_hw_engines(xe, eci,
> > -						      args->num_engines)))
> > -			return -EINVAL;
> > -	}
> > -
> >  	timeout = to_jiffies_timeout(xe, args);
> >  
> >  	start = ktime_get();
> >  
> > +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
> > +	if (XE_IOCTL_DBG(xe, !q))
> > +		return -ENOENT;
> > +
> >  	/*
> >  	 * FIXME: Very simple implementation at the moment, single wait queue
> >  	 * for everything. Could be optimized to have a wait queue for every
> > @@ -202,6 +162,12 @@ int xe_wait_user_fence_ioctl(struct drm_device *dev, void *data,
> >  			break;
> >  		}
> >  
> > +		if (q->ops->reset_status(q)) {
> > +			drm_info(&xe->drm, "exec gueue reset detected\n");
> > +			err = -EIO;
> > +			break;
> > +		}
> > +
> >  		timeout = wait_woken(&w_wait, TASK_INTERRUPTIBLE, timeout);
> >  	}
> >  	remove_wait_queue(&xe->ufence_wq, &w_wait);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 88f3aca02b08..ae2457dc30ad 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -962,17 +962,8 @@ struct drm_xe_wait_user_fence {
> >  	 */
> >  	__s64 timeout;
> >  
> > -	/**
> > -	 * @num_engines: number of engine instances to wait on, must be zero
> > -	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 num_engines;
> > -
> > -	/**
> > -	 * @instances: user pointer to array of drm_xe_engine_class_instance to
> > -	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
> > -	 */
> > -	__u64 instances;
> > +	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
> > +	__u32 exec_queue_id;
> >  
> >  	/** @reserved: Reserved */
> >  	__u64 reserved[2];
> > -- 
> > 2.25.1
> > 
