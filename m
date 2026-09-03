Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED71DC61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 04:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9DB10E060;
	Thu,  3 Sep 2026 04:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TK6+39CE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748010E060
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 04:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788411578; x=1819947578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CRoN6mXyJnHKnPpxfD6jJhnT1jZVLBivXdYTHAXOJd4=;
 b=TK6+39CE3LqAlRrgFejsirwNO8SgFxJVXVlRiI5+nO5gbfGTeK7T6MkA
 OAIr5Y3oJ0cLXxeC1aCYtMu0gBkC8EchPeMPMEHwPOzh+XC1RdC/fyCy0
 a3zREArbQ91+CZR71W8XMY1MybqtYtMu/eRet/wystbTy69pUdh2R51JF
 MUE+ldThTl6TGqsU/00nMvghEB59Li+M1lPevLFie9zwB1q73VzCmnXGO
 XiiFwZBG/bW29Lv6p7kQhD3vFZNzSk5HIP4yvitGQ88ETYleD1PTedzWZ
 81tJaHqwSIgvQYhmxxV3WuyRC94CjtcV4xXrFOmh2euBgzTmDXX/lu5X/ w==;
X-CSE-ConnectionGUID: BYXjUzC2Qfq+WnhIwKvc5Q==
X-CSE-MsgGUID: 32EGx9/uQeukZfXWZ3j3/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="111653872"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="111653872"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:59:37 -0700
X-CSE-ConnectionGUID: uKUTAeSTSMWxEeqnPig5Zg==
X-CSE-MsgGUID: jM2gRnPXQ/2zSB6ds/NMlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="267847602"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 21:59:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:59:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 21:59:36 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 21:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jyrAVwhMFnttpLY0z03SutYV5Tbw4rUoGgdRcBEVZIsTBw3Ls43vB0qitO9dL26SiJs3d3Wd5Fzw7SNycuenO/Ar//nI8hJulkgtCQRSD+zjGaMlwDQnOtia8EQ+G1fNIKdL+ynVvpPvS4xdb/xjTsvieD4Zilxy+3BscAAxMikt9AqODx35wECjeC2dedqHHcMkFce1kEVthpG179d4B1zSs3FXurKKdhDQWZXMl4sbNvaOGTO45aLB30kAGN4KbCY9M60shU2te+tuxAQk/TJ93nK5HSzM7GKis1bPHIjF3g32nFcFsk+7UnEFTS7/xPyADrpyvYWyzjmuQLHFOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbclHKj0bgHGeOI11da59bdlEDp5mMGwUdYh1Y/8kEg=;
 b=qJn8PvySGk0/2TsH6+WnaUlZGU1Opqoi9erdrK6fTpqSDanbDWBO8BeywH+bcce/MVRbAxyD+g1fXEcm34Q6/k9vy9akfwprw/5QD/D14RW83b/jDUpr1o8wcEWBUeOBlLI+0aoU1/1SenguaBbryfFE37DnrdTLXjbXJXl95zxjBiQoYeCbnJISyhGR2rX8YdQPMui4YnxlN1CqkBeLO7+p5EfiNvq4LAC5eD2humNpgV+QqN8pz2lNOipZQEnzP3UeDeSn19bjYkHCppYEbXFpRVERaJMj3SICHaicRsfzrUrpc0TmCpQgsCIm6RQj/w+kLEHcrwWOfnM4PB6INw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 04:59:28 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 04:59:28 +0000
Message-ID: <464fa6c8-1ce5-4a52-853e-f6caead81703@intel.com>
Date: Thu, 3 Sep 2026 10:29:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/9] drm/xe/sysctrl: Improve firmware response error
 logging
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260831104456.1770605-11-mallesh.koujalagi@intel.com>
 <20260831104456.1770605-18-mallesh.koujalagi@intel.com>
 <48c21c94-d372-479e-9c80-c0b952bf51cd@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <48c21c94-d372-479e-9c80-c0b952bf51cd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0093.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a601fd-cf2f-4eea-e62a-08df097821f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1Uh+iLn1ycxVxEi3FBRD0SkmGvqLIn7ape8ohqO93EDujdCcMK+s+C3ft8jqR5zu93Md20hd/fcqfYqeJevANOnjpp0Zh7OY8PLnLguYIc4kUdpr5PUO8Wl7+ewU99UjQw9mcNy/jPKui60Gj//Jx3uZrv05CfL/uOdKRZbN6mBe+fr4sR9rucdgPAWk3c2GebANOA5TlhC2g+7S4K2ZMd+zQJXHUUDp9Iw8p4rfSwFldDva1aBiWc0Ld9VKn+kI/GV05UXbuFXemGPb9GeyyNjpI1lFLhzblVMMrh10svY3stwCRt5fmgo6A+gPmRMwOfMcFBjpuymVFTZ6IiEfwPsauW1tBWgJ7j7NwoVQ1hhOj186Ou5atc84gpptYHPmYeV65NvpNXhkE3qHJfJixmUsk8Z7NFApmonIzf41XtJsdDWBcKFgASC8pdAf3//wWBAVOg3PoYavoa/rEW1GidboxWGrXtUSslRTpHMrmQ1HFIgPQ/hnqOrzZaxjkJ2xj0wPazoCBSRWsQrfiuhwT8bHnXwqFWJAyUYDZda6t7AtJZHZC3HeOoDzpRMz1y97dwYUFt/GttFeFEAQavQS92IjXKPK3UoLBFXs+pex9YX9d9/vXEf2HmAPmH6RkSwUXvNrtkcBZWZwrjKJ5uC3ELmhbAkWo6mrjEfq237BkCA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R21hWERzNnNrVmxmVlc1L1dDSkF5RGxLNVpaWmFCUkZwcHRWTVIwdEdwa3lt?=
 =?utf-8?B?cGk4cG1Ba3BadVIzUlNrRXZOTWNkQnR6aU5xUW5EakVXRkdiUFhSK3VFQ1do?=
 =?utf-8?B?UHI3dG80bGoyNXdkcVBXWE5oZ080Tm1WS3R3VHExOWdGY0hsRTg1V3NqeFV0?=
 =?utf-8?B?NS9DL3A3YWZ2V3NUemhvTkFlbllMb1N1QlhjbXl5b0pRYzMxM3ViUVZobmRY?=
 =?utf-8?B?ZHFOZnBrYUhJSERnZEFhVlZqdm9leDBoM1g5U3VDd0gwNmZ6M2VJSkdEMFJV?=
 =?utf-8?B?S1J5eG1XQU1WcCtJdno0cHBjN2xnV0FHVDZGMEpvNUlNaXhBd1Y5V0dYbThh?=
 =?utf-8?B?Sk03RlJxRWRQTWl2WVYrOER2NExuZDJTSm5TOTYweEU4Z2xKUnpqQ2dWZFVC?=
 =?utf-8?B?WUlFYWhZa3Z2aEhtaHpSRzIvU0hWWUc2a1dwbnN6NEhUVi92emowWG4rMnk2?=
 =?utf-8?B?bUwwWnVxRXhvd1ovY252WUpDVEh5U0R3WDVNYkovVFZJTEJTUklnV1J3U3da?=
 =?utf-8?B?b2xhbll3cGtkK1ozMW10T1dSb2hOTmtFdHp5cU5HazdCZFJhSTQvRXJIV3RK?=
 =?utf-8?B?MHBvT3BUdG1EQlRSY2hsck1ka2dSVFRoYmNXcDhSZVdkS0dmeFJQUDkvaUlm?=
 =?utf-8?B?NTBjWGNZYzRHbXVVVEJhc1BObVFFUFoxTUlOTUhJRjZCM3JGMStyd01pNHRu?=
 =?utf-8?B?c0xOV3l3Um9CUHFLMG9Lb1VwN2E4S3BGbG9lK3lwVUFPSjZzeXRPbDh2Z1VY?=
 =?utf-8?B?YjNnWkRyUEN6emZsUjhmRXhuZ0dkcnNQNC9MSVFqMWlVczBrdktWazRhaXB5?=
 =?utf-8?B?NW0vMkUvbFY3cnNTaGtjMnM5aUd6NmpWb252TklrSWV5aERxMHpEVkV1ekpB?=
 =?utf-8?B?TXF0ZUZEcUFENTRjeEZhNk1TK3ZES0tvYTVIbEpneXMrYUZhanJwSXYvMW1p?=
 =?utf-8?B?dUo4RzN6NEdvNGd6MTRIYnB2NytRUzVvanRlZ1lxSExLVnRVSkg3SlBKWWh0?=
 =?utf-8?B?cVFYUG1FNldOSjU5aVlqazlObzYvQzVyRXhYdFRHd0tjQ20vajBSNUc1cEtX?=
 =?utf-8?B?R2hIMWFBMkNmck5LdXNMcUQ4dGtXSTUxL2YzZWNVRXFiRExnT0srSzlaNDV4?=
 =?utf-8?B?S204WWNXQnhnUDNiWXZoeHBPbXh5VTQ3cGg0NTZtdG4rejVpYUozVzNaN2hO?=
 =?utf-8?B?cGh5dThLNGFkeUpKVXZybnBCYUlwWnV5M1hHY3FFZWUya0xUUCtzUURHMUpn?=
 =?utf-8?B?N3VBczhldkRoWFcydXlNbU9kV3BCd1REMG9TemV5NmowYW1MM0hDWDFzMzFr?=
 =?utf-8?B?S1h3ZGp1Wk8ydVl3SkxCN2ZRUzZ3b3pISnA3SllIZTZRbkNYUlJJMm5YQUNY?=
 =?utf-8?B?TitERW1ZUmh0TmtTNjRzL05sb2tqMnlkNTUxU0dLaWZjZHk0UDJwaldDa2Rh?=
 =?utf-8?B?R0VrUmgxczdnL2Q2QU5rR0t4UzZpdGpHbi94Qm1ZWlVRdTVENmJZVjdmU0Jq?=
 =?utf-8?B?Vklnek9ZamFQRUdJQmRORXJLQllyS09QbC95aFdjL0t1M2U5emtOSWJWTUw2?=
 =?utf-8?B?R2dsVVhKRjBoVlVDY1BRdEdyaUpDV2VqRzdBVkpoNHVYVVJUNXRlOVduTVFo?=
 =?utf-8?B?NkhkYzBReURobjNhRys4SVJTUmxYZ09EZXQyN3A0TnJHdmdQNEQrcWt6UzZs?=
 =?utf-8?B?akZPWTBvNnd0VVNtcEttdWsxU0FVdEs4bVRuWkV6NXZydmJ0RGlUTHZqVXhk?=
 =?utf-8?B?TmIrck1WaTdXc1ZDaDJFTFIyRXdZM3lXNjJNdkhLengrTU9HWHN3RE5SaEJT?=
 =?utf-8?B?REprd2R1akFxdFVrSVB1VnRpUGZ0Y282YUloZUd3QjExWndXNnUyVTh2ajd5?=
 =?utf-8?B?ZE5BOC8wSXE2NGVERDg2WmU2b2tpL2hSZVkvSVRjZlhCVlczU0NldllJVnB1?=
 =?utf-8?B?ZGFjWmNxUE13ZzNjS2VKSlA2Q3o2VDduNEpXeG8vZkg2WnZwTVNOZFIvTlZ2?=
 =?utf-8?B?dzRKM3lSUXN3YWxIc0NCcE52MXRuRkhTdmFXMUxXaEJBdm43c25BYnVDdS9n?=
 =?utf-8?B?aGM3QUNBS0kxUzVmaWtmVlczK2h3T09QNHZxcEFVN3hCVGY5M1V6TXl5b1hF?=
 =?utf-8?B?ZnMxdWlTaUs4Vk93U1pjOUFOK2taakkyR1A1dVpvQ2dCazVHcGoySGx1cENK?=
 =?utf-8?B?ekw1QklIYW9IZmNIY3hXVTFBaXdadUhXQTBaZE9YdjlNd2ZmV0NFbFBVNTdp?=
 =?utf-8?B?Y25YZnorQWw5ZWRvTjZmUitSK3RtKzJZVWJISC82YUJPSXBqcldHUnRyQXU5?=
 =?utf-8?B?RDVEKzA5QkR3cng2N0J1dlBjYTN3amtDRDY5QVZqYXEvWjQ0Tm54Ui9aTDJn?=
 =?utf-8?Q?+UcV1X9ZQrC93R2M=3D?=
X-Exchange-RoutingPolicyChecked: 062nmLqjcw3AMmSMvn5c71CY6Y9wcyFkRChaWKxpL0AhthS+Ao6O3A1FWSCgpGGYaFk2AV3bdBsQpXJpvxJ2mZRkHECPzkJ3lZFOyHcorMbOl1elpsEsGpGV8MDiWpHMLl6YlyyOLQ29fbCbxAc9W8HWSXSflkC01t6D/e80PC47UANHLIzrOzuxE498h+E98vwv3xkspJWfFz+xLBWW8fbZhhcOo+Aq6gdQ8HIY4se3NQ4BGYnRqQPiJh/3calFUTXFjxHZ3uBvnXityLTxAeAqfcuI/2xp6Mi+OByfFOIjszV+B8pJEpO+s/ROhx25Nu6TjoMhQsbURywxYpinyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a601fd-cf2f-4eea-e62a-08df097821f7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 04:59:28.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 066fxgPe46EYLYpx2e+fP76khfUCj0Vce8uz4knP0mjfqVYC62jX2cnOXdSsPNJfWN9D2c+cwL6CaZfR1m3xYcj/zOfwtgyM6l9n5DowYuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
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


On 02-09-2026 09:52 pm, Michal Wajdeczko wrote:
>
> On 8/31/2026 12:45 PM, Mallesh Koujalagi wrote:
>> Use xe_log_err() helper and include additional details when a
>> response header mismatch occurs.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>> v5:
>> - Use %#x after REG_FIELD_GET change. (Michal)
>>
>> v6:
>> - Move REG_FIELD_GET to different patch. (Michal)
>> - Update response message.
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index 3aa868f60b38..87e656820279 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -233,13 +233,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>   	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>   	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>   	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>> -		xe_err(xe, "sysctrl: Response header mismatch\n");
>> +		xe_log_err(xe, SYSCTRL, -EPROTO,
>> +			   "Response header mismatch: %#x != %#x\n",
>> +			   le32_to_cpu(hdr->data), le32_to_cpu(req->data));
> nit: do we need this le32 conversions when we print both raw values?
Agreed!, if we do raw data comparison, it's make sense by removing le32.
>
>>   		return -EPROTO;
>>   	}
>>   
>>   	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>> -		       XE_SYSCTRL_HDR_RESULT(hdr));
>> +		xe_log_err(xe, SYSCTRL, -EIO, "Firmware error: %#04x\n",
>> +			   XE_SYSCTRL_HDR_RESULT(hdr));
>>   		return -EIO;
>>   	}
>>   
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Thanks Michal !
