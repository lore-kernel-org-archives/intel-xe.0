Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8098AC3ABA5
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 17:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2506110E1BF;
	Tue, 29 Apr 2025 17:09:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vmp3HMT1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D5510E450
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745946584; x=1777482584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QcTTDDHCmIFaZj1I8ewPgECgbXAYhVngc8P6bHZ0gYs=;
 b=Vmp3HMT1GL97OtDti7eWn6aVrpx/gsoFilKzwcdA3qrvtaLFNTXee1cS
 JycFFxLs+7nnMjhahR8wWRu7yVY32B6fDTP9udbyj5321zsk1v9mpwdti
 klv9hMEeu4nuVoe4G34gRzxY2ASp1e0sk/sCe8ymMUSf0xgBJG6g8nOd8
 5harzNUIXsa6FqCchpdC4sk9LlRJZCXCTDoZOAQ/ltAfpWsUWEY68rMGS
 01j4B77XpU8F3I55EtSojalnY38hQOP7X+PZwicAF4KZYzl+UXqCDpyOE
 ziAPrg7b17n43epbro0PFBj/frbiomdOwr1be6UnmAFmn4JVVRrUsvkL4 g==;
X-CSE-ConnectionGUID: XAWqsVEuTUG5lJA3gf22FQ==
X-CSE-MsgGUID: EyusODJvSzeAnmub5OwTIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47675775"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47675775"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:09:43 -0700
X-CSE-ConnectionGUID: rw3+KodrQ8qisUkRUjg6Kw==
X-CSE-MsgGUID: 8JgIMEDNRbOZJTq0Ik3qyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="134211013"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 10:09:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 10:09:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 10:09:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 10:09:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIqGUiPvgekDikmMG4LskpSysqbE7GZFidg63vcJJEY+JOHMzeCz5nYTohdmsaExrWhXBWafEWN73VpJRo0oaF0Fgz+oOFB+EOLTIlu8m/I9tHwYFgOe6qC/wrHvPWCvsVkaOGbIfVK93IM4MbHwFvlGKXX3aoLK+K0xcEMj6IwUWn5i3aaBjWFDR9dsIfkBLxr/1N08PPLHkK3F592lOaZBh1nQQ3XketsdWiXA/4F29KajsR5iX3eI+V8Qqr7Ic8corw9KC9Pv6/RDOgw6qV2HZfhPrs7RWu72AiWk7pQCtD8PP9V+pWxH1LANmxzj37DF4XCVM65QEo/UBgtchg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=njms6F4+n0C2zlhtKcGdjC8oXIGzdnvC3YoshQfdDkA=;
 b=uxUp9/aU0OU+bg3CGDOW/u3cMA3l0J4U2YygEB2p0Pyp8ufIPFtd/DcpTN8aXBdRX39QXMVt6JgoysJr6JUuR60UQazn3+rp6HJ879XLMdXy3ouoaXr8EuYryHY/UI9RH1+w6OZiF+5JTQtTa3or27tQct96yhEDlmga6Kvnq+RC8YvhfUxLnysv6Rm8YGtux/Rm39VRiRJ7QicLvTBFN5aukbm+qS0wXVy/fblMeiNA6gRU6DKKRCfBBOGGOvTMJ8+E+zApy6zz6jsap/ZwOk7cDGz1GIFCP6Mzf+z876/gzty6VVzN4bBMO66z4D3s3qEsSKqi2H6KO+5CUZzhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 17:08:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 17:08:57 +0000
Date: Tue, 29 Apr 2025 10:10:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: upon page fault, use generic uc fw
 instead of guc
Message-ID: <aBEH/I/UYAloO402@lstrano-desk.jf.intel.com>
References: <20250218112702.262780-1-dafna.hirschfeld@intel.com>
 <20250218112702.262780-2-dafna.hirschfeld@intel.com>
 <aA/tNSnOE2uWjNgI@lstrano-desk.jf.intel.com>
 <4mlwidurvhnl3pimzg4qlczo6raiyiq2kc6lgbhdhoup4qmz3l@3ajazrvqcs4i>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4mlwidurvhnl3pimzg4qlczo6raiyiq2kc6lgbhdhoup4qmz3l@3ajazrvqcs4i>
X-ClientProxiedBy: MW4PR04CA0332.namprd04.prod.outlook.com
 (2603:10b6:303:8a::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ff2bf51-152c-411f-2b82-08dd87408752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0JoeezFYHsSgSYtZQ7pQ6f/Xck6hWWnE1NxPmai8Wc8CEynvfdQQxeegdBml?=
 =?us-ascii?Q?JE+KpRXI+tRVQ1/R1uMwTkIEx8OopJSLYb/aEbvRaD6gevqGKBjB734F9HIh?=
 =?us-ascii?Q?f+VuIlQLdV08J03O2ZRqO8YjEv6ci2orul8oI3f/SaxI9v+KWDdz2xAst/vv?=
 =?us-ascii?Q?JIfQFVJiqjgSkodCRY7Xb5Rb0JYLszg/0wp1OWAKuuDeFRIeZppNa6f+bxAU?=
 =?us-ascii?Q?zGCsF2UaBZLk/Ep0rJ82UDp9bKcVum1VxGnrbV9t0sCXfr7/35wNPSMeKi/u?=
 =?us-ascii?Q?3xFRggleSlZfQKxEmhTci0rCkQ4xuVhMMFH9ScnwRDb4T2wNWaDyBZAl7cmS?=
 =?us-ascii?Q?SCCNM7XVdpt/CudtOzIP50eDvDh7eLQSsUn7kpl/7l1Wofy25NnhpjS3Gd3/?=
 =?us-ascii?Q?vAuOsEP/vA/9gowSqQz9S4yH37VPI/MRtVW/pxlpZDmXGcTDcjXHsbcf0zk+?=
 =?us-ascii?Q?QR9TPC5+Q6c0nYtnm6jYqJL9mElS3Uk+XmE1Bj5XwP7HKwuzBWW4P8oLSmSS?=
 =?us-ascii?Q?b5fZbvc6rugpyOjfzONI5UryF/4Ob7eBLMiJZTVoHUdJYE1TN2EdTCjBtdef?=
 =?us-ascii?Q?gVRPPUa/tHLzrpbuSPe6JlW2J5HhTRzIj9xGoYWkXceYbnBmoXw2WF8+SwSC?=
 =?us-ascii?Q?9aKty3whxFnkCgcBt2Kn1lQZRRX3AvTh21O4rFBWsjs3Jj6QpttFpLQ9VFfv?=
 =?us-ascii?Q?WCuLC1ygvTOpyZPUJ4FAGRjoE1QxhY4KnryV0SR4VgLFsc2+klfyLa+6fDxZ?=
 =?us-ascii?Q?12mBOKI0DDeNPG3CPFI2OhJ7sP3JpOyRxXQRsM4imrg8PnQh01Xpd3CAaeMj?=
 =?us-ascii?Q?4nSqRCcu6HsqaRIfV20I6+DVBcXwqHCpa1Wh2+qyVXvxx8UNjrEeg9d83XPn?=
 =?us-ascii?Q?c4X65lfHg6YM+r3J28FRsK7SwIW2rPqUYy3wmsapuChWlI7Gji2zSaia9tdo?=
 =?us-ascii?Q?McUZxW/wz2376ySXGf+li7tQZaqSgmLj2p7U3OiPHyL8FxtYt+OtIdZpvRYn?=
 =?us-ascii?Q?ltonpIW7v3oXlB27U49JAxVHvwyU9AX0coDMtAWIxfw4hv9koznSE7ltZB66?=
 =?us-ascii?Q?BzXxqpmQY9wwNPxE915t+pnIBcQzkYtLeWGNMeTLnUt8M6ZtmdRBVC+CyNh4?=
 =?us-ascii?Q?DWCZhV40AkP25lKWjIqd6ANuadRE30abvPKUVVUPD5bUUUJY1S7a24qMyCzB?=
 =?us-ascii?Q?sL5tPxOT/qmTokcZEnNHVtwg0GMUXcNzbpU19t56n/hednAp54AQzjWUTEzx?=
 =?us-ascii?Q?XkdcSkPdyVLEsvad4hr1SDpQFg82xC4IUaBHldpk7GcRN4J4mpOkNMWld4B2?=
 =?us-ascii?Q?9RuXAleEkhj3UMuMnJPm1SXKKKqfA/MrtnUorbPY+neS1pL/JP2Z5IoMKA32?=
 =?us-ascii?Q?1MySrba1qW1vvihL4UpKD5Ts2WJRZcWo2Z/dxCdQA3WlLXdfxdkDGqwi/+ih?=
 =?us-ascii?Q?0OhfqhHQlBU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?POvfGsQXysYQnSF0iIHCExGVbTaIH8JRdcV7PsJ1pIbcUhW0vNqHHOIcwt8q?=
 =?us-ascii?Q?lTvmoq3+MbYHGTthYnmxFdOPv/QPwSsJ/h3nr1oUKN2rxFt3ix3gRNutV8zO?=
 =?us-ascii?Q?ouEWNvRd0I0wrxCoed7tTzB/eykuxqSuS56HS7KmSXFTgpYiStbrX1YwIf2M?=
 =?us-ascii?Q?UeT1kaTErTxMLTZctIRhdwl+FjyzRyFtlmL3nd3IxonL6N9GSqW6S+tllvz9?=
 =?us-ascii?Q?8Fm4aw+mCHbPfd3/VG8rtIG/92Evwr16xxbnP85VBefw17jFOAipv3Wze+13?=
 =?us-ascii?Q?OBimQ56uFcX8+x2UOWuhmB6AhQ9n4AJkTs9JUiu4TcjtDXkHS6vF4rr8c37h?=
 =?us-ascii?Q?hdlqA8i9vBHfpQ08lBYhm3qBguYguenoGFVM8brBZpGs9onY0Ri4zl1SLcGf?=
 =?us-ascii?Q?Mi6/pRFwEObEbmB9iaP+FBCQ9WH3V6ZJCs0yYg0lrf/hnWDlvPxB09CEH16M?=
 =?us-ascii?Q?Zkn++tPMIQ5PSctL5n7pwfg0EKIg3er6IfxyuwMhfIoiGEinNhcwXKuON9ZV?=
 =?us-ascii?Q?W0vmRNmvHxV1Lr8polrVagGoFPuasRWuAaYr6qMeD1roG/dGIL2twBbc2ODZ?=
 =?us-ascii?Q?LeSj1sHcL9DE6ZsHgcN38kijXMATP+Cpve1LTJMiBGBrvjlBdaFBNTbiKv76?=
 =?us-ascii?Q?DkFB7KSv/MilBevDMBQEmcXzv2m+1DpfW70RqmywdbSnxYE0TCSR8QohM8Y3?=
 =?us-ascii?Q?ra/UzjF+MCj9oHWh6ijaTrtSESMpeJoDuFLFJnisIBs5qUW0YcVcxBbftL5L?=
 =?us-ascii?Q?gFBDkTcPquVocct1qRUGHk2OVz9WI4TTNwevRr9Cr+LD0mCtnQ+vmnWN76EC?=
 =?us-ascii?Q?EtUmA+E0Z6tDu44w9dUBA30SwYFADjOFjdtrle3UDmqdH4C3A8Ni81NoPBCX?=
 =?us-ascii?Q?xVJ4LOgxtJDcBEf/0NN7l1Bw5zA4U+Cxz/T28NQ3mhiroj2afwVkpb9piqXd?=
 =?us-ascii?Q?pag0jBtnz+MJ8cKhZxekQ2aPiWmEij+El+2sC4W7LcV6g+k1I5COON9L9h73?=
 =?us-ascii?Q?tkMLRGlkJ17H8drXGDEYStUe6ucFboDHuLwLWXytPY5r1n38IQroelVFetwo?=
 =?us-ascii?Q?6h/c8p2FRcD1FRhp2sk1/2t60HcRYVu0vq6y5tYi125dscTy1SgEhkvs3bka?=
 =?us-ascii?Q?0BDCGhKRPaC29SEchidLwZZjo8iMpy5MwKity0jgepQPK5fmzcdLC3aRHJJ0?=
 =?us-ascii?Q?+mOyUUm87Lf72HIyB0g0QA+V6f7AnGw5/wpHabyojwuOkNYX2+VrZfO3Vz6e?=
 =?us-ascii?Q?Trv9rb8N1waGR6sDwS/hSqB8JiMKklmNWICGaZ4bACB9crQecEvvOQ1OewK0?=
 =?us-ascii?Q?vb/cxWUbjayNOsn0Jou6N6M/oKlqJGYLI+Mq7eWnSg1v8oib2VjlmoFhlxRd?=
 =?us-ascii?Q?a9NiXcB0naFiwII5Kl1ZNuHGe2VfwSXGLd3UtKVjQRXIY6J0dDZILCJGoJSw?=
 =?us-ascii?Q?61V+xxwIX7wzPiGnWVFRXX9mq9IfvOKaG0mX5+kD1/TkwhUrLwDCLC+D02Nj?=
 =?us-ascii?Q?yEYE0DWuz613WM0RIrRCfmJhON/9mBpr6N2tZKcXYlq6gJC/RbkYuPmnjWmk?=
 =?us-ascii?Q?dg6CCZYO7c+98zVgHBx8wQwiuWx10WVG4QZo3whq9+Lijhd64yovWmDgQzgl?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ff2bf51-152c-411f-2b82-08dd87408752
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 17:08:57.6128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FLnJfxriqTnDg6ZBUtmCup6IaP4VxMpQzSP6j2ceFN+k6fRwHsvM85r90HDxQR5Mf5H4B/DWOxtfg+PVNDr9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
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

On Tue, Apr 29, 2025 at 03:49:36PM +0300, Dafna Hirschfeld wrote:
> On 28.04.2025 14:03, Matthew Brost wrote:
> > On Tue, Feb 18, 2025 at 01:27:02PM +0200, Dafna Hirschfeld wrote:
> > > Future asic will have different firmware to handle page faults.
> > > Change the code in xe_gt_pagefault.c to use xe_uc_fw instead of
> > > xe_guc and add a callback to struct xe_uc_fw to send the page
> > > fault replay to the fw.
> > > 
> > 
> > I think this is on the right track - the current code is clearly layered
> > incorrectly.
> > 
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 24 ++++--------------------
> > >  drivers/gpu/drm/xe/xe_gt_pagefault.h |  6 +++---
> > >  drivers/gpu/drm/xe/xe_gt_types.h     |  2 ++
> > >  drivers/gpu/drm/xe/xe_guc.c          | 15 +++++++++++++++
> > >  drivers/gpu/drm/xe/xe_guc_ct.c       |  8 ++++----
> > >  drivers/gpu/drm/xe/xe_uc_fw_types.h  |  5 +++++
> > >  6 files changed, 33 insertions(+), 27 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > index 51c4bcc769d2..c1e076e14219 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > @@ -11,13 +11,10 @@
> > >  #include <drm/drm_exec.h>
> > >  #include <drm/drm_managed.h>
> > > 
> > > -#include "abi/guc_actions_abi.h"
> > >  #include "xe_bo.h"
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_stats.h"
> > >  #include "xe_gt_tlb_invalidation.h"
> > > -#include "xe_guc.h"
> > > -#include "xe_guc_ct.h"
> > 
> > Yes, removing all GuC specific code in xe_gt_pagefaul.c is a good idea.
> > 
> > >  #include "xe_migrate.h"
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_vm.h"
> > > @@ -246,18 +243,6 @@ static int handle_pagefault(struct xe_gt *gt, struct pagefault *pf)
> > >  	return err;
> > >  }
> > > 
> > > -static int send_pagefault_reply(struct xe_guc *guc,
> > > -				struct xe_uc_pagefault_reply *reply)
> > > -{
> > > -	u32 action[] = {
> > > -		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > > -		reply->dw0,
> > > -		reply->dw1,
> > > -	};
> > > -
> > > -	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > -}
> > > -
> > >  static void print_pagefault(struct xe_device *xe, struct pagefault *pf)
> > >  {
> > >  	drm_dbg(&xe->drm, "\n\tASID: %d\n"
> > > @@ -322,9 +307,8 @@ static bool pf_queue_full(struct pf_queue *pf_queue)
> > >  		PF_MSG_LEN_DW;
> > >  }
> > > 
> > > -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
> > 
> > s/xe_pagefault_handler/xe_gt_pagefault_handler/
> > 
> > I think this needs a interface refactor.
> > 
> > This is still assuming the 'msg' field will be the same format across
> > firmwares which I don't think is a assumption we can safely make.
> > 
> > >  {
> > > -	struct xe_gt *gt = guc_to_gt(guc);
> > >  	struct xe_device *xe = gt_to_xe(gt);
> > >  	struct pf_queue *pf_queue;
> > >  	unsigned long flags;
> > > @@ -336,6 +320,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > 
> > >  	asid = FIELD_GET(PFD_ASID, msg[1]);
> > >  	pf_queue = gt->usm.pf_queue + (asid % NUM_PF_QUEUE);
> > > +	pf_queue->fw = fw;
> > > 
> > 
> > This doesn't work as if you have multiple FWs queuing up page faults
> > this could be pointing to the wrong firmware by the time the fault is
> > processed.
> 
> right, but this will work if setting the FW is inside the condition 'if (!full)' right?
> 
> > 
> > >  	/*
> > >  	 * The below logic doesn't work unless PF_QUEUE_NUM_DW % PF_MSG_LEN_DW == 0
> > > @@ -390,7 +375,7 @@ static void pf_queue_work_func(struct work_struct *w)
> > >  			FIELD_PREP(PFR_ENG_CLASS, pf.engine_class) |
> > >  			FIELD_PREP(PFR_PDATA, pf.pdata);
> > > 
> > > -		send_pagefault_reply(&gt->uc.guc, &reply);
> > 
> > I also don't think it is the job GT page fault layer to encode the
> > response to the firmware as that could be different between firmwares
> > too.
> > 
> > So roughly I think we something along these lines...
> > 
> > - The firmwares parse the fields which GT page fault handler needs to
> >  understand (page_addr, asid, access_type) and passing these in as
> >  arguments to xe_gt_pagefault_handler
> > - The original FW message is also passed in, we define max length for
> >  this, this is just opaque data to GT page fault layer
> > - The firmware passes in vfunc for send_pagefault_reply, this accepts
> >  original FW message + pass / fail value so the firmware can encode the
> >  reply
> 
> Why pass a vfunc instead of the FW itself like I did in this patch?
> If we pass a vfunc, then it should also accept a pointer to the FW right?
> 

A FW could work too. Only issue I see with that is we have been
discussing the possibility of a different driver forwarding page faults
to Xe to handle (very early, no idea if this will happen) but if it
didn't that driver wouldn't be using xe_uc_fw struct. Using a xe_uc_fw
is likely fine as it would be small refactor if we need to build in this
cross-driver functionality.

Matt

> Thanks,
> Dafna
> 
> 
> > - All the above is stored in a pf_queue entry
> > - Internally in GT page fault layer we drop looking at firmware specifc
> >  'struct pagefault' rather the new format which encodes page_addr,
> >  asid, access_type, the reply vfunc, and opaque firmware data.
> > 
> > This will be more data in the pf_queue but it makes the GT page fault
> > layer truly opaque to any firmware interfaces.
> > 
> > Does this make sense?
> > 
> > Matt
> > 
> > > +		pf_queue->fw->send_pagefault_reply(gt, pf_queue->fw, &reply);
> > > 
> > >  		if (time_after(jiffies, threshold) &&
> > >  		    pf_queue->tail != pf_queue->head) {
> > > @@ -664,9 +649,8 @@ static bool acc_queue_full(struct acc_queue *acc_queue)
> > >  		ACC_MSG_LEN_DW;
> > >  }
> > > 
> > > -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > > +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len)
> > >  {
> > > -	struct xe_gt *gt = guc_to_gt(guc);
> > >  	struct acc_queue *acc_queue;
> > >  	u32 asid;
> > >  	bool full;
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.h b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > index 839c065a5e4c..0c01af3b7124 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.h
> > > @@ -9,11 +9,11 @@
> > >  #include <linux/types.h>
> > > 
> > >  struct xe_gt;
> > > -struct xe_guc;
> > > +struct xe_uc_fw;
> > > 
> > >  int xe_gt_pagefault_init(struct xe_gt *gt);
> > >  void xe_gt_pagefault_reset(struct xe_gt *gt);
> > > -int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > -int xe_guc_access_counter_notify_handler(struct xe_guc *guc, u32 *msg, u32 len);
> > > +int xe_pagefault_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
> > > +int xe_access_counter_notify_handler(struct xe_gt *gt, struct xe_uc_fw *fw, u32 *msg, u32 len);
> > > 
> > >  #endif	/* _XE_GT_PAGEFAULT_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index 6e66bf0e8b3f..73f7bd044828 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -249,6 +249,8 @@ struct xe_gt {
> > >  		struct pf_queue {
> > >  			/** @usm.pf_queue.gt: back pointer to GT */
> > >  			struct xe_gt *gt;
> > > +			/** @usm.pf_queue.fw the fw that handles the pf */
> > > +			struct xe_uc_fw *fw;
> > >  			/** @usm.pf_queue.data: data in the page fault queue */
> > >  			u32 *data;
> > >  			/**
> > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > index 1619c0a52db9..1ea3678f1463 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > @@ -5,6 +5,7 @@
> > > 
> > >  #include "xe_guc.h"
> > > 
> > > +#include "xe_uc_fw_types.h"
> > >  #include <drm/drm_managed.h>
> > > 
> > >  #include <generated/xe_wa_oob.h>
> > > @@ -642,6 +643,19 @@ static int vf_guc_init(struct xe_guc *guc)
> > >  	return 0;
> > >  }
> > > 
> > > +static int send_pagefault_reply(struct xe_gt *gt, struct xe_uc_fw *fw,
> > > +				struct xe_uc_pagefault_reply *reply)
> > > +{
> > > +	struct xe_guc *guc = container_of(fw, struct xe_guc, fw);
> > > +	u32 action[] = {
> > > +		XE_GUC_ACTION_PAGE_FAULT_RES_DESC,
> > > +		reply->dw0,
> > > +		reply->dw1,
> > > +	};
> > > +
> > > +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
> > > +}
> > > +
> > >  int xe_guc_init(struct xe_guc *guc)
> > >  {
> > >  	struct xe_device *xe = guc_to_xe(guc);
> > > @@ -652,6 +666,7 @@ int xe_guc_init(struct xe_guc *guc)
> > >  	ret = xe_uc_fw_init(&guc->fw);
> > >  	if (ret)
> > >  		goto out;
> > > +	guc->fw.send_pagefault_reply = &send_pagefault_reply;
> > > 
> > >  	if (!xe_uc_fw_is_enabled(&guc->fw))
> > >  		return 0;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > index 72ad576fc18e..14ff5f255d45 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > @@ -1293,15 +1293,15 @@ static int process_g2h_msg(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > >  								 adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > > -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > > +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > >  		ret = xe_guc_tlb_invalidation_done_handler(guc, payload,
> > >  							   adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY:
> > > -		ret = xe_guc_access_counter_notify_handler(guc, payload,
> > > -							   adj_len);
> > > +		ret = xe_access_counter_notify_handler(gt, &guc->fw, payload,
> > > +						       adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> > >  		ret = xe_guc_relay_process_guc2pf(&guc->relay, hxg, hxg_len);
> > > @@ -1494,7 +1494,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct, u32 *msg, u32 len)
> > > 
> > >  	switch (action) {
> > >  	case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> > > -		ret = xe_guc_pagefault_handler(guc, payload, adj_len);
> > > +		ret = xe_pagefault_handler(gt, &guc->fw, payload, adj_len);
> > >  		break;
> > >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > >  		__g2h_release_space(ct, len);
> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw_types.h b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > index d8714ccb3f78..4d82430e3274 100644
> > > --- a/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw_types.h
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/types.h>
> > > 
> > >  struct xe_bo;
> > > +struct xe_gt;
> > > 
> > >  /*
> > >   * +------------+---------------------------------------------------+
> > > @@ -228,6 +229,10 @@ struct xe_uc_fw {
> > > 
> > >  	/** @private_data_size: size of private data found in uC css header */
> > >  	u32 private_data_size;
> > > +
> > > +	/** a callback to send the page fault replay to the fw */
> > > +	int (*send_pagefault_reply)(struct xe_gt *gt, struct xe_uc_fw *xe_fw,
> > > +				    struct xe_uc_pagefault_reply *reply);
> > >  };
> > > 
> > >  #endif
> > > --
> > > 2.34.1
> > > 
