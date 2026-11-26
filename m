Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295A9606A323
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7qJ+TR0;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kza0da9e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 792DF1121B2;
	Thu, 26 Nov 2026 09:01:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C161121D1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Nov 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795683696; x=1827219696;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BGAC1JI1AC6HgHHMjH8SeoQP9O0F2gWSJnGj0ViT1Dk=;
 b=Q7qJ+TR0eMrPbyF/6z1BTBvMEKfMWZeflD7UX5/zvixSFmydHmA5rhkQ
 uUkCs7i+H+SNw6gF8+0xEfNgokG3GXeQ8nZRHLLtY24onEXmhnDqUrYhX
 b8OJucOr2GnzksErcnt2kPHEptVeKrDj2GZq2Egw3V3/KyHXkPn5dRshU
 uokDvfKVGsWkJV8B8wBP78N3ueVYbSCO3rwEdaDsKjnOPm6oeVYVLSYdT
 Tig0eAwll9YCK+r6UlVZ4cnsC5KCkgaCRLNzXM7IYTm3SvlBdF1BGqr/P
 QYG1a6LIXPnrcmZpMTlF9vKX6ScuonVL8Z8f2FdDzyB4UWb1i7ZwtcV9z A==;
X-CSE-ConnectionGUID: 9trTfYyUQXmX5jr2UKtAWQ==
X-CSE-MsgGUID: XvPJl49xTCuB1j/CZTLW1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4537408"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4537408"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:01:36 -0800
X-CSE-ConnectionGUID: B3/dAcrXSRiKdjHzeHGQ7A==
X-CSE-MsgGUID: p9lF2W/NQQS9L+gNUytY/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="14155623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:01:35 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:01:35 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 01:01:35 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 01:01:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2UIRqkj2UalJLl5vIIsyc8x2kPYdkfV9H5eJUenSDChUX4CNhkjw1SiMfT+4MSF8xWQCapqtLlkxExNzY2LXkTGuuwVrNxddXVJ6V9Gz6ws15ULNjWZwLH1fZpSktHh07GdZzsryqPqUHTfXm657r7+1VMvZGgmHFa9YKK0OA8ReSZ6SjgfTUKRUl/Fy972x/ko5Kf3iv1Tvw1azlgv60AnpCLUPRXbOKnVnc1tjULMBkATIXn22FMB8WcGeIwwA4IeFoT6cqymxEu4sJt8hB5UqUHaCpBeIJHn8D7Teus9Jo2/3zR+LWW65YdIKAj563HDdQb681frkUVzIrR1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EI7Wker7Q15jlRc83D+VlAAoLBP4c9/YVnBL9Vna5vQ=;
 b=UXflFEVplBgYXRl700iJZRuLIgrMnk5XHijIiRJQesOeX8Db4so9iwaQg6aWvuWz8IAkBACPDCdnhTcd+lH0A4T/WPXR68qNtcqdf4NXS3VJX5BQq+AcpicZuBGwlQuTwizWEUI/elxe6E8OdHEQFehFlzL9ct2/mv74foPeHAeuuDpHky6dxQ0TOrMgo0RbKETVOe79oIHs6m5286fWOV2Q1TQ7VK9Oh6gzUacMlWY+IFvOCIUVy5pdqIEXojWMgevzhzUpQSq5SOm+n484B02nS6zVAb07E3pAUrUZ7WXKGP9UwmWBnu+wc40/KvA8FfF4w8kMJw3FhNPD4u04WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EI7Wker7Q15jlRc83D+VlAAoLBP4c9/YVnBL9Vna5vQ=;
 b=kza0da9e5ygOGoU16+ZxsC2zeSuHktDYcIPtso5lfOlBRyywESnEVSzGG4QND10+XhLjX+T7l8TqSFdwDdITNYILPrELCD07cD7QxutA5xhZDQDGB3LHXXSwv7De6RQa6Jf9auCo75YmRYayij7XVGchnua1hBd+PJXuvb0sEZY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by CC6PR11MB063051.namprd11.prod.outlook.com (2603:10b6:170:204::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 09:01:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0662.001; Thu, 26 Nov 2026
 09:01:33 +0000
Date: Thu, 26 Nov 2026 10:01:29 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 1/7] drm/xe: Define partitioned VRAM manager types
Message-ID: <20261126090129.rtdp5s7b27lzbxxr@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
 <20261116094523.2484301-2-piotr.piorkowski@intel.com>
 <cd218231-993f-4661-adf6-38d771f58d90@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cd218231-993f-4661-adf6-38d771f58d90@intel.com>
X-ClientProxiedBy: VI1PR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::14) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|CC6PR11MB063051:EE_
X-MS-Office365-Filtering-Correlation-Id: f940329b-7766-4c51-f85c-08df4b9bde80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|10067099003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: uLPOMBSfDsPXejHL672L30Fnfi559KiN/3kBlkwfAVHHFXJlNG0HmZQYxXbeyr7v5hZD4N2FycpE9dJEQpM4oeQKq1+9HYAHwYV2pfHX2fMl89jgWw8AL2a6I0be4ut7n0iTejGiUEWQtS+qRUIYIQDBWrkN0dfTxEAKnOVX3Oj8UnrT3eb9uzClkJ+/Owh9VYVyaL3ELlmYxLVB/2HO5fkWbKGOgrAAvqDIyj+sxF3BqpaAxPqD/1Vo1YHF7eTsDsH7DG9Rbw7jF0Sr/NIfU1PqGDydR83FODs+Uk0hLmaIdSGeeDNkF9Iwp0kBHdNj7zdbwVe8Vq8J2NAwCpCBUvhhx2WaBkqi8GJ6utgGdvVQjWRKWepc/3/kjTyXNxNl1Olm2/6DEv5nOybt27zAn3fbiVTLuC3pM3j4QsnRQ2koHZR9KWrdJ/hDPbDSBXm9oaOwTmljl/Rps95ENwVeteWvSzJBbz/UrZQDEqAXgRuHLOjdpZTue3nzaQqnyLu8BxJ4X+TLFgOXGi3uExZB2DGgOQuC1VqEMHizevF2OppuTYuOsaY5rng+zAlG1CEgLhSEVPubPX48ea8DBCGd/i3h1lf5OiLd3qBPuvwLtfrwOp0+mv0b19eqY9JlfHnhFYDaLWI6PEMEO1Jgw7p558+NsufiKEC9Sl/GUoJfwVs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTBzS2wvcWRJSjJKM0lxZkFaZ0JHcUg4eVV1WjBGVHpWbnN4d2FVbXpWM3g3?=
 =?utf-8?B?Qmk5eE5adlkraGh2VXdaaEVXckc4bHhGM2Q3SC83QjhzQmRCUEh2YUdCcTZo?=
 =?utf-8?B?NE9FaEF4bHBqNStHSW1KR0hyRzB3dThXSW15N0IrRS9RQkVHNHpxSk92Wmwy?=
 =?utf-8?B?Q3NPdkgwOXp3Q3d3RW84ZklDeGtJVlQzRytmeGt0SmlKOWZYaWhQMWREZ0M4?=
 =?utf-8?B?SVZ0TklUSzJ0T1pvWmtKWElmeFZoVlg4Z2g4LzNPYi9LbWxVQ2svaE9QdHYx?=
 =?utf-8?B?bTdVZVl0SFdqMldtTndMUFhoOXBWRjR0ZDhLdm53U0Y1RkRjVmhiamxNNEVL?=
 =?utf-8?B?dHp4bGJXZy9ibGZRT1lEZnQ0RU1HSGJSNnErV3FRZGdsVExCemFFM1VnT3h1?=
 =?utf-8?B?MWRVR2duWDMyQ2xsYm1BcnNlMzlpdmJhemMvTlFjOFJoazBON1Fsa0MzNlZM?=
 =?utf-8?B?MkNZZGNzY3o5cXVsblJmclgveDJNTDBYQnFkeFJxb1p6bDRQbFlsQlJnUGFu?=
 =?utf-8?B?ZlV6MUlybkw1TFZJNkV6ZW5ULzNqQ3RFVnl1R0p3WjgvZ28vYit3Sy9hT01E?=
 =?utf-8?B?QmJ5MERnbXN4LzBLZFJVcVlSL05LZlZrQm5tR0dkMXM4MVRBUnRER3hSb0VS?=
 =?utf-8?B?OTR0cUFJSXBJSTFzTTQzeXdpajdib1JaaWhXMklPWG9kUzRjckpLU0NoYlFx?=
 =?utf-8?B?RkVqT1gwamNpSnlWL2xQZ1pzWlY2T1hFZzFQR2xlbkg2cEEyM2RtQXFsdlpu?=
 =?utf-8?B?dVdiOVRWTVMzWXhsUVNTSm9kVncyNWVtL0ZFYnJ5M1c5bGtQMFlEV0V2UXlY?=
 =?utf-8?B?bktWR3NscGJGZDFIa1NsYlQxUjZQbnVNbDlUREJSYzJVQWtvSHdLMVRyc0sy?=
 =?utf-8?B?cW43ZmhEMTZpamI0YXBTUllIRGZOc0NwR000cDYrNzlXT2lqMWhOcFhXS21T?=
 =?utf-8?B?MXhmemMrcGtPUWtaZGtqb0dPb2ZzZGxzYzN4b1M2cGtRUjVDUEZTMGZId3pZ?=
 =?utf-8?B?Q0FtRklLU1RleUFNWnVsSnB6SG8wTkVGcE4vMkdXZGw0M1ZpMVprZmNzckV2?=
 =?utf-8?B?WitVc3JTSGZRYWU0SjBoQWVWRmF6WVloTHlEUDNncXJzM0VvK2JMVnIvdk1C?=
 =?utf-8?B?cmlMSFBLMlQ2Y1VYZlYxY09hVHJVMmptNG5wZnFSeHQ0clFMcXlSelBpTy9i?=
 =?utf-8?B?aE9sSlZhbk1BcThNb0pLN25hZFZuUms2aEIxeSthYUNYa2VRZTdlbG0vMVZH?=
 =?utf-8?B?T0FYRXI2MUhEQUM2clQ4Y2hlZjlnVGd5MloyUlZvU2hLVTcyS2U1NjBQMXpP?=
 =?utf-8?B?NFA0OVpnSXpXRkRMTWhQanNxRnJYWUpqRndsTDErL0dZd1RiRjFnME1oQTNR?=
 =?utf-8?B?cEIrUnRGU0ZpNzVldFNZV3VyQ0QydmVFaWozNk5jeHZEZndiNjNvZUIzRzha?=
 =?utf-8?B?UEh5RUFnd2ppZ1ptR3A0RWJhb2diemZuQ3dacVlEL1B6aE1wNExyaWFKODNa?=
 =?utf-8?B?TzVTbG4yOURUOXhNc050MVJVM3R2aDYzbzRDcWtEMDdQOExnUzMzT01jWGJQ?=
 =?utf-8?B?ekVmb0xPdzBrcDVJQXBNc21KaTdwNzlzcngwYVJrYjBHL2JNRnhvWjlRa3Nj?=
 =?utf-8?B?WHpzdjFSVWliVHllRXVLTDhDYkxUZ25WN0lMUThxTkdYNnZFMW1JQnhMTHdP?=
 =?utf-8?B?UHZoaTJqYm9YUWp4NHlmQ3I5Wm1SMEoxaGdhSlZ6RnFWY1pPbE5NcVh2TkVr?=
 =?utf-8?B?akt4ZkNHKzllRmtqZjUvVlZXakpVV3NmVTJEOXpLS2oxT1Q1S0FRU3ltVmFR?=
 =?utf-8?B?OTIrQ3kvSzNONUhjVlVBRWRPaTJJc05QZWN0OGhVa0hHM3Bpd1IvSzhTNG9L?=
 =?utf-8?B?SVlCRHFBZzNid1BaRnhPWUZScFMxNlFtS0VOU3ZnZHZGSmxvTUk5SU1FTStu?=
 =?utf-8?B?cnViNWorY3UxeUw0OTdPR0Zibko1eFE2SmFKbFFvR3dqSTBHdUh6NXhNZ3dY?=
 =?utf-8?B?WGlqNUlBYTg4d2E1ZjhmQjdhTVZqQkV5SXM0Z2Ribktwbm1zbUZKNEptYlN5?=
 =?utf-8?B?QmVXa3FUbW5MREFTRHUxSFBqeE4rbFV3RkwwTHFaNFR2dnl2MTVtbzVsenVK?=
 =?utf-8?B?NmN4TlI4WDdxSGc4NEQ1T2gzUlV1RnJGZ2JOMTB4MjRGeE9KWVVVUGdiR2cr?=
 =?utf-8?B?bFZxeW56NE16RFgyZUNVN3UwQ2lobmt0bkV6VUlKajZTb2RWQ3RNb2dKbUkw?=
 =?utf-8?B?eHRhRDlGUVQvLzEwNVM3QmxvTGt1Z0w5WWQ5amVWakIrVi94YTB6a0VzbHBJ?=
 =?utf-8?B?VFBjVjdqM2ZIN29uMzc2d21McUdsemk3NGJlYUtOcmdHK1E4dCsvTHMvbTEz?=
 =?utf-8?Q?2cl+Ne9B91GD+F6o=3D?=
X-Exchange-RoutingPolicyChecked: E9SK8JYa6vVamJdT5zDMt0AXqf56YdLxrYP7ZS8tPmLmE1QssaU2QT4khWhZ9fBOcjzf/g5CXPM3jF/5cbSfEkZxSQ+z4OZSa1PZCUXC/uc/TFG5szKAIo9a6336FnUl02zdCwpZBaC6A6KOVVQABu/mIuZLVp0Z6EOQCSsWssL2q9393Tdj9Yd4I202Zai3zwSv7GRyp/Jx3rNAbdKewrBbR7PaLuJzA1W7r+7kxZjM2KrdIEKAS5Ttl9yqarj/i6EQFTDSr6NYiK7f6SUoEsPYBkebw8MQ1Yvujj52m8GX7QoFu7PTlPjnlOEUKxJe2wgVZmd8ixspDdeuv7cnmg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f940329b-7766-4c51-f85c-08df4b9bde80
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 09:01:33.6567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LjB19ngm/52O0rTYDVqLuyrMKl+Cb75l/wXTkXkTKO1lOCkeTRLrxlX4wrqexS5Om+7YlaQB3Iemjk+lk3WXOckPNLTEguy4il6Dcked78o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CC6PR11MB063051
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Matthew Auld <matthew.auld@intel.com> wrote on śro [2026-lis-25 14:30:17 +0000]:
> On 16/11/2026 09:45, Piórkowski, Piotr wrote:
> > From: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > 
> > A VRAM region may need to be split into hard partitions, e.g. to keep
> > kernel allocations in a dedicated low range of VRAM. Expressing such a
> > split purely as a placement range would turn every VRAM allocation into
> > a %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm for
> > what is really a hard, statically known split.
> > 
> > Describe the types needed to manage each partition with a buddy
> > allocator of its own instead. struct xe_ttm_vram_mgr_part ties a buddy
> > allocator to the VRAM pool it backs, the manager holds up to
> > XE_TTM_VRAM_MGR_MAX_PARTS of them, and resources and offlined pages
> > record the partition their blocks were allocated from, as buddy offsets
> > become partition relative.
> > 
> > Each partition also tracks the CPU visible memory allocated from it, so
> > that usage can be reported per pool purpose, and the alignment a
> > partition base must honour is defined next to the partition itself.
> 
> What about calling it "zone/zones" ? That feels more natural IMO and would
> then match what core kernel names this IIRC.
> 
> struct xe_ttm_vram_mgr_zone {
> 
> }
> 
> struct xe_ttm_vram_mgr_zone zones[XE_TTM_VRAM_MGR_MAX_ZONES];
> 
> I explored something very similar to this in the past for visible vs
> non-visible VRAM, where you model it by having an array of zones in the mgr.
> So zone-0 is the visible part and zone-1 is the non-visible. From allocator
> pov you then also don't need to mess with bias range stuff, and rather just
> have two separate allocators, but there are ofc other complications with
> that.

Hi,

Agreed, "zone" reads much better. I'll rename it in v5:
struct xe_ttm_vram_mgr_zone, zones[XE_TTM_VRAM_MGR_MAX_ZONES], and the
related fields and helpers.

Thanks,
Piotr
> 
> > 
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 46 ++++++++++++++++++++++
> >   1 file changed, 46 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > index 4a2cd27a5b617..1da3c82b28585 100644
> > --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
> > @@ -7,8 +7,46 @@
> >   #define _XE_TTM_VRAM_MGR_TYPES_H_
> >   #include <linux/gpu_buddy.h>
> > +#include <linux/sizes.h>
> >   #include <drm/ttm/ttm_device.h>
> > +struct xe_vram_pool;
> > +
> > +/**
> > + * struct xe_ttm_vram_mgr_part - Partition of a VRAM region
> > + *
> > + * A VRAM region may be split into disjoint partitions, each managed by its
> > + * own buddy allocator. An allocation belongs to exactly one partition and
> > + * cannot span partition boundaries. This lets the manager allocate directly
> > + * from the requested partition without resorting to
> > + * %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy allocation
> > + * algorithm.
> > + */
> > +struct xe_ttm_vram_mgr_part {
> > +	/**
> > +	 * @pool: VRAM pool backed by this partition
> > +	 *
> > +	 * Once the manager is initialized, pool->part points back here.
> > +	 */
> > +	struct xe_vram_pool *pool;
> > +	/** @mm: DRM buddy allocator which manages this partition */
> > +	struct gpu_buddy mm;
> > +	/** @used_visible: CPU visible bytes allocated from this partition */
> > +	u64 used_visible;
> > +};
> > +
> > +/** XE_TTM_VRAM_MGR_MAX_PARTS - Max partitions of a single VRAM region */
> > +#define XE_TTM_VRAM_MGR_MAX_PARTS	2
> > +
> > +/**
> > + * XE_TTM_VRAM_MGR_PART_ALIGN - Required alignment of a partition base
> > + *
> > + * Buddy offsets are partition relative, so a partition base has to be
> > + * aligned to the largest VRAM page size in regular use, otherwise an aligned
> > + * buddy allocation is not aligned in the region.
> > + */
> > +#define XE_TTM_VRAM_MGR_PART_ALIGN	SZ_2M
> > +
> >   /**
> >    * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
> >    *
> > @@ -19,6 +57,10 @@ struct xe_ttm_vram_mgr {
> >   	struct ttm_resource_manager manager;
> >   	/** @mm: DRM buddy allocator which manages the VRAM */
> >   	struct gpu_buddy mm;
> > +	/** @parts: Partitions this VRAM region is split into */
> > +	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
> > +	/** @num_parts: Number of initialized entries in @parts */
> > +	unsigned int num_parts;
> >   	/** @offlined_pages: List of offlined pages */
> >   	struct list_head offlined_pages;
> >   	/** @n_offlined_pages: Number of offlined pages */
> > @@ -47,6 +89,8 @@ struct xe_ttm_vram_mgr_resource {
> >   	struct ttm_resource base;
> >   	/** @blocks: list of DRM buddy blocks */
> >   	struct list_head blocks;
> > +	/** @part: Partition owning @blocks, set on successful allocation */
> > +	struct xe_ttm_vram_mgr_part *part;
> >   	/** @used_visible_size: How many CPU visible bytes this resource is using */
> >   	u64 used_visible_size;
> >   	/** @flags: flags associated with the resource */
> > @@ -73,6 +117,8 @@ struct xe_ttm_vram_offline_resource {
> >   	struct list_head queued_link;
> >   	/** @blocks: Buddy blocks reserved for this page */
> >   	struct list_head blocks;
> > +	/** @part: Partition owning @blocks, set on successful reservation */
> > +	struct xe_ttm_vram_mgr_part *part;
> >   	/** @used_visible_size: CPU-visible bytes consumed */
> >   	u64 used_visible_size;
> >   	/** @addr: Faulty DPA reported by HW */
> 

-- 
