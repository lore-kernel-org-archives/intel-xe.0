Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEF7EDEBF5
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 22:49:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52910E08D;
	Tue,  3 Mar 2026 22:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWJAQV/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3BE10E08D
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Mar 2026 22:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772578172; x=1804114172;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=K3KgLCKNSPhajvbrNsTuFUyzU8T/HXm85xLPoZMUWMA=;
 b=PWJAQV/pKbxp/j4shpBnSC+kV1FSoyQplPGynCnXNFjG6Co0h1gkXhNS
 NVdKXhFMlmOuS5uM3vP671/UJR8npgKiA2ltcG2syPIO42sVxxAF35jhI
 FDR219u+jvQkLHyEXFdLX4PLSitp1+l808WGBq4uPDOiMdRtqPNqR/rtI
 PUHb+YYlzX9MQAQoksEKEDVuZfEsUrBa5kvoMBi9kLYRKx+3vc/EoiojJ
 BMritOVjPDzdKwNTdr58/J8KeqXFTkS+fierU1sOXQNQZxlrVF2j1p8c0
 t6q8p8AlZrEYEEi87m3/iS6TXBjB7iQ/uW5geld8gyBOQcYo2YtaDTDYi A==;
X-CSE-ConnectionGUID: zIptvVqzTbKfWZLdxVa9Dw==
X-CSE-MsgGUID: NUhqpcL7Qo+Vn/FvZsLSQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73331088"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="73331088"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:49:32 -0800
X-CSE-ConnectionGUID: uOUQdQqJSjC7U8prPpkwqw==
X-CSE-MsgGUID: Hk6WCANIR+KDGQu+YxaSHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208";a="222302077"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 14:49:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:49:31 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 14:49:31 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 14:49:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/7sfnSLbY6Wp1MmiZDO93ubrjPbBM1n1j3ZqkKJRWfccsyHT1r1Fp5eZic+cxzmAQb1THTi/KO39HiCM0mTuHSqrFmcIEKJSyeSIL43qjdRnYX3FgY0z3sg6jZjMW48qhuVF1bmoQcMTOFrYoOoxY3vrEAc6F3lI5oWyPLOkgnFw+mNw3FVr2fmRDgSJ7gUy7ZNJgcmVPzSEnsIaPPKRERYooW3IVC9oLQ8Eao+GSXDElh9lnMYaTNLORid5h91IfDbE5Zho+j/hGa1hSCZKnOywAkuXQz2nxER1GkVtDVxzez/Jd6UQua3zQe6NtymoloLwwfvyQz1ITFNU2tdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T62EwV068sxGXr8i/hNrue2ytKtDxcoOzTGTCzmSERk=;
 b=WH7JGppP4xBHzUDB7JV5pUfKEGpClWW8BSX3/vf/Z38vz8Icvj0OiWB/7ruEVeQTsoWXvWvEg/B81/v8kMb6oSCqDzAf3AiS/pQxnnIixj5W33xuidH8Pl7wW1qFDM6cnVlMKtG0ZAzNfKkmseLcyqaIGKg+Uh0mRZ8+MEqK1ELXuKAWoDddvAag71D8TJmKFR9hw6RdyPaVjQTS5i+IFKGDmbeEPPX0Bvaf2x/09BzBiPZmexCeWAQRwpvlzZ/xUpf+Huc9Oni0V3gKU7wqJU1DzksRztyVeBvSScCNYXkzjEQ0sZZuvz747V2jgPscWx08gvyCYNwDJkEyzM7fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH8PR11MB9607.namprd11.prod.outlook.com (2603:10b6:510:3a0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Tue, 3 Mar
 2026 22:49:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:49:30 +0000
Date: Tue, 3 Mar 2026 14:49:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Yadav, 
 Arvind" <arvind.yadav@intel.com>, "Mishra, Pallavi"
 <pallavi.mishra@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v6 00/12] drm/xe/madvise: Add support for purgeable
 buffer objects
Message-ID: <aadld+E4gyjpAYY4@lstrano-desk.jf.intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <c9c1f3065d8283936bca96abfcd46ba7141406a3.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9c1f3065d8283936bca96abfcd46ba7141406a3.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH8PR11MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: 02d62126-aa63-454c-09bf-08de79772136
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 92kVy4frV2d7Qy4BheHJYpbXaWAhKZqTkzO5Mg1a8rvVHKZ1kQIBWUj4lPE9JO933f2cPAg5rZV4FPZ56c/lMoiTdvCX34wC58aNj/K4o2ny3qE0L9cfbZRZ/oErZZygYNzj9GwruiXjrV9Rm7V9Zgzg3XrjtiEgTxJ0PNJF30gWcgl4B0mlDKOz7SOhDYOdPkAuA/bCzcl86D7uP8zhp8utiYuKJcQW5H+1h5/VK/sMPYZKljAB8W9bn4l4EmRJXb4TjOmaHjdZYMDfa/eQmSpH6CYKfctewEQC6M1aDGVr3zruNEtP+eHyxYBi0+YgisxotCAzWPHDb+wyLymB+KYVqbsmrDZriJfPiSY8Vn5KN56OAaMnYz4oelZIFhUJpbElAo5U6wJatiCknK9lHgKcawUSVxRLhJftpdOuKRooUnEW2EMa7wLFOHc/lxjjNoL8b4ckbGwEtqT9g3fAY4UHLk42TNaY53SMsvFy3rtPGL8fy1vClUCG6MK0utOF63iFp8Y45wohtBIZmfnZHs2VE7oGueQjOBpsFtJfXW5Y9SQBhPPH3B1NVAGHtHw3J3Gl9FtYivlyp2fKF4zewb07UplcPhsIWEauNbHgBs3OLTJTI3lP+QdsMetFSG7YRHfPqvAo010VQ66lix6o+++E9W0Wl+pLJWUWAQslndrUagCCvOdUyPQoU8JcVGw8hhANA4EhdToktBJOYFFlhHS7H0rWolyjxREW2sG+Qs0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDAwK0hOZkQ5SG5RK0FEZWN5WXpwK3kvYWkwVDRQV1FWK0l0TklRK0NSelAz?=
 =?utf-8?B?eDI4WXppZ3ZHVzkwcW9kWDVLa2d1eklSbmxyT1VTWkZ6VnBnSUovb3RhTXEv?=
 =?utf-8?B?cG1aUjRLV0RSdm1mZCtiWXVreVJZaXFGaW1UUGF1djhtbkRHVUtKOFZnaVk3?=
 =?utf-8?B?c3dEbkpkMGZsSzlkd2tDdVYzc2dpWFk3bUJLL3FOSllQTkdESCtjVnF4YkNq?=
 =?utf-8?B?Q1lwMnRFZDhnWHJ2TzJDblEzdWlFYnF3OUdIb0FLYlpWUGRjSWZlU1NKUXdz?=
 =?utf-8?B?NHRPZ2lrTFhDNmRPMnllM201OVBHQ01oRUJEQ2d1blhCZXJxNnhzdFV4UjBG?=
 =?utf-8?B?Nk5TRDlnM3ZTdS9iTHlQU2xzOEhoL1VoNU9uaDdBRlB1Uk9ZaVFwbXQ5MWlj?=
 =?utf-8?B?VXZhVzFRY2Fod1IwdENjSWQzSjQvRDg3YTZPT2JOWjRWZFppT0lwbzdvMHVI?=
 =?utf-8?B?dXducVJQSzMxUS9OcHN4aFlzaGF0Z0FVcnl1bWRGQlpNSTY2YWFEUnViVWF2?=
 =?utf-8?B?cjdPd0FXNyt6dWY1SXBYaVI4M1FTTlJVd2ptKzU2YjZVQTRIL1J2YkZESDBV?=
 =?utf-8?B?alFkczcvanpaZWRjK1hZWk5aZFFLNVVxQlc4eDZOeE1neFZRNVd2cm1aQ2lu?=
 =?utf-8?B?TGRxc3JiQnF4WUxQWDRyVVhKakYxS0NjbXhpUjBJUmVRQSt5bkpZU21hL1Bx?=
 =?utf-8?B?RVlvbEhyeGRQdFZ4SUNKczNVOHlTL2w0VHdtd1NXQUpHdHlPb1NOZ0FNWXhy?=
 =?utf-8?B?cWMxS1l2TkN0K1Fvdk9LbGpRR1VIOVJTWWVjaDRQZm1pL1E5QmxxWGtLNHFz?=
 =?utf-8?B?aG5VUTVYNVpNMjdsT3NjRU5lT1FVSm1xL0pPRzM4MjBnaGJ5a0toVzF1VGNP?=
 =?utf-8?B?Zlc0N1l1eEVJOW04a2lPQis5T0pEWFJKUlJ0OTJoMnJDc1ZWd3pLLytXSFhu?=
 =?utf-8?B?WldSL3g1eW0yc0ZwUXZXT0ZxZlhySGFlenV4ZXJ6RWZlOGpGRURDTzQ5cE9E?=
 =?utf-8?B?YlJpN3VuWm9VcEFWVG0rbE42ZmFXQ1dwV0YzTE5vcWtUek1iL1VzNGxQR3d4?=
 =?utf-8?B?RDhITVZjS040dU1SQWsvTWxMMjlMb2M1cEZCUWZVK0VKRU4xeHZCdWhOZ3pl?=
 =?utf-8?B?OUEyZWN4Sm8wWG1IekFCcE1tUFloeENHbEwrNEFxZmcxbG4vNmNUeGZEcDdJ?=
 =?utf-8?B?TGc3YnRXc2tSajRnbzRPaVNWUC9qRWp6Q01RN0pqVVBnRCt6cFdsSWwzcWRZ?=
 =?utf-8?B?QktsRjl5SmFVRU01cDlYeTdHUEdXR1l6bzV1MmExVy92ZXI3dGpQa3l6Znp4?=
 =?utf-8?B?MEplTS9IUmtnT2JKMElZUFh2T1lCOTkrVHkwbUVqZXdPRXJpUExkcU1jTVFN?=
 =?utf-8?B?VmliREJGbW93NjRKTXZhVFhUbjVlUFA1KzM5M2ZRbmZHQTEwOEhGTUFsaDg3?=
 =?utf-8?B?cDdieHlrL2pYRnI1emVBRW9Jc3Q5bEs5U1V3OFlMWm1Dd0txRnd3b3Jqdkpr?=
 =?utf-8?B?VTVTRmRhdmFLOU56M2I2U016WCtUVEozNW1nczM2MXExR1FXUGlKekZpbERu?=
 =?utf-8?B?Qm1laXNjWXpiSDVUQXNwV29jdUt1UXVkWXBpSFhBTUhMc0Q4c0ZYUmRrWndz?=
 =?utf-8?B?ODdnT2l1L0NuWW5CekFwL3dkRXN4dXhXVDlLdmw0Nnp4MVUwK3RQMm5aeVUv?=
 =?utf-8?B?ZTVySzZKUzdRTjdxTTBRMmVyZmhGNDVVRnBPUXNBZGxoRVVneFJod0ZrNkl1?=
 =?utf-8?B?T2dvSGlEREppVWEvY0dOV2d0RFEvR1BCenlLYkVocVJvK1JLQnRtUFg4OVNu?=
 =?utf-8?B?Zzdiak5jS3ZXb29ZdW1uaXhtUkNyeTRtVGhmODIwUi9HQWlnYURqUHFrK2N1?=
 =?utf-8?B?RGpUZWduaFF2a3VNeGtlRzRVZkhCallZQWJHTHpDbFo2UG0zMGEwcGErYkUy?=
 =?utf-8?B?MmRZaWZETzd2WGNFNHRpd1hLODNBWUZyNXBxK2tJWVNJQjAwSVI3dDJ5RHNF?=
 =?utf-8?B?YVYrdFcvKzNTK2V6TkUyRUtZU2svUTRiUUkrWmxHTlQyYlZ1T2kzYmgyQWE3?=
 =?utf-8?B?VUFIei8zQ1QzRDNrUUhYMGkzOEVZbUdsNEZkU2ZjVW1hV3ZPS0haN2NVcjd6?=
 =?utf-8?B?bGRmTHJWaGFxR1RlUi84c2k4UjZqem5QMm56bEY0ZUhhY09XZlVLR2lCU2c1?=
 =?utf-8?B?eUhLUS9wT2JHR3lneSs4UHpTaUMzd2R2SzNHYUp2WjZLMnpXYnJiQ1lVNDFn?=
 =?utf-8?B?RHp3alFBWHFEV0gzdDlrU0lubDdJcXFsSHNiQ2w1Y1Q1aERjUDVqVk9jL3J1?=
 =?utf-8?B?NjB5NDh5US8zM3JXaFpqb1lkOHhtSjQ1QjdjQ1dtdC9va1FQUjJEM0NuY0Z3?=
 =?utf-8?Q?1nzUnMYO4BtCSXxo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 02d62126-aa63-454c-09bf-08de79772136
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:49:29.9785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gf95qGJy4Ur8vlr1dpwe2/ZybyDqxG5hYHS7iAQmkCXXn0i2SK90OIeW+Ea36HuzCi5W42sWaa3HSXSbWimrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9607
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

On Tue, Mar 03, 2026 at 03:05:59PM -0700, Souza, Jose wrote:
> On Tue, 2026-03-03 at 20:49 +0530, Arvind Yadav wrote:
> > This patch series introduces comprehensive support for purgeable
> > buffer objects
> > in the Xe driver, enabling userspace to provide memory usage hints
> > for better
> > memory management under system pressure.
> > 
> > Overview:
> > 
> > Purgeable memory allows applications to mark buffer objects as "not
> > currently
> > needed" (DONTNEED), making them eligible for kernel reclamation
> > during memory
> > pressure. This helps prevent OOM conditions and enables more
> > efficient GPU
> > memory utilization for workloads with temporary or regeneratable data
> > (caches,
> > intermediate results, decoded frames, etc.).
> > 
> > Purgeable BO Lifecycle:
> > 1. WILLNEED (default): BO actively needed, kernel preserves backing
> > store
> > 2. DONTNEED (user hint): BO contents discardable, eligible for
> > purging
> > 3. PURGED (kernel action): Backing store reclaimed during memory
> > pressure
> > 
> > Key Design Principles:
> >   - i915 compatibility: "Once purged, always purged" semantics -
> > purged BOs
> >     remain permanently invalid and must be destroyed/recreated
> >   - Per-VMA state tracking: Each VMA tracks its own purgeable state,
> > BO is
> >     only marked DONTNEED when ALL VMAs across ALL VMs agree (Thomas
> > Hellström)
> >   - Safety first: Imported/exported dma-bufs blocked from purgeable
> > state -
> >     no visibility into external device usage (Matt Roper)
> >   - Multiple protection layers: Validation in madvise, VM bind, mmap,
> > CPU
> >     and GPU fault handlers. GPU page faults on DONTNEED BOs are
> > rejected in
> >     xe_pagefault_begin() to preserve the GPU PTE invalidation done at
> > madvise
> >     time; without this the rebind path would re-map real pages and
> > undo the
> >     PTE zap, preventing the shrinker from ever reclaiming the BO.
> >   - Correct GPU PTE zapping: madvise_purgeable() explicitly sets
> >     skip_invalidation per VMA (false for DONTNEED, true for WILLNEED,
> > purged
> >     and dmabuf-shared BOs) so DONTNEED always triggers a GPU PTE zap
> >     regardless of prior madvise state.
> >   - Scratch PTE support: Fault-mode VMs use scratch pages for safe
> > zero reads
> >     on purged BO access.
> >   - TTM shrinker integration: Encapsulated helpers manage xe_ttm_tt-
> > >purgeable
> >     flag and shrinker page accounting (shrinkable vs purgeable
> > buckets)
> 
> 
> I get Engine memory CAT errors when using this feature:
> 
> [  240.301213] xe 0000:00:02.0: [drm] Tile0: GT0: Fault response:
> Unsuccessful -EINVAL
> [  240.301301] xe 0000:00:02.0: [drm] Tile0: GT0: Engine memory CAT
> error [18]: class=rcs, logical_mask: 0x1, guc_id=17
> [  240.302871] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset:
> engine_class=rcs, logical_mask: 0x1, guc_id=17, state=0x249
> [  240.302885] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job:
> seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in
> arb_map_buffer_ [3374]
> [  240.302892] xe 0000:00:02.0: [drm:xe_devcoredump [xe]] Multiple
> hangs are occurring, but only the first snapshot was taken
> 
> Mesa creates VM with DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, probably you
> don't have a IGT test with this scenario.
> 
> @cc Rodrigo
> 
> Other issue is not related to your patches but drm_xe_madvise only
> works with non-canonical addresses and some time ago was agreed that
> all the user-visible addresses would be in canonical format.
> Not sure if we can do anything at this point but letting you know.
> 

We actually might be able to fix it to accept canonical addresses, what we
can't blindly do is make non-canonical addresses stop working... 

It might create weird scenario for UMDs though if canonical addresses
work on some kernel but not others but perhaps since this is Mesa's
first use of madvise we get this in as part of purgable and only NEO
would have to deal with this scenario.

Matt

> 
> > 
> > v2 Changes:
> >   - Reordered patches: Moved shared BO helper before main
> > implementation for
> >     proper dependency order
> >   - Fixed reference counting in mmap offset validation (use
> > drm_gem_object_put)
> >   - Removed incorrect claims about madvise(WILLNEED) restoring purged
> > BOs
> >   - Fixed error code documentation inconsistencies
> >   - Initialize purge_state_val fields to prevent kernel memory leaks
> >   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
> > Hellström)
> >   - Add NULL rebind with scratch PTEs for fault mode (Thomas
> > Hellström)
> >   - Implement i915-compatible retained field logic (Thomas Hellström)
> >   - Skip BO validation for purged BOs in page fault handler (crash
> > fix)
> >   - Add scratch VM check in page fault path (non-scratch VMs fail
> > fault)
> > 
> > v3 Changes (addressing Matt and Thomas Hellström feedback):
> >   - Per-VMA purgeable state tracking: Added xe_vma->purgeable_state
> > field
> >   - Complete VMA check: xe_bo_all_vmas_dontneed() walks all VMAs
> > across all
> >     VMs to ensure unanimous DONTNEED before marking BO purgeable
> >   - VMA unbind recheck: Added xe_bo_recheck_purgeable_on_vma_unbind()
> > to
> >     re-evaluate BO state when VMAs are destroyed
> >   - Block external dma-bufs: Added xe_bo_is_external_dmabuf() check
> > using
> >     drm_gem_is_imported() and obj->dma_buf to prevent purging
> > imported/exported BOs
> >   - Consistent lockdep enforcement: Added xe_bo_assert_held() to all
> > helpers
> >     that access madv_purgeable state
> >   - Simplified page table logic: Renamed is_null to is_null_or_purged
> > in
> >     xe_pt_stage_bind_entry() - purged BOs treated identically to null
> > VMAs
> >   - Removed unnecessary checks: Dropped redundant "&& bo" check in
> > xe_ttm_bo_purge()
> >   - Xe-specific warnings: Changed drm_warn() to XE_WARN_ON() in purge
> > path
> >   - Moved purge checks under locks: Purge state validation now done
> > after
> >     acquiring dma-resv lock in vma_lock_and_validate() and
> > xe_pagefault_begin()
> >   - Race-free fault handling: Removed unlocked purge check from
> >     xe_pagefault_handle_vma(), moved to locked xe_pagefault_begin()
> >   - Shrinker helper functions: Added xe_bo_set_purgeable_shrinker()
> > and
> >     xe_bo_clear_purgeable_shrinker() to encapsulate TTM purgeable
> > flag updates
> >     and shrinker page accounting, improving code clarity and
> > maintainability
> > 
> > v4 Changes (addressing Matt and Thomas Hellström feedback):
> >   - UAPI: Removed '__u64 reserved' field from purge_state_val union
> > to fit
> >     16-byte size constraint (Matt)
> >   - Changed madv_purgeable from atomic_t to u32 across all patches
> > (Matt)
> >   - CPU fault handling: Added purged check to fastpath
> > (xe_bo_cpu_fault_fastpath)
> >     to prevent hang when accessing existing mmap of purged BO
> > 
> > v5 Changes (addressing Matt and Thomas Hellström feedback):
> >   - Add locking documentation to madv_purgeable field comment (Matt)
> >   - Introduce xe_bo_set_purgeable_state() helper (void return) to
> > centralize
> >     madv_purgeable updates with xe_bo_assert_held() and state
> > transition
> >     validation using explicit enum checks (no transition out of
> > PURGED) (Matt)
> >   - Make xe_ttm_bo_purge() return int and propagate failures from
> >     xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g.
> > no_wait_gpu
> >     paths) rather than silently ignoring (Matt)
> >   - Replace drm_WARN_ON with xe_assert for better Xe-specific
> > assertions (Matt)
> >   - Hook purgeable handling into
> > madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
> >     instead of special-case path in xe_vm_madvise_ioctl() (Matt)
> >   - Track purgeable retained return via xe_madvise_details and
> > perform
> >     copy_to_user() from xe_madvise_details_fini() after locks are
> > dropped (Matt)
> >   - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
> >     __maybe_unused on madvise_purgeable() to maintain bisectability
> > until
> >     shrinker integration is complete in final patch (Matt)
> >   - Call xe_bo_recheck_purgeable_on_vma_unbind() from
> > xe_vma_destroy()
> >     right after drm_gpuva_unlink() where we already hold the BO lock,
> >     drop the trylock-based late destroy path (Matt)
> >   - Move purgeable_state into xe_vma_mem_attr with the other madvise
> >     attributes (Matt)
> >   - Drop READ_ONCE since the BO lock already protects us (Matt)
> >   - Keep returning false when there are no VMAs - otherwise we'd mark
> >     BOs purgeable without any user hint (Matt)
> >   -  Use struct xe_vma_lock_and_validate_flags instead of multiple
> > bool
> >     parameters to improve readability and prevent argument
> > transposition (Matt)
> >   - Fix LRU crash while running shrink test
> >   - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
> >   - Split ghost BO and zero-refcount handling in xe_bo_shrink()
> > (Thomas)
> > 
> > v6 Changes (addressing Jose Souza, Thomas Hellström and Matt Brost
> > feedback):
> >   - Document DONTNEED blocking behavior in uAPI: Clearly describe
> > which
> >     operations are blocked and with what error codes. (Thomas, Matt)
> >   - Block VM_BIND to DONTNEED BOs: Return -EBUSY to prevent creating
> > new
> >     VMAs to purgeable BOs (undefined behavior). (Thomas, Matt)
> >   - Block CPU faults to DONTNEED BOs: Return VM_FAULT_SIGBUS in both
> > fastpath
> >     and slowpath to prevent undefined behavior. (Thomas, Matt)
> >   - Block new mmap() to DONTNEED/purged BOs: Return -EBUSY for
> > DONTNEED,
> >     -EINVAL for PURGED. (Thomas, Matt)
> >   - Block dma-buf export of DONTNEED/purged BOs: Return -EBUSY for
> > DONTNEED,
> >     -EINVAL for PURGED. (Thomas, Matt)
> >   - Fix state transition bug: xe_bo_all_vmas_dontneed() now returns
> > enum to
> >     distinguish NO_VMAS (preserve state) from WILLNEED (has active
> > VMAs),
> >     preventing incorrect DONTNEED → WILLNEED flip on last VMA unmap
> > (Matt)
> >   - Set skip_invalidation explicitly in madvise_purgeable() to ensure
> >     DONTNEED always zaps GPU PTEs regardless of prior madvise state.
> >   - Add DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT for userspace
> >     feature detection. (Jose)
> > 
> > Arvind Yadav (11):
> >   drm/xe/bo: Add purgeable bo state tracking and field madv to xe_bo
> >   drm/xe/madvise: Implement purgeable buffer object support
> >   drm/xe/bo: Block CPU faults to purgeable buffer objects
> >   drm/xe/vm: Prevent binding of purged buffer objects
> >   drm/xe/madvise: Implement per-VMA purgeable state tracking
> >   drm/xe/madvise: Block imported and exported dma-bufs
> >   drm/xe/bo: Block mmap of DONTNEED/purged BOs
> >   drm/xe/dma_buf: Block export of DONTNEED/purged BOs
> >   drm/xe/bo: Add purgeable shrinker state helpers
> >   drm/xe/madvise: Enable purgeable buffer object IOCTL support
> >   drm/xe/bo: Skip zero-refcount BOs in shrinker
> > 
> > Himal Prasad Ghimiray (1):
> >   drm/xe/uapi: Add UAPI support for purgeable buffer objects
> > 
> >  drivers/gpu/drm/xe/xe_bo.c         | 223 +++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_bo.h         |  60 ++++++
> >  drivers/gpu/drm/xe/xe_bo_types.h   |   6 +
> >  drivers/gpu/drm/xe/xe_dma_buf.c    |  21 +++
> >  drivers/gpu/drm/xe/xe_pagefault.c  |  19 ++
> >  drivers/gpu/drm/xe/xe_pt.c         |  40 +++-
> >  drivers/gpu/drm/xe/xe_query.c      |   2 +
> >  drivers/gpu/drm/xe/xe_svm.c        |   1 +
> >  drivers/gpu/drm/xe/xe_vm.c         | 100 ++++++++--
> >  drivers/gpu/drm/xe/xe_vm_madvise.c | 283
> > +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_vm_madvise.h |   3 +
> >  drivers/gpu/drm/xe/xe_vm_types.h   |  11 ++
> >  include/uapi/drm/xe_drm.h          |  60 ++++++
> >  13 files changed, 793 insertions(+), 36 deletions(-)
