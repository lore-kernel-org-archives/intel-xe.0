Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9890FC4451C
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 08:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D8910E423;
	Wed, 22 Jul 2026 08:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8dBALsD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B54E10E423
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784710116; x=1816246116;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X5vM0435rqHc9P/UHN20NWb0OtR3nwV6H6zMRSWTjSM=;
 b=B8dBALsD0OR+XPO6C2QzKTNqV8JnSSUbtIYi8x/rtFOd0SdXERLx8nHZ
 eT4LrL/siP2jiL3+Bc2KY/ilPtiJAPOAWoUmGYxMqhqoFkv3DuuLNaPdo
 fZ39d9Uz8s7pFSV76eHFZL+yWAWqD5rE0edfU7eP1mKh0AHk355Coa+Lj
 vgENM1fMU5De/TXllym82HLIpqjpsHE/OYWJVGiXlAod+LyMFpP2Xx6dB
 cFYl/mOvOquu+MDYUbho/KU1N+QoxjCQHvcULiOAqVqSqbHq5DVh/Ijxg
 JyxmU+JWYurwxs/s8Xd5vzR3c/E2PGWBsd5py+HYhYpokC/BuLXTk05tN w==;
X-CSE-ConnectionGUID: uWossmj6R+G9NBjtZP2eOw==
X-CSE-MsgGUID: D8aN759QRGmv5U8vBS/oEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="96478127"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="96478127"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 01:48:35 -0700
X-CSE-ConnectionGUID: AC4rGlHKTs+1ieSILe433w==
X-CSE-MsgGUID: qq6fLdEgRcKwNUJAZBBBKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="281324821"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 01:48:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 01:48:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 01:48:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 01:48:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JK+W2e3qiFKIb2ekO7jyqmIOXF0uJhtYIryVB7WAHPrG8F/S2E1HJbtBRlCxnikhKzoWwA8PG94H3kFKJ3gsoV6Y3pkN6/yRA7EjpLIBrAiFmQcsPC4158wc5ELrRS/MOxBt2O4U5pqixf5lgOi6CVtXlArml+hZ6Bsn/Me7OwTjxcYL3iPrbhMMeBYSa6Y8Rqn4i7WEdVMHs+7zw/58GaFidYMOCtmajkM+QHsyld2bhcyYBmOjYH5Tp+5Eu6hPAWf6baKE8WdXUiSVu0AA4H4xpV5XkMKPFmABvEZHQH2ZkiBQ35sDWVy1NBHXzWaUpchRNopPCS2LGPtXPaqnDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI3OEzklYj8LI46iphe76XyP+0QiGhB5322I7FV058Y=;
 b=wZLUT8qvRuBJoMaeEQUhBRplvgmJUdoGnLq0Ob+Ckdt8on7ccQHMtpbqO9V3W95LnbZrNcYVFoSIwqU3LwhPEQqF2mzE+xT/BdPlGSlGVteUWDLifBzUTwogozrEaoj6kmxqkc4ommgYIcvYhp8YMHlMsDw/oD+YHwPdc52FW2lcfrJnJc5V2oK0LWK+BtxM4Md4TRjkhyIK5lWX89lvfOZttqcGcH9YPdw92Yu+5wrfI9wbqmW9dSrsiRIzZi1/mWzECUIMj/H0o83kRy5vS4dzXmTKdhFj95SP5KNHJz+4S3CAEBXSPfdsdxJR5eYniVzL/HvYDE3L3ygr2aOU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA3PR11MB9302.namprd11.prod.outlook.com (2603:10b6:208:579::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 08:48:31 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%3]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 08:48:31 +0000
Message-ID: <df70d325-1d9e-4f13-bc95-9f1feffd564b@intel.com>
Date: Wed, 22 Jul 2026 10:48:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Hold pci_rescan_remove_lock while disabling VFs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260720080510.2743242-1-lukasz.laguna@intel.com>
 <9bff9629-31ca-4618-92c6-c63b4f993bd9@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <9bff9629-31ca-4618-92c6-c63b4f993bd9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0244.eurprd07.prod.outlook.com
 (2603:10a6:802:58::47) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA3PR11MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: ed14d211-2250-4d91-a126-08dee7ce01a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: I92yBF+MKnubx421G1qChlu+uq4jl5mGp7ijWbH2zN5B9IG0/fr5mjXZci/6N0Cj9Umbe85KnZSyUFcDN9GpSvgAXpLIR+wQCFIOiwzYUBqlm7BaPyu8CQhTBoMQz8LuFJrdHAcflQJum7NFLRR4FKdws5NwjJcmCltC2UMIi3SgEx1h9qZj6/vCIMXDXoZ1CY2AysrKa8CBzAE/BQ6pCSsqVg7Cq2fmcO4kNNTmWaD9+nPcMFifrXxBPfTlj0CgHIDvA897/Gdxoc719SMovsBJCVJ6dRRMc60+vT2ZB3kYh2NVqxJZkw+EaZa2ipzSKruqYZ5h9OcYmnaIeQxh5ryhWYBZr2CbFleDLp2IPIsvtziQT8tn5p6BkV8dcjoCz5mOlFUIM6DLtV/PLkk9PcxYQIY8TcSTvWghrGWR/u9nLDoppcMIhH7FA2t/nS092Y+wtfP/F3/z6g86OOLa9MhqWb2QLa7V0u8KZC7ti3KWSu/putSgo1qb0boS2m5aRy200a6Xp1ZZkwlFtvN+nEtyauci5YkSiXDuhBSaMUaNJOJGQSIzTa86jF2Ymvrmv1BFrCzT67xhUzeWKDoceckEKfl/S9aeA1diqHicEc0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dk9ZZGh0cXVsQ0NhVDQ0Q29rZmVEanRJV0tuYVNoQnVnZUg3VXVpTFVOSU9j?=
 =?utf-8?B?NXhaQ2R1WVMwMDZseVRaT00vQVJ1RkJ2UmV1QkJPOWx6NmI4QlZkcUhvZnFT?=
 =?utf-8?B?VGZ2clBBVU5iRG0vSHk5VlNnb0R1SkROT1hZZG12RGxJRWRUa1Z2SGo1NXlL?=
 =?utf-8?B?TW8yWFZ4eGJCUk9ZdFpLRGpBSVp0ZitrcGEyekh5LzRaZjgxelBTMmhBZDF0?=
 =?utf-8?B?UkN6Z29JOTRrRHcweWdJYVQwT0dnYTZNRkJXWmZBc0NndXhtTHpLenFSMUZo?=
 =?utf-8?B?TDVxaTZkNUZ4UEdVMWkrVUNtOHhKZnQ3WVMza2phamh3K0p4eTlJQ3NNQnZs?=
 =?utf-8?B?L3AwaWx0dDFFRklXUlFvWVB2UjRoK2syZmE2N0tobG5DZzBSZ2JyY1c0NnFa?=
 =?utf-8?B?WTRlR3hDYS9vM25sVGpQY2V3SWkvSTJETGZpdVQ3dUZNcExyOWpUUEk1TERl?=
 =?utf-8?B?clNjK1o5SS81VnZUVzZYUEhUMEtOdEFsQ1RZQml0VDh4VWRDOEtOVXNqcWZv?=
 =?utf-8?B?ZVZMWkwzWUxjN0RubG44aHFORklTc0J6TU1BeUJ2U3lXVXRqMWRnSEpzbzQ3?=
 =?utf-8?B?YzRqR0RST0dsaWJiV1Q3UzU3WXAydjZqQTM0cjZ5N1ZyQ0ZZMUkwblMxUzhB?=
 =?utf-8?B?RjlCU0R2czBqU1lmcjYycDBld0Qwd0ZTUGZRdmh3MXVULzlRMUdaVXVLN3lL?=
 =?utf-8?B?a3BZOTkzdDYzNU9SSjhFUUZTR2d4Z2gzMkE3TFpzZklTeHNDMno4ZmU1VWFq?=
 =?utf-8?B?aU1HWDJRZ0JzOHpqUDVxTXBCb29rc0N3UTNTMEhFWVNibE1VdXFpcFpsdWdP?=
 =?utf-8?B?SEZUT3daL3JOWDBzamtVaVpOMm55WC9wYmkzVkxxSWtucUxYemJneTZyalYz?=
 =?utf-8?B?WmZzYnRqb1g5RjQ5UURXYnJrMkpZUGlucnMyY0tpZDlseVRHT1djTTlrSzlv?=
 =?utf-8?B?Rjk5Qk9ZQWlYWFdzSXNYQlJqYm5BS1RZVWtlMElvc2wyQXRxMXBvOGFvckNJ?=
 =?utf-8?B?VDRRSzhWeEh3bDQyZWovU2hIZzhWRWkvbnhzclE2c1VvUEszeElWY0dKUlYz?=
 =?utf-8?B?OVhucm5Fc1AyeWxPRUpBQ2dKMzJKYVdxTSs5WDc0Q0ZTbklKQnFRczBwQU93?=
 =?utf-8?B?eXIxS3A4SGJQTVFISkg0OVkrL1J5RzBDZWhDMG9KUTViSklKK00zeVBKcnoz?=
 =?utf-8?B?R0l6UWk5Y1E3RFA3STA0b0xFTlpnQVliU2N5VEZocnoxU0NzeUpMb3p0VjZK?=
 =?utf-8?B?eUcvUXUwM2djdEVVQTlFNzdCZnBBWUxPeDRpWHN4RTBrRkNCMTVvUXlIU3Uw?=
 =?utf-8?B?eWpMeFZBbHlHcFI2ekEydWgxRHlNL2VDQ2NtbVJBY1ZFZG1PZitDMXJwRG84?=
 =?utf-8?B?aUFERy9FN09KYW8ydjJTdVVOQ2FNUVMxWkl0T0FEL1NrWDZkYjZ0SEt1UDRI?=
 =?utf-8?B?ZWRsbFh4MlJCaWg1OHVjL2NpbHhjeWZMZnZTc3ZQTldnT0Y3cmZKTlF3R0tH?=
 =?utf-8?B?ZFpsOGdqOHdKYTRWWExBclB3dUVodDlwVklQZ2hVVFR5OE0xalhQclNsSWdT?=
 =?utf-8?B?emN2cElaOFFlK3gwdTFwRC9saTViVThCTmdpZkYzZzh4NWlNa2dSVDZSTmJx?=
 =?utf-8?B?empqdEF1Si9yZUlEMmNkeDI2eS9Wc205TGJJZjdEQno5Zi83Ukw4RHkxcmdk?=
 =?utf-8?B?TWZtd2Z1N2hha1ZaTVgxZWdUS2xQcTEybGIzTlFrTWxnaW9HK21BYkJoUnBk?=
 =?utf-8?B?STNDRnJyMmRMN0Nkb0hMMklrQ04rV1ZqemRvaS91NjJCQ2hhcGIxWGlwTSti?=
 =?utf-8?B?b21xRGhZNExPSUpBUEd1S3ZJNU5CYjdCMXFhTzRyUGNOcVFub1RQOHFEa21x?=
 =?utf-8?B?Z0ZtZVNkcnlDTUZ3M1BJaXJPM3R4SWVTZVpqeWVZOFQ3MnVJMnNrQVdBOUlS?=
 =?utf-8?B?Zk9MaWxMWWsvbHU2Wld1Z3BOV0ljdGxjbEdxVFR4dnpBNzJRd3d6QkpKc29H?=
 =?utf-8?B?SFpwK1lYTndXUmw2aEJuUVhEMHVXdU1tYVNJd1QzKy9lYTdvNlFpM2xVMmYy?=
 =?utf-8?B?elZ3RDh5UlNBUUx4OTlwQnZXVnZORUFYUWtEUVdSYWNlb0pWYlJWSkVXMExV?=
 =?utf-8?B?Ukk4SlhFdWU4YTZIRUFHMk5FZ0NzM0o2QlJtOGk3cHFGQjlZVFJFNVlDQ01h?=
 =?utf-8?B?K2VYRXB4RUVrYVFuSkdUekx5cUR0ZWxDQWk2aUNISUZQbStWc3dvdlorVldQ?=
 =?utf-8?B?OHhZSWswNUlMM0MxbTZ6eWhRbDBtdE9Oa1l3NDEzQi9zR1Vhc3VvYXBXRkZv?=
 =?utf-8?B?YnZ4NkdFelRvNStzK0hBcExkUXJYeFRra3lNblRhSzFxcVRqV0l6UT09?=
X-Exchange-RoutingPolicyChecked: CwrKY6yG9NTw44MwVK4Vojha7Ve9BY/IXm1RQG8n8e4YlVpXoPT6Efi3rKnVpMpnEuvLg1jOagv8KA8Rym6JQAGGf54wwLn1/QmnBzep9PtSBXHUtKZ9J+Tyyu3gs2zZ3EY3+ZUNZPwk3nBba6x6S95lrVLo/NHuD4s4tZXkkSdXoketTGMmVE8P/zblhdH4CbJ+B+iqksDakXc6C6S6wgj0er0jtIIIypl03/TzxEb3FnpqjdvqE6s9CjqEKuyUjCX1sq7BoDFUEFkB0l0spfmu/AqDEAmfIcXsFfTc4vP6eA1QUV0AP0hTYUlXOZGZOhU/q1Rt41AX3IFw1N6NlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: ed14d211-2250-4d91-a126-08dee7ce01a0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 08:48:31.2077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tUoSZquOtlUCHreoph4Am5NZ7TM3RTRIvRXuVzRcmwDFYHOJ9bC4E4cpHyDe7s0+ZG8vjwJGG6PNIBfMnlXbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9302
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

On 7/20/2026 19:12, Michal Wajdeczko wrote:
>
> On 7/20/2026 10:05 AM, Lukasz Laguna wrote:
>> When unbinding PF with VFs enabled, xe_pci_remove() calls
>> xe_pci_sriov_configure(), which reaches pci_disable_sriov() and VF
>> teardown. It requires pci_rescan_remove_lock to be held and triggers
>> warning otherwise.
>>
>> Take pci_rescan_remove_lock around xe_pci_sriov_configure() in
>> xe_pci_remove() to follow PCI core locking requirement and avoid the
>> warning.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> I was already trying this, see [1], but it didn't work
> now I guess we are still waiting for [2] as our problem was already noticed

I missed that, thanks!

>
> [1] https://patchwork.freedesktop.org/series/162346/#rev2
> [2] https://lore.kernel.org/linux-pci/cover.1776839248.git.ionut.nechita@windriver.com/
>
>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 123ffd4c1ee9..f9adf62dce03 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1112,8 +1112,11 @@ static void xe_pci_remove(struct pci_dev *pdev)
>>   {
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>>   
>> -	if (IS_SRIOV_PF(xe))
>> +	if (IS_SRIOV_PF(xe)) {
>> +		pci_lock_rescan_remove();
>>   		xe_pci_sriov_configure(pdev, 0);
>> +		pci_unlock_rescan_remove();
>> +	}
>>   
>>   	if (xe_survivability_mode_is_boot_enabled(xe))
>>   		return;
