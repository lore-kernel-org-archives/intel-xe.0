Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A94C27C53
	for <intel-xe@archiver.kernel.org>; Sun,  9 Jun 2024 19:09:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7670010E0EA;
	Sun,  9 Jun 2024 19:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XIvebfRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7513010E0EA
 for <intel-xe@lists.freedesktop.org>; Sun,  9 Jun 2024 19:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717960195; x=1749496195;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=opLlmUh8hEkHDoF9wyVpRHxbl9tfSmKJA5F6Y7+PnrU=;
 b=XIvebfRDELWutCGM4ogq7xQhYQCumYJVAnp4xFEKYx36Q1fycTn55mSx
 5dtc9KAYhCf3UndToTTUo02moODfMnfvrb+3T0jIpuFTIhwDaC9EWWJRW
 uj48D3SZvWGTLRWZHvGg9gqufyePHAmFmfjYJynkqLURVFd2wYUuJ/GMK
 NsOonPjKUoyAaBe7UjcJlsVKEgiMEimNHuJz6nsKdG9uZPMLHLBdlv39E
 3saWDQewHEyPq26X4Bfn/vvAFaOEegwu9HFdOAhVxWmxcaNnLzLRyYv4v
 mLfxlKt13j4RQphRHpIlr93IOJ1BE6am03aHThbmuYEGGbLrTeGrn9l37 g==;
X-CSE-ConnectionGUID: 0MO3XF69QvGfWVA+VH2JAg==
X-CSE-MsgGUID: qODbOmNHTzCv8m1y+KMhnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="26023224"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="26023224"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2024 12:09:55 -0700
X-CSE-ConnectionGUID: LGHteDboS/Cl0gJiAkkSVw==
X-CSE-MsgGUID: AMB9MzFQQZKwqMlbVZ5BKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; d="scan'208";a="38934984"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jun 2024 12:09:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 9 Jun 2024 12:09:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 9 Jun 2024 12:09:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 9 Jun 2024 12:09:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUZh0XlvXTgjMTqBjslgy/YjuLLrNkpNewmYnqHZbl+ovd5ATU9w0K3pzmr05kLb7QLy1L0C0mnKs+QJlg09kfqzahmycHE3MHtM+x/GD4Rr+FS+O/iazR/czwjSNMypAUBHQqYOpvcNkoSQRU91NHc5jc5mrCFB5m/aVdKmJ5fv7pdUo9tYOXbvG3MN8NmYBSaald3dMQc9JU6Js7dTDAtd5/zWCPslglGaIOgO1MR0YqemZZfx+sE+ytzjDdJw6TpWfS3UjST60xBZ8TG939kkONLPZHD6znDQ4CHufpd5sMGVHRgfOMSORksxE6HfxsCfcRy+/jTmEXhg52VVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZUUGgNlkB+9c9noOHDtxzUMq7oQFsepoBzmrhEvgrE=;
 b=WjNQTNIweb/Fulkm6jZ0qAldl7wk3F2Be5nAxjgIKcB0UjTuAFIdU8rrHEXDipdcpiVhggTXQBp3ooDycqR3Dg1Nq+WI+butPo9romZq7V0THutnBrr1IODHZ6JfniWoX6+tnyuI835861BrhuRpz6q/1z2NK6TLxXZhntQv4M9tEl8XDOOEOX/Z96oKKsPRV/4nGnriq017aF+YNLi0KVHnZG/DpYILD1mwU/J7JK7T902I+yLyvSlXg4H1WeijicLm3VCF12wYZ7lF7FxX/C9kiHoqrvuvAEO4ErRLuxY56+a6Sju211S+/mnq3+R+SKMUp9b4P0UG/AjnbdC/xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SJ0PR11MB5918.namprd11.prod.outlook.com (2603:10b6:a03:42c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Sun, 9 Jun
 2024 19:09:46 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7633.036; Sun, 9 Jun 2024
 19:09:46 +0000
Message-ID: <5ed48be4-c1ab-4ed7-bac7-f5c3f7e3508f@intel.com>
Date: Sun, 9 Jun 2024 12:09:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Add pc_to_ct() helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240609181931.1724-1-michal.wajdeczko@intel.com>
 <20240609181931.1724-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240609181931.1724-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0050.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::25) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SJ0PR11MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: aa829e04-f2d4-40da-5813-08dc88b7ba07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3d5SHdDc1RYRVpsaDlVdXl0S1RMWFIrRW5kRmx3bDNvaEFOSldxbVltZzl2?=
 =?utf-8?B?Zk85dTNGV0Z6M2pBNHA3V3JUbTVXa1Zud29iREpwTGlqY3RvaDZ3SjgyWjFN?=
 =?utf-8?B?MURYOGFXNEpGbzNyK1hMRFhxdTFSM09PcTVKSWxSWlhmcVcxd3d1Y1hLSW12?=
 =?utf-8?B?V2Mrd2VrNVRVVW9TaWZJbVU3QkR2WFV4Y3pnT3NzVTdDQ0FWZkQ1QURyZHBx?=
 =?utf-8?B?KzdWUlhzSU9aZ1NkbURMY1U1V2FYZE9kMlNWWU9neXlsOVpQTVg5eDhJcE5E?=
 =?utf-8?B?dGh1TmJ2TXhMS0toWUUyWXMvWnNjalhwcFJuSTY5S3lFT1ViZ2lhOFRTd0FV?=
 =?utf-8?B?cGhlTTY4SEZvV3lNbENnZXVrRVNDY0c2WFZjVjVPQ0NOK0NGaEo4bFYycHlj?=
 =?utf-8?B?bjNmdU5qa0V3MXA2dDBkZ1RPREIrZEtYNzhGZy9JcWF5L1ZXa0c1ZzJJZnlt?=
 =?utf-8?B?NFozd3JpM1o4ZmJheUJJbkxPVjQyc0Vlendkbms4RThTY0ljK29sWXc1TFdN?=
 =?utf-8?B?cXFEVlZUMDdESGFYV1YrcTVVR2F1ZEZGd0JVZEppZktIQkNEbVdYZE0vajR1?=
 =?utf-8?B?UmxGdmVpNkMwajNxdlN3bEpDWEtGRit6Z1ZrdTMyNGtBTzJLMkFDYjcxLytP?=
 =?utf-8?B?eHdKT09EOG1CbjJFVEp3MlZZeElnODBDL01qTG5vdWtVMjVCdG1RK1U4RDZG?=
 =?utf-8?B?WEdjTlF5ZEhnYXNmR3NmbmdrdVVnNDVRT1FiT2Q5ckxNcXd3L3lTVTgrd3cz?=
 =?utf-8?B?VmRYb3hLaGtYc3hOaURCUE9ZMktlZEtNN1ZiZzFLcnd2czVTa1VCNVhCRWc0?=
 =?utf-8?B?S2NBcTNxRUVMTTlWdDZhbmc2RFRxeHQwdk9iaFlLR0dxdmFtUEdCQ0VES0Fs?=
 =?utf-8?B?YkwyanptdWMySnNBU1ZKR0tvTGQzQlhubnhZcGlRZGRQT2o1WmJPMEY3bk9Q?=
 =?utf-8?B?T1ZGNnB4bVZQcGJCcTJOYjN2OFF0dFdoZzU1dW5aV2ZqSzB2RXp5TnNSSFhE?=
 =?utf-8?B?WEpSSTVvQXUxa1AxeTYrM1JjcDlyMXpnZ3pma0VVQU9RVmY1NnJhYmhuZUlZ?=
 =?utf-8?B?VTJUWHpNMCtNWjRCY1BmS2pWUGNzS2I0V0VPTEVYeU5TQTF0eHg3YW9RRlhE?=
 =?utf-8?B?MGJtY0NDZWxaVENJODBaUG1NVXhYcDhjb2IvRnh5enQ0UlhXcGU1aHNjSll0?=
 =?utf-8?B?eG1tdkJvbVo0Y1F3dk5TZVB3bXB3N2dGUnk5VGtFa29tdWtsSGpHMU5lTkxC?=
 =?utf-8?B?WDlWdkVHcmh5NUtJVXFqSldYYWZBU3FDbTFqZFM4MVAvLzgrbUVCSUlvbjUv?=
 =?utf-8?B?SzhEUW9lUFJrVUNqNnl1MGxKY04zVzRUWU1tOG4vOUtVVDkrSFFkcUlhQlBa?=
 =?utf-8?B?L3ZwdlNLdGhQZ1RaM0lsVnBVMjA3YjM1VUlScU55aklnS2Y0eU1HdmZ2QTR2?=
 =?utf-8?B?SUxya1NYeS93L1kwODIxT2ZveWxFd3U0d2loc002YU5ZZXZxM3NvR3NadTRm?=
 =?utf-8?B?SHZ6MTRsejdEVVpXQ3ovQ0tvMEMreW1XTFpxSFowUTRTZW1CME5VZEp1bmxw?=
 =?utf-8?B?dmk3YmlMYXJXV2xUYVZVTXF0MERmODZDR01mSWxhdTBEQUVKbkJ0eHArVWEw?=
 =?utf-8?B?RzhRalcreThoUFpWM3dXQzRLVVNvY0M5cCtWbW51NzNpRTVZMWNGeHBscUNI?=
 =?utf-8?B?NWRJTUp6SlZLK08rdjVma201aHFLbEZObDU3Y1Q5TitPOEVUUnlvejRUcTlL?=
 =?utf-8?Q?LiwlgayYXsvvcup++Mnp6o0jIc/yj8+qpW2iHOV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJJRU1MMmpZN0ZaL2hhclpNY2tvZUwwRG1QbTBDZ0JaVW5JVTl5L3dPdk8z?=
 =?utf-8?B?Y2p6SGlYZ21kcks4b2pZZFgrb1Rwc0dTOUNoaVI2a0t5YzRNNE5LaE5zbjk0?=
 =?utf-8?B?bllacjYxM0VHNk85ZCtaaWZEb3ZQOFVlR1YwRlpkclhsZjdYSGVQSjhRVldr?=
 =?utf-8?B?N01TYnhmVDE0bGJ0WnRhUk9BZW9SdlQzZVpyL1hXbzQwRmc1aE9ydmt6MWlp?=
 =?utf-8?B?ZmRNazdMK3RKZ0FmYy96TU1OVExaUXhUVVQzUHZyTUIzdmNtaE5qRytoYWdW?=
 =?utf-8?B?bUJPV3FpRzJoNFVnV1hsc0thRTJTRGd5Vy8wcHB5WFRZQ1pYenIwMVpIMlcz?=
 =?utf-8?B?cHVDTlFsMktLQmJabEFCdU1zZXpReEZSeWJ0WVg2TkszUy9UVGsrc0VUeFVw?=
 =?utf-8?B?eklySjV3KzNoR3VVaFVVWDhDUGg4ZWw0WlVXMFl1K01wb2x2RXNzbDRlUDhu?=
 =?utf-8?B?enpUYjNBNVJTMHUrRzcxb1ZRT1N0K2xjQmMyTm0zbFE0UnE5SnVBUjZ3eElD?=
 =?utf-8?B?Z0JqYWJKaGx6bDFpWDdzdkN0L2lBdEhpNk9VengyMU5YK1VFOWFKRkU5UzIr?=
 =?utf-8?B?R3ZFbVk4cWxuL0JtaDJBdDhDUWlRZy9pWTBERFI0dFNwV2lkaWxZUllYcnBj?=
 =?utf-8?B?R1VUeHNNNG1PeEdyMU9raXZQSE5pTEUvT3UvNmFKa0YyMWpFRU02c1FlcHBu?=
 =?utf-8?B?YmFrNTI4bjBBWEJ2eG1nVWkxQzRtbUV6VEVrZk43anA3TG1QaG9mYjZOcWoz?=
 =?utf-8?B?elVxRklraVpSRldLTEIzSVNOWnkvOGRIUzNaV3VCZUY4TDJrS3lqUHdSZWdh?=
 =?utf-8?B?S3JTSSsyQjhFNWFzaXdDY3Q5VFBOa1R3K3lwVEdvUXhabHZLS0NCMzhINkpw?=
 =?utf-8?B?Sm9wR3VvVGVONGgzMXVaR0lxQjFXZUE4Y0RQc2N6K01Xak9rMGlMSU96b1Nw?=
 =?utf-8?B?THI2TkYvYjVaRjdzUDdwNzh3elAwTkVrQ1ErbFZjNDVkYXlXOTExRkZsUkhG?=
 =?utf-8?B?cElOZWhiYkFJenFsSUZuU2ErdHVOWXAvU2hud0tUQlMzSnNvNFlUMWU1bGJI?=
 =?utf-8?B?eE5MR09rYnhYSkpNa3oyN2tES01kOXhHUXZiQlp3b0lWbWJEang5TkpaTjNo?=
 =?utf-8?B?SVdENktRSHhHbjgrREdMVmhMcHVSYUgvaHRBRTVOblNFeUozYXhiaFppN21k?=
 =?utf-8?B?eXZxVzQxdHNOQVZaSWdxUFNIRm5iNHMrUlJqS09lVXFHM2x2aFduN1M2RWla?=
 =?utf-8?B?UHFMaUdZUnhmWXJyOVZCQkpVTkVKSzVUS1JMM0wxdkIweVlkd2psa3NkTkxH?=
 =?utf-8?B?VzUwYnBjL01uTnk4d2FaLzREb01sZWdKMHNDYkFJbTBVOWY0VjVMVXMzajJw?=
 =?utf-8?B?V05qUzQ1MEtuZFBzRjF1WjdCcTdXZDFFOVpxOFJYczUxMVdpaS9CVy9Ecjlx?=
 =?utf-8?B?NDVNd25aRmhLWDhBWkVWMVJrY0hHNjNhclZXUDRTMnJEbk92cjlBeWJxZkRN?=
 =?utf-8?B?Tk9lZzJCSVB5UzVwRFBESWxEa3JtclRKc0NUVXNPYnhyc2lybjFMbVBPZStG?=
 =?utf-8?B?OXpyc3k1YW9iS3FWUkc3cTQ5SnFrSWwydjJoUkgzdEExamIwcWQzVHE0Qk5M?=
 =?utf-8?B?L1llOW9qeEs4UUlIVmtWTCtldVdnczZnZjlSUm10WS9MTTlRVTlDaGFlY2k3?=
 =?utf-8?B?WHJPVVBEZjN6b2UrZFRoNFg2dDhpcm8yV0gzRENBbmp2TzNBd0szMzhrYm13?=
 =?utf-8?B?NnJzdmxCYzI4TSthSDh6SGZKVk1ONFkzWlJaaWM1TTloZnkwTmEvd3ZCL2J5?=
 =?utf-8?B?TnYxazdocUlpdlRodWVMeEw4MkN4VXB5K2VoK0EwWForU1NiMU0rU0ovS0xT?=
 =?utf-8?B?ckZYMGhFbTdZdG0rUTV4amNZRVZvVUk4WnRUYjN6eVRqM0tUdXB2S2FlcDAw?=
 =?utf-8?B?VDlSTXdRUWlCZXljLy9UQlNzY1BhSnp2djV5Vy8vdXNNTGNyVGxMUHFLQWR5?=
 =?utf-8?B?U2lVcE5BWnp6dm10dE14TngrdHRrVHBVdXd2M0hpUUUwNTFzL1h3SElqRjNY?=
 =?utf-8?B?RVRmSUIrU1liWEFDNHRieDl4NW9sek9tWEF5aXA2MXlreFZWUEQ2Z0txeEdu?=
 =?utf-8?B?aFJWcStQK1FPZG5PZ2NBMm1wbjdTaysvR1NqTHN2SlB6NElkYVl3aHo0MHNG?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa829e04-f2d4-40da-5813-08dc88b7ba07
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2024 19:09:46.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfeOPgoBsr36auwm4HtrFhYlGtc+Its+i4qpB1E3FyNLgnSxLtjulRnsPN8znsMbCXYXDHgtORmusm9aKRLNoju3mRoipNR4aIpEPfqq3jw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5918
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


On 6/9/2024 11:19 AM, Michal Wajdeczko wrote:
> We are converting xe_guc_pc to xe_guc_ct few times already.
> Add simple helper function to avoid code duplication.
> While at it, simplify other helper functions and fix order
> of local variables to match the guideline.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_pc.c | 37 +++++++++++++++++-----------------
>   1 file changed, 18 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index b57207bb1f11..2eb8584566eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -19,6 +19,7 @@
>   #include "xe_gt_idle.h"
>   #include "xe_gt_sysfs.h"
>   #include "xe_gt_types.h"
> +#include "xe_guc.h"
>   #include "xe_guc_ct.h"
>   #include "xe_map.h"
>   #include "xe_mmio.h"
> @@ -66,29 +67,27 @@
>    *
>    */
>   
> -static struct xe_guc *
> -pc_to_guc(struct xe_guc_pc *pc)
> +static struct xe_guc *pc_to_guc(struct xe_guc_pc *pc)
>   {
>   	return container_of(pc, struct xe_guc, pc);
>   }
>   
> -static struct xe_device *
> -pc_to_xe(struct xe_guc_pc *pc)
> +static struct xe_guc_ct *pc_to_ct(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc *guc = pc_to_guc(pc);
> -	struct xe_gt *gt = container_of(guc, struct xe_gt, uc.guc);
> +	return &pc_to_guc(pc)->ct;
> +}
>   
> -	return gt_to_xe(gt);
> +static struct xe_gt *pc_to_gt(struct xe_guc_pc *pc)
> +{
> +	return guc_to_gt(pc_to_guc(pc));
>   }
>   
> -static struct xe_gt *
> -pc_to_gt(struct xe_guc_pc *pc)
> +static struct xe_device *pc_to_xe(struct xe_guc_pc *pc)
>   {
> -	return container_of(pc, struct xe_gt, uc.guc.pc);
> +	return guc_to_xe(pc_to_guc(pc));
>   }
>   
> -static struct iosys_map *
> -pc_to_maps(struct xe_guc_pc *pc)
> +static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
>   {
>   	return &pc->bo->vmap;
>   }
> @@ -129,14 +128,14 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>   
>   static int pc_action_reset(struct xe_guc_pc *pc)
>   {
> -	struct  xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> -	int ret;
> +	struct xe_guc_ct *ct = pc_to_ct(pc);
>   	u32 action[] = {
>   		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>   		SLPC_EVENT(SLPC_EVENT_RESET, 2),
>   		xe_bo_ggtt_addr(pc->bo),
>   		0,
>   	};
> +	int ret;
>   
>   	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
>   	if (ret)
> @@ -147,14 +146,14 @@ static int pc_action_reset(struct xe_guc_pc *pc)
>   
>   static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   {
> -	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> -	int ret;
> +	struct xe_guc_ct *ct = pc_to_ct(pc);
>   	u32 action[] = {
>   		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>   		SLPC_EVENT(SLPC_EVENT_QUERY_TASK_STATE, 2),
>   		xe_bo_ggtt_addr(pc->bo),
>   		0,
>   	};
> +	int ret;
>   
>   	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>   		return -EAGAIN;
> @@ -170,14 +169,14 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
>   
>   static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   {
> -	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> -	int ret;
> +	struct xe_guc_ct *ct = pc_to_ct(pc);
>   	u32 action[] = {
>   		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>   		SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>   		id,
>   		value,
>   	};
> +	int ret;
>   
>   	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
>   		return -EAGAIN;
> @@ -192,7 +191,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
>   
>   static int pc_action_setup_gucrc(struct xe_guc_pc *pc, u32 mode)
>   {
> -	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> +	struct xe_guc_ct *ct = pc_to_ct(pc);
>   	u32 action[] = {
>   		GUC_ACTION_HOST2GUC_SETUP_PC_GUCRC,
>   		mode,
