Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48ACC83F12
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF1A10E7C8;
	Wed,  9 Jul 2025 12:16:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ECdBPnam";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6D010E7C7
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063365; x=1783599365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=MoG0+oQObD+yNam2iOlTGIVb4jJ5iyFkWw85Sz8AwJA=;
 b=ECdBPnamVIamhiUjQcmcoDz8zK1SuCz6STZfTBlRWTSAQ723uwjVq27d
 vyxe5QTnMiL1Yo1dRMUNCRtYaxFFaK2Zk0Xi085fwCmPoyO9LcPbbxNl7
 eMLOecIVn0fKdyD8qAwFJQIlE+xFKx89y5HfvEQ74bQnHmUaxvE1rL8+m
 Dfh30jyYcuW2dZS3MNRrXpdvP2K0tOyN6o49AVYxbhTqfsnJ9V+S9FIr8
 nwsAkcQmqzNQkoithf2el0RZDX6wGrY4BERVrAJzDWTCqwlxnWBUu+kMZ
 y2YvSWStyScpsHJ2VwYCLdYmXezHn/vf5bbc3IUvSCi486felNLDZjEAZ Q==;
X-CSE-ConnectionGUID: 7sfJGZBpToqMHkVQfzZwSw==
X-CSE-MsgGUID: h4s1Xrk1QzKozl9py6PBDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54466496"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54466496"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:05 -0700
X-CSE-ConnectionGUID: mdlUnaMWTR6QWzDveIC/xQ==
X-CSE-MsgGUID: PGFuJ0cyQeqFsxsAcRH5lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155848464"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:16:05 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:16:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:16:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcLnNH2QvAysj6e2FDX2hrIQq5ko7sLxuWUZBR++F+mwTxG62eoRhEOFB3mc1dSUYHHqLuggIZ/kMUMm+034Z68iCF9TA8zIZKDupunPXUH9xrl7tct7OIi4Gzb7GoA2mJ/H7pAXJE6cyi/cBW/JqwZVCY/KM7kD/POPoNfDhSzB1/ybrGsSbDyceILlvpkqEmlsd0B3IbOyuuOwHzG5xgBHppVHK3iMwIw9pd4lR4bNlgZpFjmCLY34SlKQy/OkjUp1RlLDpGwzhA8UetxPrgqZ+b0W0HF+wlJoKyMUNeRr+p+e4unGBrH6Nk8zCjthVasND3J3+g5bhkTLNnBNew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c8VwWOcps4BGBppImCzbOuTOYPqEkxZ5GcTufjcPN2U=;
 b=StAEr0qZyYRNmJ/yQfKOHcU6Px/Cb7M3P9X76meDBzaZmoN/LzbrOAI1R5scawcbMtY3dQipIeSbu7XhX2RDu6qALUYzU83+ETJT7lXIOIzbwtTu+2ETunGlM1MW2iT1tfpMJucVCSh0tJBCKZLtnYEfC+7mdHxNVJkkEsB+r7caq2D+I72TjCqGz6tDeE3ZJfCNtGPpTzzXY06zK5VbOxgGsgcexBHdHlBycvncywZ0ZZ/OHcgu+5SFMAeTmdaoc1rgsWXKf+t5gQSRt0QtRElAP64yLxtqC2SwRJFzZmZ3FkiUWYxOjRKoX90Ut1fql1lwIjlxtUP2c9cy0botvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:16:01 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:16:01 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v10 4/5] drm/xe: Split xe_migrate allocation from
 initialization
Date: Wed, 9 Jul 2025 14:15:42 +0200
Message-ID: <20250709121543.4129807-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0023.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::28) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: d51a269d-c10e-4d34-8078-08ddbee25e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEU2bUFlTUdLNmp5SUtZSURuSUtlZHZRR3gxc0dONWo3Uzlib1JBZlpwL0E0?=
 =?utf-8?B?RElsQ3U5YjJzSXdjVEVybEZWN3NXQzllM2lTbDdRTEFFN3FPa2t4MzlSSnJr?=
 =?utf-8?B?M2k3ZWFuZEV1R0pkQlAydFoyRkF3aWc1RjBDVnpNOUxrOWhUcU9iUWNwaHRX?=
 =?utf-8?B?QVIyL3Jkbk55ZWRDNXo5VjlvNWF3UEJWWDlWektnS1R1MlU0QW90Rko4RWFw?=
 =?utf-8?B?aktxTDZmM1VxWEV3Z01vWVJqL2ZqbVJYVUpXK2NxMDBvVFh3dmY1NlhiWkFi?=
 =?utf-8?B?ZlA4MUNVNG1BQU5rZDZIK0wxeU00U1NqYmFOMXlWdytUbElPM1M4a1NnK2xO?=
 =?utf-8?B?cS9wNjlUTkVtVE5NREpPUFlrMFJKc2FkYm5seWd2RGdRbTZEbVpOQys0ajQw?=
 =?utf-8?B?WXdVcG5Ed3dIeGFjcDU4N0xld0o4QllrQk11d0FNam1RU2M4MmN5cU9EL0Ru?=
 =?utf-8?B?NDZJQ3A0QStlUlNlOGhJSzBPNDg5QkZieFhUa3JidndTNE1ZR1F4azdqU1ZD?=
 =?utf-8?B?cVFZOUIxQzc1WnIvM1dUaXlrSXQ4aEJ3dlVxSXhZT0lFVnVIU3hkdi9ZL0hh?=
 =?utf-8?B?RFRINFN5elAyWVpyVWhsUlpydWl4clVLR2VOaXByblRDakVHR1R5RUU4Q09X?=
 =?utf-8?B?bVc3ZmIrRlVBeHhOd0h3di9WeFJkNVBodXlGWW41TEZ1SUhWQkZ3LzJvVG9E?=
 =?utf-8?B?bVJYTVZxaVhGYlhlRnlIN1AwZTBwNHFLSGVweHhXcmgzb0N4VnJGdllZT1h0?=
 =?utf-8?B?aFUrS0l0Y3ozSURKYTNBU1NpUlE1ak4vMTNXbmEvazNTamhBVTNGVXFHdkQ2?=
 =?utf-8?B?SUV5UkNYSVVhSUlYWnlPSjMxNUxjUjc4VVRVQldFdHJHcU8wRHJmOGFYZm80?=
 =?utf-8?B?WExmbmo0aVFOa1p0cHA4dW9MUWhJSFJHRmgwK0hiVkpqOGNESEhBaWJ1RUZY?=
 =?utf-8?B?UTU1M2VGQ0RiOXYyNVZMUlhSV0pVYnd4WnB4QmVkZkMxS0ZzbWJCd1FpOG9w?=
 =?utf-8?B?MmdueGxJYnFKR2tmNndoem1KakxrZWxZZlIrelFUd2tzU20vSU9EU3VpTzJH?=
 =?utf-8?B?SFAyQTdlL09MV0FGTkVEQ1VWbCtoNTZzNjRLVjFYUWJ0bEtsZVhkVGtCNlR6?=
 =?utf-8?B?VG5ZTi84TzdKelZCc3pmcndaWXhkSXRLVVo1Y0N3QTJCODlxbDNIQTBnQ0l5?=
 =?utf-8?B?WnNuRzN1Zjl1azFTengzYUMxMHRKaVdrQnNodVNyN0NueDdXZkkrQ2hxL1pI?=
 =?utf-8?B?dlZRQk56T0NRTDV1c01rNlFXZi9RdmVQVXVlR2VPT1JCa0lmeUpoM01lb1ZI?=
 =?utf-8?B?RU9vU1IzZUlpZDJ0aStxa2YvYzg0MjREWWxCN0pZV1d6SlNFTmQvSzl5WitI?=
 =?utf-8?B?UFA2QlZISk0xOWY1RXczR28vYXJYcEd6SFNLMDJDaFl1Vk5sdndra1U0SnpV?=
 =?utf-8?B?MXBJREhZZnRtc1kvQmZkbEhmeWJIVGVBNUJ5ZVAydkdSaEFPU05GOThnOWRv?=
 =?utf-8?B?dWdRbEZkaTFVUjdEcGQySDRRZWYwM0NsVjZHOUc5MjVLdFRoNEFYTk1malRG?=
 =?utf-8?B?L0VnRlpra1RvdVJGVHV1S28wMHA5ZUVwN3Zoa1hJS0hyaVZ0UHZjcG1STWha?=
 =?utf-8?B?VU80ZVRFd1kydEY5VkZtY2NBeDJoNEcxU3grK2EyT3h2VXBzTTRjQ3MzcnA1?=
 =?utf-8?B?b3p0V0RlbnU2dGxYM1Z2bndFSnkrcWhMdFVOVEpmUVhjWFJ6ZFhSbFJjNm9s?=
 =?utf-8?B?L1RXUHNML0xuMVFVaitmeVE4eWQ5TlFzaVVwSkxML2hOaUxGMVozeEJRNENZ?=
 =?utf-8?B?NXhIcEtIYmRqeURweG9PNTUxUHhSQm1TTHI4dTRQYWlkdzEwd0lwTm5xd3hE?=
 =?utf-8?B?N0wreTFXbEx2VnQyQ0ZBZVRUZVgrVFRvZC9xRGo0MlFudndFeng4WVBGbXZW?=
 =?utf-8?Q?ZRPM8QJTRYU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnVLVGlzNlo1ME1sYnNDV2g3dVozZ2V4NGN2YjNWMzVUT3BYTEZpejZRSTVJ?=
 =?utf-8?B?UnozRUgvUFBKSVQ1alMvT0piNlhvU3E3SWIwSWVlQkNvaW9uV2pUaWRXVlFw?=
 =?utf-8?B?eldGMFRlY1hQblBVYTRFU2NWVnhjNHBhWGlQT2lMenoyTjVpOUt5Ly9iVVZR?=
 =?utf-8?B?Ykt5ZDl5SmZFUTlrbmE1Wnc4OWp1V0Q3azJ3VVM4a2VXSUN6TW14UktvNmZV?=
 =?utf-8?B?SkhIUmFxWHZMK2Z3L09pRUJGeGJJUm4yWWVSNTdUNURSL0J4dUJmQlNMR0JB?=
 =?utf-8?B?b2NlL0pvTWtuRFA1NlhlcWxUc2FldW5vUXBydU1xd2lFODR1b0UxbVRqWWk5?=
 =?utf-8?B?QzYyM2thVHlxdUZKRnV2djZJcUxMY1V2by9qVnVsODR5L3RGZkhpR3lUVG02?=
 =?utf-8?B?dlEvMnJsVmhnR2FHRGg1NkVnZVFyS25aM3E0bndPc1daSTRWdmVVU2dKZzdW?=
 =?utf-8?B?eHBQWlVMLzh6aUZCWm0ybjdGdm50cGJoK00zVFJYWVo0SFBEQS9YOGplZTNG?=
 =?utf-8?B?UmR3dE5hb1lrZWs2V01MVHg0Z1BJS0FyV0VqdUVFckVWTXNEbFlTTHVjSXRx?=
 =?utf-8?B?YlpIOTdteVVRWE0yQzJuUzlWU2c5YTR1VDZBcjRqNE9FZi9tYXZGY2tsRzBG?=
 =?utf-8?B?cFlIemhzb2d1UkJrSlRsRFNrc0l0dXhsZSswK20yN0N5M0VpUTdCcWFtUCtr?=
 =?utf-8?B?azdvZVJia1lVV2RURkZPdzR0TTcrOG9BZDR4VkE0V0o1aFRDSWF3eDJDOGRm?=
 =?utf-8?B?WXZhUDBLTTJjYU9teGVtMFNEL25KaWxIT3pzSXJsVXJMWkZLWXlhTHAvbnFa?=
 =?utf-8?B?UExHcUppU0M3NzVDalo5MTdObU9xeFdibDZYeWZDaytYY3ZwdmFIUUdYZzVE?=
 =?utf-8?B?dEFjQ2RuRzc1Z3JOaVVtcHk1V1JEMXdRVHIxcWZNZXI5SlZSaDZTb0M3M0ZQ?=
 =?utf-8?B?TFd1UE9VWmhBS0ZLSkVBRjdXVFpubGdKNyszZmJBcC8vV3k1RmxtTCtIZXlU?=
 =?utf-8?B?UlhZemt1Q2hjL0RrenV5WEJyV1dOY3VXY3V0RCt5em16VURFT2pqTkk0WXhL?=
 =?utf-8?B?c0ZZU1VsMElvMGkrandaNEhkWjdjSnYvTE5od0VIeFJnN1I0WS9rcHE2Q3J6?=
 =?utf-8?B?bHV3REppRGdJSlVYc0NGSWdTSVByVUhKOUNZaS9Nb2t6MWtkSXVFLzZmWXhs?=
 =?utf-8?B?K0MvRzBVNWwxYkUramNPb2xDSWxwemx0cEVKaStFZkxvcXFkb0liUHZkMThU?=
 =?utf-8?B?K1FmV29UYWh0RmdKR3ExUUt6UjBTa2pKQ21BZUtxRnFCbmtLWnFXSUprb0NP?=
 =?utf-8?B?ZXpGSXdwOXNCR3ExUjJqY2VUYjNrNWExZFdqeFQ3U3VmVG5Lb05VaGh3MEJj?=
 =?utf-8?B?aXVqQWE1dC9wK2hEbG5INFpEbFNnYmV0dGhscHF0U0o2a1loQzIyVGV6OVBr?=
 =?utf-8?B?ZDBVSmEwWTFyRkczMEhUeCtkclphVWZpYXJPd3Y5VG85eXdhRERTbFZsV0tT?=
 =?utf-8?B?VERMU21BQlNpcjZFZWMzS2tCcHdiMm5GUTZtQ2cxd05jLzc0MTRqbDRVRkVH?=
 =?utf-8?B?ZGh2bm9hcitab2k3QlNRN3RvdXdlN3pnYWhJblJXMGFRMzBCZDMvOHVEaVQ1?=
 =?utf-8?B?eDNzbk53bFJxTCtsQ3MyaTdjNEpCcnhrUnU3cWdDeFU0NjUxQTc0U3Mwc2Jv?=
 =?utf-8?B?ZldCNEl6NzJrS1hXdTBBMkxkbU5LbElpTEhKaEY4eGNhbzdOQy9NRy9RZTM3?=
 =?utf-8?B?VXVVYWx0NUgwY2tCR29vb1dxNXVJZXVCWCtjN00vLzRxcmJBNzZkNlRRRGRV?=
 =?utf-8?B?eWFicTREZk0xRVlnTm5tT0M1dmg3aXRqaU13L3A5cEdmVHRHengxRHF5Tzhu?=
 =?utf-8?B?YitNSTJzbHkvOEI1MmFZQXBTa1UvMktuVmxHSU9ONzI4UCtRRHVnQzR4Q3J2?=
 =?utf-8?B?SU5yLzNJeG8xYnlORytNdmhLZVd4VjlvMWgxdHloY2Y0NCtwQ2ZZMEpUL0Mr?=
 =?utf-8?B?dk1pUjUrUHFzcjZZSWJLbHNMaDd3bERCMlBGUEFtdzMyUmNKM2JZM1RCSXRW?=
 =?utf-8?B?TWtSSHZmclg0cmpqcUY3ZkdhU3J1alY0THVrTkw3K1BCWVZnSkZwRDhnR0Ju?=
 =?utf-8?B?bEVPbkdYQk1hUnA1bnhHeTVqdEpCMFJ3Ym9CY3lxcW1SWEZNN2JialRVUG03?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d51a269d-c10e-4d34-8078-08ddbee25e71
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:16:01.4076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9c4DvpkB82ZOCUekW07/PzPrPZBOJFqrIaXKmqBjXFaiH26Lz4sNRjurhEQD4k6rm8eaLle8rFGHd21rqkgeVnl7R7fkECTLchYObndnxKo=
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

Currently xe_migrate allocation and initialization are combined in
xe_migrate_init(). This creates a problem because the migration
context cannot be passed to other objects before.
Let's separate allocation and initialization so that we can pass
the migration object pointer to other structures before initialization.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 25 ++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_migrate.h |  1 +
 drivers/gpu/drm/xe/xe_tile.c    |  4 ++++
 3 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6272e2bb0482..8ba62c5a39a9 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -389,6 +389,23 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
 	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
 }
 
+/**
+ * xe_migrate_alloc - Allocate a migrate struct for a given &xe_tile
+ * @tile: &xe_tile
+ *
+ * Allocates a &xe_migrate for a given tile.
+ *
+ * Return: &xe_migrate on success, or NULL when out of memory.
+ */
+struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile)
+{
+	struct xe_migrate *migrate = drmm_kzalloc(&tile_to_xe(tile)->drm, sizeof(*migrate),
+						  GFP_KERNEL);
+	if (migrate)
+		migrate->tile = tile;
+	return migrate;
+}
+
 /**
  * xe_migrate_init() - Initialize a migrate context
  * @tile: Back-pointer to the tile we're initializing for.
@@ -399,16 +416,10 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
 	struct xe_gt *primary_gt = tile->primary_gt;
-	struct xe_migrate *m;
+	struct xe_migrate *m = tile->migrate;
 	struct xe_vm *vm;
 	int err;
 
-	m = devm_kzalloc(xe->drm.dev, sizeof(*m), GFP_KERNEL);
-	if (!m)
-		return ERR_PTR(-ENOMEM);
-
-	m->tile = tile;
-
 	/* Special layout, prepared below.. */
 	vm = xe_vm_create(xe, XE_VM_FLAG_MIGRATION |
 			  XE_VM_FLAG_SET_TILE_ID(tile));
diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
index fb9839c1bae0..74c60f55004a 100644
--- a/drivers/gpu/drm/xe/xe_migrate.h
+++ b/drivers/gpu/drm/xe/xe_migrate.h
@@ -93,6 +93,7 @@ struct xe_migrate_pt_update {
 	u8 tile_id;
 };
 
+struct xe_migrate *xe_migrate_alloc(struct xe_tile *tile);
 struct xe_migrate *xe_migrate_init(struct xe_tile *tile);
 
 struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index bd2ff91a7d1c..171de6a4ba95 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,6 +94,10 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	if (!tile->mem.ggtt)
 		return -ENOMEM;
 
+	tile->migrate = xe_migrate_alloc(tile);
+	if (!tile->migrate)
+		return -ENOMEM;
+
 	return 0;
 }
 
-- 
2.34.1

