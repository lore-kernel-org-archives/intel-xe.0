Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F111E606A321
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 04:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oHvWVuBl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30AC10E05F;
	Wed, 11 Nov 2026 04:50:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3610E05F
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 04:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794372649; x=1825908649;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LDiqPGdMCjVKGKs4OY9+U1SOZ0oulg0uWYBa7H+/vN4=;
 b=oHvWVuBloWAOqTtN4hsw9ofLkXVJhhEsyKtNjjhY67/oE0HQf7AiWIEv
 gOmwqShMRkmnr7bJBHshHTLoWEWb541rFmhMoQOSoJIYx8tzDpjG/7DMg
 KsJhX537r6c2iT/eiknyQWU6f3foDTwC23U9GX0sOzj81feeKJA7aDjc6
 hkOooDBI6gC3d3d993VXs9hn3DwsH21ov3fRzr6RPpmD3F8HkIxG6I/c7
 +uwkRMO2dFAFFQE7eBMDW3nljbekUeoJlJiKT6gxO4c3q4b1mijk0gVcW
 rFu1mhMCSE4pPuxQ1V5uSnqJy1zkQjxoQHoDCDNYRpt6yvNb4hzv26fwO w==;
X-CSE-ConnectionGUID: Zh8FAYTrSseKuVgTg+q1kw==
X-CSE-MsgGUID: xNOesLbSRgSUT6SF39H5DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3143683"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3143683"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:50:49 -0800
X-CSE-ConnectionGUID: z8ZNMDt5SWCTfWKJngsVdg==
X-CSE-MsgGUID: VcDIa8OkSKadzbZ6oaCDEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8658237"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 20:50:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:50:48 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 20:50:48 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 20:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnaqTwo39dGc5agToOfOYt6P/yJpGzONEpcsc4UYNye1DUjagCA1r66xOabg+8hfUXI0AippH+8buC2+N29JmdSQODb6+MktZVNHBI1Cfc0QpYrCQmwsB2ZzsrXu6RdPQ5WHoKOWubjqWz65bZjrFNkydtOGYoGkvTglE/fVpSXAoXQOjD19NiG+sIyji/s4LEtX238XuJz+6CpRe4nPvcL/FHDPN1FOCtjyRhUyzlmJXSVD4uLzKwvmeZLMUQbwXuUJ8n4eySrvtGKomwUXBjGo6+GiH1oSFZAMuPq0nBYw5+f+5yTztlyg1sY/JdA7h3WepmjGkNNW+tcQRnSYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtUT6+XVqww3cnMgyPqpnz0LY2g6YD6F5QuIKTLa97s=;
 b=uA2k3RRq/BSYGRPiiFK+FYZ+ybVATF27yWHvK48pjr4jf7oXKhrX0fSns9dK4G2qMiCYqVmHjpOcfkcKIuOvyrcjXzq7wf/2EfW3wqNrIbEDI7QYuZFDnCKh5GhJ50obcHmvdTtJ0oTP5jBqhbGdQ8EizClZ/74/hITcZvztmK8FRh5ObhRSXSNBYLXaQPNsSU7SMb+XuIg0sTalN6qs8MvK7723nvFiO/FfcWxtJ2Sw1q4BMKv2nWvZs98tUUOQVLv+vIGqGpxl0b6TeX1w0MOXGfdoABlp7ItLVunQqE/Utm2XqzcFA5JrW20CXdyts/briG5Z8o8UrOrqTaQNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS6PR11MB284137.namprd11.prod.outlook.com (2603:10b6:8:52b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 04:50:45 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 04:50:44 +0000
Message-ID: <96da18e4-31a7-4a0b-8989-0b30e04a5c8f@intel.com>
Date: Wed, 11 Nov 2026 10:20:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] drm/xe: Add support for wa_14028434957
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-17-riana.tauro@intel.com>
 <avMZtuz1RZ0NR9Qb@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avMZtuz1RZ0NR9Qb@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS6PR11MB284137:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c06780-75ea-4c7c-3322-08df3faf5855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|10067099003|261026121527099003|260925021911599003|260925021311599003|260925022911599003|11063799006|261026140227099003|56012099006|261102123227099003|261022113327099003|261009221727099003|261009220027099003|261009223027099003|261022075727099003|261009223327099003|261021123027099003|261028144727099003|261022105027099003|261021121427099003|261009221227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: Jh6KLNEzJS7/EJE2tI3+VUC8Da1gISlyFwPIjwEJaOm0Vws1zuErbJXOLumaP9c4vw/2baPQzokXDP5Ic/mGTDJBx0ecph5vHIZ+hjmgztOpY0Tze2vAGDp+/LXNKkABZiEA+6HK4P/263/RUeZPaDqNfPphVTM1bqP1ZIk+fPgkT0AAo/t7s0N1ruK/n/mVFXntq+QUNIEsQjAHBRakHGcLTvvaQWHsUGxlXpzSLUyrkFs4JcGzr5ho7WOESn9+J42e2lUlhWmf1NfmLQNxsDrszdDApYE/1IDKJcp5hDcJ/6pta0ea4sgfncDIhW4ezzqpTnHnU0TUSyFgbFKHC9imWbKfcMhkMxIwwtLafCwvTAEcTvmfLLwCXLYtWo6aXEJQf/Ke363A144EBpELnJmCKu+8xIL/X5uEAsYQWX6XreDr2ToJSFGn6VLEdvMERi1+1OVnKGlJvLPIHrwhDTd+p7RKPE/oZYGWniAuawhDrEH6VmLz9Z0UxrzoUDfcxw0vyV+hmfKQ9rc5PNbL5jhqUaOFmiN7/V4ZWq3QML/dNJoDOx7+8M9MBDq7HjIVZTcQT0cHfJ2lMELl8GE8/HTx5TkcGpT6v4CqRWJx1A8TG6OA9bub4A6y4whN0UsKxeA2qd2gpNzQNRr2ZUV0dPQyiWpTYiN5ZGOPDe9PjOQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(10067099003)(261026121527099003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(261026140227099003)(56012099006)(261102123227099003)(261022113327099003)(261009221727099003)(261009220027099003)(261009223027099003)(261022075727099003)(261009223327099003)(261021123027099003)(261028144727099003)(261022105027099003)(261021121427099003)(261009221227099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1B3bXZnd0J3Qkh3aHh3OWcvQmwxbVRJZ3Y1K2lYeEdhUnJNMDhqRVZ6TURt?=
 =?utf-8?B?a2d2eVNKM08rMlpvQW8reDBmRG14cVNOaGhlaEp5SXlMMnU2WHZSTXMxRXpM?=
 =?utf-8?B?Ti9WV3U4SDdQbzl3OUZEVE5sMXBOWXA2TmZxVXljakRXeXdPcWdSV2lPbXRn?=
 =?utf-8?B?eHI2UlNJSDVrdmU4clFjUkpZNm54Q2FURjVvOW8ySHNmL2E2KzJLTlhKZVhT?=
 =?utf-8?B?Qk1rMlZTMUY4TDJERVFuLzNwMWZ5MTl5VURSaW10Qit0ZDBKTXNjYm5VcDNr?=
 =?utf-8?B?djd3UTBSeGNaZnA4d1ZpU014UURSbEU0akdaOHNRdkd4YUJ2WnlYbUdoa1VJ?=
 =?utf-8?B?WFhKT0xpMHBJZDhVdkU0blRkVHJhdGV2bEx0dXBLQThFZEJBZHJ4ZnR4aDFT?=
 =?utf-8?B?YVh3VjF6Q1pIeTBZMDgxbS95dFhuazQ4MGpwbDlVbVNrQWtiMUppNG93SUxj?=
 =?utf-8?B?QVEydlloWk0zN0toZlhxcm11SitSdWgxYVR2Zi9JcWRYZG1HSktERkwyL2lX?=
 =?utf-8?B?RGhQUjlNZWxaTmQ1Q0Qvam5DRDc1S24zVGI0VVdTb0hFZnVGL05BeUVUb25z?=
 =?utf-8?B?Z0RmNUhXTHh2dGpzNjNnOU5HaWpZREkyZkgxcVpYM0xhK0ZObDR0aWRMS1Jm?=
 =?utf-8?B?YUJuMmFUdEl2SUZxZW9PQ0FBQmtoM3AvTGlxUW1NQ2NqeDVoT3crWWxXaFk3?=
 =?utf-8?B?K1dzVyttN3dtMmh3b25ZL2xCZ09PeWx4VDlsczRyMEg5WTZJOXl6Lys0bVV1?=
 =?utf-8?B?eHlYdjhJcXdSTmVJUzZHSTlZMXU3Yld2SWVVVmJ5RnQvT2p4eUFqUnRmdDlR?=
 =?utf-8?B?OHhHMWc2ZHJwUHM2NDEyT09YVEpycWZRcUtCRTg0dmoxMjRsN1FqOWsrYUVy?=
 =?utf-8?B?ejJRZUY4RnF6bHBwZjBCcDFYMHB4NlkwTlNienBpUzMrN2JlWHYrQ1RIdDk0?=
 =?utf-8?B?OHFXQWF6WmEwVi9Wd3h0NTFOTmYwY0hWK0RlVnFYWkFxUWltZU42WkRxV2N6?=
 =?utf-8?B?YzNwbUg2Rm9GdktwM1N6UTJ6L1JUNnZxNFpOL2lJU241SmNwMjZVaGxYelgv?=
 =?utf-8?B?Mzl0bHZvRk1XcDlVZy9QMVpuM3VpQnZnMTZSNVNkdWVYdHJqci9XYW9VbFly?=
 =?utf-8?B?NkwvekpmVmVPcUNtcUVlSUtnSy9zK1o5d0NveEUxZjhOb2d2VDMxakc3eHR2?=
 =?utf-8?B?cnhYeUo3LzNucHFhOXZEeW1CMER5TTJRZVkrSThyOTIzME95eWpxSG80TjRp?=
 =?utf-8?B?NitmOUk1c1NwU3dQOVkyK0twNUg4anlqNnpVVE9iR0tiajI2NzRrWmoySXYv?=
 =?utf-8?B?VW1sVmphMnlQMmFSVHQrd0dmeTNtYm9iSExXM3JtRHdHcEhHeXJ3ZENwUTdi?=
 =?utf-8?B?RTdEQnhQV2lFaWt3NDhDQ1dTdTZhL2Rha2lNbGVHMFJRZGx4ODIvTWZJank4?=
 =?utf-8?B?QXZua3VsUVczT0c1MVFwZkc2Yy9rb2U2Qm5vT3FubEFjbnNvWmdDYXhLTFZ6?=
 =?utf-8?B?QithdjdGMlFidVYrUi9Pa0N6bHoxN1prR1p4VHp3R0xBMVVqVUxEbjg5Zklq?=
 =?utf-8?B?U0RIdzFDREJQQmdENlVKU05QWU5sR0lKQzczbEhsUGNkOUxKaEw1RngvZm1D?=
 =?utf-8?B?ZWgwYmNPeEc3MU5xdzZ3c2YyMUREckFHejdEcHhuYnNmS3ArK3hmQmhleVJS?=
 =?utf-8?B?amk1TXZjU0h1bU1FMWxTVEFQeTlCSnUwYXh5WkVxSUZnbEVxQzFoZEJZNzcx?=
 =?utf-8?B?V1kzTDZBNkFDMmxHdEtIR1BLTndGVmk2NkFRbXRzQkFVRlc0dXNZV01sVk1z?=
 =?utf-8?B?TUZ6OCtHd1Jxb1U5S3ZMZk85c0dVR2RXdXlyMlFyeDc0Zi8wSnpuajk5dktJ?=
 =?utf-8?B?NEVWVFJOUjNLRlFNcE5RM1hDQWE3NUpRekZwdWhCc2x1cysxWnJrMUF6RGw2?=
 =?utf-8?B?VllORXczWndOVzRsVjU2L0pPSUJDeFBFVy80Zm5IWTQ1Z2FIMWQxZ3VUb3Vy?=
 =?utf-8?B?dUZpTFM2cXdzT0YzZWg3a1dYZVJ4L1RYMEp2a1Uybm11RmprbzJWTWd3eTNM?=
 =?utf-8?B?L3VaR1R0ems3b21YMEVYSVdMK1BweWFvMDdPeCtQTVhPSXR0dFhUWVhTcGdi?=
 =?utf-8?B?TEUyRkhaZTNnTXRUbXZTUUdVVy9jUVpsZmVFUzdrczR4ajRuaG9ZcVA3OTJ2?=
 =?utf-8?B?T2J2QTN5V1pKMWxzVlhrZktxWUN3b2dNNGJJdHJibG4wSDlDSzRIbW9ONjNZ?=
 =?utf-8?B?bldyaEQ4UGdVQ0JkSTFYMFhvRUFtQjdoYktjbmV3eEV2ZTl4c3hUeFhZOEw4?=
 =?utf-8?B?TzhlT2NSa2srcGN3VjA4MVEyWDNwUDdFYmNOMVUydWloWlhWcXFxUT09?=
X-Exchange-RoutingPolicyChecked: IOi3QqEP9d7nU3Dxs6BYkDlRqBbKEu3gFyOFz38wTJOnsrFHCGsvRIiVx6nXM1daZxlebismbXPVdmK+qPaDubEI2EPMaT6wNyCMwzyEIDkuj2lyZWfIvEwcyhS5CDqYO+qgTz0VLxabTIs3ZRQm1B2fi9snueb1+VA5G74Kwny7PGbOcktvcUe3vdqSBXj5BIgWH/HsqEqAeZOaXXfjw+rQNKP5Ssd6SHukWGktFzeRyW2/pKmcmMtDSdcu18Hn/wjDGGp9X/jPxAPhmtX14l05tNzfV9pKdNC2PeCt7Xp68I/H4z6mcabLA+Kdnm7ZgDc4fftvtRCuMK310aXhcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c06780-75ea-4c7c-3322-08df3faf5855
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 04:50:44.7540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtgmGsNjEEjqN+IVcwiBu6JYQ8zbYlJilWQzyYTDcgz+bYPLFu2jbGdpoGdmCmnd+SxISX6lXqjKZ8zrtX8VSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB284137
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


On 10-11-2026 18:48, Raag Jadav wrote:
> On Fri, Nov 06, 2026 at 12:49:52PM +0530, Riana Tauro wrote:
>> Add support for wa_14028434957 on platform CRI.
>>
>> Non-fatal device errors are reported via a direct IRQ, while fatal
>> device errors are downgraded to non-fatal uncorrectable internal
>> errors and reported via AER.
>>
>> Add support to process and log non-fatal errors routed via the direct
>> IRQ path. Most non-fatal errors require no reset, except double-bit
>> ECC errors affecting a critical BO, for which the device is wedged
>> with a bus reset as the recovery action.
>>
>> For uncorrectable internal errors reported via AER, request a
>> secondary bus reset to recover. To avoid a race between the two
>> paths, if non-fatal error processing is in progress when an
>> uncorrectable internal error occurs, flush and disable the worker
>> to prevent further processing, since a reset is
>> imminent.
>>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: use platform instead of graphics version (Gustavo)
>>      combine patches (Tejas, Mallesh)
>>      remove 1sec delayed worker (Andi)
>>
>> v3: re-order disable hw error worker before wedged check (Sashiko)
>> ---
>>   drivers/gpu/drm/xe/xe_device_wa_oob.rules |  1 +
>>   drivers/gpu/drm/xe/xe_hw_error.c          | 41 +++++++++++++++++++----
>>   drivers/gpu/drm/xe/xe_hw_error.h          |  1 +
>>   drivers/gpu/drm/xe/xe_pci_error.c         | 19 +++++++++--
>>   drivers/gpu/drm/xe/xe_ras.c               | 21 ++++++++++--
>>   5 files changed, 72 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> index 753b2a4a1006..300207596893 100644
>> --- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> @@ -7,3 +7,4 @@
>>   14026746987	PLATFORM(CRESCENTISLAND)
>>   14026779378	PLATFORM(CRESCENTISLAND)
>>   14028586678	PLATFORM(CRESCENTISLAND)
>> +14028434957	PLATFORM(CRESCENTISLAND)
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c b/drivers/gpu/drm/xe/xe_hw_error.c
>> index f7031b341ce0..86b29f282837 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include <linux/bitmap.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "regs/xe_gsc_regs.h"
>>   #include "regs/xe_hw_error_regs.h"
>>   #include "regs/xe_irq_regs.h"
>> @@ -15,7 +17,11 @@
>>   #include "xe_hw_error.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> +#include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>> +#include "xe_wedge.h"
>> +
>>   
>>   #define GT_HW_ERROR_MAX_ERR_BITS		16
>>   #define HEC_UNCORR_FW_ERR_BITS			4
>> @@ -171,7 +177,24 @@ static void hw_error_work(struct work_struct *work)
>>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work);
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   
>> +	/* Skip hw error processing if device is already wedged */
>> +	if (xe_wedged(xe))
> This is a weak check and actually doesn't achieve anything, i.e. the state
> can change immediate after this check :)

Helps if it is already wedged.

>
>> +		return;
>> +
>>   	guard(xe_pm_runtime)(xe);
>> +
>> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>> +		/*
>> +		 * Skip handling if an uncorrectable internal error is reported as
>> +		 * reset is imminent
>> +		 */
>> +		if (xe_ras_is_aer_internal_error(xe))
>> +			return;
>> +
>> +		xe_ras_process_errors(xe);
>> +		return;
>> +	}
>> +
>>   	xe_survivability_mode_runtime_enable(xe);
>>   }
>>   
>> @@ -433,12 +456,12 @@ static void hw_error_source_handler(struct xe_tile *tile, const enum hardware_er
>>   		return;
>>   
>>   	/*
>> -	 * Hardware errors are reported through System Controller on the platforms that
>> -	 * support it, and never routed as direct IRQ to SGUnit. So we should never be
>> -	 * here for those platforms.
>> +	 * Non-fatal errors are routed as a direct IRQ on platforms that support
>> +	 * system controller.
> How the turntables :D
>
> I really hope (and I mean _really_) the required due diligence has been
> done here before opening this can of worms.
>
> Raag

This is a hardware decision not from driver

Riana

>
>>   	 */
>>   	if (xe->info.has_sysctrl) {
>> -		drm_err_ratelimited(&xe->drm, HW_ERR "Invalid error routing\n");
>> +		drm_err_ratelimited(&xe->drm, HW_ERR "Non-fatal %s reported\n", severity_str);
>> +		schedule_work(&tile->hw_error_work);
>>   		return;
>>   	}
>>   
>> @@ -537,7 +560,13 @@ static void process_hw_errors(struct xe_device *xe)
>>   	}
>>   }
>>   
>> -static void hw_error_fini(void *arg)
>> +/**
>> + * xe_hw_error_work_disable - Disable hw error work
>> + * @arg: xe device instance
>> + *
>> + * This function disables work for hardware error handling for all tiles.
>> + */
>> +void xe_hw_error_work_disable(void *arg)
>>   {
>>   	struct xe_device *xe = arg;
>>   	struct xe_tile *tile;
>> @@ -569,5 +598,5 @@ void xe_hw_error_init(struct xe_device *xe)
>>   		INIT_WORK(&tile->hw_error_work, hw_error_work);
>>   
>>   	process_hw_errors(xe);
>> -	devm_add_action_or_reset(xe->drm.dev, hw_error_fini, xe);
>> +	devm_add_action_or_reset(xe->drm.dev, xe_hw_error_work_disable, xe);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h b/drivers/gpu/drm/xe/xe_hw_error.h
>> index 5e3a11424108..c2c0bfa6d9f9 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -12,4 +12,5 @@ struct xe_device;
>>   
>>   void xe_hw_error_irq_handler(struct xe_tile *tile, const u32 master_ctl);
>>   void xe_hw_error_init(struct xe_device *xe);
>> +void xe_hw_error_work_disable(void *arg);
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 472b85d0ccc3..67920751ecf1 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -5,8 +5,11 @@
>>   
>>   #include <linux/pci.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "xe_device.h"
>>   #include "xe_gt.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_log.h"
>>   #include "xe_pci.h"
>>   #include "xe_pcode.h"
>> @@ -14,6 +17,7 @@
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_survivability_mode.h"
>> +#include "xe_wa.h"
>>   #include "xe_wedge.h"
>>   
>>   static void prepare_device_for_reset(struct pci_dev *pdev)
>> @@ -87,12 +91,21 @@ static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_
>>   	if (state == pci_channel_io_perm_failure)
>>   		return PCI_ERS_RESULT_DISCONNECT;
>>   
>> -	/* If the device is already wedged or in survivability mode, do not attempt recovery */
>> -	if (xe_survivability_mode_is_boot_enabled(xe) || xe_wedged(xe))
>> +	/* If the device is already in survivability mode, do not attempt recovery */
>> +	if (xe_survivability_mode_is_boot_enabled(xe))
>>   		return PCI_ERS_RESULT_DISCONNECT;
>>   
>> -	if (is_aer_internal_error(pdev))
>> +	/*
>> +	 * If non-fatal error processing is in progress when uncorrectable internal error occurs,
>> +	 * flush and disable the worker to prevent further processing, as a reset is imminent.
>> +	 */
>> +	if (XE_DEVICE_WA(xe, 14028434957) && is_aer_internal_error(pdev)) {
>>   		xe_ras_set_aer_internal_error(xe);
>> +		xe_hw_error_work_disable(xe);
>> +	}
>> +
>> +	if (xe_wedged(xe))
>> +		return PCI_ERS_RESULT_DISCONNECT;
>>   
>>   	switch (state) {
>>   	case pci_channel_io_normal:
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index 58a0b5fa676d..1809c3c893de 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -5,6 +5,8 @@
>>   
>>   #include <linux/bitfield.h>
>>   
>> +#include <generated/xe_device_wa_oob.h>
>> +
>>   #include "xe_assert.h"
>>   #include "xe_bo.h"
>>   #include "xe_configfs.h"
>> @@ -23,6 +25,7 @@
>>   #include "xe_sysctrl_mailbox.h"
>>   #include "xe_sysctrl_mailbox_types.h"
>>   #include "xe_ttm_vram_mgr.h"
>> +#include "xe_wa.h"
>>   #include "xe_wedge.h"
>>   
>>   /* Any non-null entry marks the page as offlined by firmware */
>> @@ -671,8 +674,15 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>>   			    DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>>   			    "Double-bit ECC error detected at sw address 0x%llx\n",
>>   			    info->sw_address);
>> -		if (ret)
>> +		/*
>> +		 * Double-bit ECC errors are non-fatal errors and are reported via IRQ.
>> +		 * Wedge the device with a bus reset for errors that require SBR to recover.
>> +		 * TODO: Trigger SBR using pci_reset_bus
>> +		 */
>> +		if (ret) {
>> +			xe_wedge_declare(xe, DRM_WEDGE_RECOVERY_BUS_RESET);
>>   			return XE_RAS_RECOVERY_ACTION_RESET;
>> +		}
>>   		break;
>>   	default:
>>   		xe_log_comp(xe, cper_sev, DEVICE_MEMORY, &arr->counter, sizeof(arr->counter),
>> @@ -818,9 +828,16 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>>   		return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   
>>   	BUILD_BUG_ON(BITS_PER_TYPE(sent) < XE_RAS_COMP_MAX);
>> -	/* Default action */
>> +	/* Default action for PCIe bus errors */
>>   	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   
>> +	/*
>> +	 * Device fatal errors are downgraded to non-fatal and reported as an uncorrectable
>> +	 * internal error. Set the default action to reset.
>> +	 */
>> +	if (XE_DEVICE_WA(xe, 14028434957) && xe_ras_is_aer_internal_error(xe))
>> +		final_action = XE_RAS_RECOVERY_ACTION_RESET;
>> +
>>   	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_SOC_ERROR,
>>   				  NULL, 0, &response, sizeof(response));
>>   
>> -- 
>> 2.47.1
>>
