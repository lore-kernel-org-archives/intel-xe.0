Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9309BEB363C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 22:30:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E6610E5E0;
	Mon,  2 Mar 2026 22:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HIQfk/sE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73AE210E5E0
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 22:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772490627; x=1804026627;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L4fiG1qBd2hA+m4iXqJN7YvkhhFIOGdrYxTz5/uW6ns=;
 b=HIQfk/sEpqfnWXsp6XlRuIGYALnlDdeH1//RY6J7DJZkALcdCXIr3lAB
 CJx4O40APIqz0Xb06OUp7HUOyc6Wso6hJL/v+CZIKN8PkRLhOnsMziQxa
 2IVS8Rm8bSlyRjBdNS5hpRqaGMvMixj6QHZ6LDWA+7Ipg31YExIsjAg2c
 T08FdNzCKrv86efRSkrfmPUW9dCyOY4Akn186jy+A+nyYYZeX+YInNAo6
 sZrkC6UdQhIJkZBi7TtVu2PJQjS8I8NO96kd9rtyRNVzDLVc3Ahvvh9Cw
 St2cpjPetKMUhl1LPPvn1ZHAIJe0wALT1H14OgGAsHQFyu5RnpbdJAI7p Q==;
X-CSE-ConnectionGUID: XaNDVb0rQc27sw8/UwgPXw==
X-CSE-MsgGUID: hDP0XNjQR2SbQL1ZvWPyVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77352823"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="77352823"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:30:27 -0800
X-CSE-ConnectionGUID: zD3rZKynQs6ize5hUfcv6A==
X-CSE-MsgGUID: ZGzXFG5SQJqfyyNLl0frIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="216931566"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 14:30:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:30:26 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 14:30:26 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.35) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 14:30:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l7VX+9l6hbQ5+g7hlCNUrpS72CjIFbVjQ0fut1sfT9ViAhC5/zpNy/tSAMjAlA/6su+rDetg+vXhtRr1Su+bpASsq4cUAa+80vd5lPEv+2+xn6s8Am0gUB8nqXT0I3rbySVzP7/YQeA3ephUdPh3QdPW9MLe3MxC37UXrO5wgxUf5HPkcxoxUJjJ7Os2aIHoOIBhvDRmg6GrBXkBfXjbp9uPgktFKg612EfTX+qhWtFNjFsvlq2o1jIsnx+QrvKMF4eaezQuVcJAD5AK37HGGMSnIw1lckY1f1MvoeVWl1ZJTkq4/g+idMEXWkNOIKxRlMlku9RturhYvw1K/NNPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=39IIIuuz4m7dzgp1GbW2fOhBamVkUcDjA9AVv7iMHOg=;
 b=UxhcRQ2OCh1Cer0HDR4/csY7Iro1nUht3xRMUnz2MdXpxczsjSQZpcH+kwrjJLe3KPny0TqaG+7l0WbmcI4gyMwPRYDriU8n7YPsB8oWSuKsbVNZQA7Dxeiunw88hYpaamZO4yIVROceb7kzgfykudcb2Lg6J/lUoXcYtl2VYx39AHrt0y47yyM3pBuiFGjGx2W9Tn0qaXO7U47z+Scxz2pBmHjddK+pho7BAM+cNTlD/IaUFksx/xV8BYBU5Fb8J+5QZRdGD/X21aQ/cdWwHI/Sh42CUHM0eh3b5qbQUmjs9ET5QEz5txP5Rii0REAgkXpB7QbnOmb/HEz6M7ym6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8499.namprd11.prod.outlook.com (2603:10b6:a03:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 22:30:10 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 22:30:10 +0000
Date: Mon, 2 Mar 2026 14:30:07 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: "Lin, Shuicheng" <shuicheng.lin@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw6IHN1Y2Nl?= =?utf-8?Q?ss?= for
 drm/xe/reg_sr: Fix leak on xa_store failure (rev3)
Message-ID: <20260302223007.GJ4694@mdroper-desk1.amr.corp.intel.com>
References: <20260204172810.1486719-2-shuicheng.lin@intel.com>
 <177032067544.228376.1644087039707850619@a3b018990fe9>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <177032067544.228376.1644087039707850619@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: f14d32cf-f885-4b91-9049-08de78ab4362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: es3LH1fHK8/UaauhXK5vThQHj9aaEK8K66gMTnJUpDGNx7J/V6z0YX/LUBmF9y7cnfk7cwjrMB0JNho47PhllvUt7qErQ/MaD176oWZvP6pOB30SPH+YN16oFpgYyPvW72plLFM5gQEcnVAHxgVur9nLYSz/AxgFD8THo4xSwlxsX1OPBYlEQcbewuE54BQ3dgKjP9nrBef+rZaHT/BIxjKJyMORPD2DT2GH2lhfnKJgdL21qmOW5nDLWYq0KgiNmpPjA/IzWprf9quaeSRSTjMfveG+Zj39tkpuBhms41+aANplFh6Xj8OIIHpmt62cORzcDJi/lDb3zUeB1oc8eCQtczEm9/NAQ7koMCSm7jZnRUqghMErRpOyazopfEuT+vd/fWmIDk6rE8TxdRL/ip3XOK7lqvN5+9ANAGtue6XFeSmcMShAaafjy+MCJs5+7JiTgk4NDxActrgEo3OPPEUo+CnS8RX0OUfuy/EUkILeiHxwnyO0JLdHsa07xVHHLDSTtfZT9bk6sZWMSMw6VnlYZFPMPnOOPbNpXhrXncdN9bhIegbj0W5lCS7v+cXR0CVf6DJsqUupyxAxcHRBJm+8iU/C5bj8XcjSNfX+rP9GfOrUqROmyyT7I1l2dlZt0NFISKayoALovTGGCuef6d84hklwojmZsLZiN4NANgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HDhuwCiE4VND5saFpFAulYGU26y/Tb4MU9Hs3+9H6JGsCQU4xCdKyKu3zVSb?=
 =?us-ascii?Q?yk0O838P698dm1XDHX9RZaSk5yAelHhNATMd3zJUlq2REu25YXIFWXUfk2h4?=
 =?us-ascii?Q?GX+gPFelxPF/Vvr82aMVkW0mVBkPjlx0IPcxUXdJlltVGiHuinrE5HpCX7bm?=
 =?us-ascii?Q?YC5sjDB3xiD/9+Fvxw/g1wkWjJuJdJYDU8O0TUxKtLgJiCpHysrVooF1tL3F?=
 =?us-ascii?Q?4O5P/4BKx36pLK5aa4QTV5hSvZY4qNVdA9dGxvVGN3kgXOvH1pXaVPf5xbxv?=
 =?us-ascii?Q?bnJzTN+zisCdAjmwOfqD9R7oMpKk0StFZTvkyZGeuwIzqbWhBumLqK1KptRC?=
 =?us-ascii?Q?EeDTYjP1hd/u0I8QV4GWmdpCEvBW51G9VCqHhD5nzaIJCvMj7fY/NL3MtLDZ?=
 =?us-ascii?Q?n+8Dk8KTwKTk6VPZMjOQFUybpHtSkpWLndpE6jdIcaMs15hhziQN+Xzlejrh?=
 =?us-ascii?Q?hmNbSdI93k005mOyGf3lsrVf4FSVkp1zeca9R8qPXv7AAbioTJx97VsymaAI?=
 =?us-ascii?Q?ROR+xoRJTAU0RN5yu2MfgL0ulQaNfaTRGvJD14z++5b8OC9sm+1vWl8ZtP63?=
 =?us-ascii?Q?8JmKhrzHRvH/nIpylkXUu3znwE4YvdCW5Fa8JSaioT9+k5pwVms+gmgSxEYB?=
 =?us-ascii?Q?81L2U3y7WVobhltpGjxnl6DItGo73DA3TB3vzbs5YOlVIXA7y0vAgh6r8m2l?=
 =?us-ascii?Q?FGuy8x3XMUZC0s13rd7kqzOBCEoOCmoPB/Hbyntj/+NqgHFlybfLVd9/QVxD?=
 =?us-ascii?Q?VOsSjbY3TJsvDImGNdsGUQQpIx+4p66kpOUrVdxUqnUk96x4tQK9DOe79EwT?=
 =?us-ascii?Q?fDU5HMMH/cUn9nDmDwoRyRI2U7fRFJqFQDC16NHCtB/9NYzMddcLR4Hg27ow?=
 =?us-ascii?Q?kKz+wCy1gVf+s2c1OXL3kGrZ/O2BwublMPVjjIw4v8bDzSgHK6gX1511T54N?=
 =?us-ascii?Q?W+VqjkAn5CllBIV87sY37Ca9PKS5yiTuUad+wOu2cYLlLZXoBtAfoYUuJJsn?=
 =?us-ascii?Q?cSgSySzn8P63DSPLhJKwDBD0URArlyP1NuvIgrpgj+qdvNSvAjYJkelOy2nG?=
 =?us-ascii?Q?SJtw+xpZMu2wNuh5y8VYSwEx5jd+ltd8a0Oe2s+o1ADoQX4cpmdSEz7dEhy8?=
 =?us-ascii?Q?WOq0J03PrUqr0I4Ix3T4pNqxQ0BbHbcMYWuHZIp69xMuqInipSQGN0Ebd1Mr?=
 =?us-ascii?Q?Oq1KWlVdZSRTfUE7k0y/FUeuqPLqOjobFMwtxioiubEBvKhRb4g2vVdJDQ7u?=
 =?us-ascii?Q?MNDgabULzOCxuu2OQG4n/TGc78nHw2FpbL1zcf6IBcMJtnyldqMzxSGLUjbf?=
 =?us-ascii?Q?f7KY2Nfn/6Q2nDEky80cSED2neFbkfwGu/gbWGgfFR7z+JWJA/vWz2w2LIHO?=
 =?us-ascii?Q?kyPdgaP6acmTbsKUvi9PyawFEIVngfns7fK2JhSuso62dByHlhFQwdJTQwg1?=
 =?us-ascii?Q?6z2nne7lBPGwBHPjrHTutmi0fbLXxy4tX6YLxjm4uDYCLcMFQ/c8n5c0U7Uo?=
 =?us-ascii?Q?Qv7Sk4tkJtlV5NqsAC3OmVHuLTm16YM91w8FjWRd6TYLmcGGt7fijtATb+N9?=
 =?us-ascii?Q?nXNvGHqupEeWXICNWVSgkDWu8yGDfqLIPxT+PczY7w8kLVWxrmGdh2c61wju?=
 =?us-ascii?Q?9M2Po6mM20V0XVo8r1+13HW8g2fXKsu6tucylAwrbDj1pBc6+twOwDp0D+Qk?=
 =?us-ascii?Q?KOIwuBYJzGSdH6MDIqgOLgEXrw9qF7q/Ax1RcgIRmKjMdCqkyjiXSaUO0yqQ?=
 =?us-ascii?Q?DpvMuY0DA561MXDteVa/GoiLCN6B55U=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f14d32cf-f885-4b91-9049-08de78ab4362
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 22:30:10.0734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQiJHJrVTJRWvHrTWY7GzlOx0IGozrnE6L686aEcphRXFPPkTRWV6rSL3aklSySD4WdpQdzAH/Fwf8vsTiSHY/p2/NmEh22E6kACZrwAKzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8499
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

On Thu, Feb 05, 2026 at 07:44:35PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/reg_sr: Fix leak on xa_store failure (rev3)
> URL   : https://patchwork.freedesktop.org/series/161102/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_FULL -> xe-pw-161102v3_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch.


Matt

>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Known issues
> ------------
> 
>   Here are the changes found in xe-pw-161102v3_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-lnl:          NOTRUN -> [SKIP][1] ([Intel XE#7059])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>     - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>     - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2314] / [Intel XE#2894])
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#367])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-2.html
> 
>   * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#306])
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6969]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2.html
> 
>   * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6969] / [Intel XE#7006])
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2.html
> 
>   * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#3304])
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@legacy@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#1178] / [Intel XE#3304])
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_content_protection@legacy@pipe-a-dp-2.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>     - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#2291]) +6 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
> 
>   * igt@kms_dp_link_training@non-uhbr-sst:
>     - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#4354])
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-sst.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst.html
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][17] -> [ABORT][18] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@2x-nonexisting-fb:
>     - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#2316]) +6 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-10/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7178])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#352])
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_force_connector_basic@force-connector-state.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#656]) +2 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#651])
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7061]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-mmap-wc.html
> 
>   * igt@kms_hdr@static-swap:
>     - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#1503]) +1 other test skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-10/igt@kms_hdr@static-swap.html
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_hdr@static-swap.html
> 
>   * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7131]) +1 other test skip
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping@pipe-a-plane-5.html
> 
>   * igt@kms_plane_scaling@2x-scaler-multi-pipe:
>     - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#2571])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          NOTRUN -> [FAIL][33] ([Intel XE#2029])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip:
>     - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1406])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip.html
> 
>   * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1406] / [Intel XE#4609])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
> 
>   * igt@xe_eudebug@multiple-sessions:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#4837])
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_eudebug@multiple-sessions.html
> 
>   * igt@xe_evict@evict-beng-small-multi-vm:
>     - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#688])
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_evict@evict-beng-small-multi-vm.html
> 
>   * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
>     - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#6874]) +1 other test skip
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset:
>     - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#4943]) +1 other test skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-free-huge-nomemset.html
> 
>   * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap:
>     - shard-bmg:          [PASS][40] -> [DMESG-WARN][41] ([Intel XE#3428])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap.html
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-dontunmap.html
> 
>   * igt@xe_pm@d3hot-mmap-vram:
>     - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1948])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_pm@d3hot-mmap-vram.html
> 
>   * igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled:
>     - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7174])
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-8/igt@xe_sriov_admin@bulk-sched-priority-vfs-disabled.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
>     - shard-bmg:          [SKIP][44] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
>     - shard-bmg:          [SKIP][46] ([Intel XE#2291]) -> [PASS][47] +4 other tests pass
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html
> 
>   * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>     - shard-bmg:          [FAIL][48] ([Intel XE#4633]) -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
> 
>   * igt@kms_display_modes@extended-mode-basic:
>     - shard-bmg:          [SKIP][50] ([Intel XE#4302]) -> [PASS][51]
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
> 
>   * igt@kms_dp_linktrain_fallback@dp-fallback:
>     - shard-bmg:          [SKIP][52] ([Intel XE#4294]) -> [PASS][53]
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_dp_linktrain_fallback@dp-fallback.html
> 
>   * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>     - shard-bmg:          [SKIP][54] ([Intel XE#2316]) -> [PASS][55] +12 other tests pass
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_hdr@invalid-hdr:
>     - shard-bmg:          [SKIP][56] ([Intel XE#1503]) -> [PASS][57]
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-none:
>     - shard-bmg:          [SKIP][58] ([Intel XE#4596]) -> [PASS][59]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-none.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc:
>     - shard-bmg:          [SKIP][60] ([Intel XE#1435]) -> [PASS][61]
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc.html
> 
>   * igt@kms_vrr@negative-basic:
>     - shard-bmg:          [SKIP][62] ([Intel XE#1499]) -> [PASS][63]
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_vrr@negative-basic.html
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_vrr@negative-basic.html
> 
>   * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>     - shard-lnl:          [FAIL][64] ([Intel XE#5625]) -> [PASS][65]
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14:
>     - shard-bmg:          [FAIL][66] ([Intel XE#3304]) -> [SKIP][67] ([Intel XE#7194])
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-8/igt@kms_content_protection@atomic-dpms-hdcp14.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14.html
> 
>   * igt@kms_content_protection@atomic-hdcp14:
>     - shard-bmg:          [SKIP][68] ([Intel XE#7194]) -> [FAIL][69] ([Intel XE#3304])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14.html
> 
>   * igt@kms_content_protection@legacy:
>     - shard-bmg:          [SKIP][70] ([Intel XE#2341]) -> [FAIL][71] ([Intel XE#1178] / [Intel XE#3304])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_content_protection@legacy.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_content_protection@legacy.html
> 
>   * igt@kms_content_protection@suspend-resume:
>     - shard-bmg:          [FAIL][72] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][73] ([Intel XE#6705])
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-8/igt@kms_content_protection@suspend-resume.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@kms_content_protection@suspend-resume.html
> 
>   * igt@kms_content_protection@uevent:
>     - shard-bmg:          [FAIL][74] ([Intel XE#6707]) -> [SKIP][75] ([Intel XE#2341])
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-3/igt@kms_content_protection@uevent.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@kms_content_protection@uevent.html
> 
>   * igt@kms_flip@2x-modeset-vs-vblank-race:
>     - shard-bmg:          [FAIL][76] ([Intel XE#3098]) -> [SKIP][77] ([Intel XE#2316])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-10/igt@kms_flip@2x-modeset-vs-vblank-race.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][78] ([Intel XE#2312]) -> [SKIP][79] ([Intel XE#2311]) +19 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>     - shard-bmg:          [SKIP][80] ([Intel XE#2312]) -> [SKIP][81] ([Intel XE#4141]) +9 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>     - shard-bmg:          [SKIP][82] ([Intel XE#4141]) -> [SKIP][83] ([Intel XE#2312]) +9 other tests skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          [SKIP][84] ([Intel XE#2311]) -> [SKIP][85] ([Intel XE#2312]) +20 other tests skip
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-bmg:          [SKIP][86] ([Intel XE#2313]) -> [SKIP][87] ([Intel XE#2312]) +18 other tests skip
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          [SKIP][88] ([Intel XE#2312]) -> [SKIP][89] ([Intel XE#2313]) +19 other tests skip
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_hdr@brightness-with-hdr:
>     - shard-bmg:          [SKIP][90] ([Intel XE#3544]) -> [SKIP][91] ([Intel XE#3374] / [Intel XE#3544])
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          [SKIP][92] ([Intel XE#5021]) -> [SKIP][93] ([Intel XE#4596]) +1 other test skip
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-bmg:          [FAIL][94] ([Intel XE#1729]) -> [SKIP][95] ([Intel XE#2426])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][96] ([Intel XE#2426]) -> [SKIP][97] ([Intel XE#2509])
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>     - shard-bmg:          [ABORT][98] ([Intel XE#5466]) -> [ABORT][99] ([Intel XE#5466] / [Intel XE#6652])
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
> 
>   
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
>   [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
>   [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
>   [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
>   [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
>   [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
>   [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
>   [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
>   [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
>   [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
>   [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
>   [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
>   [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
>   [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
>   [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
>   [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
>   [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
>   [Intel XE#6705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705
>   [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
>   [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
>   [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
>   [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7131
>   [Intel XE#7174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7174
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -> xe-pw-161102v3
> 
>   IGT_8737: 8737
>   xe-4502-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3
>   xe-pw-161102v3: 161102v3
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161102v3/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
