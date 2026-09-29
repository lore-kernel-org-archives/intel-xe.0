Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB797C9832A
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 16:19:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6912E10E19B;
	Tue, 29 Sep 2026 16:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PFE10SoS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8447310E19B
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 16:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790698743; x=1822234743;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+3lgOA0Ds1Jd/Hzw1OZTGJTqvdwUxB71utgSfwMiayI=;
 b=PFE10SoSCYNZEfGBzyliD/nIogyF3FdYu7jz6TFx3OrmP87YwtJObIOh
 FxttmSEpgSITt84oZmrJ8IcHMkyjM74k6i35UYY3NDxzmLxPlcgUJ/Kfv
 4yHjG3q+OtavRZqXRLfT3AoKVyMJQNLbMqVGAFuGvg3afwss1qPaHv1bd
 okvP/xbSt6y4OeHXXW76msKXFaUaq3TZlE0js9agY/ugjCWnLsw4ixHY0
 lbKDOcEbQ3LAFiG7gokaDV8WcmU+GKa+4rxPkV/oLMKwunj9F988eO65h
 wdRQYiJI2V/dA3LJ6IIeUd6xOXkC9tmh9V2AQMUMwHl4Q0d8jovELwcSC A==;
X-CSE-ConnectionGUID: uZST3j0WSF+AEI4gqEq09w==
X-CSE-MsgGUID: wF5FVNc3RGmN2fNZLBxJxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="113209189"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="113209189"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 09:19:03 -0700
X-CSE-ConnectionGUID: p9Jie+FLRgewSHjH3Fc0ew==
X-CSE-MsgGUID: LiEdSKfSQOWbPoJEd0dBfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="279228394"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 09:19:03 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 09:19:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 09:19:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 09:19:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vl70rOyZNotOSrKBY5t/eqdGQYfT9JPQvhw7bmRksOO9YPQnrdcLGWsBq1kfJbA3bohgIcviv1csW9/sOq2q/8WSlZvElXw6DZ0HVndYT5zWWM33Bge+QoprAogJOP4mMYB4CAd2EQTvr4SLrU9KuiBrqcQRCCg+giz8ymofnc7v4PAgAHbCFqQfsnpU36a9D63lTBgDg+hAKFUW9WeMc56rRk25Wmjk0vc2W1IBcf/jMHdGnmUoOtOwRkHRVV5wEmipfmdyszl70UnrlPRfqIcHaES4FTgCFXR/YEIjnnvQLhrv2DCNmpy5cHnZgKm6uuFklNsx51+yPX9M7Ii+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFML4U0H6E4shOukEEleKw9NnC39X7M4sgE8zlB32Tg=;
 b=WusiK8KViDE4bwOBDREiBgDjRWjzF5KXlF5b9RBP31Oaso9KMQxt58kd7tv1obJW3MrV5T2viPtKOuvQ46rRyvGo4q3IC/sTLa41Wb+02B/sSq2s6xGXgf3dvbFaPupJDi0l3lnszLwW2oQoqJkYYHjWPGibjAbnur7iETohFQ+VmO3QCh4/XKjetb+mXByLbZ1b2FfWr9qQ3pNFRkXm9zQQO3A6LDeL6tGbda//beQlXIlrgtCH+80WyPno/G9MmLK+GI1gwIQmN4yNXaWqaPM/CxteVgmBnaLXBjv1wG9pik3gAAdbukK3w377p3x7+lU5zVL2BdV3OlRtqyYVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 16:18:51 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%4]) with mapi id 15.21.0451.026; Tue, 29 Sep 2026
 16:18:50 +0000
Date: Tue, 29 Sep 2026 09:18:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe: Route execlist exec queue teardown off
 system_dfl_wq
Message-ID: <arvk6KeiQLEhMvzv@gsse-cloud1.jf.intel.com>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
 <20260929142910.47480-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929142910.47480-4-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY5PR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::18) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: caec473b-91a2-459a-38ae-08df1e4558f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|260925022911599003|260925021311599003|260925021911599003|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: NkZmLVmH5eF5X0AYhYfrKuuE4Mu7qnDOg9fHRPuKZZyaqmYdWOBaYVp4EaGBLVZtGCjt7UPREKwN2RD9FyMCC0zGokIw/LHtCEG4h/z8Xr7LEZZxb9ZCu2VIan77lugmO+gqADV0UlMv+dRZKl335xK1F8EH5h58sBfOTz+sqPGKS30ALgvcu+JwhnxheZrM2DimZXUM2MIuG0DxoKYBbU5SSSkoRdxQRPyXFFXPf1iNN4ce+Aw2sLy8DTeDkAEFHKcVFtsZFKKIIo2JxfLj4nanMjB5wRcJ8HKWRlNnDV10+05PJrRwe4hGPm9qncAzsFz+jlQB9wxZbKi3UvAaXv76kljboJMUz3p/3KktYctW3gVifQgyMMTaOsaMKQZm2M4E1XiBGK3MU91tXCF5c72HNsec55jNx0w0ofXHUPR8j+s/rJN9REuvk8dVsrhggkGtPqepTDDS82u4JpercpTrHtYKzmudlleX0aunfRmr1SHRfoB9hXjr6ZrLfG3LkxMcS965Xjol5lLHjah2FfltQEC46U8AAHs2ikXbpXvAJ4reZuikSWvGmTASI/etl6Fp/TO8ax7FHj1W8avTlH5feVFNfhTqKmn+XwidKiupDj9Pl14kGNToAcOdqWjwPZA3H9E6XPrRCLvvXbWIR8f2mSiRnUD8DMtEjCYkqNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?iK2E8M+5jK2+SYK52MvoJYIsrvhCWwcHzHkAWp5FuP4xwxRzLctJmTNxKY?=
 =?iso-8859-1?Q?Fpl2T+wDpAlfE/NVZsRYNjuOVgdpVfkn01/hP8DljLEK7B4j8NV6Kg/eYu?=
 =?iso-8859-1?Q?QlRi82BKv48h0DcpiatM8M5VOfPkt/L8ifyFZoqjfhschBnI2dRLbN+WVU?=
 =?iso-8859-1?Q?cOZ9yLYiIn7YSQj+BLaqCjIkRMy37EJlSMIbGzB8DLchk1vTIEa4OO50/o?=
 =?iso-8859-1?Q?49SPGXZ5Ro68uLl8nPBIFMoiTEMb9KxG3k7qeBmu3SxG/+CQbIMsQ7jFRX?=
 =?iso-8859-1?Q?QglICM2qaqsnEodg+HSv5iLLsJKK7hQt6TD0qOpSGPfzz36CdUHek4ZaXC?=
 =?iso-8859-1?Q?soz+uVv6ajBPLhieT0Te02aTTXJBdqIajjI7nzKi/6Pp8rxP+6tf81Et39?=
 =?iso-8859-1?Q?9BLHVwm9/OarDizidPmGtqkEYN35gEaCbWXjhQ/KD8QDCuYiLJEi7TdOi6?=
 =?iso-8859-1?Q?4MKOzuMQ6t/eZrQZysa8kXe8rvJ1pgVUxluTOso2CtYkRvHbFtFDG3boHr?=
 =?iso-8859-1?Q?qL381QWV9eNN4EKiISOMlaouViFUkeRvojBr6wGY6yCGNdLCBtgQ3IC6Yt?=
 =?iso-8859-1?Q?9cTgSC1GiLVFmitnCsNfy3XkEcnRncKeO42+LNYc+5TM4/rMN9KlDUs/cK?=
 =?iso-8859-1?Q?oshLxtZ7C1g2GPWAzNiL54uR1RH1wXfgrM3pVQB1dhdiOQGiSNJExatQXd?=
 =?iso-8859-1?Q?ySzsgoI17f8T0IqC/an8IuGO/v0qSdx726Ox31ldKognj1NiLsdThjgf0E?=
 =?iso-8859-1?Q?Q5F7mNJlINZ99kmnrVCa+kB7P+PynqseMjhLUFPpL/pkV596OaFD1ziHU+?=
 =?iso-8859-1?Q?wtIXoalPlDsTF6NIOeTUuxz5sPOhPLwsIq0OnPJrnsaWLAzKL9WVD1l8Ew?=
 =?iso-8859-1?Q?VMoAScoPIVaF2a88l69Y2iGcM8s+CVopqnBBmAaBOd+/D7S4rxf/BH1BaX?=
 =?iso-8859-1?Q?EWoewyBQMj5aYV5hgioRdO5qmBqR/9qkYgVLJKR3+cc0pqLhqc9G/zYRCJ?=
 =?iso-8859-1?Q?Epo4ZHp7WI+5r9dfoqUWngTuFLYNXtSqJe9Rc2LJ7cp2q6Qx9qnH8A1o4x?=
 =?iso-8859-1?Q?gdZ0L6hwqe9aHU+LWp9nQ33tSJS4ismU4ucDRqwnAYnUvk1cFwA4FCzbfC?=
 =?iso-8859-1?Q?xV7cc0PdqFaDB3D1dFdHJ2zZ1zdQ/nkz248FP3vrsTI+tIVWLUEQv41DfD?=
 =?iso-8859-1?Q?lnWlzlHB44jqtAi8Ws8W4CiyFTW5BAQDgdrBLekBVKrFV1N9ysxT6NZAjl?=
 =?iso-8859-1?Q?CnqgbH2zMDJNj2YzjmbGiCYYeVdpWSLylfvIa6AgAl5mYcYSgq6WlN73Gp?=
 =?iso-8859-1?Q?vXOq+X4yE81q7CCmAu6xf5SsxDcvfBj6F2xg3df1n2W0Y0hTB2O6e/7zXR?=
 =?iso-8859-1?Q?MQ9UdYNk7rgNCPUl/4814sTy2XD3zX7x94+J6Ar0KqDOuCxvJK7Ch5ELlH?=
 =?iso-8859-1?Q?dCNEXHYqrHKVRCikkjupQRl4rHyEiOweISO9JdvVciC3Agz5zuZLwbTk+r?=
 =?iso-8859-1?Q?bDdr2QyCVNTUXwTk48d0H2M5nC5aU03YIm7Du8Lyw1+swLm/K4mQlN+Q1s?=
 =?iso-8859-1?Q?MqPf6cBgJK+PKRTBSgklMMHH8R0A+8Oj4RK5YoXvMk/QEL7OmKrWWhUnOb?=
 =?iso-8859-1?Q?bfJnmFIxMTDjrE8h0zu/T+OutBzXQmqeqpBedfZoyt9cYdxc39ZDe3Eu09?=
 =?iso-8859-1?Q?3HyR+eMEhC/O+0aimEYv/UCHn0gyGIW1oks1ZMKureAlmcrl3m4XhCA9i2?=
 =?iso-8859-1?Q?JiyFp5aLelpMh8pswjxNeKh4hja+ixLk9Og4sOdDTvVGmsi0ws6h5of07T?=
 =?iso-8859-1?Q?ilvdMLF1nQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: NY/KPyWO6ILmPQmj4gv/iArkoCY9utbCqrMNOtfJ8EApm3+bbpMde5KwCnw29bxIcSnVgsdTO1bSA86Da9a4QrFNkXv97grdYik2/Zd22LO/v3YFSJ4u246jX0Xm9qEE9OAAHWGgbrAkHRxTboMgrXzBJAcYmHEiecNsXmpGWrt7UpXR1q3fhxJEKaoUOfPbbVfv5ppU/BwoAeuGr7eB8IYEpzdUYx2xgDWpE5tfEiix6Nd1k6A6+0lWKcxS9PLNWsWtLfyjo3kBDmDyn5e3uuvAAEmJyD6lzMJxxnWyGO/JJqwOc+5DXSs8ua/3YWZuY4bDfLZ0Wy6sD4dic2fH3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: caec473b-91a2-459a-38ae-08df1e4558f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 16:18:50.6523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 20gsFi8X5FPhJ8jjj4iImsYoYgyNPbUKxdlP8h6tvQdoPJ77Y1iSUKnIzwMezN/qTN9Bpu0ZzY6pBZ6szqGr4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

On Tue, Sep 29, 2026 at 04:29:10PM +0200, Thomas Hellström wrote:
> execlist_exec_queue_destroy() defers the final teardown of a struct
> xe_exec_queue (which calls drm_sched_fini()) to a work item queued on
> system_dfl_wq, a global, kernel-wide workqueue that xe has no control
> over and never waits on during module unload.
> 
> For exec queues without an associated xe_vm (e.g. GT-internal kernel
> queues, the GSC and OA kernel queues, and one PXP kernel queue), there
> is nothing else keeping the xe_device, and hence the module, alive
> while this work is queued or running: rmmod xe could succeed and free
> the module's text while execlist_exec_queue_destroy_async() is still
> queued or running on system_dfl_wq, jumping into freed code from
> drm_sched_fini() or the exec queue's own cleanup.
> 
> Fix this the same way GuC exec queue teardown already does it: take an
> explicit drm_device reference across the deferred teardown, and queue
> the work on xe_destroy_wq instead of system_dfl_wq, the module-lifetime
> workqueue that is guaranteed to be drained by
> xe_destroy_wq_module_exit() before the module can unload. Taking the
> reference explicitly, rather than relying on whatever reference an
> associated xe_vm may or may not be holding, keeps this exec queue's
> teardown self-contained and correct regardless of vm lifetime.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Side note - I'm planning on adding a CPU bind backend, once we that we
will have two functional queue backends and I think we can finally nuke
the execlist backend because at this point it just creates noise in
reviews from Sashiko.

Matt 

> Assisted-by: LLM
> ---
>  drivers/gpu/drm/xe/xe_execlist.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index a36db39dcda8..a6984999962d 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_execlist.h"
>  
> +#include <drm/drm_drv.h>
>  #include <drm/drm_managed.h>
>  
>  #include "instructions/xe_mi_commands.h"
> @@ -21,6 +22,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_mocs.h"
> +#include "xe_module.h"
>  #include "xe_ring_ops_types.h"
>  #include "xe_sched_job.h"
>  
> @@ -402,6 +404,7 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
>  	spin_unlock_irqrestore(&exl->port->lock, flags);
>  
>  	xe_exec_queue_fini(q);
> +	drm_dev_put(&xe->drm);
>  }
>  
>  static void execlist_exec_queue_kill(struct xe_exec_queue *q)
> @@ -411,8 +414,9 @@ static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>  
>  static void execlist_exec_queue_destroy(struct xe_exec_queue *q)
>  {
> +	drm_dev_get(&gt_to_xe(q->gt)->drm);
>  	INIT_WORK(&q->execlist->destroy_async, execlist_exec_queue_destroy_async);
> -	queue_work(system_dfl_wq, &q->execlist->destroy_async);
> +	xe_destroy_wq_queue(&q->execlist->destroy_async);
>  }
>  
>  static int execlist_exec_queue_set_priority(struct xe_exec_queue *q,
> -- 
> 2.55.0
> 
