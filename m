Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753CBC5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D15F10E140;
	Fri, 14 Aug 2026 13:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XelK80PC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C2910E140
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786714732; x=1818250732;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MeL3p75K2Rc4EUE47l6dvTF/xoCDvpgUN9lXUEWhxy8=;
 b=XelK80PCLUONNs+saEZCW7ZzbwV+lDnzFCzfLDbjV78CLLSckaWoaDy4
 akrKjgnTEZBzqd8kmcw5hyHa6icdQTY5fpLzHqslTN20GSaBW2sSBkzYg
 W6OnjUrr2pZYLnm/xnD1b+LMwoh365gpl92/qUZSiJVmO3AE2iAYed54F
 ZeqNyGB4LiEttsbop6mM6byPPnFyJlfDF7PcRvFFyjnGf9cGsTXhzPaC4
 5Ob62ch+BNzToU40BnCYRT+acyAth6LAa+OLrBf6sZlnFoCnLJm/RC6c6
 HCdZNDbB3J0K6x4Bd3E/SQ7tr7pFDkbrAfViq1XgLjs3R0JpaZIAoju/V g==;
X-CSE-ConnectionGUID: UO7iEjYGQGyTUaL3vMJFNg==
X-CSE-MsgGUID: rCYdVSf9QW2/VX7XwEZv2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98650665"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98650665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:38:52 -0700
X-CSE-ConnectionGUID: kdDWxhToR3O8lqHcbY+HdA==
X-CSE-MsgGUID: tlvT2XyYSuSZlJWv+K0J7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="258009051"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:38:51 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:38:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:38:51 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:38:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chqhnNt019OikF2yfdXyQc+dqyuJGP5VH+LvaDihTQppNyEYhHJr7Za/Fp1pWlgqq1HDADe4PUCtZu0x7h4nFXxYDp55k0dtLKMcEDIVATaxtoR4CmjAvXtqLbyiNmWnyVNNpAnt3Z2ia4V97AHvpWl2BEY9UwXu1O4TVe1kwtYWXxI8KxnpMqunl9SL4pb2psnnFJxm/Mjxl2cO5heejXVkpZQ/BilElOJ4I8ji7sxHS4cR2XSxGPrg2q4dProNFbdOoLTDmCTQfoKeXMqLK2PEroN79bAHxXOpxcKY2qi1ENblZM5d1CGXRC22rx8sCrzkWe10rtmAAntcHB5/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GpVIXtoiV4kV/zR88Zm0eKCahUZd6QszUyxl3daBU8Q=;
 b=EnGSPFvtEX8oAbS2GrCkR9YD8iiXcWCM0B4R7n5QVWzqMFTp5RexWvN5Ins+3jVINANxewEGpbOCnDnL36cxk7LLhT2SuA4zfqCqenXr6xFlP1tT5/zNiXWABPFUmSrTbwp7LgePk/2jEf0WhGFHPX5nLNw4bN9POtDTpkocmk1RMngCKC8rq6N1Aw6Yv3NMW7xZtVYnMabNjdP0ZsXDpF/8CD6/ewx4vOsNhLviN57yCL909a0ZdrGb/p6O61vErDgSvxbdydU5BlRhLofkPOj7wdx1ItjmsbWHxhI9i7rMzGlUggf2Le/DMTnh00mz1op+DEAyBwAS5QhyZb9Eeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB9728.namprd11.prod.outlook.com (2603:10b6:510:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 13:38:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:38:47 +0000
Message-ID: <d1915b2a-793d-469f-9a09-efb48214b427@intel.com>
Date: Fri, 14 Aug 2026 15:38:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: "Tauro, Riana" <riana.tauro@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
 <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
 <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
 <b0d83bf9-a060-4593-b040-7988b91bef79@intel.com>
 <2662b52e-6fbc-4fbf-8528-e55656c387c2@intel.com>
 <1eedcedf-5585-4358-98c8-d6b79fb32e5a@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <1eedcedf-5585-4358-98c8-d6b79fb32e5a@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008BE.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::691) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: d947cc98-293c-4db6-f04d-08defa095deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|10067099003|5023799004|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: C0uBQv1CQJenv92qI7vw/utveoEK4m8QvqYJ5iWscpGNrjpVJetQ/GbvnmkXtB9IvW4tPKMT42JJLAJ2qu5qYe3iVJeP7L3ypTtIPMOO2N8td/D9lRKQUnHG8DnmbgKFi/ixubBqs7vQvnnbBdQfty5xdEY7GsDl2mUa9JT5Mtrz3wIHSCji1nwdg8A8KtAGAGPXjUZCDQ3LBeOIWYvdxjhOjNzvCgz3nrhr7ep5/wJTDk3x1sTmsDiDvbG5FFuKvkuD3/t5mNGKzWNFyN1+0y2mrnl7W4pq18wSLPwSb5uN/blFvUbdYZn+WRZpg8oVFcXhY90MdLqOgz+aWJA6WumWtuTvVQ6C7QyjzJ5YNhLoUrRohRtnO2Pih3ri2rbN7PSr4tBgikbXsC2xSkI0Q16jMrYGxopxYsaZ+PZ//zHNe9+z8GbvYSp77D4vuxLfKyJUX43HH3QsvJWDN2nRDUO7N8LIdJYXIi5qxQV2gSdhQT54UgW8bnZyzf2Q20ka1aM6NFyUsfpghOvYPL1yNljrhU8Ca8t0S+n8a4A64gR19Q9V9dWXWsRwVZpLo59acVG41WReKXlTm0hIl8KSeEbrQ3RY5+cL2DUvHTMeCS17ycbhLYD2Fo6cF/+iq+Q55S3O0pCQObZoG4X6j7URLcmSYDpMY77KHNQ8Qxtpe9c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(5023799004)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3p0cDZ2cHNiMitvSkNXNzJaSXcyaG9PRHNvSG9jeEJOSnFOOGNLOEVjK1hI?=
 =?utf-8?B?eDlGWk56WEFxdjV2bHQvOHRRVVY4eU16M0hEclcxTkhsYkV0SHliY3g0MnQ1?=
 =?utf-8?B?UDNqWHRLQ0dsS2UrU0FwLzFzWExpbWhGUFNUby9XRjVGbExvQmVzQ1VTTDF3?=
 =?utf-8?B?ejhTQ2xXbnBKU1lJeVd3by94azB1bWViNlZaMngwMkxZa040STEwOGkxVHMy?=
 =?utf-8?B?SitKNytrdWdpMS9LMWQ2UjZJQldYR2ptOFgyNHlYNW1PQS8zKzFDMjVGTERo?=
 =?utf-8?B?ZnBvNk1WQ3Q2eGNWUjdaUVl6RHlNMU5JMXhoRlR5MUFHa3lUUmlxUUZ1blJX?=
 =?utf-8?B?STFHT3ZReEtRcWFFT1ArNkRsNGhzbmNwbzZIQzBmbmd1UloyaURyK2RqWVYw?=
 =?utf-8?B?SHBJalZ5d3ZNM2g2WEw1TE1UaC9LMzltWnBPeW1IN3BscmlVYWJCSnlvSW5O?=
 =?utf-8?B?K3JTcWQ4V3pEZjlDRTVXMHVFSzFvWVRocjJZNG1ubDk0RmRoZjVNVDIrZWRj?=
 =?utf-8?B?VG5rb3JuNGpmbFp1cU1MYVZVMVQwb0EvOFFTTU1SZFh2UkMvMFRvazNuOUpu?=
 =?utf-8?B?ZjF6d2hGZU9UTUt5dmF2dWRDYmpKYmZ2MmZVUzQ0QldsWmpHL0hRRDZjV2Vh?=
 =?utf-8?B?VVBaTEJOTDFGckRxbDVMVGRIU2JUNjlUalY1MzEzUjBlb2FjSHhZNWVLKzhk?=
 =?utf-8?B?N1U0NmZLUXhmc2xXWEFteGFGRFUzUmJBYWNNSkQ0QUNsTG1sYWhHZXdkSFRj?=
 =?utf-8?B?L2JSZ0NLSSsyWjhnRzQ0T2Y1cktWYWdtRXRYSW5JS2Nyb0s4SWM0RHloU3dX?=
 =?utf-8?B?TXdQTEN4UUF6UlV1T0ZyOUJRbUphcFltdWNmVVdXRTFvUFZKM3BnbkRSV3Bn?=
 =?utf-8?B?ckc0bWNMdG9ZTTVGbDR3SUkxM25CSmJMU1ArM0E2TW43SE1tem5BNDh1eGdl?=
 =?utf-8?B?WGhPVjBaWkxmbjVXWHlRNU9iUWZVVmFkMy9GYzJwOE80Mk1kWjh4bnRIbjdl?=
 =?utf-8?B?VkplZFg1NDNSODhuUlozTFJxM3NlQUdGRWZaMkNXNlgyaWMveDU4Qy8reE1S?=
 =?utf-8?B?YnN4OHhTTWlZa05BUnA3YytielFnNHh5c2VvVWQvSlJWRzlleSs3OE1Paitl?=
 =?utf-8?B?SVpNQjRNU01DcFVtNkQ3UEE1aXhqRWprN0RlZGQwNXp1eE1PMjdGVjZ2V1JO?=
 =?utf-8?B?WHNiNDZiaHQvWTlLRUVVYXZvVmV3dG9XbUdPVjl4Vk9YdEo5WFJYbFo3VmxQ?=
 =?utf-8?B?ZmpOVGJOaDgwSFpkOFFyanJwRzh0c3ZaNTEyaFNOZDE3YnRtRVpwMERFeHdF?=
 =?utf-8?B?VlE5Q2JnL2JaSGNTMUlPM2lwS3ZVdElYNjBSNkduVlBKdGxib3hkMlBTUGwz?=
 =?utf-8?B?RVVnY2k1RHA5RVEwSkZEc05HRFVZNm5zSUJCQ2orMEFQQklRcDF2a2JwZ01o?=
 =?utf-8?B?QzkzVjdobXpCS2ZPTjNzRkVXd0FvL2liM2VVeWowRXdSQkFiYndMVFlMYk04?=
 =?utf-8?B?cmEwQ1ljTDBnL2hhYkYvS0JwSXY2SEVRZmJTTFU1ZlFpN2pXSm1hRnhSUC8w?=
 =?utf-8?B?a3l6VFI1MEVISG1mckNRaU4zL2ZoQzFITC9xWHNYN2NWSCtCTEt4ZkM3SDBz?=
 =?utf-8?B?LzNobW5sOXJaalVrbTZvTmRxZGZaSlVJdXdsR3VXbmVXMUlRdUhoaHJKRndQ?=
 =?utf-8?B?U3NTbU4vb3ZxSWduUXFQVTVvNlNpMys2OVB3bXRJV3BzeU1aQlpMRmJ1NGpI?=
 =?utf-8?B?RDBmREQzSVdMK0x0N2M0akZFM0N3akZxOUkwV1JWaFNVVVZQT3VPK25uWCtG?=
 =?utf-8?B?ZDBKanhNUktTQ0U1azA4disxN0djcEhLTHY5dS9sbVRvVFk2N1A2RDRXZndG?=
 =?utf-8?B?c2NKcGgwWStNT29NOCtETmUxT1dpRmJBbFhIT1pTT29ZejZXRzVSZDZMazhR?=
 =?utf-8?B?eENLR0xyYVA1RHJYeGQ2SWtaL2QxbVR5czZwdThySlhUa1dlTk11eVFQeExk?=
 =?utf-8?B?c3pyN0FWZ0RMeUtxZGU2VGtIR1hsRG9IL3NBQ3AwMkxQand3aUo0Z0dwcTJO?=
 =?utf-8?B?dzQ1azdJSEg4d2EwWDlaTEEzS1F1cGV5cGhGQjZScmQ5WGJKTEErOElIQlNP?=
 =?utf-8?B?QXdxVjFncUxVWFcxMjdPQlFkdEdkMTRZbkROZGZIcVE2NGphVHJFU29FSHVo?=
 =?utf-8?B?RzRNcnhsb0tvSEgrWlJPY2ZTb2ltTkg0Q1hST2w3UDkrRDl2TnhtcXgyL3VC?=
 =?utf-8?B?eHBmWGl3QmxLNlcxd3pVR1RTS0ZraWRxNjNCRit0YW9nWDFoUzNWRmtOTDFC?=
 =?utf-8?B?NjIvK3Y1c2NJR0wvZ3FBelpjMHhNYVZVK0lCNHlDd21tL29TYUlOTm8vUlB1?=
 =?utf-8?Q?H8suXH3qLRxjrym0=3D?=
X-Exchange-RoutingPolicyChecked: AkmAEiRRlnQbqnf/QUf4oi4lm5vVBnJti3MYAezGCIEMCLhJC9KMiePg7qgzkdyd7Bk8xJX/cYv0/Vxfslbv/iMiZ9JFnZ/zeWEJUj53wiGWGCcHmBQImiXHNI7vFVPlKR6A2mer5NslwriHIkrUCwgR28kRiuxbCo1oVXOiJtP/aViqUaUflBbCv8+TK/k1mD4/7LCyIy6i20XPra1qSkq1q77tnxbz8eQ8JoOAI7dAzOoz9xDW2betuZ7WPmHuXAevf4Iz5k6BeWyN0DIRdaknigg7IBVgWFEVAZOcjuxJ+TRpM4o7E71nJI6cp2n3plWsSFI3aNr010LxHjuxQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d947cc98-293c-4db6-f04d-08defa095deb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:38:47.2861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m9Az6SPZa69aqp9kMuBRZUJG79MW27RWq4Ax4BjQUv972Urq0JwASzY9yM7VPAPYVATRxkn37/e/nCDkMk0D9uslH4Vm0Uw/VXPVVwWb91A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9728
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



On 8/14/2026 12:46 PM, Tauro, Riana wrote:
> 
> On 13-08-2026 15:48, Michal Wajdeczko wrote:
>>
>> On 8/13/2026 12:07 PM, Mallesh, Koujalagi wrote:
>>> On 13-08-2026 02:58 pm, Michal Wajdeczko wrote:
>>>> On 8/13/2026 10:38 AM, Mallesh, Koujalagi wrote:
>>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>>> Report 'boot status' details using xe_log_err_fatal/info() macros.
>>>>>> While around, move static helper code closer to the caller and let
>>>>>> it take xe instead of pdev.
>>>>>>
>>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>>>>>>    1 file changed, 19 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> index 4c506027fa94..85b4c125a217 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>>> @@ -14,6 +14,7 @@
>>>>>>    #include "xe_device.h"
>>>>>>    #include "xe_heci_gsc.h"
>>>>>>    #include "xe_i2c.h"
>>>>>> +#include "xe_log.h"
>>>>>>    #include "xe_mmio.h"
>>>>>>    #include "xe_nvm.h"
>>>>>>    #include "xe_pcode_api.h"
>>>>>> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>>>>>>        }
>>>>>>    }
>>>>>>    -static void log_survivability_info(struct pci_dev *pdev)
>>>>>> -{
>>>>>> -    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>>> -    struct xe_survivability *survivability = &xe->survivability;
>>>>>> -    u32 *info = survivability->info;
>>>>>> -    int id;
>>>>>> -
>>>>>> -    dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>>>>> -         survivability->boot_status);
>>>>>> -    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>>>> -        if (info[id])
>>>>>> -            dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>>>>> -    }
>>>>>> -}
>>>>>> -
>>>>>>    static int check_boot_failure(struct xe_device *xe)
>>>>>>    {
>>>>>>        struct xe_survivability *survivability = &xe->survivability;
>>>>>> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>>        dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>>>    }
>>>>>>    +static void log_survivability_info(struct xe_device *xe)
>>>>>> +{
>>>>>> +    struct xe_survivability *survivability = &xe->survivability;
>>>>>> +    u32 *info = survivability->info;
>>>>>> +    int id;
>>>>>> +
>>>>>> +    xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
>>>>>> +             survivability->boot_status == CRITICAL_FAILURE ?
>>>>>> +             "Critical Failure" : "Other", survivability->boot_status);
>>>>> Since log_survivability_info is called when survivability->boot_status == CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.
>>>> well, that's the current usage and function name didn't strictly say "log critical failure" only
>>>>
>>>> btw, printing fixed "Critical Failure" string followed by flexible %d also doesn't make sense IMO
>>>>
>>>> that's why I decided to make this function more flexible and reusable if needed
>>> Totally agreed, u made it generic one, however current usage, we never going to hit "Other" case, which is dead here.
>>>
>>> btw, "Other" is "Non Critical Failure" right?
>> only if boot_status == 7
>>
>> but since BOOT_STATUS is REG_GENMASK(3, 1) I assume that there
>> might be other values, beyond currently documented 4 & 7
> 
> 
> Yeah there are other values apart from 4 and 7. When this patch was initially added,
> it was suggested not to log the duplicate information as part of dmesg as it is already part of sysfs.

what about the case when we failed to add sysfs files?
then user is left with nothing ...

> That is the reason we print this only in version 1 of survivability for critical errors.
> 
> In v1, we do not enter survivability mode for critical errors and only log additional information
> in dmesg to aid with debug.
> 
> So generic is not necessary based on previous review decisions. But will leave it upto you.

I'll add boot_status_str() helper to make log function even
more generic 7) and likely keep it in current place as a
preparation step for future patch to use it when sysfs fails 

> 
> Thanks
> Riana
> 
> 
>>
>> so even if we print "Other" there will be still numerical
>> value "(7)" or "(1)" that could be used for debug/triage
>>
>> but I can add helper
>>
>>     static const char *boot_status_str(u8 boot_status)
>>
>> to return friendly name for all currently known codes
>> (and "Other" or NULL for unknown codes)
>>>
>>> Thanks,
>>>
>>> -/Mallesh
>>>
>>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>>
>>>>>> +
>>>>>> +    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>>>> +        if (!info[id])
>>>>>> +            continue;
>>>>>> +        xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>>    /**
>>>>>>     * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>>>>>>     * @xe: xe device instance
>>>>>> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>>>>>         * v2 supports survivability mode for critical errors
>>>>>>         */
>>>>>>        if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>>>>> -        log_survivability_info(pdev);
>>>>>> +        log_survivability_info(xe);
>>>>>>            return -ENXIO;
>>>>>>        }
>>>>>>    

