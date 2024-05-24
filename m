Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEBCC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 19:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA0310EA92;
	Fri, 24 May 2024 19:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aWPaKXEz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2E710EA1B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 May 2024 19:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716579862; x=1748115862;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p+ERa8EvzlG5FG80qIQkqxOc6ucg6eBIEDsvqukvjo4=;
 b=aWPaKXEzwyIn+udLZixYb0SkJbrUcSL+63/aWJzB6IX2+RSVEVmfP49v
 Hzr1Uf8gjWx88hFwZERthJnWAOo3YSDQCgj5c1qBtCPVbmMI4WIyU79DP
 fZ3YLVhx1A86uYIG4l+vK42sYPwM0ijNa+TWEKPgWLG4sYiNK2hd+X1Z+
 5KGtb3idLuQYzPrFgQC7SEVFDdVh4kT7z9/2v/7F1jA0FXaFvTpBlrOOn
 TTpeWY5Qd1aGGXSjGv93yaTaxXNSbH0vswW6MkbxhPyJ2r7OuFjeZHUae
 VxZ+x+s7dGPL2PE6tuhDVypbLi1QnWgA/xnd2gqFqR+E3rsvrtoVlmQwK w==;
X-CSE-ConnectionGUID: J1Eh2aPxT1qskX5zJXeQ6A==
X-CSE-MsgGUID: gJTiI1fkRiiqVKZ4W+YwTg==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="35490196"
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="35490196"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 12:44:22 -0700
X-CSE-ConnectionGUID: FbrICTfmQiOHa00PVBRISw==
X-CSE-MsgGUID: FHrNj4D0T5u8pgESgS890w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,186,1712646000"; d="scan'208";a="38549505"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 May 2024 12:44:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 24 May 2024 12:44:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 24 May 2024 12:44:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 24 May 2024 12:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWsSKixiYBr13/51073PDnMRv0du0KUfQiaVC3ZOQ4sJflvdhQnWhhAAx3q0KP7s+yshwgD9VIB3yqBnjJxzOMSjEgAbEbrJr8m5v5/pNDMFJkBwJk255EFvV7DNdbHQGF0Tnc6xBiS9foCeib3jtJgBO2vBrrp+kAQ1IaB1axRRPFI5pntyzrBXsevPcTuEyq9dxQp1BdyddgTdhdcIDRhBoFIE3wCLALXEaGfSHJevzRAG0TzOYG5pSTASzkcoFBxK+dL63swrgboOcymr6D3hVk+C3gscU+U6JaUQN6ALFxZFB1CRBz8LbeEXLfysBjrDu72lu2SJawNvEcDKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA7/lkRU/nNAMPIIqo0iax+7NHSaGaODH2byo4FBHUY=;
 b=lyMFIRpsvccPgLPS4RGChV4KMiEaAcXRpzaBNLthx428dfRTgBK5HaQNGvOahLTteUtOm+bSsMPMNSmOYReVpxEYbBoCJTdSgd8Sot118/94VkWANRGVir42zonKxr39HYNP5vTPVOMC7V8n9SGbEnYrZHGApb0GvmSttDVNC0FzdZaqmZzUrGxWdF71CyyVl32Atxtdri36qfxbFZaIzBk7KdQjoXgP9KimMFANuftL9eIcH3UmmcoBzSCMaHA0ddRn2nBWyVr63JL2Mm+tEpluWqWLvYKHBDbl7S8jTm6E4tQ1Tf9bVJyIr1K5upQQJmUcKotzL0Gdserw8qyFeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 19:44:18 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 19:44:18 +0000
Date: Fri, 24 May 2024 15:44:14 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe: Decouple job seqno and lrc seqno
Message-ID: <ZlDuDuNDLvrOi8KJ@intel.com>
References: <20240524071940.83042-1-thomas.hellstrom@linux.intel.com>
 <20240524071940.83042-2-thomas.hellstrom@linux.intel.com>
 <ZlCHal90bzN_jp55@intel.com>
 <dee8dc60b0fc6954d38801b4fc1ef215a0ba933b.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dee8dc60b0fc6954d38801b4fc1ef215a0ba933b.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH8PR11MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f80d27f-a2fa-4231-ef75-08dc7c29e652
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?8PWG/Wt4er+4dtJxcsZ/8OZLO0+DgX2rYsVOoS96PxXhx+3Yb6tK02fMqm?=
 =?iso-8859-1?Q?Udvu5Oz6ktuqRStt7uvZo2x0B3Jfxwl52SYRMlbB9pP95k1Sp1SYiI2ytX?=
 =?iso-8859-1?Q?CvLark4gQYhzl9SSbjSCvthh3Z7FkD2rA3eMWGgqEyXqllAUDj+jMT/gsm?=
 =?iso-8859-1?Q?WV+fYhEk96MNVR8yF61oiv7b0S+6zJt42FlouL9HVNt6/sqL9TRPlLugFa?=
 =?iso-8859-1?Q?MDn21sCkuUeO67DzZAqo+mHjToiDY4agIwx4DvlY/yByz18rlnaXtJ35Ug?=
 =?iso-8859-1?Q?Ccw5Q9AIsB032cpJHtabDVJ8pj7dFNlesLYgjP04uY+GN+A9SlYkRbmHU5?=
 =?iso-8859-1?Q?c6OLoSlwZl9mQWj/lJq00UldIFjvI6OzOkTa3lp/IHPSK8x/i2Kxu6xM3h?=
 =?iso-8859-1?Q?BM/Xez9Tu52fTz+x3I9rUT7/QIjGFa03aT0OHElvE2p+RN9bzskSXcNAoW?=
 =?iso-8859-1?Q?TannllnbI0gOPmRQDJi0J1wGzperxueEvf8LqxbdpyRQpQf9bVyWt5cU10?=
 =?iso-8859-1?Q?Xj44Zkc99t4lxPHSRuMgm2z7aIVaT6l+ulQdz0bCdQ+BLag+IsMuFdBbVJ?=
 =?iso-8859-1?Q?tQHjhZS0mgedDnjRz4fcLp6Ht1ul2KkhH8eMPyXt0K6UwL/AmevCm1hUxw?=
 =?iso-8859-1?Q?roakjTiIqW/0L2PupEOPRKCoiUyYv1yNd9foAbYF7FaQeyCBz28gfEbPz3?=
 =?iso-8859-1?Q?KYcCXlPnlwIeBjfm9hpR3NsE9n8gkjTqj+6E+c/SR8qTcrxjSWNd17Q4YM?=
 =?iso-8859-1?Q?Z9JlZdY/l8bvkFAbLTY6DcL+kAbl6vIqBJjrHzDvAMtPrGGQJdy/czLFFH?=
 =?iso-8859-1?Q?pgDka/I/ssDSocM5iXiyOB4+7sOE7bkQxPaZ5xiZRboi68mG0mrDBI+y1E?=
 =?iso-8859-1?Q?rux+W8NFtG5efx+P9upVTDYCfWQevEOx5nyKXP3xILGDUNpeH0XRzNRmj3?=
 =?iso-8859-1?Q?h2st4YFFF6Ofg8HOCChTyz6GF64j5yvwBvJ8b9LkoFY/ddZeEROgLCY1R9?=
 =?iso-8859-1?Q?0ZKjGGYW6nJjLsehEdkpbUOdDC5JCgKujgPJ6DvayhnfDobtJzdI3+LtMw?=
 =?iso-8859-1?Q?jDQU4aVIY6gNyRZAoXmAo75qhtFXOkKuKZuO2SPvCnaZmHhCgbJaigD/9o?=
 =?iso-8859-1?Q?+ddDUXD8zqoX/HFNTT2WagDMjUEPAbsFm6peiYN4RetjEIg6wR9tIT0hmb?=
 =?iso-8859-1?Q?6uBWO0kuhaWAsFQGCoIVq6bscZVK2dV3TI4+O4VVbKO2Ff85K8GuZULEV8?=
 =?iso-8859-1?Q?+vwOXNEaiauV5pqYlGqERjD2aRFsED5rLu30RrVs4ut6uJAxON3YfkUowu?=
 =?iso-8859-1?Q?BruxoBKEy7H+k4gi8/7hf3A/dA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0cDNNhWMFcinf4IHKDnkaSWtzC8c9dbFhI7nt29yE6Mue+zTnwfGAsBiuZ?=
 =?iso-8859-1?Q?4UxoN0RuCGCHQ6bZUU/hMrznIzU6Z4aEr3RacjaAAIMRC33hl3hFQVP0i2?=
 =?iso-8859-1?Q?fRjGRlY8eBLMxYYkBKbrHLy7JUzhT0myFOAIi8AxsRdVpKDeZz7voieN9J?=
 =?iso-8859-1?Q?urXIgLUi2ilUf12bVsd9O4kAp06Cd9cxwOHKYE1GEFGoOl2nzpiYDe872B?=
 =?iso-8859-1?Q?2YU65CALzT5/dql6zZ2Wg/mdhhO3tZMn60MD7tq8DFuHTdoNZw4NTzf6wc?=
 =?iso-8859-1?Q?8DwQ/d2CjkzB2SDkO0aojNGEBtCUxMXYn1SajUfwBe08XJHK2v8C1+RlDf?=
 =?iso-8859-1?Q?S35o0lCE3OH/2a3uwXDOgrKMaLU+zCyBSBgh3ehbwPGZpaYKTT3HLgXmOx?=
 =?iso-8859-1?Q?81kUL1cWzykjUYF1FEggbnZzkP+v5ScWbi5HrfwOr86yCEQYmgxxTxL5jT?=
 =?iso-8859-1?Q?44oMUoYkr86JtkQ/AsR71W/XJyLYi7/g08+UzO7ATWqa4VxRfv5WV/MEAq?=
 =?iso-8859-1?Q?mp0ll3xECkxfw0/1+JeAxh5ZEaUMiLjjlLqiUv+FxtiU8vmr/w27LnYfhD?=
 =?iso-8859-1?Q?ySVn61ECte5pqa4xjsmeuLbF9sFHjXTibHqG2rdDx8zvp6ELpvNWPffFw/?=
 =?iso-8859-1?Q?uH/mA2q0wzhYF/WWAJsnD2i0lS9OHbu6u7tPHBt46JvJZS7fYtLXO1cvDj?=
 =?iso-8859-1?Q?3Abc4Z89qDgHW9UP0C1LmFqhqTm7hMpeY8HuOnuZGqJuGntgLSsOdXMlTW?=
 =?iso-8859-1?Q?3F5S1Wa06jZy86So/XMo2puxxl4vcLwhoQtB7DSljva3l/Xrv0zc4RdMLA?=
 =?iso-8859-1?Q?h+WHzmzJX6lpIvlNkNHhPjUIgCNAa6xRCG061IW4t6yL6jED8sstmQK3s2?=
 =?iso-8859-1?Q?H0T4f+xAA1JmYIao9CNLbrXCKWS1P8o//OWp1oMMzuZ9jzZCT2ZxF3d7QJ?=
 =?iso-8859-1?Q?S9vSt1bnJ2SOpUr0/O9ifbHJuUZR07PbDWRjx3wyKt9hPCD4DbodBh+zmG?=
 =?iso-8859-1?Q?OK0aS3vASPsfgFdqLwKWGnkjYCQMaflFUUXqWpxRZBAvh9C+50Xr2rJ0WW?=
 =?iso-8859-1?Q?2TsuB+X1cTKMglArz7n0g8ZDGEreB0Dj6ypXOhDfQo+0LuzWD+o7ZX67b3?=
 =?iso-8859-1?Q?lei6++zevtLlQlqOHuL4Mvyo6acmOSnIl2rOqR05dgl/pVeTo8HxnnfRFZ?=
 =?iso-8859-1?Q?67LDDP/1JOBolvBFX3yWs+8Tzn2V0j5OiAsIx9mxDMvKLydGLSxbJhvtQC?=
 =?iso-8859-1?Q?dG59irz+pT3dpXy88G4I4HxpxkxWaR9huUJy2hZ4pjGYxlumNSG+FHsamM?=
 =?iso-8859-1?Q?SqXqYQdKQ63Uhq19ghoZRGRo4sCGAn2k1GsOwNFAwZ8pqaTE59c9xvPvLS?=
 =?iso-8859-1?Q?NGMtC0E7eqqhBkzXPiPFGz5iP97w3x6deLcNRRROaUhHRce+GpBVq5vW0Z?=
 =?iso-8859-1?Q?v5/dLCRIJF2JhayRhcqOowLalSY7Tm7CGOwmtqpH/Jj+yX61H/QLlQGy4J?=
 =?iso-8859-1?Q?jknF03bF7kJlAtWGlvgRSppuZYrVMDVxJCcBmAzkordrvjnLpvUldKubSn?=
 =?iso-8859-1?Q?mLcwMEK4kRpmlrHNRoyq5z7AGyON7bD8yYUuhKyopcxE5akbzqrlmS0f6U?=
 =?iso-8859-1?Q?d5IoafISlekKL69e6cYNIEyiOkQmYGmwqg9n/tYF0yO1jWWlkk4Z1lkA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f80d27f-a2fa-4231-ef75-08dc7c29e652
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 19:44:18.1247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7PHdBCl+VnJK2HYYTaSrE/piz5jRBBaqYIL7aZQSYmfcesBdnpxQrWcKVv1w2H+r1jlPtcxpmIxyst4wwNzE6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

On Fri, May 24, 2024 at 02:56:51PM +0200, Thomas Hellström wrote:
> Hi, Rodrigo,
> 
> Thanks for reviewing,
> 
> On Fri, 2024-05-24 at 08:26 -0400, Rodrigo Vivi wrote:
> > On Fri, May 24, 2024 at 09:19:36AM +0200, Thomas Hellström wrote:
> > > From: Matthew Brost <matthew.brost@intel.com>
> > > 
> > > Tightly coupling these seqno presents problems if alternative
> > > fences for
> > > jobs are used. Decouple these for correctness.
> > > 
> > > v2:
> > > - Slightly reword commit message (Thomas)
> > > - Make sure the lrc fence ops are used in comparison (Thomas)
> > > - Assume seqno is unsigned rather than signed in format string
> > > (Thomas)
> > > 
> > > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec_queue.c      |  2 +-
> > >  drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +++--
> > >  drivers/gpu/drm/xe/xe_ring_ops.c        | 12 ++++++------
> > >  drivers/gpu/drm/xe/xe_sched_job.c       | 16 ++++++++--------
> > >  drivers/gpu/drm/xe/xe_sched_job.h       |  5 +++++
> > >  drivers/gpu/drm/xe/xe_sched_job_types.h |  2 ++
> > >  drivers/gpu/drm/xe/xe_trace.h           |  7 +++++--
> > >  7 files changed, 30 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > index 0fd61fb4d104..e8bf250f5b6a 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > @@ -98,7 +98,7 @@ static struct xe_exec_queue
> > > *__xe_exec_queue_alloc(struct xe_device *xe,
> > >  
> > >  	if (xe_exec_queue_is_parallel(q)) {
> > >  		q->parallel.composite_fence_ctx =
> > > dma_fence_context_alloc(1);
> > > -		q->parallel.composite_fence_seqno =
> > > XE_FENCE_INITIAL_SEQNO;
> > > +		q->parallel.composite_fence_seqno = 0;
> > 
> > Why do you change this case to 0 instead of the -127?
> > Shouldn't it be a separate patch since it is not directly the new
> > lrc_seqno
> > that this patch is introducing? 
> 
> This change was done by Matthew, but I think the intention was to
> explicitly separate the composite fence seqno and the lrc fence seqno
> to ensure they are different and we'd see any remaining fallouts
> because of that.
> 
> 
> > 
> > >  	}
> > >  
> > >  	return q;
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 54778189cfd5..53ab98c5ef5e 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -940,8 +940,9 @@ guc_exec_queue_timedout_job(struct
> > > drm_sched_job *drm_job)
> > >  		return DRM_GPU_SCHED_STAT_NOMINAL;
> > >  	}
> > >  
> > > -	drm_notice(&xe->drm, "Timedout job: seqno=%u, guc_id=%d,
> > > flags=0x%lx",
> > > -		   xe_sched_job_seqno(job), q->guc->id, q->flags);
> > > +	drm_notice(&xe->drm, "Timedout job: seqno=%u,
> > > lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> > > +		   xe_sched_job_seqno(job),
> > > xe_sched_job_lrc_seqno(job),
> > > +		   q->guc->id, q->flags);
> > >  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_KERNEL,
> > >  		   "Kernel-submitted job timed out\n");
> > >  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM &&
> > > !exec_queue_killed(q),
> > > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > index a3ca718456f6..2705d1f9d572 100644
> > > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > > @@ -398,7 +398,7 @@ static void emit_job_gen12_gsc(struct
> > > xe_sched_job *job)
> > >  
> > >  	__emit_job_gen12_simple(job, job->q->lrc,
> > >  				job->batch_addr[0],
> > > -				xe_sched_job_seqno(job));
> > > +				xe_sched_job_lrc_seqno(job));
> > 
> > Looking at this I got a bit confused now.
> > If you are emitting the job, why you are using the lrc seqno and not
> > the job seqno?
> > I mean, the other seqno that remains looks like a fence_seqno and not
> > a job_seqno,
> > right? In this case wouldn't it be better if we could rename the
> > other one to make
> > it more clear the split so the next developer changes the seqnos
> > don't get confused
> > in which to use when/where?
> 
> You mean like xe_sched_job_seqno() and xe_sched_composite_seqno()?

hmmm... I hadn't thought about that, but seems better indeed.
keep this lrc as the job_seqno, and the other one as the composite_seqno.

but it can also be this patch as is and then, an extra patch on top with
s/xe_sched_job_seqno/xe_sched_job_composite_seqno
and also rename everywhere else from seqno to composite seqno.

> I'll let Matt comment on that, but it's only parallel jobs that have
> composite seqnos.

or perhaps parallel_seqno then?! so we don't even have a doubt on when
to look to this one or to the other one?

But up you you, you got the point.

And thanks for all the explanations. Feel free to use

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

with or without the changes in the name.

> 
> > 
> > >  }
> > >  
> > >  static void emit_job_gen12_copy(struct xe_sched_job *job)
> > > @@ -407,14 +407,14 @@ static void emit_job_gen12_copy(struct
> > > xe_sched_job *job)
> > >  
> > >  	if (xe_sched_job_is_migration(job->q)) {
> > >  		emit_migration_job_gen12(job, job->q->lrc,
> > > -					 xe_sched_job_seqno(job));
> > > +					
> > > xe_sched_job_lrc_seqno(job));
> > >  		return;
> > >  	}
> > >  
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_simple(job, job->q->lrc + i,
> > > -				        job->batch_addr[i],
> > > -				        xe_sched_job_seqno(job));
> > > +					job->batch_addr[i],
> > > +					xe_sched_job_lrc_seqno(job
> > > ));
> > >  }
> > >  
> > >  static void emit_job_gen12_video(struct xe_sched_job *job)
> > > @@ -425,7 +425,7 @@ static void emit_job_gen12_video(struct
> > > xe_sched_job *job)
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_video(job, job->q->lrc + i,
> > >  				       job->batch_addr[i],
> > > -				       xe_sched_job_seqno(job));
> > > +				      
> > > xe_sched_job_lrc_seqno(job));
> > >  }
> > >  
> > >  static void emit_job_gen12_render_compute(struct xe_sched_job
> > > *job)
> > > @@ -435,7 +435,7 @@ static void
> > > emit_job_gen12_render_compute(struct xe_sched_job *job)
> > >  	for (i = 0; i < job->q->width; ++i)
> > >  		__emit_job_gen12_render_compute(job, job->q->lrc +
> > > i,
> > >  						job-
> > > >batch_addr[i],
> > > -
> > > 						xe_sched_job_seqno(job));
> > > +						xe_sched_job_lrc_s
> > > eqno(job));
> > >  }
> > >  
> > >  static const struct xe_ring_ops ring_ops_gen12_gsc = {
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
> > > b/drivers/gpu/drm/xe/xe_sched_job.c
> > > index a4e030f5e019..874450be327e 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job.c
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job.c
> > > @@ -117,6 +117,7 @@ struct xe_sched_job *xe_sched_job_create(struct
> > > xe_exec_queue *q,
> > >  			err = PTR_ERR(job->fence);
> > >  			goto err_sched_job;
> > >  		}
> > > +		job->lrc_seqno = job->fence->seqno;
> > >  	} else {
> > >  		struct dma_fence_array *cf;
> > >  
> > > @@ -132,6 +133,8 @@ struct xe_sched_job *xe_sched_job_create(struct
> > > xe_exec_queue *q,
> > >  				err = PTR_ERR(fences[j]);
> > >  				goto err_fences;
> > >  			}
> > > +			if (!j)
> > > +				job->lrc_seqno = fences[0]->seqno;
> > 
> > why the lrc_seqno is = the first fence seqno?
> 
> In a parallell job, all LRC fences have the same seqno so we can
> grab any.
> 
> > 
> > >  		}
> > >  
> > >  		cf = dma_fence_array_create(q->width, fences,
> > > @@ -144,10 +147,6 @@ struct xe_sched_job
> > > *xe_sched_job_create(struct xe_exec_queue *q,
> > >  			goto err_fences;
> > >  		}
> > >  
> > > -		/* Sanity check */
> > > -		for (j = 0; j < q->width; ++j)
> > > -			xe_assert(job_to_xe(job), cf->base.seqno
> > > == fences[j]->seqno);
> > > -
> > >  		job->fence = &cf->base;
> > >  	}
> > >  
> > > @@ -229,9 +228,9 @@ bool xe_sched_job_started(struct xe_sched_job
> > > *job)
> > >  {
> > >  	struct xe_lrc *lrc = job->q->lrc;
> > >  
> > > -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> > > +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > >  				     xe_lrc_start_seqno(lrc),
> > > -				     job->fence->ops);
> > > +				     dma_fence_array_first(job-
> > > >fence)->ops);
> > >  }
> > >  
> > >  bool xe_sched_job_completed(struct xe_sched_job *job)
> > > @@ -243,8 +242,9 @@ bool xe_sched_job_completed(struct xe_sched_job
> > > *job)
> > >  	 * parallel handshake is done.
> > >  	 */
> > >  
> > > -	return !__dma_fence_is_later(xe_sched_job_seqno(job),
> > > xe_lrc_seqno(lrc),
> > > -				     job->fence->ops);
> > > +	return !__dma_fence_is_later(xe_sched_job_lrc_seqno(job),
> > > +				     xe_lrc_seqno(lrc),
> > > +				     dma_fence_array_first(job-
> > > >fence)->ops);
> > 
> > the s/job->fence->ops/dma_fence_array_first(job->fence)->ops
> > looks like a good canditate for a separate patch, no?!
> 
> Since we're now explicitly using the LRC seqno for comparison here, we
> need to also get at the lrc fence ops, which is the ops of one of the
> contained fences. (If (job->fence) is not a dma_fence_array, the
> function just returns (job->fence)).
> 
> So in all, since we change the first argument to __dma_fence_is_later,
> it makes sense to also change the third to align.
> 
> Thanks,
> Thomas
> 
> 
> 
> > 
> > >  }
> > >  
> > >  void xe_sched_job_arm(struct xe_sched_job *job)
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job.h
> > > b/drivers/gpu/drm/xe/xe_sched_job.h
> > > index c75018f4660d..002c3b5c0a5c 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job.h
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job.h
> > > @@ -73,6 +73,11 @@ static inline u32 xe_sched_job_seqno(struct
> > > xe_sched_job *job)
> > >  	return job->fence->seqno;
> > >  }
> > >  
> > > +static inline u32 xe_sched_job_lrc_seqno(struct xe_sched_job *job)
> > > +{
> > > +	return job->lrc_seqno;
> > > +}
> > > +
> > >  static inline void
> > >  xe_sched_job_add_migrate_flush(struct xe_sched_job *job, u32
> > > flags)
> > >  {
> > > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > index 5e12724219fd..990ddac55ed6 100644
> > > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > > @@ -37,6 +37,8 @@ struct xe_sched_job {
> > >  		/** @user_fence.value: write back value */
> > >  		u64 value;
> > >  	} user_fence;
> > > +	/** @lrc_seqno: LRC seqno */
> > > +	u32 lrc_seqno;
> > >  	/** @migrate_flush_flags: Additional flush flags for
> > > migration jobs */
> > >  	u32 migrate_flush_flags;
> > >  	/** @ring_ops_flush_tlb: The ring ops need to flush TLB
> > > before payload. */
> > > diff --git a/drivers/gpu/drm/xe/xe_trace.h
> > > b/drivers/gpu/drm/xe/xe_trace.h
> > > index 2d56cfc09e42..6c6cecc58f63 100644
> > > --- a/drivers/gpu/drm/xe/xe_trace.h
> > > +++ b/drivers/gpu/drm/xe/xe_trace.h
> > > @@ -254,6 +254,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > >  
> > >  		    TP_STRUCT__entry(
> > >  			     __field(u32, seqno)
> > > +			     __field(u32, lrc_seqno)
> > >  			     __field(u16, guc_id)
> > >  			     __field(u32, guc_state)
> > >  			     __field(u32, flags)
> > > @@ -264,6 +265,7 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > >  
> > >  		    TP_fast_assign(
> > >  			   __entry->seqno =
> > > xe_sched_job_seqno(job);
> > > +			   __entry->lrc_seqno =
> > > xe_sched_job_lrc_seqno(job);
> > >  			   __entry->guc_id = job->q->guc->id;
> > >  			   __entry->guc_state =
> > >  			   atomic_read(&job->q->guc->state);
> > > @@ -273,8 +275,9 @@ DECLARE_EVENT_CLASS(xe_sched_job,
> > >  			   __entry->batch_addr = (u64)job-
> > > >batch_addr[0];
> > >  			   ),
> > >  
> > > -		    TP_printk("fence=%p, seqno=%u, guc_id=%d,
> > > batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x, error=%d",
> > > -			      __entry->fence, __entry->seqno,
> > > __entry->guc_id,
> > > +		    TP_printk("fence=%p, seqno=%u, lrc_seqno=%u,
> > > guc_id=%d, batch_addr=0x%012llx, guc_state=0x%x, flags=0x%x,
> > > error=%d",
> > > +			      __entry->fence, __entry->seqno,
> > > +			      __entry->lrc_seqno, __entry->guc_id,
> > >  			      __entry->batch_addr, __entry-
> > > >guc_state,
> > >  			      __entry->flags, __entry->error)
> > >  );
> > > -- 
> > > 2.44.0
> > > 
> 
