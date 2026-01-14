Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E55D3901A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jan 2026 20:38:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E05610E36E;
	Wed, 14 Jan 2026 20:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mc5cIXD7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47410E36E
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jan 2026 20:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768423098; x=1799959098;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=scrl4MtXMJUaDQkVYnOoOTNJOAKf9AQdS5xVfb3/Dg0=;
 b=Mc5cIXD7FQfXRRgVSQI+2Iobm0CQdAubvtsz7CN9Spuj8mv1Nb/eWq3d
 vFf0BEJnXZkO8Q7xwlhcjUFwGxmH2Z7QpIOQX+o8C3qB592llPgMwu4qz
 bKnEXSmJFVAOmbCJPrr1U735L4sJHokY3UEjJ/dMUAw7q/aXyPvwZUi2w
 guA/7ze+aZP7uVUqtsSmCBGeUHFmRXgQ9PJf8jGfFsqw72GRAD556xC7b
 4VdjnqUbzJjXBeTUD9FIYO0DuCxWDwahHdPm43q24UkRQnce6aQcLUOAA
 gXnU2vDfxK9go+2tOdYKWNZltpvbtim12D1KbhUKEqLU40qEYZ+iYbiVK g==;
X-CSE-ConnectionGUID: QpI+4G1VRnCGQXbSA2KFYQ==
X-CSE-MsgGUID: yhrD2pWNQFCn0b6OS3LDhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="72313665"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="72313665"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:38:18 -0800
X-CSE-ConnectionGUID: 8rfkKAFYQz+zeBntMZ8Pvw==
X-CSE-MsgGUID: iXvoFowCTwCkHr0u6OMDmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="203994481"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2026 12:38:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:38:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 14 Jan 2026 12:38:16 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 14 Jan 2026 12:38:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmtjzcEZzhzKpuyyugKLcNJPxRPtPA5bzJTMSOMvYUeHDqNCk0UZ4o4dBpoK6J/ngotuZGkQ1YuSZtFT8+R8jJ4bIAwXxWTxBbEqTjY9az9B51IEuCZpKrw5clxPpT+68VeKraww3eC5WmCXYWkWJpIud/3XEnpp4bMyJZwd483R45VmmYxMLjmbefgA2OHiAWw4bYhPf9pxlNMNOz4ZPJCexm2OaEjXZ5jwZG4s1lpE5+e+PHidW8pwoMmSx9V0NVdKxq2pdfCBoXx/Fe2eDLUuxm3fuAlCiwQ+ZZmHu/PdjgdTBvmzPVvrm8NJIw2qccF832XPLg3GKGSDTWVkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeJ+JdbK2EWLsZ8t+wm18j/3q5Qzi9XXkjGTHPtyNDo=;
 b=APrUAVK2m/tabBW0ouYV93zBefUuaSBK0hskErsesYOzEXx8zHCzcqmSnsIVQYOFBDE4U3y3Hx3U/3Q/NfGzlQ3x++r68om9tMY8yITM7y4nIfBoELru5dabMIS4rd5iQPkn2jO9svlS/5ZDGhO5oBhYbA3PmQfQidTtk9IchJv6oIz9zc+b2n1dAhFF55czEy8rrk5mdyDyeS89vmCJYRIDym93AqxgMGzHPUCwcpWbhns0KyEP2eTi+dVZW9sA8s05EOS9dBaBgoJEV/HmmKvViz+G9hrAS79iSMpVP3QnBs+WkgdxoHYo0su/cKSExRwz7HJ7VEJF47Lpm36Y9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA4PR11MB9252.namprd11.prod.outlook.com (2603:10b6:208:561::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 20:38:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Wed, 14 Jan 2026
 20:38:14 +0000
Date: Wed, 14 Jan 2026 12:38:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH] drm/xe: Reduce LRC timestamp stuck message on VFs to
 notice
Message-ID: <aWf+tGpSKfxmaQ+g@lstrano-desk.jf.intel.com>
References: <20260114184905.4189026-1-matthew.brost@intel.com>
 <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf8ccdcfa6e3e22b0979d88f6eeea5f2cf4e4a2b.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA4PR11MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: cd9040be-5ce0-43c6-06aa-08de53acd754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Lu4oU0hdJbXQzDAsVI1seOHPuQskPKfgRhe5VHqVftUT06IJx9Y3nHGtLJ?=
 =?iso-8859-1?Q?J6+EWJPRkctSokJ4kyu63L8OdFRBn/gR6/WzWcBqwkoD9LdIIcsoWC+Kub?=
 =?iso-8859-1?Q?zWR/ASbvOi9+zKT30ZSzaWQ/bKXc9Vgt2SA9isxujJn8JSFWOWR04ziijm?=
 =?iso-8859-1?Q?iLhnWGH75mmHX31UBSqT5/TNrg0B1rUtDkfz6nwKr9URDv2G2YpqEsh3bN?=
 =?iso-8859-1?Q?DSje8+4qwzwqQstiH/f06v2mdetQgVuq9icEZ2s6NXZ2uZblp8l/QqaNq4?=
 =?iso-8859-1?Q?eBTpA3CHKL13EZmCEprzuycUQplL+Gducr29PLnWz6ddgPQKkHVklNBpj2?=
 =?iso-8859-1?Q?tax6shxG/4hRcmCvYRS/1JztMaYx7bWEj1kMFzIej0K5rw1kkzsGAEj0oj?=
 =?iso-8859-1?Q?XiI/ugZMf2Xdw39B7EJc0Bojvwlig+Fj2eat4pN/k8+4AoL0zqLyCEm/07?=
 =?iso-8859-1?Q?1DLHTqct4My6tBHwQG0iy6qCYRFDYY/95EPepAapLHIuAX3/RwSYdpYhcw?=
 =?iso-8859-1?Q?2LU+2YNVb1//jwGyuJxcOzPpUbkvMyQXl8T0az8iF5lAaNKJldd8/iUvZv?=
 =?iso-8859-1?Q?kfjQiQhBYH90aI3BwlWRWJHJ5dgBWcIVkzK4Iv7Va3oItwIw/x5YVMwE6s?=
 =?iso-8859-1?Q?VXt5tpnlFFYXklYMRIBt+BWx+ATq5B2jCLFpdSveHvWfziPQXePEpx1IJb?=
 =?iso-8859-1?Q?BzKpnc8iaKUGepOJRHc67ZA1wK5Xk3BagD6XvZ9SrtPNte9VqXPpIeHo04?=
 =?iso-8859-1?Q?ZASKyxchdYw1LYFDPlNJ/o+SfOu1J//3KUgqEudSYZa1Zm+olVC5jKSP4P?=
 =?iso-8859-1?Q?sV1Crz0hAwh5TUsQw3rAFIZSWJmc2TbzggKApL7P6Lqh2RpzBXsXju41xt?=
 =?iso-8859-1?Q?//O5M7p/oXJ5xV8lckXptXfvinO9r/WxF9VonGNTYUzPTDmXF5ICyzfl0s?=
 =?iso-8859-1?Q?FGn2qe2cBcfiOrdip3xX2InNPh3iz4haHhi7wv0YAO2KBuUsOcKYsyOsxH?=
 =?iso-8859-1?Q?SunCuBitSaN4nQSc42M3nAGf9/nWNPQoqqtlv3erUiEFDdi/Yh5nH039+F?=
 =?iso-8859-1?Q?HPoh++/Afya/Wm8DucTxbbYOVURabk7XA6UBTpOJFG1nU2FVpUE7Of0uHb?=
 =?iso-8859-1?Q?7M8CF7pnxoZEoZ+lRHOaqo/fTd9P7CQYCPYt64W8a8AiXog+BbhOMdwgqM?=
 =?iso-8859-1?Q?bcQ8wEJSs7NsqT99ls8e2W95kNSS2omycf7bsVwwxkzV1kwQ7kKsozsMnP?=
 =?iso-8859-1?Q?NzdcOYnKl2LQNGlEoQGxQVtILF+Y3sFKTVpC0IqegCRp8i99UoeWDhieVw?=
 =?iso-8859-1?Q?aYx8N7MQoOj5uZo0Qth5TUydBKboRYwKlB5lOtBZ+oNb59fHNHZ5S4b0Zk?=
 =?iso-8859-1?Q?ha3NAu6v3qc7P9zRhXWcCZJ/ISnilrlSncDZbpAZ+5aIU9EppZ9vMB1HsY?=
 =?iso-8859-1?Q?jzQPLYKU6U6Gwx8o/45hZBqALN/ibT7OlKIpe/52pfcqtrfxdah9w6ovvx?=
 =?iso-8859-1?Q?CgrvzYf2ZzbMMaDBL2oGSS4JNAQmI/uFIQP9dQoZsUyEXLsuqzGAjsJf6f?=
 =?iso-8859-1?Q?4cN0CV2K3w8kx3KqRP9fgO9Lnw8Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?lWqlnWMehqUIZWdD23ZvnNtRUg0CNzXKFrP9iwz8BNZfgrx/WXFY8inXYa?=
 =?iso-8859-1?Q?+5ujLtb3/zKt5quXGWXxJXXM8nRjxvHNd0zxqKHCxS7RqMTsQ0iSw+xTQT?=
 =?iso-8859-1?Q?7jYxz2LLUMj0OYU+Qcard3A4DaGu6JQyFEXAqoIUc9dCMC12Rs4wAJERBg?=
 =?iso-8859-1?Q?uvN9aPpHCtDUi4GNMokxXIayNlzbCixSYiL4msESdTP2dirr/Uplo2qmVF?=
 =?iso-8859-1?Q?jUJaBfnt6U86/37whT/I6W3OPGJkvIxGUnm2U9XFJaatV3Nwl38DvZ96J2?=
 =?iso-8859-1?Q?G0ApobBGKunGT6Cr0ZLaB0HasPvcGAkdStqt/c6p6YX+dw5PSm+jUsRFtH?=
 =?iso-8859-1?Q?mfu0XtEVDoCjOmne7VMp131L5vh1xS3fnXytNM0ItBrTvlQ1xnGh9F8ayI?=
 =?iso-8859-1?Q?nzBn8sTSU1u3+b7wH6CtK0aqQPJQGcxRIvTIiGgspFa/6qM5lLcTINX5FL?=
 =?iso-8859-1?Q?dPQrgGXgh9S6gVSywMhd3KKxN9gngXChJjYr2wPNE7Zb9jZIbdDWiT/5os?=
 =?iso-8859-1?Q?+rxZCHeup3usCgEBIaticJzWFG4LqEUttRGBZb5ADve1HHNKh9nUCzFv6a?=
 =?iso-8859-1?Q?J6Ski+0uoJD4PI/Eyfu59PuM8qzdwmevbd/DpiJEMWXaA4VyKbeEQxfnXq?=
 =?iso-8859-1?Q?iVGNNUJXcJX2Myn90HrtMSRFBoF5Ucghc2lL476pETbOc19j735zhrRSks?=
 =?iso-8859-1?Q?wWhLRdYUjDwO6Sz41XUFKXlIXrkFUHwPOU0LmTOII793i2PIZem6Ul4FX5?=
 =?iso-8859-1?Q?xx8w+1JIC5u9hvX3kvZruNzxWQ/WOdCXNuWbdrGpHkM/Msia8H/tlOxWr5?=
 =?iso-8859-1?Q?5Mi56RLhprlitrJlyMq5//cWbKPhNtBn6ri0almNyA0lm5IMEJr22Fc62Y?=
 =?iso-8859-1?Q?gp2r2yEWxd3zlZxXfDnwKhQiSyzOHn9oU75gw+a8YS4yqI3cN5tptzJzlc?=
 =?iso-8859-1?Q?lo9gUhFLvvvkUR8n2VUmLKZ9aueCg/FDrgmjtzH8AD0vrIXSJsxkS6utky?=
 =?iso-8859-1?Q?PUVGXTzt+hLGtLwcqO94TvE6OrDxLla6nTlf7E9Y/KHgjOeJGoUCkImU5t?=
 =?iso-8859-1?Q?WxyKhSCzCJfMQf8DINw3CLj34w3uFc61GdD3CpbR1t5F+/lSxM61bLvEvU?=
 =?iso-8859-1?Q?0xlELUautwbexBQl+uYd1feeeVUruKKlG7pYR5p5jB6zuwDhQJWrS8YyUl?=
 =?iso-8859-1?Q?nOczkAdvdYiF3n5iaWVd0LJlqRZNxUoHyhay9krIOYdHhnZ2r1La6NciqZ?=
 =?iso-8859-1?Q?3a8rAbpcZXTgOFOy6MXczLzp2uAC1TfsU6ubMBaVdCtaOuFBNt3YmqBIoV?=
 =?iso-8859-1?Q?CanKWQ5T1JP1+F/88Ukx/YCdf7mAsz83o4XuX1lIhsp4qJCYKwpcUbk31p?=
 =?iso-8859-1?Q?dQxdLI0GRQl4vzObNdJ7iAXnN2hSJoO+KCMvW86RsrY3d/GWWDQvNt85o+?=
 =?iso-8859-1?Q?QrBd6hPuhCCHFrH8UFOLvBYn1OaJsQblkbdls1689Rapuz5i0YmzILro+Z?=
 =?iso-8859-1?Q?Qn36WgShjzaKQdadge2X6+yabcS+J1eRf78tJ3vCZ0Y+KCIzJbR3sqA8xV?=
 =?iso-8859-1?Q?4OEbbPCDBuOM5oNtcbikMK3jFnOFP5e5bph0bnA5Va5P9IVyEo8b3gMKnH?=
 =?iso-8859-1?Q?hWxqx01cwzadbYWlHZrVfQODpVt/TLSCQ/OlH783Ra/6rO0olo6NU6yVn/?=
 =?iso-8859-1?Q?QzfwcZM1m3uSerAsvhEUcNP5Kexh6QGRWuQKYr6OKAMawD96+c2/Bqse6s?=
 =?iso-8859-1?Q?nXi/GkAUTomAQ1nTUzAvGl5bDhuSovw8SstSQ2JDjlo04T2mXToOqelFoj?=
 =?iso-8859-1?Q?BbRLNGWntMYI1vQ3LGgn7qobwRRH+bQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd9040be-5ce0-43c6-06aa-08de53acd754
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 20:38:14.6742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/Xxacuxjx6morw2C30v8Fzq7sIF5rDgFEJbybnNDbyT83Vp4cQkQxbI90jTGBz/WoGasYS7o0uPMA4NWw5uHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9252
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

On Wed, Jan 14, 2026 at 01:25:55PM -0700, Summers, Stuart wrote:
> On Wed, 2026-01-14 at 10:49 -0800, Matthew Brost wrote:
> > An LRC timestamp getting stuck is a somewhat normal occurrence. If a
> > single VF submits a job that does not get timesliced, the LRC
> > timestamp
> > will not increment. Reduce the LRC timestamp stuck message on VFs to
> > notice (same log level as job timeout) to avoid false CI bugs in
> > tests
> > where a VF submits a job that does not get timesliced.
> 
> Ok and if this happens and there is an actual problem, the queue will
> be banned it looks like from the earlier patch, so should still be ok. 
> 
> My only question is why not move both cases (VF and non-VF) to notice?

The non-VF case the LRC timestamp should always be moving, if it isn't
something has badly gone wrong and CI should notify us of the error.

Matt

> Is the idea that in the non-VF case, the reset is already an error and
> so the extra warn is ok? But in that case I'd already expect some other
> error message to trigger CI (like the engine reset notification from
> GuC). So the extra information here really isn't doing a whole lot more
> from a warning level (CI triggering) perspective.
> 
> Thanks,
> Stuart
> 
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7032
> > Fixes: bb63e7257e63 ("drm/xe: Avoid toggling schedule state to check
> > LRC timestamp in TDR")
> > Suggested-by: Daniele Ceraolo Spurio
> > <daniele.ceraolospurio@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index be8fa76baf1d..0311c89107f9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1319,9 +1319,14 @@ static bool check_timeout(struct xe_exec_queue
> > *q, struct xe_sched_job *job)
> >  
> >         ctx_timestamp = lower_32_bits(xe_lrc_timestamp(q->lrc[0]));
> >         if (ctx_timestamp == job->sample_timestamp) {
> > -               xe_gt_warn(gt, "Check job timeout: seqno=%u,
> > lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > -                          xe_sched_job_seqno(job),
> > xe_sched_job_lrc_seqno(job),
> > -                          q->guc->id);
> > +               if (IS_SRIOV_VF(gt_to_xe(gt)))
> > +                       xe_gt_notice(gt, "Check job timeout:
> > seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > +                                    xe_sched_job_seqno(job),
> > +                                    xe_sched_job_lrc_seqno(job), q-
> > >guc->id);
> > +               else
> > +                       xe_gt_warn(gt, "Check job timeout: seqno=%u,
> > lrc_seqno=%u, guc_id=%d, timestamp stuck",
> > +                                  xe_sched_job_seqno(job),
> > +                                  xe_sched_job_lrc_seqno(job), q-
> > >guc->id);
> >  
> >                 return xe_sched_invalidate_job(job, 0);
> >         }
> 
