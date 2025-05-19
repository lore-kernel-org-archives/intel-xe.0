Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94357C2D0CD
	for <intel-xe@archiver.kernel.org>; Mon, 19 May 2025 23:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EFC10E02A;
	Mon, 19 May 2025 23:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLLEaKKS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8108610E02A
 for <intel-xe@lists.freedesktop.org>; Mon, 19 May 2025 23:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747698327; x=1779234327;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PDo+bgrr2X56je+vhU/MxpZD+KOCVsaA0wwUxpkto3Q=;
 b=NLLEaKKSQth7z8xzKaE8TSofgS9DG4E/9O40zh/W5hyAn5BG4EntIEdw
 3HnD0y9asz52SAlXmyEmm6b0KfUzf/Ik1QI8X8cguVCxr6sv+aBgReVrM
 VpVtm+pK/Y77AcykQQR8cplDMbaPunx2BYws/oCTwlRq81W/ffpC6DSny
 1MYtK+Na/1L+GkRYz3wiBR3sB80COSBfAuTHYbKZBsJnJWWzTE+2uvZRh
 Gj2gu4LJFLyedRxP7orolWSeZmhAMgH6hnZrXZtNf8DMA17hWhbwQh6n7
 qZkEP4suRtP+ktWIUCgb3M24Sc+YZ+SJjJYNSigZj2hStjqNsCignxFkn g==;
X-CSE-ConnectionGUID: AQ/4LnQaQoSzFBK9OxnYkw==
X-CSE-MsgGUID: qZgRV7HCRsaxI8Zhb3yd3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49679707"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49679707"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:45:26 -0700
X-CSE-ConnectionGUID: 42WzS18nSKie/MXHdoQBzw==
X-CSE-MsgGUID: 0tIIp0DNRnmleqAieNyq0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="143516938"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 16:45:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 16:45:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 16:45:25 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 16:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6vXgO0Xhdin1xfnHu3f6SxD98OgRSLOSMgHzPeaq6DkBYb5zouS4z9WFTVWPBwyFPQqe+EjS1njDb972KjpQNSsniF+lCefqSugZTh4KcLiPDga8D0uIA3985mjsvXHwzoQOPRyQUa/sIO9fvHhinJW8qgNkKdrHZQXanAt4GnM55fdvv8cFSSL8HkjgVv0S4xt2t4tqWyfjIULkpd+Zau7LIeIplNtncSlp6VONRoAJ7vTMLYVqQl0WpUKNtkATthgeT6V18CAFa9VpU18GPrrW3MFsJe3areB+P1AiaeY9fw5Tyxvqke+O76U7EziQJEm46M0aEAYJRRd9iHTRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaVnUDNhOj/YfunJ5Re+4wX94x4PrjbZXK5K3ORJcE0=;
 b=ZUWJQaIRmVbzh4YvA7IQiYKVaedTnn+UpCugbQQqIppgPpq0AIeOWfi1wPmITtGQ9kc87O+GJ+wkdghnkYUdHJ/HKSwcGtsoqiBrZ9MAMdHkCQ8ew18T3qsKYunMaBXPSn2qYo34eg3WD+kVyDOUcHnRp4ffKwPnefzW0CoI3OQEmeY9tr3uHa1Pd/4m9NTczLcgxGYv8AZqN4gDRE5yPRXo4cNIyRcYoWgmg/+K7nNM0dkau/qIb9FdxeaPnhGdHBmZV8PJSCDE897n9w3gNd6mEMGhCQXp3WLRhECQ7IjyLvKrG3Cxlc6gW0KMd0MqfvUyj2i88lFigWKQdD81Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB6688.namprd11.prod.outlook.com (2603:10b6:806:25b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 19 May
 2025 23:44:41 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 23:44:40 +0000
Message-ID: <eefda6f4-e81c-43a6-bebc-7d4fe0c3132a@intel.com>
Date: Mon, 19 May 2025 16:44:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Allow to trigger GT resets using debugfs writes
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250519200914.216-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 233c4841-5476-4b64-bbcb-08dd972f1fa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlZlSnJUZUJCbUdCRWF6VklnTytBcEJPTDRTdDRUditPcVdOZjEvUlZOZmdZ?=
 =?utf-8?B?b3QzTURrZ09HSVJRSWZndXZldGlKRUYvYzVEbUpobWtNRnhhb2szelJUeEhO?=
 =?utf-8?B?ckpELy9oRmFXQnozYmZHYnA1VkUvNjJrUm9GSWdrNkpIdWZyd0FZR3NBMExk?=
 =?utf-8?B?WmlHaERhN28wMWZyU1h5b2Q2Y1RTUUU4Q3BBbS9lMkgwM3ZVSDZQenpVMmI4?=
 =?utf-8?B?eXlWOXdOQjUzVVo1ZFhUZ3g2QjJBTmZ4TkxXd3lEcVpCTW1DbUNEQW1Ia2RO?=
 =?utf-8?B?bVRLM3RjRFVwclZscGhUanB5UjRXblc2dExzOWs1QjloNVZtRDZxSVJlZHdq?=
 =?utf-8?B?SmhnelhwWjh2RGdvTGZtQUhtVUNhQkxGc3l0RHk3YjJ0UkJBdGZNME4zeGhu?=
 =?utf-8?B?ZHJDSmltYldZbmw0YnR3S3BsdmhUYWs1VUJEbmQrODFtTTZzS0FueGFSdnZV?=
 =?utf-8?B?U3pkTklwamFqdUdML0c3ZFVnU291L0FqYldNNWdCdVU0cHNmc2pSWTRKZElt?=
 =?utf-8?B?TnNXaWlJaUFUQWpjdlJqR0xkR3RxYXIvUStTV2trZUxHQjRLV0ljZzFYaE12?=
 =?utf-8?B?dUtDTUNkeFc2ZUlhbUI4Z0dlNG9oNFlYR1E0L1BSeVMrODZUeFkvbXpiejNR?=
 =?utf-8?B?NVl4bWp5d01CeFRzYTdtU3kySktndHNya24vSWQxY0FPMTVLTjR6M2NGUE1s?=
 =?utf-8?B?eWxUQm4vNmUzeVhVQlRtaUg5cGVFRFJmTXFCVFJmRCtxZjc2SUoxV1dFdG1y?=
 =?utf-8?B?U2JFYjFtWWhmV3RRVkN1U2dCSTVCanhNNWg0dGhHWktLN2RWWFpEM2NiZ3NJ?=
 =?utf-8?B?MGpjMEFQejRuNFhVMTZWOG9YSU1JSEo3NFFLem1uRU1NeHo2eTYzUEJlVzJF?=
 =?utf-8?B?L2dqRUV5SDRmbE1pdzl4b3k1eTRsdlBNRjdYOG1IRStMelEybWpKVjkyclhD?=
 =?utf-8?B?WjJZN1dEZkg0V1ZndVhPK0c3UDN2SDErcmNZU0VEemtqNWVLMFRmaUxkYWhp?=
 =?utf-8?B?VHc2VHRGSDlGenlDKzRWRXFMWkYvRDFOMUQxK0toOGZJdFkxODVQcnNDbm5z?=
 =?utf-8?B?LzZaNXhCdHhmNlo3b3hyVExJQTBMR0NVazN3YlM1ME5WTklXZzlMdkgzT0tR?=
 =?utf-8?B?VThveW9YY1VaMS8vc3d3Y2d0elBDQmVqVmlJMGZhUUNldWRRcWo3Sjg1Y2lZ?=
 =?utf-8?B?UEJKQ3pwVUJ3NDA0RGNkVGZTaE5yeW9uMzVKQmxvcjdnMG9STWxGaHJzbDlY?=
 =?utf-8?B?bkFscFp0WUJQQXl6L3lSaFhaNUY1Z0VlWkFacDlmSHlzKzQwNzZvWWlYYVdW?=
 =?utf-8?B?SHFQdE9LQkdJSTlVeVNscStSR2RtWFQ3NE1BWHVnSEdTWElyS245cXpDYlFC?=
 =?utf-8?B?M0JtcENkMURBUTkrUHZQQ1lBVjgwNkVFZlF5Y2hBOVVIclcrd1JyRnJiRkZM?=
 =?utf-8?B?b3MvT2VlVFA5UjJYWnk1NFMraUdJdFJyOFVzSWlGNTBYVFZxRGVYaE8vUnBC?=
 =?utf-8?B?WS9qRFRKRFM4TUdCUVF3ZGxKMnBLV2ZYN2h5dXo3TnpKTStxTXpWdnVHWE93?=
 =?utf-8?B?ZGxQRGN4ZVNySUpkOTJCNzA2NVVpTXZBN2hkTTJtL29sRlY2QWRRQytMazVZ?=
 =?utf-8?B?cUJuYkVXWnBqV2hHSHB2REUybUpHWkY0TWdtSWRQYSt4U0NEN2E4cU9GOVhS?=
 =?utf-8?B?amo5M0x6dDdpRGdXc2dYQVhOOHM1dzVnVWowb2lEbEUvcWtjbEkwbWNBK0NB?=
 =?utf-8?B?OVd5Q3VwekZvVUlVNGNBRkxGdDdBWE1YSU8vMlpRcXcyNHdtZGFPY29ZdDU2?=
 =?utf-8?B?VVNEQ1hiamczS2ZkUm5tTGJWWGRTZVNsS1R1WTlTMlNsQ0VFbXJLU2lieEsx?=
 =?utf-8?B?VENVTFhTSnFpaDFCZWVuMGlYL29VUldpWkpmZEV5MXlicStHbW9vUldiWktr?=
 =?utf-8?Q?2apqtHGxcm4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a09kamp1dHQxc2FpR2VjQitETjNTWjA2bmJ6QnFnWkdJNzlhNUlsbzFxdFd6?=
 =?utf-8?B?WjNUOHZWVUtuSzhxREFMbWk1RnhDRGNpZkoyZW5ZZUlaVElvTkVtZi9lWith?=
 =?utf-8?B?cEM1bE1KYVRzVmllQy9sNkpFU0JkWXBvQ3paZHBxQjhXVDNldFV6S0NBbXNo?=
 =?utf-8?B?RnJ5N0lJYS9VMHkyc2JoVm1oT3Jmek5ZeDRpVVJPNm82QUlXWm8rRnoyMzJt?=
 =?utf-8?B?QjcxZjdMVHd4TEZkak0zLy9KQkdFSEdSaGhWK0ErZEExSXZNaDdCY2Y0eXNt?=
 =?utf-8?B?MVA1MEZYRVoyNzNmRlBaSW5OMXBlSTY4WjFqaU9DUWttV1B2alR3b0lxRFVL?=
 =?utf-8?B?NjBIQ3ErSzRLSXJTYk4reFU0SkF0LzF0c3BNaTRmeGFoeS9FNFpJU3FQZG5x?=
 =?utf-8?B?ODYydHM1NHArNTRhYnZ4bG1leDhhcWFXYWoreGlqSU1FRHZmWEd2UmxQNUdD?=
 =?utf-8?B?NXJwNU1rUnVNWGN2NDVnQ3BvWERvazhBTWljQjRRTFlwUzUxRlJYK3B6UElp?=
 =?utf-8?B?YXVWcUp0RjVmUlJnR1M3Q2ZYRFpXTTBUNm5QYWFnRXlkZlNzTE55WDhncVFo?=
 =?utf-8?B?ZHVrY0xJYXF5RkJ2eDVhaWw4U0hPYW9TcnRpZlpISzFYQ2FKbUhoT1haNEZY?=
 =?utf-8?B?c1VHeUJnUXY0N2pJMlA3ejhjUEJmWUZsdFpJSEkrVFNqY1JicDdjc1FhMEV0?=
 =?utf-8?B?RGVOWTNnbGFSZUI2RFBkdWMxZncxYkxZeXRVVGRCQ3RhU0djVWNTZU9aUHhY?=
 =?utf-8?B?UFdBTU5CSmVZYkt2aEZYZVhvVFgzOHVJdHkxOHRKUFRrSnFkMCtmQTI3cTlH?=
 =?utf-8?B?QnJGdE1Pa1hFSWg0US9lVjd4TFJWQzhSOCsxN1hYOHRnM2tiRWpaM21qZm9Y?=
 =?utf-8?B?V05wNlhVbUtLMEQybW1SUGRybnc0RU5DRzY1TWZQZzEwUXkrcFMrS0JsT0R4?=
 =?utf-8?B?Z3gvdjlDMXYrZExTR1NtanAyVVhRSjZ4V0FhRm5PZndISkZEWmIvK0lkWThi?=
 =?utf-8?B?bDZXaXV0bXFMOC8rYzgzbXR0UmFhcFhvRHJLV0R1ZlFrcU1rNHBjY1NiQjJL?=
 =?utf-8?B?ZW5rVXNWYnBxVWpwUURLZTBQbTgxbndiN1Y4aWl6L0pGL0p4dEdQemlxMmJq?=
 =?utf-8?B?UUx2Ym11MFd0Sk42T2tCQ1NCNHhMTWszZXQ5Ylg0MEczRERVZHFwVzhJMm1X?=
 =?utf-8?B?N0g5S01xc0ZKVGc2K3NKc2NYWmF2cmVhZ29mQXZFUElaYWpxb3Z1dWRaTVNP?=
 =?utf-8?B?NDdvQWdReWVoMm1vMkN4VjFJSnVEd3cxQlpjRXluM3NPWU1WRUFWT3hDaG02?=
 =?utf-8?B?ZTJHU2RVR0prcWJodkhTUFNGMHBQOGgvTUhqQmZrZDZ4dWdGdGpNWjZURTIy?=
 =?utf-8?B?RHpCL1pFVjhJQ0hPc1BUS2VtWkZlNDlkdTZJcnpMcHA4S2wwbnQ1R2lYNTVQ?=
 =?utf-8?B?LzBiMi9yemdpWitObjFLKzZNQkErZXdFQXRIMTNwRVNJOGNPVjdhcGFIckdP?=
 =?utf-8?B?S1hXVEEyYnZUdEh4QXBhQ0YvaFVIZFNpdHl6Q3Q5ZGprVExSN1o4WmM4bXM5?=
 =?utf-8?B?aHgzTy82cGE4QmpJaUJvWkRDdkRNRmtOcStFYmY1ZU05dkErd1lJZ1ZhTlNq?=
 =?utf-8?B?L1F5V2JaYWQyNVRxZlduWm1PbUhwL2N2ZGhweVMxVUtucjEvc2MxdzRFczVo?=
 =?utf-8?B?bFBUQk5aa0d6TW13dEw5aUpVWUpXRVFpWWlFK0M1ZDMrMURnR1lJYWNhSFNw?=
 =?utf-8?B?MVR0VGhnNjFoSlhRRjRSeVdLUS9BYUFNaTFWU045ZFYwUmxUMzVxK0pHZ2dk?=
 =?utf-8?B?cDZqVkphK2phYTRIV1NDblZsWkdxTFF6TC9KcEE4eVRzQ0lTR1RobzdnWktw?=
 =?utf-8?B?aUtLZE8xZWVpcXNDRlRPbHdCN0pXWElJVjNTZUF2Tmsrdm9mR2dzM3JoaWpK?=
 =?utf-8?B?Vyt6d0NhWEwyS3ZkZnBta0o5UGZEZEN4THBoc0Vzak1KVnVlTFhmQW5udUxs?=
 =?utf-8?B?YUc3Q1p0eDBrTnE0MFNRa09mVXpqeUR4ZFQ1R0g0Q0VRTzNaa0RGb2VwTXBu?=
 =?utf-8?B?WVR1aGVxY0VYQitzMUt0WS9kYzRRYjhuKzZLTk92TCttb2JYMXk2dEJ0dWh3?=
 =?utf-8?B?eUdhSmROUnU4WkV2Zzh0akVyYllCTHRSNks2SWkyUEUyNUdtYmU3NVhDUzBJ?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 233c4841-5476-4b64-bbcb-08dd972f1fa6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 23:44:40.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AMgDmj86hoVpDsEefVM8PA3TYvmlLgKiUUe5ll3pjyXuHQBamyk5B6q/ITMaQQy9jQxX+WTXtY7QcTuzHGEqW6sEP1MP820sX3jgXoVCRZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6688
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

On 5/19/2025 1:09 PM, Michal Wajdeczko wrote:
> Today we allow to trigger GT resest by reading dedicated debugfs
> files "force_reset" and "force_reset_sync" that we are exposing
> using drm_info_list[] and drm_debugfs_create_files().
>
> To avoid triggering potentially disruptive actions during otherwise
> "safe" read operations, expose those two attributes using debugfs
> function where we can specify file permissions and provide custom
> "write" handler to trigger the GT resets also from there.
Would you like to extend this to the GuC log dump-via-dmesg trigger 
entry as well? Dumping that during the IGT read debugfs test also causes 
issues due to the huge amount of output it produces.

>
> This step would allow us to drop triggering GT resets during read
> operations, which we leave just to give users more time to switch.
I'm not following this sentence. Give users more time to switch what?

Also, would it be more accurate to call the patch set something like 
'require a write to trigger GT resets via debugfs'. Saying 'allow' 
implies you are just extending the existing interface rather than 
removing the trigger-via-read ability.

John.

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 96 +++++++++++++++++++++++-------
>   1 file changed, 76 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 119a55bb7580..848618acdca8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -122,24 +122,6 @@ static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>   	return ret;
>   }
>   
> -static int force_reset(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_reset_async(gt);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
> -static int force_reset_sync(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	xe_pm_runtime_get(gt_to_xe(gt));
> -	xe_gt_reset(gt);
> -	xe_pm_runtime_put(gt_to_xe(gt));
> -
> -	return 0;
> -}
> -
>   static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>   {
>   	struct xe_tile *tile = gt_to_tile(gt);
> @@ -306,8 +288,6 @@ static int hwconfig(struct xe_gt *gt, struct drm_printer *p)
>    * - without access to the PF specific data
>    */
>   static const struct drm_info_list vf_safe_debugfs_list[] = {
> -	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
> -	{"force_reset_sync", .show = xe_gt_debugfs_simple_show, .data = force_reset_sync},
>   	{"sa_info", .show = xe_gt_debugfs_simple_show, .data = sa_info},
>   	{"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>   	{"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
> @@ -332,6 +312,78 @@ static const struct drm_info_list pf_only_debugfs_list[] = {
>   	{"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>   };
>   
> +static ssize_t write_to_gt_call(const char __user *userbuf, size_t count, loff_t *ppos,
> +				void (*call)(struct xe_gt *), struct xe_gt *gt)
> +{
> +	bool yes;
> +	int ret;
> +
> +	if (*ppos)
> +		return -EINVAL;
> +	ret = kstrtobool_from_user(userbuf, count, &yes);
> +	if (ret < 0)
> +		return ret;
> +	if (yes)
> +		call(gt);
> +	return count;
> +}
> +
> +static void force_reset(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_gt_reset_async(gt);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static ssize_t force_reset_write(struct file *file,
> +				 const char __user *userbuf,
> +				 size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, force_reset, gt);
> +}
> +
> +static int force_reset_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +
> +	force_reset(gt); /* to be deprecated! */
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
> +
> +static void force_reset_sync(struct xe_gt *gt)
> +{
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_pm_runtime_get(xe);
> +	xe_gt_reset(gt);
> +	xe_pm_runtime_put(xe);
> +}
> +
> +static ssize_t force_reset_sync_write(struct file *file,
> +				      const char __user *userbuf,
> +				      size_t count, loff_t *ppos)
> +{
> +	struct seq_file *s = file->private_data;
> +	struct xe_gt *gt = s->private;
> +
> +	return write_to_gt_call(userbuf, count, ppos, force_reset_sync, gt);
> +}
> +
> +static int force_reset_sync_show(struct seq_file *s, void *unused)
> +{
> +	struct xe_gt *gt = s->private;
> +
> +	force_reset_sync(gt); /* to be deprecated! */
> +	return 0;
> +}
> +DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
> +
>   void xe_gt_debugfs_register(struct xe_gt *gt)
>   {
>   	struct xe_device *xe = gt_to_xe(gt);
> @@ -355,6 +407,10 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   	 */
>   	root->d_inode->i_private = gt;
>   
> +	/* VF safe */
> +	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> +	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +
>   	drm_debugfs_create_files(vf_safe_debugfs_list,
>   				 ARRAY_SIZE(vf_safe_debugfs_list),
>   				 root, minor);

