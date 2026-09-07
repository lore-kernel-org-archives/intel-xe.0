Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2C6C79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 06:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1660810E456;
	Mon,  7 Sep 2026 06:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="msgiUv5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A4E110E456
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788762681; x=1820298681;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=YhObrxg1LIVnJAEgqI7XqUk5Js9roE6OyxSBNdPFX9k=;
 b=msgiUv5Bp4zeImgmq9cHqUswKSkTF9zk0myWvyjCAYejR9Nl8UYAB0d/
 pzODgXyM6DaJcZ7sHiyzp+c2H9YTn9s3ECNmHEG/fJeiq6jhpcSfZBW5A
 p9i19aqWVTk0maVPlf5KTnrlaUbnLlha6ESX5YUYcEkORdO4z+alAbmPE
 TDaY5gCMlsYi0fxm5raoEWXXufbG/+MlnTMGYBXbCHNJtq/jddIeDtXSX
 4WktTVcObmoQQ6DUs1abw9E4UNOoVw+k8BhfGF2/YQPAppc44oyE5aEAS
 hwvIu6/Lhx+Ub1Ev3rSfO3RDvO9tAB6Ug2TeqwmP+Mz4CY04dqcoba47k Q==;
X-CSE-ConnectionGUID: kqKELPELTRu6dANkhnpCcA==
X-CSE-MsgGUID: OtIMzW4UTJ+3rVIS40Y71g==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88921692"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="88921692"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:31:21 -0700
X-CSE-ConnectionGUID: HEvltSVYSte+8L8OLl1Sag==
X-CSE-MsgGUID: IesLRM7ERPmcfLWp1P1pPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="295488909"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 23:31:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 23:31:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 6 Sep 2026 23:31:20 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 6 Sep 2026 23:31:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLTX6GSKo23gZOkvGbFb/JXbrctYr4kOkNz4GSXDzm1tkQ4d4mMHKcYltz5T7U5LEEOCsj1IbYEJvW5w/51GOy0f1Dn8BAdw0wDB0g6KgRZpLUIAOjcHfMEF4I6065pMdTp5OnUKEjYGXt1YnlpQhyxeD1hafha4K/WpcjVtrBJxRxVy+lIlOIMVWce0z+UW7P0OjBxxUNr41RWm8oTjR4nWSxLrcwKrm6nXjSM9cNG0zSZwXbi5PjZIGffVI+jYesyIuKNEUGzRI6+61PctfVJo07c88GLi7o/OEQAzcb9YlWoqbS0a/4EzhZD+zyq+XcyR+XFohI6iuXRWzZub2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxxTMHBLtiakQqVdnWpVTQ8F82UoI2pVwYikxwqGzoE=;
 b=bq4T6dymzEgstwIyzQimTxZnxl+nEGCyUv4hJMwKD3nsrHTAwKsAdhmd7SJp9PHNIiVkKqFNOejZpVTHIqt1jNi95/SI/pXBH9W0cYWMbKm6H012ONsC4mi55t/7qF7AvKR1Ro9qyiGfXR2ODz9XtMB0YGeXYUzcP0M6jVIDHgnnGJwDPazMiQ+xwEWwFN+phxEO4kwvSmcLUf34Rovps5clFGanG6Cg509eMH7JuFqmnPc/VWA0OT7vTEY21YgYI2DgnAAl9yY6tgzoD5omVB1Q4upC+nncHQCs2ygApY8nCLAdbtuZwUcBlt40ENfgD9g62BfAIRHLutT6Z05Agw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9399.namprd11.prod.outlook.com (2603:10b6:208:577::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.15; Mon, 7 Sep 2026 06:31:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 06:31:17 +0000
Message-ID: <d4906b36-bdf1-47df-9876-7fe86ddc4fc3@intel.com>
Date: Mon, 7 Sep 2026 12:01:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [RFC PATCH 2/5] drm/xe/xe_ras: Handle page offline requests
 for device memory ecc errors
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
References: <20260825063615.3697317-7-riana.tauro@intel.com>
 <20260825063615.3697317-9-riana.tauro@intel.com>
 <0ef3ec26-7426-42e1-95a1-532dd5cffed4@intel.com>
 <SJ2PR11MB7619EA09682C7DE8C0A603128CB22@SJ2PR11MB7619.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <SJ2PR11MB7619EA09682C7DE8C0A603128CB22@SJ2PR11MB7619.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b823390-3a15-4b60-de76-08df0ca99f1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003|13003099007;
X-Microsoft-Antispam-Message-Info: mmypljiq2+r+QTEvMHaa687H9OV0UjFmSReFx4LcXiAGIYVMgskKqdJvPAMnKgJZHrbw/azs+3J/1NkJ0JlHgX/kjBHlUTroyVRtlfsuhwR7Es/aQZrnaLL7jpfcTs8fElUeIP7XGH2lqkKQ+uNbDBAqQlz00hF8I/eXUOwNIR0C8quwaxftf9YbBm1r5uPfuPPP6QNeU3lPRTPSqE+XEyQ7VT+wTVaQGqbmxdSZaCG3aaSm6dWPIYQFTvjtQvf/Sg6niGTKODHaGFfATzAVBVvziT1GKUnU7im44pvlblEnT8adrk6s8VhODmrXZtzDwfLUEOTbIPiSoGVIWUg13c4GfsjT7ppsXBZseRMqcZxzCTf01kz7Njvj71E5tyHLtf+B9cMsE+0+We0SQ+6bh7ou/SYZcZTqI4lksS2dPt/efoom7Ec23+IflVRXPYd9Y4uMBTG+s7q7a30B9NlsGLtKGyW9kc6dV8nxO672Uf+iNYGVco/mEYbFNHZjlcBfcymXsxjLbtS1q8FAzF2/e7IB3tTtqns+pr0tY6gzW0HwGrXVVwlafOXrG9CdsXAEFYcu6ncPuunilUtySZMiGkecPu+fLCC7sb0N97svyOqw7QxoXgDsRaCQAtHaymG8WfEiR3ClbAkd6fQoawYtpDtYr4aY6lq5pd5+qaOsACs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3BBZmxSWEZsUXVUeU11SUx6Nk9FL1ZJN3hDeVpnK2tWSk5WRVVMU3IyUW9U?=
 =?utf-8?B?dUl4ekp4ejFmY24ycFlmNk1HM1ljS21LcFh3V0ZmN2NibkF4ZjJob2NZUDJB?=
 =?utf-8?B?Vk80Nlk4dTZDTTZNWmcvenluRUxTRGhRNmZzN3BmSllueGUxaE8rZjEveFVj?=
 =?utf-8?B?Wm9ubE0wV25DVEE3L1VXZ0g3NzgzS0J4VHgvYlJrSkxhWE4yM2VXek5xdUNk?=
 =?utf-8?B?ZGZnZ0FQMXZlZ0JwSGFhakVERCtueHVMSVJ4TnoxWEtGOHFnWGYwNG0vMnJ0?=
 =?utf-8?B?T29TclZpOXdvMkxRWm11SEtKV0twZ3FQL0lCT1Jzem1SZW9YQnFIczc3bHBz?=
 =?utf-8?B?d1VOSUR0aWYxdTdpaEJuTktOOFRMa1k1ZXZNWkVFWVgwTUxieXM1ZGNBa2t5?=
 =?utf-8?B?WVVxWEs0R3Qvb2xpdXNQcGRQU1lQSkRzZ3gycWFzcDhEYzNmZ3B5SXgxQllw?=
 =?utf-8?B?bUZHZVZuVjhCczV2cTg1Mkx6blJ6NHk2VGRBVDNzeEUvZnBLdmI3TFd4dlFT?=
 =?utf-8?B?RVNpYStLN1dTc0E1KzlqTlo3aHcxOUhmYXhWNlpYZkVJZ0Zhb01MQVFRdThB?=
 =?utf-8?B?YXhHWXh1TjVTTW1Tbkk0ZGVkckxnZkg2WXlJUDVHRzdHY0lVT3puSzh4MEdX?=
 =?utf-8?B?cnJsbGUyUjFVNFNhdXdQWGltVkNXcmZydXhScng4ZXRWcEVwdmZFL1laWGRJ?=
 =?utf-8?B?cm43dHRWOGE2Qmt5OWwvSmpYVDlRRnZObXUzaDFHOVR1QnRwOEY2REJmSkJm?=
 =?utf-8?B?WjFRMW9yZzhJV0doSHRTbTlERjRVVFF6VHpoemlpMGZLVU1CV09kQnJEdTJp?=
 =?utf-8?B?T21odVhDYUFaS3RHT3RoZjZyTDBjTS9kOTNWRVRQQU5nWkhURWhEWjJFZUlx?=
 =?utf-8?B?UXB2TTF4Smc2QWcycnc0dWppV0pZbU1HOU1IVDJPWmU4c05HYm1rWlFzWXcz?=
 =?utf-8?B?bXl2VGY2dTRKSU8ydjJNZ0Y2VVZBc2pEemovSjlJeTloMkd4RG9Kck4vY0p0?=
 =?utf-8?B?clhkNldTV0ZXaE9ZNytFeXdIQU1lOHdYZ2d2eSswYUxFVXNSS1VoSzBiVERq?=
 =?utf-8?B?c1htcFhmakJrbnhzYUt3SjlaUjZ4ZHFuS1NtRXJkK1ZMWTVaQkdBb1kzTU9a?=
 =?utf-8?B?OE1yQmJkNHNCMU00Z2FhcGVKVTZQbkFXZEFxV0ZjYmRGWWV4dVh5VGpwc1BC?=
 =?utf-8?B?cHdVb2hQQ1BBOXd6dHpxTXdPLzVxUWlrOTVQS25wR3hodzJHUGhmWTZNVnpO?=
 =?utf-8?B?L0xXWFVmcEJrcnJSaDh2UVB1b0JvYlZYZFV1WTh4cWZPTEx1SldoTWxOdUlw?=
 =?utf-8?B?cEpEcll4MHVha3NCeHg2ZnEyYWlGMnVBdFR0Rmx5eXdYejlZcUJUK29iQ0lv?=
 =?utf-8?B?SllRRjdoMUE3Z09aR3k4Z3dEYy9HVWkvbzN5RWtBNHpuNnVKZ1B0U3JWOHUv?=
 =?utf-8?B?azBvQWpPS2FubEd6Y0tYYkljaEh6Y2MycjVxN08zUG9tODEzTk9NSFBMTnVR?=
 =?utf-8?B?b1dsd0RFTEQ2Y0VYL0tHK3pWQ2EzYlVkUXU3OHNtSDZQdWVMNys5YkJjYVRR?=
 =?utf-8?B?SENra0FXWEVEaDExMjdzTXpsbTQ0R0JlYnBQemwvNlpwVlY0VldzbVM3T2dO?=
 =?utf-8?B?U3c4ZERhTVlEcStQbERKUlVpK2tBY0lJdFg3RDZYK1lHMGpXS1FVK0RtUjY1?=
 =?utf-8?B?cWNXVG0yMGV4amhMMU43ajQ5b2xJdG9CTUx5aXk4dlZYTVMvTjQ1aldlSUQ4?=
 =?utf-8?B?K1o3RHVQMVVlazIvZDZZYWkzcW1YSU9xYThwTWs1S1J0T0R1SDRtclhrNVcr?=
 =?utf-8?B?Y01JMndrYnRmd1pCVm5LbHFmekNmU1ova29FOU50OENEYUVuNENvN0pFQ2cy?=
 =?utf-8?B?cTBPR2dqczdnM1lDR28yNk9nWHJqV0kyZ1Q0Y2VscVlxZzdNVTc0YWc5bFJY?=
 =?utf-8?B?VWtIeWkwaE1xQjdKOENGVThEQmJjMkliRjB6SFBmMEVUWEdXV25hSW41UElI?=
 =?utf-8?B?aXE0TUpqNnAxR204ZDZiUUwzQlZVcEgrZndwMkpBcmxxS01DRCt1VTNrd3ov?=
 =?utf-8?B?Wmk0WnNhZzE0djFzZVlQZEFQQytLMzg1YVVvNzF0bCtBSmNYTy9Wekk3VWpY?=
 =?utf-8?B?cmN2MzJHaTNaMm03Wmtack9XckhqL3Vsem1mUFpNNjNWelVTNVhpQ1duTlEx?=
 =?utf-8?B?bVBQM01tSi9lb1NqY1pXZE4yWVJwQzVLc09jWlJZWXpKRFNhbWpxSG5ZSjgx?=
 =?utf-8?B?YXdaRzMveXltNnZFb3BMb1JDL3d3UnZlRktzc0M2MTlOakNtNUxHYjQvRWt5?=
 =?utf-8?B?YWY0Tk9JOCtiVWpscTNqbUVoalVrSHZuSFZYdFY4VmJiMzZLMVR0QT09?=
X-Exchange-RoutingPolicyChecked: o08V22Yt2OPZpsJ3K07Ysdy4XfmKTRCfHnlGpHKaGk3PewDj1LyAvYUteNA71YXcNwHB1xN/WsYLHDdMlP4eCUZklegPVErj/zS1Sxq0AFczZcUi2wUmNeJvMqUs3DfMJWDeDmm0B6+tzoKTV+UNAvNz2We/u3BXJn812eoU2uTFKwRSlt6YCWoWnCwTjQU5TLPPR9C3BkQAl/NOnq1EqNInMG18DfAJrGauPBfpiCIwfSmZWQ4AOU4CSllfmLqF8C5ma0TtBiENBhh0GD5iWWTr/5mZdAVUTKMwGW3SIzC+REkQmuYVok+wwl2yy+7oQqQG7GJ95a8049bkRVYKPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b823390-3a15-4b60-de76-08df0ca99f1e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 06:31:16.9699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sqTmHyMoEGhFSaOEbFgCoW69d6eiraBag6oYfH8krmCPsWiIy+cHqeKsEjpE7ca30VV/e3bCN0w5cEx1NNGvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9399
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

>
> On 8/25/2026 8:36 AM, Riana Tauro wrote:
>> This will be integrated with the related address-fault handling flow
>> once this patch is merged.
>> https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/
>> Sending for initial comments.
>>
>> Add basic support for sending page offline/decline requests to system
>> controller and use it for device memory ECC error handling.
>> Pages that belong to critical BOs cannot be handled by offlining and
>> require a SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are not marked as bad by
>> firmware.
>>
>> For all other valid page addresses, the first occurrence of error
>> indicates a poison error and the page is offlined only by software.
>> Firmware avoids permanently marking the page as bad. The second occurrence
>> of an error indicates a Double-bit ECC error and the firmware
>> permanently marks the page as bad.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 121 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  35 +++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 153 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index d25d25f77531..c643c7137a42 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   
>> +#include "xe_bo.h"
>>   #include "xe_debugfs.h"
>>   #include "xe_device.h"
>>   #include "xe_drm_ras.h"
>> @@ -200,6 +201,115 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>   
>> +static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>> +				 enum xe_ras_page_action action)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
>> +		xe_log_err(xe, DEVICE_MEMORY, -EINVAL, "Invalid page offline action %d\n", action);
>> +		return -EINVAL;
> this looks like our programming mistake, shouldn't we use xe_assert() instead?

Sure will change it to assert instead of sigid

>
>> +	}
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +				  &request, sizeof(request), &response, sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_log_err_fatal(xe, SYSCTRL, ret, "failed to send page offline command\n");
> what about moving xe_log to the xe_sysctrl_send_command() and use:
>
> 	"Failed to send command %u.%u (%s %s)\n"
> 		group_id, cmd_id,
> 		group_id_str(group_id), cmd_id_str(cmd_id)

This can be taken as a separate patch if required.  This is currently 
consistent with rest of the file

>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_log_err(xe, SYSCTRL, -EINVAL,
> -EPROTO ?

This is consistent with rest of the file.

>
>> +			   "unexpected page offline response length %zu (expected %zu)\n",
>> +			   rlen, sizeof(response));
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret) {
>> +		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>> +			   response.status);
>> +		return ret;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 page_address, bool send_cmd)
>> +{
>> +	enum xe_ras_page_action action;
>> +	int ret = 0;
>> +
>> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
> hmm, can FW really send us such a broken address?

We cannot guarantee. Its better to have a check

>
>> +		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned physical page address: 0x%llx\n",
>> +			   page_address);
> shouldn't we try to log/print other details from the notification?

like?

>
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * TODO: Call function to handle address fault
>> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>> +	 */
>> +
>> +	/*
>> +	 * Handle return code from address fault handling function:
>> +	 *  0: Page soft offlined, decline to firmware
>> +	 * -EIO: Address belongs to a critical BO/stolen area that cannot be offlined
> maybe:
>
> #define	EADDRINUSE	98	/* Address already in use */
>
>> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is not to offline
> #define	EPERM		 1	/* Operation not permitted */
>
>> +	 * -EXIST: Address is soft offlined but yet to be offlined by firmware for second occurrence
> #define	EUCLEAN		117	/* Structure needs cleaning */

These return codes are from 
https://lore.kernel.org/intel-xe/20260818104055.3833974-14-tejas.upadhyay@intel.com/.
Any change will have to be made there as this is dependent on the above 
patch.

>
>> +	 */
>> +
>> +	switch (ret) {
>> +	case 0:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		xe_log_err(xe, DEVICE_MEMORY, 0,
>> +			   "Poison detected at physical address 0x%llx, page software offlined\n",
>> +			   page_address);
>> +		break;
>> +	/* User policy set to decline page offlining */
>> +	case -EOPNOTSUPP:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		break;
>> +	case -EIO:
>> +		xe_log_err(xe, DEVICE_MEMORY, -EIO,
>> +			   "Physical page address belongs to critical BO: 0x%llx\n", page_address);
>> +		return ret;
>> +	case -EEXIST:
>> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +		xe_log_err(xe, DEVICE_MEMORY, -EEXIST,
>> +			   "Double-bit ECC error detected at physical address 0x%llx, page already software offlined\n",
>> +			   page_address);
>> +		break;
>> +	default:
>> +		xe_log_err_fatal(xe, DEVICE_MEMORY, ret, "Failed to handle address fault 0x%llx\n",
>> +				 page_address);
>> +		return 0;
>> +	}
>> +
>> +	if (send_cmd) {
>> +		ret = send_page_offline_cmd(xe, page_address, action);
>> +		if (ret)
>> +			xe_log_err_fatal(xe, SYSCTRL, ret,
>> +					 "Failed to offline page for physical address 0x%llx\n",
>> +					 page_address);
> there are 3x xe_log() in send_page_offline_cmd()
> do we need yet another one here?

Sure will remove additional log.

Thanks
Riana


>
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static bool ras_counter_is_valid(struct xe_device *xe, struct xe_ras_error_class *counter)
>>   {
>>   	u8 severity = counter->common.severity;
>> @@ -367,11 +477,12 @@ static u8 handle_soc_internal_errors(struct xe_device *xe, struct xe_ras_error_a
>>   static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
>>   {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	int ret;
>>   
>>   	/*
>>   	 * For memory errors, the recovery action depends on the error category
>>   	 *
>> -	 * TODO: Double-bit ECC errors: Page offlining
>> +	 * Double-bit ECC errors: Page offlining
>>   	 * Poison and data parity errors: Log only
>>   	 * For any other memory errors, request a reset as recovery mechanism
>>   	 */
>> @@ -383,10 +494,10 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   		xe_info(xe, "[RAS]: Data parity error detected\n");
>>   		break;
>>   	case XE_RAS_MEMORY_DB_ECC:
>> -		xe_info(xe, "[RAS]: Double-bit ECC error detected at sw address 0x%llx\n",
>> -			info->sw_address);
>> -		/* TODO: Add page offlining for Double-bit ECC error */
>> -		fallthrough;
>> +		ret = handle_page_offline(xe, info->sw_address, true);
>> +		if (ret)
>> +			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		break;
>>   	default:
>>   		return XE_RAS_RECOVERY_ACTION_RESET;
>>   	}
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 99b2466e2062..2fac968879b6 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -17,6 +17,19 @@
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
>>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>>   
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to offline the page
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to remove the page from queue
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value
>> + */
>> +enum xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_DECLINE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>>   /**
>>    * enum xe_ras_recovery_action - RAS recovery actions
>>    *
>> @@ -245,6 +258,28 @@ struct xe_ras_memory_error {
>>   	u32 reserved2[10];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline command
>> + */
>> +struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed, see &enum xe_ras_page_action */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
> if this is a FW ABI, then please move it to file in abi/ folder
>
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline command
>> + */
>> +struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
> ditto
>
>> +
>>   /**
>>    * struct xe_ras_get_health_request - Request structure for obtaining gpu health
>>    */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index d0341538ad05..3363f48da2b7 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -26,6 +26,7 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_COUNTER: Get error counter value
>>    * @XE_SYSCTRL_CMD_CLEAR_COUNTER: Clear error counter value
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a page
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>>    */
>> @@ -34,6 +35,7 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_COUNTER		= 0x03,
>>   	XE_SYSCTRL_CMD_CLEAR_COUNTER		= 0x04,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE             = 0x08,
> ditto
>
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>>   };
