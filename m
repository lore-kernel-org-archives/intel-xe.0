Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E5EC369D9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 04:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A05310E120;
	Wed, 30 Apr 2025 04:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZ0qoBw5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9F910E120
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 04:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745986817; x=1777522817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iMT6yoy28sxaDCo/qOEJ3t1wwVubUGFjYitH5l05t/o=;
 b=jZ0qoBw5N3W75/2Uuq5xS/cKcp0gBoH5MouwYzwykJhGwrGV5JHp4jcB
 AZpnUfF6SRioKWY6p6goSs8VT4vYgHKXhUGBe/t4hjpGkNndGo/WUsZ9W
 dZvyizMWQyCRp3Q7RumHT869ihuBh8oxcXChS1mc9DS5MYkWW84FpbqR1
 f8RLHMtGS6sR76/3R8BNfXhengxZhn5hBKwcHVo2SbUm1mgf2+E1FbdoH
 0eCzqk8UPm07zEpDu1qBRAvYMdwQitIJRcqGzIbrT9fPUxxp/eOLZtZP0
 KPsWJLjMmeZoRRsEl97jnZayVnfzuo+v47FhWKqoverkOkm/UOOHuJeDF w==;
X-CSE-ConnectionGUID: BMklRb88TVSNBdOd2SELBw==
X-CSE-MsgGUID: pBI48c/kS5yQZXVVeeHxYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47770558"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="47770558"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:20:10 -0700
X-CSE-ConnectionGUID: YrI4pwqXTPKvoWLcD+Pk8Q==
X-CSE-MsgGUID: TuqJaYPtRhOkAmKpSKNrPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; d="scan'208";a="138820344"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 21:20:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 21:20:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 21:20:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 21:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zE9sJAOpv2l5kBsyVKs1d+jdIXOOlI5ZnQ2VkWYIdHWnFtKL6VMFSGBeaCF7ca1FJ/brApk8uVIlNcJu8uRjCrHpBqtWhLnPMHjHUBT8DB18wX27DJbCvReRtktXobJEU9xR37aKtKa4DXjwAC8FcGyUFjHaPLOG94zAz56aDkAfZKQ0OucTBdhh240JdYLhmyR5HegXpc28TUhfm2N7J5hgwFVj04UPRHPTwMh/7WnenmD7no2idlCuABHvVLErP4NhPfs8cpzAgPGLWZSvVvg/xZ2o9dQaOOOVQb1GvOEmgS4qvj05K+G4W1Gj9gX2o4QlMBK59biz4019cJ2gZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCioUPzE2xVhNZAURzOAHjKepdyy5IX6YJP8JdUYh7U=;
 b=NkqkDPSbGjnF13rhDxA9nN/xdAAGFRs2DHYVnK7RnO9uODRoFOo+TlQftbg8WAqAhC8TieTQ/YYh9MalmnWkrNbNShwrerAyucNLY2U7O5KBYKuydEOoCVVuadS+Z+PwQpxe4Y+ant43RW2RwwZcp9pPnR30UIq/vXqI4/CjJ+nmVaHkL1ssX9E/e0OeDX2U5K0OqA5SuPG4VmCMSrhwJyIg2E9GQIrkAiRhHIzcWC/milHSqmISqyW73SE9qmTbgAzEUBv9bwd2CqKXniUXNqpXqD2Mc7aOOhM0I0vAtPeMmEFqmRTJrOiPtbgz7c4qr2S0LnyBCicCr2N8lDAOGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7191.namprd11.prod.outlook.com (2603:10b6:8:139::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 04:19:52 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 04:19:52 +0000
Date: Tue, 29 Apr 2025 21:21:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 17/20] drm/gpusvm: Introduce
 drm_gpusvm_range_find_or_insert_start() function
Message-ID: <aBGlO1jKEE65RdOF@lstrano-desk.jf.intel.com>
References: <20250429104233.215602-1-himal.prasad.ghimiray@intel.com>
 <20250429104233.215602-18-himal.prasad.ghimiray@intel.com>
 <aBEb3eB36nXXLIds@lstrano-desk.jf.intel.com>
 <3b35e81c-d043-4852-bd09-3ded44c28780@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3b35e81c-d043-4852-bd09-3ded44c28780@intel.com>
X-ClientProxiedBy: BY1P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e23ee3-1de7-4a81-35cc-08dd879e4141
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nRF4PpWMd5+8wq3MStuxoAyhYsF8wsT3fd/xcsR5zqfMaD9uqTtt+Fu32jJV?=
 =?us-ascii?Q?f2BKKrT7RvixCrbOrjHKUkLTUh5RISu+fH1P9L7I/y3MdQ5JRg4onZkXCbRR?=
 =?us-ascii?Q?KwOJr+Fm3uhmvW0+JA84YfPZYv5Q1I5Rfohhizh84S9qCGrMOQn9BK2FcMga?=
 =?us-ascii?Q?+KimG+/tIR2hZbVCMzAlC9pbBf0+T1l38oNjZgjL04cH+oxtUkec6yEOt9Tc?=
 =?us-ascii?Q?LZJCQNjNnysyprS2Wy86c9eHWLqnvFknC7dDZeaV3DV6HMkqza24h1F1Rzj5?=
 =?us-ascii?Q?rtNtb0X0vf6yb6O0T+PkKHcYg/BV7gy03H95ZM7PxLdiZpPn7qrzYUisou16?=
 =?us-ascii?Q?Dt1mCdaelsYMTJEEsEXP+AsZIKUWenGoOMzPkcBg15lsIqptcvXRfUgisrmh?=
 =?us-ascii?Q?gFVPUMOyWB7ETEC7pHmuvuPZXLX4HShFCHXvSP/0xltCKoWp003aT64De+J7?=
 =?us-ascii?Q?+zNtQ/MtqQ+4v7tP+Wlac9XAbulUyO693Mk8i0nZ4rzXlKdL9zYB34V6Qqos?=
 =?us-ascii?Q?8R0ympEPBP5AuYfU2EBk1NkdeKewNhtVshYlKwi003/2VMFf78rYnqCYnCM+?=
 =?us-ascii?Q?WsxSqrrZiPJAky6VJ/6HqzsWcJ7k1AixZ5CXboWjTwHBoU+uybNdBQk0nonU?=
 =?us-ascii?Q?fFcPgdYF5Y9aXPX5iwNcVoi6Z7HKfGSmbQFK2mOGIpVBDkV0IhA9c1ic3ij+?=
 =?us-ascii?Q?cQtG9QusPzYhoc8EIZP0M46tIKnNuSSjLkapyQGQUDsNCVoOfYgwG3lbbe0Q?=
 =?us-ascii?Q?bgxdEtKqAxMvModTqFM44XEdg/tbTwk5/fQVHx2iTPqKY4NXwM82YvBnmsy0?=
 =?us-ascii?Q?gkqbY2r15u03LYkUNU1B5TCaCtQO5ncL3UpGQIcyEAJE1u6eZXjqvaARdF0K?=
 =?us-ascii?Q?pll8DCz5+gIMtSbYzlULRNEG7WUNZzdbRM78gSb8yfj7e8BVY8lXzrxmJgVz?=
 =?us-ascii?Q?oTeiBfFdiOBgASZ44ZCkpESYfO/Lfwd4/AaaUi5LUZsn1TMDFakJHHT547gh?=
 =?us-ascii?Q?H122m7vaonMm34AyoovpupFPBf2cJmio4Wt0C8XqpcFgYyES6GjYS3lZFAcR?=
 =?us-ascii?Q?ZXkE6yMQV52WXt0hj1kbwms+94qrtaQ5H27Qam6cZFFU7DuMEwf2KANFZ8MM?=
 =?us-ascii?Q?hzz/vWrjSZoRwXrAm5/HWCcYvS9QCtWNAgW19pyK+9WR+uqWzdof+Z6AUyaB?=
 =?us-ascii?Q?jdP+e0mLrDt4bWk1xaVPPXBsEfR3jXburdGxVMUEUZDs7iW1K21XpcFvIte0?=
 =?us-ascii?Q?CqvxtKY7Zn7/8nkcAE6+6rbUl2gXzeB+vaKTRQd3377fpAJsxTDNWTBdQXa9?=
 =?us-ascii?Q?PFBCanvQDskhFKdK4VfOnK3mVv8tYeOVXlN2fvo2eSWt4Cd47H4u1kTwUSZy?=
 =?us-ascii?Q?IvQ6L4A1eB7q7MOdyRnywsMUmsz/Qyi/INiwdX7/v98elQ82IQD76AJbdGBt?=
 =?us-ascii?Q?2nR9WIQOHtU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x8qr0u1VR4qo5A0xuXsuzCXvwZLcy/GdZFGBRNao0EDRJW/6j+Zq/QM2O/Fb?=
 =?us-ascii?Q?K0altika2aP6tHTUEX17nz3IdhgBWixXMjVhMgFG4nF6nPhVtdAVymkBWXvC?=
 =?us-ascii?Q?pyMgN1kztZLHgAVROZqAqcCfm9csopgil5tWr4MFIYq6XCrDFvCnvkCXyrpO?=
 =?us-ascii?Q?fsfLR7+y6+PWvs+Fs/vYULqDrkV6VszL8yfsrM5vnt6pA+2V8R8aSpZuvvA5?=
 =?us-ascii?Q?IjZpdWRM2xsttuv7hHDOPgNdKmgwJUoFxZ9EzSx8d0/Pfnt5gJejrpROLy8+?=
 =?us-ascii?Q?IKqyZV4gb+QsMTgyP8ZZj01TYEPs66lmzaMPiy10AfqgjcO/yEuaYEf3M0PB?=
 =?us-ascii?Q?m/RG149zJlZyjmS+Ckm4umHtK5q6PWHjwer53mGEmQe9OeGHlfbGLlZqUoHD?=
 =?us-ascii?Q?/oFcT1HMAu7ljy2UuoGt3rOIW8meXA1y3f/uwokDGuw7YWLKPukacP50wMaF?=
 =?us-ascii?Q?QUbfhUCHhTmIVYHfYaguSW8hUNfSxxOaF0ZTWYhT9+zbG+L0zNnZajsmm2gj?=
 =?us-ascii?Q?FMbb/9ZAScz2Fg2BjZu7neajlwBtw2tStXV2nM4XETLBNISZnAUSqr0i2yL9?=
 =?us-ascii?Q?sIjmWC5Vmsxsf7zZodqLC948/6JPGFnHz9bC32ZO54XLvcV1sZMm+iEnOQ98?=
 =?us-ascii?Q?jFAg3WKVYcnBe5Hd+VaEW6zJi70qnzkWBY+9nn4qcjizRMXEVbcaKf6zj312?=
 =?us-ascii?Q?oesVoa5JH0LmF9A4/eOqHgCvQQI+0NnrvRtRO3L0xN9vYxbN02Dk5RsuqRsg?=
 =?us-ascii?Q?abvvgNv6ppqhi86CU48W2xlnqc74mN/jiZmOlExm7xyJi8vzdX1qafP7G4RJ?=
 =?us-ascii?Q?Jma09OdzN1YhjxEHG4Ni2Z/RUIpDDyWPi1vG8eYDRVfNSnbHszm88TL6ueel?=
 =?us-ascii?Q?+Tmn0jwUpc3j/31KMmI18hTKqz/+84j9TFxpMSboEbJBQTEO9j+paTsdZoD8?=
 =?us-ascii?Q?CaWDqz1g2bAjmyAkOSOCsIuvNI9gyeXtxR2aGQyHpsIJ21cCczeap7oWWaw0?=
 =?us-ascii?Q?4LQHedTA7yp2rfE5U9QN/XHrXT7TV3uoRHEHlV2CFcAsMU+yoFvixBsAJrQf?=
 =?us-ascii?Q?wCsDv/QX59gi7LGLbI5XycoAeNx9OexMGRFHbMFet4dLkPHU722govr97YVp?=
 =?us-ascii?Q?pd0dOYAeArrzQcKrAt9HQ/xMTZZOGltSDjpWPC4o0CNylCTjpPuOm283+SnY?=
 =?us-ascii?Q?njeKls1mS2ZUS46UzmVyl4hoxk3Bwj2yeOXzKuVX0vxV9nUhDIGpJK56ovwh?=
 =?us-ascii?Q?XYdj2RhGVpWds+BR0FqdeFuQiiopIyQnvRQ5A0o1NwQWW5vJDopOp5lpzhJp?=
 =?us-ascii?Q?baqY0z6hcUv1BVtRwCx6KuGkaC+ib9z6qGS0Pl9wQ51y+ZRvAj4y7Nbs7bX6?=
 =?us-ascii?Q?NbSkrDqqX3iNvVSElQE7i1PBeQoWCRkgVF2fAXlPP4hDAEumgTHtVhHHvwNa?=
 =?us-ascii?Q?jtVlILEoPfGuXBDKGtHHAltp0EIDSPKUzIoogvMlPnBqwUVmxZugTQ6VnOhH?=
 =?us-ascii?Q?eG39RD2A6dzDs/OKuISoP4LwzhoBkC8rvNWbW8mtoozyod4Qa641G7HiSLK6?=
 =?us-ascii?Q?pLtbEBhikWgQboYdHfaHcQjdCi1gaU6fb02w0t0dPO6N4svbTnixKxUTpZMj?=
 =?us-ascii?Q?0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e23ee3-1de7-4a81-35cc-08dd879e4141
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 04:19:52.7513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Lmcw8p6aWe+mFmZs+bbIa+eKpycewolqa3ezAmvaHZM1BAmlmKmoJ5lXna3WMDkueaMnZPNHalvpR1fZu4fcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7191
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

On Wed, Apr 30, 2025 at 09:10:33AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 30-04-2025 00:05, Matthew Brost wrote:
> > On Tue, Apr 29, 2025 at 04:12:30PM +0530, Himal Prasad Ghimiray wrote:
> > > The drm_gpusvm_range_find_or_insert_start() function is used to
> > > determine the starting address of a CPU VMA within a specified user
> > > range. If the range does not contain any VMA, the function returns
> > > ULONG_MAX.
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/drm_gpusvm.c | 29 +++++++++++++++++++++++++++++
> > >   include/drm/drm_gpusvm.h     |  5 +++++
> > >   2 files changed, 34 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > > index 40a56f38ff8e..bb7c589b8d15 100644
> > > --- a/drivers/gpu/drm/drm_gpusvm.c
> > > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > > @@ -980,6 +980,35 @@ static void drm_gpusvm_driver_lock_held(struct drm_gpusvm *gpusvm)
> > >   }
> > >   #endif
> > > +/**
> > > + * drm_gpusvm_range_find_or_insert_start() - Find or insert start address for range
> > > + * @gpusvm: Pointer to the GPU SVM structure
> > > + * @start: The inclusive start user address.
> > > + * @end: The exclusive end user address.
> > > + *
> > > + * Returns: The start address of first VMA within the provided range,
> > > + * ULONG_MAX otherwise. Assumes start_addr < end_addr.
> > > + */
> > > +unsigned long
> > > +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
> > > +				      unsigned long start,
> > > +				      unsigned long end)
> > 
> > We don't really do an insertion here, so maybe:
> > 
> > s/drm_gpusvm_range_find_or_insert_start/drm_gpusvm_find_vma_start
> 
> Sure.
> 
> > 
> > > +{
> > > +	struct mm_struct *mm = gpusvm->mm;
> > > +	struct vm_area_struct *vma;
> > > +	unsigned long addr = ULONG_MAX;
> 
> Does this return in case of no vma found makes sense to you ?
> Initially I thought of returning 0, but wasn't sure whether under any
> scenario cpu vma can start at 0 or not.
> 

Yes, I think ULONG_MAX is better than zero - mmap could produce an
address of zero but not ULONG_MAX. 

Matt

> > > +
> > 
> > Hmm, do you think we need a mmget here? I'd expect this be called from a
> > user context where we'd have a MM ref but maybe to be safe add a
> > mmget/put?
> Yup, mmget/mmput makes it more reliable. Will add it
> 
> > 
> > Matt
> > 
> > > +	mmap_read_lock(mm);
> > > +
> > > +	vma = find_vma_intersection(mm, start, end);
> > > +	if (vma)
> > > +		addr =  vma->vm_start;
> > > +
> > > +	mmap_read_unlock(mm);
> > > +	return addr;
> > > +}
> > > +EXPORT_SYMBOL_GPL(drm_gpusvm_range_find_or_insert_start);
> > > +
> > >   /**
> > >    * drm_gpusvm_range_find_or_insert() - Find or insert GPU SVM range
> > >    * @gpusvm: Pointer to the GPU SVM structure
> > > diff --git a/include/drm/drm_gpusvm.h b/include/drm/drm_gpusvm.h
> > > index cce217bc136f..b0e9ee5c6226 100644
> > > --- a/include/drm/drm_gpusvm.h
> > > +++ b/include/drm/drm_gpusvm.h
> > > @@ -315,6 +315,11 @@ void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > >   void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > +unsigned long
> > > +drm_gpusvm_range_find_or_insert_start(struct drm_gpusvm *gpusvm,
> > > +				      unsigned long start,
> > > +				      unsigned long end);
> > > +
> > >   struct drm_gpusvm_range *
> > >   drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm,
> > >   				unsigned long fault_addr,
> > > -- 
> > > 2.34.1
> > > 
> 
