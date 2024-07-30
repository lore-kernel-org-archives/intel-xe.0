Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7252DC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 22:43:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A44110E5A1;
	Tue, 30 Jul 2024 22:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k7Ap4hDY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39BA10E5A1
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722379385; x=1753915385;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GmuFmftm3fTBcrsggot8B88esd99Urb/YCtt5MTkVOM=;
 b=k7Ap4hDYHCTFHFkLvdi7UB3ZIkDB0vCs0f2HdGartdxVw04R1yrJP9F4
 cRNML8Fb1RT+7nQJk/OyROoytqBGF2PWViSb6aGn7VzToksRSqgjw0xB8
 pdQi3z+moipKnwG74cWxB/AU9FsO9NMlAT5y7j9/s1ry5pK4Z0/vWG2hO
 T6X/bnkROJJ80lTMtEbhK7nMndTQUcbk9yeRtKxbgTE/uNGovRMomyr2s
 KN1TVJTLb/r1lE02vvqToRrpzRhL/XG4biTraxTymHEhHFPrH5NQwBVXH
 pH4DSegnVw6x/8ajGuw0B62IinnZV9gYMEb5xsZtJDfxHWEtxzy858gDZ w==;
X-CSE-ConnectionGUID: k6BZCg+fSa27bCo8ruo6BQ==
X-CSE-MsgGUID: 2cKypTVwQpGx8dTj2gX5hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20115389"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20115389"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 15:43:04 -0700
X-CSE-ConnectionGUID: frDuczPWRZeGEHyjrosk6w==
X-CSE-MsgGUID: AVTVtV3XTG2E8YuOOzFMWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54475228"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 15:43:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:43:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 15:43:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 15:43:03 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 15:43:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKKU/4w5UUDc/MeY2Z363xWUGVd3KPqeQIf2p/PFBTgqc8VFNQ3bccXpV8lE/8hTw4iADDjrzOaKNOYtWQ6DeJjJq46sKtKo3X4sGNt2249+OuLn+d9wsyDYo1efLWRxL1q0h5Y+JCqEjXc3jz3ApMaMwwjZPOdfBJLTLXfw68l5uJy60ZzSBHYUlmgxIJRUpcBYD6/N/6Cj2lqErqZZzTkuKqQRXtuS/DK16p8+v+OLk1JdthfVadgj19IDthyGO9pd1pa5YYF8cGsYrn9oQboG7xDQmBFoIjFC6EEDxD1RugK6GejM5ib3NMqnwjV+njiIe/d2cemNDkThsVtPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1D9Fh0v30lNIyq4v1n25CktyNQvo+1+NeRhDl3RsYI=;
 b=wEnlXsZKGrRinxik0znyT8A51bvWBwTmYjpvuYX+G+5dTYpxgAALSDLw00OzpdRt0CIYx8UGiRK38SHVKYYGX7O26PDSVXvHwyZLFstctyYUF1GLtxSto7vsVKye2o852jkHq3zI/gJ27XYmgX1SdGatFErhDGVtF0yN1LPw8aa705g9hB6i9TkjutLu7zXoD/DDNavlP/z+DNRxiYuMGPYMBV/S/vZGt+P+1nMbtsePg3NiN/2jzeQzL7Sbz4PK6aOiAtxuuC4NUCoyHMXg1aJ0dggYmM1gkQ8V368qqgiAOZGzzez8gGOSIBc+2zCyw300JZ2MKD25m0LN45JqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 22:42:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 22:42:59 +0000
Date: Tue, 30 Jul 2024 22:42:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2] drm/xe: Faster devcoredump
Message-ID: <ZqlsQEMZGhekGMGs@DUT025-TGLU.fm.intel.com>
References: <20240726052101.2069493-1-matthew.brost@intel.com>
 <7783452aa26ca547e2ac80fca1ac752574c49f2d.camel@intel.com>
 <abcc60c6-acdc-45f2-8b30-fa30bfd19461@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <abcc60c6-acdc-45f2-8b30-fa30bfd19461@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0012.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB7151:EE_
X-MS-Office365-Filtering-Correlation-Id: 4218f7a6-0ea6-4a71-d950-08dcb0e8f6a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2yY1Xhi4m35pUNTQ/TD4Syg9mtod64Ie2B42q5Ocv7HIqBYy7XN/ZiksPsot?=
 =?us-ascii?Q?JNQJGQ9GNpBJo7JVMEXo3kAgUesw/GEbEoLCJXXDUeVEfhisflcRY4F/VGGS?=
 =?us-ascii?Q?wvXZa7Yo3uqzBuNKsZeatBUxI/HTfRA6D0gBGSBKMs0qSYrrTTV7IsCPGcIK?=
 =?us-ascii?Q?h072vHShwh7lrAgh82NAuHRPlwcXnREcPJhpXWVkK/sOgMtJNYk7otyPAKew?=
 =?us-ascii?Q?j7+aA0ULCuWPUuJitfr4vz9RATfy7Sml96sZKgUI/mqt1HfzvZAU3H22lw8F?=
 =?us-ascii?Q?nMlitAWJS/89X0s59KQMk3POJQ2ZqLQD5GCCdfNJxxf72hfJALV6iul21r4V?=
 =?us-ascii?Q?C/q/C/M/aHipu1uj3sNFWzZUeJJLdfBZPDlvfTr7RXCos+ONmbD1LlT2j4nY?=
 =?us-ascii?Q?uTcuf1Wxdq5XNSxNncN2TZ4L8BqjiOxSKM89NWSKxmaEjN0WuR/FYmNCX9b2?=
 =?us-ascii?Q?3aG8vt5DjW6iQ/PooqckJ0sDKWyuy4GLUpem1RVzpvv3SdZ0Z+9TIqKHqN6N?=
 =?us-ascii?Q?JrRX7hF5hrpXjl7nst4RNLLELJjRrv6f/cm2h3HLVBSX7OkIv1/wJNSiumNE?=
 =?us-ascii?Q?ZyE6RjVgaIQ2gFbCF+OIZQwBxrzUWURHXuaiNkUlSUvQxEwT8BGC7GM3kbPY?=
 =?us-ascii?Q?2xkQJzT5wUVVygPtb0uBFeeLEFhtivIzuEMMVD5ded98brnRiosdHo6DuNSQ?=
 =?us-ascii?Q?cnjIbrh1vztykJpDxi1hlcoc2fsUyjqlC1x/GxdCq4zhJvo+A12f6DNL26WC?=
 =?us-ascii?Q?eMaJxYW700rsHLfFaIqPCF+nS16GWMNtkvsNlfaAXIEzy0ZZZdrzRnCVCtki?=
 =?us-ascii?Q?LDrh2pcb8PZA3p0uZdyj398veUytQIjPEHUefus1a5E7B8K2A+WuNc6WOqU4?=
 =?us-ascii?Q?NghSqzGCa/NVE9nilq5jXMU3fajjeEODnid36S6ppcsALvmwNnkUpbSmJuLY?=
 =?us-ascii?Q?vpPHez6zEJyHwS6BB1tqLuBbFhGWYbx9wrag6Tl/EtWDK1zaCgOZerLssaj8?=
 =?us-ascii?Q?eSXKwiK/8leJDwJ0ZVAlrFySz4ZLacpa0YhAcmG8F/zpiuqESMWkBxWQG1FI?=
 =?us-ascii?Q?aKPpaF0lpcx9ayrnkpwS1/xy/yC3nDWntl2UOmKEmpbqknp+xhgV+aS+pdGX?=
 =?us-ascii?Q?7uyGvbBh9dardZRUBZ129lBgti7Cmj2litJzenWcJ/xsg5selc9ZC0PBOUs8?=
 =?us-ascii?Q?WX82wzIrfX5peUGuifYvHJr8BYRse/oX8UsFp353KpmeePDsS9TKmARNvVag?=
 =?us-ascii?Q?AzNNDa+7IhZVQnMswB9LpwU7ira3yyttMFkuevAuE6By3Kk4u6g3VFvZCumT?=
 =?us-ascii?Q?zrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VXKqZkLeZ17UJeXpovCovRyYv0Jbjv82e0yVTrHhXBS3x1SEx7fGvG+/lfLp?=
 =?us-ascii?Q?fFCFvoe9nje9sB3S0Pz0yisU25OcMGj+26loclSFXm2TYvKNSlBtqONWB5Fs?=
 =?us-ascii?Q?oU6TaEkbiZD6U7P8VJDvCI5q/kg9GeqX2WhkKciSDb/tmiy/nxlJrx18xPXL?=
 =?us-ascii?Q?8pXmptqlroS238SCqq5VoWgLpKMrTp+UN846r7FPtG2XtjX2LJtLR0wQ6EFd?=
 =?us-ascii?Q?fnCrzF8+P/KfIfauJ80MCbhHEUdvNuTClzIIqEEGRmbiUSk46dnvfKT8HC5c?=
 =?us-ascii?Q?HYLmpaSY2ssmyq2PxVXSOpRYdO28yoZua87Ro2azJWc/5bR3qy2ISq9Wm+/c?=
 =?us-ascii?Q?eOQffXZuA3+RRs9M8cU5ZuPv2EymEaqsURjrlHWPOlJ0GRsLeUq9ahW1R1j7?=
 =?us-ascii?Q?ZmCoBibo9jqeYUptYe87h4AhoEC7I/P3S2Eg+fbMrCD8U+aDN+axQUhYE9k+?=
 =?us-ascii?Q?1CGF9HeINJXJRGGa89AkPHWnVHYk5mSWUWr2uTyCA7v83WenQnYbZLSjnoVl?=
 =?us-ascii?Q?dclbuh7vvYg8LqZlHQEuYwllCyr65C0Erb5nr92980jZxMIY4+wBAnfx4ifb?=
 =?us-ascii?Q?+3vVaXgOnNAU1o4hAmKeeSbwFaaZconMEnguRQl3xZxDdJgLiWEO1N2B+cyU?=
 =?us-ascii?Q?24FA47L57qZQyKEUgKj+ycIeLtTEQAeC6Kldu6LVToKqiWGj2lwIxWbTpqn7?=
 =?us-ascii?Q?sRoUGqMLRNnLFNqOR92+4vn3ttwT0/NWikBwkK3sPtNFQN+RPPmONkoMxw+J?=
 =?us-ascii?Q?PvhsfAcag/agZUPfnJGwmCi+Ltuxhlmbh3L62fzGAunBwWZZOHV7yJNoPsUL?=
 =?us-ascii?Q?2nW92veBul9wqQBSA1x+8qjLPyCOmmadYl518h/rxNRl5v/cSgYV7xS0t/LN?=
 =?us-ascii?Q?aJXMrqpFZ5Oq53EhJ39jh35qtZhbZbg3cB7eDWsH9jGdDyF16Q9IvMucgh8K?=
 =?us-ascii?Q?XHA4fzT26xhEZLl17yS6KCcBJJxksQbi9aOC54fdCB7ztD09MWmIkRlUzrp+?=
 =?us-ascii?Q?FdMHQym6/s7yqr82caGMx5pAzG7omHXfoM7S3cUh2yNcc1vsi1xAsHOMcOV3?=
 =?us-ascii?Q?gozB2Feg0qpZ5Dm2BHJQegIUvnYmaHExg1bipXSokQ96FnveE4QXZVI/CPKa?=
 =?us-ascii?Q?kki7gsG5cFlmx0ya9J9IS5PL4UAP9UVoRmhZH7+XDxEWP63nkCU5H/hODiri?=
 =?us-ascii?Q?UE+vnB8ds///4GvBBcNV5Q/mEadYMbCuy0jLJOFc2UvFlmLX+Wv8c6rE3jEb?=
 =?us-ascii?Q?WMzc6/g5YsvjETS7XRMiVUlhrOxqIIadLmkv8NmHC3d+Bw+YKu3DkMx+CbwB?=
 =?us-ascii?Q?byZFwcJDlqXhZEHFu6dv+rpmwCG6XX78vuanu0WJYyA8YEw2MszLN+GCtC+N?=
 =?us-ascii?Q?7fuLQ+SDpF8CSu4cz6ZWVv9wlemiA9c+zoXfVfcyDL+lrcMC++w6b8hjQ3uo?=
 =?us-ascii?Q?YeDMWEFWh7ilp7UvnZIY8oOS4GQ38OCBlc/xMwEhigCheASljuRtw7d1A52y?=
 =?us-ascii?Q?Ss//4rC2NVDg1GMgPdJMkXODcNP7k89QelSk0nB4K5Ai/lr5k13ODQS+qV1i?=
 =?us-ascii?Q?MyIxQbYvdN4o7W8g95Ba9NTnzD5PHRKAX2Rj7IzLpirffOaACPr8fw/lXdun?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4218f7a6-0ea6-4a71-d950-08dcb0e8f6a8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 22:42:59.7934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: llwOIM0aAj+D0Aj9WUKCkzC3x9QqAg4psh6EYpLJ+lwZBH9cEDpG2tSQWXGLVgn7tjdzDYR8aY+drPVQ/SBZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
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

On Mon, Jul 29, 2024 at 10:47:59AM +0200, Maarten Lankhorst wrote:
> Hey,
> 
> I like speed, so great to have it fixed!
> 

Yep. Uncover bug here exposed a pretty poor implementation...

> Den 2024-07-27 kl. 00:01, skrev Zanoni, Paulo R:
> > On Thu, 2024-07-25 at 22:21 -0700, Matthew Brost wrote:
> >> The current algorithm to read out devcoredump is O(N*N) where N is the
> >> size of coredump due to usage of the drm_coredump_printer in
> >> xe_devcoredump_read. Switch to a O(N) algorithm which prints the
> >> devcoredump into a readable format in snapshot work and update
> >> xe_devcoredump_read to memcpy from the readable format directly.
> > 
> > I just tested this:
> > 
> > root@martianriver:~# time cp /sys/class/drm/card0/device/devcoredump/data gpu-hang.data
> > 
> > real	0m0.313s
> > user	0m0.008s
> > sys	0m0.298s
> > root@martianriver:~# ls -lh gpu-hang.data 
> > -rw------- 1 root root 221M Jul 26 14:47 gpu-hang.data
> > 
> > Going from an estimated 221 minutes to 0.3 seconds, I'd say it's an improvement.
> > 
> >>
> >> v2:
> >>  - Fix double free on devcoredump removal (Testing)
> >>  - Set read_data_size after snap work flush
> >>  - Adjust remaining in iterator upon realloc (Testing)
> >>  - Set read_data upon realloc (Testing)
> >>
> >> Reported-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
> >> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2408
> >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_devcoredump.c       | 140 +++++++++++++++++-----
> >>  drivers/gpu/drm/xe/xe_devcoredump.h       |  13 ++
> >>  drivers/gpu/drm/xe/xe_devcoredump_types.h |   4 +
> >>  drivers/gpu/drm/xe/xe_vm.c                |   9 +-
> >>  drivers/gpu/drm/xe/xe_vm.h                |   4 +-
> >>  5 files changed, 136 insertions(+), 34 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> >> index d8d8ca2c19d3..6af161250a9e 100644
> >> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> >> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> >> @@ -66,22 +66,9 @@ static struct xe_guc *exec_queue_to_guc(struct xe_exec_queue *q)
> >>  	return &q->gt->uc.guc;
> >>  }
> >>  
> >> -static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> >> +static void __xe_devcoredump_read(char *buffer, size_t count,
> >> +				  struct xe_devcoredump *coredump)
> >>  {
> >> -	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> >> -
> >> -	/* keep going if fw fails as we still want to save the memory and SW data */
> >> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> >> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> >> -	xe_vm_snapshot_capture_delayed(ss->vm);
> >> -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> >> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> Should this put be conditional?
> 
> >> -}
> >> -
> >> -static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >> -				   size_t count, void *data, size_t datalen)
> >> -{
> >> -	struct xe_devcoredump *coredump = data;
> >>  	struct xe_device *xe;
> >>  	struct xe_devcoredump_snapshot *ss;
> >>  	struct drm_printer p;
> >> @@ -89,18 +76,12 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >>  	struct timespec64 ts;
> >>  	int i;
> >>  
> >> -	if (!coredump)
> >> -		return -ENODEV;
> >> -
> >>  	xe = coredump_to_xe(coredump);
> >>  	ss = &coredump->snapshot;
> >>  
> >> -	/* Ensure delayed work is captured before continuing */
> >> -	flush_work(&ss->work);
> >> -
> >>  	iter.data = buffer;
> >>  	iter.offset = 0;
> >> -	iter.start = offset;
> >> +	iter.start = 0;
> >>  	iter.remain = count;
> >>  
> >>  	p = drm_coredump_printer(&iter);
> >> @@ -129,15 +110,86 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> >>  			xe_hw_engine_snapshot_print(coredump->snapshot.hwe[i],
> >>  						    &p);
> >>  	drm_printf(&p, "\n**** VM state ****\n");
> >> -	xe_vm_snapshot_print(coredump->snapshot.vm, &p);
> >> +	xe_vm_snapshot_print(ss, coredump->snapshot.vm, &p);
> >>  
> >> -	return count - iter.remain;
> >> +	ss->read_data_size = iter.offset;
> >> +}
> >> +
> >> +static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
> >> +{
> >> +	int i;
> >> +
> >> +	xe_guc_ct_snapshot_free(ss->ct);
> >> +	ss->ct = NULL;
> >> +
> >> +	xe_guc_exec_queue_snapshot_free(ss->ge);
> >> +	ss->ge = NULL;
> >> +
> >> +	xe_sched_job_snapshot_free(ss->job);
> >> +	ss->job = NULL;
> >> +
> >> +	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> >> +		if (ss->hwe[i]) {
> >> +			xe_hw_engine_snapshot_free(ss->hwe[i]);
> >> +			ss->hwe[i] = NULL;
> >> +		}
> >> +
> >> +	xe_vm_snapshot_free(ss->vm);
> >> +	ss->vm = NULL;
> >> +}
> >> +
> >> +static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> >> +{
> >> +	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
> >> +	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> >> +
> >> +	/* keep going if fw fails as we still want to save the memory and SW data */
> >> +	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> >> +		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> >> +	xe_vm_snapshot_capture_delayed(ss->vm);
> >> +	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> >> +	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> >> +
> >> +	ss->read_data = kvmalloc(SZ_16M, GFP_USER);
> >> +	if (!ss->read_data)
> >> +		return;
> >> +
> >> +	ss->read_data_size = SZ_16M;
> Shouldn't it be easy to actually make a reasonable approximation of the size, instead of reallocating all the time?
> Or run twice, returning size on first attempt, and data on second.
> 

I tried this initially and is actually a pretty large refactor, hence I
went with the realloc approach for simplicity. Paulo's test case does 4
reallocs and seems to preform just fine.
 
> In any case,
> 
> ss->read_data_size = some const + VM_DUMP_SIZE * some other const
> 
> This approach is likely too fragile, but we should be able to change the code to dump twice to get the accurate number.
> 

It is fragile in the sense that anything before xe_vm_snapshot_print has
to be 16M or less. This is all static though, how about adding in an
assert which pops if we hit this limit? The drm_coredump_printer
protects us against buffer overrun and corrupting memory, we just lose
coredump data.

Matt
 
> Cheers,
> ~Maarten
