Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238C4C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 07:02:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A960C10F2D8;
	Fri, 24 Jul 2026 07:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LqpAPhcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F31A10F2D8
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Jul 2026 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784876535; x=1816412535;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2I48kYC1UHLg3s5v7RRrfDG2jCr41BjbFnINTBq2yuw=;
 b=LqpAPhcGas6PvXk02XOQMMCy/V1omDlS1DwNvm4YG4VHqPcazAqJ0Wju
 dMA7gY+2Nle9lT//4OIhsEb+RzgIqarpDmlN1fJRlE5mBf9TpHHONOqT3
 +6Tnc9XSes6zSNo8DdR1H6jXYeVp00GTfUn+mVyWNioDHcP3g4ExQMj9n
 UG18zZ5wCqAznzrpZpn3k/VVxuIc7jMDrC8tDgmO/T8wGrhtPppvv4sSx
 T5FIO416f2vIif4z9SNID6wnfcjPbsBrVZP6dDHhNEV0hHJueNHs4p0AS
 WIIet9G+yyc4xPb1XGqz+8ScQoJfN/v0ixglYosIuCUVU+qPUHWAqlqlU Q==;
X-CSE-ConnectionGUID: jsv1VISpSQiGT8I2M6nIvA==
X-CSE-MsgGUID: 94ntsw06SEa2S0AT70HTpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="84519984"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="84519984"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 00:02:15 -0700
X-CSE-ConnectionGUID: 3WD+r+PoSs+SqdZeQ4rlgw==
X-CSE-MsgGUID: DW9fJmTXSoKn1qWirvH1lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="255986699"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 00:02:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 00:02:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 00:02:14 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 00:02:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WWf08H8Cgp3x2W1hLy7V6afJxSPO5AmxZYBIJIApMkrVKkfk1K9kDbkHOrzYFn7saB0OzkNtuMA6D/Od/+3U263Z2R4Wo5yGeyruGJC5QpOb30P4wJkL94lKkYrzu2yr2TRMyoPKIHqGGxBd4Agea1BEW6f4qJvkFOAxtbDHUQqsl0bT9mbQPLxalG4YAD5yPI0A7U20PNujwcM3roeAJyx5cNU3645nkoDAzOMwpA52SXhNF4/1izloZHSgqqHRUROGEdNDIPCrQkm2aTBEpryYFh8ZY7Jvr2fs12AHsDJOeiD/b9pJye9Og9BCOCMqxsq2JQ83YR0VEbkkdkbSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3K+0vyXQgjCCl7f/hz/UfJARtIn0khorTiYTKXDAPg=;
 b=nV6WUQ/4eUk4Zy9uIz76eHWdjDqfwZhuwW7EstqyiyQJ9QH9BSc6MoCTkT/wN2Tq5gNRWrXKmDDNmz073niOkdLeEGMRq62oDEnNxKqDKCQbRaELMJfGryl94kd2+ZqMexYqNV/625zd7sFGD4TQZKdb7lqWJysWfKherEqfGaAIJRN0ZoJH+RYWcUbcq5J9uFBI3urvGTzXmzKAiiG/2JJ+NuNntMWEBb/zbMGc7HHczs+PNI+P9sYzg9K+loDT+VDF0cJI0NCfeyRVybLkZqPZ+u6MWItF+8wSxR/e9wHMlHj04jXAxc9ytbKijg19bnF53oU3QiFIgEQopyhXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM3PR11MB8716.namprd11.prod.outlook.com (2603:10b6:0:43::13) by
 PH7PR11MB8012.namprd11.prod.outlook.com (2603:10b6:510:24b::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Fri, 24 Jul 2026 07:02:12 +0000
Received: from DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868]) by DM3PR11MB8716.namprd11.prod.outlook.com
 ([fe80::2e63:338a:bf30:7868%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:02:12 +0000
Message-ID: <340a1b72-72a7-420e-a816-9233f014f9a5@intel.com>
Date: Fri, 24 Jul 2026 12:32:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/hwmon: expose pwm[1-3]
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0027.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::17) To DM3PR11MB8716.namprd11.prod.outlook.com
 (2603:10b6:0:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8716:EE_|PH7PR11MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7cca9d-db01-4b51-026d-08dee9517c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /Y1PG0tGrqIxDNjteQv3L7pV7YTbHPANOtLZgVIeas7g2kYDJugGmAilQZ7BtHZOnNmnosAsYcqnMXuZ/B3SQN/NV3FosrK6tsBa2Mej/ANauMaxOEgvYEO19VtOkE935cLpCaZyGhAX6do4dZnH+k0VOBeuvAwiykygjDAFWb1MZlolWHdpSFg8OIN4dwPLoxZg6ReL2aZzNiRZ+Idmgea+/5orltGDTjdMSs7RvgBC9VmvcMsAZuh/5/YLWLT2sblZP7UyzqqbFQgsMzrzdpXBgx22i4K5OrR9LvCUaiXYoK8yCXIF17c0W0X1y7wJqmIbPuV8N9MmVn8dvnUmjCwlHhwTrYHDQrzVYKhC2UN42/Pi/WFOfhmfjN2ZE+rjxJP4vexy+E5XPYg6yMaGBxwr0o/wSAB2orwrSmxWsC/J0H7Qmn9IlH/TB369EDOiuIfdWkVql+7pGPgyotNIxmPQmscchHTgwmkkhH91Q2V7yfycgDcKXW0OVZkM3x92O9fb/JzWTGffm2DNjRH7k8j4XQG/IntrO2mvjHCAtorhY50mBbNx9V89kbMNsAl/Xvej2zdntAVMNnHc7LUudpNe5JNnetTk2uJlIZsC9MzLJbGxZS2RTy1zrAJouR91ds9gem/2iBQ8xEbyYYULoarBX+DCz0BbRansGI+Np+c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR11MB8716.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VncxdmUzWVdZZm1hRzFlQlJVc1VFYTBKK05GZ3lpam9pb2kyYVFQQWZuRFcx?=
 =?utf-8?B?V0ZCcExmTk9CV1czRVh0VlFkU0ZpU0dxZkdtM3JZSTU1WjBpekRuL2lERXg1?=
 =?utf-8?B?Q3d0elhRTjlILzdtL2hPMzFOV1BwMXJrNkQxeitDZlNSdWUvWXMvZ0pEU3BC?=
 =?utf-8?B?eXBpZUtzQkZzazN3QkVsQzlvV1IxWG9uZHdQbVUxWlhCQmQvTjEvYVQxM3Rm?=
 =?utf-8?B?TDBVcEFPcUNmTHdHeGhtamJzMnl4TlFIa2NjRU1DQTd2RnZ6dDFIQzVaS3pB?=
 =?utf-8?B?cjd4US8yNXBMUE1mbkgrem04RGp3MFFpSE1jc2V1R3ZqV1FDR1VJQkFGd0RZ?=
 =?utf-8?B?OHJFL25ZWjRTWVBaVXNseXVDbzQ3YzJoLzZ1aUU1WjJsdjlmYVVMeTVsemhV?=
 =?utf-8?B?NmtaMWR0cUczWk1YWUxIZGlrSXoxaFYrWjIxL21oVzVNQnF1ZndURHJ2ckF4?=
 =?utf-8?B?bCtNbmZveUp3TDdRYlBrRFZseHgyOWVzdWdhcTFRQUZscG1SYVZsS041K2Nl?=
 =?utf-8?B?dUFFaFJnZzd2dTM1NFcvUm9pbHFkbjBGRFlvcFVZZVhhU3ZtNkorbDhKdCsy?=
 =?utf-8?B?VjFmaEp4R0oxdk9HQks3YzdHOEx4cDZneVNXV1EzTEZCYVV6VTVmdTdaSzBh?=
 =?utf-8?B?UFZsRkJ3WXlZSm9vOGxwQ3YvVHlYTkFOR1UydFlOZ2NMcEtWZldHMEJRZXJw?=
 =?utf-8?B?RVhWeHlCRktxZThRc0FvdnArWGcyUHgyMTRjbFkrZ1RiekNONUdFTWlBcVQ0?=
 =?utf-8?B?WVJjQnZzcGN5L1p5VGJPd2Z4amdSeGFnWGxpK2RlZmVJbVpnVmR2OUYrNnpr?=
 =?utf-8?B?SkMxOWx4OXVzM1pyUkNQT0VnT0k2ZFB2cTE0ZW1PUHJvMnB0bDJIMkYxa3pD?=
 =?utf-8?B?RTZoK1FuVCtuK1NKQndFTytWNHpTNjdCcUhoRVBKTXo2b3ZTVm56QlcwZ1Fr?=
 =?utf-8?B?T253TnhVdlF4YTloTTRFNlVUZVZpUGRvTWNwVllFdFFZWkZLSlVEN1RMM2dD?=
 =?utf-8?B?YVgyUkxvWHMyNDVKbmZhUXlzM2dyREQ1Vm1YYUthTnNyaG9MdkVQdHU5M05p?=
 =?utf-8?B?ODY2ZWlzWno2VGhrb2tqanRxRXF4YVh6Tmk1ZXZCMkhsOEEzSzhKa20rNDRu?=
 =?utf-8?B?RkJYWDdtTFRja1VMcmNIL0Vwc29wSCtRUjRmWC95RWIvd0NTVWc3a001Qlo5?=
 =?utf-8?B?Z0tZWmNFMGxwZkJQT2cyUzh4VnQzU1BTbUNLaXhGL3NQMUVWbGJ3SU9VbjNT?=
 =?utf-8?B?SDRtdWl2djg0S0VSZkJ3WW5lajhxWWtIYXhuVVNLM1ljMUhiaHhvalRaS0oz?=
 =?utf-8?B?RHc2NFNDT0RsdDhveFBaTjI0dHg3emovWUtxRHVvSDM4Ui9VbGwyS3piSWdB?=
 =?utf-8?B?MXU2RE1HMnJWemZoQjRsRnlJUURGVVJ6K3V5bGU5MitrVnRrbFJGWmNJY2h6?=
 =?utf-8?B?TTEzTjNzemNDVVpCeVluS04yamZtMDhZZkM4V29VcmkzU0VpOWhPYldJdElq?=
 =?utf-8?B?SFdOQ1NPZFdJaFppYi94R1N0RFJYNVNvL2U4VDhHdm85N3pucHpkV1R1dTJi?=
 =?utf-8?B?UWdSMUhvNk5VOVNSOFVZQUV1RThVVE9Sc1JPN01FQ3hURUZpNUl4WDV6ZXdx?=
 =?utf-8?B?d2Irc0RBZEVIbHN5QU1ZWERUVUduSjlRNk4rM0hmVE5LK0hlVzVVRlhMRDNI?=
 =?utf-8?B?WFNJU3ptUFVNS2V6U09nWTQvenJwOEpVd1pDMzg3cVFkUjBpTGhIYVRVVWN5?=
 =?utf-8?B?TnRGVzJXRlpwTmxpWW5HRENLNU8xM0VKbWdlMWhQLzdsZVR6VGhVaVhSaTBp?=
 =?utf-8?B?c0pYTGJZTS9KQUdSUXRubGZ2SnhBWjJJYktaRXJmUGhiZUZSZ2xPTitJQVgw?=
 =?utf-8?B?SEcvWU9ZUVpzaWk1Ryt0ZFJSdUxrVmpJQzlpbXQ2UmlibkRGTHQ1cTgzR0FS?=
 =?utf-8?B?K0poVlg0MXVmOTlISmVtRjlHTjV2ZGlYWkpDOXFabExzVVMzNDFldkdJY1gx?=
 =?utf-8?B?TWo2Nk15MTBTcjlEVjNBUDd4bWpsU0FSYXIwbURPTTQ0dFNGVkVmbm1EdTRs?=
 =?utf-8?B?UkE0Vk1GMXM4WDBwVjliM1U4K2M4a2VEUmQvNmVwNGZVR3BxdXE5MnlnMXFG?=
 =?utf-8?B?alYzUWR6MFdxQUM3MEw1WUViSTdzczZRS2ZBcUxSMW1OWkJrVnB3RW1JQjJ3?=
 =?utf-8?B?cFRqaUUrODBEVkN5ajlJWDBsSHlKc1RPb3ArRlhtVmRwZHRVZXgxcjBPamJu?=
 =?utf-8?B?aUpHVUxuQS9Tb3lDQUdseDlQMjdpc3paM1hPYUtoaVdDVmtaK0pSeFlEVVVR?=
 =?utf-8?B?N0s3QXNXV3d3S0twV0IzRDVrSG1nTmdLc1JVdUVZakQ1TXg3OE0xYUoxYjRS?=
 =?utf-8?Q?RQgwnEhS4AyhhPx8=3D?=
X-Exchange-RoutingPolicyChecked: jCSkincPPaHC8hadFxIdUvAJHmlsYcYJWKGREOdWmRKxmpmGS1tT6eSHxeeRSh+Vh67SqGHcKqT1JCyTyOP0BDrmAu0vpQNRKLmSwh9zk6ftjvrtX6E4mQdDwGYov7dPjiPtd9WU+92poBmOrnOjX1LlrlbdjMcuTnetHqfZELgKvbjbxLiy34JN1/IyTf/JjSPiw5dOThEradciuhpZUHk0U7iQCDlasTNbgMhMI0JxV/72hsb1uNfL0s0ci2GeU0txd2D6xLB/L2wLsGaI6v9Iz7eH0WhUnUmfq/xvaKiSsv1F+Md+eA6/D5nPmSsc29P7mlyg4oK6z4ZL94ca1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7cca9d-db01-4b51-026d-08dee9517c25
X-MS-Exchange-CrossTenant-AuthSource: DM3PR11MB8716.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:02:12.0177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnOQaOJ1mHb3lmZH1Pzy40iP10Uu18OhS/YmmGKZaGDE57lybWegK9A7ijjKMJCUAPn3cs9yhj1uwVc1HK/fMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8012
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose pwm[1-3] fan duty attributes through hwmon.
>
> This enables reading and writing user PWM values (0..255) for each
> available fan channel.
>
> Update Xe hwmon ABI documentation for pwm[1-3].
>
> This sysfs node can be used for manual control of fan speed,
> irrespective of fan curve.
>
> v2:
>   - Use xe helpers for dmesg logs.
>   - Avoid use hwmon->num_fans to get fan count in xe_hwmon_pwm_is_visible().
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |   9 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 230 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h             |   3 +
>   3 files changed, 242 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index ec0b94d76e22..7383898890aa 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -321,3 +321,12 @@ Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
>   		milliseconds over which sustained power is averaged.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]
> +Date:           July 2026
> +KernelVersion:  7.2
> +Contact:        intel-xe@lists.freedesktop.org
> +Description:    RW. Target fan PWM duty value in the range 0..255. 0 is zero
> +                fan speed and 255 is 100% fan speed.
> +
> +                Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 769f4d1da83e..d3379727b1a9 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -803,6 +803,7 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
>   	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
>   			   HWMON_F_INPUT | HWMON_F_MAX),
> +	HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, HWMON_PWM_INPUT),
>   	NULL
>   };
>   
> @@ -928,6 +929,158 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>   	return 0;
>   }
>   
> +static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> +					int table_type)
> +{
> +	int ret;
> +
> +	ret = xe_hwmon_pcode_read_fan_control(hwmon,
> +					      (table_type == USER_FAN_TABLE) ?
> +					      FSC_READ_USER_FAN_CONTROL_POINTS :
> +					      FSC_READ_STOCK_FAN_CONTROL_POINTS,
> +					      fan, point_count);
> +	if (ret) {
> +		xe_err(hwmon->xe, "failed to read fan %d %s point count, ret=%d\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", ret);
> +		return ret;
> +	}
> +
> +	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
> +	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 point, u8 temp,
> +					 u8 speed)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u16 user_fcp_raw = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, temp) |
> +			 FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
> +	int ret;
> +
> +	ret = xe_pcode_write_timeout(root_tile,
> +				     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_FAN_TABLE, fan),
> +				    (u32)user_fcp_raw, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret)
> +		xe_dbg(hwmon->xe,
> +		       "failed to write fan %d user point %d temp %u, speed %u %%, ret=%d\n",
> +		       fan, point, temp, speed, ret);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
> +					    bool is_full_speed, enum fan_table_type table_source)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	u32 point_count;
> +	int ret;
> +	int point;
> +	struct fan_table *source_table = &fi->fan_table[table_source];
> +
> +	xe_dbg(hwmon->xe, "activating fan %d user table from %s table\n", fan,
> +	       (table_source == USER_FAN_TABLE) ? "user" : "stock");
> +
> +	point_count = source_table->fan_control_point_count;
> +
> +	if (!point_count) {
> +		xe_err(hwmon->xe,
> +		       "fan %d %s table point count is 0, cannot activate user table\n", fan,
> +		       (table_source == USER_FAN_TABLE) ? "user" : "stock");
> +		return -ENODATA;
> +	}
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = source_table->fcp[point].temp;
> +		u8 speed = is_full_speed ? 100 : max_t(u8, source_table->fcp[point].speed,
> +					    min_t(u32, fi->min_pwm, U8_MAX));
> +
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
> +		if (ret)
> +			return ret;
> +
> +		if (table_source == STOCK_FAN_TABLE) {
> +			/* Update user table cache with stock table values */
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
> +		}
> +		if (is_full_speed)
> +			fi->fan_table[USER_FAN_TABLE].fcp[point].speed = speed;
> +	}
> +
> +	ret = xe_pcode_write_timeout(root_tile,
> +				     PCODE_MBOX(FAN_SPEED_CONTROL,
> +						FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
> +				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret) {
> +		xe_dbg(hwmon->xe, "failed to write fan %d user table, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	/* Verify if all the user points are set */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret) {
> +		xe_err(hwmon->xe,
> +		       "failed to read fan %d user table point count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +	if (point_count != source_table->fan_control_point_count) {
> +		xe_err(hwmon->xe, "fan %d user table point count mismatch, expected %u, got %u\n",
> +		       fan, source_table->fan_control_point_count, point_count);
> +		return -EIO;
> +	}
> +
> +	fi->fan_table[USER_FAN_TABLE].fan_control_point_count = point_count;
> +
> +	return 0;
> +}
> +
> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
> +{
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +	u8 clamped_pwm;
> +	int ret;
> +	int point;
> +
> +	/* Read user table fan point count, if it is not set, activate the user table */
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		return ret;
> +
> +	if (!point_count) {
> +		xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", fan);
> +		ret = xe_hwmon_activate_user_fan_table(hwmon, fan, false, STOCK_FAN_TABLE);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
> +	clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
What is the use of this clamping logic? as the pwm is in percentage 
already.
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
> +
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, clamped_pwm);
> +		if (ret)
> +			return ret;
> +
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = clamped_pwm;
> +	}
> +
> +	ret = xe_pcode_write(root_tile,
> +			     PCODE_MBOX(FAN_SPEED_CONTROL, FSC_WRITE_NUM_FAN_CONTROL_POINTS, fan),
> +			     point_count);
> +	if (ret) {
> +		xe_dbg(hwmon->xe, "failed to update fan %d user table count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> @@ -1424,6 +1577,20 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   	}
>   }
>   
> +static umode_t
> +xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> +{
> +	if (!hwmon->xe->info.has_fan_control || channel >= hwmon->num_fans)
> +		return 0;
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		return 0644;
> +	default:
> +		return 0;
> +	}
> +}
> +
>   static int
>   xe_hwmon_fan_input_read(struct xe_hwmon *hwmon, int channel, long *val)
>   {
> @@ -1478,6 +1645,62 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	}
>   }
>   
> +static int
> +xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> +{
> +	struct xe_hwmon_fan_info *fi;
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)
> +		return -EINVAL;
> +
> +	fi = &hwmon->fi[channel];
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		/* Check if user fan table is set else activate it.*/
> +		if (!fi->fan_table[USER_FAN_TABLE].fan_control_point_count) {
> +			xe_dbg(hwmon->xe, "fan %d user table not set, activating it\n", channel);
> +			ret = xe_hwmon_activate_user_fan_table(hwmon, channel, false,
> +							       STOCK_FAN_TABLE);
> +			if (ret)
> +				return ret;
> +		}
> +		*val = DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed *
> +						U8_MAX,	100);
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
> +{
> +	int ret = 0;
> +
> +	if (channel < 0 || channel >= FAN_MAX)
> +		return -EINVAL;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	switch (attr) {
> +	case hwmon_pwm_input:
> +		if (val < 0 || val > U8_MAX) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +		ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	}
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
>   static umode_t
>   xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   		    u32 attr, int channel)
> @@ -1504,6 +1727,9 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	case hwmon_fan:
>   		ret = xe_hwmon_fan_is_visible(hwmon, attr, channel);
>   		break;
> +	case hwmon_pwm:
> +		ret = xe_hwmon_pwm_is_visible(hwmon, attr, channel);
> +		break;
>   	default:
>   		ret = 0;
>   		break;
> @@ -1533,6 +1759,8 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_energy_read(hwmon, attr, channel, val);
>   	case hwmon_fan:
>   		return xe_hwmon_fan_read(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_read(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -1551,6 +1779,8 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		return xe_hwmon_power_write(hwmon, attr, channel, val);
>   	case hwmon_curr:
>   		return xe_hwmon_curr_write(hwmon, attr, channel, val);
> +	case hwmon_pwm:
> +		return xe_hwmon_pwm_write(hwmon, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 419ab4f416fa..5c5fdc650a97 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -84,9 +84,12 @@
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
>   #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_WRITE_NUM_FAN_CONTROL_POINTS	0x0
> +#define     FSC_WRITE_FAN_TABLE			0x1
>   #define     FSC_READ_MAX_FAN_RPS        0x3
>   #define     FSC_READ_NUM_FANS			0x4
>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
> +#define     FSC_READ_USER_FAN_CONTROL_POINTS	0x6
>   #define     FSC_READ_FAN_TABLE			0x7
>   #define     FAN_CONTROL_POINT_TEMP_MASK		REG_GENMASK(7, 0)
>   #define     FAN_CONTROL_POINT_SPEED_MASK	REG_GENMASK(15, 8)
