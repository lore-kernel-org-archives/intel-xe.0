Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0822C55174
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 20:27:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C55910EFE3;
	Wed,  5 Aug 2026 20:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LTi8D1uU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57EC410EFD9
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Aug 2026 20:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785961639; x=1817497639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pW5v+r2aeX++TBYbMFA4F7FquCv/5ZxWDUTrDsPN+Qg=;
 b=LTi8D1uUFeVLnQfP/lCtLVXHTLW23Wd6KxkBEns83OwNyPCvo+DTN9vF
 lBcd4sKyu+PmY+O2pCrHJNd7rGt5du2+WaZnE0m4PqCxPQ9fttU/0H5BD
 +VtdTvtY+qC70+KJBCngjUqFHaH0V5Umzog8MNtugo5kGFEwCfPuvBghl
 +5eM/ZLHpBkfpVtQ79ZCygsHlwlumufm3GlOJoHECcu870LNlQq6+1vzH
 ymuSLzXc+KUbK4nvzmhE3JKtsN1kqWU80y4Xm22uYUMr/H9Keaf41kiUl
 rNmvI6+YRr+bxKqvyvjmo4PpQvMPrA830/gA1pdZs30H6WkJXhsHMA10A g==;
X-CSE-ConnectionGUID: Gpaa9VKMT/yn987phScZ8A==
X-CSE-MsgGUID: jKDcO8GqTH2mxSdM5DIvVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90430813"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="90430813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:27:19 -0700
X-CSE-ConnectionGUID: RQur2jKpR5qbnGO/M9u5Hw==
X-CSE-MsgGUID: g11C1rISS0ycEgfK+3YJ+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="263886272"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 13:27:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:27:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 5 Aug 2026 13:27:18 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 5 Aug 2026 13:27:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osMYWOMmV4CMtSFZvCaAJrUDD8f6inuWHgcMzuj8UDFeh+IJydQI9cYUvAqflLHjGuCAoE3EY8iW0SEtSuvqZS/4nCcTsDMfqYRKTHVRukF0YAtgfEzNsdNZzmFydtQNx4BurQiUoGnkzb78J2i6Cyj4pDlpPTevRBNCnBQE0SktddNWYMfbvlfVP5sSZXGkKDkxtjESjZj38aeWIIuFigvMkqNWCoKcoW8qFBfyIcqZYJAHoYlmP03BwsTJc2NH1ls23veaS7wy1BM7eDX1mIzNkwzlTkdvv3BhxQ5Nc3L0WilkXXIvg0xbYz2fh1fSLYXXGZjc35itej6DRG4EzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BbtAumO20NFKg9+xUZKknRFcolHAV/RLHWV5WHuZdk=;
 b=KLfwJ1hjanTrv0d5CWG1eaHeA1INKvM8X/NfBCbASX9w1n1kXRup7dK4N9i82g3OYGbYcyI9onzG5e592Ar7vo8cKLCGfXAfYGmmOIhM49lg6RkCr6aVhHBJoLNRkLsrwdPy9k03IT1dsYXswJgV1gYqJZghzoL3TefeKZeBDvxZDJ1GPxZQSrGGCJtmu4j1wgE56JRrBmBInXVsDIr7tg7toSN7c3UI+PwFTDbVTT04VuvTuI8iwMJPU1LI/SG/Ocd+cJarnT957YeTp4sZ67Fge0IuIs6fmx5XjAUn7mqGXFwGzX0ufvjgQJnq5GMFWSDp/DLozKWL7geWIQJaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH7PR11MB8551.namprd11.prod.outlook.com (2603:10b6:510:30d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 20:26:57 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%4]) with mapi id 15.21.0292.018; Wed, 5 Aug 2026
 20:26:57 +0000
Message-ID: <4d8115a8-a61c-4d34-b169-48df0e51b4f4@intel.com>
Date: Wed, 5 Aug 2026 13:26:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix a bug in pc_adjust_freq_bounds()
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
References: <20260803222107.1508812-1-vinay.belgaumkar@intel.com>
 <33e1b47caf2f450e7e80880ba51c634951082fe9.camel@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <33e1b47caf2f450e7e80880ba51c634951082fe9.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:a03:217::8) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH7PR11MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c264bf7-1022-458f-06ff-08def32fe56a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|11063799006|56012099006|4143699003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: kCjVn11GMyOEBR0b+tmUDNECMCakDaN/wZhIh+qkfZPtzRnizTJWtglAyRTwAKSPQwTvnYkwHab323BeBBgKWXD8H79DCujG/W8LnrlKQq9pAemQ0BKAhNU7mcyeIDxvjIkCCX1jKsetVcdOAzc22pR/KYG+MdiaSfCjz28XeOJKHbrAFhRLfBVMPMLcHUFwAiFzgyrrPUM1H64QLMluRHP8G0lEPgqVhNLkiXBL304Q3nxbrKqW+/LjxrCahvnxOaMB+nqpUjPEyrj+ZWb/in6gg902sx8ADlPSauOB1g04ahERgwY+haxXdu19QAqBuyjRC1GNKt3i3ftI6MsIyJiTlzwJGTdvjb7H3ygasmZR5CF4CHxqjXg9xJ1XHaFde18b0JcnXe4SSt59ueEUew7MwT+VDUnZhDc3op3Vizo6O/SnXRBSN85F9v/I/Wwwajn93fFKH3PYGjWKuRbeJDILeNOq1L1f4KHrH2ao9AjvhKnhpNNMoxEg7bBAz2YTgLbo1omzLVYzIxzvgjRqIomurxzoZEr/ODB+drIZdFKyTUY+lWSc0p/vWGteS1d2ElfxOYRB1WpjaDvXJEkOuzsV6MlPDE3B5Yg7FF776tM2Zpvjb5X4haNeJSwQCw3wM85lVfPJs+H+zSkYlWMNEySf+dLbavD5WkoSxWfyM3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(3023799007)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWpPcTV4c055UjQrWXBpdWpXdUNxdEpUamIvY3g1bEU2SnJPdHNoRU43M1BY?=
 =?utf-8?B?cHZqMHExZDBtWHRQQmFaMjQ5WGhPMVQ5ZEMyWlJiNTdxWGdHVmZETjFGdUpE?=
 =?utf-8?B?NCtGYitTSU9RNllKNjF4cDM0VWhNVWt5bmtsSnpoLzNSdzh5RFNGTmowYTZT?=
 =?utf-8?B?MndzSFRXanYxTUZ6ZXNsQlJCN2NpNnFCSG1uYU1JNzgxYm5kbjlWeWhPbXkx?=
 =?utf-8?B?d0plUWpQV0wzZ1llV3RpcEVkOWs3NFlpM1NMNkhlNVhSWUIxOGZJUDBERjZM?=
 =?utf-8?B?QVlMb2p4WTdGazNnTEFxc00vWmE2K2MxdTkrUkNrM1hVSzZxVUFwSXFrYndt?=
 =?utf-8?B?YTlISkgvTzUwNWtrUDBnMXhUcVBuS0RrTlNmaFlDdmQ4cm10VUhobGJKNnpZ?=
 =?utf-8?B?UEt1Q0RiTEUrNDJqakluR1JtekRKU0N0RWJCKzlmOGU0bFpxRzBMZWpFdnZ0?=
 =?utf-8?B?Rzl3QXBDTzVjN3MxVXYxcWlXMmdIMlNNN0xCUjZyUDJLOUh6VWptWXRjNStV?=
 =?utf-8?B?S1hqL2NoZmNvUjI1V3FQcXY4YlVrbHA1b3g4NmFaRFVDbGJsTDFQdFM3RFBM?=
 =?utf-8?B?cHQ4MGRSei9FM1NFTXFQekV1WThDYUN1U25KL0JLdnBhVk01dkRURGlhc29a?=
 =?utf-8?B?ZjJZQVdvUS9Xa0UvUkJZbFdXTVZ5dS9MNmNidS9zYUFRMmg5Z1hzenRieUM1?=
 =?utf-8?B?SFFsUWZ0eXhHWDhKQVFWTHNpZkM3a0crWWt0Umg1aVNtb0dpd05iejRSV3VK?=
 =?utf-8?B?ai9tS0N4S2x1VHh6OEYwNnVHMUxuYXBicWdyVG5FSUtTUC83UjNkWmFPMXJ1?=
 =?utf-8?B?UmZJb3M0M3pDK21oYy8rY1d5RklTVGZvRjJvL3IrSmVtTkpWZUxHUnE4Nlc5?=
 =?utf-8?B?cFpwK21jRDVTMXoydmRUYk8rdzM3KzFXMHlEQ3hvMExoYWRpY0hrYzJvZ3ZU?=
 =?utf-8?B?TmdlR2xJU1BHWmJEZHRENmpFT0NIcmZ2eElLMTVTYTd3cUcwSURJdDYrK3pC?=
 =?utf-8?B?QzR0bGxSclB1ZTRXVENOaXZHR3RpMHRaaXduL0JmdmtEQWRlczBOS0toVFBB?=
 =?utf-8?B?cGIwRmdJOW9SWTNQdjFHa0dCSmRCTThsVDlzQXlGakJKQW96TysrZExaQU4x?=
 =?utf-8?B?MHVaTEdKekUrSVdBdTBpYW45ZE11T3JJcS9MN00wekxMa0tSYzB6c3NoR3ox?=
 =?utf-8?B?aDhHc3QwQ1JSaUxDTlVXYjhtMnVGakV2R3lEQzE1ekVYdEwvTzUyZlZ6cnQ3?=
 =?utf-8?B?UTBKb2Z4c09XNC9Ra2prWGtiUllyR2w1d0lSK0tNY1ArZSsyMmNubklKRWdp?=
 =?utf-8?B?OVNOQmVzajNNY1ZMQ0JLOXMxbnljZXk2dnk2aEVIU1Y0R2Z3V0VoN3d4Vm1a?=
 =?utf-8?B?dGRRczc3b3g5OHY5SlcxRkl6SlRsd3l4ZkJHVzZpZjYzcVVhaWJhSG8vUjV6?=
 =?utf-8?B?QUwvZGFsdXdRaXF4RUZLa2xhTHY4bWw5dVJlN1ZYSEtmV0k4dVZqRUlWSzVr?=
 =?utf-8?B?SitoMGgzNVRGbmQ0bmNhQVY1cld5VGkwcEVYMzhpTmtvR3lJT3dORHMwUTRY?=
 =?utf-8?B?YnBTcURyVUJCM1hmL1FTODFIRmppekY3N3Fid2M0SC9LTmEvNmwvR0E0ZThY?=
 =?utf-8?B?LzY1Q3BGOWJFVXg4MDZlK0FlRXpvUkNHQm83b25KUjFXeG56YVdUclMzaVRX?=
 =?utf-8?B?aUE2OXdZTnd0SzZSQUdqZG1oeDFEbi9FTVlXd2dTVW1KZ3NBUndGeGN2dGxS?=
 =?utf-8?B?aDExaTkyNlpWbGZJVndSUVBTQzEyOEdCOTlRSUE2Rk9FZVNNMGQzS0ptcHVV?=
 =?utf-8?B?NGFOUHVXUUpaNUlUN1JlOUIxMDBSWTVyM1dzRGtya1QralJQNUlqNHNtRm5U?=
 =?utf-8?B?VEdacEgwWnI0N0Rzb1NwMSsrMU10TG94dHlSNmVkNStQK1N5aS9SQko5MU94?=
 =?utf-8?B?Y25NV2xHZmhzSjdpS3NubTVzQVo3a1UvYWdUdUpuOFkveFN6eWh4Um1qZWNO?=
 =?utf-8?B?NkZIUExyY2VmNzNKWE5kWURuUUtuRGpPTm93dGVLUXMzalQvWGNNNVF5cnNQ?=
 =?utf-8?B?RGlKMVlPdk12bkhuOUxUY3NlWGhsM1l1MFR6RUNxcGpla0VIcktINWhsbXNj?=
 =?utf-8?B?cTg2TzlvdHZTcXY0M0QyQlBOUHVJUGNwazhGRUM0ZFhNQmhLa3EyaGtZZjZa?=
 =?utf-8?B?TFpCRFNFRWdlQ0V6SGcyTmlacmJ3Y0FUZ3Fxb01pZWorWnlUdUhEazhlK2xB?=
 =?utf-8?B?bVV0WktiR3dPNjVRWVNzSjc5M1Zoc08yNWEyOEZmaDN5NjBWZm5QbGNhQmJE?=
 =?utf-8?B?aVlHQTY4MVZXbGZwVmhHaU9LdUJkOVV6Ri82c3BBZWQ0ZS9yS2p5WkFsMVFZ?=
 =?utf-8?Q?UlUkNnCuWnCVpRUM=3D?=
X-Exchange-RoutingPolicyChecked: OqXuyrIyUSGiwQAH04/wPEbf40pPZjV6x28+4mK4zAhV0Fc9cR0FB8jMHm7hE6tlSLTSxeXlNjzlFvnORyu1O4wpanASySrV4jGgS91jM3Lmz3AfWW7PZGzeLZtmxQCKh2BmUUh1JXO4LW7aWs4QvrPx4lgSwSn/L6tc/3rxDd4XvMXs+mQaVtYFE66+TwLhTuvzY9qTZKk4Shg5bcRtlp8Ef1Xm2A3xcKt13IzB8XYYxB1eac+jRexOLSHdbscVPiyNyd1NqfhgfOL+ivJ/x6Dvf8yWMQ5CN1J9XP2OKspTDMuK7v2f/QQoknhbcl6WtndamuJLDgKDX5seAODENA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c264bf7-1022-458f-06ff-08def32fe56a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 20:26:57.2564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJqjVw4jofg7r2a1d/WED/8/eX87KDTbzK8An7HB43R31vn0wNDDua8XLyVZ8xRcyGtaTIGDu/8sxX4SbrTqqovNU8kbuj71flpI6016jzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8551
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


On 8/5/2026 1:23 PM, Summers, Stuart wrote:
> On Mon, 2026-08-03 at 15:21 -0700, Vinay Belgaumkar wrote:
>> In cases where min frequency was actually greater than BMG_MIN_FREQ,
>> we were not using the updated min frequency as there was a missing
>> call to pc_action_query_task_state() between the two settings of
>> min frequency. Use the xe_guc_pc_get_min_freq_locked() variant to
>> obtain the frequency as a good practice, and cache the changed value
>> to fix this issue.
>>
>> Fixes: bdde16c9ac5c ("drm/xe/bmg: Update Wa_14022085890")
>> Signed-off-by: Balasubramani Vivekanandan
>> <balasubramani.vivekanandan@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_pc.c | 19 ++++++++++++++-----
>>   1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
>> b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 59f2fa79ad42..8bc2ae15a835 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -911,10 +911,15 @@ static bool pc_needs_min_freq_change(struct
>> xe_guc_pc *pc)
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>>   {
>>          int ret;
>> +       u32 min_freq, max_freq;
>>   
>>          lockdep_assert_held(&pc->freq_lock);
>>   
>> -       ret = pc_action_query_task_state(pc);
>> +       ret = xe_guc_pc_get_min_freq_locked(pc, &min_freq);
>> +       if (ret)
>> +               goto out;
>> +
>> +       ret = xe_guc_pc_get_min_freq_locked(pc, &max_freq);
> Should this be xe_guc_pc_get_max_freq_locked?

yeah, I have sent v2, fixed the bugs there. Essentially, we cannot use 
any of the get_*_freq_loacked() variants yet since the pc-freq_ready is 
not set yet.

Thanks,

Vinay.

>
>>          if (ret)
>>                  goto out;
>>   
>> @@ -923,7 +928,7 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>> *pc)
>>           * overclocking. Let's adjust it to the Hardware RP0, which
>> is the
>>           * regular maximum
>>           */
>> -       if (pc_get_max_freq(pc) > pc->rp0_freq) {
>> +       if (max_freq > pc->rp0_freq) {
>>                  ret = pc_set_max_freq(pc, pc->rp0_freq);
>>                  if (ret)
>>                          goto out;
>> @@ -933,8 +938,12 @@ static int pc_adjust_freq_bounds(struct
>> xe_guc_pc *pc)
>>           * Same thing happens for Server platforms where min is
>> listed as
>>           * RPMax
>>           */
>> -       if (pc_get_min_freq(pc) > pc->rp0_freq)
>> +       if (min_freq > pc->rp0_freq) {
>>                  ret = pc_set_min_freq(pc, pc->rp0_freq);
> Should we be using xe_guc_pc_set_min_freq_locked() here to align with
> the reads in pc_needs_min_freq_change?
>
>> +               if (ret)
>> +                       goto out;
> nit: extra line here for readability
>
>> +               min_freq = pc->rp0_freq;
>> +       }
>>   
>>          /*
>>           * Setting GT RP min frequency to 1.2GHz by default for
>> @@ -947,8 +956,8 @@ static int pc_adjust_freq_bounds(struct xe_guc_pc
>> *pc)
>>           * we aren't expecting high power output across board
>>           *
>>           */
>> -       if (pc_needs_min_freq_change(pc))
>> -               ret = pc_set_min_freq(pc, max(BMG_MIN_FREQ,
>> pc_get_min_freq(pc)));
>> +       if (pc_needs_min_freq_change(pc) && min_freq < BMG_MIN_FREQ)
> Should this be <=?
>
> Thanks,
> Stuart
>
>> +               ret = pc_set_min_freq(pc, BMG_MIN_FREQ);
>>   
>>   out:
>>          return ret;
