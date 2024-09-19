Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BE1CF3963
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 19:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211A10E00D;
	Thu, 19 Sep 2024 19:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q1X8P2yt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E1F910E00D
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 19:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726772644; x=1758308644;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dzaZ8OW4o9+6mDl1JpApsPk8mNwx7W5f+ePY8TmTVMw=;
 b=Q1X8P2yt/l20JLuhCmIlk+XuMiw159s2LaKUme3ix1khMWvPGX0P7Yil
 SEFWIxttA3sJk2GMR/jt/sf6JtjPBfRKZLx0PxXPt/9uOpWVv6NP87OHN
 cZ8DikDkXjpjGcL/HLthCaHwu6NbyMpiO/I2EDqEV6pkk4gcV06zlU7HF
 i97X6GiTxwMwu9JBw40AVdjzn75u7MqYxcaS7VFHXWS2h8FJfuGuGJ3/h
 FQvc9jz8mW5n998gOMOL8NRBpPhnuT/m0OjGrgOvfn0kjkWEkWlyku+YS
 24zM1snmigv/vZbGDTwYdeBSfEXTA4/JiaT0C+Q+6QsqoWFUT1PI9TkxN A==;
X-CSE-ConnectionGUID: Cnm4ktYhTiiabSp4nDClhA==
X-CSE-MsgGUID: b4Oq36mhRQmOL5untdAHgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="36424477"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="36424477"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:04:03 -0700
X-CSE-ConnectionGUID: +jD5EeQYRcGuXsWPIQe2TQ==
X-CSE-MsgGUID: LfylTKQUQQ6iilbPTYsFnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="74823242"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 12:04:03 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:04:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 12:04:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 12:04:02 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 12:04:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeH24FaxDS0b4PNId0TK/qV6amQumXyuT4UcIgadjLFp/6GH8kbu5vemlWZgZ2tSPq8UXZpXAKmfAVYN0QDNNC9vxU1WBS61alft/A8t+A4JjmuDT2UOJdyPJvrUgcxhS+U10Az3bJKcs65VfZ2BsbT0GkbQz5/OszIzgj/85+7suC0xZwcctJgork9Yl0ktQbv+q7ZRf0yDYeL9QlV1yYhKVH/W1B+mBYmeuRCtY7k/EDKCWI5ZVLRr9MoNClPFXE0SO6JFnjG26jhVfjH386cW1BOCT/54Iv4GENRBvdcz5EuEoXxuwSs+SuqgFO50RvbnlG2qJNTzHY9XmfJZ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mm3q8gkQivYe1mu+8vw+lBWNJ4p2J9DOf1Xy6gaXmA=;
 b=onBnHwhcsVP2ElpIVY7NdTZyLViU6VPAu+YX2HhBX+ss1nc+DtRawptebpU4f0LznzVmGagNTI7O7Gz0Incqy105lK5y5Sxea3RbuRPLNfi/g/Gdut03U8ROGuADCBpK/UMDmStZ2Ov2LineEKZ6sj+Cak1hF67jCXMy3nxPjYn5l6xp1QSkZJYvx7EtOWYd79sSbQrAq/Bn1+/UJ14itQ8G2n0Fsd2jRnVNRDIHms23f2mlkyuk1CMy7lfk0cesYjwGJyuKA5WKogoVCZe+ylfRJfZuwRU7jP/kAf/IKx6YqlyLPT/+lbpvGUgMEp9zC/szdBR6sv/H8Y4G6rhnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4597.namprd11.prod.outlook.com (2603:10b6:208:268::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 19:03:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Thu, 19 Sep 2024
 19:03:35 +0000
Date: Thu, 19 Sep 2024 19:01:54 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Message-ID: <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918164545.3955824-1-oak.zeng@intel.com>
X-ClientProxiedBy: BY3PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4597:EE_
X-MS-Office365-Filtering-Correlation-Id: 171df5c8-7d0f-4075-3d4a-08dcd8ddc339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s2JwCfmqGB3A0DM3hiJ4tueD6m8uUfV7gXx83MLUFhP/EXTRg3c+fe7GWqVZ?=
 =?us-ascii?Q?P9OZnZijr4br8w6CQe1Q+8LQOxXFv/n7BJTZTEikpb0GOdMJcLhiFrk53owQ?=
 =?us-ascii?Q?VLuVjV8hnZ3o2EEHJi8VvLRDF+770/bYclkNMSP8+0k1QR0OZ05kx8NesrGS?=
 =?us-ascii?Q?LVvggSb2vVB0w1C0GAUkht1O8EKbN3yITQ815P99D+IzK9Nkx8Hs6n5pcw5k?=
 =?us-ascii?Q?Hic2QBwjuFL/dfxv3RiCdDkiGQ0zOTJ7tZuvlDFAHSwrPwfDJBaUv3mBmnKz?=
 =?us-ascii?Q?5vyYisdxKrJ6lZtQtMxBXo58RgdjPh/rA4J8m3SA26OQezFqAy5Tn8/+jTI9?=
 =?us-ascii?Q?NRTVdpO28V6pqBj+/lW3KFLwIlPATIEurmthcqJbICynL6IuF6v9N946SV4E?=
 =?us-ascii?Q?0DdSWcZDbUEy4R4bqQTcnuaX2pVO0JGWYwDF+J4fGQvL+e6zn8nN6g22n5DD?=
 =?us-ascii?Q?6cv6rpyShiMsh0MHmQ2tNQ5zz9UulRnkxNM18aCMyM0y7EhiORuvN6JMAf1B?=
 =?us-ascii?Q?7DpY8bg9JnFJjUhIp+rys9mmCsPfk3IqmskTSoAcVbrqb3SvxTuuyysdFoDV?=
 =?us-ascii?Q?0Akp1q6aGge22thxho4XsMatQaOZs3P2D6txiPl1A0QJxZ2wq1Mo1fGghkmM?=
 =?us-ascii?Q?YGYwX5cH7ZYJS6Ltfbk4TnQNwjB4GZoIpUb7kMulM+NhBaZ0my/+xsY4/UhY?=
 =?us-ascii?Q?m3aVkgW5IvTpGZMg6boJ3JJ2Oqg5VRYwCGNDbEjU93jo2zeVla7QNA7W5DOG?=
 =?us-ascii?Q?wwK2xEy/duY5UwZv21RiXJ/8cb+N6+abqYCEp93idFNOGqWUBj9SvzczEOLP?=
 =?us-ascii?Q?+mQQb8YihPoqUZeaLLaxJ7yx3owyfBro9HA86H/xIJAPpvFe8339aJWXVxi0?=
 =?us-ascii?Q?hvdB4uWHTiQXp5TCNnikV+IgAhes7xrs1KQYeEmGTPdGvJuT56nIbjXS+SSN?=
 =?us-ascii?Q?QEVVDbnHX6tY5cbvajuIGTmpWJyyKZft7gikaMsNCmfZOivTd0IvCcL9jZWf?=
 =?us-ascii?Q?RqbZAHUOHd7yj8S4G92YxJ6pgpkZifFbE/SkU9eilsXXP4VB3j0DiNRjeVB3?=
 =?us-ascii?Q?65gYxTNuRdbH2RBBPWVyWp72mc38ZobvZuespe2al39rtwLf1bwi0q2lVGf2?=
 =?us-ascii?Q?6VyF9LSl9gg7sIIdc7ZXBBCIRTiunT/5WvZ8EysmpLbXW/2tTR2Qgka08/72?=
 =?us-ascii?Q?GGiCL8j+Nq7LIMZy5V59wONWO9b9UXqUeEtTxEPBoQHgfJGfEt3FEUDPCMbd?=
 =?us-ascii?Q?QtXVsfqPNX2uOiHkU2BmAuFTowVJ2c3W2i7pbVzCXJvomZ+SBOTaY60/26cI?=
 =?us-ascii?Q?fw+8QIQGKuR8YFBryXZClJKIGSTqFo5FfpDl6K2WQwBhhw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?axybeCeV8tK4d/HyI0rZH7mh2IZc0nQEq3Nh0VHxKSJY0rzIjRL7yf0UzU/T?=
 =?us-ascii?Q?yWmviNDfve8fZSlYjcFmThMbpEKK3vZgB25zM8sCYsOUmcyd3mhPCRowQ1JV?=
 =?us-ascii?Q?t46WiPw5r2cRkpwEmWWKckW5mDu4USeWErfEIy/ilFW+zh7IQtDpBK3OuFUK?=
 =?us-ascii?Q?c6pd0yqN6vl13YiLMmEGPPLzvq6v6xOv/+bboRjrC6LFKmvDH1KNSMvOYVGn?=
 =?us-ascii?Q?0Qr0AMuxZTHHFzh1h4inKiZrDR/eiC2f+jkWfnZIizCvLDYicmRW7lrtBC/J?=
 =?us-ascii?Q?F1TqqKECnx5rDIFu/X4MTsBBPjTPeEyaqBDlnl0Tqme/4Mj6n3rux27OenZU?=
 =?us-ascii?Q?IV0Lcc5wXQM0peUXn3QBHVlcihfYrojEm+CKJhBbDDbdJEo46QgYmiJ2ZReY?=
 =?us-ascii?Q?HhYP2XoOypgzLGpGFR02/AEzmwgCyTTq++SjTyriIQi50BFBu7irvnN+cxc7?=
 =?us-ascii?Q?qBtGbMLf8s80uu+Kwvw1R7mHUN7cL3bUaq/H3DcyAKS+YNGGH/cesGMlQMA2?=
 =?us-ascii?Q?PsGFrJ3+evl5iPKe5xHG1z7pS5+QvqVkqgXac/fsxdxaogcWCjwceNhAh5Ks?=
 =?us-ascii?Q?2FEcEAvNz9UqUh8T7h91OuhZd7Wj0F+Tlac5IcYczMYLHAsr4pn+WXW5rngw?=
 =?us-ascii?Q?zKQJFmtkXIoF7FiTjIfeI13BiUfzqGCKFWPDx544VkouKQgGpxAFuznPt40W?=
 =?us-ascii?Q?hB/dw38zWk+gqGLbA2j6Key4X0Q3pfv5sNuKKC5fvYd+IN5MbHjZDIzs0S2s?=
 =?us-ascii?Q?xR0FKMgbsrEoCRtO1YDon4W4DB9BtPC45hD7bpdCspSY2qNYgKxdNWeu3vE0?=
 =?us-ascii?Q?BIn82dMWvYPFXvtOmabtmZYxUUJ9sbNm2+pZccBBwEPGe1pbea2EyBGAMi3m?=
 =?us-ascii?Q?aReziCsszMEFY7Y//8ZiGlF1Z+POXWMETVk5S7LoinFPlAHLayDl6xU7NpHw?=
 =?us-ascii?Q?619mlW/Zsiq2BiUEurvIYuBrFKPWZKmbgThKRXgH+F2ii59syJAij+CKg6ce?=
 =?us-ascii?Q?e9WrW8Fpku9GYM9aWZvwIZqDp/pvcqa4GFLh4NLyBz6QvUzT4OqztT5BX1bI?=
 =?us-ascii?Q?LDbd54xT3Glg1Ckwmbqo7Og7Qtcp+jrej4fqLRzft1q472JYkR+UvG6DnHHz?=
 =?us-ascii?Q?bAoIOu1Z/cZ2zlgPRH4kINRwkHktTWYwj49W7lrRd1DcoqV/Tmqdhz92rMkZ?=
 =?us-ascii?Q?9DmKQ9al0FhaFPRmKcLXFMVKGFdw9DbCCgdh4HKF/J4ROA7fyiXGehml7D/Q?=
 =?us-ascii?Q?98nh4FNBuW+DTuGgKJ9Std4a+pev8u+AeL7y16NRPZtji7NaN2eAekU6HC+4?=
 =?us-ascii?Q?uBt+865L0zcRrZi9ht8pEFptqop7+1wjLdNw2tPr4/lebBe0KDtdRgNTZJdu?=
 =?us-ascii?Q?7UHuYKe3bAOjW2fs1CV1WVmCW4ur+OpuBGRA6I7kESTNF2T/Bv3r+f9IsSRJ?=
 =?us-ascii?Q?hNKoGBeLGUa3V4SOFylLFM7zkD0tKZo/iFSnAnOAxNqiemHAZLPnq5OGErVM?=
 =?us-ascii?Q?i9ANvEjVomqKSxr92sZ0uJfqA14WTJiVvsM6aYPRUv6WvPFfgdaH8BN6gwh3?=
 =?us-ascii?Q?1HcMmup7jwxNe/qpHCxTvs7m2KgbaborMrgSNAJgoZPhXShJ5dqbd3jPzCDC?=
 =?us-ascii?Q?Fg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 171df5c8-7d0f-4075-3d4a-08dcd8ddc339
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 19:03:35.5750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0V0gbyAR9mkDWUJ/eON3Pqx4GzJuToVenTF+T1kbntsamvNlABGqd7f5U6ezXPnxCpFQp7f05MJiy2GXxAQpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4597
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

On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> Add debugfs entry to display all the gpuva that is bound to the
> device. This is done by walking all the VMs created for each device
> process, and display va information of each VM. This is useful for
> gpuvm debugging. With this change, user can display gpuva info
> as below:
> 
> root@DUT7279PVC:/home/gta# cat /sys/kernel/debug/dri/0/gpuvas
> Process "your process name" GPU VA space
> DRM GPU VA space (Xe VM) [0x0000000000000000;0x0200000000000000]
> Kernel reserved node [0x0000000000000000;0x0000000000000000]
> 
>  VAs | start              | range              | end                | object             | object offset
> -------------------------------------------------------------------------------------------------------------
>      | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00007ffff5db7000 | 0x0000000000001000 | 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
>      | 0x00007ffff5db8000 | 0x00ff80000a248000 | 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> 

This looks useful. We may even want to extend wedged mode to switch the
VM to a state where this is available after a hang which causes a wedge
as this could useful. Can be done in a follow up later.

> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 44 +++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 1011e5d281fa..0c7bee1c2a8d 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -9,6 +9,7 @@
>  #include <linux/string_helpers.h>
>  
>  #include <drm/drm_debugfs.h>
> +#include <drm/drm_drv.h>
>  
>  #include "xe_bo.h"
>  #include "xe_device.h"
> @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m, void *data)
>  	return 0;
>  }
>  
> +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file *m)
> +{
> +	int ret;
> +
> +	mutex_lock(&vm->snap_mutex);
> +	ret = drm_debugfs_gpuva_info(m, &vm->gpuvm);
> +	mutex_unlock(&vm->snap_mutex);
> +
> +	return ret;
> +}
> +
> +static int show_each_vm(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct xe_device *xe = node_to_xe(node);
> +	struct drm_device *dev = &xe->drm;
> +	struct drm_file *file;
> +	struct xe_file *xef;
> +	int (*show)(struct xe_vm *, struct seq_file *) = node->info_ent->data;
> +	struct xe_vm *vm;
> +	unsigned long idx;
> +	int ret = 0;
> +
> +	mutex_lock(&dev->filelist_mutex);
> +	list_for_each_entry(file, &dev->filelist, lhead) {
> +		xef = (struct xe_file *)file->driver_priv;
> +		seq_printf(m, "Process %s GPU VA space\n", xef->process_name);
> +		mutex_lock(&xef->vm.lock);
> +		xa_for_each(&xef->vm.xa, idx, vm) {

Kinda a nit but I've said this in a few other places - the xef->vm.lock
read usage isn't right here. This look protects the xarray lookup and
ref to VM and nothing else. It is not designed to do anything else -
e.g. holding the lock then calling another function.

With that this loop should look like this.

mutex_lock(&xef->vm.lock);
xa_for_each(&xef->vm.xa, idx, vm) {
	xe_vm_get(vm);
	mutex_unlock(&xef->vm.lock);

	/* Do something */
	
	mutex_lock(&xef->vm.lock);
	xe_vm_put(vm);
}
mutex_unlock(&xef->vm.lock);

This avoids unintentionally creating locking chains, in this case
xef->vm.lock -> snap_mutex. We should strive to only create well defined
changes of locking. Once we start unintentionally creating locking
chains it hard to unwind in a driver.

Likewise I suspect we really shouldn't be holding dev->filelist_mutex
and doing things underneath it. Fixing that would likely require
converting &dev->filelist to an xarray or writing an iterator with a
hitch though so is a bit of a larger change. Looking at the usage of
this lock, I'd say this is kinda abusing this lock too and I don't think
anyone in the community would be all that happy about its usage here.
I'd lean towards we need to properly fix this, or alternatively maybe
just maintain a per device storage of all the VMs.

Matt

> +			ret = show(vm, m);
> +			if (ret < 0)
> +				break;
> +
> +			seq_puts(m, "\n");
> +		}
> +		mutex_unlock(&xef->vm.lock);
> +	}
> +	mutex_unlock(&dev->filelist_mutex);
> +
> +	return ret;
> +}
> +
>  static const struct drm_info_list debugfs_list[] = {
>  	{"info", info, 0},
>  	{ .name = "sriov_info", .show = sriov_info, },
> +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm, show_vm_gpuvas),
>  };
>  
>  static int forcewake_open(struct inode *inode, struct file *file)
> -- 
> 2.26.3
> 
