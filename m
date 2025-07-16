Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF69C83F1B
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 19:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8EB10E3B9;
	Wed, 16 Jul 2025 19:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MhKpmSpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B45610E3B9
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Jul 2025 19:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752693713; x=1784229713;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pShVFyDzGIDumCEZwGWSgcrgN8SCpV5Tql26x22A4k8=;
 b=MhKpmSpxrox26L6fbr6CMY+UvrgVIKsC4Ne2KVHzutw3//m0wEe4OiaT
 xpXwDU4mdYkqfH+64Tjr5jtL33HZBKKP+PmO+tdEnEjT4pSQ5wuo6635d
 rTkstBvXoBRgc1xlwxdByk/xsUPvm6C4GbKdHT5zIQDvrOFehChI7sKWk
 tPYdli512c7+QzorKmAbF1Q4eXoL4OuyaljA/tBVEr0+1zdiawf5utqcL
 9/82HHwMK4Cia+7CA/4zR/NN1yc0uJ3mdXy8C81hvr7GS28UeeH/cp3xQ
 KrNKWDJAtvUrP5qYft8uhJlsRwjPzQdKF9MHuNuqJ8CK2zQTSzEgAB9jb A==;
X-CSE-ConnectionGUID: XMFQEB82RCG419/GjT4mNA==
X-CSE-MsgGUID: FUITDT4hRkG0O3dkNuCmig==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55073106"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="55073106"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:21:52 -0700
X-CSE-ConnectionGUID: 6LzTUlXUTmeJZApzjJLeXg==
X-CSE-MsgGUID: q4dFs2ghQkOzh4eLwcAB5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; d="scan'208";a="188541518"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 12:21:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 12:21:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 12:21:51 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 12:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQGxmOTl73c19HOBHHYdsXWS82khAEtxA5d5i4mnB4ve194SWP8dMunP4MyJtfYs4JXcXPb6LYpbUkEGL5m61Ku78LudaGc1NO1gonRsO7cOjCHyTNEOZvJFZ/n1VP6uNNBcRXUClH5qDBiuLkHUQWE1vg5rRzKZQJppoVpEAf5swN8jkxd1SWj339SnKvw00XH4fWRV2kQRDZOWOGLfCH5UblYL6bzS9GlERlwO09tgzy+mnY/TTlIVT5omYaXCVY+yvZ/OAvl0uZSvc4iqUr90O9C6Cyqe8gwPugN2hsE0QqMyjd3oWspSnypwuDFbqqUq/K8cCCfI4PE0Qb1RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnutVJRdXcg6ivCG6clFnJg8XCiP1thx29HkfyfrkiA=;
 b=yH/9Cy+qP9xiwncGGLoYqcHNohbpbBX3c65i9waJK6lILEZ+dqtxuO54PD3hlG8biEGNZRTobatHdmOEiw5JRTxrharz58MmadHdaB3r7p0HGHzbpzFkPMaJwn0UZoB824iPAIHYxlpk7o8MoQU+RoybOebNHWnnCdLH/e/UQogt9OkQJMuqMGzF+FyQcn6kmNxT+BaB/mbx5cz56gEvaaJDBqSJvb9ixYm8AGyS+5Xr/JRb/OPILAXweZBJO00AOvsG7EGIojBfvAjsN03vsEohTsFAEFJOAUJKtRN0PlTnY1qGOcsY+u1al1uNWUyUSnNuv+0w96KCPreY/MVVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 DS7PR11MB6175.namprd11.prod.outlook.com (2603:10b6:8:99::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.35; Wed, 16 Jul 2025 19:21:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%6]) with mapi id 15.20.8922.028; Wed, 16 Jul 2025
 19:21:08 +0000
Date: Wed, 16 Jul 2025 21:21:04 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v6 4/9] drm/xe: Block reset while recovering from VF
 migration
Message-ID: <fko4qk3wzxmvqu3bhlt4zk6zr5or3njbuxwr7srbh35trub2ga@4rn3mjtfncf2>
References: <20250704210228.825843-1-tomasz.lis@intel.com>
 <20250704210228.825843-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704210228.825843-5-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1P195CA0075.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::28) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|DS7PR11MB6175:EE_
X-MS-Office365-Filtering-Correlation-Id: c0b3a8a9-90aa-4f12-6f42-08ddc49deaba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTJWblo0Q2VNWlhzTCt3dld2YytPTmV2N2tEbyt0U1BuVHB0Y3UvOExCejdH?=
 =?utf-8?B?MG5ndGNyMU9ZTVFJVVpCTTRvM0FOM0FFN1ZkcnRtZDJ4dGpFTFltMjQ2UWkz?=
 =?utf-8?B?RE9GZG8vWDVYMDdhVnozY2pOMGZ1dDZFZWR6QkNLSjNtTGdzUHI0MEFuaDd3?=
 =?utf-8?B?a05XM2crVUFPeGNLMk5uWmFFQ3lnTDFUMXF0SFMrRkRTalU3dEsyWFBwUHNM?=
 =?utf-8?B?MU1mQnBxRWtiZUFveTZWTW1RbTQ4U012bWlCOHNya25yNVhQQXp3R000bjhP?=
 =?utf-8?B?T09OdnJqbURXbEZwcnNsMzU3c1dCU3EvM0ZyMzRKNlRXbURuZGFhTVpPVE0z?=
 =?utf-8?B?N3ZuQzZPelNzR2pJd3JHRDErS3o0SGNUUWUzektkVHA1VUZjZmw0NDgwT1o1?=
 =?utf-8?B?U0hudXFjenBmWktHYVhaRTBHSWc0TzZPRFJCRlRwQmtkd1lUckpSOWRFM1Jj?=
 =?utf-8?B?VHdndEV5YnhRQVg2dll2NDNPZHQxbzJHTlhNM2JxaEY0L01hV3pteURaMlFw?=
 =?utf-8?B?Y284RUxRZXBBS3RkZ1RBdHlkOUJmQ3JrSzcyaUFPcnc5cm1ldVQ1cVVzS0FJ?=
 =?utf-8?B?SmRnUzNsUHdXVENMQitTYVRwRFNLd215ZHVCcTlJSDdrdkhlcW41QUNKR0xK?=
 =?utf-8?B?enhMOHliYXp1Wi9tNHI2UlRvQzdGc0tXd0JmdzVXRVczVVJoWEU3WHB2TGdw?=
 =?utf-8?B?M2dqeTdhS0JSaC81eFJnWE1iQWphVzNBSU42SlFGM29aZmZIeGlGTEYzK3RZ?=
 =?utf-8?B?bzRuUGFYM2cra0RFNFUxa2lIR2RsYUE4WVRGTzhCN0hnZnJmcWJxRS95YzZU?=
 =?utf-8?B?cU03VTdnWHVxZjJJQ3lQS2xxRTVxZkY2c2xKdEVzTkI2eHk1T3ZMYzV5K3Iz?=
 =?utf-8?B?NEhSTC9CNmsxTjlnZCtyVFFFRVB2bm1XZkRjNk11WEtRYlQxUC8wTEhvMHRN?=
 =?utf-8?B?ZmxZRm5EYWQ3d09UQTZBMngwSlB2bkZOUG4yQzUrV1pHMUsvaDlKVXNsQVVX?=
 =?utf-8?B?Qm9nZk1qYVZjb3ZyaHNacmVTZFcwemRsMVJMakl1cFFmcGw1V1VOZklkRm94?=
 =?utf-8?B?RVhmYlBLY29JYVhRK3Z0My9VcHRoOVBTeVFFbk40blNjSHhBVU5TNEQyRjVa?=
 =?utf-8?B?RnNGNEtuSkZXekdvQ0VaKzBLdEwwNVpGbGtNS29meHV2QlJpWHBFeXpZSWpi?=
 =?utf-8?B?cDlHMjR2QkdIaW1UNGo2bGN6UU16NmNmbkl6YllWb0xiQ1FpN0dMWUtKVGFj?=
 =?utf-8?B?ZnpOTFZNYUVEMWFaQWI2dEVrY3hyRkNuczJHS1l4aE10TEw0a0lBV0VDazhv?=
 =?utf-8?B?MmRpdkQzRGhqZTJsdWZBZFg4OG9Kejh5amZ3MG52dW1oaWgzbG9uMFlZM29m?=
 =?utf-8?B?MjVGbFFuR3ZOOHF4VWt0M0xhN25ITFA3cVkrekhFV0hGanJ1eVZOMDMreUlu?=
 =?utf-8?B?TkpnVkpjZlNWdDFnb0E3V1R2bnRFbk13UFJMa3ZjWWFMSjQwYkdOeXF5bUJF?=
 =?utf-8?B?WWNzYkRXZ2xPbllTZ1lyL09KQzlWTk41K1A0d2JpdTdUZmhOSDRFQnI2RzNj?=
 =?utf-8?B?c2ZHVmZlaTUvdkNKSmdudk82UGdKajBKR1dsZHRCSFBXRlNsYTZBaEFsRmJy?=
 =?utf-8?B?bUY2QVdwa0dXTWhxN2U1cHRmeG8vUXp6cjNGWFFWK2hnM2Q2SzNPVHYwL2tF?=
 =?utf-8?B?dW44WXMvR0pyR0dORXcyWWZ4TjRjcWZtNWJRVUl0dTMzUnhza3lzN1dFbVU5?=
 =?utf-8?B?WnhDNFNzdC93R2phUURPT3Qva2hOa3RGSENpaUZjcm5wNUgxV2RiU1g4Ty9p?=
 =?utf-8?B?VlNJTW9oVU40a1J3bVB5NDQrcURreCtNZXhUS2lPbzBZNVNvYzVKU2RFR3h1?=
 =?utf-8?B?RlRXNC8yeGJGUGhkU2tmUng0cmtLbzBqcnFITEE0YXFCVXc1WkhHYkxHMVlv?=
 =?utf-8?Q?ChkCgFgJBvc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEc4dzRkZ0IwKzlIMVNWVFZWR3E0ZFBwUUg1NUJWMis3eFIrbTkwY2pvUEI5?=
 =?utf-8?B?bEoxU25DeGpqYkJHZjdhVTRYaGx0UEZWdWw3TDRHd0tXaFlISE9KcWhsWnEv?=
 =?utf-8?B?WlhuSkZ0OHNCNEZ6OXpzeW9NN0RydFVDNHdZUzBONC94dWtHNFRaSGtWK1lD?=
 =?utf-8?B?OFlZanVnTldCaDlYRGtwcUk2QndobUV6VDZIRlZyaUY2WmF4c3czL0RKTWQr?=
 =?utf-8?B?Z0daVVBZYm91M1RYNnY2WmZ0K0RzOUVEUlB1UXJjMzVWUDcxSEh4UzFkcHhV?=
 =?utf-8?B?dHRMZWlMYXZHd2RISWZhQmJYdHVhVWJQOUVFazQrQkdEVXQ3bHRnVSs4QWNi?=
 =?utf-8?B?Y2RMS3RuOGVNc1RtQXk5bzdDRTFDZlFEOWdzRW50Q0FwNzB0dmxZZFhjMXBj?=
 =?utf-8?B?RTE2bTdtN1dQRkdDNU9xMjlUYnYrM3lGdTRGaFVqV1ZsWVJHajR4UGc0d09K?=
 =?utf-8?B?UVlaL3BnSnVvREtsWTlHZzM1K1lKZGpGd0UycHYrSzZ6UGd1RDVFSlpDWU4w?=
 =?utf-8?B?QWpJWm8yMFpqdXdxcHlzU2Zkb2pSb0JXTHNrekwycFVNNnVIemRGN20rVHFX?=
 =?utf-8?B?djJ2eHk1bFJ3VlBwT3VxUHVUVnY1UXlkN1E2cytKWGNjaWhLRFV5ZFR2dGJP?=
 =?utf-8?B?M2E4V2FGRGJUOVVISkxTd2ZzMUJKRXlsdnROVGxLODFuOHlsNlFrMUlaUmhs?=
 =?utf-8?B?Ukh5SURBMmZsU3cvVXNPejRzR0RITlcrR1pRZ0F0eW1XYm82RHgvNjNRRzM4?=
 =?utf-8?B?MC9BSnlEdExWREdKK2NFTFBzNzRja2tGSFFzdTlUZWdYbS8xbVBKUjFxWEpZ?=
 =?utf-8?B?b1NBdkVJYWFrSDJncW8vd3VyZ21RRkYwMHE0L1ZRODhsZTRob09mME9rMEFx?=
 =?utf-8?B?Um1UenVOc2ZwQkVEM21SaWR0ZEJXOUExNVQ5aVlnN0owcjRxWDRFUEdtaWYx?=
 =?utf-8?B?YzczaXJmMCtKNGVZL3BDSk9ZbkgxaG9ueGdpVjBHZzYybHVvQkhkcGZtbWg2?=
 =?utf-8?B?Y3NSb3JKWXRqSUxDTFpSREVPdm9SUzFXVzBFTEJnWnBPbEJqbnlrUU5CREtN?=
 =?utf-8?B?NHNsWnVvWlZrcXlOTE4wVy9rUEMxQ1JBN2U2eW5NK0tnN2RwL24rUFBsdW1n?=
 =?utf-8?B?YmwyZkI2UjdyQXlOTTJzbHRJZkg2eEtEa3lFdzdTTHVhMS9ER1pFWkRHOGNK?=
 =?utf-8?B?Ymo1VjZWa2haWnVHNzVaMGQyYkJQV1ZUOXI5WW9aa3BvQkdYeVVXVGxCQWpH?=
 =?utf-8?B?Zi9vREZySlBMWUoyU0JzeU8vMEp3ZGZ4OHQ0S3ZXbTI0RVA2aHJZQWpzN25Y?=
 =?utf-8?B?dVBYVm9peWQzZFZualZ3KzlEZzJCSUVobGJyU00rQWZmbm5tYU5EUk9sWFB4?=
 =?utf-8?B?bm5vbVdUZHBDRzZYSDV5MFdCQk1pVWpQMWFvV3lKMVVabHRONGk0aHlsY2xO?=
 =?utf-8?B?N3gxSWlLcnhpMjhJaVVxcDBLMUhrYS9DYVJVdTNsTjdLdGI2T2V5eTAvM0Vv?=
 =?utf-8?B?NkVSckVBTWo4aGxhaW1FMFFrdUdVYXhDdWptdVZLSnMyQ0pmbkJ3MnhqSEgw?=
 =?utf-8?B?NGJwTHpQZ1ZmR3VLeEcvZDJlTm81bDZiOCtML3NaWDU3UVY0VnhEd0Q5T2JU?=
 =?utf-8?B?czlYRVVvSGFtazArZGRqYm9zend5MGVhcXpBNFN6b1plbWwzbzVjUmlCTFoz?=
 =?utf-8?B?clRRVStvenVNeWttMmEySE5CRXMzYTRDVUprSHVjNmZ0dDUyK1VmUWdKS0x1?=
 =?utf-8?B?Yk1DcmJxZExHVWI2TVBHd3RHNkg3RGVOYitVSThYdDlSRHJ3b0J4QWdXdWpH?=
 =?utf-8?B?UWJvV3RKWHBkZUowY3NDRXpqcjZ3OHB5NUdPdG9pY05SQlN6d2hLdVhIS0Fl?=
 =?utf-8?B?NUlVWTEvVXB1VHd2UFhITkpzTnFpdUtWNnhVRTd4QWtReWplU1BjU1VLV1Jo?=
 =?utf-8?B?TmJYWk1xaDBYazlkL0hnNDJUa0Y5Y3BVQmFocHhlamxFcFhRVjVDclNzbHRp?=
 =?utf-8?B?MHh5Si9pUDlhc1Q5L1JReWR4TmFkR0tyZHJ2M280RTI4a3JkVHBhcXFnaHd3?=
 =?utf-8?B?WGN4SnMvejJ0SjdFNkl2cmdMU05sLzZUc2doUjFyVk9WSEljeVQ3MXlXc2t1?=
 =?utf-8?B?WE16bDR0N0FBWUZ3bWt3dVZ5bk4xZDZKNXFrTHgxU2taYnBtVWtjTk9LdmZh?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0b3a8a9-90aa-4f12-6f42-08ddc49deaba
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 19:21:08.6761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRTgXo8veBs0vJ9A3LVnGlw6K4FKY09vKkKEpiKEujvXufnbP0E1JONV37LPIElWYEoxfddh8rUPfRw5xO85HOkPT0wcrMO3VfnfQZ8HCt8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6175
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

On Fri, Jul 04, 2025 at 11:02:23PM +0200, Tomasz Lis wrote:
> Resetting GuC during recovery could interfere with the recovery
> process. Such reset might be also triggered without justification,
> due to migration taking time, rather than due to the workload not
> progressing.
> 
> Doing GuC reset during the recovery would cause exit of RESFIX state,
> and therefore continuation of GuC work while fixups are still being
> applied. To avoid that, reset needs to be blocked during the recovery.
> 
> This patch blocks the reset during recovery. Reset request in that
> time range will be stalled, and unblocked only after GuC goes out
> of RESFIX state.
> 
> In case a reset procedure already started while the recovery is
> triggered, there isn't much we can do - we cannot wait for it to
> finish as it involves waiting for hardware, and we can't be sure
> at which exact point of the reset procedure the GPU got switched.
> Therefore, the rare cases where migration happens while reset is
> in progress, are still dangerous. Resets are not a part of the
> standard flow, and cause unfinished workloads - that will happen
> during the reset interrupted by migration as well, so it doesn't
> diverge that much from what normally happens during such resets.
> 
> v2: Introduce a new atomic for reset blocking, as we cannot reuse
>   `stopped` atomic (that could lead to losing a workload).
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michal Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c         | 10 +++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.c | 36 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h |  3 +++
>  drivers/gpu/drm/xe/xe_guc_types.h  |  6 +++++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++--
>  5 files changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d397df056e4c..f950f964d422 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -41,6 +41,7 @@
>  #include "xe_gt_topology.h"
>  #include "xe_guc_exec_queue_types.h"
>  #include "xe_guc_pc.h"
> +#include "xe_guc_submit.h"
>  #include "xe_hw_fence.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_irq.h"
> @@ -806,6 +807,11 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static int gt_wait_reset_unblock(struct xe_gt *gt)
> +{
> +	return xe_guc_wait_reset_unblock(&gt->uc.guc);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	unsigned int fw_ref;
> @@ -820,6 +826,10 @@ static int gt_reset(struct xe_gt *gt)
>  
>  	xe_gt_info(gt, "reset started\n");
>  
> +	err = gt_wait_reset_unblock(gt);
> +	if (!err)
> +		xe_gt_warn(gt, "reset block failed to get lifted");
> +
>  	xe_pm_runtime_get(gt_to_xe(gt));
>  
>  	if (xe_fault_inject_gt_reset()) {
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 87b1e114e2c6..566938a89c59 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1779,6 +1779,42 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  	}
>  }
>  
> +/**
> + * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +int xe_guc_submit_reset_block(struct xe_guc *guc)
> +{
> +	return atomic_fetch_or(1, &guc->submission_state.reset_blocked);
> +}
> +
> +/**
> + * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> +{
> +	atomic_and(0, &guc->submission_state.reset_blocked);
> +	/* we are going to wake workers, make sure they all see the value */
> +	smp_wmb();

So, that's basically an atomic_set(&reset_blocked, 0)?

And the barrier usage looks suspicious (where's the read-side barrier),
so perhaps... atomic_set_release (and drop the smp_wmb)?

> +	wake_up_all(&guc->ct.wq);
> +}
> +
> +static int guc_submit_reset_is_blocked(struct xe_guc *guc)
> +{
> +	return atomic_read(&guc->submission_state.reset_blocked);

And atomic_read_acquire, to pair with the atomic_set_release? (and
fetch_or is fully ordered, so it also should be fine)

> +}
> +
> +/**
> + * xe_guc_wait_reset_unblock - Wait until reset blocking flag is lifted, or timeout.
> + * @guc: the &xe_guc struct instance
> + */
> +int xe_guc_wait_reset_unblock(struct xe_guc *guc)
> +{
> +	return wait_event_timeout(guc->ct.wq,
> +				  !guc_submit_reset_is_blocked(guc), HZ * 5);

Define the timeout (or perhaps reuse some existing one).

With that - LGTM.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

Thanks,
-Michał

> +}
> +
>  int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  {
>  	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index f1cf271492ae..45b978b047c9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,6 +20,9 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
>  void xe_guc_submit_pause(struct xe_guc *guc);
>  void xe_guc_submit_unpause(struct xe_guc *guc);
> +int xe_guc_submit_reset_block(struct xe_guc *guc);
> +void xe_guc_submit_reset_unblock(struct xe_guc *guc);
> +int xe_guc_wait_reset_unblock(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 1fde7614fcc5..c7b9642b41ba 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -85,6 +85,12 @@ struct xe_guc {
>  		struct xarray exec_queue_lookup;
>  		/** @submission_state.stopped: submissions are stopped */
>  		atomic_t stopped;
> +		/**
> +		 * @submission_state.reset_blocked: reset attempts are blocked;
> +		 * blocking reset in order to delay it may be required if running
> +		 * an operation which is sensitive to resets.
> +		 */
> +		atomic_t reset_blocked;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
>  		/** @submission_state.enabled: submission is enabled */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index c66b17da1ce7..71d28b30de43 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -163,9 +163,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
> +	int ret = 0;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
>  		xe_guc_submit_pause(&gt->uc.guc);
> +		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> +	}
> +
> +	if (ret)
> +		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
>  }
>  
>  /**
> @@ -187,8 +193,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
>  	 */
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_guc_submit_reset_unblock(&gt->uc.guc);
>  		xe_guc_submit_unpause(&gt->uc.guc);
> +	}
>  }
>  
>  static bool gt_vf_post_migration_needed(struct xe_gt *gt)
> -- 
> 2.25.1
> 
