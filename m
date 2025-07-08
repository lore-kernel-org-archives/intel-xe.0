Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BDC83F09
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 04:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4410E09F;
	Tue,  8 Jul 2025 04:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CB1AVkQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12ABE10E09F
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Jul 2025 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751950705; x=1783486705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oEECGHoJgdbzf99gGzX2HFiGpizXCUW9o9zPAWoQl50=;
 b=CB1AVkQ5dDX+4x3T3sdvymjMiY8wqFmzwfvCzI7/G8IJVtOAUONnyZei
 bI6yA0Kh21TqJcLh6UV6K4TdTAZ8swD8CLWdZngv+34h7J3XrKl1ibFgq
 bd0VucWQxjhaOC2l4Yw0Qd92fZhv8wlTH4GVuwZLEp3I8Hl22TVexjtV4
 dnKA/NqEDqlbBitiwdJUuW/S0oZwvhoeDaW9pFeZgKPwnmY06AYk8He6A
 XVAcmv9gFcqwDUdEoyNbWW7A4seen6to+grzm8rriDdPKKMRmsARpQjdI
 FlHwCqfOcoiwycPG63kyv6+vlvFJ/qgalPkCdRTNWGGGTmEg61sgwZRJQ Q==;
X-CSE-ConnectionGUID: KPrPG2oqRbaqtMhFj3wj3Q==
X-CSE-MsgGUID: y5uNkFhKTfeyRY1s/529WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71760209"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="71760209"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 21:58:24 -0700
X-CSE-ConnectionGUID: Y9jrp5XXTzWSx17GPsjgWQ==
X-CSE-MsgGUID: FgjhDq/0QBW5uUUpV61xoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="155979418"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 21:58:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 21:58:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 21:58:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 21:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsiLtiiY2O5QE/OZAIP0UpAg2TwPgAMXE8jPTer+wqQS22UKa5KyBMnGNsTN15KhoROqQ/wMZBsmRHBtXLPyOoSLzx5xtLcgW3rB4u1lZzk+c0hGvRjta/4wVSXQHsSPFf1F+svSxDYmv2LQJBuM7IyAgvUOvPMCxsrzsMsQA97Hogkz83qc3qE2r0rO/2m7+19dle/k7qCIhNHC34bcEuuX7d+YWhFiuCvsFm47SXymMW/1EqSZq0QumZAQeiSnzUH73i27yLpWeMATd3HsnIT2ZFZe62q5nyflRPsBxO32xJVgQl8Owmkh6O3ZokJMPtX8FWNyCx5WubCrdNSJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfCewB5oQChrUSkYTVRi3zzB98m5ow17Z5puDh5kFDo=;
 b=uQlZXn5NHp/n2AssoxAXQ1Tu6sRsVNXapC59PhzOwPE8K8sssxJS2tXv+Z81yc4jNwTj8yWMs8yG1pViubqbYESeyrS7v2xQWj6W5zaLEpfrhhnZMitCZtG1FdG3IECeGYYcTKdH6HkIICA+ALLMuJnohoKw8USQMHTSf/WVOXlgtneUbx8/Z8XN2BB0bYdcuTmJJ2YuIYwAwSfWDRYj6FuY7nqC5TE8z2mazqRldXNjrzoSMUQzeiWRMK7Iag72B1AeAxgQuf4H/CfL4NNyNd1VUYUKu5EgumVziTWTdJ6rJR56PkfqDvA8gZ+Li98ZCHMB4FzZs9B5mx4Yo2gemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 8 Jul
 2025 04:58:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Tue, 8 Jul 2025
 04:58:13 +0000
Date: Mon, 7 Jul 2025 21:59:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 6/7] drm/xe/gt: Drop third submission for default context
Message-ID: <aGylzRvFQBqCF6be@lstrano-desk.jf.intel.com>
References: <20250703-lrc-refactors-v1-0-6aa22f174041@intel.com>
 <20250703-lrc-refactors-v1-6-6aa22f174041@intel.com>
 <32e154a8-4c01-47eb-8ac9-bbdb42a3eeb5@igalia.com>
 <nxvygecgyeh43k4pru36f4v3g2qcgweh7wsz5mhphiky435dwn@hc2hw4emmzav>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <nxvygecgyeh43k4pru36f4v3g2qcgweh7wsz5mhphiky435dwn@hc2hw4emmzav>
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: acab1543-296d-4966-74c2-08ddbddc0b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6wxc9/GLMvt+4eDTdCcNswkOQOVypZ4WQ69Y8pddj/77nsL/gP8sNo0Cn2kH?=
 =?us-ascii?Q?CYXHeDwJUdpyf+e+PUMH+97fyJcyqm2ti9vyZdRsbbSseWWR21ouJUcDhrfp?=
 =?us-ascii?Q?Tt5Fkq+DuHhytMIVLUFCHF4gLl1Fi6cpl2a63houn0htqn9pjYmk7iAnQEKu?=
 =?us-ascii?Q?H94jzzrCqCWO775Bmlxlr/FB1CdfJh0UQtBuAbAsO2l9EZRcCT4l2qiN54Uu?=
 =?us-ascii?Q?KbnJ9HvTVepLIATOwJRyuprWHWUhsWlj62hiRQF+Cs1IPxdf6Wk8mTpUrChn?=
 =?us-ascii?Q?IJUTRKBbL+FhndnKzXaGqVW6hojD0Y9o/W6NlqdKUhL8bHaqHPMIoMkab/5Z?=
 =?us-ascii?Q?yudKqSnBDQvmQJ9GUbVak8y/Xr9IDkn82NzCD34n3peC3RB2t2I4plhUSwVl?=
 =?us-ascii?Q?rjOgK1rFvpGC+WTDn7bUOZ43BRJ1roDfZ6YyMcibxjj54uO8W92yN71+1wwI?=
 =?us-ascii?Q?xwrX1W9yL3h0VyOVPEJD6eT1TDlVSWi0rm7yeKN0BPEDbctDlVyo+OEQx89w?=
 =?us-ascii?Q?PYH/qUXCawRN97RJI5WgCg8mcTAbxF9Ca7ONlPqodMObNrxGI4snqH/CnHJu?=
 =?us-ascii?Q?NRnMWmmdt2mU8UAJwdEOjyCN2zXzJ9RLLZWqP/jpBLSNQoxQdOSM7o2PqIXQ?=
 =?us-ascii?Q?fdZ6IFHZUv2QoCUWMGAO5DdsVyZziJqCOFoprcBXOHo2iVHb4prQ2ORJpJLP?=
 =?us-ascii?Q?+H1eGVGztbBSNPIMAOdiM6c/nxaSqSKIExv2ZDe7LmDRDLc2peXr63/Y/vHQ?=
 =?us-ascii?Q?lIxKP1EnLFpVHfbm+SrQhNMCzkeDYTDrSfwJhPxHC+ISAikSd/BolVsU0sr4?=
 =?us-ascii?Q?M7nZkYsqSY4Wp4f9S/8wy6cTgeVK72BtGuPFPvmsOSx9DrsGmPu2I6CvQIwq?=
 =?us-ascii?Q?+iZ/7Z3D/REo2LvQbudl+/fMhFkiOFzUwoe7VxeQT6VOqMszD/14UqO/E2ip?=
 =?us-ascii?Q?pnhsVYdJrX8elHBDhFHH3bek3DwmsEPuu+nNTn3EtDWzXv99dKNhVuBHnWx4?=
 =?us-ascii?Q?V3BLHoD8uKXI9j3OQdxQdsA8r/At0ZNfM0ycsQ2eSmaYxaWtqpp6YZvq56mt?=
 =?us-ascii?Q?cPK7vLn2/FG81LsITO/OfiVedI/wK2T8ArwCSH+wq7TdLB8jvIcSgXfT5qML?=
 =?us-ascii?Q?6FQpNCu8ye3rO1jWRrHk2jMv2cWySCFtWjVgZB4PT0GUu2Ll+diZoHZ8YPUZ?=
 =?us-ascii?Q?y+RbVpn0UDK73TStBNUj7XnztFOdwyjVEn2+iXS8Cj0wBZVLal3uWA/DBAfy?=
 =?us-ascii?Q?O/XRVRLlApbLCb46oCYesOhiK98lgwC+IuKfA83dPNBjFReWoktvBJnMQvpX?=
 =?us-ascii?Q?o1+142BBtLx0zzm7dFd1Hethuccu1y9BAJRTOw/8NNpEAXf7Cow2lKd9LLKj?=
 =?us-ascii?Q?R9/GXp4jRFbnE6/XiPW7NaFVUjC9P4qRllC+eCGaynn6JANN7Cwpp/rEpkFE?=
 =?us-ascii?Q?uq3cx7luvW4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kNp4mF6MFs2PjvBpNgUG/pYNVH9V5/qnPk8heW5cR8HcatZoPy/NSZtClP/r?=
 =?us-ascii?Q?EP4RvJsTv4cLlxAMrT4a2MTX8uo0c8zg06kWVn7s8usyZLnqa0BQdgKhN5QK?=
 =?us-ascii?Q?YZFSH7ZeFqid5kFxl6ahdU49eQTBBGQ2IpX0dx+S5woQVppl2hv9CG1I04ll?=
 =?us-ascii?Q?vCQ+IU3HInOiqlKW9Q58SXz8l2INF2Fyis+6lYn4nq9C9sYzLOlQGzU/CMC2?=
 =?us-ascii?Q?C+5rOwfU+Rw+QER4qJ0RY7c/24HbeexzxM61MhlNc83efAwI69I1HLCA2VAQ?=
 =?us-ascii?Q?HrUc+YFv40yRD/KO1a2UJV94QfLunzkKbpy5/N3MSXYxlp4qnM4MfjTilDWm?=
 =?us-ascii?Q?lJ7ht4iLqYgGecH01SPeiT/5lVWykcPlSsL7jWMF64f3n9Jpdl6kceqqg/Pn?=
 =?us-ascii?Q?d7gbm8kHnAmK+yhW6oaQJEPD92pWDB1+6d3tFB5VamnouJPR1GXP5eE80eVf?=
 =?us-ascii?Q?Q/zc+q2UuvOGmDKBT+Uy6ZSHBaQvVsZ6RnQEUyLM2ry0gVHYWYEqq+g7S7Ki?=
 =?us-ascii?Q?DtGBtrPdhYZOdYZDxuKk1t7zJc00HWwVLGUEcsspBN5vDmGrkFATt5fITbmt?=
 =?us-ascii?Q?cpCLB33mz9sJ72S9F0VTEEOMRMyp+EI24zS3C/ZgbTlYm9bvtJKl5bwDSOzh?=
 =?us-ascii?Q?jcSZ9T8kYveRIAkgDyws7kAsHMVfwwPulkBhNl4HLDqrGcn8y8/Xz5Zde+5f?=
 =?us-ascii?Q?A0vwWaHzbTUK6zARQ7iV9cwoJoG5RU/7IGyGse50DCGOIYd9Vivh94BBXADe?=
 =?us-ascii?Q?0Ik1oB7l5nnYf42aogxfs447y2TBAknX7RC3L6UCAvN8xc74SQ2sAepF+EbR?=
 =?us-ascii?Q?JtvW9IuPvCHWyeTmpg0uEnZbuFGRQogPFTaw9lWb7e7zzNBXNpwWZqcQRzvn?=
 =?us-ascii?Q?G6RhaJn/56820fCSR2Me0ve5V+fYMk1yVZNBLgTYRaNmqPvb9zU3i4/Pa4ea?=
 =?us-ascii?Q?0L8+4D8nYkifOu1I3GeQfQfL6DI+sEvOqVBl+bG5SCRZApOHxWPjOastbfHr?=
 =?us-ascii?Q?4Pxi7wcgtC4wBZ/LRTw7qQaPFAeLSFzyWIpSJ5G575YmudXsgQ7MYDexwCeq?=
 =?us-ascii?Q?VGIlK4ShgkLoBQI9f0YNxVfYYWtFUxamKFMfwSt81Lc+mqfZPipBt2wD6Xyw?=
 =?us-ascii?Q?3/HBYOBeKAj3R5K70ub6oAEFwb3dE4C9oRoYxTexNjFotw83NLV+qNognA2A?=
 =?us-ascii?Q?9Dl3s6H8aL6cxRDITWylgLKu+h0zo8nxmIEXoRHm8PvqCqRCjUr1ao5K+iZt?=
 =?us-ascii?Q?2CmVrgf3nl0FiuQDdGqr0UoSPoa4hSOhu9k7kM7UftO2o+V75jn7J3C5vxfq?=
 =?us-ascii?Q?so8L22Of+G2ZF9gtdBFbSPuCF3pXH8yCCoDoYUwF2Pmxqp9hEa4rWbrt7KPH?=
 =?us-ascii?Q?EPTVYx2kYW/tEF0H8Gj8KeZWo0NPCv2lojVFk9OszVJuBFl25roKI7TwAmge?=
 =?us-ascii?Q?N4eVxOf8+KLqFw/Lrnha3usFtVoHMTUwAobvn+2fj84S3NUZD9RmNvlFzJEV?=
 =?us-ascii?Q?I0H7J3LvJstURtQF6LbwgZRNsaEpFXrBJXduyrh7VDXhL9o1W5bEBHhYWiZP?=
 =?us-ascii?Q?gMGW3bujF+JteRj4Akd2izV73LjLu9cRxjZbEqwpkNIR5Np3GQdyDcXlsAT1?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: acab1543-296d-4966-74c2-08ddbddc0b57
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 04:58:13.9388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aN6i+XOa1/mmJgTR9V/1ok1ETq710pePMeAAjhKXNfhLW/16S2/z4dc9cZOLEiH41DRakVG2rlN9I4Em+l4QOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
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

On Mon, Jul 07, 2025 at 09:55:58PM -0500, Lucas De Marchi wrote:
> On Fri, Jul 04, 2025 at 12:21:50PM +0100, Tvrtko Ursulin wrote:
> > 
> > On 03/07/2025 23:41, Lucas De Marchi wrote:
> > > There's no need to submit the nop job again on the first queue. Any
> > > state needed is already saved when the first LRC is switched out. The
> > > comment is a little misleading regarding indirect W/A: first of all
> > > there's still no indirect W/A enabled and secondly, even after they are,
> > > there's no need to submit this job again for having their state
> > > propagated: the indirect W/A will actually run on every LRC switch.
> > > 
> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 8 --------
> > >  1 file changed, 8 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 67425e37c2187..439e7c703ed84 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -361,14 +361,6 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt)
> > >  			goto put_nop_q;
> > >  		}
> > > -		/* Reload golden LRC to record the effect of any indirect W/A */
> > > -		err = emit_nop_job(gt, q);
> > > -		if (err) {
> > > -			xe_gt_err(gt, "hwe %s: emit_nop_job failed (%pe) guc_id=%u\n",
> > > -				  hwe->name, ERR_PTR(err), q->guc->id);
> > > -			goto put_nop_q;
> > > -		}
> > > -
> > >  		xe_map_memcpy_from(xe, default_lrc,
> > >  				   &q->lrc[0]->bo->vmap,
> > >  				   xe_lrc_pphwsp_offset(q->lrc[0]),
> > > 
> > 
> > Wasn't it also racy to memcpy from q's LRC without guaranteeing context
> > save had completed? I don't think dma_fence_wait in emit_nop_job
> > guarantees it. If that is so this patch should actually have Fixes:
> > added and commit message adjusted accordingly.
> 
> I don't think it really fixes anything, it's just pointless to do it.
> It would just save the same information from the first time it executed
> even if there was a race.
> 

Agree with Lucas, this pointless yet harmless.

Matt

> Lucas De Marchi
> 
> > 
> > Regards,
> > 
> > Tvrtko
> > 
