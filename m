Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 814B1C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 12:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F90210E00E;
	Thu, 13 Aug 2026 12:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QjP+DS9U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F2410E00E
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786624313; x=1818160313;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aM9HAlRVbFBbzNjblVMsW+SnxOdDeeLAIj5S7/M2FGM=;
 b=QjP+DS9UDZ9baBMMlofYquCfmBbPz+8QDhFL42FO+7BNXhr/0EnFh0Pf
 8uDVvbZsbZVc7jE2vzGAVOXHeuBB9yqBEdkL8RTSLaxlq7ibR4ZQHg4ow
 39SggrdYExhim6YqHEmSiwsvEMTuFNkd+Cfh5Ruh3ksi2tevPAf+8meaI
 1qtYfnVvrgch2uS+A+3N8DaZKt6vAFR2AJuccZhhm5kac3Bq9k4AX443O
 WfUrBjJ3n+TenJo0tPL8IrfozsFdVqkcCengmObYaPLjABzisvUJCE8na
 fSSUMPy3/bh57UhaK0ap3nd0bthWC7CJGj0UICeZZEvalF4Va1u+/z/FZ g==;
X-CSE-ConnectionGUID: FpfepgxDSzyg7IyPwARVDA==
X-CSE-MsgGUID: en9FZaS6T7eMtI1BMAS6hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87077946"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="87077946"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:31:53 -0700
X-CSE-ConnectionGUID: mnLDPUWESqKELuCQHMrD/A==
X-CSE-MsgGUID: uN6IZw37Rm6wNVxrIz1lpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="267784905"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 05:31:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:31:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 05:31:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 05:31:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PWyqjOUfplMsgLq3CFM8DBNJEB4kFXTqspLna4zu6ff+BrkuHykgbeOXGT8UzQuOmZQKaqq5oQUfNBtkxh1HBY7umOWnlLznWQh46Sh1BpdciKBA2/B7l8X/802DogngvYBPyt0aMiKs73QUFLw8knOTjdf3nwLadasYIJeDy1LiNRgZHaWeVeklswkYvmwZxSNTHAnVFDV4QHUP2Kd4zU1bn8uf83TmPau/BS0RV0k+fTLxQphAdw/X2MT+KQmEJlzQXgYezkE6ibmk85KI6fFAAgxVGKiJPv5rKD+tXaLaNAKoClKQk0h5ufzoYQebvh15+om4v3s+BO+s01Rj2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yawt9bPM+OtA6ppJX1D4IGE4BYm4EBni9zML0ZNBvw=;
 b=t+XIxsF4m+ok3hirafnP7AJVEDaGjfHbeQWPXXLdaXKfBrAxGBQMpohhzMhvMW81p1kjUdXjSsAGpsJRe3IqBz6RZV/KDywLMDlauGQtyF08f83KlbxcjIM8WG1bDSWv6pvDmiaHltJH45W1l9l6iuT9DjSBTRQ+W0qcm7trTSY4lrVwhTc+yBllLmFMSGqgdVQFi1BS+EQfmix4NGtnxsFJRqBN4aGz6cpCnlInu2i48DPdvoWuvnloEDkvqP6RoRKn+XYKiJLSvikPRcVtO5z7qvQQYtiYMa6YypJEr5XkWIhAxPVOBbW1aSqwCxDiwQT8Rg0mRr5uj/kAnnoOgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 12:31:43 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Thu, 13 Aug 2026
 12:31:43 +0000
Message-ID: <5f61f3de-357c-489a-9bb2-f3874a98573e@intel.com>
Date: Thu, 13 Aug 2026 18:01:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/32] drm/xe/log: Index all SIGID printk messages
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-12-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260812191450.11690-12-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::18) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH3PR11MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: febf63e4-c0ae-4852-3abf-08def936d4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|6133799003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: UeZfhq84i4T7iExrIkH6MgYXTgsgwmm0mjwtty0UD+980VhjBOKJnoonqPQUCVVq82y6FDDijRdU7LdqsL7OLRYAvvbPcKfFK3EVPi/sDMqddxhGGCVQ1R8TIQ8hPm0xkl6HxMvDHZqLhiCYZ5X9KuvVOAeVbK9k3m+Jz/TixuODaHBUAW7n31OTFktYRVxhSpiLYxO8hzilFZ6oFR2FUykjih6qgwgL8VblYmTpS23SFvzRCVq1IA/NWRXboxpSP9cwhvGhJkDODmydvw2dVEsga3Sz6DDfr9Q7SZcRbVrqO5fR9kdqT2a+D88x38jYkQCoeYC7ekfQPJV+oUl5zF2gbHb4uGC7yiZQDTauQu8uSCEExLkEhlN8KVJJETuBbOoN4rWVxhqehctEqd8XNaBKknB3AXPaXxjB6+Xu9PAUmqBxRNXC41fmcfUp46Hc+euXD7bvYMdjBlHxWGiFBnakwHFj4wU9MQHhoVOEbT20zr1BMizYWpVNLRO5OVzIxEfv8m6dbB/5xHAXfywS12uW+TxAD4p/PwnYcUBDRvY4rtIdfFU9pYWWJl6L5mi9xQ43KlZsgEj74ZcpukyEAa0C9f2id6dMegeJ+pduRQaNC7nSQEYe7mLMQu/X61SerCaRBMdgSPb9OTp0GiszsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(6133799003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFIvYVZzeWtRWnBudW1tSGZyU2d5RTR6ZTZybmV1L0EyWlhtZzZ6cHEwR1pm?=
 =?utf-8?B?WlkvQ0prM3lDMG9SWjgrRnNXVGQ1d3luN1pkV3V0WWc2bUtLUkdxZ0xvQ3Zs?=
 =?utf-8?B?WW9rYzBHalEzaW5waXBPc0M2anJJTFBtRVJpbWZXRDBaZVpJWWtwWWlEb3lC?=
 =?utf-8?B?NGJFakR6TUtPbjdpK3JEZjQ5VnB6RGJQeHV5dngyS2ZqdmFzWlR5RGk4dmJh?=
 =?utf-8?B?TlZhSlZOcTBoTXp2bXl0cTJpQmU5Tlp6MWRkVUdZYXBzSTNlbThjMTlxcHMz?=
 =?utf-8?B?SitoNlJxa3VtazdZS2R0Q0MvQ1QrMEJFZjMwRHo1enlrRmZWOWVnbisxUE5y?=
 =?utf-8?B?OXc3T1pLc1ZYbmdSQVExYlp4T21TbnVKMkhRK0FiN1BLTjh0SW1uT3o1RXFR?=
 =?utf-8?B?RllETHVLWDhaZnU5ZGxBeGl0dDZWMlhpZytaSDcyTk41ZkZnbmQwaGpZai9P?=
 =?utf-8?B?S0M1MzkxZmI0WCs5ajk5SFltTHkya0prNUd0S0pYV2Q1Tm1vMDBCSFFCNUti?=
 =?utf-8?B?MFlqelJyOUh5OTZrSzQxcUJyVUZqSnRDRFptdC90MlBUMnlWOVVjNDZkUDli?=
 =?utf-8?B?U29xY2s0SjhyYWV5RlZnTnUrWmh1YTRlSmUwK2dmMG1rODlZVXlLVnVoenh2?=
 =?utf-8?B?Z01vWnB2aDBWR25ET0NnQm9LbVdmdlV3R2pGeEd2OTZsZTNOc0pHTkJaWDg0?=
 =?utf-8?B?NE1McVN3VStBc0FldU9VTWZiQlk1NjZIQVlOYW1OM0U5bHY1YXA4OXpiNUxl?=
 =?utf-8?B?S054NmtMODFCMjZTamhmbEVSZ3NHTWNBQVhqN0liQXpxTmpXaUp4L3VZbG83?=
 =?utf-8?B?S2RxMWdId2VSL1g1TEQxaHpjU3NwdzB0S05YZ1hKQUR6a0dUQTk1SmJ4S0pq?=
 =?utf-8?B?T1F6SUhuanZWbzB4aVcxNmVtck1Bc1BIY2pUS0hCY05tbmdJcm5NL3JOZWdz?=
 =?utf-8?B?Zk1yeHdsTzIzdG0yWGVZZGl0VklUc3hINmxSV0RhdkRRQWVZYyswOHo5VTJI?=
 =?utf-8?B?SVozRzFLVWJmNlV0RDFjVkZZUzV5SklOL1FNYUZDdEZnVDhLZWdUN0JiVFRN?=
 =?utf-8?B?dlZHUlNWQmVjVkl1N2xqOWdJeldXT2o1bFQ3TXFCZTBGLzRnY0pKc1NiY1FV?=
 =?utf-8?B?ZExlSWI5OEt2ajhlWXgwNStRODZaSEVrazYzcDJQWkhpUnpIcXRXS0ZmNDVB?=
 =?utf-8?B?YXJHb1JqdllyMC9SL08wVzduWUUrcTdqYnpjWEtVcHRaNkk4ckY5TVQvQnBh?=
 =?utf-8?B?RlZrYW5KQUZlaWJBQnkrTFEwVlk1anM2OVBJYWp2WUJYV09VQi90bzdSTU9h?=
 =?utf-8?B?a1g2bGVIdFJ0Q3IrZTZjZVNPQThDZ3lBcEV1R2VEcnRlTjFSOU03VDh2aUl2?=
 =?utf-8?B?bjNldXNGcFFOVXlJQ0NXamxlK2h1ald0U0xkR0x2eGxDSmt5SFZJRTVFcEZj?=
 =?utf-8?B?L0daeUFwV1NXZFpIOFdwcWtsUlplcU1mRTlEMy9MdEsyalFsbnhOMENiWS9z?=
 =?utf-8?B?a3lwVnk3WldLQ0M0cWcvVmxSNUdXek5NMGwyelFmVk9vNjdjdjd0TzBBcGlN?=
 =?utf-8?B?M1YrTDZvc1pORk9xWEMxM2tXN3ROQ0xodGZGK3hTYnBraVZuWDh6MlN6Uksr?=
 =?utf-8?B?ZGJ1Zk53Nkt5REdhYkhJYytxR2dCdUtGNDhvdVRma0NZTlJhZWR4Z3NMVnRJ?=
 =?utf-8?B?M2xnbSsxY2dTQzN2VnZKZ3ViRlZIWmV1RGN3NHJUTXpjUDNOQWpDWjVocDFr?=
 =?utf-8?B?eWpjN1lCNlJFNkZBL3NwSE1vanZzcHFlS1pCcFR6L0FNTFdrZzlzZnM2Mm9J?=
 =?utf-8?B?ZytLR2Q3dGxiY1lvakNBVmQzNURVY2JPM04xVTJ5M2UwYTdkVlRFalRKdXlE?=
 =?utf-8?B?SmNZMUpmNkJudkw3RVlmcnlRSzNOK3ZNcE4wYlVkMml2eDlCOG41QWdsUUZZ?=
 =?utf-8?B?eTNKbWdJRE5lUnNvWVJxcUE0VkExeTc2RHU0ejYyMTlwdlZROVRnQ3ZxeHFH?=
 =?utf-8?B?MFpjeDlXcVdBaTNSOTJwNjVqUHZNOFdrNU5UWWY0d0NwQmFVeWUzdGdtUnh2?=
 =?utf-8?B?amF5eVVPclBGS04vdDZVK0Y2TDFjUE5NUXpzWHlMMDJlNERNVkNlUkV6ZGY4?=
 =?utf-8?B?aThUM3o2ZC9lT1loT1AzMC9KbkNVOHhRdzJpTFRCSldYZWRZb1RuRXhDQUlZ?=
 =?utf-8?B?bUxJZEM5aW1pWVMvckpyeEt3aTVEUXk4TStGVlhJS1JrTENIdFl1YlpyWVlV?=
 =?utf-8?B?UjNwaVpnUktyb2h5QVNESXVON09UTjFFNmpjK1p5S3lWZEl6S2RQbVdQUjhV?=
 =?utf-8?B?YnpHRS84eExqM0VEc3FXY0tCbjI3Z1o5WmcyWHZTVnh1MlZDVXNZUitnWUw2?=
 =?utf-8?Q?E9V0WLHTV0cZStjs=3D?=
X-Exchange-RoutingPolicyChecked: csk+V1QAngmkW7CjkrkwufOXM/Bn9A6EmnFRjp7cnjCPglGzsxlHOuTlXp/YzVSG7XrFMuoOO2+1wL+o0O6YWdGE/D4AqERMHPc+ocLhHwr+0kcPrzryJbqJT3KCGAnRJ3XEX2aavfh5TGh74AWpskfyGRNMdnf9IR6t31/DRLpkR6C1OWxzb6Ft6UaDsNNDxNar6790ulfEvIpTgrtI6BSiwFodlXdkyDfCLYp9g82qSATahZVU3RBVsH9VmkjtmHF4/xXz9QycExV2azzyPhFUTK24VIAmfy2ivfXweLAag6l2MuweIfdCPVFhC8W8xMFS/jd/ws2EPlU7NsmKGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: febf63e4-c0ae-4852-3abf-08def936d4ab
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 12:31:42.8592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnQnixaG4b1plt8Hd7nWLSNDROZO1J1eVvhnnrZDkLAT5Xel/JUbm5pmyGOdeSrBQrrNPE5tO+av4NYBiDoV9BMSx93qblJg5ABs2C9LZzo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7820
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


On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
> When CONFIG_PRINTK_INDEX is enabled, it is expected that all device
> level printk messages are indexed for audit. While usually this is
> done automatically behind the scenes when code is using regular
> dev_printk macros, since we are generating different dmesg messages
> inside xe_log_emit() based on the severity, component and location,
> we only get those entries in /sys/kernel/debug/printk/index/xe:
>
>    <3> drivers/gpu/drm/xe/xe_log.c:142 log_dmesg_vprintk "%s %s: [drm] *ERROR* %pV"
>    <6> drivers/gpu/drm/xe/xe_log.c:140 log_dmesg_vprintk "%s %s: [drm] %pV"
>
> Explicitly generate printk index using dev_printk_index_emit() with
> some generic prefix that includes the SIGID tag.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_log.c |  8 ++++----
>   drivers/gpu/drm/xe/xe_log.h | 14 +++++++++++---
>   2 files changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> index 0b423ed121cd..50a9b35e5b3e 100644
> --- a/drivers/gpu/drm/xe/xe_log.c
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -177,7 +177,7 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>   }
>   
>   /**
> - * xe_log_emit() - Emit a structured SIGID log entry
> + * __xe_log_emit() - Emit a structured SIGID log entry
>    * @pdev: the &pci_dev device
>    * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
>    * @sigid: signature identifier, see &enum xe_sigid
> @@ -206,9 +206,9 @@ static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sig
>    *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
>    *   <6> xe 0000:03:00.0: [drm] SIGID=103 In survivability mode
>    */
> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> -		 u32 component, u32 location, const void *data, size_t len,
> -		 const char *fmt, ...)
> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		   u32 component, u32 location, const void *data, size_t len,
> +		   const char *fmt, ...)
>   {
>   	struct va_format vaf;
>   	va_list args;
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 0928b0866617..53fe2bb7ddd3 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -16,9 +16,17 @@
>   struct pci_dev;
>   
>   __printf(8, 9)
> -void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> -		 u32 component, u32 location, const void *data, size_t len,
> -		 const char *fmt, ...);
> +void __xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		   u32 component, u32 location, const void *data, size_t len,
> +		   const char *fmt, ...);
> +
> +#define __xe_log_emit_printk_index(fmt) \
> +	dev_printk_index_emit(NULL, "[drm]%s SIGID=%u %s(%s)%s%s%s: " fmt);
We need to change format for a. error path b. blob path c. plain or info 
path right?
> +
> +#define xe_log_emit(pdev, sev, sig, comp, loc, data, len, fmt, args...) ({		\
> +	__xe_log_emit_printk_index(fmt);						\
> +	__xe_log_emit((pdev), (sev), (sig), (comp), (loc), (data), (len), fmt, ##args); \
> +})

nit: use do{} while (0)

Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

>   
>   #define xe_log_emit_fatal(pdev, sig, comp, loc, data, len, fmt, args...) \
>   	xe_log_emit((pdev), CPER_SEV_FATAL, (sig), (comp), (loc), \
