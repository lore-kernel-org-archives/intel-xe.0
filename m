Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AE8C001DB
	for <intel-xe@archiver.kernel.org>; Mon, 14 Aug 2023 04:19:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0DB10E00A;
	Mon, 14 Aug 2023 04:19:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93BDB10E00A
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Aug 2023 04:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691986783; x=1723522783;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pH7mZ/gRRliyPxSrVgbp1l/pNI/TpaBjxhdMXpJ7aLQ=;
 b=eex8e5yA/o2FFmLS8yKZdpX3+6LnHVRX+tfXResrBHtAsW/8mBEqtB3V
 DE7FMc/vwmagkdGsM5ohSeRS6B7nZSsPgT1SjYpRC+ii6EBUvOZhOKIO/
 UYsjfJfrx+ydVuwrWiblvlKR9l2JFxHsCdNHX5eUZdAmCaiuU+WNJH7bp
 h6trN2xf13lr+3vFKlbb+YMhz7JNac4SVRsvlIu7Oo5+ziLCqrX9ASDmU
 dBfNX9qu2yG+0D+HaS4yRvhZiKy35Mt4BZpIOeunBeADZdF1ZZQKRde/g
 Nmg75TKjYbNAbqa6BjLqx9xH2Y60CIuR6+ZwGGuGfJ5liIZKR7zfjcPJ7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="362108345"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="362108345"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2023 21:19:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10801"; a="798683941"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; d="scan'208";a="798683941"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 13 Aug 2023 21:19:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 13 Aug 2023 21:19:42 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 13 Aug 2023 21:19:42 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 13 Aug 2023 21:19:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GasNscKRfb8FIo1XrUa2iQTKbFmJaTVP+MPOPHhUw5ZfuBCac44FSPLkTc4mM1B/PIk8hTQGWEOVxyMdWFsufjJgIX95k4RFXf2LWxTYg3MjIQcqbUWLUUeOvEBC3iDERNitlbJyLxAiQmqtTBLlD+XLKkS5gyN98z44DMxijFLSuXEZAFctIqnn6t8Hrs8gs2kWen+L2MKt7l7sAuWrR6XnBG37FD5lP+TLDaAcE7QfbmzN2z8ziZeYez8kej1zL9W0WvQCtdzsiZiGR574BVpP6SiNRZC0K7UcjxeBNkHEfIKZmK7FZleHXaMF3ThnAMufjH1MPbzlaLBXyj4MGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsySra6EwpbZzEF6RKgt7Ul3M+bzjfDy7aClsPGWUbA=;
 b=SbZN706nxy0trKmAFaMx+rF8rs4oR0Fk15ovfRsR0F0JbXblmu8b6I3U8ekDwkoZPIaQv5xL3pKUTcgUVxcIdRmM6w8R+s1M6UDnY1ZH3+NrVJkugAsyjBxpGdQ2fDbTN+p0gpjZ6+IhwvEeXb02hr5MYCglhc4zOjP8qPluK+BbXBT8yRd6h9VGbKHgO98Nq44115HxR/vLQAJ/PKovpj//yYvdLGED4wIFtmQKBF5rzbA7OfyTGWJ9+xke5sSyPVXaJCg8aL3S6I7Scel/5Jo+jspqJxZedPPscWnJ5GQg38ys9iS02dibd2VgjsJrptyM25Qy8LiW51ZeIQtMtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by CH0PR11MB5475.namprd11.prod.outlook.com (2603:10b6:610:d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 04:19:40 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 04:19:40 +0000
Message-ID: <928f87e0-2e7c-893c-64d3-387723176214@intel.com>
Date: Mon, 14 Aug 2023 09:49:29 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
 <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
 <cec5ddd7-e79f-c848-653f-81e21240f29a@intel.com>
 <87msyz39iv.wl-ashutosh.dixit@intel.com>
 <badff12b-ac9f-b0ea-9ed2-147b426dfaad@intel.com> <ZNVc3WlzODiKP/j+@intel.com>
 <875y5m1c56.wl-ashutosh.dixit@intel.com>
 <890d81c9-f617-f77d-848c-de92cb9396c3@intel.com>
 <87wmy1z8w2.wl-ashutosh.dixit@intel.com>
 <877cpytm8t.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <877cpytm8t.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::18) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|CH0PR11MB5475:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af457a3-bde5-4a29-6cad-08db9c7dad8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xQO//W2elVJZTOwwi/ZK04Rt1osRTZsEG9zJnhtTV7+bsJwEwquKqNTe4J3130yPVWDUURRexFevgmu+sG6Oul/VhFhCPZ2RCcp/VcS5OyEbtyE4UGlOxwas/LJpt0ke0C++AtLUu5ioOchB6K1hLKVqBm7lVKK+TbA40ru0e4rXJp7rWEw1atpw9ZaVD9aBA7pFV/CU4hAukEAYYFDscfv0XFUHlo2HJso0mcMqb+XKPqwjMXJxGMIQnZMorCf8k1G+3BHUiln8dfnS/0hD7syHgJEQBuw6sbxqBbrla0W1TY4Xxw1ICVU5lk9Jo0/4mkXs/aiMbL/SOQErG60goZCTywVsOso4+5KE1XuU47qMirrw4g3rIFjivxRXLrTvO6rBHAwM80iuwwByMU4g5WuuWijRaFrhClF5VH86ZmWdKZpCuFkyTADgZijxKCpeZPK8OSUJOHhPOyIma+42PvQHl2xw5gSLu6otsrw80HYSUuZdSI5FBU5no09DVWJWRX4XA7TCguRGMBkEDIfZ1PNT7P60Y9YSQQnOYBEuJYqdjzjcIFTyX34GGjHomiwTF0YJAGbWX4BOhmPi2lvdDVJD01fP4GI68QJEvPKVac2kSqnwZQcDRlTGrn8WmNrQgzsAVGX1oWYZiKbNE2Bkzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(136003)(396003)(39860400002)(366004)(186006)(1800799006)(451199021)(31686004)(6512007)(6486002)(6666004)(86362001)(31696002)(36756003)(38100700002)(82960400001)(83380400001)(26005)(6506007)(107886003)(2906002)(54906003)(478600001)(37006003)(53546011)(2616005)(6862004)(8676002)(66556008)(66476007)(8936002)(5660300002)(41300700001)(66946007)(316002)(4326008)(6636002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWREaFc5YlJJRklKMk90eFFWWXJ4c1BhZ3NaVFBrc1A3cWdQNUxVZjdOUUw2?=
 =?utf-8?B?S2NxOGVGdGxoU0JjNEVyYzRwbTFJdlJrOVNRZHU0Z0lJVW1MREdCVFpJZGNj?=
 =?utf-8?B?QnlQeU9LTzZQb1ViRThSOHVpYkdDdDUyR1N3dUxTaDVWekFxNzl2RzlXOHJ4?=
 =?utf-8?B?a1ViUGhra2lmbkE0NTB1NlhzaVRrRWFGSzJOdHZ2VHFFK0RyZk1NVmZPRThu?=
 =?utf-8?B?OGRGaXpabGlwaXVkTEhUY25sTDQ1bVc0Nk9nRmw4dUFQbUtpTTVmYTg2MVdo?=
 =?utf-8?B?TzlJWUhZUnRBM2JyeXVmVnlWamJ3ZHI0N1pUMFl2aGNrRmp3RUJDbDkzeS9j?=
 =?utf-8?B?dnNFNVdDSUV3bXRzRGRhVVI0d2drcExweDRxUDhJaFFoYW8rV0pVTnNadXhi?=
 =?utf-8?B?ZWFzRnNLcEtTZWc2ZzRVU0swaHpzRHZjS1hnelEyVzJ1OC9RV2hsSXprS0t2?=
 =?utf-8?B?TjE3L0pOQkZTcDlqNXdrYThHc3NCU2lpVDBiSmFHSnFUcVpCTHFwNWRNeU1Q?=
 =?utf-8?B?UVZibzZQZ3hLM3g5andkTkFsdDBFVFZvZENFTnJML09BVVROSkFOcWFOS2tI?=
 =?utf-8?B?SDRnbGlBb3Q4WEhOa2Q1NU95NDg5VFQ3NWZRYk8zSnAySGhxcDZTN1BEUEo3?=
 =?utf-8?B?M0grbFd3L2wxT2cxS01WekVlVUVRbHo0QXJhKzBONFpoWDJXYW9kcnVYZlVS?=
 =?utf-8?B?RUtDckllY1FkdGIyb3l5bHJIeXhINlZ3clRzUU9XZGxoUkpyVDBzbmdpOXVn?=
 =?utf-8?B?T0htL2QybWRXUlZId3lQZDdZU210Slg2T21PUGU2Z3R0VGpjR3F6bU9JU2pk?=
 =?utf-8?B?WnJlRWFnV3dtRGRrOTIwYkErQ3ZEbTNZc2RKMnVySWx4dlU3aFNPRXJ4MlpS?=
 =?utf-8?B?dlhXdS9XbUZIR2VVenBweGxqUzNxdkZTSmR0eExVRUJCblNkaXE2UklYaDR6?=
 =?utf-8?B?cnJjTWw2N0ZVOW9mQ0w0b3ZKNXV4UHNGdDdwWHNvZ1lNa0pSNURoemhBaWZQ?=
 =?utf-8?B?U1VGSmYwU05DRmZIWGJwUzhxNFIzaGV6dU02VmhjQW51cDBsVWRHSkJablAr?=
 =?utf-8?B?SHRuTjI1TXdGbWRvNXNMc3p6S0NFaTJxSlppMDJGM1d2RFlaQkpCdEVOVVBD?=
 =?utf-8?B?aVJUamt5MWtFRUtwUGtsMFBRYkJVOEI4Wm1rWWNnYXVUTENEMHRRSzBTRUhI?=
 =?utf-8?B?YmEwTS9xeS94SXVCWDhPRXVSdlRmZi82VlJ6dzFGZU1QemNHS3dQQ2pVVkJQ?=
 =?utf-8?B?VmdjS3hwcElOUjY4emNsRDFUeEYyUTNhWXVWVmhKenc5SWN4bHYzRUcwWmVN?=
 =?utf-8?B?OTdGUWgrWUVDRzZmMERHM0cySWVCQnpBNnlVNk8rUTVaUjJjd1Q5OENTU2Zy?=
 =?utf-8?B?SGgzaHlmWTVoV1JLQjRDTzVIQmxsY05LY1dBSHdmL3V6ZklnREc4TzVjeTR6?=
 =?utf-8?B?V2JsQ25vME9JMDB5STh4SUZqUktlKzlMS05wcTZ3ZkI1ckxTV3dacTlIYk1B?=
 =?utf-8?B?WFpGalhUN2laRW52djZ5SlI4Rll0b2NiRGtqbXh1Y2Y3VWZDK0dvS2hEcnQ4?=
 =?utf-8?B?R0JhZkU2cFIxTXRyUCtTSDFjUUFoUzhxSXhyZWRLU09UT3NnV0tJcCtaS0tM?=
 =?utf-8?B?ZHF1MEc5T3Y0SnQ4TkQ1ViswWktBMGo2Vldrakh1TVNLQzVweEYwcnZEaENx?=
 =?utf-8?B?K1JyeUV4SURxYzRzS2l6bnNmUnpZSCtjY0hxVFNab2NVdk1LR2k4S1RqMHRI?=
 =?utf-8?B?VGIyQU1rc3l2a0FObm42OCtleGZ5K2gxMWtYaTM5c2QzbUtRL3JSb2NROEJ0?=
 =?utf-8?B?OUx1RWxoYzd6dmRRNXpEYkFMVmI3dlVFcFFaZHhnbHg2aWxyUzFFQlVTM2ta?=
 =?utf-8?B?SVNpNXpQWU5NT0p4ZFJjb3l6bk1aVmNRK1h2U2g4eGQ4UVNBa2RrSnJSR0F4?=
 =?utf-8?B?c2hQUzZRT25FT1VtT1FWdWFzOHJDdFVCQUxLeVEyRTVrSXF6VE8zYURSTkkw?=
 =?utf-8?B?OWNWMmlrczJiRklabnU4dE55MXFOWDQ5NWs3TjlldzU5ZTdpMktDb21SU1RM?=
 =?utf-8?B?YWZkN3V3TTQ0aDJYTnVNQTlnWnNkM1VvaGdRWXRKV2FnUDF2TUQ2clZSVElm?=
 =?utf-8?B?b09abTg0b2dZZ2lIcUd0TGpLeU5obFhBSDlIRnkrYzJ2dXUybEJhMDNEYjlH?=
 =?utf-8?B?R3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af457a3-bde5-4a29-6cad-08db9c7dad8d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 04:19:40.3834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uSKY6J7l1Ppt/nJKXNQ7KGjPdzKflszpq32xd4MVCsTgs0OW46T0HwQHgXIWjLxRCGs9xL7nxqGDlWfVUihL5mAUW96O0P+d94XL187j9OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5475
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 2/2] drm/xe/pmu: Enable PMU interface
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
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 intel-xe@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 14-08-2023 07:32, Dixit, Ashutosh wrote:
> On Fri, 11 Aug 2023 12:17:17 -0700, Dixit, Ashutosh wrote:
>>
>> On Thu, 10 Aug 2023 23:17:47 -0700, Iddamsetty, Aravind wrote:
>>>
> 
> Hi Aravind,
> 
>>> On 11-08-2023 09:08, Dixit, Ashutosh wrote:
>>>
>>>> On Thu, 10 Aug 2023 14:55:41 -0700, Rodrigo Vivi wrote:
>>>>
>>>>> On Thu, Aug 10, 2023 at 01:40:16PM +0530, Iddamsetty, Aravind wrote:
>>>>>> On 10-08-2023 08:10, Dixit, Ashutosh wrote:
>>>>>>
>>>>>>> On Wed, 09 Aug 2023 06:11:48 -0700, Iddamsetty, Aravind wrote:
>>>>>>>
>>>>>>>> On 09-08-2023 17:27, Iddamsetty, Aravind wrote:
>>>>>>>>> On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
>>>>>>>>>> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
>>>>>>>>>>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>>>>>>>>>
>>>>>>>>>>> Spotted a few remaining things. See if it's possible to fix these up and
>>>>>>>>>>> send another version.
>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>>>>>>> new file mode 100644
>>>>>>>>>>>> index 000000000000..9637f8283641
>>>>>>>>>>>> --- /dev/null
>>>>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>>>>>>> @@ -0,0 +1,673 @@
>>>>>>>>>>
>>>>>>>>>> <snip>
>>>>>>>>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>>>>>>>>>> +{
>>>>>>>>>>>> +	u64 val = 0;
>>>>>>>>>>>> +
>>>>>>>>>>>
>>>>>>>>>>> What is the forcewake domain for these registers? Don't we need to get
>>>>>>>>>>> forcewake before reading these. Something like:
>>>>>>>>>>>
>>>>>>>>>>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>>>>>>>
>>>>>>>>>> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
>>>>>>>>>> should be sufficient.
>>>>>>>>>
>>>>>>>>> But if i understand correctly taking forcewake is not allowed here as it
>>>>>>>>> is an atomic context and forcewake can sleep and that is what I'm seeing
>>>>>>>>> as well, might also be the reason why i915 didn't do that as well.
>>>>>>>>>
>>>>>>>>> [  899.114316] BUG: sleeping function called from invalid context at
>>>>>>>>> kernel/locking/mutex.c:580
>>>>>>>>> [  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
>>>>>>>>> 290, name: kworker/27:1
>>>>>>>>
>>>>>>>> that is the reason why in i915 we were doing similar thing of storing
>>>>>>>> the counter as we enter rc6, not sure how do we do that in xe.
>>>>>>>
>>>>>>> Just to check, which code path(s) is/are aotmic context:
>>>>>>>
>>>>>>> a. xe_pm_suspend
>>>>>>> b. xe_pm_runtime_suspend
>>>>>>> c. xe_pmu_event_read
>>>>>>
>>>>>> pmu_event_read and runtime_suspend are atomic contexts.
>>>>>
>>>>> what about doing this at xe_pci_runtime_idle() ?
>>>>>
>>>>> This will run after the autosuspend time elapses,
>>>>> but before calling any suspend. Also, there's no requirement of
>>>>> that function to be in atomic context. So you could forcewake_get/put
>>>>> and stash your registers before we go runtime_suspend.
>>>>
>>>> Thanks for the suggestion. Though Anshuman was saying that rpm_suspend
>>>> callback itself is not called in atomic context, Aravind seems to have made
>>>> a mistake. Aravind could you please confirm?
>>>
>>> Yup i made a mistake runtime_suspend is not an atomic context, in actual
>>> we are taking the forcewake in gt_suspend which calls the xe_pmu_suspend.
>>
>> OK, great, thanks for confirming.
>>
>>>>
>>>> In any case there seems to be a way out here, we should work to save off
>>>> the registers while suspending in either the idle or suspend callbacks.
>>>>
>>>>>>> Now I am wondering if GuC should provide these counters too along with
>>>>>>> other busyness values it provides, since GuC is what control RC6
>>>>>>> entry/exit. But let's try to understand the issue some more first.
>>>>>>
>>>>>> do you mean GuC reading these registers and presenting us in a way, will
>>>>>> need to think over how does it fit in the PMU.
>>>>
>>>> I think better to leave GuC out since it's a long process to modify the GuC
>>>> API. So let's cancel that.
>>>>
>>>> About xe_pmu_event_read being atomic context, since the registers might be
>>>> getting updated while xe_pmu_event_read calls are happening, the only way
>>>> out I am seeing is to run a kthread (specifically a delayed work item)
>>>> while PMU is active. The work item will run every 10 ms or so and save off
>>>> the registers (since we cannot take forcewake in xe_pmu_event_read and read
>>>> the registers). So this way we should be able to report register values
>>>> which are at most 10 ms old.
>>>
>>> there are two cases here:
>>
>> Correct.
>>
>>> 1. similar to suspend, we shall capture the register state before GT goes
>>> to rc6 and that shall cover suspend case as well
>>>
>>> 2. in xe_pmu_event_read, we shall check if device is not in rc6 rather
>>> than awake and read register but might have to take forcewake
>>>
>>> for first I do not think we have a way to know in Xe if GT is entering
>>> rc6 (like gt_park in i915).
>>
>> But we can take forcewake here to either prevent GT from entering RC6 or
>> bring it out of RC6 to read the registers.
>>
>>> even in kthread/timer we shall take forcewake only when GT is out of
>>
>> Timer is interrupt/atomic context so it cannot be used, it will have to be
>> a kthread/workqueue.
>>
>>> rc6, but there is a problem our devices default autosuspend is in 1sec
>>> so if we have a timer or kthread at msec the user shall also adjust the
>>> autosuspend to ms or else device will never go to suspend as we take the
>>> pm reference in mem_access_get.
>>
>> The kthread will only try to get forcewake (to read the registers) if the
>> device is awake, so it will use xe_device_mem_access_get_if_ongoing. If
>> device is not awake use previous stored values.
> 
> We should fix up the suspend code path (get forcewake in that code path)
> for this patch but can defer the kernel thread for a future patch (if
> needed). This will at least give UMD's something semi-functional to begin
> integration with.

In the suspend path we are already taking the forcewake in xe_gt_suspend
before we call the xe_pmu_suspend, so that is covered. So I'll  raise a
new patch addressing the other comments.

Thanks,
Aravind.
> 
> Ashutosh
> 
>>>> Any other ideas here?
>>>>
>>>> Thanks.
>>>> --
>>>> Ashutosh
>>>>
>>>>>>>>>>>
>>>>>>>>>>>> +	switch (sample_type) {
>>>>>>>>>>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>>>>>>>>> +		break;
>>>>>>>>>>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>>>>>>>>> +		break;
>>>>>>>>>>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>>>>>>>>> +		break;
>>>>>>>>>>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>>>>>>>>> +		break;
>>>>>>>>>>>> +	default:
>>>>>>>>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>>>>>>>>> +	}
>>>>>>>>>>>
>>>>>>>>>>> And similarly here:
>>>>>>>>>>>
>>>>>>>>>>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
