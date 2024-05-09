Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC91CC10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 19:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D7D810EFD6;
	Thu,  9 May 2024 19:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2/U/r3i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79E810EFD6
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715283718; x=1746819718;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WZ6uvwc+hxbVlgiIIBh1pKDGIxaWJ/fwYzjdV/d4CP0=;
 b=U2/U/r3iibeqVt47Srz8RptAG+sJU170V1lAAcjeKKIdYuhHW/CQYw7K
 6RHTXQoVjdcoW0wWUorDHnubNyWCoBYt1a5I3UZep1QRZsoAYzhdZQjWB
 uOUv9G/nFLWo0wfYMVDyERd1cYnHB/UEIF8KmO/6YIpW8YgyJxCTOYjzH
 fWCFMS8llJiYo9qQV7Qf8Hew664H64rYWaxQxRtJo82UrqvgDoI5plH8e
 r+HU8+j4GlACh41erblufZ+9cCzobAhdsET0ExqcfK7XFrDNJZGADw0OO
 4UeIXy+QOcqrmr00zdSSZlILBfnGEt+LH81WlgC7K8zdyoNh3NlyaMquh w==;
X-CSE-ConnectionGUID: 7ot2PZT6R/C5PdTY9hFIMA==
X-CSE-MsgGUID: sCvCsFzOQWSpehjeD6DDdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22630184"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="22630184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 12:41:57 -0700
X-CSE-ConnectionGUID: Ya7dJsOcTGmzuQ4mkW8kVA==
X-CSE-MsgGUID: eAMZ0glIT763OI6pGHHGzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; d="scan'208";a="66799356"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 12:41:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 12:41:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 12:41:56 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 12:41:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0OkZa/QEJaRYn5lWp1wcjCgIPptOnf6wS6saRalMd9SaScHJYrbWzRdfnRruuwFTpBzqmYlf4950lXbP5N3pk2fEsBDZccieJWtRK+ygyJRtPdaYcrnOZaL1Yo4ObXASzPvVJCgFHEuYPqLaMY+pLzx4tYCdQrrGEnFW8kNZT5h/FYSVy5qLCDsAmGrxKMeubH86v3VbITMq26H4VafxAgspJe+mywy4XUXrf90v2fgh4SrTcaEeWYt/98pKAGCQQ0G3H3A43frg2bIKk7q9Scsthzi7pZeEoHidq6vqK3snudm7wN6hdCby1A/MEULtBk0BzIe+t2jsCPjfNMdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3Nibu1H3KJZ49RoxZ0S5K3LV/i7+RtY3nfpqnFah68=;
 b=XksxHTEc+M7b8NPQ2qzITK0duj7GTrHgI5a/dK0AABPyEpuo1UhuABHW4npSaL5QTB6rIL9A3Off2b0Vjp/XtzW6zXJr+6zfcvLnD6eZxclaoumDHYoU7LySVX/AKmQvhse5VB5kgukK8aSAb9vIoJdwzlonNbG2ca/2LfRH+jZ+bU+r1NJSSN/yoFgiFROjoxKEtSWc7YWNHrOB7uckOlhhzeaQpYo683jMNtFLWFWFV6TVu6kqV2oM8SogGRMAliP77y/gFUKoRMDaZBApZx/8HsKoDP9ejpLYpOAiXt5k/cs5mtLbj+byqhM07jG+jCnewHGf4hlAzp0Owvm4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Thu, 9 May
 2024 19:41:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 19:41:51 +0000
Date: Thu, 9 May 2024 15:41:45 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: Re: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Message-ID: <Zj0m-VmIS4z0xzkJ@intel.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-5-rodrigo.vivi@intel.com>
 <CY5PR11MB621196A10CC9B803883CFE5095E62@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CY5PR11MB621196A10CC9B803883CFE5095E62@CY5PR11MB6211.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9958d1-b6e6-4c29-7574-08dc70601278
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1n04USs7pQzlqs5nesGFdKiQ44PEmxaEHpF++hCPp7ZtXRoTy4z2pqEzEG?=
 =?iso-8859-1?Q?zXsXJtRigda6/0gvyKp3pJ2LmI0veX+v2Bv5+txarCuFuftIrJYRvm1sXp?=
 =?iso-8859-1?Q?evne+p5/aac4bYYZ5+m3N5cpPD05k9rHudRVxCOhl+iErfJvfzxNuq+Ork?=
 =?iso-8859-1?Q?7SWNlThS1BG9qg7GpR6EIAYpRSCgF5yVB1PeN0AmCjzPnsgJRS9puR/RHw?=
 =?iso-8859-1?Q?wuOYgeMEQTvt77IK4BAiZxx0BVBOKStNRuBYPXu7dHCQwX2BOY+0kiy7pf?=
 =?iso-8859-1?Q?nL1u8ISyhQTtQTMWA4VzX37gzJRPxir5L0kRZXH3arHMM5Ya+8P3Jfsm7V?=
 =?iso-8859-1?Q?AMOjlweFKs/acfg3VvDqfP7UND6KSFzzYnluMIzsykARMtBFLBWgl9yNln?=
 =?iso-8859-1?Q?2zHQiyNvUZz5GASMPEPMEUeaCPZ2OsjDwBVVCn4LIY7KctMDtZL37f0XDg?=
 =?iso-8859-1?Q?f12NT3eAkpRZGFL1kkDG7lykfsoW104v2ZKHotflPMaL3TnNRHEFpmtmJG?=
 =?iso-8859-1?Q?OXOWK/v7ZmbljpuNrGdp6km7+ToS4nT+6l4qi2s+Ardf2lfAxtOhdcmEVc?=
 =?iso-8859-1?Q?TCalB8ODReqheHIV4fPf5jaPWJKDbRq2IsuD8uDqJK/gWd/xs1UVzu96Qi?=
 =?iso-8859-1?Q?MF3hgEPP69eaIu1GTHYVlAbRe5zh6lHrxva3OcI5psIq7CnQKDsFGIeRaX?=
 =?iso-8859-1?Q?8fpBO8/DsN8kI6vdPnrY1E5iOAgGePGOUU3bRQnuz4q7TOQtj/cvTl/j0W?=
 =?iso-8859-1?Q?hrwfS28+0ZzycMdyRtizbQZB4OJDbEHrdg9mKGRFCzXzyGk6khH3sbzG2O?=
 =?iso-8859-1?Q?ntDAbBnWzHvuT4nucFhRntqc9/GJFTbrihx6onFP7viPIASFfUv7N4YR6w?=
 =?iso-8859-1?Q?lbASsUl/eQuVb054whU62ZhrbEphaK+x+k5k+Qa1txsrxTpYqq27fTTlf0?=
 =?iso-8859-1?Q?Te8yPnizDtAL9y8pr/tjeF3VTQsqUSt/Ws4W3zP/aUjZAbGIjhibRxqA1U?=
 =?iso-8859-1?Q?kTO2oQtorrLAL2WTsQN0Bbuna6DkWxvgDLpjL5zLQbFZ/t/Sq9N4A51OqE?=
 =?iso-8859-1?Q?RhhR3we8FDHZJpaEQBLjBdP3Z2hx0Ah9ZU9AQxdXrI7sAf8VKAayxWFNdf?=
 =?iso-8859-1?Q?Dtl3AGc5YV6bNryrWweOlyxYXxOyLT794NrRj9SLNmTZNzKG/TSb/3Zget?=
 =?iso-8859-1?Q?OLO5fBL6U4ndr2YPY0oa0uYBWqmADFfc4/lQTPyBaA7q0RueqghQP4jca5?=
 =?iso-8859-1?Q?JO8RNW5arZY9Y4USW5LAP3LVRYZ3W/AN6Q8y1jQ5g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?kvJ8+5zB906i35/rOX6jmAEONmZ+qXZTmsvv3jYUSJu9puf7qVNnsjvkch?=
 =?iso-8859-1?Q?GGBFariuPC+Eqc+mqCVs+PCUutClQh4+97tA/K89Kcpr7OBBJwlKbX9G5m?=
 =?iso-8859-1?Q?QG87vgoK6Zx6dz+qvA1meZVxHC6/ee7S5D4VshCkd2qtP2wmzk2ls1ioYo?=
 =?iso-8859-1?Q?d83d/JSKBlEARDyUs7B2Myo08eOyBwAO0FYm49pP0R35yfyn89D1iVoACJ?=
 =?iso-8859-1?Q?8S0xLFo3auayBOjQcmP+whsAzzAjxAeeZJqxHRDvXMlZkYJ41fCnVJHo8v?=
 =?iso-8859-1?Q?eKWfuiTXsYzDlZQZYXBWudniUCVzpXiEjh75h7YRITdYbvCic2TH3gNi2o?=
 =?iso-8859-1?Q?98s2MsuLgQMRNOZ3wkSz08pqTvCA/DlwJIEkyWqW0Macwgd4bT0Mnhrmu3?=
 =?iso-8859-1?Q?h1xl+l7fmkiOPFLyNDmZw5oZ0BGhbcMCNof9mkkAijlKt6OBPBmQkOPfw3?=
 =?iso-8859-1?Q?NACvsvYSpwgRPCNLiKbc5m9odrWz415D26sCpMYjtlrfk5vDPvRJVcuI5H?=
 =?iso-8859-1?Q?RGkI3Y+p0lDfEBTQXLceZAYBusooLTHqykEyeXf2oIrj9z3jx9Tc9HA+g8?=
 =?iso-8859-1?Q?9074qjoHgbpN7IAxzRbQyJMpUZgbSKQYXWCoz3p1aSA8zbiCpl2bfoInVz?=
 =?iso-8859-1?Q?QMpHOgkOt1pzjqr83MV0vjZY8DTw15uupgLoAIu5u0YezygbXcmzSOky56?=
 =?iso-8859-1?Q?5Kr6dGXI1ySWlggN2BxKUqbuITERBWtRfCwVmFRKzxBuDHlVQRaXXl+JYp?=
 =?iso-8859-1?Q?jwEkewT5zZEA2J27HyVZda7TKH+CxJKX/Kn/zcpcL9YEAL70Y6PklEY5BZ?=
 =?iso-8859-1?Q?j5ngXEj9CpwTFZuAQBlSpj7VsbNFeSTNuDLUkZ9/XIa2I2cGK4KySjuQeh?=
 =?iso-8859-1?Q?RJ57nWfTeSR8oeDFjlEubj3GhlDnXVOWlr0luSsF0NyDIaWfixuJpMGX9Y?=
 =?iso-8859-1?Q?6c3aPjEFpF0cRFurBObmM0ZKIVBHZi3hVzKrG71wuBWRJ/xw3nYNMWcvkj?=
 =?iso-8859-1?Q?1MK76KW6zAuSIByaz0HIyU8o5dktct6IdDk8oX0fNJmusOt7Fc+r5ixB5/?=
 =?iso-8859-1?Q?hfEg8ltROFZ5FDBeBNuL/Y8FY1OMBgqOb9PU9HcCulADzbOjdz3JEXP6Hc?=
 =?iso-8859-1?Q?VrloNptKQtRayrTVUNv+P3SDccVpg+gzEzr1T7KzZgsDKvoOhUzOIlw2J9?=
 =?iso-8859-1?Q?yitsvZGA/bL4ohCsEJMTclNt3C7e+OF+k1Q/26iVV6aEbFIatZoo7eMCh0?=
 =?iso-8859-1?Q?3FM6+KtptYtfjYXw8DSnfiokuP3AnoHARzrxN2ji4F9YNvXNe88AxIHB+M?=
 =?iso-8859-1?Q?uW/t7+g/QtbUrHu+mydRHiXX0tEyxYwYKdfXsL2SI/YGMTOocKrdXaWBn/?=
 =?iso-8859-1?Q?RRdhO5G12+GtD+Lt19Jl7RAXDN7vvynRItLZ6KKnVIke78G+551vzo0sYE?=
 =?iso-8859-1?Q?/FK9aAIGfkJEwYPJx0pP0nI+Cu9e/rdY/gsq5lRZcHy4zE3E4GiGCt2PlG?=
 =?iso-8859-1?Q?8LiMBgmRCOv2w+3XrC/BKlRoJ71ILBCjR5ZFjzFfU6ttQmlZTy9F6uzvlK?=
 =?iso-8859-1?Q?njVMXgFMDD3z3GKDtGj3Zni9O5dlidU1+C8VCX2GGAu40N/QDXJ/C5FJQz?=
 =?iso-8859-1?Q?wX2W9PCz+jMr7TUJoH71hakyVFXVir+PC4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9958d1-b6e6-4c29-7574-08dc70601278
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 19:41:51.1696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDCCo6t94J97eI/6jXbYburm8mI+Y/9G6SP/H40UChECti1/YpAaM5BbcHz5wJ1I7xvKGSa7AwXqIlDOz2VDfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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

On Thu, May 09, 2024 at 07:48:09AM -0400, Gupta, Anshuman wrote:
> 
> 
> > -----Original Message-----
> > From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Sent: Saturday, May 4, 2024 12:43 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>; Dugast, Francois <francois.dugast@intel.com>;
> > thomas.hellstrom@linux.intel.com; Auld, Matthew
> > <matthew.auld@intel.com>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > Subject: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
> > 
> > In the regular use case scenario, user space will create a VM, and keep it alive
> > for the entire duration of its workload.
> > 
> > For the regular desktop cases, it means that the VM is alive even on idle
> > scenarios where display goes off. This is unacceptable since this would
> > entirely block runtime PM indefinitely, blocking deeper Package-C state. This
> > would be a waste drainage of power.
> > 
> > So, let's limit the protection only for the long running workloads, which
> > memory might be mapped and accessed during this entire workload.
> > 
> > This indeed opens up a risk of use case without display, and without long-
> > running workload, where memory might be mapped and accessed with direct
> > read and write operations without any gpu execution involved. Because of
> > this, we are also adding here, the extra protection for the special vm_op
> > access callback.
> AFAIU for this particular case we are already having protection, as we are invalidating the pte upon entry to runtime suspend.
> So a pagefault should wake the device. Therefore we don't need this extra precaution.

Indee and removed from the new version just sent.

I was just not confident because my tests were failing...
but now igt is fixed as well:
https://lore.kernel.org/all/20240509191636.504200-3-rodrigo.vivi@intel.com/

> Thanks,
> Anshuman
> > 
> > In the ideal case of the mmapped scenario of vm_ops, we would also get
> > references in the 'open' and 'mmap' callbacks, and put it back on the 'close'
> > callback, for a balanced case.
> > However, this would also block the regular desktop case, so we are not doing
> > this.
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_bo.c | 17 ++++++++++++++++-
> > drivers/gpu/drm/xe/xe_vm.c |  6 +++---
> >  2 files changed, 19 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c index
> > 52a16cb4e736..48eca9f2651a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1157,11 +1157,26 @@ static vm_fault_t xe_gem_fault(struct vm_fault
> > *vmf)
> >  	return ret;
> >  }
> > 
> > +static int xe_vm_access(struct vm_area_struct *vma, unsigned long addr,
> > +			void *buf, int len, int write)
> > +{
> > +	struct ttm_buffer_object *tbo = vma->vm_private_data;
> > +	struct drm_device *ddev = tbo->base.dev;
> > +	struct xe_device *xe = to_xe_device(ddev);
> > +	int ret;
> > +
> > +	xe_pm_runtime_get(xe);
> > +	ret = ttm_bo_vm_access(vma, addr, buf, len, write);
> > +	xe_pm_runtime_put(xe);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct vm_operations_struct xe_gem_vm_ops = {
> >  	.fault = xe_gem_fault,
> >  	.open = ttm_bo_vm_open,
> >  	.close = ttm_bo_vm_close,
> > -	.access = ttm_bo_vm_access
> > +	.access = xe_vm_access
> >  };
> > 
> >  static const struct drm_gem_object_funcs xe_gem_object_funcs = { diff --git
> > a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c index
> > dfd31b346021..aa298b768620 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1347,7 +1347,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> > 
> >  	vm->pt_ops = &xelp_pt_ops;
> > 
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_get_noresume(xe);
> > 
> >  	vm_resv_obj = drm_gpuvm_resv_object_alloc(&xe->drm);
> > @@ -1457,7 +1457,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe,
> > u32 flags)
> >  	for_each_tile(tile, xe, id)
> >  		xe_range_fence_tree_fini(&vm->rftree[id]);
> >  	kfree(vm);
> > -	if (!(flags & XE_VM_FLAG_MIGRATION))
> > +	if (flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_put(xe);
> >  	return ERR_PTR(err);
> >  }
> > @@ -1592,7 +1592,7 @@ static void vm_destroy_work_func(struct
> > work_struct *w)
> > 
> >  	mutex_destroy(&vm->snap_mutex);
> > 
> > -	if (!(vm->flags & XE_VM_FLAG_MIGRATION))
> > +	if (vm->flags & XE_VM_FLAG_LR_MODE)
> >  		xe_pm_runtime_put(xe);
> > 
> >  	for_each_tile(tile, xe, id)
> > --
> > 2.44.0
> 
