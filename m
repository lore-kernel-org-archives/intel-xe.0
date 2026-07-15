Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3C2C44501
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jul 2026 07:54:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F190510EF32;
	Wed, 15 Jul 2026 07:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLma/ds1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222ED10EF2C
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jul 2026 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784102094; x=1815638094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=he6R4ZBRKku16Z7wSRvHviTOVkDSXRzzeslNmzjtAWc=;
 b=iLma/ds1MwEbE2LeUN5M7orkgm72vCItn7SbuM2LXu9rt5d706bvGjxl
 BCdgbMZJZkia+0b7tLi6IC3BqVmjUAnUe6KLf+o9rJBsisSXJ99yIIHOs
 0YTZ5OcneYsdXPQJeNfSUVheYGgyJcSfMiShfkmwmqUWPNx1BCbURrZeX
 AjPOtJ7/bbRMOxHaMChGBDn7EbgQgw5VIwLFmdfjy862wGuKHx0bpfRhz
 tHXIlWBRnUshzXToOGGKazipRob2TmwGP61dn+BEYp7cjZcwc2sUMQrTT
 ciy41QZmHvfapbosOgdB7WQw6dwavIsqUNUmS7UcItFkUPf9li//p3jyr w==;
X-CSE-ConnectionGUID: s7aJgIrsRM6PVP1J7pduEw==
X-CSE-MsgGUID: kwAW1zBQSG2DSyA5ZujEPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="102155433"
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="102155433"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 00:54:54 -0700
X-CSE-ConnectionGUID: Fc7Cq2DeQcCwReF6ElyklQ==
X-CSE-MsgGUID: pqmMJU0KTN2k2Zq9toDhHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,165,1779174000"; d="scan'208";a="279389323"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 00:54:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 00:54:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 15 Jul 2026 00:54:53 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 15 Jul 2026 00:54:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWHxPKyRi/Lp0LX3pBb3uHTM7LqZwIELjIRcFe9Z+DavGqmvRwPn25bpB3SNp5uBV7UJ+yloo1Rn4dnH1YPl6WUBYD9T9XRfc1yS6d9gqPjE+G4tZUPKF8vy+3lQ6nx5SzWZmsIzZI1Hi/JjyM8W5v7GUzDs96qEVILtMQh27FSQ35ZAhasb4vl0mRe/3MXFr4GIlf7WqdTbQFyo8dyWBoWslrRr0DW2OmVYDfktDlfNfyZVBqIsY+7uWgbrcHoZkKxB6xBPzJZysJBlvR6DOce9PSnTueA6HJSwH/V2Z7qYEYcicnmi7M22wXErBPzm99RHAAVtHqoPwG8w6cPIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJoJ0Drq4GGPeT+dyHUwVh3p3vRtZ2EHJeBUXnXvdVE=;
 b=pp4L6/X12Mpx39GHtrYU5TiFlVX6Jv8ThWgqBaNcQ1WaTlI+OKXVieho4uPcgIBNrgYtDHCJQALZbiexoGa+DHZiA4awH5cj/Rtel/IywKAn9onhvWVUgqglob5oThlHs0RmJZXsA7RrsKkORflSQ/I8v3guwUOXwdKWloKi90xVFOrzdRFewfBCUywVXk5f7pjyHa8Es7kzX6ff8o2Ujl6qNYFzHTQ9p5wspNGcdT7XEfBptr/jt9QUlhk1ADsIFvYGFhWUdlCOtLlArzHu0h7u0gqBF06RTEqqHWfr/Y1nH2phnNpEJ57jpHtADE56SRyNK0zu+BOfPRCKIPBlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB7178.namprd11.prod.outlook.com (2603:10b6:610:143::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Wed, 15 Jul
 2026 07:54:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0223.008; Wed, 15 Jul 2026
 07:54:49 +0000
Date: Wed, 15 Jul 2026 00:54:47 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: "Yadav, Arvind" <arvind.yadav@intel.com>,
 <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Keep scheduler timeline name alive
Message-ID: <alc8x/nLLb+L/aFK@gsse-cloud1.jf.intel.com>
References: <20260714064402.2457257-1-arvind.yadav@intel.com>
 <3f103d7b-3a58-4c3d-a4d7-e413e7b92e47@ursulin.net>
 <13aa91ef-452d-411d-9bb5-0ca43ea169da@intel.com>
 <ba1420ef-26df-413a-8554-b60f470b9344@ursulin.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba1420ef-26df-413a-8554-b60f470b9344@ursulin.net>
X-ClientProxiedBy: MW4PR03CA0194.namprd03.prod.outlook.com
 (2603:10b6:303:b8::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: d2bc244d-ecb6-449e-b4aa-08dee246588d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|22082099003|18002099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 7DFomGucIdcx3TTYR/Lc5oZ81FhtHw4yvTuQ3yAg/07aXJonFL3+uv90ZAjie/iKAmze0/yjOUSwjuCjCq27SJefzAOH7Kc4Xep2rgE6a7jOcO/KENwnmqsS1kUG2losGIssPIDLzkfSaIIJgRt0mNXT2acRbHhzeo9KWybkN0XZegH/JUMMMbvbiE8lv1AfJveDGE8FnaZVfpDzQ5Df43+mRwPFrMVIOYBNQMaP27ICgCXCp/aldrOUAxIH2CKdSJGL2ZAA/8GFTGnNvXURh08OaUSziq7zLMm5at2SKauM0VtBOEIdLJyAVh9zEtxCfN+3Co3F/UKBXoJcs2JHQAwDyzio15Lej4vc8Y1KGCoXh8sz0mHIKvYEXV4guCgc+zQEZ6RF8kvxKdsc5t6WsE2mXqv4yqXsYrcmdQrL/66AZghT6ID6lR0YjRaqPFyDON9joWDWJnnD/0jTVb5OfWmpMJUHBMae5SV47+V1gBJK11P4LjLJ911yiSZcOkAa837In+eJgG9fkoRqzUdU2R8r53MIVAVxq51ik6rCQUS9Xtj/TyzWuV7SBUqVlQv7r6ywNwHqMjLjZd8iGqgJ+MyCo2pXyTIoXBBgHmtulUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(22082099003)(18002099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?gv3d5WBBfXqIKOAFeIuxGEb1x8yNpH823BGtorQHQ6SqwrIrZHegcLMm7p?=
 =?iso-8859-1?Q?NGAA0j/f1UFydCL0IiC5mGRfX1pbL6AsQ7Amjs5MM1A+/ZMTpgCEB6IfeI?=
 =?iso-8859-1?Q?td6I/lQxRxmPWsRSqzuIqCQ7QDzKCfKZ8Jqgi73qGO0+JTC1eI+2ggB6KR?=
 =?iso-8859-1?Q?LywY47DWVuMrWui0PplKxZyu2gGmCK1pd0JImo+90kz3nxT5LUUsqZHCwc?=
 =?iso-8859-1?Q?1VT/6CisFgPjSjaZJ4szB99gNwTk+0k21/maFOfhQPa4Oedj5Obutfavlk?=
 =?iso-8859-1?Q?laOWJQmRWo2FJPyYADDjWHHOd177LtYkaNGW4LqGKOEnJafyhPBQyAzH47?=
 =?iso-8859-1?Q?3k0dPSWi02DMbKLBhrabUEUZuU8IbTEbGPuy+zORHfKh+4mDjuHJcra/gd?=
 =?iso-8859-1?Q?H8IH+t/MJZ1ezVMbB5Xiew7Hz0hd6h9aTyjhQ4w8HR+J7QhytMbvsdnygh?=
 =?iso-8859-1?Q?LDAQq7dlKW1TX9gkZbcR/MgY630cXJ2YGllDNsTOB1xdRGAP+Tp/xi0zx3?=
 =?iso-8859-1?Q?KHEeo1ncsgpqv3LIC/LJPchJPW5cqyWbQVmSXyAJecEepAEV4gNZGcvNbk?=
 =?iso-8859-1?Q?Al79HBvHrAFGXgY8wWExioyqdqQTr/Qf3uPGY41AXlaZ79OXjuYTPcI1zn?=
 =?iso-8859-1?Q?9aIm/WsyUaUZudnYtJIwu3hyMqR4X2ihwxn1h39XQLaZ7qBzGu9ZtbiDVL?=
 =?iso-8859-1?Q?P8VWpPicaBe0v0g67dmrSoJg3K+bserG+c27MysOb5JskcxQZBdF/gphCF?=
 =?iso-8859-1?Q?2Yf5378GeQ+4ySEx6N78NoGD5Cvssa9TkpuokUIugGXA2Y9J6szQNmh4Jw?=
 =?iso-8859-1?Q?9tMqIlOyWm02ij6dbV70jI5riYUsofiUggjZDFIE7avblKU1PEbjuAKZkm?=
 =?iso-8859-1?Q?4nNdbgJtbQVffyLf+ztmFMEtCwkIOhK6lC41+TeJfB06wpcsj2xdKdil3Q?=
 =?iso-8859-1?Q?RU+GOM5Fq3Aekv+y+ofcqoKNHP3k1k5oPBImWn30TmiX9s81vtl2ONqONR?=
 =?iso-8859-1?Q?L2dUu9Po48nW6cTy/6LbTA9TihKmRYZziYiRnwVFrbz58sNJ8wMWuhtFLn?=
 =?iso-8859-1?Q?ul937LWKyUdQc8W/ZRibC3rhWOvkY+2zlOHnAbI+ovH8jJctebKLgcVndn?=
 =?iso-8859-1?Q?yIqWxOhrOE/mujzc89/H9LHv7KIYEGAGd17W5kkMQ0r4Agl9uJ4peNKiW+?=
 =?iso-8859-1?Q?zfgs2gY+XnvBffOf/oo0g53z81iKpiyF+Do6yBlPPFox/DXnRNXDna79fW?=
 =?iso-8859-1?Q?9M2wx4L5QgIlYgmSi4RpyryHImZez8IRx2E8zOkM4n6VfpuYnnzRkJLoII?=
 =?iso-8859-1?Q?UYVIpaxy/kNbIssoe0S3CM07aEG5BWO25cV8QEea2rW4E8xWzVgPziiWUl?=
 =?iso-8859-1?Q?EppaSB7g/imvikci5zU4CI7LqeAR4M8waLzTg965c7sjJHxk8sWNrZ+imX?=
 =?iso-8859-1?Q?F+HFpVdZPOQYit2uOiIi1Bl3TcZZyx8hWrBuSFrjH9cabyeLfiTJnvkCYD?=
 =?iso-8859-1?Q?IovSTogPSCADZAfq+YABRfHRSZaFxjh83nCwYqALghMP3jbog21Fy9QaOo?=
 =?iso-8859-1?Q?iunSaA4VZiN8OwTXhcKoaKCx0WjkvakXBemSguJKc9YReijohVJYCc7Cqq?=
 =?iso-8859-1?Q?8hFvBqMCDimfrgNApna97mexlvmPsF72UDYbyfn9Oq5NftDyQnaDw6KF+7?=
 =?iso-8859-1?Q?cTY5UuBnZhj/lHsh9YXm9jpExFH12mulgqyl4pvXac/L21QiGiRYuM5T3a?=
 =?iso-8859-1?Q?vDdnqb6+oBdLh0UgOJgLENO970d9/CrfdmyboAHzaLFyP0TWMqCHEv9z6a?=
 =?iso-8859-1?Q?JW7pnoZL0g=3D=3D?=
X-Exchange-RoutingPolicyChecked: mNbwP5gWvxiXTIguZkp1T0T7Yhe/3mNb/JiVp/BrcisJ87KXG5O1BdEskIIu9tJcMV4L5F7krVw1c4ce23JIj6ETR7cIZRkDaYER42BQvNEbwTdYOnDBxgv1e0xkkL5fPGZi3dW0GC98e/ObjzkEVM5l6FSkb6vBUdEqaVkwumF8/IlrPKddqBkKWg7ihh0uezUMvTDeT7bcIFdXfvKJljx5MydRxWyLEYTvarU0226OUbCIZggmNtN5aQTq3S8LNssrt7pzexIU3P4yYl3p00BYPIdgrGv5jDA1T+9ac6ZUBafr+1ntfkDL+xnJ1As6MPD5gLefX7P1mLxoLeQzBQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d2bc244d-ecb6-449e-b4aa-08dee246588d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 07:54:49.6208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tV+hCm3k76UmJFgU3uDj83gsQadpilt1zVgG+/Dl4SVoROyFtbd8OZQRtK22jGSZx4oBUJmTJfXVtJLqGss7JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7178
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

On Wed, Jul 15, 2026 at 08:49:00AM +0100, Tvrtko Ursulin wrote:
> 
> On 15/07/2026 05:26, Yadav, Arvind wrote:
> > 
> > On 14-07-2026 15:02, Tvrtko Ursulin wrote:
> > > 
> > > On 14/07/2026 07:44, Arvind Yadav wrote:
> > > > The scheduler keeps a pointer to the timeline name, but q->name
> > > > is freed with the exec queue while scheduler fences can still
> > > > reference it.
> > > > 
> > > > Store the name in struct xe_guc_exec_queue so it shares
> > > > the scheduler's RCU-deferred lifetime.
> > > > 
> > > > Fixes: 6bd90e700b42 ("drm/xe: Make dma-fences compliant with the
> > > > safe access rules")
> > > 
> > > Feel free to copy me if I broke something, or even fixed it
> > > incompletely. :)
> > > 
> > > It is curious since I had an IGT which confirmed the fix was
> > > effective by dereferencing the timeline.
> > > 
> > > At the time of the above commit:
> > > 
> > > __guc_exec_queue_process_msg_cleanup
> > >   __guc_exec_queue_fini
> > >     guc_exec_queue_fini_async
> > >     ...
> > >         xe_sched_entity_fini
> > >         xe_sched_fini
> > >         kfree_rcu ge
> > >         xe_exec_queue_fini q
> > >           __xe_exec_queue_free
> > >            kfree q
> > > 
> > > 
> > > Now:
> > > 
> > > __guc_exec_queue_process_msg_cleanup
> > >   __guc_exec_queue_destroy
> > >     guc_exec_queue_destroy_async
> > >       __guc_exec_queue_destroy_async
> > >         xe_exec_queue_fini
> > >       __xe_exec_queue_fini
> > >             guc_exec_queue_fini
> > >             ...
> > >               xe_sched_entity_fini
> > >               xe_sched_fini
> > >               kfree_rcu ge
> > >       __xe_exec_queue_free
> > >               kfree q
> > > 
> > > Looks functionally identical.
> > > 
> > > AFAIR the problem actually was:
> > > 
> > > drm_sched_fence_get_timeline_name()
> > >   return (const char *)fence->sched->name;
> > > 
> > > Where fence->sched is drm sched, aka "ge" from the above flow.
> > > 
> > > And that has kfree_rcu in the today's code base too. So no issue
> > > with the sched pointer itself.
> > > 
> > > What about sched->name ie. q->name? It is only free after the
> > > scheduler is freed, so after the RCU grace, and if scheduler itself
> > > is unreachable then sched->name is surely unreachable too.
> > > 
> > > What am I missing? Could you provide some details on where and how
> > > this crashes?
> > > 
> > Thanks Tvrtko,
> > 
> > The gap is in the lifetime of sched->name, not fence->sched.
> > drm_sched_init() stores the name as a pointer. it does not copy it.
> > Today that pointer refers to q->name, which is embedded in struct
> > xe_exec_queue.
> > 
> > The teardown order is:
> >          kfree_rcu(ge)    // scheduler remains valid until the RCU grace
> > period
> >          kfree(q)         // q->name is freed immediately
> > 
> > So during the RCU grace period, fence->sched is still valid, but fence-
> > >sched->name points into the already freed q. The patch moves the name
> > storage into ge, so the scheduler and its name share the same RCU-
> > deferred lifetime.
> 
> With a fresh pair of eyes, this definitely looks obviously true. But it is
> really odd KASAN did not spot this back then. It was easily spotting the
> fence->sched dereference and then with kfree_rcu it was completely happy.
> Odd so sorry for the noise.
> 
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

I seem to remember bringing this up before, but I also remember it
getting lost in the convoluted reasoning.

Tvrtko's nit aside below:

Acked-by: Matthew Brost <matthew.brost@intel.com>

> 
> Just one comment below:
> 
> > this issue is pointed by sashiko -: https://sashiko.dev/#/
> > patchset/20260713042530.2108459-1-arvind.yadav%40intel.com
> > 
> > Regards,
> > Arvind
> > 
> > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_guc_exec_queue_types.h | 5 +++++
> > > >   drivers/gpu/drm/xe/xe_guc_submit.c           | 4 +++-
> > > >   2 files changed, 8 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > b/drivers/ gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > index e5e53b421f29..cda14d954e57 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_exec_queue_types.h
> > > > @@ -10,6 +10,7 @@
> > > >   #include <linux/workqueue.h>
> > > >     #include "xe_gpu_scheduler_types.h"
> > > > +#include "xe_hw_fence_types.h"
> > > >     struct dma_fence;
> > > >   struct xe_exec_queue;
> > > > @@ -24,6 +25,10 @@ struct xe_guc_exec_queue {
> > > >       struct rcu_head rcu;
> > > >       /** @sched: GPU scheduler for this xe_exec_queue */
> > > >       struct xe_gpu_scheduler sched;
> > > > +    /**
> > > > +     * @name: Scheduler timeline name, kept with @sched until RCU free.
> 
> Strictly speaking it's not the name that is specifically kept but the whole
> struct, so maybe drop the ", kept with..." part?
> 
> Regards,
> 
> Tvrtko
> 
> > > > +     */
> > > > +    char name[MAX_FENCE_NAME_LEN];
> > > >       /** @entity: Scheduler entity for this xe_exec_queue */
> > > >       struct xe_sched_entity entity;
> > > >       /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > b/drivers/gpu/drm/xe/ xe_guc_submit.c
> > > > index cec3bbf3a10e..8ef6eeebfaa8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > > @@ -1978,6 +1978,8 @@ static int guc_exec_queue_init(struct
> > > > xe_exec_queue *q)
> > > >         xe_exec_queue_assign_name(q, q->guc->id);
> > > >   +    strscpy(ge->name, q->name, sizeof(ge->name));
> > > > +
> > > >       /*
> > > >        * Use primary queue's submit_wq for all secondary queues of a
> > > >        * multi queue group. This serialization avoids any locking around
> > > > @@ -1992,7 +1994,7 @@ static int guc_exec_queue_init(struct
> > > > xe_exec_queue *q)
> > > >       err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> > > >                   submit_wq, xe_lrc_ring_size() /
> > > > MAX_JOB_SIZE_BYTES, 64,
> > > >                   timeout, guc_to_gt(guc)->ordered_wq, NULL,
> > > > -                q->name, gt_to_xe(q->gt)->drm.dev);
> > > > +                ge->name, gt_to_xe(q->gt)->drm.dev);
> > > >       if (err)
> > > >           goto err_release_id;
> > > 
> 
