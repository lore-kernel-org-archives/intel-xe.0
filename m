Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFACFC7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 13:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DD5A10E0BA;
	Tue, 23 May 2023 13:57:40 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BA210E0BA
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684850258; x=1716386258;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=C0FKgup/YNEAJ0fsjIiTN2l7ZGmCdPud2ghskHqODBA=;
 b=C3VBITHT784sTaiiGEfS0xKBYijs6sNLi2AkoWuN9Dt15q0DSiVuCUgN
 TGrtGGVzQwm/Bo7ZIMtuRVU7Yw0RT3dyqlLZHh0jyD148UY2niEDy3M0q
 q3fZAcq1dPnLcLiBRwwbR6eNh9R37iD4eCJ9DuQxD/ZAZm5/Dn4lr25Tt
 3tidFlT2Eu8ejrZAxd1vXIJwmGgMI3aMTMP/IqtSYZZdTwvWkbmVENDHq
 eGJgyiBfnRxUe4yZoh9D5TQlL2p3QgIa5JW88bQ3+QE/AWD26ANGpYk1s
 rcmRMY/7xwRz0Rpb6oTDEGYnKAI6D2AAXSw04uG0k3tuUEvrVWBYN/jJ/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="337828156"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="337828156"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 06:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="736884894"
X-IronPort-AV: E=Sophos;i="6.00,186,1681196400"; d="scan'208";a="736884894"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 23 May 2023 06:57:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 06:57:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 06:57:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 06:57:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lom8nJ/RtKl8h9AdbTep7KbXOVofwn8Z5ewVz8bjoJkNMbsaM8qU8n09rMLQpOaWUEG1ia8F5qUAzv9Wg8NIUzQuF2MDNjJLBLaDJ/M/yi5s4C2opSgabq/5VEToOWqrP358Go2NexQQWEEkdYH98wzhNdj3lvYy4+PtsA1iygrQwbg5k7y03UJpT+NxRziQeNIyE0a8yCMPPUHwrMEvhj6GkKPlVk2KpIxF2zBqAhkL7a2tdWQ9V6v0EVM6sT5XEmJYVuszEH+s39IN4brcrdeuMznTejlt3hNFmkd8jWV/5J6Bq/iJ36uQfuNJuvo4ar94gIhHPvvR0PfbxvUF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QpjTRESk4jXMdnhO/4uxNt3ENWCt5TAUbhe0HqA5UG8=;
 b=GzWt9U4dBdsNYwKN7IAuE6MtV42gGQ/ETJstPY2N17E/1oawQQOLFhXDhUx6Kjno7QFk0PQCKAcZowK1NoqjSFpZrUgafAJwtBVDoxIOTQ33OtyysPN9diIvpkdwQBW5AygdXNC41AXB/pVXR0ozaLhS+sV4FG49GFssrVcqJAVEB3wpwDDAl7tcNAw8pe1gSmXxNefwWZGBqEKGDYrO0q8CgavDxB9RS5kdfxps8Y+8OdV7TDaDb13va+gS9moqdDt0s4RhuV21GmOpLfUlUr6HocXHXQtmynDTfiqOF28jVZDZ5ym7aWTtl6vly47oVuC61x6bRvUIjTVB8Xh00w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 13:57:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 13:57:18 +0000
Date: Tue, 23 May 2023 13:56:53 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0293.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 0164cc39-5e32-4c3e-667a-08db5b959edf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NtzpjuT0wHnj3KQqz+4nW5O3rVC7P8VJV3oMH2i5HTu9n1bD49dZkGZxhFL3dfzQbRL71W9NN6NO0U5WbM58OQ9FV12DumcuQ2RtU4rHjxi47uEpTL9Mn0hK8ls+Yw5qpcASYJfRvksN4b68JFl56XGOWGFfcphBCgNC4C3m0aE3LNhjdsjRG+4rKyir9T/2NJWBoMatQq1iFXsWFtps9BECQNWSIenln3dpuQ4c7iUP8wEQkbpo/SYZfXakoywFg9a57nCvScykwmQonkb5KqjzVxNBLD1cYX++V/t56njGj8ubh4GTQTxAThfMYDIRsSbtMJe4U7RsGu8N2zYGhA01are77qKSbllnUeD0RmWkOWZ9QFFawswD+0fpxMh8TxiBIVStv/wdHoOQ30icI6In0DJE4Db7azTiFT38JaGOgsgGD1akqnIJ7NW/jcJr4ceIWlQKv+ru1Ey27udaqb5gXnBv48LcX8rLQxzjEUA5yxy16lwzAYDGwE6B9pfKv5XWEhFtu8ov0KUIVP2UYhonbIO04snXysLPguhxYckkepzaBaFGn/ang8lyJBBg3BX78TIuaz65GpuNi38AMt7SG9rOaus7D0ldQYdAFto=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(8936002)(6862004)(8676002)(5660300002)(44832011)(66574015)(83380400001)(186003)(6512007)(6506007)(82960400001)(26005)(86362001)(38100700002)(41300700001)(6486002)(6666004)(478600001)(66946007)(66556008)(66476007)(4326008)(6636002)(316002)(54906003)(2906002)(30864003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?uan/3yKq/qb3/mfYU1lcNK65L0/kNuC5xAl7dJOX2XwJXjbSE36i//YiAt?=
 =?iso-8859-1?Q?KEJXkJlE7CEySjr43A0j3SHWx1ocP8tpy+d2ED3kQELWzvXgFNxFCj2wAS?=
 =?iso-8859-1?Q?Em4P8d5NWbRxEfhoIBbrixwdpF7dZVLz3m89fJ1A81AFYFHNA678yWtN3r?=
 =?iso-8859-1?Q?c6Lhl8PyC71IGt5e2lcqNEm7DvlojjoNZiWc0biCLr1diljChVtPjIGCNp?=
 =?iso-8859-1?Q?C1dLgm7cpQyIKUtMaeoeXbXPfLfOrc/8nieMTCu6bQmwwZZCJBMPZloxoi?=
 =?iso-8859-1?Q?TniQ29xce9vcy4e6F6mvqo5TKdZpqylrNg/Nl23T35PT4l6Xfzb9ErHZ64?=
 =?iso-8859-1?Q?pGJIq3D1iP2s/9OvoMmJ89qCNfwwbkvN5UU3vP/gu9QcNe44nq1I6L8pn1?=
 =?iso-8859-1?Q?CK9hMv778iwHi0EYrMHRNa8KMKOq9W4LWpT5JoH8v/I7ocEZU9iQ9Yk2CE?=
 =?iso-8859-1?Q?mPWHG7REgcih2oSR3QYWOmuyH1mD0bqFmsfWC69EDMPUHm5E4jDTQnkIMR?=
 =?iso-8859-1?Q?zHfMAOUciCKwauSEUx8n9kTbrWp2gdzBTnpTMt7X77yCFsA+QB9PLm11yg?=
 =?iso-8859-1?Q?DzDuvzo8yXzcPJniartaN1HGdMaGtlyzgGByOeK/h8xYrnjFjtm3yuaT6s?=
 =?iso-8859-1?Q?V8erXlJJYcxqK3xkF1vjjGr1UQdZcf98K0JKnvvHuG4RDM+euKOAvnWdwS?=
 =?iso-8859-1?Q?mrAShqdY2+D7ZxoEWgsRR+S2Hmn8xD3Erw08tFIjm0ndfa2i/rnVTcyzs5?=
 =?iso-8859-1?Q?cggoMt3Ajrqugq357vSxJ4dNQcv2nrue07QO5JERWXan+txQQkRR95rcZW?=
 =?iso-8859-1?Q?tDHCvY16iW8h/9F5MWff1x5rEHVfEPRrg6IbE5dCBxEJ3d0GqEM3yYGax4?=
 =?iso-8859-1?Q?hZf621kZciRA2sOg/8ILzYYlm1dqVEhSuh/K0Wg2RTPTszh3UHGRQCjwBh?=
 =?iso-8859-1?Q?f4VyDrSpeI28YV0xBu6RiSzEdZ/pBvogqhnM6W/G7ACm+1hdqbuQ8t6gsi?=
 =?iso-8859-1?Q?WT4Bo2r98Dpffs33OheRbqYIDs45jnLLClseDgWKybpNYr501UY9EVTlaX?=
 =?iso-8859-1?Q?N1RGW5WM3HhFJykEMbjHh65tbxbSOtsa2x6HjEgcEDGTbpu2QFZwwzUDPl?=
 =?iso-8859-1?Q?WLP+Rf04jur0x/00Mzfe5EJhRezkc41FabhNQFIQORcZ6VkawKjq31Ia0f?=
 =?iso-8859-1?Q?cQ9U8SKeeRoDAgfJqrD0YgYIAYlcDoKy9kF+tSmHgZPvORhI98Mz7s1Gue?=
 =?iso-8859-1?Q?EALyiwwmH+5G6GBdBx+XjlEyq0HwUS45sTTysEWhU+NoPMDYoopnF+TFiu?=
 =?iso-8859-1?Q?QUu/Ajh2HRgX5FFMVsZrJgC15hb5u8d8L7COAmlC+fnW5r3vUo0gE+w3MT?=
 =?iso-8859-1?Q?yqKrzyhUqC/rkqNkihdsawft6w1mOkSRbxcEkAZ7BCn854+8aCrrIrXQCw?=
 =?iso-8859-1?Q?LsWw45I7siUzHZ8doEIqIgpt/seVNXYs4ihB3re3d4AdIbynWEUTzKnDyN?=
 =?iso-8859-1?Q?IFTRRTDMAWMvhJkizyFZ02BSAF1eInGpZS15ibNVK1tPoH+WMOgF8CTWnA?=
 =?iso-8859-1?Q?MAqLQSWG6t4WDuEYEoKV541FxXHJipcTsOIaHv3FQTnpPldQcc18Ojzj4G?=
 =?iso-8859-1?Q?MhGo5MbrR9gHO5uBfYzltEXTSDMndZbZueYVI8j1+qNolJMo4b8MaCkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0164cc39-5e32-4c3e-667a-08db5b959edf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 13:57:17.9066 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /phSPmQpCp2/iuG/nheXSzD9es1YtgFqN9Iv8UgpXx912aWF8sLI3q68pZ6SY8ePTrt036/VRVmi1muAPoIuZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
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

On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > It is the maximum protection we can do with the current infrastructure.
> > 
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > 
> > 
> > RFC
> > ===
> > 
> > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > Xe than anything else.
> > 
> > On i915 the force_wake is built-in the mmio functions at uncore component.
> > 
> > With that approach we had few historical issues iirc:
> > 
> > 1. Display performance with vblank evasion that requested uncore to provide
> > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > the name suggests).
> 
> In i915 there were more differences between fw and non-fw variants
> of register functions than just forcewake handling:
> 
>  * _fw() functions assumed that the caller was already holding
>    forcewake, whereas the non-fw functions would obtain it themselves
>  * _fw() functions also assumed that the caller was already holding
>    uncore->lock, whereas the non-fw functions would obtain and release
>    the lock around each register access
>  * _fw() functions do no tracing and no debug assertions
>  * _fw() functions do not check for unclaimed MMIO
> 
> I don't think the first bullet there (forcewake) really mattered much
> from a performance perspective.  For display registers, a quick binary
> search of the FW table (just a handful of CPU cycles) would quickly
> determine that no forcewake domains were needed for those register
> offsets, so we wouldn't be doing anything with forcewake at the hardware
> level at all.  For display registers, the more performance-relevant
> aspects of using the _fw() functions was doing all your register
> accesses together without contention with other MMIO work.  I.e.,
> holding the uncore lock over an entire set of registers rather than
> grabbing/releasing it for each one, and (for vblank evasion
> specifically) doing it all while interrupts were disabled.  For debug
> drivers, there was also a bunch of other stuff that the _fw() functions
> bypassed (e.g., tripling of the number of register accesses due to
> reading FPGA_DBG before/after each register to look for unclaimed
> accesses).
> 
> > 
> > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > other times that the spec was updated and we didn't get the notification, and
> > there were cases that the BSpec had bugs.
> > 
> > For these reasons in Xe we have decided to let to the caller the
> > responsibility to set the force_wake bits for their domains before doing
> > the MMIO.
> 
> I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> bspec update (or the bspec itself having incorrect information) would
> lead to even more mistakes if the caller has to explicitly grab the
> appropriate domains than if the driver does it implicitly.  The explicit
> handling only helps in the subset of cases where we blindly grab all of
> the domains (as we do during part of init).
> 
> 

MMIO access that requires forcewakes really only should be in a few
places, off the top of my head:

1. Init
2. Reset
3. Sysfs / Debugfs

In all of these cases I think it fine to blindly grab all forcewakes.

Please chime in if I'm missing something.

> > 
> > However I'm seeing many questions and doubts popping up:
> > 
> > 1. Are we confident that we are not missing any wake-up?
> > 2. Are we confident that the domains are set correctly?
> > 3. Are we not wasting power if we are waking up ALL the domains instead
> >    of some specific one?
> 
> I think we're only holding ALL domains during init; for most of the
> runtime MMIO accesses, I think the code is currently attempting to only
> grab the domain(s) that it thinks the registers it's accessing will
> need.  Although that might be working right now, I'm a little bit
> worried about how that will scale in the long term when a single
> register might be in several different domains depending on what
> platform you're running on.  There have definitely been cases in the
> past where groups of registers migrated from RENDER to GT or vice versa
> between platforms, so the exact domain you needed for an operation
> varied by platform.  And things are even more complicated if you're
> doing any MMIO against the media, since the hardware seems to change
> exactly how it splits up the media power wells somewhat often.
>
> > 4. What about the display disconnection now because i915 and xe have different
> >    mmio approaches but reusing i915-display?
> > 
> > It looks to me that the cons of the current approach are superseding the
> > cons of the i915 approach. But I want to hear more thoughts here before
> > we decide which route to take.
> > 
> > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > a double approach where the caller is responsible but mmio has the range
> > information and double check it?
> 
> As noted above, part of the challenge with forcewake is that even if the
> caller knows it wants to access register FOO, and even if it know FOO is
> a GT register that likely needs forcewake, it's sometimes challenging to
> make sure it's grabbing the correct domain(s) for every single platform
> the Xe driver will eventually support if the power management handling
> changes.  I think that was part of the motivation for encoding the
> tables into the driver in i915.  It seems like GT power wells don't
> change as much these days as they used to, but it's hard to say whether
> that will continue in the future or not.  Who knows...maybe they'll
> eventually start creating dedicated domains for stuff like blitters,
> GuC, etc.  rather than lumping all of those into the "GT" catchall
> domain.
> 
> If we do decide to go back to implicit forcewake handling with the table
> encoded into the driver, it might be worth doing something sort of like

Let's not do this intel_uncore.c is an unreadable mess, I don't want
anything like this in Xe.

> what Lucas is doing in the OOB workaround series --- drop the
> per-platform tables into a human-readable text file that's more similar
> to the format used by the bspec (exact ranges, forcewake domain, MCR
> replication type, etc.) and then provide a small parser program that
> will convert that into actual code (and do things like consolidating
> adjacent ranges).
> 
> > 
> > Any other idea? Thoughts?
> 
> Once the big GT vs tile refactor stuff I have in flight gets finalized,
> I plan to follow up with another series that creates a more appropriate
> MMIO target for register operations rather than using "xe_gt" as the
> target (even for things completely unrelated to the small GT subset of
> hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> operations against a specific hardware unit, and then the info inside
> the MMIO structure would be able to figure out if there are additional
> checks and/or operations it should perform.  E.g.,
> 
>  * mmio = xe_mmio_for_device(xe_device *xe);
>     - Used to submit MMIO operations against the root tile of the PCI
>       device.  Only used during init (e.g., to read the registers that
>       tell us which tiles exist on the platform) and during top-level
>       interrupt enable/disable (since all interrupts are routed through
>       the root tile).
>     - No forcewake needed for register accesses through a handle of this
>       type since you'd only ever be accessing sgunit registers for these
>       types of things.
>     - Register accesses through mmio can warn on debug builds if the
>       register appears to be in a GT-related MMIO range.
> 
>  * mmio = xe_mmio_for_display(xe_device *xe);
>     - Pretty much the same as handles returned by xe_mmio_for_device(),
>       but if a handle of this type is used to try to read/write
>       registers outside the display range, we could have debug builds
>       throw some extra warnings.
>     - Unclaimed register detection could be confined to accesses through
>       these handles.
> 
>  * mmio = xe_mmio_for_tile(xe_tile *tile);
>     - Used to access non-GT registers that reside in a specific tile.
>       I.e., sgunit/soc registers.
>     - As above, no forcewake needed, can make MMIO operations warn
>       if used to access a GT range.
> 
>  * mmio = xe_mmio_for_gt(xe_gt *gt);
>     - Used to access GT registers in a specific GT
>     - Does automatic GSI offset translation for media GTs
>     - Can either do automatic forcewake like i915 does, or can do debug
>       check+warn like you have here.
>     - Can make MMIO operations warn if MMIO offset is outside GT range
>     - Can also trigger warnings if a GT non-GSI, non-media engine
>       register is accessed from an MMIO obtained from a media GT.
>

Ack on this if we keep in managable, worried code / feature bloat those
that will result in a similar file to intel_uncore.c in Xe.

Matt

> At some point we'll probably want to add some debug tracepoints for MMIO
> access to assist with debugging; the mmio structure can also help
> provide meaningful output for each type of MMIO handle as well.
> 
> 
> One other MMIO-related thing:
> At the moment Xe does no locking of MMIO access.  I know there were
> hardware lockups on old platforms if simultaneous MMIO accesses
> happened, but I've never seen that tied to a specific HSD ticket that
> would let us know whether modern platforms are still susceptible or not.
> If it turns out they are and that we need to bring in the equivalent of
> i915's uncore lock (and figure out if any register access is
> problematic, or only certain types/ranges).
> 
> 
> Matt
> 
> > 
> > Thanks,
> > Rodrigo.
> > 
> >  drivers/gpu/drm/xe/xe_mmio.h | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> > index 1407f1189b0d..6302ca85e3f4 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.h
> > +++ b/drivers/gpu/drm/xe/xe_mmio.h
> > @@ -18,8 +18,26 @@ struct xe_device;
> >  
> >  int xe_mmio_init(struct xe_device *xe);
> >  
> > +static inline void xe_mmio_assert_forcewake(struct xe_gt *gt,
> > +					    struct xe_reg reg)
> > +{
> > +	struct xe_force_wake *fw = &gt->mmio.fw;
> > +
> > +	/* No need for forcewake in this range */
> > +	if (reg.addr >= 0x40000 && reg.addr < 0x116000)
> > +		return;
> > +
> > +	/*
> > +	 * XXX: Weak. It checks for some domain, but impossible to determine
> > +	 * if the right one is selected, or if it was set by the same caller
> > +	 */
> > +	WARN_ON(!fw->awake_domains);
> > +}
> > +
> >  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -29,6 +47,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
> >  static inline void xe_mmio_write32(struct xe_gt *gt,
> >  				   struct xe_reg reg, u32 val)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -37,6 +57,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
> >  
> >  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -58,6 +80,8 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
> >  static inline void xe_mmio_write64(struct xe_gt *gt,
> >  				   struct xe_reg reg, u64 val)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > @@ -66,6 +90,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
> >  
> >  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
> >  {
> > +	xe_mmio_assert_forcewake(gt, reg);
> > +
> >  	if (reg.addr < gt->mmio.adj_limit)
> >  		reg.addr += gt->mmio.adj_offset;
> >  
> > -- 
> > 2.39.2
> > 
> 
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
