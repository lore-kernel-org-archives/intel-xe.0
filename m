Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58265C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 08:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 189BE10E068;
	Mon, 10 Feb 2025 08:18:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H88kW4ba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EABC810E068
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739175494; x=1770711494; h=from:to:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=u5XwkB2DucNwM4Dipaq9HPbB7XtFA3ClA1HLs91WzE8=;
 b=H88kW4banWcKpNDdBfWk2jhdKX8LaEZKNGYf34drskqAgteFNI5uLbxX
 lBgNoem7y2m7vyyh6CjiZC6Ub+8muTX3hUojgh14V/GgoL+1/Bu9yw0PS
 fMH4IrFpZ8MMbNp4M4MjSINNnvf4vr07nZPTamq/nB6L5AbivON8szIoY
 IIt230LVsobBqdkuJk0C7ecqoQRxqQZlEJehan5WHNI0+y+iB0aAaRuqt
 NxzjkqSzFmLArCxsGMm2ny9Zr8/vjshuD1nXGZbXDwyD3nXhfLA+S3W8v
 vSVxjOY6H3BzSlQ7doClAI7HmBZKrqlLANDyoqXlfQWTLY5oCByHPaznJ w==;
X-CSE-ConnectionGUID: mxs8EoHZTEawV53JETtF4Q==
X-CSE-MsgGUID: fT+lxfKvSyOSXEZIQRSvLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="51136505"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="51136505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 00:15:58 -0800
X-CSE-ConnectionGUID: IjAwBJ9XS1661zdP9z3WfA==
X-CSE-MsgGUID: dM6nnRvARfOn1OeV4PiegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111956213"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 00:15:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 00:15:56 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 00:15:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwRB42KROxrY4XCE/ozIIQNUWK9RZTkMO6BlCTtDEJBImfFwexsEmIwwSqn9O2ynX6sWgwDAZAAlnOIIwIUHtJV3BphGwq08aCxwypYXuDKNbRkCHbKO2q8f045ntljyhfBkunSISy8AmhK8OgcjLI333uqn3T7kkh0WRZtu6id5XymiEiAjKVbMM40IXwtSKpAi0yJFXOCBT/0jwqdCr+IBGPQE132WtE9avCgkPIBaZmTML98kW3lRmI1ez61DT/qX239GVtn1MbQ24IML3kqPLmhjq8G9u5o2RgYoTbs4h8bw+otN6WUu+iygwjwwIXLhfDTAEOKj3PtQY3ZPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69whplaFVQdVmk18BPS7QnCFZFPSePQ5Eu8YfHXMkdo=;
 b=Cx7gAHpVsHI8eUCyxd6p8jcsQ/DFka4tQpyugIl4RrUtqDVfuv3RCTDotUCqkQr2Ha3fUfYnbAOsvn5WMcB6+lAsFzKOXdtygu6p7t+0UHWvIJknazpsnMsoBCU1nKRgEypvZzDWNXP+yTug6Taz+MNSOa1Ujuei/N5TKw4A0SsksfqOVvLIKgzu5krhj9ojWPeZrWiKuSDKjoZ1I6KBDEto97oziRAd9oAUTPjM9I/AbptYE4YQNO2FpeJX88tLym4kW9lyVUem2tdniiFEzLkMgKSxiaHDtz7QZ1o1jIuzlfuMJhwQeIlrvGFB1drJrKDbXP4q7FQVFVlOvz+KDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 08:15:26 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 08:15:26 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v3 0/2] Cleaning up code related to VRAM regions and its
 initialization - part 1
Date: Mon, 10 Feb 2025 09:15:09 +0100
Message-ID: <20250210081511.906452-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0195.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::11) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4595:EE_
X-MS-Office365-Filtering-Correlation-Id: a22eebdf-d8e2-4928-656f-08dd49ab1248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGNDblZHOTRYd2Q0dTNBdXJveU5rMXJUb2wyZkxpOW10QVB6SmtNUTZZYWlO?=
 =?utf-8?B?OUpUWUw0a1FiYjYyVklaVlJTTGlQSitrWW02d1JlNXNDUjNqQmhQamFybkJx?=
 =?utf-8?B?bVJMSERoQVBRZWtvK3pXMnlhMnRmZGlKY0pPK25MTytmZlVKajNxZDFPYzha?=
 =?utf-8?B?OUpqb0RIQzNiQlNjUlhhTFBsSlRjNFZadlhpbEgrSm5mS2RQMmkwcE1OWHh5?=
 =?utf-8?B?M0RZZ1FqUDBnR1Jzc2RqMHVZWHZoTW53OWh6U1dGVEpneTcxRFNMOUtnTE5v?=
 =?utf-8?B?U3JPN2tKNzFhZU5WR0FLZ1pXWmE3ZWtyQ1BCQTgyY0lheWRZWk1vOFM5djVG?=
 =?utf-8?B?RVVuaUR2NDBkNkdiL0hoYjBncXZIM2E4VG9xa0h6Zks4eWF4aDBwaHhGa3Mv?=
 =?utf-8?B?U2tCRDlXQnhFeEdURnE3QTlvRlJ3NEVwVkdyVEZOeTBzd3JGNlFGWE9vUlpF?=
 =?utf-8?B?NWgyWElKdGdhZDJXelVXZzFQU0tCQXNmbVJvYTkvbkUxSnk2bDJEZEhiTGo2?=
 =?utf-8?B?YWVWSWZPaTBOdFhzWW5OTWxLRkVDK2tKYTNtVUU2NW9uNWNETER5WVRHUks0?=
 =?utf-8?B?d3VJR0k0M0l1cXE1RjlKN0ozUXdiOHlqL3EyM1Y0cWZFL0Rmd0R5TzlaY0pu?=
 =?utf-8?B?VWMvR0tiSzBVSmpYRVFvaFQrRzB3aXJEV1FEMjdJSnAydDVOclNZN05HUDJj?=
 =?utf-8?B?Rnk1b1hrTk9iU1pxdXFQTWhlV2JMTVkzUExxTGY4SmdBUkE2R1FhVmVRNC9m?=
 =?utf-8?B?QUNrVXFVTGRib3hLNUd4WStjakQ3cGdseWppRitBTW1nNmJGUlRiK1hsbnll?=
 =?utf-8?B?TjdxYmNvN3dSZTgxZmhTc0VET1FuMExDSkRYRG5DRXpyTW1KcWpCWkFZTWxs?=
 =?utf-8?B?ZENQYWxUeW1DcW9sbDJzSGhjKzAyQVRib2RqYUFMT0JqVHptWVBmMk9WM3Qw?=
 =?utf-8?B?cUVPMEtqczZCTGtWRVZKc1FXOXZDZ0pzdHJDYUxFeFVQKzV0MEJvUzhWSWxC?=
 =?utf-8?B?OGo5aVJLMkd1M1hJRit5ei9aVldzS2ZVZVRTcU1iQnNER200OGpFdDhwV29h?=
 =?utf-8?B?T0JieFhQNmdpWW1SMmp5aEhTVUdhdDhiekw2ajhjbTkxT2t1QWtFR09xTHla?=
 =?utf-8?B?RVJOQk16RmVSa2F1dkZ6b2k3bHlJOGsrSDdrckM0U0ZCM0lpVHNySGZ1Y2Zs?=
 =?utf-8?B?cHNkVmtNNklRdUJJaGIrbHhEcDRmOTZYRzV5YWhaWFlSbHY5bEpBVmdiL3Nw?=
 =?utf-8?B?Vk51amxpMUxJNDRmTWtiU2U1NENwTmd0UFNGSEtIRjIwbVZkQ24zd2JoeE0y?=
 =?utf-8?B?RG0va1BUZytvTnNaK3Izalg1bEp6cDVWNHkyMi9mYnlLanJpR1J4b0tQS0pL?=
 =?utf-8?B?NnNXYWl6amZoTitrcHdZdWtmenlEK1QwVFJYUXM2dDlZVmNlRHVacTk5WGtB?=
 =?utf-8?B?TTN0eEFhakhxRkZCQ3pFcmxxZVNBektJY2s4TG9USlBBWi95RlRTbW8rZEJv?=
 =?utf-8?B?R2RPV0RESGJQOEJ4Z1F6YVg2QWVMdUlRVVU5cExuRncwbUFBcFNVYVFIbWxW?=
 =?utf-8?B?cCtCVTFCQlJQL2ovTmViTlVNRUF0d0R0L1FDbEJ1Zk52UHdZbUFzeGZrU0Rq?=
 =?utf-8?B?NDM1KzRQS3l2UXhXaXFMSGdNcTFBSlRRY0QwK0tNSzg3SXlQczVPSmVDZzJu?=
 =?utf-8?B?TVc1Y20yKzFEancySWY3WVRuZi9vaVJmM1VWdENyTXZJTmFQM0pOc1AwcmNR?=
 =?utf-8?B?RHZIekhPbGdJakd2dWcyeEpBZnRvWEgrV09BN1NKMzhuTDBzRVkzVExrODdJ?=
 =?utf-8?B?T1RPTE0vR1RkbzZ2OWJoUTFxYW90dE5jcHczNjFNSm9LVHlCZTZTQ05xM0pI?=
 =?utf-8?Q?OpF9enD+1gL4r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFlLRSsySFBFV1ZiU3ZNNHZBTGxuQ3hmRG5rc2YxbTBZL0o0ZGF3RC82Znpm?=
 =?utf-8?B?Ui9SYjBTcGtnaWkvVnJPd2cyL0gvcGtsejVFZERPWGhQWnRiNzVQVXFOVlg1?=
 =?utf-8?B?WjgvaE0vSXY2OFhjcitvM2F3TEdLUVExVzd3RVNWVHVsb1BQL2wyYjdvcHR4?=
 =?utf-8?B?Y0dmMjZoV0toN1N2RzVzcitaN3lDOU9mRmVNTDA0czhQR21QN2plL1ZnVDdD?=
 =?utf-8?B?anJCUjFPSW5vejc5b0JvZSt3TzI3RnNHZWFVeCt4S3p1aWlpQkdRc0hsdWta?=
 =?utf-8?B?UUNJN2dyY0VENHd6WHpVSlExV2NjS0pXTVRvUWdkbmhCWmsxb1JZVmdxUWln?=
 =?utf-8?B?K1g5MGtaU29DL0JtbnJUZUdyQnhHNVZEdGVGeE9ZYnJ6TkJBYUVuMzgzVkRC?=
 =?utf-8?B?VmZRTTlMcUUvNG51WTlkWFd2MUtXUTFVVyt6WUE5cU43TVNwS0w5WjZLVk5r?=
 =?utf-8?B?VkVxV0tIWk1oNFE5R04reWNOZmkwUXk1d1QzZDIvRjFDejFMMzFaUE5FM2ZD?=
 =?utf-8?B?NmptU1dSc1hQQmgvM2hVVGJKamhHWnN6SnBhQ0oraFFYcEhsYlFRR0pkQ0lG?=
 =?utf-8?B?L1oxWmgyRTk2dVYrTGZiVGxCOXFjNS90TUE1QjhJd2htL2lhQ2VDdTRHVGk5?=
 =?utf-8?B?NDN1YlRGKytTWUJVK2Q0VllVdGlxTXdjNDB0QlZRQzg4Z0s5V1pUdWpLZitu?=
 =?utf-8?B?Rm1wUWZNaWwrQnpPRTV5ajN0eFRzMTZhb1NhblI3Y2FmcktycU9IY0VraXY0?=
 =?utf-8?B?N3dLMGhHODlMTSsyUVFNTExrZVpxK2Y0dU9mQUZtTFg4QWZCWXdXMUVOZVVz?=
 =?utf-8?B?T21LTlVRRUJlQ2Rjdytob1NWWnZONHdQeE9iWHByVDUwUEdrZmRxSGdIb2g1?=
 =?utf-8?B?WHkxMXBqUlMwTTJPcTdRaUl1RGxGZHJWQUxKZSs2Smh0SkplTU9xbmZSVTFG?=
 =?utf-8?B?ZER2WWF5UmdMNkpQU2RmVjBmV0ZRdXMzajI4RzdUeERUZlpQQ01tMTF4TTZB?=
 =?utf-8?B?UDBCZDdIRk5YV1V0YmVaV1Y5WkYzTWd1WGJ1LzdDRjRHQjBsSCs0RWVMTVhv?=
 =?utf-8?B?WFhaQTVqYk9DSlMvaEZiN1FqcnJKWVJJVVNHYWRxWUdRaThkNkhvNUpKY0tH?=
 =?utf-8?B?cXd4eVMyUlN3TlY3Q0xmdkZZUHlYT0gyT1orR2d6RGFBRHI0SHc4WTVJM3Q2?=
 =?utf-8?B?VnNNUXBac1Fyd2VKTTZtWlRVSnpXM0JZUlpTR2owZDNVVlBTUlZmei92Qkxn?=
 =?utf-8?B?VlJOZzE2NElrNWZhQThETnlyajNHdFQrMnY2Y3NPU1VObFNOaExLL1VJTGEx?=
 =?utf-8?B?b2NJSVRmS3FneUk4UE1ScUFFWmJ3aSsvSXBwMWxrSWQzWTJ6TGY4WjUyd1FT?=
 =?utf-8?B?bnVqbTRFYTJnWjcxajRVeDZJbWRNeTlrRFQrYkNYNGtsQzVhZUNvT3F6RjVN?=
 =?utf-8?B?Y0NuV25QVHdmK0hDYXE0ZnJsQUkva2hIVkdrTURZT2s2eGlaVGxwYWgxTkRl?=
 =?utf-8?B?cUhuRkpMQ2RkT1lMbVcvNWRTZlYxem94Tkt5RVRjUmFBQS81Mm56UkVmcVZC?=
 =?utf-8?B?MzJHTmZhdHN3MDh2NTlqQzVUTFd4ak5PaWFGaUJ0OHpkY1pqOVVYaDJBYVJE?=
 =?utf-8?B?cTIydy93bjdRMkUwV1N3a2JPTXNaN29Ja3Y2RERtWTlCdnI5WVpHeE03d2Iv?=
 =?utf-8?B?Uy9MS0NiZ3FENEJtSVZtN09rSzRTS0xiRDkydVJMR01Rd0s3SFRVRUVtYkNs?=
 =?utf-8?B?a1ltOTVlam4rSkh1RytDY3kzNjV2YURUMDBWOGUwcWpRM01MbDdremFCUWd4?=
 =?utf-8?B?RXZGaVJDYWNHV2V5czd0NitTaU9wdU5ZL3pGa0lQNEdQcFBXNlVXUEtQK2lF?=
 =?utf-8?B?ZE5qOC9VRDNhSXk4ZFFydGM1NW11Z1FkS29vSFRiaVdESDlNRk1lbjJXUExD?=
 =?utf-8?B?ZnpHTGEwRXByNm9QeFpBblVKNi9pa01Kd0lybXVxYkwzNWdIQzVQVU02Ynhz?=
 =?utf-8?B?MXhHTkhpN29pWmNvMDA3OTJkeitBSlJ1UUJUdFlCTGxrVjI4SGJOMXgxSExF?=
 =?utf-8?B?b0xhR0VmZUpoWThZdll1dFJtVk5tb0NzanJPUTVwTTBvZk9NSnhzK3Z3QUdm?=
 =?utf-8?B?dlNCMmdlRThGZ3dIcExiTDJpR0NXTkJjaWZ5MERWb1FxYTdPMGlTOTdWa0Vo?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a22eebdf-d8e2-4928-656f-08dd49ab1248
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 08:15:26.2168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjTWnWl6sVbNPWeTomixUUn/5LyKwD9MJ2H46iVRFO2210JGwJqGGBkU4dkIgksvpPmdeQ+8kIrRIvQfEUifsr+a7VR38NL5RiIystjo28c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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

I would like to reorganize the code in the Xe driver regarding VRAM regions,
in order to allow in the future easier extension with more VRAM regions and
other than per tile ways to manage allocations in VRAM.
I would like to start with such simple changes as renaming the structure
xe_mem_region to xe_vram_region, to stop pretending that we use it for
something other than VRAM regions, and in the next patch move to this
structure, the field responsible for the TTM manager - this will allow us
to keep the things needed to manage allocations in VRAM in one place.

In future patches, I would like to make some changes in the initialization
of VRAM regions, and allow for dynamic allocation of these regions
depending on whether or not we need them in a particular case. Finally,
I would like to introduce the possibility of a separate VRAM region which
would be dedicated only for kernel structures, which may be necessary in
the case of SRIOV for future platforms.

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Farah Kassabri <farah.kassabri@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

v2:
 - remove xe_vram_region pointer from xe_ttm_vram_mgr
 - stop use dynamic alloaction for xe_ttm_vram_mgr in xe_vram_region
 - rename struct xe_ttm_vram_mgr vram_mgr to ttm
v3:
 - fix "'ttm' not described in 'xe_vram_region'"

Piotr Piórkowski (2):
  drm/xe: Rename struct xe_mem_region to struct xe_vram_region
  drm/xe: Move VRAM manager to struct xe_vram_region

 drivers/gpu/drm/xe/xe_bo.c                 | 22 ++++++++++++++--------
 drivers/gpu/drm/xe/xe_device_types.h       | 14 +++++++-------
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  6 +-----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  3 +--
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ----
 6 files changed, 24 insertions(+), 27 deletions(-)

-- 
2.34.1

