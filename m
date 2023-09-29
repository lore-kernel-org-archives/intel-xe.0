Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECE7E743EC
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 06:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17E810E6B0;
	Fri, 29 Sep 2023 06:04:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727E910E6B0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 06:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695967476; x=1727503476;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hJxu5eAJ9U2r1hK6t7I3Qxf437aA4XCWddptJUIIUGg=;
 b=MD/x9CGHvcHq2YQyhpl1OJRnkh08TeUSjgQuz/ZE3G3qfePxjYk+l8uh
 28tVtQiSav+fpkBGEsVDNJuzDAjwU6vENVwljeIQTqIvmGMlsa6+11cJ/
 KzKjDQZ1NKeMxeUVK5CFBxbWPaWo3QkYrkIiMM5v9u5LL6nje9sDlXOyW
 Ct4QpoIvTVA8zVYJIqWpoIKS2qIo5uythsAbzOr/ICj5bJxhwjTJkwv/G
 Lc2VU1HWD1T7yJBhXaGOB2jIJdMiVFo56HlceFonHcCKzwzBenpwRuq1I
 aYFjVodP6InWhpllHWp4raPOaq/2g/avqp1x6E8/I6aosJ9oejK0wiiSm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="413147317"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="413147317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2023 23:04:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="815504423"
X-IronPort-AV: E=Sophos;i="6.03,186,1694761200"; d="scan'208";a="815504423"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Sep 2023 23:04:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 28 Sep 2023 23:04:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 28 Sep 2023 23:04:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 28 Sep 2023 23:04:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZM9EK4MWZWlj7w9xGRDm3s2atVv3VkU5PrEI5oFRDch5rC9RRqg3Cg5218kd1rjdibikvV6/m2MGcSzH/phQLA3v8fKecGxOYkYYhlF1D6tFizHLfvFIHbZ9EI2MDqCIYvIDGbqD2O8IKn8uQ8MnLhximBjP1WwdmCknNelO2fZGJTSLAQVHCUrLDE+VSM91z7ivDmQ+TAiPHnw5J5mQQiaLMccleNToP3uBfUolaNgZfWNg2AuPtj5JCB9g8xZWF/GD/sfGvZjGUhn1xRLnJuaN98uDabJ/boPlEOVTmIGtBCaeVr/9cSaB+//RB09thgdns1JrVsuN7aB8Rs/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzYVjTjKXN4oHM1KCOiBM3woPatYd6HIZHYEvFxmQI8=;
 b=mkfM/5WKvwLDUU2SXjoJ1CIcip2qtyDt4PcXrDbBvCK3QUbVDuYp7p66yvsYCOK2DLJaIfCwy6wZhqtC8gr4tK2PU74C6XtQF0lmzpIgIkBkZW4gzBK5QC6NIMzveNPyQq1IZ0ulT9x66Xht7yLsN6GuEzXL5DbVKpR1PC1c+kFqykWEN5nhktzHZMQACLP6NwDWW8txZwIbfp4LKgfozEvzTbyeAjaXIB6skPES4/GrJIFJD3j32Al4O1aLd+TTs57UcO1wJV5YHRopxQEjyCZ7wH0qdBCqxi8+F9O0OjDcWUcM04WtQKo0AkMSHwSALXXY2Kak4rJDj1cmId+ejA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW3PR11MB4601.namprd11.prod.outlook.com (2603:10b6:303:59::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Fri, 29 Sep
 2023 06:04:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%6]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 06:04:29 +0000
Date: Fri, 29 Sep 2023 01:04:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <fei.yang@intel.com>
Message-ID: <6idhbfcfcgxk66r6rtlabg6ch7zfi3xhslgqaph7ins5ej3f3j@2m7ntrcuj756>
References: <20230921220500.994558-1-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230921220500.994558-1-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR02CA0059.namprd02.prod.outlook.com
 (2603:10b6:a03:54::36) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW3PR11MB4601:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a524266-1089-491a-689e-08dbc0b1f134
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i8lHg4xRr5pOZLr6WYCMmHUBV+8sAt9oxR9jAFZtAb5DfE18IjM6HyQLI7BNbr0/VZs8v6oz+IW6XAdCiFJlLctUnp16v3x2S8+Rgml5YjhqV3aeJwgx2Eur6sPBSghPUn/nSCTfUV0C2i37ABg4M2j3+Xv+fIE/AgFdYvdC1Z6cwp+9ZzETncmxLjXhEk4gDdqjYoOw7V4wOFoaAmyKlzsNlNrZ67B561KdMyOt3y+KTIdBwoQ6gE5fiCVOaaKNQDEIyCFGaywc8lMKtP9dXIJtLvAp9xq/+4kKjXQ9GyOovVZwj02lqYEOHd+NWG0nGQaq7eJ2H4EKJW8+wtxHGKM2H3NlEcADKZXXCqUGnoj64TPCLKGio/bj7K5Ru4lWVBqsL26BSxSMTSJ9QSJtyLTYygOWypPCQEyLpJL5TCePCQ9+bwX+BvO4sHZ80Tst+qmMr1c6K6ttTimHf1qvOCKzcN4n9/5991EjnGCgCuquyIegyCFE6ph/A9FYznqfRCj8iYL9WCKFQvJPoz43NMOJSKvcPcj7SqJABlrf3QH50qDv2CrBrq0ug/ghZEiH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(376002)(396003)(346002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8676002)(478600001)(34206002)(8936002)(26005)(4326008)(2906002)(66946007)(6636002)(5660300002)(66556008)(41300700001)(316002)(66476007)(6506007)(6486002)(6666004)(9686003)(6512007)(33716001)(83380400001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z5mTKOnWU231ShKB6qhb5O1kmHicU9BtBzhZpGGDDTJ9KyW/rrezLp+oiEUb?=
 =?us-ascii?Q?3Zf/dCkK/44qfHMDhGsoLqS7hZggDdg7Oln4jnp9oo08bd0pqAb6v0DpyBjm?=
 =?us-ascii?Q?/1oaayM/c/vaQPVPelC8q7O1CciRKRNFq35kjGBmBpr+bkpvppjY0OhvK4Um?=
 =?us-ascii?Q?h4s7xhyp2IMubFRYEae0f0n8t0n5IzEuECdFh1YjNWyfV/QU18RB7kwsEAPB?=
 =?us-ascii?Q?rgARnDwl102QWn+L9h5CE+WD2VuP0DkWEcEGGl4UwnXWI2QmDVO2NyYh5g8I?=
 =?us-ascii?Q?5mk1ie8+isdsdR80fEIG0OsjEVXh546aUi2fkG5fA6Og3ZuKVgOojBPLHfM/?=
 =?us-ascii?Q?T3mJIMQ8VnjZ4vKHjo1qVXqPegD8jb85vAKgW54xLV7eGhZIEkzLG6nGHjbd?=
 =?us-ascii?Q?Erq/ONksNsHMJINGWlsM21jG0NfFvPm5go+f3g3KJXX/avx9koEXYkEblmsT?=
 =?us-ascii?Q?FJ0PYI37WkEBwGd+CcXxuFl1+UH3XJ4r0WnE5TSvKoKcAqYnMaBcw8Pca4d1?=
 =?us-ascii?Q?imdA1Mf4Y1qYUUogIueHLRBEvMw9k4Ci+ewAvPb0CreSF7B03uzuUSGOnTmw?=
 =?us-ascii?Q?WcqUMA5g3A1Tbe1XmVGo30+HHY0ssrEmzjStptli6kpmVM/9WjIdueSo3Hj3?=
 =?us-ascii?Q?EtgULCnPvmJsELDZZEWqDGk92Udk/dL/iKz2FbFHrhGggTuO7nvMlnoCTK9B?=
 =?us-ascii?Q?xBxnbgjQsnC72lsxv/qiZI/2a9Auhh+irTxRKrxAIqvptroCyps2Rrt0G52f?=
 =?us-ascii?Q?BnMGmFq+q/HYXd0OrJcNbccBBr2tOzOjc2uLoBVDfjsdzttXUghHpQrLUVJf?=
 =?us-ascii?Q?H04AszaFjALFl4Md/gSbl2vU6kJnYPLXf6Ang6KdijszGUBw09PO/RTLokB9?=
 =?us-ascii?Q?8HH3HxHcSBeuRaw500ZIIjMsynOAetDmjcl03eXJOzcmwfJpBb4zLPAjJaLl?=
 =?us-ascii?Q?NIRXIMsZ3E3c8YEbDDA71oSnDRMwTpGUBkozoRSaw9BLh6xkh36nWkv4DGe5?=
 =?us-ascii?Q?cyoTmsXtJzL0jwGKzxQGrnZzlMxpzgvYOlIpObranYJOzhp6VmFo+xCzlc33?=
 =?us-ascii?Q?TvFz8GRERNiMvHkORFbGgoD1g6dMr+0sWcTkZOngpL3Ku328MtS3wUzkla3b?=
 =?us-ascii?Q?1irrHQHUrH3YG8BDB2CF74Ub+O48ZviPo5IJy02cgz7NuQ8c6HJIYOQo7Rqn?=
 =?us-ascii?Q?4gUnifvMQUPENREJAO9Pgqc5/o6hJin6Z0oX2PUzd5JP47hNutwd0Y2G0jQ5?=
 =?us-ascii?Q?At+6I3qDVNHkyxC89r91mPjWaVPt8cQbb91lWzMkCybDMyQ6K77JbJfZQyWz?=
 =?us-ascii?Q?3eWOw7/xPXbaiheYAAHr7YVOU4xVdSykzD2vE++OB0zkvqpLzUY3LYFjMDAz?=
 =?us-ascii?Q?W/aKLZbDi0j2IMnrWS3/H2HqAtj4+geWUdJgX91KOO+CDckG6FMXKADkRW0e?=
 =?us-ascii?Q?kjAOBD8mj/ltgi8hhATzNjiWKHQ3tJ1V6neArDUkWIErCESgMbCflpws7w04?=
 =?us-ascii?Q?vAmCin/X2aUZcTwvaAUcsBZcbbFKm5J1Af8oesxmL9b2Nl2sZlXIl7wjCCzD?=
 =?us-ascii?Q?wsnu08pjmkvasDyhL7dtni7WMxuf/Hqffg1eanw3A7lwX4tQmtS04YDTkskA?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a524266-1089-491a-689e-08dbc0b1f134
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 06:04:29.5165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNivcD/9dfexjD6J9Sj1w3ZbZ01STpvhkVoM8zgexhfmo7fWdVCEA0f9/LyetkGsfv7SrG0lT+cVNpphXzWMahK+MXJZMGfrk6vlIt2rCxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4601
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/1] drm/xe: timeout needs to be a signed
 value
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 03:04:59PM -0700, fei.yang@intel.com wrote:
>From: Fei Yang <fei.yang@intel.com>
>
>In xe_wait_user_fence_ioctl, the timeout is currently defined as
>unsigned long. That could potentially pass a negative value to
>the schedule_timeout() call because nsecs_to_jiffies() returns an
>unsigned long which gets used as signed long.

applied, thanks

Lucas De Marchi

>
>[ 187.732238] schedule_timeout: wrong timeout value fffffffffffffc18
>[ 187.733180] CPU: 0 PID: 792 Comm: test_thread_dim Tainted: G U 6.4.0-xe #1
>[ 187.734251] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2007
>[ 187.735019] Call Trace:
>[ 187.735373] <TASK>
>[ 187.735687] dump_stack_lvl+0x92/0xb0
>[ 187.736193] schedule_timeout+0x348/0x430
>[ 187.736739] ? __might_fault+0x67/0xd0
>[ 187.737255] ? check_chain_key+0x224/0x2d0
>[ 187.737812] ? __pfx_schedule_timeout+0x10/0x10
>[ 187.738429] ? __might_fault+0x6b/0xd0
>[ 187.738946] ? __pfx_lock_release+0x10/0x10
>[ 187.739512] ? __pfx_lock_release+0x10/0x10
>[ 187.740080] wait_woken+0x86/0x100
>[ 187.740556] xe_wait_user_fence_ioctl+0x34b/0xe00 [xe]
>[ 187.741281] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
>[ 187.742075] ? lock_acquire+0x169/0x3d0
>[ 187.742601] ? check_chain_key+0x224/0x2d0
>[ 187.743158] ? drm_dev_enter+0x9/0xe0 [drm]
>[ 187.743740] ? __pfx_woken_wake_function+0x10/0x10
>[ 187.744388] ? drm_dev_exit+0x11/0x50 [drm]
>[ 187.744969] ? __pfx_lock_release+0x10/0x10
>[ 187.745536] ? __might_fault+0x67/0xd0
>[ 187.746052] ? check_chain_key+0x224/0x2d0
>[ 187.746610] drm_ioctl_kernel+0x172/0x250 [drm]
>[ 187.747242] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
>[ 187.748037] ? __pfx_drm_ioctl_kernel+0x10/0x10 [drm]
>[ 187.748729] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
>[ 187.749524] ? __pfx_xe_wait_user_fence_ioctl+0x10/0x10 [xe]
>[ 187.750319] drm_ioctl+0x35e/0x620 [drm]
>[ 187.750871] ? __pfx_drm_ioctl+0x10/0x10 [drm]
>[ 187.751495] ? restore_fpregs_from_fpstate+0x99/0x140
>[ 187.752172] ? __pfx_restore_fpregs_from_fpstate+0x10/0x10
>[ 187.752901] ? mark_held_locks+0x24/0x90
>[ 187.753438] __x64_sys_ioctl+0xb4/0xf0
>[ 187.753954] do_syscall_64+0x3f/0x90
>[ 187.754450] entry_SYSCALL_64_after_hwframe+0x72/0xdc
>[ 187.755127] RIP: 0033:0x7f4e6651aaff
>[ 187.755623] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 77 1f 48 8b 44 24 18 64 48 2b 04 25 28 00
>[ 187.757995] RSP: 002b:00007fff05f37a50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
>[ 187.758995] RAX: ffffffffffffffda RBX: 000055eca47c8130 RCX: 00007f4e6651aaff
>[ 187.759935] RDX: 00007fff05f37b60 RSI: 00000000c050644b RDI: 0000000000000004
>[ 187.760874] RBP: 0000000000000017 R08: 0000000000000017 R09: 7fffffffffffffff
>[ 187.761814] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
>[ 187.762753] R13: 0000000000000000 R14: 0000000000000000 R15: 00007f4e65d19ce0
>[ 187.763694] </TASK>
>
>Fei Yang (1):
>  drm/xe: timeout needs to be a signed value
>
> drivers/gpu/drm/xe/xe_wait_user_fence.c | 55 +++++++++++++++++--------
> 1 file changed, 37 insertions(+), 18 deletions(-)
>
>-- 
>2.25.1
>
