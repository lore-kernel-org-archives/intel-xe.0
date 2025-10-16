Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF32CCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 18:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE8310E33C;
	Thu, 16 Oct 2025 18:38:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzddT6qY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807E10E33C
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760639912; x=1792175912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Je98gY+5xUacL7dbqAB1zqZehmMAVCAjDgAnVChqg2o=;
 b=YzddT6qYG2u+m7jkQF+1vR/iTlB/6rlPpQnhzObG/NZLmWGiAK0i/Q2s
 OzsHlMIpM6m07XpnIH4rQfMlc+KguVT1BGIQ4sjpOYYfecvgj5K8mCxBV
 KYEHtLbaORxmQK7RxsXMBYAAkB7CrNPp76OuRTi+u6KuAugbfmt5iL7lT
 PdNurbaO/1LZrh+GOMHbFzhv+YgTYOlo0UZ86d48c/ASwQX+LhD8eIWLS
 F0y7nZ59CuWwHgyogpyIFeJaWRimMYI+6PuAxRFbvnXylq+oFJv81MeBZ
 X4Rz4iyK9gDBZeIiBzJo3udkjte1zCEMwMriJKkJXCEdJhkOvt19SztXi g==;
X-CSE-ConnectionGUID: tmyyn9Q7S2WE9vRygp3eHQ==
X-CSE-MsgGUID: YHE37YK0QFO2rcARgS2Znw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62749835"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62749835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:38:31 -0700
X-CSE-ConnectionGUID: oq/5qv4gQ7a3MGz7gJZxyA==
X-CSE-MsgGUID: u0a2YWVwSt2hl44e4sGcLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="187614990"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 11:38:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:38:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 11:38:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 11:38:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3CLrvIWuXT44laBbufO0wn2/TiDB6YyIDmoiXy5Yz48eXQm0SNvjyal8i4zCcBGV2yY8xNF7vekqgU0WFtPHqFuVrDnFmH8mft8qshUdCR7q3oCiGfWSgnba8QnHsoccDtR25SPwChhEmFQyOwbn9HYV3e6TgxgveRUu+i0u0/xc6UOuwWFVLVXXulMgxsN7wlOzYGBgUYP8Efr60N5bUuvwSwJJSpryXK0asBHQF7dyny85eRPbRxIVDwuqzB4/Nu+P86mH50JW3hmD8diYOihFcsUeNHTVAtBA4NisC5Av5wRv2z6N4R3k/CyunPlSP6ht+WzgdewY9XK4o6JAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gR7ReiW79YE+5BLA3/hY+oRAYwNWIsP9zDwvdo1Q130=;
 b=JUJn3Kxr7fjMpdfSb2ZhkaHwuGZzIa7A/32kR/Qj1Bvi1ENolksd7K2FHQ1nrLYmgH5TSRfCwCAMGqi2oDmMu4q2LYmC9iSo5xi+az7NS25FIbNAP937+ZkDwsM87C5w+mhNnIBZK9MCKESrsV7qS3oX8QHRykqJ43A2tgI704qXmKPJgQPEZrwovH93raUfbxmpjsj/rctAq/A3982cLHs6Wd3J2kGY+Be12bEP9gX57aMLuDPDqycOV7J+PWvL02HAV9KYPTxkql1UvZkvJjSkm/t/TP1II0kZYBcqcsgK8KNjGHw9u6zDZr0Kk7PCvNKgTG2hMv0wAf2EvoTMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6726.namprd11.prod.outlook.com (2603:10b6:806:266::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 18:38:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 18:38:28 +0000
Date: Thu, 16 Oct 2025 11:38:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/gt: Introduce runtime suspend/resume
Message-ID: <aPE7oYJa037sxbaU@lstrano-desk.jf.intel.com>
References: <20251014073036.3282329-1-raag.jadav@intel.com>
 <20251014073036.3282329-3-raag.jadav@intel.com>
 <1aa6c0b4-73fd-4603-b414-802b4e15442a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1aa6c0b4-73fd-4603-b414-802b4e15442a@intel.com>
X-ClientProxiedBy: MW4PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:303:b4::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d51d97-132c-448c-f2f3-08de0ce332d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1HMvO/YBWwJdsTvGStbQp85VzbRnCLxF+l0k+Dw/6dOFjNJTuaXpqcJadg0J?=
 =?us-ascii?Q?R3JZFCFtdWmHrhK2K0gj+6m5sBxZ+x7cZbZGsl+otQcm1a8CbjXun8NxNnJa?=
 =?us-ascii?Q?HJdK3n6QY3DxGvc4TZFjut6NKx/TMFPCA4rgXDFyDWDDH0rLYSMprLJhn6v1?=
 =?us-ascii?Q?hwc6dkVlTf1m2Q98kKbO+qIue3clff3P3ftqgD5lspzN1KCnTNY7VZ4851BG?=
 =?us-ascii?Q?VOOEzC8u1XtbLzyjM1BRIbJKyRNaKKzyFOwXCpLTsQjBWhc5q8oRCWGhrWZ2?=
 =?us-ascii?Q?eAjNjFoaLOm1AH9x1rJM5mHnT28vR6UNnlQ0kcIoztfBzBOjotVzJPl9OZxo?=
 =?us-ascii?Q?+UReCS4KkiKlyzX6iXa8pBlqfl/QaLe9pKZy31c3z4ohYals4MDdaXMDxOR3?=
 =?us-ascii?Q?YlExYg1HEDDgQMhW9KVlLsVxMwTtijXMBKMj8Yl+k2d9S8MQsM2VQtjSDxRM?=
 =?us-ascii?Q?kHIu2rlK/Q5tY+ve+O617eMrcD5I7DRKfmHKmA9wTOaBRp2gzCCsjCapiz13?=
 =?us-ascii?Q?SYg9DViFIB7hNo/oZuhStPd1mmYMSZwJQR7BPjhxgokVxRyqX1mE+606xqbf?=
 =?us-ascii?Q?jAR1a2QZTJj2xF2XbQ/72ZZ9Q5cDed00XOX5/7htwgL65IeuyrfI0qbtx/Vx?=
 =?us-ascii?Q?ooEabStS/XuQkICnZsJe/8XjpBpERjcvkcSbcw+5EB70Sp9C3xAMffvLWzxa?=
 =?us-ascii?Q?4i9U0Jo6kRcUpZgxTleGWq4fZydIHG2EzkLxgclYwCDy9VRTeZdI1jJG6/P1?=
 =?us-ascii?Q?g4Zxc9j5/+sIBBmtmREtTlwBqQcn4WZeWINh5LBehKxaFPSOSoYPtFZzTYhV?=
 =?us-ascii?Q?KzIsM2si+afKGLnf+LBI8u34gtTO6TBSExPdNIy3L9wEhE5txgEdo6Hhqt0D?=
 =?us-ascii?Q?LXz5g4ApsktoqvtnZsCHaqGC4u6RPFDPdk5p6AwS2xWC60krVVVUPvrWd9Pq?=
 =?us-ascii?Q?XMNMCwzc6rcumpardE5OkFu0VzoeymAfszO64hqYYW3tpkH8YvLaJEx1Xdhf?=
 =?us-ascii?Q?/ZQi2SQK1k4zMQM0lAXHdvlBPfQuyh5ZyhPhkrCklK7w8NkuC8MxjwoDGoUA?=
 =?us-ascii?Q?EBR8L/3M9pB/AAOveuvMstoIQaIX4V8Yb0nbKGoC4ezF6MIKPc5FqTLoZd4n?=
 =?us-ascii?Q?YK2QyZSv/6s2Yg7fzQyWt9E4uaX5rB4Ulfqn4Yelc2dwC5ErkLTS9MLwnH1N?=
 =?us-ascii?Q?HJz/ektUh3cun+7WenerilPRW1qMKSZS6mVNdDD0uzKTrEDzyH/1ObT3yXlU?=
 =?us-ascii?Q?ADXJV1/I/2/zfi6V9Oa4XojCfSSBVMkGiU3IKRBLwz0lvkedr8dsFlhjooRz?=
 =?us-ascii?Q?19uQx0TX9jN9c6PjEFiIxwXbAIqBnc6pCVkxc0yN202uJ6jR0mNYr3Y54n7j?=
 =?us-ascii?Q?OCakemSIZda4uYFIGkG3iJNvnUAS2KRuej5xmeIoZZ5W/oGIqWJB05jDzZqJ?=
 =?us-ascii?Q?VszdZBc6JpvsQFVRvvLxORkSGu0raEWB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8Lb1HVOUVEnMc9c+QzKxXvkpGqQTne/MAW3B2/HNHiUwCGkRPHgIZvioVJxE?=
 =?us-ascii?Q?Y6wTdr7jsczgctWyzxa4vVCD3f4ulQt2jdELT+DaITTuRPsmRg3xRXkQjzzb?=
 =?us-ascii?Q?7ASnUhXlikvi4nlf0bIg8l8cBf546RPM2RyIQ7c2706B6OJhLaG+6M829sPA?=
 =?us-ascii?Q?IblnnbO9wVSvGc4zCjE4Yuagn7dzCBuJt0XhBSV23vVYYVU5spZBq4alTqGH?=
 =?us-ascii?Q?I8AJ/A7OpE/Nh7eyED8W7QAyvqrTB1Uu7NlgF3yvK5rmMoesYDMqX9YBq/tn?=
 =?us-ascii?Q?OEZSxjpyL6UvWWEvTeet2bBIZC+Smpg3hoh1uG1Tgu9q+lfu+rswYLI8J4Yw?=
 =?us-ascii?Q?KPBWbZQBXfnV2ZYGjWC4vKfALiWj9G1UX/rsWEoxt4mu+vxmgAhkJS8XyBGX?=
 =?us-ascii?Q?7vJGLYDiyL+/EYHFjOgMQco56lf7OwxuEkmXLCsCx1lcb/9lP+rpBH5Vy9bN?=
 =?us-ascii?Q?xfEJs2+WX8vF2RhI1dFWxqDppG469ac4gh7m4aIKxGOoGTN2FHdJw+IV0IH3?=
 =?us-ascii?Q?zj/Sy8JdxWNHYDk4VzAnL85P9w0XJWZxz3BVmtSARiLl0TVmc1RnM3DcABjf?=
 =?us-ascii?Q?SeFROK+ijLgab7Iu8TNX4jACeNPUumvSOded493p+iDibod/6tin3zyLUDjy?=
 =?us-ascii?Q?9e6wIqmK5lWfOo0NEUq27puwCXgHdHLkN9AMDqmf7weER2z3Y8rkB6GjMT6M?=
 =?us-ascii?Q?R6SsH7Bkgs3jM6KUeWOEibeAKgRyGfC0BqW9Sk47WWAvHS+rJbdpICOgzFRz?=
 =?us-ascii?Q?vvIZfz2IOZBNe7+SVsERSv7+xFTCAHDHkSGhz1x2zGX7wHICNUYDvocu//sa?=
 =?us-ascii?Q?RNM52tDwSpx6/5ew2pOxl+La5W9d2D6scDt4slIUUdECbfmPHNUfhkwq9cou?=
 =?us-ascii?Q?+6vhb5Jab85Pi7BXwdDAnApDdWuEmDsdF8TuxvXGcPjtFkh8jfvck8svA5y8?=
 =?us-ascii?Q?0Q1W6HCaECCPvF9G7WI+mYBo0r0ZAwM38TuoBouvLQ0kvLnxA6mvtuauqj2m?=
 =?us-ascii?Q?xpOp0zKVIQyZTG1ifnpciGxrUb61kv9jHTL2Xv/9v5m3o26R6HGKqIjEpYCB?=
 =?us-ascii?Q?Vn2Jgn38VWi/9sEx3ALMYHk7IPSyC9ND38I/zqbYfa+4Dsm4Hgd/nhfuhJfb?=
 =?us-ascii?Q?oPe3YZgTbutCYCeBJ6amqmgXW6e5L2aBa/k4HdOlUChf0eURTzZk+TipfrE8?=
 =?us-ascii?Q?WNCPjWdsYJ1FUpWjmXlTJsu+YHaFekcdbNcMZy9yz31NAZ5UKf1zd6g4j4RT?=
 =?us-ascii?Q?IEPx1J/mopjkVmMtSNWySltHxJXwKq3eRhEXbvccg9YoIZpwsjwITRFZM2gW?=
 =?us-ascii?Q?2fk5ufm8eV5C7qikXjsF7LVw2RtDQunAGenzN+WBGfGXLzXOY6pOIbcrAifl?=
 =?us-ascii?Q?WI7HDYt0PFyeBGJ6ywXAO9Gj7mx4bZbWepFqXgnMoFKzgFEoXykXnuE9KB6i?=
 =?us-ascii?Q?Cj4kmM/dzaRCabt5cxa6lQwxjb2O+Me5akpFoJsRLbLwQDUDI+YuYsuwB6Pu?=
 =?us-ascii?Q?nD0Y/zeuCMqWlrcPsrNA8oMjf8AANmYvXB9CU/v1FSmlXJ4bC11OaJh1cUkQ?=
 =?us-ascii?Q?twsFG0x6XrO76T2oRwWsbKovv20DIC7RPh8jOQIzPhACyX58Y47bGJKNKZVj?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d51d97-132c-448c-f2f3-08de0ce332d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 18:38:28.7279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/TmaYKJVZjyDOV367r6D8L/3C/HAl3SxIrzvCu9kKHBrlEmnzHkwUXHS7bu59B20py/qHykl0Y3emfBaSjC/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6726
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

On Thu, Oct 16, 2025 at 08:32:23AM -0700, Daniele Ceraolo Spurio wrote:
> 
> 
> On 10/14/2025 12:30 AM, Raag Jadav wrote:
> > If power state is retained between suspend/resume cycle, we don't need
> > to perform full GT re-initialization. Introduce runtime helpers for GT
> > which greatly reduce suspend/resume delay.
> > 
> > v2: Drop redundant xe_gt_sanitize() and xe_guc_ct_stop() (Daniele)
> >      Use runtime naming for guc helpers (Daniele)
> > v3: Drop redundant logging, add kernel doc (Michal)
> >      Use runtime naming for ct helpers (Michal)
> > v4: Fix tags (Rodrigo)
> > v5: Include host_l2_vram workaround (Daniele)
> >      Reuse xe_guc_submit_enable/disable() helpers (Daniele)
> 
> Based on the reply about VF behavior in the previous rev, I am thinking this
> is not the correct approach to this.
> If on a VF the runtime_suspend/resume functions are not called at all like
> you said, it means that the VF driver needs to be able to cope with the fact
> that the HW can lose power without it being directly notified if its rpm
> refcount is 0. This in turn means that on a VF the driver can't rely on what
> you do in xe_uc_runtime_suspend/resume() to idle the state and must instead
> guarantee that the state is already idled when the last rpm ref is released
> and that a new rpm ref is taken before restarting anything (which might
> already be true). AFAIK there are no difference in the SW state management
> of queues and CTBs between PF and VF, so if we achieve that on a VF we'll
> also have it on PF/Native, which means that there will be no need to
> pause/unpause CTBs and exec_queues. The only thing that the PF would need to
> do in the rpm flow is program the HW (e.g. the host_l2_vram stuff and the
> irq re-enabling).
> 
> tl;dr, if we guarantee that:
> 1 - if the rpm refcount is 0 then there is no activity on HW, so nothing
> that needs to be paused (which might already be true)
> 2 - an rpm ref is taken before any activity is started (which might also
> already be true)
> 
> Then we're guaranteeing that there is nothing to pause/unpause at runtime
> suspend/resume time, so we're safe skipping those calls entirely on VF while
> on native/PF we can just focus on the HW re-programming.
> 
> BTW, any idea how this is working with the current code? Given that we're
> re-loading the GuC on runtime resume, are the VFs getting disconnected and

VFs hold a RPM ref. See pf_enable_vfs in xe_pci_sriov.c.

Matt

> having to detect that and re-connect? Or are we just disabling rpm if a VF
> is enabled? Because if our approach is that rpm is just not supported if VFs
> are in use then we can keep your current approach and add an assert to make
> sure we're not runtime suspending if the vf count is > 0.
> 
> Daniele
> 
> > 
> > Co-developed-by: Riana Tauro <riana.tauro@intel.com>
> > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt.c     | 60 ++++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_gt.h     |  2 ++
> >   drivers/gpu/drm/xe/xe_guc.c    | 34 +++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc.h    |  2 ++
> >   drivers/gpu/drm/xe/xe_guc_ct.c | 27 +++++++++++++++
> >   drivers/gpu/drm/xe/xe_guc_ct.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pm.c     | 10 +++---
> >   drivers/gpu/drm/xe/xe_uc.c     | 28 ++++++++++++++++
> >   drivers/gpu/drm/xe/xe_uc.h     |  2 ++
> >   9 files changed, 162 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index d8e94fb8b9bd..0eacca14ccbb 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -1003,6 +1003,66 @@ int xe_gt_resume(struct xe_gt *gt)
> >   	return err;
> >   }
> > +/**
> > + * xe_gt_runtime_suspend() - GT runtime suspend
> > + * @gt: the GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_runtime_suspend(struct xe_gt *gt)
> > +{
> > +	unsigned int fw_ref;
> > +	int err = -ETIMEDOUT;
> > +
> > +	xe_gt_dbg(gt, "runtime suspending\n");
> > +
> > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> > +		goto err_force_wake;
> > +
> > +	xe_uc_runtime_suspend(&gt->uc);
> > +	xe_gt_disable_host_l2_vram(gt);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	xe_gt_dbg(gt, "runtime suspended\n");
> > +
> > +	return 0;
> > +
> > +err_force_wake:
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	return err;
> > +}
> > +
> > +/**
> > + * xe_gt_runtime_resume() - GT runtime resume
> > + * @gt: the GT object
> > + *
> > + * Return: 0 on success, negative error code otherwise.
> > + */
> > +int xe_gt_runtime_resume(struct xe_gt *gt)
> > +{
> > +	unsigned int fw_ref;
> > +	int err = -ETIMEDOUT;
> > +
> > +	xe_gt_dbg(gt, "runtime resuming\n");
> > +
> > +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> > +		goto err_force_wake;
> > +
> > +	xe_gt_enable_host_l2_vram(gt);
> > +	xe_uc_runtime_resume(&gt->uc);
> > +
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	xe_gt_dbg(gt, "runtime resumed\n");
> > +
> > +	return 0;
> > +
> > +err_force_wake:
> > +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > +	return err;
> > +}
> > +
> >   struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> >   				     enum xe_engine_class class,
> >   				     u16 instance, bool logical)
> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > index 5df2ffe3ff83..ceb633ec22d0 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.h
> > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > @@ -52,6 +52,8 @@ int xe_gt_suspend(struct xe_gt *gt);
> >   void xe_gt_shutdown(struct xe_gt *gt);
> >   int xe_gt_resume(struct xe_gt *gt);
> >   void xe_gt_reset_async(struct xe_gt *gt);
> > +int xe_gt_runtime_resume(struct xe_gt *gt);
> > +int xe_gt_runtime_suspend(struct xe_gt *gt);
> >   void xe_gt_sanitize(struct xe_gt *gt);
> >   int xe_gt_sanitize_freq(struct xe_gt *gt);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index d94490979adc..6262ca1c1d42 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1599,6 +1599,40 @@ int xe_guc_start(struct xe_guc *guc)
> >   	return xe_guc_submit_start(guc);
> >   }
> > +/**
> > + * xe_guc_runtime_suspend() - GuC runtime suspend
> > + * @guc: The GuC object
> > + *
> > + * Stop further runs of submission tasks on given GuC and runtime suspend
> > + * GuC CT.
> > + */
> > +void xe_guc_runtime_suspend(struct xe_guc *guc)
> > +{
> > +	xe_guc_submit_pause(guc);
> > +	xe_guc_submit_disable(guc);
> > +	xe_guc_ct_runtime_suspend(&guc->ct);
> > +}
> > +
> > +/**
> > + * xe_guc_runtime_resume() - GuC runtime resume
> > + * @guc: The GuC object
> > + *
> > + * Runtime resume GuC CT and allow further runs of submission tasks on
> > + * given GuC.
> > + */
> > +void xe_guc_runtime_resume(struct xe_guc *guc)
> > +{
> > +	/*
> > +	 * Runtime PM flows are not applicable for VFs, so it's safe to
> > +	 * directly enable IRQ.
> > +	 */
> > +	guc_enable_irq(guc);
> > +
> > +	xe_guc_ct_runtime_resume(&guc->ct);
> > +	xe_guc_submit_enable(guc);
> > +	xe_guc_submit_unpause(guc);
> > +}
> > +
> >   void xe_guc_print_info(struct xe_guc *guc, struct drm_printer *p)
> >   {
> >   	struct xe_gt *gt = guc_to_gt(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> > index 1cca05967e62..0165e941a352 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.h
> > +++ b/drivers/gpu/drm/xe/xe_guc.h
> > @@ -35,6 +35,8 @@ int xe_guc_upload(struct xe_guc *guc);
> >   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> >   int xe_guc_enable_communication(struct xe_guc *guc);
> >   int xe_guc_opt_in_features_enable(struct xe_guc *guc);
> > +void xe_guc_runtime_suspend(struct xe_guc *guc);
> > +void xe_guc_runtime_resume(struct xe_guc *guc);
> >   int xe_guc_suspend(struct xe_guc *guc);
> >   void xe_guc_notify(struct xe_guc *guc);
> >   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 3ae1e8db143a..2232e872dbd6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -634,6 +634,33 @@ void xe_guc_ct_stop(struct xe_guc_ct *ct)
> >   	stop_g2h_handler(ct);
> >   }
> > +/**
> > + * xe_guc_ct_runtime_suspend() - GuC CT runtime suspend
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Set GuC CT to disabled state.
> > + */
> > +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct)
> > +{
> > +	/*
> > +	 * Since we're already in runtime suspend path, we shouldn't have pending
> > +	 * messages. But if there happen to be any, we'd probably want them to be
> > +	 * thrown as errors for further investigation.
> > +	 */
> > +	xe_guc_ct_disable(ct);
> > +}
> > +
> > +/**
> > + * xe_guc_ct_runtime_resume() - GuC CT runtime resume
> > + * @ct: the &xe_guc_ct
> > + *
> > + * Restart GuC CT and set it to enabled state.
> > + */
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct)
> > +{
> > +	xe_guc_ct_restart(ct);
> > +}
> > +
> >   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> >   {
> >   	struct guc_ctb *h2g = &ct->ctbs.h2g;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> > index ca1ce2b3c354..5599939f8fe1 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> > @@ -17,6 +17,8 @@ int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
> >   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> >   int xe_guc_ct_restart(struct xe_guc_ct *ct);
> >   void xe_guc_ct_disable(struct xe_guc_ct *ct);
> > +void xe_guc_ct_runtime_resume(struct xe_guc_ct *ct);
> > +void xe_guc_ct_runtime_suspend(struct xe_guc_ct *ct);
> >   void xe_guc_ct_stop(struct xe_guc_ct *ct);
> >   void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
> >   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 53507e09f7bc..403a61e98ad8 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -591,7 +591,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   	}
> >   	for_each_gt(gt, xe, id) {
> > -		err = xe_gt_suspend(gt);
> > +		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
> >   		if (err)
> >   			goto out_resume;
> >   	}
> > @@ -633,10 +633,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	xe_rpm_lockmap_acquire(xe);
> > -	for_each_gt(gt, xe, id)
> > -		xe_gt_idle_disable_c6(gt);
> > -
> >   	if (xe->d3cold.allowed) {
> > +		for_each_gt(gt, xe, id)
> > +			xe_gt_idle_disable_c6(gt);
> > +
> >   		err = xe_pcode_ready(xe, true);
> >   		if (err)
> >   			goto out;
> > @@ -657,7 +657,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	xe_irq_resume(xe);
> >   	for_each_gt(gt, xe, id)
> > -		xe_gt_resume(gt);
> > +		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> >   	xe_display_pm_runtime_resume(xe);
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 465bda355443..6a58b33248f5 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -301,6 +301,34 @@ int xe_uc_suspend(struct xe_uc *uc)
> >   	return xe_guc_suspend(&uc->guc);
> >   }
> > +/**
> > + * xe_uc_runtime_suspend() - UC runtime suspend
> > + * @uc: the UC object
> > + *
> > + * Runtime suspend all UCs.
> > + */
> > +void xe_uc_runtime_suspend(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_runtime_suspend(&uc->guc);
> > +}
> > +
> > +/**
> > + * xe_uc_runtime_resume() - UC runtime resume
> > + * @uc: the UC object
> > + *
> > + * Runtime resume all UCs.
> > + */
> > +void xe_uc_runtime_resume(struct xe_uc *uc)
> > +{
> > +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> > +		return;
> > +
> > +	xe_guc_runtime_resume(&uc->guc);
> > +}
> > +
> >   /**
> >    * xe_uc_declare_wedged() - Declare UC wedged
> >    * @uc: the UC object
> > diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
> > index 21c9306098cf..5398da1a8097 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.h
> > +++ b/drivers/gpu/drm/xe/xe_uc.h
> > @@ -14,6 +14,8 @@ int xe_uc_init_post_hwconfig(struct xe_uc *uc);
> >   int xe_uc_load_hw(struct xe_uc *uc);
> >   void xe_uc_gucrc_disable(struct xe_uc *uc);
> >   int xe_uc_reset_prepare(struct xe_uc *uc);
> > +void xe_uc_runtime_resume(struct xe_uc *uc);
> > +void xe_uc_runtime_suspend(struct xe_uc *uc);
> >   void xe_uc_stop_prepare(struct xe_uc *uc);
> >   void xe_uc_stop(struct xe_uc *uc);
> >   int xe_uc_start(struct xe_uc *uc);
> 
