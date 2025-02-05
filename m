Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECEAC02194
	for <intel-xe@archiver.kernel.org>; Wed,  5 Feb 2025 11:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82BC10E78D;
	Wed,  5 Feb 2025 11:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M92byd9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 795BB10E7AB
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Feb 2025 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738756664; x=1770292664;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ayFbSZpnmNJwyqGqHzs9kBuzDuhGgZNAWu5btm3MkqU=;
 b=M92byd9OGITgGNNQw4rxmDdP2IWnb+FWi7MIvO2yEjm9SXnYBi2MjQvm
 cFXJEUETwdHLToqsZdxtONx9exmaVOH4VaCHEPpaQSR5wYlu+tgrEityc
 xI+Bd9rxPd8Rzk/JOjJYDxZCQQgsr0myXW+JCkG2RM27TKhDiZT/XX2vt
 2pd72rDP9nGgkMoMkQj99oDxEoybG0p4haackGwGvIZKpRi1Gb4avtzaC
 PgH9el/1uSKyucBysqjMPcS4nUW1b7/hCsqFLUYhx8mdmMqwsbQiYJeQZ
 vtRIYKj8OsmKxzSKNDwOKNihdf568fVZmZG/shQ7cs4VYOc/1pNt3WJs7 g==;
X-CSE-ConnectionGUID: Puekl0e6QVqJ0e5j5Ydp4A==
X-CSE-MsgGUID: Zb7bSlDhTzapbSZrKYed0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39219010"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; d="scan'208";a="39219010"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 03:57:44 -0800
X-CSE-ConnectionGUID: 7HlRTMwSRjuB+I1wHAl8Tg==
X-CSE-MsgGUID: OPEdi1xoRz69eDhLExj4Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114956495"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 03:57:44 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 03:57:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 03:57:42 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 03:57:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O7dXwSf95Mwe8ilRsaDXvfGBG+pdS22UVD3plGK5rbJlMmFus5A/rtnsRuMt1UT5tsuHR8SezLeU8b/CMNkpOJdxUJqjhSLVrKIo0ghCUj/fjsJZrOG1jfxLmvQ0AwJA73GNcukKh2JXPrn2s22wZ/PVahRBbgUkn22jPnrpL5aeCTLEJdAaDUpcK8z5J82Zs2AhIp5nxLKCOSBpqgMi2tAKVJLhNaRK2C913382P/C2E5lP3ibxe3lvyaiw81dHLJ9ED1Tn4ILz+LFKfC/wIlbhWAP9cndWgKNTwW1NAe17w4LPs0KWjUz6D7ayZzJFgbgdC8Vp0t6+VHwyR/zt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTrFjIfnrjMpo4dlRDmmXMwC6TUFeXcHujrytOFGCTk=;
 b=VArvhg9VYi7prJm8MLvSLNSucO22HgioP8MqpvhHuYr98mQ8ORtGBAHs7hBlrjqzkIdm/VL6PXQ/7m+5WhRZXDsAsp6qtpZjHec03GDUvvJLrzhW9GGbe9uBfcUb+iF+cZ8dc6VD26EQto1ZwjL932BjHzgjMwp5ueVyMcRF0hBk28sCtYYrKigkA8pRkItjkI8rlQ89tMtxLuOpaOZz6JZIi/vhi7ZaoRqHgNfnGiOExsGK0KQAkK1okOeHk6XatJlMo2Ri/R3K7dEPPF1nuwfGtsHORXf73zQ2Fi0NXYGgFraJXyZUtJH7YNMxB4mKEgM7ynXsYVfFvWg9RTcFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5135.namprd11.prod.outlook.com (2603:10b6:a03:2db::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Wed, 5 Feb
 2025 11:57:40 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 11:57:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <173778013918.99963.4420744416382785770@b555e5b46a47>
References: <20250124191250.56833-1-gustavo.sousa@intel.com>
 <173778013918.99963.4420744416382785770@b555e5b46a47>
Subject: Re: =?utf-8?b?4pyX?= Xe.CI.Full: failure for drm/i915/dmc_wl: Do not
 check for DMC payload
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
To: Patchwork <patchwork@emeril.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
Date: Wed, 5 Feb 2025 08:57:36 -0300
Message-ID: <173875665602.111435.9816988754782654416@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0371.namprd04.prod.outlook.com
 (2603:10b6:303:81::16) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 0426acb6-c5f6-4cf6-19fd-08dd45dc4a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEJOQ29idk9aWHoyR25Wb21PRW1wVVJ3blBadVBSVmxJcjZSVGRNQ0JJTGJt?=
 =?utf-8?B?enpYTC9ZSVpwUHQyNnhTU2UvS2tZT0VPUG5aWXNZWjV5c2pVbUxpZzFUcVhm?=
 =?utf-8?B?THNNZkZidGYybGlZcCtiSFcxUVFNUGVadnlBYkIzVGlLem9IWGJOMklvUFpp?=
 =?utf-8?B?aGhheVhSbnQ0NVlxd2E0Y2dTb3UrQUQzdkNNTkdLVTZXNHdFUk9FN1oyV2NV?=
 =?utf-8?B?VU42N0ZsMEh1aWl3RTczVklUTjN4Uno3TEFhYnhLQzlUdnNWYmFOWnBIRUd6?=
 =?utf-8?B?dFhXN2h3Q0wyenhhUEZvbXdoVEdRRGpLdWx1MEZtYk5hWGdxcUs5Yy92eHVv?=
 =?utf-8?B?ZGt3UTZOWW9LSFBWQVM0MjVicDdIMUNISWhPZ3BXOXkveW9kWjdnbEc3Wkpo?=
 =?utf-8?B?Q1loVCtMZXp5T2hpMU9FU1pkSUxSSFQzN21YT1RTY3hTaCtZUGtjSnJnaXVC?=
 =?utf-8?B?RnExUDJrWkd2Y1VSNTRBS1JIdWJZVmtySWxCRGVURDI0U2UvMDF0MUFtR3dO?=
 =?utf-8?B?bUZGWk5JU25hOTg1RVBCWDJibEdraEhtM3pzOG1kcnBvTjhoWW8xQnFweDFt?=
 =?utf-8?B?eTVRS25NZ3NreHV1SU9jK09LQ1loUjA4d3QydXZ6R2ZkYmZuSTloTDdFNlRl?=
 =?utf-8?B?TmV1cHRlNUViQXRVRi9ZL3lCTFRMbkpnUlZaeVYrbC9aZ3RNUUxJRDI2cTEv?=
 =?utf-8?B?TzE2QWkxekdGUXczZWR1M0FUaTdWMHI2dkxNSXgzK2ZxWDg0VUN0Rml3SFor?=
 =?utf-8?B?bTltS0FxNTFJd0JSNHN0cTRmc2lmU3kxQmJjNTJ3Um5Dc1B0RDlIZFNJVDZU?=
 =?utf-8?B?aWNibURzOGppZW1mNS9Mc1o5dDdka0JTdjRNSzJjcHJ6OXp4a05UbksrdUha?=
 =?utf-8?B?ZG5EaVdwbm5wR2dJUWpKTVprdWIxb2d6amR5QTN5QjBiTzdEVlh6dUllY2Q4?=
 =?utf-8?B?Z01LLytXYWhwanUvbFJ0RUhoN2J0Q3NGdFhXZ042WlpwMEdURkc5alRHY3h1?=
 =?utf-8?B?Mmt5VHhHK3phVllEWGFVV081NVBiSkNMRlEwb1U1N3JDRnhzK1VWMFROMmwx?=
 =?utf-8?B?R0JRbWNyNG9oT1dCWDVlbGJYU0F6SFA4Vmk3ZVROVEtwQkpDSWg1VFhyM0dm?=
 =?utf-8?B?bHdXTFc1c0lGNkpxc0xPVW1nUEdOdklSdUppSmQrM3ptZm9hUFVJek1vT0cz?=
 =?utf-8?B?d3BxalBndmVLUUlnRWdFTGRoUEdzcHd2ZjVGRG94MjJGbjQxRUxxTjh6ZWlC?=
 =?utf-8?B?Q1g4WlN1VFY4OEczT0FKanE0eE9SVU9TMG1GemowVjQzZUJLYmJ1NDU0cjJt?=
 =?utf-8?B?dklMaVhsT3RlYlUyWWJBcEVLY09zRStzd3ovYkNTZVlRNUlMbkRGNjNaUUNn?=
 =?utf-8?B?ZW16SEtwekJTSVkzWTlnVzRVUis3MC9ieGhBOWkwQlBFTlBIYnM3YklqWUYw?=
 =?utf-8?B?VDNTTDNYVXZFL3lPNmpBL000YUU1QlVJbUtFNUZBWkFHRkFlaUhmMFZqTlRo?=
 =?utf-8?B?SjBMeFo0SjFwdDdsSkNBR2doelhRVVNwTWEvVW01QVhRNERCVXJUZ1FudjRO?=
 =?utf-8?B?UUxVbjVDc05aQ3BvZUxsSmh6VXlZMkY0alBaQ2ljd0hyR2w1amF6bmJ4bXE5?=
 =?utf-8?B?Zm5JY1pLSVB3NFZ5VW9oc3V6eFB1emdVbXpNZU14QUNDcWJyUmdmSFREWlA4?=
 =?utf-8?B?L2VHcFZCb3VnYkpsTkdhU0h5bDBhZDVINVhIbzhhV3BLNmMwcFY0WEVnYjBq?=
 =?utf-8?B?QTFkcGxmdFpTZG12L3RCSkVLRWdzRlRVaGlGalo0dUI1MDNYMW5zVTFBRVVr?=
 =?utf-8?B?MWJkbW00OUU3ajAzS1lDdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djNyL01LcTcyb3VZNzF1ampDVUJHUXVlRXNXSTNwUjFESGxIVkRVVmE0aUJp?=
 =?utf-8?B?K2d0ZHZSdDFQWVBoNUpMRGhMUlpMVUYxUmlZY3FyMGlYMnNjOFFSYUFJRnJq?=
 =?utf-8?B?KzRVejBvT0U5c0Noa3pjTGxqeG9wbXduellIMU1UQTEyWkJlVlN5b1FKRnVT?=
 =?utf-8?B?ZFBsOUJ0WGl0MTdMVGdrQ3VPeUZ3VlJyaVNzV0VlZzNhU1N0RDQ2cGlPNmN3?=
 =?utf-8?B?OHhreXdDQ2JyQzNZYUh4VXJuVjV5WklSdVpLRjlwbTZwQ2Yra0tHUkszN1Fn?=
 =?utf-8?B?aUxZeXFwSGdsYW1rTWRFVzZsWi94blZCRnZsU3p1NnEwdVM0M0YxNVBtT1pE?=
 =?utf-8?B?SDlIdDFYWmNOYmlPV3ZjT3FOTDhwSzR2UHhQN21IK1A3ZDB0V09HQy9sUHZY?=
 =?utf-8?B?MVZ0YmdHd0NqUWxkL3JXdlg4UUltYmtRWG1GQW9KK044MTVLVGVJWHRMc1ZR?=
 =?utf-8?B?akpVSU04UkxzWFEwUmcvZS9uQWhIdi95ajhIelpWb1hjUzk4RWxBYnpsZUor?=
 =?utf-8?B?dmNCYkI4eGdjZVU4L2xWQytPcExtd3V1YmVGYTdVYU5BMDFzK0xnak81UC9w?=
 =?utf-8?B?YVRmbzdwYXpoMFRRMjF5QlU5Q0t4eHUvRFpEMzAxNXBXOENvNnovZ2RwclF3?=
 =?utf-8?B?Z3c1Qy9OU21EdWxzY1JxTitQdzlqZ2VXdHJ0UHEzVUdjTkwzaklCQnc1Mml4?=
 =?utf-8?B?NUZVRlpuMks2c2NieWZlbVFNZU0zeUpoNnF4NUhtaCtWbzFtcXExOFF4L2Z5?=
 =?utf-8?B?Ukc5SFViL3FhMnU1TTVBTmlEcjN0dEQxcnY0ZjFsbk8xRnhvUWtkeld5dUVZ?=
 =?utf-8?B?ZW9FZnRON0l1VXd6cTYvcUNMSUNvYUVmOFpzOEZZNms4eVY0b2FIQjdQZnRQ?=
 =?utf-8?B?STdGVm9UYlhhTHptSWJNOC82YXBoa0RMcWhGb29EZU1pSkh4Q2Y2VUwzcjQx?=
 =?utf-8?B?U1NjUVpKamdxeTFpTVNoWkdDdmdUclZjS1BjS2U3Ymwzak1YK3kwdjR0WnFV?=
 =?utf-8?B?YWtBcFNNdnIweWc1TWlDQjMzQXhId0l4T2V6L29SSFJGbHVGYVExRlZoVHZ2?=
 =?utf-8?B?WU1aQmlvQTllbllvWGV5QkZKZVFJa2lzelFoMytpL2Nia2JXWXREMzJNNE9J?=
 =?utf-8?B?ak02VUlaZWVaNTQ3akR4ZVcyNzJGNEhVL0g5d09xUlVSbUExdGdUV0c3K0dZ?=
 =?utf-8?B?SDN3SkFxYjNvRW9jM3FaVE5ycEc4V2ppWkxLZG5idC93ZkFTWXVPbDRGdHZU?=
 =?utf-8?B?NWFVWHBzcjdTK0pFZ3NFak5DRllZNjAya0FkdkxrcTVWSWNyaXpMY0tqdzlM?=
 =?utf-8?B?VUQ5MEZuRHBSSzdWUEE1OGlrUmxYT3QrN0didHczRjVUc1A0QWpSQUdORXM0?=
 =?utf-8?B?b1J2d3d1WUFiN0FrT0liWXM4dC8xQjRGSy9rWGRrSWRVWk9HWkxwa1QvQTJr?=
 =?utf-8?B?aG1xRmVrdHB3aWx4N0E0U0pjQVltbS8vUEtVbW41ejR6ZDdabm5NWXFmc2o5?=
 =?utf-8?B?UHB2czFqSW53bDJhSHNHZ0VnRTV4RHVuREFFZjVpNnBCQXdibkJXaFdERk9o?=
 =?utf-8?B?eXFwTkFVZE94aFk1MDVKblpxQTRDZEp1UHFjSU96YnZKMUc2LzJpV3IzRFJJ?=
 =?utf-8?B?dERneEZSY2haSi9IT1NnRHBKNXNmSnhpQmFWcTRKcTBFeEgxNjBYVUVKOUx0?=
 =?utf-8?B?bW5XL3lEZG4yTnNvaU4vbzk4THpxNTNnUDN4R29uc1lMMnNiVzBuamVYMHRB?=
 =?utf-8?B?NkNBMnpFYXJGN2I4YXVFRU1qSjVocmRpYytIN1E5R3ZkTldsK3VIbnlyMWdK?=
 =?utf-8?B?dUpNdXRNSEdIMkpjT0twZGtYTXlqZUdTRmxscWpRVmtsekFNMnZxemQxNHYx?=
 =?utf-8?B?UUgweHZPWlVxQU10OUNvMlhkUWE3OFphU3ZoUUFsT0ZmU1l2QXYrYmloK2dV?=
 =?utf-8?B?Nm5HeXhmTDdNZVRYTWE5Sk1qOWNXNG5PdmRXbkM3T2RGb244cmdFSXNsekNy?=
 =?utf-8?B?alB0Uzk3R21WVXZnb2JhcnE1eG9PTDl3RTNiZzdpTWJ3dGw5UjVRYUM3aUtU?=
 =?utf-8?B?L3RCOE15Z3VqeHZqWHFkRVcwY0VaQ1RyUmRPcVhrUlN4VE9RODVtQ1c1ZU1y?=
 =?utf-8?B?WGc0T0JUYjJTNGVXdGhWQ3BzU0EzTEt6Q09HOHd1U0lRMnpEWmlmaWlzWTlE?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0426acb6-c5f6-4cf6-19fd-08dd45dc4a37
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 11:57:39.8149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVc5dOPFzLCwg9DaIIps6NkaTh3m/aTAmweBb2pjv7EvPSonAVYKfDzUZJWtSabLauc4IJtmtk5HIyb3Eu4Dag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5135
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

Quoting Patchwork (2025-01-25 01:42:19-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: drm/i915/dmc_wl: Do not check for DMC payload
>URL   : https://patchwork.freedesktop.org/series/143950/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from xe-2549-b36df02c99e3246ba2a90e951c71797327374db7=
_full -> xe-pw-143950v1_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with xe-pw-143950v1_full absolutely need =
to be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in xe-pw-143950v1_full, please notify your bug team (I915-ci-=
infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
> =20
>
>Participating hosts (4 -> 4)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in xe-pw-1439=
50v1_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
>    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][1] +1 other test dmesg-wa=
rn
>   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143950v1/shard-dg2=
-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

This maps to https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212 .

>
>  * igt@xe_pm@s2idle-basic-exec:
>    - shard-adlp:         [PASS][2] -> [DMESG-WARN][3] +4 other tests dmes=
g-warn
>   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
>   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143950v1/shard-adl=
p-2/igt@xe_pm@s2idle-basic-exec.html

This maps to
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4391 .

>
>  * igt@xe_pm_residency@gt-c6-freeze:
>    - shard-dg2-set2:     [PASS][4] -> [ABORT][5] +1 other test abort
>   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2549-b36df02c99e3246b=
a2a90e951c71797327374db7/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.htm=
l
>   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143950v1/shard-dg2=
-432/igt@xe_pm_residency@gt-c6-freeze.html

Aborted due to network issues between runner and the test machine.

--
Gustavo Sousa
