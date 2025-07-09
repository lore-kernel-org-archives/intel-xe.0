Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A652C83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 17:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0F410E34F;
	Wed,  9 Jul 2025 17:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dmCX+7Uk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E8F10E34F
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 17:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752082376; x=1783618376;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Qtdl3aELRcLTF05OBfjYQR5fmZ+KPMF4LFvxaY4y8wQ=;
 b=dmCX+7Uk2Rh7LBo6SFuuy//lrGxCo3F72zrYLzYS/mWZ+5aGZ+PSf4Fo
 QGBJlx7/fyGcArXqzSbHPXs/OowtVUGfdJJ1f9rtbrKAq0f1adms1S9hn
 t7tBRQgMjrjlie+/XApghEEtzE1u/Xnw365O3NhEXrYCFcFvdnWtmGBWT
 XbKLozBRDKfUYICuRFT5PhfAxGjZ14AsRs+kDkDdY71PT/edvfJJp0G3i
 deDBUkQLgYSavymY3BJNa1bD59znln+6pmshYki82vpNby9WSzcwoEDsL
 qh1+d6Pm/2dulFy6aHZylZkh4Iji5ljo7Y0+V/caufffLkT0aLfgNHHfo Q==;
X-CSE-ConnectionGUID: eXdP0Zk/SO2VMwts6UhQ6g==
X-CSE-MsgGUID: 4QYbo/JMSMS3GUvtPpBHAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="58118894"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="58118894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:32:51 -0700
X-CSE-ConnectionGUID: A3yBO5xHR0OeXLiqmjXgnw==
X-CSE-MsgGUID: Sb2yJouASny9BPue674hSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="160097277"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 10:32:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:32:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 10:32:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 10:32:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdcNvXG5ooJqDgQVe/PyEwxKGhltnB4Zkw4nXamaqpFzcXp78fwtV0qui6gEv+3yzqAIpzajkc+dV2aQBK23j1FToBXfMvpB7VapfWkAN69Oxg4ahwf6q939nJlgC7V9eZE3glOVf7IhZmDhIrsMf0zBmtDpFj4T78E3oOoYUWrm1+T0xBIrmsaG7EqDYxhlLGX8xkqKul+11FrLTZtSxDKBWYdv56t3JA7Z9nvtweNZsGHojZtQQj/b17z4sqLHWyqkoJ7rDGujLBEPUzC6nltWOVcYZwc2M1tZ9g6vzY+C6qkBKlQrPNH7E6jlGtYSGuZ/pMXAdOHlHmDVgRBhhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0G1acCo4GbBZ8HLqQxRVVjK6Z8L0CwlatNJJRDCDJU=;
 b=rof4K3ne4Fd1Dm1ASEUG8UdcPzUR6rUg+WYTo4j+zW9bH4k3qgRY2QdMG5V+zRpVi82R6w98lXaxfklts69aNe+kjNtUTRtQvgYRlV0+3Y1rZlAK9kuuLucyxWoUQig7APhiUEFN0XH2r2LR35zQsUfnb//MqSt1KJZDXjiupFPuO9+XPBHOrqRn+9N78jhPHxYuZM6XAhiW34xof1Dvk8Q30dArzMUpnyPS81P4yiFz6ezk2nNX6YmJkUp0zru+Hm+rY9ukGUtRjOxuJefs3j1HIbKp5ETzoDZCqIZpf0DZiic9JehLCI9tC7e5vbPfY5ZBD9mhUSz8X5+mbR4jXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 9 Jul
 2025 17:32:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 17:32:39 +0000
Date: Wed, 9 Jul 2025 10:34:23 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v10 4/5] drm/xe: Split xe_migrate allocation from
 initialization
Message-ID: <aG6oH8hndkTtNtSp@lstrano-desk.jf.intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
 <20250709121543.4129807-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709121543.4129807-5-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MW4PR03CA0174.namprd03.prod.outlook.com
 (2603:10b6:303:8d::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: c0379cad-ea32-48a3-401c-08ddbf0e9a16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ZqIvnW7RB3eqyeOfszZDNdeBTCNbQyhNzm9KaY+FDjhyPTa3qZsr385SWQ?=
 =?iso-8859-1?Q?JcET4leTvx4+DQ3HoLQSfjyKIDE/NluwFpCAXZBi3NZdJ97j3Z0iZzrodV?=
 =?iso-8859-1?Q?2Y6Jhb7zJms0xXEQabTHCbLr7XE345TCFlNqCc3qxB3k8tEjgQKScl+k7U?=
 =?iso-8859-1?Q?n0HbYFTAmqxuB7JwCF1LZh8oWAP8Ut/22Vk8HcQ55aKev4hYyxEARxNu7M?=
 =?iso-8859-1?Q?Etdo4gsUBmPEikeL4yy7Hh9UpaqOaj/u6qFH0r7Xxo/4d3vrlg0y08MSbj?=
 =?iso-8859-1?Q?MrnjkAydGyssGBTR7gBHmNgwipiFKjN2OKfVMZDJzK8xLjht3IKsPwnoJC?=
 =?iso-8859-1?Q?X5jnNrYElv/c6fo5ucoKz5NIoCGL0aUBXRZlTtJJi1Zzbc4hqFUOLfH4oO?=
 =?iso-8859-1?Q?DkKbi2vr9RcIeuKcExNbNc76eSm66XAXe5vnpgkY81A176xXEnuk7NbQB7?=
 =?iso-8859-1?Q?4xz0Gtqp9sijxBQaCSlJwSSCRKDe9oOvXK7C7oNfQA4xkoyNHCdnka+cvu?=
 =?iso-8859-1?Q?XiU19Qj41lzfTyaTPiGZRcQPYqHdLPfcvNsRXGJCViZXnPozRSpKN1PvUR?=
 =?iso-8859-1?Q?7peIs8hN0nEi8LXzHdElIYNTcRvzLrcAxy/WSc0XQJMSuWXTxYupabfFjC?=
 =?iso-8859-1?Q?pMme6YO/sLuwLsK2o/BxGMCrYKnwXEvK2WR1Tm9h91WaJE00LHR5xl2PVe?=
 =?iso-8859-1?Q?Ey9zm9ILg0kpRfNdRqWOPxXVvBSUN3V8GhOlqrQAD7deVUmgbC8qWNUoFR?=
 =?iso-8859-1?Q?3BeLUDXZvnwiDe8JSFgSfzEeqoym4k0nTIQkfEYquskjGBUQRlJG/7qSEg?=
 =?iso-8859-1?Q?L9fxP2kNPpLs/5p2RyfvgVmFVisku+33anZ35X1gHw/2ZK1yDI8MDgslgv?=
 =?iso-8859-1?Q?/jKC7gCB7IoaHjlRhpyijZ2k1Dvhgz6MeAI5FBYrVZ2z50XHDBPiP7dRvM?=
 =?iso-8859-1?Q?ddC/MR6BF4HNgL39V3woo91RelNsO5sG8tZEClY4ThNJXL3HLC9gIGYjqu?=
 =?iso-8859-1?Q?5AorDWlT0Tvh4LQyuWa5rjSLNgDgOZ4XcaoOwSpPTlpaoq3WM5Xq11cnqw?=
 =?iso-8859-1?Q?DY+SyoIa3UUxuz6jn8Ff5c86lO0nTtxiAhcxIksfbHnvH9ZOfW5bBaHXkQ?=
 =?iso-8859-1?Q?7wK/yD7IVdctHepZxRRagN4nUKPvpzC3Y7ntv+BgVP5+RGPaoziehJB4g3?=
 =?iso-8859-1?Q?ErlCcRVH07As/K6SoVu1NErU2jNeoHNQ/MX9zDAJw7W/7TGXpCny4DTH6J?=
 =?iso-8859-1?Q?pnVqBsWTA5geSsTUFny4ah+yGFzWno/ghp2e1NYBm05aZ2zk4eMsiT8pgw?=
 =?iso-8859-1?Q?oMrwAHGMyHVonFDIDSwuxPqoiZm+jztRXY461ZMgyB5jCa7IRYrfd25GhN?=
 =?iso-8859-1?Q?1n8fNpLoPMGtSHnx9eCHmTzevtV/K5r4KByAShOQzOMY4sVvmPwaiyb59U?=
 =?iso-8859-1?Q?+HRxfUTmScas23XE/DnhzMy1no8MVtaVfQMJr6NdUfm5NlUA8OzUCFJZQA?=
 =?iso-8859-1?Q?0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xVjZofnMsWzqfHReXyLyZ0B2JWKtLlBIdyZM9uGG/+FOmoBsGnH/FsmQVQ?=
 =?iso-8859-1?Q?hrKGk4DYa7Qqxf0MJF89BGs8+i5f6TFqTWbwXk1nYUrUylxm6hQ0aRb9Lr?=
 =?iso-8859-1?Q?g8DJhUNFlfhGG3+cNa6fUS/dww3GkUp1sdvh/UTRo+1YmBkQzTaMCuSbVB?=
 =?iso-8859-1?Q?LjSGitufVN0wZnc/6kLEoXAyoqrKUFxQh1drX12+ZXkmmeLXQpKLitCQFi?=
 =?iso-8859-1?Q?tqJHmKEsvN0hJgQSLMQu1w7ijOyFXXpDQk2qBevhHSFQ6kAPeXYsatJx5c?=
 =?iso-8859-1?Q?KpHGKloSFOTlb1x6t9XMH7l8GeN6eXfO24HDEDZkRgOLtNSJfcIIhGmxRM?=
 =?iso-8859-1?Q?HCY02Yvz8nf+wMxpL/3+GS8kQ4P6lh+V+xK0XxeU+5kCh9C48N1sr+xDIv?=
 =?iso-8859-1?Q?AXS+Ur0GKNQ7ideAKT5eCYC9q0UlSlhHwlagRAMuiV69vOuMLdto3agAse?=
 =?iso-8859-1?Q?A54X7o9D/ypK0UEAGeid15ZhlNfPX/fkPK4+90+JBwURDdERalKuV27HRw?=
 =?iso-8859-1?Q?Omfai9bWumIrolKTAlB8mJtDVpt0z5l9eHt4Nxz5qnERXuAwq9hH0CoXsg?=
 =?iso-8859-1?Q?W9evwpBtjCn1NthdG8ycisOjJvPYFyqIx/D6IT8hoAk3BZWvnEbLmXXdTU?=
 =?iso-8859-1?Q?Zh84yjlQBEwMh5lmpJsrH+0SvZ1rA9mrdysXSHwjD9GXIpfP8iNM7gYAuj?=
 =?iso-8859-1?Q?28CMCO6EzB/loWwKeoDJAkS+8dtcufR5WBP7autD+Qu2naZmBTgvqsuoas?=
 =?iso-8859-1?Q?R/+dXv4wq7z+I36QZ/jAMAtjohT06iQS3KisHKdHG5AqqItBJ+5zIIsJXe?=
 =?iso-8859-1?Q?uMZBQG7cynWPvTjecyX60hBOz6Uc6bvvBWZUr1a2j4IGB0w6JxrM9WuGaR?=
 =?iso-8859-1?Q?iy5CjyXWQoe8DlASThbK7I237jzighunNBw8FklQay0w/gFwlD1xCI+Lng?=
 =?iso-8859-1?Q?Ui8BIsYM4+0oOk98inxVXURt040h3UHAlq/U33YssU3rduGQ0y+oYd5IiO?=
 =?iso-8859-1?Q?KxQuhlmtgKmEQY3LTZVM8PpFykNuwiw/xY+zXtRxQTtuSeSZCSW0ZeDE+a?=
 =?iso-8859-1?Q?OISodzOtsOuO/0Fz6DpH2QQQojM6IXGgnhLLXbAeZjXDghSX0NXrWiYeNG?=
 =?iso-8859-1?Q?20jQffAlgxLbEu3q4rwZJ6JtEaedFzVZkBErMG0+V6WgaTavdkYtjlFjMD?=
 =?iso-8859-1?Q?MW718w6EpU+oc4Bt0jJ6keKZtAxwVVNfGDth/Zo2gg5ls+P3eqFmqAvKXd?=
 =?iso-8859-1?Q?ZxtyJtYw4ztON6v3XoR7WugzNE/BJzd0Yae6t1OYekegHn2HJuztwgkg2d?=
 =?iso-8859-1?Q?+MjsDcKu8h7LHBFVPpCv5cNLK7XjxOzVh33ILRPCJKCcd1xSNnwtlPxPQd?=
 =?iso-8859-1?Q?Wyv9hW4CzJmudbZ6u117yPI5+Lj56OKeY8cgZ7ivQJP2YW1gM1PX9KnJMr?=
 =?iso-8859-1?Q?EZ2g7tbH2Ao9325ZcoJdo0EGGtjzj9gy6cIQz+DOLHPVAmt6WzzUjvtzrG?=
 =?iso-8859-1?Q?LRx9itVrNrgjxIfVe5CpV7AF89ayimAIvprC6YQLN3IQ4+gbXz0zjMsbr+?=
 =?iso-8859-1?Q?yKuAdLrAPEBhLMJFnvx6lIBRyF/djD1U09+jYNAJea/DbZmatCDtpzpL2t?=
 =?iso-8859-1?Q?7nU/F2xqqvklj7baVgxQqLw9niMJEF7t4KTjUDgmvAFXMC8sW8nj4qmA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0379cad-ea32-48a3-401c-08ddbf0e9a16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 17:32:39.3948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gGOT7PI59MBZ0myzT2u+3qPjDlC4U6bASNgcySF1XUkXUo5Bffd2BJextyA4fYjR5HNePAE+kfas1vlifwXPtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
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

On Wed, Jul 09, 2025 at 02:15:42PM +0200, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> Currently xe_migrate allocation and initialization are combined in
> xe_migrate_init(). This creates a problem because the migration
> context cannot be passed to other objects before.
> Let's separate allocation and initialization so that we can pass
> the migration object pointer to other structures before initialization.
> 
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 25 ++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_migrate.h |  1 +
>  drivers/gpu/drm/xe/xe_tile.c    |  4 ++++
>  3 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6272e2bb0482..8ba62c5a39a9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -389,6 +389,23 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
>  	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
>  }
>  
> +/**
> + * xe_migrate_alloc - Allocate a migrate struct for a given &xe_tile
> + * @tile: &xe_tile
> + *
> + * Allocates a &xe_migrate for a given tile.
> + *
> + * Return: &xe_migrate on success, or NULL when out of memory.
> + */
> +struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
> +{
> +	struct xe_migrate *migrate = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*migrate),
> +						  GFP_KERNEL);
> +	if (migrate)
> +		migrate->tile = tile;
> +	return migrate;
> +}
> +
>  /**
>   * xe_migrate_init() - Initialize a migrate context
>   * @tile: Back-pointer to the tile we're initializing for.
> @@ -399,16 +416,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
>  	struct xe_gt *primary_gt = tile->primary_gt;
> -	struct xe_migrate *m;
> +	struct xe_migrate *m = tile->migrate;
>  	struct xe_vm *vm;
>  	int err;
>  
> -	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
> -	if (!m)
> -		return ERR_PTR(-ENOMEM);
> -
> -	m->tile = tile;
> -
>  	/* Special layout, prepared below.. */
>  	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
>  			  XE_VM_FLAG_SET_TILE_ID(tile));
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..74c60f55004a 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -93,6 +93,7 @@ struct xe_migrate_pt_update {
>  	u8 tile_id;
>  };
>  
> +struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
>  struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
>  
>  struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index bd2ff91a7d1c..171de6a4ba95 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -94,6 +94,10 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  	if (!tile->mem.ggtt)
>  		return -ENOMEM;
>  
> +	tile->migrate = xe_migrate_alloc(tile);
> +	if (!tile->migrate)
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>  
> -- 
> 2.34.1
> 
