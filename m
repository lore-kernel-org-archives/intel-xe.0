Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9465CC87FD3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 23:11:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4465D10E7FA;
	Thu, 31 Jul 2025 23:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIaynk8l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40F410E7FA
 for <Intel-Xe@lists.freedesktop.org>; Thu, 31 Jul 2025 23:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754003487; x=1785539487;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BknhyerclwYplx0oL0EL0cDKe7jSRltMU+yju5zmfK0=;
 b=JIaynk8lJnyvjaDLMkPqGQ2x1lhhA5CX6ty/8Gl0xb21rQxF/HQay2uO
 6Amh84g3nK/I+2wYjYDKHR6/ZMliaHs0rVLWkW52n4GZIMYtmEa652DoC
 rH2GMmUvFrJBUwRHAAV3Pq4vmRKJW0QEbqCSceESojzaPdwhQbPpKLTYA
 hozim24Nj3FOHsgnjeoFyQdve6IEiVpPjCcQdxWMNzIvwKvtBBdLnAP+4
 6tVuHPc0MXY4InL7RO+CerEyjCdZAcDjiDnd3CebER3wAPA53/deqaE14
 gESZHg/ok9VM5Kj6W4CImNZPeHHkqX4zHR9biAYWSv8Xbq10J2zlDUnmh w==;
X-CSE-ConnectionGUID: 6jV5lhgVQmGOQ5+EEERimg==
X-CSE-MsgGUID: XhGM7VDOQzOsR4oDRNelrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="66913465"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="66913465"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 16:11:26 -0700
X-CSE-ConnectionGUID: iSqc8KKdSoqKf/EHPb9VmA==
X-CSE-MsgGUID: zuSGchGuRSuf8uVu2TCREA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167616701"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 16:11:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 16:11:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 16:11:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 16:11:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uk7Yz5OUa5tPaClsE2heA/lXspO9T/cdg/Np0suCGAMfqsyeNq+WMEXEPq+grF6YIL05SPtEeSZiMNkeDKj9Pu6m7MYGR470xWhBclQ7wuSWt6Rivu0NPQRvqugZ5TdX7MjEzB9RjuCooHVzn0KJ1HoF3uUMUibSxvyJvSN4qMoTFHghoiT4k9hb9WdXznCH2wduMgr0q09figuE/DoihBT3Ga9J+zXLHusEhRjdJVZ/5IQMPF0UqezUF1QlpAgYb/SFinZWLROVsIFc1Vfh/gngyVzTl2NUyfZJ3K6Te6+NzesO3Z6X6iUwNpEePPuzRn493RB169jjbDoZNo2QEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fuMPS6EM0NlOai1KGTBpvVw1k69YJkUb3J3fc0Zx69g=;
 b=iHF/2A8qoO0fvOV0//LbVRrkBnXu9ejZaxbppFv9/AC7OJqKd+Wc7BuPOKtJ6o3X5v+AESI2weUEygBReE/VdmXLW/fHAgzYUCmYQvZFGA2iIseNwmd2OvJzQpgCcFQm26yHkUyxG4v4igzz7lHVozq6/74qk1jOygNeeuYAKjHcNsBtVmUe/YvXpR+Xmn45z+/iiMTbhiVRlT3jMSdzJoyezX3X8QM8BwnnxzSmvgdwAEALZcnFKbLKkARejG1qNF/kfFTv2E3FE7GTBB+fpSKZ2Pa4Z94pzarkakt3goaIWWN5b04ERV0akyZ9PnCiCpLfx4QU1oL1l5pSGcB4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA4PR11MB9345.namprd11.prod.outlook.com (2603:10b6:208:56c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 31 Jul
 2025 23:11:23 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524%7]) with mapi id 15.20.8964.025; Thu, 31 Jul 2025
 23:11:23 +0000
Message-ID: <7b046038-f7d6-4833-9907-836d905a5d7a@intel.com>
Date: Thu, 31 Jul 2025 16:11:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/guc: Update CSS header structures
To: <John.C.Harrison@Intel.com>, <Intel-Xe@Lists.FreeDesktop.Org>
References: <20250725002111.3906267-1-John.C.Harrison@Intel.com>
 <20250725002111.3906267-2-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250725002111.3906267-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA4PR11MB9345:EE_
X-MS-Office365-Filtering-Correlation-Id: 3026a91d-eb4e-43a7-acb3-08ddd087911a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UnQzM0liZW5zTVE3MWNWNlFWOWMzSCsyN3hZMGV1WEEyQnhybzI0NXZsRTJD?=
 =?utf-8?B?Q1ZEUVZZaUVIMXlsZnVrdDhxc2lpN3A2cGdLM1FVd2I1eXlYRTAvdXU1VjV4?=
 =?utf-8?B?cjhIZlNtWTJ1V005R1Q5T3ZZSlk4UmhSRDFXck4wcjBNQ0puVHNyMHdDWkU0?=
 =?utf-8?B?dUpLOXpLZ05JUGpMMnJDeFdrK0dYeWprNitrb3ZYdGpMdDVNQnovb3A1Y0hF?=
 =?utf-8?B?cG9ZYlBTVmw4Um1iSjVMQWM5ZmlmQ21BUzM1bUdzUVdWeFcxZ3FWK2dUczNs?=
 =?utf-8?B?d0ROeUVlMmhpUUpBUllWcUorNzNZQ0hPWlhSdTBpVUVyNWc0Nk9tRCtBbVYw?=
 =?utf-8?B?OEUxWTBlWE9QallQTkV2bnlkOWEzOE43TU4wWE1TcDhrUzBKRnJvV01qa1ZT?=
 =?utf-8?B?TCsrSDdLMUxqNm0wQVFlVUN0Y0tENmVqUHdQcHJvNlcxTlcvYUFKR3ovREdI?=
 =?utf-8?B?YkpBU1NDNm5RYUNEeXRHR0x2TTFpb0NwZkZaL1U4ZEF2L3RoeDJDSEdiTllO?=
 =?utf-8?B?NG5xbUh6MytMK3pNMzdMY1RYVXRVUXNOZkt6MDR6cUJiZkQ0eXZZNmg2bFBB?=
 =?utf-8?B?d2F5b3p5Yll5ZjdCb2dLT3NabGZFbGUwdGhuKzBuSWhuOWxZRWRWZys2K3Bh?=
 =?utf-8?B?ckJxeU8yYXlGSUM0RmxabkR5Zkl4N2NDTzc5aXExK2Y4VlBCVHFsY1VGclU4?=
 =?utf-8?B?R3lzNmNkU3gwMU9acnFxaXUyQUdDNUx6Zm4zN09qVWFmR2RxV0dUOHVEaWUr?=
 =?utf-8?B?ZzJ6M2pPNTBLNzhBYnlnMmtlR0IybXNSMjBkVmh6dTNmUDMrSGZRdDRxRmFl?=
 =?utf-8?B?WG5iZXhsV1l4WkdxaUVXaWhJMHRENFU5VGVpTUhjNzVlRFlJSFFEeXl3SXN3?=
 =?utf-8?B?UC9pbENBMDkwMUhxb1JPOWM2WlZjdkYxQTRQMEcvVXRRUHNFWDNlLytLWXgz?=
 =?utf-8?B?ZHBvTERCY0FkZDMxY0NJbHNLZzgydHBKc0FLNzZNVW1HSVRmTEZ2WWpSWFg1?=
 =?utf-8?B?VDRkdk0vY3JhLzZJdHppcG9IeUo2anpmRFVWYVpnZ2ZBRUMxc1NLZldTSkVk?=
 =?utf-8?B?bTFqQTQ0ZVJ0ZFh5M2piT09QSlhQY3hIMFRYVkx6blBETXdSSTlSZnhqN01I?=
 =?utf-8?B?Wm9BNGg3eU5vOEVyblVVUk1ma1ZNdUx0cm1oUDJkemxzWVBWR25Lb0VYaEpT?=
 =?utf-8?B?K2ZSTWlhU0xVLzVpaXlZbEhFVzJ1R3BHRjc0dzlqdWF6dTVweXorTUZzbklQ?=
 =?utf-8?B?b0VMZWhTUHoyQUM1bDB4NFVLTldtYm05YStXRHJwZDFYV3FEQ0ZsU3NIKzFw?=
 =?utf-8?B?M1B2VDFjdmx6cjN0WVM4elFkS1RkSkYwWVZwQ240RTROTFBwOUw0SjBtY1FR?=
 =?utf-8?B?UEY4WGwwTXcva0NmZWhhZlg3dVNvbTVTUjdMNGw5ZTJCZ0M1SkhseUxKNnRB?=
 =?utf-8?B?L0V0YUg5RXFKb1MvK0o3ekF1cjFGK0hVWVFNRUcza0F0TG15S2pqUnp0aEdU?=
 =?utf-8?B?N0ZFSjI3N25QYTZWNE12U0E0NTZTeVQwa0lKWlJRbjNSOVJ6NWd2eUNvTm1V?=
 =?utf-8?B?SC9rbXFWRFJqNGY0YnZPd2ZDc2pXV2RJNUdBODhSUHVhQTlGWTVpR2hFS25M?=
 =?utf-8?B?Tjk5TVhaTDdxdEFJU2I5UEZvck1uM1QwQlkzOUdOY0xkdmRtcjB4clpLb2lE?=
 =?utf-8?B?Snp1RDdJdGpISkdPSDBUcTFWYXFyMW1QQWJoZStReDhmbi9GK200RnFRekdN?=
 =?utf-8?B?ZWplYUJtbDdYS1JTd1FYSFU4eFNnNE9PYW05UGdpWTc0RjJsU3pwc2FSYUc4?=
 =?utf-8?B?a1pKcGVaTkdQb3UwcGFKbW9zLy9EdDJtQkZKcGZhVndwalN0TmVjTkx3enpU?=
 =?utf-8?B?bjNNSkx0YmU1NUxGMHpDa0w0eGdKVXlOVGE2b21uWVN2Vkw5d2V3eWhiN095?=
 =?utf-8?Q?vR7TeEwCKPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5iNXhYSUgzRWVOV1RMdTVXZkVPcWwyWWYycDQrZDVFQnNRVzZWWE1HSWUw?=
 =?utf-8?B?Mm95c2hDR1J1WmdCZUVKQXI4dExNYzdYdUhDSCtaRkN6UXhhTVp2N1NMVWRp?=
 =?utf-8?B?WWRqSkxDQ1NLdlYzQU9TOTMrczFuUlNVT1VSWldoSWVrbC9EYkhobTlUb0FB?=
 =?utf-8?B?VXpKQmZQRjNpWWhNN2luUWkyNmNlb2MzdW4yK3VRQ3dyMXdnMWxybkZIMFpt?=
 =?utf-8?B?RGxvaFMyaWNRZjBoSE05M0dlVS85blRJbXJ4NlptT1o1dGFVVXdSWU5EeHJW?=
 =?utf-8?B?YW8vTDFtTjdpWklJK1FUSmtObGdPenB4WXlqaFRPbUkwQzNnQlJlenlwclBU?=
 =?utf-8?B?SGI0OStxQXpvYVJmc0diSFFFT1FURlFSZ3NuTEd0alRPOTNYQzZJcWlPVjYx?=
 =?utf-8?B?Wmg1TTZGdXdnMWFnQkQvL1YwelRMZXpGT1NQbVFmWndzUk9xZUdoRDI5QW1H?=
 =?utf-8?B?Snp3ZVBLRmc0ZHJ5dlR6RkIrY1lnWnBCZTJINUsyNTg2NXJMMzNLN3gyemEz?=
 =?utf-8?B?TmhMZ1kvczFVTndOZEtraGtxV2pOOUNBNVYzSGZhWDBNZnNIZUFuTWdXTHo1?=
 =?utf-8?B?VzQvZTlLQURKdGVtMjhMMExSdkVYZ2hoUEY2eXNSaE4wK3VUOTU0WHY1THg1?=
 =?utf-8?B?VS9MQ2trRHRWUURsUVIyWThEaTlxTUdUWndHVU1ZZ2FLY1BJNnpkckFPSTY1?=
 =?utf-8?B?Sm9iTGdQNnNrM2IyODNIYkxsSHAyNHFQQTlZaTdhYVdwa3hZRmM4ZVJUTmdp?=
 =?utf-8?B?NVdhOUZKQzN2czFnaDNTdDFxTyt0MWdQU05LOVk5MjdGS0g5WE5DSW05WUNl?=
 =?utf-8?B?MC9aMVhtZUFEL2owU3Q2aWlNRUVNNGY1WmFiQk43ZE1yZEtmeTN2S05WbG5w?=
 =?utf-8?B?NTd1RDcxSnVrQ2xqL3lkeld4c2lVakIxZ0VUSnF5cDNtT1BhVFd3S0RBN3JY?=
 =?utf-8?B?RHA3V0VNT1RuMnVpVUFxOURtQ2JodUM2dEZtMnBqN1RWTzM2b253L0hOMFdJ?=
 =?utf-8?B?ZzlWRnNqeDZ5R2pmbXNVTTRNc3M4VmFMVS9IK29PSXRrRkc3a0NOWE1Ya25Z?=
 =?utf-8?B?TUdnQ1RSSDF3bjBvamlGWERpNVN4N1FnRkdKeUxxUExvc0xRWEpyMldWZGxI?=
 =?utf-8?B?eW51RmNjUmlINFJaTTlGYlB0N3JCWS9tUlI5Wjgwa3dtNnplSXhFMFVJQ0k5?=
 =?utf-8?B?YUU5UkdmbStBZ3UwbHZRY2J0aE90R0NmRmw0cjk5QXIrdWozOHZXc2Z0ZXNT?=
 =?utf-8?B?R0t6Uk9acmtjQzl4NVBKSFE4RHJmMExBeXh2Qm5RNTVCNzhuQkNHajkyTkdl?=
 =?utf-8?B?V24ydmFaWE9BcXNjTy9UMjQ0czlUcFRWR3hVandibnJTWWI3b2FLZVZRbFB1?=
 =?utf-8?B?d2liY3VFVjFwVHVvS0tVS1hxQ2g0d3NpWUhZc1RicnZlZEljT1FsWTlpd0lp?=
 =?utf-8?B?U25ycVl2RDJHbEg5V3BURFA3S2xXVzVRdVVJdU9UWXNOeXB2ZTgvdll2WlV5?=
 =?utf-8?B?NGlQVnR0OVA1Z1kzQnd5TVBraHZ1bzZURWZBWklHS05rNlJoM2k5ZEl2N3ht?=
 =?utf-8?B?ZkNPVjg1L1ZPRVFaSzdsU3NjMlB5ZUZ4UTFWTXBUTDBFKzgrQVJCdldGeklt?=
 =?utf-8?B?VVk1bUtkZXF6MFk4bjBHMjFjSU8wYnY5c1FuOVhCMUQ2b1pDR3l5YjV0dE1v?=
 =?utf-8?B?Z3BaOGd2a0lkOEZrZDhpQlB3cVhoRjF2VnJqZ1daOW5LUG9mV0lpTllaVm9D?=
 =?utf-8?B?SGpFRU05YjhsZEdCZHFaR2traEhlL2VJb1FkT3hxeDZFK2crRUtDcm1zcmVC?=
 =?utf-8?B?UjFKNE80UDlhNzk1TnRDTGllSVFka2UraHE1T2Y5Y05oZ2QveTg1aU9ZV01W?=
 =?utf-8?B?SUxwMXlrTGxFVzBpUlRybkpPeEVIMi9vZEF6aHdaeit4OXhxeVU1RFFmUEpl?=
 =?utf-8?B?MkM0Nzd3SzNvc2pCQjNXejBoNi9QNEVGNFV4RkJCMWxhdEdyK3VzL2pzM2hD?=
 =?utf-8?B?MStHNCtjUFhRQ0dqazVYa3hoaUpiOU03OVNUeXNjYXVZaWVGSmU4SG5pSFBu?=
 =?utf-8?B?cllyMDgwOWtXT2QrUjU4SWcycUFrWjJ6RldCWHE3ZUdHNEpxay9nbEVJTllX?=
 =?utf-8?B?NVBob1R3OE8wa29JcUFFdXFVUE92aDB3V3c0RHNkaVRyRzByVHJMc0N2Y3Va?=
 =?utf-8?Q?m0Capp/TwEK9D3LfE+l9t0A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3026a91d-eb4e-43a7-acb3-08ddd087911a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 23:11:23.2837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oP4BlZOHIjkxIa2Q9yASpeM9+6wdvDwjdiD9yBVWYSE0owhY6ewO7N9jeVNAFpuvfCtndRl9GZsx+O3uE9xMhhqQ+KMjV23Tf4YUHtIUMR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9345
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



On 7/24/2025 5:21 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Rework the CSS header structure according to recent updates to the GuC
> API spec. Also include more field definitions.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc_fw.c     | 20 +++++-----
>   drivers/gpu/drm/xe/xe_uc_fw_abi.h | 64 ++++++++++++++++++++-----------
>   2 files changed, 51 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index a236f1d37248..c8378f3e0032 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -344,11 +344,11 @@ static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)

Since we now have a specific type for it, it might be worth changing 
this function to accept struct uc_css_guc_info instead of struct 
uc_css_header.

>   		return -EINVAL;
>   	}
>   
> -	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
> -	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
> -	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
> +	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.submission_version);
> +	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.submission_version);
> +	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.submission_version);
>   
> -	uc_fw->private_data_size = css->private_data_size;
> +	uc_fw->private_data_size = css->guc_info.private_data_size;
>   
>   	return 0;
>   }
> @@ -417,8 +417,8 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	css = (struct uc_css_header *)fw_data;
>   
>   	/* Check integrity of size values inside CSS header */
> -	size = (css->header_size_dw - css->key_size_dw - css->modulus_size_dw -
> -		css->exponent_size_dw) * sizeof(u32);
> +	size = (css->header_size_dw - css->rsa_info.key_size_dw - css->rsa_info.modulus_size_dw -
> +		css->rsa_info.exponent_size_dw) * sizeof(u32);
>   	if (unlikely(size != sizeof(struct uc_css_header))) {
>   		drm_warn(&xe->drm,
>   			 "%s firmware %s: unexpected header size: %zu != %zu\n",
> @@ -431,7 +431,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	uc_fw->ucode_size = (css->size_dw - css->header_size_dw) * sizeof(u32);
>   
>   	/* now RSA */
> -	uc_fw->rsa_size = css->key_size_dw * sizeof(u32);
> +	uc_fw->rsa_size = css->rsa_info.key_size_dw * sizeof(u32);
>   
>   	/* At least, it should have header, uCode and RSA. Size of all three. */
>   	size = sizeof(struct uc_css_header) + uc_fw->ucode_size +
> @@ -444,9 +444,9 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
>   	}
>   
>   	/* Get version numbers from the CSS header */
> -	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->sw_version);
> -	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->sw_version);
> -	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
> +	release->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->guc_info.sw_version);
> +	release->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->guc_info.sw_version);
> +	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->guc_info.sw_version);
>   
>   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
>   		return guc_read_css_info(uc_fw, css);
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw_abi.h b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> index 87ade41209d0..44d529dbce3b 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> +++ b/drivers/gpu/drm/xe/xe_uc_fw_abi.h
> @@ -44,6 +44,39 @@
>    *    in fw. So driver will load a truncated firmware in this case.
>    */
>   
> +struct uc_css_rsa_info {
> +	u32 key_size_dw;
> +	u32 modulus_size_dw;
> +	u32 exponent_size_dw;
> +} __packed;
> +
> +struct uc_css_guc_info {
> +	u32 time;
> +#define CSS_TIME_HOUR				(0xFF << 0)
> +#define CSS_DATE_MIN				(0xFF << 8)
> +#define CSS_DATE_SEC				(0xFFFF << 16)
> +	u32 reserved0[5];
> +	u32 sw_version;
> +#define CSS_SW_VERSION_UC_MAJOR			(0xFF << 16)
> +#define CSS_SW_VERSION_UC_MINOR			(0xFF << 8)
> +#define CSS_SW_VERSION_UC_PATCH			(0xFF << 0)
> +	u32 submission_version;
> +	u32 reserved1[11];
> +	u32 header_info;
> +#define CSS_HEADER_INFO_SVN			(0xFF)
> +#define CSS_HEADER_INFO_COPY_VALID		(0x1 << 31)
> +	u32 private_data_size;
> +	u32 ukernel_info;
> +#define CSS_UKERNEL_INFO_DEVICEID		(0xFFFF << 16)
> +#define CSS_UKERNEL_INFO_PRODKEY		(0xFF << 8)
> +#define CSS_UKERNEL_INFO_BUILDTYPE		(0x3 << 2)
> +#define CSS_UKERNEL_INFO_BUILDTYPE_PROD		0
> +#define CSS_UKERNEL_INFO_BUILDTYPE_PREPROD	1
> +#define CSS_UKERNEL_INFO_BUILDTYPE_DEBUG	2
> +#define CSS_UKERNEL_INFO_ENCSTATUS		(0x1 << 1)
> +#define CSS_UKERNEL_INFO_COPY_VALID		(0x1 << 0)

I'd skip defining CSS_UKERNEL_INFO_COPY_VALID and 
CSS_HEADER_INFO_COPY_VALID. They're only set in the HW's copy of those 
fields, which are only consumed by bootrom; we'll never see them set 
from the driver POV (or even from the POV of someone hexdumping the 
binary), so having the define has no use.

> +} __packed;
> +
>   struct uc_css_header {
>   	u32 module_type;
>   	/*
> @@ -52,36 +85,21 @@ struct uc_css_header {
>   	 */
>   	u32 header_size_dw;
>   	u32 header_version;
> -	u32 module_id;
> +	u32 reserved0;
>   	u32 module_vendor;
>   	u32 date;
> -#define CSS_DATE_DAY			(0xFF << 0)
> -#define CSS_DATE_MONTH			(0xFF << 8)
> -#define CSS_DATE_YEAR			(0xFFFF << 16)
> +#define CSS_DATE_DAY				(0xFF << 0)
> +#define CSS_DATE_MONTH				(0xFF << 8)
> +#define CSS_DATE_YEAR				(0xFFFF << 16)
>   	u32 size_dw; /* uCode plus header_size_dw */
> -	u32 key_size_dw;
> -	u32 modulus_size_dw;
> -	u32 exponent_size_dw;
> -	u32 time;
> -#define CSS_TIME_HOUR			(0xFF << 0)
> -#define CSS_DATE_MIN			(0xFF << 8)
> -#define CSS_DATE_SEC			(0xFFFF << 16)
> -	char username[8];
> -	char buildnumber[12];
> -	u32 sw_version;
> -#define CSS_SW_VERSION_UC_MAJOR		(0xFF << 16)
> -#define CSS_SW_VERSION_UC_MINOR		(0xFF << 8)
> -#define CSS_SW_VERSION_UC_PATCH		(0xFF << 0)
>   	union {
> -		u32 submission_version; /* only applies to GuC */
> -		u32 reserved2;
> +		u32 reserved1[3];
> +		struct uc_css_rsa_info rsa_info;

Do we actually support any binary where this block is reserved instead 
of containing the rsa_info?

Daniele

>   	};
> -	u32 reserved0[12];
>   	union {
> -		u32 private_data_size; /* only applies to GuC */
> -		u32 reserved1;
> +		u32 reserved2[22];
> +		struct uc_css_guc_info guc_info;
>   	};
> -	u32 header_info;
>   } __packed;
>   static_assert(sizeof(struct uc_css_header) == 128);
>   

