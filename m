Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC67C02180
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jan 2025 23:03:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F3910E292;
	Mon, 13 Jan 2025 23:03:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtF1vNXD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5661488F94
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jan 2025 23:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736809414; x=1768345414;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x2IMl37eMMg5iKoJC+maZWmBLnOMvOeov2NyafotG+0=;
 b=QtF1vNXDrd8DTdO3ARqASvZXo/+VzVRDBHHnXhBm1hrU5YcsZmkf4u4F
 smi37Xh34s7EeI5ZB7ejNpp3WNuPbQZhoA+Ot+g88yQnvKLs/2o/pikG1
 48funRZ+iylKlxpm/zETFfuzDv/f9HJEoa/B+sBtVd4tDkidX4hTgSL5y
 EiIsrdhVSYuib0uhpKbbleEakpS5N/kmRFEh54AS5Xn2wR2icvoyslQQL
 5vhtgD/0tnT6bgie4HtfDKDtET/Gd/i6cd3a8HKXdxw2x8tSe/rnAQHNW
 E4lK/aN5vAEF4REh9U3JbUyb1F0tsYC7hUEr49trA4bgxVvcomcz4ii5Z A==;
X-CSE-ConnectionGUID: zgfoDj+1RByYaV5wXN60Cw==
X-CSE-MsgGUID: 1Gdyp6eRQvuvZsrVPsSujA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40770737"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="40770737"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 15:03:15 -0800
X-CSE-ConnectionGUID: RVi5DB3VRUqibXpDW+mDog==
X-CSE-MsgGUID: WuJYv0gNRBC4+ma2USGecw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; d="scan'208";a="105187073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 15:03:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 15:03:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 15:03:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 15:03:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK+8OWSoEYFjXb9VoqBqH17cqF/EJLK7ckLUmTh3Q/muMQCxfM8sPERL/Nojuun3rJCVrJ9FJYOqicdkjaKcX8VrJh9+Wd8KtmBCOo8KVkw7BA6Xnj1h0aS6xoekbidWqN2+ihZy6rJaz3nPb/4m5X20CCkqVJ9X8J0HECZLYhnBYH1yDT/YYDODUKy5XJtEUedNSzOI3cFFXPL8V1nPBVA32U5605hEJN/3f0vdEYBRhQkeDpqLxDi3YBkyQLVCAoSpmnMLz3Qb3vLcK1LMgx7AUS8JUVRsmmZGbl54UL7ePIoxkfbQ3lIQ/vv+0dg0e5wn55bQLt71u4CEjL2nQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Haducfcr/+0gvvKZGFPP5LtdFqAgrab0RnR9GW6Smj8=;
 b=dISCxVMEAbNvyoAlfVVwp7UbgvTVmqLIYvExL1wxqRmSpGR1pABjaHR7OfQ8NV1PIXKV7u+n3qiWCOzDlXj8hODY+0Hpvx7RuP10qsAPwIT8Sh2fAhdMeMDE8TV9OSdbDUk/Urk48nhQ2sN0Wu6cuDgi5xtJVYUpP5M92Vrj6PznOlCu7vKlBQshzScBtaml83oJOoRuVS2l8emlno4dJpyFXQg/AQptY2g2rIMZaYopFr9MouGZu3LmKHzweRk61BXXGVli/iY3jrjWEKB3hruWL3+DjxKag4iWEOFh7WZ+J9u6DbupFlQBVFEDEOwBYOM8ZYz2rZqE5TPbJzcA7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB6448.namprd11.prod.outlook.com (2603:10b6:8:c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 23:03:12 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 23:03:12 +0000
Message-ID: <b8fd8379-90eb-4b3c-a0ce-33d30c7f6cb4@intel.com>
Date: Mon, 13 Jan 2025 15:03:08 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] drm/xe/pxp: Add API to mark a BO as using PXP
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20250106211212.3418231-1-daniele.ceraolospurio@intel.com>
 <20250106211212.3418231-11-daniele.ceraolospurio@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250106211212.3418231-11-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0315.namprd04.prod.outlook.com
 (2603:10b6:303:82::20) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB6448:EE_
X-MS-Office365-Filtering-Correlation-Id: e5c67432-42a3-47b7-19ce-08dd3426742b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWwvZ0NFeDVLN3VYKzNKcGNvWGU1UlFZbzNsUGl2a1ZHZnB4azF3eVA4ZE5C?=
 =?utf-8?B?VTJHVk5WdFNRd29GWHdNeWswZVBhTjdDNnA5b1JoRm5QNXhSeFpNb0UwbmNS?=
 =?utf-8?B?SzNnNlJhMFVqZmEwcU96Q3MxVmJSNTA1SUdwWlRmcnA1d2ViYlozQ0tIaFdY?=
 =?utf-8?B?ZXR1RE9UbHJxV3FWVmRORDRxTW53UnQwWHR5c3pocy9rQWRmZjd2V0h4VnFB?=
 =?utf-8?B?aUdYWEdTTkpWalB2bHpFemcwbFIvdGNpRlE4VWlGZGV1eS9ZQ2srRlBCbEZj?=
 =?utf-8?B?ZThrbTVrRms1cUl0UkRxZm5oQTdOd2dmQUVidndFUm1tYWwrc3VBdGxjVUha?=
 =?utf-8?B?RFZTYnNzeURYYUFocDFGQUdoSEJ3NENhRGxiaFhoMTBCMFFtNWdqREhCckRF?=
 =?utf-8?B?WWNjNytrY0tSZGtxUzNuZ2V1RlJpejN6bktrVmxZc0xBWGdORksyUDdtRnpP?=
 =?utf-8?B?RGJXR3l3bjZQMTlta3h4TjIyYmNpRmt1M3hqRTYzdWpBUXVoRWs1MHVMdWRQ?=
 =?utf-8?B?cDQ3cXI3SjhSa0RBa2orL2ZQQ1p3Qm5oY1g3bGwrSmV6b291Ums5eG5obS9Y?=
 =?utf-8?B?d3JPcVBmSThSckZiOVR3Z0E2bkVrQXRqZnJlUlY4eVlHZlMrZFM2TnpiNE9W?=
 =?utf-8?B?R0dxSkVQenVTRDYvRmhDOTNhUnBLYjFQMkRkbTlaL1BLY3d0T1dmK29OSXdH?=
 =?utf-8?B?aHE4ajdLb0ljNHhFTkN5YnJZaVJrOTN3M0huWFpiTm5rTlE0cUV1cXJmTkw1?=
 =?utf-8?B?MFh6N1J6bzBRQUZyWU1RbkdrN0RiSUZud2RVbW44Q0ZLMEN1TE9QL3UyYVV0?=
 =?utf-8?B?RUFxRDNDQjJZY05OM1FMVWUxbEdNOGIxcEJSQ2FyV2VoYytKc1ovVmpTcWU5?=
 =?utf-8?B?V2RyWE9QYWRhcStENkZ5bFlRWnNack9tT3ErcEpCdGVpZDd1QjBVZTVjZlN1?=
 =?utf-8?B?U1BuY3dXcHdUMFRqK2tyeWxtcm1mSHo4VFcwZHM5L2VBcnVFZ1dlalR1akJY?=
 =?utf-8?B?b0IvWUo2bEdMK1Z1MGRyZnlncFptZFhpd3hlaDN5d3lGQk9CeVhvcUFNb3M3?=
 =?utf-8?B?TVlGYVBnVHVIcll5bWcrcllEa24zNnZlQWpLRVIxZXZxVkNuNEh3Y01sazZT?=
 =?utf-8?B?RFJ0UUdmdkh6em1EMWl3UW1qV0NYNmpxZE9aVGM5d1N0MlZMQjhpV0gxaEZW?=
 =?utf-8?B?REdkRE5HY3JQQVZFQmV2QjRiV3FXN216U0RDZXFyNzhRL3VGd1FGcndiQUVz?=
 =?utf-8?B?TDkrU2p4RDl5aVBjVENYbGkzWXFEMU9iNjRBWmp5VlRraXI1SmVaUkU3dVVJ?=
 =?utf-8?B?NkNvKzlqdU9zZ2p2ZmdUSmd0c2RlbzYraW1NQnJZNktyb3NWZ013eGhqcjJN?=
 =?utf-8?B?SkZCdHNSbk9ZTE5qb29MT0p4TExxMXVSSksxbFVlNTY2ejlGcm9nQ3BNYVky?=
 =?utf-8?B?NlEzTHhIKzlVaktraThnajJkZ2svZUlRQnJJdlpQbTU4cVppNExKNGhJc1Y4?=
 =?utf-8?B?dU9iNHo5Znh6dzBNQ0dQNTNad3hsdURZK0d2SHpReEtwMkhFdlZTR1Y3U3Nh?=
 =?utf-8?B?dzZFNFhiQ3h1L1VQNmhMVHlJVFFXc1VQM3hCbGplaXlVQytURGY3aEorWnZ1?=
 =?utf-8?B?ME1kQ0tWUFFQTEk1WHhkbzcwdC92N2xRZzJqOW9TbDNDQVBtbDE4Q2dKUUJD?=
 =?utf-8?B?ZWF3WkZGUW9XZndkM2lNV09FWlFtcm5kdUtVMjJLclliMCtCc09hM0d4UFd0?=
 =?utf-8?B?a2tTdllLSFpWMmNGVnZybGp5RXRQUnRhWXVVbkNoZ2ZhUkprNnRQTU0xZnhy?=
 =?utf-8?B?OXZZTWFDTHFWakMzVENpb1BhdEZlbHJySDFtNzUxSVZ6UlVYVmpoODZyekRj?=
 =?utf-8?Q?jfqCfoULNNhQR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXJhYVhBcHZKdzVwMSs3bDRDa0hoVXhCTmVnKytxeDc1ZW1CcmtLMmNWVExZ?=
 =?utf-8?B?eWhRdUdzbUlFbTNrcU1QRmpUYnIyUy9oZVBqU0FEWC9RN3N4Vmhrb2c5eWZ0?=
 =?utf-8?B?R0hTd1JQUEJsMDlnQnRUM2xTVHFaZXBzTkswaHpqR2VCUk03N0xwYXJLN2E0?=
 =?utf-8?B?NWpmL2Y0V3dLUXd2MVcxeWlTQ05HUUFiTVc1Q1YwNXZJNko1OXQzc3lKcXB5?=
 =?utf-8?B?cU5vTDM5dDdyYlcxSFpueGRHam8wb0tXbTZxL2szdXpYZ3ArNFdyczJvNmRN?=
 =?utf-8?B?SzdIT25ubXNLeFE4NDhqcVArMjN6N2gzUGx2QjNOeFB0aUlKVGcyVkErUUdi?=
 =?utf-8?B?eEEwZDFxS0R0RXlVNVlFN3piRHhUZGtnd1QzZXNaR21rNmFtaExYM3NMcjhl?=
 =?utf-8?B?UndGSHdHcE1nNGM1VjdOM1MwQndVN1liV21Vd2NnNVdLcGwyMU00WExFWWZs?=
 =?utf-8?B?Lzd1b0VtK2R4Y3l1dGJ0YTdlR1NrVmRtcnV1L1BvWWZoZDBJb3FOS1ZPMlZq?=
 =?utf-8?B?NkxvMmg3eU1kOUdkTlVjVzY1cFZSbFV6cDNuajU3Y1JScUVPNkdtMy82NU9V?=
 =?utf-8?B?dC9mVVFMV3IvMHRnN2pkT29NNVo0MDBMVkl5WVorTTRBVmN5YkNaOTFkcnA4?=
 =?utf-8?B?TEVKMEo3TW5LNUtmL21QNThMODluSU9mQnoyTWFZdGdRRDhLWjEzTmJ6M3lB?=
 =?utf-8?B?a0ZaN294Nnd2V1Y4akNtUGxLVWN3ODZJbkt2a0RqK2t2QU1xQStieFFIMjEr?=
 =?utf-8?B?TndVSVEwbzVyR0VyUjgrMHNWa0VoTnRKdkFqVVNWWkwwTFJXWWp3cU5BNlo0?=
 =?utf-8?B?U3R3Q3JlaGRvS3QxRzVwY0d6QXVhK0J5YXp6NXgrRDJqbDFLWHBMSWRXY3pj?=
 =?utf-8?B?UUNMcHdmZ0c4QmpmNXk5YkRVcUNRdTU3alZWd3BSR0pSVnFZQXkxbzVBdUVJ?=
 =?utf-8?B?cXpPbS9vMVlGSWlEZmZNSTRrdkNmTDJaUG5HeUJmR3lhL3EvejdsbGZQa0ZZ?=
 =?utf-8?B?YlNsczAvQ0E3dTFwbk5LY2xtQW4yUFBYb2xyZi9YU2YrYjJzU0s3U1dOcFR0?=
 =?utf-8?B?VkVvemVKUGphbHZmMW0zUXhKYkg3R1JNK3BoaURRRUd1bVBOV2FPYzIwSm9x?=
 =?utf-8?B?UDBUTVgxeXByY1FFdXdobG9mUXJmY3JNeEVHN2I0eWViTFU3VThaaFRudEgx?=
 =?utf-8?B?QWhvUFZvajhKelpZZHBEZkFELzE5UHcraTIzSlRxZGZlR3A3bjc3SENCMlJw?=
 =?utf-8?B?aDZNc3V4L28yRktzWEJFaFNBeHlPNDJ3MFpLWXkvM0ZRY2RkVTlsM0gxWU8w?=
 =?utf-8?B?czJqRk5oVnVkTitZYjFWUDFKOGVzL2w4c0hlalE2SjV4N09zcVR1aHNHUDZR?=
 =?utf-8?B?TXEvYU0rZktZVnlMS0xwckEwZFVVUjJGNE5INFQwTXVQY3NZYzd2WHVnVnFF?=
 =?utf-8?B?TkZSanV0ejZVTTJjY0p5bTIyNWtyTDgyN1JYS1E0anFmTm1PWlFhYkRuaWZS?=
 =?utf-8?B?OGJIbk9VUE1sQm8zQms1UHdzQmNBTUI5WFB6NTVZV2kzNWY1cDdQSVhKelN5?=
 =?utf-8?B?WTd1RTRQMnZiT0RSeWNuK0dZV0xKSW1kMUVQeVRPN0ZaS0x3R29tZVE3dVpP?=
 =?utf-8?B?V1IyYWxGZXRsR3FVMThYQ2ZBQllFOStOQzEvZjE2YTBnc2xUNmV5djhlcVJC?=
 =?utf-8?B?eXdZemNHTjl6VlVLdG9Ua2RaZElnaTQ2V3BhSXNJZXJqSURQdjdyLzVSRzIw?=
 =?utf-8?B?SzJQK0lDTEFmbkEzU0RBbFpTQm5UVXdlRXBuRDFadXJPNmhubjFhNGcydWhn?=
 =?utf-8?B?elBBbnlvNndvWGVDYUJPZGlRekVTZUplQ25PaU9YYlNMS1l3Nkx1eG9mcnc0?=
 =?utf-8?B?S3VCMkZHNUQ3dk9ZSDBDRDg2bUNaeHRZU1Q0TGZNbXpkZGNBRXVyOXhNMysr?=
 =?utf-8?B?RG95bUhYWUxVMmY1WTRkTkcxYnNUcFc0L2ZjeDMrcm1JZi9NT2FEK29QN0lp?=
 =?utf-8?B?TnQ4aEt2bnRLaTVmcW45RDlPaG9aYldnLzVxK1hSWHhtNFdxd001RDZrWWZx?=
 =?utf-8?B?R0pHM2lOUVFOZE4rdDFacnRqM0JIaFhxTW5hLzRtd1V5MVppZUw3bFZGL1o3?=
 =?utf-8?B?cFc5SVovVmJBSis0MWJydTNvckQrdmVRdkVOeDNrQUZQUnBtQ2s5YXNQTmRM?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5c67432-42a3-47b7-19ce-08dd3426742b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 23:03:12.0971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNSUEU04yqFOJaMVsJ2ApIitXkOt+Y8WK6O+iC/l3EJfFtrjkRjEe6ZcyFED97ht1MaV5WXycoH/mfM3HNPVpHHIRZvbHukOFYpQ5FN08hY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6448
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

On 1/6/2025 13:12, Daniele Ceraolo Spurio wrote:
> The driver needs to know if a BO is encrypted with PXP to enable the
> display decryption at flip time.
> Furthermore, we want to keep track of the status of the encryption and
> reject any operation that involves a BO that is encrypted using an old
> key. There are two points in time where such checks can kick in:
>
> 1 - at VM bind time, all operations except for unmapping will be
>      rejected if the key used to encrypt the BO is no longer valid. This
>      check is opt-in via a new VM_BIND flag, to avoid a scenario where a
>      malicious app purposely shares an invalid BO with a non-PXP aware
>      app (such as a compositor). If the VM_BIND was failed, the
>      compositor would be unable to display anything at all. Allowing the
>      bind to go through means that output still works, it just displays
>      garbage data within the bounds of the illegal BO.
>
> 2 - at job submission time, if the queue is marked as using PXP, all
>      objects bound to the VM will be checked and the submission will be
>      rejected if any of them was encrypted with a key that is no longer
>      valid.
>
> Note that there is no risk of leaking the encrypted data if a user does
> not opt-in to those checks; the only consequence is that the user will
> not realize that the encryption key is changed and that the data is no
> longer valid.
>
> v2: Better commnnts and descriptions (John), rebase
>
> v3: Properly return the result of key_assign up the stack, do not use
> xe_bo in display headers (Jani)
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> ---
>   .../xe/compat-i915-headers/pxp/intel_pxp.h    | 12 ++-
>   drivers/gpu/drm/xe/display/intel_bo.c         |  2 +-
>   drivers/gpu/drm/xe/xe_bo.c                    | 98 ++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_bo.h                    |  5 +
>   drivers/gpu/drm/xe/xe_bo_types.h              |  3 +
>   drivers/gpu/drm/xe/xe_exec.c                  |  6 ++
>   drivers/gpu/drm/xe/xe_pxp.c                   | 90 +++++++++++++++++
>   drivers/gpu/drm/xe/xe_pxp.h                   |  6 ++
>   drivers/gpu/drm/xe/xe_pxp_types.h             | 11 +++
>   drivers/gpu/drm/xe/xe_vm.c                    | 46 ++++++++-
>   drivers/gpu/drm/xe/xe_vm.h                    |  2 +
>   include/uapi/drm/xe_drm.h                     | 19 ++++
>   12 files changed, 293 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> index 419e8e926f00..d2eb8e1f6c4b 100644
> --- a/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> +++ b/drivers/gpu/drm/xe/compat-i915-headers/pxp/intel_pxp.h
> @@ -9,6 +9,8 @@
>   #include <linux/errno.h>
>   #include <linux/types.h>
>   
> +#include "xe_pxp.h"
> +
>   struct drm_gem_object;
>   struct xe_pxp;
>   
> @@ -16,7 +18,15 @@ static inline int intel_pxp_key_check(struct xe_pxp *pxp,
>   				      struct drm_gem_object *obj,
>   				      bool assign)
>   {
> -	return -ENODEV;
> +	/*
> +	 * The assign variable is used in i915 to assign the key to the BO at
> +	 * first submission time. In Xe the key is instead assigned at BO
> +	 * creation time, so the assign variable must always be false.
> +	 */
> +	if (assign)
> +		return -EINVAL;
> +
> +	return xe_pxp_obj_key_check(pxp, obj);
>   }
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> index b463f5bd4eed..27437c22bd70 100644
> --- a/drivers/gpu/drm/xe/display/intel_bo.c
> +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> @@ -25,7 +25,7 @@ bool intel_bo_is_shmem(struct drm_gem_object *obj)
>   
>   bool intel_bo_is_protected(struct drm_gem_object *obj)
>   {
> -	return false;
> +	return xe_bo_is_protected(gem_to_xe_bo(obj));
>   }
>   
>   void intel_bo_flush_if_display(struct drm_gem_object *obj)
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index e6c896ad5602..d1be8f5071b9 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -6,6 +6,7 @@
>   #include "xe_bo.h"
>   
>   #include <linux/dma-buf.h>
> +#include <linux/nospec.h>
>   
>   #include <drm/drm_drv.h>
>   #include <drm/drm_gem_ttm_helper.h>
> @@ -24,6 +25,7 @@
>   #include "xe_migrate.h"
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
> +#include "xe_pxp.h"
>   #include "xe_res_cursor.h"
>   #include "xe_trace_bo.h"
>   #include "xe_ttm_stolen_mgr.h"
> @@ -2135,6 +2137,93 @@ void xe_bo_vunmap(struct xe_bo *bo)
>   	__xe_bo_vunmap(bo);
>   }
>   
> +static int gem_create_set_pxp_type(struct xe_device *xe, struct xe_bo *bo, u64 value)
> +{
> +	if (value == DRM_XE_PXP_TYPE_NONE)
> +		return 0;
> +
> +	/* we only support DRM_XE_PXP_TYPE_HWDRM for now */
> +	if (XE_IOCTL_DBG(xe, value != DRM_XE_PXP_TYPE_HWDRM))
> +		return -EINVAL;
> +
> +	return xe_pxp_key_assign(xe->pxp, bo);
> +}
> +
> +typedef int (*xe_gem_create_set_property_fn)(struct xe_device *xe,
> +					     struct xe_bo *bo,
> +					     u64 value);
> +
> +static const xe_gem_create_set_property_fn gem_create_set_property_funcs[] = {
> +	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_set_pxp_type,
> +};
> +
> +static int gem_create_user_ext_set_property(struct xe_device *xe,
> +					    struct xe_bo *bo,
> +					    u64 extension)
> +{
> +	u64 __user *address = u64_to_user_ptr(extension);
> +	struct drm_xe_ext_set_property ext;
> +	int err;
> +	u32 idx;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.property >=
> +			 ARRAY_SIZE(gem_create_set_property_funcs)) ||
> +	    XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.property != DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.property, ARRAY_SIZE(gem_create_set_property_funcs));
> +	if (!gem_create_set_property_funcs[idx])
> +		return -EINVAL;
> +
> +	return gem_create_set_property_funcs[idx](xe, bo, ext.value);
> +}
> +
> +typedef int (*xe_gem_create_user_extension_fn)(struct xe_device *xe,
> +					       struct xe_bo *bo,
> +					       u64 extension);
> +
> +static const xe_gem_create_user_extension_fn gem_create_user_extension_funcs[] = {
> +	[DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY] = gem_create_user_ext_set_property,
> +};
> +
> +#define MAX_USER_EXTENSIONS	16
> +static int gem_create_user_extensions(struct xe_device *xe, struct xe_bo *bo,
> +				      u64 extensions, int ext_number)
> +{
> +	u64 __user *address = u64_to_user_ptr(extensions);
> +	struct drm_xe_user_extension ext;
> +	int err;
> +	u32 idx;
> +
> +	if (XE_IOCTL_DBG(xe, ext_number >= MAX_USER_EXTENSIONS))
> +		return -E2BIG;
> +
> +	err = __copy_from_user(&ext, address, sizeof(ext));
> +	if (XE_IOCTL_DBG(xe, err))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, ext.pad) ||
> +	    XE_IOCTL_DBG(xe, ext.name >= ARRAY_SIZE(gem_create_user_extension_funcs)))
> +		return -EINVAL;
> +
> +	idx = array_index_nospec(ext.name,
> +				 ARRAY_SIZE(gem_create_user_extension_funcs));
> +	err = gem_create_user_extension_funcs[idx](xe, bo, extensions);
> +	if (XE_IOCTL_DBG(xe, err))
> +		return err;
> +
> +	if (ext.next_extension)
> +		return gem_create_user_extensions(xe, bo, ext.next_extension,
> +						  ++ext_number);
> +
> +	return 0;
> +}
> +
>   int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   			struct drm_file *file)
>   {
> @@ -2147,8 +2236,7 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	u32 handle;
>   	int err;
>   
> -	if (XE_IOCTL_DBG(xe, args->extensions) ||
> -	    XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
> +	if (XE_IOCTL_DBG(xe, args->pad[0] || args->pad[1] || args->pad[2]) ||
>   	    XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>   		return -EINVAL;
>   
> @@ -2230,6 +2318,12 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   		goto out_vm;
>   	}
>   
> +	if (args->extensions) {
> +		err = gem_create_user_extensions(xe, bo, args->extensions, 0);
> +		if (err)
> +			goto out_bulk;
> +	}
> +
>   	err = drm_gem_handle_create(file, &bo->ttm.base, &handle);
>   	if (err)
>   		goto out_bulk;
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index d9386ab03140..28479c9bc20e 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -184,6 +184,11 @@ static inline bool xe_bo_is_pinned(struct xe_bo *bo)
>   	return bo->ttm.pin_count;
>   }
>   
> +static inline bool xe_bo_is_protected(const struct xe_bo *bo)
> +{
> +	return bo->pxp_key_instance;
> +}
> +
>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>   {
>   	if (likely(bo)) {
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index 46dc9e4e3e46..fd98c755ee4d 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -57,6 +57,9 @@ struct xe_bo {
>   	 */
>   	struct list_head client_link;
>   #endif
> +	/** @pxp_key_instance: key instance this bo was created against (if any) */
Given that this is not a pointer, maybe explicitly say that zero means 
none? It is pretty obvious from the usage but it is generally better to 
validate usage against spec rather than infer spec from usage.

With that updated:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


> +	u32 pxp_key_instance;
> +
>   	/** @freed: List node for delayed put. */
>   	struct llist_node freed;
>   	/** @update_index: Update index if PT BO */
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 31cca938956f..1acc6e55efd5 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -262,6 +262,12 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		goto err_exec;
>   	}
>   
> +	if (xe_exec_queue_uses_pxp(q)) {
> +		err = xe_vm_validate_protected(q->vm);
> +		if (err)
> +			goto err_exec;
> +	}
> +
>   	job = xe_sched_job_create(q, xe_exec_queue_is_parallel(q) ?
>   				  addresses : &args->address);
>   	if (IS_ERR(job)) {
> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
> index d46b2c0a06ae..ae45c663b81d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.c
> +++ b/drivers/gpu/drm/xe/xe_pxp.c
> @@ -8,6 +8,8 @@
>   #include <drm/drm_managed.h>
>   #include <uapi/drm/xe_drm.h>
>   
> +#include "xe_bo.h"
> +#include "xe_bo_types.h"
>   #include "xe_device_types.h"
>   #include "xe_exec_queue.h"
>   #include "xe_force_wake.h"
> @@ -185,6 +187,9 @@ static void pxp_terminate(struct xe_pxp *pxp)
>   
>   	pxp_invalidate_queues(pxp);
>   
> +	if (pxp->status == XE_PXP_ACTIVE)
> +		pxp->key_instance++;
> +
>   	/*
>   	 * If we have a termination already in progress, we need to wait for
>   	 * it to complete before queueing another one. Once the first
> @@ -385,6 +390,8 @@ int xe_pxp_init(struct xe_device *xe)
>   	pxp->xe = xe;
>   	pxp->gt = gt;
>   
> +	pxp->key_instance = 1;
> +
>   	/*
>   	 * we'll use the completions to check if there is an action pending,
>   	 * so we start them as completed and we reinit it when an action is
> @@ -689,3 +696,86 @@ static void pxp_invalidate_queues(struct xe_pxp *pxp)
>   
>   	spin_unlock_irq(&pxp->queues.lock);
>   }
> +
> +/**
> + * xe_pxp_key_assign - mark a BO as using the current PXP key iteration
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @bo: the BO to mark
> + *
> + * Returns: -ENODEV if PXP is disabled, 0 otherwise.
> + */
> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	xe_assert(pxp->xe, !bo->pxp_key_instance);
> +
> +	/*
> +	 * Note that the PXP key handling is inherently racey, because the key
> +	 * can theoretically change at any time (although it's unlikely to do
> +	 * so without triggers), even right after we copy it. Taking a lock
> +	 * wouldn't help because the value might still change as soon as we
> +	 * release the lock.
> +	 * Userspace needs to handle the fact that their BOs can go invalid at
> +	 * any point.
> +	 */
> +	bo->pxp_key_instance = pxp->key_instance;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pxp_bo_key_check - check if the key used by a xe_bo is valid
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @bo: the BO we want to check
> + *
> + * Checks whether a BO was encrypted with the current key or an obsolete one.
> + *
> + * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, -EINVAL if the
> + * BO is not using PXP,  -ENOEXEC if the key is not valid.
> + */
> +int xe_pxp_bo_key_check(struct xe_pxp *pxp, struct xe_bo *bo)
> +{
> +	if (!xe_pxp_is_enabled(pxp))
> +		return -ENODEV;
> +
> +	if (!xe_bo_is_protected(bo))
> +		return -EINVAL;
> +
> +	xe_assert(pxp->xe, bo->pxp_key_instance);
> +
> +	/*
> +	 * Note that the PXP key handling is inherently racey, because the key
> +	 * can theoretically change at any time (although it's unlikely to do
> +	 * so without triggers), even right after we check it. Taking a lock
> +	 * wouldn't help because the value might still change as soon as we
> +	 * release the lock.
> +	 * We mitigate the risk by checking the key at multiple points (on each
> +	 * submission involving the BO and right before flipping it on the
> +	 * display), but there is still a very small chance that we could
> +	 * operate on an invalid BO for a single submission or a single frame
> +	 * flip. This is a compromise made to protect the encrypted data (which
> +	 * is what the key termination is for).
> +	 */
> +	if (bo->pxp_key_instance != pxp->key_instance)
> +		return -ENOEXEC;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pxp_obj_key_check - check if the key used by a drm_gem_obj is valid
> + * @pxp: the xe->pxp pointer (it will be NULL if PXP is disabled)
> + * @obj: the drm_gem_obj we want to check
> + *
> + * Checks whether a drm_gem_obj was encrypted with the current key or an
> + * obsolete one.
> + *
> + * Returns: 0 if the key is valid, -ENODEV if PXP is disabled, -EINVAL if the
> + * obj is not using PXP,  -ENOEXEC if the key is not valid.
> + */
> +int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj)
> +{
> +	return xe_pxp_bo_key_check(pxp, gem_to_xe_bo(obj));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
> index 868813cc84b9..3dd70eac9da6 100644
> --- a/drivers/gpu/drm/xe/xe_pxp.h
> +++ b/drivers/gpu/drm/xe/xe_pxp.h
> @@ -8,6 +8,8 @@
>   
>   #include <linux/types.h>
>   
> +struct drm_gem_object;
> +struct xe_bo;
>   struct xe_device;
>   struct xe_exec_queue;
>   struct xe_pxp;
> @@ -23,4 +25,8 @@ int xe_pxp_exec_queue_set_type(struct xe_pxp *pxp, struct xe_exec_queue *q, u8 t
>   int xe_pxp_exec_queue_add(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   void xe_pxp_exec_queue_remove(struct xe_pxp *pxp, struct xe_exec_queue *q);
>   
> +int xe_pxp_key_assign(struct xe_pxp *pxp, struct xe_bo *bo);
> +int xe_pxp_bo_key_check(struct xe_pxp *pxp, struct xe_bo *bo);
> +int xe_pxp_obj_key_check(struct xe_pxp *pxp, struct drm_gem_object *obj);
> +
>   #endif /* __XE_PXP_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_pxp_types.h b/drivers/gpu/drm/xe/xe_pxp_types.h
> index bd741720f67d..8e4569f0173d 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_types.h
> +++ b/drivers/gpu/drm/xe/xe_pxp_types.h
> @@ -112,6 +112,17 @@ struct xe_pxp {
>   		/** @queues.list: list of exec_queues that use PXP */
>   		struct list_head list;
>   	} queues;
> +
> +	/**
> +	 * @key_instance: keep track of the current iteration of the PXP key.
> +	 * Note that, due to the time needed for PXP termination and re-start
> +	 * to complete, the minimum time between 2 subsequent increases of this
> +	 * variable is 50ms, and even that only if there is a continuous attack;
> +	 * normal behavior is for this to increase much much slower than that.
> +	 * This means that we don't expect this to ever wrap and don't implement
> +	 * that case in the code.
> +	 */
> +	u32 key_instance;
>   };
>   
>   #endif /* __XE_PXP_TYPES_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 62b1b6ce255b..501f4d9c8d5d 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -33,6 +33,7 @@
>   #include "xe_pm.h"
>   #include "xe_preempt_fence.h"
>   #include "xe_pt.h"
> +#include "xe_pxp.h"
>   #include "xe_res_cursor.h"
>   #include "xe_sync.h"
>   #include "xe_trace_bo.h"
> @@ -2726,7 +2727,8 @@ ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_execute, ERRNO);
>   	(DRM_XE_VM_BIND_FLAG_READONLY | \
>   	 DRM_XE_VM_BIND_FLAG_IMMEDIATE | \
>   	 DRM_XE_VM_BIND_FLAG_NULL | \
> -	 DRM_XE_VM_BIND_FLAG_DUMPABLE)
> +	 DRM_XE_VM_BIND_FLAG_DUMPABLE | \
> +	 DRM_XE_VM_BIND_FLAG_CHECK_PXP)
>   
>   #ifdef TEST_VM_OPS_ERROR
>   #define SUPPORTED_FLAGS	(SUPPORTED_FLAGS_STUB | FORCE_OP_ERROR)
> @@ -2889,7 +2891,7 @@ static void xe_vma_ops_init(struct xe_vma_ops *vops, struct xe_vm *vm,
>   
>   static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   					u64 addr, u64 range, u64 obj_offset,
> -					u16 pat_index)
> +					u16 pat_index, u32 op, u32 bind_flags)
>   {
>   	u16 coh_mode;
>   
> @@ -2933,6 +2935,12 @@ static int xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo *bo,
>   		return  -EINVAL;
>   	}
>   
> +	/* If a BO is protected it can only be mapped if the key is still valid */
> +	if ((bind_flags & DRM_XE_VM_BIND_FLAG_CHECK_PXP) && xe_bo_is_protected(bo) &&
> +	    op != DRM_XE_VM_BIND_OP_UNMAP && op != DRM_XE_VM_BIND_OP_UNMAP_ALL)
> +		if (XE_IOCTL_DBG(xe, xe_pxp_bo_key_check(xe->pxp, bo) != 0))
> +			return -ENOEXEC;
> +
>   	return 0;
>   }
>   
> @@ -3022,6 +3030,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		u32 obj = bind_ops[i].obj;
>   		u64 obj_offset = bind_ops[i].obj_offset;
>   		u16 pat_index = bind_ops[i].pat_index;
> +		u32 op = bind_ops[i].op;
> +		u32 bind_flags = bind_ops[i].flags;
>   
>   		if (!obj)
>   			continue;
> @@ -3034,7 +3044,8 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   		bos[i] = gem_to_xe_bo(gem_obj);
>   
>   		err = xe_vm_bind_ioctl_validate_bo(xe, bos[i], addr, range,
> -						   obj_offset, pat_index);
> +						   obj_offset, pat_index, op,
> +						   bind_flags);
>   		if (err)
>   			goto put_obj;
>   	}
> @@ -3334,6 +3345,35 @@ int xe_vm_invalidate_vma(struct xe_vma *vma)
>   	return ret;
>   }
>   
> +int xe_vm_validate_protected(struct xe_vm *vm)
> +{
> +	struct drm_gpuva *gpuva;
> +	int err = 0;
> +
> +	if (!vm)
> +		return -ENODEV;
> +
> +	mutex_lock(&vm->snap_mutex);
> +
> +	drm_gpuvm_for_each_va(gpuva, &vm->gpuvm) {
> +		struct xe_vma *vma = gpuva_to_vma(gpuva);
> +		struct xe_bo *bo = vma->gpuva.gem.obj ?
> +			gem_to_xe_bo(vma->gpuva.gem.obj) : NULL;
> +
> +		if (!bo)
> +			continue;
> +
> +		if (xe_bo_is_protected(bo)) {
> +			err = xe_pxp_bo_key_check(vm->xe->pxp, bo);
> +			if (err)
> +				break;
> +		}
> +	}
> +
> +	mutex_unlock(&vm->snap_mutex);
> +	return err;
> +}
> +
>   struct xe_vm_snapshot {
>   	unsigned long num_snaps;
>   	struct {
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index 0a2fa6c0815b..f66075f8a6fe 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -215,6 +215,8 @@ struct dma_fence *xe_vma_rebind(struct xe_vm *vm, struct xe_vma *vma,
>   
>   int xe_vm_invalidate_vma(struct xe_vma *vma);
>   
> +int xe_vm_validate_protected(struct xe_vm *vm);
> +
>   static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
>   {
>   	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 9d1ed07b3130..149adf3cbbce 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -778,8 +778,23 @@ struct drm_xe_device_query {
>    *  - %DRM_XE_GEM_CPU_CACHING_WC - Allocate the pages as write-combined. This
>    *    is uncached. Scanout surfaces should likely use this. All objects
>    *    that can be placed in VRAM must use this.
> + *
> + * This ioctl supports setting the following properties via the
> + * %DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY extension, which uses the
> + * generic @drm_xe_ext_set_property struct:
> + *
> + *  - %DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE - set the type of PXP session
> + *    this object will be used with. Valid values are listed in enum
> + *    drm_xe_pxp_session_type. %DRM_XE_PXP_TYPE_NONE is the default behavior, so
> + *    there is no need to explicitly set that. Objects used with session of type
> + *    %DRM_XE_PXP_TYPE_HWDRM will be marked as invalid if a PXP invalidation
> + *    event occurs after their creation. Attempting to flip an invalid object
> + *    will cause a black frame to be displayed instead. Submissions with invalid
> + *    objects mapped in the VM will be rejected.
>    */
>   struct drm_xe_gem_create {
> +#define DRM_XE_GEM_CREATE_EXTENSION_SET_PROPERTY	0
> +#define   DRM_XE_GEM_CREATE_SET_PROPERTY_PXP_TYPE	0
>   	/** @extensions: Pointer to the first extension struct, if any */
>   	__u64 extensions;
>   
> @@ -941,6 +956,9 @@ struct drm_xe_vm_destroy {
>    *    will only be valid for DRM_XE_VM_BIND_OP_MAP operations, the BO
>    *    handle MBZ, and the BO offset MBZ. This flag is intended to
>    *    implement VK sparse bindings.
> + *  - %DRM_XE_VM_BIND_FLAG_CHECK_PXP - If the object is encrypted via PXP,
> + *    reject the binding if the encryption key is no longer valid. This
> + *    flag has no effect on BOs that are not marked as using PXP.
>    */
>   struct drm_xe_vm_bind_op {
>   	/** @extensions: Pointer to the first extension struct, if any */
> @@ -1031,6 +1049,7 @@ struct drm_xe_vm_bind_op {
>   #define DRM_XE_VM_BIND_FLAG_IMMEDIATE	(1 << 1)
>   #define DRM_XE_VM_BIND_FLAG_NULL	(1 << 2)
>   #define DRM_XE_VM_BIND_FLAG_DUMPABLE	(1 << 3)
> +#define DRM_XE_VM_BIND_FLAG_CHECK_PXP	(1 << 4)
>   	/** @flags: Bind flags */
>   	__u32 flags;
>   

