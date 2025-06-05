Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77B3C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 10:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8210E99B;
	Thu,  5 Jun 2025 10:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJLR4VVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF7A10E99B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749117686; x=1780653686;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X+asJGHAxhISmKP1Qm6sNNR0F/pdg1oCLvXJjw7MXP8=;
 b=GJLR4VVZ/eUk2WyyvK1Qj9z0/o6H+SvG3aFP1NaGiTD7Ii88kFSiqhOl
 V6rY7Vko2U3qxPeQ5JlVOaiyf4bCMdXNrcmHcwbr+GhoSjxV7ymzhwB/i
 YBTqCrx5aKF56ZwqHYS2chXRQVoOKHIjCg8MDvCUS6b73wHBKvuRJP18j
 Z/avKMVED73VmHBIWsRFCyaB/pI5D6uNCWHpjE3+S2O6zNJeVbNwGxIly
 +d+I6Ms+K5t65K/yPkT9fkF4uOcTi04Ykks0Bkn+MrJa+h7oDnpSUBP9s
 NRBndIrJd1aIEEWwN8wSNEXdRJHghbYhYxnA8nUjkeQEa1uWU9hK9o1zD g==;
X-CSE-ConnectionGUID: +uagg4GUQsqT2L0GcCkZTQ==
X-CSE-MsgGUID: bRJzwe8hRP6209avUYuIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="53857878"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="53857878"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:01:15 -0700
X-CSE-ConnectionGUID: aU/W86MFT2eo3WTZGmGf5w==
X-CSE-MsgGUID: t8JcCWXSSYG7SP1eCWcpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145431060"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:01:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 03:01:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 03:01:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.71) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 03:01:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmrQiqaSHLDHPFE2rj+XKwYww9xJ1Cco1QhyMvIAAwVobKl9pGRIJ6DA1ekNnafPa5NpkcR/SbD0ev8/H3oegRMuih9SrYXEjDRQPNizYuaGPES5xVwwpE11x21hVaP/tIwkV6eDyIYeroaIyhVz7DmVoncZrpsbvEKxfQ4oNmqdv6l4PL5+lYuXndxFx3qOp7Ss4qAgR3cRMq2ZVvOBxti+ammu1hmLehNP30QYXkN7TE9DxlG85yVBMqT4rVhrnPmOvMY1H93J8VLVn+IOm3JNVQJMRDD4NKQY0ceSnx1cNqbg99UZam/Mx26EzE+/fCYar8XJUA03FQnrnUvZgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MXIEKc03+EuxlAmvJPIkyf5yTqogGsjkw+JPvBHI4g=;
 b=r9vpg1YCqXQUy7Ua+/Dsi7/U9OBfw2ew9wjHjuyDrkzCp6sA42cE51EiSHTXVIcUtA/dBNydKSxe3RbtPsWg/yz2h3bntENxbrkG0OYEGmydQqrpMhD934DW8X7F4Dp4IBbzV6fe8BSVg3zB5LX8R5fY3GV9mr5SfLrdDB/AB8svzqR9c8I50UhbS+OP4wlmzPiWPCvNkLa+sDRFtT+afUgZCpp5jBCx4RCXHAnoGei9zlr0kxyzA3Qp++ktnU+Hb1mdLstkvPaiB+/1Blmkgp92oNa6eD2j+cmf0zDmFDyZZweteZMYJiqOWjH+68cLwmY+oKBjwKfvrtlJvpZLiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 CY8PR11MB7034.namprd11.prod.outlook.com (2603:10b6:930:52::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.29; Thu, 5 Jun 2025 10:00:43 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Thu, 5 Jun 2025
 10:00:43 +0000
Message-ID: <e88b8e06-e008-4aa2-9f79-799253c8fa75@intel.com>
Date: Thu, 5 Jun 2025 15:30:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Content-Language: en-GB
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <riana.tauro@intel.com>, <jani.nikula@intel.com>
References: <20250603181205.1680363-1-soham.purkait@intel.com>
 <20250603181205.1680363-3-soham.purkait@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250603181205.1680363-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|CY8PR11MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: ed47b7da-8503-4fbc-e362-08dda417d542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aW1mN0lqV0lic0FVa05xeHVmVTF2QVl1VHR2YVNaQ0FVeXExRGF5UDF3NDBz?=
 =?utf-8?B?ajU1akRTcVBCc3dhSlJaYXJQWWcyaFViV044akpwb3NuZ0trUTRjNTFwQmJh?=
 =?utf-8?B?dEFkaXlvYm00SitBam1PWmQ5MjZVV2RrZlFmdXJRYTRGR1h1WVQ3OFptcVFC?=
 =?utf-8?B?MlRYVDZIRzFwMWZQWTZKMUlJYkV6a0U4MGxScWZJVGE0TkdnakdLN0VPZ0to?=
 =?utf-8?B?OHBuNFdHdDBKUzRRSGZXRnpqU3ZJK2JrYzQwUk9Tc0hPbTJ1b05tRW5tS0Er?=
 =?utf-8?B?Z24yTlJKbnZFYVJkckM5emltVFRFL012YUE3UWgzQy9ZMExNMVhLOEh2OW1U?=
 =?utf-8?B?ZjUwWDdvU1l1R25adDYwMkF1ZEpqd2N0LzdSa0wreEpWQWJhWFhVMW04TWtr?=
 =?utf-8?B?V1k0cW5sVTB2L2t4MGNQWmk3MjRSRDhFeXNXTitza0wwYjk5RW1Kam1QZjNo?=
 =?utf-8?B?RGNHVmhyL2w4QSsvcUVGUTZtS0haY2Q4SDN2UGpRYlhVbCttQ0svU3hreEJH?=
 =?utf-8?B?enRUMVFaTCs3Yk9ZNHY3R2gxOXZTaUl6bUtQcWpOTjYwSXZXbU14TDkrWlBX?=
 =?utf-8?B?NklFYnVGZ05HMnRXT0t6QUVEcXdZaEVRT25zcU9XWXNnUEx5LzZOZ3hZU0oz?=
 =?utf-8?B?RlozK1djWC8vT1g3aHoyeWZJSE9aN3RkdXNIN0dGUUVsUDBkNis3aTBCSEV0?=
 =?utf-8?B?Z0I4UHlUUEZkMlBwd0J6WGRDRk5sVmtINmVoOXZTK2VSL01sK3RqY0xmSEs1?=
 =?utf-8?B?YnZsN1did1JyU3Rsbm1HbjJ3SGtIdlRrdGlXeG5uWFBGbnBsb05MWjFjNmhr?=
 =?utf-8?B?ZkNYSGppa3VEbUNXblFiR2NlUkM2SXMrU0lZMEMzUzNXUXZrY1Z2VnZ2c3RY?=
 =?utf-8?B?TWtPU0lnQ21Kc2QzZjZJTmwwNUhIY2ROSThuVTh1ZjZ5b1RSZGhJbXN6MHJT?=
 =?utf-8?B?ZjNGNVRJOEMzRmJOdUZzakFoOHZHdVkraE4vZ3REMFpzTEpXSTJ0NDU5Sy85?=
 =?utf-8?B?SUdXWFB3cW9nbjBtZmRhQ1Q4SURYN09EUDhnNDFucHJBcitDTFlWN2hsMzMz?=
 =?utf-8?B?S1RiYVkxR3pvUjFtSCt4OXdXUGpIZVgybWhQVFkwdHordW5yS1FCejEvcEJE?=
 =?utf-8?B?VDdXNjd1UEVqTlpnblVkT0VLc0x0ckpxbjFSeDNCUFJmdHFkTHJXcjI1NURB?=
 =?utf-8?B?Q0hmMTBnT0tqV3JRYUo0N3B2ZXlpeFZ6K2xHWWJpdnozMnF1WHFub0JEY1E2?=
 =?utf-8?B?NlhhNU9jb1BsTXB6bTM5S2pRWG16ZUdLSGZBMm9sNWJ5dCtjNmtiMTdSaE9l?=
 =?utf-8?B?Q0M1Q3NtajhIemNSUlVDV28vWHlKUG9OK080eWNYNHJVYjV6WmdTeTQvYnN1?=
 =?utf-8?B?RHY0NGlUdGkzZkNEb29OWExFTzFhUnNCTXIwZldMME9jUlhvYjBucGRRNmVh?=
 =?utf-8?B?NFB5L0xFMzhYc1VPcVB4NldFaGw5bkxJaGFOakY1ZFZUeGVYRnJzSWg1NjdP?=
 =?utf-8?B?UXdsdXRuYjhlSGJDSGJGeG8vcjhndXZiMU11bmE2VmdRZDg4SE9xWnc4ZWMw?=
 =?utf-8?B?TEVoUkpSTThaZWxVTEdkSGpoSXFJdkJrbXcxZGRIZVkrd2srb0Y2dWlHSm9I?=
 =?utf-8?B?ZVAwVjBLTkkvazlrNTVLeFBJYWVYbEUrdGZCUDNPTVlSSG9WUmNJSWhrc0Rk?=
 =?utf-8?B?QmtKVFhPMWh0NnFFejVsN29ibVVxamZYdmJqU1hyWk5hV2hBUFVpd3RDOFEv?=
 =?utf-8?B?a0pBUEFmZzdHSUJ2cjVNOW1PQk5WZittMUQrZHlKcnJ2d0JMeWJWUmd4V2lJ?=
 =?utf-8?B?VzYrektSMlJQbHVmK1A0aWZiZUlyaG5YeFNQSWYvbk9IZU1GM3VoZGoydGZG?=
 =?utf-8?B?c2w2YUZhRHpsRHJybnlabERwanlPUjQ5VUwxd2ZacytwOWZaRUdjdVdFb3BL?=
 =?utf-8?Q?g4D1pilSmVY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzNRUzBORytsL3dyZVZ1ZWE1UFFxK0JTL1BFcmpTQ3ladzJtczdHWGxhcDFC?=
 =?utf-8?B?ak0zbitwYmd2RkxrQkMvS09Ld09ZSHdDWW1pYk95dzVwZU5PS1h0QVFZTmRX?=
 =?utf-8?B?eVlzc0dCNndDZkVCS2RBWnBXVFB1clhjUDJscXhndGt3SHVkSi9TQTV6N0x4?=
 =?utf-8?B?T0kwemN4VVBsZ0prelJKNjdRQmZoQUswd3RxMkwxSnJKVG9UT2EyeTZ1dHZx?=
 =?utf-8?B?SnczTVQrQ0lyYVBPYm5Ya1hjV3B2WStVQlhsNlhOdlNPU2Uzb3JYRnMvc1Uv?=
 =?utf-8?B?Sm1OSnZDTksyeDA4YkhlUHZteUdDUzVWTjl5RjRmZTVTbitoTVkyaEJScXlK?=
 =?utf-8?B?c1ZFYmhHdjR4a01CTzJZTUl5UGRuYU5QaE9XUjcvb0E0OXdrTWs5UnprcUJZ?=
 =?utf-8?B?RG0xclJGUHV6cUJ3L3k4K2J5TjIwRmhPSjQ4bmNHY1kyOVZ2aXRGRS83Nld5?=
 =?utf-8?B?bldjWDIxNkFwLzJyU21QWUJwWnRhNGxRcFAvWmdoZTJBSDRxcU1IMFlEaWZu?=
 =?utf-8?B?YzBCZGdpZlhMYWk0eXNKbGpScFZJblhwSUFZblhycXJSNytXUDAwdkFFQXFS?=
 =?utf-8?B?TEwzTExHd0xtd3RIV00zM1F0TWRTSVBkYWt2c1RjcUxSYjZKZ1BzYzBTZ1RU?=
 =?utf-8?B?MUxmYWdaSHozWkNMTk0xbDZ5d0JPUlVNM3M4bExTMzNoZ0lERnJsaHlkNFdE?=
 =?utf-8?B?VzJuWEZ3SHF4UWQvdklRdlRjWTJxbnU1TWJTTXZhQ3RXakJOSXFKKzJIVHU3?=
 =?utf-8?B?RnJIcDNyRHZNWktZQS9TcFVlRmYrYkp6THZ2N04zNnpTU2pEdjlFKzZMU2ZH?=
 =?utf-8?B?UGNPU1pZZjkyS1prUUVTZElvQ3UyaVdZQWtpbHBJc0lHQyt1MU1JUzRuWXMz?=
 =?utf-8?B?U1BJR1Y1SEpSRTVFd0IrdWNXbHJsUUFkRkF1K0dBVjBveFkvbXNFemlRWld1?=
 =?utf-8?B?c1dOWENvSFBrcHoyOVVyVXpwdVRtYURIV0dyMG1uYjQ4MnNLNEpaS1lyaG5r?=
 =?utf-8?B?UU1VMGR6WjZmWlJSTlhicmdEM1hxQnFjdGdZaWE3eEI4b3ZzUkZzbXhVL2w0?=
 =?utf-8?B?OXFzdm5TZzNiV0U4SVZBd3g5T1NhRzRXS1VSeXg2VDFGOUFvK2VIYjVUVTNk?=
 =?utf-8?B?RnRQNVlNZ1ZNeGd4bFFtanBzSmlxenB1STZWdWJ5QitqWXg2VW1sa3p3UmpO?=
 =?utf-8?B?L2xXQzJ1bERTWGFFL0ZCSEhHdjJhaFBnOGlCVFV2UDJraE10R0NLT1B1R3BK?=
 =?utf-8?B?QUxkRk85aE1kMHF4dUdMUk80Rjk2eERwemsxZ1VZR1FxU05TbEhiWi9BODNY?=
 =?utf-8?B?K0NNNGJsazQxMFhUTW15MnlyWVB2Z1puWE8reFZSQm53T09VcENuYjlDNWtG?=
 =?utf-8?B?MUhEYU1IVFhFR0hqQXBldngyK3ZWa05nQWNyVHMySmZoWk1wMmltekZJOHBr?=
 =?utf-8?B?d3FCZVdqeDBEZk1qT24xK2gwdWY0b21yYmNuUVh4aUNqZ3dxSW1JT2hFd2Rk?=
 =?utf-8?B?ejQ1c1pzNi9uYzExWEozajdReEJSTG9nTUZBdjdwSTVKd1VqclhKemtDNE5F?=
 =?utf-8?B?dDdSaEZsT2lpdmtrTjdramVXcGhZcVdDUkVzN1hJdWIrVG1MU1h3MS9SNEE0?=
 =?utf-8?B?ZDNNOTV0VVh5L0tLNWtCVnU1MEVETSs4Z2tIUmNZaHVpRDNGbGErbFltc3hI?=
 =?utf-8?B?cDV1d3krRkc0bTZQVzBRTlNDMklTcFRXaGZEOCtRUEM2b3pMWStEYUQ1NFBh?=
 =?utf-8?B?Nk5SRjhlZ25Sb0J6Nlk4QTJhaDRtVVM0Z29CUFUrMzY2Ty8xV25vaGdFYzQv?=
 =?utf-8?B?VnVpSHlrK3hJaFhRRkhTL2tkUk9RazlvbjNvcDkzNTQzQkgvalFnN2dtSDhE?=
 =?utf-8?B?eUZLL3daOW4rVXJzRWVOL0s5QlAxUGxwdHArVmtQLzc2enJIQ2hSVTAwQXY0?=
 =?utf-8?B?djNzZ0JyYTFOVU5vVDNWVlpVVW5tbXp4MjV6V3ZlcklvdzVKQnZiOVlrRlVj?=
 =?utf-8?B?dUVsQXIxSThHcjlMM0xwcnQ5WG95QUx6NGtKZC9odlB2V1VIUmJ0NkZkSGEx?=
 =?utf-8?B?MWNBbCtBZnJPczVmY2RoZ204R3V4VU1sK0dCblU5VlNtTVZQSDFMN2dWZktX?=
 =?utf-8?B?TEovZDgwNTZOM1FHL3pRVUJUUWRvdEhGcU1tWCsvK0NSd1RsQVhrcWFFSzlU?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed47b7da-8503-4fbc-e362-08dda417d542
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 10:00:42.9806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLX+jHjURU/ymHAuzkIzYryjR8zawpETTWTTKQ5jdp3u+IujJaYiZVJGBlFUe/0PE8zamGnsSf8wjUVCcOlFYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7034
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

Can you change patch title to
Add PMT offsets for G-state and PCIe link state residency counters for BMG

On 03-06-2025 23:42, Soham Purkait wrote:
>     Add G-State residency and pcie link state residency
> offset macros for G2, G6, G8, G10, ModS and L0, L1, L1.2
> respectively.
Add PMT offsets for G-states (G2, G6, G8, G10, ModS) and
PCIe link states(L0, L1, L1_2) residency counters, for BMG.

>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..4e377b6eac92 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>   #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>   #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>   
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +
> +#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
> +#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
> +#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
> +
>   #endif
Can you change COUNTER to OFFSET ie. PCIE_LINK_LX_X_RESIDENCY_OFFSET
Also, are these offsets applicable only for BMG ? Based on that you can 
keep/remove BMG prefix.

