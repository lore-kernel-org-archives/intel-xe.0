Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D369BF53D84
	for <intel-xe@archiver.kernel.org>; Tue, 17 Mar 2026 05:59:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEDE10E0E3;
	Tue, 17 Mar 2026 05:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9YRCt/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBDF10E0E3
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Mar 2026 05:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773727197; x=1805263197;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4oqzvHODtIrMywLNfHWWLsB09PO4HGkt6zCVW6V8IK4=;
 b=T9YRCt/gdN5Hv0kUMesTnCx/wQa1XEjaz6EZRAGsA5oRcXcfeJDF7IUD
 uPPwEZ8VPS1oQCMiKdgM/+vhk1PZ/c/f+adw98GYqGj81YiJDEVeK+bHk
 BgY1+xR+5L9FVeLAPU9dLain9mgTXZcae874H9lxm+MZtD41w9zMeGyph
 tb+f64y4AbH2k9lF28nxfgEB8l2lnVtDlAn1pgYratVsdCXqgBE8frA9P
 GOLNck5vAVgpESxG+oLnM4dnrBzlarVPVJXbhmCzHAXGNSNCvlkT/2LIU
 5zcYxco5mgCbkfoLb6RoLqd8zKGZr4dYnz6OK9DAgkcpvhep2X8iGDRHu g==;
X-CSE-ConnectionGUID: LP4TxZsGS2aVZfxRmrjghw==
X-CSE-MsgGUID: Smj2eIP0T3e6WgdJuXt/Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="85447713"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="85447713"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:59:56 -0700
X-CSE-ConnectionGUID: dA7L8b3ETlCJVQSOAMy8dA==
X-CSE-MsgGUID: 23ZF6Q+0SbiifvmeR+qi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221392743"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:59:56 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:59:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 22:59:55 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.21) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 22:59:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntIm+x0BJaNXMWG8dFTO7U5QOZq0qdwXMnKQVsH4XQf1f6BITH3LahECFNSGXexun+K0n9x/MrGTaINYZqiIpP+sOqqMJigAX12Jw/OeC1HR7d7uJI6fMm7xB/UTvXCFtxM+RNVoUoaSdel7Oblh2JPmSdZdMBv8/dbmGc+ci1h1M00B1tsqtaDDOlKMNHwHjgzUShuroABfgQElnpNwgDsqxxvk5NIf2gkTDTV3Sd87YNlfuVydIsmarcnUeb7rxjgb/RXs6T7+Zym9Y9phWmAI2SRfkaOBqyz9rOfB7LF/orrx2Tsl3RwOxdb1YTbD6z+mtFrWUvQIF0HYBHR58g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B31tO97X+QtH80iIi9kzMMjwayQ21YbV63cxcDXSQvQ=;
 b=bYW43kS04hfrfofK7UPKcRBSzV3H7ZHa0qiNYCGhag1OLfxZEpkXRhZxY449BvWCrh+2lAgQz/J1HewFhmlJM36ao25cHx63K7xCdshaEzNL/OIdM+dVyjqrhaX3QaFP5ZxL7j9I10aF930cNcgfWMTdbfzi4RNzRRbrrchtozsfa9bS/sIPTAZ/PDZIYnRP/99fmlQx2lG8Lo7Xj6mvwgzc7ENzRYj9k47IMPCCk04kVDh1jRj1w6tBSUFGtBnEPdG0IloQfKNMLaaehOIsEC7kOFVnzHzV/5mLUU6vMKy/UM9UjUYoPuxiiXTTjPbyxT3L1+nN9DVKNj98kakHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6)
 by IA1PR11MB6419.namprd11.prod.outlook.com (2603:10b6:208:3a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.14; Tue, 17 Mar
 2026 05:59:52 +0000
Received: from CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f]) by CH0PR11MB5706.namprd11.prod.outlook.com
 ([fe80::30ac:8e5:b7c6:524f%4]) with mapi id 15.20.9723.016; Tue, 17 Mar 2026
 05:59:52 +0000
Message-ID: <2c8c8d53-d66d-4979-a0e6-8fd0e91bf046@intel.com>
Date: Tue, 17 Mar 2026 11:29:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/12] drm/xe/bo: Skip zero-refcount BOs in shrinker
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-13-arvind.yadav@intel.com>
 <79f4260f85a1f00a3996406b3314c2db5873322d.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <79f4260f85a1f00a3996406b3314c2db5873322d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0044.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::8) To CH0PR11MB5706.namprd11.prod.outlook.com
 (2603:10b6:610:ed::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5706:EE_|IA1PR11MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 789eff74-1852-42ba-6f57-08de83ea6806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: E/UzbhD45pz4KkWRZ5fWzh1E7bjm7GYJJNETHHVvJ1JTA6zxhWB/TaRo/nWRpd5Mgq3KPKhTx0oA5rJhPCk9amUntXTO8aRBhWuHGunAcQVb0EnBK+LZpay/JoNX8nhlZm5s01rd08w/zwsySyjFVrCRfbLngSklX8w33BOC3HgkK7gEXZNkVQkMor5jbA3jvx65h8nAF/3IIZF+N1Yy5MniwT0UVHmEYBhkLnG7/T5amP/+w3oSlQGWXXEqkebQTgzFp2l2QvREWctVSCVqWx9NIiPtt6WLDp3W0nBc6SeVZpRk6LlIFHybJoO6KZmFFOv/5yAIiyLKEOA+7Sw7cDlJxyuGtSe2W9H97sBtXV8LpMUF8uip0rfiha2gGgXsBKtl3PnZh++o51S4+g6jRfaoi2IBKPTDStR4gRjLdB5g3vKUAHwnTeElmYfGwM+8lwncofd+qNt54T/Sw1U2YH1tppG3JWMwLQM6MY4e2viWVq9ChXdgnzltAyjUnHYQQ1R8Pn8xYHsHWsLB91piLs9IKjYPYkl7GeyqzXO+VaC1LYhV//XRRRLHyGq2lJFfNvyodL5vj/lpl9SkEYiy1i2LZc1w3k8xCpOjrdFMEVzk/VFKnfgyWZjpNg6JnGut3vhkgnbCkQ/dlOEgFcYNNNVyi497KivpBUv9pZOQNa9B0afcZpASEfnhjylNdR5s0bunp5ajoCOL5LALBD79qNJPpxDyNax5ei58qgzyVOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTIwK0gxa2FlVXBLTXd1cXhNdnFLRHpNMWFFRmR6OUdZTkJkNUFmRCs4U3FK?=
 =?utf-8?B?Y0cvMkN2L245dWNWQ2ppak1WYmgrWFR0MDlyQ1pyN1lWWFlCd0FsVTlVUGcv?=
 =?utf-8?B?MGhsZ2VsRUh0MkxXZzFWSDRlS0ZSWjJiMjJSQWw4ZnVPeWdLRGFMclNlK3E5?=
 =?utf-8?B?MFFLQjZJYzB6bDliTDlkeFp0OTl2bTErZWRaOVZnN0Zwa2JGZHd6alZnYlpr?=
 =?utf-8?B?MkFZdFpLbzBYb1BWZWtZbG5Teit0cGZiVVJBVDdkZHFZakFnWFFMZjJ0bE9m?=
 =?utf-8?B?KzlydTVyaVl0MVJPdlFQM1FiaXVnNWdmWGRlMmNQVGlnbDJuQnVGQ0xsTXI3?=
 =?utf-8?B?MmVBSEY3dXpjYkJINnRuZitReVhKOGRoRnJsRlZacHVXdnBCSUxGd2lTUjhY?=
 =?utf-8?B?d25ITDBaUmhKYnlLcWU0eEFwc3E0b1NUZHZyQS9KeXFpdEFFU1JQWE90cTNq?=
 =?utf-8?B?M0F4UjVmRktSQVgxbmtURjdMSUFnU1JrZmlsaDVTTFQycTZ1bXg3WjBBcE8x?=
 =?utf-8?B?b0ZVRHVCTU1OaVlSOVR1eVRvblVvQmlrbVYrWHNhdDYra2NseGNBbUhPdWhn?=
 =?utf-8?B?R1lsVDRUenFOV0NodXBORXdVRE11dTRkTVFUVUwrSTF0K0RyWGFlSFhybElh?=
 =?utf-8?B?WHdKd3lMMzREWVF4ZDF2SnY4bzJKR0ZFOG1acUpzOTFsc0NQcGpyVzlVRUgz?=
 =?utf-8?B?UGMvbW5LdUZ0b3hTbHluZkc2ZU05MW5mZnpzU1RjOG1ETmNJUXJNcGF0S084?=
 =?utf-8?B?TVBheXo1QUUwYVpCMVNid2NvTE5QWVlqajNwdEZibUU5cUZxT05mUmx5bkdx?=
 =?utf-8?B?enBXdG0vL3dBUjYrZExDTlFwUm43TzZZUjVmOVJWRnZXa0lXYUtjYXZKbXdz?=
 =?utf-8?B?NVNUbHUzd0hUSjcvbVRiQ1E0bnJhWFdzVWUvbSs3cDJMcUlEZC9QZWhhM0Ir?=
 =?utf-8?B?WUhqRjBqblFkb3ZDQ2V2VUpRSGVrSmQ2MTFybzBBM1BPYlRCK3ZzdmVZejlC?=
 =?utf-8?B?Z3IvMGRhU2JNaVhzMUU0RE4vS1REckk4QkV4aVBrSzVjS2txZFQyZko3NkdR?=
 =?utf-8?B?clZJbTVibStWYWVmWmc2YjF0WGk1MHM0cUVBYWt2U3BGdFFlWjg1QUhSak56?=
 =?utf-8?B?YzEwZHl0dW1MY3drWnlOTGtRenFuRXRsZTNpWWpDWXNBSm5aNVRBZGFENTdX?=
 =?utf-8?B?U25iZ2lvMGU1MktsUm9SV0UxeW9rTjNhL0pxLzI0S3ZueG56VGJRZkRnZUN1?=
 =?utf-8?B?N1ZMVjRQWEJNYjAzSWxWb2hraTdaaER4OUdsMWhkcnV1VmZ2QXZtQ0FPMllP?=
 =?utf-8?B?UTdXYkxBOVNQTm92NFNJc1U1ajJ4UjZSbk91TzZmY0dQb29Qa1BYMXYyaGJj?=
 =?utf-8?B?Yk9LbkFheWREQVRwdDJZVlVmU3VSdjRFbVBXN00wMUlQYjRZN0pPUlpDU3ZU?=
 =?utf-8?B?djlpM09xclhXRHAwZWZ2NmJmQ0FydHRyR0x0bXdheFlJVFVPb042M1c0LzVG?=
 =?utf-8?B?MDVNTkF0YUNCSHozbUJydnEzSXlRUE5qUVA1Qlp1T3lFdjZhUTZCVmVzR0ZY?=
 =?utf-8?B?ZHNld0F6dUpFUjE5RWxvUm93UTlzZW11TGxNSGpmbGxRZUU4R0VhTkZCelVq?=
 =?utf-8?B?Mis5Qi9MRUt6enBJT1VMMDVqbzVOVEF6cDkyYU1oZ1g4NWppeW1zbnQ2SWZs?=
 =?utf-8?B?RFRUYm5WaHI5bmc4dzhnOE1pc0RjaThwd2hIZDhxUS9DYjZuNmU1c2FOVmJI?=
 =?utf-8?B?Mkx5RCsvOVd6L09oNExvU1VXSVZHWnltTkRJd2RzYWNRQ3BaVkdJNmtLUCtW?=
 =?utf-8?B?eTBzN05HUmNlektWRzJDS3dzOVVQbkhMRnlrRmdiQjF2TlRnTFhrYmJrckR4?=
 =?utf-8?B?Q3IrMWdmMlZRU3NIbFAxWCtZYXcySGdIQ01aOW52djhnc1Rna0E4RnlLc3Qv?=
 =?utf-8?B?ZVF3SWFrVFdjSHRRK3JMdTRkdkpyT2JEQ2Z3ekNJaTh2R0VFNFFHNnNlNDc2?=
 =?utf-8?B?WWtMdk1yZkozUXdRYnBCSHVyWDRIMEZ1UUlxcWY5MjZ1MGV0ckNOWjZyNGdW?=
 =?utf-8?B?ZURwSWJRbklzSXlwZnhTOXhCdENMeHNXMERpb2YxaEdMZTFYMExIalViT1J5?=
 =?utf-8?B?WFlhbEh2MEJHcWNJNmlQT3VhUnU5RHlZUDVuLzJQejJRMVlaRmt0TFQ2ZmEx?=
 =?utf-8?B?Rk4xdU5peDdPNnM2bXR3MFRmcDFsbFA1MGJEdzEybDN3N1BUbFJid1FJWFpz?=
 =?utf-8?B?MzJmck1lcDRYbWJWZDE4LzhhVlFpUjNKS2NHM1ZxY1RwYzEzR1lPWnQxakdK?=
 =?utf-8?B?NlhDZHNaK0s5Rm5IcGE2ZHoyYzZBOEJINTZQd0lpc2ozMVZFVUd5Zz09?=
X-Exchange-RoutingPolicyChecked: hc7sQ66DJPw0y9rWeTSTI28AiEbLTEZsUEebCGq8t9yVOKSClTqALYQWLMMu1wvnxQeYyDFTxtjNZABGPcOl6xLTHed35vDQRASXj9CA6ePem9pDuXPYMzsQxIu2F1IZ4ZYFVqZnpAPJIKCZPibrgx5dZn6Gl4zwqTY5RrFRZdYYPrVcjuudUQ2qmVkFpn8amaicbhubetL7PNQdFV0JBe+I2mYwa65Ki4j0JOWrs+miycuuAnEfwb4kPQh3UDPzGF05RXmbUlZPUWALRrWGzY9ZlcvFgK+0J+hV68upAKdB3NkcTlme0K3sdXr2FCK4ACl5Yezof3k3MCvA61AaTw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 789eff74-1852-42ba-6f57-08de83ea6806
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 05:59:52.7597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDUOfmpE44QbvwOf/tYuGDIh9K46JwRbsA/lPxIUPbnX6FinFe5IBbATJ7yErimPLKa1IsQRwEB5hy5+yD5qaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6419
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


On 05-03-2026 21:19, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
>> Zero-refcount BOs are being destroyed. Skip them in the shrinker
>> to avoid racing with cleanup by returning -EBUSY.
>>
>> Ghost BOs from ttm_bo_pipeline_gutting() still hold reclaimable
>> pages, so continue processing them via xe_bo_shrink_purge().
>>
>> Fixes: 00c8efc3180f ("drm/xe: Add a shrinker for xe bos")
>>
>> v6:
>>    - Split from patch 0010 (Thomas)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> Hi, Arvind.
>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 598d4463baf3..07acce383cb1 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1295,9 +1295,13 @@ long xe_bo_shrink(struct ttm_operation_ctx
>> *ctx, struct ttm_buffer_object *bo,
>>   	if (!xe_bo_eviction_valuable(bo, &place))
>>   		return -EBUSY;
>>   
>> -	if (!xe_bo_is_xe_bo(bo) || !xe_bo_get_unless_zero(xe_bo))
> Looking a bit closer at this, I realized this is intentional. The bo
> has two refcounts. One is the gem refcount (which we fail to grab here)
> and one is the ttm refcount, which we have successfully grabbed,
> otherwise this function wouldn't be called. So the bo is in a zombie
> state (all xe-specific members are invalidd) but calling
> xe_bo_shrink_purge is allowed. So this patch could actually be dropped.
>
> Question is did you see any issues from xe_bo_shrink_purge() without
> this patch?


I did not see a concrete crash or corruption from xe_bo_shrink_purge() 
on a zombie BO — the patch was added as a precaution based on the 
refcount check pattern.
Given your analysis, I'll drop this patch in v7.

Thanks,
Arvind

>
> Thanks,
> Thomas
