Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16D0EA4FCF
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 15:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F03110E3CC;
	Mon, 23 Feb 2026 15:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kny2jy5Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3944510E244
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771859134; x=1803395134;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=JmnrdPaWqzHphHyHMMKKaRUT8KUmdjxh7+pEIg+WL6A=;
 b=kny2jy5ZAmgQ8klCRKakfOS08mnfi1gG8+QO8qCqIvcbuY+zFBveTf+c
 R8XMIbfMAFFh/AW3WZE/EUCVZ5YuzktJgkeBbuvh8dwWU+JU4+FHQPNuB
 EV9KXramc9mZonD44dY5E7FXSft+J9A7JJ/q6ngmJyHkzEffkb87JM0ua
 WP//R8xynETzTQX1nFqXSKgYSw6B03lFsFD9P114H3N9G4C56TVS8EWIz
 yYdU9D7GIQwI0yN4vPDJ0e+t1rHUf9mh8SKdDPzuOXGltDMbPtTbyyIpN
 9A2fy6tQobX0Nd644RVw7cymctXgsr/+DmtzIUa/g9B4rVS2UuPeF6Eiw Q==;
X-CSE-ConnectionGUID: hww1/yzrRzy1sua/Dq5nmA==
X-CSE-MsgGUID: kcRERBKiTJyY+qHmh0CiTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72956268"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72956268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:05:09 -0800
X-CSE-ConnectionGUID: E5Yb2Dz9TqO0absaVFtHzQ==
X-CSE-MsgGUID: /S/ufjl0T0izeK7GWeR8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215607845"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 07:05:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:05:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 07:05:07 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 07:05:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sY17LNMqUoQcCbJC/Cx/Q1yLUDy+VD5aSLZMUPt8YZ1k2y/eLj28pu4MwN/i7LRPMZXqO1gHOtPg8lbNESFX2Zcjytr+3+tvog5aDyDsKyY8qww5VqzXmpgeIil8d7lTsmYPVVLvr05dUf0XCIWr8pRm3WbfGrUHkUYxK56vSZRJjIMP7BnTJieCRbde7bIdtAFw9hDYBQSV7x048bv07x5+eoTVjXXZcQQxs7eWUBfMPdIJqWOI08rgdMJiSWsY4WoRgpXqEhIA4noSVaiB+w3jbLPyjGRmWwNWsCStJlkY7InHWoZX6370ayvEGaC/9/Nw7n2xOsrjROzCvjD+Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rc/g90lPPOs/ZY0z/aKLiUHPaO5ZzRcnx7kb2NpOYR0=;
 b=zNN/YBXLovTd598R8g4+3B/ycCyoFgiCh8MpHu2fRyXL5J5sUyJai0Z5beX00/6xEyFfDNoUNaatRqXHn3o1h5Nk26FAifS1GxxHIJEsscBjjRUt2Rd8dx6La8f6Hm/bBqAHdx+qffW26tJAT1XL/3l7y8FDJA32lkV0KrBAIzxS929xVE1sLsqpjrx9ILD1ZB/3fU3NVqJUwGXVmmM50aytIlFcH8kphLVZGPn0JaeXGW/w5ZH94WRt5JvgVl5zRWnWq2UnttOmdKSy3W+Pgb8HG2hcxRrS/U0FMyr5SExR5yxZgZu7LP99NIwkeFdFnBd8WRdQ5rjl95snuyP6Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 15:05:02 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 15:05:02 +0000
Date: Mon, 23 Feb 2026 20:34:56 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 12/23] drm/xe: Consolidate workaround entries for
 Wa_16021639441
Message-ID: <aZxsmENJSRGJ0BFD@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-12-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-12-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: 03128736-2300-4e8a-c7db-08de72eceb7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkplMjJ6LzFtd2xKN2NSa1gyc1ZRL2xhZkdZODg2OTlpNmY2QXFsMTFET2lm?=
 =?utf-8?B?TDRkaEVnQkZ2a2FENmczcW8yL2RVeW81MUdMRm5nckFVcjNGZ0JRV3c2Y3FM?=
 =?utf-8?B?OXYvU1hGV1NaYjRsejlRb0hoT1UxbWVHVFAzM3l1ZlhrWnFiY2NjSjVnVlla?=
 =?utf-8?B?cWNIQlJ3L0RDVEdjeFlLQWJjWGlkaThSSUluWGlSeXpKR25oWDl6aWpqYjFJ?=
 =?utf-8?B?amFYUURXUzRrd1ZMTFI5czcwN2pLRTZuWmpmdEV0VHNpSzA2dE4wUUxWTFlu?=
 =?utf-8?B?NnNMcURBQTlWdE1IdVB4b3AxTC8rZXA3aHV5eGN4NVBibm1ibytObE9TYy9i?=
 =?utf-8?B?V0hZMDZlU1pMeGNEM0ppbVd3d3hwYm5SeFF2ZE8wMUE1SjhUTkY1REIycWYz?=
 =?utf-8?B?MXRORnZmcUMzN3ZEY0xubFl3RnRpNTAwZjhaMGo0ZDVTUjNEOHRzVjZNcTdZ?=
 =?utf-8?B?NE5rZEgwakdrc25NZWFjeWZnOXdMTkw4dmxwK1dqSGE5WFlRelNTL256bmZO?=
 =?utf-8?B?VXpZeDg4R2VkcnhUUk5YamNqdnUxNVUyK3ExZExld0hOM3h5bzRQTzNVV3o0?=
 =?utf-8?B?Vm8wYnVwUm9JTlRNeDAxRnU3WktXaEVyWHRLZm9IM0JpQUc3d0EweDNVNXgz?=
 =?utf-8?B?bFJCSEVhNXg4WjB1b2hLQjRnL3RXYjV3cUx6bXJDUEVDeU5PWXBBc1hUVVhH?=
 =?utf-8?B?c3J2T3pVZG40K1BGWWJjZ25KR1MxKzZRcXZ6NDJNcWNVUHpTRnljeEUxWGZa?=
 =?utf-8?B?cW8raXplcmNYK0JBZjUyRk5XV0ZIaFpZekE4U3lKUXF4STA5VTgyMHZVL2Zr?=
 =?utf-8?B?bVRJWnUzeERYM2VlRFNNeHlOVE43eDRGcXlVV2JRYk5hdGdlaXlKeGdmcmZh?=
 =?utf-8?B?Ryt0RU9jODR6ZWJHZ2FicVBrRlBtbVNsMzVsQUovV25pTlBQejc5dllsczNT?=
 =?utf-8?B?MllSUlN6Rk0rL0FYa2ExTHlPeEhOWVRkOWllVlpUNXg5aTNqM05NSmwyR1dW?=
 =?utf-8?B?UVRJYmJBMFpsOGtra1dSc1JRUDRUVWhRemVOOWp2TEhEZnYwTHNncFAwb1k1?=
 =?utf-8?B?bEs4eFl4RkxBQk9CZXQxNmtyRUl3SEpCeTBValE0N204V1BicUZUR2J0d1U3?=
 =?utf-8?B?cmdaWDZOdmZKSkNYV3hWYjArYlBoWnNNdnJaM2xKS1MxRWVtWVl5OHNIRUJ2?=
 =?utf-8?B?ZzFyYVVITDJQSG5sRXhOUzd5OENhUE43TmRBTXhTaGFrK1RIU01UZHFnb3pm?=
 =?utf-8?B?N1UxMk9mcndqTUdaSG45dVV3aU5icEtPZWZiQ2txWjJOVnpFcTMvSjFzL0lt?=
 =?utf-8?B?M002U1FPcndsVndNWTA3S0diSkE5WCtWbGpicnN6YVAzQWp6TWFoYUFDWXEw?=
 =?utf-8?B?VkdybGRSMzRjdjc3aEdGckxUaTVUckYwZmpnQlk2WXpRQzVwL0NVOTRVdkNk?=
 =?utf-8?B?UUk5eWNWT2d0Nm5ob1hwcktMRjE2aEloUWpXOVpQNjlFRUkzWnB5K1RQTndN?=
 =?utf-8?B?bnN6RW5kZFFpblROdHhrVllNUmQyVWxNMHBqVmRaa0lSQjI5TXRZT0lybmZG?=
 =?utf-8?B?aWs1blRnOW16YmtKTVlnbHBNNDlWUi9Cc2FNcXpMTXB0Wlc3NDN0NG5zSjR2?=
 =?utf-8?B?bnhSQW05VXVWZzlKNFRQRTlVZEhpMzFMK3NwbWFMbVVwdzA5SU1qaEpIbU8y?=
 =?utf-8?B?S2kzTVViamhaT3I4cEJ4cTN2Q0ZGb3ZVUzN3SFV5MVlVeEQ0V1F6YVczZnR1?=
 =?utf-8?B?andtblgvRVEveG1aY2lmU3dIcnYxL2pkaGo1aG5oRWJFSXNiZWE5d1hSN1RV?=
 =?utf-8?B?QytYa2U1MmJwSTJHV20vMmt3cGdXdnZ4OHJZTFQwcHR5OWNxdURhZE1YM2pz?=
 =?utf-8?B?S2xTVzVYSWhtZUVtbTBMNjhJdUw0SDNBOU96N2kzTmdmUnlzaU9zSUJqS3FY?=
 =?utf-8?B?dW4xWkp1RkVNdXJzamhuQlZJdndDcVlaKzNRand6dVZJRFF6TU52VW9UeXls?=
 =?utf-8?B?VHVwNEdMTjNwVi9OSHZtclIyQlFVZmdQR0JyRmpBczEyTFRsUy94S1MwTmVP?=
 =?utf-8?B?OXdyRU9IaEN4TkJabnRTRFRXb0t2WWhZRXhCbytKYXZ5ZDlmWGQ3RnpoVG9i?=
 =?utf-8?Q?+/2c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFRhOUFIMzRKdVNXU1VrN2xEQ3Z4cldhT0h1UHJXek41K3ZYdWpDMmN0bWdl?=
 =?utf-8?B?N0RGTUFMMExmN3IyV29VYW9hZ2tmUXFYTjA1VHNaQnp1Y0tQSUVXS0o4VTlq?=
 =?utf-8?B?Y3U1MXVNVFVSUS9ZcUt6azlaMDBBSTdMWEwrTzdzMlV5YlYzVVY4NC9UNTRn?=
 =?utf-8?B?MUo4dVBpOWc5K3hGZGJMcXo0SW53TVd2b1JaK2VQaENhK0xJTHhyTFI1QnVJ?=
 =?utf-8?B?eDJ0TjU3MlhNYWRaYnBiR0xLVVhXM01wL3krN0paMVNqRU9PRlVieFEwWnd3?=
 =?utf-8?B?ZG13eGNoSHA5NURzNXA4bU5PNzNyUXg5UzA2Y3VMS1NHVVExS0dMM3JuTG4w?=
 =?utf-8?B?Y09XVzlOaHdRRC9uQjg2OUdsYlkxNDdjMHJDNW0rQmMxblR2dXZFcWlKeVdt?=
 =?utf-8?B?a2VxU3d2dHdvTVlTMDd6ajdZb1UxT2JtT0ltV2xXKzRRMzF4SjRIUE81RXZ0?=
 =?utf-8?B?bEUraC9JdzZwdmFMaXZlWlZndWtBUWVHeWdJQ0Nwc2VIeVNqb20zb1ltNkU2?=
 =?utf-8?B?NFNxZ240b0hiUjlPTGpNRUY2bFRja2JmSGR2NWpCVUh3bzFuVzJlRlR1SEll?=
 =?utf-8?B?RHNZYUdJNWh2RGx6UW0ramJkVjBvak1qc0V0UUxvSlZRMjVGWE85SUhFcmlQ?=
 =?utf-8?B?bEMvbjd5MTFLeEV5VnJndmpUMnVvdUhYQjVxVy9YZmE3c1FjQm9ZeGFaVjVB?=
 =?utf-8?B?RWxGcmRBZ3JmUFIvREtXMmJuWjRwVVRRaTRITEN4VDR1WktTK2tDM0RTdWF2?=
 =?utf-8?B?OHlYV0RSb2dBdno5QjVSTjZzZ0RiNWcycCtoTnREVXNya3hUU2JlQ0NlYmJ5?=
 =?utf-8?B?Sk9jZlMwZzZlcXl5WStiVytHaWxrbnE4bmZpOEhidDBrdWExRWYyN1YrUFda?=
 =?utf-8?B?bzF0MEdYNWw0bHJDd0FObUJ3cWtrL2xhNjJMa3RnMFFYWDlVYTRXQTEvT3lm?=
 =?utf-8?B?SkxzSnNkUUlWZk1JM3A3N2pHV01FOGthbnYwNXNoR2Q1QzNNYzlQNlhzRm5i?=
 =?utf-8?B?QnFJb0IyWWpnajlVWExBeGlCU2JGd2ZCcHp0VTN5SktreHo0VDY0MUNsKy96?=
 =?utf-8?B?Y2haTW8rSlNOU2FZSFNYeEIzK2dUY3pVQW82R0ZmVzdkZ2ZEaER6d0xTb3dE?=
 =?utf-8?B?NFdsQ1l0Y0xhMUQ0QUpWOGtCWFltVzJBRVFyYWYyeVVmeG5jUHRHclpkNVdj?=
 =?utf-8?B?cGhFMnBHU1Z4Nis2THdmQjJMV3NSY0xDOHBtZ1Q1TVRpK0lWME96SHJaQVBo?=
 =?utf-8?B?VGhFai9PY2cvdEVNSjRzWDcraWJ0NHVjL2VOeDlWN1RZbUM1cWlxR1g1WTlH?=
 =?utf-8?B?VzBKMEllZVIyL2FuWDkvNWNGejBaUXVRMVdOZ2hMMTJrLzFVVHBTSVdWeTll?=
 =?utf-8?B?QUpwWlIwYmFRZ2RndCtsK1hLVUVRYm81L05RMy9EbUVsYXZWZWdhbDJQTm1m?=
 =?utf-8?B?cW5OOUJpbWpKNWVqNFdqMmE2UzhKay9MVVNzLzBMdDB2R29aNWZIa0l2YnFH?=
 =?utf-8?B?WVcxNE4zVUpLSDB3ejB6cXhyM3l4RkJwRlNpelhneElQWEl5V1Z5U21Od0JW?=
 =?utf-8?B?RVFiOVBTT2o2ZmoxS2YzYmhrN0hDMktHcy9YbzhLMEFGMmdiemw0WGdYaldS?=
 =?utf-8?B?cjNkT2tNaHIyVE8vWUN0eTM3eCtTWGNhR1crVHVLWmIzS1psTEZ0K0ZYSW42?=
 =?utf-8?B?NkNiU2Y3VjVEKzN4aTgwbWhoVmhsQjRxa0xlRGQ0ZGYyUUNzWExmYm5sYks1?=
 =?utf-8?B?ZHZ3SFR4STBjdkV4aWVoSEQ4ZnN3RnhJRHJmNmlHNjBkY2hHVEVYTDBZMDJr?=
 =?utf-8?B?RXNwN1lGcVJTMHVpZGNPYjFyRkVxZDNrUDlvb1JTWUEwMHEzQzcxdi92K0JY?=
 =?utf-8?B?MG55WW9LbWg2TkwxelNPc2FnVGdieUpzR21UVWVpb1RzZjI3WXN5Wm5EZlc5?=
 =?utf-8?B?MnpqSkVBVERacmZOME9MVFlsVTBiak5uUnFXMGhscW5KaUl3QXJlN2VTdzEr?=
 =?utf-8?B?SmZUMDYvY3FINEg1L2ZXWUlZMWMxR3Z1b0wrejQxVUpFTDNyWGVNZ0pBcGVt?=
 =?utf-8?B?ay9ueHhsNnNFdi80cW5GZW5jWmxYNGtPbW45azJVMnkzS3V3eWNlSXBqeUx2?=
 =?utf-8?B?SHhub1FWL0tLMXh5NCtYVHF1Z2xwcW9iYnlVRWFxN3hhckNkL1dOWk9tbWZ0?=
 =?utf-8?B?Q3J5Z2dJMk1qUnl4SUdHc2diaVdDUk1RVC9oV0lMcWZpTWNPbUtYWnZORU5Y?=
 =?utf-8?B?NDRZMHFQU21QUEVSbU5ZRUZrZE9oRHhmalB0cENrNzY5ZXlaZm9Zb0hMZHNk?=
 =?utf-8?B?WlNMeGZtc0tsTFhhQ1JFblF3NFBEZFN4Zlp2aUFWdU9KTWVOM0JNVG5td3U0?=
 =?utf-8?Q?1lbouERIonMbId2gfNX/+18/O4W5VGbKT+pJi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03128736-2300-4e8a-c7db-08de72eceb7c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 15:05:02.5737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PwYhF0k8Eo3jKF3VQLh3LG/EFJB2xmPP7hvEuKegylbD3cjgPhA99KhYQ5caMkynqFiImBF/v+uZqE9cdmWQjsP01f3Q5FVJMrZ2r6Rse+MDvAA3rim9Wt9e6VbEekbH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_16021639441 applies to all graphics versions from 20.01 through 20.04
> (inclusive) and all media versions from 13.01 to 20.00 (inclusive).
> Consolidate the RTP entries into a single range-based entry.
> Also drop the reference to Wa_18032095049 which was only relevant to
> pre-production platforms that we no longer support.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 59 ++++++++++------------------------------------
>  1 file changed, 13 insertions(+), 46 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala 

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 9119ca9ba1031d9180b44c13a702e1bb04fd0ca6..f0c42be062146837e6ba40621af54fcafa34f8e8 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -363,6 +363,19 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE_CONTROL))
>  	},
> +	/*
> +	 * Although this workaround isn't required for the RCS, disabling these
> +	 * reports has no impact for our driver or the GuC, so we go ahead and
> +	 * apply this to all engines for simplicity.
> +	 */
> +	{ XE_RTP_NAME("16021639441"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), OR,
> +		       MEDIA_VERSION_RANGE(1301, 2000)),
> +	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> +			     GHWSP_CSB_REPORT_DIS |
> +			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> +			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> +	},
>  
>  	/* TGL */
>  
> @@ -505,20 +518,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
>  	},
> -	/*
> -	 * These two workarounds are the same, just applying to different
> -	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
> -	 * all steppings, disabling these reports has no impact for our
> -	 * driver or the GuC, so we go ahead and treat it the same as
> -	 * Wa_16021639441 which does apply to all steppings.
> -	 */
> -	{ XE_RTP_NAME("18032095049, 16021639441"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
> -	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> -			     GHWSP_CSB_REPORT_DIS |
> -			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> -			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -	},
>  	{ XE_RTP_NAME("16018610683"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
> @@ -546,18 +545,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> -	/*
> -	 * Although this workaround isn't required for the RCS, disabling these
> -	 * reports has no impact for our driver or the GuC, so we go ahead and
> -	 * apply this to all engines for simplicity.
> -	 */
> -	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
> -	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> -			     GHWSP_CSB_REPORT_DIS |
> -			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> -			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -	},
>  	{ XE_RTP_NAME("14019811474"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> @@ -584,26 +571,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
>  	},
>  
> -	/* Xe2_LPM */
> -
> -	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> -	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> -			     GHWSP_CSB_REPORT_DIS |
> -			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> -			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -	},
> -
> -	/* Xe2_HPM */
> -
> -	{ XE_RTP_NAME("16021639441"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> -	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
> -			     GHWSP_CSB_REPORT_DIS |
> -			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
> -			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> -	},
> -
>  	/* Xe3_LPG */
>  
>  	{ XE_RTP_NAME("14021402888"),
> 
> -- 
> 2.53.0
> 
