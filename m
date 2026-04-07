Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDC4EDB7D0
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 23:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9A810E4E0;
	Tue,  7 Apr 2026 23:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ugknc6Te";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E79D10E4E0
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 23:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775603874; x=1807139874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PkVe3+jCnjzxTtqWfbHCiGFuhzJuD6ROhuZjhBmBBso=;
 b=Ugknc6TeZ81QViX4eiO77DhfjYWpofTBH7xCGuqzP3lXtNQFMQdeyWgE
 R1Mx5ZwVVlbVjwOzkoJneNgywOkfbFQaUgELEqQtpWZ7su2HTOgOLyNAX
 OciYLin7LteChvMDoKf089fLPWxYWjbPW6oOCL2YNV/tVAuJPBLn4nmH+
 aUQzwOkjR1UNE0WdzkDbWaqikdfXrBA7vz5eXWoFElwuEtM0dHJE81HX3
 W/WsU5hnnnPAD2+lTFMwnkIdFnXW3BGt4F0Sx2bGuR3wF/GasUTNDwAQU
 ukGw7p3W9yGphG6YUtqYr01vhxeJEHYtSSi+UkmRGKwgdUyicCG2g5t7V w==;
X-CSE-ConnectionGUID: Z2yVMTXuR4msUbq+dT79SA==
X-CSE-MsgGUID: wusKmQNoSim9FzVWUxImsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87963343"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="87963343"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 16:17:54 -0700
X-CSE-ConnectionGUID: ey208RwOSZah0h5TKOwgjA==
X-CSE-MsgGUID: SY3zzE0CS06u1BUErQ/Ivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; d="scan'208";a="227286641"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 16:17:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 16:17:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 7 Apr 2026 16:17:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 7 Apr 2026 16:17:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3QuZqWbSbCUC6tE7TQcJRaHhq3A0Xl+olUwB7z2uI80UQg7ZWR/MYg1aZuwjrtcYtGIM9xOoyuFVbAmwqzUaktMd4bBMLU465Wbx96qs1TH+0VMEKuitl2Trxepc6WLz/4+fkVlClRMFT983cGmAgebdEHRtFBzdvGFcpt/rJeWmtz3DsHN/+/SxXKOXh1KQ5tq6V3C97OFffOG8y/Ez9PHrvVMSKDKlLXSivIlzm9RcxR9wxpmR+7NYM2nU4b7B7HwqOOD7dilqh4RZRnCcSlsshKNO1gCkIEJm10pN94wXuZcMZPVzLjhZVP62oeqAIsWxyxve6aSzX9c8DtHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l0WkE5oiqHNKoQqKpnvRuUpZCp7pt6Vo+38dvz1xoeA=;
 b=Ps5YI5LZGycIRz2rHGhq31iU5Xt7lL16XqaI/r6ShlfsMNC4dZhJ5Kmcp8mv24d9LbRN1nGFWHTpIGW8E3cogJvWUhpwhG4uFDn1WfI0uXTnNXWIvohA/o901GeJxZB5afAOruj8m2vr2IfYZiVGo2ozgO9fbDTrGY4kY3PGjCQbKNkdC6xSkxph2rX3zDZMKFbnxO16LHQIi4cep0p4gWUF0AMYr5Y7xcPVukiXDt1TNU8fycEaFtiOxLepEBqrPKauJjvbcxSKvTbS+IeOFQMnVfl/ad0l1ZeqAWuW+c27onJ/LJvV0K91Yjgb4ywfsA9qr1oyS3CArMY4xlIBtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Tue, 7 Apr
 2026 23:17:48 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 23:17:48 +0000
Date: Tue, 7 Apr 2026 16:17:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/oa: Implement Wa_14026633728
Message-ID: <adWQmBh5wYR3AHsM@soc-5CG1426VCC.clients.intel.com>
References: <20260407030219.444060-1-ashutosh.dixit@intel.com>
 <20260407030219.444060-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260407030219.444060-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0353.namprd04.prod.outlook.com
 (2603:10b6:303:8a::28) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: ded9253a-8264-4d0b-cc97-08de94fbe242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: YiwfkmfDJBepW87Jk/hMWKubuLhNYmUFMI+IPrqpjB9HJUpeqJLXa26HxpywTiaCfofc3JcizRzrVxAU9zymDq3co8kxig5WYMy8kvtEM7LdeCaMSrX38OTK8L8DbumcWN4TmbsvbfyEqSEWFirUmrTZlfDh6dxvsQoVx6g4xZdx2kjegwWDbn9hw1tC6b1RLBpbmJPQa7QCdlSUE+NDrZA6y3WxsYSqWJr/0YwfAN9j93u5MC3mxFFVsVUNOwNLImUUenQkyJFAfvCf59M+e27RDmgLcfTTQPfIcXkijTzAuI/XlTBbunBOzj4Bn4gQOZRKLSASt8ykMCSW9XNqlZju9kR4dcO+nvkSwQUjB/uGb5VRImPsqKHcA2F9KFrupI2AUTbFJqtc8l1GlLhJ7QmScaVT5STYDiofdm3j1GtYPa/vqGKpnDVPZbviAY4/IL0D9S9vpb5j232ih+jG15MCJsqx4h7tu+tZ4wBJWxPj1JIeMRGAkCX2u5T4KT9Bjxt02vshY7mslGsXXp7tLBZ0jJ4FmuxfroGLDfl/ePdllCRNOgdLSPZZI0/k8/KZSS7RI+qb3OPKENfbLpypTG5d9rQeNR51L6nzkhdgzex7xIlqzPl1hkbvizNOk8tpNTHpKdxFbjcmIDvrzFjPVVz/mXnAtVcJEYDyOWK+hU4WbHL6XO78eZvqx+36rCBmckvAWXXoex4zJ2xHLDGpkP5hNMY9GguSGjM8qG8pBtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmZRU1FSUG9lOXJCSVQ1MUlqTkhyUWt3MTFqL0RDRXRNUHBKWTdZajNOdmsw?=
 =?utf-8?B?RGFsQUV4ZEhwVFk0V0J2QWZFZnMyUitSMVhrd3BkUW43R0NQOEJMZ3ByWW1P?=
 =?utf-8?B?U0hEVXZaaDZJZFhtekVINFd6R1o0YUw3MnVxL2pBajNvOXJiZi9KVWoybmhN?=
 =?utf-8?B?N3BHRloxSGxCTnBPM2I5cllFcnRHUVJ6ZWhSeVVpRnBjT3ZGY3JOdXoxU0lN?=
 =?utf-8?B?b0dFUTB0bi9iRzA0SXVtYWxhQ3VWNHkxMy9USXI1UnBaVlBhcFZMNG9va085?=
 =?utf-8?B?YW1ad0tLMHlZZ0lUYXJNQXJTMXZmSjQyMTVycXdwS3ZIcXArYUlKVlpVbkhL?=
 =?utf-8?B?ZHlScXZmRUloR0g5K0J1bUVidWdUelMxRDBkS3VNSFBYSGc2Ti9VT0Y1dk5p?=
 =?utf-8?B?WVB3RWtBTTg0aFZvYXM3VE1KSjFicFRxd1JCSHQ3VnZpNGxoRS90WGxWL293?=
 =?utf-8?B?Q0FoOHdGMVAvTVBSZ0pPRjhvMVVxeGFSSmtyY2Z6dVduMzdWREhnS2hrUGxz?=
 =?utf-8?B?WkxoNWhzZmlzQUdxNWVxRWN6WHRVaWRRTWNWc01naWtWTWdrYURVN0FMLzdp?=
 =?utf-8?B?RTljZ0xEakU5WlBNd0ppc3Exb084b2RFUTJTVTB0QlFyVEwzdDVrdnVRVEpJ?=
 =?utf-8?B?Sm5RK0k4M3VwR3M4NlR2Y3g1NStEMUtZMTJId0ZjYWt2RS90TzViQXRTYVBi?=
 =?utf-8?B?S3czZVIrREY5YnhYNzRrdzZnRWkzUU9UUFREaThsR3pUeCtjRGxkMkhJVlJy?=
 =?utf-8?B?RldJTUZhR2RJTGZKUXFuSmgwRG9NdjhwemJjbGd1MUI4R3Zpd1VYeEdIa0Ni?=
 =?utf-8?B?djZYQ04rMVZtQTBBT3hZZW1odlZaUjRSMGl6S0hMT3YxN09HMEhraUxtSE5z?=
 =?utf-8?B?ajVNN1d1QnNGQ3RCOHFZZGVwUy9QWER1cjVDMVQ5bVRaTnYxVXBYd3M0ZVdr?=
 =?utf-8?B?WVVQRi8vcy9nVy8yTWorTW1iYlNZQmxvMjYxbTFkZHpOOEpvZkNrOExkcFJ2?=
 =?utf-8?B?L0tRdFQ4S21SVnZCU0U2NVA5cUczQm9lOTBtZUpYYmJzQ3owRlJwZDRSZ3Jz?=
 =?utf-8?B?ZXpwZkZjRlA1S3J6a05rWHQrcmo5MVZmN3Z3dmFCNFh3UGFCWFEzTlhhYkZl?=
 =?utf-8?B?VUFJejZ5czlJL1FDOUtmVjRsQ0h3MzFJdlgvNm04Zm1SM0srR29XSmsrQVlV?=
 =?utf-8?B?YW5ZNTBHc0pXOUhUM1AyRllpZHJaaWo2WDdKUTRYL3R1R0J6cUQyTHRZa1Bm?=
 =?utf-8?B?bnlnQ0NKbjlxQW9MTlBJczJNK1k2ZXBEMzc5bHR3OTRyZGgrVU4wS0xRb0FO?=
 =?utf-8?B?cy9LNDVkczExSXpyS0dkTGRpWko5aWZLQUpjUHBvK3gwd1dXQnoyY2RYMGdK?=
 =?utf-8?B?Zyt5bVROOW5zL3pReEs3ZkgrV0krall0VFhjbmd3eVEybW1laXoyWWw1MkNs?=
 =?utf-8?B?aTZLa2NldmMzWk1WWG5BZVI2Qml5cGd6eU9NL1Z4dmVwZ2ZsRGllUkVYdDR3?=
 =?utf-8?B?UVN0a3FYMHJ0eXRYaWNvL3pCUkJvZisrZmltNlcrdnlIYkR5OW1CUlFrbTVR?=
 =?utf-8?B?STdWeEduTEYvaGRnQUh5NTBXbEgrN2VzcGhXb2UrbFlTaUcxWGlScTVoMDRF?=
 =?utf-8?B?QVAyN3pOS1RPSWQ5all3cUNiSGt0ekxwOC9pNXN6ZWViRVdPRjJjckhuL0Jo?=
 =?utf-8?B?T29rUmE4MW9wVmY1bHZNak0vN2ZuaS9XTEFYeXFJaExJaVhtZnUwb1B6UTFE?=
 =?utf-8?B?UGk5SExVYlpiTWxwZUhvNVc0WmR1RFhoQllZQjZ4TCtIdmowMGRidS9QS1dJ?=
 =?utf-8?B?clhvdm5MTW05cVRSc1pJK3JTcmYxNmVnUWtJVkZZL2VBK0dSU3FWaGs5WERY?=
 =?utf-8?B?ZDM4M1UrSllnMk5TbVpHeFZ1d1lKUk0zQ2VJdUladi96L1IyUFZvYUs5SHAv?=
 =?utf-8?B?N2I0eWVkMzJEWE42SWZhRWdDOGVmclU4T01DSzRYYmpVeVhlRE5sK1lCczBK?=
 =?utf-8?B?NHQ0eERqamo1WFROZ2QxazVXR0w0YUxvWXVlQXgzN3J3UU1YMjY1UGw2T2hW?=
 =?utf-8?B?RXVFWVIyYjdVRkFkZ3VuVnIrL2lvWXNBYnk5VHVwVXg1TGFqTVRFdDRUVzdX?=
 =?utf-8?B?S2g4Q0ZxK1lhVnE4aEdaVTRwajh0TW5VZlBmQ1NMYmZZdm9JSWRvdXZkS0JS?=
 =?utf-8?B?RURlUG13Z2JLdko5YitCcmlIOVg5QmQzaXJYY2pIVTJDckl1THBQU25OSVli?=
 =?utf-8?B?QUYzTjB5azNRQzI1czROczg1Ti8yYTQ4VzM5ZC9LKzcwS1hUZTNjYmIwYktV?=
 =?utf-8?B?Wmg0dGN3N1hhV3dGM201Q0EwdUxjNXg2NFppMnB4WTQrWFNSNit6UC9OZDdk?=
 =?utf-8?Q?9yHWWMRGp0/o+++EUFNhZ2Rw4Kk8HrHbd4d8x?=
X-Exchange-RoutingPolicyChecked: A12Y/alOQN5IjWACgXJP+fw9fq14TK/K71GMkoUSdk7VfZZH6++dXRAyVZADkIUu2DW6SDWAKNclPnAonVeGMEVU6HyBxq3bPYba89w2AptAeMInPBQxDNYUS9gf6nS6ep2bj+8SS6tqgAjzyHaUkJr3ovACQ3y/vOPbfPQkdBLVaBrzvDwHM1adLzcl6VSToUCzWdVgred+EkpXhZ2ao89L2dhIUMzoEUonoW0cMs/OVNXZhFbNoAvpmJbLFu9jXVMtacj1x87I45r/0b13KWHJ7SI8XwTvKU6J5zOl3ytABMOdYkG1XbUQ6ebTS6H0Hb24zn1xw27oBFS50ixCVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ded9253a-8264-4d0b-cc97-08de94fbe242
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 23:17:48.8094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lk81/zW+NU4rTRIkst1mTT0P25A2S6fG0Uj5jjkXZ4CoPnKEcZYwsPVUubujge/b5aDhgxdWrE2Sx2upiEONopil3qLKSRnm0CndLqgd+og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Mon, Apr 06, 2026 at 08:02:19PM -0700, Ashutosh Dixit wrote:
>CRI Wa_14026633728 requires MERTOA buffer to be allocated in device memory,
>not system memory (which is the default for OA buffers).
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_oa.c         | 10 +++++++++-
> drivers/gpu/drm/xe/xe_wa_oob.rules |  1 +
> 2 files changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 0e65141e57ee8..f65cec62a0d2d 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -250,6 +250,11 @@ static void oa_timestamp_clear(struct xe_oa_stream *stream, u32 head)
> 		xe_map_wr(stream->oa->xe, map, head + 1, u32, 0);
> }
>
>+static bool mert_wa_14026633728(struct xe_oa_stream *s)
>+{
>+	return s->oa_unit->type == DRM_XE_OA_UNIT_TYPE_MERT && XE_GT_WA(s->gt, 14026633728);
>+}
>+
> static bool xe_oa_buffer_check_unlocked(struct xe_oa_stream *stream)
> {
> 	u32 gtt_offset = xe_bo_ggtt_addr(stream->oa_buffer.bo);
>@@ -892,11 +897,14 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>
> static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
> {
>+	u32 vram = mert_wa_14026633728(stream) ?
>+		XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(stream->oa->xe)) :
>+		XE_BO_FLAG_SYSTEM;
> 	struct xe_bo *bo;
>
> 	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
> 				       size, ttm_bo_type_kernel,
>-				       XE_BO_FLAG_SYSTEM | XE_BO_FLAG_GGTT, false);
>+				       vram | XE_BO_FLAG_GGTT, false);
> 	if (IS_ERR(bo))
> 		return PTR_ERR(bo);
>
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>index f8a185103b805..a7c1bd9bcb943 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -65,3 +65,4 @@
>
> 14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> 		GRAPHICS_VERSION_RANGE(2004, 3005)
>+14026633728	PLATFORM(CRESCENTISLAND)
>-- 
>2.48.1
>
