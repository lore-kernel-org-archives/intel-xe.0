Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB44FF8861
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 08:51:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B4410E640;
	Mon, 27 Apr 2026 08:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DLrZUYJ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A1A10E26B
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777279877; x=1808815877;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AETgU5tT1B0Jib9lP8NTVPKVbRIZ7oRuRxe9aSGbXYI=;
 b=DLrZUYJ3601Osucf4ewdAjpaTDWiuSC9jrULr8UDC97F5FLaibD2kIr1
 RpTgD9QgdpbtPuynvt+vt6rxlLcJVdVvEOqLIDz4UTvxBK5n5tSuI7dod
 VNbZIVAfl09+vqcb/GKkTewL0tooS5rhN3zJBcO3rslgJ3phJXoDic9NW
 p8iuJNtC781Of5jHLGOmItyJZkCM/8jQkT8DuGengp/1Kw4AhfNOoKzno
 /40Ec2RgyBTm2kDVGV6flsZyWolDDoIodNCJqglvG5IJZCbJUEhl8Wmvp
 k/5Crs4ex3tT/rSWQiix1arURZMPuPBfUpSjGII8uXRav2GW8pZ/4D4Ab A==;
X-CSE-ConnectionGUID: BjIiH5/1SZaPa0WFsmJZSQ==
X-CSE-MsgGUID: ZFWW6HMtSHqzVW77umyygQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78220602"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="78220602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:51:16 -0700
X-CSE-ConnectionGUID: 3/YF4MeNTv6h599ziwSZmw==
X-CSE-MsgGUID: OdX4M7c3RWytlg3bjd5dvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; d="scan'208";a="238621032"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 01:51:16 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:51:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 01:51:15 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.32) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 01:51:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4E6x63WqRYVz4N1SdyMkUKy9iBfKc46/cP2bgMZxXDIqBuOq9rrTH8WMGgzHwgfFxZ/606z8BKM/Aqcu3LYwvH+rEu43Pp85eL09zTEX/5I0FZsECHPAcB7OEuSf6d6O2UM/t+L27slOACuo8h98Gthcmc54NosGopBzyny267gdmvJWni83i9ALuPjpRXfA8qJhi3oHcuUnAFOomi6T8YO+y51AhaC41c+eF/XL6DDrE1jM5UFqAVnqyEUSWfw3jajyxY/7qOHIt1SIoRIC6WVBd12PNq54TpyQHkKON+hJeJspnfSBt5+bCYTitM9OaP03/MZFbRG5zQFv4VXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjSwc/EaC8n00bLs5n11sBeT4XIWYMdpN7j9mxaL2sE=;
 b=O04BNODYyRqKN/OTbpx3MIK12eoIaZVRL/yMRfke805AF7LMsBsxcQzEgpRmEIoOfty/PyPEHyCYebnVZP5GHpudSBaQxxpRIoyVo29IHGSBZw5dlbymsrfPmiQvip5Pt5vGznijSXdCqt48aIkPy8yJKHTE66PqbJerGW0Fa5MpcbZk6sfZXXJ8vRRA4Ml/8qsu9C32L8CwajwIDeNNSn5347HVuVuXwjVKy8crrkDvqX3hOLnVi5Yak78Crp3kET5yqpQQ+CuCX1/fpxfs/NYCxN3dbHRBIh6mpcKYMZo+EHdrWUKqPsG7cuy5CKMYq5As3Pt34M+5T723F/4PjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.21; Mon, 27 Apr 2026 08:51:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 08:51:07 +0000
Message-ID: <46b54831-dd54-44c9-b2fa-6ab475daeebf@intel.com>
Date: Mon, 27 Apr 2026 14:20:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260410102744.427150-1-raag.jadav@intel.com>
 <20260410102744.427150-3-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260410102744.427150-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b8d014-81d1-4640-85a8-08dea43a1f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: SMR/VJTz8+Q6HedjPweWPWhrRsbsHBe6r/LzJ7NQE+mkTYjFHckP0K3U3Ey2GMD7nDgIBql6cVf1QwCo4uzUKQ/pAJ0VVzvZh8nR25xK4uKTgcC/jwWRiQZLTe+CR6rH7GP3ByexRIIuasFLIl691vyhqU/sH3C0lUKi8vzcx1eIJuTn8vtsgdkuSom86qs1QFyiDujTxSVK/gyF3YCBZfkLOFKgIybsC/j1hkClAeGz7wZMxsgCrYViV7P0nJRRmRNilJTdVhbDaJgWrlAkmaVmmT5O9NLye5XjMGllnkhMBnQtKXV8RUys/MEdsPQ/2PW88XK29jQ49GnpnWwyx3uD9pU6jstkspgwAj7tP5IT1Q7iIUR3lalao5uF3biLQ9KTl3ge3LmYSWR2RO9E84FO5cCnFB9PYkv0b0mm32lAQkExuzbNAXYllv5EdwR6R5LRma8vM9zAGDAYJPt9pk8eaEq9J85nQmKL1ya5zXacYElnv/F3e0JggKaMD0g2ZcUcJigcsLtzhPIhFHYw3MoFQbTtDZfUMmUlxFvNrgvRuIUaK0O1tL//POiHht5T4lyrGIvNVdxu1EOnTVnDfAQGb2DYsxQs3ypQ47vMwM0h091TDnGJaahsukCvakqV2pN0u0JT1+7SkNAQX0RAnI4Lm9MpZLTtTPMvQSqLZHBd6MbDqem+aP4wUz/XWGLJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlI1MkF1WXo4Vmx0U1dqVmxDNnBhSGJQV2xwb3VvRk5odnpLb1hJbVJ5TG9a?=
 =?utf-8?B?MkpzeExJdnpxbnFBeml5M3dNeWdIMnJ0RG12dThnaGJnNnpvL0JaSDhaMlNJ?=
 =?utf-8?B?SVY5eVUxclFtenBFVitySTNOdFpnWlFEaFFMWkloMWovK0ducGRpL1g0Sk40?=
 =?utf-8?B?T0ord0UrcGZQeWJxY0tlRjhobVV2SDl3L1p1UllSWThWNEUvWmxvYnVuSWJH?=
 =?utf-8?B?YUlrSUhKQktGZnZtNGE5dE90TGs4MDN5RG5nWXVTVVliU1d6M3JmdjVpOTY3?=
 =?utf-8?B?dDM5TERWSm13SHl0UnJKQnAycnpHNHJjZkpzbjhUV2s5dnJQRjF3V1ExTUIr?=
 =?utf-8?B?YmZWL2hRM3lNeXdpSFJ5K2trOEIyQWxzOHNWa0M4Wis0WFlmWks4RXpoNjdm?=
 =?utf-8?B?RSt2dXUxVnp4YUdzMFR2ZVBmM3BRY0tYeCs2NkR3WnVjM1M5c01VSmhzMllQ?=
 =?utf-8?B?UCtocTBtaEtUaU13Rk5xdDBDaXExS0RzVnJKYlMzdUM1RFJFM1lCeXpER3Fo?=
 =?utf-8?B?bk5odktJaGMxNmhjeU1kVE5JbkFNRWRDWTZoYm5TNDc0M2JyT013VmRrWlhx?=
 =?utf-8?B?cUU1VG9ZOVlSN3hycWg5OUtPYXgwR3AyMXZscm83dXNLTUtUUTJ1bnozKytr?=
 =?utf-8?B?K3c5elFhVDZsek9sRWRTbExiTkVLZi94QUJraUc4QWNjVEhTdmJqUTU5VGFN?=
 =?utf-8?B?Y3dxTk1UczdhYkhPdmpPakIzb1VxQjBSTHFsY2EwelM1UisvdVViMXVDS0pD?=
 =?utf-8?B?akpyZUt6STYyRGJlUHVrdjl0WkRDcUZudmtOWXhuMGdBdSs2Z2lFMVNOajFP?=
 =?utf-8?B?V25tTVFSV1IzZElwdkZULzJmNndZUWIvWURoaHJXcVQrMVZuOHI3ODZmenZp?=
 =?utf-8?B?RXdWNUU5eXJjQm1ubEFWUFoyN3FrYVpxcGFFV1IrYTlhRzZ2MHY2S3FtU24w?=
 =?utf-8?B?djBRMlk1eStTOHZ6b081TWo5ZXdRYnp2UXlZeFdVR1F2b0l5MDJyOFJpSWRr?=
 =?utf-8?B?VE1WRFp1Q1RMVzJLOSs1bEpsUSsyOVMybmJXTkJEZGZJMjcvTkJDSE1PY1hs?=
 =?utf-8?B?S21GT0hXUkU0VUw1TDY2dlZaZ0NWb1M2NTlLTy9oRnJ3U011N1VsbDRvK1Fa?=
 =?utf-8?B?Z0ZvMDJBaFFUZGg0VlQvSjRULzU1bU1CL0ZBRitaQ09VZ21FVUI1aFNCeThy?=
 =?utf-8?B?eFNUY1RWMmtNc00za2lJN29hTDF0MDI5SXpwNk4yZG5FSUhxNzVETlVWSUR3?=
 =?utf-8?B?TVJuQWV0T29YTWcrcVUzN25LQVJjUisvcUNMSHZ5cENjNkgwM2M3UEtrSkhz?=
 =?utf-8?B?RzZ4UzliNGk3SmcrT3pNSk5kOWFXNUYvZEE1Wkk0RWs2K0w5TEVoRzdXVG94?=
 =?utf-8?B?Sk1XbmpzRnNaRDIxMmtzY3Q5Tnk0bmFWMytNUVA2b29mRGVyZXhnYXNZT0FB?=
 =?utf-8?B?YnlxQnpZQ250cS9NVG1GTmlCdkVNNnpTdVJOSklLanVTYWhweEVVL3dPejlT?=
 =?utf-8?B?T1RjdXhzancrWktzZEt2N1JEMUVKbldPR2FWV1p5VXI2MU9yMnJpazg3bTZn?=
 =?utf-8?B?UVpobnZkaldFY2JVYndQRk5WejVrR1ZjNXU2TVlhOWNVa1BSVTh6QTl2empv?=
 =?utf-8?B?VnpPRVh1aVBHVFE2T1JTdXJoUDgyclFVV3pwaW9nL3BBZzdnNEc3YW5CS3d6?=
 =?utf-8?B?REdnQXVHWk1EYXg5SzNKaURLK2VzTU5MLzVCQ3VsaEZFT3Fra1dtOXJCSWFY?=
 =?utf-8?B?ZWhnMnpGd3VyUnFPaTZjU25STXNDdnI0Mi9aRWJNZjh6VzQyMHFQaG81blZw?=
 =?utf-8?B?TjBzZ0xGNFZDQnJlcG9tMXIzbjBIbk9EUFdHOU9kTFRFT2p2YUl3N0RpUzRu?=
 =?utf-8?B?bkZ2L0g2Ly8ySEg3S2xPL3FTQnEvMDhlaHhZOVVpdjltTlE0d2JvOFhVREc4?=
 =?utf-8?B?ZG9QMUtDckdadDNvamNiM2NhMmEwYW1WWEpBMlF6bi9DcCsyVlZnVE9JNkUw?=
 =?utf-8?B?M2xlRlp4b1gvc3U0ZWtCemxCUFQ3V2MzQWNqOE1NUVVSNEtGb21FcGYwdWtK?=
 =?utf-8?B?cmxjejlHWXBRVkdUMEtuT3JGR1FhQ1YrS3FBQm5vcGxBUVJ6REF5ODVXaTVp?=
 =?utf-8?B?N3pvTW1idUpSMWFVdmVUUWRBYXhhUmpiaDlxQUVoSE9WK2ZDWXJ0ckQvQktW?=
 =?utf-8?B?SjNvQllFWEZFUVhFUVRsczc4TDBpSzVIMkFIQkdPT1hFcmpwb1ZkNlJKYnEx?=
 =?utf-8?B?TEFXNmpOZGE0NlErbDg3bjFGZlFDZW0xNFRZZE5VNVlTNDVLZ1lCUjdJRzFa?=
 =?utf-8?B?YXBQazRrUEl3WmJuUnlzSG9oNTRVMzlueTZ5QzJJSGZtMU5NSFJmUT09?=
X-Exchange-RoutingPolicyChecked: MtpaZtvHsNVTnU/J484I6ux+8qYk25hpoqW2oS8imXBZysQTGxG8Wy4R2pa6eAvBbpqw0xMgoTJ4Fj0FZt1XakOnX7tXzFWP7vIQeDywFDlizumK8QjzlwGmCavDcB3EzP30RGH1KZUN/Br0xP0pbo93qYAtiKhxOgZ6cJaP82I1ySEALDpN8jcVpYivhl7FkuhWsudYqvyAnL1bsLqwSImyYDQ8doqHyVupD1DU6FLibqbCLGV6ND2K41rOu7Cl48nlnhhKGCA4oveFmVaAoVwJv8B8ruRhIr6XmRh7PLuo5Brej5MMVOD/GH6YhCvt+NDwYrHJFnb3s2kscIBkqQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b8d014-81d1-4640-85a8-08dea43a1f51
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 08:51:07.5028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJ+4sWh6mgHI+3JEf7Y5Tl7weLkuskR9aGhdMzeoLNPo3IgzMzTndIYZT/tBwzB8/3lXeL7r++sznSsuNKG83g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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


On 4/10/2026 3:57 PM, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: Handle unexpected response length (Mallesh)
> v3: Handle event flood (Mallesh)
> v6: Drop xe prefix from static functions (Riana)
>      Don't fail on unexpected event (Riana)
>      Move sysctrl commands to xe_sysctrl_mailbox_types.h (Riana)
>      Add kernel doc (Riana)
> ---
>   drivers/gpu/drm/xe/Makefile                   |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c               | 11 +++
>   drivers/gpu/drm/xe/xe_sysctrl.h               |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c         | 84 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h   | 57 +++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 18 ++++
>   drivers/gpu/drm/xe/xe_sysctrl_types.h         |  3 +
>   7 files changed, 175 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 7f03f06df186..9e6689c86797 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index 72ce0822cc6d..8fd791047f0a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -12,6 +12,7 @@
>   #include "regs/xe_sysctrl_regs.h"
>   #include "xe_device.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   #include "xe_soc_remapper.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_mailbox.h"
> @@ -39,6 +40,12 @@ static void sysctrl_fini(void *arg)
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +	struct xe_device *xe = sc_to_xe(sc);
> +
> +	guard(xe_pm_runtime)(xe);
> +	guard(mutex)(&sc->work_lock);
> +	xe_sysctrl_event(sc);
>   }
>   
>   /**
> @@ -74,6 +81,10 @@ int xe_sysctrl_init(struct xe_device *xe)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_mutex_init(xe->drm.dev, &sc->work_lock);
> +	if (ret)
> +		return ret;
> +
>   	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>   	xe_sysctrl_mailbox_init(sc);
>   	INIT_WORK(&sc->work, xe_sysctrl_work);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index f7469bfc9324..090dffb6d55f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -16,6 +16,7 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>   	return container_of(sc, struct xe_device, sc);
>   }
>   
> +void xe_sysctrl_event(struct xe_sysctrl *sc);
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
>   void xe_sysctrl_pm_resume(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..3edde46a9711
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_command *command)
> +{
> +	struct xe_sysctrl_event_response *response = command->data_out;
> +	struct xe_device *xe = sc_to_xe(sc);
> +	u32 count = XE_SYSCTRL_EVENT_FLOOD;
> +	size_t len;
> +	int ret;
> +
> +	do {
> +		memset(response, 0, sizeof(*response));
> +
> +		ret = xe_sysctrl_send_command(sc, command, &len);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			return;
> +		}
> +
> +		if (len != sizeof(*response)) {
> +			xe_err(xe, "sysctrl: unexpected event response length %zu\n", len);

Let's keep error logs consistent across patches. Since multiple people 
are working on different patches
I found these logs better from the threshold series
[v1,08/11] drm/xe/ras: Get error threshold support - Patchwork 
<https://patchwork.freedesktop.org/patch/719221/?series=165091&rev=1>

Example:

xe_err(xe, "sysctrl: get threshold  failed %d\n", ret);

xe_err(xe, "sysctrl: unexpected get threshold response size%zu (expected 
%zu)\n",
            len, sizeof(response));

Let me know if this works. I'll incorporate the same in my patches

> +			return;
> +		}
> +
> +		if (response->event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED)
> +			xe_warn(xe, "[RAS]: counter threshold crossed\n");
> +		else
> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response->event);
> +
> +		if (!--count) {
> +			xe_err(xe, "sysctrl: event flooding\n");
> +			return;
> +		}
> +
> +		xe_dbg(xe, "sysctrl: %u events pending\n", response->count);
> +	} while (response->count);
> +}
> +
> +static void event_request_prep(struct xe_device *xe, struct xe_sysctrl_app_msg_hdr *header,
> +			       struct xe_sysctrl_event_request *request)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> +
> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	request->fn = PCI_FUNC(pdev->devfn);
> +}
> +
> +/**
> + * xe_sysctrl_event() - Handler for System Controller events
> + * @sc: System Controller instance
> + *
> + * Handle events generated by System Controller.
> + */
> +void xe_sysctrl_event(struct xe_sysctrl *sc)
> +{
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_response response = {};
> +	struct xe_sysctrl_event_request request = {};
> +	struct xe_sysctrl_app_msg_hdr header = {};
> +
> +	event_request_prep(sc_to_xe(sc), &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +	command.data_out = &response;
> +	command.data_out_len = sizeof(response);
> +
> +	get_pending_event(sc, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..7066d7979f4a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		59
> +
> +/* Modify as needed */
> +#define XE_SYSCTRL_EVENT_FLOOD			16
> +
> +/**
> + * enum xe_sysctrl_event - Events reported by System Controller
> + *
> + * @XE_SYSCTRL_EVENT_THRESHOLD_CROSSED: Error counter threshold crossed
> + */
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u32 fn:8;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:24;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
Nit: reserved1?
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Pending event count, decremented by fw on each response */

Might not be decremented  everytime if there is a new event

Thanks
Riana

> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u32 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:31;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;
> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 89456aec6097..84d7c647e743 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -10,6 +10,24 @@
>   
>   #include "abi/xe_sysctrl_abi.h"
>   
> +/**
> + * enum xe_sysctrl_group - System Controller command groups
> + *
> + * @XE_SYSCTRL_GROUP_GFSP: GFSP group
> + */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +};
> +
> +/**
> + * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
> + *
> + * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
> + */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +};
> +
>   /**
>    * struct xe_sysctrl_mailbox_command - System Controller mailbox command
>    */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 5f408d6491ef..95359af691c9 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -31,6 +31,9 @@ struct xe_sysctrl {
>   
>   	/** @work: Pending events worker */
>   	struct work_struct work;
> +
> +	/** @work_lock: Mutex protecting pending events */
> +	struct mutex work_lock;
>   };
>   
>   #endif
