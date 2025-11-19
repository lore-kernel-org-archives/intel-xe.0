Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09696CF397D
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 17:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4B8410E24F;
	Wed, 19 Nov 2025 17:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcXcoHUT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC9210E24F
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Nov 2025 17:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763573095; x=1795109095;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zmQ4v8yKlR89Y3GiqG09o6W7I8cdLaC1jAn1H4w1TfE=;
 b=XcXcoHUTOTwgwiTtM15F5RoF2EVyeOYzjiAaIBMmRekPL2BXdeEK2sq5
 26MYg+x5B16xk9iZjof0gS0Jg97Du0PZQANs+tX82AVsTDaEZL5nZcGqQ
 9b1kb/4hrbRmr+Q+L2s8s6omoZbcyXa1Y9e5GEMvk3UKDyRkhpLNYcNoC
 0pZSMP6mouHGCVjK9PZuL7leGH3wu3WWeMOFeLKHLOkMrbe2PwCW0DBZD
 4NozoQxdF9iN7NzYKCsjdvF0AW+Eg2yXv640j0bQYLSiK0jLGtnemGrkB
 UlG7CDsn50a2CTGNviW8LBkSQ7nyzFCgvHhOZXAaaWZrBnt8BUTwEJi7m A==;
X-CSE-ConnectionGUID: ZF72zu6nQXSAH95KsYK9kw==
X-CSE-MsgGUID: IFWcQ5+4QPqwrxPs/mJtEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83247568"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="83247568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:24:55 -0800
X-CSE-ConnectionGUID: Jg2tWGZFR9Guf5G0Q+IyVw==
X-CSE-MsgGUID: 6x77PrP7QpihwKByBTg+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; d="scan'208";a="191549421"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2025 09:24:55 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:24:54 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 19 Nov 2025 09:24:54 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 19 Nov 2025 09:24:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgCuryDG5F6qJC+QYsTFTyHtFgcm66zCVqhLTV6YzrJT4lhueAix4iJhRxeNqFPgP5gOO1bBb+iu0HfUB3/52pGskR7YDVr7nLzjmBdeKbH4mTch3gN1NmBvWRaYDkbtkFgVjUhE7mi8Bn+CgKiqFuFmt/wJjbmhkYppJp0vpdStPKP+i3sjKRzxARiHyttZtH5jgRkSS7kPdgpGT4c2ENenhJUN1fNvINQxv6Keh4W2KrqHA9878GU6q8RMgACYUOxzIsucbgg9ijYgX+9RrpcRTw6mFHF6e+zm+rC8G/as0a/XF6cPPw1HPmf3vR61jCfr+qHgR60kksn9HCDomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFeMN2uD+ZQtGFVx2/S6ijY2Cf5eAePEbtzSyh0wYMo=;
 b=d6+HCQ9zcj8u7CuMuxjG+VTnK5DsSRfLeBKCJC2Cx4eJxOfkvRaXVclyUja6d9JhZETmLI+4sdZjgigaPKdLs9d5AuDae8EtqDEvEa2BRQNA/fmVd/K+CHC36/HJD8CHumNOi4wKt6q8ynq5Tl4IUwRP4O7Z9pza2kJMgGpaEbnNkEHhPUfzzoLtQpx0aSgjzVdaFLobSMOkInsJFXsJZWI3HKPSfoezXZMmAVhiuAiowkBN5EryJ1bQ4BJor5eMepBveBERa03SJZJjn9Abwn+uKskxPDZyg/hfPYkAioDo6ONqQuJ2OiJRHK4KOPSEohZNYLKiNVSme1fF/yyHvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6997.namprd11.prod.outlook.com (2603:10b6:510:223::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 17:24:51 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 17:24:51 +0000
Message-ID: <dfab58cc-2d70-446c-9041-b980e64da10e@intel.com>
Date: Wed, 19 Nov 2025 18:24:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/vf: Introduce RESFIX start marker support
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251118114116.3429730-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6997:EE_
X-MS-Office365-Filtering-Correlation-Id: fa96224f-5fb5-413c-7b8a-08de27908ba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkpaVHNEWTEyU3JLeGtlVnZybHRNc3hqTTNwZENKUklQZHh3WVRyQmZsRE1o?=
 =?utf-8?B?VDUwVXRNSDVadEJOcE8rVWxQblNEdU5jdUpNYnpjRjVvdjFkWGFxZ2xucFlm?=
 =?utf-8?B?VmhhWlZ5cUd2SFBDcTgyNGJtaVpwMlNhUnV0TzJvWkw0dFFEaEUxZE5qM3Rh?=
 =?utf-8?B?Y1FqSWhFQ29jRHF5ejZXS1I4eS9kWXB6ZnJWSjRSZ2t4WksvWFRQLzI5THlp?=
 =?utf-8?B?VmtHMjBjcS94RjZIM0lNOEpiN1VXd0t1eGw0UFl4eHI4QnBMbElFa1Rpbk1i?=
 =?utf-8?B?dU11MExpbEVMcWpxYklYK0FQdXJlQjF3bFBFczMxUkJlL1FvdEZWeFN0Qmxy?=
 =?utf-8?B?YUdEVTR1OWJKa0lkWVd1dk5RL2NLeXpsR3pNdlJ2YXpWQnZCTzZHWDNSRzNv?=
 =?utf-8?B?UVhyN3dCWHRyQitvVEVIQWNSUWNWejJqWG9wZjN2bXZrc0NCY2JYV3JKUjlC?=
 =?utf-8?B?WU5sOE9uWVVUWk1xNUxRTGlSMGExa1Fuc2lNQWpNUUYreU0wVEdQc2ZueG9N?=
 =?utf-8?B?bzB1d2o2emZ6UWZ6WTh6b0xPcTI0TnFmaHF5c3FraWtlZXJUNUpzSm4rNXdO?=
 =?utf-8?B?QTB5ME9LckFrZ29vaU5EMkppSmI1N2pNRlVwTk14cmVMeHMxNzdpMDJSZ1ox?=
 =?utf-8?B?bnYyNTh3RSt3VkhQSTRXZzJSU1I5VlVkWkJyaDFOdytnSlZWZXExeVlUQ1lB?=
 =?utf-8?B?T2hRMTdVZVVUK000dHV3bDBTMEhRSkJjSTd1V2M5NEZYMmxVZXNPRWdnUU54?=
 =?utf-8?B?QXJvSmxNZFRsK3hVMWdZQURaRVd0RHQzTzRUdG45akpJUEZwQzE0UGEvejlI?=
 =?utf-8?B?SGQ1UHhFaFp5WE1YclFYZTRlT242UWNCcFplVzIwakp6ZEdlV0VDZDcrbDVl?=
 =?utf-8?B?SzVzM2dPZTloRGYxRmYzRlJRR1dMa3dOa3BLeXBkd2xDWllZb3krSkNKcXJL?=
 =?utf-8?B?UVlaZU1saDMzOTVFdkVoUmcvd2d3NU02cmtZV2YrNEczOWlVNzh6R21xRjlu?=
 =?utf-8?B?b05MNFA5UGZCNGdoRHNJMEFuWll1RlVEUXVUbE5EWW9UUm5KSDBKeDFXOVND?=
 =?utf-8?B?VDVDOHFvTzZBYlh6T1AvV3VadW9UKzh3ZzE3cWlPMzhWZjZMc0wrOVJxWTlm?=
 =?utf-8?B?YW1QdVFseTAydnlHODFJcitOVG5KSUJEcFY5WFBiRDhrVnBsNWg0bTdrOWhS?=
 =?utf-8?B?Sm5BYXdUbVZmckhPUkRXVEtNNCtvc2lMRUM2bThORkQ2THZnNlprOG15d1gv?=
 =?utf-8?B?RklSOUtIMCtwUUtoazVMMjFVUTRoYlJGSU1mSXJMakUvKzVGQ0R0U0VDa2Ez?=
 =?utf-8?B?K0h2ejQwWjlHS0Vlcmt1b3kwZGtRQ0lhejNQSldYSjFna1pGbGdJNm1PbTVp?=
 =?utf-8?B?dlJRd2hLNXIwcnNFd3pHMXhhVlZkVmR4ckE2NS80d3pySHlEWFkvMzh2NldS?=
 =?utf-8?B?L2lZM2VDZWM1NEZ0eGFwcWJ3cHJQMi9uQTlPb2hsS215bngzSmJNZEhnS0dB?=
 =?utf-8?B?N2xMMlQ2NlpFVkY5ZjJzSlNWVVZnUjgxeWR5MXhYeVZVbThRcThvZ2psVENy?=
 =?utf-8?B?Qk9pUkd4a2ZmVTNSb0NvaW85dkJHUDBFRk42Y2N4VWZFdU9SWHduQ20vZjB2?=
 =?utf-8?B?NFZxTFFEdnB4czY1SG80Vk1YajNoV2k2MjNXZVdBUzNHaU1oZ3VSemx5NlVI?=
 =?utf-8?B?WmNtWVlzMFJocUdJRUhOdTlEdGIvQ3AvY0cyai9MU3A5VlNOZzdJN3dMOWpk?=
 =?utf-8?B?RUhuamlsQ1BGaHBDM3lFNmZyUVVta1NMd2pJYlNNYk5mb21rQmFzaWJWaUhY?=
 =?utf-8?B?UE80TUoycG5ta20zSStvc2V1VERqV0xMUFZMK0JaL1pHUi96RU1CNzdZTFV0?=
 =?utf-8?B?Q2R2dVYvSCtXN2ZRV051YkhzaTFWUWVGZ08xeGEyOW44cWgxOFQzb1B5Rms0?=
 =?utf-8?Q?oSm/Z05rviYL+7JGEn5h9O2/KOSkZ53M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2E3cURHRExDai9IYTkyNFlPd1NVOUxkMHdpUjczaTdGVDlUdmNDcVVoMGh0?=
 =?utf-8?B?MEZuMmtSYitKekd2TVptbDJqRDBOd3c0Q3p3aS9vTzljcWxUTXJOMmJNZ2pG?=
 =?utf-8?B?cExxSGlYaU5FUXNuaTVEZWNUZ1dXODRMR1AxZTI2TFRKVUt4R2x5ZEZtZDVX?=
 =?utf-8?B?NW4vcFJ1Rm1wR3hRaTJVVEVFcVhXcjFmY1ZNL2JURjY0YVdNTXZkUGxiT0ZZ?=
 =?utf-8?B?N0FFUTg4a0FlNmdXZ2VPZys2ZWhNRnJPRUZROXk0SUdrVGM4dVVnQTBhTG1M?=
 =?utf-8?B?dURBSnphMDg5K2JteFlsRHJESkpLaXMzNUU3ejlSNjFMckt0SWM4Rm1zclBh?=
 =?utf-8?B?czNuUTNYVWFVNGlyb25pcGt5aHhVWC95a3FOOFdqV1BySGxwZVUyM0xhaDZ3?=
 =?utf-8?B?a1hlbUxyMWNxNlQwQnRkbDUwYXg1QTJncGcxdGZKdEhFdzc0YnQwaHNKTlpX?=
 =?utf-8?B?WEQwKytEdHh1UkZTYlJHMlRTTFdmbnIyT25aZ0ZXeVFZNXVXaE5Uc3Fmak1Z?=
 =?utf-8?B?cHY3Q2JVNDJwUHlVZ0I3a1dya2dnSDgwSkNZMUdUMUZJK2IvQjRXLzExTVRW?=
 =?utf-8?B?U1lXR2hiQ1Y2T1pTSFRXUjlVelFDZndMb056L2VEVWczYXk5VjVHcERUaGdL?=
 =?utf-8?B?QlhqWXFQNWpCbi9ZZnpDR2hSR2NSZkRjbldXck15dWR1c0k1NXVrZVVOZ1h1?=
 =?utf-8?B?TVAyYit4TnBvZ0sra2d0cDl5SnZzdGRMQVV6VEUzTzVmUmJuakNlVXQyV3BK?=
 =?utf-8?B?RjQzRFJpUGpnZUt6Y050eU5PRUhiZ29sWFVCTEk3MHNsRElJL2hYU0VCcG5x?=
 =?utf-8?B?SWxnM240Qzd2Q2NDemZoeWNmZlZuTmNpdUlKcmNKRUErTWREVm5IWGtKM0F3?=
 =?utf-8?B?SVJnODNzRVFwQ1lmZXVNWW9IVEdoK1FIZDhHY2lCeG9NbzdxQWxUM1h3ZGpB?=
 =?utf-8?B?MkVqNTQwV2JyN01SQ3pMeDJiOVdxSUdPMHZ3WGhWV1VsbEF1ekFMQlVpamZj?=
 =?utf-8?B?a256R3lNd3ZXMUJ0aWlqUG0vQ1VRRk5zWGFVQlFML2JvR3VyMnJScVZLdElB?=
 =?utf-8?B?QlJXUEdYaXBFdE5NbFRRYnRwQ2ZjSTJjdWNLcVd0NnBSOWRROVhiOU4vTm95?=
 =?utf-8?B?MTNpZmIwZnJuRkJCWG9mcFF2MHhQOE1ZVklyWnNkVFg5RDh0YVluL0wwRWpV?=
 =?utf-8?B?dm9GQ1NBNDZsOVFhV3N5eWl4Snl4OTBoMU9Sa0VQeGlqS1hXaWs2aUkxdlIz?=
 =?utf-8?B?QUtLRUVOSXNIdGxnRzJ3YVpGS0NEbHF5NXJ5NGk2S2pYYUl2eVZJYnREM3pT?=
 =?utf-8?B?d1piOHBqbjlzcHd4a3ppUVN0Nk1QVGdvWGNvWXMrUmV1MEh3U28vYlV6WnBI?=
 =?utf-8?B?VUdxNHVDTTlvdG5rdFMxTDNiQ05nTkxPRHFaOE50cGp5ZlpFdHhZYnppRDMx?=
 =?utf-8?B?TXp3OGEwQ1RGV0hmcXozK1JxdTMvczhSQStVRGRFcDRPZXJmRms3VUpZVStV?=
 =?utf-8?B?YW9vdkxkazVKckhudVQ4QkJJcU5IQUsxM2xRRDRIVW1XSFZuYkM1YnNzK2sr?=
 =?utf-8?B?eGpqZVdtRzArMmZycEo2dFlSRFZkMktIMEx3U0Y4TDZ4eFZ6RHdOdXZQQldv?=
 =?utf-8?B?V25CZUZFY0dlYXhTcnRzRStqd1dnUGFtTUlJaDk3TnV2Y3prcUE5ekg4bGkz?=
 =?utf-8?B?blA3dFQvSEFMTjFWWklhWHZmcTNmNy9EQldrdEczM0dZdkVsaU9FUkhieGx4?=
 =?utf-8?B?b0orVDNqSzF3NFFWVXkwbVpuMlJFT1VoMHB4NitzV2xIcHZwTWwvUkthbk5i?=
 =?utf-8?B?Wit6d2RpWWZiSXNBSVpWcDF3M0hGMEh6bjc2ZWhQaG5YOW82VkZLWHRSVTZn?=
 =?utf-8?B?c2wwV0gzS0pXMDFFTE9sTjEza1JFRFhwMUNDeCs2b1hidkRBdldQVEliTDN2?=
 =?utf-8?B?eUhrRlNoRm9OSHZmOFVudWlTQTdRVnZ2S0VqNE1qSDg5a1JkdXg0djlvRFJk?=
 =?utf-8?B?c0dzT25Ram5uQjBjNDJiejk4OXNhdy9sNnNKSlBqd0h2R3QwM0hBRnJkZ0h2?=
 =?utf-8?B?V2RDc2EzOFE2Nmd0QldSZnBUNU1SdUswL3J6bCtUM1RQbmJaNVNPcklPWDhh?=
 =?utf-8?B?VHdsL3I0YUtmYjI3NGtleUJHWGhvZTlxNHNWeWRsWlhNVm1jVStHOUhMTlEz?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa96224f-5fb5-413c-7b8a-08de27908ba4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 17:24:51.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hRkgFDFgdjoX3DU/QiBcdtY54OMkBxJr6vpPxHUY+eYmzYM0JK6F5f1o7Q4bWYXte4jpvwH/XPa11LggXrmXq8eIMoJfPL5uIPnQrRODoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6997
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



On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
> In scenarios involving double migration, the VF KMD may encounter
> situations where it is instructed to re-migrate before having the
> opportunity to send RESFIX_DONE for the initial migration. This can occur
> when the fix-up for the prior migration is still underway, but the VF KMD
> is migrated again.
> 
> Consequently, this may lead to the possibility of sending two migration
> notifications (i.e., pending fix-up for the first migration and a second
> notification for the new migration). Upon receiving the first RES_FIX
> notification, the GuC will resume VF submission on the GPU, potentially
> resulting in undefined behavior, such as system hangs or crashes.
> 
> To avoid this, post migration, a marker is sent to the GUC prior to the
> start of resource fixups to indicate start of resource fixups. The same
> marker is sent along with RESFIX_DONE notification so that GUC can avoid
> submitting jobs to HW in case of double migration.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> ---
> V3 -> V4:
> - Updated RESFIX_DONE action name and documenation part. (Michal W)
> - Enable resfxi_start marked by default as sav/restore is gated on
> Guc version 70.54.0
> 
> V2 -> V3:
> - Fixed review comments (Michal W).
> - Updated commit message.
> - Fixed CI.BAT issues.
> - Added helper function to assert on unsupported GUC versions.
> - Updated RESFIX_DONE action name and documenation part.
> 
> V1 -> V2:
> - Squashed "Enable RESFIX start marker only on supported GUC
> versions" commit into a single commit. (Matt B)
> ---
>  .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 60 +++++++++++---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 80 ++++++++++++++-----
>  drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c              | 16 +++-
>  4 files changed, 131 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> index 0b28659d94e9..1d84ce07b201 100644
> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
> @@ -502,13 +502,15 @@
>  #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
> + * DOC: VF2GUC_RESFIX_DONE
>   *
> - * This action is used by VF to notify the GuC that the VF KMD has completed
> + * This action is used by VF to inform the GuC that the VF KMD has completed
>   * post-migration recovery steps.

please mention that from 1.27 it shall only be sent after posting RESFIX_START
and that both @MARKER fields must match

>   *
>   * This message must be sent as `MMIO HXG Message`_.
>   *
> + * Available since GuC VF compatibility 1.27.0.

hmm, actually RESFIX_DONE is also available prior 1.27,
just a meaning of the DATA0 has changed

maybe:

    * Updated since GuC VF compatibility 1.27.0.

> + *
>   *  +---+-------+--------------------------------------------------------------+
>   *  |   | Bits  | Description                                                  |
>   *  +===+=======+==============================================================+
> @@ -516,9 +518,9 @@
>   *  |   +-------+--------------------------------------------------------------+
>   *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>   *  |   +-------+--------------------------------------------------------------+
> - *  |   | 27:16 | DATA0 = MBZ                                                  |
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |

and then we can keep legacy definition for the record:

    *  |   +-------+--------------------------------------------------------------+
  - *  |   | 27:16 | DATA0 = MBZ                                                  |
  + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
    *  |   +-------+--------------------------------------------------------------+
  + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
  + *  |   +-------+--------------------------------------------------------------+


>   *  |   +-------+--------------------------------------------------------------+
> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>   *  +---+-------+--------------------------------------------------------------+
>   *
>   *  +---+-------+--------------------------------------------------------------+
> @@ -531,13 +533,13 @@
>   *  |   |  27:0 | DATA0 = MBZ                                                  |
>   *  +---+-------+--------------------------------------------------------------+
>   */
> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>  
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>  
>  /**
>   * DOC: VF2GUC_QUERY_SINGLE_KLV
> @@ -656,4 +658,44 @@
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>  #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>  
> +/**
> + * DOC: VF2GUC_RESFIX_START
> + *
> + * This action is used by VF to inform the GuC that the VF KMD will be starting
> + * post-migration recovery fixups.

please mention that @MARKER sent here must later match the MARKER posted in the
VF2GUC_RESFIX_DONE_ message

> + *
> + * This message must be sent as `MMIO HXG Message`_.
> + *
> + * Available since GuC VF compatibility 1.27.0.
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
> + *  +---+-------+--------------------------------------------------------------+
> + *
> + *  +---+-------+--------------------------------------------------------------+
> + *  |   | Bits  | Description                                                  |
> + *  +===+=======+==============================================================+
> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
> + *  |   +-------+--------------------------------------------------------------+
> + *  |   |  27:0 | DATA0 = MBZ                                                  |
> + *  +---+-------+--------------------------------------------------------------+
> + */
> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
> +
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
> +
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 4c73a077d314..08c00b773a13 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>  		*found = gt->sriov.vf.guc_version;
>  }
>  
> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>  {
>  	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>  		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>  		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>  	};
>  	int ret;
>  
> @@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>  	return ret > 0 ? -EPROTO : ret;
>  }
>  
> -/**
> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
> - * @gt: the &xe_gt struct instance linked to target GuC
> - *
> - * Returns: 0 if the operation completed successfully, or a negative error
> - * code otherwise.
> - */
> -static int vf_notify_resfix_done(struct xe_gt *gt)
> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
>  {
>  	struct xe_guc *guc = &gt->uc.guc;
>  	int err;
>  
>  	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>  
> -	err = guc_action_vf_notify_resfix_done(guc);
> +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix start marker %u\n", marker);

shouldn't this be xe_gt_sriov_dbg_verbose() instead?

> +
> +	err = guc_action_vf_notify_resfix_start(guc, marker);
>  	if (unlikely(err))
> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start(%pe)\n",

add space between "start" and "(%pe)"

>  				ERR_PTR(err));
> -	else
> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
>  
>  	return err;
>  }
>  
> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
> +{
> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
> +	};
> +	int ret;
> +
> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
> +
> +	return ret > 0 ? -EPROTO : ret;
> +}
> +
> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
> +{
> +	struct xe_guc *guc = &gt->uc.guc;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix done marker %u\n", marker);

dbg_verbose ?

> +
> +	err = guc_action_vf_notify_resfix_done(guc, marker);
> +	if (unlikely(err))
> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",

hmm, it's not only about that _we_ failed, it could be that _GuC_
encountered some errors, as there is ERROR_RESFIX_FAILED, so maybe:

	"Recovery failed at GuC FIXUP_DONE step (%pe)"

> +				ERR_PTR(err));
> +	return err;
> +}
> +
>  static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>  				       u32 *value, u32 value_len)
>  {
> @@ -1183,7 +1208,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>  	xe_guc_submit_pause_abort(&gt->uc.guc);
>  }
>  
> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>  {
>  	bool skip_resfix = false;
>  
> @@ -1206,14 +1231,21 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>  	 */
>  	xe_irq_resume(gt_to_xe(gt));
>  
> -	return vf_notify_resfix_done(gt);
> +	return vf_notify_resfix_done(gt, marker);
> +}
> +
> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
> +{
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +	return ++gt->sriov.vf.migration.resfix_marker;

should we protect that with lock?

also see below

>  }
>  
>  static void vf_post_migration_recovery(struct xe_gt *gt)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
> -	int err;
> +	u16 marker;
>  	bool retry;
> +	int err;
>  
>  	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>  
> @@ -1227,13 +1259,25 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  		goto fail;
>  	}
>  
> +	/*
> +	 * Increment the startup marker again if it overflows, since GUC
> +	 * requires a non-zero marker to be set.
> +	 */
> +	marker = vf_post_migration_resfix_start_marker(gt);
> +	if (!marker)
> +		marker = vf_post_migration_resfix_start_marker(gt);

this "overflow" logic shall be in vf_post_migration_resfix_start_marker()

OTOH by looking at the expected flow, maybe we don't need to track this
marker at all, as it should be sufficient to always pass the same const
non-zero value, GuC will just compare it with 0 anyway

and we send RESFIX_START/DONE only from within this worker, so we will
never have two parallel recovery sequences which would warrant different
markers

> +
> +	err = vf_notify_resfix_start(gt, marker);
> +	if (err)
> +		goto fail;
> +
>  	err = vf_post_migration_fixups(gt);
>  	if (err)
>  		goto fail;
>  
>  	vf_post_migration_rearm(gt);
>  
> -	err = vf_post_migration_notify_resfix_done(gt);
> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>  	if (err && err != -EAGAIN)
>  		goto fail;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index 420b0e6089de..66c0062a42c6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>  	wait_queue_head_t wq;
>  	/** @scratch: Scratch memory for VF recovery */
>  	void *scratch;
> +	/**
> +	 * @resfix_marker: Marker sent on start and on end of post-migration
> +	 * steps.
> +	 */
> +	u16 resfix_marker;
>  	/** @recovery_teardown: VF post migration recovery is being torn down */
>  	bool recovery_teardown;
>  	/** @recovery_queued: VF post migration recovery in queued */
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index b73498097df5..64b2ddabd3f9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -49,11 +49,13 @@
>   *
>   * As soon as Virtual GPU of the VM starts, the VF driver within receives
>   * the MIGRATED interrupt and schedules post-migration recovery worker.
> - * That worker queries GuC for new provisioning (using MMIO communication),
> + * That worker sends `VF2GUC_NOTIFY_RESFIX_START` action along with non-zero

drop NOTIFY tag and use trailing _ to create a link:

	VF2GUC_RESFIX_START_

> + * marker, queries GuC for new provisioning (using MMIO communication),
>   * and applies fixups to any non-virtualized resources used by the VF.
>   *
>   * When the VF driver is ready to continue operation on the newly connected
> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
> + * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` action along with the same
> + * marker which was sent with `VF2GUC_NOTIFY_RESFIX_START` which causes it to

ditto

>   * enter the long awaited `VF_RUNNING` state, and therefore start handling
>   * CTB messages and scheduling workloads from the VF::
>   *
> @@ -102,6 +104,11 @@
>   *      |                              [ ]        new VF provisioning  [ ]
>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                              [ ]
> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]

ditto, drop NOTIFY

> + *      |                              [ ] <---------------------------[ ]
> + *      |                              [ ]                             [ ]
> + *      |                              [ ]                     success [ ]
> + *      |                              [ ]---------------------------> [ ]
>   *      |                               |       VF driver applies post [ ]
>   *      |                               |      migration fixups -------[ ]
>   *      |                               |                       |      [ ]
> @@ -114,7 +121,10 @@
>   *      |                              [ ]------- VF_RUNNING           [ ]
>   *      |                              [ ]      |                      [ ]
>   *      |                              [ ] <-----                      [ ]
> - *      |                              [ ]                     success [ ]
> + *      |                              [ ]   success (on marker match) [ ]
> + *      |                              [ ]---------------------------> [ ]
> + *      |                              [ ]   error (on marker match)   [ ]
> + *      |                              [ ] ERROR_RESFIX_MARKER_MISMATCH[ ]

this error is about bad programming, not worth mentioning here

for the double-migration case, we expect STATUS_VF_MIGRATED instead

and in case of error/double migration, VF will not be moved to RUNNING state

>   *      |                              [ ]---------------------------> [ ]
>   *      |                               |                               |
>   *      |                               |                               |

