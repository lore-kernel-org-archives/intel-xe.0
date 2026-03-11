Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040561125863
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 18:14:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B876E89D4D;
	Wed, 11 Mar 2026 18:14:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YMGlkIcw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A65489D4D
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773252884; x=1804788884;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=fOPoCJ/kGo7kAyHp/8BjRPiB6sBlOkdBfAduedW79Rc=;
 b=YMGlkIcwONuxwTDh5npsd8Atna7HWgAim21PXf6dlABHfTTYZcCR3DW5
 mNQUp0xbMq1P4pisYLmcCRfm5+l5/2eUYlvX/7+onKnL0VA8oHrJRXEOw
 Ae4AsDW2suETTUmwajm66SDjNkxS0amp9W37dadL5l8gfkrZ22jgbm2NV
 as+F1SITZVIXVObBT2DOZar83lgvpWblrfw3tqWvqpEFjEodfYnCpXqYG
 ZskaKLFMPOyEnty25FZlk7Xjkjou/7N8W7eY3v3TToANwY+MecPG5sTq2
 k54yYstzhnKu7FONioGym9i5v+i6LXkHiliGkr942Li3RhsUAGpl/FI32 w==;
X-CSE-ConnectionGUID: 2awix9FLT06j8vDxn2B14A==
X-CSE-MsgGUID: yInYWM87QU6XjMYHblZYrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84961115"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208,217";a="84961115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:14:43 -0700
X-CSE-ConnectionGUID: OXjkguOlQnGokui53oYQfQ==
X-CSE-MsgGUID: v8JfAoDcTJGOyh10hmA++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
 d="scan'208,217";a="246081379"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:14:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:14:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:14:42 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.63)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:14:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moyRrpI5gCUrXVS3A1+Wlg0z1JNNdkWLpQv7pgaZfmgXH7nT5febWSH6ZQS8BmJfDoS/7VfPFXl+ocEH7xRdom74/0NigFRbd2dTpdMHXxPbsQ++2KIh2HmPLC99bqeg+qHQMuFHBqfZsvXIEW6U9FDb5CIrlh7QMpFZVmwTIpHwZkD6Gtijx7BEp2iiuisJKI8Rbw/+x/kSzxgosvNMJmitCzKH7waKbAatYC/3zYlNlO+FzQwI73slVr7aU8dfHM/rWVtNRPPUKzDPURKzqHSgGFS9lRUALxTIfk3HcaiSUAKFwGVWB+hSXFlACJvKgwhFv576pn6AhvEf6ijMeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KX69XjpYi/Sglzm0hCbQ0M35ln3WkvgJj0OB1neWe0=;
 b=HHsLicKJUeAFoSuvu23LSsDPQhaynp6ZGCqascz1DqEyswZL7aW9FBsksjTSGH3Vv2tVy56AIN1QeG4mbDhwGeaZPIx+zlrB0q1UXF1dPKRwtQ0ZfDXx3FpbAy6zI6jJC1SHX+H1S89SxuHNlgw6+gSinbkc67lx6kMghN1MGWUmFMe7Uw5dxvdbtSktHbP0gH+Ksjfmi4ZvqKMPaFN33He4ot2Cmr3bx9lE48plgQEQiQBAxNsYj3zzPDeIoxSNh5GrQwZZ3A0uixq7EF1iAl+w/Ao9+XQ/w++6s6kzYDcpT4HqvymNGm1h8Z4mVfPYpghDH5lfWBh+ENMQkCf3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS4PPFC77662F02.namprd11.prod.outlook.com (2603:10b6:f:fc02::4c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 18:14:39 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::d917:ef8:5e20:14f3%4]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:14:39 +0000
Content-Type: multipart/alternative;
 boundary="------------rS9t8kKdq0u3zwEIzhcJii1Q"
Message-ID: <47c69b98-f6ec-4fae-a6e7-16fe7fdd1ef2@intel.com>
Date: Wed, 11 Mar 2026 11:14:37 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Page_Reclam?=
 =?UTF-8?Q?ation_Fixes_=28rev5=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260305171546.67691-5-brian3.nguyen@intel.com>
 <177294802851.330502.4629589411295974014@a3b018990fe9>
Content-Language: en-US
From: "Nguyen, Brian" <brian3.nguyen@intel.com>
In-Reply-To: <177294802851.330502.4629589411295974014@a3b018990fe9>
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To SA1PR11MB8839.namprd11.prod.outlook.com
 (2603:10b6:806:467::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8839:EE_|DS4PPFC77662F02:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c63e1ce-6345-47a2-cdbb-08de7f9a0f22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|13003099007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: iVbT8DaZ8dOzbpsVdnua6Wo9DxlBhtdn7cQc5C+0WAVIpaO80weZumjwxZGFB9YhnKC6P4gkl1znYqeF6Qh1PkQ7i9brFgVkxd3zokV/DdgfHSE6jBue30SopFI5lpMNDctPk7aHLD59FrmamfDTQyetdvDJyTJ67/FT9xKPpRzxTthvKxavKrSy/pRuuCg4xdSL9eayDNxEtwYfbhxiZIVfC8FRj+eLjt8cYvJx5muvpRdeZuGOOikDhBIp6C5r9ek8tEwB0XKJ6su+eds0fOWamJ2v+eSrNC1VpT0WZdyrkdUpkcegocjWOH9OTiGQ+u5zXtFtqe8bRhOXVJQiqKVowaLdb9KZFYDlvGrMrW/Smi6Uf0X8DAZhBbcPpzmOiQ1BnIKjfkZprcBZO6S6k0AU3V0OflZXuJFqAEf8/Z9GWX8SGrFxQyCJiSoy7MDz0FJRquELW16U+gGgUUJhBDhYmSNJ2wdtLkIlpZPxfINAVkHRb2tPl42PF3aBwBRVxZkeZNTb7uHv8wF2oJC0/9Fb1EG+OghYO0bqPORE66XNULQan7MiibIpd4/P2t45+oXMK9IJSpTt+MVFk3cKXVIQWmO0ZYCKGl3OfqwZPvDrd9sWDO7+BfxbHAxwIgGM+Fpu83FU8/yQfeq/SvgB+cnXoy3EKylhY7CVbYgTl4fBciZhEBSZdOiN7osY5tpz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVIrdUxNYnkxNGFsNUtwWWtaNTAwVElPeXYveW1ySGtSck0reWlCMFRqbWpE?=
 =?utf-8?B?blhMaG11Ny8yWXdZK3FMQ0Y0ekptTmVPVTdTejR5QkxUSDRmbjJ2V1NIUzNa?=
 =?utf-8?B?elAxRm9XOFA3RmMwUm9aS1pIZ1hBOXBRb0NDdWI2eU8vZExpaS9DS1p1RDR1?=
 =?utf-8?B?ZUlneE5KV3NFdnJaeEVuZkVNWVRyeEd2ZzBEQUwvSUpFcCtGZlEwc2plSzUz?=
 =?utf-8?B?Um9FTjdMM21VbkgrRDcySGZ2WlNacXFBV3Njcm9mMkZaMkd5aXpwWHk5MXFm?=
 =?utf-8?B?TTdVdVlqbTZOMzdPbk1sYlk2c3ZwQU9ReWJ4cGU4aTB3WDZzN2JRZlNUcGto?=
 =?utf-8?B?ZFlxVklEaU5nY3ZjR2xTWHFiZjIzUnhoTUYzWklXbXBxS0JaOUpyMmxXVjgz?=
 =?utf-8?B?T2t0UFZzNENaaUl6K3lYZzZ0b1dYbERodVJXSTYxa2ZjVm1KRFIvQUt0RE50?=
 =?utf-8?B?OVlzRFVmSlpiLzE1RUVtSlZiRkIrY2kxWjUrSkIyYWg3OE01UEtIMnZDdUxE?=
 =?utf-8?B?b3R2ck80akRXRGxtaFFNbC9KSC9QQ0gwdHN3eEc2dWk4MWx3YkJEZTM2c0pZ?=
 =?utf-8?B?NERQZ1VWQU9ORCtjdkFjUnp4K3c0emZWQVh3UjFtb0UwVFp4aDN5ZUx3ZjJP?=
 =?utf-8?B?TFArY2g3QVZQZHVkeVk3aUZPUmc0WnNicm92YU0xaFhySiswWXFrWkJOMWQx?=
 =?utf-8?B?eXZXUmRIc3pENzFHRWVIcjEzdGtXNCtYc0lHMlRDdkhSWWRESmdPR0Jid2NN?=
 =?utf-8?B?Wjc4ZlZXSmVIN1A3c25oWDFGTXVsd0hJc056ZGpLSWZ3V1RCcG9RNjRrV1A2?=
 =?utf-8?B?cHk5Tm5kbWY2NlkrWlJKUlkrS2czUmx0ZThWWEVlNkwxSHk5NDlLVlBsM0xR?=
 =?utf-8?B?aDRJMGdLTjY3aEJWZVN2VDltd3lUNkFmdjdtQXMxV1FVT1RQMUI1M0MwRVR6?=
 =?utf-8?B?K1ZhMWtuZTVpeUhtcC9DN21LTlJzbmpHVU5NRitjaUZDWElpSU5Zdk41Nk9i?=
 =?utf-8?B?RXdxblE4c2VuWTV4cUtxa0lCSXZmNmZrWTlTNVlDVW1teDFPODl3by8zMFBn?=
 =?utf-8?B?azFLSFkzWHM5MHZMbzh2LzFBSDd5aFJ4bHdBRGdKbTRsR1JSZ1c5ZjZ5NHoy?=
 =?utf-8?B?OFQvQ0cyVW5YcDQwZU03Tm5rOVZyQVZQTHpwcFlQTFo4czJEYk54QXl5SlFn?=
 =?utf-8?B?T2M2a2pXOHg1Q2ZObm5EYiswYzZoUEplVEhBQ1ZncElvNlNadlQxMmlwQitn?=
 =?utf-8?B?Z1dXNHlJMFpnb2t6aFY3UnZvR3ltUWExRVF0VTRiRWhNZXNTdU85cThIaW5H?=
 =?utf-8?B?NXZ1RWlrUzd2QmQ4RmI0Uys2QW9qQmRrdG9nTkErR2txb0pQdXN5Z3cxa25p?=
 =?utf-8?B?aEN3Nmo1WWI0dWhlZGZUcWU3cnRYN2pZU2ZoTTVWMXVnTkhxOUdYWDMzeTR4?=
 =?utf-8?B?cml4R3lka2pBNWVTVlBLaVpNSno1L0RSU0k5ak05OHIrNERyeTN3cjlWRUIz?=
 =?utf-8?B?SlZiK0x2ZVVZbHZ5NTZ5d0tCR2lvZW00MS9LY1ZOektEbmpnQkYzZkRlMFdF?=
 =?utf-8?B?NlJlRHprZGhTRVF3MHAwbUZ2WTRjeFhxMFlmZDFjQ2IzWlR6ZUpVQytOTDBD?=
 =?utf-8?B?NkxTM3J1THg2WlhsaGtvOXQyam9PWU9qYW1yZjZaUUwwbHVTWE5MTldEejVP?=
 =?utf-8?B?Yk0wd0VIekFWRU4yWVErSTYzMGlEV2M5MTVRbkxySG1KNjNIU2E2YklSd2Vu?=
 =?utf-8?B?L3JBTzdzdU5HYXBFWFBhTFJ3dDdGN1k3aHdwR29UenZNc1g2RTBXclJsQUNU?=
 =?utf-8?B?TTlRU3RPbW1oekpGVDIzYVZKb3BnZU1tY0FMaCthWVZWdkI0bmw2NS9JcWha?=
 =?utf-8?B?ci8vWlQ2KzArczJHM3ZVbzNOOXdrMTVvZkVpQm1UUGxXYkJTOHYzV1BDQTFz?=
 =?utf-8?B?Vml2N1VGa2VIMGxjWFg0N3ZXancrWlVWSVVuaXg4WGd6YmRuejZGc2JWUHJN?=
 =?utf-8?B?Q0RZV2xwengrTmc1Q1UvVEVCRmZKN0d0UHlwYUtxUk5DZmpERjZPTW5sVS8w?=
 =?utf-8?B?VzlzYUJJcG1MbDBpb0hOM1NiYUM5VDMvSEc1bzVteHlBVUhIejFZbWg2TDFG?=
 =?utf-8?B?emkzbCt5c1RnZ25IUGx6RS9KUXZ6VitVV2hZVTBtcDJmNjkwSVhSOEtDKzJJ?=
 =?utf-8?B?dlAza3JzYTBZTGIzeGtCQ2JDc0oweVdzeE1CZU9GdlB1TVZic1VHM1hnenBW?=
 =?utf-8?B?cGVZeUQ3RjRDOVQyQldFMzg3OGZYUzVUcjFxbk9rSVo3Y2RlaWdqeVhBUFky?=
 =?utf-8?B?b0Vpc29zUXdsTEZybVFsZk5hMFRzbERmaUJzbjRXYUo0UVB2cTczdz09?=
X-Exchange-RoutingPolicyChecked: NeKA8KGwopmlhlVf/GUCUqVn3cjBXjPScVrhPjQT+B3Y37MWjg56NQ8XJPWAX1rJl3e1usajv0/QiBK12lEVpytM0qJBeobKkc7oBnJQ2+xqkZdNvlZGEJQKGPWjGuCcDUZ+CgN1+aCvNhHp0QGmjPk8r21vXW7jaUcn3s9+k0zcpDplGv0vK5L/KcVYQx5vLwx4qgPWBfaBzNirPwd49uyB9CYwpvXE+G91iib+Hv6cAS05znxInjmrg2tauXdIQsncDGB56Ui38XmuE4hFNDFEBxp5YQxHVvzV8leVrw7TIOn6yw4HKE8bRAhVXYTiNItdNvjeVeW7Zf30iMSezA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c63e1ce-6345-47a2-cdbb-08de7f9a0f22
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:14:39.0668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RX5bUQMI5MDpVZtqwQAz1STAbv2t7l2H6G2yDhJad9CGH0isLDy18YaN+09m2+g/O2tUlnHR7iCPNDgBQgP5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFC77662F02
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

--------------rS9t8kKdq0u3zwEIzhcJii1Q
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 3/7/2026 9:33 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Page Reclamation Fixes (rev5)
> *URL:* 	https://patchwork.freedesktop.org/series/162258/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/index.html
>
>
>   CI Bug Log - changes from
>   xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL ->
>   xe-pw-162258v5_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-162258v5_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-162258v5_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-162258v5_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-5/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/shard-bmg-1/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html>
>         +1 other test incomplete
>
Failure is unrelated to the patch series changes. CI looks healthy for 
this patch series.
--------------rS9t8kKdq0u3zwEIzhcJii1Q
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/7/2026 9:33 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:177294802851.330502.4629589411295974014@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Page Reclamation Fixes (rev5)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/162258/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/162258/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL -&gt;
        xe-pw-162258v5_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-162258v5_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-162258v5_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-162258v5_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-5/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162258v5/shard-bmg-1/igt@kms_cursor_crc@cursor-dpms@pipe-a-dp-2.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    Failure is unrelated to the patch series changes. CI looks healthy
    for this patch series.
  </body>
</html>

--------------rS9t8kKdq0u3zwEIzhcJii1Q--
