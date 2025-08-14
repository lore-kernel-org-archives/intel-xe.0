Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823B8CA0EE0
	for <intel-xe@archiver.kernel.org>; Thu, 14 Aug 2025 02:34:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD7610E052;
	Thu, 14 Aug 2025 02:34:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T4e2ha77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A6110E052
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755138849; x=1786674849;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6wLN6L67uRp0axu9OfQmqsKw+HP3/ZTFTpsYH4UWGRQ=;
 b=T4e2ha77trKFS/NGgX03LUt21Hvb+AWgT6tWlAxz/1+l9Jj1PiVV3AS+
 NM8GDnRrV5rfFhK16veva+pfUWwO5IDtMJ7JarKkIFEKsBRhmOnmDS0g8
 PHJS9DGy3mcV72RRdZmT6evjKL4SWWUpsPbonkdCCk8zuuvlyXBHI0CyN
 B7hADNPuqxk76EaYUX/cPfCb7fMDFqrt/Wdn+CC5pHlm1n1aFOQT3TM2y
 yPmpolBeZA3YBS43kLBPeSj6p0sZpmUdoz5H8XRZUJTc7t1ATJqzpmf96
 7fd6BZZTRZ5y/qIdHZdRx0OtbgKaZLz/oxlICgf0Y272xy+pHhKaF89bi g==;
X-CSE-ConnectionGUID: lyhl5L2pT4OEU57IHm/iEw==
X-CSE-MsgGUID: l3y+Mo0LR6iIs/Y3VtPXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67716916"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67716916"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:34:09 -0700
X-CSE-ConnectionGUID: 6xYQbC7sQpWYQjobrc77vg==
X-CSE-MsgGUID: GH9ej3dtRXeqZO82ayQV6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="167436077"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 19:34:09 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 19:34:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 19:34:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.56)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 19:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pg2eheybprV323da8eVHahowrkt5PIA2dNOHJT33x4G85brwzK+CX3K2hxe8MFvudS4xleGy0N36xvLLg3PQDX7ZFusm7NgGNWi0Zq69IF1PN7on5G0iif/Khesp/ThjGdssmfum3zdwCrngs6ktKptBk6A4Qzt1IomiAw7d71lB4rylQDaGgXTsztVp4uSanxCq8FyfYVwP9WvTb0Vtx76IRlg7W9mUQIsxNuTvg/YniKTmDL2Swlw2WHucP4GzNiO5toNpSztKNK9xxlV8JWESVfCQW2AKTSDNW64KbxKApZfejSA08XFpyxssWH7yHXDnnIW8GnUcq/JgAlBpfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7g66HVvmV+SkQoI/iVbkGwz7QePthFDShC5oOjGTKFI=;
 b=QEY8qlLJLDF1EjRqAva2152d1z/9K3WIRWyfP8kJ7yO+27xaje0ImdQeZwMShmwDK7dh/nKTx5kGFumxLeoXXDPoSMu9BixfzX1CJrHKT14kroywTI9Mt2VBvQHyv0irTbhzjG1ZD3i8y86bJ7uHGpIxr9mcAsCmhUwQ3/uqX28PoSX8lwEwJECrDQUGIrOo6TkI9SpJIYjaqwY631GZsNvVTsVaQ4Vnqf//S1pGon9N7KeQDJhlG3bYBDt/MdZc/ymL0/rWWUn+ERSE7qjBYSWuhdJoTKpZk4g9epehlxrCgUAjf1O09iad/iv+mUnTIdmoqyPgR4fcSUNdafiM4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB5132.namprd11.prod.outlook.com (2603:10b6:806:11a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 02:34:01 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 02:34:00 +0000
Date: Wed, 13 Aug 2025 19:33:58 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH 05/15] drm/xe: Introduce an xe_validation wrapper around
 drm_exec
Message-ID: <aJ1LFsjFmjAY2Fcn@lstrano-desk.jf.intel.com>
References: <20250813105121.5945-1-thomas.hellstrom@linux.intel.com>
 <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813105121.5945-6-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:a03:331::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB5132:EE_
X-MS-Office365-Filtering-Correlation-Id: e177c9a8-ca33-4613-0cfc-08dddadb06fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG9QS3YvTmJvd2VuV3huV1dqKzYxcllmd0xoQXZJSkZYQWNwUUdXTklPRzZE?=
 =?utf-8?B?dFI1WFY4SE5GSWNHR2pIeE9mMEpOMEVhb3FVbUtHSnliL2gvZXYzakRiUEo3?=
 =?utf-8?B?d1pGYWkxaDRuZVFCU0VhZWNmYnlaL3NuREVOSE0rZ0VReFRXY21JYXFpTUcx?=
 =?utf-8?B?bENlVzl6Q20vc1RnaDdJblhoMllzQTNEbWFKcWlVTUNvSlBpS0lBd1JjWnlR?=
 =?utf-8?B?djBYNng4NEFEZkNVRnZWM1pRc0N4QmVkSG1LZVhreVNtYzV5U0JPLzVFOVJh?=
 =?utf-8?B?L0I3N2pSMVYyWXloKzdFU0JDcStHc21HSXVsVkZ1TFVrVUNPREd4ZE1QRlpK?=
 =?utf-8?B?dHdTZURETWlFRWpYblljeXBneVNxcUZoR0t6OXBPYzdmZXlxT1hBMzBQOSs4?=
 =?utf-8?B?Zy9tNzUyUTNmWERZQ3NXS3BkTW5FazVlaG4wOVF4a2YxeXI1WWJQVGswUXJE?=
 =?utf-8?B?WXhkL3VaVWNBaGNUMDhTMnF3amY1VGlLL1RkRzlDV1RFTEZaVWRBaGN5TEhJ?=
 =?utf-8?B?RGRhQzFQUUEzSU1nZGJ6QzVUQkNpZ3lHRzBySjdobm5kay9EN1JuVkxxcmdu?=
 =?utf-8?B?ZHFtU1NGWHVORnVYa0twYnFvUmczeHhHcHphMDA3dHhYaEIxYkVMTHFWZm5o?=
 =?utf-8?B?R1VCV0VtUW5ETW5qRHN6TEVHdHhXNGhrcU4zUWVpTEQ3SGdReWZBb0FlUnRZ?=
 =?utf-8?B?ZHZ5dDc4MlBVSklLeVMrWm5pQ2szbHAxelh1RjN0OG9mM1ZTdVltUksvRThm?=
 =?utf-8?B?cGNYY1hUR204VFV2U0hGd3VlRnAzdHh0MnUvQ0M0WlJRQm1KcXB2WXcwYUxa?=
 =?utf-8?B?QmYveG41RHVDNWtMZ0NwS1dYUEdheU9WTHFRTXJZYWtpVFl5RXlIdVBOdnht?=
 =?utf-8?B?Vm00cU03ODd4UXRyTVo3bkRIN3R6QVJOK2k0NjZ6ZzRoRklkVmxXWHU1SnVQ?=
 =?utf-8?B?SjkxT3RhcXJPVmdvRTFhL0dJWitMUi9aZi9zL2NYSjV6aUV0WHVRdEtET1pt?=
 =?utf-8?B?RGgzYW44Rm9QOGtSckI3MURXQThyWVNsb3RaZ1NENEVKMDNHdDF0OU1hTXlN?=
 =?utf-8?B?c0xCb2J3YTdSTWJxU0daS084MUJhdUNkeTlIcmVoV0dJS2F3a1NIWnl2dlp2?=
 =?utf-8?B?ak81S2tUY09LNTdQRUcrbnRacmVHWU1lZDllVDIva3EvQjB2VUorakppUlhs?=
 =?utf-8?B?ZjRvRm9aSkpEOWd5T05PUDJJSEFPSDN2MkhGOS9tQXhSRi9mNS9WODJ5dWpL?=
 =?utf-8?B?TUZ5QjN4bm9JL0l1eWo4TVJhTERUaEExOEdmWEViMWl5aG1mUmQxay81Y29r?=
 =?utf-8?B?bTRLUGdnTm1hV3RKbkpaczFkeXN6QkxNVHRWV3dtZ2IvS3ZmTDQyU1ZqNFdH?=
 =?utf-8?B?VTZFOTZzekpGS2ViM1VWZGd3TGFwNXg3cXJLbHgxb295WlVGTXYwcTA1alp6?=
 =?utf-8?B?bktSRXNYbGNOM3phZGxvOUZJYVVhZURRNlVUc3o5Q2kwNzM3eC8xMTU3c1o1?=
 =?utf-8?B?ekxlT3N5aHZnbjIyemtLV1dLaHhxWjRSRkNNUEJLVGFXSUJCbUdVOHZBR2hS?=
 =?utf-8?B?WlljTFlpeTQ5NnBqcFVycmx0RW9MMmo3TDUyUGJEbjY3V3NqSmR3Vzk4Tmdt?=
 =?utf-8?B?Sm15em1rUmlvSFE3NmxqTHNJT0ViN3k1L2ZDNEZZOTRWcGEvOXZBUFo4bEY2?=
 =?utf-8?B?SmZEaloyWkg4ZlZUeVhhSm1DemFEVjRJVnZ2ckhxb25ZTjRUR1pIWUpaWXdY?=
 =?utf-8?B?TnNwQ2E0S0hJRDVwcC9SeGtSaUZwR24rSlVReHM3VTJZdWVqRkdyeW53S1V6?=
 =?utf-8?B?RWRCZzFsVk4xb0lqbGxTMzR0WWdGNmVPS2pqL1JQampXeHBIMUtodGpWbTYy?=
 =?utf-8?B?bnBlMVBOOHE3Skh5WjI0dWFuT2dCMEhwQWdkeWZ6MFM2ZjhGa3V4OWFJV1Iz?=
 =?utf-8?Q?RtGMw8oHWEg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDVHWlg3eUJneC9jTVJISW9laUFrNmhHL1UwU3o3bTk5dVlCMjZJbzlWTnhM?=
 =?utf-8?B?cHFCTFovOGhsbk9DMzJkTEprR3lISi9qMndaVDgwM3dZQmdtREp6M2lieW50?=
 =?utf-8?B?VmhTaEw3cXk2T0RuQ2szRTcxNWdMVkI4b1RmNjRvRnBZaWJMNHBGdjg5dlFa?=
 =?utf-8?B?MFpFM2NwRVU5Q0VzTlIxZ0lBcVZjb1FYa1ZPZVdTSVRBWFlTcVpURjdEZ1Iw?=
 =?utf-8?B?QXBWMVBOWFVvaTlaMXU2Qk02S29GVVpkWmZsUlE2UjJDRzk4cEJGTjRXaWJx?=
 =?utf-8?B?dkltYm5XU203ODEzOWVXdlJXS0RyWmQ2S0thdTVxTnIrUG1acmExRUJpc0ZC?=
 =?utf-8?B?K3U5OEtpUXNhTEZCQzBENEZYQ3V1MzdxSzkrUHYyMGkzazZzenV4RlhyN25h?=
 =?utf-8?B?OHQ0T3ZNR1lNMkoycy8yYWxvUllDcHl4YXpRVmFnMFo0N0xYOG5UOVNYNmNo?=
 =?utf-8?B?bzlSUk5Uc2NUUUkxYVZZaStqblY0TDM2ZnNmK1UwWi9VQS9VeW5yeUErM0Vl?=
 =?utf-8?B?ditESWFWcUFCUFFZdTZxb3JWWDd2dlJIMzFyelN4cW5LYTJ1K3pkaEREQll5?=
 =?utf-8?B?WXkrR3VNSHkydlVFSWNxd0p2Z3VyQThPMlEzRmxwQ1luZ3dYT3p6NXk5dnlT?=
 =?utf-8?B?VitLTzBuZG9BNlZNN2l5djJELzhQRkUyMjZqM1BmMlhzM2tOY0x6a1lscVRD?=
 =?utf-8?B?M2ZaSHJ1c3FyeEQzZEErSG1nUlhhNWpEUzIxM2N3VUoxM0l5M0VGT2tnM2dZ?=
 =?utf-8?B?Mnk4YkwxbFhQd2x4cThicFBTMEwrVTc1c3Y3MHY0Lys0U1VOWWEzQUpQSDMy?=
 =?utf-8?B?ZWhBamRkL2s3Rmp4K2RyTitJK29wTUlUUy9RQWtaZUlIaFc1UENTWUdqcVNo?=
 =?utf-8?B?ZmJlUEV6ODZUVTQyVXo3TGtRK3k4MHhSalRJV0ZSZ3ExYXVrSzFuQjBTUVcv?=
 =?utf-8?B?enREMDNkaUhmZlhZd3VJOUx5NDFERVpqLzhqY0JrU0gyMjdXV0NtQWQyYzIz?=
 =?utf-8?B?bURNU3diZG8rcHlnYTdWc3EvVUlRU1UzNDBhMUlialBSNUxMUmtLY3JYNmhz?=
 =?utf-8?B?WkF1ZkhQY3gxN1MzVU93ejlGcVZsV1liSnFMM2ZjNmxCQ2FZcE1RRmJjaTB2?=
 =?utf-8?B?Zm1JaldKekRMbzk2TTRhRFU0dDdzbVlHbVQrSWl3MmNlVnBCSU1JSFYrNnVm?=
 =?utf-8?B?Rm1rY1Y4YUtpRVo4ckpEbjV0U1J2WHk5SFhhc1FPNWc1bVkyYUEweWdDNHV4?=
 =?utf-8?B?SW5IZlc4NXZqSk9GdmFDYzdqTkpqU0hDTGxyRk1SQm5ITDJxSHpTME9uOEhh?=
 =?utf-8?B?QWtmYktDT3B6RURRLy9lOHJMU3dqOXVwb0Y2UHJZNUhBYlMvQnpoeHBqd2NH?=
 =?utf-8?B?T0Z5cjh1cEFnVzdZR3RCRjUwOWNxbFlzTEphRUF5TjJLTkEyWFAwNVUwN1Zq?=
 =?utf-8?B?WUs0UFFLTHQ1OEN3TUN3T0xidENVekxZNThlZ3oxalNDWHpTaEVZc3cwUEhv?=
 =?utf-8?B?S0NHRkNVNjZYSDhmMXFXZEVrU29mbEtBdWhGNUF1cWVKdUMxc2lQZzhaN2Ny?=
 =?utf-8?B?eFBqL1V1YURQWmh6Mmg5cGZqdm5FT0VhbklUMkYwK0g4NlNnL050L0FSZTdS?=
 =?utf-8?B?NHBMenBVZ2dPOGsxY3BoRFlWbmRVSnFPbkU5K3VDMDU0ZW1GZWpkdzJMSjJ0?=
 =?utf-8?B?bmdVTnhCVWNGUXhEWEhENDY4Q00wT01XWE1GTXhhKzJPS09UbE9DeVZheTBa?=
 =?utf-8?B?ZFRRODlyQldScHEyYW9FRnlCamFtcVNlVXlpWnIwRXVlV09RbTFzdXJWcjFD?=
 =?utf-8?B?MDcvM2ptN2U3cDBFQU9hYlVqZ2VxcThieWpQUUhpMHFiT2FaeVluVTRzU3Fw?=
 =?utf-8?B?OGxydklwNERTdU11NDlBd0Z4T3dkU21FUDVQVWhTaU5LMmdQVFlPK2hONnFU?=
 =?utf-8?B?VmxnZ09JenBsUTIrWjc2b0NpL3JJUHh0aVFzV29pTXNtMGNOdEYrek5qVHRt?=
 =?utf-8?B?TVpMc0QxYkdENzl1aDVxdU5UejRUNy9qaTRnLzBPYUs4R1lLQzBuNlp6R2o0?=
 =?utf-8?B?K2F2VmprK2xyaDgwN3VqMnVmMkJrT3JiTm9qNzE5VzFFeitpVnJaRVRUUjhr?=
 =?utf-8?B?TW9CdlZkYUV6VkRmMlQwK2Vqd0RudEgycDNKTDFSQVp6anUyeWdXRWQ2SUNW?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e177c9a8-ca33-4613-0cfc-08dddadb06fe
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 02:34:00.8358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoKe60vfpsMd7CBokS+LX9IltJTXXGqPeeuAAAGuNhbf0roSjJsSBO4t06vft1JwmPuH6/90HDMmKIWVigyLCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5132
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

On Wed, Aug 13, 2025 at 12:51:11PM +0200, Thomas Hellström wrote:
> Introduce a validation wrapper xe_validation_guard() as a helper
> intended to be used around drm_exec transactions what perform
> validations. Once TTM can handle exhaustive eviction we could
> remove this wrapper or make it mostly a NO-OP unless other
> functionality is added to it.
> 
> Currently the wrapper takes a read lock upon entry and if the
> transaction hits an OOM, all locks are released and the
> transaction is retried with a write-lock. If all other
> validations participate in this scheme, the transaction with
> the write lock will be the only transaction validating and
> should have access to all available non-pinned memory.
> 
> There is currently a problem in that TTM converts -EDEADLOCKS to
> -ENOMEM, and with ww_mutex slowpath error injections, we can hit
> -ENOMEMs without having actually ran out of memory. We abuse
> ww_mutex internals to detect such situations until TTM is fixes
> to not convert the error code. In the meantime, injecting
> ww_mutex slowpath -EDEADLOCKs is a good way to test
> the implementation in the absence of real OOMs.
> 
> Just introduce the wrapper in this commit. It will be hooked up
> to the driver in following commits.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_validation.c | 199 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_validation.h | 107 ++++++++++++++++
>  2 files changed, 306 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
> index cc0684d24e02..cd1424f04237 100644
> --- a/drivers/gpu/drm/xe/xe_validation.c
> +++ b/drivers/gpu/drm/xe/xe_validation.c
> @@ -5,6 +5,7 @@
>  #include "xe_bo.h"
>  #include <drm/drm_exec.h>
>  #include <drm/drm_gem.h>
> +#include <drm/drm_gpuvm.h>
>  
>  #include "xe_assert.h"
>  #include "xe_validation.h"
> @@ -47,3 +48,201 @@ void xe_validation_assert_exec(const struct xe_device *xe,
>  	}
>  }
>  #endif
> +
> +static int xe_validation_lock(struct xe_validation_ctx *ctx)
> +{
> +	struct xe_validation_device *val = ctx->val;
> +	int ret = 0;
> +
> +	if (ctx->flags & DRM_EXEC_INTERRUPTIBLE_WAIT) {
> +		if (ctx->request_exclusive)
> +			ret = down_write_killable(&val->lock);
> +		else
> +			ret = down_read_interruptible(&val->lock);
> +	} else {
> +		if (ctx->request_exclusive)
> +			down_write(&val->lock);
> +		else
> +			down_read(&val->lock);
> +	}
> +
> +	if (!ret) {
> +		ctx->lock_held = true;
> +		ctx->lock_held_exclusive = ctx->request_exclusive;
> +	}
> +
> +	return ret;
> +}
> +
> +static void xe_validation_unlock(struct xe_validation_ctx *ctx)
> +{
> +	if (!ctx->lock_held)
> +		return;
> +
> +	if (ctx->lock_held_exclusive)
> +		up_write(&ctx->val->lock);
> +	else
> +		up_read(&ctx->val->lock);
> +
> +	ctx->lock_held = false;
> +}
> +
> +/**
> + * xe_validation_ctx_init() - Initialize an xe_validation_ctx
> + * @ctx: The xe_validation_ctx to initialize.
> + * @val: The xe_validation_device representing the validation domain.
> + * @exec: The struct drm_exec to use for the transaction.
> + * @flags: The flags to use for drm_exec initialization.
> + * @nr: The number of anticipated buffer object locks. Forwarded to
> + * drm_exec initialization.
> + * @exclusive: Whether to use exclusive locking already on first validation.

The last two parameters of this function are always passed as 0 and
false in this series. Is it worth keeping them? I don’t see a case where
nr would ever be non-zero. exclusive is defensible, but it’s still
unused. Maybe drop both and reserve a bit in flags for a driver-defined
“exclusive.” That would make the call sites more readable—long argument
lists make it easy to forget what each parameter means or to transpose
them.

> + *
> + * Initialize and lock a an xe_validation transaction using the validation domain
> + * represented by @val. Also initialize the drm_exec object forwarding
> + * @flags and @nr to the drm_exec initialization. The @exclusive parameter should
> + * typically be set to false to avoid locking out other validators from the
> + * domain until an OOM is hit. For testing- or final attempt purposes it can,
> + * however, be set to true.
> + *
> + * Return: %0 on success, %-EINTR if interruptible initial locking failed with a
> + * signal pending.
> + */
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> +			   bool exclusive)
> +{
> +	int ret;
> +
> +	ctx->exec = exec;
> +	ctx->val = val;
> +	ctx->lock_held = false;
> +	ctx->lock_held_exclusive = false;
> +	ctx->request_exclusive = exclusive;
> +	ctx->flags = flags;
> +	ctx->nr = nr;
> +
> +	ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	drm_exec_init(exec, flags, nr);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
> +/*
> + * This abuses both drm_exec and ww_mutex internals and should be
> + * replaced by checking for -EDEADLK when we can make TTM
> + * stop converting -EDEADLK to -ENOMEM.
> + * An alternative is to not have exhaustive eviction with
> + * CONFIG_DEBUG_WW_MUTEX_SLOWPATH until that happens.
> + */
> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return !!exec->ticket.contending_lock;
> +}
> +
> +#else
> +
> +static bool xe_validation_contention_injected(struct drm_exec *exec)
> +{
> +	return false;
> +}
> +
> +#endif
> +
> +static bool __xe_validation_should_retry(struct xe_validation_ctx *ctx, int ret)
> +{
> +	if (ret == -ENOMEM &&
> +	    ((ctx->request_exclusive &&
> +	      xe_validation_contention_injected(ctx->exec)) ||
> +	     !ctx->request_exclusive)) {
> +		ctx->request_exclusive = true;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
> + * xe_validation_exec_lock() - Perform drm_gpuvm_exec_lock within a validation
> + * transaction.
> + * @ctx: An uninitialized xe_validation_ctx.
> + * @vm_exec: An initialized struct vm_exec.
> + * @val: The validation domain.
> + *
> + * The drm_gpuvm_exec_lock() function internally initializes its drm_exec
> + * transaction and therefore doesn't lend itself very well to be using
> + * xe_validation_ctx_init(). Provide a helper that takes an uninitialized
> + * xe_validation_ctx and calls drm_gpuvm_exec_lock() with OOM retry.
> + *
> + * Return: %0 on success, negative error code on failure.
> + */
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx,
> +			    struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val)
> +{
> +	int ret;
> +
> +	memset(ctx, 0, sizeof(*ctx));
> +	ctx->exec = &vm_exec->exec;
> +	ctx->flags = vm_exec->flags;
> +	ctx->val = val;
> +retry:
> +	ret = xe_validation_lock(ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = drm_gpuvm_exec_lock(vm_exec);
> +	if (ret) {
> +		xe_validation_unlock(ctx);
> +		if (__xe_validation_should_retry(ctx, ret))
> +			goto retry;
> +	}
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_validation_ctx_fini() - Finalize a validation transaction
> + * @ctx: The Validation transaction to finalize.
> + *
> + * Finalize a validation transaction and its related drm_exec transaction.
> + */
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx)
> +{
> +	drm_exec_fini(ctx->exec);
> +	xe_validation_unlock(ctx);
> +}
> +
> +/**
> + * xe_validation_should_retry() - Determine if a validation transaction should retry
> + * @ctx: The validation transaction.
> + * @ret: Pointer to a return value variable.
> + *
> + * Determines whether a validation transaction should retry based on the
> + * internal transaction state and the return value pointed to by @ret.
> + * If a validation should be retried, the transaction is prepared for that,
> + * and the validation locked might be re-locked in exclusive mode, and *@ret
> + * is set to %0. If the re-locking errors, typically due to interruptible
> + * locking with signal pending, *@ret is instead set to -EINTR and the
> + * function returns %false.
> + *
> + * Return: %true if validation should be retried, %false otherwise.
> + */
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret)
> +{
> +	if (__xe_validation_should_retry(ctx, *ret)) {
> +		drm_exec_fini(ctx->exec);
> +		*ret = 0;
> +		if (ctx->request_exclusive != ctx->lock_held_exclusive) {
> +			xe_validation_unlock(ctx);
> +			*ret = xe_validation_lock(ctx);
> +		}
> +		drm_exec_init(ctx->exec, ctx->flags, ctx->nr);
> +		return !*ret;
> +	}
> +
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index db50feacad7a..a708c260cf18 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -7,9 +7,11 @@
>  
>  #include <linux/dma-resv.h>
>  #include <linux/types.h>
> +#include <linux/rwsem.h>
>  
>  struct drm_exec;
>  struct drm_gem_object;
> +struct drm_gpuvm_exec;
>  struct xe_device;
>  
>  #ifdef CONFIG_PROVE_LOCKING
> @@ -66,4 +68,109 @@ void xe_validation_assert_exec(const struct xe_device *xe, const struct drm_exec
>  	} while (0)
>  #endif
>  
> +/**
> + * struct xe_validation_device - The domain for exhaustive eviction
> + * @lock: The lock used to exclude other processes from allocating graphics memory
> + *
> + * The struct xe_validation_device represents the domain for which we want to use
> + * exhaustive eviction. The @lock is typically grabbed in read mode for allocations
> + * but when graphics memory allocation fails, it is retried with the write mode held.
> + */
> +struct xe_validation_device {
> +	struct rw_semaphore lock;
> +};
> +
> +/**
> + * struct xe_validation_ctx - A struct drm_exec subclass with support for
> + * exhaustive eviction
> + * @exec: The drm_exec object base class. Note that we use a pointer instead of
> + * embedding to avoid diamond inheritance.
> + * @val: The exhaustive eviction domain.
> + * @lock_held: Whether The domain lock is currently held.
> + * @lock_held_exclusive: Whether the domain lock is held in exclusive mode.
> + * @request_exclusive: Whether to lock exclusively (write mode) the next time
> + * the domain lock is locked.
> + * @flags: The drm_exec flags used for drm_exec (re-)initialization.
> + * @nr: The drm_exec nr parameter used for drm_exec (re-)initializaiton.
> + */
> +struct xe_validation_ctx {
> +	struct drm_exec *exec;
> +	struct xe_validation_device *val;
> +	bool lock_held;
> +	bool lock_held_exclusive;
> +	bool request_exclusive;
> +	u32 flags;
> +	unsigned int nr;
> +};
> +
> +int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_device *val,
> +			   struct drm_exec *exec, u32 flags, unsigned int nr,
> +			   bool exclusive);
> +
> +int xe_validation_exec_lock(struct xe_validation_ctx *ctx, struct drm_gpuvm_exec *vm_exec,
> +			    struct xe_validation_device *val);
> +
> +void xe_validation_ctx_fini(struct xe_validation_ctx *ctx);
> +
> +bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
> +
> +/**
> + * xe_validation_retry_on_oom() - Retry on oom in an xe_validaton transaction
> + * @_ctx: Pointer to the xe_validation_ctx
> + * @_ret: The current error value possibly holding -ENOMEM
> + *
> + * Use this in way similar to drm_exec_retry_on_contention().
> + * If @_ret contains -ENOMEM the tranaction is restarted once in a way that
> + * blocks other transactions and allows exhastive eviction. If the transaction
> + * was already restarted once, Just return the -ENOMEM. May also set
> + * _ret to -EINTR if not retrying and waits are interruptible.
> + * May only be used within a drm_exec_until_all_locked() loop.
> + */
> +#define xe_validation_retry_on_oom(_ctx, _ret)				\
> +	do {								\
> +		if (xe_validation_should_retry(_ctx, _ret))		\
> +			goto *__drm_exec_retry_ptr;			\
> +	} while (0)
> +
> +/**
> + * xe_validation_device_init - Initialize a struct xe_validation_device
> + * @val: The xe_validation_device to init.
> + */
> +static inline void
> +xe_validation_device_init(struct xe_validation_device *val)
> +{
> +	init_rwsem(&val->lock);
> +}
> +
> +/*
> + * Make guard() and scoped_guard() work with xe_validation_ctx
> + * so that we can exit transactions without caring about the
> + * cleanup.
> + */
> +DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
> +	     if (!IS_ERR(_T)) xe_validation_ctx_fini(_T);,
> +	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags, 0, _excl);
> +	       _ret ? NULL : _ctx; }),
> +	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> +	     struct drm_exec *_exec, u32 _flags, int _ret, bool _excl);
> +static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
> +{return *_T; }
> +#define class_xe_validation_is_conditional false
> +
> +/**
> + * xe_validation_guard() - An auto-cleanup xe_validation_ctx transaction
> + * @_ctx: The xe_validation_ctx.
> + * @_val: The xe_validation_device.
> + * @_exec: The struct drm_exec object
> + * @_flags: Flags for the drm_exec transaction. See the struct drm_exec documention!
> + * @_ret: Return in / out parameter. May be set by this macro. Typicall 0 when called.
> + * @_excl: Whether to start in exclusive mode already in the first iteration.
> + *

Same comment as above on function xe_validation_ctx_init wrt to
arguments.

Matt

> + * This macro is will initiate a drm_exec transaction with additional support for
> + * exhaustive eviction.
> + */
> +#define xe_validation_guard(_ctx, _val, _exec, _flags, _ret, _excl)	\
> +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret, _excl) \
> +	drm_exec_until_all_locked(_exec)
> +
>  #endif
> -- 
> 2.50.1
> 
