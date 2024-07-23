Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF92EC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 16:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7801E10E608;
	Tue, 23 Jul 2024 16:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sk2pqgJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2B10E60B
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 16:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721751885; x=1753287885;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5WEg/GjqAukvNzfnCIn4jdhwj4IGkxNDS2k1zOaZgt4=;
 b=Sk2pqgJmj6KcytCBg+O7wOloJ3V4GIvkzFh4Gm7gF6OZ8XBgBn/ReKX9
 qPtGGhOivczGtN7GWDoaZ2EJppDAzBYLmwOYEICDgLDSZhZM65Warky/g
 oCCFI79Dy3JxGfQgMKrJB0NkRyksbjR9L7TPaZnq9EfzcTwIrZ7ww+hBu
 AHTpUOsA8/Nq+D/CJrDaZLEMoOkTwnnZ6eBCZdtlwVygUb5a/j+MNhVwv
 zsjgsE9qelnR8v85LHCBc2Isf+X/Rhlxru+Da82JZ8AqJGJLCj7+SiVlZ
 +JdPf2+AoPFkXSutDkEBeOqEsfewg1NtmwXzboJvuY3u9nqPq1O/be9KS g==;
X-CSE-ConnectionGUID: LjQVeopBSjazVpwntyuNHw==
X-CSE-MsgGUID: ttUrk4TERXajkwZT1lhEXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="22288550"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="22288550"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 09:24:44 -0700
X-CSE-ConnectionGUID: U+agXbd6THW0w0qO8PFnKw==
X-CSE-MsgGUID: +0mk8/SETZK4VmmLidV19g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="52305613"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 09:24:44 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 09:24:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 09:24:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 09:24:43 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 09:24:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=syB4GD9EXSPn6xpkMuZUKb4FvIVsf5FutfYynIAYLEmgosEWRH+CIqVdKiz3t2Ua0WcFhUgFhkSA+kQIAyQ0P4V86eDvvO8lcdb8YKjz7l08Zw8930KjAwUEpW2yXcPjoC2P4ppITn7nbnd3XsWhv1XvKRisGv+DzuLE5AkU9b0CkFt5EgB6AQhrq1M8UtIyiW+t/CfXnG8o7fnLyOS5Rk0GQthwr/7UZsfbc3nRw3elSQC1C+NYDVC9CFpWmQcaWsJ4QVav6sLQO02WQU8ZM2VqGSdNMa75SlnxNs73QSntrWyvXlarxuaPLLaifzeKuQmf3CLuQLYe7L7cskw1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vaz39nk67nukWaR7BIhU6h9Au+uYozzAczQSQw+6zo=;
 b=fUgqTt+9jxqUWCMvZRZKqCoYBdl5cXWoE6zmUXK6Ubd6Crx/hlmMQzkBsTnQNbQT3DI2ebNu4eAdjtsG33zXzEVd9++qQ+n6yO7B/yfW+7mmoB1QF3dpPN0vPjhhBDEsiejwxCZ4ndAB6hqjTJuP54E2LfchLuE9Ax9to8k/x8ae2wCsgtnpPV7OFDrWG2fspk2n3rN5j8lYXNk6mfjZ4rp3lhLbN4/MvnOWrTNeSfXMP3KbiPbjIT+y2JzWKuSvPVBqe+7TIhM3XE6BoVmE5MY+roI8YO3eSgeIlDNcEMcuSiAzojprfPbJ87OBlYseOFvvVyfMtDQ9aAoTus1+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB6782.namprd11.prod.outlook.com (2603:10b6:806:25e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Tue, 23 Jul
 2024 16:24:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Tue, 23 Jul 2024
 16:24:35 +0000
Date: Tue, 23 Jul 2024 16:23:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Sai
 Gowtham Ch" <sai.gowtham.ch@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add sent and recv counters for tlb
 invalidations
Message-ID: <Zp/ZEeUAAepmpqs4@DUT025-TGLU.fm.intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-2-nirmoy.das@intel.com>
 <9ecd36c8-b880-4097-a6ae-27e786b15497@intel.com>
 <51db88f1-79b1-44e9-9354-0f628069a64b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <51db88f1-79b1-44e9-9354-0f628069a64b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: b75fbdb9-9083-48ef-88af-08dcab33f0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?VSKaBFHXAUIz8umVseGErj9GcKiE89AkkPv+KQZrQ4Mq+YGJMm8i4drBen?=
 =?iso-8859-1?Q?SwjylFvHWd7bTO02HjbJD5pkAQokt7OdmhmHTO6NSsddViOcwbPU/Q9Zog?=
 =?iso-8859-1?Q?ZVPAGbrH0+mjvvG++ENRfiFMG8Ormd+hfZXttuKjxfMxEa/0v5hc+ewpLh?=
 =?iso-8859-1?Q?K04tYy1gtxH2Wcy6X6NFS36lJ1EzOQpxeg52w/DgHoM9MVVhWqdIpaUcrR?=
 =?iso-8859-1?Q?7oMQyv9sAtAXK3Mx4h/bhdXYuHgc+DAGtfdb9riJlnvu40z4XeCd2zCAjA?=
 =?iso-8859-1?Q?2iEHPc1alv7aYC9AGfvthqdUN5aBfFj4lz17ExmYYFE1cuv14aPMlX4v3t?=
 =?iso-8859-1?Q?PmGsj8PCNu1CdPXnmmpx/kIucw7ABjleQNMqeqQJknSi6wQX4WDCfweMc6?=
 =?iso-8859-1?Q?0dIWXqsiUdPWdpEPvnyNW4OniEGeVHWa57uSxLgg5V/q7UrkK+dbqYA8YB?=
 =?iso-8859-1?Q?rmDSM/hJPXETnu6s4UEO0pr7ZHJh5MwRBb04P7/wYe+rOqH0EXz+giR0xS?=
 =?iso-8859-1?Q?OClq2qQHRFjVv55VHILcBb912xs79cNN9w6+4om9Aadc9+rwfdiZB0hiqH?=
 =?iso-8859-1?Q?J6pDho+sN8MXN0rxxlFQIO6JS2SGpiMshoNEwPXJVmeUJS83kUMxiFA45Z?=
 =?iso-8859-1?Q?nzQfqmm79ECb3zCXsx5shp+Y30vCyCrg7Ko/UNtY9F9Q4wR1R1+fsoAgIH?=
 =?iso-8859-1?Q?VTSwePcVQ+c6P+h4ce6kez/ES8t4eNqOWcGp6slqMfWiL45u7KqOrIBrWh?=
 =?iso-8859-1?Q?s+hJ246uN7BEWmYnnoDMUIP8vtyzm62qhyUpHXRYcOnn1EuYBzM5EqxGYJ?=
 =?iso-8859-1?Q?PleRM10+jxZP9nDwdZexBmuNhgYOc3UTqH9Wuc/tOUSMzvn+YwTeEtEI1H?=
 =?iso-8859-1?Q?xCkoWWxPi3M+H1X96CaJokpZ5EBrzK3pnxBWQxt7B1ZzReECFLFKaQiny1?=
 =?iso-8859-1?Q?UhvdPi6bSGbLnUaYuznSsMiLj8yBjxEY08nmrwB/8srY+OOdBP50Cnm62e?=
 =?iso-8859-1?Q?FvnjroVQUC9thywnTDvUBDPMqci7SHuWv/6CuPKNsX/cyVAEjtOsuiFq29?=
 =?iso-8859-1?Q?uuUXIYvbRbUjlhATUJGl4/Hu3J83hKXZ4EulK8MVnELN2QepUNQGAuBVPK?=
 =?iso-8859-1?Q?k52dBYmAKZ5lxoWyvcDygM/D8HDbCMgnqs0g0IsF3241WksJCVKp0Fjui2?=
 =?iso-8859-1?Q?KnXjiJXXIEIi4mMhSUxPMqd/NjHr+YWPZ8kiZiwk6ZwI2V44aX8SOMxSm0?=
 =?iso-8859-1?Q?TBN9kmsN5pC0btA2/kZocBpVRI6QNr3FCbVqIbLnlLU0epDS2MjSrGcMuH?=
 =?iso-8859-1?Q?HoNYxwNiC+SObzYVqp/O//IywYYHg4rCgIjlMOKjkpgIMZtDcNU2ppAzjY?=
 =?iso-8859-1?Q?7tH2a2Kj5HhriugAXWKsD2/evw1FSZcw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dZm0bC+HSxZfbm1SBUja3aekG2jGStvR4Q/k7fPGW2HXXXpHTPiKORsYZ3?=
 =?iso-8859-1?Q?ECTXdMgWzwbeUB/pA3tBPIissy91BZwz6LMjF18bVlMq9iDM/KzJbz4ZA8?=
 =?iso-8859-1?Q?6wGKrcU6aWekgzGB+/RkoVUs2I+V9klKB1OXrgl+LS+zb8VpKdRW1QiLwz?=
 =?iso-8859-1?Q?7WUxrNmZ4vn9qackH2/W/Mb9+DsJBOb6mZ8Sa5oXvd9XEqvYSbyk2QxdAo?=
 =?iso-8859-1?Q?jnXqaT1OH0ExqI8aLYmbNP6BivD08yUTeW/cN6+SgAqM1WlgJKSV+yHn1p?=
 =?iso-8859-1?Q?EaOP9ju3VvsbUqpp8evdcxHyYJtXZu334ixrvGe7OkAhn+mIRfSI6y1byB?=
 =?iso-8859-1?Q?WOUKpmGngfSblHyUTz3B2+pz5Hcq0ChVd+G6LqAAy0RBDtZNvyFxZ0rgpk?=
 =?iso-8859-1?Q?jrTEmGrbVgImjx245cU+71rMU2VM1Bnm0p4aAh6GrgZzRGO29TKAGwdOb1?=
 =?iso-8859-1?Q?aSRhEnB96PaKKmO+SnfZHhsm+9vvWV1Wmt0NI/D0HaQ+om8bFTEEQQzZq/?=
 =?iso-8859-1?Q?D+jzj225rUANyAeg7w0yWQig3iaafzzXZrbrc8a+VCe6EcII1OgTZXjFgm?=
 =?iso-8859-1?Q?50wBmj3qH2PIwjIsqolnWMDuyP2QLsEz2+Pbrj7UEuCJMnaUpjJBYvW8be?=
 =?iso-8859-1?Q?KnbyEC8kVUxNlhJZJ0Xlba8ES3QZofBrRE5t2KuIag6gogxeQ7Uo1Y8+82?=
 =?iso-8859-1?Q?NbLm2ByFKOlu8kHq8qnUKJo9WdIb0ZVcQnp3kNTr6zutHzh40Inok10gJR?=
 =?iso-8859-1?Q?aEdEpUs2zR0/0KfDm44M9uYEhfE8DUeGkzi6KMFTJbDDTiPfdEGlJtZiZI?=
 =?iso-8859-1?Q?kahMb6miQ4VJ+IKqxZ/1Xzt46I3gGdX6ygHaDhN+4KswOYa2qvBqD16e5l?=
 =?iso-8859-1?Q?QPQncYomt+pE8wg8cUNGGilvul/Lmq8k1rc+Nk7YkXEvg1blfr4p3sJ3Cq?=
 =?iso-8859-1?Q?L8slN5Td1+9imlJPw4KGMHnivU6IXouswuez4+AtuqjDQYEOgI/g+mChoR?=
 =?iso-8859-1?Q?PJhwGuwDOFn9xgLJjv5Owirufl/VntWtZoWaGo0UEaZrbTKmkSIUpLg8dX?=
 =?iso-8859-1?Q?kT8NoVM7orBoi6e6UoiJCpmXA+Oh3lozgUPLNXqEBXzsGEEFMLoexYSu5X?=
 =?iso-8859-1?Q?k5xjXLO6tDNHw5+NmW3t06Ov3eOZ5TnbF3Exlzq99BlzJCgRc560MgHKs/?=
 =?iso-8859-1?Q?2S4CV4O7Typ/v5Ka9fLIPxjGtgW5F7XxtIc6IkrFS/tLgYBfijph5WYdpl?=
 =?iso-8859-1?Q?uEKSwd8ynYJi6w9/vJPIfHc8BIQRYPxMu+PU5cRekmZTR/CvU2k+8aTbUX?=
 =?iso-8859-1?Q?ienl38uQ+XHR5w/XPuFvoj9owpEnrFjTAccfejE3dIAeANjV5oG1PLhA7s?=
 =?iso-8859-1?Q?hUINedNOz45p/IEgXZ/FSvOvcLHzMveqn4NQOQT8zLYvslXF+O9QvkTT+q?=
 =?iso-8859-1?Q?eOLW2EQotCQWtdSAH8lyAjznZOpxJUwslNiisFb2jTT7Lxuf+/k5eHO8AX?=
 =?iso-8859-1?Q?grf7OlV+ClZO9gRZq8MW+1vzfN8vQrJyu/9iQ5t9fqA4/X/czHXTf/gXZf?=
 =?iso-8859-1?Q?/cjwZ6iPXuE7XldYT9j22SJNzYfG1oqeJ7ZcTeCawBvrcWDnX6eHpIIfOc?=
 =?iso-8859-1?Q?GPbb0MswbN0mX/FvKr24qxyxSWhbEoNflzcui2NVz9NaCtUIGs3GGt5A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b75fbdb9-9083-48ef-88af-08dcab33f0d6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 16:24:35.3365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3xh7SOV4+JEuPK/eRrbHMf1zh8tDJB4j5Uuyz00fwH7oYYXrxWK2QuEzF9/OWqqCD8PEWH9SByz1x+RusAewg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6782
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

On Tue, Jul 23, 2024 at 03:07:05PM +0200, Nirmoy Das wrote:
> 
> On 7/23/2024 2:22 PM, Michal Wajdeczko wrote:
> > 
> > On 23.07.2024 13:16, Nirmoy Das wrote:
> > > Add counters for TLB invalidation sent, receive requests which
> > > then could be query as sysfs files from userspace.
> > s/sysfs/debugfs ?
> 
> 
> I will fix it.
> 

I think this debugfs then I think we certainly need to hide this
implementation behind a Kconfig option as atomics have a non-zero
execution cost.

I'm thinking a generic DRM_XE_DEBUG_STATS or something.

Then also with that, build generic stats layer which other code calls
into and stats object which encapsulates all the stats.

Fine with only having TLB invalidations to start but having the
infrastructure to add more stats over time would be good.

Matt

> > 
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 37 +++++++++++++++------
> > >   drivers/gpu/drm/xe/xe_gt_types.h            |  4 +++
> > >   2 files changed, 30 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > index 481d83d07367..f84717c1aafa 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > > @@ -37,8 +37,11 @@ static long tlb_timeout_jiffies(struct xe_gt *gt)
> > >   }
> > >   static void
> > > -__invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> > > +__invalidation_fence_signal(struct xe_gt *gt,
> > > +			    struct xe_gt_tlb_invalidation_fence *fence,
> > > +			    bool failed)
> > >   {
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > >   	bool stack = test_bit(FENCE_STACK_BIT, &fence->base.flags);
> > >   	trace_xe_gt_tlb_invalidation_fence_signal(xe, fence);
> > > @@ -46,13 +49,19 @@ __invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_
> > >   	dma_fence_signal(&fence->base);
> > >   	if (!stack)
> > >   		dma_fence_put(&fence->base);
> > > +
> > > +	/* Only increment the counter when tlb inval is done successfully */
> > > +	if (!failed)
> > > +		atomic64_inc(&gt->tlb_invalidation.received_count);
> > >   }
> > >   static void
> > > -invalidation_fence_signal(struct xe_device *xe, struct xe_gt_tlb_invalidation_fence *fence)
> > > +invalidation_fence_signal(struct xe_gt *gt,
> > > +			  struct xe_gt_tlb_invalidation_fence *fence,
> > > +			  bool failed)
> > >   {
> > >   	list_del(&fence->link);
> > > -	__invalidation_fence_signal(xe, fence);
> > > +	__invalidation_fence_signal(gt, fence, failed);
> > >   }
> > >   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> > > @@ -76,7 +85,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> > >   			  fence->seqno, gt->tlb_invalidation.seqno_recv);
> > >   		fence->base.error = -ETIME;
> > > -		invalidation_fence_signal(xe, fence);
> > > +		invalidation_fence_signal(gt, fence, true);
> > >   	}
> > >   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
> > >   		queue_delayed_work(system_wq,
> > > @@ -102,6 +111,8 @@ int xe_gt_tlb_invalidation_init(struct xe_gt *gt)
> > >   	spin_lock_init(&gt->tlb_invalidation.lock);
> > >   	INIT_DELAYED_WORK(&gt->tlb_invalidation.fence_tdr,
> > >   			  xe_gt_tlb_fence_timeout);
> > > +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
> > > +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
> > >   	return 0;
> > >   }
> > > @@ -140,7 +151,9 @@ void xe_gt_tlb_invalidation_reset(struct xe_gt *gt)
> > >   	list_for_each_entry_safe(fence, next,
> > >   				 &gt->tlb_invalidation.pending_fences, link)
> > > -		invalidation_fence_signal(gt_to_xe(gt), fence);
> > > +		invalidation_fence_signal(gt, fence, false);
> > > +	atomic64_set(&gt->tlb_invalidation.sent_count, 0);
> > > +	atomic64_set(&gt->tlb_invalidation.received_count, 0);
> > hmm, any TLB invalidation timeouts/errors, which would make
> > received_count != sent_count, should trigger a GT reset, which in turn
> > will reset those counters, so under which condition you expect those two
> > stats being not equal?
> 
> We tolerate GGTT tlb inval timeouts without needed to do a GT reset,
> probably we shouldn't? If not then, I agree that we can have
> 
> a total sent counter  and another for inflight counter.
> 
> 
> > is it just during the waiting for some ack?
> > 
> > maybe better/cleaner option would be to track/display number of TLB
> > invalidation requests in flight ?
> 
> 
> Request from Sai was about having total tlb inval sent counter and I think
> inflight would be a bonus and should be useful for debugging.
> 
> 
> Regards,
> 
> Nirmoy
> 
> > 
> > >   	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> > >   	mutex_unlock(&gt->uc.guc.ct.lock);
> > >   }
> > > @@ -182,7 +195,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> > >   	action[1] = seqno;
> > >   	ret = xe_guc_ct_send_locked(&guc->ct, action, len,
> > >   				    G2H_LEN_DW_TLB_INVALIDATE, 1);
> > > -	if (!ret && fence) {
> > > +	if (!ret) {
> > >   		spin_lock_irq(&gt->tlb_invalidation.pending_lock);
> > >   		/*
> > >   		 * We haven't actually published the TLB fence as per
> > > @@ -191,7 +204,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> > >   		 * we can just go ahead and signal the fence here.
> > >   		 */
> > >   		if (tlb_invalidation_seqno_past(gt, seqno)) {
> > > -			__invalidation_fence_signal(xe, fence);
> > > +			__invalidation_fence_signal(gt, fence, false);
> > >   		} else {
> > >   			fence->invalidation_time = ktime_get();
> > >   			list_add_tail(&fence->link,
> > > @@ -203,14 +216,16 @@ static int send_tlb_invalidation(struct xe_guc *guc,
> > >   						   tlb_timeout_jiffies(gt));
> > >   		}
> > >   		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
> > > -	} else if (ret < 0 && fence) {
> > > -		__invalidation_fence_signal(xe, fence);
> > > +	} else if (ret < 0) {
> > > +		__invalidation_fence_signal(gt, fence, true);
> > >   	}
> > >   	if (!ret) {
> > >   		gt->tlb_invalidation.seqno = (gt->tlb_invalidation.seqno + 1) %
> > >   			TLB_INVALIDATION_SEQNO_MAX;
> > >   		if (!gt->tlb_invalidation.seqno)
> > >   			gt->tlb_invalidation.seqno = 1;
> > > +
> > > +		atomic64_inc(&gt->tlb_invalidation.sent_count);
> > >   	}
> > >   	mutex_unlock(&guc->ct.lock);
> > > @@ -321,7 +336,7 @@ int xe_gt_tlb_invalidation_range(struct xe_gt *gt,
> > >   	/* Execlists not supported */
> > >   	if (gt_to_xe(gt)->info.force_execlist) {
> > > -		__invalidation_fence_signal(xe, fence);
> > > +		__invalidation_fence_signal(gt, fence, true);
> > >   		return 0;
> > >   	}
> > > @@ -455,7 +470,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> > >   		if (!tlb_invalidation_seqno_past(gt, fence->seqno))
> > >   			break;
> > > -		invalidation_fence_signal(xe, fence);
> > > +		invalidation_fence_signal(gt, fence, false);
> > >   	}
> > >   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > > index ef68c4a92972..130d9f5cb5c2 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > > @@ -199,6 +199,10 @@ struct xe_gt {
> > >   		struct delayed_work fence_tdr;
> > >   		/** @tlb_invalidation.lock: protects TLB invalidation fences */
> > >   		spinlock_t lock;
> > > +		/** @tlb_invalidation.sent_count: counter for sent TLB inval requests */
> > > +		atomic64_t sent_count;
> > > +		/** @tlb_invalidation.received_count: counter for received TLB inval requestes */
> > > +		atomic64_t received_count;
> > >   	} tlb_invalidation;
> > >   	/**
