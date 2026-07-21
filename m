Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D246C44529
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 04:00:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5B010E28B;
	Tue, 21 Jul 2026 04:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGVpJ1uD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA4510E1DF
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 04:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784606453; x=1816142453;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L1wbkpzkV9KkSI28LauFL2wpkZX5y9E01XNesaOu7ks=;
 b=jGVpJ1uDPO0b8OHFFbLMnmwENCVtAly2RE4fx0WKID5+pR47hE5vUTd7
 Gk8hX1e9NvkVsNCAWL+A8WDQZHAA9MDyxJ364jV54HLXhDlU4wMJkevoF
 17YfTLyCgXY14SjsK5z74Zfa4cJYgko9NOfxwKH80gDgbbDq6anxernpx
 b1RhmkiSqdROjjtpE7vEDlTtPxOz814m+d1cGSZ3bGvsgaEOpiNoba35I
 NziOFUHhGTg+nCB8TXHjzQlI5gx2c5SUpdieR383mUjJHFkP6/9sC9Aun
 2r/+E0h3UaO2P8ZPU1DzyzvftCPPFBhzfZyyVC2rs6Thh+0km9G5oo/d/ g==;
X-CSE-ConnectionGUID: nGD8IXGQSHGSqSroGkYTGg==
X-CSE-MsgGUID: PyOW82gmQSmf+sOTFwHZ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="85071300"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="85071300"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 21:00:53 -0700
X-CSE-ConnectionGUID: vHzcC0KRQKWndn7cQy96Nw==
X-CSE-MsgGUID: olVPyWXBRkOyNUm3ZPUoRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="259625817"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 21:00:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 21:00:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 20 Jul 2026 21:00:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 20 Jul 2026 21:00:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCe+ImRyrP/onH2lXm2B9UN6iN+4FmSQo8zhTCpdaEajs2JotHRS3jfer2pszcmjMRaxdsA8ZaE6smpDFGnwPOS/XhSvFDAWAyiPajFKH5Zl7pH7YIPGVjaAqR061cHTOpwqC9oRtZjCEFh5j2sIJ3q/K6LSV5Dsat0I7xEgFvY5GjmRKAy1kxucZLaWnZ6GCn43+AHRNa2xcVS+8hoNs87tD7qdBEmhfS91vQHDwRcGvLQoiq/NaD6YTq607Srhap0hGDJhbSNvCIIhZ65ZZjmLLadLZlBuxi5eyhWXIOAjd4cRebjWUnmGI5j+s3GvY99hdYWDktX71TaCGzs+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYZ4S3t1Tb92GzYRvYeegZ7bFTVJ8VMsDdmv83QPy2o=;
 b=mIITSCsS/jxz7C+U/ftHof0Son038AklglusxILYd73HWPdlJeNJSS5Tip0wc89aDDVuPBuYxYUkRJKFZ2PzwbKjuRx4Vf9GmKMwdQFhjWabfNfH7zstEb2lWWevdD4ihNAKKxoflvddYm6bdL9z8nrpR1xJbQcozmQYjY1HL5n5XfPbuhHD+iPkLddGmW+YEuSKBn17WtCm2EL6q/gFYd+vih472GS7QASy0L0rh5NVQWQMA5r5cxx69k3dVo14e+IkUoHiB7gR7/9bRhay+hSVejPIESG6TIzcmHFlWM44UAmoyao2FkYm+2kWpW+ouD9mU4YzIzUwpgtnsTitEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by MN2PR11MB4725.namprd11.prod.outlook.com (2603:10b6:208:263::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:00:44 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 04:00:44 +0000
Message-ID: <9f5fc488-2b0b-43e3-a4f6-feba467f7d1e@intel.com>
Date: Tue, 21 Jul 2026 09:30:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] drm/xe/debugfs: add page-size allocation mode knob
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-11-himal.prasad.ghimiray@intel.com>
 <dba83e48-e93e-41c5-a337-7c79bb6fdef4@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <dba83e48-e93e-41c5-a337-7c79bb6fdef4@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|MN2PR11MB4725:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e3f521-0368-4254-0b0a-08dee6dca395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: ocX7Ik96ThBMXtIV9hGfgfUcxw/5w3+Wpb9kdmjC0j5bGEv6y7ZOgJrPP0Ta0adTzLDLyeh4p1VXbA3KOMiZobZRB+HaQ6M0GiEZ408sc8XCIjyQwLtDbpRZh+ucxnfqhbzd4eFGYV329K3d2f9NhYW6zkeb8S9vfjkvmJA9P/e4MQnw7PqfoFdHKGpAofiUzoM246QkntoRS4SjvslRSqoLaWCG8tMXpwVMCkxMFKymivNM1VyR5Ty1ESDGJMxp1WVaycIF/zU7f59HFkqRXeGTRToR4qhfsMOnytlUMQimv7H8tRv5StaDKhGGK1jfIQNITa5lQR7mj57XSFkHwVUm2VXadZxKl+kSnZX+uS1q9nHqbYQeKVt7XeWb2/TPAs3jQY5JAO52dfQh719ggX0PJK+bsWzy2DRxdkdVXWHc5Z/uVUrjHo/NdLfsOpFvxcyD48CNiJdZjRVQbS4jHvGc/10qVtGcvUb2zqzmBO/3Nwqf+7j58KIsEEiO+WTo8oqR8fNPEK4mnDxK76D2PSmLoM2tZwI0tQqj/7lVVK7Vj0LmxRLRlg6yvPtKTgL0XueGYjv20wGa3SkY5c59wRnErmqvRNQHHPYagrTOs7lEkbrkNWKCoUSRE54UEsvWjY924i9ZjEeMbDdPwAhUlsa5FfP4F1sxNqE4nC6jVa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVpUXE4YXJLd29wQk5mVkx1amFrakZqSEgyWVNSZzZ2ckpTSHI1dHA1blI0?=
 =?utf-8?B?MjVreXRBK1VtN0dXTnN2TFdWVCtxQU0vK3psV0FiNllZSVRZLzljdTI1dHdo?=
 =?utf-8?B?SFY3czVsMUZnejVJOFdwbWliU0ZPQ0R5aXI1VmtvR3h1TkJXUkdIUDIrektF?=
 =?utf-8?B?azJtY0JlRXhZTFhwZW1vVnFyUldtbUVCT0xGYXRGTkRnWUtxMFFxMEtzeFpk?=
 =?utf-8?B?OEpMSTd3U3hzdVc5VTk4RkpyNkN0VXlzeld5Ukd6TGpCVEZoeDBHempIMDVI?=
 =?utf-8?B?bDMwdU9UOGFuQ3BmTEF0TkNOUmR6QW5qVlNpRjhWcmwrdlFQZ2dMend1YThy?=
 =?utf-8?B?MjdPYWFaQmkxK2U1K1RZdjJNZ1RLL0JzTFVoQWpORmdnLzZPaHhDeTdLU01W?=
 =?utf-8?B?a1Y2NmNYVVpFMzJYNEU2a1ovOXNzelNtZXdIK3R1Ty9TSDdMOUpGamphQVVq?=
 =?utf-8?B?Y09Na2NTV051SFo2OXpTTGJQa1VvK1A0MUtsOStSVnRScXZodDY3VEkxSklC?=
 =?utf-8?B?emh6UklqeHc1QkdYMjJ0MThuVWZxZWFHWGJMSmxLVXNXbm04eW92ZzI0eEQ1?=
 =?utf-8?B?aFNPNFZXVWFFblU0cnpOMGNKbk5ERGxWSFJFL0VDbVRBL1pWUm5hNURtNktw?=
 =?utf-8?B?bGJNb0xkTE9lR3gxZmxSdVkrZGthMWZxTFpLMnV1SFozbmpnbGxjT1BhdzYz?=
 =?utf-8?B?WkNOb2RsWTVSVlI2Z1VNdVNlSmI2OStpK00wbjY3WUNGczQvWnRkQzMwa1hW?=
 =?utf-8?B?WkFCcmpGcUpRSnRLcTlwN1Y0RHM5cUY2SHM1M0dIdEdEaHlsSkc0RnEvTGp4?=
 =?utf-8?B?TGRZcEdIUFlrdVptNEhiVllkazl3elJ2bFB4ZVhlbnd6Mkk1R3pTVlM0clc1?=
 =?utf-8?B?RTlONHdVbkpiczZOcE15NVU5a2VLRHpBL1MvSFRzRUpoNzRlUnByZHJxMVJz?=
 =?utf-8?B?dENJd05KTDNyd1VLREVGZEY3THRpejVlblg5ei8wMmNhNzZKV1U4Nlo3L0Ez?=
 =?utf-8?B?bGtWM2JSejZPc3FQUE9tMHFNOTN4bWhDdTBWaHZ2Q09USDQ0L3Y3Vlhzd1pI?=
 =?utf-8?B?VnFSVytBdHVBZGFyQWU4YXdNcURjTVhiYnkybFBlbXRMQUVWbFFrdVVjUkN4?=
 =?utf-8?B?VlZqNnpGMnB3czNtSFlxcHdrLzRyKy9rT2E3VURFVEVYYzBPRGtzc2dvYTYr?=
 =?utf-8?B?b0gzRjZmU21VTktERCtDY2ZrSlMyN3JPSnRqalZETENlRHJkRVVYMkR2N2dC?=
 =?utf-8?B?aHJRTE92UmpsOHRIR1l4bGwvSGZZcGNZVy9LM0pRZmZ3TDRTQ3lZbTFhUm1v?=
 =?utf-8?B?RGwzTy9Sc0RNOFVRS1Q4NHY1Y3ZFYnEzaXU5bm1HaFNwQW5JMjVIeHI3Uzl0?=
 =?utf-8?B?QWwvNVc1aDI3RHhOZjhRQ1ZtMFZRNzVPYTdlT2ljQkU3NWV6MFZ6emF1T2E3?=
 =?utf-8?B?NVl0UDA0NUJET2NZeEZ6c3lXbmxJTUxCTTNjdWJFU1VMckQ1RWdrTzVXVHh5?=
 =?utf-8?B?RFYxdFdubEg4TEd0TGF0eTVwK0p5QlFJUXNuT1Vqd2tOL09qMEN0UUJIL2VC?=
 =?utf-8?B?QUFGbGQxSncrWmgzZnRTS1Q4cmJJNXlTdzBqWUN5aFA2dHFIVzdxZE4vU00r?=
 =?utf-8?B?OUVhOUkrbUNQaXBhVGc4NC82Uk50N2RhLzVTS1ZYeWlWUU1YelNsMUtIcTB6?=
 =?utf-8?B?NGUvRVFBdVNNYWdkQnRjM2hVZ2R6ejkxMjJ4NTVrMm5YbU5NWTVFOWdxV3l6?=
 =?utf-8?B?R0NqbHljUW9RN0dZQ3A4ckVxblZBeTliRnJYb2tNRDBlOE42ZmVZSkx0emFq?=
 =?utf-8?B?aW1wQWZjM0ZBOEVDV2VtUzRXZkRVcmw0NHBsZkR0TnNGSkh3WjhhNUxvK1l1?=
 =?utf-8?B?cWszc0s5RDNna3U1UCtwM1FsbzNVa3R4SWlOWTVEa0RVdDFnZkFJSW0rRERB?=
 =?utf-8?B?YmhONlEyL3F0TmF6OE9XNVpGZUpGZ3pleWxPRmhxTkZ1L2RSbWRpN293cE55?=
 =?utf-8?B?SlNBQkdQaXk1VXNRUk9OTG5vaFFTU01LakV4aVY3aUZCTDBSVW9LRG10OWQ1?=
 =?utf-8?B?MHdraFl5RlI0M0xnaDNKeUVuNGJ4SE9XOFpScFFDUmxNUS81QlZYd0V1UStX?=
 =?utf-8?B?RTlYb0I1QzQ4bG1pTWFPZmtkRVJQTCsyRWdFUjg2SldlM3pDZVBkNnlwb1Ja?=
 =?utf-8?B?dTBTaVBwN0w1QTcxTm1EOUUvb2E4NTZYSjNYbXFsUTBtV1dvanpmRloxM3I5?=
 =?utf-8?B?Y1ZlSTRTV3paemV2SHZQbmVLL3ZQQW9tNGQxeGo4ZlNoZ0diaktoQTBaSDlE?=
 =?utf-8?B?YXduTmpGc0xXQWZxRmdGaDJiQjdWUHhRbHltNXVaTWt3dHdBbEZoZz09?=
X-Exchange-RoutingPolicyChecked: TM4LzcuGL45s9Jpew91Pf8tzE9iT86m1c4lxJucPatigZ549z7KxyzbH//6DZm9ARMsHplUDL14Ou+GwQb4soxmn6RF4cSbkIFLVWBJwYJXvGxGGTHS8r/lI2ILGQ/Vo4vhWiQMvm1rCWNFIy9FGSUz7drnjMtn5Sx3FC0gi3UPrSQ0oBHtpZxwWtMrYQzat04GR3EjdXxI9rYsZbefnL9mPyCXN7ieARV4T4jt8rOuQpd9iyqB2+IIXFSlEi/WkLsum/3me9GRXuE11TYh5wKuSyA5s49vsefCQx7JXLeS2wCnhlrVysBTXNsSqyAqrch2HMcCOizyD3tQLVqLYAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e3f521-0368-4254-0b0a-08dee6dca395
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:00:44.6275 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HE3yJpK3BrWUNock95GHOewzurEtGrEUQLpU6aTNA06HNrPjwwvFPludbXsaX1x6RT6HE2pcGvDVE1nJGjcBXgzIBQhB4dEcF46PYSiSNUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4725
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


On 7/16/2026 4:41 PM, Ghimiray, Himal Prasad wrote:
>
>
> On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
>> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>>
>> Expose a debugfs control to override the page-size allocation mode used
>> for user BOs.
>>
>> The interface allows switching between the default allocation policy,
>> forced 2M, forced 1G, and mixed allocation modes at runtime. This
>> provides a simple way to validate behavior and debug page-size-dependent
>> allocation flows.
>>
>> The debugfs entry is built only when CONFIG_DRM_XE_DEBUG_PAGE_SIZE is
>> enabled.
>>
>> v2
>> - update changelog to match mutex-based cur_index handling
>> - reset cur_index when switching to mixed mode (sashiko)
>>
>> v3
>> - add CONFIG guard for page-size allocation debugfs support (Himal)
>> - create debugfs entry under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>>
>> v4
>> - reorderd this patch with kconfig patch to ensure patch builds
>> - Gurding this debug knob for only discrete graphics
>>
>> v5(Himal)
>> - Guard all page size calls with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>>
>> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_debugfs.c | 62 +++++++++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 8c391c7b017a..dcc01336538d 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -564,6 +564,56 @@ static const struct file_operations 
>> disable_late_binding_fops = {
>>       .write = disable_late_binding_set,
>>   };
>>   +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>> +static ssize_t page_size_alloc_mode_show(struct file *f, char __user 
>> *ubuf,
>> +                     size_t size, loff_t *pos)
>> +{
>> +    struct xe_device *xe = file_inode(f)->i_private;
>> +    char buf[32];
>> +    int len;
>> +
>> +    mutex_lock(&xe->page_size_alloc_ctrl.lock);
>> +
>> +    len = scnprintf(buf, sizeof(buf), "%u\n",
>> +            xe->page_size_alloc_ctrl.mode);
>
> shouldn't READ_ONCE be enough like other caller sites reading mode ?
> Dont think lock is needed here.
>
Make sense. Agreed and Noted.
>> + mutex_unlock(&xe->page_size_alloc_ctrl.lock);
>> +
>> +    return simple_read_from_buffer(ubuf, size, pos, buf, len);
>> +}
>> +
>> +static ssize_t page_size_alloc_mode_set(struct file *f, const char 
>> __user *ubuf,
>> +                    size_t size, loff_t *pos)
>> +{
>> +    struct xe_device *xe = file_inode(f)->i_private;
>> +    unsigned int val;
>> +    int ret;
>> +
>> +    ret = kstrtouint_from_user(ubuf, size, 0, &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (val > XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&xe->page_size_alloc_ctrl.lock);
>> +
>> +    if (val == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
>> +        xe->page_size_alloc_ctrl.cur_index = 0;
>> +
>> +    xe->page_size_alloc_ctrl.mode = (enum 
>> xe_page_size_alloc_ctrl_mode)val;
>
> WRITE_ONCE to match with READ_ONCE ?
Noted
>> +
>> +    mutex_unlock(&xe->page_size_alloc_ctrl.lock);
>> +
>> +    return size;
>> +}
>> +
>> +static const struct file_operations page_size_alloc_mode_fops = {
>> +    .owner = THIS_MODULE,
>> +    .read = page_size_alloc_mode_show,
>> +    .write = page_size_alloc_mode_set,
>> +};
>> +#endif
>> +
>>   void xe_debugfs_register(struct xe_device *xe)
>>   {
>>       struct ttm_device *bdev = &xe->ttm;
>> @@ -616,6 +666,18 @@ void xe_debugfs_register(struct xe_device *xe)
>>         debugfs_create_file("disable_late_binding", 0600, root, xe,
>>                   &disable_late_binding_fops);
>> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
>> +    /*
>> +     * Expose a debugfs knob to control user BO page-size allocation:
>> +     * 0 - default behavior
>> +     * 1 - force 2M page allocations
>> +     * 2 - force 1G page allocations
>> +     * 3 - mixed mode: select 4K, 64K, 2M, and 1G in round-robin order
>> +     */
>
> if (xe_debug_page_size_supported(xe))
>
> wont it be better to use string names instead of values for debugfs 
> read/write ?
> something like none, 2M_pages, 1G_pages, mixed_pages
>
yes we can use this to make more readable and maintainable will change.

Thanks,

Naresh

>
>> +    if (IS_DGFX(xe))
>> +        debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
>> +                    &page_size_alloc_mode_fops);
>> +#endif
>>         /*
>>        * Don't expose page reclaim configuration file if not 
>> supported by the
>
