Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3A0C52D7F
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 21:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C7610E2C7;
	Thu, 15 Aug 2024 21:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BAGBN2OB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0B510E2C7
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 21:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723757936; x=1755293936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vhuiWAEDfII4PsZk7NeuDMENTGykMdqQ1ozdn3sFYb0=;
 b=BAGBN2OBqitO18eZYGdt2MIJjV1J1JKmyOhXMRl72WIwhZodQYZBjKAV
 rkr1MrqNmFLrCJafr9NBU+K+W1djwmVToD+tKdLxdAlpY4hlHtqNcqdxJ
 IZ3R07iGir1ULJxVoVEPJmGkOaSz7byRUfwaNjNyYUxdZsogBezsBzxiw
 lMJUnPGaY+rTF2kUb9DipR2+wm77qa1hhZX2F18+Z7lh0Kgv/sBuXq6S3
 FNsCJJPtiYfpmhLmZruRI10ZqRSB+4gt9hfHHCQcTJYFkYRQltj3aWS0Y
 6bmaXR6HILHg/itvT/wMH/3kdkjq8mZ58Cw0HslaIuOtufHjfJDPmohSR A==;
X-CSE-ConnectionGUID: zFCarA5nTaC2yMxUo+VoMw==
X-CSE-MsgGUID: FFnleKLgSYWDzG/B/7O1xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="32711993"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="32711993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 14:38:55 -0700
X-CSE-ConnectionGUID: AfG6CFs7SE6luRkVu83Vow==
X-CSE-MsgGUID: psOHcCXxQ/qG7tvGxzE7xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59470252"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 14:38:54 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 14:38:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 14:38:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 14:38:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 14:38:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXPDFnnOJsggD+n9q/c3KewwO3mtratbPlLYRqXCeFGI4umFp0HttX/fSfAvd2oixTPxBJoCQCEv8vwm1bejI90NOJQKsybAz1WIKw9EzL4CHaXb5mm7Z++RzEksUq/9nzuFFKCW3kGAbgcJUH/qRU+kpoyIal4K4tmt6Wn1pUKmgsfYNY2UNP2MjUmBJcm+hkngvx+t33YyvoZJPCMa8r9bxF9BGsJzJs0A7To30XQIh4JTJTup9BOZ/EGwW72w1DqSPgP/S2UsZf7i+uttKwjDzaC+g9eVJNmQ6+EMnMVdmWj0yEtK3WfqeTNu9cvIQIWxIuBLNwodQyjy0RZkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gZdJn3VOSIRfqEfC5b2+qwR+Z8btpdmS6suxXUg3Fo=;
 b=mkHja3L3u7HMmzA94RdhAXmReS4SDnxFMd3lJHBmYe2wqniZ7fj/Q5fsilXnv6dcPKLz/TtV+uK+PxupjwlqpMI2RPooV/bhznWuTGeWLejnp71rwAvxZTyIHijWu5myoocewXOVNEaFKonHeMyuq1ul39gZmnf+/48P12f3X9MRfH8pM3jDgoUnPXRBFahmYQwUhCWcyrzsmTH15d+lkkQUPHpy+bbTdtJBN5kMCY3yinK3q3wRHuW56SURn9o2CQV7Fo0dlTIHGNeq/zsQgM5kRpVN49KJz0fPcHVHWYWfU3arAZWpLjO2OpGRoklbus6PcTPS/hccaZyRqrKWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Thu, 15 Aug
 2024 21:38:50 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 21:38:49 +0000
Date: Thu, 15 Aug 2024 14:38:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?iso-8859-1?Q?Jos=E9?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add debugfs to dump GuC's hwconfig
Message-ID: <20240815213837.GJ5774@mdroper-desk1.amr.corp.intel.com>
References: <20240815172602.2729146-3-matthew.d.roper@intel.com>
 <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zr5gTbtkpfqlGgsx@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 82afac73-83e9-4e7b-2acd-08dcbd72a67f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zz5vStWN/+0Cv2q7SsYG0kOreTssRKV5GkyU58z5oB9uuxlR8NHz8CN0QWl1?=
 =?us-ascii?Q?laFg3zgnA2jW5hMEWc9GhrOm70fsVH5Ew/zskWY8RumwkjNAhzQj05jbawsO?=
 =?us-ascii?Q?liVPT8IiNGpdbpOrMpJnsHtuYDk3DwOBPL7SxgL24ifjELWfMqoYbCFhJDyp?=
 =?us-ascii?Q?b4vsX4swlrungcpmcSKB+QaZP1/jbj6JP6AmK+D6s9Pq4Ka7MWin5lXL22iY?=
 =?us-ascii?Q?J01xEb5wEar6kCgkJrqHp+/EOkDdIo2giC5QCt48yXYK+50lE9PZO8+TXff3?=
 =?us-ascii?Q?Fe/pMYhclkiLPJbB3qhkUOqjCcPIV5npICWcz2svgdJTWECjFWCtdyw15OV8?=
 =?us-ascii?Q?9R15iCnjnCl+IyxwQ4dNyAKD53rXsH7Pn4+OHur83uChL9Uj5hlnJeAsnGEP?=
 =?us-ascii?Q?a1URsR3/Vx2UcLrkrcaHCPXdDxGB6k3B28wWcs4iLtuKSs21sUSloSsE7qrW?=
 =?us-ascii?Q?cfQs6j3BjEmv2rOP3mih/9NlQvkhhZ1A1B3LSly8bJdAjnnnv18XLlFtRVPC?=
 =?us-ascii?Q?vKoOwCPNap/rCyzB9E/uns7eA7HENM8EPdeCokYpkCQWqyf4JPFd7bYvBfaU?=
 =?us-ascii?Q?gsZJzX7yWVOp/sIePQwTm+h41FqyifRRwV1ygYm8mLvYrK/WeI4bshfssbUG?=
 =?us-ascii?Q?KD6VsP0AF3LMvyn2NhI3iWjGdF1gZhUgGcDij7UwG/xG9n2RZYv2XDglD0h4?=
 =?us-ascii?Q?8yZ0OOw77GYCxw+wGtbfo+qBc3dDHYrzrxu3bf3W52vLwIN+6TdxXv4yEIjW?=
 =?us-ascii?Q?91LC5YrGukN6QDOaEFMrKt2+BWhJgNrqIFkQ9ah6zHDQxOtCM0NAmonOClpw?=
 =?us-ascii?Q?IbSksEQ3zhxrg2H0pUIWQ6cYSyymbs/p6sRiwqcCpHZH2XQIWQaeTbfvlUj/?=
 =?us-ascii?Q?5jJLhKYFyVlCC3CWNnISoSRKoGUxx6RmisE7KVOvPwU2qSWi5XQsunBuuo0g?=
 =?us-ascii?Q?HCXnlm8v5U7KPCg4Wkzlr4+mgrqTCrVbuZFZ1+xc0T34haWX3dr2P/ru8GVw?=
 =?us-ascii?Q?aIIZvdhnkT0H5h0JVH6A0960sLBHr1DaKowV7So2ywFE7CqWkPpHNgbqYPfA?=
 =?us-ascii?Q?FMmrloekMeUUFVLk26W6pGTZu35nlQiI2e9gJVIg+6rA5bmKpl375nOpAGis?=
 =?us-ascii?Q?btHzkkF5l7xuwanq6c2uXJvEJGJz3ry7sHypDNQ6TxAYvjYt54FFYwcGNvoz?=
 =?us-ascii?Q?lKxBv8D1KuGxxKYRbnkKe/kjtq9CA/Kk9h0/xLJ4psg5QTKPPz6NpBnMogrc?=
 =?us-ascii?Q?5GLdty/LUE+r7CIsz7MM2CMwdHAjKKXMNqpwKV9SeHNmLqbsYAxWeW7lJ4zd?=
 =?us-ascii?Q?N8JH6wiTUA0maDp6xClioe0VeCxFoFUhmwdpsMExX1k7UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XDvVE9/J8re/7XV534P7ikoDBh8jiz0yw2qy9LSbzNVQnaErU8DGLy7tJYaR?=
 =?us-ascii?Q?Y271Xt4TKooOeEL0JazeJjWYAaRx7SyU6K7Xzg3DOVn5rcwmWljselKnB+Ig?=
 =?us-ascii?Q?4tIjfl/+ZeSqYUc8pXjl9QrHHJxYiYte97QYH5hfMwZkaGy7wVT2wiziAXgJ?=
 =?us-ascii?Q?YX7ZJTBcWdIXXsAqdnvGoeP0J5KI5Iggc75Wvt104+QQFfoOqdG7C5/kq37X?=
 =?us-ascii?Q?voLQtrd0VDx9t0Rj5M3LeXFzYZ7e293zaoDGAJboCK5+hMwT02MOUtaVm3vA?=
 =?us-ascii?Q?ksHjqUlVupjqr/C5T48KMGh2uieMjLLJ2arkOz6LZDZF9sU9i8kRg0FQaqpx?=
 =?us-ascii?Q?tk/I8EX9v5izA13AhVDhaFyYO2JUzxD0ph8mwatnLK56nBUvx2pqPes+muJW?=
 =?us-ascii?Q?eFrptomOsFteGwGtRKUbeegW7gJ9h2OFMEDnIcMoImo+wWFT2NtabSWwSYoF?=
 =?us-ascii?Q?zknkzang0uu/yua6zb90jg7peWCviM6ThcEloQ1ULI5a9DigJMQIExcc1mvJ?=
 =?us-ascii?Q?WiF67xqqAx6DSrUJ6d5po554S1RsPnqeiqlZpbFfGPWtnqaU6XBXlc3E5sqD?=
 =?us-ascii?Q?aIxyGWXAu4FtDNhPRiA14vcsPN8WU8WKhN8wqQlmO9XIPYYCM2EP5soNsQvD?=
 =?us-ascii?Q?4aVtzTchZqkB8nqTgxZO1jrQmDp7/PJ6a55LO+8ALAsZHTmleX1slXmojJpp?=
 =?us-ascii?Q?kw39hVY0KgW01L/uzjSgGum2EjKCCc6ijp0wlS6eG6hTcLEGMwQmYlSmgVOh?=
 =?us-ascii?Q?9eevU/PL+5pKKG7LRX4gfQ4TZb7ocW+Its7wRW2Sq6+1EMcdSoAy1kVUtHuq?=
 =?us-ascii?Q?SJ7aP3JYbh26yyYg+xVJ/73Tzo1gnFgjSkT8HZVBaupgWciaS49KWh0Uti2p?=
 =?us-ascii?Q?JWqpGhHpYBys7ua8/Pg+W/ywwIT7oR9e89FOmVNYf/mvK3C9kdeyefT382ir?=
 =?us-ascii?Q?zukaVsMO4BV8sFAdqUEIZcr5QO5Pm97LGBnefKI9WAV1VvVnF2ceDLmWz54D?=
 =?us-ascii?Q?B07NpMthsTbdUScaRqipF7TnDipoU1g7yQ6YxaFRajFm+ng1EgOrle2qpQmu?=
 =?us-ascii?Q?6/LrxyCkvwxeNeeHyiA4UCOlPdC5N88jS3rvIrtOgiTk2QAzt32m3aASLHAf?=
 =?us-ascii?Q?Kl/we82g1znxDfdkISr5x0buehfJGY181812xx8g3XlAqCoed4Q36BTyyYh0?=
 =?us-ascii?Q?6EqWnSl+KnTeiQtaLch5nSsgHaah0kFeg7ZZUpTJExYORXaPVj4BRe6dLj9H?=
 =?us-ascii?Q?u/t1AC5viT8S86v5SJ+r8VrCPur421VsDMDbcKFn5GT0qdri7P1jidREgST3?=
 =?us-ascii?Q?5ryPMT9jk87mFH3ZxoQJ/XFhALKQyeOsqeheGhnOSv46RyOiMzxYx128ah/1?=
 =?us-ascii?Q?jnzV7271HtGne8F3zXyN/PzFm27Y+JKA3CMQgwOIf4utzlXnX7ykGfnfRXiD?=
 =?us-ascii?Q?9diyFuX0Hl8OQNUkbJ1sRwLNDEQ3Rj5+cEmYi6+UiqCiPOfFCSdR3kCmR8D0?=
 =?us-ascii?Q?PIRpM2rZPrenay+frhIyYM8VjA1uYlZ8YCEy4CK+3QFQ8yufqxHYgNfEQsTw?=
 =?us-ascii?Q?LJAMYoJeiBVAIS445OaiCq8hwhfbIwgaGIeDgUGbgkblOraKSwBOmC9q7QU4?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82afac73-83e9-4e7b-2acd-08dcbd72a67f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 21:38:49.8091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgjY/VMLuz1tEiX3d2mJCvCdt925M6bCPmpCzUrHvEbhRDnwpBUWajIj71HfmBSoP09OUUSjyTSIMhe5CifKL1dcKJZkdK7PmrnxY3/dFBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
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

On Thu, Aug 15, 2024 at 08:08:45PM +0000, Matthew Brost wrote:
> On Thu, Aug 15, 2024 at 10:26:03AM -0700, Matt Roper wrote:
> > Although the query uapi is the official way to get at the GuC's hwconfig
> > table contents, it's still useful to have a quick debugfs interface to
> > dump the table in a human-readable format while debugging the driver.
> > 
> 
> Patch itself makes sense. Question though, would this be useful to
> include devcoredump? If so we should code this with the snap semantics
> for decoredump. See guc_exec_queue_print() for an example of this.

You mean include the contents of the hwconfig within the devcoredump
report?  I don't really have a feel for whether anyone would find that
useful or not.  My personal use case is just being able to sit down at
an unfamiliar machine and 'cat' the debugfs to see what the hwconfig
characteristics of the GPU are before I start doing experiments.

+Cc Jose for a UMD perspective on whether or not it would also be useful
to capture the hwconfig contents in the devcoredump for userspace
debugging.


Matt

> 
> Matt 
> 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c   | 11 ++++++
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.c | 57 ++++++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_guc_hwconfig.h |  2 +
> >  3 files changed, 70 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 5125d76ccfac..8f95d3a5949b 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -19,6 +19,7 @@
> >  #include "xe_gt_sriov_vf_debugfs.h"
> >  #include "xe_gt_stats.h"
> >  #include "xe_gt_topology.h"
> > +#include "xe_guc_hwconfig.h"
> >  #include "xe_hw_engine.h"
> >  #include "xe_lrc.h"
> >  #include "xe_macros.h"
> > @@ -270,6 +271,15 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
> >  	return 0;
> >  }
> >  
> > +static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +	xe_guc_hwconfig_dump(&gt->uc.guc, p);
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] = {
> >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> >  	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> > @@ -288,6 +298,7 @@ static const struct drm_info_list debugfs_list[] = {
> >  	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
> >  	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
> >  	{"stats", .show = xe_gt_debugfs_simple_show, .data = xe_gt_stats_print_info},
> > +	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> >  };
> >  
> >  void xe_gt_debugfs_register(struct xe_gt *gt)
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.c b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > index d9b570a154a2..025bad701556 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_guc_hwconfig.h"
> >  
> >  #include <drm/drm_managed.h>
> > +#include <drm/drm_print.h>
> >  
> >  #include "abi/guc_actions_abi.h"
> >  #include "xe_bo.h"
> > @@ -103,3 +104,59 @@ void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst)
> >  	xe_map_memcpy_from(xe, dst, &guc->hwconfig.bo->vmap, 0,
> >  			   guc->hwconfig.size);
> >  }
> > +
> > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p)
> > +{
> > +	size_t size = xe_guc_hwconfig_size(guc);
> > +	u32 *hwconfig;
> > +	u64 num_dw;
> > +	u32 extra_bytes;
> > +	int i = 0;
> > +
> > +	if (size == 0) {
> > +		drm_printf(p, "No hwconfig available\n");
> > +		return;
> > +	}
> > +
> > +	num_dw = div_u64_rem(size, sizeof(u32), &extra_bytes);
> > +
> > +	hwconfig = kzalloc(size, GFP_KERNEL);
> > +	if (!hwconfig) {
> > +		drm_printf(p, "Error: could not allocate hwconfig memory\n");
> > +		return;
> > +	}
> > +
> > +	xe_guc_hwconfig_copy(guc, hwconfig);
> > +
> > +	/* An entry requires at least three dwords for key, length, value */
> > +	while (i + 3 <= num_dw) {
> > +		u32 attribute = hwconfig[i++];
> > +		u32 len_dw = hwconfig[i++];
> > +
> > +		if (i + len_dw > num_dw) {
> > +			drm_printf(p, "Error: Attribute %u is %u dwords, but only %llu remain\n",
> > +				   attribute, len_dw, num_dw - i);
> > +			len_dw = num_dw - i;
> > +		}
> > +
> > +		/*
> > +		 * If it's a single dword (as most hwconfig attributes are),
> > +		 * then it's probably a number that makes sense to display
> > +		 * in decimal form.  In the rare cases where it's more than
> > +		 * one dword, just print it in hex form and let the user
> > +		 * figure out how to interpret it.
> > +		 */
> > +		if (len_dw == 1)
> > +			drm_printf(p, "[%2u] = %u\n", attribute, hwconfig[i]);
> > +		else
> > +			drm_printf(p, "[%2u] = { %*ph }\n", attribute,
> > +				   (int)(len_dw * sizeof(u32)), &hwconfig[i]);
> > +		i += len_dw;
> > +	}
> > +
> > +	if (i < num_dw || extra_bytes)
> > +		drm_printf(p, "Error: %llu extra bytes at end of hwconfig\n",
> > +			   (num_dw - i) * sizeof(u32) + extra_bytes);
> > +
> > +	kfree(hwconfig);
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_guc_hwconfig.h b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > index b5794d641900..7df315900e1c 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_hwconfig.h
> > @@ -8,10 +8,12 @@
> >  
> >  #include <linux/types.h>
> >  
> > +struct drm_printer;
> >  struct xe_guc;
> >  
> >  int xe_guc_hwconfig_init(struct xe_guc *guc);
> >  u32 xe_guc_hwconfig_size(struct xe_guc *guc);
> >  void xe_guc_hwconfig_copy(struct xe_guc *guc, void *dst);
> > +void xe_guc_hwconfig_dump(struct xe_guc *guc, struct drm_printer *p);
> >  
> >  #endif
> > -- 
> > 2.45.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
