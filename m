Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0292C87FDB
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 10:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E0610E42C;
	Mon, 11 Aug 2025 10:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McnemXeo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131B410E42C
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 10:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754909054; x=1786445054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DyZ0brOfOJfWOV78fwd4ZBK90vjC03sb/BeZ1lx0z6k=;
 b=McnemXeoSvwmK40gCGqLQUxsT1PMHiICIg/Ug+fbseHi0ZKbVm/D9tPX
 I9EwYB3pwMh3UHtQiU5tVfMvp0vEFayj7u88e2rqMQFhma2gISaMIAi02
 1dYm2ya+iK1SbEO9j23lvBoyAUCy2ztL+v4yS17rxbHPBQaZZ9y4EhhiM
 FVv35jziqRN2QtizOml96w5ngvvhDi8bZ6KboUWh2rY9LuUKiUKZOrlnh
 ITr4nowlbKe8H4Y0T2PAdxHIlgW+iEISyRQlHnmOBbw5VwXr4DeBvokDY
 b+kD+YNVLdOPanQMVLarBSRch/gY413BrntuOdZNs8lhcRJ3HYiZ/Cl63 w==;
X-CSE-ConnectionGUID: OJSUvOGJTcyw8huEgsGAXw==
X-CSE-MsgGUID: ozLLnFjkRGu3uPaeLP/ZzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56363705"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="56363705"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:13 -0700
X-CSE-ConnectionGUID: voYLYTVdTlq6Oohvl/8LgQ==
X-CSE-MsgGUID: 3UhCVABdSDSIEXkl6RBajQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; d="scan'208";a="165782369"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2025 03:44:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 03:44:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 03:44:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6lauUEhRtE0j6tadLMYtY2vJERLNFxHE67lQ1SEmrzVhXRYn4i/UqFZD/Qtx0P6uODqKIKijt7BZOsbts+bman7U7xyOMWYUFdlK21X3Pfba21SS/tWiympglsL/4J0o6TrORlp5BUX/xIK3CXcFC8DfvjDMmjxxw9Pkvmfb4sqdrFY+NRCQXu3jAhu3esxnu6sItjQWQWbEjpb2K+7RzbHAGSyMWDYcrQvbpNkrdcYBM8ti5iO5YF95g57xnKaY8VDkCSLoLW3i3vFIljpWA714/KQ8Djjr722qWqc42vI3HuOQAh1GGdMcyUGFIONzj3EVoyCMdPK4zrmYYcOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vTGR2CF5/r/fO/nTtzMNqvHgxZzyWbPImevXQseXDA=;
 b=wFI2W/TXzFBWlPLPIy2LtYhM2VJ00yVcoPwEPaY6jMsgtRKP/J61NKQntC7Sn7aMFtXdR2kiTIsDqbjiSa5fGkxRaPFeDtAGz5NWqvC7CpMfKPSHC2eN7hosuZLpO9Ax9Q4YFk1fdfkFM+f5BsBc+xBEwPE/X0582qYw5HCLu89qYXFw9AZm0mCTCXfL3Y7f2SdsEvwkc0EbapurMJu0s5CNO8T+78kIWkTIZgHvhKdnN7jJFAMdkWYC3QSLhBPnTg2MVErU8Fl1KKvd7UPxptq3hcZUrdgw3BNtlhZlyWAFcl1/gN2JVDXAU8roOiTaa9XdJiMN38/czcoG4kJWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Mon, 11 Aug
 2025 10:44:09 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 10:44:09 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v3 1/2] drm/xe: Assign ioctl xe file handler to vm in
 xe_vm_create
Date: Mon, 11 Aug 2025 12:43:57 +0200
Message-ID: <20250811104358.2064150-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
References: <20250811104358.2064150-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0253.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bc9491-ef73-457e-2ff7-08ddd8c400a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YkRPeUZCVU9kanV3RERFUVJrVmpCYlJ4YXJvZ2RtQndiNEVpSzY2dm4zUDZQ?=
 =?utf-8?B?VzJPN1NneXYrK0lWUEZJem5rb2xSczZOUytxTUdkKzFmMVprQkNNMndCNjBv?=
 =?utf-8?B?RlVUdzZvcVJJQlVwRm5GTU8vYU13a1BOTURaTG9JWlJ6Z2NYOGlGVTRFWlI4?=
 =?utf-8?B?anEvbWlaM2RsN0dSZ2hqRHg3K0VNSkt5L2FuQm01bnBFMStVV0hLMFJWd2tM?=
 =?utf-8?B?MWd4L0thcmRSZXNXMFd6dDRFRVBVbEVOa0VZWWRETkgxdVFMUTdoM045VXB4?=
 =?utf-8?B?bU5KQzRSNGVPeVJIMUVOOXEvb0E0Qk8zQ0N3YzRNN25nUUVoUkN3bzhXRGpR?=
 =?utf-8?B?WDd0bkRqVHRIUnl4b21kTHMvRkVRNDZIV0Zndm5CdlZaS1hHZDVFV3NvNnFv?=
 =?utf-8?B?MnJ3VEpsUkVKOXhvMm5wb01haTdyeWUvaTZXTW1GNUxadWdIOWRkUGNTU0Z4?=
 =?utf-8?B?RXZpbkFwZnVlQk5Id1dpakw4UnIyeGdDQWdFMVg5TFYxNFpaL2Mwbkc2NEJl?=
 =?utf-8?B?OHhYeCt1SUI3NXMvTWJBUFFHd3NHdDhHbEphVE1lYkI0b2Q2TkN6TFlnaGV5?=
 =?utf-8?B?U1dBaGJ3S3FCZUV3Z2VRMThtdG9GYUI5NndMWkJPL2JGZWcwNExJdHBOU0tq?=
 =?utf-8?B?SXF6MnNKaDZNaUpEdFljYkRId1prbG5pc1lmYlVxRFhiKy9zSXU1RWdVa2g0?=
 =?utf-8?B?NkxKTXVoMklGSm9xYkhoTkR6WUk3N3d1RGhUc1h0blA4d3pUSHdHZXI5YTJa?=
 =?utf-8?B?ZlBxRWU5SnMrQ0oxbUdWVWlXWE1KS2sxRUlYYXJRUXRLdmFTejhEMDA5ajFO?=
 =?utf-8?B?WTRDd2dHbkJHNEZyelFybVRwUHpSaVp6UFZ1QTE1c2FiWUhuanI0eXMwNmNi?=
 =?utf-8?B?dGpqQjhiVytGenY1ZEtCc2ZDcnJuQjJleEI2NmltUkVuMDdWVTBSN2tBN0hu?=
 =?utf-8?B?dms4YXpCUDZoZXFNUmswaTNsVU9wTzZNZnBuSHpDNFJMMUJjUWYzSkw0WHRj?=
 =?utf-8?B?eENncWdOTjYzN1pRT05IUnFNU0ZJbmJScHZSeitVNGtFQjJlOHVrUHRaOTdK?=
 =?utf-8?B?OFRPaTdZWDJmU2k2ZWJ5cHFNK1hvNHArREhObzFzM0l2N01KSnU5NTJib0Jx?=
 =?utf-8?B?NnczNU5ndEllVFo2UldWLzJ6RnVzU1lETWZMNTJXUGdCcjlwejRvUzRWRElB?=
 =?utf-8?B?UVVCbjFBZzgxZmxOYkFrZFVmT2NhdGJpdy81SXFkeERHcXkrRUlXSGZMV0Uz?=
 =?utf-8?B?MTRjSHpqMDVHYkZKeTBYbUhjVkpzMnVuaEdCZmxadStCbnlrN2p3TUprVEhE?=
 =?utf-8?B?enIwTGZTbkhGQWQzekFpck9DZVN2UTRqU1Q0a0dmd2oxNlVIVjB4aXZBZ1Vw?=
 =?utf-8?B?YjFuYktxN0J0Y2xFbXNlV3Q2WE1NMmNCYmw0Vm1PVUh5bjZsZklJa3Y3bzlh?=
 =?utf-8?B?SWUwcGgyRnF0dkF4TWJKdTREcDRYR01mMW9jYzl2WHU2RHltKzBia0dydUZW?=
 =?utf-8?B?Sy9qSGQ2RWlmeGwzZFZyaUNWVkhRMVBycU5RQUVXeldrOHRCRnoyUTE5eUdK?=
 =?utf-8?B?VTd2WENqYzQzZDJHZ3VaVVRTV3RZeDYreWRZWVhMZXc0NFI1amJteWtRMWRw?=
 =?utf-8?B?d2ZYU1BCazU4OW5xeUZTMzlvN1BZMGZJb05YR1ExemJTa2duWWhFQkVTR2dE?=
 =?utf-8?B?L290TStueW9GM1Mvd2F5SmpPK3A1ZmFlM3ZBdDM3VDVQdVUveG5VbTBoV3c0?=
 =?utf-8?B?Rmg1S1E0WjBiSFRydUVwaTNuVkRGY21tTUxDaGY2K0tHcnhKa2hCSXhQOE9B?=
 =?utf-8?B?TVo1dC9YVXFSYm00bVhaMlB3TzF3VUFMYjVSM0hBZUZzWHU3UlNXM3VZaVJF?=
 =?utf-8?B?Z2hKOG1Zb3pGam1WbTkrejMrWlMzVE5PODBmNFBIdks3WFp2K2xya1ZtV2Ez?=
 =?utf-8?Q?bnE8KWPJEBo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmJwTk5EeDV3VldHUGNaYzFoa0tGMStDNVZRczk0NmdYb3RjYVhXNVhETjY2?=
 =?utf-8?B?aG9ScnE5SysveWFxWTdpK29XMmlMeEdoeXgyVzZpbm5nNTFvWFozLy9wZSsw?=
 =?utf-8?B?MjVZT0NxeFVDVmdhTTdYVjRpS0s4bUMwK0R2SVQ4L1NkMEFTazlNTVpkV1Zz?=
 =?utf-8?B?RnVEdjJFaVdxdW94dkJyWXladGhYUzl2VHJsemJ6bXNWaVVJNjVRZGlneEx1?=
 =?utf-8?B?Rm5IQzh6TW9hWjh1MTUwMHJINHpGaXMvMEdhNC9JU0dMTDVjT1ZnU2FIODlY?=
 =?utf-8?B?MzRJeUwxQkhXNlJUNUZ5czk1dUh0N2ZvR2NmYm13NEdmNHlOejlGV0VqM2pm?=
 =?utf-8?B?UlV1aWJ1a0Y5b2EyQ01ValFpekNMVjZlcytyWDJnQUM5Um05cWxmN3JMSFdW?=
 =?utf-8?B?WFJ5RjBMVGRWNlRBRzRyVnRmRTg5YjhySnZhS1Z3YkIwNnppZlV5V25NQ2NF?=
 =?utf-8?B?djNOR0lZWDQ3aUkxV083NDhGMjc2YXRuRjY0WndWMmQ4R1lBczJRV1VCT1Bi?=
 =?utf-8?B?eG1KczlsRVlBRWZHclpCSDh3TkVrZzZtcnpwNFZ2WXQ4VUVaQUQ1SDk3aTgz?=
 =?utf-8?B?TzF1TGE2U1dwRGx5OVRwWHdkTkpwYWxuWUt6MHVLTXNUQUxOSUtUS2Vzc204?=
 =?utf-8?B?UmtiTFNUeVRGTk1vRXRlWG4zMTdIWnBQalNMWE52M2FNR0pCUXlwUVRuVTE3?=
 =?utf-8?B?QzROc3NKU0ZzdFBUQ1lWWTZiSmtLNlRBTngwQU5YSXRqTHFvdUQ0VytXdzN3?=
 =?utf-8?B?V1g4T1Z6WFc4RzVQaGxlOGxsL3V2Q2RYcE5JemRRbUhJSnZGM2k3UElFUmVr?=
 =?utf-8?B?cjFFUHFydnFoQWVSOWgyTWZhNC93VyszaWZMQzZma2t3SjJIanJjZkpObzhJ?=
 =?utf-8?B?Q2xkUENoMFVuQ2pQSEQ0WEppQWNJTkIwVW5MeUhaS0hkMDNrTEo3c054R1Vx?=
 =?utf-8?B?NXVPZ09RVnlHZHpQTkZyMmpjNXRLTUFkMWtOS1JsclhWdVhocWxpOGlqY0RO?=
 =?utf-8?B?ZFpZK0s0M2t3ems0a212c081S09oaW01amQ1WWVuMWhFTTNObGJZVFZmdDA0?=
 =?utf-8?B?ZTIwN002RjRpUFVTVlo3UFZ6RU1hemJaaXBhTCs2a1YrQXlzN0pSYmFsWjdh?=
 =?utf-8?B?QkNyUWtHNnJhc20wRnR3SXZONzRLQ2Fnc3NUc1ZLL3F4dlZDb3lULzFSOUk5?=
 =?utf-8?B?N0hYdEYvcFZPbnd4WTlEZnZDa292TDgyK1hqRFdPejBqSzk5YmRHNVd6SzFq?=
 =?utf-8?B?d1EvdEZsSFpFc0I5a1M5R3VWaDdyTzl2SHJHL2tVaVdUbTNnaU5FU25jSUNV?=
 =?utf-8?B?ZEUxR1hLRzd2OHJuSXdkT2ZaaTFtejdCUjM0NlJhdjZqc21sMlErN0x0cy9k?=
 =?utf-8?B?OUFqQzYvazFYYWFPYzhmMmErSnFHYVVBalQrSGF3UGt5ZnR4SEIwWXZLZXU2?=
 =?utf-8?B?eGovbG05RU1pZzdKQm1TamxzekU0NlJwa0ExU29SbUd4NExLb3YrZ2s3RFU5?=
 =?utf-8?B?a0NLSitrYXFmWlVqTmpYSkszeHlYUmtHbEwxdWdtVHZTYmJHRHZycWdmRHVY?=
 =?utf-8?B?b0J1OENEelp4TXE2SDdiTy9TTE9DNnZHeXFVeXR3bWJwRGxPMnlCWDNHMkZE?=
 =?utf-8?B?WXpuODYzZXhibFg1QTZVcFVkek1BME15RG1XeUNaVHNRRFR6VFc2d2FnUVc2?=
 =?utf-8?B?aUlncU5ONHU3YzRHTHFxeGRUZXZZKzQyTzIrQnIzNDc1N1pEcU50NUtBQXp0?=
 =?utf-8?B?WE5Ka05qNXVEZWVvdUozQjUrSTRZZ1dYOXlUb293MWVpVTZnems4c0lUNGw4?=
 =?utf-8?B?NWhGbG43K3hmMXpxUzRPT200MGFHREl3aWhScWo0UHRmb0ljWjVvUlFJNXNr?=
 =?utf-8?B?Ym4wcG1rWWlLWWM5N0tvSXVmTnZuK0dFL2R0aWNIcFBiOWRtOXVRSHc4SzZs?=
 =?utf-8?B?a0VYSzA5L0RCazdCSi8vM00zeGtQbkJkdExYMTlkb1VCU29YcWF3ejgvS1JM?=
 =?utf-8?B?RTNleU5UNUtKZExDZG5JRkRSa2crUUdDc01Pb3NhU1o4MXZpQ3F2ZFRFT3Q0?=
 =?utf-8?B?eWVrYlZselBtNEdJYVJXTWJaVjZQcmVzMEtoZ2d3Tk1JTStWZDhzcW1oc1di?=
 =?utf-8?B?SGlYK2RNSWNxTkZtbFA3MjVMYmg4VkMvYzhTYzg0by90WjVGZ01LWmliY1RR?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bc9491-ef73-457e-2ff7-08ddd8c400a6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 10:44:09.3728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw38gJx/nA6iHTjAqIRc5AsfJBpAsjRz3uq64KYA5w+dy5nhKHQCKca6jRE7sdqTMx3Twtjbeh+nfxQtfQRUriBZ5VVuY5I2u4u1ZP765fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
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

In several code paths, such as xe_pt_create(), the vm->xef field is used
to determine whether a VM originates from userspace or the kernel.

Previously, this handler was only assigned in xe_vm_create_ioctl(),
after the VM was created by xe_vm_create(). However, xe_vm_create()
triggers page table creation, and that function assumes vm->xef should
be already set. This could lead to incorrect origin detection.

To fix this problem and ensure consistency in the initialization of
the VM object, let's move the assignment of this handler to
xe_vm_create.

v2:
 - take reference to the xe file object only when xef is not NULL
 - release the reference to the xe file object on the error path (Matthew)

Fixes: 7f387e6012b6 ("drm/xe: add XE_BO_FLAG_PINNED_LATE_RESTORE")
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c    |  2 +-
 drivers/gpu/drm/xe/xe_pxp_submit.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c         | 11 ++++++-----
 drivers/gpu/drm/xe/xe_vm.h         |  2 +-
 4 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index ac9f4d4988d2..915fccea7aeb 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -411,7 +411,7 @@ int xe_migrate_init(struct xe_migrate *m)
 
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
-			  XE_VM_FLAG_SET_TILE_ID(tile));
+			  XE_VM_FLAG_SET_TILE_ID(tile), NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
index d92ec0f515b0..ca95f2a4d4ef 100644
--- a/drivers/gpu/drm/xe/xe_pxp_submit.c
+++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
@@ -101,7 +101,7 @@ static int allocate_gsc_client_resources(struct xe_gt *gt,
 	xe_assert(xe, hwe);
 
 	/* PXP instructions must be issued from PPGTT */
-	vm = xe_vm_create(xe, XE_VM_FLAG_GSC);
+	vm = xe_vm_create(xe, XE_VM_FLAG_GSC, NULL);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 148a2425006f..157e11bd2121 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1640,7 +1640,7 @@ static void xe_vm_free_scratch(struct xe_vm *vm)
 	}
 }
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef)
 {
 	struct drm_gem_object *vm_resv_obj;
 	struct xe_vm *vm;
@@ -1661,9 +1661,10 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	vm->xe = xe;
 
 	vm->size = 1ull << xe->info.va_bits;
-
 	vm->flags = flags;
 
+	if (xef)
+		vm->xef = xe_file_get(xef);
 	/**
 	 * GSC VMs are kernel-owned, only used for PXP ops and can sometimes be
 	 * manipulated under the PXP mutex. However, the PXP mutex can be taken
@@ -1814,6 +1815,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
 	for_each_tile(tile, xe, id)
 		xe_range_fence_tree_fini(&vm->rftree[id]);
 	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
+	if (vm->xef)
+		xe_file_put(vm->xef);
 	kfree(vm);
 	if (flags & XE_VM_FLAG_LR_MODE)
 		xe_pm_runtime_put(xe);
@@ -2097,7 +2100,7 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 	if (args->flags & DRM_XE_VM_CREATE_FLAG_FAULT_MODE)
 		flags |= XE_VM_FLAG_FAULT_MODE;
 
-	vm = xe_vm_create(xe, flags);
+	vm = xe_vm_create(xe, flags, xef);
 	if (IS_ERR(vm))
 		return PTR_ERR(vm);
 
@@ -2113,8 +2116,6 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
 		vm->usm.asid = asid;
 	}
 
-	vm->xef = xe_file_get(xef);
-
 	/* Record BO memory for VM pagetable created against client */
 	for_each_tile(tile, xe, id)
 		if (vm->pt_root[id])
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 3475a118f666..2f213737c7e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -26,7 +26,7 @@ struct xe_sync_entry;
 struct xe_svm_range;
 struct drm_exec;
 
-struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags);
+struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags, struct xe_file *xef);
 
 struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id);
 int xe_vma_cmp_vma_cb(const void *key, const struct rb_node *node);
-- 
2.34.1

