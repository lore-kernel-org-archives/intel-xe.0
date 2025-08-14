Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7969AC87FCF
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 02:48:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F0110E052;
	Thu, 14 Aug 2025 02:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H1q/FG7m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EBD10E052
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 02:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755139699; x=1786675699;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=+an70vuSvT6zCei+tQUdpWhQASsY1HjK9x63T/EZLyM=;
 b=H1q/FG7mhSIDOLP7FVI8m7Egukm4Wql+b+xhLXFSjz3/iuCMt34zfqmO
 fR7dRULeGVDgcG6Qusn7OgXJwbqRkjsr8b7KF5jeq6Di47Y0ORbQovsix
 6L/mmXslgpVXdW/HgrA7WeJ0pObtKnvxp5ATfv5MXHAs4uiNq8BcFCc3V
 PafhIHrmY6y8oNoDK8wp8oCoRm9N2Ukptq6122aOrr5GgnssF3JuIQZFx
 41G2AhGu+iS1zEkSxGX0XNn8nhcFEo2BgxY09XfhzScgDnrGN9H1UzQlU
 Rz+ZjEQPX0PIova0OzZiwlEb9eZcvXvtsjkSLzZFecCPVW6SMc2/6p+Ub A==;
X-CSE-ConnectionGUID: 6CKHjZ/hQwG3Su+6vdmFYw==
X-CSE-MsgGUID: 9WHORrsnShWniHwHbxs9Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="61252710"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="61252710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:48:19 -0700
X-CSE-ConnectionGUID: jdi5wGVETKqbzNRdbA8FYA==
X-CSE-MsgGUID: m7WE4y3TQn+JE6fE00ywIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197494184"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:48:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 19:48:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 19:48:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.80)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 13 Aug 2025 19:48:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr5xOspnYBFYfA8W2Klfx8lcK8AZJCqu9uOU7ORmYyFUzAVS8DKVzy1dE9XtIuS3S0f6FDoUqzzA6R1HuUGTj9q/xKjbwTvH7oxcgxo1fQ9mYMPi86ZWHJHgIAElQx3A53RDs6GGW6hfK776EXWjaserklKvhWEzlmauA5D5OyWg0O5Wo02aiMCF6mZqF7rLL1N0PrGILMqsBtfR8KBQJr/1h7aURAoTgcb0dwMiky4EYygZsHMvVV3faYtv5ipsiFLOdZL11qYM2jfHdrE4YBVMlbpfzH7IwXtv3IZ7Yw4l9q9W9UWnwV9otVpz0ChGkZW/KmbPQXZm7daKaYqmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fCMw5ylse7zP8dtpTl+QN/7jlGDlfCCOGphQd1t5hw=;
 b=zA3/TAxIqBZ5YEJMofTAM/BjGdekyxbPdhYc3dq1+B+MAKU8pgt0vqbNA7yak/cBRebQBLCHhyXwmsg0rajgvb4Kshk9Fwg+cOd3LJCqcVFrzcDPMt5uCsZCLeHoUz4qS/CLE6eWrj79wVIeYJRG7W8xPm1xsSo7GFvQoenW2ufOoLJXou6d4gieRnYh+r+r8htz4NDBrUZSqmfKsfJ5FICAqvQqT7dP3mTwEaas+zfR3YmXm79RSq/7zNrN8DNZ/vPjTLpbERzA+q4KDXa+5gruo9RJMjNVT2vPaPctAkiMAPPJVjiugH7fZRGplJeqnTGES8Xfegrvh/xkwsL+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 02:48:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 02:48:16 +0000
Date: Wed, 13 Aug 2025 19:48:13 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 08/15] drm/xe: Convert existing drm_exec transactions for
 exhaustive eviction
Message-ID: <aJ1ObcqgogykbXnm@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-9-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-9-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0181.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b561874-89e4-4bc0-2bb8-08dddadd04e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GtY6BhNcfoPx7g+NWntYLK/pJ8sTHSQjfC834JMxDZJs0RXuR4DXxELmwx?=
 =?iso-8859-1?Q?9IoGs+mVDvhdzCb8BJG+W/lew9k6mzoyBN7c3IpC5NIh2s4xgRl+wCS44g?=
 =?iso-8859-1?Q?DnQTzHXewI/sYvFpzVUFjL8MBHu2afb/HtzdiPN2Af1/46+V6JOr2k/SK6?=
 =?iso-8859-1?Q?KLYQJloHHCx31b7nZm8fjNusqP2UZ1NAyEPfUGrx1ZFPgPgebTE+EjgHA1?=
 =?iso-8859-1?Q?L83h1FrpfPOA8E+3Z4GRIWRD3t0OMWHaQHrEfSP8fiaK36UGyNKDGhGOUt?=
 =?iso-8859-1?Q?EcO8wGzXJGgZwFw8UTuN8SFvVjQvMWiybDE4r1HxYfvtsK7IYfJx2TCxYZ?=
 =?iso-8859-1?Q?LJ4ypbsEbzVtvlE20kwXkwn9HzHe5xDysR+UDM/SWrWG+eMpfXq89gASZm?=
 =?iso-8859-1?Q?wgFC+xxWNx7TPiOpms7Qm7vLO7iwvAgdxIhLx1zeOiKiaqWfQ6kfDmOI54?=
 =?iso-8859-1?Q?texBbyH/af8/w1wAghTR2Inuem0DaNJ/pRFpqCE+dTn4eBXgTBDFdg5hcW?=
 =?iso-8859-1?Q?NbRnvOr5pG65AuC6VuHP0+tUMcQfD/49kUB80dUpazYccwWMUVyInMO1Hp?=
 =?iso-8859-1?Q?wElf8P0y+6NKXnILCrbZ6Df+hUDHPrOnXbFp010NrQ3W9nwKnFDS0ddXSj?=
 =?iso-8859-1?Q?F2z2MXbsui61irRDied+R8DKSHXrQzrC6HggvduSdfP6A4yi+3+ZRSnGH2?=
 =?iso-8859-1?Q?QkbBD3FJTdFbe78V2SyR4GRaIJP5r+6j4p+5ZDIvf9ODxntHMm+/i8Xxz2?=
 =?iso-8859-1?Q?9uKIs+NwKE3FYZVB0qJ+GAHwy8UJSdD6EpnHm9Ms4ylCfFWqQmpFkoVqqo?=
 =?iso-8859-1?Q?f8f4ieZHDqTyjXYLM9qrEWlqO1Lm+Xb2Gj+dW2wQ4d9Gg5XB3dgp/Q8l0P?=
 =?iso-8859-1?Q?HQw8SJvztNg9gbaeNUSJncDXo7uGS3ip/hNvrUlH9lFmIevh3JoS/lls3K?=
 =?iso-8859-1?Q?nh/QDnUdX6CLuUZ4C01xuSN9lDo+9lXmTLFyu28qVoN8IUUaEgmHwHKgOm?=
 =?iso-8859-1?Q?QgfikFYdKYnzu6Gr1oMgoopI+ob6Um00fdQCkpvs+8ZMrW6J1X/nNOM5Xs?=
 =?iso-8859-1?Q?qh1X48HbFcXp+R2+OYX/xIhdz/b9mD7nOYLMSoE71BgWbMvi4ycvNYqU0p?=
 =?iso-8859-1?Q?GXt3QGeG+De6ljciNhp8aD/yOUJqVD1Rqajn3/nG9WxUiCzFT8MtF+K4JD?=
 =?iso-8859-1?Q?3tcZYzLM0d+h4giwwG7CYm29ccwwl7JgEWd3/YzVCOlG/6nY/JAhu2cDYK?=
 =?iso-8859-1?Q?HVuVvVDW903zOUqUanuGeO41D1lY2wOf+vlLqXLjF0Naoc6SWAc8MksiPx?=
 =?iso-8859-1?Q?Ok+8g01BGoeoTUXUnydG1116j3icTRU7aUAb42DCddeRXC56FolxzhyCtC?=
 =?iso-8859-1?Q?uvmcO0GoLaHAXd3+52SqYrSmp6DT+42vJauSNYX+M6nMszLA+KdY1YoAg7?=
 =?iso-8859-1?Q?TTavKzZRP2OzBFI24zEG0TyK2pbl5/TTnYjGZD/9PqMNWths95F2zyhGkm?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O0e7jovJz8SIhdEZItpRe36Sr7E6rDFI1zjmsNmL807JY2h20y2cjgznxg?=
 =?iso-8859-1?Q?dnIJd6+8i4bJWGSTYwoONK+xJ9hho3EYHRukRAs7c0c8W1fsYUhHgrdAR3?=
 =?iso-8859-1?Q?Ciifnl0Tbqz6FvR0Mt5UWi/uzbYopb6WS0/NRSTGTHqy+Q70AhaGjnfVq/?=
 =?iso-8859-1?Q?SYuuaMbivipYzYcdBUqYkMhvnDMGYle845OloB03eIgBv+WonszdOm90rl?=
 =?iso-8859-1?Q?DELiLZseU0SDYpOGyGaju3RSxEygjGgCBHMAGyEwdR4RaLaZWNk7deduou?=
 =?iso-8859-1?Q?zPUZzvCiam0IIFh+wulHhnBcQZQc4H/RP5pY96AEnmu2FJ/uTMrEn/af4I?=
 =?iso-8859-1?Q?zQmYsZH4WPJ3ccR2WRFmOOZRNJ7nE3Wd3UeWJiFLXpExE3PuJow/Y71l5Z?=
 =?iso-8859-1?Q?jdRrv9dbq4GfJb4WkP7l0xDzNjHK3YVRmX77hekHkdNpV/Kf7IH42xJGZ3?=
 =?iso-8859-1?Q?CqijN57YVpbJAI4Z8gH+utV3zGaa7gBvwLxeudINUudhxVdEzlw0nPXDeK?=
 =?iso-8859-1?Q?OWX5mTxtj/7bFUxz7FFfGh8UIWcVje9Yz8Si7VY7TH/SqAWMsGTcbYMeCu?=
 =?iso-8859-1?Q?AazlwL6fQlQE+hfFSCm9zWy6spNEQElZPG7p+smRADnmzI33KjSrgYczA9?=
 =?iso-8859-1?Q?lKfyzSVaFDIy0AiyBLS6QdU4jOLvobfGr8W3Dmnb4qUcKot1viYbkSk2Zd?=
 =?iso-8859-1?Q?Uq1bVkfGvpXh5ppZynxnPn/CC1JALELoTJVd7WbIeDpBRIYYn0gViLcyFn?=
 =?iso-8859-1?Q?yvRc0ZbXec4P8ibD9lock2R5uMo89iQk7zppFS8ApAD00ZMS213yTtAGmg?=
 =?iso-8859-1?Q?PGjSeDVu950UmKLPGg+NrxqJdRbgk2BeijoRS1cFeXLUZIdIOWFfN/Jr9D?=
 =?iso-8859-1?Q?Wmj+Cwef3oVv3ryT1V0wnAUXHirSnehSl+kt7QH0KffSHjjBB2+z4iNgIw?=
 =?iso-8859-1?Q?HU+Dj4lEe1yAFBwfGiX4K1dJkjZPxwjR3ZYpkT0XmgHdmI8kgYaTGcpJLw?=
 =?iso-8859-1?Q?jHKFUuT4kjZn6NPt7RCus33GWqQK+zdKS/dPfHCE+3GxAEG80dLejdaRWv?=
 =?iso-8859-1?Q?+EJIaeQNuOOFVp2Nk1t8nM/8bRfCFf4hWOSWRkUryDkEdLfTq/UNDy9txQ?=
 =?iso-8859-1?Q?BpVb8pyvr/jwxLjWMnJRA44UqWepVFGrguYuCZozUrqEbfK05BGxm5XuLz?=
 =?iso-8859-1?Q?/hGBpJ/8HmOpE05C1PFKyZzzMpj6pkqwZpGjUIT41VjGs/ihT1zCnYkk3O?=
 =?iso-8859-1?Q?Z/Uo1hE1Ih6FAMqac+/x2BgUbnWgIfXCXaToCv459fGCQNcja2c7cirGYY?=
 =?iso-8859-1?Q?YLe+Uh/L4SmcBLVK5fCtA1DtFMGribuupRl2QATzouHSg3wu0qzryGMZam?=
 =?iso-8859-1?Q?5giJQC8crrDK6+El4BLCRq0BiM8pehlRH6yyyd4Pa/OqsZG5ghkvUA0tRG?=
 =?iso-8859-1?Q?6lEYZIYies/cOHTZi08UtXE/6XisI6DDQdeJ6c2XO3nr2baJXiYWDDaEbd?=
 =?iso-8859-1?Q?NpkYH7XnyQ2YBEVsnilofVOO4JKkLvC22dqFIPeKH57ZQLf6yQp6FuIDZv?=
 =?iso-8859-1?Q?l20tMe7i+zUWK81jwacLtIPRZes9ke9visaMC2I7czKBCcqMY4DaVEqe6J?=
 =?iso-8859-1?Q?Mr7Rr9Swt7ZGkzUyVzrHSixAGePP9m3FScynspBH0FDuGWDQ3S49iBug?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b561874-89e4-4bc0-2bb8-08dddadd04e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 02:48:16.2947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nbbrdK+PicjPQt5yqgf4fi0rT/izSm3qFbE1830j8Lc2X9QSYCioEJV6+dMJVUwrEoI6NDw/N3iIrFGdnMqRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
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

On Wed, Aug 13, 2025 at 12:51:14PM +0200, Thomas Hellström wrote:
> Convert existing drm_exec transactions, like GT pagefault validation,
> non-LR exec() IOCTL and the rebind worker to support
> exhaustive eviction using the xe_validation_guard().
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_exec.c         |  20 ++--
>  drivers/gpu/drm/xe/xe_gt_pagefault.c |  20 ++--
>  drivers/gpu/drm/xe/xe_svm.c          |   4 -
>  drivers/gpu/drm/xe/xe_vm.c           | 132 +++++++++++----------------
>  drivers/gpu/drm/xe/xe_vm.h           |   2 -
>  5 files changed, 70 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 0bcb4fb9a10e..cdc3ff931a90 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -119,10 +119,10 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	struct drm_gpuvm_exec vm_exec = {.extra.fn = xe_exec_fn};
>  	struct drm_exec *exec = &vm_exec.exec;
>  	u32 i, num_syncs, num_ufence = 0;
> +	struct xe_validation_ctx ctx;
>  	struct xe_sched_job *job;
>  	struct xe_vm *vm;
>  	bool write_locked, skip_retry = false;
> -	ktime_t end = 0;
>  	int err = 0;
>  	struct xe_hw_engine_group *group;
>  	enum xe_hw_engine_group_execution_mode mode, previous_mode;
> @@ -241,17 +241,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		goto err_unlock_list;
>  	}
>  
> -	vm_exec.vm = &vm->gpuvm;
> -	vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> -	if (xe_vm_in_lr_mode(vm)) {
> -		drm_exec_init(exec, vm_exec.flags, 0);
> -	} else {
> -		err = drm_gpuvm_exec_lock(&vm_exec);
> -		if (err) {
> -			if (xe_vm_validate_should_retry(exec, err, &end))
> -				err = -EAGAIN;
> +	if (!xe_vm_in_lr_mode(vm)) {
> +		vm_exec.vm = &vm->gpuvm;
> +		vm_exec.flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
> +		err = xe_validation_exec_lock(&ctx, &vm_exec, &xe->val);
> +		if (err)
>  			goto err_unlock_list;
> -		}
>  	}
>  
>  	if (xe_vm_is_closed_or_banned(q->vm)) {
> @@ -345,7 +340,8 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		xe_sched_job_put(job);
>  err_exec:
> -	drm_exec_fini(exec);
> +	if (!xe_vm_in_lr_mode(vm))
> +		xe_validation_ctx_fini(&ctx);
>  err_unlock_list:
>  	up_read(&vm->lock);
>  	if (err == -EAGAIN && !skip_retry)
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 2c7f10cc423f..67dc503d6e04 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -112,9 +112,9 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  {
>  	struct xe_vm *vm = xe_vma_vm(vma);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> -	ktime_t end = 0;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -139,12 +139,11 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	}
>  
>  	/* Lock VM and BOs dma-resv */
> -	drm_exec_init(&exec, 0, 0);
> +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
>  	drm_exec_until_all_locked(&exec) {
>  		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
>  		drm_exec_retry_on_contention(&exec);
> -		if (xe_vm_validate_should_retry(&exec, err, &end))
> -			err = -EAGAIN;
> +		xe_validation_retry_on_oom(&ctx, &err);
>  		if (err)
>  			goto unlock_dma_resv;
>  
> @@ -153,8 +152,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  		fence = xe_vma_rebind(vm, vma, BIT(tile->id));
>  		if (IS_ERR(fence)) {
>  			err = PTR_ERR(fence);
> -			if (xe_vm_validate_should_retry(&exec, err, &end))
> -				err = -EAGAIN;
> +			xe_validation_retry_on_oom(&ctx, &err);
>  			goto unlock_dma_resv;
>  		}
>  	}
> @@ -163,7 +161,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
>  	dma_fence_put(fence);
>  
>  unlock_dma_resv:
> -	drm_exec_fini(&exec);
> +	xe_validation_ctx_fini(&ctx);
>  	if (err == -EAGAIN)
>  		goto retry_userptr;
>  
> @@ -545,6 +543,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct xe_vm *vm;
>  	struct xe_vma *vma;
> @@ -574,15 +573,14 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
>  		goto unlock_vm;
>  
>  	/* Lock VM and BOs dma-resv */
> -	drm_exec_init(&exec, 0, 0);
> +	xe_validation_ctx_init(&ctx, &vm->xe->val, &exec, 0, 0, false);
>  	drm_exec_until_all_locked(&exec) {
>  		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
>  		drm_exec_retry_on_contention(&exec);
> -		if (ret)
> -			break;
> +		xe_validation_retry_on_oom(&ctx, &ret);
>  	}
>  
> -	drm_exec_fini(&exec);
> +	xe_validation_ctx_fini(&ctx);
>  unlock_vm:
>  	up_read(&vm->lock);
>  	xe_vm_put(vm);
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index ba85665d85d4..93d10f0b81cb 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -821,7 +821,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  	struct dma_fence *fence;
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	int migrate_try_count = ctx.devmem_only ? 3 : 1;
> -	ktime_t end = 0;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -891,7 +890,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  
>  	range_debug(range, "PAGE FAULT - BIND");
>  
> -retry_bind:
>  	xe_vm_lock(vm, false);
>  	fence = xe_vm_range_rebind(vm, vma, range, BIT(tile->id));
>  	if (IS_ERR(fence)) {
> @@ -902,8 +900,6 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>  			range_debug(range, "PAGE FAULT - RETRY BIND");
>  			goto retry;
>  		}
> -		if (xe_vm_validate_should_retry(NULL, err, &end))
> -			goto retry_bind;
>  		goto err_out;
>  	}
>  	xe_vm_unlock(vm);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 1c2d9d9065c6..989d84c2e82f 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -241,6 +241,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  		.num_fences = 1,
>  	};
>  	struct drm_exec *exec = &vm_exec.exec;
> +	struct xe_validation_ctx ctx;
>  	struct dma_fence *pfence;
>  	int err;
>  	bool wait;
> @@ -248,7 +249,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
>  
>  	down_write(&vm->lock);
> -	err = drm_gpuvm_exec_lock(&vm_exec);
> +	err = xe_validation_exec_lock(&ctx, &vm_exec, &vm->xe->val);
>  	if (err)
>  		goto out_up_write;
>  
> @@ -280,7 +281,7 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  	up_read(&vm->userptr.notifier_lock);
>  
>  out_fini:
> -	drm_exec_fini(exec);
> +	xe_validation_ctx_fini(&ctx);
>  out_up_write:
>  	up_write(&vm->lock);
>  
> @@ -363,39 +364,6 @@ void xe_vm_kill(struct xe_vm *vm, bool unlocked)
>  	/* TODO: Inform user the VM is banned */
>  }
>  
> -/**
> - * xe_vm_validate_should_retry() - Whether to retry after a validate error.
> - * @exec: The drm_exec object used for locking before validation.
> - * @err: The error returned from ttm_bo_validate().
> - * @end: A ktime_t cookie that should be set to 0 before first use and
> - * that should be reused on subsequent calls.
> - *
> - * With multiple active VMs, under memory pressure, it is possible that
> - * ttm_bo_validate() run into -EDEADLK and in such case returns -ENOMEM.
> - * Until ttm properly handles locking in such scenarios, best thing the
> - * driver can do is retry with a timeout. Check if that is necessary, and
> - * if so unlock the drm_exec's objects while keeping the ticket to prepare
> - * for a rerun.
> - *
> - * Return: true if a retry after drm_exec_init() is recommended;
> - * false otherwise.
> - */
> -bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end)
> -{
> -	ktime_t cur;
> -
> -	if (err != -ENOMEM)
> -		return false;
> -
> -	cur = ktime_get();
> -	*end = *end ? : ktime_add_ms(cur, XE_VM_REBIND_RETRY_TIMEOUT_MS);
> -	if (!ktime_before(cur, *end))
> -		return false;
> -
> -	msleep(20);
> -	return true;
> -}
> -
>  static int xe_gpuvm_validate(struct drm_gpuvm_bo *vm_bo, struct drm_exec *exec)
>  {
>  	struct xe_vm *vm = gpuvm_to_vm(vm_bo->vm);
> @@ -497,10 +465,10 @@ static int xe_preempt_work_begin(struct drm_exec *exec, struct xe_vm *vm,
>  static void preempt_rebind_work_func(struct work_struct *w)
>  {
>  	struct xe_vm *vm = container_of(w, struct xe_vm, preempt.rebind_work);
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	unsigned int fence_count = 0;
>  	LIST_HEAD(preempt_fences);
> -	ktime_t end = 0;
>  	int err = 0;
>  	long wait;
>  	int __maybe_unused tries = 0;
> @@ -523,19 +491,20 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  			goto out_unlock_outer;
>  	}
>  
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +	err = xe_validation_ctx_init(&ctx, &vm->xe->val,
> +				     &exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0, false);
> +	if (err)
> +		goto out_unlock_outer;
>  
>  	drm_exec_until_all_locked(&exec) {
>  		bool done = false;
>  
>  		err = xe_preempt_work_begin(&exec, vm, &done);
>  		drm_exec_retry_on_contention(&exec);
> +		xe_validation_retry_on_oom(&ctx, &err);
>  		if (err || done) {
>  			xe_vm_set_validation_exec(vm, NULL);
> -			drm_exec_fini(&exec);
> -			if (err && xe_vm_validate_should_retry(&exec, err, &end))
> -				err = -EAGAIN;
> -
> +			xe_validation_ctx_fini(&ctx);
>  			goto out_unlock_outer;
>  		}
>  	}
> @@ -582,7 +551,7 @@ static void preempt_rebind_work_func(struct work_struct *w)
>  
>  out_unlock:
>  	xe_vm_set_validation_exec(vm, NULL);
> -	drm_exec_fini(&exec);
> +	xe_validation_ctx_fini(&ctx);
>  out_unlock_outer:
>  	if (err == -EAGAIN) {
>  		trace_xe_vm_rebind_worker_retry(vm);
> @@ -1400,20 +1369,19 @@ int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma)
>  
>  static void xe_vma_destroy_unlocked(struct xe_vma *vma)
>  {
> +	struct xe_device *xe = xe_vma_vm(vma)->xe;
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
> -	int err;
> +	int err = 0;
>  
> -	drm_exec_init(&exec, 0, 0);
> -	drm_exec_until_all_locked(&exec) {
> +	xe_validation_guard(&ctx, &xe->val, &exec, 0, err, false) {
>  		err = xe_vm_lock_vma(&exec, vma);
>  		drm_exec_retry_on_contention(&exec);
>  		if (XE_WARN_ON(err))
>  			break;
> +		xe_vma_destroy(vma, NULL);
>  	}
> -
> -	xe_vma_destroy(vma, NULL);
> -
> -	drm_exec_fini(&exec);
> +	xe_assert(xe, !err);
>  }
>  
>  struct xe_vma *
> @@ -2490,6 +2458,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  			      u16 pat_index, unsigned int flags)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct xe_vma *vma;
>  	int err = 0;
> @@ -2497,9 +2466,9 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	lockdep_assert_held_write(&vm->lock);
>  
>  	if (bo) {
> -		drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -		drm_exec_until_all_locked(&exec) {
> -			err = 0;
> +		err = 0;
> +		xe_validation_guard(&ctx, &vm->xe->val, &exec,
> +				    DRM_EXEC_INTERRUPTIBLE_WAIT, err, false) {
>  			if (!bo->vm) {
>  				err = drm_exec_lock_obj(&exec, xe_vm_obj(vm));
>  				drm_exec_retry_on_contention(&exec);
> @@ -2508,27 +2477,34 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  				err = drm_exec_lock_obj(&exec, &bo->ttm.base);
>  				drm_exec_retry_on_contention(&exec);
>  			}
> -			if (err) {
> -				drm_exec_fini(&exec);
> +			if (err)
>  				return ERR_PTR(err);
> +
> +			vma = xe_vma_create(vm, bo, op->gem.offset,
> +					    op->va.addr, op->va.addr +
> +					    op->va.range - 1, pat_index, flags);
> +			if (IS_ERR(vma))
> +				return vma;
> +
> +			if (!bo->vm) {
> +				err = add_preempt_fences(vm, bo);
> +				goto out_err;
>  			}
>  		}
> +		if (err)
> +			return ERR_PTR(err);
> +	} else {
> +		vma = xe_vma_create(vm, NULL, op->gem.offset,
> +				    op->va.addr, op->va.addr +
> +				    op->va.range - 1, pat_index, flags);
> +		if (IS_ERR(vma))
> +			return vma;
> +
> +		if (xe_vma_is_userptr(vma))
> +			err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
>  	}
> -	vma = xe_vma_create(vm, bo, op->gem.offset,
> -			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, pat_index, flags);
> -	if (IS_ERR(vma))
> -		goto err_unlock;
> -
> -	if (xe_vma_is_userptr(vma))
> -		err = xe_vma_userptr_pin_pages(to_userptr_vma(vma));
> -	else if (!xe_vma_has_no_bo(vma) && !bo->vm)
> -		err = add_preempt_fences(vm, bo);
> -
> -err_unlock:
> -	if (bo)
> -		drm_exec_fini(&exec);
>  
> +out_err:
>  	if (err) {
>  		prep_vma_destroy(vm, vma, false);
>  		xe_vma_destroy_unlocked(vma);
> @@ -3296,34 +3272,32 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *vm, struct xe_vma_ops *vops,
>  static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
>  						   struct xe_vma_ops *vops)
>  {
> +	struct xe_validation_ctx ctx;
>  	struct drm_exec exec;
>  	struct dma_fence *fence;
> -	int err;
> +	int err = 0;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> -	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
> -		      DRM_EXEC_IGNORE_DUPLICATES, 0);
> -	drm_exec_until_all_locked(&exec) {
> +	xe_validation_guard(&ctx, &vm->xe->val, &exec,
> +			    DRM_EXEC_INTERRUPTIBLE_WAIT |
> +			    DRM_EXEC_IGNORE_DUPLICATES, err, true) {
>  		err = vm_bind_ioctl_ops_lock_and_prep(&exec, vm, vops);
>  		drm_exec_retry_on_contention(&exec);
> -		if (err) {
> -			fence = ERR_PTR(err);
> -			goto unlock;
> -		}
> +		xe_validation_retry_on_oom(&ctx, &err);
> +		if (err)
> +			return ERR_PTR(err);
>  
>  		fence = ops_execute(vm, vops);
>  		if (IS_ERR(fence)) {
>  			if (PTR_ERR(fence) == -ENODATA)
>  				vm_bind_ioctl_ops_fini(vm, vops, NULL);
> -			goto unlock;
> +			return fence;
>  		}
>  
>  		vm_bind_ioctl_ops_fini(vm, vops, fence);
>  	}
>  
> -unlock:
> -	drm_exec_fini(&exec);
>  	return fence;
>  }
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 3b6e7234dac4..418940222690 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -262,8 +262,6 @@ int xe_vma_userptr_pin_pages(struct xe_userptr_vma *uvma);
>  
>  int xe_vma_userptr_check_repin(struct xe_userptr_vma *uvma);
>  
> -bool xe_vm_validate_should_retry(struct drm_exec *exec, int err, ktime_t *end);
> -
>  int xe_vm_lock_vma(struct drm_exec *exec, struct xe_vma *vma);
>  
>  int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
> -- 
> 2.50.1
> 
