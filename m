Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF6ECA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 08:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F58A10E650;
	Tue,  9 Sep 2025 08:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQ62O0j3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191E710E650
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757405989; x=1788941989;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vuycPHAxTGSJVG37LYGgaqYkELT50l/Q1m6eW39LYX0=;
 b=hQ62O0j3lxpqaDWIuLBtbGGJDV0kQLquUgUdl1O7SFtznKhGSghs2d02
 Wf8rFluE1HkdgTR3ZOCQdyq8L4xCnMcEDqqF0eJ7h6TS3zfUzxJYx7EKp
 BWyB1HqxfCAOMy/sCHZMiH3uM4WtGgEpK+ybplmdwBbJEf2JpfaLXzwxK
 l01vhWSmPLmrsiYRqLjbJvlPom3hR4t5KoKR6OEwxNZPVMT3SnIdw/SQS
 UlJfBSb/Yf4IXwVFxHMKtWL+rwh0p9pyvoWkWfupWPFCeZ3AuoHlaqbbT
 6gjHkUg9YfHgbAEKfOCkuTuldiAFrepJm8ukQTfhprTYYg6Y5jtzmL3kd A==;
X-CSE-ConnectionGUID: 5wt/bl5HQ42X1E9Ae6KhFA==
X-CSE-MsgGUID: zkGlvu87QcyiHeeyMqzcLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="70781239"
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="70781239"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:19:49 -0700
X-CSE-ConnectionGUID: oVyFqP2/T++zokeK9mo5wA==
X-CSE-MsgGUID: dtkDLC0DTA2edcPtfxcLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173144828"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:19:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:19:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 01:19:48 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 01:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCbFvv8y6/lt84WYN0q8aIyeDqQ2ThE+nQXVwFwkhm5zT5UrLzKUiV3Ni9xDwlQCWM7kYaHKX3ZJuu66X22gPcegcDvBjWVBfHT+/lFj5OmY86SO1bCHh2BYrSdiuW9+oMJwxMq7QZR8QBUKq/hUJmRdLg2ZU+C4Y9DizdfnBkXRI415iEbZCcyHf2R2PMVP5PR3uZuhbzVAw/rUPm2MUQQ0R7MyTaqqfGHXxSdAR+vVCGoxhfBPQupfwhXlTyNr2Nqke/R3YdUde02cIdvCiCoCboWLEk8UXEB18+T0EJjaMeGVoDi7ZsDxMBoPO8N3kMSYWbwdeypVBt5HuUF+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBf6E44qSNGm0D70K8AEr7x7qhUuSxTQnNCv91XqqXs=;
 b=sK3t+pNosi2y740HnABsNBxEKZGRjfOnkk8aI/cAg0QJewd0qRCbZl8kCKbem7NgQ9CyfaEF1ylPLf5QmVgRMmyUpfFIjNdTbPtlbeq5io3h+VHxNxWGschUkCgvkUMgajN70uoeatLz6TwZFWt0OyylXX+OnPKAZfkwsLkKlvyNYu4ceNQOFOk8QDIuJwaJrYtQ1KwW0HzoNEQpQg4dEszzGNOQ0yLcq+hxf89rkiIlCG9Vr489yHVVM1fd4la2BAkCJpDpayX84LixAlUx+GQ53mU85bIVScsRanSTuxPIkDiZ3RMPkc+96M6lf72zZPfsLo90op2WvOky3CR+lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 08:19:46 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 08:19:46 +0000
Message-ID: <d1c96319-5672-4c39-afcc-2e64f7d5325c@intel.com>
Date: Tue, 9 Sep 2025 13:49:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/xe/vf: Move VF CCS data to xe_device
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250908123025.747-1-michal.wajdeczko@intel.com>
 <20250908123025.747-7-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250908123025.747-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 6254facc-809e-4012-feae-08ddef79a2d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2huTmUxaFl3dG04cTA5dTkyam9WK0ZHSHVGR0UwK2pESlBrV3lFcFVabnVF?=
 =?utf-8?B?R1huSEpPUDNCdEozamh5V1VmeXRXdW5BZ2doNnF0UFFiRDZDc3BXVXJ6ZHp5?=
 =?utf-8?B?TW1FTGpmVXNpbzhiTW02QjRHTVZBUW8yeUt3TlViV1VDOXpmU29KZlkrU2Zk?=
 =?utf-8?B?bjY0a29sazhzelNxZ3k3eXpMVmo5WWhHUFhOclNXZklibFRWWDZ5by9zSm9m?=
 =?utf-8?B?dXRpNFlwRWh6Z0NDZlY4VzB3WWJlYmFFZVhCMllUTldYV1pCRHErOEtZa1F3?=
 =?utf-8?B?UnpOSzdqMHh1VG9PK2FJVlRpSEdEdDRMblM4bDVCSjNXenFpRWh3MWVzZnBO?=
 =?utf-8?B?OGlxRWpmYjlRWkUwYmpxYlpJeC8xd3J4NURYZTlTZkkwUlp2b2tZcXJqTmpN?=
 =?utf-8?B?L1Z0SDJCTmVTQ3planRhMjZlUEt3ajNiek9rU3V5RVhnK1YvcXFwVUdITTVx?=
 =?utf-8?B?eVpEdkJuM05xL1AyZ0J5NmY2RG80R0FzVVoyK1AwSzlHR2lDOW5KWXlzN2VB?=
 =?utf-8?B?V2pTMFdQV0VMVjNKd2ZRMWNHSDlIclg0RXNmZVNZNmJOSXpQSVJudHYrTWxD?=
 =?utf-8?B?TnVhSlJjVVZWeG0rK0JKdmc1STlUZlVERExDTXNFWERYY243VTFNY3RSamd6?=
 =?utf-8?B?UGdlcXdyZEcyaHFhVTVMdjhzd2NBYUp1b213OC9qYXdiVUI4NWtOVFoxZm1F?=
 =?utf-8?B?M2k5RWtieE9CYVc4eFBCNXd4Nldrc2RWbU5iWUsrTmROdTBMNGdpOUkrZXdG?=
 =?utf-8?B?NmFxbGlOYlMrbnRNOGxhYVc2Z2g5cVB4U2twOTE5NE1vc3BMRC9IM0dUbTI2?=
 =?utf-8?B?c0hxZWdKSnROMVdlSENQRm5xQnlUZzlycjFmcFpUelcxejlYbktOV1Y4aUxo?=
 =?utf-8?B?clhqWnJKaHMwVXJUY2tQZVRqcW1BTEZSYkZDcHNlVGtPREhjK0xKazQzYUJU?=
 =?utf-8?B?Q3RMV3R2bEdwWkk1bVdaTVBiTGdwbkRPekFCUlJBRytKYktXSHk4ZldISStN?=
 =?utf-8?B?Ujg5TVQ4QmtpZXhWUG5aSWhaSDhPQ1Rmand0L0VISzVrZFhLc1lSWGkzRks3?=
 =?utf-8?B?SExpWlE5eGxZbzh1S082TCtDbGdFb005L0lIQkVmRVdYbUxVNHlEc2k0Tytv?=
 =?utf-8?B?Y1B1ODNuZUdKYW55QmFnZTNmUTMzcHA1bG1TK3NFZmtNSlYxYit3NTBmczh2?=
 =?utf-8?B?ZlBhUTR3NnNVNVZZVkxEbytyN01ZZXU5d1cwU1Rld2FRMnloRXJqZnNSOXli?=
 =?utf-8?B?UE9jYUxsSUNhdy9XclgwOVd1QjdpdmlvVHh3b0l6WDJNVmx6ajZxTUJBZmpk?=
 =?utf-8?B?Z0doUEcxaHIwbDVySW5kWGxxbHpFVFltUEF1eC9SY2llc09kSWh6VHJZbERE?=
 =?utf-8?B?TWR5ZEljN3dWZVZiclZ6czJBM0ttdUMxRXRhajh5QlRXZXV2UlB4TEVVWWNF?=
 =?utf-8?B?WGo2QmxiUGdKQjMvTERqbitSeHhJYVZEMndlanRaY1p0NElZaGRDUXBGeHJz?=
 =?utf-8?B?OThFNzg2Y1daRUxXMDFTSnpoc1VxdWpPRHM3NXhGN3VJK1NCY2RsaE9ZYThD?=
 =?utf-8?B?c2hyRWx5QmdRZjF2VUYvSG5oY3RsaVVtWGRLSndSTGZaWG51c1M0eFZiUEFh?=
 =?utf-8?B?RW9GQ083ZXY5c2J0V2ZHdTZGaEw2WU90YUZRWnZzb2RwV05vcEVMN3pJaEZ3?=
 =?utf-8?B?OUpTN3R4SFZHNVM4ZXBKdFNIWmRwTThmb2NoOGdQUnZ5Q0pOekN5T1R5ZExW?=
 =?utf-8?B?cDJhalNjRGd6Y3o5UGdoVmhKTWhWdjlUSGRqNm9yaXNkU2JpZXZsOUlOak5O?=
 =?utf-8?B?MUlGbDVyTHhHQkUxRDZnWnpBc25mYnQ3WE56dG1RTEVaTDlGZXRxcHlCa0Rh?=
 =?utf-8?B?a0Z4T0tQUkVlMGVmaVJRRm9mTmJUeHVoSWREaTV6RGJSY1lLcmdGVmR5K1NI?=
 =?utf-8?Q?PzGb8H/Aw74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVdES0ErcnBRNER3MW5vRUppbmp2Vis5TkMrSlJCcHlHTGY1elZDODAybnlm?=
 =?utf-8?B?NVl0QWZlMlVqU1pRbGJ6NUcxSWdZQklzZ3ZVdTJHYmgvdENsTm9uOTNub0Vk?=
 =?utf-8?B?OGIzbVNheTdXd2ZKZmVURUxCYURaOG8rVXlIVjJDRG5WdllIcVlkUlhrODNP?=
 =?utf-8?B?KzYwcFZNaThyYzk1cXhKUUMzZmU5ZVl0a25RVTJZbWJWU1U0UklDVlFwMXFW?=
 =?utf-8?B?ZUoyVUF4ZkFsS0ltWmZ5T05EdkpPbGhtOGNLc2doOFI0RmU2MGs0V0Z3bWVV?=
 =?utf-8?B?Vi9iVElrc29iQVZac0FqQmoxQjJoYUhoTmpCeGNJNUx3MFptRmZidTZ6Ymd0?=
 =?utf-8?B?VjZabGpHSGJQWTZoN0hCaVhoaHdYSGVpUFBXMHZVSFlvaVhtcHBOdk5xa1po?=
 =?utf-8?B?TnErZG5MeXVUVHQ0YllaUmFPS3pOOWM0M3dSaS9VUm1vVXd1N3lKbFlyc2k0?=
 =?utf-8?B?VGltaDNVZTg3VmhJSHE0QmFETVF0Ym53eXpTVkNhY01aajBQTi95MU1iYktn?=
 =?utf-8?B?eDVnOFkzOVY1WGNPdWk2U1VKZklETkR3VkJlRTVuaW13Wm5tWmkvOHRnQjBz?=
 =?utf-8?B?ejZpYVpIU2IwRUFBb1hlV0kxaG40d0t5SlE4SFhseHdRQ0pNa1htQWtsR3ZD?=
 =?utf-8?B?SWtmV2x4ejFqTndiK1NuWTJzMkE1bmw0Z1RzT1IvelErdWNTQUxWbjBWK2hO?=
 =?utf-8?B?RXUyS0JSNjZ6TEtCUTFVaXN5akNYY214UlVpUTVVVHdmc08zbWJkajh2dUNQ?=
 =?utf-8?B?dlVTaXFwVHFDT1RlSmJIVFl0U05leE9kMHJKZTVlNlJHTDZnbHJjNCtTVHdE?=
 =?utf-8?B?MHpnK2VyK09TRlBhOGtHblZYWGljZmxKdERPb2JYaUtLc3pJUk5Cc210bGJG?=
 =?utf-8?B?WjM4UHZ0VkVZMXNaV0JMSzA3Qmh0WXcxaVlGcWNWMkR5MWJjM1dJNitmSmdx?=
 =?utf-8?B?YmYxUEpRTWE4RmNySkxNaWc4azcyL2VUeEFsOXZXZDBOR1hCMkZsVDhUR2Rz?=
 =?utf-8?B?OTdRVm55ejlOQzdjTmNPY3VnbTV1SlhUamdnc3Z4T0grTysvTkN1bktLTEdP?=
 =?utf-8?B?Tyt0cFhSZDRCWkpUZG5oa2FaK2lKazFOcGI4THpUUTFNc1dKczRSbmZySmlZ?=
 =?utf-8?B?eDVvQk5tdVVTaURWVmNiOXlTQjFHOHJ5YTFrdkR4SWo3OGVWRURnSlI3UmRX?=
 =?utf-8?B?c3pFVHM5TnNPNWxreWpHeHAzcUs1L2dyZXRNbVpHVkxWa3M4NElKN1Q0ckp4?=
 =?utf-8?B?OVpGT2hLeS9ndmxCTjAyZU80K005VVpBZWhDVXF6MGVWSVAvd3lqTEEyVFh6?=
 =?utf-8?B?SlRXcXhIdklqek8vUTI0RHpHNmFzRUIyeDRwOWJWWTlhSC82WHlmN2pveEt2?=
 =?utf-8?B?S1dNUHVSS1RvN3VaTnBXdXBQT1NjYWR3enpqdHdPTjUrTFowWFA1RFA1Mncx?=
 =?utf-8?B?VllJc0RoVzRyUjduT1FxQUsxVU15NkIzbVAxOERoWHJMczhuYjFFZHFMZWwz?=
 =?utf-8?B?cGkyZEhSTGFiai9GTnBkV1cyTjVuR0hJZjdyTXZMZzJCQnRkM2xzNWhoWW4r?=
 =?utf-8?B?NEdMRE9GMFNGeHNTMWU5SXlhK1U2WForKzRQZXVIWkN4T3ZCaXVJV0lZUytp?=
 =?utf-8?B?emZrMlRMVUQxN0hxTFlzZUplTnlyM0hmcjk0SWJHR3dLemV6ZzBTbjZlMC9Q?=
 =?utf-8?B?TTZqVGhtbmVCZ3F0ekFnYzBMUG8wRW5KNTlpMzE2Vnp2d3BQSHIzdDhUV0Z0?=
 =?utf-8?B?bTVOREp5cDBwS2VlK3FUMERGRzRoc1d5UGQ1ekxFM3JNclpRN1lGa2FzNHA0?=
 =?utf-8?B?Q1RhMDFadUR6UXdwaTRFS2VxUkJBZEFkRlFLV05UUDBJbkVKUFdybVlXRG54?=
 =?utf-8?B?V1J0a3dMaEl6MFE0NHRoT1lGWjFhcFpBYVFSU2gyNXRSYkljZDNsWXdSd1hz?=
 =?utf-8?B?V2VER3NHNlhPeXhIRGliUEFvdkZDRHB4TldDRi9JZ2c2dGxnN2ZxcStJb3ZC?=
 =?utf-8?B?VWJFWSt2TnBmSWMwZXgwWlgxN0QxVWZmdk8veHIvVGEvdldIU0xmN0JwY0Ri?=
 =?utf-8?B?RVFoWVowY3h3ay9SRTdodkRWdWNTczh0alpTcE1QOEQzd04wNzJNY3FzT0tD?=
 =?utf-8?B?Znl3dFkyN2xVRDVzS3hOSWRrQUJ3WmlVaW5rSnFvemZrZ1dpbGR0VlQ0L2dU?=
 =?utf-8?Q?8IX7jc6dCf62BWrvG137QZ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6254facc-809e-4012-feae-08ddef79a2d3
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 08:19:46.0700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETtmDfmtzP8TtGIoJ5Tu8Bn9kJowZ8ptPDkRtfrAtyXtIoFuYamEDgVOYs/tiF+GUil1nYDNJZbHkH0Iq3n5tbmQv+0Q8WGET9ig73waXdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
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



On 08-09-2025 18:00, Michal Wajdeczko wrote:
> We only need single set of VF CCS contexts, they are not per-tile
> as initial implementation might suggest. Move all VF CCS data from
> xe_tile.sriov.vf to xe_device.sriov.vf. Also rename some structs to
> align with the usage and fix their kernel-doc.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bb.c                 |  4 ++--
>   drivers/gpu/drm/xe/xe_device_types.h       |  3 ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c         |  4 ++--
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 21 +++++++++----------
>   drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h | 24 +++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_sriov_vf_types.h     |  7 +++----
>   6 files changed, 38 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index feb6e013dc38..6d20229c11de 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -64,7 +64,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>   			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
>   {
>   	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> -	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_sa_manager *bb_pool;
>   	int err;
>   
> @@ -78,7 +78,7 @@ struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
>   	 * So, this extra DW acts as a guard here.
>   	 */
>   
> -	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
>   	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1));
>   
>   	if (IS_ERR(bb->bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 1e780f8a2a8c..c0a1f71f767d 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -183,9 +183,6 @@ struct xe_tile {
>   		struct {
>   			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>   			struct xe_ggtt_node *ggtt_balloon[2];
> -
> -			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> -			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>   		} vf;
>   	} sriov;
>   
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index f6f2c14b642d..a9d960de0e5e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -126,7 +126,7 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>   
>   static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
>   {
> -	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = gt_to_xe(gt);
>   	struct xe_sa_manager *bb_pool;
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>   
> @@ -136,7 +136,7 @@ static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
>   	xe_pm_runtime_get(gt_to_xe(gt));
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> -		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		bb_pool = xe->sriov.vf.ccs.contexts[ctx_id].mem.ccs_bb_pool;
>   		if (!bb_pool)
>   			break;
>   
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index eb8436e44ca4..c5c60f05073d 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -136,7 +136,7 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>   	return round_up(bb_pool_size * 2, SZ_1M);
>   }
>   
> -static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>   {
>   	struct xe_device *xe = tile_to_xe(tile);
>   	struct xe_sa_manager *sa_manager;
> @@ -168,7 +168,7 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>   	return 0;
>   }
>   
> -static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
> +static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>   {
>   	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
> @@ -185,7 +185,7 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>   	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>   }
>   
> -static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
> +static int register_save_restore_context(struct xe_sriov_vf_ccs_ctx *ctx)
>   {
>   	int ctx_type;
>   
> @@ -215,15 +215,14 @@ static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>    */
>   int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>   {
> -	struct xe_tile *tile = xe_device_get_root_tile(xe);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_tile_vf_ccs *ctx;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
>   	int err;
>   
>   	xe_assert(xe, IS_VF_CCS_READY(xe));
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> -		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
>   		err = register_save_restore_context(ctx);
>   		if (err)
>   			return err;
> @@ -234,7 +233,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>   
>   static void xe_sriov_vf_ccs_fini(void *arg)
>   {
> -	struct xe_tile_vf_ccs *ctx = arg;
> +	struct xe_sriov_vf_ccs_ctx *ctx = arg;
>   	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>   
>   	/*
> @@ -258,7 +257,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   {
>   	struct xe_tile *tile = xe_device_get_root_tile(xe);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_tile_vf_ccs *ctx;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
>   	struct xe_exec_queue *q;
>   	u32 flags;
>   	int err;
> @@ -270,7 +269,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>   		return 0;
>   
>   	for_each_ccs_rw_ctx(ctx_id) {
> -		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
>   		ctx->ctx_id = ctx_id;
>   
>   		flags = EXEC_QUEUE_FLAG_KERNEL |
> @@ -325,7 +324,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   {
>   	struct xe_device *xe = xe_bo_device(bo);
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_tile_vf_ccs *ctx;
> +	struct xe_sriov_vf_ccs_ctx *ctx;
>   	struct xe_tile *tile;
>   	struct xe_bb *bb;
>   	int err = 0;
> @@ -339,7 +338,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>   		/* bb should be NULL here. Assert if not NULL */
>   		xe_assert(xe, !bb);
>   
> -		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		ctx = &xe->sriov.vf.ccs.contexts[ctx_id];
>   		err = xe_migrate_ccs_rw_copy(tile, ctx->mig_q, bo, ctx_id);
>   	}
>   	return err;
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 4d3c10907135..22c499943d2a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -6,6 +6,8 @@
>   #ifndef _XE_SRIOV_VF_CCS_TYPES_H_
>   #define _XE_SRIOV_VF_CCS_TYPES_H_
>   
> +#include <linux/types.h>
> +
>   #define for_each_ccs_rw_ctx(id__) \
>   	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_CTX_COUNT; (id__)++)
>   
> @@ -18,16 +20,32 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>   struct xe_migrate;
>   struct xe_sa_manager;
>   
> -struct xe_tile_vf_ccs {
> -	/** @id: Id to which context it belongs to */
> +/**
> + * struct xe_sriov_vf_ccs_ctx - VF CCS migration context data.
> + */
> +struct xe_sriov_vf_ccs_ctx {
> +	/** @ctx_id: Id to which context it belongs to */
>   	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +
>   	/** @mig_q: exec queues used for migration */
>   	struct xe_exec_queue *mig_q;
>   
> +	/** @mem: memory data */
>   	struct {
> -		/** @ccs_bb_pool: Pool from which batch buffers are allocated. */
> +		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
>   		struct xe_sa_manager *ccs_bb_pool;
>   	} mem;
>   };
>   
> +/**
> + * struct xe_sriov_vf_ccs - The VF CCS migration support data.
> + */
> +struct xe_sriov_vf_ccs {
> +	/** @contexts: CCS read and write contexts for VF. */
> +	struct xe_sriov_vf_ccs_ctx contexts[XE_SRIOV_VF_CCS_CTX_COUNT];
> +
> +	/** @initialized: Initialization of VF CCS is completed or not. */
> +	bool initialized;
> +};
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> index 2c94d1f92187..426cc5841958 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
> @@ -9,6 +9,8 @@
>   #include <linux/types.h>
>   #include <linux/workqueue_types.h>
>   
> +#include "xe_sriov_vf_ccs_types.h"
> +
>   /**
>    * struct xe_sriov_vf_relay_version - PF ABI version details.
>    */
> @@ -43,10 +45,7 @@ struct xe_device_vf {
>   	} migration;
>   
>   	/** @ccs: VF CCS state data */
> -	struct {
> -		/** @ccs.initialized: Initilalization of VF CCS is completed or not */
> -		bool initialized;
> -	} ccs;
> +	struct xe_sriov_vf_ccs ccs;
>   };
>   
>   #endif
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
