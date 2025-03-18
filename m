Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F08C35FF3
	for <intel-xe@archiver.kernel.org>; Tue, 18 Mar 2025 21:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0570310E4CB;
	Tue, 18 Mar 2025 21:35:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fz/Lurbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B5D10E4CB
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Mar 2025 21:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742333735; x=1773869735;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fmmJW3DIW1XnxA1nJh5YFBJ47dB9rAQPIwSDEC1TeBg=;
 b=fz/LurbfCHC8bZMlSaBZ3wjhet9uo761LmqMr9ONPJj185Vl9OzGKtss
 8uvSYg4MXSUe/0dEbxjcEk3ynDRFA8jjiBKaE3ISOUZEM5V1DN3kC4b37
 XnjMGInJ4LN6FnbQvLhvl04RckEFPUjSdlW6R6uVjbGF5vVAJV8hNUZx+
 N5zcZ+BD5LdefwFdjTGtII0EV7oLqleIcpxxFFw0n4XC+bftKhozoOzF1
 5Buq1tJ5TnatOm0ep+3LS+s5cHyco2RFZd68iy/5WLXhKKwN62qRcfpij
 foXbD98MQ0Q4tfcyclljnV7yhrWBd3NLBFuDim6b5M7G+RwPSdnhj0R4q g==;
X-CSE-ConnectionGUID: bFVD+qhVRMiWB0ZBKa8GHw==
X-CSE-MsgGUID: WOqckoh/TImhE3xozc+Tng==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="42671515"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="42671515"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 14:35:32 -0700
X-CSE-ConnectionGUID: R6hV5bqvQ8yrHy7cvJ3Erg==
X-CSE-MsgGUID: 2pp4B9tmTOOgA0EAW+m/6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="127492433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 14:35:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Mar 2025 14:35:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 14:35:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 14:35:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WyIGDq9j6zK87Syd0zs3Hl40neWqwg0q9cC4Fm53/2PE7drtFaygdncLkGuzWpfaddx0O931RM1NzByYS6b7J+nqoJ1HKESs6tr+gSEzU5zKt8DndlEehTfFvLH0IlPMk8WtApkAM2+rRHMfpOifv3f9JODXCNO/i7zsvwu0C6dhzSYykft+TrrUtsDd2qzM5Co9jtqUnZqbxiQDha+6CVm28Igi4eIY6f69Gh1KliajesPZj8kfAHwAUjQG3XwJYWVBk8mjFDIDFRvv+qAl6M4F3M3KnW2Uuv9oBWM1gFrIwEeV6vC4Jt6JUCyyMTxrDytHgoxFxk0eCthLEdaGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juubEs3xRgUln8e9rcNnlwXfKIMM6z6LzWJ+HDqduaw=;
 b=S7X2ag59zT0NteItHTyRy3cosyGC/UW8sEcDbV+h+mhuibYK0urksFGU+IBq8xMjQHDz2Ld3mZLF8BYSUh3DiElPuZUtDPZHpvCl19ClXuieernP0kGobGP2qaYvdJfBLQXQtkaXLwdpi4ZEdQcnZyHUteskj+7AS2Rv9HXi43CwMtdLzw22ameAcAV2gYpXLHmxQEl90NvaESw7CdPxnkuZKzdU3pnl/wOsAID4sf9hhCh8PbRrerkXqL1zalWJlr53I0ietm/TanpRSK8xbeqvDO++nV0kKh2zrx1gCcLLuim4t76syeZD+9FCDThcIfGGpl4FdqpvvwfxwSQPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 21:35:28 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 21:35:28 +0000
Message-ID: <88cd142c-3369-4e05-9de3-e6970d4c1ee9@intel.com>
Date: Tue, 18 Mar 2025 14:35:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/guc: Disable lite restore for MTL
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Zhanjun Dong
 <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250318141802.2516616-1-zhanjun.dong@intel.com>
 <4928bef5-a008-4af2-80ca-d7c5bddeb671@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <4928bef5-a008-4af2-80ca-d7c5bddeb671@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: c21275ca-bed6-40f0-d5ef-08dd6664cd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2YyVHcvbWpoVGFHaUlDa2JobjloM3puN0YzdWI2TE9jczBTN3NGeWdsWGhn?=
 =?utf-8?B?RXg0S2o5dEgySWZFckx2M1NqSjhrM2VkeUsxd25CWFBvVnduT05TODJsQmNa?=
 =?utf-8?B?ei9rQlM0UEM5dkE1c055Um1zYk9mSHM4SzFhdFFFcWFuRUVReVdCWWprWC94?=
 =?utf-8?B?S3FWZ3NTOGZuYit0SWlpdDZnRTVlRVZIb0hjSGNPS2daSmhYQUJ2ZStNclZz?=
 =?utf-8?B?dStSOVBRUUNiay9ESmJMVkkxOUlNTEQ4RHR6VVZmSHE2WnhsODlKL05MN2ww?=
 =?utf-8?B?Z2VkTUhGUW9uRVJXZmsvVlQ0UnJLSWpXMG4yc1dTNHhQTkNjRmZldWMyRFp0?=
 =?utf-8?B?VWlMTFRjUnVtOXhHUTlWVzFva0MwLy9ZODBSR3loUldsSkJQS0FZUC96SElQ?=
 =?utf-8?B?Q2tzMkJKMDk0MC92NnVCWXh6Y0Y5MXpBUFQzVkVacGhmQjgxaXVCcDB3OFhG?=
 =?utf-8?B?bnY0UXdDYUJyN3dOdElEd1BHdGZYRWpFUzZtd1FITFBEWkJwcDBINTV2cis0?=
 =?utf-8?B?M3RvNUEwUmxKUldFSDl2NEoxajk0WUlFa1dES28vbTcyZHVrajJ6M0dndyt4?=
 =?utf-8?B?Y3lSTWNYWHBvaWxwamhQdndjZnFUZlI1cmF3dFd2VUlPaHhjYis1cVNnQUJX?=
 =?utf-8?B?dzVpRWpDL2RaZGJxUlFubVNJVUJOZlNqcjdUdnhsL1FEMWQ2cWFITWdaR3Rh?=
 =?utf-8?B?V0xOeGluN0RlTnBYNGJOcHhxbVZUL0JoRGlCcE1LOXFVK1J3Q0IydE5LRitT?=
 =?utf-8?B?YjNWQVhTc2h2QWhheXBuTEs1M1Zsc2NMenpRVnJaN3Zwa0ZmdWt5UkEyL1hl?=
 =?utf-8?B?cXFxWDd4eHZsTUh3L1ZjNXdYMnAyTzJyUnpLNm5zbEtZb095RGZCSmJCUVZt?=
 =?utf-8?B?ZE04YTJDTkNIZU1IN3c3VE9veEE1SkdLWDRrYVQxWWV2SUVrcTArL2tGVEIv?=
 =?utf-8?B?NlNRcHBWbGVmOVh0YXdQbEVVTHZ6ZlBOYnh1eUdXMjFScjdUbGxlQzNDc3oz?=
 =?utf-8?B?eCtzSDZyRGdORkZIZms0bzBiRUtVdVNPS3NKelpNYjl6dmMrQk90VVZLUmRD?=
 =?utf-8?B?Ry9TNk1wUmkxQ0haaFpwa0toK2tRTzNPUWs4TFcwTzFVOGxkZmxlK2hHZ212?=
 =?utf-8?B?WnNFUHpmUzlVaGVhaXA0Y2dsZkkvZDdZRlZKWXBVanU5NTlmSFpibG5rT1dN?=
 =?utf-8?B?ajNNL0NuNjAxZ2lWNHJqZVR4OXp3c1F2NnVScDV4MldZTzhQNHl4REVLc0Rr?=
 =?utf-8?B?bmtQOHczcW55ZTR5dVhHaktPQ05IWmFjSElScWVPK3QrNi9IMHloYURIRC9V?=
 =?utf-8?B?RzB5NWYwUTJsQWVvSlZ4WEEyVnkzOWhFSGRnMFZ6eGpFaThHNW4zank5Nkpj?=
 =?utf-8?B?VjQ2SlRRUlpLY2lpa3NQemN0VWYxQTZnZnpISWp5US9ORXJjK094d29GSVNV?=
 =?utf-8?B?VndCZXFUTDN6eTdhZkJzSWhZbmVNYnF0M3h5c3dTM0YvSmRmVzhwTFF2dDhO?=
 =?utf-8?B?cFFWME5kNVBmbFpoR3RoSmJscDR4QmVYTCtRQmNwNVcrY0ltNklmd0J1VWta?=
 =?utf-8?B?Z28vNHNuWlZTeUtQZXE2dnRYQmY0dTVCWDRMalJrUXdoMFZMU3VJV0JOZnZJ?=
 =?utf-8?B?ZWdsY3EwY2ZOVG5QYVBuekNRdWtxQ1IxNDRVd21lcDkwbjIyclhld0l6bVBR?=
 =?utf-8?B?dW56c3Z6dS83ZytuSHliQ2pnUnVEVUYvUGRWZEo3R2lvZTRvdnJKVU1xdVJO?=
 =?utf-8?B?bXU1WWs1cDNoZlI0M0tRbzY3Um53VmhzcUFhZTFKc01JMUZNUTFRWllNV1BX?=
 =?utf-8?B?YmlVSjZoLzZoM3hVb3E2SGpORWFhcFlFUFBlS1ovK3ZSQ1lPUjR0V3EyZnZX?=
 =?utf-8?Q?OrxecxQfiDHGM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1I3VkZDUFV2RzlESHBlRHlCV2IvYTNHVFQ4Yk1yQmg2YUxTajVzeFVmVlNl?=
 =?utf-8?B?UDVEK21aaGhZSnAwSW1ka0xuMU9hMG1QZU5lUURPc3RDNmtDOFhQUHdTaG9M?=
 =?utf-8?B?bThMQURYZ096by9XR0dPMmJUMkk4L28wckVpVmJLUEUrbWpkY0RMalNMWkFF?=
 =?utf-8?B?YkkxZ1FOQXZKZTBzOVZlR3hySG5xK0M2ZG16TjRWZ0J0emVucU5vMTRhTVNG?=
 =?utf-8?B?d2oyZXBKd2ZOeTZLQlBRbDNVNE93eWtzNGt1U2tNOHFicUV0bm1VcGZWQ2dJ?=
 =?utf-8?B?Q0ZGUDloSXpYamYwOFpRWEFDcExIZXZhbHRMbUxrd3ZoeXE0Q2UxNDFVR01H?=
 =?utf-8?B?WDhJWGpSNmxTK0hzVXBKdEU3Q2M4QmduSHREUjNjSVBaOFFvVHdPK1ZmTW16?=
 =?utf-8?B?aFJJWDh4Z1pwN2w5amtYNTVqbkNrd2FIdUdPbEs4ZXFMU0ZwK3h1TkpGRVl1?=
 =?utf-8?B?QXAvbzBNMlJvUDNNZVgvcllUQnhNajIxUjJNdjR2RXBLbVVCbG1tb3R4elRK?=
 =?utf-8?B?UHd5YkpqUW1VNXN6bGdqUWFMNlFBU2VYc0FicGlrQzdkK2thSWFWcWRNK1hF?=
 =?utf-8?B?VGQ0UWczVzZWYktaalAzRHdwc1l5LzhOVi9ScWpJeklWZW5TdER4L3lHd2Jj?=
 =?utf-8?B?TGZvQmw5SWVpdTc0ZkxScEV1OTEyRTJDM3A5T0VZZVo0TUFTWC85SzBTT0oy?=
 =?utf-8?B?RXlRTnJhVzh2SXUrODRaZzJaS0RidHBaY1RDdHR4UzhJaDFySkZkS2VGekth?=
 =?utf-8?B?bU4wTlVCa2doY3JLdHErTVI0VUpnU1JrcXI2Ukl2VFlXWnBad1ZtR05wRmFv?=
 =?utf-8?B?bFhQVEtiZ1lqQ3lkNklPOEZob0V4L25JS1BndW1LVVB0MjdVWkRYS2JXYm1N?=
 =?utf-8?B?cTNMU2cxRVltZlpta2RxeENLL1h0SDRkc2hKTmZrOE55cGtmN0FLUU5rYjNx?=
 =?utf-8?B?VkU4Zjc4bVBaV0V4Vmc5OHJlUHN0YWJRUXI4K2FrUkdNS0RuWlVIZnZGSnVP?=
 =?utf-8?B?SS9CWW0wQVg5Wm1nY3hOMVZjbTFHWUREb0dqdksvYm1hVTlHNUNTUXdaKytz?=
 =?utf-8?B?MzBSQzdKMjBCaHdsTkw3clFWT3ZIZC9NcnY1MTVOZStQZ3JTZCtWSlNMZElX?=
 =?utf-8?B?cVpXckNZb2hreHFVUUZWMnRoN3ozdVRXeUNwRXJlQURUTHZGWkFFWUc4UnhS?=
 =?utf-8?B?bGpNTGMva1l3T2NOcDRYOVRHOUFDMTlRTTFwb1U3L0o5SS9IQVlBOE1wUnBQ?=
 =?utf-8?B?bm9lelpCeVh6OEJiRzVCYWh4cGg4V2F1UWE2UWpKWjBPZDlINGJnMzlqZi9Q?=
 =?utf-8?B?dytpWElrUjFTSkJjS21NaGFDTGNGUXZ2OGxMNzJHMzF4Sng3ZjFlcFlCOC8w?=
 =?utf-8?B?M1FCUDN2R2hIMWlnQmFkcVFmcGpaRzlVaWpLOVF1VGdJT25meFhsWERBU08w?=
 =?utf-8?B?eTZ1M3oreDBQRk5OU1hCakRYaERtY3ZCL1JmZmJWYitxL3lrSHUzZlRRZ2pI?=
 =?utf-8?B?MHh1Q2N1QXB1OEFsWDFZRWROMllwZ1dJRlA1RHlxRUdOampHMlpYMWRYODRn?=
 =?utf-8?B?QXJZS1RzQzBnVDRoV29BNWxCbjRINDhkTWNLakNyVGIvU0Z6UjBVRlNzaXlP?=
 =?utf-8?B?SVhJQlpPQXdnaEhKWTQ3Q21maVkxUTdETEE5MmsxaFRHNksxSlMwTXh3bzFj?=
 =?utf-8?B?TXNmTjIzOTYraUt6SndUV2g3SHovWThIOVFSOWF6bzFnZEFiUlEvc1FwYjFZ?=
 =?utf-8?B?YXVNQll1Z2M2NVZCckc5OG1hSW1OM0Fza2pRdnluS1pQWG96VFpZTmFiMXVK?=
 =?utf-8?B?OVhGNGV0Umx4WVk0cVJZcmtzZDJJZE9jdEwxQmFkZTgwU3EzTnRFQ3hORVQx?=
 =?utf-8?B?Q1IxSTNQamNFN3ZoME1sQUlXT1RQZXFLaWQ1c1pxbFhxZTQ3S0QwZXR1T1Bj?=
 =?utf-8?B?TlJOQ2paVUFLaGFydk9ET0FITnJBUE5KN1kreGZ0eEpQQWRodER1a2lDajd0?=
 =?utf-8?B?cGl3aHhhMllDbElIS3ZxMGN1VnFIVDluVTFDOHVWcnJhN0FLZkZ2OU5vWmpo?=
 =?utf-8?B?SUxSR3QwV1RZZk1vcEtxVGpvblFkVExiZW9tS0xUN3hoS1RKbVdWTFNkR2pM?=
 =?utf-8?B?ZmFLRXkwMjBnTEE2cGZ4czBtM0hsdXVNZmVTSElhOStvanppSzA4RDJ5YVky?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c21275ca-bed6-40f0-d5ef-08dd6664cd63
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 21:35:28.7601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYu3DO8/ddOi1fKdrO3RSW0+SiDZ0n6rmWuzrbBxe3FF+k1uUni3f62KRJSVGmdSN6YHeeH4lKQVSFTkTUsc7flca8X8rDpuBC2ORBvO7jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

On 3/18/2025 7:35 AM, Michal Wajdeczko wrote:
> 
> 
> On 18.03.2025 15:18, Zhanjun Dong wrote:
>> Lite restore for MTL is not POR for Xe, then disable it for MTL.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index bc5714a5b36b..0c2629e578d9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -80,7 +80,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *guc)
>>  
>>  static u32 guc_ctl_feature_flags(struct xe_guc *guc)
>>  {
>> -	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;
>> +	u32 flags = (guc_to_xe(guc)->info.platform == XE_METEORLAKE) ?
>> +		    0 : GUC_CTL_ENABLE_LITE_RESTORE;
>> +
> 
> please avoid long conditional initialization code,
> all this could be done in a simpler/unified way:
> 
> 	struct xe_device *xe = guc_to_xe(guc);
> 	u32 flags = 0;
> 
> 	if (xe->info.platform != XE_METEORLAKE)
> 		flags |= GUC_CTL_ENABLE_LITE_RESTORE;
> 
>>  
>>  	if (!guc_to_xe(guc)->info.skip_guc_pc)
>>  		flags |= GUC_CTL_ENABLE_SLPC;
> 

Agreed with this suggestion for clarity. Since GUC_CTL_ENABLE_LITE_RESTORE is
the default suggest just clearing it for MTL instead of an enable-if-not.

	struct xe_device *xe = guc_to_xe(guc);
	u32 flags = GUC_CTL_ENABLE_LITE_RESTORE;

	if (xe->info.platform == XE_METEORLAKE)
		flags &= ~GUC_CTL_ENABLE_LITE_RESTORE;

	if (!xe->info.skip_guc_pc)
		flags |= GUC_CTL_ENABLE_SLPC;

Also, if updated the replace the additional guc_to_xe(guc) in the function.


Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
