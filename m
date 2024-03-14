Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B7BC54E67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 10:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DE010E797;
	Thu, 14 Mar 2024 10:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQ/I4uDL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1410E797
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710413907; x=1741949907;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ObUFT2xRXaIKDf3acHNbCjQUjr1iHVLDxX2wYNDrVrA=;
 b=lQ/I4uDL13ZUXfIOsPO/5PrFwwpy1BDtfJZnaW/AJ+7+sOSrTVUCZPFV
 ub1QzUf4sHyq4/3ECTuoph1j+YNb2A4ljTmkjtyi09+F3cKmS2U9JET2X
 JgzcANKWBU2uK8I4dDGQsfGAOOByiNiwdC3qDjTu/iXkCNPuUU50hzqff
 tPpFF3OZRXzRK2S0cGr6nIZ7sAZ7Z+YF4QF4vWAYnkgYOsddd6lrZahBi
 RGfeN74ioGMCD0zjovVVE77YWHWxyJX4cEE6r0Rw29485vjX4QlhHyk4e
 byEgU8LRsOFKn04BG81ozxQ1+9VbzYaPeitgNxTpEcCcr38ObsGOi0LsI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="15951063"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="15951063"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:58:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="12647746"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 03:58:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 03:58:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 03:58:26 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 03:58:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR9nalKS7eVv6HXGxM4wLwN000fAWHQrPtx0nW+BOU10kJTmumIVoa4ksAFfr+nBHv3qYQRp3j3ZBwAdbMV0e/rjL1acfDEIRZKK/6P1+R++O+jobGjUyQngf4H7sKr3Omd4MF/wU6NatOKjSCEuveEMO/bk4IYVTlyC1XblhEa9au2LU1zG+lS6utaX7yHVjFnYRUp80zk3SMPh+CrOaLIxZmhK36OXGKOkpPerS7f7Z0J11OlRXVwIkFe4FDT0HAMQ//BxX1B9kMHZUONAV2RAm2UXHfG6e8oPWxAMSlBeU6iLMzRFmi81YWGXqgnH/QjgRXR4CeAh+jviHuQwsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvDAEn8thy2CfpkRSYg6fBlTmps3ndHuFUPeezDNDAU=;
 b=dF4eep9LzPKMmQwylbs8qZ4nmUJc+ayx409Y6CSfyACCoc0LHOP7byh5ZM2BRKNuJkbYWj1117O/Bj5huqZITv4REzmzE6YaLfqm4wfaY8lipkVfOJJIdSUH9sewQvY/zoAaX17f69vlWFk4KpkpgHxadgneDH+KcOkwMXFjXIbU37cWxQwbzxxm2VhS0Myt4zpQ1j2f9E13c/2PxZMYuc5MUkS60eE6Pc4w8RqJQAjAabXdTcWUlEiBIXSCvOTHESxODxiWuWAxzJLBSY3Sb9OFbz0wsMFerVsgbTgRDWkon8od18CNn6HeIVuTbrcxrHYHMXVfganMnrTo76Y4xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA1PR11MB7132.namprd11.prod.outlook.com (2603:10b6:806:29e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 10:58:23 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::c4b3:6bce:ab37:7d5b%5]) with mapi id 15.20.7386.015; Thu, 14 Mar 2024
 10:58:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Always check force_wake_get return code
Thread-Topic: [PATCH] drm/xe: Always check force_wake_get return code
Thread-Index: AQHadLWLJ+1inZftvUmvbQft5Wbkn7E3E0AQ
Date: Thu, 14 Mar 2024 10:58:23 +0000
Message-ID: <SJ1PR11MB62042FB7B7B7570831A8D36B81292@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20240312194256.965685-1-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA1PR11MB7132:EE_
x-ms-office365-filtering-correlation-id: ca8abef1-e79c-44a4-e5a6-08dc4415ab3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: efngkSbt1dXPt/66c7gWN4TJs4m6D7npjd/ftDlJkOKsV3ynZ9ERVGgL2499rINNKMOWPHP51iDbuBB8A/jrWw5GbLYClzu6R6D1hryLCRg/R3bvT/OhWLKsAegyV+UMVrpLioRQPCOVEaGzvdReXa12AEw8/Ke1RZToBUyLv/CiIMwZuGewtIrzN0gF8hje7c/3GOElPRCYmSJWlNXdX21+m2na8O0gVJMVOPYz1lgvUFMS49RP28fZ1N8AE6B8SzvDdz2RBfkO+dEcyDxaG7GXEjmuUU1QjgF5GWCJAI57eOONtEyxEanQm/Wmk++092eIOKYJtyvG04PsiBvFmxfJdvBb2tg1dRZSF/GdaUW3KDXzQnfWTKuH5CX+NSvF15XBvpNpG1S2A7nYN1xgJ7ojXQvy2uPcpCgoE1gFwsyxzd3xFkcA8xFvoTlx3/Yjo4kQ4wvVQcPe8YFLHscPcVlk1q6DuNmZfU6ISfZOAQ268cCxlT+p74jDF5/6mJvzxwKFdn9zUgoOGMAzOvCnPtNxRYPFcDnxYzjRCOOr/tnQFFDKD3rHOQRZqAtBHrlddO86zAskj7H+vLCkupWQVCpD3YmcXxvo3jKBzCQWJx2i3MgIOxt0/CM4FtTmqat8HPB9G5+W1UhTtyym6RJXA3QTHTtJteaEoSquE4ufTS4ig7xhpHFxvX1egIXX5vB+hN7J8rwp0dmP3xRur0jwqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QcIhDuoIWtGzkYzOi94mKceH/iHwUB4aCfGh3HvcUutrx3uVeoMa0eCV2psU?=
 =?us-ascii?Q?9TDhu85iXeXXHLsmRL4J1TspsGd7KuMyhVcGa7Yel8oFnb4f1kYDI75j+knw?=
 =?us-ascii?Q?XaoQ5dUGZB4C4/an6zTIGm4rQ7ATfo5p1yxYNY8xw9/h4bpu0Zm+0VOgESzC?=
 =?us-ascii?Q?Oa0hY8JtfsnsV9AaoNaSbsNLV2aGZ1XXPBnsWLH5k3ePubCjLoreWIoLWqNa?=
 =?us-ascii?Q?f/DLLFOoaqHZx+7aIsRDO9ihBdAJdwaxxGggfffHESP7p/NLdAJZ/SsWBFi4?=
 =?us-ascii?Q?+Xo7ud4hR6bQOXiZnKOkov4ENxPGHyK2VlPS0wl1/IdU0+DOXa3uPC8RjY2p?=
 =?us-ascii?Q?PUZT3FfGv/Wh+gLGGiSkbjGTAVL9i/jRUHzOcBOdluzDrUthbZI7+robxzXY?=
 =?us-ascii?Q?i8pLxSi0PoyF/FDGiVoa/QESm7fRqsxdOcln0jq6vY1KvSfajJNw6ZAcSd5R?=
 =?us-ascii?Q?SsxFwd5Eq1Kz4pPEqPu8r/iPR3greEUWPWcPllsopJCQq+K2EwDn6hwg4TeP?=
 =?us-ascii?Q?6uBfJfEA8efW9KjCnqdmL364wc+cOKo1WI5hsmIlfCJo9eR+geZ/lZHuAwG3?=
 =?us-ascii?Q?PtdF+ggoag6NR3TM27SGuwMmvvn+eJc8/PTfN5GOzTSM3tA03wMU14gB+3g8?=
 =?us-ascii?Q?bXYyk9JnFRhaECLs9M7sNQu7G8vrlig6aVxgG26J+tXl95Tkz+r+N6IqY0x7?=
 =?us-ascii?Q?nWL7xWT6/TgQTRZdhtaXZCFoJ8rIxXz9Ciz8vReLU2Bxd1bDHI9b9JtZjjeE?=
 =?us-ascii?Q?wNOgBt6JhWkKYnNYtYVS5rq/qCTL3SH0nrMqCf9/4gfFyW7ClgTPb2gwbcws?=
 =?us-ascii?Q?eLRjA/1L8+4WcfgmVi2n3PkVLZY8wbt0sCQtCASD13Kdeqq/2AXYO/U/ki0n?=
 =?us-ascii?Q?HOhm0IVTpU1oYne2O/NqZEJJrefXAK8D2iWfwUpdEe9Ra0oCOgf7WYF725SA?=
 =?us-ascii?Q?f8bOC0stTpYz/QF4O6RxivfJTfWCmgsRba2mo5n998vb3rJorJ9DluaB2t6W?=
 =?us-ascii?Q?hMJk/Xhs+uZ6vLWFTdCF9k7Pff2QUkNxAMsbWvOC/NEK0zkiCqkCrYEQ2VXG?=
 =?us-ascii?Q?6Thf/3N0dHXYcb/iaGLKyfuNWVO/PAGXVjADJX+Wqak2YvPfjqH6QuB5vyAb?=
 =?us-ascii?Q?ibC6ic/ZCBxISkL1CL2FW79/fJvaGh0tnLxUYPjdJp7+k6+HyPnhkjj0HD+R?=
 =?us-ascii?Q?eN0VN1orsTFzU6H3Wib+viSTsfX1HsKetRuyJsPu2DIjSOBnYJ/kjMGrQQgA?=
 =?us-ascii?Q?MID002/fuu9Pk5g3xkcsr4bDjhKnpsQTDMJsky3bkoinCJYBgx8ff6JKAWrp?=
 =?us-ascii?Q?6tI9cdVuXx+yaOxJpep9hqoBOc1Q67QyZxggfCATr63Wv6YHJNO2L+DeZiQ8?=
 =?us-ascii?Q?P41cta5rUb7Rzwv/XmQwzI3fr6BwKtkWL1DdbKod6RC5mVCVcZUvJLrEdmL6?=
 =?us-ascii?Q?iLEC1oLfE4l1IzN+fKBsmKLjV1CWtBTB3zCgLzGeJ9VezXM5PV7CG4spPnlE?=
 =?us-ascii?Q?X1q9Hgs8oZkRAUWY71WF8RseY72Wv/PSzE+g9wyjmkMXh2jOPo6zKFOdwXvd?=
 =?us-ascii?Q?UmnYnL6RsOc8i4854U/bpFSmIrgI1NlsGY8ADZkq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca8abef1-e79c-44a4-e5a6-08dc4415ab3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 10:58:23.7036 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sqL32ChJZWtMSsvf0y5yNaTAlVzfiHJ+Dh0b6sP1oIYP74T1YE6A0YeoO0/seZ6hqbHAeoWbduQqz91tYnvs3LLSrZRdI+Vyl2Bo25eMQ2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7132
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



> -----Original Message-----
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Sent: Wednesday, March 13, 2024 1:13 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Upadhyay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Always check force_wake_get return code
>=20
> A force_wake_get failure means that the HW might not be awake for the
> access we're doing; this can lead to an immediate error or it can be a mo=
re
> subtle problem (e.g. a register read might return an incorrect value that=
 is still
> valid, leading the driver to make a wrong choice instead of flagging an e=
rror).
> We avoid an error from the force_wake function because callers might hand=
le
> or tolerate the error, but this only works if all callers are checking th=
e error
> code. The majority already do, but a few are not.
> These are mainly falling into 3 categories, which are each handled
> differently:
>=20
> 1) error capture: in this case we want to continue the capture, but we
>    log an info message in dmesg to notify the user that the capture
>    might have incorrect data.
>=20
> 2) ioctl: in this case we return a -EIO error to userspace
>=20
> 3) unabortable actions: these are scenarios where we can't simply abort
>    and retry and so it's better to just try it anyway because there is a
>    chance the HW is awake even with the failure. In this case we throw a
>    warning so we know there was a forcewake problem if something fails
>    down the line.
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c         | 9 +++++++--
>  drivers/gpu/drm/xe/xe_gsc.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_guc_pc.c              | 2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c          | 4 +++-
>  drivers/gpu/drm/xe/xe_query.c               | 3 ++-
>  7 files changed, 16 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
> b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0fcd30680323..7d3aa6bd3524 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -13,6 +13,7 @@
>  #include "xe_exec_queue.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
> +#include "xe_gt_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_submit.h"
>  #include "xe_hw_engine.h"
> @@ -64,7 +65,9 @@ static void xe_devcoredump_deferred_snap_work(struct
> work_struct *work)  {
>  	struct xe_devcoredump_snapshot *ss =3D container_of(work,
> typeof(*ss), work);
>=20
> -	xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW
> data */
> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
> capture\n");
>  	xe_vm_snapshot_capture_delayed(ss->vm);
>  	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
>  	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL); @@ -
> 180,7 +183,9 @@ static void devcoredump_snapshot(struct xe_devcoredump
> *coredump,
>  		}
>  	}
>=20
> -	xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +	/* keep going if fw fails as we still want to save the memory and SW
> data */
> +	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump
> capture\n");
>=20
>  	coredump->snapshot.ct =3D xe_guc_ct_snapshot_capture(&guc->ct,
> true);
>  	coredump->snapshot.ge =3D
> xe_guc_exec_queue_snapshot_capture(job);
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c in=
dex
> d9aa815a5bc2..902c52d95a8a 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -287,7 +287,7 @@ static void gsc_work(struct work_struct *work)
>  	spin_unlock_irq(&gsc->lock);
>=20
>  	xe_pm_runtime_get(xe);
> -	xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GSC));
>=20
>  	if (actions & GSC_ACTION_FW_LOAD) {
>  		ret =3D gsc_upload_and_init(gsc);
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index a3c4ffba679d..7f1ac02b96c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -247,7 +247,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>=20
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe)) {
> -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +		XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
>=20
> 	PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c in=
dex
> caa86ccbe9e7..32b6da891f72 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -251,7 +251,7 @@ static void guc_fini(struct drm_device *drm, void
> *arg)  {
>  	struct xe_guc *guc =3D arg;
>=20
> -	xe_force_wake_get(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
> +XE_FORCEWAKE_ALL));
>  	xe_uc_fini_hw(&guc_to_gt(guc)->uc);
>  	xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> } diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> b/drivers/gpu/drm/xe/xe_guc_pc.c index f4b031b8d9de..b4b39bfcb5d5
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -927,7 +927,7 @@ static void xe_guc_pc_fini(struct drm_device *drm,
> void *arg)
>  		return;
>  	}
>=20
> -	xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)),
> +XE_FORCEWAKE_ALL));
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 19efdb2f881f..d7462969af1e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -833,7 +833,9 @@ static void simple_error_capture(struct
> xe_exec_queue *q)
>  			}
>  		}
>=20
> -		xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
> XE_FORCEWAKE_ALL);
> +		if (xe_force_wake_get(gt_to_fw(guc_to_gt(guc)),
> XE_FORCEWAKE_ALL))
> +			xe_gt_info(guc_to_gt(guc),
> +				   "failed to get forcewake for error capture");
>  		xe_guc_ct_print(&guc->ct, &p, true);
>  		guc_exec_queue_print(q, &p);
>  		for_each_hw_engine(hwe, guc_to_gt(guc), id) { diff --git
> a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c index
> a6a20a6dd360..3975f99fdca5 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -147,7 +147,8 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!hwe)
>  		return -EINVAL;
>=20
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
> +		return -EIO;

There are many more such unhandled forcewake returns, but I guess each file=
 and functionality will have different impact of forcewake failure like you=
 explained here, so for gsc,

Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	__read_timestamps(gt,
>  			  RING_TIMESTAMP(hwe->mmio_base),
> --
> 2.43.0

