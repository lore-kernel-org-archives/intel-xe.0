Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECDBC5B572
	for <intel-xe@archiver.kernel.org>; Sat, 22 Aug 2026 03:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694410E185;
	Sat, 22 Aug 2026 03:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j6duMhFT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5835E10E185
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Aug 2026 03:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787369323; x=1818905323;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hlqwYKPKtNy9ZwvQoVE9mUP7FEMEtJVHv1O9rIpdwZs=;
 b=j6duMhFTTvVoQkIBmBis5d+eFhOfx+2QBW8IBSYBE4j/4PhfjaTcI46O
 9z8iVjHqtPoFWjeOWXnsl9IkhiRNZFdIDEuReN6qOc/QbOxVcU1+EBSo2
 oWLmyucBfGj3mZD8n8FOeDTsMc8NSTUgnK0Nd7Ql5fUU0r4DOcgPlxbS1
 PO8eeZ54xaZyOZveyaLaznBUAO6OJMlgAll5MOMNnypfSQn7//GZKeQhw
 +OdwWRLL1xkVKTD/1UYV7zEbQlK5T1RHK0rLyWdjM2WetuGZaaojl4AHd
 JF4rJLuebHZfP5WuEhQNFMdPd/5oaUpwKOfn2UPJO2FDNYOaSmkTd8m00 Q==;
X-CSE-ConnectionGUID: eChZCR42Rju04oQMjcfJ1w==
X-CSE-MsgGUID: TC/2kH5kSHafF5kAl+1ZeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87786151"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; d="scan'208";a="87786151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 20:28:43 -0700
X-CSE-ConnectionGUID: j9gZoTKiRqGIO7COHzW2+Q==
X-CSE-MsgGUID: iRsu8/ZCT62X0dwxucFFHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; d="scan'208";a="296416137"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 20:28:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 20:28:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 21 Aug 2026 20:28:41 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 21 Aug 2026 20:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W0m3lc2jAlJuPe5srlL8+lY0lkHHe90sEbo8MfD9yrY9dW/09ZjBUX6VNT6OAnYo4tSV9d/ATzRPRxfBNNiYymsDHKsDr2fex4ouNhc12fCNOx1V54SL2rPbKLH2yJxkz9IfPMLam+nLYhPqebR5awenJg1faBEwmOaDDDMEVYM4KxrkxDrIFr+1evrkilhxHljVMfu76QGU6ZvGHgLYY4JaQi0/cbZik6hrTbCHiWwKjp28EkaHRWpnxSyWXVhNKqrY7lS7xLgtWTylJuZ8NYEbjy0/JGVbmaJKmGe039ERxtjzXbvqmlfDdsVJWig2VQyzwFRccazvlZD9fePZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qza9EmF1Ju9rqByU7Oh2i0X9zpj4p4a+kPfxkOOLts=;
 b=N65DdQbtc6gn7aOJ/D22mD2F36Vcs+DhfryMAP1kjhG4fnuqnUrTaXQHaL1fHSvzszybGPy3e95836+cZN2QFksNOwsEMQG11Dp+MEcM/uBPlGTuNofYhG2NdAZJIdjEGVNxGpTZcRZvJLX3P1np9XQSLLRWBvMex5oVj3et0vVmSd5bvCuSBax8SZQxTdF/lPCrGameYJCcbjnqNmdIJ45HyMTZhgn3Gd0/TU2OlXE0qd3EhduS3pj4wWkD51Vp+JrYXGXQtQTm2tusQzc3oB0e0qpQOAfVGuLnqwkwxpwUKsOKVEVRnYrsc7fWBKjgc32EVNqwJJ+hzSB/c2uvXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 03:28:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 03:28:29 +0000
Date: Fri, 21 Aug 2026 20:28:26 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <shuicheng.lin@intel.com>
Subject: Re: [PATCH] drm/xe: Bound pgtable update loops by current_op
Message-ID: <aokXWuF5oxk+b1xU@gsse-cloud1.jf.intel.com>
References: <20260821183642.6709-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260821183642.6709-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc833c1-26c5-4416-1de4-08defffd6f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|18002099003|10067099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: zeTEvv17dy4FxURgvRKWikFBGqwCBQZHx9BMtOT5Ae5pBoipIZ0t1dbAin24ZsNtJDCeNh++g1YpxJxnrwGRNF2ov2WOpao36do3bndKL6nSrUmnHYhgGPGBYOb5DdjYzzaAdS1uc+0Fso+takgqQC1ArxltpXsZmhxbar+n8n060/R62VbQesgYhCxqsxsxyVzRXabJL++G3IY7otUQbw3Q8Cuj5VFzjS8bO7AGoFhrPgq3cmwuHQT8CpXL1HdI1bpV06qkv6dA3u1YnfwiRBqZUr+/5Rl5f/SQSAzfmQcjOF6fZclLVXCKVzdF2+qWQwAA+GPf0Pghwx0vg4jqtVoe5WDSHClTfa4w3cDcsAJmuTgE8Kjk2IYxn2c6Nkzl2ayDU+c8OcTr7z9NPl86A+WCBlNlpSGoVC7jlVANmvw8pUcko3h5+D0AmxX/bv/rdumAaJf7N2/m/x0FE3RssamT/kgBNMXSDIhlNx2UwxjxahND6UI9YyW7JbNXTjbUmtTKZVclM4HNyKQLSslkNukqInTJobvZjbnNpz9MGvetU/0hq1a8sblV/tPREvZ1xxcXrD7jgSFENhoX0NhBbGAID0HUyH4gVN0/LkleHyhc6IvN+P563y3BzbmjnksYbkljWZQN7x6rN4rRiclO+Ju6HwgKGFA6VgVJ7Ks0Bqw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(10067099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d9LkIHNbTpS9+H2QwVJYnQz6RQmiVuY/XRYB2n7hxD/05eijM3S0M0+fmBgg?=
 =?us-ascii?Q?jPtSqycTv7BLRD16r7MPxkuEEdJ1gWIPo3Mt2r6rRfil3O3IUWwIC5824wgX?=
 =?us-ascii?Q?rEXJFGUFi/LuVgzkCukfr6npV6LMAh6V6avsO+hJlCLJ6gsOiFeo3+Xr2orK?=
 =?us-ascii?Q?VBHE1y+G16diiMrNCPqZWqv+cD9GkBbcIO9HrxLU8QOE68OKFIY5IOtqKxJe?=
 =?us-ascii?Q?q3Ii4or4cWPVN+sgbilFXYb4eT97MaGlndI4N7fYLHeFjearJwSQ6Bza4LYA?=
 =?us-ascii?Q?uK/mXO55S1n1et94RajzT+KKiNZRFL8ISm6y+7yRqkdnCvStywq9LESUPTWu?=
 =?us-ascii?Q?mMUzZkUt+zbQYo6brJbgg4XGTr/HvTJGoIgYFDQB79xczT65DFUZOlCWgxi8?=
 =?us-ascii?Q?Kp1qIwF1p1w90oA+4sgnxbWlXhGv5r6E3LX53pnGRoGBvLHTq0KmyI/mjC9X?=
 =?us-ascii?Q?nAda8ltuYULSGxY1uwkV/kMLLfUOMW++d67T+mbDlTMeOXTMjibsGnWugI0I?=
 =?us-ascii?Q?ggoZaA6KsJrePqBo/FXAWYy6nhOH7TyeySnh0QkfFkVY4HY9HcDvLlDpgioI?=
 =?us-ascii?Q?P/MFLrfUOQlsq0+W7SbIykYXSQvv9qsbqNBPj7+rimJITdzEy7d/5nswKN2k?=
 =?us-ascii?Q?E7tPMGPhzHuyxNLlZiQPxEYFzKqfsTWfXmH25PnuquU7b3nG2QF335QtS60a?=
 =?us-ascii?Q?FB10GpaU07CWY7pNiYSOCyd3senk5XBq+jQbYSPoh3aXEYb+rKTFUfqxgetK?=
 =?us-ascii?Q?dPNXl7EklDf4EeLc2Xl9DBijHqfbVBTQtdQ0hexZVh8lwxLn/RZrwn8nFLSI?=
 =?us-ascii?Q?+s9tNUR/6PVtgmDCn+sxBtG7HVda5UDw/g5hP2Bx9HJA40YnH3eTtWQlaDgL?=
 =?us-ascii?Q?4iVr4w5PEQnZfTLxjdKj8JkcfTlo888CGJgreD1nsVKY7Op9Ty2isNUrirbT?=
 =?us-ascii?Q?spefs5Kg8CnoC+Ek4kTH4ZXz5wS7OADXRzQY6kWqZlOm6ntkNNpP8DPiHLhc?=
 =?us-ascii?Q?zVbXe9ojnX0POFOYMD3f4GYuGzFNAbKKXOWePK37ocwL5s3ViF4alhU1REMV?=
 =?us-ascii?Q?nKaibItYVIMc0Mp36OOG31n2/DpuXXcuriYE1fujKYlzW6KK6/YFs3G0gYDR?=
 =?us-ascii?Q?n+Fgw3G8X4LxnZzjYVahRTYIhoWYR+UptJ7Kj1n6uUZHsovybOF3QrNaAGBI?=
 =?us-ascii?Q?tsd/MqGeuEMj/WGojPV37Qz5h0xA3CmdgIfpSomD/iVZwS/uiaT124tsTCJL?=
 =?us-ascii?Q?Cwy2PNpjguoGAyT4Fp4h87thiiONzFgMik7EVFLNY7LfGFz7Itxdi2H5wbgv?=
 =?us-ascii?Q?VICWGcLZTFtBpKzgHrdi1qpPwYnUHyRbMGOQEuWB8BLGVrY7vcoqwGLFTorE?=
 =?us-ascii?Q?UH9qr91/PTbfD8YJky6AwmXL15ZIpQTyVS7Qvdq7ZqWICt2A5sxwwMMgwuSo?=
 =?us-ascii?Q?VfDjhMIoZDRPe9gntawWiheifN1wbqxqiSBqEkQu6TUCYZ2/62e27dDj0X5/?=
 =?us-ascii?Q?j4ZmQQIXzDEvurOB3uaeizybF0GNE405Bs8q/nS997NOW3SG1RAo5wncfVEs?=
 =?us-ascii?Q?rX8LurNNBwNlS55IUF1YKwYM5rlZufBDuKr7kvQHBWjbj4ptGqID3bOtp4bb?=
 =?us-ascii?Q?JOULaowFWTFrCGzuacd1LYMg9qcxQ2W6RPBlhBEBUMZ6AsMIXDOkUkFWXsem?=
 =?us-ascii?Q?pEgTCOn2cFJfCp8O1GMI5oYYOVDrSsler7zBuN1C3qTMxqQrZl2sbEi7TuT6?=
 =?us-ascii?Q?OEnK9uVPWDhZbu2z4vbNjnE6+K7i2fk=3D?=
X-Exchange-RoutingPolicyChecked: V4OIMjhaCYZWE26ubuf12WaLD2btrOEChFgJ/WOh+RJos8gEZWjkKyDxJTpVpfcdPTLxl4UgpRuQjM5iaV4Mhj6pOD2B1sTDkGpOSiB2H7PJIlEPHImsC27IO4h6DUuYASu5kPd2/SH5BvJ45nIWhCnKfwK0DTEfHi2m9JEfBRBzrOMgNlJlstoR0g9Nb1rFFbU+JdwTYtrKIlzSByK0NtJqq49p0rxYJhHc4fKX3CXHdc/OssKlvKhyNBpdNXrG6lcKdJ/4iWAz5SPYj4d/dzz3lDXHjWkCdstyNvdoblOZTZgosF9kicB65j4oCPagDK1w0v3TGELieXZIBBVXHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc833c1-26c5-4416-1de4-08defffd6f2b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 03:28:29.2892 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sXPj+kx0D4XYzaSxoRETqFyOFEhtHn+nstGzQzHgrHvUeJycsfJnaYQNOlR3uGcBWImgCJUG5vz+ebUqDEuKoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On Fri, Aug 21, 2026 at 06:36:42PM +0000, Jagmeet Randhawa wrote:
> xe_vma_ops_alloc() sizes the pt_update_ops->ops array with num_ops, the
> number of operations reserved, and allocates it with kmalloc_objs(), so
> the entries come back uninitialized. Only the first current_op entries
> are ever populated. xe_pt.c reflects this and bounds its loops by
> current_op, and xe_pt_update_ops_prepare() states the invariant
> explicitly:
> 
> 	xe_tile_assert(tile, pt_update_ops->current_op <=
> 		       pt_update_ops->num_ops);
> 
> xe_migrate.c instead iterates num_ops. When fewer operations are
> populated than were reserved, both the CPU and GPU page table update
> paths walk past the populated entries into memory that was never
> initialized, read a garbage pointer out of it and dereference it.
> 
> A syzkaller reproducer triggers this with a VM_BIND / MADVISE / VM_BIND
> sequence that reserves five operations and populates two:
> 
>   UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
>   load of value 107 is not a valid value for type '_Bool'
>   Oops: general protection fault, probably for non-canonical address
>         0xed6d696d6d6d6d6e
>   KASAN: maybe wild-memory-access in range
>         [0x6b6b6b6b6b6b6b70-0x6b6b6b6b6b6b6b77]
>   RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]
>   Call Trace:
>    xe_migrate_update_pgtables+0x32b/0x2c90 [xe]
>    xe_pt_update_ops_run+0x835/0x25e0 [xe]
>    ops_execute+0x691/0x2630 [xe]
>    vm_bind_ioctl_ops_execute+0x46d/0x1820 [xe]
>    xe_vm_bind_ioctl+0x3d5f/0x45f0 [xe]
> 
> The value 107 is 0x6b, POISON_FREE, left behind in the unpopulated
> entries by the slab allocator.
> 
> Bound all five loops in xe_migrate.c by current_op so that only
> populated entries are consumed.
> 

Can we find a fixes tag + cc stable?

Patch is correct, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 75b83687f1b5..b1be1cb2fbfc 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1825,7 +1825,7 @@ xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
>  			return ERR_PTR(err);
>  	}
>  
> -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> +	for (i = 0; i < pt_update_ops->current_op; ++i) {
>  		const struct xe_vm_pgtable_update_op *pt_op =
>  			&pt_update_ops->ops[i];
>  
> @@ -1871,7 +1871,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  	bool is_migrate = pt_update_ops->q == m->q;
>  	bool usm = is_migrate && xe->info.has_usm;
>  
> -	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> +	for (i = 0; i < pt_update_ops->current_op; ++i) {
>  		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
>  		struct xe_vm_pgtable_update *updates = pt_op->entries;
>  
> @@ -1939,7 +1939,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  			bb->cs[bb->len++] = ofs;
>  			bb->cs[bb->len++] = 0; /* upper_32_bits */
>  
> -			for (; i < pt_update_ops->num_ops; ++i) {
> +			for (; i < pt_update_ops->current_op; ++i) {
>  				struct xe_vm_pgtable_update_op *pt_op =
>  					&pt_update_ops->ops[i];
>  				struct xe_vm_pgtable_update *updates = pt_op->entries;
> @@ -1976,7 +1976,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  
>  		addr = xe_migrate_vm_addr(ppgtt_ofs, 0) +
>  			(page_ofs / sizeof(u64)) * XE_PAGE_SIZE;
> -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> +		for (i = 0; i < pt_update_ops->current_op; ++i) {
>  			struct xe_vm_pgtable_update_op *pt_op =
>  				&pt_update_ops->ops[i];
>  			struct xe_vm_pgtable_update *updates = pt_op->entries;
> @@ -1994,7 +1994,7 @@ __xe_migrate_update_pgtables(struct xe_migrate *m,
>  		bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
>  		update_idx = bb->len;
>  
> -		for (i = 0; i < pt_update_ops->num_ops; ++i) {
> +		for (i = 0; i < pt_update_ops->current_op; ++i) {
>  			struct xe_vm_pgtable_update_op *pt_op =
>  				&pt_update_ops->ops[i];
>  			struct xe_vm_pgtable_update *updates = pt_op->entries;
> -- 
> 2.43.0
> 
