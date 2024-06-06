Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C96C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 11:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5513510E902;
	Thu,  6 Jun 2024 11:49:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f/Jg9JMa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C12710E902
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717674587; x=1749210587;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w8zH9nsQeitbSthqD0I9F5VNYX/LCz57MTwiZdxucV4=;
 b=f/Jg9JMaQKjS0ovsd9FtTUHqxfqgJZ/3f4tkrgEZpucI+crM2pZPKwUb
 nae2hkT5o3fg8J+ryOFBzS5rx0UL1/RhEoLWm6bxxb6XfgN9aE/0wWaH2
 63HcI6bm3ao7rdDlz+Ksa3iZR2f8oyKouUn0+tMTHwmTVY9kyzmYKX3PO
 hU3VWhDVovUxY3uX47PEohvfXUJc8c14UqIyKp8dG/LWZxDc7tOsYWUde
 SixGLzpvWtC2LoKWSdPGi3rsmr1vX1WddbVajXoJw/oflkHB5g/WHICNm
 myJq3qbaxkR64z16ojvR/ux+qOeFYMrTbQ1Ko2tz1WJH97aIBTDn/kX4j A==;
X-CSE-ConnectionGUID: 3rV4EjQiSUSXr+JlUQkfsw==
X-CSE-MsgGUID: SQ9O86BtSKyUMS6W/uyplg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="17269802"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="17269802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 04:49:46 -0700
X-CSE-ConnectionGUID: x3OSE+QFRdmZdMSpfY8DKw==
X-CSE-MsgGUID: YWT8v0CJSRShZD+yAmFUGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="61129281"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 04:49:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 04:49:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 04:49:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 04:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZtnRLtdqsXJvk+tO9KE/sA6lINBgingGbMuDqxal4b3+gvrSR8jwUYL7+A83gvcXEBLCP6MBbwJnTwoUNXcKBOkfqSmbYTjHGqAnDRJDmpQSNl2LsiCjlwCkLxsMesopUukFd+Wp7TdQ8XL0qZ5MD8YFk0qhszdOO2ICpaJLpRui7+NLhlW3+DsPIqZojM1or/fWbecLu6h09WSNnrhwTQBFd32YX9R0SFU8dv3/5Gtp9JsKQFZiHWrv04EpRIro3wELOcKrBKRmFpywbBBPDQvBFAkrFaWjC8kfveoF3VS2LxUbjVTddkJCTkjx75rLcewgHWqK7FotRdnjeOrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tA1MCL0sPmX7f3wCN8cbArH3B+BJwsKSrOsc7/FVSAc=;
 b=BGRrH+dyP1oMEKzWeFa69S0OGFTAtmrH3UZjI373DWTE2urQsNO3h064Io+a8YFHAkQMWti1WK/B6e1d7C9tVSP42OyrjAV1c12jpwDdTQSYTWW4DNcLQiAt1h423OPiN5lranEPcN6dfQ64J1UkByzvX2T1htpN1wkiAN2ZoRf3mkCrzdf7oX8H7sNa8K2oxPEx89RtHZswTVmYVthXubbNla+Ji7dIAphq+ps2yMr90Oibfvsbxqub5p14Sc1aM8WlB42dAR6+b0Pvj4h7tG7V2tf05nHMNeTvPdLmWlSEFog9fubxtlx5jYEet1ExNTClHZmxdxrkNN9E0vb2Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 11:49:42 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7633.018; Thu, 6 Jun 2024
 11:49:42 +0000
Date: Thu, 6 Jun 2024 13:49:40 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/4] drm/xe/vf: Custom GT restart
Message-ID: <20240606114940.urvk67oi2fmro6ae@intel.com>
References: <20240604212231.1416-1-michal.wajdeczko@intel.com>
 <20240604212231.1416-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240604212231.1416-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MI2P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA0PR11MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: 197e99af-80d6-4452-ee10-08dc861ec119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1Btb1kvZmhpUnNXS0lxaTEvbDRDTDE5OFdEZ2xVNkhDTk1JUkI4VzgwcFJO?=
 =?utf-8?B?RlRXZzRsNDYxSEYxNDZzanBBeDFzRUw5RHVtYk9uRUJhWDBudDJhY3FqdldO?=
 =?utf-8?B?SXM5aFdjMW8zdDVDNVNiVDFHd0JVK0VxQ1JVUkUzRVg3ZFFBc29oVDExK3RX?=
 =?utf-8?B?Y1VjSnlTOFQ1QkVZNGlXaDhCRVNNbDVweGtlK2xEdXgxZXBYK2cxQ2lvNjFF?=
 =?utf-8?B?R2JXMVhSTzA3aUpENWVscUc0Zkc4UjVKUHdVaDRGM1c2ME9NTlQxV2NNbTdw?=
 =?utf-8?B?KzM5VGdPZkZoOGpRNFdNdUd3d0V3TEVUZGpQOVNwRVdPVlBWdFMwNE1lTExM?=
 =?utf-8?B?V01FcS8vR3h0Qi9vb0R2SVpLamh1RExRMVNMRk0xVHUrWjRDenV6MFVkZVVT?=
 =?utf-8?B?RGhKdEU3OHhQZWFmb0hLRGFmZ1FSRzFXUmNjd0M3eHFwdlpORVVZOERlaTNT?=
 =?utf-8?B?cmIyYkxaZzFBTnE4ODhoMHZaMWJ0ZEVudjlSNXNrNTF6NHQ5N2ZCTjh4S21K?=
 =?utf-8?B?WjUwUHprTHZvdXUyT1Z4VGR1WmJlSytjdHN6djlqR2tuUXo0VzU2czlVcmVu?=
 =?utf-8?B?Myt0MUJQYnNYRmVnUVdaVzIvWkZ6bkpXY2MzMWMrREFTbDNXTjBYcWhGUlhm?=
 =?utf-8?B?b0JVS29oOUZmVG9TNUZPelc5K2c4SHZBNUNRaklBUk9qZHpjWUo5UDlGRVJ2?=
 =?utf-8?B?YjRWR3NTcHl3aXU2VmxJczV5V2VSVjhCbi9xMS95MUg4bDBaak9tV1UzUWFX?=
 =?utf-8?B?ckNvcjcvRVV1NDcxSGEySFAwZ1k0cGpTQjBCcnFQM0grYW9vdW1jQk5TZUNs?=
 =?utf-8?B?aWNveGtwdmhDUnk5TEh6NDZvejNYdTZjYjJuZVk4dyt4Z1VEa0J3SVJOYytP?=
 =?utf-8?B?WFRmeXRLaDVPbjNKOFhLeEx4ejJid2Mvc0tvL2VZQ25UMzVrZTQ0RUNYUVc2?=
 =?utf-8?B?WVhUTTF2V0JwZzZnM0pjR2l3WjZiTklUTVVvRnh0MWF0OTJXb1Z3TURyMTNw?=
 =?utf-8?B?SDJuVG1lSXlVN3B2eUhJaEx1SS8vS1pBMVFhZTZxMUNQN0I4L05YdDZSMGgx?=
 =?utf-8?B?UlkrcEpDdXpaSzFsZ1NoTG15L0NJYkc5TGZSendGc01tL0k0eHpvK2JJVktm?=
 =?utf-8?B?RVE3a1JWcU1mVG1PYlhhVi9PWGVRNXBiM3hIN2JOcG1GRXpMK3RHTE8wNDF1?=
 =?utf-8?B?b2VkRTRGYnFDQ0ZzL2JlZ0RqOGtjTmxzUXF2MWw2THAreFEvUitUaHZKMHpt?=
 =?utf-8?B?ZGEyak1zSVBKSkdsVndBOERWTHg3TWQyM3czVGNscnpuTVFuSVBMOVRVclo2?=
 =?utf-8?B?RlFmSlFXZ2U1ZTcxcXVCOEV6cXJKNk1FL0REeG1pb3h6VWpCNXVzNlphSzN3?=
 =?utf-8?B?bnA3Yk1uY3l1QlhBNW4ybGRLUjBsNlpJQ0lEbDBpU1ZnaHRrckoraGR2TS9j?=
 =?utf-8?B?bmF5T1NPeWhMajl5Y3RoMGVtZk1YL3hYd3JHK2tWTTRWeWxMZFZZSzJnTWlI?=
 =?utf-8?B?N0ZmSHVDN2p3dXRLTnNXVmZJTTdHMTlmM05wRERXVDhyQnlidC93U0RDUVNP?=
 =?utf-8?B?Q29JK21zWUVuMllmalYxOE54Z1NtYWFMbnZUcFFISTBhRXNmU2VndXBqRzJV?=
 =?utf-8?B?NFJvZFY5SWg5T0tuSnZ3aExtMFMwS044eWNwMTNMa0hvaWhaSjgvSTAvaUZ5?=
 =?utf-8?B?WW03SEV6MU5vM1BYU2x6K0ZZVHFIb3hzblVuejhoTjRaWHd4VWxDOWk5Y2ZS?=
 =?utf-8?Q?vFoxu0XRg7OwdzPMtlsnKhYLWC2TxPhG8WJbt1q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlpvZWh5ekYxdkt5Q1RhbGxRUlFHODBDQU1KakpQRTdIY2dWSkl0YXR6YkFX?=
 =?utf-8?B?YU9mWDY4b1VkdDhuM3I3bTNISVd3UW1JTW9jbXVmWnRtVGR1MHVlNlU2MEZD?=
 =?utf-8?B?TVhWYm1wcmF3ZVY4QkV3U1hIbFpvWlppZ0l0OGMvZm40RFc3cnBjL2pqS3Q3?=
 =?utf-8?B?VWtVbDZJUHJyeURrL2s4SlhpbWx1N01tWDBrRkY0T3c2MCsvOThjYUxVT2N1?=
 =?utf-8?B?cndFeUEyNXk1Z1Y2Sk1BOUdBR2VyMXdVUVRpekVpc3FReGU4WStmRWVDVmRF?=
 =?utf-8?B?Y3l3VWptTWQvZy9Sa0hMVFE0SW5YNE5TbEwyVnJMMzBVbVV3SnMraFhMVzVT?=
 =?utf-8?B?cUlRRFQ2czBzRDlOKzNOQVJHc2lIS0tqc0I3MFVTOTA4ajJRejYxT25DZXRH?=
 =?utf-8?B?eFJob0g2WVFHb1pjMEgwRFovUFY3bU1DbXlEakFrL3h0K09mRkJ4emJNZmt5?=
 =?utf-8?B?ZzN3ZFZ5enF4TFBrT3dwNVVkUllIYlFKT1FaVFdYZ0lEdlpTVVc1cUF0aTlN?=
 =?utf-8?B?b2pqNlpKS0lsSnNLN0t5WkVrK2ZBTXBOQ2x4amtXRTE0eXhBd0xIcS8vSlEv?=
 =?utf-8?B?a0t5ZDBsZEcvYXZ6ZkxocnlYbW1mTGFzR3JNZDV0ckJ4ME5zaDl3QmxvalJ6?=
 =?utf-8?B?dlhoUkU3Zk9IYXExMkVubW13NUpGRmJnVERCOXpPYWxsVHVzOFliV1pKcG1P?=
 =?utf-8?B?YkRxc1hGYzZMRUxjbUgrU2tvTmN1TWc2NnQ5ZFVST0VrcWxFbFpEVjZ3dkRs?=
 =?utf-8?B?TmhGak0xQXFKcHBtU2ZLaVlJSWN6RW9TZ1B5Szd0NCsvNUJjTi8rWEttOTk1?=
 =?utf-8?B?bzJoMFRVUzRocDV2ajBzVFpqWTNUWU1GSjB4LzdGeTJNNUJBTGVOSFkrS0I5?=
 =?utf-8?B?a2o2UXluYW9VMklUaXVzQlJLd2ZyL1I5dnVvcjRINWF6ZmlSU2wwSWkrVUVv?=
 =?utf-8?B?NFJCVzJnWVdiOHVtUHZvTFcvZmY3YkRHZ0NEcHJUV0U0NmlJVEF5NGN2azhq?=
 =?utf-8?B?WXNHV25sNXlyakMvTGZicCtaNFhMYi94T0hPaklKZkNJUzdFbXJjY0tsQUlY?=
 =?utf-8?B?OHJoMGRyVzNYblkzS1EzaThET2FNV3d4Q3VXVDNnUFI1QkVpWnFCZWNjaGN1?=
 =?utf-8?B?eXZzUk1lOTFOTHRpTktrS1ZiNk5MYjYyLzVXcTk5dUVTUDVTTHpWVTFPMnFp?=
 =?utf-8?B?cTI0OW9DTzlZem5JUDRFZlhmVHBPeTRmYzJGM2F2Z29pN1o0ZjZadHcrWEpB?=
 =?utf-8?B?eUY5LytWMlV5YXF0NUQ1a0JiWnUwY1NyTTN0TGZkN2J0N2pxOS9OS0RaNzRE?=
 =?utf-8?B?b3VIZDFsVWxRakRSa1FlL2NVTGZIWGhyaUp2U0xMTmZrVE1ITFdYNmtSK1dO?=
 =?utf-8?B?Szdud09HSEdBd1AzNWtRbkNyYTE5MU92MVZsemFLS0J1Mm4xM3JWZ0o4NW1O?=
 =?utf-8?B?dTBqdEdJWE4rek9FblVZQVBGQ1hQRkk3dEJOYlU2aUhxZmU4TllvMS9ZeEpv?=
 =?utf-8?B?UUdHZmxBcVB5WXpCWDdwbWlwdEdyU0xwN0liUXFsaDBrVG9GVjU4VVlEZUVL?=
 =?utf-8?B?TlBSUDY4azl6c0VMR25wUHZzb1BUSFQ5TGdlNHc1M2k3ODBZUVFveFhNbFhK?=
 =?utf-8?B?b1BZTXdITVFLU2JHOEFTaWxIMGJ0dDk3aGRxNGFNbGNrU1d4cURYM3NGZW9x?=
 =?utf-8?B?RXJhSDZOZGVRcjFBSmwzMDQ5RWw5ZVdYSU1qTUpxMlRkWWthYkFhYTVvb3JO?=
 =?utf-8?B?TkY4Y1Q5Y1lUeEg0WFMxcVl6YXBndVJPejdzTFF1QlFDNGx0ZmJZc2tiRlBs?=
 =?utf-8?B?eGJydjRkbFVVNVU5R2lyVWM5NlpwRnNhcXAvck1ZQktROW9BM2JIWXdwMHRG?=
 =?utf-8?B?cTZPc2J1UlJsUFdVR2NOZTh3NU5lRy83aWRqVFk1aHJyc3htL0V3S1F1S2V0?=
 =?utf-8?B?TWNvdGEzRUdqZGdRK25xM3BhU3lZb1YrbnBDUGFpMGFwbFlLVFA2S1BDZTNQ?=
 =?utf-8?B?enJLWTlkTGJ0Y3BaMlY2UXp0VDYvN1FwK3lCNUNIWkp3Wm9yRjFXa2I2VEpR?=
 =?utf-8?B?dnU5ZDRBZGVsb0k2WWNvcTdzdXZSTGV0REF3ZTZib3JqQ3ZYV1lNalVVaHgr?=
 =?utf-8?B?Z3NwakdOTFozTkRrSFNGRmVtL0RudDVpbVVKdjJwcDhzb0ZWSG1tTmZtWFRQ?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 197e99af-80d6-4452-ee10-08dc861ec119
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 11:49:42.7775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4aZGlL9CUFSBvxhRiy2ACjT0c+9UDO3lEvD7HwroEYUdzRPWlC8k4dVSAyLZajLy1QmZOAddqTTaacRiY2yAZPkDW+csTqmzvbGCWtyI/P4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-cze-04 23:22:31 +0200]:
> Only few steps from the GT restart phase are applicable for the
> VF drivers, as initialization of PAT, WOPCM, MOCS or CCS mode can
> be done only by the native or PF drivers. Use custom GT restart
> function if running in VF mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 4e11662b78bd..57d84751e160 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -611,12 +611,34 @@ static int do_gt_reset(struct xe_gt *gt)
>  	return err;
>  }
>  
> +static int vf_gt_restart(struct xe_gt *gt)
> +{
> +	int err;
> +
> +	err = xe_uc_sanitize_reset(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_init_hw(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	err = xe_uc_start(&gt->uc);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  static int do_gt_restart(struct xe_gt *gt)
>  {
>  	struct xe_hw_engine *hwe;
>  	enum xe_hw_engine_id id;
>  	int err;
>  
> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
> +		return vf_gt_restart(gt);
> +

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  	xe_pat_init(gt);
>  
>  	xe_gt_mcr_set_implicit_defaults(gt);
> -- 
> 2.43.0
> 

-- 
