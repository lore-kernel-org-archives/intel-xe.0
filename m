Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF41CDE00E
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 20:58:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53D10F37E;
	Thu, 25 Jun 2026 20:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQGoWzg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E3410F37E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782421117; x=1813957117;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ec/ZrVOmF6m91A0V6D9gwHHCoNPpysJUYtvSxWHkGIc=;
 b=hQGoWzg/H0FgLqvxA1tk580FrXwULUuP8YQXHKeQ3Tv87w5Ta0oD8HgO
 9hURZ4uQiWwgtdoOIza/BKOnOn/b8MVEl1/b3TraIaM8C5w8J/C39Ui8X
 yDU6aKe/JczgrSbYmECduHFbmCMOyuMMoyDUixhS09rWmF3m4aURBMNfT
 hvyj+lWlE7nHRvnQ1k6LjjL606TopHslSfD2zKp+P+hW6Iw4XVqEEX1wy
 i1XQ8QyIF7/yzMG5pMLEFtsmGQYjaYuTj+fyZBQLXaKhbsYlujJvEUW1A
 XxEgjJstT2JCTyLd8koljmgFXapQb+FnFz2eJ+L74gGi1OP2kG29qsRWe Q==;
X-CSE-ConnectionGUID: Z9iVDEnjTBG6kyNKUqKjFg==
X-CSE-MsgGUID: Iz/md6WYRJC1Ds2SIxsEbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="106009988"
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="106009988"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:58:36 -0700
X-CSE-ConnectionGUID: tTtqPh2fS6+CEg3XGkdz7w==
X-CSE-MsgGUID: fTfHeeW3RnyWbJWxunyBAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,225,1774335600"; d="scan'208";a="244654205"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 13:58:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:58:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 13:58:35 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 13:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FazXaJA1YxmE0MjzkpcaE/JtL+PMbm5vw+KEI9Gs6K7NgsBR0saxcHHpTyIWvrfk/pvh0bbqYPDaduZ9jFi9Gkf18W3kl5AOOaSSlcq2ebNDDHMXNxTbrzaAYfLtE3CyjJOlpXjUCc0SzdP2rB33gyzqRzuhs8obdcLb4AhGuiEYKF7GpKBiKxIc1FDS4ahFWMDZD1U+MSi6jSuqqaP/JBx6ETNhwshslaIflsocG8jVawedr+i0+JO3FH6NsZxwS4gmNUFe0XT3MBmFPb5P/8pE0HCALMbQu2DhcougxPZ3sgUch9r+qtCEJt09cJHDsIWauVXVE+URoue8otXjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kt4nRtQsRW/vInY5mxqlY7nXgQ9BUYSKgQW2KRHgjs=;
 b=i0AZ2IR2k/Qkrki11VW6NnPnMY5cShsAUWI98IAO1oMHgwFE68nZdceWfj79tYnXGI5N3qCPQA9OanBuDEIPW0tdob+vCc6/3QrKAS+UmE7di83x+/X4d1vIFLVTPMY50UR46sf4zNJpmaj0ylXpnbbDYwWL0iW8nQlsKAF6JEHhX6gTGR9iAifBYUPMMA5dHJM/Afo56rDlsAeGgWI5sbFffbgiRWKFvNa4Lpf89oSOJAWNwaEtDgzGnt+QFDHIN9NTvaE3zuvdfCGpZrVAUlDzJPjQHkcFjcT+Gbnx3qRHS6LDAa8W6zKFUONoVopp5gsyupmbkG9G9CRCd483BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Thu, 25 Jun
 2026 20:58:29 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 20:58:29 +0000
Message-ID: <63fd304b-9b4d-4d8a-b609-25a807050448@intel.com>
Date: Thu, 25 Jun 2026 13:58:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/10] drm/xe/vf: wire up NUM_PAGING_ENGINE_INSTANCES
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20260611161634.506476-12-matthew.auld@intel.com>
 <20260611161634.506476-20-matthew.auld@intel.com>
 <b67be657-cfd7-4dbb-ac4d-734ef6214b6f@intel.com>
 <172ca7a0-4860-4aa3-b0c2-9afb788d6613@intel.com>
 <47058937-f35e-4856-89ca-f1e2f5087f55@intel.com>
 <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
Content-Language: en-US
In-Reply-To: <b992c4c5-4934-4015-b6e6-f8d13435d415@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0372.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::17) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: f1514064-40a9-41a5-3ef0-08ded2fc828e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: t0KXRTEgl8VuSNd1/g7DywY47gtzVPzPGQK86Ear0I1Crt3jE4f8XVZ2CuCLI9ZsDnWI80G8jR66utT0Eu9IftIbCUKbV+KiNDe0zTuAUNmpa/cD54ynroGMJW5UU9SlQaZb62AmQWU935M27KFK1gv60IIcTPtQWTLUMzgp10hh1b2qI0JEO2SDrB0I8XoWlDvZMKorGVWHfqgdxblN6Skg4QSbfVRJbTkUFEqrlwQTt+Ci0Is4B67PCoi+yDmiT83k5kXDwbYdAAF0rUjv28s++CtcPd17bK3ZrOiw/pNw7oDS8suI1SGhKZ5HICLcuMMOTIAl48b92WYbv8AJeFgT+E7zN8gici9HELCQa0HzNYio7cYljS5Zhtz3zMajXnuI0r1h+Ay1Gk2OJkr79nVo5K00mesWugeiOgV/3S6xghjnSo67cFXylFZCoabvwpPoIf+8AL34JIzehFnjAdEbQjoa6TLdU0Kbyx5bBE8+0TF/GrRchrmi9IOXpEionowxhm2uxwUTuKywoJ/cEBRfG6AVDL5Orv+qhuqZeXRDJnCsQachTOnXEDfRtnSseVACbI/B3ciaG3cVJKi9un+v2CDnEE54G+5yo+5yOYTGKAUUbFD2iZzRPiiLxeSeMyj2edO1pdEw2w0Qs6Iv8X0zrhyLMIzknFOxUkSVGgY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzNMdC9FU0UreU4remx0MUFFcU5FUHFYcHJUc3V0WDFPSDNjSSszOEN3ZG1F?=
 =?utf-8?B?ZGtsamlKVFdxZEpCMENUcFE3MmNiNys5aGlGWXhHd3JDOTZlY01Kdkt2d3Fi?=
 =?utf-8?B?U1FadFc5UHdmek5aQVRTbnROWENBalBDUjdYMTFnd1hOelMwOHlmaXlSR2ho?=
 =?utf-8?B?aHppcjIwTG85QlI5VitWUVRuSEpiV004NzJ2VmtFWkdXZEZja0daT3BERWlD?=
 =?utf-8?B?MGd5YzJqZkRzZk1qR3JaeGRqMkg0WjJSYlRvRUpCS0ZLek90VjZyUG1aRFh3?=
 =?utf-8?B?VXBKRTVYQTFoUE52UDdoRXlpVE13VE9pcXYrcmNQeGNCeW9oaUxYdDFBV2w3?=
 =?utf-8?B?Z3F4YXZXZThBR0tWUDVlRHQzTXY5M29LeFphdUFMOEZQVE0rUkNBRGlFUUFa?=
 =?utf-8?B?MUJyNjBJQXBNTjJoNjhBZEdwRzJ0ZGc4dVBvdVViei9MbUZ0Y3dlbzBVTlNj?=
 =?utf-8?B?MHc2eHIwb1NURDZsYXkwa0wxYjltTWM1dnU2RGp0bVZRVXBZbXNuaDJHSnFZ?=
 =?utf-8?B?bzZEdWd6TjZsT0tjejBGY2x5QjdZc1dtYjFnMk9LRFplbW5lRmhrbVNnMjlj?=
 =?utf-8?B?bGlRNFNWR28wNW9qUXVDV09ncFltdEFLK3UzRVI5OCtDck0yNVJrM0diMHlo?=
 =?utf-8?B?ZXlUakx6R1BMNFozNGpmelNwT3VrRStUT3FYMXloa1I2aGtjZTNTQ29jU3Z0?=
 =?utf-8?B?TmJOVGxSWmk2NEVjMkFUaS9lQ3V4OUYvMW1WVmxlbXk3K3psTHhtZHdYVDZE?=
 =?utf-8?B?L0ZxVEJpSlRiS2tVT0dQbWJrZU1EL3RPQ21sdCtuZ0gvS3BIVFBsaG82cnRE?=
 =?utf-8?B?a2cwTDIrRnlteHNlRG94Y21uZmp6aWVReEtHTzJnQ0hYQzJvWW82bko3a3Iy?=
 =?utf-8?B?RjQrZkF5alVmTm96RXhTTis2bU8yNmFYYWtlNzMyd1EvSFlHSDNJa3h3WE5p?=
 =?utf-8?B?N1BMVUwzdlk4NDZJT2FTNlpTM1dVVmhQM3dFbGtLTEgxVjAzNzNkc1VFTWQ1?=
 =?utf-8?B?T1RNKzg2djhtbWNTWlhIbnBoSXdtdDlTOFhJL2Myb1QxT1FRZyt1UmdFWnVX?=
 =?utf-8?B?U2N6OU5laXJ6MGhLZUxIblBKZnFxdUljT2lYT3hzU2V0SEE3VHRFMFZMaXVi?=
 =?utf-8?B?dlZmTmZRbEUvdkpxcEFKa0Z4QUtZaHlwY0s2cHZUYmdCeU5ZSXgrUGN6OEdn?=
 =?utf-8?B?QlF2OVViQWZIN1ZuSE9td1kzdXJObzBLdG9Jc0M4NHBWeXdOWGczeUtpdlFB?=
 =?utf-8?B?R2F4VWdWNlA4a0ExeHFMKzNPMWR4UjZERFBtS2djYVltcWVXTUVFSGRENjg2?=
 =?utf-8?B?dzQ1YkFQcjlTUkZQVHZhMG8xYlhEakNTYjJvOHhrdE0yYzU2N1BOQ2o1djJi?=
 =?utf-8?B?WGZwcmZlbG91ZGQ1WEI0SlZoVWhPU3BvbVlEbTQ5OThjSHo4MGdxWEhHN1B2?=
 =?utf-8?B?c2pnQXN2Y05Oa2UvVVkvRVhmZlVzZllyRE9CR3o1ZVZQYUU5eTAwd0pJSkQ0?=
 =?utf-8?B?VXNrakxtYVg1Y3l2M2ltaDdrNTlUb1lOVVB5bDJqdEhjVjI3RVhVVGxPYTRB?=
 =?utf-8?B?QW05R1BpUkl5UGtxUFBmSjIwVXBRU01XQXlieGxFNjB5blBrSDJSZUtubVlu?=
 =?utf-8?B?eHpFMkV4dkpmM2FkVXhEYTRaVVNjblMwZTVmU096YnU3cjllUDJXQ2NrSjMr?=
 =?utf-8?B?MjRTUFFhME83SDV5ZFcrdzhkV1JCaVZMa1dQVGJSVWx3eHVJWEM5R0xqREhM?=
 =?utf-8?B?eXVvemIzRDZZNXRnRnNaN3QxWmVtaHZLUStWNUx3MHU3WWZCbzQ1Y1hUTWRO?=
 =?utf-8?B?eFFvRmNickhtVTl1aERqUkJTUW03bjhHUmswMlYyTnhqNCsvb3dhNy9lS08x?=
 =?utf-8?B?bnUyQnZiK1dUajZPTFhhWjZVck81bnBaaVVVQmQ1LzRBUFo5aGRzeThtKy92?=
 =?utf-8?B?eTFnQnRtcWJGckxRaEp0dld3dGxSckttalRZWU5WNmtNOGtiYjVyY1JqU3ZX?=
 =?utf-8?B?Q3hQVlFqa3dpbmlxczF4bHpyRUpGTjRnMi9qMS9IaW9lQVg3bWt4cERJOWhn?=
 =?utf-8?B?SUxpTkpRSUVTV2JXL2NtdFY5Q210NDdJVlUwZVJNajJzREdMWEJ4ME1KV2pV?=
 =?utf-8?B?VjlIVjM3cWo1U0VsaEFvQ2NxdmNqSFc0eUllWmpxamlvZ0hubGZvMi9jMFhv?=
 =?utf-8?B?dDh4RHBWQjlqcGVWeVVzNkRIdlVHVWFFWG5yN3c0Zk4wOS9CZFJvNkc3Z3Vi?=
 =?utf-8?B?MHhHTm5UdWN5VzF6YWZCQ3pueXQ1b2kxR0RzeGcwb1Y5OExaYTNxYTBkaktL?=
 =?utf-8?B?T2dMaG4yNUhXZThtaUZ4ZGJxQW1FOGJNL25URXRLbUttOHdrOFQvWWJpbXBt?=
 =?utf-8?Q?EPWSX+SLkz1GC5RM=3D?=
X-Exchange-RoutingPolicyChecked: Ovv1vg1aa6L5tQpqe9hG/aBjkd7aNpKLYgUNEC6BRSC22+puwr+QZRJ8wWgqK4ahN3e9f8Ejz4QKB369VA1sFY51KdZfcIpb9s1cmn60xKqUnySbn0d4jmrj6gxawnt9y+2bgLtBFoVttLufcfkdhNXxaW+xEXQJ9PRzaf6id7x4TlQgJnJbINoQxKUw/vfcqQFQm5CUhFg1l+e0C/eGFpd6qGMmBkKQBZMSZi3dq3oEt+5D9hBrjdGflJBZ1I4qW6otqRTCqV4WAbkrAPt/0uX8NpUh+z0QjDjbp0SKgsWzUVJ3MrxyUT6MpDc7wTvQAaZeibhYBTOv9AzoW86t4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1514064-40a9-41a5-3ef0-08ded2fc828e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 20:58:29.8484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DJnpcaVM+bvc1zO26Gm1AXWWQ1VNDKuXm1UPiIDDGo+Ym+0Aatix4pVH/MfMdsEsOBxdtzCYGhdBPzFuDQJEF8Krz5PeVAzK+izHDxjwIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
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



On 6/25/2026 1:53 PM, Daniele Ceraolo Spurio wrote:
>
>
> On 6/25/2026 1:40 PM, Michal Wajdeczko wrote:
>>
>> On 6/23/2026 7:50 PM, Daniele Ceraolo Spurio wrote:
>>>
>>> On 6/23/2026 9:28 AM, Michal Wajdeczko wrote:
>>>> On 6/11/2026 6:16 PM, Matthew Auld wrote:
>>>>> When host PF writes the logical configuration for the GUC PAGING 
>>>>> engine,
>>>>> the VF is meant to query it, and mirror it. Size of N means we have
>>>>> paging logical index range [0, N-1], with N fewer normal copy 
>>>>> engines.
>>>>>
>>>>> Agreement is that PF will only spawn PAGING engines on NVL-S+, so 
>>>>> this
>>>>> should be zero on older platforms, where we should simply fall 
>>>>> back to
>>>>> the old behaviour.
>>>>>
>>>>> v2 (Sashiko):
>>>>>     - We can't call use the guc_has_paging_engine() this early in 
>>>>> the VF
>>>>>       code. With that just unconditionally do the query, if the 
>>>>> GuC is new
>>>>>       enough and take the value as-is. With that drop the -1 
>>>>> special case and
>>>>>       just let the upper layers figure out the rest.
>>>>> v3:
>>>>>     - Also update xe_guc_klv_key_to_string. (Michal)
>>>>>     - Add kernel-doc for xe_gt_sriov_vf_paging_engines(), plus other
>>>>>       tweaks. (Michal)
>>>>>     - Update with final GuC version.
>>>>> v4:
>>>>>     - Just fallback to manual reserve when vf reported paging 
>>>>> engines is
>>>>>       zero. Will revisit in the future.
>>>>>
>>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>>>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/abi/guc_klvs_abi.h     |  9 +++++
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 47 
>>>>> +++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  1 +
>>>>>    drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++
>>>>>    drivers/gpu/drm/xe/xe_guc_klv_helpers.c   |  2 +
>>>>>    drivers/gpu/drm/xe/xe_hw_engine.c         | 30 ++++++++++++++-
>>>>>    6 files changed, 91 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h 
>>>>> b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> index 644f5a4226d7..753c049d2fc8 100644
>>>>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>>>>> @@ -52,6 +52,12 @@
>>>>>     * _`GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE` : 0x3001
>>>>>     *      Tells the driver whether scheduler groups are enabled 
>>>>> or not.
>>>>>     *      Requires GuC ABI 1.26+
>>>>> + *
>>>>> + * _`GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES` : 0x3003
>>>>> + *      Tells the driver the paging engine configuration.
>>>>> + *      Paging engine logical instances are guaranteed to be 
>>>>> dense starting at
>>>>> + *      index 0.
>>>>> + *      Requires GuC ABI 1.36+
>>>>>     */
>>>>>      #define GUC_KLV_GLOBAL_CFG_GMD_ID_KEY 0x3000u
>>>>> @@ -60,6 +66,9 @@
>>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY 0x3001u
>>>>>    #define GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_LEN    1u
>>>>>    +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY 
>>>>> 0x3003u
>>>>> +#define GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_LEN    1u
>>>>> +
>>>>>    /**
>>>>>     * DOC: GuC Self Config KLVs
>>>>>     *
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c 
>>>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> index 0cd9d77f3351..0a11e63f470b 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> @@ -658,6 +658,33 @@ static int 
>>>>> vf_cache_sched_groups_status(struct xe_gt *gt)
>>>>>        return 0;
>>>>>    }
>>>>>    +static int vf_cache_num_paging_engines(struct xe_gt *gt)
>>>>> +{
>>>>> +    struct xe_guc *guc = &gt->uc.guc;
>>>>> +    struct xe_uc_fw_version guc_version;
>>>>> +    u32 value = 0;
>>>>> +    int err;
>>>>> +
>>>>> +    xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>>>> +
>>>>> +    if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 36, 0))
>>>>> +        return 0;
>>>>> +
>>>>> +    err = guc_action_query_single_klv32(guc, 
>>>>> GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY,
>>>>> +                        &value);
>>>>> +    if (unlikely(err)) {
>>>>> +        xe_gt_sriov_err(gt,
>>>>> +                "Failed to obtain the number of paging instances 
>>>>> (%pe)\n",
>>>>> +                ERR_PTR(err));
>>>>> +        return err;
>>>>> +    }
>>>>> +
>>>>> +    gt->sriov.vf.runtime.num_paging_engine_instances = value;
>>>>> +
>>>>> +    xe_gt_sriov_dbg(gt, "num_paging_engines %u\n", value);
>>>>> +    return err;
>>>>      return 0;
>>>>
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * xe_gt_sriov_vf_query_config - Query SR-IOV config data over 
>>>>> MMIO.
>>>>>     * @gt: the &xe_gt
>>>>> @@ -694,6 +721,10 @@ int xe_gt_sriov_vf_query_config(struct xe_gt 
>>>>> *gt)
>>>>>        if (has_gmdid(xe))
>>>>>            vf_cache_gmdid(gt);
>>>>>    +    err = vf_cache_num_paging_engines(gt);
>>>>> +    if (unlikely(err))
>>>>> +        return err;
>>>>> +
>>>>>        return 0;
>>>>>    }
>>>>>    @@ -731,6 +762,22 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>>>>>        return gt->sriov.vf.self_config.num_ctxs;
>>>>>    }
>>>>>    +/**
>>>>> + * xe_gt_sriov_vf_paging_engines - Query the number of paging 
>>>>> engine instances
>>>> nit: we don't do any query here
>>>>> + * @gt: the &xe_gt
>>>>> + *
>>>>> + * This function is for VF use only.
>>>>> + *
>>>>> + * Return: number of GuC paging engine instances configured by 
>>>>> the PF.
>>>>> + */
>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt)
>>>>> +{
>>>>> +    xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>> +    xe_gt_assert(gt, gt->sriov.vf.guc_version.major);
>>>>> +
>>>>> +    return gt->sriov.vf.runtime.num_paging_engine_instances;
>>>>> +}
>>>>> +
>>>>>    static int relay_action_handshake(struct xe_gt *gt, u32 *major, 
>>>>> u32 *minor)
>>>>>    {
>>>>>        u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h 
>>>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> index 79878f21b1da..d171a8242a34 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> @@ -31,6 +31,7 @@ u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>>    u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>>>>    u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt);
>>>>>    bool xe_gt_sriov_vf_sched_groups_enabled(struct xe_gt *gt);
>>>>> +u32 xe_gt_sriov_vf_paging_engines(struct xe_gt *gt);
>>>>>      u32 xe_gt_sriov_vf_read32(struct xe_gt *gt, struct xe_reg reg);
>>>>>    void xe_gt_sriov_vf_write32(struct xe_gt *gt, struct xe_reg 
>>>>> reg, u32 val);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h 
>>>>> b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> index 80562ffadb16..21cb9bc1a341 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> @@ -40,6 +40,10 @@ struct xe_gt_sriov_vf_runtime {
>>>>>            /** @regs.value: register value. */
>>>>>            u32 value;
>>>>>        } *regs;
>>>>> +    /**
>>>>> +     * @num_paging_engine_instances: number of configured paging 
>>>>> engines.
>>>>> +     */
>>>>> +    u32 num_paging_engine_instances;
>>>> nit: can we move this up near .uses_sched_groups
>>>>
>>>>>    };
>>>>>      /**
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c 
>>>>> b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> index 97600edda837..be992b8da9a1 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc_klv_helpers.c
>>>>> @@ -24,6 +24,8 @@ const char *xe_guc_klv_key_to_string(u16 key)
>>>>>        /* GuC Global Config KLVs */
>>>>>        case GUC_KLV_GLOBAL_CFG_GROUP_SCHEDULING_AVAILABLE_KEY:
>>>>>            return "group_scheduling_available";
>>>>> +    case GUC_KLV_GLOBAL_CFG_NUM_PAGING_ENGINE_INSTANCES_KEY:
>>>>> +        return "num_paging_engine_instances";
>>>>>        /* VGT POLICY keys */
>>>>>        case GUC_KLV_VGT_POLICY_SCHED_IF_IDLE_KEY:
>>>>>            return "sched_if_idle";
>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c 
>>>>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>> index 4d7cb8b54b4b..1227b9e66fd6 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>>>>> @@ -650,7 +650,7 @@ static int hw_engine_init(struct xe_gt *gt, 
>>>>> struct xe_hw_engine *hwe,
>>>>>        return err;
>>>>>    }
>>>>>    -static void hw_engine_setup_logical_and_paging_mapping(struct 
>>>>> xe_gt *gt)
>>>>> +static int hw_engine_setup_logical_and_paging_mapping(struct 
>>>>> xe_gt *gt)
>>>>>    {
>>>>>        struct xe_device *xe = gt_to_xe(gt);
>>>>>        unsigned int num_copy_engines = 0, num_paging_engines = 0;
>>>>> @@ -667,6 +667,27 @@ static void 
>>>>> hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>        if (num_copy_engines && xe->info.has_usm)
>>>>>            num_paging_engines = 1;
>>>>>    +    if (IS_SRIOV_VF(xe)) {
>>>> maybe:
>>>>
>>>>      if (IS_SRIOV_VF(xe) && xe->info.platform >= XE_NOVALAKE_S) {
>>>> or
>>>>      if (IS_SRIOV_VF(xe) && xe_uses_paging_class(xe)) {
>>>>
>>>>> +        u32 vf_num_paging_engines;
>>>>> +
>>>>> +        /*
>>>>> +         * PF could in theory reserve multiple paging engines, which
>>>>> +         * internally the submission/scheduling backend can load 
>>>>> balance
>>>>> +         * from. Not something we currently expect, but we are at 
>>>>> the
>>>>> +         * mercy of the PF, so we just need try our best to 
>>>>> mirror the
>>>>> +         * paging configuration.
>>>>> +         */
>>>>> +        vf_num_paging_engines = xe_gt_sriov_vf_paging_engines(gt);
>>>>> +        if (vf_num_paging_engines) {
>>>>> +            /* This should only be non-zero on NVL-S+ */
>>>>> +            xe_gt_assert(gt, xe->info.platform >= XE_NOVALAKE_S);
>> missed this one: I'm not sure we should use assert here:
>> it's not our fault after all, but it's misbehaving PF,
>> so either we silently live with that or abort
>>
>>>>> +            num_paging_engines = vf_num_paging_engines;
>>>>> +        }
>>>> hmm, so what should we do if vf_num_paging_engines is actually 0 on 
>>>> NVL-S+?
>>>>
>>>> can it be due to GuC FW being older that 1.36 on NVL-S+?
>>>> can PF skip programming paging class on NVL-S+?
>>> PF can indeed skip programming the paging class and that is a valid 
>>> (although currently unexpected) scenario.
>>>
>>>> maybe 0 on NVL-S+ is a good reason to abort the probe?
>>> The expectation from the GuC side is that if PF has reserved a 
>>> paging engine then VF must match it, but if PF hasn't reserved a 
>>> paging engine then VF is free to reserve a BCS to do paging.
>> but then this paging engine on VF side will not be a paging CLASS, as 
>> the rest of the code may assume
>> or it doesn't matter for the VF?
>
> You're right that if we reserve a BCS (like we do now on current 
> platforms) then it needs to be submitted as a COPY class and not as a 
> PAGING class.
> It looks like xe_hwe_to_guc_class and xe_hwe_guc_logical_instance 
> might be unconditionally returning PAGING class on VF if we're on a 
> setup that supports it even if PF has not enabled it (unless I'm 
> missing something), so that might need to be updated.

I was indeed missing something :)
xe_guc_has_paging_engine(), which is used in both xe_hwe_to_guc_class 
and xe_hwe_guc_logical_instance to decide if COPY or PAGING class should 
be used, on VF returns true only if PF has reserved a paging engine (see 
patch 10); if no paging engines are reserved the code should 
automatically fall back to COPY class.

>
>>
>>>>> +    }
>>>>> +
>>>>> +    if (xe_gt_WARN_ON(gt, num_paging_engines > num_copy_engines))
>>>>> +        return -EINVAL;
>>>>> +
>>>>>        reserved_logical_bcs_start = num_copy_engines - 
>>>>> num_paging_engines;
>>>>>          /* FIXME: Doing a simple logical mapping that works for 
>>>>> most hardware */
>>>>> @@ -688,6 +709,8 @@ static void 
>>>>> hw_engine_setup_logical_and_paging_mapping(struct xe_gt *gt)
>>>>>                }
>>>>>            }
>>>>>        }
>>>>> +
>>>>> +    return 0;
>>>>>    }
>>>>>      static void read_media_fuses(struct xe_gt *gt)
>>>>> @@ -906,7 +929,10 @@ int xe_hw_engines_init(struct xe_gt *gt)
>>>>>                return err;
>>>>>        }
>>>>>    -    hw_engine_setup_logical_and_paging_mapping(gt);
>>>>> +    err = hw_engine_setup_logical_and_paging_mapping(gt);
>>>>> +    if (err)
>>>>> +        return err;
>>>>> +
>>>>>        err = xe_hw_engine_setup_groups(gt);
>>>>>        if (err)
>>>>>            return err;
>

