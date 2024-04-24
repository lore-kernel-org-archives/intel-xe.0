Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C3B2C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:56:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4705710F03D;
	Wed, 24 Apr 2024 03:56:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFdci7Ed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF7910F03D
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713930989; x=1745466989;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YB5MYqXfBwpSeBSchZu0lwCII8GfDhOpB8i3Fsw7hHE=;
 b=JFdci7EdKLr5jeDal27yJlsnbtpWBchb8D24x4oW/Uy2nC+CtTKlANrg
 Or4B7lFjVxKuoWO+zjk0mvebdq+CGDqYfOqu5ZugWmq5ThDqx7QCOx6lp
 EXkVAi3nubVBx+h1iVBnVtkkfqm/iDemYiKIaATnBon+p+B6XwQgrqTC9
 jhij69fhGT55bMLXS7A1gmwqEsLX3lVxj2wDJCh/jq15chSEL7cGxjeSX
 LAKzCIUZOaD99jQdB92F1zpW+m/jLmSTMfOqBriNCw50k85LT4V/+eaTc
 PU4Wb0FSIJRysYmAnDQD21Vo8hZs88pUtdDeQbHMExz2SsMEZW5NZimtL g==;
X-CSE-ConnectionGUID: zlgQxoakTwCZZwtDngdy7w==
X-CSE-MsgGUID: OjJp7DC2Q/Wy0ABf5y/BBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="32032151"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="32032151"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:56:27 -0700
X-CSE-ConnectionGUID: +eag3VZ8Thal9vnvlAjjjA==
X-CSE-MsgGUID: GhRRrb+JTHymU5ZWD6ddAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24616593"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Apr 2024 20:56:26 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Apr 2024 20:56:25 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Apr 2024 20:56:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 23 Apr 2024 20:56:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kyb9NS2YEp+361Zi6Gb6/QjbkFMPydRILRvkqwu/CxARsi1x9v8EGWQKCZNchA0GW4IbdqyOIvmsQ/GqBwUrsavXhV7nG9/MW59bJPX9nc80SZ7eSIsbrAXMO///soXn4ouGd9u5YN1gsc2wvBDgh0RskLYJYEXMgnkR1u3jgvTW0k+/cx6W8pWb82fhkW50lBPHqd184nE+kAsqE6udeliPnfsMYoXPBhpD782bilFZm9v0zspIYk8eYRiqeifus+SdSZD8B4wkriOCUq6gr+5luYJy/ssL/i3dyI7z7lA6U7KHT4A1MhJsTOHTjF748Tp/bM/COVLnb3TQzEtPgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3AlVbCKiHXS+Kd5IaJLBr5JNqk3fMwn4CqRQ0qDpq0=;
 b=HdJojOzMuDIvWpJRTNmxFSB3jp/ENHXog+QLxRmbECWLzlku43xv7etekfGcL3YtYcTBlDElH21ywowETj8G5IVaUgLyEooN1XLsAMT35jGdBsqEcrm5mwPBk6z7u2mEFfoRasFNLJtQQy/tKDMJMz6LTx3HRIP8ukzpi7Am7cpw3ozJ4eUD43lrVtrgkmigOfB5oPnTUn5wS5fPk4Lfj2/Vs84m5OA/Y83uuvoBoiG6NKvoNJcjTY7aDpnSGXVCOtoyTYvjezCKslYsixbkUJDzjTq1VA1tZj/jp3QlFWF6/EbZYvOI88sn+F/iJHP9nZz+qrMS0rb7hmWT6qgUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB8134.namprd11.prod.outlook.com (2603:10b6:8:15a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 03:56:23 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7519.020; Wed, 24 Apr 2024
 03:56:23 +0000
Date: Wed, 24 Apr 2024 03:55:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 2/2] drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers
Message-ID: <ZiiCxXA1GsldutR2@DUT025-TGLU.fm.intel.com>
References: <20240424035756.2169209-1-himal.prasad.ghimiray@intel.com>
 <20240424035756.2169209-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240424035756.2169209-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: BYAPR06CA0019.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB8134:EE_
X-MS-Office365-Filtering-Correlation-Id: 0798b1c2-42b2-4499-3052-08dc64128218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?155/XL1Q7p+4gz0HEkImGibLBQ6imc8SDRFOwHnViDJniiRhGNU8Kn4+Dek1?=
 =?us-ascii?Q?sC+mx2hpjAb3xRXoXr+kNvMCFjtaP6aMwSQf0VX2SKhvgEzL26O+Q5r92i8I?=
 =?us-ascii?Q?cLymv9B4s3SjPRcfJDiBR97nuEKsHYickv+tWifsv/EohReuzfGlbZQS0/E4?=
 =?us-ascii?Q?du0JFikBQfcSTtYzMFRI+r9kN3ezrEqyxd7A+lHcENlR5UMeryniHTmSSKBA?=
 =?us-ascii?Q?kbqdLIwK1cbPYLr88WNN6Nhi0wovZTveTlnOeYjsZFYZL9DNUD9nZ17I6s4y?=
 =?us-ascii?Q?5Pp9CWiLc7eYgbWCzUBL1YLa9IQZjDtFXq991klsAZPYvvNN73V3uOuvSHpw?=
 =?us-ascii?Q?XP5vXS44XMz3clY9Bi95oURX/nMGB6HV3HCuGqrQZE8c4R5/zU+ZEuhmQV1+?=
 =?us-ascii?Q?pd2K6gfnlS5tE4ecB5eT5BRmBBJViiYf3/nZgVrN0f126Flwew79pVd6vA3L?=
 =?us-ascii?Q?vz/41ZMhbXet0CdN8WwFtt+0NosJ0Qz8j4l8WTm8De2uvZAanf/XmW7uZNi7?=
 =?us-ascii?Q?WUAaWkdXko52OWfklDDcQHw7mZfXz4rG0SakcV814LIjHMHCGimBG30H4PzM?=
 =?us-ascii?Q?Go0kVq7zrGA2mMUttYJ/d5fYMwZ/HwkQ2HgylwNwWVMV2gB3vRnYAR1Pq2lV?=
 =?us-ascii?Q?OWdw8zWC3L8fYEpJEzdK2MHsio8Y0dsB+hZD6AKrw9v828+nZFd9hodP8k98?=
 =?us-ascii?Q?yol+h2qWdme1oI/t6dMSfoJeEGZWLtNlxuqUoj81RjO/GHY0EGOaxHcDS0hR?=
 =?us-ascii?Q?BI5FHj9K+m5XIf+B7W6Y5zrBh1iEO3QjO6Sk4McP6qHHo+OUnxabi2SmG5Oo?=
 =?us-ascii?Q?HXfzBH7gzSVHRNio8EQa+gjzNzg+jrCPtDSXqsZLDDN6Wogg+zGRyRPAVrfV?=
 =?us-ascii?Q?qEo+/KjZu1YPuatUTAn8ib8MwmSnUnm+BuRRuUmrOtScjf1lFVlQI5HzIl2b?=
 =?us-ascii?Q?syLYtQ/Um/w2BGST71qi83CvYZI6zX1TlcU4SHPpxN4qL0DoTSy+YwOy3JWf?=
 =?us-ascii?Q?5vlZgKDdRb77thab1TWvJ6Q/O9Sn7V2pWok1fg46vqZ7hW1+G/guP9kZwZll?=
 =?us-ascii?Q?cA594eulkjIRAh0aBtpwIfWuiLY0/Hcae9gaLp/zkmj61rBBAi0w0aVXdwEX?=
 =?us-ascii?Q?b7fn/Z410vH4ECyv6Hvf6SOnr6KbLROn2KOutgNuORxS1XXfFqHQF/7ao2x4?=
 =?us-ascii?Q?lPlK8/tJUfQrRJY9+kyvFY3KmcjTnvSKhK1CNLfGNrtZ6PEvXwYPgn3gaVom?=
 =?us-ascii?Q?wDlAFM8Fz41UqCy+jvm1jRTyA/o/z/vzzNaIBnkfUA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qV0+eCqD7kuiZQESXmAFuGWbVAl/HntdhuduK7CkLl+QQe601ATpNVyKWEr?=
 =?us-ascii?Q?Hk2v7MDHC2dKpV1IBM7iephdpkvgdQCvapilNOXLGAWY+LcDybTB4SOiVvtt?=
 =?us-ascii?Q?7K+jlfkj+BAKfhrlLRm6WgQTBUUHfP+wE5J2X82F1Hg2Vujq7szPKWEytg8j?=
 =?us-ascii?Q?fDI/RMenmDMSnet4lkxFZLKV/LxlDEWFBtsc18s1ERS3+cCezgYEAPZPhLGw?=
 =?us-ascii?Q?L9NtIvlkL2cCvkYgVAs49knVT9eSFwJaHlVMXnId6lGidZ2HuZdyhhb8K0wB?=
 =?us-ascii?Q?VKejHRdVX3N4BkUEk53BKoezwwvHHTAbbvtxD536yy9DhSCOzdJmiLtO2e6i?=
 =?us-ascii?Q?XTddrJ/UFYD9uYRUuRO9hfcmzg5iRRmMnColrvdiLcbl/u8Kypv2mg/lK8nt?=
 =?us-ascii?Q?IXUWwYX8ljzNj2ynlpfagw5avfvQUEr18xU7bl6abxlXcT+cBOhz28hkQhHC?=
 =?us-ascii?Q?6SmLQi7CC71RohTAs7jwoTc4fctMG0ntjHWTtSiSG07OjT4/F+/AYBbyHGLX?=
 =?us-ascii?Q?lpF1RqrYDCYYnzzXL1BCN9Ba+vUrViplDLbYbEjH3gm23VoWpgQzzKRyq+04?=
 =?us-ascii?Q?YucToYGLG07wI7ejc+/+axns19SDkAeIMsUmWZQMx3p0l1bsXOBKw3Ndxcfg?=
 =?us-ascii?Q?FVIH2c9YtUcXMErAiqZ/ZJ+9wc9fQTZHeP/Gg/2SqOllq/wl2RPIlBEHuQuB?=
 =?us-ascii?Q?tZ2lV+3xhgOOSXrRKxpAWWgWHhsGTml/et1xDBb5ZN1KZvZq/OUpgwk6Y/A4?=
 =?us-ascii?Q?f640tsB8tG+w1caLQKcSUmX5kSZE3T5uyoaOjj5xPpQcZoYW0Ub2dQOALQrX?=
 =?us-ascii?Q?YemHou9XQz1pngjmk3vLoBLr2f0UawzuWna7d87tsukRlLuPk+P32nfiyLz9?=
 =?us-ascii?Q?mEu/A5HZP0eMvkDvp++nS5k1tQfoz07yobsc7jTuqHmg9lDc7sjAuAJ67mXb?=
 =?us-ascii?Q?hYvElfu8httonehe8kTuTusu6LT+iTkXM1ZZ0L2ufSmzKVvTbDgOu7fipuUF?=
 =?us-ascii?Q?tBoI2nkcOYFdwx7qUUDag7yYrASThT56tpi1k8jSY788NeNiKK9NP5U7RZ67?=
 =?us-ascii?Q?ZJXSYn+543Vzbl3xmqDnFUbgsJciez7TPHUb+KNLsSDRBWeH+T0c632VmZGI?=
 =?us-ascii?Q?6CjCvcfsazcX2ogDziJdmFH+4Re5aW8xEzpHGz9eNjgWMc5UA2VVQzmnb7tX?=
 =?us-ascii?Q?UL8zuMEoMaOz6OIFxfkMmvrbVO2/KikHnCyRH9IAY3j8VYdkVLIzNE+runQ/?=
 =?us-ascii?Q?oJ//Zou5TUnOQRzP0qTdHB20dB0GKz7Gfobj1A1gfvJ5zhfEVPJMnb1MJ13i?=
 =?us-ascii?Q?ay6U0QXsy6tALbgi4FH2+kQ6gI9zNVUa/act1/I+KaSDu0R1jnA4Q22sgR9d?=
 =?us-ascii?Q?VwRwAIkn+prAGApSuo0VfkvljDFjVUwlqyzSz612VIifhKR85xp6izk9xq/q?=
 =?us-ascii?Q?qDKIcuT047gK4BGNU0XUmROhnSfu76RjS+d1efTAQglKGxhafFQobKIV+KL2?=
 =?us-ascii?Q?BMmpRK1RcE7aiakpjuwGxdvXG67JdNL3iEbagifSxEQeuz9KS/pLkpLtZ8OR?=
 =?us-ascii?Q?y8oeSDwNMw53yNUHLK4Bjm4JC3ENahElcgDPn3Z77eSx5nK7DBuZvExKNsag?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0798b1c2-42b2-4499-3052-08dc64128218
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:56:23.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/FiDHowZJOXuPxp7SWMf3wOScA5F7vyzNf1TUGTVkJfWHZ1g/Zr+sueBivNeIxw0BEowYBaw95lfKTvzS1u4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8134
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

On Wed, Apr 24, 2024 at 09:27:56AM +0530, Himal Prasad Ghimiray wrote:
> There is no change in functionality. Using the helper function
> defined within the driver for locking/unlocking the reservation
> object.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>  drivers/gpu/drm/xe/xe_vm.c  | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 615bbc372ac6..2066d34ddf0b 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1382,7 +1382,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>  	if (!snapshot->lrc_snapshot)
>  		goto put_bo;
>  
> -	dma_resv_lock(bo->ttm.base.resv, NULL);
> +	xe_bo_lock(bo, false);
>  	if (!ttm_bo_vmap(&bo->ttm, &src)) {
>  		xe_map_memcpy_from(xe_bo_device(bo),
>  				   snapshot->lrc_snapshot, &src, snapshot->lrc_offset,
> @@ -1392,7 +1392,7 @@ void xe_lrc_snapshot_capture_delayed(struct xe_lrc_snapshot *snapshot)
>  		kvfree(snapshot->lrc_snapshot);
>  		snapshot->lrc_snapshot = NULL;
>  	}
> -	dma_resv_unlock(bo->ttm.base.resv);
> +	xe_bo_unlock(bo);
>  put_bo:
>  	xe_bo_put(bo);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index c350c561e7d9..6606e2a32e2b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3335,7 +3335,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>  		}
>  
>  		if (bo) {
> -			dma_resv_lock(bo->ttm.base.resv, NULL);
> +			xe_bo_lock(bo, false);
>  			err = ttm_bo_vmap(&bo->ttm, &src);
>  			if (!err) {
>  				xe_map_memcpy_from(xe_bo_device(bo),
> @@ -3344,7 +3344,7 @@ void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap)
>  						   snap->snap[i].len);
>  				ttm_bo_vunmap(&bo->ttm, &src);
>  			}
> -			dma_resv_unlock(bo->ttm.base.resv);
> +			xe_bo_unlock(bo);
>  		} else {
>  			void __user *userptr = (void __user *)(size_t)snap->snap[i].bo_ofs;
>  
> -- 
> 2.25.1
> 
