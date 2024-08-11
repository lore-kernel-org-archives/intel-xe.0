Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68408C3DA4A
	for <intel-xe@archiver.kernel.org>; Sun, 11 Aug 2024 22:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C1E10E00E;
	Sun, 11 Aug 2024 22:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f04IXyXa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F40A10E00E
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Aug 2024 22:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723414233; x=1754950233;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=x99ibW7NgMwiMsmTGjvIAf7N3qmOL7EGT+KsyJJkhRE=;
 b=f04IXyXauk/QPrIuu8sci6RcLNB1SE08gfoh3hyR4Tkw4m0NeHyNv7pc
 Vj76iFbzsn2fiPUhMmXv/LjX789PbRFYSZd9P4xSmxK1nelCUrKkktJsN
 4Uqnm3svwtOZUNwTQvAuyL+nPYm4KIy36Q20FozywaxbtcvcbvEfTSHdl
 syVjn29UIX1PZkzqwkosmI842jydWViTJT0JHQbOVq5sAzwLIvliSBR5H
 PNor/PtN5/0HV1UXqZKkOBSxHEWCb0L5oHomvFN9f1XA79/YeLvPEgaWH
 +9bYwwL5NL1RfLjAcTUNv8qpu65iLLVDlqX+8IAsWpdzA2P8m2eA/da3U A==;
X-CSE-ConnectionGUID: ITdGm4lvR66RU3U3Rek1zw==
X-CSE-MsgGUID: BDtIZ/3PTnWhudCPqNbrkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21681468"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="21681468"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2024 15:10:33 -0700
X-CSE-ConnectionGUID: qHU64eOJQzq8DSjse8Gv9Q==
X-CSE-MsgGUID: /6NsAx3kSROUqG6UqzMbCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58041109"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Aug 2024 15:10:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 11 Aug 2024 15:10:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 11 Aug 2024 15:10:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 11 Aug 2024 15:10:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q59OWU/I4y39i/8Ym1byCpnfRP1PTKHgE8yV5Xrn6o3Kj1pqM3PNhYEYN7zUFb5Xj10W2l9G69w6dUO3eAYwopxeVPZ3cQVG1nAE6zbNzHfTuZSXXNfT9ArFjpHQOBvyzb8OsGZEacAgNQqGbAuiXsG1YUjCSIWvN9ZDKSf/Ce6NUkpYzU+HCl2VAO6S9pceHq6dnT9kUXBUmM+OcgTlx6bHQh2R9qkDMWWMe165TAwIaS0mtoc/QDRrwezo30UWYGZ2KkTAUGV3VVDWcMYiIPBkw9gTQ0OzyILOA5L/0SWR311GFpsbH4gAZSjCPUGQHvRB/kZoH7SZvIr+twR/sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTwsBYRWg7PNfSpwgcuzX66UlYJI6O3oZPQ0Ko9BdzU=;
 b=cdzNEa86ftohAMQa6Do2P7OnCypswc+dg0mA7gJjlR1ZBJRHlNmRThLfIfWLoFhpIQmm8Ey3iZGOra9b0bOuNB3RQw0m7YPFmNcSsz768n+FEku+0tO+d8l3a15kiOpoDKoyt0nObD96hrVBwBqa2ab+H7kn4idL+zm8wjo+3GBqAa+3opSYVoJpW8Uvktrv4U2862xwMvXkTtjg/d9/zh44gBgyjzl5SOZfMZERj5JYEof8tTMYHYHud4lrnUVs513TIsbWlJ7qiu3Cw5pS3VZR/ZUNqhp3fiCNyzkLEhCJ7a6nfODJl/FYNwKqmX1GwAmzmptxkkPcRGS3gvEx/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4517.namprd11.prod.outlook.com (2603:10b6:208:24e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Sun, 11 Aug
 2024 22:10:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Sun, 11 Aug 2024
 22:10:27 +0000
Date: Sun, 11 Aug 2024 22:09:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH 1/1] drm/xe: Add driver load error injection
Message-ID: <Zrk2kxwvnCMev+Wx@DUT025-TGLU.fm.intel.com>
References: <20240809224424.3212551-1-matthew.brost@intel.com>
 <20240809224424.3212551-2-matthew.brost@intel.com>
 <sm7bvlh4s6djffddiywpjuboui6qdzcww3pjvtybt46c2xbp5f@c3s4vcaqe3ja>
 <ZrduH7WZvUGDxUSg@DUT025-TGLU.fm.intel.com>
 <wfcpm424tnkc26c5tepur53xwskeig7wletqlccbo22ah4nxaf@w67iw2q4sv4a>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <wfcpm424tnkc26c5tepur53xwskeig7wletqlccbo22ah4nxaf@w67iw2q4sv4a>
X-ClientProxiedBy: SJ0PR03CA0381.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4517:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d7b5db-f9b5-44ea-cd94-08dcba5267c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ytdU0f2WcgEJtY6JEr7JlPjKtoK2JabXYHmIQQXdh+tOqP4nKLRV4lDeL5p?=
 =?us-ascii?Q?tFZA+63RX/4j/BMBfeZbxOQl9PrM6lgiPLjq8Fx7eJzcSMveuQ1fBIp3h36z?=
 =?us-ascii?Q?tpRy+zlckxCxdTrEmgsf0cHUaBubGo5ac1x+tulLAH6wJwTePQED2jj4S3J2?=
 =?us-ascii?Q?0IyM8ZSz98zhRZekdoD7qeVQY1nluzTemptgbbV7mt+Ie0IEEO0cT7xRoEmW?=
 =?us-ascii?Q?z7AwkLh/0QvGYOlaNLpeIg9yAhpYE4MLrWH5hFp2SdK5YGu2ANHephu/q7gD?=
 =?us-ascii?Q?TF1R93qXiWmBfQQXp/PdOhtFouWlB+TCGh4ucI34KWef53Kyc7MVLht/oySu?=
 =?us-ascii?Q?KV1Rj/p3EDih88xOGRrfSkrU4h67gSbtNZY6f7z2SmZ8Arby2DBeQwPdVlkz?=
 =?us-ascii?Q?aG/1aN0O3cslt9YBNwQ0wyxvYmjOAnSPdJtZeWwv6hOLvTw8AK0tf66iv52E?=
 =?us-ascii?Q?BAbrTmGz18H/iZaJzB1eVIqvRCeTcYeK0L0I2BRbW6j5NxRzFchJjwsfZuod?=
 =?us-ascii?Q?exfU8n3Fs4dsy51ZFiFaS73JuhqhdQZpNloawreWzM8h9KTr4SMW7e9vsu7N?=
 =?us-ascii?Q?IpBDbAr3gBKMkJIYcgsSN1dnSrrnbBJM2QxbZo7kTyr3uLgxp8LavJDX6HVk?=
 =?us-ascii?Q?rqBXgcmcXcOgrukvTfgZHPUVJJil2E8fZ0VZ9kRgr8RyRQHzNnTzERBu+MMj?=
 =?us-ascii?Q?gm4sKLSt54+PuZusQAjz3UVO+1I5Px1OhfGd5/fziMa/f8K3Jh6LH8VUNAP0?=
 =?us-ascii?Q?8sgFPKnkw5C9fW1NQC6uU5Pn4FuBzp7cwHXKVLRm0D5yZKQK+su0Shg47+xX?=
 =?us-ascii?Q?QWDzYFKLYHqwzFQJuDQM5fOQa3ZHUnLLUM72NCGWVrTPwTlO3mq5FH/vU+cY?=
 =?us-ascii?Q?DFTQEyr/sPBj6R3a67pmH+EBM/3xkBRpmkdeFbsRp343CX4Ws1fGmtC9loaL?=
 =?us-ascii?Q?krpoBnDBCHj0Ne8x/3ZtBno0ut2KCw002UGQ+qVUuJk473ApeW0x3OS51+2w?=
 =?us-ascii?Q?E/lf5hGHSySWlrGs+DWQNTaoQBMLgKxjRLLUuR1wHtm4M/b7W9rhISf6vcTE?=
 =?us-ascii?Q?IPpKH1qV7zcNGcW3gnG++pAxA5WsVGxFo38Aa6DR3EaQRx3g1ZtsbzBhyQw3?=
 =?us-ascii?Q?ykJFdCLzcYUpcKF4Pd7md/T48JbIPuNDa9w7xeYr/Qya6ofd0snLZ60gvfnl?=
 =?us-ascii?Q?ym2fTVDPIJ9E0tvf30RnS75KIIkBpLxJnFjFsoYd6AnFAttMXuCJPsIyLiHS?=
 =?us-ascii?Q?SyRt+pLJsMfprmrKZByS8NX81w8bAWl9Wd11ZQnoQpivE/rQ2QiXsV/s4MiK?=
 =?us-ascii?Q?hDM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p4gFSW9xUuIIsJ1ZhTh6JDxK5srocYjQ5IGQSZs9NEuIGiqDqX7S4v0dzzEQ?=
 =?us-ascii?Q?Reh5nSxnJB3HBfw8scVjD1TXrye9oerPYchbCKG4ckSU4VcaKU/rvZrAj4x/?=
 =?us-ascii?Q?6mhJGprtjdP/y3fkCUgVudW11FD2oC8Sfy/9NKM5ZSYHpyRPP/mjyqdEyuJr?=
 =?us-ascii?Q?WbCdZpbNbB72tRs3/NDEq1XGWxqozQ0A/1DCmffn3pLkqCj9CoGIsJhsqfZX?=
 =?us-ascii?Q?ZzKZNmeiAm8yR08Ubgjk6KJzJyD8jGtc5UkusWxKdIN8F1eRp2QeMNgftJ87?=
 =?us-ascii?Q?870fZC4KpkQz3tqt1qw6/O4vJzE3asLnBYFrUIMGLMR7xWS6z39SaWXwoyba?=
 =?us-ascii?Q?k5mfvzl++nDjkdQlrnyrCjZs+1gtmSpb51Znaw9pzCUnWKGiOlFJNl0rv5K6?=
 =?us-ascii?Q?XMBAO9nHgC8HJ8Rd5KqqQXHwWk0IVzyRD3Z4Ty1YYyakhoJmJwu8xursGPUm?=
 =?us-ascii?Q?5guxSLaLfELsRtBS5AlY1joZ3MFUWTJtgkkNJnrAfEHyClLCtvVAI/Jqih8v?=
 =?us-ascii?Q?+Hzqx4oKiu+hl2UXbFhXm/8dWsmWNr4NP+s3Pk1osQfmpUXYBY+0osvw93C5?=
 =?us-ascii?Q?ZJ/yl07sWdmIk9PgDwW6olvprUKjHFjUBDXN19wXquLe9z3iPdlNCRLhLxz+?=
 =?us-ascii?Q?kyxjIB0CHGCV3k4WGZjn7dbPA6/AOd7kyojON6NIypJSyUOAnm62FCV4jGAi?=
 =?us-ascii?Q?Rtm/r8oyk8Q1lETgandaupVYP2tWQvu7sLZ4LL0jj3yT6RU+tAtpDTcsd7fu?=
 =?us-ascii?Q?ae8HX7G3HnvjibQ2PUQGYWvsn7G2oXf1ZIrpGXx9yZIcKv0cTeDLCOrSo6An?=
 =?us-ascii?Q?kuS7kp3fgEXHYwkYrKqzMGSa9uGpm84h05MhKossQ9OnYOUPgltxa9QLZ46g?=
 =?us-ascii?Q?FFS3swFc9QfEVihNyLHlxRFpfBsEIjO0Yg19v2RLEHaJlSCZ9LqSnKizYX3h?=
 =?us-ascii?Q?UpNtTZXiylApS4RugH+uNkbmX7eWFtOaTEHNU+Cpu/5LcSshRFVP5N5cR6U+?=
 =?us-ascii?Q?AUOx22nlU/L8s3T3pNTv1p7WrHnShYhRGxNFv+e7WvBCPsKy9b+Hx0sBo4eT?=
 =?us-ascii?Q?IPqrat5VHMCC6GxfHvjY7OZ/WmBxSurF87nZnobxxuneECTXS3oTpllK5FWt?=
 =?us-ascii?Q?DOnaA+68GQDJ6JQT4HGFMfTdMTXJdSQfKjcwdkNiSuseKTedus3/sqv2TLDD?=
 =?us-ascii?Q?VV9O2VceI1tKwb2+u0UyWdMTtLeXvOt804WlM+r6R+VdUPrxL/iWDIOZPaub?=
 =?us-ascii?Q?T1QskMkho7TrfG/wbt5jPxanMtVzlMcFiNLKpMIcZJOEeC9X6jLUnBnLyk8c?=
 =?us-ascii?Q?MrsLkBaKW5PYFjBoTcaGIlzyURBN6uN/U7uHMRNAqqXDD52Ei5LYbayoGyFp?=
 =?us-ascii?Q?I+w2DsMeLWG+6bHf1YK7Z0euo6GgbSdOvln5BaUoeXgDdM7LhbQ0dJ6IdUpV?=
 =?us-ascii?Q?yZOORnfTkcB7dhpsZjXfu0Xm1YsvKo+5/kJ1hLUwZSk/qhWbWyQ/2z0gRROl?=
 =?us-ascii?Q?xDlFsAGeQHeEpIqpdRGFlo3pu0nA5tpquCp6GCPZFQjHL6NTdJtwHKEsscaX?=
 =?us-ascii?Q?w9kx4FsiGj/91emF0kEF0m+q8Ys32Y8yO8upaYQXm3zt66011eT9ullVa3UD?=
 =?us-ascii?Q?8Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d7b5db-f9b5-44ea-cd94-08dcba5267c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 22:10:27.2398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lm02fpP6ahL8WYI8nOVhpKFQKdQjGmHR/RlhrLWoE9RP+88BSlrPszOVk4MZBQ3I3W46eRQz69MQrVzz9fl7zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4517
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

On Sat, Aug 10, 2024 at 11:01:29AM -0500, Lucas De Marchi wrote:
> On Sat, Aug 10, 2024 at 01:41:51PM GMT, Matthew Brost wrote:
> > On Sat, Aug 10, 2024 at 12:16:32AM -0500, Lucas De Marchi wrote:
> > > On Fri, Aug 09, 2024 at 03:44:24PM GMT, Matthew Brost wrote:
> > > > Port over i915 driver load error injection.
> > > >
> > > 
> > > I don't like much the manual approach, but it's better to get the driver
> > > not exploding. Then we can think of replacing this.  Some comments below
> > 
> > Yep. I chatted with Rodrigo about this and we agreed their isn't a great
> > way with the existing kernel error injection to easily get coverage like
> > this plus a very simple test case [1]. Agree longterm we should not
> > invent our own things and come up with either a kernel or drm level
> > solution.
> > 
> > In the short term, yes this better than our driver exploding. View this
> > as a force probe blocker, so we need to get our driver fixed in a matter
> > of weeks and this seems like the only viable path for now.
> > 
> > [1] for i in {1..N}; do echo "Run $i"; modprobe xe inject_driver_load_error=$i; rmmod xe; done
> > 
> > > as I think some of the checks are not right.
> > > 
> > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > > drivers/gpu/drm/xe/xe_device.c       | 31 ++++++++++++++++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device.h       | 15 ++++++++++++++
> > > > drivers/gpu/drm/xe/xe_device_types.h |  4 ++++
> > > > drivers/gpu/drm/xe/xe_gt.c           |  5 +++++
> > > > drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  4 ++++
> > > > drivers/gpu/drm/xe/xe_guc.c          |  8 +++++++
> > > > drivers/gpu/drm/xe/xe_guc_ads.c      |  5 +++++
> > > > drivers/gpu/drm/xe/xe_guc_ct.c       |  4 ++++
> > > > drivers/gpu/drm/xe/xe_guc_log.c      |  5 +++++
> > > > drivers/gpu/drm/xe/xe_mmio.c         |  5 +++++
> > > > drivers/gpu/drm/xe/xe_module.c       |  5 +++++
> > > > drivers/gpu/drm/xe/xe_module.h       |  3 +++
> > > > drivers/gpu/drm/xe/xe_pci.c          |  9 ++++++++
> > > > drivers/gpu/drm/xe/xe_pm.c           |  8 +++++++
> > > > drivers/gpu/drm/xe/xe_sriov.c        |  8 ++++++-
> > > > drivers/gpu/drm/xe/xe_tile.c         |  4 ++++
> > > > drivers/gpu/drm/xe/xe_uc.c           |  4 ++++
> > > > drivers/gpu/drm/xe/xe_wa.c           |  5 +++++
> > > > drivers/gpu/drm/xe/xe_wopcm.c        |  4 ++++
> > > > 19 files changed, 135 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 1aba6f9eaa19..f6cd13ed6d20 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > @@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> > > > 	if (WARN_ON(err))
> > > > 		goto err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		goto err;
> > > > +
> > > > 	return xe;
> > > >
> > > > err:
> > > > @@ -477,6 +481,10 @@ static int xe_set_dma_info(struct xe_device *xe)
> > > > 	if (err)
> > > > 		goto mask_err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		goto mask_err;
> > > > +
> > > > 	return 0;
> > > >
> > > > mask_err:
> > > > @@ -580,6 +588,10 @@ int xe_device_probe_early(struct xe_device *xe)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	xe->wedged.mode = xe_modparam.wedged_mode;
> > > >
> > > > 	return 0;
> > > > @@ -995,3 +1007,22 @@ void xe_device_declare_wedged(struct xe_device *xe)
> > > > 	for_each_gt(gt, xe, id)
> > > > 		xe_gt_declare_wedged(gt);
> > > > }
> > > > +
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
> > > > +					 const char *func, int line)
> > > > +{
> > > > +        if (xe->inject_driver_load_error >= xe_modparam.inject_driver_load_error)
> > > > +                return 0;
> > > > +
> > > > +        if (++xe->inject_driver_load_error < xe_modparam.inject_driver_load_error)
> > > > +                return 0;
> > > > +
> > > > +        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
> > > > +                 err, xe->inject_driver_load_error, func, line);
> > > 
> > > I wonder if it'd wouldn't be sufficient, for debugging sake to use
> > > "... [%pF]", __builtin_return_address(0)
> > > 
> > 
> > I think that probably works. I their a way to decode the line number
> > though? The line number is a bit more helpful can some hex value.
> 
> the format is actually
> 
> theres addr2line, but since I may or may not have tool handy depending
> on the machine, I always use gdb
> 
> 	gdb xe.ko
> 	...
> 	l *(versatile_init+0x9)
> 
> which gives the tranlation. Looking at https://www.kernel.org/doc/Documentation/printk-formats.txt
> (Symbols/Function Pointers) it actually suggests using "%pS" as print
> format when using __builtin_return_address(0)
> 
> Anyway, I won't oppose leaving this they way you coded though.
> 

Yes, I use gdb too but typically don't build with debug symbols or if
something pops in CI unsure how to grab the build to determine the line
number.

> > 
> > > > +
> > > > +        xe_modparam.inject_driver_load_error = 0;
> > > > +        return err;
> > > > +
> > > > +}
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> > > > index db6cc8d0d6b8..4f7e9cdac9fe 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device.h
> > > > @@ -179,4 +179,19 @@ void xe_device_declare_wedged(struct xe_device *xe);
> > > > struct xe_file *xe_file_get(struct xe_file *xef);
> > > > void xe_file_put(struct xe_file *xef);
> > > >
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +
> > > > +int __xe_device_inject_driver_load_error(struct xe_device *xe, int err,
> > > > +					 const char *func, int line);
> > > > +
> > > > +#define xe_device_inject_driver_load_error(__xe) \
> > > > +	__xe_device_inject_driver_load_error(__xe, -ENODEV, __func__, __LINE__)
> > > 
> > > is -ENODEV the only error we may want to inject?
> > > 
> > 
> > I was little lazy here, should be easy enough to add another macro (the
> > i915 does this) to control the error value. But in general I don't think
> > we really care about the error on driver load as we pretty much always
> > just fail the driver load.
> 
> ok, if we don't care about the error code in any existent check, then
> let's go with the simple approach.
>

+1
 
> > 
> > > > +
> > > > +#else
> > > > +
> > > > +#define xe_device_inject_driver_load_error(__xe) \
> > > > +	({ BUILD_BUG_ON_INVALID(__xe); 0; })
> > > 
> > > if the suggestion above is not feasible, then maybe better to leave
> > > this outside the ifdef and provide a dummy
> > > __xe_device_inject_driver_load_error() so we type-check?  Or we can
> > > type check manually too.
> > > 
> > 
> > You mean?
> > 
> > static inline xe_device_inject_driver_load_error(struct xe_device *xe) {}
> 
> 	       __xe_device_...
> 
> so it matches the other side of the ifdef. Then you leave the macro
> outside of the ifdef and always call the function.  The compiler should
> eliminate the function call.
> 
> > 
> > So we get type checking?
> 
> yeah, otherwise a mistake like
> xe_device_inject_driver_load_error(&xe->drm) goes unnoticed depending on
> the build config.
> 
> The other alternative I proposed is to use
> __builtin_types_compatible_p() if we keep the macro the way you coded.
> 

Agree we want something with type checking.

> > 
> > > > +
> > > > +#endif
> > > > +
> > > > #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 5b7292a9a66d..3e620314eec2 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -484,6 +484,10 @@ struct xe_device {
> > > > 		int mode;
> > > > 	} wedged;
> > > >
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +	int inject_driver_load_error;
> > > > +#endif
> > > > +
> > > > #ifdef TEST_VM_OPS_ERROR
> > > > 	/**
> > > > 	 * @vm_inject_error_position: inject errors at different places in VM
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > > index 58895ed22f6e..8209079c0334 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > @@ -389,6 +389,10 @@ int xe_gt_init_early(struct xe_gt *gt)
> > > > 	xe_pcode_init(gt);
> > > > 	spin_lock_init(&gt->global_invl_lock);
> > > >
> > > > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> > > 
> > > for the ones I check before this, things are ok. For this and some
> > > below, I believe they are misplaced because this currently is not a
> > > failure point. Adding a return error here is wrong IMO because it
> > > changes the expectation: the function was expecting that after
> > > xe_wa_init() there are no more failure points so nothing to unwind. If
> > > you inject an error here, you may be then trying to fix a non-existent
> > > bug.
> > > 
> > 
> > I pretty much agree. I really hacked this together as fast as I could
> > without tons of deep thought as a PoC + to see what exploded (quite a
> > bit so far).
> > 
> > But our error handling should be robust enough if I coded this a bit
> > goofy, it should work.
> > 
> > > From what I can see, the a valid point to inject an error is always when
> > > we are already checking for an error (and if we aren't then we should).
> > > So they should be always in the pattern as the ones above...
> > > 
> > > 	err = foo();
> > > 	if (err)
> > > 		return err;
> > > 
> > > 	err = xe_device_inject_driver_load_error(xe);
> > > 	if (err)
> > > 		return err;
> > > 
> > > I think that also means we can do better:
> > > 
> > > 	err = foo();
> > > 	err = xe_device_inject_driver_load_error(xe, err);
> > > 	if (err)
> > > 		return err;
> > > 
> > > And in xe_device_inject_driver_load_error() we implement it
> > > to first check `err` and return it if != 0. This way we only even try to
> > > inject errors in valid points, and don't risk getting problems if a
> > > later patch mistakenly update the `return err;` with `goto fail;` in
> > > one place and forgets the other.
> > > 
> > 
> > I do like this (xe, err) semantics with if != 0, but think it should be
> > seperate macro / function than the one in place as (xe, 0) for cases
> > without an existing error is a bit goofy.
> 
> works for me
> 

+1

> > 
> > > 
> > > 
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > @@ -570,6 +574,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
> > > > 	xe_gt_topology_init(gt);
> > > > 	xe_gt_mcr_init(gt);
> > > >
> > > > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> > > > out_fw:
> > > > 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > > > out:
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > > > index ef239440963c..897815ddf954 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > > > @@ -57,6 +57,10 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(gt_to_xe(gt));
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index de0fe9e65746..980691c178c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -354,6 +354,10 @@ int xe_guc_init(struct xe_guc *guc)
> > > > 	if (ret)
> > > > 		goto out;
> > > >
> > > > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
> > > > +	if (ret)
> > > > +		goto out;
> > > > +
> > > > 	guc_init_params(guc);
> > > >
> > > > 	xe_guc_comm_init_early(guc);
> > > > @@ -411,6 +415,10 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > > > 	if (ret)
> > > > 		return ret;
> > > >
> > > > +	ret = xe_device_inject_driver_load_error(guc_to_xe(guc));
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > index d1902a8581ca..1944912ef9b8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > > > @@ -402,6 +402,7 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > > > 	struct xe_gt *gt = ads_to_gt(ads);
> > > > 	struct xe_tile *tile = gt_to_tile(gt);
> > > > 	struct xe_bo *bo;
> > > > +	int err;
> > > >
> > > > 	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
> > > > 	ads->regset_size = calculate_regset_size(gt);
> > > > @@ -416,6 +417,10 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
> > > >
> > > > 	ads->bo = bo;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index beeeb120d1fc..76a26aaabb13 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -197,6 +197,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	xe_gt_assert(gt, ct->state == XE_GUC_CT_STATE_NOT_INITIALIZED);
> > > > 	ct->state = XE_GUC_CT_STATE_DISABLED;
> > > > 	return 0;
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> > > > index a37ee3419428..f26c37e3ee3a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > > > @@ -82,6 +82,7 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > > > 	struct xe_device *xe = log_to_xe(log);
> > > > 	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
> > > > 	struct xe_bo *bo;
> > > > +	int err;
> > > >
> > > > 	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
> > > > 					  XE_BO_FLAG_SYSTEM |
> > > > @@ -94,5 +95,9 @@ int xe_guc_log_init(struct xe_guc_log *log)
> > > > 	log->bo = bo;
> > > > 	log->level = xe_modparam.guc_log_level;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(log_to_xe(log));
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> > > > index bdcc7282385c..1d52b1f57f4c 100644
> > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
> > > > {
> > > > 	size_t tile_mmio_size = SZ_16M;
> > > > 	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
> > > > +	int err;
> > > > +
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > 
> > > yeah... I think this is a valid one, because it means
> > > "handle errors from this function". As long as it's the very first thing
> > > in a function, not leaving side effects, it should be fine, And in this
> > > case I'd do:
> > > 
> > 
> > Yep, I think beginning of most functions in the driver load call stack
> > is likely the correct placement. Again didn't really have time to do
> > this perfectly. I'm hoping to find someone to own this full time next
> > week and your feedback here it helpful to get this done correctly.`
> 
> humn... to be able to set the value to an arbitrary high value,
> shouldn't we at some point force the param value to 0 so we stop
> checking for error injection after the probe part?
> 

That's a good point. Once the driver load completes we should turn off
this error injection by setting the modparam to 0. 

> > 
> > > 	err = xe_device_inject_driver_load_error(xe, 0);
> > > 
> > > to follow the logic I mentioned previously.
> > > 
> > > >
> > > > 	mmio_multi_tile_setup(xe, tile_mmio_size);
> > > > 	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > > index 7bb99e451fcc..972b64a9f514 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > > @@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
> > > > MODULE_PARM_DESC(force_probe,
> > > > 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
> > > >
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +module_param_named_unsafe(inject_driver_load_error, xe_modparam.inject_driver_load_error, int, 0600);
> > > > +MODULE_PARM_DESC(inject_driver_load_error, "Inject driver load error");
> > > 
> > > hum... are we doing this when loading the module?  I guess
> > > inject_driver_probe_error would be better as those tests are not per
> > > module but per device (and instead of modprobe, we could test by
> > > doing bind/unbind).
> > 
> > So s/inject_driver_load_error/inject_driver_probe_error/
> 
> yes
> 

+1

> > 
> > Makes sense.
> > 
> > Matt
> 
> thanks a lot for doing this and uncovering the existent bugs
> 

No problem. I have it in a working state here [1] and hoping to hand
this off, I think we may discuss this tomorrow. More error injection
points are needed and I suspect when more are added, more explosions
will be seen.

Matt

[1] https://patchwork.freedesktop.org/series/137114/

> Lucas De Marchi
> 
> > 
> > > 
> > > thanks
> > > Lucas De Marchi
> > > 
> > > > +#endif
> > > > +
> > > > #ifdef CONFIG_PCI_IOV
> > > > module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
> > > > MODULE_PARM_DESC(max_vfs,
> > > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > > index 61a0d28a28c8..409ea10be942 100644
> > > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > > @@ -20,6 +20,9 @@ struct xe_modparam {
> > > > 	char *force_probe;
> > > > #ifdef CONFIG_PCI_IOV
> > > > 	unsigned int max_vfs;
> > > > +#endif
> > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > +	int inject_driver_load_error;
> > > > #endif
> > > > 	int wedged_mode;
> > > > };
> > > > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > > > index f818aa69f3ca..8b278c83128a 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > > @@ -629,6 +629,10 @@ static int xe_info_init_early(struct xe_device *xe,
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > @@ -645,6 +649,7 @@ static int xe_info_init(struct xe_device *xe,
> > > > 	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
> > > > 	struct xe_tile *tile;
> > > > 	struct xe_gt *gt;
> > > > +	int err;
> > > > 	u8 id;
> > > >
> > > > 	/*
> > > > @@ -745,6 +750,10 @@ static int xe_info_init(struct xe_device *xe,
> > > > 		gt->info.id = xe->info.gt_count++;
> > > > 	}
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 9f3c14fd9f33..64d992c12364 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -231,6 +231,10 @@ int xe_pm_init_early(struct xe_device *xe)
> > > > 	if (err)
> > > > 		return err;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > @@ -264,6 +268,10 @@ int xe_pm_init(struct xe_device *xe)
> > > >
> > > > 	xe_pm_runtime_init(xe);
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > > > index 5a1d65e4f19f..1e738f1d80df 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > > > @@ -102,11 +102,17 @@ static void fini_sriov(struct drm_device *drm, void *arg)
> > > >  */
> > > > int xe_sriov_init(struct xe_device *xe)
> > > > {
> > > > +	int err;
> > > > +
> > > > 	if (!IS_SRIOV(xe))
> > > > 		return 0;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	if (IS_SRIOV_PF(xe)) {
> > > > -		int err = xe_sriov_pf_init_early(xe);
> > > > +		err = xe_sriov_pf_init_early(xe);
> > > >
> > > > 		if (err)
> > > > 			return err;
> > > > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> > > > index 15ea0a942f67..2d25c7b59b0d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tile.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > > > @@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
> > > > 	if (IS_ERR(tile->primary_gt))
> > > > 		return PTR_ERR(tile->primary_gt);
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > > > index 0d073a9987c2..a3786020838b 100644
> > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > @@ -62,6 +62,10 @@ int xe_uc_init(struct xe_uc *uc)
> > > > 	if (ret)
> > > > 		goto err;
> > > >
> > > > +	ret = xe_device_inject_driver_load_error(uc_to_xe(uc));
> > > > +	if (ret)
> > > > +		goto err;
> > > > +
> > > > 	return 0;
> > > >
> > > > err:
> > > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > > index 564e32e44e3b..e558715d8027 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > > @@ -821,6 +821,7 @@ int xe_wa_init(struct xe_gt *gt)
> > > > 	struct xe_device *xe = gt_to_xe(gt);
> > > > 	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > > > 	unsigned long *p;
> > > > +	int err;
> > > >
> > > > 	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
> > > > 	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> > > > @@ -840,6 +841,10 @@ int xe_wa_init(struct xe_gt *gt)
> > > > 	p += n_lrc;
> > > > 	gt->wa_active.oob = p;
> > > >
> > > > +	err = xe_device_inject_driver_load_error(xe);
> > > > +	if (err)
> > > > +		return err;
> > > > +
> > > > 	return 0;
> > > > }
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > index d3a99157e523..edaad1c93e58 100644
> > > > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > > > @@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
> > > > 		return -E2BIG;
> > > > 	}
> > > >
> > > > +	ret = xe_device_inject_driver_load_error(xe);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > 	if (!locked)
> > > > 		ret = __wopcm_init_regs(xe, gt, wopcm);
> > > >
> > > > --
> > > > 2.34.1
> > > >
