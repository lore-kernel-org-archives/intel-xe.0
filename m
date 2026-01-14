Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6B8D38FE4
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 16:23:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2080510E617;
	Wed, 14 Jan 2026 16:23:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g4dS2Kmt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD4D10E619
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768407786; x=1799943786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BYO67mX5EruqBWEtmXnUwpnhK4jcUulciODsOIAbY80=;
 b=g4dS2KmtDMIzz/JVDGiDjrQC8L2TC56/V9TNhIgA6nlRbHNlRqQEOCBU
 AQDAGmo9O1qH31EbbrcYLJu+GK12z4Isl0DMizSOr5SCfpZyyFBSPdFT1
 IGZ1iq9siE978w8KvlXa5Gqp/9DZGvBt/rIXo9zKdMvP9OaGq1hVulr+7
 9UbqscawAHXWV8ulqiVO0qhcPcvKNVdIPr82ugYEhVgZWTCqo8K5T+OCG
 lt8ZL2UqdqTfcYkxJywcy61u0+m0xG0Qmi6u1tboogPfgOtzL4UH6A3pg
 X2TAoG/YVDbL8vdmZYB983prT6lHZGPGvI4FyooYb0FakUsyEvyWmvPDE g==;
X-CSE-ConnectionGUID: kF8fKkugSMKhuQRzVVWIuQ==
X-CSE-MsgGUID: QA+W9RuVQD2pI/BXbnBg+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73551559"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="73551559"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:23:05 -0800
X-CSE-ConnectionGUID: ZDm6mTchQ1+SgNpJGKyMTg==
X-CSE-MsgGUID: C+LwXmGYRIS+Zu/kSBTvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204611133"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 08:23:05 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:23:05 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 08:23:05 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 08:23:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mMQXrixWsYbRtBsSTYfHlmCS701YNpZM4zbZxClp4NihW3Ld+YRBN0LHHh/SILbxKaTCJhALQMdyZfAR6mocqSJ9RSabEiWCfhvfPGhSrF8LXGIvVl+oS1nqXUHWmmOWRy26qds5S9im07u96ia5y8fKpIja6APtj3nQzsy+QpcgOkrhC3JUFpj6+BiJDIp97cAp8cHnv0OsQEn4ERxtJcr0LBMbB/jIS+hu58avaELkSfDVOnLmFfr6R+tEiIFac8+3fuBbqKGb4z6a3oJLLUmiifOomEb7Q2nsZWiQ6NM+BYLS1wiTBKEM0BEWflesVjkxx4ffOn1Wc8LpeWSfUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQqJ/1+cIJEzdbVbIiPUkw4hFCnSCCy5ZZrjIQ4vMvc=;
 b=qX5gDkViP9m8GTuc636XLj/zwK88ekxtT7VpRmh5buQvNI8vIW3xLCP5IOPHmwJit2WzLHrGCkQt5aVa6Hxl83/lMP48Pun3xPxTxqf+P+bb/R1KtABiJPDaTPwEJ9zfA1Pd8TJVyDwbSowiTkkbaupzPaNRWR2rdUwGCWALFzs6LbRUwx9wR0UW1syevraLRNno3FOJTdwWPNsI2yQpXYjlTkF/NDZ/b/PoHbHTpvBPrhBGQu7XIhrgQDiUcXNbhHq2H8mu2UPzgHPXUbyBgahDO3bJqCV3xfD8QZAPMg9pD1cR0RwDFGKFmDNQPZqqS0LicINOoKSUipI5myEkAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Wed, 14 Jan
 2026 16:22:59 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 16:22:59 +0000
Date: Wed, 14 Jan 2026 08:22:56 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 00/79] Cleanup unused headers reported by clangd
Message-ID: <20260114162256.GD458813@mdroper-desk1.amr.corp.intel.com>
References: <20260113230315.3081153-81-matthew.d.roper@intel.com>
 <aWbe/6D9Fvmg9rzi@lstrano-desk.jf.intel.com>
 <20260114003608.GF458797@mdroper-desk1.amr.corp.intel.com>
 <aWcRi7SOBeZYQB/r@lstrano-desk.jf.intel.com>
 <aWcjgZ3zA-xPlexC@black.igk.intel.com>
 <aWcqm1/R9ZQNOca/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aWcqm1/R9ZQNOca/@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR01CA0069.prod.exchangelabs.com (2603:10b6:a03:94::46)
 To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 337af428-57d9-4b08-0b93-08de53892e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yZyM4QG5HQ7XezV2ap1dhRs7YPFpVwJ24a3XEDQT8E0m4Q7+E3CLOTW9B6zw?=
 =?us-ascii?Q?6+DOmkgMOAwQNH15pFNhwm1oiPmHDY1k0dkKAHfKzGKIEX5UjXBy/TAWNsFS?=
 =?us-ascii?Q?Mw2UiGBqLVeBD372HnIIejsTWmafdtNBc2/D84CCRHP3synHhCLzTeZtRDlQ?=
 =?us-ascii?Q?K+LP9OcJeHtWR6gdtcBwpCMeAKlIObpJrxOtWDKMSePMbTZKz3Tk1bLrZ/iI?=
 =?us-ascii?Q?fsPWveeBkDC8uhNeIwpr5Wo1Ya+x4ClN/Z5FSkYd2Epxb1THkGZHatPIXzKx?=
 =?us-ascii?Q?I4KL11bTvnB1Cwc/+/rOsyrQ7lTC9ew2zGUBjW6w3EmIee3Y+77PmdqJ/F3t?=
 =?us-ascii?Q?8mmmrGFiqAWs8D/y3ciew0CUILYgiDUhOu9JgyhcHAf6kxaFA4cBiINLE7Ov?=
 =?us-ascii?Q?cEZUXHbFiYR/U7fFv5yZuSLzPJLY+00Z3GnFNtN/05k2jHI4dU6VuQGT8ifA?=
 =?us-ascii?Q?/jTkWb50gU9tnPtew89VdZQAMJhcKaJaa5qiwXKbIFIsIe/D3gLsVPqFw+JQ?=
 =?us-ascii?Q?2tIAsxDp0WxX9mDoXDhqcoHEiZqeB/ml/mq7rf9Q0HXswvy/3Bq9bUKITZKL?=
 =?us-ascii?Q?0LeLFlZE+dBTOalSZ6hVZ5c+oib1PtO7fctrQ+q+1zUejFn23WozwTo0nM27?=
 =?us-ascii?Q?H6Eomy5Eec0COVrrU+uSWP5ZyAt/FMxBOgWLp71jsUfOawDUj/HLPqm+kJ9+?=
 =?us-ascii?Q?/s8oIqOJ0dzObAO/bg1mYMRLaF2oNvRuMBLmAdwDvaOmMNPm6Zg1fyN7rkK3?=
 =?us-ascii?Q?jeWoRT5/SPJXppLzkvbuou+CwID2SaUizojUuk3t0D2eiroi8UbxAds069WK?=
 =?us-ascii?Q?N+nEqh8R6kjTt3+CUCufF0+6LnYwfxlU6CdMzWROUDDnxbp0KQ5XX4ok/AhT?=
 =?us-ascii?Q?Iz8t/wsDeP6qO347b40rnMUez48TCM/WNtOhKTAOVZKdv21HCTR8RrHtXpV/?=
 =?us-ascii?Q?qsWbLzW77GB+xgie4H4ItNi2WvspvMU5Cie3Ukn8yb1yr5ED3knLcxsnd7yy?=
 =?us-ascii?Q?6sVlarGfn8YQi3P8sEaPsJ03oeRY1WRoIMKMHiQWsN5TnrRYLokP1ET7g/Jq?=
 =?us-ascii?Q?J7GEs3JTzvueJVYwByNkc/s22IZxyEGVaaRKbXxN1jijxr8nqbR6T9doASVj?=
 =?us-ascii?Q?UZkanHHm2ZZlN4cnbNABkWXyg5IqncR8msGPJO7u5pYMf1fn7I88Dw126kBl?=
 =?us-ascii?Q?LPS5xHs939RubVzdtBOh/QBZsfmF0yAUNHqjWAmy69XysM7EwGuad3qKxhUX?=
 =?us-ascii?Q?nJDwZUMtXAfRgktZ2mFQtTvJ6gHcvbw6Xn+9iQsUN05ShFXuk5I72t5kE0zL?=
 =?us-ascii?Q?RFA06b6EGbClnfRme3zRugjlRU1ceBp0875ybhc6mJPvd9xI34XraK73F/wA?=
 =?us-ascii?Q?uCfT3iPlHhRiFbSOYW54GFKO0GDf6e2xnICdTioWz2uj2D0Ft0TWq13B3rY7?=
 =?us-ascii?Q?J2e5FKtE/vTmng3QkazopFTY64w2Z5w/O2nVmWYpHm44Ol+Hqs9R2jynXeAV?=
 =?us-ascii?Q?Bc8hkH6SpKULLqAOiCaU8+OSinWea9KSWjHV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eZ76+VXR3Xo4yt4D0qX+hYN57aOGmUsXh75XVs4TGkD5yPaz5Uh6pgGYW+8n?=
 =?us-ascii?Q?LygU+mhjtfp69hoyfFNWlO66Qiob2Na4//Dn4BjYf+YYtYgH8R6naFub0dRp?=
 =?us-ascii?Q?cQibDnzjt5piiwjLVENoMKK0eV002ZYGksnpys4oqM2UBXRGxMxGYYILKEMt?=
 =?us-ascii?Q?b9VveSNXvzvKwN72j2sNnp1rIiQrcxlK2luEwcKZNaBfiGPqdvP/NDIpxfEK?=
 =?us-ascii?Q?B/al0fIHjPuza2wWH0xlGKU2KaLI6D27kvu1xeeXqvbBKSW4y60FmMFqlX24?=
 =?us-ascii?Q?uVU07GUaa5h9++K4mAm6AB1WFtYNJDoN7fFMGU+X9AVmufZbYoclwmCidzV0?=
 =?us-ascii?Q?Kh47ebn14RYW18fd0ZXT8AF9RtF9EZX1kKXitl7Sq6Y3jAzgfEZ3qmVtNrbp?=
 =?us-ascii?Q?Y/4MnDLSWRDMkbTBzb8fDG4frar95PbsyJ+T2ttYsNX/R0f83k0qI51alwrn?=
 =?us-ascii?Q?3u46sjlguEug2vO1hQL2dJm5Um3BNA76MbgmXzCcGTEkHMuxMfKiETe4cuwi?=
 =?us-ascii?Q?t1UOYGrbDwCqr2QmJcgpdBcHVrpItyoolfRGqcLvZBol5QklctqShlqjQC0A?=
 =?us-ascii?Q?MK7yXTqN3cs36cf/DzO7TBZQ2Ze1NS+Wq+ZQffwOaGSF+/WplY212p1aMnVV?=
 =?us-ascii?Q?TFxvbG4GmuZjYWGqRVQq6TYFjdC2x6laihfZoHPFQIxapk44hg1m791J16of?=
 =?us-ascii?Q?IUOHmYEE0Dv2+vF8Ww8f+NKnGgL0dd6lqDgwUNtpBce4epNZlwC7ri2O3Txd?=
 =?us-ascii?Q?e71s9LMeTpQ0RGAG7bfRbBBf5JQKQP0FUHRuXgqzgosP1m4Fdd55/GVDVHjq?=
 =?us-ascii?Q?HFEGuf0L7CQryFuQ3zk41YvtrxhcYa8Rwml6liRr9m/oiqS2UqvpbBDPYzfG?=
 =?us-ascii?Q?n6t+5dP+9hAzrm0KfdWpGmaz+VSFYhtQnRD7egJEU5RueSxPZKhoB8qV2YyP?=
 =?us-ascii?Q?dzIPmcefVr+KUFhpMqIfnWHbOWsRX6DxbXOE2Uhf6RpdH/3oekUpXZ4uwpaD?=
 =?us-ascii?Q?sgv//jz16CWwKLD+Qv+cEAZBCv1fqD8V9M6EONruvvBt0cgRDBVFVEHo8d51?=
 =?us-ascii?Q?EBelOsPEJ4VMddklHyc2pHDMrr8msWBol8/zdDFUrk3iMGJKRpoxYoilP/aF?=
 =?us-ascii?Q?Calz4GZ/YObvPZvMjbOp51h9ikHqCiWZ6amvarbdOcFiixy3OAgsZPdIVcjl?=
 =?us-ascii?Q?+nMkuqou3k2W2s72Wk6QTjHBGURU8kjrMDEPpGWsJzSwKIawMqTe0AQihWMO?=
 =?us-ascii?Q?UkCtRDURfYKDRHlKy3zaFlpgMOoheU+2owfxHa0BZag9lKjcEWiTloxRbCSR?=
 =?us-ascii?Q?zJUwZ7nLRdatufJ1oOLvJZLslyw1EPc2gW5b/cP5VhdSXHNw2dW48ygPe95V?=
 =?us-ascii?Q?Dla+ViQaCQ6lO1IJCuFkHVrBSxEYZHUbbfU2RDyNGsFlJ9fsVSHjxJ6kEq4g?=
 =?us-ascii?Q?veMgjPQdTValG48/NDb4mIW3yRybATN90SJVdL5QMj7nit1Ld8WkY0ws2Jmo?=
 =?us-ascii?Q?tnQ7+S+hK9yKejvCys+3seuRMCZPkBeOrcUeZcoueLy9+qWBOwTVy2YDSKrp?=
 =?us-ascii?Q?PldtEdWzoKnvHHdFtm2F+gb+dQHt/81hs4woxGucubFyLZI30CGZEdZFUloZ?=
 =?us-ascii?Q?HYfh3oQBD54shyi44i9LdH1WTo+GChJ9mpMecilKMXyIU160JtP12YOKcWEY?=
 =?us-ascii?Q?WyJbk7qXiaJ2ap8PUMqW8UzaymtpenRKGQhHA+EsPBK4Xo0I842Eb9UHwGAn?=
 =?us-ascii?Q?VRCaI3P0/JH3rwDb7DZ061GRBucnvY4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 337af428-57d9-4b08-0b93-08de53892e54
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 16:22:58.9762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCcpbwZDhGkQ1nmUjSKPrXyPZNI8BpthDYOS5mdE8w+4wCetAdGCTFSu9fEj5r4rsr5qhJUGXDSo0ksCqT9nZoGhTEhkQEhyoXF/rp0GdLs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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

On Tue, Jan 13, 2026 at 09:33:15PM -0800, Matthew Brost wrote:
> On Wed, Jan 14, 2026 at 06:02:57AM +0100, Raag Jadav wrote:
> > On Tue, Jan 13, 2026 at 07:46:19PM -0800, Matthew Brost wrote:
> > > On Tue, Jan 13, 2026 at 04:36:08PM -0800, Matt Roper wrote:
> > > > On Tue, Jan 13, 2026 at 04:10:39PM -0800, Matthew Brost wrote:
> > > > > On Tue, Jan 13, 2026 at 03:03:05PM -0800, Matt Roper wrote:
> > > > > > clangd[1] helpfully flags #include's of headers that aren't being
> > > > > > directly used by the file including them.  In most cases we can either
> > > > > > drop those #include statements or replace them with a more targeted
> > > > > > include (such as xe_gt.h to xe_gt_types.h).  Let's drop/simplify a bunch
> > > > > > of the unnecessary includes in our driver's .c files; this may help
> > > > > > speed up partial rebuilds for developers since the build system won't
> > > > > > see as many false dependencies.
> > > > > > 
> > > > > 
> > > > > Yes, header situation isn't great.
> > > > > 
> > > > > > There's more header-related cleanup that could be done (e.g., some of
> > > > > > our headers incorrectly include other headers they don't need), but that
> > > > > > can wait for a follow-up series; this one is already long enough.
> > > > > > 
> > > > > > 
> > > > > > [1] https://clangd.llvm.org/
> > > > > > 
> > > > > 
> > > > > Once we get the headers into better shape can we get clangd in CI?
> > > > > Without that a year from we will need another huge series of fixes to
> > > > > undo all the mistakes we've made in the last year.
> > > > 
> > > > clangd is a language server intended to talk to plugins in editors
> > > > (e.g., I just set it up in neovim); I don't think clangd specifically
> > > > can be used in a CI-like setup.  However clang-tidy is a standalone lint
> > > > tool that I think could be configured to print out the same kinds of
> > > > warnings (the "misc-include-cleaner" check seems to be the one for this
> > > > case), although I haven't tried it myself.
> > > > 
> > > 
> > > Ok - for the series:
> > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > I'd personaly prefer this squashed into one patch as 79 patches is a
> > > lot, maybe Rodrigo, Thomas, Dave, and Sima have a different preference?
> > 
> > Our CI doesn't test for other archs and we might risk breaking upstream
> > builds.
> > 
> 
> That's a good point which I didn't consider. I believe there are lists
> which will pick up other archs / kernel test robot though. I do think
> the risk is quite low of breaking other builds though given these are Xe
> related clean ups - once you start messing with core header that have
> platform defines it gets risker. Also if we break something - not say we
> should aim for that - community will step in and send us fix.

Yeah, I don't think we need to worry about other architectures breaking
too much since there really isn't much/any code in xe_*.c that's #if'd
on an architecture condition. The more likely place we could make
mistakes and get breakage would be Xe's own config options.  I.e.,
something along the lines of

        #include "xe_foo.h"

        #if IS_ENABLED(CONFIG_XE_SOME_FEATURE)
                ...
                xe_foo_bar();
                ...
        #endif

where things in xe_foo.h are only used if the config option is set and
both CI and the developer's local build don't have it set, leading to an
incorrect removal of the #include.  Fortunately even that case should be
pretty rare since we try to avoid mid-file #if's in Xe.  Wherever
possible we move the preprocessor condition into the header so that the
.c file calls the function unconditionally and the header either makes
'xe_foo' a no-op stub or a function declaration.  I kept an eye out for
any mistakes of this sort this while working on these patches and didn't
see any such cases where the header is only needed by a rarely-used #if
block, but it's possible I could have missed something.  An
'allyesconfig' should catch any mistakes though, and I think there are
some robots that run that pretty regularly.


Matt

> 
> Matt 
> 
> > I tried to dive[1] into some core headers but the situation seems
> > impossible now. So fully agree, better to clean-up before the debt
> > piles up.
> > 
> > [1] https://lore.kernel.org/dri-devel/2342b516-2c6e-42e5-b4f4-579b280823ba@app.fastmail.com/
> > 
> > Raag
> > 
> > > > > > Matt Roper (79):
> > > > > >   drm/xe: Cleanup headers in xe_bb.c
> > > > > >   drm/xe: Drop unused header in xe_bo.c
> > > > > >   drm/xe: Cleanup headers in xe_devcoredump.c
> > > > > >   drm/xe: Drop unused header in xe_device.c
> > > > > >   drm/xe: Drop unused header in xe_exec.c
> > > > > >   drm/xe: Cleanup headers in xe_execlist.c
> > > > > >   drm/xe: Drop unused headers in xe_exec_queue.c
> > > > > >   drm/xe: Simplify headers in xe_ggtt.c
> > > > > >   drm/xe: Cleanup headers in xe_gsc_debugfs.c
> > > > > >   drm/xe: Simplify header in xe_gsc_proxy.c
> > > > > >   drm/xe: Drop unused headers in xe_gsc_submit.c
> > > > > >   drm/xe: Drop unused headers in xe_gt.c
> > > > > >   drm/xe: Cleanup headers in xe_gt_clock.c
> > > > > >   drm/xe: Drop unused header in xe_gt_debugfs.c
> > > > > >   drm/xe: Drop unused header in xe_gt_idle.c
> > > > > >   drm/xe: Drop unused header in xe_gt_mcr.c
> > > > > >   drm/xe: Drop unused headers in xe_gt_sriov_pf_config.c
> > > > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_debugfs.c
> > > > > >   drm/xe: Simplify header in xe_gt_sriov_pf_migration.c
> > > > > >   drm/xe: Drop unused header in xe_gt_sriov_pf_policy.c
> > > > > >   drm/xe: Cleanup headers in xe_gt_sriov_pf_service.c
> > > > > >   drm/xe: Drop unused header in xe_gt_sriov_vf.c
> > > > > >   drm/xe: Simplify header in xe_gt_stats.c
> > > > > >   drm/xe: Simplify header in xe_gt_sysfs.c
> > > > > >   drm/xe: Simplify header in xe_gt_throttle.c
> > > > > >   drm/xe: Drop unused headers in xe_guc_ads.c
> > > > > >   drm/xe: Drop unused header in xe_guc_buf.c
> > > > > >   drm/xe: Cleanup headers in xe_guc_capture.c
> > > > > >   drm/xe: Cleanup headers in xe_guc_debugfs.c
> > > > > >   drm/xe: Simplify headers in xe_guc_hwconfig.c
> > > > > >   drm/xe: Simplify header in xe_guc_log.c
> > > > > >   drm/xe: Cleanup headers in xe_guc_relay.c
> > > > > >   drm/xe: Drop unused headers in xe_guc_submit.c
> > > > > >   drm/xe: Drop unused header in xe_heci_gsc.c
> > > > > >   drm/xe: Drop unused header in xe_huc.c
> > > > > >   drm/xe: Clean up headers in xe_huc_debugfs.c
> > > > > >   drm/xe: Drop unused header in xe_hw_engine.c
> > > > > >   drm/xe: Simplify include in xe_hw_engine_class_sysfs.c
> > > > > >   drm/xe: Simplify include in xe_hw_engine_group.c
> > > > > >   drm/xe: Cleanup headers in xe_hw_fence.c
> > > > > >   drm/xe: Cleanup headers in xe_i2c.c
> > > > > >   drm/xe: Drop unused header in xe_irq.c
> > > > > >   drm/xe: Drop unused headers in xe_memirq.c
> > > > > >   drm/xe: Drop unused headers in xe_mmio.c
> > > > > >   drm/xe: Drop unused headers in xe_mocs.c
> > > > > >   drm/xe: Simplify include in xe_module.c
> > > > > >   drm/xe: Drop unused header in xe_nvm.c
> > > > > >   drm/xe: Drop unused headers in xe_page_reclaim.c
> > > > > >   drm/xe: Drop unused header in xe_pci.c
> > > > > >   drm/xe: Simplify include in xe_psmi.c
> > > > > >   drm/xe: Drop unused header in xe_pxp.c
> > > > > >   drm/xe: Simplify header in xe_pxp_debugfs.c
> > > > > >   drm/xe: Cleanup headers in xe_reg_sr.c
> > > > > >   drm/xe: Drop unused headers in xe_reg_whitelist.c
> > > > > >   drm/xe: Cleanup headers in xe_ring_ops.c
> > > > > >   drm/xe: Drop unused header in xe_rtp.c
> > > > > >   drm/xe: Simplify header in xe_sa.c
> > > > > >   drm/xe: Simplify header in xe_sched_job.c
> > > > > >   drm/xe: Drop unused header in xe_sriov_packet.c
> > > > > >   drm/xe: Drop unused header in xe_sriov_pf_debugfs.c
> > > > > >   drm/xe: Drop unused header in xe_sriov_vf.c
> > > > > >   drm/xe: Cleanup headers in xe_step.c
> > > > > >   drm/xe: Drop unused header in xe_survivability_mode.c
> > > > > >   drm/xe: Cleanup headers in xe_tile.c
> > > > > >   drm/xe: Cleanup headers in xe_tlb_inval.c
> > > > > >   drm/xe: Drop unused header in xe_ttm_stolen_mgr.c
> > > > > >   drm/xe: Drop unused header in xe_ttm_sys_mgr.c
> > > > > >   drm/xe: Drop unused header in xe_ttm_vram_mgr.c
> > > > > >   drm/xe: Drop unused headers in xe_uc.c
> > > > > >   drm/xe: Cleanup headers in xe_uc_debugfs.c
> > > > > >   drm/xe: Simplify header in xe_uc_fw.c
> > > > > >   drm/xe: Drop unused header in xe_validation.c
> > > > > >   drm/xe: Drop unused header in xe_vm.c
> > > > > >   drm/xe: Drop unused headers in xe_vram.c
> > > > > >   drm/xe: Drop unused header in xe_vram_freq.c
> > > > > >   drm/xe: Drop unused header in xe_vsec.c
> > > > > >   drm/xe: Simplify header in xe_wa.c
> > > > > >   drm/xe: Drop unused header in xe_wait_user_fence.c
> > > > > >   drm/xe: Simplify header in xe_wopcm.c
> > > > > > 
> > > > > >  drivers/gpu/drm/xe/tests/xe_bo.c              | 1 +
> > > > > >  drivers/gpu/drm/xe/xe_bb.c                    | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_bo.c                    | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_devcoredump.c           | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_device.c                | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_exec.c                  | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_exec_queue.c            | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_execlist.c              | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_ggtt.c                  | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_gsc_debugfs.c           | 5 ++---
> > > > > >  drivers/gpu/drm/xe/xe_gsc_proxy.c             | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_gsc_submit.c            | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_gt.c                    | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_gt_clock.c              | 6 +-----
> > > > > >  drivers/gpu/drm/xe/xe_gt_debugfs.c            | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_idle.c               | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_mcr.c                | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c    | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 5 ++---
> > > > > >  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_gt_stats.c              | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_gt_sysfs.c              | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_gt_throttle.c           | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_guc_ads.c               | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_guc_buf.c               | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_guc_capture.c           | 5 +----
> > > > > >  drivers/gpu/drm/xe/xe_guc_debugfs.c           | 5 ++---
> > > > > >  drivers/gpu/drm/xe/xe_guc_hwconfig.c          | 4 ++--
> > > > > >  drivers/gpu/drm/xe/xe_guc_log.c               | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_guc_relay.c             | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_guc_submit.c            | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_heci_gsc.c              | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_huc.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_huc_debugfs.c           | 5 ++---
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine.c             | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_hw_engine_group.c       | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_hw_fence.c              | 4 +---
> > > > > >  drivers/gpu/drm/xe/xe_i2c.c                   | 4 ++--
> > > > > >  drivers/gpu/drm/xe/xe_irq.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_memirq.c                | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_mmio.c                  | 4 ----
> > > > > >  drivers/gpu/drm/xe/xe_mocs.c                  | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_module.c                | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_nvm.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c          | 4 ----
> > > > > >  drivers/gpu/drm/xe/xe_pci.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_psmi.c                  | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_pxp.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_pxp_debugfs.c           | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_reg_sr.c                | 5 +----
> > > > > >  drivers/gpu/drm/xe/xe_reg_whitelist.c         | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_ring_ops.c              | 4 +---
> > > > > >  drivers/gpu/drm/xe/xe_rtp.c                   | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_sa.c                    | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_sched_job.c             | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_sriov_packet.c          | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_sriov_pf_debugfs.c      | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_sriov_vf.c              | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_step.c                  | 3 ++-
> > > > > >  drivers/gpu/drm/xe/xe_survivability_mode.c    | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_tile.c                  | 3 +--
> > > > > >  drivers/gpu/drm/xe/xe_tlb_inval.c             | 7 ++-----
> > > > > >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_ttm_sys_mgr.c           | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_uc.c                    | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_uc_debugfs.c            | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_uc_fw.c                 | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_validation.c            | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_vm.c                    | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_vram.c                  | 2 --
> > > > > >  drivers/gpu/drm/xe/xe_vram_freq.c             | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_vsec.c                  | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_wa.c                    | 2 +-
> > > > > >  drivers/gpu/drm/xe/xe_wait_user_fence.c       | 1 -
> > > > > >  drivers/gpu/drm/xe/xe_wopcm.c                 | 2 +-
> > > > > >  80 files changed, 45 insertions(+), 129 deletions(-)
> > > > > > 
> > > > > > -- 
> > > > > > 2.52.0
> > > > > > 
> > > > 
> > > > -- 
> > > > Matt Roper
> > > > Graphics Software Engineer
> > > > Linux GPU Platform Enablement
> > > > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
