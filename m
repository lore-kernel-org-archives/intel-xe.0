Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87856D262A4
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:50:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EFA10E0F5;
	Tue, 20 Jan 2026 21:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QFAjqz0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046D210E0F5
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768945829; x=1800481829;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uzTlRJ4OaND+xNQNOBs2R6n2twupS3OvJ/Y3Icowkrk=;
 b=QFAjqz0FwN0azl6gYG8dmeRsq8vWQ2KLielHdYq4vcEws1SV20hpManU
 d3mhlYqoNcKk8LsI6jRRD/tBPhR+UpZLHvfZdxFmfzwk9kXkrIGz5EpE+
 2oiwKt91VCq072oh81It9NCNiS29/zPNjc1NpETcDPIVsPPMagBmHUvM9
 o3lOLwhlR+1i4kA9gF2RJBEJw/ou4+z8vtfIP9xqdn4vz+jdwck2FnuUA
 mbgXJUDH/aVy8AzIfbKkT/P7tdNsP02SLAzGtfSDCwPCoTO1we6xvbEAg
 aQUnKiuX+/Oy++sT0MTZvlgPfm7nbpIbLhX8jztp+xhv7n+i7aw0M3/iJ g==;
X-CSE-ConnectionGUID: oEvrXWm8RRieV/Co+ToVrA==
X-CSE-MsgGUID: bWAUtIuCRWWfJxw5ND4mNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="81609127"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="81609127"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:50:29 -0800
X-CSE-ConnectionGUID: k0NtNye8TFipS87T+871PQ==
X-CSE-MsgGUID: 26GwwLtZTpm2E9eqPDUxAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206290218"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:50:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:50:26 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:50:26 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:50:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqb9jMTwCq5pvIkuZsIoHIqeW8DNpHQKZIkXUIbVVxFiJnpPvs9dIBYZ00/QOLxh8k1yV298WkbCHEADse0zfJuV9BJYPUqGq6yjMxxaCmlo6sNiftX3lvSIvIclDpKKSh3gwxzcGot2yM+auigQmirEF3zgOt6Sp0kKROBqIMFptF+yu8p+iPSMsXgXEajffetXnekWDK9bE5JvSfiOT5pBadeDNevwpEJYImP/UQGu1P7qMW0Ae/tc8wOwiLjjNYRP2ygXh3ERrGFOB1BUQlIt9AnGGeVJOhuobx/cx7mgwAW1pcqbdnk1HdRO7AIli9rcccRQFmcs7jC+t+TqYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/XEl+fHC5v/D8BAhWBmpIj8FZJbtDuqY+MJ7J0A1Sw=;
 b=JqTe2JVl2f381vlYtZ9VsmclGjpevckwoQuG5SuJwIgYcciourNr37GVn4nWWsH9yHjVyaLcEUossjcouEWeKpCsS/rvR0SsiR1fGiHbPSZJ1hbconY5SneWUL6epcH5BogQrnzl9PHMatjw01KapW7VviisYQFDyYV/ia7CkaMnpiqqp3fZV6XXFiJTCoF+1QM032DndH2epkLnvRX9XbrqrKFS9eeUz3dqtqsnnwnoaEKg3RZiNTfF6c/Js9qtVos1clylCJ6CqYYXqgtK6DCFmu+0m4bZHMZF2NxBB7R3TRlP1PxGaPVsXZJdSyoIizoTzNpz6gov7+i9K+E9Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS7PR11MB7805.namprd11.prod.outlook.com (2603:10b6:8:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 21:50:23 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 21:50:23 +0000
Message-ID: <a69c76a0-ecea-4458-a2c1-cd41c612e12d@intel.com>
Date: Tue, 20 Jan 2026 16:50:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Attempt to fixup reset, wedge, unload corner cases
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260120201621.2442803-1-zhanjun.dong@intel.com>
 <aW/nL/OGSpgzBpQp@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <aW/nL/OGSpgzBpQp@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0002.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::7) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DS7PR11MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc7e6f1-af8d-4b69-bc1c-08de586de9e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ZacjQ0RDA3N0E2RlZCZHBiVnViM2FxMng2UXd6NExTTjk0TnpKRUQzQ2JP?=
 =?utf-8?B?Smp1ZTZEMlAvZ0ZJS053bDFtYUZnaDhDc1IxaUsxWVViYS83ckZrZ3J2VGxU?=
 =?utf-8?B?SVAzUUhqUG9hRVVwellHVnBvQml5RiszYjkyOTExa0F4SVRPZ01DdHlxSFBi?=
 =?utf-8?B?UDBBZTRpVkx5U0NORFl4cHBPWTAxK0JndnFNeStjdGo4bEtMcEYyZTRWN2lp?=
 =?utf-8?B?NjF1RnNzb1l2OWFrSWZSL21kNzBzaGdQRmVhcEs0UldPRG5RbHM4RzlCVFRZ?=
 =?utf-8?B?MTNqcjFFNmhMMGFlM3cxeUJjWXBpTTdVWGg2czdLY29mNTBOcVJ1TXZIRGlY?=
 =?utf-8?B?RkpmT04wdXZtTll3YUYyUmlOdUtGUUF4STRnc2ZBVk1Ea042MmRrUjcyUjJN?=
 =?utf-8?B?ZUJ2SXlaMXJFSFhFZ2hxNWlvc0ZJV3Y4TTFEOVMyVDU0NC9CM084VHpsbE1J?=
 =?utf-8?B?a3htZlFGQW9MTTRJVGNHRnc0ektBaFZQem0vdlRuNUEwRnIyMUJ3M0lKN0Zn?=
 =?utf-8?B?MTFIRTJVdDhkZTNCTUVJZmZzWm84VUF6OVpLWkxwS20zYk1UNTdOR2tYWStZ?=
 =?utf-8?B?M3o2em5YSHBMLzNXcGEzdms4cGxyV0k5MHE3RFZlS0tCZ2RaNlVpdW1LMEZV?=
 =?utf-8?B?Wm5UVENIRGVWaUJGL1pYTmM0endzWklKdUFRNkZEKzgxdTRiUkI5OUZtZzJH?=
 =?utf-8?B?ZDZEWmNYektLaEJvaiszSHEreDlkT0hvM20wS2txK00vdG1adjZGU3dUVmlI?=
 =?utf-8?B?Q2lQMWZwM01oSW9oeGIvUnliL0NnVTM1YkdFNDR3R210WFh3eDFWSU1Rckla?=
 =?utf-8?B?Zm5oL0xOcWVnTVFwVTEzQ1JOQ1BjRUZVc3lDUDhFZmpsSVdnNmpSU3c1OVpl?=
 =?utf-8?B?aXQ5VE9WdmErYm44NWJFK1JXZ013TVVKTFduVnhlZzVoSFFQd3hOZGI3ZW9x?=
 =?utf-8?B?cjMvV05DaGo4WkJ5aHZqSlo5NmVlb1AzcktlOFpoRFdxRFMxcGNQRWI0cTc1?=
 =?utf-8?B?MVF2NnpUdUVnUis5ck8yM3J2Sit3TE9GbTY2NGJRdXlMaUl3QjJTTXRpbWNr?=
 =?utf-8?B?ZkpTOWxYckRLeFp3VWp0c2lHVW1teFZEemdlRHlRa0lMSHJtQXVGeW1FV3hG?=
 =?utf-8?B?VjZaK25iTHNxamJNZGdaYlR3QTB5Q0tFN0x2WndlbE5NckV1R2J4bE85enNh?=
 =?utf-8?B?QUdtbkJ0biswb1hzWWpuM2J1eEFaMXRWWFRjZWxHSnFIY2NjM1Q5SlJjMC9V?=
 =?utf-8?B?dHdkdGNUQ01EVDBrU2x2WVZrK2dXdVMyTjVSeXZvMHdwQkZ0LzRna0RDNk9w?=
 =?utf-8?B?bG5BMzNkZlBVVWY5UXhYZHB5cHZTZ0xkc1FjbGJjczhyVFNRSVo4ZFg5Z3I1?=
 =?utf-8?B?YXBITkp0akd6Yi9XYlg0S3NTTkZBKytTa2pVZk05YlZqODlhNjNZL3NRTk9q?=
 =?utf-8?B?M1dGQmZSVlBUU2d1Z1Y1N1ZzSXgwdVFRcm8ySG03c2FNRW1uenBPTDAxUjJL?=
 =?utf-8?B?ZWxNVjlEVFU0Njg0YXBlSmRtVGE5Vkc4Mm5ScFpPK3NOUFdjN1UvUEorU21H?=
 =?utf-8?B?NW1SSFR6VitLbE5lc2VYYXRZaHIyaHZPRjNSeUxrSVlBb09ISjVjYUhsVE4y?=
 =?utf-8?B?OGswOGpiUHpDRktXNFRBMU5OSll1ZTJHWC9Md3dKZUtEM0tpVjM4TTBSdVNT?=
 =?utf-8?B?dktLb1hsRlZpNSthYmlCSXBBRURiRmltVlY2S3pSaHpmM0w3OWV2Y0U4cXIv?=
 =?utf-8?B?WWFLcFhDN24zUzBrWEVISjVWTGMveGJld3BBeFVYQk5CaFowczlyZW5xd2Zk?=
 =?utf-8?B?RnpMMHNCQUZRK0gvRU5XWC9MSU8rb2syRUZOQUpVbmtUZWJpNTJ3a3RjSFBN?=
 =?utf-8?B?OUxpN1FsOWJxVGtObGNVMldhczNmTWxFWVVianhaRkxSMGduMTJhOFpTdXhY?=
 =?utf-8?B?Z1NYRnQ0TDBOTE1jSUxUWFFpdGpuREx0ZE5CcTNFbFdGOEF5UG0xeGVxcmdy?=
 =?utf-8?B?OURmV3UvVzZnZmZIU0h2aUJheU5yR3V3UmtTMW1mOFA2Z25vRURONTVWZHhY?=
 =?utf-8?Q?yUPBl6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VThLNkdOdHA0ekpsS0QvSTJtcDJjV1QvTE5KN0lESGFGaU1uVnIySVpQUU14?=
 =?utf-8?B?OHBUdWFRNFlpUjFsYzBuNzhiQitOOWR1NUNmWHNoem9KdWU2cS9mb25GMDJZ?=
 =?utf-8?B?aEdTMmd4QTk0Rzc2YW9QcDJpMWwxUmRLTVQzRXpSelJkVmxLZWdveTQ1QXNz?=
 =?utf-8?B?TlowKzdPcGthRzJoWW9aSHU5S3JEVC9NdWpCRWxhU2M5eXcvUDlzekcyMXRv?=
 =?utf-8?B?ZEdONGJBYmdUUG0za3ZTOTM3dlR2UEVSOTdDMU1yMnl1L0NZRlNhaUo1MWxK?=
 =?utf-8?B?VE91T0ZzelVlWHNLeDhwNWVNWUtBYjNMd3JhTVhINGFTQXFsdUo1bWVuMlhY?=
 =?utf-8?B?MHZYeTdid2dtcFFVd3VybnBoa3RvdjBDY0JVMk04WmZkeGZQYnhOb20zT21R?=
 =?utf-8?B?VmQxbUZoaHZlT0pFU0ZxcUVIekJ5dTlucER3NTlpQ0tiR05QeU9OcEx0SERT?=
 =?utf-8?B?Uzc1Y3diRTZHTnZ5Q1NpOWZYcXZiVlFYUm4vNEpuQjdBNmhzMG1LRVVjRi9Z?=
 =?utf-8?B?YlBTdTlINXZxUXRZSkgyK0wvU0ljdVQvNVdtOUlwenZINnlQZmNCVWJrM0ZM?=
 =?utf-8?B?RFJobVhLWFA0RnoyRVlsbUM0Z0VNN3lTdzJBalhTeWVHajJVbkRTREpRT3ps?=
 =?utf-8?B?RU10VnBuZkFFbkVJdHN4WnM3Q1NqZktYeWhxbW1lS3JlbkRGbHpBdHpjV1Vh?=
 =?utf-8?B?TTFDNXh3TGVkRUNJNjV0TXlRblBEVTJaWnBvRHpOdHUxSlVQSUtrQnNSZ2px?=
 =?utf-8?B?eTBnaThCa1hSZllidTliNXV3MDUxTitWWS9jMXVOWHRoMGVCeEQ2Rk5tUjdG?=
 =?utf-8?B?R3c0UmF3UVh4TXFWZlVUNEhQY3RaYWV6VUJBUldrVGV2NVZmZ3drQUs5UXdZ?=
 =?utf-8?B?U05aRC9MSUJXYmh5QmNqL0xQVll3ZWhoSUZWUy9RVEdFWUhFQU9QdTY4dDV3?=
 =?utf-8?B?aStzU0t1V3JjZjBVMldrWDVFZWZTS1FzNzlRSWE2RTVSMXorNHdPVWlFMXV3?=
 =?utf-8?B?YWpuajI0M0EwNVo1NkhnODA0OC9MYXUrS2FxVHFwd1VmSzFpK3djMXZkQjRt?=
 =?utf-8?B?dWQ3aUFGV0puV0RGZFRTZ3orYkJ2V2lxUlVmT014NkpkK1l0akpHK0x5NTFm?=
 =?utf-8?B?RndxcnFvLzF4NU9XSjZ6VWNyN3hpcCtVcWQ2N1FpTFozSEtHTXV3NGlYOGpZ?=
 =?utf-8?B?SWljbEJvTkhyMjIvMHVwb09hNXNTMzI4RjlhV3JuVkJoRjB5K2NkYUZnVTVw?=
 =?utf-8?B?UDFyYzNJeW8xQkxsZm5BTEtqNEFBanZPNDc5dzlpZERSak9SOHh0cHJyb2FX?=
 =?utf-8?B?dWZYQXpHWEpZeXhxQU9Oc1licHVqR24wb0hHUUFXaE1vZHBBRVhuRzJ2Uk41?=
 =?utf-8?B?OGwzWWdScmpDazIxeHNHaTRFanJSZ0dHanVVNmppN0NIQUtKaG01enhqWmdR?=
 =?utf-8?B?dnFhcTNhN2svRGVnSW5GUTlIR21velFGSXRuMkNZa0xSeGtOWU9IRHNoRW91?=
 =?utf-8?B?R0xOU3JwSmRmODFnNG0zSmxzd21QR21oS001Q1UxeXV1WDlxMFRXazBFNzIr?=
 =?utf-8?B?L002blJhMUFmVDhwbXBHRDJkRENwWXJxQi8xbitLR0M5ZkdpNjI4MTMwalR4?=
 =?utf-8?B?bTFsQTJwUmFiRzh0ai8wQzRNbWRLZkN5YjBHNGpjeFkrZ2pTc0FiQWgwWUFM?=
 =?utf-8?B?UnlkMnRJbFpnVnQxZUQ4Y04yVk00bVBmWnVoOExKc2RTWGxxc1g1TitFT0th?=
 =?utf-8?B?UWlJZnFKTWRnT3RvdDFmb2hFUGVmZVN6b0JDV0Q4azZKZXZ0QWxGTTRwWFBX?=
 =?utf-8?B?akhhR1JOZk5EQnY5dHpIRkZpQzdESU5iTE1DM1BHWmZmR3M4dU5IR1VzVGtG?=
 =?utf-8?B?aVdkQ2VMckNHeE5EMWhZMjc0ekthdTNpUHZZNEk5NUNQZE1HVTRrLzMxYXpV?=
 =?utf-8?B?U01kTU01Z0ZKK1BwVzdwSzEveVpCR0RydVJ4MVFhdTZHV0dERnJPN2tIcHhF?=
 =?utf-8?B?dXhycnVxNmc0UjVFeWpxZ0JZdUZuR3M1dEVSSWNKQkl3U3VQby8yK0NvMkNU?=
 =?utf-8?B?MktmOThDSjNzQ1ZTcFZqY2lBeDU3VjgxbStvU2prV2ZQNEsvS3hibFFPUnM0?=
 =?utf-8?B?dWtaMTN5dzh1enVGY3NnK0k1U1MwM2NTR2Y4S3lTeC9OeUtQSzREYVJkM1Iz?=
 =?utf-8?B?dnZoWlJ5U0JrQk5KS0d5MlUxbE4wOTVtTzdPVmhVekRSN1BVSUR5cGdwelRJ?=
 =?utf-8?B?WHpCZW5TdVl5V2dNQTBRVXB5TUlCVjNHNEVNTlZrQlFmbVZZWnJDa1VPRHdm?=
 =?utf-8?B?V1FoNjlZQ1BhTzIwZjU1R0dYeEI1RWVBenEwRXJycHY3MnBCalNwZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc7e6f1-af8d-4b69-bc1c-08de586de9e8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:50:23.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwZR2LRHvbUxEsUM7uSAOrOvObocBKeTT0sSRxj0KA4HC1PEL8fgOaXOR0GrqGG0m0rZmwgdUeNkgLQKSfKf0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7805
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



On 2026-01-20 3:35 p.m., Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 03:16:15PM -0500, Zhanjun Dong wrote:
>> We have several bug reports [1], [2], [3] describing failures in reset,
>> wedge, and unload corner cases where memory is not properly freed or
>> fences fail to signal. This patch attempts to address the issue by
>> forcefully killing any remaining queues on driver unload and wedging the
>> device if not in mode 2.
>>
>> Zhanjun Dong
>>
>> [1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
>> [2] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
>> [3] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6029
>>
> 
> Thanks for picking this back up. I assume this series fixes all the
> issues which you can recreate?
Yes, passed my test list.

Zhanjun Dong
> 
> Matt
> 
>> ---
>> History started from v2 (v1 not found):
>> v3:
>>   - Add patch 3-6 in series
>>   - For "Trigger queue cleanup if not in wedged mode 2":
>>       Add guc_ct_stop and reset prepare in patch of:
>>       Sync with baseline changes
>>
>> Matthew Brost (3):
>>    drm/xe: Always kill exec queues in xe_guc_submit_pause_abort
>>    drm/xe: Forcefully tear down exec queues in GuC submit fini
>>    drm/xe: Trigger queue cleanup if not in wedged mode 2
>>
>> Zhanjun Dong (3):
>>    drm/xe/guc: Ensure CT state transitions via STOP before DISABLED
>>    drm/xe/uc: Drop xe_guc_sanitize in favor of managed cleanup
>>    drm/xe/guc: Fix page fault by moving guc_submit_fini to devm
>>
>>   drivers/gpu/drm/xe/xe_guc_ct.c     |  1 +
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 68 +++++++++++++++++++-----------
>>   drivers/gpu/drm/xe/xe_uc.c         |  2 -
>>   3 files changed, 45 insertions(+), 26 deletions(-)
>>
>> -- 
>> 2.34.1
>>

