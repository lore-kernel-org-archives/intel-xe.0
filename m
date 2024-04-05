Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3935ACD11C2
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 04:53:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863EA10F16A;
	Fri,  5 Apr 2024 04:53:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WcwVlNI/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E929410F16A
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Apr 2024 04:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712292808; x=1743828808;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ibVSAunbqH4vr6s8ntwb3cvvp4K3Vx1garjiXKNqEL4=;
 b=WcwVlNI/mh78GD52qG+ywbRon1z1/SlIRjgB4qW7+Ppqnz8kAbQEnJTQ
 OFikW3Cqj9Q/rMb2Stmg3fEcU98FibbAUdrR6m+Vjkva9kCf6vhQISHJF
 ZmICTTXhkKsjWKvLxTA7lBwB/RwcoTA71B1/TcGTmtMCX3ALBs99GEQq5
 KijFSTm9x34SE2bVHIt1DNSgOHaatCJ5klYaKW+lkWlVDseZnMvW8ObW3
 pwbkz1wRPknT3SXqE8nvHs4v3qChDIHPO19CpGJwOS2laJarNx16Tvixs
 iVvZzvyL2zRSfobhxan/ufTW7+XM40aVGj9wpYReF+CPsUFlL6RobSGgg Q==;
X-CSE-ConnectionGUID: khnEYOh4Qx22venG//coEw==
X-CSE-MsgGUID: UlI6ypfQSzOJCmJdzvjAbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7493130"
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; 
   d="scan'208";a="7493130"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 21:53:27 -0700
X-CSE-ConnectionGUID: 6J8Hdv9YQD6My9q/GrPgBA==
X-CSE-MsgGUID: x0kIzc49TNGEdiqbIyxInw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,180,1708416000"; d="scan'208";a="23714513"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Apr 2024 21:53:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:53:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Apr 2024 21:53:26 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 4 Apr 2024 21:53:26 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 4 Apr 2024 21:53:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7blKFzURZto9SuXRgMJDCIMPMZ4jF3Ph3o8XNk6tlS0IZfH1tpOUsBeZeOAyqsjypCuXSwkYFq3P6BFqwqY3nW/kU5743IB/ezehaaQDwVxKYoDwvTqQRG3sNtS0LtMhvkBAyXarFUjGJydRWwB7R82COMBnBYZ/5zmrboSB4KA+yf3OIzROk0Bkm6p3l/+tjispytS1mti2SyqwAF+2kwBxPV5LDOZdhpotK45TBX2y+SAqMIf5n3wnxytExxbZWwxok5a25bQiVy6yrUnhWN6YUIYHGq5UZxfiM0m8VX0QlJVt+iAVjur8vck2UhVGrZ7COi3ZoD5Xc4k7UwYvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CADf12X2geVl8eAGcJgec7LkcrlKaHkZbeDl+5LQISc=;
 b=Yj9bxTrSsUgFv47g+DFRIlOBm92DIsrqdkYdYGNH5jpwKrz5ZCsDCyMV6SAU/hgvk1/0Mk8G3Nj3xIfU5wLtY1bRVX6dKVt96SnvumBHJr9U4bM1MfS5TtIbphG5OWvwUkc0YNMg07JkDOyiYCOUUPv+S1WgjEOn21FG/3XzQWtq+duOn7zMx9kMl3D3vTOfvbmLnIZrZGE6tRXs/0EbyeBwrvGojaUb3kfHqkWsKebZnBMeYQV8QcVF1SVaAr2qnjytS4oNxiOs/2+0UktrXOJ1eLs7ghAhiT29jQ8dN2I7Qn6xS8l944c7rC0n2nFJC6JXTYTlQZ1QDafxGT+RUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 5 Apr
 2024 04:53:17 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 04:53:17 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH] drm/xe: Modify minimum of  various scheduler timeout to 0.
Thread-Topic: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0.
Thread-Index: AQHacUYV0AWxb3a6iUinxCV4AiMcwrFZRm9g
Date: Fri, 5 Apr 2024 04:53:17 +0000
Message-ID: <SJ1PR11MB620468E340A5DB962ACE074581032@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240308110058.2479126-1-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH3PR11MB7937:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0AG/waug+JxA2rM+XB8tSb/TvzS7KZKpqSVPfupbJ2c9CGpWLmWww0YMUPPdLhAqgrhOQqhT2DAwspQxBmtWJXr7Ea+L3FFSYr/m/7sXKS2R2qKxFLgQsyK+CpzYnJr7955jhtuD1Je2uSSLvFmDZtZQ0HFKjEBOcasACg3vDfZNYgYQFEJx6VWS7+bcE2mYc9Qw07pr0D/LLtldjfOUNLzFFq1JMMgl4NgbR5mE69VdUwsNotqvx1rDx9pGc70MjZX4YNNu4R7tZb863Jbijz03lap8062eMgKFR49ohvI+BfZA8E4wIqWJGck9qQSKGzK7SI6C1lGKdvidA2IL8ml7nUguImvcVUR7dQaSwiuZVSO4SouC5Ulub6irP4zGfDlRO10wri0+wGeLw6dPAqly683Kg4/R2MKfKrHk+tsJs25VysJ3ROcTcWznkERfaRRyoBmevkHfvrES73Pc5W5gr50vT/Z5uGMchgL+ShSQcMoaUTxyURf0+phel5FAQGWBl0GFwJJ9fBMZocOnlqAg4C8y+/vs1GSDAKB/1b/teGzIeGqodOaiib8htb+DuQ6Grtn1zNhOacsSR9L+pIEGcpBWwRw2LOLhJj7MVQhaD6J+ZnZ8ApZWvest4thdcZU/iorUgLf4CNfyNAwQFqaDe1800ea0lu/x6+zrqK8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?s5E9C4Z1E8JSj3asYHdruoBLGgPIhZWEUkrYssuG3W0lSY8LMd6uWFX/WL42?=
 =?us-ascii?Q?DkgA/rNusMKbxhOV2hQp96Af4kauSPtvKJ+yacXQGmh3LpH8Pl7d9sotXJCf?=
 =?us-ascii?Q?XLy4TOVPRQr7rtAcaJfFN8fRi0PaO1vEo0KwLQ9E7BPDQtklAWl/9DPmutod?=
 =?us-ascii?Q?EtgSoMozDjBFSJNz1jlH2rVxQkjSwZC8FkWZz3fP8WvjFTNHG/IJ4+kz0k6L?=
 =?us-ascii?Q?RuIuGOlESQuCxwnacda/Zz5+r2Xi6I3mYfE7CQ8shdceFn4x5I9oeEjIO0vS?=
 =?us-ascii?Q?L1pd7unrmeTzgtaqCOqC65A7V7jt22ReS7P1mQhRdTri8n6QvxErU3/Dz3XQ?=
 =?us-ascii?Q?RoXiQY/3Iy6SayO4Rw6W0aq4SDvy88i55AV5aGZTjnrzS4gaXZNJSQqRXPp+?=
 =?us-ascii?Q?97yBRPea+vsIYB8eeE7eKtxlEamYaoy7s1lCAXvyQmmtbq00PQXDVr4W63rU?=
 =?us-ascii?Q?TZi0CUhcBTdXbrF0lBjhErWrgUn/HEUngodizDbx9jeTiiQjasLufNPjqlgg?=
 =?us-ascii?Q?3LEOWHpH5MDAwPI54t6eAIPQgrbSo+LiYdNiVmw/fKd4ZlQdxC18M+zVQZS3?=
 =?us-ascii?Q?8v3wQdevpcO11vzLfBQXEBKKvsmtYL6e0ym3tuphxY0r5ZlossCn8D06m0YE?=
 =?us-ascii?Q?c83n2khlSWSQL9U/+QnTiMqaJg7OsL50/XA3Fiqt0w7uvMi9d2bPcGGbehBC?=
 =?us-ascii?Q?nDWYdNNG7nMH9b0S/xKbyUaL4kBhuTabENQw8G95Ip44VDFgc2PnlMvR7H2q?=
 =?us-ascii?Q?sYRU8sQuuGJETtFZN6ouaokySNarmpMgss3wrL+YdWf8cYGyya9C2K6oaiW5?=
 =?us-ascii?Q?duAUzXZfUr8HKwOqHXs9HX6H6tpFvuD4nK4zO7yPEmRXax/pjExr0e5A6Ikm?=
 =?us-ascii?Q?9d7qHmML8N/kvCH0Shnxg7Y0pRK/ULqyAa15R/8N0/69CzeaIDy8fbrcgkM8?=
 =?us-ascii?Q?9OOeIAFOp/+iaEJ0tr0GOdBWaax0mVURAOCudVJ3U55rBzCIfqw5YuP37Oym?=
 =?us-ascii?Q?lEtRMf2qgFuFXpuNEkUFmxH/jvaab7H1Ovigm4Vt0dbmZTFTHNNeW3GwKvaS?=
 =?us-ascii?Q?kSHzik5BMwb/dqX87RvyiVSw1bo2RywmiFcDwh9hP/pnZyVU4rMUGgn1fgIk?=
 =?us-ascii?Q?PaUhykGHQfE0/4iP02kgtIdYrE2viOzOP+JC1wgKIOkQnTD/hVittow3kuGa?=
 =?us-ascii?Q?q61LrdiYJTYYhxWEpu95Z/j/1KuyYaWUrXw4CwRLpP5vBFtOwv2W2YxK0vCt?=
 =?us-ascii?Q?RYwP7vzazfPvlxiXG7G7/bbQJYZetbIIn9i04Jhiy/DbgEfOM3/Gt3zeNkH/?=
 =?us-ascii?Q?R9ByfGWRZ2SHVL/EdSskXgPsTXQyLAIV/UBe3AT66558/c8p+8fjgqMyDqgh?=
 =?us-ascii?Q?C5ZNDuJ3eI88tHrQCF0QupqlYZDfGy5sSESjVlmylVgbtCglBFs3CT3F3/gh?=
 =?us-ascii?Q?X4myCbGLBjqb9uC/KrRzTwxoaM/smSfUyzPb5EJeiniuAfwnfcMviZdXJhYo?=
 =?us-ascii?Q?FTo3878Y2/p0wrRwjqcZjPNPh6y8D4eJjEAnDN9F5ghEWqxJUlt9OOyAMQ12?=
 =?us-ascii?Q?3jpPdW5S2w/eLREzaJ9JvAhlM+4ETGWvC+1XAdQPVyNmqVMI+S5cgQj/4u23?=
 =?us-ascii?Q?uf8Mit6+BwTHbVlMMxVI62k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a67587d7-ccd6-4553-d551-08dc552c4f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 04:53:17.6938 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a/9mQGpDm2GZBpZjz6WZjnfPoz6Bxwx5j+NlHOoh667dJDSqgTM4mkJr0to1lElWqqIh35crmJxIsSF7P485UzP5HyjO5zoNnX/b8ftzWwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
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
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Friday, March 8, 2024 4:31 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost,
> Matthew <matthew.brost@intel.com>; Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH] drm/xe: Modify minimum of various scheduler timeout to 0=
.
>=20
> The sysman teams needs to disable preemption and timeslice to test
> exclusivity mode and are relying on setting 'timeslice_duration_us'
> and 'preempt_timeout_us' to 0 for the same. Hence set the min configs to =
0.
>=20
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/Kconfig.profile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig.profile
> b/drivers/gpu/drm/xe/Kconfig.profile
> index ba17a25e8db3..80e80b55467f 100644
> --- a/drivers/gpu/drm/xe/Kconfig.profile
> +++ b/drivers/gpu/drm/xe/Kconfig.profile
> @@ -18,7 +18,7 @@ config DRM_XE_TIMESLICE_MAX
>  	  contexts by guc scheduling.
>  config DRM_XE_TIMESLICE_MIN
>  	int "Default min timeslice duration (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min timeslice duration between multiple
>  	  contexts by guc scheduling.
> @@ -39,7 +39,7 @@ config DRM_XE_PREEMPT_TIMEOUT_MAX
>  	  run.
>  config DRM_XE_PREEMPT_TIMEOUT_MIN
>  	int "Default min preempt timeout (us)"
> -	default 1 # microseconds
> +	default 0 # microseconds
>  	help
>  	  Configures the default min preempt timeout after which context
>  	  will be forcefully taken away and higher priority context will

You need to set default  prempt timeout to be 0 in XE_HW_ENGINE_PREEMPT_TIM=
EOUT_MIN  drivers/gpu/drm/xe/xe_hw_engine.h as well.

Thanks,
Tejas
> --
> 2.25.1

