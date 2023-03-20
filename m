Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1129CC6FD1D
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 14:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54AF10E1CF;
	Mon, 20 Mar 2023 14:35:30 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14C8B10E1CA
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 14:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679322929; x=1710858929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sRrCWb+B+WOdY457pFO+AF20kzq4ywbkCVGNlf/UPJg=;
 b=fOazJFSXu9+cP1ea2Av3R6CkA84lrPTU884e0hd95gLTKMFx92ML3PDy
 B9f+2bros9C+V0oY6ZYtqkBYj5wbDqCObj9qD5shhGl4jfo+F/lqf5awz
 1l0TuQhPP5pwOX6YPZpXXZ1hAodLezSn7q/6FdmZohmTrc8KwssU615DO
 sjqQ8J7QYO0MjQKHCvFBfCrw3rUqoXqHOOEQz7qkKPxhfkIEMv98oVcxM
 Lg7u4O03LiVqk/oo7rwmD/e0JB6W7nGv44AtfctdTAYCtv9bwGlss7Ubz
 nXISysUfo1unQKaQ9zEyNsE7Oym41G1681cvZQMWIEMzkc1GG6tZa3Kca g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341035896"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="341035896"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 07:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="674405252"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="674405252"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 20 Mar 2023 07:35:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 07:35:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 07:35:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 07:35:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l13QrJP16bmgQcxx3Lc3XvS/PIP6PD21IludCG97rY9C2fnULjy19h5CD1ukPYwOLTCzmSLafCD9eW0ovrBKyRXJIudKnRMcvXS7a9djjuU92d0LgjIQfBvtu5prWZ80UxriFjjGRPJn7NRkNoV6+5Sgb9q3Eam9Wy/j2OEWGftiDy4DN+cm8meihjceHRjQeeSQBhnpYt7SuRMhvbw1j1QomaQnXwxMo5kC1zIIA+fwYCLnjsVVNqItDFMdH39T5NPe9vJVSK6L39ab2n4pnGDCuMqYbD4+ynWmHCSbBC9Dewucy8reR7QNkNQaXeIP7SAvnK+cdC8IhBwsTBjQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7L7dYfNv5uGAhQ771jwN0yVX9NZqucJQQDc/baB/oM=;
 b=XSqULmm6Wavnea8CTsBCMSPNqzIFA5icVk6XTWWBSlV/DamYasPnEnLZA42dwCsFa6dlzSr7BKo/7WgFw/DtQa+gqUNx4ZDSTbyCd0Vn83wZTyjZcZkV8ZX7/ee4jUKzrmviOhtip102Ky/ONgVeQrxIrvzv9B2yEHrodJzSFQV9pzwVkqn7zpCVuM8QbsdCYZHY4tFrWVFNwXFTDU5zvmDcsbLTGpfrUQ264eK2nJFheKYr/Pr40MwJoEJ5ZMxDvv+dgFlZr0PR3NkL2s6pfsB8HGjF4IqQAi4aupnT6GcY5+cTvmIHB2pLT2Sq/3OUraMESulhR0zwxwLS3V8beg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 14:35:26 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 14:35:21 +0000
Message-ID: <09b5dba2-e1d1-fc7a-fbae-7e4c49352ed2@intel.com>
Date: Mon, 20 Mar 2023 16:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-7-matthew.auld@intel.com>
 <0be67651-66f7-9e83-0c90-5c4e2a6bf363@intel.com>
 <1dbc1cf7-7e14-a007-55d8-d74bc4ba76e9@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <1dbc1cf7-7e14-a007-55d8-d74bc4ba76e9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR03CA0087.eurprd03.prod.outlook.com
 (2603:10a6:10:72::28) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e4ef1d0-72a1-493c-d3e7-08db2950559b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ej99YQzJImxVEd37PDBIGSIKU1FwqwAqggRWLvbDoRMgfYp+ytPPtz3O5d9KiI1Ko17f7MlyaiCtNUrLKjVwvYMqIg6glH2aVnpKM4QqjhBd3o05oPQiB4lrbmQ+dTXaIyHIxM/qeD7mpWp9fPsnhayBuBo3u3gr8M5NAs8mfPwk3svq/CXZ1L4oOs2WJK/0jplrXyyAiTutD652cBwJIQMWDxYbJOcyzh1gOMn8ZmFf8b69JisLatyrN2wzLKlAwoez94nK/xDrIeHDfkAtWpdw1wEe8TRqQ6fi6kurXT5k2I80761Qx/4Mhz6E9up9nEvayOQi7beVMG1wq520NgE5jiEERzxeANUI31aD1p5nDRs7kh2n6ZcS5yNFNYpQ6O9Y3Ff9YzCd1Cu3NeKz7lSXwShyqboDVf2xUhlwRbpaIuZyRshE4+OisxcEua3Jpp0jala3caDND8w6eJDc1fBiPAvK3YA/Ir6tL6TfBmjwMRO+O829sG4NMccffLJDB91ryjwBL5iV0FY7gKKbvC6ec9lUlsOgNKSk7JNwMKM1gklSo6qpGkX6C+liH00N9DPHCSeL0jnJf0mTD12nP3hRol7hWIoMpw6iNLbFPKoefEuPfqFw8tL2yXfhI4TrV2m0n1gLpiR+mXe2t1m5qhSmsKVWO9jvv/yp736Tk2q3nmEQboA9QyI6Phkt9MH/Nr93Z4Z9sdgxN4au5vwtsC4Zg031QCeN6sFbwlpVM0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(31686004)(38100700002)(86362001)(31696002)(82960400001)(2906002)(478600001)(107886003)(6666004)(316002)(2616005)(53546011)(36756003)(66556008)(66946007)(8676002)(4326008)(6506007)(6512007)(66476007)(41300700001)(26005)(8936002)(186003)(6486002)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRRbWU5Rm1YVlYzZDIzSERENTA0Z3g3b0Y0R1hXQU5wUXdScjNxbENNTEpL?=
 =?utf-8?B?V3cvbC9ZaWt5UkJEZXdhVGZjandMN253RE5KWmRNZ3hQOFBFcm10ckNhK00r?=
 =?utf-8?B?WEZPcmowNkNHcUx1eDltMDFlZlNsUU42dTZUSnF0dHIvbWVqYStKRU13amVa?=
 =?utf-8?B?VUMvdW8vTDF2SEt5SC9vaGJWY1JpQ05scVgwNTNMdnlDQXZYcURFdDIveVRj?=
 =?utf-8?B?MHh3N1dDUkk4QVB4UWxjZ1h1ZWp6allBN1BETE5iQngxSGY4WXc4OVhHZ2x3?=
 =?utf-8?B?SURsZWl0TmRML1E1czluUE5IQ2VwUWZqalQ2bFpDSHJxSEhEbEx5cG9JOFFV?=
 =?utf-8?B?dlNLTTVyRXlMUFFrUEtaMHBrNkwvY0VQaERhUENhZVRFY2NKOFdxU2JiYnZo?=
 =?utf-8?B?QUU5d2xRUTgrTU1xRktlTDExTEgxeExwRUlTbnRhaHFPdnI3WmJsOW1HVW1F?=
 =?utf-8?B?S1cxdWNpbjNiS0FyZ1R2eU4yK1dsektHQjJIMGc3YkJETnJ5anc4Y1BVVnZC?=
 =?utf-8?B?RTVac3ZqTGUwdVVNMURxWXdvOVF5T3EzRmJtYzNOSFBvMFhKM1d4eFZBSDZj?=
 =?utf-8?B?eHh0R0hLYm9ReUZ3Sm52WG9HRXdUK1hHT1RWLzJDanFXSzVFTko4OWRhZU9r?=
 =?utf-8?B?WStkQUdqYXorampleU5QNStpWHgxMmNtL3VBa0JsaFA4RGorWEtVclhnSlBS?=
 =?utf-8?B?NjVQdXdWQ1hnYWRiSlcrR2tQNGNrMWN0MytXU2ZEWkk3R3NoUGFPeFNGMU83?=
 =?utf-8?B?S2dwS1JEMmlzSnQybVpqRVVnMjZmOWtFektQbFNzdmVpUUpkdVVvTlBKc2Rk?=
 =?utf-8?B?SUhNNEY0cjVpWUM4dXVtREl5NmdnVmJKclVPcVBvRWxRL3kwTlIyMjlyRjEz?=
 =?utf-8?B?djVYRTVYUG1Rd0VIYUdhUy9iKzMvUmwzY0F3WTgrc1FZekVsYTBtbmlnYUFV?=
 =?utf-8?B?S1JNOUEwU3dsVk03RGpQOCtZb3NkcEdLTEIxc3orZ2Rzd2RBUDJMR1lsQVA5?=
 =?utf-8?B?bWdsaGpHVml0amhZZ2dKZ2NRc1dHODVick10bXRMNDhId3RucENndEx3NEVC?=
 =?utf-8?B?YU5qMmF1dWpRRmw5VkZoOEJkZUw4VnhDSnd6WGcwdGM4NFRPY3F1MzkyS2VB?=
 =?utf-8?B?SjdXYkdjYkY2M2ZPVUNVc0lEUnltTkpGZXR1M0Q3WjJIV1l0WVg0bVplSS82?=
 =?utf-8?B?SVdIWlNPQ01WRDdjZkdGOC9UdXd4MFdyeExVQkRFRjg3cGR1RFZVYlphRE94?=
 =?utf-8?B?VkZRaFI4SlZ0Y0EyWDBQYTdBbHRsd2xSK21PWUJUaTZBdkpVTGNKbzNTb2hP?=
 =?utf-8?B?SkZ0OXhkaDhPcDdDZjJqMk5LWDNmNzF5c25hRzluY1lMWXVWYnFoN0k2ZkVh?=
 =?utf-8?B?dDBqMWJhajVuY3NpNFJEekZlck04cUlWSTFPZWRDZ1ZwbEluRzhPeEhSVHh4?=
 =?utf-8?B?c0ZvY2JMa0lmQmNmUDBmWlJKekZIRndyK2tsNGszTy9QMk1BczVUZHY0Y3l3?=
 =?utf-8?B?N2dJdTlEaHg5SU15akNCTkpNV2NHcGR3Y0sxT1JpdGNCY09QdFZqVVMzRHFr?=
 =?utf-8?B?c1dXZ3drOXNuUTNQVVpGVDd3Q0J5VURUTUdYcnA3YWMwaTcwWjh1WWFQbjdk?=
 =?utf-8?B?cGFvczNSTjI0R1NpSVp1bG40alUwclNFMXpkNTk1UDJCQ3JLWVcwci95L01C?=
 =?utf-8?B?NGNNUlFzUmlqQlVITFFwd3RORk8xWXlWb2V0VHhzcmR5TEl6TW5zbjE1WUZY?=
 =?utf-8?B?Vi96SFBoMmx5bUdSclNJNG9lbndNbndxWlRRUy9CM25zRTJCOExxQ256ZjBZ?=
 =?utf-8?B?SGFXaDdBSnRXcTVLbEFXTWNiZTd1NFZWWDB1NkFTdXZudjFQZjBadnM0amFK?=
 =?utf-8?B?RU1XU0hnQ2lGUmczRG9rYm9GZlUyZjQxeHpmaDJBTU12RFhBbVFFQkVRbllx?=
 =?utf-8?B?LzVXcGFrTDlYWDRQcUg5UkQ2NFQvTGEvdUZaWXFLeWNWOHM2QW1ZQVRwdGd5?=
 =?utf-8?B?dXEwcS9PaVVrNVFkREEySkpnSjRGVmwwZVlOeXJrRVowVUZHZGNIdEYzaEIv?=
 =?utf-8?B?UmtrQTlNemR6TC9GQW9oaDh2a2pmWEVCWVNYNFdYeUNMWEtXMnJGZy94RTNj?=
 =?utf-8?B?bE9QQ3JFeE1JT0lqZ3NRUmlxcEQ3YWpoWkd4SzRraHFtbjRmQkpGejN0WTF1?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4ef1d0-72a1-493c-d3e7-08db2950559b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 14:35:21.7516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jRjCklLz4MvMDMhP39mYiHTJKVAmQvWorboTYZv/dEbRBkWd8qOsiwQTRygvkAZtP+Jn/aNqZADlsxIiZbIXcbjZYJTd1QTOEv8a37jQtoM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 6/6] drm/xe/buddy: add compatible and
 intersects hooks
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 3/20/23 4:25 PM, Matthew Auld wrote:
> On 20/03/2023 14:15, Gwan-gyeong Mun wrote:
>>
>>
>> On 3/8/23 12:17 PM, Matthew Auld wrote:
>>> Copy this from i915. We need .compatible for lmem -> lmem transfers, so
>>> they don't just get nooped by ttm, if need to move something from
>>> mappable to non-mappble or vice versa. The .intersects is needed for
>>> eviction, to determine if a victim resource is worth eviction. e.g if we
>>> need mappable space there is no point in evicting a resource that has
>>> zero mappable pages.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 62 ++++++++++++++++++++++++++++
>>>   1 file changed, 62 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index f703e962f499..8dd33ac65499 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -230,9 +230,71 @@ static void xe_ttm_vram_mgr_debug(struct 
>>> ttm_resource_manager *man,
>>>       drm_printf(printer, "man size:%llu\n", man->size);
>>>   }
>>> +static bool xe_ttm_vram_mgr_intersects(struct ttm_resource_manager 
>>> *man,
>>> +                       struct ttm_resource *res,
>>> +                       const struct ttm_place *place,
>>> +                       size_t size)
>>> +{
>>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>> +    struct xe_ttm_vram_mgr_resource *vres =
>>> +        to_xe_ttm_vram_mgr_resource(res);
>>> +    struct drm_buddy *mm = &mgr->mm;
>>> +    struct drm_buddy_block *block;
>>> +
>>> +    if (!place->fpfn && !place->lpfn)
>>> +        return true;
>>> +Hi Matt,
>> I understand that ttm_resource_intersects() returns true in the 
>> following case,
>>
>> if (!place || !man->func->intersects)
>>          return true;
>>
>> so this line can handle it like this, but in a real scenario, is it 
>> possible to have a situation where place->fpfn==0 and place->lpfn==0?
> 
> Yeah, fpfn = 0 and lpfn = 0 is the common case, where the user doesn't 
> care specifically where it is placed in VRAM. Therefore everything 
> intersects (potentially valuable to evict), and is also always going to 
> be compatible, so we just always return true.
> 
Thanks for the detailed explanation.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

Br,
G.G.
>>
>> Except for the routine that does the same check in 
>> xe_ttm_vram_mgr_compatible(), the rest of it looks good.
>>
>> br,
>> G.G.
>>> +    if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
>>> +        return vres->used_visible_size > 0;
>>> +
>>> +    list_for_each_entry(block, &vres->blocks, link) {
>>> +        unsigned long fpfn =
>>> +            drm_buddy_block_offset(block) >> PAGE_SHIFT;
>>> +        unsigned long lpfn = fpfn +
>>> +            (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>>> +
>>> +        if (place->fpfn < lpfn && place->lpfn > fpfn)
>>> +            return true;
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>> +
>>> +static bool xe_ttm_vram_mgr_compatible(struct ttm_resource_manager 
>>> *man,
>>> +                       struct ttm_resource *res,
>>> +                       const struct ttm_place *place,
>>> +                       size_t size)
>>> +{
>>> +    struct xe_ttm_vram_mgr *mgr = to_xe_ttm_vram_mgr(man);
>>> +    struct xe_ttm_vram_mgr_resource *vres =
>>> +        to_xe_ttm_vram_mgr_resource(res);
>>> +    struct drm_buddy *mm = &mgr->mm;
>>> +    struct drm_buddy_block *block;
>>> +
>>> +    if (!place->fpfn && !place->lpfn)
>>> +        return true;
>>> +
>>> +    if (!place->fpfn && place->lpfn == mgr->visible_size >> PAGE_SHIFT)
>>> +        return vres->used_visible_size == size;
>>> +
>>> +    list_for_each_entry(block, &vres->blocks, link) {
>>> +        unsigned long fpfn =
>>> +            drm_buddy_block_offset(block) >> PAGE_SHIFT;
>>> +        unsigned long lpfn = fpfn +
>>> +            (drm_buddy_block_size(mm, block) >> PAGE_SHIFT);
>>> +
>>> +        if (fpfn < place->fpfn || lpfn > place->lpfn)
>>> +            return false;
>>> +    }
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   static const struct ttm_resource_manager_func xe_ttm_vram_mgr_func = {
>>>       .alloc    = xe_ttm_vram_mgr_new,
>>>       .free    = xe_ttm_vram_mgr_del,
>>> +    .intersects = xe_ttm_vram_mgr_intersects,
>>> +    .compatible = xe_ttm_vram_mgr_compatible,
>>>       .debug    = xe_ttm_vram_mgr_debug
>>>   };
