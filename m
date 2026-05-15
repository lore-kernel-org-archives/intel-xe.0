Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307D6CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 08:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E677010F48A;
	Fri, 15 May 2026 08:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/tRf3X7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C213710F48A
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 08:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778833843; x=1810369843;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jcMTdUCpUFEYPx+Neq/83hieCKEUn/k6M5zSM7RE5/U=;
 b=P/tRf3X7moI1RG/wt2I/J3MOSR+1UH0uW7q9TkRhkpTB/oDR8ryX3trx
 evOiesT1f7b4+79SjA/RDwqG76iAkhHHft0bMXfalel2tPL5ZKY2JPw0G
 BgrYwvCJpsV000aNCUIN6eK2YorP6c0uqJDYrrZAsh4eXgzIhKB8f40S8
 26LjAZEq/EqoS5p22OR+FVMpPN19FpIrP8f6i7bizrQlYDBhxRvENgcOX
 pptu+E2M9DndLquKTsNVZVQ3m0w4JAhOOnCGNmAVkP5AZWPgcgnx+uhzF
 FE143mS8xNP5yQidV4MAHA3JQb+DEXYc0XnVF5BMH0E+sxjBlEce3fmxf w==;
X-CSE-ConnectionGUID: 5eAxe3n2R2qQCSrPI0/olg==
X-CSE-MsgGUID: NWDp3IxMT/GwnecW54O8pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90097368"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="90097368"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:30:42 -0700
X-CSE-ConnectionGUID: C9dKmTc5QuaYylc+k/Kaww==
X-CSE-MsgGUID: orZWOuvfRDeXIXicXJz5WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; d="scan'208";a="238741011"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2026 01:30:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:30:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 15 May 2026 01:30:41 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 15 May 2026 01:30:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgn6/5FfQCippTbnDrsUzqjEUNZQ+4M7RKFao9euPVljiV8Svvvvp/8exSLkrri53D05QjWtF8teiRM92rUG4nHNZ5w95hfnJ6vq5aft5U1X+64IO8w9d9la/g5kegHdkmherkd2HvjmdB7Ku6khPut04Ec5jFc37UYgvN0Pq/9FrZV7u/nI7SAy7AcR8UjDFkxFcEaf7r9gQFI/KyB6nHXgAixuHA+G8b/xM8EEEKz5bsfxN+oRhQVwg2A0j5QsEl/6bSS02rc7StIkRy6B2y9JLUn0/DAQ8jmre/qx/cqZRRQLWHBMYUlWjNPl7QfU7KsgdEyLZobQZEaiQbnu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zcDsnP53jWqTdaYT2doWi5hqMCwQrkw5IldiLPBl6g=;
 b=e/Yx4wob9B86G/j+HLhKr+QlACnmGa5ew8E4hXi0XNBd2C6jA6WHKdVY/uf3t5WzKESPyg8Pmzjv3VI37YcifN1wfA1LtAcAxd21O6gE7/xBBcPnUxDr5sA/T1HTDWELxY3WtqohjY76U8lxgQrUF+LPy6hkl7+1IqEQEL6G0pcTVgxGanid5CXAUCUMfw2LrHbOV8tCmHB2/6/W+MP9ML+vF8Tk93B5ra5kmbBZGakMaZQGauxCf+FFuqy0BMiqsB9IzRT+CHHp//KPXk8hZOhFKzbq6jflLUcENyP4S/kW3EMPQEJAF1/gFJF5afD2ybNjaH6oHIWD+IwmPVPWzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 08:30:39 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 08:30:39 +0000
Message-ID: <cdd03db1-3841-4e6f-a988-71a482f2c9a0@intel.com>
Date: Fri, 15 May 2026 14:00:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/14] drm/xe/xe_ras: Initialize Uncorrectable AER
 Registers
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-22-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-22-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::34) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f19fd8-5eaa-434a-4874-08deb25c3e58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|18002099003|22082099003|56012099003|4143699003;
X-Microsoft-Antispam-Message-Info: LuOAzMm55CMItvYyZ8+QpCvBxgKmTgIIyCYlwFzc7dvS8FTIIrw7CkmmvGPjOBfi+4BwP9jCjnfUIEy9qZ32zWBXyqk0bd9qZfrFbcqu9bN9OrXH15Cn2NIVmaGy70av8N00ZI1g3am/2vK+dOJ50pxeH5OMruNguliAyafy+XJRy1O5djD3Jfmf/1BAqmw74W5C7JFUZOPGCXoRSNYOAy5t1BIl/QHY8EveAdfatlDEY5DuRoh+6iOvumN3x2bkw8h6EZw7WgyLthuSQDXCPfuaonF608h1v6u3o+cJqIwHBv8eGdHFJHqY6AHChA/KUete9VRYopWVmcCLXo88cWJAo/z1z50p32YGQqSUoHiWBJN3wUfGqV/xlPfKH68Ll0BlKcv0oL27KCiIMjzbpYV6mMHQa1RWZ9htcvlpScXZR4xYE/tjAJ8jyAPRJLdxxSe3cSOjjGyXhXGJ3Rcygr6jimkWdmOj3crfZ8M/L/PvlFms5chOsrx39M6FWB40934Ow0xWThSMYazYDSc8hPjva00cJkj6n77yvrxEpXgiG7+hKZQ9bRPXaGYvFdbE+4v0ZyxJYFGXaOCTWEirU+vi0T9hYZ/728UH1fsT6MZQqP1Zy53qVIOJ/3hdI5noOlqTjhpSWOIrm7p78eK6489XssvsD9MsoTsLTO3zoxKF1JqPAgkjNY+XS5t1yxfM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(18002099003)(22082099003)(56012099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OW5hdjhOcTVmUllwdVN4eWl5eFZsaUFTYVl4aUo3aXZBZTQ3SzFPQkpUNFVk?=
 =?utf-8?B?dmt0UVBCbnJaeWtPS1IyWEJKdmdFa2FZTGhPai9vWFNuU01pMVE5bnE4QWNS?=
 =?utf-8?B?aUQ2L0lFa3JWcDhqRlhQQ3UrcEpRcVFid25EejVWVy8zdUFxQXh4TkJNRXFE?=
 =?utf-8?B?VHBTd1B6ZVA5YnFDMzhSY2ZPK0E4TkZhWFZLL3NEb1Z2MG8rclRwSGQwM1VX?=
 =?utf-8?B?UFFzN0hjMXJqNEZWV0c1T0pybzZvay9lSXRLL0pwK2xweUtXajUrdmVNeUJa?=
 =?utf-8?B?MWRuSmQ5eWcyWGhoL0VRMjFKUE5PMVhIMGI0UU52K0xXMWdlNHJoMmtZd3VD?=
 =?utf-8?B?UXc4VDZBckNZUzdmTll3Vm1WZlhVUndqQUVvMFlmbzM1bk5pYnNNZmFPelZw?=
 =?utf-8?B?WTBnVWc1VFd4eU92QzhIR1k0OWJUcmZRSTlVNDEwRTRPaWxLTWdiYkZSa2kr?=
 =?utf-8?B?TXhSSEx6bmFINStxb09ZYXM5aGh2VER1LzIxNjhra3ZqL1JYTFFrdGtFVGpV?=
 =?utf-8?B?dDQ1eEZkUmtVTndUNnJIVUN3TG5mb2Y5NHc0MVkzNm1xcG05amp6QUxMTzVw?=
 =?utf-8?B?U3RGazFVY0o2SkNBV2YrdlIvcG10bnJGM0JnSjl2Z3c3ajNBNDZsQkc3UWdU?=
 =?utf-8?B?U0VDWFBsYnBSdFRBVmpOQldIOVpVbmhsek4zL1c2QmRsQ0UrNzMxM0tXVWM0?=
 =?utf-8?B?ZHZaTlVPM3dRR0FYVkhpYUVqaE5Jem42cFVNV1JEenhjZzVzVGdIWGZVNk84?=
 =?utf-8?B?d3JJYmt0U0tCOTYvNGtzZDN5TEgrK2pWSHhuUkRMVVZLR0pGYkJEeWt2ZEJ0?=
 =?utf-8?B?eGJ4MndTamNxMVk1cTQrM0ZSdjdlcytiSnFITklYamNEb2t2TUI2TTl2TVR1?=
 =?utf-8?B?SzZaWENyOTFqN2Fuakg4YnBKQTZsa0JDeW93ajM3a05RZ01nbnBsSjVVaml6?=
 =?utf-8?B?RlNnVmg5U3lFTGV5cGphVllUR0RSVG93cnIrbDZtVzBWR3graXFQcnJDTG9l?=
 =?utf-8?B?N3h6RmhtcWt4ZDdFekpYanlVb2ZqRVpRME1kUjY5bkZTOG5XMHlxZElNYzVJ?=
 =?utf-8?B?UWtJREZtbUZ6M2pERzU3MUI5bjU3UnlRVkM5dUlDbHVXRFNDWVVvQmY0Zm03?=
 =?utf-8?B?NEFaeTQvNXhDL0dBb0htUlFNODF5ejluV3VKdHRIdkNPL3RjQUVlUmJaTSsv?=
 =?utf-8?B?TXIrbFNsM1VUcDArNkZ6b0RDWHpBQ20wdkR6RHJXcWhPNWs3aGRmd0ZkdVNB?=
 =?utf-8?B?aEVmclpUOFJkdFcyeW4wNXdrQmlwR3FlcDJ6dU1kSnpqcDFoZjNjRHJNVUJW?=
 =?utf-8?B?TkVzeWtxTHVJbWNSYkZRek5vNHFXVnMxcE1CYy9hTWFvU0RsUGtqbGp6Y25n?=
 =?utf-8?B?TUxaWnR2Qkx3N2RuMTlDUGdjZCsxNkFYbkE0YTZmK0ZONXk4T2xaMFNyWmpq?=
 =?utf-8?B?T1dVejJNcjdIV2JDOW9nS1NjWW5zOFpPVnd3VXVtYTNSVmJLaTBWa2s2S0hL?=
 =?utf-8?B?ZXFCcU83U0pFMFFWS21tWFYxM1NvTUx6bjh1WmVGSGViZW9ONjF2ZGdMMWp5?=
 =?utf-8?B?YThEVG12NENmM1p0Skw5ZEV5MnBkTnBxR2M0UW4xaCsrK284ak1PSUt4M1Vu?=
 =?utf-8?B?c3BkRE5ES2ZDd2V6Q3FjTmhyM21aWGtGczcyQlZiZE9YeVVnNmtsT1pLbUNv?=
 =?utf-8?B?S2orVVhXVjViRzlwZlNwREZzMEg3VzVPQWUxQ1owRU5XM1FQV1B3QmFwd1hN?=
 =?utf-8?B?L2kwbm90NnN1TzFxWTNYSWUwMW0vWnQ3cWJrK3NSVlMzeWQxQ051TUNLeTVs?=
 =?utf-8?B?dTFKTXNEaDNmdjVYZGhQeVNsRXZrUVh2RE5XVVdDTjhWMUEwbzFFa3NxNFJG?=
 =?utf-8?B?V1BFRk5iY01ZUmZwQm4xdkRCTkVhTXIvbXpZZjVFK1ppWFBrRk04eVlrOFRy?=
 =?utf-8?B?RGNldTBRWEYvRXVBVElIUHJ0UStlRU14bTBFOWFxeHYvUGZjQ1I1TU4waHBF?=
 =?utf-8?B?OWVieTJ1Y0Yyb0J4YVMycUJycEpLSHZaby9pdW9VRkVudTFRQldxZHpkSXRj?=
 =?utf-8?B?YUk4MkVGUDdtWG52cHdYU0tIZzh2THUwSEI5RzdTTDdMcTVxM1k1ZWNjOFZH?=
 =?utf-8?B?R3FOeWVseUsxNlJHTkM5eXAyL0VLQkR6L0Q4TmFvVkluR1Q5QkZhc1ZxZkdI?=
 =?utf-8?B?RGgyQkRtYmYveFRma1BRMHV2aTRJVVpoL0thNWNjcTRxcE9SZTFNbXJUU2w4?=
 =?utf-8?B?WUFsUHlNdHBoNnBBd0lNZFMzM2xucGZ1NU5SM0JjUkpKSDhBU2w0TUdBdk9E?=
 =?utf-8?B?OC9WNkxCbk9MSlRvMXl0MlY3UnJXU0REbFNCL1A1R1U2K3kxNkc3UnBUeWNN?=
 =?utf-8?Q?RPaM8MenkKKuaNQE=3D?=
X-Exchange-RoutingPolicyChecked: CjjcrHOFvRXno6sux7sY4+uUplyQpt03c9q/0cHNPlM85e9vqdxgXxM2/+yut7tnTcJlnyk1SIHh+mvk55beTEixOBX0oNs5JO5BPaTuao/SAP8jrAsINUvufARldW9UnOWDZ4i7m6Z8UoGzj3y+Thb3g2cE0tYxRE3kCHTiD6Rk2If2CM+EA31b3BMu25Ie9k1ih3ZJBIbOGEjS7RGvdAcUUNytG1ifyh92cy+tkjAzHXgAomRjwIiXq44figfWL47iqQe0tACqm+MGN0RacL5YlLunwPRz0ZtlVdn8bP/tIQZSlj/panXutPhgfgNywxlKhUxImHdDAnO1a4zJ8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f19fd8-5eaa-434a-4874-08deb25c3e58
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 08:30:38.9707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pjaBXZmRxvl4S/BjRcrM8op/gD9w1MLJ8uXL/zpiyKWFQc9s5YKJwSxUiOeMyT4wsEBeNqwC3KVfHQSwt0sgl/5UYNVhV0t5ddGbLo2gH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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


On 11-05-2026 10:59 pm, Riana Tauro wrote:
> Uncorrectable errors from different endpoints in the device are steered to
> the USP(Upstream Switch Port) which is a PCI Advanced Error Reporting (AER)
> Compliant device. Downgrade all the errors to non-fatal to prevent PCIe
> bus driver from triggering a Secondary Bus Reset (SBR). This allows error
> detection, containment and recovery in the driver.
>
> The Uncorrectable Error Severity Register has the 'Uncorrectable
> Internal Error Severity' set to fatal by default. Set this to
> non-fatal and unmask the error.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: clear stale uncorrectable internal status in status register
> (Aravind)
>
> v3: abbrevate TLA's (Raag)
>      add a info message if USP does not support AER
>
> v4: add a success log (Raag)
> ---
>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>   drivers/gpu/drm/xe/xe_ras.c    | 78 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h    |  2 +-
>   3 files changed, 82 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4b45b617a039..200d6bbb1b70 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -62,6 +62,7 @@
>   #include "xe_psmi.h"
>   #include "xe_pxp.h"
>   #include "xe_query.h"
> +#include "xe_ras.h"
>   #include "xe_shrinker.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_survivability_mode.h"
> @@ -1048,6 +1049,8 @@ int xe_device_probe(struct xe_device *xe)
>   	if (err)
>   		goto err_unregister_display;
>   
> +	xe_ras_init(xe);
> +
>   	err = xe_device_sysfs_init(xe);
>   	if (err)
>   		goto err_unregister_display;
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 4cb16b419b0c..24642c309967 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -91,3 +91,81 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   			comp_to_str(component), sev_to_str(severity));
>   	}
>   }
> +
> +#ifdef CONFIG_PCIEAER
> +static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +	struct pci_dev *vsp, *usp;
> +	u32 aer_uncorr_mask, aer_uncorr_sev, aer_uncorr_status;
> +	u16 aer_cap;
> +
> +	/*
> +	 * Device Hierarchy:
> +	 *
> +	 * Upstream Switch Port (USP)--> Virtual Switch Port (VSP)--> SGunit (GPU endpoint)
> +	 */
> +	vsp = pci_upstream_bridge(pdev);
> +	if (!vsp)
> +		return;
> +
> +	usp = pci_upstream_bridge(vsp);
> +	if (!usp)
> +		return;
> +
> +	aer_cap = usp->aer_cap;
> +
> +	if (!aer_cap) {
> +		dev_info(&usp->dev, "USP doesn't support AER capability\n");
> +		return;
> +	}
> +
> +	/*
> +	 * Clear any stale Uncorrectable Internal Error Status event in Uncorrectable Error
> +	 * Status Register.
> +	 */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, &aer_uncorr_status);
> +	if (aer_uncorr_status & PCI_ERR_UNC_INTN)
> +		pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_STATUS, PCI_ERR_UNC_INTN);
> +
> +	/*
> +	 * All errors are steered to USP which is a PCIe AER Compliant device.
> +	 * Downgrade all the errors to non-fatal to prevent PCIe bus driver
> +	 * from triggering a Secondary Bus Reset (SBR). This allows error
> +	 * detection, containment and recovery in the driver.
> +	 *
> +	 * The Uncorrectable Error Severity Register has the 'Uncorrectable
> +	 * Internal Error Severity' set to fatal by default. Set this to
> +	 * non-fatal and unmask the error.
> +	 */
> +
> +	/* Initialize Uncorrectable Error Severity Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, &aer_uncorr_sev);
> +	aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, aer_uncorr_sev);
> +
> +	/* Initialize Uncorrectable Error Mask Register */
> +	pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, &aer_uncorr_mask);
> +	aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
> +	pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, aer_uncorr_mask);
> +
> +	pci_save_state(usp);
> +	dev_dbg(&usp->dev, "Uncorrectable Internal Errors downgraded and unmasked\n");
> +}
> +#endif
> +
> +/**
> + * xe_ras_init - Initialize Xe RAS
> + * @xe: xe device instance
> + *
> + * Initialize Xe RAS
> + */
> +void xe_ras_init(struct xe_device *xe)
> +{
> +	if (!xe->info.has_sysctrl || IS_SRIOV_VF(xe))
> +		return;
> +
> +#ifdef CONFIG_PCIEAER
> +	aer_unmask_and_downgrade_internal_error(xe);
> +#endif
> +}
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index ea90593b62dc..a88ea0a46766 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -11,5 +11,5 @@ struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
> -
> +void xe_ras_init(struct xe_device *xe);
>   #endif
