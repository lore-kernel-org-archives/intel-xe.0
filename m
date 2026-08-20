Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74285C5DF82
	for <intel-xe@archiver.kernel.org>; Thu, 20 Aug 2026 18:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B0E10E22A;
	Thu, 20 Aug 2026 18:51:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gc1v/DBF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F1810E22A
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 18:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787251869; x=1818787869;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qzSqRZxiYFifjpmeUXDo6LczW8/gc6UGi8BWyve60Rc=;
 b=Gc1v/DBFMBLOkrQKPTdG95VOqzB9rcczn7zD/gAWQp6AKXWjlzpMgBud
 97FFIzj0z+7HHJ46ZUxyzSMNo/g3he9YW4/MdL8KiLwaCrGB7MjY5myBZ
 SBaTHq6F+J9kmKamzwgqm0OcmYee4hocqvf0V2zmSDp31OaeelY08whxs
 GS0OmsUnGIXytSYNjOHzCT3QsV95qakIptK8sOWkwFE4AkKHTW29MV8os
 1RjLHjH9Ynl0LYDyRXHsnlCd+BYGqxmB9BnY08Lhmi6qbiKAI5P5LceoP
 Pyh4lAc6oQ/4qaNyAlp0wtICf/qEY2VEVZRE21CJ8o2h3/BECS1Xw1TZ8 Q==;
X-CSE-ConnectionGUID: pDwGXl7/QtqwxuNFFreNzg==
X-CSE-MsgGUID: KoQ4GWfPS16CM73dp0+L4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98133942"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="98133942"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 11:51:08 -0700
X-CSE-ConnectionGUID: nIFEwco1ScCBYcw3bfQtyA==
X-CSE-MsgGUID: s0VmMEjpRXqGideqOgr35g==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 11:51:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 11:51:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 11:51:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 11:51:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slFMOD7OvJj8HjCA2d3Jh7g2Jx4unRSL0KUcKkPGWs9czthSxlFfm2U/XNwZjBMVS4z74X7S/iIpuNFTTVUelUZeZKqP1dE/GAJ1NHkyyudLolrHXp9HJ8IuvDJBRinksrxUP5yqzB0yM4G0a6Hh1PMJQ/ABMqSVKMWmT31vDChNycfa8alrHtyibY5i7LNST8diETvUIQMampk5zaFXhewacshE7XaWYchftAGctpWYoPDWcy1XpscZrzjGulA9C9YAZQmGYtizrfowAtSpFZjDvOlpbkYU65TtQtJIWuHllaBG9QLTFZJJreB6jRGvMcIs908Yx8zmSFa55kQsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVosGKyErsLOczs65tpxEaaAWiZ92k9+Q4ABENhZ5NQ=;
 b=y7NvoLqweLVTSkUVZeHc9UUUdWxAS+8yk67pYOu9m3VmkF759eROachdRSUDKjFpICN2si4a3DBkpHPMmjAgrU18bTKcEE8nkocFMwbfhy22pFA0xErwhSMWfF2CjSIIfBUNHNE9BvjcQu+3ae5ceePluI/+IblP6sXTOFo1U0lTThO0iPv5oPthtKjNlxmUnt/N+Hgye4IcYvfoiApm59R0hL+W+hZ71IHdLbeYgipifZLvoQjzJPiakLmeFv1YBW/fzzmkxdyc8S5wdMRRMjhMspPQNnb5Jbfz4fDSK7f9cNIL70+D1vO9ZXKjqP+Y5nP9WIz1MIpm1wEgAdW7+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DM4PR11MB8092.namprd11.prod.outlook.com (2603:10b6:8:184::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 18:51:01 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 18:51:01 +0000
Message-ID: <43ca4e82-8439-4a85-bd3e-a4cfc529df40@intel.com>
Date: Thu, 20 Aug 2026 11:50:59 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_start?=
 =?UTF-8?Q?ing_with_=5B1/2=5D_drm/xe/guc=3A_Test_GuC_v70=2E74=2E0_for_BMG=2C?=
 =?UTF-8?Q?_LNL=2C_PTL=2C_NVL-S/U/H_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260814210758.2779837-3-julia.filipchuk@intel.com>
 <178700286166.60193.12856761750857981244@61270ab9df2a>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <178700286166.60193.12856761750857981244@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acd5dfd-a192-4631-d409-08defeebfaee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|10067099003|11063799006|4143699003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: toeBd6O3lafxwgdzLWvqbcLd8/rPQC5CCwj5xvJOUW6/EKfUQ+WDXRnUBM7/YijKFsbTcWIXih6ibrbX6QqXJkuoJTP6w7v+z9NukhFDDhAcWSwxbchA6qAGq0hqwEBDaf48GOdN2GNvf/vq6jsx62ZEYW8DZGBAZAVtFO8ZMOfi0CXVplKtjtVrI+Q/xKRBvxD9GChrgsrxSWHp16RLeNKj9hwcO0PqeF1MFPDOkTEhqzX4+sEBEucEKLqCs81AN+8wCgSBYOgcEmXDaiMx4zyxOhaauRkU8fdrSyk43VYClmfvOSYc7QTBXPAUA7VYWw0aPiXKnqOQ1Wx0vLGrucThG5j+D4gH+YXD4JEaUB+45eMz4WGVP49o9PcuYCRPJd2GLxz0Sk44DozaHROHJ0o1Iu6oH4b82N1uXNhXIL9MFqQxodqmHaIoH4++h1VB/sPmjU8ed7Z1C5VrZaIR4+VLhFPHtq2XON6Ojg4WUDZbfh0e17I2TcGuQXTK/Z15ojvrpHuZfkSb4cRXn09tQSfSaedxbMgHQOWMypxuYHPEgHHQhXergrbdCV6HvmOM+VPmRvyUZWtWLEJlk5df3YszVmESMBvS7WcN/JBYsKCiyDUp2p6kzto9IRqrt2Oh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDV0VWhKWGpZTTh6T3A3aDB4cmlDVmVLZG1ZT0JFaVl6V2tsS0gyQ3cwSEdW?=
 =?utf-8?B?a3pCUFlPSFlQdkQvWWtNaFJ4L25ZVWg4M2NYcHpOMFBmdUN0MFcyWjFPdjVu?=
 =?utf-8?B?VFh5dkdTSERMWXdNU01BV1FhVUtqY1h2UHpaOEYvOTZzdHFYMUtPVEpCYjcr?=
 =?utf-8?B?aml1ODBycGgxcWRPcmhYMkNWSkF1OHdrQU96VmRqTnp0K3RPV1JsSGtkVTNk?=
 =?utf-8?B?ZDREWVJkMU5RMGRDeFN6TUFSUjhqQzNxcHlmeTI3VVRsRVB4SUhnQVBtUUhC?=
 =?utf-8?B?TkoyUFRjRHFJSnRsKzZ0cGZCMkt3Q2xrdGVOSFZ5WXVncWQycGNBaVJHazF4?=
 =?utf-8?B?WHdldDRzVFdoY3NmMVI2L05RaDQyeHNOL2N5LzkycG1BVmNxWXJ5ZHlJYjNz?=
 =?utf-8?B?N1BjSXljbmZEWTJ0ejZHYTdoUXk4RW1JSTZXcEpXdVJrVWV2Y3NjTnhPZ0FE?=
 =?utf-8?B?bEFuYm5qV25jb3hMT216WXNLU0J4NlQ4ZGhaSUVCdklGZytqSjhqRTl3czJC?=
 =?utf-8?B?OFhwY3lDTjk3bXdlcnRQUXFVZ0NuMG83WmRoU0xXRmpqbG11WTZnZjRMdTQ0?=
 =?utf-8?B?WHVFRW9oUVppcEZJVVJwcDZ6bURPVU9mRjQwY2ZFbnZzVVI5ZFNsQzc1Z1oz?=
 =?utf-8?B?MWhtVUxwWEd5eTN2dk5JMVY0aHQ1bzVPMjBOQkVQeTh0eVlwNHVJaWNLZjVo?=
 =?utf-8?B?OG52ckcvTWdDUmIyZHk1R1FLeXpUeWNHc2FLT25lSkpJbDZzaTdheDJFUXh6?=
 =?utf-8?B?ODU5V3dJaWIvVTZHV2JlS2J3em9OOGNwY3dnVFoyK3JhNlhlSDhHRVJuajZw?=
 =?utf-8?B?V3gwTUdVUm43QnVwdWs1ZmlpcmVyZDBiMy9LRkp5Wi9hcTYyZTlHRENOQ1dF?=
 =?utf-8?B?Z3kxRzJhZ1krNzhENnlVNXZsY2oyZXNzTWpjNEFUc1o1MzRBL0d4enY2YjlV?=
 =?utf-8?B?c2RteC9rcFJWdERtclhWT3BnOGR1bm1uL1ROVjZkY3V4Zms1Mm5VUzM4RG1v?=
 =?utf-8?B?b0p4SnYrUnZpRHlUNVBMaUQ5MDVxOGVlTmFZdmtPLzJLMUowK1FOODFiSnpH?=
 =?utf-8?B?RjlONmhEL0x3N3R2a0xWTjV0bkQyRGFQTXI0NXA2OHFNU3dRNVFTWDNaMEZk?=
 =?utf-8?B?Sk16UEJBbmpydGVvWWdsVWVWQ0J2aytaZXFnQ1Ntb0lnTjBYNWozcUJPdUVx?=
 =?utf-8?B?clJkZHRmQU5DbUhLVFpUMnZmcDhRVWc3QWV1SkdZYU1kQmU5SXcrNnp6WVFP?=
 =?utf-8?B?TjdFWjN5d0VWNUZOTVhWV0RPZzk1TWhqbG1DbEZMQXh1QjExZ2QyZmFSME1P?=
 =?utf-8?B?aWNCbDNaZTJnaW5jTmJmc2ZVaHY1aHdLcVFBOEowWnR3N1ExOE9jdkd6Yzl4?=
 =?utf-8?B?RHZCa0RRQkpLZ1puaStsLzZJVWNkY1JrSU9GSEZxV3MzNlQ0dVZZWlNiT1M0?=
 =?utf-8?B?SEdhaDl6aEtBaXRwNk1qTy9ySU5pYTNaWGZucE1YMkJjanNRUG8xSTR1MGRN?=
 =?utf-8?B?dlZKNU04MEdBNXBIZ0Q5clJUZ0dtUWZEaTBpajlDMEkyRnI1cFBGRDZLb3Rl?=
 =?utf-8?B?RUV3dFZOMDk5Yk1qTDljUzc4MHZFZURuV3plZmVNMXhobEhmRWNTQXdwVmVV?=
 =?utf-8?B?OEtZRlVGTWU5Wno2NmhxK3NiNFRGbTFRQzVXVCthckpCelJTOUlLSFVJQzNR?=
 =?utf-8?B?SFI2M29RYWZzMTFLNXB0S0dld08xaU5xalBrK2FNdm1Qb3gzZ0ZKTkllM29j?=
 =?utf-8?B?TFJNY2RoZGtnTW9WUHE2YWQ2VlRVREdYWnkwT05LdnJ5eTRtZmxkZk0xZElS?=
 =?utf-8?B?cEFQTXBTQ3pvS3MrSzQvS0dQemg0SWlua0hoN3pCUWRQdzVWVmJxQnVhRzFn?=
 =?utf-8?B?dEZCblFaZHJKdDVKYUdrTFY5WE14SmJPS1ZxSnkrNExZcUZIMEkxaW1Pc3BY?=
 =?utf-8?B?dTdEOFBmVjA0R0p3aXRaK2xHTy93dmVMZithS09neldaMkltUDNic2RUVTY0?=
 =?utf-8?B?WEdDUGd2dmRYTjZDS0o3a3k1TnVreFZzRUYxbVlkT1JUQ3VPS1hFVnpBSUlo?=
 =?utf-8?B?eEdMaHdnMHpLNFVseGd1aW80UUFDYU5lV0lSTzZhdk0zbVlSbjVHTytjUEZu?=
 =?utf-8?B?cTgxditmWEFDVGloN250MVBWNlFmY1d3NjlyeG1wTU5yM0MvWUZGR0RTRENO?=
 =?utf-8?B?QW5HcHNiUm1vaFluOHhZeTVOT3dydFZLZWJFd05xVzI3VXkzWlhENWFBN3hu?=
 =?utf-8?B?Y3JPd2l3ampaYWkxTzkwa09zV3d1THhnU01GbmVUWXJ0TVRKSldsZEZCcThV?=
 =?utf-8?B?VWxNNHRkcktpNW54enhVWFhwcENaMTVmRWQ4dUhuNGNQWi9VeHJGdjlsL05S?=
 =?utf-8?Q?zfD2KU2azbh2mpt4=3D?=
X-Exchange-RoutingPolicyChecked: HDpdOYFV+E+cQc0o5/hTd2s0LQb8t61Q32Aje/vHpTNc6n2utYsaovDrKXe2vsB35qbrcsrZ/egRrChspnCiQPUK4Ujp8gtNNf5M3a2sFrZL40t57KSTNC50U7D5wDA7oZgR2QKzUP2ODyrZqrVg+vBYf30iX/K6uazxQEgRFAO8IoLQgrO3BjvpFU/1jnMcdH81/L7vjID4GKoJoZ1RddnEpdD/UqEmaJZjXYbsplXMjVv6HdCRTEoxXZ2VOSCtFNcjeThxITEnklj1oFopQzJn+xduAWMMn5XSzT2cwktWudK8z9s+JsNymb1p/u2eOgzU64W5DCnHzYb4ylwamg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acd5dfd-a192-4631-d409-08defeebfaee
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 18:51:01.5976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hg5j99L6bFhhzEtGdWmahFFxvA0O92hIKGOcoHj7phB26gK+lNmnvw3wdvel58y4pcY5zsoZI1uhwTXru1Z/t82uhoERM9q6wehPqii5PAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
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


This failure is unrelated to this patch set or new firmware.

On 8/17/2026 2:41 PM, Patchwork wrote:
> #### Possible regressions ####
> 
>   * igt@xe_waitfence@engine:
>     - bat-wcl-2:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5607-24a2127c5f2bce93dbb33cbbee84666272a5e716/bat-wcl-2/igt@xe_waitfence@engine.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172255v2/bat-wcl-2/igt@xe_waitfence@engine.html
Relates to exiting issue.
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8820
