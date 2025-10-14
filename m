Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B4CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:34:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D3510E565;
	Tue, 14 Oct 2025 07:34:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eq5uSpXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2CD10E565
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427259; x=1791963259;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/aFyHK0C0vZsoz0x+TTlqTE9kb0hhrJ3Jm/0r/pT59E=;
 b=Eq5uSpXzLMb3SMnB9tOqb4EM2T8E1pK2ek/yl/mu76mnnLCcBrnnKmgb
 kWpEN81Qnm1uh7axxux+e6/HyF3KK/HwG9ci+eHp4V25+tRhffpCVxASi
 iWVFfLCk9PK0GDvakqdwfyWTiVzP3UIuJjrLKIIhxR3EhWDGiVbaqrfh2
 fo/uRphii5hL+DZjRloTIDCcsn7eWaS6aKl1LZhHu5wLNkOZ+X9Km1yeH
 EC/qiNOXjbdkpNgtCCRkdwdDUUDpmcYnKRE9xLSrG0MBn5peKsJ93rWFp
 E25VqwMt2GL3PO8BLLF3o1BIyeQzb5vZo79whN/jyVnURKYPSbJvhHLNU A==;
X-CSE-ConnectionGUID: PBefI3bBQUe8h35J+44n8w==
X-CSE-MsgGUID: I9D7ZCiFScWA4/dyYYhcTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61616937"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="61616937"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:34:19 -0700
X-CSE-ConnectionGUID: 9GzBLUxzTuGv3lJoGNwOHw==
X-CSE-MsgGUID: 5jDHSuk7RYO+8BSaPXt0Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="182260036"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:34:18 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:34:18 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 00:34:18 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L80XOj+qwh/QzBqOXegvRjX42jfl4bk0bHwcF6me/7feedCdS/gpJavui6Q20vlMaPVtczkKPDvXiAA4FNthd8SLbqpU0pIpVGBMNtuZl9QigVLU2cObckNPvqQcGrguEfqNr3xj22Q4zJSZoyPyFQScXCSX8ERqElZc+tFl4412w8hiB+pywNMkZZFfv591vIkuYOOkpnukaBVcIWzBE8k+qK1pjoTDYyHLqkqNoNdTEuWotqCVp2yQNC6ireHIaSa0giFXDKd3oG8eHF+XmXeJAMefUCZhiPzPSNb0Oyz7a98oDvX1xNyMBT/osz2acP8LiqpCOkcmdM7yZEjdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNKxAB55Ley/mS377+ZdH9iydo3i1Cq2qmvYd01NywY=;
 b=FaKunI8fVcixmfutkUKtKfAnk/Osgx/3gCFpcTU74SqdlQTQDvLlEWoObsUg9ibLCr4HxcKCbC9vA5NkVbOWKipbJc+M0VKu4EJzbOgtOPzY4celif5g/iUJj8bu0tSbBzfvVt4CCDXEVHBc66U6/BoSDixmPzMrkPH6rjAL2eGhe0AOQQD8na6QBtPwd8/klSNARoWlfSofC7q9quMqWvPkHwkWMOVEBl1kO/VqtuyZbX/KrW8Iq3QjZKObcLzw7EPKMIlu7/gFMWD2fEQ/OCEDoa9J1nXXx8JaVdcMXEjGIGaWAigWroALQrkm0NGTW/OdrHCEfUNCYt58ruJ97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 07:34:15 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 07:34:15 +0000
Message-ID: <a8d6ecba-4e87-4835-a294-23302bf3ee98@intel.com>
Date: Tue, 14 Oct 2025 13:04:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/23] drm/xe/nvl: Define NVL-S platform
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-14-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-14-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0121.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::19) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: e0679cab-b845-4243-4067-08de0af4135b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZEZwRjJVQVpWTU1hYm5HL2haRjNtRHJnNnp0TDlyWGJCZGFpRUdzSi83SmdZ?=
 =?utf-8?B?TUhsSEZuTUdCRjJNQTdKQWdVNm4yUkQrSmFuN01aeWJuTDJkU0VNYjgwSUY2?=
 =?utf-8?B?V2NPMlI5RjM2SzBFUmdQWTJoaHdBZnRlWUs2UlBHWVFJNTBEZDAxMzdvcVox?=
 =?utf-8?B?ZWFaTURNRUxHeS9hc3dLUUF2RlFLL29zZEp5dFBuTkNBYlI0SiswQlVER3Rk?=
 =?utf-8?B?Q3NiOWJtYy84OHZ2eUJNM00xZVFyUUxScXdIa3hkUy9oQ0V3SncrTVFxSVZC?=
 =?utf-8?B?aTFDWHo3ZXBmZGJFOFBxUTdlMms3SXF5K0pMUk1RZ1crQXJPd1NUb3ZkQzRL?=
 =?utf-8?B?Mmw1WHlmNUt2U25mT0VQZ1JXSHpuY2VQdUdWMEFKTFpobG1NaVpnTldWQ0s4?=
 =?utf-8?B?SldDaWlQR2x4c2xtdVB3NjgreFhPMzRhWFlndUpGcThoRkJKQ3BoaVZkRnRl?=
 =?utf-8?B?dmN1WlNXaWJ2MnZoR3o2U2NGdU1uNUJNbjRjZXdVUWF0RUVLZ0hjbWFTL0FF?=
 =?utf-8?B?RmR3T2NGaG5GbE5vc2Z3VnNrWUozNlAzSFdJVjk2ZDRvWWppUFFodGtJbVRy?=
 =?utf-8?B?OHZJUDZRNXh3a2EvQlJWV0xPbko4TkNaZWQ0b2dUbHFXYkJhNVgwajlqbTBp?=
 =?utf-8?B?eTRScG4vbXNwRVVBMDdoemNCTkYwNEZaakgvOHBDZVpacDBiQ29ZZnZObGRL?=
 =?utf-8?B?YnZTdEhhV1phUUVRSVJ4S3lYZkpuWmw3cFlXN3VhR2E4M2RxUEtROXI0MFdE?=
 =?utf-8?B?QXlNNWtGcFlEK05yN0t6TEVYRDJpMFkyeFpNSTh0RU5iYVhyOXdON3ZqaUJG?=
 =?utf-8?B?SS9pWVkweXFoK2tHTjg1Uk5IOFFkY3dUSTNhTTlseU1KSFpORmkzd1dIUWd2?=
 =?utf-8?B?VUVoa2JITnVlOXV5dHJQOTF4aWJlTG0zNEpHZGhmRjh0L2g1ZktzQjJQWExB?=
 =?utf-8?B?WnBsYTZXRVJVRGc5Q1lHMWhuWFpFMVhXcXAwc241SDNFZHRNNzFmdlBxT1E0?=
 =?utf-8?B?SVUwNE1Ya0FkZkg0UHhTdFc5My9udkdCTjdPaWM5SUsycEcvZHBIaWhTOWJK?=
 =?utf-8?B?Q2x2RERzdnplcWh0dGJFcm94VVdFRmlPaVNFK2MyS1lteTVhSlFUYUZSc2Z5?=
 =?utf-8?B?ZlRQRTZPV21VT1BPZzVRby8wZmUvOEFaY21UaVZ3QnUzMFl5eGNxY1UxS1hJ?=
 =?utf-8?B?SXFKRFFVNkFOQnNJYUlSdlg3VW56bVQycVJIUy9jdWZQVFNIUlpOODk4aFc3?=
 =?utf-8?B?KytWaCtQYit5ZXdQYi9LOTIySXJ4YmJjWWxtUXpxM3lpa0p1VTRhbXJYRk5Q?=
 =?utf-8?B?a3NtbVU3SkJQTko5TGVLZVhXdisxdHpUaVRpaXdCZGE3ZDhEUmh2MkEvbnVk?=
 =?utf-8?B?TlBqeGN0L01LV3RMRXhZbjloUEFOSm9EeU13d3YrNFlGRlBQU09haHBZY2g0?=
 =?utf-8?B?VXlHWFFTSmt2eXd4WExsTkRmMlVUaUExNnNmaFlSaEI4VGlVTHYyY3UwNm5u?=
 =?utf-8?B?NUJiNnBKNUpMMEVDQTh2S1BaS1YwUVJqUWs2VGlmSUtWekdxYU5nZVJRbE5N?=
 =?utf-8?B?a3RISzFzSlVteDYvR2sxalhYbGhzc0phZG9zYWJkc0NjbTlTOEpZMjgwMzNZ?=
 =?utf-8?B?ckNWOEF1ZEtWZTd1Sk00THQ0VTQ5RW5sbmd1SG8rbnRFN2hZSzVwbEtiY1k2?=
 =?utf-8?B?NjNpMm9UdE1kWkZUVFcxZ1hoQ0RiRS9KKy9DNUVzM3dIMkpONm52eStpZHVC?=
 =?utf-8?B?ODAxQ3NIN2g5TkdqS1FOSWhIUWxKbHNzdGZhTjVPdHNpaFljQ0JFNFFCZG5h?=
 =?utf-8?B?MGhzUks2N1VsTFZiVU5LV2tmOUZTTTFBNkZMSVY0S2JYNnJFeHlGbkNvOXBq?=
 =?utf-8?B?aldVQTdhb01uNnV5dk0rMm4zQklVUnBFTkRET2E2WGFWbFVyT3dPR0RyaXV1?=
 =?utf-8?Q?K+i7CfcBngwjlNIk+qnNHS9mraRPeyj7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZtTDh3cm9QSHJUSXM5WWJMMGhiWFk5MGdKT2VHdHQrV1lPdnVWUkhUUDBz?=
 =?utf-8?B?UjhwTlZyckpCMzhwd24vQkJadDJVTVhVSGRKSU83MnNCcEwra1RoSWcxQUlj?=
 =?utf-8?B?L2h3MGJnd29Sb1FsYVhpTkRJb1p1TEhEcElDT1pzWDIwTGVxYk91NUdSVmJQ?=
 =?utf-8?B?OCs0VjJteElZWHR5Y0RqTytpR3FLMG0wV1ZWb2JRQThZVG9ZcUIwaHdnZGlv?=
 =?utf-8?B?c0R6SzFTVjJZdG9wdk9hY0pFbXJVNWMyM3Q3ZU0zSWwzemRHeWdSNmJMTGZz?=
 =?utf-8?B?UTdLS2E0a3diY0dRQTFmTGkzVXJEWkJCNVV5bndOS1Qycm1jcmxLaDJsODRi?=
 =?utf-8?B?YTM2SlVQZ2RQeUpvZ1VUQ2pucHorM09zYi9TZmJoNmNtSDhPSWp6eVJmaGpB?=
 =?utf-8?B?cXB6QXp2Y0RzUVgzTkIxVVlmSmV2NTlha2ZlWk1EejE5VGt6R3FoMEs3TlM0?=
 =?utf-8?B?SHVDZnB1eGtUaWJsNHgvWlVjbkp3ZytDN0xXY3NtYlJoSUUwOWZmLzRaSE42?=
 =?utf-8?B?TXNJRmRtRjhsS01mc2JCb3F2QUlxTWFKRlN5cnc1ZjFoUXE4Wm5JSmNjZEVl?=
 =?utf-8?B?aUZzNGdQVFpxQ2JMQXFDVm02KzlDNzZ3TU41aVBTWVF0RXpZMVBaMU0yQ3Bq?=
 =?utf-8?B?OERTNW5pbFRUUkszQ3lrekpqQk0zOHR3ZFRSQUxLZ1JQUlEwc1hZM0o1MkF4?=
 =?utf-8?B?dDJUTksrYTNHa2Q5OHg2dFlmVUtzdFpxdll1dDljc1J5NkRwUk4weTZ6UC82?=
 =?utf-8?B?cHgzQWNoYks1WkdZRklyOFhIT01iblRGK25nN2NyU1BsRkVJYUpiUkswMlJB?=
 =?utf-8?B?bHRYT0o0NGx0SXllNmo0d3RhNDVodjl1T2l0bGhudW9tMmExT21GVHRzUnJT?=
 =?utf-8?B?WlI5aVh3TkVxaU5zS01nOCtGTDd2UkJMQ1E2WlZuUE1JdWY0RWt4R0J5em0v?=
 =?utf-8?B?RXRNWlI5cnFGV2pjV2RDcDE1d2FBSndIRHZXQzd2dnlZVXRIY004Zy9OMHc4?=
 =?utf-8?B?MlZlbGU0WFdVRERmQ3c3K0tSSVArQ3NvU3JGZEdvT3E2LzBxWjZKOGw1TnRU?=
 =?utf-8?B?TldlY09UZXc0aXBid1R5V2NsYUY1SkpDTERKNjVEc0pSVjkxRjBDTHpGZG45?=
 =?utf-8?B?MExheU5WZDhCOENnUGpMU0J2dzFyb2duTGlwVVVvaUxhcnlqQmwzcCtmQVVu?=
 =?utf-8?B?U2x2YmNqT0g5aXN4aGRNVUljY0ZpL2UxRHNZMnpacVZ2a3Uvekx5VmZtTDJO?=
 =?utf-8?B?end2Z09wdmloYThqUkkvdDJkK0NGWUNvblJ3aVE4R0d5Y3BpUDFSek1sU0hI?=
 =?utf-8?B?eGpwdGQrS3ZtMVlqQXU0UXBqZ0hsdDFmZTdPUTNCK0hrbHovb2hZVGNXUzM0?=
 =?utf-8?B?WndzbGhUVFVFR1lzYlJvTGNwdXg5eVNkSTllTUUxTDhGMmF6a0thTFQ0ZFZv?=
 =?utf-8?B?eGJ4dHR3SHBIWTBjYmtnMkNyQ1dFZUlUZ3A1V1grY0VDV2J6Rk9wdVNNWkpa?=
 =?utf-8?B?UUZDNVJhNDQ0WnlTeTZ5TkNoN3Zsb1dkMUdyT1RmdEpUWDQ3cWhBSUlwdXJy?=
 =?utf-8?B?cGhEZGFaZnNoZ2pBdEpNU1dmQ25aM25pOWhhdFhtUDhaQnB5MnpKcVZUM3Bu?=
 =?utf-8?B?U3d0OHlad2tUWlpCbzFMa1JuUERlR2JMQkZOd0U2ZVVyZ3dnRmNNcmhCRnk1?=
 =?utf-8?B?TWhlV2hiMTY0YlBoZC9FNmpZY0JpcWlIODNQYzJRRW80UHhBS3RpZ0RSakFQ?=
 =?utf-8?B?aXNtcmRPcWx6cXpubjBzLzFtcDduUVcrbmRzRW1veW5JTXFBRFl3MWc5aUFX?=
 =?utf-8?B?WFRSLzNiWkRIRHN6YzRvcWVzejdXK0Uxbk9CNWNSRStCVG5zQk44ZURJaHds?=
 =?utf-8?B?UVF4OW9jWEN2dlkrK2R1NU44TlhaYWdyZzZ5MXkwRjE0TER2Z1VFTFdYbnVn?=
 =?utf-8?B?VHBZelBuNlAxMlgrU2FCNm9KUkEyTnNnS09IK2xsZzVGamRabU9PTm9qOW05?=
 =?utf-8?B?d3d6elNLKzQvelIvRmo4RUFiL1VpbDd5MXZYejNsQ3g5eGhDZjBsbHlOZ1dJ?=
 =?utf-8?B?ZzNsWnBLanM2bjdTK1Y0ZElrMXhyMDNTS1JaODgxcUhqL01SWW91c1oySGhP?=
 =?utf-8?B?c3ZwMUEvbFlTd1dOYThkN1E1YXYrZGozSnlCbFVvT0FxenRUcHdES2svMmZJ?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0679cab-b845-4243-4067-08de0af4135b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 07:34:15.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLBJrwFui13PBftyQ+zDx67qqASQS3E98XqewpDhMXKEhgpwO2LIZqF32q2wASkufFxjPi8RVrBPv4lKyWyxDlHThYPN3Dz4VTwzYzYGuaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
>
> Provide the basic platform definitions and PCI IDs for NVL-S.
>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
>   drivers/gpu/drm/xe/xe_platform_types.h | 1 +
>   include/drm/intel/pciids.h             | 9 +++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 8480e53990031..aa8359a4c5594 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -354,6 +354,14 @@ static const struct xe_device_desc ptl_desc = {
>   	.needs_shared_vf_gt_wq = true,
>   };
>   
> +static const struct xe_device_desc nvls_desc = {
> +	PLATFORM(NOVALAKE_S),
> +	.dma_mask_size = 46,
> +	.has_display = true,
> +	.max_gt_per_tile = 2,
> +	.require_force_probe = true,
> +};
> +
>   #undef PLATFORM
>   __diag_pop();
>   
> @@ -382,6 +390,7 @@ static const struct pci_device_id pciidlist[] = {
>   	INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>   	INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>   	INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
> +	INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(pci, pciidlist);
> diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
> index d08574c4cdb8b..f5140a244daf3 100644
> --- a/drivers/gpu/drm/xe/xe_platform_types.h
> +++ b/drivers/gpu/drm/xe/xe_platform_types.h
> @@ -24,6 +24,7 @@ enum xe_platform {
>   	XE_LUNARLAKE,
>   	XE_BATTLEMAGE,
>   	XE_PANTHERLAKE,
> +	XE_NOVALAKE_S,
>   };
>   
>   enum xe_subplatform {
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index 69d4ae92d822a..00dd007f538ff 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -884,4 +884,13 @@
>   	MACRO__(0xFD80, ## __VA_ARGS__), \
>   	MACRO__(0xFD81, ## __VA_ARGS__)
>   
> +/* NVL-S */
> +#define INTEL_NVLS_IDS(MACRO__, ...) \
> +	MACRO__(0xD740, ## __VA_ARGS__), \
> +	MACRO__(0xD741, ## __VA_ARGS__), \
> +	MACRO__(0xD742, ## __VA_ARGS__), \
> +	MACRO__(0xD743, ## __VA_ARGS__), \
> +	MACRO__(0xD744, ## __VA_ARGS__), \
> +	MACRO__(0xD745, ## __VA_ARGS__)
> +
>   #endif /* __PCIIDS_H__ */
>
