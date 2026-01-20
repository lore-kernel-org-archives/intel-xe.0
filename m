Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47D7CA5FAF
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 16:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7873B10E636;
	Tue, 20 Jan 2026 16:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YyxioSri";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA0D10E636
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768928343; x=1800464343;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3TXQdCGPJD8pnf0adNtL6naxLLMSjceEPT34Eixxspg=;
 b=YyxioSriDWtFqI4qKpcfROzel47Bmc7Vr/zinwlehFcVqr0YltvH6hoP
 6guqELNSuzpNS6aKS9D/WtLGmG6WG5N7PchwKb9XhTvqKO8xbP/nsbCwi
 239fAjNlS/Nr90VfiX2NQoWACbzDZQ3aFijYjBmRqvV2s1KDcZNUjeEAa
 JELI2ez7L54ZIOypqEQK1PahOOSxZiJG0Ky5o9S6V30g7T+6gzH6a6TLi
 E+/TxivE9Pt9+dJiTGZTgmOSBOMBdyWQ7pCnnk/JGXAfWTVoO00IrMfwT
 GHjM13mp0d5azEqS6mpxGbjVJZ2WOSdKlMJ8TLq6ILSbGgcjjcWZjWdV0 g==;
X-CSE-ConnectionGUID: HxiRCgbQSduxP6B5MzAhbw==
X-CSE-MsgGUID: tItyM/sBR+2ehwmxGqXQZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70117033"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="70117033"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:58:17 -0800
X-CSE-ConnectionGUID: LyAW0GupSZ6+gCFMxsVf/w==
X-CSE-MsgGUID: 45epp5GxTlWQ/N101irgiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206215400"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 08:58:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:58:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 08:58:15 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 08:58:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4idFXGmGxrGlCNHCB9OCuNS9BtjfoVWCKDpZ/yXZmW4yVA8vEYtmzcWn2XPzXnK86as5v8pCjntca+jqVPfUGXeYFe6BuZPXt+HeEl7X+NXrB1RxVKmSYkcznSu7H8v1EjsB475KMARnDcso03A7LAOE/VxW6gu3ZmbOmojyh2XAZBLXyXnrde+4Ng7FPcIeMMeuuhbDmildTPkssX2JIdFxKkFTxm8aw74HUaQVCLNrmV/PyoKN5vVZYKoq0zYo6MJ5MERMqrCU1bIZchYNTh7+5aWxgRnEnIkW+AeIRNaLp0x9UOIIsrZtYtYWJeXP2YCoNh44J1DG6+xbruYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf3jDt9HjH33WCTrohPpiR+1scqUH756Eoe546CEnEU=;
 b=cCjuRinBIp8gEK8OKs2ynSnAVKKOR90/I+iO0UaQuUKv8yzQWZ0oqGNWC4MGYyMjYQQEunlevBm7GRcqlMSP47jHPAytvyBvCGOcGIlWcjTtS0iwIG/wizDOIZw8YEGMl9Mu1E1N6vYK6nQTMFkcrQ6GohMTUTHpOkXIq0b/oMzvVvmEcLMoG2+ZGzXPJP3lOl1s4/ris9wzXx+o7zccrsH6ZnuxRGg5um3b4L3fNjAXh6fsZhHqzIjTIsoinVa1ty6qTNqXT17kTZAqJ74tTTCxXPNU2pk0RWXFy5DuoKBSDY535RtcA21yxzXl5zZNx77T4ReXBrYeXfqfax5RHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Tue, 20 Jan
 2026 16:58:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 20 Jan 2026
 16:58:08 +0000
Date: Tue, 20 Jan 2026 08:58:05 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pallavi.mishra@intel.com>
Subject: Re: [PATCH v4 3/8] drm/xe/madvise: Implement purgeable buffer object
 support
Message-ID: <aW+0HUCM9UvfTL05@lstrano-desk.jf.intel.com>
References: <20260120060900.3137984-1-arvind.yadav@intel.com>
 <20260120060900.3137984-4-arvind.yadav@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120060900.3137984-4-arvind.yadav@intel.com>
X-ClientProxiedBy: MW4PR04CA0182.namprd04.prod.outlook.com
 (2603:10b6:303:86::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c6aa6d-5a72-48e0-2346-08de584515ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d05kQlBjWGZscmVlTUFJOHVNOE9GQkRyZ3hHOWN5djNoa1VnVk1ubFR3cU9h?=
 =?utf-8?B?QzhVd3Y3VU00TmE4dTFBRWZxdmpjUVpOWUJvVzgxQ1l6ZlZuZzdYaDM3Zi9y?=
 =?utf-8?B?WVgxaTN0SURKd21aazZXdVJ4Mnh1TlNrc0xGMzVveURGSjJ3NHhGcExCV0U5?=
 =?utf-8?B?MFV0SUh0alVUTFhDSDlrRThKOWxWU0t0Q0JiQ1ErZnpraUduR1N4aTFFZGhK?=
 =?utf-8?B?T0VPUFlDZnNKVjNublRaaUx4aHVUdXFFOVMzanNDVDNORkdLTUI4VXpWTW9r?=
 =?utf-8?B?Uk9MdE1aUnZrU3E0Q2NIajlFUkJ4Z0hTdVJScWFTaUFKeHlwR2pKZEhzMUV6?=
 =?utf-8?B?Z3ZhaythMExWTmtxeGMvV3ByQmhWaHdsU2ZPM00rTnpMblcwakZ6TVdvbUpY?=
 =?utf-8?B?YlZWcHRldnd1amFTS21zQ3J6cmhIckExRFpGV2VYaXBBdWtvVzFTaHBSbjhS?=
 =?utf-8?B?dlFzVjcvaXJYTHhHaG41aCtrWnM2QlVDd0NDUEttcmp4QmNBaUF2RitabVFn?=
 =?utf-8?B?UGxVVThaUDJIT1ZhaEVscGd4aEFqSkRLTStNaXU1WjhoeHArZmJVeE1OeUhM?=
 =?utf-8?B?UzFLZk5hU1VwRTU0OE1yTnhtWFlPY3pneHZuTlpmYjN0LzhJSU9RTkswK2Vs?=
 =?utf-8?B?MVYxdlJMQXRQUHFWZG80UVd1ZGRJSGVFYS8vVXplMWd3M1VURlYrbWJLZ3ZN?=
 =?utf-8?B?SlhWeHVkWG1rcGQvS2x5L0xmbFNnazRCN0o1aUlNODMvVGp3N3JSdjNEdzdu?=
 =?utf-8?B?YXdpalFEcnp5Yy9hV2hsREl5ZkhmQXRLQzJjSTFwQUdpQUtyS1FLelIvc2dq?=
 =?utf-8?B?aDBKbVlTQTZhSE9LZFN6VVVnL051Sm5RbktiTEdUNVREbmFnTmM3UkhidEZj?=
 =?utf-8?B?VnVxd280TEdxSkhTMmw5aUY1Qjl6NW5zR1NubkRUNXlwZFNGS1hzWlhJdmNX?=
 =?utf-8?B?UU4ycTVwZ0FmdTNwU0NXTldVWWlUbFU0ZTdaQ0dPc0tmakg5WWwvcWdWT0Q2?=
 =?utf-8?B?dk5KZUNBUnVsSG9udVVXYUx1c2JLQkdrb0owRzlRa3B4Qy8weDh0QXhqRXFw?=
 =?utf-8?B?S1IyTHd3c29Hd01HdWNKTFhPM3pnY21tVnh1cW45NE5iZjRtdDBxVmZSWjIz?=
 =?utf-8?B?TkxYbkNuUnVHK0x1Z00vcG9SVWdzOTJLZHFWNUJFM0R6eWtEbzBxS0hJZWNJ?=
 =?utf-8?B?TE1XK00wRWttbG5zR2pqYmdySEhxbEhlL05aUE03di9zS0tMVjRhejJGcG16?=
 =?utf-8?B?TStQRnNqempuSGdOcnJYM2l5eS9VKzd4YmxtVzBlWGFmdHdOallCUEptaEIv?=
 =?utf-8?B?NWxlQnUxRG5wWWlzMXArYUhabGd0QTY4dnFnc2tDTVltNWJUamxxSVRyUWU2?=
 =?utf-8?B?ejZsUkw4YmF3S3E1cHM1WFdUdVpVZVRZSHpRQWlzN28vV3JSOUk2eDBiNkt1?=
 =?utf-8?B?cVVRRzliMGJ3ayswdjRidkJnNHBNUEZ1OHp6eHFFWm1XWW1rdVQrSjQyOHdz?=
 =?utf-8?B?M2wySFhMcWZmclpZV1B6d2kyZkcrQ29iSWl5dXc2TWM5bkJnWG8xL3M3U1pV?=
 =?utf-8?B?cTE5blFlZDlQWFdWVnJac0lZMllKQ1BvNXFBVFdNeVlDVlVZNWtjSGdCZzN3?=
 =?utf-8?B?SWp3WkRCbVNqQS9SRDViZzh6b1p2STYvNzlsamRNUTFaSjlhUjNPUGh6YWhC?=
 =?utf-8?B?NnZwTS9jejZlUWFLK0hucSsxcUdnZkk0MEJVbTBWTWdOcis2V0kyMEEvWUQz?=
 =?utf-8?B?VlJ3a1NhSWhLZThacGE3SUdNZXNBTU8yaWJqSW5NbWtsMC9EczUzUWVXM3JV?=
 =?utf-8?B?OWpvVWRVeVFHWVlDOGw4aWVMZ0ZXYTZTcm1NdkpZdzRhRlNEL0FzNGxyL3F1?=
 =?utf-8?B?Mkkyd1BlTjAzWWV3eisrL3o5ejRvYXlIVGxaVzB1SkRQSi85RXdLd0lHOU40?=
 =?utf-8?B?V3RqK0JXYlUreXFyVGVJekVYNGp2blJiVUhsUHJLMloxYnViSWdtL0tXY01W?=
 =?utf-8?B?blV1R2pNTi9aUWVHSU1mMWV6MTA2UFcwOVRaK2NTTVJVQ2dzOGNPVGlGMno4?=
 =?utf-8?B?aXhzd2Mya0Y3WGtjR3RJc2FVczh5YldGVmVnT0o5TlhDdnVucGg4TkpvK0V1?=
 =?utf-8?Q?zkBk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEdLaGtlVnhLNHBpQ3BWNnFNNlFvWHNFdWtYeTdQSGdCNDZOZzUyUmtYRk5y?=
 =?utf-8?B?Zk9uUEpsbm9hanF0a1ZKVW5EMVp2YU4yNVE0Wld0cm5SYzQxYk1XVTAwOU9k?=
 =?utf-8?B?VHpzdzBWK1hCK3Fwc3NsdGVkdElIWUMrQ1F3VXdTNnlKcmtnS3BINW5zckVF?=
 =?utf-8?B?VE9Xd3I5Y21nSGpMb3pTaUR4c2VEQ2NSOXcwOHkxUDJ4dTJoclc2MnJ1Z2FY?=
 =?utf-8?B?MS9NRlhFcUdMZVRFV2tOd24xQytQanFlNGxVN3h0UWdiOUVlc1p5QW0zcEVu?=
 =?utf-8?B?enNIM0NzNjg1bU5IMjhrRzV6b0xDMGNMbU5BTXBDdjBvby91UGlxNER1YTlP?=
 =?utf-8?B?bFZIalcxNzhFelA0QmRzTUZIMGxNeVBOSUZGbjY1VGIvdml1Y0NYcUdUMC9q?=
 =?utf-8?B?ZlJZaUV3RmxGaG95SEkvYU9SMzMwbnVGL2M0UTBGai84emZydHdCWVhRcEVp?=
 =?utf-8?B?NHpxTDJTVUZuNXpGUGdkZnBpbXhCRkJtb2xpOCt4K0I1TGFXdHMxR3VleWpt?=
 =?utf-8?B?TnIrMW13b1N0dmZ1bENBdGhOMnhNUmNMQTdBNllROHExVm9vK0c2blVLcWMv?=
 =?utf-8?B?R2kvdlJ0ZEpNTmxPVTJkWjBacml3c1lGSVNFdW1WZ1gyTTF2c1lwUkN4SHEy?=
 =?utf-8?B?TUlvVnV5SFBEdHV5SEdVbVk3cW03TzduM1BZTER6Nko5cnkydG1mMDVYSDdr?=
 =?utf-8?B?OWlNblNablNaSHRHS2JsaHhTOXE1SE0vdHR2TGlrS3IxSHgybzFPRnJ4WDdZ?=
 =?utf-8?B?T0pyTjRRci9BUVRLWkJ6ZlRJUENsbTdjc3lPckJ3aHplVGtRNGRrb3lnZFFl?=
 =?utf-8?B?ZEM1T1UwZWkvNjN2THdCdlEyTFd5UjBxYlJkZkEwSnVLSFFPY1JhRW5icVl1?=
 =?utf-8?B?WlZtUXVtbW5vb1ZPQnlUc3lqSEdMdnlUbnlma1RxOElxUFZmU0dWSURjbXRp?=
 =?utf-8?B?UnZyYjZqVVBXVXBDZy8xYndSMDlXK3NJczNMbWY5ZWhoQ0xHRTFMTE9zSzZM?=
 =?utf-8?B?ZVpjRE9aSXBpaW9jNnc2TmEyQ1JmMi9YWGFsTVJ5SEZQeEo2enpYVEVQdHc2?=
 =?utf-8?B?cm04K2hUb3BpeEZhZXlucGhFT2Jtdk9TUFdJKzk0T09tWGVhTngvN1lZWksv?=
 =?utf-8?B?b2VQQ0xYdnB4RldOd2tpZlNRa2FhSDVVcXhTQTAzOGV0djJWeENnWEJIcjBR?=
 =?utf-8?B?MXorT0lKelFyL0c3a0hadXlNY3dNdGh2VVowdCs2QjRjWW1meG40WkIrd1ZC?=
 =?utf-8?B?b04wQWFYem9hcUgwOXhQbmxnM2ZrV3VTOWM4WitWY002Wlp5YW8xTy9vM1B5?=
 =?utf-8?B?aXhpT0tQeHJVYVJUSGtMamQyd2xNdm03bHp2dzMxTWlZRnRJaEN1OEZEWGND?=
 =?utf-8?B?T0hMNEo2YjA2STFWa0lYVzB3VEQwTVJla1NmOC93TGVUdnpsaDhEc2VQU2pB?=
 =?utf-8?B?SlU4c050bDFqK3ZHRm9tbWdXNnE0d0FvVDJzTEx3RXhueWNBejJXaXNnbFJk?=
 =?utf-8?B?VktoQUVmU08rZTVySWhxaEJBQ0doeDJqZysyOXQyTUprK0RyTzZTeGJHbHBj?=
 =?utf-8?B?M0FscHRmM1VwRGlxWXYzVVBzcy9qVkttVzF5amt1a2hUeUhXUXcrQWQvWjd1?=
 =?utf-8?B?WCtlNTNsQmJsdkh6ZXBUNFBYSklBZ1VqZXZGUEV5OG5TMUswZXJsWkVhZ09D?=
 =?utf-8?B?SlhSeWRka2Z5WklvRHdaM1g0MklFM0V0dkllRGJoQ1M1Z1lDb1pXWGlFcFll?=
 =?utf-8?B?d1RGbjJzeS9KZ3BkUlFla2xQWDV1cEZxYjdpNDdqMmNDb0JuR1pQUHpaS2JI?=
 =?utf-8?B?MFdzV3pJc2tRc2xqQ3VZNmg4N0ZlNjBGbE9ZM2c3R3k1YmE0M3pMWFdzc1dB?=
 =?utf-8?B?VlRSTHhhUXlWNXpUOEZkcFdzbzNkNTErck1iUXYzU1FtNjVpWEpyRk1IbW5R?=
 =?utf-8?B?aGdmNzBKQWhjOUU1VG9ncm9xd2xCQkVmUmRjWkU3R0NPRUhwUldOOWJXOUIw?=
 =?utf-8?B?WW8zVDh6K09WbWhOTHdWb1FhVWxoNllqNGZoYXBJMEVSMkljalNEV093dSt5?=
 =?utf-8?B?cW4zWStvNko2VVBmQldoNGRPUzJBcnprMEhHT0dIcDZCeHBJNW9yL3Y4RXd2?=
 =?utf-8?B?dVh1WU1pQzB6bDlGUjZ6RHVBR3NZMUlVdWNCYThxc1o3MzZ4cGJqYzUzM0RU?=
 =?utf-8?B?ZDVYSWtObnEzbmtlWjV0WmtIZXFiRzlicXQwTTk2QVh0VDVTY2FVeTR1L09k?=
 =?utf-8?B?TzJ0SkpUcGczb0grRE9WS0pwRFlHQzNzdVgwL1M5dDhRZFh1YkFMc2VCVUdl?=
 =?utf-8?B?SE84QWRVQ05tMzdmZEVRcFM5aE5lblJvekNOUFdFUHdINkduUHN6QT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c6aa6d-5a72-48e0-2346-08de584515ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:58:08.0132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PMYfEumNHgVcvK7jJToEsCkeBGOJQwYIXcokR1h2DfuKejeAK9zi6J03iiHzAJSCYZmXBVW6CuO08/7GzEoXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Tue, Jan 20, 2026 at 11:38:49AM +0530, Arvind Yadav wrote:
> This allows userspace applications to provide memory usage hints to
> the kernel for better memory management under pressure:
> 
> Add the core implementation for purgeable buffer objects, enabling memory
> reclamation of user-designated DONTNEED buffers during eviction.
> 
> This patch implements the purge operation and state machine transitions:
> 
> Purgeable States (from xe_madv_purgeable_state):
>  - WILLNEED (0): BO should be retained, actively used
>  - DONTNEED (1): BO eligible for purging, not currently needed
>  - PURGED (2): BO backing store reclaimed, permanently invalid
> 
> Design Rationale:
>   - Async TLB invalidation via trigger_rebind (no blocking xe_vm_invalidate_vma)
>   - i915 compatibility: retained field, "once purged always purged" semantics
>   - Shared BO protection prevents multi-process memory corruption
>   - Scratch PTE reuse avoids new infrastructure, safe for fault mode
> 
> v2:
>   - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas Hellström)
>   - Add NULL rebind with scratch PTEs for fault mode (Thomas Hellström)
>   - Implement i915-compatible retained field logic (Thomas Hellström)
>   - Skip BO validation for purged BOs in page fault handler (crash fix)
>   - Add scratch VM check in page fault path (non-scratch VMs fail fault)
>   - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping (review fix)
>   - Add !is_purged check to resource cursor setup to prevent stale access
> 
> v3:
>   - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>     with xe_pagefault.c (Matthew Brost)
>   - Xe specific warn on (Matthew Brost)
>   - Call helpers for madv_purgeable access(Matthew Brost)
>   - Remove bo NULL check(Matthew Brost)
>   - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>   - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
>   - Drop is_purged from xe_pt_stage_bind_entry and just set is_null to true
>     for purged BO rename s/is_null/is_null_or_purged (by Matt)
>   - UAPI rule should not be changed.(Matthew Brost)
>   - Make 'retained' a userptr (Matthew Brost)
> 
> v4:
>   - @madv_purgeable atomic_t → u32 change across all relevant patches. (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c         | 61 +++++++++++++++++----
>  drivers/gpu/drm/xe/xe_pagefault.c  | 12 ++++
>  drivers/gpu/drm/xe/xe_pt.c         | 38 +++++++++++--
>  drivers/gpu/drm/xe/xe_vm.c         | 11 +++-
>  drivers/gpu/drm/xe/xe_vm_madvise.c | 88 ++++++++++++++++++++++++++++++
>  5 files changed, 191 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 408c74216fdf..d0a6d340b255 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -836,6 +836,43 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>  	return 0;
>  }
>  
> +/**
> + * xe_ttm_bo_purge() - Purge buffer object backing store
> + * @ttm_bo: The TTM buffer object to purge
> + * @ctx: TTM operation context
> + *
> + * This function purges the backing store of a BO marked as DONTNEED and
> + * triggers rebind to invalidate stale GPU mappings. For fault-mode VMs,
> + * this zaps the PTEs. The next GPU access will trigger a page fault and
> + * perform NULL rebind (scratch pages or clear PTEs based on VM config).
> + */
> +static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> +{
> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +

xe_bo_assert_held(bo);

> +	if (ttm_bo->ttm) {
> +		struct ttm_placement place = {};
> +		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> +
> +		drm_WARN_ON(&xe->drm, ret);

I think since 'xe' in available here, you should use xe_assert in place
of drm_WARN_ON.

> +		if (!ret) {
> +			if (xe_bo_madv_is_dontneed(bo)) {
> +				bo->madv_purgeable = XE_MADV_PURGEABLE_PURGED;

Helper to set madv_purgeable state /w lockdep assert?

Also perhaps assert valid state transitions in the helper (e.g., you
cannot tranistion out of XE_MADV_PURGEABLE_PURGED.

> +
> +				/*
> +				 * Trigger rebind to invalidate stale GPU mappings.
> +				 * - Non-fault mode: Marks VMAs for rebind
> +				 * - Fault mode: Zaps PTEs (sets to 0), next access triggers fault
> +				 *   and NULL rebind with scratch/clear PTEs per VM config
> +				 */
> +				ret = xe_bo_trigger_rebind(xe, bo, ctx);
> +				XE_WARN_ON(ret);

I think xe_bo_trigger_rebind is allowed to fail if ctx->no_wait_gpu is
set. In both the faulting fast path and certain parts of the shrinker we
set this. So I think any error returned from xe_bo_trigger_rebind needs
to propagte up the call stack.

> +			}
> +		}
> +	}
> +}
> +
>  static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		      struct ttm_operation_ctx *ctx,
>  		      struct ttm_resource *new_mem,
> @@ -855,6 +892,15 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  				  ttm && ttm_tt_is_populated(ttm)) ? true : false;
>  	int ret = 0;
>  
> +	/*
> +	 * Purge only non-shared BOs explicitly marked DONTNEED by userspace.
> +	 * The move_notify callback will handle invalidation asynchronously.
> +	 */
> +	if (evict && xe_bo_madv_is_dontneed(bo)) {
> +		xe_ttm_bo_purge(ttm_bo, ctx);

With above, we need to send errors from xe_ttm_bo_purge up the call
stack.

> +		return 0;
> +	}
> +
>  	/* Bo creation path, moving to system or TT. */
>  	if ((!old_mem && ttm) && !handle_system_ccs) {
>  		if (new_mem->mem_type == XE_PL_TT)
> @@ -1604,18 +1650,6 @@ static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  	}
>  }
>  
> -static void xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct ttm_operation_ctx *ctx)
> -{
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -
> -	if (ttm_bo->ttm) {
> -		struct ttm_placement place = {};
> -		int ret = ttm_bo_validate(ttm_bo, &place, ctx);
> -
> -		drm_WARN_ON(&xe->drm, ret);
> -	}
> -}
> -
>  static void xe_ttm_bo_swap_notify(struct ttm_buffer_object *ttm_bo)
>  {
>  	struct ttm_operation_ctx ctx = {
> @@ -2196,6 +2230,9 @@ struct xe_bo *xe_bo_init_locked(struct xe_device *xe, struct xe_bo *bo,
>  #endif
>  	INIT_LIST_HEAD(&bo->vram_userfault_link);
>  
> +	/* Initialize purge advisory state */
> +	bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +
>  	drm_gem_private_object_init(&xe->drm, &bo->ttm.base, size);
>  
>  	if (resv) {
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 6bee53d6ffc3..e3ace179e9cf 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -59,6 +59,18 @@ static int xe_pagefault_begin(struct drm_exec *exec, struct xe_vma *vma,
>  	if (!bo)
>  		return 0;
>  
> +	/*
> +	 * Check if BO is purged (under dma-resv lock).
> +	 * For purged BOs:
> +	 * - Scratch VMs: Skip validation, rebind will use scratch PTEs
> +	 * - Non-scratch VMs: FAIL the page fault (no scratch page available)
> +	 */
> +	if (unlikely(xe_bo_is_purged(bo))) {
> +		if (!xe_vm_has_scratch(vm))
> +			return -EACCES;
> +		return 0;
> +	}
> +
>  	return need_vram_move ? xe_bo_migrate(bo, vram->placement, NULL, exec) :
>  		xe_bo_validate(bo, vm, true, exec);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 6703a7049227..c8c66300e25b 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -533,20 +533,26 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  	/* Is this a leaf entry ?*/
>  	if (level == 0 || xe_pt_hugepte_possible(addr, next, level, xe_walk)) {
>  		struct xe_res_cursor *curs = xe_walk->curs;
> -		bool is_null = xe_vma_is_null(xe_walk->vma);
> -		bool is_vram = is_null ? false : xe_res_is_vram(curs);
> +		struct xe_bo *bo = xe_vma_bo(xe_walk->vma);
> +		bool is_null_or_purged = xe_vma_is_null(xe_walk->vma) ||
> +					 (bo && xe_bo_is_purged(bo));
> +		bool is_vram = is_null_or_purged ? false : xe_res_is_vram(curs);
>  
>  		XE_WARN_ON(xe_walk->va_curs_start != addr);
>  
>  		if (xe_walk->clear_pt) {
>  			pte = 0;
>  		} else {
> -			pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> +			/*
> +			 * For purged BOs, treat like null VMAs - pass address 0.
> +			 * The pte_encode_vma will set XE_PTE_NULL flag for scratch mapping.
> +			 */
> +			pte = vm->pt_ops->pte_encode_vma(is_null_or_purged ? 0 :
>  							 xe_res_dma(curs) +
>  							 xe_walk->dma_offset,
>  							 xe_walk->vma,
>  							 pat_index, level);
> -			if (!is_null)
> +			if (!is_null_or_purged)
>  				pte |= is_vram ? xe_walk->default_vram_pte :
>  					xe_walk->default_system_pte;
>  
> @@ -570,7 +576,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>  		if (unlikely(ret))
>  			return ret;
>  
> -		if (!is_null && !xe_walk->clear_pt)
> +		if (!is_null_or_purged && !xe_walk->clear_pt)
>  			xe_res_next(curs, next - addr);
>  		xe_walk->va_curs_start = next;
>  		xe_walk->vma->gpuva.flags |= (XE_VMA_PTE_4K << level);
> @@ -723,6 +729,26 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	};
>  	struct xe_pt *pt = vm->pt_root[tile->id];
>  	int ret;
> +	bool is_purged = false;
> +
> +	/*
> +	 * Check if BO is purged:
> +	 * - Scratch VMs: Use scratch PTEs (XE_PTE_NULL) for safe zero reads
> +	 * - Non-scratch VMs: Clear PTEs to zero (non-present) to avoid mapping to phys addr 0
> +	 *
> +	 * For non-scratch VMs, we force clear_pt=true so leaf PTEs become completely
> +	 * zero instead of creating a PRESENT mapping to physical address 0.
> +	 */
> +	if (bo && xe_bo_is_purged(bo)) {
> +		is_purged = true;
> +
> +		/*
> +		 * For non-scratch VMs, a NULL rebind should use zero PTEs
> +		 * (non-present), not a present PTE to phys 0.
> +		 */
> +		if (!xe_vm_has_scratch(vm))
> +			xe_walk.clear_pt = true;
> +	}
>  
>  	if (range) {
>  		/* Move this entire thing to xe_svm.c? */
> @@ -762,7 +788,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  	if (!range)
>  		xe_bo_assert_held(bo);
>  
> -	if (!xe_vma_is_null(vma) && !range) {
> +	if (!xe_vma_is_null(vma) && !range && !is_purged) {
>  		if (xe_vma_is_userptr(vma))
>  			xe_res_first_dma(to_userptr_vma(vma)->userptr.pages.dma_addr, 0,
>  					 xe_vma_size(vma), &curs);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 694f592a0f01..c3a5fe76ff96 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1359,6 +1359,9 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>  static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  			       u16 pat_index, u32 pt_level)
>  {
> +	struct xe_bo *bo = xe_vma_bo(vma);
> +	struct xe_vm *vm = xe_vma_vm(vma);
> +
>  	pte |= XE_PAGE_PRESENT;
>  
>  	if (likely(!xe_vma_read_only(vma)))
> @@ -1367,7 +1370,13 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>  	pte |= pte_encode_pat_index(pat_index, pt_level);
>  	pte |= pte_encode_ps(pt_level);
>  
> -	if (unlikely(xe_vma_is_null(vma)))
> +	/*
> +	 * NULL PTEs redirect to scratch page (return zeros on read).
> +	 * Set for: 1) explicit null VMAs, 2) purged BOs on scratch VMs.
> +	 * Never set NULL flag without scratch page - causes undefined behavior.
> +	 */
> +	if (unlikely(xe_vma_is_null(vma) ||
> +		     (bo && xe_bo_is_purged(bo) && xe_vm_has_scratch(vm))))
>  		pte |= XE_PTE_NULL;
>  
>  	return pte;
> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
> index add9a6ca2390..dfeab9e24a09 100644
> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> @@ -179,6 +179,56 @@ static void madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>  	}
>  }
>  
> +/*:
> + * Handle purgeable buffer object advice for DONTNEED/WILLNEED/PURGED.
> + * Returns true if any BO was purged, false otherwise.
> + * Caller must copy retained value to userspace after releasing locks.
> + */
> +static bool xe_vm_madvise_purgeable_bo(struct xe_device *xe, struct xe_vm *vm,
> +				       struct xe_vma **vmas, int num_vmas,
> +				       struct drm_xe_madvise *op)

Shouldn't this check be a vfunc in madvise_funcs?

Also I think you can hook into xe_madvise_details for the return value /
final copy to user.

> +{
> +	bool has_purged_bo = false;
> +	int i;
> +
> +	xe_assert(vm->xe, op->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE);
> +
> +	for (i = 0; i < num_vmas; i++) {
> +		struct xe_bo *bo = xe_vma_bo(vmas[i]);
> +
> +		if (!bo)
> +			continue;
> +
> +		/* BO must be locked before modifying madv state */
> +		xe_bo_assert_held(bo);
> +
> +		/*
> +		 * Once purged, always purged. Cannot transition back to WILLNEED.
> +		 * This matches i915 semantics where purged BOs are permanently invalid.
> +		 */
> +		if (xe_bo_is_purged(bo)) {
> +			has_purged_bo = true;
> +			continue;
> +		}
> +
> +		switch (op->purge_state_val.val) {
> +		case DRM_XE_VMA_PURGEABLE_STATE_WILLNEED:
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_WILLNEED;
> +			break;
> +		case DRM_XE_VMA_PURGEABLE_STATE_DONTNEED:
> +			bo->madv_purgeable = XE_MADV_PURGEABLE_DONTNEED;

Use above suggested helper to set this state?

> +			break;
> +		default:
> +			drm_warn(&vm->xe->drm, "Invalid madvice value = %d\n",
> +				 op->purge_state_val.val);
> +			return false;
> +		}
> +	}
> +
> +	/* Return whether any BO was purged; caller will copy to user after unlocking */
> +	return has_purged_bo;
> +}
> +
>  typedef void (*madvise_func)(struct xe_device *xe, struct xe_vm *vm,
>  			     struct xe_vma **vmas, int num_vmas,
>  			     struct drm_xe_madvise *op,
> @@ -306,6 +356,16 @@ static bool madvise_args_are_sane(struct xe_device *xe, const struct drm_xe_madv
>  			return false;
>  		break;
>  	}
> +	case DRM_XE_VMA_ATTR_PURGEABLE_STATE:
> +	{
> +		u32 val = args->purge_state_val.val;
> +
> +		if (XE_IOCTL_DBG(xe, !(val == DRM_XE_VMA_PURGEABLE_STATE_WILLNEED ||
> +				       val == DRM_XE_VMA_PURGEABLE_STATE_DONTNEED)))
> +			return false;
> +
> +		break;
> +	}
>  	default:
>  		if (XE_IOCTL_DBG(xe, 1))
>  			return false;
> @@ -465,6 +525,34 @@ int xe_vm_madvise_ioctl(struct drm_device *dev, void *data, struct drm_file *fil
>  					goto err_fini;
>  			}
>  		}
> +		if (args->type == DRM_XE_VMA_ATTR_PURGEABLE_STATE) {
> +			bool has_purged_bo;
> +
> +			has_purged_bo = xe_vm_madvise_purgeable_bo(xe, vm, madvise_range.vmas,
> +								   madvise_range.num_vmas, args);
> +

Again use the existing vfuncs here.

> +			/* Release BO locks */
> +			drm_exec_fini(&exec);
> +			kfree(madvise_range.vmas);
> +			up_write(&vm->lock);
> +
> +			/*
> +			 * Set retained flag to indicate if backing store still exists.
> +			 * Matches i915: retained = 1 if not purged, 0 if purged.
> +			 * Must copy_to_user AFTER releasing ALL locks to avoid circular dependency.
> +			 */
> +			if (args->purge_state_val.retained) {
> +				u32 retained = !has_purged_bo;
> +
> +				if (copy_to_user(u64_to_user_ptr(args->purge_state_val.retained),
> +						 &retained, sizeof(retained)))

I don't think remained needs to be a u64 - maybe a u16? Will comment on
uAPI too.

> +					drm_warn(&vm->xe->drm, "Failed to copy retained value to user\n");

See above, use xe_madvise_details_fini for the final copy to user.

Matt

> +			}
> +
> +			/* Final cleanup for early return */
> +			xe_vm_put(vm);
> +			return 0;
> +		}
>  	}
>  
>  	if (madvise_range.has_svm_userptr_vmas) {
> -- 
> 2.43.0
> 
