Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3498606A31D
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 21:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lh4rcImw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DE210E086;
	Wed, 28 Oct 2026 21:19:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331C110E086
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 21:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793222358; x=1824758358;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C0y4Bwp9fuDGQSmyLctaxUxyLMTE7ey+iW5UtOKDtCM=;
 b=lh4rcImw7YDBWZligs/ydk2q5gJxJCrk0TnLYfpLTeRw+hM3lmHdJrXZ
 hsq7GkNrh4xNCwWVReQYERsNUCrKoE8jcsf97ACHfDhzDaurI9TiyXHoW
 eHFnRxHx2b2Y9s757JVekrC1DoLT5mgGJB/7X2k2wSC0flUE+u1Ui5T8W
 ZIE+XiD6OwQakZIx3vCPaAN5BdXqxAbTBw7+8ekKB0xkPJ0iAhNVhflUt
 776c3qiTziYrAY/1fhtVh2cJ7HiMLZk927AkefSmvFNeIgGR/XfjtvPYw
 XlmUlpPu5LNhgnqFB5+L4mE0+Z2M8oiuxgeRE86ZBMMX10evJx1+KnZ27 g==;
X-CSE-ConnectionGUID: NCQfP7miQR+rPnETR8wHiA==
X-CSE-MsgGUID: vlkS0Y2JSoG+rPKVNuA5Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1849693"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1849693"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 14:19:18 -0700
X-CSE-ConnectionGUID: 2pCGmHlWR/WrD+MPJ6npDg==
X-CSE-MsgGUID: 4gIyKStzTHualtfk+1jeLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4814476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 14:19:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 14:19:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 14:19:17 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 14:19:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEGJtdoZqKLvneumR8PRM2KtBn3bEJYnr/yOrOTsmgd1W31KXxdimFw05M+qOXeCylAiYEswlrMU2t2OBwjpfWlIFeCKrsAty1qodG5vw16BbQ76hqNQqDZAm687B2JG7LJ13qDUO4lsybJ4Ng9984x0mzNGVYvjvsE8mYcRmA1KWCWyX5iucHAMcLBmRnBctXJqZUa6zWx36XhEpFSgEm2qUBpktpEblI7e+jPLIE4j5pTuzQDTbAQBL1dTS4KG/SKEl3NN9huKrbw6+mvFPTSDD1d62ydu60u9jXP4gEh+SGFXKs7BqlOYiGYApipG1RRGeUS0Qe+z2yZAGNadiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccBIgRoiVHH1MkhuJvthBeAozYcyyxIy2X8q0dOA9SI=;
 b=U2dMaWCL0p9d/TuGwIXuY05PjXr5GV6qlich1HUif4z4nxsxZRay0qJQUqPJUoD9DBI8c3s2oDThN2zD7/pYFeJAKNNMHw/e1JwMFGPa0exc2g3uMl2h5BxA8OR2/V1/byVfXr3gd4xvQQDOwZWHALHJYKDgxHT+C3O+6KkJxVL2cksU7pvXnZOGAcw/dWLykL4ZcA6Jq/rs1oxhXetidjegD4+PIH5LL1rPoJ46Hj/ShC7kOaxbmPI825x/+3PQuL4u5FZnVtthBsOsOK/ghciFhRkxoMDvP0viKngrcOnhHVZBAbGb4xMFwtQxzardpGWJagPOGzKKxQ0p/9kbGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB9660.namprd11.prod.outlook.com (2603:10b6:806:4df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 21:19:14 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%6]) with mapi id 15.21.0546.012; Wed, 28 Oct 2026
 21:19:14 +0000
Date: Wed, 28 Oct 2026 14:19:12 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniel Charles <daniel.charles@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Fei Yang <fei.yang@intel.com>
Subject: Re: [PATCH v3] drm/xe/cri: Set downstream access to L3 class 3 and
 write-back
Message-ID: <20261028211912.GC6078@mdroper-desk1>
References: <20261021002051.1784161-1-daniel.charles@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261021002051.1784161-1-daniel.charles@intel.com>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: a84830b2-30d3-4d4d-2f09-08df35391dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|261022113327099003|261028144727099003|260925022911599003|260925021911599003|260925021311599003|11063799006|5023799004|56012099006|261009223027099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: wAO5COIczpio4KxZWD3uARNFsd1yONrKgxDFzU3e3SJ6lwiVzkzWMeKlBlTIKnWeGs5Q1lCmbVIecOJ0KQQ/w40mlwyp/Kx+RsxLJ0LP9O9J8Utflnc077frcqym8IirfKCWzSyz/BYDyai4impq72zbi//xesM2ayQUcMNbqDB+Ze2P4qMCd+vp0bQdMrgvOVragkiqbi/KC0ShkN/tDsrbFHCY1XBcyXkbzE/BuAx2CmqBukFXnorB2u3WVYtaeX4zjxrdH2Pn/sDIRIo/g6YVH1+9Qrv2MDi0FqOuIyViZS0FccA5zVjJPMWvITXkuWqumOPwx647yYjM4EFitpNtbk6Caf6Qm+S67UROsfWHfZc0Az7qobLlbIDZJbM9JxbsoARcQBrdwcOcYAOUvh8k+s9jGkGiGk0rR6jtRb60lNJs8hY3XMmc3g/D1M+iPd5xlv+u+gxizW4vMQ1m9ARctQQ7JotYAMcWa0N5KE593A5jChOfZir3UEMOGusy8y7wuPI5d2TdSe1CgAyclp/wo/Ht7SPcz7A1FzHtuu8J2PicFMAPrAkf9NMwgEbrBkW49TJVIK/QwCOOiI+RBY9vfugROKeGd2zsBSCidNjvB4pK+wkJflooOyLLlk2HRuNMGttdNkdnlwgBqm+9rSNMUQdop+iTHCV5sXvrkMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261022113327099003)(261028144727099003)(260925022911599003)(260925021911599003)(260925021311599003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vgMFY1I2KHL8GEULidbLCSzQFEPvh6aq9p5SB99Bz3pLSDA35xxmrTTHh7/a?=
 =?us-ascii?Q?YocDByEpO+Abtr7p6jNRUIFqy2MnrWS1NXAl5zI+pZm/7LqI3r56c4ycs5kM?=
 =?us-ascii?Q?bqGZSIqSisMTwNjyZgwleMWLHlmvKvfVWgAQyDwIPWdUqyUUcC+6IldkBuD7?=
 =?us-ascii?Q?TH+KSNWbrOMVl5UPCZaRBRbWHhdl1ECROaAz1Drqu7TUBrSU0v/o9F2c0e+A?=
 =?us-ascii?Q?pyyjLwF1kyxxhzUm+/WTDndSc6viFNmm8Mbc5I1KHRqGjyH/rYnq1yzoPuEZ?=
 =?us-ascii?Q?TYNjTaIHui34cTyI7skfZWkgEiFXnrYzPHevLSPAFl/boOFcTZSUf85FkbcQ?=
 =?us-ascii?Q?1ab8UJdpxH+Xd78rlpMDScy0V+s8+Xnl5u32sdRSFlOq8aM/0CCeG1GgynZZ?=
 =?us-ascii?Q?7Y7wpKN11GXELVM1UYJthRXcxpPw6+2Glp6RyH/yR/Mq03lIQMJd78isiXg8?=
 =?us-ascii?Q?EB3UAYV9W3lK+U4jOjR9R5wyOBe9JUNARcO1dIJ19GrTDWXtp5jHEL4dPEjT?=
 =?us-ascii?Q?74CHtLRGdFBGJYAicNTZG1hWghb5LhtN7/kT32WNlfML+NWvId+9nE4QhsmU?=
 =?us-ascii?Q?OLs0etZ54ElPZYZ3ItbqZGGcE2fILvD6SAJkAXLAVCRuHbW1QwZ9ZIU2wYfX?=
 =?us-ascii?Q?A7qjkDT7vzg0H5EAN2jLAbwOmS+s1bLkRkhq5IJx3Yu56k7qWPK7WcbYjK0B?=
 =?us-ascii?Q?POwK3sMal6K6S1lASpEJxE4+XT/oAAVfsauBLcTY5oXydi7v3VuB82z1Eapl?=
 =?us-ascii?Q?UzNxGTRiHHXZeDFH2oLy6H53KFJ2c0fYlyi7Qs8nTVvl8PM0oNH2dWi6AHMR?=
 =?us-ascii?Q?U4wZgrsRRfgV0E7hbGw3bOhvNDrFcbYaANYsJJDO82CU8hVhgqvMoHRZ0g2G?=
 =?us-ascii?Q?GrRBQ868G3pU7v+B/6oZhFej3iCwFnFuX5KgDC2Np+96P662ea/6Fg4LPttu?=
 =?us-ascii?Q?vHhasDYJ36rqSs88XRvnlKsvZduz7ItSKkg41X63QlODcr+yUxxmaD3bb3GO?=
 =?us-ascii?Q?2McmHBGwTrJGKw5H2BRFcqJBHqO7oKSfesLOH77KVaOvUsmwf+69Vw2gfbIh?=
 =?us-ascii?Q?wXx4BUqfHlLGt1/3E2WcYhCzJ+P0u5tenFt8jFZ5XzjhetwzezUr+5a3d1rd?=
 =?us-ascii?Q?BQ6krI3ilYvPyFT4Qct4/mHmfl/IoLG8Vtqapkd6MvxKi1I/EiDmIyRhm/8y?=
 =?us-ascii?Q?xBLp+Iidr1IHj6FWPglhlkUf5zoCuUtQevh6RGzra5PzyFzYLA3q4Rh1FI7l?=
 =?us-ascii?Q?qvDky2qHTknCaHa4hZlOqPgFsX85gTgkZ04eeZ6pCGVPCB99ZlMr98KmczhL?=
 =?us-ascii?Q?EiX2VAysaFj4vBOc8bY4vrz3hlZsGr1ZolhvaS1IK2HbD7vnsNR59pA8A59G?=
 =?us-ascii?Q?jl2lgtKEcw/3c82IzLBJD/RLC7+Y3bggKN/KcE/LKDTIQ5yMc6C1+KOPNvPP?=
 =?us-ascii?Q?1ACz5pYMyYLO3nW3/sv+P8QegvkiWqHdy4PAL8M4EZOFu/0H8UiPVH+Jh1hF?=
 =?us-ascii?Q?y/1WWiSDiwYNxMpmUiOSm2MDyVERVKLjdVVE5QQBq/Yrw2/eq7MpOHSBm0Gy?=
 =?us-ascii?Q?NdnyWgtyGc4eaK+oOJqTYVDSDPpYTagCp1DA16EYl8N3hl31K+H0s1hs2u1M?=
 =?us-ascii?Q?KiVjxkL+MSjZ0nxS18xJzmuBiBMQQn9HZMGDk582JFNTPV75mc+P3DKgTfKR?=
 =?us-ascii?Q?AmRV2QnCgK3TGkGsWRuO5O6NMFiXnP/sCsZ+B6h+O8VkDvrjwkXg5Mi458wK?=
 =?us-ascii?Q?7mEhdt+yWkLY/WYJowFB3JK3OSwjW34=3D?=
X-Exchange-RoutingPolicyChecked: GvQyV037cPTv1KiCwwkWnjn/SIylgARraqcY9hN4umqRh77AMUqmu9t2wlbWr4TGWZb74OniN+2uIqgPS+6+iIqAn3nlSZm9+WQtI11T3lQ66fYW5PwX62m3GAFzcqJoK9YYZ81TvSe3uMY3cytm6XMji7vlnGzACyieArSSNSV5LBS4BjQcI7Mti4maiPQ61oT0aMQTjoBuCRIJHmUmw2qEo4OBzgt0oIb06dtGIoNkZax4U/9i1L7Ijuiyc24tuyoiWT+Hae9wyBXCEva1YxQnucAQo/PbR5yHHS44STJu8/8DCs3edizz+Gfq3LXTEiKJtdqScADYFD0WaJpGKg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a84830b2-30d3-4d4d-2f09-08df35391dba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 21:19:14.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GuyyTRmaWw4mhxCkPo2IwuIkAkisw6SFFxwJ+KLFIcm/jcMVx9VXQlNaWLaNL5Wi62dH1vkI9dzNd/hihR4Ntb0OrPPlehKlo0Sj6TYzW3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9660
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 05:20:51PM -0700, Daniel Charles wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Program DWNSTRM_ACCESS_MODE (0x144154) with 0xcc on graphics
> version 3511. Compared with 0x3c, this selects L3 class of service
> 3 instead of 0 and write-back rather than uncached L3 policy.
> The L4 caching policy and coherency mode remain unchanged.
> 

This patch is implementing Wa_14028586678, but the workaround number
doesn't appear anywhere in the title or the commit message.  We should
make sure to add that (preferably in the title) so that it's easy for
people to find this commit when looking for if/when workarounds were
added to the driver.

That also helps explain to readers why we we have this commit at all.
The commit message currently describes what the patch is changing
without justifying why the change is being made (i.e., that this is a
documented hardware workaround that's required on this platform).

> v2:
> - Create a dedicated MERT workaround section/table instead of placing
>   this workaround in gt_was. MERT registers are device-level registers
>   accessed through root-tile MMIO, outside GT forcewake and GT
>   save/restore bookkeeping.
> - Add an RTP helper for full-register device MMIO writes and apply the
>   MERT table during probe and after pcode is ready on system or D3cold
>   resume. Match Xe3p_XPC explicitly and skip devices without
>   MERT and SR-IOV VFs.
> 
> v3: Use PLATFORM(CRESCENTISLAND) for the MERT workaround (sashiko)
> 
> BSpec: 73603
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_mert_regs.h |  2 ++
>  drivers/gpu/drm/xe/xe_device.c         |  4 +++
>  drivers/gpu/drm/xe/xe_pm.c             |  8 ++++++
>  drivers/gpu/drm/xe/xe_rtp.c            | 39 ++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_rtp.h            |  2 ++
>  drivers/gpu/drm/xe/xe_wa.c             | 23 +++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.h             |  1 +
>  7 files changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_mert_regs.h b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> index 99e5a26da6572..1e6ce818fcee9 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mert_regs.h
> @@ -8,6 +8,8 @@
>  
>  #include "regs/xe_reg_defs.h"
>  
> +#define DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS	XE_REG(0x144154)
> +
>  #define MERT_LMEM_CFG				XE_REG(0x1448b0)
>  
>  #define MERT_TLB_CT_INTR_ERR_ID_PORT		XE_REG(0x145190)
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 8392c9fad3c48..27cff3137a7fe 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -953,6 +953,10 @@ int xe_device_probe(struct xe_device *xe)
>  			return err;
>  	}
>  
> +	err = xe_wa_apply_mert_workarounds(xe);
> +	if (err)
> +		return err;
> +
>  	/*
>  	 * Allow allocations only now to ensure xe_display_init_early()
>  	 * is the first to allocate, always.
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index daa7ba2df317a..ba863df3fbf59 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -251,6 +251,10 @@ int xe_pm_resume(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> +	err = xe_wa_apply_mert_workarounds(xe);
> +	if (err)
> +		return err;
> +
>  	xe_display_pm_resume_early(xe);
>  
>  	/*
> @@ -705,6 +709,10 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>  		if (err)
>  			goto out;
>  
> +		err = xe_wa_apply_mert_workarounds(xe);
> +		if (err)
> +			goto out;
> +
>  		xe_display_pm_resume_early(xe);
>  
>  		/*
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 6a8d6ea68f25d..539d06eaba6fc 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -13,6 +13,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_topology.h"
> +#include "xe_mmio.h"
>  #include "xe_reg_sr.h"
>  #include "xe_sriov.h"
>  
> @@ -413,6 +414,44 @@ void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>  }
>  EXPORT_SYMBOL_IF_KUNIT(xe_rtp_process);
>  
> +/**
> + * xe_rtp_apply_device_mmio_writes - Apply full-register device MMIO writes
> + * @xe: Device to apply the actions to
> + * @table: RTP action table containing only full-register writes
> + *
> + * Device registers are accessed via the root tile without GT forcewake or
> + * GT save/restore bookkeeping.
> + *
> + * Return: 0 on success or -EINVAL for an unsupported action.
> + */
> +int xe_rtp_apply_device_mmio_writes(struct xe_device *xe,
> +				    const struct xe_rtp_table_sr *table)
> +{
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);

This works okay today because the only workaround on the list is for
CRI, which is a single-tile platform, but in general this probably isn't
a good idea to handle a general workaround programming interface.  If we
had a workaround like this on PVC, then we'd probably need to be
programming the relevant register on all tiles, not just the first one.
Same if we wind up with more multi-tile platforms in the future that
wind up needing workarounds like this.

This seems like we should be using the xe_wa_apply_tile_workarounds()
function that we already have for applying soc/sgunit workarounds to a
tile.  At the moment that doesn't use RTP there because there aren't
enough such workarounds yet to make it worthwhile, so you could either
add this as an OOB workaround there, or you could convert that function
to use the RTP infrastructure if you want (although that conversion
should probably be a separate initial patch, with the workaround itself
being added independently after the framework is in place).

> +
> +	for (size_t i = 0; i < table->n_entries; i++) {
> +		const struct xe_rtp_entry_sr *entry = &table->entries[i];
> +
> +		if (!rule_matches(xe, NULL, NULL, entry->rules, entry->n_rules))
> +			continue;

This seems to be mixing the "process" and "apply" steps into a single
function; the primary reason we have the RTP infrastructure is to keep
those separate so that we can process once during driver init and then
(re-)apply the processed list later as necessary.  And by not having a
process step, this also isn't going to be hooked into the rest of our
workaround tracking in debugfs and such.  So I think we need to decide
whether we want to put in the effort to make this a true RTP-based set
of workarounds, or whether it's simpler to just use OOB for this as we
do for the other SoC/sgunit workarounds today.

> +
> +		for (size_t j = 0; j < entry->n_actions; j++) {
> +			const struct xe_rtp_action *action = &entry->actions[j];
> +
> +			if (drm_WARN_ON(&xe->drm, action->clr_bits != ~0u ||
> +					action->reg.mcr || action->reg.masked ||
> +					action->flags || action->use_func))
> +				return -EINVAL;
> +
> +			xe_mmio_write32(mmio, action->reg, action->set_bits);
> +		}
> +
> +		drm_dbg(&xe->drm, "Applied device workaround %s\n", entry->name);
> +	}
> +
> +	return 0;
> +}
> +
>  bool xe_rtp_match_always(const struct xe_device *xe,
>  			 const struct xe_gt *gt,
>  			 const struct xe_hw_engine *hwe)
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 0032f68ea1873..7f45bb8552244 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -514,6 +514,8 @@ void xe_rtp_process_to_sr(struct xe_rtp_process_ctx *ctx,
>  
>  void xe_rtp_process(struct xe_rtp_process_ctx *ctx,
>  		    const struct xe_rtp_table *table);
> +int xe_rtp_apply_device_mmio_writes(struct xe_device *xe,
> +				    const struct xe_rtp_table_sr *table);
>  
>  /* Match functions to be used with XE_RTP_MATCH_FUNC */
>  
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index c94fe7753f9a9..c5f5d02be2eaa 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -16,7 +16,9 @@
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_guc_regs.h"
> +#include "regs/xe_mert_regs.h"
>  #include "regs/xe_regs.h"
> +#include "xe_device.h"
>  #include "xe_device_types.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_types.h"
> @@ -823,6 +825,13 @@ VISIBLE_IF_KUNIT __maybe_unused const struct xe_rtp_table device_oob_was = {
>  };
>  EXPORT_SYMBOL_IF_KUNIT(device_oob_was);
>  
> +static const struct xe_rtp_table_sr mert_was = XE_RTP_TABLE_SR(
> +	{ XE_RTP_NAME("14028586678"),
> +	  XE_RTP_RULES(PLATFORM(CRESCENTISLAND)),
> +	  XE_RTP_ACTIONS(WR(DWNSTRM_ACCESS_MODE_GAMREQ_MERTSS, 0xcc))

The workaround description asks us to write [5:4] = 0x0 and [7:6] = 0x3
so if we're using RTP we should be setting those specific fields to the
desired values to avoid clobbering the rest of the register's fields.
It looks like you might have tried to include the hardware default
values for the other fields in the overall value here, but that's still
risky in case the firmware changes some of those to non-default values
and/or other workarounds show up to target the other bits.

> +	},
> +);

If we think we're eventually going to have enough MERT workarounds that
we want to keep them separate from the more general tile workaround
category (and if we want to use the RTP infrastructure for them), then
it would probably be best to keep the MERT-specific workaround list in
xe_mert.c with the rest of the MERT code.


Matt

> +
>  __diag_pop();
>  
>  /**
> @@ -1032,3 +1041,17 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
>  	if (XE_DEVICE_WA(tile->xe, 22010954014))
>  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
>  }
> +
> +/**
> + * xe_wa_apply_mert_workarounds - Apply root-tile MERT workarounds
> + * @xe: Xe device
> + *
> + * Called during probe and after pcode is ready on system or D3cold resume.
> + */
> +int xe_wa_apply_mert_workarounds(struct xe_device *xe)
> +{
> +	if (!xe_device_has_mert(xe) || IS_SRIOV_VF(xe))
> +		return 0;
> +
> +	return xe_rtp_apply_device_mmio_writes(xe, &mert_was);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index f4da2b2713963..28516812cb2bf 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -22,6 +22,7 @@ void xe_wa_process_gt(struct xe_gt *gt);
>  void xe_wa_process_engine(struct xe_hw_engine *hwe);
>  void xe_wa_process_lrc(struct xe_hw_engine *hwe);
>  void xe_wa_apply_tile_workarounds(struct xe_tile *tile);
> +int xe_wa_apply_mert_workarounds(struct xe_device *xe);
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
