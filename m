Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8412ECCD185
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB1F10E889;
	Wed, 15 Oct 2025 18:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E1rl1dhi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B161210E889
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760554157; x=1792090157;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5ZKiQF/zisT5zLll9it5AbR1Ncmr806z/MWp/2148pw=;
 b=E1rl1dhiHwDiTF/iaM28c3hJXLALqLbVude0kSpxDOiliaXgo7NooWqC
 nf+QQrLpiyr5rBSeJlEmiZAkxmo/ggLr79RPn3s8xIAfON9ot8M/4e96k
 wyPviE7qzjObxfpDTuaraHY0hMoEhY1Vzn3qgaV6m916wD7mEBMAVaoI5
 rgRxtwIA59aG9dhi0BWSr+kxJQB0wcWVEfymWfGQaRF/lHe0czE/pzd8O
 0C12bJSTRU2CW81Db1wI7vFCsxm9veAAIdBIEYunBcy4rP4HQTsGgFg9p
 dR1LJfSKdVBDwdylh6vAkgk8pznqkfECh+x0IbckVlgdnv5LO65X+/+Bz Q==;
X-CSE-ConnectionGUID: R2d4oxEoTh69HIpUx178Nw==
X-CSE-MsgGUID: QlcQAU25Rc+f89h2Z2xUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62668641"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62668641"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:49:16 -0700
X-CSE-ConnectionGUID: gfwCFmPkQoGam6yzpHcf5w==
X-CSE-MsgGUID: U5CCZTiUSHC402D0M6B+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="212859431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:49:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:49:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:49:15 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:49:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmlRLQEwTSKqN8wBv9UwJlhadVVPdQZBB4UoZsuF9dytKAyhzoD+Dh3xKDTpFMsl+bvSpQA4wO2uffXtwZGCqwxWZ1WcBMPvKEQU8YHHdQ2c2z9XcdH9g1kbBj32Tsi0rIKXnMayS1I4xqpj4BVrKeX3HC3s2eSim2dvFf6q+75vxh0uNYcUyUn/HGppVMh7F9G9L0BjsTDDK6qt2NFvkmXJaL7ABPGh3OWhN433jWXn3DWfT5qC9y5D7VqdHbJsa5b/coAI/NRx3agAgr/++joAuUyPvoEMNj01wL5c/a6DvI1+h569KzoNhZjD2bFpStRSBtJiL9LiHf0g2YImjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Lpni8I8QS80eyfl/jG/Vd8zEivpV/wsZgDpiP+qH5I=;
 b=fR5b8hpHrVPfT0pvbbZ1nhhp35ZK3ZmvQCSHxUXzntVqCarG47ueMLymttJhUwtjuZoAkCXJmYpRGzGEEDHtgATUMRyrvfwzC3dE02U7lFMdU0DYpEGLF1vFUxgKINu/1OBkc/GpWqBSmb+e6sQ5QzKZ9Bqjl3HPZbKEAXD6LAWv21N+lzmYacbuh6eXI9Q1P62y8Vtu5fRW6TPPnRB5gNXG7KFZv89vJ2PUsGdFlCW09S/6/V+gsrU0BLGdQMz58b8Ku3gNX6lvmEMYqxTKDDeGNbvrifbWaFJgZGxQNxJWVN7jVpNVa6YYCol/f+IrShPnwt+iTylOppKlo7NDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 18:49:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 18:49:13 +0000
Date: Wed, 15 Oct 2025 13:49:11 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Shekhar Chauhan <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 15/23] drm/xe/nvls: Define GuC firmware for NVL-S
Message-ID: <qwg3jfqccybpzajczce7tesfov7tu2w7juqf3bntf7u6tkqw3j@iuxngugds4om>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-15-bfb74f038215@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251013-xe3p-v1-15-bfb74f038215@intel.com>
X-ClientProxiedBy: SJ0PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1ba131-8f5d-4dd3-4d18-08de0c1b88c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vKuLB3/CYHiywBVoIOUehyMNw8TqE1OmRRdj4Pw1TpD7YELFx4+6iFQ7IRh4?=
 =?us-ascii?Q?urf2nZ32x1C/EViy7toioqauEoEcD5r3jIcQgW8XuKSWkJFiWQYZOdURHlvQ?=
 =?us-ascii?Q?sUFq60PkSszuwjH7ke8tx8SMZ8AD40c7TrpcioF9nGIw/tUmRMr1hJKYIF0r?=
 =?us-ascii?Q?rvz/vrW1sQlJQ/y63/qJ1edVxw0cABllrNUJ0eheKKnF3Jy1GIAphrKWci+j?=
 =?us-ascii?Q?mN/SXz0ZexOaBT4gDFSXvh/T/QzJeFw0yq05ruTHZZ4P0e2CfcLSrPlXswIS?=
 =?us-ascii?Q?/Ou3EGfROTPMKNx4EHVOhBInN7ZHwjW68osDhxa6XYyhbTB3a4iBgJtTm1/S?=
 =?us-ascii?Q?9ctvghOfeDyjcUMkjDJPSfachxoBYZ3lL67db0HsOh3qeM3r+cPY13JPhvZ3?=
 =?us-ascii?Q?Sdwzx+3fzd8ZYCP7vsd3HOOzvhJvcLCLQESxbB6FhpmpyJxRAm/RPq6ulckp?=
 =?us-ascii?Q?omx7lXhy12kpslVDrW4Xy1pepz9NgqLJj9XmdytnnVKPWl1S2rTZMyIMyYor?=
 =?us-ascii?Q?5nS2wHC0gjrtGW/CjtFJ3hsQ9aAJ629WW8H3WRpE00QIy+c2Z9Op+bkICu+C?=
 =?us-ascii?Q?JjkdcBzRmIZY+szPY8rirMn8XQZcGiGspHhSIrpDknSWOPedfAu/0Hsjh0oT?=
 =?us-ascii?Q?hKz5XS6XG/OV8fGydChDC29yXSLGro9dXA/4ZcIOz7iqbVF9HCYoN/xLM7E5?=
 =?us-ascii?Q?JrEFLfsZHdeYKmYkA6yJ9n3vFi5t3pfIgbhAhFhB0WHGBlPnsQTAx6SmBFjK?=
 =?us-ascii?Q?BseXJgNfmSZT3M2nlER0hdw5BcMfRmQiERnMr9Jb55ZEwvYKADIuCN/SWUci?=
 =?us-ascii?Q?S2eqP9IszjyC+NMokjHCRNrmaDoliNcFjfYNSKqRsPG2dSt6+QrlTVvxZ/zd?=
 =?us-ascii?Q?gLJjlzcpx4Uhm/qsitwfyM/sr/O7mP1yH6CLHe00K17fTnfsFBfp4ScvkQtL?=
 =?us-ascii?Q?SuaTsGykjWhbWbXIvPkjxO/jz4k76v8zdghFh1eiTHjQ3yhZLDgZQwTcbefw?=
 =?us-ascii?Q?FLheJ1/+B4vg9kW8McH+Bz+pKdTgfE29WyDGzPOkpICTiaCa4hZEXVSPt5mq?=
 =?us-ascii?Q?X9uPtoF6KuSGqIVDBX/dij5HVFoJmuog4FBUYp0UPz63kgXZS45wrr53gUCD?=
 =?us-ascii?Q?37SgPgxsFGfTxF9w10/22AjyvsJ38lH1l5P9/j9YcEgkhszA6VlBzeN/zmOG?=
 =?us-ascii?Q?1bHnqtHrIWR/luKejFpuZbTzg0b06AYztCOzzEs5uDomQihf7ePI8ipKyNkJ?=
 =?us-ascii?Q?zhZyt7ACBeu+mceNuKmXsc6Gjub2cQvD8JYW/oFvFz7oZc/n+IqceOyEXrbF?=
 =?us-ascii?Q?+FJCSqnU/OXHv1ASiV3jhTA3ynYJ6yElw2inqUkIvdKSgefO+Ey1jRkXgeZL?=
 =?us-ascii?Q?nl5rZ08FYNaWWCt1DjyY7WR4jPz6YAP0TFMGWJlUsztsnJqfca4shCHnMW0r?=
 =?us-ascii?Q?Nn9eSE9uV413Wmr6sUh8i6LsI85wYJg/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CJy+CsJOz024qId6PacIhNKOsNppxbfJAt9M9VkLWQpd2C8jwpao0eJfQPyu?=
 =?us-ascii?Q?QTJzdl9gItFKrFRxJDvrbwABQ1tn3o9r7VRsggPGygkY62p4HkkLCiQg+24L?=
 =?us-ascii?Q?UdvuaHOmIPdCPJn5EvWRGl5m+loT22muvlXQrnoiK2ggbKw7a+9ehuIrfQeQ?=
 =?us-ascii?Q?VbZeEFbhQKPiDuvvqO81cabhnSRFL/KmEgQWOxksM9Zxh0YvMGLzShnotCWw?=
 =?us-ascii?Q?omiOuEgc+3f5IkQshuDyHtaFD63OFRuBPphnMtQ0GFkI0fSpI+/6VCxhOx+U?=
 =?us-ascii?Q?iX0p5A/7p4qwGH0QihZz7I52iKQA1VotG1d2OEoqDyQ1Zj5iy/RDDUxfIoMF?=
 =?us-ascii?Q?u2iPFoIrXaBPgXpt7Qht2p00hmvtgO9RyXkZ/I3gvReUoggv+bb9Sy1/BRY2?=
 =?us-ascii?Q?kCI1fpHqpdxuAfHEOz2fIH223nelP+oPoftTvQRH0IDXq6F3NzFbbwFYBrw0?=
 =?us-ascii?Q?G/cOJcy/4c2x/aAgTMi5Um6BS4NuPF22HAe/wH/ffnTHfaosoxZ63r8lhOPZ?=
 =?us-ascii?Q?4Wux4XmG2FMgskoALRQVVZokdmVG1GDJiJUOcjdzEwLUbMQoI4sHJ4reVyfa?=
 =?us-ascii?Q?zk6lZ1Sm+pEb9wBmEijMIKmKOr+DVRxagOo9nu1b+xext508wyJ+7O+TkdtD?=
 =?us-ascii?Q?Y+IVL2J4kYuecb9qUiJ31oO60tle98lZKyhXExHWfl/lpub1ggduKIxv8/nJ?=
 =?us-ascii?Q?pPjKvp7nf1QoQNM+DjDd3zXQmlJhs5SCsix6iro4ZGZ8+SPyuPrI+SD7V78K?=
 =?us-ascii?Q?4TpClJw1lj5j9XAb8dfkCWYFlrZc49Vk2ij+I/NTA1Yk9fAlkapY39BuyDKe?=
 =?us-ascii?Q?P47VfXZCWJkyP0bdFHOR1gifwEZqW6ewDuXDYgB0haIF1yROpmbYXUB7FVAp?=
 =?us-ascii?Q?+txvUcmWbXXNpnLupneyrcKWQfebRp8Xi9v89epZbLavgURWzXcUlNMnaQXk?=
 =?us-ascii?Q?Do7/J+CiAnKG+Tpjw1+8zK4ff0S9T5LtCLgzBCp82mro1qit4I65B/OAoduB?=
 =?us-ascii?Q?TdgMB6CWvXNiLxJ6FHAugCLksPkla3Le/SucsskHLn3z0LN86jFaKJCrvL1j?=
 =?us-ascii?Q?EKe5B5seqEtU7XJxC/4il6+TrfOkaLRPwIY5/xUFekp4r4PzfnSyaPTCC/Zt?=
 =?us-ascii?Q?W1S+OQFqpTAacUX0ncrdbAZ0p/+5VVdA0z2wbi94/P/3FJcSAj3bLWvel8sd?=
 =?us-ascii?Q?8senAYJpzpUA/ad2fUlCFRdRcQjdo537x9DIxl1b2nPaX7qkU459mjmRNSbV?=
 =?us-ascii?Q?1nwUAyFF1Dy172WrU8KZ0NDZV/+mSyatkSOaq1vda2nQDd1P2/lPGo8sMVqB?=
 =?us-ascii?Q?Ubt3WSLrWmPMRferEUA593nIONifjxes1oL57t07cWJQxoaRmLER+zJanLTE?=
 =?us-ascii?Q?x9Ob/0kO6wbftQUGiv2qy2QFaFo1gXOoL8pxASQtdJn6qffu4ZTQ6QwE2QeH?=
 =?us-ascii?Q?aSBrueBHiOqy6uW5pMJ+Md66M18K3Ya/nxzSW56mRPgWZfNqQVPM2C1D3WAU?=
 =?us-ascii?Q?bWuTFHzp3rTMUFw5UObfCZHn69Gcx3DIFTwB5HUYX2RtfBcDd8WtInEZrFlE?=
 =?us-ascii?Q?bWKwQEio9SvIxD3nc3+Gh4BghQAB6WPhG+qkICmpQE5cNrzfovXIE3/j3zHi?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1ba131-8f5d-4dd3-4d18-08de0c1b88c7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:49:13.3063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwYvvNoFkg0vrmDGl/X3CXPAxKsLzLH89pyFi/ywqkCh4Q9KoiFrWFQE38/04lWp4R6yeuZqpm92fKLpMoydp351e8NasVd7Gv1DqPYGpfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

On Mon, Oct 13, 2025 at 08:24:47PM -0700, Lucas De Marchi wrote:
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Although NVL-S has a similar Xe3 to PTL/WCL, it requires a unique GuC
>firmware.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_uc_fw.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>index 6056ecd0b92f5..e589c7e38f125 100644
>--- a/drivers/gpu/drm/xe/xe_uc_fw.c
>+++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>@@ -115,6 +115,7 @@ struct fw_blobs_by_type {
> #define XE_GT_TYPE_ANY XE_GT_TYPE_UNINITIALIZED
>
> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)					\
>+	fw_def(NOVALAKE_S,	GT_TYPE_ANY,	mmp_ver(xe,	guc,	nvl,	70, 49, 4))	\

just a note that this patch, as a user of mmp_ver() and with no firmware
blob published yet, it's targeting the topic/xe-for-CI branch.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

> 	fw_def(PANTHERLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	ptl,	70, 49, 4))	\
> 	fw_def(BATTLEMAGE,	GT_TYPE_ANY,	major_ver(xe,	guc,	bmg,	70, 49, 4))	\
> 	fw_def(LUNARLAKE,	GT_TYPE_ANY,	major_ver(xe,	guc,	lnl,	70, 45, 2))	\
>
>-- 
>2.51.0
>
