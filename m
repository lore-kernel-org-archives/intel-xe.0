Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AEACE8E91
	for <intel-xe@archiver.kernel.org>; Thu, 24 Oct 2024 16:06:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6FD10E2B0;
	Thu, 24 Oct 2024 16:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+iKPySe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048C310E950
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Oct 2024 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729786014; x=1761322014;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KE5gmtSM0ROt6pDTx7W6rV0E8ztuJPwOUfq0x7jutO0=;
 b=J+iKPySefvtL6Ct8wW/t3+TmPxJDFLmRzjUvQcs1t9+YmC9yRhPS1s7b
 /I8w6wtHikLaIAAxqiKjSp42Udh+lp45I/7gSiEzEhX337pjPYBcTcnhI
 wosQPlhq0qvN1gMEv5lmC8qhpgi9+WhC7kuDR991JHPLB5ryhRGxyqzic
 RFspgwB4ELQ+Asp3L+71beJPOFdSoUqyT3O6GSY03RXPkCeZAwil3lznP
 rgafitgj5GOiI/LKWR0/4YlTzmZC10r4oPonySGC5tJFeDS0sLsSioBAw
 zVi+09+q7zKCo+TVTePAApVpfbLdbPXRmjaLz6apnIuWTsKxnfEBQ8hG4 A==;
X-CSE-ConnectionGUID: QJEK94qwSZinD8+F5QHr3g==
X-CSE-MsgGUID: lQr+VuGvRHivDYJVoVbZ0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="17055182"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="17055182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 09:06:54 -0700
X-CSE-ConnectionGUID: Zb4jsFLhQLuuwZiNMjAibA==
X-CSE-MsgGUID: 6VYDDiXESYqCzf5U8/Abxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80552569"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 09:06:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 09:06:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 09:06:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 09:06:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5G4Z4UrMLv5JHqkMjRc9mwEdZycVK4zcoiqbR/uoziopJVlM9AodlukjETtiHCB4KwOVKUj88qA+KLZb6hyAa/PWtV9KKCoSDepBL2miGnKud5s3lZL9/NDalqktFVrHVmW77DB5Q969EanOnoTC9golwxOa7FgEbUnf4pK3N9dLfT4XybXC/ipYJxJJynnh/AW6nusYw9TWFlMo/NF8E5uejsHUGFPEoyyVZAamuz9TDalUQVsyrmdYuG3fVgZytgr4XDL2WZOxZrZumEbPhMGVovxjjNMJhpsKq9oV0U3R93MDN06bJqkhUUYKkD719c9ieZS8+OyyKtjzRvI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hlsNU8kJlPCbvF7uEhZQJsx7mOup6vbgJlf3SfZ+OA=;
 b=oeYT9EXs+BPSfoiHfUzWVMHzySftpG8kREbj9+FycGLwYJEQ20e8RTe3fD7XWb93HDiTw+20ZUsb6p2y/Pao94I0hLqclUyuhQBVW5CmAKa+dVxo/tk/QnrlZdah1GcSUVB/zCt9bXNmkVF/eVBjc2PyGycnRxzlNnSMg6jyfQ9MQdT0RGeRteyr2M/QEKBxJZw/P+a9STZO6gIUVv7D6fYYqLOxdtA+3tdyTQahMy6xQlWge5ZruwSxtvl+/SWbGQk9I+Vm/iXaiiewLSRVfQfPeJFg0/+WX7Cl//bnkd+dWTofyMTgFggHhopJ5fvSVNsE8PAH05OBcX/Epamqlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 16:06:49 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 16:06:48 +0000
Date: Thu, 24 Oct 2024 16:06:27 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
CC: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Zxpwg6GyMAg35L4+@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
 <ZxVI8IpkcgAq7PRx@DUT025-TGLU.fm.intel.com>
 <e50c5fdd-2872-4d92-a60f-d1db53fd1b79@intel.com>
 <ZxbW+3+hZtcSuWn8@DUT025-TGLU.fm.intel.com>
 <3afce3a1-5ae1-4c87-9bb1-838be1c8d951@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <3afce3a1-5ae1-4c87-9bb1-838be1c8d951@intel.com>
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5131:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d91741-1b27-4d8b-5e09-08dcf445dd7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x1GoNiXo++PGB6a+GtrAVO2kiiXeGepTJYZUtm/S3OAsOklIAItaq+kSrVBG?=
 =?us-ascii?Q?jgwZlCdR2xK9ysbVRZaOR916Taaupmn7xsmPRDqjAJQ7hN/zf6GjA8v8ObCL?=
 =?us-ascii?Q?Q6SjtjXd9XvRnKJI6Y/XfJ486bYqRYpfmLg8Zsy4DFRCadELSLpdHEkz2RuR?=
 =?us-ascii?Q?32+/Juw8mcxbddNZ3Oo+k884eRGF850OBa2W56zzuKl41gQ6dvCg3EhT/G8I?=
 =?us-ascii?Q?m6Jfxv0qBOoRBk2HAdh0mBTBzAylDtGVDjYP/rf2AXAcpjcZVEK14INKeGXZ?=
 =?us-ascii?Q?4bJh4buNX/qYKrDqiEHKAfgeoW2ZyPxUklm6Mm2lWpMkKNCVplvams6zEqEO?=
 =?us-ascii?Q?w3DkN8wH167BE7hNuZXzy6jfKb9RiObemqRwzRWC7wGYS5j4Y+GV8pm4M1cH?=
 =?us-ascii?Q?2LToUgmRMaL/EcpWtpBBHpo5Nc75eq+PBcpa6ymsf+z23Pg8h1kE4yyh1IqS?=
 =?us-ascii?Q?tI9Oz5eJb6tEcB+90+9ES/hpOYGmRuXYPyS6EepkEYTfPSIxsU2Iauavsdd2?=
 =?us-ascii?Q?Hr79sxt5exEcGXIj3QcrMsESnqbDzgez8utOa8nOtXt8Z42QlAhx+iRZjSkd?=
 =?us-ascii?Q?KWZGONyYhUrN15IucgwT1jv+ki3HAOO7QSNskjh6ax+XmqifdvL609qSvsbv?=
 =?us-ascii?Q?7xKGkMiw39Fdt87HbSNl/L0R7AsTGQMeUK9FF0ZbBbF0zrK297QCes5rY8aw?=
 =?us-ascii?Q?PW7s61XHYjqhJWB0N7qRF1seRVBWRcnH5LQXFgCBPGrNP8mwJ7FiVEtqMrqV?=
 =?us-ascii?Q?BsNLFcHuLL+qkqorgStpabF4TLHbsFzaJ2rZ6wPUvquU2qosYWGLTFecGqTA?=
 =?us-ascii?Q?mTFMC1VDQHZ84e9La8VSWXu3CFvhNxKhiHVOzgs/UwH2vfTXVGRMjAVCRKnX?=
 =?us-ascii?Q?zg/mqQF7qUXKy7E+P9t5sakSYuqoeZSDduJCIvHs55fWSZmnZOg/b/Lt0Kn0?=
 =?us-ascii?Q?kJu+A0OjLWTZA/lXWZHaAu6SIKWPN9dOK5WrduJJElcgkUrTcfcaxw+/aa3D?=
 =?us-ascii?Q?w7QoFxWyoM5gq+7UhxgX24rWKOvqcJ8GroS9CXlB8uOkIgwiDAqu1npEQrg0?=
 =?us-ascii?Q?gzHPzSfl5cqH2eRjV2QGKm06Dht0xiSb+YjOvVHMsQbaZbgAfOxqZ7V1q2Ct?=
 =?us-ascii?Q?Cb0/VUn9/3RfkJBU/kVdb+vf2mVJ3SB0ItmH09XxPKyRzeY/JryKcZkGKyTT?=
 =?us-ascii?Q?4zJ/N1O8eVrRnj+C3WAXR+GRj4DNoBkfu+7HIec6rI8W58LOg+FdLyxzX9SZ?=
 =?us-ascii?Q?xz/i886Z3o01Nu/+dhNa2azJyKSazHKh0AeV/ZnkXw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V3qd5KoNt3LT6NU41IZCKR3rYbU6cNRA0op+Ablr6eEUZG07nwfRP7Szv6Ja?=
 =?us-ascii?Q?fIr2N0N3ysGSwluPykvN3JnQwe7jJdNAIkOdmGLpU+CK/U6k6RopPiwUhVPr?=
 =?us-ascii?Q?ZJOSEhRSyFWScImZ2+UuyaU3LsV3cMx8ImZvrKzoK+nv1x1v6cuoiSEXfmgX?=
 =?us-ascii?Q?9s+uiJ7VOYa1V3i8l2FY3ZzBGwtyez3YG2ky2nKVI33CEAOHn/rDQJ7wpXwl?=
 =?us-ascii?Q?1DqzdlWMVef74Ddvke/mT8x/7HInyRxLCeKJVXA6Y8txxzs/bOJ2LZtp2W7R?=
 =?us-ascii?Q?sEgyvaQl2m639tifMah5+ILjUsGPC83b+8WXgV5q+cPQuIkttmdJAxDy5XD2?=
 =?us-ascii?Q?HI2m+gCMgf+lpMhaj0RhDhqbHmPb60j/vWSYFUBcJcu+bElwIYq29lUsI2KD?=
 =?us-ascii?Q?3qKeCKn5hWEr4jbTn5Jamu5Vm855b8zRV1nYqBXn031y1SjvCaEfBVls0zP1?=
 =?us-ascii?Q?4ycEK0E0aHzgN/gOS0FTc81wRteQMNGp7PyxuFD3ZEXFZFbN7/Q4hlwvoNSQ?=
 =?us-ascii?Q?ImcDq4oay8ihr1EO8denWfh7pHMCxEpnqj1+n6n4ZEmNWkeDpyHF0KUYbTCN?=
 =?us-ascii?Q?ZrqQlg3kqkNG26apbN+E1vIlY51vf/vkYj2QW2qrUnUltCjjETLkQU9y3P8j?=
 =?us-ascii?Q?rFubdHY+oVeZGQGWszDGwlSMIAbdq6AeHyre5qhcm8Ofjy3BEMuk4rYH6Fhx?=
 =?us-ascii?Q?+oMWaVE2KEfBeIKUF20xpxYUf2MQDQAUHD0Yv4rxH7FbwqJASd9uBdmV3yAg?=
 =?us-ascii?Q?1I52FpAz1Y+nQp7CyPVERMCEGPM726xxlAGWfcOUpbczzibzF1+9557eXcmG?=
 =?us-ascii?Q?kwazIDltBA2XisQEX/Buf4uVeAQ86jmWwPaNYdkhxe1+vfsK0ShR2O2uC/Jr?=
 =?us-ascii?Q?bZ6aCpE4/VGmyGMHhQ5ELYFZFV/PsvtvHmhbQJjbAm87+lFHmUAQejKpWr9m?=
 =?us-ascii?Q?nVqhXj9GY/AbLhH7VwL4jD0IjGbNsm51bUm2aqACofuVIqN0an7z4JGKPLoA?=
 =?us-ascii?Q?vFw8szFrnyeNg+VlTtXMqjXzR1qm0ayPIRKuV8AikGTb53188crm37nWzQev?=
 =?us-ascii?Q?QdkRj7JTTLqDuWYIepv9NZOnIsBO5jEgJPau+bGEOvoLTVX4NccuOVeSaCRk?=
 =?us-ascii?Q?2msEF3cO83xu0z8S2HxOISSQM94BAtMBkiqe3COkvDCiRhKHElw8sYMPv7IK?=
 =?us-ascii?Q?P9Nd6UIHQgvuNmlxs/BEUZY66fnRn6rHb3DduMFc2h3AyrarTOwz7dM3lzaT?=
 =?us-ascii?Q?3Nzomgn1V9ZFmrLEP84hlRgbbjgFUEgj1w4da0O1OIVKH2IXv8CmiE4zUtWK?=
 =?us-ascii?Q?C8BHC+OgkueHmKJ3sfuk4x66FKGpRiCb9x8oir1Yfz3h40bR2q+BIcaVyaBa?=
 =?us-ascii?Q?E9YyudEgXA4FzyJr0j16UM1JBgBVjReEiwwfvBsZMysj0+GSAvlKXgge3LFF?=
 =?us-ascii?Q?tmRM4vmxV1aBIS2lOd9INe0Awps7yHM3WDuOee/VYS+ncqVynIJXu3Z2foWB?=
 =?us-ascii?Q?zu0owqSxwkbzUfA+ptviV9qDRIZx6oW6g88ccRhDUUjEKxTfjXaCcoje/iT0?=
 =?us-ascii?Q?1LkhyvW3zf9mqjjGQgCGXEm1/NoJYAKbyfYByDCcqWPaK37l50jCr49clKsk?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d91741-1b27-4d8b-5e09-08dcf445dd7b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 16:06:48.7293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: muo47klFcvnvjDZC5RaOYsdySqmxZSOTsO7QwOw+hQySRY0XHhxdqsbsFsL+PV4KcLCxr9m66Iu5FhkOLIF8cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
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

On Wed, Oct 23, 2024 at 01:32:53PM +0200, Hajda, Andrzej wrote:
> W dniu 22.10.2024 o 00:34, Matthew Brost pisze:
> > On Mon, Oct 21, 2024 at 11:54:30AM +0200, Hajda, Andrzej wrote:
> > > W dniu 20.10.2024 o 20:16, Matthew Brost pisze:
> > > > On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> > > > > From: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > 
> > > > > Debugger needs to read/write program's vmas including
> > > > > userptr_vma. Since hmm_range_fault is used to pin userptr
> > > > > vmas, it is possible to map those vmas from debugger
> > > > > context.
> > > > > 
> > > > > v2: pin pages vs notifier, move to vm.c (Matthew)
> > > > > 
> > > > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > Signed- off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> > > > > Signed- off-by: Mika Kuoppala
> > > > > <mika.kuoppala@linux.intel.com> Reviewed- by: Jonathan
> > > > > Cavitt <jonathan.cavitt@intel.com> --- drivers/
> > > > > gpu/drm/xe/xe_eudebug.c |  2 +- drivers/gpu/drm/xe/ xe_vm.c
> > > > > | 47 +++++++++++++++++++++++++++++++++ drivers/
> > > > > gpu/drm/xe/xe_vm.h      |  3 +++ 3 files changed, 51
> > > > > insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/
> > > > > drm/ xe/xe_eudebug.c index edad6d533d0b..b09d7414cfe3 100644
> > > > > --- a/ drivers/gpu/drm/xe/xe_eudebug.c +++
> > > > > b/drivers/gpu/drm/ xe/ xe_eudebug.c @@ -3023,7 +3023,7 @@
> > > > > static int xe_eudebug_vma_access(struct xe_vma *vma, u64
> > > > > offset, return ret; } -	return -EINVAL; +	return
> > > > > xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes,
> > > > > write); } static int xe_eudebug_vm_access(struct xe_vm *vm,
> > > > > u64 offset, diff --git a/drivers/gpu/drm/xe/xe_vm.c b/
> > > > > drivers/ gpu/drm/xe/xe_vm.c index a836dfc5a86f..5f891e76993b
> > > > > 100644 --- a/drivers/gpu/drm/xe/xe_vm.c +++ b/drivers/gpu/drm/
> > > > > xe/xe_vm.c @@ -3421,3 +3421,50 @@ void
> > > > > xe_vm_snapshot_free(struct xe_vm_snapshot *snap) }
> > > > > kvfree(snap); } + +int xe_uvma_access(struct xe_userptr_vma
> > > > > *uvma, u64 offset, + void *buf, u64 len, bool write) +{
> > > > 
> > > > Maybe dump question but are we overthinking this here?
> > > > 
> > > > Can we just use kthread_use_mm, copy_to_user, copy_from_user?
> > > > 
> > > > If not then my previous comments still apply here.
> > > 
> > > This function is called from debugger process context and
> > > kthread_use_mm is allowed only from kthread. Spawning kthread
> > > just for this is an option but looks odd and suboptimal, could be
> > > kind of last resort, or not?
> > > 
> > > Another options: 1. Keep reference to remote task in xe_userptr and
> > > use access_process_vm(up->task, ...).
> > > 
> > 
> > I think remote refs are generally a bad idea but admittedly don't fully
> > understand what this would look like.
> > 
> > > 2. Pass xe_eudebug.target_task reference down from eudebug framework
> > > to this helper and use access_process_vm. Current call chain is:
> > > __xe_eudebug_vm_access - has access to xe_eudebug.target_task
> > > ->__vm_read_write --->xe_eudebug_vm_access ---->xe_eudebug_vm_access
> > > ----->xe_eudebug_vma_access ------
> > > > xe_vm_userptr_access So to achieve this multiple changes are
> > > required, but maybe it is valid path to go? One potential issue with
> > > 1 and 2 is that multiple UMD tests were failing when
> > > access_process_vm/access_remote_vm were used, they were not
> > > investigated as this approach was dropped due to different reasons.
> > > 
> > > 3. Continue approach from this patch, but with corrected page
> > > iterator of up->sg sg list[1]. This was nacked by you(?) [2] but
> > > I have problem understanding why? I see lot of code in kernel
> > > mapping sg pages: linux$ git grep ' kmap.*sg' | wc -l
> > 
> > I looked here every example I found has mapping and accessing 1
> > page at time not mapping 1 page and accessing many.
> > 
> > > 61 Is it incorrect? Or our case is different?
> > > 
> > 
> > A sglist segments are dma-addresses (virtual address), thus every
> > 4k in the segment can be a different physical page.
> 
> sglist is also list of pages and their lengths (in case of consecutive
> pages, they are glued together), i.e. exactly what we need. And this is
> done in xe_build_sg: it calls sg_alloc_table_from_pages_segment which
> is documented as follows:
> ...
> * Allocate and initialize an sg table from a list of pages. Contiguous
> * ranges of the pages are squashed into a single scatterlist node up to the
> * maximum size specified in @max_segment. A user may provide an offset at a
> * start and a size of valid data in a buffer specified by the page array.
> ...
> So sglist contains the same information as hmm_range->hmm_pfns[i] and little
> more.
> 
> So my concern is if mapping operation can destroy this info, but looking at
> the code this does not seems to be the case. For example iommu_dma_map_sg
> docs explicitly says about "preserve the original offsets and sizes for the
> caller".
> 
> 
> > 
> > i.e., look at this snippet:
> > 
> > +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start; + +
> > cur_len = min(cur.size, cur.remaining); +		if (write) + memcpy(ptr, buf,
> > cur_len); +		else +			memcpy(buf, ptr, cur_len); + kunmap_local(ptr);
> > 
> > If 'cur.start' > 4k, then you are potentially pointing to an incorrect
> > page and corrupting memory.
> 
> With added possibility to iterate over sgl pages in xe_res_cursor[1] it does
> not seems to be true.
> Why? cur.start is limited by length of the segment (cur.sgl->length), if it
> happens to be more than 4k, it means sg_page(cur.sgl) points to consecutive
> pages and cur.start is correct.
> 

I suppose if the cursor is changed to walk the pages not the dma
address, yea i guess this would work. Still my much prefered way would
just call hmm_range_fault or optionally save off the pages in
xe_vma_userptr_pin_pages given at some point we will ditch SG tables for
userptr in favor of drm gpusvm which will be page based.

Matt

> > 
> > Likewise if 'cur_len' > 4k, then you are potentially pointing to an
> > incorrect page and corrupting memory.
> 
> Again, in case of consecutive pages it should be in range.
> 
> Anyway if there is an issue with consecutive pages, which I am not aware of,
> we can always build sg list with segments pointing to 4K pages by
> modyfing xe_build_sg to call sg_alloc_table_from_pages_segment with 4K max
> segment size.
> 
> [1]: https://lore.kernel.org/intel-xe/20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/
> 
> Regards
> Andrzej
> 
> > 
> > This loop would have to be changed to something like below which kmaps
> > and accesses 1 page at a time...  for (xe_res_first_sg(up-
> > >sg, offset, len, &cur); cur.remaining; xe_res_next(&cur, cur_len))
> > { int segment_len; int remain;
> > 
> > cur_len = min(cur.size, cur.remaining); remain = cur_len;
> > 
> > for (i = 0; i < cur_len; i += segment_len) { phys_addr_t phys =
> > iommu_iova_to_phys(sg_dma_address(cur.sgl) + i + cur.start); struct page
> > *page = phys_to_page(phys); void *ptr = kmap_local_page(page); int
> > ptr_offset = offset & ~PAGE_MASK;
> > 
> > segment_len = min(remain, PAGE_SIZE - ptr_offset);
> > 
> > if (write) memcpy(ptr + ptr_offset, buf + i, segment_len); else
> > memcpy(buf + i, ptr + ptr_offset, segment_len); kunmap_local(ptr);
> > 
> > offset += segment_len; remain -= segment_len; }  buf += cur_len; }
> > 
> > > 4. As you suggested in [3](?), modify xe_hmm_userptr_populate_range
> > > to keep hmm_range.hmm_pfns(or sth similar) in xe_userptr and use it
> > > later (instead of up->sg) to iterate over pages.
> > > 
> > 
> > Or just call hmm_range_fault directly here and operate on returned pages
> > directly.
> > 
> > BTW eventually all the userptr stuff is going to change and be
> > based on GPU SVM [4]. Calling hmm_range_fault directly will always
> > work though and likely the safest option.
> > 
> > Matt
> > 
> > [4] https://patchwork.freedesktop.org/patch/619809/? series=137870&rev=2
> > 
> > > [1]: https://lore.kernel.org/intel-xe/20241011-
> > > xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com/ [2]:
> > > https://lore.kernel.org/intel-xe/Zw32fauoUmB6Iojk@DUT025-
> > > TGLU.fm.intel.com/ [3]: https://patchwork.freedesktop.org/
> > > patch/617481/?series=136572&rev=2#comment_1126527
> > > 
> > > Regards Andrzej
> > > 
> > > > 
> > > > Matt
> > > > 
> > > > > +	struct xe_vm *vm = xe_vma_vm(&uvma->vma); +	struct
> > > > > xe_userptr *up = &uvma->userptr; +	struct xe_res_cursor cur
> > > > > = {}; +	int cur_len, ret = 0; + +	while (true) { +
> > > > > down_read(&vm-
> > > > > > userptr.notifier_lock); +		if (!
> > > > > xe_vma_userptr_check_repin(uvma)) +			break; + +
> > > > > spin_lock(&vm-
> > > > > > userptr.invalidated_lock); + list_del_init(&uvma-
> > > > > > userptr.invalidate_link); + spin_unlock(&vm-
> > > > > > userptr.invalidated_lock); + +		up_read(&vm-
> > > > > > userptr.notifier_lock); +		ret =
> > > > > xe_vma_userptr_pin_pages(uvma); +		if (ret) +			return ret;
> > > > > +	} + +	if (!up->sg) { +		ret = -EINVAL; +		goto
> > > > > out_unlock_notifier; +	} + +	for (xe_res_first_sg(up->sg,
> > > > > offset, len, &cur); cur.remaining; +	     xe_res_next(&cur,
> > > > > cur_len)) { +		void *ptr = kmap_local_page(sg_page(cur.sgl))
> > > > > + cur.start; + +		cur_len = min(cur.size, cur.remaining); +
> > > > > if (write) +			memcpy(ptr, buf, cur_len); +		else +
> > > > > memcpy(buf, ptr, cur_len); +		kunmap_local(ptr); +		buf +=
> > > > > cur_len; +	} + ret = len; + +out_unlock_notifier: +
> > > > > up_read(&vm-
> > > > > > userptr.notifier_lock); +	return ret; +} diff --git a/
> > > > > > drivers/
> > > > > gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h index
> > > > > c864dba35e1d..99b9a9b011de 100644 --- a/drivers/gpu/drm/xe/
> > > > > xe_vm.h +++ b/drivers/gpu/drm/xe/xe_vm.h @@ -281,3 +281,6 @@
> > > > > struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm
> > > > > *vm); void xe_vm_snapshot_capture_delayed(struct
> > > > > xe_vm_snapshot *snap); void xe_vm_snapshot_print(struct
> > > > > xe_vm_snapshot *snap, struct drm_printer *p); void
> > > > > xe_vm_snapshot_free(struct xe_vm_snapshot *snap); + +int
> > > > > xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset, +
> > > > > void *buf, u64 len, bool write); -- 2.34.1
> > > > > 
> > > 
> 
