Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2245C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 16:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3F7E10E46C;
	Tue, 23 May 2023 16:39:04 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8D2E10E46C
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684859941; x=1716395941;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OIZeVFd3nbvf4DGRAgpWEAcg1ggMBvYp4JGt8Q60wuU=;
 b=Xp71VkHcEuS/eCotZDoIb19lO3eHHblYbuxKi1J13zIh2FJ/5AE14sBd
 BlHunWpE+pDnrNAxGZrwn0nsLHg+mQLWmftSuvcun/OGt/GTXyhMQS8+6
 TSlF6dzy6EiaPN72BLNDrmBnamLC+1jKoFNp06UcF2g66T7uSuxaYrFvR
 mUEFanf6coskr1sg1rXUqJ/+m/kMFUzNzJByJiP2BYxHtS8q/02bE/Ghh
 xCsI8gHtizaw2eK+IWN7MPKY8I6e3Di+001wI41weoWrUeYXFwX8nEv9z
 lZaP9T3jphFSVLdHsGTXaNPTt3QYWgNnooP5a5Wvh9puu7vLoZf+3daOZ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="332913031"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="332913031"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 09:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="816203628"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="816203628"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 23 May 2023 09:38:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 09:38:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 09:38:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 09:38:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iGbXoMPKHhiqxl6ORrPMoojAEV1jFYmGrCHpgtjfiB9B0vPfbWGdl3uewI4JDDYA60rCSdd92E47Wid6zeYuppCzr7cpNYcjPCf1eO46F6JWY+lXQhhhlgdhK4OI69D5FerA7t/YQlOE1C5Hh+yYOUgb/uNSbO35otd9EcIHOLUuvvOmwn2/FtxEjIm9DX1weotLTuTW4oDh2HZefrBPrcT2/okpXQAm1lKXCuoEUzoLl6uman75247lkT/h+lCW74/ahbrtrH4sQTrpHMYP91Mk8XMXdLnPFjDDbE3zqgtgl4lCoPXRABiu3nSa5Naik1qsl4Ok93EPBKtwIf8paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J49qeTro2lHJ1h4GDHIWlSv1yCvZRf0QRqcjxJrsJZ0=;
 b=YLqFrTMmUX/pRRcG/hy6R+OQWJKfN/32HRLjW59aDYt18DE5yGKfOnr5LMe+zMbycdIXUlhu5V0QIF/EUfM3+KmZ9Je9aRGZHFlkxmatmQ7+b7dDv07QaDaY/RWUW3QVzd39EkmF6f3ZrWRDUY8xqtrSRJe0tl5Ponc9Q+9jwrIKkaypkzJDgyyTRCvnrrQVeZRCYD8m9GdLCw5+0iBanZ4cE/LlbsdDDxV39TbtXxjeOZ/91870NZJOO7gYs4DWOuI5R/6+yySyRts0VH0WKPP3mcQd3gSsdvRvTMNPX9FdoHlNr+aSxEwzu1pToQsoBNbCqCLUeQxzbAFBHZGLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CY8PR11MB7924.namprd11.prod.outlook.com (2603:10b6:930:7a::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Tue, 23 May 2023 16:38:54 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::9f98:8f3c:a608:8396%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 16:38:53 +0000
Date: Tue, 23 May 2023 09:38:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY5PR16CA0003.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::16) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CY8PR11MB7924:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c071d71-7efc-4043-b7f1-08db5bac31ae
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+pGdKe8zXOkrpIczOJMcRSQ4bsYDDUE9SPWjmeg3sL9RjsUaUsMtGLSjVLmg/vZpE0My0Ixt9UP5k44sM8JvtCZgXG+Igi1YsJePmo1Yb+r5Fu5R4yioOE62HgTu8n6C3fcosv3h0ipFPttHDCJWeSZOAyvsxCXlOvx5OWWfXvRLYdZUdVmQS8dNIUDCiAc3SlyUugnW/Ls2CBVgKcUI83vs62YetEqJNgl9GbN8oZhcS+DXjF2kSxMX+JBMNsC4w+9b87nuH29DLCkeE9onSWph4ImvcDCgerVs5vh/+KDdHnBXOPQGjth39UVIOlUSDSZ2mna8fqBcN7Y71e55g3Ah0RAPFJykm4t8MI3QihE57eYCDouDZsZs1TViU8m0a/4YHxausICVb4JVF+XUDky6nIkBblUuKdYUtIVdvK405f+7jckekSKePE2xxxGc4rta8hF0aT9Gh1JapWeNl7LQAqL3OV3gB1psa9QXz3hYCZ+LuVh63BuhmkxqXEI0JnmluhWRHceauk2bEMHQ60ftN2XJG00pMsISCRdboM5sxG6Jjk68sKYdUMyamm+4vzlY8IwnTIvoEVraCjtaon6yY63fE2MeHv0cT6etbI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199021)(82960400001)(478600001)(83380400001)(4326008)(66556008)(66946007)(66476007)(6636002)(54906003)(38100700002)(66574015)(316002)(6666004)(41300700001)(6486002)(86362001)(5660300002)(30864003)(2906002)(8676002)(8936002)(6862004)(6506007)(6512007)(26005)(1076003)(33656002)(186003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?S0E0IMOHCLisEzGH0ZCuJJ8hVpzKo50ZysOaPNP162DDPhrILtCq79/r47?=
 =?iso-8859-1?Q?ADZfOE5NNNlhEEV4dhEfc6MUEzH9de8t3/ptfYiS7UQdZflX7q0hSW6R8x?=
 =?iso-8859-1?Q?xYhIVfuYVGI6HiRRSvxeNXQitu1IwaXbhwDID4Fnh4LZNeoMWOeereRbbg?=
 =?iso-8859-1?Q?Fiw8Z3X30L8ShEmWCvEo5YZ+0KttbXtsb8O6/xVDDf2+WidZoIxoGmH+CG?=
 =?iso-8859-1?Q?yQOAUveo5n838ErBUm5LHA2MkjULWfXPe2744N8p/9/YM2XAi/78Hfh7sZ?=
 =?iso-8859-1?Q?pnI/loFrKDeCbKdExqnOt0TaDjHcMEVFBixSzJr1AaL5LYXMyhuLP+/ZA5?=
 =?iso-8859-1?Q?MKLnKhpb12T1SVajM0lpW7zWd6F1la+FghqCpQ6/WwtHWn9gBd9teKDbcj?=
 =?iso-8859-1?Q?+LEU0HZTZKA9hznLGbyJ/La7OwYwnj3p3llgpfvkHFGhCd3o55ckGeciVz?=
 =?iso-8859-1?Q?iGnjW/VECC6vOXndRYv0ZTsFmLyYk+1rlCrz2c+7di7Wol4q9IMARlC/6e?=
 =?iso-8859-1?Q?FCtPChN9goFKAAgHllNlhcWuy/iU/ZWE9WefZXy5OOlvtxi2Bjt8rmDW+P?=
 =?iso-8859-1?Q?df2piu2CEkxgNGIKpj1e2FE38PJkELS4PUkhPzh5bbIGv6TXj1F9bJ0xqy?=
 =?iso-8859-1?Q?FhKTY4RjhGSswEws5Ds1TkVCdVc5DLBoE+y0mQTV1HPEwf1QNaHfyjoONb?=
 =?iso-8859-1?Q?A7y1LOORty3pqyoXGlFGdRJW9rvzhe9Zw8R2U71ZJYjTwD5We7zrmXGTlZ?=
 =?iso-8859-1?Q?6QErx4l1syWz7ofsj9d1NfRptPnzNJy1bSIlXLBjZDyABIDSI1V0wDsBMU?=
 =?iso-8859-1?Q?bjdCD+D+mAjX4PT9bNkLDEgX8U1v/1Mls4il+GMNufONfgaQYWrpzFvJRx?=
 =?iso-8859-1?Q?Pf6sAxZNldzITZeKE9a1C9OXEUe8W4ktpfjmDL1t/OieK4Nz8vBOiwkaNX?=
 =?iso-8859-1?Q?/y25z3wpwct0kS2JkThdYa1fo6PwgrQ87UrRxdbu0dAYhbzvuMwXG50TS6?=
 =?iso-8859-1?Q?okTO/ds/QEb+9kESlkDBI6rySh+NKdKseZifvaC92gjCnkF6i5+0fvc6wO?=
 =?iso-8859-1?Q?eZhs4Oqv00iSjDR8BCE+JGjd0aghtxBFAk9vYqzWT3Wyj1jmnE5Bu+Pyzq?=
 =?iso-8859-1?Q?APaQt4bpPRlxcfGkv6tTIYvvH0ZyHGKlUPvP/v2f8yDI85nDDqbCrtbac8?=
 =?iso-8859-1?Q?/XYXNL1N60Ipc88m9fl4iGno8WmMy6B7qrC8lYUVE0fcl4xRCmOM4yKkru?=
 =?iso-8859-1?Q?wLyC8XMi8VDu0wpoIWXMoY2ldLHiwji26OwQmlPUDQAgVGAj1BaWzhnkJF?=
 =?iso-8859-1?Q?Fi9VINjISnIuiAbSUAVmmOw0NphuOPSOrZPalBU9eh01Afoy78nXQsrM9U?=
 =?iso-8859-1?Q?aplW5NwN70t/YfKYor0N3huXNVdRkHCUMwc35nAx/zfzDPPC/Cpb9NA5Tf?=
 =?iso-8859-1?Q?//ELFCN7SeQ9bNUct5zfMk44E+AprYRRpLHl6K5jjim8+tLxbsC2IO/9MZ?=
 =?iso-8859-1?Q?0UQ6tc6qNcvuGS0CzLeCOF7Pmms9jgGNIJ8gk5QXrI6ULWVfdl5PGqlsRz?=
 =?iso-8859-1?Q?rgeJREFzPpoD5ZY8sEk3pHqlYcYROXkaV35U1AqtZEGtz3o2x+Z8wj3s2i?=
 =?iso-8859-1?Q?0IMULxo18WIMmbMW1Q31i8DvRX44UgV/tR4CtvBjpBpx5vP9gZ1Pl7ZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c071d71-7efc-4043-b7f1-08db5bac31ae
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 16:38:53.2389 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KzushxD3n4QdFmvJqE/ECfb55l41w2wThQsbB1RrxHQQl+FFrVsfnc0VSD9b1mWkya/1Yk7MXIXO4ZJVehQjL6GyQ2X/weV0WZ5//1MlNU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7924
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC] drm/xe: A minimal assert for some forcewake
 domain on xe_mmio.
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lucas
 De Marchi <lucas.demarchi@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > It is the maximum protection we can do with the current infrastructure.
> > > 
> > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > ---
> > > 
> > > 
> > > RFC
> > > ===
> > > 
> > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > Xe than anything else.
> > > 
> > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > 
> > > With that approach we had few historical issues iirc:
> > > 
> > > 1. Display performance with vblank evasion that requested uncore to provide
> > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > the name suggests).
> > 
> > In i915 there were more differences between fw and non-fw variants
> > of register functions than just forcewake handling:
> > 
> >  * _fw() functions assumed that the caller was already holding
> >    forcewake, whereas the non-fw functions would obtain it themselves
> >  * _fw() functions also assumed that the caller was already holding
> >    uncore->lock, whereas the non-fw functions would obtain and release
> >    the lock around each register access
> >  * _fw() functions do no tracing and no debug assertions
> >  * _fw() functions do not check for unclaimed MMIO
> > 
> > I don't think the first bullet there (forcewake) really mattered much
> > from a performance perspective.  For display registers, a quick binary
> > search of the FW table (just a handful of CPU cycles) would quickly
> > determine that no forcewake domains were needed for those register
> > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > level at all.  For display registers, the more performance-relevant
> > aspects of using the _fw() functions was doing all your register
> > accesses together without contention with other MMIO work.  I.e.,
> > holding the uncore lock over an entire set of registers rather than
> > grabbing/releasing it for each one, and (for vblank evasion
> > specifically) doing it all while interrupts were disabled.  For debug
> > drivers, there was also a bunch of other stuff that the _fw() functions
> > bypassed (e.g., tripling of the number of register accesses due to
> > reading FPGA_DBG before/after each register to look for unclaimed
> > accesses).
> > 
> > > 
> > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > other times that the spec was updated and we didn't get the notification, and
> > > there were cases that the BSpec had bugs.
> > > 
> > > For these reasons in Xe we have decided to let to the caller the
> > > responsibility to set the force_wake bits for their domains before doing
> > > the MMIO.
> > 
> > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > bspec update (or the bspec itself having incorrect information) would
> > lead to even more mistakes if the caller has to explicitly grab the
> > appropriate domains than if the driver does it implicitly.  The explicit
> > handling only helps in the subset of cases where we blindly grab all of
> > the domains (as we do during part of init).
> > 
> > 
> 
> MMIO access that requires forcewakes really only should be in a few
> places, off the top of my head:
> 
> 1. Init
> 2. Reset
> 3. Sysfs / Debugfs
> 
> In all of these cases I think it fine to blindly grab all forcewakes.
> 
> Please chime in if I'm missing something.

I think as we implement more features in the Xe driver we're going to
wind up with a lot more places where we need to access GT registers at
runtime.  A few examples off the top of my head:

 * EU stall sampling
 * Perf/OA
 * EU debugger
 * Various OOB workarounds that ask us to twiddle a register at certain
   times in the driver.

> 
> > > 
> > > However I'm seeing many questions and doubts popping up:
> > > 
> > > 1. Are we confident that we are not missing any wake-up?
> > > 2. Are we confident that the domains are set correctly?
> > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > >    of some specific one?
> > 
> > I think we're only holding ALL domains during init; for most of the
> > runtime MMIO accesses, I think the code is currently attempting to only
> > grab the domain(s) that it thinks the registers it's accessing will
> > need.  Although that might be working right now, I'm a little bit
> > worried about how that will scale in the long term when a single
> > register might be in several different domains depending on what
> > platform you're running on.  There have definitely been cases in the
> > past where groups of registers migrated from RENDER to GT or vice versa
> > between platforms, so the exact domain you needed for an operation
> > varied by platform.  And things are even more complicated if you're
> > doing any MMIO against the media, since the hardware seems to change
> > exactly how it splits up the media power wells somewhat often.
> >
> > > 4. What about the display disconnection now because i915 and xe have different
> > >    mmio approaches but reusing i915-display?
> > > 
> > > It looks to me that the cons of the current approach are superseding the
> > > cons of the i915 approach. But I want to hear more thoughts here before
> > > we decide which route to take.
> > > 
> > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > a double approach where the caller is responsible but mmio has the range
> > > information and double check it?
> > 
> > As noted above, part of the challenge with forcewake is that even if the
> > caller knows it wants to access register FOO, and even if it know FOO is
> > a GT register that likely needs forcewake, it's sometimes challenging to
> > make sure it's grabbing the correct domain(s) for every single platform
> > the Xe driver will eventually support if the power management handling
> > changes.  I think that was part of the motivation for encoding the
> > tables into the driver in i915.  It seems like GT power wells don't
> > change as much these days as they used to, but it's hard to say whether
> > that will continue in the future or not.  Who knows...maybe they'll
> > eventually start creating dedicated domains for stuff like blitters,
> > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > domain.
> > 
> > If we do decide to go back to implicit forcewake handling with the table
> > encoded into the driver, it might be worth doing something sort of like
> 
> Let's not do this intel_uncore.c is an unreadable mess, I don't want
> anything like this in Xe.

When you say unreadable, are you referring to the macros that generate
the table lookup functions?  I don't think that macro magic would be
needed for Xe since we don't have to support old platforms that have
very different forcewake behavior, and we also don't need to generate
separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
(since I think everything in the GT is 32-bits these days).

The forcewake and shadow tables themselves are pretty clean in i915
these days, and if we move to autogenerating them from a text file, they
can become even simpler since the text file will basically be a cleaned
up copy/paste of part of the bspec table.


Matt

> 
> > what Lucas is doing in the OOB workaround series --- drop the
> > per-platform tables into a human-readable text file that's more similar
> > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > replication type, etc.) and then provide a small parser program that
> > will convert that into actual code (and do things like consolidating
> > adjacent ranges).
> > 
> > > 
> > > Any other idea? Thoughts?
> > 
> > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > I plan to follow up with another series that creates a more appropriate
> > MMIO target for register operations rather than using "xe_gt" as the
> > target (even for things completely unrelated to the small GT subset of
> > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > operations against a specific hardware unit, and then the info inside
> > the MMIO structure would be able to figure out if there are additional
> > checks and/or operations it should perform.  E.g.,
> > 
> >  * mmio = xe_mmio_for_device(xe_device *xe);
> >     - Used to submit MMIO operations against the root tile of the PCI
> >       device.  Only used during init (e.g., to read the registers that
> >       tell us which tiles exist on the platform) and during top-level
> >       interrupt enable/disable (since all interrupts are routed through
> >       the root tile).
> >     - No forcewake needed for register accesses through a handle of this
> >       type since you'd only ever be accessing sgunit registers for these
> >       types of things.
> >     - Register accesses through mmio can warn on debug builds if the
> >       register appears to be in a GT-related MMIO range.
> > 
> >  * mmio = xe_mmio_for_display(xe_device *xe);
> >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> >       but if a handle of this type is used to try to read/write
> >       registers outside the display range, we could have debug builds
> >       throw some extra warnings.
> >     - Unclaimed register detection could be confined to accesses through
> >       these handles.
> > 
> >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> >     - Used to access non-GT registers that reside in a specific tile.
> >       I.e., sgunit/soc registers.
> >     - As above, no forcewake needed, can make MMIO operations warn
> >       if used to access a GT range.
> > 
> >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> >     - Used to access GT registers in a specific GT
> >     - Does automatic GSI offset translation for media GTs
> >     - Can either do automatic forcewake like i915 does, or can do debug
> >       check+warn like you have here.
> >     - Can make MMIO operations warn if MMIO offset is outside GT range
> >     - Can also trigger warnings if a GT non-GSI, non-media engine
> >       register is accessed from an MMIO obtained from a media GT.
> >
> 
> Ack on this if we keep in managable, worried code / feature bloat those
> that will result in a similar file to intel_uncore.c in Xe.
> 
> Matt
> 
> > At some point we'll probably want to add some debug tracepoints for MMIO
> > access to assist with debugging; the mmio structure can also help
> > provide meaningful output for each type of MMIO handle as well.
> > 
> > 
> > One other MMIO-related thing:
> > At the moment Xe does no locking of MMIO access.  I know there were
> > hardware lockups on old platforms if simultaneous MMIO accesses
> > happened, but I've never seen that tied to a specific HSD ticket that
> > would let us know whether modern platforms are still susceptible or not.
> > If it turns out they are and that we need to bring in the equivalent of
> > i915's uncore lock (and figure out if any register access is
> > problematic, or only certain types/ranges).
> > 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Rodrigo.
> > > 
> > >  drivers/gpu/drm/xe/xe_mmio.h | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > > index 1407f1189b0d..6302ca85e3f4 100644
> > > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > > @@ -18,8 +18,26 @@ struct xe_device;
> > >  
> > >  int xe_mmio_init(struct xe_device *xe);
> > >  
> > > +static inline void xe_mmio_assert_forcewake(struct xe_gt *gt,
> > > +					    struct xe_reg reg)
> > > +{
> > > +	struct xe_force_wake *fw = &gt->mmio.fw;
> > > +
> > > +	/* No need for forcewake in this range */
> > > +	if (reg.addr >= 0x40000 && reg.addr < 0x116000)
> > > +		return;
> > > +
> > > +	/*
> > > +	 * XXX: Weak. It checks for some domain, but impossible to determine
> > > +	 * if the right one is selected, or if it was set by the same caller
> > > +	 */
> > > +	WARN_ON(!fw->awake_domains);
> > > +}
> > > +
> > >  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > >  {
> > > +	xe_mmio_assert_forcewake(gt, reg);
> > > +
> > >  	if (reg.addr < gt->mmio.adj_limit)
> > >  		reg.addr += gt->mmio.adj_offset;
> > >  
> > > @@ -29,6 +47,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> > >  static inline void xe_mmio_write32(struct xe_gt *gt,
> > >  				   struct xe_reg reg, u32 val)
> > >  {
> > > +	xe_mmio_assert_forcewake(gt, reg);
> > > +
> > >  	if (reg.addr < gt->mmio.adj_limit)
> > >  		reg.addr += gt->mmio.adj_offset;
> > >  
> > > @@ -37,6 +57,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
> > >  
> > >  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> > >  {
> > > +	xe_mmio_assert_forcewake(gt, reg);
> > > +
> > >  	if (reg.addr < gt->mmio.adj_limit)
> > >  		reg.addr += gt->mmio.adj_offset;
> > >  
> > > @@ -58,6 +80,8 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> > >  static inline void xe_mmio_write64(struct xe_gt *gt,
> > >  				   struct xe_reg reg, u64 val)
> > >  {
> > > +	xe_mmio_assert_forcewake(gt, reg);
> > > +
> > >  	if (reg.addr < gt->mmio.adj_limit)
> > >  		reg.addr += gt->mmio.adj_offset;
> > >  
> > > @@ -66,6 +90,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
> > >  
> > >  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> > >  {
> > > +	xe_mmio_assert_forcewake(gt, reg);
> > > +
> > >  	if (reg.addr < gt->mmio.adj_limit)
> > >  		reg.addr += gt->mmio.adj_offset;
> > >  
> > > -- 
> > > 2.39.2
> > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
