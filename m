Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45985C04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 22:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A4E10E21C;
	Wed,  8 May 2024 22:13:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UgSgf/Kn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473DA10E21C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 May 2024 22:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715206423; x=1746742423;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XYK4En7faNYQpAVeAoorTSEro5PeVgz9laV8UDtMlKk=;
 b=UgSgf/KnFnbqRHb63KynfaqD1si3lwM6odUSijrDx0lUGMc1PWyDomr1
 2ZS90VTCJt94mLFjj6Q2QgN+Uw2jzMAtLpGPef4APKJbTLFqhwVOXghx8
 FjxInTa9xNUCSkBVH/6vNdJJHTZxzTT+rFgzFHlGZk0yq+0iYJhExd2xK
 c3zxwN0z6khP4gtTvyk5Le7l53V948uJXcuqTeQcjh2p622quh5ZEWmzz
 mDeDMqyQYfEGENZrWppBrx7To1OEi8FNt5BToce7CADtxXniOwU8pq9UF
 nU1aEZtFZJTBCdSN9AXZ4ZAslX+Oka25ZkdWIp1SCyUpmVCyddC0AF2lA g==;
X-CSE-ConnectionGUID: Xg73+QnwSvqsiq6Z4eexAg==
X-CSE-MsgGUID: cGrKsnhiQpKfO+rT+Ha6vQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="33606850"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33606850"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 15:13:42 -0700
X-CSE-ConnectionGUID: lOd5tkw8QUCzGRKGDIyc8Q==
X-CSE-MsgGUID: B5fFihIAQ6u/10jn94sFzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33834590"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 15:13:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 15:13:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 15:13:41 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 15:13:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEm8vi2bxlGWzosmIs1lWAJYwMBLX8PBR1EvlVBuue3u1eOV6J9toAGg0HsWhxtCqhxAzTg9w0TnB0h0H82YHQ4sSj88KVRuQcus4ruVwjYVpfJVxgb00gpMENSK61/7LQAZNhD9xYC2y56Z5cVbSywjEp+rv2WFfzXACEosdBaXggvkhPBgdZTNr/iQB4WFtjlgl+ncipm6gGrkoijDr7aDVy48mZahHd+Gk6R2jQsDS9hnQH/eqs8asNznxWq6vP7BqSR3OuJED4Wef++pM/T9bLgkyV6aJthdt7eYJIgKcuLJkRqSDlp6Vp9InZszwIlYpv2XTK9aqFZop2MPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0xjHSOZJsDm77Cmktko24PO/2RQOYoL+QaOy57iuC4=;
 b=FoQaljtSg31Up3cilK6HEleHvKK6fVs7nBTDNXkLdc/146I1O+RSJDX0c3ftrvlQfO4+NsW+nXPjFKyuaM0RTwhdooRWXI0UV1beY/B+iY8RU7aCNUhwcKiQ0Vbv6GcmDB26UZ8+5R27Gea7W883sKfzbggDvQjsVEix2LVyJEUYat9uzsuVWcpWsRj7oTJ1Z15pYyjEHQbYXrQYo9wRMcAfudxxcKuY+o2Ns4Ih4h4WaphloLBSx+ucMrdIm2X6Gf3HXY4mAdE0f2GT444uHGyBwfmBwyotowMKr1AtMlCG744b5WULCOPggn9JTinzDFuhglnyWCefmpJg2Pyw4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH0PR11MB5158.namprd11.prod.outlook.com (2603:10b6:510:3b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46; Wed, 8 May
 2024 22:13:27 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 22:13:27 +0000
Date: Wed, 8 May 2024 15:13:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw=?= =?utf-8?Q?=3A?= failure for drm/xe:
 Add Indirect Ring State support (rev3)
Message-ID: <20240508221324.GJ5615@mdroper-desk1.amr.corp.intel.com>
References: <20240507224255.5059-1-niranjana.vishwanathapura@intel.com>
 <171518187952.2017562.9954616597904547501@8e613ede5ea5>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <171518187952.2017562.9954616597904547501@8e613ede5ea5>
X-ClientProxiedBy: BY5PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::42) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH0PR11MB5158:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6669c0-3b0d-451e-000c-08dc6fac15c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?55nPxI0X3mnK4BY3y0dkJABx1lLM7ytoEYEVY4zTdoEXMK8xEWJvQDw8FzRk?=
 =?us-ascii?Q?XGZml1OnF/J0Ae9rL31tKmQkSRCYTmxR92UlJB3J1K27/u3Xm4JAHjZKLf+r?=
 =?us-ascii?Q?NYgM9KnABjLB0WT7c0bdrfhaI1VcmEHPxpI2A0eoP9/9lr6H35/JUl8lQ9Vn?=
 =?us-ascii?Q?Jclk1ashzeub/28JeQlbFFbi1lSdoPayFFe04ecH/tidlN4o93YeQg2ePjYo?=
 =?us-ascii?Q?8qulq0SghZWHxRMxDeULfwsub5QbVGSETNhfnlE1uRYYNF0c2i66AqZq9DKO?=
 =?us-ascii?Q?Tfgft72F1Bxmg/FmWunoIoaSdRbwcolmo21PG9kkZDi7w/4idpJcRVC0dtFk?=
 =?us-ascii?Q?8biMCGDXYj5JQOJBNQozlhVcQwKJXo1a3OpkULAbMw7NTlP4Yt8nmWsMa4kc?=
 =?us-ascii?Q?w8eXNcL+U17G/ft1aJVFhJaGV5DfWM8KCcNQmofC92f1d1LgTxuDVtEFKFT6?=
 =?us-ascii?Q?k22Dy7XJzFSONC0+GNbjUAe+goe3bRmhkg2SjjC0nfyirgd857NXS2SiwKEi?=
 =?us-ascii?Q?UbMXuBamnEVcRuLbGe5fBNQtl3ANTGQGr8a2Nwy74a/MtlovNHzvxs2K7CkN?=
 =?us-ascii?Q?OnBuKIGqS3arIOP9vRQaivNc5nsUd7lgrLYMZPodN2E0sCtl5LWknlSNO7ct?=
 =?us-ascii?Q?9/NjEkcPbMRhWB2dIgDqPTzJpXSyrVsnmD8WaYAnQA1ExrG0OWnRMlQyujdb?=
 =?us-ascii?Q?oyb4nf+aeX2layXN1lzjtzophIqjXtw6nuHXV1NrQt/I0ALPtt/OE0YfSu1h?=
 =?us-ascii?Q?RLsofPGAgLl9QwRZGvZfkIF2hjk072JIxZlFe5v6e2PoutBnfO4SNsZd88zx?=
 =?us-ascii?Q?VmEBtF66ORw/btMYQlc+eGwLQIO3zrdLtHAwasS2KttpnceI4PnOW8eOK9wS?=
 =?us-ascii?Q?CJ7CRKXmr2H1CPTvg7vGyFS7KTVi5QnXEyxTEWcteVQsPFEP+sNyWjEuRRWg?=
 =?us-ascii?Q?2JFOR1vu46ejfKILFGQKdi/CYaCAwDtEuurTyuiF4891Aemi6iD9lBebenqP?=
 =?us-ascii?Q?yC1UhSzCxBRVqB+kngQ5MsrD9L2b4x0YA8fMEssKtVqRyD4pDouG4X1XAYnM?=
 =?us-ascii?Q?03wRSB8mgM67EAc7L3r9HzgcdsDBT46E7DDeX2nwippOdhIJ7YVrwnheuBC3?=
 =?us-ascii?Q?RCp2mTHOGK8LGfz1AQGO6LvWNVA4rKgRluxFpUmBr+go+7bteq8jKoeJh4ZP?=
 =?us-ascii?Q?XqqjwLJNV7frQywfUhwZ8X1WnnrEmYMh3dIJz6a0nSWzmxNlsBTUMzcrEhU?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m3PpetBLBIv9An1GR1XSDsWmpd2e4FnIFRBDBztJxP4pBMi0qu5p5MzENtwT?=
 =?us-ascii?Q?Tpd7VUMaHn5QhjT2m9c01fxNWMq2QPjyS7InvwYDFF3wcLMTdbzaIke8CtHK?=
 =?us-ascii?Q?/4sD8nED5qWpwi5qSeuj2BOg5lPcfiiKTH++TUmB6SPw2sJMxJWngiPTYTWq?=
 =?us-ascii?Q?aagd7WnhgmhErNqqiC8YNCL/yMiGMNqOZ1hx87sun24sntmco1n47nIbTHJ5?=
 =?us-ascii?Q?P8C0R5T5yinhFyCLvqm9u/sXHuW2CxfxM9FbsvT/IkcissONziZgn6XRdEj9?=
 =?us-ascii?Q?cMXexyIf1QNs5tJm2TsrfubgU/C7Tnz2Cj2tILeoFFpwRTi3yDD5VR+h1+pU?=
 =?us-ascii?Q?wOiBIc9dZ3pxwYWwJX3SWqt//7n9fUmcOb6rVDSOuB1nPBl9O1IPUEJVOS81?=
 =?us-ascii?Q?Ievp1D4IoSJPocmJzhksIgkm7Fn3jOnPiHzgKBgXsIUUrgUnI6xTANJjKJt0?=
 =?us-ascii?Q?L9m0HGzpimqB5Ra88qQk9Ip/AhUXpO+k477Lz0jeDHhOAGuMeT1TVyacUr8/?=
 =?us-ascii?Q?EAp5ock0NMUWkcfLpQfKLDhSnojYq9isVCgBBmHtEEOvuxgea8BqPHawiC37?=
 =?us-ascii?Q?GSq1WrfprYoC0qWNBbISrXWzGsv7A3odxaDqT6C95srp/WPe6vIPDXOfZfQW?=
 =?us-ascii?Q?L1KhqM3Ca/sOMUzKjZYjiT84xdZHEBA4yGTdifkYRhFThp1MelT5AFYA/LhP?=
 =?us-ascii?Q?x6bpApmhRJ2oRS+GiwQN4oGwpVB2yFA4bVGSGLZsJS6Mh/r5QqEYniQRuOkh?=
 =?us-ascii?Q?FvylosyGBH4FL6FLlOoG56ZeTkLwoPb0HpPg17BCLrHHNKe6e/A7ZeJajICp?=
 =?us-ascii?Q?EWgRXFGM9+wqhL5FKrJeaemkTjDeXyLPH/L6mEmAN8hBSvfZwsIurjN1k83W?=
 =?us-ascii?Q?N4zvqtFgdqV0qTVCh9R+HfYlW16gRvVlh+fAp/LURxgHCkK2oDUFlbUPkwgr?=
 =?us-ascii?Q?altW8BjLHkD5OiMFjZCEL3hNiaOVKiFRDuqsxYoIrIF6ZGgfwVn7+KfwiNjj?=
 =?us-ascii?Q?rm6iWU20kE0ONHqmTS0rP1s7hF5kAoyYUvhAAo8CzaUpi70VKdzk4e+rRzZ2?=
 =?us-ascii?Q?LRWOfV4raiD63fR84U9Kxsc1i0FMTERZrK79pzvR4JUjjdv3dyc5w4/eJ4JQ?=
 =?us-ascii?Q?nVTqI83YT8l+zWJgVD9/qd6DRik2gVTHWw8fD5xCLCYsvnPw0EF1kYTBBwRd?=
 =?us-ascii?Q?JGQqHuZBGlN4Ee7tpyXw/8lWhkQs+ALoeA4PnFcdMr1Ieiw0cKfoFZgqxHJV?=
 =?us-ascii?Q?ZdxilNfmrYFGn9YINfBnql5VijCwY6Y0qybqN+yYG5CYHaMiEaqbQKSc0M0X?=
 =?us-ascii?Q?YkwRKE821XmXlS65fMOqGGEkGFFH9EOTAgsduWhRWG+t8xJUo9L5gR9S1bVw?=
 =?us-ascii?Q?6t5AP9UsiymlRXTJEYZI2eaBkraGtXmcPoCjiLIUiNFJ5DoslAYj9hPZNTQc?=
 =?us-ascii?Q?Tj8f+f11ni6h7tTCdaCaMcAmVTmnPWN68fx749OZhiGgnjxCe1lvTN/zbqDv?=
 =?us-ascii?Q?LGx97qXGuvgbzmq/6wyZy1ov7ncEvIMuH9RTTMQL80+cdfoa3fCJxMpSMLgs?=
 =?us-ascii?Q?DmA1u8MJfx/RgiB+teKZaqjXrCpQKca6u/fqLI+kXpYWfO6bKRnVLuyE70XC?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6669c0-3b0d-451e-000c-08dc6fac15c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 22:13:27.1920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZhUkfY24gvkllrv0wuU0SzKNDcIyhhf9XJreB6YxXtiGmRVhndQHPkj+AMf3n2+tYLTOyZ4tzb5weGcIMVjbeL8zuUptLftmt3zx3d0q1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5158
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

On Wed, May 08, 2024 at 03:24:39PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe: Add Indirect Ring State support (rev3)
> URL   : https://patchwork.freedesktop.org/series/133207/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c_full -> xe-pw-133207v3_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-133207v3_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-133207v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-133207v3_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_threads@threads-shared-vm-userptr:
>     - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_exec_threads@threads-shared-vm-userptr.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_exec_threads@threads-shared-vm-userptr.html

ADL-P wouldn't be affected by the Indirect Ring State changes here.
Some of the errors in this report look like they may be
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1638

Applied to drm-xe-next.  Thanks for the patches.


Matt


> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-133207v3_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@4-tiled-addfb:
>     - shard-adlp:         NOTRUN -> [SKIP][3] ([Intel XE#1201] / [Intel XE#619])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_big_fb@4-tiled-addfb.html
> 
>   * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [FAIL][4] ([Intel XE#616]) +3 other tests fail
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>     - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1201] / [Intel XE#316])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1201] / [Intel XE#367])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#367])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][10] ([Intel XE#650]) +7 other tests fail
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
> 
>   * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +72 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
>     - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][15] ([Intel XE#616]) +3 other tests fail
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-7.html
> 
>   * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-blue-to-red:
>     - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_chamelium_color@ctm-blue-to-red.html
> 
>   * igt@kms_chamelium_frames@hdmi-crc-planes-random:
>     - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#373])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
> 
>   * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373]) +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
> 
>   * igt@kms_content_protection@srm@pipe-a-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][20] ([Intel XE#1178])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x85:
>     - shard-adlp:         NOTRUN -> [INCOMPLETE][21] ([Intel XE#1195])
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@kms_cursor_crc@cursor-onscreen-256x85.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-32x10:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#455]) +5 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-32x10.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#308])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#309])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
>     - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>     - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282]) +3 other tests dmesg-warn
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][29] ([Intel XE#1214] / [Intel XE#282])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
> 
>   * igt@kms_flip@2x-wf_vblank-ts-check:
>     - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_flip@2x-wf_vblank-ts-check.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][31] ([Intel XE#1214] / [Intel XE#1608]) +4 other tests dmesg-warn
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
> 
>   * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
>     - shard-adlp:         NOTRUN -> [DMESG-WARN][32] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) +4 other tests dmesg-warn
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>     - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455]) +3 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
>     - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#651]) +11 other tests skip
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>     - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#656]) +12 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
>     - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [PASS][39] -> [DMESG-WARN][40] ([Intel XE#1214]) +1 other test dmesg-warn
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_plane_alpha_blend@constant-alpha-min@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +2 other tests skip
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> 
>   * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#305]) +5 other tests skip
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@cursor-dpms:
>     - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#1211]) +1 other test skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_pm_rpm@cursor-dpms.html
> 
>   * igt@kms_psr2_sf@cursor-plane-update-sf:
>     - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201])
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_psr2_sf@cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1122] / [Intel XE#1201])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-psr-suspend:
>     - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#929]) +5 other tests skip
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_psr@fbc-psr-suspend.html
> 
>   * igt@kms_psr@fbc-psr2-sprite-plane-move:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#929]) +7 other tests skip
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
> 
>   * igt@kms_rmfb@close-fd:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][48] ([Intel XE#294]) +2 other tests fail
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_rmfb@close-fd.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#327])
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#756])
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1201] / [i915#2575]) +3 other tests skip
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute@ccs-mode-basic:
>     - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#1447])
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_compute@ccs-mode-basic.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfd:
>     - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#1123] / [Intel XE#1201]) +1 other test skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfd.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1123] / [Intel XE#1201])
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm:
>     - shard-adlp:         NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#261]) +1 other test skip
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_evict@evict-beng-large-multi-vm.html
> 
>   * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>     - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
> 
>   * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
>     - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
> 
>   * igt@xe_exec_fault_mode@twice-userptr-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
> 
>   * igt@xe_exec_store@persistent:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#1201]) +7 other tests skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@xe_exec_store@persistent.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#979])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_pm@d3-mmap-system:
>     - shard-adlp:         NOTRUN -> [FAIL][62] ([Intel XE#1221])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_pm@d3-mmap-system.html
> 
>   * igt@xe_pm@d3cold-basic:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#366])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@xe_pm@d3cold-basic.html
> 
>   * igt@xe_query@multigpu-query-invalid-extension:
>     - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#944])
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_query@multigpu-query-invalid-extension.html
> 
>   * igt@xe_query@multigpu-query-invalid-query:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#944])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html
> 
>   * igt@xe_vm@large-userptr-binds-134217728:
>     - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#1201]) +16 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@xe_vm@large-userptr-binds-134217728.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@xe_vm@large-userptr-binds-134217728.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][68] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-434/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-463/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@forked-move@pipe-a:
>     - shard-dg2-set2:     [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][71] +3 other tests pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_legacy@forked-move@pipe-a.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_cursor_legacy@forked-move@pipe-a.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - {shard-lnl}:        [DMESG-WARN][72] -> [PASS][73] +1 other test pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-lnl-6/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-dg2-set2:     [SKIP][74] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][75] +2 other tests pass
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-466/igt@kms_hdr@invalid-hdr.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_cursor@viewport:
>     - {shard-lnl}:        [DMESG-WARN][76] ([Intel XE#1330]) -> [PASS][77] +1 other test pass
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@kms_plane_cursor@viewport.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-lnl-6/igt@kms_plane_cursor@viewport.html
> 
>   * igt@kms_plane_lowres@tiling-4:
>     - shard-dg2-set2:     [INCOMPLETE][78] ([Intel XE#1195]) -> [PASS][79] +3 other tests pass
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_plane_lowres@tiling-4.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][80] ([Intel XE#361]) -> [PASS][81]
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-adlp:         [FAIL][82] ([Intel XE#771] / [Intel XE#899]) -> [PASS][83]
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
>     - shard-dg2-set2:     [FAIL][84] ([Intel XE#771] / [Intel XE#899]) -> [PASS][85]
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
>     - shard-adlp:         [FAIL][86] ([Intel XE#899]) -> [PASS][87]
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][88] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][89]
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@xe_evict@evict-beng-mixed-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][90] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][91]
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@xe_evict@evict-beng-mixed-threads-large.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@xe_evict@evict-beng-mixed-threads-large.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - {shard-lnl}:        [DMESG-WARN][92] ([Intel XE#1620]) -> [PASS][93]
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-8/igt@xe_gt_freq@freq_reset_multiple.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_pm@s4-basic-exec:
>     - shard-adlp:         [DMESG-WARN][94] ([Intel XE#1214]) -> [PASS][95] +1 other test pass
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s4-basic-exec.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@xe_pm@s4-basic-exec.html
> 
>   * {igt@xe_pm@s4-vm-bind-prefetch}:
>     - {shard-lnl}:        [ABORT][96] -> [PASS][97]
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-lnl-1/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@core_hotunplug@hotreplug-lateclose:
>     - shard-adlp:         [INCOMPLETE][98] ([Intel XE#1195] / [Intel XE#1365]) -> [ABORT][99] ([Intel XE#1538] / [Intel XE#1717])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@core_hotunplug@hotreplug-lateclose.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@core_hotunplug@hotreplug-lateclose.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events:
>     - shard-adlp:         [DMESG-WARN][100] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358]) -> [DMESG-WARN][101] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358])
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
>     - shard-adlp:         [DMESG-WARN][102] ([Intel XE#1033] / [Intel XE#1214]) -> [DMESG-WARN][103] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324])
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][104] ([Intel XE#1231]) -> [DMESG-FAIL][105] ([Intel XE#324])
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [DMESG-FAIL][106] ([Intel XE#324]) -> [FAIL][107] ([Intel XE#1231]) +1 other test fail
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>     - shard-adlp:         [FAIL][108] ([Intel XE#1231]) -> [FAIL][109] ([Intel XE#1242])
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [FAIL][110] ([Intel XE#650]) -> [SKIP][111] ([Intel XE#1201])
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_content_protection@srm:
>     - shard-dg2-set2:     [SKIP][112] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][113] ([Intel XE#1178])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_content_protection@srm.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-435/igt@kms_content_protection@srm.html
> 
>   * igt@kms_cursor_crc@cursor-suspend:
>     - shard-adlp:         [DMESG-WARN][114] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][115] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
>     - shard-adlp:         [DMESG-WARN][116] ([Intel XE#1162] / [Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][117] ([Intel XE#1214] / [Intel XE#1608])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-2/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
> 
>   * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][118] ([Intel XE#616]) -> [DMESG-FAIL][119] ([Intel XE#1162]) +1 other test dmesg-fail
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-434/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-6.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-dg2-set2:     [DMESG-WARN][120] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [DMESG-WARN][121] ([Intel XE#1214] / [Intel XE#282])
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][122] ([Intel XE#1201] / [Intel XE#455] / [i915#3804]) -> [SKIP][123] ([Intel XE#1201] / [i915#3804])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-464/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-adlp:         [INCOMPLETE][124] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][125] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>     - shard-adlp:         [INCOMPLETE][126] ([Intel XE#1195]) -> [DMESG-WARN][127] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][128] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][129] ([Intel XE#1201])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][130] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][131] ([Intel XE#1201])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend:
>     - shard-adlp:         [INCOMPLETE][132] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][133] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
>     - shard-adlp:         [INCOMPLETE][134] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][135] ([Intel XE#1191] / [Intel XE#1214])
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
> 
>   * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [INCOMPLETE][136] ([Intel XE#1195]) -> [SKIP][137] ([Intel XE#1201] / [i915#2575])
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_psr@fbc-psr2-basic:
>     - shard-dg2-set2:     [SKIP][138] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][139] ([Intel XE#1201])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_psr@fbc-psr2-basic.html
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_psr@fbc-psr2-basic.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][140] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][141] ([Intel XE#1201] / [i915#2575])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-dg2-set2:     [SKIP][142] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][143] ([Intel XE#1201])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [DMESG-FAIL][145] ([Intel XE#482])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-adlp:         [DMESG-WARN][146] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][147] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-2/igt@xe_pm@s2idle-basic.html
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-1/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s2idle-d3hot-basic-exec:
>     - shard-adlp:         [DMESG-WARN][148] ([Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][149] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-4/igt@xe_pm@s2idle-d3hot-basic-exec.html
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-9/igt@xe_pm@s2idle-d3hot-basic-exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-adlp:         [INCOMPLETE][150] ([Intel XE#1195] / [Intel XE#1358]) -> [ABORT][151] ([Intel XE#1358])
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_prime_self_import@basic-with_two_bos:
>     - shard-adlp:         [SKIP][152] ([Intel XE#1201]) -> [SKIP][153] ([Intel XE#1130] / [Intel XE#1201])
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c/shard-adlp-9/igt@xe_prime_self_import@basic-with_two_bos.html
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/shard-adlp-4/igt@xe_prime_self_import@basic-with_two_bos.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
>   [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
>   [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
>   [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
>   [Intel XE#1221]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1221
>   [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
>   [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
>   [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
>   [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
>   [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
>   [Intel XE#1465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1465
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
>   [Intel XE#1488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1488
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
>   [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
>   [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
>   [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
>   [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1646]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1646
>   [Intel XE#1650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1650
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1667
>   [Intel XE#1717]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1717
>   [Intel XE#1731]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1731
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1749
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1761
>   [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
>   [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
>   [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/374
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
>   [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
>   [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
>   [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c -> xe-pw-133207v3
> 
>   IGT_7838: 155628bc9d0ee70c67c3612462a62f095609f152 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1252-703bc96550be8cd9f4995bfa5126ca8a2e98c58c: 703bc96550be8cd9f4995bfa5126ca8a2e98c58c
>   xe-pw-133207v3: 133207v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133207v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
