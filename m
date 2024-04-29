Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BACC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 20:20:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834810E481;
	Mon, 29 Apr 2024 20:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RR5uS3eI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899A910E481
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 20:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714422019; x=1745958019;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CzovfU151hsrOmnzk5CmY4PVeUS9T5l6v8+bLJZd48A=;
 b=RR5uS3eIqSh6jyOOtPguajIe80asoGE9bkQHyVcdFzYzDyLFp+oMydmq
 BKXfnJTPxUasR3heG7BDJmUrmZI+PeUtnhY7mpP3kYmOmueOxlhx8Jgid
 L2TZni76WZP+PyH6z6A7gPsbCpPtx0HC7fk6iYpuiv3yv0KJ97A8cJu4K
 OJyXt4iiw5kVcddHeVJdMaxcraM9Hofjb+kQegmvvkASlyhx81/zGJ4+X
 giCjekhDvzziR2F1an7qDgsAMwu1b9rhfIwcypQxPqBWRe/9Od83b/hL8
 9/hQ6vfVW3q7P+hNMXDkc1hGXF5taICUqbDZ0PGI7N9giKImqkXI+dyQ4 g==;
X-CSE-ConnectionGUID: 0EGwAfQ0Sw+lnijgvmHBxw==
X-CSE-MsgGUID: cBBCoOXPT3qUCB79kftOjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="35493855"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="35493855"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 13:20:19 -0700
X-CSE-ConnectionGUID: rjTyerQ+SyeyJaRMNqjpYg==
X-CSE-MsgGUID: sjXf0yhoRSqKG6QRyUXWIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; d="scan'208";a="31045882"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 13:20:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 13:20:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 13:20:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 13:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO/+J3pFoyaZ0PrELypFL/sC+K9rcFTTcIAr41Wron3nDFAlXQgm1SlRfh52Bzswe4SjuPToojlAAO/BZmVT8wnzq0SwcJCovSrCKzFdQav87ili2oZM2lvqckSCBwnZeMNNyhX46DwX+zLo4Q7n84d4Uz+Bmwna6eWPpqDhF3sosrIf2fItmGjkLW9l341EYX9eX8pwStkAyZy16ikQOXDhyZXOnE2oV5uFwXcHU1VFS3yBUs5gejhw9wQrHouF9KciaAb66Je4PpmL2EyYXzewfn5VSCbw8Fak1IL8rdlJI0vCq+7eQf4tTUr+FnVq4p9IMDdOPAQwkuJLP7b1ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYPuYVchVRBcsEEgM/FFRNrjGsko3Cr+92fqDTXFKKc=;
 b=L8G1hrjjIjiUwwgfeyf7NtlIlBjod595glBXa/HQ8xeZGDy8xV0re+bu9LOERqgN/KIOr3D2+g6XwjIorr4gUlV7CCk5hILX0A0nM7yLa9gmJRW6OgW2bNLvSmwRyjIvpil+0XOmITOfATbdJrSQ1FEovEuiy79xqvcyuFPRXSPbtaV0xp4kdun4joHc4KlIcCh90eTtlGYJKdAcsq7rjbnZdpSWtNWmGBSsmTX4Dg+O5ROtOWR3Gu3wINaReck9CO+haumerIPQ/cJQyCF8Q8UAQL7pHzUhRUXZCLHfIZ68YzwKSUADWc8s8cHBRMRoJYDNQVWKtxkqEn8jHJi+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7705.namprd11.prod.outlook.com (2603:10b6:806:32f::16)
 by IA1PR11MB6465.namprd11.prod.outlook.com (2603:10b6:208:3a7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 20:19:12 +0000
Received: from SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6]) by SN7PR11MB7705.namprd11.prod.outlook.com
 ([fe80::25b5:e7:8133:d2c6%2]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 20:19:12 +0000
Message-ID: <28a6818f-b047-46df-acdb-4005d1be64a3@intel.com>
Date: Mon, 29 Apr 2024 13:19:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] drm/xe: Introduce has_device_atomics_on_smem
 device info
To: Nirmoy Das <nirmoy.das@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Oak Zeng <oak.zeng@intel.com>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>
References: <20240425222346.13026-1-nirmoy.das@intel.com>
 <20240425222346.13026-4-nirmoy.das@intel.com>
Content-Language: en-US
From: "Welty, Brian" <brian.welty@intel.com>
In-Reply-To: <20240425222346.13026-4-nirmoy.das@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0130.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::15) To SN7PR11MB7705.namprd11.prod.outlook.com
 (2603:10b6:806:32f::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7705:EE_|IA1PR11MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6b1598-7be8-4b9e-fc5e-08dc6889a28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUR6bU9tN0d0RjBodFJTK3J2VE53SWJDbGhTc2NOUlpjMkZkbnAwWkdndkwz?=
 =?utf-8?B?bXZPMlZlU2s5WUltVlMvLzlRRldzVis1ak5UdVNRb0ptN1IwMDRwd2hmL2hK?=
 =?utf-8?B?K1hMTWV0ajlRSjJiQ0J6aHBxQ1dhUE1jK1NEY2E1dHV4dnl1TlZacVk2UWx0?=
 =?utf-8?B?ZmNDVnUycTNmZHVKV0k5ejcwVGk3OUc0N3FYSkRyVGdwMllnNU5rNCthdXJL?=
 =?utf-8?B?NEgwdWhJN1lSOU1odUt3SGRoMHNTWnhxVERMNzQzTTMvSHFsclFkWTFiOHNB?=
 =?utf-8?B?Nk50aGYyYnRVTzk1T3JPOGJuS0pIQTNQWkFZZmpTSHUxcmMwV29oeCs3Q2th?=
 =?utf-8?B?STR5SEVCZk9Lby9DbFNyT2NJVEYzejl6R0IwVm54YnpHQ2NNcWV4eG5MWUZO?=
 =?utf-8?B?THh0WGpGVnUyNGp6SSt1bmRmR1FsNWcwalZnb3IwK01DbUU3cTRXdCtOQnFN?=
 =?utf-8?B?V1hMU3UvYnBDRmtYdTV2N093R1Uyc09XbHJoa2k0c0pqYzNOL0JSazQ5YUNh?=
 =?utf-8?B?Vm1nUUcrZG9WcnUzcUw2ZGttVklRYUp6VmFvZHI3Q0IxNzBXaGJ4SkpnYkZ2?=
 =?utf-8?B?bW9zeG1HR0Y5LzZiMkJldDg0ZERkaVRiVUdRbzFrdEIwYjZiR0xaa251d3Zp?=
 =?utf-8?B?cjRCK0w3WDFIdThQZ3puMml2N3pjaDhIVUZWeTNZV25GOUNuekYxellRN3hM?=
 =?utf-8?B?d2ErUHZvQXVhb3FlelR1QWtYSjZFMTE2TkdIb3dlYlpOTHNZb1h6KzRuUENh?=
 =?utf-8?B?ZzltVTJFdVdQZGNtZzRZUGl5VHExM3ZCc2NzUmZFOGVzUUd1cFk3VlJZUTJG?=
 =?utf-8?B?RlhXQ0tvdE1uRW1qL01VamEvaHM2L3lsOWtlVjIzSWN4ZTBDYm9LQXZyWklw?=
 =?utf-8?B?anVDWmhkazlKZjRqZFgvcGZkMDhtYjFwRUxXb0F0bTNSQ1BmZy91MXAwU1dR?=
 =?utf-8?B?Z0habXF6U0tXTkZTUWtMSmhtelZuZGlOeE9ITHJOV0Y3NHpkSm52QThKQTAv?=
 =?utf-8?B?Wk02MnlwM1BiV3ZJRmU5QS9tUHdXZExkL1pnSStXanc0RkVSOFBMZDlhYXk4?=
 =?utf-8?B?SVFPNUUwZ0xYdWo4SEZoQjloZVkvRVIrMFFhcG5RSXhYcjBNTTgxU1p4OE45?=
 =?utf-8?B?Zmc0dHhSazhmMlpHcGlmdDRvVk5CNXphcnQ0UnVXY2lrSUN4a1hzekZnUDd3?=
 =?utf-8?B?WkxvSTdIcXBGcjFtVVZYc3lucktHSW9MWFJWTmhua0ptVWo3bkhYWDF6QjNr?=
 =?utf-8?B?bExIZ1JQVDJ5Z2p4M1htQVBRU3VqQ0trQWowbmhWemxnbmdrU01ZbHpEZXgy?=
 =?utf-8?B?TkZNd2ZITy9uSTZRU29xbklVNEdZVGhIdXVpR3d4WExwd091ampKYUpuSHN3?=
 =?utf-8?B?WmhzMWw3V1RDMGxFR2lNSklsMnI2Q09VWTNmblVvZXpHZHl3ZWVlZjVpV0dZ?=
 =?utf-8?B?NnJIWEhqKytmRENJcEl1SDBwemJ6QS8wc3RsZnByS0J1MUZXV2ZjcXMwVGVz?=
 =?utf-8?B?N2x4MElSTk1ISmdCN3dvbWxGbXNna2FVV01sQXlndEViL0NrLzd4Mk1wYXB1?=
 =?utf-8?B?VFRBVmRSKzNVa3lSald4TzhYYjhSVTVsVDNZVm8zMjNkY3gvTnVSRFBySjI5?=
 =?utf-8?B?bGdOdklLZmxRZEdjTDZlMWEwakdLdEFYZk1nZVZWeWhWR0NJTnhCVUtScmdt?=
 =?utf-8?B?UjhJNi9GQ0k3SjcvN0IvSFYvcHZpWlo1YTdkQ0IxcUZDZjR1Q1VOZFFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7705.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlwODhUYjY2Z3BSRWtWcEl1c1dvU1A0MEhDejgxWGZGU3c5TmFjTE8wVmVY?=
 =?utf-8?B?c0ZKU21tODZoRkJucjk5Y3dtWWQwRTNMSE11dVhUMGpEd3kyS2x3c05TdlB1?=
 =?utf-8?B?Y2YwQ2VnRGFlV0ZvK1ZKWm9GcnVpZERxYzN6NzJxZEkrbVRlMFcvYnhXYVNh?=
 =?utf-8?B?cTNOSmZ0Mlg1Q09JQ0dQL3dYTVFrWG9aY2dwbjUvOGhjVkU4RWtKZjk4NHJ1?=
 =?utf-8?B?RDNDbjJlcmZBSTU3RSt1Vmw0Wll4UTA5UytDNU8zcWFaTkVHZUorK0F0R3M5?=
 =?utf-8?B?aFVEWGptcy8wKzhWV2xsQVBDMnhTRmtVSXpNejREOUFacEFOWS9zN1NRZDhv?=
 =?utf-8?B?bU5zaW82YlBnQUN3cmtVVUtmTzZqQmd4U3MxbzMzMFNtVXI1ZE9KZmUvakQz?=
 =?utf-8?B?d3RXbHpsZWpCcEJnd0ZRaEVIb00xa2FPY0ZQenRpYnpNdUI1aHJWNlg5cWNT?=
 =?utf-8?B?cVJML2s0anpyYldiTG1MTUhXVWtCK3dqMWx6elB1c3ZNR2xoQ3JLQlRSblVz?=
 =?utf-8?B?cS9FaytER3BUT25FL2RwZXgrMEV5TXZpblRhN2xtSWdjVXVKRjNEWU9iZndq?=
 =?utf-8?B?YW1XR0IzV1JUWE5aMDVSeWlHNDhFVmhDN0ZmKzZUOG5zVE5NRXZtSTFhZG01?=
 =?utf-8?B?V3dNdzVsek1EeGdmTkNhVDRvUU5xWW9LNXkyY0ZoS09GRjJQdjBDbzE0Vjd5?=
 =?utf-8?B?VE5PM2hFeDVnL1hmVHdNVFlBZ3BYU3laN2sxOTQ5bGtXcGpETmRFUENGRjFo?=
 =?utf-8?B?dUlTaDlTbkRiREsxTXhNWjRKRkloNEVweDM2Y05uOGY4S1NmSkVZRFpEcGdk?=
 =?utf-8?B?MENhTlhLcTdFMnl3NjJLa2FNVVVKZmRnTE0zbDdOdVdqcmx0T2N2TW1GTm1z?=
 =?utf-8?B?K1RueUNQdEloWVpPSlQrcFBTd0R3dEY2bGc0OUVlZ2hMSTVScEZHRG1lTnNI?=
 =?utf-8?B?RjNDRHlTNk1TQmNzYXFiUlNSeWJPdjF6LzBzVnlEVjhGUThtTm1zT2V2aDNC?=
 =?utf-8?B?QTlpWmJkaFBtSDU3eHVQc3pERGFrUlpXaGNBY2NZUytHSFh5V1I4Mi81WEc5?=
 =?utf-8?B?ME1PMlZOMEppdGxEb21kVjRlV29JcHRjeDhWQUN3UC9QYVZQQ0pRaUJpakth?=
 =?utf-8?B?dThDdmN1MER2N3Rmb1FBVW1rYUlpTTVqZEEvU3RFZDkrYUQ1TkxEYUdCN3ds?=
 =?utf-8?B?YnFhWmhIQThmdmtQRXE1b3ZxeXFnOGw2QUc0MkhkSm1uaUExaWpiWTNyUkFK?=
 =?utf-8?B?VGttbW05dWV6d2s3M0I1WFlJMjM0SGlPWTJyTjJoOFlpYmpYN29OM2JuMjZT?=
 =?utf-8?B?WXZOUSthL090VlFsaWdnZCt4aHJQTkQ0Y2ZJeE5XaHRCNlNkNEJWcEc1NVU3?=
 =?utf-8?B?REd1Q2gzOU40TU9hZzZyV1hSU3ZjaWVVMlZLWHBZTXgrVVJtbjQyLzdYUDVi?=
 =?utf-8?B?bFZPRnVoRXQwL2JHRkhsY3lsYWhGYTgvOHE4dUdyMkpOa0dlLy80eEF2K3pk?=
 =?utf-8?B?TlRDWTlpaTBJTUcyK0thL09hVGN6L0twd2hYWHVoVnRlRUxlQlNRT0pBSUZ2?=
 =?utf-8?B?ZHNTdGhKelIrN1M5TWN3VzlFQnVuVFZHV2hNazUyOUJDbnRWMnZNbnJaRElS?=
 =?utf-8?B?MEpTSUhiVFNWek1COFFXTkRiY2RNaldpdDgxYnVzWStBdm1FRThLaHVhRkh5?=
 =?utf-8?B?TUdoeDhoN0dKaDMydnpwRkdYdGNGWUlvOHgzNS82VWNaUGtCTFEreHk3cEo1?=
 =?utf-8?B?Y3FGQ2w5WXZKTnkzem42MWc1bmNtVVRodWtGVitXUHh5NFdQSzREeXBiaCsr?=
 =?utf-8?B?RUJSSE9LbDFTdDdoUUQ2V3N5YXZ2U3Z1c0NMWXZObHQ3NHo1Nmo1M25TWkdw?=
 =?utf-8?B?dDY1KzllcnZSM3JrNHlBam15bjE3dDhuRlNxcWlxVGZLT0Q4WExESC8vN0gx?=
 =?utf-8?B?d2xoTlRWQ2piTXVzeW1ZU2Qrdjl1dW1pSnd5clpGN0dRaDRiZUtKYmJrd0d0?=
 =?utf-8?B?NkNwVjFvL2UxQkZvUTZxWDhNaXlXeU1KTGJQMmZOd3MyNlJtblNHT2l1SjZE?=
 =?utf-8?B?d01GbGNDR0tDc0NGT2szSm5tNDNMQ3gvcng3SFFGeFlqSUtRd1E0ckt2ZjY5?=
 =?utf-8?Q?j9yecf++1eMh1YCUx4dbYxazI?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6b1598-7be8-4b9e-fc5e-08dc6889a28a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7705.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 20:19:12.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1XK8TolglxMO8V/b75/+iMm7RC4uBdm74h9rlVTGJXXs5lIrR70/LOU13GGY91Km5Qi/RVw/hk2ZE8Id5Ibg6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6465
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



On 4/25/2024 3:23 PM, Nirmoy Das wrote:
> Add has_device_atomics_on_smem to specify that a device
> supports device atomics on system memory. Currently XE2
> supports this so set this for XE2.
> 
> v2: Set has_device_atomics_on_smem for all platform but
>      PVC.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Oak Zeng <oak.zeng@intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>   drivers/gpu/drm/xe/xe_pci.c          | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 7cddb00f9c35..0af739981ebf 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -283,6 +283,8 @@ struct xe_device {
>   		u8 skip_guc_pc:1;
>   		/** @info.has_atomic_enable_pte_bit: Device has atomic enable PTE bit */
>   		u8 has_atomic_enable_pte_bit:1;
> +		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
> +		u8 has_device_atomics_on_smem:1;
>   
>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>   		struct {
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 5618318e6f3a..c6e8a264348c 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -632,6 +632,8 @@ static int xe_info_init(struct xe_device *xe,
>   	xe->info.vm_max_level = graphics_desc->vm_max_level;
>   	xe->info.has_asid = graphics_desc->has_asid;
>   	xe->info.has_atomic_enable_pte_bit = graphics_desc->has_atomic_enable_pte_bit;
> +	if (xe->info.platform != XE_PVC)
> +		xe->info.has_device_atomics_on_smem = 1;

Minor comment...
I guess no harm with how this is used later.

But seems best to not set unless has_atomic_enable_pte_bit is also set?

     if (xe->info.platform != XE_PVC && xe->info.has_atomic_enable_pte_bit)
          xe->info.has_device_atomics_on_smem = 1;

Or:
     xe->info.has_device_atomics_on_smem = (xe->info.platform != XE_PVC 
&& xe->info.has_atomic_enable_pte_bit);


-Brian


>   	xe->info.has_flat_ccs = graphics_desc->has_flat_ccs;
>   	xe->info.has_range_tlb_invalidation = graphics_desc->has_range_tlb_invalidation;
>   	xe->info.has_usm = graphics_desc->has_usm;
