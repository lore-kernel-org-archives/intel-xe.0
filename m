Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B690EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 06:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9682910E65B;
	Fri, 11 Aug 2023 06:18:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F8C10E65B
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Aug 2023 06:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691734682; x=1723270682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kmU55r5rEsA0hnsglX8gx9f6TrTisoTk2x8+If8Y1ks=;
 b=C3wv/qKb0YZLtLsORkO5bvMJnaGeeKtjjn869QNbQpAQRaooLx5jagSv
 gfw4vhNUw+2rQK1p+YHhP5BQIL2NJlU+gpy+nIES70ACOS9viXaJ9G3mJ
 6PAFqFZZ7o6wq6dQwELYgqp4IvkUmJVnihRYEXw3tgZgqJrISW1sBoenE
 b2+2nF+Ug/YLTlobBgvOLgjeFgacZ2Sb8j5DYLQTeoZ1IC7l3V09bNQqJ
 ylW+53eMhuWgz1Jyb2D1MGNxeMS7OJVlOyvTccT6OlL79yxojKca4MhL8
 Yn32+Rz9h6OMdOpTYS6Zy5mHV34+6DZ0J0J24Yng0wHvFxf+d6lBratnr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="437944437"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="437944437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2023 23:18:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="856183376"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="856183376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 10 Aug 2023 23:18:01 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 23:18:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 10 Aug 2023 23:18:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 10 Aug 2023 23:18:00 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 10 Aug 2023 23:18:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTbgIzXBoY7L3o+UaUlOrz0TThQ6XM4We2zt5f/LQTGTHmXo9voSn8jB9dYoI7CTBxt0CW7eI4Y5D/QWTKXGBxjLMwOxpOosNs2NY2xs/bxhhlgwGbgLsICPDM1Kg3INDYdZ5njMUklXdvUTrlzr6XJN3K+Vds3YocN9ZiExz3QVOUvVt9OeHGo72GwA0WGqTrCN87zeXRAD6+zI+YLdTqPjo1O2ySTlaxGjtZnTBzWBo/3bx4da+PICCaejptWxhQ8Jl+6fzyY9Z31QEM3sImfjg5EXZRUxlyd5CUHwOSur/FpDj8o8rJ8KTHxG+GN0mNq/yOveVWXkhbnMUI+kUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlPxqwARjm3Gxfe/5yAJqCcc9eE5LbStdJcemOBlCX0=;
 b=mOTNsjZwystu37T0F5v5u1UkGYdMigD/96DeiyM5jkZTSE6y08xzXEdF0ZOuvY2f9puRcjmQDDEFOS5neZWXKC8pyGCXeVQLM31VHQ9XbVOlknpwRVICwJQ+ktZX4hIA6inK9WgjDMmWOEKSTLp8Gw1qd/B2DauCq60SakJ9FtvtopyhBkvES2EE76otcfo9sa8uziztG1WFTlUdb7bqZ/OL/fwxaxMIp738qqsXkgjWUXE4NV2ypX/RYr+DIRCgM1aGcaFHI8X7fG8FXwVTE3f64D18H8M/9SgdzigCpPRs2B4sRs4zuZWU4e3nOhnhucVqe8lafErVU/NxF8Jhug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by SN7PR11MB7665.namprd11.prod.outlook.com (2603:10b6:806:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Fri, 11 Aug
 2023 06:17:58 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::a581:e6a4:d186:c153%7]) with mapi id 15.20.6652.029; Fri, 11 Aug 2023
 06:17:57 +0000
Message-ID: <890d81c9-f617-f77d-848c-de92cb9396c3@intel.com>
Date: Fri, 11 Aug 2023 11:47:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.14.0
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20230808115436.400611-1-aravind.iddamsetty@intel.com>
 <20230808115436.400611-3-aravind.iddamsetty@intel.com>
 <877cq4y8s3.wl-ashutosh.dixit@intel.com>
 <95750d7f-df24-a9c5-ab39-86db69767bac@intel.com>
 <b9496a4b-bea2-fa15-6ae1-5810baf70260@intel.com>
 <cec5ddd7-e79f-c848-653f-81e21240f29a@intel.com>
 <87msyz39iv.wl-ashutosh.dixit@intel.com>
 <badff12b-ac9f-b0ea-9ed2-147b426dfaad@intel.com> <ZNVc3WlzODiKP/j+@intel.com>
 <875y5m1c56.wl-ashutosh.dixit@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <875y5m1c56.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::19) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|SN7PR11MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e915be-a5df-46b2-dbfa-08db9a32b47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W00CbBc4AVBV+r4YEFQtV8y5TJ0OQhN8bDVErl0g6yUGhpvz63dorCYg49kPDeTJ55/eohPREZlZ3h2WQ52ZTLsIzs3u0oBdWcvBgStKAQIrt46CGKYSiuUdam1VmDJsTnjC1LDAftui+i11Q3ltYJ2L47Wzt4bdULztKTfi+PGXcqBG5Bc+jEPnyAFkjK3Gcphun9WHtFwlua01TpUd/2HLsSrhhWujiHl81rHeuwvgF0cG3H/y75OKyQkBHgW84bQepa4QpIfxtMdi2QUpwCCjojxzG/Bj3iAZSERPbnjHe7ngSJr16+An6jE5DRWRzdrMcEogCkhfe+Sq0fjkd6pXzOWRrvYxKcUc53OeVrPpQua4oJZ8eNIZvg1mCXd5DjgU1h33x8y0AjfCdf7zV1TU7/v8fQkXGwSgtLS/5B6Dc2nCVo0gy9VPIiwchOPsL3nX4pg9pVZQ7ZjFPMCAQeS+R7wZXfIfLkkbc6rRUSGIgg+i1PXSGmkhiexv4oTb0jBMNpoTHCiuSJePqIWIjzuDVGcuKYjRKyZYgnBVe9UU8HyjrGKUOnIcJW+72GDfRs0hYVDjzXDqLpXR7O7A1ftOCf6XdEWC6HETefNzNsGkLzyz2v4r8iXGeGk5Q/HGVtmLJ1b5qZdlB+C+fE1Mqw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(346002)(396003)(366004)(376002)(186006)(1800799006)(451199021)(6512007)(6486002)(6666004)(478600001)(66476007)(4326008)(6636002)(66946007)(66556008)(316002)(5660300002)(31686004)(110136005)(54906003)(41300700001)(107886003)(26005)(6506007)(8936002)(8676002)(53546011)(86362001)(31696002)(36756003)(82960400001)(38100700002)(83380400001)(2616005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFo5KzdlMDZKZitYNGhsWGE2bjh1cC9FQ015VE9zdE5rd1o1RElPSmx2Sm94?=
 =?utf-8?B?Q0o1aXZYMjF3Z2VXaEpGRHNKSkxYdkFUdWg0T0dkS2ZWbFJwaXZjbmJHQnRO?=
 =?utf-8?B?cG5vWGorbkR5Y083OWt4cUV3NlI2QXBTU1krZWlJZmJBNDdjTXYvOFhKd0hJ?=
 =?utf-8?B?a0Nxbk4zOU9WdFU1d1oxZnpKZGJpTFJYcnVyNkw5NktOUDRBNWxOekpYN0hm?=
 =?utf-8?B?UWdGNnQyVUF0MHFyZW82SEpCZFdNb3J3UnY5cFlJZ3VZdENiRkQvRlBicjlM?=
 =?utf-8?B?enByQXpTcktpNHB5VFEvSXl2UGdRV01BNnBSaTZIckR2dVlMblhGZlJDbjZR?=
 =?utf-8?B?Qk1iaThpYUhiWFR4eXVYMnRMc0xPS05BUTE5R3RERlptODU3WU8yeEc0c0Mv?=
 =?utf-8?B?SjhjdGdQTVhMU0tvQ1FkVEZrN05uOXdGeDdMcWZmcnRKYkVBbldFNkJCbGtR?=
 =?utf-8?B?cEEwVllkZFBnZlNtY0FWZ25ZVjlwMW9uNmhLQW0vcml2UlpTanZwTGRJNWgw?=
 =?utf-8?B?YVhjQ1ZveDk3QnBhZmpVWEh4a0hvUVJNbW8rYUJjcEhUbkJZSXpjUlJ5ODhs?=
 =?utf-8?B?aXFkWUo5NGUyQ1NiT2JYTk9MSEhrQ25KczZpV1dueTRRY25wOGE1MUZ0UHNk?=
 =?utf-8?B?MnFTaTEray93dm5NUDFtZ0MwK1hBZXZlSW15LzU0SklFWXJjRXk4RTFhbW5Z?=
 =?utf-8?B?MjQwcis5ZnlHOEhGN1JmNitMd2xYVkVKTTB3Q2Q0ZlNKOXVtUUJ4M1BOR1ht?=
 =?utf-8?B?WHBGemVjK1FiM3cyUXFadHZINDEvQ0VjRjIyQXFZTEd6Z2psVVplOFhJOHRr?=
 =?utf-8?B?ODBLcUR4MGJDUW1lV0UrZlhPZmZpMFRCVWw5d3FpZkRYcGwyQzR3YUI5MmJV?=
 =?utf-8?B?Sk9rcVo2RWxmWDBsanZCZ3VpL0tHWmFubit1YUtPQzNYVlN1cDZYZHhjNHdv?=
 =?utf-8?B?MEZGUllnVjBnR3I4MkdRRVFXWHc3WEU4NjZwUWtPcXQya0Zsek1wa0RvY3BE?=
 =?utf-8?B?WEhoRUJneHhEZGdLZEdLL3ZEcmdSK09WN1RZeG1TaG5qUFZYQngzYkpuMjNl?=
 =?utf-8?B?OXdXQmlaUDZ1L2NGZW5xWTZaUGtGeE9qY3RvOUFDaHZvVHYzSDFjL3hTOXB2?=
 =?utf-8?B?cHd2ek4wM29UYXRoNVdrTWdwZHM1NlljQlFQeTd2SWQ0Q3duQ2RWQlpRSmUv?=
 =?utf-8?B?NUZUL3FDYWZnMkgwMFlXZ0o5RWtXMlJQWjRhN3orTTR0N2xtNnM5a3RnUjZQ?=
 =?utf-8?B?eDhPSWhXNmxKaEtNVDYzVVVRUjFGTEhuRHVtVWpjZWg3WkNQZmZWdUY1dFRJ?=
 =?utf-8?B?VHlDK2N0a1VBSWxoU3d1Q0tUUWdOMmtPeURhSnN3N0crdlMrSmJtV1V4Z09I?=
 =?utf-8?B?TmVZd1pBeU1wRndsWkVyeWhvL3dVVTlTOWtKbzNlU1ZYN3lNZ0xXYVYvSFd4?=
 =?utf-8?B?eFE5aW5DQmxsb0lFNmc1RmxwakRaL3FBZEJmVkhrV3dacUlnWDlxZ0RKWVUz?=
 =?utf-8?B?VkVqK0YxekY0YkErd2NhcVNha1pyVHVENzh5L0dLdXpSU1B5cWxxWTk1eW8r?=
 =?utf-8?B?R1M0L3I3Z0QzMGRVaWlXS015aVBDWThETEFKTHFGa0hDeHlBeUE1dzBqelBi?=
 =?utf-8?B?S1g1VFhOeUVVc3RjNytERmVEbVcrdGpEdUMrR2RCNi9iQW93eUt1RlM3Wnhw?=
 =?utf-8?B?Y2Nvbk5hR3Faa1JQTWpFa282NVYyQnU4MnFvWHowOEo5clovNzVxUDVDdkNW?=
 =?utf-8?B?VzQ2Q2F6dEoydHBVcUpRbjc5ODVRQW9WL0dtUkxuY2d1MU5mOEZyVk8xUDlF?=
 =?utf-8?B?NUg1bHd2YzBaaTdNS0xkdXd2a1FKbU9xT0h3QS8yWGlOdUtFbDE4eWhYeDZR?=
 =?utf-8?B?OWpxdTNEaEZIL3pyS1lFQWNhNXNsRmcwOHdHb044QTlGcDBxMEFYWTFneTNU?=
 =?utf-8?B?dmFWVFRMMWdzNlZyU2k3enR4bG1PQkVBeS9oQ0c1SENYci9nRWRoY0xmejV2?=
 =?utf-8?B?WlYyU012MHIzd2hzYVZJRTBPR0c0bWpSWjBIZ3FKRnBnMTN2WlhiZElWTzNF?=
 =?utf-8?B?UldzNVFGUG93bkpqSTJacFk4U2hxRmp3cWs0TEQxc3RuRVlYQkFTN2pvbkVw?=
 =?utf-8?B?ODViZlJFMEg2amE2VDRVeGd5M3IyZFo2Q25IUE91eDlOZnhzRTcxcml6azF0?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e915be-a5df-46b2-dbfa-08db9a32b47a
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2023 06:17:57.4016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gR0EtzkkH+mu+cuoTQ3u/KcyrS1ypK+FIqYc6NWwgvfrDixSpqMhJAMl96ZtMt1wnk6eGqZWXK9d2jwGDL/buZjhStV/ZYRirBpbZn4yobA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7665
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



On 11-08-2023 09:08, Dixit, Ashutosh wrote:

Hi Ashutosh,

> On Thu, 10 Aug 2023 14:55:41 -0700, Rodrigo Vivi wrote:
> 
> Hi Rodrigo/Aravind,
> 
>> On Thu, Aug 10, 2023 at 01:40:16PM +0530, Iddamsetty, Aravind wrote:
>>> On 10-08-2023 08:10, Dixit, Ashutosh wrote:
>>>
>>>> On Wed, 09 Aug 2023 06:11:48 -0700, Iddamsetty, Aravind wrote:
>>>>
>>>>> On 09-08-2023 17:27, Iddamsetty, Aravind wrote:
>>>>>> On 09-08-2023 15:25, Iddamsetty, Aravind wrote:
>>>>>>> On 09-08-2023 12:58, Dixit, Ashutosh wrote:
>>>>>>>> On Tue, 08 Aug 2023 04:54:36 -0700, Aravind Iddamsetty wrote:
>>>>>>>>
>>>>>>>> Spotted a few remaining things. See if it's possible to fix these up and
>>>>>>>> send another version.
>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>>>> new file mode 100644
>>>>>>>>> index 000000000000..9637f8283641
>>>>>>>>> --- /dev/null
>>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>>>>>>> @@ -0,0 +1,673 @@
>>>>>>>
>>>>>>> <snip>
>>>>>>>>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int sample_type)
>>>>>>>>> +{
>>>>>>>>> +	u64 val = 0;
>>>>>>>>> +
>>>>>>>>
>>>>>>>> What is the forcewake domain for these registers? Don't we need to get
>>>>>>>> forcewake before reading these. Something like:
>>>>>>>>
>>>>>>>>         XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>>>>>>
>>>>>>> based on  BSPEC:67609 these belong to GT power domain, so acquiring that
>>>>>>> should be sufficient.
>>>>>>
>>>>>> But if i understand correctly taking forcewake is not allowed here as it
>>>>>> is an atomic context and forcewake can sleep and that is what I'm seeing
>>>>>> as well, might also be the reason why i915 didn't do that as well.
>>>>>>
>>>>>> [  899.114316] BUG: sleeping function called from invalid context at
>>>>>> kernel/locking/mutex.c:580
>>>>>> [  899.115768] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid:
>>>>>> 290, name: kworker/27:1
>>>>>
>>>>> that is the reason why in i915 we were doing similar thing of storing
>>>>> the counter as we enter rc6, not sure how do we do that in xe.
>>>>
>>>> Just to check, which code path(s) is/are aotmic context:
>>>>
>>>> a. xe_pm_suspend
>>>> b. xe_pm_runtime_suspend
>>>> c. xe_pmu_event_read
>>>
>>> pmu_event_read and runtime_suspend are atomic contexts.
>>
>> what about doing this at xe_pci_runtime_idle() ?
>>
>> This will run after the autosuspend time elapses,
>> but before calling any suspend. Also, there's no requirement of
>> that function to be in atomic context. So you could forcewake_get/put
>> and stash your registers before we go runtime_suspend.
> 
> Thanks for the suggestion. Though Anshuman was saying that rpm_suspend
> callback itself is not called in atomic context, Aravind seems to have made
> a mistake. Aravind could you please confirm?

Yup i made a mistake runtime_suspend is not an atomic context, in actual
we are taking the forcewake in gt_suspend which calls the xe_pmu_suspend.

> 
> In any case there seems to be a way out here, we should work to save off
> the registers while suspending in either the idle or suspend callbacks.
> 
>>>> Now I am wondering if GuC should provide these counters too along with
>>>> other busyness values it provides, since GuC is what control RC6
>>>> entry/exit. But let's try to understand the issue some more first.
>>>
>>> do you mean GuC reading these registers and presenting us in a way, will
>>> need to think over how does it fit in the PMU.
> 
> I think better to leave GuC out since it's a long process to modify the GuC
> API. So let's cancel that.
> 
> About xe_pmu_event_read being atomic context, since the registers might be
> getting updated while xe_pmu_event_read calls are happening, the only way
> out I am seeing is to run a kthread (specifically a delayed work item)
> while PMU is active. The work item will run every 10 ms or so and save off
> the registers (since we cannot take forcewake in xe_pmu_event_read and read
> the registers). So this way we should be able to report register values
> which are at most 10 ms old.

there are two cases here:
1. similar to suspend, we shall capture the register state before GT
goes to rc6 and that shall cover suspend case as well

2. in xe_pmu_event_read, we shall check if device is not in rc6 rather
than awake and read register but might have to take forcewake

for first I do not think we have a way to know in Xe if GT is entering
rc6 (like gt_park in i915).

even in kthread/timer we shall take forcewake only when GT is out of
rc6, but there is a problem our devices default autosuspend is in 1sec
so if we have a timer or kthread at msec the user shall also adjust the
autosuspend to ms or else device will never go to suspend as we take the
pm reference in mem_access_get.

Thanks,
Aravind.
> 
> Any other ideas here?
> 
> Thanks.
> --
> Ashutosh
> 
>>>>>>>>
>>>>>>>>> +	switch (sample_type) {
>>>>>>>>> +	case __XE_SAMPLE_RENDER_GROUP_BUSY:
>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>>>>>>>>> +		break;
>>>>>>>>> +	case __XE_SAMPLE_COPY_GROUP_BUSY:
>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>>>>>>>>> +		break;
>>>>>>>>> +	case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>>>>>>>>> +		break;
>>>>>>>>> +	case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>>>>>>>>> +		val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>>>>>>>>> +		break;
>>>>>>>>> +	default:
>>>>>>>>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>>>>>>>> +	}
>>>>>>>>
>>>>>>>> And similarly here:
>>>>>>>>
>>>>>>>>         XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
