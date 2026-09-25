Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B1C98321
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 11:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6884E10E214;
	Fri, 25 Sep 2026 11:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFcCeDno";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BC410E214
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 11:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790336564; x=1821872564;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=zjJbf9IXEuwgTpUAtGUF2/fMTyZ8bqypfnL13KdxH2U=;
 b=HFcCeDnohjTepvkaQQMbdhWT1ZSwCZCFaTzRu3IVsDA8ZQ/lsjPkmvRP
 s54O2NmiGBdGHTLhR2YbmGI2m8bKdEFJIrifrOF9dUa/qxGFPc+JtYdkm
 5YvHbGeAVzc+tZefqdMehAWMfwuYth3yMLU+bhkCsqFwXAQVBsZky/byb
 IzzeYtAJ3vHRo1k+ABQ7XbN/Kn9CDO5B4xNcNQQTJI1psp3g7xg/VHPrq
 xRwmgXRZMB+RD7zaNVGwJrHoypOSQWT1fm8sp2Vj9ZuMThOQ4ELMvfkZR
 NFRM4y9Cp0ASYu/ywOLECpfbEOvDNeAqnem2jVtzfNHPA96DMcMzhxkMh Q==;
X-CSE-ConnectionGUID: l7kbkYF1SVODddoIX2deiw==
X-CSE-MsgGUID: 1tl7ql2oRiyy1zMK3YEQqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90984336"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; d="scan'208,217";a="90984336"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:42:43 -0700
X-CSE-ConnectionGUID: GpGQAmCUSPCyIM8RsMerzQ==
X-CSE-MsgGUID: mxgf4cMDQku+fSPguhnksA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
 d="scan'208,217";a="302260454"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 04:42:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:42:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 04:42:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 04:42:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZ/wRbS7AFCrhvt2/T0KHieY0wUuILXJRj6lmJzaUeuXRv6leL+1niMCiRKoZIhqp/ZIBGmXuiKEEavskoz5HOFMD4wnZPnZ9dFb+UH6+44J854A5pWIZr5bYnforgIbzGmeAZqoabuA/hJG+83YHWYq6Onje8KWBX+aSem4O9OAZqo/+92AmBVnKuptk3oO/y9G3mz91i26wLZw7JROl5Bhsy1XlSTuCfoaPD7umhOu7T0o5tqL98HSqFyNwpfkUB4ljc3iFLZP0HjrIWA6I1uJwkEFGDfLX6BXc9ojs3uXKsonIjb/BWiOZMQddV9zFIyQRwkBmcXzJyZuansvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aGo4pTNWSQPkNT1/kYKVrWaiqcwnslzxJ8Zw9z9Xrc=;
 b=W9KBZsG0dk5LdNqdmG3211/xuEp4pDy73Fw8Z/YAdqH38V4Z2RFXsl29dzNT4vfuKAfhU6PjLMEuY+kixz4bBbvhK/QpvodNu9Q7Y6XTiYYxhv1IWkt8p9bG8lPJN+yOE0UPYVfkig6/lXHgdSzqo8fd3B0DNq7MR6pDrBEON6mqWH9ydE92NwH1zzpcQiy1UBEfpBe6el7lZALrXYEER1YXTWyhbu4hJrCApGvVqgb8Ll+qIEFXO4hJX6iJ/q9vJIl1J9lDz3xQ/ty8x7EjPEanMsQzx+gx+DIIwDLQlPt5gxbYXFJ2VK5LwjmvnwAQM2x9yHB0FM/bMAQLMcEdmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Fri, 25 Sep
 2026 11:42:34 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 11:42:34 +0000
Content-Type: multipart/alternative;
 boundary="------------1o8KKljhAKiMXn2L8hzdZuKd"
Message-ID: <1d1011d0-c264-4b8f-b376-ea16c34fa54b@intel.com>
Date: Fri, 25 Sep 2026 17:12:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/xe/pf: Explicitly use shareable GuC IDs for
 VFs provisioning
To: <intel-xe@lists.freedesktop.org>
References: <20260827105750.1248792-1-piotr.piorkowski@intel.com>
 <20260827105750.1248792-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260827105750.1248792-5-piotr.piorkowski@intel.com>
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH0PR11MB5126:EE_
X-MS-Office365-Filtering-Correlation-Id: de1d3c0f-b8d4-4475-8d63-08df1afa1705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|260925021311599003|260925021911599003|10067099003|56012099006|11063799006|4143699003|8096899003|22082099003|18002099003|260925022911599003;
X-Microsoft-Antispam-Message-Info: CsG68J+YtLK4PGrts99ouvCpsSv3Es5Qa7Zmqnd/6PPyJj9Fvx2iUDMueAzmVXABZcz4hPj4jTFEvnuR9A8WP7xELrdyAgMyInVrmDI8D2RAPULMTyz8v+pIadIjcasA3mnf/oJYeDftk0P9ZjvmZf89RrHgzZ4AlU/CmBhZkV8fxvKbKvUHwBozXFLuf5SVRCYPeKK3/SIMFD4Uuh4ofAWFr20A/yWYBy5dAWYaVQU3RMKBidBv100nU5e0Avrhd+F5rMUa54rSaBmRdANECL00bWFilkWxWxTfXoKnyj9LDMfvkBudt1IEGN6IymHtK00cFVeQhiSZ9rrybcbbTyu76vQr7jhD3m0uVMNrIgutAFTBjUDhYk9lkXp93zf22nIOm6w2QME9JmBhB3aITziFxz8M6i9KvDuYL+xPOFlxEj1wD2BSg+mgtnLu9r8UkrpFmDYJkWu5GDuE+KxfPYyjnPgLQ5usKExncEO0a4fzRSlnNIzXVaFQhXR0twoY0ejY21oYDwp0HI/gkIS+ijMxo8gdDW5fwT/xThwAeIPAvXbF0LqlRHMdpLT09s/FIyuZzwLLVl3Iqen50CWfUsbiHLUhHp8sN5hVKPlJ1hTrvOb7/E7CkcIGHM7/lUJAmnKhe8+9os7rLuwoRncerW5bUvyDOwstDEfP+hgmBoE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(260925021311599003)(260925021911599003)(10067099003)(56012099006)(11063799006)(4143699003)(8096899003)(22082099003)(18002099003)(260925022911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHFHRDBKVlpQdGhmejBhaFdiYVBvSE8xUDJSRGF3cG9OMkFEUytVeW1mYXQv?=
 =?utf-8?B?OWJ0OXo2bkxuMkN5ekpkeXJJT3IySklBdGxXUG9WUnAxZzdMYkYxdXJqTDJB?=
 =?utf-8?B?c2Z1eHZ0QThUT1FBWllyby90b3ZKOGtNeWtFVTk0VFBvZmkvWGJqamVyZ1ZF?=
 =?utf-8?B?ZVM0cnV5YS9jeTZQa0Y4VzFYNTRDczBLQWlOWlhhdWtGclZKSHhsY2RBbTF5?=
 =?utf-8?B?OUZ1YW1YMkVoRmkyVVA4UlhqODNrLzU1VGVBUFF4SWZFTHVqV082Y25iRTho?=
 =?utf-8?B?bThoTWUzM3FvaG1oMkNlK2NNNjRRbFRod2EvTHdwMm9xZXBoOWgzaGRuTDhX?=
 =?utf-8?B?aFJWNTRCbGM1TXlFb0lGU0M1TjJGck1LeW96K2FwNzZycXMvSkpGVFB6VGw0?=
 =?utf-8?B?UXZGMU41azVvdncvQ3JJN3U4WTNlRzVtWXBIeVdZT2l3Mi85OS9EeWNnZ3FD?=
 =?utf-8?B?aFJDWDZtdUhkUUhXemwxMkRzNTk0Tm9kRmdQUzZGWnpkVFRSVWhWampiUzlC?=
 =?utf-8?B?b2ZXYUI1REduRkwyN2RZZGcrcTk2Q2lLcFRqYVVmWHRXZGJZQmdQT0F5Lys4?=
 =?utf-8?B?aXA5Q2h4ajVvUkM1VnUrRXJXdmMyYmtEK0Vpa1JEME9xRVF1ZnIzM1M2ZW9l?=
 =?utf-8?B?S2l5WUtPV2ZyV3lDVy95bmFyb3ZmUlRob1FFSXkvd2xpdmVia3ZnV0ZXck1J?=
 =?utf-8?B?Q2tnM2xHNG9WWGhNbmxhbTBCait3VkZXaFo5enJhUHVtVnN5a3J2ejE2eGNo?=
 =?utf-8?B?bVV2TU1nd1p4eEVGTG4wbS83TFErTGZydjEyUTdpOUVQWi90bTFWNlg0eWRR?=
 =?utf-8?B?dnBEMVp5M1dFNlY2c2dOVm9vNnFXNld2ZElMWmdVVExUZExiUWovK2VlSE9p?=
 =?utf-8?B?VkR1TC84Y3FnNFJ3emFHOTlIRTk3N3pWZE8wc3AwR0h0dVFyRXZ1cmxYU1Qv?=
 =?utf-8?B?OHhucjRxdHRUamRwN2NrK0JsbTlIVnpqeFMwbCtoanVVUTlFcDZSUmVRZmtK?=
 =?utf-8?B?UmpUaEkwZVp1OHFETytxL0tDRVBDa2hCMVhpZUZSTk9mcGtRU2kyZG4zQTkv?=
 =?utf-8?B?Z244U3pDbFcwV0ZyVjN4ZmRtVmhOcEVEYkZGK2F6M2xFeFo5TVpkMkZRdElo?=
 =?utf-8?B?U1JpRHJSYXhlYzZ2dzZlcnJEeGVUTGFjVVFReVN5SlhrN214Y1JGUm1WVVdi?=
 =?utf-8?B?VDVKcm03NjgzTGJjcmxnT0F4bDFtWmwzK0xtR29vTENoK1REQ29yeExSQ2xw?=
 =?utf-8?B?dGl4M2htOUYzUHFFTDc0L1FjdnFxNVRFVFdQajZibFppSWNIeTIrSlpWRC9E?=
 =?utf-8?B?eTZtSm1mc2FsbGJScVhBK20zT2w4T2gvTjhLT3FwNHdqcXBvbjdoNTBEazV0?=
 =?utf-8?B?a1lPRGJjK2xmY1JtTTFhSTFpY3FtNkxZcXlYYjhDWnlVRUE2aWR4OHhORlR4?=
 =?utf-8?B?bVl6Mlc4d0M4dHhVb3NlMEZWdCtGenFCaXRJTFhYQXhwTnZxL1RZTjlrWGZQ?=
 =?utf-8?B?dWJlUEtsK3dzT1JZQ09KVVBkYm1LU3VNNGNqTHRNejRPMlRGVjl1T3BXUWc1?=
 =?utf-8?B?N1pydFJkNWRZU2QzNG8wZndLejBmMmlDRXZrbGtXajRSd0oyNmlLWGxIVWVP?=
 =?utf-8?B?dW96UFNjWTJVaUF4K3FzMUswaThIeEVETEh6RDcrSlJXQTBGS0JXY2dYL3g0?=
 =?utf-8?B?SmVRb3RlN0dZc1B1MUNPZkFuK2pPRlBZVk5LVHJNOTV4QjducHFGeUJIaXlL?=
 =?utf-8?B?M3MxZU1TRnpuYThiOFRoQjhna3grRVFkOEVKOEN3bGttOFc1TFczYnZCcFJj?=
 =?utf-8?B?azZpSktFMlNoWnprUUlqM1h0REQvQlBJR05ZUHhqWWQ4YUpwOEpiRjA4aS9R?=
 =?utf-8?B?QmlldnlSOGptZGJXbWFON1lCQ3FHNHNMbVRtZUFJUkJoMVRyWjRjTnhZRUl4?=
 =?utf-8?B?M0VpY0ZkMXZFcXpMa1ZON3VvYWNrdzQva3JUeUN2SW5iK3pTSmRzamZxNFpG?=
 =?utf-8?B?MGFLRU5kQzRVRlp3TUxrR0Zzd09JV2FqV3JCaDVjSytwTkZicDNJZlNBOUhW?=
 =?utf-8?B?OXpoUHNhRXNDUGdEajRTSGk5cW1UUHJ2d0ROeGlTdGExSE95ak9nZ2hqaXhY?=
 =?utf-8?B?NWFHS3htbHh6WmFiUXRoMFRSL1lqWlB6Qy9DV1BDRGk5Q2tNUUJPNWRPUjhI?=
 =?utf-8?B?SG1Fck43eUlDZktHcmY4NTdIVWFNRVZSNHBraVNBeFNwOXBTS25ZaC9tVm5i?=
 =?utf-8?B?ayt0K2FkUTE0TEwreUU2NVArdjlzU1JLRDBUSUloc0hHWDZWb1k3N1V1b2Nj?=
 =?utf-8?B?MWFXRXJITVZPWlBIWC8wR2dkN1UrdlNDeExCWi9FSmloaU16QkUvbnBwR01G?=
 =?utf-8?Q?P3ijgweSBwyLkcxI=3D?=
X-Exchange-RoutingPolicyChecked: nJOr+WbsxAoFpBNQa8TTZKHaI/ckfqcfaltK/wOIm4jOMpR63+g9wrOTAKcaDXNPL682+6wL6jc/o3yt05wQv7x+O4dj4Na3qxXHzcyx/jk8WiZT2eVfUzlK7uecYdMuPIMLrKmRqnBDpUAQchFWt10x+Y+pg8Wi9zg2I38jdv/ApqAlZSgmdXpvUIjZVPKgGpjdYNUGa760SabLB1+tG3CMStncBtHZgp4ntytFT7K85/83w0XOEXh/T2/Y4q+BhRSE4iT9i7iRJqBK33opyc/vHrhr0JJHoI/OXFPZI28rFKB8AntLnERYzOKiGdAkqTERtdbMi/CIRLVXzkgdvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: de1d3c0f-b8d4-4475-8d63-08df1afa1705
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 11:42:34.3942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7wkQsAJ1JgQyn5aQCXiW8Q+AunGtmMXFLDYhLNMmoqf6mXD7REoUqgPgXtrfxvs9Blx/bpibaV7Tq8Tr7jDO+JEGRMADHaaUWLnIqvO8m0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
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

--------------1o8KKljhAKiMXn2L8hzdZuKd
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 27-Aug-26 4:27 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Switch PF VF-context provisioning to explicitly allocate IDs from
> the dedicated shareable ID pool.
> Also, lets remove the legacy GuC ID reservation API now that all VFs
> provisioning paths use the shareable allocation helpers.
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 22 +++++---
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
>   4 files changed, 25 insertions(+), 60 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index e6eaa94d4d30..4d72411cd570 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
>   		.graphics_verx100 = 2001,
>   	};
>   	struct xe_vram_region *vram;
> +	struct xe_guc_id_mgr *idm;
>   	struct xe_device *xe;
>   	struct xe_gt *gt;
>   
> @@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
>   	pf_set_admin_mode(xe, false);
>   	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
>   
> +	idm = &gt->uc.guc.submission_state.idm;
> +	mutex_init(&gt->uc.guc.submission_state.lock);
> +	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
> +
>   	/* more sanity checks */
>   	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
>   	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 9445e5f32fe8..bd55617295fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spare)
>   	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>   	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
>   
> -	if (spare > GUC_ID_MAX)
> +	if (spare > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
>   		return -EINVAL;
>   
>   	if (spare && spare < pf_get_min_spare_ctxs(gt))
> @@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>   	unsigned int spare = pf_get_spare_ctxs(gt);
>   
> -	return xe_guc_id_mgr_reserve(idm, num, spare);
> +	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
>   }
>   
>   static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
> @@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsigned int vfid, u32 num_ctx
>   
>   	xe_gt_assert(gt, vfid);
>   
> -	if (num_ctxs > GUC_ID_MAX)
> +	if (num_ctxs > xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm))
>   		return -EINVAL;
>   
>   	if (config->num_ctxs) {
> @@ -1173,20 +1173,28 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
>   
>   	if (admin_only_pf && num_vfs == 1)
> -		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
> +		return ALIGN_DOWN(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm),
> +				  SZ_1K);
>   
> -	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
> +	return rounddown_pow_of_two(xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm) /
> +								num_vfs);

How about this?

max_ctxs = xe_guc_id_mgr_max_shareable(&gt->uc.guc.submission_state.idm);

return ALIGN_DOWN(max_ctxs / SZ_1K); and

return rounddown_pow_of_two(max_ctxs/num_vfs);

-Satya.

>   }
>   
>   static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>   {
>   	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
> +	u32 max_shareable = xe_guc_id_mgr_max_shareable(idm);
>   	u32 spare = pf_get_spare_ctxs(gt);
> -	u32 fair = (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
> +	u32 fair;
>   	int ret;
>   
> +	if (max_shareable <= spare)
> +		return 0;
> +
> +	fair = (max_shareable - spare) / num_vfs;
> +
>   	for (; fair; --fair) {
> -		ret = xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
> +		ret = xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
>   		if (ret< 0) continue; xe_guc_id_mgr_release(idm, ret, fair * num_vfs); diff 
> --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c 
> b/drivers/gpu/drm/xe/xe_guc_id_mgr.c index 5675325665fb..20ce16bda973 
> 100644 --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c +++ 
> b/drivers/gpu/drm/xe/xe_guc_id_mgr.c @@ -124,9 +124,13 @@ static int 
> idm_init(struct xe_guc_id_mgr *idm, unsigned int usable, unsigned int 
> } /** - * xe_guc_id_mgr_init() - Initialize GuC context ID manager in 
> native mode. + * xe_guc_id_mgr_init() - Initialize GuC ID manager for 
> native. * @idm: the &xe_guc_id_mgr to initialize * + * This function 
> initializes the GuC ID manager to manage the full range of + * GuC 
> context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code. + 
> * No GuC context IDs will be reserved for sharing with VFs. + * * Can 
> only be called when the device is not in SR-IOV mode. * * Return: 0 on 
> success or a negative error code on failure. @@ -287,37 +291,6 @@ 
> static int idm_reserve_chunk_shareable_locked(struct xe_guc_id_mgr 
> *idm, unsigne return id; } -static int idm_reserve_chunk_locked(struct 
> xe_guc_id_mgr *idm, unsigned int count, - unsigned int retain) -{ - 
> unsigned int total = idm_total(idm); - int id; - - idm_assert(idm, 
> count); - lockdep_assert_held(idm_mutex(idm)); - - if (!total) - 
> return -ENODATA; - - if (retain) { - unsigned int used = 
> bitmap_weight(idm->bitmap, total);
> -
> -		if (used + count + retain > total)
> -			return -EDQUOT;
> -
> -		id = idm_find_last_zero_area_in_range(idm->bitmap, 0, total, count);
> -	} else {
> -		id = bitmap_find_next_zero_area(idm->bitmap, total, 0, count, 0);
> -	}
> -
> -	if (id >= total)
> -		return -ENOSPC;
> -
> -	bitmap_set(idm->bitmap, id, count);
> -
> -	return id;
> -}
> -
>   static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
>   				     unsigned int start, unsigned int count)
>   {
> @@ -475,25 +448,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int coun
>   	return idm_reserve_chunk_shareable_locked(idm, count, spare);
>   }
>   
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count)
> -{
> -	return idm_reserve_chunk_locked(idm, count, 0);
> -}
> -
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
> -			  unsigned int retain)
> -{
> -	int ret;
> -
> -	idm_assert(idm, count);
> -	idm_assert(idm, retain);
> -
> -	guard(mutex)(idm_mutex(idm));
> -	ret = idm_reserve_chunk_locked(idm, count, retain);
> -
> -	return ret;
> -}
> -
>   /**
>    * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
>    * @idm: the &xe_guc_id_mgr
> diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> index ed9970829a93..844d68440b0a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
> @@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_id_mgr *idm, unsigned i
>   					   unsigned int spare);
>   int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned int count,
>   				    unsigned int spare);
> -int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int count);
> -int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, unsigned int retain);
>   void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int id, unsigned int count);
>   int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigned int id,
>   					unsigned int count);
--------------1o8KKljhAKiMXn2L8hzdZuKd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 27-Aug-26 4:27 PM, Pi=C3=B3rkowski, P=
iotr
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260827105750.1248792-5-piotr.pi=
orkowski@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Piotr Pi=C3=B3rkowski <a=
 class=3D"moz-txt-link-rfc2396E" href=3D"mailto:piotr.piorkowski@intel.com"=
>&lt;piotr.piorkowski@intel.com&gt;</a>

Switch PF VF-context provisioning to explicitly allocate IDs from
the dedicated shareable ID pool.
Also, lets remove the legacy GuC ID reservation API now that all VFs
provisioning paths use the shareable allocation helpers.

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Pi=C3=B3rkowski <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;<=
/a>
Cc: Michal Wajdeczko <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:mich=
al.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 .../xe/tests/xe_gt_sriov_pf_config_kunit.c    |  5 ++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 22 +++++---
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 56 ++-----------------
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  2 -
 4 files changed, 25 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drive=
rs/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
index e6eaa94d4d30..4d72411cd570 100644
--- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
+++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
@@ -68,6 +68,7 @@ static int pf_gt_config_test_init(struct kunit *test)
 		.graphics_verx100 =3D 2001,
 	};
 	struct xe_vram_region *vram;
+	struct xe_guc_id_mgr *idm;
 	struct xe_device *xe;
 	struct xe_gt *gt;
=20
@@ -102,6 +103,10 @@ static int pf_gt_config_test_init(struct kunit *test)
 	pf_set_admin_mode(xe, false);
 	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
=20
+	idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
+	mutex_init(&amp;gt-&gt;uc.guc.submission_state.lock);
+	KUNIT_ASSERT_EQ(test, xe_guc_id_mgr_init_shared(idm), 0);
+
 	/* more sanity checks */
 	KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
 	KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/x=
e/xe_gt_sriov_pf_config.c
index 9445e5f32fe8..bd55617295fd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -889,7 +889,7 @@ static int pf_set_spare_ctxs(struct xe_gt *gt, u32 spar=
e)
 	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
 	lockdep_assert_held(xe_gt_sriov_pf_master_mutex(gt));
=20
-	if (spare &gt; GUC_ID_MAX)
+	if (spare &gt; xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.submission_=
state.idm))
 		return -EINVAL;
=20
 	if (spare &amp;&amp; spare &lt; pf_get_min_spare_ctxs(gt))
@@ -906,7 +906,7 @@ static int pf_reserve_ctxs(struct xe_gt *gt, u32 num)
 	struct xe_guc_id_mgr *idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
 	unsigned int spare =3D pf_get_spare_ctxs(gt);
=20
-	return xe_guc_id_mgr_reserve(idm, num, spare);
+	return xe_guc_id_mgr_reserve_shareable(idm, num, spare);
 }
=20
 static void pf_release_ctxs(struct xe_gt *gt, u32 start, u32 num)
@@ -933,7 +933,7 @@ static int pf_provision_vf_ctxs(struct xe_gt *gt, unsig=
ned int vfid, u32 num_ctx
=20
 	xe_gt_assert(gt, vfid);
=20
-	if (num_ctxs &gt; GUC_ID_MAX)
+	if (num_ctxs &gt; xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.submissi=
on_state.idm))
 		return -EINVAL;
=20
 	if (config-&gt;num_ctxs) {
@@ -1173,20 +1173,28 @@ static u32 pf_profile_fair_ctxs(struct xe_gt *gt, u=
nsigned int num_vfs)
 	bool admin_only_pf =3D xe_sriov_pf_admin_only(gt_to_xe(gt));
=20
 	if (admin_only_pf &amp;&amp; num_vfs =3D=3D 1)
-		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
+		return ALIGN_DOWN(xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.guc.submiss=
ion_state.idm),
+				  SZ_1K);
=20
-	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
+	return rounddown_pow_of_two(xe_guc_id_mgr_max_shareable(&amp;gt-&gt;uc.gu=
c.submission_state.idm) /
+								num_vfs);</pre>
    </blockquote>
    <p>How about this?</p>
    <p>max_ctxs =3D&nbsp;<span style=3D"white-space: pre-wrap">xe_guc_id_mg=
r_max_shareable(&amp;gt-&gt;uc.guc.submission_state.idm);</span></p>
    <p><span style=3D"white-space: pre-wrap">return ALIGN_DOWN(</span>max_c=
txs
      / SZ_1K); and</p>
    <p>return&nbsp;<span style=3D"white-space: pre-wrap">rounddown_pow_of_t=
wo(max_ctxs/num_vfs); </span></p>
    <p><span style=3D"white-space: pre-wrap">-Satya.</span></p>
    <blockquote type=3D"cite" cite=3D"mid:20260827105750.1248792-5-piotr.pi=
orkowski@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 }
=20
 static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
 {
 	struct xe_guc_id_mgr *idm =3D &amp;gt-&gt;uc.guc.submission_state.idm;
+	u32 max_shareable =3D xe_guc_id_mgr_max_shareable(idm);
 	u32 spare =3D pf_get_spare_ctxs(gt);
-	u32 fair =3D (xe_guc_id_mgr_max_usable(idm) - spare) / num_vfs;
+	u32 fair;
 	int ret;
=20
+	if (max_shareable &lt;=3D spare)
+		return 0;
+
+	fair =3D (max_shareable - spare) / num_vfs;
+
 	for (; fair; --fair) {
-		ret =3D xe_guc_id_mgr_reserve(idm, fair * num_vfs, spare);
+		ret =3D xe_guc_id_mgr_reserve_shareable(idm, fair * num_vfs, spare);
 		if (ret <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:0)continue;xe_=
guc_id_mgr_release(idm,ret,fair*num_vfs);diff--gita/drivers/gpu/drm/xe/xe_g=
uc_id_mgr.cb/drivers/gpu/drm/xe/xe_guc_id_mgr.cindex5675325665fb..20ce16bda=
973100644---a/drivers/gpu/drm/xe/xe_guc_id_mgr.c+++b/drivers/gpu/drm/xe/xe_=
guc_id_mgr.c@@-124,9+124,13@@staticintidm_init(structxe_guc_id_mgr*idm,unsi=
gnedintusable,unsignedint}/**-*xe_guc_id_mgr_init()-InitializeGuCcontextIDm=
anagerinnativemode.+*xe_guc_id_mgr_init()-InitializeGuCIDmanagerfornative.*=
@idm:the&amp;xe_guc_id_mgrtoinitialize*+*ThisfunctioninitializestheGuCIDman=
agertomanagethefullrangeof+*GuCcontextIDs(0..GUC_ID_MAX-1)forusebytheGuCsub=
missioncode.+*NoGuCcontextIDswillbereservedforsharingwithVFs.+**Canonlybeca=
lledwhenthedeviceisnotinSR-IOVmode.**Return:0onsuccessoranegativeerrorcodeo=
nfailure.@@-287,37+291,6@@staticintidm_reserve_chunk_shareable_locked(struc=
txe_guc_id_mgr*idm,unsignereturnid;}-staticintidm_reserve_chunk_locked(stru=
ctxe_guc_id_mgr*idm,unsignedintcount,-unsignedintretain)-{-unsignedinttotal=
=3Didm_total(idm);-intid;--idm_assert(idm,count);-lockdep_assert_held(idm_m=
utex(idm));--if(!total)-return-ENODATA;--if(retain){-unsignedintused=3Dbitm=
ap_weight(idm-">&lt; 0)
 			continue;
 		xe_guc_id_mgr_release(idm, ret, fair * num_vfs);
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.c b/drivers/gpu/drm/xe/xe_guc=
_id_mgr.c
index 5675325665fb..20ce16bda973 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.c
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.c
@@ -124,9 +124,13 @@ static int idm_init(struct xe_guc_id_mgr *idm, unsigne=
d int usable, unsigned int
 }
=20
 /**
- * xe_guc_id_mgr_init() - Initialize GuC context ID manager in native mode=
.
+ * xe_guc_id_mgr_init() - Initialize GuC ID manager for native.
  * @idm: the &amp;xe_guc_id_mgr to initialize
  *
+ * This function initializes the GuC ID manager to manage the full range o=
f
+ * GuC context IDs (0..GUC_ID_MAX - 1) for use by the GuC submission code.
+ * No GuC context IDs will be reserved for sharing with VFs.
+ *
  * Can only be called when the device is not in SR-IOV mode.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -287,37 +291,6 @@ static int idm_reserve_chunk_shareable_locked(struct x=
e_guc_id_mgr *idm, unsigne
 	return id;
 }
=20
-static int idm_reserve_chunk_locked(struct xe_guc_id_mgr *idm, unsigned in=
t count,
-				    unsigned int retain)
-{
-	unsigned int total =3D idm_total(idm);
-	int id;
-
-	idm_assert(idm, count);
-	lockdep_assert_held(idm_mutex(idm));
-
-	if (!total)
-		return -ENODATA;
-
-	if (retain) {
-		unsigned int used =3D bitmap_weight(idm-&gt;</a>bitmap, total);
-
-		if (used + count + retain &gt; total)
-			return -EDQUOT;
-
-		id =3D idm_find_last_zero_area_in_range(idm-&gt;bitmap, 0, total, count)=
;
-	} else {
-		id =3D bitmap_find_next_zero_area(idm-&gt;bitmap, total, 0, count, 0);
-	}
-
-	if (id &gt;=3D total)
-		return -ENOSPC;
-
-	bitmap_set(idm-&gt;bitmap, id, count);
-
-	return id;
-}
-
 static void idm_release_chunk_locked(struct xe_guc_id_mgr *idm,
 				     unsigned int start, unsigned int count)
 {
@@ -475,25 +448,6 @@ int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_m=
gr *idm, unsigned int coun
 	return idm_reserve_chunk_shareable_locked(idm, count, spare);
 }
=20
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int c=
ount)
-{
-	return idm_reserve_chunk_locked(idm, count, 0);
-}
-
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count,
-			  unsigned int retain)
-{
-	int ret;
-
-	idm_assert(idm, count);
-	idm_assert(idm, retain);
-
-	guard(mutex)(idm_mutex(idm));
-	ret =3D idm_reserve_chunk_locked(idm, count, retain);
-
-	return ret;
-}
-
 /**
  * xe_guc_id_mgr_release() - Release one or more GuC context IDs.
  * @idm: the &amp;xe_guc_id_mgr
diff --git a/drivers/gpu/drm/xe/xe_guc_id_mgr.h b/drivers/gpu/drm/xe/xe_guc=
_id_mgr.h
index ed9970829a93..844d68440b0a 100644
--- a/drivers/gpu/drm/xe/xe_guc_id_mgr.h
+++ b/drivers/gpu/drm/xe/xe_guc_id_mgr.h
@@ -31,8 +31,6 @@ int xe_guc_id_mgr_reserve_shareable_locked(struct xe_guc_=
id_mgr *idm, unsigned i
 					   unsigned int spare);
 int xe_guc_id_mgr_reserve_shareable(struct xe_guc_id_mgr *idm, unsigned in=
t count,
 				    unsigned int spare);
-int xe_guc_id_mgr_reserve_locked(struct xe_guc_id_mgr *idm, unsigned int c=
ount);
-int xe_guc_id_mgr_reserve(struct xe_guc_id_mgr *idm, unsigned int count, u=
nsigned int retain);
 void xe_guc_id_mgr_release_locked(struct xe_guc_id_mgr *idm, unsigned int =
id, unsigned int count);
 int xe_guc_id_mgr_release_usable_locked(struct xe_guc_id_mgr *idm, unsigne=
d int id,
 					unsigned int count);
</pre>
    </blockquote>
  </body>
</html>

--------------1o8KKljhAKiMXn2L8hzdZuKd--
