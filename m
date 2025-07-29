Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5AC5C83F26
	for <intel-xe@archiver.kernel.org>; Tue, 29 Jul 2025 00:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B8010E18C;
	Tue, 29 Jul 2025 00:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVry3sLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99C110E18C
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Jul 2025 00:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753747592; x=1785283592;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kXM+4awzi6LIg5sbjuVIiWYh8Xh8e8ZROay7Y7NtwLk=;
 b=dVry3sLSiwSlZsAc3eJBDTJN/w21uGwiLsDweakqqGy2W5r0Un0EthnJ
 4ZawRJWch2+8aNDKwe8///D8B2hBf0vEh/3mQzWUZlnt1NK90CndfHh4F
 OuGMADqEpbaIhELJar2p/wIsqzNptDZUmtq+Alpa9g24CQp3MpZZSb7eP
 DRa3BnoLnzrx86fHOPdUkFzg6q6nzBBEyZB6RPCuVzk0JB2s5bCROyEnU
 lsQ/yrMRRVGf+UqdilzsDob41pqG/cKTTFmUaH0jr07caxbv9/NuXfMVh
 s2/n2v7putbcn3O9sWpN5R6FnuzjSnGoRgndFjlxSxjcbspFKJQT+Pptm A==;
X-CSE-ConnectionGUID: vtlnDYe5TwOjajDqf/y1Ew==
X-CSE-MsgGUID: xtMkT+KfQKSXPaPxErZKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67442409"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="67442409"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:06:32 -0700
X-CSE-ConnectionGUID: gtHOxInDRfOPru+v3HAxHg==
X-CSE-MsgGUID: Zq09WjQZScql4tPURUPu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="167034522"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 17:06:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:06:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 17:06:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 17:06:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YdETgLuGuuZoPkNoHGDiXnoY0c7MXzZSxXSj3ukBFR111OyX+x0yCg8TqWDpMbE9wbzGe3VJ/ebxr+BaJTCDafYcOFPlQe5sKQgrjV45M45kp9VMd6/ZjgBJbFzJ+97XGVU5NK+Ha/obb8hy0YmRHHYUG0XqL1mHmIrNdJtEOWumhhqX7SQt7I313nCNyq0d4zVL7HemYtrK36NSIOhHIo4Zf/qGB8cK2rvoH/Etagadq37MiTc92Uvi0xkY6UiLP4zUSVcknFtGW2rRVMqni+J/efNiLl4yIw6Zj0ALS1klPxt7835AHoNieKCsH7614WkOfj5gUQm54+LhBRUS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahj1c9+Ploz5TsWHMkm0W3CzBxxR+8ZWHGB2GxG5N2s=;
 b=PuUnUjtXEdKjtcbsx1Lvnc072cmqevNFo41W0mbKkASkpuI+R9vaaSsrx7+XrwChkitoqPAIdFWLdcFA0fQuuj+lgCyb2CalHz9az39EG6S9Kj7HCw7w1TJeMJUygmY6PlFQN9ijBrFqxlZEHtjyJ25A373/0pN0mjHNK+S0ep1CdI+uYkZMWoG36vbHFHkFSxbxHlTjoyEsGYwp/abkGQ+jSBdNZ0425iG+xWxf2H+Oqa0VYTFsJx7N2uqoTJbHVpEptzoLr3Eh2w++m+RA9Gf2H+o7bY2QQ2algysNBeen/ZRorIXxJtmfI7uAno5YjFGK0FXeXLh4vvz4jVsuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 00:06:17 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 00:06:17 +0000
Message-ID: <c0281f35-d672-41ea-9bef-a0bb588f060f@intel.com>
Date: Mon, 28 Jul 2025 17:06:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] drm/xe/configfs: Reintroduce struct
 xe_config_device
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-8-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250727172009.587-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0237.namprd04.prod.outlook.com
 (2603:10b6:303:87::32) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed63e60-168a-4cd9-c0c0-08ddce33bd91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N09GekJxYmtUZWZuY29nNDBodllUclNnckZrMDNrRllJS0c5NWdnaDlHbENE?=
 =?utf-8?B?SlZjYUIxY2pQaFltK200T3JFQVZBOVVtK3FYcFJYTXcwTm5KaXJCb3lhaFY3?=
 =?utf-8?B?YlVNT0E0TjVpUXlITk1GempqWEw1T1BHQUk1SUM4czRwTmNrTytNM2NPZ0Yx?=
 =?utf-8?B?QVBReU0xaWZmeWc1Q0t0QXBZSE5zbjl5S2RSS1VZSkFPdXZwalZtdjQ3NVNU?=
 =?utf-8?B?RERrR0k5Y29rR0NjZzUzK2w4OWtZVFdTU3ZKdHp6eTFsSFF0NnFFTWNNYWFy?=
 =?utf-8?B?SkQ3QmFNZG9TL0xaSHZ5MmpuNTdVOURnZ1hoVHRLL01WQzBYTGJsc3g4SUlQ?=
 =?utf-8?B?YmdjK0ZRdnJTRWZZWkk4ZkFrd0VvQXZPdFdUdkRETThhQU9UZTI1TXNxdWpG?=
 =?utf-8?B?WkV5V21rVHNVbmF5bmRuTW5JbzAxNko1c2tOQUhST1NrdlJscXhUSDNTYXlM?=
 =?utf-8?B?MXlLcVFtS0oreUVvcWliUVJheVRZM1FTbGFRNDdncWxha0VlZCtOR0tzM3Fz?=
 =?utf-8?B?eUE3cHRZYWdGQUhHTHhNL0tjeW5VczF4VXZtWitkeDluN0cza2dTZ2pSMVR0?=
 =?utf-8?B?T3hXNzNoQjhQWS9tZEk1Q2VldGtMU013dkZhQ0hVeGxycVl5blJreittMWVT?=
 =?utf-8?B?MHhHbTYvejdPMGpXMm1jWldkNzlWVGVuNnBhenlkU2FRaGNXbnYxYzR5aWRo?=
 =?utf-8?B?dFB5amZkN3oxbG5YcVZ2ZnkraTNIcVBQM2RlYkpBVHlTb3h3TlZPeHZoNytH?=
 =?utf-8?B?NTh2OEgzNHJCQm05RVI4V3U0SXpVbzU3bCtSNk5EemdGK0tHZllrTjY0bGFW?=
 =?utf-8?B?TVNJR1lKYzRoQTF0R3JMQXVPUWFYZENlVGFDOTB2RHhFQWJJOGVYcjVwVk84?=
 =?utf-8?B?RnBWSGtoTmk5WGFXRmxzZkhOdmhPcVRHTGxJTDhLM0ZiSitiUkpnbm9jRjEr?=
 =?utf-8?B?a0xOcG1zamZRNkc0S3ZvWi9pejZEWUZRYXJWSG5jQ01xeWM3RzQ3TEdrdGRQ?=
 =?utf-8?B?TzZTcWdBS2xOVnU4UzRVNnB2VUFER2ZlWlJ6K1JMbnpneUt3c3J2K0pUREY1?=
 =?utf-8?B?WTkwS05abHMzWjFqR3RCNlM5QXgrT1U4blZLaEd5NXpLeDJWTVJ5TWVlMVJZ?=
 =?utf-8?B?bldyNXlURjBENXRvUi91Umx5VTl3UGU5VVd1OEVwcDQrTkk1YzRXTkVITklT?=
 =?utf-8?B?QUhlWTFrSWgxazJXOFp2ZHJGcCtMUDdTQzdRYlFLSGxqdTdJWmttOGVoa09Q?=
 =?utf-8?B?ekdmM1VwdmFXOGdQMlhMZ25SekdzQjVncUFLRGV3UDhNMVgzV3JpU2JTZ0dk?=
 =?utf-8?B?TWRlSTJDLzlmRFlBZ2lxU01ER0ZlbDVIUnlvby9tV3g3cCtETm9PUFR6S3Av?=
 =?utf-8?B?N1luSVN4VG9SbThKRjhHTTRyb2czanU4VmpDUGRzUWtUQ1AweEE3NEJTQTZU?=
 =?utf-8?B?cVg4TmNaRndiQ0o0MFkwdHVIUkNTVjI0SlJtVnNsUTVPVWdXdGdJYUt2Sklw?=
 =?utf-8?B?bGtGZDJsMTYyRm5oVk4rSDN4dE5CU04zSTFOMUNVRUpBL0tVMGlzR3dhQTg0?=
 =?utf-8?B?UmhudTV5VnBJYzlNejc0R1dUT3lzNHY0aFhqV0hDb0ROZVJHaEtwZGN1dmR1?=
 =?utf-8?B?T2x1b05UdjJ0RGhZSTZ4T0c1TlRoT25nenU2ajlkSk5pc1pqdjB1ZWRTazh3?=
 =?utf-8?B?RnIvaVkxZlZQVk1zekRXQ09oU3RhN0dtc3grREhLZk1TMDVkZjhoaXp6cEZU?=
 =?utf-8?B?bWZMUnJKei9ZS1NBUHBRdXlQVUwwVXVFdmdnZmwxTnIzekRYbWZ4WExSVUxF?=
 =?utf-8?B?WUtYRTZJdGRhRmZSN1ZtV3h0VUZ1aUlrYmFnMzdhczlBRWlXdlhVUnFnV0pE?=
 =?utf-8?B?bWlTSTgrTDlXb0cwNVNlZ3hDZEx3S2xqVktTbDFFdHVUaW1MTXdZSnhsOEN3?=
 =?utf-8?Q?jTII35IXZPE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am9rZHB3YnBTYkZLREU4djNlWWUvdFZCTUNBRWp3b01HajZ3WDgrTjRUc1o1?=
 =?utf-8?B?MmZhdis2TG5Zc21TTmFPemd2aFBPS3NSZDlpa0NoTEZkSXNzSjFoRFl2Ym5z?=
 =?utf-8?B?ckZmeGszV095SUNlWGVQaEF3bkhXNEIwcUVmYmcrYUNYaFJhNStWNHZxaGxG?=
 =?utf-8?B?eEVvZ1RaLzVwWW9hTGo2NVgxdldPcXkyMzRyNVZKMU1STEVBaWIvR0N0akxJ?=
 =?utf-8?B?MFYrdFRYQklnVHNxMjVZZSt5UnJNUmpBY096dm9kS21xRTZmTm5qei9QbjJV?=
 =?utf-8?B?VjkrTkZmNXJwUnhDcGRjb3ArckV0UjF5U3liaDFFV2RkQ091UFFMV1cwTHhS?=
 =?utf-8?B?ZHcyOStsZnFkK2FWeWVIWFJjeHlwanRnbXpyZ0pITm8zZkJ2VVlpTStJUW1s?=
 =?utf-8?B?dWdpQ0tVVS9velg2S21xVktDZy9hL00xOTBKL0N3UkpjYUJ0Vzh5SjVuTXZH?=
 =?utf-8?B?eno4SzVHZTZLcHNZUTc0YmtQRDhtNkZnc0lRaXdtUTZHR1cvMEdudGtja3Vz?=
 =?utf-8?B?VGpoRDRSTEl2Y3RMWlMzN3R0bzYzQ3ZGeTZubTR4Q0dqeFoyVHlXNXhJcndV?=
 =?utf-8?B?bjRlWHhyVkNwWTU5dHhsY0tMWEV4NnhESGtOcWc5cXlFZ25WN282T1VJZ3Ar?=
 =?utf-8?B?RW9iMHV0VHhTRzJOQ0I1WlgwSUdFd3lXWTZuYTNNV0tLVk1aeVRpaC9Sczl1?=
 =?utf-8?B?Wlc3aGVYMjZLRVhaRWhpVTVPc1JsK3VZRkphZ3lPSHhYaUoxNFU0aXZRcmFL?=
 =?utf-8?B?QW1kQTNZR3VnblVkS1Z6Z2hYZGtqUER6ZFVsZk1yUGVpcHpZa1Zzc003WTlu?=
 =?utf-8?B?U0Y0NHoyK2haYWZhTFdvYzN1SHJLYmdQd1JGN2hSanFlOE9nSnpuZG05Q3Fm?=
 =?utf-8?B?Y2Q2NjdPWFlmSUdOSlZRaGVNNkgzb3YxZ0tabDhyQzJaSnZNYkUzU0V0R3I4?=
 =?utf-8?B?bVl3YUk5dWxWYXlRYXY4YTNwU3k5Zyt5TTJDQzZxUDUwUE0vTU9CRnNVQ2Vk?=
 =?utf-8?B?VnZCVXdRNUNKaWVTZ1YrcXJHRlVHb09EVk1LL083U1d6SUszbWJZb2FpdTdw?=
 =?utf-8?B?U3kwd1AxTHIrdkJxZ1JXYUJqYitTakY1MHNYcE9HekxPWlhHc1V4ZWpmc2Qx?=
 =?utf-8?B?bXBuOGZOZ05VRWphcFk2blJvNnl2U1hFVUx1T1dVRFQwS1dzemFETkMrTkw3?=
 =?utf-8?B?U3o4ZFA4RU9DWDNHOWF2K0xudTVvMVVMUmUreGhaTVJxQVgwM1VndWluWnZE?=
 =?utf-8?B?dWhmM2J0MXYxTGc1OXNleGF3QmtoZUo4RjJYZGNORzU5NG11aEtmUWhzemlE?=
 =?utf-8?B?bXlXWmdrUGIreWpMb0UySGNYMXh0NWpMbEtldkFtcWxtUlpvcUFVRmdBL2Zr?=
 =?utf-8?B?bXUvWEVRcmlIRTRBVEVsZkFsbkZOTithQ1NueEJMSE1KelNabnNNK1Q0eld5?=
 =?utf-8?B?dm1IY0FSYm1pNVBQN3QwcjYzRjJDK2c5STFBL1ZlVWN1QTcyMlBNUTA5cFA5?=
 =?utf-8?B?SUxwMHRRRFZRQUlFR3Z2WFVleGFpRVl5Tmd4WXlUQ3RuYVpxNHhMa1V1cmxx?=
 =?utf-8?B?akFOazErUi9IaTBGanNvT05jaG5FWk9aVjlLQnRFT3dESnlxS3lZcndST3No?=
 =?utf-8?B?RUJIYy9ybmg4ZFZRc2daanJqNXMzUm51N3hLaDB6OUNJc3VKOFRld1YvWk9Z?=
 =?utf-8?B?VnBQZ0N2Y0VWMGE0TUsxamxsMFBSajcrZWw1b3c4MTlmQ3V2bFdqV1U2NnRU?=
 =?utf-8?B?NkdPUjJNSHhGdTYvYmxUSVUyOTNrekhFT01aVVBzMXllcGQybmpHZm1pY3ds?=
 =?utf-8?B?eFZnS2pNKzQrUk81emYwMjV0U2cxd3FDSTgwbUlxdE9hdmRCNHp4RTI5dTEv?=
 =?utf-8?B?bGdUSE9xQXF6cGRJNVUyaWkzcTl0OVNQTzRuaWRDTmNmdmF3MWduZjduMVhK?=
 =?utf-8?B?NlhXZTdBOVZRYlYzVnd6S1dDZXIwK1Vjbk16dmd2V0o3eC9MRWFHeEFTOTdm?=
 =?utf-8?B?eFMzZUg5NmFySVNOSXdzOFdNSzRESkJ6OUJ5K0lDRGxPNFlscW1VY3dZYXBI?=
 =?utf-8?B?VzFBMDFHcVZwTmFCano5T3l6blFuTUptbE1FR3JVbk9nUmVra2FuMDM1anVy?=
 =?utf-8?B?TGpvY2pFaDhiMngrUE93U0d6VjBKSkVScFREcTFmd2YzYUhSUlFwMWVqU1Fy?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed63e60-168a-4cd9-c0c0-08ddce33bd91
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 00:06:17.6888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBNcpFzAhILGs9sIkWqSALMtH2inC38ONSO7u7t2uR+WuNOO+qrzn/YrJGEb7D825nOo0seW2TDBvex8S6keI5oeZI6vNBVMGMfrvPskIxA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
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

On 7/27/2025 10:20 AM, Michal Wajdeczko wrote:
> This time it will hold just pure configuration parameters, without
> any configfs related stuff. This will help us define defaults data
> without wasting space for unneeded data.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/xe/xe_configfs.c | 27 +++++++++++++++++----------
>   1 file changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index f5a780b8bb80..a5f13dd779c7 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -92,8 +92,10 @@
>   struct xe_config_group_device {
>   	struct config_group group;
>   
> -	bool survivability_mode;
> -	u64 engines_allowed;
> +	struct xe_config_device {
> +		bool survivability_mode;
> +		u64 engines_allowed;
> +	} config;
>   };
>   
>   struct engine_info {
> @@ -119,16 +121,21 @@ static struct xe_config_group_device *to_xe_config_group_device(struct config_it
>   	return container_of(to_config_group(item), struct xe_config_group_device, group);
>   }
>   
> +static struct xe_config_device *to_xe_config_device(struct config_item *item)
> +{
> +	return &to_xe_config_group_device(item)->config;
> +}
> +
>   static ssize_t survivability_mode_show(struct config_item *item, char *page)
>   {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_device *dev = to_xe_config_device(item);
>   
>   	return sprintf(page, "%d\n", dev->survivability_mode);
>   }
>   
>   static ssize_t survivability_mode_store(struct config_item *item, const char *page, size_t len)
>   {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_device *dev = to_xe_config_device(item);
>   	bool survivability_mode;
>   	int ret;
>   
> @@ -144,7 +151,7 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>   
>   static ssize_t engines_allowed_show(struct config_item *item, char *page)
>   {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_device *dev = to_xe_config_device(item);
>   	char *p = page;
>   
>   	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
> @@ -199,7 +206,7 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>   static ssize_t engines_allowed_store(struct config_item *item, const char *page,
>   				     size_t len)
>   {
> -	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	struct xe_config_device *dev = to_xe_config_device(item);
>   	size_t patternlen, p;
>   	u64 mask, val = 0;
>   
> @@ -280,7 +287,7 @@ static struct config_group *xe_config_make_device_group(struct config_group *gro
>   		return ERR_PTR(-ENOMEM);
>   
>   	/* Default values */
> -	dev->engines_allowed = U64_MAX;
> +	dev->config.engines_allowed = U64_MAX;
>   
>   	config_group_init_type_name(&dev->group, name, &xe_config_device_type);
>   
> @@ -334,7 +341,7 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>   	if (!dev)
>   		return false;
>   
> -	mode = dev->survivability_mode;
> +	mode = dev->config.survivability_mode;
>   	config_group_put(&dev->group);
>   
>   	return mode;
> @@ -355,7 +362,7 @@ void xe_configfs_clear_survivability_mode(struct pci_dev *pdev)
>   		return;
>   
>   	scoped_guard(mutex, &xe_configfs.su_mutex)
> -		dev->survivability_mode = 0;
> +		dev->config.survivability_mode = 0;
>   
>   	config_group_put(&dev->group);
>   }
> @@ -377,7 +384,7 @@ u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev)
>   	if (!dev)
>   		return U64_MAX;
>   
> -	engines_allowed = dev->engines_allowed;
> +	engines_allowed = dev->config.engines_allowed;
>   	config_group_put(&dev->group);
>   
>   	return engines_allowed;

