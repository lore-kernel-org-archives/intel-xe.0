Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357ADC021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 19:22:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB2510E7A7;
	Tue, 25 Feb 2025 19:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcXlI4Dd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB7E10E7A7
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Feb 2025 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740511358; x=1772047358;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=aw01Pq2zuv7JGQ4Vup2SEC/zfNvDPR0ebUTPuBUH1Yc=;
 b=lcXlI4DdBHgVODBOPZxfikjcPE4FnEQITSdNe0XaMFlXGDAipzUPJhJH
 cHDb8wqtGp3dwrZN95o5dbOJOwItOcmZZnaqRuZ2Tl/Z+4i+cdmXjyP3/
 fLRD6rEh8DBJ8naX8iVJKga3PDAtTOc23TsPQVNtmj9ljAiCmoAcUzdOT
 zn2wqXeMZ3MJU6Qu8xsgRmLbKuGE+eHlKsPHTKC+k5f83Zb5JFo8GI2vU
 xhLb06uGqsGKqgsb+4vuRT8WMK+JpqRpB0unVVT8Xa9EifUySDM3yjT3A
 HVWCYfV1Vk9tyH6jzVpF5YhztQXlgB42SRmn5J+zk2zUHcwUcJLkHOGH+ A==;
X-CSE-ConnectionGUID: fnXmk4S/TpCcGe3X9aqnyQ==
X-CSE-MsgGUID: Myez8ZZ8TxiYUglxZnLVTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="51550668"
X-IronPort-AV: E=Sophos;i="6.13,314,1732608000"; d="scan'208";a="51550668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:22:26 -0800
X-CSE-ConnectionGUID: 0VSxZ78YQHeco5wo5wbDiA==
X-CSE-MsgGUID: lHUQf6pmQTu2UTgha7qLZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116339145"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 11:22:27 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Feb 2025 11:22:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Feb 2025 11:22:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Feb 2025 11:22:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZtQHuBN6x2Plx+Q1KPGPXhmzKNfLie/FW0dCB4Ita/Cdk6j3ZSNoxdwVBwbnjVV2jGpqpHsHYpDTggfJ8ce+rdsbfTHKA21YPOMDg+5lC40tUDfjlwnkvHNRWhc1bBKqOxtJ8sgn8Y5ZoL+9yXTfUs1r//rBXZnkPnaSgkE9UGnj2nuaM4dwi4m5/RAu58yEBkRYllZIC9uXkX1syt5AvOoYUVuKmUukCDsS1zSlY5tPqyfo4KRiFZgyLGQUPkWe6a2olvwlWbuamlIIQZ8qjEqOsXQkYr2hTmtfAH0Dzv/BLTVOcu7KbjqIarLqiRTvYJEbppHi3ekdD/Hf7Jn1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Lu1T17MAYn2NiYeg0+BDRSAxsehBLGtmvyae0KkBpM=;
 b=eFY4Z+ydVxqgsITaEHzYWuQdcsVhHHDR5ZVnjuQeVOQEiJ42mb1ck7MpCbITtitPpRBlqEtS6UL3q7Yk202hcQhUpCmUtsYjwfkkCyaDQHdLm8Pz5l7iiyHMPDIsVf3Ck/jGmq4tIIIUhOJdPUe1oUkZ85NT58D/naaJ6C164SobungXx4LkPZknl2DbfrLxFX2JsU+OosvkoNLS/TGtzMt3QFC84RGvEmUChh+EujjTykINRUyqPNEbpjIuK/Z1teUVQIl/8m+wiuXqpmM/FoAcJeG2+RfFN3E89uaaNw9xcPkbG/gPv/sE64xeD0QSBNvIpH2CtiTWIv7p+nm3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Tue, 25 Feb
 2025 19:22:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 19:22:22 +0000
Date: Tue, 25 Feb 2025 11:23:26 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v4 1/2] drm/xe: Userptr invalidation race with binds fixes
Message-ID: <Z74Yrv/yHUyooxHW@lstrano-desk.jf.intel.com>
References: <20250224170109.3078314-1-matthew.brost@intel.com>
 <20250224170109.3078314-2-matthew.brost@intel.com>
 <7c58c04c73e217e5cdcb473876b368c47b60bc6f.camel@linux.intel.com>
 <Z74Bo0no06PmV87O@lstrano-desk.jf.intel.com>
 <4267074055afdb298914de6658b64f89e55136c5.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4267074055afdb298914de6658b64f89e55136c5.camel@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:303:b5::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: ef849a2d-f28e-4112-916d-08dd55d1baa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?1t5JAZ1BGIA4083w988EcDtRcmd/wtXK4xW0pQ+muMiOm9oEVvpvhN/dvN?=
 =?iso-8859-1?Q?X0D3O6Txg6oEKZ6Q7P7Hmh3WsmuPkkOE0J3J0l3Mx7q4f7A1N1Mu3n1wKE?=
 =?iso-8859-1?Q?moysdoXKJIy8lfqkguWh3lXpFltoxkyuLgehRwisB5ctdyhCGmMcqSq02I?=
 =?iso-8859-1?Q?1DDotlAsGtNVl9Utd3jBJhVjIe0CzckIFr7YoNPKqrQmTOLqrthiEng/4P?=
 =?iso-8859-1?Q?/LBxbcerqhOTThRByPivcPypbu/M/GG4MWx/T7c6p2QC5xb9WQEU41P4pk?=
 =?iso-8859-1?Q?iXievTtqDGTXCHtsZe9Q+VLOqL+TNtppDT8bQET0McGj3GLm8gMLjzFW1e?=
 =?iso-8859-1?Q?ff2gC/dLoIQYV/XDfRZYgdPwvtgEjIdqzvSlPCUrbScX0PnjqaVoaOUsH/?=
 =?iso-8859-1?Q?e72MzfOTDisAn0ecytyAb17YtuxUnNJfvn2g57QKo44xdnqDA2eZFKwG0/?=
 =?iso-8859-1?Q?jISTsCy5xQwrrf77uRliucZ2cZq855D4w6f4itGSUAEjfhUHbhpSWGqNCw?=
 =?iso-8859-1?Q?3A4/5Br4z/MZoD8uSb4MIrzGfokKNjOztFU53kfq224HPLSn+r51ki31Gq?=
 =?iso-8859-1?Q?mmW2PuadYkmJ24ytjBm2XkDS+7sqw1Gd6maavUG6Kze1sQYDtY6erLdr1s?=
 =?iso-8859-1?Q?rdlRjXYMtcp3MKjl1pO2AJwdMi1OgDjPwxJDkv8Ay144bmayqFA43xK5+r?=
 =?iso-8859-1?Q?xxNxvnnBNW5vT13Yqp409ioZzVZyPNDao8E2omtnEu3xAKZB42LYaxFdfx?=
 =?iso-8859-1?Q?tBfyKIsyLoTpSwlfHyftECXMosmrJ1TOqNHQcBNCooK0QOR+5X6MNKEi/3?=
 =?iso-8859-1?Q?TOVN9332vYa2LvzUcIL8sXkHP7rseLNHRykiEaa7TZaZvrf3pludpwhycT?=
 =?iso-8859-1?Q?cNMKZ0kY5owfXkoyvXnMpzP67jjOkzbMW3QHiR4kAaHT4tDQ26XluZ095r?=
 =?iso-8859-1?Q?7HSpGfVCT0qbfVEl7hgFLDGu3tnlL2GbutJ+/3p+zi49w6rxMeeafXRpST?=
 =?iso-8859-1?Q?wT31OfeORVPts1isQVNPhcg/p7Pa22c3r8OOS8osT2zMaATj1E1m+Pnzto?=
 =?iso-8859-1?Q?4z13NrtPKNBYkfdmomH6EcCmYVzuhN2DfjWyYo96ArPFScID63oaPnpiRJ?=
 =?iso-8859-1?Q?3JFoC1tU8wurdk4ZTbzhYeGxSy5euKbxiAwfjtjY2qSsunqQQ7PS6CxbCN?=
 =?iso-8859-1?Q?Pdy2Mvm5uNAJ1Y/oZfJDM8YrZiCigQunlei7iM4hsO1CFRog2nxtUsU2Mn?=
 =?iso-8859-1?Q?OCifRmJe+DVjB9WsvOYRvzJMbUHkOHnqtZ12UolbvffoO9RjxP9/txhg6S?=
 =?iso-8859-1?Q?JdwlMvlXSDuEPB6TM61aAaQSaBWslRO3/NrwKlM6nhcHvgh9GhIrB5HIGd?=
 =?iso-8859-1?Q?PyQKENKPxJw7D5CvA9qYOsLUEU68H6Lg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Ee39mxjVM7FhYpyGBbzjNKCk/jB6Q8ZxwvDCo2LCJ1B32helMHP7TZiaOc?=
 =?iso-8859-1?Q?yBHBa9LnRwwNOyzpAMEFi4ESYw5zdh3yzjAu+z0rmo/aipgNczoGVKqn4i?=
 =?iso-8859-1?Q?a84rbumSykygWN5Odki6HjJi26rlveoN6UsdROQq0ZPtot7sNGo4Dw7tGf?=
 =?iso-8859-1?Q?thaRaKvdHF8JlPKwY4EWz0J0AoGFTaPJXZBZOHjL5qvh93XW67Mjd97oV5?=
 =?iso-8859-1?Q?VW96DMegGFosTAZfsJMkNqp/PYfa1iTPfV9FHBSDNg1y+2+ymBO8ymQeyW?=
 =?iso-8859-1?Q?a4MvohSdNuQ2Vor09SRKUdnLnFoNVIjkzsR4Q9ojSG06D2HYQFyLVftet5?=
 =?iso-8859-1?Q?RS3kgEU9nhE59D67TcQp/bFKmsyy3Mnsfh1KJ1Y4Ws8RMd9MvKG0fkGGIW?=
 =?iso-8859-1?Q?lQMDKMQnc91X8sJ8r8ucAnjEUTh+HdUjmAtF+pDIHHul1fD5vMpklt/IbT?=
 =?iso-8859-1?Q?mwe3CZXOjGm4lTBhV0tf5w5kDYTj2e7rpWwM8k7/QW+/fQcrv95kiMBtgW?=
 =?iso-8859-1?Q?8933SXJCSM79je17qUugOIP4536FenxFgFogcbq2Rk1nlxaoZw/8rrc3gE?=
 =?iso-8859-1?Q?K7KqMZ6xNiQICrF7MLgTBIA50ZsL142h2aJUOXpJYqZe5OgC78+Di/I6nH?=
 =?iso-8859-1?Q?5AVtP67Z99S43qrAKDLd5mr05DzLaYBludEUE5ElsWOTZIYNdelSqmMWvc?=
 =?iso-8859-1?Q?d986MAW7RJQLS23BpaGN+KF3DcauhW/ORUA+DeER+pcAiZecb4FHWXrMVV?=
 =?iso-8859-1?Q?hTZu8v/8UoyYUlCPpgZhtOanwVBqazLip+dCDUW70zadXTtfNDi1DvMwBb?=
 =?iso-8859-1?Q?72WBQM877RCTKWQaFzHMP5hdjcGVG7fUwfmreKC3aSBLRy+pEmDY7nVx+R?=
 =?iso-8859-1?Q?JiIrM41WimQLLW4UXCSRYw0w0h9C64IRbsg059Jpg+VooV7JRc6ac+QCZp?=
 =?iso-8859-1?Q?8bREmB/xSEuIX1d0Aa/3AYz47KE7tD1niG+zT24sjQcJdWczR7ZhvZ73ea?=
 =?iso-8859-1?Q?fuhUAW6gyReLFODVPOIL/IPeXCKym5IAUj+X6M0dkhyiBb45wMlBjKYdYI?=
 =?iso-8859-1?Q?1SQOWvGmnDZZMkUa2PYWuWh6NpNlzJpxeB23p9BPlyEp3eF41bd02hgYCn?=
 =?iso-8859-1?Q?oeLVGym19ROq+4xmKY64L3hLCipx5+20Nbk2mIRKAOwpAiWfUW1sNPIRrg?=
 =?iso-8859-1?Q?R3qPbzvgjgAlyrymnHzMyxmh/OTKc/aBY0y/63Vi5Ui+41E4PzjpPCzAv7?=
 =?iso-8859-1?Q?Oukr77lSadJlBzA+4DrViYwI6Se+jl7JN2lTsTx8RY1QuXq6HsSqbtdtAQ?=
 =?iso-8859-1?Q?AjCoRcVfEmmOQo3GDK+DxcT3wl6HZMtAgFVWNpMbcGC3f5MgTohWFIX5Zv?=
 =?iso-8859-1?Q?Nw0pH+meJMrXmZ6AxkO7qtmbxv+wX+fy9rXRr0TeS75PwMRQWiIowqNG9z?=
 =?iso-8859-1?Q?lElnbkEmtXCqswnK7FLzRGHm+qXUqj8ypVxTl2qrJy1hQtcHgP1EJ4H9hm?=
 =?iso-8859-1?Q?rvROQuDgq6DYFqWcZj18R5mUw3L/AqedYXkNY3w39jFJ2YjphX7mgh+yeX?=
 =?iso-8859-1?Q?N7JORjdOtZP7QLv+R71zcRkWXxkaz8rZHiZxlbuuoPS/ux1WAA+Sv4OFKq?=
 =?iso-8859-1?Q?fMry2hV1+o7dSYRpxIAUNgBuPzdVmd++Xl2MBA6NZtxbydLc6n2dQeyQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef849a2d-f28e-4112-916d-08dd55d1baa7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 19:22:22.6104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAU1IlD0xfGUMMPaZxb8aTK1MsqsMSWA9mAVF918PgZ41thBceORFnbeMACU/eGqjAz/Pg0p0S7YIKygd5mIoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
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

On Tue, Feb 25, 2025 at 07:56:36PM +0100, Thomas Hellström wrote:
> On Tue, 2025-02-25 at 09:45 -0800, Matthew Brost wrote:
> > On Tue, Feb 25, 2025 at 03:30:54PM +0100, Thomas Hellström wrote:
> > > Hi, Matt,
> > > 
> > > On Mon, 2025-02-24 at 09:01 -0800, Matthew Brost wrote:
> > > > Always wait on dma-resv bookkeep slots if userptr invalidation
> > > > has
> > > > raced
> > > > with a bind ensuring PTEs temporally setup to invalidated pages
> > > > are
> > > > never accessed.
> > > > 
> > > > Fixup initial bind handling always add VMAs to invalidation list
> > > > and
> > > > wait dma-resv bookkeep slots.
> > > > 
> > > > Always hold notifier across TLB invalidation in notifier to
> > > > prevent a
> > > > UAF if an unbind races.
> > > > 
> > > > Including all of the above changes for Fixes patch in hopes of an
> > > > easier
> > > > backport which fix a single patch.
> > > > 
> > > > v2:
> > > >  - Wait dma-resv bookkeep before issuing PTE zap (Thomas)
> > > >  - Support scratch page on invalidation (Thomas)
> > > > v3:
> > > >  - Drop clear of PTEs (Thomas)
> > > 
> > > This was what I actually meant.
> > > 
> > 
> > Ok, I presented this as option and it wasn't clear to me this was
> > preferred.
> 
> Well, I think the more special cases we can get rid of in the code, the

Sure, not opposed this direction.

> better? Or at least, like in this case, split out what's common with
> the vm notifier into an xe_vm function and call that, making it more
> clear to the reader that we force an invalidation.
> 
> > 
> > > https://patchwork.freedesktop.org/patch/639489/?series=145409&rev=1
> > > 
> > 
> > This patch is doesn't work.
> > xe_vm.munmap-style-unbind-userptr-one-partial hangs due the error
> > injection always firing on a single user bind, so we'd have to fix
> > the
> > error injection too.
> 
> I have a follow up patch that splits out a part of the notifier like
> described above and calls that for each inject, also invalidating the
> userptr's seqno, and that fixes the above problem, but then the code
> hangs in 
>

Ok, that sounds good.
 
> xe_exec_fault_mode --r once-userptr-prefetch
> 
> but that's a different failure mode. Apparently the prefetch code
> doesn't repin an invalid userptr and returns -EAGAIN forever...
> 

I see the issue, we only call xe_vma_userptr_pin_pages in new_vma which
the prefetch code bypasses. If the error inject messes with userptr
seqno it makes sense this would start to show up. I suppose this needs
fixing too.

Matt 

> /Thomas
> 
> 
> 
> > 
> > Matt
> >  
> > > /Thomas
> > > 
> > > > v4:
> > > >  - Remove double dma-resv wait
> > > > 
> > > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: e8babb280b5e ("drm/xe: Convert multiple bind ops into
> > > > single
> > > > job")
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c | 21 ++++++++++++---------
> > > >  drivers/gpu/drm/xe/xe_vm.c |  4 ++--
> > > >  2 files changed, 14 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c
> > > > index 1ddcc7e79a93..ffd23c3564c5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -1215,9 +1215,6 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	uvma = to_userptr_vma(vma);
> > > >  	notifier_seq = uvma->userptr.notifier_seq;
> > > >  
> > > > -	if (uvma->userptr.initial_bind &&
> > > > !xe_vm_in_fault_mode(vm))
> > > > -		return 0;
> > > > -
> > > >  	if (!mmu_interval_read_retry(&uvma->userptr.notifier,
> > > >  				     notifier_seq) &&
> > > >  	    !xe_pt_userptr_inject_eagain(uvma))
> > > > @@ -1226,6 +1223,8 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm,
> > > > struct xe_vma *vma,
> > > >  	if (xe_vm_in_fault_mode(vm)) {
> > > >  		return -EAGAIN;
> > > >  	} else {
> > > > +		long err;
> > > > +
> > > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > >  		list_move_tail(&uvma->userptr.invalidate_link,
> > > >  			       &vm->userptr.invalidated);
> > > > @@ -1234,19 +1233,23 @@ static int vma_check_userptr(struct xe_vm
> > > > *vm, struct xe_vma *vma,
> > > >  		if (xe_vm_in_preempt_fence_mode(vm)) {
> > > >  			struct dma_resv_iter cursor;
> > > >  			struct dma_fence *fence;
> > > > -			long err;
> > > >  
> > > >  			dma_resv_iter_begin(&cursor,
> > > > xe_vm_resv(vm),
> > > >  					   
> > > > DMA_RESV_USAGE_BOOKKEEP);
> > > >  			dma_resv_for_each_fence_unlocked(&cursor
> > > > ,
> > > > fence)
> > > >  				dma_fence_enable_sw_signaling(fe
> > > > nce)
> > > > ;
> > > >  			dma_resv_iter_end(&cursor);
> > > > -
> > > > -			err =
> > > > dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > -						   
> > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > -						    false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > -			XE_WARN_ON(err <= 0);
> > > >  		}
> > > > +
> > > > +		/*
> > > > +		 * We are temporally installing PTEs pointing to
> > > > invalidated
> > > > +		 * pages, ensure VM is idle to avoid data
> > > > corruption. PTEs fixed
> > > > +		 * up upon next exec or in rebind worker.
> > > > +		 */
> > > > +		err = dma_resv_wait_timeout(xe_vm_resv(vm),
> > > > +					   
> > > > DMA_RESV_USAGE_BOOKKEEP,
> > > > +					    false,
> > > > MAX_SCHEDULE_TIMEOUT);
> > > > +		XE_WARN_ON(err <= 0);
> > > >  	}
> > > >  
> > > >  	return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > > > b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 996000f2424e..9b2acb069a77 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -623,8 +623,6 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > >  	}
> > > >  
> > > > -	up_write(&vm->userptr.notifier_lock);
> > > > -
> > > >  	/*
> > > >  	 * Preempt fences turn into schedule disables, pipeline
> > > > these.
> > > >  	 * Note that even in fault mode, we need to wait for
> > > > binds
> > > > and
> > > > @@ -647,6 +645,8 @@ static bool vma_userptr_invalidate(struct
> > > > mmu_interval_notifier *mni,
> > > >  		XE_WARN_ON(err);
> > > >  	}
> > > >  
> > > > +	up_write(&vm->userptr.notifier_lock);
> > > > +
> > > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > > >  
> > > >  	return true;
> > > 
> 
