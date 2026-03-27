Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67710ED65C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:47:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0262210E390;
	Fri, 27 Mar 2026 11:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI7viDpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40C710E390
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774612068; x=1806148068;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dQ6k8C00g+POzQqUU9gaY6Tz7FZSnsu2SGIeEA+Vl4Q=;
 b=gI7viDpWeOXzF6V2nM91OgnBPx8wDR5CtH8v0BH13MOjT63siyfBmSM5
 4jP07sWUpDFi6tTX5qEvmaoArqNjdlwjh1x12qrfK52vF42siYz6MFoY8
 pZYZPlUH2WD50fvXjlkn7Q0LfRU24p4y8JIe80tM3jcLzxzlI5EsKdLIH
 qUSZXWQC08OYqnVuMRKdZo4jkjqYHjWuXsAQRRKBzGemRYlIVrpTbWp+3
 jBii2cWWT9QuphJfpacP7LpmkSK+pvvPuaFlgz69XCrfVDPF3evLn632s
 AzZGDHsmVR2s1d7qHumSAAfqqP6k8HGoyZbnWCi1aWX4SOimYKHsW/CHO A==;
X-CSE-ConnectionGUID: VCWZyqB4SPWmXW4ZWH9W1g==
X-CSE-MsgGUID: FCGFoiOKT9KjsMbIXCadBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="87157649"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="87157649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:47:47 -0700
X-CSE-ConnectionGUID: gjjNvrBWQg6/hX5qvECB8A==
X-CSE-MsgGUID: ubc0ospMR2qACva3F3+pfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224334818"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:47:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:47:46 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 04:47:46 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:47:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm4o/WMODSFxBUEsRlG34RxbYY56rNh3J6J2XJGRCEghMbNFnaAyF1q23tX5yP/WX6B9k0NO7cygLJZ/v+6Vb2OapGaCeKD/CQ7LoNSPdMpsldiFyCz8Fz/mgM3NU/l9S04CyJZP9uYd4VlUdQ429BZlPGbxLSnHSkB3GcvJVWh41mLLyKnl+geItpXVe+rEUYCnmZFrRawxRm6iNjfBD1/hEM8/QDK8Y791pgXHvMrjmtaseJrrI99oBkEZ6WKfx7+XozDKWROWYDOJ3CshqKuMA00eIKjxRCCtlXM1fdxBwLdZsBQ0FSYuAOV71RZONhIXjL1zOQlXTfuvjjSZlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dg+A3E6KCsMFmbXetBejQ6MZ7Nq5vDIP334Fv/Sp4I=;
 b=kfwrjgXHKUo5OALPIKualyiKpFiq2/Hr0NZC0tufdGLH+MxWJUS9nGE6KqTz0qGDpbprI/vNtz05NfCCLbgx79W027/g9S4xhyKOf7ICqsgK87+Dr++fG3WAJiV2c16p4m6f0gAGhMW1uRo6rOJ1+LkopkbHUHZxaJtPNaDagBJnNChvI4N+UAriHDHJGbLUoT2lylHS7oVB6nJQLYvjms0unKXyI31FScNSy74n6LOzJLIJXYD+zH6Z39TsBKgb9gthMX7qq8TDD/bYIG+Hdqm+oanTxmys0PzGOvaZ0LrTODk4RXoc8pdMUc9bJz+Cerbc2W+jbuloJm2yaXJxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB8014.namprd11.prod.outlook.com (2603:10b6:510:23a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Fri, 27 Mar
 2026 11:47:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 11:47:43 +0000
Message-ID: <623189c1-4006-4553-84bd-4f633ad4831f@intel.com>
Date: Fri, 27 Mar 2026 12:47:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
 <cf383a64-ae77-4129-a22a-88353946103b@intel.com>
 <2caa6dc8-26ec-436d-9326-04444eb01133@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <2caa6dc8-26ec-436d-9326-04444eb01133@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0090.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 749ce77a-409f-43ed-c267-08de8bf6a7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: ecr/7gf/EmDcv1ogPTTuewGNvhFkN9gEz1TFuGWZTnJXO1h+c+ubbTlHHdSKvdgAK1v+G7SEWQjc3dfbAO5ejeAqfoNuVdGnb0vULNROCQBQBxUnDMAIpX6rUs1TucW7UYQA20dOlUDX8pNljmT7pvvbSqvNSr1E8cI8zxiHfIAN8RooTG8jTJs5IyQ4lA97eJMtTltBAYauBcFyHPVLL5zK3OaRrFY183ezL2wzGCV6ooriahdJ928ISBR8O1XXqnqx/UZRBBYR62JQFhhhRokqQEvJfTCSdCVOy1/Sz2wSzsoUt3EKvquKxLs8E/1WQD0uIgTYNY1Q+ENV63c3P9VarDGUr2xp0rUuYGm7Q/mTXs5TWLeB7/tx4y5/Mv8UYepJqAh95POx59u7mvTQpHiRWmJcKeYOqpTcGHl/T4vkir7Kb2lZtHs+HhrmXwClFqBs4oyabnJgVVc1uzRbQBx/0/EUChirneFFJVhxUrX4HvYV+f8QD9W0Vt4z03nnY9DXWhdkG+BRDptkVim+Sfs2kYWOhvW78gO5oTvIephN9cveH3tdR8BALdHiaPEp6ko3QWwA04dJPG0ty1V9OZyB2r89fAB6aVtirvr6FNK0xJ02lQhqNI1x86PaJ1jkR5eVFoG44/qhKYQYQGwTHiheI2iNTLDD8IqzjznkcljgGHz8HwVgSj993mhFEjv+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFN6ZzBwM2xTSnNKWUY5a0hNQkVJK0txYmRSUXp3U016aFFXSUI1TlBzTWtQ?=
 =?utf-8?B?a1VZMUpyRWFHVEdiTDV5anFvbDh6anR3U1FCVlZmRG01WjlUaUFPZUtyY2dJ?=
 =?utf-8?B?Tk5uZGdJS2JTVllCcEt3eTBwcHlpeUxFOU00cmhYZTczZGo2UXBHZ3JBWTZN?=
 =?utf-8?B?S3BDdFlXd1JjN2kxUU9pN2xWZ0dpSVRPSEFMb3RueGxFTVdwdCtTdXliNzdh?=
 =?utf-8?B?eE42T0JwcEx5NzlYMFZ4SVRlVDlUV3FiMDFGTzBrTzdVdWZTZGxVcHZlQk9a?=
 =?utf-8?B?ODIxVUMvNHQ2TnptSVd0YXV4andLWVEzay9IMm43MlEwaWFXWWMrSU4vVVdP?=
 =?utf-8?B?eE0rVEFOYnAyOEo3K0RlaGxzSFRnN20xMkxDanAydDIrVXdORGVGeW1JQlBG?=
 =?utf-8?B?bmx2YXF5N2luYUpMb1lWeXNOYmVnRC90T3k0LytNVlVwN2NNSHFvOUhLS05J?=
 =?utf-8?B?UUpqa3Z1Ynkrd0JXS0tKQitHVkEzS2tOelpQVVJLVjFVQjNFek5NbksrTDlT?=
 =?utf-8?B?M3ZlNURBcEJpSmN5K0g3NlUrcmNUb09wQkN5VkZTZGVaMlU4Uk5ZOUxCa0Ri?=
 =?utf-8?B?dkk2YlJtRjE0dUxncnh4MmhvUjBBdjhaOFdhTy9sc2tqanBpUEw0YmNPbk1y?=
 =?utf-8?B?ajU5VUMrcktPRHJmc3JmdTBmc1JWQjRPRmNKSjdSNkVhcHVOWXRYaFhDaW1W?=
 =?utf-8?B?M3ZpbXhXR0trbldJSjllS2FsNW1zU1lOc2hTZW02eEZURm90aGxoUEhrNmlZ?=
 =?utf-8?B?bHlrTWlORnoxWk1jMUsxV3pPS1g3ZlVnNWpSbEw4OFlicVlBSGZCQVVTZVFU?=
 =?utf-8?B?amNPVU45UFc0bmFxdlRFMkl2UkZOQnNZcjZrZFoyQm9wczRHam1jaUVndmhY?=
 =?utf-8?B?emZxNmptY1VUaWt4dUJpTGt6am95UlRLUUhoZjdYaXZLTG1BUkpvMzZLV0pz?=
 =?utf-8?B?TlhLbWhWMTBUaGQ0c2NoN3R5N2FxT1VMUmEvclBRZ1pPenAvcTM3TDZ5eEds?=
 =?utf-8?B?TjRNMjFLd3hNYmZrVE1tMEVRZGdTLzhhcm53d2YyQStaRzRqMEZ0M2Y4M0gx?=
 =?utf-8?B?c1lpQkkralc3cTBlNXRCaDBEeDNGQlk2VmFRMDRJaHcvSHd4YlB3Ym4vbnNm?=
 =?utf-8?B?SjN5WnpVWTB2STNkSm9QTzg4em9wQit2YldydXo2UXh5MTJaVTU3OXVYTTNn?=
 =?utf-8?B?cmdobTVTR015UUVac2ZJZnltanZ0a2VSVHZUUEI5MFNUeDBVWG1FVzY2N3No?=
 =?utf-8?B?ZGU0R25pSjM5NzgzKzFKNjhKU3MwRk9ENDFuNGFmZThuOHhNcmFab2E3Mzcz?=
 =?utf-8?B?L3BEU0lFZElhQjdNWDRHWHFXQVhPL3NpTXRIRGgzT0tzZUlzeHgyelJyQnBW?=
 =?utf-8?B?NXVRc0xPd2R4MHZCZVF2SUVrYk9zM09YN2dWUWszelVOSUpoWjhoZkFlSE9l?=
 =?utf-8?B?MHY3Z1ZMQyt6Wml5YXV0WU9XSUJtdlkvd1drMHhqNDRnemxQd2tMMk8wbk5X?=
 =?utf-8?B?K3dHTDJ3QU1ocElldUNqTHh0QmRZVUQycEpXTTlFU3BUZllRblVWLzFydVJS?=
 =?utf-8?B?TUZoM2lFYkIxd3R4MzhjalRGdU81UHRkQ05nRkt4MEtRUk1pTDlPT0E2MnJu?=
 =?utf-8?B?cWRPMk1GWVJYaXlyeTF6MTUrV0F3YnpSU21zdVNVMkVWNGhYVnZISUFzVzZV?=
 =?utf-8?B?NEhOTTFNb1V4M2JuZG9pK094U2JBZE5telBNMWxMejhZY2MrVzZoaUtCdnBK?=
 =?utf-8?B?TkNqMDVXZDVPS09OMllMZ2M5aTZBbWFUbWlYRG81T0lxZmhCSHBjTXRvdGNG?=
 =?utf-8?B?M3E0ZklHUG9oU3lKUEE4V2ZNOTJUTzgyL05PK0JXV0lybzNXaHVUK2txN3pT?=
 =?utf-8?B?RXdJMGgxMXRjYThDcmJmSDRWcXI1TTRwYTYxYzZpZHI4T2ZKSGtNek5XQm5D?=
 =?utf-8?B?b211SmJjRWFBTUJpS3hRa1AybXdZeHJIT0dKQWpDSmg3a1N1UlBQTWpQUnIv?=
 =?utf-8?B?UGJ5N3A4R0M2bmh6Qm8rUTFNZm1HQng3c08zeThaeGRVelhibHdnc0J1K0h6?=
 =?utf-8?B?SDQ1dkFRLzFOdXJ4M0dVUXdxY1Q1NmE0RTdRWGVaZStBRnkyeU1sNlN3NDQ1?=
 =?utf-8?B?RldqVXAvaHRVMXNlUzhwd3RBOGszaFg3aUVXSGhYdk1RWTZzbXByNG9WUDZ5?=
 =?utf-8?B?bHdpbFNBNmJQMjlTTVRsZWJkc203cEZkZUJEeFR2RGlOdGxjc2tiMzRsWi9i?=
 =?utf-8?B?WWVDb3JDdHd2ekQ3d2hKSkk0Q2Nuc3krUGo0bkNPdG1VVlV2S0RVbmUyRFlD?=
 =?utf-8?B?aWtPM0s1TUxHeVNJc0tiUEpiL0tXNDJpdkEwV2Y0M0RRdmpPc3VuVnk5WE50?=
 =?utf-8?Q?HTdwBqeGPCtkGsns=3D?=
X-Exchange-RoutingPolicyChecked: cuHy/Ky0elg+YHplvc7wpZGz0S/4ML/W5cAyfsASeoWlswtrTUENhQEaFkeVyG9DssRjCZbiigEDRoANCtymwnO8qD6DRVS+TGyfqAFstP2Rmj+cqDgjBLhMgGdX7/5MDckIJr4tJ9auQ4Ihbh+6OnDNR8bUJFmZe3PC+I+O9cRw5bYTMbgdV4opRVK79wV0ArQ0bco0bSJLyU5gNKdol1G+pN1aXC8P4R5YgMcQXN7j7hqWsN/YScxDDMYlt+lrAP5Rczk4P8OrIRGYNPgkGTLRWzhorN/BP/YIuimVRQFf0P/odMcOvRJXqzr72ysKWFsEn5DvbzovWTmwzqkAWw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 749ce77a-409f-43ed-c267-08de8bf6a7f1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:47:43.1561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1n91WIueueW/L22xp5uhjRVzp1p8X4QvRpCPhGw9VfAFv8Q6aWbjTJaPYPGIYj0fFMM4xwdea16oHyNdBtghEBgwDu/zg6TQFLouS/SLIu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8014
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



On 3/27/2026 12:17 PM, K V P, Satyanarayana wrote:
> 
> On 27-Mar-26 4:37 PM, Michal Wajdeczko wrote:
>> On 3/20/2026 1:12 PM, Satyanarayana K V P wrote:
>>> The suballocator algorithm tracks a hole cursor at the last allocation
>>> and tries to allocate after it. This is optimized for fence-ordered
>>> progress, where older allocations are expected to become reusable first.
>>>
>>> In fence-enabled mode, that ordering assumption holds. In fence-disabled
>>> mode, allocations may be freed in arbitrary order, so limiting allocation
>>> to the current hole window can miss valid free space and fail allocations
>>> despite sufficient total space.
>>>
>>> Use DRM memory manager instead of sub-allocator to get rid of this issue
>>> as CCS read/write operations do not use fences.
>>>
>>> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>
>>> ---
>>> Used drm mm instead of drm sa based on comments from
>>> https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
>>> ---
>>>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
>>>  drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
>>>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
>>>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
>>>  4 files changed, 53 insertions(+), 47 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
>>> index d4fe3c8dca5b..4c4f15c5648e 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
>>> @@ -18,6 +18,7 @@
>>>  #include "xe_ggtt_types.h" struct xe_device; +struct xe_drm_mm_bb; struct xe_vm; #define XE_BO_MAX_PLACEMENTS 3 @@ -88,7 +89,7 @@ struct xe_bo { bool ccs_cleared; /** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */ - struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; + struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT]; /** * @cpu_caching: CPU caching mode. Currently only used for userspace diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c index fc918b4fba54..2fefd306cb2e 100644 --- a/drivers/gpu/drm/xe/xe_migrate.c +++ b/drivers/gpu/drm/xe/xe_migrate.c @@ -22,6 +22,7 @@ #include "xe_assert.h"
>>>  #include "xe_bb.h"
>>>  #include "xe_bo.h"
>>> +#include "xe_drm_mm.h"
>>>  #include "xe_exec_queue.h"
>>>  #include "xe_ggtt.h"
>>>  #include "xe_gt.h"
>>> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>  	u32 batch_size, batch_size_allocated;
>>>  	struct xe_device *xe = gt_to_xe(gt);
>>>  	struct xe_res_cursor src_it, ccs_it;
>>> +	struct xe_drm_mm_manager *bb_pool;
>>>  	struct xe_sriov_vf_ccs_ctx *ctx;
>>> -	struct xe_sa_manager *bb_pool;
>>> +	struct xe_drm_mm_bb *bb = NULL;
>>>  	u64 size = xe_bo_size(src_bo);
>>> -	struct xe_bb *bb = NULL;
>>>  	u64 src_L0, src_L0_ofs;
>>> +	struct xe_bb xe_bb_tmp;
>>>  	u32 src_L0_pt;
>>>  	int err;
>>>  
>>> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>  		size -= src_L0;
>>>  	}
>>>  
>>> -	bb = xe_bb_alloc(gt);
>>> +	bb = xe_drm_mm_bb_alloc();
>>>  	if (IS_ERR(bb))
>>>  		return PTR_ERR(bb);
>>>  
>>>  	bb_pool = ctx->mem.ccs_bb_pool;
>>> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
>>> -		xe_sa_bo_swap_shadow(bb_pool);
>>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
>>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>>>  
>>> -		err = xe_bb_init(bb, bb_pool, batch_size);
>>> +		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
>>>  		if (err) {
>>>  			xe_gt_err(gt, "BB allocation failed.\n");
>>> -			xe_bb_free(bb, NULL);
>>> +			kfree(bb);
>>>  			return err;
>>>  		}
>>>  
>>> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>  		size = xe_bo_size(src_bo);
>>>  		batch_size = 0;
>>>  
>>> +		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
>>>  		/*
>>>  		 * Emit PTE and copy commands here.
>>>  		 * The CCS copy command can only support limited size. If the size to be
>>> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>  			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>>>  			batch_size += EMIT_COPY_CCS_DW;
>>>  
>>> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
>>> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
>>>  
>>> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
>>>  
>>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
>>> +							      flush_flags);
>>> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
>>>  							  src_L0_ofs, dst_is_pltt,
>>>  							  src_L0, ccs_ofs, true);
>>> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
>>> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
>>> +							      flush_flags);
>>>  
>>>  			size -= src_L0;
>>>  		}
>>>  
>>> -		xe_assert(xe, (batch_size_allocated == bb->len));
>>> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
>>> +		bb->len = xe_bb_tmp.len;
>>>  		src_bo->bb_ccs[read_write] = bb;
>>>  
>>>  		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>>> -		xe_sa_bo_sync_shadow(bb->bo);
>>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>>>  	}
>>>  
>>>  	return 0;
>>> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>>>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>>>  				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>>>  {
>>> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
>>> +	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
>>>  	struct xe_device *xe = xe_bo_device(src_bo);
>>> +	struct xe_drm_mm_manager *bb_pool;
>>>  	struct xe_sriov_vf_ccs_ctx *ctx;
>>> -	struct xe_sa_manager *bb_pool;
>>>  	u32 *cs;
>>>  
>>>  	xe_assert(xe, IS_SRIOV_VF(xe));
>>> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>>>  	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>>>  	bb_pool = ctx->mem.ccs_bb_pool;
>>>  
>>> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
>>> -	xe_sa_bo_swap_shadow(bb_pool);
>>> -
>>> -	cs = xe_sa_bo_cpu_addr(bb->bo);
>>> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
>>> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>>> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
>>> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>>>  
>>> -	xe_sa_bo_sync_shadow(bb->bo);
>>> +		cs = bb_pool->cpu_addr + bb->node.start;
>>> +		memset(cs, MI_NOOP, bb->len * sizeof(u32));
>>> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>>>  
>>> -	xe_bb_free(bb, NULL);
>>> -	src_bo->bb_ccs[read_write] = NULL;
>>> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>>> +		xe_drm_mm_bb_free(bb);
>>> +		src_bo->bb_ccs[read_write] = NULL;
>>> +	}
>>>  }
>>>  
>>>  /**
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> index db023fb66a27..6fb4641c6f0f 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>>> @@ -8,6 +8,7 @@
>>>  #include "xe_bb.h"
>>>  #include "xe_bo.h"
>>>  #include "xe_device.h"
>>> +#include "xe_drm_mm.h"
>>>  #include "xe_exec_queue.h"
>>>  #include "xe_exec_queue_types.h"
>>>  #include "xe_gt_sriov_vf.h"
>>> @@ -16,7 +17,6 @@
>>>  #include "xe_lrc.h"
>>>  #include "xe_migrate.h"
>>>  #include "xe_pm.h"
>>> -#include "xe_sa.h"
>>>  #include "xe_sriov_printk.h"
>>>  #include "xe_sriov_vf.h"
>>>  #include "xe_sriov_vf_ccs.h"
>>> @@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>>>  
>>>  static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>>  {
>>> +	struct xe_drm_mm_manager *drm_mm_manager;
>>>  	struct xe_device *xe = tile_to_xe(tile);
>>> -	struct xe_sa_manager *sa_manager;
>>>  	u64 bb_pool_size;
>>>  	int offset, err;
>>>  
>>> @@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>>>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>>>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>>>  
>>> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
>>> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
>>> -
>>> -	if (IS_ERR(sa_manager)) {
>>> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
>>> -			     sa_manager);
>>> -		err = PTR_ERR(sa_manager);
>>> +	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
>>> +						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
>>> +	if (IS_ERR(drm_mm_manager)) {
>>> +		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
>>> +			     drm_mm_manager);
>>> +		err = PTR_ERR(drm_mm_manager);
>>>  		return err;
>>>  	}
>>>  
>>>  	offset = 0;
>>> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
>>> +	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
>>>  		      bb_pool_size);
>>> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
>>> +	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
>>>  		      bb_pool_size);
>>>  
>>>  	offset = bb_pool_size - sizeof(u32);
>>> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>>> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>>> +	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
>>> +	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
>> this seems to break the new XE MM component isolation, as you are directly
>> touching the XE MM internals without XE MM being aware of this...
>>
>> are we sure that XE MM will not overwrite this last dword from the pool BO?
>> maybe it should be exposed to the XE MM user as this 'trail guard' location?
> 
> For CCS save/restore, we submit this complete MM to Guc and whenever VM is paused, Guc submits this MM to HW.
> While allocating BBs, we always allocate size + 1 

that sounds like a hack and relies that XEMM will not zeroed the new BB
but in v1 xe_drm_mm_insert_node it looks that new node->size is zeroed...

btw, it also unnecessary wastes lot of dwords (1 per each BB)

but this could be done in a way that XEMM has some control over it
and we will not need to deep dive into XEMM internals
 
assuming that we will allocate XEMM as size + trail/guard:


   <------------------- pool size -----> <-> trail size
  +-------------------------------------+---+
  |  ____    _______                    |   |
  +-------------------------------------+---+
     ^       ^                           ^
     |       |                           |
     bb      bb                          trail

XEMM may return vmap of the trail (or special trail node) where we
could write our BB_END and then we can let XEMM flush it to the BOs

and XEMM could allocate all BBs (without any extra +1) within real
pool size without any risk that it will overwrite our data in trail

> so that even if the allocation happens at the end of the MM,
> the MI_BATCH_BUFFER_END instruction is not overwritten.
> 
>>>  
>>> -	ctx->mem.ccs_bb_pool = sa_manager;
>>> +	ctx->mem.ccs_bb_pool = drm_mm_manager;
>>>  
>>>  	return 0;
>>>  }
>>>  
>>>  static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>>>  {
>>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>>>  	u32 dw[10], i = 0;
>>>  
>>> @@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>>  #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>>>  void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>>>  {
>>> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>>>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>>>  	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>>>  
>>> @@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>>>  	struct xe_device *xe = xe_bo_device(bo);
>>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>>  	struct xe_sriov_vf_ccs_ctx *ctx;
>>> +	struct xe_drm_mm_bb *bb;
>>>  	struct xe_tile *tile;
>>> -	struct xe_bb *bb;
>>>  	int err = 0;
>>>  
>>>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>>> @@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>>  {
>>>  	struct xe_device *xe = xe_bo_device(bo);
>>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>> -	struct xe_bb *bb;
>>> +	struct xe_drm_mm_bb *bb;
>>>  
>>>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>>>  
>>> @@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>>>   */
>>>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>>>  {
>>> -	struct xe_sa_manager *bb_pool;
>>>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>>> +	struct xe_drm_mm_manager *bb_pool;
>>>  
>>>  	if (!IS_VF_CCS_READY(xe))
>>>  		return;
>>> @@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>>>  
>>>  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>>>  		drm_printf(p, "-------------------------\n");
>>> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
>>> +		drm_mm_print(&bb_pool->base, p);
>>>  		drm_puts(p, "\n");
>>>  	}
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>> index 22c499943d2a..f2af074578c9 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
>>> @@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
>>>  	/** @mem: memory data */
>>>  	struct {
>>>  		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
>>> -		struct xe_sa_manager *ccs_bb_pool;
>>> +		struct xe_drm_mm_manager *ccs_bb_pool;
>>>  	} mem;
>>>  };
>>>  

