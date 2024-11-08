Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A087D6407A
	for <intel-xe@archiver.kernel.org>; Fri,  8 Nov 2024 19:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5A10E2A0;
	Fri,  8 Nov 2024 19:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZ9crvw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB1C10E2A0
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Nov 2024 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731093279; x=1762629279;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=DVhfSIQBMeYhdf4hYJh929M8pQqK1t+MAO4KmQRUxEY=;
 b=GZ9crvw83+I8NdOryCz8kr+wfMW3ZW0tUcMxptMSsfqIF0VFNnU9/ACa
 aIEGyhPT1b0dsfQzFpIaEuuQKGtO2YRIU2iGrcb5ewCioTuP+EzG4HyEW
 Ccc7V+rM3OrxZ5L0DDX53eFGjwXBHLyIKHbeF5B/TLNxWrWhz5c4POM1H
 5UxI23RlYIqqSyZJV4dkLPWKLrfU8pjgucFCL74V0zG2ebKAJkdhQU21f
 EW9Y1o12Ub2TKJHpmaPGjC/h2+zuca/kAuWgkdXRYyBkJ9Vf0dvuShFsn
 AKhUeSOza1CLm2ED6xKOoeVsE8zUXPy20qedhwBVNrf6qRntA4Gr56VfI w==;
X-CSE-ConnectionGUID: xEOtVJ+pTtuIQCo4BFHjeQ==
X-CSE-MsgGUID: +6GF9iGrTResAOR+GEXY6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="31090467"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="31090467"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 11:14:39 -0800
X-CSE-ConnectionGUID: 3EpEdmG5SBCQtvF0a3IEsg==
X-CSE-MsgGUID: mlXY/VdARUOKfCmV7GuLuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="85310132"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2024 11:14:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 8 Nov 2024 11:14:38 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 8 Nov 2024 11:14:38 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 8 Nov 2024 11:14:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxbJE+mUQ7gFn2cpnxwzXSpbDMesSr5Xi5QsKKKj1bhgf1fF3tPd+PP+G4nvRYAlnptmIF/Smik8myY3v9XrlFwO0BLviE61XGmh+ZgXb4Tyz6FTOFeOV322yoFKqALXQxXiSfdCC2cYTGjCM8MwirnTOSKu908Myek2BAtj8tmvutg9Jl9tq4Wr437nj/GV+wFWlEzQjed9n6rMp59TyF56g6Lc+RQ6xohuAtvYsOMGlwjn4xJZ0GrUGOakxOLo3fU+OB2CaQm2Q/QNvCmR69dNBkvo0zU73rF08BIGO1AIb4yoPhkNtHg5nWFyB82PWpl6nyiGB1bVAoWBuYOAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJXxY/T8pis0ePeDfk3gi8jDHku44HCDXBYn8P4H04Q=;
 b=urBVjnNiNn/IQ+wnla+oRh4EC8oaxl9G159LAv7Sb0ERT0CjTVLrOhVBH6syeHhY+KCCf83OaatQjME2ex2BQK0Q7SHkcDhvwL1gMtyTqKmHLou/ObZpneJX1vEzXyr+sMad0WZbQGpFe4kUfGtwxTbOcGeTNzAGIoP8c1CYntmx4e0WB+ZCLVJewx9dNK79OgoFH0z8W8QxmNr1j0Yn0M/GgKznrFavDkOYgepviaVTBTSk3qIWQG0VW7rOUfVguyuSCXIDXNKt4/GVxU8C2kKZa/HVJG5Ic/+uohk2B/byIRa/lziEO5PGBZqEwhnm+llRQOoawGTcUY/hRocWig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB5022.namprd11.prod.outlook.com (2603:10b6:a03:2d7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21; Fri, 8 Nov
 2024 19:14:36 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8137.019; Fri, 8 Nov 2024
 19:14:36 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241107082158.1436637-1-apoorva.singh@intel.com>
References: <20241107082158.1436637-1-apoorva.singh@intel.com>
Subject: Re: [PATCH] drm/xe/xe3lpg: Add Wa_16024792527
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Apoorva Singh <apoorva.singh@intel.com>
To: <apoorva.singh@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Nov 2024 16:14:30 -0300
Message-ID: <173109327019.7597.979644287484911342@intel.com>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0295.namprd04.prod.outlook.com
 (2603:10b6:303:89::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB5022:EE_
X-MS-Office365-Filtering-Correlation-Id: 11aaa436-7872-4a0a-07f4-08dd00299589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zlkxbm1VczArbkxobUlZTWVHUnZ3WGkyYi9VQVJabUFVTk9zK0pKQndkTzRC?=
 =?utf-8?B?dWQ4S3FnYWFxUkQvUTdROTBFeGx3S1lUOHRQY0RDdWdnbmcySmtVNDl2SVc4?=
 =?utf-8?B?eGxtZUpFRDl1eWxrc0srbmhlSVVyeW5GdlNWcy9BRnUyRGYxMHEvL0FKeU1I?=
 =?utf-8?B?N2x6L3pMMWo4T29jZnlOb3J2ZXVmeVZubE5POENMN2tnTStFUnNKaVR5dzdJ?=
 =?utf-8?B?dFZhYk9SRURHcTVWdUpxQ0gzWWZ1Z2JZVjRYdTZ6NTBqMlVXaWtXbmgxUzJE?=
 =?utf-8?B?VDljdEphRHlWQldTRXVGU3d2MWhldysxTXRmZlp3Q2kwcEk3Lzd3T0MxVDIr?=
 =?utf-8?B?OVJJZmY1dzZQSEFkWW15c2J0VUN1Mzgzd1E1bVd4M0xKZVlvZHZMRmlPU2pF?=
 =?utf-8?B?UFBOdWNpdjRZSkFNYVFJS2NoNXV0M2ZFdTU1azZMaEZ3Q29uaXpGM1hMZGg1?=
 =?utf-8?B?dVh0N1JQV095K1pJbElScnBUdVNUU2lwQmR0S1NhMVFYSHVHcGtPWHgzTjJj?=
 =?utf-8?B?bjNXeFpVV3lMYjF6NkNuTHRUYjg5eWF1VmV5VXhTZkl5Ry9sWG5rcHlPSmUz?=
 =?utf-8?B?QVZLZW9tNnNQT1F2N1lHcHh4V212MWg1Vkk4MGhuSVIxNzlZV3YvMlV5cVAx?=
 =?utf-8?B?Um55ZXZPa3V4M1JjV2JHOFo5b0xMOXFUWW5SME9DVW1GS0FSbk41YjFPaytC?=
 =?utf-8?B?V2s5WVpSdWdwRFlLT2FicFo0Y0FDcS9NcXNPVkpIcGNGL0YxcVRNMkQ2bzhx?=
 =?utf-8?B?RTFmbmM0b29HbGhxbXVJVkFRUUVScFVFSWw1MjRaaVo3T1FJaGR3WG1rOW4z?=
 =?utf-8?B?bGZHOG9GUWZDNDBjM1llTWduRUtPUjVna0orRFBmRDZ1Vkx6M0drZXRzNGtR?=
 =?utf-8?B?b0JKRDNQa1huWUNFK1kzYjR4cG9aZHh3Y05LVjVPRXhWalZVODlZWU5oSGNl?=
 =?utf-8?B?eU0rRStwclJITVVKNkF6WmF1dUlRVGJzcWR5cGRKUzJUQUU1WUVLazc2eUJt?=
 =?utf-8?B?SWJqMHZtWXNCaitwa2VXSG50TlpCdEJOUGVpMFNXVngySlNVSnZqbWEyMXpy?=
 =?utf-8?B?Tk85M05IMHBqMGFwK2xZdGxRMGdZcnd6TDdXRm1kY2hjOHZqYVA1aDhYYzJp?=
 =?utf-8?B?VHJBS3FtZGpOTlVjMTQ1Yml6RUlJRGM2QVFQV2dpZ0V4Si9LQ1JQdmFRenYr?=
 =?utf-8?B?eUU4ZWdUNm00R1dhMXlFMEZmU2Fjd1JvVTlIV1JkMExOdHlTaHFqR0dFNVFR?=
 =?utf-8?B?OGh4bVBqSWd4dGN2eWxJbnRFT1VCT2kwOWQwQXBRK1VSS3BtaGtzZkw0dXZP?=
 =?utf-8?B?RWFHUnl5SGJJdlorRy9wWSs0VkRVWjBoN2NBdlY1eWRCeFE5SmttTmVtMFFK?=
 =?utf-8?B?TW80T0VqU0l2Q1JCdGIvZ1Zzak9XOEp6QjRMaFlRWlhhdFR0MTZCUG93VjRE?=
 =?utf-8?B?eGE1aElISUN4bTlOMUNWOXkrTndmRUk2YXVWaXBzOXdmVXhta29FR3dGYlNN?=
 =?utf-8?B?QkRlUWMvNENYbDJYdjRVV0E0SzU0cWxPQ3hUUzNnWFdibEc1OVYrcTI5ZVYx?=
 =?utf-8?B?Yk1jclRibnlTSEphMFBySkxpTTF4MTNLbGI4OG8wK0Y4Rmh3REdRTm9zRmgw?=
 =?utf-8?B?VUVtY0hEb2Uya2NuZjZNTHcvNDdWQmZBRjFrakh3dDIzN1BtUWE0Z3RQMy8z?=
 =?utf-8?B?UEpPTW1qblprcjRIV2Z2RjJTVzRhUGVxQjh1ZzBPaDRJcjhPWmxyd2pkdy9N?=
 =?utf-8?Q?bW1JqSv6spPEcb2jsd0WgbCO5cXYU2QsQdMKTLB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRQWlczLzNPYUVpWVdwQ2VjMTlMbEN1aWl6cm1MWjNTckR3Y1cyZmVlMGF2?=
 =?utf-8?B?cFdKaFcxTDJjZVQvMjRXTVJzZHVNN3R0aVRKNDFwNTNpQlJJQkxuUk1maFE4?=
 =?utf-8?B?UXlneitld1lDeHRBeERsaUtJRU1TUEdEN1pGa25mcDhELyt4eDlSRmsvWXQv?=
 =?utf-8?B?REJ5RGxhdXpySWpCaGNrQm9pUFVhSVpwc0xNaWQyVnFJMkhCdW43QlJhL29F?=
 =?utf-8?B?MzBOaFpjcTZWZ1F3YWxpbVN4Q09tTjVYSWtjTkFWYTJvcEtWSUUxdkNnWTlN?=
 =?utf-8?B?c08vRW9vdzNoaXVyRlJCU3pyd2ttQzNnOU12enZ5cEwzR3ZweEJqTnptYTMw?=
 =?utf-8?B?cnJQNU5yc21KRTAwUzAyNmk3NTQ4VE9iMCtYWmsxWDZSS2VRZDQvZTJJN0Zj?=
 =?utf-8?B?RUhnak5VL2VPcDJ5dEtUblpMZUhlWUR0Zno5emVqejd3V3VaR2UyaW90MTNN?=
 =?utf-8?B?SGdCRktXZTJaUGkvZ21jdjdocE0yRGZPVUFwN1N0c2YweTlTQmJGbXNaeDJn?=
 =?utf-8?B?NXVtVmNva2FxeEU2NUxUaXg2U2Q0QzhTOEJDcmVoMU5TeHZFenhBemZzbEVT?=
 =?utf-8?B?MU1KVm1rVTI0c2o2VUloZWFDbUhRanAvMXduSWtYMGE1L0djcjNzNkNpcklk?=
 =?utf-8?B?N1ZaSWd5cjNmd0ZCalNWU1BWYVlJWW0xMUUxL0J2VFhYZjBTT3psdlNqUTg0?=
 =?utf-8?B?bUdCTVZQcTlnRFNheUtKYnhzOW9IdVFxekNNSlhJUmgvV2VVOU5Lc0ZnZzZN?=
 =?utf-8?B?aWNGa05Lek53WEF3NC9BUjRqZzB2cmV4WmFJQjRhZmNQRDdQNzZhSnp0Z0xG?=
 =?utf-8?B?LzFzQ09pRlFSVDJZUmxPVC9Ba245SFd6aUtXOE15cEgyb2lDQ242MU1QaVhL?=
 =?utf-8?B?c0gwWWNjbFM5T05FYVB5eE14YUdEU092TnJxN2lqdEJhVU03YWtVMy83L2hu?=
 =?utf-8?B?YzFyVGlicTdHS3FBQkFLNkJmQ3NCaXoyV011YTBvNG5zMkFub09KWVpsY0FI?=
 =?utf-8?B?Z0pzMFByMWNIWTIrYW51RFZGTHpzZ2ZvOFdWWGhSZ3JCOFpXNWx4SlIxN3NM?=
 =?utf-8?B?Y2YyUGRrV3ZLL3FPYUpDK0lIeHplSVVEQm5MOU5TUzlzODkydDhvOUx5Z083?=
 =?utf-8?B?MFNEL0RQVjJzS2JHUGJmZ1NYYjJUTlZzNWhzdDRtTk5LQ1RweVR1T2tzNHho?=
 =?utf-8?B?bjR5Q3lONlAzNWtTSGhQdnhMQVUwbEpxVTY1NTBqeUZtaXVPODY1WGpwVExN?=
 =?utf-8?B?THcreFpSYVFkZ2V2ZVVaeThzemF3alZDZU1LTEJrT09WMUtQWDR6aHdLMElw?=
 =?utf-8?B?a3Q5U2xoUktWVFI0RHo1UE15Y1k2ekg3MHZ2VGVLbTlvYWFGY3g5MVZmcjVy?=
 =?utf-8?B?T2I4a1Axc2NGYi9hSkdrTkZLb0lIbWQ3cGt5TDRHVS9YT3Jnb1VqTU9OZmdI?=
 =?utf-8?B?NG9sQjB3YTNBZ2lZSk9lOXdvSk05OElGYzIyaGRENi9NallTaWEzVWtSSmsw?=
 =?utf-8?B?QnhRUDJ4TGdZZ1NiWm8xN1lyZFdWZ2VweEVvYXFyd25zUzBvK1dkUWdLUDI3?=
 =?utf-8?B?UndmNTM4RTlveU5uelgvNVprMmM1cXVsQ3lTSytkQ2RWZzE2c3lMZE04YXpN?=
 =?utf-8?B?d1pvN2xqY2ZuQnp1ZFBrWVAvUExTL3pKYXBZRTFZbEhoVFdvaHFmbmVvelNU?=
 =?utf-8?B?STlJZWx0Q1prVVBPY0g0NUxUdlM0VkJPOWVGYjRDdG4vb3hnOUFZRGY1LzlG?=
 =?utf-8?B?NWtXOS9JN2Q1Rnk0M0RpVkpweGMxSzRTOUV4SVRXT0tlNVRzU05DVWZKL0sx?=
 =?utf-8?B?aUxndUtIUGpFajVnbHBzN3VXRDZud1ozTGFrcmkyMGQyZm9UYkw3TU0wMXRY?=
 =?utf-8?B?Z1lkaGsrL2M2OUFqYXVVMmRDVXdLZEZ3Y0hjRytISUlBQ2FkQ1VETE5hVEhu?=
 =?utf-8?B?Y2NHdGhqMkl4blg5UEVzNDdMaU1rZlpWZlZvd3hkU1FScDRWWlVPNUhjL01j?=
 =?utf-8?B?U0owcHpZa3BNZWpBVlVjTFh6cGdoZTJoS21uTWFVVXBhbFhNRjlZbjNvekdv?=
 =?utf-8?B?TFpCaG81K094dEdjZEJiZTVzNkZJZzdRNzBsTzI5cEF1OEFtSjVzREx5cUVR?=
 =?utf-8?B?a0l5UzJOWWVIUDdVYlZySEJnZGRYREdHTCtQQThkcVp1OFNZWjRpN1BwVkkz?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11aaa436-7872-4a0a-07f4-08dd00299589
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 19:14:36.0594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtQyWHoly4rs7MN/gFlv36WmJTuQsvXMSpETq38AJv/YFB760pnAvR+CzecnrWtgU9JisFfzuLb5ZkePQnBiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5022
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

Quoting apoorva.singh@intel.com (2024-11-07 05:21:58-03:00)
>From: Apoorva Singh <apoorva.singh@intel.com>
>
>Force Sampler Tile64 Overfetch via MMIO
>
>Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
> drivers/gpu/drm/xe/xe_wa.c           | 6 ++++++
> 2 files changed, 8 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 0c9e4b2fafab..162f18e975da 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -445,6 +445,8 @@
>=20
> #define SAMPLER_MODE                                XE_REG_MCR(0xe18c, XE=
_REG_OPTION_MASKED)
> #define   ENABLE_SMALLPL                        REG_BIT(15)
>+#define   SMP_WAIT_FETCH_MERGING_COUNTER        REG_GENMASK(11, 10)
>+#define   SMP_FORCE_128B_OVERFETCH                REG_FIELD_PREP(SMP_WAIT=
_FETCH_MERGING_COUNTER, 1)
> #define   SC_DISABLE_POWER_OPTIMIZATION_EBB        REG_BIT(9)
> #define   SAMPLER_ENABLE_HEADLESS_MSG                REG_BIT(5)
> #define   INDIRECT_STATE_BASE_ADDR_OVERRIDE        REG_BIT(0)
>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>index 02cf647f86d8..570fe0376402 100644
>--- a/drivers/gpu/drm/xe/xe_wa.c
>+++ b/drivers/gpu/drm/xe/xe_wa.c
>@@ -607,6 +607,12 @@ static const struct xe_rtp_entry_sr engine_was[] =3D =
{
>                        FUNC(xe_rtp_match_first_render_or_compute)),
>           XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>         },
>+        { XE_RTP_NAME("16024792527"),
>+          XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
>+                       FUNC(xe_rtp_match_first_render_or_compute)),
>+          XE_RTP_ACTIONS(FIELD_SET(SAMPLER_MODE, SMP_WAIT_FETCH_MERGING_C=
OUNTER,
>+                                   SMP_FORCE_128B_OVERFETCH))
>+        },
>=20
>         {}
> };
>--=20
>2.34.1
>
