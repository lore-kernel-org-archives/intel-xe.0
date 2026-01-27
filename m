Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AB2D2F000
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 11:44:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6269710E55E;
	Tue, 27 Jan 2026 11:44:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b3xyiFdx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FA410E553
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 11:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769514295; x=1801050295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lZUlC2+MRVSS9GQlDH7ZAMcAaKe4OphWCpCCKgt/yeM=;
 b=b3xyiFdxgQYfb7f60H2uOVIj23OeI1ipcTgUsHkTNbgh3uziRwi+S3pP
 oR7mD3sBgJk4zkBRAaN3yzt5GF0IloP149H+QQR0Swc/ms0n+pyVm62M4
 fc8qEmuuphTGU76k1xK2nk4nJlOfNkc/rrMG7VKDqv0RfRSWv4Pv3lgro
 3aoPP0C2GngxHHq/xIVz1uuybuJppOb7sRGnT28EmNZ6SQYnpuK0zjfAX
 yVYjkSqnmePEWLFYE3Oc4lJYHYacYos+jdL50F8Gyrk83ObpPBKWGw9FJ
 8/kCa9/AMMDaQK7UPtbArJv3Ba84TY3iW5a8KqiPKCy4ij+v4XEvBgoaA g==;
X-CSE-ConnectionGUID: V+WYM57eSPm8kwl8/gsDmg==
X-CSE-MsgGUID: 7vgWbDiBR32xdQ0ovLEXQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="73293725"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208,217";a="73293725"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:44:54 -0800
X-CSE-ConnectionGUID: nnZSLZDsRuKOiW+M38NJUA==
X-CSE-MsgGUID: Aj9Nz4uxTk+p5QNR1CG4AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
 d="scan'208,217";a="212419104"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:44:54 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:44:53 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:44:53 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.31)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:44:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLZR/mCKmH3BWN4e3Xt8nw10r9gvHyjyB/yy8RgbI4kZwV9uqS4fw/oD43fhRYl9d5wKXOKWUH5oDUlREATrhqsd88ieql+h48RiCAp20bwM6aYtQZNTXtXbBhyo8E9qqcy7cJaCjn4lBd56ctvA646ftZrcMwdWripg/A8HjXOu/Nk3pyDb2WkTLtXVsI8XKcoxYLOlcA/14j4HxtNqw3HDz3zzkY1hticBuf/3cnGmJcXQ9oQYpZE67MgIoxIE8SiNza4xBHCljWLVy+F+AS7EocWT5sq92Cfik737Fdi3B/lhTkdvxffZCRRtLa4JYnA6R/ldXFmCXjYfH9QQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrnWrYCWdIRFDwPYnPd6lHzCsDNJaNnhB4c/6kDHTi8=;
 b=M1gXbV6+wEqVqFyv8QLcC3JjeeadVzw0sq1vmHX6uqrpp2SAzXMUSSQVV9MjVWXagpihhvyUNOZR1WxJd22mqgmodNw9XcArKG1xduhIrHX/6odaYN/G0d7DoGtdJqnMEUdddkcY9PHXFYeoikgVPL9RX9GlA/omcsGluPc20LBis1ui8umzpaIwpa+YzK4tRU6NiF+zJGoi9m9/+MJUTLQHVGekth+r20Mca04dKo8Os1RGMlMJ3vyml7ltvLRtudIPYT6CDgmbcHXlSTIKglbJoGFvdBkIe55B3GAsbw1toXEleKtkhaWEHq3AyKBdxsINB82DlHLact7ovLoVTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPF8B755DBFD.namprd11.prod.outlook.com (2603:10b6:518:1::d36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Tue, 27 Jan
 2026 11:44:51 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 11:44:51 +0000
Content-Type: multipart/alternative;
 boundary="------------ScTtiBOzfxZ5eqbyrFJzRVh8"
Message-ID: <b9c82350-c32f-4cd3-9d69-c9c7aa1a347a@intel.com>
Date: Tue, 27 Jan 2026 17:14:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/xe/xe_ras: Add support for Uncorrectable
 Core-Compute errors
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-17-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260122100613.3631582-17-riana.tauro@intel.com>
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPF8B755DBFD:EE_
X-MS-Office365-Filtering-Correlation-Id: e12eee2d-0649-412b-bc20-08de5d997ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFA0QVhFMkFxekMwaTZyNDlROGVkVlgycG5yNkxycExtU1ljRk5uRXhiaEhT?=
 =?utf-8?B?UnZuNHBweW1OVGxuT3JWNzlROUNRTUxKUDRHcXJWUkhZWkhxcXFSQnQvVmNx?=
 =?utf-8?B?K3N6Sm1jZWNjc0Ezd2lHVWxSSng5NDJoQldzNGF3VGdtNTVON0F4eHFDWlMz?=
 =?utf-8?B?d1o2c0ZURU1GekQxRnFWZm9LTHhXYjJQaGxMQlVQUHM1a0VndXM2U0xERjZD?=
 =?utf-8?B?OEYwRGNzeVdacUpGSzdnVmI1RDJjMVl3VktXTlhVYmhZUWltT2Z5VWZOWVcx?=
 =?utf-8?B?VERKWHdPNnE2WDA4UzVEdWJ2TVgxaC9lVHBXay9OSitzSTczWFdVUUQzSGtt?=
 =?utf-8?B?RGQxOXRWYjFhd1dVSVRyR2h4RXM4L3BHb0NVL1o5dHpaTjJIRko4azF1M1ds?=
 =?utf-8?B?bW5uSmZPendXUmE3RnJobGZMNHZUQ0dWQmVFdWRwck5ucGVPZ3AzQnM5WTJn?=
 =?utf-8?B?RUwyemxTUTAzSXN2djg5UFhsT3NVQ1pqU0RBLzBpd0lJYXlJVHowelNtOVVq?=
 =?utf-8?B?aHhlZnR6UEwxTEt1N0VwbnZRcHZHMERWYkxBdk92Y2NFV3JqOGJ2cHR4MVFX?=
 =?utf-8?B?ZWJzbUR1dmx5VSs1RlJ0Q0VldVp4ZEd5eTVlQkNIc2k3RHUyZEpCU0p4UVBL?=
 =?utf-8?B?bitkYUlsNldDbWtQS08yTERNWmlQZTkweWpXSmkxTnE0WXJMV2NhbzJsZnJK?=
 =?utf-8?B?eUJHSTdheEpIaHpQS2hrWGl4bnUrTFRWMzJMTk56NHpKV1JVaWZKalFmbWFP?=
 =?utf-8?B?VGY2UDMzWmNyeDB4YlJqc0x3MGNXUEd0anp5VDBxUmorQ0Nldm9iRkNFQ0NZ?=
 =?utf-8?B?TG5RaUpHQmVGTjFuNWZVTmxGSUQwMnlXS25JcWd0REh2UVBVTnFhVG9KaDVN?=
 =?utf-8?B?QWZLQWg4RytrNTE0VlllUFk5K3ZzUU9PdG9iRld1ZWY4Sk9Yc1FGejU4eUhs?=
 =?utf-8?B?cE1JL0FPQjRyZnRjQUhYcEZMWTNyU2ZoM1I5Z1RzWmtOaUp6WWpmbTFKTkFq?=
 =?utf-8?B?VVNWS1Y4b29UbkdVckNOTGhuSVpmQzdyRk5zY01WUGFra2RYcDZpSm9sZjlM?=
 =?utf-8?B?eGxrb2pBVzZyc0hDdWtqV092UnA4TWJXbDRMeFo0U1laMFc4MkxLdXF1Ly9R?=
 =?utf-8?B?UUdnSndtVm9MY0dsZDd5bWY2RWlwQ01qMzJFRW1UZURCNTZRek00Q2N3NTJv?=
 =?utf-8?B?bk9ZZ2xkRGM4MXllRHJUdzQzV1VEeDlENjQ2YmRaeFJqSlI3UENrdkxCWUUw?=
 =?utf-8?B?NDF0TVNKNnBpN2tYVWFvTEt6SG5UeGxQOFQ2VytTRy9wMHFldjA0KzBaWXFq?=
 =?utf-8?B?SXZCa2lsRXF1dENrWkhRN3UwYTl0M0MvL1hHWTBoRUZPcUlSZFVuRTNleDdD?=
 =?utf-8?B?VHRrdjlyRDVPMTJuVTBJOE5ReWt1Y29LMXZtaUl0VTA0RGpYOWdMdHBRVGxo?=
 =?utf-8?B?NFQ1NmFZWlFFZ1BrL2ZCZHVnV2hjK01YcGQ0MHl6Zk9lOHYyQUxDYUpiZUZR?=
 =?utf-8?B?emVLOHllNkU1VUZYVGR3MHFqMEI2UTBPa0ZhbnlDYy9OS3N2aUYyanRiYnpp?=
 =?utf-8?B?TjhkL3BDY2ZJWmM4T0g3Rlg4MGUvK1Frd3N1MVZzZkJCdEs5SXlHeWVvVXN6?=
 =?utf-8?B?YzdmL29uN1VEQTU3TU1sT3BZdjFxNmp4dTRvNnpxS3ZMbm1IL05pWkM5ZXhG?=
 =?utf-8?B?TmgwY1pWSmtSenZiL3JvdllFWitxRURpdE5PbFczRWVzL2NETmhvNEh5bnZI?=
 =?utf-8?B?eklXaldyUHlZWkdaMUhrbE9ldXVGbm9nTzdxVHFqSHk0Qm1lQlpUYlVQUjYy?=
 =?utf-8?B?bTZ4dU5UMzUwbktUejk2eStwV1h4Vk1SK0ZhUVlLQ240T2p3UW4zQUNBMFdJ?=
 =?utf-8?B?RnRMa3ZsbUVlVUVDdUpGVTNMUWY2TWFhTlJNc09JRUlTRkdIQnMwNWkwbytB?=
 =?utf-8?B?SVhiU3ZEQk0xeDR6L0RBOUJBZitmRENpTXo0ZkFWOXZBdHJhVUoycHhRdFVD?=
 =?utf-8?B?ZkVMdVNGejUvTllsaEFVZDRYb2c2b0draitGbkUvR2VETXFwRk53SGZlUVNH?=
 =?utf-8?B?eGM1amE4ZU0zcW5mS05ZY3draWY5V0Q1Nytlb1BRZDZLMzRFVzJMakU2YmlV?=
 =?utf-8?Q?CHGI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3N6N1AxcnlTc0ZrMW12UG9HZ1hqZ0FEaUUvN1hnaExOakhFUTdkc0ZrYWdM?=
 =?utf-8?B?SHlmVjNGZGU0bnQ3c1cxMDNqR0FaTGFyREIyYXBqU0ZIcjZsWlV2MjFZYWZz?=
 =?utf-8?B?WXBUUnd1VlFnR2hzY0VDNlBrc3pUSFQvMWtSSVpxRjNVanlyaUhIbGU5SlhI?=
 =?utf-8?B?SXJubVZJRUhYSDVpME9wYm1ONFRrc0M0aFlBRjFTM201a3pSZ3dSTkRyU0VN?=
 =?utf-8?B?UkJQN0VxWk1wNUlYNE41Qk50R2ltR2t3WVdBazQ4WnlITzdXS0VGUWVMV2Ew?=
 =?utf-8?B?dXVTeWxwamc2L2lmZkREUlB3UlVjQ1NsS0hxdmovTU9OMVZPNmxraEJFemMz?=
 =?utf-8?B?NFZaQys3VVJKYUpoZFdMTDArY0tBYTRwUThidTNxMHBVMXUxQUJXVTV4cVFL?=
 =?utf-8?B?SThtcU0xZGFRQnhjUjBnbzJZYlBDdlVXczBzSGNjd1M1eEV1YUp4SlRYVzlN?=
 =?utf-8?B?UkY0WjYyZExTYnRkRG5EZGt5dXgza2Y2RFV4RXJXZlZpVGtBV1dsODRsTEx5?=
 =?utf-8?B?cFVkK2I0UWVNRW9tZURTTDNLTkRQVVY4Vnloa1o5M0RUbEZSbW05aUFxZnFv?=
 =?utf-8?B?TElUUXRrU3IyYzJ4dEpsR0FYV0FXKzZLWXJaZ2t3NW0rc0FIdzFWaGV4NWU3?=
 =?utf-8?B?S3FTaEZ0dm1mRStDU3BRQi9SRE01dWJvd2tHOENPOGFIL1hxV0NqOEc3eFVj?=
 =?utf-8?B?RzRFVzFBd0V0T3NWVUluc3phYXVlVVVJNTgrSUtEd1laYXY5cExob3pnb0cw?=
 =?utf-8?B?ZFphclZOZDlySGN5OVUya240WU5YVWFVM0lqNG9nT3FQTUl2dGJxMUZoVVFC?=
 =?utf-8?B?VUZBeTlZZk1PTHVyeGs4K0w2OXllZ2NBcG1HaDg1M3U5TTBVUnY3RWNuMnZ1?=
 =?utf-8?B?NWlodm1ZOHhRU21admV1cFRqWjBGL0ZFeHZtOURGeEw1Z0NpTmxNQ3IyMVE4?=
 =?utf-8?B?TlhUUDh6MVlPTlIxVmhYYVJNcGR6MFZiSjdrKzRvMHN1K1BJVnl3Vkc4WFc0?=
 =?utf-8?B?S1l6K2RkMkQ3MmFNL3lxc2k2bHBHQjFmMHJGTmNqekFyRGRpM1NCdTZyQ3h1?=
 =?utf-8?B?N0ZuSmhDV0tNd01BTzJkdG1IMkpiRzROTktZT1ZyZHdIdXV3enE1OS9MNGx5?=
 =?utf-8?B?V1h0eFUzWTY1bk1BcHd4amk1Q3EzMnhnbnpNcDd4YXBMc1l5ejVIY2poeGJU?=
 =?utf-8?B?OS81ODZ5S3c5U0hnMmwwb3ZXTEdpWXgzcld3dGVKeXllSEsyMDBWZXNLMHA2?=
 =?utf-8?B?RExPc0ZaQkpMQkgzUkErMzFsRmtkdjBKUEFSZXFuMWIwVjlWTmQ1R01WN2xJ?=
 =?utf-8?B?MkovalBUU0NLZGpjNW1PVGlhOVdqRWRHZm5YaDZ0UlFLQWxKb0V6TnJxRGdU?=
 =?utf-8?B?Nkc2L2YyTCtYbGVLd2xlRzRpSWRjdXJkS0d4T0ZtWmFiT29MRnNMRXdUUDdZ?=
 =?utf-8?B?eGlKZHo1NjhRU1pBdUEySjN4TUxQZXVNUGF3Y25scENwRU04ZXV0MDB3S3hK?=
 =?utf-8?B?bUppc1RLbEdlMHZBU0ErU0taT2NOTFpmS01icGZFWlVFTHFQY0h1cVorNHA3?=
 =?utf-8?B?Rm90QVlXK3o2N2ZCWkRLdWdIM3daTkUwQWR0K2t3ZFJvVFVzSUpoYTYzVTNY?=
 =?utf-8?B?b0hJeXF1TmxCVjl0TkNRRkJ1aE52SXBOeGhRN2I3TkQ0VDI4T2NzTGpyYzQ1?=
 =?utf-8?B?Q0dzQ243QU9KVUdBVDdNbWtWYmVGSVhGdW5CT1EwaytiSlo3WnRoaVJyYTdL?=
 =?utf-8?B?YjhFWUU3VXhndjhhRXFFTDBYWDhDSCt0SVV1Y1YwNStIYU02NmNLUGxiRFND?=
 =?utf-8?B?dEFkTU41V3J5MjllRmZDQms2bGxJdWJGbjBNZTd3SjZ5RkhUbk54eEEvdFdo?=
 =?utf-8?B?R1Q5emUwZFljR0NhNm81aEZ1aEthTVNWSnUyYXhDOFN4TFduUTgwakhhNW1K?=
 =?utf-8?B?RXZvengyUGZHbXdVZlFrWlVtWDJyTCtMczFBQTdHRTlxaFdkZ1h4VVJYVXN4?=
 =?utf-8?B?OFNteW45OU10ZmJ6RWg0S2xFZUxCUmJSR2FVWGFlaDJyU3pJQk05SWJ1aEpE?=
 =?utf-8?B?NXU1cTZLQXgzTE5sbTQ3OEp3WGhwajV6cjJvUDhKbXc0WjZUVHFWdHlRY0kw?=
 =?utf-8?B?VjdFU29FSGlpdWladyt6Z2pINnV1MTQvZG4wa285L1R5T1RCRE1SaHJDTUJ1?=
 =?utf-8?B?aWtFTXdjZzkvbHJySHd4N0Evckt1TTBqMlVYV0hiWlJnMzRpY3pUelpOTVpH?=
 =?utf-8?B?U2NYcitTT09KeDk3UzBGa0daUUJEcy93MGdMYzFCU2t3SzFQazlyVFAzZnYv?=
 =?utf-8?B?YzFCU0FJMWJpaDg3VzN6Nk45bW42TnU0YjlKM05jVEJLVVdPb2E1dmRrR2xW?=
 =?utf-8?Q?DK74TZX0K0EMDyPo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e12eee2d-0649-412b-bc20-08de5d997ae0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 11:44:51.0336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yg0Mc6/h8J6O3n1bxZpik5x2v+kv2XLa/i6jdikKPEB0MqH1QqRt5b+oUuIcQn1bqaraCEtWjj7ssrAgJYRYL9zojI8PAX2uyrEdkNi3/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8B755DBFD
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

--------------ScTtiBOzfxZ5eqbyrFJzRVh8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Riana,

On 22-01-2026 03:36 pm, Riana Tauro wrote:
> Uncorrectable Core-Compute errors are classified into Global and Local
> errors.
>
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>
> A Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without distrupting the rest of the device.
>
> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
> generated and GuC is notified of the error. The KMD then sets
> the context as non-runnable and initiates an engine reset.
> (TODO: GuC <->KMD communication for the error).
> Since the error is contained and recovered, PCI error handling
> callback returns PCI_ERS_RESULT_RECOVERED.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_ras.h |   3 +
>   2 files changed, 110 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ace08d8d8d46..2a98cb116dc7 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -2,11 +2,16 @@
>   /*
>    * Copyright © 2026 Intel Corporation
>    */
> -#include <linux/pci.h>
> -
>   #include "xe_assert.h"
>   #include "xe_device_types.h"
> +#include "xe_printk.h"
>   #include "xe_ras.h"
> +#include "xe_ras_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
> +#define GLOBAL_UNCORR_ERROR			2
>   
>   /* Severity classification of detected errors */
>   enum xe_ras_severity {
> @@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>   	return xe_ras_components[comp];
>   }
>   
> +static void log_ras_error(struct xe_device *xe, struct xe_ras_error_class *error_class)
> +{
> +	struct xe_ras_error_common common_info = error_class->common;
> +	struct xe_ras_error_product product_info = error_class->product;
> +	u8 tile = product_info.unit.tile;
> +	u32 instance = product_info.unit.instance;
> +	u32 cause = product_info.error_cause.cause;
> +
> +	xe_err(xe, "[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x",
> +	       tile, instance, severity_to_str(xe, common_info.severity),
> +	       comp_to_str(xe, common_info.component), cause);
> +}
> +
> +static pci_ers_result_t handle_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
> +	u8 uncorr_type;
> +
> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
> +	log_ras_error(xe, &arr->error_class);
> +
> +	xe_err(xe, "[RAS]: Core Compute Error: timestamp %llu Uncorrected error type %u\n",
> +	       arr->timestamp, uncorr_type);
> +
> +	/* Request a RESET if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return PCI_ERS_RESULT_NEED_RESET;
> +
> +	/* Local errors are recovered using a engine reset */
> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +/**
> + * xe_ras_process_errors - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
> + * PCI_ERS_RESULT_NEED_RESET otherwise.
> + */
> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
> +	struct xe_ras_get_error_response response;
> +	u32 req_hdr;
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return PCI_ERS_RESULT_NEED_RESET;
> +
> +	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		  FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_SOC_ERROR);
> +
> +	msg_hdr.data = req_hdr;
> +	command.header = msg_hdr;
> +	command.data_out = &response;
> +	command.data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +		rlen = 0;
> +
> +		ret = xe_sysctrl_send_command(xe, &command, &rlen);
> +		if (ret || !rlen) {
> +			xe_err(xe, "[RAS]: Sysctrl error ret %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "[RAS]: Sysctrl response does not match len!!\n");
> +			goto err;
> +		}
> +

  Array bound check is required for response.num_errors. if num_errors 
are more than 3 then potentials security issue (accessing uninitialized 
or arbitrary memory).

Thanks,

-/Mallesh

> +		for (int i = 0; i < response.num_errors; i++) {
> +			struct xe_ras_error_array arr = response.error_arr[i];
> +			struct xe_ras_error_class error_class;
> +			u8 component;
> +
> +			error_class = arr.error_class;
> +			component = error_class.common.component;
> +
> +			if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
> +				ret = handle_compute_errors(xe, &arr);
> +				if (ret == PCI_ERS_RESULT_NEED_RESET)
> +					goto err;
> +			}
> +		}
> +
> +	} while (response.additional_errors);
> +
> +	return PCI_ERS_RESULT_RECOVERED;
> +
> +err:
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
>   #ifdef CONFIG_PCIEAER
>   static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index 14cb973603e7..28400613c9a9 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,8 +6,11 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include <linux/pci.h>
> +
>   struct xe_device;
>   
>   void xe_ras_init(struct xe_device *xe);
> +pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
>   
>   #endif
--------------ScTtiBOzfxZ5eqbyrFJzRVh8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 22-01-2026 03:36 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260122100613.3631582-17-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Uncorrectable Core-Compute errors are classified into Global and Local
errors.

Global error is an error that affects the entire device requiring a
reset. This type of error is not isolated. When an AER is reported and
error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.

A Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without distrupting the rest of the device.

Upon detection of an Uncorrectable Local Core-Compute error, an AER is
generated and GuC is notified of the error. The KMD then sets
the context as non-runnable and initiates an engine reset.
(TODO: GuC &lt;-&gt;KMD communication for the error).
Since the error is contained and recovered, PCI error handling
callback returns PCI_ERS_RESULT_RECOVERED.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c | 109 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_ras.h |   3 +
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ace08d8d8d46..2a98cb116dc7 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -2,11 +2,16 @@
 /*
  * Copyright © 2026 Intel Corporation
  */
-#include &lt;linux/pci.h&gt;
-
 #include &quot;xe_assert.h&quot;
 #include &quot;xe_device_types.h&quot;
+#include &quot;xe_printk.h&quot;
 #include &quot;xe_ras.h&quot;
+#include &quot;xe_ras_types.h&quot;
+#include &quot;xe_sysctrl_mailbox.h&quot;
+#include &quot;xe_sysctrl_mailbox_types.h&quot;
+
+#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
+#define GLOBAL_UNCORR_ERROR			2
 
 /* Severity classification of detected errors */
 enum xe_ras_severity {
@@ -60,6 +65,106 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
 	return xe_ras_components[comp];
 }
 
+static void log_ras_error(struct xe_device *xe, struct xe_ras_error_class *error_class)
+{
+	struct xe_ras_error_common common_info = error_class-&gt;common;
+	struct xe_ras_error_product product_info = error_class-&gt;product;
+	u8 tile = product_info.unit.tile;
+	u32 instance = product_info.unit.instance;
+	u32 cause = product_info.error_cause.cause;
+
+	xe_err(xe, &quot;[RAS]: Tile%u, Instance %u, %s %s Error detected Cause: 0x%x&quot;,
+	       tile, instance, severity_to_str(xe, common_info.severity),
+	       comp_to_str(xe, common_info.component), cause);
+}
+
+static pci_ers_result_t handle_compute_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr-&gt;error_details;
+	u8 uncorr_type;
+
+	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info-&gt;error_log_header);
+	log_ras_error(xe, &amp;arr-&gt;error_class);
+
+	xe_err(xe, &quot;[RAS]: Core Compute Error: timestamp %llu Uncorrected error type %u\n&quot;,
+	       arr-&gt;timestamp, uncorr_type);
+
+	/* Request a RESET if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return PCI_ERS_RESULT_NEED_RESET;
+
+	/* Local errors are recovered using a engine reset */
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+/**
+ * xe_ras_process_errors - Process and contain hardware errors
+ * @xe: xe device instance
+ *
+ * Get error details from system controller and return recovery
+ * method. Called only from PCI error handling.
+ *
+ * Returns: PCI_ERS_RESULT_RECOVERED if recovered or if no recovery needed,
+ * PCI_ERS_RESULT_NEED_RESET otherwise.
+ */
+pci_ers_result_t xe_ras_process_errors(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_sysctrl_mailbox_app_msg_hdr msg_hdr = {0};
+	struct xe_ras_get_error_response response;
+	u32 req_hdr;
+	size_t rlen;
+	int ret;
+
+	if (!xe-&gt;info.has_sysctrl)
+		return PCI_ERS_RESULT_NEED_RESET;
+
+	req_hdr = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		  FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_SOC_ERROR);
+
+	msg_hdr.data = req_hdr;
+	command.header = msg_hdr;
+	command.data_out = &amp;response;
+	command.data_out_len = sizeof(response);
+
+	do {
+		memset(&amp;response, 0, sizeof(response));
+		rlen = 0;
+
+		ret = xe_sysctrl_send_command(xe, &amp;command, &amp;rlen);
+		if (ret || !rlen) {
+			xe_err(xe, &quot;[RAS]: Sysctrl error ret %d\n&quot;, ret);
+			goto err;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, &quot;[RAS]: Sysctrl response does not match len!!\n&quot;);
+			goto err;
+		}
+</pre>
    </blockquote>
    <p>&nbsp;Array bound check is required&nbsp;<span style="white-space: pre-wrap">for response.num_errors</span>. if
      num_errors are more than 3 then potentials security issue
      (accessing uninitialized or arbitrary memory).</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260122100613.3631582-17-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		for (int i = 0; i &lt; response.num_errors; i++) {
+			struct xe_ras_error_array arr = response.error_arr[i];
+			struct xe_ras_error_class error_class;
+			u8 component;
+
+			error_class = arr.error_class;
+			component = error_class.common.component;
+
+			if (component == XE_RAS_COMPONENT_CORE_COMPUTE) {
+				ret = handle_compute_errors(xe, &amp;arr);
+				if (ret == PCI_ERS_RESULT_NEED_RESET)
+					goto err;
+			}
+		}
+
+	} while (response.additional_errors);
+
+	return PCI_ERS_RESULT_RECOVERED;
+
+err:
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
 #ifdef CONFIG_PCIEAER
 static void unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index 14cb973603e7..28400613c9a9 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,8 +6,11 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include &lt;linux/pci.h&gt;
+
 struct xe_device;
 
 void xe_ras_init(struct xe_device *xe);
+pci_ers_result_t xe_ras_process_errors(struct xe_device *xe);
 
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------ScTtiBOzfxZ5eqbyrFJzRVh8--
