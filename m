Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B42BC77B7A
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 03:28:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A92710E3C8;
	Tue, 23 May 2023 03:28:15 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554CE10E3C8
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 03:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684812494; x=1716348494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=51MthSA733Nti92m0CcNheW/qnx+jbB96sNEoL1+slk=;
 b=Bz3fCz4uegTE/MjEuOpLVlhO5BzduCE2QIfACBaRZOr/0NtUsV57jT4j
 g0wGrpjxlZLGyB2G8AQzfhz8T2OeWIjExyI/Wkegq97jFAJsDLeveZfyv
 IcbeOO8AKIqnQq9AaUDJsofZaDC32iWVkYD1iUKFJk9dATlnyfX8/PYMT
 Iw1SAR/zCtF+04oOWjXWsV2iVswlGfWizBBzDudXdDIdZ9zPnX6AxmyZl
 PMTn4hQguko8OGp47FrFmwQo+hXso3wWi1kqjZoUB/sr0hYTzx4gOvkOK
 qpa2b/ED2bdq60e2UDE6bUFtCvglHTsQMW2s+mT9vA9JrffDVW4iIwNf4 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="353141648"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="353141648"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 20:28:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="697887024"
X-IronPort-AV: E=Sophos;i="6.00,185,1681196400"; d="scan'208";a="697887024"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 22 May 2023 20:28:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 22 May 2023 20:28:12 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 22 May 2023 20:28:12 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 22 May 2023 20:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEbUnghG1sLPRl1BdtzEE36PjtqQN/ceSFNnprdlA/wc4BS67iWuypys6+RLC+7Wf/KgVLLz/xpDVNm8QEVWDJuMmaaplIyFQWT6eHsUkN6c0IifhJjoNnWNJpCOqBrynFsIUyEH2uTVhLMbmjNUyFvO1s8CfwFW6I9C4Fuw8Lm48+jOKdxUs+1OJe8L47uUDl+FcknVH+fJDjBiv9KbsiIiydVCIh6/dE8IpFYKUzv0Mrf7KyhEtUktmcbk1yG+bOv4gbpfy51Sk4AM7cwfKXwi6f2SW0U0os2UAfgygUgdSpKU0TnZotvhqhOTVOKTU7l9/c/EMWUoFYVYOlR9dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIhtE3EXfOVyKT/0M6zOH6mn2XzH66jQ8C+YcPDAmkM=;
 b=XPtd9mQqKI/wGURodxhyq7xWXqYoRb9mwfersW/BFMEP6EFIaBtPBB9IuZ8Dps0yItA+n8h0dc0CCaI+yd0byh+Pki2jcCC0q7FplENTSKRyNFN8c1S27LBRAVF7waOezdFRhBGCLn3JK5MfPdpsXSi8evnk7zP417ZHQKCxUxUqJbR0B7vbaQhPQlI6oKuBUU505xR2uajkoTG6y2UX85XAEVhCltHv23fIAUYopBpiAEp6t4IoX9xWOu9msrkBf/e5sA4BP8Y2W+36madwL5+6avqO2VMyC2DbAumsNIqySKTYQ3fLtPDC5Swil8iS1zNcEnQDxv+N3t/6tjGYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by PH7PR11MB7572.namprd11.prod.outlook.com (2603:10b6:510:27b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 03:28:10 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::1b87:eeb5:fa80:79ba]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::1b87:eeb5:fa80:79ba%5]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 03:28:10 +0000
Date: Mon, 22 May 2023 20:28:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::14) To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7854:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: 929575e4-3659-4be0-dd59-08db5b3dbaff
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: myV2tb23j0gAJRRrMLMpJvaqQybEUUaVPC3vRRDZSSIbjOs3clSMDHA2fKGeAcSusYoAD/lRdLlW5xRzgEUb31ZL1yAEGi5Fp7nblJu5/Z3htaXrRqLOXfx2TCWk+YjTjW3OXugnYwDkOq7H5Y9I6pzKBmtVX1kpqgsJWhpOZXY/ycwxOqksjEyRQ85at9TdEpZJv4FfX4rDgfeROE9RHFxxPhI2eA3/PmtfEH2BWkf7rlnkJUAEvyTNbE0bOmKqvq7QuL9vhkd2B2aifQtJ+xi1ebYB4xATZBFnxmG10oIQR2rWBQtPXdLlOh/h9eW40daiTTgDsfAItarEGf5fOM9PosKKE4/6SHll+vjZpKpuLcCnCaYFopV2JEG9rgnAd9Lxi6pCibXmGipRzrob6ZvceJXT6fdb2oRwbvLh/UydlTVCeRdUYdEw9rAe+lmHtlgRC6CIjUd4qf3+HqtPrAyuC6FN5FtxZCjjezyddMLhUpUPqCZIsT7qNkrTU9WsH9Q9kyXSd4lACRj0XbtBUCiLAyIA0Pi9roPhOICY3Gl/6wvDxVWUZEk0LUKuzShYKJcrklcQCMKtIVPBuJUfk6vhZRKuDRvxwftB53oZu7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(6666004)(316002)(478600001)(6512007)(6506007)(1076003)(26005)(54906003)(41300700001)(66946007)(66476007)(66556008)(4326008)(6636002)(6486002)(6862004)(8676002)(8936002)(5660300002)(86362001)(2906002)(83380400001)(33656002)(66574015)(38100700002)(186003)(82960400001)(30864003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?c6cbYik+1vccgm+6MMVpeDEVUpHcagfZH4KZQ0/5WbNWLlPnaF3HbKgppS?=
 =?iso-8859-1?Q?jNzJZ81g3NLIGWUyyno17coD7/GxsIa4rWdsgkdo6yrRqWpxY1w18xKGNr?=
 =?iso-8859-1?Q?d5KWrepD+yRSrLb5dJnAXm3DoGRfuz+a6oovIG9cJ6Reuy3V6617NRFNis?=
 =?iso-8859-1?Q?ArqT8RObO0t/XtsYLZbhMW63DxvqD+dg8LTPoAH91AXwoQOP1Ktw+Ma5oE?=
 =?iso-8859-1?Q?5b65w13ZxOMIHG1e/jRFgSLr4Z3ALjIEMwf5Z2FtxPOlddH3Ud/wSpgMPy?=
 =?iso-8859-1?Q?8Wby2kTm66TVVISflZ3YQiKhHu1rWF/vchuz054p35oomEFd97x6XEuKG6?=
 =?iso-8859-1?Q?9vZPvA2+INukxorNG7hRqgaBoZRWPrjMD30s+waX+CoVAidSF2KywP8RvO?=
 =?iso-8859-1?Q?nZFx0/F339OdzDIIxS9MMeZPblXQPMFThh4EdkdO3bejAMUrOD6XGgtccJ?=
 =?iso-8859-1?Q?It0j40mMQwBjFvoAS3c9JlQie8oGsku+vM5UBJfG+QJPscYwy9LQBVr68L?=
 =?iso-8859-1?Q?tqUDz7T93dQhqiPp1nJ30zGnq7WtZPsB6KvrWw1VpQUedoPll/+uf7vtgO?=
 =?iso-8859-1?Q?iUV8LhFNsMB7k4cMMlJcLkmXR8RDJiTm43cFux3RPTVufWkfWh9yBpNUlZ?=
 =?iso-8859-1?Q?P0kgIzBq5NGc9ty9OE5laPR3/bGwQNFFlWVJqr3KVSfPArR/NKeBrTTBXU?=
 =?iso-8859-1?Q?Lfs500rbn3IgIRwoO3JY0ZGJ3FrY+vPn8f285M2709RnGk0kz0yoA/P4n9?=
 =?iso-8859-1?Q?5eIk+eezvP2zr2wMKrb2/sHF8+Sxhi+rQCcufdFRok+DcO2mRGQkC3B8sZ?=
 =?iso-8859-1?Q?SLRBbUhTL5LLespBwkvsNw4J/96Z7oN2NSKN/T/BGDt5ymm0iBvxl9Tm8L?=
 =?iso-8859-1?Q?rRifmfWDpwE53wVLzWtR1ByolUAEOJglmphfzRfilRM0goLxbRxnpnnmTO?=
 =?iso-8859-1?Q?2/2qpqZgasF7gVAqijfayrTPys79VRgL0sZgKN9AOzl/uLINEO6lowXdxM?=
 =?iso-8859-1?Q?BcJS1/OQ+453oq6i0Z+dzpnz8zJ3N+TiP4XJqAzOsOvFGEYv6SRVQO3ffb?=
 =?iso-8859-1?Q?d9XQJvfPUmRSYXsalma+jP2aD9WouwbxeIaBnjocLvVAlkEZ1yJ60469JJ?=
 =?iso-8859-1?Q?YjY4z4rJ3CkvL/mGTtnPpojJcaoaFW/iF1kvihhE6YULiYorFcJEYKaokR?=
 =?iso-8859-1?Q?YwaeRHU8BiLq3nLWCsCogfkDjQ/6Ve2SLRAYjdF1Zn9e1a0O9RMczuDQGb?=
 =?iso-8859-1?Q?23nXFThh/37yIiYLnjvj+kp9MOYfkFoJT+p8BVYIxz45F12Gr1RtUP8v4s?=
 =?iso-8859-1?Q?OVl0c3Tvt+M/Vh0uXW/v0xmKkPQY3z/pvLz/ar7KYXeenByDKA2SU34ev2?=
 =?iso-8859-1?Q?/AjW7M34l95a0SBZ86evbEjf0EgqdMh/HpgV3HoIgKpPCc6GyvTebOKznJ?=
 =?iso-8859-1?Q?cfLFH1M998wfQ+d4dvrg3ZHZjoIabuYPjQLpdqj3XHwpQoEGbpTO4MzuQC?=
 =?iso-8859-1?Q?m8HNvV91u3tIOhEEm71yXniKDdchSdPGKWgA/VAoUb9zA0dRyxb6TbpmnY?=
 =?iso-8859-1?Q?oX5HfD1+bsHOQ/0I++BLp/zJb5pnJrZx+azdiuPBVsOnKyWg4Oe1YINiLj?=
 =?iso-8859-1?Q?rQpvWVcRP4y6RzNcBSGsF8igGK/aHrF2xAnlv9GqJDGRDbuCxzmcZwSg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 929575e4-3659-4be0-dd59-08db5b3dbaff
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 03:28:09.6827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KpWGwuM7BQQcNm0/3xIPnQdE56FlN8IUZH7ou4poK64skwI8/S/0YIfcdwT4Q3hSqX/U++XdDTGCYMQWumNwxqrTN5kWmVjCQo4kT1brFBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> It is the maximum protection we can do with the current infrastructure.
> 
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> 
> 
> RFC
> ===
> 
> Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> Xe than anything else.
> 
> On i915 the force_wake is built-in the mmio functions at uncore component.
> 
> With that approach we had few historical issues iirc:
> 
> 1. Display performance with vblank evasion that requested uncore to provide
> the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> the name suggests).

In i915 there were more differences between fw and non-fw variants
of register functions than just forcewake handling:

 * _fw() functions assumed that the caller was already holding
   forcewake, whereas the non-fw functions would obtain it themselves
 * _fw() functions also assumed that the caller was already holding
   uncore->lock, whereas the non-fw functions would obtain and release
   the lock around each register access
 * _fw() functions do no tracing and no debug assertions
 * _fw() functions do not check for unclaimed MMIO

I don't think the first bullet there (forcewake) really mattered much
from a performance perspective.  For display registers, a quick binary
search of the FW table (just a handful of CPU cycles) would quickly
determine that no forcewake domains were needed for those register
offsets, so we wouldn't be doing anything with forcewake at the hardware
level at all.  For display registers, the more performance-relevant
aspects of using the _fw() functions was doing all your register
accesses together without contention with other MMIO work.  I.e.,
holding the uncore lock over an entire set of registers rather than
grabbing/releasing it for each one, and (for vblank evasion
specifically) doing it all while interrupts were disabled.  For debug
drivers, there was also a bunch of other stuff that the _fw() functions
bypassed (e.g., tripling of the number of register accesses due to
reading FPGA_DBG before/after each register to look for unclaimed
accesses).

> 
> 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> other times that the spec was updated and we didn't get the notification, and
> there were cases that the BSpec had bugs.
> 
> For these reasons in Xe we have decided to let to the caller the
> responsibility to set the force_wake bits for their domains before doing
> the MMIO.

I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
bspec update (or the bspec itself having incorrect information) would
lead to even more mistakes if the caller has to explicitly grab the
appropriate domains than if the driver does it implicitly.  The explicit
handling only helps in the subset of cases where we blindly grab all of
the domains (as we do during part of init).


> 
> However I'm seeing many questions and doubts popping up:
> 
> 1. Are we confident that we are not missing any wake-up?
> 2. Are we confident that the domains are set correctly?
> 3. Are we not wasting power if we are waking up ALL the domains instead
>    of some specific one?

I think we're only holding ALL domains during init; for most of the
runtime MMIO accesses, I think the code is currently attempting to only
grab the domain(s) that it thinks the registers it's accessing will
need.  Although that might be working right now, I'm a little bit
worried about how that will scale in the long term when a single
register might be in several different domains depending on what
platform you're running on.  There have definitely been cases in the
past where groups of registers migrated from RENDER to GT or vice versa
between platforms, so the exact domain you needed for an operation
varied by platform.  And things are even more complicated if you're
doing any MMIO against the media, since the hardware seems to change
exactly how it splits up the media power wells somewhat often.

> 4. What about the display disconnection now because i915 and xe have different
>    mmio approaches but reusing i915-display?
> 
> It looks to me that the cons of the current approach are superseding the
> cons of the i915 approach. But I want to hear more thoughts here before
> we decide which route to take.
> 
> Maybe we have that domain as part of the mmio calls themselves? Maybe
> a double approach where the caller is responsible but mmio has the range
> information and double check it?

As noted above, part of the challenge with forcewake is that even if the
caller knows it wants to access register FOO, and even if it know FOO is
a GT register that likely needs forcewake, it's sometimes challenging to
make sure it's grabbing the correct domain(s) for every single platform
the Xe driver will eventually support if the power management handling
changes.  I think that was part of the motivation for encoding the
tables into the driver in i915.  It seems like GT power wells don't
change as much these days as they used to, but it's hard to say whether
that will continue in the future or not.  Who knows...maybe they'll
eventually start creating dedicated domains for stuff like blitters,
GuC, etc.  rather than lumping all of those into the "GT" catchall
domain.

If we do decide to go back to implicit forcewake handling with the table
encoded into the driver, it might be worth doing something sort of like
what Lucas is doing in the OOB workaround series --- drop the
per-platform tables into a human-readable text file that's more similar
to the format used by the bspec (exact ranges, forcewake domain, MCR
replication type, etc.) and then provide a small parser program that
will convert that into actual code (and do things like consolidating
adjacent ranges).

> 
> Any other idea? Thoughts?

Once the big GT vs tile refactor stuff I have in flight gets finalized,
I plan to follow up with another series that creates a more appropriate
MMIO target for register operations rather than using "xe_gt" as the
target (even for things completely unrelated to the small GT subset of
hardware).  My idea is that you'd grab an MMIO target structure for MMIO
operations against a specific hardware unit, and then the info inside
the MMIO structure would be able to figure out if there are additional
checks and/or operations it should perform.  E.g.,

 * mmio = xe_mmio_for_device(xe_device *xe);
    - Used to submit MMIO operations against the root tile of the PCI
      device.  Only used during init (e.g., to read the registers that
      tell us which tiles exist on the platform) and during top-level
      interrupt enable/disable (since all interrupts are routed through
      the root tile).
    - No forcewake needed for register accesses through a handle of this
      type since you'd only ever be accessing sgunit registers for these
      types of things.
    - Register accesses through mmio can warn on debug builds if the
      register appears to be in a GT-related MMIO range.

 * mmio = xe_mmio_for_display(xe_device *xe);
    - Pretty much the same as handles returned by xe_mmio_for_device(),
      but if a handle of this type is used to try to read/write
      registers outside the display range, we could have debug builds
      throw some extra warnings.
    - Unclaimed register detection could be confined to accesses through
      these handles.

 * mmio = xe_mmio_for_tile(xe_tile *tile);
    - Used to access non-GT registers that reside in a specific tile.
      I.e., sgunit/soc registers.
    - As above, no forcewake needed, can make MMIO operations warn
      if used to access a GT range.

 * mmio = xe_mmio_for_gt(xe_gt *gt);
    - Used to access GT registers in a specific GT
    - Does automatic GSI offset translation for media GTs
    - Can either do automatic forcewake like i915 does, or can do debug
      check+warn like you have here.
    - Can make MMIO operations warn if MMIO offset is outside GT range
    - Can also trigger warnings if a GT non-GSI, non-media engine
      register is accessed from an MMIO obtained from a media GT.

At some point we'll probably want to add some debug tracepoints for MMIO
access to assist with debugging; the mmio structure can also help
provide meaningful output for each type of MMIO handle as well.


One other MMIO-related thing:
At the moment Xe does no locking of MMIO access.  I know there were
hardware lockups on old platforms if simultaneous MMIO accesses
happened, but I've never seen that tied to a specific HSD ticket that
would let us know whether modern platforms are still susceptible or not.
If it turns out they are and that we need to bring in the equivalent of
i915's uncore lock (and figure out if any register access is
problematic, or only certain types/ranges).


Matt

> 
> Thanks,
> Rodrigo.
> 
>  drivers/gpu/drm/xe/xe_mmio.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
> index 1407f1189b0d..6302ca85e3f4 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.h
> +++ b/drivers/gpu/drm/xe/xe_mmio.h
> @@ -18,8 +18,26 @@ struct xe_device;
>  
>  int xe_mmio_init(struct xe_device *xe);
>  
> +static inline void xe_mmio_assert_forcewake(struct xe_gt *gt,
> +					    struct xe_reg reg)
> +{
> +	struct xe_force_wake *fw = &gt->mmio.fw;
> +
> +	/* No need for forcewake in this range */
> +	if (reg.addr >= 0x40000 && reg.addr < 0x116000)
> +		return;
> +
> +	/*
> +	 * XXX: Weak. It checks for some domain, but impossible to determine
> +	 * if the right one is selected, or if it was set by the same caller
> +	 */
> +	WARN_ON(!fw->awake_domains);
> +}
> +
>  static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	xe_mmio_assert_forcewake(gt, reg);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -29,6 +47,8 @@ static inline u8 xe_mmio_read8(struct xe_gt *gt, struct xe_reg reg)
>  static inline void xe_mmio_write32(struct xe_gt *gt,
>  				   struct xe_reg reg, u32 val)
>  {
> +	xe_mmio_assert_forcewake(gt, reg);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -37,6 +57,8 @@ static inline void xe_mmio_write32(struct xe_gt *gt,
>  
>  static inline u32 xe_mmio_read32(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	xe_mmio_assert_forcewake(gt, reg);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -58,6 +80,8 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, struct xe_reg reg, u32 clr,
>  static inline void xe_mmio_write64(struct xe_gt *gt,
>  				   struct xe_reg reg, u64 val)
>  {
> +	xe_mmio_assert_forcewake(gt, reg);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> @@ -66,6 +90,8 @@ static inline void xe_mmio_write64(struct xe_gt *gt,
>  
>  static inline u64 xe_mmio_read64(struct xe_gt *gt, struct xe_reg reg)
>  {
> +	xe_mmio_assert_forcewake(gt, reg);
> +
>  	if (reg.addr < gt->mmio.adj_limit)
>  		reg.addr += gt->mmio.adj_offset;
>  
> -- 
> 2.39.2
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
