Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32806C77B75
	for <intel-xe@archiver.kernel.org>; Tue, 16 May 2023 17:58:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA8310E358;
	Tue, 16 May 2023 17:58:03 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FB510E358
 for <intel-xe@lists.freedesktop.org>; Tue, 16 May 2023 17:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684259881; x=1715795881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MC2mB8bfThJdPKf2U3lb40woFz5AqrvR7H3Z6KvtER4=;
 b=LUWWrWpjiP0GLu5NU8aba/cRlfCxnaN4MS1r8lEuqiFhYjOrtZDmZcxW
 bTsw6EdyPCLLfzd6JYAG7Dj/tTnGLwa6BqLyoJRRkWz+6Fh825PMcAB+o
 LuwJCB599NthMBwOaHwulRcRO/WNQPIdOsoA6LgLV6ZqqHc3tj490sDeV
 P8Z+Y7FBKt23IgNCntyWq9X7lP+2z4W+xUQ0NCzt1B0FxqeS7qtXTrsi9
 0ivwzSiYEHo8v22KiZ1eXpVl2B7WKDjqH5I/VdC8wn8S8DqFTLzJqPyEB
 Wg/ZFiVJ1113g67vKdg0ICz4nFwpr5w/+CzCMg9k65IAEVVDbLSN9TNy5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="350385685"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="350385685"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 10:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10712"; a="678938402"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="678938402"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 16 May 2023 10:57:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 10:57:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 16 May 2023 10:57:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 16 May 2023 10:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaXqZ9rT5m482NYf4P5Qo0qqHWPUunf2JWwBTS5x7yH0HtfkBmhK/eF/8NC35t8fvsU7qNvd17yfVI3dXl6R0LN8zS/JJV0qHCB+HROYrOH1cyuAJlMzKz7y9dmfSJkZzMqOMrX8SncrtQ6vSGhUZJVlGHEKb1WAjhjrwEB+cMDJ+ThSN7Xdh/YMY1PrPutpznyk/HI7dD3rr+y4UfMrf9XbSf2skN522E55c1YfHeKrdYwrR28uwzL0fPBnIIUzkx6NdlaYR70w28oAkbFJ/1nfNMmAE++6rnDHTnkter/6FD4sCVS7sigYiFcfm1qzEC9VzI2b++dxPYRvWDDEzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vl0gqXzr6kigGknz5QPF+Mu2UDRwKKNbHMxudYVVamE=;
 b=OoRM3XaPqvXTybyqU/hbGoIQN7YJsJSSOWMH+T0TnftKwX6X/u5rW0uv2atoVh7gUI6ng5pOdN3CtctlflKbZuo8OylWD1wOr/dpJ1WQZ9Y9QjjfMxGY7euoKZAZtdw7aoPNS4E1hoy6GRXpkO9KGtfpLzWGMXrAk8nwmymcs+LXrSxZECsdh4U61L0JEcDNtu+Rwp3KSdCJwLTrIFW0H2CmjLprjuQW6zch8jB+LXJXlpGQvnwrQvHmFCZN2kcTg82FUQIL9yqeYJHvoh2PlKF7s9BmC1evzksaspyI6muM3/gsOsSLWXqvXQZGQmxy1Xrmwju60SbabgNWHds+kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CO1PR11MB4836.namprd11.prod.outlook.com (2603:10b6:303:9d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Tue, 16 May
 2023 17:57:54 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6387.033; Tue, 16 May 2023
 17:57:54 +0000
Message-ID: <0c54efbb-dca6-95fc-6141-11def6c2a2e6@intel.com>
Date: Tue, 16 May 2023 10:57:51 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-GB
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@kernel.org>, "Nilawar, Badal" <badal.nilawar@intel.com>
References: <20230509082558.614913-1-himal.prasad.ghimiray@intel.com>
 <def394d8-f723-d036-d5c1-a249ede937d4@intel.com>
 <MW4PR11MB70569ED202909F1F60C3F578B3749@MW4PR11MB7056.namprd11.prod.outlook.com>
 <a5b88190-7bc1-70c0-b729-dd9cf3292c08@intel.com>
 <ZGLSsQjGdV7WmQ8i@rdvivi-mobl4>
 <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <MW4PR11MB7056BEA4EE6416780502E933B3799@MW4PR11MB7056.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0068.namprd05.prod.outlook.com
 (2603:10b6:a03:332::13) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CO1PR11MB4836:EE_
X-MS-Office365-Filtering-Correlation-Id: 198036a4-e2a6-4d40-817a-08db5637129a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bBckNyd9VUItwwNy2FdcvYi3kqcAfgEHYAlHCNzvzlrMhfj0GlWt3bnBfyfRVLdenzXtU3OQOvJ/HPE5JqncSd1xkiFoH3gprCkMGRJ6wwaHqgY6k9pGpoC/zDkVh2pEAndCrQhNVPW3Bd2q9ADut9CRXJxaXdWjUz7QUy+XX/hK/6KgN5SLKxbKoWKbZNmQMOyBKKwFeX8pj58nbWpxAyH9uQsbkBNPLDarB0ZshSIRsQ94iiaJHBObaDmTAmjTOUEByEFPnLMYlekaex7gPJ3TXVpEiCe4iu6fVjZDsN+RnBLvIiFGY+y7Y/yIDlkqQbOnicdozocJufIeArqo+a21ojfZPOpjLf3jb1ra+2StNeb+c8a6KIzgdGe0EVU9aBqyo/fZrRhKzCpSPjlZqH1M2wv/xvbf9mCs1QktdzddtouXSyIJzOlYD0rsmm8DPDp/zqGZVS11FGhB+QVDGngVZx+Ro+pqCnNgcR2gNoy/Uc3QMaNc6YAeMbxHSSdAb5lIQhVJGykzxXhiHFJugMFWtobgOWw+1/3usy+qGvR5MQpBiyTJuHQru/+ll491/y7z3LCw3ADlGs3yaFuAFWR6TquvIVvTFbzLJySDkLLu/vg31NCRjYI5W2xqNSUDfdxy6DYHB+MIPI/sKKtvpw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(31686004)(66476007)(66556008)(4326008)(6636002)(110136005)(66946007)(478600001)(54906003)(6512007)(6506007)(186003)(53546011)(38100700002)(36756003)(2616005)(83380400001)(8936002)(8676002)(6486002)(316002)(6666004)(2906002)(31696002)(41300700001)(86362001)(5660300002)(26005)(107886003)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z09OU1dCbGhLSlhEVzZvak1CTENXdFhnazhWa2pETER3NGRJYzZVYzUrR1BC?=
 =?utf-8?B?T3dUcjQzd3AxbHdLVldzMlJqcnd1WXRGVFMwTnZxOG1mZm9Sc1c2WTdTcEdY?=
 =?utf-8?B?bTVHckYxV1A2dVVtUVpFNjVpd1NpdVY0SW1vRE8wTnpwalZsVXJvVytub1lN?=
 =?utf-8?B?SVZzZzdMdXVucnBFaUQ2Sm9pd3hIaCsrQ2oxL1ZxQjV3RnBoZFFlZWZMZjhv?=
 =?utf-8?B?YVI1cWJXYWVqbjNSOHlmakR4aXI5NUZWaFZkS1oydUlwZitldzRJNVN5VUhm?=
 =?utf-8?B?dmMrOC9VYmFTNmdqcnhack9tcC9iVStSSHB0aUVIeEh4eGFSb2pjY0M5UzJ1?=
 =?utf-8?B?WlpQbTUrakJGeUY5RVh2cWQyRkFpMURvbkRVd2ZjSjhhR1ArM2I0RWh6N2JJ?=
 =?utf-8?B?WkZnS0dHcmx3R3lWT2VjNWYxanoxUWc1eDJhRTJWQnVzbHcwNjNiUmp6cEdv?=
 =?utf-8?B?Um1ieENyaHI4L3oydXNuWnh1WWdISUxab2hwQmVqeFdJNktHT3JBS0xLZnI3?=
 =?utf-8?B?U3FaVWZYQThrVFZNL0Q5Q2JCKzJFWFBtODRSeE8rVTdIV3FvTks3UzhwYnF4?=
 =?utf-8?B?L0hpZDZSbitjMHlIZ0JqVU9hbmhVZTcwOFBab00wRTMrUFFjZSs1UmlQNDVX?=
 =?utf-8?B?SHVnQ1ByRXpEUUVKdG8xNHJXTVk5VERYcE1XWFNTVzVpTXBQZWhIa0xkN2Q0?=
 =?utf-8?B?Sy9lTmN0L3kybFdBVXF1RnVJYlh0bkxZdFVZZlkrMTd4MFh3alExbGZRTXh3?=
 =?utf-8?B?L2J0aDF0TkRmZUJZL1ZzUG9PQU9KSDBsRGFpWTYvNWROblNFdGtBaloxSE9J?=
 =?utf-8?B?NE14Sk5peVFKUHV2WG52a3FPSEJOdUhSaEtLWVNPMS81bVRKSE9KdVZZVFp0?=
 =?utf-8?B?RHpHcjN5amNCY3l3My9ta01nYkQvb2VKN1JHb05pVHd5SGxjaWtCbDlWTEM1?=
 =?utf-8?B?YlZqU2xzMUZON1ZwM3NXSmpyV1BEMUVmd0lOenBVR0NpRVYvVGtqL2tyK2NZ?=
 =?utf-8?B?OE5OZXNwZ1ZDb2dKeVgwMlZHMHVPRHZQOWdaNGlPdUdyaStTRnF2TnpzWnhx?=
 =?utf-8?B?d2JNeEM4Z3BVbHNwcmxFeGZrd29NOGkwWHpqZWE0RWFYd2JBbEdJSFU1eTkv?=
 =?utf-8?B?N2IvWmROZzk2QWdzR2hOcnlVdUd1WVBWdk9La3lzQmJBdVhIK094UHB3OHJo?=
 =?utf-8?B?a1RXODZuM3RQTnBtSC9Ield2YmFYWDRlbE5ZT3VKbDZFYUNQMkVKdDNIYkho?=
 =?utf-8?B?WWE3eXVNTVJNUGhHcko0M21BZE9VNmRzcFFzUDNlSlJJc09CTSszaUg0b3pX?=
 =?utf-8?B?Rzdlc0E1aURiZEY3MnY0TFJHL05hbUdIalh2eUc0aVYrcGw5dW0rb2diZnBH?=
 =?utf-8?B?M1dRenY2Z2xKZWEvR0tkVm5ocnlBUGdTM0hOYmFTcmh3c1NiellNV2JsVTMy?=
 =?utf-8?B?Q0plVS9MSDYxbkVaOUJKcnAxdTI3My8zUUV0VUJ1VW15dzBiTTNnSFY2aHpY?=
 =?utf-8?B?c0o3dTcrUjZZRkFHNTYzNGtvS0loWElnMHlLMVRtYlRMdVNVSGdRWndHTWYw?=
 =?utf-8?B?N1liZ1ZmdlpzYmJ3WTZZRksxQ3BDRUhOTGJMRXFqekVzb0ZjL3Vadm53K25h?=
 =?utf-8?B?V0YvRUE5emdSTjE3TkNJSU01TFpGcVN4TnQxL0h2eUk1YU5ZZmZhVWtQTGtM?=
 =?utf-8?B?VUxmQWZESjZKbEMvdk0xU3huUHhYQW1jUmxCcjFEN1lJcXRpVm9RRWlCSlhy?=
 =?utf-8?B?ZWlMQno0NVllZnBqQmxrbzhoUUtZVVQrVWhYS0ZKT0E2TzRKd1V2ZTRPaGR5?=
 =?utf-8?B?U01TbHh5c1J5SVdQdDZzakJrM0RFYjhBcXJEZkM1ZTVoenhtMDBYejhrOVhM?=
 =?utf-8?B?OGR3TElFVk50YWxDNGRDUTJvUkNrdmZ0OVBlcEU4Ui9nOW9NUFMyTUVWdzRj?=
 =?utf-8?B?VEUyMm1MVkNnYWFOd0FlTFJoNk1CMFpVRklCdVhvc1l2MHIvdmVjUjA4aENi?=
 =?utf-8?B?VXhCUVpHc21aV21qbXU1eHVOaE5lMm1jeVI1YUlXNll0cmh0dVBZdURhYVlZ?=
 =?utf-8?B?cTlNdFI3UFd5ZlhITVdoZ3hCV1RzSlBTS25lWFNXQlBjbDBTa0NMZEhQUVA1?=
 =?utf-8?B?ZndUVjRlcXcraVZXQ1VvcTMvK3FIMXNmUXpndE9OVHgwYTJPTzY2Vk52UklM?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 198036a4-e2a6-4d40-817a-08db5637129a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 17:57:54.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZvN5XU29DnNKKHhb+B0oPc6htcBQSy/bCh1tehnKKTkyGV2vcxxLj3GrLyaARoK7LbfNc+XhDF2Ad/xCNiNROb4KdlnTfUwDK3o4nbofQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4836
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
 engine/gt reset fails.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Argenziano, Antonio" <antonio.argenziano@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 5/16/2023 04:41, Ghimiray, Himal Prasad wrote:
>> -----Original Message-----
>> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
>> Sent: 16 May 2023 06:18
>> To: Nilawar, Badal <badal.nilawar@intel.com>
>> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>> xe@lists.freedesktop.org; Harrison, John C <john.c.harrison@intel.com>;
>> Argenziano, Antonio <antonio.argenziano@intel.com>
>> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace when
>> engine/gt reset fails.
>>
>> On Mon, May 15, 2023 at 09:46:47PM +0530, Nilawar, Badal wrote:
>>>
>>> On 11-05-2023 17:13, Ghimiray, Himal Prasad wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>>>> Sent: 11 May 2023 10:07
>>>>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>>>>> intel- xe@lists.freedesktop.org
>>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
>>>>> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Notify Userspace
>>>>> when engine/gt reset fails.
>>>>>
>>>>> Hi Himal,
>>>>>
>>>>> On 09-05-2023 13:55, Himal Prasad Ghimiray wrote:
[snip]

>>>>>> +
>>>>>>     int xe_guc_engine_reset_failure_handler(struct xe_guc *guc,
>>>>>> u32 *msg,
>>>>> u32 len)
>>>>>>     {
>>>>>>     	struct xe_device *xe = guc_to_xe(guc);
>>>>>> +	struct xe_hw_engine *hwe;
>>>>>>     	u8 guc_class, instance;
>>>>>> +	u16 engine_class;
>>>>>>     	u32 reason;
>>>>>>
>>>>>>     	if (unlikely(len != 3)) {
>>>>>> @@ -1608,6 +1625,12 @@ int
>>>>>> xe_guc_engine_reset_failure_handler(struct
>>>>> xe_guc *guc, u32 *msg, u32 len)
>>>>>>     	drm_err(&xe->drm, "GuC engine reset request failed on
>> %d:%d
>>>>> because 0x%08X",
>>>>>>     		guc_class, instance, reason);
>>>>>>
>>>>>> +	/* Notify userspace about engine reset failure */
>>>>>> +	engine_class = xe_guc_class_to_engine_class(guc_class);
>>>>>> +	hwe = xe_gt_hw_engine(guc_to_gt(guc), engine_class,
>> instance,
>>>>>> +false);The The instance here is considered as physical instance
>>>>>> +of hwe but while
>>>>> submitting contexts kmd passes logical instance to guc. With that
>>>>> I assume guc might be passing logical instance or for this
>>>>> notification it is passing physical instance?
>>>> AFAIK for reset failure notification the instance passed by guc in g2h
>> payload is physical instance .
>>>> @Harrison, John C Can you please confirm ?
>>> Spoke to @Antonio, he confirmed that to notify engine reset failure
>>> guc is reporting physical instance to host.
>>>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> I don't believe this is what we want here still. At least not from the sysman
>> perspective.
>>
>> After guc reset fails, we will try to reset the GT ourselves and if we succeed
>> we don't need to request user space interference.
>>
>> That should only happen if we also fail our gt_reset after the guc_reset
>> failed.
>>
>> That would be the similar point on when i915 gets wedged?
>> We probably also need the wedge point here before we can issue this
>> notification?
> Hi Rodrigo,
> You are right, In case of engine reset failure the driver tries to do the  gt reset
> and if gt reset fails there are two notifications one for engine failure and another for gt
> reset failure. The changes to send uevent in case of gt failure are added in xe_uevent_gt_reset_failure.
>
> Level0 UMD does sends the RESET_REQUIRED uevent in case of only gt reset failure.
> Engine reset failure notification is not used for this purpose, it is to provide information that engine reset was required and it failed.
>
>> Anyway, we also need IGT for the uevent itself.
> The IGT for uevent listener will be helpful only if we can inject errors in such a way that they lead to engine/gt reset failure.
> I am unable to find a mechanism to do so. Can you provide some input on the same ?
> BR
> Himal
It should not be physically possible to inject an engine reset failure. 
The only way to do so would be via a hardware exploit. Same for a GT 
reset failure.

Bad user code can trigger an engine reset. Absolutely nothing should be 
able to make that reset fail. If it does, then the hardware is broken.

John.

