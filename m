Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BF1606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rjo561gQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=O0GoQCo5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE1C10E7A7;
	Mon, 23 Nov 2026 10:42:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B2E10E7A7
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Nov 2026 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795430548; x=1826966548;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wfQ4QNCe30r2snyRWARtI7e2SMN0KF0wzaBMg60l06I=;
 b=Rjo561gQKdwZ1375S1p4oi7P7aMk/TPVhUOciU8+thW/1UISJ30GOmDG
 0NMYL4HiRre6uxEZAN7sXL5rZWj3fzr6gvIrU06T7Y+FSC9TWWpVdpNnm
 6ExRQe9viBXt6YEC0yNlu12//sN71oEPQJAj5/uIAH/DSmSyXeeq1Ocz2
 9AXp3C04PoXvVWcoIHJjqj56zCY9T8qkDHOV+zYv6gjKh5d0xXlUDbj6+
 Ip1JIoS8MXx/PxgAagFdJFvdIKKHxYYQS8oHUr8mXml35q3g9tCzLdlHw
 MIzpgRSD+MbkaW8aT0bKdGEu4n8ydCEX7DjEKtzTFJ2BuzjtFT7D0RwDm g==;
X-CSE-ConnectionGUID: rQF55VA6TMG5IXkSCQ54lw==
X-CSE-MsgGUID: RzYikh7wRA+Hu6YmyuRgdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4231383"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4231383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:42:27 -0800
X-CSE-ConnectionGUID: aXoR3WMMRCSE8nueRluqHg==
X-CSE-MsgGUID: Rd9U5p/6RKyIeEH0lvlfwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11143367"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:42:27 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:42:26 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:42:26 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.51)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:42:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqZ4rGppLKTVh7u7fSMXn7I0UZNkcBB93mh/zGEYkulqsOm4dd8krzZsw60c2BaFzxOcoCmdKBFBt22H9WruxJSYIKf5n7kYPMvbElWnAD0ia81rDO0hqj4+uwbFaLIsyUszrtVR1447Etur+5Cm8lt7c9rr2BtOE1Plo6EacmnXA4aC5vR9RJViqGuZzdz9dfNwmBkBslGLdekUHjMAcU/t1tLo0rjkCJB6+LDBaeKJsB/57GZT/cO53V14g8v5Du9IVpK1heU4ApoMHvMeZbNc7AGcIb7P9jQheNE9abJ52eyG9ix83jZFD3sn25bTMNWSqNZvMyU9GMY/oVe6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rP6PkSI8JoDWASi/HrD+Ep8EaSO5+7kKizfGf2m0Qs=;
 b=CqDJB/LMARODxhJTyWbYlJEEWIZqZiXjYWzkPS3m5OqaHCocFjzKQFVPq6w23KIP6ml6CPElmgyzKzXGRMr1eVxxsZHq2sk93z0sf729PnzlCj/bi9TzI4gPmSPzx9CgrWCmiF+SQJEipL/PCrYY7RH/U/PEE6bOabHYKd+fihjkdiPzlpw1+JvPzZJRuSPghzkT/46Vn1FrhUTimqoqDkUYUbEOZAlxYxIMMYHr5gnH+vTRmdwBoAnOEcs2JbEgLmmluZglzUxb5ocYL4b5CRB2BVn3hg1j4084RyGcAu3URLANGOTAX4MKPQE3xFDqff+XI4UvIVsb1Sy9eV0gsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rP6PkSI8JoDWASi/HrD+Ep8EaSO5+7kKizfGf2m0Qs=;
 b=O0GoQCo5HV8fFePkNSptPPLkyUbm8Nbl/nj/MsSJTpnGnFmxE5JXKwrpc1Yw1la4S5yFGdZ60VONdWAIBCuoTeUUJvFhgxoj5M87SBo726U4uCs3oePIVm2TnvnxwkvrmwJ2W07CMq7EZIqf+7oDVNfGPXEyLjYdRwD3u27pdmA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:42:24 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 10:42:24 +0000
Message-ID: <429660af-db1d-4593-a5a1-54066cf85b3a@intel.com>
Date: Mon, 23 Nov 2026 16:12:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/pf: Extract VFs enabling revert helper
To: <intel-xe@lists.freedesktop.org>
References: <20261123094607.3300722-1-piotr.piorkowski@intel.com>
 <20261123094607.3300722-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261123094607.3300722-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0039.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::16) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|IA1PR11MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 9173f86e-9f86-46a6-1b65-08df494e75ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261026121527099003|261026140227099003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ud1HsrD1tQUqFos4ruyVM04riIQpzUe00+/dp1jLe/juHAM02ib/NGdVCOLomdLHDX/p1DICf0ZEpsn6cyAJf8AZR7Q7fvhRk8wspD3M2x3TyMJ5rW9TUE6dZOLox6kwi/AwtF5ds2jxk5IyHheiDO6iUSC/uhSGmiq0IQvInE/D8qC5eRvv+CYF6TGsElUCEDuzBcs4TkCPWpybWQglNv1zKhEP8mg1IytlHru0Hq7kEHmmttKk/07uW0JC4ZpKHmvKzxbn2hg0+JaMqhQnK9Em5XhrZMh0Y3TgN1KaKOikJU6VQcYBML7bOWvDKHm/OV/TZNXbQ9SsgjbsuUhdfXNXflKfDAViPrYwmtC2sggj008vkolX2br3sHsL6h51Bg+Ko+a1W/fYPJ/yvzNNczLJjwE6+sNirQHRLZF0BQQhyxxYu7BqXJFI6miQcPkhhtxPeg/IilVSf5A7IdWsl6oJURnlB43SY8AkB+OAFcMfJicPgQmWkVJe3ehYKMHt+geIdizd2Pf15ArfJz4SohkOsh+sr/Xx4cCDxj7b5jEMMO2G855dF1iPMna5ZcxqVDmhMnB5SO24akG61GzrIixbcrL5Mg4u07QzHjvmJibNqrDqgsiskrzUHuANnSaHUAB2U9x0i/O9ixxnkiUhLcFfMPi60HSAgGk8u9a84FE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHNCRjA2Y05PeUpnY28yM2FOVXFYaXRHcEtoR0Y2czl1V2Q5ZHZuZGUzK1VF?=
 =?utf-8?B?a1lGYlRvM3REMFEranU5T2dJN0pHMXY4b1NjQ1pGMGQrTGlheEx2OEh3OUo5?=
 =?utf-8?B?cGsrSFBncjJXSHRrWWlsOGVkV0hPOHBKSjRSLy9ZNDZOdjhlWFRUQ2U2azRW?=
 =?utf-8?B?dHR3cm94YVA3NEwxUFRDakF1K2dsZGNiMGVNdWZQR004dGZUMEFWSmRIK3Nt?=
 =?utf-8?B?NFgvTTMralNhT2wwOXM1OTl2NlN6UnFHcmtja2wrWldIVmtSNDVLRUl6UGhH?=
 =?utf-8?B?aGRNMTd4QnE2OGJaSTRIbXpyM3c0M3pxTU1wb2NBR0VISThqaml0aU9KTGxw?=
 =?utf-8?B?S0ZmbWROczVTcmdBaTErbWRQZmNLRGIzN0hzQ2dsOWI0Slh3d2QvRHJOWWNk?=
 =?utf-8?B?S3ZBd2dTbythcGFkUkZrZUhpSGJXTHBEQmJXbmtBcCtGMm9uYzh0ZVpCdkI3?=
 =?utf-8?B?RHlNK1g5NGFMU29GSEZrVlNuU0wwSkorbE5RTmN5THpNWWRPL2NxL0gzTWUx?=
 =?utf-8?B?M1VhR2NmYTBPUUtxcVNUVUFONzVUR0YrTEQwUmdRYzBhRHMrQmJrem80WGQz?=
 =?utf-8?B?My9ZM21ITW11UXJCZHhIelRvUUtjNWxlelkyUzB2RW8wcEVQVFE2T3ZwQ3NY?=
 =?utf-8?B?cHk3d2pHcHRMLzY4dFdYTThNclFROW41VmhWL2RoMkFSVDNwZnFIZzlHcjFZ?=
 =?utf-8?B?Z1VrQVRZaC9xem1KaGR4MUc3azlrOElYNFRuaFdxMnZLS09UbmVwZ1NLZkkv?=
 =?utf-8?B?SWlvKzlmYjBPMnJGZ3EyeEoyMGVpZ2gvYTh6ZFdTYmNKNmhRWW1mZU1WV0NP?=
 =?utf-8?B?TE1iNXNzSEs4Q1FwZTY1bVlvZlU5UFNua3NTcFpseTNsQzZCMlJGU1FRblFz?=
 =?utf-8?B?WUQ0VDFOUmhaRlBvTCtJUFlTTmZZSTFYeUZ6Kys0ZmY2RHUrWlRzdkcveGRn?=
 =?utf-8?B?MitkYUlXQWw1WVhGcURuMkJFVzk4aklNSThSdURNY1piTEJXcnE0MWtzbWJR?=
 =?utf-8?B?UHRsK21KL2ZGWEhNczVSOFRPelJMa0pUK3kvRkZIQldxYTNtend4S1F1TnhI?=
 =?utf-8?B?WlkzQ3V3U0hyS1ZPZEZmU2FiMjI4ZjJvZVVpMjhxQzFxUENwYm5WbmVCb1gv?=
 =?utf-8?B?QzdoRzBJbEFhY1BJS3UvSlluZzB0VTFsNFcvSlljck4zdUZpcE5LckRmRE5G?=
 =?utf-8?B?dzFSWGx2VjhaTFFwWVNnU01OeG5XNW9WWllIdmxWRDB2YWFxNzByMFN3dnp6?=
 =?utf-8?B?aGZFUy9udjdhb1pSQVc2V3gwbENOTU1pYVdhL0IvSlZ3UktEbVk0bksxaU1J?=
 =?utf-8?B?OWI2MENyNVVFM2tqcDVpamYxdkVXdjRYMXk3SnVWdkVkaXpTclNYeUk4Y3B4?=
 =?utf-8?B?REg5dXhMS29hSnNIOUhYejNwRlZheDdFM0VYbC9oYlEvTnpXcVg3RzZZeTFu?=
 =?utf-8?B?ZmoyTHNTZkVVRVJ3K3puTlE3U0RSN2lCYjhmek9rTnNieGF0VllsaFhSTVcw?=
 =?utf-8?B?VGVnR1FCREc3SnA1elp1M3EyV24reWU4ZVVnbFNvdWJ2WEhHKzl2UDRWSzd1?=
 =?utf-8?B?L2ZxR1NLbXhreXRvdkNyVDlDK3V1aXllRWdLaHJWVmNEQ2tkMDRoT1RxV3RI?=
 =?utf-8?B?WWdRUTc1d1UyUDdJVUE1R2U3eTlXQ280VDluRThJcERWZkgvKytZK0ltODQy?=
 =?utf-8?B?SnlTZTZSTkxyUkpodDRYbmpGaWJuellkVTkyNmlVVWtYR2lpaWgzdFJBNm9w?=
 =?utf-8?B?WE1ZTUxXVE5rSFlqR2U2N3c1T1ZyeU9yZ296VGV2bGNYOE1XWmtyd2ROS2xV?=
 =?utf-8?B?U2IzRkFPMi9DK2l3L0VkRVhEQVBNM0xEdDRaSjRCeHROYmk1WHBKVTNKRmZF?=
 =?utf-8?B?YzBYOUdYMkJ3cC9zSEluSUR0VVVQNWZMc1EvaG9UUUlRU0lnQTU1YlBqMk50?=
 =?utf-8?B?MExjTnphdEdmSi9zME1kNkt4TEV2VHlYc3QwM0U3OHFxUUxQMW1TQ3VjVDN5?=
 =?utf-8?B?cEhVb25LTmZTaFo3allMcUJ5Wk1rWDNwYzdxK3htSnU0RXFQMzBHL3VNTFBM?=
 =?utf-8?B?b1YvMXNUYnZBSW1yc1drUlpWQmpmWkhLaHY4N3JLT3B1Zy8rTlZFNWV2aVpJ?=
 =?utf-8?B?a3VCc3ZvRk9CdlY1VEJFNG1LZENiUml3SDhrYk9UeDlyK3BTT2FBQzI3S2lZ?=
 =?utf-8?B?VFR0UzVYQW1zR3dDR3dKbGVKcVJaakhLYWpyQmtMVGYxMnFZdURINTBERUZZ?=
 =?utf-8?B?WnRzK0ZsL25ZS0JaV2VndmNKdytaYm5QUHQ1QVR1K05CMFBmdjRYbHhTN082?=
 =?utf-8?B?REtJZ3ViQ3dFcGQyN3Qzeis5UTAzemFqVzMrR1BlbmcrSDh4UCt5V0Iwbllk?=
 =?utf-8?Q?aGfuMFVJsjMK5uyo=3D?=
X-Exchange-RoutingPolicyChecked: LbbbsXDDgG+k1tdlEZvq1xuVswsk98MCjOpqAvxwidK+h26LbEkzlTuM9o33iYc0JMWwoSoTn/X0fKpNBRLdlorqtfKRqZ1VaqbUk0lvgv7aPCuClHDGatfRBzUyvH6w9z+XviZZv2+2FPA14xxx85VwQI1tYXYe3FBXFxmSIRctHK7/wAD3ZYlj8cloFBEAyV986Mep4vb+YcTgE7qfrctgB9bItZSwcoLbZSPNTYMzGePMdG0K8qvrIlgArO2TZUqXneyblYGOiPCrl5Sgc5bNqcr/0qr4IEshQQO1RgeExDfHxsXYfJ8OPvTUu9qRyA9AHt8rAVspZN3pjp2FKQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9173f86e-9f86-46a6-1b65-08df494e75ce
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:42:24.6199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zi1OnY+lFz6GWKzwgdM3WPKYl6+583B9DuCN8Iy0EhwgolgJXcuUAkNA0dfM1M3fVBhF+0m7rvrtJrfTJn3SGVpnff8ibWyBfU0JO2afCWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6396
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


On 23-Nov-26 3:16 PM, Piórkowski, Piotr wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> Both the error path of the pf_enable_vfs() and the pf_disable_vfs()
> are releasing the same set of resources acquired during VFs enabling:
> VF VRAM BAR size, VFs provisioning, extra runtime PM reference and
> the VFs enabling guard. Extract this common code into a helper.
>
> Note that in pf_disable_vfs() the VF VRAM BAR will now be resized
> back after the PF reprovisioning and VFs reset, but since at this
> point the VFs are already disabled, this should not matter.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 31abcee55211..6c839eff0db8 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -125,6 +125,18 @@ static void pf_finish_vfs_enabling(struct xe_device *xe)
>   	xe_sriov_pf_disarm_guard(xe, &xe->sriov.pf.guard_vfs_enabling, false, NULL);
>   }
>   
> +static void pf_enable_vfs_revert(struct xe_device *xe, int num_vfs)
> +{
> +	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> +
> +	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> +
> +	/* Release additional PM reference obtained in pf_enable_vfs() */
> +	xe_pm_runtime_put(xe);
> +
> +	pf_finish_vfs_enabling(xe);
> +}
> +
>   static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> @@ -151,7 +163,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	 * With PF being in D0 state, all VFs will also behave as in D0 state.
>   	 * This will also keep GuC alive with all VFs' configurations.
>   	 *
> -	 * We will release this additional PM reference in pf_disable_vfs().
> +	 * We will release this additional PM reference in pf_enable_vfs_revert().
>   	 */
>   	xe_pm_runtime_get_noresume(xe);
>   
> @@ -177,10 +189,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   	return num_vfs;
>   
>   failed:
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -	xe_pm_runtime_put(xe);
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe, num_vfs);
>   out:
>   	xe_sriov_notice(xe, "Failed to enable %u VF%s (%pe)\n",
>   			num_vfs, str_plural(num_vfs), ERR_PTR(err));
> @@ -205,18 +214,11 @@ static int pf_disable_vfs(struct xe_device *xe)
>   
>   	pci_disable_sriov(pdev);
>   
> -	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> -
>   	xe_sriov_pf_reprovision_default(xe);
>   
>   	pf_reset_vfs(xe, num_vfs);
>   
> -	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
> -
> -	/* not needed anymore - see pf_enable_vfs() */
> -	xe_pm_runtime_put(xe);
> -
> -	pf_finish_vfs_enabling(xe);
> +	pf_enable_vfs_revert(xe, num_vfs);

This new function name looks good when reverting in the error case while 
enabling VFs, but does not sound good while disabling VFs.

How about using pf_clean_vfs() which can be safely used for both cases?

-Satya.

>   
>   	xe_sriov_info(xe, "Disabled %u VF%s\n", num_vfs, str_plural(num_vfs));
>   	return 0;
