Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F4CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 08:10:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9BE10F484;
	Fri, 15 May 2026 08:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dj4/MfzH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B010F477
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 08:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778832654; x=1810368654;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=3qre58I/j4E/e9pDJ0q+24k24Z5INSMtYWRB6Pc30EQ=;
 b=dj4/MfzHTfC3YMVZbr3DCrtZo5OsaYEYB3aiV4JXf3ENxWHKB9/Kbxu/
 jD+Ib1lLLYTgRQqxkW2+rXbHb0pNUfu9h8jG9OUxxeV9ldMeVpPUKPoHa
 uIZTB6zUeePAEjqof3liwjE3ibzhHqIHiom/eaNZbsInETiO7xndPPAc5
 E+1vNhA2tAxSZ8vyB5HbSGbEvhYgMe15YnN9VkLienmlwr2/P1xazL5YV
 VOe3fKVxa3Qfd1Gi9qK8NbsEOmcgwVAUyugpmuGxZxOkB20PYBSxAhQ3k
 2J8oyE3idKH5sQAftoj/GdMWMaZkJDEG/PjlGrD4b/X3c/TH+8l7nNt2f w==;
X-CSE-ConnectionGUID: c0+h/vMjRDOoX+YjTOrggQ==
X-CSE-MsgGUID: 4XGHXDi7S/GfD8y5M2NPJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="82353478"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208,217";a="82353478"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:10:53 -0700
X-CSE-ConnectionGUID: hdtdZNPwSRaz4I5plqY4Zg==
X-CSE-MsgGUID: tdNhNRc2Slu5g6cmFNGrgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
 d="scan'208,217";a="268974879"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:10:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:10:52 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 01:10:52 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.22) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:10:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrjjflFvtZNxw5iLmUHIYNmIULwPN2awcsGb0W6m5uMFee298UQWH9QDmQojaEmb3U1USdLrhNSVhTmNhBaf2Zjgq/iV+UbVqZXMq+dO46QSQbnyaKvPg1nkuyLvvKdPTZJpr2DcwGKNzbbE+3oeDKBuDFACltagjldpZS1GdRw3W7TDbEn2IvZjUpJ38cbx4SxmkFFfhoT3cRLzNBAQj8KWYF6/nW5HrXwdTa2pNa37UWElk3fO8ro3S9CS3qOkQmWAN6UA6jZu6NHn0hATX2VgHZwGwhyRfOwgt/MhlUJyeQmu2dqI0EITyvQ4uxo8eGfR9wprCHTS7PtoRTPJOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FlMzBDzId5D13j1je2ZBd67DMaTFBRnfah2181bk0I=;
 b=fo91Wyp3uKuMMum/ZmvXQnROILB1HoVuPGUD9cZzkFHlF84PR76eb1AvNLktalepPbJBQRmL9uZrXNxhG6Y19imiUT5sKVVSvloBlQkUJ0XmRVhQPjqasyg7enAzbNGwqBn41RinWAVaA6ZtEqmVIYqRdf+bc67gDoNkkCoqRKQXfs9rSz8z/k/trQCag0DTbd56zS8Hj5Z8nXHY1wLlffAA1Z6uDdE7CRNSKLpYbtfy+81Ikd2t6IopdLfz9WzzBC39oMfL9/LMpZNPKFkeK1JvkRgeY8VsU0I4pA5fhO+f8HvpxYGNpKMVYNTrBW1txtWjniUyWGLQ7AFqW5hKFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH7PR11MB7026.namprd11.prod.outlook.com (2603:10b6:510:209::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:10:49 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:10:49 +0000
Content-Type: multipart/alternative;
 boundary="------------6zTO18DzjI4CmUZZReOrpm2R"
Message-ID: <5a19f206-3e68-4c24-bc18-c014123a0fc2@intel.com>
Date: Fri, 15 May 2026 13:40:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/14] drm/xe/xe_ras: Handle uncorrectable SoC Internal
 errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-24-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-24-riana.tauro@intel.com>
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH7PR11MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4945b2-ac34-4a2e-79df-08deb259793a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|4143699003|18002099003|22082099003|8096899003|56012099003;
X-Microsoft-Antispam-Message-Info: MGAS6wMbJxlbykxSF61EENxPZkb730ngHepDgXhrhhmuFZul4u8q//e/NqyFMAT56haNnK6tI9nwlxx6vK/DO9TUhtDn8nuqgiqfXAvPIpzD2sMaBSSCzQe0yZp7ttmX4Yx00y8TeiwiENEdnreNafHbrSETdHpXUE4pkr+U7ikQ4tDXYlhuJl/ZrxTOvKjGLNamXeJRgqhHbtet2brjGLHFcPf3C32S9ps8m/AvYeuVx/Onryk0I/5kzCmTDEwBzKm20hjV7q7G1VhwGC+Xu+/r9cah9hcqv4IpROxGS/wPjqNDigQVFBpses+DDX27qWUMpNFdPOh0oXFZHT37Wx/jfoGhO/kPF2FgwUftwNEs97WCJn63a2uOh6fBiRlSZSeG/vn968wH6dINhYUF+EP29L+mMhfKmCcX8dYbkMERtZr6Ac+OxWJPwepI82q8akHzoAV4TnhQgML2KrvfC6w7FCpN1kkQJGS4fr5WuB5t5KPwbZcDnC5y0clf23P8SXM50vO08cGV/hRr9PKTsuXZ0AWa9gwXD6lsMBGTpajuqxqHcenlbkkGj4Yxj4G3+C/afARxXPVFnniZO2vkgZpJ0WUDeLxzwm8Qa6njgBmIUCazdmRnFDVSq+UBSkReLX5I8fCvT0kq/ghboxaXX/SpyxIQ/uHclE2YF9ekHxs0QkAG8vGPy5tPcZ84dCFk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(18002099003)(22082099003)(8096899003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXZYbU5nTnFRbHZQNXFjZ1NtaWNBYklWVk9tQXo0c0tTaTZ2NHFmczBBdC90?=
 =?utf-8?B?b1ZmbzhGU3hHR0VzMkRTdkxWRVA3eFZWM2lsV1BUS2UrS3R4WktXL0VpcUVa?=
 =?utf-8?B?L1Z2V2lHQytkVVlwTHlhWjJRUlZXSnlwY1pkOWRFYVJjWnlEYjgrRFJJUEtT?=
 =?utf-8?B?WmZxNXlkL3Zxb3AxU3VrUUkyNFdMMkNrMG0rblAwLzcyQjlGNExRYklRaVhr?=
 =?utf-8?B?aHREK0c4bGN4M1BYSkx1Tjh4WEJTZDVSazJpRGlYSTJhUGNDT3JIdUdhc0Y3?=
 =?utf-8?B?dlJ6L00zb2RIMS9XS1VkRk8vRzk5RFI3K0JDT01jeWVQNzlKbWhOckl1MEdJ?=
 =?utf-8?B?NHY1VjA2NlBQNkcwaGVDazJseTVIaHZKd0w5NEtMQjc5eFZUeXF2QS8vZ0FI?=
 =?utf-8?B?bjJUQnd6TjMzTmxBMzY0cUNpek1MbUx2WUs4UmlqcmozNDkzUS9JeklXTjg3?=
 =?utf-8?B?QUpwL3FMYmI4UUZzRzgvNHdPVWJac3lxcUdBTXFZMGtRRHhyVlJsYmI1MXhn?=
 =?utf-8?B?MVczTGdkam1nM2I3Zm43NE1VblNZT0ZjRlR5WStjb3lGaThXdmRjbHFoN3k4?=
 =?utf-8?B?NVZFNnZEb0JsbTQvTVZYWFRpdEtXSFV5RE1XSGcwdjk0cEFFQi9iN2ZUTmpB?=
 =?utf-8?B?NitUN3g1R2FqMUdMbHR3OUN2eVRNQnVCTVhHWWtQeWhLbzZhanI2c0pZWE9v?=
 =?utf-8?B?WlI5MmpNWjZkUGRSanY3dEgrM0ppNjlibmlaSnJ2dGFOUkJhbHM5OThyM1Rt?=
 =?utf-8?B?eUZzNUpXZk9qZU8raFhVUWJwQVZUNEpkTS9UbVZNOTJoREFmTTlHTkVsMURk?=
 =?utf-8?B?OCtRcGNZNUJaLy94STB3UGMrN3hCYnFwcC9mREI1KzBlNmloS3hYaklMdm9L?=
 =?utf-8?B?bE9FMU13dkdCaDdTYWtpaENjRlhzZUNZbjlJM0w4L3ozZGh2d0Y4OGRYRFZq?=
 =?utf-8?B?THFjV1E2UkdwTGZaS2wwaklmV0Z5Mk1JSUl5YmRuZ0svS3VGYU5lU3ZNZk1U?=
 =?utf-8?B?QnhYV0xCNGJQUjByYlg5QVYyVEM2UGdlaGlTenAwdnE2bnVLVTNsaDNWaDJT?=
 =?utf-8?B?Q3MwbUxjUUNYZ2oyUlJFRldJeW55aFBJVldvampIcko1L2IrbzhRSmtTSXVo?=
 =?utf-8?B?NjIwL2tRcWt1ajNZTW40b1RHemdRcVBSZEhyWGpaUTU1TjlkZHhiS011R2JU?=
 =?utf-8?B?WmQvM0RpT29JRTRjVU1lWkZiMXpmeXNCckdoZzZnTDlzTlFtMGh2bVNPY09E?=
 =?utf-8?B?VnNrWWM0Q1k2NnZvcC85U2NFTHRNc1VpYTkwalQvYkVmcXZBek9qY0R3MUxR?=
 =?utf-8?B?cmxaejNqa1NaY2dUdThoVkl0UzV0cXRzdTNBWklybTI0SEJGQjRPZlZ5QUNn?=
 =?utf-8?B?bnRtWFRkeVBOMmJTSSs0a2M5eEdtTFlERWM5OGYxRHVmdWVYSTNXb0tkeU1o?=
 =?utf-8?B?UHFSY1B6enNObEcyYnZoL01keGRwSkpWTC9iNVRyRG5BcmZlOS9NUUczNjRK?=
 =?utf-8?B?dCt3aDBjL2JxdXEyTXVJK0UvNDdSNDM5clhhZkpwZmhKTVNYNVlMd1hsZUJL?=
 =?utf-8?B?ZFppWFJlcE1rWlFBKzQ2TTFkWXEwYjlUaTFjK0VXYkpQV2VwdWlwZk04QVhD?=
 =?utf-8?B?TU1pVVFYSkNIRGVXM3ZJVCtudXYzRnRlektVb0oyREZ1U0cxOUQwcHlqcGtR?=
 =?utf-8?B?dG81T3hqWnF1cFphcUpDbklEMXkzTi8xdUhidTE0M1BNZzRGVmtwaVYyek5y?=
 =?utf-8?B?NzdwZ3pJK0RNbS9DRU9NOEZhTWRwdGJ0RUlQMTFqcmM1OWRGMk5pOExCZyt0?=
 =?utf-8?B?UmVDZE8rSkJ5bk4xb2dLNnFXcVBRdDM5RUVPYUdmN0Rsd3ozeTh3eXZVbUZE?=
 =?utf-8?B?YkJxUU9Qc0NKVVlqU1lGSXFLSVRBUjVvQ0RETzVZb1JnUTFFNFVmYzduWXM5?=
 =?utf-8?B?SFJOM1FuSU84UjB4OG55Z3piQ2pqWlFGVis2MWJkSU1ZZ3JPMjVqUnd2cHJO?=
 =?utf-8?B?dVBzUEpwV2JWaGtiRGlmaG0wZ1VlaUFGejhYWnI0SGZXSGtRaVlEckNucGts?=
 =?utf-8?B?YkpVeGVQUitsQUFvOXExOXZ5bEZSb2ZicW4zRk9TMFZrYThvZ2hKOU05VFls?=
 =?utf-8?B?SkVVbHNta1BHUVFoZExKL3owSGlwN0szUVh4R3FtZGgyMXhDb2pGWTdweGZu?=
 =?utf-8?B?TDQ0WitBUmtzMGdzVGI2K1NvS0RWeFR1V01QSWM3eUVIZHBqV3pDenJTNGZq?=
 =?utf-8?B?azIxY1lYWm1KdVJPaHJYU3hIL05oK0RRcVIvZkVGb2IxNVluMjN4bURaQjdi?=
 =?utf-8?B?dFhwTVhWZVJ2YWhtcDhOcnFRaXR0THZFZ2lTTDR4eFp0Tml2N3FsMFpGUi9N?=
 =?utf-8?Q?1hMijPAmmAlESwUc=3D?=
X-Exchange-RoutingPolicyChecked: GQEY/NPRKYo2Z3DJ+NM8MPzT8gKDeYiFzjvvzXn9e4GBX1MJNGk3g0t/K/zh7md6PbDQOOMGuN+/NVvLm26Ql5HJow9eWDLInNWWV3HVs4m317uhyEWmga4aU+h4YCkwClAVsmDlINusTdCtKtsvYQldPWMJYtJzE9+pVTmW6SwUBHATuq/n5zFgqktnGvJWzG2cjYVfQpHU0A1SjIB1XIkCqH3orAkT07pMOLFk8uqas7ZBLvFJKmFV3fDWJBL9o+vrvkvWuR2QksXBwd5Yy6jXSyA6fksAyckRxSsFZAkVNCoeBCbAle4BjXDKM8PZ16Ob6+8VyaI5gU3pXOa1vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4945b2-ac34-4a2e-79df-08deb259793a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:10:49.2683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HTSCoBbMd4wYCEJIH5JQoM+8Pvt2mf+aVvdjslqNn0bqHKnsgN5udImJsJ0gjCCaiTidGQqNCulVtalLfI/CjkIRfuBXzmzhXhFYpgvsCuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7026
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

--------------6zTO18DzjI4CmUZZReOrpm2R
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Riana,

On 11-05-2026 10:59 pm, Riana Tauro wrote:
> Some critical errors such as CSC firmware and Punit are reported under SoC
> internal errors and require special handling.
>
> CSC errors are classified into hardware errors and firmware errors.
> Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
> firmware errors are critical and require a firmware flash. On such errors,
> device is wedged and runtime survivability mode will be enabled to notify
> userspace that a firmware flash is required.
>
> PUNIT uncorrectable errors can only be recovered through a cold reset.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: simplify soc structures
>      return error code for each SoC error (Mallesh)
>
> v3: squash patches (Raag)
>
> v4: re-use csc work
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 53 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h | 50 +++++++++++++++++++++++++++++
>   2 files changed, 103 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index ecadad5857b2..0d4e2116ef61 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -103,6 +103,56 @@ static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
> +							      struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr->error_details;
> +	struct xe_ras_soc_error_source *source = &error_info->error_source;
> +	struct xe_ras_error_class *error_class = &arr->error_class;
> +	u8 tile_id = error_class->product.unit.tile;
> +	struct xe_tile *tile;
> +
> +	if (tile_id >= xe->info.tile_count) {
> +		xe_err(xe, "sysctrl: SOC internal error reported from invalid tile %u\n", tile_id);
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +	}
> +
> +	tile = &xe->tiles[tile_id];
> +
> +	if (source->csc) {
> +		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info->additional_details;
> +
> +		/*
> +		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
> +		 * CSC firmware errors are critical errors that can be recovered only by firmware
> +		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
> +		 * the bit in the capability register. On receiving this error, the driver enables
> +		 * runtime survivability mode which notifies userspace that a firmware update
> +		 * is required.
> +		 */
> +		if (csc_error->hec_uncorr_fw_err_dw0) {
> +			xe_err(xe, "[RAS]: CSC %s detected: 0x%x\n",
> +			       sev_to_str(error_class->common.severity),
> +			       csc_error->hec_uncorr_fw_err_dw0);
> +			schedule_work(&tile->csc_hw_error_work);

Potential race condition: If the PCI device is removed (after 
disconnect) while csc_hw_error_work is still queued, the work might run 
after the device is gone, causing a crash right?

> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}

We need to check and log hec_uncorr_err_status as well.

Thanks,

-/Mallesh

> +	} else if (source->ieh) {
> +		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info->additional_details;
> +
> +		if (ieh_error->global_error_status & XE_RAS_SOC_IEH_PUNIT) {
> +			xe_err(xe, "[RAS]: PUNIT %s detected: 0x%x\n",
> +			       sev_to_str(error_class->common.severity),
> +			       ieh_error->global_error_status);
> +			/* TODO: Add PUNIT error handling */
> +			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
> +		}
> +	}
> +
> +	/* For other SOC internal errors, request a reset as recovery mechanism */
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -193,6 +243,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_CORE_COMPUTE:
>   				action = handle_core_compute_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_SOC_INTERNAL:
> +				action = handle_soc_internal_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index e97026fd6ff9..c5a283317d90 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -10,6 +10,7 @@
>   
>   #define XE_RAS_NUM_ERROR_ARR			3
>   #define XE_RAS_NUM_COUNTERS			16
> +#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
>   
>   /**
>    * enum xe_ras_recovery_action - RAS recovery actions
> @@ -125,4 +126,53 @@ struct xe_ras_compute_error {
>   	u32 reserved[15];
>   } __packed;
>   
> +/**
> + * struct xe_ras_soc_error_source - Source of SoC error
> + */
> +struct xe_ras_soc_error_source {
> +	/** @csc: CSC */
> +	u32 csc:1;
> +	/** @ieh: IEH (Integrated Error Handler) */
> +	u32 ieh:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +} __packed;
> +
> +/**
> + * struct xe_ras_soc_error - Error details of SoC internal error
> + */
> +struct xe_ras_soc_error {
> +	/** @error_source: Error source */
> +	struct xe_ras_soc_error_source error_source;
> +	/** @additional_details: Additional details */
> +	u32 additional_details[15];
> +} __packed;
> +
> +/**
> + * struct xe_ras_csc_error - CSC error details
> + */
> +struct xe_ras_csc_error {
> +	/** @hec_uncorr_err_status: CSC hardware error status */
> +	u32 hec_uncorr_err_status;
> +	/** @hec_uncorr_fw_err_dw0: CSC firmware error */
> +	u32 hec_uncorr_fw_err_dw0;
> +} __packed;
> +
> +/**
> + * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) error details
> + */
> +struct xe_ras_ieh_error {
> +	/** @ieh_instance: IEH instance */
> +	u32 ieh_instance:2;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:30;
> +	/** @global_error_status: Global error status */
> +	u32 global_error_status;
> +	/** @local_error_status: Local error status */
> +	u32 local_error_status;
> +	/** @gerr_mask: Global error mask */
> +	u32 gerr_mask;
> +	/** @additional_info: Additional information */
> +	u32 additional_info[10];
> +} __packed;
>   #endif
--------------6zTO18DzjI4CmUZZReOrpm2R
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Riana,</p>
    <div class="moz-cite-prefix">On 11-05-2026 10:59 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260511172908.1122252-24-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Some critical errors such as CSC firmware and Punit are reported under SoC
internal errors and require special handling.

CSC errors are classified into hardware errors and firmware errors.
Hardware errors can be recovered using a SBR (Secondary Bus Reset) whereas
firmware errors are critical and require a firmware flash. On such errors,
device is wedged and runtime survivability mode will be enabled to notify
userspace that a firmware flash is required.

PUNIT uncorrectable errors can only be recovered through a cold reset.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: simplify soc structures
    return error code for each SoC error (Mallesh)

v3: squash patches (Raag)

v4: re-use csc work 
---
 drivers/gpu/drm/xe/xe_ras.c       | 53 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras_types.h | 50 +++++++++++++++++++++++++++++
 2 files changed, 103 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index ecadad5857b2..0d4e2116ef61 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -103,6 +103,56 @@ static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *
 	return XE_RAS_RECOVERY_ACTION_RECOVERED;
 }
 
+static enum xe_ras_recovery_action handle_soc_internal_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_soc_error *error_info = (struct xe_ras_soc_error *)arr-&gt;error_details;
+	struct xe_ras_soc_error_source *source = &amp;error_info-&gt;error_source;
+	struct xe_ras_error_class *error_class = &amp;arr-&gt;error_class;
+	u8 tile_id = error_class-&gt;product.unit.tile;
+	struct xe_tile *tile;
+
+	if (tile_id &gt;= xe-&gt;info.tile_count) {
+		xe_err(xe, &quot;sysctrl: SOC internal error reported from invalid tile %u\n&quot;, tile_id);
+		return XE_RAS_RECOVERY_ACTION_RESET;
+	}
+
+	tile = &amp;xe-&gt;tiles[tile_id];
+
+	if (source-&gt;csc) {
+		struct xe_ras_csc_error *csc_error = (struct xe_ras_csc_error *)error_info-&gt;additional_details;
+
+		/*
+		 * CSC uncorrectable errors are classified as hardware errors and firmware errors.
+		 * CSC firmware errors are critical errors that can be recovered only by firmware
+		 * update via SPI driver. On a CSC firmware error, PCODE enables FDO mode and sets
+		 * the bit in the capability register. On receiving this error, the driver enables
+		 * runtime survivability mode which notifies userspace that a firmware update
+		 * is required.
+		 */
+		if (csc_error-&gt;hec_uncorr_fw_err_dw0) {
+			xe_err(xe, &quot;[RAS]: CSC %s detected: 0x%x\n&quot;,
+			       sev_to_str(error_class-&gt;common.severity),
+			       csc_error-&gt;hec_uncorr_fw_err_dw0);
+			schedule_work(&amp;tile-&gt;csc_hw_error_work);</pre>
    </blockquote>
    <p>Potential race condition: If the PCI device is removed (after
      disconnect) while csc_hw_error_work is still queued, the work
      might run after the device is gone, causing a crash right?</p>
    <blockquote type="cite" cite="mid:20260511172908.1122252-24-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}</pre>
    </blockquote>
    <p>We need to check and log&nbsp;<span style="white-space: pre-wrap">hec_uncorr_err_status as well.</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">-/Mallesh</span></p>
    <blockquote type="cite" cite="mid:20260511172908.1122252-24-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	} else if (source-&gt;ieh) {
+		struct xe_ras_ieh_error *ieh_error = (struct xe_ras_ieh_error *)error_info-&gt;additional_details;
+
+		if (ieh_error-&gt;global_error_status &amp; XE_RAS_SOC_IEH_PUNIT) {
+			xe_err(xe, &quot;[RAS]: PUNIT %s detected: 0x%x\n&quot;,
+			       sev_to_str(error_class-&gt;common.severity),
+			       ieh_error-&gt;global_error_status);
+			/* TODO: Add PUNIT error handling */
+			return XE_RAS_RECOVERY_ACTION_DISCONNECT;
+		}
+	}
+
+	/* For other SOC internal errors, request a reset as recovery mechanism */
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -193,6 +243,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
 			case XE_RAS_COMP_CORE_COMPUTE:
 				action = handle_core_compute_errors(xe, arr);
 				break;
+			case XE_RAS_COMP_SOC_INTERNAL:
+				action = handle_soc_internal_errors(xe, arr);
+				break;
 			default:
 				/* For any other component, reset */
 				action = XE_RAS_RECOVERY_ACTION_RESET;
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index e97026fd6ff9..c5a283317d90 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -10,6 +10,7 @@
 
 #define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
+#define XE_RAS_SOC_IEH_PUNIT			BIT(1)
 
 /**
  * enum xe_ras_recovery_action - RAS recovery actions
@@ -125,4 +126,53 @@ struct xe_ras_compute_error {
 	u32 reserved[15];
 } __packed;
 
+/**
+ * struct xe_ras_soc_error_source - Source of SoC error
+ */
+struct xe_ras_soc_error_source {
+	/** @csc: CSC */
+	u32 csc:1;
+	/** @ieh: IEH (Integrated Error Handler) */
+	u32 ieh:1;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+} __packed;
+
+/**
+ * struct xe_ras_soc_error - Error details of SoC internal error
+ */
+struct xe_ras_soc_error {
+	/** @error_source: Error source */
+	struct xe_ras_soc_error_source error_source;
+	/** @additional_details: Additional details */
+	u32 additional_details[15];
+} __packed;
+
+/**
+ * struct xe_ras_csc_error - CSC error details
+ */
+struct xe_ras_csc_error {
+	/** @hec_uncorr_err_status: CSC hardware error status */
+	u32 hec_uncorr_err_status;
+	/** @hec_uncorr_fw_err_dw0: CSC firmware error */
+	u32 hec_uncorr_fw_err_dw0;
+} __packed;
+
+/**
+ * struct xe_ras_ieh_error - SoC IEH (Integrated Error Handler) error details
+ */
+struct xe_ras_ieh_error {
+	/** @ieh_instance: IEH instance */
+	u32 ieh_instance:2;
+	/** @reserved: Reserved for future use */
+	u32 reserved:30;
+	/** @global_error_status: Global error status */
+	u32 global_error_status;
+	/** @local_error_status: Local error status */
+	u32 local_error_status;
+	/** @gerr_mask: Global error mask */
+	u32 gerr_mask;
+	/** @additional_info: Additional information */
+	u32 additional_info[10];
+} __packed;
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------6zTO18DzjI4CmUZZReOrpm2R--
