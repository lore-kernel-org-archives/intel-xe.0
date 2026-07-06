Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0C2C43458
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jul 2026 16:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EAE810E3C2;
	Mon,  6 Jul 2026 16:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDnNehAV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9E710E3C2
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jul 2026 16:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783356190; x=1814892190;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aLxt/Q5Ies1MuCg6YgNDHKCU1NO2CT78W/orWI54BZc=;
 b=LDnNehAVfOLN02iDPkMY88PyvEksQ/vCet94TLzUmq8o925WCQpqpxb8
 aJVIyLdbXMCeTeccjt7wctpcIXeO5FBmpKZmuG9BvUQVrV4va+KeKKcD3
 4Iv/uRAX/+hQryUjVyQ/7ivTMKB/Lj85A8+2C6HQEO9VlkgcZFv7JjVGZ
 iTCGn0nReVOJ82Y7LaxZU/OfmdHRkWZ9DxUiolKnAlj/qtdXeh0QNQ4bK
 7LaZdbpHzS2pw+g8fyHY0EmifS5wy92q83brEJXsrmeIizQBbLyeWzaRk
 AlvolxSqGiY8Irk3YFZD6R+Hwuk2i20NGeYGwsjVLJhk9Shb29pba1crK A==;
X-CSE-ConnectionGUID: l2CwpTJPRDmOVtEZL2kCDg==
X-CSE-MsgGUID: AGeRoh9ETEGOn6K2mKs1yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="87816578"
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="87816578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:43:08 -0700
X-CSE-ConnectionGUID: ujc2TpjlQ/ekKgTjUVagFw==
X-CSE-MsgGUID: ZanlnDUFQf6st47nwaAUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,151,1779174000"; d="scan'208";a="283854714"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2026 09:43:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:43:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 6 Jul 2026 09:43:07 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 6 Jul 2026 09:43:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=peuSdxmizJcDNjUFHZyFpLiBt9bkXixtR0W0VS2ma7NYNsZEWMmjpeztU2RsydSKSRDplPOy0eppq1cJWQ5XN7qVDlhwd8koNhN4ZjZVVwZqK2EZxqjzCjVJU2ovwZ/LnPEqI4UH4N6AMrkXpb72/MyxpEsYstUwXezEsKNsHFKbK1vKxmMxTHelCTjXFhHShs4dtVbsl2vg4Tj8alMdJGLXAgny4BNeQAFOdof+U6+tewGaIbQjQXt7SrqQXlOISODbQhxcxbL68w6FyGu8sOiLdin9Upnvf8uFdzV2SwV/ZFZXLxl6nqcNIsJrBTcHG+H44k/bUDL1DqmOeq4BYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRGzTVlrXqlmM4UUZKn4/06a/tAssujio9M5wGep/tw=;
 b=yFd4k7q9JV7Z+RuNm38wesS+YkvrYXy8jRXcXPYXR3vsajOYE0pvcIPSuojgao9I/DCdqYxvuG5bVQaJm11DZAH9J39XKRJStPEMXGto4NejG80yWbWKF/igEAss4vr7QpzZlVS4+Efz39M1L1rFiLs2RgdupH0evsT6Hy4uK7QLbrLe7DirsTR8ShRZI9lmySPuaxJKQrtKcv35ySPlahQqZN3bUywySGFiXrSj795G4zFFiZ42U+Nsj9rJkRBBNS071yhkBb0mfyDK2M5xRlyGQYHwQOPI9wARdVwGbQuVXDb0RN7a9n79Ui822xrIdF4CsmaBJjs639BF4f9xxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Mon, 6 Jul
 2026 16:43:00 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Mon, 6 Jul 2026
 16:43:00 +0000
Message-ID: <d6b9a35e-8202-4a78-8d46-ecb90b220b6b@intel.com>
Date: Mon, 6 Jul 2026 18:42:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/xe/tests: Add migration packet test
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-13-michal.wajdeczko@intel.com>
 <ake6DS7ZfTjXUwox@nostramo>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ake6DS7ZfTjXUwox@nostramo>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0017.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d5db30-5e86-434c-f1ed-08dedb7da3b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|22082099003|11063799006|56012099006|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: XfMwz/KCJ7Nz48CaTvEgORUzVEuKNHbVbG/uD8h1e5QgM/3tH83aurqcb5B7v/R3Yc792taVXuECW/z+KjZH5q1v8iXnz5m1wk8k40cCwOS3xc+vGHC1DJgKb+YdAv8WHM+fUS11MFAHuC1nygwvo2/QnuzYtCpF58WTT8jVCIWJOsPYfijWoqSzCRIHBY+lt4uy8dIAjgOa7ei8Eud3MOuYi4r8NhG+JHi7oQGqKvbmVFk/RxVIhZQey+1Wah0eoUmflesgfxiAA4J4pNlrXvw5djCytdBnlfQvdX2AqU6kWcaDCXTq/N4OJZhyoR4QOXKN6z8ZJwPs/24vxTxcQmGIt7gJ8c730YqKJpjviH2c4UxxVBPj2rYjdzLLChAPdZdedKlpaBBGGKXOv4AdK13MJeY16D650mhPGxLWXapPBA2BFtetAzbynYxZamWlqYDyfmtjxSEdADOWOyr77w0wSXN74oUmnmGs+X1bL60gNeE/c8c7oShRsklpcqiXeRgya2F/D/thftOCBijh/LcvI/JxwxjTV3PlO1Q907gR8g0qjV2RCT94uhJ7TWhIYKP8SBlJYEJHBXXiMQBTlv7H2I89MndfVrOa8OhBL80bxjzLtr17NYcWV6U/FZpgBsywXu0vHDlTRS6liJmw3UAIVS69/pGJSVxE+0BQBt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(22082099003)(11063799006)(56012099006)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGxMbDQxUHlrOU9BR3ZqaTdQNmVDcUpOTGgrbXhaWFlsZi9YSWMvNG91em14?=
 =?utf-8?B?c1hQUWdkODhJMGszSTNRQ0VaNU1hblNzZ1N5ZUFXRjliRmN2QlVZLzNJZlIx?=
 =?utf-8?B?WkZ5YmpYRGl0WUpYQ20ySllhMk9pRzZYa2UybzMxMVBGb0FQcHN6NWFnbkNh?=
 =?utf-8?B?dElsR0t4SFVWY2pEZHpVQXNjeGtib0djTkw1RlFQd1V5SEpXTUNnNjdZcHp2?=
 =?utf-8?B?YTBEeGlxV1J0QzI4VzhBR2VGdDhTUDBSWUx3NWE2a2ZpaURwREJNOG5yc0Y2?=
 =?utf-8?B?Mmx4N0tvYXpGdGxVZi9zbTRWaERZZ1FkSE84ZXlIbmFSS2FXbkNrMWZYV05V?=
 =?utf-8?B?N3JoZzFpd0FFZlNuV3VxdEczTUxyTlJPK0w2WWtaRWczQlYwa0VDeWZ2N05W?=
 =?utf-8?B?WExkRWcxK2YwSkg1Q0RUOVhHSFRZd3VDUEJ3eE9tcGxZWGFQNlRNUnVLMTE2?=
 =?utf-8?B?NDI5c3ovYjJpZVVJdVR5OTVaYjBHMVJEcyt0TUhYZVFiREhkUTlrK2FBTGVB?=
 =?utf-8?B?WTFHdndyUXl4NE1JSWpWbTdnRUx0Q2FWckN2S2M2dkxxT20zMjNNR1FnMlg0?=
 =?utf-8?B?Ti9yeUk3cVYrMUNmVU1JN25OQkRoYU0wNzFodVVuN1BxL0lwaXN5ZXRaWE11?=
 =?utf-8?B?bmR6eFNsN3VwbDhDZkVUL2g2VXBObVVDNjFTL1JMQVl2R1RXa1NOMU9WN0lY?=
 =?utf-8?B?ZHoxRVJxd3hWNnJBK1liTE5ZU1M5M3BGZmdxODlSdThJMXQ1RExZTTM0ZEJS?=
 =?utf-8?B?Q1RIMGkrTVJ2TVFRbnlzN2UxRStvQ3dJZW9YRi9uQWtENzVvcjVaZVVKL1Zy?=
 =?utf-8?B?aWp1SGtmVVM0NUQyTlBYbnBXemY5S0F6MnFIclJJcUlxUFRDaWUrTkhNcVJi?=
 =?utf-8?B?S0NIRy96b3Y2bG1rUFBRaDN3WDVUMUpXUlliNVVRWHQwOFpmTGZudjcwNVNo?=
 =?utf-8?B?K3prN0ZVUnpWd0MwR0x4RnBOcVE0cVFsNk5NTjNWTUJoblYrK1pPM2o1QUxx?=
 =?utf-8?B?cUw1bC9KSk5JQUdZT1JyNUtHNENyMkVDMzFBZitZbTQzY2lqR3RpYmRndEhi?=
 =?utf-8?B?azhuWHAwb2JJMkxCMG5IY0dpWTFweTF1aC9QZ2NsTWVyY3YwWHRvaWlWeFRx?=
 =?utf-8?B?enRmdEhjT2RNeTJ5YlhocEJWM05QVU43cTltc09DZW9QR3lMWVRmOUdIZDNP?=
 =?utf-8?B?cFhFeEZUL0hoU3RoVUl0VzZ1SWhrTWlhMThwS0VXS1M3dFZxeHVrb2VHVHdo?=
 =?utf-8?B?RGlmOGJlRC9pZHJzZExMVGxWejErZFhPckJYajc3ek5RYnhXeVVIZG5aOTV4?=
 =?utf-8?B?eE5ydFNZK3kxVnZOSmIxbElPYU5udkdjL25xdEg3UEp6UnIyTEZreG1WQVJn?=
 =?utf-8?B?VjFSYlhjR0JoVmkvWklLRmlXWjVBbFV4ZFlFcjlBNmtNUWRmT0M4QVNvQUZy?=
 =?utf-8?B?OEMvMzJxMUFBTW1oODR4VllhZ1E3NGNSdjJFYnNIdjVnNUtCbEd3S2xFLzJr?=
 =?utf-8?B?cXJVNmNnSjVMS3NYdU9waU9ocGZMeis3R3A3ZjJ4UVBzemltNWlFUzZPeUYz?=
 =?utf-8?B?Qjc5UWxFbWJSdk9jY01yYnQybzYrUkE5TWt2SlQ4VUxkbWJlZFZmL2RjZS85?=
 =?utf-8?B?UU15VS85Ty9XUmVpdFRGUDkwNWQvYkNXd2lvWHo4V0RZRDE4QXFCNjdJeHRo?=
 =?utf-8?B?TkEvd3RVczlNWGU0WTk5cDJCOGlOVW5HZy8wbnZFc3YrOGRVeTlsOUVaWS9E?=
 =?utf-8?B?RExvcnU3c3NUTnFYUmQ0OGhoZVlnWHRYVEpVVndpQ0pFRzBLc0NXbVNqMllz?=
 =?utf-8?B?aEh4OXJoUkdON3lucHAwOEg4Q2pSV2VEUk1saVNqejMrMXBMR1pUemFMMytk?=
 =?utf-8?B?bWlVR3FxNHdLL1ROTWdzSDVGdGYrSzdSNFVLT3hvQ3ZzM05VYWNlZEx2UFhU?=
 =?utf-8?B?WWkxNDJid0VIUHlXelJxTDdDZDJIVXVDN0dEQjRyREtaRGVTaDd6Q0ZHTTFK?=
 =?utf-8?B?M1hMalFRN1J3YUNyQ2dWeUNmbWlCOEVTUzVpVzdnQk52T2ZJOGoyVFVxczVT?=
 =?utf-8?B?RHZXSlNGSUQ2RGo3SWliS3lxNFBPZ2pNMWJqMUVDeWplcTNOSHpGZXlpbEVO?=
 =?utf-8?B?QzV3WU1jOWdlbWJiRGdRZzVQOTF1SnBjT3dLMWVkTkdiaVFpWGxKaHVZdVBQ?=
 =?utf-8?B?YzNXTzNhZmhoZHgvc3c1N00xU2FMZURIRW5JUHBQWjhLM0ViUjQxdTZxQ01r?=
 =?utf-8?B?Q3ZBRmcwejFQM25EWnljL0RFTDJicTNnY01tcDM5TldnTjRXNDNTeWdUUWxY?=
 =?utf-8?B?MHAyY1oyWG01R1JPZzQ5eFVZOGMwaTR1NVpldzZLZXNqQS9BQUtmbEQvVlBr?=
 =?utf-8?Q?15gL67mc84kpd3KI=3D?=
X-Exchange-RoutingPolicyChecked: QZriGQQNM7K+tqkoBzxKZ9i5OihhyU7woZHzioU/CTht31Apc9toM0rWfZntVgdStMAvvXGK7HRenchL3Opu0KtuukZNoT+WPrMQBZisMqF0yfyu77xtEwngWjw7L5t/DTY+iONZCwcdNCLB44wACYnytloTqKoLVum0DhjO+ONL6FIdD8gMRgx69SfeLkYISlPpikmZRWNJRHRkipC+z2SzlFsEsYG0GOFJaY1eqH7cHWZf21WZN7eOjZBGApSwhby5dPn2VADlRtZaU92pkRhNGIqZwO8C/FiSOfVzM+roHBhIY/oVKoiJNL/QTSpWUEnXPvFPD3OcY4qMSWr4pQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d5db30-5e86-434c-f1ed-08dedb7da3b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:43:00.2269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TC5z3yb4ORXEhjXLVbZIrTpNDgTFCM2L/XtMxDHzZYUZF2AxNOl03gDPaWF4mMQ2kvwFBPee/dVO+yt16Ybg8IDKcEhQgWLSPWPcLSEy02A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
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



On 7/3/2026 3:44 PM, Michał Winiarski wrote:
> On Tue, Jun 30, 2026 at 03:26:31PM +0200, Michal Wajdeczko wrote:
>> One of our migration data packet (descriptor) is based on the KLV
>> encoding. Add a simple descriptor initialization test, as we plan
>> to use new KLV helper functions there.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  | 83 +++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_packet.c          |  4 +
>>  2 files changed, 87 insertions(+)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>> new file mode 100644
>> index 000000000000..9af066875671
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>> @@ -0,0 +1,83 @@
>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#include <kunit/test.h>
>> +#include <kunit/test-bug.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_guc_klv_helpers.h"
>> +#include "xe_kunit_helpers.h"
>> +#include "xe_pci_test.h"
>> +
>> +#define TEST_VF		VFID(1)
>> +
>> +static int sriov_packet_test_init(struct kunit *test)
>> +{
>> +	struct xe_pci_fake_data fake = {
>> +		.sriov_mode = XE_SRIOV_MODE_PF,
>> +		.platform = XE_PANTHERLAKE, /* we need MEMIRQ */
>> +		.subplatform = XE_SUBPLATFORM_NONE,
>> +		.graphics_verx100 = 3000,
>> +		.media_verx100 = 3000,
>> +	};
>> +	struct xe_device *xe;
>> +
>> +	test->priv = &fake;
>> +	xe_kunit_helper_xe_device_test_init(test);
>> +	xe = test->priv;
>> +
>> +	/* pretend we can support at least VF1 */
>> +	xe->sriov.pf.device_total_vfs = 1;
>> +	xe->sriov.pf.driver_max_vfs = 1;
>> +
>> +	KUNIT_ASSERT_EQ(test, 0, xe_sriov_init(xe));
>> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_migration_supported(xe));
>> +
>> +	return 0;
>> +}
>> +
>> +static void test_descriptor_init(struct kunit *test)
>> +{
>> +	struct xe_device *xe = test->priv;
>> +	struct xe_sriov_packet **desc;
>> +
>> +	guard(mutex)(pf_migration_mutex(xe, TEST_VF));
> 
> Sashiko complains that we'll never release the lock if we're mixing
> scope-managed locks with KUNIT_ASSERT.
> We might want to convert this to test-managed resource.

hmm, while this could be done here this way, it might be not so trivial
in cases where we would also mix some original code that uses guard(mutex)
before calling other function which we replaced with the stub and trigger
the KUNIT_ASSERT from there.

maybe special steps should be taken only when locking a global mutex,
which is not the case here? but it's not a rocket science, so yeah,
let's do it

> 
> LGTM otherwise:
> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

thanks!

> 
> Thanks,
> -Michał
> 
>> +
>> +	KUNIT_ASSERT_EQ(test, 0, pf_descriptor_init(xe, TEST_VF));
>> +	desc = pf_pick_descriptor(xe, TEST_VF);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, *desc);
>> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.version, 0);
>> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.version, XE_SRIOV_PACKET_SUPPORTED_VERSION);
>> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.type, XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
>> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.size, 0);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (*desc)->vaddr);
>> +	KUNIT_EXPECT_EQ(test, 0, xe_sriov_packet_process_descriptor(xe, TEST_VF, *desc));
>> +
>> +	switch ((*desc)->hdr.version) {
>> +	case 1:
>> +		/* v1 is KLV based */
>> +		KUNIT_EXPECT_TRUE(test, IS_ALIGNED((*desc)->hdr.size, sizeof(u32)));
>> +		/* v1 has at least DEVID and REVID KLVs */
>> +		KUNIT_EXPECT_LE(test, 2,
>> +				xe_guc_klv_count((*desc)->vaddr,
>> +						 (*desc)->hdr.size / sizeof(u32)));
>> +		break;
>> +	default:
>> +		kunit_skip(test, "missing test code for version %u\n", (*desc)->hdr.version);
>> +	}
>> +}
>> +
>> +static struct kunit_case sriov_packet_test_cases[] = {
>> +	KUNIT_CASE(test_descriptor_init),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite sriov_packet_suite = {
>> +	.name = "sriov_packet",
>> +	.test_cases = sriov_packet_test_cases,
>> +	.init = sriov_packet_test_init,
>> +};
>> +
>> +kunit_test_suite(sriov_packet_suite);
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
>> index e581e8e6c1d1..558a3697d639 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_packet.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
>> @@ -516,3 +516,7 @@ int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
>>  
>>  	return 0;
>>  }
>> +
>> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
>> +#include "tests/xe_sriov_packet_kunit.c"
>> +#endif
>> -- 
>> 2.47.1
>>

