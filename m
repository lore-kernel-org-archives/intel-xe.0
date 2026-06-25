Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A38FECDE000
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 18:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525AB10E236;
	Thu, 25 Jun 2026 18:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i4+Rgkz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F1510E236
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jun 2026 18:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782410969; x=1813946969;
 h=message-id:date:subject:references:to:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=UGVHeZu0w3qMQABm1/0vVOsCrzJ3DS6jakM/cv0hxu8=;
 b=i4+Rgkz6n40tw3Ds5rwou34N430rUp6R0mHvvHPv9olX/El1tZBDnump
 SurAzy+C9Ie2A9AkQASVmsFByC24PToEcOKdGGET5VBvmDO8/fP5k9Cex
 F/3SfDaKjXm5BP4Y3b8SW79zdc988lkyzeb9BoxDsY3qfhLD6AJ6byfJb
 eVH8dOerT/P3XYzRT3jLd0w0U4CMqv6gezI+Y4LyY5h7F/oq0ZRrNzyNs
 wifrp3JBYBRLFP+ZQ1vSx3bb+ndOzFfS0jOk+q5bwboycjMkLs6wucqqt
 q7oboUKhBGobcBwFUe5dnT0K2JuPzfmMj9CsddLxo9T8DFZZK6RHBE0BS g==;
X-CSE-ConnectionGUID: q5AKIUbcSi6k+g7s9WCoAA==
X-CSE-MsgGUID: sBCgJGW0TYyH/2l++u2Y+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="83385952"
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="83385952"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 11:09:29 -0700
X-CSE-ConnectionGUID: 0ItSBbgDTjaP70m0PXLveQ==
X-CSE-MsgGUID: GTyPQyiCR32EiXDlZ/ZuLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,224,1774335600"; d="scan'208";a="274220314"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2026 11:09:28 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 11:09:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 25 Jun 2026 11:09:27 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 25 Jun 2026 11:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBBJTLp4k1uFflizOR///E3XxcyT6EdbRHyMlciNTBY6P3KhMd07WLDKjvJ4W8XqyHJyEFj5sVK2bld7mT3bPXsz5vdgFOlDmU1NmC5k5JYXLL6xMAoLFdDf4Y/x/1u16QD5qMUcNYBpqsJBo/NoO/3rk/Q/7XWQeUMp8EeGRUfq8KH1V7PBvcUV5VE1XEnkrStuu3yg7nIQ+zLvKMISx8Y39HGTWBNY3oJKN3facZhYY1khNQ2hw5NAFrMZdHWTPQHs6xDoTHnLyYtzm6webZ5+Z77iVEw7UbTwvMRGMYa5zt8RPoWRa9CxMrKU9shRoGljjBSutButCZU28SFTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEMAbjIL4gKpSUtdBrgunTwYx6OzQzyZz8nRJYPtWi4=;
 b=Me9swQOYnx84I1ZlTjCm4uJfmvzH+giIDiO17HZrhVuugvgU/evAsocysIHIRBKxlSZDOHyrPZOQ8R6gumSJKpl8zORPwREM5YFxl3MqBnlLS76FW16kxCxzUlmcKIy1qZBk7C0v4kgQ2QbXFnuvssEDZhNymgi8GLzz82kkZ+FVNqNjFNsrD1XGHcXo9Woc+E5rASBcOyVzysSUr/13OtLvIY4QUHmKD9roo8FZj9EZNOrrqTgKUcHBTz3FSlO1TGR610Ss4s75h7MaFp6oMIoDZYi55HE36JcVixVJw0Q8Ad3WUN+zC9b1FUgWYbiT7DpEdp0vvmsYZ5qztknO7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM3PR11MB8683.namprd11.prod.outlook.com (2603:10b6:8:1ac::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 18:09:19 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::e0e6:a2f:a53b:4414%4]) with mapi id 15.21.0159.014; Thu, 25 Jun 2026
 18:09:19 +0000
Message-ID: <d3532f90-943e-47a0-bee2-e3f31db4d354@intel.com>
Date: Thu, 25 Jun 2026 14:09:17 -0400
User-Agent: Mozilla Thunderbird
Subject: Fwd: [PATCH v2 1/1] drm/xe/guc: Handle GuC local uncorrectable error
 notifications
Content-Language: en-US
References: <ffebb8b2-43c7-408f-86d1-218a0b13cf55@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ffebb8b2-43c7-408f-86d1-218a0b13cf55@intel.com>
X-Forwarded-Message-Id: <ffebb8b2-43c7-408f-86d1-218a0b13cf55@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM3PR11MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: fd3e7d33-e5ba-4e56-1d44-08ded2e4e095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: W+K/496ThsDa18ydWG4DsZC93fF0fd4/fCl8W805k4RuvahDEYUs2MYS9wOjeD7m9ylaXA4ZVqwrh+sEUoMx2nXHgpEUXe3YWy3+D/8aQFu257jMZesFfjT+WS8zKeeg7x5Kp7wI5GwRp+8RodJasd/82KIfte2IVz/pDpZrPsKD9GF9CR0C623TwRJUt9uF3Fhi9M5XjUP9bavOjrev37DrC3GqrlJNZr6kHaVs2xL7yRtDfwOXIy1qRFMpadRSm8sLtSa83XWnwO0ieTj68Hho3ijLX5dSyp0JHRjFVDu/FI2JWpeazPT6UqDvVN/45jO6WIoaqHrL2y0kKcRSqI/L/9p/9OZGbqHvNzQZ9/3YsErn3gelmUz8Wv7B02w7dOaoL51LltXzTOJMt2f+8TQ9gIHdBfns7jhT5cCn0rZw6QuVpGM4EByDG0WkTj9DexPpM3jt3jhT+9doy+QRmYXlGQqYtnsEAkcf4zMKcwAKhnnG5/yUgrvJtFySD3NXY5VqkXgvsvZhkTzxQsPQFTh4k372uYULdPsG5KzqRQaBNRI9VLr8MCkj2KXXoLsoeoBxTJBun3qliaicWX3VZ2/5V3jk45yr9vVw4saFKMavPfczM43bxvch4/lWL4KJDMblK4a6Trwp5V/HSx0cnUMshtwLB0MdzTuefhOaMYo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmZKQXUxR0c2cDExNU5hZU9VemhPRTB6UWFEUEpEbXcvc1VDdU9tZXU5Nm9v?=
 =?utf-8?B?dzBleFpTOFQrRnVaZlpZNzZMeVZuQkhFTm9JblFtVDVFUzAyYjAzdnQ1V0JR?=
 =?utf-8?B?WDViZkRxNVc0N1RJZGw5N2haREFFOEFEczVsajJ0ZGFyMFlXYW9ZS3VsUS8y?=
 =?utf-8?B?WGErUkt6RTI1RUVJM1FPRmw5Vi9EaS93VGp3azgwOFZ6V01wRXN0VGdtcW1l?=
 =?utf-8?B?L2l2SXMwVUlwZ3VkOHlVODREY1ZIMHVCcWVKd2pocmhZb3RZbHhhMWFSK1lo?=
 =?utf-8?B?WFpSNkpzd04rOXU3TCtLdVNHUHJVUk1FVEdYc2hRZ2UvZGlsU013UDRJOC9B?=
 =?utf-8?B?WHBqQXdrUGVzWGdFOHh5QXIxcXdhQy9ucExEaDlkODdnT0hHVEw0dnZEZi96?=
 =?utf-8?B?RDQyQWhCYTBMbjF2UWtEc0tXZGZSQ254NW5tdmJHOWJJZko4K1NhRkVCS1pB?=
 =?utf-8?B?YVJ3Z083R2tjRTVhczNSTXpBKzExdHd3ZTVwY3RHUThkcGVua0d3aExlb1Z0?=
 =?utf-8?B?QVVZZlhSTk4zemJvNkJhY1YwWlQvUVVIWTNCcC9HTE8ybEVoMEV3QzY2Ylly?=
 =?utf-8?B?T05LcGN3OEkrWGJiYWZxTCtyVkZXNlNnWXcwSHpPbEQ0WjZ2a0s2VXNrWG0w?=
 =?utf-8?B?WTl6Mjd5YU8vM1ZwVDVMc0U0MXM1UGFPd0l1OURXQUQ3SjhBRjl2OElhdFQz?=
 =?utf-8?B?UEw2MEF6RjhjN2VhV0pxMXpwV1pjbVo5QzdXNFBIZXp3TENYUEJ2MVlpM1h3?=
 =?utf-8?B?b3U0KzdoY0F4VG8xR0JUeTFwRmcxN1J4MlpENVBvUDJ5dU5pQnQ1V0dUYWRh?=
 =?utf-8?B?NUZxL1hlYVZrSGIxUFZpQmhZZzJZcFlQREZyR25SejYyMkFaNm5uK09wNXB6?=
 =?utf-8?B?dTAzMjNQMkROV3FjakZaajEvcXZYNGhPSGdSdVVhUnovd2hEeUVvcGdmUzNt?=
 =?utf-8?B?bGN4Ykd4enhIVXovNXdMaHdTR2orVVIwQVdjVWtZemcvYVMwYUQ3MjE5NzRD?=
 =?utf-8?B?THJaZDd6N0FGUnVPZWxFT3JtWWhTR3NONXozVGg5N3J5SVVsVFYyUmZKSXlu?=
 =?utf-8?B?TFNHeXhrdjlab1hwb1h3WTM3WFhwc3VIRkx5bThrcDVhMEtDblFOQUswY0Fz?=
 =?utf-8?B?VnFIMDZZZ1JtaWVsM3MzR0lGRnJjUHdrSEtsdU9CWmhBOFczOE0zKytMeGl0?=
 =?utf-8?B?OUZwU3hPMktvdGJpMjBaN3NBUkQzSGJ2aGtWR1ZiUXBQSzFrTlpkSjFhNHVk?=
 =?utf-8?B?bXZhZTNQTm1JREFiSko2NnV5WmFoL3VyZ0JJUXNZaE5RSk1jcUFscnk5cStp?=
 =?utf-8?B?TnVpdEpsd2lUUkRCVFVsMEljN2EvdFV0L2I0UE40VktRM1ZsNXZjbkFESVJH?=
 =?utf-8?B?azlMSlpPRjVOZFB3UjdjTVc5dW10dEQxVVU0VHdxRjlPZTFwNW1GdnM3TTBH?=
 =?utf-8?B?c1JXU0dtWTJzNzhheFVEUVQ4d052YUFVMVFnaUNCMGlUZ0Z2QmhaQlo3YXpQ?=
 =?utf-8?B?OFo3aHBGNjVzemFnWTM1cDd3M3pGRlI3a1NudUxiT09abDlDTWxoK05SWlJB?=
 =?utf-8?B?emdpdnBXMTdsZ3FOTDJQaEFwelBLQkk3MU1EMG5uSzNKWHczWm9SWVEraysr?=
 =?utf-8?B?eFloSG9ZNEIzZEJicEkzdXlhdXVxTnAxenRCVCtGYXJGMzJRV2JrWG5jRXRt?=
 =?utf-8?B?b1pockl6Y2x2YlRNSlE3b3V4UjBqQlhtWDhTSjFrZ1BXb1NVTEdmdXF6ZEZO?=
 =?utf-8?B?aUJZa0srcUJ2ZnM0Rkt0eGhlQ2k3Y2NJa1I1Z2RIRWVQcmFJTmVhNzVTTkE2?=
 =?utf-8?B?ak5LMWhaenlTRDA0SzRPRW5sUjBpNU4vNWhpemZlck5YNisxQjFIRW5xd0lG?=
 =?utf-8?B?cy90ZzI3cUIyWHFQQVdLSDlLSG9OdUNPbUdtQ09zYTBNdHFEbWhkeGg0R2p5?=
 =?utf-8?B?UmwzVUlNY0JmMTR6V3FEb2ttMWhUWWVkNytWUXkwWDBnQWdUTU5mTGdtdWhk?=
 =?utf-8?B?cTFGNU14MXhFZnFHL3VzYzdxNC9uanVoaUVRbjF4cStHbEowMGNJNjNZTnUy?=
 =?utf-8?B?N2tWNW1mbGpRbmE2Z2haaDM5TW9YQkZJRGhkNVVJUzlUV1RmTFh1VzBhdjdX?=
 =?utf-8?B?bmcrWTVMSG45V01OajlLeFNPSjk5N3FyVkw1dHdMalJPVTJ6SkxQVDhvYVhS?=
 =?utf-8?B?K2p0RGd1SjlOaHJDc29NcTVJNXVjUVprTUdPUWlBd1ljT2tLd3NuNnFxSjFp?=
 =?utf-8?B?ekNkZlNlaEl3Qmh5cnpXNmNwbzdBY0xwMTEvYWdUMkhEODdGcHA3NHV0ODI4?=
 =?utf-8?B?SnRZQlk1Q0x2V0FnMWRYUk5xTm15WmFrSnJxOFFaanVFVVJ3MHFrdz09?=
X-Exchange-RoutingPolicyChecked: NMz5FPZk79VC+ayYrVWEuUEyaxaM1quOs2HjVvuAhLuj2euNiFM/5Ay5e4OzxZDJAs1KRcdn3ynyvB679y6RlTVgkWofNFUjUx6OnX51bk9nxtWZPJAHO7/i1YKoU8g7tdQd5EjZvKCiZtGLlAwzXXBMsvsWzd92uHLPiJ12wq1AeRfdre6Ok/8ghtMEBoU46oyWWnP6VxGQ6Yp118S0962JLpoWm0AaVPOreR2qLKxc1QPdRu72QzS0X4vE/1INN19jhWNZeL7N6iI53+Un7JRDFGWoOqIhRluJl1earadkdPM2PZc4XYvqum8s4FNeUqV6jE9VjRttw9gfMnDojg==
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3e7d33-e5ba-4e56-1d44-08ded2e4e095
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 18:09:19.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2Kfnjt/Wb2AY0+2EqDiiPvQF7QAaOwdLHoeTUgukA5MuyTF81O5Ssw1THVR7xIvo2PlI3QTvp4tMPp0XOdZQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8683
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


Add back mailinglist


-------- Forwarded Message --------
Subject: Re: [PATCH v2 1/1] drm/xe/guc: Handle GuC local uncorrectable 
error notifications
Date: Thu, 25 Jun 2026 11:47:14 -0400
From: Dong, Zhanjun <zhanjun.dong@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Thanks for take time to review it. See my comment inline below.

Regards,
Zhanjun Dong

On 2026-06-24 5:41 p.m., Daniele Ceraolo Spurio wrote:
> 
> 
> On 6/12/2026 3:44 PM, Zhanjun Dong wrote:
>> Add support for the GuC uncorrectable local error G2H notification and
>> opt in to the feature when the submission ABI exposes it.
>>
>> When the notification targets a known exec queue, treat it like an
>> engine reset request and route it through the existing timeout cleanup
>> path. This keeps the queue teardown, pending job cancellation and error
>> capture in one place instead of open-coding a parallel recovery flow.
>>
>> The timeout worker also needs to cope with this externally triggered
>> reset path. Keep permanent or wedged queue destruction asynchronous when
>> the timeout path is already running from a scheduler worker.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>> History:
>> v2: Opt in for Xe3p only, excluding media GTs on NovaLake-P which 
>> don't support the feature
>>      Remove timeout bypass, which is outside the scope of this patch 
>> and can be added separately
>> ---
>>   drivers/gpu/drm/xe/abi/guc_actions_abi.h |  1 +
>>   drivers/gpu/drm/xe/abi/guc_klvs_abi.h    |  8 ++++
>>   drivers/gpu/drm/xe/xe_guc.c              |  9 ++++
>>   drivers/gpu/drm/xe/xe_guc_ct.c           |  3 ++
>>   drivers/gpu/drm/xe/xe_guc_submit.c       | 56 +++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
>>   drivers/gpu/drm/xe/xe_trace.h            |  5 +++
>>   7 files changed, 82 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h b/drivers/gpu/ 
>> drm/xe/abi/guc_actions_abi.h
>> index 83a6e7794982..f5c9b37038d4 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
>> @@ -152,6 +152,7 @@ enum xe_guc_action {
>>       XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC = 0x6002,
>>       XE_GUC_ACTION_PAGE_FAULT_RES_DESC = 0x6003,
>>       XE_GUC_ACTION_ACCESS_COUNTER_NOTIFY = 0x6004,
>> +    XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR = 0x6005,
>>       XE_GUC_ACTION_TLB_INVALIDATION = 0x7000,
>>       XE_GUC_ACTION_TLB_INVALIDATION_DONE = 0x7001,
>>       XE_GUC_ACTION_TLB_INVALIDATION_ALL = 0x7002,
>> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/ 
>> xe/abi/guc_klvs_abi.h
>> index 644f5a4226d7..5c428f02a642 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
>> @@ -154,6 +154,11 @@ enum  {
>>    *      (instead of waiting the full timeslice duration). The bit is 
>> instead set
>>    *      to one if a single context is queued on the engine, to avoid 
>> it being
>>    *      switched out if there isn't another context that can run in 
>> its place.
>> + *
>> + * _`GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION` : 
>> 0x4004
>> + *      This flag will enable notification from GuC to KMD via G2H 
>> message
>> + *      GUC_ACTION_GUC2HOST_NOTIFY_UNCORRECTABLE_LOCAL_ERROR upon 
>> receiving the
>> + *      same interrupt from the CS.
>>    */
>>   #define GUC_KLV_OPT_IN_FEATURE_EXT_CAT_ERR_TYPE_KEY 0x4001
>> @@ -162,6 +167,9 @@ enum  {
>>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_KEY 
>> 0x4003
>>   #define GUC_KLV_OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH_LEN 0u
>> +#define 
>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_KEY 0x4004
>> +#define 
>> GUC_KLV_OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION_LEN 0u
>> +
>>   /**
>>    * DOC: GuC Scheduling Policies KLVs
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 4023700ff2a9..3b3c6c450062 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -12,6 +12,7 @@
>>   #include "abi/guc_actions_abi.h"
>>   #include "abi/guc_errors_abi.h"
>> +#include "abi/guc_klvs_abi.h"
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>>   #include "regs/xe_guc_regs.h"
>> @@ -641,6 +642,14 @@ int xe_guc_opt_in_features_enable(struct xe_guc 
>> *guc)
>>       if (GUC_SUBMIT_VER(guc) >= MAKE_GUC_VER(1, 7, 0))
>>           klvs[count++] = 
>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_EXT_CAT_ERR_TYPE);
>> +    /*
>> +     * The uncorrectable local error notification opt-in was added in
>> +     * GuC v70.38.0, which maps to compatibility version v1.18.0.
>> +     */
>> +    if (GRAPHICS_VER(xe) >= 35 && GUC_SUBMIT_VER(guc) >= 
>> MAKE_GUC_VER(1, 18, 0) &&
>> +        !(xe->info.platform == XE_NOVALAKE_P && 
>> xe_gt_is_media_type(guc_to_gt(guc))))
>> +        klvs[count++] = 
>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_UNCORRECTABLE_LOCAL_ERROR_NOTIFICATION);
>> +
>>       if (supports_dynamic_ics(guc))
>>           klvs[count++] = 
>> PREP_GUC_KLV_TAG(OPT_IN_FEATURE_DYNAMIC_INHIBIT_CONTEXT_SWITCH);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>> xe_guc_ct.c
>> index 21e0dad9a481..fe6a55fe7fb5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1661,6 +1661,9 @@ static int process_g2h_msg(struct xe_guc_ct *ct, 
>> u32 *msg, u32 len)
>>           ret = xe_guc_exec_queue_memory_cat_error_handler(guc, payload,
>>                                    adj_len);
>>           break;
>> +    case XE_GUC_ACTION_NOTIFY_UNCORRECTABLE_LOCAL_ERROR:
>> +        ret = xe_guc_uncorrectable_error_handler(guc, payload, adj_len);
>> +        break;
>>       case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
>>           ret = xe_guc_pagefault_handler(guc, payload, adj_len);
>>           break;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/ 
>> xe_guc_submit.c
>> index b29cc08e6291..2840ab0bcd09 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -9,6 +9,7 @@
>>   #include <linux/bitmap.h>
>>   #include <linux/circ_buf.h>
>>   #include <linux/dma-fence-array.h>
>> +#include <linux/workqueue.h>
>>   #include <drm/drm_managed.h>
>> @@ -71,6 +72,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
>>   #define EXEC_QUEUE_STATE_WEDGED            (1 << 8)
>>   #define EXEC_QUEUE_STATE_BANNED            (1 << 9)
>>   #define EXEC_QUEUE_STATE_PENDING_RESUME        (1 << 10)
>> +#define EXEC_QUEUE_STATE_UNCORRECTABLE_ERROR    (1 << 11)
> 
> This can be dropped if no upstream user
Sure, will drop as not referenced

> 
>>   static bool exec_queue_registered(struct xe_exec_queue *q)
>>   {
>> @@ -217,6 +219,11 @@ static void 
>> clear_exec_queue_pending_resume(struct xe_exec_queue *q)
>>       atomic_and(~EXEC_QUEUE_STATE_PENDING_RESUME, &q->guc->state);
>>   }
>> +static void set_exec_queue_uncorrectable_error(struct xe_exec_queue *q)
>> +{
>> +    atomic_or(EXEC_QUEUE_STATE_UNCORRECTABLE_ERROR, &q->guc->state);
>> +}
>> +
>>   static bool exec_queue_killed_or_banned_or_wedged(struct 
>> xe_exec_queue *q)
>>   {
>>       return (atomic_read(&q->guc->state) &
>> @@ -1697,6 +1704,19 @@ static void 
>> __guc_exec_queue_destroy_async(struct work_struct *w)
>>       xe_exec_queue_fini(q);
>>   }
>> +static bool guc_exec_queue_in_sched_worker(struct xe_exec_queue *q)
>> +{
>> +    struct work_struct *work = current_work();
>> +
>> +    if (!work)
>> +        return false;
>> +
>> +    return work == &q->guc->sched.base.work_run_job ||
>> +        work == &q->guc->sched.base.work_free_job ||
>> +        work == &q->guc->sched.base.work_tdr.work ||
>> +        work == &q->guc->sched.work_process_msg;
>> +}
>> +
> 
> This can be dropped, replaced by Matt's fix
To be dropped

> 
>>   static void guc_exec_queue_destroy_async(struct xe_exec_queue *q)
>>   {
>>       struct xe_guc *guc = exec_queue_to_guc(q);
>> @@ -1705,7 +1725,8 @@ static void guc_exec_queue_destroy_async(struct 
>> xe_exec_queue *q)
>>       INIT_WORK(&q->guc->destroy_async, __guc_exec_queue_destroy_async);
>>       /* We must block on kernel engines so slabs are empty on driver 
>> unload */
>> -    if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
>> +    if ((q->flags & EXEC_QUEUE_FLAG_PERMANENT || 
>> exec_queue_wedged(q)) &&
>> +        !guc_exec_queue_in_sched_worker(q))
>>           __guc_exec_queue_destroy_async(&q->guc->destroy_async);
>>       else
>>           queue_work(xe->destroy_wq, &q->guc->destroy_async);
>> @@ -2997,6 +3018,39 @@ int 
>> xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, u32 *msg,
>>       return 0;
>>   }
>> +int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, 
>> u32 len)
>> +{
>> +    struct xe_gt *gt = guc_to_gt(guc);
>> +    struct xe_exec_queue *q;
>> +    u32 guc_id;
>> +
>> +    if (unlikely(!len || len > 2))
> 
> Here you're allowing len = 1 and len = 2, but below you only read 1 
> dword (msg[0]).
You are right, expected length is 1, to be corrected in next rev.

> 
>> +        return -EPROTO;
>> +
>> +    guc_id = msg[0];
>> +
>> +    if (guc_id == GUC_ID_UNKNOWN) {
>> +        xe_gt_err(gt, "GuC: Uncorrectable local error! guc_id=%d\n", 
>> guc_id);
>> +        return 0;
>> +    }
>> +
>> +    q = g2h_exec_queue_lookup(guc, guc_id);
>> +    if (unlikely(!q))
>> +        return -EPROTO;
>> +
>> +    xe_gt_err(gt,
>> +          "GuC: Uncorrectable local error! guc_id=%d class=%s, 
>> logical_mask=0x%x",
>> +          guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>> +
>> +    trace_xe_guc_uncorrectable_error(q);
>> +    set_exec_queue_uncorrectable_error(q);
>> +
>> +    if (guc_to_xe(guc)->wedged.mode != 
>> XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> 
> This needs to be a separate patch, probably implemented further down the 
> reset path.
Yes, to be moved into a separate patch

> 
>> +        xe_guc_exec_queue_reset_trigger_cleanup(q);
>> +
>> +    return 0;
>> +}
>> +
>>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 
>> *msg, u32 len)
>>   {
>>       struct xe_gt *gt = guc_to_gt(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/ 
>> xe_guc_submit.h
>> index b3839a90c142..ccade320dc69 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
>> @@ -34,6 +34,7 @@ int xe_guc_deregister_done_handler(struct xe_guc 
>> *guc, u32 *msg, u32 len);
>>   int xe_guc_exec_queue_reset_handler(struct xe_guc *guc, u32 *msg, 
>> u32 len);
>>   int xe_guc_exec_queue_memory_cat_error_handler(struct xe_guc *guc, 
>> u32 *msg,
>>                              u32 len);
>> +int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, 
>> u32 len);
>>   int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 
>> *msg, u32 len);
>>   int xe_guc_error_capture_handler(struct xe_guc *guc, u32 *msg, u32 
>> len);
>>   int xe_guc_exec_queue_cgp_sync_done_handler(struct xe_guc *guc, u32 
>> *msg, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_trace.h b/drivers/gpu/drm/xe/ 
>> xe_trace.h
>> index 750fa32c13b2..2fe8f89a1e34 100644
>> --- a/drivers/gpu/drm/xe/xe_trace.h
>> +++ b/drivers/gpu/drm/xe/xe_trace.h
>> @@ -213,6 +213,11 @@ DEFINE_EVENT(xe_exec_queue, 
>> xe_exec_queue_memory_cat_error,
>>            TP_ARGS(q)
>>   );
>> +DEFINE_EVENT(xe_exec_queue, xe_guc_uncorrectable_error,
>> +         TP_PROTO(struct xe_exec_queue *q),
>> +         TP_ARGS(q)
>> +);
>> +
>>   DEFINE_EVENT(xe_exec_queue, xe_exec_queue_cgp_context_error,
>>            TP_PROTO(struct xe_exec_queue *q),
>>            TP_ARGS(q)
> 

