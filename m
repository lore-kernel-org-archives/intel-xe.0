Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542F606A31B
	for <intel-xe@archiver.kernel.org>; Tue, 20 Oct 2026 08:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IN6SWcDw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DED610E594;
	Tue, 20 Oct 2026 08:43:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA07E10F3DB
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Oct 2026 08:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792485816; x=1824021816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ggsOxHPHnV558054yu8+itUhwnrrpGLDtMaFQImFiLM=;
 b=IN6SWcDwfZMlz4KOKehCvG4LLCc6BQHk8h2zqc9QmNzyUNwcmfbmiHxU
 7heTgbFPs3aWcct6M5rlbNvlURRm3NefFRu73XRspe2rGQ3cq4pB0Qf+4
 f1DHDetmZ7XrPeSZSqNPOVDCdrP8y8sNONIpLVcK5i006QB49GYL1C3E1
 bhd0P+DRl2wkKDwCqNWtCRZiLlWSK/xOB2tuMq36h/ZJk2Y354bSvAzsx
 5z9Wa/FEA22Xu+48zd0ZoVmsRtv/gWdVX1E90WrdIfkwOrRvO0pcUS82q
 /4R57v7wdY1zJP3DcO9CtxzjrN3S4VYwIvvE6x59La3toN2GnAZVV0EYa g==;
X-CSE-ConnectionGUID: M3swD3PdRSur6Bll2vXSsg==
X-CSE-MsgGUID: lJXUjpsFQUqpIyzQ6drTbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1085384"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1085384"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:36 -0700
X-CSE-ConnectionGUID: C3I+NuCPSzq0rtzAPgJp/g==
X-CSE-MsgGUID: uIgML4uaSKWB/ELUQ6cRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="3087693"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 01:43:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 01:43:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 01:43:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcpjquJpx12UXjo4mYLQ2yIcgrOCOTpeyp52CP0pYNjkKwvyC66b7MAScNnB2BC68eje1SS8Gw86azEAd3q8H/EdC0pDTjbWZDuV+YPgBc8nTX8WCBln8t4QJ8+gbCAeWnTsXspyXubz9wfyxl7d/GHXQ+F+sdkd5T13qQKCxnWcfBKExqwl/mdmRP2VzgoQt80tQVcvxqUNEzsiikD0yLshazSjwv0hYAa+YcyFuVBOf5GU/Nn1XrIcQYggLsWwoVFwhGVq0Gh1KOu1DSVC/rpV+XsKgVlZFSXwoCGlUWV+Qf2B8YJug0QUPIJf36A2hAacrU74m5Dp5d09RnxCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWaa7Kki5iINqNX5vgHOGVt8XadQDaVQ2bJJKiwqtdQ=;
 b=ua18kkbfZ746gKnODO6Liu2cT6mPTXSh2QEu7K8JufPuxr3z0lS9sxoHYAP0ywXGDJyWK/+2dQ2JSQwWQ3aA7UT+euYxGtnjqMKU9+PacloLTaVc9k01OA1OHHUpMEEwGvUTgT7S/+uo1JKYbZIr3b90lQc1mjg0S6uoNbe1K51YVWBmNJhBBCNzuzVlPwruhPEuY121L+5AlJ7f23Mjq4z+Mj2ZGZwr8PYgKf4x3q1JcVLt/QGVNxHeQzu4UZk0hO3deKckdoMST31Cw2Jp1NoHnxfIhZmGLM4SpiO3x1qBVtilX7hBjot1gnRGl3oBI4u3ReCN8B2i7EPp+5wkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DSWPR11MB9581.namprd11.prod.outlook.com (2603:10b6:8:36e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Tue, 20 Oct
 2026 08:43:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 08:43:33 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 7/7] drm/xe/kunit: Test VRAM pool allocation
Date: Tue, 20 Oct 2026 10:42:58 +0200
Message-ID: <20261020084258.443645-8-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261020084258.443645-1-piotr.piorkowski@intel.com>
References: <20261020084258.443645-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::23) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DSWPR11MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: a2e9c750-11b8-4475-92b2-08df2e86395c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dz++fbX5RPw9tWQtrkcC/ozXIcu5qTNM+e274sQWIswVGooQud7kuPxMpE8OXxWgNEu/tHx1cptEVkY19E76m0fUvcw5ChZ94J+VBLVK2v4HXcLnQfHntHKTH+rGNcco83PwwUpCQYZiVCTw3eP3CIx4uFzC5mPf3p22EmbVBIT7krkd8gC0Rr3IjDQOTuPE3x4zsESb+RQ80WlZmvtYt4diAbViiRwraHw380nrCZyvDcGiDOgEnWtuhefDsiV26v3t/SbXfoh5pKlKD9THhPbSBy4AuPw4LsnhGkmpN2fG/otbmSsk/5gQiJVLYTckP2Ll/fos6hCc9EZT7cgs92tms1hCu/gJbQOIDITcwU+3T8BZOGfh3GkSzj60sEqptfEQ0n+66YkQGbz7Pk5ZW84jrZcMQcpHsy67wzchEOyyLCzwxnpvVejbWtgq3CyxBK8vkJY1JJCQff/lfng2HJDgehQPyvdlfcezYNmbzvYYjQBc3buJGYk3JoHCZWUN0P1xdxi2ff0c2GveQHKPCNOJicYgN7O4xCBywqSFg/snwwNN/XDuj4e0Rdl/vn/s+OhLYJH5Y12Ql0oQATbalxVACs6LpnShx1VO5JNM+2V0SzQYKVSrwraCpuLmkwwtwfsrYnf7rcmSgu9+jofxCNRm4SxT5nbyRUGPvtPit+M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1EzN1lQRlFFdWFqMmlxUzY5TmlUNDdWS2dUMzhjNVdpMU5HdUpsck9STUgr?=
 =?utf-8?B?azNFYXF4OGp0NTlmTG1qb0pMZUVGSjNZZUVqd0dRZDN0emFRVlZFR25NNHRG?=
 =?utf-8?B?NmZnbnJwYzF6ai9Xc091Lzc3ZW9adUt2aER4cDJrem1raFZSQ2UwNmFJVjJJ?=
 =?utf-8?B?WDVGdjN4V3RHSy9iWDkzblc0MFgvVGs2c2tuVzAwUVMrdTROVmpzcmVHVXNJ?=
 =?utf-8?B?OW1halhJQnZMaUFYaU93ZmRWZDlaZHZRdVA2dEpzREpwbkRYV0NONjJ3ZjJE?=
 =?utf-8?B?czFqN3dYQWhYR1FxQ1BRSDB3cnJVajk1Y3MvbFZWSS80ZktDbDZMMGFiMUNn?=
 =?utf-8?B?UktsNjg4RGl3SnNma0orQjEvVStNajhuNmlBK284VElrK1BWdUdRVlduZlcy?=
 =?utf-8?B?cjh5dnRsT2EwQ084bUpuOE9uNWpDMlhjK3VpdzcxcWN2MEFvQlltYjlrTnVN?=
 =?utf-8?B?YXkvVnBYSXltbHhvRVlNV0sxVGZhSE1IRXkrTE1BVmE0MDNHREJOdDFYYWsy?=
 =?utf-8?B?Y0dBNnJIby9LK2tYUGhEcENVY2JINTVUUk9EZXE3SG9OTEVXMnJxemxUaWVk?=
 =?utf-8?B?VlprZ2xaZ1JYSHlOOERWMUE1Zi9vNWV2dlh6L2ZDNjNIOE5NRTVoNXBVQmpi?=
 =?utf-8?B?OEN1R01lU0VxekJYYVJWZkFxaHZaSWlqV1pNUHh4bkZGK2lIbXEwbGRQVS8z?=
 =?utf-8?B?b25WK3JpZUNOdGhqVmJ2aWNJSzg0ZXdUMlhEbkxSV3J1NGFoVm9MN2JqVHRZ?=
 =?utf-8?B?c2hWbVg1cGdOQXdmNVNFbmNqV2IxZVJEaVptSmtGV2ZUSHE5S2RoT1pxTFc4?=
 =?utf-8?B?a1ZUWThObVgrTGZiS1AyZ3VxN0dyK0t1S3B1eUtUV0hIbDYybmZFaTc3UjhK?=
 =?utf-8?B?U3hzZ1ozMFhjSU9NNzFRUnJJVjZESHJVMGQwWkkrRzAwanJxSHFBd0N1b1dC?=
 =?utf-8?B?dHlYaW82NXg4WFJaeXRhODFuWHZHTjlYYndHM1Z1TVp6L2RrT0lnY1M2d0ha?=
 =?utf-8?B?REJ5SFVMNzJ4bDlBRHNQa1JzSDJIM2xHTEpSMWV4cU1hOTdQQW9PYU5CZ05Z?=
 =?utf-8?B?ZThXaVBGMlB3a2FiUDM0cEhyemh5cTB5RkVWQi91SDhMNkFjTTA0VXRXYVk5?=
 =?utf-8?B?aW1kUTJ3UjJjZklmKzEwK1lSMEYzU1k5dTUrcWR4emRBaGdINXNpdXQ1ZHZ2?=
 =?utf-8?B?d3cwV2k5WlFmQk4xdUIwWURVZjNwTnMyRFZIQWNIOS8va0VjZGFoa0FWYmdY?=
 =?utf-8?B?cm1nQjhvQ2U3S3B5ZGk4SUVhZHRuRmkvTzFtZkpZcVQ3cVcwZG9Va3ROTVR5?=
 =?utf-8?B?MFUzT2gvUWRGUFRXMFZ2di9yMjI5VDZUUEplQW5WSlV2MWRFZ1p5T01ndDlP?=
 =?utf-8?B?dVdXM0dGL3dhazRpdEhva1ppVXBhb29yQyt6cnduMzBVd2E5ZXh4MHM3aEJL?=
 =?utf-8?B?KzFSLzlCK2hjWnoxd0RuSDRNTFVIYm5hU01MaGNZQWVuQWNaaXZNL1g5TGE3?=
 =?utf-8?B?b3VYdCtHc3NHQmttTUt0NnNVaXhCbWJwcjVtNXVxZEdTUWl6M25FS1Fmc3ly?=
 =?utf-8?B?ZXRRNjJuNEpJNEl4MXZveFY5dWZ5cXpHWjU4YVY4TXl2RTkzWHZLMWVPRW1H?=
 =?utf-8?B?SUxkbytPVXkvNmFzbDZ6a2VzbWtualQ1NWpZU2FDMm01UjI1VG9Kd0pGUndm?=
 =?utf-8?B?VmRmUzZwWlJaQmQ4WXk3UEFTZHhmOXFlWDNwcnZ4amdRb1lnMTBiYWczbFpr?=
 =?utf-8?B?cjZNMllVekFzT0pUUUFBamRtNnpoMXVmdkQ3bVl0STBPT2FQMUQvV3Y2bklG?=
 =?utf-8?B?TG1GMUNxRHZxVTVjRU81bjEyMVdJVmtReFFzYndEWDhMRmhXMEJCOHA5MnJp?=
 =?utf-8?B?Y0R6NWJFcjNDQk11bWVRVXRLWVdjVzBhK2dZMEhhUXZBeVdPQjB2YUMvV2lU?=
 =?utf-8?B?T1FIMFM4Zi8wLzR3TTFjSG5zKzdYZGhvQXNQWk5sWVNOelhxRnczekhhdURh?=
 =?utf-8?B?QmRwNWZzcWpSRFhTRUdqN1dyYnlnMFNyM3RpUGwvUjZGdTRsQXp0U1BGK2ov?=
 =?utf-8?B?T0tKWkFSWnowdFlWMG92QnVCZUtZOUM0STl1QTBtbGNWa0RkcllaUzQ4aStK?=
 =?utf-8?B?RVNFSEJQWTA5dm5tRkxQV0RGY2F6MVJNcVhBcjFzZlIrUGtPTnZVckE1c3BS?=
 =?utf-8?B?SHI3V1A3bXdKVlhuVDFzek5kRTY5QUgyZFdDMVZySkRhSU9OcXNqYXY5Njlp?=
 =?utf-8?B?dnNxaGR6dklvVjhIcmsvZmthOUJZeWZDNDhGaTdhdGpHTU5PbU5EZ3BIUDFD?=
 =?utf-8?B?Vy9STnJGTVRpWWwxUXZMQWkwYm5Eai9PMW54ZDBKZzI3cW9iZFlrbWxOVytT?=
 =?utf-8?Q?McGx2RdoRaCDUDT8=3D?=
X-Exchange-RoutingPolicyChecked: RZCVipWLFpjJhLK3lROD0PYkfiSR8GZfHB+zT1rTTKSXk6OnsZxJq24I/y+1K1RKtQp6w4Zspqu79KfxHwGPBBLN/CaffgLjq306QIY7FjiO0wn3VuL7fliSo3Pa4FZV41VD6T8xVgZinZk6UnhJEDztprulo3BoLJxRLoPUJ9zlKgeHZ5rUBr1nqsYhMFTZpu+E6jtKfmPiirRKJonHbGeJNe+VHlKgSmyi6TjE5u9pclIBlrCPE8I+FF4122glyMKf7w+7MMvtku133A65Zl2foLvVgpfICYl8raUZ8bp31pqG44EDFrx1buCQFWrDHt22S44bGHDxVgo5K63o9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e9c750-11b8-4475-92b2-08df2e86395c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:43:33.3516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lz48scp44xZP+UfksbLsUTf5o0BQglVEnhrALTh3xssyIn5DqfQeXF1U5mrYJUDDPeO6qrmIiDk5qW01cAjH4LFM9oXozMHbYF3qzxXrl/o=
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Exercise default pool setup, pool splitting and partition limits, and
TTM placement range narrowing.

Assisted-by: Claude Opus 5.5
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_vram.c | 177 +++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vram.c       |   4 +
 2 files changed, 181 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_vram.c

diff --git a/drivers/gpu/drm/xe/tests/xe_vram.c b/drivers/gpu/drm/xe/tests/xe_vram.c
new file mode 100644
index 0000000000000..de4cc3bff0f03
--- /dev/null
+++ b/drivers/gpu/drm/xe/tests/xe_vram.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0 AND MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#include <kunit/test.h>
+
+#include "xe_kunit_helpers.h"
+#include "xe_pci_test.h"
+
+static int xe_vram_test_init(struct kunit *test)
+{
+	struct xe_pci_fake_data fake = {
+		.platform = XE_BATTLEMAGE,
+		.graphics_verx100 = 2001,
+	};
+
+	test->priv = &fake;
+	xe_kunit_helper_xe_device_test_init(test);
+
+	return 0;
+}
+
+static struct xe_vram_pool *tile_pool(struct kunit *test, struct xe_device *xe)
+{
+	struct xe_vram_region *vram = xe_vram_region_alloc_tile(xe, 0);
+	struct xe_vram_pool *pool;
+
+	KUNIT_ASSERT_NOT_NULL(test, vram);
+	vram->usable_size = SZ_64M;
+	vram->io_size = SZ_64M;
+	pool = xe_vram_region_default_pool(vram);
+	pool->size = SZ_64M;
+	pool->purpose = XE_VRAM_POOL_GENERAL;
+	vram->num_partitions = 1;
+
+	return pool;
+}
+
+static void kernel_pool_defaults_to_general(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_tile *tile = &xe->tiles[0];
+
+	tile->mem.vram = general;
+	tile->mem.kernel_vram = NULL;
+
+	KUNIT_ASSERT_EQ(test, xe_vram_tile_alloc_kernel(tile), 0);
+	KUNIT_EXPECT_PTR_EQ(test, tile->mem.kernel_vram, tile->mem.vram);
+}
+
+static void partition_carve(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel0 = &vram->partitions[1];
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, 0), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_1M), NULL);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_64M), NULL);
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, 1u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+	KUNIT_ASSERT_EQ(test, vram->num_partitions, 2u);
+	KUNIT_EXPECT_EQ(test, kernel0->purpose, XE_VRAM_POOL_KERNEL);
+	KUNIT_EXPECT_EQ(test, kernel0->offset, 0ull);
+	KUNIT_EXPECT_EQ(test, kernel0->size, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->purpose, XE_VRAM_POOL_GENERAL);
+	KUNIT_EXPECT_EQ(test, general->offset, (u64)SZ_8M);
+	KUNIT_EXPECT_EQ(test, general->size, (u64)(SZ_64M - SZ_8M));
+
+	/* Both partitions keep sharing the region, its manager and its placement */
+	KUNIT_EXPECT_PTR_EQ(test, kernel0->region, vram);
+	KUNIT_EXPECT_PTR_EQ(test, general->region, vram);
+	KUNIT_EXPECT_EQ(test, vram->placement, (u32)XE_PL_VRAM0);
+
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(kernel0), (resource_size_t)SZ_8M);
+	KUNIT_EXPECT_EQ(test, xe_vram_pool_usable_size(general),
+			(resource_size_t)(SZ_64M - SZ_8M));
+}
+
+static void partition_limit(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *pool;
+	unsigned int i;
+
+	for (i = 1; i < XE_VRAM_MAX_PARTITIONS; i++) {
+		pool = xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M);
+		KUNIT_ASSERT_NOT_NULL(test, pool);
+	}
+
+	KUNIT_EXPECT_EQ(test, vram->num_partitions, XE_VRAM_MAX_PARTITIONS);
+	KUNIT_EXPECT_PTR_EQ(test,
+			    xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_2M),
+			    NULL);
+}
+
+static void pool_place(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel = &vram->partitions[1];
+	struct ttm_place place = {};
+
+	/* A pool spanning the region only resolves to its placement */
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.mem_type, (u32)XE_PL_VRAM0);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, 0u);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_8M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) {};
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_64M >> PAGE_SHIFT);
+
+	/* A caller supplied range, e.g. the CPU visible one, is only narrowed */
+	place = (struct ttm_place) { .lpfn = SZ_4M >> PAGE_SHIFT };
+	xe_vram_pool_place(kernel, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, 0u);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_4M >> PAGE_SHIFT);
+
+	place = (struct ttm_place) { .lpfn = SZ_32M >> PAGE_SHIFT };
+	xe_vram_pool_place(general, &place);
+	KUNIT_EXPECT_EQ(test, place.fpfn, SZ_8M >> PAGE_SHIFT);
+	KUNIT_EXPECT_EQ(test, place.lpfn, SZ_32M >> PAGE_SHIFT);
+}
+
+static void pool_by_addr(struct kunit *test)
+{
+	struct xe_device *xe = test->priv;
+	struct xe_vram_pool *general = tile_pool(test, xe);
+	struct xe_vram_region *vram = general->region;
+	struct xe_vram_pool *kernel = &vram->partitions[1];
+
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, 0), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M - SZ_4K), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M), NULL);
+
+	KUNIT_ASSERT_NOT_NULL(test, xe_vram_pool_create(vram, XE_VRAM_POOL_KERNEL, SZ_8M));
+
+	/* An address resolves to the pool covering it, whatever its purpose */
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, 0), kernel);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_8M - SZ_4K), kernel);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_8M), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M - SZ_4K), general);
+	KUNIT_EXPECT_PTR_EQ(test, xe_vram_region_addr_to_pool(vram, SZ_64M), NULL);
+}
+
+static struct kunit_case xe_vram_tests[] = {
+	KUNIT_CASE(kernel_pool_defaults_to_general),
+	KUNIT_CASE(partition_carve),
+	KUNIT_CASE(partition_limit),
+	KUNIT_CASE(pool_place),
+	KUNIT_CASE(pool_by_addr),
+	{}
+};
+
+static struct kunit_suite xe_vram_test_suite = {
+	.name = "xe_vram",
+	.test_cases = xe_vram_tests,
+	.init = xe_vram_test_init,
+};
+
+kunit_test_suite(xe_vram_test_suite);
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 6e0f5c4660e4e..76addc97cb707 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -672,6 +672,10 @@ resource_size_t xe_vram_region_actual_physical_size(const struct xe_vram_region
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_vram_region_actual_physical_size);
 
+#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
+#include "tests/xe_vram.c"
+#endif
+
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 static void memtest_bo_cleanup(void *arg)
 {
-- 
2.34.1

