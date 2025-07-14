Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68960C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 23:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037710E0C2;
	Mon, 14 Jul 2025 23:43:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQTfww9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB12810E0C2
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 23:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752536605; x=1784072605;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XVIowCj6wSf1qrin1kmKksPr9hS9YK0+M6RgnHLAC/I=;
 b=PQTfww9EFoubQr+ukOGeJuIcv1HvmSZIgOP2vAD+ONYId8iI6ebTxQTx
 uPAwY/RkwBjB4Qgu7q4L1ni9GHbL7wFIL45/Oh0xlxnmCbYJxvRyjyuyn
 iLSXZsFUB4NviaUNr0bu6s5kYtybb458SSusPVQkBv/6IH2w2h7lwOUQv
 cJp0SzrYgPHp8sfqU5Wo9NsGP3y/KXMmSJdJZSvAu16X/PI+e4YFFc3M2
 WnX/Y44fqAFcO5uGPkfe7Zy8SbW2wgs8eSkSTmt4g2lB/YCIu+TRwo7PS
 HnKDbh/3N8X9R8qUMVKAHvMuqvAN2UbRWuesNVLcCfYsXkvuPF8JmqvgP g==;
X-CSE-ConnectionGUID: 5cRQw/JgS9KuWJ3kzJ1lDA==
X-CSE-MsgGUID: 9jb0ahoTSh+UBB7ycfsW4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54830230"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="54830230"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:43:25 -0700
X-CSE-ConnectionGUID: tkmCAjDaRbyAGL/Z+FvudA==
X-CSE-MsgGUID: yXbVybX9QeS3gJSevuJH7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; d="scan'208";a="157570796"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 16:43:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:43:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 16:43:24 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.70) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 16:43:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WO0zYIK6aLz1B4XDs8mcoYmp342ebfYuiK9iaPnduPF94FRSgFXiPLFPcjlpNzxIjocP107C8z656DY8JDuwO+geMHJXNn4HWoORIH4xYyMjSmAY/m6aZVaY1b5XDjPNs2r1+vzd7Qni7pvNLhqQ2H7Qv3i4w0EpLXBqAQYu84qHZN13V3xFfyvuNadKFBlleKz6qrPhCQFTwYtxjV20rLlngdqgLu1I09RUTQ9nZuTKF4ySJ9Q5UoHwaP7CMIfRnuQ69OAWOlf+XLT4WwKjtGJrpkeRjakNB9TQUhTKQeHlqMK55MJuA42S7DZZFdUMB3iMB0sHPclBjykXEaHFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGzvihaeo7gNEa1fGY0KNdNj51wIqc2OZu9MeYE508s=;
 b=AO5PcU3KNaBCAIYSb6FU4Uh4w0SCQ2tNhmfsX87ICPLUO4A3xDGqNw+gGuHxQzYZYNJg+xNUlsT81xycJj7j2ZtbmcdBvzTsso0+J0dE6yb/bXmBQWxIa6INvz9EB8we2Ie56yjxUZLhKkfvbjEpeZoR1oT0XshpO1+bFy5VGu1C5vaB2uu6vO9DwpqM29mxo7pGIqcoDE8kggPADBRFdvEd3Y/aleTrBVBdeRAOaV8U9i/qxLbweQCWCeujUlajSaWbo7B1D6xrvMulBTWHyCLtuqXrgInyOfcoqeH5KLBtxJ+gp3Y20MV3v3SgDphaowYgjy2SxDkt/T6FiP8ioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 23:42:54 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Mon, 14 Jul 2025
 23:42:53 +0000
Date: Mon, 14 Jul 2025 16:44:38 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v3 4/4] drm/xe: Implement clear VRAM on free
Message-ID: <aHWWZksco/qfSQBT@lstrano-desk.jf.intel.com>
References: <20250623151929.2422584-1-matthew.brost@intel.com>
 <20250623151929.2422584-5-matthew.brost@intel.com>
 <47e9d188-aa97-4eb1-a5cb-d4de3c944188@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <47e9d188-aa97-4eb1-a5cb-d4de3c944188@intel.com>
X-ClientProxiedBy: SJ0PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: e3c26904-de72-4be8-740b-08ddc33026f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6zLYpe+nFcLMyjOzsaSFrTYJGNeweEykXDGr6etLkYey2wHOEXhdcNpoXXTK?=
 =?us-ascii?Q?xvIYQAFeSIW4yYulZriYMo1thsK3T2QnmTCgAG5JUU7oUraR/4fqQTUyZAmC?=
 =?us-ascii?Q?HXM2++y2c1EwpafbZ4KgUtqzhrplAOCLmhkWNkapPkvkdt14KibI7sXKVEgL?=
 =?us-ascii?Q?gFaiIzM3se0D5ovI2LdHTQotMoJp0yJiu3YsOyGpCBFsZqYq027GLPAZF2DB?=
 =?us-ascii?Q?r3+N0XDipnX4wqZMr7DVz48bdy419rYu4fbvn4yRMz9Rvy2j2yJzIws22+Ju?=
 =?us-ascii?Q?VhxP9Xd4stZJLBtYoLK3B2hJXrGx43Jzw3yaGyqUei0CGa8d2MLR0QVO10Ha?=
 =?us-ascii?Q?Kk9yfs+sHdNdOrfK/CtR6cbP3GiVNE7Wj/vrufHtjXvq71zQn8izGwQL56HR?=
 =?us-ascii?Q?7+wkT/ZNwD1+IXImONNQHWGQqeVEHDV2hT0gjxB8zt1d0AG9hQTtD41wz+mm?=
 =?us-ascii?Q?vhuCeDyc2rxtNObUhOoTYkzIfJkvMLZEr5jZ3H9nogDjBx8M/rxL8QAWPjfE?=
 =?us-ascii?Q?MJRvektNp4Ge5BN/02d3CRKYqvEq7oRCEuDJN10vE4TBTy6blV9nPVeSMSDi?=
 =?us-ascii?Q?JbbedmkOo3dlQLpcUc9QAFGGmCxYX4USmtPc7gRzxVrUUuypkIte+7QWkC5w?=
 =?us-ascii?Q?TA0Y3NOan/lSpkuD/rCPsYpm6eIfYZ0QSyjUrulceaKOx7OWLYxW7Licjg7S?=
 =?us-ascii?Q?zAuJmaoZN/+cFDpKjm+cIxJkzr/eNQ8sao+COXTyx0BisgLBiQoA2NC9RIqy?=
 =?us-ascii?Q?zeBkMLxyELvBayB8XO86xH+fTGG/ObPlH61DRI/nC5zq2LhE7HM4cT1pUuo8?=
 =?us-ascii?Q?MrhbzCI2oc78p5tggotl3FxMsYFsc529vZEtR0rwFcjqGAnARe3sPb/kgc5i?=
 =?us-ascii?Q?r4kvhEbU60d4SNEjPwqltHX/OgfhhQMjsQpMlrDrlpRG0w8ynxqj1bfkBg+0?=
 =?us-ascii?Q?xLazVLzynxVPCgVH1RiN43+KZur47IFVLufE3ZpEjXHVm8o95zjZd9TEbYbw?=
 =?us-ascii?Q?APSjG6v+NywWqs97wgHibWwN5PnNHi4rjNizr+JKL9wivFDcI/5+727EOheJ?=
 =?us-ascii?Q?MbFklxOAal5TOh5sdJREdZ0RXjhLZaI+jAsTuH3UsrXQ/SLMD8R1lfbJDrhU?=
 =?us-ascii?Q?tD+y4RFpWc3aW8zy/v6WIZ1NHHxT5xvDb3X/XPjyDvXWL5ea7Wxy8HQ2k9wI?=
 =?us-ascii?Q?k+tyBNQfaCtlEeKsdjdojr957It1gq3rl36Q9Eqw1EzR2s0Zb+cfCCpwbMhz?=
 =?us-ascii?Q?HypDt0ETM3UyJo0EUhKet0pVIJGrNpi3U4Qm9V4Na0U3l4vgVcfFbE1drqEy?=
 =?us-ascii?Q?8qq+YJYK+2CxmkLAdgfuEloTmQNaU/V4YKnVIldcDvCvzt2okpcVE4iduvr8?=
 =?us-ascii?Q?nEITiodJf2PqdCpo2/HUCEMq+GywUrwMSJbjGXcMWz+1CVHgUCydZCCwRRi7?=
 =?us-ascii?Q?aDymrNcx4w4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ce+tnyImPlUm/YTp0H6uKMQIs0N1CaQ5kZyITs4bNK7Z3DfF19uVZOU9Zjgj?=
 =?us-ascii?Q?wIi8xnGci2/RNr4ZuNtLP358E2E5VgHi6WVQRmB/Ps9WvfKUnSb9UZyYn9+T?=
 =?us-ascii?Q?w6SiEhDOs4YtMXbGnToAeovZq9RpP0jeqxIWHmef54AAkwdiPwAKIq2u5e7p?=
 =?us-ascii?Q?TcHpdU+obCUCKthv8DY7J0EVmw2IwFzXDzKvpN7grSFZ2N9mh4GpFa+tTSgZ?=
 =?us-ascii?Q?C1OlKwkjawgnLN/DZpj1cJJWWlr0OhbTLccMB9osAmn3bWD30JQc/kQQkSB5?=
 =?us-ascii?Q?cSVlwphxre1KW++wCvR2PMcUbF9GKX6gpHj79W9tBr5ZftKDp6DD4FBf3zsM?=
 =?us-ascii?Q?UvFGFAmvaFRX6lbi1xB9OV45yTC1AMpHVILSycak+51tBaylS2xB/KjcaEn5?=
 =?us-ascii?Q?Y3Mj6NvwhkNfbChr16DxGEwXJrM/yuNbspmEOxE8P3A40YproQaHmmG924Vn?=
 =?us-ascii?Q?YZJtw+CU8s2RJ4l7ksSQlN/hnnjuTy/J00uA57N6mSsNjWlADbjK9NeTsxkp?=
 =?us-ascii?Q?2O+//yJmt8qY4ZNGss4bUzGmds3z1G0DHOkGPA4HdGxWeYUQdqmNrwgDQf6C?=
 =?us-ascii?Q?F0Kq58FU0l+OymUvlaTBd8EHdzj2+BAarWOVO/szC5t3ctXqr4TzI0De32H0?=
 =?us-ascii?Q?5U/U+gqwJz+XKZ2OA9T7zMJ98yIenMAyVl1rW7M1L4vqSvDSnFBpOm26DQpl?=
 =?us-ascii?Q?gNiZ/Is7BLMPwUcGiNpcuWNyYbapd2G77YPYr5GEV96yW8qAlvo7W5Z3QAX4?=
 =?us-ascii?Q?15vvHUfUleLvI4Es1IAv5EAPUKUyXX1IGhqoS6jKPbAHPJKMJIBwD2lVW9Lm?=
 =?us-ascii?Q?h7V1JyfVVH5No/9J6CdvhbPwwWcNffBArAQuMgS/RVJUZIApNjvcbkdf+9Pu?=
 =?us-ascii?Q?RgIvOgTlPgAKqDURlCJeqOaV62uf9LCAceJhAzqbcgeuMH7OzLM3+Fohgt9+?=
 =?us-ascii?Q?HJZRandHeouy+LaMXOAyi7CJWii6DkkWlncMln2RF7jFVwzFKUjQUFYsGNrF?=
 =?us-ascii?Q?n1CU1nKi/z4xHcILxD7ivr79IPZjhbEePSeQ/CRlAT0V5pdnCa9GbYDmALVC?=
 =?us-ascii?Q?QuScj24k8V6cqtHkVTl0cNBbbtjdelRreLKl5iQ3EN0TawshrWOMw1KhbWPj?=
 =?us-ascii?Q?/ds4T7G5Ctv4bmpPGxq5nL/v80sctrg7/uCa0sdV8CfCBlhJClbRTDZQcf/n?=
 =?us-ascii?Q?m8jPn6sLdyGcSgnxI8Th48coh/qxlit568urQNKzmTEY0iOJexdEpAWIXAO5?=
 =?us-ascii?Q?oag/JEWJsnqSjFjRknXzSCrUtttDbNC7otNGYh6npopiUQsUSk9Xbbrf7Waa?=
 =?us-ascii?Q?4oZ+7REPpvl9kYEPzSYdfm+yAgC3A5o7/x0OMjDAAochZSc5j8KnyNffXw7S?=
 =?us-ascii?Q?N83zX+K5a/gOPNk3oE++FH2f+//iBRqmWuHI83vcmGo2Q0Fd0YQH5xxy/4Jq?=
 =?us-ascii?Q?oxLijd1mJh8dIsK8GgFz//vKl5rzF9VSBEmbBiCfkfvYFPii+mpVhDJxqVwH?=
 =?us-ascii?Q?/cgu98XG2NQoaGlRhy6ti/wNRIcCBZZ/ib2tZT/CUZp4YlKIR5jQqEQbe/Ju?=
 =?us-ascii?Q?UuVWNR57ZS+bGVBTwE4cAaDrKfRJ8TjfEcvAWcEhvCTdXhj+2M/+1rWthJDA?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3c26904-de72-4be8-740b-08ddc33026f1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 23:42:53.8379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te87t5LrQiTWFSgnZ1oLTmEi5eDZbHuuNQjfqf3EI4NuXp/jywLsvyhoAQEmsrtNM2djBh+dob84/1GGWQ49Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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

On Fri, Jul 04, 2025 at 10:17:24AM +0100, Matthew Auld wrote:
> On 23/06/2025 16:19, Matthew Brost wrote:
> > Clearing on free should hide latency of BO clears on new user BO
> > allocations.
> > 
> > Implemented via calling xe_migrate_clear in release notify and updating
> > iterator in xe_migrate_clear to skip cleared buddy blocks. Only user BOs
> > cleared in release notify as kernel BOs could still be in use (e.g., PT
> > BOs need to wait for dma-resv to be idle).
> > 
> > v2:
> >   - Update to new xe_migrate_clear arguments (Thomas)
> >   - Wait on BOOKKEEP slots for clear onn free (Thomas)
> >   - s/XE_MIGRATE_CLEAR_NON_DIRTY/XE_MIGRATE_CLEAR_FLAG_ON_FREE
> >   - Do not requested clear memory in VRAM manager if BO as TT data (Auld)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c           | 48 ++++++++++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_migrate.c      | 31 ++++++++++++------
> >   drivers/gpu/drm/xe/xe_migrate.h      |  1 +
> >   drivers/gpu/drm/xe/xe_res_cursor.h   | 26 +++++++++++++++
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  6 +++-
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  6 ++++
> >   6 files changed, 108 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 7a412121477e..900f67deef9d 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1453,6 +1453,52 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
> >   	return locked;
> >   }
> > +static void xe_ttm_bo_release_clear(struct ttm_buffer_object *ttm_bo)
> > +{
> > +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> > +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> > +	struct dma_fence *fence;
> > +	int err, idx;
> > +
> > +	xe_bo_assert_held(ttm_to_xe_bo(ttm_bo));
> > +
> > +	if (ttm_bo->type != ttm_bo_type_device)
> > +		return;
> > +
> > +	if (xe_device_wedged(xe))
> > +		return;
> > +
> > +	if (!ttm_bo->resource || !mem_type_is_vram(ttm_bo->resource->mem_type))
> > +		return;
> > +
> > +	if (!drm_dev_enter(&xe->drm, &idx))
> > +		return;
> > +
> > +	if (!xe_pm_runtime_get_if_active(xe))
> > +		goto unbind;
> > +
> > +	err = dma_resv_reserve_fences(&ttm_bo->base._resv, 1);
> > +	if (err)
> > +		goto put_pm;
> > +
> > +	fence = xe_migrate_clear(mem_type_to_migrate(xe, ttm_bo->resource->mem_type),
> > +				 ttm_bo->resource, &ttm_bo->base._resv, NULL,
> > +				 bo->size, XE_MIGRATE_CLEAR_FLAG_FULL |
> > +				 XE_MIGRATE_CLEAR_FLAG_ON_FREE, &bo->ccs_cleared);
> > +	if (XE_WARN_ON(IS_ERR(fence)))
> 
> Should we chuck a warn for this? I think there might be some intr waits in
> there which could legit trigger?
> 

Unless I'm missing something, nothing xe_migrate_clear in interruptable.
All the locks are non-interruptable, same with waits. Also this should
be a kernel contetxt, not interrutable user context, right?

> > +		goto put_pm;
> > +
> > +	xe_ttm_vram_mgr_resource_set_cleared(ttm_bo->resource);
> > +	dma_resv_add_fence(&ttm_bo->base._resv, fence,
> > +			   DMA_RESV_USAGE_KERNEL);
> > +	dma_fence_put(fence);
> > +
> > +put_pm:
> > +	xe_pm_runtime_put(xe);
> > +unbind:
> > +	drm_dev_exit(idx);
> > +}
> > +
> >   static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >   {
> >   	struct dma_resv_iter cursor;
> > @@ -1497,6 +1543,8 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
> >   	}
> >   	dma_fence_put(replacement);
> > +	xe_ttm_bo_release_clear(ttm_bo);
> > +
> >   	dma_resv_unlock(ttm_bo->base.resv);
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index 18030f9613ae..7620f4eb8fb3 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1067,7 +1067,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   	struct xe_gt *gt = m->tile->primary_gt;
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	bool clear_only_system_ccs = false;
> > -	struct dma_fence *fence = NULL;
> > +	struct dma_fence *fence = dma_fence_get_stub();
> >   	struct xe_res_cursor src_it;
> >   	struct ttm_resource *src = dst;
> >   	int err;
> > @@ -1078,10 +1078,13 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   	if (!clear_bo_data && clear_ccs && !IS_DGFX(xe))
> >   		clear_only_system_ccs = true;
> > -	if (!clear_vram)
> > +	if (!clear_vram) {
> >   		xe_res_first_sg(sgt, 0, size, &src_it);
> > -	else
> > +	} else {
> >   		xe_res_first(src, 0, size, &src_it);
> > +		if (!(clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE))
> > +			size -= xe_res_next_dirty(&src_it);
> > +	}
> >   	while (size) {
> >   		u64 clear_L0_ofs;
> > @@ -1128,6 +1131,9 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   			emit_pte(m, bb, clear_L0_pt, clear_vram, clear_only_system_ccs,
> >   				 &src_it, clear_L0, dst);
> > +		if (clear_vram && !(clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE))
> > +			size -= xe_res_next_dirty(&src_it);
> > +
> >   		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> >   		update_idx = bb->len;
> > @@ -1149,15 +1155,22 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   		}
> >   		xe_sched_job_add_migrate_flush(job, flush_flags);
> > -		if (!fence) {
> > +		if (fence == dma_fence_get_stub()) {
> 
> Does this get() always have a matching put()? Say fence != stub?
> 

Maybe not, but I think that is ok given you don't want a dma-fence to be
destroyed. This is a bit of backwwards checkout though as
dma_fence_get_stub takes a spin_lock and increments a ref count. Let me
rework this a bit.

Matt

> > +			enum dma_resv_usage usage =
> > +			       (clear_flags & XE_MIGRATE_CLEAR_FLAG_ON_FREE) ?
> > +			       DMA_RESV_USAGE_BOOKKEEP : DMA_RESV_USAGE_KERNEL;
> > +
> >   			/*
> > -			 * There can't be anything userspace related at this
> > -			 * point, so we just need to respect any potential move
> > -			 * fences, which are always tracked as
> > +			 * For initial clears, there can't be anything userspace
> > +			 * related at this point, so we just need to respect any
> > +			 * potential move fences, which are always tracked as
> >   			 * DMA_RESV_USAGE_KERNEL.
> > +			 *
> > +			 * For clear on free need to respect all fences as
> > +			 * memory could still be in use by the GPU which is
> > +			 * tracked in DMA_RESV_USAGE_BOOKKEEP.
> >   			 */
> > -			err = xe_sched_job_add_deps(job, resv,
> > -						    DMA_RESV_USAGE_KERNEL);
> > +			err = xe_sched_job_add_deps(job, resv, usage);
> >   			if (err)
> >   				goto err_job;
> >   		}
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> > index 04b3cd86ba90..104c61812ba1 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.h
> > +++ b/drivers/gpu/drm/xe/xe_migrate.h
> > @@ -120,6 +120,7 @@ int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
> >   #define XE_MIGRATE_CLEAR_FLAG_BO_DATA		BIT(0)
> >   #define XE_MIGRATE_CLEAR_FLAG_CCS_DATA		BIT(1)
> > +#define XE_MIGRATE_CLEAR_FLAG_ON_FREE		BIT(2)
> >   #define XE_MIGRATE_CLEAR_FLAG_FULL	(XE_MIGRATE_CLEAR_FLAG_BO_DATA | \
> >   					XE_MIGRATE_CLEAR_FLAG_CCS_DATA)
> >   struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > index d1a403cfb628..630082e809ba 100644
> > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > @@ -315,6 +315,32 @@ static inline void xe_res_next(struct xe_res_cursor *cur, u64 size)
> >   	}
> >   }
> > +/**
> > + * xe_res_next_dirty - advance the cursor to next dirty buddy block
> > + *
> > + * @cur: the cursor to advance
> > + *
> > + * Move the cursor until dirty buddy block is found.
> > + *
> > + * Return: Number of bytes cursor has been advanced
> > + */
> > +static inline u64 xe_res_next_dirty(struct xe_res_cursor *cur)
> > +{
> > +	struct drm_buddy_block *block = cur->node;
> > +	u64 bytes = 0;
> > +
> > +	XE_WARN_ON(cur->mem_type != XE_PL_VRAM0 &&
> > +		   cur->mem_type != XE_PL_VRAM1);
> > +
> > +	while (cur->remaining && drm_buddy_block_is_clear(block)) {
> > +		bytes += cur->size;
> > +		xe_res_next(cur, cur->size);
> > +		block = cur->node;
> > +	}
> > +
> > +	return bytes;
> > +}
> > +
> >   /**
> >    * xe_res_dma - return dma address of cursor at current position
> >    *
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > index 9e375a40aee9..838739e47815 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> > @@ -84,6 +84,10 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
> >   	if (place->fpfn || lpfn != man->size >> PAGE_SHIFT)
> >   		vres->flags |= DRM_BUDDY_RANGE_ALLOCATION;
> > +	if (tbo->type == ttm_bo_type_device &&
> > +	    !xe_bo_tt_has_data(ttm_to_xe_bo(tbo)))
> > +		vres->flags |= DRM_BUDDY_CLEAR_ALLOCATION;
> > +
> >   	if (WARN_ON(!vres->base.size)) {
> >   		err = -EINVAL;
> >   		goto error_fini;
> > @@ -187,7 +191,7 @@ static void xe_ttm_vram_mgr_del(struct ttm_resource_manager *man,
> >   	struct drm_buddy *mm = &mgr->mm;
> >   	mutex_lock(&mgr->lock);
> > -	drm_buddy_free_list(mm, &vres->blocks, 0);
> > +	drm_buddy_free_list(mm, &vres->blocks, vres->flags);
> >   	mgr->visible_avail += vres->used_visible_size;
> >   	mutex_unlock(&mgr->lock);
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > index cc76050e376d..dfc0e6890b3c 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> > @@ -36,6 +36,12 @@ to_xe_ttm_vram_mgr_resource(struct ttm_resource *res)
> >   	return container_of(res, struct xe_ttm_vram_mgr_resource, base);
> >   }
> > +static inline void
> > +xe_ttm_vram_mgr_resource_set_cleared(struct ttm_resource *res)
> > +{
> > +	to_xe_ttm_vram_mgr_resource(res)->flags |= DRM_BUDDY_CLEARED;
> > +}
> > +
> >   static inline struct xe_ttm_vram_mgr *
> >   to_xe_ttm_vram_mgr(struct ttm_resource_manager *man)
> >   {
> 
