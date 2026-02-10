Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53144EA3F09
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 06:38:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0338210E4C0;
	Tue, 10 Feb 2026 06:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSIxhGim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C01F10E4C0
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770705488; x=1802241488;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TYezt14+wOKMw6S9J3ELoBPpryu05vNRK9XMifmFF1Y=;
 b=CSIxhGimwLaUlome9jVL+rUD3xFTnxj4X5enDpsywpz7Rt8JhdoQTeZA
 lIpKdqMYnp55QbwaGe9Vb+lMG2yXhnUMkxvSSYIiFUxM3lSmQBSha7AXa
 cJAqEOqDuJvZ7r8q61aBUHH9NHl1Tk6m2Bs4Ud0WZmEcTQuXY19AxWRI6
 RglNDX20yeVUlcfkfJ+mjhwBqYScDPOy0dF/nxkQspObj7KKFwxW1U+5+
 AH3MoSP2vAL56rMdT7xqgicZ5tpE+eV3Rqa4d20qchUOegtb6Afq+ugz9
 lDM6TdG6lIXaUk29o86u+GUJGQW6ETSmNw8y1pAFOUTWNSoYBOK9fEJSU w==;
X-CSE-ConnectionGUID: 4mxDBoWRSdyNHps8JwkOqA==
X-CSE-MsgGUID: slvKGYu9TN+1TjQF9t5Qgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71813458"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71813458"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 22:38:07 -0800
X-CSE-ConnectionGUID: c3tNKXe6Qxqrv8yTBkF0UA==
X-CSE-MsgGUID: nS9PrUQVSz2DJgZbuzxKMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="210922256"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 22:38:04 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:38:04 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 22:38:04 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 22:38:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYMHHWbyBG+JIGuJoyV3wateIYXcQf4HWqkRy3MS63TxzdOirbRVPZ4rwyfNpd3Pp9CISw5vlaYq1hwi0pd3b183W94oSyt7Q3jx/g0H/sDksDYcB/ifsJJjAQeI2Kcx6CpBWO5lyuJIH6J3TgCWq48Q6oxRlYKTAKcIEXBHfWTf0K5ST9SJTm76JsCo0z+e8YtudcX0KGPgOoANfa78D7vvLQ1SbuJOOOcBFKo2ea5xWsBVdrYW5pat8sD20LoTS2Qm308kv7wapkLzlzAU8DXoOsxeS4CaQZgcU25Oq4P5EF9TfqQ15CRyWBtJABjvVXVQXaKE4V09iVDj2V5abg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KjUnZG8xt9fXBrD3uadIgJoRIL01QYK/oryA/8aigI=;
 b=rJ9AxGUXJI3WAzOBumUdziz8gckidr6RkDM8jjBcG7oPEckWD+HpUFRNAoPOtIpS8ZRYscgUoO3vZTRGz6RCJ5yRQd6Ev2lBvyTX5pvbGwwr4maHXZBKX0Qv+XVsSN4d2/ntWM1bTlZl6T6k0qPCOrg+g8tcmZ9nw4fwARbwInZj2L6Av8ssQ0PW2LRRzll3YmlJBobXEDQRikPtQsa2Vzns7ht0yhutWLYmArq1nRENTizuNQqwrHFeNVzrkmKcmmvUJt2ijtV10DQ5nKCCAssnlFthOoxT9d1mgL7jQWZt6A0P8xw9r5jUltGsyC00YcZT3AwOWEuBp9LclmGurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:91::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 06:38:00 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 06:38:00 +0000
Message-ID: <390d6e73-bdc1-4935-950f-aac5d5857f9c@intel.com>
Date: Tue, 10 Feb 2026 12:07:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe2_hpg: Fix handling of Wa_14019988906 &
 Wa_14019877138
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260205220508.51905-2-matthew.d.roper@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20260205220508.51905-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0243.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CO1PR11MB5155:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eae426b-5b5c-4457-6277-08de686eef3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFovcmp5aStPRTZnQ0FXbFQ2bmUweUFqeHZrT2RGMUE0UVFaVVlQYnJHQXB1?=
 =?utf-8?B?Vi9KL3FRbjlFZXJxb3paY2ZwdVQwWFFJUkZhNThpTWZBS0xwWjZleDkxZzRC?=
 =?utf-8?B?MWEveDU2dEdlSE14bk9BUU5XeFhZN0Vvdm1KUnVzVzcrUC9HcUZ3dGJHVFIz?=
 =?utf-8?B?ZFIwTlZlbm10UEEzejczek8ySVovOWRmZVI5L093d280VlBCV00wdXBma28r?=
 =?utf-8?B?d3JxRVNiVUQrVUgyWFU3ajFURkdNNDBQaEtsaHhEb0FuMDJ6MWV4emhYRVNj?=
 =?utf-8?B?bTFaZ0NlNHdzNlk2bDUvdW53bXFRU1J5bmF3SUJ5TittVmFWcDNkbjgzdmYw?=
 =?utf-8?B?cnhNdVAwZHVSOWZTZmlXT3phYjIvbjl6cGszZy9hdHhlZGFjWGE0OFA5RXIr?=
 =?utf-8?B?b2FwVHBqeEJLRkN2cHpsTVA3UUhHaExwU0UzTkp3UGJlQW9pRmVEU1RwR0dO?=
 =?utf-8?B?VnJxK1V6T3JxTkJpMmhIdm5EV2kxQnIvWEpIYkJFUVgram4xZit6NWdtTnJa?=
 =?utf-8?B?aTl3UzB1eGJrRldTT05wOWgrcHF3S1JObXhJKzNIaERuRjlsYkpTT3dyTHJS?=
 =?utf-8?B?UTNOVVJlaXh3MHdiWTB6aG5YV0JVRW9nc3ViblVPd1pmNnBhQktHLzhraXhC?=
 =?utf-8?B?SEhMakRZeWRIdXFGQUk3ZC9KUFE4WDVuK2VHVy9CY3E3ZTFlV0hwZ1VjalBN?=
 =?utf-8?B?SU0xTEVTTUxNWlc2anZNMFhEczFndFdvUUxQYmh2UjIxMll2NDNNc1R6VEdm?=
 =?utf-8?B?NnNCaU5mNWZoWUxHSGc4TUNkK1AyekExcG16V0NUMGM3dWc2Ni9rNS9JS1Q2?=
 =?utf-8?B?SVFjNyt5RXZKbUpWSnNZcmp5cVV2cDRDQWVOTnE1QXlxNzBEZ29ZSHpMaFBl?=
 =?utf-8?B?eGNWcUxrMHhuQ3YvZnFXeCtFaWZaOFd1VnptM2p3bDVQUVpRUUlWanpKZS9W?=
 =?utf-8?B?d0FqNTZuRzB5VmxzS0dQeDJ2TTZnY3JCa2Jqb0NvWkhoK0JOaHd2d3NNaUhx?=
 =?utf-8?B?a2I3M0NqUUJNYVZCc2tSenhPL1F4b1FSbWtuMjBuVmtjamtBcFVGRnEzRjQv?=
 =?utf-8?B?L0lYMEsxaDhtUHlFRW9wbUd5NTgzTU1Ea1hEbnZqSVpMK0lVZ0hURi9ndUpr?=
 =?utf-8?B?Q1RaNDU4UDFyYTI4S1ZDWnE1YUVBTmxLb01VdTNTWTBJdlRzdWMyc1RpeVFJ?=
 =?utf-8?B?TFIwQVBSdDFwVkJLQnhZT0pObm1UN0hEMU94V0Z2bExPaUUrb3NBYWdFRVNO?=
 =?utf-8?B?czRjY0h0UHBUay85aDdlWXRlNlZaU1FPbGExM1N6WUhSeWFYWS82aXpNL09I?=
 =?utf-8?B?Z0NkVnRjN2IvYXlXbk5adU5CU1dyTkx3M3VjbUszd0szbEpZZkQySmNxNEtE?=
 =?utf-8?B?MCtpNFJPTTVPVk1vY2dKQWJSY2s2OVdKT0xWL08zTmFEOExGZy93ZFJIL2J6?=
 =?utf-8?B?dkpmQ0ttQnRMNkRHdDMzMGdDT1liNWRiWjhHUU0zbDZPNkRaL25jeERhNTFy?=
 =?utf-8?B?bFJBMDRTaXhjaVNCdEU5RktuTldkQ09LdWNJdGZBbWFzWFhPSmhPMldNaEY1?=
 =?utf-8?B?R2QrTTNiVTJyZ3FVT3BLM0xsNVdVcjVnTTkrbFZ4emFFcXhHUVErUERNVVZj?=
 =?utf-8?B?Ly8xT0poZlV0UXlYQ0EzYk1oby9qN2ZiV3E0VlcvVlhyL1hud3NnMERNQXJB?=
 =?utf-8?B?TUo1V3VIbVloR0g1VmJwbkE2cjNzNm9CR3o5YVNjcEczU29zYWRhbURoVHNy?=
 =?utf-8?B?dXRpMWVYSFd3OElYcFVQUE5Gbk9meC9renFLRjhWVmN0NUlxUVRrNStoVEdh?=
 =?utf-8?B?QVF2N0cvUjBHeHREZFlRcGJXVGVmTzNLM1IvT2VmR054dGRGM3ZwZ0VUaDVY?=
 =?utf-8?B?MGRETXRyWGtLcVN5cHhRa3ZZYk1sS2FMTVhLYW1FTDQ5dWNxRTVTdEJOYkMx?=
 =?utf-8?B?VEtROHpwcXhUdDYwUFJCdThOMkRwd3psZUhDNnF4L1ZsVU5qTEs0NkR3b2Nu?=
 =?utf-8?B?UVdwYkU0bXZOVngvZG5LN296a0hmYzE1WU50SzFGYW15VERrYkZZMm9kRHIw?=
 =?utf-8?B?d2hyT3pzMXBFVmxmNjlXUlNRMTVoeG80K2RucVdMU1lkRlJpb3hzSjhIcG1J?=
 =?utf-8?Q?yEJg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vnc0VnRSL3gzZ0JjbHk3R21VdzBvRjhhUWVOMnFCd0RwNVkwaVk3Q2pRUkl2?=
 =?utf-8?B?eGhmd3U1Q1JDeHJVVEEyeU91NE8zbkp4SWNZclB4R0N4Tzg4c1RiQnU0d21M?=
 =?utf-8?B?c2RwRkoyWTVkOEYxeVhQWm9UR1FDb1dtZUdWbW56aE9Zcno4d0VZYmdnR1hi?=
 =?utf-8?B?YkZ0RHU3WVgvaGcvWncxSWNNWkdCV2lSY0dvTGtFNkprTjEzL3hMZEF1bkcv?=
 =?utf-8?B?SmlXZUJRTThwUDJuRFhxbmtHWTB0RlljSko5RG81aHY0clJDU1hFUEtKajVB?=
 =?utf-8?B?TUgyNFB6eVNHbjU2RHNCSStMUmVad2w2NVVselNSR0tZclZOancxUHNLMUxj?=
 =?utf-8?B?Mk04SWtvc2tmblc0cCtrekVTcElDWHhvdUtHVTNzS0thK2FhZUxFcHhvZmV0?=
 =?utf-8?B?ajZpWDdJdnBlTlhBWlM4cGFoSWZkOGlYUFJYRFdSMW44a3VPV1NKNCtoVWp6?=
 =?utf-8?B?UFJZNEFaZUgyWjhZNkQrbkkwNnB1OFBCOXlnQjdrRGV0R0tHRGdBa2RHOVBX?=
 =?utf-8?B?RnRReFhZcm9IRUxUTHFiN29KeHhwTG42UldLRkNhNnpjT0hybXIyZWtvU0E2?=
 =?utf-8?B?NEkvTVU3eURqUUxGRTZKN3JidlkvSHlsUk9YaG1wMWRNUzVmODJYRHZEUEVx?=
 =?utf-8?B?MFFNMldodzFTVndwSDRCakdxam40R1VDSkNkK0RZSXk3S2FQYnRkZDEzTEdo?=
 =?utf-8?B?eFN6cWpaYlFqODVTaExQNkJyOWVnemhncHR1R083VGluZDh2bEJNYkx0S3Jr?=
 =?utf-8?B?YWZaZTQ5Sy95SDdDWG9oM2hZdVhRYWh0eklvVmw5bTFXYWFrSXdMWkxDWU9J?=
 =?utf-8?B?am82YUZkTDlBbjlCblFkV0ZzY1p6TXVsRm9vSlhNeitBS3hBaitTMmRyMTVU?=
 =?utf-8?B?WDZ0aFZabUkyK3N0b1grMmk3Q2xzdUJOM09QdEZtM2JoWFZ1a3p2amRVdVhs?=
 =?utf-8?B?UjEzZjZ0U1hLb3pFTEppZ1ovUVMzODBybStLWStCcW1NRnFuc0dEMCt3MFlF?=
 =?utf-8?B?emZyclBsd2tiV3F3VmZEYjZBQ3ZBTzBaTkpsek1Wd1Y1OHBLbldzUWc3Y25u?=
 =?utf-8?B?R1NrdE11Njg5M0IwaVpKak1Ec1owME42bXh1MmdhaWVYajBwNjEwYmJQZXJl?=
 =?utf-8?B?em1sRlpzVFBnUFlaZC8yMzRVbDRVMzBoeUxkZHozMEM4NUxET1I3eXA1Yng4?=
 =?utf-8?B?YWkyUWxmRGFCU2Y4VkVma2tzcTkzRDJBV1FMaDF5SDA5L2xKL05kdCtMMDNm?=
 =?utf-8?B?N1p1N3FReUdUUUhkQklhWk9NeUZnd2ZSbGp5d3BmZGM0U3JwQ2o3emNMN1pD?=
 =?utf-8?B?T0IreUN3d0dycnZnR3ZOZVJsMy84Z2pzVXJodkF2MUNXNlZET3VQaktmN3BH?=
 =?utf-8?B?VmQ4YnBXNTZBMExHQjZ5V29kd2hwdEdZZDIzdGduNW9HUzhiNHErWlhLdG1Q?=
 =?utf-8?B?K0lnaTEwK3gzSHNpcGFSRHlLSkFvZ3lCdXJSSEtNekNobE5OcXZ1R3R3UEFh?=
 =?utf-8?B?Z1FNYWhub3JSbFhJRlZYdGc3SHF6b1QxeGpaVXcvTXlSNW5MKzlkanJ4YU45?=
 =?utf-8?B?NTNBRHE3dkdUT1hMUHU1OEFSNDVUaFFZR2pLM2Y4QWFLTjQ2TU80aHoxSC9X?=
 =?utf-8?B?Tm9VRm53dkhxZktJN2g0QWZyTUlLNjhVZkZnTFd1aFJPclYvMDdJaHdPUzlX?=
 =?utf-8?B?U216SUxvK1NzcHhQUzhjT201UFArOGJGMDQxczFsd0xpUVg1aWx1TmpMcWxh?=
 =?utf-8?B?ZUM3MU1hZ0E0T2trc2hKQkpkM0pkV3NKaXdiQVkrUDhHVlB1cjZ3T0xhK214?=
 =?utf-8?B?S0ZwNHRWVnZRc3dEand6ZHJ1V2sxUVNkVmRKa003WStDbFFJQ05FdFQxalRB?=
 =?utf-8?B?QVJpT0duNGFTTFpwRTNhcU5JSUgzaGUxamJ0NG4rUGpEaXVqOUpsdjFyMVh1?=
 =?utf-8?B?U0huckQ2VUVzdUdnK2lUaUl3MVV4THc4YklCY1d0YUxOOVZtMHdJNW53aUtC?=
 =?utf-8?B?K1dNM3ZVVmQxTlVkRjloY3lvNFB5Vm15SUswU1hDaTFpeUtWc0dNd2UrNFM3?=
 =?utf-8?B?RFd1WElWNzJtUFVJMnlxdDVxL0V0RXd4eS9vaUprWWhoa295TW82V2c3THFp?=
 =?utf-8?B?Q0NJNXExMmZtZTU2dWZvZTV5UCtlUGc2S3RySkhsUFY3bUNIUDRpb2NiTTBh?=
 =?utf-8?B?SVRJdTN5NXFaY3RsWWhYTkpjMWVOQWNBNTlTVDhtQ2dFNkUrODA5QXBqZTNy?=
 =?utf-8?B?bEZyNCs1R3hIMHBjZFlRS1NWL2MyWGY1SXp1MU11alEzWUFKTFlxT1RKcTR6?=
 =?utf-8?B?WFFPdVI0UTJra1hzb1dXY3dzVmk0TitUckVOTS9ZV1FCcW5LNWZ4UVM4ckJi?=
 =?utf-8?Q?5qdJF8GpclJMSqM0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eae426b-5b5c-4457-6277-08de686eef3e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 06:38:00.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9U54FivFogrLqX0jGRS39EguCl2Vwwybiu+8FWqjp6c3zxFV2JFUP6So/jELQAVKLoJEra12lhOHAcjQmbX8lvrJGpkZPMD7CAO3mNyslg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
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


On 2/6/2026 3:35, Matt Roper wrote:
> The PSS_CHICKEN register has been part of the RCS engine's LRC since it
> was first introduced in Xe_LP.  That means that any workarounds that
> adjust its value (such as Wa_14019988906 and Wa_14019877138) need to be
> implemented in the lrc_was[] table so that they become part of the
> default LRC from which all subsequent LRCs are copied.  Although these
> workarounds were implemented correctly on most platforms, they were
> incorrectly placed on the engine_was[] table for Xe2_HPG.
>
> Move the workarounds to the proper lrc_was[] table and switch the
> 'xe_rtp_match_first_render_or_compute' rule to specifically match the
> RCS since that's the engine whose LRC manages the register.
>
> Bspec: 65182
> Fixes: 7f3ee7d88058 ("drm/xe/xe2hpg: Add initial GT workarounds")
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
LGTM,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_wa.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 1e8d61ac581b..d37edc62b6a6 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -567,16 +567,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
>   	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>   	},
> -	{ XE_RTP_NAME("14019988906"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> -	},
> -	{ XE_RTP_NAME("14019877138"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> -	},
>   	{ XE_RTP_NAME("14020338487"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>   		       FUNC(xe_rtp_match_first_render_or_compute)),
> @@ -852,6 +842,14 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
>   	},
> +	{ XE_RTP_NAME("14019988906"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> +	},
> +	{ XE_RTP_NAME("14019877138"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> +	},
>   	{ XE_RTP_NAME("14021490052"),
>   	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
>   	  XE_RTP_ACTIONS(SET(FF_MODE,
