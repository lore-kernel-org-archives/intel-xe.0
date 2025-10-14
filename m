Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A2FCCD193
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 16:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18FD10E668;
	Tue, 14 Oct 2025 16:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgdBXkKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC210E668
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760460737; x=1791996737;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AOrFRI+TYG35f6b+Bmq+GMzL7/HFlXVJjNgyjyKo5Y8=;
 b=fgdBXkKju3Lwco40Zg75ySR2RfN7DKpvr7epUGz5En0wHv6FS1PBW2AV
 6au1vbkBvBSDmAp0F0Vk/EuXgmJV1jYp0pUUCVqYRsvcXhdek1dKMA2Op
 kIaKSnkhu+M9l7us2FFriFYrpmwEut5OVotJTboNYHw7FVClBoZo65AxE
 jFuitOyOx6Q7OlDwz7JauX8ghupwqUZ6hgUHndQTkFI6mOF5s3z4mT58G
 ojY9txoM2lnbI4iIfm+Kh6YVBtcacOvayfN+olPxtIvSfuA8jYKlkGLeP
 Pn02GrXaIqjePQQWrRiB9wj1I5EvtUEYVFK1DxCz0lU4hwbaiWYgSub3k w==;
X-CSE-ConnectionGUID: HnaZK7wlTU+pIOhjGNJuhw==
X-CSE-MsgGUID: pZB2dFE4T5u8gWXLOfmzrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="85245580"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="85245580"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:52:17 -0700
X-CSE-ConnectionGUID: ngtz0Uy4SpeKnuzxtHLe7w==
X-CSE-MsgGUID: ib+auFtASIGz6V/tCtL6cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="219076181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 09:52:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:52:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 09:52:15 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 09:52:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULYDtoX+pgUYcTcQxdput+5S0CyU7wtpcmOWttCW7gGtm9OXHuy5GZc0sk7PvWK1rVvg1Xfypmp0to83iRyPagqKJvAa7wZ0auc5p/EBCAkgiuN6LnKRkST8+ui56M0Qhih9FzscMkioYi70QADpncQ0jpSXTO0d7iSRqDlNSPJCcgVD03TEdWEfYUFB5UHBRV45/sybg3WHxRdIRqUsH30kVcRzWoblEQT7gIPYi0Jot8iyRI2Vaji0fJOaX/zcCpD2Y0aulMB4F42HMDFY/OIHtnv0YJRp871zNGy9Tk7YqrAr7o2lsobpBunEU2qP97c2+53NPU8dwIO/Pj3jpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqfSWhtmqDrZ/EHR6xfQiIC+S3axH3fegLcfpqyUp6g=;
 b=PolkQTZgJ+DzlBz72cyUQy5/OFdArXGoqd0QTF5YFNCUJ6iL7mORllwLQoV95pu+67h/M+mtw9wqtHDU30W0j34NWDEZ1OluGgxiTfp6zjNv6QzV55D8G/bzc+9C6VZBwPa9o2JhjPmrJk8Nj/Ev3QvlCGilDqqsO6PdWrUeU3RCB7wB9wMEYV3g8CRBNy5AiNQecL3y8Tx5+IofRLA/5hTkqveL69Uu/yIbcl1+tCpNHnv+Ceds6ujrwCHMTbhu/P6kuXx/LJHY796iHKuvpEP02/VEFsRSbFbu0jN85+p3WwNT8VhPdh2VZykcrA/HYpmruYTACSgXQL0s6Z2QLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.12; Tue, 14 Oct 2025 16:52:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9228.009; Tue, 14 Oct 2025
 16:52:13 +0000
Date: Tue, 14 Oct 2025 09:52:11 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 05/23] drm/xe/xe3p_lpm: Stop reading the CTC_MODE register
Message-ID: <20251014165211.GR5409@mdroper-desk1.amr.corp.intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-5-bfb74f038215@intel.com>
 <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7b5ed9f9-3b0b-4d6b-b2bf-a3abd209e4d4@intel.com>
X-ClientProxiedBy: BY3PR05CA0046.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::21) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: 690900d9-b3ac-488e-91a2-08de0b420662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+PVeJnoUR6hVxd42HojwhPJus6BSaQOvS7LThIBhoFjG4c6vXgA0qTduPGzF?=
 =?us-ascii?Q?MJBx9wxXEdAjlI+TF2zUcOkuIixRHudrvr/Fdx/HQ6Mp3h/8FiHK7Yb0oDTm?=
 =?us-ascii?Q?sVhSu1wweEBMcRuYuzE+RQdfKCJkt5hW3UH0cUou4eZzauYUxTMZH9vb4Iz1?=
 =?us-ascii?Q?VUP9cQq27PO1ONe3bIwKf36FrdhmufBEGr+0SfkAeKfMak4j8ipbyR/KF+9/?=
 =?us-ascii?Q?kMmHdJzvoNd8DctC3GPcpANwwKpOEHqZ4/BrkeOuypIaM9yrNnCQQ+jlemui?=
 =?us-ascii?Q?PVGqATK75Y9jJDI/saXe5BUR7juN/0hb6LQl7rEXE2nBeu4nYF+U6Jl8kBFy?=
 =?us-ascii?Q?6I+pd2EjxcmZRC4hN+5wdzUAcbcJV5VMzzq+83HCfKceK0YhJP9SdX5BJdqb?=
 =?us-ascii?Q?nq92uK3aNz/GphkB3D78VIVzmLhzxGPS6m7IKg4DiXwiWDaWSRXmh7S1nmJw?=
 =?us-ascii?Q?szbcCy2a3WauMsMGr28lTX1vYkptg8d7c2yh3nl5goIa9FHjX795p6wqlndB?=
 =?us-ascii?Q?xd5SGsZ2oSrGLbP7epvEMbxRIMRCq3z11v6dmo8+5RYL+9vwdwbdKRmeq7dm?=
 =?us-ascii?Q?Z34INCtNgxuj/BCjwE7MGNoBMFLoetcyL7mFZDmogDki1brp+g7z4WtRdUiv?=
 =?us-ascii?Q?qf36cQrBfN3L8jzvgqEUpamNmgXXxsYGDkl/+Xju4P+k+kr/WyXibTSraR7I?=
 =?us-ascii?Q?mJGJo7deb8E0UVdre8iYvMoUIbuGa2YKZ2HZr2rak5EVTTf4+U6Y5DZ1m7H+?=
 =?us-ascii?Q?Cu8laxNsbq90XgR0UGqpMzOO5oNaFrrFQt58TLmaTWzI9PPy+8Sfa+Uzmbs+?=
 =?us-ascii?Q?0rDcVNiqA8RmT4UvtRQlfucBQHG7HFYUdIYmlcs4ELjHwNQLk6FDJyafvdrm?=
 =?us-ascii?Q?dIe2f4r7cKHEsABtOJyLWhcEWNSD3euh1+/WnlsLc/j5Nx2qONxkw9yo9R1a?=
 =?us-ascii?Q?pZVWB7+uJSg6FTYwBxUJV0+sMYxKUZszJ/VUdSWJ70Jyqgz5D+gJlRMA+wJG?=
 =?us-ascii?Q?abH+82KSM1yO84Nlxbv48u9sGnHESjMGP7EGMUW15kGj8h0tsqM751LeQzRo?=
 =?us-ascii?Q?LVk9m1nZ+jLf/UM28YXKIShGq8dg5CDv21BKfzfDv3eVKI8LtXl3ByYlvWX+?=
 =?us-ascii?Q?5ZFntpEO2I1XG6BrzhH4nS2sbGX9cckthsTNHmTsl6IQkFeZmAvDPQzkY7ma?=
 =?us-ascii?Q?H1aiF2tWd1t8yj/Y3pTD2gLMEVMwPO1r4+VtXcomLx+DhGPRkft9fzk5jIe1?=
 =?us-ascii?Q?2HzTAoY55n3p/AXXeg7HNT+MSNO6LcvPuC6D6bUBunpiCyaKZ3ivSSq7JDeb?=
 =?us-ascii?Q?RtIxWBvo9/VdfoIrU+Q2xyZJZjLkbK3txbCGKNn4mpvVCZ6MFmEJs9IbtnCO?=
 =?us-ascii?Q?Bv8N+5cYfhf1Y5dZAOTP4fvHoa7Fz5PkecjjF4BhlQgGX6zVXmzl+yx9uSb9?=
 =?us-ascii?Q?T+e7FH5joCvb+OcfJ1CTJVOGSO0/28xv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QDp5lwfIGL7BkwGCDTtLUvQSu5YTkxGXh9pmglM7D54FcgQ6d7WV1+cOBKCm?=
 =?us-ascii?Q?5yMWS54IoXKTmjt0VH7x5PR2Wd1Qhw7EH3yHSROznBI7q0huvCSQluVeVMkg?=
 =?us-ascii?Q?S5oziPYP1wfJ+qd4vZhBS/ssmqcQ435GXuJMujp2f4NZ1Z5BM5p2dCqCgDB3?=
 =?us-ascii?Q?AipSyJ8itGG9/9zsZ9tQY8xBNBEIG7nfQl6q3GZW34YyakGhoHeYe83C/zhA?=
 =?us-ascii?Q?pJzFmpAqGRNAAlfT6em/6HK+t8+s7Mh4IRR1xOqiuNXg2erXTFUJkf5U/raa?=
 =?us-ascii?Q?RJ0LDsYdczXQtZo+nElN84g4qXw9uJ4LlBuBjw3pzF3nHKLWYLGip30P5SFb?=
 =?us-ascii?Q?lmt3HH6/4JZWja/xawOtyWcjKWenpZS5nwil+fR8YiMB88JxxxGeciWXbzCb?=
 =?us-ascii?Q?20cQ0fC3xK4cRGh8bgPWrwAKF8qJkj/1byjmSgD8Lmub77QCD55i0cr/Sa14?=
 =?us-ascii?Q?4MJXx4S0Ek/6utQEfd5mBjJxRyrsEkKZb9wvJ7YdTBPdE+SNm0Hmc/4Xq7Tm?=
 =?us-ascii?Q?PAxyl722j8rDZb3+Syyr5CkGLONcEgSSs5F+iApXbKhQJnmAnapZ8fT8nfPf?=
 =?us-ascii?Q?+BcT1Ov1/PPt/rgWuj/MDtoz/YU1psinc+U7VbuxJx9GZ0HN1KNrG1dNy4pd?=
 =?us-ascii?Q?K6HUkxWF9cjr2zqK0nRDBoSCuNxUjQO6n2RPlmFxsIjLvktL9WG4sQ+Ix2vn?=
 =?us-ascii?Q?PbPL7s1DPuYrEkaIeLNhgvt59nt1Tzra2RFRRwRHBYOcYAsYZbHTHEByXG+V?=
 =?us-ascii?Q?TNMg5vlP986qQGLSOZrZkAn8+Go0CReBQeBMIy9H+yHPciZcM4YkT+uze6J+?=
 =?us-ascii?Q?y5Wzr97BeDtRHVDZBDQMoE0FZX4APSDmUtbB7mVeC/hEtJ0x5jcIC//01Dr4?=
 =?us-ascii?Q?Vp9va4iTzLRVKd5zycNBOIRpnykREyADNqXe3pICsO62Q1OKEGhz+t0gyHGy?=
 =?us-ascii?Q?GYTzqHypCNRF45FhFdLMBdXk72XQe4l8mlqjHYrgA0OKU+DLvVZA6KUM7smz?=
 =?us-ascii?Q?Q2ylPh4BuqWa+Gl3TJsdlXbhVeuJKVdWf68j0X86divkyfmG2CB3PELTsIJ9?=
 =?us-ascii?Q?bmeWkNezPjeByUBS6PuB5cO55ib/SGpum3ngF9nHht0y6u16s3u63kZwfm2K?=
 =?us-ascii?Q?lWtM/BmA0tXdhBWvXRhQc34PvXhXkEsB2JgErj1u2PBuPFjlaXanDeP7XyQx?=
 =?us-ascii?Q?Fkbl6vKVZAHgCFtLRZqUd5Fr04tRju5Ryc8dCABFEqcgn/nLhqSheOTaSoBC?=
 =?us-ascii?Q?Yr0YWVwCvR0PzqpQ0H9y1wju/crAiRit2jMjmds81r3oMG3E5ujDH6CR8v/a?=
 =?us-ascii?Q?tHFlSjTl3g6VZFeEioGTLWX0iIRLJTy2T3HWba+4NzWjThUkYW6ugqs2u2kw?=
 =?us-ascii?Q?eqDqaguqduUKHZjMKOJRoth6jucWb/KjxspO7AlXP/MrccbJYv3FW/N/91c4?=
 =?us-ascii?Q?T9K2NPeaqEnNceUx5bRzmHSiTe3UQAhIzVLh48JKnVNjlbwyKnJ15rv69xgV?=
 =?us-ascii?Q?XImSL1ZbtgPbw4fHRjkkSVzK5B9u2PGuOxgkoHhbBEKOLGhHSKvVpoG30PeM?=
 =?us-ascii?Q?WEhY8I3OXKMiaOKLsHminHEv2/sE0dgg2b11zzkKqYdnNrwy6OhCXstbWNRU?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 690900d9-b3ac-488e-91a2-08de0b420662
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 16:52:13.7556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7xGXPqy3QqVZUfL5BQAgnXDDR0y/ovCa6q/7rQfp4uAfncU2xC9JYqAwVTpjprwHreUfAyc+IAGj9Y/Z1PQf8yrsB+90px2Mt9XholkwtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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

On Tue, Oct 14, 2025 at 05:28:48PM +0530, Shekhar Chauhan wrote:
> 
> On 10/14/2025 8:54, Lucas De Marchi wrote:
> > From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > 
> > CTC_MODE register is removed by Xe3p.  Stop reading that register on
> > Xe3p and later platforms.
> > 
> > Bspec: 62395
> 
> Again, maybe I'm referencing the Bspec in a wrong way, but I do see this
> register existing for IP 35. Maybe a possible tagging issue in the Bspec?
> Can someone comment here, if I'm missing something.

So looking a bit closer based on your comment, I think maybe this should
actually be a GRAPHICS_VER() test rather than a GT_VER() test.  It gets
a bit confusing since the bspec website still tries to print stuff out
in a platform-based manner, which makes it hard to follow exactly which
IP versions and GTs are actually relevant.  In this case the first
REMOVEDBY() tag listed is what documents the removal of the CTC_MODE
register, but it appears that tag only applies to primary GT; the media
GT is not included by the change referenced.  And then if you look
through the jumble of platform names that come after that, it does
indeed appear that media is still listed as having the register, but the
primary GT no longer appears in the list for platforms with Xe3p IP.

So maybe this is another case where we should be using GRAPHICS_VER
instead of GT_VER.  I'm not sure it really matters too much though since
we don't actually use the register for anything, except to complain
about a condition we expect to never show up.


Matt

> 
> -shekhar
> 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_gt_clock.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> > index 4f011d1573c65..26052710be8a7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> > @@ -57,6 +57,10 @@ static void read_crystal_clock(struct xe_gt *gt, u32 rpm_config_reg, u32 *freq,
> >   static void check_ctc_mode(struct xe_gt *gt)
> >   {
> > +	/* CTC_MODE register is removed by Xe3p */
> > +	if (GT_VER(gt) >= 35)
> > +		return;
> > +
> >   	/*
> >   	 * CTC_MODE[0] = 1 is definitely not supported for Xe2 and later
> >   	 * platforms.  In theory it could be a valid setting for pre-Xe2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
