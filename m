Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11167D1D478
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jan 2026 19:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C969110E378;
	Thu,  8 Jan 2026 19:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EmEQ+2Kr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B7210E378
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jan 2026 19:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767898846; x=1799434846;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XCk3zXI4AcWgMpM576T18bh6fnDVZvHvrFypL4W4Lb4=;
 b=EmEQ+2Kr2N5MFMjOw/GXmS6TzfBDE+N4AadLPgAfmgQM3tEbk8tWlS78
 29gPOJAMpdHEpZ3dv0BfPBCDT3kS0t4T6W2CSYXbyJerdXO9rDGrR4JIS
 cqLZHTVbQoXzikY2s/f3vHmtGQoZv1FSjXI3q8P8nA39HopU9UrAhWtbU
 bAh2UginPVE06FQdAaPu1v8mAMmDAgXGEX9lpbsCfE12rUgjUBo5NMU1R
 zdwsx61UF2Pgw7ldT9V8mROMsYC+jMPcDNool0cXreICZGKubAvvmm76j
 LiE10dnCxFpoM4RIPoey7LKGdooSxdOTKgG4N5iW6uN4lqYMnO2jUV4Hu Q==;
X-CSE-ConnectionGUID: f2jYUGDhTueqy3/jVtC+DQ==
X-CSE-MsgGUID: tuaZvIewQcitjwvI0e5kZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69358264"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="69358264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:00:45 -0800
X-CSE-ConnectionGUID: gav48ggbQu+mocv21OplsA==
X-CSE-MsgGUID: eEePVcHqS5SAaxMKuZ1ONA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 11:00:44 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:00:44 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 8 Jan 2026 11:00:44 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 8 Jan 2026 11:00:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kawImDOJJbyYW5v+e0q3oLTGRSpvHsP5W6qE/J6R1/l6CbLc0k+FS4ZZFKR16gvVD8hKkT345YC7TTySrF96yiQfcS+do95pICd5MGKl+A/0N7l9L231UXQ6tyQ/nudKdZDTJR4c7yQ0rfcX9YTcD/RN5thT/Mo/TaWf3XHQT7pzugfMQzHuDQRiH4Vp8Jm40SZWiw4PX5FwgM4RM61FRCKDD7EOOabjrHYPmAZOgqyQ+1Fvr2qINILcIM+2I4DK6JlwwQ0w/MAZlR/YMdDKFX2VNeozRZxYH8bqGpbBeiUn8xxHFkHm+DowoMRBzoRFvm8VwbZNZKu05uvAMiHItg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyiaAqQ96rAQTpachS/Ank6vY5PCoLO1txIyCT59RKk=;
 b=Gvn6mK6SD5FKCK18F9OjMO7hCe33h9vtPLS+k+hB+WkkLll/KnUKpnfq6h3CfTe8C5YOIhWMLnDKIQMGL06atn0xEMbsAggykbrgfiPyrAdJngI0gkEGUA55Xxw2m67iQQIgiJAzIO4r8YhuSRV7dtZBZXbKHE5B7RoRTg1eZBUPpCUEOa55p0lOwsU1BBMIpCFcraeh9tAK5SMa4IH0OhUviFI2Ko1+2RYW1O/Ew/dHBAUaVsqEZJKtxtqYYj7VFyVvWePmdxiXZhMUXT/QcqzdOs6cBVsCjhAC4WIfO3H7bXVIPFn3/2/hRFvIZGtO9mByJCUxA6QhszTkrC1JsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ0PR11MB4944.namprd11.prod.outlook.com (2603:10b6:a03:2ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 19:00:41 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 19:00:41 +0000
Message-ID: <e83e6e11-2c7b-48d8-a9ce-988ae5a7dcba@intel.com>
Date: Thu, 8 Jan 2026 11:00:39 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Bump_GUC_version_for_NVL-S=2C_CRI?=
To: <intel-xe@lists.freedesktop.org>
References: <20260106212758.1172984-6-julia.filipchuk@intel.com>
 <176774886068.130906.4232613977721226253@a3b018990fe9>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <176774886068.130906.4232613977721226253@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:303:6a::24) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ0PR11MB4944:EE_
X-MS-Office365-Filtering-Correlation-Id: e3e2076a-0201-49d9-fd90-08de4ee83823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3pJL2YvU3VWNjYxclBJZThrdGxmM2VCaFdtbk5wTGprZGtTc0V3VUcrUGdZ?=
 =?utf-8?B?TFZIYWNZQzh2N1phN3ZSMjNIeGlHV2pPNExhdkdCSkM2akgvdTh3bEdBcmgx?=
 =?utf-8?B?U0hGWTgvUWp4MFJUQ1dCMWJWWkFCNmEyWnNkTEZUMG5RQmM0WDJUYnBlcndE?=
 =?utf-8?B?azFhRWxHYnFIbGlRNTR6Znk3NnZkZFFCeUVRTFUxdnFqTjFZOFNIZnVjSzFW?=
 =?utf-8?B?amdVdHBDWGVaejNYenlDbHp0Q3BLVlZycDViRzUvalRHMFFKWjJ3WXA2aG5o?=
 =?utf-8?B?M051UTZPbWxJS3d5RC9rSERDOTVxZ3VHZ0FwcEhUTU15KzBiclgzNmlmUTYv?=
 =?utf-8?B?eUtuTC8vamI1bXJVb0UxaUJQRVJFRDVxdDVJQ2ljNzBMOWdLUXdacFBpdm5k?=
 =?utf-8?B?ejJWaW9yWmpyZmdYazAwcDI2UHJwYk1WZU1UOW8zVXFNUlJINGdtd3FxckVK?=
 =?utf-8?B?ZkZpOUdwUG56UTNlNXVPd1ZMeHRZNEZ6R0NkUmE3dFg5WER4WkpreXFmTElu?=
 =?utf-8?B?ZU1INDZ0aWIrYzJLQ0pvWS95TitZRnZzdGtPaDMrcXVhSnpVVEFxSmpMY0Fx?=
 =?utf-8?B?ZFlRTWxjUWdlZzQrcjdNT2F2UDhOT1dWNmgzdXJpVEF1UFF4VjBScWk1SXVj?=
 =?utf-8?B?VkVCcUNEc2VRekxYeXh0dUw2QTBma2ttSVVvTmdTcE1jWCtYcEVqZjAwWSs5?=
 =?utf-8?B?VTdnOVQ5eWxXRkQ1WlorOUJIVGQwTXUyRTlVd2Q3Z28wL1IvWFQ3NHBYSGFF?=
 =?utf-8?B?NkhQcEd0d3d5cjRubW9EOUZjMzZINGtLNXp1c1VNS1NWVjhnSkxXVFlNZk5Z?=
 =?utf-8?B?RXVpaDV1MlVoV0hOeVZkL2RtUFh2MUZyc0F3S3ZqRjFtOEVDR3YvcTRIekds?=
 =?utf-8?B?eWRjNmZmYnRIRFFiZFU3aVNRbWQvQTE0ckJpeDFiWFdZaWdPY3R5WFdtZnRw?=
 =?utf-8?B?SEN1bWJWSjJ3VE1DZDRUVDRma2tSN3NneXNJQVdlRW5sYk9PNXkvRTg4cXNq?=
 =?utf-8?B?ZUJlaTBtMkVGdGFqdld1djh0WHdPUmZybVRPSDZxYUIwRHpla21RTzZoMDVO?=
 =?utf-8?B?WjlZS1pldGlpdG11MmU4RndzVEorbWMwMTVLejViMklYVnpMZW1nQ0RkeHJX?=
 =?utf-8?B?WW9hSGN0WHY3RUIrR1ZUOElmanhaTGhuME5Oc2xrUHdhcW9qS2FteXJpSGRR?=
 =?utf-8?B?bURoVGxUMDJtbVpQeFRPRTJRWG0rREtWZDkxQVM4NkVUUVM0bXZWeDJpM3Z1?=
 =?utf-8?B?QmZoZEZtNHZSTTNjc25ISmxnYkJqNlpEam96U3NYaStIeHlWZFk5TEpNbXoz?=
 =?utf-8?B?ZXNLbGZYZDN5VmNqSGlxWXFQdWxDYm80SFYyemZnNDJIbWloYjErTmhCbm95?=
 =?utf-8?B?VmtLTHFxRENvcjRqNWFSck1QMDRBdU5ZSkhQY1huaE1hMkU4N0N0d0JxTVRV?=
 =?utf-8?B?bzBKcWg5QzJTVHNPOGRjME9Ldk5ZNzdRajNsTmh6SXpKa3ZTREJSbzlrb2Yr?=
 =?utf-8?B?UGE0R29MeFB2Tk4xdXVHU1ZFS2RHQXZ6aTV4aUJiV1cxOGF0U2J4ZzRIRzZO?=
 =?utf-8?B?bU9ab3ora2sxblM3UVY3aW9PYmJBbjZNWUdVUHU1cHBQZ2VacmxMS3dYN0xV?=
 =?utf-8?B?emcyallPQURneDBydHBNRnpxbGR6UzlYOFZLeVQ3ZjNMNGFhbU5sSSs5MHVZ?=
 =?utf-8?B?Q1haSWE3clF2MzgvMytYRFpVMzd0dDVhL2Uzd0g0ZytnWURCTUM3dnF5Y1Ns?=
 =?utf-8?B?ZjlYUEtTMGZhbHdiWllXNldUSC9EZ0tveTI4b2JEdjZvMlhuY3djQnZwWlRP?=
 =?utf-8?B?cDBKclZFS053MFlXU3NldEg1RHROWFRkUk50WWozUWxMRS9jbDVZc2VEQTl2?=
 =?utf-8?B?cUhYeUVTWWZsWFlkTHVyeWlJQTBFVnJ2ZnVBNkE1WTZmVVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0krSjV0ajljNHNvbEZYRWJPWWd4dFFHRUJwZ0I1UWJNNUtjRXRrWlJHcHBB?=
 =?utf-8?B?b0Q1WDNkc2xnc3dLVnM5TkNkZmFINEhMZEY1dlk0Ym1INHhXb3k5UmMrWCtZ?=
 =?utf-8?B?bll5b1FjRlRESkZRS0tld2ROdnN5QjNyUURFNHRQcldTRzdLVlZ4WURIdmZY?=
 =?utf-8?B?a0tHd3BaaEg5NU1OaVcvZys3N0R2ZnVoT3BKMnVScWJkTVJxaUhxYnJyQnFh?=
 =?utf-8?B?L3NXWGJxME9Gdzl5Zm95cS9NUEJTYml3TTlUSEQwbHd3TGtDTjR2amNaOWZu?=
 =?utf-8?B?OFVxdndiclpRMUc4YnpIQ0hmMFJqclJpM21XelA5dnpQNW1mRHFKWklHK1Uv?=
 =?utf-8?B?TkRYZk1teTU3bWc3R1diWmxXRXFZcElyRU9qQWF4UHBhVzcxU0l1akpzWXNL?=
 =?utf-8?B?anpWWUVwcnFubFd5b0VjdlA3R3FPSUNWcVA4eVFWa2JzSXErM0tXN0hLYW9F?=
 =?utf-8?B?QnQrS21nZU1LbVFRanMwZ3VTNDlMN1Z5NGRQMGIzRlg4K3oxVERiY1ZkNlZs?=
 =?utf-8?B?UndjMERCdittTkFtMjJiVXU1VWtOVXJhelZGZTIvbU5nSXlaeTNHNzVrR3pw?=
 =?utf-8?B?Z0ZxMjFyR0hheC85TkowdHJRM1JDQlBoc3hsenNvQ01mRDJQUWZkMUtROHBU?=
 =?utf-8?B?UVNtK2xwdjF1Vkh1UitSYTVvUyszME1BUkR5YWE0M3cyRkR1ZmtHUUc0dTlD?=
 =?utf-8?B?UTFIaGlYOGp1cXlNSS9ETWxZNE5PcWdhUVJkTVBCT0hHTG5jMExYTFRKbllo?=
 =?utf-8?B?cFg1YlZjb0hIRkFacmVNNjROcDBYNjZ4OFROQjVONUVrUnlHczVYMzhzb2pq?=
 =?utf-8?B?UXYrUzN6RExDN3pFK1UyU1I0QXcwMVZQSTRVa1dwV1ppTDdlV1hXY003OUN5?=
 =?utf-8?B?anM5NEtMU1FCaDFSOFVtZTV2dVZzeTlHRll1ci9xcVEwYUdyV1RFZ01VbHp6?=
 =?utf-8?B?VFVIczJRUEZNbXgrTVdJVGZObnJGR2Qxd2RpQUFidUlsV0JLYXVqNlYyd0pl?=
 =?utf-8?B?a25qY0FnWU9aZHB6YlJRS2YzQzVmWEJ2UzFhcUtGQ0hJSUJUVHF4WXp3d2tF?=
 =?utf-8?B?ZVgrdnJ6OHlWMWIwQVVFdEcrOXJFUWpVTUlxSWFTNzJWcTJqcDUzNElHY0VW?=
 =?utf-8?B?WnJrVWxpMFFTek9ad2pvRUVld3Nsa0JkUkhNMFIwNlorNS8yQm9YWXdNL2hD?=
 =?utf-8?B?bTA5eEg2eXljSzdIK2xMUDR5L0JOcU1rSXpHc2lNOWcvSzNMaEhuMHNhVjJh?=
 =?utf-8?B?NzFid2lvRHNzTkFRTkt5cW5CbGZVekxaVjlDeWZhbnBrUlhYdW56bjRJOC8r?=
 =?utf-8?B?OXlwaDNVQlpiSlNaWlp2L3F0UG50ZGFUSkNXaE0xdVRxMngvdnAvaTlwck84?=
 =?utf-8?B?Rk5ma3ZkSU1xZzJtbHplSTQ3TzQwSFFiSzdvR213aDVMbkFhZk9Nam5neUZV?=
 =?utf-8?B?UzhpZ2pFODVwUHQvdXlkUitocnhrWHdjM3UxNHRwaTN4RTJtcUZkK1BieXBO?=
 =?utf-8?B?aTVzNnFwdGNOc25JaXorck9wUXVsbTcyOTZvLys5TXI2djhJendPcTA1ZHRR?=
 =?utf-8?B?ekttaVJsZkEyc3BhVkZtRldZOWxGWm81TmwyZkMzSVFXd0hLZlJ5ZThONmZx?=
 =?utf-8?B?MmxKdnU0NUNLNEZmRVdLeVh3VzFCQWNhWGZvMVVQOTRoTzdxcE5Pc3V3bEJ5?=
 =?utf-8?B?Qy9Qemt3QXZROE1sZ1BQY3ZYQWNDdlJnMWZTekR1NUw5aHhzSlVqRGgwSFNP?=
 =?utf-8?B?SFZreXhHaDFETXllckpBK3ZnMjN3TU9uMTAzWWZJVElVMUhCNGkvdkJBU1lt?=
 =?utf-8?B?MXEwV094d2kxa3N3OXo1M0VNdkdsdUJtQ1JNRkJ0SVBtQms3MDQ2WjI1K3Fz?=
 =?utf-8?B?TGRYYzI3Z2hpZ1JxS1A0bGwwdndQUE11RHdPbDBSZEtzb0VJaFkyRFVCb2pE?=
 =?utf-8?B?N3RxL2FMV01lVTMyL054WHNseitiRHJmSW1rbnErQnl4M1BnR3QyNHc2V2Uv?=
 =?utf-8?B?TTd5VDIyVHdKaVBrUVZQQXRpNy81YjQ3cFVKZUQzMzdjc3V5ZjhFQ25ob0Jq?=
 =?utf-8?B?QW5sbWRjKzd6ZmhsQ0xzY2hiTXVWaG9SK2Nnb3dYc2Y1MGpNNklndjhCR3h6?=
 =?utf-8?B?andkaWJZem56eEZwejRaOS83eDRmVi9MOVBQcXg5QXg3NU5idkd3US83cC9W?=
 =?utf-8?B?bXBXU3V0UzF6ZUVvOW1VTnVOU2tuYmZLZEx3UWNtM2FnVmg2T3JQYWtmL3JP?=
 =?utf-8?B?VUtkdXlyOVZJUXBSdmVqY2Rnd2h3VmtzTXJpMnRZd0tyMnRROHkrci8wNDdl?=
 =?utf-8?B?ZzJvYmlJT0JWY0tZMS9aT3BpaURMOTN4SEJJaFY4NEgwNjAwWUZZWkdmcDVo?=
 =?utf-8?Q?QfwLm5bAmc9hXSv4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3e2076a-0201-49d9-fd90-08de4ee83823
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 19:00:41.6219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Tg9ns8CyiCeYstSdjtFzIhCoOgLAPAA9mRimqIR8KAJro7Eh295gpcy7Z8k/NH+QEtS0D8F7uM2JeUPjMIBJzSoYHR+xmhxqvYo+7cP9eY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4944
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

On 1/6/2026 5:21 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/xe/guc: Bump GUC version for NVL-S, CRI
> URL   : https://patchwork.freedesktop.org/series/159711/
> State : failure

> #### Possible regressions ####
> 
>   * igt@device_reset@unbind-reset-rebind:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159711v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html

Errors unrelated to this change. Look to be related to existing error.
> <4> [472.667507] ------------[ cut here ]------------
> <4> [472.667509] list_del corruption. next->prev should be ffff888116227400, but was 0000000000000000. (next=ffff8881bc8fee00)
> <4> [472.667512] WARNING: lib/list_debug.c:65 at __list_del_entry_valid_or_report+0xfe/0x120, CPU#0: device_reset/7989


> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4336-3d6700a02638d446a4e8ad92a8212c3efef84ae0/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159711v1/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html
Errors look unrelated from intel_vpu component.
> <6> [395.721186] mei_gsc_proxy 0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5464: bound 0000:00:02.0 (ops xe_gsc_proxy_component_ops [xe])
> <3> [395.728859] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_ipc_send_receive_internal(): IPC receive failed: type VPU_JSM_MSG_PWR_D0I3_ENTER, ret -110
> <3> [395.729470] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Failed to prepare for d0i3: -110
> <6> [395.729732] Restarting tasks: Done
> <6> [395.729906] efivarfs: resyncing variable state
> <3> [395.732659] intel_vpu 0000:00:0b.0: [drm] *ERROR* ivpu_pm_runtime_suspend_cb(): Forcing cold boot due to previous errors

