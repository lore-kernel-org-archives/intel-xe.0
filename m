Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F646C5AC67
	for <intel-xe@archiver.kernel.org>; Tue, 11 Aug 2026 13:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABDD10EBCD;
	Tue, 11 Aug 2026 13:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvVJLzdc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A597D10EBCD
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Aug 2026 13:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786456721; x=1817992721;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=tYwQd513n77VrPyPaaiJkX0ObpyseXfwGDf2DsxMsmQ=;
 b=IvVJLzdcTCDBpQr3WhUqKU4rwQufUvOhlgkbLbs+CZ87I5rGe5ERF0FS
 xIhdCPUlZGPJlOY/VoZVuUU+M++9Gy4LqMOiosNSAPDXTElpGlKN+IM1d
 g7ZJPTarhHg7Cd3a0rYxCnkhN2U2Ynwa0CqC77HPHj2HfvBSLicm7rBYm
 g2MPcm/T2PF/rrCtpZk4ersre6UXMJWFPSUA8HCoJUmayaKSxHYhJsdP/
 UKGYc0izTolVPp+IjDvVpnqyNJ2BDFr7hMqgt2H+Jn9MG12BJR6XH5AQe
 Ft7HUjru/Wb40vCYTRPAjVwnf5sdzibIqbeoYhAW4fb99JZ30RPVEeAsr w==;
X-CSE-ConnectionGUID: qOwslAFfSQKm1WbH20A3mw==
X-CSE-MsgGUID: 7yVQj93HTeeAM+P9q8N2QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="86108062"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208,217";a="86108062"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:58:40 -0700
X-CSE-ConnectionGUID: l/y6Zf1+Qs66auZYO94pcw==
X-CSE-MsgGUID: RExeTLwiTze0YXysAzRWhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
 d="scan'208,217";a="261583200"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:58:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:58:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 06:58:39 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 06:58:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5X1qg887io2gVqBvqkbLEncoBdYfVO+OjDZ4TnVEycHzGsQoEKI9N8DfqE4BLrkfARliFYWE7cYY/i3PcP+r/yev/xYxvFQZzuRsbA3335OB8mDnPR6Ln+KwZOO8uuwwKO4oDevRprSadfA9YSEImwwtM3chYGryTeceLPFUJlO1Q21C4Azg+dLxL1qtOMvqUVsGetSCPUvgFchnwGtRP7ligWxZcZPhQsX3X/HfQ+4mryR7sHZG6nwBLvFOQJmOL1bVFx0jobUIWZ1v8vp584DiuKkKNUBkF6HH9n1vLNpm4+oxg/o5/xl1iFjxfBBQ1+6CbfQIZxHdY144HwBKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJZnm3NGwvfDpMcrUztchemZnp8CF8uAx84pWX5XZ48=;
 b=Hoc8CYu5EVSe/nDu0IXLblq/04R93SO4gd/gmrDfIcHRXqQt1HXYhgLPwZJMYDJn60oV9BDeiJDPQKbipdu6SrxlUAj3TmIsGXoelFEz43pyd5V7dLiLSzaeAmHJdcTs3VDntb7n7VOQxJV0PNeABx1N/t7GdvS5f8rJYYmaJnUzne+xkePbd2hxOZXHOu7zSIDfJt/Sn0rgaiYaQ7hZOF43Wlw2G9BHXTVdGNgiPBxxwV/bh/nqQs+xriS00xRnGpSqM4hXTKFcibQ3WDigP2DJNemXqQO3JywsQfH0SHzPGbV9VOaBKciWXBtTDlNqCPBhYrCOAAUAPAptZDHWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:58:36 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:58:35 +0000
Content-Type: multipart/alternative;
 boundary="------------EJsFH6hmRmpwohMGL3SrHojl"
Message-ID: <5b944950-11ba-4993-a6f0-2f52a0496a17@intel.com>
Date: Tue, 11 Aug 2026 19:28:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-5-karthik.poosa@intel.com>
 <340a1b72-72a7-420e-a816-9233f014f9a5@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <340a1b72-72a7-420e-a816-9233f014f9a5@intel.com>
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CYYPR11MB8305:EE_
X-MS-Office365-Filtering-Correlation-Id: e209fa04-4c15-4091-de58-08def7b0a2f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|6133799003|10067099003|56012099006|11063799006|8096899003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ckwnMAxjLtEIMfRqM0IpY9aBcKQjSKeHVjiWDJyJXrb+xlsK/jq4vqP8RChBRMsy4XtQ8Tgk/aQ2ggLzahe1gUTXvzd1IcYnLY1brhbaUTm8JebbJeKxDrxvrHJHfMxLXLWTURe3eCytS9Gs6iX9MzvsMuLL+bx5UQm9O1E9z2HIhsKX9jv9V3qGTkiiOj78krS+kp960yGEJzcJn2Ifd6udgzOKJ48iInMSAf/KljOyFCAHoMJ06bhabRzQeAVc8s0wj2C6EQ8uV62TN7NeXWVpxiF3hFKGkgDxzjd7UhxQlR+X27vf980Midwd+T/9NM+D7YYUqeaFyYWd0aRUURvgIX9GyNX9hgjNh4p8U1PtaFmRwTdVf2ZNRAGTUMOJdLy3fjxsX/jOB2A0EqkAPqOzVAvTQmqjv6I5d2/7ZoWEVWPu4B1pmumgTWFuIEWvyNPQhMP9p4pzoIPAGHgYLftbRZphPWerP/bWlR6EJyTmfHWeB6Sk6xdkSsMg9rq/i+hP5hVtdDyIpltNlXIhqRsrSVBrlcbSQc07wSC1m2k2FIcxf5LGM+9cSgOEgeeyIlxiON3RtIEZQM49vnRrS2vpfpIc80CexGw+Pp65Ux2g5sMtXPQDoQ8clzV3JuIEASbQLQQzLMOTIY/E4OJ5Iljw7euGtKj4U3RPR5KjOzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006)(8096899003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmg1MmRoTDhTY1drdmhEb1FpNXJxOVRhazNiRkRwS0ZBYyt6a3lSR2RxZjVZ?=
 =?utf-8?B?Mk02MTdhaTFhSDNwTURTR1pwTDF3UDVsbjZmMlBDK01ocThNMEFIQXlmQ3ll?=
 =?utf-8?B?b3dRdnIxck5vNzFtV0pUcUZrbS9OQ0NTR2lleEh2Vk1DTUE3N25XNC9VTTQr?=
 =?utf-8?B?cFFxZTFXd2VuZ2t2a1NmK3Z5WW1qQ1hVcE95b0ZUMkxhWGNGQTRHdXhPOWlR?=
 =?utf-8?B?Vks4b0pYRXJpT04zYSszMURQaW12TExhSEF5SUhTQXl4NXdqc0FFQkkxeEJH?=
 =?utf-8?B?Tk11QTVQR0E4OXlKUlc2MzRNbHp0WTdYN3E2ZTdZUlg1dlRlQkQ2d29JeDZo?=
 =?utf-8?B?STNQMjk4RFAvRjZnRmcxZFUrTHpkazlwUlJpL0xUeHJJNkcrdUovalJaOXF2?=
 =?utf-8?B?UENJdndCNmdURGdyM2MxbGVEUW9kUFpDaUVCSkk5ZUNTYUJCQzY2NGg0SE9F?=
 =?utf-8?B?MVBzaTRzbjVlTWY0djNNUjZVSHRtL0dzUXZldHdQYkd3d3lrM1hybGhWdm51?=
 =?utf-8?B?U1dTSzRrUXRIWXlOZ2MzOGxNZWkwMHczNEhaMm9Gd2ZielZWYXJSdnkveEhx?=
 =?utf-8?B?UEJlMjRZbENEWmlOamtVd0tzMkRHRVFWUzdGcFFuRFdUZkpPTFBML1loRkh3?=
 =?utf-8?B?THg3ckM0bmR4U0FhWk9ZbWNnemdDWEQzcHZGUUJKTFRUTytmb3JuOHlSdk1m?=
 =?utf-8?B?SlNSS0o4d0IyOHI1bUlVZTJIRDI5UUF1VkJWd0ZhNzg2YzhwbFJLWmZjL2Q5?=
 =?utf-8?B?TnNETnVVaTlhenpOSTY5VzRFRGFkcDA3KzQvQmR3RDRaMWI3ZnFmeFVBQkhE?=
 =?utf-8?B?Q3ROYXY0MGJ0dFBzWDJDOXI4UXJ2dnMwMGROS2xkbmZVSEJ1dDdSZkRiNmRJ?=
 =?utf-8?B?WlJTeTluMjcrS21uYXVNa3Zva002Y2FCNi9UUTUrNVlXWGxoTjBEZVZhaHhX?=
 =?utf-8?B?QjgwTGRONVVxa09uS1Z0RGJuNkZkOXVkcVoyTlNOTE44YUpMUWhPRFVET0Qy?=
 =?utf-8?B?QVMzSEpKZnFpbkErSFlPWDdQa1VVR0gwNS83ZnZ0R0h0WHJLcEU3Qk93RGxa?=
 =?utf-8?B?dWFDd1VuNE9qYWR1czIyMm5VSnZQODlhRHo4ejFsMzB5c1FsdllJc3hYbkEv?=
 =?utf-8?B?aGdCaTRMRXQzUHNiVk5yMEtOZFlEUkFSaDNRaTFKbElIeTFrekJoK0I3NjJ4?=
 =?utf-8?B?WjZQTWpPcUp5bDkyeE5ZU1NkMml0WDgxNlVoYWhDeFRaTlhaZ1FrM09qeU9Y?=
 =?utf-8?B?TVM1QmEvTEc0SDdMb3ROdncyQTY4MWV4b29VVWNaWW5QT0JUNmFSVWJrMzdw?=
 =?utf-8?B?RHRyaU8wNm1HRjJYQTFHdVVvRjlham1wd3BrMnFTQWxJVU4vb0RQUU1FbE1I?=
 =?utf-8?B?aFowN05kZ2ROYzA0c2NpVmdrdXMzYk1Ub2Frdnp4a0xtYUdWc1BBVTdPOEtt?=
 =?utf-8?B?UnE5Nmh1WTdjdnhRMGRmd0hDOFNJNFNpUm1MS2E5dXRHK2RZemVMNE5lRXVn?=
 =?utf-8?B?UjIvanZEZWk3dCtMSHZDUlhLM2lnbmF4Z3VPWkFqZk03SGczUzJ5NFRqdy81?=
 =?utf-8?B?NnRpYUdXN0pYNGZMSHFaaXkweUQrdkJ4UFd0aXBPTytQb1JqRkF6ZklHOVlS?=
 =?utf-8?B?OXY1VXNaUkwvdUJFZkJMTGJaQmIxT3NNS3g4TjRhTS8wNXFnaFI1VEVVM1BJ?=
 =?utf-8?B?YlV3ZnhaNVhKdEhEbnNGanZXQmFsUXE4ellOVGNpUXFUWHhWVG4yUkVxREZU?=
 =?utf-8?B?WlNucUN6cUJ4STdLUVUrVWJtUlJqUFFWOWxDUmM2QUFOakNTNlBTR3M1STd1?=
 =?utf-8?B?czJsRm85WXVNY1VyNEpDUGNtM3lFakVyNWExTUdHK1NaYi9lUEkwTFRSS1du?=
 =?utf-8?B?cExERTRKdThtMEkxSzRXRmZtc3FtWEJvWjFIRGJ2WjJzd1gxWUVrOHRhOWhj?=
 =?utf-8?B?VFNoTExFODJnNDRoSTU5SXRreTFjZWtITWM2ZEhpZGlqdVZQN0crL2VCdjVR?=
 =?utf-8?B?YWRyeHIvN0NXMk81akNxWFRBK2hQbGVKdXlPSGxWTWpkenBjS0RHTWFVQmd6?=
 =?utf-8?B?M1FFKy9DbWUvNTliQ1UrZExPQ3FCVHhZK2NmQzFQS1F2Tk1nZFNhOVZzUWhK?=
 =?utf-8?B?NVMzanpJMzZETHMrSUROQmU1U3pEV3BoeUZmWW9IR2crMWk5V1pRbUxnbTRz?=
 =?utf-8?B?Q1MvQTZpSXdFbk56TVAwbUlyRnpVL1dCL3NuQm1KNVlySzFpZUdtSE1Wb0hz?=
 =?utf-8?B?MjdRYzgrWkc1T1BYd3Jza0UyQXZZcStheldxYTRSdjhWeGxjbjN4azNwWU56?=
 =?utf-8?B?b1ZvclF0MFJ2VGRBUlpEWlFVOUNad0JLMGthcjh3c2VkbSthN2Rtdz09?=
X-Exchange-RoutingPolicyChecked: e/e1CrNgugj9CV5WXmV4nvZ50OyabUGqu2sdXYmRAXRUb4DQg9BJnHz3Cc3QCCTClhMu6MlNsGFRF9hbv93RbON6Hi9zAs130D7HjdlPnyuthkBcQRUxIwKjUNpsA+A5KrFpswR1imeu9XdBXXCqqsp4Hb5uw71KGGiUv6DC7ir8+gsnIM7vKglFfvjg4+8l1S10nfX34DSu4K5nzW68z2dO64DcgWPnYQ75QTkyondr0JfAL9is49FNl8tZpWHuiWvCrQKGU3rseW3baitbKs+UsMTVZwe+7+huVIsAfWM2kKUmUTAGvFaDqOsG8pZOGUPkd+kwF0Z3dvJk23dzdQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e209fa04-4c15-4091-de58-08def7b0a2f9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:58:35.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GxGh1J/qWeKZ5+rH4Bcg+fcWIIb3a40TiPqy9dzbKd3JVRT7QGXT0wB/BSJp88By4jBVUzuwdRDVXCnmd80zKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
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

--------------EJsFH6hmRmpwohMGL3SrHojl
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 24-07-2026 12:32, Purkait, Soham wrote:
> Hi Karthik,
>
> On 17-07-2026 09:47, Karthik Poosa wrote:
>> Expose pwm[1-3] fan duty attributes through hwmon.
>>
>> This enables reading and writing user PWM values (0..255) for each
>> available fan channel.
>>
>> Update Xe hwmon ABI documentation for pwm[1-3].
>>
>> This sysfs node can be used for manual control of fan speed,
>> irrespective of fan curve.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Avoid use hwmon->num_fans to get fan count in 
>> xe_hwmon_pwm_is_visible().
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: Codex:gpt-5-4
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>>   3 files changed, 242 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index ec0b94d76e22..7383898890aa 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -321,3 +321,12 @@ Description:    RW. Package burst power limit 
>> interval (Tau in PL2/Tau) in
>>           milliseconds over which sustained power is averaged.
>>             Only supported for particular Intel Xe graphics platforms.
>> +
>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
>> +Date:           July 2026
>> +KernelVersion:  7.2
>> +Contact: intel-xe@lists.freedesktop.org
>> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 
>> is zero
>> +                fan speed and 255 is 100% fan speed.
>> +
>> +                Only supported for particular Intel Xe graphics 
>> platforms.
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 769f4d1da83e..d3379727b1a9 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>>       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, 
>> HWMON_F_INPUT | HWMON_F_MAX,
>>                  HWMON_F_INPUT | HWMON_F_MAX),
>> +    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, 
>> HWMON_PWM_INPUT),
>>       NULL
>>   };
>>   @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct 
>> xe_hwmon *hwmon, u32 *num_fans)
>>       return 0;
>>   }
>>   +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 
>> fan, u32 *point_count,
>> +                    int table_type)
>> +{
>> +    int ret;
>> +
>> +    ret = xe_hwmon_pcode_read_fan_control(hwmon,
>> +                          (table_type == USER_FAN_TABLE) ?
>> +                          FSC_READ_USER_FAN_CONTROL_POINTS :
>> +                          FSC_READ_STOCK_FAN_CONTROL_POINTS,
>> +                          fan, point_count);
>> +    if (ret) {
>> +        xe_err(hwmon->xe, "failed to read fan %d %s point count, 
>> ret=%d\n", fan,
>> +               (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
>> +        return ret;
>> +    }
>> +
>> +    xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>> +           (table_type == USER_FAN_TABLE) ? "user" : "stock", 
>> *point_count);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 
>> fan, u8 point, u8 temp,
>> +                     u8 speed)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
>> +             FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
>> +    int ret;
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_FAN_TABLE, fan),
>> +                    (u32)user_fcp_raw, 
>> XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret)
>> +        xe_dbg(hwmon->xe,
>> +               "failed to write fan %d user point %d temp %u, speed 
>> %u %%, ret=%d\n",
>> +               fan, point, temp, speed, ret);
>> +
>> +    return ret;
>> +}
>> +
>> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, 
>> u8 fan,
>> +                        bool is_full_speed, enum fan_table_type 
>> table_source)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count;
>> +    int ret;
>> +    int point;
>> +    struct fan_table *source_table = &fi->fan_table[table_source];
>> +
>> +    xe_dbg(hwmon->xe, "activating fan %d user table from %s 
>> table\n", fan,
>> +           (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +
>> +    point_count = source_table->fan_control_point_count;
>> +
>> +    if (!point_count) {
>> +        xe_err(hwmon->xe,
>> +               "fan %d %s table point count is 0, cannot activate 
>> user table\n", fan,
>> +               (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +        return -ENODATA;
>> +    }
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = source_table->fcp[point].temp;
>> +        u8 speed = is_full_speed ? 100 : max_t(u8, 
>> source_table->fcp[point].speed,
>> +                        min_t(u32, fi->min_pwm, U8_MAX));
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> speed);
>> +        if (ret)
>> +            return ret;
>> +
>> +        if (table_source == STOCK_FAN_TABLE) {
>> +            /* Update user table cache with stock table values */
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +        }
>> +        if (is_full_speed)
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
>> +    }
>> +
>> +    ret = xe_pcode_write_timeout(root_tile,
>> +                     PCODE_MBOX(FAN_SPEED_CONTROL,
>> +                        FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to write fan %d user table, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Verify if all the user points are set */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret) {
>> +        xe_err(hwmon->xe,
>> +               "failed to read fan %d user table point count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    if (point_count != source_table->fan_control_point_count) {
>> +        xe_err(hwmon->xe, "fan %d user table point count mismatch, 
>> expected %u, got %u\n",
>> +               fan, source_table->fan_control_point_count, 
>> point_count);
>> +        return -EIO;
>> +    }
>> +
>> +    fi->fan_table[USER_FAN_TABLE].fan_control_point_count = 
>> point_count;
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, 
>> u8 pwm)
>> +{
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    u32 point_count = 
>> fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
>> +    u8 clamped_pwm;
>> +    int ret;
>> +    int point;
>> +
>> +    /* Read user table fan point count, if it is not set, activate 
>> the user table */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!point_count) {
>> +        xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", fan);
>> +        ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, 
>> STOCK_FAN_TABLE);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +
>> +    pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>> +    clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
> What is the use of this clamping logic? as the pwm is in percentage 
> already.

Clamping ensures that the PWM value requested by the user is not lower 
than the minimum PWM supported by the hardware, preventing fan buzzing 
or stalling.

>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
>> +
>> +        ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, 
>> clamped_pwm);
>> +        if (ret)
>> +            return ret;
>> +
>> +        fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
>> +    }
>> +
>> +    ret = xe_pcode_write(root_tile,
>> +                 PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
>> +                 point_count);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to update fan %d user table count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon 
>> *hwmon, u32 attr, int channel)
>>       }
>>   }
>>   +static umode_t
>> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>> +{
>> +    if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
>> +        return 0;
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        return 0644;
>> +    default:
>> +        return 0;
>> +    }
>> +}
>> +
>>   static int
>>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long 
>> *val)
>>   {
>> @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>       }
>>   }
>>   +static int
>> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long *val)
>> +{
>> +    struct xe_hwmon_fan_info *fi;
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    fi = &hwmon->fi[channel];
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        /* Check if user fan table is set else activate it.*/
>> +        if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
>> +            xe_dbg(hwmon->xe, "fan %d user table not set, activating 
>> it\n", channel);
>> +            ret = xe_hwmon_activate_user_fan_table(hwmon, channel, 
>> false,
>> +                                   STOCK_FAN_TABLE);
>> +            if (ret)
>> +                return ret;
>> +        }
>> +        *val = 
>> DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
>> +                        U8_MAX,    100);
>> +        return 0;
>> +    default:
>> +        return -EOPNOTSUPP;
>> +    }
>> +}
>> +
>> +static int
>> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long val)
>> +{
>> +    int ret = 0;
>> +
>> +    if (channel < 0 || channel >= FAN_MAX)
>> +        return -EINVAL;
>> +
>> +    mutex_lock(&hwmon->hwmon_lock);
>> +
>> +    switch (attr) {
>> +    case hwmon_pwm_input:
>> +        if (val < 0 || val > U8_MAX) {
>> +            ret = -EINVAL;
>> +            break;
>> +        }
>> +        ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +        break;
>> +    default:
>> +        ret = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +    mutex_unlock(&hwmon->hwmon_lock);
>> +
>> +    return ret;
>> +}
>> +
>>   static umode_t
>>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>>               u32 attr, int channel)
>> @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum 
>> hwmon_sensor_types type,
>>       case hwmon_fan:
>>           ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>>           break;
>> +    case hwmon_pwm:
>> +        ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
>> +        break;
>>       default:
>>           ret = 0;
>>           break;
>> @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_energy_read(hwmon, attr, channel, val);
>>       case hwmon_fan:
>>           return xe_hwmon_fan_read(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum 
>> hwmon_sensor_types type, u32 attr,
>>           return xe_hwmon_power_write(hwmon, attr, channel, val);
>>       case hwmon_curr:
>>           return xe_hwmon_curr_write(hwmon, attr, channel, val);
>> +    case hwmon_pwm:
>> +        return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>>       default:
>>           return -EOPNOTSUPP;
>>       }
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h 
>> b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index 419ab4f416fa..5c5fdc650a97 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -84,9 +84,12 @@
>>   #define     PCODE_MBOX_DOMAIN_HBM        0x2
>>     #define   FAN_SPEED_CONTROL            0x7D
>> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS    0x0
>> +#define     FSC_WRITE_FAN_TABLE            0x1
>>   #define     FSC_READ_MAX_FAN_RPS        0x3
>>   #define     FSC_READ_NUM_FANS            0x4
>>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS    0x5
>> +#define     FSC_READ_USER_FAN_CONTROL_POINTS    0x6
>>   #define     FSC_READ_FAN_TABLE            0x7
>>   #define     FAN_CONTROL_POINT_TEMP_MASK        REG_GENMASK(7, 0)
>>   #define     FAN_CONTROL_POINT_SPEED_MASK    REG_GENMASK(15, 8)
--------------EJsFH6hmRmpwohMGL3SrHojl
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-07-2026 12:32, Purkait, Soham
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:340a1b72-72a7-420e-a816-9233f014f9a5@intel.com">Hi
      Karthik,
      <br>
      <br>
      On 17-07-2026 09:47, Karthik Poosa wrote:
      <br>
      <blockquote type="cite">Expose pwm[1-3] fan duty attributes
        through hwmon.
        <br>
        <br>
        This enables reading and writing user PWM values (0..255) for
        each
        <br>
        available fan channel.
        <br>
        <br>
        Update Xe hwmon ABI documentation for pwm[1-3].
        <br>
        <br>
        This sysfs node can be used for manual control of fan speed,
        <br>
        irrespective of fan curve.
        <br>
        <br>
        v2:
        <br>
        &nbsp; - Use xe helpers for dmesg logs.
        <br>
        &nbsp; - Avoid use hwmon-&gt;num_fans to get fan count in
        xe_hwmon_pwm_is_visible().
        <br>
        <br>
        Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com">&lt;karthik.poosa@intel.com&gt;</a>
        <br>
        Assisted-by: Codex:gpt-5-4
        <br>
        ---
        <br>
        &nbsp; .../ABI/testing/sysfs-driver-intel-xe-hwmon&nbsp;&nbsp; |&nbsp;&nbsp; 9 +
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_hwmon.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 230
        ++++++++++++++++++
        <br>
        &nbsp; drivers/gpu/drm/xe/xe_pcode_api.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +
        <br>
        &nbsp; 3 files changed, 242 insertions(+)
        <br>
        <br>
        diff --git
        a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
        b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
        <br>
        index ec0b94d76e22..7383898890aa 100644
        <br>
        --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
        <br>
        +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
        <br>
        @@ -321,3 +321,12 @@ Description:&nbsp;&nbsp;&nbsp; RW. Package burst power
        limit interval (Tau in PL2/Tau) in
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; milliseconds over which sustained power is averaged.
        <br>
        &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only supported for particular Intel Xe graphics
        platforms.
        <br>
        +
        <br>
        +What:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        /sys/bus/pci/drivers/xe/.../hwmon/hwmon&lt;i&gt;/pwm[1-3]
        <br>
        +Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; July 2026
        <br>
        +KernelVersion:&nbsp; 7.2
        <br>
        +Contact:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
        <br>
        +Description:&nbsp;&nbsp;&nbsp; RW. Target fan PWM duty value in the range
        0..255. 0 is zero
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan speed and 255 is 100% fan speed.
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Only supported for particular Intel Xe graphics
        platforms.
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
        b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        index 769f4d1da83e..d3379727b1a9 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_hwmon.c
        <br>
        @@ -803,6 +803,7 @@ static const struct hwmon_channel_info *
        const hwmon_info[] = {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL,
        HWMON_E_INPUT | HWMON_E_LABEL),
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX,
        HWMON_F_INPUT | HWMON_F_MAX,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HWMON_F_INPUT | HWMON_F_MAX),
        <br>
        +&nbsp;&nbsp;&nbsp; HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT,
        HWMON_PWM_INPUT),
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL
        <br>
        &nbsp; };
        <br>
        &nbsp; @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const
        struct xe_hwmon *hwmon, u32 *num_fans)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        &nbsp; }
        <br>
        &nbsp; +static int xe_hwmon_get_fan_point_count(struct xe_hwmon
        *hwmon, u8 fan, u32 *point_count,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int table_type)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_hwmon_pcode_read_fan_control(hwmon,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table_type == USER_FAN_TABLE) ?
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_USER_FAN_CONTROL_POINTS :
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_STOCK_FAN_CONTROL_POINTS,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan, point_count);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(hwmon-&gt;xe, &quot;failed to read fan %d %s point
        count, ret=%d\n&quot;, fan,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table_type == USER_FAN_TABLE) ? &quot;user&quot; :
        &quot;stock&quot;, ret);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;fan %d %s point count read as %u\n&quot;,
        fan,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table_type == USER_FAN_TABLE) ? &quot;user&quot; : &quot;stock&quot;,
        *point_count);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static int xe_hwmon_write_user_fan_point(struct xe_hwmon
        *hwmon, u8 fan, u8 point, u8 temp,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 speed)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_tile *root_tile =
        xe_device_get_root_tile(hwmon-&gt;xe);
        <br>
        +&nbsp;&nbsp;&nbsp; u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK,
        temp) |
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_pcode_write_timeout(root_tile,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCODE_MBOX(FAN_SPEED_CONTROL,
        FSC_WRITE_FAN_TABLE, fan),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (u32)user_fcp_raw,
        XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;failed to write fan %d user point %d temp %u,
        speed %u %%, ret=%d\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan, point, temp, speed, ret);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +}
        <br>
        +
        <br>
        +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon
        *hwmon, u8 fan,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool is_full_speed, enum fan_table_type
        table_source)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_tile *root_tile =
        xe_device_get_root_tile(hwmon-&gt;xe);
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
        <br>
        +&nbsp;&nbsp;&nbsp; u32 point_count;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +&nbsp;&nbsp;&nbsp; int point;
        <br>
        +&nbsp;&nbsp;&nbsp; struct fan_table *source_table =
        &amp;fi-&gt;fan_table[table_source];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;activating fan %d user table from %s
        table\n&quot;, fan,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table_source == USER_FAN_TABLE) ? &quot;user&quot; :
        &quot;stock&quot;);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; point_count = source_table-&gt;fan_control_point_count;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!point_count) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(hwmon-&gt;xe,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;fan %d %s table point count is 0, cannot
        activate user table\n&quot;, fan,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (table_source == USER_FAN_TABLE) ? &quot;user&quot; :
        &quot;stock&quot;);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENODATA;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; for (point = 0; point &lt; point_count; point++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 temp = source_table-&gt;fcp[point].temp;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 speed = is_full_speed ? 100 : max_t(u8,
        source_table-&gt;fcp[point].speed,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_t(u32, fi-&gt;min_pwm, U8_MAX));
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_write_user_fan_point(hwmon, fan, point,
        temp, speed);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (table_source == STOCK_FAN_TABLE) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Update user table cache with stock table values
        */
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi-&gt;fan_table[USER_FAN_TABLE].fcp[point].temp =
        temp;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi-&gt;fan_table[USER_FAN_TABLE].fcp[point].speed =
        speed;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (is_full_speed)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi-&gt;fan_table[USER_FAN_TABLE].fcp[point].speed =
        speed;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_pcode_write_timeout(root_tile,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCODE_MBOX(FAN_SPEED_CONTROL,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; point_count,
        XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;failed to write fan %d user
        table, ret=%d\n&quot;, fan, ret);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Verify if all the user points are set */
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_hwmon_get_fan_point_count(hwmon, fan,
        &amp;point_count, USER_FAN_TABLE);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(hwmon-&gt;xe,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;failed to read fan %d user table point count,
        ret=%d\n&quot;, fan, ret);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; if (point_count !=
        source_table-&gt;fan_control_point_count) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_err(hwmon-&gt;xe, &quot;fan %d user table point count
        mismatch, expected %u, got %u\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fan, source_table-&gt;fan_control_point_count,
        point_count);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EIO;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; fi-&gt;fan_table[USER_FAN_TABLE].fan_control_point_count =
        point_count;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8
        fan, u8 pwm)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_tile *root_tile =
        xe_device_get_root_tile(hwmon-&gt;xe);
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_hwmon_fan_info *fi = &amp;hwmon-&gt;fi[fan];
        <br>
        +&nbsp;&nbsp;&nbsp; u32 point_count =
        fi-&gt;fan_table[USER_FAN_TABLE].fan_control_point_count;
        <br>
        +&nbsp;&nbsp;&nbsp; u8 clamped_pwm;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret;
        <br>
        +&nbsp;&nbsp;&nbsp; int point;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; /* Read user table fan point count, if it is not set,
        activate the user table */
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_hwmon_get_fan_point_count(hwmon, fan,
        &amp;point_count, USER_FAN_TABLE);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (!point_count) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;fan %d user table not set,
        activating it\n&quot;, fan);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_activate_user_fan_table(hwmon, fan,
        false, STOCK_FAN_TABLE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
        <br>
        +&nbsp;&nbsp;&nbsp; clamped_pwm = max_t(u8, pwm, min_t(u32, fi-&gt;min_pwm,
        U8_MAX));
        <br>
      </blockquote>
      What is the use of this clamping logic? as the pwm is in
      percentage already.
      <br>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
      <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Clamping
        ensures that the PWM value requested by the user is not lower
        than the minimum PWM supported by the hardware, preventing fan
        buzzing or stalling.</div>
    </p>
    <blockquote type="cite" cite="mid:340a1b72-72a7-420e-a816-9233f014f9a5@intel.com">
      <blockquote type="cite">+
        <br>
        +&nbsp;&nbsp;&nbsp; for (point = 0; point &lt; point_count; point++) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 temp =
        fi-&gt;fan_table[USER_FAN_TABLE].fcp[point].temp;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_write_user_fan_point(hwmon, fan, point,
        temp, clamped_pwm);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi-&gt;fan_table[USER_FAN_TABLE].fcp[point].speed =
        clamped_pwm;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; ret = xe_pcode_write(root_tile,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PCODE_MBOX(FAN_SPEED_CONTROL,
        FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; point_count);
        <br>
        +&nbsp;&nbsp;&nbsp; if (ret) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;failed to update fan %d user
        table count, ret=%d\n&quot;, fan, ret);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static int xe_hwmon_read_fan_control_info(struct xe_hwmon
        *hwmon)
        <br>
        &nbsp; {
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_tile *root_tile =
        xe_device_get_root_tile(hwmon-&gt;xe);
        <br>
        @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon
        *hwmon, u32 attr, int channel)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; +static umode_t
        <br>
        +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int
        channel)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; if (!hwmon-&gt;xe-&gt;info.has_fan_control || channel &gt;=
        hwmon-&gt;num_fans)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; switch (attr) {
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm_input:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0644;
        <br>
        +&nbsp;&nbsp;&nbsp; default:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static int
        <br>
        &nbsp; xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel,
        long *val)
        <br>
        &nbsp; {
        <br>
        @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon,
        u32 attr, int channel, long *val)
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        &nbsp; }
        <br>
        &nbsp; +static int
        <br>
        +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int
        channel, long *val)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; struct xe_hwmon_fan_info *fi;
        <br>
        +&nbsp;&nbsp;&nbsp; int ret = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (channel &lt; 0 || channel &gt;= FAN_MAX)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; fi = &amp;hwmon-&gt;fi[channel];
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; switch (attr) {
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm_input:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Check if user fan table is set else activate it.*/
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if
        (!fi-&gt;fan_table[USER_FAN_TABLE].fan_control_point_count) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_dbg(hwmon-&gt;xe, &quot;fan %d user table not set,
        activating it\n&quot;, channel);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_activate_user_fan_table(hwmon,
        channel, false,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STOCK_FAN_TABLE);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *val =
        DIV_ROUND_CLOSEST(fi-&gt;fan_table[USER_FAN_TABLE].fcp[0].speed
        *
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; U8_MAX,&nbsp;&nbsp;&nbsp; 100);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;
        <br>
        +&nbsp;&nbsp;&nbsp; default:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EOPNOTSUPP;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +}
        <br>
        +
        <br>
        +static int
        <br>
        +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int
        channel, long val)
        <br>
        +{
        <br>
        +&nbsp;&nbsp;&nbsp; int ret = 0;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; if (channel &lt; 0 || channel &gt;= FAN_MAX)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EINVAL;
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_lock(&amp;hwmon-&gt;hwmon_lock);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; switch (attr) {
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm_input:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (val &lt; 0 || val &gt; U8_MAX) {
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EINVAL;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_set_user_fan_pwm(hwmon, channel,
        (u8)val);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; default:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = -EOPNOTSUPP;
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; }
        <br>
        +&nbsp;&nbsp;&nbsp; mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
        <br>
        +
        <br>
        +&nbsp;&nbsp;&nbsp; return ret;
        <br>
        +}
        <br>
        +
        <br>
        &nbsp; static umode_t
        <br>
        &nbsp; xe_hwmon_is_visible(const void *drvdata, enum
        hwmon_sensor_types type,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 attr, int channel)
        <br>
        @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata,
        enum hwmon_sensor_types type,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case hwmon_fan:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = 0;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;
        <br>
        @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum
        hwmon_sensor_types type, u32 attr,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_energy_read(hwmon, attr, channel,
        val);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case hwmon_fan:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_fan_read(hwmon, attr, channel, val);
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_pwm_read(hwmon, attr, channel, val);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EOPNOTSUPP;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum
        hwmon_sensor_types type, u32 attr,
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_power_write(hwmon, attr, channel,
        val);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case hwmon_curr:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_curr_write(hwmon, attr, channel, val);
        <br>
        +&nbsp;&nbsp;&nbsp; case hwmon_pwm:
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_hwmon_pwm_write(hwmon, attr, channel, val);
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EOPNOTSUPP;
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h
        b/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        index 419ab4f416fa..5c5fdc650a97 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
        <br>
        @@ -84,9 +84,12 @@
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; PCODE_MBOX_DOMAIN_HBM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x2
        <br>
        &nbsp; &nbsp; #define&nbsp;&nbsp; FAN_SPEED_CONTROL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x7D
        <br>
        +#define&nbsp;&nbsp;&nbsp;&nbsp; FSC_WRITE_NUM_FAN_CONTROL_POINTS&nbsp;&nbsp;&nbsp; 0x0
        <br>
        +#define&nbsp;&nbsp;&nbsp;&nbsp; FSC_WRITE_FAN_TABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_MAX_FAN_RPS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x3
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_NUM_FANS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x4
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_STOCK_FAN_CONTROL_POINTS&nbsp;&nbsp;&nbsp; 0x5
        <br>
        +#define&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_USER_FAN_CONTROL_POINTS&nbsp;&nbsp;&nbsp; 0x6
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FSC_READ_FAN_TABLE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x7
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FAN_CONTROL_POINT_TEMP_MASK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REG_GENMASK(7,
        0)
        <br>
        &nbsp; #define&nbsp;&nbsp;&nbsp;&nbsp; FAN_CONTROL_POINT_SPEED_MASK&nbsp;&nbsp;&nbsp; REG_GENMASK(15, 8)
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------EJsFH6hmRmpwohMGL3SrHojl--
