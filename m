Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30813C43458
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jul 2026 20:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E766D10E66F;
	Wed,  8 Jul 2026 20:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5m96333";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7421C10E66F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jul 2026 20:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783541580; x=1815077580;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8wzOhjNTCdeziGvhzn+/6uZsm48DP8XjDILrUvtf1ns=;
 b=H5m96333wupuKCwLdVZwesEEke5qwmpENsrF4ioTMCnyfduLmI5NTd9n
 U9u18l9z8snfcC/tpQQlTvtKCgap+UnIuiZRhM6zRqbf2QyqGrrFZZbbv
 dSNa4yG2SFZ48fqrRYIiTkqMj3hDvX8NaxXu5sArb10KCiMdiPVlv/fCI
 vprN4Hf0rtjs+vipT+T53vFRjiz+TT9vhUHNaYFC8jE0fhdr6ef8DB9Hc
 80kGPTDydCHa9cvFOnWxP8OiD5JcaLT+ZmFhuZiugG+usT2dR0nbqCQhE
 thANDbgVd5kg1OFRg810221JxS9NV1yWwvCzZMSWdfxOgK2tXTiLSi29Q g==;
X-CSE-ConnectionGUID: QYRK0eKVRsWdMGImbedhxA==
X-CSE-MsgGUID: Y7VZVvU6SwiQWWcKwLF+9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84094810"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84094810"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:12:58 -0700
X-CSE-ConnectionGUID: cPfBnqGFSkO04tEEum5NMA==
X-CSE-MsgGUID: ZYir7mCyQGeza0rElh1P7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="258684788"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 13:12:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:12:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 13:12:57 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 13:12:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8xilhI57Enl4aJHWhh87f0g3mHWcWhUmpufMAWbVt8523CNNo3HQ3vAX0joSv2wvMGgobJvwosB7s5bRNjEmBCMX8+ZSBVboq5GQIVS44sM/kheb2Ea7SI8jJ3VrfQ7SKVL/LUeaqihZ7kqsTahgY+bxM/eZ7tymJbrmyjL7YBbDyCqVSIb9PRAVZTnYBPhOf9KM7nTUE74Fu3C5qzEamPYzYHawnUOy/Z9A+BDlc0nkwwbav66XQxkYwDsl1dmEmBAHYSFgA7rRuwal3id2dqwYZPZtu6kVyDqkF1f+2DX7C4zqWn3fo5U3a+dNvfPik5038PNm6J1nSSVTLM35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/BCyeJdQ/RrSrUHTxsBKBkHvsakR1bFFUcXdiHQ+bk=;
 b=dAIf4Yq3413V8x0a3Y5k70ewqGr2E3LNNmZ+3Arh1dsg5MNv/+1rBErO1sf1fjTMBOuUAzJ26gNrzPXPJVb4dMwPbMoUkyjC4aGkPeDYui2gBWthp+TpH7YDGL/hBt9WxshsP9/AlYxmmsQIIeVqFwt4r0HUXWdkio0xge6Fow3Onnobtj4ud0KEYv9404OZ1y+wrlQar57SsDhCZqqBuKOJuCdQJGwyHgk0+lSavOSxhckFXvh4Fzdy/Ig2+tNhG+uzVoH1qS/huW/DV3c3B2raByKJdQ14rwjPZvAlpdPdxWrzIMkNFi3YizxSQiw0LE6GQZYcjgYKADynp9m6lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4985.namprd11.prod.outlook.com (2603:10b6:806:111::8)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 20:12:55 +0000
Received: from SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f]) by SA2PR11MB4985.namprd11.prod.outlook.com
 ([fe80::4fb4:c6d2:2c42:1e4f%3]) with mapi id 15.21.0181.012; Wed, 8 Jul 2026
 20:12:55 +0000
Message-ID: <254d31cb-eca6-40a9-8472-a186fa7789a7@intel.com>
Date: Wed, 8 Jul 2026 13:12:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/xe/guc: toggle paging engine support for
 NVL-S+
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260626111520.487997-12-matthew.auld@intel.com>
 <20260626111520.487997-22-matthew.auld@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260626111520.487997-22-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To SA2PR11MB4985.namprd11.prod.outlook.com
 (2603:10b6:806:111::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4985:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c3ab658-2df6-45ad-de4b-08dedd2d4be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|11063799006|22082099003|56012099006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: LnQ1B8bSnHvouWgKgIPJk5poKNYbQFbzQiD91YRs3HdznK/bMF8hwI7z6L0ukoyTHTT7oy5c63VMgSaheEMKH3CL4wRK1UMp8CORdYw8j4g0TgmA0LM+5jxnz88hngp0pNL0FV1VYXrdN9uuSXP+kAybji4BldahcFT1YZmjRTq+Mv6nP6KVPBstiZ93VNJijOqqon3I8j1KRhYeRGWF1t7GjNy9Ogi/huehLd3ksqKxymBYcxN9TLZVBNoOlifyQ5tmPjwz8n/D/8GTvQRvmZQCWQSjy7/r+xPKzg/QBZZNeXbnTmwXeAph1f0wRptZUh4Z8a172S2SwUoDrBOMFKjn/AjO6sRn4+2em2wZzNFO5JXCkoJEaGiDEslrU16L5mYF3NHmaZIdskvITpOOIErmzJ0Sw9s9g5+PnLNKdVWBf4PbgDM38fE8oOzJLCBQ37ckTze+atkNJwM13GbB9NfYN7z3EOH/h3sq5nC2NuimYWKJaDwPajnYv2WpLD7463thoPQz2ni3/Flq6HV+8BC2IfY70OIUan5tA/lYuKTIR5yP/Ilkd8G4TZ6Ne3+eKZWPR3YESx1SSv6yOrxIXFQhRYNhZcEAdNLVdK+1QhxaNF9AHOMbh4XxJOs1gAmBkd4ycj9G0aE1cGUWrwJJwU2tjdxs//+Lo9z1yFuDYbQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4985.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(11063799006)(22082099003)(56012099006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3ZZNkV5dnJLZk1MdlpIQmJIbGxSV0FFeXRScm1xMVc2ektScFRBMDFnY3p4?=
 =?utf-8?B?cllKYjRKWUJHdzdsQWFqaGZQTloySi9RMjhNWGd4SEc1Um51QWl3cmo0WXRm?=
 =?utf-8?B?end3dmJYei94VHFaVWg2eXNaa3VBa2ZOT0dPQ294dnhGYjFBMGRnOG5FZjVK?=
 =?utf-8?B?ZWtTc3JEUFpuTFRWS1JhbzJOUGk3T3pHQ3RRdUl2cTcwL3VQU3VpaUt0M3lw?=
 =?utf-8?B?aU92dVdxekFSbzZsMzY1V09LdmJPTkVlenJzU281VGtxYk9TcUhWWG1RUkxx?=
 =?utf-8?B?NDM3WVp4WnpuM0plUks2QmNsT1haVDlZSHJ2S3BQNWdCU2p5NnJsQXhVTGlB?=
 =?utf-8?B?RHlUclc1cFNEeG54RE5DS0tJRWQ4bXVDV2EwaHM0QjlMVUMzL3ppRjAzTVBQ?=
 =?utf-8?B?ZWd4TlJvSmRCRGdFN3k0M2VNT3NrNEhhMFV6M2hhZ3kzZlVyYmpHSXhCTFpG?=
 =?utf-8?B?UTVhQndDbnZSTmdTSkpYVWN3aXpSUTVVeXZTN0FrWm8wNnNTUytTVEZoTnVU?=
 =?utf-8?B?TzJGdVJrQ3VsT0NUYkJ4ZU9WN1lrMEZGaUlMNEpXMUhMS1lUMkJIZEFFdTJk?=
 =?utf-8?B?YzdGR0xPRmo1QTlBRTU0aytLeGZwYXlacFVINlovcXRVbWdDTEJIMXN2Ky80?=
 =?utf-8?B?ZWEzUkY2OVpKWnR5aDduT0psd3FCNFY1ck1vU0Y0UTZNYW40aTJmakV3czE3?=
 =?utf-8?B?d0NPZzk0cGM4am5JTlllSTdENkhkMlNWZXhmNlNVTW5jYXhJM1hPUzJVOWZn?=
 =?utf-8?B?NW5IT1FSbXNqRnkvWTJhNjUxdW1zVWxEdTFlckVwRE9RbkMyZjFFNWhmU1lH?=
 =?utf-8?B?VzhrOUpINW0xMThUcG9kNTJheThqUURPZDFCVVRnTGdLaDVRdDNGWHJXcWd1?=
 =?utf-8?B?TVJZM0xGbEZqUG9RWjRubHBtLzNXWXhZaXVlZ0hzT1VaVUpiM1NxQm1TdE4x?=
 =?utf-8?B?RzlQT2xnK092Tit5L0czNmhCSW0xWDJpKzd1VHB4Sk5oOWpPdXVjTEhWYUNX?=
 =?utf-8?B?eHhEeitoRkRHeGRWV05xUHV2VXZwN3FpYUdQS1JCOWtTQS84K25HZ1RVVUEr?=
 =?utf-8?B?TnVSTTVDa05TMGRsUkU2WU52eHhvRkwvOXRSbWNzOXdVTlIyVGVXaEdaN0lG?=
 =?utf-8?B?UjdNK25jbzNrUXRldVdjTEtMb0F1eERKL2VPQjFBckx2VHp2TTBnZjh1dUY0?=
 =?utf-8?B?bG9LbE5nNXNxcGw1MzdwOEpRMlNmRGdLRlcvRGc5eXFpMUVXZ0VjamZNSmJF?=
 =?utf-8?B?Wk5ma1dteEZ1MWhxZ0UwNXdZZytlWkdmYTA4UG9YWDEwZTc5cjIzc2NQZGlr?=
 =?utf-8?B?TExmby8rTmt2dGZ4dHMxMUphR0dGVjV2WHowU2Y5VXJZV2Nnb0I3S21XOS9G?=
 =?utf-8?B?VnBaTnZYVVdnWHd3bC9tMDdWTUlYVWxZb2pxZThSWVNETmwvTk41MytnOE5M?=
 =?utf-8?B?eWxLbGYvRjhiZ0NuNjFDMHBCZHAxcndyZXJzYmlGNjNOSXpsbVo3M2hxT29C?=
 =?utf-8?B?WkxZcDJRNWhtYzRjQXk1RmsvWHlEd2lMTE9wbGFWZVhaS2NJbVdzbURhWWRH?=
 =?utf-8?B?VnltQUJxV2FMZlhGU0Y4a3c1V2N3OThockhyMUdDM00xOFVuMVpCWTNiVHkv?=
 =?utf-8?B?RGV1c2N5TW0wWUFGOE41YmRZZjhocmNjZUV4bDEzQzNDa2xNY1d2YUhreVp1?=
 =?utf-8?B?SWo4R1V0ak56N3lCdXlxaTBCaklsb0FmalFsUnJTMUIyR0pNQW5RUzVWRzdW?=
 =?utf-8?B?eG1TWFh5aXh2aHJaV084eUExaHh0Q1d5NDBUWUVJRHo3dm5DRUdRMHh0STFK?=
 =?utf-8?B?a25uaFdaaEgyK1lXYjFaSGR2c1YvR3BmUTBHcXc3VHdKWDJlemJSSzU3YWh0?=
 =?utf-8?B?MHBKd044NS9BQy95ekQ5TXcxRUNOOW5sbUNZM011L29hc2pHeTRsVEhhV0ll?=
 =?utf-8?B?bm9uTGtyUGFYeFBXTlE5U0tDbExXb0RqcjZHMHNNaU1ZZVgxU3ZCWXVuNWMz?=
 =?utf-8?B?a0hRVE90dW45RDhGNnJZVFgycC82cU81TmtURTBtenAybjBSSUd0QVR1c3BW?=
 =?utf-8?B?c1JQN3JadGg0TkU5UGtGdUdidkN0OFB6ZVo2eVB3VEJnRFJGdHJuNno4d1da?=
 =?utf-8?B?OGY2SEZEd3ZLdDNsZXFsRkpjY01SOEJIendlMEpZVE00a0lQbnYwOWtwMVlT?=
 =?utf-8?B?SFVEZ2h0RDMwV0xucDl6T1JTVjRMWGVtL2FmMmtIaUJ0WnZmeUlDSFU1ZGFL?=
 =?utf-8?B?S3dzSGpXNDFUQ3RydnRnTXNLekx5VDB2S0lneUlGY3JQOUNBb1ZYVzc1S28v?=
 =?utf-8?B?eUVvSXNTNkk4VmJBdXNmczlyWDlOTEtnOXkyb3RYcDAya2JsbDBySXN6RGts?=
 =?utf-8?Q?2BVNT0nuq0cWXvUM=3D?=
X-Exchange-RoutingPolicyChecked: jUb7YjICNIi5P/TbygVaSxzBexC2O7UrvleQAZQ3aXTxgfyHcKv/08rJxLc67CBw01n0VuaHCsY7v16MJwh7JE48Sql4Rr5Us1EeByr/QBv/+uPxF+MiwmEe0Jo1O18pqJk9h/X+hdw6FnXTraaorSDO+NQlTnwacgXr2ww0Zpll29xhr0x1RhScQ32h7zawkFEzr7Aj17ANZGkmU5tXqaVEwQsr7LAr4SLH3D6EV/ZC2c5QN89bdULQCbiHF2GIQiolOAk6bTgysIOXCWSSA1mbLbPwKw7aDT7ALrFAJNksJ5dFkpy1fybx2fk9eB7P7mkbHpON7etcFV1MHCtgkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c3ab658-2df6-45ad-de4b-08dedd2d4be5
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4985.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:12:55.2238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UMqItbnJZ9w1xE69L/43wz6pMo5Mh5fQO3Nos+B3wDSNNBWLadkrtIhFSs1LIOFitraZ5JauO9Wy2JcxnjMWn/9YFrmguNEOssiACmiA2ig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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



On 6/26/2026 4:15 AM, Matthew Auld wrote:
> NVL-S with latest GuC should be the first platform combo to
> support the special GUC_PAGING_CLASS feature.
>
> v2:
>    - Update with the final GuC version
> v3:
>    - Split VF vs PF versioning. Which is recommendation from GuC side.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_guc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 244943843018..feae2d4f4482 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1863,8 +1863,8 @@ bool xe_guc_has_paging_engine(struct xe_guc *guc)
>   	if (IS_SRIOV_VF(xe))
>   		return xe_gt_sriov_vf_paging_engines(gt);
>   
> -	/* TODO: Have some way to query this from the GuC? */
> -	return false;
> +	return xe->info.platform >= XE_NOVALAKE_S &&
> +	       GUC_FIRMWARE_VER_AT_LEAST(guc, 70, 69, 0);
>   }
>   
>   /**

