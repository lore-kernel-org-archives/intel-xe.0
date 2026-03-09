Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F573EF371E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:04:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138BA10E13A;
	Mon,  9 Mar 2026 09:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZxWiKe5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9210E13A
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 09:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773047078; x=1804583078;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9Y4yfuka1oeuDqMySsPpcBSyRMS/krSeX8IIXNYF+Sk=;
 b=BZxWiKe5hn1y62La2GBLMt9VMnyqe3tUG8iRqKX+BkdOiyDRkCQk5azt
 hW7/yleMixXBnCQE70UpRHiCmQMFS62Xo5DjVfZfojjyp01YU24qy72Ve
 o+KQitNJ9ot8oTTdlJdgeC/f6FGJcYJcDc8i3PBgP98BIgTP6nDj4KlyJ
 4YjPuMifFtzEVN0/+yCIzTG5/jB4/t8ww7CgGu6+8Q7pZbzSfZEOxcBov
 CpSTdJc0esBtfwZYf/DZCfStVYFeKNTCjMSMlofs+mFL+OOKzkBmToPnJ
 cTcSeHkEDf7b6ccbp2f8/sYaDsuPvZ5lQa16AeFaKzo3Wjz5TPFfIeElp w==;
X-CSE-ConnectionGUID: 6KtUekKeS4aUhWAhmQLySw==
X-CSE-MsgGUID: enTWFGkCQDGha4rK7jWkvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85155111"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="85155111"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:04:37 -0700
X-CSE-ConnectionGUID: cLf+R7RiQ6+p5QE7KGLmbg==
X-CSE-MsgGUID: wcCs1f13SKSqC3fPq0ko/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218831719"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:04:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:04:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:04:36 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPdLxDUX+iQ3ukplQkRT8BbmA9WCGSIkWYtw+l1g33lrb3cMEwTWeoqJiqkhR2XMlNXC6UjTqCaaSRzmX6XE+Inr3Pr5wxpM+evwJs+B1uWBRrD6/wVMlXlMvgSf0aEIwlvvGtBV2of6MPC7QsY2BBwW5z0pzKvogAr0eUh0Qb9skPajA5r/k33c1KYMSfoX2M4N4f84he+yzU572F2RdQTWhFq39abUT0sjHu0Dn/dSqQKgcBH1yPfxDI5BSQMCX+wLj+RbYv35tzRw9+hMzZdZxqN4agbAco38GtvNYPGxkSHZYd/+Uz8gxQ3RUkTAkd2OUI7k4EhBj/K/U1ycaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDWHgfTs+OYJEj/AudYCewjTpHMba46ndQUEl3NKNZA=;
 b=rKyFEQaw1xqBwP81xqZMwxd4PdnM2TJtJ37fMtFq/m4YK9Yi6Ydj0v1RerxRCazscnQH174Y1etzOwNK9XgIusDLmwVivT0Ou6qoevmG26e/jUtAmmfONx9lF9AWE0l0xPqQ3h8SWvhCZ3VKp/lIfTsvkexeppP8XQGrAO+hGHKoFMLbumofZLBdKnMXRAYSyWmcfbIswPJvOizxIiy2OOkL57MHCuad/gysgqZw/VYBTfCbGTB5PRtAFbibjwgqpllfqFbzdhf3EEj0nh3jLS48kslPUL4XXrjD2MSE1QlgN41gEJ+0BIKxrFY2ReT9qwnqocmKj6CC2jX//DrQYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:04:34 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:04:34 +0000
Date: Mon, 9 Mar 2026 14:34:21 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 4/6] drm/xe/sysctrl: Add System Controller
 initialization
Message-ID: <aa6NFdwrIkXbZoY/@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-12-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302081002.3275868-12-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5PR01CA0147.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|IA0PR11MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d736ab-2de1-47a9-dcd4-08de7dbae237
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: ouiIfg7vWzi9CyM3O73ZinQ8tYdy7jAhAMKgMKjoqZAtPQEJIYCGlBcWiJRmh7jeUTFc1o/luVwyT6BZCZkh7BbgJIp/wqbQbE08y0fd4MH9r8CMzaqM8lw3WDX1Mv7i57Djy7mVVYE0ztJ6cP9moFE9Nf9o7txU8LiaSusi9kKU3bJre3HsOxHI1/ycM4V4Sq02U7TsB196G8a/VUYNfuHCR8knxTpGJVqWn/5nTTOQ79lmJtZbPA5rR9AhRTzgHW95VjPaZTJ5t/Wvjca0pPMkrfMeOQnZO7Ds1C2s4fCIeTg0eq2QIZThjeSaJJdetvLvPeQiVNmPsXaI/YIrkGC/anWmMbFXd/D5n42c9YuiVtpeFzVIV3NRG7X2XxKAFY9gJZkFmobVDIC17p29T/7aL+hkHrafykDNQYitLLg1hNrwk3Av68QFBYV+me9Vb3mRC1ufvs45/YhIr794gXzMu8fl7KsxwOxR8nUFaOdGuuvzALGWGPPoJB0at6b4vp2EaGGJ3mSMfQwB8K0lOTYIDt/PWDRRvPnMNdB+RNKCozwOOCcP6tqiJxMoInW+4SW72/soCJxMkJBSt6Ks5c+mKVDSRTT4ymXfuqquK42evEgRXP3oZ0yNhgixOTuIy6au89pgocfNjLajJeZsmYLoItaSsgF9r9vzOIQWXpY3aKZqIAfRtmSTQKarkcmCamMCcXmiNCUyAZGFpwgUqobaGWSv9xw8RlPi0bpYcGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHYxaXB1Q0I0aDJuQ3ZNZmF1d3MzRWY4V2VlU3pML2hFNUgwOXVNQklDL3lz?=
 =?utf-8?B?MG1ZQkJSNWR4OFRsSER4dHhpUkhQWThUOVBGeWZUbjl6WjEvd1gzSHl5R1FZ?=
 =?utf-8?B?aUwyekZlSjhrd3hCUTlWS0hKZzBBcEpGYTdMai82WVVTelFaOWhKMDYvZis2?=
 =?utf-8?B?OXV2Zy9TcElnenVjZnN4MnBVMzJqUmtsSzVrK1ZCaGV0RXowTmtpSEVrRFdq?=
 =?utf-8?B?cTJCdnVDTytzU3VvZEhwSFN6M1E3SGFCWkRXZGFISzZvV3hGaUJwNHlDcFE2?=
 =?utf-8?B?ZzdBVkt0WjhYWkRQM01FT1ZqRW9QWlVaQzcrclh4Rk5PclczdjRySUVIeEpH?=
 =?utf-8?B?cHhGaVhaSzhqcDFaVStQbnVIM2kwM0xTWUNuKzJTcFdPRDZPTkdJaXNqbDgx?=
 =?utf-8?B?Qks5cXJtUFJWZlhZSU5UWjc0S2czd254THh3VVdidytOWi9QTUVYL05KK3hW?=
 =?utf-8?B?NUlhcmt0MitFcGxjYmdsa2JFV09iN3ZYUkFod29YalZ4M1NIUG5EUGlFOHpK?=
 =?utf-8?B?MDJScUlmRDVaYVYrUGROMFB0QTdzRHlaVTZycWp1K3NQMUVqd0RiRE9MeEo4?=
 =?utf-8?B?ZXEzMFU3b1ZOOTd2NUMrY3FZVnVVSUNhcVBVUjdSS2lieWMyVUpnTnNnSy82?=
 =?utf-8?B?cHBseitPZ1c3VWkrOGFqaW5XVmFQSkpQTXU4UDNXeUlSSUptbFBkanZWYTVh?=
 =?utf-8?B?WGFiQXFqeG1iOWl1TVFPY0loRzVpbW9YRUhRZFZuM2k0emlCZ0FxZVlMUzly?=
 =?utf-8?B?WmNkeGxzWW01L282dHFQVFJIQVBmd0ZiUkJuZU5MTzBYSk9xZTcybkk3aXQ1?=
 =?utf-8?B?VXVUZkNiSWJvdjJ5TnhmblJsZXlUWTFReWpUaUJvdnR5SnVGd0dLU1lwWVpF?=
 =?utf-8?B?dVVuTGlTTkVObnMyV3NiNUhGSG1vVFBSdjBSV0FDV0VnR2pHY1luR1NsSWpj?=
 =?utf-8?B?Q2VEOU8reGs3ZHpySXVVV1c2MDhKZDAzamFrUkcrWS9UOTBNVENhZThyZk5s?=
 =?utf-8?B?Y1BjcUtrT3VTQ3ZYNzJZMkt2MEkybGdwSEU0N1hZRVVFeUd6QXVJRGFFZzI2?=
 =?utf-8?B?NkRrY2xicUNGaHZSL2R5VUhrYmZNRnRlUWhpdlRHZ0xzZy91MHk3VU5lbGd2?=
 =?utf-8?B?TFY5LzlFT0MvVXJ6MGpQdHl3a0JhOE5HNEdhR3hOZk1nMXZUbEgwRm5QQm9L?=
 =?utf-8?B?RFVSYlZuck9rclkvY3l1WHBpYy9uMEVmd1FWa2ZUb3U4SjJ5RXJ5MTNKZFY5?=
 =?utf-8?B?Z3ZIZCtQTTU5Nld6ajM1VjFXY1lKSC81ZTRjdUdiam1ZRmJhbkZiNHdaYXhn?=
 =?utf-8?B?b3pzR095S20vQUZJRkRzSFhzL1pjbVZ0SnBFVHRkRzNQdW9pY3UwY2hVellz?=
 =?utf-8?B?VWRidUN3bHhUYzFxTDA3UzNSRkx3U1FkaThNbXBiWFVaT25LWWU5YUNsV0Yv?=
 =?utf-8?B?R0hyK2pvNVdWRVQ3OVJmaC9hRUdWbFdDL1NxRXhQZERZeVVpNEFPR3Rla0Uw?=
 =?utf-8?B?ei9QSDNKOEpJV3d1bUlIZkdkLzFjcVE1NkxPam9zQWhLUUt0eFQwS0pJemRW?=
 =?utf-8?B?cmJhZmFsbGduZGVHVUw5czBOWWtzM0ZQcExWVjZGdk1zbVQvZzR2eUQ5TWdz?=
 =?utf-8?B?ZmczSmsxaHBGQ3ArWEp3RXJOeHlPZGo2WGtPY0FOS2lEOTBWM0ZhdEJOWk1X?=
 =?utf-8?B?R1cxK2RaZ3NKUWRBQW9OeWtpbG9BZjh2QzVQSmY2TStzOEpraTZoL1BaaTBN?=
 =?utf-8?B?cDZEQXVjTCs1ekwzVk1ZNTl1ZUJCODFsc3RLb1ZKR2trTEF4UjZ5SmpYNkZE?=
 =?utf-8?B?ejNNU2R0MkIvbVBpQjBiOTdKam10bDM4QjFnVE1tc3pNbW1IMVQwNGFRKzdu?=
 =?utf-8?B?ZExpTGQ5WE0vRkkydDdsSmdGbkNkeWc1TCtGcGZGZlNRdmIrNzFuZlE4eUkx?=
 =?utf-8?B?K0RFOElWc09ubFlNUmdWem9qazhXMDh2NCswSHVUKzhkWTdGY2VWNVhuV0FX?=
 =?utf-8?B?djl3NkFUTXZ6YkgwRzVOVXBMSnhKdFE1U3RxN3drY1gzM0F5aUh6dkoxTW44?=
 =?utf-8?B?RHVCT3JkcVpLK1dYTFFrZnFDdWJVUUJrMS9kcnVKeXM3cVprdTQ2Zndlekl2?=
 =?utf-8?B?eDYxMmdYODc5WlQxSFBycElrdHRpNktIQXYwVGtTK1ErakUrTHROaU4vRGI1?=
 =?utf-8?B?S1ZrczQ2N3d5dXVYNUJEbXY4NVczbno1NnFkOXlRODVLR1ZjdjJUWVNSRHF1?=
 =?utf-8?B?dU9qbkt4Uk1ZS0hIL21ESFdQN09RaTZyWkhaTmdBSlIwTVduN250TDJxWVFk?=
 =?utf-8?B?OTAvNStDOWg3MzJvQnV1V1plMFN0YTBSU2VaUWIwYmR5MUpwWSs1aldveHp5?=
 =?utf-8?Q?mq5w4iZbNL42Q3c8=3D?=
X-Exchange-RoutingPolicyChecked: GYvX4mCliY7wDmf7ydIKgLADxMjmiuL7Tv/8Fj0xkNTmUJbBG2SgzlqOOrQwi52umvchR45TjRga2aeKcoFRTzKeTS1LWyVOIxcA7ehWPHwm9RDHgmI88qmzhG2vnnj2DmNStaX7vYrxILpDAuoj6ZyS+VSIo5a/ICqtTCwWM1qvkJ5r6ky4WDqglz/y7ANG76TFMbNAIhs3KVWKK+3AJxqDU3jHOeQDF3+g0T6eHgzsv0Obx/l+Dyyr2u6Arfk3/CtQTlctrOo+EYJNzvbwY/yA+r8xtwWpjsUhPvybnXG/v1yl3AT6jkcp8Wvou7bzSSaqI19K6dy0Sq0gh5wgHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d736ab-2de1-47a9-dcd4-08de7dbae237
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:04:34.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fr/7C2en+8zEyWHQdU6a0dCKbJ22lX09OwYXVhTZ8g026szL3HDBmbvRU0IAggrNk00jNsdqdZnm8dDle3JhAlyFOghZEEIWclajUqEcZMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8399
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

On Mon, Mar 02, 2026 at 12:10:06AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add initialization infrastructure for System Controller subsystem:
>- xe_sysctrl_init() and cleanup handler
>- Integration into xe_device_probe()
>- Makefile build inclusion
>
>Initialization flow will check platform support via has_sysctrl flag and
>configure mailbox region through SOC remapper interface
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v8 (Matt, Michal, Shuicheng):
>- Fixed include order
>- Added VF check
>- Converted runtime checks to assertions
>- Added sc_to_xe() helper
>- Fixed kernel-doc syntax
>---
> drivers/gpu/drm/xe/Makefile     |  1 +
> drivers/gpu/drm/xe/xe_device.c  |  5 ++
> drivers/gpu/drm/xe/xe_sysctrl.c | 82 +++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl.h | 21 +++++++++
> 4 files changed, 109 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index ff778fb2d4ff..07e028fa50e8 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -122,6 +122,7 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 3462645ca13c..1d61bb504e9b 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -65,6 +65,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -985,6 +986,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..2751fe25a6ff
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,82 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include <drm/drm_managed.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_assert.h"
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sriov.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+/**
>+ * DOC: System Controller (sysctrl)
>+ *
>+ * The System Controller (sysctrl) is an embedded microcontroller in Intel GPUs
>+ * responsible for managing various low-level platform functions. Communication
>+ * between the driver and the System Controller occurs via a mailbox interface,
>+ * enabling the exchange of commands and responses.
>+ *
>+ * This module provides initialization routines and helper functions to interact
>+ * with the System Controller through the mailbox.
>+ */
>+static void sysctrl_fini(void *arg)
>+{
>+	struct xe_device *xe = arg;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init() - Initialize System Controller subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for System Controller initialization, called from xe_device_probe.
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_tile *tile = xe_device_get_root_tile(xe);
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;

I don't see a case where has_sysctrl and has_soc_remapper_sysctrl can 
exist independently, so you could safely replace has_sysctrl with 
has_soc_remapper_sysctrl and drop has_sysctrl. If you do that, the below 
assert makes sense. If not, there will be a disconnect between the 2 
flags and that can be hard to maintain (as in has_sysctrl does not imply 
that xe->soc_remapper.set_sysctrl_region is defined)

Rest LGTM,

Umesh


>+
>+	if (IS_SRIOV_VF(xe))
>+		return 0;
>+
>+	xe_assert(xe, xe->soc_remapper.set_sysctrl_region);
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, sysctrl_fini, xe);
>+	if (ret)
>+		return ret;
>+
>+	sc->mmio = devm_kzalloc(xe->drm.dev, sizeof(*sc->mmio), GFP_KERNEL);
>+	if (!sc->mmio)
>+		return -ENOMEM;
>+
>+	xe_mmio_init(sc->mmio, tile, tile->mmio.regs, tile->mmio.regs_size);
>+	sc->mmio->adj_offset = SYSCTRL_BASE;
>+	sc->mmio->adj_limit = U32_MAX;
>+
>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..d5d8735038ae
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,21 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+#include <linux/container_of.h>
>+
>+#include "xe_device_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
>+{
>+	return container_of(sc, struct xe_device, sc);
>+}
>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif
>-- 
>2.43.0
>
