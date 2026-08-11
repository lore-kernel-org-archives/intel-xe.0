Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8724DC5B56A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 23:36:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E1A10E3A7;
	Tue, 11 Aug 2026 23:36:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SeTMvEFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547C710E3A7
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 23:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786491394; x=1818027394;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+LJaEdBRXD7QE4n9dwRut7gnb8gvI7UjwY41atb9v6c=;
 b=SeTMvEFTxstKwle69xGatKpD9ZMHWAW5C19i6E/TSq8RIyHJNC+07yXO
 1ZqsomAQOJTu4edES9Pyy4zl6oWgzp4KXDyzfXjPKf2ycRZJ+UbdXMQxE
 JMXIh0NjDYiSMQwAr53Rnn/d6ph6gi4Eb+VKJKs0/arGnzkae5e34d33v
 1xBj+P/Um4cxDgVU9+oB5BLsC9cS9Rz3V8fEe6GA+xOjIXb/P5jxWMl6w
 3ApUDPobZ4illYndlZgzFUcYKcC2iGY9dOaqnV7MiMjJA52iOciQsaqvl
 ZS5DAWidKuClpgfTgHkVZfnhuE3rd7W1J+ZhSLSpGI07X+vPimOoF1UNT A==;
X-CSE-ConnectionGUID: Xq+Z4WD+Q3Gn3HihrIhnpQ==
X-CSE-MsgGUID: hC3+/zc+QYaL6JOf2A5Vvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86155488"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="86155488"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:36:34 -0700
X-CSE-ConnectionGUID: ljAgtXqQTjKRX+3/Hlic0Q==
X-CSE-MsgGUID: enpdQ0dQRXqRrv8s2bOptg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208";a="259204721"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 16:36:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:36:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 16:36:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.27) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 16:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQZtPNtoR4VyUrXhous4SsO659CeW2llstBhlnq56K2iE48tQJgUT3UPc555eo+QBPoO1pAYCI/exH6dTb+ix+f26l7mhysb247v1dG28UyaUtPpTIAmMAD+SkWlURMlF/ROjn2kfdpaykCYI4YS3caJhGbCyOLhG9PSaOVbDpIsWko6Nu2vVXbeKTxGl2Zmze/7eKjMAH5gJaNHP/qFF9+gSGW65vyUeVz4sBpy+ho7qM5Vki2q/Jz0RfIW8R8T+pOv3go/8vnrrM8GJbWujlwdIUyz92m1dA/5xga7ZFT0VhdmDBAzV5uW6IFppyF11wJuY96H0xc6S+E6vKMz8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owYn7RohpMAkgxA+8u4uLsAYgcRMEr/kRrGf+p1SoVs=;
 b=HiBcEvf1m0Bh4D434gGmeORNV1df91PYqo0r9FpKStbAWJdG559pkCwpXC0P54LDR0NREizuhfnvFswUtCUrKvXD+0uhAaPaEXN7EdlSbDveSQnU8tau4uAtHUKdYwCUt9QGBmuNmDC+fXS/wxelmkGK5+ACVCsWDcpmENINAhsV9bPsXbUy47oJxtHbhqdYhXI93GKXDK9gQ9V2LymWBMMzsR5/DgU8Wdj3sYVIdDaA33OE6lbDf6wJsKsvTGieCu/pz1UJl1F5pWM7zkqLBVVEKuIezV2p560XfO8C0S6oSFayfoviRkqaZ/g/rh83DDn+6N41Q/mZvHhM1fpjZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PR11MB349881.namprd11.prod.outlook.com (2603:10b6:8:514::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 23:36:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.011; Tue, 11 Aug 2026
 23:36:29 +0000
Date: Tue, 11 Aug 2026 16:36:27 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe: remove EXEC_QUEUE_FLAG_PERMANENT
Message-ID: <anux+1xkGpsQhyGL@gsse-cloud1.jf.intel.com>
References: <20260811133753.1742666-4-nitin.r.gote@intel.com>
 <20260811133753.1742666-6-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260811133753.1742666-6-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PR11MB349881:EE_
X-MS-Office365-Filtering-Correlation-Id: 321125ba-1f68-4d6c-1706-08def8015e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bFnKlUyIG+h5oXFKBLMCon4SZwZ6oR8XG0HDfBxgryhZqxHHmO4y6ptt3x6v/TAUgfaOPU0NYz9TCxh/KaX0jCiii3dhVk6bMM0WOJ1+u7DyRlX32gNlf1YCcZs9thxS9Q3Q+8zPV887QeronNGgdpsGVHMIujQA7RuCyxiUBSDfHrdB1KmiZtCbDmRIJO0LV433gA3sjdzabDzz8aDXuGu3/UOThsL/27+IN4BmhZMJTtRarcLMeuvVaSyKYqsvExQnjfFZg5YZ8GhhbkJMoM9kUVf11jQtFcCdNbkmXuB6JiH/nh6ayO4ZAfKs16h3pV8SnF7aP+UeIA4eOnAXLJ1UW2I6jkSlOsyooPgdLUCNOjnwEO+UvNH0g6eoFgZ993rovenpCJRs9QBDZ7b5iDv7gbt6DZ4Fj2I2OnlyHuDN5io1FASylnSMEmowJlNwFK6TsoLuEXyH+VyXi9KUkb575EgSlvMPO3/a8/5RN07ggPKl1LxE4kMIH8etjNJbo7K0/ffj6IiQou3Xn5nEZ+JUcc8xAqXxd3qyQRJqgPGmYJVoPTQlsJC3wIL+cnhaJXt0uOWFLp7hD57WbDblAcfE6jCdCRwE0Dyh0Djx4VxbFeDyIf1SVHnxpk4jMQOWucDfLGBn22kYOGuYbv58R9BrkoQmRYYL1xYc4a+Mon0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0E5FXuWax1IEGhtniW1Tudlo7mcs00e65LfysLpay0F1HxAqZNJn9Jbf5M+i?=
 =?us-ascii?Q?CLoqM2xi384EiF8+TptOyD2TSrwxqcFhpFUNcQtg+oJCg0/ybBNv+5D+AMdA?=
 =?us-ascii?Q?dqMdtMotANxCQvKFg/CDIwFrV2dzpvWeN/GKUXSlUeiUQ2aM8MedUlNmQlgx?=
 =?us-ascii?Q?ObyB2gsl3XWbkZltzmUQcialyY8TCgikoHSOfiSOt6tD+rAmDtrX9Lvem9BQ?=
 =?us-ascii?Q?6Sz8X2BJssRkTHQr/MkH8y5gdM/jSwCv58tvVYKUiWFHiRkbk1Jx5cAZjdas?=
 =?us-ascii?Q?iMeTgjYu7DEJdohGoSD3wQOEdDXOy42d4sQ/Lzgq1IIgyDJINu0finEStcp4?=
 =?us-ascii?Q?jky9oNbc+2TEb/CU5qx4MiijZTFlpMkX0kZcEYe+Vr809gkPfUbfBRiouzE4?=
 =?us-ascii?Q?vokqqPvY1PpofspaawtgMxYXtVEDrkA/x1dC0cjLB5NGo5gqTlWwDmyMu33b?=
 =?us-ascii?Q?hOoQM/WT70bC17UPlqfXVgbAm5Um2LhX1WfaMaF/ayw6LilVDAw+Y41BM2YP?=
 =?us-ascii?Q?1zHMkcLWLGdc1CZsbYhWoPZJ12DxzGVKF7yqoC6J/zOG4oEtwDFTX/vmJbiQ?=
 =?us-ascii?Q?PUJunSe+cvD34rt9EDMc0/6hYcrOngqxdKIEnO4v1LncUBStjzzjC47i2YeL?=
 =?us-ascii?Q?BBP3iovJXja+o4pX0YBevtv1jrCKaBmlX/kpCMOKfL5lqtPj3P4TjV2AZ/TO?=
 =?us-ascii?Q?GLwcfgdS04yvtjQB1EvhyhjOaCsrc+eT+wnkFPaA70Ogu0xj8wckSlB9RaBt?=
 =?us-ascii?Q?ETTqRgePHtyv2/WpSiOWLnrTr/ufXy9yg2+0gBYKg6GNxEdTQyk6GE2p9XKz?=
 =?us-ascii?Q?g1Uy4ZM0JqhTPyVNhiXs5XMv5a4ln+IYsGaCWWNZ9W8ono4nVTxLMI1XDxfS?=
 =?us-ascii?Q?qeBlI3pMT96soPK6bxtiuFHZ9z3BpfmHGvZjqL12hjxzBrhjIpvXSYdTlhHl?=
 =?us-ascii?Q?swmhvvnMwLOg9e/aydrKr+21b4XciN1Yonq24UQt6eJ2ZkAbE90wk79NNMJO?=
 =?us-ascii?Q?htPufP7UaMTkeTpyzNjtJrcCIt6TtYYYecV7PBvl4mJXmcKkcVppg7VH63jZ?=
 =?us-ascii?Q?dJHxIEdEjEv6dlBV1kd23uZpjeTYrsO6KsSjJenbBAM2yOnEVqRwlDQzywpA?=
 =?us-ascii?Q?4pJwKdQMnTsHOVFY0DaNpCUd2izhgoQhlA9w24cbCGeelervgpH/dwA76Tn4?=
 =?us-ascii?Q?ID8zrWXu9y9NjXKK2zKaiaQcI0ORmEpAbEnrAiEFqfRkzSYeYc9F3iJJdUwj?=
 =?us-ascii?Q?VBOn5zwZVO2UOs12Fkw1+vcWDqok69EXXlTW/w2DciYTPGP92nyVZHwIpc8g?=
 =?us-ascii?Q?dChnAyP8cZZ5cf8jCl0euOnoVBVVBV/iahzm+YCEezI90o89Qs7oF0z5NiNL?=
 =?us-ascii?Q?1zLSxRDxhIKGWq7gQD+SrOkHvBVbN5wpdVPpt8SC/3ouJ/+FCShF7/y095vY?=
 =?us-ascii?Q?CxkzZ1S+HLhpurqabrxkSUkAAARCoCcWFvjSRCCfhMEkqaowG3mDf+JMFXqc?=
 =?us-ascii?Q?gEhIUuIClAA8VFq/Uwn6ayqzQjrwYjyd5wTzf+7iBTpM8xt/EVvAtWK36jPf?=
 =?us-ascii?Q?4cnqFoo+VmO8SMBWRvH/VLhLeDysyCiGDXGTh3n9tvmQQTFFBVGm5yfBQFwf?=
 =?us-ascii?Q?dfPNK+9SqSUZWkV0nS/NceCIhSlwoh4OJ4bkrXeol+asRLIudkbF7FUbzjLV?=
 =?us-ascii?Q?8SoW61yPx6dnw4eyDAtWMgxhbFjX188XbPbPy2x4XbGX53DzxuceI5cXb9EQ?=
 =?us-ascii?Q?2pe1k4pZTjsa30aVKJFYdkBlCzvLvVc=3D?=
X-Exchange-RoutingPolicyChecked: STNpEREuENCq3jTh2D/PLFvzsE059U9/hYj08YOU8h7fsOFd3Yzy6hIrfIPFm8I/uTuLR10l87EDgOAH3qzNWfZ+QDrnhW/fWYn9nUnvYJGIBY8ZtrxGyqeqpWG9pT82nYyTWrtqOkb1lcb+gyRbsYtjrc/qI+mFim5GhvOsDoDQKz1rdUFqjKBTXYN2FdytkqS2NOtt+pljdBnyQu4SjqQp+kgHAlDqFwi8nrTaD1Sg9srdrBpxlAESRAbjNon/zk9sqmvxKb7x4CUcyK0WkLhaCPmlGb20H/iAmDKPkYTyEBansH+z0W9DEIY/K/x3yvh3CGLkmVG9cKyLfzrrVA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 321125ba-1f68-4d6c-1706-08def8015e60
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 23:36:29.6535 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EDALajfoO7dN4ugATyhrOQn1Re9zYS8se0vkI6WfmV2PSYtE/TycdNaMQb59MnSfgVYrGRgbxHtmghNswv3uag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB349881
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

On Tue, Aug 11, 2026 at 07:07:56PM +0530, Nitin Gote wrote:
> EXEC_QUEUE_FLAG_PERMANENT used to mark kernel-owned exec queues that were
> only torn down at driver unload, so that guc_exec_queue_destroy() could
> take a synchronous teardown path for them while user queues went through
> the async destroy worker.
> 
> Exec-queue teardown now routes every queue through the single
> message-based path (with the message layer gating any HW/H2G work behind
> drm_dev_enter()/drm_dev_exit() and taking a runtime-PM reference only
> while the device is bound), so the PERMANENT flag no longer has any effect.
> Drop it and all its users, and renumber the remaining flags to keep the
> bit range contiguous.
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c       |  3 ---
>  drivers/gpu/drm/xe/xe_exec_queue_types.h | 14 ++++++--------
>  drivers/gpu/drm/xe/xe_gsc.c              |  3 +--
>  drivers/gpu/drm/xe/xe_migrate.c          |  2 --
>  drivers/gpu/drm/xe/xe_pxp_submit.c       |  5 ++---
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c     |  1 -
>  drivers/gpu/drm/xe/xe_vm.c               |  1 -
>  7 files changed, 9 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 9f3d022a1463..c4213bb9c137 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -207,9 +207,6 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
>  	struct xe_gt *gt = hwe->gt;
>  	int err;
>  
> -	/* only kernel queues can be permanent */
> -	XE_WARN_ON((flags & EXEC_QUEUE_FLAG_PERMANENT) && !(flags & EXEC_QUEUE_FLAG_KERNEL));
> -
>  	q = kzalloc_flex(*q, lrc, width);
>  	if (!q)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index b2276559c2f6..95f75d61a647 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -135,20 +135,18 @@ struct xe_exec_queue {
>  
>  /* queue used for kernel submission only */
>  #define EXEC_QUEUE_FLAG_KERNEL			BIT(0)
> -/* kernel engine only destroyed at driver unload */
> -#define EXEC_QUEUE_FLAG_PERMANENT		BIT(1)
>  /* for VM jobs. Caller needs to hold rpm ref when creating queue with this flag */
> -#define EXEC_QUEUE_FLAG_VM			BIT(2)
> +#define EXEC_QUEUE_FLAG_VM			BIT(1)
>  /* child of VM queue for multi-tile VM jobs */
> -#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(3)
> +#define EXEC_QUEUE_FLAG_BIND_ENGINE_CHILD	BIT(2)
>  /* kernel exec_queue only, set priority to highest level */
> -#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(4)
> +#define EXEC_QUEUE_FLAG_HIGH_PRIORITY		BIT(3)
>  /* flag to indicate low latency hint to guc */
> -#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
> +#define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(4)
>  /* for migration (kernel copy, clear, bind) jobs */
> -#define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +#define EXEC_QUEUE_FLAG_MIGRATE			BIT(5)
>  /* for programming COMMON_SLICE_CHICKEN3 on first submission */
> -#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(6)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index aab59dc647fb..524ac56bdcc7 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -478,8 +478,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>  
>  	q = xe_exec_queue_create(xe, NULL,
>  				 BIT(hwe->logical_instance), 1, hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q)) {
>  		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
>  		return PTR_ERR(q);
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index f79d0047bec6..75b83687f1b5 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -493,7 +493,6 @@ int xe_migrate_init(struct xe_migrate *m)
>  		 */
>  		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe0,
>  					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT |
>  					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
>  					    EXEC_QUEUE_FLAG_MIGRATE |
>  					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
> @@ -501,7 +500,6 @@ int xe_migrate_init(struct xe_migrate *m)
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
>  						  EXEC_QUEUE_FLAG_KERNEL |
> -						  EXEC_QUEUE_FLAG_PERMANENT |
>  						  EXEC_QUEUE_FLAG_MIGRATE, 0);
>  	}
>  	if (IS_ERR(m->q)) {
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index e60526e30030..5de86a8cf27d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -46,7 +46,7 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
>  		return -ENODEV;
>  
>  	q = xe_exec_queue_create(xe, NULL, BIT(hwe->logical_instance), 1, hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL | EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q))
>  		return PTR_ERR(q);
>  
> @@ -144,8 +144,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
>  	}
>  
>  	q = xe_exec_queue_create(xe, vm, BIT(hwe->logical_instance), 1, hwe,
> -				 EXEC_QUEUE_FLAG_KERNEL |
> -				 EXEC_QUEUE_FLAG_PERMANENT, 0);
> +				 EXEC_QUEUE_FLAG_KERNEL, 0);
>  	if (IS_ERR(q)) {
>  		err = PTR_ERR(q);
>  		goto bo_out;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index a8c831fbee3b..a54138461f44 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -354,7 +354,6 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx->ctx_id = ctx_id;
>  
>  		flags = EXEC_QUEUE_FLAG_KERNEL |
> -			EXEC_QUEUE_FLAG_PERMANENT |
>  			EXEC_QUEUE_FLAG_MIGRATE;
>  		q = xe_exec_queue_create_bind(xe, tile, NULL, flags, 0);
>  		if (IS_ERR(q)) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 9e0176861cb6..cb6db353147e 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4955,7 +4955,6 @@ void xe_vm_add_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	/* User VMs and queues only */
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_KERNEL));
> -	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_PERMANENT));
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_VM));
>  	xe_assert(xe, !(q->flags & EXEC_QUEUE_FLAG_MIGRATE));
>  	xe_assert(xe, vm->xef);
> -- 
> 2.50.1
> 
