Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D8ECC6B38
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 16:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD9110E2BA;
	Fri, 16 Oct 2026 16:22:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A13B10E2BA
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 16:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792167739; x=1823703739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QPDBSF775JMHuoznF+hMm0s+EMHjtfm7VVNBrkvj0VA=;
 b=YeLLjdWTCjzGu6A5s2G7L7ftjgFsCiHK6Cmx9ldYB3qU5jClOiBmHGVi
 QjlvoGhdJ9meb85Lp2PCptxMjdlq3nshosBqrGYIBlgRN9nNyiaQIIL6K
 RL2X7v4he+ndmWMro2fYB3c6F6zVn4Ed0wfs3+ksCTFhtcSnY9YnWoaP7
 UHKsIrDGGt2c0LonkZpSIVvIs+oPY5z06dST3tbDLKLT4vmB/+JPeopFG
 0awpGZHX/beoqAHkRACxmNKtc6+nOb9D76WLU/DgYVWv36SWU1pCsSpXI
 /bN712atRXDu40pnzDlmseWuUpD8sa+l2wYKHxGYfstMZpr+bc3ZBcThN Q==;
X-CSE-ConnectionGUID: KqT0SOSVQnSMdIjCjoGrug==
X-CSE-MsgGUID: zEH4qRd4T3WfF6EpsSZJ7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="954453"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="954453"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:22:14 -0700
X-CSE-ConnectionGUID: FCSN9TSvQyuetMNZcMBVtg==
X-CSE-MsgGUID: P0nqVN4vQMS7KPFAFYa5Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="2348664"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 09:22:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:22:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 09:22:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 09:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LvLBaGiJeOUGdihbAb5fc76ozecXT6k4Sukiz1JPTIoRQNUW2lIfNwniwJYVXTdGaKI+R4KQKA0AL6ahoabdJardejgR1XAXVrabyvo3hHVPen4/Qcce6I6rnwQB+pukNvcokwnvE+ZqCK3jnIEkDuYAd5sEEVpxtAPH2/LmYO1YglRsGVuzGWdotZppwpHIH8n1NUS1rdaeCvYFIFtQ1op49lYUJ9bgWh9tSfjptA9Z0jaJVeyyChdm4J/pVip8e5sO59LuxR/qF9eN+sLb2i85jG3YLnXaYhZr4fTCQjB3RSjWLYjaxwE5tFiqm6CEPNzB4uZdAQRQ9pnsxmw1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8hCsdeNsxB+qmC8DKaaNghjUFFKB/Cwi4EdTT5LxYM=;
 b=tkukc7ddl7F5GodxKMaU+zxpeb5mvnBpsLIto0SoJOtR57VUZE1n7+NPxVAC5jwU82cJSRu65VDrFyCQ4qJ2Wu3/nWzuWlL5qC0qBxrRBV60lO2AkGmiC1Scsq/lOVQfg1l5/H3z42zBUxcYZRp6OY3J9KGL8gKaB0JaGjpT/AttV2MogoYaDohhZpYSjHtAuqo9qjE4em6rv3vl0HMqEKJmJnOjAnm06vkloQVaiPQAJx1LzYsHLLN3mr09na+kM0neXr1JvhK6sNHI0z+2F6xDKfVm8OBn6xeJ1/82nFCwAtQ7Y+0gjjWmYGxZhX5ao11cKMrO091Qivj1eq5upw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by PH7PR11MB7449.namprd11.prod.outlook.com (2603:10b6:510:27a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 16 Oct
 2026 16:22:03 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:22:03 +0000
Date: Fri, 16 Oct 2026 09:22:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <x.wang@intel.com>, <jia.yao@intel.com>, 
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3 3/3] drm/xe: Synchronously wait for queue kill on FD
 close
Message-ID: <atJPKWl8hPAfPm3k@gsse-cloud1.jf.intel.com>
References: <20261015050136.1069815-1-daniel.charles@intel.com>
 <20261015050136.1069815-4-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261015050136.1069815-4-daniel.charles@intel.com>
X-ClientProxiedBy: MW4PR04CA0358.namprd04.prod.outlook.com
 (2603:10b6:303:8a::33) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|PH7PR11MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: ccb043fe-22e3-4115-9c95-08df2ba19cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10067099003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: 22pnO9Ls4WOSphCRadhpThH+H8ndHeMkamC4QNiw4F7XEMQjyY2c/X7JlG+3Y/yR9NqzAzgqGcNfEtOEbBrsjRmf5Cct9Z4moT5eMYKEyr8LJA/Eo5iiYtJYFVwu0emAKwQv44To6Xob9CfbE4LoH510S9tInAm6WjX4pJuxTXUg49cVAB9KXSTLuKd5zfS4wLV8L+iC3DFvIFMo7l9oB1rf+xnKaThm7GQNBp3RMDYenAXkdVCOyF5DY73RSHtC6aShL08++r3Ez8+BrOKkPYOOm/xLNftolqbRMOusM0Oh+fLiEjetC1ifC9vrzLZa/+L0A/3ra2VHURcymb2/5ABogOdAbcHKHw7mVraWGINfXztWHb9TlNyGUTFgle1h2idWv5TDsfdnG3doVnMhOPC4ZL5OIphsioW/1LVNStkD5T088dZJsITHsjyVrKdsMs6Q7PxQ+gDQ2wvuqkQu3/WsxDEZUjPK7JT/LSwoZ4K7KcPN7VeXfMe7NSBiKIBsF/CjQRfJPaYUglbl2GP0l3BDG2L7S2m4fdYw9hMhwHSqHi4QQO1fGKTSkIsh9S1MJL8M7hrTzhBWjpfAiThiqnTm1l+9OIE1K/UEBnkm6vHKNZSJKmH3J2YRJxVRw3Zu/Tb7/gVJ5HCoyZP2BhfYJ+Xhwzz/+PqxMLnwGMt/PrI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/biAYpK4MQogWat+5UUpqzQ7rPK/NQAnCs71aJWWlOURq6Dmu/h0MJIliT01?=
 =?us-ascii?Q?yweDwy8zFLIAYbicxD3Of87ufNWjUixDP5IJWWs26HmuCj+FReFKLGlVR2Go?=
 =?us-ascii?Q?JFVeIeFyug94cuekSw4CC4e2o23X9HBBVEMjHyr/+tmSncijj1gQ2U93SKxX?=
 =?us-ascii?Q?qZfAnghZHJPkmHG+yNYdsL8wimAExsJ1TYqW8aUZZKCndVD0AgebsshNK19y?=
 =?us-ascii?Q?4I/sV0XepcjZc4L5/ezgSgXMeAvy/i7gxPU2ynhsoDa9MfEGgY8R5xjyCkgh?=
 =?us-ascii?Q?KjCtwkdXeA7grzxYlzhtOVOQqaHS0ViR1PllHfcTxGF7UqJt26IFcQ8gOqmG?=
 =?us-ascii?Q?2lyFSPlRbHKP/OvrR8/jRng5PXh2OqS3ajouq+UuUGFNX7EdkhGp+q3z/Zbj?=
 =?us-ascii?Q?fJ+EVdP7ib5rkeGS9CH1a9+hpUf9P5XVp57nmBhCSdFDUWtYxIfrAZTHgpNH?=
 =?us-ascii?Q?XpHjxaYE/8MNkpWzS0pCP3KPgF7gVTqTn+8Uik673dzYSeI+1s2/39ooJkXA?=
 =?us-ascii?Q?FwkRYV0z70v3dAfKPmYrJY9ecrm+79jtbwsVVQsujH4VCEu2nlO5jC4FpRFK?=
 =?us-ascii?Q?z9uVegbbrOJaNSeYdlA9MIzhhrzsBec+p5Fovw4g/cdy1+Etm3DYZyGJCrqU?=
 =?us-ascii?Q?SF056e9hwBAlBh0uwL3ebAyYAn7mKiwxL0GsIHMXFYhj+VGqoGS6KdBPT7qS?=
 =?us-ascii?Q?kFGFYRN6DxKfc92yIxdXiUHz/UuxQcBVqrBgtPujlrTCD507lTXIw17qWAmY?=
 =?us-ascii?Q?YOEQI+DbNDjNCX/9i1+/XrtVhEkChwzHVe7IMQgjdZ1niHucPEIAFhNW656m?=
 =?us-ascii?Q?UYBomq25O6J3Jj+zkOWIArTNENmHZ5rvR3rOrDiW5p+4d3p7OJA16wPto8ZH?=
 =?us-ascii?Q?vYg4FQpk/PDMSBL13XZjN4q6gB9Di41kli4uJIevWvlqzB3XX86U8ycPcVwM?=
 =?us-ascii?Q?QHTYvx+gctMOnuGJE2fUPkyFOKx/MdiEcp5p+Pyc9TV5ecxEiiJAIiudYAUE?=
 =?us-ascii?Q?M5UtC66NBETw3HcylzJIoE1qVjGl1qlgHVpSwmQaYyB5OqKwBVjw15HVZh2j?=
 =?us-ascii?Q?uwR+8vAi0upfPPopZFYzMEaGGSy9jrsTj6tyc0M5fusQxWtWjKVhpu/VYrAf?=
 =?us-ascii?Q?kJlcIuzDDoZvPMXTjjJA/piHyV2RbSr18lBi+OpAVmqv7ZwkwS1rw3Kn6h8g?=
 =?us-ascii?Q?n6kf+GylNJL77AfaNzlMxCp9brMsg8XcpmSuYw/aw1mR/H99fCsWUyhxHGvO?=
 =?us-ascii?Q?AHRS/1Wwx769mDjuh8nPLc1i+JnsupHfBwCn1E236YBLv9An81ueH/+UtR1m?=
 =?us-ascii?Q?aW22oR5x8QBQ/O4cUsLtP0OtsnhR3nAGmDwy55ptD5wJko8dng+1CTbcRhI3?=
 =?us-ascii?Q?XB/pC5YLJBVS7VNvKkEp9DDzFq0fiuYCDY0XaYhmkRta4pUEgn1U3yITIXBe?=
 =?us-ascii?Q?/N8Df2GRbTPjDQB/HjYVJG9qJ5IEyDRHZp18iWZ1G2ytExo3fJmwepnPwKpp?=
 =?us-ascii?Q?ltDbWa2y9H+AroSeMNZtULZo/fX+E5foWz8r4qpO9rFQVJKFAL4WH4lkyKmv?=
 =?us-ascii?Q?YRoA8KIj85bFBrL1p3hXcCUd1jWHFw4In69JzwbrMKtJQ5a2WO4ir0vxpiDP?=
 =?us-ascii?Q?my72roIqh+cSz9/OK4S+e6E/UY6X4Q50zCMB9YYuEqI+sp3NYrBE6tPvSXMM?=
 =?us-ascii?Q?MbF7dudt94yDZY4iscDmNbpU+VU5wc5bXCpRbPLiQqEKhcvRxOlCKTRQfOFd?=
 =?us-ascii?Q?/HZihdUjVg=3D=3D?=
X-Exchange-RoutingPolicyChecked: aTctC6QUTmsEunNy57PN+5Uq1FVtZxykcFvdXe0SLNo+APao2pnAktncYu6r+A54USb1kEldHMgeQi7j+F0YnZyc4hlqVMpBfL2DNJO5ZujoMfeLqkgWk+UD4KS6JyOvUS4TP6rrgcFlZ9LlhXnyuDEMz9gQXndi9O91ivZGmyzqIY6RazbpRLixlKmBOgcHD2SK1WvRzGJ+8f43iJxMKl+aqNpHtrbUZV+O26Bdrrfb0WDHV/lLIyhBDMGdvosNCZAjeYhpISvoQfVXDHEZjEJO1Yj0f0Hp20pxpnYxCo2Rx/zZvPiIdBrVQV8lZdWUj5r8IdMVNRtB05aeYry0vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb043fe-22e3-4115-9c95-08df2ba19cc3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:22:03.1709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3zY868Hf9rUWxymsvhZTBflJt3eCk2CcffGLO/eSeIv7LT2GQWsMssgLsRscJQWGTtYI6yze7PcMB4AtxZ+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7449
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

On Wed, Oct 14, 2026 at 10:01:36PM -0700, Daniel Charles wrote:
> The early KILL message disables GuC scheduling outside the serialized
> TDR path, but xe_file_close() does not wait for it to complete before
> dropping queue references. GuC may still schedule contexts whose page
> tables are being torn down, producing CAT errors and engine resets.
> 
> Split FD close teardown into two passes: first kill every queue so all
> KILL messages are queued in parallel, then call the new
> xe_exec_queue_kill_sync() and drop the reference for each queue.
> 
> The GuC backend implementation waits, with a timeout, for scheduling to
> be disabled with no pending enable/disable. The wait also completes when
> GuC submission is stopped, VF recovery is in progress, or the queue is
> wedged. If GuC does not respond within the timeout, a GT reset is
> triggered to stop GuC scheduling.
> 
> The waiters sleep on a dedicated kill_wq rather than ct.wq. ct.wq is
> shared with every exec queue deregistration waiting for a pending
> enable/disable, and a workload destroying thousands of queues can have
> thousands of such waiters. Waking ct.wq for each scheduling-disable
> SCHED_DONE wakes all of them while the CT lock is held, stalling G2H
> processing until deregistration waits time out and trigger a GT reset.
> kill_wq is woken from SCHED_DONE handling, and on submission stop, wedge
> and VF migration recovery, only when it has sleepers.
> 
> v2:
>  - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
>  - Drop the flush_work() loop (Matt B)
>  - Use xe_assert() for the killed-queue check (Matt B)
>  - Merge the put loop into the kill_sync loop (Matt B)
> v3:
>  - Wait on a dedicated kill_wq instead of waking ct.wq on every
>    scheduling-disable SCHED_DONE (CI)
> 
> Assisted-by: LLM
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c           |  5 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 13 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 48 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
>  drivers/gpu/drm/xe/xe_guc_types.h        |  6 +++
>  8 files changed, 77 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c48..cf75fa3b8fa4b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -190,8 +190,13 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
> +	}
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		xe_exec_queue_kill_sync(q);
>  		xe_exec_queue_put(q);
>  	}
> +
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
>  
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9a8efa2bf2bfb..8ba2cf45694dd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
>  
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue after
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}
> +
>  /**
>   * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index e8963f85cabd9..4be023b9a4c6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
>  
>  void xe_exec_queue_kill(struct xe_exec_queue *q);
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
>  
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 48c05398b0168..4882eeccb9bd5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
>  	int (*init)(struct xe_exec_queue *q);
>  	/** @kill: Kill inflight submissions for backend */
>  	void (*kill)(struct xe_exec_queue *q);
> +	/** @kill_sync: Wait for the backend to stop queue scheduling */
> +	void (*kill_sync)(struct xe_exec_queue *q);
>  	/** @fini: Undoes the init() for submission backend */
>  	void (*fini)(struct xe_exec_queue *q);
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 37899fcf5b227..bf41f80761f98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -910,6 +910,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>  		smp_wmb();	/* Ensure above writes visible before wake */
>  
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);

Why a special wait queue? We already have CT wait queue and this just a
CT operation?

> +		xe_guc_submit_wake_kill_waiters(&gt->uc.guc);
>  
>  		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 609af66b343d5..559937e584aa3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -316,6 +316,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  	gt->exec_queue_ops = &guc_exec_queue_ops;
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
> +	init_waitqueue_head(&guc->submission_state.kill_wq);
>  
>  	primelockdep(guc);
>  
> @@ -551,6 +552,26 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
>  
> +static void guc_wake_kill_waiters(struct xe_guc *guc)
> +{
> +	/* wq_has_sleeper() implies a full barrier, pairing with the waiter */
> +	if (wq_has_sleeper(&guc->submission_state.kill_wq))
> +		wake_up_all(&guc->submission_state.kill_wq);
> +}
> +
> +/**
> + * xe_guc_submit_wake_kill_waiters() - Wake exec queue kill_sync waiters
> + * @guc: the &xe_guc
> + *
> + * Wake any exec queue kill_sync waiters so they re-evaluate their wait
> + * condition, e.g. after VF migration recovery has started.
> + */
> +void xe_guc_submit_wake_kill_waiters(struct xe_guc *guc)
> +{
> +	if (guc->submission_state.initialized)
> +		guc_wake_kill_waiters(guc);
> +}
> +
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc = exec_queue_to_guc(q);
> @@ -1433,6 +1454,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  			if (xe_exec_queue_get_unless_zero(q))
>  				set_exec_queue_wedged(q);
>  		mutex_unlock(&guc->submission_state.lock);
> +		guc_wake_kill_waiters(guc);
>  	} else {
>  		/* Forcefully kill any remaining exec queues, signal fences */
>  		guc_submit_reset_prepare(guc);
> @@ -2267,6 +2289,28 @@ static void guc_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
>  
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary = xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc = exec_queue_to_guc(primary);
> +	long ret;
> +
> +	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
> +
> +	ret = wait_event_timeout(guc->submission_state.kill_wq,
> +				 (!exec_queue_enabled(primary) &&
> +				  !exec_queue_pending_disable(primary) &&
> +				  !exec_queue_pending_enable(primary)) ||

You don't need to check exec_queue_pending_enable here.

> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}
> +}
> +
>  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sched_msg *msg,
>  				   u32 opcode)
>  {
> @@ -2744,6 +2788,7 @@ static u64 guc_exec_queue_reset_status(struct xe_exec_queue *q)
>  static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>  	.init = guc_exec_queue_init,
>  	.kill = guc_exec_queue_kill,
> +	.kill_sync = guc_exec_queue_kill_sync,
>  	.fini = guc_exec_queue_fini,
>  	.destroy = guc_exec_queue_destroy,
>  	.set_priority = guc_exec_queue_set_priority,
> @@ -2825,6 +2870,7 @@ static int guc_submit_reset_prepare(struct xe_guc *guc)
>  	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
>  	smp_wmb();
>  	wake_up_all(&guc->ct.wq);
> +	guc_wake_kill_waiters(guc);
>  
>  	return ret;
>  }
> @@ -3388,6 +3434,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  		clear_exec_queue_pending_enable(q);
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
> +		guc_wake_kill_waiters(guc);
>  	} else {
>  		bool was_pending;
>  
> @@ -3423,6 +3470,7 @@ static void handle_sched_done(struct xe_guc *guc, struct xe_exec_queue *q,
>  				clear_exec_queue_pending_disable(q);
>  			}
>  		}
> +		guc_wake_kill_waiters(guc);

I just noticed handle_sched_done is waking CT queue before clearing
disable scheduling which is wrong...

This is the proper place to do the wake.

Not sure how this has gone unnoticed for so long. This is part is a
fixes actually and can be done in patch by itself.

Matt

>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index 29abf07d8f041..ab07d73b2b9e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -28,6 +28,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_unpause_vf(struct xe_guc *guc);
>  void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
> +void xe_guc_submit_wake_kill_waiters(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 3dbcb1331690e..3f3138d6750d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -93,6 +93,12 @@ struct xe_guc {
>  		atomic_t reset_blocked;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
> +		/**
> +		 * @submission_state.kill_wq: wait queue for exec queue kill_sync
> +		 * waiters, kept separate from &xe_guc_ct.wq so that waking them
> +		 * from the G2H handler does not wake every CT waiter.
> +		 */
> +		wait_queue_head_t kill_wq;
>  		/** @submission_state.enabled: submission is enabled */
>  		bool enabled;
>  		/**
> -- 
> 2.43.0
> 
