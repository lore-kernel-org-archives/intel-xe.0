Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13514CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 14:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036710EBED;
	Fri, 29 Aug 2025 14:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UG5fLz+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6491D10EBED
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756479414; x=1788015414;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p+6x3MCbYK40D86Zi2WWzEVi3Q8Z/AUI190x0QsLHjo=;
 b=UG5fLz+p1IVF+W56fGbUP/8vdwet/fGjeiODtFWH4Q63tpNeeAyFcxsQ
 TqyrZ7RpsiVBBbkcKZcETZQxDDX2PNW9ff9YPoFEUkh5UsGEOusibee1W
 68WUIYHtC3feCaHgIRzAlovRjYGQneFRfNhOaHUfyJEPhLUm/x6F4Wbe5
 4cdTn3n4QgZi2acNInCJMqYyXBETKykwDAuFoRugGNqM+qATvvk8TD+ND
 cg8mjPRlL4tAj9yHHNP705PpTZoeYtDu6MU1Sy5AdChNOpHOjsxqIzYQx
 RTSvRKRq4STaRonjpS2a/HfLocZ3Yr09IbAxszCISTvkuqKrpHJHF4Azu A==;
X-CSE-ConnectionGUID: wRtH8ZkDRSmiVDwWxaerbA==
X-CSE-MsgGUID: NenvVAyfQraLKDmzlbFOUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46333540"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="46333540"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:53 -0700
X-CSE-ConnectionGUID: jymBwPuGTl6SJwGhlJziWg==
X-CSE-MsgGUID: 6ai97B2cRpSI75nDxLrdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169653337"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 07:56:53 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:51 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 07:56:51 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 07:56:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXbfEdXOOhp4JQRjDMAl+1tiuUnMHsptn7KfyI5nr6U5xpI14lhwpQQ5lXAgkg88EkdM3/prz1By9pDQHmvi/qN+jhj9VUSxmiHDgVh5J+bXrWRWgwvpbaM4UKrzbgqcsaFGGvo268EPCP+Mkyr72XOrOzPrenoXyFfu3jW8Cj2ZGBUu++SAhiqIYpQWRZQAofrLBHbiRY1Agq/jNhnARS/83wd9CQvwIkfrnKOLKhlgRs9hPM83TgfyIO6xDHS1YnEPkf79d4+s5h9cOYZYgU2yI8LHLtK11umkNPqOYUr3AHH7qVqkoHzZaJYqm7aYJs+U9YYfHKp2MzqTM2x9PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeGVlDI+ZmmSAujLdJlFcqG2ITYmCmpV5U9rmlh3KZo=;
 b=EEmTM+3ygZVErz/DuSNJjlUPFKL3S1e2Tb2tZfs9iZDi+aOvSniZkTG3Ggw6dkgVy0raDRQG9+Nk0CTabLDCLbYA1UfOlaMDzp2DLRkUNJ9Ss6k560PEB5SjRZgmbVZeqpmz4b3DfkWNvMTQI17NLPYNmxQLvvXiYsRPSjGr4kOodi3ZXgRLb1Xlj9LUTRocFhSyE307j59Aec7E+LRWOWh54NR+NuSHyw4xSVSxYVxHUK02U8uQivqn7Gy0vWvl3IfEFPs7QexZzi1fvFb/OuaU/WJaS2QlCVUxiDcQVNEx90JYx1KAzJlXqFEimhPwxTRtrzo5o2ZmZghbkNcUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH7PR11MB8454.namprd11.prod.outlook.com (2603:10b6:510:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Fri, 29 Aug
 2025 14:56:44 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 14:56:44 +0000
Message-ID: <a3bb931b-49a7-41f4-b790-700b49e11ec4@intel.com>
Date: Fri, 29 Aug 2025 16:56:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] drm/xe: Track LR jobs in DRM scheduler pending list
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250827211010.308372-1-matthew.brost@intel.com>
 <20250827211010.308372-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250827211010.308372-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0006.eurprd05.prod.outlook.com
 (2603:10a6:803:1::19) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH7PR11MB8454:EE_
X-MS-Office365-Filtering-Correlation-Id: 7398a29a-7cd1-43d7-5e0a-08dde70c4531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDBwM29FYWRlZklUZ05uZDk2WTBnZWxZTlAvSndhdW5ESnBDWDJjK24rNXNU?=
 =?utf-8?B?bktHNHZVbzBVZmVqMXFVbWMweThVWGFlTXNiSFBmcExUeXJ1MEhoWTZ0UUlN?=
 =?utf-8?B?YlZSMU5TTjcwbmJUaitvdjUyOHNoWmVCL01MS2xFaThmK3pIRkEveWFRT2pW?=
 =?utf-8?B?ZEcyRnM0bnl3dWRIdnFlSGRRazZRL04zQ29iNm13bzdwbUh2R085eG1Qc2xh?=
 =?utf-8?B?Nkl6TlBROWowemk5emJrRTVOM2p4SXJoTk5najlmb1JweTQ3K0lzcGh3Vkg2?=
 =?utf-8?B?ak1MRmNDTmI3a203dzd6NmZwL0tQVmVXWVFkd0RFNDJQK0JBbGlnNmE1RGxW?=
 =?utf-8?B?VHA4KzdCWjQwWCsrWmppd3MrMjV5bExzTDkxaWJHWWIxL0hZNVY3M3RxTlU4?=
 =?utf-8?B?MDFHK0twelgzTVhxT3RSWEw3Y2J2cTQ3cXo1bGtTZmRpeGFJZW1BOFZaeDly?=
 =?utf-8?B?c2EySVdyRW91R2d2c0JQenZiUGJybzk5ekJPdXhSbWJXVk54SkpCUFc2TWlU?=
 =?utf-8?B?TWpDMDRTUndHUVJFeXg2YTNReFd6WERybVR1cHg3N1pac3Rab0VtVGtYMlNN?=
 =?utf-8?B?SGx2bFpXczdUQ2hEVENlQUtYcndzTEltU1RsZEVoQVBGK3FCOU9HeDdoMldo?=
 =?utf-8?B?VTE0Wm41czRXNnQrK2tPM1ZiT0hzWnhReEkrNGRKNkNGaWQ3aENRUWdKWWhy?=
 =?utf-8?B?VE5xSUNja3IyQXdjMVFCSjFUcFFmbnlDa21GVmtVUXJZQWR0NDBTWE9aSGw2?=
 =?utf-8?B?Q2RzSjEwam8xWU93aDAyQ0dZenJUbGx1ZGZJcVJLQ2hUZFdlK0FTdW8zMEQ4?=
 =?utf-8?B?OFhFMWFZUS9jTmNGV3o3cC80bk85NUNYZFRzZ2tocXJTMFhQL0MyRytaOFY3?=
 =?utf-8?B?SDVvWGNtL2daSU41UUlaaGtzZitqN1VqbEZLcGZZeGNHc2k0TU5HVkwxTHJ5?=
 =?utf-8?B?dnNFdzd6UFVDSjk3K3czdElGNXloUEpzRnJLQTZucDVHNEJhVUtiWkRjNGhj?=
 =?utf-8?B?NTlvNm5kRzVtbVBsKy85cEszSnc4dm1aMUM4SkZJeGVCdWZ6cmVpdjg3SUlX?=
 =?utf-8?B?b3JLUlNJYVpZOHJaSzNuYTRKQ3padjNjQkZ0ZnVuYXFuN0oyVUp3ZUNEUThJ?=
 =?utf-8?B?M2ZaVXJlNzJPbjNEUDNyaDJxWGQ3eGhWdVlRbWFVTnV1S3pPOGtRRW5Oc3hV?=
 =?utf-8?B?KzNUZ0h4bE5BOGFkaXhpT1lFU1VEQ3Z5UGtQTis3RUJadTd2Vksrb21tazJE?=
 =?utf-8?B?UUpDTVlFSEJxdUVJSGUrTkdKRGlqTStnVXFJV285SHNob3BZVGNoYVp3Y3FH?=
 =?utf-8?B?Vm1yaWREYVEzY3lveG5hUjdaQ2tNbmw2b2JydU81eUhCcFpmdWJicU9aTm01?=
 =?utf-8?B?R3lkb08rZDNicEtIcjFZR3l1dk5DcHlPOHo0N2pTYjVqMlBLWEozUm1CampU?=
 =?utf-8?B?VWdFeVdZYzd6RjE0TTRSblRwWVpoNkYxUnNtK05VeVI0T1ZvQXRMaHZHdHU5?=
 =?utf-8?B?eWsrNExXOUVPTlp5dFkybHgvUGl6eVFPQmZxeXdlRjdxSzVNNExadFVxT081?=
 =?utf-8?B?ZFJ4NUhsUGh4RDFucUo1TDJQWW1ja09ncU9TdCtCYkM1c1ZYRUYwNlZEcE1D?=
 =?utf-8?B?bitJbERaRVBMM3paRXB2WGZ5S29jdHNhbUViS1lXQmhGdk1UdnVyZjVRVFF2?=
 =?utf-8?B?bW9kTFVmalY5VzNvSHhuZEZYM0RCUUZRcStFSWlOUmMxL0xzelFObHIrbm5K?=
 =?utf-8?B?UTllM0tXWkpoNk1NQU1IRHJkL1RNUnJSSnlHS3d0cm5DRk5rT3RlWnVQSXdz?=
 =?utf-8?B?S25vb2lKYmFtc0VTbkNBWkFCZXMrTEx0ZERTM1liY09rSjA5NkZBMzFTaHR2?=
 =?utf-8?B?blN6WXpTcUgrSFhlaXdBek9zUHBZUWRGT0U1Nisra0dDaDNieTJ3YnVPVkQy?=
 =?utf-8?Q?3E/xuMv3Tgw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDdJQnoxb0xrWElxZHdwN25PYkc1aWRpdjRSbHBNQmI0RnhGaFN0QzBjeWRa?=
 =?utf-8?B?Wkh6aHdLdUh4SEY3WVd5ZEFTTVRsRklBNkQya2oydVYzcDcxMVRuc0k2MzJo?=
 =?utf-8?B?WnBsaUMwbk43Q0VnaldxSnM0Y2pEbjNYSVpSVjM5NlRYcW5LNjNJVFZ3VzM0?=
 =?utf-8?B?TWtMU1kwZ1F5Qm5aeG4yK2NFOVB1dmdlTXl1K0JkN3BKREY5alk2MXAzQ2J3?=
 =?utf-8?B?enZha0FKQ0NVSzJUc1BCd1JOb215SGFQV2Y2NHpubFZLT1RDRXRLWDBueVc4?=
 =?utf-8?B?eWpKOHBoT3N2b2hsWDY3T1VNUktsWDYzTDFQSm9WZkt0dXk1dXVMOXozL2dj?=
 =?utf-8?B?U3JXNVo2NWk0THJUZ2U0UTIrZ0FZeXNJOVZ1YThYVVU5dWMwV3dqclpBMy9T?=
 =?utf-8?B?NE5mSEZuQjRsZzJQTDU0ZkphTW1zcW15cjFqdTJHa1VJUlJodTdTdC9KZk9W?=
 =?utf-8?B?UU8rZGN2MWNHRG55blYzK2IxSGo1cDFML3ZvWUI3T0o4MzRoWVlNeVorRjlJ?=
 =?utf-8?B?blJWS3F3QjlkNU1hTHVId0JPV2hzT2NMUFhMTC9SMkpJT2lEZ1IvVU1xbUNx?=
 =?utf-8?B?c042ZkxBSVU4OHBzOG1tUHpTSTdUY3RZdk9LV2lKbmU1NDFTVVYwTS9wQUJx?=
 =?utf-8?B?SE9XelUzT0xScjZoN2R3YnFOckpyemVxTVhOeEFiNDdZQlg1b0FkNU1paVJo?=
 =?utf-8?B?RU5YazN1cEN5aVl2dWVGOFF4cm5HeXUrMGRNTDJBYVFYaUgrZkxGMUJERk56?=
 =?utf-8?B?L3RNNHVkNklscGJyNmVFY0JHcWFzWStobW1TYldIVFkyM0l3dGVxaWxlR1lG?=
 =?utf-8?B?QmNLb1FObjBUaHdabzBDbml2QXhBYUQ2cWR3T2xRSyticmU5VEZETU1FTGZF?=
 =?utf-8?B?azc1WTV0alJjenA4TUN0WmhoNXNudEsvYndjdDVtcmdVVHlJMzdqU0FqNnFw?=
 =?utf-8?B?VDA0bjhHRHh4eGJOMThOclViSWVvQVFnbjg1QzFUL252OGkydVlDUjM2MGZY?=
 =?utf-8?B?K0NFcklUOEVEM21lSmxmSW8vdGRsYk5VUnpMeTZ0SEdzaTd2b0I2T0o1UnNG?=
 =?utf-8?B?MFlYRzZEdm8vZlU2M1NDNVNxVGNza3N2UWN4WFBGUk5CNnEwd2N1YytXSlYz?=
 =?utf-8?B?NWtCSGJhbzZZQ3dnc0R1Q0tiT0oxMkI5QVJtejA3MDlnWDJES3I1RzRid1g1?=
 =?utf-8?B?WmNMYitVTDVmd2s1dC82QzJqeW9JQW5acmxlWm56SUdEeVhJUHN1YXM5LzVp?=
 =?utf-8?B?RDR5UjFCd2RCS1lrakZhWEhpdEwyM2VjbzJHUVZCODJwT2pNV2VOR25pYnFu?=
 =?utf-8?B?L0NjSGVBMmpUaXZQbEc5SC9mK1EvYkJKb2JvVFZxdXMwMUhPa3JpSTRGQTBE?=
 =?utf-8?B?OUhLTzE3Snp4OVFBT3EzK1pESUVSRWhvRC9ORUQ4WFAweU5zVVB1VXRYVnlX?=
 =?utf-8?B?RFhEdmtrenhhWDFCanQwU2NEQ2JLK0dNVFIrNXJ5c0I5VWpLMFJwNG1HRFBu?=
 =?utf-8?B?UEdPTWlmMkloV1hvbUVYeU5qQXpRL0NQNGdiSHpPUUoxai9LNjQzN0JvaEE3?=
 =?utf-8?B?MlB4eVlHSVlESXgrZGxweWRDNXVMNjZCN3FKaGlvQW1uS0ZQS3BrYnlTRDFJ?=
 =?utf-8?B?TXRaK0xDVkxmTnkxY2FpZDBQb1RZa1FacjgwQS96UzN1eUFyZUFXTnhhMzNS?=
 =?utf-8?B?a3BPZVJYWWhsT2cxSzM3QSsvcjhQaitva09sS3FSUjUwc2g2WjkxNUpNSWts?=
 =?utf-8?B?QzJVT1VFSlpoUGRER1l2dEZOUUpLL211ZFl2L09vK3c2NU80ajU4c1poSGVN?=
 =?utf-8?B?Z3VsN2p4R1Byd21QYlhGVXRSTlcwRWVLeVk3R3lZTjV4c3FGem5IaFF2MnJk?=
 =?utf-8?B?Z0ZWSXF4U0FKMVczSklMbkQ4cnVHa2lGSkM2aUI5c3gvR1JZa3ZzTXdrSUZp?=
 =?utf-8?B?NEYzU2xzZndZeGIwN1M1YzJhQXdFSjVFUmNjYXNac2RKVUxuUlBmR21FV1lL?=
 =?utf-8?B?MVlqS0JleTdjL3FKZVZvblR3TFNPUHdSWmM4R3dOMHBWT2paSXZyNWtMcHYy?=
 =?utf-8?B?U1NaREV0Q2N4VGNlT0YvbWY5ZFAyV0Myb2FjOVFaOFZZdldPTFhsbkVKeHpz?=
 =?utf-8?Q?C7XgEEe5uTkpoI3M43iTmhNSq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7398a29a-7cd1-43d7-5e0a-08dde70c4531
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 14:56:44.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zHJLkfY6TdTVHYHN0X+X5PAr673D5wF/qa6jYWxdPjFO2N8KIIyq8gwQ7t6bXz9vyZgcDHbNR3cXblPph0a+Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8454
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


On 8/27/2025 11:10 PM, Matthew Brost wrote:
> VF migration requires jobs to remain pending so they can be replayed
> after the VF comes back. Previously, LR job fences were intentionally
> signaled immediately after submission to avoid the risk of exporting
> them, as these fences do not naturally signal in a timely manner and
> could break dma-fence contracts. A side effect of this approach was that
> LR jobs were never added to the DRM scheduler’s pending list, preventing
> them from being tracked for later resubmission.
>
> We now avoid signaling LR job fences and ensure they are never exported;
> Xe already guards against exporting these internal fences. With that
> guarantee in place, we can safely track LR jobs in the scheduler’s
> pending list so they are eligible for resubmission during VF
> post-migration recovery (and similar recovery paths).
>
> An added benefit is that LR queues now gain the DRM scheduler’s built-in
> flow control over ring usage rather than rejecting new jobs in the exec
> IOCTL if the ring is full.
>
> v2:
>   - Ensure DRM scheduler TDR doesn't run for LR jobs
>   - Stack variable for killed_or_banned_or_wedged
> v4:
>   - Clarify commit message (Tomasz)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>

-Tomasz

> ---
>   drivers/gpu/drm/xe/xe_exec.c       | 12 ++-------
>   drivers/gpu/drm/xe/xe_exec_queue.c | 19 -------------
>   drivers/gpu/drm/xe/xe_exec_queue.h |  2 --
>   drivers/gpu/drm/xe/xe_guc_submit.c | 43 ++++++++++++++++++++----------
>   4 files changed, 31 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 44364c042ad7..b29b6edd59e0 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -117,7 +117,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	u32 i, num_syncs, num_ufence = 0;
>   	struct xe_sched_job *job;
>   	struct xe_vm *vm;
> -	bool write_locked, skip_retry = false;
> +	bool write_locked;
>   	ktime_t end = 0;
>   	int err = 0;
>   	struct xe_hw_engine_group *group;
> @@ -256,12 +256,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> -	if (xe_exec_queue_is_lr(q) && xe_exec_queue_ring_full(q)) {
> -		err = -EWOULDBLOCK;	/* Aliased to -EAGAIN */
> -		skip_retry = true;
> -		goto err_exec;
> -	}
> -
>   	if (xe_exec_queue_uses_pxp(q)) {
>   		err = xe_vm_validate_protected(q->vm);
>   		if (err)
> @@ -318,8 +312,6 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		xe_sched_job_init_user_fence(job, &syncs[i]);
>   	}
>   
> -	if (xe_exec_queue_is_lr(q))
> -		q->ring_ops->emit_job(job);
>   	if (!xe_vm_in_lr_mode(vm))
>   		xe_exec_queue_last_fence_set(q, vm, &job->drm.s_fence->finished);
>   	xe_sched_job_push(job);
> @@ -344,7 +336,7 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	drm_exec_fini(exec);
>   err_unlock_list:
>   	up_read(&vm->lock);
> -	if (err == -EAGAIN && !skip_retry)
> +	if (err == -EAGAIN)
>   		goto retry;
>   err_hw_exec_mode:
>   	if (mode == EXEC_MODE_DMA_FENCE)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 063c89d981e5..a419f4bd3ab8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -816,25 +816,6 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q)
>   		!(q->flags & EXEC_QUEUE_FLAG_VM);
>   }
>   
> -static s32 xe_exec_queue_num_job_inflight(struct xe_exec_queue *q)
> -{
> -	return q->lrc[0]->fence_ctx.next_seqno - xe_lrc_seqno(q->lrc[0]) - 1;
> -}
> -
> -/**
> - * xe_exec_queue_ring_full() - Whether an exec_queue's ring is full
> - * @q: The exec_queue
> - *
> - * Return: True if the exec_queue's ring is full, false otherwise.
> - */
> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q)
> -{
> -	struct xe_lrc *lrc = q->lrc[0];
> -	s32 max_job = lrc->ring.size / MAX_JOB_SIZE_BYTES;
> -
> -	return xe_exec_queue_num_job_inflight(q) >= max_job;
> -}
> -
>   /**
>    * xe_exec_queue_is_idle() - Whether an exec_queue is idle.
>    * @q: The exec_queue
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
> index 15ec852e7f7e..6ae11a1c7404 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -64,8 +64,6 @@ static inline bool xe_exec_queue_uses_pxp(struct xe_exec_queue *q)
>   
>   bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>   
> -bool xe_exec_queue_ring_full(struct xe_exec_queue *q);
> -
>   bool xe_exec_queue_is_idle(struct xe_exec_queue *q);
>   
>   void xe_exec_queue_kill(struct xe_exec_queue *q);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9e4118126ef9..69ed3c159d10 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -837,30 +837,31 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
>   	struct xe_sched_job *job = to_xe_sched_job(drm_job);
>   	struct xe_exec_queue *q = job->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
> -	struct dma_fence *fence = NULL;
> -	bool lr = xe_exec_queue_is_lr(q);
> +	bool lr = xe_exec_queue_is_lr(q), killed_or_banned_or_wedged =
> +		exec_queue_killed_or_banned_or_wedged(q);
>   
>   	xe_gt_assert(guc_to_gt(guc), !(exec_queue_destroyed(q) || exec_queue_pending_disable(q)) ||
>   		     exec_queue_banned(q) || exec_queue_suspended(q));
>   
>   	trace_xe_sched_job_run(job);
>   
> -	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
> +	if (!killed_or_banned_or_wedged && !xe_sched_job_is_error(job)) {
>   		if (!exec_queue_registered(q))
>   			register_exec_queue(q, GUC_CONTEXT_NORMAL);
> -		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
> -			q->ring_ops->emit_job(job);
> +		q->ring_ops->emit_job(job);
>   		submit_exec_queue(q);
>   	}
>   
> -	if (lr) {
> -		xe_sched_job_set_error(job, -EOPNOTSUPP);
> -		dma_fence_put(job->fence);	/* Drop ref from xe_sched_job_arm */
> -	} else {
> -		fence = job->fence;
> -	}
> +	/*
> +	 * We don't care about job-fence ordering in LR VMs because these fences
> +	 * are never exported; they are used solely to keep jobs on the pending
> +	 * list. Once a queue enters an error state, there's no need to track
> +	 * them.
> +	 */
> +	if (killed_or_banned_or_wedged && lr)
> +		xe_sched_job_set_error(job, -ECANCELED);
>   
> -	return fence;
> +	return job->fence;
>   }
>   
>   /**
> @@ -926,7 +927,8 @@ static void disable_scheduling_deregister(struct xe_guc *guc,
>   		xe_gt_warn(q->gt, "Pending enable/disable failed to respond\n");
>   		xe_sched_submission_start(sched);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(sched);
> +		if (!xe_exec_queue_is_lr(q))
> +			xe_sched_tdr_queue_imm(sched);
>   		return;
>   	}
>   
> @@ -1018,6 +1020,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	struct xe_exec_queue *q = ge->q;
>   	struct xe_guc *guc = exec_queue_to_guc(q);
>   	struct xe_gpu_scheduler *sched = &ge->sched;
> +	struct xe_sched_job *job;
>   	bool wedged = false;
>   
>   	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> @@ -1068,7 +1071,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>   	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
>   		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
>   
> +	xe_hw_fence_irq_stop(q->fence_irq);
> +
>   	xe_sched_submission_start(sched);
> +
> +	spin_lock(&sched->base.job_list_lock);
> +	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> +		xe_sched_job_set_error(job, -ECANCELED);
> +	spin_unlock(&sched->base.job_list_lock);
> +
> +	xe_hw_fence_irq_start(q->fence_irq);
>   }
>   
>   #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> @@ -1139,7 +1151,8 @@ static void enable_scheduling(struct xe_exec_queue *q)
>   		xe_gt_warn(guc_to_gt(guc), "Schedule enable failed to respond");
>   		set_exec_queue_banned(q);
>   		xe_gt_reset_async(q->gt);
> -		xe_sched_tdr_queue_imm(&q->guc->sched);
> +		if (!xe_exec_queue_is_lr(q))
> +			xe_sched_tdr_queue_imm(&q->guc->sched);
>   	}
>   }
>   
> @@ -1197,6 +1210,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>   	int i = 0;
>   	bool wedged = false, skip_timeout_check;
>   
> +	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> +
>   	/*
>   	 * TDR has fired before free job worker. Common if exec queue
>   	 * immediately closed after last fence signaled. Add back to pending
