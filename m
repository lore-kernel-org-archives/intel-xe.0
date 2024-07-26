Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B99C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 15:03:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7027C10E9C4;
	Fri, 26 Jul 2024 15:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I6Nj/TGl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2FAC10E9C4
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 15:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722006219; x=1753542219;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=syH+uYWFIBZ9pKKr+XYvQYIW53sQ889Tkal1nH7hrFo=;
 b=I6Nj/TGl5dvtWb+M/HyYpjVdNbk2raEB6bG6t6kv7zp0XLpLUzpgkeoP
 SOyRkZDPGZkcY2EsuP5KTgl/L4yRcxg//4YegG7DwWu8wffvP/8PDNi9U
 IxWu9lh82tCb7T8owPlK3u4SU8aXwDXzaBsdao8RDQ6eOEhimeD2RfHG/
 A7+4Z9RJKutHL8c3TaVz6FDAjE+/FjsngD1Wf408asQTR2LsWnltPWXCG
 +6XnXTSEL1l+Y4v1q6pMWx3oWoiq6A3I/lXFxFd/g5EDGw06plB4O1dr9
 Tv2hKoZ2bGiSwbipHNwB8+3/x1W5O6zynQBqk3PwLh0h+XiCX0pm26+BL Q==;
X-CSE-ConnectionGUID: tyOLgHX3ReKM3i9ZnL4pjA==
X-CSE-MsgGUID: Ck5id4FrR5OlKsq8QQVP8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19409542"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19409542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 08:03:39 -0700
X-CSE-ConnectionGUID: z78kaHOPQX+G7HuZJK1Khw==
X-CSE-MsgGUID: OGBe+kCbQ+2VsSW3t+nRbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="52972905"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 08:03:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:03:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:03:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:03:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gCwrCykHOPdMsTvvbhoth+dtUqvEvyE1sKAT9eXL5lkqXYlMIYZS51/DPKoR5lEnK9Yn5LWA7F8xTs+Q88gbxCKKpQ5Aep6PoyJU6nDgLtfMynbqlooQBhssnXq9rURv7aNoR+sTBD2OyPEl0KsbMsCsDMesV2ReyIYBK1JIR/4m3eRcsoTxISbxNLce8yZqn3oW93crg8Tgu9RDN62ziHPTHGAWAF/OL+GMPUEWSqZEZf6sqzH3jLTmEpqGc72TrJ/JJz80bqixOT/j5LvEFstSxA18frJ8vbxmCponplz38Ais4eJqLIXxrwMijW7X1f9HNcLZ6lwU1tJgdJIcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O+MEeWm2EsQyP6FTrZHrPA08xbrlPF3aUHxTXmAx9XM=;
 b=fvDLwAdvzQlEA0lJli+muxy2b+wkakLxp7YrT0w5ILEFrpxzbr3PH13ueWNmaKL3Amxt3fX77XZb0o5K7jgMfejm+3pr8iejN2xqmnK714BXkQyQLxNXTU/FK58JJTnnbhFHA+6rDQ88lhRTHhYO1217E65oDoNa8Ks68jSHjbtcKpm92TfPQvT07oSlAofMLnY4NsfVfmC7FuAoCVllTBRJMD8uqNcZuflHK79dy+iu474IvUjOZB0AW9puwod2YY8ErazoSzFBtnPHAF16+lUcZHneGmRHv3crF/pTda/cK5zoB4UGu9vw/o1fLde5o+DhtBHR5M/jYPuRBquaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB5892.namprd11.prod.outlook.com (2603:10b6:303:16a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 15:03:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 15:03:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-2-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 1/7] drm/xe/kunit: Test WAs for BMG
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 12:03:27 -0300
Message-ID: <172200620773.1586.16792563297272373730@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0388.namprd04.prod.outlook.com
 (2603:10b6:303:81::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB5892:EE_
X-MS-Office365-Filtering-Correlation-Id: e1032868-bace-4d29-bca3-08dcad841e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU5tb0s2bzlHanM1Z2MwUE16TlBUT3BNQVlremxEcDNiSWlVWEg3Nmp6K2lK?=
 =?utf-8?B?bzdtVk5rTDg2SFY5aElyWVpUR2FORWQxWHplTUxXY3JtYkF3dEFkY0g4TjBK?=
 =?utf-8?B?cU13a0Y3WEppaXY0Yzd5QlVGQm45QldHV0RiWHJxUEVobFNkLzFYRTFmb0h0?=
 =?utf-8?B?Y1M4V2JsZ2hGOG9GVTFoQTI0dmtSVWV1SUs5U1dPUDZSSlVvd0lLL1N1alBC?=
 =?utf-8?B?YTJUL3NsamZldmp4cFBTa0JYMTJPRFJ5SzdmaEJJQ3dibmtJeTVFODRGYldR?=
 =?utf-8?B?NTl6WGFHRzdLemczUkxUbVZXUEpyWExIQ096bERRT3hHTVMzUVI1S0xHRDVL?=
 =?utf-8?B?bnVYN2MxNjNJNVYxUk05MXJxeEV5UGoxcHhoTDFSaEdBMHlJV1lOeGtwWGJ4?=
 =?utf-8?B?N3JxcldiQWtEaU9saHN6dTlWNGZ5OTBPaVlZVlNJcTBKRmc5R2NYVjJmNHJF?=
 =?utf-8?B?ZUFObURXNTN2YmpHdWhUaVdWZ3BkTlZZNlhzUUZFd0U3T1hJeW43aStYQ05v?=
 =?utf-8?B?NTdQVkZ5NEFEd0xvSWxuMjIveFUzNkNSNzd6TmJjMmhSeC8zdEM1bkljRkRE?=
 =?utf-8?B?ZWpCaFd0TGdnTU4wK2l3M1gyd3FUR25ZaGF1dWhySUExSUlpbU8zVGN0T1pj?=
 =?utf-8?B?NTR0dVFQdVFiYkpuR0N5U3I0aHRveU5hKzdxT2pmaVRodnBIaWwyZE9uajd3?=
 =?utf-8?B?dy9LUWZZTW1HcGVtVmhBTVBPYjRTcVpaVUsrQksvVm1lWENtOGNYeTREbkk3?=
 =?utf-8?B?c0ZkbE1TNXN4djk0UnZ6VDA5cEh2NmlDSWdzV0NFN1JpaldkRDMxRk1mcVY1?=
 =?utf-8?B?ZGpNdXRrRXgxaGxuN0hESW02a3VvOFFQYkhES2lta3ZtV1Nab1I5MG5QMThh?=
 =?utf-8?B?SXVRRnhrZXYxcDAwNkVCeFd2d25jenovUFAzVkVJRFRMSEdRSWxpdUNodnZ0?=
 =?utf-8?B?cW9uM3hUNlBuRHFWNFdnQmJFYjRrSU9JbnhtQXRFTk5OSFF5RkFVUndyMWsx?=
 =?utf-8?B?eXlJZFBZNjJDYUJBZGVOZGhGQldMZzhJU0JoUlFDcWQ4U2RkUDV6TEVWY0Z2?=
 =?utf-8?B?RUlCa2JjNFcwNTBKQlQvTXlSd2F0TkpDNXdhM1ZwZUE1VVRVdGQydzhqWE9E?=
 =?utf-8?B?cUN1aElqOXAvblJ6dzNrL3hTcFAyb0RyOFYxZy9kSS9sa0RLZSs2SGRuNUpV?=
 =?utf-8?B?cVNVQ3RrTmFTbU5KN016dEkvMUVsN3Vxd2ZrV204YjUrM1J0eVIwdzM4Yk5D?=
 =?utf-8?B?cHBKL2YzZ0VjVFZybGJ3RGJVVHpJNXphRUlmYVRwNGh1RUpYTlZkL2VRbmdF?=
 =?utf-8?B?ZDdidndDVVdPT2pJYm5EM05zNzVuRmZzSWFYZnozSG9paXAraGkyNUNwbGNx?=
 =?utf-8?B?Tm1Xcy9TSjg3SzJIbEJyZkNnajcybFJieU1GTXp0cVZ0c0kxZU5USFBuK2o2?=
 =?utf-8?B?THBFNkY1UXQ2UFZ0WFJCRk5JelNqbzdzRVVjUzJTdWcrdWtlM09zZnp2TkEv?=
 =?utf-8?B?aGNPeHM0OVFnV1laSllQNDhJV0crVXFQWlhCNnhMVm5SNXB5UmM5TnVvb2Vx?=
 =?utf-8?B?QU5NaVJ0dXBscnNPWEo3NWZhSGdqd2xqVWxhVGNmSHEvUFpqbTFxQjd2czJ4?=
 =?utf-8?B?WkxYTlFteFpTM2dyUVFKenZmOTlEN2tGMDltNHJsNTM3TGt6TTlaYzZldnAz?=
 =?utf-8?B?VjhyOE5STWRMaG5jR2lUR3ZRT2djWFQyS1A1SWhJNWd4OERoRnBtM0hvTDJJ?=
 =?utf-8?B?cStQVGV2OUlpSG5GQ01JMUp0cEdaUHlrZ3JYWlI1N1VXdDBXVGJrWldWVlox?=
 =?utf-8?B?UzVJdWJzcE5DcGdmaGlYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDlndCszMlpMaFVRdlQxdTZXeitVSVdaUzF0VXVIRzJka1hXcTZGVnZkUW1x?=
 =?utf-8?B?c1JXWXlNU1UrV0x0QzJDYUI4NzJiR3lkaHBQN2pRemlPWnRtNldFT2hnZUMv?=
 =?utf-8?B?WEZmVkFkWnJDQ2xOb0VpRldyMm90VVJPWmw2emJneUVza1JuZkQ4MzgwdDh6?=
 =?utf-8?B?d2VrQmR1OTBUMmp1TDJGYnhSMlNUSzQ1WnI0K01lN0ZEbktwaDlhbUsvQVpB?=
 =?utf-8?B?WmQ0alhqV3Y4b1lpNVNRS1FZSnhCYzJMaUN2WExNYXNMcldueFZ5Tk9UZHJ4?=
 =?utf-8?B?RnZyZ2ZlR1NRcnZrbmM5eHhDMXVOMk5wenl6bTQzaFQ3OXlVUWlFazN0RGJG?=
 =?utf-8?B?L0ZaK1Z4M1IrZ1loV05hTDRmTzFtK0J2N21Ia2U5MituWXBVc3k2Nno1TVp6?=
 =?utf-8?B?WGtORDdmSFVWMDhFNzI1c0tzL3dycTl0NWtQY0tnUWY2T1h0T0FoTUVVMENN?=
 =?utf-8?B?aXVDcFNud2ZOMEZIa3krYUtlN0RFTVQzNHcvRTYwZmhRTmhPUktaMkRtSHZH?=
 =?utf-8?B?cWFlc0ZCdEJ1WmtjbVdwd2FWbkFlR1pteW5VNlJ4UG9pNHZ0SkMrZGlQRXhQ?=
 =?utf-8?B?dlFzSmZPeFNXeExYVlR2RlJ2ZW96MmxrTStTR3lYVUVqRFN5c3JZVVJtWkUx?=
 =?utf-8?B?WjlSbVdKTHJjUzJzRFRMZGU0V2ZIbkdlNGg0UUh3Q3B3S3M0LzN5d011OGVH?=
 =?utf-8?B?b0dXTC95QWZXdG9rNDRZVnlEdEJaMXdTb2g1RFljUmk2Nm1mcVp3dGZqa3J4?=
 =?utf-8?B?Qm5lQ1R1L2xTb0V1MWkxSFd6QkY1d3ZweENiSXY1TDBaQmRYNlUyOUh6YXc4?=
 =?utf-8?B?bERiMzh3b21uUmRYVnBocXg4djk2UGVzbDFsK2g3Z284NG0zcUoyYzhrYWRU?=
 =?utf-8?B?V0JUNlVrdjJocnVwejlNWGc4WmVTb3JsZkkrRTZKVklJZFU5Rm5kUkJyK2Yx?=
 =?utf-8?B?TmdrREhyYUNabEc5VkRidUhrRkxuNXEvZitOcWNKSzVSeTJraHVqVnJiTnpo?=
 =?utf-8?B?eGwxdHpkN3ZBa3FzWFl4QzJNbjVkc21LYXJsYUJQTnhhYTdsY0gvbEo5akhJ?=
 =?utf-8?B?NGtXWlkwSkNaeEpLV0FsQXdtQUFzWnBJcFVQNVVEQ1VudVdkdXRpZTNmbThk?=
 =?utf-8?B?R2pHNkEzNGxVNUMxYnAxT040R2hXMnV2WWtkYjdPOVhUYkxsNXJsdDdVMnZl?=
 =?utf-8?B?R3ZlTWErMXlIQzlNK3BCTXVKd2wrWTA5enhhUTM3b01NMVVna2k3K1FxK0VP?=
 =?utf-8?B?NTE0d2Q3RnZscGJGbmlNRnhWMEVYS1NJV3d2WnJSU2VNUkIzM25pSEVwY0cy?=
 =?utf-8?B?ZFdRZEYrYkFJYjluK2pTRS9oSkRTT2loOGpmN1JRb3l4VjJiaU9CcUhUVk0y?=
 =?utf-8?B?cmF6NkZHYXUvWS9sZXFzSTZXNzdKRTZpazdHU0pPdm5YQkRwZEhtaUVQb3ZE?=
 =?utf-8?B?ODcrTkRtY29nWHM3ZkpHOVdrU1RYOUowL1ozNTlCR2RVc1F6dGorbmFLR1Vv?=
 =?utf-8?B?cUJMdkZUT1NMVXdWTU1nSTU2UDNUMHNWdzVKY2VpWUVxZEN1MXp2NGczbHU3?=
 =?utf-8?B?aFdOV3Q0TnJ5RytNWHY1dmJIMk1WOTJvMUFqUjBYNm1KdVVXTEx2bDFHYTBp?=
 =?utf-8?B?blNWYzBoRW5kQnByQmFZZlUzUVFBdHp1dlhHTVJEKzMyZURCVGFoLzZhTUtp?=
 =?utf-8?B?eUk0KytqRGowTkE3dlJMemhUS0NwWGFNVm5pblhZQ3NZSlpUL3oweUhtSjRo?=
 =?utf-8?B?MU9zcjR0eEJ3VWxQTHVJclhuelY5aFZzY0RCSjlGMWY2NXh3RFVNZi9qR1Bl?=
 =?utf-8?B?OWR6NEFXeVNDbTJ2UXdkUVgyNFo0azkrakJSdHJCamtyVXNqZ0M4WmoyYkNH?=
 =?utf-8?B?Q05xc0JZenJPb3dXVVRaUU1kNUd4V0ZSM0V1MWlmS3BiMDlzUjNwNnRaZ1cw?=
 =?utf-8?B?NzVKdHdXdERVMy9NTFMzY01nS2ZDeTRSdTU0YmhWRnE2bnh3VCtJWEZnMEpr?=
 =?utf-8?B?NXBBZkNBbHloNjNRSWY5YXVuVkZ3M1pVcmZlYWZ2dXdxT2R5QWJDdVg1enJE?=
 =?utf-8?B?RXhtR2U4UkNLRHd6YUFpaEcrSm9tWldNK2tVckRJZWlvek0zNlhwNlRZWUs0?=
 =?utf-8?B?ZXljODVjcHhYQmRNckdyWUNVUGRJTm1MWVBCZEJxcE5GcGIzU1NkR1JTbTV2?=
 =?utf-8?B?eGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1032868-bace-4d29-bca3-08dcad841e98
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:03:34.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DhtuGLPPn3xj42n6xWny9mskmLqyiIDOY3cXgkr8jvYps8vyTTezBHNeBlxHptNIIShiH6zj5AdxSTwpUW9Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5892
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

Quoting Lucas De Marchi (2024-07-26 03:43:31-03:00)
>Add one variant for BMG to make sure the workarounds do not conflict.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_wa_test.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_wa_test.c b/drivers/gpu/drm/xe/te=
sts/xe_wa_test.c
>index 9d0c715142b9..8d6a77fbc716 100644
>--- a/drivers/gpu/drm/xe/tests/xe_wa_test.c
>+++ b/drivers/gpu/drm/xe/tests/xe_wa_test.c
>@@ -74,6 +74,7 @@ static const struct platform_test_case cases[] =3D {
>         GMDID_CASE(METEORLAKE, 1274, A0, 1300, A0),
>         GMDID_CASE(LUNARLAKE, 2004, A0, 2000, A0),
>         GMDID_CASE(LUNARLAKE, 2004, B0, 2000, A0),
>+        GMDID_CASE(BATTLEMAGE, 2001, A0, 2000, A1),

I think we should use 1301 for media version to be more accurate and
actually match workarounds, right?

> };
>=20
> static void platform_desc(const struct platform_test_case *t, char *desc)
>--=20
>2.43.0
>
