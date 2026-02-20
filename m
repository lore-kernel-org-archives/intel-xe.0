Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709D5C5ACD3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:20:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE1110E81C;
	Fri, 20 Feb 2026 17:20:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A3am7cnl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7336F10E81C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771608041; x=1803144041;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1TC3SMHTuprHmCn+2X6WNK1qgU/xaLSctcd4aLm9H1I=;
 b=A3am7cnl5s8PAD+YwDabI6SzyeSQMz9XaFO1gtZ0LH9tHRDRT758i7k0
 rSbdFFkbU+9+BMtlE788lUNdpC1jZo4zHnh0DJmMn9oNvxMuM5mBd5Mue
 0j7nb9DAeW6TVLrUJfVUuupc+Ky329LkBwLyreYqlaMV7zcHYVQOY4zBO
 tmink6MF3zp+hPIodbcvY80TvvwG+6WPW/1h8JpKNyVOmB0G4voxlDKvh
 EGNjZu9mf/h1tUqwZX/opKSOlSumL4h3yWGbTXP331Ucbehwl8LOsVTBW
 Ktkm7a3Cjb171wfZ4KcvDk4CMu9TOjkH7VMhEgw/t2OmpG7qF0KV0rpPO A==;
X-CSE-ConnectionGUID: xIoM4hwgRAS10eolPttY/w==
X-CSE-MsgGUID: EJRSiN76Sm6+ri+95qNOxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="90287253"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="90287253"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:20:41 -0800
X-CSE-ConnectionGUID: Y3m4nKHVShuqNoVHKIqyQA==
X-CSE-MsgGUID: zw4A4i7sSMuDcjyUhRe1/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="213004715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:20:41 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:20:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 09:20:40 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:20:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a1sUfWlOUa/mLTzlF5/w1QLZvYbS7RrpYPJp6MumXsSRx692tarhhNs9z+XxMdl2Ib4bVxi5R+4CX01fp9NJYAf/ZKCecl+S+CVhvfOuKyMUUcM9QmXnDFMacIp6eE6bMQ99eVSr7uUCKVto0xfnEpl7jaIUReQU75hBqFRlr488vvSc2MoIUn42GNXMCBxDpuheBqztmpmaSX421PdgIghqWZPss8Hkl3KowZgcgqSYLVO0fykhQEk/7XZClGnYZJa3lpDcXr1jhyudYe/VfDBIE9z5lspZbcLHdh8EhRqkpTtB6FNO//vacyEccm5pytzwcCWzMCWRxPNGJja2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUBMyvSr8qOGmh/Cc7twcGTZ7k4jZHsvxl5PNOIF9Nc=;
 b=IvrYPiKZK7LPZFyFS+B2dnZ8qxjOgUG/YAW9jmXaxPDwxlMWvCMwgm+A3JaiSQHYbLqqr5oKD0Xl9VAqUtJY6CWh+r1Xx+6LaVsHVEy5NJTq2WxhY3cfn9gc+dcMm0RhK3yYujLmgg7TIaaU9gdpiFSqaVTCgwKzF5p/UHDYkKzfhPCfpwe8GZRzXrC1kyxkDyuxSoyvdJZQlgn0fv+4aGxiynwj9UzipMx+Nmls5mX6trMd4i6XD0Nv+V+Z84zuZDfrL16HZX6hZ+auJ54KPqVHrVXVd/41uHUWk4AtIkXgZ6+we6A8MhnM2jG4SzvwwS6uuT0iOw24Q3mYbnJJjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ0PR11MB6767.namprd11.prod.outlook.com (2603:10b6:a03:47e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 17:20:36 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9632.017; Fri, 20 Feb 2026
 17:20:36 +0000
Message-ID: <be611722-8388-44b4-85ea-ce97094ff40f@intel.com>
Date: Fri, 20 Feb 2026 18:20:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/xe/vf: Wait for default LRCs fixups before
 using
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20260218232159.1726873-1-tomasz.lis@intel.com>
 <20260218232159.1726873-4-tomasz.lis@intel.com>
 <aZdvsX0+ST//Lk3B@lstrano-desk.jf.intel.com>
 <aZd1KlxP27XeaH6w@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aZd1KlxP27XeaH6w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0146.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::30) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ0PR11MB6767:EE_
X-MS-Office365-Filtering-Correlation-Id: 21281d83-a3e7-4d5a-ed8e-08de70a45c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzQ3YzMybFpwbXZReDNzTFpMTUlCd3FOVjFTUzY4T0RibHQrQ3IzeUd5RjZT?=
 =?utf-8?B?VjIzQUp4dnJVQ3NlUTFJRXJGQWhnY00xd3Q5Qlc4d1JuY3pYcXZ0Z0pZTnlQ?=
 =?utf-8?B?cFcwclFMQmJuY0RFM2pwYVcwRWJucTFteUNiMWdMbVI5MzZIQVk4eVlYVEZO?=
 =?utf-8?B?bDZ5cExZSkFLN1lxR2FBZWcreWwyQVFkZ1dyR241bkxCSllocFFkc2N4eU9G?=
 =?utf-8?B?MThvbFlwVnlQZHJacTVyUXYxcStndE54YU15SUpNc09jREtpclBHUmpqSTZE?=
 =?utf-8?B?UjBCV0QzVWdBemthVEZsOVFhTlpCMjFjSlhWOEFDejBQalFvNlhuY0pURzZV?=
 =?utf-8?B?aERMN1dXbFViT080MW9oWnBqODIwV3lnbjVVSzJpSVpLaGVUb00xZjZ4OUJ2?=
 =?utf-8?B?RC9oQk1FaWFyQ0tXS1pQaUlrcERHZWFmeW5LRXU0Z3Jsek5iaU5JRmNSODB3?=
 =?utf-8?B?ODNBcFRTby96NWtCaFU2Z01HazJMSys5QzdBSTUwamF6QkJVZ0R1aDNSNGhC?=
 =?utf-8?B?cWxUTkhFQlphUVROUnVyeE8xd2RZOGxNZk95TisyNUVaWXY4OFIranhPUUJ4?=
 =?utf-8?B?S1EzQVpIVFZVMHNxaWdtbHkxWFRNWXJGVDhTWW4xVDFkTTQyTHpmOVA4Zk1r?=
 =?utf-8?B?Qlo3TXYrdCt1bEdxU2ExOVpSbGk3ajhsbUt5eGNJREFDSTdJbFpDdWFVUWk4?=
 =?utf-8?B?d1NURkRqUGh5RHVQSUtIam13bGhwMm15SE82S25uazBncUF3TFBDMmVTVDgx?=
 =?utf-8?B?MzFoZ1N5VWJZNGk1Y2dwMEkzd2dRNmhlR2pvM2F5bXhud1VBVGgxNWY2djVC?=
 =?utf-8?B?SzU4TXMxaWZvN3N2LzZYZnlHeVh3bFNhQlNJTnVhNS9DWkh3YlE0bDAycjJY?=
 =?utf-8?B?WUZKVUZqWkgvN21GMmZsOW1LOTF5S3dFNFI1Ri9rTGNvcnVzbnlIbXhEK05W?=
 =?utf-8?B?bjQ0R2ppeFBNbUdHTmpVaWhScEpRdW5HS2cxREZXTm5LODRsU3V2bVZhZm5p?=
 =?utf-8?B?elQ1dVdTVlpWM3VYOHVnNWhkc1UyZWc4V3RTNTQ4UDI4cFppZWVNZEJsRTk0?=
 =?utf-8?B?RDVCWUdnYm85RTU5SFlGMkNQSmRnaXpBNjhqbHpDTk82ek5NZjJqRlNCdFlv?=
 =?utf-8?B?dkY3cGRhVGl6UzNjWjdrVWJrNnI1dDcwWDRwWEZ2cjN5YjRWZUdMREg0bkw2?=
 =?utf-8?B?dmFScEpXZEZjVU9CclhDWjUwby90Slh1OVVlZ083dEt0K2pIeXdna1VqbXpv?=
 =?utf-8?B?d3dHV0t1QS9aSEhhR3VEV2FFTzJsd255Y3cwblhzYXYyODJtUEdzN3FSYzc1?=
 =?utf-8?B?aE5tWEp6aXRjOSszUzZOUlpncG10RWhmU0Z1QVpRTjhjU3JDeEZ4SzdqQmRw?=
 =?utf-8?B?RXRyS3ZiU2FNU1hoS0xiUEJuY2c2MU5Eam9tTktQenFCekdLcTZvTXlSaHFo?=
 =?utf-8?B?bThkM0Q1a1lnaXV6SHZEUWZ2aDlJR25nWE11L3Ria3ZWOCtxcEVRVm5tQlVo?=
 =?utf-8?B?aXZ4VDJaQVE4Mnh0UVplSEh2SHFhdnNxRlVxN1JudVNvZytldTZKc2JwZktZ?=
 =?utf-8?B?RXF2S1F3dWExQmlwZ2hjbzE0aXZ4clhHMmMyV2Z4UFVKdWo2OTJENkliZG13?=
 =?utf-8?B?R0c2bkphSjIvaDh0bTgrREJWRThDbzd0MmFzSGNScFIxa3FrbVNFM0pyRFc0?=
 =?utf-8?B?NGYxNDVxRktXaWpKNk5aWUd0UGZiU2FZVFBYOGJ4WTFuQ1FORGhmYjFBT0VV?=
 =?utf-8?B?cS9ybVpZRW40ckRHaVJYQW1nMG5jcmk1WE5aOWpIcjFTY0VSUVo1TWlUTUVQ?=
 =?utf-8?B?K3lrQ2F3RW1MRklTL0I3MnUwZndjUEhNcURPcGxjOHNLWEJQcXE4VkRMNFNC?=
 =?utf-8?B?cUM4a25rVUxRTHlxUlJwQnYwWUl6eFdIdmZyKy9MRmduQkVoVisxRTBvbjRo?=
 =?utf-8?B?Y2NEMEdsUkRxbko5U3FqeHk1NGd2UWRhRUMwbUxsbmpPdFFmd05yeDRhT05U?=
 =?utf-8?B?aUxBZ1d0Snc3aExVR0NpeGRpbUMxODFqbWNzeWpNR2EzbzUrbjduaWxOZ0ZP?=
 =?utf-8?Q?v25HXh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEl0ZFZjZGlKVVJxR1lOaUFUYkdDbHllYWY5LzJxT0NHM0duWXZTcjNLZWFx?=
 =?utf-8?B?M2FIaG5wZjZuR1VOeDJBQ3hvNDhVc0tSU014aGJNVWdDUkVyMktSR0hxNU9y?=
 =?utf-8?B?YjVxNjZUUXpNL0xpV3d0SHhLZ0VqRFUrYzF4bXh5YUJrbGNUSG1zazJkdU85?=
 =?utf-8?B?cloxNGxXc285ZDRWZGVtVlA1Y2JVK1h4dVY5SHRMeG81WjlXWnU2aGNidFBu?=
 =?utf-8?B?bytSK1ordmVFT3l1TUNIQVg1cGdZT0tDRHBmKy9aWXV3bE5mWmU2aEVNZTBx?=
 =?utf-8?B?ZUNXSnptTkV3bGsrZTQ0OStnR0FZK3d2OG05S25iUTkrT25CanBvdFN4dW5y?=
 =?utf-8?B?RU53SmJyMm5JamQzdVNzc0xRcDY1Q0h6dkRydVozc1lRaVlvQVJTMzZDSU11?=
 =?utf-8?B?NVVaZEdZODhUbDh0NVNUbGZhMnMrQkVaTEQ5T3piUjk1cUpZSTJsZmVHaWlO?=
 =?utf-8?B?ZDEycHh4cGNJNFV2UHRkMEFHZjlCdXhwSVlONnNhRUFqazl1c0MzdEU0Uzlk?=
 =?utf-8?B?V21HVGYxOHVYOW9zY245V0V1RWJGd0dJYjU4cG9FQkFYRDg0TXBOZVVUYmVP?=
 =?utf-8?B?Q0J1R3Nia0JLWlRaRTMzejVnemhEbU9MUjd4TUd3UWRNSTREcnpnNVpIQzJW?=
 =?utf-8?B?b2VsS1FWM3pyNC9qa1ZyREZzb3pVVmVRSEhEUjBVUjIvckQrbDdxNmtXYmtJ?=
 =?utf-8?B?UVk0WkY5Qzk1cnZrMTNOMlpwUnhLV0lyUHZieURXNTE5RGhOZldqRjhVbk56?=
 =?utf-8?B?NFk4KzQ3QWRPWWw4Y3RPQzZWS1JmS1FpcExpcU15Nng0MGIveVFlVmhoSmFJ?=
 =?utf-8?B?aFlPalVLVVlsa0phZnYyZmFiNjB4dGJIV1pjRDdqbXNCQkNzaC9wUVk1OTM3?=
 =?utf-8?B?RGhDWVJzU0RwUUpCbCttTC8yZ0dzSlRiTGVNR3VoUnA1Q0FrVU9naVM5SHhC?=
 =?utf-8?B?UGRjTXJlQjZhSFJPQSszaEhXaGFYSkt3UHErUHVpMVBjWjRrYllkZEd4RkFF?=
 =?utf-8?B?TWF4eldwWEh2aVd0c3cxZG8xOWZaUFcxdTlGazNVdWR5K3VBcm9SL2xVU0lN?=
 =?utf-8?B?ZXdMVXJQaG5HS1VSQXNTbWZ5VDRVbVJSY3hiczdqY1VUUWtOWjNqNmZtK2Vj?=
 =?utf-8?B?Zjk5cjdDQUxXaUZlbWs0a01xUW94VzQ1WXNJUFdTaXZ1R3RpM21OTERjeTRv?=
 =?utf-8?B?cU40a3JkbG1vN3Z1dkdKa2hZSGdycStxVUsxSHVSQmdUOFc0MzdVbElmUnB0?=
 =?utf-8?B?cVBkdjkvODRMYmtXYzQyWWthNU13T3EwUmI1YXhldVp1ZWN3d3g3b1ZlODdU?=
 =?utf-8?B?M29ZVUJDRXRzY29Cekw3dEZ3czVXVkFJVnN4amNUMVE4Z3RvUExIeWliMVBT?=
 =?utf-8?B?bXM1YlZyanBKY0R5NExVQis0YllGY3FwMkNFNHN2dTJwUXlNVFdWVEQ0YnRa?=
 =?utf-8?B?R0x4TThvWFJuUnpHR21HTm5jWnNVaTZSRlNvWmhFU0s3MjlMKythTVRmUmk5?=
 =?utf-8?B?R21IUFBtWXp1b0dZcmM2R0tXK3E1clRZTG5EQVNOaGFJUHpoa093L3B5NGNZ?=
 =?utf-8?B?VnJKaFBPYkFZdzB1MTVsYTRQalRaMTc4eXI0OGgvM0d5dEhqeDViOFBFZnAv?=
 =?utf-8?B?eFJvK01iRDVrZjE5ZHVieUgrVVl1R2swL0FhYUF0SWtvM1BZaHdiMVJLdHFU?=
 =?utf-8?B?UXFTOTJuN0pBbnN5N3E4TzNqSUQ3bzJUbWtjaEJNa0tHK2wzRW9xalNHN2ZL?=
 =?utf-8?B?bWplTWxMZWdjMnArNWlFQXZTelJnVFVBdUJIT296b3pXQVVDdU11NXZVUUQz?=
 =?utf-8?B?WEhWVGpWNHlOREU0N3o0UnNGanloRGFqUi9UTHVEMGRyOUFZY1Byc2VpaU9h?=
 =?utf-8?B?MHdHVklKM2s0M0tScXd3a2JVUzZqcDkwWHdhOE9IWWphU3g5NXZEQW5UcUs2?=
 =?utf-8?B?aTIxeTJCTlI3WHNSQVZkTkZ6TTFxaitXbzAwelBHeVBZMnkwUUcrZGsraEVl?=
 =?utf-8?B?N2ZTRDRNakpDb3FMQ2FZZEJxcG0yQWg2TkR6M3F6RnpBV0tXSHUzaDJDRUNu?=
 =?utf-8?B?MnNQL2F0WlVwQ1l5MGl4c01YQVhUTWo0V3BzaFBxZUg4d2FPZVNmSncxT3ZC?=
 =?utf-8?B?UGs1VDZKSGU0SC94cnJkYStaWno4TGdySFQxOE0zY3UzN0hja2pxTVluNC9m?=
 =?utf-8?B?ZWtmeGVDdDZacFl3NWo5VmZMbW4zSmJxYnFkSDc4VFBRdjFPckpzWjlKdnpk?=
 =?utf-8?B?ZllkVnlsNWdvMEd1cUtIZ0o5NXEzaFM1N2x1TnRWSmdpaTlFRkVPMlJEM0hL?=
 =?utf-8?B?M1M1dnFRSGlTUk0xeGh5NzdnYjQxOGdIbXNOV0dvWXRnMkZ5MXlFQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21281d83-a3e7-4d5a-ed8e-08de70a45c4f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 17:20:36.1114 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAyVbSCGhXjK8A5bswoja+oVeou2Qt0Kv/OsGRpJkBFoz2w2KqsD+QQqeN7jS25/h5aZlI+2PWzyWxw6X84V5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6767
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


On 2/19/2026 9:40 PM, Matthew Brost wrote:
> On Thu, Feb 19, 2026 at 12:16:49PM -0800, Matthew Brost wrote:
>> On Thu, Feb 19, 2026 at 12:21:56AM +0100, Tomasz Lis wrote:
>>> When a context is being created during save/restore, the LRC creation
>>> needs to wait for GGTT address space to be shifted. But it also needs
>>> to have fixed default LRCs. This is mandatory to avoid the situation
>>> where LRC will be created based on data from before the fixups, but
>>> reference within exec queue will be set too late for fixups.
>>>
>>> This fixes an issue where contexts created during save/restore have
>>> a large chance of having one unfixed LRC, due to the xe_lrc_create()
>>> being synced for equal start to race with default LRC fixups.
>>>
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> This is better than what is in place, so...
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> A little quick on this RB, see my comment here [1].
>
> [1] https://patchwork.freedesktop.org/patch/705610/?series=161287&rev=2#comment_1298253
ack
>
>> But I think we need to close on why my suggestion in the previous rev
>> isn't fixing the issue (off list discussion). If we go this series, then
> We still need to figure out why my previous suggestion doesn't work.

Right. Testing this is even harder than I expected though. Not only each 
verification required 1000+ runs, but I already confirmed that there is 
more than one place within `xe_lrc_create()` which causes an issue if 
not protected by the atomic..

We need to, but this may take some time.

-Tomasz

>> my RB holds for future revs.
>>
>> Matt
>>
>>> ---
>>>   drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
>>>   4 files changed, 15 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> index e9396ad3390a..6eb561086e1c 100644
>>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>>> @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>>   	for (i = 0; i < q->width; ++i) {
>>>   		struct xe_lrc *lrc;
>>>   
>>> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>>> +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>>>   		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>>>   				    xe_lrc_ring_size(), q->msix_vec, flags);
>>>   		if (IS_ERR(lrc)) {
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 527ded3c9c22..5ce06031018d 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -536,12 +536,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>>   	 */
>>>   	xe_ggtt_shift_nodes(tile->mem.ggtt, start);
>>>   
>>> -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
>>> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>>> -		smp_wmb();	/* Ensure above write visible before wake */
>>> -		wake_up_all(&gt->sriov.vf.migration.wq);
>>> -	}
>>> -
>>>   	return 0;
>>>   }
>>>   
>>> @@ -844,6 +838,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>   
>>>   	for_each_hw_engine(hwe, gt, id)
>>>   		xe_default_lrc_update_memirq_regs_with_address(hwe);
>>> +
>>> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>>> +	smp_wmb();	/* Ensure above write visible before wake */
>>> +	wake_up_all(&gt->sriov.vf.migration.wq);
> Then with [1], move this wakeup to vf_post_migration_fixups after all fixups.
>
> Matt
>
>>>   }
>>>   
>>>   static void vf_start_migration_recovery(struct xe_gt *gt)
>>> @@ -858,7 +856,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>>>   	    !gt->sriov.vf.migration.recovery_teardown) {
>>>   		gt->sriov.vf.migration.recovery_queued = true;
>>>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>>> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
>>> +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
>>>   		smp_wmb();	/* Ensure above writes visible before wake */
>>>   
>>>   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>>> @@ -1303,7 +1301,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>>>   {
>>>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>>   	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>>> -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>>> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>>>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>>   
>>>   	wake_up_all(&gt->sriov.vf.migration.wq);
>>> @@ -1499,7 +1497,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>>>   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>>>   }
>>>   
>>> -static bool vf_valid_ggtt(struct xe_gt *gt)
>>> +static bool vf_valid_default_lrc(struct xe_gt *gt)
>>>   {
>>>   	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>>>   	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
>>> @@ -1507,17 +1505,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>>>   
>>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>   
>>> -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
>>> +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
>>>   		return false;
>>>   
>>>   	return true;
>>>   }
>>>   
>>>   /**
>>> - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
>>> + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
>>>    * @gt: the &xe_gt
>>>    */
>>> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
>>>   {
>>>   	int ret;
>>>   
>>> @@ -1526,7 +1524,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>>   		return;
>>>   
>>>   	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>>> -					       vf_valid_ggtt(gt),
>>> +					       vf_valid_default_lrc(gt),
>>>   					       HZ * 5);
>>>   	xe_gt_WARN_ON(gt, !ret);
>>>   }
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index 7d97189c2d3d..70232dc38f9a 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>>>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>>>   
>>> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
>>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>>>   
>>>   #endif
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> index 4ef881b9b662..8be181bf3cf3 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>> @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
>>>   	bool recovery_queued;
>>>   	/** @recovery_inprogress: VF post migration recovery in progress */
>>>   	bool recovery_inprogress;
>>> -	/** @ggtt_need_fixes: VF GGTT needs fixes */
>>> -	bool ggtt_need_fixes;
>>> +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
>>> +	bool default_lrcs_need_fixes;
>>>   };
>>>   
>>>   /**
>>> -- 
>>> 2.25.1
>>>
