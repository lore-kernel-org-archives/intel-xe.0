Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD12C7618A
	for <intel-xe@archiver.kernel.org>; Mon, 20 Mar 2023 08:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A7D10E291;
	Mon, 20 Mar 2023 08:44:47 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9A710E283
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Mar 2023 08:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679301885; x=1710837885;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fEShfilC9NsFfAEFJLZaLj1/4tfI1Jya+uspSK+ZDhM=;
 b=X2duuIJjVi/KTxL8G+0et5qaBLQkra4dTHE6QNcGHCqmmFyr7hWPLkj8
 2vFgS37wH9cYqI9cgagQORj/9sUvptJSnDI9fCaZGfOhIgO04gihqvkYk
 luXReu+hg8USD6YZGJVdtLiLuYoSyLhppHQSjTzyyzouXe2HjTEdmdi6y
 9+eb5rkMA4bQZkqjGUS+XFqoav5tHZdg6tS1u+2+uuNMo+GMx24IfgIPE
 o5WcQMtmvWw5pHjR5T6TOvRCtKQKq/sxN6gd47aZLlg8BJTDlJv1RuK8t
 ID/FPuUmb6t6DCsX/8Z2S+wShbEExlGXoc5CudMCAGLhhsw0SIKvtmBSu g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="424884598"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="424884598"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2023 01:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="926890647"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; d="scan'208";a="926890647"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2023 01:44:43 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 20 Mar 2023 01:44:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 20 Mar 2023 01:44:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 20 Mar 2023 01:44:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcX4uzOUgBqJ8z31LN3rCoeQHUJCmSXR85SCB8OtzAor00URcQy4Y0O3YUpaNV3TVPFnLwdHNMfY1eR9Tsj+lEtA7BILMOaTUtbfCPCm6vdIpAofn6RuNi9p6NmTAhF+OObBJZgtt0eEOHmBcy1XicnllabgT+x0BBlzEwrGuQBKYsDvh+KzYG8J99W3iduPaVuxHUj5hsWotUAkDItEpa7DsBoUg6PCW+Wa9hBMaSiWxRHZIjxsSy0bPVmSivw+146VF4P5DtZTPyXD1Iw8b4+mVOqVvVr3SBPOjh8lRSN59DqttE8IzhlKOy+VRMCDbGYKtpYMxXXHz90RKfutOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Da03HN38fEzD9jz9EQolWi2qqb7VvLiAk2Mai+v6H7M=;
 b=ob8fat/0x/9MmjaE0pYyjFQWm7ZMwMIKtmkv45jCw/xZSAS8ljmbyNWs6s0wB38enl3x+YtXqVAx2FiugZKdxSCcSruQWYXwH2xKrglZ+eJBPirrdlkiZvqK5Dw19l2Z+ivUmqmP2WFYE5KML0dXl0WnUOVf76yFGkFcz3DrS1KfG2YYPre5+4qusQkVtUD/JSKBMp81KaWpE/MDeGzDnCp7v3l9U6OdBJrBkWhy8Z+aRDTNHu2jtNwAdQzc1pIHc03sUaWtBWah37gGWw37yRC4j2z2Q/u65xlnPaNsmCVHy/+C+yt+79XFbrDbKm1oI0mpUoNYDJsizey2OU3GjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 by PH8PR11MB7967.namprd11.prod.outlook.com (2603:10b6:510:25e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:44:36 +0000
Received: from SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc]) by SN7PR11MB7539.namprd11.prod.outlook.com
 ([fe80::d94d:4bb6:a568:a2bc%4]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:44:32 +0000
Message-ID: <7fa22d4c-dacc-a33f-84bb-8540618415ec@intel.com>
Date: Mon, 20 Mar 2023 10:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230314085842.134239-1-matthew.auld@intel.com>
 <20230314085842.134239-5-matthew.auld@intel.com>
 <3f48da8f-7c9a-5cdc-f323-826a50f256ef@intel.com>
 <7c940122-20d0-600b-e045-86c1b1712dac@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <7c940122-20d0-600b-e045-86c1b1712dac@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0072.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::36) To SN7PR11MB7539.namprd11.prod.outlook.com
 (2603:10b6:806:343::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7539:EE_|PH8PR11MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: bd97adae-21e0-4b47-d198-08db291f5310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WJowoQgrYf5cqcfSIMASVL4csoywEB/367jZBtRviz+67CtOqRRWGyHBoF4Awx4fh4cg9lm5WPlwzRlbztStxj5oQuJAn+akoY9fcxGvre5g4q7ZXHGcO8VJeMBG3g1B3vgXhJf4o6CaUyCoRNJFPHJvehqh8Z3pTW10Qx8qUKW0tEthKNb78MVr6ZnrJJgMME+snP9XosT3wR/6ScNT3a8QY67C0pCCmFQGunepB9aU9Ao57xRZx1hLul5XifbbK0akwpsHWoumNgKo4LaWly+YreTtoWXgPgAcjFw8yMF+hmcj3ibcRZHAt0BQ8gCjJPqvOtCIOJHQoSlazgABwJsUxWpPSjbiSIRBhY3fJCOOnvkInuL/noj69BvpDsmFeJnlQFi7DlJH8qmuA5jM3DoGdrkrG0YCOjchqqgj84HsnycKYNk4LnLDbL4YNCgVPFzroA4ALJfd7BFQrkzy1rMvlI3GJ4kdls9aZTyXNGDXkNbbnQTpDmEUKISqa7XJ8zzgJxw+U27T+KRMEGX9hPOh97JtuJKTnQ7kgDDuAhMiIo1QZSm06A5D1YdEP83oQ/IAbdud3YoDshBRBP8HNoo6ItrIdQPiijg0RG1BfF+qVqfUqyKwaXXWAQGLW02lMkvfSOcaie33cnT0WLn8lzu5gqCwUipIp105gaC5Vr7PJipZ6wFrvw1zIP5QLKVqLRSl17Re3neAUcLnBXYsy/+Nq0l5Q3N04RrDU/nVfVM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7539.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199018)(2616005)(186003)(6486002)(4326008)(107886003)(478600001)(6666004)(83380400001)(316002)(66476007)(66556008)(66946007)(8676002)(31686004)(6512007)(6506007)(26005)(53546011)(41300700001)(5660300002)(8936002)(38100700002)(82960400001)(2906002)(86362001)(36756003)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXhINUtWaWVzeHZiLzV4Z2hVbndvNnZRS2FEcXZkU09SeGw5emVWZjZaamRK?=
 =?utf-8?B?Sjc3MXdJeEJwMCtFRGJHc1dGbVJQYTVQdjE3cUQ4cjZ0a2VteHhHQ2c3dHJ1?=
 =?utf-8?B?OTFQNUVLMEhHY2JUNU1IcFNILzRMdzJhS2tFcGVzTjNvWnZBeEtHSEtvV25C?=
 =?utf-8?B?Q0NFaUdHd1pwU3djRUZTdm8zVGdDRmUwOW00bXJCMkdKOGxtQURwM1o1cFp0?=
 =?utf-8?B?N2tXVkwyR2pBbjlENVVuQXNmSzFwQmRscjRzMzRvNzRPL1Fob1Y5OGIxbER6?=
 =?utf-8?B?UzRib1Y5VnlaNnpRSURyVzVSTWZBS1RzSnRTeWhrWllxWVR3L2k2U2R3MHJ3?=
 =?utf-8?B?QlBZaHEweWRmRDdiVmFjNEFwWXdBOEtlUnFaMnBsZVg4Z1hTb2I5VHBjM25L?=
 =?utf-8?B?MFMvYUNTeHV2anVCLzFVak1lNXpDR2E2U25aWHlBNTFHa0xJQjlNcndjaC9n?=
 =?utf-8?B?QTJIUkhnOUtibjFKVGlTb2V1ZTEwZkNRQnpNZ1RXa1g1UUw4TGhyN3BMaktO?=
 =?utf-8?B?OVQyVHlQbjNLcXJLbTdteDVBYjlQVXpweXMvRTRCY1J1SUM2S1crODhBRWZl?=
 =?utf-8?B?TGtWMkY3WUIyUnhGTFIwbVJjT3IvU2dZMTJ6WDlmRE1QV3h3ZHFXbEcrcXJC?=
 =?utf-8?B?TXpIclBGWk9RSGtwODdweHlMSjJZUFFtblQ2MjdMU2lBMXVoSHA3T1NIWERo?=
 =?utf-8?B?ZlNzRUFhZEpQeHk3bFJNaWN0M1N5eFlVWGw2NUdBM2tGWkZPTFZIRG1WL0dG?=
 =?utf-8?B?RUMyK3FBVmNUdUYxeVZ6MTBDRTAvblo0NTdvUUZqWHlDS1BRMFNlTjR4dVNP?=
 =?utf-8?B?eTJwRW9WWnFSMzZkNkpycDQyVzQ2U1RQcHNSdld3VjlKK3RpVFJlSXJ2NkFF?=
 =?utf-8?B?VFg1b2YzM1JSTU1MUlR0UnVpRXFWdVh0blhvUXFSd21QSjl5ZGNWeGxleHJW?=
 =?utf-8?B?MVphSk9EcnpwRU1iZUN6QTFGeVNDMUhwR2FMWmVSKys5d1ppQm1YenJNMnVh?=
 =?utf-8?B?SG9USVJQRnJJOFVrckVpVnM0eDl1aXVsanVBdWNZV1VQeTVjOUNTUlZ2WG9N?=
 =?utf-8?B?L1FHai8xVnFRbWUraHZGZVpRZUEwSUxTRWVCTGJtdi9HQ3BZMVlBVW1JZE1D?=
 =?utf-8?B?bHBUQXZsZnc2SjUwbGEwY2ozUTl5SUFmZW1vSlV2T3NWN2J0WmdENUdlQ3Jo?=
 =?utf-8?B?OHVNc0h3WkpzZ2plVGpHV0kxWGdNaWkyNDBVUUFSTzZBYmZpK0tXRU9CczhW?=
 =?utf-8?B?VzVMRk9ZVUFlZWpiL3ZEb2xIWjRVMUF3bk45UDladGt1aE1aSXBxMGQ3SitL?=
 =?utf-8?B?WCsvQlFNdkRHeWdlRW82eE5SR0hNcEljR3JkVWJBNGtsRVhMTURTZkdYLzNE?=
 =?utf-8?B?cGlLaEFBUWkrQ0FPbjU5YlhXdTFLdVdZbllQb3ZYSFVTM0NDc0lLdHlUUmtC?=
 =?utf-8?B?WVhxVDk1MFBPOGRuOEFHK0IrSmNJdWVYSUNNeVh1dDR2OGZqY1dLWnh5cUZl?=
 =?utf-8?B?OTNVVktMU1RQNS8wdlpHd3BJem9sd3VJTmYrcElxc0Q1b201QjNiUVRuY0pr?=
 =?utf-8?B?ajJtaS9DY1RXSW1PWFNPNllVREVFSkltalg4c3RuWWYrV1IyNTRSbVpmbkNW?=
 =?utf-8?B?VDBub2NrYkZFcmhQVElRQ3U4TFVERVZYOTRaeVY1T1R1ZWpSVFJVVDhXZ2FG?=
 =?utf-8?B?bHcwVU9Rd3BFVndrK2NSQjRLUG5uak1EY0dWdFJldlFmZlU2Q1owcHJlcTVJ?=
 =?utf-8?B?MGoyRXArbkdyTk9ZdzNUOXY1K0F6TjI4RWJGQnhkSjJSSkdubmY5eFRhRlRV?=
 =?utf-8?B?MVM3bWlBem9xNEN0WGl1RVJDRUp5TFJoQWRhQW9iOVJJemtLWlBxb2Nza1Nn?=
 =?utf-8?B?UC9iZzNRWUVhemxTcHhxRExhZ2VQTVJyZkYwSXlwcUIzcGt2bzNVc3pnVDNs?=
 =?utf-8?B?aUl0cGgwM0oxSFZYUWs3Uzh1UEtDWDFIMzZvekRPUWpORFNLRW1taXl2VnZy?=
 =?utf-8?B?K2ZJbUFTZFgwUDJuRE1tU2I5dndUcEhqaEdicHRlc0J1ZXhlL3l5MktnaXVD?=
 =?utf-8?B?U1g3Z29Sc0xQSjVJK29OMithVEZvejc4RUw3aW1EN2N0OHVGZzBvSWhQMG5K?=
 =?utf-8?B?K2dncU1vQStpN1NCY1BxRVhhNTVHaXQ4b1g4Qy9Uejc4SnRmQ0MwN3N0b0oz?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd97adae-21e0-4b47-d198-08db291f5310
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7539.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:44:32.2548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: md9skROohGjSfn0AyRQD/5/wOBghHIOPnuslEV722sFErtxX5otKpuhj7v72ZZogs4C65khlrB6qCMjOitFb+OK3cI7s47gPLOlzhWlUNdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7967
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 4/6] drm/xe/buddy: remove the virtualized
 start
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



On 3/17/23 3:02 PM, Matthew Auld wrote:
> On 17/03/2023 11:52, Gwan-gyeong Mun wrote:
>>
>>
>> On 3/14/23 10:58 AM, Matthew Auld wrote:
>>> Hopefully not needed anymore. We can add a .compatible() hook once we
>>> need to differentiate between mappable and non-mappable vram. If the
>>> allocation is not contiguous then the start value is kind of
>>> meaningless, so rather just mark as invalid.
>>>
>>> In upstream, TTM wants to eventually remove the ttm_resource.start
>>> usage.
>> Hi Matt,
>> If there is a related rfc or discussion, could you please share a 
>> reference?
> 
> I think it was maybe discussed off list. But there have been patches 
> that try to move in that general direction like: 544432703b2f ("drm/ttm: 
> Add new callbacks to ttm res mgr"). Which gets rid of the main user in 
> ttm for base.start (drivers still make use of it though). Better is to 
> keep it at the resource manager level. The "virtualized" start here is 
> basically trying to workaround the fact that [res.start, res.size] can't 
> really represent a non-contiguous allocations.
> 
> For example, if you look at that patch, ttm was using [res.start, 
> res.size] to help determine if the existing resource was compatible with 
> the new placement. Basically if you want to move a resource from A -> B, 
> where both are the same VRAM, without the above it would always turn the 
> move into a noop, since A & B are the same resource type, and are 
> therefore "compatible".
> 
> However with small-bar, you also have mappable vs non-mappable VRAM, and 
> you might want to move between them, so the "virtualized" start ensures 
> that [res.start, res.end] <= mappable size, even for non-contiguous 
> allocations, if the entire resource is mappable, and vice versa. With 
> the .compatible() hook that is all pushed into the resource manager, so 
> we don't need such tricks. See also the i915 equivalent: da6198afb01d 
> ("drm/i915/ttm: remove the virtualized start hack").
> 
It seems that the part that is difficult to fully understand with this 
patch alone is explained well. Thank you for a detailed description.

And referring to the explanation, the commit where the use of 
ttm_resource.start in ttm_resource_compatible() was deleted was 
confirmed in the commit below.
commit 6d3c900c12d72667341bcff338c252e22728b942 ("drm/ttm: Switch to 
using the new res callback")

Not directly related to this patch, contiguous allocation (using 
TTM_PL_FLAG_CONTIGUOUS flag) allocates resources from one place?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c           |  6 ++++++
>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 29 ++++++++++++++--------------
>>>   2 files changed, 20 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index 73a7f2cd4ad8..346573f406c2 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -662,6 +662,12 @@ static int xe_bo_move(struct ttm_buffer_object 
>>> *ttm_bo, bool evict,
>>>                   void *new_addr = gt->mem.vram.mapping +
>>>                       (new_mem->start << PAGE_SHIFT);
>>> +                if (XE_WARN_ON(new_mem->start == 
>>> XE_BO_INVALID_OFFSET)) {
>> Are there really any use cases for moving to memory allocated with 
>> xe_ttm_gtt_mgr_func()?
> 
> The above is only for pinned VRAM objects, which are always contiguous, 
> and therefore have a valid start value. I just added the above sanity 
> check to double check that, and make the error more obvious if we ever 
> trigger it.
> yes, that makes sense.
>>
>> Br,
>> G.G.
>>> +                    ret = -EINVAL;
>>> +                    xe_device_mem_access_put(xe);
>>> +                    goto out;
>>> +                }
>>> +
>>>                   XE_BUG_ON(new_mem->start !=
>>>                         bo->placements->fpfn);
>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> index 159ca7105df1..bafcadaed6b0 100644
>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>> @@ -54,7 +54,6 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>       struct xe_ttm_vram_mgr_resource *vres;
>>>       u64 size, remaining_size, lpfn, fpfn;
>>>       struct drm_buddy *mm = &mgr->mm;
>>> -    struct drm_buddy_block *block;
>>>       unsigned long pages_per_block;
>>>       int r;
>>> @@ -186,24 +185,24 @@ static int xe_ttm_vram_mgr_new(struct 
>>> ttm_resource_manager *man,
>>>               list_splice_tail(trim_list, &vres->blocks);
>>>       }
>>> -    vres->base.start = 0;
>>> -    list_for_each_entry(block, &vres->blocks, link) {
>>> -        unsigned long start;
>>> +    if (!(vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) &&
>>> +        xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>>> +        vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>> -        start = drm_buddy_block_offset(block) +
>>> -            drm_buddy_block_size(mm, block);
>>> -        start >>= PAGE_SHIFT;
>>> +    /*
>>> +     * For some kernel objects we still rely on the start when io 
>>> mapping
>>> +     * the object.
>>> +     */
>>> +    if (vres->base.placement & TTM_PL_FLAG_CONTIGUOUS) {
>>> +        struct drm_buddy_block *block = list_first_entry(&vres->blocks,
>>> +                                 typeof(*block),
>>> +                                 link);
>>> -        if (start > PFN_UP(vres->base.size))
>>> -            start -= PFN_UP(vres->base.size);
>>> -        else
>>> -            start = 0;
>>> -        vres->base.start = max(vres->base.start, start);
>>> +        vres->base.start = drm_buddy_block_offset(block) >> PAGE_SHIFT;
>>> +    } else {
>>> +        vres->base.start = XE_BO_INVALID_OFFSET;
>>>       }
>>> -    if (xe_is_vram_mgr_blocks_contiguous(mm, &vres->blocks))
>>> -        vres->base.placement |= TTM_PL_FLAG_CONTIGUOUS;
>>> -
>>>       *res = &vres->base;
>>>       return 0;
