Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66024C44507
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 20:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2149410E1F2;
	Wed, 15 Jul 2026 20:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n+VHC0sE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7690A10E1F2
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 20:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784145652; x=1815681652;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pZcB+ul1cpejgwihm0A0ydc3x/Blw7Ph36mR7PkdR8c=;
 b=n+VHC0sErq3UTl3vWyr6E7wUVltq1RVTf6pRYkUUKV0MYKvVcVcx1Ken
 CYivqu/v0Gf7ccSCkpn1LLTeG/BpDlN6MNK6AQXEKvWnRQanj1tFJCEHi
 czngu0MEN8BouUK8x2ceeSFKLw8x6AL4XQAdAUMO53FZfC5s/AStP6crN
 pFURzpEwWuZ1bP4NjqdOSv7+ui/VoabmhnpLkeZ52eHjOm6Cj46FtcqKK
 bEmLeihpfhK/nMjHBDez+zlomJ7N5a9j6nhz2mWPxIV579LowGGo212Me
 dvLymklHljSl6oi09FzgLK8dsY3Ey9Dh0XS0DOVfaU1wKsNsfYxrMGM62 A==;
X-CSE-ConnectionGUID: kgtrpsceSbiFLebmh3VUfQ==
X-CSE-MsgGUID: /sCTwONhQL2aXmi/O8u56w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84582256"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84582256"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 13:00:51 -0700
X-CSE-ConnectionGUID: 6GlJhGdwRNuz0S+XDovxQA==
X-CSE-MsgGUID: waLI4cyyR6uWegR2Ry7JcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="286367291"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 13:00:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 13:00:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 13:00:50 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 13:00:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a7AEmNO75L42649g9dwK+vJKz+uwfV1Ey789UVeNnfiH0Y40aTLd1pU10knnn5dG0HCrTagCyiLEmHvZErbRFMrfvyhSONKwZn+o3sMpvm7cFTjhNeApfPecgfCeGwqrW476grGg1mqREzGfi5yWJaG+bqdk42Be5BTfK02iEqPgi/tOxio7g0zBUEHTi8ZumdrIcRn4sfn9oQIn5XW6a8nRvKuB9C3beBzVZlA9xNDYsYeNpSLcnuqiwK72YK16nY9noPngrriQPcM5Mqgs1XuyX8VuUp1henE/FFxHGGapQOH+WDqIdDseadYKvaxml0eAHj0GJilJzQDpn/FzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qzw3Tt+n/s5wctt63n1vTJWFBeMe+synxInOzTkrIyU=;
 b=GT3VFKLYAIPgIhpHQtCGWcdoe6zKViTtcYd6mMAgCY8a0HlmpKdtDy12b+AMt8pPUjOD9Y56j/KrYfQtmNmp5RDVfQ35mJ+bJFtY+q8a8McZiDLqf9/nb0mAZzyyF6JxgkcRW6PjsPaJV2wccCldQK9h2LUeQQqG/XoJleKPuJh8OPaqgjbAbk4c0zeNopKpWldxyV0uK3HAcUuNBe0s2HrKjqV0UMFGGgW7N6OvucBA0xlmKR+vG3BlnqDob5xZYOneSbhto+Y24YfiyZQfSz4DY/kdCAkw7LLBOaeafDZGztE/hpLm6VEOpQ8mnayzZaWfDugGzPLj3JD80VRlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Wed, 15 Jul
 2026 20:00:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 20:00:45 +0000
Date: Wed, 15 Jul 2026 13:00:43 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Remove ifdef in DRM_GPUVA_OP_DRIVER svm subop
 checking
Message-ID: <alfm64MJgdYCya/G@gsse-cloud1.jf.intel.com>
References: <20260715103104.63954-1-mika.kuoppala@linux.intel.com>
 <3c48aa92-6451-4b8e-a1b8-75cec4899296@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3c48aa92-6451-4b8e-a1b8-75cec4899296@intel.com>
X-ClientProxiedBy: MW4P223CA0006.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5e104a-10c5-4a49-59ae-08dee2abc21e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|4143699003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /SX/P6QU2bIpPhI+UFHTOUz2ZgUPg4fUuYP5vNeEtcq/PCHhhA2ZLwZpG4x1HrGMlgc/aHVqZBjTxr99TiCYUTX2EER45AT1lw/8RCX56nmwJkOOouy1xls05zDd4eXSeMJ7DKsDd9nbSCTsZ21/cwPX3SFhG+hBZAdiu781cNzjRzBSk+Kl0QD8FJgvbill01pPKdvETsu8l16HGX0p8Y1Ncmnmi3+4V0LLfO2gZAwjYo6p6T4AbFGpnI6TmOMicOoBU0aO6S8ApGLYFrTDRx/SPxwC/xwwsLEmqOiw8ZPFZCaoxkfQYO6W4yfRLjkQ/mLYWOVgX07Zm0YIKCeSnTnAoZAhVQ8jtuddDTL/m/DDHRhjCb+auIXG4yKpfXOr29LabY1gmwBRnG/92r+ql5eb8zFQdzAyLQ/30MXO5/CXeAPPfUTIAqsU9wpS+nkzqHYKflGf5O1ixo7a1kE2H4X3aIOIEdPkC0pVL0JTCgBvjCYFrAELFua0ebZPq/H0Y/v9B7bWmBFiVs5wMhnaKsCL0XI27OTfb45PDr30GvxhKOAAG7aLc0byjGuWIvaC1et5rSzgM3rUaoeAR+toKF9/auDVjtS+HB4CEcFfSJLcZICqEwSd1zkCNbDqau45CrtRJpP9MTPW9+Vye6MRb7DdGvJJB7VXf+BJn4hUQ7A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4LvbBKn5Z7P5w9xZbcJ47evmHs5QpHFoe0zI64nE+QgXydk5FSC/XCky0TDB?=
 =?us-ascii?Q?GKeE7+SP9YgaObF6BlJEsOYnn9+2ITLXYQHuvolmjrQOAoowP7mGaNaeVniu?=
 =?us-ascii?Q?14da33IPysMfTdI0YqO6iWW2ftp45/ocZXgx7v+//g8vmVBkh6801PsibIlQ?=
 =?us-ascii?Q?LqPDXQo06h8GI9Gy4X+s4JlVvmeX6RjY6kQRT0cmIRjMLvdgJJkXTIze2pQc?=
 =?us-ascii?Q?toQQItecs5vMa/aKkN9usOPcIx4rE4pqTSYTQAmxakJQhrShqWrcOEA8u2we?=
 =?us-ascii?Q?ClCUM7nREOkQg8foouOJCFqbWP5/hZYTlSzwmtV816epWIag5syUKo0sAXy6?=
 =?us-ascii?Q?nSrDS6BSS1i3/kSURqXVbE1erZQN5S1WLN3gbfxSUPa9YbFMYLfcjIQusPW/?=
 =?us-ascii?Q?XLpOgpuwyO8y6VqMQR+A+aZPVDqNs2Z+BT7oFUgKM7bGxogvVOTp0k/MRrgz?=
 =?us-ascii?Q?sciKFEWpEtlA9lOIB3NKa1jNDDdqRFZIdr344aG48nIXRzS3NxdtNTGqbp2U?=
 =?us-ascii?Q?3pzLQyiH4M14tiYlf98opq6T3n5o88Aa8A/X02y95A6Sl/lMJoelAg8kaRbG?=
 =?us-ascii?Q?MlzGgU1CvrgBX583y8SXpiMOnGBhpdSdkpobAydI4D7REPlP/lJ4VlFB8kOc?=
 =?us-ascii?Q?FuXVaqtetPCT4KvsaSBC42ZTvV97UHG4tlNVtUFQks5bVKmgpxkrcy6tIsMK?=
 =?us-ascii?Q?R5AARtAB1uBOZXgoiSvtKiECHir6+UDN97a+tydjXXMiiz5XMwdbTMrUIDr3?=
 =?us-ascii?Q?6zQBxFP8zj34DUKL7NqU4bhRhrLqUId+Ty89e1WZJxMEI722Eo/3IQJx9+2l?=
 =?us-ascii?Q?XdQIv2fCC7czTl6zZ4byUheWYUW92fDPowen70dx5fIt2nLNDdRi2hXAFNMP?=
 =?us-ascii?Q?qo15g6ErHCY4e/Ald78EcOUj+p4vsRTdVwaN9YrZaWqnqrAHGVAxhTXvg7v5?=
 =?us-ascii?Q?qi9iw7OPvitcdjxTYgWDABTN+6ec/QhdX1vq5GdUAAwHj9JYFa5owQmGvAk9?=
 =?us-ascii?Q?Yn6dG/SAuIjlvqW/41QISSXcOWFwuZT4oEuxPBJkMcyoPTdcs0fiOZDyKNMv?=
 =?us-ascii?Q?IJu7WCR5hx6+OJnE3mO6rJqJkdAOm2VHjXqrj1MSBnCjGe9lqcXVM2tNs5U7?=
 =?us-ascii?Q?HX3A0ILkD9yoYJbrxAVD/RuwvUMAwfq25sN6aGnoWazJ6PPVYDzXlIRwnVWK?=
 =?us-ascii?Q?JYBu2nwRlL0n11p/nqRrrOltj5mX7bgcF3Xz4llLSC367fY2Bg8oFr0nUxqa?=
 =?us-ascii?Q?8RTDztvuFSH8k8KzRieTzC6FYYrc8TOcIN2XwEbbgMqpFZBn19tdrI64bywo?=
 =?us-ascii?Q?RH8x+UcdgavRthBjz7gF8FnJS8ogM3vZ9YSA9HRi+hgL0QAQj59xmR18KrO2?=
 =?us-ascii?Q?v3AQb6rUBKx58IGDqkhu7Dk0jPB0y8PvdmOUBRZYwWA0zcdKHcx5xtwHmGNm?=
 =?us-ascii?Q?C9rW2WuE5F4WcvOo3jFK9nYap/4ju3iLqRmC8+mQP6v/1mMvr1Moq5S9jFK6?=
 =?us-ascii?Q?dlBK99lv8Ae5QUxbORY8cKH0LMUpZvE2utp42Vdb/nvK4GjjP5ZVFKwNMjZp?=
 =?us-ascii?Q?CiJg52BeSDtgheVwf0MU/hEGVDSPkDJsaHiPNgZW+sHhoXh7k1p+GrbNPMb+?=
 =?us-ascii?Q?Z7fio1rKQjfCcWSXeDhJ5PdfPei43q7JpL7NRWyT58fWz5nDRZH1kauUOBNC?=
 =?us-ascii?Q?h4RrEfOeK/8YIXQuNY7L4DrHluEYpehHWMWtRysVm8btDB7nFyGIWT0nGZPQ?=
 =?us-ascii?Q?k1HlQM1EvQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Bc5MyUoYUTOb4Pk+bg6KTmbg28afwkoKGGvIjRGUVZl773SU0QVYfxLzJDRAiT4rMqQkH1KCydVshmia/3WjZFkO5aSnbf9uwfjxnw2Wvnq3g8l245tjIF0wb5JwS0crEMlZSWfP1WuMKJ17X6n3DJnFbpgB3V4v9jV80g273AM/BtDG4PTdMQk2Hb2fSMRKHm+5Ef0V6Qtatiso+Mof5ueGTZelRngiI3sXqzyCD1tzgUtgiccia90TiznQqCXxrcGKjIUfV+UUUmtjRC5QxYhTLUZRVmbxV8+zCNDqP8O3+4H56mKmiVQi5ggIw9oupoQAcU1So9He1L/uC6N0+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5e104a-10c5-4a49-59ae-08dee2abc21e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 20:00:45.8866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ATlnWDp13Axom22ERV0EYUG8XznGlMF+24RJZhwR4kRq85JFrfXttbtNVXlUQyher4CC9WVhD4dXA/w1Q+c+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
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

On Wed, Jul 15, 2026 at 01:28:46PM +0100, Matthew Auld wrote:
> On 15/07/2026 11:31, Mika Kuoppala wrote:
> > Always emit the DRM_GPUVA_OP_DRIVER case so the previous break is
> > effective and we never fall through to the default warning.
> > This also allows adding more subops in the future without ifdef dancing.
> > 
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> 
> Assuming it still builds,

+1

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   drivers/gpu/drm/xe/xe_pt.c | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 7111b5d0f6aa..d1b939dfaa13 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1547,7 +1547,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> >   			err = vma_check_userptr(vm, gpuva_to_vma(op->base.prefetch.va), pt_update);
> >   		}
> >   		break;
> > -#if IS_ENABLED(CONFIG_DRM_XE_GPUSVM)
> >   	case DRM_GPUVA_OP_DRIVER:
> >   		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
> >   			struct xe_svm_range *range = op->map_range.range;
> > @@ -1562,7 +1561,6 @@ static int op_check_svm_userptr(struct xe_vm *vm, struct xe_vma_op *op,
> >   			}
> >   		}
> >   		break;
> > -#endif
> >   	default:
> >   		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> >   	}
> 
