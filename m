Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3C1FF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3946D10E0AD;
	Tue,  5 May 2026 05:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJv0Mlbm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EB010E0AD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777958904; x=1809494904;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iryf2xFQhmwjdwP/YX+NtkiIEKtS5JHDNZpuaTClBg8=;
 b=JJv0MlbmfksVIf/vvxKm8t40F4Q3x+jAddqn22+SZIIXAQ/TGvVh3QID
 ylQtg0+SS0TM+ToV3zGgbQashdTKVbP3lYUR69wJrm6M5nUjIDe72xFVD
 jWjV468k+j/H0ZgvNhbWGlW4bwk8LmIRe0s2wAJYduv+MEr1Q4Sg3sR4D
 /tWzwb9+dd0X0aFmGek8Sa1lThxfq9oUtKH1UnLWxuPw2gLvNBqvXbK2f
 1klurx9PiO7ammqin2YdoNdrBraNzxZ28VsUjk/M1rIVKVqDSlVeWoIGD
 /oWYvMmr4txpaGII9y24U77WAfREUSjKXknHn/8eKy7XLlch+skxabMQW g==;
X-CSE-ConnectionGUID: 1ZAffKgkSiSzAAEjSuoJFw==
X-CSE-MsgGUID: Bpx/V7C9TvOCcvyWVicORQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89410332"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="89410332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:28:24 -0700
X-CSE-ConnectionGUID: wExDtkVWRB2Fw1H9sPOZXw==
X-CSE-MsgGUID: S0sDOCtwTdC4J4CMz3jQ9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="273835493"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:28:24 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:28:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:28:23 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:28:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxCXVENs0GQKWcWaKfcXGnpvINqUBYsVeJEt2mODtk+sklxKNWZKI6cQpdiHBnDIOZbZtle6GJcAPV/eFr9H/ashhq3Dmk50kW36uiWt0hueM9JFNnwL6UCkeEYCzGT4hqrmWrHY9sJQdVKiET7VD+F+sueCxvQXbMEGkNjw2r742r+5l8PpJ4aPpzqGtQJ4fIKRYAjhyIJXO7+74mDFcPfTSbqcNSAGnKJhnmxIMSh1awC2jUo4k4zoFPQs3uvAL5S/0ox6xS9FV7LZHvGtD5++tNymeRslbGphMd989tf0uVbq++m75FpTfEDi0kshOR2xECAfawdcumuLD30BXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXmRAkgO4aXTjomLPsCKeijhbsV3ABoGtFsLJ54pWl0=;
 b=M/XLv/BftdBMjdFftM8IB58onDkqGH0uLyWNVZmhEjlH+tpwCKq4IdaREtaOXPiXpRNGCpahVjDt614vvHggP36iuYPWrh4U4m5kqDUTDlBwdag9cK7asIE5MYZNeDvTD20/pjvn84Z6gIELMZHWRqskN4kMl5HslfP8T+ikV1oCX1gczo6LynEOTpVX1pCNZofS6ArqWZg0A6K8tdwExyhEm7i40tnIK8Y3qk7qeOmyn9Ic7+8VidDBPJeryKwLaGQDqvOeuqvwy5ZGo0okYmoAW3nGVaphO/Z4yDsH4+tsOTf8nLOhoFyDHan0soi6duInt6k8cKXDXl0UkJ/Mbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 05:28:14 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:28:14 +0000
Message-ID: <a540dad7-b50b-4f39-bd18-8ab601971324@intel.com>
Date: Tue, 5 May 2026 10:58:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/13] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-22-riana.tauro@intel.com>
 <ae8dWCGV-5XOumUH@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <ae8dWCGV-5XOumUH@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b8bce5-5fc8-4a2b-af4c-08deaa671a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: WWY2RwM53JLsAT0XxuKeOTHGnQDgSTX1zo+brL+J3bPL6W7NWyC2lnrrjVw3MFhd4P0xch9EungJGa31Rno8NzSWzOKz+f9EFwA3SoKvBMp/fYNydWszHjz+HHQJyAFmEl7foneI0B1SjeWp+M6kcOSxNELVMJsblM1hv2QTJSXeJVyeecE2TzIyqjpG0oKruFLUTO18KPkqYE5a0OuF44kfNo8tW7FRmeLzdMVBtlFqjiQgpB6x1SfQYITK4K+2zafo/07QBX3t/3wrxqdGoyt2lyWk4+FmunZsDbn95lKzSAV7kD0snJ/l5ol+LGsZL3cP48Ud0DBWk7+1dwrYzHotowZPDb/Ai7E+0PyWqmkbdImPSPUBcJDawQpCXVeFcLfndPJdd56s/eQyXbXg7bRGB8rNl4S3KL5Ud3IrhJqdxb8FbJNju0SFxf/8JM0gs2/VNcE+/NU1ueuRDQHMrAG+MBipcRbBxCMmHRqpuatN1BTf+8NW7/XpSiF9KyZApGmM6sdNIzEeqHiI4PT0R3jzzjG2oPCQ+7YFCUcijmtbMxZEdiz9MdBM2t6sPkyaAmqfHBANfXHoC6rpOcQh/1sc2zttKcz5PSuXj3Gy5MgjtI2ueRSpNpG0N/dyKz1AQ1iqAqTSVBIWG0u11/fxuBMiWDwMWB46eLTPucBMyiwiCdrxYZ8erdcWfWgo82JH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWZQYjZaL0Roak5jN2lWa1JGWlNMS3preGU5V2Ztb0tQaVV3Y1QraTFadXpZ?=
 =?utf-8?B?Uk1mR1BmWnAwaElaUlBRalorcmN3cDZiVmJiUi9rRHZCdWVDd2dPWnY5WjFI?=
 =?utf-8?B?Lzl5bUhQSXJ5bDU0K2d6am03anlZNGVXaXlSWXg5ckhrNmRkUElZNXZkRkx3?=
 =?utf-8?B?cmVCaUU2Y0FGcU1GaXJ6aWIwR2RoR2QreGFxOVJqTkhXSWFwWEhiTXFuNk5x?=
 =?utf-8?B?WTZQanB4SnFRK3ROdEpvV0dzZW82dUdyU09jVUtVRHZ2cVd0OXJXNFV5VDhO?=
 =?utf-8?B?TVo4NnRQVmdjbGI3NEd4Vmg1NVhsZUlvd0gwamVkdG9NeDJKT0xVZjRUYmhW?=
 =?utf-8?B?QTFmN3dMdlVPeG4zaUNncitrMmJyOE5oblkzUW5QZy94SFU1cm9PTTJCOW9O?=
 =?utf-8?B?Z3A2SmozZGV2V2xicEtyOTYzczgxLzBJZExFL3B3VkJlSXJXZmtHMU0wQkRL?=
 =?utf-8?B?Vm4wVUV0QzR1ZUw5cURUNnNPUGN2WEVjdHYvTExtTHNRTDFwblBZbTRZTUtx?=
 =?utf-8?B?bnRpVzZ1TWphNmh0K3F2djBHa2hsME80QzdCa2xCa093WkRVcmNyZDNmcEUv?=
 =?utf-8?B?dk1kNEt5a214MVhxZjFSRzMwUm5UZG5pRnpiWm9wL0ZNazg0K2QyL3VWUTNv?=
 =?utf-8?B?MFg1MWRDZm5VVzF0MVpycHVUcEtNSzFyZmwvR1o3R3JVTlB1VWNJbUkzRlZN?=
 =?utf-8?B?M1hzQTYzdUdEVkRFL0w5eXV1bHpydjdIL3pFSUw1dDBsVnA3Y3h1eVprNWF0?=
 =?utf-8?B?b3BQVHNVWDl5ajZ2akNUNHdlOVZuNGRVTzFFVHZIdEZQWGZZZ21zQkhtM3Uv?=
 =?utf-8?B?R2hONWwzTjkzUWp3WjhiZFdzZ1VoOHV0VDdRbmZhdG5Sa2lDblJORi9ZS3pJ?=
 =?utf-8?B?QityNW04RnJib2l4bFpjL0xmUzlsT2tLYlFsUXAzWDFSaTBqL1g5ZnVraWVZ?=
 =?utf-8?B?TmI4SHhFaWdzSTVFYU4vV2hkSUtxSkcrMXBRSHFpTnRHd0xxWjFPSm1vZXZE?=
 =?utf-8?B?R2NDTHhwOWVHT0s3SjZXcDVnUkE1ZGtYejNKNFJ4TUh5OUFmMm10UGpDVys3?=
 =?utf-8?B?eHk1TVBleW9SNVRsR1dWYXNiTktMZE9NMzBwNFhDUFV5aHZwQnczSFlYbWIv?=
 =?utf-8?B?eXQ1RjIvdXZJWDFNZWpYdlY5NXlGbE9yVmFUdS92ZW55dTNnRzhGNW5MZ3dX?=
 =?utf-8?B?REhtY1hmQ0U5SzBKWVZ2aURFdUl5Qktrck9NdVVJYmx2b0RmeGtmUjFSd2Jp?=
 =?utf-8?B?dW9Pb2ZpUWo3T0lOcVc2WkJ3REpnMHdGb3Rnak15UDNGZWhzVCsybzhXcWJs?=
 =?utf-8?B?ZHVUcGo3TFpSY3pKczlibzIwR3E1RkV6VHErckxZc3RpaThYdGFPSVNtU1ZH?=
 =?utf-8?B?YXhLbmViZ0thZDN4d0RGUXBKMFVtdStIdnRJNWNpWTg0OWQ1aFd5VlAxaSt5?=
 =?utf-8?B?VDAyc2UwQ0JwK2ZhbTB4cHVIQnA0UWFGcGxJQnE1QU13eE1oRUdqK1JYMGo0?=
 =?utf-8?B?cXpUZmo4NXZZSGV6Q1ppZzBSQ3RzYjlPYnl3d0tObnc4SkpWS24vbDNub2NM?=
 =?utf-8?B?bWxKM0QrN1U5dmdQZjA0NTZDcFF3eDhZWk1GZVd6YjRDK0xUSE9NT1kxVmRh?=
 =?utf-8?B?c29KK0ZNKy9GaE4waDRHRXAxZE1kc2xUL0NHNE8zbG1UVUdHNmRKMEFwWkJM?=
 =?utf-8?B?cW9heGxack5HcW1zaU9rZyt1a2dJdUhpZkN5SytGQUlLYjNqK2d3eVUraS9I?=
 =?utf-8?B?QVBoTjd1OWdHWFAxTUhEbnpUeDAyZExpVmtzbWNFcE1zWWhLMGhUMzZYNlBL?=
 =?utf-8?B?MnZNZUluVEhTcituSkxRNmtwTENtdHZwU1YreHNRQkdmbzg2ZHNrNzU5U1Y2?=
 =?utf-8?B?MkNYZ2llcFlld1gyUzR4bnNmc09TWFJXVUloUXI3bE9Qa21RODVKWkdFdm80?=
 =?utf-8?B?VlZiWUJSRVRTSm1KeVRZczEyVlJVQWRyNW1XTi9zM0RVSGgyYmlmd1hyTHAy?=
 =?utf-8?B?RlVoOG42eU1BK1hMRkV3S3UzYnd4TDFXZm5vOTdpTGV2Z1BSdE1ZTHJvZDk5?=
 =?utf-8?B?TytWQlF0NGdrdGxSQ0ZxNmg5S2pkTnJyTFVoRTRteHlnTldaMEc5RjFoa3p3?=
 =?utf-8?B?Vm13ZGUwTU1hYzd6ZTRRTWcvYkJXdGJDWHp5QUJOR2NmREFGYXQvaXdvb3hM?=
 =?utf-8?B?MjhGMTJ1N3FJYTFhMjd5RDFUeDAvL01NMUxUejB5dGg2UkR5bVFuY3NpVG44?=
 =?utf-8?B?Z3dTSGgxcnluV25tNDlxa3IzWENFTDRwOFV4TFdxR0VhSG93UHUwVkw3ajJi?=
 =?utf-8?B?TXZtVzdhNkZiZGhVdVRlOG1SR3pGN0VlTVZhQlBMcllxZ3hVUzZiZz09?=
X-Exchange-RoutingPolicyChecked: fwVh2umLh66E1pi8XADGztGBQBEWD/8pj/jX6lVm+SBzw/zkOQq4Q2Mz5r6+CRP3KNkN5YdrF+fkq18L2j4IdGOofGaWEryEuDzNBcrq3I8X24tYWbkMYjImlfS1+/+d9TApt4maCKMISijNkIPkCQ0RaReRXlbSH3yz5QWB4PT1JLQjaoyOu45stiuu8B+OhA7LwakJzm39J+4iGHezM6ViLzRObItMlde+HGatotOLpodyPg3IoqQqAiGrDMK3quzjGOGRbuYMINoGLSQdFInHNCpRrkAS6XTVVC8SXTfVRXZGciz0gUBElbgCmDPVg0B6q8px2cM2ftKFzIPukA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b8bce5-5fc8-4a2b-af4c-08deaa671a84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:28:14.0170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ugZ8e3F3oeJBZr0ThPUeTwyktM0qXo7DBwrt8a9s9eAWsAhUg0H5LMrPg301EmuGUN7r2belIvfuh9aqFL+anA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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


On 4/27/2026 1:54 PM, Raag Jadav wrote:
> On Fri, Apr 17, 2026 at 02:28:19PM +0530, Riana Tauro wrote:
>> Uncorrectable Core-Compute errors are classified into Global and Local
>> errors.
>>
>> Global error is an error that affects the entire device requiring a
>> reset. This type of error is not isolated. When an AER is reported and
>> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>>
>> A Local error is confined to a specific component or context like a
>> engine. These errors can be contained and recovered by resetting
>> only the affected part without distrupting the rest of the device.
>>
>> Upon detection of an Uncorrectable Local Core-Compute error, an AER is
>> generated and GuC is notified of the error which triggers a engine reset.
>> Return Recovered from PCI error callbacks for these errors.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add newline and fix log
>>      add bounds check (Mallesh)
>>      add ras specific enum (Raag)
>>      helper for sysctrl prepare command
>>      process all errors before deciding recovery action
>>
>> v3: remove TODO from commit message
>>      remove redundant rlen check
>>      fix loop
>>      add check for sysctrl flooding (Raag)
>>      do not use xe_ras prefix for static functions (Soham)
>>
>> v4: remove rlen initialization to 0
>>      remove local variable
>>      add error message for length mismatch (Raag)
>>      reset on sysctrl flooding
>>      fix sysctrl flood condition
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c       | 133 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h       |   3 +
>>   drivers/gpu/drm/xe/xe_ras_types.h |  55 ++++++++++++
>>   3 files changed, 191 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index bf780e953925..0cc7b3a6b13f 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -5,7 +5,16 @@
>>   
>>   #include "xe_assert.h"
>>   #include "xe_device_types.h"
>> +#include "xe_printk.h"
>>   #include "xe_ras.h"
>> +#include "xe_ras_types.h"
>> +#include "xe_sysctrl_mailbox.h"
>> +#include "xe_sysctrl_mailbox_types.h"
>> +
>> +#define COMPUTE_ERROR_SEVERITY_MASK		GENMASK(26, 25)
> I thought we used REG_ variants?

for registers. This is not a register

>
>> +#define GLOBAL_UNCORR_ERROR			2
>> +/* Modify as needed */
>> +#define XE_SYSCTRL_ERROR_FLOOD			16
>>   
>>   /* Severity classification of detected errors */
>>   enum xe_ras_severity {
>> @@ -63,6 +72,130 @@ static inline const char *comp_to_str(struct xe_device *xe, u32 comp)
>>   	return xe_ras_components[comp];
>>   }
>>   
>> +static enum xe_ras_recovery_action handle_compute_errors(struct xe_device *xe,
>> +							 struct xe_ras_error_array *arr)
>> +{
>> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
>> +	struct xe_ras_error_common common = arr->error_class.common;
>> +	u8 uncorr_type;
>> +
>> +	uncorr_type = FIELD_GET(COMPUTE_ERROR_SEVERITY_MASK, error_info->error_log_header);
> Ditto.
>
>> +	xe_err(xe, "[RAS]: %s %s Error detected", severity_to_str(xe, common.severity),
>> +	       comp_to_str(xe, common.component));
>> +
>> +	/* Request a RESET if error is global */
>> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	/* Local errors are recovered using a engine reset by GuC */
>> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +}
>> +
>> +static void prepare_sysctrl_command(struct xe_sysctrl_mailbox_command *command,
>> +				    u32 cmd_mask, void *request, size_t request_len,
>> +				    void *response, size_t response_len)
>> +{
>> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
>> +
>> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
>> +			   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> Ditto.
>
>> +
>> +	command->header = hdr;
>> +	command->data_in = request;
>> +	command->data_in_len = request_len;
>> +	command->data_out = response;
>> +	command->data_out_len = response_len;
>> +}
>> +
>> +/**
>> + * xe_ras_process_errors() - Process and contain hardware errors
>> + * @xe: xe device instance
>> + *
>> + * Get error details from system controller and return recovery
>> + * method. Called only from PCI error handling.
>> + *
>> + * Returns: recovery action to be taken
>> + */
>> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_get_error_response response;
>> +	enum xe_ras_recovery_action final_action;
>> +	u32 count = 0;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return XE_RAS_RECOVERY_ACTION_RESET;
>> +
>> +	/* Default action */
>> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>> +
>> +	prepare_sysctrl_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
>> +				&response, sizeof(response));
>> +
>> +	do {
>> +		memset(&response, 0, sizeof(response));
>> +
>> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: sysctrl: error ret %d\n", ret);
> We'll likely have more users of xe_sysctrl_send_command(), so probably
> worth spelling out what exactly failed.
>

yeah will follow the log format we agreed upon

>
>> +			goto err;
>> +		}
>> +
>> +		if (rlen != sizeof(response)) {
>> +			xe_err(xe, "[RAS]: sysctrl: response size mismatch. Expected %zu, got %zu\n",
> Ditto.
>
>> +			       sizeof(response), rlen);
>> +			goto err;
>> +		}
>> +
>> +		/* Report if number of errors exceeds the maximum errors supported*/
>> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
>> +			xe_err(xe, "[RAS]: sysctrl: number of errors received %d out of bound (%d)\n",
>> +			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
>> +
>> +		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
>> +			struct xe_ras_error_array arr = response.error_arr[i];
> Do we need this on the stack (again)? Why not just access response memory
> using a pointer?

Sure

>
>> +			enum xe_ras_recovery_action action;
>> +			struct xe_ras_error_class error_class;
>> +			u8 component;
>> +
>> +			error_class = arr.error_class;
>> +			component = error_class.common.component;
>> +
>> +			switch (component) {
>> +			case XE_RAS_COMPONENT_CORE_COMPUTE:
>> +				action = handle_compute_errors(xe, &arr);
>> +				break;
>> +			default:
>> +				xe_err(xe, "[RAS]: Unknown error component %u\n", component);
>> +				action = XE_RAS_RECOVERY_ACTION_RESET;
>> +				break;
>> +			}
>> +
>> +			/*
>> +			 * Retain the highest severity action. Process and log all errors
>> +			 * and then take appropriate recovery action.
>> +			 */
>> +			if (action > final_action)
>> +				final_action = action;
>> +		}
>> +
>> +		/* Treat flooding as an system controller error */
>> +		if (++count >= XE_SYSCTRL_ERROR_FLOOD) {
> Nit: I know this does the job, but I'd make the logic consistent with
> while(), i.e. start from flood value and return on count == 0.
>
>> +			xe_err(xe, "[RAS]: sysctrl: response flooding\n");
>> +			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>> +
>> +	} while (response.additional_errors);
>> +
>> +	return final_action;
>> +
>> +err:
>> +	return XE_RAS_RECOVERY_ACTION_RESET;
>> +}
>> +
>>   #ifdef CONFIG_PCIEAER
>>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index 14cb973603e7..e191ab80080c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -6,8 +6,11 @@
>>   #ifndef _XE_RAS_H_
>>   #define _XE_RAS_H_
>>   
>> +#include "xe_ras_types.h"
>> +
>>   struct xe_device;
>>   
>>   void xe_ras_init(struct xe_device *xe);
>> +enum xe_ras_recovery_action  xe_ras_process_errors(struct xe_device *xe);
> Extra whitespace.
Will fix
>
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 3d0f9e94a404..8bebe958b8e8 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -11,6 +11,24 @@
>>   #define XE_RAS_NUM_ERROR_ARR		3
>>   #define XE_RAS_MAX_ERROR_DETAILS	16
>>   
>> +/**
>> + * enum xe_ras_recovery_action - RAS recovery actions
>> + *
>> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
>> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
>> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
>> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
>> + *
>> + * This enum defines the possible recovery actions that can be taken in response
>> + * to RAS errors.
>> + */
>> +enum xe_ras_recovery_action {
>> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
>> +	XE_RAS_RECOVERY_ACTION_RESET,
>> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
>> +	XE_RAS_RECOVERY_ACTION_MAX
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Common RAS error class
>>    *
>> @@ -93,4 +111,41 @@ struct xe_ras_get_error_response {
>>   	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_compute_error - Error details of Core Compute error
>> + */
>> +struct xe_ras_compute_error {
>> +	/** @error_log_header: Error Source and type */
>> +	u32 error_log_header;
>> +	/** @internal_error_log: Internal Error log */
>> +	u32 internal_error_log;
>> +	/** @fabric_log: Fabric Error log */
>> +	u32 fabric_log;
>> +	/** @internal_error_addr_log0: Internal Error addr log */
>> +	u32 internal_error_addr_log0;
>> +	/** @internal_error_addr_log1: Internal Error addr log */
>> +	u32 internal_error_addr_log1;
>> +	/** @packet_log0: Packet log */
>> +	u32 packet_log0;
>> +	/** @packet_log1: Packet log */
>> +	u32 packet_log1;
>> +	/** @packet_log2: Packet log */
>> +	u32 packet_log2;
>> +	/** @packet_log3: Packet log */
>> +	u32 packet_log3;
>> +	/** @packet_log4: Packet log */
>> +	u32 packet_log4;
>> +	/** @misc_log0: Misc log */
>> +	u32 misc_log0;
>> +	/** @misc_log1: Misc log */
>> +	u32 misc_log1;
>> +	/** @spare_log0: Spare log */
>> +	u32 spare_log0;
>> +	/** @spare_log1: Spare log */
>> +	u32 spare_log1;
>> +	/** @spare_log2: Spare log */
>> +	u32 spare_log2;
>> +	/** @spare_log3: Spare log */
>> +	u32 spare_log3;
>> +} __packed;
> Unless we use the fields on code, let's mark it as reserved.

yeah we can do that

Riana

>
> Also curious, should we be using these for cper or should be relying
> on info queue?
>
> Raag
>
>>   #endif
>> -- 
>> 2.47.1
>>
