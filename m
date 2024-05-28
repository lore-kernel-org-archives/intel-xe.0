Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646BEC25B7E
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 06:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB10B10E3C9;
	Tue, 28 May 2024 06:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YN+JpdFJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FB610E3C9
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 06:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716878350; x=1748414350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tIcgGaGBwRKgTyI5GHWhTM8hJCOHNcam8kKOVQjAu3A=;
 b=YN+JpdFJU2jCc1VG2QBtX6lpl97l7+ALUi/KWn+BKSlAMDTuVvsCDiYC
 dmn6AG807P/Tj8fvNi8hnVQJSUcvbem0vhVUHOdBmvI0J7ZPLO2pZYgO/
 FoXVKBr3q79MtJt7zMXd1+ZkVw+gXuQxl8prwGg8btAsgCZPUOf6W7IhN
 Zkv8w33WeawH3ylKfuHKVqMCu8el4ndwXYM1YhXi9K0HzN0N0QcSDz9k1
 EwZ7SnjUAQKUUf3nYM5y2Wc5NAD0wHBqD6rc880EskEixLG1tJQ3/Gm/z
 FtEqKPUFImKwuHJeV9hO6l+Wzkl0oI8N6HgSz/rhDnhrVUUV+S4O91iNE Q==;
X-CSE-ConnectionGUID: 0qwAYfYyTh63z9tR1Gh+WA==
X-CSE-MsgGUID: 0+UlYM6BTDS/wDq9xGDf0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24329805"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24329805"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 23:39:09 -0700
X-CSE-ConnectionGUID: MZc/n+sUSkSIQkxL7TRr3w==
X-CSE-MsgGUID: rJdpC9eqQvWWDgZW3IQyjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="35560411"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 23:39:09 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 23:39:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 23:39:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 23:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0l303OI2KI2Xij4iz0ocEIEwkcHh212vGFgYX4GoLw8NtJJiLGEiac3XyaFAdezuPevsAcgDWKcp13Gmmr4G+xtI03DtCuNOmm2oP9D0yf3GB68MrkU35uJ85RnN0fCGiSzGVFJ2EE/3mj/r71vha6So3aA7Zb3+PnHEnrAY/GgLCVvmmdWG4t62WZNw6cDraDENtMc7iLyo5sG1q6e4QIjsYZRBxhp2gk/juHe0POqdJajWeD9eOqFq63SWXXa7BRCteSeJDmi88aEmaMZQMMSGHtqd+L9hSakKpP3pR1MBTI+aRlE0ZE1grfefgJdvs+RsXf7ZKWH4jMJXtOb2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHXGS6uIJq0+StoddGkRu6zOB89Tg0QA6sOro3ETUlc=;
 b=OHP+75Ptyp4YM1Q3qqCqq8nWpPPmhXvmHMCyuhb2QiqN84evUJrM3yb1AVC9WYMOxqWLB0P34hH2et+XXyvJ92AcQ4vQAP1TkUfyKtt+/mElUrk58kc5M/qWS3Cu/v8sZR+HP8sNkFCctZnObzo8hCGpiChNUPs/K5U6/bXFAg1NOXGnU2NuAfkUdj8tPGZgBriYz84Zvwug6ojFsB6Ovz+LejZfyGjEzTpnnHSanDX1buwRXDigTs8wBEgt7GAgIKAsGxIr+WwqQ78Z4YMwA+VT+jIS1b2A3pz50SpP3AHo3hn6g4IMm9zFadee3Hm20qxX9y4dQrjk3LEIjZbOfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by BY1PR11MB7983.namprd11.prod.outlook.com (2603:10b6:a03:52b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 06:39:05 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 06:39:05 +0000
Message-ID: <4e2d7cb9-22e3-48cb-9aec-aaa07ad2f8df@intel.com>
Date: Tue, 28 May 2024 09:39:50 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa: OA stream initialization (OAG)
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-8-ashutosh.dixit@intel.com>
 <0cd6f261-2345-4cc5-b95c-b2c28dc79fa5@intel.com>
 <8734q2pkus.wl-ashutosh.dixit@intel.com>
 <e33226a0-f0ef-4dee-9ac1-3778c3a61829@intel.com>
 <855xuyjw8k.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <855xuyjw8k.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0012.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|BY1PR11MB7983:EE_
X-MS-Office365-Filtering-Correlation-Id: f337bd4d-85b6-4ce6-31dc-08dc7ee0ded8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2puNkpldW5uUXUzLzc1QVA4c1Bmc1YwK0RPNGZkOU9ZdXMvWC9QNGx5Y2Ev?=
 =?utf-8?B?QjdBZ0JwVE1TUThnZ016cEE4TXJVOEw0NG1OSzlsNVpXVFdsaDY1aVFmUHlO?=
 =?utf-8?B?aDRJbHFvWmZ0RDhQRUlYMk5PZUlreGI1QjJPZUZ1RzJIaGRSdHZCK0VSL2d5?=
 =?utf-8?B?b2tVNmpEZXBCcE1TVCtTZW12TFdDeitoZm1oNjBKUHArTEJOTVMrZkFQQXlM?=
 =?utf-8?B?aEhvY08yMTZ6L0ZvZDkwTExETDZ0d1RFZzNWM2lEM3J6SVZURVZTR0hNMk95?=
 =?utf-8?B?NHZuZ05rYmNWVjkyZ2FwS0xsdTVOZ3ZpNVB5Zm9MWUJocU85TVFRR3VOWVkz?=
 =?utf-8?B?OVhaR2VXQkpVUEVvSWNkcXI4MEpodEpITnQvbVVHaGVqK0NpYlg4UDF0eVAz?=
 =?utf-8?B?U3FFQVpHWmV2a3ZrcDhpdUdPWFhiK0U0eFdjZllDOVQvaFg5RFZsYmlSb25k?=
 =?utf-8?B?MHVkS21HVWUzZHlDU0VoTmxCVmhDenFub0piUUgxR0NtTlhtNFJzTHlXeHJq?=
 =?utf-8?B?d0J5QldPU1UrUEp0dnprS0tEdU82MmI2U1kzdU91M00wMDYwZ0xYWThleWN6?=
 =?utf-8?B?WmZsRlpQd254NjNDdzMvZ2N1eWdqOG5rMWNrMVhTOFZsbFo3M3ZTdG5oMUll?=
 =?utf-8?B?eERkTUlvRGk2TmZVNTdOcTZ4M3ZTVU0vL2VwdHhDOUU5TnBEQjhON2xDZHIz?=
 =?utf-8?B?TDRiMEZLd1E4enAzZ2JtUU9rRDJKRWg4b2RFejYwS1BkWm9QVFlubCtSMzFm?=
 =?utf-8?B?dVdGYXpzSHdTY2xiVGpLNGNBTTNWaXB0VXhVcXgrM3VoNGR5VFMwTEJ6bjZF?=
 =?utf-8?B?UFIyUGJpRC9kK0R6Wk9XNzM3WXF1UkM0YXI5NkZoYXRWTi9ibUZrbEh1cDZC?=
 =?utf-8?B?NXlIcFRiSU5LVEswWGFtWHU5MUtab0taZFpjZy9oSzhOL1hWWGhGTnlBTnF3?=
 =?utf-8?B?VVJIUjhNbjcreHJnUXJaYTBpMU1kNnJqNXRETit2REI2REV3MUo1dlptT0hF?=
 =?utf-8?B?Z2c3OHhiR0RxWFNGN1JHenR1VnViYnB1OUY4WUFUemhGME9KYmFjYjhqT3JU?=
 =?utf-8?B?MUlsRGJqUHpUNGxmbWxiM2syUWp5WEptejJLS283MDRJNDU5ODRZcTk5NlZK?=
 =?utf-8?B?Y0RWeWNVbm8yWGZEcXNMU3d0dHkwZE1sa3FJdzZzY1N1QnRyakJkVk5CNHFB?=
 =?utf-8?B?RURMclhlZUtmb1I5cGlDS2JzYnV2NXhndmhXR0hXVXk5Vm4rK28rRHlTNkZ0?=
 =?utf-8?B?VTRrUlJ4M3l1dzhBS0Z5Y3JFR1FmVWVqa0I2K0RWakUxYk91QVdPN3F5R0pL?=
 =?utf-8?B?T2lqZEJNMXIxUThsbTJnanJJMmRtL1lHYmY3ZFR5aUtFS1Q5RUY2S1VMVy9U?=
 =?utf-8?B?cGEydkNZNmNhUlVCRllnWEQ2TzIvUzdsbUhlYkxOOXNiQUtLYnlPUzZKT0Vm?=
 =?utf-8?B?RVZ6OTd1QjRWMWxxZDZCNldkWnNKK2FieEowTVZ4TFZBQkRDSHk0Yk5aYllu?=
 =?utf-8?B?Zk1BSXlkb1k1R1ZVNXdnT0tMZXRJejBxZ0dIY09ROEN2d3phSmFIQ2lTVXQ3?=
 =?utf-8?B?aHpSWEdMeTEwcWdFRUI0REIrdHB0eGJtbU1wNGQrNU9hSkJaZFdhb1dVMFda?=
 =?utf-8?B?TnBkUnlZNmRMdVhSYm5yaGNBTVpTcUJPNGxNaXp3a1lBOENkUU1Wb24xdC9T?=
 =?utf-8?B?OVNzc01jT2dXZGhLVWRzK2I5REN5aDI2MHpSODlIVmVoTEsxNjVXanVRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUgxSFNpamV1YnFGVDhybmtUM25SWHNGYkxMbTU1RW55SU42WFhaMWYzR1c3?=
 =?utf-8?B?RU00SVhYWWVQcFVMNzQvbC9OMHhXSXZYK3lmdDhHVGdzRlozVksrdWRnM3Nm?=
 =?utf-8?B?eHBrR1VyMWFhYXRCSHJUV3lOdHZrbjEwNkFiMlVBOURkdGRXdHNoQ2FKa3pw?=
 =?utf-8?B?T21KSnRNV0RGdVcwaWpWdjVDcjRMS0tpWDYrTENBUVZOQ3U0ekV6cTVUTjhx?=
 =?utf-8?B?cVBBcENDL3NoQ05RRW9wbFJSb3BnTkZ0SFo4NlVBMHpPYmZkQWZqRmJ2N3Ra?=
 =?utf-8?B?VWF2Qmx6cHBjUmVkKzR3NXdjaklSMW0wcDQ0aGh4YVJFekZqQ3p4NXBxcjVi?=
 =?utf-8?B?Z1pnZ2REMm9IbHlONGhBV3NIVnFpWDBJdFphSzcvTHhnT1BtSi9DMWhIRVox?=
 =?utf-8?B?SkduMkgrYUhCV0VXTlZ5TmhOLzV3Z3k4eHc4NEVzVE8zcUFaTnZ4Yk5lOVNV?=
 =?utf-8?B?dDZnV1VDRm9Tb09CaFhPU2xWMkRXeXFoWFR6ZGJnUnJQQWpLSWV6Q0xqeUNk?=
 =?utf-8?B?RkxFVXpBU0ViNDIwVXAveHYvaEU4ZlA5ZmoxSW5oSVZZaG1lRW5aeDlqTldm?=
 =?utf-8?B?UFU0OGtSRXhhZ0dhU1d1b0Yyd0dUeEVlT215NnZjTDJRQTRrRjVobGRDWWZN?=
 =?utf-8?B?c0ZuL2ZJbkFSWWZnM0Z0MkdreU9kYjY1TU0vSUNHRjRoRGZhSEo3cng2UkFr?=
 =?utf-8?B?cm5jM3QybnVsZ3dpbjNNbXlzVUdpU1pwMWRDNFpFL3pOdGFFdy9JN1MxMERU?=
 =?utf-8?B?MzhERHZ3ZmJFSWVycDVFZng1cnhZMnNmQkpSby8vVEhrVFpObnJSSEEvTTRT?=
 =?utf-8?B?a0k3eENkb1pLcExhOTBZakx3M1dqMlVEcytHTEQ1Q0J1WHlETEFtQzdEb1Q5?=
 =?utf-8?B?S3l4aHUySFhuc2Z4aWZiN2ZBWWtKenRTd2xGSTNtT25mWkRZUnplcVU0Mmlu?=
 =?utf-8?B?K1ZiemhNVDFndVE2ay9BYTF3S2JKSkg1bXFrT2RNSUlEUGNENjdsQ3dnVWk5?=
 =?utf-8?B?R3hiNksyLzRUSlZFQUtGMWtnMmREYWlvVmdFd3N1Qm9maHJIMVVZNGpmNmQy?=
 =?utf-8?B?YUpOeFo0NW8yemo2ZXVQUEtEMUZGR3dmUGcxek9UaWlKNGI3N0dvS1EzS3Ir?=
 =?utf-8?B?MnJqUk1pMjZzZnd0bVF1UlIvRFhFeXpFK0hxeXBma2p0eHFHbzdTaERrUHpQ?=
 =?utf-8?B?cXRkMFMwb1Jkc3RoVVlLT2ZnQWh3Q3VLUEdJTHh2YTNXMWlPUkx6bUZHOTBK?=
 =?utf-8?B?NThtM0ozNlZLdHJHQzNBa1hMNjVTclRJUHR6OTZQaGdsQVhQa29sN1B1a1VU?=
 =?utf-8?B?d3hUV1Z0eWNGZU9jcXJaUUQvTGRsNG5MVHRxdklpVjFVazBPZTZyZ1owMzlU?=
 =?utf-8?B?bFRLMk5aaHkzaG1IUWxkbmhIQzRmTFY4U2NYT2ZPVWtBYXpuei94cUNaY011?=
 =?utf-8?B?dHc1ZWY2ZVNrYmNJU0E0QnlmU2h0OEhYYmI4SnczN2s2THdjRFNrTXV4VFh3?=
 =?utf-8?B?c1hqRHhmODFtaDIxbzN1VGprV2hJeTVDM1plUUxvcFdPSmxoNzR4aWp0eWVR?=
 =?utf-8?B?b1dKY3B5bkJOT3FEdGZlTGtvZjk1eWZ1dVo5clhoclhlSDdsZW9lMDQwRzUw?=
 =?utf-8?B?NmMvd3p2eWpHZDc4MVZ1UHcyK0h2Q1dwc1luUGFyYUwvV3JjR1lRUVMyMWI1?=
 =?utf-8?B?TFBYUzlFMkZkUHVhd2NLbGJGeXFOWHpYcDhlL1c3M3pnb3pSRXlDeVdwUmlh?=
 =?utf-8?B?SjFuUFdwNzZPVDE1a09VL2xkSzg4Ym9iUVM1SkJGendUQ3NBTlFxb3VQb2Zk?=
 =?utf-8?B?NXptUlJGRE45dlFZZmFkRFRxM0VwZ1kwR2owNUhOYVM3ZDJCNlAyMUFoek5a?=
 =?utf-8?B?Y2Q2Y0JMREdLaGhGT2dNMjZUQ2w3bU5Pdmo4V0wwR3VtTEJkcHVlZ0Rmb2s0?=
 =?utf-8?B?cS92WE5NMkt3biswRnhpSXJMbzZXSWNDK0lKbjZwTVpRcDdxa2o4WmMzTnRq?=
 =?utf-8?B?dXpwT2szRGlFZW9zdnd1dUpJSnFSN3p0N0xidWorTlk2eGZvVmVzVHR4UXFK?=
 =?utf-8?B?V01VNTd2MDhYaVRvUkNPTlBFc2E4Z1hxblNaNlc2WDFtVHUrWVZSa01YQUJv?=
 =?utf-8?B?WnRORnR5d3FSaDJQSW84NUpMRGJ0WjRzOEJWS09wakRHK1R5MmMrL09FLzRM?=
 =?utf-8?Q?Il2Tc4CKV2j89MFofDTFLVQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f337bd4d-85b6-4ce6-31dc-08dc7ee0ded8
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 06:39:05.8234 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0lPXrlcfYOqPyG8WL8+Oqnme4CE3ToBsGiAZdq1rQ2EOpvzKtpaW+l51v3tnn2TFyX35dDvbOpz4hT9Hi73PYF2U2x6IToV00Jgtepxqbk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7983
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

On 28/05/2024 09:17, Dixit, Ashutosh wrote:
> On Mon, 27 May 2024 22:47:13 -0700, Lionel Landwerlin wrote:
> Hi Lionel,
>
>> On 28/05/2024 08:27, Dixit, Ashutosh wrote:
>>> On Mon, 27 May 2024 00:04:21 -0700, Lionel Landwerlin wrote:
>>>
>>>>> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>>>> +			     struct xe_oa_open_param *param)
>>>>> +{
>>> /snip/
>>>
>>>>> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
>>>>> +						BIT(stream->hwe->logical_instance), 1,
>>>>> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>>> Hi Ashutosh,
>>>>
>>>> On i915 the changes of configuration were pipelined in the application's
>>>> execution just like any other submission.
>>>>
>>>> Creating another queue completely unsynchronized from the application's
>>>> submissions makes this non usable in my opinion.
>>> As we discussed previously, the plan here is to provide a drm_xe_sync array,
>>> through stream properties, which can use to synchronize OA programming with
>>> workload submisson.
>>>
>>> Would that not work? If not, we can do what was done in i915. But note that
>>> i915 still has unresolved hangs, which I believe are due to the spinner
>>> running on the application engine (iirc repeatedly opening/closing an OA
>>> stream will hang in i915, though it could be due to other i915
>>> complexity). That is why thought using drm_xe_sync array is both safer and
>>> more standard way of doing what we want to achieve.
>>>
>>> Basically the output sync object will be signalled after registers are
>>> programmed and also any additional OA programming delay (which is
>>> implemented in i915 using the spinner).
>>>
>>> This would be done both for OA stream open and changing OA stream
>>> configuration.
> That is true. But now that I have other stuff like gpuvis wrapped up, I
> plan to start looking these couple of missing uapi pieces (hold preemption
> and synchronization, likely in that order).
>
> Because synchronization is not implemented I add the delay below:
>
>          static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
>          {
>          #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>                  struct xe_oa_config_bo *oa_bo;
>                  int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>
>                  oa_bo = xe_oa_alloc_config_buffer(stream);
>                  if (IS_ERR(oa_bo)) {
>                          err = PTR_ERR(oa_bo);
>                          goto exit;
>                  }
>
>                  err = xe_oa_submit_bb(stream, oa_bo->bb);
>
>                  /* Additional empirical delay needed for NOA programming after registers are written */
>                  usleep_range(us, 2 * us);
>          exit:
>                  return err;
>          }
>
> I need understand this is temporaty band-aid, since it stalls the
> submission pipeline and needs to be replaced by proper synchronization.
>
>> Just letting you know, because we cannot use the current ioctl because it
>> doesn't behave as we expect
> You wouldn't be able to merge the Mesa PR as per the current uapi now and
> then add additional Mesa patches, when we implement these couple of missing
> uapi features in KMD?


We could merge only the stuff that parse the reports, that's enough to 
have perfetto work.

But all of the VK_KHR_performance_query won't work as far as I can tell.


-Lionel


>
> Thanks.
> --
> Ashutosh


