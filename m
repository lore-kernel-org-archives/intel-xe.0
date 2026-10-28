Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ED8606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 15:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=G+kg76Qd
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C63E10E636;
	Wed, 28 Oct 2026 15:50:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5F3C10E688
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 15:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793202637; x=1824738637;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ip8U9QE9ve52faZAlkKC5HoM06sQnI5FPu+VcdIfeMQ=;
 b=G+kg76QdmotYBHi9fPMI5zScdjRQbaE/PFK+FbgzGzW+yMCLgG3l1fAL
 3iyLRei73SwFlphopT+DGKoNMtq/PyC6YV8may+14nkU5+nhvieaeXBhl
 Jt5316tmEKmkaqUMEmt2hAsQ9rCZunm1yzqEny8Wxy5ThdbaS3nKUZZsO
 NN+mCNnaDCOnOFShbzGrUCKIbR3qgRUzCW1M3+F6kX0FP63bRPFQNEqH/
 J62yBE7n1h0TpeLj9owkTjZ9dQRJbkDrwLyE81DbRu5p9v2Gqeb6EKW0/
 rXhr0tqlubSzXxbBuABKLpSyy+lP7lyICLcq6REN2k1JoC741qeAVl/nG w==;
X-CSE-ConnectionGUID: o61mIaQdT8+MzRWnn0MjBg==
X-CSE-MsgGUID: 6P7RVQ0KRX+BzpZNyNP3ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2021841"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="2021841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:50:37 -0700
X-CSE-ConnectionGUID: OBYAqKaxTuaMj6YKRFK1wQ==
X-CSE-MsgGUID: OebFdFafSyet2+KMQtqklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4864201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 08:50:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:50:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 08:50:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 08:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKyEXfiILtCo/TiCu+9zxZe/kNLwNTX3IuDaMFSldauwFEiUzSmDJzw9W/zYO/56cGZAUseNfHbtvlo1vQW3uCt/s3alSlfk+H6ksEXWzGdYZoPMEuAesS5R+/VJ1EUPClLd04X52P0HemJK9FfdAXKmihW2HAbuLteM+eBjZfQ/rruvzr4QGtwbOUIVunSHNy4EepOqGtDXxjLvDNK7MQMdLmtkfCJEJjlKoi/gSK2NeRxXnENghw2v6h0UOZkON4pKjktwsOV6FTONWllU0xVOMD/pmN6zuT3HQqjrri5XnCrPI5VD8Aq8LP3s/I956kwI3QraYiosSuRaHO6KyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9MlwxIebH1HtCt5lU335ExCfl16c5pLylGfpCzBmQSM=;
 b=a9bi0inJQuE+XjbZnKdZ7zaU2kdXP+0muhgQzato9HqeGYTrdluQnTn8vmzObbkjnttDcpcdvXfcQN0ZAlD2ACYgxi743RRzG4QrTtY8Ye68foG/e5/V+/C9rD8sBfltQUBSfUbITUh658DYsfRzMnSZVeoGeM+ZQgrobWIn15CtfqIP5r9KJNfMGAdB/5KGS4jALQfajlaWYE54Vi6773qkX5mnCp7hin58/ruTVfjaDsJ/1PnAvMEgsz4HgLpa0ENNovPYZtQAFzaE14wsCdlEe5mMFxI8lDJGzwE7QFWHh8vfyKv9q7LblnublzmM7NBe1JQ+skZCJkek+xNbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by DS6PR11MB997164.namprd11.prod.outlook.com (2603:10b6:8:4a5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 15:50:35 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:50:35 +0000
Message-ID: <b5feede2-2494-49f5-b96a-e093a168fd4f@intel.com>
Date: Wed, 28 Oct 2026 16:50:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drm/xe/ggtt: Assert lower bound of GGTT PTE address
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261021085716.709503-1-piotr.piorkowski@intel.com>
 <20261021085716.709503-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20261021085716.709503-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0010.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34f::11) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|DS6PR11MB997164:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a19c98-49b9-4b0c-d114-08df350b3446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|261022075727099003|56012099006|261009223027099003|11063799006|261021121427099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: DJ9EDAQBYH3UaGJ9GfT8v43KJZJZJDUuEhUoqAdH7im3IMPEXKS2kJX9WkR7imX5+et+zbUCQ1l87JAVY3mYkj5pHo0ZOW3ZylDUWwOUMxK3iqpxgLPu+v+sKYgbJ4yo8FeV8c92rGM/s9+K3lpSYLpa9793EQ3hfcaG7oUk2WryKB0xtNPe1/3QcIqk9ikSxg39/BJjicRNUw7pdRunMB4pkDmgFYXBMWX4UwcFEVg89gcIvjDxpIJI14hP2mSlxMtHNB8eTc4JLVnhkqyR0aIogafXNq5bx9I47LXnF7i3RH+u020SE+7NHTW9UGC7Pi/TbhJq6GJF/IBTJkRGPaupNlKaDIGXeZt4GKYFU+f1NZfscnRC3Ye4Oe0G5Hl8czQ8JVzKdXkH1vxh9L5oQeYUbWTC0opApRQqWZNXEXfiUaJejlKGy8Emb67mkf4SDWYBNnbYtbSx/1jcg3RGODiTslYVLoJ3vU3kBZw452qxTNBsViBL97xTQxO14lHvTtCeRMoyLccn3IQm+g62MMIcVxd3de7WiwRZnWDs0isxQKz45vNf1+iEhxoqN7GoPXmKxiJH4FlcFgLBSIZxb2yLZnVgpq0CxRvPZjSUvUv2Fqv3VZYeThthCzfz/y6mrFhHhWa14hqgOmiINNboxl9jNnIxv0XYD35nW7CwOV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(261022075727099003)(56012099006)(261009223027099003)(11063799006)(261021121427099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtBTmUwd2FBT0RscEJGS09wVzlzWXM1K2pKUnQwZ1ZwZlpsRmFSZFkyb0ti?=
 =?utf-8?B?QnpBNWRObjdPaWdieEYvM1JNWGYxRXVQcnl1RW8ySnBBbFg5QkdMcGVONWZt?=
 =?utf-8?B?WGs1V2VxUTE0ZDNtRXlSMk5ITlYrNzdxOEVURHgxUHU5VlpvYVZ6YWtlR3Vj?=
 =?utf-8?B?TjM3ZWMyZG16M0VnZHRTbzA1M3ozQlg3QkNDZzBYbUVVRlNMSHNSQk1UbGVz?=
 =?utf-8?B?N0d1cDNFRGl1c0dJb0pjTmY0blE3aFd3a3EvYmQ5ejBpeG9CZHRjcGFaYko5?=
 =?utf-8?B?elNrTGxWcFdoa2MvYm1vWkZtcG42WGlpb3ZWSHFXS1p4MXM0MDZSQTdLMTB4?=
 =?utf-8?B?cUM0UUNMUFJaalpnLzc5MkJJaU1rN3JnS1ZaZmc2OFUzNFd2Q096ZjROdGxE?=
 =?utf-8?B?dENKRStpUDZmbzhSU2RuWklhWDJmbzZGVXBwUUV0bFdCVVBjM09Ia2haWEZv?=
 =?utf-8?B?RmQ1U09Remp6UjdES2FvNVJrVHN1UHc2bGhGZCtxVFhPSnpNN3lsaVQrbzM1?=
 =?utf-8?B?TVdHV0hBampxVzVHUzlSODRtZ25pZjRGK3JLejJFVlI3UVA1RmRWUVAvZVRC?=
 =?utf-8?B?dnZyTmFsSlY3b3lEWlVwaXVubk5uYlFqb3N5UU5rN2c0SXNiWFlPY1pPdWpk?=
 =?utf-8?B?WWRvaXMvNWdvcS9wckJreUlJMVQrT3ZXWm9nM1IzRmh0clNHb2xXVzhleWpy?=
 =?utf-8?B?S1A4dUhlZVFMUHltUlkxTWU3UWFEOE1lUThCUmdsN2dwZFovZ0N0cW4xVnRY?=
 =?utf-8?B?a09QVkFmZS9IR3lubTkyOCt0VXRHRm1KVXR4R3d0SndwRXlzandtaGI4aXRI?=
 =?utf-8?B?YUw0Lzc3UW9MVGFJcC9RSTlPdjZuZ1BhaUVuUlp3M3hnZm9KQlFnZXpCMnFs?=
 =?utf-8?B?RnBzQkZ4cXRqd3I0R3dBZ1YyK2MrZ2hQZmdmZmZkU2xNbUFVU05MQUFtSGhM?=
 =?utf-8?B?WVBPTEZFVUN3R0U4cTdFOG8vWUNHT21iM0VLODJNc3h5Z1h6UENzVURGRXJr?=
 =?utf-8?B?V3NMWWthbmNhS0lCZjB4WHBOS0pJTHZwRk40NytocWNRcmVkMllRTzRLUDcr?=
 =?utf-8?B?Z08yQkEwRjRxMFRnTTVVRVd4QjU5aEFhOG5hKzRJQmZ5NWJmSDBuTCtRditt?=
 =?utf-8?B?RENadlJVN2VKbktpWlpwcVN4ZFYvV1o5d1BkRXdhdXJLbHdDV1NOZlFmM3Fi?=
 =?utf-8?B?di9kQVp0dW5RNVZTVm9RZ01vMXZ3UmRCdkVxVlFvOHNWc2hBK1pCVXBoSC9F?=
 =?utf-8?B?N1RmUGpndCtPL05sWkhMQVgyeVBLeU9mUGFtaDNUZDFMRURzRVVHTklTY29i?=
 =?utf-8?B?eUc2dFBVVUhibHVoQVpqcklSTnR6NFFkSjBuRmxtQlhQQXhoVDZSUHRiNTNH?=
 =?utf-8?B?R09zQTZtY0w3dXBtMUp4M2Urem01VkovdFVZVW4yRW1VMkJOcU1ETE9SUm01?=
 =?utf-8?B?T2lnSFV0aUI5MVVubVVsOHhobm5zM3JWMGNqM25OTktqZnJ3aTMvaDRUT1JU?=
 =?utf-8?B?Y3F4RGJsdjk3TkhRNml6V05LaWFsY0srU1pwN2tvdnFZL0VQakJkNkg4WTZU?=
 =?utf-8?B?TFBJczhFWWRjUTRkekkvR3ZoMEdNb09iVVExVUluTFNKVXNsYTRNU0NHVy84?=
 =?utf-8?B?ZUhxRllrWWFYQU93RVcyc0hRdVVEczZLM2FsMGIxSFBCZ2doZHh3eGR2ZDZj?=
 =?utf-8?B?aDdmS01NeGJ0cXFTQW5oRUV5MGtGcG4rQjFTVGxvQWgvWVhSNmtmZU15c0N5?=
 =?utf-8?B?MWxNdWNhYmJyS0s1OGJ1WlVhU0cxOE9QaDFCUGQ4YnluVmdxMTZ5aWs4UE1u?=
 =?utf-8?B?S2RpeW52b3dGbUE2R3pxdG1TaEo3cW5iY3JZQWRadE5wMHhTV0ZLNWZ6ekRi?=
 =?utf-8?B?MGZOdnpQeUlDN0xyN09MMnJTcVhDSjNlbU5rdFUyTTV5NHJ3N3dCb3lYRXNB?=
 =?utf-8?B?YVEwZTdkdm9UYnFDTWZPSmdLT1hpenZKTFZ1cm4zSmdwSDhVMDdQVFF3TXJP?=
 =?utf-8?B?M0ozanpGTFRsRVdiWUxheWo4R2t0VTdnOTJyemh2QmZzeWZOUGR6TjBMdzhw?=
 =?utf-8?B?Sy9GRzdmOWxUNTdaSnRuWDYyclcrekJ1d0VUdnZRRlFNRzU4ZVF0c2g2cXNU?=
 =?utf-8?B?cmtNUHJUemZiQlZKKzVVblpNKy9LczNnaUlURzIzR1dNWHFyTjIzUzk2V1dT?=
 =?utf-8?B?b2plWnE1MGlRaW9Ic0xjU25CWU13Y1hPL05aNnk1UXBmOXlkN2FYdGwwRmEr?=
 =?utf-8?B?ZmdmMk51NEFHMEhsakl5dDRBNkd3RzZKMmNYM1ROa0o1UXUxcURjRkZ6U25a?=
 =?utf-8?B?RXJjV2tVS3Z3YllWazRRYUJtNExtWFk3U2ppYUt0TmVHMUxRM2wyZz09?=
X-Exchange-RoutingPolicyChecked: X3SkoEfTBo/wJSBspUWgUAt5CeGMZxugYmhjJv6/qAnqvroFi+HqGz71mAFJY5bJbQKjlPLkhyBficUcUe05dK0oovDNkxKGAHUMbpVgD6r6CLcqUTMq6a5wdxxBhAMLB88dRPTAdvmIFb34u3IY9bj9+UQbOnV/o8TyKqGMUx/NLq4SKCjf336CE5XHVP72GIphwljEZCDptSbum81nVw2sQscw3fr4qide9cRVz6ME+F9zej4rfqCFsa5UKNs+xy3gKyBhomyRjVZF1IkrgSdbJ1/LbImvKFjDW0aCsTJg/4DiUAOad4wY4Reyf1JGxkaRFpvN9S56MSR1Qrg/wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a19c98-49b9-4b0c-d114-08df350b3446
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:50:35.0919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KtBVnsvrdE3M1GjG31OXAwqdN/gWOE7gpwmKyxALcGNGdfCoYpUfZdQQ5sWF2XQ7t4gFVioAOrlwPez9Er++Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB997164
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


On 2026-10-21 10:57, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Since ggtt->start was introduced, the GGTT range no longer begins at
> address 0, but the PTE accessors still check only the upper bound of
> the address.
>
> Also assert that the address is not below ggtt->start, so that stale or
> miscomputed addresses (e.g. after a VF GGTT shift) are caught as well.
>
> Suggested-by: Tomasz Lis <tomasz.lis@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_ggtt.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 773777afc68a2..2d890fe74c1b0 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -240,6 +240,7 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt)
>   static void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
>   	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
>   
>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
> @@ -254,6 +255,7 @@ static void xe_ggtt_set_pte_and_flush(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>   static u64 xe_ggtt_get_pte(struct xe_ggtt *ggtt, u64 addr)
>   {
>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
> +	xe_tile_assert(ggtt->tile, addr >= ggtt->start);
>   	xe_tile_assert(ggtt->tile, addr < ggtt->start + ggtt->size);
>   
>   	return readq(&ggtt->gsm[addr >> XE_PTE_SHIFT]);
