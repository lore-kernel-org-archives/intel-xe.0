Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2654CD6139
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 21:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C010E2D2;
	Mon,  9 Oct 2023 21:15:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8987910E2D2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696886132; x=1728422132;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7o+TUGf6I2bZABNzkmQYngeujSAwFBSjc4yi0vxw6mQ=;
 b=CBZarm0AoNozrhSPeCq2JX0WPMOzH1lTmzD1ti2kQGtG2E12ormUjHUN
 hjeZiwBGDdu27uU+rZnDZY6i8gvOvjAOeD2h3r7kExIr8MTFGfuMVctNc
 pJkkDbRiycN603VM3Pg1fbi76ezw4Tzgtd6eFZbEYW5niUXIYyMxCFLKU
 Fq5QxQoLfISvxTBMvRPUiEFmxGZ6+Z2QWPDElDx6q9HABmpHAdr+q+/bn
 PYJJ7ErWEfQopXXlov42JB006B1zbBt0ZwIYgOiHbRcpkdTNpS+S2+knv
 MVQEEMeyblwfHJugIl4uXw9u5p0J0CSGrvzSWSmbG8OK+G+7ozCQUHtQk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="5798999"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="5798999"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 14:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000363064"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; d="scan'208";a="1000363064"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 14:15:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 14:15:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 14:15:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 14:15:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgtRx4hW3Zp/mGYkp1ovPrUxZrc2KhhOvdNEXoFaTe9G43aGi3+nPzGUqhwD9iav5LS7iFYR2NcmiBEaOYNN0VCDQkrNPvGh8pLM76nWysKB5N3qgHLJQogaYM9/3yhvAdu0tJYjodsvyC8vmHd2bVnoASXwCVGfCmtOHNsgrfhPNs6pleAmp2Wo6Mf16K0/GhfdybQNSGgAflL9hxoJWWLuVXImzGuy7YtQiSemywwezr5XUJ69IMjbcTl+AiUTf4P3IC6WMZu90hMp6Cvo+kIkNseXrgrnPV+JcMtRZl5CtuaQ/BqhDzdCLtnrFZqMp2DQsNw8Iaa+rG4wqT4TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hozRfNaig6k8Ow+vJLavPHaNdqwgFoMLefHVKbwO7u8=;
 b=TpHmf82I/YUP8pR/yGTL5i6B4E5rUvZ7jUlTlkOOdfgNEwvro3K6vG5W8+JvZBtf0Jm4B3UrCqhTfu9+gMeIWtqHZgManmyBzDa8bHS5PYafWBkbR6QJ3JZig3zgJ0Sz1orpkzGf5N57jHrNVy7LUpBI6y0pTsJAB6R5RV3U/LitnddAZ17/cu3DWIWpz0lib0vJ7k5dtXdGgl7fO97pj3ljnNYc3uNhyoUcKp3jOW5h8ppY8aUyrwAD2glmNW/5f/rpntCtnBikqloWXKCqkRaIyvYerqIUcMZ9SWOXjxVO9eLeWj3FoPAjMVNB3rw4EUqzXNeBtlXdBaiVGJn7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6146.namprd11.prod.outlook.com (2603:10b6:208:3ee::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Mon, 9 Oct
 2023 21:15:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 21:15:27 +0000
Date: Mon, 9 Oct 2023 17:15:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Luca Coelho <luca@coelho.fi>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Message-ID: <ZSRtavVCM2lqbV5y@intel.com>
References: <20230522221527.2181802-1-rodrigo.vivi@intel.com>
 <20230523032805.GB6250@mdroper-desk1.amr.corp.intel.com>
 <ZGzGJYuTAUpfeXe5@DUT025-TGLU.fm.intel.com>
 <20230523163849.GD6250@mdroper-desk1.amr.corp.intel.com>
 <ZG1Rwd2k6oDdiHHT@DUT025-TGLU.fm.intel.com>
 <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8de90ac856b0caf3d0bd82717769e9f6fe1687a0.camel@coelho.fi>
X-ClientProxiedBy: SJ0PR03CA0290.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6146:EE_
X-MS-Office365-Filtering-Correlation-Id: afafab7c-2207-456a-8b1e-08dbc90cdbe5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B0oKYfm8cthx14rydQ56Nv1U/RWte/I87ts/QnFdMlNwj7Z04orby4QFdtoEG6ZSIkwpdyeTfsE7l8MT2XqtUPymyp7h7u173r6fJPBSrmrfprto4GRRnq5pq1ELmX1FcXJ85xfiDxxD7kC5eL/WTWakEpyMruBZ5kn870AQp9vZiAP7iu8Uncxt+5a027ZgLnSrMNd1ZZGzngdenSPWFMZX9MXokJ01BhJsQylsy9bjkW4MfFZpOXZzYn3SoI6a5ws1yWqoMfOn85UFGV7u7C8HilPzYL3D58DU7Ue4yMw3r4j6Gl0fReVYZKQU33dbJd+FSPixmPfBiiZFmIhG61NkeMLWgUyRKQOwDEX25DUNfbQWjrtQKt9558ZU7MFhbYmEoxyp7c7kwrQTYJhBOaZH1KVOe6Ku7WUYfX890kT6kTS4xHoyHV4eNA5QjdpGB+FTdYsJJHAchL/ySwBDWlBwJXz6ZujZ+AJNrJeesL7m9N5i5K0iKMOMzanwji4op5hvuNaOnTiilvY1uu5divHVNt8L4DT1O4sFQVvSCwoFLd1novvhK+T/f1zjYAR4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(38100700002)(86362001)(82960400001)(36756003)(2906002)(6512007)(6666004)(8676002)(478600001)(30864003)(6486002)(5660300002)(41300700001)(4326008)(44832011)(6506007)(8936002)(83380400001)(2616005)(66476007)(54906003)(66556008)(6636002)(110136005)(316002)(66946007)(66574015)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6uvov2IZ2jfCGGZS8dgKLAmjmcCjTMHlhvD+3RB+oa/CwBviX4qlQZA1fX?=
 =?iso-8859-1?Q?LztTElyEdlL/IL6FZ5JZCBdP5J5vYICFeP5xXghzd+Omwh8/Uhxn5YSupa?=
 =?iso-8859-1?Q?xqiqrgl28s90Sba8e67u/poh12F1hhC15QoL/p0qyV1AIG6XGUs6gOClao?=
 =?iso-8859-1?Q?BAUMlGbsSMqqWCS14SdaR1Ezo0WuSmt8V+WhD7JzNutkbWNBD9XZrt7TjO?=
 =?iso-8859-1?Q?2atZzYx2HYH7nZAtbtltxTWHJBGwIRH5QTStMsun+l3QaPhbcUfnku0UXi?=
 =?iso-8859-1?Q?yl1MLjnP8O/soOjggKKViXKGn6BnNSxaHcLpLLTfHTHDTCwJbRgJPJwvZ6?=
 =?iso-8859-1?Q?mI4fYHtfTRcR2cS1ZCFaFN16H0dF+8fHH+BucvV7P9MVoKrmwUwecY6grm?=
 =?iso-8859-1?Q?kDnUiaiK8xRvc6/SUVy8547Fg1dSoTPV42sHXjyYSXTt/DBnOxlH5lwRVW?=
 =?iso-8859-1?Q?WMaC3pnL35yXjBfo5PHzydJgF5wF+6dxFB6oTiiW+RyqF0yT3nb7YvW3IH?=
 =?iso-8859-1?Q?K0pE1RMyYe2GgwVfaXv/KYnDN4A7ME4EbndCrwVEyCP6KgC6DCP5e/M3ER?=
 =?iso-8859-1?Q?KTweAp2Ldz71OjzcCuLiUjlHG0VaQ9ohEOT+IQBmpqA/BaVBlJmc3JYxou?=
 =?iso-8859-1?Q?ajJmq1oRw+/eeCjf8hwihWmDU22cY+1vfQGoAqkn8NjMKooGVpNafH//QD?=
 =?iso-8859-1?Q?e79Ww+XtngT1dJqAMIVCE/cDXsOi5WpZD/TSoyXuzO9H7251Da3srweAbB?=
 =?iso-8859-1?Q?bOuHEm9bgwV7U3PsMlaayXJ8MyYI/Cus9ERJsNcpmb4fajTZxSLJiUUuym?=
 =?iso-8859-1?Q?Ndxz49pevRN4h/9EB7IIOM1Y9FYAPJeQJRzpguGvKzvnQiRm3RMgUetDdl?=
 =?iso-8859-1?Q?iwhKEbWIx1ojR6ikAmVmb2IBcO+SHdW/Jhb0yfKJh0V9RCiNzx1H3P96oe?=
 =?iso-8859-1?Q?THb5abf+6wwMOXk9gRRU1Fop0aqhSMdCKkyjfUsbN4iZp1nQPipoV+8kPs?=
 =?iso-8859-1?Q?a4KabrebnyNzIeOHa1ZthHU2/j1Ce7x4kUGuGPMBVGMQL6ka1Li4l13jJ5?=
 =?iso-8859-1?Q?K2+j82ppo7wzXFZYihOrG+bw6eCM+KWb572knHoscicym4QkBGuZR711Bz?=
 =?iso-8859-1?Q?3XocFBAa9td3e5iil/+5wwj9oOwON/CN6Fqm+prpICTu62GhZH7oTha/9H?=
 =?iso-8859-1?Q?xf6IjQZV4tZT9e6wdQgxpFTPfyvo28YMvELEEn3CI57AsPo4r9eK8WtK8C?=
 =?iso-8859-1?Q?fKgeQLw01zxfOOtBQIC9JXeFpQ+7/sWx3muqTo6/V2/AflgFdj7Gx1Anwz?=
 =?iso-8859-1?Q?WK/CzptYjSScCJ9nEXcyihGHrc3vpcOfTmgf31N8K9Zfd7b0kApponf12y?=
 =?iso-8859-1?Q?oF8ZR/aRoIlEbJ7vTNOJ6irW1+A6GALU1TnQQEtwuXoSPnt44O9llC4ZXw?=
 =?iso-8859-1?Q?bkuYecfONYgsd8L28Yc+xt0VsiXJlHNdHD7IRM/Ai8G0+pmmAP+vSRy4zV?=
 =?iso-8859-1?Q?XIVDoNZeJjJpMrct0Juq/NoHqTPxozjtRQ7gwbb8YdMhjM8nt9Z9J1OjAS?=
 =?iso-8859-1?Q?u4tt7d7uGk7pzQ9BwSAe1HvJyf8lzz9XFjw0TV/9KQO5dMYFeqJRT7Kops?=
 =?iso-8859-1?Q?iuwhkz8BKGaFPaEY1Re/duycntSKdjJRRs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afafab7c-2207-456a-8b1e-08dbc90cdbe5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 21:15:27.2879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +7IC9nOmDUyHwIsOaKyl851y/rGD/RetonQCPDfptXYULM5BD9hELZU28E1/iv2QRj8ra3l2p46U11nLqkKtng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6146
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
Cc: Jani Nikula <jani.nikula@intel.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 09, 2023 at 12:22:44PM +0300, Luca Coelho wrote:
> Hi everyone,
> 
> On Tue, 2023-05-23 at 23:52 +0000, Matthew Brost wrote:
> > On Tue, May 23, 2023 at 09:38:49AM -0700, Matt Roper wrote:
> > > On Tue, May 23, 2023 at 01:56:53PM +0000, Matthew Brost wrote:
> > > > On Mon, May 22, 2023 at 08:28:05PM -0700, Matt Roper wrote:
> > > > > On Mon, May 22, 2023 at 06:15:27PM -0400, Rodrigo Vivi wrote:
> > > > > > It is the maximum protection we can do with the current infrastructure.
> > > > > > 
> > > > > > Cc: John Harrison <John.C.Harrison@Intel.com>
> > > > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > ---
> > > > > > 
> > > > > > 
> > > > > > RFC
> > > > > > ===
> > > > > > 
> > > > > > Okay, so, this is more an RFC to brainstorm the future of the force_wake in
> > > > > > Xe than anything else.
> > > > > > 
> > > > > > On i915 the force_wake is built-in the mmio functions at uncore component.
> > > > > > 
> > > > > > With that approach we had few historical issues iirc:
> > > > > > 
> > > > > > 1. Display performance with vblank evasion that requested uncore to provide
> > > > > > the 'fw' variantes that are actually the ones that avoid fw (contrary to what
> > > > > > the name suggests).
> > > > > 
> > > > > In i915 there were more differences between fw and non-fw variants
> > > > > of register functions than just forcewake handling:
> > > > > 
> > > > >  * _fw() functions assumed that the caller was already holding
> > > > >    forcewake, whereas the non-fw functions would obtain it themselves
> > > > >  * _fw() functions also assumed that the caller was already holding
> > > > >    uncore->lock, whereas the non-fw functions would obtain and release
> > > > >    the lock around each register access
> > > > >  * _fw() functions do no tracing and no debug assertions
> > > > >  * _fw() functions do not check for unclaimed MMIO
> > > > > 
> > > > > I don't think the first bullet there (forcewake) really mattered much
> > > > > from a performance perspective.  For display registers, a quick binary
> > > > > search of the FW table (just a handful of CPU cycles) would quickly
> > > > > determine that no forcewake domains were needed for those register
> > > > > offsets, so we wouldn't be doing anything with forcewake at the hardware
> > > > > level at all.  For display registers, the more performance-relevant
> > > > > aspects of using the _fw() functions was doing all your register
> > > > > accesses together without contention with other MMIO work.  I.e.,
> > > > > holding the uncore lock over an entire set of registers rather than
> > > > > grabbing/releasing it for each one, and (for vblank evasion
> > > > > specifically) doing it all while interrupts were disabled.  For debug
> > > > > drivers, there was also a bunch of other stuff that the _fw() functions
> > > > > bypassed (e.g., tripling of the number of register accesses due to
> > > > > reading FPGA_DBG before/after each register to look for unclaimed
> > > > > accesses).
> > > > > 
> > > > > > 
> > > > > > 2. Missed ranges updates. Sometimes we messed up with the ranges, there were
> > > > > > other times that the spec was updated and we didn't get the notification, and
> > > > > > there were cases that the BSpec had bugs.
> > > > > > 
> > > > > > For these reasons in Xe we have decided to let to the caller the
> > > > > > responsibility to set the force_wake bits for their domains before doing
> > > > > > the MMIO.
> > > > > 
> > > > > I don't think #2 was a reason to skip forcewake in Xe.  Not noticing a
> > > > > bspec update (or the bspec itself having incorrect information) would
> > > > > lead to even more mistakes if the caller has to explicitly grab the
> > > > > appropriate domains than if the driver does it implicitly.  The explicit
> > > > > handling only helps in the subset of cases where we blindly grab all of
> > > > > the domains (as we do during part of init).
> > > > > 
> > > > > 
> > > > 
> > > > MMIO access that requires forcewakes really only should be in a few
> > > > places, off the top of my head:
> > > > 
> > > > 1. Init
> > > > 2. Reset
> > > > 3. Sysfs / Debugfs
> > > > 
> > > > In all of these cases I think it fine to blindly grab all forcewakes.
> > > > 
> > > > Please chime in if I'm missing something.
> > > 
> > > I think as we implement more features in the Xe driver we're going to
> > > wind up with a lot more places where we need to access GT registers at
> > > runtime.  A few examples off the top of my head:
> > > 
> > >  * EU stall sampling
> > >  * Perf/OA
> > >  * EU debugger
> > >  * Various OOB workarounds that ask us to twiddle a register at certain
> > >    times in the driver.
> > 
> > Hmm, ok a lot of these I could make the argument that these are not
> > normal operation so just grab everything and call it a day. If some of
> > these fall into the category of 'normal enough to be optimized' I can
> > also make the argument it is no more complex (perhaps less complex) to
> > explicitly grab the forcewake than having the logic auto-grab the
> > forcewake.
> > 
> > What a compromise of in a debug mode we auto-generate the asserts based
> > on a table but we still explicitly grab the forcewake?
> > 
> > > 
> > > > 
> > > > > > 
> > > > > > However I'm seeing many questions and doubts popping up:
> > > > > > 
> > > > > > 1. Are we confident that we are not missing any wake-up?
> > > > > > 2. Are we confident that the domains are set correctly?
> > > > > > 3. Are we not wasting power if we are waking up ALL the domains instead
> > > > > >    of some specific one?
> > > > > 
> > > > > I think we're only holding ALL domains during init; for most of the
> > > > > runtime MMIO accesses, I think the code is currently attempting to only
> > > > > grab the domain(s) that it thinks the registers it's accessing will
> > > > > need.  Although that might be working right now, I'm a little bit
> > > > > worried about how that will scale in the long term when a single
> > > > > register might be in several different domains depending on what
> > > > > platform you're running on.  There have definitely been cases in the
> > > > > past where groups of registers migrated from RENDER to GT or vice versa
> > > > > between platforms, so the exact domain you needed for an operation
> > > > > varied by platform.  And things are even more complicated if you're
> > > > > doing any MMIO against the media, since the hardware seems to change
> > > > > exactly how it splits up the media power wells somewhat often.
> > > > > 
> > > > > > 4. What about the display disconnection now because i915 and xe have different
> > > > > >    mmio approaches but reusing i915-display?
> > > > > > 
> > > > > > It looks to me that the cons of the current approach are superseding the
> > > > > > cons of the i915 approach. But I want to hear more thoughts here before
> > > > > > we decide which route to take.
> > > > > > 
> > > > > > Maybe we have that domain as part of the mmio calls themselves? Maybe
> > > > > > a double approach where the caller is responsible but mmio has the range
> > > > > > information and double check it?
> > > > > 
> > > > > As noted above, part of the challenge with forcewake is that even if the
> > > > > caller knows it wants to access register FOO, and even if it know FOO is
> > > > > a GT register that likely needs forcewake, it's sometimes challenging to
> > > > > make sure it's grabbing the correct domain(s) for every single platform
> > > > > the Xe driver will eventually support if the power management handling
> > > > > changes.  I think that was part of the motivation for encoding the
> > > > > tables into the driver in i915.  It seems like GT power wells don't
> > > > > change as much these days as they used to, but it's hard to say whether
> > > > > that will continue in the future or not.  Who knows...maybe they'll
> > > > > eventually start creating dedicated domains for stuff like blitters,
> > > > > GuC, etc.  rather than lumping all of those into the "GT" catchall
> > > > > domain.
> > > > > 
> > > > > If we do decide to go back to implicit forcewake handling with the table
> > > > > encoded into the driver, it might be worth doing something sort of like
> > > > 
> > > > Let's not do this intel_uncore.c is an unreadable mess, I don't want
> > > > anything like this in Xe.
> > > 
> > > When you say unreadable, are you referring to the macros that generate
> > > the table lookup functions?  I don't think that macro magic would be
> > > needed for Xe since we don't have to support old platforms that have
> > > very different forcewake behavior, and we also don't need to generate
> > > separate 8-bit, 16-bit, and 32-bit versions of each operation anymore
> > > (since I think everything in the GT is 32-bits these days).
> > > 
> > 
> > Just the entire file is unreadable in general, trying to avoid these
> > types of files in Xe, avoid traps of the i915 did this so let's do it in
> > Xe, and over engineering our driver to avoid hypothetical future bugs.
> > 
> > Matt
> > 
> > > The forcewake and shadow tables themselves are pretty clean in i915
> > > these days, and if we move to autogenerating them from a text file, they
> > > can become even simpler since the text file will basically be a cleaned
> > > up copy/paste of part of the bspec table.
> > > 
> > > 
> > > Matt
> > > 
> > > > 
> > > > > what Lucas is doing in the OOB workaround series --- drop the
> > > > > per-platform tables into a human-readable text file that's more similar
> > > > > to the format used by the bspec (exact ranges, forcewake domain, MCR
> > > > > replication type, etc.) and then provide a small parser program that
> > > > > will convert that into actual code (and do things like consolidating
> > > > > adjacent ranges).
> > > > > 
> > > > > > 
> > > > > > Any other idea? Thoughts?
> > > > > 
> > > > > Once the big GT vs tile refactor stuff I have in flight gets finalized,
> > > > > I plan to follow up with another series that creates a more appropriate
> > > > > MMIO target for register operations rather than using "xe_gt" as the
> > > > > target (even for things completely unrelated to the small GT subset of
> > > > > hardware).  My idea is that you'd grab an MMIO target structure for MMIO
> > > > > operations against a specific hardware unit, and then the info inside
> > > > > the MMIO structure would be able to figure out if there are additional
> > > > > checks and/or operations it should perform.  E.g.,
> > > > > 
> > > > >  * mmio = xe_mmio_for_device(xe_device *xe);
> > > > >     - Used to submit MMIO operations against the root tile of the PCI
> > > > >       device.  Only used during init (e.g., to read the registers that
> > > > >       tell us which tiles exist on the platform) and during top-level
> > > > >       interrupt enable/disable (since all interrupts are routed through
> > > > >       the root tile).
> > > > >     - No forcewake needed for register accesses through a handle of this
> > > > >       type since you'd only ever be accessing sgunit registers for these
> > > > >       types of things.
> > > > >     - Register accesses through mmio can warn on debug builds if the
> > > > >       register appears to be in a GT-related MMIO range.
> > > > > 
> > > > >  * mmio = xe_mmio_for_display(xe_device *xe);
> > > > >     - Pretty much the same as handles returned by xe_mmio_for_device(),
> > > > >       but if a handle of this type is used to try to read/write
> > > > >       registers outside the display range, we could have debug builds
> > > > >       throw some extra warnings.
> > > > >     - Unclaimed register detection could be confined to accesses through
> > > > >       these handles.
> > > > > 
> > > > >  * mmio = xe_mmio_for_tile(xe_tile *tile);
> > > > >     - Used to access non-GT registers that reside in a specific tile.
> > > > >       I.e., sgunit/soc registers.
> > > > >     - As above, no forcewake needed, can make MMIO operations warn
> > > > >       if used to access a GT range.
> > > > > 
> > > > >  * mmio = xe_mmio_for_gt(xe_gt *gt);
> > > > >     - Used to access GT registers in a specific GT
> > > > >     - Does automatic GSI offset translation for media GTs
> > > > >     - Can either do automatic forcewake like i915 does, or can do debug
> > > > >       check+warn like you have here.
> > > > >     - Can make MMIO operations warn if MMIO offset is outside GT range
> > > > >     - Can also trigger warnings if a GT non-GSI, non-media engine
> > > > >       register is accessed from an MMIO obtained from a media GT.
> > > > > 
> > > > 
> > > > Ack on this if we keep in managable, worried code / feature bloat those
> > > > that will result in a similar file to intel_uncore.c in Xe.
> 
> Just to revive this thread.
> 
> I've been discussing this proposal in the context of a change we need
> to make in the display, which is to introduce a wakelock for some
> registers access in order to be able to remove the DMC trap.
> 
> We came to the conclusion that this new implementation is very much the
> same as the forcewake proposal here.  From the display point-of-view,
> we could simply have a new domain and range of registers to protect.
> 
> We _could_ implement a separate "wakelock" mechanism for the display
> part, but that would be mostly duplicating the entire forcewake
> implementation.
> 
> So, are there any plans to implement the current proposal? Or any other
> plans related to the forcewake implementation for Xe? As I see it, the
> "wakelock" implementation in the display depends on this.
> 
> Any thoughts?

Hi Luca, thanks for raising this again here.

So, as I said in the past, I don't have strong opinions regarding the
overall forcewake approach.

The since GT MMIO is not used very frequently, I don't see a problem of
leaving that up to the caller to take the right domain when needed, or even
the FORCEWAKE_ALL domain. Instead of forcing all the callers to
go through this extra steps and then have to opt-out with the '_fw' [sic]
alternatives for the cases where the forcewake cannot be checked underneath.

So, for the new display wakelocks, that's the problem of adding them to
the drivers/gpu/drm/xe/compat-i915-headers/intel_uncore.h where the converions
from i915's intel uncore are happening to xe_mmio? So, when using the
intel_uncore's '_fw' variant you skip the wakelock and when doing the regular
mmio calls you just add a wakelock_get/put around the xe_mmio call with
the display domain. And in i915 you implement inside the intel_uncore.

What's the downside of this approach?

Trying to understand all the pros and cons of different approaches, and
bringing some people to the discussion.

If we implement the forwareke underneath the mmio call, display needs
to anyway implement it twice on the i915's intel_uncore and on the
xe_forcewake, no?!

> 
> --
> Cheers,
> Luca.
