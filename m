Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87445C83F1A
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 18:49:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B7910E212;
	Mon, 14 Jul 2025 18:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg6Cc6sz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EC6A10E212
 for <intel-xe@lists.freedesktop.org>; Mon, 14 Jul 2025 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752518964; x=1784054964; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=45VwIZbSxBLEvVxgZOkpv7y8lw6rVXot6m7PHKYzDv4=;
 b=Vg6Cc6szeViybWmxS7eBPLKs5hEJFhZ4AjUTjYUFlh+/Glt+yTwalWSV
 LvE+DCsfgPemymOHjZMk5qRdp4P3C52OaEMoxllxfe8dQ+c3YxqzTR8fS
 ARziiMadhtjTiAWURMBnXVZIYurrZdpJEsJCIR0r4FgQt7u3FNn7d3oBp
 K2m3ncVvNB18tUDqKj6qPkkgy3A6OvFGvQwtXoZOq9M1mz5WWUoi5XVZa
 MpMyCyJ7iUtszpPYOzJm8HhXV17n7Th8i5Ikm0DUJAGy6WjyyiO5H9ks8
 OCD+CkOgQMd0wIz3WT0mOT+UCz0JZbv7IT6OtKOJ8J90bmAZN1ocvBWQ2 g==;
X-CSE-ConnectionGUID: r95bGsiJS/GJAIM4c1dquw==
X-CSE-MsgGUID: 7aBSbyYOTkehicu5DBDulA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="66171297"
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="66171297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:19 -0700
X-CSE-ConnectionGUID: OeEWo9AIQ+iyyOyBaXZIjQ==
X-CSE-MsgGUID: vUyYN5xCSy2f/8DLIK1BVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,311,1744095600"; d="scan'208";a="156411716"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2025 11:49:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 14 Jul 2025 11:49:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 14 Jul 2025 11:49:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxl78BrF3o8S28hXWkDHCG2LmiohH0e5itvW+9Xq0p5Od7iekdvI2F1RJ5H6JOIEA+weOsJbCMWYQIH269SCRidZ0K/xaKDaQY73Oi5tgcwOhK9v5921Ft/O1EOT7KBh0cG9cWXe+9OeJOpED84fm9TfCqIbKmGV9qWtZaNSSf/zzlx/woFh1H0kitzW/XGpOhh0K0UYfmzlXO4WQR37WdGsHeWk+hK3CM12ZPeYfgeisdr4frCsQDY1gwoirviRxW8VTnAY5U7BjrhcDTHR5kc8/6UdjFB1sPvDvLhLFi1LYKv2k+S0TqWD0H4IRrCt40SpxG+7XdfUsj2sdcmz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrtGQBlPIOA7zWfjQYswfv4/myGtA3ae4bjaIy7NQxA=;
 b=o9OEJXVyZZab3Dg6zU8BoVNhVlB2SYGXea0QXPj6/70cfk9ky8iByf8IIb3IVNYkqufadOdLe0BxexOkS3NuqJMVedZU9obQv0pBjZ4V4I7vjT514K+f8sk0qop7Q94Kw5ybtGXoVj5/Zbxr+cq6lPr9pcZLm00ltpwweMKwOzUmEKO0fLNdvHSvAyEz0RSrCULVoojuducsc1rni+EQRqePAv3qsdG1+urFFSqUkrOsOAcUqlWeLo8naAsd3QDStAjgjk88FmaiRMoKCmOiRjTA3PzsLxbdFo0P8dk3LBwhsbqZCfvXfC6oStAH1BZL9OHhUGq1s+XGJ9swMEXrSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB5176.namprd11.prod.outlook.com (2603:10b6:510:3f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Mon, 14 Jul
 2025 18:48:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Mon, 14 Jul 2025
 18:48:25 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH CI, v11 0/5] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Mon, 14 Jul 2025 20:48:13 +0200
Message-ID: <20250714184818.89201-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB8P191CA0025.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::35) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB5176:EE_
X-MS-Office365-Filtering-Correlation-Id: de4fec6d-8fd3-4202-ae32-08ddc30703ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm9GMGp0dS9JYUhtTVAwOGFqSnBmS2cyd2F1OXpnemEza1JMZ0tzN2c5NHk4?=
 =?utf-8?B?WWtLMjd4K2F2dDRnbmtlNk1xZVplcmVVN25LNkI5WXd1c2hZbU9wWlFWYnIz?=
 =?utf-8?B?Rk4wdlBvQ1QwT3FNdjIvL2NKSTRsRlJWSzJIQjlMdkI4aVRjVmYxWXVLcSt3?=
 =?utf-8?B?a1M2UHh0SmtHVWlCNHhrZkprMmh4Wm1hZ3c5SENBOE5RSHYzQ2w4K1I0K0pU?=
 =?utf-8?B?cHhUbVJOaXZjZzJXTGM1UWlPZXNDVDAxYTVHTUlFZTM0dzVDYU1iZDlwQk4x?=
 =?utf-8?B?UjIyelZGYUJVblZlQmxYQmVpK3V0VDJaNWMzMktLbjhCUlk4eE94c3BUQXpG?=
 =?utf-8?B?TlpUTWJXcVpPSFRqb2ttV1gwLzRkc2pIUmw0RFJVa0tPSFlJeWFLZ3AzVi9U?=
 =?utf-8?B?SXphYjEweDhCdTZnKzVvZktZeDZLWDlqTnlWMmptdW9HOXp1WWRoWlBzSW5a?=
 =?utf-8?B?QWdyNHBvQXJ5b1NEMTYyeHkwUVNiRTRlcDZLVW1hclZkTmcvQmRsb0FBTS8y?=
 =?utf-8?B?WDJSWk56bGNrZWN2d3JXanNIb01sUzFCdnY0M1EwZmxqQU9iY1k4WjNRek43?=
 =?utf-8?B?VGZBL1JYV0RPTGM4VzZuaURhLzRMK2ZCMlhBb0FBZmlSWU9BcG93NUxpV3c0?=
 =?utf-8?B?QWJveFR0UFJVaXdEVk1EOEdkSXRuRUtVNUZiaFlrWkZNWHBJWWc3VFVPWkdI?=
 =?utf-8?B?NlFYaUxmTisveU5qUnlWN0FtS25zelBCS21ITEtzUUhWUzR3KzBiS0NrM1p3?=
 =?utf-8?B?bXZUait6US95QnprNkI4TnNEMDhNdVltSFZjMzh4ZE1oZlZjZXl2SWszNitp?=
 =?utf-8?B?K2RLZXVGdmxRV0pqM3FCV1RuS3FzY08vSXBjOUk1MWc5WkRLUTRBZEpWQTF2?=
 =?utf-8?B?Nk1pci8weDE5UDJpVkgzZWhhS1lyWi82bHVPb3FTdUtOOTNkcmVEd0F2bWVY?=
 =?utf-8?B?bWZFalVMZWlLYWtwVjE2dXYrdkNEQUFRSU8xclhZT0dlN1laWmt5TkJlbUVN?=
 =?utf-8?B?QUlEMG44clVRaUVqV2pzY2x6QTZIL2JQckZlV2VFQ0JxaXNMcnpJdlMwVkhO?=
 =?utf-8?B?dit6b3ptZXo3SXpHY3ovS09lcmZaT05HSXpqQlVld3lpTjF2K01YS3BiQWJm?=
 =?utf-8?B?Zjd3RlBsUmg0UWgxdGhtSVVnTlFidndsQ2cwWk9WdDJOOCtuRXM3M1J2ZGJR?=
 =?utf-8?B?dGcwMUp1RDlWbTdOdFZTWS91V3U1Q0tUUzZmdmIvOVNGdDdSaUtiL1Z1N09B?=
 =?utf-8?B?d29KVmUvYmFxN2JiSWkwTGJEdXNDUWdEanY5UnlrTExpUDBaYitucVR3MXhq?=
 =?utf-8?B?Zy9DaE1QdFRYMTMxZFpEbC9KMllTMUdCbDlDa0U1Q0VyYTdla0lJUVBZemRp?=
 =?utf-8?B?SEd1L1l0TVBWcUZQaENiVDBXenVCK29rYVVEZ3JSMGhXRmtQWlhTSThGSFAr?=
 =?utf-8?B?VlR6eXBkZSsrbkowcnI5NmdkNE5YV21EVXR2NGRvSUVFdnQ2aU1FY2h2ZTRq?=
 =?utf-8?B?eE5lcTVCZEE1ZUNBYnA0MWdXSHFWbmYvSmVLdGlBNFlQWTVTL1FsTXppUUlH?=
 =?utf-8?B?SUdFNXpHQmg0Si9acWxQUDNGN01yTEt4SVp0V2N5UWxqZHVvSXEyR1VLeEFH?=
 =?utf-8?B?Ri9QTmE1c2ozeFNoaHNPOVNuMzBpYVhUUG0zMkZPZmsxczh4TkNKTzN2cUla?=
 =?utf-8?B?MWp1K3AwR2NhcFIyYUMxc1l4dzFadVBNVVRRQklOaG9SdE9SbzI2UTF1MW5s?=
 =?utf-8?B?SExsZjhKMnhQUXdkK1ZuRHAxMjUxQXdPYUg0cUNUWFNYc2pFS3hQNXpIMUZi?=
 =?utf-8?B?Vy9ISWpkWnR6WTNJODZvV2RQN1dkakgxc0xKRUgrUXB2TjU5MXFmakdiZnlo?=
 =?utf-8?B?NGhORDAvTEhEb1Nvam9FN1Q1VHNhdmpFTEVDTkh6RG8xKzRXYy9wODZrQklT?=
 =?utf-8?Q?swCvaldx4cQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVI5RkRsTGRrUE9YbkNYNXBIWjk4a3dSR2pYMUY3MEFQTTlrbmU0YS9iOTBU?=
 =?utf-8?B?TVFxWGdjWGRPMkJ2cDRvL0w4VWxxMjNpeWhUcHRtWnRrQldTU1NEQ2gxejl4?=
 =?utf-8?B?dFJabUZQUnBMcXk3RFNQaUFMa2FrTUZqNDVNRkZ2NkhrYW5EelRxWmtLQ2Zt?=
 =?utf-8?B?SUNaQk82QlY1aWRJdktPVnY4U3R1N1ZOL05ZRFEzSFZWeWs3bUZOcElyVlVz?=
 =?utf-8?B?TytBWWlneE80aHRGdGJhTzVBOWZHamNrWW9ZeDRsRGt5ejEvejlOVmg1RXpS?=
 =?utf-8?B?ck1RZDR3cVkvZ3dpVFgxcGFGeGFDa3VBaC9HeXM2aFFlYnFmdnBVbUpqMmZG?=
 =?utf-8?B?VVdBVW1RUENFWHRDamRaeTl2T1dKZktCZU80UmlGWk8wV0VIb0M2bkpJYkZY?=
 =?utf-8?B?c29ScnkyWFI5QVhmR1RLemJUTWtVaXhheVVHYml0QkJMbGJPbzhzQVNIOEtF?=
 =?utf-8?B?Z2oyOFJyS0lhSWQvcDFQN2xwOThReGhERnk5a0I2cGpBVURxenk2clRmelhp?=
 =?utf-8?B?TzhYUU5iVVQxQlUrYVBkbE5KaWVmTTZWK1YvdkM5bHQ1U1JFWXlBNGQvTzh2?=
 =?utf-8?B?WVFWL05KTzlTZVZpWjZTVVpsbmxaamtWSXd3V0V6UGF0cG1rTlk2STRjWUpG?=
 =?utf-8?B?elMrcnhmcXVXdlNLN1BCNkFRcnRLMStnT09mUG5wN1NDRXR3OW56eEhaZm9y?=
 =?utf-8?B?OXRpSkFoa0lDaExuUFRwVXJ1bEQ2c3N5L1NUU3VwcUpxRlc1ZzdiMXVNcXNK?=
 =?utf-8?B?dzNTaVZ1OE5Lb2NKN2cwMEhMMEx1cmkvc1JYSXNaMm9IQkRjbTdJQ3hPUDhP?=
 =?utf-8?B?VGZZYldOcUxQVlJTVi9TUC9YS2lmOTZlNWdWRXRnRjRyTEttcVNIZGhDWnpF?=
 =?utf-8?B?eXYrZlZQZ1NNRXVCZ3F0TUlaeDZuRlI5SndKQWNUdG9oc0RwZ0IrVi9YOThC?=
 =?utf-8?B?b0NyK3c3eGlQRXprcThvMEFrSDhqREhIVy8zMXFJcXhhcVlVRnhFTWJOL1lZ?=
 =?utf-8?B?bEFmbzBiK1h2dk43T2VidTNBNmRETWRzZ3d6R211SWtITk5oSnlUNE1hRGxF?=
 =?utf-8?B?RFBKd3JMdWFmdHdvZGtEbWk1YVFTYnM4ZUE4bDVxbDdEWmlRVmNSamxJT0t2?=
 =?utf-8?B?c2Vqd3J5RWVqQzVHRFk2WlJQZGhNVis4S1pTcFNFYmZ1RXVaNm9yRW1iTXIy?=
 =?utf-8?B?MmUvNlZ6UldlUTk1Wno1QjYrTWk0N2svajNKU25NSVh3cG5HZHZob0dUVjFL?=
 =?utf-8?B?UityVkhZMHh5ZkhOOHQzbXdtRWpVeWNYdVVBMXZuZVpqYzRiaWIzNnBXUE9n?=
 =?utf-8?B?WVlFeExxbWllMjFaS1RLVDNvVWVrY1dLa1hMNncwMElwdEhRMmhQSHFlbi9F?=
 =?utf-8?B?UXN0YmMvcEw0UFhiOWl2Ly9oeU4xbGdkMWV2bGF5VjNVQkEvM05iWGltSUNL?=
 =?utf-8?B?VWJUeWhRbTQ4ZGhPZHpYcGtaTkhPYkdoZ3JLRjY2bHcrdWNLa0M4cktOc1Rz?=
 =?utf-8?B?K3ZwUlJCOEUyaUhLVGJCaVJvODZhYjcyOHVvd2pLdGphQVJySUE4OVNlaENq?=
 =?utf-8?B?R3BncjgxbXAyZ3hxS1NoQ1BEcytxakxXYURXeGhwYU1uRUlpeEdjcEtRSkk3?=
 =?utf-8?B?T290bzBqaUpQSUhvVlMxRG1ZUi9mUVlrUWE5RnhTVUlZVzNUVWVtaXp3cEUz?=
 =?utf-8?B?RDVLSmJHdG1wUUJLd3lENHk1V1Y4U2FQdjVFNEZRTnZLQzY5VEd5bGtBbmFH?=
 =?utf-8?B?d1VjRExwOEdVektUQWRQeHo3U0M2dDlBUTlNWEJUdHZuQjJCZkhQT1E0RWx3?=
 =?utf-8?B?U1lpQVpJQ3RBZm1ucm81cDdrQno2SjhGNmYvclplaE8vdDFDVkRrcFpZSk5s?=
 =?utf-8?B?SjRGQXVheGdsYm5QZC9idzlqWHBuZUNFdnNnL20wVWYxUDNGaFd6V20zUUF0?=
 =?utf-8?B?NStNL1FkMTZvLzNRd2FrSXkvNDJGVHJWUElmOGdSY1UvYng2cUxZaTB3QXk0?=
 =?utf-8?B?c0EzZElIU2N5eWlpeHU1c3pSTk5xZWxUQ2RoTFFiUld6dWtTdGZmOG1NMVNW?=
 =?utf-8?B?WVc2Nm1aNzVaOWZ0WEN1MTJ2UGoyRFAvQW4rRnZtYUZuQmFLWC9ZL09VN1NB?=
 =?utf-8?B?dndhOGFJcHZhTmpEVmxXVWFTUlhycW96U3RoUzdTSHBrU0R3cnZ0aVZMTWxM?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de4fec6d-8fd3-4202-ae32-08ddc30703ac
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 18:48:25.2347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xk3V6H5nSV2AKuv2RnL3yKFmMTh4CFzSjICyuIlndrIwHCVlTWs/3dl8TWbnzOoL6LDbqOhLNKQ/y8KqlMFaRdxczMVfZcACY9fGfPYpe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5176
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

As a follow-up to the earlier VRAM region cleanups, this patch series
focuses on further improving the flexibility and clarity of
the Xe driver's VRAM management.

This series focuses on preparing the VRAM region handling code for future
platforms, where a more dynamic representation of device and tile VRAM
regions will be required. Static allocation of these structures is replaced
with dynamic allocation to increase flexibility and improve maintainability.
Additionally, the initialization logic for device-wide and tile-local VRAM
regions is unified, replacing the previously separate code paths. This
simplification improves code clarity and facilitates future extensions
involving additional VRAM region types.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.
v4:
- add new patch "Use devm_ioremap_wc for VRAM mapping and drop manual
  unmap" (Matthew)
- add new patch "Move struct xe_vram_region to a dedicated header" (Jani)
- fix null pointer dereference in xe_assert when VRAM region for tile
  hasn't been initialized (Michal)
v5:
- Fix build if CONFIG_DRM_XE_DEVMEM_MIRROR is enabled
v6:
- Fix build if CONFIG_DRM_XE_DISPLAY is enabled
v7:
- rebase after new changes related to SVM
v8:
- rebase
- add a helpers for accessing fields of the xe_vram_region structure in
  patch "drm/xe: Use dynamic allocation for tile and device VRAM region
    structures"
v9:
- rebase
v10:
- remove tile back pointer from struct xe_vram_region (with
  modifications in xe_svm.c) (Matthew Brost)
- add new back pointers: xe and migarte to xe_vram_region (with
  modifications in xe_svm.c) (Matthew Brost)
- add patch "drm/xe: Split xe_migrate allocation from initialization"
- move helper to get tile dpagemap to xe_svm.c (Matthew Brost)
v11:
- rebase

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>


Piotr Piórkowski (5):
  drm/xe: Use devm_ioremap_wc for VRAM mapping and drop manual unmap
  drm/xe: Use dynamic allocation for tile and device VRAM region
    structures
  drm/xe: Move struct xe_vram_region to a dedicated header
  drm/xe: Split xe_migrate allocation from initialization
  drm/xe: Unify the initialization of VRAM regions

 drivers/gpu/drm/xe/display/xe_fb_pin.c        |   5 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |   3 +-
 drivers/gpu/drm/xe/xe_assert.h                |   4 +-
 drivers/gpu/drm/xe/xe_bo.c                    |   1 +
 drivers/gpu/drm/xe/xe_bo.h                    |   4 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   1 +
 drivers/gpu/drm/xe/xe_device.c                |  20 ++
 drivers/gpu/drm/xe/xe_device_types.h          |  62 +-----
 drivers/gpu/drm/xe/xe_gt_pagefault.c          |  13 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   3 +-
 drivers/gpu/drm/xe/xe_migrate.c               |  50 +++--
 drivers/gpu/drm/xe/xe_migrate.h               |   1 +
 drivers/gpu/drm/xe/xe_pci.c                   |   6 +
 drivers/gpu/drm/xe/xe_query.c                 |   5 +-
 drivers/gpu/drm/xe/xe_svm.c                   |  63 +++---
 drivers/gpu/drm/xe/xe_tile.c                  |  62 ++++--
 drivers/gpu/drm/xe/xe_tile.h                  |  14 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  22 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 209 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |  11 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  85 +++++++
 23 files changed, 427 insertions(+), 230 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

