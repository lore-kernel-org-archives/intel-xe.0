Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45CE606A320
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OB1NeWcn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A710E089;
	Wed, 11 Nov 2026 04:20:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA54E10E089
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794370829; x=1825906829;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GgESZm8gxj4l0Cj9aFlSEub/0jYLCH/wDHPVuNhh04w=;
 b=OB1NeWcnteoL/lK2qdraJrymiTlrpnAfs+ruXr74eiXojXcrnDsgI0io
 ivuuFMaEYdkwvtygAyMOhet/gnc/KpCvSVXrSJUc9SCwe2AdiEt4W2i3Q
 lMjZl9QULGHPpokwUlhh8XlwAP/NmtARz6YpzzdV/9jpX6uO2XOdW5BPw
 s7RyhK8P+1PrPjQWcARJVsVc4/PlPZcw/9r2Y7XfnUN+2X98kqnhZWx9F
 a/jwaiq2XqWJNRQj36q2l+PozRItchm67z2BKpypXqxz+Y1I9uZUTYQEK
 2Zuur5eKAFgamVLYrjHfVdSdOEHyb+iPn0rGhIIujPOTHhe523ICDt+y9 A==;
X-CSE-ConnectionGUID: KuZLj52jRc2NMor2AM2ZUA==
X-CSE-MsgGUID: 0JxYAVv1TkeaClxENLcwLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3165348"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3165348"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:20:28 -0800
X-CSE-ConnectionGUID: t359DQzGQOi6Yk4J8zuC2w==
X-CSE-MsgGUID: qNccXo1JQnCtktErQd87Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8298683"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:20:28 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:20:27 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:20:27 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:20:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqPFAQFiGkG3x07Nw3zqpuBk/CVEPRKiNVt+ZjftT5oA47V+i2q4nB5PPMKuYaj/i1WaCED7axVdNx1Qnu/RdPoRa1FFoPIRGJ+gZgxLpb4fM8NWthtycm4lYhirKGkMUxqhS6+jFBf4tqqQmLzBnhnbeKr77ehEh+bif4ICzx72lVQDlBA7erV7YTqARCuAWu1YKN9nVXrmi7iIOQMMHPQJfXrDEx3mE02vLNDg0f4DhH3Ds7bpgNxQgn0hrJ8WQcLM3OKQviR8YmXu3PsyODy65fruFb3dcNtLq5WkqeTLMZEeqAwQfHKk7HuGzAWYngf6LmXpZB+UI1AIUItgMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gPJJQfmdl3V63hq422J8DRUT7m3UhIt3G3SCyhnU9s=;
 b=gEZwZbuB4GxBd2vV4E5RubFqjWF1h6nHrbpXoMLC3DBaDAcFezeoLtgVOvBroXnqjVg23PNsjC/tdARJTygZpIJ6LBFf01kkeJICZjhv9HwZVnrAhb0LQPXdQqzWw3BonJESmOXlKMNTuREeQ6w2lKHD39EFQM7bcoqS/Y6tAMlq/yK+CKbc4vKNc+duHj5r4M2yxBgGVx1ZYLz98yBIDtSNmIq4hYVk87+9DNY5KiwdN5lzPktx6cj/CQO5fQlAT7qwgbreeEscyUVr3I7nrZqFYGxifxqOhWVrND8wsq269CGljTTXg0Je+O6PodnkmikMg+ilqwTlNr8TH9ynQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH0PR11MB9776.namprd11.prod.outlook.com (2603:10b6:510:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 04:20:25 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:20:23 +0000
Message-ID: <61f1242b-c1f0-451e-8e64-8e5d93cd9efc@intel.com>
Date: Wed, 11 Nov 2026 09:50:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Remove unnecessary SIGID logging
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261104090701.1748619-2-riana.tauro@intel.com>
 <avNNWgTo_tNr94Ew@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avNNWgTo_tNr94Ew@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH0PR11MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: 3505343b-9be2-4b7b-16ad-08df3fab1abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|11063799006|261028144727099003|261102123227099003|261026121527099003|261009223027099003|261021121427099003|56012099006|261021123027099003|261022075727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: SqotFKmRs7304X9n3su1LL+pGi+lsoDIurdRZhP4T9iaYLQTMVJzRiRU/Oi6teTtldJJkw+YkC4QRkUn8ecDmdcUCytguAObPqSWNDdS2Jgsqivp4CJ1/DgtBmxJnX9Pm7wH1A8LMGBoBEqBeCkTVr2L1Ka6tN7Mk2GKUHAarUtDQCIgawDg7W8MnxnBFT3XT09L/CKaseP5UmcUDTK8lBBz+ShF9b3YSVKFwjHBgO8MghQed9NeuvrWAPM5BDnvArRtC9d9WZ6iUgt/kq/KdpcU9jbyHG8sm8PdSvLw+VOgSubTO2b0UViAnMT5SE0MmcbPHhloeXVUvlz+B7QLAN19ezDXvHbgiRSDvm3dmGce9Lk/qmFJd9IJJEFacIKL3cw3hmNkVsmbff94Ili/x/LWUrHUe2DScHRYhmA2QLxdLiZ8m3TmvhEuCSgz5Dvb1VPTmuKJ0xxXenjQwlr3R7RRuD3e+ivZNB6gB+zAntnqUatFreESqAEO3UBBJ+t0YZPuKBVUCj1GTiOrQnBXoTDVGdOU0XRhQ/hXcXJv9M69eLKoXrHZtXTB3BjpLcsgqv4oHz6KeFOHyFKfgSPUt/Fl8SJxI3kjkKtQZDwzFaNx89ujYq17XHgsSmZKNknM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261009223027099003)(261021121427099003)(56012099006)(261021123027099003)(261022075727099003)(261022105027099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnM1dGp5aFpJRGh1Ry92RTVrT2t2Q3hXWHFIZUo0UnErbE9iUy9HOXdSbVk2?=
 =?utf-8?B?d01uYzJQYXFLdjRtWFpuZWpVaHpMenc3UU5FSDhVbnEyVzN0RE8yUXBOcjJw?=
 =?utf-8?B?WEsrdSt1YUpEWUFWS1FZWjkweEJ2RE91dE1MR1lXcEIwZVNjcnV5VWJvWjRS?=
 =?utf-8?B?QjB0QWs5NC93MXNZTjllQnkzV1dxZGU1ZDdtWFRidWZHYkZhaW5qTW5RNnhF?=
 =?utf-8?B?L21NV2xNSXQxdk9NYm1YOGVhNldMYlpxbmhKcjU2NDZ3cndJeCtFSzFobHJx?=
 =?utf-8?B?RWVZcXFrRXRVa2VZdm1YNmRXUjN5VFRIRTBocThXVEFmaEVhZlJNalQyeitU?=
 =?utf-8?B?QzVTcFFXZWZZdzJmdExxem9Pa05qYm1kYW04SkQ4M1ZKUUdoN01FZkVuR29U?=
 =?utf-8?B?TDZPVit2QnRkZmQzc0hpY0tXeE9OenEyRWQvUktwYzUyaU9uZWJaSUo0dFJ0?=
 =?utf-8?B?WXBwbGRRdDN1a3RwWjV1WUdCSFNkWXVqb3hSQ1g2cXl1MVZDZkxZWnAvTUdk?=
 =?utf-8?B?alIzU1ZKWjNQOU9aMzhqYU54M2FtaWJUZzlOSXA5WTRoeHpNSEd2OEhlR3ZF?=
 =?utf-8?B?R0J4WVZjTGp1SGxJd3ZJOXJ0ZHFnZGpDTVR6N0RCblR3ei93QUNvU1VjNTRo?=
 =?utf-8?B?STliOEFBRUlBSDl1eVFucEZPMktRbFZoL01zV21WaDFzV1pvWGFUazF6Ykhx?=
 =?utf-8?B?azJvTnpIc3VxSGJmVWpONDZXZEJqWXlPNWdTZEdPbHdyS0VjNVhKT2kyOTJo?=
 =?utf-8?B?Rm41aGRmbExZajNlaGdnamY1OXQ0Y0hVMGF6ZWp0RHVUU282cWNrNWI2RnI4?=
 =?utf-8?B?Ty9hSFFtQUJOMGFMRkYrbDZQdjNJRkIrUlRtSmtEcUYzUnVNWTF5VVo5d3BF?=
 =?utf-8?B?eGJVc0RjYXk4UkhnTHllZWVhd09qNVYrZWtyMnBtZ3hFdDBEQVV1YnRBSFY1?=
 =?utf-8?B?c0tPTXp2R2tIVzd0MGIyVllabENwY1h6ODlZK0tZMEE2c3VYNjVQTUN1WmRU?=
 =?utf-8?B?ZHZka1ZpaFgxRGJVMmpZRlZCZmhUQWpJUEozaGpyVEJ2OFVLYjBMc042UFVF?=
 =?utf-8?B?a2ttOHkvL3BYS0svWStiV1Q1dUl5SnRERStUNlcveGEzWXlCaUJ1ekNsZjNa?=
 =?utf-8?B?NEMwUVVEcGIwdU5YK3Nrd3A5UVlvQ3I1Y1drNU92Wm9lYURJa3NVMFNDWXR0?=
 =?utf-8?B?Qk5PWlVYZEF1QzZwV3RXeHlmTTFaY05lUU9BVkp4b0dZNW5zREp3Ui9QMmQ3?=
 =?utf-8?B?anFvcXVDWmh2QkRxcGgxUVFMd1gvaXlqTk15eGxOL3NjZVZ3UXdTUExZRHUr?=
 =?utf-8?B?Z1NJWUt0SE9PTG5tTkRYNU9BcHI1Qk5qU0RXQ1R3SjF0WENRUWhJUFVlVmpF?=
 =?utf-8?B?U1E4TUczeGxHMEYzTGh0eDRPeTBNb2ZOMTFyTERLbmk3ZngwVEI4SUR1aURx?=
 =?utf-8?B?VmQ0OWVvb0MyU09yMGZwSEFtWUlraitvTG9Pd0w0TGhWd2NmSS9aZXllbmk4?=
 =?utf-8?B?VVp1QXdUTzQ5TFhxZUxWU0JRR3ZwMlB6YndpY0J6MC9YaEZoNmtpZnV1dTFW?=
 =?utf-8?B?Ulp4cHRiZkVTeGFKdXYvaENsL3orQVVLN0ZBUktnN3lYK0lWanQ1TWdxTFJK?=
 =?utf-8?B?ZFhUZTJRNG9WSlNnODRzVEpFaGx3czk4NlJpUElUNnZUa2RoQmQyRUV5NkZs?=
 =?utf-8?B?dFJuQWMwRGROUmVNWCticTd0cFhiZUFlbGIyWVNUUklLR2NFZk4yaU0zcUtv?=
 =?utf-8?B?WXcvMm03bHJNdkF3NnZ6emZhc1RGSVJIL3NDQUNNblhLL0sxTXMyOVFId212?=
 =?utf-8?B?Y05KSXpGbi9iRndlM0hSZVdDZUtEUXdMN1hJQVpicWMrTzduOW1ER0ZFNTRy?=
 =?utf-8?B?elFIM1M5N3NkVVRSSEx5c0plRnBwUitSR0ZJeTg3SW1IZUZuenc1NTlOMGg3?=
 =?utf-8?B?MmU5VUM5dkFFLzhGZ0dQbTVMcjFzZXM4SWpMZ0ZIU2dCdlR6ellTcjVUd25o?=
 =?utf-8?B?czhFUDM5UnlsVGVQS2krWTR6U3NBbVBJVzJxa3ZVeTdvYmphNDJNa05FVDRw?=
 =?utf-8?B?ejlhd002TXVzVmp0OC9sV2djamJTUVFBOGhXTU02eDdTdDFaMERvSk9qTXN4?=
 =?utf-8?B?akthWUh4aVdVaG53ZS9xcDNoSEVqV3BHcEFUV3FjZjRxYnRnMDlBd2RWOGNo?=
 =?utf-8?B?V1VQZ1M2Qm1lZThLV2tCOVZFTXd4Mys2S0NIUkt6TVhXRU0rVGxIbytCaHFa?=
 =?utf-8?B?ZnJnKzhHVnNzWlM3NEc4c1lwNE93RGpSeFJrbmFyYng5Q0dHZGZ4OWZlTjNp?=
 =?utf-8?B?Mlo0amQ5eU1WMjJtVVo0TS82dXFyazdRRHpUenc5aUtOWHNFZHZ1UT09?=
X-Exchange-RoutingPolicyChecked: OxZW/QBkHLXPu1PyEGi0mTMzb1nExslCozeqrrD4nnpaA/fip6KjXKeQuovGZYZxcWH12H1Xl3CQl/uxnwIvEx4EKfvRC5rwkfYA8qM1gtoHkJCn6FeKA7+x2KzwECwJ1Yxw9gnhG7FTz0PvW48JRBJIPcm+IFTEFHthKkN3aYi8TyqL374hnxVGmyE52Y+TGZ4hIdbsATpn5c/iN2yRntpFE6TYYo6WUNRrCwQ3nt3CQi6rD1vXFJCNNSiE1uweAGOnOzqHjzTUD31MhrTauOq5IaNAVG3XJ0lnJjz2Q6p27yRhNPwTGDKoe8uQ5HpH88+EAtYaOZFG86z5dkHJxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3505343b-9be2-4b7b-16ad-08df3fab1abc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:20:23.4690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l7BhPHOSQpDWaxGYRjyJotZUAZVjt9fYngENHBRaXi0bKGbAE/kpqMggAHde9zoyO3grHK63xhUzSEEamqQWJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9776
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10-11-2026 22:29, Rodrigo Vivi wrote:
> On Wed, Nov 04, 2026 at 02:37:02PM +0530, Riana Tauro wrote:
>> Remove SIGID logging for all Double-bit ecc memory errors
> Please take a look to the commit message of my duplicated attempt:
> https://lore.kernel.org/intel-xe/20261109161733.3769906-2-rodrigo.vivi@intel.com/
>
> I believe we could improve this message a bit here.
Sure will add more details in commit message
>
>> No functional changes.
> In a way I'd say we do have some functional changes.
>
>
>> Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests for device memory ecc errors")
>> Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page offline queue and list")
>> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c | 57 ++++++++++++++-----------------------
>>   1 file changed, 21 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 2c01c183d02b..46e2a40eee95 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -269,32 +269,29 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>>   	request.action = action;
>>   
>>   	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
>> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to offline page 0x%llx\n",
>> -			   page_address);
>> +		xe_info(xe, "Requesting firmware to offline page 0x%llx\n", page_address);
>>   	else
>> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting firmware to remove page 0x%llx from queue\n",
>> -			   page_address);
>> +		xe_info(xe, "Requesting firmware to remove page 0x%llx from queue\n", page_address);
> should we use info or dbg here?!

The only distinction between the same address causing the error is this 
log. For a duplicate address, we ask the firmware
to remove from the queue. It would be useful if these are seen in the 
logs without having to enable debug logs.



>
>>   
>>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>>   				  &request, sizeof(request), &response, sizeof(response));
>>   
>>   	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>   	if (ret) {
>> -		xe_log_err(xe, SYSCTRL, ret, "failed to send page offline command\n");
>> +		xe_err(xe, "sysctrl: failed to send page offline command %d\n", ret);
> This err is an error pointer and should be handled differently.
>
> But, anyway...
> I believe we should only remove the 202 (DEVICE_MEMORY) entries and not the fw
> related ones (105 - SYSCTRL).

Since this is the only function in the file adding sigids for sysctrl 
errors and there is ongoing discussion to only
have sysctrl layer logs and not outer layer. Removed it for now, this 
can be added if needed
with the changes to the entire file.

Thanks
Riana


>
>>   		return ret;
>>   	}
>>   
>>   	if (rlen != sizeof(response)) {
>> -		xe_log_err(xe, SYSCTRL, -EINVAL,
>> -			   "unexpected page offline response length %zu (expected %zu)\n",
>> -			   rlen, sizeof(response));
>> +		xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>>   		return -EINVAL;
>>   	}
>>   
>>   	ret = ras_status_to_errno(response.status);
>>   	if (ret) {
>> -		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>> -			   response.status);
>> +		xe_err(xe, "sysctrl: page offline command failed with status %#x\n",
>> +		       response.status);
>>   		return ret;
>>   	}
>>   
>> @@ -318,15 +315,14 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>>   	int ret;
>>   
>>   	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> -		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
>> -			   page_address);
>> +		xe_err(xe, "Unaligned physical page address: 0x%llx\n", page_address);
>>   		return -EINVAL;
>>   	}
>>   
>>   	/* User policy set to disable page offlining */
>>   	if (xe_ras_get_disable_vram_page_offline(xe)) {
>>   		action = XE_RAS_PAGE_ACTION_REMOVE;
>> -		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User policy set to disable page offlining\n");
>> +		xe_info(xe, "User policy set to disable page offlining\n");
>>   		goto notify;
>>   	}
>>   
>> @@ -346,33 +342,24 @@ static int handle_page_offline(struct xe_device *xe, u64 page_address, bool noti
>>   	switch (ret) {
>>   	case 0:
>>   		action = XE_RAS_PAGE_ACTION_REMOVE;
>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>> -			   "Poison detected at physical address 0x%llx, page soft-offlined\n",
>> -			   page_address);
>>   		break;
>>   	case -EIO:
>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>> -			   "Poison detected at physical address 0x%llx, page belongs to critical BO and cannot be soft-offlined\n",
>> -			   page_address);
>> +		xe_err(xe, "Physical page address 0x%llx belongs to critical BO and cannot be soft-offlined\n",
>> +		       page_address);
>>   		return ret;
>>   	case -EEXIST:
>>   		if (xa_load(&state->offlined_pages, page_address >> XE_PTE_SHIFT))
>>   			action = XE_RAS_PAGE_ACTION_REMOVE;
>>   		else
>>   			action = XE_RAS_PAGE_ACTION_OFFLINE;
>> -
>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>> -			   "Double-bit ECC error detected at physical address 0x%llx, page soft-offlined\n",
>> -			   page_address);
>>   		break;
>>   	case -ENOMEM:
>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>> -			   "Poison detected at physical address 0x%llx, failed to soft-offline\n",
>> -			   page_address);
>> +		xe_err(xe, "Failed to soft-offline page at physical address 0x%llx\n",
>> +		       page_address);
>>   		return ret;
>>   	default:
>> -		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to handle address fault at physical address 0x%llx\n",
>> -			   page_address);
>> +		xe_err(xe, "Failed to handle address fault at physical address 0x%llx\n",
>> +		       page_address);
>>   		return 0;
>>   	}
>>   
>> @@ -433,15 +420,14 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>>   
>>   		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>   		if (ret) {
>> -			xe_log_err(xe, SYSCTRL, ret, "failed to get page offline data, cmd=%#x\n",
>> -				   cmd);
>> +			xe_err(xe, "sysctrl: failed to get page offline data for cmd %#x, ret %d\n",
>> +			       cmd, ret);
>>   			return;
>>   		}
>>   
>>   		if (rlen != resp_size) {
>> -			xe_log_err(xe, SYSCTRL, -EINVAL,
>> -				   "unexpected page offline response length %zu (expected %zu), cmd=%#x\n",
>> -				   rlen, resp_size, cmd);
>> +			xe_err(xe, "sysctrl: unexpected page offline response length %zu (expected %zu) for cmd %#x\n",
>> +			       rlen, resp_size, cmd);
>>   			return;
>>   		}
>>   
>> @@ -471,9 +457,8 @@ static void process_offline_pages(struct xe_device *xe, u32 cmd, void *req, size
>>   			total_pages = common->total_pages;
>>   
>>   		if (count > total_pages) {
>> -			xe_log_err(xe, SYSCTRL, -EINVAL,
>> -				   "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
>> -				   total_pages, count, cmd);
>> +			xe_err(xe, "Pages returned exceed total pages %u, returned %u, cmd=%#x\n",
>> +			       total_pages, count, cmd);
>>   			return;
>>   		}
>>   	} while (common->additional_data);
>> -- 
>> 2.47.1
>>
