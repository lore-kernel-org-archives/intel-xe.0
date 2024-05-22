Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603FC25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7D410E1C7;
	Wed, 22 May 2024 17:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGBhU9st";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BB810E135
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397287; x=1747933287;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=Drm4l+0byfwwOlGHLMl27KlmssCa8yuFrhbksQC2kXQ=;
 b=AGBhU9st/vVhqEtPKxzvq0DGkQNF9tr2NKW4aHF+zioelsOc+lxlxvMN
 hu2VoaiJBH4z51w2U2qJsbWIC3hYnOEK1OF4zKPpuM6j4kvFEhO/uGazi
 NvaJEB6i6rE1bOGA7DHjwuJFDQ5Pa40NpvvTA/a8/78zBAXAKexKrnf9H
 CPkSWjf1/pLvFPN9KSOUs/SUzeGZcji+1ykE1T/GlUQykMoar67JDA17D
 mFTGNEHsQ1tAp37DxxqGCLNaRLLfmiUkJfiICZ8va6fIX4AndkD9i56vb
 Yykc6zY3eYJxnmgHf9UPUYj7yMYkA14FjYiXSYQ4Lu+NCtQNmvzj9s9S+ w==;
X-CSE-ConnectionGUID: KZkXrbxOSf20k/Lth9cfgg==
X-CSE-MsgGUID: /wl0IFq/QOSJ7nXlheBpOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23239420"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23239420"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:17 -0700
X-CSE-ConnectionGUID: zPPI2oeyT/OBy2UEPo+pEw==
X-CSE-MsgGUID: 41I4WPVjSxi/f7qTXI2vow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33218470"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:17 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maZwGq7UaEPgnGlikVjBo3g5YiJZwqHLOgshyXcXpOqbE2aO4+O4myLsP+CUE7yaPfz/ztyHuYS05509AO42CfLzCr1PUUwIudUKOW7xrPnu19jG8pLnbhI+p3ZUoneJ9SFtbT5tmlrZNp8c9IbrwKQdn+FpIc+ILGQffULa8k71u1YMNRtr9DMlfIN+do+bST+nXbH93b+Sqzng36j2mgmTMgROiPlTOU0yEAIJXsGesVoS/qgLtILvo4mTDovUCvAscgy2bcDXrLqQZNJbjCzFEGUZG7YEoSlyo+/5xw1/jSO/J5IMOeSSaD5b6ngmRFrgNRDYsutwSG0ogQulng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvwU3B4Rqmc6bBUgXDAqHKR1i8R5K9IZWqZckrph7Ec=;
 b=RyZcjufhPhgkU4xso5l9uHtxu6r1fZ0MEZgIfQV7Ps7h5JW1JF18vkIDB/PxkokqECAm2HckzgfYQCcHHxbYc7dNfddf4E/mSk3dTcJ1U3blmwqE1fswejNDghXI/amyPq3iqHHeshex8mF07MYZtplGS2ysabmJXcd4x4DlfEg524DU/7Zaf/oMpERu5AtZCpYwkg6SDbykWvutIMQBtHTOq2pLoZsFM/8LheLm9wlFvJU71IlzgDgYq//gU9OWtFFENJq4EIwd/4/uGFf8VwY3U8E9Aso96omBg5876M5rtqxqJ9zGavfrkH5570LyDCBaEfPVAcuKESEgyH80Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:11 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>, =?UTF-8?q?Thomas=20Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: [CI 1/7] drm/xe: Fix xe_pm_runtime_get_if_active return
Date: Wed, 22 May 2024 13:00:59 -0400
Message-ID: <20240522170105.327472-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a3b8f19-a49d-46a1-37ea-08dc7a80c7e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0ExWEE3dlRZMlcvNndkR3ZLR0xBanA3eVJlL2E4TVY0SU9nWFdKM2tPcys5?=
 =?utf-8?B?SERtM1BYMGlVZWxCUnVaem9NcFJEMmRpZE5NQzFDM2ZHVTVaUXpkMGVEQm9T?=
 =?utf-8?B?OElub2dRY1hxVTAxTUg1Tzczd2pVMVlRV2hhUjdBbmZ6cHdBMmRWOEM3MktB?=
 =?utf-8?B?aEJJUFlXRS9QVHp3SWFxQnQ4ZjBjNVBid3lMUkFQSWlmNGpCSzBvMkhxSlAz?=
 =?utf-8?B?OGZudXpuam8zQ0JZbkphMzZJTWRjczJsS3A4UU5jWFJUUkFZTWhEMncvbDhx?=
 =?utf-8?B?ODVqV0dOZUR5ellTOURqNFNKVlRNWnNJNFU2aDBMSHozWkVyZ2ZkUVVrV2NW?=
 =?utf-8?B?Q2NuWDJTL0ZEVWhQbWRzeWh5alNSWWI4OG5IRFdoNHN0ZFJFak9qMElhQzE3?=
 =?utf-8?B?Z2I0cW5DNjkxSnN2ek5aMWhFKy9qNk5WTHpYZUJDNXFwNjYrWloyRXdJdEhm?=
 =?utf-8?B?emNlMGhCVVRJN3pTb3hDUzVkeDB2ZS9nUFhVYjluQWduKzgzMmpsTmhGWXJv?=
 =?utf-8?B?QVppNTI1RGtmTFhUaWpJZFZyWGczcndKUGwzTGZ5L0MyRWtGWGNDeHJkWDJt?=
 =?utf-8?B?SElKS0xhYkZYYWRyUG0wTEdPcnBCUlMxR0pEZW5mUHhyZDlLeXE4a2lCL2pk?=
 =?utf-8?B?aUdwRCt0dEM0YjJEd3FHT1U1Y1gwMjFOTW1zQjVqeHdwNTZKdy9ZVW9LbUY4?=
 =?utf-8?B?STNRYzN3a2prMXlpNy8zYzJFeUNRYmlTdGpxM1BNTkw3OUx3eWY5ZGZmZ09a?=
 =?utf-8?B?aTB4b0lHTUNod3g3MWh3dEhxYTc1eVhWcFJPN0ZGMXdia1ZSL05GRGRMVlNw?=
 =?utf-8?B?NzRrWHhEdVNLVVljbnF4diswUnlBZnFSTFgvL2c0QWdrZm9Xd2p4UndGVkVq?=
 =?utf-8?B?Z3ZEUnByNSsvMks1SWlPTStDVTVRcWQ2d3RUaE1YcmoxL2dpMHI0Y3g5a0Ni?=
 =?utf-8?B?WGZDeTc3MUlWdnZZcFdIY2RUN3NVeVZXeUI5UE5NTFA0bUxSVUh1Vy9neDlZ?=
 =?utf-8?B?OVoxLzB5UUxhYmQxaktxSFExUVVSdmpPQVpWSlVQdDBVZVJzMWZLb2xUTHEr?=
 =?utf-8?B?dTFjKytxZjFvZzY1SEhvUDdXaG1LamJBMkR2cUd0TWJvSmhDSHVSNkY2UkdE?=
 =?utf-8?B?V3c1UC9GUCtGaWIwbUVDQ0YrUjBNREJmZ2RoOWszSTVtcEZaUVB6b3I2bmV0?=
 =?utf-8?B?UFlFNm0vclJKRFdXY0IreXBRRWtNb0lwQitENU5aekJtTENtTXNTdGk2aDVs?=
 =?utf-8?B?dVJ4c1BRZ1YrUUwxaDBkdFJSU0U1czg0bm9QQ000WkttY2lCRHVIdWNFaWpJ?=
 =?utf-8?B?VEVzOFhCeWx1VjNGRC83aUFZKzRVWmpQYWxpaWgxcjQzb2poY0J1R3dSZXBJ?=
 =?utf-8?B?VUt4UFVrVUw1blVMQUh1VGQ5MmY5STZnemc1QmhpeE9VUitnR292WlVoSXlD?=
 =?utf-8?B?ZmJQeW5zRk9scFN6dEpjUEJFYkdxRUZEa0RzM2Mvb3JoVkM4TXpnczhUazZB?=
 =?utf-8?B?V1QxaTUwL1pQNjZNa1R2dWE0ZWFleUkwckJJNlY5QXV6byt2WTA2bS95SGk2?=
 =?utf-8?B?QzNRL0w5bGpIaGZ6dUtyaUp0RlJNblVTajNIQXBncERXSHBaejJ5VHZ5bmR0?=
 =?utf-8?B?bWpHQTFtbVBqRDFPTUhyMWxoWk9ZNHVlUVRyTkVPN3IwVWY1TGUvRlZUbW5y?=
 =?utf-8?B?UnB2MFpoK0ZKMEVZNGpUWjAyN0duRTQ4MWdjTjN4eHdBZHA2RXVNOXl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUxwcHFsWk9HbDRUYXJZUHcxZUJtOGdNWnJJTjM5bnNBY0lsZWJRaEk4Y1Iy?=
 =?utf-8?B?clo5MEU4QUJ0OW9jdUZxamRoYStXVTk3SlU3T3MycStURzlhMndhOHd3d0sz?=
 =?utf-8?B?WlkrOGxISTR0eHg1SEczSjUvR0RuSy9jVDl6eEhoMTQ3eVNOV0dmU0svUCtK?=
 =?utf-8?B?UzRQRmNZbU5rSEtjS3ZheW9PUVp3dVpoUmJwYXE0RW1pVUNSb3Vpak45ajBE?=
 =?utf-8?B?K2J6ZTJNbW5mTVFNeUVxRjNrd0k4S2U3YzdZUlJ6WjVEVjhRQnNpVXBQTUlE?=
 =?utf-8?B?OTIxd2h5WUg1LzlTVWlrMGF4TTlWemdpTnJIWEpySENyZW92akpLcG1pTmtw?=
 =?utf-8?B?R29BejFPdWZNdUZpR2pwdjJCVTJPZjNmTDVxaXNSMVQ2dUM0VUR4MVBTUFE2?=
 =?utf-8?B?RlhKb2IzYmNPSk5JaDY4Q0hIOHF2Vk9RL1lKb1JQTXlvWkJ0L0M0WDJ3Wlkw?=
 =?utf-8?B?ODJHd1BCVXgvQ3B6MnZNSXJhZFp4UTFKYS9icVlwOGVQbE56OUt1Qll1N3U5?=
 =?utf-8?B?MDA2dkpUSFdUWGlUT2F1VG9DUGJyakhqYXljdmVDYitpVTRMR3k4ZG96cHk1?=
 =?utf-8?B?SkRGeWZTNXpSS09YczdWYUF2U05haXBPSjRjSFpCL1gxVDJ6cXdwRTVNRExM?=
 =?utf-8?B?SmRkWnZYL1E5QkxETXlva0F2Z3lFNUhLQ0VadHVrQ2t6aEhURGpPV0ozZGY2?=
 =?utf-8?B?c3ZQLzlTTUoweG1tK054bDFlQ3lXcjRjT2JWRU5ReVl0OTkxUEsyQjR3MlZB?=
 =?utf-8?B?bVVmajQ4d3FlbDVDMEYrYmRaN0UydE4yOEl4STBNa2JOT2hMRWxuc05oZ01F?=
 =?utf-8?B?TDF5djZBKzZEdUNIelk3OTJuMlh4ODdZOURBNmViN3lCbnV5THJhT3BacTNK?=
 =?utf-8?B?QkVlNHhkUnhUNGJ1SGt4N0FsdVI5Y01JL1ExN1FZcG9BUlk5R016VEFZaUxT?=
 =?utf-8?B?ZW1KMVFMc2hqUXZJa2c1T0sxZXIrQkhxNXNMZEIyNTFRTXp4SFdoMlJpSUZS?=
 =?utf-8?B?QTZaVHV4U3dRYm4zek0rU0lWbCs2ejNTMnE4dEdNakdWSGtGbEhOSUFRWmJL?=
 =?utf-8?B?SWNDNlFuTERDelRuRFlGZ0kvLzRVTlh2WDFPOHNkZ2tNUW52WmpNLzNOSHE3?=
 =?utf-8?B?TkdCTVE1SFZWMlY0QnFIVUV1SW5QeW9qQ3Z3Nmh3ZUNNZDFaZWlrbmhrS0lz?=
 =?utf-8?B?UCtzWDlRdFdyRU00SWNQb25XVXlBZXBrOTNDcGpWMnBiMmlDeGZ1MnJiTm52?=
 =?utf-8?B?VC82VDh3SGlXeGJzVlNOL0krOEZ3V1dRZTJHdjVReE15VmtEblVGRkZsZHNL?=
 =?utf-8?B?MlF3cTNKMXhhZlU1dlZQa2liWndiRXNteVlKbWdYcStWMmRXSEpqSC92Sk55?=
 =?utf-8?B?Q2lRblF5QVZIWjd0eXJORE9CYlBDckdGdTZ4VU94bzR6aVJDK1R2THcvL2Rl?=
 =?utf-8?B?cEJwcC9yZGF3d1lGYlo1OERkaldkZS9QK05xMXJ1NUNuVE5oVmZCOUYwN2lr?=
 =?utf-8?B?cG5wYnIwbDFpQkhVN0FmckYrR3l0RjR0MmlUYmg1U2kxaFVoSDExT0ZhT0R0?=
 =?utf-8?B?RndNMFRLWFhDYnVqUHFXUXhrSkJaUHlIamRoOEY2M1pUTVFRdnFUV0NSWDBH?=
 =?utf-8?B?cWJZTG9tbjdVM0JrTkJhMVNvZ2lwTFNDeWI5aTVQVmN0eW9hT0dEMnJVajNx?=
 =?utf-8?B?S29BTjhlcWVBOCtBQ3o1eXNTUXpmVm5nQ3p5UXJqc3A2RE1uR25rRTFIMzR1?=
 =?utf-8?B?azVlenBlRlJNZElXS1dmUzI5YWt0d050ZS9ZYUdlRmdlZHc4Z3NEcVI4TkxJ?=
 =?utf-8?B?bnd5OWwvUThSZmZ1TklUcEo1NXlUUUNRMWdLTW8vaEVDR2puRmZPaXJTNUhO?=
 =?utf-8?B?Z2g0M0RxMVdxVzdMWUdzekV4c2FUM29BNEkzNklpbnBGSUE0K2paSTVBOUxp?=
 =?utf-8?B?WlFiSzBQbllLMEZMMmNmQmczUlJob01iamcwckF3RFZwdWI5WC84VmZ2Snli?=
 =?utf-8?B?NFdaREQvZVVNTTBiWmIweElUclROWml0OW5XUHJWQkN5NGUyZVpudW4yeC8w?=
 =?utf-8?B?bXhhbW13SVJWWjA4ZFQvOEFuR3dNM1dsdC91bWpBdFF0ZUJMdllPcnduendm?=
 =?utf-8?B?cHZlV2xyYlB3ZGtmbmJtQUhNNzNFbjdKZGZCQVNxUXVMbnJ0dkp0czFwQ21h?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a3b8f19-a49d-46a1-37ea-08dc7a80c7e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.0470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIS9SFsGROmvMtmBxzb32SQHAEFAw42ZrDolM4dGEg4rL4DTuC9PlfhxjHXOaRzWuor1IbZ5/L+iFv+4jedZuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Current callers of this function are already taking the result
to a boolean and using in an if. It might be a problem because
current function might return negative error codes on failure,
without increasing the reference counter.

In this scenario we could end up with extra 'put' call ending
in unbalanced scenarios.

Let's fix it, while aligning with the current xe_pm_get_if_in_use
style.

Tested-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 8 ++++----
 drivers/gpu/drm/xe/xe_pm.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index c1831106ea4b..d14741f35cc4 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -505,12 +505,12 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
  * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device active
  * @xe: xe device instance
  *
- * Returns: Any number greater than or equal to 0 for success, negative error
- * code otherwise.
+ * Return: True if device is awake (regardless the previous number of references)
+ * and a new reference was taken, false otherwise.
  */
-int xe_pm_runtime_get_if_active(struct xe_device *xe)
+bool xe_pm_runtime_get_if_active(struct xe_device *xe)
 {
-	return pm_runtime_get_if_active(xe->drm.dev);
+	return pm_runtime_get_if_active(xe->drm.dev) > 0;
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 18b0613fe57b..f694005db278 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -29,7 +29,7 @@ int xe_pm_runtime_resume(struct xe_device *xe);
 void xe_pm_runtime_get(struct xe_device *xe);
 int xe_pm_runtime_get_ioctl(struct xe_device *xe);
 void xe_pm_runtime_put(struct xe_device *xe);
-int xe_pm_runtime_get_if_active(struct xe_device *xe);
+bool xe_pm_runtime_get_if_active(struct xe_device *xe);
 bool xe_pm_runtime_get_if_in_use(struct xe_device *xe);
 void xe_pm_runtime_get_noresume(struct xe_device *xe);
 bool xe_pm_runtime_resume_and_get(struct xe_device *xe);
-- 
2.44.0

