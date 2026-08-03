Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A6BC55179
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 13:44:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7906110E676;
	Mon,  3 Aug 2026 13:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iI2+ix8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6A4C10E676
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 13:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785764656; x=1817300656;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/LZJxJeMAeagA3fACMqHz/8qnnkBo0X+MwJaOkJnkDo=;
 b=iI2+ix8h1eekRt2aCdg4BwSttC+L7ooUKkPxu12icVaDSAJrUdXBFbs+
 H8qy99jOzhtZ81xx16FPvKwWuGwp8MxkVyf9DRBN/4mRO5SjeAUxc3v9d
 olgApaMkx+J6ib3d1ShH9Nu/hlkaT+AJ6+fqhTxvFvBxoQSnY5ez7XNok
 oxprBhMUi5F8UKvvHOdvZXhvL1oybosDTP0vs9J4Z987Zu0lZaG1rmS39
 RxLK82cbpjUNukxUm0U43cC3W/+dJCF9ZfXmGzREPFnCmpxOMsOiC3Fvo
 GzP/alOtydiPSw+gLUq4AiYbd+o8kf6Tngz0suzSBMNv7sr5uIPGm1Ac5 w==;
X-CSE-ConnectionGUID: FfImU/ToQuyuFItadVqA2g==
X-CSE-MsgGUID: egg7FgEQRj2U9kI1cHXxCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="73836246"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="73836246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 06:44:15 -0700
X-CSE-ConnectionGUID: 6cdD1Sn0SUKauh7y8t7NZw==
X-CSE-MsgGUID: sk1MO++3R/uujz5LPkgEDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="257870532"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 06:44:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 06:44:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 06:44:14 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 06:44:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW/JScUFM21m5JWTKzMfeXiECY+OE/kUN0FElNv915mosl8D15ih7QMV11YAYJuCdLr1kan2/I6UOZUvjlEOSbO1D0++PSStRSIIJup3+CpCqYcj+thLAVdcsFGF5L2+uAJ3faSs7TSDmUsSIiEafiszfYm54RnkTuZDXJTj6h6d+bFR/bnRaPF1/pVAo5YOvQJ2XepDrRkXIy+HZtmJs5lvM+CoIQshvIO6zDykYtAiRqZKoJdw53N+mgqhC+D+c3QQ4QCPfs3+/xA8ot1lsfTeYFSnTk+IwiRjLqjXosadtIONw9DtnkS7mDImD/P0XZYr+AyiwliVyp1OE+QSzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dArmja4Cibka+GbpdHH6nTBCGL2HrLI6dNjVblso5YQ=;
 b=C/upotvLo6Fja/acs6e/qlpFhNrNQVn73DUqEDWIFEMhPJ7xsUvUUAQT4Ge9KGOJF9OPwwZLtyWQM7Vs0DJ8KuQCve0WcDHW0lrlLFjMRLZg0avxSVtfrW8ps7GmH1apgOOUdb18gab+MakrnjDun5ZRI4BJGNL4u3vmW1lNyQ9tFzUZib9LJCpNlhtR/u6rBhYTJesyNbz3Nn5V1HyV3VOl1kPRAUYHX6bFg2IfkMWndOAzMC1ryfAKdj1cI5BkrwT/Rcc7fP2EvLYDRB6YOOnq5PEspRyM2JSzvMp5F2Hr6bWsRzwpXKr25TkgnykT0FwV5G9E0k2BrKplQOHqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA2PR11MB5019.namprd11.prod.outlook.com (2603:10b6:806:f8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 13:44:06 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 13:44:05 +0000
Message-ID: <76fdd692-ed09-4316-8ec9-9fb3cd1d3e4c@intel.com>
Date: Mon, 3 Aug 2026 19:13:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/ras: Fix boot-time ras error processing
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>
References: <20260730110635.925537-1-raag.jadav@intel.com>
 <251045b9-5dfc-4450-9a90-b763388d7f0e@intel.com>
 <amyWumq3vnOYJLTf@black.igk.intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <amyWumq3vnOYJLTf@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0087.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA2PR11MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d6dc14-112b-4998-695f-08def165492f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: XyfuBnuOm9qMBvKGoLZNoYjDpzj28B3nTJAK589lFdKZx9mNskhLEFwgNGHxDYup7dDjCFqRm1f+0RsuBCHI9xP/nPcg/HldeC7pcyDFo7fj6vNasYwRhacWVbYKD3KetOujoiTkYDC7vRFuXgtZ9XPvEl4T1uLYM6fskTXuLvF00uC04VCMVX6z8P+mLVJsgsg7ZE+/+vwFWU0UJDzNsl5W/BK7e3BxBGr/6mgnS6Io0oQ270i0LfO8BKRmfpcNCqU6AT2y27DeHfhb2Nzwvimoi6WKa+kcYtpKBrFEUE5cXdo1l3kgoZUT2dngiyjSl5BcjkGOdOV4dh4qVnAoxNWkXWO7I0IEImjp1Glr6lyxFu29JBd8ckXMR6yLywoWB2rHuS5O7gf5t0imBx8hjIH3m8e+o9U5yTwNS2gKM6W5EOcffdvmIsYOOGa4LgnCQbXg7ybGAZ5rdLwidElW9UiLdmSEa7UnCHcaGlk0Favsyxo2Lp8GtZRD9swbjUBTd9dfBkreGAa/AtU6m+C+5Xws6aMzSyqqoAwkGPHLvO9M5QDkdEUJaIz40L3noeiWLRgcCna4hFJXrq+yRLVwnDqOJ7K8L51Ew60ruKk+uI9KQChfVzcDHScHYGXoZCcca5wUojF4WlNVHycAg8GGzZzR+DBCsQ6gMvKeJ0VfmiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1ZRdnRGLzM0NURjb2l3ck53OXA4T2M0WCtaY2FRVEUyTFExakdSNkZJeXY4?=
 =?utf-8?B?ckMwTG5PaGtwVmtQa1VXTHVPOG9UdmRDdmk2d0k5cXZQRG1uaUEzaFJ5S25y?=
 =?utf-8?B?T2tBVlg2QzdBdHhlSkwwcUttNW1rTXdaR0FRMDYyVlRidUtKVmVNZzJkR2RJ?=
 =?utf-8?B?eGRsL29tYnhFbnUxZEdrOUFuODgwdmV4WXFwcWJlOE9UaTRKTlh2Rm93UE5F?=
 =?utf-8?B?Nlo0Z253bVp0dVg1SFRTZEU2ajRzVFNzUE5Md2J4WlhSay95ZFRId1UxWFJP?=
 =?utf-8?B?cnBOTW15K254b0lDYnJXUG1CbG5NU1RjODlwb09HS01xSTAzS0NMNGZBcVE2?=
 =?utf-8?B?cXJZVmRKeVc4R09qTjdEWnB2S1lFZEpQVnhaNmhyZEZOMHdDdlRKV0dxNm1o?=
 =?utf-8?B?bSt2dEErOGFtQVJPdlQ3Z3h2cXRnSllScVhRb055NFZ1Vzd4bUp0TEREeWZu?=
 =?utf-8?B?QStxUVloeFREU1FuODg2Q0wvU0ZiVHJISmhNbjNhclNkMkNVMVRJODdFN0Ux?=
 =?utf-8?B?WE9mK0c5OFNtbkdpclQ3RUt6NUREWk82R2ZxaXdXV2U0cStneGdSWS9pMjIy?=
 =?utf-8?B?Z3l2SUdETWZTeDlKZkJXcXFhYnpiT01PUzJjZHBnNTdHRlZVVlNPOFB1ODdT?=
 =?utf-8?B?NzJDdDZQOVcwU0t1U2ZiMWs1SFAyYWZzd3o4bFl2LzVnUndQdXlNMVplai9u?=
 =?utf-8?B?VXFYUGxtUlUxSHdkYjNHS2xUNjNLRDNKeHZBS2JIZ0h2Rk5VaXg0OTFSazNw?=
 =?utf-8?B?WWpPTldPelEzTGpjd1dWa0UvL0owTHd6UnFaTzJNWlVJaHFRUU9Wc28xc0tu?=
 =?utf-8?B?SlBvYVg5N0tOYmxZMTRGb3cxS25MejEzVE1NemsvaFpOMG5mNStBdnRCdFNH?=
 =?utf-8?B?MmpObWlqa2xSRkc5RHRMY3IwNXlDbnhzQnVaMVB2eDJ3ZEd6YzJVLzhhTHVN?=
 =?utf-8?B?ZzJYVUhMQUUrd3AyRVQrU1FxaDZSbjU4bXljanF1R3pMOFA0dFJtOVdNd29m?=
 =?utf-8?B?VnljVWFPL3BMNlZHdVlWUW9GR0FndkUrQVJUVDY4K2tXaUZsRHlwRTZpL2Rh?=
 =?utf-8?B?dU1oUXU2RktYWFcrYW4wYUJvY2F6aVBmZlFJK0JDMHJQKzVYakVJbFZDa3Az?=
 =?utf-8?B?R2JWTzhnekxxRkF4T3Fwb1QzWEs4RDVsVll0dFluY0pQZUIzdDJGYTZ0WGl6?=
 =?utf-8?B?Si9JMnQ0RG8yMlY5T0R5MzF4NjVqYUNHYTBjdU5nVmJJanFESkVvWTNaRzVu?=
 =?utf-8?B?SG1UZDhlMCtyb05NYkFnMEYwb0JYWW9HdWxaRndIZWtkY3NnRlMvWWRrN0Ni?=
 =?utf-8?B?THN5WHBMN1p2UkhiaU4waDFrZkQ4aHFIWDdDcEt1cWZwK3JSSWo3UnZIM1Rr?=
 =?utf-8?B?eWhZUk85L29RZElZTC83Zzg1MDNEdDJUSlRNa0crTktoQ0d3N29qRnhmSFJB?=
 =?utf-8?B?UXBBSnZpbk9JS0NiTlg4djRpaEpoNXRGdVZTM3crVGlHS1hSQkhwQzZraTND?=
 =?utf-8?B?YVJuUXlsY0JVR2pXLzVIS2NaWmI1NnlvMHNuWDVEVitTcW1rTU9PRkNCM3Nu?=
 =?utf-8?B?WU9CejdMelNyT2IrWE5OQkhPYlZOTzVrUWF5a1BIOXVoeTVocHdVVE8yUGhz?=
 =?utf-8?B?V0VqeXJuQzZvUzQ3WHVGZWhWNVc4R0J1KytIZ2hIZmo0cmZFanZweGJRR1pQ?=
 =?utf-8?B?L1VHSWY5LzRMcERBaFRLdXhQQnFUUklPaHkzTGt3RmNxMmEyTHk0OUo5dFRj?=
 =?utf-8?B?blMvcFhsWW1iY2RaZHRIWTdodEdlNlQ3R0pVTW9mSVZpYTI5ZFo0QlZuTGJ2?=
 =?utf-8?B?Z2ZkWTg1Q3pISU1WT3JURytlMmZFRTEzV3o3VTJZOTRhdFNiN0dTZElxQ1pj?=
 =?utf-8?B?SXZBWkh5a0Q4QkJNTmJQZ3ZNeDluNFIzOGJVZ3RUWkNTMUpyVk1ySTNSaUlQ?=
 =?utf-8?B?enNDZ3JaMkMzNGthZWxWOXJWTFUyRXZOeTViaFpNS3ErcWFzS05NbkxFSWdM?=
 =?utf-8?B?WkV1eVBqWWp1Q3VPTGhhOGNZZW93VXgza284NEtEL2VNU0JpZ0VSZVdQd0ZJ?=
 =?utf-8?B?WHhNTmwzN3JkQ2o3SWlIWWV2UkR0dDFWMExETFQrd2x0Tmp1YXJiRENranU5?=
 =?utf-8?B?OXBjQmdqVzhqUTljN01LUU43Vm1FcVF6dlE5NVFGK3M2eFoxd3RFb21kZGFj?=
 =?utf-8?B?akkvRjNCcHdhNVBYQ1hXWjdpZVdUR1RQdm5Dd0NPTG0zRXpXeWtnZUJZeFU1?=
 =?utf-8?B?TTBad1VsR015allENEk4U3I0VEExdG1mUGE3UndPNEd6R20yK1JDSi9OeUFs?=
 =?utf-8?B?ZmdHeGtOR21CVmV4KzlaSVF2dGs1TjVmdnRwT21nMmhMSGdVQW5CQzZIYjJT?=
 =?utf-8?Q?yGO2CsfA3U4RAJ3k=3D?=
X-Exchange-RoutingPolicyChecked: dbHb0WtsIDry9la0Euxmhjt+Qc/46IldZxOT0Gwv10QLD7Odb0vC4CDaUiJoDU/0nNqENYORnJrMMk567MVmuUB5iM4BQVBd23/r3qJ+jtHR6+lbMXv/JzgiOC0GMVoZ4RCTsixyGF5O5Y9V7Ud16PkvAp1SBgDc5eIXqqpjIlewzWR5i2XhWA9Culw0meHIhUTmnGVEaIY5wznbLixZVt/nyT0W7HOpq9EF9k4k2ggsXtZgJFQmj8ZUQIU1H/3qXmiGOeHevc9ipOFonfXalIjOTTY89PZgP9UlSqhPT9iKxcPVxEEQGlecrpo33vNcXj0tdG8VDOyA4HOhXh1IIA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d6dc14-112b-4998-695f-08def165492f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 13:44:05.7153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: COZwqFpJBDSaVn3mhxSyz3RR905b9jXdhof/gFM2CH1cyembbzFG+z/8Rt5pDaOa/aOZkBZFf6AOPYXY5KvWA/Iw/loW8c4sbwUfW1uAMOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5019
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


On 31-07-2026 06:06 pm, Raag Jadav wrote:
> On Thu, Jul 30, 2026 at 06:56:41PM +0530, Mallesh, Koujalagi wrote:
>> On 30-07-2026 04:36 pm, Raag Jadav wrote:
>>> Currently, we xe_ras_process_errors() inside xe_ras_init() to handle boot
>> Please add we "call" xe_ras_process_errors().
> It's used as a verb ;)
>
>>> time errors. But this can potentially result in declaring the device as
>>> wedged quite early in the driver load sequence, which is problematic due to
>>> the lack of registered drm device or required wedged cleanup hooks at this
>>> point.
>>>
>>> Call xe_ras_process_errors() only after the prerequisites are available.
>>>
>>> Fixes: d9732e498f5f ("drm/xe/xe_ras: Query errors from system controller on probe")
>>> Signed-off-by: Raag Jadav<raag.jadav@intel.com>

Working as per expectation.

Tested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>>> ---
>>>    drivers/gpu/drm/xe/xe_device.c | 6 ++++++
>>>    drivers/gpu/drm/xe/xe_ras.c    | 6 ------
>>>    2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index 03e6177a1d4c..47e1638d2ab3 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -1149,6 +1149,12 @@ int xe_device_probe(struct xe_device *xe)
>>>    	if (err)
>>>    		goto err_unregister_display;
>>> +	/*
>>> +	 * Process and log any errors detected by hardware. Possible results can
>>> +	 * include declaring the device as wedged, which must be done only after
>>> +	 * xe_device_wedged_fini() is registered.
>>> +	 */
>>> +	xe_ras_process_errors(xe);
>> What happens when xe_device_declared_wedged()-->xe_pm_runtime_get_noresume
>> called before xe_pm_init()? Is it good to call xe_ras_process_errors
>>
>> function after xe_pm_init()? any thoughts.
> The usage count will increment regardless, which I guess is what we care
> about?
>
> Raag
>
>>>    	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>>    err_unregister_display:
>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>>> index 28123f08e513..db8bd19ad28b 100644
>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>> @@ -827,12 +827,6 @@ void xe_ras_init(struct xe_device *xe)
>>>    	if (IS_ENABLED(CONFIG_PCIEAER))
>>>    		ras_usp_aer_init(xe);
>>> -	/*
>>> -	 * During probe, process and log any errors detected by firmware while the driver was not
>>> -	 * loaded. Critical errors such as Punit and CSC are reported through Pcode init failure,
>>> -	 * causing the driver to enter survivability mode.
>>> -	 */
>>> -	xe_ras_process_errors(xe);
>>>    	ret = devm_device_add_group(xe->drm.dev, &gpu_health_group);
>>>    	if (ret)
>>>    		xe_err(xe, "Failed to create GPU health sysfs, err=%d\n", ret);
