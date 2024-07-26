Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B25C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 13:56:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E7910E995;
	Fri, 26 Jul 2024 13:56:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BvtYSZiO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BE810E995
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722002179; x=1753538179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TSHtnQLyfQ4y9Npzp3F7Gj6DQSNTCI3Kr3vbFG5iddY=;
 b=BvtYSZiONns8fXOWI69cbi/vmE9efFTAm5XjKVI/Bxebudv373m+vSZq
 WwPV2A8Kuip+YN8UEMl/D93fl5L5GrUQf+vNeBBY0l0ab+83jRd8ai9JJ
 bl04Q+6CUf+JnQZvMl3tuXyXa7HN5ofmUo9jdtUF6WlYyKIjDbDu8NpSb
 NCxE7isFoXfmse9HxHILWTKuWL3kPqTqblQKrMPvVmryzkgkHZXNXBmYW
 ExIzjsXYQ9s5EhRy0rRG/p/ZI7Nao+BEtY1QEW6UoGeSxMOmU2xQHbMMd
 41yRSmucHTlsaHlq5O3mTWwpdmwu9zWX7gbyl85mXq3EJ1/F4M1A1IAss w==;
X-CSE-ConnectionGUID: SU4xwSO+Ql2eo9u9VrNRwA==
X-CSE-MsgGUID: PDL0Bnj5T22CiG4ArKjJUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="19935463"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19935463"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 06:56:18 -0700
X-CSE-ConnectionGUID: PCBB4SVySmqRIfDdHeeQ/w==
X-CSE-MsgGUID: zl7I41dlQWqOeAkSUMfIfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="57551678"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 06:56:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 06:56:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 06:56:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 06:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yML2SYe5dTYoYChc1Qerj9oYahrYtgQgkEsFCR6D8eoyquftP3xZeulaTHjh6kVLbuXeNTyeCtAprepKj3VYsdy+YozAxxYyyApQHX4D5MgM5D4x5BgPtm2xso110z+VnjYHf+O9ieK1fhC7N2tkfIZtkbvS2Qhn/CDBc0LYzoVpTOrFPOuLVglxFeIgaH0eRA6C+/EcwQ8bAKY7wJzRZID7Twlum3HxiOPl7XJkaWuof/Q6RUMRnqRfLTgwQMQt38RJuTBwEP1AVyycRAjg2U3Nf2IpvbbJ0/zp7+h8QXdakR6fZxCHGSm2Z2Y7q62NAlpsDf1XZi7GZQ1RxCp5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WUnnMdcYavjDQsS9dnJcajXNHxxCnqXzDiD7+qMtg4=;
 b=kb5BDEhnEtHjrMb4UiNjnL0mGDhMDxCOaCm0nzC4jDFW9vbNZ2Ejh0qK7xqcUNNT8cQfSXyOON2pzmCK4cH8Nku9BcOxR+tshXqYkl706dq5P2rLNT83XTEsT+z1wVplBdxjffHnt+g1K0kGEYT9a/yRTDyvlXiSiU083qmyxaJoRSn1B0u3T2PumzBu7UCuuq8ozPJDZZMEZpLU+qMVIlbZvDjrKly5gwYAdtVFoHN98HAtwzx+5c39WGOkdEG96lbxC7WQRJrzdab3aCUDJhpvOL0181bTA3YKyE2IC82oLRvjUp8dU1xNJWIrjEJ6KoqCyqGQiThbPOZNrDb7MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7394.namprd11.prod.outlook.com (2603:10b6:930:85::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 13:56:14 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 13:56:14 +0000
Date: Fri, 26 Jul 2024 08:56:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/guc: Add BMG GuC definition
Message-ID: <4f46evfhfu2a2wwtc3bvvn6opzzuox4y4cir4tyjnguwdxdaxx@gfsdwrlvwdbx>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
 <20240726012610.706749-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240726012610.706749-4-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR04CA0307.namprd04.prod.outlook.com
 (2603:10b6:303:82::12) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7394:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a087b5-2b1f-4bfc-ad6c-08dcad7ab6da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BXfVd5ccvG/Hkn3mg2oLpy1KBweaIeOt+TbF5zIcfqnpMlPgjHH7bq3t3cNc?=
 =?us-ascii?Q?6io0asJSbHTCwcTt+KlnNq9uze34Sj219YLvz2ZeRTEYCGB/RB+gI3tdfIil?=
 =?us-ascii?Q?wFjqqpwoAJC2oyGFvB1dlee6zAcigYdkkfKnH7O5hPM0fvyk9oUGguhiJEzV?=
 =?us-ascii?Q?i10QZWRYBQ8wAwwGRsoKUY8yt8pk7QRN5IjnmYg3uCngd5gMFhCD7euVKnM4?=
 =?us-ascii?Q?4n/c4QfWUa4Fivq9gLsLl3wxp7OQKxo9xa0w4qm9Z13oIZdCvmIU9V1S47p4?=
 =?us-ascii?Q?H0gnTdX0pbHR5wsCmPYz5G6o4vyZLMujR+sh+pEepPcUW6Py6qNIJ6cEO3RQ?=
 =?us-ascii?Q?g0F4g3PcHXQXUJJhOl1Z0244gnbYlXLBi8KLJy3dNsbcW7wUvOmC2Z2StR9z?=
 =?us-ascii?Q?hFmP6bnVcnnKP3TJq4rA0TCxTBlGXziCD+4EVdRJq1HKi/9ruQMLIRsR0O0K?=
 =?us-ascii?Q?av5tD37DMI3N1rdHol0t34S9301yLqGTYL4llOc7vuLyD/GP7N8cMoMSy1o5?=
 =?us-ascii?Q?8Z8aOdppIa0VSvEWB3IvB0SHy9LBd8ZCXIOwM7sxWPETuC/2d9i7obDuU9Iu?=
 =?us-ascii?Q?Y0yrooS36AnJylyBEEySvy5rVNsAxWxfPcsQlWOIR77Cmfb7lPTkVZ0IkfGE?=
 =?us-ascii?Q?DEh3orxEm3a3G1RqHKf6adpxmyO9KOinHvlXPnk6lZKB/UDCpnLYc+TctFjg?=
 =?us-ascii?Q?NjtRgC2dAAsDYJ3M1A/C+JIqDH3t08qNaHVT27ZHo8rk5CCEVKl7gOKytke7?=
 =?us-ascii?Q?VjT/6cKeU/Hmn/IWByOF/JyTZmkdqP6A3v2d3dT/hsZpGHoHWK3psCsbk9Ce?=
 =?us-ascii?Q?s/OVx908slAMwWR/S4X9aQNuLEXz5vRzNQJWmAVcLq54e+r6FGdHIHkDVmyA?=
 =?us-ascii?Q?w0hYsuotCVrq2Tr3yxkaELWvP6ym3f1PlzuBhBb26KB8bVV4LwMtUlT88f/a?=
 =?us-ascii?Q?Y27KDjUI6yTCxn/ujoN9FE2HL5TEp8qxBhoRDqtGWeSRO2vpxeKin6bG+DmZ?=
 =?us-ascii?Q?PF9OQ51AC7nKKU4mK97mqV+E/MwENk2Q5OWKB/SWrqbmQF8z2KZ7igsj+NsB?=
 =?us-ascii?Q?54Bn/xh8o15kbz9Urc6NuFAun7Kc6mS33xxBTJDCq/D4wB21+rrzpi9SZeM+?=
 =?us-ascii?Q?mr4qi3L+Dj5hZLxkwEtX4j77PnJMKDHIXqHdRNPiQZ9UKIuaL0u9uYfgCqdO?=
 =?us-ascii?Q?S6eqln8tgXlt0fxhvzpAe2p9KsEsRX+/K7+68JD6Hzw+/8Jih3QNd/pDA3V4?=
 =?us-ascii?Q?+yInnNxAYAss/oLEelviFRdjEn3jNw/Llu+c55IYly00QTNHbIxnsH+BECbF?=
 =?us-ascii?Q?W/kZbWLHnsT9Sxl43bjHR8Pse5Sq3OJXBVAAE1hIdN+UQA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zv1mk3+sJJLkvouYruAmI2M1nZXWTJ5dbpck4yJQwHV4Q06+m0EB4ILPA6Tk?=
 =?us-ascii?Q?q1KVSEvod/vilAjPdIlNnJ9g1sjp6WL7Q0e+GC7mTlNNaVIXmhSWXQ8IBlsv?=
 =?us-ascii?Q?JzFTXo1lyEKHhPVxAd54G89Gj5NildkRe4j20DQaFZYAKcno3mzRGKKd1Pbr?=
 =?us-ascii?Q?3ueEJf2E/EQAO0qiQM+QqEXXFLZG8ICQ2d2yE0g6uIFVLrj77zB65UA+odFi?=
 =?us-ascii?Q?vQt1eCIw7t2NgLivSHEt62qKVnsGaN4xW46BcgimRAEmLdZa29l1M44PQnpd?=
 =?us-ascii?Q?YttChQDaokSl6ZPviwATkIirjxLnLmQxRu/mi+tQqKiqj10arcPcsR5kDciS?=
 =?us-ascii?Q?w8m6XOJwjhF995BMLdk+Ov70LCi+KW4Dbrr2RoCAUOOrpiOqzDNTb3gmR95R?=
 =?us-ascii?Q?Zrm16yYgbMxswKXml1v/tI8cY9KENaYC64hwM4uzqN/WOk4AmOK3av5Tl5cP?=
 =?us-ascii?Q?ST+MC43JymL2MqDQFQjYQ/ZMfYIcEx/cPdHDuABve496Gm5mOJm1epUzpeFj?=
 =?us-ascii?Q?PD0jlCRsTX2tZ94+N/n/sL3Gpk01OhUhdOizlaSWg6fh147V3tMyDlJylNlK?=
 =?us-ascii?Q?9r8yUdAYKqjUx9vFNkoevU/cLPOZVT+QuZo6SKFUXLx115pzaEqNSTb1tvfQ?=
 =?us-ascii?Q?tKcvFqjf7+9jE/ZooH8F0NONfKF3x3wZVeWZFYkt1CA9mtXOqybmH/snisvB?=
 =?us-ascii?Q?XerMrjjiJuyn7gyGrgePT169kaHyi7PwJsbqvtTeTKVD4TYuw0WeVAQuW0On?=
 =?us-ascii?Q?poUZYMgwKChQnzsZQ27nIFPVeG3hqsmeqkVrSD9GEbkarzxHwt2wGzTLLL4N?=
 =?us-ascii?Q?xC7YHaJ5MwqUyozfRnXthdBs1G8GPSC8IoXLPxlPBmalFQvOqhqlTh2kKFR0?=
 =?us-ascii?Q?qx+uUq9J0VqhsasuIkPFDKtJX5/Fl1sC1RZH6E7FAxmKrgr0ULKhZsMislxU?=
 =?us-ascii?Q?6Y1iez7bxnvvxQmWiSlqwAULic6PthioR3tv/R/bOU8Mu4lY1nQQsZjXXYEg?=
 =?us-ascii?Q?swMzY5uk66m9K14xz0GFztWxJMIWxIRAmktSg+nMgGBrbkF2dLHK4xohDaKr?=
 =?us-ascii?Q?2yLckMoeqY503oxqDQ7C4QkHY/RhpBfH2u5wRrOQAFLsi4pQe4Ord1AbELU1?=
 =?us-ascii?Q?E/svM9Mqdj1W0lBWrEeOYDEi7DNbqUlUjgXvYVL84JM4Sha0BaJGVNDsKuqe?=
 =?us-ascii?Q?qKzttEhM2QQfrxtSFR14OkmbV0RsKC6qB8nZosxgTLPxkt6huNVrWu90PM8H?=
 =?us-ascii?Q?+Be2gXFrgl6LxQc8J4fPvwsD/Z3hqCoTfCz9JmBlubUsDAaqcd2+YP2aiS25?=
 =?us-ascii?Q?6aT+c8hhGI+TiiBQxRDci4lpaMp2+IvnsJ0B0I66PcDxB/tu1DDNnpIP1DvX?=
 =?us-ascii?Q?zuWWL8qr2sa4ay3p7oI3ejd9vYbxfRCVDFVcunIIu0WrNRi60mJpHN3/wbgL?=
 =?us-ascii?Q?+tbmiInvl9mWJDOlaCmS4JzCOw5bJ9WCnuo8cejgB02Y1Yrw9d4ZOGFXyRcS?=
 =?us-ascii?Q?4KQ1OwrGrzXTAm1Zm6FhGBFETb9xcbm/fvjIolxwm5xLaw2dW5D1+j93sRSb?=
 =?us-ascii?Q?7kibsQJX0hkUo99v7vpjdOy+D3t3i+CiQmgPKj8ejmZgfEvaEJlb1bKMNcL/?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a087b5-2b1f-4bfc-ad6c-08dcad7ab6da
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 13:56:14.6063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xRNuxt8m6i8Emi6xQ7Yith5/9vT6ylRaP5gSnGj+W2lexjPD/Xs7srrZgsjLgpzr5DM64BZwgP8I7HX8lhToLcOo5Wfj0wg/GrXP1FuIieI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7394
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

On Thu, Jul 25, 2024 at 06:26:10PM GMT, Daniele Ceraolo Spurio wrote:
>Set the minimum recommended version to 70.29.1 as this is the release
>that includes all the fixes and WAs required on BMG.
>
>Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index cc84484d3372..b2219ddc6f65 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -105,6 +105,7 @@ struct fw_blobs_by_type {
> };
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)			\
>+	fw_def(BATTLEMAGE,	major_ver(xe,	guc,	bmg,	70, 29, 1))	\
> 	fw_def(LUNARLAKE,	major_ver(xe,	guc,	lnl,	70, 29, 1))	\
> 	fw_def(METEORLAKE,	major_ver(i915,	guc,	mtl,	70, 19, 2))	\
> 	fw_def(PVC,		mmp_ver(intel-ci/xe, guc, pvc,	70, 24, 0))	\
>-- 
>2.43.0
>
