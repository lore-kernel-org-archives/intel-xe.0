Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8530EC55822
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26AAD10EAFF;
	Tue,  4 Aug 2026 15:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JpuuXSMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F49010EAFF
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785859012; x=1817395012;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pjFCbo3mCU9nqjvXrjvhv9Pv4fnrZ3/wO/MJmZGD9xg=;
 b=JpuuXSMZm264WjkaSzjrGO2xi6krvS7FZVSKLoXjhvaq+7a/fHX4QLFQ
 TN2RPznWGQOHrie9VssEf1NECGHE4LCrElgdGlAdKCzs7jUQEzYrNJJSN
 3aOPgu6/gI2U5RgNaAGr8mS5MV6D2WPgTvv86X1WmxCWH3WyRGd9uCevk
 ktrJjy6L2tuWKLU+i2+nyskAjVsl3wByiMlMSTMEkVP0XmgHaZuEsranc
 tRBZzfkZEs7oy8MwRBCNQFqeQSpAWTJct0vxcbCfKQLPDzMh+d9y0pCCD
 xD/xIjPRhMMwyGyu2yN23BbXzBpllL8goG8+vevVRdSLIrYif+dSf5bYf w==;
X-CSE-ConnectionGUID: BRczoHuBRlata2pnMpSxSg==
X-CSE-MsgGUID: /YI9pz7xQbewZzMLooe/Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86358527"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86358527"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:56:49 -0700
X-CSE-ConnectionGUID: 1hSBc4gbS9OWS/oGy60C6A==
X-CSE-MsgGUID: jqRe54IRS3aDbKxf3TTZeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="258196659"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:56:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:56:22 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:56:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:56:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzm1SgXFCvYbkgqjrDImqJfTE7Ig010YbWj7wFPTkIvqX+lYTaBuVKUCmA2nhFBsMqx3I97zndrJCIduXEZmG6QckNk/WKrHaT9VL3U+SeTnHvL/kYp1moPaaB3p8Z4wMDo3PTkZ28Ms0XXkPEMDTaEEUBJXUILdogpZXSsilFBh1WtRcwWIBscte4P7orU+6Tw+Hz1nwDwbqRqGx/DxdrXMpWTcxDawcOOdregYFBw88/iIRGbTYhXH6vBDsfCkDI0kX4HrVOLSTcvtnmazPJLUAs1fbYfwB4+SmgyK+PLJm5T1TN3QiyJ54mhpsJ9zWKxpfrGfcse4D1YLFXdo3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1xyDVWxZn6YORPmI3HjpUK4IuhGowyaLg05cZLjqNk=;
 b=Jj0VHOQKXfWW8bdcolYkoXIcCCCtKjCWF4PtlVhxSTmbEQehcc3TzbeKK9Qi2+I4BrOdd0ihVS4uSofEAbTimnM8+X9eVGfX+Wj98lTzqvfWh3wC8O9XMh0c2v+P2YwdHPDkIC7Xq1EMc5bS23ZjvWguxWopHqVtFjAfRlDkUXEvzdF2bKVxZd5amMST7pBjI/qV9zBRORh+/+1RORgrJIdjRsd9BjvDiFaRwoyan8rga0tlv722AY0iBRG+i6XExVrTW9twCqto+u4QD3tLCZWxaa4PVQ/IH+XgddKCiy0dVwvv9Wu/mpetMF9IrLnGH8Z14mBzQ3Z/rSQ00IWW7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Tue, 4 Aug
 2026 15:56:19 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.015; Tue, 4 Aug 2026
 15:56:19 +0000
Message-ID: <d9b9afb1-7e39-4ad0-9e8a-ad6888238ab6@intel.com>
Date: Tue, 4 Aug 2026 17:56:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/23] drm/xe/log: Add hardware error signatures
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Yoni Levitt <yoni.levitt@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-11-michal.wajdeczko@intel.com>
 <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <9e60e8e5-3942-4537-bb10-ac5a3bc72c69@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0139.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::32) To LV2PR11MB6024.namprd11.prod.outlook.com
 (2603:10b6:408:17a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: ada951a8-5f18-457b-cd48-08def240ec01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +qI6OcE80Yy/Nc6Kfw8/6mDqtmggRoYkAR8QfXRHd33PAPk83xFtl0mEIeXrGCMEnbRSWX8m4BOe5QP8N7RwDfBs3CbUOx9qQwAiTYrzS5pjT8RtjxaaWjP9Hwhc55zO4iPfCC6ZqaDax8WWaCGoEsT6yZcilpxmTf6/smL6wlwOglk/BZdNWnrhgSqC1yLsVmH49AN/NLidVpqpOFtGZK66M0eyYx0qrFXEh1tJqbwzkO+h7I51UwQn9DKHfiueOhNSRFj7UmEW959gid009BbR6gJIvQ70K/JaKVIDFUpNXjxgQFe30JDJriK91O5D8/MDa1NmLM7z7F85I0UO/9JZ6nIQNa5zQtf5azgSJaQe4BSDwRP6ySQjKbWdg1jvg4XA1mqpuqCB1JEoqJ5Ssnu5kvk6dJYCLf7zgFPXM8y0kVqlrQThcnXKG7J3C/BXFuW+Qooaa3dSQxOu0lKUbyfwWHs2auz5s9zGjcdRPaN4S2QdoPYPwQAkFEOo9oAeKkV2byFja/hRDWeb9q0kom/e2vB6zfUez0C6YBjWDnDsokqbdNl1ZmgUoCsYpUNOHyiUxwjNA4aA2s+z24KZ9HhYz1fcCLoZ7ca4+eBuc+RzLyvZxpf3B3KuGaOwHNxN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzZQSWNrTnFzNUExVjVJTTFsTDVXbm9LSHBnL1lrVzEzMEhad1NEWHZweEY0?=
 =?utf-8?B?aUk0cFo5NXhGeHJ3a2JNWjZCdEFZdFhOVXRETmNzMlZ5elRPOW1lVDc3VmFj?=
 =?utf-8?B?YnpuTFRIc0RacGZaMko1Wk8yakQzbjdaL2tKNW9MNE5XeG5jYkc4d1JkZTFX?=
 =?utf-8?B?MXEwVThIeHdST2x5RDBWRW9sZHl6TlZNQmhiS2FsOTZ3VjhUTDlOaWtrZWtM?=
 =?utf-8?B?U2ZLQmdvMGhnRVNUS0RlV1EwbFhTN1BkbWVzdjc2bUlvVnBNazEvTVBqVlp2?=
 =?utf-8?B?UU9PZXJZZnlrR1Bub2g4WHBlZy9YaW9vcm0vcnhiQ0pqTmovaEJmL0hzRkUr?=
 =?utf-8?B?YU42OFcyZ3lmYWhuMGk4TjlWZ1dGMzQzRzcyNTdkbHh3L01qR1RDYjZzSlNh?=
 =?utf-8?B?NTVtdG1VRGR0ZGFHbm5aNGpOOU4wMis0MS9EYzhzRE5TelFjQmxEYk4xNnNO?=
 =?utf-8?B?WUt5Q3hlVEE1bGtUMFB2QTBXSU53VERQTmtTUHZlNklzM2Q3bkFIb0FKd1Ex?=
 =?utf-8?B?dGtad3RmT3o4Y0ExZ2p5dTZFNHNkSHUxb0IveVA4UndyY1Z0OGNvUjhRSERQ?=
 =?utf-8?B?K0tRU1BzNTZvclk3RjdndTlsckhCOUpSSTM0Z0YwSVlGZkpPcWd6UWFiOEFY?=
 =?utf-8?B?OGtNdWZOY2dqUHNNQkFmaVlGSGRzMlozdjBtK3Ayai9UVU9FZ1l4NXIySkdK?=
 =?utf-8?B?akNLMTh6ajdhc0N4SXE1WlNVZzdrb05laE1nZWtYR29qa1o0NEM2Z3ptY0Zj?=
 =?utf-8?B?ZHlYN1RmRnRnVWFsTVdzMmlsM0JWRjlsUjQvSk5GNW9vSTEyWlhxZlowMGZ4?=
 =?utf-8?B?dU15TXN3R3JzR1hKRWUwTmVab1lzSWE3a1BpaWgvYzVLajRGc0JHamNFMkh1?=
 =?utf-8?B?TDFQUnF2SU5jVHJpTHJEVk9XTC9mSHAvVHpiYVBRdHBoSFpKUC9hdEkyM3RZ?=
 =?utf-8?B?SDlSQVVmTTQrNVBvazg3TitLTHRoeDFXQjBZbmRRaitVVThSS3U0U29jdjQv?=
 =?utf-8?B?MkUzZ2VyLzJvWEYrRVZIcEpvVHFMS1o3clVtTmo0VFhXejRKVENtNVo2eE1w?=
 =?utf-8?B?SHF3QUwwOU1sYURRa2llWlFyTWdBSkJxQ01lV1MrOUZYVW56ZWl1Y216K1Np?=
 =?utf-8?B?dEkya0hFeFJEQzA0bXJMWGxHQlZOMGJXanFiUWtUYkFKaFVFYnYyKzZYSTRn?=
 =?utf-8?B?RFE1cHBvWVYvN2ZvcGxqaEJwK0tYSHlTWVd5eFNUYmc2NWNDRSsrMXdBM21D?=
 =?utf-8?B?bXZhOHFXSi9CbUNlN0syVFRiUlVPZnEwVW4zVkx0d1hqaHZONStGNmJHa0s0?=
 =?utf-8?B?UnJucVNrSGkxRXJjWHJOdnRFMWdqbDVjTG50ZEFwblNWYjFZa0tJRUN6TkV6?=
 =?utf-8?B?N1pGaUU3S1gwaGprdXlKdktOVlp4TjljWFVXVERyY2xiOEM1YlVUNzJ3THdk?=
 =?utf-8?B?T1AycmJzbHFtV2t1U2ErZnZwZ3Zkdk5mb2czWVpGVWFkNmlENVp6OWtCTnBC?=
 =?utf-8?B?amoyQy8wem56Z0FNR3pjSndYK0RxQkR4ZzVxaTB3SlFqWDhSeTB6Tkw5akpw?=
 =?utf-8?B?bXlibjJjTDFKTlNDZW1ZZDQvcDY5eVVYdlRLbzNyQXZ1QlFmV3k2cFVtU2Nt?=
 =?utf-8?B?RjgvSjBjUnVEUUdEdUZVRDNWZFU4UFBkVnRwRWp5K0t3b2V0L004K3VmNDRq?=
 =?utf-8?B?YzJxS2ptdGdrb2VlSjNQMC8yYlVLQjJhSm51dnBxYTFXVVdHeFZGT3lVQW5X?=
 =?utf-8?B?R1Flclc5NDBvTTM3dGJTSSs1MnNoMGtYaDVEZlNlNG01TnVERGowRFZsdHh0?=
 =?utf-8?B?TEdaZEJlVFVad2FTbjQ5MmpXczM1L3lWd3dWcWpTdnB1bzBrVWNqTldVZG8v?=
 =?utf-8?B?U0lmTTFMaERlcDBvRXBxQk5OSEdZSzA2cXNtci90ZXFERFZNaDhxREE1d2Fy?=
 =?utf-8?B?SGFXUWdtMGZ1bFc5T2k4U1N5SnpxTTlqYWlFQ3BtbVdlMFVNN2xEL3BsUWFO?=
 =?utf-8?B?SUV6Uk1LM2R6ekZ2bEVSSHBhbkxYRGhPNllGRnhRSjViRFJUbjZ3SGN3UVp5?=
 =?utf-8?B?K3J4VDMreGo4TEFsRDAzVW52Z3ZoU0Nnd0JGVWdieGdldFlBc2FHQ2svSTVQ?=
 =?utf-8?B?aEhrL0ZkWTZRQ1dhazdXeFl6Z1VvM3ZUTGoreGVUbWNrRGQzM25hNTRCazdL?=
 =?utf-8?B?TVZxOEdFZk1hMDFyVlRyc1Vmd2N3cGNncTNjY0VoM2NjSmp3NW9BOVdaY2pv?=
 =?utf-8?B?VnF2L28rVTdOQ21pZis2Wnh1aWlkbjVIU3Eydk9oMGpaNW40ZmdCN1RINEp3?=
 =?utf-8?B?enZRZmFYQk0vOThHM0lzYmdjY3htZEdVSDNFeHh3ZUhaWnVaaHBUbWpvSnVi?=
 =?utf-8?Q?oEjfwP8BkyRuYBc0=3D?=
X-Exchange-RoutingPolicyChecked: pNf32tChZLmQO8ToiTLje3lgjhklSsrQmmPvOmo21StTQaVFsa6lcJQvxwXaG0S3cc0hcyYYC6LOb/BtbnDdDSSDuaN49jRmXBHHWHTMopCtueUyc4ND/aFsdMh3NrbLF3lsS9GSxq6vKjqgXHpknQXd0227D/b2qWlCIRi7IJLvEuPhSY/xa8hvo5x0uJ9TaFNDLwxdR2OivBRyFyv2DgzhYSJucUgr+TOm3aovtb/nEVui3lBnZRZOQBbUCYbHwal3/DSGEqrcG5QkA0PgYDR9ESTAqm2ieUqLwNXsJ/nt+vcMRlZneZieDfY6xx15srU3ayDt9FFOMxb2xhP2Eg==
X-MS-Exchange-CrossTenant-Network-Message-Id: ada951a8-5f18-457b-cd48-08def240ec01
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB6024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:56:18.9366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IrMikqNMoL4vpG7R1cXX5b6keWL8bxFwPKLMWQwfYmWTdTsu+kGiFdU1y8jh/a9BCW/K/FMPgGBOE3faG6L4El9srNx3Uzn6YaGFyUJ6oYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
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



On 7/31/2026 1:41 PM, Mallesh, Koujalagi wrote:
> 
> On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
>> Extend our error signatures definitions xe_sigid to cover also
>> hardware-originated errors and make them distinguishable from
>> initially defined software-initiated errors.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> ---
>> v2: update comment (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 16 ++++++++++++++--
>>   1 file changed, 14 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> index 99717fdf74a6..69cce4b45635 100644
>> --- a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -159,14 +159,19 @@
>>    * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
>>    * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
>>    * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
>> + * @XE_SIGID_HW: Generic hardware failure.
>> + * @XE_SIGID_PCIE: PCIe interface errors.
>> + * @XE_SIGID_DEVICE_MEMORY: Device memory errors
> Add . @ end
>> + * @XE_SIGID_CORE_COMPUTE: Compute/shader core errors.
>> + * @XE_SIGID_FABRIC: Fabric errors.
>> + * @XE_SIGID_SOC_INTERNAL: SoC-internal errors.
>>    *
>>    * The situations the driver detects and reports in software. Values are
>>    * numbered sequentially, are only ever appended, and are never renumbered or
>>    * reused. The tag in brackets is the default resolution bucket (see the `Xe
>>    * Error Signatures (SIGID)`_ section).
>>    *
>> - * Firmware- and hardware-originated signatures are not listed here; they are
>> - * logged as reported by those layers.
>> + * Firmware- and hardware-originated signatures are numbered separately.
>>    */
>>   enum xe_sigid {
>>       XE_SIGID_SW            = INTEL_SIGID_GPU_XE_SOFTWARE_START,
>> @@ -178,6 +183,13 @@ enum xe_sigid {
>>       XE_SIGID_GT_TDR            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
>>       XE_SIGID_MEM_FAULT        = INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
>>       XE_SIGID_IO_BUS            = INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
>> +
>> +    XE_SIGID_HW            = INTEL_SIGID_GPU_XE_HARDWARE_START,
>> +    XE_SIGID_PCIE            = INTEL_SIGID_GPU_XE_HARDWARE_START + 1,
>> +    XE_SIGID_DEVICE_MEMORY        = INTEL_SIGID_GPU_XE_HARDWARE_START + 2,
>> +    XE_SIGID_CORE_COMPUTE        = INTEL_SIGID_GPU_XE_HARDWARE_START + 3,
>> +    XE_SIGID_FABRIC            = INTEL_SIGID_GPU_XE_HARDWARE_START + 4,
>> +    XE_SIGID_SOC_INTERNAL        = INTEL_SIGID_GPU_XE_HARDWARE_START + 5,
> 
> Since we've resolution bucket for SW sigid so do we need resolution bucket for HW sigid as well? If so how are we going to put HW sigid to resolution bucket?
there was discussion about this already [1]

and I guess we can add [COLLECT] here as an overall recommendation for all HW SIGIDs,
as likely all such errors will sooner or later be reported as separate SW incidents with its own resolutions
and official documentation will have more detailed recommendations (out of our scope here)

[1] https://patchwork.freedesktop.org/patch/742246/?series=171022&rev=1#comment_1368419

> 
> Thanks,
> 
> -/Mallesh
> 
>>   };
>>     #endif

