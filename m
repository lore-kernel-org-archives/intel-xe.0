Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D2EFF886C
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 23:07:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3EE10E04C;
	Tue, 28 Apr 2026 23:07:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lF5Z2hbN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0075F10E04C
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 23:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777417649; x=1808953649;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XKnVBNe5Z1HHifCT95/glHRS7f+kStY38TmNMhN81qY=;
 b=lF5Z2hbNfrcbRgqXa2cUiSPfCtsuiZIBRMI30LuL9UDYQtEw3UPKcLVJ
 0h9y0r+lYhqkPKAh64vDC+l35QYMOv3DhfpFGVbCq1ICHRLCgO2UL5xXT
 rXho0hriNAiYJma4JwBy8k5UNPEOQPDzh7RNjTHUbgeqL73qNJctncZi2
 ud8F/7PSXVC0BBoOMgauqs/WWpSdoSrOTqA/0U9kEBDw8ga52quWCp1ya
 4JjpPA2d7fQ/ouxj4WoWar5mOWQe4F0SMNdmHKVHPQnzf4T7NNqzHVB/p
 PFH0JPVx9o9CpEcQ6KePEdOLEilQ3nRxivg+QDHfSKETzImsfPpAgoMAX w==;
X-CSE-ConnectionGUID: bWYZMQI8RhedjByDIHehzg==
X-CSE-MsgGUID: HqiWSzZkTOqvaOYoupjCtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="65871101"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="65871101"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 16:07:28 -0700
X-CSE-ConnectionGUID: BYlimD2YRAe+ewKarwqGHQ==
X-CSE-MsgGUID: zSOZNL7cRpqSyruLDnDY2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="238063756"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 16:07:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 16:07:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 16:07:27 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 16:06:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WlqPUhuVwJawCKa3J38Y7Q2k8oLri6B3yl1n/nHoVEpU0l3mHY6CvcdIF14qHn0LlKIPdHSslbiMkZ1QmtYsu4Q+fOBgEkD3W8Z1191Ipfxc3xzuV7BolRBoiBlbkUxAVJH6DLs63/96Nbpv8PWkal0RXoXkWkpSkunfIY6sc91a/zNSv1OpWNApaEMXhylpcy8aFWYwwfH47iGmiTNkOOUmo7uJ4ZSEAjqJXxlI5rBz/quFY9TJ4JQr7Fh2NzpogJVnH0rHtOqqYqSnkRREMSpexG4o58Q4jYB7dI7dCotAopOJ9LJ+uPsLjzA5vMddU2VSPvDYMJeya1Ou2ZX/HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGAaM/fnAwXIRibW+0/DSRuxdPF5n2nMjxUJ14vRyL4=;
 b=ldQ15HQYGusPk6uJnM/Zejfaq3HQKSd4DD9VHZEe82mBWCwtAX4b5Nq+Ku+IoOjeC6chmNK4hG1ZDSCtuWUc6JeQzwBuP52IrSvG19HjFRdWkjwT2FKMhcHJKaPaqpHcFwCfcQQ91efQoYqpz7OpmArEhJ3kD7evMD5KQPcufnNyGbrIQxcOi1aJTtdZ5o/pfw5g7Dg0kmFSkFuvwYueZnDQSavnT4EjsroorhAXt6EX5iG/nNu0a91usn6ceZVPYAaqo3eIuwun8WZlSmwjQdhv+3DsGeCMHj684KAXk3luzt8gaTIKjJqwLHZx71f1vvrODrleMtPwC9lYjUOmQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA3PR11MB9208.namprd11.prod.outlook.com (2603:10b6:208:57c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Tue, 28 Apr
 2026 23:06:23 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 23:06:23 +0000
Message-ID: <9fa5d6c0-bcd6-4bd2-854e-4c8f58968dac@intel.com>
Date: Tue, 28 Apr 2026 16:06:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/gsc: Fix double-free of managed BO in error
 path
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260427154643.3985760-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260427154643.3985760-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0107.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::22) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA3PR11MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: 28968eac-9212-4a6e-e351-08dea57ac447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: OAUdJwpyEOrP+DqZ0cczWKaOsufkQym81CIolxBlutv8/4UNeFzPUkByKOFo+n9Cvq3nec/bQJScPC8ZJ9cp3uyuIT7eKQ3ouCa0doDjVlwAaTw4T3e6pE/I1W77lv9JcIMECDWLFRvbnRP3pCH1Z658/WoU1NlnObVqseWgf55RiJCb3LsE08SkXcvMfT0b4REwJJYDyeRMMVcM35wh7rMKTi6/bDxjKRnrcquKhk2QPL9n+cZIqe3maM9XkuI7kuPpgkYlSnyhgNLPho82LMsbOB8QX4NUcAG+GXYVmxQDsOjtuCynG7aoD7CDrMxeKXv4EHJGpZ2eeea+0gN1E46y44gvTM/ra6oLsD/PqFKat4fi9xBDJPGXV0jqG4axp7dr4F1YAsGENu/6XNcODRmpdLMlMFmMjC6p/y5i/8OxwP+zRJQSwSahq6YlE0sFv1+InppJhICbmHvM0kfONRfPENrasU+K2i4K/rYqjGBMG24oMGD0uEcNt9Q6qQYDWBxDnzwDacpQa6Y8oLTgL9LGtKgzJ0Eka3IxdFHSbyvta+a4pLJ/yBfOwWAz+vUVHDFWRWQedXRqo1ZBAD+ikYT6yRiBLQvc0lFmqxHBU310tcwVxLo8VMddUO4WlPAdXCc+ASmQiNnlceE/DZAdYS130nEfwqOZQnulKQhLUHORSKtlVj2zqjZLXSRw2sTFess4l3LE7RpTKVHIYReKHVRDFZF6BjW9++BV/NtJb40=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnE1V1VGTlA5OFhBRi91UzBuRVNMK2FrN2tJRTlmeUxnTWVtTVF6T0ZCWXRI?=
 =?utf-8?B?ODZkdHY1WWQrM3lvRkhYbUhrVGt4UWZSbUtHT0NxV3NBMjhHRkdheC8zS2xB?=
 =?utf-8?B?N29aTWdiY0J1YnpYUDF3UCtRRVBGMHVqd3FzUHljRy9LZ1VKZGZ0aWl0UllI?=
 =?utf-8?B?dFUzdXdwV0sxTFBGdWZ5M3JpYWQ2TzJ2emxDWDAza1JERGVsdFpNNUFlNDhQ?=
 =?utf-8?B?TFptQUY0RmR5WEdKK3FBUnBabGZ2ME9uRDF1aXYzb2wrNDdUSEdWMVJ0c0Ju?=
 =?utf-8?B?OExMcVdQNWpaTTVQWTBqdlRkcUI0MitEK3VkL00vaGxScitjVGdzWVQyeVVy?=
 =?utf-8?B?M2x2U2Z5bklGVG0zKytMK2p2RWQyWjNkU2FaRHh6cng4OU9LUzZjd2pHMUNY?=
 =?utf-8?B?ekFaZitNMTNDcFkxTGZXR1VSbkdwZ2U4elJtSEtIS01tb3hDVXg5S25KT002?=
 =?utf-8?B?N1hYRGE3TkFHcmRzOGJCQmI3K3VaZjQwK1R1dE5mUWVWWVpUc1c4UWhGckZa?=
 =?utf-8?B?d0h6Ky9QNTV3MkNmc05oWDJPUm5mV3JLVnl3WDRkQTYvNlFkV255V3BBMUxB?=
 =?utf-8?B?YmFoRVU4aGtSRXNIYThRanZqWXNJaWVXaGYvK3ZncVRuS01GZnhJT3V3aVNO?=
 =?utf-8?B?VGxrVThzNzZINmNxZDJSalBtZjA0dHR1eks5ZEpVaWtYNTdJL1djTFRKK3Fk?=
 =?utf-8?B?cjVaU3J6UC9vTGp2RHZhR2JsY3ovTXU2RENhaURkN0NhQ1l6dVRrbVhiV0ZP?=
 =?utf-8?B?aHo4UmQ4aVRaZzNXOTdEZGdJbmxoM0FuVHIrblVKZDB3S1AxUVN4SjNTNmpK?=
 =?utf-8?B?YjBoVVpSUmRHYmZqcUNUdTlSTDl2eXNORWp1Sk5wZEM3eG9kWXdnbk1JUyt2?=
 =?utf-8?B?bGU3TW1iTkRXQzdMaG1oVy9PWmoxS1FHY2kvelRFT3FtVjVzek5WRDQ3Uyt5?=
 =?utf-8?B?V2dyZXhsblJlV3V4MFBTNmVNY2ZUczIzbDNiUUxGLzArSUdtcDlYUlRiUGJj?=
 =?utf-8?B?V2tNNVlNd2IweXBiOXUveGVlRzhOejI2cTgvYUtNcEczb2E2bEd5cTNKWEs1?=
 =?utf-8?B?czl3T1RWMHMzbWVHSkhpVnowQ0hnRE5mRERvY29RNUJ3ekpOaC9mOGxiMFdv?=
 =?utf-8?B?eGxzNjRmK3d0TUU0U3JyQnFXUy91MVl4Uk96ZHplN1ZJTXZNRUREUXdrRFFT?=
 =?utf-8?B?STlsYXhmTit3bXZVVGpGaWZ4TUZiU1pDV3ZLUi9tUGtmVXFueVBJa0M0Y1Vn?=
 =?utf-8?B?T0dPUEhvOWVaWDltMzZkWGZVS3FwTDhnd2tubndjUjJnbW1uTTUzTk1zSHg5?=
 =?utf-8?B?MWJUbksvdHpvdUN5MUxaR0Y0OWZFejN5MUd3Y3hYWnVqZUc3WVlkbFB1ZlFy?=
 =?utf-8?B?M1U0ZnU4RU9LTjIvdklma0lFaUt3YzVYL1QrbGcydldsV0VGZnlodU1CQjZO?=
 =?utf-8?B?allTMlNVOTZ4UXY5TzlVQzY3cEpIMXNqYWUxNVNyNjRNYTdwb0JsUGRmODZK?=
 =?utf-8?B?WDFHYWdJUVhiRkdWUzBUWSsxT2doVUg4Qm5lUGN3YkR6eUxibENjQVRKeG9F?=
 =?utf-8?B?QnE5TFl6dWZHNUhoUDhiSi84VDY0QkhqVDgzeHJZWjBQQTJkMWFsRUhYdkRk?=
 =?utf-8?B?OFlHRWJ6Wkc5alM4Q29RWU8vRFlzNGx6eUo4SmczeklNR20yNXhsdkF6R1R3?=
 =?utf-8?B?c0U2cjVaSk1GMDRqV1hzcnA3TDFGNGUzWG1MMWRybzVyWnZmMDFKTHJuMkw3?=
 =?utf-8?B?aXNBYTBET2l6RjZHY1NIRWU4NnVBY3VHeFVKc0xmdUFEbk1GSUZQQ2hLNUp1?=
 =?utf-8?B?VURyWGpsNDQzZHVHSmtKRmJQL0ZNelIzYlJXdFpyN2pvbXpyS1NzM2pTM2JY?=
 =?utf-8?B?N1dRN2JINmh6M1hxNHRCWVp6WW1yYVFkdWVCYkdzaFBuZVI4ZG1QbHdCM2JR?=
 =?utf-8?B?YWNSd1d0MDk1R25rY2VjdXBXTllrejhEYm91cEdVd05WMEphcjJJN05ieEI1?=
 =?utf-8?B?YytxMk02WnZsTGVLT0dZN012Zk1BZDZXZjRtem1ya0tTODhaSDZVejRmVVFW?=
 =?utf-8?B?S1NrWFhKd09BaWlOSEE0UlM1UTJoQWZibFZqY0VqeEFRNmJWYnZzcUxDWXBG?=
 =?utf-8?B?SEM1YkZGRXF3QWxBTjlxd2x4YnN6WkZlbFN5RzM2TEdqOXFDZk9VcWdRV3VU?=
 =?utf-8?B?UThzMERYdEdMVGtLRGEySUFSUC80ZFltdVFOZEFjNE9nUEE2cDdsM3VmdGg0?=
 =?utf-8?B?ejJnQU1KUEdlQTdHWjJlMThQRldtRjJuWmsvU0JHM0lKK2NpUHd2bUhnVFJO?=
 =?utf-8?B?TmthTVMra21LS1NRcWZ1WUV0QlBQakFpVmdtNVdzR0lGa21JRVFSOStDYXJl?=
 =?utf-8?Q?QKox9soLu+RAe8fw=3D?=
X-Exchange-RoutingPolicyChecked: NQJ9aNkNxhTHl6gRrxchWC/R6yvR9GI+DrcrMdElo9Sw8wyoS9+USMuJizZObRIyA/8Bu4E1nOkuEWXOwtUb1B1sLgRZT3AtZbb0VMYIM24Pb52RpVTQRv4yjDNXri34Kv4yuNChLQOTEdojkqsREaA/bYAWAJWkWh3LZuFP+tjZdM3WaQPRFHMv09TmuyEGRU0mGm062P7WpqWhFo9dSsQs5iDza9qU2Dbk4y2X9Rin4AootWutYI8JFRQppFMrF1Wkp3esWMUuGI4lP/BDoEsGebia+YgUFJlSCkTAW2c2CIk0Rd0hDLcun6uLSpsNbfJ9PBB3vqZ+nuKOK1K63g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28968eac-9212-4a6e-e351-08dea57ac447
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 23:06:23.3159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dt5G1tOBxcUQaMS/5u92bWBVl+Frv/BaBX+LAtDGg7FBeVXEeHj1/F/lunPXiziZe5l8VhdGuBtboSID+b1Ql7/dZKzNfGpCBQ/Xd6SnQU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9208
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



On 4/27/2026 8:46 AM, Shuicheng Lin wrote:
> The error path in xe_gsc_init_post_hwconfig() explicitly frees a BO
> allocated with xe_managed_bo_create_pin_map() via
> xe_bo_unpin_map_no_vm(). Since the managed BO already has a devm
> cleanup action registered, this causes a double-free when devm
> unwinds during probe failure.
>
> Remove the explicit free and let devm handle it, consistent with
> all other xe_managed_bo_create_pin_map() callers.
>
> Fixes: 2e5d47fe7839 ("drm/xe/uc: Use managed bo for HuC and GSC objects")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_gsc.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> index 0d13e357fb43..aab59dc647fb 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_gsc.c
> @@ -482,8 +482,7 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>   				 EXEC_QUEUE_FLAG_PERMANENT, 0);
>   	if (IS_ERR(q)) {
>   		xe_gt_err(gt, "Failed to create queue for GSC submission\n");
> -		err = PTR_ERR(q);
> -		goto out_bo;
> +		return PTR_ERR(q);
>   	}
>   
>   	wq = alloc_ordered_workqueue("gsc-ordered-wq", 0);
> @@ -506,8 +505,6 @@ int xe_gsc_init_post_hwconfig(struct xe_gsc *gsc)
>   
>   out_q:
>   	xe_exec_queue_put(q);
> -out_bo:
> -	xe_bo_unpin_map_no_vm(bo);
>   	return err;
>   }
>   

