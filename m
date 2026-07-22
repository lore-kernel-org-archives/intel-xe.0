Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0206C44536
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jul 2026 18:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478E910E24D;
	Wed, 22 Jul 2026 18:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEq6MzsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A341B10E24D
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jul 2026 18:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784744216; x=1816280216;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BMcBIeENOH/ltYe1gmy0mU2xuf7US61a54muR9GOrE4=;
 b=kEq6MzsO0k2VThP0MAF2gCP5nEvgMGx0SbVjEHnlvEghdTLa9GqJYwmj
 Sng1BOntDLb7c9JpHsGXUsfnExL7ZzEuMhNXsDa07gXZtrwsMd4a/cZe6
 XmIQJfOAIhYEaDBx7jvp5JZUgBJ8xMAit5bKMpHwmYVP9fYBVe2VrchH2
 JEn2P0zjjv8/7H3KOIvd2qwLmP0SL2HyVsNzpeohg+UhvrOgsp1W9ChGD
 WKDjYs4yHvo/gGIqQTC7fC1pRO9TvVRTqZB/PxWLuSG5n2RrZogR2tkus
 l/BQjTrar/Ng7Ho697tTdF+Lb5x1XCvAHQViVaiM6CueP81R097bt24jC g==;
X-CSE-ConnectionGUID: svn4BdyDRx6nWVV7lQN7Pw==
X-CSE-MsgGUID: qMIccYyBRcKVYn4nKQKWog==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85262565"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85262565"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:16:56 -0700
X-CSE-ConnectionGUID: Sjacm6r7QUCSh4SGtVayYw==
X-CSE-MsgGUID: xwr88m0/QNu2KwXPXm2Kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="256378511"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 11:16:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 11:16:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 11:16:55 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 11:16:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTaTtgCYohXUrcEhuSesu0Ihciip7hnKkCwjqMGlOhOSntqk2+hg/Ao7hUA2KWZOQ9jcbHCEecxRif6bGVnjSNfP2MgT9lLoaK5swU915wOSolpQXlPttbK9b+vwSP1bnexOUeGwOvzRBGjZrAx+BMeFHvqgvCllFFGdVsIC+CNY46IYprM7hxxm4egQ2qEiro0dQocr+J62CuYe1f8030jDfcRoBRm21Vd5DvdReSrIrHU9DpocnO9SHGaECxI7IFWVulm7ndk4qcFZHqEInt0thuGISZijRi6hkNBa83q40UAdGxX3Hy+riovAcTZ9RzghqhObJQpzZK+G+3slew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z57SULNV3xqLPF/2J3I7L8axfv3uJrUDnBlfpfIMwWE=;
 b=sgvY2JhZk0jS2qR6T7vGId8oJw1bi4ijIZcWs9elaNb8sGXtyNCnYc75d9MgT8gZGp2LecbKJChkuod5Ik1DOC5oOcxqHk1btOSUaFhculVxAcQRvRAWK3CPJlXGABcHxikWI4XXNWB5vDGYwgqgKn+ssEgN1i834yjj+0rzcmqMtW987nfWfWvWwLPugrn6q25sxDgKOyetPpc7Kq+FAtMuX0U1++WCqo7vXcSaSZJlyfIOoJFyqUiuzPMMnXlpdS7vaowepW9p8jD9rW9N6cgjGp0FK5QhKjftuR/zJIeK+cTGp2LxMRAMI+QVnb3rGlg+Y6jKzwRtj1+xKhbzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CO1PR11MB4866.namprd11.prod.outlook.com (2603:10b6:303:91::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 18:16:52 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 18:16:52 +0000
Message-ID: <4b1dd652-77d4-4f14-941d-3b53d04ffefe@intel.com>
Date: Wed, 22 Jul 2026 23:46:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] drm/xe/hwmon: Enable fan curve control support
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-7-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0116.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CO1PR11MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e693e05-5f1d-49b3-34b1-08dee81d670e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|6133799003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: QHKR06FyymadJ2vysqRspTd0oIbqHBUp70hGeHxKseL4Poj4wd6L4zazTuq6Dy/Bg7tHAALTQi3RNeRU9rPInN1Xtb7ts3AnDj5XaynLPEdkakJZaV4lfzop6ZcD7KnejLK2Sk0qYyT4GHsFPNjh5ENfEpZXgA49LNQFPHYy6OaNXlmgA1/axJVX44a8Yo/j3R8aDfopuXbYS5bQdITkqM+EjZL7rQz9UpwbOxFAguNQZX/AyyUyIVTnGnlO/EJZn+t05YCgKbgWbkT682EkUnrq0biijpZNcjeWmv2eZK4OemE26Ch7KA8tokFZoK+z08TDzGmlVUg2fEsTe9szux353NJjKPSVPcmE6haaS+AbYBUCrE9cn527YYZCHf7MKDFpXqCk0ir+OZbLoPObX0arIwxTeWfUBBZDh5gbpvj8mQjZx9GCEQ2XNAbUl9ZcSm3acJgmjLZLfEpMRgUqkRo8Ol7GexyH6PTiSWIFMgGrYlwBp7mwiqWRGOeWg9VKLiPTSYPWG/s45xc7m6cem9bC6o9bxhbVe8mvnmxNRpeK8nmLpfuudJMbVAZmprK0CHzt+qHmkPU7LxmhW25vNZOeKmcfUTH7AHiHd6GR2Z9Cvkgxe1TSk1qPG+JaWAsPj1cF4iXwR5SF3HoQcAjfvJmodd30t88ye9mUFOSd0D4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStKSTh2ZnFTaDFKcko0YzVsVjBUaW01Q0RmZ1NhZ0F2NFZvY09POWpFUDhE?=
 =?utf-8?B?NkZvYi9GaDdReEVoMExsTXQ2Tlh2aEtjckg1RE1JUVZOZ2JhMWVxaUlYL00r?=
 =?utf-8?B?Zjk2VS9vcDBMa1lLbVE5V3B6U1RJNTVpVWFGSXdHcU43L1BNWG40eDRQbk1L?=
 =?utf-8?B?bytOQWxGSlNVZ0JQMlV6MjBQOTdUY1Zmb3QwUEI2Y3RFQXNBYWhxbVNtZjNZ?=
 =?utf-8?B?akFXa3l1RVRwNFZCc1lDL0FoMzVvMFVYOTdIU212N3lUcWg0SFVFY0JheFJm?=
 =?utf-8?B?ZitSTXNQNVZEYmhqbjBKRSttWk8xcGpGSnpDR2FBSUtCK2d6UXF2SFdNV2xU?=
 =?utf-8?B?LzMvV3lTekJJSUxpSENNQUxSZG14a3UvV2NmVGJYZk5XUnh3QnVsT2JYYkgr?=
 =?utf-8?B?cDVHbjlZOGRCUCt2Tm8zU205c090TlpZREhuSnlWRXd0KzI3aWxINXVnTWNU?=
 =?utf-8?B?VFk3YkVBbkJpa1hobXpMcWxMNmY1RlRUdFZMYllEeTRWOEU3cVBqWkFpQ0RM?=
 =?utf-8?B?S2dZZU5rUFAxTkZzdlVNaGVLU0xwUEdsSHZ4SWoyL1lieTlic0NVV0ZRbW0v?=
 =?utf-8?B?azllMTZwMC8yUlV1dDc4UGJ5WEVuM3lXMm9WUEVEa2tHK3ZtVnVoT1prMHZX?=
 =?utf-8?B?MWNaUUl1Z0JQc3M4MlRUT09tV1ZKWnUyYjFGcVNMTGV1K0RmOXIydFVKK2w2?=
 =?utf-8?B?M3JaM3hqWlNwZFE2THh1K2FnSUkyL05FQ28xMHlQYmk1T1IxdHR3b3lvUzQ1?=
 =?utf-8?B?WnMrVlM3NmtZdFpaelBGV280dWl1a2VqanN3ZjRtT09vMHhWSlR6THlkL0Jo?=
 =?utf-8?B?aFkrNWRRUUxoWkVMTE5nT1JRREFTQVV1YmxISWNndVlJb2k0aG5XN21NR0x1?=
 =?utf-8?B?OThYVGIwYm5iVHhLM0orSm9MbGZjRHNEYlpHNUs2RmpTVFJGbEVxd0VRZDVD?=
 =?utf-8?B?bHZhbjVWQ0xGcndjR1A1R09WSEZUN3lZSXlGNFQzb05GbDMwT3VLTmVkL2xF?=
 =?utf-8?B?ZmpKUjgxUDRHdGJWS0l3b1lYL2dNc2dMd0pHVytkeEFpa0N4MG1QYmhRWEk0?=
 =?utf-8?B?VjZHUUZjb0JCaGpIYTJkZFBRY2gzbGxBY3JoSFpxRGN5N1RCQVZtS1JyZkJz?=
 =?utf-8?B?UHJIbEduNFQ4cERheWs1YVdWc09ZdUlQZmVqbzNTUSswZkd5TitNUVM3ZW1L?=
 =?utf-8?B?aHRldU5TRVA5S05BOFExQW01ZW1NdjhCbEQ1cGhFa0NuZmpIWFN4Vk9xdHdo?=
 =?utf-8?B?cnoxdmpqM1RHWTFxZ2V1cFFJVFhla213ZWErUzhIQXFWN3B1bkxGV2x4WWdS?=
 =?utf-8?B?SkRvb2tUZGZSU3BHYlAwclA1d1VXMlBBRzNtTlBUSkVXV0pGZE12TFhhSCtQ?=
 =?utf-8?B?VjhHbkNqWU1LcThDTThuM2FicTlUYmNSQ280eU5tc24xU3hXdUY1Z2JuNnl5?=
 =?utf-8?B?M1FkRTJMbXBCR2p1anhpWVN4WVdHUC9vRm9mRjJXNGliWWNiUUlhQS81WnRt?=
 =?utf-8?B?bW5WUkp5MEdzSkQwak11eUI2c0thRk43bUdGU00zZ08vSkgvcFZxT2ZmaVJP?=
 =?utf-8?B?b2xJeUhRSEI4cWZZQ1pLK2RpNDBXSS9KMlVxbkM2Qk9iQmkvc0tIWmxoYlN0?=
 =?utf-8?B?ZTFIWTgrK2hndXJyMm8vc1R3NVU2K1ZZdDZVcXZRWllLUG9EVzl1blZyNU1I?=
 =?utf-8?B?WCtIVzZvMmRxVVlwZUJPNlZpTDZYNUtsM3lGTHkxRUEwaU5qd3F6Ly8rTGIz?=
 =?utf-8?B?ZmJWT2lBMjNwQlpSRXRWcG9rTEJOa01sTHF1RXVSalYwOUJzVGFZY3c2R3Rj?=
 =?utf-8?B?bHNZVVp1M0VmRDZzdGdsQnJpTko5cjBwRklZOUoxRnptQlR0REx5Ym1FeUxu?=
 =?utf-8?B?WUo4Y29NSmhPdDZTeHdjTUpoTnNyeUpGUG16MXhQYlpzVFlBa3dMSE41OUtJ?=
 =?utf-8?B?VXZNYktEZ0YvSzNKVm9SMEN0bjBoeEJTQm95ZHpTcVl6bC9wamdhaitlL0FS?=
 =?utf-8?B?Q0habGRQU1BCU1VoeU5SS29abDhmT0dURWlOTmZ2VkpWRlFYSE0zRkozQm1i?=
 =?utf-8?B?ZGRPTHZ2Tkc0Y1lyQXlCTVpVRUtSQm11UXhCY01WOGhYK2RxWVRwR3dGK2la?=
 =?utf-8?B?TUUwL3JLeDRoVi9CT1hDSFlSMURoOGFsQmxZR2dyQWN2OVFla0dNYlVmazFj?=
 =?utf-8?B?RTJ4Y3ZRRFR5OS9NcUdxbTBXQnJSWHRRZ2xubmhnOFBTd2FoUCt4aXZtSXNs?=
 =?utf-8?B?d3FvRTZWKzBCRzFOZEhHTEtjazhoMW5UWnl3dGNDbXY1TU9oazNPc3BQdjZM?=
 =?utf-8?B?ZXhxUEk0bGMzaDNVYjN3ZldGc2pxMnV2cEpad0VYMWdhTm9kY05oVTV6Wmti?=
 =?utf-8?Q?vpWhpUJyvmr66zEY=3D?=
X-Exchange-RoutingPolicyChecked: ZMr6rum2O6In8ZTV1+nPyhPP1mV+JBnIE68iqH8vBBTI1fHMtrFM5VBh/0Q9DDTmUoRGjO//zUtK+GW6lgcHdH6Y2anh/q1pPFGz/DXp8dJQM6XdsJPACyXRpRTA/cM+KwFYqzRbZsLucRFa7x6f29/NDwKvFoGGw3J3+Xm77MUwVAz8rPuj+LCeDcVzaLtVL6hwGVzXR7sWt+s0zGmcPab9H9BYcz6A3AaFmxeZfVqbE+SJ4388haKRKav8GD1/l/YeSncGl9E5Elr40F6wwariYpvRwQ4FEwJORm3QAJ9LtG/S3KxAKyTSe5vPhhO6QTEbVUtrfe/7NgjdnicxMw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e693e05-5f1d-49b3-34b1-08dee81d670e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 18:16:51.8073 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urMT1qO2yoGFAA67qArIjt9PbWRBIpkTkxgnCO1f+FBl22Q6EuRGLhax2SuIIqKWMTyQ3uLEIcAeauG74FYLaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4866
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose curve-point temperature and pwm controls via
> pwmF_auto_point[P]_temp and pwmF_auto_point[P]_pwm, where
> F is the fan number and P is the fan curve point number.
> Each fan curve point has temperature and pwm sysfs.
>
> Update Xe hwmon ABI documentation for pwm auto point temperature
> attributes.
>
> v2:
> - Use xe helpers for dmesg logs.
> - Update kernel version in Xe hwmon documentation.
> - Correct debug level of some dmesg logs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  16 +
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 700 +++++++++++++++++-
>   2 files changed, 715 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index effc7d38ce1f..68cc6b99e8a5 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -341,3 +341,19 @@ Description:   RW. Fan control mode selector.
>                  user table control and value 2 to use firmware default behavior.
>   
>                  Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_temp
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. Temperature in millidegree Celsius for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> +
> +What:          /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_auto_point[1-10]_pwm
> +Date:          June 2026
> +KernelVersion: 7.2
> +Contact:       intel-xe@lists.freedesktop.org
> +Description:   RW. PWM duty value (0..255) for each fan curve point.
> +
> +               Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index fa9dbadd5fd6..a3ed139ad446 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -173,6 +173,10 @@ struct xe_hwmon_fan_info {
>   			/** @speed: fan speed in percentage */
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
> +		/** @last_point_temp_valid: last user temperature point was written */
> +		bool last_point_temp_valid;
> +		/** @last_point_speed_valid: last user PWM point was written */
> +		bool last_point_speed_valid;
>   	} fan_table[FAN_TABLE_MAX];
>   		/** @max_rps: maximum fan RPS */
>   		u32 max_rps;
> @@ -779,8 +783,11 @@ static const struct attribute_group hwmon_attrgroup = {
>   	.is_visible = xe_hwmon_attributes_visible,
>   };
>   
> +static const struct attribute_group hwmon_curve_attrgroup;
> +
>   static const struct attribute_group *hwmon_groups[] = {
>   	&hwmon_attrgroup,
> +	&hwmon_curve_attrgroup,
>   	NULL
>   };
>   
> @@ -945,7 +952,7 @@ static int xe_hwmon_get_num_fans(const struct xe_hwmon *hwmon, u32 *num_fans)
>   }
>   
>   static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *point_count,
> -					int table_type)
> +					enum fan_table_type table_type)
>   {
>   	int ret;
>   
> @@ -960,6 +967,16 @@ static int xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>   		return ret;
>   	}
>   
> +	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
> +	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
Remove duplicate log.
> +
> +	if (*point_count > MAX_FAN_CONTROL_POINTS) {
> +		xe_err(hwmon->xe, "fan %d %s point count %u exceeds max %u\n", fan,
> +		       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count,
> +		       MAX_FAN_CONTROL_POINTS);
> +		return -EINVAL;
> +	}
> +
>   	xe_dbg(hwmon->xe, "fan %d %s point count read as %u\n", fan,
>   	       (table_type == USER_FAN_TABLE) ? "user" : "stock", *point_count);
>   
> @@ -985,6 +1002,60 @@ static int xe_hwmon_write_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u8 poin
>   	return ret;
>   }
>   
> +static int xe_hwmon_commit_user_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
> +	u32 point_count = fi->fan_table[USER_FAN_TABLE].fan_control_point_count;
> +	int point;
> +	int ret;
> +
> +	if (!point_count)
> +		return -ENODATA;
> +
> +	for (point = 0; point < point_count; point++) {
> +		u8 temp = fi->fan_table[USER_FAN_TABLE].fcp[point].temp;
> +		u8 speed = fi->fan_table[USER_FAN_TABLE].fcp[point].speed;
> +
> +		/* Ensure fan control points are strictly increasing order */
> +		if (point > 0) {
> +			u8 prev_temp = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].temp;
> +			u8 prev_speed = fi->fan_table[USER_FAN_TABLE].fcp[point - 1].speed;
> +
> +			if (temp < prev_temp || speed < prev_speed) {
> +				drm_dbg(&hwmon->xe->drm,
> +					"fan %d invalid user point previous value > current %d: %u/%u prev=%u/%u\n",
> +					fan, point, temp, speed, prev_temp, prev_speed);
> +				return -EINVAL;
> +			}
> +		}
> +
> +		drm_dbg(&hwmon->xe->drm,
> +			"committing fan %d user point %d temp %u, speed %u %%\n",
> +			fan, point, temp, speed);
> +		ret = xe_hwmon_write_user_fan_point(hwmon, fan, point, temp, speed);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"committing fan %d user table with %d points\n", fan, point_count);
> +	ret = xe_pcode_write_timeout(root_tile, PCODE_MBOX(FAN_SPEED_CONTROL,
> +							   FSC_WRITE_NUM_FAN_CONTROL_POINTS,
> +							   fan),
> +				     point_count, XE_PCODE_FAN_CONTROL_TIMEOUT_MS);
> +	if (ret) {
> +		drm_dbg(&hwmon->xe->drm,
> +			"failed to update fan %d user table count, ret=%d\n", fan, ret);
> +		return ret;
> +	}
> +
> +	fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
> +	fi->is_full_speed = false;
> +
> +	return 0;
> +}
> +
>   static int xe_hwmon_activate_user_fan_table(struct xe_hwmon *hwmon, u8 fan,
>   					    bool is_full_speed, enum fan_table_type table_source)
>   {
> @@ -1105,6 +1176,633 @@ static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, u8 pwm)
>   	return 0;
>   }
>   
> +#define XE_CURVE_IDX(fan, point)	(((fan) << 8) | (point))
> +#define XE_CURVE_FAN(idx)		((u8)(((idx) >> 8) & 0xff))
> +#define XE_CURVE_POINT(idx)		((u8)((idx) & 0xff))
> +
> +static int
> +xe_hwmon_decode_curve_index(u32 index, u8 *fan, u8 *point)
> +{
> +	u8 local_fan = XE_CURVE_FAN(index);
> +	u8 local_point = XE_CURVE_POINT(index);
> +
> +	if (local_fan >= FAN_MAX || local_point >= MAX_FAN_CONTROL_POINTS)
> +		return -EINVAL;
> +
> +	*fan = local_fan;
> +	*point = local_point;
> +
> +	return 0;
> +}
> +
> +static inline enum fan_table_type xe_hwmon_get_active_fan_table(struct xe_hwmon *hwmon, u8 fan)
> +{
> +	if (hwmon->fi[fan].pwm_enable_mode == XE_FAN_PWM_AUTO_STOCK_TABLE)
> +		return STOCK_FAN_TABLE;
> +	else
> +		return USER_FAN_TABLE;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	u8 fan;
> +	u8 point;
> +	u8 temp;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	fi = &hwmon->fi[fan];
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	temp = fi->fan_table[active_table].fcp[point].temp;
> +	ret = sysfs_emit(buf, "%u\n", temp * MILLIDEGREE_PER_DEGREE);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static int xe_hwmon_update_user_fan_point(struct xe_hwmon *hwmon, u8 fan, u32 point,
> +					  u32 point_count, u8 temp, u8 pwm)
> +{
> +	struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
> +	int ret;
> +
> +	if (temp) {
But as per the xe_hwmon_get_u8_from_sysfs() "0" is a acceptable curve 
point then, why is it being over loaded here ?

Thanks,
Soham
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].temp = temp;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = true;
> +	} else {
> +		fi->fan_table[USER_FAN_TABLE].fcp[point].speed = pwm;
> +		if (point == (point_count - 1))
> +			fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = true;
> +	}
> +
> +	/* Cache intermediate points and commit once the last point arrives. */
> +	if (point == (point_count - 1) &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_temp_valid &&
> +	    fi->fan_table[USER_FAN_TABLE].last_point_speed_valid) {
> +		ret = xe_hwmon_commit_user_fan_table(hwmon, fan);
> +		if (ret)
> +			return ret;
> +		fi->fan_table[USER_FAN_TABLE].last_point_temp_valid = false;
> +		fi->fan_table[USER_FAN_TABLE].last_point_speed_valid = false;
> +	}
> +	return 0;
> +}
> +
> +static int xe_hwmon_get_u8_from_sysfs(long val, bool is_temp, u8 *out)
> +{
> +	long hw_val;
> +
> +	if (is_temp)
> +		hw_val = DIV_ROUND_CLOSEST(val, MILLIDEGREE_PER_DEGREE);
> +	else
> +		hw_val = DIV_ROUND_CLOSEST(val * 100, U8_MAX);
> +
> +	if (hw_val < 0 || hw_val > U8_MAX)
> +		return -EINVAL;
> +
> +	*out = hw_val;
> +
> +	return 0;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_temp_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	u8 temp;
> +	long val;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable not in manual mode; cannot update temp point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, true, &temp);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	drm_dbg(&hwmon->xe->drm,
> +		"updating fan %d point %d temp to %u, pwm %u\n", fan, point,
> +		temp, fi->fan_table[USER_FAN_TABLE].fcp[point].speed);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, temp, 0);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_show(struct device *dev,
> +				 struct device_attribute *attr,
> +				 char *buf)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u8 fan;
> +	u8 point;
> +	u32 point_count;
> +	int ret;
> +	enum fan_table_type active_table;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +	active_table = xe_hwmon_get_active_fan_table(hwmon, fan);
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, active_table);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	ret = sysfs_emit(buf, "%u\n",
> +			 DIV_ROUND_CLOSEST(fi->fan_table[active_table].fcp[point].speed * U8_MAX,
> +					   100));
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret;
> +}
> +
> +static ssize_t
> +xe_hwmon_pwm_auto_point_pwm_store(struct device *dev,
> +				  struct device_attribute *attr,
> +				  const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +	struct xe_hwmon_fan_info *fi;
> +	u32 point_count;
> +	long val;
> +	u8 point;
> +	u8 fan;
> +	u8 pwm;
> +	int ret;
> +
> +	ret = xe_hwmon_decode_curve_index(sattr->index, &fan, &point);
> +	if (ret)
> +		return ret;
> +
> +	fi = &hwmon->fi[fan];
> +
> +	if (fi->pwm_enable_mode != XE_FAN_PWM_MANUAL_USER_TABLE) {
> +		drm_err(&hwmon->xe->drm,
> +			"pwm%d_enable is not in manual user mode, cannot update pwm point %d\n",
> +			fan, point);
> +		return -EINVAL;
> +	}
> +
> +	ret = kstrtol(buf, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_hwmon_get_u8_from_sysfs(val, false, &pwm);
> +	if (ret)
> +		return ret;
> +
> +	guard(xe_pm_runtime)(hwmon->xe);
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, USER_FAN_TABLE);
> +	if (ret)
> +		goto unlock;
> +
> +	if (point >= point_count) {
> +		ret = -EINVAL;
> +		goto unlock;
> +	}
> +
> +	pwm = max_t(u8, pwm, fi->min_pwm);
> +
> +	drm_dbg(&hwmon->xe->drm, "updating fan %d point %d pwm to %u\n",
> +		fan, point, pwm);
> +	ret = xe_hwmon_update_user_fan_point(hwmon, fan, point, point_count, 0, pwm);
> +
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return ret ? ret : count;
> +}
> +
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 0));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 1));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 2));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 3));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 4));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 5));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 6));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 7));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 8));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm1_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(0, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 0));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 1));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 2));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 3));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 4));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 5));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 6));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 7));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 8));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm2_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(1, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point1_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 0));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point2_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 1));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point3_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 2));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point4_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 3));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point5_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 4));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point6_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 5));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point7_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 6));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point8_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 7));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point9_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 8));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_temp, 0644,
> +			  xe_hwmon_pwm_auto_point_temp_show,
> +			  xe_hwmon_pwm_auto_point_temp_store,
> +			  XE_CURVE_IDX(2, 9));
> +static SENSOR_DEVICE_ATTR(pwm3_auto_point10_pwm, 0644,
> +			  xe_hwmon_pwm_auto_point_pwm_show,
> +			  xe_hwmon_pwm_auto_point_pwm_store,
> +			  XE_CURVE_IDX(2, 9));
> +
> +static struct attribute *hwmon_curve_attributes[] = {
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point10_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point8_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point9_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_auto_point10_pwm.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t xe_hwmon_curve_attributes_visible(struct kobject *kobj,
> +						 struct attribute *attr, int index)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> +
> +	/* Temp/PWM pairs for each point. */
> +	u32 attrs_per_fan = 2 * MAX_FAN_CONTROL_POINTS;
> +	u32 fan = index / attrs_per_fan;
> +	u32 local = index % attrs_per_fan;
> +	u32 point_count;
> +
> +	if (!hwmon->xe->info.has_fan_control)
> +		return 0;
> +
> +	if (fan >= hwmon->num_fans)
> +		return 0;
> +
> +	point_count = max(hwmon->fi[fan].fan_table[USER_FAN_TABLE].fan_control_point_count,
> +			  hwmon->fi[fan].fan_table[STOCK_FAN_TABLE].fan_control_point_count);
> +
> +	if (!point_count)
> +		return 0;
> +
> +	if (local < MAX_FAN_CONTROL_POINTS)
> +		return (local + 1) <= point_count ? attr->mode : 0;
> +
> +	if (local < (2 * MAX_FAN_CONTROL_POINTS))
> +		return (local - MAX_FAN_CONTROL_POINTS + 1) <= point_count ?
> +			attr->mode : 0;
> +
> +	return 0;
> +}
> +
> +static const struct attribute_group hwmon_curve_attrgroup = {
> +	.attrs = hwmon_curve_attributes,
> +	.is_visible = xe_hwmon_curve_attributes_visible,
> +};
> +
>   static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   {
>   	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
