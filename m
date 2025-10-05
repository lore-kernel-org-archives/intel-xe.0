Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5ED2CAC5BB
	for <intel-xe@archiver.kernel.org>; Sun,  5 Oct 2025 07:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815410E0A1;
	Sun,  5 Oct 2025 07:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EZZxfUNb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B606A10E0A1
 for <intel-xe@lists.freedesktop.org>; Sun,  5 Oct 2025 07:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759647849; x=1791183849;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=prVlXWJZObPmHuv1to4QpU3OKjP5EvCIFujMojodcDc=;
 b=EZZxfUNbwS6FNgoEkXlWJ1ffuMjmoE2O+qWYvuB1vaju6oNSMwjbQEiS
 1MLljBdOGljVlIM/2LJtRwsYKjNNW9EQHGhmu6NejOG0ELOc55kWu4Lg5
 +3A3dhz5TsXZCPULuwvjAepME3KtYJpuliN6qR0OtOTP3QtlIlglw8CY9
 RF+AJ8s52q/C11PHxLnhankPG0Gr1ye74RfSGnCYfaQxrSzbVB22i1QHL
 vmDJQJqrP9mND5fQeJHYzqy4AQ/HRMeyrXnUWCC0EuAVZzyZV4YZ9HEWT
 pzEXAU240P9hVfX4K8KqFOHvlNlpa80gYonIaSLWwnnkw2jw8O2GirPgj g==;
X-CSE-ConnectionGUID: xLo1qnbwRwGGg+Hz+egWzg==
X-CSE-MsgGUID: +aQfOaXZRmOwfyWKecfTKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11572"; a="72109166"
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="72109166"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 00:04:08 -0700
X-CSE-ConnectionGUID: CZkjSkRhTlmQBfq9sPPtyg==
X-CSE-MsgGUID: 9oNOm1MXQdCfPcHTJ8uL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,317,1751266800"; d="scan'208";a="184000248"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2025 00:04:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 00:04:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 5 Oct 2025 00:04:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 5 Oct 2025 00:04:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEYhY7emvOmPjZg4t1buiLI3H47DGZT/N+JZrzPM8/tECDLXWTF5FuhKQanWCvg2NsrLuoYLHpKt3iikERqPuYp25moZYHgNqpHXsGcWWTFASR9ONZTw6lJnX9XVKFaYXqGaqRItTd8eenhHyWTxcdiSKBimy3VzwwkXMMsgk7zwEcH6rVXxtAQoiztMlfp80BYBskZrHv1WJWMa0+2YCX7rFaWf/UWJKXC47s3uEqwAYwvNkLd16vNjk4kE5wrEEYCN0bxsrh7XnhgsQsOokjA+S65RyDKDg2LZQ9c3Nk4MOdxK3kb95Y0r5aogMMTTbtvn9KAO3GVeLqkZKxMQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQwKZFpoPdQo3eQh4S1lefzZx8TYZAPybw+kGTahHwk=;
 b=Cfq2NUYjTTcCxUZ8m+zeyz2JmvUClfWbfGhv1iumm08f4kYqxBJrJhw9fRmC0VFY5H0gXU3TUqps51ttL/pyB8HMUMBym/7BndzAHzbLwnCdd4GGC6BVDmutP3ScqVXU7YBVo222n83lNql6f5TjfVvENlbeO2nPbcxrYPdCai+I+02XxNfJwX8QBZgk6ZHYm8EnzQKuqNggosXWeG4kd13aaVN9mA9aGZt57+hjYMpZ5PILMMZo4d1zMxm8499wvHWSr2Yjqxhxq0dCRSGLdW4m8pmhojMvYVleHv8JvVjQ9XkdIJy0pGJ5XvBxFo31zf5HbE8xGDUdyWE1glekwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 07:04:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 07:04:00 +0000
Date: Sun, 5 Oct 2025 00:03:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 31/34] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <aOIYXqJq+4jmQYHB@lstrano-desk.jf.intel.com>
References: <20251002055402.1865880-1-matthew.brost@intel.com>
 <20251002055402.1865880-32-matthew.brost@intel.com>
 <805c6ffb-0820-4b73-ab1f-65d89df6b871@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <805c6ffb-0820-4b73-ab1f-65d89df6b871@intel.com>
X-ClientProxiedBy: MW4PR04CA0326.namprd04.prod.outlook.com
 (2603:10b6:303:82::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: f8aa989d-85ce-4fdb-767e-08de03dd5c62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TW09/FfFhWF1Iye9fhOOU3tp+Qu/4TE3OPk5Kkl1FRYjk6OME2dSC+0ZDw?=
 =?iso-8859-1?Q?L27ljkHgBqaRnHgwIwIZUlJ1aiBO20e5EvrGa3+gcRS4y2yYYt0Jv+NONp?=
 =?iso-8859-1?Q?KesC8SpIbnVv0BZsZUzn5tOvlm0JFcPlwDLiGvq14ODnfacsIhJEAkpDyo?=
 =?iso-8859-1?Q?BgLB6rlyQd+gDTlHFvPAatOfl4xYchPW5zQHB/AbHtbWhYSFbcJzxe31JS?=
 =?iso-8859-1?Q?QyLLlEOLdY5Tqi4tCAUr5aUTEQq4PTXTXhERURvQJPbOytUu+7rj01YnPY?=
 =?iso-8859-1?Q?a+3YRCDmFiFpldFTva7YPDDp1N6l7+A4S7T6MUqrNorCKp4mwG3gjRaNgp?=
 =?iso-8859-1?Q?zyEthbuBScYUmW0iZcak1UFGVD57MfvGhPLgzptIosEaybf5xhdV8JayBI?=
 =?iso-8859-1?Q?Bfcy6hFBeBNdEsbjv74kI2Y5WmPnJyJSWob5fnvrIr9oHgrfBijHoc4WJA?=
 =?iso-8859-1?Q?Ffv41eskHIbFxwGyT6mdVQDTBGyu/Ga8W8FwWsSIcDA0zkNJbbqMarAMWW?=
 =?iso-8859-1?Q?EsISGibux3dh13r0Qgra125ETBX4mWURD2zdyX0m3y19CJv8Tg2jdBIwl1?=
 =?iso-8859-1?Q?wnbS/O1NxFtqNCg0K7GfRCvsrypZlJOLEZwZjdFiCSL9IQ2qZuQ7IDfeiX?=
 =?iso-8859-1?Q?OQUBmCfb4BIlfQX2Rrknsj7EI1rEzJk309jNshGygTaA5MvS6DM5GtEFPt?=
 =?iso-8859-1?Q?9V1FnpFwjr5XHx0uw+tclFDaQcCLUy5i02kYy5BVEsIpXdBUvvUw+2mGoo?=
 =?iso-8859-1?Q?yeuLcjbxJFgFezHLyqjZCuUETIy8RunsQXcdc5Fzs1bFOfaNddeWmvaCxx?=
 =?iso-8859-1?Q?VuCnNLEkxLtr9EsK5HTOil6GoZn+hFFtfUFcIeJF5zJh/P8LsfobDrgQgh?=
 =?iso-8859-1?Q?olzi7tP9dJH01665QIuRo/vQZirq2OPKCJJjw2zHWx+lrdfg1C0eftO5N0?=
 =?iso-8859-1?Q?CgdnMb0KZSvyGzzokVeDoCYFYtGKPHpPzH9R5EjcPGL1PikAXJaa4w6mMx?=
 =?iso-8859-1?Q?d5mSAQbVwtOhN2WXQFoFw/yMzclenrwkN6nRuXDmRwWGndtDV+u/rUUj83?=
 =?iso-8859-1?Q?mSS4GkLnfhvY+mlXC/PdO2ZTJMMJIJC8uLP+5juCobaeMoVF6JVJQg/6rY?=
 =?iso-8859-1?Q?pgYs87dug9TSBbbeeAfzTIzIfJt8vmV4czykPBN6ENRZjLV2fViYe3bdjv?=
 =?iso-8859-1?Q?6XMLcyip8tO39y93U9wIOYAHpebShlABhhP2w9/AY+OCGYqGq5ZQ5Jwzep?=
 =?iso-8859-1?Q?QYUTZs//boSRLqBpOUt+OBj0MrDHupoN/E/FNTMUGi1HthsIUpZyO5MaHW?=
 =?iso-8859-1?Q?TIOfSkMdQizqPeiqvDZr/irftXFTfSy7arobGuTMR7OgjkIfvd/rLmn4kY?=
 =?iso-8859-1?Q?D9qmSII4eJ4sHY0DFckSd5aRrtHEYlQVw9xV9AWWBdOAl0DmvDlimeDvLn?=
 =?iso-8859-1?Q?dAH05CfHnE5DVVIm6Gx+FCDaZmPaIePrRsUZ2wjwfd/cgwqSIBq4nQ//1L?=
 =?iso-8859-1?Q?bD7cKkjhSvsZWHEsogHBY0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ekZR61rhNw7W8OK4dOv3eR6S+fMxOLnsitHhCXst+ZHQSKq7IE0PHDetZH?=
 =?iso-8859-1?Q?29/dKu0g8IeDSbMzGICyO7kDIKwiblHqDpwv1628Dj4YRyMAErHURvaig+?=
 =?iso-8859-1?Q?gSg33iC4eSEy4TyrQkAaYNC+XIP9Bu81oxlECL7gbR2tm2M3zFlwrXl1Hi?=
 =?iso-8859-1?Q?3RMzEcWr7TsFQzqIdS5qujLHJ/JmISpSOvnYIMau3wO9mE9zbvVghx2QZD?=
 =?iso-8859-1?Q?37ekZFbQ0pdhnxn/Yz+YZsasjQPd39MJRT1E4gOUu4XKsm1N6wfxY8Yxp2?=
 =?iso-8859-1?Q?7dHpa4Xg7NQidAUboNK6F2oyNcAjQjERmjGJKCa1b8Mq8A94Z8EJFJLm3J?=
 =?iso-8859-1?Q?ddf5FJCW2j3VTlufGlszhbpAqB+bCiSkgmKVMmEY6AbaiGMZ1gBFIedCmY?=
 =?iso-8859-1?Q?9pdJj30rSUxGyAHwU3HeFMs7Llw34BsJUS7XrjYkjH6iDmTXUzNTx99BSQ?=
 =?iso-8859-1?Q?hofpDKDBCK++mD4Q7U0YjQOoN98kuXGkn5iYHzrTOyQBJtuPDYvKDQZz1i?=
 =?iso-8859-1?Q?oC2l0U2cvhjnAlJfFs9m/yEMixcPnfiObhqoL352/TkRslwqAxvAuPE1iE?=
 =?iso-8859-1?Q?e+zOXnevmpHHqnuyPCnPxKnFlbg/jtsBtytho5ed4r3LonlK27EDOnwgJR?=
 =?iso-8859-1?Q?AJwoxVvbu13KowzCe7tGgbN+2/BX8bX0VrkYsDaDf5nUjRELtHH39p+44h?=
 =?iso-8859-1?Q?lAMtVmliD3ehkdw120BPWF3wBA6PJCyv25o55oGFjyBX9qSdCYs5qpSrdK?=
 =?iso-8859-1?Q?JeYqaPkYlhIfWDJYI+msY75MA34GXWbMQqCSuVRForuh139mtvc/Iusjux?=
 =?iso-8859-1?Q?DnwQg+pHSm8lQ3QiIbxTlgPxYFcFbSu8iVe3KLWbOvUsneuqJyNBNuKw3R?=
 =?iso-8859-1?Q?EdztUy5+lcG5uYlXKRO7afvzv35GZgPlDLz+8DA7xGspeRU20hwOtUARZJ?=
 =?iso-8859-1?Q?cat/8kA1iFtW++6QKjPr8/qxIQMtjhb++eIHVc8zjNv3f6NZYtuFNJDQj8?=
 =?iso-8859-1?Q?jPhX9tEnTUGBu7xY39uOMItrPqS5OmclXFTXIcbQBNxHGA68RhpwDb5yrL?=
 =?iso-8859-1?Q?lb4IaxOw8pNx2iqF2CtkLmKJIIGj5J4ENlyHD7niXDbFQHiUhQwDiEe1JM?=
 =?iso-8859-1?Q?y9pLRhlH92Y+n8ddnOIkQdMwIRfHpq1Qvyabm8R/TW7m4mghu/KySsSaYq?=
 =?iso-8859-1?Q?y0E/3IVr/eobLQ/nWhBin2WPZU3EGK0+RRo4rk87LDvdjESfzvgtUGUB/n?=
 =?iso-8859-1?Q?NcZw9AfLUticEsUcVysCl67gb3W+Dcz6BzZ385HlCjkXJ64uO0KmLgVCJz?=
 =?iso-8859-1?Q?CdqnvC4kTbSH2Bj9uVSpM4/AkowFx90UbhiJ5+Qg6uM8TNPOGBntWKTYIG?=
 =?iso-8859-1?Q?T3t2Kp0Vo9Lj/R6Q8H5ts3hpsspwtHzLX4ZrdOAmH5H59jJhr+JPQhpXv5?=
 =?iso-8859-1?Q?miN0OuGEUUp9ZZ2FaHC6T76TMpUOhpmofT4v88/776a8XgFWt81VupFVci?=
 =?iso-8859-1?Q?DkR+2RHqZ2bc9otDjHC1DvpRmshxpZS4iX3PkJKIRfRPGx6tmgCzJq5t0I?=
 =?iso-8859-1?Q?oYpJX6OoBbElnEd4hEQeqO88EQPP4H8bha1vTBO7EIKRFZTqraRfC7huAT?=
 =?iso-8859-1?Q?ovQFcRkrezNJ5FWZPvOw8HLakRwvAlgFKDEyezAeCYlc6MgJfrwm523A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8aa989d-85ce-4fdb-767e-08de03dd5c62
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 07:04:00.6926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SO9LY6gloG5Nyuxbj15h2oNKHFimQCEzmyUgBRGymuWi5J3TIfKGX/qUHUDr9VTedcL9QDxTqGSMjFNQ9cUKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

On Thu, Oct 02, 2025 at 11:00:21PM +0200, Lis, Tomasz wrote:
> 
> On 10/2/2025 7:53 AM, Matthew Brost wrote:
> > VF CCS restore is a primary GT operation on which the media GT depends.
> > Therefore, it doesn't make much sense to run these operations in
> > parallel. To address this, point the media GT's ordered work queue to
> > the primary GT's ordered work queue on platforms that require (PTL VFs)
> > CCS restore as part of VF post-migration recovery.
> > 
> > Signed-off-by: Matthew Brost<matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> >   drivers/gpu/drm/xe/xe_gt.c           | 16 ++++++++++------
> >   drivers/gpu/drm/xe/xe_gt.h           |  2 +-
> >   drivers/gpu/drm/xe/xe_pci.c          |  6 +++++-
> >   drivers/gpu/drm/xe/xe_pci_types.h    |  1 +
> >   drivers/gpu/drm/xe/xe_tile.c         |  2 +-
> >   6 files changed, 20 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index c27414d4e856..1fa17e25236f 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -321,6 +321,8 @@ struct xe_device {
> >   		u8 skip_mtcfg:1;
> >   		/** @info.skip_pcode: skip access to PCODE uC */
> >   		u8 skip_pcode:1;
> > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
> > +		u8 needs_shared_vf_gt_wq:1;
> >   	} info;
> >   	/** @wa_active: keep track of active workarounds */
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 5f04d562604b..0c38cd30143c 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -72,7 +72,7 @@ static void gt_fini(struct drm_device *drm, void *arg)
> >   	destroy_workqueue(gt->ordered_wq);
> >   }
> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
> >   {
> >   	struct xe_gt *gt;
> >   	int err;
> > @@ -82,12 +82,16 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
> >   		return ERR_PTR(-ENOMEM);
> >   	gt->tile = tile;
> > -	gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> > -						 WQ_MEM_RECLAIM);
> > +	if (use_primary_wq) {
> > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
> > +	} else {
> > +		gt->ordered_wq = alloc_ordered_workqueue("gt-ordered-wq",
> > +							 WQ_MEM_RECLAIM);
> 
> if (!gt->ordered_wq)
> 
> 	return ERR_PTR(-ENOMEM);
> 
> or maybe if use_primary_gt, the error returned should be different?

What?

1. You can't fail in this case.
2. The error code isn't parsed at the caller.

So again huh?

> > -	err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> > -	if (err)
> > -		return ERR_PTR(err);
> > +		err = drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> 
> Looks like we've transformed `gt_fini` into `gt_wq_fini`, and it's not
> getting back to what it was.
> 
> Then, the rename as above would make sense.
> 

This code is gone upstream. We switched over to using the drmm helper to
allocate the wq.

> > +		if (err)
> > +			return ERR_PTR(err);
> 
> I don't see why an issue with registering cleanup handler justifies failing
> the probe process, but that's out of scope of this review.
> 

The entire driver does this and it is needed. The driver can't unload
without leaking resources if cleanup handler fails to register. What the
'or_reset' part does is immediately run the handler upon failure
ensuring no leaks. This is Linux 101 stuff - i.e., you can never leak
resources in Linux.

Matt

> -Tomasz
> 
> > +	}
> >   	return gt;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index ee0239b2f48c..2e3898c18746 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
> >   	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
> >   }
> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
> >   int xe_gt_init_early(struct xe_gt *gt);
> >   int xe_gt_init(struct xe_gt *gt);
> >   void xe_gt_mmio_init(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 3f42b91efa28..25a1d96a68e7 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
> >   	.has_sriov = true,
> >   	.max_gt_per_tile = 2,
> >   	.needs_scratch = true,
> > +	.needs_shared_vf_gt_wq = true,
> >   };
> >   #undef PLATFORM
> > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
> >   	xe->info.skip_mtcfg = desc->skip_mtcfg;
> >   	xe->info.skip_pcode = desc->skip_pcode;
> >   	xe->info.needs_scratch = desc->needs_scratch;
> > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
> >   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >   				 xe_modparam.probe_display &&
> > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
> >   		 * Allocate and setup media GT for platforms with standalone
> >   		 * media.
> >   		 */
> > -		tile->media_gt = xe_gt_alloc(tile);
> > +		tile->media_gt = xe_gt_alloc(tile,
> > +					     xe->info.needs_shared_vf_gt_wq &&
> > +					     IS_SRIOV_VF(xe));
> >   		if (IS_ERR(tile->media_gt))
> >   			return PTR_ERR(tile->media_gt);
> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > index 9b9766a3baa3..b11bf6abda5b 100644
> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > @@ -48,6 +48,7 @@ struct xe_device_desc {
> >   	u8 skip_guc_pc:1;
> >   	u8 skip_mtcfg:1;
> >   	u8 skip_pcode:1;
> > +	u8 needs_shared_vf_gt_wq:1;
> >   };
> >   struct xe_graphics_desc {
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > index d49ba3401963..a982732a8056 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -149,7 +149,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> >   	if (err)
> >   		return err;
> > -	tile->primary_gt = xe_gt_alloc(tile);
> > +	tile->primary_gt = xe_gt_alloc(tile, false);
> >   	if (IS_ERR(tile->primary_gt))
> >   		return PTR_ERR(tile->primary_gt);
