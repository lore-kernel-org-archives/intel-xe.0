Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EAAD75BA8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Nov 2024 03:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0785210E83F;
	Thu, 21 Nov 2024 03:38:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mmPbVqCT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9545710E83F
 for <Intel-Xe@lists.freedesktop.org>; Thu, 21 Nov 2024 03:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732160278; x=1763696278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ii790qrWz/E3OLau0KGcnFISjUFmThB+wOqJH3Xf8XQ=;
 b=mmPbVqCTTWaFc1v+2KYUgT45jULaDQO3B+S29bI6jVvvBZyKa8mstiV2
 wdH0v2ShPQfVMaaClP+97Tz1VB0b54Vq/PdBloxxsCaALXemoFA2Parh4
 XVSDNAR2cMCImzZDOT/51JNsX7+TKaTHqICb7JlA0ZAbDMVpVHpgvXqu3
 m1AyGbqUKRf6f4GHWcZMTJQ/LKW8OBQAzxAU02WoS5VUcutaKLp6wRds7
 /Ey52AvDHupr34L7BSuXq0GOP+KbGpo2sP4LTV3MBltV4tWvfxrYURZj6
 stcGDsvFbF2gUtiFpTIutDbl/dDhz5rlTMy8xb8XJcsYCP6dQsoIoKG+v g==;
X-CSE-ConnectionGUID: IiZUj+zmQiuNOHDTFc6DaQ==
X-CSE-MsgGUID: c4JvxuY8TjKrJZtO7mSM4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="19839892"
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="19839892"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 19:37:58 -0800
X-CSE-ConnectionGUID: mihDvg6XSmKeVWxH5HpfJg==
X-CSE-MsgGUID: DA9K0jEuRyK2MfYvqLWHJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,171,1728975600"; d="scan'208";a="127652344"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 19:37:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 19:37:57 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 19:37:57 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 19:37:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8t4lc0PWx28HiG5XuZOpjISicih83/lRJQK9m2qacsfqaYp7qrLiGROfDRUdC3UZdNMFTXBE2niYIW0fyjpOgE0nKiZP1luHo4ZMKzkeVrEUMOEL3hZE27LfEtBLb8ymsLWI5fmID9AseR1lxhLJQ9EoxBc5lPsSsviMdmk1XTrKxYk9o5FyzPVnx8lj2AciMEqzGie1E1f02FQMH6OmoNVs3SOtPWj+JAVPneAYANDDM4YxWdEEp6AloPUJKU6SA3cQfBNkXjpRYVoX5VuFgoSTRLb4CGxQJF6pZRzu8aoaF9NkwQZRZPbzsVI1PQAMcihoeIb5fByPGmvU6Bxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vScJbOaS3be2cdfQYfwsigUZB757sj/iQjkPjtUyxEQ=;
 b=vPBJQwgCU4k6gKT7aA6uBiFlA6em3Rt48lR4y4jK9x3EDG6vt4ZmMLXYiAALmMlvTaPck/dkK9qcsQjyVH+IVZxMrD2v4RT4tVnxQhnNMD+W/uILk7wRxSGF3o1Ev3dUtYTNPoIW72twxjNMfoTCFr6tf/B3Sa0/b/rUT7kUxmGV8zzzuo92jeW8V1PVK7/GtOmUzUK50hi3lRyYnPhaemh4PSyXKcO39fN+RS5d2JmyQDfDuVLRMB6NKnUw1pva0phNdn5wnEF6KL/+aKmGlquE3nnb5iISRY0w2LDrFWx2/w2H9W6rqr9a+q/yDs8g0apue0lcBRVW1q7wRv2JkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 03:37:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 03:37:54 +0000
Date: Wed, 20 Nov 2024 19:38:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <John.C.Harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Add a reason string to the devcoredump
Message-ID: <Zz6rNo0s6y5W0Hrp@lstrano-desk.jf.intel.com>
References: <20241120232257.1025282-1-John.C.Harrison@Intel.com>
 <20241120232257.1025282-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241120232257.1025282-2-John.C.Harrison@Intel.com>
X-ClientProxiedBy: MW2PR16CA0032.namprd16.prod.outlook.com (2603:10b6:907::45)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: e1da709b-413a-4c05-eca8-08dd09dde253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hJiPPGBQKSFSYqZMdkJZcQFvWztigO8tjsegdM7wiU9zx6fjTPRivl/nvHqE?=
 =?us-ascii?Q?IaE6Uh1lAMd2QhR9dCOCzymnacgvhZfnSdEvMo96MD1zmYwKFRa1whXq20dT?=
 =?us-ascii?Q?NBicFc+B2nkj044ipGbSu2jGBZ87LZ4C5NQ5QEvIZszqu+fOazBelVFOezoV?=
 =?us-ascii?Q?b3Eb3QyKAU5yMZ9eZhawMy8P+tk+y3WgKNFBJaNfrXWFREIx05WNAWLakr7b?=
 =?us-ascii?Q?5VO6CpfpxK1PZD0KfLZRVq1vQR06SW2HbBSmHiisUf7EKBF7EV+3W1vc9EvQ?=
 =?us-ascii?Q?NGNzx+93wkeTvsTOeL6iGmu0AfdjpoNodw8NiPvyOg0QXTZ58TuM9TrJ2nGH?=
 =?us-ascii?Q?rUNq6bvF5jqhpWEb/+qJitV90nJer0vfN+nv2tJjiwS0FVaaTYvSPaMdY7GH?=
 =?us-ascii?Q?UqFeoMT24NYOPYFs/Gjs7kKUF1RhnTMp0IXs5RZHzS6fZGWla29R08pXZqE6?=
 =?us-ascii?Q?Lz0h7qgprNvOwf38+WCASomOl1Gjpi8CpCi0REkD0SBqUM3TzWz2BDO5hbI1?=
 =?us-ascii?Q?xaOo6LZJ+HBVcmJ91R0k5h6aEn/CUFn8y786wwn4yXO23ntFLGV1JgVASPoD?=
 =?us-ascii?Q?zr5erzKltumHPSJDRoVOmw90Hn4dTRIlYOHToqYZw13qEDyc2w+5Py45mhGg?=
 =?us-ascii?Q?FUaCGJY8chN8Or9shhjK+/v9Q4VfSeu0CbEwKuIaEm/sAtFrlUOk7nf52L+p?=
 =?us-ascii?Q?q8aRB4oQGZD9tGio1p4KN0/ycQwC3ZqzCw0f5qcdf9Dc6wnVDSfmFdW6mAwY?=
 =?us-ascii?Q?BTLj176Ww0D0L+N2WaH4jnM/biQFu3zSRVEGH8dik+Ycj/vKZvTqrT41ouon?=
 =?us-ascii?Q?ojIvsquNBxvNd4gFH3XjRV9bFSm+8N/RHl/fliq6K5+p6qAWf/4ZaqqwKTs4?=
 =?us-ascii?Q?yIxPgo4XVcxdagpEuE7gJZCK15hDxXyVfJytKoD+tUgR8c9mpHyJD2pM3Bqd?=
 =?us-ascii?Q?DGZqid0JYtt5iSB093W2Y7nKwMdAUTCeqRZ6jH0eYjbqsRLClGqW9VvZV7rC?=
 =?us-ascii?Q?1cTLxk9AFYf84LDik6qXCOw5HIA2PdunGcmKtD6/zkkD4Hrtz+O2q0Venap9?=
 =?us-ascii?Q?nefE/cxPDFiJ2Kcna8rbgu/NFQFjkCxmtLfnPLpvDW9cy98NT4NByUsEY3zx?=
 =?us-ascii?Q?55hoP+RgYW0QIvooSaiWjCDY9+U4v+2z8p/yqzDnKg5c4+263V4fWUIUUJPQ?=
 =?us-ascii?Q?UUSia7sd5tac+eMW+yQVe+gdXWgtlNQRybLyAbIXqs5HkR4eItE4eRoLkHi0?=
 =?us-ascii?Q?b1rD+lr2pnPFIHnNpr01nsADPQfc5BMIgju+qEi7Sp9mzjdW6hEg+/sfkxqS?=
 =?us-ascii?Q?mP8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fb0EelBeuCGhi5ESzIYTtb6F4i8fe3CnyWSm1F5weVJ6HBqErIHqLVbqSsR1?=
 =?us-ascii?Q?oWNTBr4VTkZhPgYP5LS2CHl4w+GCgudOeFoKWanLGz/1cDeZKCxz5qlAApV2?=
 =?us-ascii?Q?AJ1GEVePhrqzRRfap0pHcKy6VIeAPTF7lMrT6tLuXhIATD0BukJ1Mb9OOLDT?=
 =?us-ascii?Q?8yL9OnFQQij20jKvt+3N+I5klNtwDGiJg42xjZsTOCtKQ1sD/qI7Kjobsyoj?=
 =?us-ascii?Q?gqrO9kEW6B9H4T7DKQX1+c8PPuY74Iu0WAO2POU1HwA+o3hiLjSvGwUs4tFA?=
 =?us-ascii?Q?1gJiK9/rg97VARNLmEXtf7y40TCj5GGrVHG/lnGmc06nu2+wtjA2bXC3xh1c?=
 =?us-ascii?Q?UDqVaXScVjwFhgWoP9ygxZpoJ7K/eFKwnc0sjrA5shiVS9wesakl4D1JKmV/?=
 =?us-ascii?Q?v14+JZHm/ABdn7TU04aJBXzEpc/WU8/fCExECfpca4iEjsmcTKnwc1HC3Hl0?=
 =?us-ascii?Q?mnDQo6UUkucffTnq4bALBxqN5fLhy/PQ7lHUtJCEqMOLNmJzSdWyudsJUkeY?=
 =?us-ascii?Q?IlcMsqh2V+CDoUG6Ltfm24LpkVd70nTH16z2uAX1uHX3YV2deR88HBheCM9v?=
 =?us-ascii?Q?5cZ3uLludRvYMjPthXm2yJzPe4fCHJ9VeRBNxCmdInJQ4A+mXQWakj7fAmzc?=
 =?us-ascii?Q?RmQuky96KE/KQDxkRF8/xaswIEKBNAk8mSM0JZxSnpVOtp6pMpPW/AUP89vI?=
 =?us-ascii?Q?MOLZKuWyJhDFPZL+OgnR2lZkL7D9KgFPlUSNm39dFyR+ll3e+mzG+6UBrMlG?=
 =?us-ascii?Q?aB75NmY1P7kvB1l/SQnyuVuKDZpCz4AF0wOsmI+25V8MMnA7ZXUCfLkh9Jtd?=
 =?us-ascii?Q?nTYf5mY57QSHC/GbC7IFc1mDp7h1lrEnG51wAQDIIuhF7KnUOgwvKw4FfeT3?=
 =?us-ascii?Q?WQcTXi8RBr7TWx1Uzc5JV69mAs1myaVEH9TTIpk5lli8PBgA2n4MMFjpxMfD?=
 =?us-ascii?Q?SfqvtgFa4sF38YkiisC4WXBlIyfcbfrcdB9UBolkiKDnMR69kfhgD34+B95+?=
 =?us-ascii?Q?5zfkVcUuw70qcpZd/9if07KCzIpIdM9rQtd/LbAY9DdvSL5ObgQYV2P6gDj7?=
 =?us-ascii?Q?H+EcEojR+53Kv6PGroExbyS0yzzxsDI+/UytkV/y+b97Y3JAq047W2qmDToG?=
 =?us-ascii?Q?loVHzDdTTG9GHt1xhqUBFkM/nOXYo2z+GXfQKfhqikG6zy3Z8gjGLHSRreCd?=
 =?us-ascii?Q?oXdFFnpYcRCwcDGTjUrFv9z8L6ME3fmbd6aRonY2H/ZH1lSryes2PpV/JYqE?=
 =?us-ascii?Q?DLud/8JxCxBnJwzpcRjdiiBorOIsNLPyGp0cf5yaE0MkcqYQXIDIxJ8fGW3v?=
 =?us-ascii?Q?CaXGVRFx8StcLKsQrHamu02R4BlSWo8LgAMEKLOxF8ODiQPTAb9UL+PUkee2?=
 =?us-ascii?Q?qcJAxuEkYpNqZWPf5iSr6OJ+lPPK0tOC8RHJVpI+RV+ac4PcwG1n8fXptiSN?=
 =?us-ascii?Q?zyWC6+Slferbe3UqJLK0YIe/aBXYFmQGyCTQZb8nYEUklLQNqjFcfgKYWsqb?=
 =?us-ascii?Q?q7VwuBWh9x8c0hYFprvDIjBOzF3MvR4ATNtvtgJG1W746x+Zjo9qPxAEco+u?=
 =?us-ascii?Q?XpHpoTsPPsHuzgrCKVgOMOP8nT8LI/oFDOMGRKr8DDz3GcpaW1UsW5Jts0+Z?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1da709b-413a-4c05-eca8-08dd09dde253
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 03:37:54.7274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cynx8nquz7EGOYRJfYNdbl+7M8LfWQdLbnb+GRCETcMqCdlaBqM+6vm7gn1p/wgQHwi/15mygL7rDQq0+NGIkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

On Wed, Nov 20, 2024 at 03:22:56PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> There are debug level prints giving more information about the cause
> of the hang immediately before core dumps are created. However, not
> everyone has debug level prints enabled or saves the dmesg log at all.
> So include that information in the dump file itself. Also, at least
> one of those prints included the pid as well as the process name. So
> include that in the capture too.
> 

This looks helpful.

A couple of nits below.

> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 20 +++++++++++++++++---
>  drivers/gpu/drm/xe/xe_devcoredump.h       |  5 +++--
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_submit.c        | 14 ++++++++++----
>  4 files changed, 34 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 0e5edf14a241..b5aebe8fb06d 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -99,6 +99,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>  	p = drm_coredump_printer(&iter);
>  
>  	drm_puts(&p, "**** Xe Device Coredump ****\n");
> +	drm_printf(&p, "Reason: %s\n", ss->reason);
>  	drm_puts(&p, "kernel: " UTS_RELEASE "\n");
>  	drm_puts(&p, "module: " KBUILD_MODNAME "\n");
>  
> @@ -106,7 +107,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>  	drm_printf(&p, "Snapshot time: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
>  	ts = ktime_to_timespec64(ss->boot_time);
>  	drm_printf(&p, "Uptime: %lld.%09ld\n", ts.tv_sec, ts.tv_nsec);
> -	drm_printf(&p, "Process: %s\n", ss->process_name);
> +	drm_printf(&p, "Process: %s [%d]\n", ss->process_name, ss->pid);
>  	xe_device_snapshot_print(xe, &p);
>  
>  	drm_printf(&p, "\n**** GT #%d ****\n", ss->gt->info.id);
> @@ -138,6 +139,9 @@ static void xe_devcoredump_snapshot_free(struct xe_devcoredump_snapshot *ss)
>  {
>  	int i;
>  
> +	kvfree(ss->reason);

Do we need kvalloc / kvfree here? Seems like this would be small in size.

> +	ss->reason = NULL;
> +
>  	xe_guc_log_snapshot_free(ss->guc.log);
>  	ss->guc.log = NULL;
>  
> @@ -253,8 +257,11 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>  	ss->snapshot_time = ktime_get_real();
>  	ss->boot_time = ktime_get_boottime();
>  
> -	if (q->vm && q->vm->xef)
> +	if (q->vm && q->vm->xef) {
>  		process_name = q->vm->xef->process_name;
> +		ss->pid = q->vm->xef->pid;
> +	}
> +
>  	strscpy(ss->process_name, process_name);
>  
>  	ss->gt = q->gt;
> @@ -297,10 +304,12 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   * gt_reset. It is skipped if we still have the core dump device available
>   * with the information of the 'first' snapshot.
>   */

Seems like kernel doc should be updated.

> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
> +__printf(3, 4)
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...)
>  {
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_devcoredump *coredump = &xe->devcoredump;
> +	va_list varg;
>  
>  	if (coredump->captured) {
>  		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> @@ -308,6 +317,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job)
>  	}
>  
>  	coredump->captured = true;
> +
> +	va_start(varg, fmt);
> +	coredump->snapshot.reason = kvasprintf(GFP_KERNEL, fmt, varg);

See above. Off the top my head idk if there is a non-kv* version of this
function but if there is, maybe use that.

Nits aside, LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +	va_end(varg);
> +
>  	devcoredump_snapshot(coredump, q, job);
>  
>  	drm_info(&xe->drm, "Xe device coredump has been created\n");
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.h b/drivers/gpu/drm/xe/xe_devcoredump.h
> index c04a534e3384..6a17e6d60102 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.h
> @@ -14,11 +14,12 @@ struct xe_exec_queue;
>  struct xe_sched_job;
>  
>  #ifdef CONFIG_DEV_COREDUMP
> -void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job);
> +void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const char *fmt, ...);
>  int xe_devcoredump_init(struct xe_device *xe);
>  #else
>  static inline void xe_devcoredump(struct xe_exec_queue *q,
> -				  struct xe_sched_job *job)
> +				  struct xe_sched_job *job,
> +				  const char *fmt, ...)
>  {
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> index be4d59ea9ac8..e6234e887102 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> @@ -28,6 +28,10 @@ struct xe_devcoredump_snapshot {
>  	ktime_t boot_time;
>  	/** @process_name: Name of process that triggered this gpu hang */
>  	char process_name[TASK_COMM_LEN];
> +	/** @pid: Process id of process that triggered this gpu hang */
> +	pid_t pid;
> +	/** @reason: The reason the coredump was triggered */
> +	char *reason;
>  
>  	/** @gt: Affected GT, used by forcewake for delayed capture */
>  	struct xe_gt *gt;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index e132294fde51..7d0e7cb977ad 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -898,7 +898,8 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  		if (!ret) {
>  			xe_gt_warn(q->gt, "Schedule disable failed to respond, guc_id=%d\n",
>  				   q->guc->id);
> -			xe_devcoredump(q, NULL);
> +			xe_devcoredump(q, NULL, "Schedule disable failed to respond, guc_id=%d\n",
> +				       q->guc->id);
>  			xe_sched_submission_start(sched);
>  			xe_gt_reset_async(q->gt);
>  			return;
> @@ -906,7 +907,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>  	}
>  
>  	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> -		xe_devcoredump(q, NULL);
> +		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>  
>  	xe_sched_submission_start(sched);
>  }
> @@ -1132,7 +1133,9 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  				xe_gt_warn(guc_to_gt(guc),
>  					   "Schedule disable failed to respond, guc_id=%d",
>  					   q->guc->id);
> -			xe_devcoredump(q, job);
> +			xe_devcoredump(q, job,
> +				       "Schedule disable failed to respond, guc_id=%d, ret=%d, guc_read=%d",
> +				       q->guc->id, ret, xe_guc_read_stopped(guc));
>  			set_exec_queue_extra_ref(q);
>  			xe_exec_queue_get(q);	/* GT reset owns this */
>  			set_exec_queue_banned(q);
> @@ -1162,7 +1165,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	trace_xe_sched_job_timedout(job);
>  
>  	if (!exec_queue_killed(q))
> -		xe_devcoredump(q, job);
> +		xe_devcoredump(q, job,
> +			       "Timedout job - seqno=%u, lrc_seqno=%u, guc_id=%d, flags=0x%lx",
> +			       xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> +			       q->guc->id, q->flags);
>  
>  	/*
>  	 * Kernel jobs should never fail, nor should VM jobs if they do
> -- 
> 2.47.0
> 
