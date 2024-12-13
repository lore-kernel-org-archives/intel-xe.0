Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB3BE77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 16:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2ADC10E25B;
	Fri, 13 Dec 2024 16:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYSG9t9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7C510E25B
 for <Intel-Xe@lists.freedesktop.org>; Fri, 13 Dec 2024 16:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734108159; x=1765644159;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cr35CrqnlgNwYs6R5fHBpOS6j6ND0/YOnkmrGgO8yUA=;
 b=FYSG9t9Iv1CLcr5XH6Hkc7ZcDu6duQ+a+ixZDY+MmBnq7Z11XVp/5qjj
 ZtuKNeqr7Gn3hgUQlP8ea/6gtRFJhoEOMzStfghKJOd4XP1HLWcG1sxLQ
 9MA1erNvkXvhvfyeReEpUd1pTfTWDx9gKEpbWj7oSJVJli38gJc524qZr
 3Q7pC+GW3Ezv+Ub07BQ/c4RIoKfr1ADZxh9GME7G7xfh2EERMxonUXhIP
 qKpcf1otS2TJqPeucCjbvVgN+9lVoL0Nvyi3Yi09ddfdIOMxrDrqVmF6I
 9r9bByP+sv9YXh1k6B0OfpS9H4ZPPDRHcKteMKyLYcN/xePSRfuLdm/2d Q==;
X-CSE-ConnectionGUID: /u+o4BNOQa+I6I4U6gaokg==
X-CSE-MsgGUID: GgmQ0m6DQ32CEsrmRamAUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="59961695"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="59961695"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:42:38 -0800
X-CSE-ConnectionGUID: x+E5GkzzRYSK+nJRxeZ37w==
X-CSE-MsgGUID: 3bXI4GJTQPmM29WB0gk8nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="96442350"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 08:42:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 08:42:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 08:42:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 08:42:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujzT4t0/J96RXtsIjDzGar909oKRnujsjN2pfyGu+jc8b09e+tYBWW6fjw027ZRjG/NIGCYaEWiH4nhMPmGetWZRdH0rw0nlSi1U3d+7Hv0s+G6jQU1HCwfCeXl5r+qFwPBD1nIRoG96+E+9EiGiw6+KYosjh1Bg2xkudgmNow988GktSQpaE72xEka9UHcIrQ14AJOG9PDOEAndUxJaHDy0Ct5Wod/RISC2elYXKrVsRrco34fOkPuaJt81fNgX4DMOVHYu0hu68voQfZy7m2v11PDpLUpOx+Y/K2JQR/JlAFd1Up7j+hb75EyOZDvtiWJNleeGhtB4ENPmQT6bHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng6gdEWiYc8allu8VkgImLYZzXGF4vNBxjcPkRrVO/0=;
 b=AN0AhEVyilPSvzD+hjS/ie7JJ0vi53EEAElskVGi2phnpyPZY035xy2vjdrv6Clvv9T4tPjzHl7bAa0a1MLVWJbS2IwHi9urBgYti7OHPdkpn8dbu8mSkbVP5+tnUrEl7NQ2CxxMwMO+/t2b8MMxHzbt0NrCM35DCEGi8ix6fIdvS867hvP/biGbq7WtkkQG3IeilDvohXgkzScInvMRA9sS8DRLjhDYT7NoB6F1LaAI1ia1fVpHdCdipbqmVV6Z6pzqn58IBCQlNcmDtNKHFzHCFXHbhLOU6uYDI4BKknsG7wVIA6LZhp3sad1kMWz75sXaM6sC9NbHDFa8divt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 16:42:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 16:42:12 +0000
Message-ID: <cc639b61-a7c2-4a28-82ca-9ef5a7eb5ae0@intel.com>
Date: Fri, 13 Dec 2024 08:42:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/11] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Intel-Xe@Lists.FreeDesktop.Org"
 <Intel-Xe@lists.freedesktop.org>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, Matthew Brost <matthew.brost@intel.com>
References: <20241003004611.2323493-1-John.C.Harrison@Intel.com>
 <20241003004611.2323493-5-John.C.Harrison@Intel.com>
 <ccc1066ab139e800cd8f67535c97aca486bf105d.camel@intel.com>
 <7qhmppwrqj5fsr3tkvufwua3iw7noadrefajrii66x7yydfeba@lqhgd7b5decp>
 <208f50d9-58e8-413e-915f-95ca077e0fa0@intel.com>
 <dahmzb4tveblm74nwhq5mabz672xivpfeuvkpzb6hnjfs4qrwt@rl6c56v6mfyy>
 <db943f8a-0d92-49bc-827e-46284739e8be@intel.com> <Z1xCHJHd4JI3UNVk@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <Z1xCHJHd4JI3UNVk@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:303:8d::18) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CYXPR11MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be57929-d8a1-4f99-7138-08dd1b951833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KytiSktkTDlqMC9tNWRPbzJVajlROFhKMkhySXZaT2p4aU82THJLd1dFTVBG?=
 =?utf-8?B?WWQxWEZpN3Zlbk1VOGxQZlZFYmtwaTJQQUh2b01IL3owNXcyNkpZN0ZIb0tl?=
 =?utf-8?B?N0NnelMvRHVmMktyNGVLMkxZYUZ1WDZPc1FFdXFmbEFLYkNsL1BsUmlBMHBU?=
 =?utf-8?B?VGY0UVpsMXNIMUtjMWxQYi9McVBNeHczeUdCU3hsZDYrL2dpVExHYlJFU2x3?=
 =?utf-8?B?bks4VkRyUDY0TFVENkpYUEpjRVFHK0FiY20yYTdPZ05ZSkVBNEc2OTFGdHlV?=
 =?utf-8?B?andWRWRvM2o2NTJsa1Jyd2dSc0hIQm5ndmdDZ1IyWElMa1l4NVB3ckhlbHlL?=
 =?utf-8?B?Vk5WUXlXZCtoYVBVdVZEYVcrZkExN01YdHY3aCtHOXVzYkpZR1FxeGZPZEQy?=
 =?utf-8?B?TTVGOWx5U1ozKzdOVmQwTnkwV0dWN3V3L2VQMVNtVVFNRzRRSUdzK3dpaW84?=
 =?utf-8?B?K09LNVJZT2dpOHArVXJOelFLWVRnMitGaXR2NzVZTE9rWGtWSGxudGI2K2k3?=
 =?utf-8?B?TXZvYVBwUFl2NFhub00rb0ZlQ2ZFT09wd1NNOEFoeldPSGgyam5aSUF0NWh4?=
 =?utf-8?B?QzRLTXZiMC9CclJueWZCZ29GY3pndUJjQjV2UFVlSWR1a00vb1czSE1CSnJp?=
 =?utf-8?B?MU02d3hHVGxKNU8rM1VUR3dObklNRit0K3RvbVFDdVdkaTFNNnhqdDFCMlcr?=
 =?utf-8?B?RXVUWWZIWnBJN25hWDlMeklqVytPdnhySmt2dWtxZjFmNllJVStNZVR5c2FR?=
 =?utf-8?B?RGdKVTVreE9iRUluU3o3dmFUUVNtYjZVZWhkYUN2ZlJUSUw4aWRxbVVTNmd5?=
 =?utf-8?B?d2p3V0I2aEN0Wm55RVUvWElZUThWL1dGaTNMUlVRc2dCY0k0ZFowVXpBTFlF?=
 =?utf-8?B?MUUxTTJwYnNZS0pUaERhWlBKdWNSYnU0UmJhdnVieStVYU5iTkZ0c2t6SGVI?=
 =?utf-8?B?bjd1ZGxqUS9FS1QrSnUwcmZQRkc1UG93bVFoMENBalFiRng3cnBsOEFYYXpG?=
 =?utf-8?B?TExBelVXQjMyU1BBYjlzSWZSOGtyQU5vNGZNSGx3cSt1REh0bDcxM3V5UzRJ?=
 =?utf-8?B?TmFqY3oxTU1lcTMwUWQraThIemFuS2kzWmh6b0RJcjFRT2NwK3NXN05mbk51?=
 =?utf-8?B?RC9xbXd4c3FLNFRNN3FzQVBZbTZ6QnRyN1EzMURuSDdLclV1cm1HM0grUnBO?=
 =?utf-8?B?SXFnODhOdk9RcmxnL2plWnVrZytJbDV4cWQ2c053NXpYbmxlbE1rOURlV04y?=
 =?utf-8?B?NHVhdW5rSFBhOU1xaXYwZ3NJQXpPaEJZQjYxMGx3Z3Fubmg2ckFJcnROTVNH?=
 =?utf-8?B?LzJQSlorUGFuZW9pZnd5NVlScFZpcFc1bythWVhhN1pUZ09UZkd3VWlaVUY2?=
 =?utf-8?B?U05Ec1F5TS9oNm1nSGJRK25aK21hdFR1a0xUaERndjR4bjZuUW1QalRRNkhK?=
 =?utf-8?B?SHBNYjY3SHJkWVNSSzV2Mm1LVzRCclpMdkZUb2NVcFpTMGtRTnpzK3FZVlg1?=
 =?utf-8?B?VGdPQVFMVDBqNEZMNUdSWTQyaHVLSzBKMUdFcFBTZG8zbFNqMzNsbGJiRXlH?=
 =?utf-8?B?L2hxUHZDU3pYZElMZ2V4NnhOSlhqdjNNQVgwY3ZjYmF4UGR1NGFSVEN0U2E3?=
 =?utf-8?B?c2dZQ1plRExmQUJUbXptZ21iRFovVTUzNUh1Tkk1bjY1azA5a2lINUd0TWRa?=
 =?utf-8?B?Sm9nVkNITjB0bGRPMThndlJ5NmZrTGtzRGhMeTUvbHhxN0tpQTZFWURpbGRr?=
 =?utf-8?B?bmp4ZHJncDRJS1ROSklhODhKU21HMjhKYmgrL0dMSTBTelVyQ1Q4Z3N3RHdX?=
 =?utf-8?Q?LhDi7JQS7HoOL9MdFFppTxE3zZ4OztP2EiBIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHoyY0hSVGRnRm5KZ2FXVURSZ1Noc0NycTdDSFpWVUpvTTZkM3prc1NsWWdm?=
 =?utf-8?B?S1hyQ1lRS1hETkd4d2ZPWEdPUDhpY05nYVpZWDZFUll1THZmT0tCYzFKTTla?=
 =?utf-8?B?RldTUi9oSDJPVFd0bDVPWlBlbUNKK1VLeFBZN3FVQkU2MHpVWXM0TFJDZTc4?=
 =?utf-8?B?WkYzNm1YeGpKUWlMSkNrd1VKZ0hVb2Z0dy84NVh3elUzOEo4Zk9nSjZPZDll?=
 =?utf-8?B?dkREL0dTZ0VuRmFza0FIdHdHV09Ta09rUVFEcFpFYW4zc0ZqcnhpZDFSeWJh?=
 =?utf-8?B?d2xxdGFzYWpoelVlWVUxTS81dERaWEFBOGFOOVgyVmlycEhxdm5URFRpNHM5?=
 =?utf-8?B?TXlMemJNTnVxcGNxeTliNitJNE1jSmZmSkFSclVhVU9MZ0pGdFk2TUp2OVdI?=
 =?utf-8?B?YWxxWGZPMFMrRWFkeEVhQU55SHhpR2dEWDdlZnlhamZPWnkwV21pMWxjT3NP?=
 =?utf-8?B?aHBDY0dCN3N3WTFSZEJYY2QwV3RBeVljVGgvYzVVRmxCeEFCT05IcG9uWTZW?=
 =?utf-8?B?TnZBdzY5SHlQK0J2Q05EYWFBZGpydkZQeWVYM2NBVnhsVGdqR1NQMS9XV1ky?=
 =?utf-8?B?amhhdzBncUNidnU1MDVwNDBhVSsxWjVSb1krSStZM040UGZiRFo2RjByUSsv?=
 =?utf-8?B?UUkySnBTcEtFMDIvcml5b2UvdnF5SmhQRzMzOG1lWlRJOTNPQzA0YkFtTVY4?=
 =?utf-8?B?dnRienJiZzBQK1l5ejdTcDNJb0tETmdzUVVNRllDWFlhbHJMaGpnQ25ubDBS?=
 =?utf-8?B?Y3VMdXZmS2xHejRSb052cmdSWXh4djhPVXROZzdsWC9RaXByOFdFcVFRVGts?=
 =?utf-8?B?ZlNCd2s4Wmt4d0xqVUlZQUpQSm0zR3VBRnBRMkNod0dkeEJHVW5XQmhXTzkv?=
 =?utf-8?B?aDRwYUM3M3ZPejNKbFpEekxLQ0lha2dWV25kMjYrYzZObmNKWUs3eExDL2li?=
 =?utf-8?B?WWVJbENKVTRUM1NtMnJIc1dEZWxjdTIxUEpnY2tOcEtiaHZYR3RaUDVvOTZZ?=
 =?utf-8?B?Tm94czJiNmJSTVpZVVdjcnFNbmdkZ3JPd1U4Smx1NE83ZTNzeEluK0xGRWZh?=
 =?utf-8?B?WTFVVmtVYzM5bnVHS2xEMEtudE5LTUl6bldlem5KWkNBOUsvaktuUm00czAr?=
 =?utf-8?B?a2M5Z09jUytaMEVVZzk3cTBqSHV5WmhOZW8yMkVrelMraXVyS3h3NXpMSlNw?=
 =?utf-8?B?bUZKNFRMOUJWQXg3dnU4cEs2Y3pjNWQzc0xqdzFUeFhpTWZENElTenRtenNZ?=
 =?utf-8?B?Y2pCOGV1aTdZNmRJTUZRRnNXM29qV2Jmai9uUXQrRG44VWdqaWZKRzNJcWho?=
 =?utf-8?B?dGVyZHc0S0VPb1ZLU1NsbnNjVUdnQzRLOVAzZ2hsWWlSVHYxSmNmalo2cTRa?=
 =?utf-8?B?bEZ3K2NpVVhtN21IOWtZb1Baa1k4cCtJdTZiYzNhdGlSSG1JYTFZcG5WTTJ6?=
 =?utf-8?B?MEVCSmRlQlF4M3ptT1dCdndvVnNBbnREbEc4Z043U3luS1JMUXVLMXcvNzBy?=
 =?utf-8?B?LzUwMTlCbkhvQ3FIeGJadXZYMDF4Mkt2QzA0Mm14RTFySmd0RnNJVjJOSytQ?=
 =?utf-8?B?TEtZQTdGR0RiTHhibkVVVlBnYWttQ0ZZSVIxcHNzTU1WT0ZaWkM2cFhDeUZk?=
 =?utf-8?B?OEFiUkNBa3laNjJhT210cVFHN1VTeVJpUTZvZGwrWWJCcXU3R0dIZEJvUHN4?=
 =?utf-8?B?NGVKeTNvSFRIQnZzUytrbTYwNUJDZUs0Y0d4SXdHb0I1WHNLNkhGRXRnYTh5?=
 =?utf-8?B?ZlBKbnhFNXVjQzdYMlhzcFRHRmlFYnJndkhuTW9hU1JpZVVSeXZpcXF2dkts?=
 =?utf-8?B?VUpCUS9YZXhMM3ZPQmpCUE0xSnpJTlNtN284cVdkTklpdDVHQWl1ajFCK3BM?=
 =?utf-8?B?WDY0d2c4dTZzRHBzMnVFeXQ0ODQrZ3hHOW1ZVDhQaEd4NkVDeTRoV1grZUV6?=
 =?utf-8?B?Rkl3cXRrcElHZFI1QzVjQjhVeEtSWXY3Q0hmR0dhS2U4N2dOdDlURE5WSXh0?=
 =?utf-8?B?eWFFZzE0VnNEVzRERHprT0JUZE1sZi9ZL1g0ZUxqUFI2dkhYNDNzOU43RnpC?=
 =?utf-8?B?a0VLdjliVTJ5UHNGS1c0S0ExSEd2c0I5TGZ4Wlh1K05Odk82bFpZemhyL3BO?=
 =?utf-8?B?QzJkMFdLdVF6OEZSYnk3d25udkRmOERQR0FMWmhVRnk0dXl6YzVjTDBNeWtU?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be57929-d8a1-4f99-7138-08dd1b951833
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:42:12.8409 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiDh3FD2hvJHn4/qWc8YiT/mAsd0lWfkrV/Orjf93F6+Uj/gn4fWGFhd/wdRg0lYFPZgdKCabaMLViTFLjLXKCBK6nFWLMHvYTLBjNWpoN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
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

On 12/13/2024 06:18, Rodrigo Vivi wrote:
> On Thu, Dec 12, 2024 at 01:04:23PM -0800, John Harrison wrote:
>> On 12/12/2024 12:52, Lucas De Marchi wrote:
>>> On Thu, Dec 12, 2024 at 11:14:23AM -0800, John Harrison wrote:
>>>> On 12/12/2024 10:45, Lucas De Marchi wrote:
>>>>> On Thu, Dec 12, 2024 at 05:41:41PM +0000, Jose Souza wrote:
>>>>>> On Wed, 2024-10-02 at 17:46 -0700, John.C.Harrison@Intel.com wrote:
>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>
>>>>>>> There is a need to include the GuC log and other large binary objects
>>>>>>> in core dumps and via dmesg. So add a helper for dumping to a printer
>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>
>>>>>>> Another issue with dumping such a large buffer is that
>>>>>>> it can be slow,
>>>>>>> especially if dumping to dmesg over a serial port. So add a yield to
>>>>>>> prevent the 'task has been stuck for 120s' kernel hang check feature
>>>>>>> from firing.
>>>>>>>
>>>>>>> v2: Add a prefix to the output string. Fix memory allocation bug.
>>>>>>> v3: Correct a string size calculation and clean up a define (review
>>>>>>> feedback from Julia F).
>>>>>>>
>>>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>>>>> Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>>>>> ---
>>>>>>>   drivers/gpu/drm/xe/xe_devcoredump.c | 87
>>>>>>> +++++++++++++++++++++++++++++
>>>>>>>   drivers/gpu/drm/xe/xe_devcoredump.h |  6 ++
>>>>>>>   2 files changed, 93 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> index 2690f1d1cde4..0884c49942fe 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>>>>> @@ -6,6 +6,7 @@
>>>>>>>   #include "xe_devcoredump.h"
>>>>>>>   #include "xe_devcoredump_types.h"
>>>>>>>
>>>>>>> +#include <linux/ascii85.h>
>>>>>>>   #include <linux/devcoredump.h>
>>>>>>>   #include <generated/utsrelease.h>
>>>>>>>
>>>>>>> @@ -315,3 +316,89 @@ int xe_devcoredump_init(struct xe_device *xe)
>>>>>>>   }
>>>>>>>
>>>>>>>   #endif
>>>>>>> +
>>>>>>> +/**
>>>>>>> + * xe_print_blob_ascii85 - print a BLOB to some useful
>>>>>>> location in ASCII85
>>>>>>> + *
>>>>>>> + * The output is split to multiple lines because some
>>>>>>> print targets, e.g. dmesg
>>>>>>> + * cannot handle arbitrarily long lines. Note also that
>>>>>>> printing to dmesg in
>>>>>>> + * piece-meal fashion is not possible, each separate
>>>>>>> call to drm_puts() has a
>>>>>>> + * line-feed automatically added! Therefore, the entire
>>>>>>> output line must be
>>>>>>> + * constructed in a local buffer first, then printed in
>>>>>>> one atomic output call.
>>>>>>> + *
>>>>>>> + * There is also a scheduler yield call to prevent the
>>>>>>> 'task has been stuck for
>>>>>>> + * 120s' kernel hang check feature from firing when
>>>>>>> printing to a slow target
>>>>>>> + * such as dmesg over a serial port.
>>>>>>> + *
>>>>>>> + * TODO: Add compression prior to the ASCII85 encoding
>>>>>>> to shrink huge buffers down.
>>>>>>> + *
>>>>>>> + * @p: the printer object to output to
>>>>>>> + * @prefix: optional prefix to add to output string
>>>>>>> + * @blob: the Binary Large OBject to dump out
>>>>>>> + * @offset: offset in bytes to skip from the front of
>>>>>>> the BLOB, must be a multiple of sizeof(u32)
>>>>>>> + * @size: the size in bytes of the BLOB, must be a
>>>>>>> multiple of sizeof(u32)
>>>>>>> + */
>>>>>>> +void xe_print_blob_ascii85(struct drm_printer *p, const
>>>>>>> char *prefix,
>>>>>>> +               const void *blob, size_t offset, size_t size)
>>>>>>> +{
>>>>>>> +    const u32 *blob32 = (const u32 *)blob;
>>>>>>> +    char buff[ASCII85_BUFSZ], *line_buff;
>>>>>>> +    size_t line_pos = 0;
>>>>>>> +
>>>>>>> +#define DMESG_MAX_LINE_LEN    800
>>>>>>> +#define MIN_SPACE        (ASCII85_BUFSZ + 2)        /*
>>>>>>> 85 + "\n\0" */
>>>>>>> +
>>>>>>> +    if (size & 3)
>>>>>>> +        drm_printf(p, "Size not word aligned: %zu", size);
>>>>>>> +    if (offset & 3)
>>>>>>> +        drm_printf(p, "Offset not word aligned: %zu", size);
>>>>>>> +
>>>>>>> +    line_buff = kzalloc(DMESG_MAX_LINE_LEN, GFP_KERNEL);
>>>>>>> +    if (IS_ERR_OR_NULL(line_buff)) {
>>>>>>> +        drm_printf(p, "Failed to allocate line buffer:
>>>>>>> %pe", line_buff);
>>>>>>> +        return;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    blob32 += offset / sizeof(*blob32);
>>>>>>> +    size /= sizeof(*blob32);
>>>>>>> +
>>>>>>> +    if (prefix) {
>>>>>>> +        strscpy(line_buff, prefix, DMESG_MAX_LINE_LEN -
>>>>>>> MIN_SPACE - 2);
>>>>>>> +        line_pos = strlen(line_buff);
>>>>>>> +
>>>>>>> +        line_buff[line_pos++] = ':';
>>>>>>> +        line_buff[line_pos++] = ' ';
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    while (size--) {
>>>>>>> +        u32 val = *(blob32++);
>>>>>>> +
>>>>>>> +        strscpy(line_buff + line_pos, ascii85_encode(val, buff),
>>>>>>> +            DMESG_MAX_LINE_LEN - line_pos);
>>>>>>> +        line_pos += strlen(line_buff + line_pos);
>>>>>>> +
>>>>>>> +        if ((line_pos + MIN_SPACE) >= DMESG_MAX_LINE_LEN) {
>>>>>>> +            line_buff[line_pos++] = '\n';
>>>>>>> +            line_buff[line_pos++] = 0;
>>>>>> This breaks ascii85 parser that we had up to now.
>>>> It should not break the decoding of existing sections. This helper
>>>> is only being used for the new GuC objects at present. As per the
>>>> TODO, the intent is to use it for all blobs in the future. But that
>>>> was deliberately left to a future update (which hasn't been posted
>>>> yet) to avoid breaking the mesa tool.
>>> it broke nonetheless because then it fails to decode this line the way
>>> it was doing:  each line starts a new key.
>> It barfs on any line it doesn't understand? Seems like it could be made to
>> be more robust in general.
> We do not break userspace.
> When we do we do not blame userspace.
There is a difference between blaming and suggesting ways to improve. 
This is an ongoing discussion to work out exactly what went wrong and 
what is the best way to fix it. I am not blaming anyone or saying that I 
don't care and am not going to help find the proper solution.

>
> I had warned it and was ignored:
>
> "We shouldn't be breaking the current userspace tools. Any change like this would
> need to be synchronized between all the current decode tools."
>
> [1] https://lore.kernel.org/intel-xe/ZuLzSMH_hBl9RWdv@intel.com/ and ignored
>
> Next time, please respect the only Linux rule: No regression.
As per other parts of discussion, it was never actually stated that this 
would be a regression. Various things were discussed but no definitive 
"this will break because..." was ever stated. Indeed, the patches were 
specifically written to only add new data and not change any existing 
data specifically to prevent any breakage of existing tools.

> Revert sent and applying it soon...
The revert will break the driver build. Please do not apply it. It will 
also not actually fix the mesa tool's problem with section headers.

John.

>
>>>>
>>>>>> And I think there is not safe way to parse it now, how would
>>>>>> the parser know that the blob reach to end?
>>>> The GuC decoder tool simply ignores leading/trailing whitespace and
>>>> keeps decoding until it finds a line with a new field - i.e.
>>>> anything with a non-ASCII85 character such as ':' or '*'. It is
>>>> totally
>>> character set for ascii85 is [33, 117] and 122, which includes both ':'
>>> and '*'. Hopefully it's hard to hit a collision, but we shouldn't design
>>> it in a way that is possible.
>> Sorry, getting myself confused - it was a while ago when I was writing this.
>> Yes, punctuation marks are part of the ASCII85 character set.
>>
>> The GuC decoder looks for white space - a blank line or a line with a space
>> in it. Any new field is guaranteed to be "name: data" so will have a space.
>> And sections are delimited with blank lines, plus section headers are "****
>> name ****" so also guaranteed to have a space.
>>
>> John.
>>
>>
>>>
>>>> reliable for me.
>>>>
>>>>> Just looked at this code to check if we also had a "Size" as I remember
>>>>> seeing it in previous related patches, but we don't. If
>>>>> we did then you could use that to calculate how much you still had to
>>>>> read, ignoring the \n. With the current scheme I think one
>>>>> way would be to continue the previous key when the line doesn't start
>>>>> with a new key. Awful, yes, and not future proof.
>>>> Any new field is guaranteed to have a colon in it and any new
>>>> section header is guaranteed to have a star in it. Sounds pretty
>>>> reliable to me.
>>> that's what I said by "continue the previous key when the line doesn't
>>> start with a new one".
>>>
>>>
>>>> The other option would be to have an explicit prefix at the start of
>>>> each continuation line. E.g. "A85:".
>>> let's not make it worse than it already is. And not future proof by
>>> given the encoding algorithm the meaning of "continuation line".
>>>
>>> Lucas De Marchi
>>>
>>>> The problem with a size field is that ASCII85 encoding is data
>>>> dependent - it has extremely basic run length encoding of strings of
>>>> zeros. So you only know the size after the encoding is complete.
>>>> Which means either the size field is in the dump after the encoded
>>>> data (which is therefore useless) or you can't stream the encode and
>>>> must encode to an in-memory buffer first, then print the size, then
>>>> print your pre-encoded data.
>>>>
>>>>
>>>>> John, I explicitly said *we can't break the existent users*,
>>>>> pointed to the one in the mesa repo and confirmed with José it would be
>>>>> indeed a breakage. Please check again the past email thread at
>>>>> https://lore.kernel.org/all/3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu/
>>>>>
>>>>>
>>>> That discussion was a question for Jose not a statement. As there
>>>> was no response for several weeks, I assumed that it wasn't a
>>>> problem after all.
>>>>
>>>>> Did you at least prepare the mesa parser for that additional \n?
>>>>>
>>>>> We shouldn't have merged the kernel patch as is with the excuse
>>>>> it reads
>>>>> better in dmesg, when we also said we should not print that garbage to
>>>>> dmesg :(
>>>> Not following. Should not print what garbage in dmesg? As I keep
>>>> saying, none of this goes to dmesg by default except in the case of
>>>> catastrophic CT failure. And in that case, it is extremely useful
>>>> and the only way to debug issues.
>>>>
>>>> John.
>>>>
>>>>> Lucas De Marchi

