Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703E2CFA45C
	for <intel-xe@archiver.kernel.org>; Wed, 23 Oct 2024 17:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1696D10E84C;
	Wed, 23 Oct 2024 17:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GvXezOtT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121E810E795
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Oct 2024 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729705333; x=1761241333;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=izQKqd6oA7efNqg76ZwQCdXHpaUSF0WWILRKYopASgk=;
 b=GvXezOtTqZHqLqarSNPBxoZllU9KQxN88OZwzuJuF693AZK/uJw06Spf
 cIIy+5PYhuGRZtMEeIlunjP4bW+t0NxLWY5JgD5KuuiPLm2fzqXJ2IGQA
 scQA8lZQWPOZYVOeabMPg/z747WGWvZL5AP638pAnRrFI4AdXUPMVV5f4
 WNXmA7ybhl7yASRms7eeeBQuSl77IAo307qnKOjdWZ4D0M02S3b2sNeIe
 +aczjOaPPD7sISfsNyDNxrtpcrbwRu0TwWB2GS8vVnY2WdTuldq1mlCOo
 X/4ZXSex7pOIoJj9bNou5B1pGY87ldoNemCxJyUYDehYeGrZ/zPmdjbFr Q==;
X-CSE-ConnectionGUID: 1E2DMO1lQw+5b6yAHIaSBA==
X-CSE-MsgGUID: DUTkTuHHQrq9o2HaIdMGgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33222621"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="33222621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 10:42:12 -0700
X-CSE-ConnectionGUID: LNPiQcKRRqiSnt888LbkJQ==
X-CSE-MsgGUID: 51x0l1s3TTOu++/DdrNkrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="84907637"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 10:42:12 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 10:42:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 10:42:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 10:42:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vA9Rm7FuZgVnnTkMIXn2WRji8QAI2v+FFPWgwH5Qqg8emlNprQKpTLRYNmxXoEryiY7cFjPx2lvmdJ5TnkFsYNQBb0MnxaZHos06TJ8KKkmRehCqP+G1g4DAVwDucfOey7qQxy0hsxqPujujHbgjudRrAZuTZcMYAp7fdoXPEnxiRZkLLebfMya4fyTxQAaF36i50OLfuv9kdkpNNeyJH0kDJql36mwkZ8YJ+CgQrlzHC/9zDgFCOm/d+reLwUqFR7pgA1GTILsG7qnkNFxPhGaRpidMl5weoQ9u+H4LILPYPK/+gv7rVsaQVTIwhx1Tg7fLbiuv3WbDjSj04PEuPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQKUeIcETn6uIQLMCcgAvUeuBbk+T6767jaAf51kT4E=;
 b=VPaLTIrDDty9x94OIaV+2N7JZmQfdqhCKenZBwnD6qJMcdLki5mK1B0f/oxBfRXCpB3O7bNOtBVmllZErerSh9dEz5RsKpUV4cLwadeqhtdBEL8YsmQTDNgOiYN+NrEJYM37i35fPzMm0WOYb6PEXqd5VuK3GeDa3jdK2BzLWuJY0KY8/mcoGcNetxfDBMOp0yFnQ3szVeNG6PnxmXLxlKcIv0KbuCWOmgPE1UCJgNP2Yr3FuiWN8QlZ8au+J85320j5oTe4wBrl89Ib7JpUNiu84GVzG+BmkQwn2Sk8bZ+f1H3prMe5QTDtQ5fr4yRg5zIs4CBmRgOfG3q6OMeDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Wed, 23 Oct
 2024 17:42:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 17:42:08 +0000
Date: Wed, 23 Oct 2024 17:41:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Justen, Jordan L" <jordan.l.justen@intel.com>, "Briano, Ivan"
 <ivan.briano@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Don't short circuit TDR on jobs not started
Message-ID: <Zxk1XqHRi90GG89g@DUT025-TGLU.fm.intel.com>
References: <20241022232756.1769013-1-matthew.brost@intel.com>
 <20241022232756.1769013-2-matthew.brost@intel.com>
 <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1a5852ccbf8713023a71fc435038a80546801746.camel@intel.com>
X-ClientProxiedBy: BYAPR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e7cb4a3-09ca-467e-d6a2-08dcf38a0448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ukhg7uqOBVqc508p32UGStZ2iD77RYi0VmlVZVeeTrz8owSjUFl8vGMkrh1q?=
 =?us-ascii?Q?Z3xw86eDVczmxw91LloZc943UaOt7QHiVjf3I1HD+2GleQNcI7Hq4fSB5N1X?=
 =?us-ascii?Q?UkjEdwq2PBLxQJ6CKCZquFHnvuRQDg+t5Zqwjbq1FOxXYVNEmRKElO70xOBh?=
 =?us-ascii?Q?zcPGxizbjbp+dZTSlHKYe+/HsZGZzfyD5oK4BCc1H4sTBsvwukZmlg/c+zEE?=
 =?us-ascii?Q?PfzUNZB4eACdk6gJ/hiirlc5Dul/CKTNAio3zIg1/8vSt+gT/0TTjuJR04Zb?=
 =?us-ascii?Q?pSxbhpPrZy8VO7D69Sbxyy5Xub/+M8/sCi1RH56qqjXtzFxQA8quwP6cmo1K?=
 =?us-ascii?Q?vHnyCQmNOmln+u4HsqRYaBmS+OAtAO574XZBAuF8W+DDNFuxE+VS69pNcDSj?=
 =?us-ascii?Q?Ef1+t52G81Ko7bXLL8aF8UoafasxqCP0U3HAqq55Qu6YgaPWZHWwKipfreYw?=
 =?us-ascii?Q?Ke0e59EF1n2jaeI+Ykjg0QEQYYLZTMIw0+C8myn22mWZwFfahFNfG3/MBkjr?=
 =?us-ascii?Q?0gFRtune2YvLVQJ8Xp+hT56wl3UmuDK6OgrhbD0rBGUiVT9lduin5xXchB/F?=
 =?us-ascii?Q?ltlZrBv83aJtNaRniSKckSdRrRNdsErHwWPBeqZQuhELpikkhOVgSZM0AY3V?=
 =?us-ascii?Q?MUzcDdZuDnTKXlt60ekanhJf5Qaz+08rtBI5ClSpCHvY5NbtVsMDriZSrdCv?=
 =?us-ascii?Q?gwuPaZ6E+WKAtTa/1+oJXYIGwkrdCf0cWfcp6Vr4O/GPr9kN4t37thYi60og?=
 =?us-ascii?Q?cpvWOCQ2jYVRENuULGsUS6T7syUMt0nUNJ7QY9BPNfQxtPzeAbU4yvz7oUD8?=
 =?us-ascii?Q?VZYwRqavfyf7GMs1bhY8zrA+AWmiSNK7XLeGWuw+g7wXVAiaZI3hKJ4wLL4T?=
 =?us-ascii?Q?13iGNHvN46t2rVGSgHMwGBySX53V0BP9II4ynDDZ/wv1Bd5sGRD2NowZRdLp?=
 =?us-ascii?Q?YOq/JV/ir32Y0bq2xD7btuD/M87l+lPMZJYEJpydz1QxXTeiJT33BaTC/bJZ?=
 =?us-ascii?Q?sXQk5xDNYJoC3EnU5mcEf8DCyd7zmynbdIiKlUtRKkpSIaZbMtohyILOIX32?=
 =?us-ascii?Q?yicGyf4OZHg9h+HqhjXXRImrvdy3EjJ/r9PabBxj+/lW2LZNXqIRPVkLTtJp?=
 =?us-ascii?Q?54iZj+tfIg2dlhqjEqgEDn423oULp48cmOlJQ2OydIkcQVnUD60EzdIxgkIK?=
 =?us-ascii?Q?FB1Oq9Olxus3WV6UMsU0ruyjAvD5p/0QZfvDQyjhrYPRGhO+oUU1LpGXHWgR?=
 =?us-ascii?Q?wu7GTINHUYww6h2j86VDNj5paI+J+UX2fh4ZGlW222f3uYQ35yEJG72e3JNL?=
 =?us-ascii?Q?PW+cPfJ6HDbCL/Ire0rxH83l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FY1EQfmP/PE+b7/fp4s/qPmV73xEn7mjKnm8oHdEhcsfBCX48aWLFxW7urpf?=
 =?us-ascii?Q?SW0d992b8U90nNetGtCBxsGRtTtiWj7W9UnPqIoWCaMiZCGvIwm5j2IXICmA?=
 =?us-ascii?Q?E/q9YgXnW5Aam4T4S5PjrfcI3kkpEOIqVkxDaUPF6hDBVUBOVE1IGMWN7lZ7?=
 =?us-ascii?Q?c8Gl+ij1GgYBF+2Kj60rPSN/BqJKx1nqYnL23g8wTQc2SWuRU3lRPzm6T17e?=
 =?us-ascii?Q?uGeO1Rt2MGTwoO+4CXq82ghm3fFdynMbwJqMl2BNwDud8HaSFkyC0bVlqtC+?=
 =?us-ascii?Q?i1RW7pEKxbrPyeM5QR/w7UrjKSq722gfk+f5+otU3M0tkQzjKSuoPBQ85CwT?=
 =?us-ascii?Q?ClZNQieDkqb0/F+E7uZG6SCl+v0fI/Y8/iSmiRqYg9F3Efn/p7DmzyyecjHW?=
 =?us-ascii?Q?QY/lifaogLuMJ28BvtQxP3yW1Jye5pUjlNOcPplJhEphMkPJFCP8OIraJj8p?=
 =?us-ascii?Q?bJHZ5HHtg5hNf8vA3tA2j9wWuuofH7ZHLJ+n5KbNy6wuU/z06cJn77yX6nwc?=
 =?us-ascii?Q?/+SA1tJoX1hkX6vm3Ok25FSHjSLS4NTSaMBWxRU0KijnjWjfKzJRdNp9tK5o?=
 =?us-ascii?Q?uXdqCOgsB7ogdIXCjJRpxCIXXmGPi6YCLk863NKjJ+3+7XCRoidHbkLKeY+x?=
 =?us-ascii?Q?aGsn/aEe0EW9JVHtLoff8zE0VUYYzgKzCruyR8PEPwVXX2vRji6xEUMk4xkF?=
 =?us-ascii?Q?SuXmkwCVKETSXmGhE+6PvxZvWlrbMH1TwOBdC9ZUmcBIieE1cWoxtc6cxick?=
 =?us-ascii?Q?k103C0hwCHrxisOr/ikStY6rS0gaa3m3ND7Y5hdBcEFcPUG9LpNomNe/TdUZ?=
 =?us-ascii?Q?w4XgOhX75t9pxbjVfbwnJPRMbHeudLv8yx2Apr+AJflLKqVn2dd4UVXDRUjQ?=
 =?us-ascii?Q?F/0Hz/0dAeRFny1XHSFpjYqodsFpsoqwX3qjD2LO3Ley/pbbzeIvfRHNc148?=
 =?us-ascii?Q?B5ipoLgQwmOOHEOvM/y28rw/oopXtq+9n77C8pYkfsEszJy0PSwThhdUbXKZ?=
 =?us-ascii?Q?b4dOfj7ferl4L6nxnS4FyExr0UuTefM73/wzTVOJHDpKnsAkGuPlHlBoXJOW?=
 =?us-ascii?Q?WF1zZqedYH4wcnXf3bRrqMB41+zpRYEQLSXGXk1WzSKG0S9+ORnUdXBzzi0A?=
 =?us-ascii?Q?i0sCAuUsAizloX0Yu49Q2e9tz5c2ZoWOMtjoIP9vLl5RXAGt6EUgXUaQbFhu?=
 =?us-ascii?Q?4+Sr16++WNoQUzmpZMMp71hOEwHntYGbFSJekkg2CMZtHJEeLATjova+e7M7?=
 =?us-ascii?Q?yOp6YViEzAQG9osnd0iXfxIDqbkkkwxzdGNZTaBEeNQ1vxIyIoWOAUzzvQbO?=
 =?us-ascii?Q?4aFP4cdvb0zl29vB4ziVTQfP9qm3sArddnp9HkOs9coqn5rT4RiGp3e9Jl6c?=
 =?us-ascii?Q?d2ePft1X6nSNbbrNck3K1pu0oe8OPC/lDxsw6SAFnzk4DIbXOjFOGE2A4jid?=
 =?us-ascii?Q?6t6ToHvpI8sSNs+027nRH53/kh6syyQyDgiaRcSuxtjb1+eTrjho3a2Dtt4h?=
 =?us-ascii?Q?T1ynhDDq8b7M5RCX5+nAxVL6R/4lf5qA0G7tI6TmPWXq5EUPtdNRW9qfdRmm?=
 =?us-ascii?Q?hf1UGlxKN+vgNYGFkkgo8IycLiIdIX/gO5IcCS2PcteZkQcnve1PZNoECpbV?=
 =?us-ascii?Q?jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e7cb4a3-09ca-467e-d6a2-08dcf38a0448
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 17:42:08.4523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nyDz9Dqh9Qx70KGQTAoka5TqtX5jtSjMp6ZEIJBTIkyH80LCuB8ui0lrOYKdTZOsCHe0Swg/7isee064XOss+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
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

On Wed, Oct 23, 2024 at 10:47:05AM -0600, Zanoni, Paulo R wrote:
> On Tue, 2024-10-22 at 16:27 -0700, Matthew Brost wrote:
> > Short circuiting TDR on jobs not started is an optimization which is not
> > required. On LNL we are facing an issue where jobs do not get scheduled
> > by the GuC for an unknown reason. Removing this optimization allows jobs
> > to get scheduled after TDR fire once which is a big improvement. Remove
> > this optimization for now while root causing job scheduling issue on
> > LNL.
> 
> I just tested it and it seems to do what it promises. Thanks! Having a
> 5 second hiccup is still horribly bad, but it is - checks math notes -
> infinitely better than waiting forever for a syncobj that will never be
> signaled.
> 
> This patch will *tremendously* help Mesa CI, since we can reproduce
> this bug all the time with Vulkan CTS tests.
> 
> Suggestions:
> 
> - Can we get a message on dmesg every time this hiccup happens? We're
> not sure if it's happening on real workloads on people's machines, so
> maybe having some sort of indication "oops, we just unstuck the batch
> you submitted 300 frames ago!" would help.
> 

We will add 'notice' level message if this occurs.

> - Since we don't know how long until the real fix, can this be tagged
> for stable? If it turns out this requires special GuC, it would be even
> more valuable to have this in stable since those tend to take more to
> propagate to people's machines.

I don't see any reason why this can't be backported, will include required tags.

Matt

> 
> Thanks a lot!
> 
> > 
> > Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0b81972ff651..25ab675e9c7d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1052,10 +1052,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> >  		exec_queue_killed_or_banned_or_wedged(q) ||
> >  		exec_queue_destroyed(q);
> >  
> > -	/* Job hasn't started, can't be timed out */
> > -	if (!skip_timeout_check && !xe_sched_job_started(job))
> > -		goto rearm;
> > -
> >  	/*
> >  	 * If devcoredump not captured and GuC capture for the job is not ready
> >  	 * do manual capture first and decide later if we need to use it
> 
