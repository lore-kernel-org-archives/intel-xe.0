Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C6C10DC1
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 04:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69B810E14C;
	Fri,  8 Dec 2023 03:59:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C10010E9C0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 03:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702007998; x=1733543998;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=boeWZbakBCtttEW73Zl2/hoYAzXZX5GyRAFhr6VnqUI=;
 b=b4Cb3WkQoMdEBaYCq1ZDj+eCPMqJjLK2OH6J2tAy/fXl/uwuLbt6eBUG
 iy28EauzYW05BAV2RWiLQP8N/FtPHA5Af8laiztG0GPDNf6rLOW5GKOJN
 p0xpypkQnrY/Hkv7DbUC41YcCQu78yo9GxOHvBvBxpy9tg2Py5/PGzpZ9
 JFvBf7w/Bf4ecZXOPIKbx31kZE8Og8O3TC/2kMqdATIcgjvNYefOjBJGn
 bw1sG3XkbrqCWzRI6KBosH4J5DOg04bmFKDPR4MifcQHDP0T97vmIuuCT
 ADdWljKkRyZnISkH5S9jUCjW8kl0STV4ksDKwOQ99DqHjCD7XLtK/0Vjd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1432354"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; d="scan'208,217";a="1432354"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 19:59:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="772000252"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
 d="scan'208,217";a="772000252"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 19:59:49 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 19:59:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 19:59:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 19:59:48 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 19:59:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBCoZJS3FTrmwGbuS2Be0AF+yJsrrAYgMHn8QQ1vDDLBkA2IuFy2dvTofvtgiKSyY5RYLuTTum85YALNIdSK/62PZBiU/446rEAs1gTGlrCUIvgzIiF4HJNvi7Z41ToMppANn7bVCKEnKOPDOr6iuZO1sTG4oN5r2QUPfpZTvTkCZfLWlX5CuRQnZdQjh+viNhRFQvYfUdmGWe1vlz789Y+ThM5ALL2NcaI2Q0SuVuJVTgMznR8QF5qetmiRgtJUj1/rypAtM2i+AkAYqUwaXrc2/nJLG8cCE4sE9tA5Puu27whaVhULUSo7TNEK61qZQOk23hmgS8MsizCkXkqW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z3MRjuL0+RaplEB2Pfx6s7tL/8T8kPngqQSFj7XhK2U=;
 b=TO/yK6p8mW8wHdA6F9rJNSzUNNNGf1RRFWouV4ZLSfL//lpkf+XvgTDblRNhq6lFXBabwJPlWGU9HLRQ7rA3Zh4YDFVK82v2DJ53ad/ZA+TRds0OOSqcIxoRUTT+NKYrX4xXmi9+ZcTGY8P3QpFQdzwdhXELrpTTGiVtzjuO+cgHwsHSvIeudLWd58jsSp7kA+9W0bd8RKs5GKjkLr/LIIl8SB7GXFolngmdSDcIeMbA2q/49BV5IXvP0veud3dYW9rQLP0z9N/WFDY/YKim7sAW0ylpNQW3pKmdAgdWMAOADXI6UN66JE+MUFBalKn6j/jOAg3i5R5RJN6BWqo9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5347.namprd11.prod.outlook.com (2603:10b6:610:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Fri, 8 Dec
 2023 03:59:46 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Fri, 8 Dec 2023
 03:59:46 +0000
Content-Type: multipart/alternative;
 boundary="------------QPD0SUbzBGYxLfFiusdplt1X"
Message-ID: <b74a24b8-90b8-4ec1-a9f6-286263bce7fd@intel.com>
Date: Fri, 8 Dec 2023 09:29:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-xe] [PATCH v4 2/9] drm/xe/xe2: Allocate extra pages for
 ccs during bo create
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>
References: <20231206043126.984049-1-himal.prasad.ghimiray@intel.com>
 <20231206043126.984049-3-himal.prasad.ghimiray@intel.com>
 <20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: BM1P287CA0022.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::26) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5347:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7a91aa-385e-41a9-19c9-08dbf7a21df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8zzsLE2wt1Ixaie6fpkI+/vFxiovY5M9HEw1dQgvBAx11fK0WgzoNPzBS35Fh9jF55MmtB5uqDx9TfCzqXDLQi3bLU5MLmNvwBKLqum2b3ZgevwszZIee4TnkeC/jP0RQuaGwpftecEgBAIAIjX2J6sHBrtAMtJRdpj5EImfG43JyiXpXG1J/3tK1GDV3zgc7SZD1PSr3qRMhy3eo6wJP1TI9fQIB9M6/pyDQUy79GyIROIGtZ70rMwhkoOXWhLA075Dvt3D5VP00tHpj5aMOnPR6+HuxIKV85jOX+eevt2Dq/6SCUEvKRLsUidLAYVPj1SWZYHXzFvFTcRpYwu9Kk8l4sXJU3Ke2x3tSQ5ZvpGRhhwexpTynqaT2GBs+vFsmOxR6F2RnMZ3Fs2gZxvj9E+omiBvOofeSFQve//SSiY3zlsSX3vxG5zJ48HsGKcpryhYlKw+c+HOYymDUYtMLLB/2fNX7gL3AqugYxHMgZXrKQvBcM1pbXqbPBsa7DTpNAQVzeSJ+SondOXwH24jQlmAYwJnRbK1ajChUpwF+J6KEktr9Yw+O8d8zRNtPJFn2QzNHIuofjKz3k74korgMeZKSZvTPJo0Z+XF/CtBLDaHI72DoQFakmofsVtqm4IesHp6SDze3IZB5O/Y+xJKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(346002)(376002)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(6666004)(33964004)(53546011)(6506007)(83380400001)(8936002)(8676002)(26005)(6486002)(31686004)(2616005)(66574015)(6512007)(478600001)(38100700002)(6636002)(316002)(37006003)(66556008)(66946007)(66476007)(31696002)(41300700001)(86362001)(36756003)(5660300002)(82960400001)(4326008)(6862004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNOc0FMeUdJNDB3elVuYXkwMGZ6WlJ0M1FVYTJOcWhPOE5tYlhJZkRPai8r?=
 =?utf-8?B?VVhMTmNhTGNndnVlMDRuV3RWL2I0UFdQMTN5Ti9SNFY1NFNjZjJHcjk0bm54?=
 =?utf-8?B?UFpDcWpTUllyUHViNlFhY09Xb05mY28zTzBhSnFoNUtTNlRwK1RmNFc2dzcw?=
 =?utf-8?B?cDh0US9XVUJ3czVFUzBRL0tVNGdRNVY3T2VoQjJ5K1VyRmF3eEt0blYwWU45?=
 =?utf-8?B?bkNjRTJmaUJ1RU9xM052RS93MjN2YTN5dHpVdnNGN3FCOEVEbzhsbjNKbU95?=
 =?utf-8?B?Zmo5eG04dTNpUllMQlNKSnhNV0JOT3AvUGFaVDgrUHlpUW1sMUhYODF0WTlC?=
 =?utf-8?B?UXpMUWFCYTJXeUJ5TEl1b1cwaXllOCtQRUR6a0ZXSlpQSzhZbWhnSG9hR3cx?=
 =?utf-8?B?N1BuSy81TWx6T256UnNXK2wrMDhUcVNyMGZqc1FCeTdxVG9VcXFFVXdlRmMw?=
 =?utf-8?B?MFA5RFFRc2dZR3JXRE9RT3JaSE9ESUdpS2dvd3AzdFN2dFprL3UzUHM1UlZa?=
 =?utf-8?B?TlRpOWMyb2IrMEZSNFVMOFEzTlhJN0pEWm1EMDE1SS9RV3lnaThsMityZVMv?=
 =?utf-8?B?VW5hNEpMWml4cjIzNDNzQU5IdXF4cytmU1licTR0aWVLMnFNR1o5N09TcnA4?=
 =?utf-8?B?di9vUUYxZ002cGhybUxoQlgrWTlzQ2RoNDlBOFVpREF1Q2lVOEZiZEExREY1?=
 =?utf-8?B?RDd5ZmpkT1pQY1JOSzVLa1ExcXRzZWloQUdwN2VkZzRKTjlYblFNQWo1K0dE?=
 =?utf-8?B?ZkVSbkRNSmhtZkVrNUtFTGxiYkowb0ROb1NnbWV0SkRTZWt1eWZ3cFQyaVA0?=
 =?utf-8?B?bHd3clY2ejJoVlVGMTcxM3NqcnNQVHVhT09sWUlYYUU5RzkzUDdDQmhOS0pk?=
 =?utf-8?B?ZytEUzRoc0t3MUZPelFmUGF5a3hHYStmZDV1V1l0NEVPYlFuOFhTbEo0dlQ1?=
 =?utf-8?B?UmkyUHU5b0xtbTc3TjcxdTA0SU4zdzlKTDJTdUt5V1NnVzdKaEd4VUVqK0hH?=
 =?utf-8?B?a3VqdWtPOGN2dFpKZVA2d2kvcDkyNGp2dWtCdVh1cXhRWHZiejVXVU1Ca2t4?=
 =?utf-8?B?b3RLcklPWUl4QytXYnFWdVFKbzIyQXUvdmFvNFVUb3ZMamtBNlZva3NSbmR3?=
 =?utf-8?B?engxcjF3Z21LU29ra1pPT3RLWE5VQzloNzd3NjVhZlJQU0VnTVEwN2tTVEZ6?=
 =?utf-8?B?ZStGN2NROHp6UU5zSnlselh3bkhLUXdtQlJZQXI3TmJ1Rm10aDh6VkFyUUJK?=
 =?utf-8?B?OTg5RjdKR0tnU3IzT0ZucUJPRytqcC8zNytpSitaSU1FbGxrRTBEcUJRU0ox?=
 =?utf-8?B?Mm1ac3JLbkMzWGtFSDZqNSthczFIWUlTdnNQMTlvTlZQTkV3THVhN0M1WTFP?=
 =?utf-8?B?cndVTmgyc3ozcTVXUEEySXo4U1BpWEZuL01VV25FYndBWjZjSUdFZk92TnFs?=
 =?utf-8?B?L2tFanhlSjVwMkNIMGpFZE4xTGFITC9sc2s3WkcrSGFnVmJXLzhnZXhHQ0xz?=
 =?utf-8?B?azh3RytzdHJYSTNnakNibWJKTzEwMUkwTjdDMVB0d1E0SWd0bUdWUGhnZjdG?=
 =?utf-8?B?UHE0MDM3OXFaeU5UbFU1NU1mZ2tvemRKZllJTnVMUXBnWlR0Z0l0UFlGd2lw?=
 =?utf-8?B?TStSajZ3V1krOFBFT2hRWXBaeGU4Vmh3eFUyQUdmUU4wZDRwR0VObjlHajZL?=
 =?utf-8?B?ZW0xTkprcSszWjJoekFJL2FEM3lvUFF6azM2UGZOcXkvbGxrejFXTmgrWmNF?=
 =?utf-8?B?d2pRRDlvejJPS1hJaGtLQ0NIR1NyMzFhZFBMeEd4RXVSUG5wTmZOQTVETmpi?=
 =?utf-8?B?azBicEtlRDBWZnphOXlzdkllbVQrb3QwOUVwU1Jvdm02VnJ1Q3pwKzRxQ3py?=
 =?utf-8?B?cFZ4RThWTnVka2RlMThNNjJMeGcyMnZ3UFBZWWhxZFprR0hoMG8rZjYwSzkr?=
 =?utf-8?B?QU1MSXlMckVwQWNvTnRxVjNqK25aWUJFNklUS1o4NS9aeURkVW95U2gyMGht?=
 =?utf-8?B?M1NaZENybkZGSzFWaUpVTVBFeEh1RnozWG5WajNKRVIvQ1kraUV2UC9sVnZN?=
 =?utf-8?B?NkVCZCtiT3pCSFB4TXgyWUFOSHZUWXJ1NS83UVNvenRQRzM2MDB4UGhncjFx?=
 =?utf-8?B?Ny9vWlF4R3l5Z0VrbnRaeW41Zit4WHJOc0E5NWdDWnRLMkMycHJvZ2RXVzJo?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7a91aa-385e-41a9-19c9-08dbf7a21df1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 03:59:46.5568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1PUQo5c1ldxTcxkcPQblOk4MdEhdk86xum6qkc6OQfhJAKgk2xfOQ6mcRoIOpSogHpgyLpb49SnyvubRrpsd3nfsrHJUEO6bijpTO1R5Cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5347
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--------------QPD0SUbzBGYxLfFiusdplt1X
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-12-2023 03:57, Matt Roper wrote:
> On Wed, Dec 06, 2023 at 10:01:19AM +0530, Himal Prasad Ghimiray wrote:
>> Each byte of CCS data now represents 512 bytes of main memory data.
>> Allocate extra pages to handle ccs region for igfx too.
> This description seems confusing.  Explicitly allocating memory for CCS
> data sounds more like the legacy AuxCCS rather than FlatCCS.  For
> FlatCCS, the storage for the CCS data is already pre-allocated at a
> well-defined location (I'm assuming it's in some kind of stolen memory
> on an igpu?

On Igpu flat ccs is iGPU firmware reserved memory. Driver needs to 
allocate extra

system memory to hold ccs metadata while evicting.

>
> On discrete GPUs, if a surface was being migrated from LMEM to SMEM,
> then you'd probably need extra storage for the SMEM copy.  But that
> doesn't seem like it would be relevant to an igpu since there's no
> lmem<->smem migration happening.

Incase of igfx we need to store flat cccs metadata when bo is moved 
in/out of

gpu domain.  CCS metadata needs to copied from flat ccs region to extra 
pages allocated

in bo when bo moves from gpu domain to system domain and vice-versa.

>
> As a general comment, it might be worth starting this series with a
> patch that describes and documents how FlatCCS actually works on an
> igpu.  Since the main surfaces are in smem rather than a separate lmem
> area, how does the CCS work?  Where does the CCS data live and how are
> addresses of main surfaces (in smem) translated to CCS offsets?  Is
> there CCS space set aside for the entire SMEM physical address space,
> even though a lot of that memory is going to be used for non-graphics
> purposes?
>> Bspec:58796
>>
>> v2:
>>   - For dgfx ensure system bit is not set.
>>   - Modify comments.(Thomas)
>>
>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
>>   drivers/gpu/drm/xe/xe_bo.c                | 14 +++++++++-----
>>   drivers/gpu/drm/xe/xe_device.c            |  2 +-
>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> index f1c5bf203b3d..1f9c32e694c6 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>> @@ -16,7 +16,7 @@
>>   #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
>>   #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
>>   #define   NUM_CCS_BYTES_PER_BLOCK	256
>> -#define   NUM_BYTES_PER_CCS_BYTE	256
>> +#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) >= 20 ? 512 : 256)
> Changes like this that change platform-specific Xe1 vs Xe2 details
> should probably be kept in a separate patch from the more general
> "support FlatCCS on an igpu" work happening here.

Seperate out this change into another patch.

BR

Himal

>
>
> Matt
>
>>   #define   NUM_CCS_BLKS_PER_XFER		1024
>>   
>>   #define XY_FAST_COLOR_BLT_CMD		(2 << 29 | 0x44 << 22)
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 72dc4a4eed4e..81630838d769 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -2173,8 +2173,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>>    * placed in system memory.
>>    * @bo: The xe_bo
>>    *
>> - * If a bo has an allowable placement in XE_PL_TT memory, it can't use
>> - * flat CCS compression, because the GPU then has no way to access the
>> + * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
>> + * use flat CCS compression, because the GPU then has no way to access the
>>    * CCS metadata using relevant commands. For the opposite case, we need to
>>    * allocate storage for the CCS metadata when the BO is not resident in
>>    * VRAM memory.
>> @@ -2183,9 +2183,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
>>    */
>>   bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
>>   {
>> -	return bo->ttm.type == ttm_bo_type_device &&
>> -		!(bo->flags & XE_BO_CREATE_SYSTEM_BIT) &&
>> -		(bo->flags & XE_BO_CREATE_VRAM_MASK);
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +
>> +	return (xe_device_has_flat_ccs(xe) &&
>> +		bo->ttm.type == ttm_bo_type_device &&
>> +		((IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_VRAM_MASK) &&
>> +		  !(bo->flags & XE_BO_CREATE_SYSTEM_BIT)) ||
>> +		(!IS_DGFX(xe) && (bo->flags & XE_BO_CREATE_SYSTEM_BIT))));
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 400fa1ac6168..50c87f03c51c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -605,7 +605,7 @@ void xe_device_wmb(struct xe_device *xe)
>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
>>   {
>>   	return xe_device_has_flat_ccs(xe) ?
>> -		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
>> +		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
>>   }
>>   
>>   bool xe_device_mem_access_ongoing(struct xe_device *xe)
>> -- 
>> 2.25.1
>>
--------------QPD0SUbzBGYxLfFiusdplt1X
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-12-2023 03:57, Matt Roper wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">On Wed, Dec 06, 2023 at 10:01:19AM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Each byte of CCS data now represents 512 bytes of main memory data.
Allocate extra pages to handle ccs region for igfx too.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This description seems confusing.  Explicitly allocating memory for CCS
data sounds more like the legacy AuxCCS rather than FlatCCS.  For
FlatCCS, the storage for the CCS data is already pre-allocated at a
well-defined location (I'm assuming it's in some kind of stolen memory
on an igpu?</pre>
    </blockquote>
    <p>On Igpu flat ccs is <span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">iGPU
        firmware reserved memory. </span>Driver needs to allocate
      extra&nbsp;</p>
    <p>system memory to hold ccs metadata while evicting.</p>
    <p><span style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span></p>
    <blockquote type="cite" cite="mid:20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

On discrete GPUs, if a surface was being migrated from LMEM to SMEM,
then you'd probably need extra storage for the SMEM copy.  But that
doesn't seem like it would be relevant to an igpu since there's no
lmem&lt;-&gt;smem migration happening.</pre>
    </blockquote>
    <p>Incase of igfx we need to store flat cccs metadata when bo is
      moved in/out of</p>
    <p>gpu domain.&nbsp; CCS metadata needs to copied from flat ccs region to
      extra pages allocated <br>
    </p>
    <p>in bo when bo moves from gpu domain to system domain and
      vice-versa.<br>
    </p>
    <blockquote type="cite" cite="mid:20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">

As a general comment, it might be worth starting this series with a
patch that describes and documents how FlatCCS actually works on an
igpu.  Since the main surfaces are in smem rather than a separate lmem
area, how does the CCS work?  Where does the CCS data live and how are
addresses of main surfaces (in smem) translated to CCS offsets?  Is
there CCS space set aside for the entire SMEM physical address space,
even though a lot of that memory is going to be used for non-graphics
purposes?
</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Bspec:58796

v2:
 - For dgfx ensure system bit is not set.
 - Modify comments.(Thomas)

Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  2 +-
 drivers/gpu/drm/xe/xe_bo.c                | 14 +++++++++-----
 drivers/gpu/drm/xe/xe_device.c            |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
index f1c5bf203b3d..1f9c32e694c6 100644
--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
@@ -16,7 +16,7 @@
 #define   XY_CTRL_SURF_MOCS_MASK	GENMASK(31, 26)
 #define   XE2_XY_CTRL_SURF_MOCS_INDEX_MASK	GENMASK(31, 28)
 #define   NUM_CCS_BYTES_PER_BLOCK	256
-#define   NUM_BYTES_PER_CCS_BYTE	256
+#define   NUM_BYTES_PER_CCS_BYTE(_xe)	(GRAPHICS_VER(_xe) &gt;= 20 ? 512 : 256)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Changes like this that change platform-specific Xe1 vs Xe2 details
should probably be kept in a separate patch from the more general
&quot;support FlatCCS on an igpu&quot; work happening here.</pre>
    </blockquote>
    <p>Seperate out this change into another patch.</p>
    <p>BR</p>
    <p>Himal<br>
    </p>
    <blockquote type="cite" cite="mid:20231206222750.GQ1327160@mdroper-desk1.amr.corp.intel.com">
      <pre class="moz-quote-pre" wrap="">


Matt

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> #define   NUM_CCS_BLKS_PER_XFER		1024
 
 #define XY_FAST_COLOR_BLT_CMD		(2 &lt;&lt; 29 | 0x44 &lt;&lt; 22)
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 72dc4a4eed4e..81630838d769 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -2173,8 +2173,8 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  * placed in system memory.
  * @bo: The xe_bo
  *
- * If a bo has an allowable placement in XE_PL_TT memory, it can't use
- * flat CCS compression, because the GPU then has no way to access the
+ * For dgfx if a bo has an allowable placement in XE_PL_TT memory, it can't
+ * use flat CCS compression, because the GPU then has no way to access the
  * CCS metadata using relevant commands. For the opposite case, we need to
  * allocate storage for the CCS metadata when the BO is not resident in
  * VRAM memory.
@@ -2183,9 +2183,13 @@ int xe_bo_evict(struct xe_bo *bo, bool force_alloc)
  */
 bool xe_bo_needs_ccs_pages(struct xe_bo *bo)
 {
-	return bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
-		!(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT) &amp;&amp;
-		(bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK);
+	struct xe_device *xe = xe_bo_device(bo);
+
+	return (xe_device_has_flat_ccs(xe) &amp;&amp;
+		bo-&gt;ttm.type == ttm_bo_type_device &amp;&amp;
+		((IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; XE_BO_CREATE_VRAM_MASK) &amp;&amp;
+		  !(bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT)) ||
+		(!IS_DGFX(xe) &amp;&amp; (bo-&gt;flags &amp; XE_BO_CREATE_SYSTEM_BIT))));
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 400fa1ac6168..50c87f03c51c 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -605,7 +605,7 @@ void xe_device_wmb(struct xe_device *xe)
 u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 {
 	return xe_device_has_flat_ccs(xe) ?
-		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE) : 0;
+		DIV_ROUND_UP(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
 bool xe_device_mem_access_ongoing(struct xe_device *xe)
-- 
2.25.1

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------QPD0SUbzBGYxLfFiusdplt1X--
