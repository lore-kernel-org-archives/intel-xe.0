Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1809CF8859
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 13:33:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8494A10E0E0;
	Thu, 20 Nov 2025 13:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DxfURw5Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD65D10E0E0
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763645638; x=1795181638;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YRd6C3KNIWshkMBb0xiqmtiE2uT0w6gWZK7W9mwu2/s=;
 b=DxfURw5YieoHMw1IWD6/TAkgF3X9CU9ONlAl0HtSf8q+kYKSJNPNeNi3
 fpp4dC+n5Z+GFFMNwxAoHVgwQC0qEOBJEj3K1jXYKqvjFw+rYKfvvvIsi
 pM5O6qSLRoA10nDL14vnZY/6yhkI6qS2m1A3gXu/qOQ4WNNq2+p80q/It
 WGxywV2M4r/pe9fiBfEdRPc8EONiWqfDuWNQXtM3mNyRO+z4xa6/1Wnp6
 +G52gyUkeKMamzlv5Qu1FuDws2BocpetEQ3z5L9NVCNmuVEcbX1PpW/DQ
 C0MQWqWQ0PfQWNSE11O6dahQv0UhgS95n11kLoJON8Jac+d437c//xkNl Q==;
X-CSE-ConnectionGUID: axAFlLskQnuUeW9IL/in5A==
X-CSE-MsgGUID: woXyn0a7QRGI7Fx5yW9hNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="76394248"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="76394248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:33:58 -0800
X-CSE-ConnectionGUID: TAt5jOGTS/2dmXbdxBlYKA==
X-CSE-MsgGUID: ySjcemyCRM6yONT66sHjVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; d="scan'208";a="214732356"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 05:33:57 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:33:56 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 05:33:56 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.50) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 05:33:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyCGww/P6cy9WqK0gxkDaqn/7d7crtXYDb5ux/BGuXIdhNgQspkKMkpd9norf6zjYfak9STLDBZfVpWju3DjYhq8auje3f10CpexB7FOmPP7k/hEMwxyyoCOgJ5FXHKW9DptGscXSmRwd3es+e/NaZdAUWQ40UQRB3SvlIE2lCiVMMjZ/EVrfneAH0ZM+8SnPHrSL3fNgHJ7kWBu5Icw8GB3DtJv4hWSAQqxYoNbUpcWuTrYUlSkgeBOgMGAuDdUemYQjS4mYHai7TQB1chcN3IpWbHG5v3gqfjym1MX/E8e+L0vxDfxdSneEJ9dy+Id+q5VVr2dGpmKAHluIFTJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CN9+NN40XT4ABhGHgZPALdW4e/x/6WFdWNQOX0/wzhk=;
 b=sWHkuJe2wkCV6iWgzKtCn0HaoKFYZdBclTIk479Gn82BU8AnZW3vpTsurWv6tlc6K6Cxw7N5O0thsBrVZtVEv//l8ez8+E5lwFTPwFRwj/EkPYn+ekjXuIBqe3jmaMTUZ/tP7nRApZz2f6buD3XU/Vec3j4immFmnCrxP2eor0GVlmzQYKengSJurdbAqbcpD+Gf3dw+8PUayNY3R1y2xfz8xdHmmTJx9pKkCNNy+kgCwdGQqV5QYDbnytU2aYCShC5Y1/HuPVoDkO1mcRh4T9y+wwvki17whLG24c90eV33DCD+Pw5snT58/Cy4iykWcTC2xKmPknyS8cgpxEQvlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF5A672BE95.namprd11.prod.outlook.com (2603:10b6:518:1::d22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:33:16 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 13:33:16 +0000
Message-ID: <da02a773-0003-4a74-ab00-1b6bf798ffcf@intel.com>
Date: Thu, 20 Nov 2025 19:03:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] drm/xe/vf: Introduce RESFIX start marker support
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tomasz Lis <tomasz.lis@intel.com>
References: <20251118114116.3429730-1-satyanarayana.k.v.p@intel.com>
 <20251118114116.3429730-3-satyanarayana.k.v.p@intel.com>
 <dfab58cc-2d70-446c-9041-b980e64da10e@intel.com>
 <aR4AhZI4DJe2JJNS@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aR4AhZI4DJe2JJNS@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0096.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::11) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF5A672BE95:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4bae57-954c-4f0e-1f00-08de28395c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dWtxa04zT3JnZzBDUHBPYWE1TjFmRDI0NHp3aUJ3K0VBdUhHejczTFdCaHZQ?=
 =?utf-8?B?blZGb2lQcDhMSExwSmR1blg4cG5iWW52aGQwTnBGWTlPaEIvTkx6NWxHM3ZZ?=
 =?utf-8?B?U0NnRG9pVWxqMW1hOURURnlMTlpJTUxyQXY4Sm5KQk9rSlVMQ3lLNk5EWmNM?=
 =?utf-8?B?TEpQbjJ4QlU3dDdIWE5iU1YrYUVLdDFUTjNPb0xXL204TGUrRDI1RE8rR2Ny?=
 =?utf-8?B?Ykp5RHhPQ2txR3VrZkwrSnRKY0RSbDlPM2NsempIckszZTFET1h0bHhYTHho?=
 =?utf-8?B?Vy83enlmV3V5YmphWHN3V3VvUGxFd0ozdE1jNWYxRzNpTHhROXhES2pSMFdz?=
 =?utf-8?B?anQyNEZYT3dKNXczZjlEcWdGbWxrRS9IVTNBRFp4MjFnQmt6WHBLOUwyZWlF?=
 =?utf-8?B?SHBPd2NkOVdEWGhlRU5RanZ1ZVpyOGZQVjE3K1FTc25ZUC9wRngyek44bHJm?=
 =?utf-8?B?cDZwNnRwVzNkNEcxY0NNRC9qbkhHOUZlRzBOZTUvNExzb2V1MVNyc1haSlpB?=
 =?utf-8?B?QXJDa2tSckJQdTE5TkJneThxSXd5TlNnUmx4QUV6K3RPWDQwNnNMZ1ZYQzht?=
 =?utf-8?B?aHQyajE3TEQ2NjBqVk1xZU1JUGdZbmF0QlBpaEt0VXNmZU8yUVI1Vk02SER6?=
 =?utf-8?B?ODJnVUU0Q2hZblUzbG9tZ3FRZDQ0bWh0SlMvZm4vb2Z2WEpJb2JxTm5EL3Js?=
 =?utf-8?B?OVFOTlJ4RlJUR0g3V1pid1VPVE1ZWkpwVDJEV3MvdkxsNGRiZUV5TnZQeTg5?=
 =?utf-8?B?SnJvL2x6NVBYZWQxeG52cEV4ZllqTHRXaG9xWVppV0VsaUd0VWJVQzREZCsr?=
 =?utf-8?B?RWlIaHI2TFdvOTcxaGFkMG5XU2tDeG0wclBVeXk5Y2ZFdmZ4WFhGb0xjZTh3?=
 =?utf-8?B?bG4zUy9vK0ZZWHh5Qy90SS85UFhKMys3RmRkbThrL0h4dGtGZUdFVW1NRDZr?=
 =?utf-8?B?bmcvZ0ttc2E3V3JVWGpualc0RkpONlA1NTVXcE5HZDgwWlBaNEdFYTBHb040?=
 =?utf-8?B?alkxOUpzZDFJOGJ0NkZQamxkbG1rNkxnbDFsSU1vTlRnKzMwTXF6RGlkK1VL?=
 =?utf-8?B?M1JDYUhsMFU5TmlNTzVjWUFVQUJBUlF4bkhqdCtlUmZqaGlYdGJJdHNqVk9L?=
 =?utf-8?B?RmdKZjFNdFFHdDdZV3JaMFBGd01MZU9aZC9ib0xVejhUNXcvOG5xTWdGeTBm?=
 =?utf-8?B?eWNYRm9qNkY3SGRsTTFHRGI1QnZLV3IrcmVya2Fqck5jYW5sZUFUWHVhSzRT?=
 =?utf-8?B?bko0OWlPOGtXcFN5UXJXdEovQ2RmWWRiZlg3TWR6ZzV0bG5rR0tORjFBOWZr?=
 =?utf-8?B?bU1lYzFTelduOFdJejJsUEQvakFvaU5YREU4UzJqUWdFajNUK2Mzekg1NExx?=
 =?utf-8?B?SEgxYlM4VmU5K2hlbjNtNzFsRHJxRmt6T3gzSk9pbTlOTlhXYkI4RFZ3VVNF?=
 =?utf-8?B?c0pGckhMSndwZlQySGtXTVBCeENNMFhaWElKaGI2ODllaVVHdFFKMVFSQ3RW?=
 =?utf-8?B?TUJ3aG45YVdzbVpTZU1rN0JlMXhUMS9WOWMxU0hFa0hodWtTNWN1c2VLcnA4?=
 =?utf-8?B?cWxhaFVzdWVoR2t5NVRVVzB0NVdYbkxoTVZzWlNrOEE0Z3Nudk9nSjNtU0hR?=
 =?utf-8?B?dmpudXk0NG9vMGFJM2tnSk5GUDIwSE1NbGxPcHJieE16UVpnUEVnTWlyWDVJ?=
 =?utf-8?B?eGEwQ2hDNnUyTjArSks1aW45UURkVmpFSTFFcWc2aC9sRDI2bkRRaXFhajBn?=
 =?utf-8?B?QUhmblVXSWV5MU56RXVIUjBNN1c4RktTWEQ2T0NvbjV2bmF3VWtRZSthRVF5?=
 =?utf-8?B?WWtDM1NuZTNzWFFRWmFFcitpUUR0ZmVTdHQ3Uk1QYzBlTC9DWm13TzgvRFVF?=
 =?utf-8?B?azBXMmNMcTdGL1FtUTcveVJkWUk4ajBsQzZMZlYwQmJWM0JuU2s2dXhSZkUy?=
 =?utf-8?Q?f0V1IQFopjtU3Y3ur9XjHrpAk3pO9s8w?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNUSlNwaEdhcTI2VWFrek1DZ0wzaUxFV1lGTnFmY0lNcnJ5MGpyTGFmUHpZ?=
 =?utf-8?B?dEFLYmlzUWdQMFM0UjhMTWh6TWJQMDhoQVZqV3NnKzQvcU0yemR6REZjWHNE?=
 =?utf-8?B?ZTdqOHYrUWErYmRvRnFuR1N3bkNoMkZRbnlQdnd6ZTJPMlV5YnczaWorU1V4?=
 =?utf-8?B?M25VU0czVTYrTHBXKzkxWE1wbVRLTVFBeEk1NDdGckdqYkNKeWRXVDV6UGs0?=
 =?utf-8?B?OTFYODNIUXk1V3U4akNOcGNjUjNsclJ2SWZCcVlSTEwvNDdRY282V0Q3MjVJ?=
 =?utf-8?B?Q1RWUU04SHdxWEpEMUVWMVozcnlmTm5yNFovNzdsS0VVZnU4cmx3MEFndWpU?=
 =?utf-8?B?M3dUK0R0QWpxTkJSd0Z1cE5oMnQyaW9UY3YzWHNIbWdQUkpmQVF4ZnpkK1dJ?=
 =?utf-8?B?eTRoVmIxeUpzWHpoaTZMM3dNaWRPbzhRQXY0ckJJZGRKdVROUlhyMGV1bHJJ?=
 =?utf-8?B?YXQ1aWpaekwreCttaHJuaUh1YVFYazZjMEI5Ym1PSUNOTTZBYnRPSDIxMHIy?=
 =?utf-8?B?dlQ2eFJGc25KK2hGT0t5WG41cEd0WlJnVUhxeUV6WGJrMVBHamlsY2sxcllj?=
 =?utf-8?B?dXNIYkQ3RGJaaFNLcXVEMFJpamlVbjZWZHhQSWRFT0JmVGNleG5RRVNab3F4?=
 =?utf-8?B?Z3d3aFpabUNmVW03MDk3aEUvdkZYOGw2ZndZMmNvQlA0NEhJaVQxYjEyVGJ0?=
 =?utf-8?B?OUc4V0NNeGZvQXhyN0hyMDZVMllVVDBHZjk0bndUU1ZkNDRRSEdtWTlTc08w?=
 =?utf-8?B?R1hBRXhkVFFtL1BpMjJLUEpUazUyZGlCRHhvVGRaYm43VkdYUmRFRFhxSldz?=
 =?utf-8?B?REtON3Yrc2RicEk1dTVGSVpFa3JNYVFUaHJ6cGVvdU1lQlFveC9HbSsxWW4z?=
 =?utf-8?B?NDg0b2dmV0dsSXkzQ2JDWU5UZEtibjI4Q2o5RTZITnhaL3l5YVFSQUNHV05v?=
 =?utf-8?B?Uy9oOUNhWHRXZWZqR3l3MGd0ZDhtaWdvckN4RWh0MGsrRndLd1F1V1Nrcno4?=
 =?utf-8?B?L3JxcCtJbG5QdTkxK3Urb1IrR1NmcS9PSllla1RUbk40T1VWVXdqYUQrMjBG?=
 =?utf-8?B?Qk1IZ0RvUVNiTnJCZmJnLzJTMkRQQUdiOFM2Q0hzUnpjVmpxTVNmR1ViUEFL?=
 =?utf-8?B?WThSdS9tRTI0TWo0ZytjZmt0Y3A5Mnk2V0lPbU9FSFUyRWxJUmtWNnJBWkVX?=
 =?utf-8?B?WUJ6VjZudHNPS2NLVXQ2bDRscTVSTkplTjF0bDVNL3JBZWx3emVKbEJzYS9V?=
 =?utf-8?B?am1BTjJwSTUwc3ZmQ1B6amJ4Y1FKNUlxWEdLdXNnMGw0YWUyaXg0NnVaa1cx?=
 =?utf-8?B?MHljWTF3TDVsbmNhUng0MnM5dmJsdWIzczIxTGVyVTRqbTlxRnI1RmtMWmth?=
 =?utf-8?B?MG5LaWhSa0NnMjZ5elhZSVpEcVlLUDU0aDFscUlUVFowakJPM0owWEhucFNS?=
 =?utf-8?B?cElhVTQrd1RCOXB2SzRpT2o1bmxoNVdLVHpDN0E5ZUVGZkFpY3BhV3FCZEcx?=
 =?utf-8?B?dkVyMDkyMWR3VEV3VG5SZFpNOG81STd0TlVXdGtEZ3dHZU80ZG5QSnJBenRK?=
 =?utf-8?B?cEtncTZMaFZkaXFOblJOdWhlMzE1UWpIK0JycmZOZTNVajNIQmtOdFlDcUN2?=
 =?utf-8?B?ditVNUVHcGI0ZHJ1RTMxWFd2ZS9qbjl2YjMwMGFra1RLQi9hSGlNN2hvQnNn?=
 =?utf-8?B?NTB2bnhGZlJwV3VNRVRXaE45Tm9kVkg2R1VYWUdRaHRXbVBUTFZWUndWSC9I?=
 =?utf-8?B?ZHpCSkNGc3JUSHgyT0k5TlJsU2VLZnl4VTV1ekhJT2tRcWYwTTgwaDBwN3lW?=
 =?utf-8?B?UmlJTmVsT0tqbGFsZTJ0Z0lDeW0vbmVGbFpza2ozUGRJWHZLNTErbFp5TU9j?=
 =?utf-8?B?ZE53aUpOeTBXb3gwZU1yWnpXZTZ1L3c3U21UT3kwVWZweEh3OE5ER1dzWits?=
 =?utf-8?B?aHF6d3ZPOXY5VmlTWkFUQ2FTQnZXREVpck5FVkpOUmFvSDMzM3ZzMnlRZE1F?=
 =?utf-8?B?R3RNTHU3SU1nTEg0TEI1WE9jMzduN0tqNWsrQ0puaHU2RHhWY3lHdFpXMVp4?=
 =?utf-8?B?enkwdG5seW9WNDh1cFVldUxaZGtKSUI2WmhweE9DZ0xBUkNhK0NuUzRwZGgx?=
 =?utf-8?B?cnJNQmVVR0JkQWdzMlBOT0RydUE5V2JhYzU5cXRhdG90OVAyM0lhdloxV05M?=
 =?utf-8?Q?fqVSScsr6j74DW4AOw+0k/k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4bae57-954c-4f0e-1f00-08de28395c47
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:33:16.1228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GZrz9jdMQp+VVyoVg4LXmlwXgQP6ylj65wCajyj9KnYHpwX8N3HnqNpWa/pOqA012C8esAoIl3/Bk9Fv70gYR7y4mVamHiKa5pFpEo0oj8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5A672BE95
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


On 19-Nov-25 11:08 PM, Matthew Brost wrote:
> On Wed, Nov 19, 2025 at 06:24:45PM +0100, Michal Wajdeczko wrote:
>>
>> On 11/18/2025 12:41 PM, Satyanarayana K V P wrote:
>>> In scenarios involving double migration, the VF KMD may encounter
>>> situations where it is instructed to re-migrate before having the
>>> opportunity to send RESFIX_DONE for the initial migration. This can occur
>>> when the fix-up for the prior migration is still underway, but the VF KMD
>>> is migrated again.
>>>
>>> Consequently, this may lead to the possibility of sending two migration
>>> notifications (i.e., pending fix-up for the first migration and a second
>>> notification for the new migration). Upon receiving the first RES_FIX
>>> notification, the GuC will resume VF submission on the GPU, potentially
>>> resulting in undefined behavior, such as system hangs or crashes.
>>>
>>> To avoid this, post migration, a marker is sent to the GUC prior to the
>>> start of resource fixups to indicate start of resource fixups. The same
>>> marker is sent along with RESFIX_DONE notification so that GUC can avoid
>>> submitting jobs to HW in case of double migration.
>>>
>>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Tomasz Lis <tomasz.lis@intel.com>
>>>
>>> ---
>>> V3 -> V4:
>>> - Updated RESFIX_DONE action name and documenation part. (Michal W)
>>> - Enable resfxi_start marked by default as sav/restore is gated on
>>> Guc version 70.54.0
>>>
>>> V2 -> V3:
>>> - Fixed review comments (Michal W).
>>> - Updated commit message.
>>> - Fixed CI.BAT issues.
>>> - Added helper function to assert on unsupported GUC versions.
>>> - Updated RESFIX_DONE action name and documenation part.
>>>
>>> V1 -> V2:
>>> - Squashed "Enable RESFIX start marker only on supported GUC
>>> versions" commit into a single commit. (Matt B)
>>> ---
>>>   .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    | 60 +++++++++++---
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 80 ++++++++++++++-----
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |  5 ++
>>>   drivers/gpu/drm/xe/xe_sriov_vf.c              | 16 +++-
>>>   4 files changed, 131 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>>> index 0b28659d94e9..1d84ce07b201 100644
>>> --- a/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>>> +++ b/drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h
>>> @@ -502,13 +502,15 @@
>>>   #define VF2GUC_VF_RESET_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>>   
>>>   /**
>>> - * DOC: VF2GUC_NOTIFY_RESFIX_DONE
>>> + * DOC: VF2GUC_RESFIX_DONE
>>>    *
>>> - * This action is used by VF to notify the GuC that the VF KMD has completed
>>> + * This action is used by VF to inform the GuC that the VF KMD has completed
>>>    * post-migration recovery steps.
>> please mention that from 1.27 it shall only be sent after posting RESFIX_START
>> and that both @MARKER fields must match
>>
>>>    *
>>>    * This message must be sent as `MMIO HXG Message`_.
>>>    *
>>> + * Available since GuC VF compatibility 1.27.0.
>> hmm, actually RESFIX_DONE is also available prior 1.27,
>> just a meaning of the DATA0 has changed
>>
>> maybe:
>>
>>      * Updated since GuC VF compatibility 1.27.0.
>>
>>> + *
>>>    *  +---+-------+--------------------------------------------------------------+
>>>    *  |   | Bits  | Description                                                  |
>>>    *  +===+=======+==============================================================+
>>> @@ -516,9 +518,9 @@
>>>    *  |   +-------+--------------------------------------------------------------+
>>>    *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>>>    *  |   +-------+--------------------------------------------------------------+
>>> - *  |   | 27:16 | DATA0 = MBZ                                                  |
>>> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
>> and then we can keep legacy definition for the record:
>>
>>      *  |   +-------+--------------------------------------------------------------+
>>    - *  |   | 27:16 | DATA0 = MBZ                                                  |
>>    + *  |   | 27:16 | DATA0 = MARKER = MBZ (only prior 1.27.0)                     |
>>      *  |   +-------+--------------------------------------------------------------+
>>    + *  |   | 27:16 | DATA0 = MARKER - can't be zero (1.27.0+)                     |
>>    + *  |   +-------+--------------------------------------------------------------+
>>
>>
>>>    *  |   +-------+--------------------------------------------------------------+
>>> - *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE` = 0x5508    |
>>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_DONE` = 0x5508           |
>>>    *  +---+-------+--------------------------------------------------------------+
>>>    *
>>>    *  +---+-------+--------------------------------------------------------------+
>>> @@ -531,13 +533,13 @@
>>>    *  |   |  27:0 | DATA0 = MBZ                                                  |
>>>    *  +---+-------+--------------------------------------------------------------+
>>>    */
>>> -#define GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE		0x5508u
>>> +#define GUC_ACTION_VF2GUC_RESFIX_DONE			0x5508u
>>>   
>>> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_LEN	GUC_HXG_REQUEST_MSG_MIN_LEN
>>> -#define VF2GUC_NOTIFY_RESFIX_DONE_REQUEST_MSG_0_MBZ	GUC_HXG_REQUEST_MSG_0_DATA0
>>> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
>>> +#define VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER		GUC_HXG_REQUEST_MSG_0_DATA0
>>>   
>>> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_LEN	GUC_HXG_RESPONSE_MSG_MIN_LEN
>>> -#define VF2GUC_NOTIFY_RESFIX_DONE_RESPONSE_MSG_0_MBZ	GUC_HXG_RESPONSE_MSG_0_DATA0
>>> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>> +#define VF2GUC_RESFIX_DONE_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>>   
>>>   /**
>>>    * DOC: VF2GUC_QUERY_SINGLE_KLV
>>> @@ -656,4 +658,44 @@
>>>   #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>>   #define PF2GUC_SAVE_RESTORE_VF_RESPONSE_MSG_0_USED	GUC_HXG_RESPONSE_MSG_0_DATA0
>>>   
>>> +/**
>>> + * DOC: VF2GUC_RESFIX_START
>>> + *
>>> + * This action is used by VF to inform the GuC that the VF KMD will be starting
>>> + * post-migration recovery fixups.
>> please mention that @MARKER sent here must later match the MARKER posted in the
>> VF2GUC_RESFIX_DONE_ message
>>
>>> + *
>>> + * This message must be sent as `MMIO HXG Message`_.
>>> + *
>>> + * Available since GuC VF compatibility 1.27.0.
>>> + *
>>> + *  +---+-------+--------------------------------------------------------------+
>>> + *  |   | Bits  | Description                                                  |
>>> + *  +===+=======+==============================================================+
>>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_HOST_                                |
>>> + *  |   +-------+--------------------------------------------------------------+
>>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_REQUEST_                                 |
>>> + *  |   +-------+--------------------------------------------------------------+
>>> + *  |   | 27:16 | DATA0 = MARKER - can't be zero                               |
>>> + *  |   +-------+--------------------------------------------------------------+
>>> + *  |   |  15:0 | ACTION = _`GUC_ACTION_VF2GUC_RESFIX_START` = 0x550F          |
>>> + *  +---+-------+--------------------------------------------------------------+
>>> + *
>>> + *  +---+-------+--------------------------------------------------------------+
>>> + *  |   | Bits  | Description                                                  |
>>> + *  +===+=======+==============================================================+
>>> + *  | 0 |    31 | ORIGIN = GUC_HXG_ORIGIN_GUC_                                 |
>>> + *  |   +-------+--------------------------------------------------------------+
>>> + *  |   | 30:28 | TYPE = GUC_HXG_TYPE_RESPONSE_SUCCESS_                        |
>>> + *  |   +-------+--------------------------------------------------------------+
>>> + *  |   |  27:0 | DATA0 = MBZ                                                  |
>>> + *  +---+-------+--------------------------------------------------------------+
>>> + */
>>> +#define GUC_ACTION_VF2GUC_RESFIX_START			0x550Fu
>>> +
>>> +#define VF2GUC_RESFIX_START_REQUEST_MSG_LEN		GUC_HXG_REQUEST_MSG_MIN_LEN
>>> +#define VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER	GUC_HXG_REQUEST_MSG_0_DATA0
>>> +
>>> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_LEN		GUC_HXG_RESPONSE_MSG_MIN_LEN
>>> +#define VF2GUC_RESFIX_START_RESPONSE_MSG_0_MBZ		GUC_HXG_RESPONSE_MSG_0_DATA0
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 4c73a077d314..08c00b773a13 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -299,12 +299,13 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>>>   		*found = gt->sriov.vf.guc_version;
>>>   }
>>>   
>>> -static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>> +static int guc_action_vf_notify_resfix_start(struct xe_guc *guc, u16 marker)
>>>   {
>>>   	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>>>   		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>>   		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>>> -		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_NOTIFY_RESFIX_DONE),
>>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_START) |
>>> +		FIELD_PREP(VF2GUC_RESFIX_START_REQUEST_MSG_0_MARKER, marker),
>>>   	};
>>>   	int ret;
>>>   
>>> @@ -313,30 +314,54 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>>   	return ret > 0 ? -EPROTO : ret;
>>>   }
>>>   
>>> -/**
>>> - * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>>> - * @gt: the &xe_gt struct instance linked to target GuC
>>> - *
>>> - * Returns: 0 if the operation completed successfully, or a negative error
>>> - * code otherwise.
>>> - */
>>> -static int vf_notify_resfix_done(struct xe_gt *gt)
>>> +static int vf_notify_resfix_start(struct xe_gt *gt, u16 marker)
>>>   {
>>>   	struct xe_guc *guc = &gt->uc.guc;
>>>   	int err;
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> -	err = guc_action_vf_notify_resfix_done(guc);
>>> +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix start marker %u\n", marker);
>> shouldn't this be xe_gt_sriov_dbg_verbose() instead?
>>
>>> +
>>> +	err = guc_action_vf_notify_resfix_start(guc, marker);
>>>   	if (unlikely(err))
>>> -		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>>> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup start(%pe)\n",
>> add space between "start" and "(%pe)"
>>
>>>   				ERR_PTR(err));
>>> -	else
>>> -		xe_gt_sriov_dbg_verbose(gt, "sent GuC resource fixup done\n");
>>>   
>>>   	return err;
>>>   }
>>>   
>>> +static int guc_action_vf_notify_resfix_done(struct xe_guc *guc, u16 marker)
>>> +{
>>> +	u32 request[GUC_HXG_REQUEST_MSG_MIN_LEN] = {
>>> +		FIELD_PREP(GUC_HXG_MSG_0_ORIGIN, GUC_HXG_ORIGIN_HOST) |
>>> +		FIELD_PREP(GUC_HXG_MSG_0_TYPE, GUC_HXG_TYPE_REQUEST) |
>>> +		FIELD_PREP(GUC_HXG_REQUEST_MSG_0_ACTION, GUC_ACTION_VF2GUC_RESFIX_DONE) |
>>> +		FIELD_PREP(VF2GUC_RESFIX_DONE_REQUEST_MSG_0_MARKER, marker),
>>> +	};
>>> +	int ret;
>>> +
>>> +	ret = xe_guc_mmio_send(guc, request, ARRAY_SIZE(request));
>>> +
>>> +	return ret > 0 ? -EPROTO : ret;
>>> +}
>>> +
>>> +static int vf_notify_resfix_done(struct xe_gt *gt, u16 marker)
>>> +{
>>> +	struct xe_guc *guc = &gt->uc.guc;
>>> +	int err;
>>> +
>>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +
>>> +	xe_gt_sriov_dbg(guc_to_gt(guc), "Sending resfix done marker %u\n", marker);
>> dbg_verbose ?
>>
>>> +
>>> +	err = guc_action_vf_notify_resfix_done(guc, marker);
>>> +	if (unlikely(err))
>>> +		xe_gt_sriov_err(gt, "Failed to notify GuC about resource fixup done (%pe)\n",
>> hmm, it's not only about that _we_ failed, it could be that _GuC_
>> encountered some errors, as there is ERROR_RESFIX_FAILED, so maybe:
>>
>> 	"Recovery failed at GuC FIXUP_DONE step (%pe)"
>>
>>> +				ERR_PTR(err));
>>> +	return err;
>>> +}
>>> +
>>>   static int guc_action_query_single_klv(struct xe_guc *guc, u32 key,
>>>   				       u32 *value, u32 value_len)
>>>   {
>>> @@ -1183,7 +1208,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>>>   	xe_guc_submit_pause_abort(&gt->uc.guc);
>>>   }
>>>   
>>> -static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>>> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt, u16 marker)
>>>   {
>>>   	bool skip_resfix = false;
>>>   
>>> @@ -1206,14 +1231,21 @@ static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>>>   	 */
>>>   	xe_irq_resume(gt_to_xe(gt));
>>>   
>>> -	return vf_notify_resfix_done(gt);
>>> +	return vf_notify_resfix_done(gt, marker);
>>> +}
>>> +
>>> +static u16 vf_post_migration_resfix_start_marker(struct xe_gt *gt)
>>> +{
>>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>> +	return ++gt->sriov.vf.migration.resfix_marker;
>> should we protect that with lock?
>>
> No lock required - this code runs a per-GT ordered workqueue which has
> built in mutual exclusion.
>
>> also see below
>>
>>>   }
>>>   
>>>   static void vf_post_migration_recovery(struct xe_gt *gt)
>>>   {
>>>   	struct xe_device *xe = gt_to_xe(gt);
>>> -	int err;
>>> +	u16 marker;
>>>   	bool retry;
>>> +	int err;
>>>   
>>>   	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>>>   
>>> @@ -1227,13 +1259,25 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>>>   		goto fail;
>>>   	}
>>>   
>>> +	/*
>>> +	 * Increment the startup marker again if it overflows, since GUC
>>> +	 * requires a non-zero marker to be set.
>>> +	 */
>>> +	marker = vf_post_migration_resfix_start_marker(gt);
>>> +	if (!marker)
>>> +		marker = vf_post_migration_resfix_start_marker(gt);
>> this "overflow" logic shall be in vf_post_migration_resfix_start_marker()
>>
> I think I suggested the above as well or at least thought about it.
>
>> OTOH by looking at the expected flow, maybe we don't need to track this
>> marker at all, as it should be sufficient to always pass the same const
>> non-zero value, GuC will just compare it with 0 anyway
>>
>> and we send RESFIX_START/DONE only from within this worker, so we will
>> never have two parallel recovery sequences which would warrant different
>> markers
> Yes, I think a const marker probably works. A marker that moves does
> maybe is better for debug logging though?
>
> Matt

Yes. I do agree to have a different marker which will be useful for 
debugging.

Fixed all other review comments in the new revision.

-Satya.

>>> +
>>> +	err = vf_notify_resfix_start(gt, marker);
>>> +	if (err)
>>> +		goto fail;
>>> +
>>>   	err = vf_post_migration_fixups(gt);
>>>   	if (err)
>>>   		goto fail;
>>>   
>>>   	vf_post_migration_rearm(gt);
>>>   
>>> -	err = vf_post_migration_notify_resfix_done(gt);
>>> +	err = vf_post_migration_notify_resfix_done(gt, marker);
>>>   	if (err && err != -EAGAIN)
>>>   		goto fail;
>>>   
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 420b0e6089de..66c0062a42c6 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -52,6 +52,11 @@ struct xe_gt_sriov_vf_migration {
>>>   	wait_queue_head_t wq;
>>>   	/** @scratch: Scratch memory for VF recovery */
>>>   	void *scratch;
>>> +	/**
>>> +	 * @resfix_marker: Marker sent on start and on end of post-migration
>>> +	 * steps.
>>> +	 */
>>> +	u16 resfix_marker;
>>>   	/** @recovery_teardown: VF post migration recovery is being torn down */
>>>   	bool recovery_teardown;
>>>   	/** @recovery_queued: VF post migration recovery in queued */
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> index b73498097df5..64b2ddabd3f9 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -49,11 +49,13 @@
>>>    *
>>>    * As soon as Virtual GPU of the VM starts, the VF driver within receives
>>>    * the MIGRATED interrupt and schedules post-migration recovery worker.
>>> - * That worker queries GuC for new provisioning (using MMIO communication),
>>> + * That worker sends `VF2GUC_NOTIFY_RESFIX_START` action along with non-zero
>> drop NOTIFY tag and use trailing _ to create a link:
>>
>> 	VF2GUC_RESFIX_START_
>>
>>> + * marker, queries GuC for new provisioning (using MMIO communication),
>>>    * and applies fixups to any non-virtualized resources used by the VF.
>>>    *
>>>    * When the VF driver is ready to continue operation on the newly connected
>>> - * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` which causes it to
>>> + * hardware, it sends `VF2GUC_NOTIFY_RESFIX_DONE` action along with the same
>>> + * marker which was sent with `VF2GUC_NOTIFY_RESFIX_START` which causes it to
>> ditto
>>
>>>    * enter the long awaited `VF_RUNNING` state, and therefore start handling
>>>    * CTB messages and scheduling workloads from the VF::
>>>    *
>>> @@ -102,6 +104,11 @@
>>>    *      |                              [ ]        new VF provisioning  [ ]
>>>    *      |                              [ ]---------------------------> [ ]
>>>    *      |                               |                              [ ]
>>> + *      |                               |   VF2GUC_NOTIFY_RESFIX_START [ ]
>> ditto, drop NOTIFY
>>
>>> + *      |                              [ ] <---------------------------[ ]
>>> + *      |                              [ ]                             [ ]
>>> + *      |                              [ ]                     success [ ]
>>> + *      |                              [ ]---------------------------> [ ]
>>>    *      |                               |       VF driver applies post [ ]
>>>    *      |                               |      migration fixups -------[ ]
>>>    *      |                               |                       |      [ ]
>>> @@ -114,7 +121,10 @@
>>>    *      |                              [ ]------- VF_RUNNING           [ ]
>>>    *      |                              [ ]      |                      [ ]
>>>    *      |                              [ ] <-----                      [ ]
>>> - *      |                              [ ]                     success [ ]
>>> + *      |                              [ ]   success (on marker match) [ ]
>>> + *      |                              [ ]---------------------------> [ ]
>>> + *      |                              [ ]   error (on marker match)   [ ]
>>> + *      |                              [ ] ERROR_RESFIX_MARKER_MISMATCH[ ]
>> this error is about bad programming, not worth mentioning here
>>
>> for the double-migration case, we expect STATUS_VF_MIGRATED instead
>>
>> and in case of error/double migration, VF will not be moved to RUNNING state
>>
>>>    *      |                              [ ]---------------------------> [ ]
>>>    *      |                               |                               |
>>>    *      |                               |                               |
