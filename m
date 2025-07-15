Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83890C83F22
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 15:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452C610E600;
	Tue, 15 Jul 2025 15:53:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+Fqx3z6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A073010E600
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 15:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752594833; x=1784130833;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sICFnd30lKpTCKVjEJg9Aq87gfFA8sbTOHt83ybNrt8=;
 b=j+Fqx3z6D4c5CdTJJ2Y53rtPkF2JjGjB2NqQUefkr+Ov214/Xdyjqj3K
 T2j3fPqLB9jMREjoApexNXR1uSphJ2Rv/K450NvvYmyOrA4mE0pLXeGpm
 GD5V1AOVOYsHW1MJ3y9lXa4X/b9XDGRPxaWrEJyOcCu4xuOYZWpVsyZGU
 hG29PgJBCwI/gIxPhHCajBDe9cR2ycQq7T6kYJy4oLq9r5YiKTkjwMfW6
 qZgZfZLK2jzY5vDNjwgLvmXvsrD/O+cnweKB5OWVpbmsWiZORNZGulm2D
 EthUdAKKX8hUDz1hTzJVrJAlmgenZX/RneER9bzWvdjAbbkfQCWEZQNOu Q==;
X-CSE-ConnectionGUID: b4+8oNkvSGOgki+elQQhrg==
X-CSE-MsgGUID: oJFiVh6URgOLHpktWAQ6HQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="66177758"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="66177758"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:53:52 -0700
X-CSE-ConnectionGUID: 5GC2/zEfTH+GVUMKmzw/Wg==
X-CSE-MsgGUID: 5jfwC65QSzuzzGufMjiJvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="162802197"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 08:53:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:53:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 08:53:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 08:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XpPdloecjIPxYI13eSss/avx77C68XHVwjyVCNCgMtug0md1t7ivFQcKx76a0Fm5EXrdMUgt/fQf9UPOy4Q0OO3ok6I/AzRXFuyTmjzm89p6qO1JYLu1pHoqmuSD7k8WWzVes4ojDY4xUlkSh4sT854z3l76YBOw4QLG+T0BmBxMy+29rJB2RHvAEXutoI2diqXjYI7F9khFTZ4ZxxrQ/OY2UJdbxxXKxzgBbYkrz28gM0o/hqKs8Chj2gHRl4uVYCLijlctLGN02jmicGRjDQCR9upOOI7NAwzRh8iLbXl8dmuGp3HQxle8XkIDNsm3jpRNkAzFu56dEtg5YHO3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMXHa3rT3jsyf9QjtB0hZh5sG71lAoDa8tugeSluG48=;
 b=Vfa1HEeixrbMFAqtXf0xWJ/mHe9/xbqCpclHovxkY4JvRWxjEjTMt+bpKX5Dfsv2RTNaUmolna491gzF3q9hc7uqMpy+kgUvnLEQEr4M9l2zlZR7FvuPTfjYhh3lvRcMFIKCeDYdoqGu9aN3tuKNOAp+oaS3h7XzBivgLr2E+BA70i5MBA9G7PR1s1PsgDvLZsGOpCaytDt0LFgiEXCBSbIqz5TeF/3v23RO+3SJZJSWnDZ81jcLOHN2KDQrzZrE4q8norN1pl61NAMB+5ih75OVVcU3FDuehd6u21U/Kn9gsvl+xT9vMnXJuiQk8QBmQeDjsQJdykh0ghNwUIv2mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 15 Jul
 2025 15:53:18 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 15:53:17 +0000
Date: Tue, 15 Jul 2025 08:55:02 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.mrozek@intel.com>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <matthew.auld@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Disable compression on SVM
Message-ID: <aHZ51lVATVmWrt1N@lstrano-desk.jf.intel.com>
References: <20250714173342.2997396-1-matthew.brost@intel.com>
 <20250714173342.2997396-2-matthew.brost@intel.com>
 <08e55c66-3f3e-4b4c-8f33-363b7ecd31fa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <08e55c66-3f3e-4b4c-8f33-363b7ecd31fa@intel.com>
X-ClientProxiedBy: SJ0PR05CA0181.namprd05.prod.outlook.com
 (2603:10b6:a03:330::6) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: 080e793d-fa60-4efe-ce1a-08ddc3b7b733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9s9zfTNkwmMvtsJK0rjlBCXStOVthYipnS9aNx8J7+0ett03L8KQVDEv3zOF?=
 =?us-ascii?Q?VoAOXBBTUcGEK4zPmCU31VpNr7N+mFvGJAoPpA1qvOlmRn3eGsksDXhfjA1+?=
 =?us-ascii?Q?b49tYTfbViUAI2Rb0smvxva33zs3NDTw7vYTvad6MDXNRKHPBiU5EbpZ5JlP?=
 =?us-ascii?Q?lQuGWvqfOyzBvUeEni6DtWeH6nApEXJYYDtducn7XzarWApgbhmq8kDMD6QS?=
 =?us-ascii?Q?T27GNyCMj8HG014T5kkF0q/N1a0eX+sbAOCyIWsjpqjJfP57MQiGarU/azhD?=
 =?us-ascii?Q?Ixxm7S+C0wu6/KIE9+5vb54JvQ4AOaWRiNTnq+z6w03BbBcQtM5/3+sbJIx6?=
 =?us-ascii?Q?Vw1rV6aQFjZKRnQjmfijnpvz6fzXTA39glIlTnpE9JQoCKrFrIN7MtDCbYkH?=
 =?us-ascii?Q?bF8WzeOyVdIIkungrXUwL1y07ZgBZCJEK336WgpwBOzaT7FpTinPjSFIry73?=
 =?us-ascii?Q?8ZqVsTDslum6wFG6b2IFt7mi9LJzNQje/lEFTTKQzUfucP9migdkFah/bowp?=
 =?us-ascii?Q?oyvrQCjM3pRKzouHdlxga50MoOPdCW4a9DK2PHW0bU2Er+K1xBOo6o1Pk5zX?=
 =?us-ascii?Q?vLDjcBtuNs5i0b+hGJx742ZjuLbFo4Zh1vk5xjskWJwtPYgmc2rz3ixa7KuS?=
 =?us-ascii?Q?hfZAlTKLZzq+sSuabZtOiOLHVUh5Y5bHEz6kAHd4Wt+elAZ3RfeEOy/EstYo?=
 =?us-ascii?Q?10t8+R3p7mHYHoWsthI3/jWEO9f+XNCrIC5h0Uw2kK/+6ZEjstKHbXkmg82g?=
 =?us-ascii?Q?OvNMmRLrpcdfWiho7rTWIzF62gdif9KqBGCjIAmBx6lyuj+6mboAekKtSQ17?=
 =?us-ascii?Q?UiCfMdt5DkdksnabFv9p+VF0JulIxVeMsnG/s/PF3KCS7XxUivzhfrGLE4FM?=
 =?us-ascii?Q?7waMe6IxwGAUlw7H5V1szcQbhqGxrQdaZRzbr4AhpT73AyVo6LXSjWMoo+TJ?=
 =?us-ascii?Q?sDprkHkRrG/kYdVSftvgD5i3xFe9xFtjM7uyyk0z0vB6qV/duRFC9I6Uuop7?=
 =?us-ascii?Q?ONIBL/hv4GWwcyq1gfKcw+rIcJLUYiawOadbS7RSzstoHylDX2HooCMEx8oh?=
 =?us-ascii?Q?b+Bsx58a3hrG17zHEYIXXvK4tFn5PXZgAmQScf8WpJdhHULG1P9q8h/pgh8z?=
 =?us-ascii?Q?ZRJ04eQJR8E+x79TWBGjC3aISHgMewVC1/MLJP1UWwq4vS723DicPP9+Rjti?=
 =?us-ascii?Q?HejtWtedxE9C0vuYXtEGjotOsAejljUMwym0VTi7so/0HsshZTevb5mvyjVr?=
 =?us-ascii?Q?LWoo5UHhEbFh4Uc+y8IT7qgiZ5yFgcWZdehHpajBQ7rgnKW4zA2ucClOmdKY?=
 =?us-ascii?Q?j51OWMMTergM97iHZEAncftvPEFxxvgYIXSkMV50bftUSTWAjl3u58n0yAQo?=
 =?us-ascii?Q?kehq3f2s/FJfsAZgxe/kgYB6IGkti/h+XSw0HwOvEmvLFq2ng6zMvSKBEu0R?=
 =?us-ascii?Q?zGomYta5Zgk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rQzRLNLIjKMJ8x7lCIC3ssXGs3Xv43tSENcoEXlbiJi1R9r4zHGRG0X9Byy+?=
 =?us-ascii?Q?lS0k0nbfZ1TBsYcpy/EtKXS5zU9sjUdzF2wTEAV5CRdgSWzK6V5/KbwiP0l8?=
 =?us-ascii?Q?LW4qAEt3fMS2rTvTxp8UMXYOaao9tE62shRtdzrMyhRFFj4/Dyw4IyaSHy8W?=
 =?us-ascii?Q?OF0aqO0ATPAQCH0yOxgmexq1h7gvr8xqkOfxnTp6FQJ5LIkK8ZVWc/SqPVI9?=
 =?us-ascii?Q?RCqV4UVwMU61B/fSltq99m7h57OJm6N0b0w87pz5pJx0DCEt5WaAsurCSWB1?=
 =?us-ascii?Q?Gu/Nl/f4xeLYnQMp8e+SPj3v5p28um+gnI/I7SiWrcksqJF95UahGwQQdWPf?=
 =?us-ascii?Q?+Sk6YwT08xjHZ4vtAd+SeOYDx+6G+OVCKI34XPc3xwIGZv6XAG5uoCxqbu4J?=
 =?us-ascii?Q?+NwUvNaINPrx2nhVeDZWk6JlBx3TlA3aN3eBzqYpBKvhVzSo26tChZDFsY1z?=
 =?us-ascii?Q?XPRCL2XkqrErjudWBrRdqKf0QM+HdpiahX1xEK8rxmQ6wYgiAMkd7MoUWYsr?=
 =?us-ascii?Q?U/Vd2TOgdgmVKLzitFQX2SpcSEQPt4qO5KYAF7hJsZ+utc/qpuxyxFE+1ju2?=
 =?us-ascii?Q?QUO8WuFwDVK/Nbr7QYsJABaCwShQjnmb4mXZMxhLNfXlIfj4GSPopkcYNMGq?=
 =?us-ascii?Q?uVu8447kHNLw0Fg4tf6ImOLFiU8l0ooP/DmMPST3ylU9i19WOoKXwKzj+2OU?=
 =?us-ascii?Q?X2NuDOR1KCRYo8gMWy5stkRqP/gTBPj3aSmzi08M447opuMbBKnLV7TxGfEa?=
 =?us-ascii?Q?pZQnzOM5CSR2G9KtNn/JGeLT9r9n7270A8tTeAYYBRrO3j19hSUEVx3AS8n/?=
 =?us-ascii?Q?xqlr+IS/+AEmg/H+PICiYCUa6bo5ZfZjjfvf18SeRRjJnQgRMJGHPBLY0yak?=
 =?us-ascii?Q?OE9d5b8AnhmvaRPR/N9/DNmFCqL2+UW5QIf7Hg2zEiXyckfh8WDlBoefIGl2?=
 =?us-ascii?Q?W+EYvCDjKI2gfSb47qf7TFLUYxkwEaLbOdqoKvdX/JMk51aq6vwGS5uztCsR?=
 =?us-ascii?Q?xGkzohVR/QrerJEEW8gZ002AIsaLA4XyF321B6Xfcjjv+urXW48Jy5vKst9w?=
 =?us-ascii?Q?V0HuHFhgEjby8dHNDWJYo7dPFAlEnf8Xaz+bUXN2VuLvagVrJqc3VfFqauj6?=
 =?us-ascii?Q?cY14bbGDjwbfBDus87FAw64w/tBondDNz7kVuaQzL2b445IWD5CzhG0DCLlF?=
 =?us-ascii?Q?RWRiwduISBRbe6IBLqBCoqHdRiVvFQTFOO/U5DCYvCw0my3ser5NmxCwgjZ/?=
 =?us-ascii?Q?Y5NGczrRtXn6QvaR/1B9MH1weYmYveDAsH5WDNmK025TkVk1Y9eJI+YoeJmH?=
 =?us-ascii?Q?vxNan4bmQegggodUz3RsLqMzMVMSh5t5nMnF26yFW6OCzUgp5qiUOKrTww+w?=
 =?us-ascii?Q?eqvrIYQk+Bd251nmR7xrHNjvODhI5g68aVNbI56bzOjMyAMXrMJkuYuYrxtK?=
 =?us-ascii?Q?npzM06bgsnDS8nNry0x2IWC7wwAdKcxUXEejiNIN/8J+1TTwrl7IWdbwk9ZJ?=
 =?us-ascii?Q?7546f6RdEpBIR5z905NpAqqJMfGH74z2jJnxf5BFuQN27CWz0XQaYKqLsfhq?=
 =?us-ascii?Q?mH6/qilIlJ0nebM7mvGAQgee/x36q4pvqL3/YV4VA4ii3t5kjGYV2SkUZoj4?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 080e793d-fa60-4efe-ce1a-08ddc3b7b733
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 15:53:17.9416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LugGi+SZTx1fOQ/8RjBY70PPd4RwHAigV6gevRnbDLM/XZ01GHPFljbrRpuQtsV0JA11ziah5B60spl5kYpMYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

On Tue, Jul 15, 2025 at 01:55:56PM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 14-07-2025 23:03, Matthew Brost wrote:
> > This is not yet supported, forcefully disable by setting pat_index to
> > zero for CPU address mirror VMAs.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: b43e864af0d4 ("drm/xe/uapi: Add DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_vm.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 2035604121e6..73cb981c0956 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2362,7 +2362,10 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >   			op->map.is_cpu_addr_mirror = flags &
> >   				DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR;
> >   			op->map.dumpable = flags & DRM_XE_VM_BIND_FLAG_DUMPABLE;
> > -			op->map.pat_index = pat_index;
> > +			if (op->map.is_cpu_addr_mirror)
> > +				op->map.pat_index = 0;
> 
> Shouldn't we enforce a default PAT index, only when the input PAT index is
> compression enabled?
> 

Yes. Will fix.

Matt

> > +			else
> > +				op->map.pat_index = pat_index;
> >   			op->map.invalidate_on_bind =
> >   				__xe_vm_needs_clear_scratch_pages(vm, flags);
> >   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> 
