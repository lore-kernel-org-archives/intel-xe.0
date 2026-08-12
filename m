Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D533C5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 12:01:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3548989E36;
	Wed, 12 Aug 2026 12:01:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQLFzq4V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63A0F10EF86
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 12:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786536094; x=1818072094;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9TkUZxb8RxCyfQtdCog3OhTwIC6QeIVnw12HZ0Jf3x4=;
 b=CQLFzq4V5O5IT1sAqKRahTBqq9jli3j+g7W/kP9saAL72y7eNoMGoveV
 EoiqCi5xJYK2f/udxyNmqc50INhsZCP9HOqW340UiekfMAeiY7GumPJin
 uquN4IE+GAbTfpwKMwDjJMy6PDlpgxdn2544D70sHh1Y5ihW82zd0tr8d
 9j2pxL6B5QOewDaFwZJBwVQG6G2CfvffwdkcvQfOA5ixz+w7IZjFFMuR0
 Ve3RT2Gcs51Qcg10fxnHo0OQzP+rSPaXcoqdqGh8ZI9MM5rvHVmSPI4L+
 sSvcD3sHSxALcckJkPxBwxhe07mrulKZbDW3xwa572lsmaDz2828edPg+ w==;
X-CSE-ConnectionGUID: MmBr3GKRToG0Aj0aWXkOSA==
X-CSE-MsgGUID: 38wbYf5zQiG9X0ZNAdyTGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104620464"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104620464"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:01:34 -0700
X-CSE-ConnectionGUID: 8xbwgGpmRVivIub+IKoMEA==
X-CSE-MsgGUID: 5E6vCjV0ThKYYKlUmoLYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="259797348"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 05:01:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:01:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 05:01:33 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.41) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 05:01:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOPfiYJXzg9v17CJ6bvgyo6O9qSfmnIce/iOmD/nW/G+6z7GjbUWT9ctgSwdoaO/nu0c7Odh4HnCNiTyjK7f0kawy4vVp/ZXPnFWbzSDWHJf+9Q3dQNqSY1gXtplgYLFBDMuMZIHIhPGvD9agx5pFyKJY4SgaPrg6Qq78AJNzRQwPrMwRFpcVwHFmwE0AWsC5MPncLzNIxQ6jer5Cecy48o6Klk7Hc+i40JhN85NTGCecuXT5VMnHe64hm/gwDR4JitwPXdLivLVlAdxw55AdmcTSjbJdQCM7QR71K+hYsJBJ4Ywd/UL+uYPR1MWDyXknICtfFNSDpgJ3I3qH53PZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpiD17LscclSkSBh6F6K+K0LUSDCafQoRSnGRn6Yq0Q=;
 b=GqxVhDFPEJ9q1RCduE7UJa2wbDT1t3ASB8ZWLcF6fdUyoJjucFF/nCasPu3dDYUUhwfGLQK0F9mj2bF0RKrzhEMZOWw7m9VDvRsWNKVAeYiGZI9qeUH+m7rw/zuxhz3ubMPxrGR02wzKr4YTzoz9TebAB3bLPWoBL5eAP26WqYF2zUmjCnKJR5shCZUH6zitAPQF6zigNTh7vFFKUtvgXLgi1zqpPMDVS2mQjdt9+8UXM0U72jcPMGq7pp0R6UZzZqI7u4nIGfk5b5ku8SBj2zvCnUbzPwIS7FeBFjOH3G8pzZfdJ+Yf9HtTkWiz2eFZEZai4FHMIOQqjdE9JlVptA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by MW4PR11MB5911.namprd11.prod.outlook.com
 (2603:10b6:303:16b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Wed, 12 Aug
 2026 12:01:29 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::5a5c:9c7a:cd1d:d687%6]) with mapi id 15.21.0270.017; Wed, 12 Aug 2026
 12:01:25 +0000
Message-ID: <f6b491df-d74c-4540-8db5-6b028c85bf25@intel.com>
Date: Wed, 12 Aug 2026 17:31:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V15 08/14] drm/xe/vram: Add page offline data structures
 and lifecycle
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260811124016.3614699-16-tejas.upadhyay@intel.com>
 <20260811124016.3614699-24-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260811124016.3614699-24-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|MW4PR11MB5911:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c300274-217c-49ce-4f09-08def8696f13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rPcjOs4DEkxyNI3MMxkEnYvX16ie/TjO6XA2MyTD/29G9N0OV2uuunizTYXlcGvA2sBKxYTPFrlNI/do2aO8dTsDr9v3P3rNK4lGIf1WfteD2now0QN3O1dLNAQw26fAQS5xNpKqlBbp7At64p6EPR/K45cOMvVH/axLkC4EW/YbHm5NZSkW7k73tImBiohHyDXUvZB16sd+Hu0Xw3XSpOZoRdl09YvwSw4ApO8VskR1OfgZQuCZ3Ft4eBU8Wxvgt9tYm1wzvP0c27xF3+mhXcuM46geVQGwHkbFUBKX5yfCSht9JEqC1/W8BAnaPe7aRWAL1i7+OfEoWCw4qJegq37l2Gole4wW5AHENif/rSYaDFSzhnR0GTAFJ8M8MZELg3vJXSQM2wb8DXzeWWOJ5TRRPmZGkXusaRDMEa3ZEadNz+jlC44sG7MkupahbazQQm2dkDHjV30sILGuEaJcwjMEwfdyP8gpgKK/hs0jDbvteuoHX4yB0GZY/wBcIcKpBrrKIQJkNc1fj4vn4Hm8oi/LnSHQpXNjDR4lqDW2Ft+d0pyq90PZCVy5i1cdZN+LZmnUpERhgR0Ru8zG3FpCC9/sXyzo45fL5tPogdWqk9ronn/G8nt3tzkYWX03mYmTngxPSAx97CG4PT7FSW85IwaucLKZptlO08nQh+KHjAQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c29BUktNN1drbTlvMit4K0c3Sm9Gb3VrUi8wQUN3Z3ROaUZ5ZmdpMXVueGdS?=
 =?utf-8?B?aDl5Z1NMRlJIbTlWbnlNWUpvcjJpZzFudUsvZldoMk5vb0lmMUNXcnhVSmFt?=
 =?utf-8?B?OXlid3FxbitXYUhHRkhIaUM5RWlSc2JYV1h1dHFIRzVjUGY2aUdxZVRjSC9s?=
 =?utf-8?B?SHpKWWdCMGJQZW0yN1BVZE9EVGN3VjdUSEJucHpScS9WZ0t3MU9TVk1EV0dY?=
 =?utf-8?B?czBRYlRPdnVCcFhTUWFnZk5KZlRpU3RxZSs1VVpoTW82OWNXT1NLTksrbWlB?=
 =?utf-8?B?bzJoYncyT2FDVzV5bi9NUDlxRTBNS055bDllR2haWjEvNGs5cHN1UzA0UEV1?=
 =?utf-8?B?SllOZVJzNDBzT05CMVErVWMzdno5bThvcXl5OElvNWxxM1Y5N2M1YUFoK1lz?=
 =?utf-8?B?MnB0Q01TTWg5aTFKK2wzYkhUWExxcGZiUWU1UjNTaGYvdkIvNEozbnNNa21V?=
 =?utf-8?B?ckFwU1VUWVdjeGNBZW9YZ2ZNaXFnQWZGNk5iTFpsb1JvMnNWS0pjUm1OSm9H?=
 =?utf-8?B?cmNINUYzcVNJamhHOHUwaXdxeWRYdklZbHNxbnVkazZEUXdVa2J0STU3Vkpt?=
 =?utf-8?B?NGE4T2FqZHIxVG1KNXJYU3ZHUGd6L1Y0MjJtd1dzSkZ1eERHeTEwYUhkQitZ?=
 =?utf-8?B?dEk2Y24zTG1qVzU2QkVYbkl5OHp3YzZsY1A5dnlEem9HNGhENEM0QlQwa2Vq?=
 =?utf-8?B?aXN6Tk5ocnlCZjZVT1l0VnFKNk5PR3FjamV0dXZBaFdWV0dPU0Zrd2MrNEpP?=
 =?utf-8?B?djZpSGtNMWtHRGxhWkpRVnBqZy9WVWVSdFRQekFDMnFYOTc0UzZIcnd0aDNL?=
 =?utf-8?B?dDc5My9ZSWRjUXNnTkJkemhFUUhWeWt5SE5MUXJjN0kvSVBlUEpha0FyS2do?=
 =?utf-8?B?cmxNR3Zsd1laakJQTEJxeXpSYnVodisrWEtyV0hMNm1Qa2hrWkpUbFNURStl?=
 =?utf-8?B?R01MdGtXOWtkRU8rT085YzNtYkR0Sk9aR3I4MUVXL1RRVm1rTXBwN2dsV2Rn?=
 =?utf-8?B?clVPS3NaMG15cDhHNkxxQklKWHRScXpyMk03NEhHall0VmxhNjFRaFlYMFQ5?=
 =?utf-8?B?RS9XREtVeXVLWXQ0OWFFWHFRTmp0Vnh4QjVvVTQxemNGbVZ0UG9XZFJjSlRS?=
 =?utf-8?B?Q1lLbWVXejdwL2h4c2I0RE9BOWE3Snpvbm9tL3BaWm9wcGhoT1N5eFhOaHc0?=
 =?utf-8?B?SFJHUG5oa01OVms1ZXFlNDNXcDJxT1Q4RVU2aEU1VVk4NXRFRy81SmtyS3Bt?=
 =?utf-8?B?RjJvV21mTHd1d05iU2E0TlM4bTNxYWFNcDF1cjc1YlhCZ1grWXdaMFpMMTdB?=
 =?utf-8?B?bnBuNlNZK1JpRUNOL2xlTHJoeThiVk1wUzZQVk9KbTNabGpTTW1vZVlQOERD?=
 =?utf-8?B?SmZ4emNaS3ZtWUpzYUFzME41dHc5MENhRk9BaGVNemprekkrb0tGODNGZjAx?=
 =?utf-8?B?MlZCSkhmaVR2eXl5UGEzU3JIem02VW1SRFlKaTR1RnBZa2JDYUFWWXU4Tkox?=
 =?utf-8?B?d2lJTi9JTXNDcmtrY1piUHVSVmVKOGkrUTd3enJuYXJ2SXJJQWdsWmVTWVo0?=
 =?utf-8?B?SS9pZlNFdzhHdm1MYkdOQlRJbnd1MXpTSGh4ZVBwUS9hdlRZcmNqVEVpVXV5?=
 =?utf-8?B?b3lrL0xHSDgxVGxvSjJqNndZMHozcHZQY3l4OU9HQ2VTS0x4Vy83YnRxdHZm?=
 =?utf-8?B?ZStMVGZkQUIxczlBYlkza0E0eFU2S3JNcjRvS0g2Y2pabmlnQitBdGJGQlk2?=
 =?utf-8?B?U0wxZGZFWVJkTFBta0xUT1lvc1IzRHl0Mm5CTHl0Z2xuN09IVkZkUVpDNEVq?=
 =?utf-8?B?emZLK2tzZlRFVzlNaVZmRUt0YVVCZStXMHZpVzBJeTNSamxLVUExUVBJcC9q?=
 =?utf-8?B?a1lpRFNyYzNvbEdMeEFRS3orNnphcTZydGd3VnlIanptN25hQ1pCZkRFelpX?=
 =?utf-8?B?cFJnZnNsQmRSclFYZWUyUUxieHpzL08raktUdVZVZU9aYUpVT083eW1NYUs0?=
 =?utf-8?B?YU14dE5saThnNEtvYTFyMnFaM2RmNDVrNWpMQ0VTZjFJcHcrcmVpbW55SWN6?=
 =?utf-8?B?SlZtdEwxOW1hcDVzTkw3ZlFhR0hDMTFGNzY4cUF4WDhiUldXR0g5emtqRmcz?=
 =?utf-8?B?NVdFVUFKVTRMRU5oU3U5ZGxGK01zMFFYVmY3c2s0dGpmTDdLUVFsMXQ2cExu?=
 =?utf-8?B?OHNSUGlPaThmQW9GbHM1UnFPVmFMbkJ5TTI4QitzMEUwZmtJK3AybTRQdk1F?=
 =?utf-8?B?azN3b29BaHBiYnRJaEtHM0xteDlIY0NXVmVyeC9IdXQ3aXduWjdCaG5ZQTc1?=
 =?utf-8?B?R054M1o2eFFiMWtKN25RWGZEc1lCRDlJRmMwM3Z0by9Fc3NSQXNndDg4OGZV?=
 =?utf-8?Q?suZFyM2dBJazeub4=3D?=
X-Exchange-RoutingPolicyChecked: BWqo/+3IXjCc5g8OBsM35wifU6odEXz4iT/iYF/ViPVw3f4B86YFnEY9amgjDfpg0oA/INyASG5WJj0y9i2yrtX3FXxT2ivgkgralyoH4ODsoGxX02INrtinC2Gx65PokSbqcUc1OLx8IgMAqrhK48G+X7GOodtLEZW0ES/1dGr6IcCXtyWYR7RqZ5nZfV/xxfxfQuCOtBTJyYS2C4J26Zs4pSAijA56tVfISUdbF10pt63X/YqXT+dhCsYgiylQ2cIak7KJsI6KthZGcWRgZMZIMDjD+2BrSwfb0dUWJQnvS2y2kJJaoeKD1O1csvq1EOPhe6X0OJg6iKi5fIITrQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c300274-217c-49ce-4f09-08def8696f13
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 12:01:25.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RPvuKRIjf1mQM87bbPsP5R2DdLlAl9J39YzYdiwKPRKRG/P9r+mvfnGx6DcNBdAvfV6oLkgQMn7JwyEs+X/F8bIOOMFFClBp1UiqwLFXp60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5911
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



On 11-08-2026 18:10, Tejas Upadhyay wrote:
> Add xe_ttm_vram_offline_resource to track individual offlined VRAM
> pages, and extend xe_ttm_vram_mgr with offlined_pages/queued_pages
> lists and their counters.
> 
> Initialize the lists in __xe_ttm_vram_mgr_init() and add
> xe_ttm_vram_free_bad_pages() to release all tracked pages during
> xe_ttm_vram_mgr_fini() teardown.
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       | 24 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 26 ++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> index 49eeec90a470..2813ae68325e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
> @@ -300,6 +300,24 @@ static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>   	.debug	= xe_ttm_vram_mgr_debug
>   };
>   
> +static void xe_ttm_vram_free_bad_pages(struct drm_device *dev, struct xe_ttm_vram_mgr *mgr)
> +{

Don't see dev being used ?

> +	struct xe_ttm_vram_offline_resource *pos, *n;
> +
> +	list_for_each_entry_safe(pos, n, &mgr->offlined_pages, offlined_link) {
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, pos->used_visible_size);
> +		list_del(&pos->offlined_link);
> +		--mgr->n_offlined_pages;
> +		kfree(pos);
> +	}

This can be racy, better to use
list_del_rcu() + kfree_rcu()

> +	list_for_each_entry_safe(pos, n, &mgr->queued_pages, queued_link) {
> +		xe_ttm_vram_buddy_free(mgr, &pos->blocks, 0);

Nit: pos->used_visible_size is always 0, hardcoding is Ok. comment it ?

> +		list_del(&pos->queued_link);
> +		--mgr->n_queued_pages;
> +		kfree(pos);
> +	}
> +}
> +
>   static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   {
>   	struct xe_device *xe = to_xe_device(dev);
> @@ -311,6 +329,10 @@ static void xe_ttm_vram_mgr_fini(struct drm_device *dev, void *arg)
>   	if (ttm_resource_manager_evict_all(&xe->ttm, man))
>   		return;
>


potential leak here due to early return ?

> +	mutex_lock(&mgr->lock);
> +	xe_ttm_vram_free_bad_pages(dev, mgr);
> +	mutex_unlock(&mgr->lock);
> +
>   	WARN_ON_ONCE(mgr->visible_avail != mgr->visible_size);
>   
>   	gpu_buddy_fini(&mgr->mm);
> @@ -338,6 +360,8 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
>   	err = drmm_mutex_init(&xe->drm, &mgr->lock);
>   	if (err)
>   		return err;
> +	INIT_LIST_HEAD(&mgr->offlined_pages);
> +	INIT_LIST_HEAD(&mgr->queued_pages);
>   	mgr->default_page_size = default_page_size;
>   	mgr->visible_size = io_size;
>   	mgr->visible_avail = io_size;
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> index 9106da056b49..bdfdf6ec1218 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> @@ -19,6 +19,14 @@ struct xe_ttm_vram_mgr {
>   	struct ttm_resource_manager manager;
>   	/** @mm: DRM buddy allocator which manages the VRAM */
>   	struct gpu_buddy mm;
> +	/** @offlined_pages: List of offlined pages */
> +	struct list_head offlined_pages;
> +	/** @n_offlined_pages: Number of offlined pages */
> +	u16 n_offlined_pages;
> +	/** @queued_pages: List of queued pages */
> +	struct list_head queued_pages;
> +	/** @n_queued_pages: Number of queued pages */
> +	u16 n_queued_pages;
>   	/** @visible_size: Proped size of the CPU visible portion */
>   	u64 visible_size;
>   	/** @visible_avail: CPU visible portion still unallocated */
> @@ -45,4 +53,22 @@ struct xe_ttm_vram_mgr_resource {
>   	unsigned long flags;
>   };
>   
> +/**
> + * struct xe_ttm_vram_offline_resource - Tracks a single offlined VRAM page
> + */
> +struct xe_ttm_vram_offline_resource {
> +	/** @offlined_link: Link into mgr->offlined_pages */
> +	struct list_head offlined_link;
> +	/** @queued_link: Link into mgr->queued_pages */
> +	struct list_head queued_link;
> +	/** @blocks: Buddy blocks reserved for this page */
> +	struct list_head blocks;
> +	/** @used_visible_size: CPU-visible bytes consumed */
> +	u64 used_visible_size;
> +	/** @addr: Faulty DPA reported by HW */
> +	u64 addr;
> +	/** @status: Reservation status (0=pending, 1=fail) */
> +	bool status;
> +};
> +
>   #endif

