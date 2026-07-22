Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E20C44532
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 16:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E0810E4B8;
	Wed, 22 Jul 2026 16:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciZPHGCM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656C310E4C0
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 16:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784739420; x=1816275420;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5dmdm2zJBWKAC/PDBvHGEkYmh1S6jdDNrRJxdprgBF4=;
 b=ciZPHGCM6JHLza9UVtwuipptSOch/INu0yZu8WgPwk03DuBiKJe/jZ3T
 UBTtEJuv3mIzvIy19FhNnejMD+iREgtIklOI5VKN7j2RsHu00qaTnPB/a
 Wa2s0Bp7zZDjuR532POpAbPPM9hR4pwkXsmZ33lwuBZ/cDBuO6TFewrYm
 7krXHaCdIK02IWOCTjaZu3Tlyi1U+NzvooeXBsChiPS3uHNwwBo7fpZM9
 +Hmgfy2AHxmZ4ElX413MVMgXDrl006jWI0D/FHoWj0947qLyS0rBVozI7
 llrpt0hBRPzW0W6JQvTOIDZdQ8dFEOgYDosqvnfIdulCsM2mre1o4prtl g==;
X-CSE-ConnectionGUID: POj7FaW/S6aK5elVgALhrA==
X-CSE-MsgGUID: ycOm32CSTc6eJd2ldsy9Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84506978"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="84506978"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 09:57:00 -0700
X-CSE-ConnectionGUID: 6t56AZNAQHqoUPgEnCYWeA==
X-CSE-MsgGUID: wv/IdaWjRq6X87VRk1rFJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="254753849"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 09:57:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 09:56:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 09:56:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.63) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 09:56:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=owzYEdU8a6GYPDdddLxBYImZ4vFZY2+kWNkDCp1QK8KavnCzi3L5+dTG1PHKwOcg36wYDALPZW2iVkHIsQIaJgAp8s4ObvOfZ1/SAb8PAZzfxlw1Emufojs9acPnMd4l6u2NV2NhuCLFi2pTO/iQRJad/13MUsi/Ogar4fl0aNxJjstFm15kiu61Ngiq6fedGowx2ECXs8hKaFM3rFPf9LS+RRRif/qoeY/2oBlKFJU0MddCQzgNRv6XwS/JQkWcTMs14lqbXvreamrhnOZoX+S+zaOIRdgV69H7Q2xjGWErOLfU2x0Em+wH2FNP9pHrz3hhq2C80v/zgRcM2ZruLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEAafzpEjJ6zaPa6No80vIMjwvFr5F9eieR2fDiUHAY=;
 b=LvPj/EEbN/Zgndu/AoWhkdZoiFP4ersPz5Z0I+Iu/aWyWUgrp2if2LpP1/w50KSu08CgEqz1tWkhYeIgZbWcN3+iNOCLiXWAov312khhyetP66fUC5GTjxssXBWqLsXblP8WGN216yBgBBeVLzLC4emKMCL25g5VVr6vHJCFMQzZGWdcd1usyHxG3CzbCGVCF44cRTZxGlDj3I2RgmwPsBUdvxj6wb0aUXUc+xkufxgnQ80psl/PwuLLFpjwHGdte/kio/9UK5bKCJOU4DbpRAC8Cmybqs/z2mgVgaj/jFz+O6gDygbWaMXVVm2hmDsAT3V6ga12WS5vIw69PlxPPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 16:56:55 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 16:56:55 +0000
Date: Wed, 22 Jul 2026 09:56:47 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Raag Jadav <raag.jadav@intel.com>
Subject: Re: =?utf-8?B?4pyTIFhlLkNJLkZVTEw=?= =?utf-8?Q?=3A?= success for
 drm/xe/i2c: Allow per domain unique id
Message-ID: <20260722165647.GA2064657@mdroper-desk1.amr.corp.intel.com>
References: <20260721113438.651100-1-raag.jadav@intel.com>
 <178466960058.212456.12202452171055642820@6beec6c84f66>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <178466960058.212456.12202452171055642820@6beec6c84f66>
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a26106-366e-4032-a961-08dee8123c14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|6133799003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 9qdOjOMeJ8wsrr5ICtvpNRGnhbSPwTQEszQohMSAaoFZoUhmX/tnVb6P8Jhqj5XBDG3evrpLbLvsuOE2QzXCPrz56/9SI5P36yF5dOJ81ySc0edsBHgJVAUvomYmV2ti/tU13UXRbTWzAiKxTlPmU0/kur9AbkSfmjKyyAizKHfs3QxIIBpkHeIbqY+ZZQNQ6IGVn3vF/Izi/nZ4K7lGt7/PVUcQggmZ8kDWk8K/1RMko5uDOhEx2gsC4D1mOgHsOdmJj/HmazxfM5ha7b9aY0Z+tG9gAWBoMmFFzdMrsjWfuVGVNMiDJxl/jrCKQMPShS0ij1ZSwgmMRT0iEqyV8JjjQiBljdzNHt+6otEiv2qZ6Y8oYujr/lFm4wmJQ5wGwbvaULK4hayo/Yb3T/Jdo6QJH1lDyzpuntEZxSalTOEPvqFQEuSClpaSxY9a7O1RWZyT7iDMsKVDW18yAwNKowOf/MqRuxypWe2RmZ3zSRAMUPpHwDRCnpwHB3zAFQSvC+WjV1K786i9lc/AMZlZTiPZNJT93Xd4BNSVFFyBvmRo680pFnPb+oqSqYIol/WFdRwUliY55o8WSbcT8a3zHQGE6QVxgRI7I8IN56zKZus=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qLdcMBOvSLn+zTOmlFr/R1OArUUtPSWLUROoGHUykJRzwoJw8yZ+yyjtuk0p?=
 =?us-ascii?Q?N5yZLamTtaaESbVLrBNJEksIe/fK3ip6DWIn5GKfFyQFJ6swdpdRJV/DcgNj?=
 =?us-ascii?Q?AQIMQGMKrNBMKXpM/rVG2bqHA254BqMfZBoR7g4gDLjnTx/tlnHO+sHD045L?=
 =?us-ascii?Q?92IfbZjcgB4atMx/8xJw/CnprslD6rsDEjZGh3JSTlqeHgP6nXD3l5vRPu+U?=
 =?us-ascii?Q?C9XSo4wOnTiRWvI9tUR2FrpjZQJapPHEDf6T6fR8C30rkq49CnAUmBukPs/A?=
 =?us-ascii?Q?4QqGm+N/GFXTxct9y3oc69s+88/w2RP+PitXtvX5D2f5Jr4/bPAXbkZ2yE2O?=
 =?us-ascii?Q?/pVwWtNGNka6z3d/LhPSOhM37ORyGQeLRHcdz76DKp6YsuG8VG2L/VtyNwcp?=
 =?us-ascii?Q?cSY3g6VLRqysRFIuXqvtzGNedjVHofJTb7n7Jmv4DOnUkZHkhN1TKbB/9jl+?=
 =?us-ascii?Q?ss4TsW+DnNoGP79Xu8IgICEgVS9+16b7Cyoell87q5Z5Cigqohs8o7rwgcVJ?=
 =?us-ascii?Q?mH7oLTYKgoTK03OhkGGqx2OTHi5kZw/h2K3fWSdyPLnD0Ev8d+AA+vc+zwlu?=
 =?us-ascii?Q?JYABgrBv/2TqAK1Txdk1fKgmgKHhMeclYm56CUk1DaFgtu8uVk1Nbf7uSOFM?=
 =?us-ascii?Q?0Pp2tQsCCrdUq4lIT9KPFAGr6oLO78672GYFv91simwJtN4qZGkn/R0dHsRv?=
 =?us-ascii?Q?M8hpAafDmHEiQ38hGEBAN6KpfjjJ/gHduGl6bPPEEnG2ZcQKuuxffP7/2qdk?=
 =?us-ascii?Q?zMdHq8Qvx8A3JYCPODC8I/hBhdwkR8btxoUL8eY5mPcYE0BewrN3+bUkpMWm?=
 =?us-ascii?Q?9/PNYW5EN4A0mAjCAacpKnBVaqpL0cygO3bEukfHdTIxT7hcEOl9CR6RzuiG?=
 =?us-ascii?Q?DZfmuQRAObZYJaaYo8aAaPBtBX+7Sel0w/8NSFdidiMY+mxpw9kCz1UZUh7W?=
 =?us-ascii?Q?q6kiS5my7fW3cKo5/nEisvocqI7l8RAc7cFqzRxcDtJhQN/1ipwa8hypvW+Z?=
 =?us-ascii?Q?m9aD5eQzcsfgeM7QnRY1mLjbt5rJm0bOe9+avctQwf88euz7uDy5ugZ9wyqF?=
 =?us-ascii?Q?oJXGAtPixTBUNWsubZWxe7lmdxoM6OEI5WEk1WQlN0xkvFnAs6mjeLTNjMWu?=
 =?us-ascii?Q?aSFcK4k6TTopqE1IkaiDEUPCa84yznSllHr1gIMRCPQcf7zAaXKrnq6NVyH9?=
 =?us-ascii?Q?RJG+dqq/XoepX3gFJ+m58oj8wwiuXWJcNXVErbM/zV68WvBEDEBAK0uqeUjr?=
 =?us-ascii?Q?Ccalf9qlK+VzakIhM+3A988kBmWpCdumTqeU1x+YIhm86a6buuDQjsaRFN/x?=
 =?us-ascii?Q?G7qE5kNF7/hoHZOSkdFh2JRHHzgcUILWsNABzDC0iF903Ux5n0PeajBdbMm4?=
 =?us-ascii?Q?obZWtwdMgzRbilp2siZyOg53dhif13Bqzn+T/0xgEJ2WdCC8A7/+xnrPLKk2?=
 =?us-ascii?Q?wzVgqLG4QhDCLJRYk55eRQAuwU9XDNGoB8u49dk80AqFXtH3MwC9bHaH1zyq?=
 =?us-ascii?Q?JC/L4VdLzIszrcIspOeLr+k1a7fg0A1zVW4BdNviOO93MwMP6om9GQr3Tsfo?=
 =?us-ascii?Q?tC/0tePPv/kAbmmIP4ANtQng71UoJSXlGd/q2Wu+Pov4dP64WE6igIKCdYht?=
 =?us-ascii?Q?kFcJDrks92l3yFhs3OBbSO7DQ24BPtAi5uIxODSA9WsQiUFIYScv86QoNUoB?=
 =?us-ascii?Q?UsrlOuBNqcdPowzwMga6PRbFUN/jwglCPLK1iLctdfjRDMcOeIRRgJqDcPGW?=
 =?us-ascii?Q?BOI+tD9cK47xcdb/TUhvpL4vXWwiG1w=3D?=
X-Exchange-RoutingPolicyChecked: iBMpU5pphdaotbFPZGOZWzc0NUTppVsJ9gjL50Y1Zoe1RkRltUDaHHbyVO8m1mS5GcMGwjQ7VPwvjl0Oswq+C+F3swvsLdp0vOoE+eOrmU5D/w0Nk8Hj9t9J2HNelV/ERsLcYfu/8HxGX87cmSqeuV0AZyUTV2a0rHpQ2FKtY/GUXgfZ9BjaZqoM7QO76fDZluYmXOfaUyThpq0O/B9GBNfA9zPxlNZyU9Xfj/w4eYE7cqa4ZkoWQwbbKaFkbPRvzb9TDOz0oAieLV88WnitX+nMeMplEdbgfFmvQ+MHAHG8C38JHV6kWOMJJtnjtNe9FlOJLHudH5i66U2Q4T26xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a26106-366e-4032-a961-08dee8123c14
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 16:56:55.0284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6aQZxGUlDwemJyezbXPqauw217OhWYD/Q9U+h93d0FF8aKrfeBjwP7UgmvBsAw9vyPKEU8BAhlr1jWLDXjM+q8Doq4VdZ0p85Fh1KUnV1Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

On Tue, Jul 21, 2026 at 09:33:20PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/i2c: Allow per domain unique id
> URL   : https://patchwork.freedesktop.org/series/170812/
> State : success
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9_FULL -> xe-pw-170812v1_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **SUCCESS**
> 
>   No regressions found.
> 

Applied to drm-xe-next.  Thanks for the patch and review.


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
>   Here are the changes found in xe-pw-170812v1_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
>     - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +4 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#367]) +1 other test skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html
> 
>   * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>     - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +1 other test skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +3 other tests skip
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>     - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
>     - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#3432]) +1 other test skip
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition:
>     - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2724] / [Intel XE#7449])
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_cdclk@mode-transition.html
> 
>   * igt@kms_chamelium_color@ctm-red-to-blue:
>     - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html
> 
>   * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
>     - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html
> 
>   * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
> 
>   * igt@kms_content_protection@content-type-change:
>     - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7642]) +1 other test skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_content_protection@content-type-change.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x170:
>     - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2321] / [Intel XE#7355])
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html
> 
>   * igt@kms_cursor_crc@cursor-random-32x32:
>     - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320]) +1 other test skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-32x32.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>     - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#309] / [Intel XE#7343])
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
> 
>   * igt@kms_dsc@dsc-with-bpc-bigjoiner:
>     - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#8265]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc-bigjoiner.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2374] / [Intel XE#6128])
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1421]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>     - shard-lnl:          [PASS][20] -> [FAIL][21] ([Intel XE#301] / [Intel XE#3149])
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
>     - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#656] / [Intel XE#7905])
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +21 other tests skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141]) +1 other test skip
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-mmap-wc:
>     - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6312])
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
>     - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2352] / [Intel XE#7399])
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7865])
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7905])
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-cur-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
>     - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +22 other tests skip
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
> 
>   * igt@kms_joiner@basic-force-ultra-joiner:
>     - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6911] / [Intel XE#7466])
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_joiner@basic-force-ultra-joiner.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2486])
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>     - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
>     - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7283]) +1 other test skip
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html
> 
>   * igt@kms_plane@pixel-format-yf-tiled-modifier:
>     - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7283]) +2 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_plane@pixel-format-yf-tiled-modifier.html
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#5021] / [Intel XE#7377])
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>     - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-framegap:
>     - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8395])
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_pm_dc@dc3co-vpb-framegap.html
> 
>   * igt@kms_pm_lpsp@kms-lpsp:
>     - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2499])
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_pm_lpsp@kms-lpsp.html
> 
>   * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
>     - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1489]) +3 other tests skip
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr@pr-sprite-plane-onoff:
>     - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
> 
>   * igt@kms_vrr@flip-suspend:
>     - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1499])
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@kms_vrr@flip-suspend.html
> 
>   * igt@xe_compute@ccs-mode-compute-kernel:
>     - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6599])
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_compute@ccs-mode-compute-kernel.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#6540] / [Intel XE#688])
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-small-multi-queue-cm:
>     - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8370])
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>     - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
> 
>   * igt@xe_exec_fault_mode@atomic-many:
>     - shard-bmg:          [PASS][50] -> [FAIL][51] ([Intel XE#8578])
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-9/igt@xe_exec_fault_mode@atomic-many.html
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html
> 
>   * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
>     - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#8374])
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
>     - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#8374]) +5 other tests skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html
> 
>   * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
>     - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#8364]) +10 other tests skip
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
> 
>   * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
>     - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8378]) +3 other tests skip
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
> 
>   * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
>     - shard-bmg:          [PASS][56] -> [ABORT][57] ([Intel XE#8007]) +1 other test abort
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
> 
>   * igt@xe_madvise@atomic-global:
>     - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7980])
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_madvise@atomic-global.html
> 
>   * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
>     - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#6964])
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html
> 
>   * igt@xe_page_reclaim@binds-1g-partial:
>     - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7793]) +1 other test skip
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html
> 
>   * igt@xe_page_reclaim@many-vma-same-bo:
>     - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7793])
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_page_reclaim@many-vma-same-bo.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@xe_peer2peer@read.html
> 
>   * igt@xe_pm@d3cold-mmap-system:
>     - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2284] / [Intel XE#7370])
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@xe_pm@d3cold-mmap-system.html
> 
>   * igt@xe_query@multigpu-query-mem-usage:
>     - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#944]) +1 other test skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html
> 
>   * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority:
>     - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#8339])
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@unbind-rebind:
>     - shard-bmg:          [ABORT][66] ([Intel XE#8007]) -> [PASS][67]
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-4/igt@core_hotunplug@unbind-rebind.html
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-1/igt@core_hotunplug@unbind-rebind.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
>     - shard-lnl:          [FAIL][68] ([Intel XE#301]) -> [PASS][69]
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0:
>     - shard-bmg:          [FAIL][70] -> [PASS][71] +2 other tests pass
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-7/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance0.html
> 
>   * igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1:
>     - shard-bmg:          [ABORT][72] -> [PASS][73] +1 other test pass
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-7/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-2/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_video_enhance1.html
> 
>   * igt@xe_wedged@basic-wedged:
>     - shard-lnl:          [ABORT][74] ([Intel XE#3119]) -> [PASS][75]
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-lnl-2/igt@xe_wedged@basic-wedged.html
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@xe_wedged@basic-wedged.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>     - shard-lnl:          [SKIP][76] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][77] ([Intel XE#309] / [Intel XE#7343])
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible:
>     - shard-lnl:          [FAIL][78] ([Intel XE#301]) -> [FAIL][79] ([Intel XE#301] / [Intel XE#3149])
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> 
>   * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>     - shard-bmg:          [SKIP][80] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][81] ([Intel XE#2509] / [Intel XE#7437])
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
>   [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
>   [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
>   [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
>   [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
>   [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
>   [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
>   [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
>   [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
>   [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
>   [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
>   [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
>   [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
>   [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
>   [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
>   [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
>   [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
>   [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
>   [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
>   [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
>   [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#3119]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3119
>   [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
>   [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
>   [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
>   [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
>   [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
>   [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
>   [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
>   [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
>   [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
>   [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
>   [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
>   [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
>   [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
>   [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
>   [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
>   [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
>   [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
>   [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
>   [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
>   [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
>   [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
>   [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
>   [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
>   [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
>   [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
>   [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
>   [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
>   [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
>   [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
>   [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
>   [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
>   [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
>   [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
>   [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
>   [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
>   [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
>   [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
>   [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
>   [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
>   [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
>   [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
>   [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
>   [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
>   [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
>   [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
>   [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
>   [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
>   [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
>   [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
>   [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
>   [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
>   [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> 
> 
> Build changes
> -------------
> 
>   * Linux: xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9 -> xe-pw-170812v1
> 
>   IGT_9015: c656c9ccd7e45834f4ca191dbf729e7ba4676f6b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-5446-74d5c695a145d1d6394a84ba483549d3310eb2d9: 74d5c695a145d1d6394a84ba483549d3310eb2d9
>   xe-pw-170812v1: 170812v1
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170812v1/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
