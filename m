Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CD9CCD1BF
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 20:03:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4308810E06E;
	Tue, 28 Oct 2025 20:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J9LZu70q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF210E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 20:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761681793; x=1793217793;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=B3KOxTrcNqCrT1radcYWwh/9jjbz9r8VWwo63c97pUw=;
 b=J9LZu70qoh81INoyxdJUV/0QE+WWSgbzN3AWxeW+lU9XHq7WrCP3BXMX
 2L6A1ZxOUkKVjJ0LIjom7ITTUmwGHv0dOiol9NYolVTwcAZDdo6eQTWwF
 Pd7U2hJA9/C2mHaU6QjgtPnJE1HIzUeX6kM41WHllG9NWv/6qNE9hcgpf
 Gf6PuAlXmcbM8fH+S4EXQzotDOOQqjHN0IVo+t1owYsc/iUYorQIrIzpY
 A2fExI4CSD4K0jQT4iKSnRyHrfOC6FhYS/vJPv14tHr4pFNAvHRvJdkfQ
 pU639T7HlSGbxGr6l3KHwcb085MmtL66lOxxCZrNSN13dFXv/WwNnaIIG A==;
X-CSE-ConnectionGUID: w4sYS49ETK+8YMhW3QJVIw==
X-CSE-MsgGUID: ++FgviFYT6WjPiFDumZsRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63830486"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="63830486"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:03:13 -0700
X-CSE-ConnectionGUID: Ey74XefiRaK19W/zQ8uzGw==
X-CSE-MsgGUID: iWcqRcUHSKa2cgpC2zGoeA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:03:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:03:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 13:03:12 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 13:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXv8bUJPhGrRIpz/JLjKdg3NzwQjJMcE7oW2paoPZNR5qeh5O/SPAOk87fWd3EC0CwHvtBkmNdQljVYB6RcRJXBx6FGZEHhshFb7S7a8iQhvJY+3oeTlhfJw+w6JwFdKRqBk4JPrNbBudWS/jSdT7QaLr35qWEg1yM5K5mYdMNT2GJdrfxrXRyJhqmIFjh9kmRnryAbLfVLphC4+47MR+GQyS1qXEOHOf7NQZIkVPi3QsBfa9+EB9Y+fgQZvldaxqUj2yZ8cAGGpgwv/uvbFNHi5U9Rk+uQr/AVeG38fVYDqasrlF5XQ16pPvv9XpkXhAohoAH884qklXzp0cWcVNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M/XN/DheLuBSno9JdlJRax+pBWERctqOEkB2kgvDr/A=;
 b=HLRdNdP24LfhtODupOnYAkHVh2WQ9VcLJIiHyNrSd0Cao3d4Nt7CagTdCcw56sEIYJQwH1P3Yq36cCtTldq8Vfena+uatdfl7h5QQkJNfp66bxjXMkTRleUbu8IM80ARGdbTs/bS3GkRUjPUdOhQOyy4ABhQ4rqwII8VvEX8CFu5bgpHwW1juQKC0/8YfDNoGt3yvygFjguepDglARxhD7X4AT7f9eH+YtSrIpnDUrlnSSh8rcvSvCqTUiA7JnxmVJyFMJvBme+5ppjmMgSoDLZkoHjKUkUVQfp6mS54K0NdFZyEMo29/PI3a9HJduSF5uk9MgFmCiUoGACNEF4Fcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by IA1PR11MB6369.namprd11.prod.outlook.com
 (2603:10b6:208:3af::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 20:03:10 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::28e0:9ef7:24f0:c21b%7]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 20:03:10 +0000
Date: Tue, 28 Oct 2025 13:03:05 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <niranjana.vishwanathapura@intel.com>, <zhanjun.dong@intel.com>,
 <shuicheng.lin@intel.com>
Subject: Re: [PATCH 2/6] drm/xe: Add a trace point for VM close
Message-ID: <aQEhefuB156VhuSd@msatwood-mobl>
References: <20251027180412.63743-1-stuart.summers@intel.com>
 <20251027180412.63743-3-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251027180412.63743-3-stuart.summers@intel.com>
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|IA1PR11MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b40a4d6-9cae-466f-dba0-08de165d048f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U01uYVQzTWNQS3NtRUhTeHhKZUJvcXd5RHZINnU4Rloyd3dNbkFMdXhNMW1k?=
 =?utf-8?B?K09OK0VCQ1BqdDM0SDJCYkpKQTV3ZVZpSXJvR3FUMVg5YU9PREpGTk1IbXRC?=
 =?utf-8?B?bTZzSExXOEs1Tkl1Y3hOdVN4a2tMbVlpYkJzVmlJZ2JlU2VnRGUzQWJ6ZStp?=
 =?utf-8?B?ZU5YRlBhTFA3cm9FSGVKZG5ycDVobTlwTXVLZTluWnc3eHNNTldzNjV4blF4?=
 =?utf-8?B?QkFqYmFsU3NYUThsN3VyQjVIY2tqZm11MjRGVzVPSXRFT1JrR216MkVIS0U5?=
 =?utf-8?B?YzlNMzFMM0g5L0ZVQ2E5T0pLSGh0alRVZ0lRQjFBRy8xd1o1OXZTeUdFV2xR?=
 =?utf-8?B?QmtLNEtjOEdyU3FpZ3A5ZEZjSFFKbFZtSW5vYnV1VWhrcmEvYXJaUlZsOWUx?=
 =?utf-8?B?ajJrSzJJVXNicEIyc3VzckVDelp4R0lBZVgxT3A5M0MycUd4clNhNmVPekNy?=
 =?utf-8?B?UUtKbnZXQ0xoU1Y2OEJpMEtIcjhiSDZZZnJQdnBqTTZKajdObWEvWUl0L0hQ?=
 =?utf-8?B?SDI1ZkZuM3F6YXN4UkFoSHdFaVJHdVloeFphWHBHUWdjZkJBdTk4WHFzTkEw?=
 =?utf-8?B?R1c5U3pRbTlGc0dSb3NuWW1UTGlQM3RPTmFjY0FlT1BOY1ZRbkt6TnVlVXYv?=
 =?utf-8?B?bEhqSmZXRGplcENvRWU3cnA4YlFvQWJkMU1SZ1pnWlp6TW9tcmE0bjk1ajhL?=
 =?utf-8?B?Ti9SMENzSG92Z3daMGQ5ekV3cEJ2VUxTbEpma3lxZzVwSnJHS1VINko4dExR?=
 =?utf-8?B?TG5zaVNBeWMvWXlMWjB1NSs0THI1OGEzaEFnclJoMVJwWjZnU0xSa01YUzk4?=
 =?utf-8?B?WEt3aHpJMk4wZUU2N0lZaVJScFFWbGMyRUV0cjlZYi9qdFI4MFgyWEdLVjZV?=
 =?utf-8?B?T0dMOWN2SWVPM1RjZFkxOXlVZnBWbjlES3ByZUNtMnE4dXNqdHNaYkdsRHh3?=
 =?utf-8?B?SWJsdVR2OXF2QnU4RzNWblZRWjZqUTZCMldoWk1zNERrTlNyNW1VcDhNQlcv?=
 =?utf-8?B?NnNoNXMxSGR2MTB2TFhIaSt0OUNNK0pzc1Yxei9hdlN2K1V4bSthWTFOaEYv?=
 =?utf-8?B?MUF5VlFMMEdkNGFTbk4yNnVDVURkZ1FPNWZENFpGK05iZU5pSHpvUmdDeVRu?=
 =?utf-8?B?d0FtM1l6bW9WZDgybTQ2VDdjNFJvTWQxUkNTajczZERxYjBSUUFPT1VlZVd2?=
 =?utf-8?B?UWV4RjloMGp5bzZ2SytRTlVDOGx3TkpqZHE0d3BwMXFvdDMxZjRaRTdFUkU5?=
 =?utf-8?B?V3l6bE1iazBKZnREMThIdjExZll3UnVyd3hCN1pGVFJCa3RJY2tNVTNTcEcv?=
 =?utf-8?B?M3hXN08wZXFIcVA3U0JuWXhBdk9zZlFOUE5MMmNsekk3OFcydVhDeGpnS1VW?=
 =?utf-8?B?Y1dYOFJEQnBDUHNaVUR1cjRGYkxIUzE3TENPZ1JocWxuNlpZNzQwSDgrSUww?=
 =?utf-8?B?NTRIL0trVFgzNUsyMHJ1SkVFMWR6MkNja2paWnRIM3M0ZHNwNDBaczEwNjBh?=
 =?utf-8?B?SmlROHA1K29LdEhzK3JpckZSQkxjWlJPZFJMV1dxV2J6SjFyc1M1SzgvemhU?=
 =?utf-8?B?c2NGTVM3R05hVnoySUczNlgrWmJncHRDSnZmRDFGa0g1WjVLa0IvdG9rTE9U?=
 =?utf-8?B?NENzVjZXcHJvZGNrNVA2SG45aTdzdG1reXFON05POWo1b0dOQ0tmc21LS1Zm?=
 =?utf-8?B?RkNmcGFmOXk1VFJ2SitJUXFTUi9QR0NkSUt3TmV5a0ZSc2pQdVNJbENLTnEr?=
 =?utf-8?B?U3pWc25lNm5jUUdFa29EODZ6a3kzdXNEYXUvcWZPYzZZdnYyL2FYY0J4YnNQ?=
 =?utf-8?B?SHJLZFpVTzcycm9BV2QwTEdqUmtnQ1dQRFoyYWljcytyR1k0djBkZGQ3YVZ4?=
 =?utf-8?B?ZUpVTzdrTnFpVDdUajkxQ2h2OGQ5elI5b29nbXZzczdXUmdDSEJld05xakRp?=
 =?utf-8?Q?0burHEsK6Zoj8ew50kWU7TRB61dYQqkT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y01UREoyaklxVDBhOWRNSHEzZFBKN0xraE4wejNBRk5QRWVGOUw2RDExQ1N4?=
 =?utf-8?B?SVVadjVBVDdpREgxbUt6aVBYMnYybHVSb1p2Z2FKcDg5VzdKWUxEdXpaWElJ?=
 =?utf-8?B?SnVoREMwemIwVzdJNE1GcGxjN3B4eEo4TEtuay9ZTEpDdExvYmZHdGdXcDJp?=
 =?utf-8?B?VnBINnpoaFRIRThBUGdxckUyS1NHTlBLaUxLVlFnUzR5em9ZQndxeVNNa2c1?=
 =?utf-8?B?aWsySTJRaXVpQlFmZythWHJWOTRCNG81SmROVEVKc0hGYnJUOU1kd3ZMcmhI?=
 =?utf-8?B?UzA0UWpDOHp6Rlk0cXhCVHJPK1pFdFA3SmJBS3BScW9aUDUvaFYyVTliNnBO?=
 =?utf-8?B?ak5DNDh5cUc2RE1HNm0rVk05aEdwQzZPdlh2bC9TeCs5K0ljSml6SFVoRnJP?=
 =?utf-8?B?TE9HZ3kxNE8vamtaREJMUmJ6Zmd3Tms2T09qS3hoUHBBRmVjNjZLaTNQRmhB?=
 =?utf-8?B?MWU0aElFblBuT0YvRUtLRXFNYUpvUlVEbFNaZ0FzM0E1LytVRFhQUEtxNURr?=
 =?utf-8?B?VlZNR0NMU2NtSFJ4Z3Q4aUFnYkVqbGhXR0lEbXBxTDM4bVZNMnRpTGNQalZX?=
 =?utf-8?B?WlIvclo3ck1tazFRYkZieHk5YlZiWUNDOThxVFFCZk5GdnYvYjlER2ovbTd5?=
 =?utf-8?B?MTF5c2tvRW0wbjJaUm1PQnk5NER4dDQrVW9tL2NCbDA4a0RtQXU5Zjh4ZVlG?=
 =?utf-8?B?S0l1bTFVY3FiT0E3VE90Sy9vU2ludkQ3L0crREFLbFdqOXN5TDZhcTVYYzNl?=
 =?utf-8?B?OVFmNmtuR2V2UVJ0NDdZSFVwYlBxYmwzUktEWHFPWklsQ1dpNHNieU1pMjZJ?=
 =?utf-8?B?Z0JraXIzT3lleUpPd2YyY3NNNThpUlFESTFQQjZQRFRhZUJxVHVSMUNPUzZR?=
 =?utf-8?B?cEFPV3RmNU02RHlvOFROeitpamllVTUvYWlhUDlzQnNUYVBGSGJzK0xhVzRw?=
 =?utf-8?B?a0hGRVhHWVRYUFpiMkxqdmVWNnlwVGx1d0hESjJiTEtnSHBHcyt0eVo1MnIv?=
 =?utf-8?B?ZFpCYkVMZDBDS2w1NFROKzNZemkwSmdLdE1JamNVbFVvY0wvZTZNV0lCamlk?=
 =?utf-8?B?RjhRb09IRWtPRk1aS1lsUmhnVlArWEYzaFVOekVhU0sza3MyTExUSGJXaEtm?=
 =?utf-8?B?OGRzbWlxbUI3YURzeVZJTERuSzdabHozd1laeERlejJkREorUmpUVm5XMXhl?=
 =?utf-8?B?bGZZT0xxS01ZREUwYkw2UVVqaXZQUEdiNzY4a1VSVzA0YWQ4WEp3L3hoVFBU?=
 =?utf-8?B?L0trZmF3azdIanZYK2swWElUQ2E2cGF4ZHFRZXQ5aUEzTFRabHdHQTJsam0v?=
 =?utf-8?B?MVhVU1lWWTRWMDBMUmtYR1Y0NlZnRkZzZXZ0dnVHYkNUL2hzRkZmMnp0QjFi?=
 =?utf-8?B?b2laZThCL0QvN3A1cGxRcWgwRkcrbUE3Z2owRFFpNTZ1YzFnYTRVckF5dkVO?=
 =?utf-8?B?Q3k0WlJFWXFkS2h4b2JPeFMzdC9CSTVKckJybGFzQ3QyY1VXbFQvNjFRRysw?=
 =?utf-8?B?ei9INFZFVTlaczBnU0FucG9waTB5WC9XMi9vYXhSc3FrTnU1Q0hEdmg5YmlP?=
 =?utf-8?B?WVFEVWlVQkhNVFhFYjYwV2cxS25GR2hHZUw0NUdxZ2JoUnJaaW9aREtXZlVa?=
 =?utf-8?B?VytzckFBVW53WU92Vk9mTFJ2NWIzcVNPUnUyVzZuNEk2Q0NZK0pmUXBMZzBN?=
 =?utf-8?B?dk1US08rQjdZUGtlYVFsUmtrREpFcStKdEhXSWdINm9pRjdPTFhVMzFVUGhy?=
 =?utf-8?B?SmlzbnQwSnRnNThBYVlBRUpGWjdTWjJha09hRjE2ODl0RkhhVVBNYUE5Tlcv?=
 =?utf-8?B?QTBuVEVXY3F4WjBDT2N1MVlmc21SUHQ3bmJqOWo5Wm95L21zczlNQmNuaUZs?=
 =?utf-8?B?R0xySzF6Ni9PVklyYVFEYmplR0IvdndlS2pCZkMzd3NJSkF3dmZNNkZIdzVm?=
 =?utf-8?B?R0U4VTI1TU1jQjJMSlNKQ2lyLzd4aEZjOEx6RnA4aW8wVk9KdkpodVdGVDB4?=
 =?utf-8?B?RjdDMUcyZVhxNDJRdHRNTnFoRWVQcmV6b0cyS3lYSERybHA2cUE2T1BLVU9h?=
 =?utf-8?B?REMyMWhkVXRhRzcxOE5DRGZnd3lWRnhyZW9XYkVpVXpNanMzc1hnUUpTbCtV?=
 =?utf-8?B?Sm5ab2c1ZGlNMTFXczdQL2NoV2xQZlEyUlViWU4zdTdUbWxrY3BSY1hoS29M?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b40a4d6-9cae-466f-dba0-08de165d048f
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 20:03:09.9400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVRgJn9GUH77KvIQWhrrxe3lvu9NMz6wKDKpABFCpTmNitxt5KebgvkCpvvq8Uk5zRg3FcFCLxn9njr1O0ok4cmEFEMu88BczGYpvdRg0/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6369
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

On Mon, Oct 27, 2025 at 06:04:08PM +0000, Stuart Summers wrote:
> All better tracking of error cases when calling through
s/all/add
> xe_vm_close_and_put().
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_trace_bo.h | 6 ++++++
>  drivers/gpu/drm/xe/xe_vm.c       | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_trace_bo.h b/drivers/gpu/drm/xe/xe_trace_bo.h
> index 86323cf3be2c..238311cfb816 100644
> --- a/drivers/gpu/drm/xe/xe_trace_bo.h
> +++ b/drivers/gpu/drm/xe/xe_trace_bo.h
> @@ -14,6 +14,7 @@
>  
>  #include "xe_bo.h"
>  #include "xe_bo_types.h"
> +#include "xe_exec_queue_types.h"
This doesnt appear to be required for this patch and should be included
in the patch titled "Add new exec queue trace points".

With its removal.

Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
>  #include "xe_vm.h"
>  
>  #define __dev_name_bo(bo)	dev_name(xe_bo_device(bo)->drm.dev)
> @@ -223,6 +224,11 @@ DEFINE_EVENT(xe_vm, xe_vm_free,
>  	     TP_ARGS(vm)
>  );
>  
> +DEFINE_EVENT(xe_vm, xe_vm_close,
> +	     TP_PROTO(struct xe_vm *vm),
> +	     TP_ARGS(vm)
> +);
> +
>  DEFINE_EVENT(xe_vm, xe_vm_cpu_bind,
>  	     TP_PROTO(struct xe_vm *vm),
>  	     TP_ARGS(vm)
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 00f3520dec38..e383982bad8a 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1672,6 +1672,8 @@ static void xe_vm_close(struct xe_vm *vm)
>  	bool bound;
>  	int idx;
>  
> +	trace_xe_vm_close(vm);
> +
>  	bound = drm_dev_enter(&xe->drm, &idx);
>  
>  	down_write(&vm->lock);
> -- 
> 2.34.1
> 
