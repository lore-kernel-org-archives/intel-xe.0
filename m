Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70614C38150
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 06:33:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB1E10E67E;
	Wed, 10 Jul 2024 06:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FEfDX8Xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A70CE10E67E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 06:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720593184; x=1752129184;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LY0EpKl/1lH0R9z53m34j1TwtZ9dCAI/Uv91etI9tbU=;
 b=FEfDX8XeHKL77j8g0lBe3hxaSKtSNHzmU8gjTyIyV9R8YjXB7xNp3BbY
 zp3pQTzmZI6uqb0pSE5l3B05LU4gJObCbuBluSjfYRpDbfclLXo6bmII8
 VWly50jz2xwZuUfVTaWDymHBiaU1mURhVzJrQmzNlO9Z/Z7qb+heNcxSQ
 4KvUhAYEElMzWby5MyuNbFkMYQ4t3VmhnbSVBVOy5zMB5eZ6ZFg1UXYJo
 6qJ1Df1BBEZHG+Rgeyqwglqp3Y2QTNLpFCWyEWVbFGUTLw6J9/Kz3WCKv
 yoO9l3+EYGjHUbje8KbgE6s9c6KMyt0tVOmabBRXMZc4fjf7tKxiBoLcP g==;
X-CSE-ConnectionGUID: jzh5WnNpQ827X76yEdNfDA==
X-CSE-MsgGUID: fcJpq24MRe+XakWXDr//FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17711347"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="17711347"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 23:33:04 -0700
X-CSE-ConnectionGUID: MtiDjl3HQ0yUHSoGb30XMg==
X-CSE-MsgGUID: yzGOaUMHSaaILuh5pdoLlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; d="scan'208";a="47878322"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 23:33:04 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 23:33:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 23:33:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 23:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJcOnrjoQdV+7q46+t1AeImz9V4WBlQ7sUNElMYuQSo1wgIZQe1WVb0cP9liSIKCxknQrmALbJKbKaUIdoOmHsBFLYnN6wjdNEzkwMMpm5LbHDiVO0RzvEkh/DnkfWNyjXShiPbfk9ME9pcFfgW5GD0yLQrYTCnpajlkXozUEIKomHjoYuGcnkSpkWmSqxIgTX/fzQtMrJaUyC55X53ZB+PwmHKZ5/eZJxq/tPTYkNL/kTL2wcP3/Sb1jFYi/QFUI0D2QtGIkfk3Tq7J3v3TJiVwc/Jw0KKI1JRM6DY8l9gif/uK7pSf/ysdna8iW8Egf9R1CfsICiGJqr/Sag8DoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKKXYmrjmO6gS3b4q2SqPmZPD0S7cjiiaxFum/Ko538=;
 b=nNCrofDfcjjI+JagYxKY/4UHr8x2Cl13o75jbn3DA6vIi9Au8DeIWOX8Eso1xUObLMN12m94QANkv0ZjuVV+llE1BkWKaf6p4rB/jeENcVqLPrhGrvINRSZmmHft5eSNA9uDaGMYwHuKopOWU90OLcXwFJhAPy9KxdfxkrfF1WYzMKYVlPFRIMz8lObe++T2/WVjSSJhiHU5muvz1WJzRIE8JvUUbjS1hgMuIuP+HeLSIOpEfDtPBQWXG+Zo7PwkMhRmVkjePytq9CvOXplHdD8FnaYGU6+6RXI0PGvqSh73g2U0SLvkG7ZZlatggfiHlDj/9qURPGjKthaHLaYjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ2PR11MB8516.namprd11.prod.outlook.com (2603:10b6:a03:56c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 06:33:01 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::ffd7:2656:a8c4:43b0%4]) with mapi id 15.20.7741.017; Wed, 10 Jul 2024
 06:33:01 +0000
Date: Tue, 9 Jul 2024 23:32:59 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Dani Liberman <dliberman@habana.ai>
CC: <intel-xe@lists.freedesktop.org>, <illevi@habana.ai>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 6/8] drm/xe: move memirq out of vf
Message-ID: <Zo4rG5p7kzw0dpDt@nvishwa1-DESK>
References: <20240627124043.2923586-1-dliberman@habana.ai>
 <20240627124043.2923586-7-dliberman@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240627124043.2923586-7-dliberman@habana.ai>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ2PR11MB8516:EE_
X-MS-Office365-Filtering-Correlation-Id: aa83326d-fac2-4179-5ec0-08dca0aa2599
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jOxAOKYtFJMxlZu5vbtYO12psyKAGAx/bVUyK6dLF8Q8LtDU/5KJfbM9DJrH?=
 =?us-ascii?Q?RrZhfYAtJV1CmfGApigWwS9huIkd2B0vDD1QWO2KdV4kQUan5LCyAbpu/BbD?=
 =?us-ascii?Q?95VM4TohPLQ8H7vH+bRLI2tb/Dlh1REdw0ofs/80h67Cd9yGkFGKt7Gnrfzv?=
 =?us-ascii?Q?PbIA51cSy9swfgyP4Ti3szOPcXyoX+jwC5mA6HjgZgLJAC4pY9jM4pDcm7I4?=
 =?us-ascii?Q?L0KAplRWmsYFNwJmkNHmSzR1WQPhqo/g69lrS99wl/ycSLzzkZ8skXjG9Rei?=
 =?us-ascii?Q?sBSZ8TXGAaG4Lb0T7e5rDegegwsPrtzFo8Gd30ZlR4qhZ1zpQLorVPJTbGxV?=
 =?us-ascii?Q?RAXdpkFJO89Tu68L9qV9EczetdhieDo666DtVAP73/LS9mjqGEINl32kJkEO?=
 =?us-ascii?Q?eXwc/TxyfBb4l3sll436DtTyOnUnppvAZ/Yf7vCPX5/KmccB2UT9yBTWvCLc?=
 =?us-ascii?Q?s+IEiutYboZ20q1B6I/SWjeK9g+WL/YDMNRjGqDtFFa7qQnGYZ8teERNE3WD?=
 =?us-ascii?Q?p9OuQCeeTyXWmfyra6Ua7SJ15dlqZ/hIomenvIVGcWYyQnjQo+O3vT5I7tYU?=
 =?us-ascii?Q?DwY4G0zdoh0nc3MmenhfM5+8DlA2St6RwUlHmao3r48TGpvaDP873V53oxgN?=
 =?us-ascii?Q?46JdlY+F8i48uloDXHcOT3WJ9bZvu/NkHXilnbXi8D07zcTOs2xEh7/4h3+d?=
 =?us-ascii?Q?bP4x0Ze46sI/F7192qrDgrUjcYzR2xGk7fW4aCuEHvThJphOXUNk8TfL0uhu?=
 =?us-ascii?Q?BxKCOl4Gipr1lbXfMKBKKIlY+J4Db4VajmMSfY2dhtXST+Fpw5OP/rpEqfaT?=
 =?us-ascii?Q?tTQFPXi/gf5KPVCrzdq9g0YGqGiMT6IL6kH1lxk+xqvFCLBE4nBGE1QgcQBo?=
 =?us-ascii?Q?422NXXkgBFTFSnRVyrUCM+AobkEua4+g8VhmWMsAm1EYIGp2p2Aiy19fpgAf?=
 =?us-ascii?Q?pJubbaFZeOI9L6XfDJbRjRguWEBPcqRwFYz00Z3tsLLSnf2oiO/NJGJ3HU3u?=
 =?us-ascii?Q?DfN8EFDVxs9Xoedp2/M47zoygQBbQywZ/qEEuL+tt+haW8NYH2RR/eCMXYrR?=
 =?us-ascii?Q?wJb/+GafhVgrHq4c8kDgxR3q1aq12hl+jMkoHd9ue4bbQQ7pj7no406pkwr+?=
 =?us-ascii?Q?+IaQUVEAqcqlDLJvzGf1ZooN43JxxFzHiNo1v35lwt12cFkmbV0FUcdAVcYr?=
 =?us-ascii?Q?VMOifo5tvnmLgCsvvrul3kiIvkmq4iiNheBBXH3EFqyP4BLfOg54+tajZf4+?=
 =?us-ascii?Q?sk/no6cX+lIRMq3pxRbOzRXtRPDD71wju9ioYoLrqU6awQAj7OssrZERr+be?=
 =?us-ascii?Q?ksoIt2GMa/R6CiCy3Lv2h09f6DpN0runnsmMVcfomMunQg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KO9yCg/4tvlGQ4kgVmvvWhI+bK4WFGw00sds1VcEnxxUOxrKpLifYVvTfLnc?=
 =?us-ascii?Q?/GiekM+O+htHyeva/15ckuTYPlWihx7P5rEK3UofrZwiXqTm7KkSHoUEMyy0?=
 =?us-ascii?Q?yLuUPTpGz3aBWbQ8og8C2jPHgyajaexRgA1AV8nETWzm7wGgvHthJIqd8bzv?=
 =?us-ascii?Q?l+i/+lm4dC4XzOL8dxhBebn+mLqIGeltDFyhe2W8w+o6QMBSyY1U0v1MeYuE?=
 =?us-ascii?Q?PfDdPoYa452Qyry4G0NIgsy08Pv2W8NHLHyymMVGN3jO13qD+5RIY9xXwIWK?=
 =?us-ascii?Q?/31t/IJRQQfRLHCgdrAY26sqrpBVEQbUo8R3HZFXK+Mj0ebAhdPYd6ViInHe?=
 =?us-ascii?Q?Mocgh0EBEfZj74y4GvFRvG363pSIu+AJLxubLpMROjGZcMYl2BF2JjRBCtQb?=
 =?us-ascii?Q?fBxra5tYLivEZVrRiNU6PE27hG2ymRoB47pX58q44wfE3gWoHhAjwJfC10VZ?=
 =?us-ascii?Q?oL6FmP252qFoZCZIAvOjAPjNoGeqyEGrJ0B0oMoqbRcQeUARyaCkBfI8px7m?=
 =?us-ascii?Q?vDN0nhrZ2lAA2u+IjTyOHN2llDooIICEpyJ/u7qYVccvVwyUyIUNyKTHnP+L?=
 =?us-ascii?Q?4n8iefuPf1R2dNIAZeZwcZCxAAeq2ScCAqy1IUowQoiXP8RYkc5MGD95cHzT?=
 =?us-ascii?Q?3mZ4nENCwVR/nb+wguS4GTHXLFxs7Cjdn5tgJYWx3Vdhyul7DfwZmF0HiQsn?=
 =?us-ascii?Q?03319zMOYHFLVYhA389uxU6xJi4jR4CW4HTX6+rBiJPBzm+Zv3uBaTjlY80z?=
 =?us-ascii?Q?+SKoIR+4T8HXMjdntrW5AoTrWDvcTSNfI3rqSlFhpUtwPOpmRZqQBa0iCAFZ?=
 =?us-ascii?Q?Rpr8FKSyPtp8lCjF1EO+qVZ+BBBymPJMQVSrn+pOIzMAiM6o3qKwnItnrDU1?=
 =?us-ascii?Q?juBPk/u+QF9mlyxGhhFADC+kZthrbhToAMWo+WycIu9uxZYxkVqXYpBtvPCz?=
 =?us-ascii?Q?a6pzXIzPk3HehnveEE4Iuwpv7n8HaehOa6SsZMyO1wSGHEm57HqKzEcP/XcT?=
 =?us-ascii?Q?yrJUgi8LbQ5sBS9VtXeeTqLs7YzyQxrepjsAKmwsM0xE9rUI5qT3NYDI01Fw?=
 =?us-ascii?Q?GjKdzERQbGyT/u2nxFFFeRyzEnVkajde7+305VHzhgrNR/eiL3k1w/fJv9F3?=
 =?us-ascii?Q?A9Y21SinMU6H8DLbDhRKSxj+Zzf1AhALA8e+OJGwGkrnaZOgynwgUqOadM+Z?=
 =?us-ascii?Q?3Cicu/naYRDHNvc0/RswE1HpOf6NZ3k3akbs0pDfo0NTIimm0xwJVeZzLa/M?=
 =?us-ascii?Q?D6i8D87YIugcZSYHxvkvO2nuLZn+jjmzVMmcvUoQWeRpqzgabHyVFIEO0sPl?=
 =?us-ascii?Q?NA3dNbipzIYMmAftjZrjtLa+Pmvky2QdobVZNPkSarTEIDz43+jD4Tbmpcqn?=
 =?us-ascii?Q?i88ceJRdpCf9ww4sNpqTitTwOzEEL36lfNTl87ZmdDhqIKtkSxTZi1QOujmW?=
 =?us-ascii?Q?7vf3eqeC4s5FL+0cmqy8kjDuK3zF1HVLYDUpJ2pTtVXGv1EDEpbDybSoaU32?=
 =?us-ascii?Q?YjtJyJ2HmXYL/B2ONzn6Jh9iXjW9ZhY7cZMtMBv9//UhYT4bqQ/hWsHBgAff?=
 =?us-ascii?Q?viVdJHuDOnKuga0s2j+SlrDxLNfLhjggnz/IC+VtFpFLdcDs0r43IIYjYheZ?=
 =?us-ascii?Q?/dALrw058wHBT0x3b/bPTcY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa83326d-fac2-4179-5ec0-08dca0aa2599
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 06:33:01.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0CI1oSvtQULzjMfnrrAEtYhFGTwGv/1It5zfVGz3ByBfQ+qhZcC5ckhTyzZ242AFtQrL1ntn/jAdbGYFo3j6IEygnfCRd+unODQZY3I7tynKOC+yu+cbojcz44hBzdT9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8516
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

On Thu, Jun 27, 2024 at 03:40:41PM +0300, Dani Liberman wrote:
>From: Ilia Levi <illevi@habana.ai>
>
>Up until now only VF used Memory Based Interrupts (memirq).
>Moving it out of VF to cater for other usages.
>
>Signed-off-by: Ilia Levi <illevi@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device.c       |  2 +-
> drivers/gpu/drm/xe/xe_device_types.h |  6 ++--
> drivers/gpu/drm/xe/xe_guc.c          |  2 +-
> drivers/gpu/drm/xe/xe_irq.c          |  6 ++--
> drivers/gpu/drm/xe/xe_lrc.c          |  2 +-
> drivers/gpu/drm/xe/xe_memirq.c       | 46 ++++++++++------------------
> 6 files changed, 26 insertions(+), 38 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index cfda7cb5df2c..e4c7ecefa33d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -605,7 +605,7 @@ int xe_device_probe(struct xe_device *xe)
> 		if (err)
> 			return err;
> 		if (IS_SRIOV_VF(xe)) {
>-			err = xe_memirq_init(&tile->sriov.vf.memirq);
>+			err = xe_memirq_init(&tile->memirq);
> 			if (err)
> 				return err;
> 		}
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 0d772f8d4b40..377e17a653fd 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -195,14 +195,14 @@ struct xe_tile {
> 			struct xe_lmtt lmtt;
> 		} pf;
> 		struct {
>-			/** @sriov.vf.memirq: Memory Based Interrupts. */
>-			struct xe_memirq memirq;
>-
> 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> 			struct drm_mm_node ggtt_balloon[2];
> 		} vf;
> 	} sriov;
>
>+	/** @memirq: Memory Based Interrupts. */
>+	struct xe_memirq memirq;
>+
> 	/** @migrate: Migration helper for vram blits and clearing */
> 	struct xe_migrate *migrate;
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index eb655cee19f7..5ffede3eb268 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -863,7 +863,7 @@ int xe_guc_enable_communication(struct xe_guc *guc)
> 		struct xe_gt *gt = guc_to_gt(guc);
> 		struct xe_tile *tile = gt_to_tile(gt);
>
>-		err = xe_memirq_init_guc(&tile->sriov.vf.memirq, guc);
>+		err = xe_memirq_init_guc(&tile->memirq, guc);
> 		if (err)
> 			return err;
> 	} else {
>diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>index cf4f523b7fae..3fdd297516ab 100644
>--- a/drivers/gpu/drm/xe/xe_irq.c
>+++ b/drivers/gpu/drm/xe/xe_irq.c
>@@ -568,7 +568,7 @@ static void vf_irq_reset(struct xe_device *xe)
>
> 	for_each_tile(tile, xe, id) {
> 		if (xe_device_has_memirq(xe))
>-			xe_memirq_reset(&tile->sriov.vf.memirq);
>+			xe_memirq_reset(&tile->memirq);
> 		else
> 			gt_irq_reset(tile);
> 	}
>@@ -611,7 +611,7 @@ static void vf_irq_postinstall(struct xe_device *xe)
>
> 	for_each_tile(tile, xe, id)
> 		if (xe_device_has_memirq(xe))
>-			xe_memirq_postinstall(&tile->sriov.vf.memirq);
>+			xe_memirq_postinstall(&tile->memirq);
>
> 	if (GRAPHICS_VERx100(xe) < 1210)
> 		xelp_intr_enable(xe, true);
>@@ -654,7 +654,7 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
> 	spin_unlock(&xe->irq.lock);
>
> 	for_each_tile(tile, xe, id)
>-		xe_memirq_handler(&tile->sriov.vf.memirq);
>+		xe_memirq_handler(&tile->memirq);
>

I am bit not clear here. The xe_memirq_handler() still is getting called
only from vf_mem_irq_handler() in this patch series. Shouldn't it be called
for non-vf usecase also now?

> 	return IRQ_HANDLED;
> }
>diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>index 94ff62e1d95e..838609915916 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.c
>+++ b/drivers/gpu/drm/xe/xe_lrc.c
>@@ -596,7 +596,7 @@ static void set_context_control(u32 *regs, struct xe_hw_engine *hwe)
>
> static void set_memory_based_intr(u32 *regs, struct xe_hw_engine *hwe)
> {
>-	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->sriov.vf.memirq;
>+	struct xe_memirq *memirq = &gt_to_tile(hwe->gt)->memirq;
> 	struct xe_device *xe = gt_to_xe(hwe->gt);
>
> 	if (!IS_SRIOV_VF(xe) || !xe_device_has_memirq(xe))
>diff --git a/drivers/gpu/drm/xe/xe_memirq.c b/drivers/gpu/drm/xe/xe_memirq.c
>index 95b6e9d7b7db..0db0726b76f3 100644
>--- a/drivers/gpu/drm/xe/xe_memirq.c
>+++ b/drivers/gpu/drm/xe/xe_memirq.c

Perhaps the DOC section in this file also needs update as this is not
just for VFs anymore?

Niranjana

>@@ -19,15 +19,13 @@
> #include "xe_hw_engine.h"
> #include "xe_map.h"
> #include "xe_memirq.h"
>-#include "xe_sriov.h"
>-#include "xe_sriov_printk.h"
>
> #define memirq_assert(m, condition)	xe_tile_assert(memirq_to_tile(m), condition)
>-#define memirq_debug(m, msg...)		xe_sriov_dbg_verbose(memirq_to_xe(m), "MEMIRQ: " msg)
>+#define memirq_debug(m, msg...)		drm_dbg(&memirq_to_xe(m)->drm, "MEMIRQ: " msg)
>
> static struct xe_tile *memirq_to_tile(struct xe_memirq *memirq)
> {
>-	return container_of(memirq, struct xe_tile, sriov.vf.memirq);
>+	return container_of(memirq, struct xe_tile, memirq);
> }
>
> static struct xe_device *memirq_to_xe(struct xe_memirq *memirq)
>@@ -157,8 +155,8 @@ static int memirq_alloc_pages(struct xe_memirq *memirq)
> 	return drmm_add_action_or_reset(&xe->drm, __release_xe_bo, memirq->bo);
>
> out:
>-	xe_sriov_err(memirq_to_xe(memirq),
>-		     "Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
>+	drm_err(&memirq_to_xe(memirq)->drm,
>+		"Failed to allocate memirq page (%pe)\n", ERR_PTR(err));
> 	return err;
> }
>
>@@ -178,9 +176,7 @@ static void memirq_set_enable(struct xe_memirq *memirq, bool enable)
>  *
>  * These allocations are managed and will be implicitly released on unload.
>  *
>- * Note: This function shall be called only by the VF driver.
>- *
>- * If this function fails then VF driver won't be able to operate correctly.
>+ * If this function fails then the driver won't be able to operate correctly.
>  * If `Memory Based Interrupts`_ are not used this function will return 0.
>  *
>  * Return: 0 on success or a negative error code on failure.
>@@ -190,8 +186,6 @@ int xe_memirq_init(struct xe_memirq *memirq)
> 	struct xe_device *xe = memirq_to_xe(memirq);
> 	int err;
>
>-	memirq_assert(memirq, IS_SRIOV_VF(xe));
>-
> 	if (!xe_device_has_memirq(xe))
> 		return 0;
>
>@@ -209,14 +203,13 @@ int xe_memirq_init(struct xe_memirq *memirq)
>  * xe_memirq_source_ptr - Get GGTT's offset of the `Interrupt Source Report Page`_.
>  * @memirq: the &xe_memirq to query
>  *
>- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
>+ * Shall be called when `Memory Based Interrupts`_ are used
>  * and xe_memirq_init() didn't fail.
>  *
>  * Return: GGTT's offset of the `Interrupt Source Report Page`_.
>  */
> u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
> {
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, memirq->bo);
>
>@@ -227,14 +220,13 @@ u32 xe_memirq_source_ptr(struct xe_memirq *memirq)
>  * xe_memirq_status_ptr - Get GGTT's offset of the `Interrupt Status Report Page`_.
>  * @memirq: the &xe_memirq to query
>  *
>- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
>+ * Shall be called when `Memory Based Interrupts`_ are used
>  * and xe_memirq_init() didn't fail.
>  *
>  * Return: GGTT's offset of the `Interrupt Status Report Page`_.
>  */
> u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
> {
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, memirq->bo);
>
>@@ -245,14 +237,13 @@ u32 xe_memirq_status_ptr(struct xe_memirq *memirq)
>  * xe_memirq_enable_ptr - Get GGTT's offset of the Interrupt Enable Mask.
>  * @memirq: the &xe_memirq to query
>  *
>- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
>+ * Shall be called when `Memory Based Interrupts`_ are used
>  * and xe_memirq_init() didn't fail.
>  *
>  * Return: GGTT's offset of the Interrupt Enable Mask.
>  */
> u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
> {
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, memirq->bo);
>
>@@ -267,7 +258,7 @@ u32 xe_memirq_enable_ptr(struct xe_memirq *memirq)
>  * Register `Interrupt Source Report Page`_ and `Interrupt Status Report Page`_
>  * to be used by the GuC when `Memory Based Interrupts`_ are required.
>  *
>- * Shall be called only on VF driver when `Memory Based Interrupts`_ are used
>+ * Shall be called when `Memory Based Interrupts`_ are used
>  * and xe_memirq_init() didn't fail.
>  *
>  * Return: 0 on success or a negative error code on failure.
>@@ -279,7 +270,6 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
> 	u32 source, status;
> 	int err;
>
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, memirq->bo);
>
>@@ -299,9 +289,9 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
> 	return 0;
>
> failed:
>-	xe_sriov_err(memirq_to_xe(memirq),
>-		     "Failed to setup report pages in %s (%pe)\n",
>-		     guc_name(guc), ERR_PTR(err));
>+	drm_err(&memirq_to_xe(memirq)->drm,
>+		"Failed to setup report pages in %s (%pe)\n",
>+		guc_name(guc), ERR_PTR(err));
> 	return err;
> }
>
>@@ -311,12 +301,11 @@ int xe_memirq_init_guc(struct xe_memirq *memirq, struct xe_guc *guc)
>  *
>  * This is part of the driver IRQ setup flow.
>  *
>- * This function shall only be used by the VF driver on platforms that use
>+ * This function shall only be used on platforms that use
>  * `Memory Based Interrupts`_.
>  */
> void xe_memirq_reset(struct xe_memirq *memirq)
> {
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>
> 	if (memirq->bo)
>@@ -329,12 +318,11 @@ void xe_memirq_reset(struct xe_memirq *memirq)
>  *
>  * This is part of the driver IRQ setup flow.
>  *
>- * This function shall only be used by the VF driver on platforms that use
>+ * This function shall only be used on platforms that use
>  * `Memory Based Interrupts`_.
>  */
> void xe_memirq_postinstall(struct xe_memirq *memirq)
> {
>-	memirq_assert(memirq, IS_SRIOV_VF(memirq_to_xe(memirq)));
> 	memirq_assert(memirq, xe_device_has_memirq(memirq_to_xe(memirq)));
>
> 	if (memirq->bo)
>@@ -349,9 +337,9 @@ static bool memirq_received(struct xe_memirq *memirq, struct iosys_map *vector,
> 	value = iosys_map_rd(vector, offset, u8);
> 	if (value) {
> 		if (value != 0xff)
>-			xe_sriov_err_ratelimited(memirq_to_xe(memirq),
>-						 "Unexpected memirq value %#x from %s at %u\n",
>-						 value, name, offset);
>+			drm_err_ratelimited(&memirq_to_xe(memirq)->drm,
>+					    "Unexpected memirq value %#x from %s at %u\n",
>+					    value, name, offset);
> 		iosys_map_wr(vector, offset, u8, 0x00);
> 	}
>
>-- 
>2.34.1
>
