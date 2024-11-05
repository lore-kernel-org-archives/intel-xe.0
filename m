Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F89D40CE0
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 23:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0D0910E056;
	Tue,  5 Nov 2024 23:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H69N3Ss7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CD910E056
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730848469; x=1762384469;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7bzag7GVSVx2n5xAY0+VvFYAOPQUPhAK0S2cJTTApb0=;
 b=H69N3Ss7uON1yO8FQgIPhAQbgaVUkfgmg0pVp5xa1GkjZgMxuPZvgjOS
 VPlsF8XDzAh2t3m8liNzVbsecIAL6mwEw7Odg5xAREBOKA87iUaUceS1m
 9QidISJxKRUoyvtvlh1sjAVNzw2KN2Kuc2tmn9Hfv6Meiq+AUHAY0vAku
 Xjf03Q+oAWrxV0PSbg3kuVQI1i7NaqIKweXnzI4iSzoGgQjSEZWukzVI3
 YapH3W6MUUkaolZbxsmBg4kSjWe0kXe8K9PCk5YlNP5R5qz4ph/QDBtH7
 QA8vl50bPhS0qOLSVvfGNexy9u/ykTsTBu/+RT6SVUp1zE5wA9ACU+aO+ w==;
X-CSE-ConnectionGUID: qCX/6NmfTIGlYx2z5LQpZw==
X-CSE-MsgGUID: qFUThqdBSHSItN008kwePA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53191391"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53191391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 15:14:29 -0800
X-CSE-ConnectionGUID: U/N1oGbWTseqqcQYvsIing==
X-CSE-MsgGUID: If/D8fB8RtGZ+U+ifC6FlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88711813"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 15:14:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 15:14:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 15:14:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 15:14:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctAhl9lpoYly8iBkD85U12eH7tlXRplxhdDjYiOArZQUNv6sRohG8/SIxZN0ipdWDmIUMv7HqKRhE4LeuDOW6h/zU4Ht3mA7xQIA24zI5Igz80Bsyr5xfSLPX1W0gfStCsrYsYvyZve+NS5Ef15SediJ/0YEpCs3iWrL6WEHtkvedKYXHu3mnCglBemNxRR1D62jS6UB0wqdePixkgIU5uTycotVXckJyZO8k67q2D08Q2A+eUD5BwP+6VHSdrNIjyJWR3qH8cDYhX2irS0k5eHrRjuXb0wvJEOoLI+kGzxhiK3y97oa6Ifm/58k/hEJimJnEDR8mSd7gNRQ6gqbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nfAbGI4Ihqj9yNHjmmBNWFggCchgOn073dRttaH1y3k=;
 b=OP51adYLoz4FF6IWwuz2jt2qHyGWEtBqyh2SSNdN+BHr9octnJjlZQVf2eCy1GxzTHhU8CB7bgVmJcMCaZq59SL7YGcC2oSxCW1Bqe1aTNzq34fLfpYUMJ3nePR9rojoCnPI110AzyRZluGPEC+vobCGNsisEExGyMsUKnt6DRQcgylaoRxBfC8Fo7W5naChREBpgcClax9+TbUAIqchtaEz59rY0hpmSEO2jezzvkrVqmBex+3fdjHjM7mlyKfSSvVoCuaK4Er/YqG9XK5PejBHP35CBUa+YFuj23A21B+FlgsjANQg8lbHrlu5e1ngizyhVtdS9gVZcuh6YftNQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 23:14:25 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 23:14:25 +0000
Message-ID: <78593354-72ed-4f82-825a-38cecf711b46@intel.com>
Date: Tue, 5 Nov 2024 18:14:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/guc: Fix missing init value and add register
 order check
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20241104182425.162007-1-zhanjun.dong@intel.com>
 <eca59faa5794c683892e72f7e7de028489c2aecd.camel@intel.com>
 <10b081e9-1cf6-44d9-9ee2-3ce47e099273@intel.com>
 <85r07pxrpr.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <85r07pxrpr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0094.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: b5527965-d77d-4982-9c2a-08dcfdef96cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlBQK0JBY3NYTldIald5ZFZGT29QSTQ5dHAyT1NMck1BMTVvTldoWmxuQ2w5?=
 =?utf-8?B?cCtoRkVkQStaOTAvb3QwQnBlclRYQ1ZLcFNUWUtxUzVhYWJITDJ4aVlJZTdB?=
 =?utf-8?B?aGxJN0tWRU9DMzFseGlBUDFPbXBHMS8zbzc3Zm1ORWNZM0VITW1DM2tJUVRy?=
 =?utf-8?B?Vi9PRDRhYWk0TXdpVTFtRjI3WStqeVd3aG1QOG1vV1JabGlZRkc5aHVqbGkz?=
 =?utf-8?B?eURoSVhnTlc5VzZ0aWc0TkduMFJScWtJK01rRWhpVGlSeEdHZlNGVVhqbGxu?=
 =?utf-8?B?dCt0UWhLWUFHaWlIb1FvQlBQTktFT3RxMmgyMFphKzlKNU5LN1dIaGxZd3Bj?=
 =?utf-8?B?dWsrMmt4dVBYVjJSbHRLTDhFRzdrUW83Qmh5cVBxdUtzdk1WRmcvQ080V1R0?=
 =?utf-8?B?ZzREaE9SaWlwNnRIUDUyc0oxM0FiTEFuSmVuZGY5Z1grc21GWXc1Z09tcGQx?=
 =?utf-8?B?L1dkMEFQMW9uSDJNcUFrc1FoRDlYL3pxNll6TGtqek9aZlNadDYvb1lVTkxT?=
 =?utf-8?B?R3J6c1ZEcXVlOUNVNm5TS1J2dGczZkVrMzJYeDBjMjlzb1Evbm85MFgycjU0?=
 =?utf-8?B?TEJxa3ZyOWlwUlkyTkNZbE5laHFibEtLc0JOeDFGaWtEWElYUUQvZjdobmZi?=
 =?utf-8?B?T0NPaUNpaGZEa3hnV0tlSDhhM01oMFFzdlhVaGRySUh3UHEwOFVQL0lEQWpW?=
 =?utf-8?B?ZFpoRm94THppSmlsZ1duV1lDN3pYVXBFdGdwMmFWWDRKNlRjKzU1dmJ3eExI?=
 =?utf-8?B?cVNoU2x0VnR3Y0k3U2xWQTh4NHhYZUFoWXYvQjNQSlZKSi9Ma0JRanFoZVhP?=
 =?utf-8?B?WXRVMXhzR3Frbk41UFBOWTBMazF6d2pTeExtSzEvT2VETTdyVTc5Q0Vjc2ZD?=
 =?utf-8?B?UzA4TTBDN1Z2MXBYbWVYS2hUWVk5NElXK3I4dHFPUUZJU0ZLUXJ6Zkh0ZEFW?=
 =?utf-8?B?UWVyTERnWDVLdkRjRTNPQzMxb2VoRkVkMDAyUmRZZ2M0cjFCRDBGUW1WbzRr?=
 =?utf-8?B?T2dMNTNxSlc0blE5Z1k1c1k3L0k3SmFxQWZ6Rmdndmpsd0hwMFpxNStpbXV6?=
 =?utf-8?B?Y2w4N2RubzJMUFNpdGZGNGM1aXdmT2xvWDhnSjYxd2ZxN0hnVW1aOWdZUy9t?=
 =?utf-8?B?WnhPSlZJWFgreG5lQmsxbk1sbEVBM0V3THJ6MWxKSzZ6OGJ2cFIyR0EzZkR2?=
 =?utf-8?B?S2VrYzg3Tm9Ycm9ydTk1YTBnWURSTmxpQkRmaGpSaFZyRFBXcUFnVDdwaTl3?=
 =?utf-8?B?REF4YVIrekYwcUhPcWJTZFM0NUFVK3l6ME1SV2lqMXlOWFMvZTBZQ2NQY05v?=
 =?utf-8?B?cm5PR2VEdG9veDlMMlNMMUpseG1uSG81Z1dCMS8ySTBCUlAveGkzMjhtdjBw?=
 =?utf-8?B?Vno0TTllM2FYeW51SEROZjZEOGZCSEN4WFF5T0MwRy83VS9zNk9hNFdHOEc4?=
 =?utf-8?B?aFBNZG1sNWdYTjlHbk9ZeEkxNUxGSUcwRllYQm1wSnZ0VTNTY0dRWE5KWjhQ?=
 =?utf-8?B?THYxTGVoeUlNQWZTVnFZODB1eldHbGc0VkdVeU9lTXBuY214U1NaejdGbXM0?=
 =?utf-8?B?VjI1Q2VhejdlRTV4T0NDMjg1ekVrYmZUOGFWaW05VElNV0dVNHh5NVlRL1ox?=
 =?utf-8?B?d2RUaGlnNmhUS0wvbkc0bDhTSHBqU2R6SEo0RVJ4OVFLdEtaUi9ucG1EZzQ5?=
 =?utf-8?B?Vk1NUnN3VGNRZzZob2hlU21WN0QyV21tODNqbUhHeG5ieTZQMWgrdnlZRWhn?=
 =?utf-8?Q?PUdi4XKheNgrUKnNhQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UldQNUc4QStpL0VFQkRVcFpxbUpEcVUzU3dRbXQ4aSswbkl2Z3pCZUZnREFY?=
 =?utf-8?B?czZITVp1RWY3ZThuaTNCYjA2aTJXZlFISFdmdjA2VU1QTU1LRWhDaTJCdXVk?=
 =?utf-8?B?SUFlNVEvTVBNeDdjaFBqUkpEbVlSMjh4alVpcG1tNGlrTFFpUjAyRzA1T3VB?=
 =?utf-8?B?ZmhHZk1TcHlGVm9zWksySUY2ZGNaaDBBZXpBT2QxS2lvdmhxMnNKNDY3N2pI?=
 =?utf-8?B?NHk5REsxYWVGbHNMQzUwdU96dXJsdGlZdGNkbElNSHloU1lEaXk3ZXJNaFZr?=
 =?utf-8?B?OG9yUXFRUVVrb2p2L1ZGTzVrMHRyd04zQ05SNDBpMy9rL1NHeFdXNEdRa0xW?=
 =?utf-8?B?UUJZYVRiekFlWlBUMEZobHo3U05rTzkzVk1xczBXM3BxV0JjRG9oeFUxNVdq?=
 =?utf-8?B?RHJhNjhCVlV4U1NuVmhkbVljcFpsYWR5ZXJsdU9iWUNUaHVYME13T1hXalJ1?=
 =?utf-8?B?NWJTYzRlL0VhamNFR21OL1lPNHBZb1JaVGFkMjdsbzA2TDZLV2xQcGR0NlpN?=
 =?utf-8?B?emZRZTFJcDFjanRyU3dWUjhiMVJXMWNLOGR4T3ExZThFWTJnRHQvKzhoQU8w?=
 =?utf-8?B?MTNueEl3ZGdteXFpSUE3YWQ2ekxkRzA5TzdGRytnNE1ZRk12YzVVQklPNVRB?=
 =?utf-8?B?NURmbkgySS95ODdoM09vRDV0aGtINlNVNmZyK01aQ2pPY3hMM2loWUpGTVdG?=
 =?utf-8?B?RkhDR2VURURYWHplcDJ3cVlWeGlVdk43UEROeEliRG9RRVFxR1pLTlJKQkZj?=
 =?utf-8?B?cHkwWHcxYkdFRXVOWisyT1ZEUnVyRnVneXZ2NkoyaU4vb3VqUzFzTnpEVWMx?=
 =?utf-8?B?MHM3SmR5WmdjUHloRXpEWE5mVGwra2dhUG81bGt6OHRMRkV5UXhaVk9UV0x4?=
 =?utf-8?B?NTlXVnVlZXdxK0VuMEhWOVh4Uk1uNkxnMkZ6bDRwRXExQStFa29mZU5HUTBZ?=
 =?utf-8?B?dytlZWZZZTUxOFZLQnR2dzgrQTZxbXkwdG5hdVpzVmJiK1IvcmRNM3hvUk9P?=
 =?utf-8?B?Sys1bVhQSk1DVXZoQkE0a1BLRXVYMjJLN01CMEZNOWkybmtqNVJ6RG5LODVM?=
 =?utf-8?B?SUVyL1BGUThQWkFrRzNjOHBrMzNYTFZ3K2tpN0hvR3JyNXpaeS9VZnpQWFVo?=
 =?utf-8?B?VklvUk9YMU1kOTh4MmJ0dTNCb3gyWEEvVlJZZ0hVR0Ftc2JMTWUzQVhoZFhr?=
 =?utf-8?B?THVIUzAzM0Uyd21VK2NKWlg1VWZsUTFaUFBqMVprVHFwdmFnZml6NHRPYWpP?=
 =?utf-8?B?VWQ0N2pRVWRGaWxWeWNxK1JFWENld0tNUXJzYUJYSEFOYW1WbXlOeUFLT2V6?=
 =?utf-8?B?VnVOcFFDRnN5Y2lqSVVvNVdqOHJsclhXc00zbnZmVysreTd0NW4yRFoxVTNw?=
 =?utf-8?B?YW5vRU5VVVpURkdwQTlTTnhRNmpyVkEzYWJrV1dBUmp0U1FDVTYxcDNkdjg0?=
 =?utf-8?B?K0ZIQkdBZXVzbXJmbXA4ZHZLd0kzajNUdU5vTEg4QllsaklSQVRBL3ZXbldr?=
 =?utf-8?B?L3N1ZHlIR0IyS3ZjdFVtOEJFNzBGKzlDS2k2OWk4Z1hwL0cxTk14L1g3bzRP?=
 =?utf-8?B?QXkxZm0vZk1vUlJJR1hzYzFoaFFndGladU05d25YSzM1RkFJeWl6OXJDMXZz?=
 =?utf-8?B?TFk5c3NDNis0TWU1MmhUcVB0U21LQTAyNmlKQ1JqYWs2SVNJRDExSDlCcEt4?=
 =?utf-8?B?OVdPczVSaXcrYUU3d3pSOCtWQ0JUSWs3ZVNYYXVRenNUNU9jWXRQdHhWcW93?=
 =?utf-8?B?VTNYbFVkdFpHUnBKNUgrNFY5WXhMd0RRRHV1ZlBoTzQzRk1oeTVFTkNEV3dq?=
 =?utf-8?B?ZmNqdy9BQlJkUmdhckhJMTh2c2ZzLzNmZ0xxWHgxMCtCNEE1eUNzZ1JYMHZO?=
 =?utf-8?B?RWNoOFdkSXp4TklRbDZ0M21CWmJhUU9heko1YWc0TUl6YU16a3hDaVRkQmFn?=
 =?utf-8?B?YmRYcERxQzhyenpGVFM3RnVqTXdzVU5VSTJ5SzZUbDRzQ3JtS3k5QTQvOUxI?=
 =?utf-8?B?TUdraThVbGJBRFlwTXJES2dIa2NiTjZTS1BCVnZyV3h6S3JpRUptckpVeFdO?=
 =?utf-8?B?OGVqZXkwb1pyOE5sZWw0WERFL211bGg1RS9nNTl2MTVGazA4YXl3cFFSQUdO?=
 =?utf-8?Q?peKKfrO0ZV4XBxC+GPbJp4eY+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5527965-d77d-4982-9c2a-08dcfdef96cb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 23:14:25.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF6hlk8TlZoFkj8CBrhXi/9SDFqbChUKBZwB+UedPVwk1B2azwzJcCjOU6B5ln1rZ8QGDz1ScJbTy4qPXp/qgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
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



On 2024-11-05 5:04 p.m., Dixit, Ashutosh wrote:
> On Tue, 05 Nov 2024 12:54:49 -0800, Dong, Zhanjun wrote:
>>>> +
> 
> Hi Zhanjun,
> 
>>>> + case REG_64BIT_HI_DW: {
>>> alan: nit: now that you have moved to a switch statement, is this { really required?
>> Few concerns:
>> 1. Have {} here will make it works on most compilers and ANSIC settings.
>> 2. Local variable "u64 value_qw" will be limited within this case
>> statement, I don't want it to be referenced on other case statement.
> 
> Do you have a compiler where it doesn't compile? Looks like you can declare
> the variable following case without the brace, compiles at least with gcc.
> 
I know LLVM/Clang is used for Chrome/Android, but I haven't compile it.
Without brace. vscode with the Clang C syntax parser will report error:

Expected expressionclang(expected_expression)

So I guess it might cause problem for Chrome?

> Also, if you need the brace, the 'break' at the end should be inside the
> brace. This is used in a few places in xe, you can see how it's done :)

Will move it inside.

Regards,
Zhanjun Dong

> 
> Thanks.
> --
> Ashutosh

