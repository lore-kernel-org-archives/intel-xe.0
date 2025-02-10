Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05687C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 17:09:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBAA610E05D;
	Mon, 10 Feb 2025 17:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKjmL+2+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B7810E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739207350; x=1770743350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=at18evQi7ELi7IjeOfXtKhoUfws9Qv9uhT9RzdoleWU=;
 b=FKjmL+2+yOJL6Xu56KDEAVmMw1zJ+5uML0PMMmNPIrKQ3NBE93NBeZeH
 yeB8tgo4KS0jCoEWBXmNpTq5wSzDOd6SsILQ9RFj/5hWvLl4ycBD8/UiS
 Yaq3LZEs4+QyxAAeyVzf2ZN/QuKFJ1s1E51koFGHyb1KsF82u2XEvWlJj
 W13zk5cTO5Xs8Zcbm6q7fFsaYbeh3rh50eAPA0A3OmsycsIoXwIJ1ZcV6
 JlUdga8PJnO2NZQdH+3t02ArlsoN/LPfaxh23d7QTyqEeyppLwNEN7N1w
 1uMEIGa68dOUQZ0YH88lG40lFUvxyCcJ4TOnm+AKEvvJZ85751RLAN+ZN A==;
X-CSE-ConnectionGUID: IvwLmEtyQ4GsCHhxEubVJw==
X-CSE-MsgGUID: ZZLGHwMZRjm9OHlyfGf7kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39819630"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39819630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 09:09:10 -0800
X-CSE-ConnectionGUID: TF620mLATSCmrKinCqmymg==
X-CSE-MsgGUID: pv/mgW1gT3aFuBKkhw9jMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117460933"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 09:09:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 09:09:08 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 09:09:08 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 09:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=piKffKGXm1TGbU0c7CuxUAddIk4frO4k7YJ1H0RqioK2ZDjCDdAgtl19PeOrPtxgU7c6iem/ly0CrJr9iIznK3027ld5BU+fSLR05DF3gS7F1ZhUrNKk4g1VjrYbOHJLEYN4/nrcbw9djXbn8dw9FhooPMVBL07mOHEmNq7B/rR+cnfKrQpLXWS4aWA0wX+dhFMkAPIqBjBY3LkmR+9u0iEzkaUCUXkf/aV6xS1jh6vyuO3CPdYj0uYsBR0lMC2lk53YVKfSOaukSdPe/4/oC8BKacqx/UhlW5IpZJmJlW0z2DqnlssMkUWlSj4VrzkD2keNbPfHd0s4boFzm1vREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGUozto+0wGqA1xXDJHL8Jhuzgr7oXWxFcsIPZx+j4U=;
 b=wg6FNJ+ia1L3ogHjwpWYyoZM0IpXyCHRVpBc4s4G1b7xEJ8L3n+C+zLuhgLQ3kCbtdNe25WtS82q3nOYDh2QPYuRnblcQJOqUw7H8P8t+oiHAw4Pqeq244zhDxORRTtaJojcBa2eWkC86+PuuShibeLNIvEsgMYwOtE0EtCZz521t0e/xHSR6nqwGh7v+reXOKRMOXWIz8FNwriPBvdeQxnzI3VORVQnSenyXS/NEy5JOmdenv6tjSG0NxkU2UBRT2ic0tPXZrq4z+d970DRHqt05qF9UpKxi2OpzT23/LP8cfextkHPtNuWWLoeqyjLKiMcaORnIzdkUnsOUmfBMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:08:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:08:51 +0000
Date: Mon, 10 Feb 2025 09:09:50 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z6oy3ijsKyk87MFR@lstrano-desk.jf.intel.com>
References: <20250204184558.4181478-1-oak.zeng@intel.com>
 <20250204184558.4181478-2-oak.zeng@intel.com>
 <Z6SQSHJQL+M8FvA2@lstrano-desk.jf.intel.com>
 <MN2PR11MB47286694E479DE45E24C93F892F62@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MN2PR11MB47286694E479DE45E24C93F892F62@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: f9043491-b0ce-4838-eb5d-08dd49f59763
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mREIEFJu7xTeyVRqIJjneptjFjAekOd7so95pcbjlFVrEd84TXlAFaZLuHhI?=
 =?us-ascii?Q?jlQUPgfUri01nWmQVxaoi5GDgk9dnlabz4Uhkq6340Xoz9DN7+QA+XKFPG/y?=
 =?us-ascii?Q?wubjUL8699QcGt2dpNFfX/ROnJE4zqcr3sutuCEy7yUnWKuzyoK26TyXLB3L?=
 =?us-ascii?Q?s9UpMcmiquG62VK7TiEoBgfaTYnnB4D5aWuqcWhVxByb3Tnz05482O9SDnEV?=
 =?us-ascii?Q?kIon5lFTnvECwTkTWskfuLAAK+ZvLRGiobHMCARDGaJAgySwGGaqk1EfNw+9?=
 =?us-ascii?Q?SyQCVm5etgpHVVgUrtb3eD6+VMZ2lEGI3EibpHGnAAmej3JJU3d5aWNIS/li?=
 =?us-ascii?Q?DRYnr8+RGCAhHcqPtm3AMME8FxsdEzuNRyAJkAOnFtPp0tWzxkBvdiNXiAaX?=
 =?us-ascii?Q?Nv5B1MhQCoQQuRMt4LOi2T1Z91Vuh+wkGd1CpsQLrgLt7upMm1Lex7jz/yuV?=
 =?us-ascii?Q?TgOTgXjfnxxbMXinLTiv4zfNfSsKrmwasOsevF0biwvXPjpYN7LnzwEOZgrO?=
 =?us-ascii?Q?B2TAi6fvZasI+ocXRlzWYQRDPBl7TjcHti27pTEWMjPKCIqVT92M6JEmfXuO?=
 =?us-ascii?Q?JLjvsO5BC3fYT9obpAhGMc515SziOOn11pnK1ICKzYDUKFO5o3fBgU2G4rBT?=
 =?us-ascii?Q?bqenCKDHWMBrOsrM0/6iWN6eNyUpxk0os8uHgAUeWnsHvs/s69AagHuTG1PE?=
 =?us-ascii?Q?WydrIaOE2VRBfOlQe8IUmh9ONtn03at0DyE1v8FHPpNyefI+FF2ZGGuitGzX?=
 =?us-ascii?Q?Qq0/xuRHG9Z6s4DtJgbzAuOU5Qn4hZIO1oQ/j3mZqSf0hAJ9erxay0b5cw0m?=
 =?us-ascii?Q?MThYmkI0hMAO5UG1tU/GJOVqb5lZkfxcy+aIs1kJ11ZgZodWmcADYNsbTMMr?=
 =?us-ascii?Q?dbK3SNJYlJ9V021vDeZC0oA1LS6qFlJMgvJktqdRhp2CZDQBNmIMGhoOlE8G?=
 =?us-ascii?Q?ZbXvDG4oo0IPmo2Tv9Fm2egSLDXa6dLRLOdEY9j9a0b8i+E3AEwuEoS/9zRN?=
 =?us-ascii?Q?IWlA7N2vxmTkw4v8LPGy8PHr6vaQJWERkSw6CwXuv6Lxd9sfBEKVsO3zq2M5?=
 =?us-ascii?Q?BzzYrmCYxQsaGyy3hMd4ShxZLDSRro+pR9OMYjJaLiiUhAzAogf1zDF5WEYm?=
 =?us-ascii?Q?17sPVlVjNujtnOPHJ2i714NVmoqcEmbqCsiiS+uh+GpO1mId4ngK31VCk0Xy?=
 =?us-ascii?Q?PI3/sJnqpxysj+mGONuHWKjT4GGsvm/0dCPj+Gh5KypPTWwU4NG90ZCUFb1L?=
 =?us-ascii?Q?xi4/Or8ZM1lWHIesTfzHGHXTc/yXD7827xuPlElE1UlG8P/1aAm0G68YP0H8?=
 =?us-ascii?Q?Z38yBysWIWLIzf9Vnf/D5WoQVHgwfMZNTm1U/jYnaX5lEMcHMG2iZSVBEmPf?=
 =?us-ascii?Q?xYU5iCuNOE2EAW0w9kJcVxdAe1X5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lULUqEpkGglWXBpFypgAZhUsKUnlXtDKsqLte13o1gwNZ2P6CPGvmWo+ClAS?=
 =?us-ascii?Q?wNMjOo+TbmG3JkR8CzG9wlQSgHz9PPYsKg7aZLfrPp5Z03IhssKNt3b414iE?=
 =?us-ascii?Q?0o98bbwwmOq+RlLDq83U7d9Ajn7QIWkV1ofER+HlkeV6Z/I4rr0FZuxeBXg7?=
 =?us-ascii?Q?UHBXUtfP7rDCei2EWXjlXcxPtUNble+sSaD/T1EPRK3XeXrNOuKmNQ94PCgw?=
 =?us-ascii?Q?DZZ7ZYZdQcq+CtmDIwRSyQIFE953rlz4Et4k7flSZ7nEUXPwgA2kJ82AP2J2?=
 =?us-ascii?Q?1lt2MZIfKctiYsRDG7WtyMDYA6izgXh7BNw6QF2JWtJoxxOy4dZvdeooOmfB?=
 =?us-ascii?Q?8oSV+1xLH/NeI3cUuSOm+opLwV0XQEEtImDreW3T5h2Y1OR4gqnnVgfFl7UK?=
 =?us-ascii?Q?Ik6ZJupxozZOIqotSNBAbjNh0NwB2L1TMFPoQbnfQclpzdPNlf0I9m68+qFw?=
 =?us-ascii?Q?Ddzy0brvB3o7YwzuW6FA3vwOBsWa6oR+9i/YrPV3pED47UkoxEgD+squvfQq?=
 =?us-ascii?Q?24tRInY43Fy1iE2rBF5gZilNCf+QurLDSAg8y61iK02jUNAEe1JrjlC/ocf2?=
 =?us-ascii?Q?jiY/YR0P0/eZ+zcwgZHgCTNpFNtoODlB1q+iTAN/hj9OODgqNxpqd916IZjw?=
 =?us-ascii?Q?TSWezyQSGTJgkz1IxfCXcI3S5bdhTyIV5oKAKXAFo1FsAkj+gF2sdqucPzQ5?=
 =?us-ascii?Q?AjUuIz6ayrVmFsxt7WQmqJ9661UvIwPJghA60cUVu9+PA/Mbg9v0BymcXVh4?=
 =?us-ascii?Q?P6YzQvtH0RJpVgzHviRl6JJEU8GYm8c0yETIzOWhRnsrCPIvKKgSQn8Ac2Ct?=
 =?us-ascii?Q?uCcOSUXGPn5npUy5TIlTtvmx6TuHO3hR7tOLProH6VEWSzemC9VBs6/y6Vff?=
 =?us-ascii?Q?StgTRi2ZwHo0QeLLog/h4gPgIxY1Yj7FG+SuuZl0Mk4CvpmXhUQnE6TzggQg?=
 =?us-ascii?Q?Dl8XGA7kZDu6cag+ru92PqxytYxVw4m/XMybuUdKhBHJJYszRq1Y7XMit4e9?=
 =?us-ascii?Q?BH3zR087i9j74yG5IxoiYjFnzPyK8q+ueGHz0IIkTEPJ9mkQq1SoS3LnUfOf?=
 =?us-ascii?Q?3H/qcJEc4LdnImYmcrUBaWIUOqpe4QHe6pH9fLmeovKhxb68v2RE/LIMzCGX?=
 =?us-ascii?Q?mQLCF7BJOlI4C+vAtzVVUuwKSBfFgnWSttNxHmzRWSNOR+M5jtPnoRkXIX2Z?=
 =?us-ascii?Q?FcPPGLSsmPf5iRyOh8LBiGJIzBkitMtfTh4gXgMNgxqGbr6AO37usKwEWL0R?=
 =?us-ascii?Q?z0Aa978t7qE4ME/3P5VrRuNtkOHBzTWCWqa/oR9LKuNoxmLu2KM0yQJzQcr1?=
 =?us-ascii?Q?PVUjnXsiQZB4KlmQmVyeXHhHOr6yOLNSe4NhVwje/9frkIdw71lap2U7+6mb?=
 =?us-ascii?Q?4zB9MdupL6NOVv96H9MLkGiwF82qmWIUdzQFnpD3hmwKTGM1PeIIMjk8dFXX?=
 =?us-ascii?Q?QInaIaSmTR7LkukbNWy3M/069bGIv/QuzEa+wYeioW9WjCXj80hrDM/UkuIc?=
 =?us-ascii?Q?6rVInTYEaB6vsnkL645DzxHeT+0tAqsDX8xyMRqLHRe0XZ4l5FkLyhmp5WUr?=
 =?us-ascii?Q?QJ3bss/b9zdTVRy5q0vwH7sesKw1UJ6qo8sf0Snx9m1NiG570qxHotqfdf4V?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9043491-b0ce-4838-eb5d-08dd49f59763
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:08:51.5721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9z2xHNHTBEiUJasFhBlL0w0V/fEIVkH2BjiSZNI6WC1gAIzuyyhaG4jB5WNqeiXPAFjZ6O88amgHzwgMZ6MSmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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

On Thu, Feb 06, 2025 at 08:16:36AM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: February 6, 2025 5:35 AM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org;
> > Thomas.Hellstrom@linux.intel.com; Cavitt, Jonathan
> > <jonathan.cavitt@intel.com>
> > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
> > 
> > On Tue, Feb 04, 2025 at 01:45:57PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > need
> > > to clear the scratch page mapping before vm_bind for the vm_bind
> > > address range. Under fault mode, we depend on recoverable page
> > fault
> > > to establish mapping in page table. If scratch page is not cleared,
> > > GPU access of address won't cause page fault because it always hits
> > > the existing scratch page mapping.
> > >
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > >
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > page
> > > under fault mode. On other platform we don't allow scratch page
> > under
> > > fault mode, so no need of such clearing.
> > >
> > > v2: Rework vm_bind pipeline to clear scratch page mapping. This is
> > similar
> > > to a map operation, with the exception that PTEs are cleared
> > instead of
> > > pointing to valid physical pages. (Matt, Thomas)
> > >
> > > TLB invalidation is needed after clear scratch page mapping as larger
> > > scratch page mapping could be backed by physical page and cached
> > in
> > > TLB. (Matt, Thomas)
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > 
> > Given the complexity of the VM bind path, I think we need an IGT
> > posted
> > with this series before merging as I suggested in v1. Without it, it
> > will be fairly difficult to ensure correctness by reviews only.
> 
> I did have an igt posted in patch 3 of this series.
> 
> The reason I posted on patch 3 is, without patch 3 this "feature"
> Is not enabled. 
> 

Just replied to Thomas, see my reply there - I did miss an IGT was
included but I think we need to do a bit better, more details in my
reply to Thomas.

Matt

> Oak
> 
> > 
> > Matt
> > 
> > > ---
> > >  drivers/gpu/drm/xe/xe_pt.c       | 66 ++++++++++++++++++++++--
> > --------
> > >  drivers/gpu/drm/xe/xe_pt_types.h |  2 +
> > >  drivers/gpu/drm/xe/xe_vm.c       | 29 ++++++++++++--
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
> > >  4 files changed, 75 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > b/drivers/gpu/drm/xe/xe_pt.c
> > > index 1ddcc7e79a93..3fd0ae2dbe7d 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > @@ -268,6 +268,8 @@ struct xe_pt_stage_bind_walk {
> > >  	 * granularity.
> > >  	 */
> > >  	bool needs_64K;
> > > +	/* @clear_pt: clear page table entries during the bind walk */
> > > +	bool clear_pt;
> > >  	/**
> > >  	 * @vma: VMA being mapped
> > >  	 */
> > > @@ -497,21 +499,25 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >
> > >  		XE_WARN_ON(xe_walk->va_curs_start != addr);
> > >
> > > -		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> > > -						 xe_res_dma(curs) +
> > xe_walk->dma_offset,
> > > -						 xe_walk->vma,
> > pat_index, level);
> > > -		pte |= xe_walk->default_pte;
> > > +		if (xe_walk->clear_pt) {
> > > +			pte = 0;
> > > +		} else {
> > > +			pte = vm->pt_ops->pte_encode_vma(is_null ?
> > 0 :
> > > +					xe_res_dma(curs) + xe_walk-
> > >dma_offset,
> > > +					xe_walk->vma, pat_index,
> > level);
> > > +			pte |= xe_walk->default_pte;
> > >
> > > -		/*
> > > -		 * Set the XE_PTE_PS64 hint if possible, otherwise if
> > > -		 * this device *requires* 64K PTE size for VRAM, fail.
> > > -		 */
> > > -		if (level == 0 && !xe_parent->is_compact) {
> > > -			if (xe_pt_is_pte_ps64K(addr, next, xe_walk))
> > {
> > > -				xe_walk->vma->gpuva.flags |=
> > XE_VMA_PTE_64K;
> > > -				pte |= XE_PTE_PS64;
> > > -			} else if (XE_WARN_ON(xe_walk-
> > >needs_64K)) {
> > > -				return -EINVAL;
> > > +			/*
> > > +			 * Set the XE_PTE_PS64 hint if possible,
> > otherwise if
> > > +			 * this device *requires* 64K PTE size for
> > VRAM, fail.
> > > +			 */
> > > +			if (level == 0 && !xe_parent->is_compact) {
> > > +				if (xe_pt_is_pte_ps64K(addr, next,
> > xe_walk)) {
> > > +					xe_walk->vma->gpuva.flags
> > |= XE_VMA_PTE_64K;
> > > +					pte |= XE_PTE_PS64;
> > > +				} else if (XE_WARN_ON(xe_walk-
> > >needs_64K)) {
> > > +					return -EINVAL;
> > > +				}
> > >  			}
> > >  		}
> > >
> > > @@ -519,7 +525,7 @@ xe_pt_stage_bind_entry(struct xe_ptw
> > *parent, pgoff_t offset,
> > >  		if (unlikely(ret))
> > >  			return ret;
> > >
> > > -		if (!is_null)
> > > +		if (!is_null && !xe_walk->clear_pt)
> > >  			xe_res_next(curs, next - addr);
> > >  		xe_walk->va_curs_start = next;
> > >  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K <<
> > level);
> > > @@ -589,6 +595,7 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   * @vma: The vma indicating the address range.
> > >   * @entries: Storage for the update entries used for connecting the
> > tree to
> > >   * the main tree at commit time.
> > > + * @clear_pt: Clear the page table entries.
> > >   * @num_entries: On output contains the number of @entries
> > used.
> > >   *
> > >   * This function builds a disconnected page-table tree for a given
> > address
> > > @@ -602,7 +609,8 @@ static const struct xe_pt_walk_ops
> > xe_pt_stage_bind_ops = {
> > >   */
> > >  static int
> > >  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		 struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		 struct xe_vm_pgtable_update *entries,
> > > +		 bool clear_pt, u32 *num_entries)
> > >  {
> > >  	struct xe_device *xe = tile_to_xe(tile);
> > >  	struct xe_bo *bo = xe_vma_bo(vma);
> > > @@ -622,10 +630,19 @@ xe_pt_stage_bind(struct xe_tile *tile,
> > struct xe_vma *vma,
> > >  		.vma = vma,
> > >  		.wupd.entries = entries,
> > >  		.needs_64K = (xe_vma_vm(vma)->flags &
> > XE_VM_FLAG_64K) && is_devmem,
> > > +		.clear_pt = clear_pt,
> > >  	};
> > >  	struct xe_pt *pt = xe_vma_vm(vma)->pt_root[tile->id];
> > >  	int ret;
> > >
> > > +	if (clear_pt) {
> > > +		ret = xe_pt_walk_range(&pt->base, pt->level,
> > xe_vma_start(vma),
> > > +				       xe_vma_end(vma),
> > &xe_walk.base);
> > > +
> > > +		*num_entries = xe_walk.wupd.num_used_entries;
> > > +		return ret;
> > > +	}
> > > +
> > >  	/**
> > >  	 * Default atomic expectations for different allocation
> > scenarios are as follows:
> > >  	 *
> > > @@ -981,12 +998,14 @@ static void xe_pt_free_bind(struct
> > xe_vm_pgtable_update *entries,
> > >
> > >  static int
> > >  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> > > -		   struct xe_vm_pgtable_update *entries, u32
> > *num_entries)
> > > +		   struct xe_vm_pgtable_update *entries,
> > > +		   bool invalidate_on_bind, u32 *num_entries)
> > >  {
> > >  	int err;
> > >
> > >  	*num_entries = 0;
> > > -	err = xe_pt_stage_bind(tile, vma, entries, num_entries);
> > > +	err = xe_pt_stage_bind(tile, vma, entries, invalidate_on_bind,
> > > +			       num_entries);
> > >  	if (!err)
> > >  		xe_tile_assert(tile, *num_entries);
> > >
> > > @@ -1661,6 +1680,7 @@ static int bind_op_prepare(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  		return err;
> > >
> > >  	err = xe_pt_prepare_bind(tile, vma, pt_op->entries,
> > > +				 pt_update_ops->invalidate_on_bind,
> > >  				 &pt_op->num_entries);
> > >  	if (!err) {
> > >  		xe_tile_assert(tile, pt_op->num_entries <=
> > > @@ -1685,7 +1705,7 @@ static int bind_op_prepare(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  		 * it needs to be done here.
> > >  		 */
> > >  		if ((!pt_op->rebind && xe_vm_has_scratch(vm) &&
> > > -		     xe_vm_in_preempt_fence_mode(vm)))
> > > +		     xe_vm_in_preempt_fence_mode(vm)) ||
> > pt_update_ops->invalidate_on_bind)
> > >  			pt_update_ops->needs_invalidation = true;
> > >  		else if (pt_op->rebind && !xe_vm_in_lr_mode(vm))
> > >  			/* We bump also if batch_invalidate_tlb is
> > true */
> > > @@ -1759,9 +1779,13 @@ static int op_prepare(struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm))
> > > +		if (!op->map.immediate &&
> > xe_vm_in_fault_mode(vm) &&
> > > +		    !op->map.invalidate_on_bind)
> > >  			break;
> > >
> > > +		if (op->map.invalidate_on_bind)
> > > +			pt_update_ops->invalidate_on_bind = true;
> > > +
> > >  		err = bind_op_prepare(vm, tile, pt_update_ops, op-
> > >map.vma);
> > >  		pt_update_ops->wait_vm_kernel = true;
> > >  		break;
> > > @@ -1871,6 +1895,8 @@ static void bind_op_commit(struct xe_vm
> > *vm, struct xe_tile *tile,
> > >  	}
> > >  	vma->tile_present |= BIT(tile->id);
> > >  	vma->tile_staged &= ~BIT(tile->id);
> > > +	if (pt_update_ops->invalidate_on_bind)
> > > +		vma->tile_invalidated |= BIT(tile->id);
> > >  	if (xe_vma_is_userptr(vma)) {
> > >  		lockdep_assert_held_read(&vm-
> > >userptr.notifier_lock);
> > >  		to_userptr_vma(vma)->userptr.initial_bind = true;
> > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > index 384cc04de719..3d0aa2a5102e 100644
> > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > @@ -108,6 +108,8 @@ struct xe_vm_pgtable_update_ops {
> > >  	bool needs_userptr_lock;
> > >  	/** @needs_invalidation: Needs invalidation */
> > >  	bool needs_invalidation;
> > > +	/** @invalidate_on_bind: Invalidate the range before bind */
> > > +	bool invalidate_on_bind;
> > >  	/**
> > >  	 * @wait_vm_bookkeep: PT operations need to wait until VM
> > is idle
> > >  	 * (bookkeep dma-resv slots are idle) and stage all future VM
> > activity
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index d664f2e418b2..813d893d9b63 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1921,6 +1921,23 @@ static void print_op(struct xe_device *xe,
> > struct drm_gpuva_op *op)
> > >  }
> > >  #endif
> > >
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm
> > *vm, u32 bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!NEEDS_SCRATCH(vm->xe))
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > >  /*
> > >   * Create operations list from IOCTL arguments, setup operations
> > fields so parse
> > >   * and commit steps are decoupled from IOCTL arguments. This
> > step can fail.
> > > @@ -1991,6 +2008,8 @@ vm_bind_ioctl_ops_create(struct xe_vm
> > *vm, struct xe_bo *bo,
> > >  			op->map.is_null = flags &
> > DRM_XE_VM_BIND_FLAG_NULL;
> > >  			op->map.dumpable = flags &
> > DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > >  			op->map.pat_index = pat_index;
> > > +			op->map.invalidate_on_bind =
> > > +
> > 	__xe_vm_needs_clear_scratch_pages(vm, flags);
> > >  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> > >  			op->prefetch.region = prefetch_region;
> > >  		}
> > > @@ -2188,7 +2207,8 @@ static int vm_bind_ioctl_ops_parse(struct
> > xe_vm *vm, struct drm_gpuva_ops *ops,
> > >  				return PTR_ERR(vma);
> > >
> > >  			op->map.vma = vma;
> > > -			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm))
> > > +			if (op->map.immediate
> > || !xe_vm_in_fault_mode(vm) ||
> > > +			    op->map.invalidate_on_bind)
> > >
> > 	xe_vma_ops_incr_pt_update_ops(vops,
> > >  							      op-
> > >tile_mask);
> > >  			break;
> > > @@ -2416,9 +2436,10 @@ static int op_lock_and_prep(struct
> > drm_exec *exec, struct xe_vm *vm,
> > >
> > >  	switch (op->base.op) {
> > >  	case DRM_GPUVA_OP_MAP:
> > > -		err = vma_lock_and_validate(exec, op->map.vma,
> > > -					    !xe_vm_in_fault_mode(vm)
> > ||
> > > -					    op->map.immediate);
> > > +		if (!op->map.invalidate_on_bind)
> > > +			err = vma_lock_and_validate(exec, op-
> > >map.vma,
> > > +
> > 	    !xe_vm_in_fault_mode(vm) ||
> > > +						    op-
> > >map.immediate);
> > >  		break;
> > >  	case DRM_GPUVA_OP_REMAP:
> > >  		err = check_ufence(gpuva_to_vma(op-
> > >base.remap.unmap->va));
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 52467b9b5348..dace04f4ea5e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -297,6 +297,8 @@ struct xe_vma_op_map {
> > >  	bool is_null;
> > >  	/** @dumpable: whether BO is dumped on GPU hang */
> > >  	bool dumpable;
> > > +	/** @invalidate: invalidate the VMA before bind */
> > > +	bool invalidate_on_bind;
> > >  	/** @pat_index: The pat index to use for this operation. */
> > >  	u16 pat_index;
> > >  };
> > > --
> > > 2.26.3
> > >
