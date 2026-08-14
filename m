Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3761C5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9706710E140;
	Fri, 14 Aug 2026 13:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JQOwyJBi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFFF10E140
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786715653; x=1818251653;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=icDSTrCgHsuC/WKROwbeGUNxNGvWe7w1G36DsFL44Lk=;
 b=JQOwyJBiLXO5syJDfe5xRRgCmPbg1PcNF5FfGEvkj5yRlmwa/qPHrTj9
 XrYDDrwDfIxwYO/zFlf3tJ2hz1EYjo+9yGQnr2u7riYktKeZ8IJmXXJ1f
 vSJX/DR6GzEUDuVyYeFs2pLzkLMWOR6WCQLe0Ltd9TVY+OiiAloKKOwEZ
 sKGxD3m2ESCFqD875sX2J7oUYeUd27ceTeQhgAKD9+sgitzmG0gn1+Vcw
 0NYo4A6DrMIFc3WcAqZkK8NnTRIS9GO6jNbWQlc56PCObs6XR3YbDw9c9
 XnlkiysPfIj5sD574DRAaw/Aqm6T1FC2zK4ymD8OQ4I2xkPEmj695Eops w==;
X-CSE-ConnectionGUID: /ZhI9YxcQsiaPXmNCr4vZg==
X-CSE-MsgGUID: nfL/2WzZQcy8y6z+J4uqjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="90968494"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="90968494"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:54:12 -0700
X-CSE-ConnectionGUID: TPPHxbTrQvmSVhf09SOHGA==
X-CSE-MsgGUID: 31GGiFVVQJ2Hv7daWV0uNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="289031190"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:54:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:54:11 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:54:11 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:54:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EwSYmqtQN9u2wKF0OScnbY5j34Stf9/r5Z6yYMk3i4HQgUotmQWXXmeIOkv9+x2WcfANiXNwW1sgKcMlCraLMRKIu20qEyWkYXuQso/T7ZQU0pQ8SVLrfSnhN/ckmTVJ6PGp0hFn0QYWvwgJ3XgRDURyseMqAGyen9zmtBpqlHmGu4jq/yk78W/dIcLqFAetOUtcjt9ILGbbeIOPZ0+kRIKZ4c8Vi48dFEF97LL+CwjtEa1r4Hn1stX4heTo1W7ySaMYbi4xa4A00kOq56HLJXjqHRpsJ9nAsZytNyDXLczqxwNJ1JRxUVSanMhiUX1Hl5ToCo3XU5j2RwVBBW0RTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4LgsBBZ/alJxCTkrqlOhBndKnSoysUm9zIcrG8j8OM=;
 b=IOGY9Mo9qN7AjH+6a3j4Ubyyaqs8wK+wYWOq1ReQUeznE+PQRehpe6uHNjjQ4/9Dpr5iV7yuN7VYYKnyeaw/RbDqW8n9PdjBkbiibRTmm+nspmKUpcm9kRZe75/pENJm5L6WN+iHDL8A+vpxOAtKHAhLXhK2pA2GnCUxmuOWC2RSseq84/IYLv0oAAM6PdqL2Y6IhF6g87c7PxxZlMCTLLzlYAioALLijN6mjGY/3QpOAcU976RPSEXbXwSjZJ1m7o/aHGdJD4S6+ZjxZdngf6UCHK8Az7+nJb/ErIE0ttW0+sziIqZBax1XX3D6hgfxBCrIaeapGRfHupXkWhMcmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 13:54:08 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:54:08 +0000
Message-ID: <10735db4-f0f2-436b-b6d1-6d3890468d45@intel.com>
Date: Fri, 14 Aug 2026 15:54:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/32] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Nilawar, Badal" <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>, Raag Jadav
 <raag.jadav@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-3-michal.wajdeczko@intel.com>
 <f617645d-69c6-4fa0-8176-1837b982ab7a@intel.com> <an4UMRmPXPbTnBGh@intel.com>
 <d5c8e2bd-7c84-41c8-a0b2-e99cb799f2e8@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <d5c8e2bd-7c84-41c8-a0b2-e99cb799f2e8@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 4652885c-6edc-4bda-436a-08defa0b8302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|56012099006|3023799007|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: +jCJsSy+DNLJKZwzRTG3sxlZOmIo2aXNEKZSfiKzpURf5nock8Icdyaqm4ZsHidL9sg2nePygMPrPdySi/mtLj9p+3wpY6gXQtMP05cq0yUCFkZDpekN3eN6yD5ZotqRpfdX+HTpqs5VwzKpv2zn/hbUiHt82iyJUrhZc8X+kMzJ6r21z1uQ3R1ThycWIcI14PGzArHtBXuBqUVS+xdtXsaXXvD1A0zvovcLRVut53h+BIYN1sDsSZUlExGP87IBt/TVkgUgB8vCDGvwxbrZYOjAYa2szCoKiwqmTBR+kLsBBdQAv4ikjcKGSEjI1G28QE2TSQCjFHZcfogTUHKeyKs1av6Objnm9ZKBebId4uSw4fm67gGXLGJqT8EwvA+/kSr6KCvkoDqKLZx+zINQrn7dok6i15SyW3WsEQLQgUXCEBJ51U6SuZhcttr/X12jgmxF3HSjv5RO1MAKvk+NKjQnTXfhq0WeSLBQ3gfKIQ6U5r19qs+sCqSsfslLm7SUWztuIoyMOl+HB3D4egenhm3tZpknGSRcT9wafD1XJgw0KSSlzsCRlEUvRSCaHUQvvClGF0nuHDN4aybKXxNTheQl1uZqisAqmTii+garZu04CG9Rqt5i40RnxUC1SvOI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FPbmdzM29oRW5hZzBid0JNRGdCb3BLMC9WTG5ZYjhGVjA5VXhDOCtNcnlj?=
 =?utf-8?B?RnpTOUJzRE5KZlJMS3R2YzFMV2RreWlrcnpXRnRoMEhCNG5aK0RKakFHZElB?=
 =?utf-8?B?YVFpTm51S2pmWEFNdHBJa2cybTJoZXpRblp5Vy9ITVZUTWhDRVczM0toUVA5?=
 =?utf-8?B?enhGdC9xN25hODRValZIMmwzcERhVzNJdmZIbkhNMTdJV2UyY1c2OGFqSjI5?=
 =?utf-8?B?cXlyUTRQdlhBcSs2dVR3SEU0VWE1N3cwbk5mTlh4NmJsNVdOSXpqcXNoUmJG?=
 =?utf-8?B?aVhNdk1xcVEybUdjS3FkUTZHdGpIUTJSSmJmVXJkS3Y1NmQrSlYzd2trRVNW?=
 =?utf-8?B?OVV0b09pZjQvTEowd2U1WlF4eFppTlFrS2pHWHh5OFVHUys4SkpCdkN4WGdS?=
 =?utf-8?B?L1Z2NithKysySkd4d1RvUEN5QzNuWVkrRXpad1RJQTk4VDVsbWt3ZjkwMWh4?=
 =?utf-8?B?dDVKd213OVlvYTI0S3lEeHZ3NlFwOG9mM2pCbHhOWnBxdld3c1FSeFV6V3VI?=
 =?utf-8?B?MlhFUEx3dUp6WWttSUpBRmV5M3krdGZFK2NWNE1FVlF5aVhYTmtxMEpPd29x?=
 =?utf-8?B?WTdwQm5yUEM0eFhOU09EWFo1dUUzQ0VaRUtGRkJwQzNCMGN2Z2RYczlFK0tX?=
 =?utf-8?B?bk1pMGpQbTBaOWMyS3VMcDFsZ1dyaE1NNnlOcjc2TXgzN3ZOcFU3UGFFOUNE?=
 =?utf-8?B?WlozMTZiWS9yK0t2dnFnT29DOGRieUNzOGF4cFI3bVFFZTk1ejZNemlJTSti?=
 =?utf-8?B?cVFDM0lwdGtZcG8weGc3Z3BPcTNFbENMRGpyaGxJY2pIMXJFZFJQOE1MdHFJ?=
 =?utf-8?B?U3VObWxCM3dXeWJnZkpRR3drT25ydjd3YnlXS1g5dmEwTjNPdHJsTVhNckhE?=
 =?utf-8?B?R3JMY3pvdStUNmJKSGZMUEpQTSs1ZHF5RkNhSmY0c3ZnVW04b2M2MG04NXdH?=
 =?utf-8?B?UGs1WDBVa2h1WVUzVk9Kb1d0MnhKTTdubnd3aHh4d1pWaDV1VU15eGZpSlBv?=
 =?utf-8?B?SHNBYUMxSFBPaE5tYWtiSUlCOHVncVVneUE2R3RlNXJwOW1qeU1OYlZubjNP?=
 =?utf-8?B?UVZWSVpZRWR6TDVSWHFYcFNsZjlxSDVQaTlOaGx6OUlSOXk1eFhHNTZYM2hI?=
 =?utf-8?B?TFNVSmVmY01PVnY1YkdDVEZsMW4rMUhWTVJXMjR1cW9vbkx6N1ZtYStLaEVa?=
 =?utf-8?B?RjlIK2NZejA0TVNkSzZMT1BxUW9BWHRkY1NHQlZUL2EwSlZOWmhkMmVBUDRh?=
 =?utf-8?B?d3NGT2lFNEt1cU8yMXhrbHZneXVUQ1E0alJqZWRKeUp1VWtKVWpRR3lMZUxR?=
 =?utf-8?B?dTByT0Y0NG1qbklhRDhDUmgzL0VIRGQrb3czd3JkN1FCalRtL1g0Zk41eHBv?=
 =?utf-8?B?b2hPb0JnQUl1OUwxOTRqRndkREEydERXRkZZQWZsSG5SUi9uM0pHai94ejdh?=
 =?utf-8?B?dkZvajJFWWRPZ0o3c2xWVjVXR3piakM4RU54bGU3ajZuUkRvREFqRy9SQ1JX?=
 =?utf-8?B?V00yc2xUcHdTSDFlYko3YXBTRGhJbXlxbi9NcmtOb1oxTjNqU1hmK2RZMzcv?=
 =?utf-8?B?d1VmTjJyOVNwZWJMVWJ0MExtbkdCeTdTYTZja0pPK2JaY1A4OHJPVnhBbEw5?=
 =?utf-8?B?a3hBajYxcFB0UzIyc1pKblNTaUVTUW1kSmtsd0QzWnNCc3Z1Z2FvMjVOektT?=
 =?utf-8?B?UDBEWlFpYlpONnFzTzAwcjBCTlZrM0xzZSsvTnV0RzJMNm5YNnVPbFR1b01l?=
 =?utf-8?B?M3picXZ0T0ZEVWhSTmkzTFpsMUhaYzAyREVHeDJETEx5TzBaa0FnMmUxLy9R?=
 =?utf-8?B?dkZXNWJGYWxSUE9VaVJxRDJBVnUzMG1raVdIeXFuZ0lndEcwVUdoZHhNdDZP?=
 =?utf-8?B?VGZYS3VjVzN4bm5IVHpEeGlVM0R5b01CVmNEYXFVZTB1YXVXTERpYU13cTh5?=
 =?utf-8?B?ZnBRV0IvNXNxc1NjNFF0OEJVUnF1SWFpQ3duMm56a3Q1K2ZrYUdYb25lcUI3?=
 =?utf-8?B?akFENjYxL1NBelFNcWR3RG5saDdLRExuR3N1eWRKdmVVVHZKanRHQUE3Wmw4?=
 =?utf-8?B?V01JTVNUcUduSzdlOVFSNG80MHM1NzYzcWVuV0tkWG5xbVp4ckdDR1hOTkZh?=
 =?utf-8?B?OTM2N1ltbWc0dm01YmhZQmpXUW5vSFhwYjl0ZzI4NXlDRFNiM0JrMmo5QTUy?=
 =?utf-8?B?WlIxWkFMQTZnaVFXLzV3K2VrRkpxSDFqRlk1YTdjS2F5cWd1Y2JsWTRCclVR?=
 =?utf-8?B?RDU0T1prWklENVdRUkpzZzVXditzRUp1MWZyWDcrUXh2ZGg1VWdGRE1VUEVZ?=
 =?utf-8?B?d0Rudk5XS0FLR1lnbkpIU1h4M0ZsVithU2JvdWRWbkhFTkk4OHUzSVduY2FX?=
 =?utf-8?Q?07nJoxCw690xhmRM=3D?=
X-Exchange-RoutingPolicyChecked: LVtK4GMQ4J7EGWDK+PU4d6PuVsILKP38Cd1uEG/Y6iHM8vs1WK1boF37wzMgllRmv97yypTHanqpJjHHE5iR8akYm/PyLnrxWAO9THjrdonMXTRaRHWzpcPGw5RICTL3+PqSD+GX6Vxu3dbOz7C1qu5sPUMPRQNwDetGWLnEb+fqr5pgbr6wSbCqV7uX6URfUQ80HR+OB71y9nUO6pvuSQeB/Ja95HzKscVfmUiOxj2Sj9omoj1Q7O3ZVzM373PwpWmQ6qSGSJJU4tytlXq3x9dr2xa33vircfQ17UTgoHMaFzqHp1x8cg+MYbypXG+HztkC75biWikTzeHWaHYP0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4652885c-6edc-4bda-436a-08defa0b8302
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:54:08.5465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5r55rLtKss4AAs6pfRs43z8VFcMO4FY3oJrfgtS2rwFiPyjcFUalDONxP/Jn4XfFBBnCQws7L2EHHlBorAwci6OxQZN5VZNr3cBOBwxziNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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



On 8/14/2026 3:05 PM, Nilawar, Badal wrote:
> On 14-08-2026 00:30, Rodrigo Vivi wrote:
>> On Thu, Aug 13, 2026 at 07:12:41PM +0530, Nilawar, Badal wrote:
>>> Hi Michal,
>>>
>>> Couple of comments, on rate-limiting and XE_SIGID_WEDGED, from v3 https://patchwork.freedesktop.org/patch/743308/?series=171022&rev=3#comment_1373861
>>>
>>> are not answered/addressed.
>> Hi Badal, could you please be more specific about the questions and repeat them here?
>> I couldn't find from the provided url...
>>
>> But as we chatted, this series doesn't change the behavior of that and
>> the comment of rate-limit is exactly to ensure this is documented. To
>> ensure it is clear dmesg is not an ABI. It should not be reliable in
>> any way or shape. It is simpler a helper.
> Ok.
>>
>> On the wedge, the resolution buckets were removed, but I'm not sure
>> if there were more questions around that.
> 
> My concern is about statement "Pick per *report site*, not per incident", XE_SIGID_WEDGED is not site specific SIGID. It can be reported from multiple sites.

the XE_SIGID_WEDGED is specific to xe_device_declare_wedged()
which we treated here as a separate "site"

and whoever triggers the wedge state, should use its own SIGID
to reports its own errors, should not use the SIGID_WEDGED

> 
>>
>>>> + * Examples::
>>>> + *
>>>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
>>>> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>>>> + *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
>>>> + */
>>>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>>> +         u32 component, u32 location, const void *data, size_t len,
>>>> +         const char *fmt, ...)
>>>> +{
>>>> +    struct va_format vaf;
>>>> +    va_list args;
>>>> +
>>>> +    va_start(args, fmt);
>>>> +    vaf.fmt = fmt;
>>>> +    vaf.va = &args;
>>>> +
>>>> +    log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>>>> +    log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
>>>> +
>>>  From kunit example I got this output for hardware errors.
>>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
>>> SIGID=204 (0102030405060708090a0b0c) [Hardware Error]: testing HARDWARE
>>> signature
>>> drm-kunit-mock-device demo_dmesg.drm-kunit-mock-device: [drm] *ERROR*
>>> SIGID=202 CORRECTED (0102030405060708090a0b0c) [Hardware Error]: Tile1:
>>> testing HARDWARE signature
>>>
>>> SIGIDs 202 and 204 correspond to the XE_RAS_COMP_DEVICE_MEMORY and
>>> XE_RAS_COMP_FABRIC components returned by firmware via xe_ras_error_class.
>>> If we want the component name to be included in the error message, what
>>> should be passed to the logging helper? The current KUnit test uses
>>> XE_LOG_COMPONENT_NONE, so no component information is being emitted.
>> Our design goal here was to minimize the SIGIDs and make it per site
>> due to maintenability concerns.
>>
>> There will be a field in the actual CPER with location and that can
>> also be printed in the msg if needed. In a matter of fact, this
>> is what we currently do anyway.
>>
>> Increasing this to a per case id is a big no!
> 
> Agreed.
> 
> Thanks,
> Badal
> 
>>
>> Thanks,
>> Rodrigo.
>>
>>> Thanks,
>>> Badal
>>>
>>>> +    va_end(args);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
>>>> new file mode 100644
>>>> index 000000000000..d475e816ee0b
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/xe/xe_log.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: MIT */
>>>> +/*
>>>> + * Copyright © 2026 Intel Corporation
>>>> + */
>>>> +
>>>> +#ifndef _XE_LOG_H_
>>>> +#define _XE_LOG_H_
>>>> +
>>>> +#include <linux/cper.h>
>>>> +
>>>> +#include "abi/xe_sigid_abi.h"
>>>> +
>>>> +struct pci_dev;
>>>> +
>>>> +__printf(8, 9)
>>>> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>>>> +         u32 component, u32 location, const void *data, size_t len,
>>>> +         const char *fmt, ...);
>>>> +
>>>> +#endif

