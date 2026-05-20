Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF7BCD4F5E
	for <intel-xe@archiver.kernel.org>; Wed, 20 May 2026 06:48:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84E410E084;
	Wed, 20 May 2026 06:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvZ8YfzW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0338710E084
 for <intel-xe@lists.freedesktop.org>; Wed, 20 May 2026 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779259735; x=1810795735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=C+BCGQS7wUv/JhDREPuWpVSNf3pEdHLtQKRjYXsV7tY=;
 b=kvZ8YfzWtWeZ6lwCMvRYPABVdcSWq2Lxuvs1aI/ARgbA1ASC4Gj8YGnd
 jmnR8SPxvgzvlWO9yjwHccMvSBM1oyNQKR03A3sX84qAC9XKokfIQJQYz
 TiyIZE+GQ03eaNIND8DUZuVtB6a6GMd6YtllK5fXOakTOkTg5ZIkc/61t
 +Y2w3yYWQeY3Lh4ouIsiIpvwPk7BTAL+2yp3iLm5ezcTEGOkkePwrMw0k
 NuvcLKs8xlRV9sE/hzAT7Xb3t2aZFps5bhCso6alHQ/qJbao+nZuR20qm
 UVLAaBAZVpuBkdVWcpKJLZKSYaHMimJ6u8ydYKhHEJMjx0K0Naqb8H5AL A==;
X-CSE-ConnectionGUID: hJR9yt1GSd2E+0HGUMfFKw==
X-CSE-MsgGUID: qIGZRbSGS++VuIY/Cpa3mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="84033463"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="84033463"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:48:55 -0700
X-CSE-ConnectionGUID: jbQyVbyMS/yOTe0zSoUujg==
X-CSE-MsgGUID: Z7zO6eL+RMWdmxhhxeMIPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="244048050"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 23:48:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:48:54 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 23:48:54 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 23:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaJooQqV8Nlp+mneRAnhq4CLIHmVD2gF86DeSaLa3Vk8WTqCvUsFzRHzhOFLgQlcs0S6k3BVmGYxGE37He0DSZRHjPiSm4VsCU1bdXhq+1HgYzpQWmyRWZH5JvMNZvhT0d1Lga9hUwjfFoysIshKW8mX49fo3QD5Nf2fVXsEZs7OeQ5kwJ+x/ma8GYruDfvgzvSEY3RI1a2Nfan4UiK109bjicE8UK66raX8LRGRikOP7qvCNsUBGMvU9vyVXNSF52xtlkO2YqFZjyj5Jv89ERUAA5ZnsKfFuo+Abb82Juh6yIbPGnFIYqYLzRy9TLyeKQqXNfmQpGnl2mO3woZjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5QATwQ/qiXEzk63CEKFPjqV7k7KB/bbmxkCUbQjYup8=;
 b=jUjZ0XUekfF7zZ57KxgE2vwzbgJTlYF3I90rdMiqibPGKCKSXq3smoB80p1eaEjlrWeFcpp/cj7hCd0OdsPCibunAl9TL/qYWZYF7zQM0pSlm4MteHnyD4A1G3Y1IbA2Qo8rwpSfaYzLAS4x3ZiP9Jg05HymnvJYrHYtkPprgijkpgnbxT54I/VfnlrFaYDRNFVsQ4v5E5imCJaeGSknn8cZAYsuGAKIg7EW9FAsCdq+94a4inopXdUpGqnEe0Xb1eCxCv4ivd86k0uL13U6CiBl3Jfp8wquKi7BXovTQhnblCInK0r0fXqc6ZgwSxHfW3u8dwyHRUQUMPutukIdow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 06:48:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 06:48:45 +0000
Message-ID: <002a2468-a476-4461-8a28-61a06aabeb55@intel.com>
Date: Wed, 20 May 2026 12:18:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] drm/xe/xe_sysctrl: Make sysctrl flood limit
 reusable
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-18-riana.tauro@intel.com>
 <agbPSExZuoQ2-Oxs@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <agbPSExZuoQ2-Oxs@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2f8bed-fde9-4b47-d1a8-08deb63bd6b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799007|22082099003|18002099003|56012099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: VSmUdmknp5paroDa1CdepaUCEsHsw00nIn5OGxKpf1zRGlni/nM1oPVDiaSxeSaZkBjZ62p5PRxaF1rlGXFYkgOTw+ARHsFsQr4Kwlrzl+nxDA5YFcYOSrbC7yyjIgYyTLP5kME5Pz5vhWUVsJDQqbKuHgFBfLCfS61i+dgjwwgQJPYV1mDclg/bK1Yo7ftm6guOLTmfFg3336964zc5Hft96klta275JM4jt0bFozNV6cX+9nI2l8G31E/cC+ECJfqPXIsjEOAEa9WZcMSSso7a8H3AEL3WYRIYsLRwABgz58bgNB+GHYLtpQlOJyyDw2ONG4GntiuW9iabkAuvigwb6WhG3x4axDfP7MSzSl3S0YxVnkRm0q6jHx5GE+mC4FVjyq7OyROZTvTlMMK0H0zIdPVM31vOQuDhwq58iyiIAVe+PX+8QHz/6NyPG8I7rrEB//c2uxCVJ5FfnLJnmDxYRxhVhdf7Gz9cPQtSrOwQYx++wdO1wzygf2ZijpUNdoVbj6WQBPcw0rPzAnhKJ3EnSbZM5ithBkunFsVMi4jGjr/Zjd6WL11Wt1UCOpPsOtYRXI/0KDmck97xvlCYwDYfd4mvMpbqEetZd6ipgS+v2t+HUnj9XSZdcjCo3hn+uWpeVUouCklSESdBZRiiO5uYGYr9NWsulYqSzQFyHuh3Wheo5zdAqsHGI7/MlNYP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak1NZUlVSXZJRm12Q1FDTFBSVWdtOTFKa0cvU1RpZ3EyeExKVVYrZDE3TDR1?=
 =?utf-8?B?amp2WjRDeGZMdmVDc3NhMjU4K1VFVE1FZzlYYjNhbjExTU8yaW5pL2wvWERD?=
 =?utf-8?B?N0xFQ1ErakVta0FwMzZuVWloZmJlMW9qSDRqRkVncHA5Sml4ZkpLS0NZMFE3?=
 =?utf-8?B?Nmk3cWwxTCtHOHFreG8xUktVN2lheXcrdTZKWWl1MTJPampndGhVak1Uc3Rl?=
 =?utf-8?B?RExpbEJJajdvdHMwRXpHNkpmL2xkeUE5aTU0NUF6MlNaRlovM2VYNGh0bHJ6?=
 =?utf-8?B?N0N4d2liYm1LRkI1dit5b05iYXgyb29hMUo4anh1ejVHNGlvMU1rQi9GZWp2?=
 =?utf-8?B?ejNaU3pnemdMZUI4ZEhxM0NYbHh2ditaUHo1bUJFck1lU09HTzk5UnU0b0o5?=
 =?utf-8?B?S3RDM3Q1eEpTTkx6MVlLNlpmOUxYTWxxUWYrZlFIQktOOFVxbUE1V0dhSkpW?=
 =?utf-8?B?LzJpSmNKWm1LeEJYNFdEVkY3dWRkZERNV0cveHhVTkhpOFJraEdsb3JZY1pv?=
 =?utf-8?B?b2tmRnh4Z2pwa0FmelNIMGd0ajZMc1FKWnlhb0lnOWFCQTlwOVpPUDZFTXFY?=
 =?utf-8?B?empzVVJZQW44OHZFSWJ3bkZmMXVuZnBYZmdWZUxGUUhWS2dmYzFCMnZyc3VK?=
 =?utf-8?B?cldPTUhyYmZESSt6dVhUZDJobFJtRjNnSHRDOUp1L25WQUI3b0VXNW90VGFF?=
 =?utf-8?B?TmFtYUhUbGdjcUpPY3dGbzZsanFsS1oyWUtOcFFMa0RxbEZjSkVFMEM4OTRI?=
 =?utf-8?B?MkkvQU5FY1NuTmp2SUgzeHJUenZLNHZMVWZTNUNicDV3bVc2K1NLaWZWc2V3?=
 =?utf-8?B?VG9YQTJyRmpLS0NxNVpLaVp3bWdHNUpxNzhHbnhyTVMyVDdGWkszclZWeXBK?=
 =?utf-8?B?YUVXQmZkVE5aMzRFMU9KalIrVjV1QVh0QjZVaExxNWpRQnZUeURvZGw4S1Fo?=
 =?utf-8?B?UVN1ZWdTSlRCTzBjZ0syeFQ3dC9lRGNNc3dhVGpUeDZ1NnVhTzF0Ly84eUo1?=
 =?utf-8?B?NWpXU2pjTzZVVXdQaE5nUjY1Mk9oUFIzalVGUWgzRFhnMUxqUFFZN3RWdGFM?=
 =?utf-8?B?Q2xjUGt3Rm1iN0VaL1A2aUFDYTFoaGMrZXpjbzJYQVprVDVRdEFOS29SSVox?=
 =?utf-8?B?Wm5CdUlTK2dBMGZ5eUFDbHFmWTllWFdKNm8rakw5L0dkcGxXMy9Yd1BTWEVT?=
 =?utf-8?B?MDl1TzlsTnpIbDg4RG1CbnArejYxU0F0MENPMnJEdUZSQjlFYUdiY1ozYlJj?=
 =?utf-8?B?d2R3VTBpZ3NvbkVtamY3b1Eza0srYU5Hekd1d3ptVGpnSS9UQm5wajQzVWx6?=
 =?utf-8?B?alZ5TWhrc1RNcnIzWk43QkxtWjllQUhZc3g5RjVOQUlMbTArU0Q2ME1LNDJt?=
 =?utf-8?B?Zmg4SFJjRHhZQWZ4aGRaUE1LcTV6ZWhnVUJrUXNFWVF2eFk1UWx0L010cGs2?=
 =?utf-8?B?T25NOWR3eVdPVm91dWRxbDBwS3VqaGRRaDZkQkNOT1hnOUlvaUczaVdTc2x4?=
 =?utf-8?B?TnZXc2dLcTRIMzR3N3h0VzY0QmdaOXBRNThHeU1yVHdCNFc3VUtZRlhyb1BE?=
 =?utf-8?B?R2h2T2N2aEFlUms4andzQjZrNjJiNHZ1d2VyNFBSWG9qbm5wanNINHBEN3R1?=
 =?utf-8?B?cFVnR2NtS1d2TzcxTnViaGFVNGw1dEdzK2NOanl4eE9PMmpzVW1LamVjMWly?=
 =?utf-8?B?R0x2N3VRcFp1Q1B5Tm9LZWtLbTZoU0VNYWlsMVUrVWtYSzVSV2ZUSjhLRSt2?=
 =?utf-8?B?bmRjV0dTbVhiTk1zYkJOb21oWXY3K3pOSnpxR3ZSUWR0K2l5R1haZjg4UVhH?=
 =?utf-8?B?Mk50anJNTVBWYzhvZ3JpcW82RGYyWmZUZFBVdGFZaEsxcFdFOVIvMXNsZ1V0?=
 =?utf-8?B?RU5EdW1HajhnZi9lcFN4U2dsL21uQzNCUnNCWFBhRUg4VWQxaUcyMGdmS3FO?=
 =?utf-8?B?QTBjZFA1UmR6VVlDT2Z3TnlDUHg1MEgvNFdpaTVreGlBNk0wczRzMHJvdFIz?=
 =?utf-8?B?QWZzQTNZS3pPK29HYTZYZGo4QUFORUNyMGJ5b0xrVDFkM0Y5emQyMnp3M2w0?=
 =?utf-8?B?K0prRWw4U2RsUCs4TXQ0cU9rOXpMZStPVFFsRWo4dDdyUFdXUEh6eWIvUDRV?=
 =?utf-8?B?WVlBU0hwYlJEQTRmTkVGWXRZQVhuL0x2Smp2ck1URnZ6RGlKcHlTS2E1c0ZQ?=
 =?utf-8?B?Ym03TTFsNUpFSnFHK3Z2QUxCaW8zRjhsOTFvOEN5VEEzeXlpMUM0L3phTlpj?=
 =?utf-8?B?elp2Ylh5cDkveXlQR3VSaVhYUkJvQm5WVEtta0xNYk5kQ0FJM3o5M3d6ODkr?=
 =?utf-8?B?UjNjYlE1NlpHRW9RSjRwY3ZGMXAwZnpzb2ZpK2dlT3JjZXNZNE05UT09?=
X-Exchange-RoutingPolicyChecked: lOWN5B1xIkX+8TwG5gHKSFS7MEBuCRJKNqWRwEFQkByjt+Y55kw3G/qvbFyhahyUial4QWmOat/c/RcHkQdfDlR54+dJ3qjVd2ZQsrxO7WeowTFY04O45LlD2rHAaCwFi9LTna8Ts5Gz6AldZvtOFLmwX5i7uuq/L3jzL0a7UHSW1+sXeCRXq0iDpdSjfqYSkTtkJ/oah+tTiLgu9bstvqd1JUXi7EfIABTnlfpbwn3AbM4RFz+MXhCJyClqlGrAyHpWZzcSIM7DmLu/rfbQZajavO1vzcnGjQ5Uq+5JyOyDFtRpAtBGLQgVP0sR0Xt+iBQj720IikOzA8q+js6HXQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2f8bed-fde9-4b47-d1a8-08deb63bd6b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 06:48:45.5692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LkTsk8DT38l+zkkseRZrMjo34ceXpwPjMuhoSxURhHzPHMoR1mgob5v4FrB1G3ceuEu5+dttcDw6MrTGz/V8gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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


On 5/15/2026 1:16 PM, Raag Jadav wrote:
> On Mon, May 11, 2026 at 10:59:09PM +0530, Riana Tauro wrote:
>> The sysctrl command flood limit was defined in an event specific header,
>> restricting its usage to event handling. Move it to the shared header
>> with a generic name so it can be re-used across all files
>> using system controller commands.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_event.c         | 2 +-
>>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 2 +-
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 3 +++
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> index b4d17329af6c..faf6ba89ce98 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> @@ -16,7 +16,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>>   {
>>   	struct xe_sysctrl_event_response *response = command->data_out;
>>   	struct xe_device *xe = sc_to_xe(sc);
>> -	u32 count = XE_SYSCTRL_EVENT_FLOOD;
>> +	u32 count = XE_SYSCTRL_FLOOD;
>>   	size_t len;
>>   	int ret;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> index c16c66b9fa7f..d236e22fe9dd 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>> @@ -11,7 +11,7 @@
>>   #define XE_SYSCTRL_EVENT_DATA_LEN		59
>>   
>>   /* Modify as needed */
>> -#define XE_SYSCTRL_EVENT_FLOOD			16
>> +#define XE_SYSCTRL_FLOOD			16
>>   
>>   /**
>>    * enum xe_sysctrl_event - Events reported by System Controller
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 84d7c647e743..0fa786a9e8c8 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -48,6 +48,9 @@ struct xe_sysctrl_mailbox_command {
>>   	size_t data_out_len;
>>   };
>>   
>> +/* Modify as needed */
>> +#define XE_SYSCTRL_FLOOD			16
> Apart from obvious duplication, please consider that the scale is a bit
> different for both (additional_errors and event) cases. A single event
> can consist upto 16 errors as opposed to additional_errors, which in
> itself signifies a single error.

An ideal case for get error should have only 6 iterations.
But there can be a possibility for more incoming errors.  That is the 
reason i have
reused the macro used for event.

>
> I personally don't see any problem here regardless, but if you want this
> to be reused, please make sure we only have a single definition.

I missed that while sending.

Will fix it

Thanks
Riana

> Raag
>
>>   #define XE_SYSCTRL_MB_FRAME_SIZE	16
>>   #define XE_SYSCTRL_MB_MAX_FRAMES	64
>>   #define XE_SYSCTRL_MB_MAX_MESSAGE_SIZE	\
>> -- 
>> 2.47.1
>>
