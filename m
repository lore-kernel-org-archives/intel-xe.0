Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3554DC7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 15:01:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77BF10E232;
	Wed, 25 Jun 2025 15:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UbxPNlpo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E22A10E232
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750863710; x=1782399710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=pgJGcXgfmap7ma2m4BMaF5Zyobx7gIT2HWpOuG5uAVw=;
 b=UbxPNlpojbugq7aNSZJuCzztdzttDMBh+VteD2TPrFtK0RWRGOVP1Utn
 1osNYDZ8M2Sc6NdpgudE3HWR8XJmLSN+/CDJgNZ22v23VOSG1fXyIjU7+
 TDj+ok0ZVEmwIxp/ryjJJ18p42MzV4qCIkPr7+rK0E/mCtvf8aqDHFpRo
 /T3TTPJ04o/khL8jIw38NKm4ZrBWhF13Abw1CEYQqOQVyD91wJJIzx2W1
 0gsqR/OqbxWm1msOJbpPZDFc7YuQvO9uqq7/7a2BmsHUwGgKRYECWwU0+
 x1BNjR7M6LDyvEFTxKZ8ChYICrDea97tKII1KYVjE05KurmOGpdao73Rd Q==;
X-CSE-ConnectionGUID: OFwG6112S+a7ciDX+2LUvQ==
X-CSE-MsgGUID: OGoLEuNBT+SMNWIKpYvVJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52365931"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="52365931"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:01:50 -0700
X-CSE-ConnectionGUID: shQjsoRUTQye+KJ/fMd4SQ==
X-CSE-MsgGUID: 9BPpdqCsRhimOL03zAIc/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; d="scan'208";a="151858379"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 08:01:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:01:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 08:01:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 08:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPbyx5fFrR6gOnsJGA4YTY4OLhYxoKf3urHxYRDOqRortyCtiv/lRlxCL0eysIxMovXaJWsYAeykWt++f6gZKxxrpyjPDRApqYW5Ur+9KRZZeZg+VjCK8Fd8JXn9+jBwc9l7W9Q3l0Noc6PBL1o/rpx6O/TUSLihvg0nU4qgFF0H0DhBACOqqtO1lZHUnXlCBkltXzMZfGhEeNcjLu3yz5BiCLkn9XG1S2g+JlCVE0GN+6QNcJnE5Z1QGNZg1jo8w53/m3X/1V9raJD5OBu4KzPq8I0Ho0Tbavn9rOKLbDy+jr5YlivB5cgtDpDnAPjMQjwBPpLAM5MN+hFMp/Dxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vxSlz1XBPspC3p5Rnokr9CysArl3XSnSbI/+uPxCBs=;
 b=ohUNUxF+4eyIPvEMf6C/fXyCVRuaRZ3eD6x/S/+XzUrVSEBs42ti9PvBJ9W/DX7vmJNoeJUqQLiG2wpKHUKJ3y/rwTcHByxIu12d3aNXp7rA4mNMx8+3gfu1CDYYy6cv16SORcWqNz8U4+2P6o4hrALJu+1HOM+ddnTAlSjbUMYSSA7YsUcqv3rmOP2sSlr+TX/tP23z4GK4mAK2RfQFISZ+d4k/EYQaCwt78YJTZYy0eDygQBu/27jhwZ6H3vlNzyqpQaHw+XbW6RKNSU6dcgQ2BoakICpnm5rrtonchDkm1Y/7F3L3DtFG3Wh/aPwm2O6U7bXpPfK6iYsZkYeT0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by BY1PR11MB8006.namprd11.prod.outlook.com (2603:10b6:a03:52d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 15:01:45 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 15:01:45 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v5 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Wed, 25 Jun 2025 17:01:16 +0200
Message-ID: <20250625150116.3166615-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
References: <20250625150116.3166615-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO3P265CA0024.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|BY1PR11MB8006:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a3be03-ca3a-4286-fd32-08ddb3f93380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHR6VnRqa3phTVYyTnd0Y05aUCtPUUU5aDlXdkUxdjErZEhObkRGTGpyS3JU?=
 =?utf-8?B?dm11KzdOaGU1WnhENUtNZTF1ZDNlUEtGcTVrV0hFMUZtYmIxL3FWUmNreVZW?=
 =?utf-8?B?bjM1WGErdmY4dXk5TTN5RzNWSC9qRFJXU3VBbnpuZmE4MzRZMDlCeVdJcVRi?=
 =?utf-8?B?Tm5VcFhQVlU1a1hmWURhNWdIR0tPdFNxSG1ienp2ZU0xSW5NdzUydHh3VkRV?=
 =?utf-8?B?Z2tGNm41cUpuM3c4QkxaMkZFT3ZXOS96S2xEVFU2OEhyTTgxRDlqN0NZMnJq?=
 =?utf-8?B?aC9zYXZFNEZZMnh5QXZVVUIxYWhEU2pQTWJYQ1hJdXFlR2l2SHp3ZldXWHBU?=
 =?utf-8?B?Mjg0NnkwZ1VlNEdDYTFhWThlNWdmTnlQcWtVZExzQmNmbndJV2U4VGxwRHlJ?=
 =?utf-8?B?dDdhaHVwNDUybDVTZlpVY3lEQW40c0g0Qi9iSTNvcUpqTVU3QkJDM0RTMUFD?=
 =?utf-8?B?bFlaTGRqWXY2M2hYalcxU0haREFZMFBtYmtKM2xmVGRXOEZ3ajV0ZnpSWHA1?=
 =?utf-8?B?YWR6Ylp1WnZ0dHZjbzEwRllUbkZNUm42QWZPVlJYaVU1d1pkVVpmVnJoOEYx?=
 =?utf-8?B?VTZkMWNwNmxjaG5aeExzSkYwZXdlWTZLYWJaMmhvcEJpaW9mVUxmaXQ1NG9Y?=
 =?utf-8?B?YlNRcmFRVGFITGdQUThyeWpDYnFzc05Cakk2L1VNSVFOWEFNdnR4cFpFN3hG?=
 =?utf-8?B?L2w2Y1FkanR4ZnpieEN6WGhGOFgzVHdaZytvL0pMTEZjd3Q0cUlxNEpxbzds?=
 =?utf-8?B?RjJqYXJtTEJRRWdRZExINVBFT2xGMUFJSFdFU0Nqd3ZoRSt0VjNNeXpCajJ5?=
 =?utf-8?B?NTRWODgvcWxaaFlBRlZoSVBkSzBxYVVPWWV0SXpWcHhiOEs4d0FmR0hzNDBn?=
 =?utf-8?B?K3FVTTdMQW1zTi9qUXVWano0djNOcmNNWTdKc1Y3dVQyYjd5bWJuRDdwd1Ba?=
 =?utf-8?B?N292bFZMMDRsVWJNdkZJbW5zalpGcWljMFVWQmM2Mm1QNmVYSmU4MS96WFo3?=
 =?utf-8?B?bWZNK0l3aEVTZHJNVGM4L0RGY0tqWWM4T0pFYXpTR09Bak5aeHlKeWMwY24z?=
 =?utf-8?B?bXNOTy9uQS9pMGt0NXE1em9RS1ZJQ1BkSFNtaWhFbHQyQkF0VUpsMXl0WGNJ?=
 =?utf-8?B?Mm9XOW0raitYdmdic3NJV1M1eE1JTHZMckRFZWQwZjJHWXJCR3E3WGlSK0c5?=
 =?utf-8?B?cWZIU1JoWGdRR2RMU3dWaTR2SUhvWHZJUGx1WFF2enBLQS9YYzV1eXRoN0FU?=
 =?utf-8?B?TU43TEc1Y2VoV0NBQTB2ZmRxa0h1RUkrSVpBc2VybEFEckhncGtDVXZvcEht?=
 =?utf-8?B?RFI5ckdWSDdYVkRlbkJpcFBVajdJbW1yYWVOcmtJaW5vODlHYkNsU0ZiMXgv?=
 =?utf-8?B?eUt6azZxSmp1VzhTSzlKeThwM2krNVNtQVF0VzZ3bHZmNnl3VTZNS2pwUk4z?=
 =?utf-8?B?OHV2SjZmWUtWQ0tDMHZyUXl0SjBFQjdwQlZyS2I5WkJ0a3JWMHBUYmdESEJW?=
 =?utf-8?B?VERSNDBCT0g0V2JhU3B2aGx0Z2paTzc2RTJNYUN1UE5HUlZOWFlGV1VuNFVE?=
 =?utf-8?B?TjEwN2F2MFhqdzlnLzdvTGsrYVk4OWVLQm5hQnpEN0lxUk55UlRncUlFNUx4?=
 =?utf-8?B?MDFYZnBrNURhS3d0R1hDRTByZEhMTXJBV1F4SGFvcE1LZ29LMEx0UXhTcUVx?=
 =?utf-8?B?RFhSamphWmJFQTR3bHZwQ25tNU5VQm5zaUJ2cEdzZnBia0pJckdXOWQvMmVu?=
 =?utf-8?B?VlJPdDkwcmRaWXJrZkVVTjFjd3pPNERCcGlIelJ3OFdTaEdiL1lMQVVaMlM0?=
 =?utf-8?B?R0dTbmRrSitWTTlFWlJ2U0JTNjFTdVByaUxDS2tDZDZTUHdOcTNLS3NRRkhk?=
 =?utf-8?B?eXk5NVoyU0ZIWS9odEFoQjRubVlLTzk3QlBneUxsb2pvcTJFR0g2U1V1OUdX?=
 =?utf-8?Q?fTwV0oaKxlI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0p0L2RuLzZHTEMxL05rZ3c5RVJjMDlLUkpURHRyZ1h2WGh3MDlTSjk0Q215?=
 =?utf-8?B?SDk0c1hNOCtsQWxYOWluWUNUSVNTYnhlYUVCdU16UlViZVVJU0VsVU5BWHBC?=
 =?utf-8?B?SmVLVnpQMjR1VjJiY2dFT0txcVIrNmJKSTg3VFFSc2VNcEJ5UVRZU1U3UGU5?=
 =?utf-8?B?QWQ1ZXBtczE1ZjlBcFNLTW1sUHhmQ3ZaL2VrNFJMMzB2N1VKaGhSZjlwWjN4?=
 =?utf-8?B?bC92L1dwRU0xTTIycm1POHI4c2NlUHVZQVRENXQ2T3YyL2hEWEd4d3k1TTBs?=
 =?utf-8?B?b0tGYVhUOWFDUUtFMkpNeGpNZS8xNHArdlpZREVpMlJKQ3Z4SzlsUGg4eDA1?=
 =?utf-8?B?VVRZdFJxamhGQ2JDdStLenNDTDZaWlpVRExOekRyT3RuNkQzMUxLOHJ6WjJV?=
 =?utf-8?B?TEc0K25FM0JXZXBJL0NyQU9tNXlyb1kzSDlMWXhkQWhRSW5BZzdWMlN1akRl?=
 =?utf-8?B?Q1BOOENWSUtCbTRxaWMzRGxJcy85Rm81Zmt6NHVURHU4ZVhtbzFaeVZrU2hW?=
 =?utf-8?B?RUQzaHBDQjBoVlFtZis1eDZtNGcrYU9Uc0dEOFl3U2tUWldWQldFT01lTExV?=
 =?utf-8?B?eTIrd041RkVVUUo3WWx4SXEreDVQdUdwc1dMREpIUVZ4ajV5c29hRkhqTE1q?=
 =?utf-8?B?emdrWnFnUWhkdFpQdkQ0WElhRkh0ODFtcVQyMG1zTDdNQjZJaVdCOEpCNzI0?=
 =?utf-8?B?OGpvNDRrcHVzcGtrMElHS0w4YTRhRnJncTRKM2RsTUk2RVgvY0JxTGRac05K?=
 =?utf-8?B?NEhFS21qN01uVnhZSUZVVHF6Nk1FUXhybmFQLzlnbU9lak5qLzJsR2crMk95?=
 =?utf-8?B?TDBOYUJubkJDM010WnVqbXJ5c2t0dTVLY3BVTXFRNzV4VVQyaEY3U1NhNHJt?=
 =?utf-8?B?RXdMenFRQ3NuRXRoaUdTMHNCUHJEa0RWK0pKbDJwU3kzS1BUYmxOZE5LRlA3?=
 =?utf-8?B?RFdFbnBuVGdNM0o0RU1RS2FXZWRXZFN2S1YvS0RJRUhWbm1Yd3NDazNaTm1t?=
 =?utf-8?B?VjVxYUJUUktNKzlmVXQxWjZxaTByOWFUMkNhMTkrOEdBODlYTUxUQk03Skx3?=
 =?utf-8?B?K3gyUHVnU0FDaW85SVNUYWpta1B4UlhLSERmY2VUQkJFelZwaXFDYk1tcnVo?=
 =?utf-8?B?MFJQSmo1bUs1YXNkMFFXcSs4VTlnUGZLalMzVFNnNmZkMFlxK0xuaGlaSnFY?=
 =?utf-8?B?b0FPcEd5OW9GZGx0RnpYKzMyMFl3clNIUEFvNUpPTVd4R0d1aFI4NDNmdWJv?=
 =?utf-8?B?TFJoUXdyeHR6UEJJZFRhU2MwRVZrK01RL0Nyc0VIQTBCbGtrMWhJbzlMM3Fz?=
 =?utf-8?B?Z0xDdUdaTUE5cnkrVmY0RlpsK1dxR29NZVhsbDJEdFordUlvck9iWE4zZzlN?=
 =?utf-8?B?RDJoeHNzcVB4RXR5a0dwK25pamFNVTFNb2VWZWhGc2V3WjI5L205NUZoTHJQ?=
 =?utf-8?B?OEh6S3UyeERYSzcrbGhBQWhEZTdlUUpobEZ0a2xWUHZYVWlTQ09oWEhnNzZL?=
 =?utf-8?B?QkRZdjgzekZBZjcvWjVJbDJVYWFNNEdwYk5sdlNHS0s4YVFLR2pLUnJURm9W?=
 =?utf-8?B?Qk9VQVNqQTNzRTBKVDhiWjdMenp0SCttM1BkTlpNY05BQXlyRUZmMHRqRy9m?=
 =?utf-8?B?ZDBzSHVzbHdyc0d0WkNjbkF2UGhRZEZFbUpzQ1pYa1lGTW13Z3VJUGNnb1k5?=
 =?utf-8?B?U1NPWklyelVHVUluVUJsWUZyOWhsZ2JKUVJ0eUFvVFB2dnZaK0tiUHRhcVJk?=
 =?utf-8?B?YWpvcDJYTjV1RldTMENjV3p1SHRsMkgrUUxSQWFZREFKaDRYUFc5dmlwUTZs?=
 =?utf-8?B?aERuRVRtSXkxT0VDOVg2TmdONGo5bXJ6V3IzNlJwODV6MkxBTnByM3NpQkZq?=
 =?utf-8?B?clV3WHBiRVR5T1ViTkVmanhPZHgwNDhTaWN1WWFVT2RjZDRpdEVscDdyT0Qv?=
 =?utf-8?B?S21yREVWazRZRnhVZXhTb0g5WVJzYmM0TThGQkkwbnpRZFBXcmg1ZHFHZnRt?=
 =?utf-8?B?d0tnZTgyWEY3SjdxZXdOekN3ZlZLcCtEV3NQcUNzSFV3WWM3YWNmTXZxcEhw?=
 =?utf-8?B?dDArTUhOaVFPUzRwNVhBN2YzNnd0MUFUVHo3WUZpT3p6dzFuWUpMc0JLSDRL?=
 =?utf-8?B?SUpHVUdYQThoYUhwWFRIZWwvUGQ4eXd4S3Z4NjVYaXE2VVk1K0gwN1dSSE1Z?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a3be03-ca3a-4286-fd32-08ddb3f93380
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 15:01:45.1898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ieGUAwHPAMMUn8nxTXgg79gEAjVV69gjOEpjhcizkzYSRcZRQkiytAdhVgG4oeIQSzf15uZN4ryah9t4dzsQnLmlmYqyUG63EtOoPnzClp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8006
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  38 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   1 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..9cb50e0ed9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..f02987753779 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6f50c15d0cfc..1c3112233b7a 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -19,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -112,11 +114,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -154,21 +154,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -186,17 +171,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 585bc1232658..c00f5782cb63 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index cf92a9aa2435..6cf85077d196 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 9092ae86df22..802bd57e7c96 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,5 +13,6 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index dee104beb2fd..3dcd737242ea 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -22,6 +22,12 @@ struct xe_tile;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -54,6 +60,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1

