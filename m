Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C8A606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QyN8lN0U;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=EXwlqw7r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AD9610FC6C;
	Fri, 27 Nov 2026 06:00:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E4F10FFF0;
 Fri, 27 Nov 2026 06:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759226; x=1827295226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7G91EK5DZ4+KVBwWDmZVm3TLJfoJWKw9WapM53by2Vo=;
 b=QyN8lN0UN8l7oVLzcZtnR+mKgPTuSwaVx40AgjXhBpHWNo1XKCJhFnra
 pNimgC71U/dMUYGErweKlxB0nZPOWq7dmaEYnfEs0Cwn3dgGr1q/EBUwx
 pkeI329tQHtmETxOYqtEeHfkTxrS3m6f8BoupRAcnvNUR2EfRcNYhvQlI
 LfotP7rsbaG0anPZXgNN/Us698VPU4RhWokY4OU6qbKwHZhSOoi6HOLG9
 YYbk/et+6NpFPrH8aalqomfoZjRvFIDgg7EWIWdmMkx7T4VnfqP2I8L3t
 2O4ASTI4JkeP02+CCU+feAchU5SFo1g8gxZX51gtcE4F6AFUM1sr6QKmS Q==;
X-CSE-ConnectionGUID: 6GaYi4PnRreBuGukWWc8lQ==
X-CSE-MsgGUID: xEQAfV4SSQueQC+2MTaQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4576390"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4576390"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:00:25 -0800
X-CSE-ConnectionGUID: 0HvPRz9kRTunEPAC65n7qQ==
X-CSE-MsgGUID: CLkRwcbBQsShQtoi3JSyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14360669"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:00:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:00:24 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 22:00:24 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:00:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giR52PtyDJITUmacX/iJOCF4lvpMY0EtzNAQOFBBmxnjm3pgHHts8FsJOUaTn2jANKhAIefXuaFTONPQ1/nzuxYjkcQu4w32C7krDKNnowap8/b2WDIDY2/c2SYbAg4JUPL7/5mSycZQEail0AG0CwNlrkgs3BlzjLo3FxxyeAuhp0wTShV3oo5HIn46q4CEJmI6AQMfOqlMCLBt/AinO/u+eUuCseLEl4ZnkNakZNa63ZxcvSCLT1zH8pEEGIwR8WS5CLZbH3WyJgE49QGnXp4Oy3004X/eMLq05flzy0cs0TzCAEKR3YDUE50bB3ed/y+fDIZhJqHTcjVN+5c1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZalfGM+gS1PA7LOP+Im+UFMADUI1z6Yle4USogtryrA=;
 b=b/5oSh1mA0Mr73V9ci8HurFFjt3QP3BPih2mfhNFE06Q6/Qmno0RexvGAhsV2B289yTorPqegzRfs+4m9fgB7KnYVOGXZ7Fbhy9aM6QnKLIAa8y7glYX/yibllpQLlI0w5bYOU5nOAIXwXByNDMRRntI1KvqfX29pfUukY3/elcxCSDJt/yDyyDvvJA/JQ1oreqhGx1udtMpSRsHChzcte/Dov3Bhxx0yu65+sFaMOVTI6t53jtRlVA+c5UZRw0zopUTn/kc+Tlxpp/DYDaNNzsDfwD/tzB8h/cX3HqSYQNt15tZsW9pYRn+t2gn/yTGIIn67Hw7VAZrDmsbsAA9rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZalfGM+gS1PA7LOP+Im+UFMADUI1z6Yle4USogtryrA=;
 b=EXwlqw7rkIBQ051mWlNcuiOl+nmYBMFGvm1PN7GYDd7D4w+/f4m58GwW7gPR8DglGQKrQ09JzqAtQ0B+hRtHE9Fjlrcw5kxl5orR1mpnbo4dc9W3xRbe9nyJm3cmWUheJaPW6QnYfC3xI8MsU24lqkRT/W6HLZfeY2RVxQybZCo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 06:00:20 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:00:20 +0000
Message-ID: <1ec63dc2-0347-4c7c-ba68-660e8fca9ac5@intel.com>
Date: Fri, 27 Nov 2026 11:30:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] drm/i915/vrr: Extract
 intel_vrr_vmin_vblank_start_live()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-11-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0092.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::8) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d19a49-7bba-4042-3d5a-08df4c4bb7d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|261026121527099003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NBco6jVXyhyyrGCA8LwHi+cy8ckQ3Dry5YJLacbQPJPeq5NT/sznNlkIUzmDY0RR9Xww85mNUHM2RfdCyNKFwcvA0HF5Gj4cnTuNC57eVroMlWlitnlWKeAiHVlMCD6MC2NwQzvQXxa6OvNilOZg1OJw9flSngQwgdzXRVYn2WCZOaActT7iTh1lShooCifXSr9EYA2nTAYjHl4BQ80ytkr7sf9xyhtlvOgvJ1h4HLxDeLZAxFexVEVCyTfqtH35f6zWLb9qMRvnQ7dTbTTsvctYv6Tahp2M0/ONhOipcwIegg3dPinRWhIdtIOFND95QE+HXhRFY9NdSDx6OoGWJAe3BEQOvNnz0jGzSZmoo/3D0lCclhQuCHzaq6U+tLKyFCDiqE9FFqA+D0j9aYwfSeeUvPPfcSepv4EGhvNkFyyq0q1G3AUXP4MlhrrNjW5DeendHriqTlBJHhMs8lPftfuyifj2VcjWERRfseb+T20lUbv6WMj9NUH0m7FpnnMKNFbttXr9kFz+YwZjVNiJ5PtX8ni5Wj82BnOUH9fobWnrTXDSeFxmU3i0nI1we0/JLq65O0gNGTEMBnzVOME2wlIkHitf7cl0b53KxtWRw6nNMEHZkpKQ4UW4Qd3bFrC9GUoKbRPGc+Y6KHlkn+CbEtWPb8KTjcu0G6CPsU2oxZ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(261026121527099003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak02Qm9FRzBTL3pJOHl5b2NuakpYcHVRR1Z1RG41azVWcm1FbmRpN1d4Ulln?=
 =?utf-8?B?QktDRnhTcE1LMlI3dDRuSHpRdVBYN0NpY0FLbFJ4YnEyUm5kOER1VUhVR3BQ?=
 =?utf-8?B?NGNvNmpkTkZwV29XWjVtbzVwR1VYYTlVWWxTeS9jSmpiMFZWRGFJYUJ6TktO?=
 =?utf-8?B?YnNEZ21VcDR4aGpESEdPbWh0M01YdS9CL0V1WEpqbHFOZmFISXVKS214MU9a?=
 =?utf-8?B?STE0QXMyemlEdmo3TUN4WU5kM2NVZzNxSFFpV2Mwb09IYmswZjNxTmh6bXBk?=
 =?utf-8?B?V0wrMjBJYTBlbllmcGh3N25UMzdnQitNc0xrNGRORmlxMGdnVkFZTkVSZ1ly?=
 =?utf-8?B?RE50NlNETVV6ZlFQbmxrc3lRM3NPWk8yZHhVNzJCbXpLNHRkMGluWHE2ZDhI?=
 =?utf-8?B?RmJ6STQySlJhcHJwVW10T3NWT0VGc1ArMFBCRnczTll4Rk00QzdkN2txVGJG?=
 =?utf-8?B?WWxGT1JlWlBZaHlYdVNudmcxL2xzQks4Tit0SlBJYXFUdXpTbS9OSGVWZHdx?=
 =?utf-8?B?VmNXVk8zMzBJQmFQeVppWmJ4TDZPWktidG1LWGxkTTV2SVRpRXhHSlJGbE9G?=
 =?utf-8?B?QTkyQ2c5cFZUQjlkK3ZhWFZtNEd3eThhdXBiRDRvM24wR0x4d1BiOTBMRDRB?=
 =?utf-8?B?bjQ0T2FNblBIYTUvUlZ3YkpiVnhlbkhUL1c3OWZtY2dwSVNXTDFoSEJwQVBC?=
 =?utf-8?B?SUxLUHRydlJZdU0rNjE5SzVQY0Y4OVFDcU5BL2FUVGhoRlFkY29QcmViQzhs?=
 =?utf-8?B?aG9DOG5Yc0E4K1ZLdW5YL2NLS25zeS93UW9DUkJZTjYzUDZDaDE0cG9wK0tp?=
 =?utf-8?B?TDdna2J5WUtCWEg4cDBEQkRTbjJTVU5uQmxhTXNWU2ZRN2sxMWZHY0hMVXA0?=
 =?utf-8?B?QjVybDlMS1VsUHhrQ3NSYW90Ym4wbjlMVEt1QzV1VTlFNmVHZWxwM0ZlWHU4?=
 =?utf-8?B?dHYrVldzNzRJSlFha2J6Njdub3FwUEgyUTNzUXVyUXh1cXhJN0kxdDFoUWZU?=
 =?utf-8?B?Tno5SWRvdnl0UmdhOVo5TVV1cTBScXZKdG5NbUJ3TGFTQ1JuZFBONEF6MDNK?=
 =?utf-8?B?MzJpSXZGSXlvM21XYzFVUXZIbk9qQjZDMjd2SzVBUy9wSDNKUHBWcGxCekU4?=
 =?utf-8?B?YXE4azZPdFhKNHJZYmRxdEFSMFpRV25UYmoxTmdJR3ZnVVNUZTBieGRnNFRL?=
 =?utf-8?B?VkpFZmtDWmtQdWlOdTI5cGpUd0tFSE1POEtPS0V3Vis3QXA4eWlXd3cyd28v?=
 =?utf-8?B?aEprN1ZlZ05LcHJXR2ZSTEs2ZnlxRE1iT0FlRHdDWEFBUGwxSXpaV2ZPaTJC?=
 =?utf-8?B?a1NHM3JRZ2tkNFRQOXpUZ0VORytMY3k5aXBsbWl6RFRObnRmUVA2ME5NWlBJ?=
 =?utf-8?B?cVRvUEczNFJlTWJDRUdwSG5tWWVpWGluUE0vSGNQazhoSHlYSm5UeXNET2Ro?=
 =?utf-8?B?YnVJUzlmcmkxREJIMlo1Ykl5THV3RktHQVB2UHZTbHBVUUlXVnJuTm1iRlZm?=
 =?utf-8?B?b29JUElvSGdQMm5PS0ZWcTB4ekEwSlBDSUZFYUVwdnAzOUtTVGtmNXBwN3Q0?=
 =?utf-8?B?b3JhWXg4d2ZtOEhwN3JsaDRLZksvRmwvR2ptdWNsbGM4bGJ5R3Jmajd2bVNT?=
 =?utf-8?B?Vkp2R2grdElXZUNibkRMcVBkeWs0ZnhmTmU0SUtteWd3c1F1MDQvOUNiU2xZ?=
 =?utf-8?B?UnZFY3pqYThjTVpIZWtZNlVYdEFOeEZ3eGR2RzBPRVZtRk4wWFY2TWF6aFhN?=
 =?utf-8?B?ZVNLL2x4TzIxVmV5NHZGV28rbUNSSkpQNTZwajNvdjBibUx1SXRqTStqSVY3?=
 =?utf-8?B?N3RaSDltUmFRRG5QRURlVllTTmQ0RnhFT3dJcTBTYVZQaGdVWVRQdTBLVnRz?=
 =?utf-8?B?WUVsTmpKNUZTeDFLVkN3a3lHQ2cyTWM2M1pLY0pQY1VNcmNDS3pwUlQwRm1N?=
 =?utf-8?B?RGlPZTJ2ZjUwcGJ6R0Exdkd6MVdnaFJIaFBYRGgxejJsVlZXcmdCQVhPSmtt?=
 =?utf-8?B?WkZRNEdkZWhiMEUzOGEwVHlpSm9TU2lteWdyVFAyQ2xiOXhQME1XUENlY0NP?=
 =?utf-8?B?S0FnMlQxajg3d0pVY213b1VQYkluNnRRN0swTGQ2MHlDdjRvc2IvcmhoNUNi?=
 =?utf-8?B?QU9nK3BpdS8zQUhYSFBXUGhXTlErWlJjUEw0V2xSeXc0allqcGlySk4yd0RR?=
 =?utf-8?B?NG9wdVh4UC84RjAvS25scndIM0JHd1RQTnJBV0J0ZGhzdERCVFArSUM2MmMv?=
 =?utf-8?B?RStPUlhLbXNxNEpsK0UxZCtLL09aZlZGUmJIcWw5eG1wNTVmY0N6VFFsZm5z?=
 =?utf-8?B?Y2tyWHIwQ2dQR0wvdjUzYzUzNVg3WHFuVVpiVTlqanVPdnRCZlFnL2x1cnFX?=
 =?utf-8?Q?jKQ7poLWeqNHMxU8=3D?=
X-Exchange-RoutingPolicyChecked: cc9BAx5ht4DuHiUax6FQFWMRGx6Zx3IhqjHuXiM9vM0ZRwHzI7Jm+ZyOFKSDP40v1XSq/CLP+6JAqJY03q2haLqu7dx/DyERLVyByp30NbyaK6Gn+XtVZVN7UKnF4LepuFCdAP8Iv1VhlBfQmUvk7U0x8MRj9P31gGiaXAvlEDTz7N2p/6L7QJvwbvRQ/y+aXmhEukXzbh9v/BUfc/mw0swDpJp6Ngt/yeaek+CmDoUiE415iLCUdHqW77FqElZD/eq+7LdCiV/5z6VZzSZquLm/iCf9skumtJV7YXsc5XJaF3KP929gC5IwCjL+IHsGFgXkR1ioPXQAM76jzs0zLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d19a49-7bba-4042-3d5a-08df4c4bb7d3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:00:20.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Mug2GGsEdU3J6aaIA73R5fREyuMz/eZ9eRefeDWygXStIb3nwTr826Rj6fpFydM0n3w/0umJTkZFN1NUorE4f324QYs41uwcZ6H4uOgKak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:28 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Extract the messy ternary from intel_vrr_vmin_safe_window_end_live()
> into intel_vrr_vmin_vblank_start_live(). We'll also be able to reuse
> this new function in the MMIO vblank evasion code soon.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

LGTM.


Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index e0b0b9ceb335..a549807586f8 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -1250,6 +1250,14 @@ intel_vrr_dcb_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
>   	return vblank_start;
>   }
>   
> +static int intel_vrr_vmin_vblank_start_live(const struct intel_crtc_state *crtc_state)
> +{
> +	if (crtc_state->vrr.dc_balance.enable)
> +		return intel_vrr_dcb_vmin_vblank_start_live(crtc_state);
> +	else
> +		return intel_vrr_vmin_vblank_start(crtc_state);
> +}
> +
>   int intel_vrr_safe_window_start(const struct intel_crtc_state *crtc_state)
>   {
>   	struct intel_display *display = to_intel_display(crtc_state);
> @@ -1269,11 +1277,8 @@ static int vrr_safe_window_end(const struct intel_crtc_state *crtc_state,
>   
>   int intel_vrr_vmin_safe_window_end_live(const struct intel_crtc_state *crtc_state)
>   {
> -	int vmin_vblank_start = crtc_state->vrr.dc_balance.enable ?
> -			intel_vrr_dcb_vmin_vblank_start_live(crtc_state) :
> -			intel_vrr_vmin_vblank_start(crtc_state);
> -
> -	return vrr_safe_window_end(crtc_state, vmin_vblank_start);
> +	return vrr_safe_window_end(crtc_state,
> +				   intel_vrr_vmin_vblank_start_live(crtc_state));
>   }
>   
>   static
