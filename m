Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CE4FF8875
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 20:41:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EB210E401;
	Wed, 29 Apr 2026 20:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eUGjOqW+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21C4610E401
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 20:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777495281; x=1809031281;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=697LAcFKYhx+r+g1+WW1JT3IpUxQfJ6yEd+9R7hgjao=;
 b=eUGjOqW+qlvI3ziHP6ELlPfGEkfGOhyYbSjE6bOgBP6ZNl79mEjE2UW6
 Prk4d4BQFlwz9FGmonxgTEJhTdMa8THrBhT6QW2b6TW1F4NaiI5Rub3zA
 /Klgkve5ig+QczdLsfwja/m6oH1GA9obB9UjJswHJH503fgRJaSvGkv27
 vOrvODnbE4lRfUUHkEi0jDN1FJa74knJr3j68TRLX7qL4dXzok8yY83ui
 KutSzP1+1kf8jFDHDQkjZjCPLVuB1zkWbhAI7j0oe+Vy0j7NU7Zw7Kdmd
 pQ+3ILJbeMzxLbdWRkTjmfDEYSXWsjx7iKLl3EIaryKWaSPPgcF9MCSBu A==;
X-CSE-ConnectionGUID: zFY3tb7bSDyIYNkgQfvjvg==
X-CSE-MsgGUID: HmvOroYBRDWbYB7x3oy5Xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89526349"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89526349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:41:21 -0700
X-CSE-ConnectionGUID: 52jLFoALQACdy9Iq7wJbaA==
X-CSE-MsgGUID: 1TflV4OyQ16BcPVUnfkZ/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233532179"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:41:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:41:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:41:20 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:41:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2+V0v8HZZ7/SqPbMQrXYGvhsEDnDADkAkIeAw0TnmSKkTzvrzDFPyGvdNUVzRXQVsHPXs30kK+Wu/UrNC/yDpwmBinYNNhgIzQ0xImntUSM8Vco/L7+T1AVFgNtl96EgVdOUd143D/JIQ7zVCK/qEBUY+5URRm/SMT45fowP/1djc5FAcpuKb4J7azgBfXJSPH9yWRrNlUsKuW2vRj21D7hPmauKE7Fud44JaV3xnCjxoqXpdR1u4aMC8Y0JD1ZcaCS6H5kw8QQWwH/dN/Zy28myz7XDq3HsFdrH3+g8rZXQXh+D9fJgbxRT/+uKf4v16ICeomDzWmu+SWMyiU9vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzxabwgD5t8TIA2ORFopIkKUUwbDK3aOLx4TrnwlJMA=;
 b=iB8i7Ybaq93H4Fnfu+nGXeM8XSSAM9ZD2JRuN4+1ZffdlQDHP1xBjTFzC8hNaVnVg8tDiirX1xlUejdaTA+MJgvlj9yv5eyDRXzEGV/4+WAyqGjxtC4cvxYZ74Nu9ThICiuJGGCnc1KBt0N2OUjJaS0m0PBtZPUJzLfqlyrvC/1/dBNmTm0vFcrG5e7LGPPzPBKRV2uLM5y0UHqF5sd7kQ1pPFEJPP3cDAgGujSgzH4AfAfciPVo8PapRGplpQj4HF8L0mDDISrvHgIV5VhbGlrF0ocXxou6VmG954kHApg5az3gkARVTtxXOe0FasZ80mU5oNNGojqd8xoFrhxnlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) by
 CY8PR11MB7396.namprd11.prod.outlook.com (2603:10b6:930:87::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.20; Wed, 29 Apr 2026 20:41:18 +0000
Received: from DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d]) by DS0PR11MB7831.namprd11.prod.outlook.com
 ([fe80::9e76:813f:9cf4:5c6d%6]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:41:18 +0000
Message-ID: <4f9bbabb-60d9-4f3e-b0e5-121660c3d3dc@intel.com>
Date: Wed, 29 Apr 2026 13:41:16 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS9ndWM6?=
 =?UTF-8?Q?_Test_GuC_v70=2E65=2E0_for_BMG=2C_LNL=2C_PTL_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260424203007.2370832-2-julia.filipchuk@intel.com>
 <177741562872.22650.14230295676040962754@5ab824fced77>
 <8af80c3b-49e1-40c5-a983-afc300a54cee@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <8af80c3b-49e1-40c5-a983-afc300a54cee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To DS0PR11MB7831.namprd11.prod.outlook.com
 (2603:10b6:8:de::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7831:EE_|CY8PR11MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb62d4a-9d19-427b-3f82-08dea62faa4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: yCPbzlO9he7SherMWtCJ1xctT2jKEJXYtwBOl2Tgkt2bXIddwwhf2p8Sb9MWjrkxSgp9Id73qUmKvWYiUJ0DuQUyo+9U/OUwQ1o8JpY02xI+qUaSsWIdUcoUNqJwnZOycI+6WN5Kymuqt7f1FZdPnLN9374RFq8qaZsOMWd9xaFmVETrlrBx4HVhnTAH7FGXmyBdFZZKBUN3i36I/V245spy230UK5hkZwuOCSGtJFEGVwlpcl/hdC6USUAzI5FkoYCrvj/vYzbgJtXixvBJG0zwd1QXhMGiuougT1ZYQLNztAPnSlEEz7/m3/Fu3/icCyRMUUnZeAmx5++yCyIjaGbSD7nUtvONIE+3buSUzZcF6UEqzts3GmHPTfp3BmU9iyGou2P3S3uX0/quemGdwMIY1wSHMUg2b0+oDhouMSsfvk6SP5+Sil82ANYusslSPPY7K7fz5QPo/bSIJHXuK1LG00Q3YpzOoqjC7xmyPiTEX0S3elpYEMsuv7AQLqKE8wR51g1p1Lmp5a+HsE28gs7Ozvqb1ozvpR3UgNFJwY2s2v+PBj1mKdA8I5ygCdSuYzlDC1JEPX8OlTmU7BMN6WXm2ixRODrgZVM5phgNGQVOIcBgjNvAB9xODyELilXD9WK1abqzpK7ODD/nuW2Q+/wOU+yboediC8NzM/0HHWfm/b2kr9sqDHert8TlZ4H6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7831.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE9YUWYveGJ2TVg0VDhzZWoyMmIzN0JnNzY4aktyeFkwR0twU2MwOWFQbjh4?=
 =?utf-8?B?Nlcra2dMRzl0L24vaEdsemM0QTZZREJZcS8zNU5OY0ZRdFE0QzJjZmhwNGdF?=
 =?utf-8?B?NHZ5bFMrazQ0ajQxdHI3MG4zeVN0QlBhczJCRmROdFNmL0tYVjFmMlVseUww?=
 =?utf-8?B?azlGdi8vSUVGMktxM1FtVUdnN2wrR0xTSEhjWFJqR0ZucGlXS3RGNWVNd2hn?=
 =?utf-8?B?VUFYaFRHTmx2M3BFc1cxVElFNTZMTDBtaXdoMWZuaDBkRWYxT1hvVWVEbldY?=
 =?utf-8?B?bVdRc3VNV1hmMVRUSW9lQVBybzUvV2hHM3VEVGtaNHJERmZzYW1iNmRmMWxq?=
 =?utf-8?B?aW1ERWplc2s2dEZXRkduRzU2bCs5WG80aXNscXc3WWhYbnRyRHhLSE9GN2JD?=
 =?utf-8?B?b01aY2Y3THY3eXE1WnpiNzJZbUpTVFEydWNTVVpqL1F5SWZTeEpKcExEbXRT?=
 =?utf-8?B?dkJtV0IrSHg4VU9lY1VpTkRobzNVaFlHQ3dMa2draFBYZllrbmZDWCt2b3I5?=
 =?utf-8?B?VlRvY3k4QXB6eDZWRnduM3dsOVNlbVZJNWNtUGYyTDF4SWJzV0ZyYU5Vcm1I?=
 =?utf-8?B?cUEranFjb2JzQkFoRWdiVFN6MWJjVklKOU9lbm10Q0RQQXBWL2M5SEVFa0tN?=
 =?utf-8?B?M1dzVWxUQUUwR3g4cmpkb0g2TE8xUVpZNkMzMC9tSTgzSVlWQVJQajl6alJT?=
 =?utf-8?B?NHhIZDdmRjdmeHVLeHcyTkczWXU3YzNNUkFZNUtCUUM4QW1SZ2o2Q0s3UkdG?=
 =?utf-8?B?OUMxTTlydDBPMTBWNkR1MHNqV2pFRFlzMXNLcDkwZURteERyRG1ybUhqVnAx?=
 =?utf-8?B?Tm9vY21kN2JVT3dLSStsbXd3UjFxNzBUdmtMeFhtWXh6MjdPc0JidmVJMk9t?=
 =?utf-8?B?K1l6ZUhJMWtZS3VGeEtiaFBNdTM1MDJXYU5tblR1Q0Z4TkFsaXNuWGV3cHY1?=
 =?utf-8?B?Tk1Qb3pBWjdFMWRGUjJqMWxsVGZJWVA2b2pncXVhVS81M2NnUGtVY0IvQTVu?=
 =?utf-8?B?Qnp6T2VpcGY5UHJlNnRyeEtLZUNnOFdRVDhrcVpYZ015NEx3TU0yRHJ6by9a?=
 =?utf-8?B?Rlp3Zk9vRklWWEx3RXlZU1o1c09uRkNwUjJsdmZ0NDlzVG15UnpCSTVxVnhZ?=
 =?utf-8?B?TlZjYk5RUXJ5QkxjcVl5OXN6YkxtdWhwY0RnZDVUWGZkUGw4ZGc4TFl6Y3BF?=
 =?utf-8?B?Y3hVVW85SjJnNDlBVHN5UkhwTWRLQUtSRFZsM2p6NFM5ME5oWjArYnorRktO?=
 =?utf-8?B?UUFaU3MwSkhDTFJGRVdIQjhkOUxxVVhvU1lDUnBHa3YrUmIyRExabXVVSmVo?=
 =?utf-8?B?eEp6ajI5WG00bDE3V0pmZ0t2dXBmYkUzYUt2b0x4WjVNV05PUU1OdzdDTlpO?=
 =?utf-8?B?bC9pWFFzN0p0bDBGN3lYd1hzZWVNLzRPWnNIRjVxYjVhamprUTJVaHU1Y0hM?=
 =?utf-8?B?RE9rUXh6ZHJ3MlNrUnJCeE12VnpXM1lxRkhRU05rWXhHb3djNGtMbWtLZ2Fu?=
 =?utf-8?B?dUMrMkl4RjJ6eVVtbTRmZmcwYWpZcjlWcStUbmUyNU9IcVk1dlhsbFRtZ0l2?=
 =?utf-8?B?ai9GMnpLZmNLRERRMnFEV0VKOWh6M09weHRWcWVxZDRHVE5aMWNHd3AzNHRC?=
 =?utf-8?B?eW1mV1JXWW55VTlWMDhCaGtTeitXTXd1aHZQOXRNVy82QmpSVVp5Rm1vSDda?=
 =?utf-8?B?R1hIbVNoNTBGbENxRUUveGd1ZXU5aE9DYWVCZGNSVVlPSHRlWlBGaWZvQTNN?=
 =?utf-8?B?VkhBbS85K2Y3YmFJT3p4dDhyd2EwUFIwbkM4U3dVNUw3bHJwbkcxcCtVMVA1?=
 =?utf-8?B?Y1ptRzhvZlNkUUw5UGFnN0hZd1VtODBVckRrR0I5MlNBQkJ0dkUzanVmTG1i?=
 =?utf-8?B?enUzQ3FGOE5nY283aHpRWkZUR3doWFdqQVJVVk5hRHgzRk9IMzJ4c2Vab25N?=
 =?utf-8?B?S1ZRa3FpNXYweTIrcW5GL2Z4M1VoTDhXWjRuckpXdVdmem02Zyt0c2Z5NC9t?=
 =?utf-8?B?MFFzdDl4clZNTWd2WWVUSzNUTUNxUnhVUXkxNmxoOXJNK01mV2s1aVFQaUFL?=
 =?utf-8?B?cUpUUHcwWlo5czEvMEtPcUhqdWowR1VXbndZaXprdVFnRlgvdEErYkIyRUM3?=
 =?utf-8?B?bkZoWU9peFRJdTY2WXk5eWtDM3lZaCtSeEMwYjBwZ05GbTh1WHVGWHlSeGNS?=
 =?utf-8?B?NEJYTVhDeXpXcnZIUndpT2hramxhdFV4U0pyYUJtdnlFOTJYdmplZjRCMDdN?=
 =?utf-8?B?Y1ZoZ3VXeVZDcWprMU5sR0FMamJlNFM5MTJLaVJVbWxVSVZ1RElyMGhtdSsw?=
 =?utf-8?B?ZzJLNGVBTW5iV1c2U0kxUzhvSGlDamJ5VjYxTHpJbDZmVFFuR2NRL3NMcS9P?=
 =?utf-8?Q?pYmcgVMcUh7sz/pk=3D?=
X-Exchange-RoutingPolicyChecked: uWyvGiLcdq8MvsrNW3b9FJ1P9HCa3OVe0+yahc3BC76Rzp5hP8hxCPLOAQzb5+uhEv8pm3bKej6BYEuJZIGCiEnMUdZ5qDyoQE74geBCbhfo+FW4Yc/dMD0MfO8HOm8j9g1Y1VltRQzI+3gTTq9KPgzrSkeq/P2e5A554s3U5LZ0ptjpGd00f0Rg+qdRHaTQLk4RxCHzCd6radXkagQN/2iUrdlfZcbMyQS0LHcRfvlMHO0ApZJSc/lXNrLMFUOqN8sGlf1OTTczE1u8avSHHl38m5N8ms/eYbYe6xakfOj5fr124Pibu4/OaLcY2tiEXExgQXCkiM3Sq3XJrObj1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb62d4a-9d19-427b-3f82-08dea62faa4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7831.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 20:41:18.6801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lp5sTNy93oMsCEHYN8e3UWYxaotDW08z/lKEAYuebsVd6trmIfKROj9ldcSUMHc5ysHr/98N6NptzPSNsF+hw8XxsB1TFQ6GI0oh+aE597w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7396
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

On 4/29/2026 10:56 AM, Julia Filipchuk wrote:
> On 4/28/2026 3:33 PM, Patchwork wrote:
>> == Series Details ==
>>
>> Series: drm/xe/guc: Test GuC v70.65.0 for BMG, LNL, PTL (rev3)
>> URL   : https://patchwork.freedesktop.org/series/165457/
>> State : failure
>>
> 
> 
>>
>> Participating hosts (13 -> 6)
>> ------------------------------
>>
>>   ERROR: It appears as if the changes made in xe-pw-165457v3_BAT prevented too many machines from booting.
>>
>>   Missing    (7): bat-ptl-1 bat-ptl-2 bat-ptl-vm bat-wcl-1 bat-wcl-2 bat-adlp-vm bat-adlp-7 
>>
> Previous runs of this revision passed all bat tests. Ignoring this fluke.

Ignore previous comment. Triggering another re-run to get PTL, WCL results with
latest set of changes to be safe.

