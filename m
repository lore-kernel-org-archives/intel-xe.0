Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572E6C83038
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 16:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0869910E5F0;
	Tue,  1 Jul 2025 16:56:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B2IVEtii";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56D10E5F0
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751388972; x=1782924972;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NHzzZTJXIcSAYhtgAuKODEAENgBbgvcRrB9Hxy7syQM=;
 b=B2IVEtiiNogTnUG6nHhMD0TjDYkEPjge0pyeApurChJ+vr6+vhG4/Hlz
 6I93JTaHzArsELkQ79G45lEH1rvauZVuO2z2i6RYmXMg6rDvNoSO0Z/8x
 BkdSMzWPC4yVpGZSlzILm79GcwtanY9Ri3W0ZteISaCL+24Ddeb/nKZMg
 RJX/uh2WizBXdabuO4pI36kWad36Idu0fibm9Uc2GyDp74VEgbyiKmpJJ
 SoKmL2/pf0R1qCUw05ZOxRNtkzLxZbQvsWwxc9bsdt2EH5gQOBBYB19F3
 mqUmDGcYiCnMrIR595RFo7RCQp/SCYLvq27KjIWrWA8fosC77Ly5OYMRj g==;
X-CSE-ConnectionGUID: 5zfrPcOETzq3B+g/TqLo9Q==
X-CSE-MsgGUID: qIHfCJ+xSYu+JSw1foxh6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53626414"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53626414"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:56:04 -0700
X-CSE-ConnectionGUID: 2W+RQz8hQOykLD1vuiAZWw==
X-CSE-MsgGUID: 9W0BmD7NQtG/ORRoXQlVIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153907825"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:56:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:56:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:56:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:56:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTRGV/Mz+HDSFSeuwqyVH3kVDjjHWuU32eY071lsCKXmwxD2LHPRH+mLjXMpYKWxKqRyUroqzf0rDdis91bbQfN7sR60D8y+xi3aiWeoL+gIp/FSVj8/9RRCnAOtnRMNJVAV+d/yxU+Ll5Zj8qUY80nCIGovgd5XCFN+TlC+lk9jR0ovoK4eqFxteBKw8uMP/0fFEXWa7dCGlgFZAas0QGxM4CuDryafHlORNd6OgNozxjFhEorZ3NZ14NTV9HndJVtaDfyI3JQ0zCBUu8rGfa4sRSdlxIb68dpEHSxiwd8saJOMPoXJ0gSHU15V/CqdFy450zlkgE9EQ1z0oO2MVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjuES5+r/9e+PNfDI8mu2r4TJKQ5BwgQCgFAdeMnMdQ=;
 b=wkn/MyfcFJsr5j2gSjiDCncUwnr+LF+MAHtbhkngItW4OaiEtjqreL4UnOIEI4WkLfu4bxefJW1JA2Xe+CFSfaPYkpOjZ2OhUDFBqWK4IuU4Sft3GOUzIKFy121vZ/88kuGbSPpxmg/VGEcbK+9FLij0vLnBbCUVC17nsFVNW4sFN+/zA7GH/dRsD90D4MtaPQUBnFqRxf0shVnjf4gQ8qpLyJzpWbV6o6bUm9EH2oVqEUvXikLHWnJarz/LhdBr+kOVSFw7Dr1TGkiTCH1CzJmXe5aOcBDozPSdc1EUPN5+uxpnB1XHagoIzs+I7vw0tTFO65RtliaEzYMTEl2nBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 1 Jul
 2025 16:55:19 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%7]) with mapi id 15.20.8880.030; Tue, 1 Jul 2025
 16:55:19 +0000
Date: Tue, 1 Jul 2025 09:55:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 2/6] drm/xe: Track maximum GTs per tile on a
 per-platform basis
Message-ID: <20250701165517.GK4868@mdroper-desk1.amr.corp.intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-10-matthew.d.roper@intel.com>
 <2648dfda-07d6-4ba2-a6e1-649d06ae5325@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2648dfda-07d6-4ba2-a6e1-649d06ae5325@intel.com>
X-ClientProxiedBy: BYAPR08CA0072.namprd08.prod.outlook.com
 (2603:10b6:a03:117::49) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c3e579-527c-4b41-7416-08ddb8c00fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nj5H/CM+iDBcDPzpKPpGwsC3751Dda0QwLPp+vDzHU7hWnu7MVC5Jhzj72ah?=
 =?us-ascii?Q?+a2ehrivVEi95ch5sibyAaD7UdVI+Aoc8P/qaAVI9zOy1HpeZp4mVzLo4p37?=
 =?us-ascii?Q?AMHL79AL5yNx7C2AhxSaQFGoVkpc+W/tNIduGFB/A7RrDtIrKNd8Ado7SYT8?=
 =?us-ascii?Q?i5u8ysxjM4bk5C9TNFBbE/jHyjDMjwOYDxEIK1TSF5Po5PipaGlwdzKigPTE?=
 =?us-ascii?Q?Ad6K7mC07n0XpM4J5L7ETf63+YIjOOIVXGtj7wnj5y7zgjydkw3a8FR6/AnP?=
 =?us-ascii?Q?3XV0l3epYH+9jYfzmJLSOg3YIp8vZ6J/TLbFq/8NaCpP8s/XJRr0w448mJI2?=
 =?us-ascii?Q?KIbhyvKxmhkS1ekPQEu7FcTle7yCcGNfxVeA2lXRv7VZJi99FhkJsUmKGXXS?=
 =?us-ascii?Q?oO386gx8YmcxAngu8XnNKDnRU3GJ1qV9l6fEkVBacUT2o01biuC5E5Sx7VSK?=
 =?us-ascii?Q?Pbn2pWWMgWgrDt96l15BlugFcsWIXJ7IUbJIR2dHIAEdLeInxs2uXGNsf07S?=
 =?us-ascii?Q?bOjnvdDR7RKAuNbxlRjP8ct4j79TOwDD1G34HrwOkP4q2ZUX+e6rb6yorNr6?=
 =?us-ascii?Q?ouM5wDQ/wbw7CUlY14MlfiWxM+4uiQL/NtE36lenphzSnNYTt6OHuM/lEz/A?=
 =?us-ascii?Q?4I49i1vIqR9BWl+pJ1FG/vRGt+k0rdhrVlNniawG8x80EYw8mEXji5OjRfxt?=
 =?us-ascii?Q?MUG/dS2IgNZ2auvwqG6jhpzqTI4UVM+KIKUyoyoor2xITyxMdnW98gbH4hGp?=
 =?us-ascii?Q?O+44rw3aPWL2fCH4PGpQDokK0qJkuVZHBG66pezeAbrDu7PeDixSbxBLDDEn?=
 =?us-ascii?Q?RTn1p9TbJvWj3sp8Zz92iiFZEJNS2tN8ORY0RbdqoqxVzepeNL/PTU6GXe7l?=
 =?us-ascii?Q?vckRAoQDGt3esJskVd6/WNGmeRzXML1kUTezvA23ZGYMfgr4JKOoSf+s2paI?=
 =?us-ascii?Q?q8XTuEltjQemoEv7XetHtywr4CBUcRrIvNmKG4VqvHFHADsAJGCwaM9OPpzw?=
 =?us-ascii?Q?d5HQZX4wF9pJvJ+deQQvsZ68KfChhpAZcvrr/Q3hblamkUg5kAUs+xVgcal+?=
 =?us-ascii?Q?bl6ZfCQUnwimUYmJhR9VQtSnHowxSFdYgiqBDPqZmYY7BRnA7M6GZFHpN0p7?=
 =?us-ascii?Q?zfR3+VCkwrhG0Yt9Tzu2bJlPmhWNMxhtOGhKwag0CbuVm/NP8zkOrawZX8DZ?=
 =?us-ascii?Q?fzg8ZdLcDn3kOcfjLuYWlOmxwIM87Lpiq9wOJk3/q8WRUtpm0I5W7mRmFRAS?=
 =?us-ascii?Q?QdAYkPPyOJUfB3Fs3YolkRwURO4yVvSgJNx8tP3WUrGIr3elP7umbGQ7RHpj?=
 =?us-ascii?Q?a0+Bl+aM60i08k444mhLzuHtmge0lslMqnX74/6JV1kT0qW5gjEQx41AfByD?=
 =?us-ascii?Q?ppBNNes=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y2K162yHPuv7mqENEQPZFQ/ru5MjFZrDSyvC40D4pK90EK/gi66voX4qd3Ce?=
 =?us-ascii?Q?r60UiclUpcs6nX7AFYBgNP2W5waibybX8Hg6LNn82mYTpjIe0WYVawZ8ho0T?=
 =?us-ascii?Q?decyBlqEP7dbY85t6E7VosMuumVFrftBwO9iYiZKMtK6rAEjCMAXg7mcMp1O?=
 =?us-ascii?Q?VRvNNSTu+v9HgSr7lF79vIxW+o2UJDSRN6hFvBR6Lhr/xvQpNd3JlzdA/fkS?=
 =?us-ascii?Q?uNdQf6uigzaxsjG/FwWD6s8rBrNBypUoKu+4jFq8yg5NrgdskYE869LZufWh?=
 =?us-ascii?Q?cslOSrz2RLDL53Rsb3LCPmIoPdXm7CNangRaKeD9hqdWvj2pLny0FOXyKMf2?=
 =?us-ascii?Q?BEGPzNMXJruVbYCeMBj2ptWDkpQvDn0kJR1gx1CuAF0wwXoARZ0CmD+mfFGn?=
 =?us-ascii?Q?+Yr1BxlSZSUscZO9ZXSu2VG8wlY6rwwTC019mYat2LYZt9iyygyWMX/NEjRD?=
 =?us-ascii?Q?ZsJok38uPeIavV7ZS5n+HKyVUJl/213xd+9o0ha7ZGd2vDVjsbpqKBfCkJf7?=
 =?us-ascii?Q?wHeVmejeDlIaRksJ2d/IHpZ4qZChQzGmWbcczNhrp+/HxQb64ZtMbL4aDTBY?=
 =?us-ascii?Q?HMTpPvsWxaxQpKikqL1zBK6HTeFzyvv3es78JFK8TU8EhoCm/MmxIkuzepEI?=
 =?us-ascii?Q?4ANoIS29CJfiX2yQI+IbfAPnQmpUQqX+qTXbsgIzW7AYxc5Qw1Rep9FWmOXI?=
 =?us-ascii?Q?GK0OlryUpDxi5N5cPLTHyiiSIu7utkBck1CLlIe9v5Qq/2OgmwoQ9QwkBKAK?=
 =?us-ascii?Q?ozB5C26idNw6uxkO2hzyIOzOiseowjLffMn2UdYgGMaDWybvw73BOnCXkwU1?=
 =?us-ascii?Q?KpO9us7xtLqobB+6cFw4lLAXt9TfqJzNAJhR1tLfRQJj9jOIrNPAhRxk6dUZ?=
 =?us-ascii?Q?fzrLzS6W8jPqlR9pvtbYE8jIiNKA+1/FqHe1GDRNaf0QzrtYGHc3HjDvwaXW?=
 =?us-ascii?Q?ADCB2c7EJoOufTtIJniHxxXPgGr9vXCJm8/pxFfD9JlfrjgRm3uRfoEp0il6?=
 =?us-ascii?Q?WVmO84LCVCfxbS5EsSTm98uo8tiIFnsJI5/vCWPsEhclpkxqPkmNyok9GieE?=
 =?us-ascii?Q?hU6zR0GwhfybtCSe0naekHx3GuIKuPeIwVqlD+4tUusU9stokAQDtbp12+kz?=
 =?us-ascii?Q?Nw6XSC19G4ImFcW7AUusjNwxzipKj65jnU2Vy8Q+uz7TdBbp/w8+w+09dk8P?=
 =?us-ascii?Q?oyjcPjN9IlxpFf9J0cxEkwDqKxTTUwAyc3MLMt2GHFyamfWZcRGaASCZgiOw?=
 =?us-ascii?Q?gr67c16AZJU49cYdg2C9ePHZWULOaGUc4emMQZWKPPS5kjfADFIoIkyV3D9E?=
 =?us-ascii?Q?/jAff+RLIsQtCvJNyPaIe196smOKxOPkxmn5Ap+tF4HVz2JTqimj5LcaV+LK?=
 =?us-ascii?Q?6zx+u9El4BJwqUkc9f8qiZLxJTxeqIZhZ9zbgJJHY/GM/erp/Rynq86cLkb5?=
 =?us-ascii?Q?WIxbQphqzaVKoz9Q4IBrToSjfplz7bss9bBWGcpmaWVpSUGpwsbtHnhrk1jc?=
 =?us-ascii?Q?I/RD5dy1eOnbtzfcEtjS2l3Yv/+C3tqO6e7AgTwoP9vd45YrmRFnxeUr6S8w?=
 =?us-ascii?Q?3oerd8aNkaRObMbv36W8Dmzmoqu3uWJBmuE5TXT7FSDc8Hze0HsW8vL+ihth?=
 =?us-ascii?Q?1A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c3e579-527c-4b41-7416-08ddb8c00fc6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:55:19.6597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I19j922+vfEQamXb5fqmTZCGyDlpf+MWWvOLAo+QIMA5R/PF3LNfO1DYS4hH0pv6f/pihflKpK8BJdQ/fJpQccm993aTqEFBrpE2c602h5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
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

On Tue, Jul 01, 2025 at 10:35:50AM +0530, Riana Tauro wrote:
> Hi Matt
> 
> On 6/30/2025 11:04 PM, Matt Roper wrote:
> > Today all of our platforms fall into one of three cases:
> >   * Single tile platforms with a single (primary) GT
> >   * Single tile platforms with two GTs (primary + media)
> >   * Two-tile platforms with a single GT (primary) in each
> > 
> > Our numbering of GTs has been a bit inconsistent between platforms
> > (e.g., GT1 is the media GT on some platforms, but the second tile's
> > primary GT on others).  In the future we'll likely have platforms that
> > are both multi-tile and multi-GT, which will make the situation more
> > confusing.  We could also wind up with more than just two types of GTs
> > at some point in the future.
> > 
> > Going forward we should standardize the way we assign uapi GT IDs to
> > internal GT structures.  Let's declare that for userspace GT ID n,
> > 
> >    GT[n]'s tile             = n / (max gt per tile)
> >    GT[n]'s slot within tile = n % (max gt per tile)
> > 
> > We don't want the GT numbering to change for any of our current
> > platforms since the current IDs are part of our ABI contract with
> > userspace so this means we should track the 'max gt per tile' value on a
> > per-platform basis rather than just using a single value across the
> > driver.  Encode this into device descriptors in xe_pci.c and use the
> > per-platform number for various checks in the code.  Constant
> > XE_MAX_GT_PER_TILE will remain just as the maximum across all platforms
> > for easy of sizing array allocations.
> > 
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_device.h       | 41 +++++++++++++---------------
> >   drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pci.c          | 18 ++++++++++++
> >   drivers/gpu/drm/xe/xe_pmu.c          |  4 ++-
> >   drivers/gpu/drm/xe/xe_query.c        |  2 +-
> >   5 files changed, 43 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > index e4da797a984b..4e719d398c88 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -60,35 +60,32 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
> >   	return &xe->tiles[0];
> >   }
> > +/*
> > + * Highest GT/tile count for any platform.  Used only for memory allocation
> > + * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
> > + * structures should use the per-platform xe->info.max_gt_per_tile instead.
> > + */
> >   #define XE_MAX_GT_PER_TILE 2
> > -static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
> > -{
> > -	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
> > -		gt_id = 0;
> > -
> > -	return gt_id ? tile->media_gt : tile->primary_gt;
> > -}
> > -
> >   static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
> >   {
> > -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> > +	struct xe_tile *tile;
> >   	struct xe_gt *gt;
> > -	/*
> > -	 * FIXME: This only works for now because multi-tile and standalone
> > -	 * media are mutually exclusive on the platforms we have today.
> > -	 *
> > -	 * id => GT mapping may change once we settle on how we want to handle
> > -	 * our UAPI.
> > -	 */
> > -	if (MEDIA_VER(xe) >= 13) {
> > -		gt = xe_tile_get_gt(root_tile, gt_id);
> > -	} else {
> > -		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
> > -			gt_id = 0;
> > +	if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile)
> > +		return NULL;
> > -		gt = xe->tiles[gt_id].primary_gt;
> > +	tile = &xe->tiles[gt_id / xe->info.max_gt_per_tile];
> > +	switch (gt_id % xe->info.max_gt_per_tile) {
> > +	default:
> > +		xe_assert(xe, false);
> > +		fallthrough;
> > +	case 0:
> > +		gt = tile->primary_gt;
> > +		break;
> > +	case 1:
> > +		gt = tile->media_gt;
> > +		break;
> >   	}
> >   	if (!gt)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 7e4f6d846af6..78c4acafd268 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -294,6 +294,8 @@ struct xe_device {
> >   		u8 vram_flags;
> >   		/** @info.tile_count: Number of tiles */
> >   		u8 tile_count;
> > +		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
> > +		u8 max_gt_per_tile;
> >   		/** @info.gt_count: Total number of GTs for entire device */
> >   		u8 gt_count;
> >   		/** @info.vm_max_level: Max VM level */
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index 824461c31288..316031854c26 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -57,6 +57,7 @@ struct xe_device_desc {
> >   	u8 dma_mask_size;
> >   	u8 max_remote_tiles:2;
> > +	u8 max_gt_per_tile:2;
> >   	u8 require_force_probe:1;
> >   	u8 is_dgfx:1;
> > @@ -208,6 +209,7 @@ static const struct xe_device_desc tgl_desc = {
> >   	.dma_mask_size = 39,
> >   	.has_display = true,
> >   	.has_llc = true,
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   };
> > @@ -218,6 +220,7 @@ static const struct xe_device_desc rkl_desc = {
> >   	.dma_mask_size = 39,
> >   	.has_display = true,
> >   	.has_llc = true,
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   };
> > @@ -231,6 +234,7 @@ static const struct xe_device_desc adl_s_desc = {
> >   	.has_display = true,
> >   	.has_llc = true,
> >   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   	.subplatforms = (const struct xe_subplatform_desc[]) {
> >   		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> > @@ -248,6 +252,7 @@ static const struct xe_device_desc adl_p_desc = {
> >   	.has_display = true,
> >   	.has_llc = true,
> >   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   	.subplatforms = (const struct xe_subplatform_desc[]) {
> >   		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> > @@ -263,6 +268,7 @@ static const struct xe_device_desc adl_n_desc = {
> >   	.has_display = true,
> >   	.has_llc = true,
> >   	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   };
> > @@ -278,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
> >   	.has_display = true,
> >   	.has_gsc_nvm = 1,
> >   	.has_heci_gscfi = 1,
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   };
> > @@ -301,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
> >   	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> >   	.pre_gmdid_media_ip = &media_ip_xehpm,
> >   	.dma_mask_size = 46,
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   	DG2_FEATURES,
> > @@ -312,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
> >   	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
> >   	.pre_gmdid_media_ip = &media_ip_xehpm,
> >   	.dma_mask_size = 46,
> > +	.max_gt_per_tile = 1,
> >   	.require_force_probe = true,
> >   	DG2_FEATURES,
> > @@ -328,6 +337,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
> >   	.has_display = false,
> >   	.has_gsc_nvm = 1,
> >   	.has_heci_gscfi = 1,
> > +	.max_gt_per_tile = 1,
> >   	.max_remote_tiles = 1,
> >   	.require_force_probe = true,
> >   	.has_mbx_power_limits = false,
> > @@ -340,6 +350,7 @@ static const struct xe_device_desc mtl_desc = {
> >   	.dma_mask_size = 46,
> >   	.has_display = true,
> >   	.has_pxp = true,
> > +	.max_gt_per_tile = 2,
> >   };
> >   static const struct xe_device_desc lnl_desc = {
> > @@ -347,6 +358,7 @@ static const struct xe_device_desc lnl_desc = {
> >   	.dma_mask_size = 46,
> >   	.has_display = true,
> >   	.has_pxp = true,
> > +	.max_gt_per_tile = 2,
> >   	.needs_scratch = true,
> >   };
> > @@ -359,6 +371,7 @@ static const struct xe_device_desc bmg_desc = {
> >   	.has_mbx_power_limits = true,
> >   	.has_gsc_nvm = 1,
> >   	.has_heci_cscfi = 1,
> > +	.max_gt_per_tile = 2,
> >   	.needs_scratch = true,
> >   };
> > @@ -367,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
> >   	.dma_mask_size = 46,
> >   	.has_display = true,
> >   	.has_sriov = true,
> > +	.max_gt_per_tile = 2,
> >   	.require_force_probe = true,
> >   	.needs_scratch = true,
> >   };
> > @@ -616,6 +630,10 @@ static int xe_info_init_early(struct xe_device *xe,
> >   	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
> >   				 xe_modparam.probe_display &&
> >   				 desc->has_display;
> > +
> > +	xe_assert(xe, desc->max_gt_per_tile > 0);
> > +	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
> > +	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
> >   	xe->info.tile_count = 1 + desc->max_remote_tiles;
> >   	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
> > diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> > index 69df0e3520a5..94a8e1db71e4 100644
> > --- a/drivers/gpu/drm/xe/xe_pmu.c
> > +++ b/drivers/gpu/drm/xe/xe_pmu.c
> > @@ -160,7 +160,9 @@ static bool event_gt_forcewake(struct perf_event *event)
> >   static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
> >   			    unsigned int id)
> >   {
> > -	if (gt >= XE_MAX_GT_PER_TILE)
> > +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> > +
> > +	if (gt >= xe->info.max_gt_per_tile)
> >   		return false;
> 
> This will not work.  For pmu events, gt will be across multiple tiles.
> 
> Here for example, if a tile has 2 gts and there are 2 tiles. Then a valid gt
> id is 3. But max_gt_per_tile is 2. So it will return a false

So it sounds like the change here is an accurate conversion of the
existing code (changing the global constant XE_MAX_GT_PER_TILE into a
platform-specific xe->info.max_gt_per_tile value), but the original
logic is already problematic?  In that case we should probably fix this
as a follow-up patch to avoid mixing two different kinds of changes into
the same patch.

> 
> Can we have
> 
> if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile) or a
> xe_device_get_gt check similar to
> https://patchwork.freedesktop.org/series/150943/

If we're trying to make sure the GT itself is valid, then it would
probably be easier (and more accurate) to just do

        if (!xe_device_get_gt(xe, gt_id))
                return -EINVAL;

since that would also accurately raise an error on unused GT IDs that
fall in the middle of the valid range.  E.g., if a platform only has GT
IDs 0, 2, and 3 (media fused off on the first tile), then it would warn
if an ID of 1 is passed too.


Matt

> 
> Thanks
> Riana>
> >   	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index e8e1743dcb1e..e615b0916217 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -141,7 +141,7 @@ query_engine_cycles(struct xe_device *xe,
> >   		return -EINVAL;
> >   	eci = &resp.eci;
> > -	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
> > +	if (eci->gt_id >= xe->info.max_gt_per_tile)
> >   		return -EINVAL;
> >   	gt = xe_device_get_gt(xe, eci->gt_id);
> 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
