Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1766F606A32F
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 08:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fXyirnBq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EA610FCEC;
	Wed, 21 Oct 2026 08:58:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61FB10FCE4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792573089; x=1824109089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LRrooDlwKHtQGO8rTaOEAyKnJJRKHI9IK1dXJZLtrRU=;
 b=fXyirnBqjf467e4HmKbVIXYv7X0kDZ0CnAw8rckTDaJokuSfuJehGLgu
 LdKb4QRyGIKnrUunVJr2rgk3wvKcAQiGGMf+ic2G3J98eqRh/lTKNeHnc
 rCU/X5EccAcAfIq7qlbvWLdfE4Lz7xxktnWxVRKA7eoEv6rqiDJNWt5uT
 oDhhAFN7uHwaQYyDT8Dlcz58xF7oZtX3vmIRy8pJ7PN1spE+JRQwLp+Vw
 yQ4K7DdQxufA3zntWK2QAyxt7b6SDiOKrvEuVibomL+HhNm0ki5KXFEiy
 hLalSQGhdj7XJlzUkkm/00nGM6dOZKFwMGXqq3l6oCjGkLE9TFfXZYD30 A==;
X-CSE-ConnectionGUID: vB/NFF/OQDuRr7o92UrChA==
X-CSE-MsgGUID: hKmhLYAASGalttjL+azqCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1180852"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1180852"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:09 -0700
X-CSE-ConnectionGUID: if4aKEqhTGeNGMb+TFOe1w==
X-CSE-MsgGUID: eGRgVE+qSPiewQ6QNTZT3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3370968"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 01:58:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 01:58:07 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 01:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J6bJRTJHgKSxFCMhjFINQeE46X5DmCiTv/VyME0KTMkf/m2CUD71U6VzH+gKq2p5TlRWFmmWBX0dABPoRYZBSjgdHL4PXQrXhrMiJentYwzZkSlh2f2Y7Hd6oKTiPTHH2uk48gyIrPgO0wyqQr6eQ3Ka3OgcNLCBUukx6Z034CDFosgKkH9CtY8akhpVBcUaJ9nEnM/gF9+/UW8yGbKvzB6rE0LPixHANAnd6oSW5TiFWJ35jow5neU5EeT7jKKvdNLdiO1vH26kW9/lx20/QB7VdR4NdlbrJkTYPWmIm44rSKyQkIJR/YT6IWuG1Xo5m3mFPDRz4x4DVumsGIUlng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLLRqp7bLWzcIqw2gdSvXGsdMg3RwlcOmebx/AJx+0Y=;
 b=fi37U2djpxUpOOfFCK77/1pofgzcb7n+0jQyDuIxsqdWED11EuEyCb/yxZGhzq3unDpL6ZDL//kP27Bqech3Wy4UUINz1hiV/5B72F4hzPQ1alFr6yUZrulXTk6vSjyEAqU1H1mj4478bfsPhM//2HsSwsOxSNLb+hANeBhpkkREQQKJZYjocmXW4UFzI8McyNgje9YXulHHA/Aqe2hgoQ6CQC1NZFoaDJ65HOaFgHyVArGYyXhKup0bxR09qQPalm9HNHM7RMLOAbWxj8Q5lIBG91H4VTCXv+uQfceQMVpNLpy/HUtf4JE5/YRIAkp5ktNSpJbInRob204bBeuVuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:58:05 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:58:05 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH v7 5/5] drm/xe/ggtt: Add KUnit tests for usable and shareable
 pools
Date: Wed, 21 Oct 2026 10:57:16 +0200
Message-ID: <20261021085716.709503-6-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021085716.709503-1-piotr.piorkowski@intel.com>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1PEPF00005B9C.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::634) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 62871e89-4c70-455b-9b4f-08df2f516b80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: wxQkx12R6lfm3vDNcuAIBz0GakkO0kGtJeWr05jARp1clAA6JVcI5HWlS8Ug+/iuHK+uvPotCw1UL6VW2phXVwiqv8fEDjNgvCfWmcZy9VZSkMxlQ+hEIA+LUEWqnhrj0Efu24fO0WdB9QOUkEvpj4fGBONCsGNg+b+E5tqTAVEohvYMQCxICu0zzGjIgRaTnxd5yUd3btNdas8JhNrX6dJiGDxyrk8joF9Gne/gdzcg3f9M2Ehaz4z5qQTjbO2yjkBQFchXDtWW8Oqyu5mv+lLETYtH60PeGMthILM2SZqJkKSbfQpPpEW7B0cnOYmYiEoZTUSTdXNEnt39a1wwmnxRBQQtBUE5gH22O6VYKQ3fvVszf0sbylD95F0gyBJkAM3BOl+ZnLRGrmrbD67CJ9QMG2USv0YGw2DbTSPa12W9EhSI+pi5EGPUZopRVPDBX/kzf9SBSlKEItCOvOIwHB7rIhJ/Q/TbuT3ciin1nmIwZXVG7+0mMSs4mzZ28weMOiDMu3KX433hKB1Sy6yk/Iqp3v++GJ28qG6d9M9KJ4k8gqaJbGmVLpCj5CKYiwoGn14MdChmBX/Edv6MPxyyiUtth6AWk+rTK4/HIC8T+Eg5DibcMVcXoBX9vypbOftb65RCjYIGRljuBcmZWY44SFEwZxFXBiMNoLsrpmfdL8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SG5ycko1TFVUUGdqelRMOXEraGtNbXR3UUxtWkxaZnFEWWtWVlVZV2FmdU5G?=
 =?utf-8?B?UXVpaFlyTzVHOVZuemZidWVBV1R2Mzg5cys0Y2p2OEYxNVo2RDlvanRsSmpz?=
 =?utf-8?B?bmFJYlhvS2NvMDNIT21xd3pScEMzR0orbWZUbnZKWEVBRHAvbk83K3BMUEpt?=
 =?utf-8?B?dlhEZldqVFF6YlBOL3hUaXZPTTFjS0luVkt4VzE3Z1M3RVBrT2liT3pxODMz?=
 =?utf-8?B?cUp2amI2UXBPMHgyUjRpK2dRSGl1WUhOVERaa1BhMzc1RVJiUlgwUTVRQ2Jn?=
 =?utf-8?B?SzRUNGpXSTEvT3JUSUZraGxaYXp0QmtudW05V2xpdmpsaFM3a21VSERJS0NL?=
 =?utf-8?B?VzJOZ3FVcGliR09SWkZkOVhvNVMzTVR4ZHJ5QVlWdkg2bXZaZndWNEZLeUIw?=
 =?utf-8?B?UUkrVzhKZkIrd3d0SS95YjM2NFhGYlJjc3FQK0hyT3E5d3BGdllVeUtsb3Bq?=
 =?utf-8?B?czVqMU1JbWxXcFVsQ2E2SllvU2lsL3JyWEVxdU85WXZ5MlAwQnZkSDk0RnRt?=
 =?utf-8?B?Zyt0RjNVQmpjVnVDSDgrWW5mNTZkaWo0R0ZqZWpJc09HV29LOFJjNjBUOXdH?=
 =?utf-8?B?Wk1YVzRFQWNSSU1vYnZxM1MxaFBmSVdmMlNSWUxNOUFJSzFRaUpnTDN4UFY5?=
 =?utf-8?B?WHhRaXZhOW83NWlrTDNSc244YWdTT2N0MGZ2NnVkZVY1VzhxZVY3MHN5c2xm?=
 =?utf-8?B?TGJHcmNaMHNWTlBOVHllNURHM2dKaWJXOE8wclhnb2tlSFZxb29nRUNVYWVJ?=
 =?utf-8?B?NnNoY0NzWC9tblZPWXlieENIQ3Rza1E5cnUzaTE4cGtRLzdiNzlZcWFrcWZi?=
 =?utf-8?B?b2xWcS84NnhCcnBXQy9jWlllSzlEajRZSWphOTV2QWJ2d3B3eElSc3dtR1ZC?=
 =?utf-8?B?OE1idEQ2dmhRWmdqWEZKUEp4OG1OYVhOYWRaZUI2KzU0aEI0YTI3Zjdta2tU?=
 =?utf-8?B?VjJjS2x3ZGwrU1piVDRzTW5UNTdqYjVKU0E3cVJVQnZBUitWRFpHa3FNWjR2?=
 =?utf-8?B?dmhXRStiT2RTTnF6NFE3WUNSVjViVnM0dXY1VE1HamkxdVJ2N0xvdGdQSERQ?=
 =?utf-8?B?T05HdU0yVGo2cDU4Rzlwajl6Y1RlQUV5WWU2OXlia01PVkREOEl2WjN5Nkxp?=
 =?utf-8?B?V0MxY0ZUaEZhNzEzdnc1WWxzbWpLTGs4Y09wai9FTHFRalMxcE8zNFY4ZmZF?=
 =?utf-8?B?bTZsRGw3c3lpYXNwUXBZeVIxeVh6SXpXTXhtSjBvM1dLVHlmbmJPMHpIcyti?=
 =?utf-8?B?TzlCQXFrWklqbTlSS1pwSFNHWC9haWZKdFIybW9WRDVZcmZucGxCY3lCOHVX?=
 =?utf-8?B?bElZSDVZZlljR1dwbnZrWEFZMFVEN0xMTzUwL2FETEhqSmx4KzJ0WENZc25w?=
 =?utf-8?B?Vm1NRGJ0NDd5L1hQUUxZcTJVNUgxWHMwSmtZWk0wS0krZVFjcDZEVEcvMW9E?=
 =?utf-8?B?ZmZLTjZ0YzJka25sQmdWeEE2QTRxdTEzQzMrRjkwS1NrQXV6UEx1aWNhN1l0?=
 =?utf-8?B?ZkJnbmtOeC9UV2xrOGsrdmdpeUg5NGxWbVg0Ukh1NEY0RUFvTWZnNVpUUEVy?=
 =?utf-8?B?SGVETjZzZWlicjgwUEU3VUNYbWg4N0dBQjEwc1hlUzIzS3BOVkdiK3JPeU1E?=
 =?utf-8?B?ZHVzekFqVnNWK0dVWXBKK0h2TUVCcno3Q3pRZWdYSzVjUTQrWTFmL1ByTzFy?=
 =?utf-8?B?TXpaQmpETlZvenFLQ2g0RWdPTDZjUDdzdXJmWnovQ1cxaTFiOEFiTjM0cllT?=
 =?utf-8?B?WXIvTEFUbjJPL0lzT1p5a0oyWmhtRm5yblFSbWd6TkQ5cHpGWTYrTHZSd2ZI?=
 =?utf-8?B?MUZYZ2trWHJ0RlhjRWpuTmViZWFCeTVLZlg0d2d4TUFqQ29nSEVGQzAyQjBN?=
 =?utf-8?B?Y0c5YjBLMEw5SmhJVzlkR3k0d2NHQWlaZ1dBMG9KbEF2NGxPRlNCUWxraG9n?=
 =?utf-8?B?V1VMRzNkWndNQ1F2L01jMVpsV3FvdGVpM0t2S21PSis0eHd2ZkdCUHBkUUkw?=
 =?utf-8?B?MUNGSEM1WVE4MXpuTEtXZVNiOHZtOHJLY3hTRDhjUWRYeXg5RTFCT3M5aFdq?=
 =?utf-8?B?M0Rpd280WFBuUld6V2lTNUhmMlRqRDN6TUs5ZnZpTC9zSUhpUTQrZE9UMzRl?=
 =?utf-8?B?TGJkRlhoYTg4bDRTNS9laU5vYnFJd0Q4d1liWi9sOVJVVUtLeDNkUHFPVVBv?=
 =?utf-8?B?eTMvNGVCQThYRkFjUzJsNkhPMWwxSVdmVTVydW03M2ZKSmo1eVBBTWx2a2Jm?=
 =?utf-8?B?UXdld0wwcm8yN3BXSzhiYk9BNGJBTE83SXhlRC83U0ZVQzlWMXk0UWVuMTRL?=
 =?utf-8?B?ODVxakhZZ2lFUU50b254b2pxbkRwR3FkNHk0aS9IRU9yUzlvYUJhNStvQ1Aw?=
 =?utf-8?Q?+E0fwXHgFMi6etm4=3D?=
X-Exchange-RoutingPolicyChecked: ifKoJ9BumMqNtEEMNq7+cXeoUXg4WLfJq0otcGzGuB3tjFKHzeg3/T4rkGrDCVhaB2HKKl/6QIIHMxB+odlYLxRjWIUcKByz0h51trM6pU5d78sDOzQeJ9WBHM9MWbNvtc3Sk9KHiKgJDpJ5hDBdLxoWi/Af0rVEUF2hWjlZjOFgcKoqrGkiRHUpB9pDsCJ0A3lSMlgW/C2f5b6Dw0VO6zkpZxMiOvfG4OMIT2NvJCmkQ7O5H3UAT/mhOtY3HDOHLxsfHaWUNkgO7rwWiJP8y+fns330PLhLt1wpmYlvuTcYhMDL+FPV9g4kCvxqRj3zK0NazOR9oHNH0XGKBI9vwg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 62871e89-4c70-455b-9b4f-08df2f516b80
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:58:05.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93jMYXmGqGyfHSfSvUPbBZfux3+C0+F5V9Mcjrb8C0FOpSYm9vfDzpQz8GHKLuRMMlrwcov4YUDYpNTGVyP+ZRj5SPBSpQQrhVq04Myas30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Add GGTT KUnit tests focused on the newly introduced usable and
shareable pools.

Cover range initialization for native and PF modes, including partially
overlapping pools. Exercise allocation direction and conflicts between
the pools, as well as the unavailable shareable pool and requests
exceeding pool capacity.

v2:
 - Init ggtt.lock with mutex_init() in each test.
v3:
 - Rename the test file to use the _kunit.c suffix.
 - Use shared GGTT setup and cleanup helpers.
 - Split PCI IOV coverage into a separate KUnit suite.
v4:
 - Release allocated nodes through KUnit deferred actions, so that an
   aborted test does not leak them into drm_mm_takedown() (Sashiko).
v5:
 - Move ggtt_test_insert_node_shareable() under CONFIG_PCI_IOV to fix
   the !CONFIG_PCI_IOV build (Sashiko).

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
---
 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 341 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             |   4 +
 2 files changed, 345 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

diff --git a/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
new file mode 100644
index 0000000000000..53c17d4c1da99
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c
@@ -0,0 +1,341 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_device.h"
+#include "xe_kunit_helpers.h"
+
+#define GGTT_TEST_START		SZ_1M
+
+static u64 ggtt_test_accessible_size(struct kunit *test)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+
+	return GUC_GGTT_TOP - xe_wopcm_size(tile_to_xe(tile));
+}
+
+static void ggtt_test_fini(void *data)
+{
+	struct xe_ggtt *ggtt = data;
+
+	drm_mm_takedown(&ggtt->mm);
+}
+
+static struct xe_ggtt *ggtt_test_create(struct kunit *test, u64 full_size,
+					u64 usable_size, u64 shareable_size)
+{
+	struct xe_tile *tile = xe_device_get_root_tile(test->priv);
+	struct xe_ggtt *ggtt;
+	int err;
+
+	ggtt = kunit_kzalloc(test, sizeof(*ggtt), GFP_KERNEL);
+	if (!ggtt)
+		return NULL;
+
+	ggtt->tile = tile;
+	mutex_init(&ggtt->lock);
+	ggtt_init_ranges(ggtt, GGTT_TEST_START, full_size, usable_size, shareable_size);
+
+	err = kunit_add_action_or_reset(test, ggtt_test_fini, ggtt);
+	if (err)
+		return NULL;
+
+	return ggtt;
+}
+
+static void ggtt_test_remove_node(void *data)
+{
+	struct xe_ggtt_node *node = data;
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	mutex_lock(&ggtt->lock);
+	drm_mm_remove_node(&node->base);
+	node->base.size = 0;
+	mutex_unlock(&ggtt->lock);
+
+	ggtt_node_fini(node);
+}
+
+/*
+ * Release the node on test exit, before the GGTT is torn down, so that an
+ * aborted test does not leave it in the drm_mm.
+ */
+static struct xe_ggtt_node *ggtt_test_track_node(struct kunit *test,
+						 struct xe_ggtt_node *node)
+{
+	if (!IS_ERR_OR_NULL(node) &&
+	    kunit_add_action_or_reset(test, ggtt_test_remove_node, node))
+		return ERR_PTR(-ENOMEM);
+
+	return node;
+}
+
+static struct xe_ggtt_node *ggtt_test_insert_node(struct kunit *test,
+						  struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test, xe_ggtt_insert_node(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_native(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = min_t(u64, SZ_1G, accessible);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->start, GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, usable);
+}
+
+static void alloc_usable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node),
+			GGTT_TEST_START + usable - XE_PAGE_SIZE);
+}
+
+static void alloc_usable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node(test, ggtt, usable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_test_cases[] = {
+	KUNIT_CASE(init_native),
+	KUNIT_CASE(alloc_usable_pool_high),
+	KUNIT_CASE(alloc_usable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_suite = {
+	.name = "xe_ggtt",
+	.test_cases = ggtt_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+
+#if IS_ENABLED(CONFIG_PCI_IOV)
+static struct xe_ggtt_node *ggtt_test_insert_node_shareable(struct kunit *test,
+							    struct xe_ggtt *ggtt, u32 size)
+{
+	return ggtt_test_track_node(test,
+				    xe_ggtt_insert_node_shareable(ggtt, size, XE_PAGE_SIZE));
+}
+
+static void init_shared_pf(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, accessible, accessible);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), 0);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, accessible);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void init_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_GT(test, accessible, 0ULL);
+	KUNIT_ASSERT_GT(test, usable, shareable);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	KUNIT_EXPECT_EQ(test, ggtt->size, usable);
+	KUNIT_EXPECT_EQ(test, ggtt_shareable_offset(ggtt), accessible - shareable);
+	KUNIT_EXPECT_EQ(test, ggtt->shareable_size, shareable);
+	KUNIT_EXPECT_LT(test, ggtt_shareable_offset(ggtt), usable);
+	KUNIT_EXPECT_EQ(test, ggtt->full_size, accessible);
+}
+
+static void alloc_usable_pool_low(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(usable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_shareable_pool_high(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_size(shareable_node), (u64)XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(usable_node), GGTT_TEST_START);
+	KUNIT_EXPECT_EQ(test, xe_ggtt_node_addr(shareable_node),
+			GGTT_TEST_START + accessible - XE_PAGE_SIZE);
+}
+
+static void alloc_partial_overlap_usable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, usable_node);
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(shareable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(shareable_node), -ENOSPC);
+}
+
+static void alloc_partial_overlap_shareable_full(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *shareable_node;
+	struct xe_ggtt_node *usable_node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, usable, (u64)U32_MAX);
+	KUNIT_ASSERT_LE(test, shareable, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	shareable_node = ggtt_test_insert_node_shareable(test, ggtt, shareable);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shareable_node);
+	usable_node = ggtt_test_insert_node(test, ggtt, usable);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(usable_node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(usable_node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_unavailable(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	ggtt = ggtt_test_create(test, usable, usable, 0);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static void alloc_shareable_pool_oversized(struct kunit *test)
+{
+	u64 accessible = ggtt_test_accessible_size(test);
+	u64 usable = (accessible * 3) / 4;
+	u64 shareable = accessible / 2;
+	struct xe_ggtt_node *node;
+	struct xe_ggtt *ggtt;
+
+	KUNIT_ASSERT_LE(test, shareable + XE_PAGE_SIZE, (u64)U32_MAX);
+
+	ggtt = ggtt_test_create(test, accessible, usable, shareable);
+	KUNIT_ASSERT_NOT_NULL(test, ggtt);
+
+	node = ggtt_test_insert_node_shareable(test, ggtt, shareable + XE_PAGE_SIZE);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(node));
+	KUNIT_EXPECT_EQ(test, PTR_ERR(node), -ENOSPC);
+}
+
+static struct kunit_case ggtt_iov_test_cases[] = {
+	KUNIT_CASE(init_shared_pf),
+	KUNIT_CASE(init_partial_overlap),
+	KUNIT_CASE(alloc_usable_pool_low),
+	KUNIT_CASE(alloc_shareable_pool_high),
+	KUNIT_CASE(alloc_partial_overlap),
+	KUNIT_CASE(alloc_partial_overlap_usable_full),
+	KUNIT_CASE(alloc_partial_overlap_shareable_full),
+	KUNIT_CASE(alloc_shareable_pool_unavailable),
+	KUNIT_CASE(alloc_shareable_pool_oversized),
+	{}
+};
+
+static struct kunit_suite ggtt_iov_suite = {
+	.name = "xe_ggtt_iov",
+	.test_cases = ggtt_iov_test_cases,
+	.init = xe_kunit_helper_xe_device_test_init,
+};
+#endif
+
+kunit_test_suites(&ggtt_suite);
+#if IS_ENABLED(CONFIG_PCI_IOV)
+kunit_test_suites(&ggtt_iov_suite);
+#endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index b7e3d626e8cb8..3dd029bc76dfc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -1395,3 +1395,7 @@ u64 xe_ggtt_node_size(const struct xe_ggtt_node *node)
 {
 	return node->base.size;
 }
+
+#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_ggtt_kunit.c"
+#endif
-- 
2.34.1

