Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC7ECA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 07:39:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B389F49;
	Mon, 11 Aug 2025 07:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7/OeSPH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715DE10E281
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754897957; x=1786433957;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DyZ0brOfOJfWOV78fwd4ZBK90vjC03sb/BeZ1lx0z6k=;
 b=h7/OeSPHEuUFRqhduEEqyefzGsjhqidJHZNSkLk/UG8AbAManlm3/K0/
 oz4Uius1DwnLUAFfKvp3Vr4FNJQl774Ijf5lizjACEOgkfYcp9rGWP9bg
 vZ2c9razTWrU+6lk+lFH9e6gD92uOpuWkMEeM0/vHOJ3eqbdeqbkWzRfM
 MRJ7yuc2+ayHX6IOkLE6ee5vq9UFgaiG7PyDIznYDZtcp2xiPRCfKub+n
 UWVypQf2bqW9iLH9hTEjiiBT1ajF7BuaQ+MfGZxMcQupolzYCWcwEQEVm
 sQpRfhQou0OAGNGpudE4Lagsg6jVBNYxzNexwLxXwPqy4ehTG3fQqNGYV Q==;
X-CSE-ConnectionGUID: 0/IKmznyR2mQz9lowvkuFQ==
X-CSE-MsgGUID: 00yFjaHdQPSAS5bg+ZstlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56856956"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56856956"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:16 -0700
X-CSE-ConnectionGUID: 2fdP6oTZQGGyPlNFLnSfbw==
X-CSE-MsgGUID: PcF8snw9QKa+6bVYQ78s+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="171203713"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 00:39:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 00:39:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.88) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 00:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWXMtUP8yqWAj0UZWlSuTpxkzLdC97oBkRvzkqCwBWAMgkDMKCzZrbPzc7F3vr8NeLXhGtX+BHc+FfoDb9YaijfWDIuCq5F36uKrTwfJpp0C1wc+vDfGfGPUR9NcOD+wI7HI5LLiZvZ5NryuxpLumqK3Gvm0rIEkZOt1gHBE0eZcegumVz8MFvTEotIE86v3562sTGiVfiakenmjAF9KW49DzLhdOr1siyBIP959bv007W23vqf2TBkbyiMFdFj33k0DiVQBxz3YsFJbg9eXKRURcG1VeU3rrggaOrkbN9pkZekr5litEQej1Z2b3CdFIuIgzDQgp1bvbFgUQ4Wv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vTGR2CF5/r/fO/nTtzMNqvHgxZzyWbPImevXQseXDA=;
 b=uoAXbbbswEj0ZLqXz6I6mWqsIA8ENf1/6YSYH/gKh0lNltBpPGBwdzzAUNmcWfwD/g+sw9PzOMZZmaV9sCyiirHOCvlZ/YAbZ12ttpNpcHO4B2p7nfPbkG6NsAATtZeXZnNiaNYLeH49EY7HMvrTw/010hhjQKhaixU3+7oXXrn9y2MIToFUPKOdFvTc2Ny0+ZRbMLn9QCkPNrdZp/bStL1ppuNfpLI7bzZGIQKxIn3m2LVaqZRj9UdqYDEn0ikuFuABFqRoTXI9Wu7k1Xw8OOh5gZF0vfdecvEHRHMNWBMFi19TkJDd+oUMA62xjFXg3ASVwyGy57t9fSVJLGwRDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH3PPF383C22AA3.namprd11.prod.outlook.com (2603:10b6:518:1::d17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 07:39:10 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 07:39:10 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Assign ioctl xe file handler to vm in
 xe_vm_create
Date: Mon, 11 Aug 2025 09:38:55 +0200
Message-ID: <20250811073856.1950732-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
References: <20250811073856.1950732-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0299.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::34) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH3PPF383C22AA3:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff86dd2-40db-439b-b853-08ddd8aa294c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDB2MWtXaW55RkNNcFZzOWtiRUpDaFNXK3hQdEU2UUNhZ1Q3cy9zTUEzTHFx?=
 =?utf-8?B?QlVJMU5lUDBCTmFlSmxHZURxalAvbDYwOS8ydWVqdU1oTFZsS3Q3anBNR1lm?=
 =?utf-8?B?Q2pDL3hoL1hNeEQ1TlVaZU1yOVpoUFUySENnMHAzdkpGVDNPUXY2aWxZTDVu?=
 =?utf-8?B?WVIrd2MrUEplMVROamRsVEx4MHV1em5GUjhTQ1NCSWdaaUVvdmlndURQRzhU?=
 =?utf-8?B?SFJZNjk4SlNaWEEwWmFIQk9GTHlQM3lXVVhvWGtoMGtSSkt2MDYrL2gwalFM?=
 =?utf-8?B?eHJ2MEFRa3pEb1hmK0Rna0FHSkhEa0FycVhFOGFFL0FuWUZUdzlxWE1uczMr?=
 =?utf-8?B?SUFtMU5UR212MkhsR1VLUVByckJOSWt6cE90dUxPL1ZIcTcvTWNkbUppOGQ1?=
 =?utf-8?B?MmZaSGx0dW1tbC9laGRvbWFHT3lIeG1oaWxLUm5BRHJweEpYYXF3aktNejdB?=
 =?utf-8?B?Ylg5aDk1aUhEV1RuVG0ydEJ2N1RtWnZxS3cwTldkZTF1UXlDb3pjbzh0WklR?=
 =?utf-8?B?YjFaak15V0tWdFJFZlZUUVhtMElvazFaUmEzMFQ1ZEtMZjhzYjVKZEJFdlJB?=
 =?utf-8?B?bzJHaWdPcDVoWUhBYXJWazh3OTJnbFpjT2Qrdm9pMWVadVVTYkpXcmVjVnZK?=
 =?utf-8?B?NW9sY0IvbENBUisyenJLbGZlbVV2dDFDT0JEM2FjRUtoVVViazZVcG8wZTVY?=
 =?utf-8?B?V0NLYUVqV1hvdmZLL3U0N1k1VlozejhOYWRxNHY3anZJZW5sb2F4ZVBZZHhI?=
 =?utf-8?B?WFBwRi9rbC9LY2tpZ2NYUXdIQ1Fwb3RBSzhXUXdjRjh3ckp6VHlxOTJzakdR?=
 =?utf-8?B?NDgvS2dhVWtGTWcva1dHTHo0ay9XUVRiTmtnbG5uY1JUTnJaa090SDE3ODk3?=
 =?utf-8?B?Myt3TDFpTUxZSlptZE1ZM1NZTXRVWDNScUcxZm9LdS9GTFpnT3ltWkgya3FS?=
 =?utf-8?B?K0FGUE5qcTFJYlVNelliWUttTWZSTitDWjA4UUV6QzNnMW1MRlpESXFmTVJj?=
 =?utf-8?B?YnZUazRDcUJGZ0JLQTVncWtaNlJjOU8wTUx0Nmp3MkowbDZKbVdtVE4vYlZP?=
 =?utf-8?B?VFdIeTgrL013TmVNSXZ4MW9zVWhReExuQ1BHZkt3em1kQ2ZkeWpWWE1GelVS?=
 =?utf-8?B?K09XdlZLamgvVnp5WlhqRkdUeFUzNWhiN3VhMjVRM3IzdFFEektXL3pocXQv?=
 =?utf-8?B?dzljeWJiV1Y1MWtCV0R4TGd2M2thc0dUWU5zZFl4YmpmYmJ3bUxzd20wdldB?=
 =?utf-8?B?WCtpUHJpMTF5TlJ2NGczbk9LeXNNdStTNXRxdEtDQ3JDa0Zrb2s3VEhLcWNi?=
 =?utf-8?B?anM4TjlVV2JqNmFxMWZSM0JzYjZqcE4wVW1iSlc3YnNTbC9SNUFhWEIvNmlN?=
 =?utf-8?B?TzRJWEUvc0hydk4xWGtjM3J0S0dtNncwTlRmZ3J5UmxkMURtUkNIOWNPbVFT?=
 =?utf-8?B?bUNLa3hrSDVodGlGM3ZRZ3c2dDlJY1dtaHl4WUlkV1hQWEtVTFFpaEJFOTdG?=
 =?utf-8?B?RlVyajdlL3dENWg3RjMrR1JVUUk1SnpRSm9wbzJ3Q3QrU3AxbnpiTWlLVDVL?=
 =?utf-8?B?NUo5M1NZc1hkS1RwOHlwTVFuUHU4dVJxQUk2b3k2Wis1bStFc2lFNzV0QTBQ?=
 =?utf-8?B?WWJFVThVSXFrV3FSL1pmVi90YUMwZ3R4cUFOdjJnSVIvY0hZVFB5MzkwZEhr?=
 =?utf-8?B?WUUrWjhmczB4REFyd3NuaUxNTkhidVdTRTcwV3gvd01IUWRTY1VOV2lyRGF2?=
 =?utf-8?B?czdQQ2YrSGtacmxlcjZFWTB6cXRiT3dadTJpTmtqc1UyWEU5Tk4zQm1xc0Vy?=
 =?utf-8?B?M25hODFFRVg2YzdVOS9aTFFqZXhTM0d6Ym5Ga0g3STN4Z3B6UkJ5WVdKZXor?=
 =?utf-8?B?Vy9hRHFYN3N4bkYyNzc5WUt0QmtjcmFxRU9sZGRBVFMxZDJodmJHeGI1UFpN?=
 =?utf-8?Q?ssUJam04WBA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RodVdnTEJtR3U5N0FQUlFSUStjZkREcyt2TEs4VWtyRVFuemgvVCs5dDUv?=
 =?utf-8?B?bXFGS1BSakhXMnE0amRkSVVSRWN1RHNKVTBpY29mVUhBVytxdDRHbG5DQ0d0?=
 =?utf-8?B?YnVVNjh2WExHSzZYL2tvdEw2TGcyYUpNcGdYajJxTk5aOEVuM211cEpmRjE1?=
 =?utf-8?B?Y1JqaTlDQThvT2NyTEIxVkcwdzUvYXJzTk9WYzdwWVNjZVAyMU8vMVpJaDY2?=
 =?utf-8?B?am5JSjdlNzQwOVNHa0V1ZHYvd0llNnN2elNiRlFTdHlSR3FodG9MeWk5Vm1j?=
 =?utf-8?B?eEo3QWRGbzhFaUtNMk5HMGx5VEt1NlYwNkFEQUdpaVkwVmltczhGanhERDRp?=
 =?utf-8?B?VlN4UWhTQlpKazFIOWtremhhc3U3NWdBQnVwcDI5UmRXOHdTYW5NTk91RmY3?=
 =?utf-8?B?RlBhbTRkbStvdUw0cGVvY0h3bDd3R2hBMGJpNitsTG1zN3cveHAvd3lOTXY2?=
 =?utf-8?B?SzdoNGIwbE8zd1pEMC90K3FkZ3ZCZ2hhM1ZWYk5hTWdTS0FnVHNpQ1gvWDh0?=
 =?utf-8?B?UlltcXhYOE9yYlprd3ZVeFROcytCRTM2ek9sd1N1L2tZeHo4YURJdGo1eWJM?=
 =?utf-8?B?eUVTSUI4aUUyS3VQTW4zTXZGVVlLQjNobUQ4UEpNV3Q2QmUvTGc4WkFyQ0Yv?=
 =?utf-8?B?MjFHTHlQemVzbXZuSVRzSUFnKzlZV3VBYTlyNmlobXJrQ1F4c2dtS0V2Y0JQ?=
 =?utf-8?B?bUFDaVdhaklGM1cweEtzYjlZOGFpQ0R4ME1YMEp2UDNQZ3h2SVVoejg5WHdL?=
 =?utf-8?B?bnpwTmQ0djkwWTFmYmZHOTJzYUJkQXR2UStnTHRjdmVRMzlSbFNVbXI1T0pY?=
 =?utf-8?B?QUx3Q25FZ0dHL1JWT2JDMGYzb0tSQTF6MUROMGFvRW1oZnlRSk1SbU1IMWNa?=
 =?utf-8?B?VjlqMWpuMFNtcG04YVd0cTUzWEJMcEQ5eUhtNDIzS1JaSXh4cXoySGVOblJi?=
 =?utf-8?B?OFZncmVaSG1Kd2lhaHQ2SU9BQXZYYndoMENvVHZqZnFldnhaREpJbXlXcXRQ?=
 =?utf-8?B?NXNrR2d0NnE2eFo5SmFjQmJIOG52U3QwSzJyMzVjOEdmREJSZnBtd2Y5eUZB?=
 =?utf-8?B?cHNZRVM5d3dJRm1MVlo1RkY1YmtaSy8xWmk2NW1HUVJVRnJXVm0xVGRFdDRH?=
 =?utf-8?B?WEJJTU1EQk5CNUVjN1VUcFJQaG40a1UzMENHeWpUbEUzVlpaVlJ0U1oxVXd0?=
 =?utf-8?B?eHBGS2VQa0NKZkF2ZjlHSnRBY0JUZGJMeVdvQ0xhMHNtMjhzVTZreTh3ZHRM?=
 =?utf-8?B?enFxbW5JemhKRmtWcEQyWFpBakw5Q2hGYVBpWit2d24zaFhkbUI1QzlaOHdS?=
 =?utf-8?B?QXFJRXkvWHkxam4rdmJSQk54Nlp0R2lFWnZPRExDbEZxamM3QVVCMGRENDFy?=
 =?utf-8?B?MW9vYjlpNk5qSWVaUTBuMVMxakM0K2wrNHRnOS80ak52ZFp5ZnBqYW5iQkNs?=
 =?utf-8?B?WWhjeHBEMVVjZzg1Q1FrbVlSYkZLekg4dm9xTWwvODQzZzFJR2YyalVSb1hs?=
 =?utf-8?B?Ky9FYmtNSmdlbVpsTzViczhiNEhydkdsTlBaaDRnNHVIM1BJVTJ2WWZjcS9W?=
 =?utf-8?B?YnJuek14eGcrZ3FmNVNETUdPNWc3Qkd2YlVKL0VnMytuREQ1bEFEWlNIblQ4?=
 =?utf-8?B?clZVcnh5ODUvSThJVGpreitFd0hudXBhRVF3ZEVVditsdjBTSHlZVXM3d2dx?=
 =?utf-8?B?ZmlhYWlncjNnbytpNGJVNUR1djBaeEI5NDlMRks3c0JzdDd4Zm5Nb1NhN1ZZ?=
 =?utf-8?B?N0dlOGxCNXpTa1ZMQTVSWnkxcElxMWIyd3hoQnlrMS9kcGFZcnlvdFRwTzhs?=
 =?utf-8?B?WVFYTUVQQlNGWjFEWjA5d3VCRnM2K0s0aHJ4RjRtaENVUzV4dzVzdkdSR0lL?=
 =?utf-8?B?a25CU1EvMGd6SXNwdjF2d1VOaDVzRng2TStlN1l1d1hlYm4zaVplTFAvdU5M?=
 =?utf-8?B?REFGaFZ5NTlkZ2t0Sko1TEpMMWx5cnpOS2lPSjM5T0tTemo1V3p1TWlCRFNW?=
 =?utf-8?B?MjJCeDFYVDUwVE9BQy9kZXdhUEUyV1FtNk03WUpvNFdMN1krc3ByQW1wNDNx?=
 =?utf-8?B?elNUWmhUWlMvR2pNQ2Z0R2NqWWVFeHFSd1hvOXA1M213cHRwSmprWlkyL1Br?=
 =?utf-8?B?ZHJnZlFCR3Bpd1Y5Z2RRMk45NFdvMFdWZ0FEU05YTlI4NGltTFduWmgzb3c0?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff86dd2-40db-439b-b853-08ddd8aa294c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:39:10.6494 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4BP8zf7yCdnHfPgCLIBqoIhunU4WkVkdevSfCqWCDbPekx2/UQxE9G4h+oAjAA/3WFQDWpHUx8e+HT2g4YGD80YHlPIhtSDcJP9rfsRH/3w=
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

In several code paths, such as xe_pt_create(), the vm->xef field is used
to determine whether a VM originates from userspace or the kernel.

Previously, this handler was only assigned in xe_vm_create_ioctl(),
after the VM was created by xe_vm_create(). However, xe_vm_create()
triggers page table creation, and that function assumes vm->xef should
be already set. This could lead to incorrect origin detection.

To fix this problem and ensure consistency in the initialization of
the VM object, let's move the assignment of this handler to
xe_vm_create.

v2:
 - take reference to the xe file object only when xef is not NULL
 - release the reference to the xe file object on the error path (Matthew)

Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++-----
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ac9f4d4988d2..915fccea7aeb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -411,7 +411,7 @@ int xe_migrate_init(struct xe_migrate *m)
 
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
-			  XE_VM_FLAG_SET_TILE_ID(tile));
+			  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index d92ec0f515b0..ca95f2a4d4ef 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -101,7 +101,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 	xe_assert(xe, hwe);
 
 	/* PXP instructions must be issued from PPGTT */
-	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
+	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 148a2425006f..157e11bd2121 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1640,7 +1640,7 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
@@ -1661,9 +1661,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->xe = xe;
 
 	vm->size = 1ull << xe->info.va_bits;
-
 	vm->flags = flags;
 
+	if (xef)
+		vm->xef = xe_file_get(xef);
 	/**
 	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
 	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
@@ -1814,6 +1815,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
+	if (vm->xef)
+		xe_file_put(vm->xef);
 	kfree(vm);
 	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
@@ -2097,7 +2100,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
-	vm = xe_vm_create(xe, flags);
+	vm = xe_vm_create(xe, flags, xef);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -2113,8 +2116,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		vm->usm.asid = asid;
 	}
 
-	vm->xef = xe_file_get(xef);
-
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
 		if (vm->pt_root[id])
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..2f213737c7e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -26,7 +26,7 @@ struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
-- 
2.34.1

