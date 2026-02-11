Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E0EB5946
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 00:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D45910E058;
	Wed, 11 Feb 2026 00:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwgRshcR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A7E10E058
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Feb 2026 00:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770769094; x=1802305094;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FhLSd7lpaubsrkLZQZ68fW5mmStTOuefy/Q+uBm+Qn4=;
 b=jwgRshcReL3VGwUazgOYnt/lxhbh3Mwa9DGgSTFlMlVzqBu+/7JJD2th
 Yp7rjA7Ys2pp+qcpAQeR3FO+xgNJehHm/7p8DAlHtduQpOweBICWctQZU
 FeZlzk6rwqtEVYue1Q322cK6797KfNWVS/O013xDj9mZja9HWiqQW6zxu
 rImawA7GLg4+zRPOQpP3kD1XQak6BcbIUYxkbhKRlZ1vh3rrPSU8pTab5
 i0/UMtqJA9GwznQ4zoT9JSO1SLd6nja5Y3Yqxj7PyjlVWNoPYuqmePQeQ
 UqIkEfCkQbVwM2UDGinUGkzwqw1/J6dvjjY3eFHjN5y6ypz8vMa8SbBgV Q==;
X-CSE-ConnectionGUID: uGEKfmc3RR22IqzU/KK62g==
X-CSE-MsgGUID: nIde0rXoTEak9cRpWGqDMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71628107"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71628107"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:18:05 -0800
X-CSE-ConnectionGUID: GMcn4aHsSQC8o6/Go55/6Q==
X-CSE-MsgGUID: o3s0+HsaSnu3F0tf1d3IaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242688617"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 16:18:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:18:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 16:18:04 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 16:18:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8DxdsdqigHLvovXnBLLKrjaqu8yXY10uBTdh/3dQHeW8/tkP8fIriosgM/N5f6fGTcSnlhD+xGT5O9geD6ZJMoM1lEd0QhelaZlLXs6HLKv00L9wjQrgaySPICFw+Dik66HOg+1rmUPGiU3/WWMXZz1Q6NY6mP7TAhDXJi8/PDiDpqTAjtGnUQPF0rTje2+MasOiAnLfBaXPDdFzfa0vmWVLHFt0jV3uwcRASWrkEX/5gB5k+QrhzdaHKVzfLV+eQ4PaV9IGifPOO9E7/FjxTglXU3XPzQH4rHncuO1VcU0plE16LFuGMEIBoMO0Vftv2jgDUT7uS110NI9HfobxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+GXGtvaiex49EDX6vK+2g7JKZcZjA/5hWqXLkJUnDA=;
 b=amz4PnfjM/2kc2K22+BW4X2VirjRDX9rCuM1b+MbJD2T3NN4hqC6ZmRGDh6xzYx8uY3iBXPxKmhZdm1tbpvHp8BlSbB5x+9mF0NGxHNASfMCwC3mhHi2GOcv+A7e9bkR7Br/3kDHP8Bec2RNs1Ad8lDr8ttUwkx3/aoe6Dp289cS7/sA/SJ1vLHjuN2v1p/tZg8SYVJ6d5pNz974xdnXTkMvl48EeabRa6cGf7Td/Z0CzLEocDnq6FIb08f5SZ9lEJdhP11WBhdwWhpB1QbW77gd3KPvbTzPm9ts1CAr3NWgw3WqG2uXZQbyHUwRE/N4rskG4kVsjrghJ4mad/s6Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7576.namprd11.prod.outlook.com (2603:10b6:a03:4c9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 00:18:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 00:18:01 +0000
Date: Tue, 10 Feb 2026 16:17:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] Decouple devcoredump from accessing core driver structures
Message-ID: <aYvKt64AeBC6Nvj6@lstrano-desk.jf.intel.com>
References: <20260210072942.1864182-1-shekhar.chauhan@intel.com>
 <43de4a96-2aaa-4dc3-8c8d-0bce63385536@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <43de4a96-2aaa-4dc3-8c8d-0bce63385536@intel.com>
X-ClientProxiedBy: MW4PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:303:b7::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7576:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c9fc81-c26a-46f6-d3c1-08de6903047a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ffccp5Bf4CHWx1/t5rfe39g0eK2Nasmfv4TPPHbIencesyvED3dSitGEuPqk?=
 =?us-ascii?Q?gLrjcQMv/VhK8IMMHwrUwxYBMBv7wfDrfJVMMnJsw47X/+1acLYEjSttUuZT?=
 =?us-ascii?Q?yA3DVuNqLro4DgSi+aftrYyhayeZUg1uuvq5Re3hHDE8HEaQG9WtgpknwQZQ?=
 =?us-ascii?Q?1O29NOc8F13jQUy2PHUEqExABJk4wxz9TPjv6gf+ZE+SnYc7h7UY6dkKTCl0?=
 =?us-ascii?Q?PpIsRvILcHMDkJmfzRcGrVHxQ+lBK6Fl9MkSut+04tGzX1MwObnyJhx1ZzJO?=
 =?us-ascii?Q?mDLTSVXU75yhJsCu0vvJR8EXUYZaEAzDsOCBGnkRFcagSV57hSFWXcEdn7TR?=
 =?us-ascii?Q?PRfcoAJ1i9AOZlwjR9J26qdLfddzCeVVElMJspmYzus5/INIQwk3AWYq58Uy?=
 =?us-ascii?Q?OHWF+bnCkog5J9brz554yFCxF/eLCX1SMl5Gli3tYlZF293zKTnUfu+KiqiF?=
 =?us-ascii?Q?ISZz94si/QwCVNfinZUqfs1F+J5MiHAq5wGlbD/+7CCkrJz5jlCwIEta3Orx?=
 =?us-ascii?Q?x+3++HGm0J6i9n3nfv/1/GwmrBUnfDWA3LvsnSXX04DkFPXen7xUJvOhkk1o?=
 =?us-ascii?Q?P27L8Y0DWERtYlqHt9jQpgScLjTAsIJFIy0lnOBvf5UUdQ1+RYwKxNHT8cyL?=
 =?us-ascii?Q?diS7RJrYWC75rXSymwglSkrnBeg0C+gw/uKiYDB9VRPOaUHWKV6ve7R1sYZd?=
 =?us-ascii?Q?AJGiXhKg1p1SC+az1mb2z/QbaeQLnjrTMUpCysVEm1b1+O89KpIzNtcUpkkr?=
 =?us-ascii?Q?36jMojjPO+YWIW4W4rt7HSXl4a5z3eYdbLH0Zu62qXL0LX027etYelFPCKxd?=
 =?us-ascii?Q?rAi1jS4iamU004lh5SmootWCgFeCtBch/F5o++CJUHgEa8pzCT77IqbVhL4d?=
 =?us-ascii?Q?HojioDoGC4iTwetpYHfbAqIhDGEGSKuWsiOLEw6aTteRJk7c0XmKCdFo+0PN?=
 =?us-ascii?Q?lPE6v7zICTB5je2OAWhPy2sKGnL7hbBeDmxKDfEqDZw4rXC72fLiVeuQBj5R?=
 =?us-ascii?Q?5iTsliAQzIF28SbljIrmZOUlaw8KHFAqMmElup8j3JVImDjPPUPzEbne8oLc?=
 =?us-ascii?Q?xC5e6T0tB0d3FG5hkWZXQPtCUzOHk5fgG3u7SXQ/JMoB0jmjWXj/oZcNZv1f?=
 =?us-ascii?Q?oyyRMxqt+DGLrHqTPRsvTZad4zuj0FOSi9OkEgeZlkQ8LhuiKinVLLe3IRT8?=
 =?us-ascii?Q?LfmhHoWY/TvDa0O9b7HNUxx9dotgnZaw2boc1Bz6rPGA6qfI6At7u0WmbZbU?=
 =?us-ascii?Q?6aMfqx+RF18fmxpVpEvsCdU/ztGUWlfiL1VTCs20qzo+eMGLLQljpOtlDgyu?=
 =?us-ascii?Q?uyRfT6CGP4xPt1URWjaNA6Azs3cHfkUsGNfqiL9753NKMPQ0j7K+qq86FzDp?=
 =?us-ascii?Q?nj5zRJexr9bH8CDiPIXWQlskJ4hHoo62kg7UbOkpensM48+OGW9KuL9jSnYQ?=
 =?us-ascii?Q?jHm5wGhuMLnHh41Q8TzE+/A1FD3ZMpP9kwI7IWGzNhw9P2Gh2g7WpyFbd3OZ?=
 =?us-ascii?Q?MiFpmaiPlscs7BxkrrbXKFa2C4Da5DYyedm8Dx6TinZjfbFaVJMANm71PMSw?=
 =?us-ascii?Q?aYDeG+96f5yFzVVsmO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pksFCodmAodBtRvdFlYzK6BFHmYj3exWq10MezhcNQU8BVIB+WITDCDCCHQ9?=
 =?us-ascii?Q?fZelasncgGUf3GAHe8vhQtQekL25puWuSQBX+PYoh3mZbgGWzEjVp0UCI5iQ?=
 =?us-ascii?Q?CIywBlLyHOcicl9soII6WbcZUeep2IrW0aKsjMjVFd/VOudTyKax583LxbjL?=
 =?us-ascii?Q?x4nIxWXdhTdFJCEmdv2p2s6UBC9XVnbHaAcd1vYV07Vq1bpTM1e2YSgiZ9cx?=
 =?us-ascii?Q?X+GP+RxHM+ASZcvQJP52qLviU6cyffin1EdEVJqAzdhBNcepmxDBdhL/caq9?=
 =?us-ascii?Q?KL66Agz3Liuq7mpPhOoK0Mh8ozNMNV4QDZSPE14IYPq6HxK0BMLD3K4z0lY/?=
 =?us-ascii?Q?KKsPlk7B/X+PqCtWjStlCY0aZOwcT5OzKyvEUb+N0eP56TbUp4Akb9kY7AvS?=
 =?us-ascii?Q?tmdq4OxtDaf97Ym77D6LMLlUe9PfZGtuzvynr57IbOIJlsHsblzexfaBDlH5?=
 =?us-ascii?Q?WMGbV9+aOIbO+uXfUA29dwKoEn+/gYBgaUV3kq93QgLQx3iadAclc4Px9ZUi?=
 =?us-ascii?Q?dEGSZvUB+SqpYM/zUbNvjKnFpirwVWANJxMU8HCmqHpEnE6oNuMPpzZZl2kI?=
 =?us-ascii?Q?S+duBXcaxvRv6RKT5kay0G3dehWmPeC9qjmdExIb2CvLRvBsnCjczEgJ5VdN?=
 =?us-ascii?Q?uz+Vw2tgcxpDCHNfswDdoqgqAzaHgYXogBGBANTLHPooadrFfakVRnp0Z1MR?=
 =?us-ascii?Q?PFrNvR2QxPEOtHk52dflWHA0Lopq/+05Rtd65qjneRKUop44OrUYa3V8TPV7?=
 =?us-ascii?Q?xzH0nbCEuzdcEjdc6TjAZbs+e4I5/lOBMTCuZT6EBhD/xMeEDYXHzF5FosZk?=
 =?us-ascii?Q?aGyHOscyaXWpSFQGU3VXGMdGBpaY895+g5WR7BwFDp2Xsuu1IyyKDrQq4W9P?=
 =?us-ascii?Q?IjEDVFVyf/3JBnKU8l5ktvVWkZsiwjU+8ewUPcBQaj3CUxz9ls8JpbehKY6P?=
 =?us-ascii?Q?EkYPjNhlPGXSfcIxj+pB7iVSRt0PrtV5YalGZP6/R+esIrzEIvUmC7wzYIiv?=
 =?us-ascii?Q?jo7U52D4FrhVAXTTfHkjHvb2r0l3F+7SA5zwh9sd4ttCT0ZPDWr8yUTAaXEo?=
 =?us-ascii?Q?uyFAhVlOCnNnRuXAK8HCjJbCjTu/vvs84/pqAGxXqQ1kl3t3iDCO4vSZVwgB?=
 =?us-ascii?Q?KxuYkPZo6deA/1k0jGau7DijdGXNJQyuWc4l3kXBDDYyrb5Z/G6txrDbaPys?=
 =?us-ascii?Q?dqQFQAmG9pNshkz89ioWtAYu/EjNZKyQ09yfi7xS2Vbykw+Y36PMvIKPHYWW?=
 =?us-ascii?Q?Im4PBeDa2MRHQ46QUTbGcY0VfoaUtLBRA8DYfPlNGR8bN9ojpuGLvI4Iba+q?=
 =?us-ascii?Q?w7HKY9WmrJ+qA7PaYdiarhvUIPzH4cmmiT1Byd43Uq34KqmW86G5UTGsVjqW?=
 =?us-ascii?Q?UWRq59d3BehFMBEqpiaU5ZxJcwAQPA/pIIsEB5dCKS4+/7PlmATrXOqCmZZS?=
 =?us-ascii?Q?gFqVv8kmxdMbnMOdwqUUjbbbdJMUTp66JdNOtk55ZhYp8sX3SXl0yiYnuQu8?=
 =?us-ascii?Q?kF4EbjYL8U0gOTjyTxfPfTeYsbonW12pk+mpsz/Lhw8D3IfTACslmfjcXOBc?=
 =?us-ascii?Q?LKGEKvlpLvpnUyxaaffrXMsZlwDQP2nr7L0XOWCJuVKImJHjaI01xEb1yZOo?=
 =?us-ascii?Q?mvqEFUT/gDAVrScLFtgA/9VdgDGyc40yS2tDd4qPPDtCGDr515oS1R1TACfn?=
 =?us-ascii?Q?GisLefpOWGvcTYGabHIUY/QD/1pU8SsD8NFob5Ql4Qb1loIVbAinx1Ku84C5?=
 =?us-ascii?Q?EP4/wLcBzA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c9fc81-c26a-46f6-d3c1-08de6903047a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 00:18:01.5460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAC7oZekB4Qr6L3SprTZL7l8UJMAFqu6i2hs0zZbhOzO2Sr2uQqjaE+EqM2fgj3mR+0l7WIctEoqpnbk2QW8AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7576
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

On Tue, Feb 10, 2026 at 10:48:09PM +0530, Shekhar Chauhan wrote:
> The patch should have a 'drm/xe' prefix, missed it somehow. Will add it in
> the next revision other feedback for the patch is provided!
> 
> -shekhar
> 
> On 2/10/2026 12:59, Shekhar Chauhan wrote:
> > During devcoredump, print should not access any live gt pointers.

Can you explain 'why'?

> > Decouple the snapshot_print from accessing gt pointer by storing the
> > captured data in a separate list and then print data from that list.
> > 
> > Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc_capture.c     | 25 +++++++------------------
> >   drivers/gpu/drm/xe/xe_hw_engine.c       | 20 ++++++++++++++++++++
> >   drivers/gpu/drm/xe/xe_hw_engine_types.h |  7 +++++++
> >   3 files changed, 34 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> > index 2f5816c78fba..0555fb07c499 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> > @@ -1695,8 +1695,7 @@ static void
> >   snapshot_print_by_list_order(struct xe_hw_engine_snapshot *snapshot, struct drm_printer *p,
> >   			     u32 type, const struct __guc_mmio_reg_descr_group *list)
> >   {
> > -	struct xe_gt *gt = snapshot->hwe->gt;
> > -	struct xe_device *xe = gt_to_xe(gt);
> > +	struct xe_device *xe = snapshot->xe;

If an Xe object is available - so is a 'hwe' and 'gt'. All of these
persistent objects created during driver load and the memory is free'd
upin driver unload. i.e., It is not possible for a GT or HWE to invalid
but to have a valid Xe object unless I'm missing something. 

> >   	struct xe_devcoredump *devcoredump = &xe->devcoredump;
> >   	struct xe_devcoredump_snapshot *devcore_snapshot = &devcoredump->snapshot;
> >   	struct gcap_reg_list_info *reginfo = NULL;
> > @@ -1806,7 +1805,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
> >   	};
> >   	int type;
> >   	const struct __guc_mmio_reg_descr_group *list;
> > -	enum guc_capture_list_class_type capture_class;
> >   	struct xe_gt *gt;
> >   	struct xe_device *xe;
> > @@ -1826,8 +1824,6 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
> >   	xe_gt_assert(gt, snapshot->hwe);
> > -	capture_class = xe_engine_class_to_guc_capture_class(snapshot->hwe->class);
> > -
> >   	drm_printf(p, "%s (physical), logical instance=%d\n",
> >   		   snapshot->name ? snapshot->name : "",
> >   		   snapshot->logical_instance);
> > @@ -1841,23 +1837,16 @@ void xe_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot, struct drm
> >   		   str_yes_no(snapshot->kernel_reserved));
> >   	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> > -		/*
> > -		 * FIXME: During devcoredump print we should avoid accessing the
> > -		 * driver pointers for gt or engine. Printing should be done only
> > -		 * using the snapshot captured. Here we are accessing the gt
> > -		 * pointer. It should be fixed.
> > -		 */
> > -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF, type,
> > -							capture_class, false);

Again unless I'm completely missing something this is accessing driver
persistent data which seems fine to access during
xe_engine_snapshot_print... What we shouldn't do during print is access
the hardware which is not what this is doing.

Matt

> > +
> > +		list = snapshot->list[type];
> > +
> >   		snapshot_print_by_list_order(snapshot, p, type, list);
> >   	}
> > -	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> > -		list = xe_guc_capture_get_reg_desc_list(gt, GUC_CAPTURE_LIST_INDEX_PF,
> > -							GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> > -							capture_class, true);
> > +	if (snapshot->render_compute_list) {
> > +
> >   		snapshot_print_by_list_order(snapshot, p, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> > -					     list);
> > +					     snapshot->render_compute_list);
> >   	}
> >   	drm_puts(p, "\n");
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 4d3ee5226e3a..a246b4f860e6 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -923,6 +923,8 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> >   {
> >   	struct xe_hw_engine_snapshot *snapshot;
> >   	struct __guc_capture_parsed_output *node;
> > +	enum guc_capture_list_class_type capture_class;
> > +	int type;
> >   	if (!xe_hw_engine_is_valid(hwe))
> >   		return NULL;
> > @@ -941,6 +943,24 @@ xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe, struct xe_exec_queue *q)
> >   	snapshot->mmio_base = hwe->mmio_base;
> >   	snapshot->kernel_reserved = xe_hw_engine_is_reserved(hwe);
> > +	snapshot->xe = gt_to_xe(hwe->gt);
> > +
> > +	capture_class = xe_engine_class_to_guc_capture_class(hwe->class);
> > +
> > +	/* Capture the register list */
> > +	for (type = GUC_STATE_CAPTURE_TYPE_GLOBAL; type < GUC_STATE_CAPTURE_TYPE_MAX; type++) {
> > +		snapshot->list[type] = xe_guc_capture_get_reg_desc_list(hwe->gt,
> > +				GUC_CAPTURE_LIST_INDEX_PF, type, capture_class, false);
> > +	}
> > +
> > +	/* Capture the register list from RENDER / COMPUTE */
> > +	if (capture_class == GUC_CAPTURE_LIST_CLASS_RENDER_COMPUTE) {
> > +		snapshot->render_compute_list = xe_guc_capture_get_reg_desc_list(hwe->gt,
> > +				GUC_CAPTURE_LIST_INDEX_PF, GUC_STATE_CAPTURE_TYPE_ENGINE_CLASS,
> > +				capture_class, true);
> > +	}
> > +
> > +
> >   	/* no more VF accessible data below this point */
> >   	if (IS_SRIOV_VF(gt_to_xe(hwe->gt)))
> >   		return snapshot;
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index e4191a7a2c31..87ad1e68fb47 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -6,6 +6,7 @@
> >   #ifndef _XE_HW_ENGINE_TYPES_H_
> >   #define _XE_HW_ENGINE_TYPES_H_
> > +#include "abi/guc_capture_abi.h"
> >   #include "xe_force_wake_types.h"
> >   #include "xe_lrc_types.h"
> >   #include "xe_reg_sr_types.h"
> > @@ -167,6 +168,12 @@ struct xe_hw_engine_snapshot {
> >   	char *name;
> >   	/** @hwe: hw engine */
> >   	struct xe_hw_engine *hwe;
> > +	/** @xe: device pointer */
> > +	struct xe_device *xe;
> > +	/** @list: register list */
> > +	const struct __guc_mmio_reg_descr_group *list[GUC_STATE_CAPTURE_TYPE_MAX];
> > +	/** @render_compute_list: render/compute list */
> > +	const struct __guc_mmio_reg_descr_group *render_compute_list;
> >   	/** @logical_instance: logical instance of this hw engine */
> >   	u16 logical_instance;
> >   	/** @forcewake: Force Wake information snapshot */
