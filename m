Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5593EC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 06:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2A910E579;
	Thu, 18 Jul 2024 06:55:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THTlwqJo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4B610E579
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 06:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721285695; x=1752821695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=edy2itTw+ZGLQD5gq5nDjhrFwu1Vw/YYRTjxKulZXGQ=;
 b=THTlwqJoSZLmgYrAIKCWIYmq3xJT2nHkusLtZS4/C3lVCffz/NKPA7rt
 ti6PAUU8PtA+4/75D1OM1z23duNNEOe3YQoA2VdnbCFn8Lt+0B2CUKIyp
 CuNXCFRkq3e8tnkJ1l5OEkClV3/YiBaJepk/xke6NKfG1dxS7HNSUWCbA
 +38w+59zpU/1CXnrGc7vrhubaja39xVSKEBBp1brNDegXn2P6R0p4omZG
 d+IJL5befPaGlIMeDUmcPESAOCd36h98ZCJ9AizwDNqB7D9ztdiGXCH93
 XXiQ58v4mCtz9TQmmVafWLWTMYQ/uKDLmx+PZC/1kZxTNfSwKPiK0KaAs g==;
X-CSE-ConnectionGUID: /FcTlaNYQg27/raxVk5q5w==
X-CSE-MsgGUID: byN65Ow4SoGRN082H7gKyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18941239"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="18941239"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 23:54:54 -0700
X-CSE-ConnectionGUID: A90F+movTGOYHYloOzDQ+w==
X-CSE-MsgGUID: reMIRqvHQoyRr+Dxn8NHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="55799464"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 23:54:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 23:54:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 23:54:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 23:54:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 23:54:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xd+wf7cfpRgsw0yNNIfjRy0ApkmNP2oPsONbEf0QWvCTQc1Fzhjy1uWlAY5Tu2MCj++e/D7cJ9Zi1wxVMM3+PNfyw6okBVKKXaxHk7Qy40eZHHmo1VznnP/7+34/36lF6WXxsDlZLJZ04bR8v26sH/A/AGXHXGZl8XGqMsFZ4zNpT3zU2eoB1A96l0yHbHe4Q/TU0l+PrlVBqcIw9VHYsyrMPcTjOg0fIWi20mfPdftPgPX+m0H7zTWD9+7kNGDRBr9dW3k9xuGXOMVEo3ubXLzKxXHK139tCRl3+NZIe+kkij5H8hiRCMgGCFwkxx+JM/deJp4wN/JLDu4Ag4r8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9qtgbQ9/764431AB5pOitCY6IZDJXqp+Thn18V0LfA=;
 b=PFcl9QpyLQXMY3nvfBYeFpV/yJ4kyoD42yDWifFYtxtvl+y2bXBhsyew/9RFtD3/NxY/LKkbe5iP+YlSHctXsZAxwyB8vBjGThYoVO2BgJS5Qewdnkb567fQC83dRlI8H63S8Guy8IgzYLE8cgyhiFiU84cUSaqON1jpM+7GHf3fhm3CpYs6AKrLBOcV9AltBAXjzciaLS6yVkbGhdZStcrrkd3S35t6nk5EqDaOTuBAkIzp0TRSoJ+hZwQDFTjpCvXzT/Nr+nC4P7YerW5FaNPO+djGM3Kki3uQxh1j64uOHR0aZ7P7SyPfD6QkMDXcVoXxrjfVEiEYsZ8bF0GWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.15; Thu, 18 Jul 2024 06:54:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 06:54:44 +0000
Message-ID: <3eb069c7-8a0e-4628-b4e5-e2ec368163b5@intel.com>
Date: Thu, 18 Jul 2024 12:24:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: remove GuC reload in D3Hot path
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <anshuman.gupta@intel.com>, <daniele.ceraolospurio@intel.com>,
 <matthew.brost@intel.com>, <karthik.poosa@intel.com>
References: <20240717055558.4169407-1-riana.tauro@intel.com>
 <20240717055558.4169407-3-riana.tauro@intel.com>
 <f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <f26ad960-4a13-49b3-b523-caa5715e40fd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: a91670a7-329e-405a-31a9-08dca6f68117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGVBSTZ2Uy9NNThnODlMQ1ZpV20wVy9TQXJ5L3lmejQvVjB3TGZicGh3ZDQ3?=
 =?utf-8?B?SXhRd1B6cWk0eEIwR3FuajFFcU5tYVJVZ1AyV0Nla3laWGJMUjNaMmRySUdF?=
 =?utf-8?B?VFlCdm0rSlhWMmExS1dDWCtwZXAxeFBMeDVlS2NsUzU1Z3lETWRZQ1R6dWRk?=
 =?utf-8?B?QzVtV04yRjVTalp6MVhpR3hOelhoMnk1VkwveUc2dmRINy8vNWs0RlZ6Z2pi?=
 =?utf-8?B?cXV4UjkwQXJvRXQ4WmV1d2ZCRWtnS2NHejlXNDZvT3dsV1kxeStjL3dDRnNa?=
 =?utf-8?B?Y3JZcDlBUjlWSlMzcVA4L1d4cHNNZjZ1UnhLZ0x1UmVVTm9sek5mSTRmK3lR?=
 =?utf-8?B?bFlNL1YrUk5XcmNhQ2dCQ0xyM0syYytJZUh2OWZDSFFuQzF6QjNIWC9NQUpL?=
 =?utf-8?B?SnZmWHVsUFBnaUhOaGZSQ3dCNDlxUXhxeHVKbWxkdmhIWC9xNFU1RFF5YzVN?=
 =?utf-8?B?ZVV6M2hOOHVyeWFIR0NlcUZiNjhlR0dQYzUrOTB0N2E2REEyS1E2Q0pNK0M4?=
 =?utf-8?B?MlRManY5MWM0SVZsTjZ2cjhJaVUvWFBhNnhheVJNd2w2M0VrS0tnOEdaTis2?=
 =?utf-8?B?d25zcXRnSGNzeEJzV3QrWS9adU51d3ZMaWZ0RmJoOVUyWlFJcExzT2Nkc1Rx?=
 =?utf-8?B?WkJDRWUrLy9ZS01XRkNzQzZLTTlTd2RCakp1ZW9XUERUaGFnWU1Ra2ZOME1y?=
 =?utf-8?B?OVN1NWthc3VCcWg4aDNuTWRrWXR5L3g3K2Q2OXJLR0xsZUc2WWFoVjdpMlFm?=
 =?utf-8?B?Qy9MWUdFQWNETlErUEx3QjFBa0NMSlFmdnpCS3p5cndtdVRKa2w5WlQwNUpi?=
 =?utf-8?B?aS8vcTdXWGowaktkN2tiZGcxcFdjd3AxRlJRZEFZTVFwaG43TTgwb0xOL1py?=
 =?utf-8?B?WnhjUmNLU2F3VUJ2eE1ia29wL0NSRkdYdzFndTJBRVBUU2hSR0gwRkVqRWps?=
 =?utf-8?B?RlBZSnlJY2I0QXFaaFpaU0tWeFNTNGFmLzNjQkpUY2tjcy9CTVBMc3BHZkE1?=
 =?utf-8?B?dGFOcStvbVRPYzg5S0x1Q2VONEROVDlxQ1NSVXM5amNrQXJmKzZHb0trb1ZW?=
 =?utf-8?B?TUxmdS9rYTVXV0ptZGVjNXNQMTVNWGZMMkVibE01d01KYWd5UGJDalBzeEgx?=
 =?utf-8?B?MXRqekkwbjRmYXRRMVFMd0ZHRTBRbFpTMU9OOWJDRzJTUEZkaVBSSFV6RXkv?=
 =?utf-8?B?eTJzb012bmlmYzN1TG5qOWpPMEV5bDEwWFlBeUdSV2IxeDZrUEY1cGVka1Vq?=
 =?utf-8?B?bWJ1K2JCa0pjTEpua256OWs3R3hNRFM1MnQyUlFiMDMxU3Q2NlZQMDFyOUdG?=
 =?utf-8?B?RUZpY1pMR2QxTXBBcUtpMGV4aXMyVUUvNXJaZlJWSEsyeU1Cd1FoNktZTHR5?=
 =?utf-8?B?a1EwMXdoaUxkM2tNN3ZsUWc3R0dld240bTVSMUZJMGEwb2lzbkJnZkcvaE9q?=
 =?utf-8?B?ZzRiKy84dUFoOWlKbEdNWFAzUGdaM1hhV0J5UGtHVnRFZlJRNzc0Q2VHQ215?=
 =?utf-8?B?UjdoZnVGVmlkUk5pVG9ndTFrc2JrOUhuS25nZXlIeVVFc3RzTWwvVVdocURS?=
 =?utf-8?B?NStEZE9nRWZSNVhGYmxwOStOTGdId2JrRzAwWkFPaTVJU2MzeU1tVFFCQ3Qx?=
 =?utf-8?B?aVEreDRoSWk4UW5sSmlsT20vN0ZTQmlFUmNxbjVxNEZRdUhUNFI4ejR6UUxu?=
 =?utf-8?B?cmYrdUNVbmgvM2VmMW1zcVVVOFVUNWFpTit2L2ZLM2JtRHdIWDlvcm0ydmti?=
 =?utf-8?B?S1REQVc2TERhZllMYm5ZZmJJcWVndjFrK2pjMjdhSWZmNlhIU0Zmb0k3WXR1?=
 =?utf-8?B?WXJzVy93T0hhK3pERXFRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YSs3bVowRW5YYkExRHFPeHU5dXBPOWFKWVJ4VWdVWDYxdEZtL3VwL3lLNEwr?=
 =?utf-8?B?WWhJQjN4SzJ6elVpZUprOW50MFhaTEVDNXdnM0hUdVhaUGZzdEdVMjdGMHpW?=
 =?utf-8?B?eS9QQzUzVFc1K2EwbWZXQ2F6ekd1V2VaSUI4QUFCUUNHdDEzVWRLejExQjdi?=
 =?utf-8?B?M3UyaXhYRTJ1cFVwRFA1eFAwb2x4c0pVYkM5V0U2RUxaMFkvdDJvRlF4OThT?=
 =?utf-8?B?R29XMWE4RDE0RnJJazlmTzNSUFFVMjlZam5BRmVUNWlaYlVOYm5hTjMwN3BE?=
 =?utf-8?B?ZWF6cnFicUFzckZPM1cyY0R6REZUT3IxOE5OOFJIZ3JDVXgyMjBOVU5YQTgw?=
 =?utf-8?B?enl4YWdNSlZvTDRtNTQ3MjljbEJJRGJZeXE4U2drV201eUlsc1BBS3dEU2VL?=
 =?utf-8?B?WnF5NmZZZS9acUlGVlVBODhkUUY2NDF1RjVaSDlZWlZVYWh5TzM3UmpLd3JP?=
 =?utf-8?B?M2tsV0NVUW82a0RLRWFpMGdPemkzVGpEOGJjOTZVNUsxdTJ5dDhBaHJtbkJx?=
 =?utf-8?B?bHQ4aUh2L2FzeTh5SkZ3WGZOT3ozNEhhZVd6RXdVMjVTUzhWOXZMMVJETU5o?=
 =?utf-8?B?YTlyNEYvQ1FlNFJlbm1LN0VFRHRDL0E5SU1xR3JIYWdwaG8rR1pPQWJyazRP?=
 =?utf-8?B?UzlkL0cxZkRBTGpnV1FCWS82bU9qUk82TVFWUXdCRjEyeHlQQWxuN1lzTFk0?=
 =?utf-8?B?dTBTUUVTL04rV2R6cFpKV3lwNllHL0Y5M3FUaktZeE4vOEZmeTFseW9ranRu?=
 =?utf-8?B?QUxFL3gxb0Jia011ZzdHQjJ6TnF3VHA5MUxGTTdkU1ZoaFd5eWs2elJkTGhD?=
 =?utf-8?B?MVRNdS9YMGZHck51enRxQ0c3YmhwZlU4ZmJRU1lOdDFYdm9oQ0tpZVFCU2Nr?=
 =?utf-8?B?elNVOGlncHBSL1pqcERXYkwxR0FVQzQ2clplSkdSK2wvOFVveFRwQklLOERv?=
 =?utf-8?B?anpiTWtSY3JHaWpvVTNqT2FFaHpUYzJiNUNaeUhRQXV6Wk14VzRyQm1OMGkx?=
 =?utf-8?B?NktOdXBvVkRZK0ZFN2dvOGo4bUR2RmhFTkRrNDZpWkVEYnIyNmJiZjM5VERI?=
 =?utf-8?B?cVFQdHhGYkFQNHlvRWhZaHpaSW4rMXExOTFBd3VxTitQdEVlQnhVU1RPWVFt?=
 =?utf-8?B?R2tPejFwLzhpaWN2UnNOWHp2VG9RYzdZOGYvblRGWi9XbEVWdmFJdWFjVVVV?=
 =?utf-8?B?TG1OeGgrRHV5T3JZa3BTZ2hHemR3UURKRklvUk8yTkVmVzNRSTF0SXk5Ri82?=
 =?utf-8?B?Sjh0bHJpcHEvaFU0b0NLQTN0ekFxUU9sV2ZKK2VmdFkreUFxRmhWdUVOR3E3?=
 =?utf-8?B?Sis5RmVXdXo3Q3RUayswMk5tM3FIQURqdzM1NUVMNGtTcW50eXBCY284M1Ew?=
 =?utf-8?B?UE9SeG45eUtjbUt1ZC9SMklscUJGRm1GRWEyR2swbUFQNEhzL0crTDRPSERX?=
 =?utf-8?B?ajRkTE9WVERBSWJ6MmdZUjdoaEJkemhzVDAyZkQxUWN5dVRKRUtMTGpzNEhE?=
 =?utf-8?B?bXI1b2lTWWxSZ3BkV25OSXdTNVNFQzZTellhdXE5ajczeGFpU1IvWjcyY001?=
 =?utf-8?B?dGVKZ1RMd0s3NG1GTFU3SHc4cE55dmIrdUF0MlR4T0NWalNJem9hdmhCSFJ0?=
 =?utf-8?B?d0Q4NUpLQkY1WE9sZUVwZlc2V1pacUF4dkZ2bkxYRVBOK2hzakNqUlFKVGRD?=
 =?utf-8?B?dnpycDJ2eVlDeG1kOW1XZ0hSQ2RnRys4d0xMVmdHWGVXQ1drcng4UW8ySUY5?=
 =?utf-8?B?aTBrY3RSWVhPbnBQM3phRFZmUWY1cTlHQ3piRHVPRHdUY3RFakNLLzdaYzIw?=
 =?utf-8?B?d25TZm1pRS84eGZKQVBiQUIybTAxU2RpZ1l5YnZYTXIrdUdzUmpiTm1FSEJo?=
 =?utf-8?B?TCtEaTJibVpIMWozZ25zQlB2bWZuZzNvbnk1NlpPSDBMaFZQdjZQKzQxZ25L?=
 =?utf-8?B?VEluZlJJUEN6WjBtMHRjbVZIVlRqYVFqNW94RzRtVktyYmZaZmVmekVIWitL?=
 =?utf-8?B?eEw0YjdOME9jM2hGd1FLOVFab3Z1MDBySkpkRFYreUNXMnhBVENGeFo1cG1T?=
 =?utf-8?B?cEpzeTNkNEVQdlV3MHJMeE5GWlVOcFl6THo2WGlRa3JGdlR6dGNQMzdnSlFT?=
 =?utf-8?Q?mgpw1V1GXDJO4LE9YQR0ALW33?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91670a7-329e-405a-31a9-08dca6f68117
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 06:54:44.1183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cVLrg3lmKMwO+JhKpAqqVH2inSncr0Sa1eXo7MoWY6Ymgwo7D5whm3LmPDQj98zk4A8ZM0VRbyPsrLvQsVHc6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

Hi Michal

On 7/17/2024 2:08 PM, Michal Wajdeczko wrote:
> 
> 
> On 17.07.2024 07:55, Riana Tauro wrote:
>> Currently GuC is reloaded for both runtime resume and system resume.
>> For D3hot <-> D0 transitions no power is lost during suspend so GuC reload
>> is not necessary.
>>
>> Remove GuC reload from D3Hot path and only enable/disable CTB
>> communication.
>>
>> v2: rebase
>>
>> v3: fix commit message
>>      add kernel-doc for gt suspend and resume methods
>>      fix comment
>>      do not split register and enable calls of CT (Michal)
>>
>> v4: fix commit message
>>      fix comment (Karthik)
>>      split patches
>>      correct kernel-doc (Rodrigo)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c  | 33 ++++++++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_gt.h  |  4 ++--
>>   drivers/gpu/drm/xe/xe_guc.c | 44 +++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_guc.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pm.c  |  8 +++----
>>   drivers/gpu/drm/xe/xe_uc.c  | 28 +++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_uc.h  |  2 ++
>>   7 files changed, 111 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 85f974441d50..716d3b46e986 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -831,8 +831,16 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>>   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>   }
>>   
>> -int xe_gt_suspend(struct xe_gt *gt)
>> +/**
>> + * xe_gt_suspend - GT suspend helper
>> + * @gt: GT object
>> + * @runtime: true if this is from runtime suspend
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "suspending\n");
>> @@ -842,7 +850,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = xe_uc_suspend(&gt->uc);
>> +	if (runtime && !xe->d3cold.allowed)
>> +		err = xe_uc_runtime_suspend(&gt->uc);
>> +	else
>> +		err = xe_uc_suspend(&gt->uc);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> @@ -881,8 +893,16 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>>   	return ret;
>>   }
>>   
>> -int xe_gt_resume(struct xe_gt *gt)
>> +/**
>> + * xe_gt_resume - GT resume helper
>> + * @gt: GT object
>> + * @runtime: true if called on runtime resume
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime)
>>   {
>> +	struct xe_device *xe = gt_to_xe(gt);
>>   	int err;
>>   
>>   	xe_gt_dbg(gt, "resuming\n");
>> @@ -890,7 +910,12 @@ int xe_gt_resume(struct xe_gt *gt)
>>   	if (err)
>>   		goto err_msg;
>>   
>> -	err = do_gt_restart(gt);
>> +	/* GuC is still alive at D3hot, no need to reload it */
>> +	if (runtime && !xe->d3cold.allowed)
>> +		xe_uc_runtime_resume(&gt->uc);
>> +	else
>> +		err = do_gt_restart(gt);
>> +
>>   	if (err)
>>   		goto err_force_wake;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 1123fdfc4ebc..4c942e4716ad 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -52,8 +52,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>   void xe_gt_record_user_engines(struct xe_gt *gt);
>>   
>>   void xe_gt_suspend_prepare(struct xe_gt *gt);
>> -int xe_gt_suspend(struct xe_gt *gt);
>> -int xe_gt_resume(struct xe_gt *gt);
>> +int xe_gt_suspend(struct xe_gt *gt, bool runtime);
>> +int xe_gt_resume(struct xe_gt *gt, bool runtime);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>>   int xe_gt_sanitize_freq(struct xe_gt *gt);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 8131c290a4f4..f612507e15d5 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1114,6 +1114,50 @@ void xe_guc_sanitize(struct xe_guc *guc)
>>   	guc->submission_state.enabled = false;
>>   }
>>   
>> +/**
>> + * xe_guc_runtime_suspend - GuC runtime suspend
>> + * @guc: GuC object
>> + *
>> + * This function waits for any outstanding CTB to complete
>> + * and disables CTB communication before entering
>> + * D3Hot
>> + *
>> + * Return: 0 on success, negative error code otherwise.
>> + */
>> +int xe_guc_runtime_suspend(struct xe_guc *guc)
>> +{
>> +	struct xe_guc_ct *ct = &guc->ct;
>> +
>> +	/*
>> +	 * Wait for any outstanding CTB to complete before tearing down
>> +	 * communication with GuC.
>> +	 */
>> +	if (!wait_event_timeout(ct->wq, !ct->g2h_outstanding, (HZ / 5)))
>> +		return -ETIMEDOUT;
> 
> this seems to be using only 'ct' stuff, so maybe it should be part of
> the 'ct' layer ?
> 
>> +
>> +	/* Disable CTB */
>> +	xe_guc_ct_disable(&guc->ct);
> 
> hmm, I guess today it only works since xe_guc_ct_disable() actually is
> not disabling (unregistering) CTB within the GuC, since it was optimized
> away knowing that GuC will be reset in the next step or already dead.
For all other cases, GuC will be reset in the next step.
> 
> but for our runtime_suspend|resume maybe it would be beneficial to
> un-register CTB and later re-register CTB, so we know we have semi-fresh
> start

But why would we need to re-register it again in runtime suspend D3hot case?
The address would still remain the same as no power is lost.


> 
> we only need to take care of resetting ctb.descriptor.status|head|tail
> as during registration, GuC expects them to be zero
> 
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_guc_runtime_resume - GuC runtime resume
>> + * @guc: GuC object
>> + *
>> + * This function enables GuC CTB communication
>> + */
>> +void xe_guc_runtime_resume(struct xe_guc *guc)
>> +{
>> +	/*
>> +	 * Power is not lost when in D3Hot state,
>> +	 * hence it is not necessary to reload GuC
>> +	 * everytime. Only enable interrupts and
>> +	 * CTB communication during resume
>> +	 */
>> +	xe_guc_enable_communication(guc, false);
>> +}
>> +
>>   int xe_guc_reset_prepare(struct xe_guc *guc)
>>   {
>>   	return xe_guc_submit_reset_prepare(guc);
>> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
>> index b49444297eb0..98d6d84a66c0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc.h
>> @@ -22,6 +22,8 @@ int xe_guc_upload(struct xe_guc *guc);
>>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
>>   int xe_guc_enable_communication(struct xe_guc *guc, bool register_ctb);
>>   int xe_guc_suspend(struct xe_guc *guc);
>> +int xe_guc_runtime_suspend(struct xe_guc *guc);
>> +void xe_guc_runtime_resume(struct xe_guc *guc);
> 
> as we are adding runtime_suspend|resume pair at the xe_guc layer, maybe
> the same should be done for the xe_guc_ct layer, which would eliminate
> this 'register_ctb' hack and/or need to expose internal ct state.

Previous review comments suggested to re-use xe_guc_enable_communication
to prevent redundant irq enable code.

If this code is split again, it'll have the same issue of redundant code.
> 
> then we will have something like:
> 
> xe_guc_init
>    xe_guc_ct_init	- alloc ct buffers
> 
> /xe_guc_enable
> |  xe_guc_ct_enable	- register ctb in GuC
> |
> | /xe_guc_runtime_suspend
> | |  xe_guc_ct_runtime_suspend	- wait, mark ct as disabled/unavailable
> | |
> | \xe_guc_runtime_resume
> |    xe_guc_ct_runtime_resume	- mark ct as enabled/available
> |
> \xe_guc_disable
>     xe_guc_ct_disable	- optionally un-register ctb from GuC
when would unregistering CTB be used? All other cases reset GuC after 
guc_ct_stop.


Thanks,
Riana
> 
> @Rodrigo, would that work ?
> 
>>   void xe_guc_notify(struct xe_guc *guc);
>>   int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_addr);
>>   int xe_guc_mmio_send(struct xe_guc *guc, const u32 *request, u32 len);
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index de3b5df65e48..070d28d193c7 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -99,7 +99,7 @@ int xe_pm_suspend(struct xe_device *xe)
>>   	xe_display_pm_suspend(xe, false);
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, false);
>>   		if (err) {
>>   			xe_display_pm_resume(xe, false);
>>   			goto err;
>> @@ -154,7 +154,7 @@ int xe_pm_resume(struct xe_device *xe)
>>   	xe_display_pm_resume(xe, false);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, false);
>>   
>>   	err = xe_bo_restore_user(xe);
>>   	if (err)
>> @@ -370,7 +370,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>   	}
>>   
>>   	for_each_gt(gt, xe, id) {
>> -		err = xe_gt_suspend(gt);
>> +		err = xe_gt_suspend(gt, true);
>>   		if (err)
>>   			goto out;
>>   	}
>> @@ -423,7 +423,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>   	xe_irq_resume(xe);
>>   
>>   	for_each_gt(gt, xe, id)
>> -		xe_gt_resume(gt);
>> +		xe_gt_resume(gt, true);
>>   
>>   	if (xe->d3cold.allowed) {
>>   		xe_display_pm_resume(xe, true);
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index eb9c1443c849..2f52e57bea12 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -288,6 +288,34 @@ int xe_uc_suspend(struct xe_uc *uc)
>>   	return xe_guc_suspend(&uc->guc);
>>   }
>>   
>> +/**
>> + * xe_uc_runtime_suspend - uC runtime suspend
>> + * @uc: uC object
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_uc_runtime_suspend(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return 0;
>> +
>> +	return xe_guc_runtime_suspend(&uc->guc);
>> +}
>> +
>> +/**
>> + * xe_uc_runtime_resume - uC runtime resume
>> + * @uc: uC object
>> + *
>> + * Called while resuming from D3Hot
>> + */
>> +void xe_uc_runtime_resume(struct xe_uc *uc)
>> +{
>> +	if (!xe_device_uc_enabled(uc_to_xe(uc)))
>> +		return;
>> +
>> +	xe_guc_runtime_resume(&uc->guc);
>> +}
>> +
>>   /**
>>    * xe_uc_remove() - Clean up the UC structures before driver removal
>>    * @uc: the UC object
>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>> index 11856f24e6f9..dd483ea43b9b 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.h
>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>> @@ -15,6 +15,8 @@ int xe_uc_init_hw(struct xe_uc *uc);
>>   int xe_uc_fini_hw(struct xe_uc *uc);
>>   void xe_uc_gucrc_disable(struct xe_uc *uc);
>>   int xe_uc_reset_prepare(struct xe_uc *uc);
>> +int xe_uc_runtime_suspend(struct xe_uc *uc);
>> +void xe_uc_runtime_resume(struct xe_uc *uc);
>>   void xe_uc_stop_prepare(struct xe_uc *uc);
>>   void xe_uc_stop(struct xe_uc *uc);
>>   int xe_uc_start(struct xe_uc *uc);
