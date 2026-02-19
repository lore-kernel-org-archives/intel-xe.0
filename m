Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D9E9A048
	for <intel-xe@archiver.kernel.org>; Thu, 19 Feb 2026 15:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D5710E6FE;
	Thu, 19 Feb 2026 15:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R3AY2hQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C4A10E6FE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771515426; x=1803051426;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=3tDHvUCCKE5WJOpaTvymqOdV+4At2LGYnY2G4huPeyk=;
 b=R3AY2hQ94/NjyGJrdLb0pzM7FIfPCm0SPcT01q4F7AkOEO4O0GcLIbaT
 Jxu41i92gV7iR6RCYv++6PqUycOs8qbK9Y5F52iBDAX+fF37aiCcC1ngz
 lQ7VVaKE/T2yECzE1rMvUe/ogVUt1n4sQ18mmLGWRYnDtOcrtRFZxUEpE
 EbAZy6Ug9iLqirG/CorvXIBeey1Af/VjfZ4lkZkswOUeoiWdANC0Ntn53
 DWTetJE+vtHWf5y4ywgYiY9kaRvb5+MoX1koRJDGGma5KMerdTovNyuzs
 bK52QWgVE/0mLvSSQOyWhe5LjMjrBg3Dq/0LOA2TO8MmbYsaTbIe9zZvG w==;
X-CSE-ConnectionGUID: 7FnWCA8sTtCkPNb+NtUGGg==
X-CSE-MsgGUID: Ya4Ya4MLRXStiKvBFceZDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76438860"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="76438860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:37:05 -0800
X-CSE-ConnectionGUID: A6E5jGR2Tw+opZqOwoHgdg==
X-CSE-MsgGUID: 58+Jojw5Tg6Rn5l2PhZheQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="214658211"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 07:37:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:37:04 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 07:37:04 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 07:37:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgBsyA4k5FgJ+3GXukFUGb9Eb+5mOSjsyoh5UKWF14KiGCbMZMypg1Lbq614dcQnHMN7s//E1Lrj9NuKE7TudcBuoQ8njaL/n0fH4bM/blQuWlF0dMiq97vPZmyd80gyLlaJQa0sfr//MzrDBkow6gNunpNk5nyu4getp6V1ZpFxTJkfyB0dduM/mfnfuqeASX/+pQDi6Up2l9tVicZ6fehObBcYfRq9Bmg+7/qDGEJHHEewYDg29YtriNyOGEI0gzvP+ZvWXtipWcdR0snIfncSYQDTiHznosBeMcHUqhQ8/evyFdAruh8v3+dxSaeWvSADqnv2ZmWKTYgziJg3Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMKd2omGPd6o7Bzg1dkmAWOhbKrTOBl+8KeyYWYSrnw=;
 b=T2IFiapTrCUTxQ2hV5i4OPVPudggA+Pr/tmJHw6KySuHn0ixaUVxDc2kMHzcd6vbZHgZW4p4MFoivUB+e4mvzYor09WcKa59+MSfTRu1nSXX3ijh3tZR425poBxq8Eqkj1RSJSRUXhHnwShTXSIIC96Gfj6MRsxVcJ+rK96IkM1L1mkv5rGRvI4f8oy9w1Wod1b3d8vIibGyg+BFNBsZieHRplb8cempeY2xXJkTJ8eSj6Igqdnqh1nl61uDbfQHDqpl4NeWnTvBZcXgpLgk+rI8YShj+3VPAr0i2C6gY//y+v8mnKJyTKQtj/0DQph+upxhoG8Jy9o8ZeK6xmTKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB7853.namprd11.prod.outlook.com (2603:10b6:208:3f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 19 Feb
 2026 15:36:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:36:55 +0000
Date: Thu, 19 Feb 2026 07:36:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for Add
 debugfs facility to catch RTP mistakes (rev3)
Message-ID: <20260219153653.GC4694@mdroper-desk1.amr.corp.intel.com>
References: <20260218-sr_verify-v4-0-35d6deeb3421@intel.com>
 <177146104013.264667.13300176746340178086@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177146104013.264667.13300176746340178086@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f4b9fb-f11b-4c61-f56f-08de6fccb64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0dWfQB2dQC1hfxS+4Ev2irmZ0BuXPRldqhjkqGEVt54cL56r0YG9vnYk1bRW?=
 =?us-ascii?Q?d/lxX+MYpCXLE7IFSvG3RejZD0fd7MX8oSQdldHUNzX3XrADzvwjsKgAunbq?=
 =?us-ascii?Q?Bv5WKW0Dxcys1rmB5atoeBJQ5tf03Ip1a98Ug0T74cP5uAa06mybamSwhE7g?=
 =?us-ascii?Q?c4a/8gH9pdfg0L28HAguwngJQRf82jQ9bd5Y11VpkSleRxDxamFJq51+6C/g?=
 =?us-ascii?Q?O2TsekLCDic6DleQKp5x/GyzdwNta9c+8T456W5czK1LlHc/hH3jhCyPT1HH?=
 =?us-ascii?Q?EmZOBsEG6CxiB0q6n3DtS1DLMUbTKKES7gxwPgsJr1RmdRgzFf+PRCpoRR1+?=
 =?us-ascii?Q?eDMgj5qZs4PoWWR5N/YjQ10jUsy/0ROm045Rb2IBX/LuVgKsADwNxPjCnJ4H?=
 =?us-ascii?Q?8fW65OKtKHYRze7sAmaDso8skUqGa+5uFsZONWCQ2odhcqjp+fq9SENMXCD4?=
 =?us-ascii?Q?D5Au8s3E5uxE9q+DSmjMoab0e47bGgv5tkXVtgAqWeypNVfF1cHTg8E/HQJn?=
 =?us-ascii?Q?EMJxMrvpBRPjN2r/Wr+HmZvXlikD98Z9Bz1MN0mQgbENpCz9XD7A+GsjYkET?=
 =?us-ascii?Q?qsZ0uApzOmpc17+/Zsnom0wy0dgq85hofiOkYapRWQYMJY8C7jazUoit5YxL?=
 =?us-ascii?Q?fnEX/go79yRz+71zFoMNrC7Qhlu4g8zbA6To6ExR2c+5SoDQ3ZKOUDZyoyZX?=
 =?us-ascii?Q?9Lurq+5NXhTWa5IpCLIBiR6/YFhxbJQ/D6urpuHCwYMdBobHpLwjqXQBMNKt?=
 =?us-ascii?Q?L6eSz/zLnrAuCmZwwYWrDAa53xyj3Qpp4fOWzjANPjDSbw4CZBzpaQzLIdXA?=
 =?us-ascii?Q?voAv11Ep2olOoWDWKL+R/x8Ux3rnq+J2pJnrogLz7gP7G+5uyRYzaqvRqVEg?=
 =?us-ascii?Q?CIkkPt6jZp0weY9Wb1XeSzhlaOSQ180YBhXq3eH7iL7COYXOL1/x8nHjr8mg?=
 =?us-ascii?Q?KgEA6M2JO5ClYCw2y/tDQ/ZnvWT4YTgV7sSG5Ndga8Cw7YuTGZEpXsgyd+Qw?=
 =?us-ascii?Q?YtyOyPDtvIrghJmP5c05orZeqUu9tkCQ8hoIqZFCoRKotK3WJBSMF3RgUGNB?=
 =?us-ascii?Q?ksbmSzEY3nZtdH8RgBqxTi4h2QM7lMlSmdMgaZgObyUC88DEOziKKSjf9R3f?=
 =?us-ascii?Q?mBIOfkLCvXEaiW7npmL8KqevYTzkzoJCRJi3CDqTn87FGF94ygsIroFfzkne?=
 =?us-ascii?Q?49CtWiZZsQqFPbxLvuo940A2v7L6BlLsCmIO+ODxRw3CU1qA0IKr5UxNbxoa?=
 =?us-ascii?Q?Adtw/fEt04ycutdHW9yf7np8ULKBwUjqcsaFkfcVtRoDWMGzzShIkpZjHbWI?=
 =?us-ascii?Q?Dc0+8KR1rTIbE/V/PYRjLsUnERfBuC8tRuzBF89esqVq9ijgjU7hJr7fWJYU?=
 =?us-ascii?Q?SMaEMTHIToc8aWy3uded3CY3PcAxZzGWzOdWtgTDUwTVi2F4vODnu2/HCwAn?=
 =?us-ascii?Q?PIQUa3FnHA7x0qT5/hjzDePx1asJefbhy3XK6dxUZZwOKJMG091KFXNzBwy7?=
 =?us-ascii?Q?IG+6gl2z151FJT89hYkDHuWCXkQZGiGkULJt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M3LUAhllnE0Wy9Ell/EoTuUQHxuwPx2BUG99KxPTfp/rOi4LvV09AhI4fWAU?=
 =?us-ascii?Q?oGC9XPT2TYWzjKwKT+6J26CJ6RekhxKwdvUrIyK3LbITkDAqKFVhG5oiYBbH?=
 =?us-ascii?Q?GEMEdN0olPWu+1M04Qz79/XIAOKJhB1tLV1hiJzwvWaCOIHlFsayJWk7cAGs?=
 =?us-ascii?Q?0IwK7SXDTuk1IqX9AHYV7Jcu5eAkd/6RghYe8Gnc3g1vN4s0JHfWSTCDSHzq?=
 =?us-ascii?Q?8HOz3xPs3V1du4Njn3Mwx8Wc0mo89bd16fz1I7yqS0Qmnyc3meionoRonVbT?=
 =?us-ascii?Q?ce7IuSj+q8KRtrsR/RNvrEXwzcvwjQ9XYKt8a1DYM0nDwcovVtEkGvLJyUMi?=
 =?us-ascii?Q?H1WYvxkUYT5WMrCOM8jTpXAxpLGKuGH129hdvfwGCBJ3e00tH/9ViZtEtTRN?=
 =?us-ascii?Q?97LJ1PMXhO5bol9k2knvKkrYbtSWnnUqk6pbp/rNj0Xp6N2PEkgwQ3vlNIas?=
 =?us-ascii?Q?dEPADBllYOCD5Zjq/MuZLCNBMct5F5LuJO69bZdE72tHuytOJQTYNDfS07DT?=
 =?us-ascii?Q?P3WsxiMlfnLWAdvC7NvsuZFx1OfVQy85NT8DojAgcH+Qs7+YpdCDoaRVZVIG?=
 =?us-ascii?Q?QIcAv8HkGWahyurDp4QC7DMollqkLDL5LAOeURXaDesTEPc+WjxKVRfJYkXy?=
 =?us-ascii?Q?FgDR/80VWuKRXacZbfDjxn//0Sz5SnBmVV6+2c0SS7j2QMkH1LyW1FActN5k?=
 =?us-ascii?Q?npeR/B3PZcM1OXi+snvsffGaXcqOB6BnX8zAEgE7ENcFWpIijoY6EnrX32Ij?=
 =?us-ascii?Q?ZuaX+txmk5Puro/qGitOH7/CMJ3/3w3xVmXk9/dAqQLOq8pWAlMuT9VWQi2g?=
 =?us-ascii?Q?5wZVlvlrOZJyjs3eQiVGDjhzIhbqrMy7+/Ddetluc3rurNSeUyFZeLLDz2cA?=
 =?us-ascii?Q?tic8N5UB6v1yt3tDOL28vxa4pnWrpKTbtdl1dB1/QmCGQZ+ioDoDAOKSiTzU?=
 =?us-ascii?Q?ZU0knQPcl7UTMU0uEgmYqjr5szRRjWjPIAzqN1cUaGFt5vtpJwF1h3p0NgnO?=
 =?us-ascii?Q?kBU/MnxvEQYpaQM/SRT6FU6ErAIwRvD8FiQD3qeKSY0DeMn/B+4rvkEuMdPM?=
 =?us-ascii?Q?uxTi1tlzlYCmgd3a4V7U8mYv6Tb65G8DBIh6T7dDDxhMBTPsuL2Ld7lUYusL?=
 =?us-ascii?Q?y4q8uBVcjgfEKD48GBQQ2KhgazVQPA+guI0V+9PKeOxMZ/B6flIbmZU+fiK3?=
 =?us-ascii?Q?OrGjjjqHaHnqr/WmVs6ZWx52aQOsc3l61DbHSBRzZXaqemR9y7grfE7kMv7l?=
 =?us-ascii?Q?I4S8nt8ueFEba+P/i4m6t9S2ikFBw5FLN5iWE8piWXNAwdRi6zHjbVUbUx84?=
 =?us-ascii?Q?etL0TGRJgMVcGo6fz2veF6p2W/HWsK5/Ayrc3w32prGM7rTJ0Ui+hvNEDwi6?=
 =?us-ascii?Q?x/s6tQah7pU3dtZtTGMf3V68fmdun9st0opQ5+WdmDyRVWhSsZnKqPaaV9Al?=
 =?us-ascii?Q?P/gGdS0S7QHrGLQquAInCzZEDr9Ouav8IVVYySEP6udPzz38j6qic6SMdAfr?=
 =?us-ascii?Q?ciThBo9ngSrJX9NseZs9kAh8ZoreMdsPo70uenhwBRUCms+jvS5G8fm+yKD5?=
 =?us-ascii?Q?mJsCbd/86G7iFAhDyUE6SQZ48uajaZ2WcDYwnuSFbbFN6twNLXuj2KcIEo1F?=
 =?us-ascii?Q?PZ5oD2Dint4d4Go3kQzosKfCs+yU8IuYAeOif1FOj7eAPsTRk4db+08054zY?=
 =?us-ascii?Q?4GC6o4USDf2MtgTvyFGzcpOtxaU7X6v5yIdoCx0gGD3aCg0Xktj97wIaZ0iB?=
 =?us-ascii?Q?89xM/qjo0wyGd6d0eomrduSzHpwYxzY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f4b9fb-f11b-4c61-f56f-08de6fccb64d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:36:55.7560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOph95Sfw3L4LEM4Inp/9DQVIy1z4WoIRcmskw9t6x6UK4z/3vZQ/hjVcVTwFq1mygMQjPcZzYcnRP6qR0c9A9FWffe6ai8yP+eDFAnVraU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7853
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

On Thu, Feb 19, 2026 at 12:30:40AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Add debugfs facility to catch RTP mistakes (rev3)
> URL   : https://patchwork.freedesktop.org/series/161517/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5_FULL -> xe-pw-161517v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-161517v3_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-161517v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-161517v3_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier-source-clamping.html

Display modifier not found on this platform.  Unrelated to the debugfs
here.

Applied to drm-xe-next.  Thanks Ashutosh for the reviews.


Matt

> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161517v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +3 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2328])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#610])
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
>     - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2314] / [Intel XE#2894])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#367])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +1 other test skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-dp-1.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#6969] / [Intel XE#7006])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-5/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-1.html
> 
>   * igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1:
>     - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#3304])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14@pipe-a-dp-1.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_content_protection@srm@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
>     - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7179])
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +5 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2311]) +8 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +12 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#1503])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4090])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2391])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_psr@psr2-primary-page-flip:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#3414] / [Intel XE#3904])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
> 
>   * igt@kms_setmode@basic@pipe-b-edp-1:
>     - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#6361])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
> 
>   * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>     - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#2142]) +1 other test fail
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
> 
>   * igt@xe_compute@eu-busy-10s:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6599])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_compute@eu-busy-10s.html
> 
>   * igt@xe_eudebug@basic-vm-bind-discovery:
>     - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4837]) +2 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
> 
>   * igt@xe_eudebug_online@pagefault-one-of-many:
>     - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6665])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@xe_eudebug_online@pagefault-one-of-many.html
> 
>   * igt@xe_eudebug_online@pagefault-read:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#4837] / [Intel XE#6665])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_eudebug_online@pagefault-read.html
> 
>   * igt@xe_eudebug_sriov@deny-sriov:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5793])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@xe_eudebug_sriov@deny-sriov.html
> 
>   * igt@xe_evict@evict-small-external-multi-queue:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7140])
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_evict@evict-small-external-multi-queue.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2322]) +2 other tests skip
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7136]) +6 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
> 
>   * igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6874]) +10 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-dyn-priority-smem.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>     - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#5625])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7138]) +5 other tests skip
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html
> 
>   * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6964]) +1 other test skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html
> 
>   * igt@xe_pm@d3hot-i2c:
>     - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#5742])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_pm@d3hot-i2c.html
> 
>   * igt@xe_pxp@pxp-optout:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4733]) +1 other test skip
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@xe_pxp@pxp-optout.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>     - shard-lnl:          [FAIL][49] ([Intel XE#5993]) -> [PASS][50] +3 other tests pass
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
> 
>   * igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-2:
>     - shard-bmg:          [INCOMPLETE][51] -> [PASS][52] +1 other test pass
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-6/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-2.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-7/igt@kms_pipe_crc_basic@read-crc@pipe-a-dp-2.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-bmg:          [INCOMPLETE][53] ([Intel XE#6321]) -> [PASS][54]
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
>     - shard-bmg:          [ABORT][55] -> [PASS][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][57] ([Intel XE#2426]) -> [SKIP][58] ([Intel XE#2509])
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
>   [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
>   [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
>   [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
>   [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
>   [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
>   [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
>   [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
>   [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
>   [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
>   [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5 -> xe-pw-161517v3
> 
>   IGT_8760: 8760
>   xe-4573-7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5: 7ee0795cb4f30c9ccc2b8a580faebcefbdf150c5
>   xe-pw-161517v3: 161517v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161517v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
