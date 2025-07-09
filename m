Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF80FC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9F610E7C5;
	Wed,  9 Jul 2025 12:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwK5QTCV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89C310E7C5
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063357; x=1783599357;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=jUwPAuMyVKDU79wzQAeSrgg3xUnFKfDyQBop8yScqhU=;
 b=hwK5QTCV+rnKnqAkJqFSfFOG8kx9aZOoCb4kdMq8lp2+4NWUReg1yG7k
 8D7dA3KODE9X54xG8dJcygZvQXM/LfOjsm+kOrYQxuZrxPsXUC3yLC0+T
 f9+NhbjH2atlPTwCiU/HcrfVkfXJpPbnI1h0+I/CyT7VLSXZHLOic6sAy
 uUDQfhYrMdYkdP7n16ayN1zeSkTk+6cxr3xYb2wzFRuL4qCHhUrnYD1kL
 AwyWQd6+PbOeTXuE4o6qpthtUAA4pWb+K6tAVjK5W5rKkg5DQ6KKZCveX
 hEuKlo1rHzWWFkcKbwEpAqKoQ0DcFGhnKpqsKwvoJcTzwzOO3y0zqajhO A==;
X-CSE-ConnectionGUID: FFqSbQhuTQu3HpOSdf0GOw==
X-CSE-MsgGUID: odajE4ObQbme9sbgV9HEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54466475"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54466475"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:15:55 -0700
X-CSE-ConnectionGUID: 2OGTWd81RAyOgNjdSFrg1w==
X-CSE-MsgGUID: ukJ8T+wwTwK5lGPAHBOH6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155848430"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:15:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:15:51 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WabaR88oX13rpbX22jg/ruHVSxQD+EezZi57F7v1i4sLwrZTdarQFBbgjyjPNe4H6fUSuxlztM0kF9V030ljVEMGYugfgFwpXu6KMBQ017gycorGOykXi3IjcTawhgq8pDykV9xEbAdXisaKGZv7j/g0Tx4ZdpSbmb0V1LWXv4qaUZq9qf81Q1C71fXjs47xbhHp0tHb9eICGruaC48geBzlbNw++bYAIiZSjPSMJSSFmsDP0Pr+E6mcMwj24hJ2p2ZaxEd7Zz7kv3P2jjX74ZDRBRSaxD+UhakCkrTZDnMgN9IETQ9eqofrzYsWjBaOAtsnimfdA3tooMpZra3yOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i49pPz/dCIkHw+g8zfIvjCOAyWbK5A5HWXhV8zNHUos=;
 b=bkrTkSCCHP3RLB+MrV17tTily6ox3GWy8FZ6T0pVb5EepjjmSJCDXuGFLavFU0uDBSJei0jcX2+sBIXWwtpMvJ7U+BN31OgQwR17gqkqzo0fg+gxTlXUi6v9PdJ360noDQNOcBli0COQceWMM0ksH+G/NppbstvqAhJ2BhzOolWCG750gTCylyrqCFB9CFBFch3hcv4dMdC2wAWTrksjctwpPWOFtxI6AzMPVP5l1Q3iKMgu/EhKyi+qJapW7KPHHXSxC6OyF7qD02yVkXppL5lG3VBBiR/CuHoBSbUXz4JwWbVK9EUvsFz9xkrBncXNko82luU2Jy305FlS+bJaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:15:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:15:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>, Stuart Summers <stuart.summers@intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v10 0/5] Cleaning up code related to VRAM regions and its
 initialization - part 2
Date: Wed, 9 Jul 2025 14:15:38 +0200
Message-ID: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0073.eurprd04.prod.outlook.com
 (2603:10a6:10:232::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: c5b8af10-c432-4c56-5893-08ddbee25749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0dzVFRwalYrV3UvSEtXYTJrUW40RURERE83KytBMklvaUFXcDBJTUgrWlg0?=
 =?utf-8?B?UTRUNDNIeUs5L2Y4OW4rYVB2d1BVWGIrOUFmallkeFl4T0RncVpOZTlwSVRB?=
 =?utf-8?B?aTVvZGZKZUhlNjhEcFF4Qm5abUhTZm1FWWRCMGxPNlZVTTBRYlhjR3hSYnpP?=
 =?utf-8?B?RVpFVXRDd3puSld6Rms5dlJmWDlzbENsZDREK2hGWE9DeFp0R2pTazNqRnZi?=
 =?utf-8?B?U1JYOHBEdnZSSWFiemVSWk1tVFM5aVhIMktKRDJZV212SW14Nm1tK0Z6KzZj?=
 =?utf-8?B?V2lqTlVNK2pnOEtkSnVZanRXbzl2LzhVVmZoS1ptWHNWdyswcEtJVStOMFlM?=
 =?utf-8?B?aDJSSks5Tk1aMUtyQ3JsckxUMlBUTVZqa283dlhOeVIyYjdYYTc4eVNPN1N1?=
 =?utf-8?B?VWZ5MGtuOVhYbWdSRVpuOXN0OXJNSTEyZGpxUTFJL3psalY5U05yYlRPcllV?=
 =?utf-8?B?WDA2RDE4K3Z0anpDVVNpUnYydUxYUG9pcThPbXk0YU9Tb0EralNTSVZPYmJv?=
 =?utf-8?B?MEZwV0FyREM0a3NQREs5VVNHcDZSL1lkVXNzSkdYN1dmWnF4bFh3YzlZUUo0?=
 =?utf-8?B?Z090aGlRT0RCVUNmUHVQSjBaOWxhbWUyVXU0cWxLd0VyUmxwSk9wbmR6ZDlS?=
 =?utf-8?B?amdhNXRJdWNRZ1V2VG5xc05ReklsMDZKLzRTNmI1VlY4VFhHRlJUR0psSmVj?=
 =?utf-8?B?Z3NKck5uSEZQYXZYNmNtNTRFaU5RRVdoWmpTd3JxWFQzVy9CSktXU3JOdndn?=
 =?utf-8?B?NUxXWXprKzhzODF5OVo3S1Q2dUJjWnpPaVEzb1VHMnljN2lGZDZEcklseGc0?=
 =?utf-8?B?M2hXdzcxb0gvcWNMSUgwTXdKeHRHUWNPTEtCMmVyWlNyeUZjSitaSjdPVkwx?=
 =?utf-8?B?WlBHRFI3UnRwM0Y0Umc4cmtrREF5VVRtTWhxSU5ramtaUTJ4dklSck93bWI5?=
 =?utf-8?B?Y1Y4NHNpdTZKUmxsNDZrQSs5VDVZaGxCUXYzUExxaytHNkY2TlJHdjZMT3Z2?=
 =?utf-8?B?WDhBZEM2bWJ1aWFRMVd2TVVtRmI0cXZ0SGhQc01YM1VEODYwRzlPREY1NkJj?=
 =?utf-8?B?RUIrTk5BMHdPTTdob044QjRCZ2NZN0hxbUdkRDVIRndXL296V0JDV3ZmUFh3?=
 =?utf-8?B?V1RQbm5ndFpEZVhpOU5PYUl1dHBCZktocmRNbWIxZGlxcVR5TktZUVdqQllq?=
 =?utf-8?B?RzUyVVBtWUJ5Vk9ySlVsWTZmMHpFbG9HQ2UyWXNVaUk4eFVncGx0b1ZrMGY3?=
 =?utf-8?B?S3pha3hpMzRlMFk5Q3ZoT3lIbWREcndmckxCSXBvMDJyL25lV3RvWE9wWkpi?=
 =?utf-8?B?b1NCL1lFRnBoU25jWDZIUloxa1hWVGE4Y3hjZDRDL0tHdG5GY2hoNDZCekNY?=
 =?utf-8?B?Y1BhU1ppZWszUVU0NXh5WGhxdGViT3pWSXM3Sk4rbDVFeHVjZXF2WFZuS05I?=
 =?utf-8?B?VFJiUVBEbkNyS2NGKzhidHZyS0lweWxYRi80MXJwTnpIbTJ4T2t0eG5aK0xh?=
 =?utf-8?B?T1p6ZEEzdEx1YVR6QUJuejdvUXpKM3JTVVBoWkZhamNMZXNKV2Y4TTVVZVFK?=
 =?utf-8?B?ZW1PS1BzbkgvSHZMZXVSTWIzUkxJdjBhY0ZXQ2ZtQVFSVldMNUc0cXN1Ly9Y?=
 =?utf-8?B?UVJmOEpVTHZDNlNlZXI0em9aNlU3eHpPNTJ6U0hYOGtJeG1OMVR0eUJGeEJy?=
 =?utf-8?B?QVIvYU5HZGZubWFqSHJMS2hzMFdkbVExYmtERjQ5T3E5RTIwRFRKa0NhM3FJ?=
 =?utf-8?B?Ry9KN1VoeVJVcXE1TlRlWFIvMXV6bjN3U2h6N28zODV6RGthQVpjYVl0by9l?=
 =?utf-8?B?SFdEMVlrNU82b09wWUs5ajdFUmNPaDR6dW5OMmN5SjhiSFFzMnJIVEFFMTAy?=
 =?utf-8?B?V0F0N3lVbHRIUEdDc0praWUvcjZzck9vRDVQNjFqRUczbGgrNDVkc0JLWms5?=
 =?utf-8?Q?IZyLpJPcewU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUxwWEk4cXVPL2dTNXQ3QzRNZkVLd3R1dHpWVi80bjlSZjE5Y0xMZWM3Qjhy?=
 =?utf-8?B?VW9nYWdTZEc2QmcwT2EyUUlXMmF2MlAzTkNYMFpVaTFnS0YrL3Ywc1VJZ0ly?=
 =?utf-8?B?cWI5UHAvZmZmN2I4YzFwSFRmSHBlVEw4dzJhTitsWnlscUgwZnBadVJDbGU5?=
 =?utf-8?B?Y2xWbGJWQWU5R1Q4WVcrelFRMFhCcXJxVjhOL3pZdGVBWW95T1dqSjR6OHVT?=
 =?utf-8?B?cmxxV0U0eVY1Z2hzN1NRT2tqRFdtYzY3NU9iaEFwZjBNemNzWmdvZTlXZFBM?=
 =?utf-8?B?ZnRGU05HNzNNdm1PNURTOXpadVIzbDJjT1NZc1BoT2VJUm9jOFZ3SElEL1c2?=
 =?utf-8?B?aVBKaFdPMHlWN1RpTFRVZmo4ZVhsd3BNa2tmWEpjcEljd0ZqdVNlQWR5Vjk1?=
 =?utf-8?B?bGlMU04rQVV6bUJtdm5wUVdrL1BuWTNaNUpXQXJYdWtjSWlGKzZxS1JnSWs5?=
 =?utf-8?B?VUVDOThEbjFOdnB2b1dzUTdjV0RXdFg5STBnWFhxN29qRFpxbXQwcGlMK3Iv?=
 =?utf-8?B?blBQL2N3SWYvVFpSdWtJVkVyN04yVFlmbTd4K0M5NHlQRTVZMnNhOEEvNUZi?=
 =?utf-8?B?RG56T09ZWTJjWDFpVTZzckh1MEVsMnRvYW90ZXhhVUtaeWpRWGxzYU9obzM1?=
 =?utf-8?B?VElyb2J6RUdkbmx4R1RrQ2ZRL2Vvc2VrNE1tRlBNTmFNczlWekE5MytpTEZK?=
 =?utf-8?B?YlNPWVFSWUJaaGZtd0lXdTg2YkJYdm02cS9KQVkrRVYrcmp6bkg1WnkyUjYy?=
 =?utf-8?B?Y1YyWk0wZXRHWU9pbS84cGYyWWJXamtUNVpTTzhveFhaRklpS09CMXJzajhL?=
 =?utf-8?B?cEZMVTJGeUE1VGNJOEF4VzRUbXR1Y0ROMGN6MlQ4TDFOZGp2UkN4N1J4N2FW?=
 =?utf-8?B?WVVEa1RESFpydHZ3elBaMWRadjdleExlSDBRSUFabXRTMXVNSVg0ZUdmK084?=
 =?utf-8?B?dTJWRHRoYkc1WlF0VXJCN2g3clZyMWNpQUVpSzZDeG5DdnlmaDlOYmI3VS9Q?=
 =?utf-8?B?dWl1cnFGMXhocXVBMGFhcUlVZCtaZk9QaWNnZ3JsZkFoZUpVSzlqZkRPbjlD?=
 =?utf-8?B?ZFlGb1NOaHMycjg2dDFERWg4YlREUjl4dFN1RkZIUlIvd3BBUkFNWUp3OGFp?=
 =?utf-8?B?MXFmRTZzYTRQSjBzKzBmMTM0VjFvRkZLdFRCa3NQODRaVTJzWW5RZXJNbVhN?=
 =?utf-8?B?NVR0a1d5U25nb1VoK1AzNGtwa0p1MmFsOEFHYUNWSzFaNndEdUZWQ2tveU9h?=
 =?utf-8?B?MXBSaXlHS012enp3SlVJdmtkZndoL1dhU2k0ZFhHdm5qbkpwdWxRc1RMZjF4?=
 =?utf-8?B?V1V0WTVsTVVKNkdjTDlZNnpmbHlZM0FETFVKTnZ2eEloYlhnckhXWll5blNR?=
 =?utf-8?B?UlhTY1UreVQyWUJzSi9PQTA2bEt2OUZxa3hETlNvWTdNNVNSSThoUnBUdXBV?=
 =?utf-8?B?cVgwRHowUFhEVHBCdkFmbzI1bG1nTUg1MlhvQ3pId29XMWYwVEVvZS9kMVZw?=
 =?utf-8?B?MDJIMXZpQ0E2Z1E1cnlES3l0aThhMENXK1lScGhRcktZVktWVVFJQTJNbGxo?=
 =?utf-8?B?QW9kRzQzQ2ptNDRrTXlvNEEraytKWFdtRzlsOUw3SGRDMFBVdlhDY3FqeGRs?=
 =?utf-8?B?OHFLaVNhNi84SGdSSi9LTjh3UXBOQ2xqZU45MkJ2REdRWHZjbVFvQkt6Y1dx?=
 =?utf-8?B?QitpR29OVVMwVDl6VzlIZHJ1WmFqZGw0U1VyZzJ5ZlF2c20wQjNJR2pnZVpt?=
 =?utf-8?B?SDcwaEVTL2MrTzFWWjM3Z1RkS3FZQ2FWZGNvYithWTkyRTJOSjBNNjNWV1No?=
 =?utf-8?B?Sm93a1NuZHk3K1N3MDhoR2drVFpmZjl4c3RoQzRuTkJFM0pybHJVckl4RFo4?=
 =?utf-8?B?Si9nVi9wQzRBeFRzL1NRN1hBQlNhWTI0cWI0dlUyaWJQaURkamRMVzRwdGdt?=
 =?utf-8?B?bkVkU2N2NUFJaUxHK1gwZDdMZG9CNFRORm5wSENCaUxCZmxnT0s0M2E1QTdX?=
 =?utf-8?B?cU9MVUpsMlZWdG9aY3ZLYzhUQXZ2NElmMzdTaWQyVXovQXZZL1NESkNGaFNQ?=
 =?utf-8?B?Z3VBcncvZGJGSnZUVkU1ZmdXQ2YvSUpRTjh4ajY1ajIveDV1VEluUEZaOU11?=
 =?utf-8?B?TkNqSUhWOHN6bUJHRkhFWlVTZHVXZmxrQnphYVRWaEYrSVJndTMzeVorLyts?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5b8af10-c432-4c56-5893-08ddbee25749
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:15:49.4353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b5M7Fn+/6e4YiAIgWEYU4pmiaDxnwiA/N30dMSFo38GGqWWBTOIhv25yerGLrZaufGxhH9dtH01woP+HmHKdKpXTY33XjAEGu4+Ik0IB0Ik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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
 drivers/gpu/drm/xe/xe_tile.h                  |  13 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  10 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  22 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h          |   3 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 209 +++++++++++++-----
 drivers/gpu/drm/xe/xe_vram.h                  |  11 +
 drivers/gpu/drm/xe/xe_vram_types.h            |  85 +++++++
 23 files changed, 427 insertions(+), 229 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_vram_types.h

-- 
2.34.1

