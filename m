Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F4FCAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 18:54:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE71F10E475;
	Mon, 29 Sep 2025 18:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDuu64+c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3420110E475
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 18:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759172088; x=1790708088;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gsRzlwlJd89V0ENlM80vHTl+u8QvTNpWMPVQzKNnACw=;
 b=QDuu64+cBLR0i+OXxW4u/bBEIEovNqIUsfGaE5sX6seU6WAYTFDWbvc0
 xpnvkBLdK02z93ZqWLJQl7JxPxx2c8mz6Y5uSAvZTKIgYnSvfSgOV3In8
 LrEvmhh9S0nMKcSQZE+TRW1zGA8LhfcFJBgwYYhblzTJS9wCEiycZkXc6
 6WpV3IFlZsM/qU4odYPRr5aqbTH8NataEzhmHZwaTg66TIJavuTroJiLj
 bRoE4glXDuSZnoe62Wx/r4Xp2848KvOfdaXN/gvjzeWqOqtH8EFWTLMEr
 U+xOul3NpRR+/NfNtuORpw1pKaSnOTJfRSQQ42vG71tt+8qQewnuwOcUv g==;
X-CSE-ConnectionGUID: bxThFJXQSfWJ9gxdwq0UUA==
X-CSE-MsgGUID: G+ihBn1jT6O12n80RFVaWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61464762"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61464762"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:54:47 -0700
X-CSE-ConnectionGUID: 1hc9WMH7SZOpgFkxP8kKGQ==
X-CSE-MsgGUID: CxcRG+0zRN+1hdMWi+A5Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="177908856"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 11:54:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 11:54:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 11:54:45 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 11:54:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvvQLG+XJq0AwwOXkV+CZwmeOkx6676QeGTtd6CgstYP0BPzxm/+p43phJiN1kbqr7xbmfRJByzAJwrQWcmF73xuGKMAFNC9UtA9UIqtvQ72EV4e2mSWTXUwtREx3gjZNsLOBXuIeKV6aakQ3w5oh1EnS9/ivR+OAKYcNqzlYSzXsPl+Ie4qamqsEdtp6JLwPX3oN3PPqIc/PGMwyVtxsLypvoyY+9RZid5UkrJV9QHSWj/AmTWzTMbGTptOHzwztYGNSo78FyOYRA9A2QWsA1ytPsdKEVmhhAaFyfxG5sRCTjbec5JibUZvjwel55ZlwzaDKljaLo36oki7GqfP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChmYoEqguW4r/g11k8j1TYFdjHovUBmj/KTn0oktu1M=;
 b=NHjahgz9pg0AKjC9+e1xIgHFyP9AAqnypbnQgXBcmumy318Bgnidzo+IqmX4r5G7WPlQqc77eBqeNayb91Pzc5DiXRllZSlfYd+tRXS0GjpRlPc07XfZCrF9kE/wDbVDHE62byi+0chS8mlUjVeTN4V2bFM9I8IRC2SLfY0Cek52JViGv+zJBxM5amRnakosJ4huPzWRAzr1BYVVtJ9Xt/DQ9l/tf+aXh0Q6zDAPigSR0QUQ5SfHTlScYUeJ18t105zgAa9wJU+EP/Zk3LI8DqMqUcmXReidKbMyFRP4GCM5aIK7yyAgM/br3t9FiGWMKrWTmVTMyojsiSmu/01O8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB8840.namprd11.prod.outlook.com (2603:10b6:806:469::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 18:54:43 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 18:54:43 +0000
Message-ID: <bfd90d42-0b06-4e3a-82d8-08c7bd1c390e@intel.com>
Date: Mon, 29 Sep 2025 20:54:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/migrate: Atomicize CCS copy command setup
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
References: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250929164507.2593639-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0250.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd7bcb7-da6c-4ba5-2a5b-08ddff89a6db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHhLMngvWkpVQ1NNSDU1cFNjMUVFME9kbTl2dHNuOWxncWJFcld0ZGVvYjYv?=
 =?utf-8?B?SklDMmZFZGlVbmt5RllRditLSUE4YlZiN3hMaGdaVU5HeGpsZlhDcHBRQjd4?=
 =?utf-8?B?RlJoMGQ1OXA0SzVvbEY1amkrNHhiUklQUWFhbURKZmkyTzZkbGdwcjR2UmFP?=
 =?utf-8?B?eE9EVXMwb3ptcXNJc3VnMUo5eExxc3Y5NFFMVFUwd3orNUdpL1NGSzhIS21w?=
 =?utf-8?B?MjQyZFhQUzJPd1Z6a2Zua1VwcnFVSW5SYm4xd0dIdHY2WmVWOVpoT3IwT0hR?=
 =?utf-8?B?bjRHRXMyVzI3UlAyT3hrNTJUdHBaK3NQeDdySHVlVlloT1FSNnl4RmI5Q3Nz?=
 =?utf-8?B?NnFoZEJYMFJZWnliU1VabThURnp6RkNYK2M0UnFicTEwczFFRS9zKzEwcFpS?=
 =?utf-8?B?WnJ2ekY3eWs5SUd0ZjZXUVl1UTA1YTM1amxEV09UendaMWlTZ0gyVDdBVnhK?=
 =?utf-8?B?WFFMbGZETTZ5Q3Baakl0QVZZQ2NQOFVCRGdxOEw4UGRwampKbkRjOGc1b0Ux?=
 =?utf-8?B?bDM0YnpxSHUvV0s3SzU2OTBuK1lLdW9Kc0lBSFc4WnkzTENpL1dCVmcvRytI?=
 =?utf-8?B?azhVcUhFYlNGUFk4YmFhLzBXd3NQRVRITXNZWEhTZmdsVTg5M1hCallkNDhv?=
 =?utf-8?B?b0lFWHdPYjkyNFFhdHRQTUNPUWZsSWhUL3dsRUdvMzNDRmhkTHlsWld6UVhW?=
 =?utf-8?B?ajNvV2NsTDhRYnpiYkJTcWN0cS9peG4za2Q4Yit6L3ZWQUU4bkhwNE4zaTRa?=
 =?utf-8?B?MnltNzdtVFhmT2xaMDUzV3d1bExudnJQS2hXYldvbnJFN0pnQVJuWFRYRWxV?=
 =?utf-8?B?Zm5vVmU5Vms2TUN2ZWdQdWkxTmhkR205YW44VUFQUG12eDJSN0RWYmFXQ1Fn?=
 =?utf-8?B?dHYxelltazZzbnpvL1RpaytNM243MzVJemQ4WEJjbVYrZlE1UlhwUDJGdSta?=
 =?utf-8?B?ZlFRMUtxWTZFVTNRWjBmYlQzOCtPWExISmhGU1d0Z1dnYU56bEpweTBnc3NI?=
 =?utf-8?B?NXBBZGxBT2N0eVBZMm92YW0xa09tWDk1NmNVSkN1a3owSGxGRUV6ekpOb1Ra?=
 =?utf-8?B?OTFrTXd1cXArdVNmSE12a21rMEhwNXRKNjBidExoN1h6NCtHN1JGSjdBajdG?=
 =?utf-8?B?L0FxSEJEbWR3cUVERVpDMmdaTnZBaEpHQ0ZXL240R3JYYVlsSlA4SWNuWk1O?=
 =?utf-8?B?akoyZ2Y3TS9KalYyQmtNd0E5T2ZvN1lBc09IRm9GN2t6emtuRkdvUHozeWVH?=
 =?utf-8?B?VnFlWHV5amhreTdDUWtJZVVMTVBUMkFaQWpLU0xCOHVDU1lSTW82cXdRdy9v?=
 =?utf-8?B?Zk0xcGVCVE82OGhtUUhmTVJyYUNnaVoyS25XY1BoU3hJdUVVMmJSU01abTRP?=
 =?utf-8?B?ald5dnBJdXRodFdJK0VZQ3MzRGVYUS9SQjNqeVc2SFc4aWJHbFFzamlhUUFv?=
 =?utf-8?B?WUtQandHWHErTFdNRSsvbzlmVFZmVHBQd3BXcm5wR2N4VjBjc2VCcUhEbWIw?=
 =?utf-8?B?dkRWOW9LTlo3TGhPZTdUWll1bUxCQkZ5SFZjQmorSDlIM0ZYUU1oWnowVTBr?=
 =?utf-8?B?Vmpqb2QwTXZXeWgvMkxWRFB0aVA4TzlrY1JtWHVoSEdsR1R3Z2NwbHVhNzNF?=
 =?utf-8?B?dktoajNZdDUvaFVRR3ZtWWhRRHdiWUIvdlh4UkF1MHNZL3Q0aEhWSGI2a1A0?=
 =?utf-8?B?NzRjSWVNTUFwOVQwRFdMK0hOVUozNzBqRllSN2ZoYTYzMXZsdm9VZ1ZYVGdX?=
 =?utf-8?B?V0hEb1UzdU1BTGJKZXgzODJ5Tk1VM1F3U1NPYjFBRitMNk5SZ01tUlNBdloy?=
 =?utf-8?B?SXV6WTloR1BRTVVmVnJ6cDNyZWpGOWsvV240QjhjTG4rVXl4ck1XcTN4bEF4?=
 =?utf-8?B?Q05wQjlJWUpVREZzQ01HS2hVVk9GUnErYTI2U3pndy9hVDhjVnF6aGF2N0tY?=
 =?utf-8?Q?Qe75aMNdyi/Md032QdSOcPC274vhndoh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTc1cVVqNU1rcW1XaHVCZFVSK05VRktrUlFtOFJZRFJMSzh3QWNMb3dZTko4?=
 =?utf-8?B?NWF2ZEN2SlBqSHdPdHcyUUc5OWV1R1ExV0xJMkdjanoxOHY0R1J3cXdVSmQr?=
 =?utf-8?B?UWJ4MlZ2bDF4T3lsOWZXUXhCOHNXQ1ZxbTN5ZTNpbGdRTDVjQkdhK0pXSWdw?=
 =?utf-8?B?S3VZZWtOT3dxVXF6QWoyTU9CSzFRcWlKZ3V6U0VhSTJZZks4cDZZVHJzTmpn?=
 =?utf-8?B?TGtQdW1qTUg5Q2NQTS9FNXhqY2NZbytWQWZpRDNnYnBUcjI3OUs5NHBYT25U?=
 =?utf-8?B?YW9xc1hlMzlpMkZRNEcwWGdDbXlZbTRZM1FaQ0t2bmlrUVNYczVIamFIcmV1?=
 =?utf-8?B?NTg0bnZqNGkwbzVXQUtyNko2dFcrU0l4TklnSEd4blN2aG1LMGxtcGphZXhk?=
 =?utf-8?B?UHU1KzZ5L2tQOXFLUWNTMEJyQUdqVjZWOWFndXJKSXVOS05HSFNyQ3hCV3pU?=
 =?utf-8?B?WkhNZFRsS1FjbTMzVzNYbzJDdTlHNElhNFY2QjhCNDZCNTZDaWpMdFppRFgx?=
 =?utf-8?B?ZWsvTHlRQWIrZncrRkVPaWRTdE1waVFOTldyQWZxOXNYWldOYnY0dmpxaWZ2?=
 =?utf-8?B?ck9odDA1QXZ2YUNIdE1ob01NZEgrcmZuV3ZoNCsybGlvSXlxTDQvV1VjSUcr?=
 =?utf-8?B?Y3J5UzNwcXVDdy9aMEFMWU0wNHNpeUZCb3JBMDZZbllRdzZQVVJDaXk1SGIz?=
 =?utf-8?B?VVpQZjFSQTZmakNjeUEvVVpxWDJKVzB6QlRoTzlnYmwwV1BYVUt3bEhlT0Jk?=
 =?utf-8?B?VjdEU3dNajB3dU9VaWhnc3lOcGU5SnNEaGk3cHYzKzBGZGhzSVlSYzdiOVRa?=
 =?utf-8?B?WVdkYk1maUN2ZDhPd1FSNUVKTWp3NTMreWNXb3VLQm5Za3ljQUY4OHBZL2tv?=
 =?utf-8?B?NmxDL08xSEgvd09TZVRBb01MRjV1RWM1aDNFSUlYSlE3UGE1S3JRRmhXTHds?=
 =?utf-8?B?ZnlYd3lwRk44ZldPUlZCM2NueXhTWUNXaGVxWWt2aGRoakRlYUl1bDlnZ1k1?=
 =?utf-8?B?U2hBb0FiazBpcE5CbURSc2llWHdweEtxd2RHMkxHVmMveDNGc0xSRzRrU3J6?=
 =?utf-8?B?WFR2ZWZuSnNwT2xHVTgzRWRTSkZyaVo5YXZ6Nm5pSFFpZVJaN1lENHJDZnlu?=
 =?utf-8?B?NmVCRWF0eHB3K290cU5IM0ZsdmtHbmtuTU9qQ21FSmVJVEdtZXBDKzYrUWxH?=
 =?utf-8?B?ekttQVZma2NQQW93cDhCVk1VSDBWaXR2U2RaS0RwMHJRSTVyWjQyalFVdWVx?=
 =?utf-8?B?QmVsV0lOZzFTR0lTbWlWVWhGZjNHMytaTG83bThuaUw2WlJSYXFGWnNETEpR?=
 =?utf-8?B?YjAzZXBXVlNQY25KelM2WXhLUEs0NjR3N083ZExNamtkNHJNcW5IUVN6cVB3?=
 =?utf-8?B?RmhrVmhJclZDdmtHajJjM0pQdit6Q1FMRDRHM3dRQ0k4b2EzRCsxampYczlI?=
 =?utf-8?B?TDZVMlNlYWRjeENqOCt3R2xsSThxU1duTXo0WS8yZy9zUkV3c3ZmMEYzcW1o?=
 =?utf-8?B?UUplcFcrRmtPa2dpaUlFMTNZajlnbURoeUI4WUVjcUlRMFVqMmQzR2dsZGhC?=
 =?utf-8?B?aGhYa3pQTGNvMDNZcmJ2WnQyYng3QTArakdHMUpGMG5KT0lpV3B3aWRCbXor?=
 =?utf-8?B?TTBtVmVXeFFwN3owWmdxNmE0dld5MDIzTWFCQjEvWUxEbkRoTEN5bzJXaW9m?=
 =?utf-8?B?UVpSa3o3aUt1UU5jZmdxM1lDR2tXOEYzZ3VzY0lxck1yeUttUFZtY1greFlO?=
 =?utf-8?B?R3V4cUwraHRCRy9MTUpSSU9iaTdXZ2taZzR3TkxzN25SZm5Yb2VtTHFmRktE?=
 =?utf-8?B?UzBleTNZUmdKZTNnVjFPYzVsQ1J1V3lHajNBUUtDUHhISUxhVkgrUnhoMEM2?=
 =?utf-8?B?eHp6UStmaityM2J2RHF3QUVibU1LVVlOdjYrcWxIWEdjS3ZXVzRaNnIrenJS?=
 =?utf-8?B?Tlk5OGhjN1g0ckJ2OTczcnNyL016MFovSFVoc3c5WlY0cm5JWFNHY3gwV3Jp?=
 =?utf-8?B?NjB1ZkVzS2I3RHl0a3FLcnBMcEtmZzRaakN2VzFPWTZrL2ZDMHJhVzliMzhO?=
 =?utf-8?B?YTFUK2c0M3ZXZDZHeG5WQ0tqeHZZMUsxREtraytTNUcrYzV2ajFQam9yd3pC?=
 =?utf-8?B?SlBUR1Jnc1AwSHR0QWU1ampQV2dDR1RtbkFIZmN1RlpnZzF5MDdBMi9KRldr?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd7bcb7-da6c-4ba5-2a5b-08ddff89a6db
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 18:54:43.2640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MVS8JIzn5iTMLqfNy3m9lYzY1lHXXv11f+h8cxA8MCWA4dkqhv6unpgH/E7DIzljRI1pgEAZGCrRzNw3hmhxRFZfrdWUyCKTx/hXDJVYCuE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8840
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



On 9/29/2025 6:45 PM, Satyanarayana K V P wrote:
> The CCS copy command is a 5-dword sequence. If the vCPU halts during
> save/restore while this sequence is being programmed, partial writes may
> trigger page faults when saving IGPU CCS metadata. Use the VMOVDQU
> instruction to write the sequence atomically.
> 
> Since VMOVDQU operates on 256-bit chunks, update EMIT_COPY_CCS_DW to emit
> 8 dwords instead of 5 dwords.
> 
> Update emit_flush_invalidate() to use VMOVDQU operating with 128-bit
> chunks.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> ---
> V2 -> V3:
> - Added support for 128 bit and 256 bit instructions with memcpy_vmovdqu
> - Updated emit_flush_invalidate() to use vmovdqu instruction.
> 
> V1 -> V2:
> - Use memcpy_vmovdqu only for x86 arch and for VF. Else use memcpy
>   (Auld, Matthew)
>   - Fix issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 92 +++++++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 1d667fa36cf3..a37d4cb28aac 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_migrate.h"
>  
> +#include <asm/fpu/api.h>
>  #include <linux/bitfield.h>
>  #include <linux/sizes.h>
>  
> @@ -644,18 +645,64 @@ static void emit_pte(struct xe_migrate *m,
>  	}
>  }
>  
> -#define EMIT_COPY_CCS_DW 5
> +/*
> + * The CCS copy command is a 5-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may trigger
> + * page faults when saving iGPU CCS metadata. Use the VMOVDQU instruction to
> + * write the sequence atomically.

shouldn't this comment be near/inside emit_copy_ccs() ?

> + */
> +static void memcpy_vmovdqu(void *dst, const void *src, u32 size)
> +{
> +	kernel_fpu_begin();
> +
> +#ifdef CONFIG_X86
> +	if (size == SZ_128) {
> +		asm("vmovdqu (%0), %%xmm0\n"
> +		    "vmovups %%xmm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	} else if (size == SZ_256) {
> +		asm("vmovdqu (%0), %%ymm0\n"
> +		    "vmovups %%ymm0,   (%1)\n"
> +		    :: "r" (src), "r" (dst) : "memory");
> +	}
> +#endif
> +	kernel_fpu_end();
> +}
> +
> +static int xe_migrate_memcpy_atomic(struct xe_gt *gt, void *dst, const void

maybe name it as emit_atomic() ?

> +				     *src, u32 size)
> +{
> +	int instr_size = size * SZ_8;

why signed int?
and maybe explain where this 8 comes from?
did you mean BITS_PER_BYTE here

> +
> +	if (IS_SRIOV_VF(gt_to_xe(gt)) && static_cpu_has(X86_FEATURE_AVX)) {
> +		if (instr_size != SZ_128 && instr_size != SZ_256) {
> +			drm_dbg(&gt_to_xe(gt)->drm,
> +				"Invalid size received for atomic copy %d", instr_size);

as this is internal/static function, there should be no need for runtime checks - this all your code
assert shall be sufficient
> +			return -EINVAL;
> +		}
> +
> +		memcpy_vmovdqu(dst, src, instr_size);
> +	} else {
> +		memcpy(dst, src, size);
> +	}
> +
> +	return 0;
> +}
> +
> +#define EMIT_COPY_CCS_DW 8
>  static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  			  u64 dst_ofs, bool dst_is_indirect,
>  			  u64 src_ofs, bool src_is_indirect,
>  			  u32 size)
>  {
> +	u32 dw[EMIT_COPY_CCS_DW] = {MI_NOOP};
>  	struct xe_device *xe = gt_to_xe(gt);
>  	u32 *cs = bb->cs + bb->len;
>  	u32 num_ccs_blks;
>  	u32 num_pages;
>  	u32 ccs_copy_size;
>  	u32 mocs;
> +	u32 i = 0;
>  
>  	if (GRAPHICS_VERx100(xe) >= 2000) {
>  		num_pages = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> @@ -673,14 +720,17 @@ static void emit_copy_ccs(struct xe_gt *gt, struct xe_bb *bb,
>  		mocs = FIELD_PREP(XY_CTRL_SURF_MOCS_MASK, gt->mocs.uc_index);
>  	}
>  
> -	*cs++ = XY_CTRL_SURF_COPY_BLT |
> -		(src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> -		(dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> -		ccs_copy_size;
> -	*cs++ = lower_32_bits(src_ofs);
> -	*cs++ = upper_32_bits(src_ofs) | mocs;
> -	*cs++ = lower_32_bits(dst_ofs);
> -	*cs++ = upper_32_bits(dst_ofs) | mocs;
> +	dw[i++] = XY_CTRL_SURF_COPY_BLT |
> +		  (src_is_indirect ? 0x0 : 0x1) << SRC_ACCESS_TYPE_SHIFT |
> +		  (dst_is_indirect ? 0x0 : 0x1) << DST_ACCESS_TYPE_SHIFT |
> +		  ccs_copy_size;
> +	dw[i++] = lower_32_bits(src_ofs);
> +	dw[i++] = upper_32_bits(src_ofs) | mocs;
> +	dw[i++] = lower_32_bits(dst_ofs);
> +	dw[i++] = upper_32_bits(dst_ofs) | mocs;
> +
> +	if (!xe_migrate_memcpy_atomic(gt, cs, dw, sizeof(u32) * EMIT_COPY_CCS_DW))
> +		cs += EMIT_COPY_CCS_DW;
>  
>  	bb->len = cs - bb->cs;
>  }
> @@ -980,16 +1030,28 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>  	return migrate->q->lrc[0];
>  }
>  
> +/*
> + * The MI_FLUSH_DW command is a 4-dword sequence. If the vCPU halts during
> + * save/restore while this sequence is being issued, partial writes may
> + * trigger page faults when saving iGPU CCS metadata. Use
> + * xe_migrate_memcpy_atomic() to write the sequence atomically.
> + */
>  static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
>  				 u32 flags)
>  {
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(q);
> -	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> -		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> -		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> -	dw[i++] = MI_NOOP;
> +	u32 tmp_dw[SZ_4] = {MI_NOOP}, j = 0;
> +
> +	tmp_dw[j++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +		      MI_FLUSH_IMM_DW | flags;
> +	tmp_dw[j++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc)) |
> +		      MI_FLUSH_DW_USE_GTT;
> +	tmp_dw[j++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(lrc));
> +	tmp_dw[j++] = MI_NOOP;
> +
> +	if (!xe_migrate_memcpy_atomic(q->gt, &dw[i], tmp_dw, sizeof(u32) * j))

j must be is always 4, correct? maybe use sizeof(tmp) ?

> +		i += j;
> +
>  	dw[i++] = MI_NOOP;

why this extra noop?
>  
>  	return i;

