Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29393C61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 20:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCFC010E036;
	Fri, 28 Aug 2026 20:10:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1GNYDWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EB110E036
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 20:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787947832; x=1819483832;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qyWrSnJv2yZsBFMTdSunvPiZTdQqr0N+kL5AAMNI1+s=;
 b=G1GNYDWphdAmdBEjo8oFSf8VsC/LZuCw5NcE5hVAqqJ/OH+4SzegwlrU
 8Z0Ajkx5lSPEG9y6pY/XmmwOiC6yOJACXMn/r7IwYQ9vAnhpQQdXgfPlk
 /dohHR2CxqTgfyA6LST5YkmRL6rGorqoK1v5E5X2UEMSnqgL4BKDtXUqH
 8I8q6NWIROrhaAClz0lUF1iodzdHpRP+sJtqVDpJT+8hGjfGTQy9FfUCT
 0T47qSwYI+zOIUvlOFdXEVakk+lR8XLu3qsqCv/gACi0JSIJmFP6g02cI
 3kynXawxGfwLPMhGorjnzM6aFxYIjcGibOsNOMfMcOGRiah/a+qIboLBm g==;
X-CSE-ConnectionGUID: 8LKg6+94SsyHCPZlkuZl2Q==
X-CSE-MsgGUID: gUGZp0AdS9qYTgx4v/1SHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11889"; a="99125608"
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="99125608"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 13:10:31 -0700
X-CSE-ConnectionGUID: drCop8uEQRet5vAuVpS4eg==
X-CSE-MsgGUID: QUTCWogiQG6i8yKh5FD0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,249,1779174000"; d="scan'208";a="273512714"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 13:10:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 13:10:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 13:10:30 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 13:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6qRgwWbYgmOhsJwLy5JECEC5RWX+Bd1emwjm5NPFX4GOTy3Rw+7AsPrbVUJkuXfP3L+8u9AXSW8EMZw99+LL851arm1GDkGgr6NSKVJdemybLiM1+8Bz78KAclyCur5zRyfGl1VPQRqvUyIiNkAjB4RsjyP7ofGXoVFzXsTkfTI5n/CmiNJwUVMkob/bY8b1dE2qlLEdw4OS9NTl5QVmbqy8gkb2o55vxWJnqi7uQCIAexdfU3g7YIP8iBM+1qA98eoeLHRja32/8DcN8LUr7oBlQJhtP4GjCD9zT7/pLeaFybadeglucshYADyV12l285xdhn2qoBYAjLkxkIn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deqCBHVaAclM5cnJZO+g86Cask9jiACbYGv6f9XkdHs=;
 b=BcN/bRIKIcGKiBKRI0N0jZPdlVd77wfKmaCIpgNnkVXXvk/QFztiLpQ1fBHJ46nE7W6xCK9I90JsrLZ2rsacB2ZFcmKwax4LPLNK1LfV9+yO8EOa34n3JN269LwHFiTFCvV0lfGU/oLBAd+ATjbYFmm5eUJHUwMTlbb6reQGootA7+4fE3DJi9MesmTpYK9pZ33LClR7UrRGCXsBTCPXpwy7viA/eoSOuCbDY9LL+BXBVPSf5754TSG7E+MAv/rWXKGTVO6hctSUHEZyWNLP4IGkETsMcHP9/AuE9bcTsLkNnfEs2xlGpw+8Ufd1APfvhKJY98ROKKpjLDdEV8tlgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB7773.namprd11.prod.outlook.com (2603:10b6:208:3f0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 20:10:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 20:10:25 +0000
Date: Fri, 28 Aug 2026 13:10:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <stable@kernel.org>
Subject: Re: [PATCH 3/5] drm/xe/vram: report FLAT_CCS base misalignment
Message-ID: <apHrLxFCdzGPs9vO@gsse-cloud1.jf.intel.com>
References: <20260828151405.662533-7-matthew.auld@intel.com>
 <20260828151405.662533-10-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260828151405.662533-10-matthew.auld@intel.com>
X-ClientProxiedBy: MW4PR03CA0291.namprd03.prod.outlook.com
 (2603:10b6:303:b5::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a524215-e542-4595-b11f-08df054065e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: rGRkSGJ1Z6ymlIsi2J/2YuLNpMEVfLdwhif6Fxt3D+bvu2fDjCWaetEz3W0uno51twsl9ZMzU4EuCCGL5WKCcQhXFhz7oC13gl0L1w8eWt8Ihb6vZCPfRDdjSTEsJxn1YYVHWx4U1+62euRijj7nM5N9C4wqpCZBFWATmhkmfV1msCstRzbU0EgpBuTheMbU53ZR6EjBn95IFcQMCHl//R3dm0AyCeyeuifiKnhiBU9mh3lHKV/5VPQcEpkjYWvjM7+aEMdeiWLPXExtDzS2GYcW+1I2zjixuX7Wdf8cP3UOR/tHsW8626LNeGyVikIb2hbBYJ2QBUgvf9B/3pKPSY8l3tul/vNjn0k09Y2uXZ51HwBzIcuO6ReVvCe1rxpTiAM9LPqck0yVcO/vyx94VNEKIxU8t4wS+mFUfYJPkObY94SeOrov2UAET34itBPUA7db5IFKdAi2mXGCokmeb1ryqIGglGa2vlHWzG646az1eN4Rs31Z6xVsHTPqtGN/0z1qGSuAz/K6gAwuBEyvV4ezOlv7vATkiJfcfaE0gOg/NFEaejrvhDfh/oOlBFwHHU2j7ZsnbBuFC+1CIxXtXMBI7dGFz2ZMmrDuMWsxYvu1HVVX6JNuD7QW7SDKcCgIcS+v/KcTGxXiMaq3BRV/3qJdFnXL2ePLr6yC/F8ZwV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?R6Mn2xOQqikXVz/MCpdBKrF/NOwSQjAmsAK4qse8RuOzVOBXO6q9rISCE3?=
 =?iso-8859-1?Q?jToWAzFW44KZFOKOA8vKYH2QKGf5aa4pfPbQGsvqgWPLByo4fzqLUZxFay?=
 =?iso-8859-1?Q?R9+J1QO0PeBiVfFE14slvaGIKaJNAfJkoTRKUdhLSPEd/wvwj7ACm2vp3y?=
 =?iso-8859-1?Q?AIKbhsvh5W0ZNqd7QzwF0A0pERVwN4/CeCajEobNGqfZSsclN4rQ05h2LJ?=
 =?iso-8859-1?Q?2c+ZiOhPY83zZB16pR/Hqi6HhPIhfMlj3KoIQInPRpCAke4RVZ/LmLQKkP?=
 =?iso-8859-1?Q?xQgiJJD0ER1Dr+7G9ZzEaEBRu2X2Q/WeiFTki2saq/P1tUARNxghXuQ5I2?=
 =?iso-8859-1?Q?Uxazyqy6h99LGTwUqp+xXdELeAQJA8wmb4dcDD4STgLXxJFzPBkNBb59z7?=
 =?iso-8859-1?Q?J42hXY+/pY/yUJXpE5OWn2nkPR5ztTQi2i7LJWjuL8VoJ8Bu4gxc4vSAE1?=
 =?iso-8859-1?Q?WcMpblQ0Q5I1JSXcL5b+z/WX5ZlXvlxJ5jcTvMSpLN4UPdkNVY/lGRBjDe?=
 =?iso-8859-1?Q?6y/zLa2Ffj80hQIeQjSwkTnTTnBjiR8tKsu+mXakTF9R6nzY/8uAWtJqpw?=
 =?iso-8859-1?Q?7EsDW+fCcyjK2NtzdaUbqT57llL3Q+df0xFfU/7q4WLLdr3iFTM0GdIgp1?=
 =?iso-8859-1?Q?SPMcTfciK7aiaL8Gqn0ivxxT8BlIzALXBHMPvc1qkg5XdwNq0Q7Q28lbA/?=
 =?iso-8859-1?Q?sJPlb1fVVYQqbcws6rT6jTd0u3too8XhdzHF3cHhkFJ9b2tW7W17wgB2Di?=
 =?iso-8859-1?Q?DxV1UdeEj37bw34v7dgjzSulhi7V2T3JuVECewwc3el/LiZamavT77sz8g?=
 =?iso-8859-1?Q?I6wvpgz5wu9X+5irZ7MV4kXPCaer0qbRQldYQS/llEUhs4/3Vk54C6J16B?=
 =?iso-8859-1?Q?YR96anfCTsCEdM45pMmWC6UNxLSkxwWY3Cgsw1uV66uHJb+5VQNtLYS2Iq?=
 =?iso-8859-1?Q?CjXdhFqbnI26cFxrfTy1RJt54m/9nKiBfY35nNZMDINi6JcAWuFyRjiJMq?=
 =?iso-8859-1?Q?8TmAasIeY9SKbN9Xu+uBkcGipxmY3/QjJqz4Zk9f/1/MA9Pf7ComOMgpvX?=
 =?iso-8859-1?Q?oTHQ0t4KdRPmcBAv5nAMKQtsVRFzUxbhXggU2la18paKh6qQep/mfyklNj?=
 =?iso-8859-1?Q?UcZ2dfV3o3Pc9ldJhFH2tzGQBmSanGw/kQwKkxY0ny23nKINoIW0grceuj?=
 =?iso-8859-1?Q?0IE/GvXnZkP/Ra+wBVsYrREY+EiLH+t7L01VCtU5gzlTM7lUSRAgqXEvdF?=
 =?iso-8859-1?Q?zaAOp3lHW0092TbScaOYB89zfRKXcwnmr3iV39SmmDOUtuYtDK7GmU6FwJ?=
 =?iso-8859-1?Q?BE6oGXq4cR9GvwHdjVag84m4FkbeqNRjRebLd0OrGvtL6MIv2NzxYYnP0N?=
 =?iso-8859-1?Q?R5pKAbHKYwl+5eDFrghypv9P4TY2E+QQM3xUvowZ0xntbnCfOcAq3vOG6z?=
 =?iso-8859-1?Q?sN2oi7ByC6h0HZBN3Irc9I39f6Nmc3bPyoB/+h5lsU736YZGHqGLTWfW7q?=
 =?iso-8859-1?Q?+XtZ1MDbGYjGsDpoOn82vQIYs/pB4QG7+PHXgVrgr6hacFNgC4Mm8asjO3?=
 =?iso-8859-1?Q?KAM4BpkUckAfhDROho/vbEVa31ve1/ITGm/enuAkXlt6oCia/qILr4wBAZ?=
 =?iso-8859-1?Q?WWrXOMuE8tL00wHhWyqzBL3Osqs5KbR+W6XaHXgEZBFetOmxQqE2hIDIQU?=
 =?iso-8859-1?Q?VKav/m7NicVs3b7xrUQeX6u86fWdtoqJRra8AWF0p4/RBzLyiJxqUAWROz?=
 =?iso-8859-1?Q?QlapNLOemml4PA4bNMoRPgJqcqqtLADQsnDxq2aSF21FTKt3TqLlg4P3ZF?=
 =?iso-8859-1?Q?xtjKWprcLi1DNNIujjzLI01PoLSc4BY=3D?=
X-Exchange-RoutingPolicyChecked: eYq6F7Vk4iL7SZhzpLvpOxDhNVgghY7J+raaa17eKwEppOg1X2jMcF5ec1TUw51/MGhcDUdnnThusa8P6pNKZCpCQUDhe0jxxo5qL53TVRJcI3QHxPTaxAIQCYV2adC9qit8p5pKYZ9GIE4tiUGMIXyeKpb6Z8rMlTvdfJsbVbpcPZi4ZyiWTXPE4GcKlusxe5lmL2/upePJlMT04RObWEBen96F+s1asgNWvS1rMNNACkYa0UQGNgOJcEJt3Gn9ophn0UmgH0xnjIDaTh438lSvZGUTAfahVAPZm01udCPW9I4DJ7PCAEceOHPLVCeHuRKCy7rsHNihkkF6IcC4jg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a524215-e542-4595-b11f-08df054065e0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:10:25.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWLG9vmBPsRHSZgUjvTO7p4ueL/cTZ7nkC2rp2mIEFgJ+GD5rvr/HKHdLgAbiuGDXd+sv8CywnyRCSw641CTcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7773
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

On Fri, Aug 28, 2026 at 04:14:09PM +0100, Matthew Auld wrote:
> So we can easily check if a machine had the CCS bug, when looking back
> over bug reports where we have the same machine with newer kernel.
> 

I'm a little confused about how this helps, so I'm thinking out loud here:
 
- On old kernels without Linus's CCS fix or this patch, there is no
  message and we get silent corruption if the affected memory belongs to
  user space. Of course, things fall apart completely if the corruption
  affects kernel memory, as in the case Linus hit.
- On new kernels with Linus's CCS fix plus this patch, does this message
  appear under load on some configurations, or on all configurations?

Is the idea that the first thing we check for is whether this message is
present?
 
Would it be better to simply print the FLAT_CCS base address along with
a field indicating whether it is misaligned? That would let us quickly
determine, across all devices, whether the CCS base is aligned or
misaligned and if the CCS fix is present.

Matt

> Fixes: 37173392741c ("drm/xe/vram: fix ccs offset calculation")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: stable@kernel.org
> ---
>  drivers/gpu/drm/xe/xe_vram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 7b4478fb1697..0a2f1ab8416e 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -90,6 +90,9 @@ static int get_flat_ccs_offset(struct xe_gt *gt, u64 tile_size, u64 *poffset)
>  		offset |= offset_lo << 6; /* HW view bits 31:6 */
>  		offset *= num_enabled; /* convert to SW view */
>  
> +		if (!IS_ALIGNED(offset, SZ_128K))
> +			drm_info(&xe->drm, "FLAT_CCS base misaligned: %llx\n", offset);
> +
>  		/*
>  		 * Everything below this offset is handed to the VRAM
>  		 * allocator, so it has to be the *first* address the
> -- 
> 2.55.0
> 
