Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B137EF47CCE
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 20:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02E10E8B0;
	Thu,  5 Mar 2026 20:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9velahr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF8D10E8B0
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772742914; x=1804278914;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qERXrWgQgqZX5MR3osa0dm+0FbHUCsJUZyagyfC1bYA=;
 b=k9velahr3zSJBG1IeKsvgLg2x5IxYQYjwgJVz00eJeIZYubgkcfzT8Hs
 4XAGXdy3IumzK+LRIXx9XH3E9ti6rMiDDm2PtAY518aF/K7ii5e7p8xCj
 F4+wEcTWXCV6FMrA5kpRMdaYLrqCPfFL8Z4o2zqSNtE04iKokkSOr4EQG
 WUAgBP5QgQscEf0mSxeEdJIJ5YWbu066mL+ZA9nGHBfeB7e/eF0x+fxkn
 ZetvwoS1Hhb7n5eWMVX+iIhygKy7VdXbbYqOWznjSeZ+8b1DlmhxKDBQ+
 Q2+j7nHfC56uEtK/ObC3Zf4mDS/m49WZwr1f+AjWOcZ64FRoFyj2wXrBO A==;
X-CSE-ConnectionGUID: sT2vp26cS2+RQoB8D1LUKw==
X-CSE-MsgGUID: PInX+Xt1QnWGJt5DbY0N9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73759030"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73759030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:35:13 -0800
X-CSE-ConnectionGUID: BlqBO8xmS0ix0wj3jpf/Vg==
X-CSE-MsgGUID: pHBzSUY9QGWLfxUR3teAhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="222936400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 12:35:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:35:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 12:35:12 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 12:35:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jrkm+8Pid3RMH2J3ZbARYbpAEBrANkJw2Udvu+YmJfqzadAiLaiHGR7MW0s/EcD+6yY2tQqUyhpRlqUjqLC/XRKXdD4MYhSRN8LOuEvEy7ijrGZkhglLbW0W2cPCzFOdaXQlPmB7u2oRekTnOF6lYqW/5ufrTeGJUaWdo0QYmqWqsI9Ih9zgIcd5Nn/uWgU8uhKPWzYq5/i6ZH8vA/CJdFsIk1g4n5af9a2Gx9m7rHmO5NBPUXnVipndWpUJybf3VZ+5b39EMEp1D7jk9sJvpeAfkheOMTPR+8ABD+7yzbnvSKVohwmEc6Thg0/EnUAProuGI7GHmy0Pp57IMuuqzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vg4pEJ75KkgBxoqoTBBl75Z2pNhq1/8MozJ3toMstaE=;
 b=CXCDeZXZmpsZcUBZ8embL6PNnNx19DPnQo6jZlO8f7OIIaFoiJUewpL/hPLm6X6nXFDn+Xm2UosJikJCsg9d3mTnMyS32GWzKNNMKA8dxfoo6wdEk7DJ1OhF0GSNX4O1KDTHQhjQ0JFDJMIWFX9BwkIDye7l0Sam/z8OT4zjZKv4hb6Y8Kc66Ca/ExpcwYECbG/kHVOVOMxHSvhnP9nK4XB80DBH9U2d5zkz9pw75/5oo7bjoBmDeHEIaEuHuJ2y24WCMAemnq7sc9Ne4OgbusJpFTYx3t8XaOQvViaqblMnkyxs+O7bDY7tnz+fTEtdh0hOk6k6Ok7IlrWXPlJ/VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by SJ0PR11MB8269.namprd11.prod.outlook.com (2603:10b6:a03:478::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 20:35:08 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::a086:2649:bc88:db7d%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 20:35:07 +0000
Message-ID: <016f76b2-568e-4136-9a6b-b2be903c7ca9@intel.com>
Date: Thu, 5 Mar 2026 22:36:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v5] drm/xe: Allow per queue programming of COMMON_SLICE_CHICKEN3
 bit13
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260304075529.1250065-1-lionel.g.landwerlin@intel.com>
 <aanXT8gDwVQOXt2I@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <aanXT8gDwVQOXt2I@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0116.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::9) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|SJ0PR11MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: a4599bb4-891c-4a1d-e95b-08de7af6b044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: T69tckXR22m2uuIQB9XQLNQ1n3OSVibU01g+tFQFPPMO85Spqxyr/wyobQCZ8+vqLgFDwockuaHU+88sjsNFp89KF9S/g3mmlWN726kVt8URw8O62tm4vURd8yIQ6JG2RPKbPjRMCPiTCpi3w6y72QhjqA6hxK6u4XfDUSrCX3JBLoi9Pe3R0n0ptVTVk6Nf/ZOLQ1zgO7iLD2T5xuL9+fcEXfM2YVbvAvH+KpzWos1UkSe+x/INDfmhw+lN+0j1Lf2or6zfjZgc5RSbzq42CPBbGsXDcdAJnJtIP/et/NjeM+zMlbY9njXWdqKd/9qZ8Q3t9xOIG21rghHM1LABxV493jqkpe2G1Cwj+o4LNWjFDiIlF2v/58SQPXQEiaOKlwXxV4CDswKUgtKcSl564rzcfUVmfFEIqr4ILeXYF6qZpI/4og53LXiGrePH3DmRaimdmMN3wrUamKTN6C0bikOXbsoyi60S2oDmi12H0W6RJdIWHQFFNsWEJuUKHLkzauyK71FCa6kZFncpc3YGlH+ISBFlJy8EhmGD2Q8skF49WPf13N2O5Xn9r1LbpJvXWEATgcBhmOida4iNIlSbKyCboMcuxCriVLFSalGAo1C8vt9+8AKJtf3lMQbLnIX4723OI+06y2CRFnICVpd+4oz+72g8TeAPmHDgQjfKpBKMLY/SzYv0Mc0XuGxPI1dU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3ZxUmJncU5hUFNIV2VNQXB6TkM0Qk0xSGtIeWRtQ1dEbEp3UUY4SjNyR3FT?=
 =?utf-8?B?VVhUR3NqWTRuM2plWDBZemQ1U1NWbDdCK2k0Y1ErazljQ1dtY2pwQlh3OWdB?=
 =?utf-8?B?SEIxMTNXU3pYQWJqcEZiTVlic0dscGR6WUJ0cDNwaWh0dVF4S25rUnJlcjMz?=
 =?utf-8?B?QnBMcEFQcFU2ZkZLajc5UWQ1Z2tyRUIrelFwNFdXL2E1a0crL1RIeCtGMTJC?=
 =?utf-8?B?d05CdTBJYUc3QmVCb0ZpY1FDTWxHcmprQ3h0RU5JUjJ0eFpoODZUNm5BWW1r?=
 =?utf-8?B?TWNINENCZlQ3M0VWalJla2V0eldsMXAvOWZIcThUZHNhSCtUTXF0aml5T09N?=
 =?utf-8?B?SGszQjZKaDBFcnhTZGJEWFBBNHdPbnBCdEQyWmtOVmt2MWZaZ1F0YWJPaWQr?=
 =?utf-8?B?Nk1iZStqaEFYTXpjc0xXcUVBNFp4T1FSSUZkcjRYSGppK3k5eWlBdklwWk9t?=
 =?utf-8?B?QURhOTZVdU5KYVNzMUNOSDhsL2VESTQyM3VpKzhPSk96bUlvVTdVZ2JONUlV?=
 =?utf-8?B?K3AzVS9zWnMxdU9TbVROWXQ2ZmZvejEwTFROOUVveVYvQzBCOEUvdTg3a3Z2?=
 =?utf-8?B?UDNFM0lnRDZzUjZBcm1NK0Y4T3ovT29OdU1RZFRLc0ozWWVHY2JSdTM4TGJP?=
 =?utf-8?B?NXpQQ21MQ2VndGg5bGlBb2llMkxRTXhIWlJuMk1YNXVwc2x2NVRNTkc4ZzlP?=
 =?utf-8?B?SWQ4b2RSYTM2T2VZRnU1bUcwMkJ2OHFaYkdKRDNoRkt5c21tZ3JkRnVDR1Jp?=
 =?utf-8?B?TXdZbU15cXpmTWlNVFczclNidVRsWW8xcm9Ka3pVUXFJcDF5VUZXK2pGc0hX?=
 =?utf-8?B?Skl4K0t4SjM5bGowUVhFS1Vtc1ZMcEhSeTMyUDRCaU01N2NRTlJZNmxvUDV6?=
 =?utf-8?B?aHVNaTU4K2NYdXFraERHQi9OVXBtVDh2TytkZXJDVjA0cUNlVE9zR2FyTFo2?=
 =?utf-8?B?ZUl3YVQ2SmZoc2xtdEFFY09IbXNIR0xlQVd4YVdOOHF3cUN5VWNUUEQwVktk?=
 =?utf-8?B?ZzBqK2hqTjhJUXR0bisvM3M5K2pkMXJ1Tll2M3ZCbXM1OTlLcVVIMmIyeHN3?=
 =?utf-8?B?ak5nWFovL2xRUG1uWFZEMTl5Z2NoMzZSZGxvbFJnT1ZaSGpaMkdoUFhJOHR5?=
 =?utf-8?B?K1Jqck52UGw3QWh0Y3Y0Yi9kckNCOFZqaTlSeVQ3Ylp2aWFZWVFEWFZac2F5?=
 =?utf-8?B?Yy9IS2ZNcUMwN1RmWUlRclBOdWtJRXNiZjEwSnhvTkZveWF1T1llcTkyOCsv?=
 =?utf-8?B?am52Z3FNT0RTK2FGNjQwZFZzc1B6d0dlZ1ROekhheDMxV3YwYjJucUdEZ2pL?=
 =?utf-8?B?eXV5TDhFK0ppcVBmMDd5OU12QVdMbldkdzZOL01YNWhvQUlIdjZ2cGd3bVdP?=
 =?utf-8?B?K3d1NktVcVZ0Z29nRTlua3ZvalVYeWRPRk95WHJROXNVOW0vZkNnd1VhRmhF?=
 =?utf-8?B?YU4yYlJBY2pEVHpnRGxJUG8wMDFrSGtNZFV2QlpqZlQwc2tDdTBOSFBrS1Uv?=
 =?utf-8?B?R0FkaVdtTXpmWHB1Z0EvdHZ0ajJJeFlUWmJQajUxWFBFUzhRM01pa0JRbDJn?=
 =?utf-8?B?ditiOWtNa25GZENPV0ZuMXluMFFzVXBqZk9HS2pGcXU5NlNuYXN2TWNWdFJI?=
 =?utf-8?B?dTV2TnFKRXVXUFJINGpHcFVUbFA4aElESnlRUXBoS0VyUzZ2WVpJUUQwb2xk?=
 =?utf-8?B?RXE1cEo0ai9uQ1VPYzlRdC9tZndZcjNhZVgyOUx4dUg3Y1BqSm8yNllFUm4w?=
 =?utf-8?B?eGlDMlNycTF0dmlmUkxETklyTXJ6cStBRURtb0tqR3o2SXhsYU5BRmdFTUVS?=
 =?utf-8?B?SVdvc1IrdDNpQnhRams5WHQrbmJuOWdEa0FjRndiNmlTak5RWW0rdnF0RHNm?=
 =?utf-8?B?VWRITkgrNkhKYjBnelVIVU5EcGMyMS9NaEs2R0liQTFNZzNGUjFCWTV6Sm9k?=
 =?utf-8?B?OUh3RUlqVURsSDQ1RGt6b2lGV29WT2xIMlgyRUxwN3A5enU0amF4QldkQUZo?=
 =?utf-8?B?UitJc1I1b1VLcS9XVi9aTTJac1BYbHF0VEF1VC8xay9oZWlEQ2hKd2l0Q3lL?=
 =?utf-8?B?ajUySDcwelpiUUduOE9WYkpuK1ZpdUs4M1Y5NGUrL2N1cWhNMlVhNkttcXBK?=
 =?utf-8?B?cUZoSXczekt4VmNUcUdJUEh3TDRweVRUZGtTU0JIQ1NYMEt6UUdXSUpzV1V5?=
 =?utf-8?B?eTRzM29zK2lBSFJ1U3ZVRUJaWVBvbXRKbFNwbVkwYnh6bmZTVEJWcGhGMHlp?=
 =?utf-8?B?UVdCcGxqZm9UWjI2bVM5Z25adlpneXFxdUtHTzJTTkpVTy8yMnVpQ3pJM1dV?=
 =?utf-8?B?VlNiRFdTTlIzVEFzZHN2ZWpaZ0ZWYnBGdFpHVzRFVHlKaTdQTFp4UktWNGZ5?=
 =?utf-8?Q?sH2a5fcA/zi3DbsI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4599bb4-891c-4a1d-e95b-08de7af6b044
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 20:35:07.3042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hepcXugWnTNEz0uFczpvCubOo+Zo6Vle7HX5dJ5LPEfNgEstjTpwuf337KvCb+Av/YBBgztBSxUcfMKZHMXVGbwPGdHiFGEt3wAMPzYJJj0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8269
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

On 05/03/2026 21:19, Rodrigo Vivi wrote:
> On Wed, Mar 04, 2026 at 09:55:27AM +0200, Lionel Landwerlin wrote:
>> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
>> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
>> that instead of putting the register on the allowlist for UMD to
>> program, the KMD is doing the programming at context initialization
>> based on a queue creation flag.
>>
>> This is a recommended tuning setting for both gen12 and Xe_HP
>> platforms.
>>
>> If a render queue is created with
>> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
>> be programmed at initialization to enable the render color cache to
>> key with BTP+BTI (binding table pool + binding table entry) instead of
>> just BTI (binding table entry). This enables the UMD to avoid emitting
>> render-target-cache-flush + stall-at-pixel-scoreboard every time a
>> binding table entry pointing to a render target is changed.
>>
>> v2: Use xe_lrc_write_ring()
>>
>> v3: Update xe_query.c to report availability
>>
>> v4: Rename defines to add DISABLE_
>>
>> v5: update commit message
>>
>> Bspec: 73993, 73994, 72161, 31870, 68331
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> could you please share the Mesa gitlab PR using this?
>
> Thanks,
> Rodrigo.


Sure,


https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39982


>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>>   drivers/gpu/drm/xe/xe_exec_queue.c       | 19 ++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>>   drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>>   drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>>   drivers/gpu/drm/xe/xe_query.c            |  2 ++
>>   include/uapi/drm/xe_drm.h                |  8 ++++++++
>>   7 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 66ddad767ad44..aa6dd6885fbee 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -180,6 +180,7 @@
>>   
>>   #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>>   #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
>> +#define   DISABLE_STATE_CACHE_PERF_FIX			REG_BIT(13)
>>   #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>>   #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>>   #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 2d0e73a6a6eee..546f920ba8af8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -353,6 +353,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>   	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>>   		flags |= XE_LRC_CREATE_USER_CTX;
>>   
>> +	if (q->flags & EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX)
>> +		flags |= XE_LRC_DISABLE_STATE_CACHE_PERF_FIX;
>> +
>>   	err = q->ops->init(q);
>>   	if (err)
>>   		return err;
>> @@ -910,6 +913,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>>   	return q->ops->set_multi_queue_priority(q, value);
>>   }
>>   
>> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
>> +					       u64 value)
>> +{
>> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
>> +		return -EOPNOTSUPP;
>> +
>> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX : 0;
>> +
>> +	return 0;
>> +}
>> +
>>   typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>>   					     struct xe_exec_queue *q,
>>   					     u64 value);
>> @@ -922,6 +936,8 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>>   	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>>   							exec_queue_set_multi_queue_priority,
>> +	[DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX] =
>> +							exec_queue_set_state_cache_perf_fix,
>>   };
>>   
>>   int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>> @@ -1006,7 +1022,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>>   			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
>> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
>> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX))
>>   		return -EINVAL;
>>   
>>   	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index a1f3938f4173b..8ce78e0b1d502 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>>   #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>>   /* for migration (kernel copy, clear, bind) jobs */
>>   #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
>> +/* for programming COMMON_SLICE_CHICKEN3 on first submission */
>> +#define EXEC_QUEUE_FLAG_DISABLE_STATE_CACHE_PERF_FIX	BIT(7)
>>   
>>   	/**
>>   	 * @flags: flags for this exec queue, should statically setup aside from ban
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index fcdbd403fa3c6..73a503d88217e 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -14,6 +14,7 @@
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_gfx_state_commands.h"
>>   #include "regs/xe_engine_regs.h"
>> +#include "regs/xe_gt_regs.h"
>>   #include "regs/xe_lrc_layout.h"
>>   #include "xe_bb.h"
>>   #include "xe_bo.h"
>> @@ -1446,6 +1447,7 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>>   	struct xe_device *xe = gt_to_xe(gt);
>>   	struct iosys_map map;
>>   	u32 arb_enable;
>> +	u32 state_cache_perf_fix[3];
>>   	int err;
>>   
>>   	/*
>> @@ -1546,6 +1548,13 @@ static int xe_lrc_ctx_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct
>>   	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>>   	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>>   
>> +	if (init_flags & XE_LRC_DISABLE_STATE_CACHE_PERF_FIX) {
>> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
>> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
>> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(DISABLE_STATE_CACHE_PERF_FIX);
>> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
>> +	}
>> +
>>   	map = __xe_lrc_seqno_map(lrc);
>>   	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>> index 48f7c26cf1298..e7c975f9e2d97 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.h
>> +++ b/drivers/gpu/drm/xe/xe_lrc.h
>> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>>   #define XE_LRC_CREATE_RUNALONE		BIT(0)
>>   #define XE_LRC_CREATE_PXP		BIT(1)
>>   #define XE_LRC_CREATE_USER_CTX		BIT(2)
>> +#define XE_LRC_DISABLE_STATE_CACHE_PERF_FIX	BIT(3)
>>   
>>   struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>>   			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>> index 34db266b723fa..4852fdcb4b959 100644
>> --- a/drivers/gpu/drm/xe/xe_query.c
>> +++ b/drivers/gpu/drm/xe/xe_query.c
>> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>>   	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>>   			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
>> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX;
>>   	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>>   		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>>   	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index ef2565048bdf1..df1dc6b9cbc8c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>>    *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>>    *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>>    *      This is exposed only on Xe2+.
>> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX - Flag is set
>> + *      if a queue can be creaed with
>> + *      %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX
>>    *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>>    *    required by this device, typically SZ_4K or SZ_64K
>>    *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
>> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>>   	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
>> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_DISABLE_STATE_CACHE_PERF_FIX	(1 << 4)
>>   #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>>   #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>>   #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
>> @@ -1285,6 +1289,9 @@ struct drm_xe_vm_bind {
>>    *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>>    *    priority within the multi-queue group. Current valid priority values are 0–2
>>    *    (default is 1), with higher values indicating higher priority.
>> + *  - %DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX - Set the queue to
>> + *    enable render color cache keying on BTP+BTI instead of just BTI
>> + *    (only valid for render queues).
>>    *
>>    * The example below shows how to use @drm_xe_exec_queue_create to create
>>    * a simple exec_queue (no parallel submission) of class
>> @@ -1329,6 +1336,7 @@ struct drm_xe_exec_queue_create {
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>>   #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>>   #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
>> +#define   DRM_XE_EXEC_QUEUE_SET_DISABLE_STATE_CACHE_PERF_FIX	6
>>   	/** @extensions: Pointer to the first extension struct, if any */
>>   	__u64 extensions;
>>   
>> -- 
>> 2.43.0
>>

