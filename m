Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2D606A330
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bCM4W5kF;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=X89zIvTX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D7810E3DF;
	Tue, 24 Nov 2026 10:53:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7472C10E672
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Nov 2026 10:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795517622; x=1827053622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=iXZFu/ygJknPO86D2gMrrWcieVXPSZo3o8dWLh97jC8=;
 b=bCM4W5kFhsPAryB72Qvc3ise5UM26xBU7GS/2KP8scZnPSBFri+6cGw0
 MZBi1WpOe2J3QQtzyALsZRlMSZYDhUsdIvVEsR8Wt/z+tt2X81Z51IRWJ
 AyXBUby4XW8txpBHLkuW0QwlSgqfMCR416S5AK6tS/Zl/NwaP4ThNd9OI
 KqLyRKl3uGchf9X3Hnsi5/Xn1ESyIk1f6LJ51NQf7ZB5kx84ejW7A1fLH
 PyGF6iDeA05vuPkI39K2AVJp/RiVRv6UzP5BLV8Y3epZVqxpjV+1k38/h
 Q5fU9XIgcfNVNbbdypy/psjJCVF6tTnfMbbYk+hGYdS2AzXqb6i1MTR9p w==;
X-CSE-ConnectionGUID: bZ/Zt0trQZmPiDfmjo/v2Q==
X-CSE-MsgGUID: /vHU1a6eSJaTrwic4g50SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4439936"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4439936"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:53:42 -0800
X-CSE-ConnectionGUID: OCvgYBPHTjiisYPSH7A+7Q==
X-CSE-MsgGUID: oHfdk8RpQJ+ExS54TSlDLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11415971"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 02:50:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 02:50:37 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 02:50:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJnXPlAN7iTzZxtAOQIOMfWgV+In5TBLZarPidz3Qkhd+ZYQ/AsXHd36ljdORdu7Z4YCVt6bm6slp3FCWWEyY4V2FA1FjxV5N82Oztgdj1LlO9zkTHiifhxIrz1eoaffuOto22raPuYLwU69aXQZADxrUWkQPxK+kKszUu4szvUpzx4Z5+HcnPPu+302t1XRgfH9iyU6y2wGfhez4R924q9CZ8xLNUzldVojyKVL2KJQs89uj1RKWCRGnU67DQZfSxYZOW67g8e62B/rIyk4BqVKNAOhpV/osBcUivLjMlWUHvTUdAv8nebyh7VpfPo934V2LEPgEWfZl6xH2AutVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON8ZxILjVb5JX2wBKqLx0LYUxrY1b1rs71pTfGosuAc=;
 b=m3/7vWWD5C4ZHeCLAeyySV49hIR6qS9XinMQMfmd9PDr3cGMGZzs2mC2jbemmLfTMci3fFsyGX83SZZYHFTBYhpqtxRSp7PpBybmEu0/5Vz+B6iNe3ztS3Hdb41LXVsZ43pKnGPOkTLU03DLF5ML4DC+0EHbLi0HQrZoSwsJK/JuKwUYz1dc6GFVavYFfe5vyIHuh0FS1ZWOWMn6OeDm7eN9wGWt0IiFMNFe6fLLkLQE/Qm921bZqlu2I7lgXdXF2DdJs0LQE4SYI5bnYndTM2LH5cO4veGJr08tOoBI5JhEbyfFlXZyrLfjc6cEZ4nI+MNoAnZEGQx7FzHV6RzQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON8ZxILjVb5JX2wBKqLx0LYUxrY1b1rs71pTfGosuAc=;
 b=X89zIvTXE/hqXTo0buVMguKB2f7mE45ZulMmVh+EC4S56FP/IwcHgehl5lsPu0tIe2o+MD7KTSKdA61ZL1+tOGxRB2/f926EON31MqSN8oGmUFpDd39JixmVR+zrHiZa5a4Yr3VxlC1hkWexaprEYSdGNUr3Cw70IAm6osIhneY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by LV8PR11MB8721.namprd11.prod.outlook.com (2603:10b6:408:203::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 10:50:30 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Tue, 24 Nov 2026
 10:50:30 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 2/3] drm/xe/pf: Extract VFs enabling revert helper
Date: Tue, 24 Nov 2026 11:50:08 +0100
Message-Id: <20261124105009.3431301-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::9) To BY1PR11MB8054.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|LV8PR11MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: d0920663-2149-4cde-78be-08df4a18c0a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261026140227099003|261028144727099003|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: /XFUVibFIM7dIy2mtjgctgfqLMF3ge7AjYhfp+sTdNi4OuiBUDcLbwrZbDbgcZvTzDgLkzWsq4PQlAxSInod4giwaqyek0nF/E3LLHTgECtGtBo6fV/e3uRnAVlhCfPALY7r666yP9j+P7YPRKB6yOAXHtVzVO1qhuX3xiooEFvvT/c+wFinws3hnzvOs7YQRRolVItLNU7AsBYFsbS1YEc2KQBa0o+3pl3kj60VvKtVJdOL6pGft9lrZ1maOuilXu6Fo8xz/KguV6xnU9cHrtZGuGqBMuhoM4SfnHcDoBt/LcGI2/cYOmj6GyM/s358Utfy06a3O7iWhYbkth2wQTSHa8H8CXr10I9IB/4k3i/AWB7qCARBJdy0sLscCAdknKsRS48NeiNwjPkFJWnUm+qOuwUO3yvRcWRRbhmif1HeoQLpgdagb0n8Wo6/cNg1STxQWIoAA0GpeXstR0XPMLcoCUI8Jl40EDYDkCir+GepakFeccR8ZjbhNRSbp1kEmQXS9myh/QArLnyDW8pAW9zYpU/kA6IEozA6BX1m8Kr+YoAAsJKnEcENUcTFZfd042FLoQs/GsE7H0gouLsqTkalqauNhsmBJooDpmfb531PuNs8mxIFUbh+QLvrMpReZKEkjJHs+ArOxK7hY20kov7xIj6V3/uzf90axvY0Fjo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026140227099003)(261028144727099003)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9ycXN4OVBxS0NXTElGYlJ5REpJd2lmaUlLaXlIYnpaM2RVcmtHZ05QNkQ3?=
 =?utf-8?B?R1pnUnpwU2NmbXhGOHNidWp2elZCQzlpZXNubXhkd29LcTB0amU4bjBmZ1dL?=
 =?utf-8?B?R2poWVdrV2RhZ0lNV3dzc3JXZkJTZWJWVzc1QzlaaE5ITVQ2OHJHUmxYUjRh?=
 =?utf-8?B?MUlmaHI1K1MrNlRSSmZPNVlsTzRRT21CakdIZnplRWdYTVAvQ3h0N1E1dFNB?=
 =?utf-8?B?TEJjOE5OeDdQVEE2ekNZWXl2eFUyZEphcE1GSDNmc0ZFOGF2dEtMdUw1QkNH?=
 =?utf-8?B?ZDBDS1QzRzRTUEsxUGNKZGtMQzMxK2NFTkFKWDV4cmg4OVN1YWt3SVdBV2lp?=
 =?utf-8?B?K3Ftb21Td1c3SWZxb1Jjc3pnekJybnlGWWN1cFpvQVU2aVI2SXF2UytlNklx?=
 =?utf-8?B?RHJXUCtMUUJwb1JidXF5c0JSckxIcnQzL3JjTUh2T0JhdTR4RmtQUk9WaEZr?=
 =?utf-8?B?STE0NXp1emVGc3lnNUNOc01ZM1ozNFhwV1NLckYzRVNyaEtza1dzWjJ0azhX?=
 =?utf-8?B?QkRncm54SWk2WkM3M3haUDZjODJFZko4Sm8zVWtZWkhZS1JXVG1iRCtCejRp?=
 =?utf-8?B?eGFCUm0yL2tNcjZhbTc0QkZkOVpPa25zdnhwUDNTb0hzTEdtQU9wQmN6T21l?=
 =?utf-8?B?ZC9Nckxwbk1mNnBnMjhnTGRVbUR3bmNXMGFpaGgvTlVPdUhpRmMwWUFOa1ZP?=
 =?utf-8?B?aC9kOHZVLzIvdWlUK096OFZ5cjdSakN2elVXNVdYZVNCTXdrTGk1RkJ5L01P?=
 =?utf-8?B?cXpMUXJkZ0cxTGswQ3BNaVQxbVpIUFE5Vkg5bmtyWTNsN0ZtSUpPSUxUYitV?=
 =?utf-8?B?MlBtN0NTU0xycW4veEJmR3F2Z01IWWlKSXp0ZEoyZ1ZGRi9zRGVmWnNJU0dW?=
 =?utf-8?B?SXhNN3ByUk5OTEZyMHBPenlrTmw0YUY1eGdDQTN3RWkwOEhtRWlxbkY3aC8z?=
 =?utf-8?B?UmcvMWZ3aE51OTJQVEUydU5GLzlUOEhqUmlIZUNDdWpoL3JrOU9LRklHOFdq?=
 =?utf-8?B?WGtvR3hGUXAvMXdXWmF5M3FIUjQxdDBOV1lmdzRZbkdYbHlzQSsyTFd5VFZh?=
 =?utf-8?B?OUI1Rjk1djhXMExYTHp0OTNyY2RPcnNJelU1WkViOTRIclZjaXNiR3JhRzIr?=
 =?utf-8?B?b0U5cG1aR1ZQVCs3bC93MHUyMWh2VnNNVE56ZUpKdVF4cWZXTTUrcGg2SGVo?=
 =?utf-8?B?dDJxZWROckc0OUh5QVdCNGlsVW5yTGVZbUFwTk1kSUJvblkxYUNvQkFOT0Vw?=
 =?utf-8?B?WE5rbmtBVlpTeWl5di9zOTBkZE13M0xQdUtJRHRUL09XL2pNZVpGbHlORnpa?=
 =?utf-8?B?dFhGV01ybDcwcXhzYjZJck0wMW96M1cyd0pJZE1pR0JKZlN2QTB2SW1HdEh5?=
 =?utf-8?B?a09hYTQ2TkZWVnpsNnVYL2xlSkg1b1VaU2U4ZHJuTmF5MUwyVGJWOEVHeXFl?=
 =?utf-8?B?STlwU2FVejNTTzQ3Wk91MXNvUWxxQ3FuOFpWUTY0bFpyK05icG53M2FTUnpa?=
 =?utf-8?B?bldLRFlDaWwzT3RPTWQ0QzJ5c0FvNVNDMXhYRXZqcVRYRGg2VFRST002eWsz?=
 =?utf-8?B?RUxzK2l1TTBqOSt3V0dXZStpU0llRzVqOUdENU1WdWlaL2Jhb2pCaDJ0UitI?=
 =?utf-8?B?bTFaclJ5UzdKS2laUVRQWXlrSnM0OEc0MnRyaWlncGM2OWNHWThCZWdQUUZs?=
 =?utf-8?B?NE91RThKd2ovclZPS3RSTlh0ZCtyRUVWWm1ObXRZM0xsY2MyL1Y0R1hxYzhw?=
 =?utf-8?B?clU0aDhvWkUzV3M3VnYvTXpVYTIvd0s5UXhROHpLSHQzRW91Ump5ajRmQ0NC?=
 =?utf-8?B?TzlRQ0RQMWxYQ2poR3lWNlcrbjVVV0FOcTduTE1qdnhUbWxBV3VncmZsVFlZ?=
 =?utf-8?B?NXc2VTNZTndPT3d4MXFJVkVTQ3RjdS96UzVwb2IveEROK0NNZDRzRkJlbXVz?=
 =?utf-8?B?REF5N0dGZk1KRkRoR0tvRktsY1h2d0cvTVJja3ljRXBvdGJMY0RjZ0ZtSjYy?=
 =?utf-8?B?Zjc1RTR2Z0FIc3NjZmoxMEkxTWJPa01oa1RPZ0lCZlZKZ1dMRUxaR2d2b3Qy?=
 =?utf-8?B?L2RIbWl6elRMOUdLVEx5aGsrSVBxV2pxamJvdHlwb2ZJeFVwN29kNzN4aTNC?=
 =?utf-8?B?U05lc0JZUndCeVArOTdQb1Nqc2lyYlFQSTdoZWxrTUZmREVCUmkvLzVIclNu?=
 =?utf-8?B?QWZ6Tm51dDhrK0hUVVJLRllmTVJBcVVwZEJtWnp1RWg0bXFqN1c5MUpENVV6?=
 =?utf-8?B?YzdGUUp1MCtLZUlmRWVTcDMwYnhRSTdRLzBXTSsvSW5ZeHhLOHg5SVBKT3hV?=
 =?utf-8?B?T1lJSU5WYm1ibEt1ZVJCbEY1bm9IZThtU1F6USt0WU1sS3NtNEhqN09yVHkz?=
 =?utf-8?Q?LO1CRh0lEcjVJqS4=3D?=
X-Exchange-RoutingPolicyChecked: d1iWrs5Ks1OwL5s+SenE7ymzqiZDWYimhrlGuIMfpxUBsMDi5o/tJHPHgw4tb9+H20tO1rBPCrz602TzsP7M7DDU8vcXk8+7sKRfZvrM9lWc/UjMmKG3PpaSgTu9zJJGl8o2yRD2blBm3IKfaajK3BGZS3vaWnT120pSzRX14xxygSejtNm6cnuudVjwDTrQ6TQjPF7iVeZJfrSEf36wVBVfe3A2wQNgFdRVFISMSOifFv/NG8EQnrwTTPzDcOt1JbtuKZ2Wlia1sfNMGqMKguVuKtfMOLuIIK435zRkmNa2cYxZysfwYaQdXYLCwCC5mr4mxS6FAjdMxl97o4IypQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0920663-2149-4cde-78be-08df4a18c0a3
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 10:50:30.3926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJc9oOZWjKRA2t77cEPwMs9xbzhbrCjtpd9WGzARWe/uhXtmNzckHFk7yH4fQGIfuP7ZUeLvsPIqyoaegK3nmYGvJKrd7DMLE79oAdzDXRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8721
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
are releasing the same set of resources acquired during VFs enabling:
VF VRAM BAR size, extra runtime PM reference and the VFs enabling
guard. Extract this common code into a helper.

The PF reprovisioning and VFs unprovisioning are kept outside of the
helper, as they depend on the provisioning mode, and during the VFs
disabling we want to restore the PF scheduling settings before the
potentially slow VFs reset.

Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
back at the end, but since at this point the VFs are already disabled,
this should not matter.

v2:
- keep VFs unprovisioning out of the helper (Marcin)
- keep PF reprovisioning out of the helper

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 3bf995736502..d0536322dc05 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -125,6 +125,16 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
 	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
 }
 
+static void pf_enable_vfs_revert(struct xe_device *xe)
+{
+	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
+
+	/* Release additional PM reference obtained in pf_enable_vfs() */
+	xe_pm_runtime_put(xe);
+
+	pf_finish_vfs_enabling(xe);
+}
+
 static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
@@ -151,7 +161,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	 * With PF being in D0 state, all VFs will also behave as in D0 state.
 	 * This will also keep GuC alive with all VFs' configurations.
 	 *
-	 * We will release this additional PM reference in pf_disable_vfs().
+	 * We will release this additional PM reference in pf_enable_vfs_revert().
 	 */
 	xe_pm_runtime_get_noresume(xe);
 
@@ -177,11 +187,9 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 	return num_vfs;
 
 failed:
-	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
 	xe_sriov_pf_reprovision_default(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
-	xe_pm_runtime_put(xe);
-	pf_finish_vfs_enabling(xe);
+	pf_enable_vfs_revert(xe);
 out:
 	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
 			num_vfs, str_plural(num_vfs), ERR_PTR(err));
@@ -206,18 +214,13 @@ static int pf_disable_vfs(struct xe_device *xe)
 
 	pci_disable_sriov(pdev);
 
-	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
-
 	xe_sriov_pf_reprovision_default(xe);
 
 	pf_reset_vfs(xe, num_vfs);
 
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 
-	/* not needed anymore - see pf_enable_vfs() */
-	xe_pm_runtime_put(xe);
-
-	pf_finish_vfs_enabling(xe);
+	pf_enable_vfs_revert(xe);
 
 	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
 	return 0;
-- 
2.34.1

