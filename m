Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC7CC30658
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jul 2024 16:21:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC5410E63E;
	Tue,  2 Jul 2024 16:21:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JRkzQrzS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9221810E63E
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Jul 2024 16:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719937261; x=1751473261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9+yR9CLoS9Zj1va2z6YploCoQO32fJ9PGBT4A3lxY4E=;
 b=JRkzQrzSVqrihBqR9wXmSA5jH6SfKW81ZyL5UgjF9t66QB02cUOECqxu
 dyzE432k/+NY1STYReuRkEY5cz8JYCXUF/W9ME2/4q1VhN8zkBV28Z/qR
 yjyUMfWoQwxc6nXo76KwoOtaZ3Yz1qrp7wipH+GlILRp/Mwa7kQlsmvA9
 1CWrC557yWuYX3k8oUqivkZIQB+0eO7b/qCmuidnWNmVFtEsJn5+qWvhV
 jiSPPxJ4gPUd136wyDEKIWtt2TspZeqTMAUJ2FG+g7t4sJ7I9zgv7zjUC
 zsyY88+t+60v0A1cviYAVRg1pLu5zs5oX2GBK4RPFK0joFHVyvkirQ7O6 Q==;
X-CSE-ConnectionGUID: ESStgZ4kQOWTmYtctqF5kg==
X-CSE-MsgGUID: lu75QWCLQvyh4qEvOfEqUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17338317"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="17338317"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 09:21:01 -0700
X-CSE-ConnectionGUID: EPVNZ5JITJyPBmWyZ0gR+g==
X-CSE-MsgGUID: G1GaOT0GQQayV8oDpUjJaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; d="scan'208";a="51155887"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jul 2024 09:21:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 09:21:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 09:21:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 09:20:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcwOvJmn2WQRtA+nGNlZY7q+gmtxc7FQvfMYhoiM5LkaJpv4QiDgwwyGYzC9uBH7TbWOzkVCHzmhPXZ2TkIDLKsVgRZiPmDLyJpj2rgoc9fiGZa2mGB38GHTUBB8Pta6ylR8Uti92QLFwtluA9QLd65sqD2e/iYu81ksucE4Fak2QEEn7GgEwGO+CqB+hg73UcTe8WuZw4+ZR6oWoO8jmEiY9anzIeLHlHlvV72dppPPXfcOo9uKVjMySaQZM1e2i6eeg4jIeaDYOEBwHa81+KUv60kH/tnqILa+lZl9seE+PqszxXGdO0euR+ebV09vwec1iF0gWQxgHJRfoSaryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFIoWID9l2/7rIeo56sRh8Ex79OE01if5jD+vuxTBlI=;
 b=Dv3rOHH7TLGNJd74ofvhi7S6mJyfvxerIBPoH6KwelSXWEQ9vt6n0gQ1iVMY+T8CbpygPaBgceCbqwI/4FbMZyr4DzP/k26MjYW+bbqACaWfDEE1scez7oe4GcakPHRtbK2MeR68BJd7J0WUlURBTZAnipabO9DX5q32kR4cJOK6yD6ydWuc8BLLHKEYFeTmbHOSioO3PF3JhYnUYD7fgidtmR/qR6Agr4WbY6YHTe/byaRaZ8HrIrebdcbjcUshKE0T7s2ndlbjn709ZrOWCjcKdpukMG1IQU1yva2YLqSXgKXNUsiaSEL9hKwNsTfNQo76YP6QhvktIy85KU1zJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 16:20:55 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 16:20:55 +0000
Date: Tue, 2 Jul 2024 12:20:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH] drm/xe/obsrv: Rename xe perf layer as xe observability
 layer
Message-ID: <ZoQo5F7cUsM3VZKE@intel.com>
References: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240702160740.2487279-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::15) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f27355-e259-421f-8413-08dc9ab2f30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?U/p/muyLuGyopkZBDQC8db4iqSLVarD7FCqHI6p8q8kqcgwaOHMm9h/+d2?=
 =?iso-8859-1?Q?f5JyVnV0VsEhWpnwqnwKhKYCyRiQP1clyVaCh1ssTae4JrmAKaW2Gd93gj?=
 =?iso-8859-1?Q?9pEcyeR5tHXwokYaO96OpK+ZicV/ugqD9LkEsXb+KzIQpJ7LTZCmuT7FKf?=
 =?iso-8859-1?Q?4iDSBTjjkUJQwu1SL8sUXRHj7RYoKo9NgY1MXc5zD2S6z75UjFDWzEvIW7?=
 =?iso-8859-1?Q?RQpbtggtJ6QsgIbYOOxes4wxD2JCHC682o/S4a9kTtbJEZ8QN9mBJDopKK?=
 =?iso-8859-1?Q?N1e7iRRnpILaV0Yp8Dcbup8rCJHTdR5E7ir9u35kpeZ8+JD0en2R8kqUr3?=
 =?iso-8859-1?Q?lCb1IHmdyKN/hLjJKIzaCZa6iZQ2VRyamv+2kEJ3Y1fu2Okcy7BYNF4iQz?=
 =?iso-8859-1?Q?5WW2/+KievREY4bbswGFtzvQ5CbHnL8NeTdg5fRR4Fna+XgwaEyGtk8swp?=
 =?iso-8859-1?Q?BmgaaQvOWnMtbMo6BX8LIrtx7N3c73cS4PohJp8+fgN53z7aVYi5YPOmEX?=
 =?iso-8859-1?Q?h/CiW6GIsdWa0T88Nous3BZzONDFznN2gaXf3v3xK1yKEz7l/CRe4rOb4I?=
 =?iso-8859-1?Q?jBb6VJaI6A/vD9UyTfHdWC13fD/BTK/TrhDNh9gs/xdR/lrL3OC5czxiNg?=
 =?iso-8859-1?Q?lKzjLrMuQZEXilOyTK0NC9BZtgR5NgvZXWS/FB22SybJgOCYFnQwPP/nJw?=
 =?iso-8859-1?Q?pr8kgRXHmq9NPHM7xRn6Iv5RERtMP+S1X4YxcIZESoZVjZtVsROpb2DSr6?=
 =?iso-8859-1?Q?/sRmI/vA5L3OayCb+91u+V1JVzMzFbuE4cgiHs9pxAhLwH+kyB6ldGIjNN?=
 =?iso-8859-1?Q?pCsWTqLafRuFvv2cVJxz8I8N4k+HHZKPlMKChDzkNna1n5JXXSpPrSXFRR?=
 =?iso-8859-1?Q?hWbWi2OOSCMXifu3OJKQpfeg3/fRhgmXqatnaGYauhFp3aPczGyqZHygen?=
 =?iso-8859-1?Q?5KQzSRVUHf4QeFdN29iffsIM4guU5rQPQRCfFIxGhy4vDW8EV6GoHGeBXM?=
 =?iso-8859-1?Q?bZ5yuNHVfCllZV0Fa/ET+jWEOkrHusNVrulu3DCUHgOtpAyQZyd3lERyL4?=
 =?iso-8859-1?Q?E0o3tfab5UstR4F8nUPoNoCKs+TWc0dDx2aJtL7Ecz9I1z/pK4IxUPuCxe?=
 =?iso-8859-1?Q?+C1HIdTD6aKzbZHZ3suyCBpvkmFlFOOnwsss5C2JHrgDpB6h0lMeyg1YvK?=
 =?iso-8859-1?Q?bKTg2jnPs9nIsqWWDVltn88TmbQ7KWcuxN8H3TaZIZCeYCOZlJz9ctKs3G?=
 =?iso-8859-1?Q?gRBsLazxohwqUCyUEkTeT3cid4ouS3GqAX1MM+bUVpdDuPDrCnhl19JRgh?=
 =?iso-8859-1?Q?VB3Pxr9k8hsY2ySC0b5JMRvqazJI4+HF3uOPCHknVR0u+5Ck4UdT2ZhviW?=
 =?iso-8859-1?Q?rcRYnhdGN2CMv4iUi+9JgspK5Wp1on3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EzKavZinmmcCblCfpU8FSMFfyvKPnP9UgUVbWUrWep4a2qnIp9JHxBWKe3?=
 =?iso-8859-1?Q?sHuVBluTlovCXK7GBcoi79DguE3nFG1Rb8L+rsRN1Wf+8I7n8dvu+8R51y?=
 =?iso-8859-1?Q?SmOjrBKPMTUgA9m7nTF9F5oFKJuuSw0laQxpyvpgaNV007UnpP/gL9C5nj?=
 =?iso-8859-1?Q?ZevM7yAoJyb3pCDNdjBphNbENrJXETqXTAhpQtapff2FzQRBgbi5HK8+xU?=
 =?iso-8859-1?Q?bDlz/43t49Pb00vL9KaG4Fvs5Tn/Pqndn2r0v5sJKg6QMvXIbSfhgClQ75?=
 =?iso-8859-1?Q?BIXeV3Y2+aCsjskX7kOihCvUiiiyn/XLqb7LNh6jEBsT6AIRzaIF93i2P/?=
 =?iso-8859-1?Q?2b816YtyAPFwHpC2iUIiZUiA8r1tYJHN8DVI6dgXl1bSWiqYoqtk4KL3EC?=
 =?iso-8859-1?Q?Eew1Aj+HYNlVnRowxKEvY+7/GvpsEEYq7wiiQlAdhX2ztx4GMkpxOl+aa8?=
 =?iso-8859-1?Q?LMu/+fB2AyqvtskenDZ43K3SUSRV4+qptUUWiL83Buk56XsRROktUzkSZQ?=
 =?iso-8859-1?Q?AlXIas0qavsyV+s+5BeS66bK8Nw2LjtnFoF5IJrXlS76wcCkpddrECEdBs?=
 =?iso-8859-1?Q?lMUNDQWg8f/ATiYg7EFd8PlKiCyOM+OCW+xn0RCWHGGQeyBlkgT7otjJwn?=
 =?iso-8859-1?Q?JkknXyVVLqAyecmiCj2t/G30OED+G5KWcIrn39uzQybAIBhnU/azt3oZhu?=
 =?iso-8859-1?Q?NRrFW6uVjCavXSR+DtPdrAarTJltwUk8/Sw207WQQvE8WVcPa//H4YZsxX?=
 =?iso-8859-1?Q?gdvhTKS9MBql0aKDrVnGNmRAm5/kPHi2tSvIk7kmJ7JpM9nM6pISfjScLB?=
 =?iso-8859-1?Q?Jvg6P1bDxL8/OoJcAlUNl1TCoSA3O8P8BWBdry2o8DtDCK8ux99azEhH8k?=
 =?iso-8859-1?Q?AlrGzV9nKVB/KPr3C//xuhpUdhcd/iEgVgWPxdTZ1deXw8XsZUEtcHBI9K?=
 =?iso-8859-1?Q?4pI7Em4ySKUGZs6T7mfmAezKiHQAx6fF6fqFoIieMqDKiADsc40StHa5rT?=
 =?iso-8859-1?Q?XYSUwuSthjBlLB10f8NUsWfnsf0LnWpvIlXVEkIYdUGZkS7tp443x07AZP?=
 =?iso-8859-1?Q?BHvCEKY0psYesVSms63fiblOB3rB0mVSi7A3346LtFQEJulyxIfnpzNr3x?=
 =?iso-8859-1?Q?bTB/PyRiJlpKPSFUSSkOtftTi1fQI0gjU7/LM2oStNP1VCPe/wCDdWAtnL?=
 =?iso-8859-1?Q?3yLylajgvUbjgOyCPQvfXOTGzlntw/c6Cj0zuA8WPKlYE+ZnVGkKygHM4m?=
 =?iso-8859-1?Q?NICCFhm7PTLyYt/b8aZudBH+Add6zn0J5htWTZV7dyfvNvvmKVPBvRIxxv?=
 =?iso-8859-1?Q?OrEmqIaVUhCakFsKpd6vaV3EAd6K4VHk7zjjmKzKU6KLej2xFWXepDtBQe?=
 =?iso-8859-1?Q?Gs12b7Dv9hVZIxgzs9iQ0Gaa+O8sytZRjD6yeooLgg9Dw/UmWAM/kyvUqJ?=
 =?iso-8859-1?Q?y2B82macX2NJrklYbZbKsB1fzvCWtXT1ixYOUDdF+uWjhMRZRKRgz4d+Iw?=
 =?iso-8859-1?Q?UgySxAPEvgCnfixydNQiDdJCUcmzNrBEs3lTUy4KP4UChHsJpIP5Yf8XPZ?=
 =?iso-8859-1?Q?dby9AE1iet8wLyoKURI48deYtD+jfagY78HmNWxIOpSJrXGoJEnYMM6m9p?=
 =?iso-8859-1?Q?EyDpuM4JVbC656x0ZQhVnXpq2ifqUZ2Zk/gB5ZeQ7IgXw+jr+3IQH/cg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f27355-e259-421f-8413-08dc9ab2f30f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 16:20:55.5784 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CNbFNufBKB2te5LntpcUWPLH1fTvT6yhkcHTUOYlHeTL4z96IxOxyMbd/3IN05NNQXwZ4yNB4o1NBMgObpcLhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6451
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

On Tue, Jul 02, 2024 at 09:07:40AM -0700, Ashutosh Dixit wrote:
> In Xe, the perf layer allows capture of HW counter streams. These HW
> counters are generally performance related but don't have to be necessarily
> so. Also, the name "perf" is a carryover from i915 and is not preferred.
> 
> In this patch we propose the name "observability" for this common layer
> which allows capture of different types of these counter streams.

Yeap, perf is indeed a bad name. I thought about observability at first
because I always read 'OA' as observability architecture. Although Matt
Roper convinced me that the most recent spec pages calls that as
Observation Architecture.

Shouldn't we go then with xe_observation?

Well, although, OTOH, xe_observ can be applied as short to whatever
bspec page you are looking at ;)
Then perhaps just a mention to both names in some doc?

No strong preferences on what final name, but +1 on changing the
name:

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>

> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  2 +-
>  drivers/gpu/drm/xe/xe_device.c       |  4 +-
>  drivers/gpu/drm/xe/xe_device_types.h |  2 +-
>  drivers/gpu/drm/xe/xe_gt_types.h     |  2 +-
>  drivers/gpu/drm/xe/xe_module.c       |  6 +-
>  drivers/gpu/drm/xe/xe_oa.c           | 34 +++++-----
>  drivers/gpu/drm/xe/xe_obsrv.c        | 93 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_obsrv.h        | 20 ++++++
>  drivers/gpu/drm/xe/xe_perf.c         | 92 --------------------------
>  drivers/gpu/drm/xe/xe_perf.h         | 20 ------
>  include/uapi/drm/xe_drm.h            | 97 ++++++++++++++--------------
>  11 files changed, 187 insertions(+), 185 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.c
>  create mode 100644 drivers/gpu/drm/xe/xe_obsrv.h
>  delete mode 100644 drivers/gpu/drm/xe/xe_perf.c
>  delete mode 100644 drivers/gpu/drm/xe/xe_perf.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index b1e03bfe4a68..21e8ebe10e85 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -96,10 +96,10 @@ xe-y += xe_bb.o \
>  	xe_mocs.o \
>  	xe_module.o \
>  	xe_oa.o \
> +	xe_obsrv.o \
>  	xe_pat.o \
>  	xe_pci.o \
>  	xe_pcode.o \
> -	xe_perf.o \
>  	xe_pm.o \
>  	xe_preempt_fence.o \
>  	xe_pt.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cfda7cb5df2c..adf6cec662ea 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -42,9 +42,9 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
> +#include "xe_obsrv.h"
>  #include "xe_pat.h"
>  #include "xe_pcode.h"
> -#include "xe_perf.h"
>  #include "xe_pm.h"
>  #include "xe_query.h"
>  #include "xe_sriov.h"
> @@ -142,7 +142,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
> -	DRM_IOCTL_DEF_DRV(XE_PERF, xe_perf_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_OBSRV, xe_obsrv_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index c37be471d11c..4a51f0152cf2 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -463,7 +463,7 @@ struct xe_device {
>  	/** @heci_gsc: graphics security controller */
>  	struct xe_heci_gsc heci_gsc;
>  
> -	/** @oa: oa perf counter subsystem */
> +	/** @oa: oa observability subsystem */
>  	struct xe_oa oa;
>  
>  	/** @needs_flr_on_fini: requests function-reset on fini */
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index 24bb95de920f..005c38fa3b4a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -389,7 +389,7 @@ struct xe_gt {
>  		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>  	} user_engines;
>  
> -	/** @oa: oa perf counter subsystem per gt info */
> +	/** @oa: oa observability subsystem per gt info */
>  	struct xe_oa_gt oa;
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 893858a2eea0..76002c0202c4 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -11,7 +11,7 @@
>  #include "xe_drv.h"
>  #include "xe_hw_fence.h"
>  #include "xe_pci.h"
> -#include "xe_perf.h"
> +#include "xe_obsrv.h"
>  #include "xe_sched_job.h"
>  
>  struct xe_modparam xe_modparam = {
> @@ -80,8 +80,8 @@ static const struct init_funcs init_funcs[] = {
>  		.exit = xe_unregister_pci_driver,
>  	},
>  	{
> -		.init = xe_perf_sysctl_register,
> -		.exit = xe_perf_sysctl_unregister,
> +		.init = xe_obsrv_sysctl_register,
> +		.exit = xe_obsrv_sysctl_unregister,
>  	},
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 4188516a7816..ba23efb49f42 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -32,7 +32,7 @@
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
>  #include "xe_oa.h"
> -#include "xe_perf.h"
> +#include "xe_obsrv.h"
>  #include "xe_pm.h"
>  #include "xe_sched_job.h"
>  #include "xe_sriov.h"
> @@ -481,7 +481,7 @@ static int __xe_oa_read(struct xe_oa_stream *stream, char __user *buf,
>  					  OASTATUS_RELEVANT_BITS, 0);
>  	/*
>  	 * Signal to userspace that there is non-zero OA status to read via
> -	 * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl
> +	 * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl
>  	 */
>  	if (stream->oa_status & OASTATUS_RELEVANT_BITS)
>  		return -EIO;
> @@ -1158,15 +1158,15 @@ static long xe_oa_ioctl_locked(struct xe_oa_stream *stream,
>  			       unsigned long arg)
>  {
>  	switch (cmd) {
> -	case DRM_XE_PERF_IOCTL_ENABLE:
> +	case DRM_XE_OBSRV_IOCTL_ENABLE:
>  		return xe_oa_enable_locked(stream);
> -	case DRM_XE_PERF_IOCTL_DISABLE:
> +	case DRM_XE_OBSRV_IOCTL_DISABLE:
>  		return xe_oa_disable_locked(stream);
> -	case DRM_XE_PERF_IOCTL_CONFIG:
> +	case DRM_XE_OBSRV_IOCTL_CONFIG:
>  		return xe_oa_config_locked(stream, arg);
> -	case DRM_XE_PERF_IOCTL_STATUS:
> +	case DRM_XE_OBSRV_IOCTL_STATUS:
>  		return xe_oa_status_locked(stream, arg);
> -	case DRM_XE_PERF_IOCTL_INFO:
> +	case DRM_XE_OBSRV_IOCTL_INFO:
>  		return xe_oa_info_locked(stream, arg);
>  	}
>  
> @@ -1209,7 +1209,7 @@ static int xe_oa_release(struct inode *inode, struct file *file)
>  	xe_oa_destroy_locked(stream);
>  	mutex_unlock(&gt->oa.gt_lock);
>  
> -	/* Release the reference the perf stream kept on the driver */
> +	/* Release the reference the OA stream kept on the driver */
>  	drm_dev_put(&gt_to_xe(gt)->drm);
>  
>  	return 0;
> @@ -1222,7 +1222,7 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>  	unsigned long start = vma->vm_start;
>  	int i, ret;
>  
> -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>  		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
>  		return -EACCES;
>  	}
> @@ -1789,8 +1789,8 @@ static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ext_number
>   * @file: @drm_file
>   *
>   * The functions opens an OA stream. An OA stream, opened with specified
> - * properties, enables perf counter samples to be collected, either
> - * periodically (time based sampling), or on request (using perf queries)
> + * properties, enables OA counter samples to be collected, either
> + * periodically (time based sampling), or on request (using OA queries)
>   */
>  int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
>  {
> @@ -1836,8 +1836,8 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, u64 data, struct drm_file *f
>  		privileged_op = true;
>  	}
>  
> -	if (privileged_op && xe_perf_stream_paranoid && !perfmon_capable()) {
> -		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe perf stream\n");
> +	if (privileged_op && xe_obsrv_paranoid && !perfmon_capable()) {
> +		drm_dbg(&oa->xe->drm, "Insufficient privileges to open xe OA stream\n");
>  		ret = -EACCES;
>  		goto err_exec_q;
>  	}
> @@ -2097,7 +2097,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>  		return -ENODEV;
>  	}
>  
> -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>  		drm_dbg(&oa->xe->drm, "Insufficient privileges to add xe OA config\n");
>  		return -EACCES;
>  	}
> @@ -2181,7 +2181,7 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>  /**
>   * xe_oa_remove_config_ioctl - Removes one OA config
>   * @dev: @drm_device
> - * @data: pointer to struct @drm_xe_perf_param
> + * @data: pointer to struct @drm_xe_obsrv_param
>   * @file: @drm_file
>   */
>  int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *file)
> @@ -2197,7 +2197,7 @@ int xe_oa_remove_config_ioctl(struct drm_device *dev, u64 data, struct drm_file
>  		return -ENODEV;
>  	}
>  
> -	if (xe_perf_stream_paranoid && !perfmon_capable()) {
> +	if (xe_obsrv_paranoid && !perfmon_capable()) {
>  		drm_dbg(&oa->xe->drm, "Insufficient privileges to remove xe OA config\n");
>  		return -EACCES;
>  	}
> @@ -2381,7 +2381,7 @@ static int xe_oa_init_gt(struct xe_gt *gt)
>  
>  	/*
>  	 * Fused off engines can result in oa_unit's with num_engines == 0. These units
> -	 * will appear in OA unit query, but no perf streams can be opened on them.
> +	 * will appear in OA unit query, but no OA streams can be opened on them.
>  	 */
>  	gt->oa.num_oa_units = num_oa_units;
>  	gt->oa.oa_unit = u;
> diff --git a/drivers/gpu/drm/xe/xe_obsrv.c b/drivers/gpu/drm/xe/xe_obsrv.c
> new file mode 100644
> index 000000000000..f04ed4eb86b1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_obsrv.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/sysctl.h>
> +
> +#include <drm/xe_drm.h>
> +
> +#include "xe_oa.h"
> +#include "xe_obsrv.h"
> +
> +u32 xe_obsrv_paranoid = true;
> +static struct ctl_table_header *sysctl_header;
> +
> +static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_obsrv_param *arg,
> +		       struct drm_file *file)
> +{
> +	switch (arg->obsrv_op) {
> +	case DRM_XE_OBSRV_OP_STREAM_OPEN:
> +		return xe_oa_stream_open_ioctl(dev, arg->param, file);
> +	case DRM_XE_OBSRV_OP_ADD_CONFIG:
> +		return xe_oa_add_config_ioctl(dev, arg->param, file);
> +	case DRM_XE_OBSRV_OP_REMOVE_CONFIG:
> +		return xe_oa_remove_config_ioctl(dev, arg->param, file);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +/**
> + * xe_obsrv_ioctl - The top level observability layer ioctl
> + * @dev: @drm_device
> + * @data: pointer to struct @drm_xe_obsrv_param
> + * @file: @drm_file
> + *
> + * The function is called for different observability streams types and
> + * allows execution of different operations supported by those stream
> + * types.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> +{
> +	struct drm_xe_obsrv_param *arg = data;
> +
> +	if (arg->extensions)
> +		return -EINVAL;
> +
> +	switch (arg->obsrv_type) {
> +	case DRM_XE_OBSRV_TYPE_OA:
> +		return xe_oa_ioctl(dev, arg, file);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static struct ctl_table obsrv_ctl_table[] = {
> +	{
> +	 .procname = "xe_observability_paranoid",
> +	 .data = &xe_obsrv_paranoid,
> +	 .maxlen = sizeof(xe_obsrv_paranoid),
> +	 .mode = 0644,
> +	 .proc_handler = proc_dointvec_minmax,
> +	 .extra1 = SYSCTL_ZERO,
> +	 .extra2 = SYSCTL_ONE,
> +	 },
> +	{}
> +};
> +
> +/**
> + * xe_obsrv_sysctl_register - Register xe_obsrv_paranoid sysctl
> + *
> + * Normally only superuser/root can access observability stream
> + * data. However, superuser can set obsrv_paranoid sysctl to 0 to allow
> + * non-privileged users to also access observability data.
> + *
> + * Return: always returns 0
> + */
> +int xe_obsrv_sysctl_register(void)
> +{
> +	sysctl_header = register_sysctl("dev/xe", obsrv_ctl_table);
> +	return 0;
> +}
> +
> +/**
> + * xe_obsrv_sysctl_unregister - Unregister xe_obsrv_paranoid sysctl
> + */
> +void xe_obsrv_sysctl_unregister(void)
> +{
> +	unregister_sysctl_table(sysctl_header);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_obsrv.h b/drivers/gpu/drm/xe/xe_obsrv.h
> new file mode 100644
> index 000000000000..13cf4a8029a7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_obsrv.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2024 Intel Corporation
> + */
> +
> +#ifndef _XE_OBSRV_H_
> +#define _XE_OBSRV_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_device;
> +struct drm_file;
> +
> +extern u32 xe_obsrv_paranoid;
> +
> +int xe_obsrv_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> +int xe_obsrv_sysctl_register(void);
> +void xe_obsrv_sysctl_unregister(void);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_perf.c b/drivers/gpu/drm/xe/xe_perf.c
> deleted file mode 100644
> index d6cd74cadf34..000000000000
> --- a/drivers/gpu/drm/xe/xe_perf.c
> +++ /dev/null
> @@ -1,92 +0,0 @@
> -// SPDX-License-Identifier: MIT
> -/*
> - * Copyright © 2023-2024 Intel Corporation
> - */
> -
> -#include <linux/errno.h>
> -#include <linux/sysctl.h>
> -
> -#include <drm/xe_drm.h>
> -
> -#include "xe_oa.h"
> -#include "xe_perf.h"
> -
> -u32 xe_perf_stream_paranoid = true;
> -static struct ctl_table_header *sysctl_header;
> -
> -static int xe_oa_ioctl(struct drm_device *dev, struct drm_xe_perf_param *arg,
> -		       struct drm_file *file)
> -{
> -	switch (arg->perf_op) {
> -	case DRM_XE_PERF_OP_STREAM_OPEN:
> -		return xe_oa_stream_open_ioctl(dev, arg->param, file);
> -	case DRM_XE_PERF_OP_ADD_CONFIG:
> -		return xe_oa_add_config_ioctl(dev, arg->param, file);
> -	case DRM_XE_PERF_OP_REMOVE_CONFIG:
> -		return xe_oa_remove_config_ioctl(dev, arg->param, file);
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -/**
> - * xe_perf_ioctl - The top level perf layer ioctl
> - * @dev: @drm_device
> - * @data: pointer to struct @drm_xe_perf_param
> - * @file: @drm_file
> - *
> - * The function is called for different perf streams types and allows execution
> - * of different operations supported by those perf stream types.
> - *
> - * Return: 0 on success or a negative error code on failure.
> - */
> -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> -{
> -	struct drm_xe_perf_param *arg = data;
> -
> -	if (arg->extensions)
> -		return -EINVAL;
> -
> -	switch (arg->perf_type) {
> -	case DRM_XE_PERF_TYPE_OA:
> -		return xe_oa_ioctl(dev, arg, file);
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
> -static struct ctl_table perf_ctl_table[] = {
> -	{
> -	 .procname = "perf_stream_paranoid",
> -	 .data = &xe_perf_stream_paranoid,
> -	 .maxlen = sizeof(xe_perf_stream_paranoid),
> -	 .mode = 0644,
> -	 .proc_handler = proc_dointvec_minmax,
> -	 .extra1 = SYSCTL_ZERO,
> -	 .extra2 = SYSCTL_ONE,
> -	 },
> -	{}
> -};
> -
> -/**
> - * xe_perf_sysctl_register - Register "perf_stream_paranoid" sysctl
> - *
> - * Normally only superuser/root can access perf counter data. However,
> - * superuser can set perf_stream_paranoid sysctl to 0 to allow non-privileged
> - * users to also access perf data.
> - *
> - * Return: always returns 0
> - */
> -int xe_perf_sysctl_register(void)
> -{
> -	sysctl_header = register_sysctl("dev/xe", perf_ctl_table);
> -	return 0;
> -}
> -
> -/**
> - * xe_perf_sysctl_unregister - Unregister "perf_stream_paranoid" sysctl
> - */
> -void xe_perf_sysctl_unregister(void)
> -{
> -	unregister_sysctl_table(sysctl_header);
> -}
> diff --git a/drivers/gpu/drm/xe/xe_perf.h b/drivers/gpu/drm/xe/xe_perf.h
> deleted file mode 100644
> index 53a8377a1bb1..000000000000
> --- a/drivers/gpu/drm/xe/xe_perf.h
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -/* SPDX-License-Identifier: MIT */
> -/*
> - * Copyright © 2023-2024 Intel Corporation
> - */
> -
> -#ifndef _XE_PERF_H_
> -#define _XE_PERF_H_
> -
> -#include <linux/types.h>
> -
> -struct drm_device;
> -struct drm_file;
> -
> -extern u32 xe_perf_stream_paranoid;
> -
> -int xe_perf_ioctl(struct drm_device *dev, void *data, struct drm_file *file);
> -int xe_perf_sysctl_register(void);
> -void xe_perf_sysctl_unregister(void);
> -
> -#endif
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 12eaa8532b5c..b80d0b0d7bb2 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -80,7 +80,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> - *  - &DRM_IOCTL_XE_PERF
> + *  - &DRM_IOCTL_XE_OBSRV
>   */
>  
>  /*
> @@ -101,7 +101,7 @@ extern "C" {
>  #define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x08
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
> -#define DRM_XE_PERF			0x0b
> +#define DRM_XE_OBSRV			0x0b
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -116,7 +116,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> -#define DRM_IOCTL_XE_PERF			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_PERF, struct drm_xe_perf_param)
> +#define DRM_IOCTL_XE_OBSRV			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSRV, struct drm_xe_obsrv_param)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1376,66 +1376,67 @@ struct drm_xe_wait_user_fence {
>  };
>  
>  /**
> - * enum drm_xe_perf_type - Perf stream types
> + * enum drm_xe_obsrv_type - Observability stream types
>   */
> -enum drm_xe_perf_type {
> -	/** @DRM_XE_PERF_TYPE_OA: OA perf stream type */
> -	DRM_XE_PERF_TYPE_OA,
> +enum drm_xe_obsrv_type {
> +	/** @DRM_XE_OBSRV_TYPE_OA: OA observability stream type */
> +	DRM_XE_OBSRV_TYPE_OA,
>  };
>  
>  /**
> - * enum drm_xe_perf_op - Perf stream ops
> + * enum drm_xe_obsrv_op - Observability stream ops
>   */
> -enum drm_xe_perf_op {
> -	/** @DRM_XE_PERF_OP_STREAM_OPEN: Open a perf counter stream */
> -	DRM_XE_PERF_OP_STREAM_OPEN,
> +enum drm_xe_obsrv_op {
> +	/** @DRM_XE_OBSRV_OP_STREAM_OPEN: Open an observability stream */
> +	DRM_XE_OBSRV_OP_STREAM_OPEN,
>  
> -	/** @DRM_XE_PERF_OP_ADD_CONFIG: Add perf stream config */
> -	DRM_XE_PERF_OP_ADD_CONFIG,
> +	/** @DRM_XE_OBSRV_OP_ADD_CONFIG: Add observability stream config */
> +	DRM_XE_OBSRV_OP_ADD_CONFIG,
>  
> -	/** @DRM_XE_PERF_OP_REMOVE_CONFIG: Remove perf stream config */
> -	DRM_XE_PERF_OP_REMOVE_CONFIG,
> +	/** @DRM_XE_OBSRV_OP_REMOVE_CONFIG: Remove observability stream config */
> +	DRM_XE_OBSRV_OP_REMOVE_CONFIG,
>  };
>  
>  /**
> - * struct drm_xe_perf_param - Input of &DRM_XE_PERF
> + * struct drm_xe_obsrv_param - Input of &DRM_XE_OBSRV
>   *
> - * The perf layer enables multiplexing perf counter streams of multiple
> - * types. The actual params for a particular stream operation are supplied
> - * via the @param pointer (use __copy_from_user to get these params).
> + * The observability layer enables multiplexing observability streams of
> + * multiple types. The actual params for a particular stream operation are
> + * supplied via the @param pointer (use __copy_from_user to get these
> + * params).
>   */
> -struct drm_xe_perf_param {
> +struct drm_xe_obsrv_param {
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
> -	/** @perf_type: Perf stream type, of enum @drm_xe_perf_type */
> -	__u64 perf_type;
> -	/** @perf_op: Perf op, of enum @drm_xe_perf_op */
> -	__u64 perf_op;
> +	/** @obsrv_type: observability stream type, of enum @drm_xe_obsrv_type */
> +	__u64 obsrv_type;
> +	/** @obsrv_op: observability op, of enum @drm_xe_obsrv_op */
> +	__u64 obsrv_op;
>  	/** @param: Pointer to actual stream params */
>  	__u64 param;
>  };
>  
>  /**
> - * enum drm_xe_perf_ioctls - Perf fd ioctl's
> + * enum drm_xe_obsrv_ioctls - Observability fd ioctl's
>   *
> - * Information exchanged between userspace and kernel for perf fd ioctl's
> - * is stream type specific
> + * Information exchanged between userspace and kernel for observability fd
> + * ioctl's is stream type specific
>   */
> -enum drm_xe_perf_ioctls {
> -	/** @DRM_XE_PERF_IOCTL_ENABLE: Enable data capture for a stream */
> -	DRM_XE_PERF_IOCTL_ENABLE = _IO('i', 0x0),
> +enum drm_xe_obsrv_ioctls {
> +	/** @DRM_XE_OBSRV_IOCTL_ENABLE: Enable data capture for a stream */
> +	DRM_XE_OBSRV_IOCTL_ENABLE = _IO('i', 0x0),
>  
> -	/** @DRM_XE_PERF_IOCTL_DISABLE: Disable data capture for a stream */
> -	DRM_XE_PERF_IOCTL_DISABLE = _IO('i', 0x1),
> +	/** @DRM_XE_OBSRV_IOCTL_DISABLE: Disable data capture for a stream */
> +	DRM_XE_OBSRV_IOCTL_DISABLE = _IO('i', 0x1),
>  
> -	/** @DRM_XE_PERF_IOCTL_CONFIG: Change stream configuration */
> -	DRM_XE_PERF_IOCTL_CONFIG = _IO('i', 0x2),
> +	/** @DRM_XE_OBSRV_IOCTL_CONFIG: Change stream configuration */
> +	DRM_XE_OBSRV_IOCTL_CONFIG = _IO('i', 0x2),
>  
> -	/** @DRM_XE_PERF_IOCTL_STATUS: Return stream status */
> -	DRM_XE_PERF_IOCTL_STATUS = _IO('i', 0x3),
> +	/** @DRM_XE_OBSRV_IOCTL_STATUS: Return stream status */
> +	DRM_XE_OBSRV_IOCTL_STATUS = _IO('i', 0x3),
>  
> -	/** @DRM_XE_PERF_IOCTL_INFO: Return stream info */
> -	DRM_XE_PERF_IOCTL_INFO = _IO('i', 0x4),
> +	/** @DRM_XE_OBSRV_IOCTL_INFO: Return stream info */
> +	DRM_XE_OBSRV_IOCTL_INFO = _IO('i', 0x4),
>  };
>  
>  /**
> @@ -1546,11 +1547,11 @@ enum drm_xe_oa_format_type {
>   * Stream params are specified as a chain of @drm_xe_ext_set_property
>   * struct's, with @property values from enum @drm_xe_oa_property_id and
>   * @drm_xe_user_extension base.name set to @DRM_XE_OA_EXTENSION_SET_PROPERTY.
> - * @param field in struct @drm_xe_perf_param points to the first
> + * @param field in struct @drm_xe_obsrv_param points to the first
>   * @drm_xe_ext_set_property struct.
>   *
>   * Exactly the same mechanism is also used for stream reconfiguration using
> - * the @DRM_XE_PERF_IOCTL_CONFIG perf fd ioctl, though only a subset of
> + * the @DRM_XE_OBSRV_IOCTL_CONFIG obsrv fd ioctl, though only a subset of
>   * properties below can be specified for stream reconfiguration.
>   */
>  enum drm_xe_oa_property_id {
> @@ -1571,11 +1572,11 @@ enum drm_xe_oa_property_id {
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_METRIC_SET: OA metrics defining contents of OA
> -	 * reports, previously added via @DRM_XE_PERF_OP_ADD_CONFIG.
> +	 * reports, previously added via @DRM_XE_OBSRV_OP_ADD_CONFIG.
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_METRIC_SET,
>  
> -	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: Perf counter report format */
> +	/** @DRM_XE_OA_PROPERTY_OA_FORMAT: OA counter report format */
>  	DRM_XE_OA_PROPERTY_OA_FORMAT,
>  	/*
>  	 * OA_FORMAT's are specified the same way as in PRM/Bspec 52198/60942,
> @@ -1596,13 +1597,13 @@ enum drm_xe_oa_property_id {
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_OA_DISABLED: A value of 1 will open the OA
> -	 * stream in a DISABLED state (see @DRM_XE_PERF_IOCTL_ENABLE).
> +	 * stream in a DISABLED state (see @DRM_XE_OBSRV_IOCTL_ENABLE).
>  	 */
>  	DRM_XE_OA_PROPERTY_OA_DISABLED,
>  
>  	/**
>  	 * @DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID: Open the stream for a specific
> -	 * @exec_queue_id. Perf queries can be executed on this exec queue.
> +	 * @exec_queue_id. OA queries can be executed on this exec queue.
>  	 */
>  	DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID,
>  
> @@ -1622,7 +1623,7 @@ enum drm_xe_oa_property_id {
>  /**
>   * struct drm_xe_oa_config - OA metric configuration
>   *
> - * Multiple OA configs can be added using @DRM_XE_PERF_OP_ADD_CONFIG. A
> + * Multiple OA configs can be added using @DRM_XE_OBSRV_OP_ADD_CONFIG. A
>   * particular config can be specified when opening an OA stream using
>   * @DRM_XE_OA_PROPERTY_OA_METRIC_SET property.
>   */
> @@ -1645,8 +1646,8 @@ struct drm_xe_oa_config {
>  
>  /**
>   * struct drm_xe_oa_stream_status - OA stream status returned from
> - * @DRM_XE_PERF_IOCTL_STATUS perf fd ioctl. Userspace can call the ioctl to
> - * query stream status in response to EIO errno from perf fd read().
> + * @DRM_XE_OBSRV_IOCTL_STATUS obsrv fd ioctl. Userspace can call the ioctl to
> + * query stream status in response to EIO errno from obsrv fd read().
>   */
>  struct drm_xe_oa_stream_status {
>  	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1665,7 +1666,7 @@ struct drm_xe_oa_stream_status {
>  
>  /**
>   * struct drm_xe_oa_stream_info - OA stream info returned from
> - * @DRM_XE_PERF_IOCTL_INFO perf fd ioctl
> + * @DRM_XE_OBSRV_IOCTL_INFO obsrv fd ioctl
>   */
>  struct drm_xe_oa_stream_info {
>  	/** @extensions: Pointer to the first extension struct, if any */
> -- 
> 2.41.0
> 
