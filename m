Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4DAC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 15:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F219010E2A7;
	Fri, 11 Jul 2025 15:21:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c84D9zx6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD80D10E2A7
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 15:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752247271; x=1783783271;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=OAXLtTMBuEeWqrdlCYXHfRi/aOnqI97Td8P3nsY5+yk=;
 b=c84D9zx6a72Ez14z/Nf/DpPZuJzuIvgtj25LideenS5RhH6KWwA8GqsF
 Ekv43T2Mrg6K1YTjqpOUhODHDGtmBPLKkVuvQbqBfKsB9LVyYijWZnFIU
 R1/leQx7a8p/AJmPqLBK7BIFNta1vg5ekYTXgovdCH3d9EPSjwO+Q02Ff
 xgy5E6U5YWzmB4YzFxHesd0QJtwo2BqW62Y3hCgF5vkxrBkCs5XeIxweA
 x+Fb+cl2y3F9ySOQCmGNkM4rTHXm2aDk3bF+UMj1hLKZeVPAo4/L5OPIi
 bEmnPjD9es9DVyj9KWd/099J1uOKsbMvF+PTUWM7MHPxBHphTP98xJ/KN Q==;
X-CSE-ConnectionGUID: l4GSBve0RsuPRmmI3Tz2bg==
X-CSE-MsgGUID: JP3fiN16TCGDao3VHHkuMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="79981558"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="79981558"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:20:50 -0700
X-CSE-ConnectionGUID: XwjbexsORCKUn1PTFpB+FQ==
X-CSE-MsgGUID: D1P98tOiQ1WgQFPlb1Y52Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="156175908"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 08:20:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:20:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 08:20:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.77) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 08:20:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taehTNBkoU7Ao5x9DyBpmsxrWFaxHCTR6CvjIkO24OMImjQoPXpZ79ibkv/jb1Vsq9v1nAelgys6YrdiFqB33B5R5mTMkiVxe7as2KCWcZPUZtjy7eTSjzncOJbz0SdL65G/88gaOi1FkwNq1HOicy02+bF0+LqIbxf9dRs84nsuB+kVSmqNAbQHzdN8EbpTkbOP+qHEAHE0q5NdbSGNe1Ub83F0oag73FgWQn+koSjdEYJg0FTgDpkfTLA+WrzvJ1dXj6TLSJFFT9pruIQegcNIqoHHC7XkikqFsZArk8gddDzbbutsMlunjiZL+bGXSlQb4+dlAqZz2k7qy3TZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJiSVJIUagxuhby2ossGc/n+dhtGX9/+/Hyz+x3lI2Y=;
 b=gJ2RJoL6tL9b7TwMf59paewiR01tenGuOaCgfzF9ooAXRWVRC2CiGxCpOsIi77GW30eA4KSr/p4TSXMBtb7TWg4GbdU19vWQSwLPqntYKeISYaeMKG+hTPG9DkLMFIUD2D/6Pl+K6Jmv9NFDdhSSV7Ib+gfmoDK6A/qgN7GCcJWX/W2HWFQJaTXzotYAsID8pKkVdqfdXdETllQfpyelx45r4zU1Oo0uaYQnYhps9f/fqyB352x2B8mAVpWOYXHSZNQPaX8SE9yyMQkGezz0xbFtfh1V/sw/JV2RX6MTVHod5jtr/PiMd5Xl8lgUQGliSF1FHA5BwpWDOO5BR74bLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Fri, 11 Jul
 2025 15:20:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 15:20:43 +0000
Date: Fri, 11 Jul 2025 08:22:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: =?iso-8859-1?Q?Pi=F3rkowski=2C?= Piotr <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Stuart Summers <stuart.summers@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v10 0/5] Cleaning up code related to VRAM regions and its
 initialization - part 2
Message-ID: <aHEsNDKhITWn2/Kg@lstrano-desk.jf.intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
X-ClientProxiedBy: SJ0PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB5995:EE_
X-MS-Office365-Filtering-Correlation-Id: da9fe418-988c-4521-6aa7-08ddc08e80cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6sMfP3B0jfGeQ8kqQOF7z4AOmLzQwWYSsqQKu4OTUflBkHADCJT8+20f67?=
 =?iso-8859-1?Q?2PzRVEKke5auwbsbKUufD7vzRkIIyT9QdRl432KEGZGx1SETm1seZ2XZOD?=
 =?iso-8859-1?Q?MHR8np0nn08kI+yqvGQ5uZXzTxy2nhJwhtHE3nq9hmshQfAjzMdP8DSyoO?=
 =?iso-8859-1?Q?hgm6cJFKdo+PBhnQtRdQpFVc+3QN3XRC/ZLixBa+oupGzje2/GHFcO/aek?=
 =?iso-8859-1?Q?0wuojJXh+HUzhqW3BC+rR7e1WPBfVI3BGuyYo8ul+Uy14+KNBpg53H1X/J?=
 =?iso-8859-1?Q?tR68QhU/sUnr5L45lSBQN3TVPOFX5Jh4ljtqDIc2J454Y6l51deYmad8Oq?=
 =?iso-8859-1?Q?MWwMxiLbGrJACf5HSP0RhD6hszKSHBulcQCfFTbewDQnA9oZDA3pz9efNK?=
 =?iso-8859-1?Q?Dl6Kohg/RvcwRrK4z+UBXf3iraCafdMVU5USjL6IJqc3ye95krsVJyBWZs?=
 =?iso-8859-1?Q?v6zksH8J9tWvJG60ts37tg/1MP1SH8+z6UlKiBu2IeSSxqaJN6ob6D1FT6?=
 =?iso-8859-1?Q?W0DkfMkCBo3vtEvqg6mAkDeZzuUJXMNu18SDNtDidRFvoAnc826C1oOo6z?=
 =?iso-8859-1?Q?gXZCQ3XJ0oC8/7pZNfmWiDydLjjuwWHiCLyaGxwqdXwzJUukUpquQkLXXV?=
 =?iso-8859-1?Q?1XtAIzX6zbfDOhmpJZOf7OPOmod9yQzjljDbRLmHu9//uuPOh8FedgtDcB?=
 =?iso-8859-1?Q?j88b2vnNisqYDjk+YnzoFsz74fpeqOMcu0APhWt9mw3zMI+I5JV7MxUV5N?=
 =?iso-8859-1?Q?X0F1jXL+0Yoy/HyZF4yDt0/K1xuOLeBrQ5tIriiURIBeVWFUbYjE3yRQOi?=
 =?iso-8859-1?Q?C0tsvPx1PCpy39e8PS3740eZALLfO3Rzhy/d6zhwniEXFtrK4wNPS6BjDI?=
 =?iso-8859-1?Q?BPVTJVpRg9h8VABT9GY/y9Ml58U2lAIlCNc7J8J+KtLM+a3G186ovdffx7?=
 =?iso-8859-1?Q?SmPnQ41gUQfs5G7UMgDHEIA/ZySh3KIn7eqro8wUADqycTQ50zpZVNIISE?=
 =?iso-8859-1?Q?QpgsQrCSChOlxoGsdLJJW3zKkUUa375rfTRADAvGhIEtsGvdqnrpvFP0tL?=
 =?iso-8859-1?Q?KQOu8ts+wZphvM4M7FI0HM8066WraqWXk/22MTcqik4MTre7d0RmQak9tj?=
 =?iso-8859-1?Q?cQYMw5wD1Sy2AVugBwbUjYLFU3HvuaEva39K+8hBcM88tqC2FsRCPGEc2Z?=
 =?iso-8859-1?Q?F9yTp/zA6/0pfP6gFsFKizvTUqo5yOH/C3iZvA2d8XN2owqO7q6ovZ0ksW?=
 =?iso-8859-1?Q?QzDdVjJycsOl/Uluw5EFuOCUeFqwUGJ3AY4hf/WUCW63AQf24aR5Payy1P?=
 =?iso-8859-1?Q?/sgFXn3rQrNwtELOS1W/srqdzJkHddfMVSG3lyep9lVmAK4/iwYLkcrQ6P?=
 =?iso-8859-1?Q?IvrrJHnnkO1GxoiE6MM1tGmbM2PhYradiml0kRGr2qp6czx9Dn2UXnD/W9?=
 =?iso-8859-1?Q?H6JSe3TVsvzzTC85VNuzaA4sAw3EQByuZ1B9UGhLzKgCKE9VRtrdk3AXuG?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?V58uO1pK5VaZ5BtX5P0Uainm+BtOOS3iIGPWVufPApt+0lUpCQFdDNsAO5?=
 =?iso-8859-1?Q?jcwzFWrJk+giz96XgKT8E/rArDXkNCS5rdG5s2L8nC/IHteL6P1TyKre3F?=
 =?iso-8859-1?Q?+6+WfFZe2rJaTJdxkeMjAJE45VQoeS9xAaD+aCZxOun6WKFO5PIUhDt3B0?=
 =?iso-8859-1?Q?vdg19C9OBGDt9wZkHfD1PZYdQg2yWkZZv0pkv/8fbl7k8NZHUjxdKIqGXt?=
 =?iso-8859-1?Q?fW1aydCZbQM5W0YvIciozC8lFyZyBuDXENLECGubjO3BY7F24MVO344/dk?=
 =?iso-8859-1?Q?m/0lzDOgekMkYKgh2RTya8DdvYZSMo7/PaoHLtyoI+s19I8R6hJWbbtjfY?=
 =?iso-8859-1?Q?L/PYYfVfgjT8B5DHXirCvqu7k1kG9YAyvQGIEji0m3ocIOQnfnvOZ/eBC/?=
 =?iso-8859-1?Q?XXAVmBjBJ8arAPnX1LWkBrV+sS4+2ooah66DWXwlyfbGSMUvz82vVV20Rl?=
 =?iso-8859-1?Q?c7+h+hnHhoHyzwnVBfhtt5TEswcfhXm4+IPDs97VKRkzdMRGLGEeOFNaEE?=
 =?iso-8859-1?Q?d+rNBgF6SDrsIURK1miKjg8vFixiSCqs4unHSIt1rdXIDfO7cY8B+2rNDu?=
 =?iso-8859-1?Q?izGXNZkV9vvPxYN7C1mIQFCnUMIt/H2tALuUmzqjkuYTelWwdeXbhPjA4h?=
 =?iso-8859-1?Q?hPUl0ysG0VcV4ijDBqJENlwSdU3mER5dyEN0wG0HI42EKKg6iI3E6rKL42?=
 =?iso-8859-1?Q?KywM/4SVZ3h+aJsvzxxZWCRFr72y+UgWenwHfAKD5jOAr2zJX3rx6pyFRF?=
 =?iso-8859-1?Q?PxQ3xv+yA/se7yqIms/4ZLZGsB5f91ffE7xsMcjivt1RaqeJdWiQsqyJfa?=
 =?iso-8859-1?Q?yUDR0G38HwkLZ0YMyBJDLaMFt9+7vuy5W6mFHEHDkjP9fgqOemwTLfOc3u?=
 =?iso-8859-1?Q?kS05nxsOreWzvkYX8kDnoxWEVIxkhhEPsGGPMSlfZ+v7J+4GsAO748R6Tg?=
 =?iso-8859-1?Q?ep13YH+//Vt6ozmUFMzdSOdnhLoWumymEeybRkIdhsANTNhJ8W9sPMhSVJ?=
 =?iso-8859-1?Q?u+BFF7zB6FtgjeCF2CqRodHW1F/zXRQbah05GnSHd8fZMT0NKvB3NJrtuB?=
 =?iso-8859-1?Q?MbPL6nhA8nCRdYbZq6aA9Dm6W6CoyCe34HSxwdR83GCN8mSpSRyc8fi7te?=
 =?iso-8859-1?Q?N0I9SnTLYZUdSC9SsCsTGRxHW/Qf9AU3Eh3AJBN9TYCcnMZ/GRkfZuc8nb?=
 =?iso-8859-1?Q?feVAwqRsVkPgsqP8Cs1PDR576MHfNgImeSFzEyf00WQH8d4hdsBBI+XodJ?=
 =?iso-8859-1?Q?ptcoWo5bJvmr+d1rHxfwRUTky+0+JRyXxW1eVrFc1d2GruJAEbgVRHcEdw?=
 =?iso-8859-1?Q?bQtgAuwhZTlp1ghdyPDCPW6yf2rjx8Ihc4l5XW4nKrW5RI9reY4yHLKDbj?=
 =?iso-8859-1?Q?QRkUJvbx0UJKokGk2RjG2ObSa4iTUMw1Y86Owg7tVinK8SUYvPY6q7CidO?=
 =?iso-8859-1?Q?NX5N18Ew4CGGEYhf4XoHQ1KBoSbbHzwOvvYjd1xcmxHYy+xNT4+3hBXcDR?=
 =?iso-8859-1?Q?4WMeNiyr+qIDGiHPyLjEePhiDh3so3K8bSlXVf9bcd1M/q1u8wosEIizqU?=
 =?iso-8859-1?Q?yUwbTA8+SMaeBAv54ejYZS3UBQJ4fdO1Pp0ykle2qxxjLnodtsN5GZskyu?=
 =?iso-8859-1?Q?pzyBxxQFjYRdth0F255R7J5JfD6Rw7QC3Gbbj8L8WV6bFKO3yG6/jIrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da9fe418-988c-4521-6aa7-08ddc08e80cc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 15:20:43.7507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OhpvxzOpfwyjkCQxH4Pv2lSTRtylaes6/k0mRKf8i3QSG40l2k8N55HOWYuvoFNIdi22KbUAeTgDhBaqyngS6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5995
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

On Wed, Jul 09, 2025 at 02:15:38PM +0200, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> 
> As a follow-up to the earlier VRAM region cleanups, this patch series
> focuses on further improving the flexibility and clarity of
> the Xe driver's VRAM management.
> 
> This series focuses on preparing the VRAM region handling code for future
> platforms, where a more dynamic representation of device and tile VRAM
> regions will be required. Static allocation of these structures is replaced
> with dynamic allocation to increase flexibility and improve maintainability.
> Additionally, the initialization logic for device-wide and tile-local VRAM
> regions is unified, replacing the previously separate code paths. This
> simplification improves code clarity and facilitates future extensions
> involving additional VRAM region types.
> 
> v2:
> - fix doc comments in struct xe_vram_region
> - remove unnecessary includes (Jani)
> v3:
> - move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
>   (Matthew)
> - replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
>   (Matthew)
> - Replace the tile id parameter with vram region in the xe_pf_begin
>   function.
> v4:
> - add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
>   unmap" (Matthew)
> - add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
> - fix null pointer dereference in xe_assert when VRAM region for tile
>   hasn't been initialized (Michal)
> v5:
> - Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
> v6:
> - Fix build if CONFIG_DRM_XE_DISPLAY is enabled
> v7:
> - rebase after new changes related to SVM
> v8:
> - rebase
> - add a helpers for accessing fields of the xe_vram_region structure in
>   patch "drm/xe: Use dynamic allocation for tile and device VRAM region
>     structures"
> v9:
> - rebase
> v10:
> - remove tile back pointer from struct xe_vram_region (with
>   modifications in xe_svm.c) (Matthew Brost)
> - add new back pointers: xe and migarte to xe_vram_region (with
>   modifications in xe_svm.c) (Matthew Brost)
> - add patch "drm/xe: Split xe_migrate allocation from initialization"
> - move helper to get tile dpagemap to xe_svm.c (Matthew Brost)
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

For the series:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> 
> Piotr Piórkowski (5):
>   drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
>   drm/xe: Use dynamic allocation for tile and device VRAM region
>     structures
>   drm/xe: Move struct xe_vram_region to a dedicated header
>   drm/xe: Split xe_migrate allocation from initialization
>   drm/xe: Unify the initialization of VRAM regions
> 
>  drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +-
>  drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
>  drivers/gpu/drm/xe/xe_assert.h                |   4 +-
>  drivers/gpu/drm/xe/xe_bo.c                    |   1 +
>  drivers/gpu/drm/xe/xe_bo.h                    |   4 +-
>  drivers/gpu/drm/xe/xe_bo_types.h              |   1 +
>  drivers/gpu/drm/xe/xe_device.c                |  20 ++
>  drivers/gpu/drm/xe/xe_device_types.h          |  62 +-----
>  drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
>  drivers/gpu/drm/xe/xe_migrate.c               |  50 +++--
>  drivers/gpu/drm/xe/xe_migrate.h               |   1 +
>  drivers/gpu/drm/xe/xe_pci.c                   |   6 +
>  drivers/gpu/drm/xe/xe_query.c                 |   5 +-
>  drivers/gpu/drm/xe/xe_svm.c                   |  63 +++---
>  drivers/gpu/drm/xe/xe_tile.c                  |  62 ++++--
>  drivers/gpu/drm/xe/xe_tile.h                  |  13 +-
>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  22 +-
>  drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
>  drivers/gpu/drm/xe/xe_vram.c                  | 209 +++++++++++++-----
>  drivers/gpu/drm/xe/xe_vram.h                  |  11 +
>  drivers/gpu/drm/xe/xe_vram_types.h            |  85 +++++++
>  23 files changed, 427 insertions(+), 229 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h
> 
> -- 
> 2.34.1
> 
