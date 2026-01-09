Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D85D16811
	for <intel-xe@archiver.kernel.org>; Fri,  9 Jan 2026 11:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DAED10E02B;
	Fri,  9 Jan 2026 11:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SL+L/g/A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0080110E02B
 for <intel-xe@lists.freedesktop.org>; Fri,  9 Jan 2026 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767956876; x=1799492876;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GBAdy2/zPw81TRdTJq6j7vFAhwq3IOnU5tSu+z7Gi4A=;
 b=SL+L/g/Al7rTnNEpIW0dG71hcPAQqsQvt7MijBGFOqFDG2U1Qz1w+JnQ
 gYv7hAvrHIUH3MMASnaaZriqdPp6Yif6DAixh+/UeLHqSmoaMHhc+MiuZ
 xF/cQSwC/k1doOzDAvgS98NWkI7bKNJ3qNLSkwYgK8QDMjJsxSkbNxKG5
 2OVRZnMymrUti3RWRL5BbtThRpjhpGHSovkBYd3x97FKs4dtQnsKsQgxK
 R5hLfQq1hX0LhdPmsL6jw4bRvRrj2gvmCDcvjfsocCRj+4EetBMtHafGb
 QyWdfvmgu7uYzZaBOU0YnMJUtABGJuHbD0oLgqBpCdwaSSftMNS8TjL8B A==;
X-CSE-ConnectionGUID: Qwm5gb5yRpapf8cv7qKeyw==
X-CSE-MsgGUID: nu9fMTSSTIeqqF/M+9MHuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69270539"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69270539"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:07:56 -0800
X-CSE-ConnectionGUID: aooENlOHST+z4bm40Ou3gg==
X-CSE-MsgGUID: VGjN9ujiRzCknrRoRTBVAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="207928956"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 03:07:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:07:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 03:07:50 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.71) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 03:07:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhClxoXn8ggST/gdD64A6/xgr0bfEV78PmBvxuSxwYKLs3GAhJMzTC6FvwDPbX+/T4T+jLw/RAHUDRxWKvVi2yCvnjMnJXKGkeYQ3c8l95MPKymYgnFuTNbfLCSG+3F3zXXeGGzTgOsgOcMkCHUHmwoNqP4/+VbsPbJuPSzZRVmrRZMWJIMpGtvC8g5oUuGKrWc1BQWrsP7LBwpQQb2o3w/97Z/leoz6NYbN7DZKO+hWWbnS9Yt8eXETp/AtgzPJqlG0zjDgmTKYmr+rstt/Ezz+Hri7X7XddvgsuLiUqAHEe5VNUpnZ2J5bYyMM/nT+qvZ47Q7PA7KitmG0Bi1BTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs/w4ECMGZYG6tRttpIoH0ZGewXuAWrPrZ8tutzEy5M=;
 b=ck2xfmamJlRF486+KIrcm04kSqYkWVykeLevtin3O9DlwNPZAVvTeagF5VYJTQQopeBk/zP1/a/tawAnhakxvLug+a96kw1kP39R8HuEobZtjworZ/70kuBcfr+ipBYA9vWJQRGOC6amwStydTXpxyPDiCTrez06ZGuFKzs1+U89GhjBtCf/aAcgITrIcKWIvExlSEbDcRLtO7DGkUnzqQ+gMmotuiPval2yoZU9My3Rjpxb1p+Scx3BqljwyLTGB1bajTDY5+Sn5+HLaGRgIgAz7+JKqkgtAuvD/9VpKa1TWJKOkO1STQ147FtVLUM9fD93Ge44n/IIH25RjsdKkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS4PPF990BCE628.namprd11.prod.outlook.com (2603:10b6:f:fc02::3d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Fri, 9 Jan
 2026 11:07:48 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9499.004; Fri, 9 Jan 2026
 11:07:48 +0000
Message-ID: <7fe6e5fc-532d-4b27-878c-de47520f2482@intel.com>
Date: Fri, 9 Jan 2026 16:37:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pm: Handle GT resume failure
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <karthik.poosa@intel.com>, <matthew.d.roper@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <ville.syrjala@linux.intel.com>,
 <uma.shankar@intel.com>
References: <20251220073657.166810-1-raag.jadav@intel.com>
 <78e5bb9e-595c-490d-96b0-bb01126d2f8a@intel.com>
 <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aWCY9Y0CKyF1OyGC@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS4PPF990BCE628:EE_
X-MS-Office365-Filtering-Correlation-Id: f60a7466-4843-4ced-4290-08de4f6f52ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkFLWEdyUkk2eS9DRGY3Rzk0NWJLUFUwZlk0bEIyUExmWDlRMkwwQVRmY2w0?=
 =?utf-8?B?TTBGMzF5blk2MnRJcGI1aHdST0tHUTE3WVczVnoreUtkemNDdExaMXJqaGZa?=
 =?utf-8?B?aktRMllvRWVQY1p3dnQrVzkwQ3ZucVk0ako5RFlpVmk4MC94WEpySWNUekk3?=
 =?utf-8?B?Q2daTWNpQWdCdys0TFgwQ2NtWndyWExMbjVFVzFrSFlWRVVjdFdOc245VVFO?=
 =?utf-8?B?d1RlbHgvblc0T0swenMvNGp1emdPSUNxU0R3MmF4K3V2YjR4Vm1scjlMNk5a?=
 =?utf-8?B?aEl4bUNzOXVnVmEvVFV5NnFtUkdOTngzSmxDbVA2U0pELzEvbXZCMjBjV2RW?=
 =?utf-8?B?Z0tWQVN6eGovRkFCc09CaHBTS01Td1cwR2lmU09oYVU3ZFdFVXZiRElRZi9m?=
 =?utf-8?B?OFB3Slp3dFVsdjNTdUM5aitxZWF5ZGlxaHNCZXhrZ2I3Y2FSQVViS0F0NVlO?=
 =?utf-8?B?MUZWVndvQ0pmZWFTZCszREVqZGlqejcydlVxVFpoN0V1Ty8rL0dSUHN6Njhh?=
 =?utf-8?B?ZlBja2lMcW43UFNaNytaZVowYld3UHA4V3ByN2xOWnFleUdKZ25zbGlLeVFm?=
 =?utf-8?B?bHEwb0Q5NjIvVmtyMVQ5cUFlVWdvaDZyeUoyWDIvTmxvNzMrZUJQdUZTYzE1?=
 =?utf-8?B?UWdSUzZ5ZXowWjVPQTlhTzJhdWk0K0Y1dmJ5dmxNcXJvd0hhSmhDT0hMc3ZH?=
 =?utf-8?B?UnBycVl5Nm5uOXBPTWVwSFdJa0hZTU9ZbWVZdjFadVFaWExKbGRHblFHZ2tv?=
 =?utf-8?B?NzZqSmFxMGttVVN3bFYzOUhLcXNFakZjdnBybXB1ZFh5NjBRTEk4Yzg5MzZv?=
 =?utf-8?B?dHlJdXJxMzdaWjFWSUJFS2ladmJJZ2lzTm94MXJNTDBmUTNiSG1hZ1dwWXU1?=
 =?utf-8?B?eXIrVWswYkFZd01JQ01xOUpudGtTdm1NOGZaR201cUd6UWh0WGdSOVFMeHhv?=
 =?utf-8?B?dHhIRnZmME5nbFVBTU43WDNveXlpSyt3NnF5MVlUUE1CU3pKT2lyRm10RjJL?=
 =?utf-8?B?cm9LZldQRHU2bFFsZXRZMGVqMFR3UUEyYWRqNkxzWVNIYkxwaDBFZ3V3d3RH?=
 =?utf-8?B?bEY0bEtmbm9LdzU3anZXTVBybDJsYVpGMit2bUZKbExMM0JSYVY3M1A5OGFt?=
 =?utf-8?B?VmZhMm1NRCtNeG0xNFhDR01RTjVuTFBOcW1Ob21SOUNRUk1DUjQybzl4MXU3?=
 =?utf-8?B?a2RnRVdEZ0NaWHpiMXcrT3FXSWJHSlYzTzJucmNkWW9wKzNFeExKSmJpblR2?=
 =?utf-8?B?c2g4UlAyYldkNDNMV0ZGcEVIT2dSdDlwWklhVytPUktzakJBT0djb3FvNEpW?=
 =?utf-8?B?a2NGMXdCK3JEeUl4OHp5Rk1JZHFpRC94VnA1VUNaa3NiSEszV2lGOW83OVE1?=
 =?utf-8?B?MmpMeHU1TlNZcG9QMFNhaDEyb3U1Y21SWFNmWStzQnpBd1huaTdwTWVxSGY1?=
 =?utf-8?B?eVFSN2YzZ0RRdjhjZkhQcHJheDR1Vjh5eS80TGdMcHQxVjd3ZlhsOGFyY2k2?=
 =?utf-8?B?b3lCS2tRQURWMnZWM1FKWnlYdEp5b1phUXN5bS83cW04SmxmRXU3NEFFNzVL?=
 =?utf-8?B?QzNIcThsdzE4K01sSWJkOWp6eURIQzA4MXJTdjFwZFJZZ1NkcDVVditzVzJ0?=
 =?utf-8?B?b1pINEh6Smludjg3eXNtbWpubnRYQlF0clN1VzBLQVlrOVZZK2VTMHhBaVdu?=
 =?utf-8?B?VjZocCtpTzdwOEd0d0h1VnFjQTFzdEszUnlzVjYzeWdjdWk2Ynp2Mk9ZM3V2?=
 =?utf-8?B?a1pJTURIZDYvc29HSngyb3h6VytFR0VrZW53dHFBQUhEbTBNTGZUM3dieFV1?=
 =?utf-8?B?TWQ3ZDAwaWtRalRkNkpTS2FtZVBra1k2cU5tdzNoYjN3RUI0UWpyKzFBRWVl?=
 =?utf-8?B?Y25jSFh3dXZvdnMrQkRPa1hVTnA1NW5BSXVTc3BwUFp1TkFmdHNvQkgvTEhj?=
 =?utf-8?Q?jThBhxJgeQA5UwqCwCXnb9So/d3C4Pr3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K24ydFRSOGRBZ1NBRzFMTXJGRklMaE4wWGNHVHhUZ29HT1Rpd2ZYSkRiaVhs?=
 =?utf-8?B?RmxkQmtmWWk0Mm5ZWXM4YTVSQmFqazIxRUd3dTBYanhvR2RhWmszMVBRT0hZ?=
 =?utf-8?B?WUs4MG5pVm9HVHovQ1JkSy9BemwrbG5MNXdSY3NRY21HRWU5UmptMVUrY2J5?=
 =?utf-8?B?OE5IZTEzMlpDR0V3ajg5YmFPUDBXdVlRb0dLYS9WUnB5QkIxaDBoS29JLzlU?=
 =?utf-8?B?RWFDQkVMbjV1NUNZeTl5TU1qRjh6cHB6OGZIWWZndFk3dm42WU5UTmx5UDlN?=
 =?utf-8?B?RjUyeXhybnhOMnVKWHg0Y243TmRzaVFHNjN1dmgzeGZ2YUV6RU9TRUpZY0Jp?=
 =?utf-8?B?ZVZVOHlwNmN1R0toTlpBY1A2eXlIeS93VXJZVmJ1N1ptajY4MXNqczJoZTQv?=
 =?utf-8?B?SlU1ZnlwbDRpNVIvalRZajNHWDNZUFk0TitsSVVXa2ZCMUpiNjVVSkVSdHJk?=
 =?utf-8?B?dnRta0U2dGZsbm42Y0loR3lmbnpxVGJ6QUovRTBHK0svUkhzcXJIeno4RmZv?=
 =?utf-8?B?Z3NlSEVMeUtBZmMyKzZuNEkyZy8weWhlZ3dEMzZuTVEvQjlMdURZYzN5Nllp?=
 =?utf-8?B?OUhSMUdLVXJJUDJ0STlGZkpuRHI4MWQ0ZWJsczZQLzNEaVpwT25uMFJrZjZi?=
 =?utf-8?B?LysrOGwwT0hLOTdsMDhweGlSaGE0YlNmMHlRQ0lERGh0QVB0YXlkUHh0RTZv?=
 =?utf-8?B?a1Jyd2cwcU9FOWxiOGp1dXJDWXdrRjJlUzUzSlcvanQzWjdYbTc1RkN3T2Z1?=
 =?utf-8?B?MEhUNHdCbEVmZGhsbUVOdlhjTTdmRkdQNDBqSlJpUWVZeFk2UmhUQ2R4djRT?=
 =?utf-8?B?YVg1akFnY0t4dmdNd21NRzh0RS92YnBBTDlYKzNGQW5SMllPZUk1MUFyTjlB?=
 =?utf-8?B?eHRpTXo2L2NGSlRyU1JXMndRM2t3MkcrNUVUQmx5SUo4ZElCSmJuN0RtSjln?=
 =?utf-8?B?Mm5XWkhQRmNnWkd2RWFvTzFGZmdsTk5VSmRISFRpb3FueHlYN09RRHlVeG9T?=
 =?utf-8?B?ZStCd2I1NDBVWVB0VUF0cHpJaHRaM1E4NlRxblNjWVdIVzFsL3RheHBybzFH?=
 =?utf-8?B?WjB6UzZvaEVkSHB2aWZvNzV2b1d3Rm15OHF5S0lhY1NxMlpuRHBzeTZOMndM?=
 =?utf-8?B?VkxzMTNoYXk0SjRXdkZjaTBBaHFuUGdFbmsvSUxrNlFmdVorejBJaTVGckQw?=
 =?utf-8?B?STRhclk3cnQrZGJqcWFENGRhSTM5Y1hmWkpRTUxHaUZ4bUU2UzRwZHNjVW5T?=
 =?utf-8?B?eVNLRHJPMUk1YUhJZldDQmgrRVFSUERJSTdibll0Nys0Wkg4WklEc2NuaUFw?=
 =?utf-8?B?NTc4UXU1LytZeHFMYVB6UWl0elEySmFVbVh0U25pZ3RoaEovZFk5SUFFaUJm?=
 =?utf-8?B?c1g4QlpxUnVaUUhIZ09nZkFvQjBXUXR5TVowS3lwMVhHbExzUUhlcER2ZWI2?=
 =?utf-8?B?RTRVNGlFYkFTRkdsbUFQWVBDNURpamh2aUZyVTFhbER3YWFnZFdYRXhYbEw3?=
 =?utf-8?B?S1JkWDE3U3VCVXRLZ0wxNXN3bVNKSVExQkNCQ0tIaDBwelRkU0pxSHpFckc3?=
 =?utf-8?B?RktKWGsxRTNiM096UnduOW1nMWIvQkQ1Y2s4VFNpNG5YdlZPWXE2RjN3MmF1?=
 =?utf-8?B?K1FtVXhJdGN4Wm5Ja2tJZ0lvazFLMUV4WmJPQzI2VFNTSENIRG8waFZKY3p3?=
 =?utf-8?B?andkS1JSVnhLYTRFNkhhMk1qVEs1QjZ0cDNUdUtIQ0tUa2dvSm1uNmlqSnlZ?=
 =?utf-8?B?b0VTa0RnWW1ZM01ZTVpqMTVESnAvZWpLRC9Ua3BaODhWZ29kWE53UGtrUWJK?=
 =?utf-8?B?OStEbmRxTlRFRE5IOUlLUUllMXhhK3FTWFhmdEpsVVN6aGlETXZDT2ZteW9P?=
 =?utf-8?B?L3JkUVVLUkl4WVlEcmpyQTd2ZTVVN2x0cGJ3clFSam5nNlJFVlRvNWlVWDRM?=
 =?utf-8?B?Wk5UNmY4V3MvRU1jVlZIVzR4ZHJ0R0RXa0dEOUYvWndBVDBCQ1lEejB3bzQ4?=
 =?utf-8?B?TmJGVnppSkV3TjBwQVQ4dVFMRCs4YmJIYkVSM2d0Rk1xaktEbW5oWXpTTFdJ?=
 =?utf-8?B?Y1YxallUMjRHdCs0N3RTa0JqSWppZmNsemd3R05aR3pkQzNyWG8wbTJnMSt4?=
 =?utf-8?B?R2NyUGpjZ2xlYVNha3Rqc2sxdHJkM1FhY3ZxTFZDUkZRbE5vTS9ZbGF1L1hL?=
 =?utf-8?B?MCtKd1orNCs2MGtFT29XODg2TlBOSmxVWjdGZ0JQNldsb0VnK1dRc21tTHdr?=
 =?utf-8?B?dzVCTFZOa1Y0NWhTeDh5U2d1MFhtRDBSOHFHNWpoaTkydWxOWUtic0xBeEl5?=
 =?utf-8?B?dFVFN3JNbHQreWVzdWpKd2xlOFhjMGdJN0ZveE5FdkNBRVR0YU1qUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f60a7466-4843-4ced-4290-08de4f6f52ac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 11:07:48.3925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFoNwDLcanxiOtG6VdmiyQJTYfP4y+Mzsu4eJ95+X5XEhtrXse3qybGdg4GZT9DQ77i8Z3uc6hjj+Hz+ECOEew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF990BCE628
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


On 09-01-2026 11:28, Raag Jadav wrote:
> On Fri, Jan 09, 2026 at 08:14:05AM +0530, Nilawar, Badal wrote:
>> On 20-12-2025 13:06, Raag Jadav wrote:
>>> We've been historically ignoring GT resume failure. Since the function
>>> can return error, handle it properly.
>>>
>>> v2: Bring up display before bailing (Matt Roper, Rodrigo)
>>>
>>> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pm.c | 26 ++++++++++++++++++++++----
>>>    1 file changed, 22 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 4390ba69610d..559cf5490ac0 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -260,10 +260,19 @@ int xe_pm_resume(struct xe_device *xe)
>>>    	xe_irq_resume(xe);
>>> -	for_each_gt(gt, xe, id)
>>> -		xe_gt_resume(gt);
>>> +	for_each_gt(gt, xe, id) {
>>> +		err = xe_gt_resume(gt);
>>> +		if (err)
>>> +			break;
>> GT and SAMedia are different entities (even if both are treated as GTs in
>> software), should we not continue attempting to resume the remaining GT even
>> if resuming first one fails.
> My limited understanding is that GUI needs render engine, which the user
> won't be getting back either way.

Ok, but how about multi-tile platform like PVC which doesn't have Render 
engine and Media?

>
> Raag
>
>>> +	}
>>> +	/*
>>> +	 * Try to bring up display before bailing from GT resume failure,
>>> +	 * so we don't leave the user clueless with a blank screen.
>>> +	 */
>>>    	xe_display_pm_resume(xe);
>>> +	if (err)
>>> +		goto err;
>>>    	err = xe_bo_restore_late(xe);
>>>    	if (err)
>>> @@ -656,10 +665,19 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>    	xe_irq_resume(xe);
>>> -	for_each_gt(gt, xe, id)
>>> -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>>> +	for_each_gt(gt, xe, id) {
>>> +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
>>> +		if (err)
>>> +			break;
>>> +	}
>>> +	/*
>>> +	 * Try to bring up display before bailing from GT resume failure,
>>> +	 * so we don't leave the user clueless with a blank screen.
>>> +	 */
>>>    	xe_display_pm_runtime_resume(xe);
>>> +	if (err)
>>> +		goto out;
>>>    	if (xe->d3cold.allowed) {
>>>    		err = xe_bo_restore_late(xe);
