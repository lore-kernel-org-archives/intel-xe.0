Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A581C54FD2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 08:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2463710EE4D;
	Thu, 30 Jul 2026 08:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I/3vwSSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB210EE42;
 Thu, 30 Jul 2026 08:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785401117; x=1816937117;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Md8+PhZaCYtfX3pdnaG6R2wgmeqJIveNtLTPNu/cs44=;
 b=I/3vwSSKeXbHhpnMj/pEod8EeiVPdI1PJfe6f+JGIMrZE2ukPtwq0G0J
 rtU0mH4SrA86+TfQYl+kolNupmHVh905/A9G16ulWN1iIq6tSEBZmTpi8
 aM7qHRtIC97yGtkdnltZLBSv39A1VSv25HPeSNbpG2FE+9Ffy3oow6fyx
 z91Sd2qzIpJHK60rwwH2FWLpk7pzvcqB5qrkD6hoDhqqA/xmOdmW3g/T9
 Jee5+MdPGiPr+MouVT+FOJNcY4cDiEyW2mWAmZC/7i71qKuJrZqOFrlA4
 IpqcFeUwEJt1N4sw9etFgUa5wbYAkePnhkPvcygoZBV2O/gJs3xG4R1hu w==;
X-CSE-ConnectionGUID: h0Qeu95MTTehoLmyqqgdfA==
X-CSE-MsgGUID: xeRELKVFSe6aYwgkoEDlDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111562006"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="111562006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:45:16 -0700
X-CSE-ConnectionGUID: 0KViXWJESI+PCf0akUWnsA==
X-CSE-MsgGUID: QOoFNb/xSYOYU1n84Cur6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="298454957"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 01:45:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:45:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 01:45:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.13)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 01:45:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GRB9e60qeQk3nKXPGzyav3QayzGhfBL+53611cKxBnGdB+6v8BGDRFrkSPoFpHkSwa2olX9H5xJePN0mMxCMh8dsgl+cVjeaBjHd11iofskWD+TyTqfssHBnuSQOqNWTVnCAtlmb5a9cuPTaHOm4ecZOUcjDQoVQDfpBQghOiqKYZMGws+VkdULe1tjk8ogWtJlVCXV6umlrL5EcYLtUgtv1XPGXmbp2Uv6Q3v3siUawdtvf046wzr0bt8WxLusMyqsdxqOn2dFPXtFdLGA0QNXVtSIaPUCpX20ruRR4iKxlctVrAFj7S2s3vJTG0uSkNwZulKdV3iDtppkmX5DUHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bjV3wgig0p1x24fnMP9MuUWzVFZC3KVl8LV2vvKsiA=;
 b=RpDro9caGl0Pe+6dlT8z84hXYrJlZY0R3H0xbSQIaOHpSdprpOMkz66Es4nEUK8xO9oW2VilCOLwLIEYSgRlhq6ob0LE/ZjEHfgyolJ9zuWwGVqsmCLQRlzX3tZOrPO5LV4hUI0qSzYwBHEtAf9LvVUy1XyvHcwEZyUQgNJicEzT+rIkU2ZuxRb/fs2EyyangThLY0LYV6IcIlurLuIFdMfmHroyw3+2WdCMitUiLm1SPL5MQOk2k8IJqYFGd3TnEcQgPpVA6hvXli/OTTV7lOyB3lhXL8TSbje9C8ItJkIYttg0Riay0ylH6QpCYGrvh3rZ/5C5wMG2vNpoxIBOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DS7PR11MB5968.namprd11.prod.outlook.com (2603:10b6:8:73::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.10; Thu, 30 Jul 2026 08:45:12 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.009; Thu, 30 Jul 2026
 08:45:12 +0000
Message-ID: <86ce2be2-e618-458e-b31e-81b4dd16d78f@intel.com>
Date: Thu, 30 Jul 2026 14:15:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] drm/i915/vrr: Compute CMRR fractional timings
 generically
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260728145943.3848704-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260728145943.3848704-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260728145943.3848704-7-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DS7PR11MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c1d591-c1c7-4afc-cb4b-08deee16dea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|4143699003|3023799007|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: h1dGla3v1Wv9/Psh8ZO8BjtydlGg0G5eHK0kD4kxuV1duFRlNR7alACrfPMGr1PzWhKVMOcFZIfdCOyMhomQysmqQTfuNfSyl5qje3Qzi6wTxLuBvC3xu2Aft8F95f1QUy1lJTsS1wcr0TchvGZoK9bcIHW0IzqYH6v+ygBDULdA2PIH3b9l4F051KuKUVZs+x0RaY8cCGlo7o6yqUMpQDg/cO2PwgYOOWSMd8FX2KJHCWUhqgq/6Z4IPfg7qK1YlpKDC+AcmN3sI0xdyhFZB5PhSq0QJSNU4YStBQv7U7WFOOzxOPeCT/vNSraFpCPzWc2mfvLMZOgXdzsqBPjiSFb7pXMlsYhC7yEz9vDh/OG64eVXuSJPC4c0u7FKl264OJkZlBekUL5KId9ybsHYwy73Jpf2pcZsAyy/+TD/DaARcKlkm8oQrRN24b/6rL7eTFKVu674BUj5uO8k/iLUPDc3Ox04PaPeHVmKiyRToj5K0m6d0I7HwqoBdYJjUYqcA3MRPyDzhKWl1coQexHxM4OFdfAnYnwEqrdDOHfXs07zT0bPE8jU/Jb6jMW6BCTmmj2qJxoApGkc+lh5xgyGqH72CF04jsKEUpiihx5D1QAMqBfu1s8gB9uGfy4vOGhOOyNOk67Kj0W2TeRnKZiV45AjNuJLdpxQCUxjH9vgm68=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(4143699003)(3023799007)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDJGTEdDU0tPNVNSZzloSU4vQzF1WnMwTmdKeGF0UlBRU1RqL3E2bnBKYlJK?=
 =?utf-8?B?U09xNTlyQlh3RjR5UHF3Z2NOT1BIT3c4b1p4MHA2cDE3RUx2c25kaEpKNXNS?=
 =?utf-8?B?UnkrUVlnelo4K3V5SURMbGFqbmxuWDJNaDJmZXh0blZQeC9FMUhxdWRMYXlh?=
 =?utf-8?B?TSsrdzBVRTBLRlZGRis3dG02ZFpJaGdCVE55M2NTU1lFUUZaMnYzVTBYcTBZ?=
 =?utf-8?B?bE5PN1hNam9VNjVldXk5WkttVEsydXFmdmtFcHdQWXZIQ2tGNTJoaUNKeEh3?=
 =?utf-8?B?MllYSmhtYzdBZFN0eXNkZHZWUWNDTlJXSndtZ01GUzBURCtRUHVCZzRLMzZy?=
 =?utf-8?B?TmdKT3RETTFGTmMxbGhhMHhPTExDY1YyeVIrT0ZpSVFHQnFPMThIcGhocGhO?=
 =?utf-8?B?ZGlvZFI2UFU3ZEswY2t1T28wS2EyeTkvbURSZHNJaGVLN0c5b1pGQ2txbmxJ?=
 =?utf-8?B?dkU3bndtRUdFb0Mzc2VvWXVBdkgvL1g4dkJiTUIxNnVBU2RUQzBzYlR1VE95?=
 =?utf-8?B?VzRmZmpGYUlsRy9YRzAvd0MvLzQ3WGtiMXpkaXVFUlo5U3ZRSVZML1p3Tmc0?=
 =?utf-8?B?QXFXSldUV2w5Zlh5ZW1KN1JXSXd0eUd2RWdZUEhKOUw5OW5mdXZLTHNmVnh4?=
 =?utf-8?B?clBYaUFkU3Q0WVZqbkZibU9WNU5YSnR0TFJUMklIT0loRjdCdnVCYUdIQXVK?=
 =?utf-8?B?TllzdmhVbUcvcFo2NzFhT0xDL1FTUUcyaUlKVW5oeEVkQzU5NkRrVlJ1VTk3?=
 =?utf-8?B?MmcrejlCVWhuZFRhN2xEMnRmUGRjazFaSEJuZTdmVmhDSDRiWHpPQjN6dWVn?=
 =?utf-8?B?SG5XcVBrTFVyYlByQUIxdVNmckREd3prUjdmby9iMXR6aEtwemw0WnZNWVBZ?=
 =?utf-8?B?aWRVZzlIbnl2b2M1TUVkRHZ3eVlrRWtnclcvTXRmbTlubCtDTXY0R3kvYU5s?=
 =?utf-8?B?YmxEZ0VOUExPWXdGY3pXUFBXZzBSSGNTRFI1UkNSNFhBQ0dLVENZempoZjN2?=
 =?utf-8?B?ZVBqeGltL0pNemZwRVpnOFFsVkdJa2x4dVN4M3RGOTdhZm45ankraEN1bmtp?=
 =?utf-8?B?ZjZmbjVQcDdiTU5SUWZhUmZiMXR2Z1Rxa0VETC8vWlV6eWswbnRlcmhsNEdi?=
 =?utf-8?B?cktLeDFyUTkxbTkvWFZYTGZZUm1pNVNJMHRBc0pNK2xqVzhsdHZZSjM3Syti?=
 =?utf-8?B?aHFUdy9NV2RPbHRVcjFLR2x2RWZwVTEzMTB3eWlFOTBmZnEzeHVvbHNWR1V3?=
 =?utf-8?B?L0trUUVMNzhuaGFRTXl0MitHSXYwc2lyRVQ5V3cyT3A2NC80Tk9FQWt6NHdq?=
 =?utf-8?B?SlJYY1QxeEN0Y3FOWUdvREdra2hSaVBlbjFib1E2UlJGVHFmUUYwTHBiZXRH?=
 =?utf-8?B?TFRRVndQVnBOeThHbVhjZTd2TEZGSldMbnBRbE9vWDlXcWVZemJ4ek1xV2dC?=
 =?utf-8?B?T25oenllRUpySmYrZmQ2R3hFaVZkN2ovSjZXM2diYm0vTURZajhmT0RwMlVJ?=
 =?utf-8?B?aTZMVWRnR2hXQzJncXRYNGU2RUtsNXczcTFzUUFhRjBPUW5UMWtFcGdoaWc1?=
 =?utf-8?B?QXU0Rkl4RWNMYmtFRmR2MmdOb3Q4NmJDZmVhd1VKa2hFdWQ0S3E4Ykt3eFZi?=
 =?utf-8?B?a21adE9tcWJvZTlrWWtRUVlZaDRxVCs0YWNyZ2h0V2xlOEtWQ1dQU0pxdmlq?=
 =?utf-8?B?Ym1vQjhUNzdwbzR0d09RTW5hWW13T3ZLMjdrZkw1SUc3UUhZMlpjRnkvVXpr?=
 =?utf-8?B?d3NNMVRIenpuQVhQQkJBNEw0MUNXZGZyU3NtUkxwWUxSZU5vRFlXOEVDQkky?=
 =?utf-8?B?VnBCMjZ2clh1NFVnam1ERzMrd0NsYmVkTkF3QWxaeG1SQThwY2tKWGRycDJ4?=
 =?utf-8?B?QUV4WjFZUGE1azVDeEh6azVNZzVPQmpHRHNqVjZhaDNUN05rQXVIc1FjbDNz?=
 =?utf-8?B?eUJxeVBNaU9Sc3hkKytSdHpqdjZDbmdiam5ZT0plQzlsV2dZS1dvVXhWSndl?=
 =?utf-8?B?ZEJneTBsaWxYcjB6SlF2dnFka21Ga0ExUU80MDJ5VmdqcTNtVFEzcW5zSWl6?=
 =?utf-8?B?aXlkdnZVK3RTa3M3bU5sbllsdFB2UXZZVFFyUkdwWXVkRDdGTy9aNldiMUM3?=
 =?utf-8?B?NFFZSWRQdVdQUGZGbFNQSGt1QStyZXdUNEpmTXhPR3FSWmRkV25EckhLTVA2?=
 =?utf-8?B?ZG9QRk9taGh1dlJrS1VSSWF3bjhGMDNTNnJra2UvRmFEK1RNTmJjcVM0eWNU?=
 =?utf-8?B?eU5mQndjSk40ZHAzc1VNMlRUUVhyK2Urd3o2N3N2RllFSjZ0TVBWWFRheTJi?=
 =?utf-8?B?aDVEYmxNdExSYnpYS3VpVGhpdndLbmEwNWFDL1Q4L2hKc0VneGNBbWM4cVdS?=
 =?utf-8?Q?bCZBl4btp4JIas7flMN00xZO2Nq+IDh96JkBs?=
X-Exchange-RoutingPolicyChecked: TOPHquUYL3AzL2QOkLCgzAhRlg3+BP8hfuiEyrMIL+v5vvXsTjWBwLYKg+/YLBi1B6+enljOUsYRm/AEGeXILPE/fJzXK2ev0lyEeaYTVkBKLbUM29AWZvc+RSWO2ZgAj62dm78MRkmRXRSHGs7hJl6LwU27kQ3IgFkp6I1SdKOXG81HVhgRq3jtMKQPaeYzv4ovx61LD2GtJ4yFGT1cN+jkEcTdlumUfXdL6OVuZ26pdwob5yO0IQcya5crCi7lQs6mmA0fHVhNx3d57xrdrdSfG9Oq9HgKab759Tu3VhojT5Im0zXLg6xAtwR3Tfq9QGHC6Zt6vBUj5fMY686lVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c1d591-c1c7-4afc-cb4b-08deee16dea5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 08:45:12.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuye2tfeQUxrV74Ox0pgWO0OPW2BMiszqcMaRNv6UVuBbYsAwqG+krULE7xbvn/vibxwcoajRBCkd2e22QUZCr8bf4fChzFtGLvWqOtYnK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5968
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



On 7/28/2026 8:29 PM, Mitul Golani wrote:
> Rework the fractional CMRR computation into a generic,
> transcoder-agnostic helper driven by an explicit per-CRTC debugfs
> target, replacing the previous disabled, eDP-only code path. Compute
> CMRR_M and CMRR_N timings based on the video mode requirements. Note
> that the CMRR enable path is wired up separately; this patch only lays
> down the generic computation. Remove computation of mode_flags,
> I915_MODE_FLAG_VRR, as CMRR is being moved to the fixed refresh rate
> path. Also return early from the CMRR computation if the existing
> computation is already sufficient.
> 
> --v2:
> - Derive video_mode locally instead of caching it in the persistent
>    struct intel_crtc state (Jani, Chaitanya)
> - Fix numerator unit in comment: milli-Hz, not kHz (Chaitanya)
> - Fix "requirement" typo and clarify that CMRR is not yet enabled in
>    the commit message (Chaitanya)
> - Fix precision issue while computing the M/N ratio (Chaitanya)
> - Rename multiplier_m and multiplier_n to improve readability
>    (Chaitanya)
> - Compute vtotal as it is required for dithering as per the algorithm
>    implementation (Chaitanya)
> - Replace the misleading adjusted_pixel_rate with dividend, which is
>    more descriptive
> 
> --v3:
> - Mention the rationale for not computing I915_MODE_FLAG_VRR
>    (Chaitanya)
> - Remove the redundant return statement at the end of the CMRR
>    computation (Chaitanya)
> - Correct cmrr_n calculation (Chaitanya)
> - Add an early return if the current computation is already sufficient
>    to drive the mode without CMRR (Chaitanya)
> - Round up requested_refresh_rate (Validation)
> - Fix integer overflow
> 
> --v4:
> - Update cmrr_n calculation to avoid aggressive dithering
> - Use div64_u64 to truncate to the floor value instead of
>    DIV_ROUND_UP_ULL, which rounds up to the ceiling value
> - Add a TODO comment to the cmrr_n calculation
> - Add a condition for custom refresh rate requests
> - Update the CMRR computation comment block in compute_config
> 
> --v5:
> - Simplify computation
> - Correct typo in commit message (Chaitanya)
> - Compute early return condition (Chaitanya)
> 
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 143 ++++++++++++-----------
>   1 file changed, 78 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 6d3333fd5281..7746b2ead7d1 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -27,9 +27,6 @@
>   #include "skl_prefill.h"
>   #include "skl_watermark.h"
>   
> -#define FIXED_POINT_PRECISION		100
> -#define CMRR_PRECISION_TOLERANCE	10
> -
>   /*
>    * Tunable parameters for DC Balance correction.
>    * These are captured based on experimentations.
> @@ -198,68 +195,86 @@ static bool intel_vrr_cmrr_possible(const struct intel_crtc_state *crtc_state)
>   	return HAS_CMRR(display) && intel_vrr_always_use_vrr_tg(display);
>   }
>   
> -static bool
> -is_cmrr_frac_required(struct intel_crtc_state *crtc_state)
> +static void
> +intel_vrr_cmrr_compute_config(struct intel_crtc_state *crtc_state)
>   {
> -	int calculated_refresh_k, actual_refresh_k, pixel_clock_per_line;
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	u64 dividend;
> +	u32 mode_rate_mhz;
> +	u32 requested_rate_mhz = crtc->force_cmrr.numerator;
> +	int rr_multiplier = 1, rr_divider = 1;
>   
> -	/* Avoid CMRR for now till we have VRR with fixed timings working */
> -	if (!intel_vrr_cmrr_possible(crtc_state) || true)
> -		return false;
> -
> -	actual_refresh_k =
> -		drm_mode_vrefresh(adjusted_mode) * FIXED_POINT_PRECISION;
> -	pixel_clock_per_line =
> -		adjusted_mode->crtc_clock * 1000 / adjusted_mode->crtc_htotal;
> -	calculated_refresh_k =
> -		pixel_clock_per_line * FIXED_POINT_PRECISION / adjusted_mode->crtc_vtotal;
> -
> -	if ((actual_refresh_k - calculated_refresh_k) < CMRR_PRECISION_TOLERANCE)
> -		return false;
> -
> -	return true;
> -}
> -
> -static unsigned int
> -cmrr_get_vtotal(struct intel_crtc_state *crtc_state, bool video_mode_required)
> -{
> -	int multiplier_m = 1, multiplier_n = 1, vtotal, desired_refresh_rate;
> -	u64 adjusted_pixel_rate;
> -	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
> +	if (!intel_vrr_cmrr_possible(crtc_state))
> +		return;
>   
> -	desired_refresh_rate = drm_mode_vrefresh(adjusted_mode);
> +	/* No CMRR ratio configured through debugfs */
> +	if (!requested_rate_mhz)
> +		return;
>   
> -	if (video_mode_required) {
> -		multiplier_m = 1001;
> -		multiplier_n = 1000;
> +	/* Requested rate must match the mode's nominal (integer) refresh rate */
> +	if (DIV_ROUND_CLOSEST(requested_rate_mhz, 1000) !=
> +			drm_mode_vrefresh(adjusted_mode)) {
> +		drm_dbg_kms(display->drm,
> +			    "[CRTC:%d:%s] CMRR requested %u.%03u Hz doesn't match mode %d Hz\n",
> +			    crtc->base.base.id, crtc->base.name,
> +			    requested_rate_mhz / 1000, requested_rate_mhz % 1000,
> +			    drm_mode_vrefresh(adjusted_mode));
> +		return;
>   	}
>   
> -	crtc_state->vrr.cmrr.cmrr_n = mul_u32_u32(desired_refresh_rate * adjusted_mode->crtc_htotal,
> -						  multiplier_n);
> -	vtotal = DIV_ROUND_UP_ULL(mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_n),
> -				  crtc_state->vrr.cmrr.cmrr_n);
> -	adjusted_pixel_rate = mul_u32_u32(adjusted_mode->crtc_clock * 1000, multiplier_m);
> -	crtc_state->vrr.cmrr.cmrr_m = do_div(adjusted_pixel_rate, crtc_state->vrr.cmrr.cmrr_n);
> -
> -	return vtotal;
> -}
> +	/* Actual rate produced by the current timings, in milli-Hz */
> +	mode_rate_mhz =
> +		DIV_ROUND_CLOSEST_ULL((u64)adjusted_mode->crtc_clock * 1000 * 1000,
> +				      adjusted_mode->crtc_vtotal *
> +				      adjusted_mode->crtc_htotal);
>   
> -static
> -void intel_vrr_compute_cmrr_timings(struct intel_crtc_state *crtc_state)
> -{
>   	/*
> -	 * TODO: Compute precise target refresh rate to determine
> -	 * if video_mode_required should be true. Currently set to
> -	 * false due to uncertainty about the precise target
> -	 * refresh Rate.
> +	 * A 1:1 ratio (denominator == 1000) means no video timing is required
> +	 * Any other ratio (e.g. 1000/1001) requires the video timing.
>   	 */
> -	crtc_state->vrr.vmax = cmrr_get_vtotal(crtc_state, false);
> -	crtc_state->vrr.vmin = crtc_state->vrr.vmax;
> -	crtc_state->vrr.flipline = crtc_state->vrr.vmin;
> +	if (crtc->force_cmrr.denominator == 1000) {
> +		rr_multiplier = 1;
> +		rr_divider = 1;
> +

This assigment is redundant. We could perhaps do something on the lines of

bool video_mode = crtc->force_cmrr.denominator != 1000;
int rr_multiplier = video_mode ? 1000 : 1;
int rr_divider    = video_mode ? 1001 : 1;
...
/* 1:1 request already satisfied by the mode -> CMRR not needed */
if (!video_mode &&
     DIV_ROUND_CLOSEST(mode_rate_mhz, 10) == 
DIV_ROUND_CLOSEST(requested_rate_mhz, 10)) {
     drm_dbg_kms(...);
     return;
}


Eventually, we need to make the interface more generic instead of relyng 
explicitly on fixed denominator values but that is for another day.

So for now,

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +		/* Mode already hits the exact rate -> CMRR not needed */
> +		if (DIV_ROUND_CLOSEST(mode_rate_mhz, 10) ==
> +		    DIV_ROUND_CLOSEST(requested_rate_mhz, 10)) {
> +			drm_dbg_kms(display->drm,
> +				    "[CRTC:%d:%s] %u.%03u Hz can be driven without CMRR\n",
> +				    crtc->base.base.id, crtc->base.name,
> +				    requested_rate_mhz / 1000, requested_rate_mhz % 1000);
> +			return;
> +		}
> +	} else {
> +		rr_multiplier = 1000;
> +		rr_divider = 1001;
> +	}
>   
> -	crtc_state->vrr.cmrr.enable = true;
> -	crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
> +	/*
> +	 * Let pixel_clock_hz = adjusted_mode->crtc_clock * 1000.
> +	 *
> +	 * cmrr_n = (requested_rate_mhz x htotal x rr_multiplier) / 1000
> +	 * cmrr_m = (pixel_clock_hz x rr_divider) % cmrr_n
> +	 *
> +	 * where requested_rate_mhz is the requested refresh rate in milli-Hz
> +	 * and rr_multiplier/rr_divider = 1000/1001 when the video timing
> +	 * is required, else 1/1. The integer vtotal term is tracked in SW
> +	 * (it is the programmed mode vtotal) while the fractional part
> +	 * represented by cmrr_m/cmrr_n is tracked in HW.
> +	 *
> +	 * TODO: Using the actual desired rate for cmrr_n in video
> +	 * mode produces more aggressive vtotal dithering than
> +	 * expected; revisit once the Bspec algorithm is clarified.
> +	 */
> +	crtc_state->vrr.cmrr.cmrr_n =
> +		div64_u64((u64)requested_rate_mhz *
> +			  adjusted_mode->crtc_htotal * rr_multiplier, 1000);
> +	dividend = (u64)adjusted_mode->crtc_clock * rr_divider * 1000;
> +	adjusted_mode->crtc_vtotal = div64_u64_rem(dividend,
> +						   crtc_state->vrr.cmrr.cmrr_n,
> +						   &crtc_state->vrr.cmrr.cmrr_m);
>   }
>   
>   static
> @@ -435,8 +450,6 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   	struct intel_display *display = to_intel_display(crtc_state);
>   	struct intel_connector *connector =
>   		to_intel_connector(conn_state->connector);
> -	struct intel_dp *intel_dp = intel_attached_dp(connector);
> -	bool is_edp = intel_dp_is_edp(intel_dp);
>   	struct drm_display_mode *adjusted_mode = &crtc_state->hw.adjusted_mode;
>   	int vmin, vmax;
>   
> @@ -470,12 +483,17 @@ intel_vrr_compute_config(struct intel_crtc_state *crtc_state,
>   		vmax = vmin;
>   	}
>   
> -	if (crtc_state->uapi.vrr_enabled && vmin < vmax)
> +	if (crtc_state->uapi.vrr_enabled && vmin < vmax) {
>   		intel_vrr_compute_vrr_timings(crtc_state, vmin, vmax);
> -	else if (is_cmrr_frac_required(crtc_state) && is_edp)
> -		intel_vrr_compute_cmrr_timings(crtc_state);
> -	else
> +	} else {
> +		/*
> +		 * CMRR is a fixed average Vtotal mode and is only computed on
> +		 * the fixed refresh rate path. It is generic across transcoders
> +		 * and gated on platform support and a valid debugfs ratio.
> +		 */
> +		intel_vrr_cmrr_compute_config(crtc_state);
>   		intel_vrr_compute_fixed_rr_timings(crtc_state);
> +	}
>   
>   	if (HAS_AS_SDP(display)) {
>   		crtc_state->vrr.vsync_start =
> @@ -1142,11 +1160,6 @@ void intel_vrr_get_config(struct intel_crtc_state *crtc_state)
>   
>   	intel_vrr_get_dc_balance_config(crtc_state);
>   
> -	/*
> -	 * #TODO: For Both VRR and CMRR the flag I915_MODE_FLAG_VRR is set for mode_flags.
> -	 * Since CMRR is currently disabled, set this flag for VRR for now.
> -	 * Need to keep this in mind while re-enabling CMRR.
> -	 */
>   	if (crtc_state->vrr.enable)
>   		crtc_state->mode_flags |= I915_MODE_FLAG_VRR;
>   

