Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1787ECA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 07:39:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9EC10E389;
	Mon, 11 Aug 2025 07:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dp/Uf/3O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397C310E38A
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754897964; x=1786433964;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6x0Z6nMMSC15VHLpYF/ptJrGr/Ju0rvDmZ3Qsg6uwUE=;
 b=Dp/Uf/3O5Ungk858SvbG5czd2K+M56SaHoS7EZJeUByZ1V/5YtNLqmUQ
 N39UPiIkoOb+XOSb0GL/GeJ/ci3LnkDSH3ccBAN7aszL5L0ii37u0eLxj
 RjddC6QlXBlmMa85RYjAARHmWt/eKQiH2uf4eRXp3SyuEydJCReZq2O+a
 Js7On4Q05Ws1L8PNJIzgQP3lMYVujtEUKr2pY38DBECtcdBiLAqD7qR1Z
 blU4X8STniBcfeGSUKcymLr8C8nCuCqIfMB0QogyHJtVo8ROx31aMN0Ce
 AX6BNq0ul3hcy7xE4IP7z9BCYNGn2Dx+LEGXNWZaFhGeeDz6BeFYbJysH Q==;
X-CSE-ConnectionGUID: AuxtJ7BGTdi/fj1nLgFWWg==
X-CSE-MsgGUID: AS1Go/1gRneZpgy8u5Jb8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56856959"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56856959"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:23 -0700
X-CSE-ConnectionGUID: m50t+KEfTI2mx+WPQOeEpA==
X-CSE-MsgGUID: fHJrVPc8T2OvCg9+7HsZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171203745"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 00:39:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.58) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rGoONW0LZMS+gAYpnq1kQ7XfFzZljA7RlttF1ESQtoYwEoSXCXxn3qoQB3cWke4MUJ5n5oo0jxMW4bKOhenJw1zEKIFritUXrWsOA5JOdXJlOVcHpfDEohep5IMANnYK7JH/610MQAdm9F+/AC1qw/yyiGTSWdSkpJWeqxFjLrW5oL++/TjQmG89gUkV/6dKEYgM3iDVFzCnoo5FtWe3j2vmS0lGqc0ADl/prq1mF/psdmblK049Vbl8qtrQnBQYoPjYtbCN7oIFTIqOuOyjun2vARJDa2HLWnLFFup/ULpIQwCUYclezybRmlp3or13C8eLnydlR0cY0RPvaqbD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMxKoaYpVbpVpFF92nb62Ocyv5W2XV09WUzcCkiPOdY=;
 b=Xqq3JciL5sU5to1CfYO2VPar6BsE3JkUvykdrdmD2eMPNbDw+P4BfnynvmuLEMcgYiey5I+psXZGHRWQ5LA0AbkJ+nxZMFyYhGnKKlKqh7GXJQ/xqFJRnPD26dwv7dmN5/oHF21a3cKEKv+gnFu2RGoKuyTTzrtYZ+YYa2CNyp9C6iY6EPlaqLOAKNcENjXYjWZFUHTKkbH8baY4CQqvUM8v/SNnDGR6X0CIIRgLeKtwy6sIKXKcBK8qfTh0upivmMrV79iFI5eCp6/F0kon9enINNeBL6vLeLsJb7V+pU6jX18HFvffJDcGpdxkQv9G8sC594xOHg/QCd2qgyrGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 07:39:13 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 07:39:13 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 2/2] drm/xe: Move ASID allocation and user PT BO tracking
 into xe_vm_create
Date: Mon, 11 Aug 2025 09:38:56 +0200
Message-ID: <20250811073856.1950732-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
References: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR05CA0039.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c73288-0a5a-4c93-83f8-08ddd8aa2acc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEJKM1NEV0k5NWxYVHp3cUhEakE3MW5FanNNSkZmSWxCQnZWOGNzazFpSDJu?=
 =?utf-8?B?SWZPL0dJelMwWkV5TGY1enJxaDhRampNN1VFT0JzMUtWdkxXUVFKa0VXU3ZJ?=
 =?utf-8?B?aysvOG9zenEzK0pxb0ZpMTZ4RmVOVk85Qjc1RGl1TzcvWERhZWRQOUZ1cFdH?=
 =?utf-8?B?aUZTb09PT3R0TnNxSGUvQ3c4MElFNk9WY3dRTjJJbEpzU09ncnBwTzBWUjRF?=
 =?utf-8?B?MGpQRFE3OFFrVjdtZTQvYkU2Ky96RVFLNHM3NFRSckg0RExhaThVeFZkUzdl?=
 =?utf-8?B?Y1F2WkNRMGpxMFVJOVcxTjh2Z3ZvbmdPb3RIMWJqRUNKdDdNRW84bTJLbXJT?=
 =?utf-8?B?M3ZEcWhuZFhha083dmEveFRnVEtBbzBkVDF1MW1IdWt3K3FTSEpseVI2cmRT?=
 =?utf-8?B?SnV2bjB3SWpVdGxIMXBxUWpCVW5lT1g0UWFNa0MyRW1wMFJIZldUWTVNd0hF?=
 =?utf-8?B?cGNXZHc3c1RTRDl6b1pFMnU1RWtWczdXQXl2dGVyYmFOWUVkcVJ2NWFHQ0lU?=
 =?utf-8?B?YU9rMUg5UCtwTEJwM0pjcEJYVW90TldQY2xHN3NMS3c4Y2ZMTmRscWdGU3B2?=
 =?utf-8?B?WTgrTkVlYzByY3FVRUh1aG9YdExFT1ZmUUV1T29GNXBiT2hPVWJaRlZxMzVk?=
 =?utf-8?B?ODgwaGRsUXk4T1MyczA3T3lJcnZyOHliN3AzS2RBUWUwNWNXMnQ5MWgwQTZk?=
 =?utf-8?B?V3pweThqTElXbjBmczFSOXo3NkxxTVNUZ1JTOXdKZklWSnQ3NEx6RmhQaG9N?=
 =?utf-8?B?L3I4WGtTOWpEcHFTZUFQZW5xQTlrOXd5L0UwZzBVdlRGMDRPK3lISk5YSFph?=
 =?utf-8?B?T1JwaDJCV0NOd2FSTXZZeUpUeWpPU0crdk5aMkZKUmNzNklSV1hwcmw0MUo2?=
 =?utf-8?B?c3kyVGZuVHpvRTNDd2lxdkowOVo3ejZvdDFpMWpXYk1xZnFoQ0YwLzZCRzMv?=
 =?utf-8?B?R2xSVnIrdHlZMmRjL2lxNlFSaVF1UlIzQkpQRENvY2E2ZlowTjdVbVRHVGph?=
 =?utf-8?B?dzUwY3JaWlRsdThLNUNwUjRtQUk3YzZTWnp5QmkzVFh1M3F6d1lkeUs3NVh6?=
 =?utf-8?B?RXJ6Q0t6YzFaTkFUa2lzcUFOdnVodWU0ME51OUVFalRnb0loWnlUaFJZOVN2?=
 =?utf-8?B?U0tMVFZjdmV2SGI4TVdRWHlmRUZEV1FEVXorS2ZmTFA0SitaMHNUcEZqS2tk?=
 =?utf-8?B?RTZORVNBUVQ4UnJ0N3oxYWpyc1dNb1VNTTQ3OXloWndTTmFVS3l1YWxXRnNQ?=
 =?utf-8?B?MnFUY083RE1RaDY2eFlCNUQ1WEVCczhLaDFxKzFJZCtrK3pQV04yb3BKM1BY?=
 =?utf-8?B?VzR3WTRSdWUzMk1PWnNiendIMElHNHdrTGJNQ0IxeEFRcG9DTGVydVIrOXVu?=
 =?utf-8?B?UE5oL3Rnc1kxWkp2R1gzdmZyY2pmS2pzcEVwTlIwcUJQRmVoaW5ITDJIMXA1?=
 =?utf-8?B?YlFDQWkrOWZzTnpnY2VHamFGckVoQ2pCOFN1NUxyNk03eG5yeXhzdy8xZTVK?=
 =?utf-8?B?OXpoOHRORDlGNVlFMTNWbUFtRVFWTSsxVGR0MW9vbGhwRDlJdk1VMDMvZ2d4?=
 =?utf-8?B?OFdMbU0wSC9DZXRQZTZrVnEzS3JjT2xGODVFNXQzR0oxYTJ2Ymh1cTMyNVkw?=
 =?utf-8?B?enl6Ky9BS2t1STQrS3F0L25OQXl5WmFPV0FMc1pCYWRQdWhWT0UyWFZiYXQz?=
 =?utf-8?B?TldFL2NTcE9WNXFOLzRwb0Y5ZTdRTCt2Zk5VSlBtWWFmZ3F2dEJJaTJycU9N?=
 =?utf-8?B?bmErQW1QY21jTk1GcXF6NVdOZStmYUpCbG10OGVBVTFyQ29ONGRBUS9ZZkNC?=
 =?utf-8?B?UmZqVTVXQmtqeW8xd1pGbHZ3QUYvQ09YVllmTDFoWnpxT2N3b1RKUXdvMyt0?=
 =?utf-8?B?VGZiZVBja3VBU3NCN1J5YTNZMkw1Y2RnZ2liaGRkVWUyWGpQRWpiWXVBQXA5?=
 =?utf-8?Q?HyyflAehwlI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2tPK3I0NUJ3VWhBNWpoWUw5cThlZm5qVmZETnhVMWozcC95aVlQK3RvZVRZ?=
 =?utf-8?B?dUhPOWgvNUc0OHV5azB5ZTBVVEllY0ExMHR3UlZxS3U1dndOMHBKZVp2N3V5?=
 =?utf-8?B?RDhYcllJWExocUd5S01MaXNxcmpURkpqbGtPZ2NqemxoOHJRek93YWtFWDla?=
 =?utf-8?B?Vndoak1CaE1uazFacUZWa25UMDYwaUtIcWk1QTkrbEVqTUJJMDBxelZtemxH?=
 =?utf-8?B?MFc1NUVsbmJYQVd5MzdhTzc3MGtmWHp0bHRWbzBvbVdZU0N3UVFkUmczZHFM?=
 =?utf-8?B?L0M1V1FERTh3K3pBcy9ZdHJvNzFoOWZuZGs0aVVvMGVyckJ3U3ZHZkZtajhv?=
 =?utf-8?B?ZGtaZ0cyNkk3T0tPdTJ3T1FURXhIN3VuVXIxdlp6K0FSNHhLWDdWVXJtUWxt?=
 =?utf-8?B?UGFDM0wrdHdLQjBIZWtvUEtMTVphcDZWb0ZDcGR1dnA1UzRZY2I2cjYzRHdz?=
 =?utf-8?B?ZjBaUDd5ZWJRcG8yU25DdTAyMmowZmFnMzVkeVp6bElBOVl2bHVXWEJmSnpv?=
 =?utf-8?B?S0NRejZtN2RVdGF4dTV0MElqeWNSYnZ0dEN6cVJCemVEcXdSWE9XRHR5QVU1?=
 =?utf-8?B?QjJkTFlHYkZJczBUU3hwYWViUzY4cTAyUUV4c0Y1Q3pQMXducEtadUU1MGdj?=
 =?utf-8?B?MHd0TlJUSDhsUTZtSGpUeGt1Mk1VbE5oSnV2TzB5YklhZVgyVmZEQzRjQlZa?=
 =?utf-8?B?dFFJRzlSNHREcndYWHU0NjVjU1lSWkN5b3lNcmZ2WU9FV2J0K3g3RkRtSk03?=
 =?utf-8?B?ZlpDMnU1bDNqcmFMNStLT09GTHBGVHcwSXYzN0xqZGhHVllIMWpoL1B6RnIz?=
 =?utf-8?B?RmlzVHBuRlBtRk1BUktodkVRbzVnT3VLUnF4bGI2QUNvWG5mY1J6bk84WXcz?=
 =?utf-8?B?ZXhMNGdFMjNDWFNFbm9OVFpTemMxZm9NYkJLdGs0MFVLcXdHVVE5aTd4VjR5?=
 =?utf-8?B?enp1SlpTZnpQNTZERGt0MXcxa2NoQlgyRXhwRjIxR1lQK0FhYjA3UWdlN3Ew?=
 =?utf-8?B?K3V6ZElxcm10Q2c0UHZKY1JjRVRROTBLbHRHTWVUaVBKRmE4VVF3RTluRUM4?=
 =?utf-8?B?Y0RCU1p1K0laLzZRaWtxZ0VSeDRxQzlKRWswdWJzYk5qMlFzRU9MUldTRjhw?=
 =?utf-8?B?cHRTS00wNTdwVVF4UHp6L2IrL0ozSCs1L1hKM1JIMDFGQlloalc1MSt0UjNG?=
 =?utf-8?B?MHp2NU1kTFRDZm16K2VGNDlWOVd4eWdwSTFZWG1rYWFTa1dueC94eER3SVNF?=
 =?utf-8?B?YnpOeUlCMmxLN3NuTVMrRmFuWkxwMXg0QVJSZXY5SGM1a0VKekNQNFozQXRq?=
 =?utf-8?B?NWo1b20zYWFpbXg3WkthNzN4ZUVGZVlZdG5zdVc5TFk3RDlCWWlyemZkNlJI?=
 =?utf-8?B?OC9WRm8yandGL0dURE5xSGNoQ1hTYWQ0OFVaSzN0MnhSY3FEN1lXZ2hNRmNa?=
 =?utf-8?B?Q3ZRVTBMallUVVJOc2xrY2VseWJRdFZieXJ5YXBxdmpoVEdKK1lRdTBwd3Ry?=
 =?utf-8?B?RzhSUmxLNnNyeUFWMEM2RVlzdzE0eitvUG5OZ3V6bnZmR3JyZHg1aXN5Zkdm?=
 =?utf-8?B?c3hpYUk5bWdRODVkOG8vREd6MmhVMlRTSnZpQURhejQxOUJSZDVkaEdPcEhQ?=
 =?utf-8?B?UTF0SEpYM2hNRlNzdy9LQVhuU09jSXBaRGlJMk56TGg0aEhxQ3hjSXRjSUZM?=
 =?utf-8?B?NEJXNGVQdVpuK2YwRzVPQ3A2bFdVVUh5VjZmZUxSTXJaU29xRDE5M0RRZWNy?=
 =?utf-8?B?MVBPNHhaQUYrNERsQWxSMkhrRi8raEkvOGFZaW1KaUpIRGVpMEc0ZzRiK0dr?=
 =?utf-8?B?RFN4bzhNRWF3UkdzbTc2Q0t5ZitNb1pxZWdFeWhsYkxPbms4VmUxVmQxUlBx?=
 =?utf-8?B?M0gzMmNvSDhFbzZMWUhCeU8rMjFiYktMNDV5M0ZjclV0cXU0NjUrQUNzTUlD?=
 =?utf-8?B?dk1oUzV5Y2pnRnhBUWVIbUpGQWNRZXIxNWx2WDVVUG13Q0V2cytpSG0zZVJL?=
 =?utf-8?B?bnJPaEsyYzFMMUtpcE9mWEV5MWdLNG1FTVRmdFFVcDEyU2NxT0JrRm9zMGxT?=
 =?utf-8?B?c2NWMFA5eWJtZEJEYkRnSFVwNXQxV0lGRkxDTEZFZTlYbTFkK3BqWTlrL25a?=
 =?utf-8?B?cGlleEhRSlR0UXVOWVhxcDRlYm8vcFhkWWhWa1JPQ1NlZGVjajdYRHBxbXJ5?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c73288-0a5a-4c93-83f8-08ddd8aa2acc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:39:13.2146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A39b7DoCdXY2Dez629XB+xlPp3lO7K8svcJZZVyr9tGpnStEPjfgFICIaDF5EkC38Rdwi6R4ubvNSgk5qnIi0lXxu6SaSxuuGv3X6UStVF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF383C22AA3
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

Currently, ASID assignment for user VMs and page-table BO accounting for
client memory tracking are performed in xe_vm_create_ioctl.
To consolidate VM object initialization, move this logic to
xe_vm_create.

No functional change intended.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 41 ++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 157e11bd2121..ae3a2871ede5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1795,6 +1795,27 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 	if (number_tiles > 1)
 		vm->composite_fence_ctx = dma_fence_context_alloc(1);
 
+	if (vm->xef) {
+		if (xe->info.has_asid) {
+			u32 asid;
+
+			down_write(&xe->usm.lock);
+			err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
+					      XA_LIMIT(1, XE_MAX_ASID - 1),
+					&xe->usm.next_asid, GFP_KERNEL);
+			up_write(&xe->usm.lock);
+			if (err < 0)
+				goto err_unlock_close;
+
+			vm->usm.asid = asid;
+		}
+
+		/* Record BO memory for VM pagetable created against client */
+		for_each_tile(tile, xe, id)
+			if (vm->pt_root[id])
+				xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
+	}
+
 	trace_xe_vm_create(vm);
 
 	return vm;
@@ -2062,9 +2083,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	struct xe_device *xe = to_xe_device(dev);
 	struct xe_file *xef = to_xe_file(file);
 	struct drm_xe_vm_create *args = data;
-	struct xe_tile *tile;
 	struct xe_vm *vm;
-	u32 id, asid;
+	u32 id;
 	int err;
 	u32 flags = 0;
 
@@ -2104,23 +2124,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
-	if (xe->info.has_asid) {
-		down_write(&xe->usm.lock);
-		err = xa_alloc_cyclic(&xe->usm.asid_to_vm, &asid, vm,
-				      XA_LIMIT(1, XE_MAX_ASID - 1),
-				      &xe->usm.next_asid, GFP_KERNEL);
-		up_write(&xe->usm.lock);
-		if (err < 0)
-			goto err_close_and_put;
-
-		vm->usm.asid = asid;
-	}
-
-	/* Record BO memory for VM pagetable created against client */
-	for_each_tile(tile, xe, id)
-		if (vm->pt_root[id])
-			xe_drm_client_add_bo(vm->xef->client, vm->pt_root[id]->bo);
-
 #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_MEM)
 	/* Warning: Security issue - never enable by default */
 	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
-- 
2.34.1

