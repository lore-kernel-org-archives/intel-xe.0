Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31D6D743CA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 17:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F4F10E06D;
	Thu, 21 Nov 2024 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aVNqyPiY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62DB10E06D
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 17:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732211135; x=1763747135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zjqt5NK2bkDH386kJ1s6Lih7r22I6HV3SNo4CjFkmWE=;
 b=aVNqyPiYA6K9+2//M6AOHxcpq/+alEOiXHTG6YD7vMF26H1Dwxq7gruM
 sV6hX2T7aEUMI2Z6bCVfjP4htbKdCtfdPamN18Gzw8YxolIyeNu6T6/OR
 27wzCePzw8eH1TAZXIP+u7ui8ESfhCFXhiKQzoMdSkA4v0wKyPg0GEgT8
 ChG7HQISGpDPioTBfB7nprZBHMKoENAX9uvDumpV09/8k2FA2WoosSWh2
 dJWuAN1omx5T1NGma8zgpOsvG/fSWZM74cOfNRxBf7N5nX/vf7RtTTurf
 CSjMQcmVdgfZSl0atBANrJrP5Gvc2CS9rFwOwzWTHSC0jGtAeKRxBHFKl g==;
X-CSE-ConnectionGUID: zb1aNodxTnqFbsdZewpXJg==
X-CSE-MsgGUID: 0fhAu1yORReQFLZojgI6Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54849869"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="54849869"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 09:45:30 -0800
X-CSE-ConnectionGUID: MJazSKehQf+AYJBZ/d5AvQ==
X-CSE-MsgGUID: sxoCYZsFS7a5d5Q2gVNyCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94765143"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 09:45:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 09:45:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 09:45:29 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 09:45:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svv0+qQn8mlalJLDWzzvXnrxdu7QNwYB5NY3D47rW0thxTWqDuSBG7ia5sxUnJ+WfiHg1MzPg06K+Ohvf41nxnfvmdDudzTTIFYbNwfghtSjHGn6NhPmE2qXXEv+08rphqKKOrQh8Lhnpsz7PfnXT8B5OfRbWrLFfPgELTBVzJEheBa29DzsUEuH8lbqKjwr1nqymhM0UUIyiuVWMzzDRlf+W95QkowlPH1SpJEEAGDJkJMUd0vrNssTTHK+9MFNEcI6wWTRXP1T13svDSkmcbElRBvKDV4DFq5OozefHbcOlQYSgIfNDMAT4PwWwTrrvALRIB3m20awQ2qrMrkO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOxrtozkk2q9UUS5jDpxLGKnJjYCSo0gkfx5WJjRsYs=;
 b=B1Bsvm50owU/7Uy4DzouWjKkpr29d0+lhmaZPKb4QJyRkiG5ZKv0ApWH7oOYMTOoVRfkWP7vPVzcM/1GLwLDNRI54mI1Nw5yqj9902mL72TPKtersbatEn61/lwS1FT8D7NVUraGKfo1ddHCXhaqkRUgzI3Ta/ft9FK96wYRmRbp32WMaIYSq+AjKfVxfNwKJUudTmYfkCYJUo4ntwShCTH/gdsrybuYr5KJGqShNuYVMAVYFxSkupMJQ+ahnW+GxZhLz0kQLaCoCUsGI1bRo/SOr0dBWNVCPCZajyQb2BW8has2QUJyMXle5xnr8L+yJ2UT+ue/6F5TuhN5664E8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4522.namprd11.prod.outlook.com (2603:10b6:303:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 17:45:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 17:45:16 +0000
Date: Thu, 21 Nov 2024 09:45:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add a reason string to the devcoredump
Message-ID: <Zz9xz8zQoXcGIl8T@lstrano-desk.jf.intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-2-John.C.Harrison@Intel.com>
 <Zz6rNo0s6y5W0Hrp@lstrano-desk.jf.intel.com>
 <Zz7G9MKChzMefclb@lstrano-desk.jf.intel.com>
 <75c993a1-b8f9-4d85-adcd-f28b26109633@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <75c993a1-b8f9-4d85-adcd-f28b26109633@intel.com>
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4522:EE_
X-MS-Office365-Filtering-Correlation-Id: f6f5b887-050d-4173-eea9-08dd0a544213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ADRff/NpCA25U7necncEjDnsDx0AYIjBGMSKAZJIeTfk4ym+3ZygGQQM2+Jp?=
 =?us-ascii?Q?OggXxD0TmpFE4CaSgrckA6hYzJ/ZIW85eaa6EiBQDrKCPs9czokeeIuCoeYj?=
 =?us-ascii?Q?pluxrAauOMziFV9UvavMLKwWhG3xjjG18M+08qiz2noLTVQee1ZqYr6dY1mD?=
 =?us-ascii?Q?M3RP+GmE/KJVnRsyr5IRkING99E4woQROMqM9uFeIk+JtppiXlaB3O3N3Ekc?=
 =?us-ascii?Q?/kSICiVJRo0XafdmI+ahgivFpnnRqFARyv08F5NYDz5AhExSEU2LO6lRpqiA?=
 =?us-ascii?Q?acoCF2yVsPI0A3bQPJEnfAJoLdInhScK7wr0jNyFtkn6tUXXapfHZ9QOnTFg?=
 =?us-ascii?Q?289+VM+4UPPXOrjdhRopVn3K/ItKuk/A+maWsFuXBX/hEz5n72kyuklURDwq?=
 =?us-ascii?Q?1JhGURQkNgRoryB2VVtTpeck7DZoJTd9Y9EpH+tuXudw5JQTY8uiOljdJXXA?=
 =?us-ascii?Q?DcmB5efTxa9/mDP9dPCvCb2YsKnjF26hIekPahNYJ3OeYBh0y3fyb9bQntDo?=
 =?us-ascii?Q?TZrdT70aA9wayuPjWbStTzieedsQmvRwr8HOiFY720LuK7uwXCb58+/fUnvl?=
 =?us-ascii?Q?QuRcqzCnc4kVUUlua3x8X1l9KgfXlECbwVpm6jIJXb9LVqCljhhPiwCEG4Aa?=
 =?us-ascii?Q?aHWsslfGXiphcafqZ1kZZstT8dXFrh782G7jC4TNFaPzwAlmqH52QHGsSNGQ?=
 =?us-ascii?Q?tJd9Hd+HluCCUbotKT29AqK32roK7VQUaynN1JZ0s5ph5mX8DVyzEHc06Nxl?=
 =?us-ascii?Q?39uiRz4UfmS80lYoJkHa/y57AKe+chXkgP7wRz0rIqMcYTFMc5THD3HUT+zi?=
 =?us-ascii?Q?VS4oBXoeQ7IpQ6K8pFZZtflIGsBlEd3S8izFoFanenkYfIhhIVD3suyxrOHS?=
 =?us-ascii?Q?uhpYfao9Rd79p5Hrn8lgl7WCMOxGCrW8FNoO1eUKB0b22RhEP86V+O1t7bRs?=
 =?us-ascii?Q?nVbESs/SbKBL5zumGsGYAo5YpFuYmUDQ1W1CpMAaaFYKVVj4OlEHkVGGcGkq?=
 =?us-ascii?Q?VbUrqvShwZ/ndYLDyGTvQzQFnrncD/h4HUuP5NZITof2DwblIFh4G/YmuDNJ?=
 =?us-ascii?Q?qX9gHAkOpxdVxeVImkrEDZlGrWGnaTHGCrzNU3yV2UJbHTXAEZcmvtS+IxhX?=
 =?us-ascii?Q?nXSrys78Qt8kLlhoQGNawp4R9P463LCh2FpTnmvZR57QHY+uA/mGunUaRme8?=
 =?us-ascii?Q?KwPLYGlEYYr3DlMU1DZsTgZmr020ynbhz9c6JT+dq2CPgGf/Bc2iCuk2HfFw?=
 =?us-ascii?Q?vhyeX3ujEXbWwYyqDlMS1U3xQfQqeA4NAYi6uOa8h5LXCp4p83srCmPaysRT?=
 =?us-ascii?Q?VPsL6P74zydgJqDMZO5A05ZM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?28FiHgBZqlg06cJ2oTXOjuGHtz70aiRmuKMmIgY0oiubB/bcBJbMezeRjCES?=
 =?us-ascii?Q?Yc2g5XFxEaVZJlTbGi929E9bf4wIaS84wxEVn/dmewpfes31yKRnTYYqI2YS?=
 =?us-ascii?Q?nvKgiaHnHFO2jdiiApjb36Ow4IdzUeE8moRIaVmHPUgV/gs7tq2aLf59p9bD?=
 =?us-ascii?Q?LJZ8FDjepJvHJmvaGYOFvYpIQe/U1fbWp5Y7rgXUsY3SAT49T7KDJpvcy8Af?=
 =?us-ascii?Q?b7KFJox8IrFTfSTw7pCvMG+YLC/lz/oC84kQKs6BuDkL01wJJLU/kILJzm/c?=
 =?us-ascii?Q?j96/sUCessJ9Ud1FGcpGCJuuTUOpBSl3AlCGaYH7LwLUWqpjS06GP8UTPR90?=
 =?us-ascii?Q?KA7fid3pUFkxEQHac71EWjRyep78AXjiPvIKv4I3xg5WVFYLtQbhq+7pQpcE?=
 =?us-ascii?Q?hY4SfcIprAv5O8QzzfDx39HAXEp81KAWwvhs3PEXTXaWGDFfkQzf8vr0sqCu?=
 =?us-ascii?Q?NuvAJb328qvP5vKm1UdQODbZC28U1HC3TBekdvtvVOP+Fob4aeJ0FaILHF0/?=
 =?us-ascii?Q?gQdTWOzVbmCLbBCoMW+hje9tE3X8LwvA4NWcMEmZwQkQR862x41w/Z7Dl7mR?=
 =?us-ascii?Q?VwPRZUBgyPT6uH2spb/KzHmgnGbjBh03PSFGh4sPy28VhoYCRWlGkpGpsKV0?=
 =?us-ascii?Q?lqaJY/88YEvOEoxCEhpGO/NEhAcExsFIDzh7zzSjDl+499uC+GJKtB9G005H?=
 =?us-ascii?Q?Wne+bPirkMzCzHXFIaSXxBn6/qzzV3X7h8stKRbVCbBd3fFKMpCwcUleR2Bw?=
 =?us-ascii?Q?Kj0h2f0M++a1HFejVpad7I0gyFX1wa+KQA6crtW2nRs93yUOJaDxt/g6ozKc?=
 =?us-ascii?Q?h9tMcMfsUgKMcaW7BtYp/sauFJhWvx1LCsVJhwu2XshH57sbpKoLaAraYElW?=
 =?us-ascii?Q?OZa9oKlJwnmjMxkxlPRESsQwJpfhFrmKqqPbNzhsSADsVSAZgfSkTv66EQ3s?=
 =?us-ascii?Q?fcnUZ+M/SV+zQe91scJKqxIXiwR4fYLaPGQfP5Bra1zOJ/iNEwC4XDpG+BXt?=
 =?us-ascii?Q?S4dRkc/1nAdyedM7pa1NScckJLnRV6CiVDp9vIHTjYVcyAUQ8VCnHNFfpdCK?=
 =?us-ascii?Q?IEg0H5mbuxB15YZm+A4kYeK/UZji1guKZSpuntXZENuYYrZq7a8fViYydGHd?=
 =?us-ascii?Q?8cUFlM5Wl2bQO1un94vS70OI4MsloqqGQyVBngp57xD2Ii6954ioGqqzXGEq?=
 =?us-ascii?Q?V6ltXjExqHNgX4zEns9sXPMOgrYS70Hm1ff/wzuaiffUFHmQsUyFhXuMt/n3?=
 =?us-ascii?Q?4AMF2LiET+uBfCbwP0Ed4eaKB6DQXRhjuMaV+h8H6GrT33JRohU2Rbq4X+1C?=
 =?us-ascii?Q?biVHLfDnWyRH93vUf5PS+GWLWhAS7DK87r9e/qMxa45Pkx16WSC3fhvzy1bN?=
 =?us-ascii?Q?6qWnr/B29o6IBB1PJlcApyWFmLrNlYSTJuOf9liL83yurlcEgn+ubjqrymiq?=
 =?us-ascii?Q?Cn25RoP7ry+GfEUX/kRlaMVbhhV7F0Q3UAm6dNJ9b4zSXgHlHTk6azh5Bvlr?=
 =?us-ascii?Q?vAfuQTrN+iLYLjokfnOjFkJt5RnTd2+HxrBv+txHf2GZ/zltdgj11jNDxFp1?=
 =?us-ascii?Q?Uj3p5boApG6/01zYMahBq0axiKzRNwzng/JyYI1pv2aKhPXeQuYtqmbQ2X5T?=
 =?us-ascii?Q?qQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6f5b887-050d-4173-eea9-08dd0a544213
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 17:45:16.0898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kAdagkb7WQFXz+rpty4r1K2HcLQ659P7818gOR1mS2806MZ67ssJwaFnAPa2utF4uoDk2NJI5VLIft7q6cf0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4522
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

On Thu, Nov 21, 2024 at 08:44:37AM -0800, John Harrison wrote:
> On 11/20/2024 21:36, Matthew Brost wrote:
> > On Wed, Nov 20, 2024 at 07:38:30PM -0800, Matthew Brost wrote:
> > > On Wed, Nov 20, 2024 at 03:22:56PM -0800, John.C.Harrison@Intel.com wrote:
> > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > 
> > > > There are debug level prints giving more information about the cause
> > > > of the hang immediately before core dumps are created. However, not
> > > > everyone has debug level prints enabled or saves the dmesg log at all.
> > > > So include that information in the dump file itself. Also, at least
> > > > one of those prints included the pid as well as the process name. So
> > > > include that in the capture too.
> > > > 
> > > This looks helpful.
> > > 
> > > A couple of nits below.
> > > 
> > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 20 +++++++++++++++++---
> > > >   drivers/gpu/drm/xe/xe_devcoredump.h       |  5 +++--
> > > >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
> > > >   drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++++++----
> > > >   4 files changed, 34 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > index 0e5edf14a241..b5aebe8fb06d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > > @@ -99,6 +99,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > >   	p = drm_coredump_printer(&iter);
> > > >   	drm_puts(&p, "**** Xe Device Coredump ****\n");
> > > > +	drm_printf(&p, "Reason: %s\n", ss->reason);
> > > >   	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
> > > >   	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
> > > > @@ -106,7 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
> > > >   	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > >   	ts = ktime_to_timespec64(ss->boot_time);
> > > >   	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> > > > -	drm_printf(&p, "Process: %s\n", ss->process_name);
> > > > +	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
> > > >   	xe_device_snapshot_print(xe, &p);
> > > >   	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
> > > > @@ -138,6 +139,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> > > >   {
> > > >   	int i;
> > > > +	kvfree(ss->reason);
> > > Do we need kvalloc / kvfree here? Seems like this would be small in size.
> The type of free used is dependent upon the alloc itself. But I think this
> should actually be kfree after all, see below...
> 
> > > 
> > > > +	ss->reason = NULL;
> > > > +
> > > >   	xe_guc_log_snapshot_free(ss->guc.log);
> > > >   	ss->guc.log = NULL;
> > > > @@ -253,8 +257,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > >   	ss->snapshot_time = ktime_get_real();
> > > >   	ss->boot_time = ktime_get_boottime();
> > > > -	if (q->vm && q->vm->xef)
> > > > +	if (q->vm && q->vm->xef) {
> > > >   		process_name = q->vm->xef->process_name;
> > > > +		ss->pid = q->vm->xef->pid;
> > > > +	}
> > > > +
> > > >   	strscpy(ss->process_name, process_name);
> > > >   	ss->gt = q->gt;
> > > > @@ -297,10 +304,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > >    * gt_reset. It is skipped if we still have the core dump device available
> > > >    * with the information of the 'first' snapshot.
> > > >    */
> > > Seems like kernel doc should be updated.
> > > 
> > > > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > > +__printf(3, 4)
> > > > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
> > > >   {
> > > >   	struct xe_device *xe = gt_to_xe(q->gt);
> > > >   	struct xe_devcoredump *coredump = &xe->devcoredump;
> > > > +	va_list varg;
> > > >   	if (coredump->captured) {
> > > >   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > > > @@ -308,6 +317,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> > > >   	}
> > > >   	coredump->captured = true;
> > > > +
> > > > +	va_start(varg, fmt);
> > > > +	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);
> > > See above. Off the top my head idk if there is a non-kv* version of this
> > > function but if there is, maybe use that.
> > Ok, scratch this comment. I do see these functions defined:
> > 
> > __printf(2, 3) __malloc char *kasprintf(gfp_t gfp, const char *fmt, ...);
> > __printf(2, 0) __malloc char *kvasprintf(gfp_t gfp, const char *fmt, va_list args);
> > 
> > The former call doesn't work here as va_start is only safe to call once
> > in a call chain [1]. The former internally needs to call va_start again.
> > Unsure why this seemly equivalent functions have different signatures
> > but I think your usage here is correct.
> > 
> > Matt
> > 
> > [1] https://stackoverflow.com/questions/59608636/can-we-call-va-start-twice-without-calling-va-end-in-between
> Yeah, that was the conclusion I came to. But note that the v in the above is
> for va_list not for virtual. From looking at other bits of the kernel, it
> seems that even with kvasprintf, the correct free function is just kfree. I
> thought I had checked that earlier but evidently I managed to confuse myself
> again!
> 

Ok, confusing name and this all makes a bit more sense now. Yes, then
kfree is correct call then even though kvfree does work.

Matt

> > 
> > > Nits aside, LGTM:
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > > +	va_end(varg);
> > > > +
> > > >   	devcoredump_snapshot(coredump, q, job);
> > > >   	drm_info(&xe->drm, "Xe device coredump has been created\n");
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > > index c04a534e3384..6a17e6d60102 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> > > > @@ -14,11 +14,12 @@ struct xe_exec_queue;
> > > >   struct xe_sched_job;
> > > >   #ifdef CONFIG_DEV_COREDUMP
> > > > -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
> > > > +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
> > > >   int xe_devcoredump_init(struct xe_device *xe);
> > > >   #else
> > > >   static inline void xe_devcoredump(struct xe_exec_queue *q,
> > > > -				  struct xe_sched_job *job)
> > > > +				  struct xe_sched_job *job,
> > > > +				  const char *fmt, ...)
> > > >   {
> > > >   }
> > > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > index be4d59ea9ac8..e6234e887102 100644
> > > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > > @@ -28,6 +28,10 @@ struct xe_devcoredump_snapshot {
> > > >   	ktime_t boot_time;
> > > >   	/** @process_name: Name of process that triggered this gpu hang */
> > > >   	char process_name[TASK_COMM_LEN];
> > > > +	/** @pid: Process id of process that triggered this gpu hang */
> > > > +	pid_t pid;
> > > > +	/** @reason: The reason the coredump was triggered */
> > > > +	char *reason;
> > > >   	/** @gt: Affected GT, used by forcewake for delayed capture */
> > > >   	struct xe_gt *gt;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > index e132294fde51..7d0e7cb977ad 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -898,7 +898,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > >   		if (!ret) {
> > > >   			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
> > > >   				   q->guc->id);
> > > > -			xe_devcoredump(q, NULL);
> > > > +			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
> > > > +				       q->guc->id);
> > > >   			xe_sched_submission_start(sched);
> > > >   			xe_gt_reset_async(q->gt);
> > > >   			return;
> > > > @@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > > >   	}
> > > >   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> > > > -		xe_devcoredump(q, NULL);
> > > > +		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > > >   	xe_sched_submission_start(sched);
> > > >   }
> > > > @@ -1132,7 +1133,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >   				xe_gt_warn(guc_to_gt(guc),
> > > >   					   "Schedule disable failed to respond, guc_id=%d",
> > > >   					   q->guc->id);
> > > > -			xe_devcoredump(q, job);
> > > > +			xe_devcoredump(q, job,
> > > > +				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> > > > +				       q->guc->id, ret, xe_guc_read_stopped(guc));
> > > >   			set_exec_queue_extra_ref(q);
> > > >   			xe_exec_queue_get(q);	/* GT reset owns this */
> > > >   			set_exec_queue_banned(q);
> > > > @@ -1162,7 +1165,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > > >   	trace_xe_sched_job_timedout(job);
> > > >   	if (!exec_queue_killed(q))
> > > > -		xe_devcoredump(q, job);
> > > > +		xe_devcoredump(q, job,
> > > > +			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > > > +			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > > +			       q->guc->id, q->flags);
> > > >   	/*
> > > >   	 * Kernel jobs should never fail, nor should VM jobs if they do
> > > > -- 
> > > > 2.47.0
> > > > 
> 
