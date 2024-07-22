Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE93C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 08:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0D910E3F3;
	Mon, 22 Jul 2024 08:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUHP4uJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89CFD10E3F3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jul 2024 08:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721636251; x=1753172251;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UwzDCGJLWtNEKRByuy0PlK1GPsP+iPT5UcU/dLLcxmg=;
 b=PUHP4uJCF6ayNhGr3lczErDIJRuLfN3B8uK3Qg2mB/Yu9E422dU7AP2G
 y1VGp1TrIDM9Y9B7f/hA4tQiqbMB/JhYHQEdBmVUjTOzo9dV0Cm9ybuFz
 RtFNDt0PxLomuoWGyWWnLrZnR3vpI3kVa4KCA5fMlw+VUvnGHB9fVktjo
 KjxkrPAjfatahC6Qbb7Cmp9fcXUUNaMeiYNHb82rxEESBa8UHYW9Jr+rC
 M4Pk1UXK+reHewhSVT+l1Q9FAVXUq6WQ3Nx78kjQR1eeIhI5k/LO5zlXe
 msVsFwfvCqBhTm11WUvu2UJctfuGn3t7zIrbM4ThYxvsx+MgrcgcXC4cG w==;
X-CSE-ConnectionGUID: VM+iagFfSOqOwzTXCSdYYA==
X-CSE-MsgGUID: 0MpgzNlJRdKpqcbs+e+pGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="23000684"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="23000684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 01:17:30 -0700
X-CSE-ConnectionGUID: qELCz3T7QhCXAc9KF+hdew==
X-CSE-MsgGUID: IZxa8IzlSBGP2QT+qQ4k3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="51536090"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jul 2024 01:17:27 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 01:17:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 22 Jul 2024 01:17:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 22 Jul 2024 01:17:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 22 Jul 2024 01:17:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAhZINM/EbXCaj8q6ARps/mDupH4BxUM8AGhs1wlq3FplMS2BTKSAJAG47DngeVl4i8rS/QWrugI/X1DSSyf419RLn5A3voyvFkXC1deBJCFqqUomIKIGmkTKffBq+baOy+Epi5LgZN4JvTxCThD3waeD0DlCgS9Ecnbvd01F4ZrjWNeKV9TsrEiOqVKeX45ldFEa/jY6NcV2wTmQGR97wOwSQBgSZamz97Ca9BQ6qdzzLOtPN44g7rLctzSkN2P8z+OkArV8dllym6eHpN9LujgzzLnRjzyiKED++CslXQJsvy1hx6mCFE+1RG70pVZse+07RZg+/U5Kl7wUh9tBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUxMfbrjPGfinMS/tTGDKndQnfmhb7IgiCUSbSpPrZc=;
 b=Qn7qWy3l/ffX8Dv5w/oBCoS7BoNt8Y5RU5vx3dbWwrc0/FsZf1GeQCTwoSs6mtmF3NVrg/+O6txfPpRduQNP9KBXoHfgR5REBU/HGO/C7GRUWXAPTz8WZvvrBj1oMNtEv93bQ50L6udvlp8+q6qxyWEVCg2YLKNswFZMnXiCLjf/HI3zjBN0L9OhquZOih7pfKUSvzLniCGKn2GNr6viDCR4MUo55nT+DBHuscyZdznPgNCo8D/wJlVbi6KroBu3D2wbXenZZfohmilQcRB6IQGPBxMfHkR5fQV+h1rJmsvKHovP3OHg165RZivIGAiJIdMVndgS9hovHNr6KXfUBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM6PR11MB4547.namprd11.prod.outlook.com (2603:10b6:5:2a1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Mon, 22 Jul
 2024 08:17:10 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 08:17:10 +0000
Date: Mon, 22 Jul 2024 10:17:06 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v1 3/9] drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <Zp4VgvqF7AMrHs0Y@fdugast-desk>
References: <20240717130821.1073379-1-francois.dugast@intel.com>
 <20240717130821.1073379-4-francois.dugast@intel.com>
 <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zpgk+O81o0vki5Rb@DUT025-TGLU.fm.intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0169.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::24) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM6PR11MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: a0fbbe33-469d-46d6-c07f-08dcaa26af20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JRx6PIZWUH7qBBEB762qHDw5eETtsE+nWTShJeC1eCV6Qe0g+tGFWx+RbkB5?=
 =?us-ascii?Q?lSje0ul912C0yJJm2uCkn3Rxup9fg77FwI1boJIZTmQVO+OxecyRnXhjtbYV?=
 =?us-ascii?Q?xNxDNBOwpqOMXht73fpkFUbYZrM/ktJCJEXA1+HwRoSGIBxTXt+ZV9Mz7Ixi?=
 =?us-ascii?Q?V9kRFUW26rh+eUMXdiEoi/jtUJza5xYHRZ1lyRwpSiRhtksOATmw4N7dkIVq?=
 =?us-ascii?Q?zYeAOAaP7I8xtihQARWPAYKb3hKGnSRo/1XNpDXhF4ACBp2XMM2X3zvTErX6?=
 =?us-ascii?Q?d5h8OIEw6I1Vi0dx+6oNFHR3k9H3cNZy8s75eN0fpqmrVyiDOej2ydbOfIJ7?=
 =?us-ascii?Q?Q9D/vDFOJ0X+T0FDZWfMnvZmkfAo6/NsBewNxeizYSDODQlraOAQDu2KQx1c?=
 =?us-ascii?Q?jzWV2aF6DMTQf95mCRVx7awMwwVKa7dq/ZeQBiMq257iGHcabcjxUbwlJuHD?=
 =?us-ascii?Q?kejabuHZoGIuE4jHvs4CMvH9NO5At0V/sYCg7L3WjTjsIn2y6khTG1/UKQ40?=
 =?us-ascii?Q?APJjDhOpu1qrklyZWPyMs4PFcHFRxLBM9pGnl9T0vWYoX0KeN3w+K1pj9XdA?=
 =?us-ascii?Q?ZRDndmXHhc2PiQmJbfJyBZg9BewX8r8+kU4/H0yGH0/jkjZNsxa/0Qu27Wu+?=
 =?us-ascii?Q?NFm+FJsqapuldiEpWLIdZPxx/7s855INC7t/Chjo+gi//JlRNnYtmwp5JW2J?=
 =?us-ascii?Q?K6bpT/xK0QWPnQKSu8kLLfUdd7mXJls9TWw1LiuUhzPIM0nrTuo8jUbw/eMQ?=
 =?us-ascii?Q?oURne53HDfris/spd7WS6nZb+HA43kibctj+G5aYaVDfzmtikrtlB3eFlRt0?=
 =?us-ascii?Q?ilJvjsUQfo386Od/Hf9WXww61zdRA69nIiNhfTqEdv2WGpbeisxJJk+lwDav?=
 =?us-ascii?Q?+5xEET9yw6ChLcBwMA2g5Skkxir61AHi5Ws+GDYX5UfT1Z7vXiw6WIKCadNx?=
 =?us-ascii?Q?dmZrIbTH5pGEJhXxnWn8tVCXaW+/7P0jak5dGRgSi/6UdoIPlisxUu6ya4UR?=
 =?us-ascii?Q?OWXgMuLbZ77WZdIEAsx4PhYtbQoUkx629VCcAezcQ3JsSfMG+U5xvhcGi4L+?=
 =?us-ascii?Q?QqdnVSbiOZO967efoEFhbTEWYibIJ8Uwv03zh077LVE/8csrX+rBk1VgwPTt?=
 =?us-ascii?Q?XHRNDvHuW0ukmqH0pNSOG8bjv6zHk+DTcltoRDfmkysjM4jKZS20QyqIbzK8?=
 =?us-ascii?Q?r+QUgQuedgl4xXcm02rBhsiCxYQTwoJGdQrhjEk6ZMX4fSaLWOzZrteOIHRo?=
 =?us-ascii?Q?2z2Mfc3VYixLEPE8HZaze8u7NBq62Ufh4m0DMKcPOMRwNupNqdzaLP3fl2Is?=
 =?us-ascii?Q?yRs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOxDaMib0nVruNTn2ao/UlAYG9JgS0s6lNk4VrOTIoeTJ2igrP6UN+pjioWA?=
 =?us-ascii?Q?HKgEzabS7MaZFTe1Yg3W4fJS+TAiEvjGAMYS0um1tZ5JTT++y/0aSrjXsExX?=
 =?us-ascii?Q?SuyJwNI8423qMsloAN6+DCfR7+2uffQKKIK7o69QRHSPDAmB2Xc4cpuuPtF6?=
 =?us-ascii?Q?EIaF5Ha3XndPi/m3BcUekw8aqIGLOdlEri4aCSIboTLSz6RElhXKcWJqmOag?=
 =?us-ascii?Q?09EiyNURdbv70J/9RLI1qOrrrB3w3Gspp+NdRB2KRwrOAH8VNNFsSYH0jMx8?=
 =?us-ascii?Q?NgBTCYVvFe6swMUCKABg5sNUcs/p0DcJDZj3qxnbkucpxsbcEGSbX2qadqdu?=
 =?us-ascii?Q?YsnUT5NyyDo2hMDI7sDpOj2lH7wvXCbblDefmkABE4iCuz/FhTSk7F0dC6ZZ?=
 =?us-ascii?Q?GLycn0tNeittz6IcUNQpV5qxxd914MXAjFWfJjr8kc709qSK5az4UTaKvkl/?=
 =?us-ascii?Q?8ZM0/8ONVTwOldjeKPz0xvM05rndf6O8zslA8m0EI1dUXlCngktzysfhIRC5?=
 =?us-ascii?Q?ugVdQ7F8tj2LufuQpYDvB757DYC4YgzQ7KxmhgjzjNNmLwwuMOgezNxrGouZ?=
 =?us-ascii?Q?VVn+zueQZ72Gy3v9IM7OK8xowazlRFarEKPZQwTzfi+y4pdgRykNe9+mg1lC?=
 =?us-ascii?Q?QDn8ZQu7u+jL40kcXNb3ITjKKYj00h0rda2KBuCJ1fTDOKqnUzsXmrrT84sB?=
 =?us-ascii?Q?5b4bbey5w9a3viKto+CZZyTZ2Ypw25mqtPDcDp4rbZ/+F6tx9Oj0TK3Vbvu8?=
 =?us-ascii?Q?pqpFMtNeFJypUzeNwLoD56qD/CzhhCBZD0Jg0f5QyG9acoRgPzIl3IILAhjw?=
 =?us-ascii?Q?QHcxTUcSjg7XgNTPYzeta4/XRJMqW6vi6QAYKvCMEMgUoZUz33B9RBQyqAX0?=
 =?us-ascii?Q?uWL/0B/sToteFnQb72a1OiymljjfLvBwGs48NMdPFhNI/8BWa+/e9lAuIDUx?=
 =?us-ascii?Q?LHepYnBlBY2ydP753Dq+JtW7gJeyV3GSG8ZBie4NSQJ+P8CX07fj8ETF0q4K?=
 =?us-ascii?Q?tt/m5pbKXDK/RqJm68c/K6BDy1mXuHFJAwRLr09G+xb4eIB++k6GPEZpHUMs?=
 =?us-ascii?Q?HPW7jY3xxHeck1oz59PiH5fPNxkmLHGdngHa1k2jHvIzsaVRiGTDA29kCX9c?=
 =?us-ascii?Q?L10/qhwHwaA5dPhohn69SPKZENTyXTpejXQyP5FFnSGk6N1CnSy3bnvwv5p8?=
 =?us-ascii?Q?4eLASCRg14vfF3TMEGM4uCsUfowfIkOVTMDcvR0zr0LSOQDtry0KeckjVUG/?=
 =?us-ascii?Q?fzGB3xpPrJgwW9Agju7L4Pf0aBJLO5Ee/8a5wxISUQ+vC/lqzpTT+iDg6FTd?=
 =?us-ascii?Q?7jKjWTeU9bxc+o5czATlRsOja7lKyZlrRkIloYzAEG7Pi0sewbT8zRQoS09b?=
 =?us-ascii?Q?eSpH79AC92Zx8JB/5v2XDBkF3eBR8u97XRfKw9aCc6jHCC1hUcai7NTrMGaG?=
 =?us-ascii?Q?CkLkEhrZRclXH61O7fei56orWq8QhsVT3lw2j/4vuQzP6u7rcybNwtZ1Psy8?=
 =?us-ascii?Q?oDw4LN2YYfv4kQbew7qanYlVeeMPmzRryWeHP0Y26S7g6q+wuw3dopc8UlE3?=
 =?us-ascii?Q?llJcLFSNaxnfXyD4ea+rSXchHhQNiueBxYHfcmELQ1jon7+xFx/2lzxSM1ac?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0fbbe33-469d-46d6-c07f-08dcaa26af20
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 08:17:10.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VhNhnRbSRig8X6YtR/eHzhWoH2ia0sDj4G3GrrDiUkgrAw6r1UutxUQ/XqZZsQHLHYujoAF+6zlquEvvbiVyJFpvGxPO35I74b/xJnmLDZ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4547
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

On Wed, Jul 17, 2024 at 08:09:28PM +0000, Matthew Brost wrote:
> On Wed, Jul 17, 2024 at 03:07:24PM +0200, Francois Dugast wrote:
> > Add helpers to safely add and delete the exec queues attached to a hw
> > engine group, and make use them at the time of creation and destruction
> > of the exec queues. Keeping track of them is required to control the
> > execution mode of the hw engine group.
> > 
> 
> Missed a few more things...
> 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_exec_queue.c |  7 +++++
> >  drivers/gpu/drm/xe/xe_hw_engine.c  | 45 ++++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_hw_engine.h  |  4 +++
> >  3 files changed, 56 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> > index 0ba37835849b..645423a63434 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -192,6 +192,9 @@ void xe_exec_queue_destroy(struct kref *ref)
> >  			xe_exec_queue_put(eq);
> >  	}
> >  
> > +	if (q->vm)
> 
> I think this code path can be called GSC exec queues which don't have a
> q->hwe->hw_engine_group. So I think:
> 
> if (q->vm && q->hwe->hw_engine_group)
> 	xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> 
> > +		xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
> > +
> >  	q->ops->fini(q);
> >  }
> >  
> > @@ -640,6 +643,10 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
> >  			if (XE_IOCTL_DBG(xe, err))
> >  				goto put_exec_queue;
> >  		}
> > +
> > +		err = xe_hw_engine_group_add_exec_queue(q->hwe->hw_engine_group, q);
> 
> So this only called on non-VM bind exec queues. I think techincally this
> wrong as VM bind exec queues can use dma-fences plus the copy engine. I
> plan dropping the copy engine for these [1] and I don't think it worth
> fixing VM bind path with mode switching if we only are going to drop
> this requirement soon. Let me just respin [1] and hopefully we can
> prioritize though reviews so these two series land at roughly the same
> time. 
> 
> [1] https://patchwork.freedesktop.org/patch/582003/?series=125608&rev=5
> 
> > +		if (err)
> > +			goto put_exec_queue;
> >  	}
> >  
> >  	mutex_lock(&xef->exec_queue.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index f8df85d25617..4dcc885a55c8 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -1178,3 +1178,48 @@ u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe)
> >  {
> >  	return xe_mmio_read64_2x32(hwe->gt, RING_TIMESTAMP(hwe->mmio_base));
> >  }
> > +
> > +/**
> > + * xe_hw_engine_group_add_exec_queue() - Add an exec queue to a hw engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	    -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
> 
> Also assert here this is not a VM bind queue (e.g. EXEC_QUEUE_FLAG_VM is
> clear).
> 
> > +	err = down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> > +	list_add(&q->hw_engine_group_link, &group->exec_queue_list);
> 
> I don't see where INIT_LIST_HEAD is called on group->exec_queue_list. I
> think that should unconditionally be done in __xe_exec_queue_alloc.

A hw engine group's list of exec queue is initialized at the time the group
is setup. This is done in the first patch in the series:
 "drm/xe/hw_engine_group: Introduce xe_hw_engine_group"

Francois

> 
> Matt
> 
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_hw_engine_group_del_exec_queue() - Delete an exec queue from a hw engine group
> > + * @group: The hw engine group
> > + * @q: The exec_queue
> > + *
> > + * Return: 0 on success,
> > + *	    -EINTR if the lock could not be acquired
> > + */
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q)
> > +{
> > +	int err;
> > +
> > +	err = down_write_killable(&group->mode_sem);
> > +	if (err)
> > +		return err;
> > +
> > +	if (!list_empty(&group->exec_queue_list))
> > +		list_del(&q->hw_engine_group_link);
> > +	up_write(&group->mode_sem);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> > index 7f2d27c0ba1a..ce59d83a75ad 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> > @@ -9,6 +9,7 @@
> >  #include "xe_hw_engine_types.h"
> >  
> >  struct drm_printer;
> > +struct xe_exec_queue;
> >  
> >  #ifdef CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> >  #define XE_HW_ENGINE_JOB_TIMEOUT_MIN CONFIG_DRM_XE_JOB_TIMEOUT_MIN
> > @@ -70,4 +71,7 @@ static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
> >  const char *xe_hw_engine_class_to_str(enum xe_engine_class class);
> >  u64 xe_hw_engine_read_timestamp(struct xe_hw_engine *hwe);
> >  
> > +int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > +int xe_hw_engine_group_del_exec_queue(struct xe_hw_engine_group *group, struct xe_exec_queue *q);
> > +
> >  #endif
> > -- 
> > 2.43.0
> > 
