Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF05C282C5
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 09:25:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE7110EC30;
	Fri, 28 Feb 2025 09:25:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcsFaUKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A96310EC30
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740734743; x=1772270743;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GrcruvPLqtdOnAKoU/XQaXI6WMtViVOY3BH82MbMSSQ=;
 b=XcsFaUKIoF/XYm8kUvU/6WdOtSEIdRsPxd8SYFpyZ6YmD4mRgTz6qK/7
 o7lBTQXxAX9WEpi/q2JzJuYqEqrLwuXcY38f5F7umVnwTuk9loxPkb3BH
 q8Rpxq4BNK+jLVNfxkDVG5cuGfYhXXwYFyr1Kgimqq+gGpPIBw2xnTwhH
 UqeQ1fRAEHcGMLJItSmeEcWWKc0TuBottjb+U0h6klkyn2xyGHlxPV9WR
 Lc1hXRN9zevgI2NpfvBkAPtcmf00tEDm9dhNEvWItroUSZLADPTTHDdAg
 xl5SYOij43dDlQZKT3ZEHU2T2PBz6UCoAaz0iRSmQhp01jj2mGkL4leU3 Q==;
X-CSE-ConnectionGUID: 7n1xjqr+Sp2C2hGbJuK62g==
X-CSE-MsgGUID: zVn6J1DxSFCze/SPi6FNbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41504319"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="41504319"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:25:43 -0800
X-CSE-ConnectionGUID: 9e0JKzxfTvWwpgz3RzEsgQ==
X-CSE-MsgGUID: KjOuCYHySgiNFZ3fhg6WcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="122230248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:25:44 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 01:25:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 01:25:43 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 01:25:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGx4LxeYDNSj7GjNGsa6pJ5wakpLQHLt4ZzGNfOteuUbwOHdtevuX/67Aj+dQD8PVXv+BFRE44HHFp179r/2TrGxNfI0ARBPyd+Km4++wrSUDE354hBFzB525QVuZz3Mn42+drGDKaehULoGN4Sd9r/Om39CE8vtTO+bYXUYkKr+WHxH66SeGNr9yuasn6bKw2ySpo4+G3dahKQLzq0NKczIrYMijWeEwXuay3L7feUteaFEhh73c6hhHzuTTkDT+xyoIY2JvMVydOTGdKNYkphHK/r0UylL6weJhdh/7vNr1eU/Vx+AsgrGEB8lqmCsggFu1WbvOCBnU/I56JokAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6gs97AvqASReRCW8fFF0jnODBafweMLYUHxqsq5aJ4=;
 b=gzrBbMdzIkd9PCsKAFmeFx2k9sThPiSZbxlktaRIoa9tFaJZZlPFx6GUhDFaJlysz9KsiUfovVJ5phm0kS1jpRhtag7WvuYybuxtUCkKNXoZjFD6zKQw/X2a8sEkP50mo+Z7LFOFS5mgdor1/IgORhq8cQlXepRTOnL7rxUyPGjRrqazH00ouOqb171kZfxuQuIMmqdvpf+iIOTQV7pE4caQxM7vHefB72kcX6FkPS3v2yCGml4T2phGHr57l9lpMkJcxPtPYIW4IMxOv7R9cotX8v1tDDvaLhAunWPWnQUGY0mJdinejDUa5rKFL9h0F2upV37EJeT9+rMcw5VrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CO1PR11MB5075.namprd11.prod.outlook.com (2603:10b6:303:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Fri, 28 Feb
 2025 09:25:28 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8466.020; Fri, 28 Feb 2025
 09:25:27 +0000
Message-ID: <62e7b237-e6c9-4022-a83e-4d77584f54b0@intel.com>
Date: Fri, 28 Feb 2025 10:25:23 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Set submission version in xe_uc_fw struct
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>
References: <20250225132337.6508-1-lukasz.laguna@intel.com>
 <20250225132337.6508-4-lukasz.laguna@intel.com>
 <f42f1fb1-9cca-429c-b232-1dc2984e04fe@intel.com>
 <91ed57cd-f17a-469e-9bef-fd43f2894e39@intel.com>
 <058ab253-3ed9-4a1a-a23e-c75282ec1069@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <058ab253-3ed9-4a1a-a23e-c75282ec1069@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::34) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CO1PR11MB5075:EE_
X-MS-Office365-Filtering-Correlation-Id: d64d42e0-1efc-4c37-87d2-08dd57d9d659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEtaUDMxTjJjbng0RkpCeFFxcVNEa2pQSFhxeGhLU1NUY2F1Q2pQbDBoNmZG?=
 =?utf-8?B?OVpUK3NTaUY3TE9wamloSW9vN3FzclB6cXFxeXdNQ2Q5OGVVMzhCL09wTFdz?=
 =?utf-8?B?TS94ZEtVTThkZXltTCtGV0FrQ2lsQ1FyRS9PcXB5VGZjaWZQSW41Rmc2NGZy?=
 =?utf-8?B?VndmR0d2ZFFHN2UvYnkzejR3TG0vM2ExdHlpc1BFaWJYVUFzMUZjMDZ0YUJH?=
 =?utf-8?B?Syt0c1ZKWGZzQVdhaGVHb0oxSHgvTk1uejBPdENHMjFIYkV6VkZoYUlmVHEy?=
 =?utf-8?B?WDlzUFJtQ1l4K290SGhMek1XMHZDQ2s4Z3d1WUpRY0gxNTk4TWlNZDdkZC9D?=
 =?utf-8?B?azNXbTF2WjdXSXMvQlc2MVZzNzFUU0VFMENyTFM3dC9ibDJuK0NqdTVMUWRD?=
 =?utf-8?B?M3ZmdGZWVFZCRmthVHd0QTZ2aitDTWEwam9vb2UrZWJsMW16Y1hKbTgzMG5a?=
 =?utf-8?B?blU3aUZJa0tqbmltaGZFQmtGdVQ4aE1leVoxZ0FrVERqZlFra053RUNSQmpK?=
 =?utf-8?B?aG01UnVMcS8rV1R5RFdFYWdYWmVIbFljUFByTEVoclVZMEkreXBOWmRzRml0?=
 =?utf-8?B?MVFqWXJiSFE0bndMWGEvQWRYSG9JOTlWVkdNU2k4Nmc0K2N5NHZ0YWNncjlz?=
 =?utf-8?B?anNyaVEyd2V3WFRPZmF5cDBWMjBvMXlFdUN2WVJLMTd2U0FxeDZXQ0gvaVhn?=
 =?utf-8?B?dDR0cS9kdVkxRkpJa2g3MVZLVVllYXRmekl3Q0p2TW05Unk4c1doQ3lRU1RT?=
 =?utf-8?B?MFJNY01TSHJ3dTZmeU11TWhZeXJVaCtadm0zMm45UCtZd3ZPSW4zenlrSWJJ?=
 =?utf-8?B?ZHB0VkNQamE0Y2w1KzRqekc0M2VJVXMveFZaUUZZalgwcXI0L29kZFByMXVr?=
 =?utf-8?B?Tm1QTWROTDlqMjZRM21VREllK0JCNTRUWlBtWFlsVEEwTlR1KzdydnNnNkF5?=
 =?utf-8?B?THJ1dFZJN0pDVDQrWGxnTlVLRmtqNUJaV0s3cWtGMTc2ZFJmNGh4Ym1yb1NY?=
 =?utf-8?B?SmxBaEhwRXNGVU0yNnNUM2k1NUsvT2ZwZWFaR29kSnl6ZjQ3TGFJemxtaTlG?=
 =?utf-8?B?VkhwZkYwVGFtUm9zdTdnQkRCeDBSY0pQMndVTVQ3SVAwcWwvem5TM1JZU1k4?=
 =?utf-8?B?TnRzbkV5bnd1R1Fyd1FCR0VQeGY5NFJUTzZsbVpyZFE2SFhqaWRKSWZHc2NR?=
 =?utf-8?B?WlhjNVJUcW5QOTlWcFdjVDBoS0xObDVoMlVuRllEM2NNV1NKclpqUlRveVZP?=
 =?utf-8?B?SXpBK2h6VnJwenVzWEhHa1Qwc0FxYk9EQUM4dnZWRUxzSE5QaXRVRS9BNlND?=
 =?utf-8?B?RVEyajNaZTRnNCttb251MTNXQzdCd214YnRkTmVqcWs0Q1hCcHppK2ZHU01Y?=
 =?utf-8?B?eXpGMkg4K3djeGhGbnBQYk8zYjQwWllBMU9QbWFVdUI1K2IyM0ZLck8yMmtt?=
 =?utf-8?B?dVB5cFpOYjVmNlhMdTBTRVBpcmwwUml3ak9OK3pSblRXbVVSTSttaWY0VHJZ?=
 =?utf-8?B?aDRGYWU4dnZrOU9yT2hvQ2NoOTJ0WThEUGlGazVOSTdlQVVpWFFwTnV5UkZ2?=
 =?utf-8?B?VU9HT0tHMWExRkttZWVIMXlwb2x5OFB4UEcycElrYmREUVhBVlFxdVFnQ1Ft?=
 =?utf-8?B?N1ozcWRuSjZKK3hmaUh0SUhQUFNKQ2RNWHVjNjhpczl1aWJISTVnNStuZUFW?=
 =?utf-8?B?R3hiNlhaazJnWGJNTUxyMnVsbjVQMlVNMktuYjROcUFnblZ1bUpvWDdoQkZr?=
 =?utf-8?B?emc5aFdHT2krWlhMaHdQRmp3blhaVXZSUXhBdlE1cWpLMGFqZ2FiNWVOclNk?=
 =?utf-8?B?RDVlTjJQWmc0VEpkQk9paVVaMkhlNVFleEUyNzlYdjVDdHlETm9ubEhkZndS?=
 =?utf-8?Q?bWnpINQrIWtv9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25yLzhsS3U1WUNKUWhlT1NxLzNKT0t6dGhVMTgrWXVDRGNzbE4wejdmUGhE?=
 =?utf-8?B?YTd0Zlo5Wm9rczE1TXBzL1N1RGZTWU8xWXlkUDNTR0E5MWN2TmZYbnRpOUY2?=
 =?utf-8?B?V1hNSWlxVHRENjBTWTZXVWZqTU5RT2NDYUhYekhYRlYxTVJIVnhnVG5VN1ZB?=
 =?utf-8?B?a2tiYW56YVh6c25id1BTcXZlUHAwQVlBeUV4QWZmTmRVTkpMWnpHZDRaY3dV?=
 =?utf-8?B?YWVQdXp4bldnK3U2QnhWUkJJTFdsSkYvYzlhR2JXVW5MdmFadW5NUGJJRGx5?=
 =?utf-8?B?WHhTZk5KSzMrVWVIQUNhSXVHeEpVVDdpQTF6c093enFyQ0c4NXlHZjNnYXdQ?=
 =?utf-8?B?NHUrSjlmRnJUYVdxNHVVbEkwSlltMHYxSkU0QW9OUFRUZW5hY1htVXdNK25z?=
 =?utf-8?B?R3c3M3NLd0cyVFN4TWdjZFg3a2x5cEZYZzIxb01sR0ZsQ09IWmJ2dzFTYk5B?=
 =?utf-8?B?ckEzeEdsUjA5R2xVcnAzZW5DaHhBNWl1SjdQRGdSWUpmZGhOWWJ1YVc1b0dx?=
 =?utf-8?B?UGFIQlQvNDF5OHNjSGlSQzVCYUtvd2xkWk52U2ZvVGJ6eW0yU0gycjJVVnhN?=
 =?utf-8?B?MTMxREwvNDIweXp1YWc2aHdNSWp1L1Q3a0RxMjJCSFU1UUtHSzhYSFVJdjNN?=
 =?utf-8?B?YStqcDBaTWs5NzdtSXVaSDlCckJnTU9yZldOalBkUWlCbTNvVTRyVUkzT2p6?=
 =?utf-8?B?cWlQMVBJa2lvQXZiY2dUWEVyQXdGamdCY0o0Z2JxdytLYlNFUjlWbDZjQks5?=
 =?utf-8?B?a2hZdUZFRUVYSnVDTStERHlnUXcxOVlQNWdWSmdEZXRWK0ZHempxcHRRWmh6?=
 =?utf-8?B?TkQ0dnFsYmY0bFgwaVNIdGx4cDEyQmk0RnhxbzR0NGwwT0ZJZ25jQUV4Qk5X?=
 =?utf-8?B?V1ovZWl2bnQ4MjVwMkJLNUYwZFpvRWxLZmlvM0Vwa2hkVVhKVTBMTjBaOWNC?=
 =?utf-8?B?dVNVeFVxMXFJQjkwVTZPY053Q0hwWEVzcjl3eEUzU2d2Yk5sTzFCNm1sRGZB?=
 =?utf-8?B?MDVxNEJMaVVTeTNaQ2wvTVVHdFhtRy8wcG9JQ1k4MlYxOUlQcmpxVUVQVG1K?=
 =?utf-8?B?Y3l0cUF5Vy9WbzRrdytUTjhjRkJ1d0ZjaFFuTVhrUGNkcHh1MlZDQjdyeWQy?=
 =?utf-8?B?UWl5RGo5T3dIQWJWeC9IZ0xMVnZnM3Y0V1lmMkJpRHNCZGMxNUcxSDdQUE9x?=
 =?utf-8?B?d0FJQ3pjb3VRYnlMdFVsT0lSMmpXYXh1bEtqMGJWdTJ5VjlBcTF4RVh3STY4?=
 =?utf-8?B?aWpsOW1jMy96ZmJKdG55dU1YcjdtYmY5NmtYdUJyYTRCbDVEWHpTWXBuWDRK?=
 =?utf-8?B?U2tYQUhmZUZKM3c3Zml3a1pqejIvMTk3QTJtUkpiZVhSV0FtZ2FXVzc3OGVS?=
 =?utf-8?B?Q09SZDhYcnlNeVNNRTRBdVFxTTI4M0lZVG5vM2xtcGlOM051bEFncDJxeHFz?=
 =?utf-8?B?ZU81eVhNbjNOQzQ5MzRDdGFuVWxvUk9Zd0xJeGlOWXBrbWJNbk1qVUtmR2Jw?=
 =?utf-8?B?eHJ4WUtlODc2dCtkdUdMaGN0Y0J3MjAxdnJ1RmJIMVdmRWU3a0ZCNXNlSUNW?=
 =?utf-8?B?SGZneG1WRG1BMnVyWTZWVzN6cFBidnRNSGtQZXdsUmhvamh2UTZmYm1kV1pQ?=
 =?utf-8?B?dFdLazRUbll5SFJna25iVlFvZEZVY0tsT1NiM0hHbXlhM0l6S3NyRFVob21q?=
 =?utf-8?B?WElHN3czMmNXN3NrR2JvcGJBUDBFRmRCQThmV0FyZS9NZEMydG1FYVhCcmFt?=
 =?utf-8?B?VlZIbDZUbXNBMWQxcjJ0VnoxeFlKT3ZSK2JGbWxvcURzSVNUbjREd0RaUXdh?=
 =?utf-8?B?NlBRV1doWnJxRmthMlZYT2NxVkx3dWpiUmVleFV6czJReEZCSzlhK2JWemhX?=
 =?utf-8?B?MzZ6NGFOeVFwZDNzZnE1c3BBOFhGMjhVTk83Q1I5U0JwM1FUdzhpNU16Tkp6?=
 =?utf-8?B?UjJXajU0djR5aUx6R01yWFRMYmtaMFIzR3MxdFNuU0ZyckpCQXl6b1g4aFhF?=
 =?utf-8?B?QXRPTDZDc09nUVNWanRheFZaVTlaRTk2SEpzUzNxLzlSdnI0T1c5ay9mUVpq?=
 =?utf-8?B?aG16cGc3QUhFREJyb2N6THVUdTAvZGR2SGdQUlFXWEMxb1BaLzhUdEo2UGlq?=
 =?utf-8?B?akxSdDVab1QxQXVNVklyZW9QUDBESmo1RXk3OVZ1RlhCcEpnaVY5MC9nTlE1?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d64d42e0-1efc-4c37-87d2-08dd57d9d659
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 09:25:27.4300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmuRGvpESc9V+huULdszOnszSyGNEIZWPceY+DhD0qv/b5R0TTnietl/e2Bd06soYYM4h/l1udH8nOZFiC8eVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5075
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


On 2/27/2025 20:43, Daniele Ceraolo Spurio wrote:
>
>
> On 2/27/2025 3:22 AM, Laguna, Lukasz wrote:
>>
>> On 2/25/2025 23:30, Daniele Ceraolo Spurio wrote:
>>>
>>>
>>> On 2/25/2025 5:23 AM, Lukasz Laguna wrote:
>>>> The VF driver has already negotiated the ABI version with GuC. What
>>>> remains is to populate the generic xe_uc_fw struct with the version
>>>> before initializing submission.
>>>>
>>>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_guc.c | 9 ++++++++-
>>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>> index bc1ff0a4e1e7..7b38447d902c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>> @@ -703,9 +703,16 @@ int xe_guc_init(struct xe_guc *guc)
>>>>     static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>>>>   {
>>>> +    struct xe_gt *gt = guc_to_gt(guc);
>>>> +    struct xe_uc_fw_version ver;
>>>>       int err;
>>>>   -    err = xe_guc_submit_init(guc, 
>>>> xe_gt_sriov_vf_guc_ids(guc_to_gt(guc)));
>>>> +    err = xe_gt_sriov_vf_get_guc_ver(gt, &ver);
>>>> +    xe_gt_assert(gt, !err);
>>>> +
>>>> +    xe_uc_fw_set_compatibility_ver(&guc->fw, &ver);
>>>
>>> Why not just pass &gt->sriov.vf.guc_version here, instead of copying 
>>> it into another variable first?
>>
>> By using xe_gt_sriov_vf_get_guc_ver(), we additionally verify whether 
>> the handshake completed successfully (major > 0). Only in that case 
>> we set the version in xe_uc_fw.
>
> But it's impossible to get here with a wrong major value, because 
> xe_gt_sriov_vf_bootstrap() would fail. If you really want to have an 
> emergency check then IMO it'd be better to just have:
>
> xe_assert(xe, gt->sriov.vf.guc_version.major);
>
> which you can have in this function without the need for an helper 
> (the same assert exists in other SRIOV functions like 
> xe_gt_sriov_vf_lmem).
>

Next thing is that gt->sriov.vf.guc_version is a different struct 
(struct xe_gt_sriov_vf_guc_version). xe_gt_sriov_vf_get_guc_ver() sets 
version in generic xe_uc_fw_version structure format.

Lukasz

> Daniele
>
>>
>> Lukasz
>>
>>>
>>> Daniele
>>>
>>>> +
>>>> +    err = xe_guc_submit_init(guc, xe_gt_sriov_vf_guc_ids(gt));
>>>>       if (err)
>>>>           return err;
>>>
>
