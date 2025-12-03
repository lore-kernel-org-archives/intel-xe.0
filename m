Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2ED9D12D50
	for <intel-xe@archiver.kernel.org>; Wed,  3 Dec 2025 12:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388610E13C;
	Wed,  3 Dec 2025 12:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R5002w2C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7545110E13C
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Dec 2025 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764765816; x=1796301816;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DL2hSyrh/lfggnZe3dHR7I4qrjM+ERWtA9LDFbkYRls=;
 b=R5002w2C0RVmaSLme6C5oVf7gRhNMHJyUal1oqh2RPQxVO+wUuoIAjqS
 MqAtsAfmQJ50h2l5oE+7fULncOysvnZAgXhaUNguATiXsKRvvuD6W4237
 /1blnHn95yswiNJ1A1DU4cC1sPYn6HKfykp7psnhqjVKAdewVPGXQkZcz
 CckflDMi6SS2FnyELtO5p4GRM3BuEGXGqoBDRR5v4yaptBaYo9IYP2zWO
 8XOXPeHpeyayTIIHCcmpFSEm2IiDQ01WepfVJSbSVuYuN/kgOcC7aCqT9
 wcnNTsSWxmUKkVgtXbcyj9C0+LW4LxrvTdRxQBFK2bECKua6qB5ClKK3x g==;
X-CSE-ConnectionGUID: lcKV3Tb9TwqkQisdv4fyaw==
X-CSE-MsgGUID: TJMRqeu0QH6adXEwr4MJuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66799054"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66799054"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:43:36 -0800
X-CSE-ConnectionGUID: SK6L0ZPZRB6mvD6NOqEswQ==
X-CSE-MsgGUID: vgHxwktDQKqBvgFGMGtHtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="194693439"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:43:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:43:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 04:43:34 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 04:43:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGdMmC41jSzMRWGQZbwhJn/6zhbIvq00w0E5sLmimN2bzBxgfbcjf2HPDHajrrduUzdUfgq6hOntnxIujNjuVVoOl3wyxw4QFt5p8RTJFBloikWcQvePtkNO3qTYwzyZHLA8QtxAJgsPgyIm0NAJ/w13YHMlNsxjQZgXcGTZKIwDfM5zeG0ha0eFosmP3PUdQm3mM18O4OATgNT9eVqa+N/8MeLFlGiRejvraToVr6b486T1uF6u8+RH0d7UMPRGQM349hXzvPiyxZMPCnpvJbWfsHcSqE7Jmta4+RZ8jw6SD7Kmd9KRBWZWU7IDiL6Rivqx1Oaf+AFiUvwm3RUEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mCe3ITamVZ3Gak38Bcr0c3CgvlFfeN7ksYnicORJE1A=;
 b=KOO8VV3MWDud9Vd6ZeZeDxonoEcYKanhlnOGXGJmqYDFcFvCM4uUhNDeNiF1t566yjFLAVNjYPKUDSXG18loFEqFu/eZjJLWFFImelyXPI0Ngbs5K5JntmW8abyqNicn8y8cWGNigqGAS90VjX03Ctt1yXfF3pB8vtfT++Ogp1BYYNFQdUIlUMJzl9bjemsEu8sEFoYITCkpbzVprP6dtibI/8Ywo3ASPETRErvWMKlRtPUGXarw7tBBGtNzoKnhL6CR3iNxOf8tstqtG4ULXvkbYhnmKzvdY8IfpcO1+EL/AkQGEKmEig3pBTv2cRcNdZjZ+LJiduoqQ+xjOQMbkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6)
 by CH3PR11MB7915.namprd11.prod.outlook.com (2603:10b6:610:12f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 12:43:32 +0000
Received: from MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5]) by MW4PR11MB7164.namprd11.prod.outlook.com
 ([fe80::a972:1395:dd49:1dc5%5]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 12:43:32 +0000
Message-ID: <b6500ae0-715a-4ee6-9cf8-e5ada3a09dbb@intel.com>
Date: Wed, 3 Dec 2025 18:13:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] drm/xe: Mutual exclusivity between CCS-mode and PF
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20251128171759.2775650-4-naresh.kumar.g@intel.com>
 <20251128171759.2775650-6-naresh.kumar.g@intel.com>
 <39541b74-2fe5-47a7-bb97-76e3ff4799ba@intel.com>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <39541b74-2fe5-47a7-bb97-76e3ff4799ba@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::15) To MW4PR11MB7164.namprd11.prod.outlook.com
 (2603:10b6:303:212::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7164:EE_|CH3PR11MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: 0287b776-78a2-4002-6a27-08de32699101
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTlITS9BOU9LTlhHUXFralBwZWw0SFB4S0xaRk91UHREQlBmYzdSK3JkVGpJ?=
 =?utf-8?B?U1JVVjFDNnlLdjloQUxJZis2cU01TkZ3UGNYSEZxSEFoTGJOYkE4Z1dMSlNs?=
 =?utf-8?B?c2FBcnBQbFBXVmxNcHRNNStZWS9wR3IzRHQyYzZjcjFxMmtTdjhLbm9MdlJH?=
 =?utf-8?B?S0FRYW5kWTlPQWxOQkl4SXdTZys2TTFQS0MrQzZlS3BOVkhrS3lGT1hqZHlu?=
 =?utf-8?B?cGxpZjBZaC9CQUlTa2RObkRSMURPd1l6eExEcUFvZ2w0NVVsSDFhcldnSlJS?=
 =?utf-8?B?MWFLM0ZWWHZESWE3eDIyZGJyb1MwNjE5Qm1VeTVYaW56SVVLMEc0Ulh6SjhM?=
 =?utf-8?B?M2lMYk1TejBpL3RlYlZNbmw3NTlpWnJWWGwvcW5Rc3BhbHp0SGdCdjJ4ZVZa?=
 =?utf-8?B?ZC9nSWlDdXJsdVJDckdRSkpFR0tFaWpCS0hpc21yVmJmSHBPcXlON1pCbnJK?=
 =?utf-8?B?ZjgyR2xxNkNYYTc3aTk2WHhselJETFpRcEVNbFJRUjhwbmxXTnpaV3FIYXdh?=
 =?utf-8?B?QXJmQlJVdi9xWU9SMDl4cUQwaXhFQjBBUkdGZkw1TVA5RjViOWhiN0ZZU3JQ?=
 =?utf-8?B?ZnhkUk5IUkRNbllla2tLdHQrQVVZUDNaSkk4ZUg4blU3TmxWc2xsRlEwYTdj?=
 =?utf-8?B?WExBVXFPR21UWEpTU1lIQjkyeXNKZ0FtY2IxZ0xxV0NHVjc2R1FXZG5tZFl5?=
 =?utf-8?B?c25tZUpOa3pLWk9kQzgyQ0swZVE0cXZ1VFR2SHJCcmFtMzFkaENvTm5qYUw2?=
 =?utf-8?B?aHJFcGRiOUdQRnUzZTlPb1ZoaE1XMTVad29UMWxRMXdZdEROSERhb1lCZy9Y?=
 =?utf-8?B?YU9KanE1M1pzRStMRWZhUUgxTjJrUFV3OGQ5RVFoOTlRZzd4dkdnRmhIQmoy?=
 =?utf-8?B?cnl4UFRJUU1oaG1XQ1lKVkw1QTl6VGkvaHk5QVN0ZTNoWnVaY0ZaYlIxN0VY?=
 =?utf-8?B?U1VCTC9BVWZabDdqN0owalhtSkhiSXRSVzR0SkJaelErdlNXeVFVWUorS2xV?=
 =?utf-8?B?amlSRmIrSHlnMFg5b0ZRS1lNZWZBK2U5V0w2ZVdKMVFhVHZia3AxOHdsM0pO?=
 =?utf-8?B?alRhTGtVTUdqQVhhdFJqNER4aDZ4bDc3QjU2VHJlcjlDdFB4WE1YNzYrV25r?=
 =?utf-8?B?SUZ1NWhkSWhQekxlcDNySHAzZE9CU2VpS0lwcUxPTlhnaE90Nm9lLzlSUU5Q?=
 =?utf-8?B?R28xUHROWVQ0TjM3WUVjSWErSlVPZmhnYVdCQ2R3NjRSNVZXRzF6YXpLK0FW?=
 =?utf-8?B?UEY2S2h1UVArR3hISUxGazl4dDhETGQvbVFiNHZlZDlaaGpoTWM3MHF0b1VR?=
 =?utf-8?B?ZXZ1V3NtSGxUT1RaSmpzZHJHQ3ZhNUpuOEIvT0ZVVFMrRWlTalhYUmxqMFNl?=
 =?utf-8?B?blpiZHBJNlBIZFRvUHg3eldGa2lLQ041emFvSmV4Z0hmMGROb0kzelhldGw0?=
 =?utf-8?B?T2pwYU1SMzBWMW5XS3hXZ1BEb2VWQVFhNGl0YVZ5RW0wTVl2TTZyVVo2MUp6?=
 =?utf-8?B?c1hnSkkxOU5KTmZqUWh0L0dDZkpEUXM3NytrRFRpMlBlZzZoYUlDVW0vNEQr?=
 =?utf-8?B?T01CcldnN09QbE9oQUV1S21WekVyRXQzQklQMmo1WWc4NVhxWlF5K0JEYVNU?=
 =?utf-8?B?RHRNeTFySlhCVElBaTV5VjRIR2hLYXlPS2NrbWszSjFCUjdKVDFGVzRJL1dM?=
 =?utf-8?B?UzVYNnVERERRQ2V4ZWFOdTM0TW0vVTZiOVA4NVNuWEdSNFEwRzloRyt1R1A2?=
 =?utf-8?B?aUdOQ0R4N3BwRlg3UVZPS0U2akE3aEZXSHJ5c3V5TUhyQjFvSFBpVVdmWUl6?=
 =?utf-8?B?a1hRdTRaQzd0NTRJS2k4T3NRL0orSzM3ZmwzL2FLMEwzMDFQZWVEeWVNU1dz?=
 =?utf-8?B?QnFITG5UU3FoQ1BFK2JKVk53UWtQN09xU212U05MVFczaEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7164.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFUdWt0VWJWOFh2b2xsV24zWjZQSnh5ZGxqN2YvUXBQcy9GOUt1RE5RTnd6?=
 =?utf-8?B?bHVPaFVMTzg1akJrSDY3c20rNndPQVRHcjcyWlhoVXYrdkdLVFNUMm5lQmd0?=
 =?utf-8?B?UlRzVDdRdVpZNjkrMWxDVUZnTlk5dFk5dWVxT1NqU0FqMTBOZXRMNXlzdnlz?=
 =?utf-8?B?eDA0ekhnV0RtRjY4MWtueEdCYkl0d0N4VVpiT25CcXRoQlZTV29Mb1FJSllB?=
 =?utf-8?B?K3A0WWZFWXdwdkNJUDBZSFZEUkRDVXBWcmM0R3VuUW50TCtDaE5JZVpXVjF1?=
 =?utf-8?B?eW5hQVRmQ2szRTQxdEk0bHRNbjlua0FHbjhZMTBDZmJodU4xYkt5N0xGQnpG?=
 =?utf-8?B?b1F4ZnVDbWxOM2s2Y3YxdTZ1UktqcXYwM1VCNVByWXdtcjZhYU00b1VQSkE3?=
 =?utf-8?B?bGNTa24rb2RBblRWbXR1bldSRTFDZFZyMXpFbHhocHlybVpwT3hGU1FGYUVF?=
 =?utf-8?B?bHVZOTFzb2E5bVF0YzdZdWk1YWxJQ0llT1NBblRtWm1DQXMvdUFaK3NBTXBa?=
 =?utf-8?B?RGNpaGFzOEFiZzhxM0I3cGRCQUxhTVByTkNwYVlDaXZxdU90bHg1L29xaWl3?=
 =?utf-8?B?M1M0WEtiM2NSRWx5QU9udTlIaWJXUlFEUE1HbUl0YWRDUkZVbm9oMUdWaDg2?=
 =?utf-8?B?VVVPR0dVaTNwQktQTmZQWFJza0NSSzhqeTVCNXRpTUltVStOb0RkdlRTMmwx?=
 =?utf-8?B?cjNPWUNBSjdxY2FqVzhMYzRUWUVhNms1TzI4dmNGYW9uYVpZNERyR09Dcm9a?=
 =?utf-8?B?Mitrell3UHRJbUNacG5DRkpIM0dSRDUwN3VtOTVvYllxbEE4NHhPMlRWc2Ew?=
 =?utf-8?B?Z3VEWG9yQ29HSERhWmFFRGsrTHpKWmNMRUJ5TTFmT0V1N0kyR1B0YThmUTB4?=
 =?utf-8?B?RGpydXdrQXBQWTYyUXhyMVNWTmVBLzNoRXZCZURRSmRYK0V1aU9WejQ2Q3Iw?=
 =?utf-8?B?RVhWdTJzeXRPUU0zTHFxek9rQ0oyaE1NS1dGZmVONVZ5dFpuR25WMllkM2JK?=
 =?utf-8?B?MXVsU2RzMG00WWN2UmdWMTQ4TngzTG5KTVR2cFkxSTBpaWdVbTc4ZGNsQmxm?=
 =?utf-8?B?SjVoNGlOTGZiZTRvSWNxekY4dVZEdE5WZGcwaHl3WmkrOVFjajl3Q2pKc0RJ?=
 =?utf-8?B?QlZBNjZJd0ZiZmlVL01Ra3ljcHlUT3IvdnFxWWFWYnFFTlpBTlB6T3psZUZW?=
 =?utf-8?B?TGJYVE9teUxwcGlwRkhhU29PVWV6cFdhdEhzYWNTdEFDdCtXMzAzUEFnRkQx?=
 =?utf-8?B?MitaMkowRjZVV1Q2MVFhaEl4VGJEd2ZHOVRONXJnazdiSGs4WUMzZ3kyUDZk?=
 =?utf-8?B?dkFsS0VhVmlycGN6dEQ5L29HRzQzeWtFczhtcEYyM1R6QjNNZzJxY0o1MnNS?=
 =?utf-8?B?NFRTd2tjRC9DNmVSTExuWWxkV3hlR3drdDdJR0hiWCtBa3NRdGN6ZmN6UVQz?=
 =?utf-8?B?ck4xNk1kdWxyUllsQnRtalhTK01IYjlSdzNLMVVaTDlhM0d1cjVRVEFDZGd1?=
 =?utf-8?B?eTVKYkhWRDEwNDZFYzRPTUZiS05VbGJWTHZJclBWekZUVnVYY1ZTaUJuTzVR?=
 =?utf-8?B?NDRZVTBqR29nNUl4Y3Vmb0x6blRhVWR6a1JSckR5dmZWL3pWTFc3bGZiMzJa?=
 =?utf-8?B?WnUrWE9MMExaWHhETlJBNmliRG9sNDl1MnFYMXhvUWlxLzdieWxyYXJobEwy?=
 =?utf-8?B?a091NVN3elZXYXhjc2lUd1d1aUpOOTRHclpuNWN6d2lxcVIrR2x4aUpadURS?=
 =?utf-8?B?T1ovRXgxSGdBOHRDeUxTQVhYTVJjaWZneExDa3VhK0xnV2xBMERGRmo2Vmcv?=
 =?utf-8?B?L0VDbG5Ld3E3WE1sNHljaW5pMXZMQ3VuTXVMdWxJVW5kaTFoTWdUWEZvQ0xU?=
 =?utf-8?B?SnFzWTd4VXJNSXRZMVpMZ1FNbkJnaFE4RExoQ2k0REluQzl3WFhUWHBtODR6?=
 =?utf-8?B?UkFBUWZLcm5IQjdhSjZWb21HSWkzL2xuc3phdWFwQU0xNEpWK2lEWjdqNjZT?=
 =?utf-8?B?YjBCS2Vyb0Q0QXMrZzJERGhJelN5WjJvdEVQaGNCUmlEVDJYTzJiQlc4UlN1?=
 =?utf-8?B?MlE1UGJhaHJRSjVBbkxiWkJDUnYxT0N5NGtPZ1NIeWRyWVc2U1BZWS91N1hV?=
 =?utf-8?B?M2JOTVhRVGh3TklJUmppbERLdGppc2VQYlo0MGI4ZGhuN3F1SjJCV21YT1R4?=
 =?utf-8?B?Qmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0287b776-78a2-4002-6a27-08de32699101
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7164.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 12:43:32.1999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uV5nJ54N/wDOxoE/T6QuubXHsB/QhtWfo22V/OIV+mpc+DYdBT25dJY7VNM3XfV3s2E41N8eJjQEQgCqivaoqs8/3mOXCCMaDj9H2IJ6lB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
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

Hi Satya,

On 03-12-2025 14:22, K V P, Satyanarayana wrote:
> 
> On 28-Nov-25 10:48 PM, Nareshkumar Gollakoti wrote:
>> Due to SLA agreement between PF and VFs,the alternate CCS-mode
>> cannot be changed when VFs are already enabled.
>> Similarly, enabling VFs is not permitted when the alternate
>> CCS-mode is active.
>>
>> Signed-off-by: Nareshkumar Gollakoti<naresh.kumar.g@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 59 ++++++++++++++++++++++-------
>>   drivers/gpu/drm/xe/xe_gt_ccs_mode.h | 12 ++++++
>>   2 files changed, 57 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> index e146e00b0ca2..6652c468e1be 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>> @@ -13,6 +13,7 @@
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_mmio.h"
>>   #include "xe_sriov.h"
>> +#include "xe_sriov_pf.h"
>>   
>>   static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>   {
>> @@ -108,6 +109,36 @@ ccs_mode_show(struct device *kdev,
>>   	return sysfs_emit(buf, "%u\n", gt->ccs_mode);
>>   }
>>   
>> +static int gt_prepare_ccs_mode_enabling(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!IS_SRIOV_PF(xe))
>> +		return 0;
> 
> The ccs mode will not be enabled for native mode (non-virtualized mode) 
> with this. It should be something like
> 
> if (IS_SRIOV_VF(xe))
> 
>          return 0;
> 
> Same comment for other places as well.
As no CCS-mode sysfs entry for SRIOV VF Mode[1], no need check for VF mode.
[1]: https://patchwork.freedesktop.org/patch/691098/?series=158222&rev=1

In SRIOV PF mode, use xe_sriov_pf_lockdown to block CCS-mode. If VFs are 
  enabled. otherwise, CCS-mode can be allowed.
If not in PF mode, it is considered as Non-SRIOV mode and the function 
returns 0. Therefore, CCS mode is enabled without any restrictions.
> 
>> +
>> +	/*
>> +	 * We can't change CCS-mode when VFs are already enabled
>> +	 * and we must prevent enabling VFs when alternate
>> +	 * CCS-mode is active
>> +	 */
>> +	if (xe_gt_ccs_mode_default(gt))
>> +		return xe_sriov_pf_lockdown(xe);
>> +
>> +	return 0;
>> +}
>> +
>> +static void gt_finish_ccs_mode_enabling(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!IS_SRIOV_PF(xe))
>> +		return;
>> +
>> +	/* Allow enabling VFs, if CCS-mode changed to default mode */
>> +	if (xe_gt_ccs_mode_default(gt))
>> +		xe_sriov_pf_end_lockdown(xe);
>> +}
>> +
>>   static ssize_t
>>   ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	       const char *buff, size_t count)
>> @@ -117,12 +148,6 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	u32 num_engines, num_slices;
>>   	int ret;
>>   
>> -	if (IS_SRIOV(xe)) {
>> -		xe_gt_dbg(gt, "Can't change compute mode when running as %s\n",
>> -			  xe_sriov_mode_to_string(xe_device_sriov_mode(xe)));
>> -		return -EOPNOTSUPP;
>> -	}
>> -
>>   	ret = kstrtou32(buff, 0, &num_engines);
>>   	if (ret)
>>   		return ret;
>> @@ -139,21 +164,27 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>>   	}
>>   
>>   	/* CCS mode can only be updated when there are no drm clients */
>> -	mutex_lock(&xe->drm.filelist_mutex);
>> +	guard(mutex)(&xe->drm.filelist_mutex);
>>   	if (!list_empty(&xe->drm.filelist)) {
>> -		mutex_unlock(&xe->drm.filelist_mutex);
>>   		xe_gt_dbg(gt, "Rejecting compute mode change as there are active drm clients\n");
>>   		return -EBUSY;
>>   	}
>>   
>> -	if (gt->ccs_mode != num_engines) {
>> -		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> -		gt->ccs_mode = num_engines;
>> -		xe_gt_record_user_engines(gt);
>> -		xe_gt_reset(gt);
>> +	if (gt->ccs_mode == num_engines)
>> +		return count;
>> +
>> +	ret = gt_prepare_ccs_mode_enabling(gt);
>> +	if (ret) {
>> +		xe_gt_dbg(gt, "Rejecting compute mode change as VFs are enabled\n");
>> +		return ret;
>>   	}
> 
> The function gt_prepare_ccs_mode_enabling() never returning non-zero 
> error if VFs are enabled.
That is not ture, gt_prepapre_ccs_mode_enabling() return 
non-zeor(-EBUSY) when vfs enabled.
> 
>>   
>> -	mutex_unlock(&xe->drm.filelist_mutex);
>> +	xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>> +	gt->ccs_mode = num_engines;
>> +	xe_gt_record_user_engines(gt);
>> +	xe_gt_reset(gt);
>> +
> 
> Do we need to apply gt reset after changing CCS mode? If yes, add a 
> comment with why do we need it.
> 
yes, ensures clean state as we modified new CCS mode for engine setup.
> -Satya.
> 
Thanks,
Naresh
>> +	gt_finish_ccs_mode_enabling(gt);
>>   
>>   	return count;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> index f8779852cf0d..53a595b0882c 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>> @@ -20,5 +20,17 @@ static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>   	return hweight32(CCS_MASK(gt)) > 1;
>>   }
>>   
>> +/**
>> + * xe_gt_ccs_mode_default() - Check if CCS mode is default (single CCS mode)
>> + * @gt: GT structure
>> + *
>> + * Return: %true if actual CCS mode is single mode, or
>> + *         %false otherwise (CCS in alternate/multi mode)
>> + */
>> +static inline bool xe_gt_ccs_mode_default(struct xe_gt *gt)
>> +{
>> +	return gt->ccs_mode == 1;
>> +}
>> +
>>   #endif
>>   

