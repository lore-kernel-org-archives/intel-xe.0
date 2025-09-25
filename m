Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C19CAC5B1
	for <intel-xe@archiver.kernel.org>; Thu, 25 Sep 2025 16:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E1B10E981;
	Thu, 25 Sep 2025 16:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SONS3sds";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3A10E981
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Sep 2025 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758817684; x=1790353684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ve/ZKQIA4mP6ToOmhqaCFrYUzVh9yChcgMCv9I+dj5Q=;
 b=SONS3sdsKaw4UEC/P3pmffIIyRBztsjMLpxcm06+y9l54qy7QWN7WIZj
 iRexmXz15bkr0LIiCYbwWjZ1+yHDPdw7V6RIjmJ7Ga7Z9dn8RksPbM7FU
 WjvoND1c09NyytbQREAhNuoZe1uENUDN5vLnCnG9G6JrFhks9OxznrdsC
 /ex+a2ihwXOegF7yejr2xnCpElXrpTdOzU3MmDaBbrnYh7U8u3/hclEcb
 GTm2EUswpJHdqAo2OW0YZr5LH2SpFeewrymh4k0/nGkU1zTdF6JdAwqoX
 qRVf6c9vVA/R0//EZbC853uum/gi6H87Rev+2fkqF2eywh/F6wrg2wMhT A==;
X-CSE-ConnectionGUID: b3UvtNSoRIq9G/RJv+6QVg==
X-CSE-MsgGUID: 9jkX52o9TOe2Z3wzS+rSZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="78578583"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78578583"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:28:03 -0700
X-CSE-ConnectionGUID: 7y9X4xl+S1qqmszj5vRV9g==
X-CSE-MsgGUID: +HEVneKzSl64RCodmGW9Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182540525"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 09:28:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:28:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 09:28:02 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 09:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgs3BxmpVy2by7HZLOgZhQvmsFQiHAgstAOZs2xB3KfqTbon/3+RsIkVFFD0x9HVMaU/MwMbbNNV6d7EifJhk54LYTfB+OkV2Y1zL03DlHzsovTzZ6wbs7JMiFWRx0nYjJwetvCxmqAyz/a89HqbRmP/z6Wz7J2n+e4XjeMmoas+bjIbv0Q7UM9d9lBokkmgYkaS2y5HAOTyg9k8A8wB7Bbi/4z1+yorRYyw2mJv8O0y67NJCMnvCOOYDxFFcT8ursaSkrEQILrXQu9+C2zs+OP6IYhz4zIwDkdPl3sALGKowiDFBYhtKXAKh7rnTKZGdP3L8IKPeflM9Zg2q8/m5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aud+X+6jOk/xtvUvEThoTSvF+GWiGc05pS5calqwqE=;
 b=WPwT6KnC6vjK+kkd4IiTC7T3JvV0l9zRZ8PcLNf4QZbJioWXiz76f/aCXqDNCEzy/T1iCmsbkmJaZKoCLwdNAb/dLulTAlWz1tE+2A2Rrlb76sHQOcqiu4MTYgTlvRIACPGpAKCku9LRfFCa37fNqccG295lwORgPT+OCM17CfP2O4K8F3BjqPEosI9jSA3laMQ1fPUiNyG0Rng+75CaGFajZhXkL7bQ8Qd5wcINibhA8AG46ygENyB1pmGgGZotemaGZbZZutpRMH2OlmkhU2eGwdRAvvr7CZftRaqdLbZn0jMI5FXVwSqnV0Sj/ld/AztmTrMrZQ+cVKXVcmrxSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 16:27:59 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 16:27:59 +0000
Message-ID: <2adb41bd-cbd1-4df8-8f75-eb861f8c1e7a@intel.com>
Date: Thu, 25 Sep 2025 18:27:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/34] drm/xe/vf: Make VF recovery run on per-GT worker
To: Matthew Brost <matthew.brost@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-13-matthew.brost@intel.com>
 <55c5e870-6823-4fb3-80ab-0e6914d054d2@intel.com>
 <aNRLmmK5yqXa3xNb@lstrano-desk.jf.intel.com>
 <dab8b427-41eb-46b2-929d-436b3866b7b5@intel.com>
 <aNRWIi9MqEghc4gM@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aNRWIi9MqEghc4gM@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 092d6de8-7712-4b0f-91cc-08ddfc507db4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QitTMFR6Wm9udnFWam1VN2FQYUdCNU9sM0Z3QkJpSnRRdXBwcXVyakcySS9t?=
 =?utf-8?B?dmpaaTZGdEU3QmFqQlU3dWJCWjdXdE9oRTZ5ZFJ2T2lJVUdSTUxlc2trODBy?=
 =?utf-8?B?Zk5xL3d6N0RhL0hDVlpMektIUUtzcVpLclBuZUJjZXB1TnBGNXFtQzJFUjE0?=
 =?utf-8?B?ZGl2QmhKdkxISzYvUGpLOGhZZTFiZ1RYRzVpekptSGN2TVpoM3B3dm5wVFpT?=
 =?utf-8?B?anpzaDQ4VG1wckdqZWhVMVM2cHkzUGxLN3hkU0dtVEpLK0xxMDRUbXNPaEpG?=
 =?utf-8?B?RHYwSlZVZHZtY3psL1hpVUNlQ0MyeDBwNlloeUpRdkUrb0tMR1hnMHl0UHVM?=
 =?utf-8?B?S2p3TSs4RmtueEJWTmI1SzUvS01mTlFXT1FNYXMrMkM1dXpOSnBBVU9GYkhx?=
 =?utf-8?B?dkZSZXFJdGc1YlJQRUdRWDViZzd3bjRuVURtTERWOEJXb2hnZTlkUUlvc0Nh?=
 =?utf-8?B?c0FBZkQvZ0hML2txU2xUaUFqc2lkdVVKR09ocDJXWUN0YXd0Y1lrL095STMw?=
 =?utf-8?B?N3BtYUFkeEN5UUNnY1NoQXlvTUpoQ2F0a3lrVisvTk1HTWpIYjBPOGhUVysr?=
 =?utf-8?B?OXpsaWxCaVFBVk1Pek9RaVpyMnNCekN6Y3FSWDVqNjRWQUJSbk9ya1Q5aDBV?=
 =?utf-8?B?S1QxSjlJOFB0dnIvcy9JVGxUaTVMdS9GSHVpZThQWkdkbElCNmdpUHVET294?=
 =?utf-8?B?VUhHYXlMV3hvM3ZrOWE2aS8vM09QVUYxcEZ5OTE1amg2VFZOQmJ2ajhmT3B1?=
 =?utf-8?B?RVdheVlXOXBvNSt2MXdxNzJES3plS01paDQzdjBCSk5VRlk1MFdNMFY2Q2lT?=
 =?utf-8?B?eStXVlUyVmRJdW54NjhmdjV5MUNYd0ZPYzEzSjJ4eFNnb0o0djA0S0trTFhO?=
 =?utf-8?B?dFJQUlR2N1lTZkt0UGdWWm9pYjZFaUJNc20rU0xTeTA0bEFIMGliYndVL29F?=
 =?utf-8?B?WFVzOHRXSnNkeGpFaEUwZVJmUHF3aHY3WWNqREhlMm92bVdJOE9mSkdHNjg3?=
 =?utf-8?B?OXdtK1VyckI5WmpKZE1BaWVaTDduRmlseG9zTFdzQUpuNnEvdTZTVncrUy81?=
 =?utf-8?B?TVp2NkRJdDZQKzZ4S1ptNlVSQmtNZEp6eTFsNGk4ZmQwcitmZFpRbDdnQWVQ?=
 =?utf-8?B?eHVYVjZTd3lVZHdtTFZkeGNHWGgwYnFvaThBWkJaQ1ozdjZoQWhsYXZpOTJK?=
 =?utf-8?B?TkFMdEVZdG9CNVYra0EwNE5NRkRBU0FQRXBFS3AyTmgxbGFwNC8weFpldDM5?=
 =?utf-8?B?VXY1VzlNTlltQXg2V2hUdXQ4dFRzODBzTjhVanE5U1VhdDBBQTVoS0lUQnNu?=
 =?utf-8?B?bGFGakVRekkzZUY5eSs4UUxXT0pmUk1jd0RvVXZ4UktHQmt5WFg3TmFEVldZ?=
 =?utf-8?B?eEQ2TUJveTdsQ2NPYWEzUnZjU3k5S1QzWWhJcHM2Z1NNd1o5dGt6Zk9rVEYr?=
 =?utf-8?B?N05BTkZEcWVoSXRCVUpZcWptNUJmenVHREVKb0dCTk16VWxaaVpkT1Q4ZGVE?=
 =?utf-8?B?RStBWUh2b0FzaUV2QURNRzBrQjAyR3FaVzRwT0pITDJtTFVQdU56L3laUzA4?=
 =?utf-8?B?Y01LRHBzNXdvQ2dqOG5SanU2alNEWHVnUGg1d2taUnpUU3E2Y0toQ2N4czUz?=
 =?utf-8?B?T3lXc0RsSndqb1k2VzN4N09XN3poU3NXZHh3SGFWWExRaldsanlhb1d2NlFx?=
 =?utf-8?B?UFVJSjdnRllkS2FZQjNYVnZlK1diMTI5NFF6KzIreThQRThoaUZQQnRQK1hs?=
 =?utf-8?B?enE5ZmtMWTRUK2ZWSWpjM0NHKzk1dWoxQ0RQUXR2ekl3bHBIU3JGTEdGM3M3?=
 =?utf-8?B?OTRXdFUzRTVpRnJGOGY3TklSZ0lEd1dDeW5ISkFyYW5ON0hIbnRZRy80L1RV?=
 =?utf-8?B?YWpHakdLZWErZzAzUE1tYmhVMjBvNzJzWmhYMVJzcTRveWc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzVOclJiUDBnTWhZOXdZb2NxS3lMZERjaGk1a1lwV21nc1QrZEc1cy9tSHE3?=
 =?utf-8?B?ejdEaVF2VVhnU3ZkVi9nWFBGWmhyb0IwbnpMQVViT2RmL0JmRHZ4UzlOTHBC?=
 =?utf-8?B?ZC9UVlVKcHVuQTIzVU13MytVZ3FqTXQzTmYvUVVKVm44QTBia0dBS1hNWDRH?=
 =?utf-8?B?VUpoYytnSERvK2hEZnc0U2FkcmFyL3pjSkNveHc3RlZtUTJyLzM3ZkUveFAr?=
 =?utf-8?B?SmZ2WEFOaWk3S1paRTRqQzRVcGc4QjNxL2dUbnBqL3dCVE8wS3lmeEwxM254?=
 =?utf-8?B?aFU3Y1JGTnRlVXVJWFNseTlmTE56QUF5SVR6RVRScHFCN1BKbW9BcUpkaXBL?=
 =?utf-8?B?N214c1BQRjh4Q2QyK2V4RFE4bVhzU0tKWlNqSXl4WEl1aERycVdXNFdBN2Ey?=
 =?utf-8?B?d1Y2cm1acjVLQ0g2RVJqK2FQaXhWTFhuOVVjWDM3VE5RbVR3OXZYRXdYOWIz?=
 =?utf-8?B?dHVsQkY1cmZOUi82eHVBWTFMVE8rYjFSaGVscnpnYUlyRCsrTERjUHd2Y1Bq?=
 =?utf-8?B?WHNyV1dzN2M2YjluQndPQTY3dDhGVCsyV2ZJd0NabDRlY0doZWtzdjQrVm1T?=
 =?utf-8?B?N2FsQ1BpdlNKMjhOQWttY1RXZCs4RlQyd1FNSXBadFNRdnVIY2xKRW9lT3kw?=
 =?utf-8?B?UGRROWdWcDQwVmZaK0srZzFmbGgzTCtzWEhBY3c5eHUrb2E1UFBFVENKdnZ1?=
 =?utf-8?B?RXdJRnpiWXFabXc3MXBTc0ZnUWY2eDI5ZmlmeWlRMENsRGRReWdqbDhOR0FV?=
 =?utf-8?B?d0plbUpPeDlPTDRldW5HWDdIck5SWEp2eTJlWVFCYnpMbFVldG1YbjE4SDJa?=
 =?utf-8?B?RGdCNlpkS283QmkweXA2SVJKaGFFZDg4UUVvL2VNK3liS0xNeHg1YUEvdDNK?=
 =?utf-8?B?ak05UW80SXdHQkdQWDJLQlM4alZTY3hlbktOV3M0WDhENzI1Z2ZkTGk1ZENx?=
 =?utf-8?B?QWk1ZVJ6MElqVnlyOHhPWHBEYUhRRk10QzI5ekRTbzNBdzFNK3laQW15ZWY0?=
 =?utf-8?B?Y3M0ZCtCeSt6QVRja1N6OWhkY2NyNXJuOEFhN21renVhakpRaFQxNGNJT01H?=
 =?utf-8?B?SHJWeHdIVUNLM1oxTmRaOTB5Y1hwc3VIL3lKbUM0eStCV2Z3V3E1VWUyRmJ4?=
 =?utf-8?B?aUVreUZBd3NVVlZiejl5bk90bFRidlMrQk9GekNPVTI2SjhXWFVwSkJyVzdn?=
 =?utf-8?B?QVRjbkFOdGlrdWVSOE5GY2h3b3R5SjFjQmxFZ0llbkVDbzMrM3BJYkxZbXhu?=
 =?utf-8?B?amhYZjQ4Tk5WWTdNWTlSNG1sVVpkTW5mVmZvVHdPbWRCS2FwN2hDbC9BTUxw?=
 =?utf-8?B?a2VMeEozQjJOVVQ0SGRjdlJjaUZQQ3RkOWxFWWhMQWVWbjdyNThwdmpEVEZL?=
 =?utf-8?B?YlE3eGQ2akxHNTd0L3prQ1BKVlJFSWxSNCtOUThyeU4wWTRkZjg4cHRMNVRo?=
 =?utf-8?B?YWwyaWc3V0s2ejBkc3FETlEyUFBWTnpZakExME1kcEFycUpDYXNIN3RKekF5?=
 =?utf-8?B?WkJjeVd3UkluOEhoaXBkSExLMys2eWF3WmwxV044OXhQeDVkLzJzNTFIS3hD?=
 =?utf-8?B?QVFUT2tORDcrTnlDMmZ1Tk51REZLZFczNWlDeU9ja2ViK0F6aTd1RnRTSlB1?=
 =?utf-8?B?bUxzV21YUW8xTGx6QTNjdjNaTE45SXdtRjZMelZ6QWFORXBqU01hUlYzSEtl?=
 =?utf-8?B?aHFEbUVQL1FyUHJJQ013QkFJU0gycnVlTmZSZS9FY1hOcjVtVXI1ZHprcys4?=
 =?utf-8?B?S0w1WHpseU9oRzdicWZObVZJRWtFMDBmVTFGMk9UVFlVOU9IczhSMnB2dUVp?=
 =?utf-8?B?ekVaVzFWUHdiazdqSzZqcFJqdU5UNUo1MXBCSUV1OXI0RzBQdU1nWGFEZ2lK?=
 =?utf-8?B?d25ySVUwLzRIY2hvYXBja2xIelJqWjJqazMvalN1dG5IQ095Y1NvMU8ydFpE?=
 =?utf-8?B?RUYxZ2FjeFZCQ2RBeGs3R05ZQm93VlpHc0tlaXZPdDhYWURmMUxTRlFDRGFa?=
 =?utf-8?B?TzY1a3l5V2ZhNmNkRTVidEhDaTNHY3h1YlUrNFhmZkpWUXZZWEI4cm9jUXVX?=
 =?utf-8?B?UzRiZDgrVHBycmxoOXlidURmUGthWFpVWktvbG1SRjdQYUJ1L1BYVDYwMXJF?=
 =?utf-8?Q?72chTOubZvyp3RI3yxEx9dFwB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 092d6de8-7712-4b0f-91cc-08ddfc507db4
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 16:27:59.6896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuQYpSlWnCp21q0EfFRxw8d3saWEMZjFIkBav0E0dlMZXmhsx1w5tuk6/KeSydYJ3DIp3l7LUY2/ZLpTEbtMeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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


On 9/24/2025 10:35 PM, Matthew Brost wrote:
> On Wed, Sep 24, 2025 at 10:21:32PM +0200, Michal Wajdeczko wrote:
>>
>> On 9/24/2025 9:50 PM, Matthew Brost wrote:
>>> On Wed, Sep 24, 2025 at 12:49:25PM +0200, Michal Wajdeczko wrote:
>>>>
>>>> On 9/24/2025 3:15 AM, Matthew Brost wrote:
>>>>> VF recovery is a per-GT operation, so it makes sense to isolate it to a
>>>> that was also my suggestion to make it per-GT, good to see it happen now
>>>>
>>> +1
>>>
>>>>> per-GT queue. Scheduling this operation on the same worker as the GT
>>>>> reset and TDR not only aligns with this design but also helps avoid race
>>>>> conditions, as those operations can also modify the queue state.
>>>> but while the recovery is per-GT, we should still protect against that
>>>> one GT starts the recovery sooner then other GTs notice about it
>>>>
>>> Yes. There is shared state in 2 places:
>>>
>>>   - The GGTT shifting, this handled by [1] in my series.
>>>   - CCS restore on iGPU (PTL) handled by [2] [3] in my series.
>>>
>>> [1] https://patchwork.freedesktop.org/patch/676394/?series=154627&rev=2
>>> [2] https://patchwork.freedesktop.org/patch/676393/?series=154627&rev=2
>>> [3] https://patchwork.freedesktop.org/patch/676397/?series=154627&rev=2
>>>
>>>>> v2:
>>>>>   - Fix lockdep splat (Adam)
>>>>>   - Use xe_sriov_vf_migration_supported helper
>>>>>
>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 170 ++++++++++++++-
>>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +-
>>>>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   7 +
>>>>>   drivers/gpu/drm/xe/xe_sriov_vf.c          | 242 +---------------------
>>>>>   drivers/gpu/drm/xe/xe_sriov_vf.h          |   1 -
>>>>>   drivers/gpu/drm/xe/xe_sriov_vf_types.h    |   4 -
>>>>>   6 files changed, 169 insertions(+), 258 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> index c9d0e32e7a15..cfb71b749e52 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>>>> @@ -25,11 +25,15 @@
>>>>>   #include "xe_guc.h"
>>>>>   #include "xe_guc_hxg_helpers.h"
>>>>>   #include "xe_guc_relay.h"
>>>>> +#include "xe_guc_submit.h"
>>>>> +#include "xe_irq.h"
>>>>>   #include "xe_lrc.h"
>>>>>   #include "xe_memirq.h"
>>>>>   #include "xe_mmio.h"
>>>>> +#include "xe_pm.h"
>>>>>   #include "xe_sriov.h"
>>>>>   #include "xe_sriov_vf.h"
>>>>> +#include "xe_tile_sriov_vf.h"
>>>>>   #include "xe_uc_fw.h"
>>>>>   #include "xe_wopcm.h"
>>>>>   
>>>>> @@ -314,7 +318,7 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>>>>    * Returns: 0 if the operation completed successfully, or a negative error
>>>>>    * code otherwise.
>>>>>    */
>>>>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>>>>> +static int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt)
>>>>>   {
>>>>>   	struct xe_guc *guc = &gt->uc.guc;
>>>>>   	int err;
>>>>> @@ -808,7 +812,7 @@ int xe_gt_sriov_vf_connect(struct xe_gt *gt)
>>>>>    * xe_gt_sriov_vf_default_lrcs_hwsp_rebase - Update GGTT references in HWSP of default LRCs.
>>>>>    * @gt: the &xe_gt struct instance
>>>>>    */
>>>>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>>> +static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>>>   {
>>>>>   	struct xe_hw_engine *hwe;
>>>>>   	enum xe_hw_engine_id id;
>>>>> @@ -817,6 +821,26 @@ void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>>>>   		xe_default_lrc_update_memirq_regs_with_address(hwe);
>>>>>   }
>>>>>   
>>>>> +static void xe_gt_sriov_vf_start_migration_recovery(struct xe_gt *gt)
>>>> nit: if this is static then could be just:
>>>>
>>>> 	vf_start_migration_recovery(gt)
>>>>
>>> Sure.
>>>
>>>>> +{
>>>>> +	bool started;
>>>>> +
>>>>> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>>>> +
>>>>> +	spin_lock(&gt->sriov.vf.migration.lock);
>>>>> +
>>>>> +	if (!gt->sriov.vf.migration.recovery_queued) {
>>>>> +		gt->sriov.vf.migration.recovery_queued = true;
>>>>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>>>>> +
>>>>> +		started = queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker);
>>>>> +		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
>>>>> +				 "scheduled" : "already in progress");
>>>> with this .recovery_queued flag, can we hit "already in progress" case?
>>>>
>>> This was existing code so kept it but I'm really unclear how we can get
>> I can't find "recovery_queued" flag in upstream code
>>
> This is akin to comment in upstream code. Again, I'm not really
> convienced this is something we need to handle as I suspect this is not
> possible.
>
> /* skip asking GuC for RESFIX exit if new recovery request arrived */

Second migration could happen while `recovery_queued` is set, I don't 
see why not. Migration could happen at any point.

Interrupts tend to be treated with priority compared to workers, so if 
migration will happen in that short period, this can and will be hit.

For the code near "/* skip asking GuC for RESFIX exit if new recovery 
request arrived */" - while its days are numbered, let's leave this 
method of double migration support for this series. We will later switch 
to an improved double migration support, but that depends on GuC version 
and should be developed and tested separately.

-Tomasz

>
>>> multiple resfix IRQs without the prior resfix flow being completed.
>>> Maybe Tomasz can clear this one up? Ideally I'd like to remove multiple
>>> resfix IRQ handled code if this is not possible.
>>>
>>>>> +	}
>>>>> +
>>>>> +	spin_unlock(&gt->sriov.vf.migration.lock);
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xe_gt_sriov_vf_migrated_event_handler - Start a VF migration recovery,
>>>>>    *   or just mark that a GuC is ready for it.
>>>>> @@ -831,15 +855,8 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt)
>>>>>   	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>>>>   	xe_gt_assert(gt, xe_gt_sriov_vf_recovery_inprogress(gt));
>>>>>   
>>>>> -	set_bit(gt->info.id, &xe->sriov.vf.migration.gt_flags);
>>>>> -	/*
>>>>> -	 * We need to be certain that if all flags were set, at least one
>>>>> -	 * thread will notice that and schedule the recovery.
>>>>> -	 */
>>>>> -	smp_mb__after_atomic();
>>>>> -
>>>>>   	xe_gt_sriov_info(gt, "ready for recovery after migration\n");
>>>>> -	xe_sriov_vf_start_migration_recovery(xe);
>>>>> +	xe_gt_sriov_vf_start_migration_recovery(gt);
>>>>>   }
>>>>>   
>>>>>   static bool vf_is_negotiated(struct xe_gt *gt, u16 major, u16 minor)
>>>>> @@ -1175,6 +1192,139 @@ void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p)
>>>>>   		   pf_version->major, pf_version->minor);
>>>>>   }
>>>>>   
>>>>> +static void vf_post_migration_shutdown(struct xe_gt *gt)
>>>>> +{
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>>>> +	gt->sriov.vf.migration.recovery_queued = false;
>>>>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>>>> +
>>>>> +	xe_guc_submit_pause(&gt->uc.guc);
>>>>> +	ret |= xe_guc_submit_reset_block(&gt->uc.guc);
>>>> this |= seem unneeded
>>>>
>>> This is existing code copy / pasted and is removed in [4].
>>>
>>> [4] https://patchwork.freedesktop.org/patch/676382/?series=154627&rev=2
>>>
>>>>> +
>>>>> +	if (ret)
>>>>> +		xe_gt_sriov_info(gt, "migration recovery encountered ongoing reset\n");
>>>> is this the only possible reason? maybe worth to add %pe ?
>>>>
>>> Again this existing code and will be removed in [4].
>>>
>>> So with above statements, I'd prefer just to leave as is.
>>>
>>>>> +}
>>>>> +
>>>>> +static size_t post_migration_scratch_size(struct xe_device *xe)
>>>>> +{
>>>>> +	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>>>>> +}
>>>>> +
>>>>> +static int vf_post_migration_fixups(struct xe_gt *gt)
>>>>> +{
>>>>> +	s64 shift;
>>>>> +	void *buf;
>>>>> +	int err;
>>>>> +
>>>>> +	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_ATOMIC);
>>>>> +	if (!buf)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	err = xe_gt_sriov_vf_query_config(gt);
>>>>> +	if (err)
>>>>> +		goto out;
>>>>> +
>>>>> +	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>>>> +	if (shift) {
>>>>> +		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>>>>> +		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>>>>> +		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>>>> +		if (err)
>>>>> +			goto out;
>>>>> +	}
>>>>> +
>>>>> +out:
>>>>> +	kfree(buf);
>>>>> +	return err;
>>>>> +}
>>>>> +
>>>>> +static void vf_post_migration_kickstart(struct xe_gt *gt)
>>>>> +{
>>>>> +	/*
>>>>> +	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>>>>> +	 * must be working at this point, since the recovery did started,
>>>>> +	 * but the rest was not enabled using the procedure from spec.
>>>>> +	 */
>>>>> +	xe_irq_resume(gt_to_xe(gt));
>>>>> +
>>>>> +	xe_guc_submit_reset_unblock(&gt->uc.guc);
>>>>> +	xe_guc_submit_unpause(&gt->uc.guc);
>>>>> +}
>>>>> +
>>>>> +static int vf_post_migration_notify_resfix_done(struct xe_gt *gt)
>>>>> +{
>>>>> +	bool skip_resfix = false;
>>>>> +
>>>>> +	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>>>> +	if (gt->sriov.vf.migration.recovery_queued) {
>>>>> +		skip_resfix = true;
>>>>> +		xe_gt_sriov_dbg(gt, "another recovery imminent, skipped some notifications\n");
>>>>> +	} else {
>>>>> +		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>>>>> +	}
>>>>> +	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>>>> +
>>>>> +	return skip_resfix ? -EAGAIN : xe_gt_sriov_vf_notify_resfix_done(gt);
>>>> nit: this looks cleaner:
>>>>
>>>> 	if (skip_resfix)
>>>> 		return -EAGAIN;
>>>>
>>>> 	return xe_gt_sriov_vf_notify_resfix_done(gt);
>>>>
>>> Sure.
>>>
>>>>> +}
>>>>> +
>>>>> +static void vf_post_migration_recovery(struct xe_gt *gt)
>>>>> +{
>>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>>> +	int err;
>>>>> +
>>>>> +	xe_gt_sriov_dbg(gt, "migration recovery in progress\n");
>>>>> +
>>>>> +	xe_pm_runtime_get(xe);
>>>>> +	vf_post_migration_shutdown(gt);
>>>>> +
>>>>> +	if (!xe_sriov_vf_migration_supported(xe)) {
>>>>> +		xe_gt_sriov_err(gt, "migration is not supported\n");
>>>>> +		err = -ENOTRECOVERABLE;
>>>>> +		goto fail;
>>>>> +	}
>>>>> +
>>>>> +	err = vf_post_migration_fixups(gt);
>>>>> +	if (err)
>>>>> +		goto fail;
>>>>> +
>>>>> +	vf_post_migration_kickstart(gt);
>>>>> +	err = vf_post_migration_notify_resfix_done(gt);
>>>>> +	if (err && err != -EAGAIN)
>>>>> +		goto fail;
>>>>> +
>>>>> +	xe_pm_runtime_put(xe);
>>>>> +	xe_gt_sriov_notice(gt, "migration recovery ended\n");
>>>>> +	return;
>>>>> +fail:
>>>>> +	xe_pm_runtime_put(xe);
>>>>> +	xe_gt_sriov_err(gt, "migration recovery failed (%pe)\n", ERR_PTR(err));
>>>>> +	xe_device_declare_wedged(xe);
>>>>> +}
>>>>> +
>>>>> +static void migration_worker_func(struct work_struct *w)
>>>>> +{
>>>>> +	struct xe_gt *gt = container_of(w, struct xe_gt,
>>>>> +					sriov.vf.migration.worker);
>>>>> +
>>>>> +	vf_post_migration_recovery(gt);
>>>>> +}
>>>>> +
>>>>> +/**
>>>>> + * xe_gt_sriov_vf_migration_init_early() - VF post migration init early
>>>>> + * @gt: the &xe_gt
>>>>> + */
>>>>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt)
>>>>> +{
>>>>> +	init_rwsem(&gt->sriov.vf.self_config.lock);
>>>>> +	spin_lock_init(&gt->sriov.vf.migration.lock);
>>>>> +	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
>>>>> +
>>>>> +	if (!xe_sriov_vf_migration_supported(gt_to_xe(gt)))
>>>>> +		xe_gt_sriov_info(gt, "migration not supported by this module version\n");
>>>> we likely don't want to repeat that message on every GT
>>>>
>>> So move this to xe_sriov_vf_init_early?
>> hmm, maybe it is even already there
>>
> Let me check on that. Either way will remove this from the GT layer.
>
>>>>> +}
>>>>> +
>>>>>   /**
>>>>>    * xe_gt_sriov_vf_recovery_inprogress() - VF post migration recovery in progress
>>>>>    * @gt: the &xe_gt
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> index bb5f8eace19b..2ac6775b52f0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>>>> @@ -21,10 +21,9 @@ void xe_gt_sriov_vf_guc_versions(struct xe_gt *gt,
>>>>>   int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>>>>>   int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>>>>>   int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
>>>>> -void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt);
>>>>> -int xe_gt_sriov_vf_notify_resfix_done(struct xe_gt *gt);
>>>>>   void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>>>   
>>>>> +void xe_gt_sriov_vf_migration_init_early(struct xe_gt *gt);
>>>>>   bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt);
>>>>>   
>>>>>   u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> index 7b10b8e1e10e..53680a2f188a 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>>>>> @@ -8,6 +8,7 @@
>>>>>   
>>>>>   #include <linux/rwsem.h>
>>>>>   #include <linux/types.h>
>>>>> +#include <linux/workqueue.h>
>>>>>   #include "xe_uc_fw_types.h"
>>>>>   
>>>>>   /**
>>>>> @@ -53,6 +54,12 @@ struct xe_gt_sriov_vf_runtime {
>>>>>    * xe_gt_sriov_vf_migration - VF migration data.
>>>>>    */
>>>>>   struct xe_gt_sriov_vf_migration {
>>>>> +	/** @migration: VF migration recovery worker */
>>>>> +	struct work_struct worker;
>>>>> +	/** @lock: Protects recovery_queued */
>>>>> +	spinlock_t lock;
>>>>> +	/** @recovery_queued: VF post migration recovery in queued */
>>>>> +	bool recovery_queued;
>>>>>   	/** @recovery_inprogress: VF post migration recovery in progress */
>>>>>   	bool recovery_inprogress;
>>>>>   };
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>>> index da064a1e7419..7d91553c4acc 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>>>> @@ -6,21 +6,12 @@
>>>>>   #include <drm/drm_debugfs.h>
>>>>>   #include <drm/drm_managed.h>
>>>>>   
>>>>> -#include "xe_assert.h"
>>>>> -#include "xe_device.h"
>>>>>   #include "xe_gt.h"
>>>>> -#include "xe_gt_sriov_printk.h"
>>>>>   #include "xe_gt_sriov_vf.h"
>>>>>   #include "xe_guc.h"
>>>>> -#include "xe_guc_submit.h"
>>>>> -#include "xe_irq.h"
>>>>> -#include "xe_lrc.h"
>>>>> -#include "xe_pm.h"
>>>>> -#include "xe_sriov.h"
>>>>>   #include "xe_sriov_printk.h"
>>>>>   #include "xe_sriov_vf.h"
>>>>>   #include "xe_sriov_vf_ccs.h"
>>>>> -#include "xe_tile_sriov_vf.h"
>>>>>   
>>>>>   /**
>>>>>    * DOC: VF restore procedure in PF KMD and VF KMD
>>>>> @@ -158,8 +149,6 @@ static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)
>>>>>   	xe->sriov.vf.migration.enabled = false;
>>>>>   }
>>>>>   
>>>>> -static void migration_worker_func(struct work_struct *w);
>>>>> -
>>>>>   static void vf_migration_init_early(struct xe_device *xe)
>>>>>   {
>>>>>   	/*
>>>>> @@ -184,8 +173,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>>>   						    guc_version.major, guc_version.minor);
>>>>>   	}
>>>>>   
>>>>> -	INIT_WORK(&xe->sriov.vf.migration.worker, migration_worker_func);
>>>>> -
>>>>>   	xe->sriov.vf.migration.enabled = true;
>>>>>   	xe_sriov_dbg(xe, "migration support enabled\n");
>>>>>   }
>>>>> @@ -200,238 +187,11 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>>>>>   	unsigned int id;
>>>>>   
>>>>>   	for_each_gt(gt, xe, id)
>>>>> -		init_rwsem(&gt->sriov.vf.self_config.lock);
>>>>> +		xe_gt_sriov_vf_migration_init_early(gt);
>>>> still, this should be called from gt_init_early kind of functions
>>>>
>>> Kinda a nit that I'm not convinced is worth while to have
>>> xe_sriov_vf_init_early and then xe_gt_sriov_vf_migration_init_early
>>> called in gt_init_early...
>> we have global xe level initialization, something like:
>>
>> 	xe_device_init_early
>> 		xe_sriov_vf_init_early
>> 	xe_device_init
>> 		xe_sriov_vf_init
>>
>> then per-gt initialization, that follows the native flow, something like
>>
>> 	xe_gt_init_early
>> 		xe_gt_sriov_vf_init_early
>> 			xe_gt_sriov_vf_migration_init_early
>> 	xe_gt_init
>> 		xe_gt_sriov_vf_init
>> 			xe_gt_sriov_vf_migration_init
>>
>> IMO we shouldn't jump in sriov code from xe level to gt level init on our own
>>
> Ok, let me refactor this. Easy enough to do.
>
> Matt
>
>>> Matt
>>>
>>>>>   
>>>>>   	vf_migration_init_early(xe);
>>>>>   }
>>>>>   
>>>>> -/**
>>>>> - * vf_post_migration_shutdown - Stop the driver activities after VF migration.
>>>>> - * @xe: the &xe_device struct instance
>>>>> - *
>>>>> - * After this VM is migrated and assigned to a new VF, it is running on a new
>>>>> - * hardware, and therefore many hardware-dependent states and related structures
>>>>> - * require fixups. Without fixups, the hardware cannot do any work, and therefore
>>>>> - * all GPU pipelines are stalled.
>>>>> - * Stop some of kernel activities to make the fixup process faster.
>>>>> - */
>>>>> -static void vf_post_migration_shutdown(struct xe_device *xe)
>>>>> -{
>>>>> -	struct xe_gt *gt;
>>>>> -	unsigned int id;
>>>>> -	int ret = 0;
>>>>> -
>>>>> -	for_each_gt(gt, xe, id) {
>>>>> -		xe_guc_submit_pause(&gt->uc.guc);
>>>>> -		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
>>>>> -	}
>>>>> -
>>>>> -	if (ret)
>>>>> -		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");
>>>>> -}
>>>>> -
>>>>> -/**
>>>>> - * vf_post_migration_kickstart - Re-start the driver activities under new hardware.
>>>>> - * @xe: the &xe_device struct instance
>>>>> - *
>>>>> - * After we have finished with all post-migration fixups, restart the driver
>>>>> - * activities to continue feeding the GPU with workloads.
>>>>> - */
>>>>> -static void vf_post_migration_kickstart(struct xe_device *xe)
>>>>> -{
>>>>> -	struct xe_gt *gt;
>>>>> -	unsigned int id;
>>>>> -
>>>>> -	/*
>>>>> -	 * Make sure interrupts on the new HW are properly set. The GuC IRQ
>>>>> -	 * must be working at this point, since the recovery did started,
>>>>> -	 * but the rest was not enabled using the procedure from spec.
>>>>> -	 */
>>>>> -	xe_irq_resume(xe);
>>>>> -
>>>>> -	for_each_gt(gt, xe, id) {
>>>>> -		xe_guc_submit_reset_unblock(&gt->uc.guc);
>>>>> -		xe_guc_submit_unpause(&gt->uc.guc);
>>>>> -	}
>>>>> -}
>>>>> -
>>>>> -static bool gt_vf_post_migration_needed(struct xe_gt *gt)
>>>>> -{
>>>>> -	return test_bit(gt->info.id, &gt_to_xe(gt)->sriov.vf.migration.gt_flags);
>>>>> -}
>>>>> -
>>>>> -/*
>>>>> - * Notify GuCs marked in flags about resource fixups apply finished.
>>>>> - * @xe: the &xe_device struct instance
>>>>> - * @gt_flags: flags marking to which GTs the notification shall be sent
>>>>> - */
>>>>> -static int vf_post_migration_notify_resfix_done(struct xe_device *xe, unsigned long gt_flags)
>>>>> -{
>>>>> -	struct xe_gt *gt;
>>>>> -	unsigned int id;
>>>>> -	int err = 0;
>>>>> -
>>>>> -	for_each_gt(gt, xe, id) {
>>>>> -		if (!test_bit(id, &gt_flags))
>>>>> -			continue;
>>>>> -		/* skip asking GuC for RESFIX exit if new recovery request arrived */
>>>>> -		if (gt_vf_post_migration_needed(gt))
>>>>> -			continue;
>>>>> -		err = xe_gt_sriov_vf_notify_resfix_done(gt);
>>>>> -		if (err)
>>>>> -			break;
>>>>> -		clear_bit(id, &gt_flags);
>>>>> -	}
>>>>> -
>>>>> -	if (gt_flags && !err)
>>>>> -		drm_dbg(&xe->drm, "another recovery imminent, skipped some notifications\n");
>>>>> -	return err;
>>>>> -}
>>>>> -
>>>>> -static int vf_get_next_migrated_gt_id(struct xe_device *xe)
>>>>> -{
>>>>> -	struct xe_gt *gt;
>>>>> -	unsigned int id;
>>>>> -
>>>>> -	for_each_gt(gt, xe, id) {
>>>>> -		if (test_and_clear_bit(id, &xe->sriov.vf.migration.gt_flags))
>>>>> -			return id;
>>>>> -	}
>>>>> -	return -1;
>>>>> -}
>>>>> -
>>>>> -static size_t post_migration_scratch_size(struct xe_device *xe)
>>>>> -{
>>>>> -	return max(xe_lrc_reg_size(xe), LRC_WA_BB_SIZE);
>>>>> -}
>>>>> -
>>>>> -/**
>>>>> - * Perform post-migration fixups on a single GT.
>>>>> - *
>>>>> - * After migration, GuC needs to be re-queried for VF configuration to check
>>>>> - * if it matches previous provisioning. Most of VF provisioning shall be the
>>>>> - * same, except GGTT range, since GGTT is not virtualized per-VF. If GGTT
>>>>> - * range has changed, we have to perform fixups - shift all GGTT references
>>>>> - * used anywhere within the driver. After the fixups in this function succeed,
>>>>> - * it is allowed to ask the GuC bound to this GT to continue normal operation.
>>>>> - *
>>>>> - * Returns: 0 if the operation completed successfully, or a negative error
>>>>> - * code otherwise.
>>>>> - */
>>>>> -static int gt_vf_post_migration_fixups(struct xe_gt *gt)
>>>>> -{
>>>>> -	s64 shift;
>>>>> -	void *buf;
>>>>> -	int err;
>>>>> -
>>>>> -	buf = kmalloc(post_migration_scratch_size(gt_to_xe(gt)), GFP_KERNEL);
>>>>> -	if (!buf)
>>>>> -		return -ENOMEM;
>>>>> -
>>>>> -	err = xe_gt_sriov_vf_query_config(gt);
>>>>> -	if (err)
>>>>> -		goto out;
>>>>> -
>>>>> -	shift = xe_gt_sriov_vf_ggtt_shift(gt);
>>>>> -	if (shift) {
>>>>> -		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>>>>> -		xe_gt_sriov_vf_default_lrcs_hwsp_rebase(gt);
>>>>> -		err = xe_guc_contexts_hwsp_rebase(&gt->uc.guc, buf);
>>>>> -		if (err)
>>>>> -			goto out;
>>>>> -	}
>>>>> -
>>>>> -out:
>>>>> -	kfree(buf);
>>>>> -	return err;
>>>>> -}
>>>>> -
>>>>> -static void vf_post_migration_recovery(struct xe_device *xe)
>>>>> -{
>>>>> -	unsigned long fixed_gts = 0;
>>>>> -	int id, err;
>>>>> -
>>>>> -	drm_dbg(&xe->drm, "migration recovery in progress\n");
>>>>> -	xe_pm_runtime_get(xe);
>>>>> -	vf_post_migration_shutdown(xe);
>>>>> -
>>>>> -	if (!xe_sriov_vf_migration_supported(xe)) {
>>>>> -		xe_sriov_err(xe, "migration is not supported\n");
>>>>> -		err = -ENOTRECOVERABLE;
>>>>> -		goto fail;
>>>>> -	}
>>>>> -
>>>>> -	while (id = vf_get_next_migrated_gt_id(xe), id >= 0) {
>>>>> -		struct xe_gt *gt = xe_device_get_gt(xe, id);
>>>>> -
>>>>> -		err = gt_vf_post_migration_fixups(gt);
>>>>> -		if (err)
>>>>> -			goto fail;
>>>>> -
>>>>> -		set_bit(id, &fixed_gts);
>>>>> -	}
>>>>> -
>>>>> -	vf_post_migration_kickstart(xe);
>>>>> -	err = vf_post_migration_notify_resfix_done(xe, fixed_gts);
>>>>> -	if (err)
>>>>> -		goto fail;
>>>>> -
>>>>> -	xe_pm_runtime_put(xe);
>>>>> -	drm_notice(&xe->drm, "migration recovery ended\n");
>>>>> -	return;
>>>>> -fail:
>>>>> -	xe_pm_runtime_put(xe);
>>>>> -	drm_err(&xe->drm, "migration recovery failed (%pe)\n", ERR_PTR(err));
>>>>> -	xe_device_declare_wedged(xe);
>>>>> -}
>>>>> -
>>>>> -static void migration_worker_func(struct work_struct *w)
>>>>> -{
>>>>> -	struct xe_device *xe = container_of(w, struct xe_device,
>>>>> -					    sriov.vf.migration.worker);
>>>>> -
>>>>> -	vf_post_migration_recovery(xe);
>>>>> -}
>>>>> -
>>>>> -/*
>>>>> - * Check if post-restore recovery is coming on any of GTs.
>>>>> - * @xe: the &xe_device struct instance
>>>>> - *
>>>>> - * Return: True if migration recovery worker will soon be running. Any worker currently
>>>>> - * executing does not affect the result.
>>>>> - */
>>>>> -static bool vf_ready_to_recovery_on_any_gts(struct xe_device *xe)
>>>>> -{
>>>>> -	struct xe_gt *gt;
>>>>> -	unsigned int id;
>>>>> -
>>>>> -	for_each_gt(gt, xe, id) {
>>>>> -		if (test_bit(id, &xe->sriov.vf.migration.gt_flags))
>>>>> -			return true;
>>>>> -	}
>>>>> -	return false;
>>>>> -}
>>>>> -
>>>>> -/**
>>>>> - * xe_sriov_vf_start_migration_recovery - Start VF migration recovery.
>>>>> - * @xe: the &xe_device to start recovery on
>>>>> - *
>>>>> - * This function shall be called only by VF.
>>>>> - */
>>>>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe)
>>>>> -{
>>>>> -	bool started;
>>>>> -
>>>>> -	xe_assert(xe, IS_SRIOV_VF(xe));
>>>>> -
>>>>> -	if (!vf_ready_to_recovery_on_any_gts(xe))
>>>>> -		return;
>>>>> -
>>>>> -	started = queue_work(xe->sriov.wq, &xe->sriov.vf.migration.worker);
>>>>> -	drm_info(&xe->drm, "VF migration recovery %s\n", started ?
>>>>> -		 "scheduled" : "already in progress");
>>>>> -}
>>>>> -
>>>>>   /**
>>>>>    * xe_sriov_vf_init_late() - SR-IOV VF late initialization functions.
>>>>>    * @xe: the &xe_device to initialize
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
>>>>> index 9e752105ec2a..4df95266b261 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
>>>>> @@ -13,7 +13,6 @@ struct xe_device;
>>>>>   
>>>>>   void xe_sriov_vf_init_early(struct xe_device *xe);
>>>>>   int xe_sriov_vf_init_late(struct xe_device *xe);
>>>>> -void xe_sriov_vf_start_migration_recovery(struct xe_device *xe);
>>>>>   bool xe_sriov_vf_migration_supported(struct xe_device *xe);
>>>>>   void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>>>>>   
>>>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>>>> index 426cc5841958..6a0fd0f5463e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_types.h
>>>>> @@ -33,10 +33,6 @@ struct xe_device_vf {
>>>>>   
>>>>>   	/** @migration: VF Migration state data */
>>>>>   	struct {
>>>>> -		/** @migration.worker: VF migration recovery worker */
>>>>> -		struct work_struct worker;
>>>>> -		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>>>>> -		unsigned long gt_flags;
>>>>>   		/**
>>>>>   		 * @migration.enabled: flag indicating if migration support
>>>>>   		 * was enabled or not due to missing prerequisites
