Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0889C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 18:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C4A10E381;
	Mon, 10 Feb 2025 18:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xl0G3qA9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D26910E381
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 18:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739210423; x=1770746423;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9h9i+RAFnRzFEF8wAZxqMtLmqPzv4Xq7OCgvEKvmwSw=;
 b=Xl0G3qA9bl/JM0jkebmTq+ITPMOZIkMAEb/JMRF95t9IxiN/e+MRta14
 7m5T6E5vhuSc0VDcfKEBxUgUSbi1SQOV35IxQQn2FddSuFitIkbXBiian
 eyl6XgWBoC//5GPxjsKb6D5tE18+3Mt3PYNvjHwOhsLw5A/iLhFAPhSjC
 o4e9IG5VNsiA2ordKf8DexgPNuZ+8pbsUShWzU+4+lQP1KUjKGQeV+AZz
 XnpyB9mHb4G1yrkgxhVngMQJUTZSfeKnzds1oMusofw4AzhaKq46cEkdP
 xXkTHGFnXYX1YiVTcJwxvALCKLCYFoLGng/g5iIV/AhfxUAIUPnnMYyvB g==;
X-CSE-ConnectionGUID: RSwX6COJRWeDNSbzelZ1jw==
X-CSE-MsgGUID: C3KT3MUbQwykD/eATNrDpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39044079"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39044079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:00:22 -0800
X-CSE-ConnectionGUID: /weeBVeBQpS1QncnpXSY7A==
X-CSE-MsgGUID: +wTNhCtVROqWrjh6Omrycw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="112009554"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 10:00:22 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 10:00:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 10:00:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 10:00:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jtn12Rk05ZrulFG3qitHpd1LSrWpJQNl+uWvf4rZTW/wQtP1bMOAlwvnXLMOI3NhOQnBTsymkSiqoK1G/e19DagKqoxhZnoSY2f1eBtUCQvtsyhtKkPOCznNpBbxyUClwBYnilnxCUG2Q+C+wYB7+AFA7FCQvU/12bumKWZm91z0fTi4LZtiFyqkmR6AJ8Fv0b2mdMvxco0UjEmKXE1UET0uf0Zh0UXeRttLZpyF2rW0GxoNyhs9L2CMcQBzYsJw9/WD+6/jaTqqUMBp0jomrtx2XenR0sQZ/FEwoJFHDCNX/NECquZ0A3sKhJJ9+MNjmYv+jWwMGQ9AUiqw6khIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3TGvz0CyNnmSCi9DaeVPiCuGqvnqGV68Z0aA7d0FpQ=;
 b=xnh09KliRtlOlsgbVmRbv7EyZBKnqdKj7Q8NFpZPy4bFwQQ2UkF/iJjBlfjwOwh6ddpmvQC4Ty3mEt3PLW7aV1DJl0YHHQlJtCHAYjL58EDn9aUAbVVfLNdXEhF+U5CFlC0eouq3mOOcFp4VzggdI2B8bpU2b+SbmmGxhoD6uUL2csmdFzdJ5CKyUTSzkPXCaynNRPJMgYbIe0rGRRWkjE0yptYgbMfpCfUQgQT+Tbp15mvlApn+r7NphlAIT5tF8h+DxZgjKZHFq3njdvTelBfpTIFVUpeJRI3BrBTaUeXvTwzATnWq08cuh4lZvPvKURHUpk+9FYt6QfXFNNA2mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB7090.namprd11.prod.outlook.com (2603:10b6:806:299::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 17:59:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 17:59:48 +0000
Message-ID: <7ac86f2f-d4d7-47d5-996b-40c4b5a95ff5@intel.com>
Date: Mon, 10 Feb 2025 23:29:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] drm/xe: Fix xe_tile_init_noalloc() error
 propagation
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Daniele
 Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-4-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250207221945.2878241-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB7090:EE_
X-MS-Office365-Filtering-Correlation-Id: 975dac55-734b-4da5-0009-08dd49fcb552
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjNteUdWUUcrbG5Db0d4L2ZUeGZIMDRObzJNcnBMd2huTUtnU0dpL1ErbHRq?=
 =?utf-8?B?dkNQaFlHWW5oL0tWM25TczZ0QlBBMUN2bFkwYmxRWFgxeXJESVJ6dklXdlhk?=
 =?utf-8?B?WEpQWWZ1V3E3TjhSTDBwNFI4dXBlNXExQTBGZ1VpWTN0MjQ5RmNMUzJYTlNp?=
 =?utf-8?B?ZHV2UXZhMGZXTGtXUEIwaGFza0d6RjZYUlVMb05KSmJJZWo1SFVlVjRUWm5q?=
 =?utf-8?B?dTRpbEhYQWttZnlTOWZKRFEvK082KzZNcjFzN1lmVEZOc3RyeW81THpFeldP?=
 =?utf-8?B?Ynd1cFFvaEVFYk1UZ2JDMG83ZW9kQlFYUkpBa2JLTXRmM2ZZT3kwOEFLYzRY?=
 =?utf-8?B?NDJGelRWcW9Xc1Mxd1UzdVAxMkpGNnFSd2JScHAvd1hXbjZkY2ZKQTRLSWtE?=
 =?utf-8?B?aWpUWUoxN0x0bUdhWU1QOThBN0UxRTNkR0lvUkJ1L3phN2Izb3pzT1lXL0hO?=
 =?utf-8?B?UWU4bS9hbkF1V3YxUXRQUm1vYVI1Y2QxblpoQ3loMkJKa0pHQjl4YkVRaHZa?=
 =?utf-8?B?Z3ZXZXNRY3NubWRNT0FOK2xPV2lvVklVSW8vViszbTNRTDhDUlp4NndkT1Q3?=
 =?utf-8?B?akpLZDZ3amZmTTkwMVB5NVcvcHo3N1NueG5jT0tqWU9zYlZrb2wrUy9zVzNr?=
 =?utf-8?B?U3l0Q0lOeldQM3VWOEhOOGh4dkxEajQraDhLb0ZqZ2NkWHVmcnJoYm1YODBp?=
 =?utf-8?B?ckVQbFVtSmNqTWU5MjRGMDFtdWVKV3EycXFpU0F1S0hDeVc2STJldUc5ZGRU?=
 =?utf-8?B?TXltOXJxMDU3TGhvVXlXRXpQUFgzWUtkTUY2OHhMcjlzaFlOMEY0WUNIS0ZO?=
 =?utf-8?B?WmtWMUNMbHpNdGRmeXYvVFJJMmZVaWZ2dHd5WitQazdWVVZ4NGdHbHJ1WFRD?=
 =?utf-8?B?VGh3WHArYU1vVU9QRHVTUW1tNy9BOTl2UXRmQTdlek9rM0FzU1pIV0hYY0lN?=
 =?utf-8?B?bzVJc3VrckVvVFo0ZFVHTE9MUFhPaXRzQVlvUzZmQTU1WGNvWGE4NkFrOXo0?=
 =?utf-8?B?Zk1Sc0c1d1ZlSGVqa09aMjNpY2N4TVViNTYvRnoxNU5CRE1sOXZCeTZkdnNo?=
 =?utf-8?B?WFJYLzB6STYvdEhlNktkZHVsL200Q05BOEc1TUZWdUQ4bU41ejVycC8rZVhL?=
 =?utf-8?B?eE5yZFZwVFdkc1FadHFTdVkvS3VpUFl1Z0ZZVVJqelgxeXNVbmNwcWtDa29j?=
 =?utf-8?B?WG0rT0dGOE81NmI1OC9UTVB5dFZJNlV1NENRUW9SS0c5SVo3SXBuSHdlaFo4?=
 =?utf-8?B?TGx2RmV3R0VBdXFVWFhVZCsrRTlUdUlzUTc5REZ4OGJZNmxLcnE5RmNmVTlk?=
 =?utf-8?B?WkdTeHYwRU5kYUhBOGpwYU80Ulk3ZFJsS25VcFNDY0FaOGh0WVd5SVFmZ05a?=
 =?utf-8?B?QkRTTzIveU8zQ09pdnJ6UjI3aFRoWHdjT2FoRUJuVlorN2xiaGVjdW1rT0Va?=
 =?utf-8?B?allUSm9LOXVvby94M1kvNmowdmdEdCtHclh1U2dkemszS0FrSWxxNE5qWi9h?=
 =?utf-8?B?cW0rNVdURzJPSDh4bWQrOVJsam13c2Jpbk9jaGJzS3FRcFNocmprMUlnclNj?=
 =?utf-8?B?ZDdncllweHE5Sk5oRldhMElzcktNTkt6SFROVkZrV2JKZVQxTXc0UTVlbm41?=
 =?utf-8?B?bThtYUdFWkVoRHIvaXVEVlp6RWpYRUJTY05nNSs0T3ZJNzZTVk1pbmd2VUx2?=
 =?utf-8?B?R2N6bEJWeGFxc0hESmZuWWhLRng5Q29pM3puTFdYWksreUVUeGFPQnNsTGdi?=
 =?utf-8?B?aU5hQ29KVzhHcjZPT0tJdmVTTlozMzI4eExLUmNuZUw4anY1TDBWYTAzVHU1?=
 =?utf-8?B?ZlNnalQvV0tqdHhNNlY4YWVISHAwQjY4Z1ZpbUF3OTdyNjdPa3BVbmxLY3dX?=
 =?utf-8?Q?GTK8sF0Mw4ECy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:vi; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDdkc0VhZ0pMWDlwbCtac3RqcjN6My9vUTk0TFJBY3k0c1NmUUZmTWlpcTVZ?=
 =?utf-8?B?WmRvTndJRUFpRFY5bVVpWC9ZK2NPMW5vRVEyNmdHdmttNUdERnlFUTcxNzZi?=
 =?utf-8?B?NmpyK3hYR3lnSU5ZUVRObUJzcWd2VFZGKzFTdUVieW9tVVJlS2ltckU1eHp2?=
 =?utf-8?B?aUhuR3piYmJXbWRtYmJXQ20ybW1LMUlYSmV6TzE3YU5kZ3ZidTVSeVhhc0k5?=
 =?utf-8?B?V0ZDZDk4Z0R2MDAwb1FscmJPbEJwYmVEOURLek5HR3RINDhZeXA2ZHY3Qy80?=
 =?utf-8?B?OUtURWFBbjFXdnN5ZzZSa2Vlbi8xSm5iQlNYV1llTVFhNG14eTZSU3QvSGY2?=
 =?utf-8?B?Mm13WGlkYnp2eVN0ZVFYNks4bjIrV1V4R0IvbTVlZ3Q3MGswTGVzY2plemdw?=
 =?utf-8?B?QzNuTFAvTlhQaldENlBGMHMzUGxzN1AwL2xUYUhJU1hqZ09QSy95dXVxR2pK?=
 =?utf-8?B?WCs3Y3dXZW9obHZhMml0YlR4UzdTdk5zSlR0bUJMVUtjdXFrQnlPbmtiTEN1?=
 =?utf-8?B?NXI4SkZOcmZKV3pXR21IaklmSUsrV1hRelFmSW5yV1dzZjhLZ2ZQYUFub1Br?=
 =?utf-8?B?eEdjYUg1bEpYdkhTN0ptbUlNNFNsVHdBd2gyUkllSFVsZ2ZTTlBEV0ttMnNk?=
 =?utf-8?B?L3Z1RE9iU2dDeGRPRDdBZ2d6RUExY3czRjZDRVVLbUxxbG9wRVh4b3lEWmVj?=
 =?utf-8?B?YkpHSklhZzBlQVEwSDRyanlBYTNrK0NPNlhLb2FtbEt1dDVkR3RqRlF0cGs1?=
 =?utf-8?B?UU1MNDFiT29LM01MK2xUeDVqeE1DeUxZOGhHQ0ZQeEplekY5bzVkUHBiTkhK?=
 =?utf-8?B?clJKL1Z1N1NKWUhhMTgvVkk5NWRVR0RybWZ0MVhOY2N3c3hCSHpIZFNaNklY?=
 =?utf-8?B?Wi9mSW1FaEYwL0I4ckdGV2lwSXY2bTNMcHpPT2lBMGkxWGlUeXZnbHBLOGY0?=
 =?utf-8?B?eUZneGhoRkhLd3dmS09oYW5seEg4VVpBY0cwdU8rd05KR2wremZqSDFXNkxO?=
 =?utf-8?B?bFN6bm9rY09obkZNYSs1RndMN3FNOGpyMys5WjE0d1RMaHZPRDZONnp5UWdW?=
 =?utf-8?B?NG0wU0ZpaGI1VUp0RFhXa1hsRmZkaElId0VYOS9hSzFuVXJjbE1GclNhczNK?=
 =?utf-8?B?Q3VsUlhZMVQ5MERNdnVFejVQd1IwMDFYa3NkWGE0M2NJb3ordDB5ZGFuOE5x?=
 =?utf-8?B?VFplM2JGZEw2QXVnLzZVNWhKZng5OTNpM2dkL2s4bEFWVHBlUEV0OE9Ra0Y4?=
 =?utf-8?B?U2lsUlZ3KzhUYWVXaGY4cFRlajRvYlNYTUVSUk1RUUFZbExSK0xmZ2cwYVVJ?=
 =?utf-8?B?V0F1Yy9zYkZvd21Tb085NEdPYUtsaXR0dVZYenNhdUU1REYyMWdBZVBkY294?=
 =?utf-8?B?TTVXbzFmckU5TXRsM29LUkpmYjlxeWNPRStuQllwZHZiT2didFFLTndQenBG?=
 =?utf-8?B?WTJjVHhVSFBFU3J1ZjJKOEFRRXdYcU9EKzc1endKL2VseUFRTFFrRFhkekZw?=
 =?utf-8?B?Y2xJWVFtNTd6Q1lBNGZNcWJFMFdHMDlSQ2lBdnJjM1FKWFpGZ2NTb0tBRjZE?=
 =?utf-8?B?WElBSDUyMkVxVU1HVU4waU5CeFhGT0hHRXFMRUg2QU5sT0YzclprbVBrWXpY?=
 =?utf-8?B?MlVZbFhtamt2Rk04L1VNRFpvb2ZwQ29scjd1b2V3aFkvUklOREl6L3N0MGtr?=
 =?utf-8?B?VWw1c0tPT1d2WENnL3ovdjlYcnlmZWlzeUhwVmpiNE1FSGhMaGkrcEdwbzVj?=
 =?utf-8?B?NFlHVzF0cmhRZS9DcG5WYjNFQlNWcFI5enBjMDBRajczQ0dLaUt2RTIrcndI?=
 =?utf-8?B?WmgzRnd0aUxsdTNNWklHS09qZWIzUGtBL1VXcWl6N1dEQmtUaFRIN0ZSNG9n?=
 =?utf-8?B?Wm5ESkVNREFjWHViK3FWSUxOZXdpRGZKNXg0Y2hFZ2VkQjJIWkFhNG5QTUhh?=
 =?utf-8?B?eHpFK29UaG1yYWt2MlFzMThpQU1lUHRTSWcwL3lldzBXS1BMM0dNVFJISVNK?=
 =?utf-8?B?Z0w2UXZDY3dCMDVydTB4NFNLNHUwbS9xc3JVM3ZDNGVjeEpUU2gzbk1VS2x2?=
 =?utf-8?B?TFJqWmlZQ3Z0ZnNyZWx6UFpyRGppNHF1TjBITW5XdUs3Z2ROM2ZIdW1pRGVE?=
 =?utf-8?B?UXh5WnI5TmIxZmpNTWRRdEZMSjkyS3E4d2RvNG1wNGh3YnhzTC9BQjE2VGcz?=
 =?utf-8?Q?wDIhoFwmQ7NMsuRDgKsZ9oE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 975dac55-734b-4da5-0009-08dd49fcb552
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 17:59:48.2210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bAJFxJ75JiyMefSpUWBfYh9sLo3aZfIdyUDBW8T0tDIHFw9dsrdNaeqkttMPDziiWSlMQAqW8jGdZhzTay+ibQ9Swh2zVMq/seXB0uoRJc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7090
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



On 08-02-2025 03:49, Lucas De Marchi wrote:
> Propagate the error to the caller so initialization properly stops if
> sysfs creation fails.
> 
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_tile.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 2825553b568f7..377438ea6b838 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -172,9 +172,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>   
>   	xe_wa_apply_tile_workarounds(tile);
>   
> -	err = xe_tile_sysfs_init(tile);
> -
> -	return 0;
> +	return xe_tile_sysfs_init(tile);

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   }
>   
>   int xe_tile_init(struct xe_tile *tile)

