Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A5EC61DB9
	for <intel-xe@archiver.kernel.org>; Fri, 28 Aug 2026 11:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6910E002;
	Fri, 28 Aug 2026 11:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CIksE0+h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924E10E002
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Aug 2026 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787914973; x=1819450973;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=59Ebm2Cn/ZTJo6a49ep5yFOq9llIGl3YxdPV3kTkgfs=;
 b=CIksE0+hUo3h5lS+9CvOJ4NuhGqIYacgvhGr/nEQxOag0PdSFrYd2Zue
 oQHBIuweXMk+GgxD1AGa5TxQ1OqMj0bSY2pXTe61On+/DxQWQ8UiU7X8l
 O6OfBxDL6Fb5ZBf4HKQsvRugcAkP7qCKh4fMJfAeogzL36PP/B71DIkPS
 XNR9QlrixwKB+4YLQtS4kKb7ZBOQJOeqP7tZ+75vTA+ehqplM5rMqN0uz
 2Ny5ZnQ667TMbOq4fLR12jAMXmNPk/Ms31PwhDLhs6SMD/P3HolepO6kP
 d0y+0FWovL+LZg8au6gCVl/LWwGMKNCQZEXXj4jX3D+wqrC8kX3aeYxAC Q==;
X-CSE-ConnectionGUID: N31vGD7tToS8qfbAnJ2sBQ==
X-CSE-MsgGUID: MPH/V/phRIyXUGyZZl2CTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88472705"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208,217";a="88472705"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:02:52 -0700
X-CSE-ConnectionGUID: OkE0YYzRRFKxh6bpxRz2eA==
X-CSE-MsgGUID: V/atm+78RM2wh9lYlwubGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; 
 d="scan'208,217";a="264357323"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 04:02:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 04:02:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 04:02:51 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 04:02:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSaSKXup/GW0CWTHTLwJ0779qtyL1u1Qj1v2e26LofODqai7y+toi6oiowM82DRmpXS6+9WZbKXS3Z31lvWK8B4tPPr2JzGZCkrCi57/LroARoKSy8+Uv5ZHnEDXA/GpdETsvHZCyL4toUwAV/a7UpG9DI5GqyOsfo0uV/HC2SOGXumUoSls2DXxHOn+T9ghKWQhzwZ5MBt9ilYe6fcokE69ugywJ6Muv8DYJLTwwlyFsR7uA7jy4pMJnqcdfpvFAUE0LEnDThrDNNdlCUeY4AVXyRN6fI8iGTplkwBBClTJXqAZQ/IyvRjoSLneGAY6QtoJV2ySKaQhNeJn4eHisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnrkQEUn19kX0FfnH6cO5wCDirdupUWiVMiXr+lrC0o=;
 b=cd9s0vWfciZnWN/ahLGpGgk08z7ACOtif+5f3wfd+b2rgDHIfFQvxVJt0IZ5PFkVkEEiF/MgBWBnffshXUiDF3FqXEbshIjzo9yjhxjnvaDmsVwsW9rKTGBMv9RcdmTkxWEr/H2OyRlEA+SKN1wuav8VG9f6UbEJKMS/pWUcEDt09cjQtDEVplkDwwM8aAQNb3GLMcANOCc1y2MFyM6VJiItke8MXNNKGiCbzg77m36yHdbT0qxAhRwidc2pqelj2fR+ttAR/yiE838JwBTdQDk7GdQFbzrW38oVlCXpK7fbKxfdvc/EScswvQJZo0GS4SHXS/7YTXcD8S2IVnr5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS4PPF409BB8CE8.namprd11.prod.outlook.com (2603:10b6:f:fc02::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Fri, 28 Aug
 2026 11:02:49 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 11:02:49 +0000
Content-Type: multipart/alternative;
 boundary="------------IoWq46RW2c02rf0V7KW3d40A"
Message-ID: <cc6117d8-07d5-4338-b6f8-9e1c7f6f2e21@intel.com>
Date: Fri, 28 Aug 2026 16:32:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/xe_ras: Add support for PCIe error component
 handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260825141109.3797483-4-riana.tauro@intel.com>
 <20260825141109.3797483-6-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260825141109.3797483-6-riana.tauro@intel.com>
X-ClientProxiedBy: MA5P287CA0208.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::13) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS4PPF409BB8CE8:EE_
X-MS-Office365-Filtering-Correlation-Id: 2107bfaa-0a9f-4171-140c-08df04f3e5b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|10067099003|22082099003|18002099003|4143699003|11063799006|56012099006|8096899003;
X-Microsoft-Antispam-Message-Info: SgH1o7usM6v+C/0S0c/Hpim2JXRnjdyMV5a2xtBn7tP37y0OiFaWiOLhMwToEV8AAidPk8CjZNivdeLHajVrIs36KVt3G9Xn5MJWHF3Qxf5E4vcBXDoebe1QUVYKrAjdZT/vch2N9aYb3LxU8tUtrOKe/vFdj8xuCURXJR08J9kQ1x5qFQbW9WCdq6wPAf1tPg+S4CHaDgyWhISFB5+It4tI6VDT3pzl7UGg0r+RgUbQ4bWEkHk6t7naFKBiWiYniTt7zVdxMkkNntnDwc19aqPfDfPnupa08NhIVj7dMAAVg17WSCUebFzE+a1duyYtFU1DgoD2cYJqAfZYbD4hA6D4X75K1jndVRAnQcD28tkBJcEY1RvnGWb6uO4x4GZQrYxY5Z+X+WIj+hSLeYvkY0BpF7uoPT1u61SB5ogsDMa+9QhqemVtLaDJlECN1rol7JBGfq4+Nughy0sWPH6tWgapae7o1BxOu3wbVuzb1+fpvFSZrATBOMbpPYhbYKprYO2S7TvFCcgaQ1ra4rXRZZGw0ELJ510awmL4X3cl61qTq/E6KJ43Q6PME2xtxYKco8+dMmN7qOMonCVdDer/XFOlsav59SV/zVzyNZE+w5wJ4cTeo7fzVaL6w3v2mB4L2J3NaYAznqOtA1g989t7nASjmEtjcmy5KyLzY45XI/Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWRKQVJYdEFlallhVWlPbW13UnR6dWY3dEJrQXJNZ3VueDdsMm5GTEp3cWFE?=
 =?utf-8?B?am4wV2RQQWVJa0VzTVJkRnJJMnMzTUVvdWhTeFdZUEVacndtaXRjSkdXYlVK?=
 =?utf-8?B?S3hZUnIzaFErWnU3OWRNNnZrSjBMdjZ4UWFPV0tpZTIxdjZsbFl0YnorTWhP?=
 =?utf-8?B?Y1FSOE9TNUdJc1QrYS9FbG0vSmtqZXlJTFF6RWVWVGZBbGlQdzZUT1BXN1FJ?=
 =?utf-8?B?dnJHNUU1MWlSWEs3ZFRobWxuaXU0b2QrcHBNQjBsZVd1L1g4RVBUcU5oaTEz?=
 =?utf-8?B?eWpmUjZuc2hmY0d4MWZFZnpxWHY1RUVtVTRlNkhOYktHVEdDak83R0pFOFJt?=
 =?utf-8?B?Vk5ZUjdwUzhLNUsxaXNBNlA1dXU3MTBDeU1NVDBkTDU1Smw5dGVNYkNkRWIr?=
 =?utf-8?B?V1l5MERiUW9hRXlOdHNvdzh6M0VROG9pRW1lZDRIR2dOTXNwWXViUnM5d3Vo?=
 =?utf-8?B?amt1TkcreTIyV1JkQ2FvL3VQaWFweWpLRUFXRkpWaC9ST25HOENHTzl1V2R4?=
 =?utf-8?B?UW15REhmR002ZE9FYk1ZdkdvV1ZqNHJtTFlPKzJtVC8zTUZSOFh3YlA1aVFU?=
 =?utf-8?B?SVJET2V5blYzeGRCQjE1ZWI5WS9YL0hGWlJLeTdsY1Jrc3JKVzdHcXNueDcr?=
 =?utf-8?B?ZzZGbGdhRW55dkZrMFdYeUlYUTJrWDhldlE0dVVVNm9KUG1qQnlKcE5LMHhm?=
 =?utf-8?B?bEoxaDdrZVpQNzlqSS84NVVTaWlaK1hONTlRUnc5NFZDQkhHL2U3cmRWckxa?=
 =?utf-8?B?UlQyeGpCdlA4bU1lMFJScUdJanNvdEJ0YzgvZUZ0eTJMRXd3UHZTcDVqQlMw?=
 =?utf-8?B?eUhNdnRDandyQkRZSVRpemcrM1B3K1VMS1BjZGpzOE5qeVI5TWIxVFYremlI?=
 =?utf-8?B?OVZObEhGcjN6blI1ODVDaE1aQ1VIMlBqMThQNDJqQmhDZ3FuRy9vTEp3dlpw?=
 =?utf-8?B?QUMvTmZGYmRTVDRPd1hqMnd0T1c2SVJhdmFReW4wb1pJQm9WSjE0dVRwWE5t?=
 =?utf-8?B?ZmtobFRINVJoWXVJTjdhbDdpenBEMEFCQ0hSSTRpYzZjMlIwTlgzMHI4SUF2?=
 =?utf-8?B?UmZZVnd6dE1pRGl5UlpyZ1J0cExnQjNIcitNdHBjZWdJUDVXeWRZQ1BXN2d1?=
 =?utf-8?B?WjlZa00yTFFYcUJtOGhhYXo4elZ2K0dkQ3dVOUd6M1Z2UWQzRUN3SFA1Zkhx?=
 =?utf-8?B?eXRHVzl2Wmdad0RydDk4bGV5M0hndUtra3Q5ZVVZYzdxU1dMeWw1elcyeXZ3?=
 =?utf-8?B?WHl1MGZpb0ZRVkgxR3diZmtIQ05xM2RrSGNUSk5GU0RDMFFRcHpsMHpITHc3?=
 =?utf-8?B?RXlPNktyTmNER01WZTc4YUEzOW9ZT1FFbVNSYUwzaWc3Nzd4bVFUbFlnYVAx?=
 =?utf-8?B?WENycE1HazRoRGE2c1Exc25VeFI1cnJyVE5BQnhXdmF5cHJRQzdkejJaSVh6?=
 =?utf-8?B?NFBzNUFTZnF1TUJzS05aZ2tweENHYUJvKy8wbDQ3RytHSlllZ29CY3FDeWcx?=
 =?utf-8?B?NjArZE5WU0xpRmgyZ3d4bURzN0MvVGcvaW14YUNXZE1MOW9QN2hpN2ZqZzZI?=
 =?utf-8?B?aFFuQStKU09LeXNDdWxxT244dXhhRThEWURoekowYW5ndHpxRWxnM3ZsT0Zz?=
 =?utf-8?B?WFJyR2hiZkM3YzE2VmEzTlY5NnhwelJ5T2tYL2tCN1k5Tk51VGNBYkdPYWJE?=
 =?utf-8?B?cGROT09CdXhvU04zUUxkM2o4ZVViTXJsdTZuYWJOREJMbkxGRGRvL1Q4M2dT?=
 =?utf-8?B?TUVkS0pEMitra2VLMXo0R0dKQTJwemszOEtmeFFTbUd6QyswVStJYWhhWS8w?=
 =?utf-8?B?Q08yYXVLdUEwUlVwL0NPYnJTZzJPbUxoSENpNGVSbEhKTHlxWHhMb3NLN04z?=
 =?utf-8?B?enl2R05xUExEQ01zRDJJY2tld2hxRjczSU8xUldLRFRUNC82eGlGRCtlazVN?=
 =?utf-8?B?b3ZFL2h1N2JvSTFEdVRkRGZET0ZJTFhlWm9ma09aOWpkSEg4M3FvbWNkaGdS?=
 =?utf-8?B?aG1MTkZlRlprb2xMdGk4T2dGWUdtcGJOUVFpRmFHcVhMQUs2OERFVnRrSytW?=
 =?utf-8?B?SytHeDY5NVR1WDh2TjFFQWRzd2h5SGw5OUdKV1gyK0U3a0c2UkFMWHhnSWtD?=
 =?utf-8?B?ZjE0WGowT1ZxYnI0aGxkREdDZWM0cC9IODArdUVxb2JDcXJiMEdJOVg4OFJT?=
 =?utf-8?B?cFpOMkpRbUswNEQrUkFacWlJZDRtUEVqN0JZVmt1MkhpUDhReVpFVS9DazJX?=
 =?utf-8?B?dnlrWmkyYkwvSnpzTWFzUit1U0NBdy96cWpjZzdNZE9nN0Z4VVArOGh4NlpJ?=
 =?utf-8?B?ZEFYTmp5NVcyd3NwYzFBTGg0M0VtTk04aTRRRlRDNGRWQ2J3cTBJNmZFakFk?=
 =?utf-8?Q?Q73MwceYq/V7plaw=3D?=
X-Exchange-RoutingPolicyChecked: yDg/27i+8t16AEpXXxby0D5DlubPZZZc0ppAdfx1Y0j3IREdDVWYlFWLaO7amgBztHl4FXHqzdMursg9IfDg72keOqxqXmr9G7IICwX3D8W+PDawdoWTvo5l7UzJJqN42Wg9DTTDsJPl2KxcfuQTcpqz6XWmyw3FLJam5jm3n2wfMisBL2YB45eL9jOdjuxIOgN7d+epvZHzrAE4bCMDmvCZJa1vjU1dS3wxYzmPPbzocBFsfNVxaT/hEWj9mtB5W3cbsr7wq0Ck8NDtPGneRY9rVGZd2Wrxrlr9nN2+Y7aP8JxajBinBR+DWxcE9Ev2b4Ute7zL8KY0FIAI43zGjg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2107bfaa-0a9f-4171-140c-08df04f3e5b0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 11:02:48.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pEUPi3FwaT2B1Gkmz0d13kgpl5DO/XKo3cO1HzFSr9Xfqkavn0HhqXu90f4faZkW8srcoSSU49Z9Y1tMKfp975jO8b0vwFFcayrnJf6K080=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF409BB8CE8
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

--------------IoWq46RW2c02rf0V7KW3d40A
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 25-08-2026 07:41 pm, Riana Tauro wrote:
> PCIe Subsystem GPMA errors and other uncorrectable non-fatal usp errors
> are collected and classified by system controller under component PCIe.
> For PCIe SS GPMA errors, request a Secondary Bus Reset.
> All other PCIe errors are treated as recovered with no further action.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h |  1 +
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 586dc28a638a..39e5fdb9770d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -394,6 +394,21 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA) {
> +		xe_log_comp_fatal(xe, PCIE, &arr->counter, sizeof(arr->counter),
> +				  "GPMA error detected\n");
Use xe_log_comp sigid helper function with arr->counter.common.severity
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
> +
> +	xe_log_comp_recoverable(xe, PCIE, &arr->counter, sizeof(arr->counter),
> +				"Other errors detected\n");

ditto


Thanks,

-/Mallesh

> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>   static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>   {
>   	struct xe_ras_error_product *product = &arr->counter.product;
> @@ -572,6 +587,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_PCIE:
> +				action = handle_pcie_errors(xe, arr);
> +				break;
>   			case XE_RAS_COMP_FABRIC:
>   				action = handle_fabric_errors(xe, arr);
>   				break;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 73517fd0d415..0a9747df8a69 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -12,6 +12,7 @@
>   #define XE_RAS_NUM_ERROR_ARR			3
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
>   /* Bits 16-31 represent individual SAF MHB unit */
>   #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
>   /* Fabric Data payload parity errors */
--------------IoWq46RW2c02rf0V7KW3d40A
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 25-08-2026 07:41 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260825141109.3797483-6-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">PCIe Subsystem GPMA errors and other uncorrectable non-fatal usp errors
are collected and classified by system controller under component PCIe.
For PCIe SS GPMA errors, request a Secondary Bus Reset.
All other PCIe errors are treated as recovered with no further action.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_ras.c       | 18 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 586dc28a638a..39e5fdb9770d 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -394,6 +394,21 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
+{
+	struct xe_ras_ieh_error *info = (void *)arr-&gt;details;
+
+	if (info-&gt;global_error_status &amp; XE_RAS_PCIE_IEH_GPMA) {
+		xe_log_comp_fatal(xe, PCIE, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+				  &quot;GPMA error detected\n&quot;);</pre>
    </blockquote>
    Use&nbsp;<span style="white-space: pre-wrap">xe_log_comp sigid helper function with </span><span style="white-space: pre-wrap">arr-&gt;counter.common.severity </span>
    <blockquote type="cite" cite="mid:20260825141109.3797483-6-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
+
+	xe_log_comp_recoverable(xe, PCIE, &amp;arr-&gt;counter, sizeof(arr-&gt;counter),
+				&quot;Other errors detected\n&quot;);</pre>
    </blockquote>
    <p>ditto</p>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260825141109.3797483-6-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 static u8 handle_fabric_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
 {
 	struct xe_ras_error_product *product = &amp;arr-&gt;counter.product;
@@ -572,6 +587,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_DEVICE_MEMORY:
 				action = handle_device_memory_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_PCIE:
+				action = handle_pcie_errors(xe, arr);
+				break;
 			case XE_RAS_COMP_FABRIC:
 				action = handle_fabric_errors(xe, arr);
 				break;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 73517fd0d415..0a9747df8a69 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -12,6 +12,7 @@
 #define XE_RAS_NUM_ERROR_ARR			3
 /* Error bits in IEH global error status register */
 #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
+#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
 /* Bits 16-31 represent individual SAF MHB unit */
 #define XE_RAS_FAB_IEH_SAF_MHB			GENMASK(31, 16)
 /* Fabric Data payload parity errors */
</pre>
    </blockquote>
  </body>
</html>

--------------IoWq46RW2c02rf0V7KW3d40A--
