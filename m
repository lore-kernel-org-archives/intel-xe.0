Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B1C83F26
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:47:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706A310E027;
	Mon, 28 Jul 2025 19:47:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQY+u/Bk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFF910E027
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753732070; x=1785268070;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkooGc8jdIJKU0TXCvFJXLg4KHU3bjjFYiDQdTImZuk=;
 b=LQY+u/Bk4LZSokhS6mSSrm6DK2SgU7p20yjTr6iYpde+QYLBoGWqwKb5
 O/IqOSVq/wbg6AiNL/KhAThCuwgrfPTahbNGqMTSdRBVhjksMgccMJlkJ
 wlVvoav4YEVMMa8yW7MBk2Z/Yvmh/ggbm3n+YwTYfHEHLfeDRhQm+CzVq
 Jqm13titehTPSToWEhZAHl4X0L4sfmfQT4ioDYdYaSOwPRs0KewW6Pmj7
 ni8sne4Sq6GGioYzWCCfQbRY5WAQtr7noERWACHWSxDc8GFpLt+w6gswM
 CNM19F5H8Ta598fYJeerItart8Whiq1xHwvkdPPzgy+zF3/dDXXl7MBfo g==;
X-CSE-ConnectionGUID: JWxOJDCWToyCi9AtwIAwEA==
X-CSE-MsgGUID: jXQqUCs1QLSlemUoX1UNlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67425882"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67425882"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:47:50 -0700
X-CSE-ConnectionGUID: s6u8aZ4MSGyKDyLCP38gfg==
X-CSE-MsgGUID: 1fqkBgBAQJ6L1PYZZskwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162851840"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:47:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:47:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:47:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.67)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 28 Jul 2025 12:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZbqbkeZaoHEiaYkPFWD+vaqX4KsMnRsXIR7s+OckX+8Faz6+Nwyo7raSc41WS3mD1FX6OTQw+uz8iiN6nVnw/CzZSzfFSHvF/CaQKC414YpGcS8xKOWM5uoggBtz3XyPvXT5KycKRzLCCV63BCE1+qN2svGXnoy3GL6CpRSQqLmXQlK+Ji38fh9NJWXF5jZIn0w1YU+Ge3WBzyW+LkLLt+U9DR10Za/4jgt/XToUpTM0qgMezHKULIDlf/6JOOkXAmCBc0+t0oCS4ujc2eIGb9XPH50xmzq/HKcXDqocrwdy4QUzAAQ7j9BvOa6BLCiQI1Iqqk/mWZWU8+vibbAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ft5oznTRPlq14MSb7WjV0kFj9XrsE7n7HLEtSTeVaw=;
 b=StDuaCEsocBBDK8uHJO8PbeyAB2kERHNQ71+oEo/wWc7YNSEz3Tm6WEqL8vYyDwTL+P3d9oyCG1+kVhItcNP7FOTS6fjAUv/Nq270Z5+i6cBqQ7P+AVP3/lrOf1t8H/2oJ1xrqeUSmqFVsBS7r7ESrC/MfAF5CnRWuuhie4gk2/4W8xWICKaIMf+4DAwzePfbHSm+u9v59OEMIJ10m5oOvEw+EhCGBXNrYRUxPRTzrvJIASaTTnNhoO/mZ2PdhXs7KorT3dNrNB9A+N8tfnuqW2LD0uGKdzogalrcPG/hwkdolXVGIARCa1jefJ+1LlibeoYYNLWYrLSvDcSk97PsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6776.namprd11.prod.outlook.com (2603:10b6:806:263::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 19:47:45 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:47:45 +0000
Message-ID: <f7dcd9c0-8bfc-4355-a568-0b411006893c@intel.com>
Date: Mon, 28 Jul 2025 21:47:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] drm/xe: Simplify module initialization code
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250727172009.587-1-michal.wajdeczko@intel.com>
 <20250727172009.587-2-michal.wajdeczko@intel.com>
 <aIfRHZEKzMeyCBRf@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aIfRHZEKzMeyCBRf@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR03CA0055.eurprd03.prod.outlook.com
 (2603:10a6:803:50::26) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a0af6fe-95d0-4529-ab72-08ddce0f9f3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dCtLekVaMk5iR0NkUmwvemJkMXlodWRxRTlINGh1L0d4S1o2TDJnU3JxZ3Bs?=
 =?utf-8?B?aHlFc0VNL0h3OFo1ZGtpUmJSZWJuRjllTGZBOWZCcEJFZ0lGczhBdC93UWcw?=
 =?utf-8?B?UEFWdDQwcm81ZWJZbzMrUTN6K0ZTZzF6N3Q3anBuZ0dobThBYTI1dDFYT2ty?=
 =?utf-8?B?Ynh4U3E3b3VlL2RVVjhKdkxXTzV4MzNYMk1aQnJmMm1NTGxtWm1oQXF2d29s?=
 =?utf-8?B?NHFkSW1OMzRhUjlCSzJmMi90eHlwcHJGdkxCckNPNTJkNUJrMEVsL0dmR0tK?=
 =?utf-8?B?QUtUaS9pZGd0ZHJZaFlDZTFvb0ZGckJJdHhnNFJyM0hGbzZHSXhEaXBhN2tI?=
 =?utf-8?B?QU9ZbXhyN0N0eENWOFNyY04rM3NkaU1WcmJFQWFCV28wZENGdDhpRWlPakNa?=
 =?utf-8?B?eUQ5a1VFZ3ZWelZpcThwOTY4SmZnbktmVWcwY1RVSnh2SElKd0JweGZiUTI4?=
 =?utf-8?B?amRjbHhod3J4aUloeDJhaGNjbHk0ekdXR3pkV1hITlJ6ekF4YkhzWmZvemdH?=
 =?utf-8?B?MmpTRkErazMvdy9hUnpabXBqV3p2MW5MM0N6STYvTVdIQUFpeWhHZUFFeUJv?=
 =?utf-8?B?ai9qSGNBU1NSL0M3UTV6NjRRM3VuUWJVd3hzYjZ0SjVwd0FtL2RqYjYrWHdZ?=
 =?utf-8?B?aXhVeXVDc3pwUjBlU0t2Wnd5U253b2ZrN0s2T3F0R3BDRFVnNnR2MHBSQ3VL?=
 =?utf-8?B?WlVRS2doekFJV0FmUXd4VVUyZlJUaEZpM0laY0tHZWRXcE43MGVzeldoMXFn?=
 =?utf-8?B?M2p0NWpGdEJmRVRZSFhSN3dra3lsYjRhdmVxbUt6b2dkNlN6MmE1VU8wK24z?=
 =?utf-8?B?T2VROXRIQ0xNUnNHT2FlSXJIQUdyN0ZCWVJrTzhZa1hORTkycmw0amJPQm9X?=
 =?utf-8?B?bm1qNXJzbmQydTI3WWczNXJpaEJtTGVsbnlwb1ZDUW5IcXV3UHJHOHhtY202?=
 =?utf-8?B?YWUzSlBrbUdxay91TFU4ODlsKzVjV0R2SnM4d2VCVm5pcmJTMllkWGRFOHN3?=
 =?utf-8?B?NDZLb3UwVnowTzVobDBtMDZKUnVKUFdUWS9FZ2czVGlBK1MxNStIQjBoS0I5?=
 =?utf-8?B?eHBOTnArenRJRi83aWY3T2ZEbXdPSFZSa29xbjlYcThtY3dKbjEzSTlGY1Fr?=
 =?utf-8?B?V09zcS8ySjVtQVhrcnc4MXY5TndKVHM3N2Y2aC96emlEajNFSnZqODlOV2RK?=
 =?utf-8?B?bHlrSDJQOEc4b2dwVmxvZ3BOODluMFRCVXkzT0U0aUZPdjRxdzZuRlE5MXVQ?=
 =?utf-8?B?a2RmcDIvbGRrQnlkL3VlblllcCtkWjVGZUZzanRNYjIvSklURzJiVmFlaWpv?=
 =?utf-8?B?T1RJSkh2R25wSlVoTG5lSFRqMDRFa0dreGdMSDlYZm9NVG9ubjU3QmppT2I3?=
 =?utf-8?B?SmhZYXZCa01jakRudXp0ZlJCRDRYODhuVjc3Ung5WmFYUTZOWlVLeXBNayto?=
 =?utf-8?B?cEQ0WGdINUY5ZFk5aWRseE4yRVZWRzNoZ1BNK0JlRWVhRFVBUkNQbzZ6S1hv?=
 =?utf-8?B?eDlseEpOZWJ0NUJHTHFJdG5Vd1N5ZFpudC9sWHdqQjVWQlpYR1p2ejlwcHNB?=
 =?utf-8?B?RGtob09PWlYvSHBiSmd5b2Q1RzU3bFBVTjBWWnRuMGt0K29TNFlEM25uaWZB?=
 =?utf-8?B?TTFWWk84S3dvSEtzcGtwb1ZJcGNUYXJhWnFZTjRyL1A5T0VjZ2haakpnWHZP?=
 =?utf-8?B?Z3FReld0STNPckF3TmNqcm9mTTIrMFhJUEw1VDJtWVNnYzdXRTVxZEZyZ2g5?=
 =?utf-8?B?REp2RVNGU2lmUXR6T2YzM3lBTDEzbzE4eVh5Yy9vNlZaYkcrUjFnMXJlcFVr?=
 =?utf-8?B?WE1YQUswR2QzdG1XMlM2UkJMbDJ5eHZqTVM3dm02VGJpeFozWHh3L29ib0Vp?=
 =?utf-8?B?UlU0M1JWZXhmYzFiRzVaYjQ5Y3QxT28rcDdVVkNQQVBvd3BOS0hnR2UrbDFp?=
 =?utf-8?Q?v2sTQdmy49M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJJOTgxb2k0aVgzYk5LVFVESmUvV29wblRlMTJnSEZJTXg0cWppWHZhNjRj?=
 =?utf-8?B?N1YxTUMvQmVCamV2cHM1TzYwSmZMdFFMUXNwSWpWY0UwUHMyZjI5TlB0N2lw?=
 =?utf-8?B?cmpSWSt0SitzTlk5Z2xMMTBTWEt4WE9BL1JKMkNweHpBbFlaQzJhV1VNaE81?=
 =?utf-8?B?RHEybm1OeWpZekpVYlpxMWZwcUYrR0VNeUx4a2lDSXV5N1NXUmxneWprbmVB?=
 =?utf-8?B?bGx0RmJsYnIxcU15UUNIS0N0eitibW52ZGg1UVRFTVV6eE5xbVQ3ZDdSN05T?=
 =?utf-8?B?RngvcHZQeTVsTUkrRTAyNEV5ZXMxRldjTjVIWUhyeXhtVVVMSHczVlJpcFVm?=
 =?utf-8?B?WTRFNEIvVWcwRzA3R3VEOG94RUVaRHE2ejI2NzFkUS9PWHNMaDhkOGdBUWgr?=
 =?utf-8?B?S051L2VjY1R6OGRIa2NwcEJWT2NCT2x5V0o2RVF2YktWOHVid1Q5c21rYkoz?=
 =?utf-8?B?SmJETDBqKzl6RG10VFlXd0tTcnIrRUNESWlzWW1ld3o4dVYrNWs4eTVkYzBV?=
 =?utf-8?B?YTd3Y0F6Nnk0aEFaSHpNd0EwQVFFNmo2MFcvNmVzWTh3eGk4MTE3YVZESjZK?=
 =?utf-8?B?a3ppL1BWQy9oaUhpZVJZZjlLNG9ETEFGOVpoeStXbXlUeTBxaVFOM2tuNkpv?=
 =?utf-8?B?OFJ6dkttM2RHa3lja0loSFJtMlU3ZFRvWUo2SGwwdW1Vd1JoME0rM1d4MHJi?=
 =?utf-8?B?QXU2bnVsbEF3bGpXQi84MEpVajF0ZnNtcFV0cFI1RzVSV1hXMFU0NU9VS2tO?=
 =?utf-8?B?aC9sYk1UV0M2QUJxM0dENTdpWDBUN0svMm1POEpEV0dBWUpPVW1UNXM1M05S?=
 =?utf-8?B?NGRjcmYvNUYxc05PZkxOcGtDQXNGWGtaaktjWi81M1FoMjdHTlEzVjJQZHhG?=
 =?utf-8?B?L3M5VktDY0dIVjQ4WWdxY3B0L0IxYXN1YTdxd0UzTkZjS3NvVkJSNm9WdXV4?=
 =?utf-8?B?YkVEYnFrRXZhTWVwWVIxRzFPbEVyanIyRU1pcUF5bGZRWFl1ODc5aEpLRy8y?=
 =?utf-8?B?VFhZT2JHSXZiTExuRjYxK0sweWI4M0lWY2dmR05CdzNhekw4YW5DV0owLzRv?=
 =?utf-8?B?Z1JTNUtaUFZWNWhlbU9kMHlyVmlJL1l0R29aL1JtKzRQWjkyb0RENEdITUhs?=
 =?utf-8?B?TitjM3FwWlVxQ3FZalhGOGNJVlRETUxodTUyTTFIcXFJUFVRV1EzajF4SWNY?=
 =?utf-8?B?cHR0RWViUGpOSUttdlg4TEM3b3hoaG9wc1I4TGxRRE0xRmZxTithTHpBaVdr?=
 =?utf-8?B?eDJBNlVOMzVwQnp1Ykw3TTJFMFlEaG5UYk5kRndxaGdWY1dIZkJQbmtEZ054?=
 =?utf-8?B?NmFkT0NSaDZ0eGg2NUVlUkVOQzFtNDBKZFovUVVhcEhxYUJzUEpoZEtHUlp2?=
 =?utf-8?B?U1VoZ05TOTJub2JNTDZWKzQvS2hCcUZSZGtoMFFlZUNBVHFMWWs2U29yMm9D?=
 =?utf-8?B?ZzRROERjZnllUU5hcWhqNnIvWTlCYVBNeDVSbnJBRGNmNExNcUY0WFAyeUVu?=
 =?utf-8?B?RWhtelhIOGlUNUR0dzVIZWl1QTMxV2orZlhGRWcxdnlkeDhKRUVXTWkxZnoy?=
 =?utf-8?B?ejhDKzdmOUlvWk9Tcm5VNm5JeXhiaHJCbmFhODhsblI3WjNKb1JFWHRwbiti?=
 =?utf-8?B?djdsd0NKU0NObjdGa1pBNStIeFpIaHRSQmNGckN5TlVTSTNDZUtxcEpvNTNX?=
 =?utf-8?B?ZUNJc0JLd1RWMVEwNFZKZmpOd3NIYjBWOFJYNHJqcnluRTR1VVRDYzRrOGRY?=
 =?utf-8?B?SGdia0NNK0RCakFYL082TDZJYWtQRmFGMHBxZy9HekphYVlQeWlXdU5rSlRD?=
 =?utf-8?B?U3BtY2VTTTVMaVA2QXpTQjRNZWlPRlN6QUk0QzM0Wjh1ZTd2THJqdXp5TFFL?=
 =?utf-8?B?WTMxVFNCdllTZEJiV3JObFdtZGR6ZjhsTUdaNmg2TUZEU0d6a1pYTko0SmFJ?=
 =?utf-8?B?ZEQ2d211T1BiVCtDajhvUlVIdFFKUVlBVWpjRnlEbEdXc1o0dXRyYmhkcmM3?=
 =?utf-8?B?YnFiV0FIMCtzSVpGQlc0VitXTTA3OWprNGcxVjRhR3Q4cmluU3FVTS95R0tw?=
 =?utf-8?B?bUNWTXQxY2RoaEp4bWVCSHVVQ2p5UGtuZVZDRWZFWGVFWjFDY2M1clc1N3VD?=
 =?utf-8?B?NmIyOTg4cUZhK3diLzQ3SVFsSVhzOHdHaDFtdG9Pb01FTG9tQno2dnRDY09P?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0af6fe-95d0-4529-ab72-08ddce0f9f3f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:47:45.0618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lisR3iPI8GbR/tboyIcy9cHZ/OQzfV5L5BJcrcasAKlg2mPYlCJF7MBLQa0Kr+JbeiDhrHKWASKZssyj83MnqFN6zBsGLh2rPpwVyRdCkhc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6776
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



On 7/28/2025 9:35 PM, Rodrigo Vivi wrote:
> On Sun, Jul 27, 2025 at 07:19:58PM +0200, Michal Wajdeczko wrote:
>> There is no need to have extra checks and WARN() in the helpers
>> as instead of an index of the entry with function pointers, we
>> can pass pointer to the entry which we prepare directly in the
>> main loop, that is guaranteed to be valid.
>>
>>   add/remove: 0/0 grow/shrink: 0/4 up/down: 0/-180 (-180)
>>   Function                                     old     new   delta
>>   xe_exit                                      109      79     -30
>>   cleanup_module                               109      79     -30
>>   xe_init                                      248     188     -60
>>   init_module                                  248     188     -60
>>   Total: Before=2774145, After=2773965, chg -0.01%
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_module.c | 27 ++++++++++-----------------
>>  1 file changed, 10 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index d9391bd08194..593bc9e5851a 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -135,24 +135,17 @@ static const struct init_funcs init_funcs[] = {
>>  	},
>>  };
>>  
>> -static int __init xe_call_init_func(unsigned int i)
>> +static int __init xe_call_init_func(const struct init_funcs *func)
>>  {
>> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
>> -		return 0;
>> -	if (!init_funcs[i].init)
>> -		return 0;
>> -
>> -	return init_funcs[i].init();
>> +	if (func->init)
>> +		return func->init();
>> +	return 0;
>>  }
>>  
>> -static void xe_call_exit_func(unsigned int i)
>> +static void xe_call_exit_func(const struct init_funcs *func)
>>  {
>> -	if (WARN_ON(i >= ARRAY_SIZE(init_funcs)))
>> -		return;
>> -	if (!init_funcs[i].exit)
>> -		return;
>> -
>> -	init_funcs[i].exit();
>> +	if (func->exit)
>> +		func->exit();
>>  }
>>  
>>  static int __init xe_init(void)
>> @@ -160,10 +153,10 @@ static int __init xe_init(void)
>>  	int err, i;
>>  
>>  	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
>> -		err = xe_call_init_func(i);
>> +		err = xe_call_init_func(&init_funcs[i]);
> 
> perhaps we can go further and avoid this extra function calling
> directly here:
> 
> err = init_funcs[i].init();

it depends if we want to preserve support for unset .init
(I assumed it was added on purpose)

> 
>>  		if (err) {
>>  			while (i--)
>> -				xe_call_exit_func(i);
>> +				xe_call_exit_func(&init_funcs[i]);
> 
> and
> init_funcs[i].exit();
> here ?

.exit is optional, so this will have to be:

if (init_funcs[i].exit)
	init_funcs[i].exit();

but likely compiler will do  the same with current code

> 
>>  			return err;
>>  		}
>>  	}
>> @@ -176,7 +169,7 @@ static void __exit xe_exit(void)
>>  	int i;
>>  
>>  	for (i = ARRAY_SIZE(init_funcs) - 1; i >= 0; i--)
>> -		xe_call_exit_func(i);
>> +		xe_call_exit_func(&init_funcs[i]);
> 
> and here
> init_funcs[i].exit();

since .exit is optional, better to keep one helper than
duplicate code here 

> 
> But either way is fine I guess...  up to you:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks!
> 
>>  }
>>  
>>  module_init(xe_init);
>> -- 
>> 2.47.1
>>

