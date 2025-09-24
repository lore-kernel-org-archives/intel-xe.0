Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AF8CAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:01:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3334A10E6EF;
	Wed, 24 Sep 2025 11:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lCpZsE48";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52C5F10E6EF
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758711667; x=1790247667;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7nYnvfXqZ9HNkWg6h1vSj8R1goCaww0aPYA6jDIEDZg=;
 b=lCpZsE48i5oqUKukSJM+qF3TiLpXrG7D45hD8BLdGR1lySwqj1Ar7zzG
 i45AgXvNTkySYnAA3THmzscigEvAb1j5xgN5VEY1sm87YAemGd4jNrapp
 eypFX8Q79jYZqAr+cb8CxgG/Zm/ZjJRzxcPqu3ywfW3fOLXsGe8cakziF
 Jtk7uY+OY5BWk5LoJZ4QCWPF9BCFZeY6VtYmJmlDJLT8707lo/hADHuqX
 id2JAUyI4Z7GDqUP+G1SvURb7WYB+zb3ndcDkEZGL3ZyrYa7pVQOIVp9+
 aom2L0FaR/FSQZJQKUp1mvldu77/clYCu/Rs9DCyZfYd/3LBZIhG6+7wR Q==;
X-CSE-ConnectionGUID: Hy99pG2TQLOB7FxEh2YW9w==
X-CSE-MsgGUID: zLZhqtJJRzykuRaZFbixow==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60222029"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="60222029"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:01:07 -0700
X-CSE-ConnectionGUID: RcsRhXQ8T1a0YuWV4iRylg==
X-CSE-MsgGUID: 8DrKZ6RpTXm5Cx1MOhz1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182289721"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:01:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 04:01:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 04:01:06 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 04:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcoNylHAB7QjL3iMsz7n+Dc0B77uXReaQ08LmRS1do/IDtclVTJ6FbPcgLd832lVN9GXNkHOYQgxdH/I7MemVyEmpOQCGuNdFkUa5vGu+YeTeZQrdPgQNV4nLFj18EAJ7nuts7fIjJIb1KiZFUk+hWuQmqL8zZMvJL8p9Y4E37CDZckoGA0JBPGj9/az9Ujn9+jtxVQDXj2NY0D4Ell0rDOjmcIxeNAtkh7tsp4HC1GYHO1jOWpKVpd9mKuhrO3Pipmzuip8CqQKF3zDhlUpoI8u5z7KxhH/BfZ5CWTqDe8qADYnrjNrkgyJyUsC6IfTJfJEuBXS1Iz4WFrs8sc1oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz98+KSan/VN3oFxwwbIiXL7r82du7fe3P91DeoSbgQ=;
 b=DxZDcuenRdE6fe243l8BLl2eLG1orlz4ppoS+BHt5frfWRgarEcB1gUB1nC/fP4Se8+HAXqBn3O19U1vPhNYKZ/9UkoP+k/kBsxJea+w4KeK5VpofJrYSQ5MCWK5rhhOSsQPS5eInIcDVmyksrY3veCysXnmu0kNBPxts9iwv1QsVbjjpaOvF/UkbnLxedxnYv2Wrr4BQuAFEZ+MSA4J4fP1EGj/rjHBMBBS6LZIQB8SwuqypFvVYlAq/KFcWaT0/NiYF4DHeYo18lmtHQlxLY1DyuOXt2D09npB8h9h9XbJ0IB8GQpHHY/E12oTnTMU66rsQ7sZ3ivv5vDYFzHwww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB6942.namprd11.prod.outlook.com (2603:10b6:806:2bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 11:01:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 11:01:02 +0000
Message-ID: <0dfab95f-53e6-4e0f-8967-1dcdbfb8e63c@intel.com>
Date: Wed, 24 Sep 2025 13:00:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/34] drm/xe/vf: Abort H2G sends during VF
 post-migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-14-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-14-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB9PR05CA0011.eurprd05.prod.outlook.com
 (2603:10a6:10:1da::16) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f630188-5b51-4686-becf-08ddfb59a6a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHNMZklKdXFhYldhMjVqNjFiSmZDWWxDRDc5dHl1dytodU1VL1RFSi93TDBN?=
 =?utf-8?B?b1Y1eWxoSmVLODd5YjBHM05mSzBEWnIzait1TnpEM3lPWlNGdTdPanAvWGl0?=
 =?utf-8?B?REFEUkg1cGNQMCsybjhTNE56YWhkNUlhbE9yTWNLSDQ0Uml2SDhDUjRqY3Er?=
 =?utf-8?B?ZnRLU0xIM3FiMmxpZHlTR2hNU1hJQTZDYlNpckdPdVhJdHFzZVliSm5NbEwr?=
 =?utf-8?B?Z3Y5QVRMTjRvcGNYalV1ZVdpeVJPOFFaL1ZRSDRpUzBjZEVhK3o2QkI5cEox?=
 =?utf-8?B?YjR0ZTBWbWc0YmNpS29KVEY0eDNaeVVwemQwT3ZnRVFWZVVTOUE1UGdsVGtz?=
 =?utf-8?B?eVFEbktSZUozT1VpdHF2eTRPYUVlUjA3VXNSNjkrTVVUWjBMWnJEZFpRM3h2?=
 =?utf-8?B?TWlvc1hhdTdXUVVsZ1UrdEp1Tk51ZUNEa3QzTzEzS3ZUMk9qdVQzZ3hMV2xy?=
 =?utf-8?B?SW5mZnEzQ2FVNk5ySHhpMVRJaVBhYkQySkpGNzVWNm1aWW1NRklNdysxY3RF?=
 =?utf-8?B?aHRuQXBnZFZKbk1NTkJmNFZaSVBHVVAxNXV0eXVNcUpBdmVzbmVwMUw5TXZv?=
 =?utf-8?B?MWRsV2NySWJVeEVHQzdFVW1PRkg0Y1dRdm5XVCt6NnZXb3ZTS25kcDVjWU5M?=
 =?utf-8?B?NjIyRWxablhHR3hQcGNVNENMZ1grYXR6M3kxRytmQUErRm1ZNmV4YWNYbzcy?=
 =?utf-8?B?T05PRUNOaTdnU2NpR08vN2lTUEJ6NkJ0dmRiMzhqWkgrOUp4SHdTeGhhZ3VT?=
 =?utf-8?B?UmpGVmV2U3h0U0hCRFRPN1lHeW8xY2tyZXNnK3JLQnZsQ0swbTNoSXJ6MGxp?=
 =?utf-8?B?eWRSRy9GNnNVZ3lzcXZyd0N3VjdCclpUUWhGTVR0MnJBSktublZ6RlNsSjY2?=
 =?utf-8?B?L05LeEdibTlpSCttaTZtSUYrcEhBemE1T3ZkUHlYQkRBZmtoYk05N3RsNWRB?=
 =?utf-8?B?OGh2K0FCeGI0MzVJNW5kQU13amJRVVUzdDJkbEpUSG1JZ2hBbmRYTjBZa2Ri?=
 =?utf-8?B?MDZjakowOC94TXBvN0JCb0RPYUNxaVhxZkZoODV4SkYwVUp0dUgzVkZVVkEr?=
 =?utf-8?B?dkFDQ3I0TExzaWl6QzRsWWhEaURzMGtVRVkxRGEvazVmbmJDaHhDcEZ4dk1F?=
 =?utf-8?B?T2Q3MldjeXp4N21HQWlzaWRVWjNzTFRYVWtoNi9aZWpiRUtJWjNRaHZXMkI0?=
 =?utf-8?B?NGRKNmw0VEVnRXdsL051MFptc3EzTmtNbCtJMmFTclJHeTc3bUwyZ1dPczBi?=
 =?utf-8?B?UFh3OEZGK2pEcjR5U1M4RVR4b1FVT1ZRSDB2VVZNMDJxaDJxa3ltRXVXQytO?=
 =?utf-8?B?d0tuWS9yNURISVp5MlZSUFVsTFFhOGE0UllCQndRWWZMWlI2cm01dytCUEty?=
 =?utf-8?B?RFVoVW04TWF5WlFDTlp1dFc0dmEvbVhUQW9tbEJXeDJWT08rMG1DQlR4S1ZV?=
 =?utf-8?B?dE5wYTdkR0xQVGwwR0ExbzBYWmN0eksyWWFIeG5ZcjQ4MDRPYUw2bHpwZkN0?=
 =?utf-8?B?ZnZ6MTA5ODIrcUIrcFU1MVBka1UyZG01QVBwN0JrckpUY2RteWxMZ1dpL2tt?=
 =?utf-8?B?OTZJNVJEcHMwV2FmOE0xNktQaDUrcFZ6akM2RVRMY0pySUhtZExYSW9kUzdE?=
 =?utf-8?B?U1FGSjhaV21waHV5b01mc3BodThybVkycmwwUGdjV3ZPR09pbmg0QzBRbGhz?=
 =?utf-8?B?aC85SElNaUNITXRMdXRqQWE0WDh6M3dhMjZhQkdIQWdESlViN1NQUnc5ZTFQ?=
 =?utf-8?B?RlIyNWF4OVdoRC9nNkdjdUFVMmJGY2tSM0tKenEyYnJ1M0NsMUt6dk1QVFZK?=
 =?utf-8?B?U0tYaXhnWThoYVVJczg3RVdwZGdLMWtTL2JwRURzR3FIQXFIVlduTmhRclFP?=
 =?utf-8?B?QlhQallNQlVhYlBSZksyYytaRXRzQ1NvZ09lb0VYVk0wM3JRRW9CTVVIdjVX?=
 =?utf-8?Q?aUyY8j5JiWY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEhBb1lQQUlqa1UyRWxSd0dyWXFzdnRWUXp4VXpVdHUxTGFobUg1SWhUN0lx?=
 =?utf-8?B?Rm5zS0IvWnVRaDg4bEJWQThKWWplRFcydnlNRXd4cURMT29hMGhkUGpYdlFy?=
 =?utf-8?B?Y0kyZDZKamtRaU80OFNwK3BQcGNwa0xyRGJEQnZKQTFtYTBkeklGYlRwMEVI?=
 =?utf-8?B?TmUwbmM1cFo4RlgzN3Y1aDduZExrblNDYnFDVzV2WjdWUTZMV2c4ZVMrc3FZ?=
 =?utf-8?B?L1poOWJwOElyUW1tRHZQVnVDM21ZcXpwdmFoVmIvRTExSm5qRWpBelF3aEFZ?=
 =?utf-8?B?Q3hTTzNTSHNiaHJlTXdjZUVUMVVYSHdxOFBIQ21HVk1IdVZLeHJ1M2J6M2dM?=
 =?utf-8?B?ckZubDZMRGNTaU5hb0pOV0FEeFJzZjZHK0NxMEx0bUNLY2RicFF3UHJmRVlS?=
 =?utf-8?B?TmlJVFN3L25oVW1LRWFUUVNYU0xvVFpSUFdYUFJsZEZDSjFuNENvby8rSkpC?=
 =?utf-8?B?dzdOeUZ5NGlmS1RuWkp1akFPZDR3NkpDUTlLUjJhT013b3BHWXdRaGJZcTFN?=
 =?utf-8?B?RW1HODVsbjJOcllIZUdXeHRkTSsxa2dtQitNakJ2aFF5eGhTemZ5MXQ2Q0xK?=
 =?utf-8?B?NDA0cmxVWU5va0VxOWliQWRJK3piT2l1bzFna0wzUlNncnZkU0hLKzE2dEs1?=
 =?utf-8?B?V012WDFwK3ZKVFBhaVljN1BQYmkyNExERkJOd1JkaDZyUHYvTkpVeUJGNnl2?=
 =?utf-8?B?eFRmYndKemRQUGVFOU5qZ2FKVGEycm1ITmZjUU4wR1cvbmhMZnI2TGE4dm1G?=
 =?utf-8?B?Mmx5cmZGUnFQMVVMNGxvemdyTVV5Y3NEMGpKR29nWmtqNkY1aDVISkdya2ZE?=
 =?utf-8?B?S1ZWTW9ESWhXYkE5OENtNHArb0lROXJacmg3QksyNUZPWTZPMXlJeXlVbTJq?=
 =?utf-8?B?OGxnMExYM2FrdkpyaWg0TmVwZkNjWEVLVFFweTUyTWg5cUtqR0FrczlWZm9O?=
 =?utf-8?B?WGk5ZHVuMFc0K2t5elpUMDBwc1BuKzZIVFpjNFdCSEp5K3YzRVFDcDUvTmpV?=
 =?utf-8?B?Tml6NGM4aEFTK2Fxbk9MVm1mN3VWYk1NdWVVUVRiaUxPdnIwbGlSWFU2OWwx?=
 =?utf-8?B?aFFEamI4YnpWVVpiMi85V0hFelZWYW1mdWpsV0piK0cwSDFMUC9yRTIvSmRX?=
 =?utf-8?B?cW9Vb1NhNElrZ1hBVE9sUlFYQy9EUllwUG93czZGR0t3c093M3VRNXY2TGZK?=
 =?utf-8?B?bTVSQ0x3c3ZtMWJsRGh5R1AzUkIvYThUSkE5aVZHa3hNbVg5UUxzcUwxbGVJ?=
 =?utf-8?B?SlVMd0Q1WEE3S0RHSjBocEFFWTdEWVBQUUdKNCt0TVZNN1ZvUk5UamNiTzVU?=
 =?utf-8?B?Yk4zaWowN1RiMzlFMnV2bURTYkNEU2svSlB3dFNRVG5mRWpzMmt1Y2xtZnJH?=
 =?utf-8?B?QnpLdlhzOEo2TTJGRTU4VklqWVpjdkhwN0VhMzdHK0FhclpTdndORFhZMUll?=
 =?utf-8?B?Nks4ekZUZGNVUDZ3REo3SXFlVUE3b2IwQ2thWmRmelp4MlhNQ0pFdHhMZDZu?=
 =?utf-8?B?SHZRKzhnbTA5dk56Nm5FS2RiYmdodmViWk1KUXpSSm8yS2lYSHFXT0Q4aUxr?=
 =?utf-8?B?dndEYWRjQ1phVVExQkY0NTFzN2N3OGpzdVkvYWJySis5TnRpWmJaQVo0K0pw?=
 =?utf-8?B?QmtyQVZiMmpkVFdtb2NwWjdWSjlpWnZrMkJNeU45cnZqdlRLZk9XOTRUeGFK?=
 =?utf-8?B?V2JTbmxsRVNacGFWVEU1TVhJZmhoejVpbHhhTDdaQm9TMEpzZW5nNkMxRjhk?=
 =?utf-8?B?M1lBUk1oZGdOcnM1NGZmNGw5cEQwR2E1VFdycWV6OTBJM2E1YlZpVC9sdWwz?=
 =?utf-8?B?d0JGcnRsMzQzSmJxTnJ5RlR0VExyUmdISHdweFZZVVNlSnZDejl5Smx1MDZN?=
 =?utf-8?B?ZS9vTXUvOE5COUVidFRKUmhXNHI0YitmOWRZYVI5UUlyeXplSXJKdWd5NnJn?=
 =?utf-8?B?dFZ5K3k5Q0E2TTRyNmM1STBDMmM5bWU1d3hoRXlFQXdmSVNORDlZamoxb0dC?=
 =?utf-8?B?UlpaUms4TnNGWmVqTlp4c1l1TVNjMXJYTi9CQlN5a0VzU0tXNkJBTy9vVDBT?=
 =?utf-8?B?OXh4aG1wYi9MRWRqVlFhSjI1MDRjSzRXRkNCU2IvRDZqdnNXaFdFMnd5S0Zw?=
 =?utf-8?B?MXFsbUhKQ1dKd0oyQ2FQR1pWUDVwS2JITC9WZm5mcGVXdG44K2NlU1JLOFJI?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f630188-5b51-4686-becf-08ddfb59a6a9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:01:02.4876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxJzrzE+/8uqQgS91OfNLp/Z4eMeg6Agh3gRQ2KO40GWP71k7o9VpQgDcKwL5Zn3CqWsNs5RjgXpUPArsOOSwaAUMCz328juBQcxZrM7Olc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6942
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> While VF post-migration recovery is in progress, abort H2G sends with

should be abort or give the caller a second chance ?

btw, do we care about extra errors being logged in such case ?

> -ECANCEL. These messages are treated as lost, and TLB invalidation
> errors are suppressed. During this phase, the H2G channel is down, and
> VF recovery requires the CT lock to proceed.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 47079ab9922c..661ab1bf4502 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
>  #include "xe_guc_log.h"
>  #include "xe_guc_relay.h"
> @@ -851,7 +852,7 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  				u32 len, u32 g2h_len, u32 num_g2h,
>  				struct g2h_fence *g2h_fence)
>  {
> -	struct xe_gt *gt __maybe_unused = ct_to_gt(ct);
> +	struct xe_gt *gt = ct_to_gt(ct);
>  	u16 seqno;
>  	int ret;
>  
> @@ -872,7 +873,8 @@ static int __guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action,
>  		goto out;
>  	}
>  
> -	if (ct->state == XE_GUC_CT_STATE_STOPPED) {
> +	if (ct->state == XE_GUC_CT_STATE_STOPPED ||
> +	    xe_gt_sriov_vf_recovery_inprogress(gt)) {

this still looks like a hack

maybe we should either explicitly STOP CTB once we start the recovery,
or if that's too much, maybe introduce HALT CTB state?

btw, what should happen to already received G2H?
shouldn't we process them out when starting recovery?

and maybe we should return different error code to clearly
distinguish between our explicit STOP state and implicit recovery?

>  		ret = -ECANCELED;
>  		goto out;
>  	}

