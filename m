Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE68CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 14:37:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1823B10E93D;
	Wed, 10 Sep 2025 14:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HU+iAWbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7AF10E943
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515073; x=1789051073;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TBqrRlMwXizyeB/4IQPiXxNRpCI+t6KuDPl4BP5sEGY=;
 b=HU+iAWbm1vG6xWdq/y4aT1RJ/dvSTs6op43ArJC/TkMtd1uyk3AYlaR5
 /fVHd8eaR/Mah20b2G2+vy4vJ3b5x+uEmiG6vzpQm97rJpz7fXOjz8AQP
 /MqKL0BQq3dxhxlc8n8gbYXO8uzmFUoxSjF+CpudjCXYj9Ali0Vb/DfuD
 AsWhr861poXMyoCEcOEJGRaDMwy0nhDUVBPGYWIcpIR98yzP97HqLXrN/
 loVAUg+wvKTAQod5Rcgx/QfmdrKMAXw3s7hgL6vWkcGRCW4Vx1SFNJ+qy
 yCjrU0H1UGyPMSEgC0NQMU9lev3BwDRUxtZ82uVK6R5tT9m1yx7HGozGu g==;
X-CSE-ConnectionGUID: 2svTGN7MSdmXKLvIOXvA0A==
X-CSE-MsgGUID: r8L3ea23RvKYluPTLCkj2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63657783"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63657783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:52 -0700
X-CSE-ConnectionGUID: RY5o95hjSjaSMP2d0FmzoA==
X-CSE-MsgGUID: 66yyW59dRtSSulAEX8+c2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173791408"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:37:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1su0gMy2acthDD4ON6VLWNjPYw+LsVmXoOIgUFHb+obwXk4JoASzL1KcpoezrwMyAG2Em/xrPdEYlk7ZWtiQX9rk2/4uKl3LkcFHDhm5SxXeNQranFp4JatPbMoAw1I/TJ7P681tTw01BXjdN6wXtVQ7TzY0qh2Pu622dk1u6OFBIHfQvedSSS/K2gy5OWrIixEievvWNJEWOJnwYcsRzemuNvljFPSKGj84e5uJHwWuP8Ivts9wKvFXnFEPqU7dp0zjyxLqM81699CbM3UU09nrg1pDQwAi8JoLJgfAgC18Px7rWYjApp+xALbyY8mRh+oNt6xtlD1HKRvQuMcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8kNeUwo76TPX1nvvwLGhpt/sLx8ftjd6nJ2899tebo=;
 b=fuX4ivDEdROuq31AyGhd2ghIP/ksroT4kdBp5u7Ek0DiVj+nnSDhYK/DIH0z0s8U6Hd6lITAFrTcaLZf6HmpoEeHlA7Gxsev0lorzp/E1Lw0dd3zQgmBrF2Ae7cSn1O/OIvc2buQftPUCO4jd8RwzIQWhIdF6oa166tdKPIGN3QqFqWbio6ZNhJbhzKOR+3jVzv0ydQZ7DYBPJEDy25E8DoUvBM09KT4RWwuSkC8IzlKZzhm74SsjvN6m5SVhrIbNNw44TqXvZzMUS1V+ii+wUF7jfn/PHeoSPFSJX7A5zoKD2swx7OSvZCbeuAyNCOJHT5LZ6BIGa+Kg/Bjnv+C/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:37:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:37:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 1/4] drm/xe: Add initial support for separate kernel VRAM
 region on the tile
Date: Wed, 10 Sep 2025 16:37:33 +0200
Message-ID: <20250910143736.792426-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910143736.792426-1-piotr.piorkowski@intel.com>
References: <20250910143736.792426-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9b6845-225a-488e-b7da-08ddf0779d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDJya25mLytUMjZ1WDdUdytjeFFvd0RoRlZuSURtWWNjUmdxdTVMNWRUdndV?=
 =?utf-8?B?VFBCWDBST2dEVkc1b2U3T1NrR0ZIUlJQYVEvSGUxRG5wa1dTazhDNkd4WUlx?=
 =?utf-8?B?NHpKU2hBSGhmVldjQjBmcSt0d0FiTzQvQlhnTDNaNjUyZ0JpS25sOUJ1L1FK?=
 =?utf-8?B?YXZ5dVNOeGJzWmtyNHlZZGFSeU9XQWpQZEJMM3EvMG9LUXRUZlNqL2k4RStu?=
 =?utf-8?B?NHhZZHg4Q2RhVnBPaEkrRkM2cGhHMm94WkNXU3g5dlo1aWRrVEpMN2J2Rm9Q?=
 =?utf-8?B?UWlHNHVKVStNdGNnWUVQeTBYWlZvdllBS0NHV0R6d3JmL2pqWkhiaWRzQStL?=
 =?utf-8?B?b0M5QlZlTW1TOGdNQlllZng3Z0R6Yk0vLzUyQ3hjZVhrT0t2RmtiVUtPdzRx?=
 =?utf-8?B?OHBlNTc1UDNuZ1U2MjJybnppYmg2ZllMWlZsRkZqRDIxTlBFN2pkcStabkNP?=
 =?utf-8?B?dzljRW5TdjdEQjgyM3M5TitXcDc3U3RPakMxMFR1dXBJc2ZsK2NTbDVkTHZp?=
 =?utf-8?B?b0V4TkQwL28xa2RMYXpQNzl1YzZyL1gxWTdyL3ovWDRxYkhtblhkbGJ6VVVY?=
 =?utf-8?B?OG8velBYZlU4TGxMSXdHWXVWSndLS3ZDdVdtRk1zbzR6SFZQdnV5ME5lTWlL?=
 =?utf-8?B?K0RIcTBBclBGbGFna3pSeHJDMU9BOVRvV0Z5VDl6TFlKZk41RTFnNHVnNXN0?=
 =?utf-8?B?VG9UNlZlNUxSdkM2VXhzZDlJaitxalloRmVlYVRJcWZoc2FnZkR1MWJMWUZL?=
 =?utf-8?B?UE1jaEdkUHN0WC8wYVlNMmtsOXkwYTlOSzVNTzdkZWRvZ2tOaloyV0NEVVRJ?=
 =?utf-8?B?N0N1ajVrNEEvSkhOanp3YzBMRStIU1pHaVNHd0dYNThNTGcvaDRUblFTQlND?=
 =?utf-8?B?V3RIMFg4TktNRndQblM0cVdWTWFFcUZOdGl5ZThPbTdkQnk3a3NPL3JmZ0Mx?=
 =?utf-8?B?MXptNk9oVnlydzhQdUJZOTBDUFpVcWhtdGJYVStIVmRjYXFUZmgxZUJQV3hF?=
 =?utf-8?B?QVk2MWt1czZyTEU2WGFVQ2c4akx4YWQrUUY4bkdYbzJXWDV4NXZUVTB2OTJU?=
 =?utf-8?B?bmJjWS9sNVRZaFhJSDM1QnR4NDRKWlFndHM1L2ozS2taQ294WVhFY3R1dllW?=
 =?utf-8?B?SHY0Zk0zUTJaODFCS1pNUWEzbitRN3VaZTByaUxZa1FMYVBWS3BFZGNiZDBG?=
 =?utf-8?B?eitGYys3ckRPMHYzSUZwVTQwWDJ2dXQwYllsMXhUaUh0TW5ISE4wWHFZZlhJ?=
 =?utf-8?B?cXI2WEdRSFV6bE5RY1pqcVVOSHZ1V0tzbjBuVEg0aGV2ajJxTlZWd0RST2ZU?=
 =?utf-8?B?QkJFN2ZwWXVXRzd3UGpGeGlQeXpYR2hLMHc4d09Wd1NkeXY2U3RFQWZHa0lw?=
 =?utf-8?B?R256b2U1VGxPbG4vUEt1WStuaFRRZXdLYWxVMFM2NThHbjVoSXoyZm5OdEp0?=
 =?utf-8?B?VVFqTU83TERhQmp5SkdvalZVaTdUNGVPTUpMVWxMeDVvamJJMDR1QkhNRzEy?=
 =?utf-8?B?WWlsK2FnRjUyc3Zmb1QvSDN6VGhMNXpNQnNXbTlMZzc1eFVuV3VGYy9Uckt4?=
 =?utf-8?B?MXR3QlVLdWNsNnJJSVlSdXdKaURZRUNzV1BkcXN3WFhtc21oZEdMSHpNdGR2?=
 =?utf-8?B?WGx0eDd5NHhJdGt6aEg4MG1ZSjkyQURKYUpKRndYK1dEOGkyc0NpSWkveXFG?=
 =?utf-8?B?TVBQZVRwVnUvNXBvOVpVVjdVQ3MxVFZMeCtRT25ueVREYnorTWszMmNVRmRB?=
 =?utf-8?B?UW1pMFpuQjNvaEFmYXZ6YXJpeHlDdXg4bThpb1hCaXZEZElHWjJOM3JxTWJs?=
 =?utf-8?B?bmZHYTZRNHVXNHVDM044NmhNYVczL05JcW5pVUk3aGQ4VVF2MFdkWnczYm56?=
 =?utf-8?B?NUdya2dwZ1o2M1VaWWJzNXk3TXdKdDVHOUZjQjl1cTJnZ2hDcW9nMGdKVE5u?=
 =?utf-8?Q?f93XOT5p7v4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhrU2locThmUnNmdklvVStlNER3MUdyemoydEZuTEJ3S2VLSEo5TGRDb0NR?=
 =?utf-8?B?MS9KeTRSeEFpd1VWZzVnTmxSSjlONjNmZ3JXYytodFhNZmVaR1ZTZGpORWEy?=
 =?utf-8?B?a1F4dDViTFZLK1lHbEZuV2FpQjdDNjVIODBYY0Vxd0FLNnRnaUtHQklBMVd3?=
 =?utf-8?B?K1lSQmpHdlZ6YXVWNFBWUCtrWmxveFZHNXU3d3dOWjJsWm1pZHFkRjB0QkpR?=
 =?utf-8?B?bmZnRUVaWW81UUNEd1pHVUF3eWtxWUhCN3dhR0c4YW5kMmJKRE0xTDVnakJM?=
 =?utf-8?B?V0V1STZkTFZFZDNiejlPcWRyN05aQ0ZUUU9XRlVkVnFlVmxNcDZtWFI1K2pj?=
 =?utf-8?B?RHBrTS9tZ08vbCtiSi9jcnJLRFJ5QkIwcFkyalhUbHpZTjNMTmlzdXdvak43?=
 =?utf-8?B?V242RlZLZ08rNTEvR2dNMGQ2em56czY1TFBrV2Q5U2pxTjUxMmkxTWpFMnFG?=
 =?utf-8?B?YVhXbjdwWGk1WmxBV2hLWWdsRExjRW5SVTZibW4xbWVSZTFicHZjYmtPL0FO?=
 =?utf-8?B?QmkxZ0pMSFljWTJWcXBlRUZ0dHVKUnVUZTk5THo4WC9aaEs2bjgvM0ZRSU55?=
 =?utf-8?B?bDVXOHREK0ZKQWU3NWh2a2ZVZnhjb0RjSmZ4aTE4cXQ5eUJzYkZOOEFmNTdB?=
 =?utf-8?B?cVRDYXpIOVJoL1lEODFMT2V2SHZENE5QUFBEcm4zTTdTdDlYbEFlNnRNVDNy?=
 =?utf-8?B?WkNRcENYbDZlMUhYQ21neWkwcFo4TG9PYXNOTENPb2Mwa0ZrOGt4dkc5UW1H?=
 =?utf-8?B?V3RWRjBjeStRcTAyamQxN051bDlKWmxKWGQreHU2Zk5zbzhBUndYT2Rqa3pQ?=
 =?utf-8?B?VGNNQldBZFIzbTJRWUdCZ2FiNlVIeWlzaHVHUzFFOXFzamhxRmNqUUpvN2hl?=
 =?utf-8?B?ZWtnLzNXWHZ3bEpJQy9pMXlac2w3SWxWYVF1OVhHaXdaQzVYMWI4V1hnRHZj?=
 =?utf-8?B?cXYrVkZZSTZOL2xVZVorVVAzTjVuRk5qWGxEalBxenNwOWNNbXBSckFqSEhz?=
 =?utf-8?B?enZNL2w3SkdxNi93U2NOYkxyRkZtMSt0enowRkhOSWN0RTVSN2pPRVRNRGtF?=
 =?utf-8?B?d2I2OVNwSS82S05TcWdrbXVFMlU0T2Z5dkFSVlljbHR0OEVIdlJvUCtrbllS?=
 =?utf-8?B?TldXSy84MWUvd2ZwTk1XOCtpbGNMa1YrWTdrYjd5MG1KZGl2WWc2Y3IrUkpv?=
 =?utf-8?B?dEZJZjZYeFd6RXBIS0pLVXhtejV5U3BYVE05SVNsOS9DT2JVOWV2MGtzM21q?=
 =?utf-8?B?TVI2TE8wWnNPZGY3K01FNFNFOWwvOXVUL1lmZ3NhVDF4KzJ5Y1hGdkhoZi9o?=
 =?utf-8?B?aklMSjRZQTVNYk1RS092dDc2OHY3RlhnUG1YcURiUnAyc0RZUTh0WjJDVTZ0?=
 =?utf-8?B?Y0pCTk1NZUFsVHpka2VGeTFmTnlKazR0cy9tY0VXNnVScmxHRXVBN2p2NXRp?=
 =?utf-8?B?c2tkWVZiSTlsNDU1TWNNRS9JRW96WFYyNlI3ODBmRmQ4Zzk5SmJ0M3Q3cjdq?=
 =?utf-8?B?Q0pBeGVjc25wWWdhaFJIN2kzUnhVenY1RmVOWHBjaXRIeUtUWnRuWkhxZGRQ?=
 =?utf-8?B?SEZ3czVGdWtwZGJucGs4VDZlM2tJUk1vZUZxTThpbkJ1SHJyNjdiOTl5dExQ?=
 =?utf-8?B?NDV1NUtDemJ6TmQ3NU1YemdvKzhtSGgwVkhFTWxEOFNtU1NMdllmb0NkT3Bu?=
 =?utf-8?B?OTZIV0ljZTY4WWxONnJsZ3BTZG94S0FuZE9TYUlseVBLeGFOZWdXS3N4Qm9Z?=
 =?utf-8?B?MFFaOFdDTTA0UUtCVHNLWm5KQ3praWtPZzkrd1VXNUpuOGlUTEdmTWpUbWVu?=
 =?utf-8?B?NVdYTDJLZ0I3L001S1NuMnhaamZKS2pmaEVpb2xrTDRxSWFWcW5qb1p2NkI1?=
 =?utf-8?B?a1QvNk9lakFCVEZLeWtsakcrM29kMisyWmQ4TWlaclpCQTdLRVRpZ3dGRHp2?=
 =?utf-8?B?WmIwQWd6RkVEWkVyRlRaeFNlOXhtVEdlakpyU1pFK0R1U2hKR09lMW9CVU52?=
 =?utf-8?B?eXJTaGFZUHZTQ01YRVRDUUVLcWpGVDNkbnlWSTA2OW1xbFZ1Y2pIY01WQW02?=
 =?utf-8?B?Vkk1NlIrV1VkVk1iamllTXA5aFhvRzA2Q2R5bm5QeVNSQ1AzQVpQUVdPcERB?=
 =?utf-8?B?cEdic3hHYm55WDVxTHEvdHp3b1UrRUpueFc1RnVwaXVnR2dRaGp5bER0eGEv?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9b6845-225a-488e-b7da-08ddf0779d5d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:37:49.0360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVsMloqcBZ0UeldoxmTF8Jye1jtz+tcuLgZzNBfF+dwQyneLjqn6mvb1o0LOspjg4h73vKtHr39nEjs8up/jEK/auyRH5v/g6GYNxh+54bo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

So far, kernel and userspace allocations have shared the same VRAM region.
However, in some scenarios, it may be necessary to reserve a separate
VRAM area exclusively for kernel allocations.
Let's add preliminary support for such a configuration.

v2:
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper (Matthew)
- moved the VRAM flag iteration macro definition into xe_bo.c (Matthew)
- drop unused bo_flgas from bo_vram_flags_to_vram_placement (Matthew)
- use hweight32 helper in __xe_bo_fixed_placement for readability
  (Matthew)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 89 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h           |  2 +-
 drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  8 +++
 drivers/gpu/drm/xe/xe_tile.h         |  5 ++
 drivers/gpu/drm/xe/xe_vram.c         |  6 +-
 6 files changed, 92 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index e6d16b34e5b5..97b242715ae1 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -34,6 +34,7 @@
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
 #include "xe_sriov_vf_ccs.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -81,6 +82,10 @@ static struct ttm_placement tt_placement = {
 	.placement = tt_placement_flags,
 };
 
+#define for_each_set_bo_vram_flag(bit__, bo_flags__) \
+	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
+		for_each_if(((bit__) = __bit_tmp) & (bo_flags__) & XE_BO_FLAG_VRAM_MASK)
+
 bool mem_type_is_vram(u32 mem_type)
 {
 	return mem_type >= XE_PL_VRAM0 && mem_type != XE_PL_STOLEN;
@@ -213,6 +218,27 @@ static bool force_contiguous(u32 bo_flags)
 	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
+static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
+{
+	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
+	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
+
+	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
+}
+
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 vram_flag,
+					   enum ttm_bo_type type)
+{
+	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+
+	xe_assert(xe, tile_id < xe->info.tile_count);
+
+	if (type == ttm_bo_type_kernel)
+		return xe->tiles[tile_id].mem.kernel_vram->placement;
+	else
+		return xe->tiles[tile_id].mem.vram->placement;
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -245,12 +271,15 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 u32 bo_flags, u32 *c)
+			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
-	if (bo_flags & XE_BO_FLAG_VRAM0)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_FLAG_VRAM1)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
+	u32 vram_flag;
+
+	for_each_set_bo_vram_flag(vram_flag, bo_flags) {
+		u32 pl = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+
+		add_vram(xe, bo, bo->placements, bo_flags, pl, c);
+	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -269,11 +298,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-				       u32 bo_flags)
+				       u32 bo_flags, enum ttm_bo_type type)
 {
 	u32 c = 0;
 
-	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_vram(xe, bo, bo_flags, type, &c);
 	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
@@ -289,10 +318,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 }
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags)
+			      u32 bo_flags, enum ttm_bo_type type)
 {
 	xe_bo_assert_held(bo);
-	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
+	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
 }
 
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
@@ -2152,7 +2181,7 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 
 	xe_validation_assert_exec(xe, exec, &bo->ttm.base);
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
-		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
+		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
@@ -2210,34 +2239,33 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_fixed_placement(struct xe_device *xe,
-				   struct xe_bo *bo,
+				   struct xe_bo *bo, enum ttm_bo_type type,
 				   u32 flags,
 				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
+	u32 vram_flag, vram_stolen_flags;
 
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
+	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
+	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
+
+	/* check if more than one VRAM/STOLEN flag is set */
+	if (hweight32(vram_stolen_flags) > 1)
+		return -EINVAL;
+
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
-	case XE_BO_FLAG_VRAM0:
-		place->mem_type = XE_PL_VRAM0;
-		break;
-	case XE_BO_FLAG_VRAM1:
-		place->mem_type = XE_PL_VRAM1;
-		break;
-	case XE_BO_FLAG_STOLEN:
+	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
-		break;
-
-	default:
-		/* 0 or multiple of the above set */
+	else if (vram_flag)
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, vram_flag, type);
+	else
 		return -EINVAL;
-	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -2260,13 +2288,24 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (vm)
 		xe_vm_assert_held(vm);
 
+	/*
+	 * In the case of kernel allocations, if the tile has dedicated kernel
+	 * VRAM region, and tile->id does not match to tile->vram_id, it means
+	 * that we are using unified VRAM and we need fix VRAM BO flags.
+	 */
+	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+		flags &= ~XE_BO_FLAG_VRAM_MASK;
+		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
+	}
+
 	if (start || end != ~0ULL) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
 			return bo;
 
 		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
+		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 33d7c122dcc9..21c8741126c9 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -121,7 +121,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags);
+			      u32 bo_flags, enum ttm_bo_type type);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index bfc617d9553f..9729ff0d91ee 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -157,7 +157,15 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.vram: VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index d49ba3401963..6edb5062c1da 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return -ENOMEM;
 	tile->mem.vram = vram;
 
+	/*
+	 * If the kernel_vram is not already allocated,
+	 * it means that tile has common VRAM region for
+	 * kernel and user space.
+	 */
+	if (!tile->mem.kernel_vram)
+		tile->mem.kernel_vram = tile->mem.vram;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..5d834378b354 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
+{
+	return tile->mem.vram != tile->mem.kernel_vram;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..7adfccf68e4c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -283,8 +284,11 @@ static void vram_fini(void *arg)
 
 	xe->mem.vram->mapping = NULL;
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
+		if (tile->mem.kernel_vram)
+			tile->mem.kernel_vram->mapping = NULL;
+	}
 }
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
-- 
2.34.1

