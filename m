Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2656C5DF81
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 21:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E1410E06D;
	Tue, 18 Aug 2026 21:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJzEbIoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B38F10E06D
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Aug 2026 21:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787088731; x=1818624731;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H38roO+6vRr7JPYJS21BfKofJ+/k7/WVT2bXfoDQ04U=;
 b=LJzEbIoTKEhYuMnfYGnsaTn6AYZXf4nH0qWq72JmIwyK5nLu7+IYpFUV
 XlvJCQ2iDawE+tV5peN4d/EUOvxMpPULdgTvGtdLrC5UClEAEOsl2q2k/
 +r0cBxsEZHCzLI99pMQjfttEDu4/Y3XGh0BjrJFIgmA2ObRezD0+L9cGt
 CMYz4Q5EvQgRZ3SmXTE6iweJf0OG8kefOx5Tjl82fce/L6YIMt9V9FS4n
 pB+joDqdX+s2azJZvjg85Xc3QNDT9kFQX9s/nMyegs5S7Cqd4b0ZJg5a0
 NmNTSbp5iA8NQdnZKV6I6HXJcRoS2BGzJBRamrJWz3SqJbTrWuBjLxBvJ Q==;
X-CSE-ConnectionGUID: PGFNltDXQ4izWxqi8f3mvA==
X-CSE-MsgGUID: pbtfzA5WQJmWxXuLjAE+Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="97930819"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="97930819"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:32:10 -0700
X-CSE-ConnectionGUID: EIsiTezOSZesBjfwHId5EA==
X-CSE-MsgGUID: fyhWs9P5RNiVcotMD99CgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="269183774"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 14:32:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:32:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 14:32:10 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 14:32:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr1KnVEu6vpWTEy6xHpzl7FB4Y/gwasW0zGJEdgktW57YF0RkytVMEBb96KXxnYaLoembBiT74EZjtAK+xWq1ADolO+kuI6RUOfyepsBUuXUfzQw3tVWWtgQrZ3Oe76N0OGbJdpTmyEltekXhoqcwoPys1O4dJM/kD0j/rtTapest3ZLuNu8/bbP3X1aV2YCF7tLV2zhIe9Fnko4zULumiDeRsZWfuMTWUKlE12d9aiKw7Z5LT6xBVLU13BgVL/4mlXpRlgGpSnrCwOXZexmqcR7o/3oUeQOlhBSfL3XYA1ab7cXsqI1KYuf1I4OlDKNucKa/45y3j/MNEVzp7G0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qhlr9pIVGPtpuy3VWjfLm+u/xgc9rbiaCgT3nZTXOHs=;
 b=yO13FUFBH6NIQ6G2VzXDoDIH8wM637hyzEPAstZQMSAnxmH+o4pk+SzaHUU9rIntvimFWhzzCX0d5iSIw91rOcISOe4A2dyI+4Fmqf8bSFVMehCfMlMJ+Ao/zYmWpNs8ArAjCpFEiKV9bvjM8diCYDQaASL/m9fUjIyzvNzCRUY5uv3ccRNLXvts8Dt+MqPcd0spkwWDKC8mEbLTqA5a/EGuz4dbUWV/cOsBi9KeYFRQdiTPRdB8OsMPbo7kl6fgGh9uPdNKipuPQiMm7P077nCpNOBqi69w9JLlWp1ZByiA4UWCkYdEq3qojy4B0ZW3gRpkjHGooE9EXa9dojD/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 21:32:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 21:32:06 +0000
Date: Tue, 18 Aug 2026 14:32:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 2/2] drm/xe: Update shrinker batch size based on
 average BO size
Message-ID: <aoTPVO57T1xKhOub@gsse-cloud1.jf.intel.com>
References: <20260814143737.49684-1-thomas.hellstrom@linux.intel.com>
 <20260814143737.49684-3-thomas.hellstrom@linux.intel.com>
 <an+jlUmNfwnh44Pl@gsse-cloud1.jf.intel.com>
 <723431d70f8cdc1534a040416fe93b4f9bdab529.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <723431d70f8cdc1534a040416fe93b4f9bdab529.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0100.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA7PR11MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: 01aa8bca-d9bd-4f8f-3484-08defd7026bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XTKDqbVhy8LzORxL5LswFZBjvdsejsvhe2/KFT2g4Dbbc919caGFu++prvt1CQY0OeeZCkms5kOR9d4+RnKzkCHQ9XzlAD7QwTjkUdgknqysS6/MJbyObBQbQo/ey7lcpxPDcXvInlm/msCPF9k8AIBOQSpNhN6Ghtwrv7aZi2IS+5HIJg8ns2xNOyu/1IVK407UT+Zwh2ROMpQUZmn/ksiM6oFubsWZIYOV8hltRJt7hnG/8bowIZHZY695bZ0Nd0FxqEr/p+dr/Xgjd0erAiB8FxPSYp/2SdFpVtEtkKO5z5xb5DwCH4o42IkxQ8899MboGXE+s/gZDeAtVmRcYYIymMCe9z+jbaq93esHFHWBl+ZaW1AaHAOO0Yt0E0uUpFu0AL8vCcRH6amiLJqtpQn5SVzDT6uicarYbSjY0TpmcYHU5Pa/Ua266Tyysy7t+rleoumn1LliXDdsRqp0r671t9+e3A7DTjh8Uryoki+j38DiD7a3vOBssXhqs+nSiZcb1ku2mYf1Z9sFw9XjiB5HUQ8aLx93HWElS+K8v4lYJWlOBG7mk5pFYugg4qk14Fd+xzCCIIxuEVQ+8wZiLSVT/xWih7l4GDnGlJSJG1Z+AEmw4/zixwU75fbpzgMuRAhQ8gPWC0GtULIVMzxIEZzcToIBn/IPeX8PCy3Gmqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VRoS+3caR24uRqZPnb0wVM58CWuxwROFQo82+vBysTbftkBGdf1gAIpeHz?=
 =?iso-8859-1?Q?BqUEVF2KM3mWAYw19wd29iENrKLmKdd/6HBi9igwQZt6Y8QReegB/65i5G?=
 =?iso-8859-1?Q?Nl8lElMlzh35GcdSKPRaCdAL09pwJMBkKcpixLwXTb8LmC6DyGLhdZu9GB?=
 =?iso-8859-1?Q?wnIASVotANwFphYcHytQzfjA52947UBNG5dD1GiiuZxBGTWySI7gCsLKJ2?=
 =?iso-8859-1?Q?JmZAeSWFe4nETfs+NrkErIu3JCS3CS+RRiL1N5EwmlZIY532P6sYl44mHG?=
 =?iso-8859-1?Q?HQ/pA5ZgeZ6+5LFR62yv3rzY2cSao47C3HXhN5ApdVoqrY1Hu1rOaWJFeZ?=
 =?iso-8859-1?Q?vQIii/ubGcIwP3ZnYN/Rd2ZEcWBE0KGm4yuqLw2OyaaJX6ZvNM+XinG/9P?=
 =?iso-8859-1?Q?pfn8IGiMD0IDIakfH7K5KP/XKUekVMJbxireUnloI3bc60eKRS/ji10zwa?=
 =?iso-8859-1?Q?Vf3Vk0W+TYVW1l00AgBlkHUwLszivaWylb0t341eODNVQctOPuTwzFmh5B?=
 =?iso-8859-1?Q?kzF9mud8BBkYx+plX3WIIOHQc0Iegnsjh50rxr8D5kJ7Dbr2d0KcQ+j6tG?=
 =?iso-8859-1?Q?UIjeR/WXCDFWoRgO8Ciuz7zWRqgO8iCUzAeN4ca7wv7S3GEO1nQ34wDS0v?=
 =?iso-8859-1?Q?9gDDcfl43jS9gFowdbspYjQfCl8OUSHFnit2o+tk7K58lvkHq3wsT386KW?=
 =?iso-8859-1?Q?j0+tyloUVx7SVVpNY1ADO1wl/9E3FODkILhrkzAYsX5Rs19q8Ny9wgIbtO?=
 =?iso-8859-1?Q?ltsFWrDdSDcSAKSAbGqSvfKqgDZczRaGpNnWrQ3JI1nbZM3JsHYJDT2HKe?=
 =?iso-8859-1?Q?JKpmxAXMUi63JYqYZku2+qH30rKY9jNJLTk0xI8rmsQDLf+7JrS38fPDFi?=
 =?iso-8859-1?Q?YkEOAasNgWcqNsGLVyag0IerabHLJjfps/GcoKCcUPHboYYx9vyv7pkFbK?=
 =?iso-8859-1?Q?nQkEvlKt1jhBFzLZleBUh992aXddDnzbtw7TTz3U82vbrt1gyY/JICgIg3?=
 =?iso-8859-1?Q?xi6HCvIwpJ743xHXTquEBbvz64KHYe1Na7sHOpX4AOKDYFQ0k9p3la5oz9?=
 =?iso-8859-1?Q?W8+9kvbasCkzZYZc1a9JOxSD2Ih/35rvUxrpLF0fRS/Fm329A9X1VaqDta?=
 =?iso-8859-1?Q?WgHORO1XT8DD11Fk3wchWYy9fMhIRlGcAYsBjCHuih5BITfOkxVdtWgKuO?=
 =?iso-8859-1?Q?bhPOjfBiijKAgGLnLmP1A4iYBn2QKuyHm7JUZokR9gbEDoBUK6wPhcBbm+?=
 =?iso-8859-1?Q?l1qZaQwb4PscNz1F3aqg7qITGHRmbdfQbsNKYm5qYNAexRQss3pR2lOniW?=
 =?iso-8859-1?Q?cNRxIo0Cus8LtGa+1gYE8cEnKFPnxgsGMNQGmUO8SVGMytqsO57ZlU4vks?=
 =?iso-8859-1?Q?UUuVevj4LhEwXAiqxrCviVL2356u2XbePPPPGWnEp8DyIw05vzrIBgw/at?=
 =?iso-8859-1?Q?TlN/fCTCG2e9485IdD90RKwv4r68GDNJt9XYjmA3dYNFj/qfeOzzoLfDAU?=
 =?iso-8859-1?Q?B8o04saPlm381WE2/ldowmkSu2PIC82Ayzc56XLK/FYj4WcJPc7Jr8DPHK?=
 =?iso-8859-1?Q?LYuoLXlHTCvHoJXHMkxdlJMIMHg27WmEE306dXG0pAGi/kYktkw6meLI+z?=
 =?iso-8859-1?Q?UKZf0xszxv+KFLf3n8dgR7k6UI9VG+kT6pm6uE6Or4MmRICr8e/It60Zl2?=
 =?iso-8859-1?Q?XVIs2c0qaoZG83xuI24jW0NtksT+yxTMRTYt4zoh0UvHENLZJ4HIKQKa7M?=
 =?iso-8859-1?Q?jYd05XbkOyr9zTYcF+dHM4ypXxUohOm7jL5dXqMBXipTdxyZne/5BPhxCO?=
 =?iso-8859-1?Q?g+73GuGu7kdRkzBFzHypsZxZECH4+Ig=3D?=
X-Exchange-RoutingPolicyChecked: MrU/k6cWENtt4WuJuAPTgAld2ywVblgLbL+VJLmeMog9StvxP3Gaq7MV0cGyczqN4P5AltLpTOkTn5eovqa3eqJ0d+c4T0zfURQFPwUbzpkPVXkNGBbvQ9iQp9ZlBCOdkpBA6Kb7KlIpkMBsfyeW2ZoSMN3bdtMk3x5Wn+4iiCvqbg/M8zn9u9U+soyllHwY1944s+bAmoqwipTKvWnD73b7wHoYdCQoJ/mJy7LfFEQoi8nTB4Mr5Twdoc2jsTV009iDfZEl8tzBZcmjupwSKe9W3V+3DeMk+MNw4JlUIhksmx6Nw6ROT9iqg+N6ui3TkTHGyiyaCPS6ftajS/URMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01aa8bca-d9bd-4f8f-3484-08defd7026bd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 21:32:06.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/HJECC3fht2r91r5eCwIgViFMwtWuL8DuL0xI+02gkQteOrnejvp5NUASWPljaPcRDJgmkADeMnAaobJZ6Mfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA7PR11MB9594
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

On Tue, Aug 18, 2026 at 02:10:35PM +0200, Thomas Hellström wrote:
> On Fri, 2026-08-14 at 16:24 -0700, Matthew Brost wrote:
> > On Fri, Aug 14, 2026 at 04:37:37PM +0200, Thomas Hellström wrote:
> > > Update our preferred vmscan batch size on each count pass to avoid
> > > invoking scan_objects for requests too small to free even a single
> > > average-sized GEM object. Our rough estimate for an effective batch
> > > is twice the average number of pages per populated ttm_tt across
> > > all
> > > shrinkable and purgeable objects. The factor of two provides
> > > headroom
> > > so that most scan invocations can free at least one GEM object
> > > despite
> > > variability in object sizes.
> > > 
> > > The batch value is updated as an exponential moving average,
> > > (old_batch + avg) / 2, to smooth out sudden changes in the
> > > object population. It is floored at 128 pages, the kernel default
> > > SHRINK_BATCH, to ensure the shrinker remains responsive when there
> > > are very few objects.
> > > 
> > > The populated_tts counter introduced in the previous commit
> > > provides
> > > the object count needed for the average. We inherit the same
> > > justification as the analogous mechanism in i915: shrinking a GEM
> > > object has non-trivial locking overhead, so firing the shrinker for
> > > requests smaller than a single object is wasteful.
> > > 
> > > v2:
> > > - Fix the average object size estimate to account for the full
> > >   shrinkable and purgeable population.
> > > 
> > > Assisted-by: GitHub_Copilot:claude-sonnet-4.6
> > > Assisted-by: GitHub_Copilot:claude-sonnet-5
> > 
> > This is probably the right direction given what we currently have in
> > terms of shrinker control, but the core heuristic is still a pretty
> > poor
> > one. My understanding is that it combines batch and seek values using
> > some odd math to determine whether a scan is worthwhile at a given
> > priority level. We probably want to avoid shrinking at the initial
> > scan
> > priorities, and I believe this change accomplishes that.
> 
> Yes, but I think that's a side-effect not to be fully relied upon.
> 
> The meaning of this value IMO is to tell the core how many objects to
> expect for a scan request, so that the core can hold off shrinking
> until that many objects is actually this shrinker's fair share of its
> available objects. So the side effect would be that this shrinker's
> fair share of shrinking may not trigger a scan request if shrinking is
> triggered by compacting?
> 

I think you mean higher order allocations, not compaction. Reclaim is
the input to compaction - see compaction_ready, compact_gap usage in
vmscan.c

So I think a side affect could be higher order allocation never enter
our shrinker if compaction_ready flips to true before our batch size /
seek values are asked for (total_scan math in do_shrink_slab).

> > 
> > That said, I think we really want two shrinkers instead: one with the
> > default settings (or perhaps even a reduced seek value) for purgeable
> > BOs, and another for BOs that we legitimately need to back up. The
> > purgeable one should be favored to run eariler, likewise the TTM pool
> > shrinker should be favored run before our shrinker too.
> 
> I don't think we can or should use the batch size to decide which
> shrinker should be prioritized. IIRC one of the comments to previous

It probably isn't the right approach, but my concern is that our shrinker
won't run at higher orders when there are cheap reclaimable pages (i.e.,
we have purged BOs that can immediately make higher-order pages available
or allow compaction to do its job of forming higher-order pages). I have
already seen shrinker backoff being too aggressive when compaction_ready()
returns true, resulting in virtually zero THP availability because
shrinkers hold onto enough non-movable pages scattered throughout memory
to prevent successful compaction (I have a local core MM patch that fixes
this issue).

Purgable and non-purgable pages have fundamentally different shrinking
costs, and that distinction needs to be expressed somehow. The
opportunistic compaction (wrongly named) shrinker series attempts to
capture this.

> series what that shrinkers should appear similar to the core, unless
> some form of differentiation is implemented in the core. If we were to
> add two shrinkers it would mean that purgeable objects would get its
> fair share of shrinking and so would also active / live objects. With
> the current design we prioritize internally to make sure we target
> purgeable objects first.
> 

One shrinker could scan only purgable pages, while the other could scan
both purgable pages and those in the working set. But maybe that isn't
the right answer either.

So I'm torn on this. I think this series will help with the higher-order
eviction feedback loop but, at the same time, may make higher-order
availability worse in certain cases. I think the proper solution for
both issues is core shrinker work, but it has been hard to gain any
traction there.

Matt

> > 
> > Also we really should look at getting priority based shrinking in
> > too, I
> > have follow up there too which disconnects purgable / not in working
> > set
> > from shared VM dma-resv also, further prioritizing though shrinks.
> > 
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_shrinker.c | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_shrinker.c
> > > b/drivers/gpu/drm/xe/xe_shrinker.c
> > > index cded230f5459..284fce207705 100644
> > > --- a/drivers/gpu/drm/xe/xe_shrinker.c
> > > +++ b/drivers/gpu/drm/xe/xe_shrinker.c
> > > @@ -146,6 +146,8 @@ xe_shrinker_count(struct shrinker *shrink,
> > > struct shrink_control *sc)
> > >  {
> > >  	struct xe_shrinker *shrinker = to_xe_shrinker(shrink);
> > >  	unsigned long num_pages;
> > > +	unsigned long total_pages;
> > > +	unsigned long populated_tts;
> > >  	bool can_backup = !!(sc->gfp_mask & __GFP_FS);
> > >  
> > >  	num_pages = ttm_backup_bytes_avail() >> PAGE_SHIFT;
> > > @@ -157,8 +159,32 @@ xe_shrinker_count(struct shrinker *shrink,
> > > struct shrink_control *sc)
> > >  		num_pages = 0;
> > >  
> > >  	num_pages += shrinker->purgeable_pages;
> > > +	total_pages = shrinker->shrinkable_pages + shrinker-
> > > >purgeable_pages;
> > > +	populated_tts = shrinker->populated_tts;
> > >  	read_unlock(&shrinker->lock);
> > >  
> > > +	/*
> > > +	 * Update our preferred vmscan batch size for the next
> > > pass.
> > > +	 * Our rough guess for an effective batch size is twice
> > > the average
> > > +	 * number of pages per GEM object. That is, we don't want
> > > the
> > > +	 * shrinker to fire until the request is large enough to
> > > justify
> > > +	 * the overhead of freeing at least one GEM object.
> > > +	 *
> > > +	 * Base the average on the full shrinkable + purgeable
> > > population
> > > +	 * (total_pages), not on num_pages, which is reduced to
> > > just the
> > > +	 * purgeable pages whenever the gfp mask disallows backup
> > > (can_backup
> > > +	 * false). Otherwise the estimate would systematically
> > > undershoot in
> > > +	 * exactly the GFP_NOFS / GFP_NOIO reclaim paths where
> > > avoiding
> > > +	 * excessive scan_objects() calls matters most.
> > > +	 */
> > > +	if (populated_tts) {
> > > +		unsigned long avg = 2 * total_pages /
> > > populated_tts;
> > > +
> > > +		shrinker->shrink->batch =
> > > +			max((shrinker->shrink->batch + avg) >> 1,
> > > +			    128UL /* default SHRINK_BATCH */);
> > 
> > I think 128UL should be at least whatever TTM pool batch is?
> 
> Again, we should not use this to attempt to prioritize between
> shrinkers. Just to ensure that we give a fair estimate of the actual
> batch size.
> 
> Thanks,
> Thomas
> 
> 
> > 
> > Matt
> > 
> > > +	}
> > > +
> > >  	return num_pages ? num_pages : SHRINK_EMPTY;
> > >  }
> > >  
> > > -- 
> > > 2.55.0
> > > 
