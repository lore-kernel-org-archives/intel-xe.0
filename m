Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC75C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 02:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0843B10E372;
	Fri,  3 Nov 2023 02:46:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B41210E372
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Nov 2023 02:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698979612; x=1730515612;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Vtkq7FfqGEx77iBJeH0/UqNFG8sDxOrJPYIX/yxAkVs=;
 b=LeGPTawguSxZLisy9XI0RczUVx0H4jhN/3txj7EqEXWBNEulDgGtPc1G
 ojbX40mt4gwfDhPJZCxxnayX1bomFbNKHKZQJzYdi73fMH45K6v1Kpe+z
 OZkhEva4pqJqS6owFQWRRpEIf9oGTrVkIazfrWQw+QLduogCHarQJS4yi
 RLaPIFHr9b7W35tbVa9lOJNIe0vJZp3oAT2rdx17/iqORNPDfWw7Sktd2
 cWqqVjFxDBcsLwe58febt9yu1Ed+K5XzWTMMGAry1slwu6zW3xFLCeDTQ
 WrXSJvfrnv+32dIhJrWzSiAojhjURIb4kmjYxQxlt0vHw7sZA0EFV4MEf g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="379263889"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; d="scan'208";a="379263889"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 19:46:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="9595532"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 19:46:51 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 19:46:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 19:46:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 19:46:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEWDgK0AqF3OmI+DlwTnfoHse0kRkNjaYatXhs5Rlm4F4Uoy03Jq2MwmNgTrwtny3ednBxgpCoq9xBDDG6efXFR5r2CrGmnF4NXkHjawWA4S4Pox/bLbownk4/j35jxfGEwqlGaw6XLdJqS5AM3UhE6ygC5RpqsJbefze/cxvQwtUDMC3iBlh+M70C7lL56UBpnBOFu87/O4CWZVUYJxrw0VyhJgXd1FYJ2QE1oEg8si9GvKJkrIQ0M15LDxo6K6hhOihW+wvmZ3I19U2Ya6S9D8Wgx2VU1Xz7mf1XN51riMBPrX1VIX0ioptQpXgiDv1QM0Z6y1OWtBf6RCGQBbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdi+edBFg2x/L6IgymN2wYlbX+0aZty9ToQaz2+1KTg=;
 b=RbKddy2t9ILLywc4F9nPJk/amWuaAiPxWgu8hWJZ08MjHF/Yjnlx38l/+Fdi/DFDFRnOZfZUpx2rzGePa8KNBUGyWXcybupb3+wGIvh771NGcyhD7VFijabx9fxH7xGwzT8stQEdIbdCS1/Sc414htgzA0kpDgBavgojqBarww7U4cUKlpPQb3yISXNrvXlHFROfifPRoSL6zqKBG6L3F7gWsT/lUvk/QYegOZQa01Hl5EVRZeG9LwNV+dZO195QLpNWQCvKVZuSrnEUm+meVCRrDH0WEAYaIHoGkFOukXlcHwaflwwiCVDw+h9pWi5ndHBSfYBTqgsc9TF8B4mMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 02:46:47 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::eb3d:e9c7:a247:7915%4]) with mapi id 15.20.6907.022; Fri, 3 Nov 2023
 02:46:47 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Welty, Brian" <brian.welty@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
Thread-Index: AQHaDfcjQEEQ+4G5jE+YF1Ktbeyd+LBn4w2g
Date: Fri, 3 Nov 2023 02:46:47 +0000
Message-ID: <SA1PR11MB6991A3545369C82321D3F06592A5A@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20231103014309.13927-1-brian.welty@intel.com>
In-Reply-To: <20231103014309.13927-1-brian.welty@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8679:EE_
x-ms-office365-filtering-correlation-id: 5a85c4fd-3177-44d1-bb0c-08dbdc171f70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +IVpIVMH8PFGyvS1z5qZ1S7XexUU4VA8Bfs+fMelAifOIwqbetSeQvRHlgJk4K+LDnk1pyQ6QpO8LHFn208qLZxuUumCdXRwY2hLA073rukX1o1MmWOXNxAlYmEafegVVwUFM6HMJkb+g5ncKAZJr6Pi2fn72ldZ8+aRkARVhQuYkRvHQuxw6mCNEvoRS1njbjRe4MxL0gab50PS+H/29HBR0fnrC600DMBx4U+BuFxistbZP9dVxMMCDupexJTiBL/cNJtGrokkktUwMWQ43zkJZrmtF7hT0/Suff8/S8G64eX4XFmG7cdY9Z8MUsVMpkiahy1kVPljf43wy6PjqTJnoU3g08IFYbXWZ5XDf5eAR/7FdLeKT+vzJPVsHf8GJFQ/GQ418dquVvC0Fah7oUtWnJbnLPUKi+oIe8XOCzp3bG0cB2YUdm8uj/pYmvJppTrfKZs4rmG/+cB+VECGhrJKH9xVNIfJCuLk/qrgL34oZqWB0vNcu5+99XsTBPCvVF6vM6i6v09eTdQWGmTkcbQQ81ZcU0u+uuDmP711DXAQj1jUB9PiNyeKMn/uZLrcgqtcAtzy/kRmz//IRqMxkXXgStJUezT4n7U9p9QloNL+yAyhge/32uKhzdZ4g3zd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(38070700009)(26005)(66556008)(110136005)(66476007)(8936002)(8676002)(52536014)(76116006)(66946007)(5660300002)(53546011)(6506007)(7696005)(9686003)(41300700001)(71200400001)(2906002)(478600001)(55016003)(83380400001)(64756008)(316002)(66446008)(82960400001)(122000001)(38100700002)(86362001)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A538HRHXFRc43xdJ1Jq9e/wCcy+plPPT7Km/fDWgPe9iaMhZ2lfaol5m+JNY?=
 =?us-ascii?Q?3+qg3pNNhQ8JxtJNpS29qGn9n7+d4DICNmlroQa5d2bNZDIoEuA5S4zSQTDV?=
 =?us-ascii?Q?cvnxZBmuHiN+bN6W3wDrQKJ6v/XOEFB+6vsNMwIFYL+ydJD8DwCw5qZQufkr?=
 =?us-ascii?Q?Amwaw98QTClEN5kM+VfzisGKGEpTJyJ6Qvf/9wFAN+pXU6g+mNarepKAeSAc?=
 =?us-ascii?Q?i5Y30jHbUpg6ytH+QwC4yHZL9DmykHy9Tww5KdEOp4WrWqfVrLDjjvSVSKLM?=
 =?us-ascii?Q?SrX2wreXyO6c87woqTF6vqPvwB9+rxxQ7xrNz48jp4Fdkr7hOZ2FiWXk03V2?=
 =?us-ascii?Q?uBJ3QoUMuTs4yY08UTSLjOwFH4kI4vPYRqHp6Kf8Hkfx3LrFR0wz+6mg/1Cw?=
 =?us-ascii?Q?SA1JzQqVhIBx5ghXohD7ETyE/uQSgG3L4sJB8anAT01TY85szvCQQwBop1N4?=
 =?us-ascii?Q?Yw7PDpIIP13QkwyCQmenSQK0UueLOdHWdS6AXeLPs1VjiixZI7A73X8W//F/?=
 =?us-ascii?Q?cGl8KglkYI+4ibHyCLQnbOFFtrQjzMDl/esBL/ItdyD09kFY2MQog7vwS0AM?=
 =?us-ascii?Q?ncUVOuuATSbYG8AkLmFldXlcIWxWLrqpNGVMc3sAwk90kjr7XpcPE5QbkueT?=
 =?us-ascii?Q?HmSJV6neXlqqJR0cLrp+6x399RkcMFY6DUHWf9tJ/4iCjAuMgS8vMNT6oJK/?=
 =?us-ascii?Q?ezd7A476cI3QXK+xB9qA12FeTa83VG7SujNmA/Za+Pk6zQNATKQT9/1HpiKh?=
 =?us-ascii?Q?+hAMj3xyQdDHdf5d8HVqGjLKQUFjtYmUTMygwok7MdsGoWnraA7E9FKQnLgo?=
 =?us-ascii?Q?Unqcr2rPYx35Mw+c5vlfY4Io5GRwAGpzB2OkkJS6Re8ueQulw7Jd/ZgtDP7g?=
 =?us-ascii?Q?9O71SRzE6MuS4DTM6XsEOy4vsGpJ+rRybpABgVZBFPDca3+QhlwvAiCy7J1U?=
 =?us-ascii?Q?BeIkR5G1OyvRVpJWZWtjF2HAkvMAPVeM/pNUfqbnBzJGinRPxwZnJ8aqU7YQ?=
 =?us-ascii?Q?eIg5NoKCFhoEg0fGx0Ly98ftHpGV3xoy44bIQ4Lvfo6PLra7gdVAeJxGrYrU?=
 =?us-ascii?Q?4bsKR1+YC7VhDK8lDOFHK48HLMdX+hNFWkoHe0ZcUhnCp4ATRaayvJINie1Y?=
 =?us-ascii?Q?3/7m94bJ8VH3ycDLUuaPWOOBtBWE+96+ONC0+9MnGdYVu9FdAdKO+tzskgY7?=
 =?us-ascii?Q?JUYHC67IlJbHhWShkP3HsEOJfXMJqV0UunoojgVy7QbNe1oFCk93No2KTfUE?=
 =?us-ascii?Q?NYJeBsVvWtP19PQMSY8X/EYZbtSth1r/qhp04wxBUll2N/iexkqq+mQfdc5G?=
 =?us-ascii?Q?aCEbtZsQnIvKIQY7UbZVh0B6m0Y0qwBAA0iF/lvK/fHPge00gUbZZ9DBQwY1?=
 =?us-ascii?Q?r1PRlWcgnZ0cO3HAxEXKB/5M4dG0DBBaTZCqZqqJu/Z8ftTCNqmRmA6CEnUe?=
 =?us-ascii?Q?3ODY8nczccF5V57nW5VU0LFOWNgbzeE6iDgP+xNAO5rWLy2J42I5DtlwGdBZ?=
 =?us-ascii?Q?RkCH0sQs7jf52DdFDgfC2Z1H2EdoJEz0ntdIwzUoPiXmM/Prc8YQyyq3g3ht?=
 =?us-ascii?Q?h6eDFbGonZhw1Uv5wvM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a85c4fd-3177-44d1-bb0c-08dbdc171f70
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 02:46:47.2403 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gbg5T3IRAFdk/l/2X3bPS2YjE/0zcjSEkkWyThSWwzsQE+oLT9hY1qwsFCG+8TDdIdnQIyxAEdF+ZiqKi2UenA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter
 worker functions
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

Hi,

Can someone explain why we introduced an circular buffer for page fault han=
dling in xekmd?

I915 page fault is also handled in a work queue/worker way. Whenever we hav=
e a guc2host request, we queue_work to process the incoming request. No cir=
cular buffer. We didn't have a problem there.

Thanks,
Oak

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Bria=
n Welty
> Sent: Thursday, November 2, 2023 9:43 PM
> To: intel-xe@lists.freedesktop.org
> Subject: [Intel-xe] [PATCH v3] drm/xe: Fix pagefault and access counter w=
orker
> functions
>=20
> When processing G2H messages for pagefault or access counters, we queue a
> work item and call queue_work(). This fails if the worker thread is alrea=
dy
> queued to run.
> The expectation is that the worker function will do more than process a
> single item and return. It needs to either process all pending items or
> requeue itself if items are pending. But requeuing will add latency and
> potential context switch can occur.
>=20
> We don't want to add unnecessary latency and so the worker should process
> as many faults as it can within a reasonable duration of time.
> We also do not want to hog the cpu core, so here we execute in a loop
> and requeue if still running after more than 20 ms.
> This seems reasonable framework and easy to tune this further if needed.
>=20
> This resolves issues seen with several igt@xe_exec_fault_mode subtests
> where the GPU will hang when KMD ignores a pending pagefault.
>=20
> v2: requeue the worker instead of having an internal processing loop.
> v3: implement hybrid model of v1 and v2
>     now, run for 20 msec before we will requeue if still running
>=20
> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_pagefault.c | 80 ++++++++++++++++------------
>  1 file changed, 46 insertions(+), 34 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index ab6daebbd77c..c99af751d1fb 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -276,10 +276,10 @@ static void print_pagefault(struct xe_device *xe, s=
truct
> pagefault *pf)
>=20
>  #define PF_MSG_LEN_DW	4
>=20
> -static int get_pagefault(struct pf_queue *pf_queue, struct pagefault *pf=
)
> +static bool get_pagefault(struct pf_queue *pf_queue, struct pagefault *p=
f)
>  {
>  	const struct xe_guc_pagefault_desc *desc;
> -	int ret =3D 0;
> +	bool ret =3D false;
>=20
>  	spin_lock_irq(&pf_queue->lock);
>  	if (pf_queue->head !=3D pf_queue->tail) {
> @@ -303,8 +303,7 @@ static int get_pagefault(struct pf_queue *pf_queue, s=
truct
> pagefault *pf)
>=20
>  		pf_queue->head =3D (pf_queue->head + PF_MSG_LEN_DW) %
>  			PF_QUEUE_NUM_DW;
> -	} else {
> -		ret =3D -1;
> +		ret =3D true;
>  	}
>  	spin_unlock_irq(&pf_queue->lock);
>=20
> @@ -348,6 +347,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 =
*msg,
> u32 len)
>  	return full ? -ENOSPC : 0;
>  }
>=20
> +#define USM_QUEUE_MAX_RUNTIME_MS	20
> +
>  static void pf_queue_work_func(struct work_struct *w)
>  {
>  	struct pf_queue *pf_queue =3D container_of(w, struct pf_queue, worker);
> @@ -355,31 +356,37 @@ static void pf_queue_work_func(struct work_struct *=
w)
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct xe_guc_pagefault_reply reply =3D {};
>  	struct pagefault pf =3D {};
> +	unsigned long threshold;
>  	int ret;
>=20
> -	ret =3D get_pagefault(pf_queue, &pf);
> -	if (ret)
> -		return;
> +	threshold =3D jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>=20
> -	ret =3D handle_pagefault(gt, &pf);
> -	if (unlikely(ret)) {
> -		print_pagefault(xe, &pf);
> -		pf.fault_unsuccessful =3D 1;
> -		drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n", ret);
> -	}
> +	while (get_pagefault(pf_queue, &pf)) {
> +		ret =3D handle_pagefault(gt, &pf);
> +		if (unlikely(ret)) {
> +			print_pagefault(xe, &pf);
> +			pf.fault_unsuccessful =3D 1;
> +			drm_dbg(&xe->drm, "Fault response: Unsuccessful %d\n",
> ret);
> +		}
> +
> +		reply.dw0 =3D FIELD_PREP(PFR_VALID, 1) |
> +			FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> +			FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> +			FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> +			FIELD_PREP(PFR_ASID, pf.asid);
>=20
> -	reply.dw0 =3D FIELD_PREP(PFR_VALID, 1) |
> -		FIELD_PREP(PFR_SUCCESS, pf.fault_unsuccessful) |
> -		FIELD_PREP(PFR_REPLY, PFR_ACCESS) |
> -		FIELD_PREP(PFR_DESC_TYPE, FAULT_RESPONSE_DESC) |
> -		FIELD_PREP(PFR_ASID, pf.asid);
> +		reply.dw1 =3D FIELD_PREP(PFR_VFID, pf.vfid) |
> +			FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
> +			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> +			FIELD_PREP(PFR_PDATA, pf.pdata);
>=20
> -	reply.dw1 =3D FIELD_PREP(PFR_VFID, pf.vfid) |
> -		FIELD_PREP(PFR_ENG_INSTANCE, pf.engine_instance) |
> -		FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> -		FIELD_PREP(PFR_PDATA, pf.pdata);
> +		send_pagefault_reply(&gt->uc.guc, &reply);
>=20
> -	send_pagefault_reply(&gt->uc.guc, &reply);
> +		if (time_after(jiffies, threshold)) {
> +			queue_work(gt->usm.pf_wq, w);
> +			break;
> +		}
> +	}
>  }
>=20
>  static void acc_queue_work_func(struct work_struct *w);
> @@ -544,10 +551,10 @@ static int handle_acc(struct xe_gt *gt, struct acc =
*acc)
>=20
>  #define ACC_MSG_LEN_DW        4
>=20
> -static int get_acc(struct acc_queue *acc_queue, struct acc *acc)
> +static bool get_acc(struct acc_queue *acc_queue, struct acc *acc)
>  {
>  	const struct xe_guc_acc_desc *desc;
> -	int ret =3D 0;
> +	bool ret =3D false;
>=20
>  	spin_lock(&acc_queue->lock);
>  	if (acc_queue->head !=3D acc_queue->tail) {
> @@ -567,8 +574,7 @@ static int get_acc(struct acc_queue *acc_queue, struc=
t acc
> *acc)
>=20
>  		acc_queue->head =3D (acc_queue->head + ACC_MSG_LEN_DW) %
>  				  ACC_QUEUE_NUM_DW;
> -	} else {
> -		ret =3D -1;
> +		ret =3D true;
>  	}
>  	spin_unlock(&acc_queue->lock);
>=20
> @@ -581,16 +587,22 @@ static void acc_queue_work_func(struct work_struct =
*w)
>  	struct xe_gt *gt =3D acc_queue->gt;
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	struct acc acc =3D {};
> +	unsigned long threshold;
>  	int ret;
>=20
> -	ret =3D get_acc(acc_queue, &acc);
> -	if (ret)
> -		return;
> +	threshold =3D jiffies + msecs_to_jiffies(USM_QUEUE_MAX_RUNTIME_MS);
>=20
> -	ret =3D handle_acc(gt, &acc);
> -	if (unlikely(ret)) {
> -		print_acc(xe, &acc);
> -		drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> +	while (get_acc(acc_queue, &acc)) {
> +		ret =3D handle_acc(gt, &acc);
> +		if (unlikely(ret)) {
> +			print_acc(xe, &acc);
> +			drm_warn(&xe->drm, "ACC: Unsuccessful %d\n", ret);
> +		}
> +
> +		if (time_after(jiffies, threshold)) {
> +			queue_work(gt->usm.acc_wq, w);
> +			break;
> +		}
>  	}
>  }
>=20
> --
> 2.38.0

