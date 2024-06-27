Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599A0C2BD09
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 06:03:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C72FF10EA12;
	Thu, 27 Jun 2024 06:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YwBuTbW3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5163E10EA12
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 06:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719468179; x=1751004179;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EFne71/RzJSfMfVUVfWyAvBCgj0Zfa1ySR9zM4b45uY=;
 b=YwBuTbW3Syt619Rd/6MXhsQuHB1BUj2ahJzcLp1J5iYbZtNtlz/+BV36
 xAqR+83VvQBo8wwfZ8CCzYP3bglH5SW8ZEZzi3obbt1heF2AOqsJmNJj3
 t3C1LmJQxVuQDYzcNkYB/hMKqnFUk30IhIZJTrofaBubgAlEyY0kMOe3i
 +aOMMr27W9/V0ArGu7QFbykramvoKepM2Smydh6+WGGMXXMdr/5DaFccu
 BpQVxLpe5Eh1zNW3silbT8uxq8LmNzOByhPk3lF/Kzh385ZuYU+I9ROAO
 fauvMQoQd1ejMcc68RXM3iSmndBDgkQxAyfZc29IvpZZ+zb4IWTt/q6Y3 Q==;
X-CSE-ConnectionGUID: dmv9OvTSTuGEcAcAWfuTDA==
X-CSE-MsgGUID: pbj3m0kwRyafOrD77zchFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16397196"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16397196"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:02:58 -0700
X-CSE-ConnectionGUID: DlKChunGSiist+APGdbUiA==
X-CSE-MsgGUID: L3J6yxjkSpWgKXZ06Z5jOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="44170750"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:02:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:02:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:02:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:02:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG5Uqz1Tlw6CT/GaZJOIGiZv7E5i/xrsA6M6KMkezOrQjCT3D9xsVTEWb8YYFdlxOJX+XHW8fBTxk8Fpm7NZ1DDUJIWKu8ysF8yByHtj8cviW5Rqof72ibUgqEq/hQCXpV8y9CEQmWGWmaZzwwq1Ev3mc9uLkY1tYVdWxsv+cSMTxVDjQ9pA0kXQsZkmMoERS51WWhtfvSccm9CoR2E5/z9yisTvTW1q3c3ODL47yh8mqM7cKrjo6s8D+leCXLk30Fj28iK+MD/5Ee4S+4mTlLQMfCNUfuDyufYxB1SCahS6hjFbiPQaartrcMK4paZstrKCD4dFGm1WnqG9dj2VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6ZGOJjzedLvNirPFoSklD3xndglKP2+2YW21WMP/ZE=;
 b=UiUqZM4C23SZrTTKx1MGknRo+Ua+mbZLKbdMsElGlicStiZQsNOsw5RnMXlwuJifPycdJ+zFVzRf/ElNnQZa/fT0ix8PO/dD93n6ePXG9Q32tlyIx/bHn/ePSsEBGZ2DmpFz+VQY3zLnC4miCqrXkECRg+4Lv8oRR5QRMgM/XLv1B4wKdeEMubQRe0H0YDzWV/60nZdrx9OK5qSk5qqi1l6kXDHc4yQU5Qc8oFpeJsNmVvZXStRa/AIh5c17w0B04YxOLBY5l+zFyRAsRfRc/z40JdOTN80G6q2aKv3nzNnlsxE89lSAnZewoBwolsqSzrZtlqx4F2p15/ejfgVMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 06:02:31 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:02:31 +0000
Date: Thu, 27 Jun 2024 06:01:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <lucas.demarchi@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Record utilization before destroying the
 exec queue
Message-ID: <Zn0ATkJwe00C+hpL@DUT025-TGLU.fm.intel.com>
References: <20240625165812.58411-1-umesh.nerlige.ramappa@intel.com>
 <20240625165812.58411-3-umesh.nerlige.ramappa@intel.com>
 <Znr9Mk8r1e2gvUja@DUT025-TGLU.fm.intel.com>
 <ZnsBLb8x/Ma+JIxl@DUT025-TGLU.fm.intel.com>
 <ZnuJP4HOMsY0ImvQ@orsosgc001>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZnuJP4HOMsY0ImvQ@orsosgc001>
X-ClientProxiedBy: SJ0PR13CA0053.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN2PR11MB4695:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b9a0c3-823b-41b6-88fd-08dc966ebb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6gsQ0pea3wUzpYkd2Fqo9FdvAmm19b2w3s9UAFn2WZdxFbKbrUCofgt/qjpH?=
 =?us-ascii?Q?ZdxNZlhmd3ud8/AR8KrIhrFch+1tPJkEuG5xZGMsNg6bBA86HvaoxMRiBZPL?=
 =?us-ascii?Q?t2DTXl54l1pn5jPsG1OtYd3AV1B6GVqBhtkbRe24S9Dp8qYNK5K9LPGtzXVZ?=
 =?us-ascii?Q?P0I5O08C2QQrbmEs65HlIneC4qSzLeKuuyIhmI/tzVpVsnXPyAhIKxvjgnEC?=
 =?us-ascii?Q?oi6T5pIAmPi/eVc3IdY0tqO7G4JuBcvS5/GhAA6+UoH3KtXHn2ZxLiWckBdD?=
 =?us-ascii?Q?LjVO/K/SHXP5Z2HBb4ue4xmZ61vOdtsdgW7HLIwr7var8FND5RD4kiTONB0A?=
 =?us-ascii?Q?RsAom83wjFdCYoTCT5WEFanJwYTsCVPJKsAn9o5+FmXPJfkySZ14ZXC8oeKt?=
 =?us-ascii?Q?RelvxG9xfqdwSIbX26Xq23H3DSnX2rirfu7PejnG5BKkmGTl2k+RJEuj336r?=
 =?us-ascii?Q?RrWo3SYzaR+6Q0r2ltOSQsa1dhkuGFf+mXCoUbiE35A1NaH33uGObb4AwBg9?=
 =?us-ascii?Q?2nnK3therA1GjiYkRPYbBLOgX5/joZTfbYCgF4sXwzGN9+xPFAa4pX2jPBX6?=
 =?us-ascii?Q?BSt1K0KSCF78RYzfbMkboWExwiT4ls8q+dDKcO+/QJFVcahPEW1b09TYPKS2?=
 =?us-ascii?Q?8JIv/lUlA87S3SgdzuOGDTZdScrIaH7THxBenoNPAJqY6F21WMF4aJOZON36?=
 =?us-ascii?Q?GKGxl9T6mOLT9N6zpZHn8bMS9wdg7XEKIST+f+paogmujBNh85LBj7pZvdjD?=
 =?us-ascii?Q?YK+Mtatlcn0KcXlcRovsF7GC1p11mmTr8PYlcwzr1bK9CKUiOHFvnm6M8V6P?=
 =?us-ascii?Q?U1YVmGR5J+UVGdMbInSxCUy3i1g5SclD06RDRkpOb08dOICvgAdH6yYgOKjW?=
 =?us-ascii?Q?Vl3Kqh76aoBr47ghBDJ4/7utYIFr8XLAr6wBBiI1y43cYobXYNkBL4rTlRO2?=
 =?us-ascii?Q?6jpdpr5likKnzfUR87JOg666c7rdUlQjmhoSHehlPZ2KzNdkN7QuRcVwYSZW?=
 =?us-ascii?Q?7nNVCJihWFVgc5OYbC3oh6EaMgrL4hIc+52xcijG618sfOUXnmJfQpdz5MXN?=
 =?us-ascii?Q?CrJquYOrHI4RaJyF3E1IX9qWU4Il0AbH2j/4DUs6koVx8124clTpFxhSWN1u?=
 =?us-ascii?Q?rWwx6YW7qPZX6EOsKTGkDXLZFsblqwnr2Zmq1CKE/3xOcQf/z17CyHDB0JZw?=
 =?us-ascii?Q?OmPRGODLgfeAX7wRDc4qd2sMdOlzsY3qCR1TZlYu0cumV8i9x58keQkLAKvV?=
 =?us-ascii?Q?cOniVH5o4NyxLjA/GfRNMao8+7kZnEJ/fh3UrniuEYoG8jqZd0OuUsGM8Xij?=
 =?us-ascii?Q?CeY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bzvqChw8R7NA7+NFkH+ltylfqfCENaqHEqi0FrzlKHGpzrmQ6HfcAMzZS4bE?=
 =?us-ascii?Q?g+uw/UhO0FOJBh4xQ87vO29Q+C3gtwQ1YFblzTGYh4ELBYJQ/OtxI20qla3q?=
 =?us-ascii?Q?JDgXsHbxYpOqtGuTsjyGSI9Awt2gsPgeX3i9C/WtFeBGCioiDk6XfiyN2jF2?=
 =?us-ascii?Q?pO3AYstKpTzA7mTAleHCqp30rLOuHUda448vg2nkh8cehMNhCXrH87tTjdah?=
 =?us-ascii?Q?zYFgtRNSg2aluZaIpG2jI/g3bNUOPxzn2JherRQoIEwJw8c6QrzU624PbBSh?=
 =?us-ascii?Q?Z4jVHdMrUP9+5rJ11PITfJgPIb1EUWceiuok0WWNOks9GA5561AVMDjWSmlZ?=
 =?us-ascii?Q?QxRRqDGWLyCrHmEV1PrI0CkXQlks/o0dF4G2df63eJCOlbSVCMxb95kzbjd+?=
 =?us-ascii?Q?G7A17EqKdr4RSdP/kzheGv5eG2XVytyHAyfwyLowXlQoHSb+xirHovr18Mwq?=
 =?us-ascii?Q?WRrDIpgij/0xkO9dIM+y9CoIePJ94/uIP7xN7B9qdFLEDzfH1xCKSPlP6rrF?=
 =?us-ascii?Q?sSx6UxDs5KI/SkNj3QiPo7GR3vSIfXlafZpercAxqaHz0R1Wmcj/Mgnmo3vO?=
 =?us-ascii?Q?ThpCq0EvXD/zBmCFQCULVaCvjA2jpfnawlPCs04Npp53Q5LK5r5CrFxdClJO?=
 =?us-ascii?Q?Ff585mzU1atkUJD6hg3XDXnDIhTyDy7cJDLvaHzx7+MW6Xd1sSAgeOsBQNiZ?=
 =?us-ascii?Q?1a393FNZFs4+HrqPlvPnpfa2oWbcCi+fIFWwAWdT3tkRt8nRHImyHLmwlY24?=
 =?us-ascii?Q?TnEd4TKLXgoYUlHrP/89Rqho8gPUBuEH/sO62wqq5zD5rnC/vJ9jjJ4pk/0Y?=
 =?us-ascii?Q?KKYTif6NnsWljjhzBW12LskkrQofsWNveAWTnihV6qpGTB4hW2BhnEhMsqu5?=
 =?us-ascii?Q?voH1SAGIKgQH25Pp58fQ+hNcdwLuGvy/K5XRy9P5vW9TRiu+IPsDaGYDC3g3?=
 =?us-ascii?Q?TKmjBcmAMu2H2CeKNJZ/kf+SV0PK7cvid0Ma5+fX+KU1h+dbOPZtHciax9/j?=
 =?us-ascii?Q?T5mXuOmFwaBbnoHNFYgkLu85IA4h4EPX8zLUfrAFpZADGozk8dF9TPlxdah8?=
 =?us-ascii?Q?ba5C5KSZvqjMEm3DMZA8cMZ9egsuCXuxBiTrme54LFrBu27DNnDhvLy+zEeQ?=
 =?us-ascii?Q?tBV9HUAMtjDxlWs36Ao3aOIa3uI8kLf+WZo6T95Z2qK6ppJ5Z89CnG1vCzlp?=
 =?us-ascii?Q?RKHoWVISID6y42XCODbbdVHbZi8my2p+AFCBGVzXBj9IGrevf12fhIDppNPf?=
 =?us-ascii?Q?Er36hBblDya2f3WkpsxpQa+X/lQCzxVIGRl82M9818OCxh0CHovUCieiqsot?=
 =?us-ascii?Q?l2FID9W6qYzXNWZgqlwdTmjp5p6M9ur0+ztChgJyYPpNpkliO5QV5BDMeeen?=
 =?us-ascii?Q?eu5GYPO5kGhkuajpd+TKFD8byW8irHZdNMy7Fz34mYDJ9qfMkaDtGzvMLBb0?=
 =?us-ascii?Q?7KtnqWKlRQZIhj6y90oznOtAQ2CrQ12FwGfxoOTe572eCklx4E95H3pTBqW9?=
 =?us-ascii?Q?ZBmN91CW+97j9l1YwKla0nfLtufpbfRm+6mDpwq0gNJyRAgriuY6q6x/aXCo?=
 =?us-ascii?Q?xoEXDmglcGqsIMkP5C7UmQZ5X1N3D16iWn/bQU6g0wCSxqm1KMunbfKFky8S?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b9a0c3-823b-41b6-88fd-08dc966ebb43
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:02:31.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKsRpsTQCAQkohrXPk4srLYrL0nwqgmfozLCZJe3DcIoYV/RSw5VWtCZN6dmPukX4FWW23RV2UXdfkDRJNw4gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
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

On Tue, Jun 25, 2024 at 08:21:35PM -0700, Umesh Nerlige Ramappa wrote:
> On Tue, Jun 25, 2024 at 05:41:01PM +0000, Matthew Brost wrote:
> > On Tue, Jun 25, 2024 at 05:24:02PM +0000, Matthew Brost wrote:
> > > On Wed, Jun 26, 2024 at 12:58:12AM +0800, Umesh Nerlige Ramappa wrote:
> > > > Current code captures utilization at the exec queue level whenever a job
> > > > is completed and then accumulates it into the xe file stats whenever the
> > > > user queries for per client engine utilization. There is a case where
> > > > utilization may be lost if the exec queue is destroyed before the user
> > > > queries the utilization. To overcome that, record the utlization when
> > > > the exec queue is destroyed.
> > > >
> > > > To do so
> > > >
> > > > 1) Wait for release of all other references to the exec queue. The wait
> > > >    uses the same timeout as the job scheduling timeout. On timeout, only
> > > >    a debug message is printed out since this is just a best effort to
> > > >    capture the utilization prior to destroying the queue.
> > > > 2) Before releasing the last reference in xe_exec_queue_destroy_ioctl(),
> > > >    record the utilization in the xe file stats.
> > > >
> > > > Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 11 +++++++++++
> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
> > > >  2 files changed, 13 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index 4d90a16745d2..f1028eaf2d7f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -69,6 +69,7 @@ static struct xe_exec_queue *__xe_exec_queue_alloc(struct xe_device *xe,
> > > >  	q->ops = gt->exec_queue_ops;
> > > >  	INIT_LIST_HEAD(&q->lr.link);
> > > >  	INIT_LIST_HEAD(&q->multi_gt_link);
> > > > +	init_waitqueue_head(&q->wq);
> > > >
> > > >  	q->sched_props.timeslice_us = hwe->eclass->sched_props.timeslice_us;
> > > >  	q->sched_props.preempt_timeout_us =
> > > > @@ -825,6 +826,7 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > > >  	struct xe_file *xef = to_xe_file(file);
> > > >  	struct drm_xe_exec_queue_destroy *args = data;
> > > >  	struct xe_exec_queue *q;
> > > > +	int ret;
> > > >
> > > >  	if (XE_IOCTL_DBG(xe, args->pad) ||
> > > >  	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
> > > > @@ -838,6 +840,15 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
> > > >
> > > >  	xe_exec_queue_kill(q);
> > > >
> > > > +	ret = wait_event_timeout(q->wq, kref_read(&q->refcount) == 1,
> > > > +			(q->sched_props.job_timeout_ms/1000) * HZ);
> > > > +	if (!ret)
> > > > +		drm_dbg(&xe->drm, "Timedout waiting for exec queue run ticks update\n");
> > > > +
> > > 
> > > I can't say I love adding a wait to destroy IOCTL just to accurately
> > > report some stats. If we can't preempt this exec queue, the kill flow
> > > can take nearly .7s which would be pretty bad to block in the IOCTL.
> > 
> > Opps, my timing calculation is wrong here as I forget that we reduce to
> > the preemption timeoot to 1ms upon kill. But my point still stands from
> > an arch perspective blocking in an IOCTL to collect stats doesn't seem
> > right to me. Maybe others have a different opinion?
> > 
> > > Even the common case isn't great either...
> > > 
> > > Beyond that, this code breaks if the assumption of
> > > kref_read(&q->refcount) == 1 meaning all jobs are done. e.g. The wedging
> > > code == 2 takes an extra ref to the exec queue, so this IOCTL will hang
> > > forever even we wedge the device.
> > 
> > s/even we/if we/
> > 
> > Matt
> > 
> > > 
> > > Could this be added to exec queue backend code which adjusts on the
> > > final destroy? e.g. Add it to __guc_exec_queue_fini_async via
> > > xe_exec_queue_fini? Or does that not work because we don't have the xef?
> 
> That's how it was earlier, but the problem we ran into earlier was that
> xe_file_close would schedule work to kill the queue and in parallel go ahead
> and close the xef object. By the time, the queue backend wanted to update
> xef, xef was freed -
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
> 
> Maybe if the queue backend somehow knows that the relevant xef is gone, it
> could handle the above bug, but we do not have a q->xef. It looks like that
> was intentionally removed a while ago. We were using q->vm->xef in the code
> that caused the above bug, but that's a hacky way to relate the queue to its
> xef.
> 
> To resolve the bug above, I had added code to localize the stats to the
> queue and transfer those stats to xef only in calls where we knew that the
> xef was valid - like when the user queries the stats. The only open was that
> when the queue is destroyed, we will lose the stats stored in the queue if
> we don't transfer it. That's what is being addressed here.
> 
> > > 
> > > Regardless if my suggestion works or not, surely we can do something to
> > > avoid waiting in this IOCTL. I suggest exploring another solution.
> 
> Lucas had suggested using a ref to xef object, but I think that requires
> bringing back the link q->xef. If you are okay with that, then I can add
> some code to make xef ref counted and solve the original issue -
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908. I can drop this
> series then.
> 

That seems to be a sane choice, in general I think we get into trouble
when we don't ref count objects.

So the ref counting scheme would roughly be:

- init ref count to xef in xe_file_open
- drop ref in xe_file_close
- exec queue takes ref to xef upon creation (user IOCTL created exec queues only)
- exec queue drops ref to xef upon destroy (again user IOCTL created exec queues only)

Seeme like a good design to me.

Matt

> Thanks,
> Umesh
> 
> > > 
> > > Matt
> > > 
> > > > +	mutex_lock(&xef->exec_queue.lock);
> > > > +	xef->run_ticks[q->class] += xe_exec_queue_delta_run_ticks(q);
> > > > +	mutex_unlock(&xef->exec_queue.lock);
> > > > +
> > > >  	trace_xe_exec_queue_close(q);
> > > >  	xe_exec_queue_put(q);
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index 201588ec33c3..2ae4221d2f61 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -143,6 +143,8 @@ struct xe_exec_queue {
> > > >  	u64 old_run_ticks;
> > > >  	/** @run_ticks: hw engine class run time in ticks for this exec queue */
> > > >  	u64 run_ticks;
> > > > +	/** @wq: wait queue to wait for cleanup */
> > > > +	wait_queue_head_t wq;
> > > >  	/** @lrc: logical ring context for this exec queue */
> > > >  	struct xe_lrc *lrc[];
> > > >  };
> > > > --
> > > > 2.34.1
> > > >
