Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2F6C27C55
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 09:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E635F10EB9F;
	Fri,  7 Jun 2024 09:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HKZT37ZD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E505110EB9F
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 09:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717750808; x=1749286808;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WUUrvPtTEo2QuaML3Nb9iT3URKDwXiPagOP92E7oKtk=;
 b=HKZT37ZD23fZje2OT65HvNu+I5pUR5cyaVYAYH6Vxpo0bui1ZsgiCmlD
 oBApibnIZsqmWvjwQNdtkGNqucUbvwAx0uzBy0oiivY2hhYZnBHvRQ6AP
 IEeo/08Iefw80ee1oTYZCLtaZpSzPMSTJtk6NAOiYaqH+5TlHEqbPD7Fk
 JsDqKEyFacgPNTi0ZdR24hjGfVyUWS7fbsucKlutDF7uw5ubyyRj6RAql
 GsEyLmbSqIRMRFg7shTP2mTeFyoEgZJ8npT9Yb+guIXwF+gaaMATurZeG
 xQ6j5aMjhFEfk+p78s0n7ed5LwwNZrouQVNioe2Dh4P+2X/nWadxGeXY7 Q==;
X-CSE-ConnectionGUID: e5emiLHyT6WHAJj+gM5rEw==
X-CSE-MsgGUID: OzIG4UJoRR2DtE+ofLsWeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25866793"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="25866793"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 01:59:56 -0700
X-CSE-ConnectionGUID: hl2paOCRQU+iChfkaV+LXQ==
X-CSE-MsgGUID: w3fwGyuXSo+CXWqq5BR1ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="61462015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 01:59:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 01:59:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 01:59:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 01:59:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 01:59:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnKoY/8SFxDl4ItEG918lzLZXbcoqBqT+K/iFh7N4xqg7PUOexw1Yv3J2Ukgnb5atBAHrb02LWBVWa2eYg5ugW6ZKTLxNIYI0J8OzPZ5yx45PYrljKVH8cR/GTLvwJNAKmzzLKeWLXZ0FpwvVlUzSzISa4nMvDVTK1PmBuDbPC62PCl1Yuqu00Tg6XqztLSEOSGaadtiJW7WQ5uc7worlQ8n5uESxeyMwLpiwYNhy33upQSrGfTuprJ6JVEcJZPSPSfWChab1h9ttiADUUTrSWQA12O3WFJyujqIVypjdOanZHzz+VmU5JyVOBzP1gEnoMMxo+lwnsSaHLLHawabRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=418LiKRV2SZSDoOjb6VBtfRX9wtxH5WtoIfn2z6qpbM=;
 b=grJ54wQ24uCSHrJ/xSvvk8xrMLj1ccQEzKodXvnYOWVG5NjTcKqpyclSSxuEYxTbdQfx1grYEQ/ZS6wH0HUHyGJldYI+ZdxFzBCuIbcwGJBFmwxNUKz7cTWdW6bCqOqpwHNQjk6H3KT03s+hmm5wUebLhmsGK8AasNEcXQFkaX9lBbqzHonmQ/BmnNzgjx46Tz7+EKSJ9KaRlO6V7CL4QzN35iQDFXLzV9TSoQTvQDQWn5RG5cxBvY5BJmmKE+Z8Tbz9dtXO5qefDq80+RxMMy7FESbeSFKqFVEqo4bl7xlHuFymSuNpKZv8Qo8D0QsyfkFybB3EcXcjfZz1hauNaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 08:59:54 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 08:59:53 +0000
Date: Fri, 7 Jun 2024 10:59:42 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Paulo Zanoni <paulo.r.zanoni@intel.com>, 
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Avoid fbdev suspend at runtime pm suspend
Message-ID: <ZmLL_gOh4SfCd_P_@fdugast-desk>
References: <20240603215218.14278-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240603215218.14278-1-rodrigo.vivi@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: ZR0P278CA0167.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::15) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DM4PR11MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: dea514cc-3197-4a6d-21ff-08dc86d03258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H3mdkCqV/dRZrlBUwYIuPoLPT/n5P9wChkwzai/ItVcdXOs3wvw4jmWe2RfQ?=
 =?us-ascii?Q?syar4jZR3aVsT762c8VwlBJexGtuQSnLWV5AU7Bw9QDcoRsy0hHP2bhAIwc7?=
 =?us-ascii?Q?opJHDchA+asJJeuEtonZ2orA6ira+l7iRs4x/KGCerjaFpKXFN3K8yVmFSS9?=
 =?us-ascii?Q?Vfm/ccCZc+KHqe/zrt6GV4UE60Nok957RPoAl+8szOMXmGEvesjVBbnyFyWn?=
 =?us-ascii?Q?hkoYbjlQSJZGcYCMXJXoEYylLBl3wnGQPJ0bbRvGYCxln9suGDFPMausBA/a?=
 =?us-ascii?Q?pCEpCbp4TRYgI/+BVnQK8B/88CXBA4rthD3yBVfM5qjqHvOvxk5v8X2GM5mh?=
 =?us-ascii?Q?aEyZEkcrbfeYjhzvKYf1F3Gk+MLq2H7o+JZUlhd7616G+8e1iPV5aC0/6Q4f?=
 =?us-ascii?Q?oEOkYXBjJexyjQ4+nTe7OHo0ABi2rDTUoIKV+23uTQ3tLiDWSmx508TsrRUu?=
 =?us-ascii?Q?biHh8KZsB0jzIa4f+jyI30E3F8dqzD8G2XddWGv9HyzBzEcmZ+WZsBY5+xdr?=
 =?us-ascii?Q?JiYAizs//K077QexnR/L3KNjIZRDSLV60bVwuVnuDsUEXKpoBlG9t2DlpyAB?=
 =?us-ascii?Q?c6CNCxTvBw50F6FZbHponKXtiSFr2OFyEbgVOW0XSCF9kVrnYaM+CxmEsSnu?=
 =?us-ascii?Q?5OmsGI9JVhDjNic3gEdd9/di0StZ4v53hRJgTF/lbpOqz62nqwut5W65Y8gi?=
 =?us-ascii?Q?Bk2nP1XpC0ABFjveP+9bctKLhe5HJpyM2R4MrX0m615oI8+OgChz6Enj5708?=
 =?us-ascii?Q?33DmvT7ja2IFWfdbMF6PB2s4UYvwftNXbuztPhITrD3bk3wJKrToNL22SDSE?=
 =?us-ascii?Q?7UHeRSDv+lyklB2WWyhmuzmVceTMc/4tIBMWVo0BnUwvZcj+ej5PfQ7I2FR2?=
 =?us-ascii?Q?HmvhfasMDa0/pCPqYPPYcygYn2QPNL1mjMbYxkDYLp77OW+ZcKNcEf6mMNEw?=
 =?us-ascii?Q?rcd0IgPIptGMy01QOwIDX9vo78Wk6vbn+2M0uKQ9sCyb1mUZzykIPmzo6qN6?=
 =?us-ascii?Q?JxJS4QN17Gwy5xQBucszsUY0ofGZvau+v/pw9HT4Dy3iMYjwIQ0IRhd9aZR8?=
 =?us-ascii?Q?CAYNvyexL1qq8OU9URCsmgYjhBzRDAMdGQuczdjDigdFBBxN+3o2di314jR8?=
 =?us-ascii?Q?Ns6T1QD4E4tnjSp2rTnzUwSTkOcWal/xhza0CuYga1jpGcj8StBCwsfLI8B1?=
 =?us-ascii?Q?+Nq0J8A8nEldOdUwJNO1O5Y5JGBgrXJ6q3WNBMAr3k1dj3A5Zo9b3teVxcXL?=
 =?us-ascii?Q?U73UTLaKoTTya6mPoQDWIsMH58jpClz0AXApCKPv0wxrpknr63dXCsiCI7EY?=
 =?us-ascii?Q?e8EPdnhwO9foXtIjVfjoQrEG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fsz3khT5bhQ+e6lEVRtpEMMu6wTexUYFeBhRTZkXqyOVCEA/qiXyxZOE7fKX?=
 =?us-ascii?Q?mL6tZJol38vR56oBJPu6ndBGaXjrCsRXRgs0pU1RdM4Q/evyGV5gV58Oiwvi?=
 =?us-ascii?Q?knBTenYme/rDzV9pvekf8eUKgfhHMV06HfbHgX9mPFE4XoGiFXwbAz/LwCI2?=
 =?us-ascii?Q?tAAmT8hDk06UMpmFhkYorZzCZCwxTFJsT7eATCKcTZgHHwDsG2FGPGCJ4xwl?=
 =?us-ascii?Q?768zXfIpvGuN2SOMmhz1Jd1cOa6K3pF+c9Q97klimJ7aY9Fk3/Zt0yuHWFU8?=
 =?us-ascii?Q?6lB4BdLyfv7XcP+dpIY+gqGBMDWKPJh60sgkOgTe6n122VHMm2gs3Wyg+7ZK?=
 =?us-ascii?Q?dK+GF2WjXgWfTUHEGGO1g8rCUsK/1UhOHRUfHS0svCoke8JlEkRu0n9ESNs3?=
 =?us-ascii?Q?QNX809IUMS1AAgGGpprqNFMjGy2Pw+khKHMiCKBK6qhuNvgNd++n5Fd6qTSy?=
 =?us-ascii?Q?/G4sqHnvR2WEvw5rN/cfq7xXvs4fIx1ABbiHNrBcXkd1WmVFd7qV8ItPy8io?=
 =?us-ascii?Q?tyZUIWbaxfm5uokSeqR95UCQQOayXDC5WApFEwNUy8f+4cfQnO/OXrRnsJx/?=
 =?us-ascii?Q?HJGUfgf6I801sSlhYK+2+bi3GSscriVt2LCRn/nhKcZGmfpdjsPk5/I8Ccxw?=
 =?us-ascii?Q?RiO7mZiuJM70Z6dreb3IMXZUrGS5XLNPKh6G7ln6a+6vdET8SEFxzcx4rkyS?=
 =?us-ascii?Q?8UEVL7V7xcmONV3c3kPkzL5cnhCzEOQY4YysrfqopmSYXp+EVRjxMC3M9Xz9?=
 =?us-ascii?Q?Q8pUfVC0eMvWmzKiu3zphj1eStj3k1a1vHAK6ji0c5tOAdOSp13agSradoKy?=
 =?us-ascii?Q?36FsnILeuOpoxyP/tUZWlMF3covENlvS3rAmZI68Po3i/VzX+ShG0g2fcdP2?=
 =?us-ascii?Q?jJOo2uwLjshqjDLWMReic1pL6mgJPPI/jZdeE78qYqNgJCzMM1zTz8yb6ZGn?=
 =?us-ascii?Q?ARqaS3iG9ppeXbojnN0AbynIXEgB7AED7HJl6E7UnXJ7lduGkBTufgvCaFYB?=
 =?us-ascii?Q?Ss68kRU8CZ0MS8bVt/qFB8l0r/8GNGPu5G1IM03eu0FIUBkaX/mfS3e4pzZM?=
 =?us-ascii?Q?SeZJ/yCkK2xZ9Brd67JOx8relFa2tUCZISIB9FUqkf0+e6teqnMLzo4VlbZe?=
 =?us-ascii?Q?L8NgcDNPxfiezb5dTo8j5vvroRHecCPRix4CrWx83gnP9v9AR0chVRtO1NYB?=
 =?us-ascii?Q?C0uFpaPBPtApfyPwoOSYqRKshywFDuWucwv3m3bcNxt7+BeyovEmIaIN7ZZB?=
 =?us-ascii?Q?8DaR7hhHXHvEzEVA3ndzf8g1VtBXKsxzw1ELM1oTM+uIviqsQR0tuk9k6B72?=
 =?us-ascii?Q?qrZZQlgZMzJdh+VIZpBqgz1/5WfCOq/vb/J0TW3EHKi87itp7tsxrcpNlgKP?=
 =?us-ascii?Q?XtPx2+i4KHYMks21KjgGT+cSgE2gIjkgalhTFQ5yRKP5BId7NkuLqu0EIysG?=
 =?us-ascii?Q?/Ub3PS7i8m5RfeOJCaLXLxFJ78cmT6baQ+sTjTdQmuzIVXCRREdg4L4GvQOr?=
 =?us-ascii?Q?k783dIQn3i0PgFvXZjRqg2tP/VNei5nZyLYbHgdg2ZnDzy17CGUMIQbkoOpK?=
 =?us-ascii?Q?OO15BcQH6JQhvO2mNBTi7vC/RIVFN7eqKJnlan+MRaQAghzPpQf9OpDlr3BK?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dea514cc-3197-4a6d-21ff-08dc86d03258
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 08:59:53.8220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JtKKCdUVIHLpCSE32TT2jvA879Apyh2wphWaCb4JT+4j5fKq+1woRqNg+69fOHTEFLhtqMkWX21UM9CHam8EjSWwJCRzxVuoRjiDAOunos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5262
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

On Mon, Jun 03, 2024 at 05:52:17PM -0400, Rodrigo Vivi wrote:
> There's no need to suspend fbdev upon runtime_pm, and it is upseting
> lockdep:
> 
> [  313.150411] ======================================================
> [  313.150412] WARNING: possible circular locking dependency detected
> [  313.150413] 6.10.0-rc1pz+ #99 Tainted: G            E
> [  313.150414] ------------------------------------------------------
> [  313.150414] kworker/2:0/33 is trying to acquire lock:
> [  313.150415] ffffffffb5f61340 (console_lock){+.+.}-{0:0}, at: intel_fbdev_set_suspend+0x115/0x1e0 [xe]
> [  313.150495]
>                but task is already holding lock:
> [  313.150495] ffffffffc0ce74a0 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}, at: xe_pm_runtime_suspend+0x2a/0x2e0 [xe]
> [  313.150561]
>                which lock already depends on the new lock.
> [snip]
> 
>                -> #2 (xe_pm_runtime_lockdep_map){+.+.}-{0:0}:
> [  313.150563]        xe_pm_runtime_resume_and_get+0x44/0xb0 [xe]
> [  313.150626]        intelfb_create+0x150/0x360 [xe]
> [snip]
> [  313.150932]        xe_device_probe+0x439/0x4a0 [xe]
>                -> #1 (&helper->lock){+.+.}-{3:3}:
> [snip]
> [  313.151097]        intel_fbdev_set_par+0x16/0x60 [xe]
> [snip]
> [  313.151402]        xe_device_probe+0x439/0x4a0 [xe]
> [snip]
>                -> #0 (console_lock){+.+.}-{0:0}:
> [snip]
> [  313.151548]        intel_fbdev_set_suspend+0x115/0x1e0 [xe]
> [  313.151607]        xe_display_pm_suspend+0xd1/0x100 [xe]
> [  313.151679]        xe_pm_runtime_suspend+0x2bf/0x2e0 [xe]
> [snip]
> [  313.151817] Chain exists of:
>                  console_lock --> &helper->lock --> xe_pm_runtime_lockdep_map
> [  313.151819]  Possible unsafe locking scenario:
> [  313.151819]        CPU0                    CPU1
> [  313.151820]        ----                    ----
> [  313.151820]   lock(xe_pm_runtime_lockdep_map);
> [  313.151821]                                lock(&helper->lock);
> [  313.151821]                                lock(xe_pm_runtime_lockdep_map);
> [  313.151822]   lock(console_lock);
> [  313.151823]
>                 *** DEADLOCK ***
> 
> Although we know that this scenario is a false positive because
> runtime_pm suspend can never happen while the probe hasn't finished,
> the best approach is to avoid the unnecessary calls.
> 
> Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

LGTM, maybe add kernel doc to those 2 functions so that the meaning
of the "runtime" argument is explicit:

	Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/display/xe_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/xe/display/xe_display.c
> index 2a9b4a4f2e71..cd97975344f1 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -333,7 +333,8 @@ void xe_display_pm_suspend(struct xe_device *xe, bool runtime)
>  
>  	intel_opregion_suspend(xe, s2idle ? PCI_D1 : PCI_D3cold);
>  
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_SUSPENDED, true);
>  
>  	intel_dmc_suspend(xe);
>  }
> @@ -383,7 +384,8 @@ void xe_display_pm_resume(struct xe_device *xe, bool runtime)
>  
>  	intel_opregion_resume(xe);
>  
> -	intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
> +	if (!runtime)
> +		intel_fbdev_set_suspend(&xe->drm, FBINFO_STATE_RUNNING, false);
>  
>  	intel_power_domains_enable(xe);
>  }
> -- 
> 2.45.1
> 
