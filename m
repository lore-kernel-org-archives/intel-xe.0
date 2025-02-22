Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3241FC021B2
	for <intel-xe@archiver.kernel.org>; Sat, 22 Feb 2025 07:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFB510E14A;
	Sat, 22 Feb 2025 07:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HPhXmzkC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFBAC10E307
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Feb 2025 07:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740208687; x=1771744687;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IbshQa/TKOKal0KpiQsBlCQg6+NxZwkxVW5rDRJmZG0=;
 b=HPhXmzkC9+S18UtlKU6cHTcWDmoIstlPswizM5S4O0VZxDKyINpzcgq0
 jrWDkVERMx+SSbdI/PzydyO9sqCb1Ww6RR8m4Ffy2s56hnnKMdBI3EzYi
 Q9V9EablTuRJs89+9mIfo6MGuEpQOW1NigrmxfdgpaZFE5q8SR3Kg5UiP
 pqs60ANFe23HwXwc38jreYcSB6STPfoWNs2ar8BmhcITqLG5QCSoYJcp8
 ZFzPiWBf+u/wV7sOrmJ6Omj3N0R4LLpBkhUyDY2sKbgPVkf1sWEJ4X61A
 7L3dAjUB6JVrsamYuxDOAWcf8Sn4suRewegiCsgvOqoD3T/8vrGxe/KMi Q==;
X-CSE-ConnectionGUID: YOMYwdwUTjK9pezucOp2bQ==
X-CSE-MsgGUID: PkoQDUy0S2ahcQob9vn1ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41294088"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; d="scan'208";a="41294088"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 23:18:07 -0800
X-CSE-ConnectionGUID: qTnf1cj/Tf26oSGCZiaMJQ==
X-CSE-MsgGUID: A3PAsOEnTG2GaKqoxIzGrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; d="scan'208";a="115583558"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 23:18:06 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 21 Feb 2025 23:18:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 21 Feb 2025 23:18:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 23:17:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JF5t4LWqVGOVSAjNr1nniidrY8PaiDn6GHiLgbxdK864u0yv19CRU5Qv4h/c4AvCLEXgfAqzqESry6GfHf+85BKlxq0ZEW08SH9nmGUzRkxU5wCVKEEOyUe0lAOlVI9yw31JFzgwo7SnSqgoMlNQC+pYi7DxyMGusiLazuowKfsE2hn5WTI6pEU1PhGOH4cS/CUJcFTxEDMAenx7Z29rxp+MoeAOcOJXp6HiBAT4M+buse/odHoYZR7Z9FAOik81QCt48dM5Fi6lJ4xyonPj75jW53jFQ0ypDLqB3ukzG8e4I1hnK6XMuRhz/QJJHIuoiwmDGRRC+W1mTFtnSxPMxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/ikf4+rC0NX7dvVQE4fJL1TF+oM4xqBeY+oqL3A6ZQ=;
 b=oEbNASMOQ7UZj7mZJczpYZuYjKOOYtdce6pbl6NNIWrZa2AriT2f76ftigefWApGdgIKo7pShjlcyeMFlvPJAhBvfNgKAgI2j1GV+zBFaTzTU6Shj8o3B//Nf6Y5syQD2CdCSSF/aY/KgmVIy/9EJDv0ayCLFVEEjhEaEGriAjotVoueSY01f1x1BUdSqxx1/lnNT9QqeZEnGaXEpslER63LLq75M9611pgykw5Mllf+3s0KgzLyhRYoQyXaIZgmgAJet/HxcNo+lgQBfi0zdS6XlvK3aXlRjo8npVl8OR9yHcG/I6epOVaPIAcxOz6FBkINbwYHOw9K4LhA7ijIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB6698.namprd11.prod.outlook.com (2603:10b6:510:1ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sat, 22 Feb
 2025 07:17:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8466.015; Sat, 22 Feb 2025
 07:17:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: RE: [PATCH] drm/xe: Make sure scheduler is ready before submission
Thread-Topic: [PATCH] drm/xe: Make sure scheduler is ready before submission
Thread-Index: AQHbg5OFd5Hy8GZwc0eM+vmwe4f3FrNSA6aAgADm5BA=
Date: Sat, 22 Feb 2025 07:17:51 +0000
Message-ID: <SJ1PR11MB62049A747DD815101D9DEB7381C62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250220123859.291523-1-tejas.upadhyay@intel.com>
 <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
In-Reply-To: <Z7i2szvi1T19KQnR@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB6698:EE_
x-ms-office365-filtering-correlation-id: 26a34d80-61b5-400d-fb68-08dd531104a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0uOGBNNqu+JqAh0XRxBtlHcSDys7O+Bowy446z7KeRYM7oY2zZcdyzzjZ/6X?=
 =?us-ascii?Q?40D3a3NQDHNM88aIzTk2BQ/FoXGpPGGz1nO68PVyF3y9DbhHtq4TPw60gfqE?=
 =?us-ascii?Q?tyTqB25bH9SfSt8YXUOlV+f+i2mrCoeKZbEnJn1FQ3T9MyTHoE7OCqt/lDAq?=
 =?us-ascii?Q?TEXiH7eIP2n3pfAimxFj9T5pGiYfvbKGpX+EHYD7N/L5gv/mOtGld/788f8s?=
 =?us-ascii?Q?/gVojD2Qa9joK0etT2Fxsz7HqVfXUoQx5H0rH6M8eGILlG4U481TT+LI8RAI?=
 =?us-ascii?Q?7+W2USJKKLi3SSf7V5X1DoRNom1wzi/zwrlvwc8rh7HlWfjPvOshqBLZUfUZ?=
 =?us-ascii?Q?CVmmm59PGrNuf8sWOvsh2MGppbymNB8CNThvqm6SR5yD+fLNtYsLC3Z76/nm?=
 =?us-ascii?Q?p3vONDXpog8oGCDUVHinhsrdzuYNEeznFT7odU5k3rfe+BVe91i0NlrPgfCW?=
 =?us-ascii?Q?5ZGvXm4myz3ullosxcmX6NWN1jAxrvqmf7zQ0IjK5qeibF3NdPfdQqXeE5dk?=
 =?us-ascii?Q?GDJixzPfZ8HYESeflVLh49NrBsJcj0DablYOBdSLh6+47Fw8fnzZaKfXhNIh?=
 =?us-ascii?Q?4ob1VwZq7thQhES/vHSQJssntD6nLsmz+MEY0dxAKwFhCGzitXVeRgzpe0rc?=
 =?us-ascii?Q?JiqOj+Xx9RU/RSWDrAi/+jy6aoiIdpoOXkc8dAvWJ2wwPjpouCPskUxm4k/F?=
 =?us-ascii?Q?axkdwnkuaU2OZ2NNceOzuoemCeThsNc5Rt7GNAMerrBv9Tjmf0ZeW2lp1KxZ?=
 =?us-ascii?Q?urjZTjKpAkGGMQdXQr93YZaByuRDS8yu+0828z2vgoMsbNYjSqNa65FQ+CHs?=
 =?us-ascii?Q?gQNVs6zfjVvlKTzPu9nhCbtop5aOvUzK2CVsL5huJ7ol5SHmv3irCPug8/lG?=
 =?us-ascii?Q?xp12EngTnHodmMuRnGASmtVGuZzPOqIY4jpjJnWqfgFnWtmqvvh3mcsTbqF+?=
 =?us-ascii?Q?k99TrqGc52KOCnFHrDfc3R4zKNOcso05sUC/PR2/t1FRjrioFZP36WOrmukp?=
 =?us-ascii?Q?CktDFLGX7B78JGrTB4RSbQkqWBuF39RjbXHKzWMTljLdIewrppX8TLqifPAG?=
 =?us-ascii?Q?fQBuXQGvfd8N3T32CigrMV9cz+LZ3AQwI1qR2IXMhkGoIm+n9RaCQyMyIf/o?=
 =?us-ascii?Q?ii85aJsQP7Sahx29cDq/7wtzmkmOxN68ZPOeZ+KN6ADCSlArmaP31WUABJ8T?=
 =?us-ascii?Q?XMfxy7QXJ2lH4rxhgSFVGiC7kLvCJcKENH0r7mXfwyhZ3McLLGZmaBjZg1hC?=
 =?us-ascii?Q?ZMNQKrMKOUmn01pKZm5P8+WgGPJY1lDYorZF/IlZ/1dWym28pdWrXelhlTSS?=
 =?us-ascii?Q?E52caJv6dXhjO63LXqX/MD6ey537bN4s3wKsYznIenNrSx8aJWqV4NjCfNLC?=
 =?us-ascii?Q?CCKA1zR9aFSbBbJBXTdTqaVNbvrN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RBhVaFokiXj+RnSfSL93V6OpcTiK9vmN/Bigbe+5dnvFajVkK6hbBn5FRU2B?=
 =?us-ascii?Q?cB9Y9u610hsWVWyifQvDH/HUl2DGv8ha4nh7jg3qBXC/bYfzJs5tjFkZy4PM?=
 =?us-ascii?Q?bD6rGS/I9J2WsA/mzEYGfVIGJEERJi0V0eGwN0JZ9cQoAseuxSyITr7qPlsO?=
 =?us-ascii?Q?62S4XWM7Y4Hd3SZ7dAH3j5j+faPh+cS0Zs6hxnQkTzlYnoWH5JmtjC9NmEgR?=
 =?us-ascii?Q?UotPrItCnh27ejZt/HVCCG/w1InQnSBpejnq1kdLG+NtzsGB1KU2Uku+YHmE?=
 =?us-ascii?Q?xxIOqN2AM1hz3xnxnw6vAWm7NIJ6T0JpdwqXCf8/6ci4NBTg0EYAIwPOvLmn?=
 =?us-ascii?Q?6EbS0oIxTH9LkvJjyTtjFOqq5EFudIwdSgvc4d/Is2obYpvA2zgZDO8o1NWM?=
 =?us-ascii?Q?gMN2dZ1evCWYIxY8f4Oy4i33wt/0qLvi3bTJCDPoNM2B1c5pNNhU1IXh9VVb?=
 =?us-ascii?Q?hB4ldXzFRr5J1VVOdxUu4rl8ty7oCe5B1gSi3OC5wR0bDIOCJ4tKWJc5mRaJ?=
 =?us-ascii?Q?jGsM+psO+AexP5j48Q9b3dPy0jK+aU7BPFuceg5xoaafIEQL2xRHQjzOOq1R?=
 =?us-ascii?Q?LbzVjQ8ep3EWR+JAAebeXBVNs1ftnygYd+m5hYF5I1DMB0wjVnwA/whjvf9n?=
 =?us-ascii?Q?b3YmuWoMAC6YcvzoaRVzuS1GLpLmwkebKHh9EilBysY5V46GAz/E8rjNFtn4?=
 =?us-ascii?Q?iekHyoLIJi1zBNyoVvNM8FPFcXULBVJfpVCQaOhwmhYCxfKuoqfMu/ogpUgA?=
 =?us-ascii?Q?Q4yInwbR34qQBWIVTq7wLKta3Aoz8VZNpWRVVddLpx0le7J+ElaxMSkprKKh?=
 =?us-ascii?Q?55XKGuZOtGdhQ7ZhA+z3fePWAM/6yHRq+XpclvLghaTdlhHji0j67nruA2P6?=
 =?us-ascii?Q?RPvBpbJrY3CNiStAUtNGdIJt3pubozsdqKblRIuhL9udd9UltfTFIy79MPAP?=
 =?us-ascii?Q?1kF3kVVqseSXW/4xHjdJ6WjqBpl1BhSybRtdLPDI1yTqITfmlZ8q/wYCFi/t?=
 =?us-ascii?Q?Uj57WAMQrIRqMM8hsOJTo/Zz9BZ1pF9cDg05u20YvQ9laLeqEgtCJvIhu43h?=
 =?us-ascii?Q?3e+r5STxF/ccJw3WdVm1ITZLzA1ZBDXo1zEVCwPCno6lNPzG0np+N907VkcV?=
 =?us-ascii?Q?KFd0huUoB3Px8vnG4GQELuQ8MD6Tl5xBHWjOpg1LSPPUpVLzKeqaFkFpLHlb?=
 =?us-ascii?Q?4NP+TAxhDS8l0ln5jKjipObaWW7za4/e6nrWQzRE1UpqjQUDBQUo0u/Od5xy?=
 =?us-ascii?Q?27jjXmNOyu59VCOC4YgUsYXIeGrArm89ukBMbJMyJPQtc5Ai2YXeogkGc+XE?=
 =?us-ascii?Q?UegIDcZgl9YJjUpMPjqeFjTh2GV5ccJSy0A4BXYbdhfZ8EB94tGsvo+P1Hon?=
 =?us-ascii?Q?jD5yPIaI8i6OcA2itsOJUqK6GUzJFfhbjJmWNxn3ZzrMRyGdtYaBWCnkCTzp?=
 =?us-ascii?Q?YhxyzAffL1v4tQfeCzf7C/Q041IiDw0m8nCAM6GFlZaf6qHwdhCC3RnsL5j4?=
 =?us-ascii?Q?6H4Xs/CwTK0e4JYZF61lx5FxwztShabhlqBnwWXjECasZvH7yXQBlDSAXzsh?=
 =?us-ascii?Q?aYRf6TuOab+2MZrxqdWR4BiJXx8lCrWuOyYozS/I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a34d80-61b5-400d-fb68-08dd531104a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 07:17:51.3697 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pE/0wkBrOaPJEtKMe7+zAwZtGWhsAskWYfek+s06ZiP0AIxzJfME4TZQQFsRg/b8Ej6/lIUkfsPd7rvvDQJHKdwa8uhG32o7a8vJiaygRWQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6698
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, February 21, 2025 10:54 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>
> Subject: Re: [PATCH] drm/xe: Make sure scheduler is ready before submissi=
on
>=20
> On Thu, Feb 20, 2025 at 06:08:59PM +0530, Tejas Upadhyay wrote:
> > Async call to __guc_exec_queue_fini_async frees scheduler while some
> > scheduler submission would have already started.
> > To handle such small window race case, submission should only start
> > when scheduler is ready.
> >
> > It will help to solve below which is not easily reproducible,
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4223
> >
>=20
> I don't think this help. We can only enter xe_sched_submission_start if e=
xec
> queue is in &guc->submission_state.exec_queue_lookup and remove the exec
> queue under a mutex in release_guc_id before we call xe_sched_fini which =
flips
> the ready state to false. We then immediately free the scheduler - we'd b=
e
> getting a UAF in xe_sched_submission_start anyways.
>=20
> The gitlab issue looks like a memory corruption. Basically it is saying a=
 variable
> which is a bool is reading 107 which shouldn't be possible.

It gets issue, while accessing drm_sched_rq *rq, look at below,

static struct drm_sched_entity *
drm_sched_rq_select_entity_fifo(struct drm_gpu_scheduler *sched,
                                struct drm_sched_rq *rq)
{
        struct rb_node *rb;

        spin_lock(&rq->lock); --> here it crashes

Async free of sched_rq happens at,
 void xe_sched_fini(struct xe_gpu_scheduler *sched)
{
        xe_sched_submission_stop(sched);
        drm_sched_fini(&sched->base); --> here it frees sched_rq and marks =
sched_ready =3D false)
}

It looks like inbetween drm_sched_fini and xe_exec_queue_fini we are hittin=
g this issue, which might be avoided with check mentioned here in patch. I =
saw similar check being done but other drivers look below in drivers/gpu/dr=
m/amd/amdgpu/amdgpu_job.c,
                        if (amdgpu_ring_sched_ready(ring))
                                drm_sched_start(&ring->sched, 0);


Dump stack details :
[ 1481.378550] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[ 1481.385791] BUG: KASAN: slab-use-after-free in __lock_acquire (kernel/lo=
cking/lockdep.c:5089)
[ 1481.392598] Read of size 8 at addr ffff88812352a7a0 by task kworker/u128=
:11/2827

[ 1481.401506] CPU: 17 UID: 0 PID: 2827 Comm: kworker/u128:11 Not tainted 6=
.13.0xe-ptl+ #1
[ 1481.409475] Hardware name: Intel Corporation Raptor Lake Client Platform=
/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.5045.A00.2401260733 01/26/20=
24
[ 1481.422824] Workqueue:  drm_sched_run_job_work [gpu_sched]
[ 1481.428348] Call Trace:
[ 1481.430803]  <TASK>
[ 1481.432913] dump_stack_lvl (lib/dump_stack.c:123)
[ 1481.436589] print_report (mm/kasan/report.c:379 mm/kasan/report.c:489)
[ 1481.440206] ? __virt_addr_valid (./arch/x86/include/asm/preempt.h:94 ./i=
nclude/linux/rcupdate.h:964 ./include/linux/mmzone.h:2058 arch/x86/mm/physa=
ddr.c:65)
[ 1481.444511] ? __lock_acquire (kernel/locking/lockdep.c:5089)
[ 1481.448527] kasan_report (mm/kasan/report.c:604)
[ 1481.452141] ? __lock_acquire (kernel/locking/lockdep.c:5089)
[ 1481.456181] __lock_acquire (kernel/locking/lockdep.c:5089)
[ 1481.460030] ? check_chain_key (kernel/locking/lockdep.c:3967)
[ 1481.464137] ? __lock_acquire (kernel/locking/lockdep.c:5240)
[ 1481.468240] ? __pfx___lock_acquire (kernel/locking/lockdep.c:5077)
[ 1481.472604] lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/lo=
ckdep.c:5851 kernel/locking/lockdep.c:5814)
[ 1481.476331] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_ma=
in.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/schedu=
ler/sched_main.c:1199) gpu_sched
[ 1481.482099] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
[ 1481.486292] ? lock_acquire (kernel/locking/lockdep.c:467 kernel/locking/=
lockdep.c:5851 kernel/locking/lockdep.c:5814)
[ 1481.490143] ? process_one_work (kernel/workqueue.c:3212)
[ 1481.494360] _raw_spin_lock (./include/linux/spinlock_api_smp.h:134 kerne=
l/locking/spinlock.c:154)
[ 1481.498061] ? drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_ma=
in.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/schedu=
ler/sched_main.c:1199) gpu_sched
[ 1481.503825] drm_sched_run_job_work (drivers/gpu/drm/scheduler/sched_main=
.c:344 drivers/gpu/drm/scheduler/sched_main.c:1068 drivers/gpu/drm/schedule=
r/sched_main.c:1199) gpu_sched
[ 1481.509428] process_one_work (kernel/workqueue.c:3236)
[ 1481.513477] ? __pfx_lock_acquire (kernel/locking/lockdep.c:5817)
[ 1481.517693] ? __pfx_process_one_work (kernel/workqueue.c:3138)
[ 1481.522275] ? __list_add_valid_or_report (lib/list_debug.c:32)
[ 1481.527155] worker_thread (kernel/workqueue.c:3311 kernel/workqueue.c:33=
98)
[ 1481.530966] ? __pfx_worker_thread (kernel/workqueue.c:3344)
[ 1481.535243] kthread (kernel/kthread.c:389)
[ 1481.538510] ? kthread (kernel/kthread.c:374)
[ 1481.541824] ? __pfx_kthread (kernel/kthread.c:342)
[ 1481.545569] ret_from_fork (arch/x86/kernel/process.c:147)
[ 1481.549203] ? __pfx_kthread (kernel/kthread.c:342)
[ 1481.552986] ret_from_fork_asm (arch/x86/entry/entry_64.S:257)
[ 1481.556918]  </TASK>

[ 1481.560615] Allocated by task 8713:
[ 1481.564099] kasan_save_stack (mm/kasan/common.c:48)
[ 1481.564104] kasan_save_track (./arch/x86/include/asm/current.h:49 mm/kas=
an/common.c:60 mm/kasan/common.c:69)
[ 1481.564108] __kasan_kmalloc (mm/kasan/common.c:398)
[ 1481.564112] drm_sched_init (drivers/gpu/drm/scheduler/sched_main.c:1314)=
 gpu_sched
[ 1481.564121] guc_exec_queue_init (drivers/gpu/drm/xe/xe_guc_submit.c:1445=
 (discriminator 6)) xe
[ 1481.564349] xe_exec_queue_create (drivers/gpu/drm/xe/xe_exec_queue.c:152=
 drivers/gpu/drm/xe/xe_exec_queue.c:183) xe
[ 1481.564563] xe_exec_queue_create_ioctl (drivers/gpu/drm/xe/xe_exec_queue=
.c:687) xe
[ 1481.564777] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:796) drm
[ 1481.564859] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:894) drm
[ 1481.564937] xe_drm_ioctl (drivers/gpu/drm/xe/xe_device.c:210) xe
[ 1481.565149] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:906 fs/ioctl.c:892=
 fs/ioctl.c:892)
[ 1481.565154] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/com=
mon.c:83)
[ 1481.565159] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:13=
0)

Tejas
>=20
> Matt
>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 50361b4638f9..42ca3c4a299a 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -80,6 +80,14 @@ void xe_sched_fini(struct xe_gpu_scheduler *sched)
> >
> >  void xe_sched_submission_start(struct xe_gpu_scheduler *sched)  {
> > +	/* Async call to __guc_exec_queue_fini_async frees scheduler
> > +	 * while some scheduler submission would have already started.
> > +	 * To handle such small window race case, submission should only
> > +	 * start when scheduler is ready.
> > +	 */
> > +	if (!drm_sched_wqueue_ready(&sched->base))
> > +		return;
> > +
> >  	drm_sched_wqueue_start(&sched->base);
> >  	queue_work(sched->base.submit_wq, &sched->work_process_msg);
> }
> > --
> > 2.34.1
> >
