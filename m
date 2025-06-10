Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B883C5B543
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 04:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D0C10E258;
	Tue, 10 Jun 2025 04:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Be3tlObR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9960610E258
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Jun 2025 04:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749529895; x=1781065895;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lPbozmJoHqxGhOSpxyot9TiRpKeLD8+ADTKKBd8Uk5A=;
 b=Be3tlObREMTfgeQ93KjJ+jag6le/j4Dqk59aab0F4tyJprR5KBKUXTaf
 upkLe1yyyIcvN0s9L8+kOsy5N/KIO8C1lb8ec92NLTCee4hhAhV/onlY2
 8olxU0X5NhwfomF+bBvFWxYg9/RwYNaFHR98MffT9QDUROczvwUYiBPyV
 5EaBVMq3O6VqPcaT5qI+eJJRqky7LYHbLTAtMugYwvIJN/LGXS+NLCYn/
 QmIBVnEWU2g6LcOzh7h0gujhX82jbNc88XMdh7iRaM//1q4EM+aV4Hbuw
 /Ng4UPb1DmGSkXY6+V+Ysv/JzVMXdBdYVWyVbZIW7MGImoZFwi51wb2pE w==;
X-CSE-ConnectionGUID: P1vtHVhFS3GbeqZotV8oqw==
X-CSE-MsgGUID: TgtI+Ke6R/+usI2BRRzNEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55415900"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="55415900"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:31:32 -0700
X-CSE-ConnectionGUID: sKiWaNQdRSWI+HlkAWv3sw==
X-CSE-MsgGUID: dQ7CKU7QRQCukXjZcVyyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146692446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 21:31:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 21:31:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 21:31:31 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.79)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 21:31:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EguY4QEEqu8QqrsiS5Q3hN1DqMGK8N/+jM1efxhvUwi3VClKeduYIYxpNnvDMLybmOwe1YxlPtbBV1bP1XUH8gdOCflhHEvWEdzC1AyDEX5EasNFDpG7ueSoaCZ24X9txKvvnvMyCWD1LLRpNnEZKZkgXD2cNjBh9WebbLxtZkm109AZMXGrT8z36igzS1s8Oy4hlKrYpGuVq4lOKZgoSbPiEoNoDhiUa8pNuSyNoNELhU/UeOLjXi4LUEe4iRgooZw7BU9Uf5971fhHZN/wCJT69S9iko1kT0fatEJW0Sol7smCayNskPOTaL+YhhW6HpOJG9soO5Hf4MNePmBALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rR5qf5KKdLLUA406OSt/nbVGGdmAU+5eyBXZETobRTc=;
 b=mqAof9PF9G5QOM+z4x6kMqvKZejlRFUAwJtuZL21eyHp6RoQJM6DQ2tq6jCklN7SZfqY9+tBv1wgPbrKGXuSGI/LcINMA9PH9oE0CN1mEPaHvQCqJogNtlmlGAeWrIU0RwfnuQWbxJ4Jd6l1ToQnACqR1YQ9c4dbcBt97Q8U/tKzGbf9/m0DNDcdlz0V9mmQ0s011aPEBrDdSil1ZrCtEwCWhell8MxsX5008f0Obxe1slV6EOhAM8+t2Pd6q16w0lAjS1NmY1EXH4ptpFWQHVIB7+FOIA+CUd2NdUr68ZUCF1qK2EQ7sXezfnWMQgOqDUErrplivw30JhxkT0u1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SJ2PR11MB8588.namprd11.prod.outlook.com
 (2603:10b6:a03:56c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.34; Tue, 10 Jun
 2025 04:31:13 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:31:13 +0000
Message-ID: <84b8a1ed-aef2-4260-bd42-9014824952ce@intel.com>
Date: Tue, 10 Jun 2025 10:01:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/19] drm/xe/svm: Add
 xe_svm_ranges_zap_ptes_in_range() for PTE zapping
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250527164003.1068118-1-himal.prasad.ghimiray@intel.com>
 <20250527164003.1068118-9-himal.prasad.ghimiray@intel.com>
 <aDeZHeonaIwMzu0j@lstrano-desk.jf.intel.com>
 <adc4f3d7-7a75-4672-8ba4-7269f6e71b2e@intel.com>
 <aDfb21fATPB4xyyJ@lstrano-desk.jf.intel.com>
 <aDlQUeDNTTIJxM+D@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aDlQUeDNTTIJxM+D@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SJ2PR11MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f394ef2-986f-4260-5eec-08dda7d7a1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3psQnF6LzBEcnRLNDRiZ2xQSjVnQzlqK0ZwelJoMEZtZXNOREZCbHRZRmdU?=
 =?utf-8?B?eVFOeGFpMFpCZStvMVIwd09DMVBBeTdVRlExQ0pSQjNWKzZmY2krcnlEZ2N5?=
 =?utf-8?B?ZGh2YlNxc0U1Y28zNHVQL1Y3SnNkUVlRek4zcHdOd0E2UytBOE95U2d5TnlE?=
 =?utf-8?B?NG8yamZMOEhtWXp6M1BXYmphMlh3cGFxOGlPNjR3aEx6SFRhd0wyRFpFN05L?=
 =?utf-8?B?Vk1oNWJnQk5yYkN4RzlUbnF4dVkzTXFxZ3RuR0lOL1NZVytjNTFIU0pOUG93?=
 =?utf-8?B?cGZha2RoYlU3di8yeVZjalR5SmJMck8vWXhFVFZISit2RTAvclBHejEyb3Yy?=
 =?utf-8?B?TXZJSm5NdkVmQW01SEZMcjBSOUdxcWtKTHlZazNsc25lODUyZjJlTEFKb29M?=
 =?utf-8?B?bTFSZHBEQTVlcmNXSmgzRS9sVk9GS2Q4S1FkQ2xGVWlZMUVwdC9XY2dKV0hS?=
 =?utf-8?B?RjRtaHpNbzF4cGtmaTJZamcwemRtUFByaW9mU3VkME4zN0liYlZTQmloWnlO?=
 =?utf-8?B?OE1PVFZ1V1lVVVBtcEVxTUtJYkRLRk5oc1ZjOXdhVjcxVm1hVzlFODhrVkln?=
 =?utf-8?B?VUNnL3JiYUhzRmNPVGFPd1JZSnE0MHU2ZmlHdG03RjMwMWthNzVCMmZDSkND?=
 =?utf-8?B?eXJ6cG9xSmVYWndZOHltUDVWV01HU3BycnVrQ0RWMlBkaW9Bb1ZhYVQ0RmRm?=
 =?utf-8?B?MFZyVFdKLzZ1Yk5sUEp0UFJwZDFGQ0xZWEpjOHBLMzZiNndOWlFnUGo4cEM2?=
 =?utf-8?B?cm56ay81Unc5QUJnLy9CWUZPODRaa3RCa1pQdHdVN043UHJyVTJNcWs3MzJJ?=
 =?utf-8?B?VTREY0lRWHMzY3kwUVM2THNnWi9LWXMzUk5veHRVSU5BYnNFWUdOczlOR2gr?=
 =?utf-8?B?b0UycEd3eUxlRnJhR2tiOGJzUzJQQzFjcGl2MktYU1NVblhwOTJYSkpVeHFn?=
 =?utf-8?B?cHh0ait4S3lFUE9JMmplb1hBYkx3SXpoRmlkQzl6UmNJZFBUTXc4Q3FNdk1n?=
 =?utf-8?B?ZjFZTFlmcmt1b3hONlFEVFB5SUV5b0pYcmFES0hkNGp0ZU5oU3ZjTmtqczli?=
 =?utf-8?B?WW5HOWNybmc4N2d5VEt0bzhsSTR4U2FUd0YzOGhyZUFPSXpvUlcxMnQwenVs?=
 =?utf-8?B?QUlMWE40dnNQQSs3ZHBkVVBOeW1xaW9iSGN5RkhIbCtGVTB3c2Q5VEdkdTdZ?=
 =?utf-8?B?Y1VRNG4zQnV2bzBQeUkzS011Wi9FQmlURzc2K3VpdWdxMmNPUzhZRkVUcFZC?=
 =?utf-8?B?MVZsZ2UwcVU4K2JjbW15aTVrYUNWS2tmUjhBcUxHSTA1REUxZnRXR21LR1JF?=
 =?utf-8?B?aEpkaENVRDc1b2Y1VzN6TE4rb0R2bGMvcmVGWGc4S1FTTllRT3NaRnBoTzJK?=
 =?utf-8?B?aXdIbzkzS3ZadWNYYkh3MWtsNW01R0U3Nzd5WlZKUWFYRWQxakhVS1l1b0Yy?=
 =?utf-8?B?MHBZc25hYzlPenM3cFRweGdXbzBSNzNwdG5GNFFySHpwMVlGTEdLdFJzQXF0?=
 =?utf-8?B?NGcvN2R0RTZUUnRsKytJWWZCeTVVQ3g5dDRlS0lJRkh2VFVYODhZUHZYNDQr?=
 =?utf-8?B?Z2ZrdFNLU2xwMDM4ZFN2emJhZUlPWVd0VzJ0dW5vRkY0eHdSUXhxaHpTR21E?=
 =?utf-8?B?OTFCL3JyZzA1Z21qdzUwMFNEQUNTbHpQWFlocVFobUJjbDBxL0s4aXUySC9m?=
 =?utf-8?B?aENQclVtaGFHYVhMejY1Qkh6ZmtyWjhjMDlPckp3T3c2cWdQNm1mZEpWOUcx?=
 =?utf-8?B?NVpJSS92WTZrTzFtZ0ZUVUxjZzQ1aFM1S3dESENYbVAxTXBkN3Zlb1BqQWlt?=
 =?utf-8?B?ekRyQXI0TjBKYzVjTzhCYmRsQTNoWUl0QzhWa3NkUUlWa0hmSWpEeldrdkVa?=
 =?utf-8?B?bTN3dnZkUmhDOUZUZXpQT2FucVBBcjFXeUlHa2prYmZMakNDNE4zcjB0d2RO?=
 =?utf-8?Q?CxE5+en2QTk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0IxWEZNRGp3Z1oxd3ZtTFpZWlRUMWFGWFYvK0FVdjhWWGdvNUlVbVdCRmh0?=
 =?utf-8?B?bkk1QmVES09JaDM0TzZQb1FSUTlGODMyNEJHVmhwZnFHWUpvOHZxUnFqaGNn?=
 =?utf-8?B?VUhCaTRYMjZIZnZhNTcvYXRkdVFGUlNJdFpBdG1UeG5OWTZ3aHNQL1lXY0Zx?=
 =?utf-8?B?QmtHbGF4TEd2QVNlNzQwN2RlVVcyazlRZThPam45c1k0N3BlbGZKYTFQSUts?=
 =?utf-8?B?RGNwa3U5RDNkbStwZDhDVCtnOEdRV1R1UDBYZGdSenc3SlREMXd3eTk1TlFH?=
 =?utf-8?B?ajIweU9kZnMxS1c0ejJRc3E4V3B3SHozYXJqWjNmdVBKRk03RXA1ZmppeUxM?=
 =?utf-8?B?Rm1iUEZZSERHWHB1SUNzUmJFTkpQZ0RsamMvTERYZHNJWS9OVktsaTRhSzZ3?=
 =?utf-8?B?WkZZMmNCSlBSZGdVK0IxTW5tWDJFbnJ5V0xiNGRYTnQ0elJmaG1nSGdtdW9n?=
 =?utf-8?B?NEtYQ2p6bTA1eEZSaEo1MHZyRC8yam9pd3hhM3lOdVo2Q0RpZ1NRbkpmYXNr?=
 =?utf-8?B?TjZZdlpWTWJZVXpheDNKSExRQWt1d1VIUURHMnF0cmthVU5HcEpDVlB6REsv?=
 =?utf-8?B?b0lFWnVObmlMbWR4ZWJzWXFCMURqbXJQQ3pFTFZrWGVIcVRPalN5N2FFQjM4?=
 =?utf-8?B?c1JJTkVSTnFoT3E2dWdlY2JRWnZBKzJjb0ZRUCtFejhCSkVEcW9WM29WbXlo?=
 =?utf-8?B?cklVSFFMSU96aG1jUVBzSHZrUW5QTUtCb2pyRXlQRC9sSkYrVEtnVWtSaHVN?=
 =?utf-8?B?cnJ3NlYxSlIrQ3hNWGYwRktsUE9JTXNJUWI3Z1g1RHR5aGE0c3d5eDJLa2xs?=
 =?utf-8?B?anA1cUtld1FZTTRXTk5wZWp3R2s2eHFsek1ocjVhQUR2UnIvYkNQZVZwaEVk?=
 =?utf-8?B?cGUrdUNPYmsyenU4QlpYMFl0aEVIcDNhWVZaMks5cjQ2YXBreEpkZmViYnM4?=
 =?utf-8?B?ZWVqVjdMS1EwemRha203NzVuVEFZMFpBd3hzZ080OVh1ditqZU5pbTFJaWk1?=
 =?utf-8?B?eThOa2QrdnhLcEY3R0pHMllGcWV3ZHZiM2FrdEIwWms3cFlveHUwZGFtSzZk?=
 =?utf-8?B?dDJkZnlPNjVqMFB4TjM2NHpRNUt4Y0JSOXczTUpmU2RhMjJZdzB3dmhrT3g4?=
 =?utf-8?B?ZCtMNHRhdWg3UkxxbmhFNEZZT0RtNHBFcGtHM0xwdjhJZGgzK1h1VDAyNmUr?=
 =?utf-8?B?Mm4rUVJiRndURFBZOS9heEovQnlQYWNGUUNwUk5GT0NDODNHcWFNbk1uUW5s?=
 =?utf-8?B?L2ZVcDZIWHhCLzFxL05sT29FNGl0SWNQak9zTWZVcllLcmh1cEQ5Vm5HM3dB?=
 =?utf-8?B?dUhNczFhYUpGQWkxUjRsTnZLallmOCsvcHVMOGVCWS82d0o5RXYrSldqY3Zq?=
 =?utf-8?B?K1JJdHNkdTBQWjhwVVlOTVdQa20vWEw0OTVsVjZHV3RzVGFsOTFJd3lQVWlT?=
 =?utf-8?B?blpKaWFSNjZHNzRxMisyeGlJb0RVeGE3emg3UGZHTFZ3VUpja1RpQkRUd3Va?=
 =?utf-8?B?eUc0WlMzd0h6Q0RVWXhVaEFlcEdyeGorY0hQenFzQWczZkdnNlZRamJkcXQ3?=
 =?utf-8?B?YXNDTjV6K1RhKzd5cFFOY0haZllSMHBuSzRwb1RrRC9tT2NEMHpCQjdTVzA1?=
 =?utf-8?B?WjQwdWhJTGlaQjBiSlM5Z2FPSlhQbURiM2FRbWFDTkErOFZ6RGhleFBPdHdV?=
 =?utf-8?B?ZDA1UWdjQkM1QXN3MTB4WGRrMUNQME5WTjNBbHdyT25TblBjaVZhWkJ4b1dQ?=
 =?utf-8?B?dVRwdGh1aXlrVHAzb21xbTdmblpHWmxrbnlCWVZlcjB3ZHRwSGhLVXBtbVJn?=
 =?utf-8?B?amRHb08vUXkxdFU3eE1RcDk2ZEt5RktXWGVJZWxtd3hqYk9RMVk0WnhFbUNx?=
 =?utf-8?B?YW5vZzZnUFhiWGoyK1krSEpiU3VKVW93RU94bkExQ1BZcDJQV0tUYkVhRUJu?=
 =?utf-8?B?YzlsYkNBOFFpeXlRSEhEZVlrL2ZIcktHY3dheDZZRFBhMXJPaXBMbGMzMlZs?=
 =?utf-8?B?ZEZRTVBrL0dINWJZeXc1bUx4VFpqSEh2WnlETnVWYlJ4UHFYR3p4MVpnMFRH?=
 =?utf-8?B?N2k1N1ZsSUk3dVVXdERTd01ZdHowWnJYZlU4S1lMT01HVE5OK09YVFYxa21i?=
 =?utf-8?B?UW5uOXdyU3JaUG15R0ZTVzFEZnUxd1J2VThISE5SRStCbVhjT0l5YlR0RG1n?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f394ef2-986f-4260-5eec-08dda7d7a1b6
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:31:13.2888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSNvt4Wo3skrrL1uDXnXeUs17Kwnhw2c+IsG3y+7NlPAp+nKQUK+/yMZVqyUkMtx55Y4/9hAU7HMw2p1esoKuwxnzBY5o78cxjYWBF1TpuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8588
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



On 30-05-2025 11:59, Matthew Brost wrote:
> On Wed, May 28, 2025 at 09:00:27PM -0700, Matthew Brost wrote:
>> On Thu, May 29, 2025 at 08:36:28AM +0530, Ghimiray, Himal Prasad wrote:
>>>
>>>
>>> On 29-05-2025 04:45, Matthew Brost wrote:
>>>> On Tue, May 27, 2025 at 10:09:52PM +0530, Himal Prasad Ghimiray wrote:
>>>>> Introduce xe_svm_ranges_zap_ptes_in_range(), a function to zap page table
>>>>> entries (PTEs) for all SVM ranges within a user-specified address range.
>>>>>
>>>>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_svm.c | 43 +++++++++++++++++++++++++++++++++++++
>>>>>    drivers/gpu/drm/xe/xe_svm.h |  7 ++++++
>>>>>    2 files changed, 50 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>>>>> index 59e73187114d..a4d53c24fcbc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_svm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>>>>> @@ -1006,6 +1006,49 @@ int xe_svm_range_get_pages(struct xe_vm *vm, struct xe_svm_range *range,
>>>>>    	return err;
>>>>>    }
>>>>> +/**
>>>>> + * xe_svm_ranges_zap_ptes_in_range - clear ptes of svm ranges in input range
>>>>> + * @vm: Pointer to the xe_vm structure
>>>>> + * @start: Start of the input range
>>>>> + * @end: End of the input range
>>>>> + *
>>>>> + * This function removes the page table entries (PTEs) associated
>>>>> + * with the svm ranges within the given input start amnd end
>>>>> + *
>>>>> + * Return: tile_mask for which gt's need to be tlb invalidated.
>>>>> + */
>>>>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>>>>> +{
>>>>> +	struct drm_gpusvm_notifier *notifier;
>>>>> +	struct xe_svm_range *range;
>>>>> +	u64 adj_start, adj_end;
>>>>> +	struct xe_tile *tile;
>>>>> +	u8 tile_mask = 0;
>>>>> +	u8 id;
>>>>> +
>>>>> +	down_write(&vm->svm.gpusvm.notifier_lock);
>>>>
>>>> xe_svm_notifier_lock
>>>
>>> xe_pt_zap_ptes_range needs write_lock, whereas xe_svm_notifier_lock/unlock
>>> provides read lock.
>>
>> Hmm, I think the assert in xe_pt_zap_ptes_range is actually wrong. I
>> likely just added the in notifier assertion because that was the only
>> user of it. We want to guarantee that only 1 KMD thread is issuing a zap
>> or modifying the PTEs at a time.
>>
>> - The notifier lock in read mode guarantees that an invalidation
>>    from MMU notifier doesn't race here.
>>
>> - The VM lock in write mode guarantees no one is modifying the page
>>    tables.
>>
>> - The notifier lock in write mode guarantees no one is modifying the
>>    page tables and invalidation from madvise doesn't race.
>>
>> I think this complex condition can expressed in lockdep by:
>>
>> lockdep_assert(lockdep_is_held_type(notifier_lock, 0) ||
>> 	       (lockdep_is_held_type(notifier_lock, 1) &&
>> 		lockdep_is_held_type(vm_lock, 0)));
>>
>> If this works, a comment explaining above is probably warrented.
>>
>> If the above doesn't work or we deemed this to complex, maybe it fine to
>> just take the notifier lock in write mode...
>>
>> I suggest we get another opinion here, perhaps from Thomas.
>>
>> Matt
>>
> 
> Actually, this locking is incorrect for another reason as well — the SVM
> notifier lock needs to be held from the start of the zap until the TLB
> invalidation completes. The reason is that an MMU notifier could race by
> seeing tile_invalidated set, skipping the invalidation, returning, and
> moving the CPU pages before the GPU has actually stopped accessing them.

Agreed, miss at my end.

> 
> Similarly, the same race condition exists for userptr and BOs being
> moved. So, for each invalidation, we need to lock all dma-resv of the
> BOs being invalidated, as well as the notifiers.

true.

> 
> Therefore, I think invalidations need to be moved directly after calling
> the vfunc that sets the property, using a DRM exec loop to lock all
> dma-resv of the BOs in the VMA list while we have it, then take the
> notifier locks, and finally issue the zap and invalidation.

Makes sense.

> 
> All my previous replies to this patch stand too.
> 
> Matt
> 
>>>   >
>>>>> +
>>>>> +	drm_gpusvm_for_each_notifier(notifier, &vm->svm.gpusvm, start, end) {
>>>>> +		struct drm_gpusvm_range *r = NULL;
>>>>> +
>>>>> +		adj_start = max(start, notifier->itree.start);
>>>>> +		adj_end = min(end, notifier->itree.last + 1);
>>>>> +		drm_gpusvm_for_each_range(r, notifier, adj_start, adj_end) {
>>>>> +			range = to_xe_range(r);
>>>>> +			for_each_tile(tile, vm->xe, id) {
>>>>> +				if (xe_pt_zap_ptes_range(tile, vm, range)) {
>>>>> +					tile_mask |= BIT(id);
>>>>> +					range->tile_invalidated |= BIT(id);
>>>>> +				}
>>>>> +			}
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>> +	up_write(&vm->svm.gpusvm.notifier_lock);
>>>>> +
>>>>
>>>> xe_svm_notifier_unlock
>>>>
>>>> Matt
>>>>
>>>>> +	return tile_mask;
>>>>> +}
>>>>> +
>>>>>    #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
>>>>>    static struct drm_pagemap_device_addr
>>>>> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
>>>>> index 19ce4f2754a7..af8f285b6caa 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_svm.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_svm.h
>>>>> @@ -91,6 +91,7 @@ bool xe_svm_range_validate(struct xe_vm *vm,
>>>>>    u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
>>>>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
>>>>>    /**
>>>>>     * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
>>>>>     * @range: SVM range
>>>>> @@ -305,6 +306,12 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end, struct xe_vma *vm
>>>>>    	return ULONG_MAX;
>>>>>    }
>>>>> +static inline
>>>>> +u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
>>>>> +{
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>    #define xe_svm_assert_in_notifier(...) do {} while (0)
>>>>>    #define xe_svm_range_has_dma_mapping(...) false
>>>>> -- 
>>>>> 2.34.1
>>>>>
>>>

