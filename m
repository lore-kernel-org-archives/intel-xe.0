Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB7B10F2871
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 22:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1B410EF87;
	Fri, 27 Mar 2026 22:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mq3UbmOw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5700110EF87
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 22:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774649518; x=1806185518;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wE9SnCtzH485ensPakh8KcBlGHPm3OAy+UHw7wep2Zo=;
 b=Mq3UbmOwe7ad3qKtFrl0QOMWico19+oFmDdDhLSOXY7iOot8Svb3x0/Q
 WOqNs0Kj4SXsxUG74imr2XboqBxbvGUP5y7pnrZkY4cSaQ6I0QybLtfsI
 muxHbCGu0mYUHG8rhJ3zyaYH7gqs7MZuNWFfkGyv9yo9HUnWwzFwtXMQV
 JSyugbRTvIQKn4762Wa9rm6J6IC675Q8CHLPzhOoGpwn62E4q7dpE2tHv
 KhGDufHOGEJUXHWcHCmrhnBwweb8jimfsFl6iFSX2m7MO7dyTA+RYTO3v
 a7hvxgvDm4I5Dfmc6+ktJvUJmzV8v/BJ32FNx3iHz/dQoSQ+mrk6qmvAg g==;
X-CSE-ConnectionGUID: CTJ9FQsUSHiWl9evK3iOTA==
X-CSE-MsgGUID: ZyE2mEN9QE+Be84AbYuaeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75844044"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="75844044"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:11:58 -0700
X-CSE-ConnectionGUID: fai3NWBjSWW7VnqtOnHihA==
X-CSE-MsgGUID: Gs7OSsFHQp2j4WYrJZ2UTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="220581716"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 15:11:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:11:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 15:11:57 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.57)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 15:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OArRtMTWp60YqUpmkqs1cF30I1ppzJ562NI2wqG5qyr3qzO+C83Y1sX7o3uVwU7w2lK4RuPGr+qXaLpg9fT1GWc+upl7JmXSG69GyZ/Kgx4tzytoFzwacelD5VBlrsl86s8sghH8TEambY6Bw+0tgK7h9sgG2ZtH/P+oLrrrR4DBHoRMPF61NcXbOsu/ZhjKfW5+dFfg/QnHodXnknLSJI0wXQMkfzA8LL7XmqH44iXNBmx9JN6x6YXDtf8P6qlVtIB5Iztz6/4d5rTyET82lTc74im6ahCwdotAWemd8VJ24+OotTDlid7NdWxoKzW4QXrvgmt/W0gaxMc3UVUyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12zdwGmFQZKzNKXtN27YbStpoQbCM97CbvNyO6MStgs=;
 b=RVokP1tucLJPa0UAakpd3r4rHeaxzU8IBKuhVEOkXCk1zgxa2tRxTpMC5jtLZiEIzoAM+tSp/Z7tWoXiKUkeLhxvtaGVBhOrDusjxMnd4xBQxnZDZb2RhKIe5p/dxd7j8h4DZftegEprtfHEYNscsNvpCSnU0gTWPnU+TSdK5uSs+zaqFUnVjqS3nofiVb2Ou6qEXdYuzGWxGAdme2DZvpqqWIXz70IX3tFmmDQgYmQmn5sYslkmQvsRmX5sFKFlAcaIG70wyybjv5++i5sLQx9Mc3bEjGjSthiu3iVgw/0gU68RZsKsX+As4FNUWhyM16OEE04PBlbJx76yQGS5fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH2PR11MB8866.namprd11.prod.outlook.com (2603:10b6:610:281::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 22:11:49 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 22:11:49 +0000
Date: Fri, 27 Mar 2026 15:11:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>
Subject: Re: [PATCH v4 2/9] drm/xe/guc_submit: Introduce xe_guc_submit_reinit()
Message-ID: <accAogC8IHidoyng@gsse-cloud1.jf.intel.com>
References: <20260327203620.809353-1-raag.jadav@intel.com>
 <20260327203620.809353-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260327203620.809353-3-raag.jadav@intel.com>
X-ClientProxiedBy: BYAPR05CA0091.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::32) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH2PR11MB8866:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7aefa2-1e22-41ed-d8d3-08de8c4dd7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: LOWLk7mtbdw3utwYD7TurqueK1SPhmMnzxOj5B+CbVXxsQriuqtH7BI2X2Ly1i+gRmwPKoN66EPxfv+1LBZIiLFvDxYV34AodUbXYW/SsqnueodMhENu7IynOW+uMaZClfuqRE7aRNbuAEQ+iBdOeGu4WDjCXqLcqLtmRbLAmjZPfhhQs6N7L/H8NzoDzejyPPx68TMs0qnMhFTY+dMB8ur35F43lsBWyWPHZb4syI7aP8qf9s6YEpGBlDAclGlALmgRv3Ahx8wC9xRHNhnKniQGxiAyDfr3RDeS4so01UIM/9IFXNYhSixhngdVaAYwrAkObOOVJZ+4OoSEdFWguvI6GmXW9hs1DWwoBCNaQtUHrRREkLie6kdXnC6F0yI3KIDSiQohAH5egmfrq27RIE0WzHXihrfjsrdGm9xtQ1xpCROZF9iYS4mBfeqG0fctJBXHTi6WNekLOChpgFfXCTflkv273yzvNfegyskc9auwBtSAkaGfKlOYQw/JN8jd74QFexe6H7WyWHG0DePu7Uq/bLszIzJWAi1ykrD3tc3WI5gFWv3262eMHO3RhcXPzj3OYS+HAUs+UxEUQOnP5/wM+dU+4AYIjngbFRbt2FafPiv/0OK6SyrMtpf6PNi/DdouH2JPCyAdYR9mY3KXSoQSzknTVGOO0hiWz0VPHx56O2aTpoDor3hr2AQv0p//cPX4KiZapfUkeOPzhbrrPiqPBl+b9j74iRZhQuVClrU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tbsuMOrRd6oGLB9V9y0T4lhDQK+Q/vyxPWVwt37WTgm9Z3lMMn05bcpu8umL?=
 =?us-ascii?Q?6BFv7rZ8Md5adgh/3brXB3oSuNtJnWNKXjPp+ljyeHLQf3pb5fZG8lGhM0dS?=
 =?us-ascii?Q?nNHSvsHMYo/6welA8DUzEthjNpamFW5Z5jJa+2Y8qTTv3pTke2cmWW9TkaTs?=
 =?us-ascii?Q?lRhKTtXCOydz9epnhn35dCiyNcvwgAPuAP19rQiZq1qhLIWVW3wFPRWJUxuy?=
 =?us-ascii?Q?T24S1NPUXxYyNjPxLN2zcHQC7okbEtd7HipO7jUCperFlAzDOvDpnJMRG6D2?=
 =?us-ascii?Q?w6YSQZFQm302Nb9lXwX9l93PJBysnVkFd8MHyZXXTv9A2JgUKbDg5KvJsqG7?=
 =?us-ascii?Q?Qq+hd0FpI4WhWIbWuGmGJAwX3osr2vN5+gZb9xNZfAtMIeXITIb8fhf42hgf?=
 =?us-ascii?Q?BS7UfaU/dM5naHZEs4Gl14XHsTVFQELJV3EdV1aArP7L2tyPve4KFOh7UxPk?=
 =?us-ascii?Q?i9FtTMyK2XfrFQZIzSwPfbner+F+93J80rNMCdHQqfsc7Tm3Aw2FKpsH8GwW?=
 =?us-ascii?Q?3Z3bEVJFdLkPqDg3WCWe0AxD2PDOF+dfH5ZMVuv8YrpEr5querp9yWDStbVV?=
 =?us-ascii?Q?dsttTeC/rF3dRYy3jHq1CCikOD2QxM74K4SMgLeuz9++mw3BemUJqLGj9cOB?=
 =?us-ascii?Q?LpO/fWzFPc2QALoGHeUY/Eudb9s2PQ7+pdJC7XUAU3Hd5E3c6HBs3peMD2o6?=
 =?us-ascii?Q?XG9gJoPHCfJ4m8vkky6lNSz7MJqWrWBFWRtYT9kIs0QUV2jGjKDYE0MCd9cD?=
 =?us-ascii?Q?yKImxzB5vOE65n8CNO4HFyChoOhUjWdJNrFSZYOyFhKpaiA1cA+DV2wtbKSD?=
 =?us-ascii?Q?HaREGAZsdmFKUz2UaZauHKVhJoICoGTFCwGhmqitR3ySpteOm+W1QibSinSG?=
 =?us-ascii?Q?+V6g1UQyL8oUvRYXeNfmhL5PVfZru1Nqwj2s8OKBdWbNvAhieCnV01gfcQnt?=
 =?us-ascii?Q?lhM6I3ii/BoKxLOABmygTfMaGKsY072grlt6g0B4ZZNoF6Z/nVH2e55MpoIC?=
 =?us-ascii?Q?gI2xGlsd2FdTDtsC9yzwfMk6lLEAOL1g1VCQHijewzRfCFlIsrCkpja0l0EO?=
 =?us-ascii?Q?nyJnYXV59oTyMHbAmBwHingNsDP+VTDGipADGC54wNV4iyBruNJ0XpfWQGRS?=
 =?us-ascii?Q?uscNvCBxmCl+Fo0QgBjoxq0+L3MGPWodBJqo3t6tFwCWxgaWKxEzJRNWks5A?=
 =?us-ascii?Q?M9sOJx60Xe5qf6E+LKLSZBuF5xZoEpqqcZToo/9f3LXfMaiAF7K7Wrs2Uszu?=
 =?us-ascii?Q?Snz09I9Fu5LA/P6cQ5l8rlTemVPDSWSFVizK6d5Q6sNzSya58gK+wAJgFPF9?=
 =?us-ascii?Q?Eku8FEXODlQSPT8+nhinXIyqvQ9vHXLNpmj3i4l76ts2qY08YB0BqxRriH/s?=
 =?us-ascii?Q?h/tyq2BYU3ffxxlJyPT5RyJdqo7auFQTC7ongQbz6iN2BUv4UqW6gOgxzEcP?=
 =?us-ascii?Q?OsSrYSJt1QtqCc6+kzrdBJyVG6tzAn+aZSF4GukqesKqqpY6qID683NPaPNe?=
 =?us-ascii?Q?kndY1LNMAbTqQc0GYQICGgFjlARg0gc+63OuppSPbLvkMhgNfGSBDTQXTCDG?=
 =?us-ascii?Q?xoBJaF+T39L55cOSyfcGKFbg64Rdce7OTbdV7Ha46kLvpdlYEXnF7wkvW51W?=
 =?us-ascii?Q?5LnY6ZNI3OxQ81V2lWYRYvJF2xAaekFlli3MwJWDen4NOnXTuJfb0xcPBvwG?=
 =?us-ascii?Q?/guQQt7ZCOY5ZP6fLxsA6kKh1PbhSsvvpJItSjET6wmPyNpGQThCSFcGJ8Cy?=
 =?us-ascii?Q?P4UcOW0iqn65BoL9h7H9XzZS6PJJWXA=3D?=
X-Exchange-RoutingPolicyChecked: SCWbLyXc+BekviKgJTtSdE0SZWuuzw2vfHsO0Qlmzd0FhHH/sNmHcmNSq3uPOF75rh9HUhmkh5uNRNKvkoT9+FBCErmNa2ojNh3LmgSIZsIEJ2FKmlImrAD38sR4WtXefrzn7JdPXJc/s2fhnW9/mZlU3sM3bV8/puMopiZoK5StdnEjqGiCGeI3YxG/2zTowoxgG4S6m+84zpLfc8d9V+adQhxblGeSougnvv9TbrtvHYPXM89gJlDnnlutf74lwT4QO/aIxv7L45+yZrLSLA5ijPvRlKI1JEIhmtcVbdMWUaNFVECywzhswX9E7xACBIQ/OBbaHxh0qA6VZr5SVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7aefa2-1e22-41ed-d8d3-08de8c4dd7de
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 22:11:49.6876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yi5iuLbUt4CwlKbKFqUsr/mykxCrz/+nk/c/xCz1D/3s4tDRbwLdbLIi64kYTtfbqzK8MrVxrHsd+fbnDOnYlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8866
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

On Sat, Mar 28, 2026 at 02:06:13AM +0530, Raag Jadav wrote:
> In preparation of usecases which require re-initializing GuC submission
> after PCIe FLR, introduce xe_guc_submit_reinit() helper. This will restore
> exec queues which might have been killed before PCIe FLR.
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> ---
>  drivers/gpu/drm/xe/xe_gpu_scheduler.h |  5 ++++
>  drivers/gpu/drm/xe/xe_guc_submit.c    | 35 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h    |  1 +
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 664c2db56af3..1e079ca3891c 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -51,6 +51,11 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>  	drm_sched_tdr_queue_imm(&sched->base);
>  }
>  
> +static inline void xe_sched_update_timeout(struct xe_gpu_scheduler *sched, long timeout)
> +{
> +	sched->base.timeout = timeout;
> +}
> +
>  static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>  {
>  	struct drm_sched_job *s_job;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a145234f662b..c92bf42b8d3d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -193,6 +193,11 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
>  	atomic_or(EXEC_QUEUE_STATE_KILLED, &q->guc->state);
>  }
>  
> +static void clear_exec_queue_killed(struct xe_exec_queue *q)
> +{
> +	atomic_and(~EXEC_QUEUE_STATE_KILLED, &q->guc->state);
> +}

I think you'd want to do an atomic_set(&q->guc->state, 0) as we need
clear everything.

> +
>  static bool exec_queue_wedged(struct xe_exec_queue *q)
>  {
>  	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
> @@ -347,6 +352,36 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  	return devm_add_action_or_reset(xe->drm.dev, guc_submit_fini, guc);
>  }
>  
> +/**
> + * xe_guc_submit_reinit() - Re-initialize GuC submission.
> + * @guc: the &xe_guc to re-initialize
> + */
> +void xe_guc_submit_reinit(struct xe_guc *guc)
> +{
> +	struct xe_exec_queue *q;
> +	unsigned long index;
> +
> +	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
> +
> +	mutex_lock(&guc->submission_state.lock);
> +
> +	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {

This is will reset user queues too which I don't think is desired as
those should be torn down and cannot be reused.

We really only to reset kernel queues.

So how about a xe_exec_queue_ops reinit...

Something like:

static void guc_exec_queue_active(struct xe_exec_queue *q)
{
	xe_sched_update_timeout(sched, timeout);
	atomic_set(&q->guc->state, 0);
}

Matt

> +		struct xe_gpu_scheduler *sched = &q->guc->sched;
> +		long timeout;
> +
> +		/* Prevent redundant attempts to reinit parallel queues */
> +		if (q->guc->id != index)
> +			continue;
> +
> +		timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> +			   msecs_to_jiffies(q->sched_props.job_timeout_ms);
> +		xe_sched_update_timeout(sched, timeout);
> +		clear_exec_queue_killed(q);
> +	}
> +
> +	mutex_unlock(&guc->submission_state.lock);
> +}
> +
>  /*
>   * Given that we want to guarantee enough RCS throughput to avoid missing
>   * frames, we set the yield policy to 20% of each 80ms interval.
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index b3839a90c142..a40aef196cbf 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -13,6 +13,7 @@ struct xe_exec_queue;
>  struct xe_guc;
>  
>  int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids);
> +void xe_guc_submit_reinit(struct xe_guc *guc);
>  int xe_guc_submit_enable(struct xe_guc *guc);
>  void xe_guc_submit_disable(struct xe_guc *guc);
>  
> -- 
> 2.43.0
> 
