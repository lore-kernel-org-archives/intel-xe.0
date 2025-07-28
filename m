Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6698C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 21:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959CE10E069;
	Mon, 28 Jul 2025 21:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O222BUNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FBF10E069
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 21:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753737229; x=1785273229;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kF4WXUamM6AR54a4UQgIJnVGpgggk4YjLHFYbriDCNI=;
 b=O222BUNTunJ+tp2sjdmyofK4p05NCEl44nBhOsL1cXWLedU6rREeWsz3
 mjWPrdxblq7vCU0ajHG6Snlpv/xCwvy7PKgDKynH7oYuy1uggZU573UDs
 OMZiEKL6h2qZ6BUlX6cZqz6GVwr93bChM96NRyibFZfmduhcqZSKIVj3E
 CGur+7uuoEvbEQ8rtE/AOBvvwCRclKPCWz2KzscQhcHCVgL/jdMvygAgw
 z4GoxMmAkoVLLVBsd8qOpIdygiVSGwsUhPaRUa+q8PwYRos01hqShr4tM
 B1C+UwBGu6Yjvxvpvhag7PnQjC1ykde19K/ySX+gyDGw7iXtOLj/cKShi A==;
X-CSE-ConnectionGUID: x4bIrljsSoWOcqA+okM8gg==
X-CSE-MsgGUID: BuRsU/T6SV6yTfFJgweMow==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="81437491"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="81437491"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 14:13:49 -0700
X-CSE-ConnectionGUID: 4kbPRg+4RwGsPmgZyH+mAg==
X-CSE-MsgGUID: eSOsSaZJTB6Vf49k8M32MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="186165309"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 14:13:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 14:13:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 14:13:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.82) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 14:13:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmVQwj0bIZ0shXH5xx9Y6HYFxX99bCvy+OBX/lXgS1lbvmX9d2OUj27ejrrCU+QLeVSapQo+PvoXwe14ZMhFzmmwqqoTapRxTAcJ3G7z4SI/pc9vo4y09OzrHKwwITao4oe08x2tydIZF8x2ezXB05bAAqzR2Bp4oKQvtIS3T01hJ+dek5RucCK10DAUKiXTP1nwBQmMoxlepaq8XyimOuSRqUFYFQahTd6vZr7uWBBBfcMM4BQbTRhyr5b/MrX4l2FmliHSoTk/W8s2gCCv8tRvoxyZ02v+rDxN8koWWjpVZq6yCwApeHxil7h2fKAi1JYI3W8yMNtDeVRmIsumgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1XikT7XpQEQ+fxyoiL1tbtQMXOCzPe8Z8dK7E+Et0U=;
 b=Bmwt9DoxKzJ37v+y9u6TBS79ruQaxKbS27Xm1FkahNkvY9X9bZy0GdNuKFXGwIvBQ/0AkZx25BABd+XjqOQ7GuhPBd5juRD14ACTys2+lztgG85EIUhFdUfQsOnWf6IJ40DcK6jQ+O5UR8QMyi3/6i8Azus7rrmNDsXBU02U4vb6PINT2RjjBf3buevLEm7mdq2L7plaGz7r0cNK+Axn3yIaBFjg6yaqpyWYnl+qo+D0ADgMQIlA6aSg8T+WCMyLv4X2cLv3M9215FrWT6+b8iPzXAZLcLL/NIii2p68glJ+7XnJ7RArVg6vSfcfe9TrMVfvTbz5Ik8onf0UPJbHMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 21:13:45 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%5]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 21:13:45 +0000
Date: Mon, 28 Jul 2025 14:15:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/6] drm/xe/svm: Migrate folios when possible
Message-ID: <aIfodlSshuvN2F+N@lstrano-desk.jf.intel.com>
References: <20250725154011.2807655-1-francois.dugast@intel.com>
 <20250725154011.2807655-7-francois.dugast@intel.com>
 <aIQPyTnoaPEIA6zI@lstrano-desk.jf.intel.com>
 <aIeEwt6Kg4lPQCTz@fdugast-desk>
 <aIfY/1kQlmeFRB5G@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aIfY/1kQlmeFRB5G@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|IA1PR11MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 166f59dc-f7c9-430f-6324-08ddce1ba2ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xIESlPk9V+R2HXhV9Gr/azL0gsXD9e5uh0vbO+mhcYFalf6zJgCGlXpbDpDB?=
 =?us-ascii?Q?QKnr/KxJJi6FCkgfPA5IFkPfHK077ZW37nlsPONtQIXUajjGt+WBbfCAJJtv?=
 =?us-ascii?Q?BiS8lJfAbWu5Wd5nORLS45ZprbQJqo7erhj+rkmr5XzgoE70tzb2+u3jhkT0?=
 =?us-ascii?Q?96yfHbUPjP0H3XSESRW5bMAUAzlXK/49c3S6ciKtfKNbmG39rGR2L8QYYu3o?=
 =?us-ascii?Q?/HbeeA2+5KFsbMmBrZj2n4TRL6ewyaqvFwha+Nq/gKmjtrPPTvORsY99CqWb?=
 =?us-ascii?Q?8AqtsS0N/788KWayr+PYz4OFhiuDqEPKIPqrY8V0RIeGj8TSCzgd4AiEKaOr?=
 =?us-ascii?Q?p6QE7LMjEJvywg1FIV0Tr88aCXZTcLKr6E7MpoRLnP3LPW6ZyUjaY7QoMKhr?=
 =?us-ascii?Q?mqMDt9aVNfoVDm30SLXMPiiXh/WhBH6hZ6ztuao/vzY7BvlDDZQ4D7dxDT21?=
 =?us-ascii?Q?xXeSVQ7szqW68DPH0ujufeTrkU+ktanno1uYJvkxuGJmvPp9th67DaiMX/Ha?=
 =?us-ascii?Q?WYCqSqoaRAccN/QvnH0yx4UjqlvEGPa2dhdcM9O3uZ1AsIZ64TwG4ay23NtM?=
 =?us-ascii?Q?MOO2Dy/8atjWcu1FxDRqf48ywg7+o41hakiX6gaJNPl87GICocIcpVVBOXte?=
 =?us-ascii?Q?XwR7cgZ9gdWq+YzYbgLHc/tUXZNwJmyOz1to/D7b5cgA2RCCYnbztX8SKFmE?=
 =?us-ascii?Q?xGVj3t7COjC4l06Xh1GrdEd0hmxcqNy8ks7N9N/zexykNEIc1Gt3Fxydhv2/?=
 =?us-ascii?Q?Y4PP5eoWnIIDI58bPPOS7t4s6ECAXJ/5CIayZb7ThOksBYkKS3oevNPgskVq?=
 =?us-ascii?Q?qMTSlMPkMq+T1rwLmb2KhEsbia/q25afWa4qtyWlqLhPd0JC7nF598io5QyY?=
 =?us-ascii?Q?ivUIrUG8n9GOdA1tF1QGvQKYFfPLsh3h9h3Qs76Wh6m/CKtbQCp02ZPxlcsI?=
 =?us-ascii?Q?ew4TLWKJ/Wr11KNFmJPSqPXhmNoUwoTdO/36vsZCGFXzGYIImpuFhqAV2M8U?=
 =?us-ascii?Q?o6wYEMyjlvlpjzUSUg7vwkcBlekuwZIDd77lkmRzIc7075rzSoSdGJ9SWPkJ?=
 =?us-ascii?Q?X3V0FaZSvPuVTBI8JQ/SO6+oUpZGFmiUtfZEynPR3t2ivbH/22I4GrFrLvdI?=
 =?us-ascii?Q?4VzAkd4lj7PTr4ChSe7aMjcodqySzv2+WtyGnDWk/QNk3VrS+GBJXIbfg8x1?=
 =?us-ascii?Q?+oE98hSBqM9n0Bi220PnR/0RS9Sd/nFoZ4lXxSCE2WUtEhJHUtNrnz4ze8by?=
 =?us-ascii?Q?2ybUlM/HWWixsmFMM/O+cnoxV0Cud1UgUMVpgvX1WcVc0iJP2kXu0Z8CozyL?=
 =?us-ascii?Q?dq3nMF7z5xfSfvgZjpXWdgaqUJdVjcFWZrB65d1qStXIY3vZ3zqqHBgyNSzU?=
 =?us-ascii?Q?PLdlBrS6bOcPHfHWm1nKhxGp1RoiaTEtDeH1Y5W4P+0o1kYOPBdhPhP6cmy6?=
 =?us-ascii?Q?d6IUtBZQ4Gw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lanciq0ILMoqEuWrQxyOKLnsGJt4jEBATYG7r6/xwFr2sbdj56gCXnp+99w7?=
 =?us-ascii?Q?3drcCBW/DSjUKLdryEao2j+zmGO2miTJ8aDHnvXtbNRSeyXSOmuuKDaJtcDB?=
 =?us-ascii?Q?+9Wl9vQEYXUvkzyflEc9IWQTom7DfwVas4HxamobGQhkcrPdOfMzCGe/cbPj?=
 =?us-ascii?Q?/PTFKeNAJCc7k/n59KvhOo30FJjS+7Tkw6sKsz6lHFOpGXz5bgXBhbQlJCGm?=
 =?us-ascii?Q?xys+lyQymucDx6AglBrRCS9N79+vg5zM1hBht2FN/O5x66U0+U2Qejo3oXqb?=
 =?us-ascii?Q?mtlgzSAkdXBhzLJFzymGOzje/8FlPSvydIGAfj01RlrQEDEwb69HRArLRwqH?=
 =?us-ascii?Q?mHXl+mwBkzXVnh9E3nVyG6tTcnc9ed4nCWTvtNTsA+mRC5HSAGN5Lq8r2Eob?=
 =?us-ascii?Q?e4kUys1zeSnoJL0qmzzBsAgNxyz0h2Q5S89R3nbWw7uWTzfCTWcnwaIQ1VkL?=
 =?us-ascii?Q?WAeARNRJ+upFzp//FY+9r5sfznhUC0UNWaAVbFPDWwvY7DyDYOh/V4svkXdY?=
 =?us-ascii?Q?TXqWNniN7jbJtVoe+sPJxbOYC89vMpiR/ZygfpRx5tnTCNvr/3ApAwcD22CD?=
 =?us-ascii?Q?sE10iTpVW0GvKrto+HMm2/jRsX6HKFQV73nHgektIgj7Kyw+nZxbmaPxILCG?=
 =?us-ascii?Q?3y2dgtDJ44ecMWSvXl8y9gcYLzKj6G3W0nt7floPHDhX0fYf6BtSMDxSJ6Dd?=
 =?us-ascii?Q?/7qfwVmIbXszW9+IET2NFeS1qfH6Plk1h8tMI8briIKHQKINXtJNGb2OKej7?=
 =?us-ascii?Q?zEgbNmsEte/9OysYs7v2F7K0xSohbL0fDch4ZdIyEQ82/hkBg9AtGzoB2Taq?=
 =?us-ascii?Q?Tl5DzTLyK0Y30K2Wt3BwaqLk6FR+mSsT8tFWNyMQiuoBwUrBFLserMah5pyx?=
 =?us-ascii?Q?0wGXNjZqpqyzmgQqrCa3WNmM4zIl9EGC8SOydR7t/Cm8TgkTPzH01lJTVhQa?=
 =?us-ascii?Q?+DD/cthCyDd7Q0okcN5f7Q5S14zT8Mlb0t4GMmcfIwXht/2vinqY6F3lN0e8?=
 =?us-ascii?Q?I0jn54ZbIxq9Vo6pchvDJ7eFpO3OM54K+A1jGCVAjiP4Z31623XQJtOOupfD?=
 =?us-ascii?Q?9YF323f7rmPvNggiqswhoulcB8TKXGGZzJtw8PONuqrEp8K8VQy8KDRT5/l0?=
 =?us-ascii?Q?CUDWUEyZdBlvXtBuiMdk5ZFNk6GqRGgEP/H+7PweYIVxuJ8OikzO9scjtIEg?=
 =?us-ascii?Q?ZgkxEs/iFkdD5hd2CHN8FHf08pBfl0nZUElQW+l6bd/OoMFtRIM7hPMxuk/h?=
 =?us-ascii?Q?ONCoMmli4zpcHoVgnP3f/kOGgMfkKLOquW/CxSBlsA0ixGYiaTPnUvJLFSsc?=
 =?us-ascii?Q?RWAkE7kv6N1Cd0YdEd60/Vzlmkaj7xKRE02hOeEZSa9NmSEi1QS/SWQtoXBv?=
 =?us-ascii?Q?tJYqk70iSSzrdw516eiQNWLlC5mtc3tEVY2lpRSI6+PW+keR0wPTr2/8R259?=
 =?us-ascii?Q?C5cD4fCBNn2LegIH3WWsWk95WmY7Q7n/V23wrS8r2KY3OFS7MWlnFxPRRlJA?=
 =?us-ascii?Q?9vQb1/ECGnr2MOcPoEknqLSAKJACGWVsFB+4xe6cTDoofwADLBCKLA94WsTB?=
 =?us-ascii?Q?jWLQGJ+k7iuUp/olgryvyyB2rqdz3p75OtcoZy9K1m9Z+e9K/Kpxa1Tw1mRD?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 166f59dc-f7c9-430f-6324-08ddce1ba2ea
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 21:13:45.1974 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNOgMF+fHiJ2yZk0pJSp1YO4hbr+IPD5tzKlSb5G+gf4yGoaa4a0HI7YXlGnWl8VdIZh7a2B3sPh3s5SPV3u1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
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

On Mon, Jul 28, 2025 at 01:09:35PM -0700, Matthew Brost wrote:
> On Mon, Jul 28, 2025 at 04:10:10PM +0200, Francois Dugast wrote:
> > On Fri, Jul 25, 2025 at 04:14:17PM -0700, Matthew Brost wrote:
> > > On Fri, Jul 25, 2025 at 05:39:30PM +0200, Francois Dugast wrote:
> > > > The DMA mapping can now correspond to a folio (order > 0), so move the
> > > > iterator by the number of pages in the folio in order to migrate all
> > > > pages at once. This will improve efficiency compared to migrating pages
> > > > one by one.
> > > > 
> > > > For this to work, the BOs must be contiguous in memory.
> > > > 
> > > 
> > > I'd mention since SVM BOs are a max of 2M and it is very unlikely
> > > forcing to continuous has any negative affects (e.g., extra eviction),
> > > it greatly simplifies the code, and 2M contiguous memory will enable 2M
> > > device pages which is huge perf win.
> > 
> > Sure, will add.
> > 
> > > 
> > > We might need a small adjustment to populate_devmem_pfn to communicate
> > > contigous memory was found to drm_pagemap too as our driver can easily
> > > allocate contiguous memory, but we shouldn't assume other drivers can
> > > do so. This can be done in follow up which adds the 2M device page
> > > support.
> > 
> > Do I understand correctly: change populate_devmem_pfn() to provide the
> > information to the caller in drm_pagemap whether the allocated memory
> > is contiguous or not, so that it can let the driver know when calling
> > copy_to_devmem(). This way a fallback can be used in the driver when
> > the memory is not contiguous (not implemented below because this seems
> > not necessary in Xe).
> > 
> 

This is riddled with typos, let me make it clear.

> More so to know if it can create folios out of the return pages from
> populate_devmem_pfn() ahead of the copy_to_devmem() call. Yes,
> contigious inform can be inferred from examining all of them, but this

'contigious information can be inferred from examining all of the returned pages'

> would provide a quick short circuit to know it can immediately create
> folios.

'create folios from the returned pages'

> 
> The pages in copy_to_devmem() should provide order, so need for an extra
> argument there.

'The device pages'

'so no need'

Matt

> 
> Matt
> 
> > > 
> > > > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_bo.c  | 2 ++
> > > >  drivers/gpu/drm/xe/xe_svm.c | 5 +++++
> > > >  2 files changed, 7 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index ffca1cea5585..59994a978a8c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -200,6 +200,8 @@ static bool force_contiguous(u32 bo_flags)
> > > >  	else if (bo_flags & XE_BO_FLAG_PINNED &&
> > > >  		 !(bo_flags & XE_BO_FLAG_PINNED_LATE_RESTORE))
> > > >  		return true; /* needs vmap */
> > > > +	else if (bo_flags & XE_BO_FLAG_CPU_ADDR_MIRROR)
> > > > +		return true;
> > > >  
> > > >  	/*
> > > >  	 * For eviction / restore on suspend / resume objects pinned in VRAM
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > > index 1d097e76aabc..2759db5f7407 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > > @@ -382,6 +382,11 @@ static int xe_svm_copy(struct page **pages,
> > > >  				pos = i;
> > > >  			}
> > > >  
> > > > +			if (pagemap_addr[i].order) {
> > > > +				i += NR_PAGES(pagemap_addr[i].order);
> > > 
> > > I think this needs to be NR_PAGES(pagemap_addr[i].order) - 1, right?
> > 
> > Yes correct because i is already incremented by 1 at this point.
> > 
> > > 
> > > > +				last = (i + 1) == npages;
> > > 
> > > Then set the chunk here too?
> > > 
> > > > +			}
> > > > +
> > > >  			match = vram_addr + PAGE_SIZE * (i - pos) == __vram_addr;
> > > 
> > > I think the match can be dropped actually and just assume it is true if
> > > we are allocating continuous memory now.
> > 
> > True, let me try this.
> > 
> > Francois
> > 
> > > 
> > > Matt
> > > 
> > > >  		}
> > > >  
> > > > -- 
> > > > 2.43.0
> > > > 
