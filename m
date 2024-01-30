Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4483AC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 17:18:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0135C11322C;
	Tue, 30 Jan 2024 17:18:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 494C3113250
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jan 2024 17:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706635080; x=1738171080;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6hrwwdrlyPDZN+X2H8+fIaMHZSK98trgTfV3SD7WWW8=;
 b=JVcl38d66pvRZ6QUiNddhTZwaFW8nWJXTV7n0V2JVcE3HQ1ZRG8cBSA+
 HAXHwbYJ+uzF4wPB+N+B+CPPuABetwR3SvuTpJu57OoZb0oTvPgvJjy/j
 5lGiydtbkVimhXjaTOchPkDMHE1gVXsPleHAadr8H8P5FzMEcrYXJ5fS2
 3T+zr9Xb0txcOYgyys9N0KAPacgoRdgX1MoTibnAG4r27m748tOER1h1J
 UxOWuXJ4csah+Hly1HkK5dAuoU5pfZ7owsml7zXDHf8w/RlOU+KmpDK0Q
 sT/5Uedfl/o/CuykN73dVhMdGps9K5qMCqUHbzsCgUYUXrKvlrRfXHU11 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="393781928"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="393781928"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 08:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911502351"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="911502351"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 08:52:45 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 08:52:44 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 08:52:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 08:52:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCwWA7DsSGfAY+zq1vW+No0IvOVKrGFLeqYbbb4piPanPagZpGIzzN0foBiLpJ8Vt9LT7owSvq615XiZtdyuvJgrrni/yb6DlN6pVnufRtjCuSyYu3pzmn6qswNxb8IMJ+c6hc9oo5J+oG1IvNCj/5CHrS+1EA8wR040FcJ7b1fG4/ghRfUOL/VUY0t24XtQbQqPW0tJAeCXT14mRLhCqJ/5x5RnSgDIuLjqwrnR8dXWJO7WlV3GSKA+kfOBAx+mXJxR9Os5oadPKttfrDDMbWhqVwpEQPYGgHEV6B0tFyFv5Gr6EX5eOXWG2Bl1GdZ9Ph51OBHsRJHy3BaVvOcyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8M2cJN0ILQ/uvSjD5uGDVCEEu+V/wPtPrlLPclElWAU=;
 b=Y7MX3qAIUhD2WsUeXlewdfyfRC6MLaHzKZtcSY9+znEXWNMjr3mB5cokOapuaV3nupJFYO86tN+qH4drydGLeqURourDa7wacKyJ0ipbOWk/HUafu6kXCwp9Fwat62ozo6gUl8STSlpFcxMr26Po101W7WfHtfmcMswhLEM6OIOIMZvf8jlr1i8a9M+9uKyDXqsA9izH6Wd2bdsEhmp/1YrTzKpdPUGNtH37VitaunxJ8h/q2UdCQwKH19EcFS6//ym/wUdgmd00qBYRodkUjYGn+gJpxC7NppxRw7iEGqFCRyPtd+g7w74I9u2DT7mwwTExWJW9DmvtZycSlGHoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.31; Tue, 30 Jan
 2024 16:52:26 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::9ccf:6986:9706:16cb%6]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 16:52:26 +0000
Message-ID: <2dd98480-0841-4253-ba81-0ef76ef2b2df@intel.com>
Date: Tue, 30 Jan 2024 11:52:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] drm/xe: Add misc functions to support read of
 specific DSS registers
Content-Language: en-US
To: "Souza, Jose" <jose.souza@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
References: <20240129181742.183694-1-jose.souza@intel.com>
 <20240129181742.183694-4-jose.souza@intel.com>
 <20240129212408.GM5506@mdroper-desk1.amr.corp.intel.com>
 <8bdf5c3d85a1fd599a40bc6537ce79531bcf474a.camel@intel.com>
 <57a51297-891c-4ee4-99e5-f209ac1928b6@intel.com>
 <6b02a900119e43a580a37bb2f5e1bbe022916ce0.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <6b02a900119e43a580a37bb2f5e1bbe022916ce0.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0041.prod.exchangelabs.com (2603:10b6:a03:94::18)
 To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 9979eeed-15c2-4d9d-f292-08dc21b3d6d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DezEIVnqThG6LmygDs1m7mGYrr13CydfR0QiC4/8l/Uh4JI+TCCFI9ztNiStYSsI/gYEK+E04c8pgWUtncheNQVKeKHjnJVDwjpdme1QVG5bGvojfeXVLPtOoj21cpGpGf7qss7OUNOUCCw07yKsk89+XVPRus1ep+BXLytL/gvWrvRqxRZItCg9FIUmy80ApKS47zH0tw4enP78PPA6+fWoeqzQr8pauNEYW0oc0FJTZ4VjZO7bK+TiONg7z8BX5PEUCb65z9+gsyivXJKbEyRvp3HahSmfHZ9oy9FHOXGvQFv+6mTomNgcG1VIxYCkg43HA8QOxJxYS1SgZ+mo0fOf3eerTj/oVg3nYzZXkQzC/qWl9bCe0ZzGUdWXTBBKkLeXpZe7RFKZBHMu9gs4HDXog+j83SgObZIdFlxTch53tfXoxgOn4YjxY1hlSet8/pURSbSAD3OdQ2bmBB29gUgacDQqEDr7MTEuSkgFejB5WhPwxfKuZCMfyDn0pdHZ3wNAvFRyiTbFRhb0P/5A7u4BrPUzO1CDSozAZZDdS6e9u1chEPstNK10r+T0aIS7zo3rmipQRAOLP1NI9MGcn7VW2e5Yqb1YzdcztjQxqp83jxJex5OmHa3v3K/FkHv9hx9nU+1rv6vqlJJP5OHm3n7+h1bzr04UWRnYMr3mBDo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(110136005)(66946007)(316002)(66899024)(31696002)(53546011)(66556008)(83380400001)(6636002)(6506007)(8936002)(8676002)(66476007)(6486002)(26005)(4326008)(478600001)(2906002)(36756003)(6666004)(6512007)(86362001)(5660300002)(2616005)(41300700001)(82960400001)(38100700002)(31686004)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bk8wUmQwbHRXVWcxQVVSN3kvdDhVRHc1bHhKWTlmVXIvSjhTeXA0ZW5BQ1Bl?=
 =?utf-8?B?bWlibzRPKytIdjcrQmQ5S0lqNXU3N1lhbk9HbEhwWWVzY2ZpOGhSNld3S1FS?=
 =?utf-8?B?MGF4enRaVGNFc0FDY3JMMER0cWYrZHo4Q2Z2MkNIS3VjdzlQTEJ1b2J6WEN0?=
 =?utf-8?B?cEFZZHB6QzgzYVBPUUcrcUhock9JRXNHM0FEMkRWdTQxQXpRaFh6R2tNSzAv?=
 =?utf-8?B?Y2xHV2dLSlBzRGkvZ29vcExyMjV6WkFhNllhODJnUkdGaFROci9XWG9aVmt2?=
 =?utf-8?B?cUw0OE5iQUZEZWpJNFlZRnFhb2orWU1XU0t0Q3cxZ1ROZURGMXZBYXdnZitU?=
 =?utf-8?B?LzlSRCtUOS8ySUNUdnNmNUZ4akFEb0lScWlIdG9ZbGh3aEZRM3dhRHlwcUE3?=
 =?utf-8?B?bGV0dVB6b3RpbHo0MlFlZzBTNWphNmJuOXB0S3M3SEx5MzAxR3R6b1NCYVFN?=
 =?utf-8?B?TFkwa1RuRVBOdDluTVBMRExpRjJtMlo0cExhbVh2WksrS2VGdmRBWkVOSVlX?=
 =?utf-8?B?UUVmYUliSkRIaXQrcWV1WUg2V1Exd0dZeGwyU1E1ckVlNk50elBPNmR5UE42?=
 =?utf-8?B?NDhoVDJKY2FQZm82eUJZS1hWZ3JJYU9IQVR3NDUwQjNDZEkzSjVURlprZ3hj?=
 =?utf-8?B?WlNIYjRpUlYvSDdtRFcwU3lwK2lPYUwzY3dEUUVNYXUrNUNrSU9pemN5Y25o?=
 =?utf-8?B?bU1FemNEWHA0WWZYUC8zanBHWjVLK2VneloybjVScTZ4aFRHNjVSaUd1c3ox?=
 =?utf-8?B?RXpWUjhGWmFYTWl5alpwM2ROUlRNM2w4V2ZBUTVwMzRydGJKNEY3djh2NkNM?=
 =?utf-8?B?Y3lseWpBODl6Mnl0UndaNURYaEFYTGhsT3VHWEJieTVoaFF0cktFODRYbHhP?=
 =?utf-8?B?MzlRVGk0akdhTlQzVFVONHAzSi91NFFQZE53U05mOXhSWHZQRGhZbUNGeTdE?=
 =?utf-8?B?Y0JPMlhLdUc2SVZaM1lyOXFBQ0txWU9rRDFtNlpVNWxxSzIraVJhK3VxeUNn?=
 =?utf-8?B?TXRTUG9BSmo1N09yM0JqNktTWXJJdGMwakJ1Ky9paFFqTnJXOElqaVBHOHNx?=
 =?utf-8?B?b0lNaTVBT0FKSFdqYTVQN3RhQXlOWndkampWbHQrU2tYdEx5OVF1TmVnOTJs?=
 =?utf-8?B?Z0E3QlQyZXQ3M0dNMVljQUYzRm5qMDUzQzMzTUZ5MUNEWWhDcWRDb29heFla?=
 =?utf-8?B?Y2JKS0JrQlk2aGZEbnZ0UWxKVWVicFZWdHBUaVVzNTN4ZG5tU2pNZ0tCN2hr?=
 =?utf-8?B?QXpJb2FVcVhHQXZOWUpzMGZyam45VzBQRlVIdzhHcjFCVUhkSzlFUjFTaHJX?=
 =?utf-8?B?c2tTV2RSS3JST0ltTVRxb3RzKy8xWE9PRzR5Z3BDNG1hTDFtU0p4VVBnZ3lu?=
 =?utf-8?B?UDhVNGpUTDQ3TVZ5M0F1Y0s2cE5kZHV6MFFVd1RYR3BacU5BRUJzVDFaNTlX?=
 =?utf-8?B?ajl0ekJUaG1Jam4wd3pWR05XSXczTjVnUFdhdHZFVTFVVVB0UjVUaEo3b3pu?=
 =?utf-8?B?NEN2SDNrVlhjMjB5ZEtoaUdxUUNqdGtGS1VwaEVWSk83K1B1RmRwS21GQ2wy?=
 =?utf-8?B?ZHZOUFR5dEdzMHIrWlVlNHo2MDZCSS83YWRiMlk2UjUxemhnTWRHSXpIRjFK?=
 =?utf-8?B?YWpqdnNEeUZpRmdUR2dMajgzemVxeVdGR0VpWTNHVzNpeEpSVFNjRTdHZzNo?=
 =?utf-8?B?QVVJWFNRdkZxM05nTXhuOTRpWjh2N3NPeU9mOEtCejlJcUQ2NHlOaE92RnVs?=
 =?utf-8?B?RzRWTzZsT0lGNEZlU2FJazByekFYYXJ3T2lFM3ZvdWFwTmJpenBEb0NkaEls?=
 =?utf-8?B?NjZRY0NvZHZ5ZGxXemp4aFpOZWgwOW5UaUF3VksrcmZ0S21jSTJ3S295WGFy?=
 =?utf-8?B?RTBtdm51cUJuQUlMSld5aHJTWllPRjdjZjJIZWhFTEtRZTNZVzJEWkZpeGFm?=
 =?utf-8?B?S0ZHc0pqWk1wbkVJdlc5cUg3Zy8zTCtuOFZKOXFXTllzRHdmS1QvTG04WFhI?=
 =?utf-8?B?WjF4NitVWlZyTVlZK1p1bHRzVWFvTHQ1Um1GUWZqNTMyWjdOTHNiTGd3N0hv?=
 =?utf-8?B?c1Ria0o0c3BkZlhHZnUrei9RMk0wRlhCdTlLQnN6UEtHT1pJVGUwaDY4RlZ6?=
 =?utf-8?Q?JcWCrWJUAm80rNprDGR3pblVS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9979eeed-15c2-4d9d-f292-08dc21b3d6d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 16:52:26.8616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LM3KjlaZ4woH/rEF+Mtn7YVQ+kgw9YUmfBI+X1C+uR+AraUEtY5iOobR5IGuEDEKlm24W16/KVW+nAS+EwVBIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 2024-01-30 11:14 a.m., Souza, Jose wrote:
> On Tue, 2024-01-30 at 10:54 -0500, Dong, Zhanjun wrote:
>>
>> On 2024-01-30 9:42 a.m., Souza, Jose wrote:
>>> On Mon, 2024-01-29 at 13:24 -0800, Matt Roper wrote:
>>>> On Mon, Jan 29, 2024 at 10:17:40AM -0800, José Roberto de Souza wrote:
>>>>> Next patch will read register in specific DSS registers and this
>>>>> are the functions missing to do so.
>>>>>
>>>>> xe_gt_mcr_get_dss_steering() calculate and return the group and
>>>>> instance that will be used by xe_gt_mcr_unicast_read().
>>>>>
>>>>> xe_gt_has_geometry_dss() and xe_gt_has_compute_dss() returns true
>>>>> if DSS is available for geometry of compute.
>>>>>
>>>>> for_each_geometry/compute_dss() to simply the iteration over each
>>>>> available DSS
>>>>>
>>>>> v3:
>>>>> - add for_each_geometry/compute_dss()
>>>>>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>>> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_gt.c          | 17 ++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_gt.h          |  3 +++
>>>>>    drivers/gpu/drm/xe/xe_gt_mcr.c      | 17 +++++++++++++++-
>>>>>    drivers/gpu/drm/xe/xe_gt_mcr.h      | 31 +++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_gt_topology.c |  1 -
>>>>>    drivers/gpu/drm/xe/xe_gt_types.h    |  3 ++-
>>>>>    6 files changed, 69 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>>> index 675a2927a19ef..9a3dce45b92ba 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>>> @@ -795,3 +795,20 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>>>>>    
>>>>>    	return NULL;
>>>>>    }
>>>>> +
>>>>> +static bool has_dss(xe_dss_mask_t dss_mask, unsigned int dss)
>>>>> +{
>>>>> +	unsigned long value = bitmap_get_value8(dss_mask, (dss / 8) * 8);
>>>>> +
>>>>> +	return value & BIT(dss % 8);
>>>>> +}
>>>>> +
>>>>> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss)
>>>>> +{
>>>>> +	return has_dss(gt->fuse_topo.g_dss_mask, dss);
>>>>> +}
>>>>> +
>>>>> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
>>>>> +{
>>>>> +	return has_dss(gt->fuse_topo.c_dss_mask, dss);
>>>>> +}
>>>>
>>>> It feels like these belong better in xe_gt_topology.[ch].  Ideally we'd
>>>> keep all the low-level representation of the masks abstracted away
>>>> inside of those files and just provide a sane interface for the rest of
>>>> the driver to query whatever it needs.
>>>
>>> sure, can move it.
>>>
>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>>> index c1675bd44cf6d..36815d8cbc107 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>>> @@ -70,4 +70,7 @@ static inline bool xe_gt_is_usm_hwe(struct xe_gt *gt, struct xe_hw_engine *hwe)
>>>>>    		hwe->instance == gt->usm.reserved_bcs_instance;
>>>>>    }
>>>>>    
>>>>> +bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
>>>>> +bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>>>>> +
>>>>>    #endif
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.c b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>>> index 77925b35cf8dc..e76cb0ae457aa 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.c
>>>>> @@ -291,11 +291,17 @@ static void init_steering_mslice(struct xe_gt *gt)
>>>>>    	gt->steering[LNCF].instance_target = 0;		/* unused */
>>>>>    }
>>>>>    
>>>>> +static unsigned int
>>>>> +get_dss_per_group(struct xe_gt *gt)
>>>>> +{
>>>>> +	return gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>>> +}
>>>>> +
>>>>>    static void init_steering_dss(struct xe_gt *gt)
>>>>>    {
>>>>>    	unsigned int dss = min(xe_dss_mask_group_ffs(gt->fuse_topo.g_dss_mask, 0, 0),
>>>>>    			       xe_dss_mask_group_ffs(gt->fuse_topo.c_dss_mask, 0, 0));
>>>>> -	unsigned int dss_per_grp = gt_to_xe(gt)->info.platform == XE_PVC ? 8 : 4;
>>>>> +	unsigned int dss_per_grp = get_dss_per_group(gt);
>>>>>    
>>>>>    	gt->steering[DSS].group_target = dss / dss_per_grp;
>>>>>    	gt->steering[DSS].instance_target = dss % dss_per_grp;
>>>>> @@ -683,3 +689,12 @@ void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p)
>>>>>    		}
>>>>>    	}
>>>>>    }
>>>>> +
>>>>> +void
>>>>> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
>>>>> +			   int *instance)
>>>>
>>>> I think you're primarily adding this for eventual use in the
>>>> devcoredump, right?  But I think there's also been some other series
>>>> trying to add some MCR registers of types other than DSS (e.g.,
>>>> per-mslice registers and such).  Given that, maybe we should make this
>>>> function more general where you pass the MCR class as a parameter too?
>>>> E.g.,
>>>
>>> Yes, need that to get instdone registers for the Mesa error dump parser tool.
>>>
>>> Thanks for pointing that Zhanjun was also working on that.
>>> Looking at Zhanjun patches looks like we had almost the same functions but he is using 'ss' instead of 'dss'.
>> Yes, we are working on the same functions, sure I can use 'dss', no problem.
> 
> Please then lets go with your version.
> 
> Will rebase this series when you land your patches.
> 
>>>
>>>>
>>>>     void
>>>>     xe_gt_mcr_get_steering(struct xe_gt *gt,
>>>>                            enum xe_steering_type type,
>>>>                            unsigned int id,
>>>>                            unsigned int *group,
>>>>                            unsigned int *instance)
>>>>
>>>>
>>>> BTW, I think Zhanjun is working along similar lines to what you have
>>>> here, so you guys might want to sync up?
>>>
>>> I don't think the function above is needed, what do you think Zhanjun?
>>
>> This function is to get group/instance steering from dss id, the only
>> place used is by for_each_xxx, the macro call this function, loop with
>> dss id, check against mask and call a code block, that's the typical
>> usage. For Xe, as we are using the g_dss_mask and c_dss_mask to test
>> bit, the converted group and instance is not used, so looks like
>> xe_gt_mcr_get_steering could be optimized out and the for_each macro
>> could be optimized to:
>>
>> #define for_each_geometry_dss(gt, dss) \
>> 	for (dss = 0; dss < XE_MAX_DSS_FUSE_BITS; dss++) \
>> 		if (_HAS_DSS(gt, dss))
>>
>> *_HAS_DSS means xe_gt_has_geometry_dss/xe_gt_has_compute_dss
Sorry, the above is for this macro body itself, when we iterate slices, 
when the code block runs on each iteration, the group and instance id 
will be referenced. So we can't go through the above optimization.

Zhanjun
>>
>> The above is based on only this macro calls xe_gt_mcr_get_steering, not
>> sure if Matthew has some thought about the steering_type?
>>
>> Regards,
>> Zhanjun
>>>
>>>>
>>>>
>>>> Matt
>>>>
>>>>> +{
>>>>> +	unsigned int dss_per_group = get_dss_per_group(gt);
>>>>> +	*group = dss / dss_per_group;
>>>>> +	*instance = dss % dss_per_group;
>>>>> +}
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_mcr.h b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>>> index 27ca1bc880a00..9f5f7dbb6fca8 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_mcr.h
>>>>> @@ -7,6 +7,7 @@
>>>>>    #define _XE_GT_MCR_H_
>>>>>    
>>>>>    #include "regs/xe_reg_defs.h"
>>>>> +#include "xe_gt_types.h"
>>>>>    
>>>>>    struct drm_printer;
>>>>>    struct xe_gt;
>>>>> @@ -24,6 +25,36 @@ void xe_gt_mcr_unicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>>>>    void xe_gt_mcr_multicast_write(struct xe_gt *gt, struct xe_reg_mcr mcr_reg,
>>>>>    			       u32 value);
>>>>>    
>>>>> +void
>>>>> +xe_gt_mcr_get_dss_steering(struct xe_gt *gt, unsigned int dss, int *group,
>>>>> +			   int *instance);
>>>>> +
>>>>>    void xe_gt_mcr_steering_dump(struct xe_gt *gt, struct drm_printer *p);
>>>>>    
>>>>> +/**
>>>>> + * for_each_geometry_dss - Iterate over each DSS available for geometry
>>>>> + * @gt: GT structure
>>>>> + * @dss: DSS id
>>>>> + * @grp: group id to be in xe_gt_mcr_unicast_read()
>>>>> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
>>>>> + */
>>>>> +#define for_each_geometry_dss(gt, dss, grp, inst) \
>>>>> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
>>>>> +	     dss < XE_MAX_DSS_FUSE_BITS; \
>>>>> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
>>>>> +		if (xe_gt_has_geometry_dss(gt, dss))
>>>>> +
>>>>> +/**
>>>>> + * for_each_compute_dss - Iterate over each DSS available for compute
>>>>> + * @gt: GT structure
>>>>> + * @dss: DSS id
>>>>> + * @grp: group id to be in xe_gt_mcr_unicast_read()
>>>>> + * @inst: instance id to be in xe_gt_mcr_unicast_read()
>>>>> + */
>>>>> +#define for_each_compute_dss(gt, dss, grp, inst) \
>>>>> +	for (dss = 0, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst); \
>>>>> +	     dss < XE_MAX_DSS_FUSE_BITS; \
>>>>> +	     dss++, xe_gt_mcr_get_dss_steering(gt, dss, &grp, &inst)) \
>>>>> +		if (xe_gt_has_compute_dss(gt, dss))
>>>>> +
>>>>>    #endif /* _XE_GT_MCR_H_ */
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>>> index a8d7f272c30a0..c4942f2b37751 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
>>>>> @@ -11,7 +11,6 @@
>>>>>    #include "xe_gt.h"
>>>>>    #include "xe_mmio.h"
>>>>>    
>>>>> -#define XE_MAX_DSS_FUSE_BITS (32 * XE_MAX_DSS_FUSE_REGS)
>>>>>    #define XE_MAX_EU_FUSE_BITS (32 * XE_MAX_EU_FUSE_REGS)
>>>>>    
>>>>>    static void
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> index 70c615dd14986..bb6dc1fcaa7dd 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>>>> @@ -25,9 +25,10 @@ enum xe_gt_type {
>>>>>    };
>>>>>    
>>>>>    #define XE_MAX_DSS_FUSE_REGS	3
>>>>> +#define XE_MAX_DSS_FUSE_BITS   (32 * XE_MAX_DSS_FUSE_REGS)
>>>>>    #define XE_MAX_EU_FUSE_REGS	1
>>>>>    
>>>>> -typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(32 * XE_MAX_DSS_FUSE_REGS)];
>>>>> +typedef unsigned long xe_dss_mask_t[BITS_TO_LONGS(XE_MAX_DSS_FUSE_BITS)];
>>>>>    typedef unsigned long xe_eu_mask_t[BITS_TO_LONGS(32 * XE_MAX_EU_FUSE_REGS)];
>>>>>    
>>>>>    struct xe_mmio_range {
>>>>> -- 
>>>>> 2.43.0
>>>>>
>>>>
>>>
> 
