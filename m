Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5505EFCD71
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 09:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8215F10E4C2;
	Mon,  9 Mar 2026 09:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gyWd8/Rs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E1410E4C2
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773049402; x=1804585402;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SKEJ8Og5cCOi2j8X2RSuczCTveeYjrEMuv78iy7ENEI=;
 b=gyWd8/RsljXoIxFBzClYB2UrBAb5gnX3QoHmMww9Hc/EW6FdMuxFaa95
 NLH2b8+BeBDth7bVZw9qA24TZNYB84+mdDQkSY1vkwRL0kX6fMb4F4h34
 LBy1ClBcy8RgnWVvorqn/WnD5L1mX0GynCTmoAH2pUw0gYRrCdukg/oel
 e0cd0277gyr+SEKfiQi9KROcOkRyEdg5UZH3Adr+LQS0/U452ymoE6cyj
 mPmygybyxpOv8KWz1lZWq/Vgk8j5gK0CjpA9c/7JtTrEzvDnAZJRwqiJz
 DIkSw18AWk5VFs5KPzhsHXtr0Ud9wWFB+PfjhJ16tpQdG+wtAtI6N1oto A==;
X-CSE-ConnectionGUID: LkeEQkOPSvKVIILXg1emWw==
X-CSE-MsgGUID: A6mpW5VbRBWGgbH3bZH/xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="74179511"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="74179511"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:43:21 -0700
X-CSE-ConnectionGUID: hHFZ5+vPRYulrzw3v16hpA==
X-CSE-MsgGUID: bAONuQunTl+C723sdTZsew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="257625923"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:43:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:43:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 02:43:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 02:43:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ulz8N72ztW5RAIl7fkCkV7xtBobciyueOLgXvB6IvaPfNZ7XPIZg1H7edy/5fMzTJcrnvCeyXndVeqWGFdhDqfUC0EZS2UhSmeDyOXQ4QyWP6ZVQJX1Flv20WGLqwVj6yLDmT1Fiiu8gWYud/u0mbuua5HBC0oZC2NTuarJofyG0ZXpJSOv/jvbQuvqbxgWj3MJht+g7UzUFSuN97Y7sVrjRuW1j92zI35W4hiAuFUh1CFHeol5Z74+eb4G3Fs/OQ+xdBROEV4NGj0KEinYstaBGWA2XiYB6CyhSxn9Z/MafnOTS6DFS2C3oX3gxTB0g4J+AHaROKZH+KJyglJezeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LVBXN6OhlGDxV0Kj/ovdFDycnelmyTsBKFOoKGjMs6g=;
 b=toEMmcxcBPM9VSDa4KKqulIGvL87vgSoVK2u/P23j+5JRKFr+RMafgwigqiH0GbxFQl6gz2oEMSL1Of47zdVQrmFSsSZ1zyiaSdn8IFoLkXzyLX7CnstyO+XCwEIm1gah63AUso4zYPPVRKpMSFAN8KnQGPB48s/jdhzkNeKa7w54ot96jKnGp5H5x9b+xd6magiZMINb8QSeopm9FP9+QoH+BMzddFNgNur3t5UYI0DqilrRtWJlB93tiBcjqg2hRpY56m8yVcrIaejKaU2+9uh6ISdzBkbPYv6UsF+wLKLuyWTSIv3rE+lC5jy7jPeNMhAqlUnnBWdW47qIdQWfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 09:43:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 09:43:13 +0000
Date: Mon, 9 Mar 2026 15:13:00 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v8 5/6] drm/xe/sysctrl: Add mailbox communication
 implementation
Message-ID: <aa6WJHzxkUbXrqXU@soc-5CG1426VCC.clients.intel.com>
References: <20260302081002.3275868-8-anoop.c.vijay@intel.com>
 <20260302081002.3275868-13-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260302081002.3275868-13-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5P287CA0082.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: b12f5bb5-9bb0-4033-edf0-08de7dc0480b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 4udyBt2CGdwg/gQqeHmSIocWO+Ui4/CN1zyHI/rTswkJJmAv+DujprIw94x2TVFMiwAka9zatB0nUM7Ke55ElxtuAJij8d43IuiQmfRrRMsbj8SwC3CAmQO0HTlxXP1CYJoqLge2Y9Tf5bDoUBqxLnh7zNMg9b8ySAZy0Wg4eZOuL4cp1iPJGPSK14/KiGAO/6qsz3esuTHxy9xfHuEXmB7+Kxzderw5+4/UIr4yJAKuwa9Q8IYN6NgQTQsxakfHzAKAY8ZlGhL/h4hzWZHDEOGpuICQHgebdjf8LkJFcZJzlnxW0LjIW3EmvcT5ewcGNM2cJRIplPo7N2B0GLYDxJInW7VJ7EhkHzI2XL5FwLcQADy1azBbd9NDedgDdONgVE1oCFoqArJnKkFEFDPK/NH856KA9YNDsmRvSjE51jj+4SNSQyR+C3ysnz5DoR3baLBYWN39SOX3TYVawv0B4NRtiOKDrTdQCUzXY+SeD3V8LQ559Tr6sO+Xsyea76QKW9bz3JPCE1hyzKcJvNI/dHQueMWLBq06xs+JFCy8s5GQ12kVQU4PMX4/vj8B2CxgK7CK1ktXCAn6rMAs+OuKBfawr03lWZZ4X0Duqg0HuJeREQdCs4nz7qows8d8XZWDtaJt1iBlTuvxu2s7epoLvaGToyuxB5BEy/fTfhMX7Swd9d8eb80MOlqUkAseZoyGujU1Xd9J7nMEr6i49AywGW5ZQA2hcLKyteW600DBqfw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkF1YThPMjlkTDRTSEsxRnZpcnZuakxhU09uTmJKMlFoS2pGbmhWL0hlb2lq?=
 =?utf-8?B?SDQ4TWpFY2xrVDBVRnk5TzJ4YTZHQXZuWlNTNWo0RDhuVVJpTlIwTmN5aTJQ?=
 =?utf-8?B?YzgyWHZBTnRpMVRUWUphaXBnRFpQUDFPNEtwdDMwb2pzWkUvK3hqTmVRc2cw?=
 =?utf-8?B?YTljWktlOXZOSHkvVm9RNjJMQzY2WXpjQWttN3p1YkNWRkMyS3BNTkZFeXlQ?=
 =?utf-8?B?Q2cxL3htNVY4RFFESm9ZNUtLWXJrUm9SWkVtbHNRaGtacnFVaFZLaTRPTElE?=
 =?utf-8?B?OTFPcjBpdmhJMWxCSlpza1E3SmhtWkhCNzcxdDZYOUE1QWlKS1B1ZHAvakd5?=
 =?utf-8?B?MHpoNThmQ0JpdFpUUERTamFrbzBFWWR5akczeHhteWVPU2dMaElNRE5DRkNn?=
 =?utf-8?B?bVA3WVpuSVFJR0UwbVlna0lrZ2xYMW5jOHlKQjM4MFpPUzIvVXNZZ29ySU1h?=
 =?utf-8?B?YXpGeWRsY25YaWVFK3dWS0M1dnYxNDc0TmYzSW85Unc1c2VTMU9SZVc4WU5k?=
 =?utf-8?B?aTh2Y1MwK1pxd1F4N09rbkVyTmRybnpiSjljekFzd3VEdXZCYlg2Q2lxT1JG?=
 =?utf-8?B?VVZQWEFTRGNEWmdFUVc3TTFzWTl0RHVCdDJsTm9meHA0QXMrY1ZNOTNOK2pN?=
 =?utf-8?B?VUdmUW1JeHNZMDNjN2l3NUlWZm0rZnF1RUhaUUJCazUxK0JhV3JDN2V4cnZ6?=
 =?utf-8?B?WjJ1b1RraVRaeG8rK2lpQmc1OGJZUktmNEIybkYxWjhEcjJlK2ZxZHFNOVgy?=
 =?utf-8?B?VDFkRW1Ub2R4MXc3eGdNQmJ5OUxreCs5WStiRVJyNTFnOGNsdENKQUdjSXpy?=
 =?utf-8?B?a29EaVhiYWM0M3hnNlRyMjF4OGs4RnVzdXFWUEtTZXByOTNaMG9ZQ0tySjdH?=
 =?utf-8?B?Tmc5UnNYSUZYVEVpUFVIUFZMbXNUaVFjRU5YQnJEbjNCV01MYWZIbU53Qk5N?=
 =?utf-8?B?RUxtZkF3dVZ1Z3F3S3lyMUNoQXU2QWNEcWRhV05zNUZ4cnQ3aTNVcmxaVDlp?=
 =?utf-8?B?Q0F0Y3dEN0JmUHQxN29SNUhPQk9WY1I0UlFvY0tmSUlJS0RDQ2svbUh0KzVC?=
 =?utf-8?B?MldjdVo1dlFObEUyQzBZZkZYcmZZamI2bk01TTlwTnAreVZQUkltOC9ya3VW?=
 =?utf-8?B?Q1R3RUlhV2VPVk9pTktrR2duanFZTE93S29OOFlxVVRzWjNFeDV2aTJJWnhk?=
 =?utf-8?B?alhBWXhIdXFOa1g2eXAxSTFuRnRRUHZHVmFENWlaeG4zNDlRcGdkSWxVcHZj?=
 =?utf-8?B?eHdzbVJsT0huZWVLV0JzRTJ5SjgvMHcyNTJFMkovZUVSam9EejhNL0RyR05L?=
 =?utf-8?B?dzJJbTNIT1pFcjNVZjhyaGU0dmJKT2VTM0R2cWpNQUhEcVFDdllwR3VOYzNN?=
 =?utf-8?B?NEdZVjZQOHJ1SVUvWGUzc3Bveks1L3AyNCtJUjExdU5QdUxnQllqY245UmVG?=
 =?utf-8?B?eFh0ZXFlOTRzV3VkQmFKNjR0WXMwQVdLYXUvZTRiUTJuVFpWT2RYWTJwd2Vj?=
 =?utf-8?B?ak5VdEdZZHI1SVZGK0JDM2RCcjFvU1REdnBIY0JmU005S3FOU0tPTEVheVpN?=
 =?utf-8?B?MkZOOHJUNFVpanFzZFRReFhYNXkyMFlFcVVaQnJvQnJIWndvdEJweGVnRWcw?=
 =?utf-8?B?Y01EQ1c4eGxVYmtOK2MvdGd4eG5kbUxQSnh3ZkVlclFZWWFTbnVrRjJuTWlY?=
 =?utf-8?B?QStoNkZiTlBtVjRrUGluMkdVSU4wUzJnekhlUEdyZXlxaXdaSUNXRm5TcTV2?=
 =?utf-8?B?aWxWdEJzbTE3R1hJRHNwNm5hdXUrZFFiMDZjS09YVElXUTZhMGM2eXNEZ09n?=
 =?utf-8?B?dDFKTWJoYTFZVFRMZEZXQkMzWXozVURvMXd2c1F1OTFkdUhPSmpDQ0tDSkFv?=
 =?utf-8?B?R1I0TldWbFRGTW9ycXRRa2tQL29hN1VDRUxNdXM2bkJIK2loZzlFaitkRHFV?=
 =?utf-8?B?dHF4Uy95MCswMDQzWXhIZGJuK2J1R1h5M3dBRnVrWlpvSTZmMVd5SEp0bmxo?=
 =?utf-8?B?S2hSSFhQRSthTGZqcnQ5UE9DZmFDeTJrWWw3bVZLWG1NMVhkOFlyMEVwQzNm?=
 =?utf-8?B?QXFHU1VOSnNqRktCaXdiRTF3V0JHY0s5ZkdxV0dzSGZIamE3NDFERGdLa1pr?=
 =?utf-8?B?TjMxc3JJdUxnNVlOSUFFTS9ka2tsN1hQM2hpUkhMalczVXN2U0NSRytmcjc0?=
 =?utf-8?B?VnNJRWZzYi9pVmVLa2xLKzZHb3VhcnVHVjc2M1A2K3J4czY5WkxvV1NWSTRY?=
 =?utf-8?B?RFhvY2gwWWZ4SjUzcG81SS9XWDkyRXNkMmtsQjMwN3hWR3A2Zm9FOWlyWnlr?=
 =?utf-8?B?TDM5ZnVscjFsSTQwMTdhMEJQZFJuaWhDaWdCam00Zko1R2RLRC9ZSGtEVTJQ?=
 =?utf-8?Q?PxAURtl6YIATCmGY=3D?=
X-Exchange-RoutingPolicyChecked: XhXF+ghFk4B2AT5HtAR/+eGrsyG2qq9ThubiiB2NRgLwlCVAvWVQV9dD8V/ImHzJuHaQMRUkt+vWj4nwfsKWlo7sxqIuY9ATsM6X0IPQzs35XKk6fHVALLeV13BS+aSJuHm0UN7K7DP/FmUJXBzGIL8gUmZ8iIv4azLE+6XDFZr+omDurc785/0jzKKPyjrPnZ0Ox5jacjsGDA8tt27lSH88tupBjCmrKw/ZPTj00V9vAFyWl9TGtI+rPICsyZYncVahuTfOeiqEjiKKK0Zz4tRr1A/FXikuhIcb7s4lNMNvz97qVgeB2V5camEmFtikAd3wa/5rHXaRkkxH89LuFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b12f5bb5-9bb0-4033-edf0-08de7dc0480b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:43:13.0533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LdVSuXmMrF9+mRMeh32mt+jG82uWlUbw72aqjrx9lo8gKeowF3uju8xGu0whZqYTa0U/BVZoMWD5t4Cod4PGd9D557IsNY5v4hUB9mc3lEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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

On Mon, Mar 02, 2026 at 12:10:07AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Adding mailbox communication layer for System Controller
>interaction. The mailbox interface enables sending commands and
>receiving responses from embedded System Controller.
>
>Key features:
>- Command/response protocol handling
>- Timeout and error management
>- Uses MKHI protocol headers defined in ABI
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
>v4: (Matt, Mike)
>- Refactor MMIO access to use domain-specific accessor
>- Add input validation and buffer overflow protection
>- Add bounds checking for multi-frame operations
>- Fix potential NULL pointer dereference
>
>v5: (Umesh, Riana)
>- Reset phase bit to 0 on error conditions
>- Refactor mailbox receive path
>- Updated xe_err messages for consistency
>
>v6: (Matt)
>- Use SYSCTRL_MB_CTRL_MKHI_CMD macro instead of FIELD_PREP
>
>v8 (Matt, Michal):
>- Reordered patches for logical flow
>- Static functions renamed with short prefix
>- Changed xe_sysctrl_send_command() function parameter from 'xe' to 'sc'
>- Added frame length validation and command overflow protection
>- Use REG_FIELD_PREP for hardware registers
>- Changed error format to %pe
>- Removed unnecessary NULL checks and explicit zeros
>- Fixed kernel-doc syntax
>---
> drivers/gpu/drm/xe/Makefile             |   1 +
> drivers/gpu/drm/xe/xe_sysctrl.c         |   2 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 364 ++++++++++++++++++++++++
> 3 files changed, 367 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 07e028fa50e8..1890bbd1b28d 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -123,6 +123,7 @@ xe-y += xe_bb.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
> 	xe_sysctrl.o \
>+	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>index 2751fe25a6ff..365f73ef680d 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -78,5 +78,7 @@ int xe_sysctrl_init(struct xe_device *xe)
> 	if (ret)
> 		return ret;
>
>+	xe_sysctrl_mailbox_init(sc);
>+
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..0e154b6dcdc7
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,364 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/cleanup.h>
>+#include <linux/container_of.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_mailbox_types.h"
>+#include "xe_sysctrl_types.h"
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr) \
>+	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr) \
>+	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr) \
>+	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr) \
>+	FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+static bool sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+				   unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool sysctrl_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+				 unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	ret = xe_mmio_wait32(sc->mmio, SYSCTRL_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int sysctrl_write_frame(struct xe_sysctrl *sc, const void *frame,
>+			       size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	memcpy(val, frame, len);
>+
>+	for (i = 0; i < dw; i++)
>+		xe_mmio_write32(sc->mmio, regs[i], val[i]);
>+
>+	return 0;
>+}
>+
>+static int sysctrl_read_frame(struct xe_sysctrl *sc, void *frame,
>+			      size_t len)
>+{
>+	static const struct xe_reg regs[] = {
>+		SYSCTRL_MB_DATA0, SYSCTRL_MB_DATA1, SYSCTRL_MB_DATA2, SYSCTRL_MB_DATA3
>+	};
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 val[XE_SYSCTRL_MB_FRAME_SIZE / sizeof(u32)] = {0};
>+	u32 dw = DIV_ROUND_UP(len, sizeof(u32));
>+	u32 i;
>+
>+	xe_assert(xe, len > 0 && len <= XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	for (i = 0; i < dw; i++)
>+		val[i] = xe_mmio_read32(sc->mmio, regs[i]);
>+
>+	memcpy(frame, val, len);
>+
>+	return 0;
>+}
>+
>+static void sysctrl_clear_response(struct xe_sysctrl *sc)
>+{
>+	xe_mmio_rmw32(sc->mmio, SYSCTRL_MB_CTRL, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, 0);
>+}
>+
>+static int sysctrl_prepare_command(struct xe_device *xe,
>+				   u8 group_id, u8 command,
>+				   const void *data_in, size_t data_in_len,
>+				   u8 **mbox_cmd, size_t *cmd_size)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+
>+	xe_assert(xe, command <= MKHI_HDR_COMMAND_MAX);
>+
>+	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*mkhi_hdr)) {
>+		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>+		return -EINVAL;
>+	}
>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				     FIELD_PREP(MKHI_HDR_COMMAND_MASK, command));
>+
>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*mbox_cmd = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int sysctrl_send_frames(struct xe_sysctrl *sc,
>+			       const u8 *mbox_cmd,
>+			       size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			sc->phase_bit = 0;
>+			return -EIO;
>+		}
>+
>+		ctrl_reg = SYSCTRL_MB_CTRL_RUN_BUSY |
>+			   REG_FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   REG_FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   SYSCTRL_MB_CTRL_MKHI_CMD |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>+
>+		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			sc->phase_bit = 0;
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>+				 size_t frame_size, unsigned int timeout_ms,
>+				 bool *done)
>+{
>+	u32 curr_frame, total_frames, ctrl_reg;
>+	struct xe_device *xe = sc_to_xe(sc);
>+	int ret;
>+
>+	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg);
>+	curr_frame = FIELD_GET(MKHI_FRAME_CURRENT_MASK, ctrl_reg);
>+
>+	ret = sysctrl_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	sysctrl_clear_response(sc);
>+
>+	if (curr_frame == total_frames)
>+		*done = true;
>+
>+	return 0;
>+}
>+
>+static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>+				  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req,
>+				  void *data_out, size_t data_out_len,
>+				  size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	struct xe_device *xe = sc_to_xe(sc);
>+	size_t remain = sizeof(*mkhi_hdr) + data_out_len;
>+

Extra line here ^ must be deleted.

>+	u8 *buffer __free(kfree) = kzalloc(remain, GFP_KERNEL);
>+	size_t frame_size;
>+	bool done = false;
>+	int ret = 0;
>+	u8 *out;
>+
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	out = buffer;
>+	while (!done && remain) {
>+		frame_size = min_t(size_t, remain, XE_SYSCTRL_MB_FRAME_SIZE);
>+
>+		ret = sysctrl_process_frame(sc, out, frame_size, timeout_ms,
>+					    &done);
>+		if (ret)
>+			return ret;
>+
>+		remain -= frame_size;
>+		out += frame_size;
>+	}
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(mkhi_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(mkhi_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req)) {
>+		xe_err(xe, "sysctrl: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr) != 0) {
>+		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(mkhi_hdr));
>+		return -EIO;
>+	}
>+
>+	memcpy(data_out, mkhi_hdr + 1, data_out_len);
>+	*rdata_len = out - buffer - sizeof(*mkhi_hdr);
>+
>+	return 0;
>+}
>+
>+static int sysctrl_send_command(struct xe_sysctrl *sc,
>+				const u8 *mbox_cmd, size_t cmd_size,
>+				void *data_out, size_t data_out_len,
>+				size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = sysctrl_send_frames(sc, mbox_cmd, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out || !rdata_len)
>+		return 0;
>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)mbox_cmd;
>+
>+	ret = sysctrl_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>+				     &received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	*rdata_len = received;
>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize System Controller mailbox interface
>+ * @sc: System controller structure
>+ *
>+ * Initialize system controller mailbox interface for communication.
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command() - Send command to System Controller via mailbox
>+ * @sc: System Controller instance
>+ * @cmd: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>+			    struct xe_sysctrl_mailbox_command *cmd,
>+			    size_t *rdata_len)
>+{
>+	struct xe_device *xe = sc_to_xe(sc);
>+	u8 group_id, command_code;
>+	u8 *mbox_cmd = NULL;
>+	size_t cmd_size = 0;
>+	int ret = 0;
>+
>+	xe_assert(xe, xe->info.has_sysctrl);
>+	xe_assert(xe, !cmd->data_in || cmd->data_in_len);
>+	xe_assert(xe, !cmd->data_out || cmd->data_out_len);

Is it possible for both data_in and data_out to the NULL? If not, then 
you at least need another assert.

	xe_assert(xe, cmd->data_in || cmd->data_out);

Umesh
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);
>+
>+	might_sleep();
>+
>+	ret = sysctrl_prepare_command(xe, group_id, command_code,
>+				      cmd->data_in, cmd->data_in_len,
>+				      &mbox_cmd, &cmd_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>+		return ret;
>+	}
>+
>+	guard(xe_pm_runtime)(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = sysctrl_send_command(sc, mbox_cmd, cmd_size,
>+				   cmd->data_out, cmd->data_out_len, rdata_len,
>+				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>+
>+	kfree(mbox_cmd);
>+
>+	return ret;
>+}
>-- 
>2.43.0
>
