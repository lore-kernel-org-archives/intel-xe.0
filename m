Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA37C021A0
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 00:32:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7210EBC2;
	Fri, 14 Feb 2025 00:32:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxE00o60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998810EBC0
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Feb 2025 00:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739493138; x=1771029138;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9OcYeVbe6RLHRSFnK291HVx10tDam6TmiMvp0F5546M=;
 b=nxE00o60Jbvezac95FojFBYUE7aF5Hwzt6SWE8WtnN/VtReLv/eD845R
 footpUAL6FVWm5MovNRPM/Lqc59qV5HkF09yommfNBqekcKJj7VvGK2Ie
 Kh/IhD39aWPMPHib+sQaiNXAcKpiZjXECoyj6BtQHPmG9n+C2LQ8XEXDD
 Qf6WTUGiyuM8/adAEqZOM3zwnI6EM10bTl1cQ6LlIau2WiD0ExmEeM5os
 8cQTB1Jm8ApiUwkCXRELcmwp6f0fY+IdUVWQzAp4bOgWt7y4bucQEwsqI
 3qBJ4CKf4lwq0MLmclsjOlh5be2hLJiNmxEKC6tbwi1GgSXqiFnBBD4DX w==;
X-CSE-ConnectionGUID: 6ntY4nq5SsWxj5g/OvFCuQ==
X-CSE-MsgGUID: 52UKoS2hQMCcvWhVlAFY5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="51207996"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="51207996"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 16:32:18 -0800
X-CSE-ConnectionGUID: hSCqp//9S5G5GOKypgOA/g==
X-CSE-MsgGUID: UeGMIYflSI+vZJ1Lp5b6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="113183567"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 16:32:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Feb 2025 16:32:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 16:32:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 16:32:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrwwCUIV1LFsYbubE0PNaNlAtS/D+7SHwzcU7fH5Nke2rYAol91RqKGtODqf6XWExUT468fIbQRrIf2677AIL5t6muMu0Krr8wvjzO6MGfrj4b9TEhsH3DAuKAdCqEoDy/78EvMoA9Br+B2yMkOsDKqMoK2RfYNg3yzEnmGrq/2ifqvFyHbZN6InltqiBnz7bla6HIzFxlF4plUyrmu1UHW3VLohmZt1rDvz+L/NHfiteeuKui0Tvki0aeSeorEwqJZ01j1YYizL3o2CdiU9j+UAsa6Ec/BXYEWk3+gRCSCFVq1oWBepDOsYzTWKKhuP+dq4Lz9sWtzTEIWs54bTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BD2iU4DHwJJEheMZK7w4H8DJ5qfEFgaHHU5DCITbPp0=;
 b=IQbqwaQdI8iNidayM8XixXfkdIn2sKt2EHYq+ZNvRP6t49k28hLEzwaNLFMo5PTYaR74x5woBCp5TKeBx5Jfoirm1hlg8mNlkyG3Zypqjq0r1rxKsrZvQ9CwYScCRmpLxHQ0eSJzy1AR2l6I4f7GG0yTDqiRKDn9AyVuCCzB7GZV6kknPIy40uGtm/2txxd8IGoCnLkT5MZyBpAD69Dm50hKlW6DjJDBnbDiJnfTGZxV8g+5NveenztDwhjCwLs4gniCbCvE4+NgofdOxhmtDondhpkHwUOSCIO4ENGKNRKtxh1dzYRaPBBnxhPkN6xB/wFfVJztcdKnoYZS0/rTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS7PR11MB6270.namprd11.prod.outlook.com (2603:10b6:8:96::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.16; Fri, 14 Feb
 2025 00:31:47 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 00:31:47 +0000
Message-ID: <c458f5c6-6c54-46f1-b4a7-610d82600a73@intel.com>
Date: Thu, 13 Feb 2025 16:31:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250211200911.199213-1-rodrigo.vivi@intel.com>
 <20250211200911.199213-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250211200911.199213-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR01CA0021.prod.exchangelabs.com (2603:10b6:a02:80::34)
 To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS7PR11MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: c726a251-73f8-4012-dc5c-08dd4c8ef72f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WE1hSGVUTDlvd3NxTlRtbVA2REZqYjVibkJvbnpPNnl6YnVzcWttNUVaZlFV?=
 =?utf-8?B?NEFsTEg4dlgrYjZaZS9jbnVnR3cydHdxQVJCanNMUVVLTENpYThQNGcxdVcv?=
 =?utf-8?B?aDEvTWlrYUlrZGR3L3p0SHF4d1JLYWRJbEUybW1panNjeldEK1N5S0ZZS1B2?=
 =?utf-8?B?RHNQNzFRTlJncWp5RXFrWnVkMkJOZzdnb1lZWFhDb3RPbSswNHlBRmJuVVoy?=
 =?utf-8?B?RjhQbEhMc3gyWE9jYW4zcmErZU4zeitPK2VaY0JlQlI5WUIyaVJQSU1iQUJy?=
 =?utf-8?B?V3JFdFhlM1JqZmphL2IyaU1PdXhDd2EwUEtKb2lWY0hFbm9zeGU0L3gyYmJL?=
 =?utf-8?B?WHBZbHgvZlRqRTV0anREK1RrWGRHVS9kWnBYd0toTXA4ZmNyVDZkWVljbExk?=
 =?utf-8?B?S0FYKzYvQi9pcUpYTE9wbVRQNGlzVVB3dktZZ2VyVDB3aGRDU05NTkNUeldJ?=
 =?utf-8?B?THRNQkF0b0ZIS2pRdWRIcUVHcktxbEdiOWNtL1psTnJNS1VWYlZrWWRsNjFa?=
 =?utf-8?B?WVlFZHJjTjJkZ2NMeVBNOVdYRWZ0Zm1MaEhTcHJlQVVhMys5cVp1TnRwK1Q4?=
 =?utf-8?B?eldOckxnNEtnTDRidVBhNytlUFNrVlh1SUppU0JYZ0pEcHFiRmhtTzFLNDRV?=
 =?utf-8?B?bmt0dVIxYjhFMGZjRUlFWHpLVlRyRi9XSnlkTXRnSy91TFJXUXVVK3BkWHR0?=
 =?utf-8?B?WUVnNXhiQWFPclFOUXpQalNXWjd2MElDOWpoTm9reE0waDRTZXdKV2NranRr?=
 =?utf-8?B?dVl4UUxjOE9idlVOd3VlR1lnWVhibDdOOXJubEpTTWxweXJzUmYyaHlDQ1Vs?=
 =?utf-8?B?WG9IT1lHb0prWm42NEdxVWRBVXdKcitCNjJnTStwZkljT3JzYWRiU3JONlRv?=
 =?utf-8?B?eWp2bTl6Z3NRT0xvcnVteWNweFMrNVJZa0h0aWJrY3g5YWJqeUpDUXA1WSs1?=
 =?utf-8?B?cjNWU2VpYXpoZS9uOHJqbG5IWUlvb21oYm4xZ0l1VTRpaWxBcm1XdFNtUEFB?=
 =?utf-8?B?c1lmU1c4Vld2U1ZHeXZ3cGlyL2U2YW9WMDhQNHZudm1waEIvb3VXeEE1WVBK?=
 =?utf-8?B?YXhjNjBmZ0pmNXZLU1BBaTROQ1VGcUdySnZaNU8yK0JuZ3ZOZDFUSDNBS1Nv?=
 =?utf-8?B?QmJ4cVJzZm5nVGkwelhPWXNvbUtGUkpscU9ZK3lQZlc4dG1YSHQzT3l5dE9N?=
 =?utf-8?B?eTJ4U2l3OVFleG1ydFgvdVBESVBTODBKYmthcmxwSUFDMWJseE5SV1VzVUhG?=
 =?utf-8?B?bStUT09UVG5pYlIyUzZ6ZDdqMU5VNkxDY1I1UkhOdnFuT1NSMnlyc0NIVWhU?=
 =?utf-8?B?c1hyTEZLb1dWcFVsM1AzYndrWmJGYjU1cEhLQXQ0djVVTGpRWUJLb3RrT25y?=
 =?utf-8?B?VkJ6YTBLYk5BbVM2dHZiTldNZXlaKzNveUlFMWRHaWJVOU5ZRGNqOUs2cDcy?=
 =?utf-8?B?ZzVhdjJiTzRrZ1hpdmNOU2dHazhybGk4Z3J2UEtibUs2Q3JsR0I5L2N6YjRw?=
 =?utf-8?B?SkU1ZU5YeFkyZXZOYXg0N1NURXl0Zzg3U0w4cmtsVU9OaGJTN1QvU09WV1Jq?=
 =?utf-8?B?c0lNWmZDc0JTbVYrT0ZmTVRWZmxUYlhCSTA1NzEyK0VWUWVVVVRQa041T3dZ?=
 =?utf-8?B?SGdqQVIrajJHVDBoU3Z6YUtIN0Q3YW4yN3lqNDdUc2d6QkJFYUdaemRDVWwx?=
 =?utf-8?B?WjJXTWVwcXJINStZVHVOT0lQR01KSUU1U0RxK3hGY01vS3ZFRXlXWVk2V3dF?=
 =?utf-8?B?eXZBRWdsMVFvamEyOTZaYjRtc2xIV2JjN3Zqekpia3JpamRtakVEWFpSdTlR?=
 =?utf-8?B?VW1vMzBSNE03MEhvL1FMUUdWbllFTllSSHBaVm5CS0NLOXFhTW9BN1NQMFhj?=
 =?utf-8?Q?NMOxnpq9efL4J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjNCNTdPdTVmOW0ybk1sbzlCdU1oYm1Cdm92T3dMMUZROHZVU1ZmejRzNU5B?=
 =?utf-8?B?THNlSUhqRndxWGRlbXAwSm5wYXAzY0gxY3VoQXprL0dWc0xFT1orWkU2Zmtw?=
 =?utf-8?B?WUhocXV0ZFp2bzU2RVNOUldSZnpTclh3TS84V081S2ZZaUc0elgycVZYakx5?=
 =?utf-8?B?TWpONU5SSkJEdHd5VTU5a05YMVlzYlFNT3QwZEpQQjJSa05TU21ya1VjR1BL?=
 =?utf-8?B?OVA0c016Vzh0TElsL0d0Y0hTOFNoTVZBUndEUjZrUUttYWhCeWxaVTl0NXhl?=
 =?utf-8?B?OGpVY0pDS2kwd0xjT0R4OCtGWXFzUUV1VC9wNjUxNVRhekh5OGVya0tCMVZX?=
 =?utf-8?B?a1BwZUZrQ3lxTUE0NEJRaGxlOVdwc3oycTZ5WUs2cUxRZFRzKzcrY1M3cStT?=
 =?utf-8?B?UitQUjYrb3BLNURFc0RIWWlIb3dpbkpYWVdoL0ZvdXhNZDhieUVUd0lrYlFB?=
 =?utf-8?B?WmdhY1J0NGpQS2hNcG1hQ2Eyb3VFVStLMG16TWdnY25aYzdEajhlSnhYZFhq?=
 =?utf-8?B?aUJpYUFhWjQ2YzJraElRV0hGNlRCY0x5NmE1eW44S21aQXlUV0NMc2htenFE?=
 =?utf-8?B?Nm9QVkRiQW5uUHN5enBGK055OStCYjV0ZmltUGk3aFhmam9RMm1od2poSVlu?=
 =?utf-8?B?bU82eHVmQ1ZhQTFiYXR3TVp6UGJRSnlNNkxCcjZBVVdwM2xZWmdXbUx4SjBz?=
 =?utf-8?B?RktSYW9qQUQxdUFCVnJ1cXFXUTRsMzVUbjg4ZDNKSmRoVnZDb2U2Zk1ZTFNV?=
 =?utf-8?B?U0VKdzY1ZWxtSENxZ3RlT0RZajB6TVRmc2FYNVplRmZCakg4b1pJSnF1L1lr?=
 =?utf-8?B?WFl1a2R5YXNmaFFmcVpsVk9HMXd4N1d4N09GWkV2MHF1L3Qzblg4eDg2NlMz?=
 =?utf-8?B?TjQxajlHZnNMSCt0QWxQTnZqNUVkUmxOekZQOG0zWHFkalRPQ0tvV3NSVE5r?=
 =?utf-8?B?VjZ5OHBUR3dkR3BCTTJSNkVob2wxNStRMnBSYnF2OHorU0tBWGNvQ09JRzlj?=
 =?utf-8?B?UGl1QXpOcmM5djdGR0RIaHdrbEJpOElSa3R6UmZjcWxTcU9EWmp0SVJzQ1B4?=
 =?utf-8?B?RWRFaFpmMEphVmxWYlQ4WnFrMVY3OTdLdzJmOWU4M2xSOFkvWnFOWk85Q1VP?=
 =?utf-8?B?Y3Q1RGozTExYT3VtZGw4VysvdjhkS1ZIaGtFd3pLRUdXOVVrN1EyS0lsWkJq?=
 =?utf-8?B?b2NPSGJ1NEJDQUxFb0NNNkt0Y0ZYZHFZZXRpYWtlR2VaQ2paZnVwQUM5dXdC?=
 =?utf-8?B?aitrZ3FWQnRRSU5hZWI5TDlTTER5ZHR0Mmg4TWNVcUI5L2k1SnJXQlp1cDBX?=
 =?utf-8?B?UWQweTVlbGdydk01aFRDRlFZc04yNkVkOUZQNHU5Vnc2RHRMUWJySXR2ektr?=
 =?utf-8?B?UGY4VW9JT3FMQ3htUkwwa05kWDFYTC9ERXB3SVVjb3I0cy9JVEhCTnN1OXZZ?=
 =?utf-8?B?M0RmeUhER1MrZW1VdkpYVzkrQUtWemZ4VThCT0dkR05xT0R4NDRtVHY1UUhP?=
 =?utf-8?B?dnpIb1hsUUlBZGkzdklMRFRRdzdhSDJZOHIvRTg1cVZjQWkxL1J0aDZqWTlY?=
 =?utf-8?B?NWRSMUtzVWRraXVXenBGZzJ0QTdXVHVOR0VXNmdwUDlydmtrSlNxSWFWcmVI?=
 =?utf-8?B?Vk5iZlNpNW53VHVIVWpqUEV1a1RZS1BDbnhOMyt2bW8xbDJPbHRoelQ0WSth?=
 =?utf-8?B?RUFjZDlzTlcxcTlzTlJhRzk1ZjlpZDZ1S2dWbmlUdkdCVkJRN1N4L0RhVnc4?=
 =?utf-8?B?a2ZCUEw0aGc4Vjk5WTFWYzZkUENZZDJIS2lVK3ZHOGdPWi8xL2dlSGFodmI4?=
 =?utf-8?B?aHZRajJuRnpPSFBsRFo4Z3JjSXFNZ3I3OFJOc1pmZXdFZXdGZzhWK2laUUQz?=
 =?utf-8?B?MXJTM2NIZ0RVUzhsVkRpdjBlQTVMN0pTQmJnYTNWQ29WT0VLWHhZdVN2ejJQ?=
 =?utf-8?B?VWpsa1BmK3g0aDZjTFVIUFBBdlFhOXBFQmtDZXJsUWZhZ2dVTXFTWFhRY0lT?=
 =?utf-8?B?Mkp5cWpOUWFkQ2FCZVNPS2lUKzZaaXJKbkVQYUFQQzR2N2lheER2Z1lLUEpV?=
 =?utf-8?B?aWxQUlZBVjFJTGhYdDU3aHpIcGhNdjF2V1Nyb2ZzUnVPQkc3eHoyc3RzYTJk?=
 =?utf-8?B?MGdNQWZPNnJoR2E4SEJQK2xRRUh3U0NtUytDd09jRGdsS1Q5QnlCeEJhZyt1?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c726a251-73f8-4012-dc5c-08dd4c8ef72f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 00:31:47.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fIPN8Ak4JaX02zOLqSfMKUraynPNNtNJhDSxctd6/2b+LYPl2N2Ts2dJiIcX1/hqqF/V/jacXjBLYwzecGKQtlgVVbVRznvHgVor6CXIn04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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


On 2/11/2025 12:09 PM, Rodrigo Vivi wrote:
> xe_guc_pc_start() was getting called from both
> xe_uc_init_hw() and from xe_guc_start().
>
> But both are called from do_gt_restart() and only
> xe_uc_init_hw() is called at initialization.
>
> So, let's remove the duplication in the regular gt_restart
> path.
>
> The only place where xe_guc_pc_start() won't get called now
> is on the gt_reset failure path. However, if gt_reset has
> failed, it is really unlikely that the PC start will work
> or is desired.

LGTM,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 8 --------
>   1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 1619c0a52db9..eaa035b25aa8 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -1491,14 +1491,6 @@ void xe_guc_stop(struct xe_guc *guc)
>   
>   int xe_guc_start(struct xe_guc *guc)
>   {
> -	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
> -		int err;
> -
> -		err = xe_guc_pc_start(&guc->pc);
> -		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
> -			   ERR_PTR(err));
> -	}
> -
>   	return xe_guc_submit_start(guc);
>   }
>   
