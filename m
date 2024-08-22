Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C353C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Aug 2024 10:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A9E10E846;
	Thu, 22 Aug 2024 10:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7LKPoZC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1657F10E846
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Aug 2024 10:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724323687; x=1755859687;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=oEOMXUn2VyvooGUTuRZEyM3nASIvFDsP/fXiEdBz+Xw=;
 b=G7LKPoZCh1VT4MTNaMnFslrylGfRSylRxxP8nlqo3z3RYYWjiFR7iMAc
 3cmrzzuwXTqOwKBNEZp2npDfprejYjfOY2zpDSVMMDbvRCNyKr8U/kQ9U
 kIXjeAKdqxHDP+spaggUf+VgUOEnbg6elv/bhat+kIak+dm11eao8Z1fA
 ketfxgkJ6heQN/Hb4I66WA9TT/jEIXDjqgfhWfQRokl47S8B56suIwmfe
 mw6IFELZUprbjSLMc68+2qxYks+dqJY0J10DDvmwL3a0isx5l9HwDKweG
 oSZ9eXSCNnqP7AI5sGXZuDK3SsC8cNMizwI6+Wkb5+/ls38sBuzJqZTJc Q==;
X-CSE-ConnectionGUID: szmW/QsaRE6OTD4OTqM4YQ==
X-CSE-MsgGUID: pwKUkxmAQ0m/Y8FFCiTK1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22908956"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22908956"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 03:48:07 -0700
X-CSE-ConnectionGUID: ZqjfDrnRSb20YkkbiJVY2w==
X-CSE-MsgGUID: ku+CKlG6QlqfUW1n59hUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61408111"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 03:48:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 03:48:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 03:48:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 03:48:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 03:48:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mmcDWYpcaYc7xrFSSedUToAhbUDwgE2hA8+GjbP+67AmIrtRflGZ2dwFuwQe1YR+0HNiSJ1gfeCqiYng4lavGGkjU4SS2HWmXoF9TWgviyakcSoK2CItNW1lEnj9tx6e7Xwz4jjRJVWkLPOMbDs2S8P1Lc5hh6gKoJfS6zdgH6kdNhuzvAqBnJ9O8nYqG7Sob7DDISmazW6Is/u+ZaUGeRp8BN3fbeQ3engvBtevQBT5HopkT/+4UHkhtRCdW17omMCiGXTpphp+kH8nWOTAxV0E4OuzkSsQcCbOaq2tOEpeqqMA6o12OKVPlDm4mvkngnOKxmEHfywKfON/bYZC4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocsCpHuA6fGlcp4llvvm4W8cP2YmZa+bT7MbugQygTI=;
 b=QVJtV1GjeBtNXXsazio6YeTAot0oY4MJrLBIyKreB3AlDWnZhpxrA75A/Q4kcqIceKPaqOvma1YxzCletoUZ8sPSJcJkqW2n2HZyyDBWVyhHH0ENmw4G4hoZGiI5Az/UmQlGSNrMzmkh/ZOwyJVrbMcY72DCFTaoZEIGVaOh5NayFxQmrdCVa1MqPfVOyZ8D8vVYYxtjepjFIFTVDiAk28DgJ5SkRE/EnoydE0yRBxCcAC0Cvwwfka7Sq5gAep5UBVrytvxWBtSoNunKOZl2tBfVLp0TtJnqyJLr33U/stcelOHjGaHcKC3N+l6hEje0ovv2fmE4unx5VmSNvxLu/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CH0PR11MB8165.namprd11.prod.outlook.com (2603:10b6:610:18e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 10:48:00 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%3]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 10:48:00 +0000
Date: Thu, 22 Aug 2024 12:47:57 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 11/12] drm/xe/tests: Add KUnit tests for VF control state
 machines
Message-ID: <20240822104757.lazzcxdxtxfmdeap@intel.com>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809165159.662-12-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DUZPR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::14) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CH0PR11MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 52ea0664-300d-4760-a9d9-08dcc297e41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGhLTXB1QloramxOUkROWXc4RlpOQXRrWGdzMHRVeDMzTHozejByWXF1RlJS?=
 =?utf-8?B?R3dZbTN3azlpOHdBNmUyc1VQdjN4eTFnL0dyd0YvNDhJbFh4TjhGT2cxOUNs?=
 =?utf-8?B?c0hLWjREODg1djlaMXVOWW9uOTlxV1ZRNVdUWjZoTkNuY2VQRnFzVGYvQVJD?=
 =?utf-8?B?KzNYSHJqa2l4TjBVaG1kNXJXVjhIOHdnSkR1U1g2ZmUvNXl2QVA2VzNqekZm?=
 =?utf-8?B?ZUs1dzlDdjBjZlo2SStjcEx6blNJaFhSUVU4VEJxUDFlM3E5SkYvNUF6bG1v?=
 =?utf-8?B?dGVhZWEvZDZVVHNtclhYR2l1QmhDRXFWcm5QYnBwejlNQ2xPUE10Mmk2ZEJi?=
 =?utf-8?B?U0YveWxacUQwdVd1Q21Bc3JOcks4UGRHaFlpQUFKdVc4OE5vYWVyQ2wzY3J5?=
 =?utf-8?B?RnBuYTkxK0I5dUdWQm9UeTR5NW9sNlhIV1pnZ2cwcW9wUzBGU3NBQjdBaDUy?=
 =?utf-8?B?QU9NWnh5NXhNWEk5c2JEaTRqU3BvRytQeVZvdHVLKzJsd0JJRzhVTnNKUk5R?=
 =?utf-8?B?bjE5SUdNeSs5WHplQUVJNFJkaXZHek5LUHBnUGJ2TGx1Ni8rQmNCWHYrZGpN?=
 =?utf-8?B?cFJIemJPVVZ1aGxaM0JubllZK3A1UUNWTEY2eTJRQVJ6ZUdLaTNvM25DWWRE?=
 =?utf-8?B?cUUxTHdzWmQ2L3VpaWE5NGM1eWFhTjFGM0dCUU1IT1h2aWtlSGRWRXROeUdF?=
 =?utf-8?B?RzV3ejlXelZ4WnJ1bHpUTFFmZHJ1WmVjejFOc0tpNmFvc1J5SmlENUFNMVRw?=
 =?utf-8?B?amZMNWNmOU5JaForRGl2MWlnZ05xVExvUHFKckcvb1gzS3AyemFkVGZBNkYz?=
 =?utf-8?B?SlI4b3VJK09ORHhjWUpxeXZtaEhTRmkvWERBakVWM3hTUmRYcHZteWxOTjlL?=
 =?utf-8?B?bFhqcGhZK2F4bjhYY3VCV3ZkQ1NMWDhPTDNmL3E5cGhBS3J3di9BRkVXVURE?=
 =?utf-8?B?VDBOcGVGcG5RUWlDQWxhYThBbkRibXB0SGQydW03Vm1tTWI4SDJ5V3JtL3RX?=
 =?utf-8?B?QmFRRkc1OGgxQTg1bXlqa1JVS2dwNkxiancwd3V4WlBlRjlvMjREYXVEOTZk?=
 =?utf-8?B?WHJEQ0ptWldZRWo4U0Rya2Z1NjVTYVplSFVVOERXSW1DbjFGY2NHK0VXNWZB?=
 =?utf-8?B?VWc4U1o5b2lRbTVYOTRmb3ZqSEkveGt1OGFFRHJQOVlmRU95L1ViVkhZOWp3?=
 =?utf-8?B?cWFSVzBDSmUyUGlucFA3ZEowZWtDeHJ2b0l4SUFDdWtPbnYxakpRODI0QVA0?=
 =?utf-8?B?MTZjSFY2S3A3cHBWM1RZb3NYN3F3TmxXazBUMUI4NEY0NGp2TGI1RzVYMVB3?=
 =?utf-8?B?NmhGSVBkRXI0RzRYNkdXbEJzY0s5bkN2UzFzVDBadVdLQU16OXQzMkNGZ2xI?=
 =?utf-8?B?TmlOall2SGdVVHVwZ1hkdW1Ya1FzRFJnYlUrVVJZOVBBMklhMUlFUVIvQlc2?=
 =?utf-8?B?bU9rcVdNVUhuZ3FtTC9IQUZWVDlFSlFraVU0YW5RQWFMaFVqUXcwZG9aQlg1?=
 =?utf-8?B?clkvTXZCMVd2aXhNcFo3b1lpK3JvZVVHTEhQTEZXUmVZbE1scGhYME12OUw5?=
 =?utf-8?B?emdZOVQ4cER5ODM4bU1xNEhoaGhuQlNHcER2MklJZlQ0TWo1bis1aFd2a1ZI?=
 =?utf-8?B?SVdBMDVzRXZXRFBES0RabTVRZEJBaUs0UXRxcVE4a2IwZUFPWXJhd25JdUV5?=
 =?utf-8?B?azZIa0lzbjcyZ1RhRzU1R2tTMGVaNEtadlNrUlc4K0N0OEMwSkpTdFV4eVhL?=
 =?utf-8?B?UGc2QVdtZnpKcUhyRVExcVRWWUU3Y2RSS2dhM1JvQWtoWmhNQ0lDbHFlRG5s?=
 =?utf-8?Q?XB0LJtW+cHQXNKH3+4FnX0fk1Fm778KEWkXo8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXVDM1RHYnM5OUQwS2ZRMzVaUnc5ZmIxdnFaa0hOSk5NMzl5YW85Q081dDln?=
 =?utf-8?B?ZXFyR05KcWhHMndSQ1NzS2FpWEwvcDRXZnhxc3BucXdvVUhxV25BWlpZWlRt?=
 =?utf-8?B?Uno2VGNaMGg5TmxtTldabHJzaTAvMjFFRm56N011WisrRlFHc1Z2NXZRejQv?=
 =?utf-8?B?d3BDd3RObzRiUTNDM1dhRWtadU9nQnJJdEdPMzJYczk5U3d1UDBFUnZoQVR4?=
 =?utf-8?B?b1U5VS9ZcmhnSXA1aVI3VFNsT1hSQXh6SFlRbkd6aFQ0d3pkb3gydzVuRXNG?=
 =?utf-8?B?a2o1cUpYQmZ0UHpmbisrOXh1SlA0ZVYyV1M1SFFjdVhGdVhQN1ZYRUZSZ2hZ?=
 =?utf-8?B?UUszNnpPSG9jYzV3WnVwcTlaRGFWc3VuV3JZNkFPT21sRnBrUk9NS0w0S2Ir?=
 =?utf-8?B?RWdZdmh2WGRrUWtLMVdNcmY5bU4zMVdqODVUaWZKSEN4LzVwMjFPN0h6eitQ?=
 =?utf-8?B?MFAxOU50bVN0MXh5M1ppRjAvalZYU0ZnOVZza041UUdPVGU0RGZ2azVXb2tE?=
 =?utf-8?B?WnlBcU4ycUdBYWg0eENsSHlWY0pDSXRmalVDU1JuaEIrdzZGK09IdDA4MFdO?=
 =?utf-8?B?K3JtZEF0UUpEcGVDQXhnM3ppRVEwL2lINGpkR1FvOGpxZU5kRVUwa2RFdTda?=
 =?utf-8?B?d3JEQ0Z5OS8xSEgyc1pNQ0dlWXdrSFdkVFBSSHRPT2lJZzhYTGh0M1hJdjJy?=
 =?utf-8?B?VlRiNDY0bmY2dDRuUnB6a2VlUGNLaThSN3pKR0Vtd1ZscFhQZFFhenFHR0ND?=
 =?utf-8?B?eUIwUzB1alZJTTNic1N6MXVFaXRuZ21DbTM4VnoxWkR3b2NuL1dNcnVmVldX?=
 =?utf-8?B?K1NkakpMYXFmS1VWVlZHNE5UdDRJOW9RWEUyRXFnbVYyVnVsUnRYdWp0T0Vk?=
 =?utf-8?B?cTczbm80NWRBWDZ1clN6Zkc3VVhxMjlvTExjQng3MFpKajJja3F3a0FXMXZt?=
 =?utf-8?B?T0VtRHVFZlNGUjUwQWpxOEF5YTBCV2dHVlREdjNpd3FEdzZFMjFjbUlraDBL?=
 =?utf-8?B?c2FhaXJKdnNTZDViVzEyK1o4UFpkc3JzRDFOd3BUT0V5c0lQQXVKYnMzUEZL?=
 =?utf-8?B?eTIvRXZPUTBSZnZLQlhRM3VRK2RzWms3YXdVKzJ6OGlFK0kwTjF0dExUK05L?=
 =?utf-8?B?VnFtSVhNblZBcU1URzZWYllGZ0l0UFFNbDkyL2RFNjd6QUdhMURCSnVQQnE4?=
 =?utf-8?B?UWI0Zk9jcGpiR05wbVJtY2ZIUmw2QmdOT2dxZGlmakR5YmNJbW00ZnI5TktE?=
 =?utf-8?B?amVaVCtDODcxdE5uMDhXTFFDU3hwTWxyYjcxdGZMbzFUUEgyZ0xjbStnUDdn?=
 =?utf-8?B?Y2NkQi96UjB1Q1VZL2ROUTBDT2hFOTZ4dFF1UkFHZWk2d3JqWTRkTWpFdDRG?=
 =?utf-8?B?SURnTDNmeEJoNC9Ec05RM0FQTjJpZ3lEZmFoLzRqbEVISFo0Q0FrbW56ZmxY?=
 =?utf-8?B?Wit4ckt6UEkyaGJWejNkYkFDUmpYaHpaZ0hKZy9CQ0ZzTlV1SEFvbm0rR0VP?=
 =?utf-8?B?b0h4TW1IL0lZc045K3krMHZNclJKamI0WlVkV1hUTXFqL01SeTh6aGVXVFdV?=
 =?utf-8?B?V3BIZEFqdXFBUHh4MXNENTlKZDg0SHY5dDdHZzljcmErNE5IWjI5SjZiUmR2?=
 =?utf-8?B?SFpIcHd0K2NMQXYxeFQ2VDBibjFNMXIzZWpGaHNmNml6NkZRWm5jSVdXM3RT?=
 =?utf-8?B?KzJNd2Jyd3VNOTluZzdVMEhlUEhFLzBTNkhFY2tnV2xHK1ZXWkcyMERUTCsv?=
 =?utf-8?B?czJMZmh3VUxQQ3NwTW9YWGZxcVEzSXBEdmM4NWxhMEJEVmQ4ZHlRZEpaZE1q?=
 =?utf-8?B?dUs5M1YxdTQ0SkF0SUlMaUxPVzZ3alAvUVlTVFRrZEd1eXBvTnZqMGhKOU41?=
 =?utf-8?B?Wms1ZFFndnNCWWxUQUZsU0tZRkZmODdqclZXSUp3RGdYSFcxQ3VLZW1hYXRM?=
 =?utf-8?B?YlhzQ2V4Y2xtVVhpRnhmclAxczRwRFcxVkxDa1F4Z0p0QndIbE5JTTE1MDlV?=
 =?utf-8?B?ZGNiMm55VTR6cFJwTGJvS24yTzlqbUlpUlN1blRGTVNjZ3FPRDZHd0VFb2JY?=
 =?utf-8?B?QTA3Tk9MQm1EdWhzREpFQWZzQmFjcmV1UUYzbGtuMGdVLy9mZ2N6cHBoTGxX?=
 =?utf-8?B?SEF3TVU3OWQyVFkvNytPa05LTzdmd3paazY0RnoyNlRDY2g5b1dCcWJwWGRl?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52ea0664-300d-4760-a9d9-08dcc297e41a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:48:00.5241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzCTWZF3MfoMRa5Cy8eQqy0ZYGL0InDruRT5iZJCVNp+xu2YIoY7OpnbZQBjPZSipJ3q4CoECiLNxgbum15kUZeOyy7cMyaowpFfG254F2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8165
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2024-sie-09 18:51:58 +0200]:
> Add KUnit tests (~200) for all VF control state machines (FLR,
> PAUSE, STOP and RESUME) to make sure they work as expected and
> will not be broken while extending them with new functionality.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
> Test file named according to the new best practices [1]
> [1] https://lore.kernel.org/linux-hardening/20240724201354.make.730-kees@kernel.org/
> ---
>  .../xe/tests/xe_gt_sriov_pf_control_kunit.c   | 1360 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |    7 +
>  2 files changed, 1367 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> new file mode 100644
> index 000000000000..4252577b4bbd
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_control_kunit.c
> @@ -0,0 +1,1360 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +#include <kunit/static_stub.h>
> +
> +#include "tests/xe_kunit_helpers.h"
> +#include "tests/xe_pci_test.h"
> +
> +#include "xe_gt_sriov_pf.h"
> +
> +static const unsigned int DUT_NUM_VFS = 2;
> +static const unsigned int VFUT1 = VFID(1);
> +static const unsigned int VFUT2 = VFID(2);
> +
> +static void dump_state(void *arg)
> +{
> +	struct xe_gt *gt = arg;
> +
> +	pf_dump_vf_state(gt, VFUT1);
> +}
> +
> +static unsigned long replacement_timeout(enum xe_gt_sriov_control_bits bit)
> +{
> +	return HZ;
> +}
> +
> +static int pf_control_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_device *xe;
> +	struct xe_gt *gt;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	xe->sriov.pf.driver_max_vfs = DUT_NUM_VFS;
> +	KUNIT_EXPECT_NE(test, xe_sriov_pf_get_totalvfs(xe), 0);
> +
> +	gt = xe_device_get_gt(xe, 0);
> +	KUNIT_ASSERT_EQ(test, xe_gt_sriov_pf_init_early(gt), 0);
> +
> +	KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT1));
> +	KUNIT_ASSERT_EQ(test, 0ul, *__pf_peek_vf_state(gt, VFUT2));
> +
> +	KUNIT_EXPECT_EQ(test, 0, kunit_add_action_or_reset(test, dump_state, gt));
> +
> +	kunit_activate_static_stub(test, pf_get_default_timeout, replacement_timeout);
> +
> +	test->priv = gt;
> +	return 0;
> +}
> +
> +static int sanitize_vf_resources_fail(struct xe_gt *gt, u32 vfid, long timeout)
> +{
> +	return -ETIMEDOUT;
> +}
> +
> +static int send_vf_control_cmd_reject(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return -EIO;
> +}
> +
> +static int send_vf_control_cmd_fail(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return -ENODEV;
> +}
> +
> +static int send_vf_control_cmd_pass_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return 0;
> +}
> +
> +static int send_vf_control_cmd_pass_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	switch (cmd) {
> +	case GUC_PF_TRIGGER_VF_PAUSE:
> +		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_PAUSE_DONE);
> +		break;
> +	case GUC_PF_TRIGGER_VF_FLR_START:
> +		pf_handle_vf_event(gt, vfid, GUC_PF_NOTIFY_VF_FLR_DONE);
> +		break;
> +	case GUC_PF_TRIGGER_VF_RESUME:
> +	case GUC_PF_TRIGGER_VF_STOP:
> +	case GUC_PF_TRIGGER_VF_FLR_FINISH:
> +		break;
> +	default:
> +		return -EPROTO;
> +	}
> +	return 0;
> +}
> +
> +static int send_vf_control_cmd_busy_wait(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	schedule_timeout_interruptible(HZ / 20);
> +	return -EBUSY;
> +}
> +
> +static int send_vf_control_cmd_pass_but_reply_flr_only(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_FLR_START ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_pass_no_reply(gt, vfid, cmd);
> +}
> +
> +static int send_vf_control_cmd_busy_except_flr(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_FLR_START || cmd == GUC_PF_TRIGGER_VF_FLR_FINISH ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
> +}
> +
> +static int send_vf_control_cmd_busy_except_stop(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	return cmd == GUC_PF_TRIGGER_VF_STOP ?
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd) :
> +		send_vf_control_cmd_busy_wait(gt, vfid, cmd);
> +}
> +
> +static int BUSY_MAGIC = 3;
> +
> +static int send_vf_control_cmd_busy_no_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	static int counter;
> +
> +	return ++counter % BUSY_MAGIC ? -EBUSY : 0;
> +}
> +
> +static int send_vf_control_cmd_busy_and_reply(struct xe_gt *gt, unsigned int vfid, u32 cmd)
> +{
> +	static int counter;
> +
> +	return ++counter % BUSY_MAGIC ? -EBUSY :
> +		send_vf_control_cmd_pass_and_reply(gt, vfid, cmd);
> +}
> +
> +static const enum xe_gt_sriov_control_bits ready[] = {
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting_paused[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_starting_stopped[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_START,
> +	XE_GT_SRIOV_STATE_STOPPED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_waiting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WAIT_GUC,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_guc_done[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_GUC_DONE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_resetting[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_RESET_CONFIG,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_finishing[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_FLR_WIP,
> +	XE_GT_SRIOV_STATE_FLR_SEND_FINISH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits flr_failed[] = {
> +	XE_GT_SRIOV_STATE_FLR_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopping[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopping_paused[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_STOP_WIP,
> +	XE_GT_SRIOV_STATE_STOP_SEND_STOP,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stop_failed[] = {
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stop_rejected[] = {
> +	XE_GT_SRIOV_STATE_STOP_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits stopped[] = {
> +	XE_GT_SRIOV_STATE_STOPPED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing_wait_guc[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pausing_guc_done[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSE_GUC_DONE,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pause_failed[] = {
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits pause_rejected[] = {
> +	XE_GT_SRIOV_STATE_PAUSE_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits paused[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resuming[] = {
> +	XE_GT_SRIOV_STATE_WIP,
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_WIP,
> +	XE_GT_SRIOV_STATE_RESUME_SEND_RESUME,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resume_failed[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resume_rejected[] = {
> +	XE_GT_SRIOV_STATE_PAUSED,
> +	XE_GT_SRIOV_STATE_RESUME_FAILED,
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +static const enum xe_gt_sriov_control_bits resumed[] = {
> +	XE_GT_SRIOV_STATE_RESUMED,
> +};
> +
> +static const enum xe_gt_sriov_control_bits mismatch[] = {
> +	XE_GT_SRIOV_STATE_MISMATCH,
> +};
> +
> +struct state_param {
> +	const char *name;
> +	const enum xe_gt_sriov_control_bits *bits;
> +	size_t num_bits;
> +};
> +
> +static void state_param_get_desc(struct state_param *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "%s", p->name);
> +}
> +
> +#define MAKE_STATE_PARAM(X) { .name = #X, .bits = X, .num_bits = ARRAY_SIZE(X) }
> +
> +/*
> + * Due to the test case logic the all "must_pass" params include "_rejected" states
> + * since our "GuC" calls by default will not complain again about the INVALID_STATE
> + * thus our state machine is able to fully recover.
> + */
> +
> +static struct state_param flr_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(flr_starting_stopped),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(flr_failed),
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +};
> +
> +static struct state_param stop_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +	MAKE_STATE_PARAM(flr_failed),
> +};
> +
> +static struct state_param stop_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +};
> +
> +static struct state_param stop_must_fail_from[] = {
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stopping_paused),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(flr_starting_stopped),
> +};
> +
> +static struct state_param pause_must_pass_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(mismatch),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(flr_failed),
> +};
> +
> +static struct state_param pause_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(stopping),
> +};
> +
> +static struct state_param pause_must_fail_from[] = {
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +};
> +
> +static struct state_param resume_must_pass_from[] = {
> +	MAKE_STATE_PARAM(paused),
> +	MAKE_STATE_PARAM(resume_failed),
> +	MAKE_STATE_PARAM(resume_rejected),
> +};
> +
> +static struct state_param resume_must_cancel_from[] = {
> +	MAKE_STATE_PARAM(flr_starting_paused),
> +	MAKE_STATE_PARAM(stopping_paused),
> +};
> +
> +static struct state_param resume_must_fail_from[] = {
> +	MAKE_STATE_PARAM(ready),
> +	MAKE_STATE_PARAM(pausing),
> +	MAKE_STATE_PARAM(pausing_wait_guc),
> +	MAKE_STATE_PARAM(pausing_guc_done),
> +	MAKE_STATE_PARAM(pause_failed),
> +	MAKE_STATE_PARAM(pause_rejected),
> +	MAKE_STATE_PARAM(resuming),
> +	MAKE_STATE_PARAM(resumed),
> +	MAKE_STATE_PARAM(stopping),
> +	MAKE_STATE_PARAM(stop_failed),
> +	MAKE_STATE_PARAM(stop_rejected),
> +	MAKE_STATE_PARAM(stopped),
> +	MAKE_STATE_PARAM(flr_starting),
> +	MAKE_STATE_PARAM(flr_waiting),
> +	MAKE_STATE_PARAM(flr_guc_done),
> +	MAKE_STATE_PARAM(flr_resetting),
> +	MAKE_STATE_PARAM(flr_finishing),
> +	MAKE_STATE_PARAM(flr_failed),
> +	MAKE_STATE_PARAM(mismatch),
> +};
> +
> +KUNIT_ARRAY_PARAM(flr_must_pass_from, flr_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_pass_from, stop_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_fail_from, stop_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(stop_must_cancel_from, stop_must_cancel_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_pass_from, pause_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_fail_from, pause_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(pause_must_cancel_from, pause_must_cancel_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_pass_from, resume_must_pass_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_fail_from, resume_must_fail_from, state_param_get_desc);
> +KUNIT_ARRAY_PARAM(resume_must_cancel_from, resume_must_cancel_from, state_param_get_desc);
> +
> +static int mimic_pf_handle_vf_flr_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_handle_vf_flr_done(gt, vfid);
> +	return 0;
> +}
> +
> +static int mimic_pf_handle_vf_pause_done(struct xe_gt *gt, unsigned int vfid)
> +{
> +	pf_handle_vf_pause_done(gt, vfid);
> +	return 0;
> +}
> +
> +static void prepare_state(struct kunit *test, unsigned int vfid,
> +			  const enum xe_gt_sriov_control_bits *bits, size_t num_bits)
> +{
> +	struct xe_gt *gt = test->priv;
> +	size_t n;
> +
> +	for (n = 0; n < num_bits; n++) {
> +		enum xe_gt_sriov_control_bits bit = bits[n];
> +
> +		KUNIT_ASSERT_TRUE(test, pf_enter_vf_state(gt, vfid, bit));
> +
> +		if (bit == XE_GT_SRIOV_STATE_WIP) {
> +			pf_queue_vf(gt, vfid);
> +		} else if (bit == XE_GT_SRIOV_STATE_FLR_WAIT_GUC) {
> +			xe_kunit_helper_delayed_call(test, HZ / 100,
> +						     mimic_pf_handle_vf_flr_done, gt, vfid);
> +		} else if (bit == XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC) {
> +			xe_kunit_helper_delayed_call(test, HZ / 100,
> +						     mimic_pf_handle_vf_pause_done, gt, vfid);
> +		}
> +	}
> +}
> +
> +static void prepare_state_from_param(struct kunit *test)
> +{
> +	const struct state_param *p = test->param_value;
> +
> +	prepare_state(test, VFUT1, p->bits, p->num_bits);
> +}
> +
> +static void expect_not_pausing(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_SEND_PAUSE));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_GUC_DONE));
> +}
> +
> +static void expect_not_in_pause(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_pausing(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +}
> +
> +static void expect_not_resuming(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_SEND_RESUME));
> +}
> +
> +static void expect_not_in_resume(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_resuming(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +}
> +
> +static void expect_not_stopping(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_SEND_STOP));
> +}
> +
> +static void expect_not_in_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +}
> +
> +static void expect_not_in_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_START));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_GUC_DONE));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_SEND_FINISH));
> +	KUNIT_EXPECT_TRUE(test,
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void expect_not_in_wip(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void expect_not_in_mismatch(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void try_flr_vf(struct kunit *test, bool mimic_busy, bool late_reply)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? late_reply ? send_vf_control_cmd_busy_no_reply :
> +			      send_vf_control_cmd_busy_and_reply :
> +			      late_reply ? send_vf_control_cmd_pass_no_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	if (late_reply)
> +		xe_kunit_helper_delayed_call(test, HZ / 10,
> +					     mimic_pf_handle_vf_flr_done, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +
> +	expect_not_in_flr(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_resume(test);
> +	expect_not_in_stop(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void flr_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, false, false);
> +}
> +
> +static void flr_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, true, false);
> +}
> +
> +static void flr_vf_needs_retry_late_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_flr_vf(test, true, true);
> +}
> +
> +static void flr_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_fails_on_reset(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.vfs[VFUT1].config.sanitize,
> +			      sanitize_vf_resources_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_unconfirmed_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void flr_vf_confirmed_early_continue_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/*
> +	 * make sure SEND_START completes;
> +	 * successful reply from cmd_pass_no_reply should exit mismatch state
> +	 */
> +	flush_work(&gt->sriov.pf.control.worker);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_confirmed_early_reject_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_starting, ARRAY_SIZE(flr_starting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/*
> +	 * make sure SEND_START completes;
> +	 * error from send_vf_control_cmd_reject should keep mismatch state
> +	 */
> +	flush_work(&gt->sriov.pf.control.worker);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_confirmed_twice_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_guc_done, ARRAY_SIZE(flr_guc_done));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	/* this is fully recoverable */
> +	KUNIT_EXPECT_EQ(test, 0, pf_wait_vf_wip_done(gt, VFUT1, HZ));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_confirmed_too_late_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_failed, ARRAY_SIZE(flr_failed));
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void flr_vf_unsolicited_confirmation_from_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +
> +	pf_handle_vf_flr_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_FLR_FAILED));
> +}
> +
> +static void flr_vf_wrong_confirmation_from_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, flr_waiting, ARRAY_SIZE(flr_waiting));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	pf_handle_vf_pause_done(gt, VFUT1);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +}
> +
> +static void flr_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_wait);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	expect_not_in_flr(test);
> +}
> +
> +static void try_stop_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	expect_not_stopping(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_resume(test);
> +	expect_not_in_mismatch(test);
> +}
> +
> +static void stop_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_stop_vf(test, false);
> +}
> +
> +static void stop_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_stop_vf(test, true);
> +}
> +
> +static void stop_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +}
> +
> +static void stop_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void stop_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ETIMEDOUT);
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	expect_not_stopping(test);
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void stop_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOP_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_STOPPED));
> +}
> +
> +static void stop_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	expect_not_in_stop(test);
> +}
> +
> +static void stop_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	expect_not_in_stop(test);
> +}
> +
> +static void try_pause_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	expect_not_pausing(test);
> +	expect_not_in_mismatch(test);
> +}
> +
> +static void pause_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_pause_vf(test, false);
> +}
> +
> +static void pause_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_pause_vf(test, true);
> +}
> +
> +static void pause_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -ECANCELED);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +}
> +
> +static void pause_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void pause_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_WIP));
> +}
> +
> +static void pause_vf_unconfirmed_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, err, -ETIMEDOUT);
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSE_FAILED));
> +}
> +
> +static void pause_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_but_reply_flr_only);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void pause_vf_canceled_by_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_no_reply);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	expect_not_in_pause(test);
> +}
> +
> +static void try_resume_vf(struct kunit *test, bool mimic_busy)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      mimic_busy ? send_vf_control_cmd_busy_and_reply :
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	expect_not_resuming(test);
> +	expect_not_in_pause(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_resume_vf(test, false);
> +}
> +
> +static void resume_vf_needs_retry_from(struct kunit *test)
> +{
> +	prepare_state_from_param(test);
> +	try_resume_vf(test, true);
> +}
> +
> +static void resume_vf_fails_on_send(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_fail);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +
> +	expect_not_resuming(test);
> +	expect_not_in_mismatch(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_rejected_by_guc(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_reject);
> +
> +	KUNIT_EXPECT_NE(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_PAUSED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_MISMATCH));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +
> +	expect_not_resuming(test);
> +	expect_not_in_wip(test);
> +}
> +
> +static void resume_vf_canceled_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +	expect_not_resuming(test);
> +}
> +
> +static void resume_vf_refused_from(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	int err;
> +
> +	prepare_state_from_param(test);
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_NE(test, 0, err = xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +	KUNIT_EXPECT_NE(test, err, -EIO);
> +
> +	KUNIT_EXPECT_TRUE(test, err == -EALREADY ||
> +			  pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_FAILED));
> +}
> +
> +static void resume_vf_canceled_by_restart(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10, xe_gt_sriov_pf_control_restart, gt);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void resume_vf_canceled_by_flr(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_flr);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_trigger_flr, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void resume_vf_canceled_by_stop(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	prepare_state(test, VFUT1, paused, ARRAY_SIZE(paused));
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_busy_except_stop);
> +
> +	xe_kunit_helper_delayed_call(test, HZ / 10,
> +				     xe_gt_sriov_pf_control_stop_vf, gt, VFUT1);
> +
> +	KUNIT_EXPECT_EQ(test, -ECANCELED, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUMED));
> +	KUNIT_EXPECT_TRUE(test, pf_expect_vf_not_state(gt, VFUT1, XE_GT_SRIOV_STATE_RESUME_WIP));
> +}
> +
> +static void basic_pause_and_resume_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_resume_vf(gt, VFUT1));
> +}
> +
> +static void basic_pause_and_stop_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_ASSERT_EQ(test, 0, xe_gt_sriov_pf_control_pause_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +}
> +
> +static void basic_stop_and_flr_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_stop_vf(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +}
> +
> +static void basic_flr_and_flr_vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +}
> +
> +static void basic_flr_vfs(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +
> +	XE_TEST_ACTIVATE_STUB(test, gt->sriov.pf.control.send_vf_control_cmd,
> +			      send_vf_control_cmd_pass_and_reply);
> +
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT1));
> +	KUNIT_EXPECT_EQ(test, 0, xe_gt_sriov_pf_control_trigger_flr(gt, VFUT2));
> +}
> +
> +static struct kunit_case pf_control_test_cases[] = {
> +	KUNIT_CASE(basic_pause_and_resume_vf),
> +	KUNIT_CASE(basic_pause_and_stop_vf),
> +	KUNIT_CASE(basic_stop_and_flr_vf),
> +	KUNIT_CASE(basic_flr_and_flr_vf),
> +	KUNIT_CASE(basic_flr_vfs),
> +
> +	KUNIT_CASE_PARAM(flr_vf_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(flr_vf_needs_retry_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(flr_vf_needs_retry_late_from, flr_must_pass_from_gen_params),
> +	KUNIT_CASE(flr_vf_fails_on_send),
> +	KUNIT_CASE(flr_vf_fails_on_reset),
> +	KUNIT_CASE(flr_vf_rejected_by_guc),
> +	KUNIT_CASE_SLOW(flr_vf_unconfirmed_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_early_continue_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_early_reject_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_twice_by_guc),
> +	KUNIT_CASE(flr_vf_confirmed_too_late_by_guc),
> +	KUNIT_CASE(flr_vf_wrong_confirmation_from_guc),
> +	KUNIT_CASE(flr_vf_unsolicited_confirmation_from_guc),
> +	KUNIT_CASE(flr_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(stop_vf_from, stop_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_needs_retry_from, stop_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_refused_from, stop_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(stop_vf_canceled_from, stop_must_cancel_from_gen_params),
> +	KUNIT_CASE(stop_vf_fails_on_send),
> +	KUNIT_CASE(stop_vf_rejected_by_guc),
> +	KUNIT_CASE(stop_vf_canceled_by_flr),
> +	KUNIT_CASE(stop_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(pause_vf_from, pause_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_needs_retry_from, pause_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_refused_from, pause_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(pause_vf_canceled_from, pause_must_cancel_from_gen_params),
> +	KUNIT_CASE(pause_vf_fails_on_send),
> +	KUNIT_CASE(pause_vf_rejected_by_guc),
> +	KUNIT_CASE_SLOW(pause_vf_unconfirmed_by_guc),
> +	KUNIT_CASE(pause_vf_canceled_by_flr),
> +	KUNIT_CASE(pause_vf_canceled_by_stop),
> +	KUNIT_CASE(pause_vf_canceled_by_restart),
> +
> +	KUNIT_CASE_PARAM(resume_vf_from, resume_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_needs_retry_from, resume_must_pass_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_refused_from, resume_must_fail_from_gen_params),
> +	KUNIT_CASE_PARAM(resume_vf_canceled_from, resume_must_cancel_from_gen_params),
> +	KUNIT_CASE(resume_vf_fails_on_send),
> +	KUNIT_CASE(resume_vf_rejected_by_guc),
> +	KUNIT_CASE(resume_vf_canceled_by_flr),
> +	KUNIT_CASE(resume_vf_canceled_by_stop),
> +	KUNIT_CASE(resume_vf_canceled_by_restart),
> +
> +	{}
> +};
> +
> +static struct kunit_suite pf_control_suite = {
> +	.name = "pf_control",
> +	.test_cases = pf_control_test_cases,
> +	.init = pf_control_test_init,
> +};
> +
> +kunit_test_suite(pf_control_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index e91c71d768ff..4863d79f72e0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <drm/drm_managed.h>
> +#include <kunit/static_stub.h>
>  
>  #include "abi/guc_actions_sriov_abi.h"
>  
> @@ -196,6 +197,8 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
>  
>  static unsigned long pf_get_default_timeout(enum xe_gt_sriov_control_bits bit)
>  {
> +	KUNIT_STATIC_STUB_REDIRECT(pf_get_default_timeout, bit);
> +
>  	switch (bit) {
>  	case XE_GT_SRIOV_STATE_FLR_WAIT_GUC:
>  	case XE_GT_SRIOV_STATE_PAUSE_WAIT_GUC:
> @@ -1458,3 +1461,7 @@ void xe_gt_sriov_pf_control_restart(struct xe_gt *gt)
>  	for (n = 1; n <= totalvfs; n++)
>  		pf_enter_vf_ready(gt, n);
>  }
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_gt_sriov_pf_control_kunit.c"
> +#endif
The tests look fine. I tried to verify the states according to the available
drawings of the state machine and I did not find any incorrectness.
It seems to me that the tests could be expanded to include an additional
basic test: basic_pause_and_flr_vf
But still:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



> -- 
> 2.43.0
> 

-- 
