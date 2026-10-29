Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29C606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 04:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ixgb95uc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD0D10FF6A;
	Thu, 29 Oct 2026 04:35:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB30710FF6A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 04:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793248536; x=1824784536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1gzCdSCdpZUH/dN8GCUB8+YA7zoY5YTTb9pdUGyzMwM=;
 b=Ixgb95ucV6QM6n4+NfFYJF1EBydItLcL4uZWA7ggVjvwXTjUBdvWboVs
 bERhRnB1It0Wctux4aQHcV4dFJPKdWg/N112f4xfV9miItB+xY3VdaYjb
 xd6Pt+0ql9GFuRGJxz1SUy3tmu31qto+Z3Ml+GfYijHMJ4jFbSiCCib9H
 rU+fG2PXnIC/GwluwLxnb7ZPbXr5vn108G/Jx97o9BXKUUGrLhfrn6YZ0
 RqX93Fuf/8N8aT4YYWlkjzeMmDw/VJ1bmI7rrvve1dJWA11W27/A7ZN/R
 S5J7mf7axBAa+LmTGPMiE96lEwUACsAxO/YYRc0k3KqFGIS2GOiImoOQS A==;
X-CSE-ConnectionGUID: MCEpi0cNQgCgRI0GrP6zZg==
X-CSE-MsgGUID: m3CyPjCtT520KmTING4iMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1999412"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1999412"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 21:35:35 -0700
X-CSE-ConnectionGUID: GYIrUkFuQzqysBp4uoqGog==
X-CSE-MsgGUID: rkKOZcccSJeBwLv26YpQRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4903122"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 21:35:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 21:35:35 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 21:35:35 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 21:35:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cFZSeFr0Hb2tT12ynL1TicjK8JbnxdD2e5UTAItT42jGMX/8MLMesntnrhRCVfVne9W8B2A1z/LKmyaIABL56yMb5j6WSUwmda1R7IoLzYOVuwzApdOjCkLQOxqzRTiPoQnIkKgvBWZl7fda/VMsQ5v6JJlkQpnpG71ul770EnMFSSS9TARF1oymnmn9vNLIcZNordb1reMr0LMf3t0rhQQ8bGMTZRQJKpNSGTFlwcpwvOpr0RP8SyWBu1hApeOkjy0Uqbv3gdPlg+uP+KTv2eiIpS/tKIs7+Ws6ig63XaXSWZiWkMAuUVhoM1VzMSE/7QiTdp2FyiQTuaWuR3i7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l03EDNwZ62NJVeBmAlkx8VPbIXMbHjWXxzJfeFWD0Jk=;
 b=xKIFr4dY8P1N0uGcq+yK/vXf5M0gC6pdrEGo+qiWVw36BJrtJ3mJX8oQoflEEmMGGOpQuCgVx98XKwqRLVpnM5VXjo6nhpaTic2II01HLD096bQuWgY6Co6vN5OG18rj1BrsZQLXmPMMYmhMABqLDwtgVSONusa9JmAOivkb7EF0Ajgbk0DIHzBFJKYq1+NX0YJh3rmI4dNbLFokvi39IeBImgEOdd5DcMY1OIZj46PI9dFHq5CKAAbMCuj410S0Ro+Coh2W6LUu7RmGksVgwTsStTTHlZvnMtm0Jy62LMMDGkGJiD4Iw4Mb7qbOoLg96UFdrHMQscwTVtWopIrbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by LV2PR11MB9598.namprd11.prod.outlook.com (2603:10b6:408:379::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 04:35:32 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 04:35:32 +0000
Message-ID: <2db2b6d4-5bec-4de9-a38e-6f9ab742dacb@intel.com>
Date: Thu, 29 Oct 2026 10:05:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] drm/xe/hwmon: expose fanN_max
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-3-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261015190751.1268916-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|LV2PR11MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e94722-7a95-42e0-0b01-08df3576111e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|261028144727099003|4143699003|5023799004|56012099006|11063799006|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|10067099003|261026121527099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8TsqKhe6u6BRBY8FRqQo02whPPh3LaxKOWUFlnj8nKCuZe5Yd8vMcQhuKJXJG+rsMU8qX/sAsa2LHUl845A9a4i4hRKEKOdA6UEKVauzghf5Waa6MKZFDW+jYvbAbt71f3Jp3kwsXX5qAwrI4NDR3ciQsg8QbpsQl3cmn91o7Tha1DBevK5sdh83nLfTIvtVNse/TLHmcLQ776pYqB78rkDSr5oblIYo3HLpg3DqzPXF6d0k6fXfX1d+NcUj0+Tzlyj6fi3+XIsb9I4y2gzGuNx2vOlF1V25mcu2o3OOdYoQ9ML8qZAG2i36vVDyLNTgOUPZ7M0p45wP5E5auY5k8ooTrvQ/f+rIxQACUDICQlstxlZ1/jkopXraboeEoHcamBTYvKTqZfO9cBtaIdkgpJeWaLCnzw76oVQmv5yn+Pk1B39MgwGPuwVnqOx1SKJRWMdz68EOhyHSqT+04/TjFyQCL3ktWX3UFQXexyt/auUm1cltQRYHpoc9Th2VG60YK61VLiDNShjn+sdTtU3V1bPCmlPqgFzT7G8V+D057o66CYbey9N9CnJWHLYSc7LD/pX2c2jvyAjnhhnXSptUg8/ewi0QJthDifD67Flzfp9kmCY4e2SmgdXZhMelBzicAQM37ErVnsp4bY5EBzx190pnOnkqEc0aHzg0zskhWIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(261028144727099003)(4143699003)(5023799004)(56012099006)(11063799006)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(10067099003)(261026121527099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2hPNThwQW0vY1I0Q01xYytyZmlzQTdNM2hYNXBSRGZCMFpqdjUyVk5tQjZG?=
 =?utf-8?B?YmUyNjh3Z0QyV2REOEtXNlB4WTRwTmhVdk1ad2xXTlZ6eWNPRE9uQ3RSSndm?=
 =?utf-8?B?MEVWTjhjQ2Q4eDVodnRWK09BMFl2dGVBMUJhSWpzTXo3NkNpcGh1UGZ0Z3Q5?=
 =?utf-8?B?ZkJseVVOcmJqRU1MN3RWNWdaYjlXbWNyb2JtallJRmRITzNJckQwL2Rabm5r?=
 =?utf-8?B?U2FqdlhhWG8wVUMyRjZiK1AzSnhQT0d2OWdCNjZtM0JqWTVYVWNDSHRqR2xI?=
 =?utf-8?B?dFZQN1F5ekRiZXMzN1hZL1o1amxXUkpwSWxTRXJkR2VPWWZYNTRLMUg2b1lL?=
 =?utf-8?B?KzdyS1FYWEg1NFRmSC9CemxJOVhpN0c5S3ErR0VnRHJ0ekV2MjVEcm9QZWJB?=
 =?utf-8?B?WllYMHZWSmE0UXZlSndxV2tEcDVaZ29sK3VNV0U0VEN2L1Fnak1lRkZnc0Jl?=
 =?utf-8?B?SE1MVFRRaHJ0Z3RINjVlSk1RWHlqdCtXSHoyL0VweFNPOS8wTE9jMHVmQkxR?=
 =?utf-8?B?YkJ3T3NTSUl3SDFLR1FNWnpYcmFiQnk2OEpGQVZNVWFTNno2cTl3Y3k0T3l3?=
 =?utf-8?B?Nkl4Q0MreHBmQUNWaWxUcFVxNURyakFKTy9iRzNOcGVYQklpR1hGSmNLK3lq?=
 =?utf-8?B?SEg0enBmVmNHeEJSdCtoYzYxWktKN3ZuaDRlZkxpaDlWS2d3UlI5aTNEcmhu?=
 =?utf-8?B?amtjTU5NWEVxMXdXRUdKYmwycktXVlRIYU1NdzRraVI5cmVndHNYbVk2TE5U?=
 =?utf-8?B?S0diVVFzNjVHRWMyaUZHN3N6L2hYZ2xtbFFmM2tRcUo2V1VNd3dEdVlCN2Jv?=
 =?utf-8?B?aXZjTGtTRnJ6aXkwNmRMdFE0SFVhc3VuYVhDTERXM1lCSHlPNVJFVVZDQnUv?=
 =?utf-8?B?dDZvSTZZSmozZTJoK0ViYUZFSGtYWHZSc3NlbnJWSGY5ZmpOMXhVV0dRaytQ?=
 =?utf-8?B?UFB4cExJMjJuYzQ5WDRXdnlwWHpsQW5KZUNlOXBYRjlHZU1RaXRyazJxbnhK?=
 =?utf-8?B?ajA0bG1CRkxGSHhIdW1KdTBWcEVRNmhpQWhzbmorWEFZc1NBZUlZSStObFBL?=
 =?utf-8?B?ZE5BMzVwRlJpV2NwU0hFZ1kzUUUvL0YzODFyKzJNRHBtTDJGbFNmQTQzS2Uy?=
 =?utf-8?B?dUV3b0dRUnlvYlJhVU1uMEpLKzl4Ym9kSWlkRUhjQmlzYmtJa3l6cjhXMWRN?=
 =?utf-8?B?aVZFczVKbWFDS3ZLWXcwYmtpblgvUW9lTVZId2Q1bDZkQmVrQkdjajVYUFlt?=
 =?utf-8?B?NU9mMTJGVG5DMUJ0UE5aRVgzNVdKc0ZBaGNERDZkeWgvR3R0QVZmRzhCeUZj?=
 =?utf-8?B?ekZrOEQvVWJEY2NYQ25JQ2w0RFpXMUJVUlVXQ3V0VG9zU0MzN2dYcjk4K0lK?=
 =?utf-8?B?Mlh2TktZc3N3dy95T1lsZkhwdnNCdHI0cXlJOURySTNKVXJBR3Q5eDNvWmow?=
 =?utf-8?B?NHZ1NEFmeDdNT1kzaVBGWXJjMmRFNTV2bEJlTTZMU0NwZGNIcGE4YmxYSkJN?=
 =?utf-8?B?b1ZHRURRS1NTU0RFck1MMFJtalkxR29LcjVrRXFqdEJha3c3anNGMVI5QTFK?=
 =?utf-8?B?cXBsS0NqcmZjOGdDTjZjNEs5YmtIMENLVVRFTUZ3SmVOcDlCNkwzbXczTUlS?=
 =?utf-8?B?VjlxTUFsK0JyQmRjUUhLRW9OUVR2cjhUdHNIUG9xQnFpamNtSXhRbEEybjJr?=
 =?utf-8?B?Rnd2bHZuckcvc0gyMkVrQnJzWHdZNDJFcE9pS21NcnVSYzhnbUVHU2I3VUs3?=
 =?utf-8?B?SloyZ04xT1B2T2JObkkrMlp5eWpBR3phMC84NlFTbVBkNDFyZXRjdEt1SEJ6?=
 =?utf-8?B?a0UvZlMvbFcvZHp5L0xoWmJrcERLbkxXRnVoNHhmTFFoY2tyUUNZMXBMWFlx?=
 =?utf-8?B?eGJvb1Rlay9nOEVHZGVMSnhzZjhwejNtbU9BYy9QV1VJbU8yZDY5MitwR1VW?=
 =?utf-8?B?RWN2RWlqTDRsajhWd3lKc1hYNDZYU3J1bHFBcVRVTzlWclJQQTBuUkRCVlZh?=
 =?utf-8?B?a05UNVdLQXN6VkNEUWR2anBRRjdGa05GZ2dRTG9aNnlwYnNaL3pKWUhNS1Nh?=
 =?utf-8?B?dmphNnpPeGsvVHRxQktZTWVQTGZFRk9paFQzU0Z3WUNoWEdjeXRwVFhQQ1Vh?=
 =?utf-8?B?RVFqQ09KVytYRlg5TDZoMHFYY051RmZVUHNHMlVpTUthdDNhT2F5aSt6Zk1j?=
 =?utf-8?B?bTRzR3Via04vWGd5cGFHZDc5c1RqRWtHMU5iVmlRZEQ1c1ordWdycEF3clNS?=
 =?utf-8?B?cHRYbnZtMFdkTUY5SEl0V0VMQW1XZ1p5VWJrc0lkYWYyWGlEcitlU0xWU2h5?=
 =?utf-8?B?M2Z6dUxiSnllUkpYbFNRR0JxazlLcnpRdjNvL0dzR3djQ0lnU2VTcFczT3Jt?=
 =?utf-8?Q?VIflsLAw7MZ+nihA=3D?=
X-Exchange-RoutingPolicyChecked: SI5R63JQs1O8GY696eIBkBUI9qvK/i9IzVG7dxTbuHSWjh2UB2xa7ZPOUmdwd64m+WN20qGKobHQ+ofaTpXL0ZIUooza25zuBN59WcpgzrMfJcypVwfAmpzwTkleYHCTNkF/Fy1euaXBbYdMibkrhl58b4LifUyPDRJ1wNzHfq9QK+3ihfc6GigrpL09rWJTcJlDB2mw9v/GWp6VcNuTllv+rqsW/2S1MSL7dHhVRG0EYjgLpO82Skdpj+1EJjY2SN8eilPXAzP/FmIsH/j8PwlamTUAlAz2FQXawALzEeyyNcNKxXGybNdGxpRO2d0aVpDPJu+Lk0GSBLgu+pJndA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e94722-7a95-42e0-0b01-08df3576111e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:35:32.0476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQHFuDCMPRHP8QEPiZDqAy8y7HFLXyBVYJWzpZ4zGlmiM+9zQTsTZexZKPeaArdVGzrUviqN/cw9cpDYlXVwnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB9598
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

On 16-10-2026 00:37, Karthik Poosa wrote:
> Expose fan maximum RPM via fanN_max.
>
> The value is derived from the firmware-reported maximum fan RPS and
> converted to RPM in the fan hwmon read path.
>
> Update Xe hwmon ABI documentation for fanN_max.
>
> v2: Use xe helper for dmesg logs.
>
> v3:
>   - Fix indentation of the max_rps struct member.
>   - Enable fanN_max only when fanN is supported.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: LLM
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  8 ++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 19 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h             |  1 +
>   3 files changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 0da739d9a816..5ee68aefa485 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
> +Date:           October 2026
> +KernelVersion:  7.3
> +Contact:        intel-xe@lists.freedesktop.org
> +Description:    RO. Maximum fan speed in RPM for each fan channel.
> +
> +                Only supported for particular Intel Xe graphics platforms.
> +
Use tab indentation.
>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
>   Date:		May 2025
>   KernelVersion:	6.15
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f2bd20f8b0a2..32016c5d4770 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -181,6 +181,8 @@ struct xe_hwmon_fan_info {
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
>   	} fan_table[FAN_TABLE_MAX];
> +	/** @max_rps: maximum fan RPS */
> +	u32 max_rps;
>   	/** @min_pwm: minimum fan PWM */
>   	u32 min_pwm;
>   };
> @@ -909,7 +911,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> -	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
> +			   HWMON_F_INPUT | HWMON_F_MAX),
>   	NULL
>   };
>   
> @@ -1219,6 +1222,14 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   			xe_warn(hwmon->xe, "fan %d min pwm unavailable, ret=%d\n", fan, ret);
>   		else
>   			xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +
> +		/* Read max fan RPS*/
Add a space before */
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
> +						      &fi->max_rps);
> +		if (ret)
Should fi->max_rps be set to 0 on read failure so the attribute is 
correctly hidden on re-read ?
> +			xe_warn(hwmon->xe, "failed to read fan %d max RPS, ret=%d\n", fan, ret);
> +		else
> +			xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
>   	}
>   	return 0;
>   }
> @@ -1756,6 +1767,8 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	switch (attr) {
>   	case hwmon_fan_input:
>   		return IS_FAN_ENABLED(channel) ? 0444 : 0;
> +	case hwmon_fan_max:
> +		return IS_FAN_ENABLED(channel) && hwmon->fi[channel].max_rps ? 0444 : 0;
>   	default:
>   		return 0;
>   	}
> @@ -1806,6 +1819,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	switch (attr) {
>   	case hwmon_fan_input:
>   		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	case hwmon_fan_max:
> +		/* Convert RPS to RPM */
> +		*val = (long)hwmon->fi[channel].max_rps * 60;
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 0349b24a8259..32bac74c4281 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -82,6 +82,7 @@
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
>   #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_MAX_FAN_RPS        0x3

Nit: alignment.

Regards,
Soham
>   #define     FSC_READ_NUM_FANS			0x4
>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>   #define     FSC_READ_FAN_TABLE			0x7
