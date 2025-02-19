Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F76C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 22:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E74F10E07B;
	Wed, 19 Feb 2025 22:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIhO3wHI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EC410E07B
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Feb 2025 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740004178; x=1771540178;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=REV298FhvRJDqofjl3MqimGOF5sA0pnuPorxnE+gj2A=;
 b=QIhO3wHIK+x0k3YRgXQdga6qUHbbYaqF9/vSSjcELlmE7pW+bYAC4rAx
 w3dYosut/JkqMS9ejxL3SrIy3vN64Y3QrdFT5+HuiX+F3aswm39cbkga9
 z0s62c93EgSS6v77d1a+DwpgU+nsfKrHwetuVlcTH5jL6U8HQDt8Lbh9M
 pc+Fm1hDtVWaGXQnRtEtJ9A3CDDM8qAnoS3JtLI8zrXpAZAPAUiAa6kRf
 yCjENWPqGNzjaonHwG9jrp4smplyHC1F2ghdzWVVjXnNxV1X4HavwMSZX
 +Sqx+tQv8i/RcqPjO+SNZCvlXBURFQcB6YcYmM7i03hZun5Kl12TEVnxG g==;
X-CSE-ConnectionGUID: sSYNKAMVT1qFIy3KNqwiwA==
X-CSE-MsgGUID: TbmGxZVnQe2D4RU/R6m4Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="51382818"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="51382818"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 14:29:37 -0800
X-CSE-ConnectionGUID: 1EkmMrgJR5KCQ/nlfUa2eg==
X-CSE-MsgGUID: ZJEMr/jiR0KStdfQEAPSDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114701220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2025 13:34:09 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Feb 2025 13:33:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Feb 2025 13:33:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Feb 2025 13:33:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM1LK6HQrhlVK+ArbQQn/ekrx61AcMXeuVvXY+CR7xwrSYT2ttB4UW3hzTj3+wutUxyidzGMpCkPZtnfZxH7tRkv4zEweGszRy2AG8+bNj7LjQCJjurFbMw5+G91l2GmuIHAEfrl90epUutBH8h65BPlN7N7kTpKiyDcOuA5a7ILS3tAkav6mVUhJhDJqo6r+bfO9hXw+VF0ZDFvhl2cDHpmVNTCXVl8hIBFQyvpSWqxA/XrPH+i99xWloN7JKGlrLdJCfaHI0SiF5whwKsjtJ6CUNzsqK+lLesXz8TUOrHOo7EjY9oaNm4gX/8/f4M21IXTgdBQx0pGAXkusTp67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IDfVmK1C2Mk/9FKX0ZbbtKTQZgpHen3IvY09WWQyFto=;
 b=Ahpn237SkkOplvSYjOy1+rUaL+6kt2ajlA1Ysh0CW7M8qPCovu+raXZLLCgaNlUk3vVuAVmPiQnNcyCqgfaePCD0yqahB1mG60OHCHXQqMG6do8FQPdroNsAvvRV2sJ4g3wNWfL8KWYHOIM+GjiSx0Cx1A0Z8sEoyQbq/1vMDEB12q9BUb1npN39e/yXaO2ZetdYD0O/haA7r1NVqz3+vbqUbGJtvNxiBqoLUyu2rG1EhMrWJQ8H7xUi9gAFVo7EyAk18ZEt7GE2IMGlCu3ZLJaGzKEd8QIszV7s9pg7tLTZe9evJPFCx5Qjwt/DTChUiDA20UdTkqjyuO9+2BdRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6745.namprd11.prod.outlook.com (2603:10b6:510:1af::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 21:33:50 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 21:33:49 +0000
Message-ID: <bb23eb57-a28e-4c88-82a3-3659f37030a7@intel.com>
Date: Wed, 19 Feb 2025 13:33:47 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pxp: Don't kill queues while holding the spinlock
To: Matthew Brost <matthew.brost@intel.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>,
 <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
References: <20250213004032.2059861-1-daniele.ceraolospurio@intel.com>
 <Z61KX8koy/aFnvOy@lstrano-desk.jf.intel.com>
 <aff30f31-6f1c-4086-b059-d8c1246bfdb2@stanley.mountain>
 <1cf17877-18ae-4cd0-8be5-9a5abd46c58d@intel.com>
 <Z65T4j6Z81Hxl0so@lstrano-desk.jf.intel.com>
 <e7a999a1-f5be-4fa0-8557-2cf293da385a@intel.com>
 <Z7VNhu4kgfEqTjb5@lstrano-desk.jf.intel.com>
 <Z7VN+7p5eFfrZcmx@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <Z7VN+7p5eFfrZcmx@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0011.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::24) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7bf986-6164-41f8-b848-08dd512d1939
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0dCNWlNSG4vYXNRTzhaM0RHbXo4TnJhTlVWK283Tll4ejN1a05hNWxYZTli?=
 =?utf-8?B?ZUdZK2FmOW5CRVB2bTErNytHRmhyY0NQSFhzYk9xOUMzTkxKZHNYODRNS0tZ?=
 =?utf-8?B?QnFuZTZJYmJUbmFuUWEwR0RpcHFzbndZdGJvdDRJSW5CWnljd3Q1SzZuNFho?=
 =?utf-8?B?RGVzYk5WOXJrK3djMzl4QU96WjZZSmVOYWpDcFRKeWk1ZEIwRWVIeGptWU9w?=
 =?utf-8?B?UWZSL2hiWU45U2hjUHZrWDBsZ3E2OTdCMDFDQk1icmhtOTNjaldxNGkvRG10?=
 =?utf-8?B?TzVhd1VjQkJtR0RYR00vQXVyNlF5TlF4UkM4MmJGVnpPKy9jcW4rZHZrMEcw?=
 =?utf-8?B?eFBMZnNIMG1WeW5lYXBuOVNjektKUjNmUEpXMkE5eXVmMzM2R3ZqMjhOYk5S?=
 =?utf-8?B?b3FkYVdaMm1SaDUvd2VKbXhmMjd1dytNclZET0pqc3pqcCtySE43MHZuQ3VR?=
 =?utf-8?B?czBGSHgrRFZNMkVqNCt4ODN2YTJsK0xTcThrT2MxZlF5cHIzMUE5RmlsRnUz?=
 =?utf-8?B?V3RvVU9tVkwzMUpNUWl6eVhJTzh1Zk4zekhpRlowWDB5cGRyL2NlM0w3dmdW?=
 =?utf-8?B?YlF5eStJLys3YnhIbER6b2dhQmJnb3A5ODlZUDJDdVBsVjBRQzk0cEYwbE9l?=
 =?utf-8?B?SlF1cDhQOG9vaGIzQmxjZ2FGY0E1L3MrTzBrVzdseGRUZDFKZmtUVWhpVGsr?=
 =?utf-8?B?MGVDNHljVkNJcTJSSHl4dFVRVi9aWU0xOXBNenI3WHhuTGhqOCs2OVdjT3dv?=
 =?utf-8?B?LzZWbGhEY2ZQY1ArQXVDbVlsalFVSmhRaVVIMWY0cUI4enUrVmF4UnlUQ0JB?=
 =?utf-8?B?NjljczZhT29SdmRQaHZ5eTI3L3YrMXhVeVVGbkNwZDlHSWdOQkNNK1ZFSkZH?=
 =?utf-8?B?NWtKYWlSWGFjaXpQWS9hNDRRMXM1Q1FhUE9DME5HM2hUa2k2V1pOdUJidkVz?=
 =?utf-8?B?eWpCdDVYSEFOdWtKT0Ntd0RHZEhvYjNiVHlncVNFcTFSazNqUkxzZzdDSU9u?=
 =?utf-8?B?K3J1dzQrSWxuYWMwUHhhTlpTRlhGa0ZOYWdGNDlXMytmMHQwK1krVEN5S1h2?=
 =?utf-8?B?TjdXN3EyQUlteW5mSGxsUC9Ub2hPUVpxOE4veUs3REs3UHc0bE5ObHhTV2lx?=
 =?utf-8?B?ZjZrNUM5L0F2YmYvVFJEakU3QkQyT0IvUGVSTThmSmJwTjJOUk1LSm9YRURi?=
 =?utf-8?B?Z2FRMFFueGNEdDhNdElDVnhTSENsTjA0ZW5Pd0d1NVNJSVo3MG80dEl2TFg1?=
 =?utf-8?B?dTZGT2FpUjh3MjdvZWRPbDFjWGtwYTdvSlA4R3IwdGk2YnRHL1c2Uldaand4?=
 =?utf-8?B?Ymh1clBtNzQyWVdDZkF2UUNEOFBGV0krYTRHaHQyVmZrWEM1cnVPZW1qOGFI?=
 =?utf-8?B?ZzltNW0va25NY0x3Y1M0RU5oK3A4anpPbmkzdmkzdTJFTHVKY2pBQThmOUNh?=
 =?utf-8?B?d0xjbjY3UGdXSDlvTWtaQ0xEbFBOV3BMWktvRldwdHJ2TEtTRlp0NVpObWZC?=
 =?utf-8?B?N3E3ZXR3RXUvdFJyaU9TZGhHdVg4V3hzV2lZMHV3dlpKRWVTVkNCbTB6dE84?=
 =?utf-8?B?NGhFT1RtSW9oRVBlUENPTEZwWURYRktpeU1yb2JLQm9Ba0RzckgyK1IyeWR1?=
 =?utf-8?B?alJNcWVWN1BPN3Nlb0UwWGZBUUJCY2dqNjZtWHZ5K1BqLyt3N2NYMktEeVU5?=
 =?utf-8?B?aTI0YXluUlVmYitOY1VpcEMrWkZnL1EydDg2S2M1eEZyQXNqVGdGeWVpaTZN?=
 =?utf-8?B?cmJjeWM0RVk4akxBc21vWWo2V0FGS0hUV3d5bjZ3cEthb2paazdnTll1SFdv?=
 =?utf-8?B?c01qZlhkUU1sQ29WaU5VZ0hqSmJwUFp1a2MvVFdnd3NhazB3M2ZLNUU3WTJo?=
 =?utf-8?Q?bNvkye/+ojrpP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmlSNHpRRGYzNkNKR01HN2FVS3BzYWZLNDlpLytBRS9GRHlaVHdyZlRmd0pY?=
 =?utf-8?B?bEdqcjBmTnhiMTFEMXc3bVg0Q2Z6UG9PQjF2SmdSckNBN3VFOFFlbkE2SXpx?=
 =?utf-8?B?N3QvNGV6MDRBaG9ZaUtJRy9JdGptMXJCaTlpakFuTFBPTHFobHBkV0ZPSElV?=
 =?utf-8?B?SXBnY1RrcXJ6UkprcDVldlRZZVFTdFAyenY2N0N4ZFMzNDVocCtpM3E2Qi9S?=
 =?utf-8?B?cWpVRHBUM0U0VmEwWWZLMS9SbG03ejZFbVRrMlFTeldYMjJZSUJSQU1UOGI3?=
 =?utf-8?B?b1FjSGZMYUN1L0xsK0QvWW1ldHRiOUJ2c3ZOWmFKeDlFVTZuVzEvS1pUUDI4?=
 =?utf-8?B?WHdaa1c0N1NWMW8vK09GVkpka0FsTGJnNm5KWC85L2VYZGhvai9QTzNFaGdx?=
 =?utf-8?B?VGJIcFNUL0lCUSt2UUthUWU0ZkxCN1hLcFBFaEZ1YURVSGhIMGQxOHVXdDhW?=
 =?utf-8?B?NE54eDdpNk1lakR2OU1NNXRhOENyZmM1STJkcG5iUk1QbTFDNEhaWkdybUpk?=
 =?utf-8?B?UnY1c2N0MWszY3psTWhZdm03cVd2SGxqK29CNUpYZ0xTWVFxUDU1YnJ0VEZa?=
 =?utf-8?B?Z1V6UDNtOVhFMGZGMERFYldsb3UyVmY3V3ljc1Jad29rWXNNZlFNZkkweks2?=
 =?utf-8?B?bWJSNUdQaStsVmpUcGdISFl1dVVkSm0yTzdOVFRWT015MWlTY1RjMGV4K3Bu?=
 =?utf-8?B?UDl2eDRKUHNSczVuemFOcjBkUDdZNXFvOEVocTRnSCsycFFqVkVhcUxadkdU?=
 =?utf-8?B?a3Zsb09xS2hicm9weEczUGdYZHM4dGJvaGJEWXhzbVI1UVdjRU02UEY0TWxF?=
 =?utf-8?B?NUNQQlBFb3laVVRmMkN3WkZMQVlTTnlHQm82R0lnT3pVOGNVeXl3cVRwN2VO?=
 =?utf-8?B?RkFhNlpyLzk1M1VCUmFBRjg5bkRTTHpERkhVVmxIVDFRemc0Qm1kclh6QUF2?=
 =?utf-8?B?NWZvVEMvc2xzalV6bWJJTEdHYlVSSExGSThGdm5UYzlnSUNoRzJBZ1FIb1dY?=
 =?utf-8?B?S0dPQVBkNzNFcldxTjFjczhZSXBzM3FzT2h6aFJNaFRXVDdRQ3ZjVFd4d3BJ?=
 =?utf-8?B?cC9FemRvWld5VlFWM3A1SWFTVEp2OUpJMnZvMFlkZWo5cU1DTW9xZG92bUQz?=
 =?utf-8?B?MmR6V2JrWExKTXFHUDRNNUtNaDlPUHkyd2pSRFRPWlB1TlNDYWhZN09DL3FP?=
 =?utf-8?B?QisyZFVzTXJYUHpHa1kxK29sT092VFdmZGZFWVNobnJBVVI1eHh6cE41ZkdW?=
 =?utf-8?B?RkpLRGI2NmQySmNid2pkUUUzV2x6UEtxZm1BSXRJUmQrNGhIWGxHYlRSZ05m?=
 =?utf-8?B?c25ib3NzcDlHQmJkN1pWaHhQVHN1RHBJRHprWmYzZGhDbFNaSFRkWEVpVUNS?=
 =?utf-8?B?eVZZUmoyajQ0aVlJNTFWa1phNEtXMVhhTmFzalZSaXRacmg1NjFHakZGdWtj?=
 =?utf-8?B?RU9iazAzaXRVdWdMeHJOTE5zYm9Eck4yaDdzdXZpMzdmTWNlZnQ3eU1tdzFw?=
 =?utf-8?B?eTFmSFNMdDBxZ1oxdU55NFRYRUE1eUM0TkxOeHZEcU5tYVRiYmUwTEZxUjNV?=
 =?utf-8?B?aityQVd4OWZLbTJRZkFUWDFTRnZNVkgzUURhK1dza25jMDV3aUhLd1V1K2Ja?=
 =?utf-8?B?Ni84TUVocGxsZHlNOTl6N0txQkRIOGFDNTFlb2JSdXJDWjlwLzhGOEVKVmht?=
 =?utf-8?B?Ui90N2I0MHVXR1NwYzBPem5mSU4wV0xCdE9nZUxBZFJxTXpWNnRyN2I1MndB?=
 =?utf-8?B?QTM5UlBRMkdXRWpnMjMrUjVHOStQMjJqTjVoOEFKRHBLdFpKdkc3YzRkb1Vy?=
 =?utf-8?B?M0ZZblJVczIrbGQzZTIwMjl6VmZpNC9LOWFLd3Bzby9zZUUrS1VidkRTbVZE?=
 =?utf-8?B?OFY3aE5UVGZWNkFGSGVmanRmYzB3cGY2Q1IzVlZ5Tk54YVVPNXRKd0JGZ1ly?=
 =?utf-8?B?aGM3V1IrRjUxb2J5NmliVEJnR0Z2ZzhyVXM2UGNaUVNTL1gvcXRlZnU5VmRk?=
 =?utf-8?B?OFZXUGRVVWpVWFNIUkxYY2VXdzlDTEtUdFU0UDlwV01Gd3pFanZieDc4WTRY?=
 =?utf-8?B?Z1JkYzhpN1RjV2dwRzRXOXFEcTgvdWE0VlEvcmNVQXVPTldGWUtDRmRHcE1w?=
 =?utf-8?B?ZTdEUlFSd1hJUEJIRTdyUFlsYWZJdTRiQ0dPQ2VnU3hmWXZKYWhNdk44NFJC?=
 =?utf-8?Q?0PdlLgMONCPj8BHL5x0ti8A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7bf986-6164-41f8-b848-08dd512d1939
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 21:33:49.8073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EiVvHf462bW26SZP3obhyh2dHHcxruPfFgB0UHzO6vH5j/UNEnaWAaH+ZD856X1iBc+an91km+LxELyaHSwKKlc8gEA2UA10HppBX4FEk9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6745
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



On 2/18/2025 7:20 PM, Matthew Brost wrote:
> On Tue, Feb 18, 2025 at 07:18:30PM -0800, Matthew Brost wrote:
>> On Tue, Feb 18, 2025 at 04:38:34PM -0800, Daniele Ceraolo Spurio wrote:
>>>
>>> On 2/13/2025 12:19 PM, Matthew Brost wrote:
>>>> On Thu, Feb 13, 2025 at 09:23:26AM -0800, Daniele Ceraolo Spurio wrote:
>>>>> On 2/12/2025 10:42 PM, Dan Carpenter wrote:
>>>>>> On Wed, Feb 12, 2025 at 05:26:55PM -0800, Matthew Brost wrote:
>>>>>>> On Wed, Feb 12, 2025 at 04:40:32PM -0800, Daniele Ceraolo Spurio wrote:
>>>>>>>> xe_exec_queue_kill can sleep, so we can't call it from under the lock.
>>>>>>>> We can instead move the queues to a separate list and then kill them all
>>>>>>>> after we release the lock.
>>>>>>>>
>>>>>>>> Since being in the list is used to track whether RPM cleanup is needed,
>>>>>>>> we can no longer defer that to queue_destroy, so we perform it
>>>>>>>> immediately instead.
>>>>>>>>
>>>>>>>> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>>>>>>> Fixes: f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session start")
>>>>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>> Patch LGTM but can this actually happen though? i.e. Can or do we enable
>>>>>>> PXP on LR queues?
>>>>>>>
>>>>>> This isn't really an answer to your question, but when I reported this
>>>>>> bug I didn't notice the if (xe_vm_in_preempt_fence_mode()) check in
>>>>>> xe_vm_remove_compute_exec_queue().  So it's possible that this was a
>>>>>> false positive?
>>>>> We currently don't have a use-case where we need a vm in preempt_fence_mode
>>>>> for a queue that uses PXP, but I didn't block the combination because there
>>>>> is a chance we might want to use it in the future (compute PXP is supported
>>>>> by the HW, even if we don't currently support it in Xe), so a user can still
>>>>> set things up that way.
>>>>>
>>>>>>> Also as a follow should be add a might_sleep() to xe_exec_queue_kill to
>>>>>>> catch this type of bug immediately?
>>>>>> There is a might_sleep() in down_write().  If this is a real bug that
>>>>>> would have caught it.  The problem is that people don't generally test
>>>>>> with CONFIG_DEBUG_ATOMIC_SLEEP so the might_sleep() calls are turned off.
>>>>> We do have CONFIG_DEBUG_ATOMIC_SLEEP enabled in CI (and I have it locally
>>>>> since I use the CI config), but since PXP + preempt_fence_mode is not an
>>>>> expected use-case we don't have any tests that cover that combination, so we
>>>>> return early from that xe_vm_remove_compute_exec_queue() and don't hit the
>>>>> down_write/might_sleep. I'll see if I can add a test to cover it, as there
>>>>> might be other issues I've missed.
>>>>> Also, I don't think it'd be right to add a might_sleep at the top of the
>>>>> exec_queue_kill() function either, because if a caller is sure that
>>>>> xe_vm_in_preempt_fence_mode() is false they should be allowed to
>>>>> call exec_queue_kill() from atomic context.
>>>> I see what you are saying here but allowing something 'like we know we
>>>> not preempt queue so it is safe to kill in an atomic conetxt' seems
>>>> risky and a very odd thing to support. IMO we just make it clear that
>>>> this function can't be called in an atomic context.
>>>>
>>>> We likely have some upcoming TLB invalidation changes too which I think
>>>> will move all queues to a per VM list with the list being protected by a
>>>> sleeping lock. Removal from this list should likely be done in kill too.
>>>> This is speculation however.
>>>>
>>>> I agree some test cases for preempt queues and PXP would be a good idea
>>>> if this isn't explictly disallowed at the IOCTL level.
>>> I have a test written locally and I've managed to repro the atomic sleep
>>> issue. Unfortunately, I have found a second issue with a locking inversion:
>>> we take pxp->mutex under the vm lock when we create an exec_queue that uses
>>> PXP, while here we do the opposite with the kill() taking the vm lock under
>>> pxp mutex. Not sure yet which of the 2 sides is easier to fix and therefore
>>> if this patch needs an update, so I'll hold the merge for now until I have a
>>> clearer idea.
>>>
>> I'd suggest q->pxp.link to pxp->kill.list + a worker to do the kill
>> then. The kill is already async so likely not a big to deal make it
>> more async.
>>
> Or if we want to make this generic... Add xe_exec_queue_kill_async with
> the same idea as above but in non-PXP specific way.

I've considered that, but I think I can more easily just move the kill() 
out of the pxp->mutex and remove the problem that way. I'm testing that 
solution now, will post it later if I don't hit any errors.

Daniele

>
> Matt
>
>> Matt
>>
>>> Daniele
>>>
>>>> Matt
>>>>
>>>>> Thanks,
>>>>> Daniele
>>>>>
>>>>>> regards,
>>>>>> dan carpenter
>>>>>>

