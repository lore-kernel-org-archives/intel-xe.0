Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEEACA5FF0
	for <intel-xe@archiver.kernel.org>; Mon,  5 Oct 2026 08:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A56EE10E23F;
	Mon,  5 Oct 2026 08:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OaMgQpyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF9910E23F
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Oct 2026 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791190320; x=1822726320;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=5z7zv2YmxtpX5EjPB/0gbB4HySoXqKRnTmGf7HEq7YA=;
 b=OaMgQpyLngcDiUmlF/TcDtt1wjSvVsVyVLSHar8v0cwC3IRrU2Akr/by
 UzSvfHMaFZoRSK0ACzXCbVoXuYu5aU1HYW+DYt7o3kUxgomGWhewpoltX
 GuPtPxsPxpvfqS3DuvalKILto6sikxT3kaaHq2l+15cWNW0sOyhnhSCVF
 hdJrz2fqHUPAimRrtEwJ080v6lIZKTOsHUP3KIDLY06C0lgJZ04FA+RpV
 x1DfDXb3DR0KfgpfTZw5LwesmwZTGoD4ld9FBsJIGs9Nwk6cT6miX4PaY
 wIzFSEqvWKk5iPZAwTJfeYlWP3j035eAHokhFdfQr4iB4dh6Hypdaa0zg Q==;
X-CSE-ConnectionGUID: y55DmaEcRIiZzymHfoRviQ==
X-CSE-MsgGUID: lq6fld3USHG2Tl7lXi0eLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="94345040"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="94345040"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:51:59 -0700
X-CSE-ConnectionGUID: TkLehxv0SYKO8pGL9xGDZA==
X-CSE-MsgGUID: 5N558EG8QuqZNoRyAd/a5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="774068"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:52:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 5 Oct 2026 01:51:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 5 Oct 2026 01:51:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJw14N3RCsETVGJ1YknMxm665wrasTBSqw0r8IdGosYgAA5m8IG7hrJs4CqAeVo/1tlFpUeQrzqArePc4vuh/4m8w2gRi3C1/aJExnrwwu9BoAqEIOtPr1Bs/ga4mlsJSFCVDbf1yfbf8eCNFFBe4g4CknDBDjyXENWBx8vqu6k83RadcrdqCmxt1r4ZLVnNyJq69IViSQLYM5KTopjzmlPcm8s+c2EklKC6ob13sgRg62wnrSNe0ck2jVKn4R0kyBzctfFsiN+mXhiM+J4/ykZ9/6kbcd0OX3uPK9fYXWhf4dUT8MlcOb4O+CC255xLwcwLH4ydpTrdiY16FrJXoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKuQYkR+efFGfv4GtPuEdBbXxcPR42Sz0wI/wsO/QIE=;
 b=iio7ONiqQ3Zrr6L7meVlSjtPnFD7HV+VWyIJ3oOVGhDviHKvMESDSEbuqY0WbLpnMEUhDWHN1fZfYdmOEfgj87WZAFQJH9mcdcolD+tjoK+X39pY+rOnfKWmrBaxj8mmRtxMI2imecPlBsFDwuJ5TLHsRCCFwL+BYjb2cOXsqD11/+xjNQJh56map3KDnb90GID++GaDpVZt8Uo7EkEfaaMKpvver00etwBVBf/c0s1rMX2CKkbHc6mFmZ/r1ehPGJvXW8LbeyIe//pCDcC/XsFIIjCyAgzjj0UceqTtfYfw/HgdJwe1Dz/iQoIdLaMMhf41YTvoB0xqvU+ox28g7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Mon, 5 Oct
 2026 08:51:55 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%2]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 08:51:51 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: [PATCH v5 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
Date: Mon, 5 Oct 2026 10:51:29 +0200
Message-ID: <20261005085132.3720685-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
References: <20261005085132.3720685-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|DS0PR11MB7851:EE_
X-MS-Office365-Filtering-Correlation-Id: aa3b2cb5-7ea7-4a3c-65bc-08df22bde5ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|10067099003|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8F512+NqawS6rt/GuaeuhPqBBrIR579LBlUrWFuQTizrECagi6kkLLIRZa5pf5hamuPJnyWTGtTFYDrsKrvzjYj8tx4tiY2mxMQTO9mF8STqIlC4aQWu3V3t2OsjBLwe1rGubYIb0+uOwF5s3NfG6q4510l4i4gG28sJCNtZTD7riCHWsvBW5u5QeaP6SWbAjOE4J62sFHGce/a680J21KrWPia1wob7ZY47Gqz8AoP2Clreekypc/3UrFft5NzwORU6yAMNHj7pFfujLZSNQrYJMfuXrfCiA5dTZeZQwVp0jvZygQXAdlXJUYxYiBYfqE5+/gf4bWKZOttJTR2i63EDzCrOKsMBgr+1G0cLKPk3eWvcyuN5o3EyF/P2z2UUy71xl0zjDZexVlzhernAe0M1VQx2LXaKPSfB+AzOC92orM0wf3DexHWMzV7K68VopOIegWF9ipTOWl8mvghNcfg8RE53Vt1N9NlOj0AR5AmS/dAY1n1W5vYtVS2Zw8DKvJQNWe5U4aUlJY9Hu0w83ZsafqmKROhumUZudmVl8ZJBHAcPi2xslD+qZjo2xEziguzYmEiOJFHe/chaYsEv735FXzWcxkRxR8mDRVzBFNJ7LcyWvL1gsg+NidDUve8OC5LrJuwNU9gJ7IYdSViZqBQ7yg7vTl+9+IOAOp3yKQc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(10067099003)(5023799004)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxlQjdWaXIzaVowSkdNQWY2YnEyTmpIUjBoRmFKTVA4NFlyTTdIenVyeXdt?=
 =?utf-8?B?aTR1SHc0Ky95S2xYQlB4b0RtRHlseUREOUtUN1B4dVM2b3IxVTFPNjBKR0t6?=
 =?utf-8?B?RlVvRlRsanhJT1ZhV1Jkd3lsS3lmcHR6VGs5NVIyQnlCbUhFUmR4TmZnL1Er?=
 =?utf-8?B?Zi9lQ2VvYWVRWDYwVjFVcGl6OTNRRFdqdEVNcXB3RUlqYTk4SlYrbzM0a1dk?=
 =?utf-8?B?Q0tXdXhoL2xMbWVIOGl3QlZxNkRjU0l3c2hxV2NiSGpYeFpaL0Fva2svVTNl?=
 =?utf-8?B?Yy9EcTQzb21jeXl3Tm44REc1VlBWT1BWTmgwUlBWbVFKbjljNXUxaVBOcTRq?=
 =?utf-8?B?VkxqOXpxb21ZVkVMaHo0NkFWbWRXK2NibldWeFUyd1BvS0xidUp5VXJZengv?=
 =?utf-8?B?eitPTm5iYkRjUHQrRkY4cVoxTFM3dmhkam52WDFPeTN5a0I2R2tVZFpwYlcz?=
 =?utf-8?B?cUlFSElUbmFDZG54N2E3N2tRR1JLMnVSb3VSMXVCRXdYZllEYnZpYVFvNk1N?=
 =?utf-8?B?ZzJyNy80Y1BHdnBEeTdKYlhEZWtoSExwbG8zdnR6ZWNKS0dMWW9jRVB0MDY3?=
 =?utf-8?B?TzdWaFJ0UEw3SXNKVTVxbjcvczdtKzNkS0RjTkxFT0VIZDdRYVk4Nm9qRXZY?=
 =?utf-8?B?NjlCYzM0bCtPQVRlaWpFa1JPN2tyRk9zTGdLbHRZRk5yS0RmekxEU1dLSXdh?=
 =?utf-8?B?RERCRlpCOGhhRlFGRDFFTVRQZGlOeEI1Ujh1YzNRRGlyMVN4K3A5MW9BRVM5?=
 =?utf-8?B?UlUxR3kxMnQvMDdDanNYeHhTOWk2M2NFaU5SWjlzaElybWJvYVM5L0hWNVls?=
 =?utf-8?B?aGV0cE1mY25tSXBEdjYwYUwrTnMrSTkzSTdNd2ZRckxDNU8rSE0wUU9qRERk?=
 =?utf-8?B?QkN3WEtqMUFiNWkrd29wTzMwdFNuN0NlZS9hZUZ6dzNhN1BzUUZXOUxKYnBw?=
 =?utf-8?B?NTJLWXF4N3ZZNGV6RnlBM1c3dHJPQVl2OVRQZ2xzaVNxL0dQMnYyWHpMT0pa?=
 =?utf-8?B?SWZCRGlyV29OR2w1L2lIaXpxU1FmQ1lXMUFDWEQ3bE1VUGxQd0p1MFd3dWND?=
 =?utf-8?B?Y2JKY08yZGRsdHl3RW82RUdySnhqUDk1Q2NzYTVMV2ZWbTFwQWNlWFFEaG1F?=
 =?utf-8?B?dy9kU2s4Y0hVY2ZDQ3JqTUY4OU5OOENEU1pZUmJ1TCtmTFkrNENvSElVQnVI?=
 =?utf-8?B?WEpyc3g2VGlnNG5GaGNCMjdRTzVUU2s0YVllOUFSMHptS2lheTNSTDlHNnJ4?=
 =?utf-8?B?TG93OTMrem9TMldrUVFic2FzWXlyRVJMUWdRa3FzWHQvMmpJbG9hcndqaDhC?=
 =?utf-8?B?d0lDdFliaFltVnNUeDFHUWwxOTE4Vnd4R2hOeWo1L2NIWitQNkwrTFdwTkRP?=
 =?utf-8?B?QURvVjF1RUZNV3M0LzV5ejliSWg1Q0tpODQ5OEJoZU1vdmpzamNKWS9rNFhh?=
 =?utf-8?B?b3dhZ2FmU0NQc2kwYXpDVXpJQ2d4NXZCcjFCcE1SVjZWZ0pJWjdFdjlwRFdY?=
 =?utf-8?B?U1ZWRXZCS2hZYVZFNGJDUEJYNEZFaXVVaXorM3NOSHdVTVdCVTZYVStWQ3I1?=
 =?utf-8?B?TnhMT0RMYnVuUTErSXowaXlTSmhKbTVNQTgzTmRWVTFlWVhmT2NremhCNGNW?=
 =?utf-8?B?NmpCNTlXbVJUdVNQaXg3cEF4dlMwaG5vV2R6REh4aC9NVUV1ZW15WHdBRVcz?=
 =?utf-8?B?aldGZmhnRGZ6YWwyVFNXZ0ZIQVk1Q3Y4ZTlVODRFU3ZZdU0rbnNoa1pCdjRj?=
 =?utf-8?B?WEQ0anZlQzVRcXFsa0ZjdlZJRyszN2pBS0tWVk5ia21ybHhHaTFPRU5jQWta?=
 =?utf-8?B?TlpGQ3cwWTBhcENtdkNHTmFhWkNmcEw2WFFwejVGMStYb2RkRmUyL01nUG54?=
 =?utf-8?B?QjV1MkFsOUgzQnVsekJxNDdrNkVvRjVuVG95TlFBN0FIU2hBNGE2MkplWERP?=
 =?utf-8?B?MnJ5SDZEK0pTTHNOVnRYZ01OdEdIcXNlaFNsWm1qd0d5RWl4TUs5TkloRHo4?=
 =?utf-8?B?UEU3S2h6RjNPVVlIL1NQNlZkWSt2a1ZSQmNKMGovemtobGh4MUI0V0JHdHJh?=
 =?utf-8?B?R0NJSFp4YTRTVHoyVGpYRVF4VmVaeEhVeml1NU1RaXFYUTc3NDhvdEJpYjdS?=
 =?utf-8?B?eW5YZDRnVmtFRkpYdTJtMkd3U1NNYkJIOURsVVBJSlJIcG56M01mdmdSSyty?=
 =?utf-8?B?YzJlL0lKWTh5dWNTdk5EQjBYQzZkYlY4WlA5azVDaHluekJlb1N1YjN1eE9p?=
 =?utf-8?B?M05NNVFhZHhDZ3puUEYxU2dZK0p6LzlVSWlHaEs1Vi9aRTQvVlFmZUVjUEdS?=
 =?utf-8?B?WW9sNFpxTUJVYWNqVWVYbyswdmR5YnhuR2c2eXQwUUxpUnNCRGhGQ2pHOVl0?=
 =?utf-8?Q?e50yvtasoMr2XUes=3D?=
X-Exchange-RoutingPolicyChecked: MCeHWTWP216Parfnv7GAi/V0d9wOfhGu/MX6VKq5JEKt/HiqdkXeaqZIjqeIfRmHBcHezam9bkJqyOyLMlcLEigZSR02pzfUKnXJGMxj85Zv9cLDPJWNW3b8VSZCU3HlN/FOPfTQROhUHTd7a7Rp+0hrlYWqwLXCZLEAfjR3SL+sCJts61flqeb8OFYwLFcBPPgtgFyNe8MSxJNHaBy/EyiqNZDevzR9nR5hIU+/mqJecZh5WoGsy41MAjQF6CZTDcQ3QPmK/W7dpt7KLBFJb6wFQ3BFN0HyZk2RL5tMnxxxaQHWUeItKsGn8AKdcF6Tj95fe6Cw6uAx/MkpjmafLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3b2cb5-7ea7-4a3c-65bc-08df22bde5ba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 08:51:51.1891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nanuuB0YM6woWnla+JmoWRmq953AHnAbgM9DSa/aYfZG1FXzKuJ4QumztNTS5zgfm9UCgr4OFNL9wlEbHPyzelRlbdaWb+Mwq+OjZeVvLbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
    Drop redundant checks and asserts (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 443 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 405 insertions(+), 125 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
index ee30a1939eb0e..78d3de46b7572 100644
--- a/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
+++ b/drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c
@@ -24,8 +24,8 @@ static void bad_init(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_EXPECT_EQ(test, -EINVAL, xe_guc_id_mgr_init(idm, 0));
-	KUNIT_EXPECT_EQ(test, -ERANGE, xe_guc_id_mgr_init(idm, GUC_ID_MAX + 1));
+	KUNIT_EXPECT_EQ(test, -EINVAL, idm_init(idm, 0, 0));
+	KUNIT_EXPECT_EQ(test, -ERANGE, idm_init(idm, GUC_ID_MAX + 1, 0));
 }
 
 static void no_init(struct kunit *test)
@@ -43,12 +43,12 @@ static void init_fini(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 	KUNIT_EXPECT_NOT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, GUC_ID_MAX);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), GUC_ID_MAX);
 	__fini_idm(NULL, idm);
 	KUNIT_EXPECT_NULL(test, idm->bitmap);
-	KUNIT_EXPECT_EQ(test, idm->total, 0);
+	KUNIT_EXPECT_EQ(test, idm_total(idm), 0);
 }
 
 static void check_used(struct kunit *test)
@@ -56,19 +56,19 @@ static void check_used(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++) {
+	for (n = 0; n < idm_total(idm); n++) {
 		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm->used, n);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 0), 0);
-		KUNIT_EXPECT_EQ(test, idm->used, n + 1);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n);
+		KUNIT_EXPECT_GE(test, xe_guc_id_mgr_reserve_usable_locked(idm, 1), 0);
+		KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), n + 1);
 	}
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->used);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	idm_release_chunk_locked(idm, 0, idm_total(idm));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), 0);
 
 	mutex_unlock(idm_mutex(idm));
 }
@@ -76,25 +76,12 @@ static void check_used(struct kunit *test)
 static void check_quota(struct kunit *test)
 {
 	struct xe_guc_id_mgr *idm = test->priv;
-	unsigned int n;
-
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, 2));
 
-	mutex_lock(idm_mutex(idm));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, 2, 0));
 
-	for (n = 0; n < idm->total - 1; n++) {
-		kunit_info(test, "n=%u", n);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, 1, idm->total - n), -EDQUOT);
-		KUNIT_EXPECT_EQ(test, idm_reserve_chunk_locked(idm, idm->total - n, 1), -EDQUOT);
-		KUNIT_EXPECT_GE(test, idm_reserve_chunk_locked(idm, 1, 1), 0);
-	}
-	KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	idm_release_chunk_locked(idm, 0, idm->total);
-	KUNIT_EXPECT_EQ(test, idm->used, 0);
-
-	mutex_unlock(idm_mutex(idm));
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 2), 0);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_reserve_usable(idm, 1), -ENOSPC);
+	KUNIT_EXPECT_EQ(test, xe_guc_id_mgr_release_usable(idm, 0, 2), 0);
 }
 
 static void check_all(struct kunit *test)
@@ -102,14 +89,14 @@ static void check_all(struct kunit *test)
 	struct xe_guc_id_mgr *idm = test->priv;
 	unsigned int n;
 
-	KUNIT_ASSERT_EQ(test, 0, xe_guc_id_mgr_init(idm, -1));
+	KUNIT_ASSERT_EQ(test, 0, idm_init(idm, GUC_ID_MAX, 0));
 
 	mutex_lock(idm_mutex(idm));
 
-	for (n = 0; n < idm->total; n++)
-		KUNIT_EXPECT_LE(test, 0, idm_reserve_chunk_locked(idm, 1, 0));
-	KUNIT_EXPECT_EQ(test, idm->used, idm->total);
-	for (n = 0; n < idm->total; n++)
+	for (n = 0; n < idm_total(idm); n++)
+		KUNIT_EXPECT_LE(test, 0, xe_guc_id_mgr_reserve_usable_locked(idm, 1));
+	KUNIT_EXPECT_EQ(test, bitmap_weight(idm->bitmap, idm_total(idm)), idm_total(idm));
+	for (n = 0; n < idm_total(idm); n++)
 		idm_release_chunk_locked(idm, n, 1);
 
 	mutex_unlock(idm_mutex(idm));
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6947aeed458ed..de1ac58e31412 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1182,7 +1182,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
 	u32 spare = pf_get_spare_ctxs(gt);
-	u32 fair = (idm->total - spare) / num_vfs;
+	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
 	int ret;
 
 	for (; fair; --fair) {
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
index e845425d670be..8f90a5337fe4c 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -34,6 +34,34 @@ static struct xe_device *idm_to_xe(struct xe_guc_id_mgr *idm)
 
 static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
+static unsigned int idm_total(struct xe_guc_id_mgr *idm)
+{
+	if (idm->usable > GUC_ID_MAX - idm->shareable)
+		return GUC_ID_MAX;
+
+	return idm->usable + idm->shareable;
+}
+
+static unsigned int idm_shareable_start(struct xe_guc_id_mgr *idm)
+{
+	return idm_total(idm) - idm->shareable;
+}
+
+static unsigned int idm_used_usable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm->usable);
+}
+
+static unsigned int idm_used_shareable(struct xe_guc_id_mgr *idm)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	return bitmap_weight(idm->bitmap, idm_total(idm)) -
+	       bitmap_weight(idm->bitmap, idm_shareable_start(idm));
+}
+
 static void __fini_idm(struct drm_device *drm, void *arg)
 {
 	struct xe_guc_id_mgr *idm = arg;
@@ -41,25 +69,56 @@ static void __fini_idm(struct drm_device *drm, void *arg)
 	mutex_lock(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
-		unsigned int weight = bitmap_weight(idm->bitmap, idm->total);
+		unsigned int weight = bitmap_weight(idm->bitmap, idm_total(idm));
 
 		if (weight) {
 			struct drm_printer p = xe_gt_info_printer(idm_to_gt(idm));
 
 			xe_gt_err(idm_to_gt(idm), "GUC ID manager unclean (%u/%u)\n",
-				  weight, idm->total);
+				  weight, idm_total(idm));
 			idm_print_locked(idm, &p, 1);
 		}
 	}
 
 	bitmap_free(idm->bitmap);
 	idm->bitmap = NULL;
-	idm->total = 0;
-	idm->used = 0;
+	idm->usable = 0;
+	idm->shareable = 0;
 
 	mutex_unlock(idm_mutex(idm));
 }
 
+static int idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int shareable)
+{
+	bool overlap = usable > GUC_ID_MAX - shareable;
+	unsigned int total;
+	int ret;
+
+	if (!usable)
+		return -EINVAL;
+	if (usable > GUC_ID_MAX || shareable > GUC_ID_MAX)
+		return -ERANGE;
+
+	idm_assert(idm, !idm->bitmap);
+	idm_assert(idm, !shareable || IS_SRIOV_PF(idm_to_xe(idm)));
+	total = overlap ? GUC_ID_MAX : usable + shareable;
+
+	idm->bitmap = bitmap_zalloc(total, GFP_KERNEL);
+	if (!idm->bitmap)
+		return -ENOMEM;
+
+	idm->usable = usable;
+	idm->shareable = shareable;
+
+	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
+	if (ret)
+		return ret;
+
+	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s, %u GuC ID%s shareable with VFs\n",
+		  idm->usable, str_plural(idm->usable), idm->shareable, str_plural(idm->shareable));
+	return 0;
+}
+
 /**
  * xe_guc_id_mgr_init() - Initialize GuC context ID Manager.
  * @idm: the &xe_guc_id_mgr to initialize
@@ -68,90 +127,156 @@ static void __fini_idm(struct drm_device *drm, void *arg)
  * The bare-metal or PF driver can pass ~0 as &limit to indicate that all
  * context IDs supported by the GuC firmware are available for use.
  *
- * Only VF drivers will have to provide explicit number of context IDs
- * that they can use.
- *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit)
 {
-	int ret;
-
-	idm_assert(idm, !idm->bitmap);
-	idm_assert(idm, !idm->total);
-	idm_assert(idm, !idm->used);
-
 	if (limit == ~0)
 		limit = GUC_ID_MAX;
-	else if (limit > GUC_ID_MAX)
-		return -ERANGE;
-	else if (!limit)
-		return -EINVAL;
 
-	idm->bitmap = bitmap_zalloc(limit, GFP_KERNEL);
-	if (!idm->bitmap)
-		return -ENOMEM;
-	idm->total = limit;
+	return idm_init(idm, limit, 0);
+}
 
-	ret = drmm_add_action_or_reset(&idm_to_xe(idm)->drm, __fini_idm, idm);
-	if (ret)
-		return ret;
+/**
+ * xe_guc_id_mgr_max_usable() - Get maximum number of usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be used by @idm for GuC submission.
+ */
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm)
+{
+	return idm->usable;
+}
 
-	xe_gt_dbg(idm_to_gt(idm), "using %u GuC ID%s\n",
-		  idm->total, str_plural(idm->total));
-	return 0;
+/**
+ * xe_guc_id_mgr_max_shareable() - Get maximum number of shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr to query
+ *
+ * Return: maximum number of GuC context IDs that can be shared with VFs.
+ */
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm)
+{
+	return idm->shareable;
 }
 
-static unsigned int find_last_zero_area(unsigned long *bitmap,
-					unsigned int total,
-					unsigned int count)
+static int idm_reserve_chunk_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!idm->usable)
+		return -ENODATA;
+
+	id = bitmap_find_next_zero_area(idm->bitmap, idm->usable, 0, count, 0);
+	if (id >= idm->usable)
+		return -ENOSPC;
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static unsigned int idm_find_last_zero_area_in_range(unsigned long *bitmap,
+						     unsigned int range_start,
+						     unsigned int range_end,
+						     unsigned int count)
 {
-	unsigned int found = total;
-	unsigned int rs, re, range;
+	unsigned int found = range_end;
+	unsigned int rs, re;
+
+	for_each_clear_bitrange(rs, re, bitmap, range_end) {
+		unsigned int start = max(rs, range_start);
+		unsigned int end = min(re, range_end);
+		unsigned int range;
 
-	for_each_clear_bitrange(rs, re, bitmap, total) {
-		range = re - rs;
+		if (start >= end)
+			continue;
+
+		range = end - start;
 		if (range < count)
 			continue;
-		found = rs + (range - count);
+
+		found = start + (range - count);
 	}
+
 	return found;
 }
 
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm,
-				    unsigned int count, unsigned int retain)
+static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					      unsigned int spare)
 {
+	unsigned int shareable_start = idm_shareable_start(idm);
+	unsigned int total = idm_total(idm);
 	int id;
 
 	idm_assert(idm, count);
 	lockdep_assert_held(idm_mutex(idm));
 
-	if (!idm->total)
+	if (!idm->shareable)
 		return -ENODATA;
 
-	if (retain) {
+	if (shareable_start < idm->usable) {
 		/*
-		 * For IDs reservations (used on PF for VFs) we want to make
-		 * sure there will be at least 'retain' available for the PF
+		 * Spare is meaningful only for IDs that are shared between usable and
+		 * shareable pools. For non-overlapping pools, shareable reservations do
+		 * not reduce PF usable capacity, so there is nothing to retain.
 		 */
-		if (idm->used + count + retain > idm->total)
-			return -EDQUOT;
+		id = idm_find_last_zero_area_in_range(idm->bitmap, shareable_start, total, count);
+		if (id >= total)
+			return -ENOSPC;
+
 		/*
-		 * ... and we want to reserve highest IDs close to the end.
+		 * Only IDs taken from the overlapping part reduce PF usable capacity,
+		 * so a chunk located entirely in the VF-exclusive part is never limited
+		 * by the spare.
 		 */
-		id = find_last_zero_area(idm->bitmap, idm->total, count);
+		if (spare && id < idm->usable) {
+			unsigned int used_usable = bitmap_weight(idm->bitmap, idm->usable);
+			unsigned int need_overlap = min(id + count, idm->usable) - id;
+
+			if (used_usable + need_overlap + spare > idm->usable)
+				return -EDQUOT;
+		}
 	} else {
-		/*
-		 * For regular IDs reservations (used by submission code)
-		 * we start searching from the lower range of IDs.
-		 */
-		id = bitmap_find_next_zero_area(idm->bitmap, idm->total, 0, count, 0);
+		id = bitmap_find_next_zero_area(idm->bitmap, total, shareable_start, count, 0);
+		if (id + count > total)
+			return -ENOSPC;
+	}
+
+	bitmap_set(idm->bitmap, id, count);
+
+	return id;
+}
+
+static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int retain)
+{
+	unsigned int total = idm_total(idm);
+	int id;
+
+	idm_assert(idm, count);
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!total)
+		return -ENODATA;
+
+	if (retain) {
+		unsigned int used = bitmap_weight(idm->bitmap, total);
+
+		if (used + count + retain > total)
+			return -EDQUOT;
+
+		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
+	} else {
+		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
 	}
-	if (id >= idm->total)
+
+	if (id >= total)
 		return -ENOSPC;
 
 	bitmap_set(idm->bitmap, id, count);
-	idm->used += count;
 
 	return id;
 }
@@ -160,9 +285,8 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
 	idm_assert(idm, count);
-	idm_assert(idm, count <= idm->used);
-	idm_assert(idm, start < idm->total);
-	idm_assert(idm, start + count - 1 < idm->total);
+	idm_assert(idm, start < idm_total(idm));
+	idm_assert(idm, start + count - 1 < idm_total(idm));
 	lockdep_assert_held(idm_mutex(idm));
 
 	if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
@@ -172,22 +296,61 @@ static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 			idm_assert(idm, test_bit(start + n, idm->bitmap));
 	}
 	bitmap_clear(idm->bitmap, start, count);
-	idm->used -= count;
+}
+
+static int idm_release_chunk_in_range_locked(struct xe_guc_id_mgr *idm,
+					     unsigned int start,
+					     unsigned int count,
+					     unsigned int range_start,
+					     unsigned int range_end)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	if (!count)
+		return -EINVAL;
+
+	if (start < range_start || start >= range_end)
+		return -ERANGE;
+
+	if (count > range_end - start)
+		return -ERANGE;
+
+	idm_release_chunk_locked(idm, start, count);
+
+	return 0;
 }
 
 /**
- * xe_guc_id_mgr_reserve_locked() - Reserve one or more GuC context IDs.
+ * xe_guc_id_mgr_reserve_usable_locked() - Reserve one or more usable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of IDs to allocate (can't be 0)
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
  *
- * This function is dedicated for the use by the GuC submission code,
- * where submission lock is already taken.
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
  *
  * Return: ID of allocated GuC context or a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count)
 {
-	return idm_reserve_chunk_locked(idm, count, 0);
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable_locked() - Reserve one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous. The function expects that the
+ * caller has already taken the lock.
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare)
+{
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
 
 /**
@@ -206,60 +369,175 @@ void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id,
 }
 
 /**
- * xe_guc_id_mgr_reserve() - Reserve a range of GuC context IDs.
+ * xe_guc_id_mgr_release_usable_locked() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * This function is dedicated for use by the GuC submission code when the
+ * submission lock is already held.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count, 0, idm->usable);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable_locked() - Release one or more shareable GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @count: number of GuC context IDs to reserve (can't be 0)
- * @retain: number of GuC context IDs to keep available (can't be 0)
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
  *
- * This function is dedicated for the use by the PF driver which expects that
- * reserved range of IDs will be contiguous and that there will be at least
- * &retain IDs still available for the PF after this reservation.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count)
+{
+	return idm_release_chunk_in_range_locked(idm, id, count,
+						 idm_shareable_start(idm), idm_total(idm));
+}
+
+/**
+ * xe_guc_id_mgr_reserve_usable() - Reserve one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of usable GuC context IDs to reserve (can't be 0)
+ *
+ * Return: ID of allocated GuC context or a negative error code on failure.
+ */
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_usable_locked(idm, count);
+}
+
+/**
+ * xe_guc_id_mgr_reserve_shareable() - Reserve one or more shareable GuC context IDs for VFs.
+ * @idm: the &xe_guc_id_mgr
+ * @count: number of shareable GuC context IDs to reserve (can't be 0)
+ * @spare: number of usable IDs to keep available for the PF
+ *
+ * This function is dedicated for use by the PF driver, which expects the
+ * reserved range of IDs to be contiguous.
  *
  * Return: starting ID of the allocated GuC context ID range or
  *         a negative error code on failure.
  */
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm,
-			  unsigned int count, unsigned int retain)
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	idm_assert(idm, count);
+
+	return idm_reserve_chunk_shareable_locked(idm, count, spare);
+}
+
+int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
+{
+	return idm_reserve_chunk_locked(idm, count, 0);
+}
+
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
+			  unsigned int retain)
 {
 	int ret;
 
 	idm_assert(idm, count);
 	idm_assert(idm, retain);
 
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	ret = idm_reserve_chunk_locked(idm, count, retain);
-	mutex_unlock(idm_mutex(idm));
 
 	return ret;
 }
 
 /**
- * xe_guc_id_mgr_release() - Release a range of GuC context IDs.
+ * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &xe_guc_id_mgr
- * @start: the starting ID of GuC context range to release
+ * @start: the first GuC context ID to release
  * @count: number of GuC context IDs to release
  */
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm,
 			   unsigned int start, unsigned int count)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
+
 	idm_release_chunk_locked(idm, start, count);
-	mutex_unlock(idm_mutex(idm));
 }
 
-static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+/**
+ * xe_guc_id_mgr_release_usable() - Release one or more usable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first usable GuC context ID to release
+ * @count: number of usable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_usable_locked(idm, id, count);
+}
+
+/**
+ * xe_guc_id_mgr_release_shareable() - Release one or more shareable GuC context IDs.
+ * @idm: the &xe_guc_id_mgr
+ * @id: the first shareable GuC context ID to release
+ * @count: number of shareable GuC context IDs to release
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count)
+{
+	guard(mutex)(idm_mutex(idm));
+
+	return xe_guc_id_mgr_release_shareable_locked(idm, id, count);
+}
+
+static void idm_print_range_locked(struct xe_guc_id_mgr *idm,
+				   struct drm_printer *p,
+				   int indent,
+				   const char *name,
+				   unsigned int range_start,
+				   unsigned int range_end,
+				   unsigned int used)
 {
 	unsigned int rs, re;
 
 	lockdep_assert_held(idm_mutex(idm));
 
-	drm_printf_indent(p, indent, "total %u\n", idm->total);
+	drm_printf_indent(p, indent, "%s used %u\n", name, used);
+	for_each_set_bitrange(rs, re, idm->bitmap, range_end) {
+		rs = max(rs, range_start);
+		re = min(re, range_end);
+
+		if (rs < re)
+			drm_printf_indent(p, indent, "%s range %u..%u (%u)\n",
+					  name, rs, re - 1, re - rs);
+	}
+}
+
+static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
+{
+	lockdep_assert_held(idm_mutex(idm));
+
+	drm_printf_indent(p, indent, "total %u\n", idm_total(idm));
 	if (!idm->bitmap)
 		return;
 
-	drm_printf_indent(p, indent, "used %u\n", idm->used);
-	for_each_set_bitrange(rs, re, idm->bitmap, idm->total)
-		drm_printf_indent(p, indent, "range %u..%u (%u)\n", rs, re - 1, re - rs);
+	idm_print_range_locked(idm, p, indent, "usable", 0, idm->usable,
+			       idm_used_usable(idm));
+	idm_print_range_locked(idm, p, indent, "shareable",
+			       idm_shareable_start(idm), idm_total(idm),
+			       idm_used_shareable(idm));
 }
 
 /**
@@ -270,9 +548,8 @@ static void idm_print_locked(struct xe_guc_id_mgr *idm, struct drm_printer *p, i
  */
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent)
 {
-	mutex_lock(idm_mutex(idm));
+	guard(mutex)(idm_mutex(idm));
 	idm_print_locked(idm, p, indent);
-	mutex_unlock(idm_mutex(idm));
 }
 
 #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
index 368f8c80e4c7d..209f99831f1b4 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -9,13 +9,29 @@
 struct drm_printer;
 struct xe_guc_id_mgr;
 
-int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_init(struct xe_guc_id_mgr *idm, unsigned int limit);
 
+unsigned int xe_guc_id_mgr_max_usable(struct xe_guc_id_mgr *idm);
+unsigned int xe_guc_id_mgr_max_shareable(struct xe_guc_id_mgr *idm);
+
+int xe_guc_id_mgr_reserve_usable_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_usable(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int count,
+					   unsigned int spare);
+int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
+				    unsigned int spare);
 int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
+int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					unsigned int count);
+int xe_guc_id_mgr_release_shareable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
+					   unsigned int count);
 
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
 void xe_guc_id_mgr_release(struct xe_guc_id_mgr *idm, unsigned int start, unsigned int count);
+int xe_guc_id_mgr_release_usable(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
+int xe_guc_id_mgr_release_shareable(struct xe_guc_id_mgr *idm, unsigned int id,
+				    unsigned int count);
 
 void xe_guc_id_mgr_print(struct xe_guc_id_mgr *idm, struct drm_printer *p, int indent);
 
diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
index 3dbcb1331690e..6da43691e54c5 100644
--- a/drivers/gpu/drm/xe/xe_guc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_types.h
@@ -42,10 +42,10 @@ struct xe_guc_db_mgr {
 struct xe_guc_id_mgr {
 	/** @bitmap: bitmap to track allocated IDs */
 	unsigned long *bitmap;
-	/** @total: total number of IDs being managed */
-	unsigned int total;
-	/** @used: number of IDs currently in use */
-	unsigned int used;
+	/** @usable: number of IDs being managed for GuC submission */
+	unsigned int usable;
+	/** @shareable: number of IDs that can be shared with VFs */
+	unsigned int shareable;
 };
 
 /**
-- 
2.34.1

