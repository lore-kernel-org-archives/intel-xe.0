Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9B2C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 20:20:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BDD10E465;
	Wed, 30 Jul 2025 20:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k90O1TLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E70210E465
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753906817; x=1785442817;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YQI0njYIHUESsXTheRnpKsfRu06Cim5wHHRx5X9kkXg=;
 b=k90O1TLxiQ1O85+2wuRKNBCY92sUS9cn/nEMti6kahTNtHL5n5UBcvR5
 iKPRJ97vfwRTRoDtrpuPR05Y45Fe1JQHPcNzLwVMLyFg7SVvRg8I2LiHx
 Jw4XhoKOJ7Eq1o/0ZzTLvyIBipvlXE5mx+6IyGJGAABdCg9aTcVG7M9ta
 vYNKNOJFOgvix/wLRWW+nNSfpsCZNVgJ68koiXMtlo+6npszhTXNwv3XV
 /Etjcbtq+sCiEF9o09QOsVXSQ8rQXZIEqYw8ZKBQe5Xpm/BWBdRCHANHu
 ql0LOnrBfLrxZ56S2bmNNuZ40DNjfBcgfIXfPxgXQPOohD9XNdTd1MXpt A==;
X-CSE-ConnectionGUID: DCAmx4o3TOyxdaTvbdC+pQ==
X-CSE-MsgGUID: tzzgxCpJS6uOpYxfC2kFHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="67663731"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="67663731"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:20:16 -0700
X-CSE-ConnectionGUID: i7/dMt7gSmOjEWZ1U+0TDw==
X-CSE-MsgGUID: Ljt/AF2eRD+QWPo8GrUK5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="193921558"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 13:20:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:20:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 13:20:13 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 13:20:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pponSuEzhBYUnU9H5iVuoJCnd+eW5Ze/P8+EyrJPQUfihYyqZ6BpJfzHDLprWo8XKu0+f609rdzPKUuxu8HPUbB1X4BdtRsMO6zfXgdX9NcbrKr6Vpg+XDsg7drjvDMWGiD4bBbk7tDmvfSbjZt1vOmU4Y4FG+lUge0f2v55kdTnzxd4SiNgkEgTV++L/Tsu6DpGTqrMJWpOGDjlIGMBy1Z+VvqKFqs6V3L1MMtrA9OkJbu9HWK2O/eUcQMiA+CvkhmkAPtpSmbqW3W4tSyB+lgrC0MOFJ3AlIAr4v2ts8tWAuo53axBxptaDGGDHp/gyz2q0xG95RVImoMFcaBlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQC4l0sQHiyAG1g3nGiO3KMYN+75bHnHKI78Ir2BxT4=;
 b=WZehGWi/sXirXb6JZfvb6/V/MdHCGTlUGflkE40PTJtm+Zl//4ZFVj3GMYthb6kEYJMG9943Y+GKJCxHbwYW/e4JNXXTLy+3hvtK+bX0z+0tMH57tO8tCSkQFP03ofmMlC2L6EJF13fkImFspAQkECUYgyfCQSIvzy5N/y3qHO8fwwW/H3hhNWBKptttqCTGED36hXzKEVrj/S3LFf8r/LxTEA2snq722TSxHK1/BFlSil7/cyYnxWaCZ11FozpuykdHJFucSXMrDIjKZ43DPfZUXl6qH5feLYSaEQ44OuDU6LlhH0NADjfJOBw8CzHJRSloXCOtbZZNIaU5S59dMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by CY5PR11MB6533.namprd11.prod.outlook.com
 (2603:10b6:930:43::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 20:20:10 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.8964.023; Wed, 30 Jul 2025
 20:20:10 +0000
Date: Wed, 30 Jul 2025 13:20:03 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: rename XE_WA to XE_GT_WA
Message-ID: <aIp-c55iJdRKJC3D@msatwood-mobl>
References: <20250730172341.990800-1-matthew.s.atwood@intel.com>
 <aIp0os30jQ_Ysfd3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <aIp0os30jQ_Ysfd3@intel.com>
X-ClientProxiedBy: MW4PR04CA0032.namprd04.prod.outlook.com
 (2603:10b6:303:6a::7) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a92145-104b-429d-df33-08ddcfa67b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejJjSkhoU0pmMzQ2ZDVtTUlVZWNtVWFCV3V3S3NuOTUwU1ptdWx2dExFOWV0?=
 =?utf-8?B?VzVndUpMbE13ejZpTVgrSTJFTFh5Mzl2TmVzeUNQUjZ2WjViNUUrQXJTSTho?=
 =?utf-8?B?ZHR2NUpUM2ZMSm4xaVdkeEhlWEJqRG9yYnlaQUxQbVNFWkRDTmg2Y2NKL3ZI?=
 =?utf-8?B?ZnVrbzZxbTZPdGNVUUM1blA0ZkI4QVMyWFNwM0VjVDc1OWdlUGJZaGNzcmxF?=
 =?utf-8?B?dUhrVHFPem9PaTdRYnFsdUd0N2FkRU93YzFXeTk2ck1ldjZrVFRuSVZpeEN3?=
 =?utf-8?B?TTI4c0o3UlBhMUpDcXhvQVBVbVFEU1FFUjEwdm1KRHR6OUFnS3RZRU1Ia2Zn?=
 =?utf-8?B?Q01xR1p1U0RlTFliUHd4Y09jcXkrbHQ2OXhMUHAvUmVsNnJ6UkFhdldZOTRl?=
 =?utf-8?B?cnd6bmI4dUkwU0hEK3VXUU9ibzlUQTJhOTRybEdGRVpNWHdBL0l5YldsaFU5?=
 =?utf-8?B?NnZvLzZaTXdJeGFaUUE2NndQdzBtTm9ncE1LaE9OMWc0Q0E4ZDZPMjJNUE55?=
 =?utf-8?B?T1FWeEdhZUJXVHNqK1RjNkxHZGxxUXI2TGlMQ1dpMFJ6ZExRVnhpMnNlWjNx?=
 =?utf-8?B?NkRvRnY2SFBEQUFWUFBFMm80U1JLZXN1bU5LOVdWWEkwUXByQmNKTTIvZnc0?=
 =?utf-8?B?Zyt3NVg5bW5TWk8rdUd3cGV0UVo5aDhaNUU3ckpPNmc2REhnMWtxbU51ZmdO?=
 =?utf-8?B?Z0VDU3REYjNiRjZhdTM2dmFHY0NNTUtwUmVESHFPVGlyZ2FCSVcrQzF4Y3dS?=
 =?utf-8?B?alRwM3IyUGhpOEd0VkN3WW96cFoyZCtSR1c2eUJuYmJzWFMwY2x4bTJwZmZX?=
 =?utf-8?B?UzNBSWZTWnJCU1lTZG15RW1IdUpSZ0VOZWQ1eUF1eERWMU5ZNkRoQy9JRE5j?=
 =?utf-8?B?YXFsb09yaDFPZWVJdmN4UjFYUFN1RS9ueE4zdnBwT1BHWC9zcnlLdVVORnZZ?=
 =?utf-8?B?WnoyVFpOR0NHUGZGa1RlbGZGc3Irci9GT1JIcnpQWWt5Yk9qSi9MZ0M4WVow?=
 =?utf-8?B?UnNhS25vU3E0MEp1elZ2b1NKME0xcXl5N2tzRElxUnZoZzZFUDNkb21vNVVm?=
 =?utf-8?B?T2ttZExxSnhSQ3F2cUdrT1hzdEUwUUhQV09BWkxkbEVVdGUxeXRySGN6OExZ?=
 =?utf-8?B?UDg0SXRSb2I5bXBWTXRkRm1aRm5HQjJYdDlYSzFwYmxmRUdiaEFjVzZzaTU4?=
 =?utf-8?B?dlc5T1JDK0ZkTnI3U25qZ3IzMk5jV1hINzlMY3FTVWgzYWx0TGRuU0FvaVBF?=
 =?utf-8?B?ZDFCekV5V01yZnZpYUlFZzhHWit6TzBWNExVeTFkUWRkaTk1U1E5M0d3azh4?=
 =?utf-8?B?N3E3bTA3MFNrMkc0THlIZlhxTS9remZyY2VNL2tMemhva3JDSEtDWmRSWk5k?=
 =?utf-8?B?MjVBQXNRbGxTQ1FRYkhzN0dPdmIwSlBWOEFmbVY4eUJENE9EQVF2dm5SWWda?=
 =?utf-8?B?T2xOTVQxUzFxUGNSeFlxU1F0YTUvTE1lMldacGNQTGI5WGN2YnRqY2lOQUMv?=
 =?utf-8?B?L2ZRd09Dcnh6eUg2K3ZXNGZyWnB5ZjdFNjFiZEZhOVpQdHFtc3RZSytvV3Fk?=
 =?utf-8?B?blg0ZUJsbTFkNUo2bVY3c3hkd0J2Y1QyV2tHaUlVb3ZybkgzeFplLzlRSFJK?=
 =?utf-8?B?NmU1WGh5dnBzTHhEVzdzOHNGRExFVWcvalFSWmNEdXpvZDVvTldPU0U4ditU?=
 =?utf-8?B?MnVlbXYrV08xYWtkMm5vYnB6VTRnbXRsL3poR0U2ZGFFSTFlbzYvbWk2Rzdu?=
 =?utf-8?B?UXpWTGE0cUd6emdXWFVVWWszS2lLZEt0RnE3dWNjbEUzY3d4Mmo0STZENEpw?=
 =?utf-8?B?R3l5bk1kNFptM2RSL2ViSVVuSmJxQWM1M0dSRXZqMTlCK0J0d3paajhGd3dI?=
 =?utf-8?B?T3RGNW14VGRDTUNIKzU4TUVlQ0FkQXEvbmx5OU95eHNxWWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVFFbDZtSlBnNE43VHpUUGt6SzBuTlB0dXNVanl0aklLL0F1WjgwZjlJWmVm?=
 =?utf-8?B?TURuMDRqUVlNSC9SUm11N0tKdFlHaXkxaGhISHpRa2ZnTE44MlYveWFRYzJs?=
 =?utf-8?B?RGlTcnpna2FSajlBOWt1UkpyOWp5KzUxVWc1dEk5Z0NlZVBIMHZWVG9iS1JQ?=
 =?utf-8?B?dXdIN0dscXdZc3BxRys2ZnBRUk51ZlZhdTlxZ2JQZHZiN1pyTXF1c3NMTWlr?=
 =?utf-8?B?ZUdXaXpYTWxqWkpiR3oxKzdaQ0pscVVzMlBkZmc3a1FnZDNiQTRlNm9DK3ZU?=
 =?utf-8?B?RzEyVVhiWUNUb2R5NTJCcjZVQ3ppZDlQQjJJSTdVV2NzNTdmUi9qU0lmN0Qv?=
 =?utf-8?B?cTNoV3V6THRKYzIvNU55R3VGSGN6Z01yZjYvUGYxQnpidjdoeVZvUWJReVVC?=
 =?utf-8?B?WkFldkljK2pFOXdIdExKWVJ1UENIWlpkei92VVVGajk1eWlQOHNWakp4b2xi?=
 =?utf-8?B?Z1ozQU9mdGxZZzhYSm5SOXdVZ1Z0czJFa2IvUWVuRmJGaG5leXJlNjdPdUY5?=
 =?utf-8?B?cUFqYVV5bDlZbmRBaDFEZ1FJZlZFMVEvWFB4aE5TR0lHUW5JV0RrdnhibjJ0?=
 =?utf-8?B?Qk55ZkdCMkErenVGbXVNL1VVWk0zM0ZLSkJ0MzU2czNGWm1ORlhnRmtTSU9I?=
 =?utf-8?B?NFNpbjE2ZmtTKzJicFFzM29uLzQvZlJkcGszYXdhL3piZW5CTDNMYXpaMjhl?=
 =?utf-8?B?bUJ2MmpPV3gzTUdkN2V6b08wRk5qVjV0YlRxTDNnL3VrME9PbFdqQ0FrQWFu?=
 =?utf-8?B?TlplVXl1di83UzZ5RFQ0M244bWtaVzBrWFJ4cjJzR2IyTk05L1RSL0x3UjhW?=
 =?utf-8?B?V0MxSzZKVkxiaXhCcHZIU0NFaFE2Q2NFNnFFb2lOMHlFc2N4eGF2L2FGY0xj?=
 =?utf-8?B?UmdOckRrUlNzSWxkbEN0ckFvNEw1Z2EzRVB0N3JTdm13NWpSR2VGYVFTWmZn?=
 =?utf-8?B?T2dURUQ3dW15Y1MyMzRaQWlyRGlUZTgrRTl2UG5yNks4SGNHOUVLMktNanNK?=
 =?utf-8?B?K3ZHRDZJK2VoK3JaaVMxalAvYkxjNnU2Z3FyOHZLaFhLZ2J6RUF6Z2grYlhw?=
 =?utf-8?B?QUN5SjM3VDhEbENhVXdOVHo4Vk9RaXFqend6U3Q3RjVSdndWSk8yTkxzaDhi?=
 =?utf-8?B?b2p2SnRvTm9vU0dwdEQ3MmxGMDdrNXdmTS9xSjJjcHBsMXRDQXJ5WXl2TGtF?=
 =?utf-8?B?bk9PYTFQTGRkWGdXeWlEMGtsNzF4R2hBbkpTVVdKUHJtQzQ5Q0o2KzBvRWJC?=
 =?utf-8?B?ZzQ2MnlScmZvRG9hVUVERktsRmcxZnFYK3lUN3hFaDZadmdqUTlIYjBmbGtN?=
 =?utf-8?B?d2tpeFB6Z0g5SW83d0V4VlJHalJZVWVRVjJBTjBZTlZmTTMvWlJlTG0rOEJN?=
 =?utf-8?B?N3pXdWNuR08wUDlMRGw3Mmw5YVV2TjRpdDVkK2N1ZlhYa0dJTTM4YXpQZ3JZ?=
 =?utf-8?B?dlA3ZHJPK1lSSFQzbmttSkFhak8wY01WM1E2M0kxQkJmWk1PUzB0bUYwV1Fn?=
 =?utf-8?B?eThwaEhRK0xRWEw4VSsySUVyTXgvNmUxWkxicUoweG9FMXBVdjZXZ0hRbGNZ?=
 =?utf-8?B?ejNWUXBzK0IySThJK0VicUpWalphMkJBVVN4NGtUVWhsSS8vZkdUQ2tMSC9F?=
 =?utf-8?B?L1dPV01WejU4U3BTUUE1cENPSTFFbTVOV0c2TTZ4NzNnREs4VU5tZ1BRMVZW?=
 =?utf-8?B?STIyNEprZm5Nd3dRRzBqYTZwcTAvOGxydHM0eXFWelVITlBvcXROL2kzRnJr?=
 =?utf-8?B?aEJHaEl1bmp4dVExWnJzMmZmb1FjdnR5QkhRT1NGUFBUQkFZemdVdU9rb2dm?=
 =?utf-8?B?MzFqZkwwdGlCd0JIT01wMi9SdWdwLzVjNkRlRmhLM1dDM2Q2a3NHT25VTjlT?=
 =?utf-8?B?aTIwOHQxb3NmU0E5US9CRjYwcHpMSjBPRVRkcVhJUXJ4OE1pVHlyNDlXY3Q2?=
 =?utf-8?B?R3FTOGdjRUVxSTVEcUdzRXpyMnBXZVNzSzRTL2l3UUVsRDVyOXJVaEg2ci93?=
 =?utf-8?B?YlprVFU2V1NEZUFxQkw2UWdFQXUyZktHRDAvSG1DYm1xRlVVdnVyNWwzNTNN?=
 =?utf-8?B?N25SbCtaaDdLRGZPVytHN0tzNzFSeEh4TXF1MjkzSHVyUHl4cXlHQzA1UjlF?=
 =?utf-8?B?T0RBTG03MTBQOHRSVVBLeHdvOElSbjhLOXVOU0s0ek52Z2JXN2V4UHBtUjJD?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a92145-104b-429d-df33-08ddcfa67b5b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 20:20:10.0997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ccqzCSw57JRZyVI5cThzF03VOxUAHbtoluo06ESaWuBrnAEnkm/97aWwPbwO8TkwjSf2BCEw6PbW0+LOeRxxlgDN/nMuYTow1OpvhnM+1Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

On Wed, Jul 30, 2025 at 03:38:10PM -0400, Rodrigo Vivi wrote:
> On Wed, Jul 30, 2025 at 10:23:41AM -0700, Matt Atwood wrote:
> > Now that there are two types of wa tables and infrastructure, be more
> > concise in the naming of GT wa macros.
> > 
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/display/intel_fbdev_fb.c   |  2 +-
> >  drivers/gpu/drm/xe/display/xe_display_wa.c    |  2 +-
> >  drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
> >  drivers/gpu/drm/xe/xe_device.c                |  6 +++---
> >  drivers/gpu/drm/xe/xe_eu_stall.c              |  4 ++--
> >  drivers/gpu/drm/xe/xe_ggtt.c                  |  8 ++++----
> >  drivers/gpu/drm/xe/xe_gsc.c                   |  6 +++---
> >  drivers/gpu/drm/xe/xe_gt.c                    |  6 +++---
> >  drivers/gpu/drm/xe/xe_gt_topology.c           |  2 +-
> >  drivers/gpu/drm/xe/xe_gt_types.h              |  2 +-
> >  drivers/gpu/drm/xe/xe_guc.c                   | 14 ++++++-------
> >  drivers/gpu/drm/xe/xe_guc_ads.c               | 20 +++++++++----------
> >  drivers/gpu/drm/xe/xe_guc_pc.c                | 10 +++++-----
> >  drivers/gpu/drm/xe/xe_hw_engine.c             |  2 +-
> >  drivers/gpu/drm/xe/xe_lrc.c                   |  8 ++++----
> >  drivers/gpu/drm/xe/xe_oa.c                    |  8 ++++----
> >  drivers/gpu/drm/xe/xe_query.c                 |  4 ++--
> >  drivers/gpu/drm/xe/xe_ring_ops.c              |  6 +++---
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_wa.h                    |  4 ++--
> >  22 files changed, 61 insertions(+), 61 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > index fba9617a75a5..d96ba2b51065 100644
> > --- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > +++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
> > @@ -41,7 +41,7 @@ struct intel_framebuffer *intel_fbdev_fb_alloc(struct drm_fb_helper *helper,
> >  	size = PAGE_ALIGN(size);
> >  	obj = ERR_PTR(-ENODEV);
> >  
> > -	if (!IS_DGFX(xe) && !XE_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
> > +	if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display)) {
> >  		obj = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe),
> >  					   NULL, size,
> >  					   ttm_bo_type_kernel, XE_BO_FLAG_SCANOUT |
> > diff --git a/drivers/gpu/drm/xe/display/xe_display_wa.c b/drivers/gpu/drm/xe/display/xe_display_wa.c
> > index 68d1387d81a0..8ada1cbcb16c 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display_wa.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display_wa.c
> > @@ -14,5 +14,5 @@ bool intel_display_needs_wa_16023588340(struct intel_display *display)
> >  {
> >  	struct xe_device *xe = to_xe_device(display->drm);
> >  
> > -	return XE_WA(xe_root_mmio_gt(xe), 16023588340);
> > +	return XE_GT_WA(xe_root_mmio_gt(xe), 16023588340);
> >  }
> > diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > index 3eab9a569661..826ac3d578b7 100644
> > --- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > +++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
> > @@ -123,7 +123,7 @@ initial_plane_bo(struct xe_device *xe,
> >  		phys_base = base;
> >  		flags |= XE_BO_FLAG_STOLEN;
> >  
> > -		if (XE_WA(xe_root_mmio_gt(xe), 22019338487_display))
> > +		if (XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display))
> >  			return NULL;
> >  
> >  		/*
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index d04a0ae018e6..6aaff65823b2 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -886,7 +886,7 @@ int xe_device_probe(struct xe_device *xe)
> >  	}
> >  
> >  	if (xe->tiles->media_gt &&
> > -	    XE_WA(xe->tiles->media_gt, 15015404425_disable))
> > +	    XE_GT_WA(xe->tiles->media_gt, 15015404425_disable))
> >  		XE_DEVICE_WA_DISABLE(xe, 15015404425);
> >  
> >  	xe_nvm_init(xe);
> > @@ -1042,7 +1042,7 @@ void xe_device_l2_flush(struct xe_device *xe)
> >  
> >  	gt = xe_root_mmio_gt(xe);
> >  
> > -	if (!XE_WA(gt, 16023588340))
> > +	if (!XE_GT_WA(gt, 16023588340))
> >  		return;
> >  
> >  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > @@ -1086,7 +1086,7 @@ void xe_device_td_flush(struct xe_device *xe)
> >  		return;
> >  
> >  	root_gt = xe_root_mmio_gt(xe);
> > -	if (XE_WA(root_gt, 16023588340)) {
> > +	if (XE_GT_WA(root_gt, 16023588340)) {
> >  		/* A transient flush is not sufficient: flush the L2 */
> >  		xe_device_l2_flush(xe);
> >  	} else {
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index af7916315ac6..fdd514fec5ef 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -649,7 +649,7 @@ static int xe_eu_stall_stream_enable(struct xe_eu_stall_data_stream *stream)
> >  		return -ETIMEDOUT;
> >  	}
> >  
> > -	if (XE_WA(gt, 22016596838))
> > +	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  _MASKED_BIT_ENABLE(DISABLE_DOP_GATING));
> >  
> > @@ -805,7 +805,7 @@ static int xe_eu_stall_disable_locked(struct xe_eu_stall_data_stream *stream)
> >  
> >  	cancel_delayed_work_sync(&stream->buf_poll_work);
> >  
> > -	if (XE_WA(gt, 22016596838))
> > +	if (XE_GT_WA(gt, 22016596838))
> >  		xe_gt_mcr_multicast_write(gt, ROW_CHICKEN2,
> >  					  _MASKED_BIT_DISABLE(DISABLE_DOP_GATING));
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> > index 249713139f69..e03222f5ac5a 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -106,10 +106,10 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
> >  static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
> >  {
> >  	struct xe_tile *tile = ggtt->tile;
> > -	struct xe_gt *affected_gt = XE_WA(tile->primary_gt, 22019338487) ?
> > +	struct xe_gt *affected_gt = XE_GT_WA(tile->primary_gt, 22019338487) ?
> >  		tile->primary_gt : tile->media_gt;
> >  	struct xe_mmio *mmio = &affected_gt->mmio;
> > -	u32 max_gtt_writes = XE_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
> > +	u32 max_gtt_writes = XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ? 1100 : 63;
> >  	/*
> >  	 * Wa_22019338487: GMD_ID is a RO register, a dummy write forces gunit
> >  	 * to wait for completion of prior GTT writes before letting this through.
> > @@ -284,8 +284,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  
> >  	if (GRAPHICS_VERx100(xe) >= 1270)
> >  		ggtt->pt_ops = (ggtt->tile->media_gt &&
> > -			       XE_WA(ggtt->tile->media_gt, 22019338487)) ||
> > -			       XE_WA(ggtt->tile->primary_gt, 22019338487) ?
> > +			       XE_GT_WA(ggtt->tile->media_gt, 22019338487)) ||
> > +			       XE_GT_WA(ggtt->tile->primary_gt, 22019338487) ?
> >  			       &xelpg_pt_wa_ops : &xelpg_pt_ops;
> >  	else
> >  		ggtt->pt_ops = &xelp_pt_ops;
> > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > index 1d84bf2f2cef..f5ae28af60d4 100644
> > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > @@ -266,7 +266,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> >  	unsigned int fw_ref;
> >  	int ret;
> >  
> > -	if (XE_WA(tile->primary_gt, 14018094691)) {
> > +	if (XE_GT_WA(tile->primary_gt, 14018094691)) {
> >  		fw_ref = xe_force_wake_get(gt_to_fw(tile->primary_gt), XE_FORCEWAKE_ALL);
> >  
> >  		/*
> > @@ -281,7 +281,7 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
> >  
> >  	ret = gsc_upload(gsc);
> >  
> > -	if (XE_WA(tile->primary_gt, 14018094691))
> > +	if (XE_GT_WA(tile->primary_gt, 14018094691))
> >  		xe_force_wake_put(gt_to_fw(tile->primary_gt), fw_ref);
> >  
> >  	if (ret)
> > @@ -593,7 +593,7 @@ void xe_gsc_wa_14015076503(struct xe_gt *gt, bool prep)
> >  	u32 gs1_clr = prep ? 0 : HECI_H_GS1_ER_PREP;
> >  
> >  	/* WA only applies if the GSC is loaded */
> > -	if (!XE_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
> > +	if (!XE_GT_WA(gt, 14015076503) || !gsc_fw_is_loaded(gt))
> >  		return;
> >  
> >  	xe_mmio_rmw32(&gt->mmio, HECI_H_GS1(MTL_GSC_HECI2_BASE), gs1_clr, gs1_set);
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index c8eda36546d3..ed21ca158a3d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -105,7 +105,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
> >  	unsigned int fw_ref;
> >  	u32 reg;
> >  
> > -	if (!XE_WA(gt, 16023588340))
> > +	if (!XE_GT_WA(gt, 16023588340))
> >  		return;
> >  
> >  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > @@ -127,7 +127,7 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
> >  	unsigned int fw_ref;
> >  	u32 reg;
> >  
> > -	if (!XE_WA(gt, 16023588340))
> > +	if (!XE_GT_WA(gt, 16023588340))
> >  		return;
> >  
> >  	if (xe_gt_is_media_type(gt))
> > @@ -958,7 +958,7 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
> >  	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
> >  	     xe_uc_fw_is_loaded(&gt->uc.gsc.fw) ||
> >  	     xe_uc_fw_is_in_error_state(&gt->uc.gsc.fw)) &&
> > -	    XE_WA(gt, 22019338487))
> > +	    XE_GT_WA(gt, 22019338487))
> >  		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
> >  
> >  	return ret;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> > index 8c63e3263643..a0baa560dd71 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> > @@ -138,7 +138,7 @@ load_l3_bank_mask(struct xe_gt *gt, xe_l3_bank_mask_t l3_bank_mask)
> >  	 * but there's no tracking number assigned yet so we use a custom
> >  	 * OOB workaround descriptor.
> >  	 */
> > -	if (XE_WA(gt, no_media_l3))
> > +	if (XE_GT_WA(gt, no_media_l3))
> >  		return;
> >  
> >  	if (GRAPHICS_VER(xe) >= 30) {
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> > index dfd4a16da5f0..ef0f2eecfa29 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -413,7 +413,7 @@ struct xe_gt {
> >  		unsigned long *oob;
> >  		/**
> >  		 * @wa_active.oob_initialized: mark oob as initialized to help
> > -		 * detecting misuse of XE_WA() - it can only be called on
> > +		 * detecting misuse of XE_GT_WA() - it can only be called on
> >  		 * initialization after OOB WAs have being processed
> >  		 */
> >  		bool oob_initialized;
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 9e34401e4489..433abc787f7b 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -157,7 +157,7 @@ static bool needs_wa_dual_queue(struct xe_gt *gt)
> >  	 * on RCS and CCSes with different address spaces, which on DG2 is
> >  	 * required as a WA for an HW bug.
> >  	 */
> > -	if (XE_WA(gt, 22011391025))
> > +	if (XE_GT_WA(gt, 22011391025))
> >  		return true;
> >  
> >  	/*
> > @@ -184,10 +184,10 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> >  	struct xe_gt *gt = guc_to_gt(guc);
> >  	u32 flags = 0;
> >  
> > -	if (XE_WA(gt, 22012773006))
> > +	if (XE_GT_WA(gt, 22012773006))
> >  		flags |= GUC_WA_POLLCS;
> >  
> > -	if (XE_WA(gt, 14014475959))
> > +	if (XE_GT_WA(gt, 14014475959))
> >  		flags |= GUC_WA_HOLD_CCS_SWITCHOUT;
> >  
> >  	if (needs_wa_dual_queue(gt))
> > @@ -201,17 +201,17 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> >  	if (GRAPHICS_VERx100(xe) < 1270)
> >  		flags |= GUC_WA_PRE_PARSER;
> >  
> > -	if (XE_WA(gt, 22012727170) || XE_WA(gt, 22012727685))
> > +	if (XE_GT_WA(gt, 22012727170) || XE_GT_WA(gt, 22012727685))
> >  		flags |= GUC_WA_CONTEXT_ISOLATION;
> >  
> > -	if (XE_WA(gt, 18020744125) &&
> > +	if (XE_GT_WA(gt, 18020744125) &&
> >  	    !xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_RENDER))
> >  		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
> >  
> > -	if (XE_WA(gt, 1509372804))
> > +	if (XE_GT_WA(gt, 1509372804))
> >  		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> >  
> > -	if (XE_WA(gt, 14018913170))
> > +	if (XE_GT_WA(gt, 14018913170))
> >  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> >  
> >  	return flags;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index 8ff8626227ae..794cd1dc84c6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -247,7 +247,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> >  
> >  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> >  
> > -	if (XE_WA(gt, 1607983814))
> > +	if (XE_GT_WA(gt, 1607983814))
> >  		count += LNCFCMOCS_REG_COUNT;
> >  
> >  	return count * sizeof(struct guc_mmio_reg);
> > @@ -372,20 +372,20 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> >  	offset = guc_ads_waklv_offset(ads);
> >  	remain = guc_ads_waklv_size(ads);
> >  
> > -	if (XE_WA(gt, 14019882105) || XE_WA(gt, 16021333562))
> > +	if (XE_GT_WA(gt, 14019882105) || XE_GT_WA(gt, 16021333562))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED,
> >  					&offset, &remain);
> > -	if (XE_WA(gt, 18024947630))
> > +	if (XE_GT_WA(gt, 18024947630))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING,
> >  					&offset, &remain);
> > -	if (XE_WA(gt, 16022287689))
> > +	if (XE_GT_WA(gt, 16022287689))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE,
> >  					&offset, &remain);
> >  
> > -	if (XE_WA(gt, 14022866841))
> > +	if (XE_GT_WA(gt, 14022866841))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO,
> >  					&offset, &remain);
> > @@ -395,22 +395,22 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
> >  	 * the default value for this register is determined to be 0xC40. This could change in the
> >  	 * future, so GuC depends on KMD to send it the correct value.
> >  	 */
> > -	if (XE_WA(gt, 13011645652))
> > +	if (XE_GT_WA(gt, 13011645652))
> >  		guc_waklv_enable_one_word(ads,
> >  					  GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE,
> >  					  0xC40,
> >  					  &offset, &remain);
> >  
> > -	if (XE_WA(gt, 14022293748) || XE_WA(gt, 22019794406))
> > +	if (XE_GT_WA(gt, 14022293748) || XE_GT_WA(gt, 22019794406))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
> >  					&offset, &remain);
> >  
> > -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_WA(gt, 16026508708))
> > +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 44, 0) && XE_GT_WA(gt, 16026508708))
> >  		guc_waklv_enable_simple(ads,
> >  					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
> >  					&offset, &remain);
> > -	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_WA(gt, 16026007364))
> > +	if (GUC_FIRMWARE_VER(&gt->uc.guc) >= MAKE_GUC_VER(70, 47, 0) && XE_GT_WA(gt, 16026007364))
> >  		guc_waklv_enable_two_word(ads,
> >  					  GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> >  					  0x0,
> > @@ -819,7 +819,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> >  		guc_mmio_regset_write_one(ads, regset_map, e->reg, count++);
> >  	}
> >  
> > -	if (XE_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> > +	if (XE_GT_WA(hwe->gt, 1607983814) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> >  		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> >  			guc_mmio_regset_write_one(ads, regset_map,
> >  						  XELP_LNCFCMOCS(i), count++);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 68b192fe3b32..0f8430acd16d 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -722,7 +722,7 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
> >   */
> >  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
> >  {
> > -	if (XE_WA(pc_to_gt(pc), 22019338487)) {
> > +	if (XE_GT_WA(pc_to_gt(pc), 22019338487)) {
> >  		if (wait_for_flush_complete(pc) != 0)
> >  			return -EAGAIN;
> >  	}
> > @@ -835,7 +835,7 @@ static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
> >  {
> >  	struct xe_gt *gt = pc_to_gt(pc);
> >  
> > -	if (XE_WA(gt, 22019338487)) {
> > +	if (XE_GT_WA(gt, 22019338487)) {
> >  		if (xe_gt_is_media_type(gt))
> >  			return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
> >  		else
> > @@ -899,7 +899,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> >  	if (pc_get_min_freq(pc) > pc->rp0_freq)
> >  		ret = pc_set_min_freq(pc, pc->rp0_freq);
> >  
> > -	if (XE_WA(tile->primary_gt, 14022085890))
> > +	if (XE_GT_WA(tile->primary_gt, 14022085890))
> >  		ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ, pc_get_min_freq(pc)));
> >  
> >  out:
> > @@ -931,7 +931,7 @@ static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
> >  {
> >  	struct xe_gt *gt = pc_to_gt(pc);
> >  
> > -	return  XE_WA(gt, 22019338487) &&
> > +	return  XE_GT_WA(gt, 22019338487) &&
> >  		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
> >  }
> >  
> > @@ -1017,7 +1017,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
> >  {
> >  	int ret;
> >  
> > -	if (!XE_WA(pc_to_gt(pc), 22019338487))
> > +	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
> >  		return 0;
> >  
> >  	guard(mutex)(&pc->freq_lock);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 796ba8c34a16..1cf623b4a5bc 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -576,7 +576,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >  	u32 maxcnt_units_ns = 640;
> >  	bool inhibit_switch = 0;
> >  
> > -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_WA(gt, 16023105232)) {
> > +	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> >  		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >  		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> > index 540f044bf425..7fe0e40ef3db 100644
> > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > @@ -76,7 +76,7 @@ lrc_to_xe(struct xe_lrc *lrc)
> >  static bool
> >  gt_engine_needs_indirect_ctx(struct xe_gt *gt, enum xe_engine_class class)
> >  {
> > -	if (XE_WA(gt, 16010904313) &&
> > +	if (XE_GT_WA(gt, 16010904313) &&
> >  	    (class == XE_ENGINE_CLASS_RENDER ||
> >  	     class == XE_ENGINE_CLASS_COMPUTE))
> >  		return true;
> > @@ -1025,7 +1025,7 @@ static ssize_t setup_timestamp_wa(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
> >  	const u32 ts_addr = __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> >  	u32 *cmd = batch;
> >  
> > -	if (!XE_WA(lrc->gt, 16010904313) ||
> > +	if (!XE_GT_WA(lrc->gt, 16010904313) ||
> >  	    !(hwe->class == XE_ENGINE_CLASS_RENDER ||
> >  	      hwe->class == XE_ENGINE_CLASS_COMPUTE ||
> >  	      hwe->class == XE_ENGINE_CLASS_COPY ||
> > @@ -1062,7 +1062,7 @@ static ssize_t setup_invalidate_state_cache_wa(struct xe_lrc *lrc,
> >  {
> >  	u32 *cmd = batch;
> >  
> > -	if (!XE_WA(lrc->gt, 18022495364) ||
> > +	if (!XE_GT_WA(lrc->gt, 18022495364) ||
> >  	    hwe->class != XE_ENGINE_CLASS_RENDER)
> >  		return 0;
> >  
> > @@ -2004,7 +2004,7 @@ u32 *xe_lrc_emit_hwe_state_instructions(struct xe_exec_queue *q, u32 *cs)
> >  	 * continue to emit all of the SVG state since it's best not to leak
> >  	 * any of the state between contexts, even if that leakage is harmless.
> >  	 */
> > -	if (XE_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
> > +	if (XE_GT_WA(gt, 14019789679) && q->hwe->class == XE_ENGINE_CLASS_RENDER) {
> >  		state_table = xe_hpg_svg_state;
> >  		state_table_size = ARRAY_SIZE(xe_hpg_svg_state);
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index 5729e7d3e335..a188bad172ad 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -822,7 +822,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
> >  	u32 sqcnt1;
> >  
> >  	/* Enable thread stall DOP gating and EU DOP gating. */
> > -	if (XE_WA(stream->gt, 1508761755)) {
> > +	if (XE_GT_WA(stream->gt, 1508761755)) {
> >  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> >  					  _MASKED_BIT_DISABLE(STALL_DOP_GATING_DISABLE));
> >  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> > @@ -1079,7 +1079,7 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> >  	 * EU NOA signals behave incorrectly if EU clock gating is enabled.
> >  	 * Disable thread stall DOP gating and EU DOP gating.
> >  	 */
> > -	if (XE_WA(stream->gt, 1508761755)) {
> > +	if (XE_GT_WA(stream->gt, 1508761755)) {
> >  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN,
> >  					  _MASKED_BIT_ENABLE(STALL_DOP_GATING_DISABLE));
> >  		xe_gt_mcr_multicast_write(stream->gt, ROW_CHICKEN2,
> > @@ -1754,7 +1754,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> >  	 * GuC reset of engines causes OA to lose configuration
> >  	 * state. Prevent this by overriding GUCRC mode.
> >  	 */
> > -	if (XE_WA(stream->gt, 1509372804)) {
> > +	if (XE_GT_WA(stream->gt, 1509372804)) {
> >  		ret = xe_guc_pc_override_gucrc_mode(&gt->uc.guc.pc,
> >  						    SLPC_GUCRC_MODE_GUCRC_NO_RC6);
> >  		if (ret)
> > @@ -1886,7 +1886,7 @@ u32 xe_oa_timestamp_frequency(struct xe_gt *gt)
> >  {
> >  	u32 reg, shift;
> >  
> > -	if (XE_WA(gt, 18013179988) || XE_WA(gt, 14015568240)) {
> > +	if (XE_GT_WA(gt, 18013179988) || XE_GT_WA(gt, 14015568240)) {
> >  		xe_pm_runtime_get(gt_to_xe(gt));
> >  		reg = xe_mmio_read32(&gt->mmio, RPM_CONFIG0);
> >  		xe_pm_runtime_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 44d44bbc71dc..4dbe5732cb7f 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -477,7 +477,7 @@ static size_t calc_topo_query_size(struct xe_device *xe)
> >  			sizeof_field(struct xe_gt, fuse_topo.eu_mask_per_dss);
> >  
> >  		/* L3bank mask may not be available for some GTs */
> > -		if (!XE_WA(gt, no_media_l3))
> > +		if (!XE_GT_WA(gt, no_media_l3))
> >  			query_size += sizeof(struct drm_xe_query_topology_mask) +
> >  				sizeof_field(struct xe_gt, fuse_topo.l3_bank_mask);
> >  	}
> > @@ -540,7 +540,7 @@ static int query_gt_topology(struct xe_device *xe,
> >  		 * mask, then it's better to omit L3 from the query rather than
> >  		 * reporting bogus or zeroed information to userspace.
> >  		 */
> > -		if (!XE_WA(gt, no_media_l3)) {
> > +		if (!XE_GT_WA(gt, no_media_l3)) {
> >  			topo.type = DRM_XE_TOPO_L3_BANK;
> >  			err = copy_mask(&query_ptr, &topo, gt->fuse_topo.l3_bank_mask,
> >  					sizeof(gt->fuse_topo.l3_bank_mask));
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index e8f22ec5f9af..5f15360d14bf 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -179,7 +179,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> >  	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> >  	u32 flags;
> >  
> > -	if (XE_WA(gt, 14016712196))
> > +	if (XE_GT_WA(gt, 14016712196))
> >  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_DEPTH_CACHE_FLUSH,
> >  				      LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> >  
> > @@ -190,7 +190,7 @@ static int emit_render_cache_flush(struct xe_sched_job *job, u32 *dw, int i)
> >  		 PIPE_CONTROL_DC_FLUSH_ENABLE |
> >  		 PIPE_CONTROL_FLUSH_ENABLE);
> >  
> > -	if (XE_WA(gt, 1409600907))
> > +	if (XE_GT_WA(gt, 1409600907))
> >  		flags |= PIPE_CONTROL_DEPTH_STALL;
> >  
> >  	if (lacks_render)
> > @@ -206,7 +206,7 @@ static int emit_pipe_control_to_ring_end(struct xe_hw_engine *hwe, u32 *dw, int
> >  	if (hwe->class != XE_ENGINE_CLASS_RENDER)
> >  		return i;
> >  
> > -	if (XE_WA(hwe->gt, 16020292621))
> > +	if (XE_GT_WA(hwe->gt, 16020292621))
> >  		i = emit_pipe_control(dw, i, 0, PIPE_CONTROL_LRI_POST_SYNC,
> >  				      RING_NOPID(hwe->mmio_base).addr, 0);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > index 9a9733447230..dc588255674d 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> > @@ -166,7 +166,7 @@ static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_stolen_mgr
> >  
> >  	stolen_size -= wopcm_size;
> >  
> > -	if (media_gt && XE_WA(media_gt, 14019821291)) {
> > +	if (media_gt && XE_GT_WA(media_gt, 14019821291)) {
> >  		u64 gscpsmi_base = xe_mmio_read64_2x32(&media_gt->mmio, GSCPSMI_BASE)
> >  			& ~GENMASK_ULL(5, 0);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 432ea325677d..148a2425006f 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2068,7 +2068,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
> >  	if (XE_IOCTL_DBG(xe, args->extensions))
> >  		return -EINVAL;
> >  
> > -	if (XE_WA(xe_root_mmio_gt(xe), 14016763929))
> > +	if (XE_GT_WA(xe_root_mmio_gt(xe), 14016763929))
> >  		args->flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
> >  
> >  	if (XE_IOCTL_DBG(xe, args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE &&
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 22a98600fd8f..154c0e50cc3c 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -1079,6 +1079,6 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile)
> >  	if (IS_SRIOV_VF(tile->xe))
> >  		return;
> >  
> > -	if (XE_WA(tile->primary_gt, 22010954014))
> > +	if (XE_GT_WA(tile->primary_gt, 22010954014))
> >  		xe_mmio_rmw32(mmio, XEHP_CLOCK_GATE_DIS, 0, SGSI_SIDECLK_DIS);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> > index f3880c65cb8d..4c3163eeda0d 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.h
> > +++ b/drivers/gpu/drm/xe/xe_wa.h
> > @@ -25,11 +25,11 @@ void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
> >  void xe_wa_dump(struct xe_gt *gt, struct drm_printer *p);
> >  
> >  /**
> > - * XE_WA - Out-of-band workarounds, to be queried and called as needed.
> > + * XE_GT_WA - Out-of-band workarounds, to be queried and called as needed.
> 
> Out-of-band GT workarounds
> 
> And also please rename the functions that are related to gt only and which
> the device is in place. i.e.:
> 
> - int xe_wa_init(struct xe_gt *gt);
> + xe_wa_gt_init
> 
> - void xe_wa_process_oob(struct xe_gt *gt);
> + xe_wa_process_gt_oob
> 
> the rest of the patch looks good.
> The functions can be in a separate patch if you prefer
Ack.

We should probably update the back end files and arrays as well

MattA
> 
> >   * @gt__: gt instance
> >   * @id__: XE_OOB_<id__>, as generated by build system in generated/xe_wa_oob.h
> >   */
> > -#define XE_WA(gt__, id__) ({						\
> > +#define XE_GT_WA(gt__, id__) ({						\
> >  	xe_gt_assert(gt__, (gt__)->wa_active.oob_initialized);		\
> >  	test_bit(XE_WA_OOB_ ## id__, (gt__)->wa_active.oob);		\
> >  })
> > -- 
> > 2.49.0
> > 
