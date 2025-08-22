Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B9CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 19:30:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADC210EB8C;
	Fri, 22 Aug 2025 19:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQmATukP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABB710EB8C
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 19:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755891030; x=1787427030;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5j7vJOAnUlBVWBHaznIXH6KcbR8/lQlJRzl+7w7Vx6s=;
 b=lQmATukP9Q0iiwy59ctYHC7l3boEfqtXRvfcgo6+twVuhTQarWFmmurd
 //oov6ojlt6J4SDzvn/77DZr894/FwA96sL+PX0adMmvVAPNBg0Bbh14p
 NOi3I03cD75p/HHf0lRWxRNlp2HKvI9aGF8zALTaVTffuHZ8QLlxxz4ml
 5+fhoiQ/pDzAYztGzd5lw9+mF3GC15z3uGSFYxDWwDU1/dNVdEtu0GBbe
 3Y4MfC9+pfDdsPMO1ItYojw6j2xXTwcVRGVo5sQB0+4HlVRQ1/ae4Oa/K
 iLif7g2SuTHhf/5hU6mtIBxR8dTPvfY+PoTm6YEGqXK9nASUfIRmxUBWJ Q==;
X-CSE-ConnectionGUID: QfkC5uTlQseXIbKJ+Uj0tA==
X-CSE-MsgGUID: WyHwgyztQqG/qwFatbKGLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75660870"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="75660870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:30:30 -0700
X-CSE-ConnectionGUID: Dsli1jZwSBKrxbqG8PqtKA==
X-CSE-MsgGUID: bFT4MMIFSkeJxAiBhmfYVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168681196"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 12:30:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:30:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 12:30:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 12:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qi4BcmANqsJmJiAjmwOqJcZnU9sVRaUC1R3thIzpSO1qZgh0/tF1F+Tv6gE8qCpBwSeMrZKafCEeaNY4TDj0qqMkhjGWcVRxNbh4nRgC5hCiYcOhFnkTEt7BkcQ2rwiQzuMxzCuwTvC/q3irDcUIXMUBm+AUrM9p6AbbaBc7gEx42Nka7edqTec/X0OHOxxmQi0QGzgQAg5wZerjvyFVp7JzR9rKqNkYXjwC4Mxa3Nl/D3NrHtA5egAxJxvRQimc7IOM/ajQTIY1FSVe6wI7H7waABYc9oepy8Q4qDg6MtYQw0lqAuPLNCJfxecDSqozt9SRYZwTyd3VkOurpoRi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j7vJOAnUlBVWBHaznIXH6KcbR8/lQlJRzl+7w7Vx6s=;
 b=UBf4Qmgn/hAF1v1ukMBy0K/nSuqqpKvwPG7w8MRke8U9gyw/X4EQRIcPHMbRCpAvboE5B229HVzWy3NIaBf38/ZyJABff4tVWhxn7sGoN0fCQNA6Z0FmL3J5MvyDcpl+22fUUWLXco+C9Alxeq9z73Y+eY0j0IdOyP6HmkJwq+8+Wi9ATqqLOUWO5t0e6ya5aoSBjwxLEG0wmUxDKurZZCXOJFulOX5Q9HVAagUoR0PQ3eJ2Zd+H4P6ATRQ5YLI+7JJsxK0sq9/3X2bjQ2rfs84ZOAyM7J2LKOU6RdDVI0OSOLPIFkeaj5HhFgpNWaK48DkKNqSXYS8nPuYVUk5Nyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 19:30:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 19:30:21 +0000
Date: Fri, 22 Aug 2025 14:30:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Sebinraj, S" <s.sebinraj@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH v2] drm/xe: GPU frequency tracing support
Message-ID: <ikui4bvcsit4tigoywf5xfjimgh2sxbceqe5dqayyaqzfgpsgg@pza2islxnte4>
References: <20250811083414.3863103-1-s.sebinraj@intel.com>
 <i6iszloxcdb2olq5hspkzjefimracmqoawpu7t5gwlehgnyudv@usbccibofr7v>
 <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5427BE3DA4B3078A7514BCB79833A@CH0PR11MB5427.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR20CA0002.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b53f54-f43e-466c-81c7-08dde1b25596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DSqGgyJ8VUHfPe7NocEO31RynyDphIRNV4hCkQYsAKYHoh/g70HLI5YLLm/c?=
 =?us-ascii?Q?wchEb7NnbM8uv7pmehj+fMNsX49+34W0/TgLV66x/WtMz/VfeuROLql8fM5q?=
 =?us-ascii?Q?/M0wZsyL9X4d5/QYGoUHev8Oomv5Hkc3fbJM0g53zdtKfmYZIKi2GGQZoUg+?=
 =?us-ascii?Q?vcFXfIpL571r3OZ96KZlNCD9EtjTRVyANbKTVZi7UL3LEIjhGmk26r0wlULn?=
 =?us-ascii?Q?5IZk8DGWWcIUHakf/Bamx0OhcrV15DJEiuZqzdpdf/lK3JWweytXq4dZIkXr?=
 =?us-ascii?Q?/6uE6wLGri0tL2rVB9A98uwWKoBL5VAzQ1JBiC8msobniCQJ/xMm7n/4tD/9?=
 =?us-ascii?Q?ST8rANNS75TYafxWx75JtUEiCMQza8/lT9fPfhRbmAy6XBYkj4hMp9phmd7J?=
 =?us-ascii?Q?hJeZFFDboBsjyPKIxLaEe9E+H1fTfsBML8c6W37J+gm4AktDng+qd7y/Z//i?=
 =?us-ascii?Q?ERNXSZQsaHjECzYAVY5YyqBCknVGUshS7Mu02Mzp9+QpkoHrucfAqsi8IXwM?=
 =?us-ascii?Q?q7RdI/lWOwmRjMH3F9pYi9gpnxem8ecmwGpvjQo/LGLFoJj1qiOaTYXI97qs?=
 =?us-ascii?Q?JrMJGbygjE8396zpI+Gh9AzcxVh8iFV7LlEeDm5QgV67meaaTiXOZYF2/lf0?=
 =?us-ascii?Q?eVzs0Zd+vy3hRNRGV43NfyYYUH7k3HTULAJ6McholXcqu3fzGm+cr3KEvi/N?=
 =?us-ascii?Q?gi1fr30/mna9xOno+A6fg+y6JJAm/5tMJzxoWHnVE+ajnZgVA9+fIPsC+6eg?=
 =?us-ascii?Q?Z32IZRS/ZWuoEcBrIotPiZmiyTISZVhLtWtYyIy9Z4PzyU9IxqmX2ilh37lN?=
 =?us-ascii?Q?QYibwi0MRysGC4YVGtNXUSjcUr9+jWoCQX6JPmIn5MoXmCiDEdBQh06Uu2n+?=
 =?us-ascii?Q?Ef/A3YT8GJer17iHFXWEqgjEj1bsvw0mHHD+f6YWs2fPiDAXXumjuoBuKqrm?=
 =?us-ascii?Q?JJKtVMCeFXTB2c6CIZ9S5AzC+JmcMQ0m0I0ra7xPghwvl/lx9BcUzznO3Mgj?=
 =?us-ascii?Q?60YC9C1q4wcNsyw8ZtgrGLSZb+0+eZZGZ8lTvirEpTtToI7RK0WKUGikQglO?=
 =?us-ascii?Q?AMz/cwknCWgIUR3zbvwaQyoGVjVLwcm30UWrafotXDnPhuYwoYfqOmZJX8w5?=
 =?us-ascii?Q?X99eAysDZxPDF5+KhYQROzodLGn3KR+u6vIW084ig4Bz6w3kE/rYRxoy46PK?=
 =?us-ascii?Q?fQPJJj7/MGfQRc2AWrE/VGpsv66zPsD5d0PqpnEfkoiXiNbA6YQVTpuRQbeg?=
 =?us-ascii?Q?mTg1uFBbXlSWowlx/+MbnOtijHoFkIw5Rw2dpsaRP6DZcYLz8i628FvgGEKS?=
 =?us-ascii?Q?umYnWbuu/Bz/VeFUeIUPK9LC64pqd62CWXYgk6qq+WR5OeybOsQO3lZ7dY/R?=
 =?us-ascii?Q?SG1q25o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jeoyusSwp7Sy+/oucm8bGELqbAbqwbvgVh0ZN7D7gi4615VOwLBDU+c778qS?=
 =?us-ascii?Q?u/eKZCSxsWQDVCbOqteQg6pz9nPotcDsN0biGNEC8jbqIBvQWIvksDmroikR?=
 =?us-ascii?Q?XalF/t8SG9A05Gwwlp7Pw9Tpg3cjCtjOTf9nDcQDVjmoqCZfE4wXPl4LfpeT?=
 =?us-ascii?Q?Qwb9LYZfdv9+D83RdfvdBHepVoWf2X0UBO8kc5Ovr5ABpqo6tEOjotHTrYvN?=
 =?us-ascii?Q?7oduKQtQ5HD3IptYDBUutiA+eCAZ5tkYjII+Fg1is4CBrW/GWGJjqn68ybRE?=
 =?us-ascii?Q?HiFfRuX5cGrNf8bhSrBWawSERD+TUh/wmWsPAeZkvtl4WOTduM7AVAMKGqxo?=
 =?us-ascii?Q?Ud0t9drD8bGj4suwP2TrT4qJz+sdGhfb3lxv0V4FljpEtHS6F/JBBtCzPh31?=
 =?us-ascii?Q?CST9+tuQ15ZdnMuaLeTswky3HDcmScpb3tlFQoejoyW0b4Zxds+mAXzNrWkk?=
 =?us-ascii?Q?BDqjeiNgMHwtMc/fkvSKROjWFEj7+MCQME3leDE1tT4YDNL+jLpKpC8Z2u8H?=
 =?us-ascii?Q?NKc4IHn7jYyXvx7K7evz0Y1rjYLrekgI7Wn7NANRAVsNwXhGTI91xZlfuS4P?=
 =?us-ascii?Q?g7UW/H56itJb7xnPC7E0Yc8FmCcs8abaWaJLd8IzB9ud0Cwn7is/gxkT8bjO?=
 =?us-ascii?Q?bFsKD25mqIiUNpxcKn4vUbKadxxoudm/iqqHTqyRPRqYe19/9sXOGOHhYqUs?=
 =?us-ascii?Q?/kP1iwuQM6KGqe7xwISNb5dggzJgCTJ1aG0xlE5wUL0oOzLYOZqV4jVKylLT?=
 =?us-ascii?Q?3JmSXUTnSGK0GB+emLJVAgDddNbUmgwBFmXowoEaWcWyyjViiKN+VxOc5NSx?=
 =?us-ascii?Q?oJUWINos4maIAMfVLGn+AfL5nezsXEw/mFtlzboz/psrXxH/Mmgr6HWVXqDC?=
 =?us-ascii?Q?zyGGS4Kv1atXtdceDG2XbktA11riyHZVtH2VpMR+ZPMcBk0q92lcdhMBNrHs?=
 =?us-ascii?Q?tgPEcawdwb1ziuc8pVsCsgIj9hHqqkNe6hhOsdVrdhnNGpg4+3B8fquOQ90C?=
 =?us-ascii?Q?6a4Ka+YLaKWBMZSw95q8LNVrmwQBNlg22SjwJxaKiMAfNeC9W7KxS3t8RgFW?=
 =?us-ascii?Q?Xog0RREQn0Y1uXpDN6zPkwhGKFH9CFaJyzMZfsblDubejWMi2ZAIQ9ppFNvG?=
 =?us-ascii?Q?YyC8yMrFHBATbImGUxwS/m7t41fVISu3MFO4l3DM1kxwnJlNoXVT05Nfx4En?=
 =?us-ascii?Q?n/cJfkZO+x5yPUGhkTvST47PON3Emo6uaXNWBCwDIZC5zqJ+aioYG4G7l9ZI?=
 =?us-ascii?Q?cUbeFbYFcU351P0CI73HXKzZGXkaBxSPlEmiWV2WaARpcm/N8yfBKNVsO7p4?=
 =?us-ascii?Q?yrL97/dPbh5eLTWJsrVYNghAjd3ydZgPCfDy1/FGoapG/a2T+YhE1gxcXzEq?=
 =?us-ascii?Q?zN43YcZnn7hFNZjEe5v77nSdAAQTDJcA9fuRslO+jWPjPFsuHxlxvOPJYpqQ?=
 =?us-ascii?Q?XiMfKvd77PD3BYiQoQQCW5OzpB4VmABJKKYvkb4YXRQSId+2q+/m3nyayz5U?=
 =?us-ascii?Q?5lhSLzxbkF0bPG3HIg9vnjI1Gppt9NIsytgITB4xyV6K6TGYBEEGAQXxDniw?=
 =?us-ascii?Q?5Ye1HMxdYFKxua+xyrR0tdwXAqQ3QxRmrj2NmQCxSCoEMMlJWSNvCfyi57aR?=
 =?us-ascii?Q?OA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b53f54-f43e-466c-81c7-08dde1b25596
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 19:30:21.5375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTvm84KA5VAHkLLUvz5U8Ax8ef4YAdxnFyXNAuDxhIq358ugu9mCHpeLQXp7Hc4uXYbfqU4r1RmU6HpsWZUKPTzdD7vdsojA+DXjLn+i6Jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
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

On Wed, Aug 20, 2025 at 04:25:43AM +0000, Sebinraj, S wrote:
>We went for this addition rather than the one in xe_pmu (via perf stat - user space tool),
>as we have a requirement to have the trace point available at d/evens/power/gpu_frequency for Android xTS.

sorry, but that's not a good justification. We should add code that
makes sense overall and can be used by *any* downstream. What am I going
to say when another downstream distro request the frequency to be
exported as xyz/events/power/gpu_frequency or with a different
signature or with a different sampling requirement.

The interface is not even generic enough to be useful elsewhere.

>In this case the user won't be triggering the perf subsystem for gpu frequency for gt0, gt1.. even if we add the trace points in xe_pmu.
>Other comments from Mathew have been addressed in the next revision https://patchwork.freedesktop.org/series/152701/#rev3

I don't think they really matter much. Until we figure out how to
fulfill the android requirement without poluting the codebase like you
are doing, we can't merge this. Sorry, but we can't maintain a
perf-subsystem-inside-xe for that.

Lucas De Marchi
