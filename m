Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31030606A319
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lMIv9mi9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CCC10E22A;
	Tue, 20 Oct 2026 08:43:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3F810E22A
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485795; x=1824021795;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=TAduCholOS4dW/+DMpHU+erjWAVucs6hfuspiq5c5IM=;
 b=lMIv9mi9P5q10RUgwxk5N+0sWQbPYj0xZaGADlIV0MZ73Q8GvL75tBUm
 ZGDTZIJVqE4nKAdbzWZR1UcUrGGIYF2Z68tOClfRknmiYRPpqJsU2vkHn
 RK/HT4OqJhKTx+LoPsiJoSd/T6o3IAhlhCXhkwzgOvTCqwSd3pvh0+NcV
 hkELGhFrlEdLoHx9/uh5MTaYJ4eLwn07umRjktMr+GWJuDfk1FMDuvwK7
 l1RSaXHN/Z1KrHmDXQjMdr7Ekh5FPLdJ4s/bqIkzENvc4AbR1fNZ7jnzW
 GC7HNjW8zgrwvNE2Or3xGauvhBJ1MCwba6a4tNaLbkE6VOvWeJcMDfyFk Q==;
X-CSE-ConnectionGUID: 7r/ZhZRHR7m3R+bcq6nXrQ==
X-CSE-MsgGUID: IUW8Gu34RIWqESsnRlJa4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1072094"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1072094"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:14 -0700
X-CSE-ConnectionGUID: WdYjIUF8QKeYlLUrEWL4mA==
X-CSE-MsgGUID: iwoV6UMQRXmA3dBQUhikgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3221487"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:13 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.51) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NL6y8dg+x0vfobkJlhBjJt/LsSX6wc5aKRkbb2PwHVpitIpi5AtvDWyrM+DrcmX/1pTKDgpDAN0DbCvRrYHhlNmCO0dMu9YplXjCTQWV6z+VeVP5O1YS6bDpi7LozUcNv/g5wVU0PMpyzjkHpZDtm+AP77pOPUVnIGYSIeO99lV2Lf7Dze9v3VN1BWzRdUy2Ug/lhu6sB5wc1VMJBLYDmslPc9UqxbtBJqkY6awNaxIg4YhayLd3JW89QofyZ+Q5Thpx7AWs9CjINUNZn2dpVX81rfpXjo4tJGMZl/UZV2uzayaLtNSoYcIEp2o5i+QHJzmD6QpyG3uiZe/48rM1aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er0k7ZTTE4iL+ROneWXkAleUbqXXsQc8BS3HO4l1AdA=;
 b=aVsesgQFcWtXPMd5A/N80Os83GQU8y2j+J4j6P4d5ujhR1uf7CfDVMsMm7+r6IFhNJYzdHMr2WrehRKZFe3RrLqicwr7CE7sarJROSU2D49cXzNMy+RgFpMmtMvuq4wv+2AGEynxzpLueJQMMw8UlH9yQ170y5vztPihnYC1aqqFEHX7+5KsUYbd+08yX9ON1VGv7dAAqKfku1P9A9IPoSlf8tlW+CE4vrPt1GRnVxlj2vACaUXYkdqOG7CXG4zxpqFp8J4mqNHRS/TUafd9vaREwNHKqTc2ZQAdmVXcZmGx9nOVl1Tw+3c/K2V0jjVn1txPMp6T2/93Z1zcjwpi/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:06 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:06 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v3 0/7] Introduce purpose-specific VRAM pools
Date: Tue, 20 Oct 2026 10:42:51 +0200
Message-ID: <20261020084258.443645-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::24) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: c47ea6ca-b354-4406-9917-08df2e86290d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3R3OLVKtMtorGOFeL8btDWLcROWW5eZtjTOrD95ZbDpuKm0skgjuYRr95d1tZSduv6o8mls1Htb3Zt5w4+b5FGhR4e0MCiAdkZ6rnN24EYG1Vxz/mOlwSYw8ZV02K9x1Oqjjx67LsCoG7ibHIfDcGq6LlrSlUBI9EONe71ALcYXq4/2AGm+F6BzLneaP07mYYN06lgxjrGZA1kEs5PodclxoKXWhbphUQ4Np7BXF4nj3zNG7QNp9XA+BS0guPEasfbPpBf9fOB6DlvfsI2O2R7J+dUX7R1mAzi//U8FGtkg3S87T7/Y+WcRzBB8R0U3WzqpXi672431iB6r2S5x3dT+gqWx1Zb4xplHuGM6MRD9Lmgm8QiRwRj/xLMSl39bHs0NZ14imT8rBlB1QD3/rNrx/AdtUhiBJMangI3yA7S7FshwpEUL47dGZXBkb5J9o0qUIwaOSteMyoL32nFFU8sN/UVLQYwYl96f3p5V7P7RQmnwegoWi7WA+bClK6lpTfvKg4+emx07sxSy3pmy0r6IxevW3jFElq41Kwoq81BPhQVxrG1uRmfjauE4JMNdpve8t1h/vlpl47gsOjADWkkRf9mwu5XrOpEZloxH0Kua/GzgeQOMU5clx5DMjp/MJHQgRIRtmBKr29jzPv8cfzGDfv3blOF+pevqSbhCdd5w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTM5dUpFWlQ4Qmo2bFlHTmFqUEk2Vi9CbHIxMzZvVFJkOW5kaS90NVVyNHJT?=
 =?utf-8?B?aGIvQ1YvQy9qcTYrMFBzY25xd0szQkx0NmJGR1Vpb2tEZDJPRWxGbWtFdUdj?=
 =?utf-8?B?blUxNys0Um1QYnR5OUdkUFJoZmxSNnNEb250S3A5RmNwVHFrb0k2SHRhNGtU?=
 =?utf-8?B?UDFTYTFGMFArL2EvdlZwblRlaGErb0xLZlN6bjl2dXJyRzhpZHpPM1l3QWla?=
 =?utf-8?B?ZlJqd3lHNVB0Sk5FVzMramhwQTdTV3phVTRnYmNhbnd6dFFCKzZwNlR5Z2I1?=
 =?utf-8?B?VFdDTzVQWGhCdEdkanRGYm15cG1HWWs1encwbHJycERUOThGTmprSHBEWWZh?=
 =?utf-8?B?dUNyNm1tamdiNVB3aTM1aERsamxhL3d5bVdBZTNYSFVQYnVrV2UxMVNNSy9P?=
 =?utf-8?B?cWF4Wi9HRHUxNzlIek1MZXR4K0VVWmVMYk43ZWNRSUdlTkNSR2orZWcvc0Fm?=
 =?utf-8?B?NzU2RUtBMFBpL2p1aXYvUnBac0NLUHFpWDFIRWtxTnlISG5GNGxqajVYRThZ?=
 =?utf-8?B?bCtoaXc0RU9LYk1VOGE5TUVucnE5czk4QkY0eTNncjlrL1hqZGFLMHVmSk5y?=
 =?utf-8?B?VGlzK0dwdUJ6UFFKQzl4Ujc4NHJPcit0N1hZbWlVdllDWGQ5TExZNVJFNXZH?=
 =?utf-8?B?RjJNWlNlT1ZTQzh1U2ZtWE1Zbk9CeWlvNFc0ZlhZZEJ6WGI1MHpiZDdsdE5q?=
 =?utf-8?B?TThzdkdpUkUvd1ZMa3czTlNXS2s2U0QyVkVRMEhobWpBUkY4UDJmMkNQWndK?=
 =?utf-8?B?MzU2VXBCaldDbHpwYmd2UnZoWWdSU0tKNW11TER2S2hNVTBOQ0xoSFp6eHhU?=
 =?utf-8?B?b2l3aGwyVVBmazdCMHhtd2lVL21jZXlaSnFIQVhHdzdCVGdtMG9MaGhHQTRo?=
 =?utf-8?B?MzhjOE5RNmljU24vM1Mwbm8rbGJPblBSS2ZKM214bDBlWlo0Ri9pczVoZzd2?=
 =?utf-8?B?TjYyR1gvNTRVeUVKQlB2NW55UmZ5N3lFRW9VekpPOWxWUnREOUNVT0xuc3Fz?=
 =?utf-8?B?YTY5UmQ4Wk9qYmVQU0wvSERBU3JvSlBZT1BsZzJQVnQ1cW85ZTBvOUtObUg1?=
 =?utf-8?B?U3h4UHRmbjR6aVROUXZXMlpIRm1RY2pMdWtEanRyZ1FseFdjT3o3d3BLa2Z6?=
 =?utf-8?B?RTdIRm53MlZEQmZiVHN1bDVaTTZOS09CL2FmVEc2QW1xeWZram1pWjAvUWJT?=
 =?utf-8?B?K0ljNmRjWXBsclFIS3h6aFlRSy9mWC91R1lCN3oyTkNoTm4yb1FDVEpXbVJ2?=
 =?utf-8?B?TzhFOHVheGhOVmludnhHcTl2cFlmUHQ5WG55Z2p5eUd4Ti9KL1ZJZVp3WitR?=
 =?utf-8?B?NzRsWmpNMllUaUp0TmVFQW1jZk5RNWZCSTNKbkVSbjduVmlzaTQ1UUpCQmYr?=
 =?utf-8?B?eVhLOFRtdzc0YTFiakU5R3RZRnVEbzZqeGpjNVFNVGZ6bHQzQlVRUGVoM2NO?=
 =?utf-8?B?ZFdkb0VnVDFSN2NETTNyM2l2bGxKdWdnNi9aM1lVY3VNQVJscG5LRmtkcTBo?=
 =?utf-8?B?NStaWUtYc2pRdEd5aFpmdktITGp1Ris2bFZtMnlhZ09pVDlrQnNrQ01nWUdw?=
 =?utf-8?B?Nm9YUjh5ZjFqbFVDalFDZXdTOE9EcTNidlVaZmFmRFhndTRaaG4zbXF5NHpB?=
 =?utf-8?B?ZUsvUzF5WmVYMHZIRWxaTmZJWlJrZjljU1NzbnN2RFRpVk5hNnZseGpoS0Vz?=
 =?utf-8?B?WkhnTkJSd2lCRnhyNDIzRzNqZ3ltd1h1NWcrb0FnVzZWUmhmVCtNN2o3Wi9H?=
 =?utf-8?B?WU5DejhDaEh6WXpwKzByNTNTTjNLbEtNZ3AwZjgxV2dTLzJRZUhPNm5QTUhz?=
 =?utf-8?B?ZFltdWl3ZUYyVGR5L3J5emhzTitNLytOZ0FDaE1WVWx4YkZyTFQ2UGNSREVj?=
 =?utf-8?B?NW03S09tRllyOFpSdXZRNDF1dVc4aHhPSld5Y1l1YU9zNHV1TW9OdC9HN0RE?=
 =?utf-8?B?dC9CRVNlSGZCK1dUMDFJYU95c1F4Q2h3MU8xZ0w0bmIyQzlMSlhFcG52RXpo?=
 =?utf-8?B?ajNyL1dVc3lpN0Q3TTBVSlQvcWc3TytDRG5KUVpnTEt4SzV6MWdJbERLcHBt?=
 =?utf-8?B?cWc0RWZNQU1Sb2U4ZFlTY1BwSDMvVWpLZFlMQmdVNk9YUjRQOWQ1elF0a1la?=
 =?utf-8?B?ekJwOXoySTZQOU9sa3ZGSFI1emJZN1dkRXdMb1ViTVBlVTkrQncyOWs0YTF3?=
 =?utf-8?B?OFQyQllMTHVueVhCbk9GSFViNzBFZ2JlR0RPSXRaeUtmTEcxUVkxY2FnY0wy?=
 =?utf-8?B?alp6emtVbjRoQ0tjSXpaWUZYd0xiY0dpWjZJbktWZVFqVm95c20xM2psRXRK?=
 =?utf-8?B?RExKcW9meHRjNzh4TENuNmc1VCtXek52NE5RSVkyRXdpd2lodlRISmtmTGg0?=
 =?utf-8?Q?jzq+lbFeLp36q8OI=3D?=
X-Exchange-RoutingPolicyChecked: GJoVfhv8caxW6RsExFmox1+bkIrYFeT26fYvN+6gl3g0v0ffko1yD1chneERI8S5c+n4yw5WwTbtTKI9xpUm4+K/WIkURzNPjcSGXJVXiTozDhPijf6pISCnoCftxjwZToESuZcL903IyNGxLY50XQ0qo4krzpCsCY/TmYz+TGguHttlSCxbCtqlwgnDa3pvKwrVfJxxNgCZKsgMyZN9oDRdsZEKDZqMkxvfGMWCrhAosz7pZFcvkJT0nVMG4E6POpD5VT0D9n+OI2FND2pEodRPI71GQSEGgfD7fJ3bSlSBnSNnYqWUDdlhw00u5Vj3wJFEkyR+WVZLdYwQ+7F/MA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c47ea6ca-b354-4406-9917-08df2e86290d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:06.0453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+Kc4kwFsIYEwPElFu6+nS8t1Px0+4t5ZodID8YcQJzo/La78cb2S/u4eB+0/FS+FYF7KWWvoVO6gAQRxpznIusLJ1UURVUxWF69EbmmV0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9581
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series separates VRAM regions, which own physical resources, from
VRAM pools, which represent allocation domains within those regions.
A region can then be split into hard partitions for different purposes
without requiring each allocation path to manage the physical range
directly.

Each pool is backed by its own buddy allocator. BO creation and
migration resolve the pool for an allocation consistently, and pool
placement narrows caller-provided ranges while rejecting fixed placements
that do not intersect the pool. VRAM usage and CPU-visible memory
accounting are tracked per partition, and the PF reports free memory
from the pool backing VF LMEM.

The series introduces the partition and pool types, routes allocations
through pools, adds region splitting, and includes KUnit coverage for
manager partitioning, accounting, pool setup, splitting, and TTM
placement.

Normal initialization still uses one pool spanning each region’s usable
range, so the new abstraction does not yet change allocation policy.
The series also makes the VRAM manager handle lpfn == 0 according
to TTM’s unbounded-range semantics.

v2 -> v3:
 - Place fixed placements in the pool covering their address instead of
   the pool serving their purpose, so that e.g. the BIOS framebuffer
   takeover keeps working once a kernel pool is carved out (Sashiko).
 - Assert that a kernel BO with a fixed address does not land outside
   the kernel pool on a PF without LMTT, where VFs could reach it.
 - Add xe_vram_region_addr_to_pool() and KUnit coverage for it.
 - Rebase on current drm-tip
v1 -> v2:
 - Fix NULL pointer dereferences of the tile VRAM pool on integrated
   GPUs in the page fault path, tile asserts and debugfs (Sashiko).

Cc: Matthew Brost <matthew.brost@intel.com>

Piotr Piórkowski (7):
  drm/xe: Define partitioned VRAM manager types
  drm/xe: Define VRAM regions and pools
  drm/xe/vram: Make VRAM pools the allocation handle
  drm/xe/ttm: Back each VRAM pool with its own buddy allocator
  drm/xe/vram: Allow splitting a region into pools
  drm/xe/kunit: Test partitioned VRAM manager
  drm/xe/kunit: Test VRAM pool allocation

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   2 +-
 drivers/gpu/drm/xe/display/xe_initial_plane.c |   2 +-
 drivers/gpu/drm/xe/display/xe_panic.c         |   4 +-
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |   8 +-
 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c    | 147 +++++++
 drivers/gpu/drm/xe/tests/xe_vram.c            | 177 ++++++++
 drivers/gpu/drm/xe/xe_assert.h                |   3 +-
 drivers/gpu/drm/xe/xe_bo.c                    | 102 +++--
 drivers/gpu/drm/xe/xe_bo.h                    |   2 +-
 drivers/gpu/drm/xe/xe_debugfs.c               |   3 +-
 drivers/gpu/drm/xe/xe_device.c                |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   7 +-
 drivers/gpu/drm/xe/xe_migrate.c               |   2 +-
 drivers/gpu/drm/xe/xe_pagefault.c             |   3 +-
 drivers/gpu/drm/xe/xe_query.c                 |  27 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |  45 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  18 +-
 drivers/gpu/drm/xe/xe_tile.c                  |  22 +-
 drivers/gpu/drm/xe/xe_tile.h                  |   6 +-
 drivers/gpu/drm/xe/xe_tile_debugfs.c          |   4 +-
 drivers/gpu/drm/xe/xe_tile_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |   2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          | 398 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |  54 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |  48 ++-
 drivers/gpu/drm/xe/xe_vram.c                  | 296 ++++++++++++-
 drivers/gpu/drm/xe/xe_vram.h                  |  16 +-
 drivers/gpu/drm/xe/xe_vram_types.h            | 159 ++++++-
 29 files changed, 1338 insertions(+), 231 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ttm_vram_mgr.c
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

-- 
2.34.1

