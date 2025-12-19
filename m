Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9ECD78770
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 15:56:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2389D10E4AA;
	Fri, 19 Dec 2025 15:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRXoyL25";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A6F10E4AA
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 15:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766159810; x=1797695810;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WfzVwuvqCxOT4udMv1ymh4DqZpFdD+T9r1xCUO3baYk=;
 b=SRXoyL25rO5+RzG4thgPIgoLB+OIM3PRHgOaraFsRJM2uuby8Vhmlh3a
 ToxkWTT61uxdsCo93RPqzFkIELPxKalPDsgWnNC/4OxUuu0r0vXDMi9u9
 d6B1+JX3HTseFd954A99qugYtEi0Yra63whIO7bv8UYWKLl/8OEJd38Nf
 lTdm/GrkrI7Wb9uYD9bXabSlzuhi3vnpng3ZMCNXsmt//RD6mqa9vL/mE
 hdFG3xrDsCWntmT8MIem21JvERNxdVC5T9MUiJkJa6aSGzFMHLjcpo7Cm
 kejwT53iwlEQ/ep//VqOXDoBEx1TKT/A9E6LmgeIsc/sdguku90kE4PpL A==;
X-CSE-ConnectionGUID: wbKI9LVZQEunY9DVlMPQTQ==
X-CSE-MsgGUID: yGjmpw8ATt2KCvvbBQUlXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="68098432"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="68098432"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:56:49 -0800
X-CSE-ConnectionGUID: 6Dbyw75LSXGIRjHJOlpq8w==
X-CSE-MsgGUID: g6pfsw8mQACsF/9MvOsLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198483166"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 07:56:48 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:56:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 07:56:47 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 07:56:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngySWGhMnr96YtG4jkT6Ked9ocm1/2ouYqHiPgWEKd3+c+hI9ByIf8a5pxhOq0ClpnPGwoyErhMFR3U3yF3MEXqjxpN1ulOR68vrkRP/1O9NZ7SN0+ezDhtdPYuzivwx79PFlcVNTKc2ZhZcYc+957ax0rY7U+k58QEaDrWm/uW7wvss45gPptv699m6y5zkZiexfRLn9XWuwdvXtq9zpUrLhzBRe1vrqoi6tSzR8Be436743WnNKUyKOEDJ43ZrEDV0UJmnSjlT/7pGt8Y8c8U926fBY/+nmKtVFqwb4L8Xc1Z47Es0bMnZNNJwfZVZ1vPlXo8j3OJecyEehHvsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7LIzD27kXyys0PWMmXauEUBebpTN8fSPwZyrIEhX3U=;
 b=CT0ruS51Kp/xTEJY8LonhCatUpKnGm4jl+D7pmol6IpAOdkuKeFHJZY0PWGU95HdaJCdc7XIU02WnuBwZlpN36v7o5m0EcLaOp1KutJjCYLmT9ygnHyN/e5Qb7xpdKxe0PK7BQ0N0TLdhLfhIBgJx5SYCALMQzGwxanCtWFZg/LpineHidxxvTx/Mg+UjfJyDn9MMRoJIagaPFXMScZPDMkhnm4PDULXCZlsgm1XgIr0RBlosNUiUlxhhuN4+0WMjY5M9U66gN8yVJjWE9uEPBf9i27U5BVk/MGvQEczRRJN3fjADXfFE5lDx/byf2tUjqymvUN1e6Bu1OGdKxqzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7726.namprd11.prod.outlook.com (2603:10b6:208:3f4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:56:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 15:56:44 +0000
Date: Fri, 19 Dec 2025 10:56:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>
Subject: Re: [PATCH v3 1/4] drm/xe/hwmon: Expose temperature limits
Message-ID: <aUV1uHBt1k0h3kXz@intel.com>
References: <20251216114030.226399-1-karthik.poosa@intel.com>
 <20251216114030.226399-2-karthik.poosa@intel.com>
 <aULiyK1tWOxKZLI8@black.igk.intel.com>
 <3849de5d-2cf9-4a06-b35f-428253a4e0d3@intel.com>
 <aUPiXUAji8P9QvFH@black.igk.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUPiXUAji8P9QvFH@black.igk.intel.com>
X-ClientProxiedBy: BY5PR17CA0032.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::45) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7726:EE_
X-MS-Office365-Filtering-Correlation-Id: aed0c43e-3856-4ddc-33a5-08de3f173559
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?x+tafDheIH/EO1/fP0qj8DsTY0+9ryjoA5lNRwQOHJ1RA2ou+TJd2RDFM3?=
 =?iso-8859-1?Q?kUPmhdLV+1gpn13fqmyGah67ejqr+L3fI/unMyaeZ6RN4VKI+eziNduZ8T?=
 =?iso-8859-1?Q?d2Jnqn0RWc/rOPvJ+AfmaaLWoCYoJ764p4K6I7wgl30WptpULq8uoMDPVP?=
 =?iso-8859-1?Q?RyFnTYttK0b7E8wEZSH8nn/MGgRpG3d0e7Dr/76mhsjDsyFpzVMMFAQKII?=
 =?iso-8859-1?Q?xZaiB7v3XpzhCE+0SFg5PJnwagBi+o5t3Uodn3mHti3IcddPq/B1XC9d8/?=
 =?iso-8859-1?Q?7pRLga6MvLdMnJjDjhHwAvCYnQKGH3vcF+Fg2H3BtqTA+bIOrrPMCOLARx?=
 =?iso-8859-1?Q?LZJV7fS2meW55N+qAHa4Iu7KuoatBOIVrS7cwt1i85hEX1sZx5iAOQ3tmI?=
 =?iso-8859-1?Q?1rXyQBtOjGfBQjV3uAmtlWqypHYdrHwnMsyaipfF+1DRohMU6VMjSY7RKv?=
 =?iso-8859-1?Q?CHNuk5nHvIGnvCPUO3/or3kdMaVp6yjaqf0WGCCpGizE8hpc9lek1xe8kh?=
 =?iso-8859-1?Q?uoxtoyZO5TLFw4j6bnHjVBq5gcoMqW2YdOSGQOEBsXojB+Ob2RiZHjTltS?=
 =?iso-8859-1?Q?7VFnzGq4akbKrrDGZ+XQZvTTUjGDRxIG+9sHiDeBX1P6u1WY/8ntIU+pDp?=
 =?iso-8859-1?Q?pjaExryEwKK9YNC6lJF+AWo38DRegiXuKnKDmxUQ907t5OKOkpK4mslPTT?=
 =?iso-8859-1?Q?DoTGtZ8zOtOzNSgpB/F4Tx6C+uPtsWkLXwMUTUkqs87lvGcLGnhXbaF0ne?=
 =?iso-8859-1?Q?t9A2wQVDbCuMTH9M3TV7t/+hj8dDqybsumgijX15RxLivnGtKCAUr9XDU5?=
 =?iso-8859-1?Q?FyoEhEK9ncWNMrbrgWVphO219ADVrNwPyxgvSkBOFgb5WlFHhYwYb4fEX/?=
 =?iso-8859-1?Q?23uxkv2IjEgYnsV2gJXaK1uQBY78p9poSBRtl99nHmzC5dDU/IeCIpRiSG?=
 =?iso-8859-1?Q?jk7W4qPywJV92UdtuAe9V1EJb9FMCCJfeAnRYfUpm5Gf/VtjXkiX8RIriT?=
 =?iso-8859-1?Q?GU0KXU1K498jwF06qIpJtC4/ja6D5u7j6UdeXP9qLIcwG8mM/j6nGHsVTd?=
 =?iso-8859-1?Q?GD0q9edRpI3nlGDLa2hSgPzzc6wX0GjDtsBkGK6+vd79Mqi88kwf12NBJJ?=
 =?iso-8859-1?Q?8ymj+W5HkjlaSLU4XmmLs24KZC3brDzt0clXcMhACop+XzVwdFgNtZw0oW?=
 =?iso-8859-1?Q?CgVRXLSCHHjCRS4FboyRJcQAhIRPwcLCVw6sBKKL1L7v3VMv5Aq+KeARxY?=
 =?iso-8859-1?Q?L0yvuSbDGN51cnu3fYSs/RHWyXWRfMBaPpEdqgL+Q1NeSawwHFKA20VZgf?=
 =?iso-8859-1?Q?pe4db0TCJWEK6rrKFxpOBqTINbPa1kIvxEReCIvFU+EfWLB6o4nDSuQ8YS?=
 =?iso-8859-1?Q?mUv8iUrdMBTAI0Lcw2wK346MdjWAhQ/k0oIF3xK9PoA1O+34cpVF44Q6cK?=
 =?iso-8859-1?Q?Mkz6hhBn9x8FuuAO1kWwbhRlVK1rOwkQ9RjLBS6kZaMj5uc0gnAFV0w0YH?=
 =?iso-8859-1?Q?ep+2PhD5gtDv7jJYHYpz/9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qHh6jJLiJyeTcXRvm0Pw1jqhf2Hb9N6khS1SkcLM5e904+MAOfXQmMuhTZ?=
 =?iso-8859-1?Q?2hh/VFZeF8fVA+OxIdeN6MhHC66E2aGAkulkdI5XGT3w55LvMUxjLQ+DoD?=
 =?iso-8859-1?Q?lN09Za+6xr68NXUkKPPuzqpWslIGB2TxTN01Ho6Y5VFVewZpczrh63wo4l?=
 =?iso-8859-1?Q?x7kQ1jQVz/8PAQpZDXnms2r1yzBu+jiHFj2AoN7VSjMTWpwtv5i1WbhmHX?=
 =?iso-8859-1?Q?0FzJdB+A/rSgpK67Jc4aXJQ349Gc1EggWSq9wKeON6+4GKRPUYP+4TKKNI?=
 =?iso-8859-1?Q?L/hLsu3f9LO3HWmYbtkdAKaQZe0zl5g3p7nw0+d0/uMvrHsqsrJa2dL/tX?=
 =?iso-8859-1?Q?RBgcNW9iCp0LNnfCfkUCKMKKUTjAfiJaIWBcdxvZR/vB6AGu4H9OE+FXbl?=
 =?iso-8859-1?Q?LDyJzJn4f+4yyAiWDGt00orEoTxy7Gtp/RgHxOJXK+rubXvcg2R+lwC0q3?=
 =?iso-8859-1?Q?G6prjQi5h4unzT51L16p9K6Xope2EdLRePXhBtl3+Nug3x7KfnGDHiKq3/?=
 =?iso-8859-1?Q?Tizt9pFeut9xu41okPJQcxo+4dNBh0AG/ZuAVYkBbdAwMpJXqpk9y6ef7d?=
 =?iso-8859-1?Q?7GuTq4PfehluoHa7tEdwJerM3zUGE1wXAm+waxMC+EWd1ora1henkphz+Y?=
 =?iso-8859-1?Q?3EHvJfuJVgOyrMOzZ++ZRl1qrxyGTEq8PgEFKINydCe0RHFKJVWy+QqnLp?=
 =?iso-8859-1?Q?Bhh7rw4voIczYHAYY04FFrExwjfmYXqEPk0Mw3AoDl8Q/ong1/rNzdU/3C?=
 =?iso-8859-1?Q?/Q7fuNcE5RmheamexbRku7NS5bBgHOWcs0qB4suSCntc/dB5uCg+/g9nqu?=
 =?iso-8859-1?Q?w3TMZqjZMlrbZVJsnv3+db+2iucH24EkcSVp0r0t7uWmnNegKz2A9z1KEi?=
 =?iso-8859-1?Q?wzMI2GpJYh8H2o/6L8694ZF1HtgsNQk9kZR3ghDkLo5Fb2Bu/yusKymFvT?=
 =?iso-8859-1?Q?8GHhhcUvnIB9ryobfUW622LCLIJ1C/bcK2FLjI8xdNPi0FNJA0ZLLkPDG4?=
 =?iso-8859-1?Q?xJv1RXmJ2uIr8kL55t16UXcXTDLZ1nBjS6+Fy4jg5sTWg8Ktt6FNdrfj1c?=
 =?iso-8859-1?Q?HIat8LxDrmlU/Ni5JmhPOrLAn2f2jBjgCDZAWmiZHnafnTz/1dN5ZiJs+B?=
 =?iso-8859-1?Q?WeljjNt6Xv7qNmOBOFzTiGWgVASVSsnZt5CX/dkc3PPWY6oxbxvwFJN5uh?=
 =?iso-8859-1?Q?sutDTUtvZ4l9aXkRO0sDMYWIcxkHRJhM9TIrzKYYjaOjMnMleA7NPWQ6Ma?=
 =?iso-8859-1?Q?7zu4pw8Yy0edFAQOq6LSXKiE1VAPnUNUL5qLvZHhTJZdED0AcMNNUg7Y+0?=
 =?iso-8859-1?Q?D6dT6WLRk1Q49wCWm/Dz+KmjE9xZzUjZJRRqek7g0IA/rknqTHOiVwbDpH?=
 =?iso-8859-1?Q?VUn2NcsBIG6DJQIwqhxzUkEGEKl5um0BUjvUTQBRww6MuR8DHDYyIA2624?=
 =?iso-8859-1?Q?dB3xme07pF/K+ihYk8FlmDDmoX0rW3u1I59RQruhbyWQNJq1y0nVPsdSx3?=
 =?iso-8859-1?Q?8dq9Bb1mfNe5NLayaQVlT0a/dyhty8mwwZgXsXqL1YOnIIYVi4dP2P97iD?=
 =?iso-8859-1?Q?Scs0s217PNMf93uIlfMm0M9vdG+hbYSU0zrHEPaWUEq9dY7y994vTUaN2h?=
 =?iso-8859-1?Q?GR9M5Kh+ORS8vIs94nyVxW1B1y5jkLdCByBu5oGAXjdVue/qkRGG78m0/R?=
 =?iso-8859-1?Q?3gpMe46dl4WcXkdB4VyEB2msDtr/haTFiA+iB7M8nfMXYZLrndR1ZOVqZ4?=
 =?iso-8859-1?Q?y05BLjUnsM1eWrKwGK4OLNHGS71npFu4Xg6GrCEHcapfZ3pETU2W49BU5w?=
 =?iso-8859-1?Q?8/93CqSpFQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aed0c43e-3856-4ddc-33a5-08de3f173559
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:56:44.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF0491DMM5p5nUOInRFZur9E/gMibOlA4Dd2KhG24wkHhLmui6+5Ozy4FlAyNWGJyn2lx7c+pi2EiT/lin90mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7726
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

On Thu, Dec 18, 2025 at 12:15:41PM +0100, Raag Jadav wrote:
> On Thu, Dec 18, 2025 at 01:07:57PM +0530, Poosa, Karthik wrote:
> > On 17-12-2025 22:35, Raag Jadav wrote:
> > > On Tue, Dec 16, 2025 at 05:10:27PM +0530, Karthik Poosa wrote:
> > > > Read temperature limits using pcode mailbox and
> > > > expose shutdown temperature limit as tempX_emergency,
> > > > critical temperature limit of as tempX_crit and
> > > > GPU average temperature limit as tempX_max.
> > > > 
> > > > Update Xe hwmon documentation for these entries.
> > > > 
> > > > Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> > > > ---
> > > >   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  40 ++++++
> > > >   drivers/gpu/drm/xe/xe_device_types.h          |   3 +
> > > >   drivers/gpu/drm/xe/xe_hwmon.c                 | 116 +++++++++++++++++-
> > > >   drivers/gpu/drm/xe/xe_pci.c                   |   5 +
> > > >   drivers/gpu/drm/xe/xe_pci_types.h             |   1 +
> > > >   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
> > > >   6 files changed, 164 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > index d9e2b17c6872..c8f211c336be 100644
> > > > --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> > > > @@ -196,3 +196,43 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
> > > >   		milliseconds over which sustained power is averaged.
> > > >   		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_emergency
> > > > +Date:		December 2025
> > > > +KernelVersion:	6.19
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. Package shutdown temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_crit
> > > > +Date:		December 2025
> > > > +KernelVersion:	6.19
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. Package critical temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp2_max
> > > > +Date:		December 2025
> > > > +KernelVersion:	6.19
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. Package average temperature limit in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_emergency
> > > > +Date:		December 2025
> > > > +KernelVersion:	6.19
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. VRAM shutdown temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > > +
> > > > +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/temp3_crit
> > > > +Date:		December 2025
> > > > +KernelVersion:	6.19
> > > > +Contact:	intel-xe@lists.freedesktop.org
> > > > +Description:	RO. VRAM critical temperature in millidegree Celsius.
> > > > +
> > > > +		Only supported for particular Intel Xe graphics platforms.
> > > As per hwmon documentation all these attributes are RW so they don't
> > > match with ABI expectations.
> > 
> > 1. These are read only values for our hardware, write is not supported.
> > 
> > 2. Couple of other drivers are also supporting readonly for temp_crit.
> > 
> > Ex:
> > 
> > a) drivers/net/ethernet/broadcom/bnxt/bnxt_hwmon.c - bnxt_hwmon_is_visible
> > 
> > 75 static umode_t bnxt_hwmon_is_visible(const void *_data, enum
> > hwmon_sensor_types type,
> >  76                                      u32 attr, int channel)
> >  77 { 82
> >  83         switch (attr) {
> >  86         case hwmon_temp_max:
> >  87         case hwmon_temp_crit:
> >  88         case hwmon_temp_emergency:
> >  89         case hwmon_temp_max_alarm:
> >  90         case hwmon_temp_crit_alarm:
> >  91         case hwmon_temp_emergency_alarm:
> >  92                 if (!(bp->fw_cap &
> > BNXT_FW_CAP_THRESHOLD_TEMP_SUPPORTED))
> >  93                         return 0;
> >  94                 return 0444;
> > 
> > b) . drivers/hwmon/intel-m10-bmc-hwmon.c -
> > 
> > static const struct hwmon_ops m10bmc_hwmon_ops = {
> >         .visible = 0444,
> >         .read = m10bmc_hwmon_read,
> > 
> > 3. hwmon also doesn't report any violation for 0444 return from
> > xe_hwmon_temp_is_visible.
> 
> Sure, but since this is a pre-defined ABI which we don't control I'll let
> the maintainers have the final call on this.

Not needed. It is properly documented:

"""
Read/write values may be read-only for some chips, depending on the
hardware implementation.
"""

in Documentation/hwmon/sysfs-interface.rst

> 
> Raag
> 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 413ba4c8b62e..8e6dd2665596 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -321,6 +321,9 @@ struct xe_device {
> > > >   		 * pcode mailbox commands.
> > > >   		 */
> > > >   		u8 has_mbx_power_limits:1;
> > > > +		/** @info.has_mbx_thermal_info: Device has support for thermal mailbox commands.
> > > > +		 */
> > > Can be one line.
> > > 
> > > > +		u8 has_mbx_thermal_info:1;
> > > >   		/** @info.has_mem_copy_instr: Device supports MEM_COPY instruction */
> > > >   		u8 has_mem_copy_instr:1;
> > > >   		/** @info.has_mert: Device has standalone MERT */
> > > > diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > index ff2aea52ef75..66a8c3e40027 100644
> > > > --- a/drivers/gpu/drm/xe/xe_hwmon.c
> > > > +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> > > > @@ -53,6 +53,14 @@ enum xe_fan_channel {
> > > >   	FAN_MAX,
> > > >   };
> > > > +enum xe_temp_limit {
> > > > +	TEMP_LIMIT_PKG_SHUTDOWN,
> > > > +	TEMP_LIMIT_PKG_TJMAX,
> > > > +	TEMP_LIMIT_MEM_SHUTDOWN,
> > > > +	TEMP_LIMIT_PKG_CRIT,
> > > > +	TEMP_LIMIT_MEM_TJMAX,
> > > > +};
> > > > +
> > > >   /* Attribute index for powerX_xxx_interval sysfs entries */
> > > >   enum sensor_attr_power {
> > > >   	SENSOR_INDEX_PSYS_PL1,
> > > > @@ -111,6 +119,18 @@ struct xe_hwmon_fan_info {
> > > >   	u64 time_prev;
> > > >   };
> > > > +/**
> > > > + * struct xe_hwmon_thermal_info - to store temperature data
> > > > + */
> > > > +struct xe_hwmon_thermal_info {
> > > > +	union {
> > > > +		/** @limits: temperatures limits */
> > > > +		u8 limit[8];
> > > What are the magic numbers? Can we have proper defines?
> > 
> > We can use xe_temp_limit max value and keep remaining bytes as reserved.
> > 
> > > 
> > > > +		/** @data: temperature limits in dwords */
> > > > +		u32 data[2];
> > > > +	};
> > > > +};
> > > > +
> > > >   /**
> > > >    * struct xe_hwmon - xe hwmon data structure
> > > >    */
> > > > @@ -137,7 +157,8 @@ struct xe_hwmon {
> > > >   	u32 pl1_on_boot[CHANNEL_MAX];
> > > >   	/** @pl2_on_boot: power limit PL2 on boot */
> > > >   	u32 pl2_on_boot[CHANNEL_MAX];
> > > > -
> > > > +	/** @temp: Temperature info */
> > > > +	struct xe_hwmon_thermal_info temp;
> > > >   };
> > > >   static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> > > > @@ -677,8 +698,11 @@ static const struct attribute_group *hwmon_groups[] = {
> > > >   };
> > > >   static const struct hwmon_channel_info * const hwmon_info[] = {
> > > > -	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
> > > > -			   HWMON_T_INPUT | HWMON_T_LABEL),
> > > > +	HWMON_CHANNEL_INFO(temp,
> > > > +			   HWMON_T_LABEL,
> > > > +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT |
> > > > +			   HWMON_T_MAX,
> > > > +			   HWMON_T_LABEL | HWMON_T_INPUT | HWMON_T_EMERGENCY | HWMON_T_CRIT),
> > > >   	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> > > >   			   HWMON_P_CAP,
> > > >   			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
> > > > @@ -689,6 +713,23 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
> > > >   	NULL
> > > >   };
> > > > +static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
> > > > +{
> > > > +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> > > > +	int ret = 0;
> > > > +
> > > > +	if (!hwmon->xe->info.has_mbx_power_limits)
> > > > +		return -EOPNOTSUPP;
> > > > +
> > > > +	/* Read thermal info */
> > > > +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_LIMITS, 0),
> > > > +			    &hwmon->temp.data[0], &hwmon->temp.data[1]);
> > > > +	drm_dbg(&hwmon->xe->drm, "thermal info read ret %d, val 0x%x val1 0x%x\n", ret,
> > > > +		hwmon->temp.data[0], hwmon->temp.data[1]);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >   /* I1 is exposed as power_crit or as curr_crit depending on bit 31 */
> > > >   static int xe_hwmon_pcode_read_i1(const struct xe_hwmon *hwmon, u32 *uval)
> > > >   {
> > > > @@ -787,6 +828,34 @@ static umode_t
> > > >   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > > >   {
> > > >   	switch (attr) {
> > > > +	case hwmon_temp_emergency:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> > > > +		case CHANNEL_VRAM:
> > > > +			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
> > > > +		default:
> > > > +			return 0;
> > > > +		}
> > > > +		break;
> > > > +	case hwmon_temp_crit:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			return hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] ? 0444 : 0;
> > > > +		case CHANNEL_VRAM:
> > > > +			return hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] ? 0444 : 0;
> > > > +		default:
> > > > +			return 0;
> > > > +		}
> > > > +		break;
> > > > +	case hwmon_temp_max:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
> > > > +		default:
> > > > +			return 0;
> > > > +		}
> > > > +		break;
> > > >   	case hwmon_temp_input:
> > > >   	case hwmon_temp_label:
> > > >   		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP, channel)) ? 0444 : 0;
> > > > @@ -807,10 +876,46 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > > >   		/* HW register value is in degrees Celsius, convert to millidegrees. */
> > > >   		*val = REG_FIELD_GET(TEMP_MASK, reg_val) * MILLIDEGREE_PER_DEGREE;
> > > > -		return 0;
> > > > +		break;
> > > > +	case hwmon_temp_emergency:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > > > +			break;
> > > > +		case CHANNEL_VRAM:
> > > > +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > > > +			break;
> > > > +		default:
> > > > +			*val = 0;
> > > Do you need this?
> > > 
> > > > +			return -EOPNOTSUPP;
> > > > +		}
> > > > +		break;
> > > > +	case hwmon_temp_crit:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_TJMAX] * MILLIDEGREE_PER_DEGREE;
> > > > +			break;
> > > > +		case CHANNEL_VRAM:
> > > > +			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_TJMAX] * MILLIDEGREE_PER_DEGREE;
> > > > +			break;
> > > > +		default:
> > > > +			*val = 0;
> > > Ditto.
> > > 
> > > > +			return -EOPNOTSUPP;
> > > > +		}
> > > > +		break;
> > > > +	case hwmon_temp_max:
> > > > +		switch (channel) {
> > > > +		case CHANNEL_PKG:
> > > > +			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> > > > +			break;
> > > > +		default:
> > > > +			return 0;
> > > > +		}
> > > > +		break;
> > > >   	default:
> > > >   		return -EOPNOTSUPP;
> > > >   	}
> > > > +	return 0;
> > > >   }
> > > >   static umode_t
> > > > @@ -1263,6 +1368,9 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
> > > >   	for (channel = 0; channel < FAN_MAX; channel++)
> > > >   		if (xe_hwmon_is_visible(hwmon, hwmon_fan, hwmon_fan_input, channel))
> > > >   			xe_hwmon_fan_input_read(hwmon, channel, &fan_speed);
> > > > +
> > > > +	if (xe_hwmon_pcode_read_thermal_info(hwmon))
> > > > +		drm_dbg(&hwmon->xe->drm, "Thermal mailbox support not present in firmware\n");
> > > >   }
> > > >   int xe_hwmon_register(struct xe_device *xe)
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index 673761c8623e..a47637900e84 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -311,6 +311,7 @@ static const struct xe_device_desc dg2_desc = {
> > > >   	.has_display = true,
> > > >   	.has_fan_control = true,
> > > >   	.has_mbx_power_limits = false,
> > > > +	.has_mbx_thermal_info = false,
> > > Why?
> > > 
> > > >   };
> > > >   static const __maybe_unused struct xe_device_desc pvc_desc = {
> > > > @@ -328,6 +329,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
> > > >   	.vm_max_level = 4,
> > > >   	.vram_flags = XE_VRAM_FLAGS_NEED64K,
> > > >   	.has_mbx_power_limits = false,
> > > > +	.has_mbx_thermal_info = false,
> > > Ditto.
> > > 
> > > >   };
> > > >   static const struct xe_device_desc mtl_desc = {
> > > > @@ -365,6 +367,7 @@ static const struct xe_device_desc bmg_desc = {
> > > >   	.has_fan_control = true,
> > > >   	.has_flat_ccs = 1,
> > > >   	.has_mbx_power_limits = true,
> > > > +	.has_mbx_thermal_info = true,
> > > >   	.has_gsc_nvm = 1,
> > > >   	.has_heci_cscfi = 1,
> > > >   	.has_i2c = true,
> > > > @@ -418,6 +421,7 @@ static const struct xe_device_desc cri_desc = {
> > > >   	.has_flat_ccs = false,
> > > >   	.has_i2c = true,
> > > >   	.has_mbx_power_limits = true,
> > > > +	.has_mbx_thermal_info = true,
> > > >   	.has_mert = true,
> > > >   	.has_pre_prod_wa = 1,
> > > >   	.has_sriov = true,
> > > > @@ -681,6 +685,7 @@ static int xe_info_init_early(struct xe_device *xe,
> > > >   	/* runtime fusing may force flat_ccs to disabled later */
> > > >   	xe->info.has_flat_ccs = desc->has_flat_ccs;
> > > >   	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
> > > > +	xe->info.has_mbx_thermal_info = desc->has_mbx_thermal_info;
> > > >   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
> > > >   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
> > > >   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > index 3bb51d155951..34d2b66188e4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> > > > @@ -48,6 +48,7 @@ struct xe_device_desc {
> > > >   	u8 has_late_bind:1;
> > > >   	u8 has_llc:1;
> > > >   	u8 has_mbx_power_limits:1;
> > > > +	u8 has_mbx_thermal_info:1;
> > > >   	u8 has_mem_copy_instr:1;
> > > >   	u8 has_mert:1;
> > > >   	u8 has_pre_prod_wa:1;
> > > > diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > index 975892d6b230..a3bff76a074d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> > > > @@ -65,6 +65,9 @@
> > > >   #define       FAN_TABLE				1
> > > >   #define       VR_CONFIG				2
> > > > +#define	PCODE_THERMAL_INFO			0x25
> > > > +#define	READ_THERMAL_LIMITS			0x0
> > > Does this match with spacing convention and ordering?
> > > 
> > > Raag
> > > 
> > > >   #define   PCODE_FREQUENCY_CONFIG		0x6e
> > > >   /* Frequency Config Sub Commands (param1) */
> > > >   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> > > > -- 
> > > > 2.25.1
> > > > 
