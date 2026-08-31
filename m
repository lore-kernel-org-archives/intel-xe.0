Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0ECC61DE2
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 06:50:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA98B10E255;
	Mon, 31 Aug 2026 06:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PUILkd5q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4134210E255
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 06:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788159025; x=1819695025;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xFLJiTLMtd0DXydnCr84UrZ2rFY+rauywLb3gtTEuPA=;
 b=PUILkd5qYzdhh51BAvDylsOdCZJE1IUWBzfjHxvwfM5Sr2t9rUxZfM9g
 7qQ29ZJMgXBJRAlKxF31HHrU0MFtIl1c8S+sCquvQeoGsvRSOVJFzj/VP
 Ey37xvB24cTv3Eywgu9me8WyznnZyiFVzsS3/aOBfXfiCoryFwIvL33jd
 ge0eT67Khvbb2ERcNEwzotXAvpFNVSwyoleapVd3sh+fG4MiQerO5UVjk
 QtMzfI9xrVlesEy3XBgU7Immzf9jQXUaRYTgUBBDqVkaXb81fOz+M/NC2
 YmNrRRJYcm0HRWxTdp5Kvilg54osvNMUB1d3Ci5JRqVhr6n3XgsSYYvy2 Q==;
X-CSE-ConnectionGUID: vdo3pCyYQcWy8+EsQwPPsA==
X-CSE-MsgGUID: sMgnBRA8RPa0DizRiPu+1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88482670"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="88482670"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:24 -0700
X-CSE-ConnectionGUID: c6ppupVcRO6gP4vrCiqawQ==
X-CSE-MsgGUID: pBZBAsf/R4eMcS0N+X9bzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="264427411"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 23:50:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:50:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 23:50:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 23:50:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4j/cX7JZ0fNgJAwr1v7Q7aYRM9dOuoOf7IVNy+mat/OKAksJmc/MgeCycGEwoO97P64m4ad12oaejcLqRGl8jt5vYI4kyzUE51KnYJnKUyB5LIVrKeCXIaG5K6LXzgs+9bvCeNzVQ9pbPUhwpNvUO5+wbxzVxx29+JJHdQiBSjq9+Fw8jtv3AU/8Dy4UiAqSQ4X8weOxfjowqtc/GtVqIC6FeOQsBLfW3VCd+uWQPwH2RDTY37ryzV+wTh+OFM+bvxDvnsN4AAJdwhWLcDs8XD0bIy9DKaUii1phFdyccRTYxBeCBF2tbSs2SOjFVKK5uOLFEZfR+QUoPI738kYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GiD2sgJenbMHoUDwo45ja+/wQ/fj3bo9Wujqp6A52hU=;
 b=k7r7KIXrbBhEUhT7GwSMCZeQHKHe2O97x4cQ6F2bQQ1zLbKgNdbKEqr7Az8n5N/TpET0xisc03khHrSdYAaUdIdjN9DQtSynvBZ7D9fv8gEGN+XuyTYQkOLZnM6T3tZYRzo7Xke4JEHfScpMnLGZB7AxGMiAAIEmVYV1o8Sq80Hz7F8aioMRvCBDTguMIJd6oJqvhlK2ssXQouwDKLXMgf4aBMVpOilUeJ5HJiTyu6FuV18p0KNdGpUXolbZSB9QqNqdQN8JKCcNlPXjz+2I1QgCIDabX0XMFiad6DdzOn+IITaHxSljnHd7A1tUpFBUFN13Vzn3I4Moa8QfTGwaYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by BN9PR11MB5227.namprd11.prod.outlook.com (2603:10b6:408:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:50:20 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%6]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:50:20 +0000
Message-ID: <3730aada-0c6c-4841-9ed1-d5d0922dd523@intel.com>
Date: Mon, 31 Aug 2026 12:20:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/pcode: Introduce xe_pcode_read_timeout() API
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <sk.anirban@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260729171546.3368457-1-karthik.poosa@intel.com>
 <20260729171546.3368457-2-karthik.poosa@intel.com>
 <16d977c9-9ded-4d61-babd-b71f56e427da@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <16d977c9-9ded-4d61-babd-b71f56e427da@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0148.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d7::18) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|BN9PR11MB5227:EE_
X-MS-Office365-Filtering-Correlation-Id: f7090220-535c-48b9-fc6e-08df072c1fd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Mt++E8n4ymFeFNa452NJToBxMgDjglO06+ez0m4JWe71CPY0NY4k5O0Ue2Kz43esQSo/hgWsjSwBZWMjVcoouzraX9XZn1qiR+9JmVHWee/OtfWAeNeaOFbe6c2HBvXJFk268wbnavJ15ZHea74bzNDx9v8Vmp9q4qUeajk2Srey6629OMJB56NzkoHtC3+B9mrooE4vJ3Ye6pHEzp6JQPS2kXCcNKJ5vYA//IBfUAhPA+/yAUt5+npnyFGW1qFGtz1MstHZelg6alCkOrAgtPyZUTkXmAtKWCLq2oDa3MHfCgBy+0tqLMe7RC4359A0IO6QGVfqU0K+EwC8eaJpgql+Wi9fjah8dwz2aKV+iZ5uCGqDTwQxI0OM25Y0LZYpC1j3oyAAB/i2B5/VqEApBWAEK6dRr/h/jT09Lz3DGNPmnCQomymPzqUDOVTQj26yOGfofs43b3N56B/LVfIfWGDfVV9kvK1n7t0/pHpZJgd8wyTCC7L6FqYe9B/Mj62a0w4IR26RkkdM4SKstyX5r7IZOqkZJw7/qDueGgYVkGoLdNIpBPfl+CMONAVEXDm91M/YRP98KYQZjdTLXhwHWjTv3FDgg7MonQ0iT9U1B5z8aef7+1RRi6EY44/MRfwyEm9BVmJ2M/vjrXBy4M4lHWRifGNIJs5vuAaeM3G7WeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9rWEVOT2JlRjRCbjV2NGtMbnFzZG5Qd2pESlZoc0RQcHEwd3dQTEFsM2xj?=
 =?utf-8?B?U0FaWDZlbEd4ZmxtcGNncHo3UGJzTk9YNUlYbEpaV1kvL0JkMnJITUFCZ054?=
 =?utf-8?B?S2xjWWRsazlHRlF5czN1RDRuQ3Ria1VxZWxQSFhMSnhnSUtobThVTmlLV1JS?=
 =?utf-8?B?a3pRbExzWFE4MkU3MTNrd0JhdE8yYWVSakYwRlN0SDdwS0hMSVNIU3ZFbHZh?=
 =?utf-8?B?dmc0Vk41M1RXbEFhQUdwdUlvNC9LOUhIdlg1YWpaQ3RJTXhDeWdrRG9JSHNt?=
 =?utf-8?B?UC9ERXdSaXNGOFU3dXBIeGNBZDRxZlR6MGVCV1BleVVNdC9XZ0pqdzZkVCtN?=
 =?utf-8?B?MDRNa3N4TjNvSUVzdks1dk8vYnExalhNQ1dlbE16a0NHZGIxTnZDVnVTblhZ?=
 =?utf-8?B?TTl1MkVycGdhcVNxa1ArWTBqQSsrTXVPK2lDUmV1MkVzR0I0QUl1UUFVSlBO?=
 =?utf-8?B?cHk4YXNYUVlpUnN3RTRZQWt1bXVZWUhCakZ5c09XeHJVMENWNk00ejlwcVVE?=
 =?utf-8?B?YkQ5ZVhPSWM2dGwrREJKTlFBRXc1WkFHczYySHprNVdubS9vbHM5K3hEd1My?=
 =?utf-8?B?ckUwekZhc2QxcmdpR1NubTZyTFdNZDVRU3FYVzV0U3B4U2pTaitETHkyNXVh?=
 =?utf-8?B?SDFZU1kzc1Rvb1RhZGpnY2QwaithM3B0S21xZGpVZEpFWDQyVjlWRU9aSUFn?=
 =?utf-8?B?dDJPMGdiYmtJL0dhTlhQWmVaM1Rtc2RBdGRnbERTK1RSai92Ni9kQlFEN0ts?=
 =?utf-8?B?Z3Y0cnI4dXN4T0FROUJuY0dBMjFZNzdBem5VcTczc0RCOUg2S2RuWGNiRjVW?=
 =?utf-8?B?Z20vUU53RFdwWWlkZ2hpR2xJM21LWU9RZnhrKzVxM2g1a1FRUG9DNmU0dmcz?=
 =?utf-8?B?MTJ1MklLOWVTSFRZV1NQZU1UeWVyVHloN240bWVPYmZ0clpNeE1XUVNEM2Jm?=
 =?utf-8?B?elZ2SUduMDZid2NSejR4WHFjQ1FYS0NDZVRJa2xDNWdWNitjeElML0FOSmJH?=
 =?utf-8?B?U0dZcVFjTDlTdWpYbmhnZit4Z1NSWEpISEtXbWpTcnR0YUpib2hVZU1jbksv?=
 =?utf-8?B?NW1OazFGUC9iK29NNWErOTREZmNVMktTbTJNTVBPWCs4emZ2WEJxbVhpZnZR?=
 =?utf-8?B?cVhwdHp4dXVoTEpra3ZHVjhvZTdEU01ERlNMNFF3NlNtNU0xUWxoUTFjMmF4?=
 =?utf-8?B?S29mdURaNWFaSDMyTlJjOGpkL1p2RnF1SjRxYmJJZ3dvS1NyUEs5eHN6RTlE?=
 =?utf-8?B?RmFxUmprYTI3UFM4WlhjdWhaQjgrT3dmdTR2MXhOYktPb0tFWFp6bFNucnlW?=
 =?utf-8?B?aGdnVU11eHlwMmxPbDdvdnZMNWcxN283TTJ5YVUvVzRTem5pV3pIQjBraDFh?=
 =?utf-8?B?eGhoWSt4U0RNSHhnNE9qekVJbVdOci9iYmJhYUZTcW9MQzU4YVplU1F3SXJ4?=
 =?utf-8?B?U3VWOVJRdWNRMTVzZkh4MHVyMXlQNkdmbEFnVjR1MnN4TlpuY2JZWmFLY3JV?=
 =?utf-8?B?a1YrR0padmlNbzJZMURzSjdldllSOE4xQjhwZS9vWmlLY1ZKUFc5eWJiSnNV?=
 =?utf-8?B?M3M3eGkvNnBJK1YwR0NVNyttTWhUc0tqL1NDZ0RrdVZXVzhnT2JkYlA3Wjh5?=
 =?utf-8?B?SEk5cjFJemtyMk1wNzgwRE5DUG1uQ05iRi9RWWNvd2U2U2pwdDZYYTFCZFIw?=
 =?utf-8?B?VGFhc0l6ZVVpKzhDMWN2WU9ZUW1uWTU0cWIvbk50LzdHeTBUK2tpZXFCaWJR?=
 =?utf-8?B?aDFReUx5QnJHeTJMejFqVnptTjRwa0l2VElGanVlTzJsLzJYWlRMMlg5TUEw?=
 =?utf-8?B?TDFPSTk4V0xGL0h0UVI3NUhKbVp1ZXgvWFBRT1JKa1NWZktmNlRzS1lrV21G?=
 =?utf-8?B?YXRaUVYzOVRNTmU2SzcyK0xKanlUYlg1NFRzUDh1SnBrZmJJR0dUOG03NXd4?=
 =?utf-8?B?WXFUQ3VtYTVua1RBWCtlVE9LdlhsRlZPeHZ5OS9qa3hWQ0RJZTgyelpPRE4w?=
 =?utf-8?B?V2x6dk5RMUFQYUM2Y2JkTXc3akhuaW4xNUNJZmk4RjhabjREQzVHMTM2Zmp2?=
 =?utf-8?B?ekJPT21XZnlMYmNJSWUrMUdnUWJIL0FiamJwUDUwdHh6SzZxN25Vdnd2NGU1?=
 =?utf-8?B?MldadXVmMUNONVFWaGdray9EVWhOYm1PUEVWYnhZS0ozamZrL1FWa2tpeUdL?=
 =?utf-8?B?T3k5cjFWOTM1eEhlNUd4eEEyblJvZElOaldpb0FuczNyWDlLNVRabm81bWo2?=
 =?utf-8?B?V3RJSnQwaU4vQXBkSER2TWhSbHhvTXpLMmRTQkpZYmlxUWd4L2xHajdDN09k?=
 =?utf-8?B?NXNvalNBYkVVMjRabldqRFJSY2IrTEh6dmNhMzY5Q05nbmZlZXdUQT09?=
X-Exchange-RoutingPolicyChecked: uO72ByO5l/PHssO/dnV9jqIscVVGoSgl5q8cE0cWYeG6/l5gtutzZlzj6JP9S3gQjvcXRddj1egbjUOiQ/q57+BX553WYkhPo2UrMUCWGE406MyO9ok8J57KL/yjcvsGTKL4Z44mhGt+/j7mEIlxzyhdqVDybCsdymZ/8QKDhwETGoQ0FsROHxG7+Qn1IbookeBkKaBpaG3yGcz8vuh2kX1abwZ3jNS55lrxkUWU1jeMF/8kEZHKsy65tmmB6Xu8BSoADfrOFQyoAIGEjYfBYl9X+YHnvVkI5oK35Xx5zHXHd4oxkeh1Z5PtpwxfjqNDDNw99uREh9PrFeAhz1lHdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f7090220-535c-48b9-fc6e-08df072c1fd2
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:50:20.7390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVeoo7bNRDIhqQFSKLlqQQwHn6zImnGplR+IgHyqy61xUQ4bXXvUTw/1E7nkB1xQuPnIlyDtWHxBb5H11n6EUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5227
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


On 31-08-2026 11:02, Tauro, Riana wrote:
>
> On 29-07-2026 22:45, Karthik Poosa wrote:
>> Add the xe_pcode_read_timeout() helper to allow callers to specify
>> custom timeout values for pcode read operations.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 11 +++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h |  1 +
>>   2 files changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c 
>> b/drivers/gpu/drm/xe/xe_pcode.c
>> index ccc3bdeed6bb..7386113e60b3 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -147,6 +147,17 @@ int xe_pcode_read(struct xe_tile *tile, u32 
>> mbox, u32 *val, u32 *val1)
>>       return err;
>>   }
>
> Any non-static functions should have a kernel-doc
okay
>
>>   +int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 
>> *val, u32 *val1, u32 timeout_ms)
>> +{
>> +    int err;
>
> s/err/ret
>
> Thanks
> Riana
okay, I shall rename it.
>
>> +
>> +    mutex_lock(&tile->pcode.lock);
>> +    err = pcode_mailbox_rw(tile, mbox, val, val1, timeout_ms, true, 
>> false);
>> +    mutex_unlock(&tile->pcode.lock);
>> +
>> +    return err;
>> +}
>> +
>>   static int pcode_try_request(struct xe_tile *tile, u32 mbox,
>>                    u32 request, u32 reply_mask, u32 reply,
>>                    u32 *status, bool atomic, int timeout_us, bool 
>> locked)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h 
>> b/drivers/gpu/drm/xe/xe_pcode.h
>> index 8fb3e4ba13a6..c9647c5f305e 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -24,6 +24,7 @@ int xe_pcode_ready(struct xe_device *xe, bool locked);
>>   int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 
>> min_gt_freq,
>>                    u32 max_gt_freq);
>>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 
>> *val1);
>> +int xe_pcode_read_timeout(struct xe_tile *tile, u32 mbox, u32 *val, 
>> u32 *val1, u32 timeout_ms);
>>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>                  int timeout_ms);
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 
>> data0,
