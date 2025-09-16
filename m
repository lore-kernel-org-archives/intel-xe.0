Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C8CCAC59B
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 20:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104DF10E781;
	Tue, 16 Sep 2025 20:06:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZMgqFM13";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4756310E781
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758053173; x=1789589173;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=V9nSO9YES8nEwtlLfry1LYcpqJ92bzBm/4/5g55/lZ0=;
 b=ZMgqFM13ppPiDhA2yWvT9IozQSGKAjLSc/no9gTce4f7q5bZm7dYu7eD
 oDKNnmsUscnL/buAapIsZLmhSxnT40eoR7dxCMvyD8i+drsB29CnpX3BU
 x5fLciNsbhpvUiDH+nOanmdLEyMZS8MICijxlpe+b6acpv2UKxPCltCbR
 TNPLXj1aWCPBvKDTEqHdbypIv3Av0bKpKpH6WdIXFp79UqPPFyHFwmEWK
 no/CAmhuE2wLysrRImm5dc2imOqziwlIq1iexdKKxIHjgrs7N1P3RXHxI
 WHYNjXqKOUl7CvXw5VU0N8hvF7Q1bKFH0xPtJgJuaoZwyyPcbp/z9adYr Q==;
X-CSE-ConnectionGUID: vgyofEJYRrWb/wRzfzxHcg==
X-CSE-MsgGUID: XBWkkmuUTXWY1onlKKRCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60296584"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60296584"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:06:13 -0700
X-CSE-ConnectionGUID: yy1UcMMRS3qTtANdlRtIvg==
X-CSE-MsgGUID: whZaQaBDRsOlPeqLUh7WZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174141014"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 13:06:12 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:06:12 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 13:06:12 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 13:06:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4uK1rqRW/4o3ANriYHggmRI+6QKDn4Oub+iBcaYqDzU90r+Fy4CTYK+FLbOg6jt/KMOd4GxyEhMQyeF24mUG0k/ppi12xeqQmhLkIx0eUmk6fYMkAocDKQsHon0NgludbJWRiQQJgbewMKZxTQzsCwssXk9FAvMvVQILf0S/QRLW5QslyGPKz3kH80ALvwdiY1A7ZHffBaJYS3aSzi3blSAhfaiUjeZfan/P8EJ0paUUbCHZp1eEKwasnz+hfiYXjv2Q0HKNDxCHrExOSxeK7xCsv1XHszlXRP9zNevL7+e9G4Fh6KIIemfkBZq+wJruQfXJCbf8fHmGHyIGNUz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+vp+UTaMYKb3Msj1Qvl+ptpY/ksA8XqOJmVAq7LJ1c=;
 b=rs9U5XWb9H1oYqqFagZxinMNOzdnMGJSXmXr9wvrVh9WUaXbeKGaiMqWRLCPZfQiwlu66423/pswSRsvBDD7W+je/+7y5lqrmpnv3soUQa5scDWHP8FN97Ww86iIRp2JbZ6OSubAfOb2DtNPafkZoPswnIQLuwvfK6ssUP4647xD439Ogf//U722TJTizEn7PNCbD9W0GpOouFc+e94iynnoWs/IaA1yTiZwxjXleWIYP7IrKAEbkLV0OLczQyAZOGRAy64/cbwRn4ILXUEJnHk/FUvuPtwj2ALix8yz9y3/BAOBE4tFZfIvNJPv2wsu7UnD1OTaIQH0v+1szPd+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Tue, 16 Sep
 2025 20:06:09 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%5]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 20:06:09 +0000
Message-ID: <3f9169e9-06e9-46b5-aaa9-a7d67273fb2f@intel.com>
Date: Tue, 16 Sep 2025 13:06:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe/guc: Extract function to print load error
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Jani
 Nikula" <jani.nikula@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Maarten
 Lankhorst" <dev@lankhorst.se>
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
 <20250911-xe-iopoll-v3-4-6a95f1cc3b0b@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250911-xe-iopoll-v3-4-6a95f1cc3b0b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d54a274-cd3e-45b1-5fbd-08ddf55c7a43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDJ0YlppbkNHL2IxZmpxZXFqaWN6djNac3VQbGlQKzVKcGZWWGFsNlozbWJo?=
 =?utf-8?B?bUFpMENhakNzSjE1aDI2QTZGRFloM2YzWDl3ZUtxamlseFVndDdDUVBhMEQr?=
 =?utf-8?B?OVZ2aE1oS2FiUFFTeVBKTXpFRkt0b0hYbHRPblpRb1JUK1ViL3VjYkoycmps?=
 =?utf-8?B?SUlaWkpzN2hhMmtIaWpZblNmQy9aYkZCR0UrT0c2enhyUzBLZWZMUTdma1hz?=
 =?utf-8?B?QldsbTFhbXBTTTNZUk9RQkFtNDNkejl3M3JYaTRSQ2E4L1pNbnNkZUsydGYx?=
 =?utf-8?B?cG5PbjdVQXEycVhYQjFMa093ZkFTUlR3V3VPREdwbXZLNE5YNXFpNUpHRWx6?=
 =?utf-8?B?UUIyWTkvWlRLak1pQmMwaWNrais2Nzl2Y3dWQ2puL1BjUFBJSjNHbkVtTWJ3?=
 =?utf-8?B?Zll3T3I5WWkzeWc0WnJyR3krZzdlZUtSNGV1UDVGL0lVbUNEcktkQ3VwSnkz?=
 =?utf-8?B?dGx6dmw2Z0p3ZHlVSWRNaThVUzVpR2hMNFZVbmxnQlpVL1NmVFlMZTVFdHlk?=
 =?utf-8?B?bkpncVFzRHdCSW9VSjhVYzZWcUFoVGRpWTExemNOVEptdEhENUU4TTVHdFZk?=
 =?utf-8?B?bkM0NTBsQy9Tc3F1NHJ4UUJyNEZIRGpLa0szT1FFcGtFeFcyRVRLOFdYejRS?=
 =?utf-8?B?RGJteXhlR01LUzB2dW0weW1BMGREYUk4RS9MTEg4V3hnZDFwK1lZNmkraXEz?=
 =?utf-8?B?ZFViazZSK0NjMmtzWGVvaXlTYS9GeHlreUFOMlFFcnNOckh1ZVRIaDViVjV0?=
 =?utf-8?B?clBpdVlDNWJIbE9kRENYRlpldjUyMWFNbXZnRjk3NzRWNzUwVmJFTDcrU3ly?=
 =?utf-8?B?dXd3bnhDdThzTGlZRzlGaFNDSExIL29ReFE0NmdTNTJGcmtHdmFCVVRZY0d5?=
 =?utf-8?B?M2tlRVkyYmw4cFlZUFZVdkppWmZ0VFI4bkQxOFlValB1RUVmYWhHR0hzbjl0?=
 =?utf-8?B?akgwdFhieFBWU1ZIOHd4dGpxV2lFSWJIMjYvS3IzQU05NE5oY2Rod1JqNHFz?=
 =?utf-8?B?V0k5RTgrNlRMS1FXb2dZTnhwSVl3RFN5ajBBS3pkSFh0ZHRodkE2cUpxZURp?=
 =?utf-8?B?TUhxdUF4eHBQUDlCQjF0cW5pN2owYXVMTnFDNXFYWlh2bjQyYjNTcU1xZnlP?=
 =?utf-8?B?dFA0Z0w5Z2I3L2g4aWZ0WDlJVGlyVkNRR0s2anNZSGkxWC81bXdQTVkyQWpl?=
 =?utf-8?B?bkVkQWcvYnBEUGZNMUZZL0xmdGpXeWw4bXhuT0pndlVDN3drcDN3UjBvSEZa?=
 =?utf-8?B?b3hpNXNXUFlXb1pWYXZuYnpLMVNCRXBEQ3M1NjE5Mm54Z05MdmFwbUZGdzFV?=
 =?utf-8?B?NkU3eEV5UW1yUGxqR2FTR0pSQ0NUdWNxLzJGR2hJYWkrTmw1Q0tZa2pLNVlT?=
 =?utf-8?B?OWhvZmQ3b3hoSithRENla2FoVUNRT051UUx5R0RWemIzZ3ZERmlFc0dwdEV0?=
 =?utf-8?B?MlBTUWZFcUZEM01hZTIwUEtKUEhnWkJvMDh2TXlDdlQxeGU4T3VrNmNIenZN?=
 =?utf-8?B?dTFqMjU5dUxBdk5BdHZERmdoRjhHTmFYK3d2dkRCbUc0ZjJYVGRxc0c2V3Y1?=
 =?utf-8?B?NkRHSHlMODk2dTFLQ3JEaUIyZU9xNTlYTnZvVlpDSjllcWk1aVNwUDgvaDk1?=
 =?utf-8?B?N3AzdTd6cDl3VkZzY1hQOG9BY2lRNmkzcDAyYlBFYkJqdlJvT0xjZjl2M3Rl?=
 =?utf-8?B?dGQ4bUJkdE5SQ1VES1R3ZjZiZUtqbkxtU0JBemIyTS9EK3YyWVU4RHpFWjcr?=
 =?utf-8?B?WkJ3OXRiZTE3cmtlMGNmMGxYOVRnQVRkeCtBVmgwRGJRT1RON3d3QlRTRmxs?=
 =?utf-8?B?ZUJuelprdGlqbUJoT0wrWmFOSU55RVYxeWR0S0FMN1JEQkFvamZhSFpvWjN3?=
 =?utf-8?B?YUhiRFRsUmhpREVWaFZOYXE5VE1qSGR0OURHQkNmbkpoa1VGd25majZ6TXhq?=
 =?utf-8?Q?NQC1Oh0A6Gk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3lON283bjVHUDgvMnlVNlAyRjcyYk5IcWQ0Y3JIeGNvY0wxb3UrTmx2T2tN?=
 =?utf-8?B?OXhGUDc2bDVGOWdiYzB3dm5VNmpNaUtjZXI5dyt4YlNDR1JlZW9VTFlKand5?=
 =?utf-8?B?LzVCaXVTTEtYeXozR2NBL3c1emNZQ0FCODdobjlhU01BbW4yak5DWUsyK1lM?=
 =?utf-8?B?ZWJtYThsRFJiTjRoS0VwWVNuZE44akJoZDc5M3FkYU0rTlVEQlR2WXQ3WFJn?=
 =?utf-8?B?eXFWSFIyN2pHbHFiUVAwOGd1ZW5hWjNwVkx3V1B4ZVp3UGl4K05neG93dmpm?=
 =?utf-8?B?M2dVN0pTUEtjVXUyQ0ZZMGxKcE1ibjY2SFhuVTZGczlhWjVQT0FTTUhlMTlL?=
 =?utf-8?B?dlJ3UXFPMUJRSmRRUGRTWW9iL3h4ZnhIVlNGQ3F0YS9DQm9YMHJlZk0reEFx?=
 =?utf-8?B?TzY3QmtYUFY3WXE4NGx4UVppTWNuVXh2ZWUwN3NKMXRHQXJDbkhKME9ZTUdt?=
 =?utf-8?B?ZGg3YmJNSjFnQStzR2VrZlhVSHFaeHJCOTJIUE56OWp4cFJPTVNOSWRvMTIx?=
 =?utf-8?B?bzBnWnhjeE8vcE5HV0JweDRDVFJiSFF1b0JJSG1UVGZhSExOdzJhMStOa3RW?=
 =?utf-8?B?eEh1Qit3LzlBVlRZcWpGVkRlaXk4R1FZQjNjcmpqWUF3dUhreDl2NW1nQUxo?=
 =?utf-8?B?QXdFbTZOb0xVODJxR1VxMUVXc3U0cERWbWNYTDBKOEcwRFYrQkdTbm91OXV3?=
 =?utf-8?B?bU4xWHhCa09QYWQrNFVIU0R4VWxJSGVUTjlPRy9ONFJld0dGdGRsa2tkai9j?=
 =?utf-8?B?WkxYQjZpazBsQ1hoUmNkbGZxYmRYS0RiWENmZEtFNklKOXZwU2tPZVJDcitr?=
 =?utf-8?B?ZGUyWnVGbXlGYzZFU2NPVXdqdm9oai9PcXI3MWV6VXJSQlZoTVFldmdMVm9u?=
 =?utf-8?B?aEV1aXlONDhCR2w4WUxjc0tjdHR0K3M2Ty9TNXpMdG0wdy9jcmNJK3JBSEhI?=
 =?utf-8?B?cWtva2VqMm5xeW9mTHRQc0c0RkI0WWN4UCtINVFybUJSckhDSll3OW5GMFE1?=
 =?utf-8?B?d05TdnVoaUdFRTVCaDNCcWIvL2U5OUFpZ2NxTEgrQVJHTVp2cWhtSytuUi84?=
 =?utf-8?B?WTBvWFc2bWgremVPYmRqNm1KK1Y4Q0RMNWtzMndXWmZkSW1VSEM5bk1mdFpi?=
 =?utf-8?B?K0MySVM1dnFxUDFNWGtUK1ZGbHp0bHlJT3QrditURXJCODIvQ0xPV1dXRmlZ?=
 =?utf-8?B?N1FDSld3Nzg4NnlOMklIQzJ2Ny9ZWmlvNFVBRHUwbzdlalBCNFBBeWJSZzFD?=
 =?utf-8?B?TVZMSlRicUNRdzM1ckdvZk12cEF0WDdKMkhkcnNPY2FFY2FHOG54VXJreUtv?=
 =?utf-8?B?a0Zya0wyZmtGYmhxQkxtYTFnczgxcDFSVy9HRHA0YmUreTE2bnZXT0NpaU85?=
 =?utf-8?B?MlpTM2FjczJJR0x4WUg0Qm1zNFhUS0s4NUlBMDMyV3Rpc3ptdlB0TGgyWVJ4?=
 =?utf-8?B?cElMUVZLa0c2cEYxREFBSVlUakNDemJ0QzliRk9VYll2OUZNV2ZibWFra1o2?=
 =?utf-8?B?MW45WEgxcUJRN3lhcnN1UW9UbWFBbmQ1K1VEMG9zVGxXTjkvNGJ4NFVNTzl4?=
 =?utf-8?B?bW5nSms5RnI4VzByY1pLcUdUa0Uvbkhmd05FakxxQU1MNEtlSUpZM2JIWDZx?=
 =?utf-8?B?RW9CSEFyTVFGM0hNNUVMNXgxZnJJWlVlRm1rUFBERG0vcUtRaFc5RERMRW92?=
 =?utf-8?B?TTZHTzVqRGhLL0M5ZnBKVzlZeE1qaC82L3I3QUplSDJKRlg2aG1tSHdHYnUv?=
 =?utf-8?B?L05iZllnMTBLSHMvRHRoMHpFdXdaQ2dlZisrb2ljbDllT2VySDdPN0dEOWZm?=
 =?utf-8?B?L21jVkRJWFEzOVYyTWJCSlFPUlhuRnZtWmdQTWtraGhtYmdLN2xZd0RndkpS?=
 =?utf-8?B?dnMyZE1ITkU1VG51bG9KOElIWVhXQ0VRVkRsVE1KVDZVU3ZGL25VWUFqUC9a?=
 =?utf-8?B?Q3lQSE93dFJhdGVGSUM1clN1a1hBWGM0NUNVbEs2SzArQ0JuM01Bd3o2STBj?=
 =?utf-8?B?TVVWMVdyVFVnZWQxRmdSMXFnTVZQSjRZWk93VGliVjlJeW9BeEd2WExuRGZB?=
 =?utf-8?B?QU9GQ2xzbGlab1pqNEhEODlGdVBPSnROczkrRmNKa0JWbWlLdUlXa2M5NFZT?=
 =?utf-8?B?aTBMeDZqTnVQVEFqcElESW4rd2F0UjhBYWNGNlFUR3JhTVJEMkFpcno2Z1Rl?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d54a274-cd3e-45b1-5fbd-08ddf55c7a43
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 20:06:09.5905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TtcdFxV5MPmV/rHXPqeviJOagzbBK0DzKrN7V3iDWkZk5U4MZyLQ6UdFPFeN+YZn8r2YCUQH06rcCsDUuW60tIeY1NSCQEYE9mmXO4fTLTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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

On 9/11/2025 10:25 AM, Lucas De Marchi wrote:
> Move the error parsing and print out of guc_wait_ucode() into a helper
> to clean up the wait function.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_guc.c | 81 ++++++++++++++++++++++-----------------------
>   1 file changed, 39 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d8fc060c9682e..da1bb4939c6b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1049,6 +1049,44 @@ static int guc_load_done(u32 status)
>   #endif
>   #define GUC_LOAD_TIME_WARN_MS      200
>   
> +static void print_bootrom_ukernel_err(struct xe_gt *gt, u32 bootrom, u32 ukernel)
> +{
> +	switch (bootrom) {
> +	case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> +		xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> +			  xe_mmio_read32(&gt->mmio, GUC_HEADER_INFO));
> +		break;
> +	case XE_BOOTROM_STATUS_RSA_FAILED:
> +		xe_gt_err(gt, "firmware signature verification failed\n");
> +		break;
> +	case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> +		xe_gt_err(gt, "firmware production part check failure\n");
> +		break;
> +	}
> +
> +	switch (ukernel) {
> +	case XE_GUC_LOAD_STATUS_HWCONFIG_START:
> +		xe_gt_err(gt, "still extracting hwconfig table.\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_EXCEPTION:
> +		xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> +			  xe_mmio_read32(&gt->mmio, SOFT_SCRATCH(13)));
> +		break;
> +	case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> +		xe_gt_err(gt, "illegal init/ADS data\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> +		xe_gt_err(gt, "illegal register in save/restore workaround list\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> +		xe_gt_err(gt, "illegal workaround KLV data\n");
> +		break;
> +	case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> +		xe_gt_err(gt, "illegal feature flag specified\n");
> +		break;
> +	}
> +}
> +
>   static void guc_wait_ucode(struct xe_guc *guc)
>   {
>   	struct xe_gt *gt = guc_to_gt(guc);
> @@ -1114,48 +1152,7 @@ static void guc_wait_ucode(struct xe_guc *guc)
>   			  REG_FIELD_GET(GS_MIA_MASK, status),
>   			  REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
>   
> -		switch (bootrom) {
> -		case XE_BOOTROM_STATUS_NO_KEY_FOUND:
> -			xe_gt_err(gt, "invalid key requested, header = 0x%08X\n",
> -				  xe_mmio_read32(mmio, GUC_HEADER_INFO));
> -			break;
> -
> -		case XE_BOOTROM_STATUS_RSA_FAILED:
> -			xe_gt_err(gt, "firmware signature verification failed\n");
> -			break;
> -
> -		case XE_BOOTROM_STATUS_PROD_KEY_CHECK_FAILURE:
> -			xe_gt_err(gt, "firmware production part check failure\n");
> -			break;
> -		}
> -
> -		switch (ukernel) {
> -		case XE_GUC_LOAD_STATUS_HWCONFIG_START:
> -			xe_gt_err(gt, "still extracting hwconfig table.\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_EXCEPTION:
> -			xe_gt_err(gt, "firmware exception. EIP: %#x\n",
> -				  xe_mmio_read32(mmio, SOFT_SCRATCH(13)));
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INIT_DATA_INVALID:
> -			xe_gt_err(gt, "illegal init/ADS data\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INIT_MMIO_SAVE_RESTORE_INVALID:
> -			xe_gt_err(gt, "illegal register in save/restore workaround list\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_KLV_WORKAROUND_INIT_ERROR:
> -			xe_gt_err(gt, "illegal workaround KLV data\n");
> -			break;
> -
> -		case XE_GUC_LOAD_STATUS_INVALID_FTR_FLAG:
> -			xe_gt_err(gt, "illegal feature flag specified\n");
> -			break;
> -		}
> -
> +		print_bootrom_ukernel_err(gt, bootrom, ukernel);
>   		xe_device_declare_wedged(gt_to_xe(gt));
>   	} else if (delta_ms > GUC_LOAD_TIME_WARN_MS) {
>   		xe_gt_warn(gt, "excessive init time: %lldms! [status = 0x%08X, timeouts = %d]\n",
>

