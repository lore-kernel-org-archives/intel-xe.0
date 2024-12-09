Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E310AE7717D
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 20:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD2A10E563;
	Mon,  9 Dec 2024 20:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYnVpOwk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE2E10E563;
 Mon,  9 Dec 2024 20:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733776709; x=1765312709;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XBqwzfXRMhvGMJTYY31V+rKPxWOPBl2R61nj7C3WAdc=;
 b=FYnVpOwkPqE1kPGv/pLqhDKReBcemXE2TT/BN6yCh/mELKNc6s/DamYa
 y/TIYo1eDSxdTxl2kpVb/yOz6DgGQcB/82+b4p5+wuHXC9cPhT8emuU5B
 oVh/klLX0GXwe+70IjdQztdE5bA+V4TLfEadXfXKKletQI9YTaJuy6dSQ
 B9egIxpmmE+FqsZJozMyn8nfVY53weORoRYlUONa0IbJPYDd2bvwKbc6a
 VHbUNv8lVp8DHfjBo17FvpsBGAIY/GYgxA/mDy0R9SxxPNUFzYPKDBGiI
 uejDAOvrDsxwaip4JMYMxhtdrUrajLrLFP7aiCBAXdO3zLB1HfoBh+7HZ g==;
X-CSE-ConnectionGUID: 9QernP3KTR+L8YK06Kyjvg==
X-CSE-MsgGUID: 2dmcZzDXQkm3nXx+iHKpWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="38028541"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="38028541"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 12:38:29 -0800
X-CSE-ConnectionGUID: w7G1Sih/TJWaJyDim9bMMQ==
X-CSE-MsgGUID: HDhP8CU8TLmKLzmvjQxk8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="95981087"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 12:38:30 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 12:38:28 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 12:38:28 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 12:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ah7yCjQdghk6iEXqPOWPPqW9RSGArRPVkxWKb1qg3HV04xgqyZW0+W2Zaw3O9WhPYR0GgnV6sd277roZ7sYZ82Cu0n2v1QuMQcP7Ro66TArjs4vlVXeDC7gaisE4Ot69agKqiuabEykYiX4kWppPXwrBoTL0lpUDSU77u3mNvBu97WqUznNbsjTGn6I1eYSPXs95A/cp3cvsVS8TqRv0VEYK2FD/EFmNUh4E0BkL3FjVrE4pVha8OzQa3YlI0mE3cvzel9epwWn/wC3HJIqQKkqyzUvtAKoujy0EWTu/a/4N64KmKu3qIZxfIhyyXl4klVkKWUw74JCBg4B+wkvAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMvTd8GdgzbfLEM6ZVcTo5RppDVzsAIR94YHkkZq2Vs=;
 b=km6BoMxsBUMRp3Nus4vAIZ45j1JA56AzqBbUasM+ZwwcIOL5tJYIGy+lvaqMhHChjlG08zXm44lgRsa8bSME5He6+CuGx0K8u4gKNM9lBPnIjCIbbsFDI+iJZMJOfHdMrrtyrsLkMoPWegYwTiG3ShVjMQP2re2KrSH3k+s92w20jlTQrUepRxODB6/L/hVSQ5ZFLDWQ0ehlRXSwf8vvkllwtsr/24KkU0AQZnSK8teu9wggZYGVfCol+j94iPlxbouPBcliisHPBv+q6DQqkbY0pcvN+ndA2jgTtP01MOq3uCcPg+4Nf212q7Cbu+zj4eAL3X3srhid8o0XTc1B+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 20:38:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%5]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 20:38:25 +0000
Date: Mon, 9 Dec 2024 12:38:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 <igt-dev@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, Jan Maslak
 <jan.maslak@intel.com>
Subject: Re: [i-g-t] lib/xe: set hwconfig NULL for unsupported platforms
Message-ID: <20241209203822.GR3224633@mdroper-desk1.amr.corp.intel.com>
References: <20241209085709.1979242-1-tejas.upadhyay@intel.com>
 <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <60c6f1d7-6bee-40fa-9f7b-8f138b3a3501@intel.com>
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: 252f83c2-21de-40e1-0929-08dd18916ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vPQYachdIazo+e/rsO4D8PMlB9IazgeO0ktOtyrsDCZ3zqZGLb/eGlxWFBqV?=
 =?us-ascii?Q?dhbLa7ayykcokReMtjMANoJKO2SnlY5Ys5HfgG36RCZfqe+qdsB1stXECZC2?=
 =?us-ascii?Q?VILC3S0aHoWxjkEiL8wAC/v8eOG/6vhoXjZJMPtFSxv6DOZOa1kyU9Pz7o9l?=
 =?us-ascii?Q?pXDOPHWlrLPEUXMWFJZHrHwa4xmvX+AL/wXpMTwBAXkIBR7ssCVDCP1r5pzv?=
 =?us-ascii?Q?OYlrbTs/Rvp18QUthKLxyiYBUj1eIWtrqPagTu7jqpTQiwMwhUzfiwRO24JR?=
 =?us-ascii?Q?WrpJ9usSCiNX6THp9HWcjdNtGoWcbK5LEHTB4sXZGBFzgcg4DjoX/59febtK?=
 =?us-ascii?Q?Y8IMcAIjwrgfUNLeGAYVfhuL5OlaHi8bmuOJpN0d0+gP7thgsOBZf4EKBgp0?=
 =?us-ascii?Q?UjQxESJPcQA+Z3mi46dLSZHhY1u2P5IvXQKKLCxJm3s86HCrZdOXoQahx8Ym?=
 =?us-ascii?Q?usx9k5akeYbBlAd3V3oAvaGptOQ9dAoa1LhETi42hEMoxAzj+Tl+HjoD7nvZ?=
 =?us-ascii?Q?vaK4UpvCPvekeixJe7zbCG+Dc6ZwxF2/3SQceVvc+IYFvKWyDWim6Gf8+7Se?=
 =?us-ascii?Q?59x4fsAfeV9qN+OZdK6ANWcr0CO73Vb+BCJXg+Dth3nROqjCnQGolgH9JS7L?=
 =?us-ascii?Q?fIEHaY6mmZcA3eSN7ozBt+PLUJhYV8gk1CVsUiOKqse/8fow0uXLXnbQGowp?=
 =?us-ascii?Q?VW6Rovh9QO0TTXplP5SJjMX6OnK+rv94WS2ljUXvHH+ccM4ZND98EE53twX4?=
 =?us-ascii?Q?IYPTOxiHnKgzgJT3tgXPCKRYEho05w0N9MuhSpYulVZYbUQlVQkTTXBvbgiO?=
 =?us-ascii?Q?uizpP613LDBoFP13vdwHkjRd1gYcOmnV39hl6K+5LSaTz2v4dymun5yScUxC?=
 =?us-ascii?Q?dE7c8L99kppgMYslMcAwM5y3J8E7n5en+bANYT8jWVW9iW7AHL7rlvrZlBHr?=
 =?us-ascii?Q?tJyZgYHqQyZAEmYefSB0DQ8S1XXvp9Rw26tXZebXBs2BR/gdDwpB7UU2qCUg?=
 =?us-ascii?Q?6eXF30AonIZfGuLsyRC+DBI9e4RjmY9pBatY4zsf/hUr9iAdkD29ZvF51rQA?=
 =?us-ascii?Q?tNJFE+vUS776vFBVKBOvwncJPM9GJ6jNVUSh3U0OiqCM8uStz2Z0LsFxziu+?=
 =?us-ascii?Q?kOEGBq6Yy8jS1ELa+jMn9kixd5JF6+FNfzNNodS1P4Yy+DmA8bcmm20VMfU6?=
 =?us-ascii?Q?+ccUafHLeZW294Pku1x2AnGBfSXGP2jWOGAJwa7unuOQTGTksh58cr4uRmgm?=
 =?us-ascii?Q?YxhqYCcGMSczi+q6mOXgfRsDy0QVtJiEFcsQ0SZHM6dA5k4BJwp8VJGkp9QO?=
 =?us-ascii?Q?+Rc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YD93xY/q8MLw9/K7VfZjHLzTa/PymW3LODKmGlOAEnkFKEAhMnLXPxgYTbxt?=
 =?us-ascii?Q?K+cXe6ai0eSgi10Vjf8tufcfewUx7dDbRHkXN2qSLQLgb+ic3vCGZ4TG3SWc?=
 =?us-ascii?Q?ZpPUVhcldKfwIboKcC4BpHFf2uTA5tLWqCnNLYQcqAwtU3FXJMsXXQKqV5J+?=
 =?us-ascii?Q?iesz8WP9YxB5LIH+D/gO+GxKLXFyGsUZn1hCTKXRhTaQJXWnk2BLddWHscr8?=
 =?us-ascii?Q?mtVkZg/kLOL60ZzIAfqfL/3gCXY+jR0C2oZ+miEZgVQxrHLfSJqeVVZ2FsvN?=
 =?us-ascii?Q?Ay7BL2dkw1pIULiEslhcyKwUZWkT6976tDBag6BwlY1g7Degngv8s2hdIKj2?=
 =?us-ascii?Q?WABTnzgD3tRuRY0Fb0VYmkoT0Jlf20HEJRjRDCybZbBX6TLb+BJ8edRLUBtT?=
 =?us-ascii?Q?Xf/MbkvPUzSa+nQRmPZ/WmDEY4xKS80SSDzZTNbCFypiR9bIcWQnvnQbupzF?=
 =?us-ascii?Q?C433RBAzy8CqMfTAXeYWdzWtbBDWocPsTgJz3kosZNDGOY2UHM7xBIfmQHq6?=
 =?us-ascii?Q?xIYKp7QhdZ+Yxbr7zBn2zVwK5wNfbVLgpv/WQeW56pRTuK7b1dC6e1dFiaxl?=
 =?us-ascii?Q?+YL7KDcJAWHjSUnX0AX70wJybPzY6e8V74MRmDquJP5AQuaQdc2H2CVHnHLh?=
 =?us-ascii?Q?FeyKPEOdW2RH+KJw6+aKzlBiAiJwyyv66kUD8IzsOuj2Dp3itwL/1fZJC5CE?=
 =?us-ascii?Q?i0IL2gcfa6DTyx2xvRRlZ5lrsub5bF6pKlblnPdQIcuh0wmNhoBqsQj+7S5p?=
 =?us-ascii?Q?L/FmyubJH1qtIdUbZphmNsc85guZA7cztQznTeLtqvshkbMC8Pkbc3jIs9Q/?=
 =?us-ascii?Q?ahT1F6wN7+bixcWTfkuZrXSlgiGA7N4fWr9wIUA0Yx0ufziCMUhcTeoZdZTs?=
 =?us-ascii?Q?2MjzYsGgog/INRYwDjfAZaGIkv+P2UmCjxc6l4Nv/eaInTHrX91KCIIUv/6K?=
 =?us-ascii?Q?njtSqoINUG5h8y1w0AMUE5ckgHADL5VEK2xHX5HWVrYnAwU5M4BNcrkc5kuP?=
 =?us-ascii?Q?SVIl0s/OjBMf2xu+kNFhn3Y2O9clL/ukL/64RpAChzmzF3SXgvYp9uG6Kewa?=
 =?us-ascii?Q?XQia7xwlutLKuYaoblPfxRXc+roO2N5Rt1axxWR9Nmf2Ry99KMs1jDmLEDRa?=
 =?us-ascii?Q?0YGLGOoTO3VEDeMjKKb8YeAPL+Z+VbtUZJdpaZYb3jDRo0x6Evt+iCpOCM3h?=
 =?us-ascii?Q?ReVEq5ToPk3vknBHZ+keDWiq4wdLY3VC8YNUM9b1BmLZuaKKFmEM8CQ2nbSI?=
 =?us-ascii?Q?7I133h2XShEpRkaRHxXjzS7PcncLJd+maBz4Mtk+h3MeF9iAm84Nj2fqsPhS?=
 =?us-ascii?Q?xS2U6blJIhQSmQb/uKnd2YT3KPkNbEJLLWuRMZS7/iXRV0TmBTRBRWwZFjFK?=
 =?us-ascii?Q?9uxxt9o79x/+kSRzdxbJTL2ofvuTVu1E+PKr7jpWr03BrW+g6sO+DGEV8wMm?=
 =?us-ascii?Q?uCDo7SqE/HkXqBh4vzYHVbnxo0CXeGzVQq0Upi0QuLkZFvnsXBF6q90f5aGH?=
 =?us-ascii?Q?rSSXhfsEwVR63bzRWtuyQsStrf+pvCB+rfs4Pw2G+n3aESKwqwei3vnk78Io?=
 =?us-ascii?Q?JRkFUbhiHjHtu5G2kvFMnSPNFLifgw2IwNYnhKm/W1sryoDVEibeUqaK/Xhs?=
 =?us-ascii?Q?eA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 252f83c2-21de-40e1-0929-08dd18916ddd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 20:38:25.0594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zl2vsvaZKIuEy5YhJrC6ZRe9uZJhYLldUYTNxU10EC6fMgP+B5BMAVZtUTmviZXvI4mUZFfNJozZEhzCUF8nIusUwiQSsqF4/Ah5i2xrbr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

On Mon, Dec 09, 2024 at 11:20:07AM -0800, John Harrison wrote:
> On 12/9/2024 00:57, Tejas Upadhyay wrote:
> > There are hardware platforms which are not supporting
> > hwconfig table, for example ADLS. Querying hwconfig
> > on unsupported platforms leads to assert and failure
> > for some of tests like,
> > ./build/tests/xe_module_load --r load
> The module reload test should not be querying the hwconfig table?!

See the Fixes: line; that patch made it so that anything calling
xe_device_get() will fetch and cache the hwconfig (and assert if it's
missing).  xe_module load calls __drm_open_driver ->
__drm_open_driver_another -> xe_device_get so it does indeed fetch the
hwconfig table now and hit the assertion added by that patch.

I don't know if always grabbing and caching the hwconfig was actually a
good idea or not.  As we've seen here, the hwconfig may legitimately be
NULL, so as we remove the assertion here, we still need to do
NULL-checks at the point the hwconfig gets used to truly be safe.

> 
> But the hwconfig test itself should be failing on platforms which do not
> have a table. That is intentional. There is no platform which is POR for the
> Xe driver which does not support hwconfig tables. So the test is supposed to
> fail if it ever does not get a valid table.

The Xe driver is only officially supported on the Xe2 platforms and
beyond, but it can still load and run on some pre-Xe2 platforms that
people were using as development platforms; some of those don't support
hwconfig.  And even though our CI setup is only trying to test a subset
of those platforms that do contain hwconfig, note that our DG2 setups
also have an ADL-S igpu that also gets probed during module load, and
that's what leads to the CI failures that were reported here.


Maybe XeKMD is mature enough now (and we have enough real platforms for
testing now) that we could prune the list of platforms that Xe is
willing to load on with unofficial support.  E.g., drop the unofficial
support for TGL, RKL, and ADL-S since those platforms don't have
hwconfig and I don't think any of our developers are still using them as
development vehicles at this point.  That's probably a separate
discussion from the patch at hand though.


Matt

> 
> John.
> 
> > 
> > https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3683
> > 
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Jan Maslak <jan.maslak@intel.com>
> > Fixes: 37a230e50 ("lib/xe_query: add hwconfig to xe_device")
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >   lib/xe/xe_query.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> > index f3731d9d3..8f0a5392c 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -51,7 +51,8 @@ static uint32_t *xe_query_hwconfig_new(int fd, uint32_t *hwconfig_size)
> >   	/* Perform the initial query to get the size */
> >   	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> > -	igt_assert_neq(query.size, 0);
> > +	if (!query.size)
> > +		return NULL;
> >   	hwconfig = malloc(query.size);
> >   	igt_assert(hwconfig);
> > @@ -858,7 +859,8 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
> >   	igt_assert(xe_dev);
> >   	hwconfig = xe_dev->hwconfig;
> > -	igt_assert(hwconfig);
> > +	if (!hwconfig)
> > +		return NULL;
> >   	/* Extract the value from the hwconfig */
> >   	pos = 0;
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
