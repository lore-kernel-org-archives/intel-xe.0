Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4674AC3601E
	for <intel-xe@archiver.kernel.org>; Thu, 10 Apr 2025 17:23:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0072210E371;
	Thu, 10 Apr 2025 17:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EqFicqUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED65B10E371
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Apr 2025 17:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744305781; x=1775841781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=r7vs0uoFwNz7chKD/PWH7toDT4e8jCt4//0gZK0Dmjg=;
 b=EqFicqUvTpdWtdUe8J/vQcqGdrnT9nNVO7aj4y/3VB553bdFV8ZBuXsO
 D74T/g/8pYHKw4/wFrI9RRcLGdfaJJ/1LILzPJ06iWch4ensqHNm4I6h5
 S2uXdgS4M9Np9qxWo0xmOL/zL7cff36gfRgX9+SEuZnZltfoBFmLcJVkY
 aLX6Iy6soG59BSQPr7vU8mhbco86eIpPW+vOcafQt2m70CLI2bQB+Zh6R
 va2LQ+pvfIYyiaF+y+KIgaEb2WrSn+uACcz9anklWq6bQH54jex+rZrlN
 3S0tmnjQB5Vl1h7TSwu20L70gu2udyVRZvfF6dE985sUVHjsgLy3hIrFE A==;
X-CSE-ConnectionGUID: kg1zWdTAQg+3r4Mgd4hGlw==
X-CSE-MsgGUID: K2hSUAcrSGaT/n5XxscpDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56021064"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="56021064"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:23:01 -0700
X-CSE-ConnectionGUID: 8cS8hVKmSpeTKXDTqBlznA==
X-CSE-MsgGUID: ycSFj9RtRUuVA8I4nsbCLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="129504026"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 10:23:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 10:22:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 10:22:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 10:22:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gbe1YRLHj5idnSc+DMEBakxldRJqv+TnAGGaJR57WPo/JSSPNzxokhHl40ioCiLghn2S+x+6FOu2ZrvoFw9HmWxjy8JhcWoVleiebrjF2Qs3eBFoSPrPAWILcj45+rbt5R3GqkGloMzJUXzXytsvWEAsxEu7kcmgupld2KlU0yzjlQm3qesfpgWhMPZmNQi4vQyTQAKAr58Pk5uI8n2qoNYVOH550i+AotQpiWsjU2rrI5PjqS4EQdowfpEJYftd8DLRK4VX4pQcsXCC+5qaOF9iQbyBrRs/zd9lCEDcNloww8CiAY90D2WYGP3Xqg2lKe6YO0ZDdlQSRpjhzsuelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4bWE1ioxZ84dm1Wf1hTWlnQo8NBwaOptVs/PT/26ZA=;
 b=ZRj2g1zr1mCifbEL8M80z/857nEJJEyYzEsa+/TXyAHVYslSjlREyRWGFiNwPMO9/36ShpxMu/i1ZdHLQJon7oBvUlEX/hof/m0TzaMDIGEZGDloCImztjT6qjJw72wXWWxbMCRq3FseiVB+TePoXMpzeqELtexSTIz39vJQelw+r56zR/IuYjoWhpUrViONZzXngdw3LzvMRxp1UVakFoi9zPo+etg6ToiqYYR/XKHq8SFPJQyyupfv1johqUDl4AhJx0VkRQ5h0pbl1afH+Ej2X27bFHZAqGwb0A3nghQIrJznoY3I5+lYfOicyK9tWosqmcHTBIZYj6GZKF2ubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8227.namprd11.prod.outlook.com (2603:10b6:8:184::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.25; Thu, 10 Apr
 2025 17:22:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 17:22:56 +0000
Date: Thu, 10 Apr 2025 12:22:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Marcin Bernatowicz
 <marcin.bernatowicz@linux.intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/vf: Don't expose privileged GT debugfs
 files if VF
Message-ID: <gdl2ir2sgvpzgr57bdhv25jot4ss3s575nbro5dyklcfbje7dc@qoqodu4dqonu>
References: <20250403142635.1821-1-michal.wajdeczko@intel.com>
 <20250403142635.1821-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250403142635.1821-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:303:8e::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8227:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e85c063-ab47-4599-af4d-08dd78545563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2qWHZ4gDfBVLMVeF7FBNWfhAdtTMJCDfgWiWhJXa/XfZBAWONoDEtVxxIuMQ?=
 =?us-ascii?Q?SfRRB05CPV0Y3X78rkUNbzfLA1CCvn/8FQm7CmgaoZMater2nf+vEqCXKZNK?=
 =?us-ascii?Q?mVKyHFWxR/gTe/vv9rzLb/c2OB+3U6kCe/JfscOl8FDFNMSe/1AGX5gAIPlf?=
 =?us-ascii?Q?FUksHLdKtiVBX10bVEQw1ISPKKkdE7yT2ozWgibVJr/YbiL6SzIggGOhCb5n?=
 =?us-ascii?Q?BoQCInqdoj/oST9OOOlB8R3wwr++83WLP4inltbjTJuSH4cgfg/p0AKCWJi4?=
 =?us-ascii?Q?GZOY/c2UuR6Y4zroRi+ZsS17wT7rkW1IWzGUtPYP5f0okayuLSvlNJ7fo/ZT?=
 =?us-ascii?Q?j4IMfMs7TxyjvS+S+N3Ot7Ax3TCmKtka2tCValTl8eZTSx81pdUhaTdY3+Hy?=
 =?us-ascii?Q?DTsdQzobptDt7QHRUI3fp6qO2OdplSujtQSmxMteAQjMFXJxC/k/iymFfcym?=
 =?us-ascii?Q?bYcjx1CUp/H6llGpjYd5Gh7uf4ddziRAdqFpH/HMBhezQZlcVGCCn0yCBUYW?=
 =?us-ascii?Q?ZanykucxNsnsrBM34gNly4S8lbBXKXh4lAuygPQv0YS7h0+DXNO9aiTobUxS?=
 =?us-ascii?Q?ei4vtYZa4I5S9cjffKGBELhY1O1Rw6hxXOiq7GNFdsacCiPMilpGGESDY+TZ?=
 =?us-ascii?Q?Xmk3YvCsL1P/6D25U4p6/1IkhzcSq+Qt7/m5dIuXfP55Z1El9N+8yo4dQlTo?=
 =?us-ascii?Q?AAmpMF6Zri6sF44knFthUulhqnZernPwTChH2kAL6BFfNd+niKezvfYqqNQI?=
 =?us-ascii?Q?cYEISj2gbcWnfM2+oSA7KP7nCKXmLIWHQdg6GH5ZC9QXDAJlHJY914jpifl9?=
 =?us-ascii?Q?ohUyANhqvsQ7+c/bb+Gpg8CMiEX7KhAE5ca8j5LIUKpZ3ALazT+rTfowmRfC?=
 =?us-ascii?Q?7UnYzSPy2LN5AdMj8wDrja4Gr18cvRMBZnAQ7JYl02wFZYsmpXvL+8fNl9fy?=
 =?us-ascii?Q?9zoPZOijQdvZOpCcQrBU4lDUKkLiz88fThETuE4PcC0hfzuv40R//bflCcVo?=
 =?us-ascii?Q?+QKDrSvhLIn3PtmZkm0tegksvR2ZVPQSDDqtb5H6+7m1EZeP0EZXdavIfMQo?=
 =?us-ascii?Q?kNMPHOGdBoqsfBn8N7ikI7e05tYN3WSSNdey1F5yjHVQSccSrewzUIs6hmrH?=
 =?us-ascii?Q?el3GqifHabzKPzylDTelxeV/jOgKm6Vf5MAXJUPPQp6Jw9LJ2vMx2FpJ4vy9?=
 =?us-ascii?Q?A3LdFhjNsBo4jBvBpo7MBiOV7QJn64zB+0XjzSuNXze2pOOriZ8mEplfjtc4?=
 =?us-ascii?Q?/GFcz4Ej8oGOdjV9O93Yzfkw1b1WkjqKA3ttJh4YgFNzwglqvQwdbtrCIFr/?=
 =?us-ascii?Q?PJHBt3D2Ww3MZsSiNLj03GOrOmqAJKecJmLWGxfRfND2q7yUT5Hs1scF9zb0?=
 =?us-ascii?Q?vLiQKZyMp7P5W7HsuqVRjRyqwGWf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QnutKj/HWxRr/Yo4jQVL7wIfMhg2J6JBBxORwbfKUnzDaEx0w7KUz4CqFiRa?=
 =?us-ascii?Q?q6OIQzfBYFzDunV167enwmGwziKwa+wnattI5PgtWrbZ6ayPcJIWou8JWCsG?=
 =?us-ascii?Q?1YDsMW1SLrE3Pw5knlbbAastsQxkhnB7oA4jFEGTgFFVQiELYyd6r1K0Pbh9?=
 =?us-ascii?Q?r9IGaEWRXq0pdjR/0TPjAdAT1ck0nqZ6VzGPWIC7MnNQUMPAkUXuxYOHQsM7?=
 =?us-ascii?Q?HICls2xSQKUfZFzI4zhL8Z2zzhgTIaX6nFPDTdMCElo0Sl/+LSpIL0Dmkjkt?=
 =?us-ascii?Q?1p1nj3/RhXQAQL+vQFvFwNr2XAVAne612OgT9AbhpDRe4Nk8RVRkq/JkNkJt?=
 =?us-ascii?Q?qoiCrnVOcVI4JfhOVLXgFY/N9UQV9Z+lSJEYcUuyFXhZByBZpor1iwVXbn/v?=
 =?us-ascii?Q?uchQyKOOythJyFrs6NJ0eb+p33ALJ4CpRzaUBG4qsiCRIoA/oH/t+FzjXFb+?=
 =?us-ascii?Q?B3T1GCVugtYkU9EKGhG+Q9cDBB2y8HYbwA9jWjJSfpwq3fBOfxf+BDX0IG+E?=
 =?us-ascii?Q?3VKewE6jJirZSg8/ZLLYsKDTSmhkZvcRLuSFXE5CRrbonVDmrSEa60owPG/S?=
 =?us-ascii?Q?zXxgud6VVMv9Vg0hxuVBcrXkHCmtOJiicnZ7qqt7TJ7ZvzFmzYEz04wnNvbf?=
 =?us-ascii?Q?kCfnR8jziuFDlh8gintaqWLeXTz0gDE+bvwNU763GwGypQY76RF9ce2jDe9M?=
 =?us-ascii?Q?GfnzTbAwYIh1YpktgSat30oQkI9itZGlTvSyD9/Q/UKinEAZnZ3d4dT9K+Jl?=
 =?us-ascii?Q?7MAqnf8v/kDXCbWUwGAmetCm4kWWpOa62+nkdB6+R0gjLTt9PUVXX0fcoK5s?=
 =?us-ascii?Q?QGdpEWilv8UM70Nu8NZuoRLB+vDB5rNl47pBZFSIezkGJJHF3du43bV8Kidd?=
 =?us-ascii?Q?jqbfdOE7NxRdOImAuUF+yAZp0uBC7xm7pmNwfhfCAxG7B4fhbR99TlREFHFI?=
 =?us-ascii?Q?/Lk4hXuwomhIaze46S2QTQv9jZeaXcmhROwBOjv3oHnX7Vm36LDQwnFd3d+t?=
 =?us-ascii?Q?kMUlgAGLAUQn9ZM/f7LYcl2iWikXTULoRVmCUZt1igSqGJEMmIIS4OrdErcc?=
 =?us-ascii?Q?1JkpVSQSLkxQtD/6KhPc7Gdd3mmYSfKi1kf4T4ZZUsYna/AKrKhb9cVunFGW?=
 =?us-ascii?Q?3XIuOGz2IPPV1XWYtyl/LtkFpaVyVmHyxBPWuujTQERKQsRoz1kK6xbB/iDC?=
 =?us-ascii?Q?c60M/M14qmrfF+iT4bz4+kwT+m4fPk6n3OOhCLiazZr9W5a9KGJEHq2gDvA3?=
 =?us-ascii?Q?HpjKWyti/ueKvkjRVOIOZFSQ7P8T1tNRb40GhX9j63Hyn7C2PWzHBNNtCDDS?=
 =?us-ascii?Q?tuggaZhawjq/jKFzWaPzcIOEOpbseySO7EMLhnyA/HbwKGPL7WRXoOmPcehr?=
 =?us-ascii?Q?f2t7s+TQO8VZgC3iL0cYRU2bFGDsr7CEc+rcGAJpt8KeUjxAXHxx/ycshQMk?=
 =?us-ascii?Q?R60Q1TpehM/Tl8A1dhG8ZE7JfVYsmZuYazYEyeYo+FvIiibORbJ20VwGz8G0?=
 =?us-ascii?Q?5VhekKVW7b6hpsgpCCQZxTvEC0nuqb1k+WaEPRYlUGIXqBxTUPAmYyeSwYbp?=
 =?us-ascii?Q?ibKTzLlPQSEUnuangobfRc3zBkY39Z+4t3w1deJ0mF6Pvx5+LN+DhJ+eaCTZ?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e85c063-ab47-4599-af4d-08dd78545563
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 17:22:56.3400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcHOyvH0AnGoNBaaUZorgtoQ9rj6gMv3KSrh90wdvOpPvDKegsCVI7SUH8vi4FAOmmPm7AhTuqlVOC6TO7M0XFucgfh3ycjKLFCPn40D1I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8227
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

On Thu, Apr 03, 2025 at 04:26:35PM +0200, Michal Wajdeczko wrote:
>Some of the debugfs files require access to the registers that are
>not accessible to the VFs. Don't expose those files on VF drivers.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>v2: avoid "privileged" word, make it clear it's about VF/PF (Lucas)
>    add hint for developers where to add new files (Lucas)


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_gt_debugfs.c | 30 ++++++++++++++++++++++--------
> 1 file changed, 22 insertions(+), 8 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 2d63a69cbfa3..a88076e9cc7d 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -299,20 +299,20 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
> 	return 0;
> }
>
>-static const struct drm_info_list debugfs_list[] = {
>-	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>+/*
>+ * only for GT debugfs files which can be safely used on the VF as well:
>+ * - without access to the GT privileged registers
>+ * - without access to the PF specific data
>+ */
>+static const struct drm_info_list vf_safe_debugfs_list[] = {
> 	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> 	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
> 	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
> 	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>-	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
> 	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>-	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
> 	{"register-save-restore", .show = xe_gt_debugfs_simple_show, .data = register_save_restore},
> 	{"workarounds", .show = xe_gt_debugfs_simple_show, .data = workarounds},
> 	{"tunings", .show = xe_gt_debugfs_simple_show, .data = tunings},
>-	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>-	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
> 	{"default_lrc_rcs", .show = xe_gt_debugfs_simple_show, .data = rcs_default_lrc},
> 	{"default_lrc_ccs", .show = xe_gt_debugfs_simple_show, .data = ccs_default_lrc},
> 	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>@@ -322,6 +322,15 @@ static const struct drm_info_list debugfs_list[] = {
> 	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> };
>
>+/* everything else should be added here */
>+static const struct drm_info_list pf_only_debugfs_list[] = {
>+	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>+	{"mocs", .show = xe_gt_debugfs_simple_show, .data = mocs},
>+	{"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>+	{"powergate_info", .show = xe_gt_debugfs_simple_show, .data = powergate_info},
>+	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>+};
>+
> void xe_gt_debugfs_register(struct xe_gt *gt)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -345,10 +354,15 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> 	 */
> 	root->d_inode->i_private = gt;
>
>-	drm_debugfs_create_files(debugfs_list,
>-				 ARRAY_SIZE(debugfs_list),
>+	drm_debugfs_create_files(vf_safe_debugfs_list,
>+				 ARRAY_SIZE(vf_safe_debugfs_list),
> 				 root, minor);
>
>+	if (!IS_SRIOV_VF(xe))
>+		drm_debugfs_create_files(pf_only_debugfs_list,
>+					 ARRAY_SIZE(pf_only_debugfs_list),
>+					 root, minor);
>+
> 	xe_uc_debugfs_register(&gt->uc, root);
>
> 	if (IS_SRIOV_PF(xe))
>-- 
>2.47.1
>
