Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F0DC79FA0
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 06:14:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20C110E070;
	Tue,  8 Sep 2026 06:14:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4MnLTDt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFCC10E070;
 Tue,  8 Sep 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788848088; x=1820384088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8ymzppNhTv1Pr+O9btbAJCN9rObhQqoClAeR5DPeSJY=;
 b=J4MnLTDt1gwYvquHEPA/WdgvuZs712T13OSIjGXtPULNzlP+qLdE18/l
 tols1wpZAHhy//Q8/VAICBML0UCWOlkQNYC+gAsG6GUSEca8Sv1PHb246
 4AhcVbxCuo5iktRQS/JhJUEsFLap78U480m4SNnfjmmRTGEUfwg4givIH
 Qad0vzD4uXY+bB4Yus8yINf+TIj+abBXspVy9QoEleDPl6L87fQONl2gV
 2bzz9vQi7RhICfz16Oz+DydnBDjFgAQCyfNbTHvouf8DV7p5t7JSGWQCf
 sXL4zAm672uC/GYtPELQ2DUZmccjBfywqcmllmKv6VvE8ahqcrjl/ICgb g==;
X-CSE-ConnectionGUID: 3ReGFgQAShCot3mM4LQcZA==
X-CSE-MsgGUID: wK13GGaJSLWwyCkhzjilUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106612202"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106612202"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:14:48 -0700
X-CSE-ConnectionGUID: nhAihsaSTuSs1dkGfocFeg==
X-CSE-MsgGUID: S8tv+bhrRd6ZelX4ivEyAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274679065"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 23:14:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:14:48 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 23:14:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 23:14:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRXVSDInmmF4oYKtxlmLzmAeVB1CuoNRs3PA7Yw4w7ZPeeSjMVXwVRaGcOR2sF5D/Mjk5Mkq92O+NbPeI9ZS11gro/7mQjyghcO0YtNhHh8LUsUiWZaUwwlQXaaQBGVt8cA44bgNlazZ7uCZ2Epy47a3EPOktx1pbdWF6ROHjXBjHHh3ctH+xhkYdv+1KQD+sydRNA/3x4MGoXLAGsMFujj4GAHjqk+OSyn5TObrlvGpRd3CcQvsETZKHy/lZjMdUjCqKDAC5wROGMI5CzeuFCR1qW3nVu+mOOPA6YGVIS0AEu5qvSwrcBKQHc01nO3/dZuq3/yepc4sB3cG2AYEGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJvcObAb1mg90y8B0R3/YGjbKUpmikaUrLHhFGG6IME=;
 b=Avme8F/VdukCBTy3QPsgizwZzt8nH5F9oec2KHW+wQev/XEBrtiy2nTTjfh237JGVnyYKjPnGRYSwsXNgYUMhOPaFqAN52YybU35bRrBq2cL125NEJAmsl6hi0xPV67QMJAiRqg21bi7EHf3lWiery1qE+4GCzU8xX3vZo+Yy8aMO9K8FZoCpCg+2VKgm3xf5mI0VVLw2+fj4kwotATpRFm4WAvRk+KTxN/bSllsmwvkmkCWZfAjEZ+8mkj2XSzXQiMX22uescGwFV/oYQuTYcNQWKrEoJOalNO0YpwS339Z4YxWLjCzpuLZHOEOmxzuZBToZcW5GF6dwj/lm6b3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by BL4PR11MB8847.namprd11.prod.outlook.com (2603:10b6:208:5a7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 06:14:45 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 06:14:45 +0000
Message-ID: <91fa997d-f197-42be-8fdf-9b5882554320@intel.com>
Date: Tue, 8 Sep 2026 11:44:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] drm/i915/dip: Store and use AS SDP transmission
 line from crtc state
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Murthy, 
 Arun R" <arun.r.murthy@intel.com>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
References: <20260611073316.1439306-1-ankit.k.nautiyal@intel.com>
 <20260611073316.1439306-7-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304FA9D0C6E6AE811BBF875DE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304FA9D0C6E6AE811BBF875DE3A82@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0203.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::7) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|BL4PR11MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d01821-fa59-4424-b17d-08df0d707a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: Eu0q3ktny8cw/FlbpxVP5fi92cw1JEkTXf/lV6b0HT3KW9hT3N3UiHOcaNHlnyPxPsK+/P7x8Uw++a4k8SX/QZqV06koKb8RAj0hppBJ8xvTbhhGN96ZQ3ViulFbvkusr2lqYTwrLfPqnM+2tJFkR0S+yUE/mH/rXwUYrKwAn7nK3BwOWRab54lbsjlBGMCgbShDG1x/6/4HAM1/xKmvXRDlP9K6Dgs7iMMKjlX0IE4MzsTvH05Zm1IF3giEO2rstlHc18ChxIQz95ZJIuquRmGwQpKdKt2KJysmzRLcHmQ1QMCycQtgWWKsijKgyqqMv3DA4mCpoMtB1wlkE6kFd31TzK1j1T7oXqt/jTCYYfvHNtwnZCz06YY0fIOAIM7YvokVoF7K63nByUgHu2T+jQhIGILxWfnuAQhlJu+8MyyYrswIii7ZNLtMjaKHdQTW9AB2/rkbtDk3SFOPQOJzFvQheyqXrWVd0YJiPLhbBJqTGW0p5GbYdhPnKgndy6FfgwApgR8mp+nVBL6Y9JxRPadb+NBGmCU8pdwzBNS0u4SC48WFRMaw7BhRURF6KB2OKgUpr7YcKVJcmRIGZUyqw5iqHaqabyF8GxspzDsGGc5Oa3uUoRe7pDVAimbFcT4j2sdhuGbzHQwgapFa/wDwZOfZdR3/ihDR9bOpZ+Mr8Bw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWw3aXFnYkFFdmk0bDFNL3JKZHMzWElPQ01OczBFQkw3bGFkK2Eyci9xRE5k?=
 =?utf-8?B?MDBmMzA2UEVIdUZoS1ZvNCtUSTg5QXkyRWxiSGFhaW1ubHNKVmxMbGJ1TURI?=
 =?utf-8?B?VE5RN2daTjMyN3FHbDVLaEJoYlFXZ1l2cC9hNk9VV3dYRGQwMWN1cGtqQjNR?=
 =?utf-8?B?T2xVT3R4djNvNlFUOXNhM3RhQ1J0WWVIa3RkRy8xSUEvQXkvNWZWanJWZnY0?=
 =?utf-8?B?OGhJRjd0akNmeFRISDRMTHZUdEh2L3pRNVMvTkU5YzJ3VE4zK0pDR3krZFRV?=
 =?utf-8?B?eENVdndqQU13R0U1aG96dnozY2IxVm41QUEyNVVhRHdqc09wMmtZTDZIQllr?=
 =?utf-8?B?V3k0Vjd0bWRYWlRvcjJIYitUekZIZUo5a1lXZzB1ODFuUVphdUFOc3BEZW1J?=
 =?utf-8?B?YUJ3TXJEL3BwSTJNaWtoL0tiNDBkMXAxZzB2UkYzdTQ0N2Fua21DcWtBWlg4?=
 =?utf-8?B?T2liSW4xZjRBT1hEZ1RYZWN0SE4wUWNVaWhwektXV2VMTWlKd09uNXl5b2Iw?=
 =?utf-8?B?dmMzN1JKZzNzMVJFVC9OQXZFVDYyeEJIWVNyNkJSVTVUWk1SL3I2eVJiV3Yz?=
 =?utf-8?B?OURmSjk3VXVMRXMwcUovTWdocDF0TmtVbStrWXdJWTlOWllSaFBYeWdMWUJZ?=
 =?utf-8?B?U3Bjd1dMTVRSbXg1cURPVjUrREdyZVo0RXVKMkVXdXNTVVA2UmU0N1hiM1ZP?=
 =?utf-8?B?d0NkVHBzK3V1NkZiRHYvRG9hK2t4V2s0c3FDSmZRdm90d05KT3o3NkpQdHk1?=
 =?utf-8?B?UUhhdlFtK2o2bjVLWVV5UEdGdE5Qb3RwNEV3cHZqcXRHWDhzSkhtRElFckZz?=
 =?utf-8?B?WUxFSGlEdkVoNmM0OEt5bHAvTkJHUHV6VWxxeUYyb0tNOEMvQlNJTDJnNnVQ?=
 =?utf-8?B?U2xFcWtjbVlDc0VoaThuNUFkeHJHZTVLeGZnU1ZGU05Jc0tsc2JQa3loYk85?=
 =?utf-8?B?djRrRDlERUdhSm1ySmlicGlUazRZc0pmMGlhSjRRdFRGazZ1NXVJQ3BHbzdE?=
 =?utf-8?B?Z1NZLy85cC9qbnF5SEU1T0svU2J1Z25DcnVQbXVYY3dWS0pmdGd4M1c3RUpn?=
 =?utf-8?B?KzhIaXIzMWtpTS84ZGVQa2cwaHdtVmdmU1c5anNTaDNxemZRY2piOEt5N3k5?=
 =?utf-8?B?WE1ERnI2VFVJNzdFWklnQWVyNFpxbHdJY3VjTlY0RzdUYURRVWpZUlREc29X?=
 =?utf-8?B?UUJCZy8xRDhwd29pcnY3bWxIbWQrNDhMcnZ2OFpwUkd5RjIzNy9EZEtJM0p5?=
 =?utf-8?B?SDJwcDVXRGlOaW5zZTZ6N094TjR2YS9ZYUxIdFVMbWN2MVZBaXA3VFgxdUpy?=
 =?utf-8?B?RFhDdjBtUUhKaUtNR3RWT0s1YTRmTkRscDNHU0hDaHgyWmNva2FGL0o2RnNy?=
 =?utf-8?B?S0FTM1laSkJmK0prajlPeVhWTU8yUWR3TDRFUGc0Y2xDVWpFajhKejBnOFZX?=
 =?utf-8?B?VnVuNlpneUhSVmJqY3JJL3pFb1ZJVWtWenI4ZXM0Mk9kNkszaUM3K3VodlV5?=
 =?utf-8?B?dGNFd0FEdEI0YzRvSCtOSnFSaTBLRUxqMkdieEYxRmNDcVJ4Z2ZCbkNpVklh?=
 =?utf-8?B?UkVyWDREY2hrSFo3UmtqRzhIaDB5aktIUUUrTWJkU0tXSWpUL0wzSEo4ZmxF?=
 =?utf-8?B?N2RKYzNXRGNmVW9DYXgydmZCVDRWOGhkSjZFNnU0TXNjT1E0MmhvZGY5dndS?=
 =?utf-8?B?WmlWTlBxbHp0cjFveHpkdXpJVnZVeHhObFBWak1MYUc1SkwyVW9LRzZCNDV4?=
 =?utf-8?B?a2JmWG5ROEw0QXFmbDdEdEY1cVUzZ0V1N2JqL2dobG9QVXV3Q0p6Z0hFTEQ4?=
 =?utf-8?B?VEpHaFlHaXpydlhnNFJmYjFORzR6TXY2T082WTAzUDdxdnZBaE5TYmhRZGI2?=
 =?utf-8?B?SG81eSttWCt5T21OWnVoZHFRbCs0Y1IwWUgzNW82ZmdqcWRyY3U4WmMzSHFl?=
 =?utf-8?B?MXhwMnNrQU9DWU90TmRLK2NoQ1VNUDI0cS9xL3BZYnZDZEdSY0I0WDcwVnlR?=
 =?utf-8?B?eElIZk1IOGRIc25raTd3bnI4NndzeDV4VnhTSHoxaEJQOGpBVE9JUHA2cHNY?=
 =?utf-8?B?QVFXZEkvT3lpc1M1dnNRTmMxRGJnZUpmS3ViOGpDQW9kUWdac3hPMlZqNHRt?=
 =?utf-8?B?cDdXcHJOaEo3Ukl0QzZyekFHNkxnbkZQZi8zaHVVZ3RKKzB6YlFzRU93bnVC?=
 =?utf-8?B?NXN3OVh1aTN2allSMWZBQ1JnWFVsRytwbWR5Kzl4TWpkclZmZUI2dWJySjNs?=
 =?utf-8?B?dHJjMFRyOVJqSDVHVk9uQm1rbm1mUFVBdmpXV0oyZ2lNQkt3N1Z1bStEdzcw?=
 =?utf-8?B?RTZOWWcyVWY0NFZJUkhMd3RyQ3I0clBXOG9GSWsrTGEzS1RFWDBnWDJpREs0?=
 =?utf-8?Q?+viiF53NNyDnvffo=3D?=
X-Exchange-RoutingPolicyChecked: Y4I78pu1TYBm9Lfdky2AV1zfIijrDV8eTpQI3G+tH74FKYsEZLKEiyDOumaHyUxt3LAkVeUXW8koyJz3Y2hooCe5ZlHReGet4OUY/5NSOe3eq9KvDt4H6uONyGEYlES1saxcP+FApC5x5gPxY9BTcFE6AwIqZccJfEuo2zpEud+cuKdSna0kATPZl3SU7nX9F0OVN36q5GYnqiu8iQK4PPoAZ2R1/M7vkl9+DIXAwvEUXIl9iddPISLtQDmm4MXQShT1G1IsOLkvAz970v1JrplxcPgYmbr+sQGbrhUR6uzH3cfGMfvn5qIXXHkk6ta3MOw3eYAzPavo/8sgTqYGvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d01821-fa59-4424-b17d-08df0d707a1e
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 06:14:44.9572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjXThoAtvMIQXkPJiONz/fGIsjDzp/PFXMzJ67kLb9U0Ox1+E1oU8ScHcCqb+BG0+6Wp3ZVV2jCA3e+OgxKcoDilxUOBZELIX6UmO0auqpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8847
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


On 9/1/2026 8:33 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH v4 06/12] drm/i915/dip: Store and use AS SDP transmission line
>> from crtc state
>>
>> The driver currently computes the Adaptive Sync SDP transmission line directly
>> at programming time. Instead, compute and store the AS SDP transmission line
>> in the crtc state and use it when programming the EMP_AS_SDP_TL register.
>>
>> We get the clear picture about the SDPs and guardband only in
>> intel_dp_sdp_compute_config_late() therefore we must configure the AS SDP
>> transmission line at this point when AS SDP is enabled in crtc_state.
>>
>> This prepares the ground for supporting programmable transmission lines for
>> additional DP SDPs.
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_ddi.c |  2 ++
>> drivers/gpu/drm/i915/display/intel_dip.c | 20 +++++++++++---------
>> drivers/gpu/drm/i915/display/intel_dip.h |  3 +++
>> drivers/gpu/drm/i915/display/intel_dp.c  | 11 +++++++++++
>>   4 files changed, 27 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c
>> b/drivers/gpu/drm/i915/display/intel_ddi.c
>> index 6399b16405c8..d2edfad295d5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>> @@ -49,6 +49,7 @@
>>   #include "intel_ddi.h"
>>   #include "intel_ddi_buf_trans.h"
>>   #include "intel_de.h"
>> +#include "intel_dip.h"
>>   #include "intel_display_power.h"
>>   #include "intel_display_regs.h"
>>   #include "intel_display_types.h"
>> @@ -4215,6 +4216,7 @@ static void intel_ddi_get_config(struct intel_encoder
>> *encoder,
>>   	intel_read_dp_sdp(encoder, pipe_config,
>> HDMI_PACKET_TYPE_GAMUT_METADATA);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_VSC);
>>   	intel_read_dp_sdp(encoder, pipe_config, DP_SDP_ADAPTIVE_SYNC);
>> +	intel_dip_sdp_transmission_line_get_config(pipe_config);
>>
>>   	intel_audio_codec_get_config(encoder, pipe_config);  } diff --git
>> a/drivers/gpu/drm/i915/display/intel_dip.c
>> b/drivers/gpu/drm/i915/display/intel_dip.c
>> index 504a2edadd0e..333314637db5 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.c
>> @@ -27,19 +27,21 @@ void intel_dip_write_emp_as_sdp_tl(const struct
>> intel_crtc_state *crtc_state)  {
>>   	struct intel_display *display = to_intel_display(crtc_state);
>>   	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
>> -	u32 transmission_line = 0;
>>
>>   	if (!HAS_EMP_AS_SDP_TL(display))
>>   		return;
>> -	/*
>> -	 * Since currently we support VRR only for DP/eDP, program the register
>> -	 * for Adaptive Sync SDP. For non-DP encoders, the register is reset
>> -	 * to 0.
>> -	 */
>> -	if (intel_crtc_has_dp_encoder(crtc_state))
>> -		transmission_line =
>> intel_dp_get_as_sdp_transmission_line(crtc_state);
>>
>>   	intel_de_write(display,
>>   		       EMP_AS_SDP_TL(display, cpu_transcoder),
>> -		       EMP_AS_SDP_DB_TL(transmission_line));
>> +		       EMP_AS_SDP_DB_TL(crtc_state->dip.emp_as_sdp_tl));
>> +}
>> +
>> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
>> +*crtc_state) {
>> +	crtc_state->dip.emp_as_sdp_tl =
>> +intel_dp_get_as_sdp_transmission_line(crtc_state);
>> +}
>> +
>> +void intel_dip_sdp_transmission_line_get_config(struct intel_crtc_state
>> +*crtc_state) {
>> +	crtc_state->dip.emp_as_sdp_tl =
>> +intel_dip_read_emp_as_sdp_tl(crtc_state);
>>   }
>> diff --git a/drivers/gpu/drm/i915/display/intel_dip.h
>> b/drivers/gpu/drm/i915/display/intel_dip.h
>> index 37507ac3e645..600dabbf7372 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dip.h
>> +++ b/drivers/gpu/drm/i915/display/intel_dip.h
>> @@ -43,4 +43,7 @@ struct intel_dip {
>>   	u16 emp_as_sdp_tl;
>>   };
>>
>> +void intel_dip_sdp_tl_compute_config_late(struct intel_crtc_state
>> +*crtc_state); void intel_dip_sdp_transmission_line_get_config(struct
>> +intel_crtc_state *crtc_state);
>> +
>>   #endif /* __INTEL_DIP_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
>> b/drivers/gpu/drm/i915/display/intel_dp.c
>> index f54f7faf878f..e143ec1b76d0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>> @@ -7356,6 +7356,8 @@ int intel_dp_sdp_compute_config_late(struct
>> intel_crtc_state *crtc_state)
>>   		return -EINVAL;
>>   	}
>>
>> +	intel_dip_sdp_tl_compute_config_late(crtc_state);
>> +
>>   	return 0;
>>   }
>>
>> @@ -7468,6 +7470,15 @@ void intel_dp_link_cleanup(struct intel_dp
>> *intel_dp)
>>
>>   int intel_dp_get_as_sdp_transmission_line(const struct intel_crtc_state
>> *crtc_state)  {
>> +	struct intel_display *display = to_intel_display(crtc_state);
>> +
>> +	if (!HAS_EMP_AS_SDP_TL(display))
>> +		return 0;
>> +
>> +	if (!(crtc_state->infoframes.enable &
>> +	      intel_hdmi_infoframe_enable(DP_SDP_ADAPTIVE_SYNC)))
>> +		return 0;
>> +
> this part should not be a part of this maybe can be squashed with 4th patch where this function was introduced

Agreed. Actually infoframe.enable check is not needed since we are 
computing the transmission line even if the packet is not sent. Since 
this is called only from DP/eDP compute config path now, for non-DP 
encoders it will not be set.

I will remove the check and move the HAS_EMP_AS_SDP_TL() check in 
patch#4 where it belongs.


Regards,

Ankit

>
> Regards,
> Suraj Kandpal
>
>>   	/*
>>   	 * EMP_AS_SDP_TL defines the T1 position as the default AS SDP
>>   	 * Transmission Line, which corresponds to the start of the
>> --
>> 2.45.2
