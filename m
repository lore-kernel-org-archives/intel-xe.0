Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEE2C54E65
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 08:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE2A10E6C9;
	Wed, 21 May 2025 08:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y23v+F6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B8E10E6C9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 08:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747817526; x=1779353526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XRWwWlseM9ApaJS3lkg+oY5qoWeeESWt7ucFqJTtIME=;
 b=Y23v+F6OORLGwtH9F9rjFlzbhlnhqvR3Z/nT6Rggeh442u91Ka4Hbacg
 96/VnpM9aodrQfM6Pkzp7FhB4dLpMz+NIsH9UHYdeMnN0G56aN5cyAmOO
 67/GuqwWO/IoBSjk/rjxSEApICEtuP7kUdeJFTqNDHGnPNciVIWMOHgX2
 gA4IjtS12KJeUBttlTOvo/OC6HBUBtp4xUv2eLMAqlpKGbbV+Cbs0Ye4b
 ja6x4rkFONHxA76Jd0NlwJ09LyXh83MANiVP/Q7hBVTbnKcO+LXhjEJht
 mwOasCjnel7SGe7lOr6KduSLkYc0wg34kB+QzwLncIXd6Lt8gWhIaO3aS g==;
X-CSE-ConnectionGUID: r0SMm4bTT9OkD4iRhm5DYg==
X-CSE-MsgGUID: T4TN9vtQS1Orj6Z1RN6JgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49771872"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="49771872"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:52:05 -0700
X-CSE-ConnectionGUID: 71GFdUs9S3CecT9709gJow==
X-CSE-MsgGUID: yCT5mkU+SBWJDHM6ieGkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="140493607"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 01:52:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 01:52:04 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 01:52:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 01:52:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7X5vYBVYyRlJWWLmosWUGo8WLEqISjK2FZ5Z04XDn/uymmmZZhBTsfQ6ctgFrbMI+clPFLExxrOVRPd3zOjILgaEP5udKk03yRPpKt3jgxbYBGASi6BJbdqceNfLLHWaJMDHo2uyg232apURD6q1zQpQN27TQdBuTpWmrRvmIW3D39HDiNYdrx3ylrFwOGs25leBudn8cccu52gXkaCr+V3Y7J5iOYPdT4ceo7cizpuDxsx5wMFOM8sRw/nOxITg7kFogwg+qcEmNNwXtOYpZ4vW+u5WT06R6ikrew4ItQY3bO+jNfIn8VUbMGTH6xD1xdEio5mRvuTC2vVcfknww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHAb7bs8JprTOsDt5uLefdNO4uWM7zN8cvl8ZMdmrNs=;
 b=OsrpG7IgeKBQG+X/4PjfkwRVmv/h92p17agZx59HuwQRaOGTJSrEGCTWfddGZ9vTsi+WkJTu8STtGgmBRdLA5/MsTmRGvHeOzLfO1RvxvKFLWla5G/aZH6ZDRi+ymJ50zLMiIclU+uxS69ewwac8rew6bIyWygfwRJXXSMflsaba0ztNOSj9RxTtsTEwFXv1ItOQyQsj2N9AKXJEU/e5Kbh8JPs0diUM+d9NrKt7rUCxmT+zgmwnIo3lFRgNvBPam6r4/OSsgTvEttHXSQpSlW/xzLVQkr9UQWcC+FFVvympvYAL8+jyn5VKcX2GNppQZxxrP+SQfhko52Z8DLE/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ2PR11MB7646.namprd11.prod.outlook.com (2603:10b6:a03:4c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Wed, 21 May
 2025 08:52:02 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 08:52:02 +0000
Message-ID: <8a5deed0-d5ca-447b-85d3-b0f57d640ee3@intel.com>
Date: Wed, 21 May 2025 14:21:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/32] drm/xe/svm: Support DRM_XE_SVM_ATTR_PAT memory
 attribute
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-28-himal.prasad.ghimiray@intel.com>
 <aCUQj8ns+BteyAaF@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUQj8ns+BteyAaF@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SJ2PR11MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b999d5f-bc93-42a2-b4d5-08dd9844c109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTdBZDF2bmlyVmxZQkp6QjBOY0daUlpKVGQrMGt2T0VVeWpzaVJDOFNDQUlS?=
 =?utf-8?B?T29PMFFuWHo0SWhHcVJpZDcxcVIwYTFRNklXeG9YeXdHdG5lS256U0ZkZFVj?=
 =?utf-8?B?NWhhaGFhaVhHZThBN0s4cU8vU0pzbXRzZGxMTUptWVB1anNsWGttdXNkbU9j?=
 =?utf-8?B?ZENuRFY5Vys4aUZGSGttYXYwTzBLMCtmTDBhc1pPN2VDc01IV1hzalhtV0hs?=
 =?utf-8?B?dEVKbGU3ME03WklyM3BScmo0U2ViMHptQlNzakprSlMxdTdjT1lpMVozUDVH?=
 =?utf-8?B?aDdpVmVvc0ZYdHhIWXdVNWlkVm1sMHAyamppZGZ3S2h2T1dwNnpCSEZ0bmlr?=
 =?utf-8?B?RmJKVUZsbkhHR2pCM2xvUmIzcGExZlk2dzczNGNmTnBDQ3NvOWl2dW5welRz?=
 =?utf-8?B?bUJOYVdCRi9FR0ZLMG14ZXVCcGYwR0VXQUR4NVJFNG02VFJXTlpzSDZNOE1o?=
 =?utf-8?B?b09UMDFOZlZ1MWYraDA4dUNVNUcyNVozc0hxWmFqckkvMFdrSEppWVFUT2pV?=
 =?utf-8?B?Y0h3Y3RUVjFsLzlnNTNYL0JaSExDTXlsc0gzNVhaRkVONTU5RjdZdVdhdDZJ?=
 =?utf-8?B?Y3dYR20vbUFlWVhMOTJUK0t3eGk1K3pKQml6cUlmOTJNKzQyMVhKbDlpWEI4?=
 =?utf-8?B?QWl3eXRlbFg1cS9uVTdGQ1I1UXNuV2FkV1NxOWpaUFJXMGk3WTdFSXhXYjBH?=
 =?utf-8?B?MHJtWEVia2FxMU4vcjRzbWhHUWtjRERYREd0b0F6NG5JYkZkZHFublBmejE3?=
 =?utf-8?B?TFVMQmVsM21KTGFwWW9HSFp4Z1ZwTThleWtGNXR1QStBSTJnRFg3UGdTS0Zo?=
 =?utf-8?B?STBOYU5BemoyQ0NZSFBoQzhwZktrcWY5eFN0dHI3aStETDc1dWJCMWdscHd4?=
 =?utf-8?B?SkVXejlwdnh3RVpKZW9vTUErLzZsbFA0U2VZUU02Ym9qN3pDT1BsQ1RncStt?=
 =?utf-8?B?all3Tit4Y25pNlVtZ2M0K0kxbFB6UVRqWDR3VEYxdUhKbDA4TFFiMzJQMUNz?=
 =?utf-8?B?R3E4YlJSMkkwTlBPR2xJUUh3YU1uMVczN2o0dXhyTE14MmdKOWRKckk5WTRa?=
 =?utf-8?B?a2lIeTlRRkJZMGF3RjhUTWdxYzIxTUxKZlhVQ0xtRVEwUS9FSnhwdkFoeVlG?=
 =?utf-8?B?b3RDUnh1OG5FN3crQ1VnaHJaSC9ma3NVdFk5MU5YcC9YcGlmeWFJYUpuV1Ey?=
 =?utf-8?B?N28zSHZKRlR6MHY4WnI1L1dOUUR5NW5IYTduM3RwdUpyQTZvcmlQOWgybnRq?=
 =?utf-8?B?NVB1T3g1Z3FNSVE5MEozRnI5SDVUbGFOSUh0TVRnSzRWdkJLdklpRDV4U2Ur?=
 =?utf-8?B?SGtXMkdGcVZJUW1tQzIyVHB3Z2RtWXZQYTAzVks3cThva25WdXowOGFiaG5x?=
 =?utf-8?B?Z3N5bWpzVWhBUHR1SEJKWVJsT0NVcFpPajJPUTQrZE9qNndmbXVrM2dMWkF3?=
 =?utf-8?B?T3E2dS9YM1dHemEvMU9OdGY3TEJsVnVJOFpqOGRCSXBlRHVjbnV2RDFmZGV4?=
 =?utf-8?B?Y1JVRm56d0U0dnNYQ3IyUU1vZkRNZmNtOE5kbkp4L1VRMy83UEhvNWNSYjZZ?=
 =?utf-8?B?R3Q4TVNNNyt1eEpKdHRMS1orMmo2MHkrT3Y4d1E5Nk9yaVhTcFByYlhWT2Jp?=
 =?utf-8?B?ZUNBNUtqQlQyYzZXcldDUTJVdmI5TjlJbDREa3psYWRQQml0d21WVFA2aFJS?=
 =?utf-8?B?bmIzaDZFZHJoR1Z5dEFMdXV4a2x4bUZQRzNDU1NIQmdLbTk5TUdmM1A4NXNT?=
 =?utf-8?B?UkdtcHNYZ0RwL0RqNVpWM3A0UzJyOHRXVkZRV2Q4ZkRydFZuWDl0MUthUFFZ?=
 =?utf-8?B?UU5mVHZGSFNoNy9PdU16bGRWYy9iVnJWdmRveWg2MWxFY1VpY3NTbTdyTENN?=
 =?utf-8?B?Z0FTRU9yVWV6RG5Fbk1ZenN0emIyRVhKcCs2dTNyODRVWHdXYnh3WjdOeTRa?=
 =?utf-8?Q?05XmAizj83A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdJNGxVRTBZUVNYUUJJQjh3cW5kMTk2K0JEWVZyS05jcGRNMTdmKzN2KzQz?=
 =?utf-8?B?Ym5SWk5yc2puRmRibVJFTER2T1ZlaGJxQVF1bUNCcjg5VlNGdEhwRW1pSWtz?=
 =?utf-8?B?QVcyL0d2QnhxOG5TTmgxcWozd0pLK3h5MFZrOGhhUTVvM0IvRU5ENDArbVBh?=
 =?utf-8?B?TVRrVkgwMjA3TEt4cU42NERwb0F3RjRpVUdIZVdLaTdIc2phMEFRS3JVYVZW?=
 =?utf-8?B?elY2U1ZiSnZxUWlIN3FGRDQ4RXlNK3gxN2g3M045dEdMS05JWFFuL1Y5cXVy?=
 =?utf-8?B?dG1RL1lrUGgvOWY5UGk2amd2M3JFemkyM2l6b1M4VWxOUXlxckozdkJBdnYx?=
 =?utf-8?B?Z293OWtGOTlOSTJ3K2dQMlFhaFBXV2dvcG9OU0VlUlJ1ZHJ0SitsTGU2ZWV1?=
 =?utf-8?B?RGQxRFhtTWcvZEhDTHA3RW9qTUMzSmZkN09Pbitqa3g2VVNjTGo4SlJSanhu?=
 =?utf-8?B?MG82VllXaVlvNWV6NFkyOXMzK1BNTDg3MFVRaUNJcGpmcjQ4N015VnB2b2xw?=
 =?utf-8?B?a2pHR1FrTmNqUFVFcXFLNzN4eGNUcmFjalhjMEhpWC9GQmExSHJ0dGVkUmNv?=
 =?utf-8?B?d0ZYeDQ3ZlZEZzFlTzBUNmU3QUxFUTFVbDlKU2ZFN0FENHUzNHQ5UkpscUV0?=
 =?utf-8?B?UnNpTnQyczNHRUV2YkduM0NocldVV3JkNXFuN3Z1ZnRBbU1aM2lVVXowYlJE?=
 =?utf-8?B?SVBLcjNhUURNTnhnWDNMYnZxN2g1VmlabXN0R3B0c3lRV1JRd0NRQzdHNHR3?=
 =?utf-8?B?VFdRMVhwN0ZvdFNURUJrQTB1Y2tOZm5maGlhdlJVQWdCUFI0S21ISnpFN2Fr?=
 =?utf-8?B?VDhnUlkxeUNZTFlpTytuU29aZml0TU1DRkJRWWJNS0N4a0VEbDlWSFFBLzQy?=
 =?utf-8?B?eTJERWo2TVdCcExkKzVaOVpBaDhLNDU3WXZUUFdiVTVuNW1nL2Qxa1NqVjIy?=
 =?utf-8?B?T2wvYVhUb2RLcmNzcnlncDNwNHQ0WElCUXdPNVFmQ05EemswRy9CUnh1QU45?=
 =?utf-8?B?ZlpJQ0ZkOG1XZGV2SUFYNzI3emVIMDViRlNScHVxVVZ4MnBCbDVGTFBWZFFJ?=
 =?utf-8?B?MG5BOWh5Q0N4ZHJCWjRsZFUzMERCWlQzeXI5VkZ6NU1DdWJzRGV2LzA2WkYr?=
 =?utf-8?B?SDk2cGhIY2tkclArTm1ZR2xCWktaWDhNVXN3dHVVa1dSZGVzT2cvVTFZc2dt?=
 =?utf-8?B?MDdsc1FtMGhGUUcvbWJoVDRIQTA0MllnamExL1JSb29oUURWZEorQ0JBc3dJ?=
 =?utf-8?B?TzJCdDFnVGdrNDRHbkd1VmZNVUZyS1daRHRHTDVxVzJ6UU1UZmFGdDY0Ym9n?=
 =?utf-8?B?WDR1WDdPNHhNaURQSlpPQ040ZDlkRWJCVU1vZGt5THE3VUt5L21oSHR4ZVJH?=
 =?utf-8?B?dWR3TktoUDkrOXR4UGxNZDltc2JhZzgrQUc0aU1ET0lSTG1xMWdDTDFuVkZt?=
 =?utf-8?B?d0VEMWRiM3IwMitYTU0rK0V1Z0RtNWp3OHp4M1hRdE1zMTAyYmJNMFhLMkhS?=
 =?utf-8?B?OVMybXh0cVdpdkhSVzBWTHRQYU5NR3ZINkFjYy9tNnNHRlR5RElveU43c2Vz?=
 =?utf-8?B?R3IwMUJyLzlTbHBZMDFOOWcyMGNQRkxGeTlCWTY2Q2x2cXJtNnhVZ2xiV2o0?=
 =?utf-8?B?WFlSb29kTTkvSkp3QXVzM3VZN0p2amszS1licS8wbWl4UC9tR1BLYjlOeTdh?=
 =?utf-8?B?Uy96L3VRZ3hoRTZhNzNPelV2cFJJOHhwaTdvVGVoWEluYmxTOUF5SjJDZm1h?=
 =?utf-8?B?K2EvaEYveENrVU1ZWjlXMktiWlpTNy9Ra1E1Q0hjOE9GaDZiU2VSUStGMkhR?=
 =?utf-8?B?WVg2R1dCNzZvVkJTQ1gxa1hYa0F3dnZ0RUFJNW9kK0N3cFpLb1p5Z3BxZE94?=
 =?utf-8?B?S1gvRXJBZi9iK3FseWs1QVkwdXRoZFNOWjh4bTNVSzA1OUlrRlZucUVzZHB5?=
 =?utf-8?B?QjlaRzNUTkxkQ09UVURNNnU2WURwMHdjYlVSLzRRMThKenB2WmNBbDFDNGJu?=
 =?utf-8?B?eWNVNXhkNjF1dkxVWXJLYTFOc2JzenRDbzF6OEhmaHRqNXhNaGl3R0JUVG56?=
 =?utf-8?B?KzVqcTdsQ2xhZ0NnSllTWE8vU0xlbzNBZnYralZkYTIrc3VmRlpHclVxRzFC?=
 =?utf-8?B?V1E0N0JHNDVYMjNUQ0RoaWhMY1BWamM5cURISHNIb0hBOHYxeVU3WDZDbTU1?=
 =?utf-8?Q?nhPD2MjqLi8Q0XbDXC+5tAM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b999d5f-bc93-42a2-b4d5-08dd9844c109
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:52:02.3563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yx35F48vaLp3BMRs0feWeIP/3RRzJIiEalWYHdoxBGNdC1Rey5DA7pk7KHejduw1hdG7LQ3kQIUTHCkfawrCJyMBEhLiSWYqfkKWMM5dYqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7646
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



On 15-05-2025 03:22, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:14PM +0530, Himal Prasad Ghimiray wrote:
>> This attributes sets the pat_index for the svm used vma range, which is
>> utilized to ascertain the coherence.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index f870e8642190..f4e0545937b0 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -104,7 +104,14 @@ static int madvise_pat_index(struct xe_device *xe, struct xe_vm *vm,
>>   			     struct xe_vma **vmas, int num_vmas,
>>   			     struct drm_xe_madvise_ops ops)
>>   {
>> -	/* Implementation pending */
>> +	int i;
>> +
>> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_PAT);
>> +	vm_dbg(&xe->drm, "attr_value = %d", ops.pat_index.val);
> 
> I don't think the above vm_dbg is all that helpful. If it was per VMA, I
> could that being a bit more helpful.

Agreed.

> 
> Otherwise LGTM.
> 
> Matt
> 
>> +
>> +	for (i = 0; i < num_vmas; i++)
>> +		vmas[i]->attr.pat_index = ops.pat_index.val;
>> +
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

