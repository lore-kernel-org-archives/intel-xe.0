Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD61FC3064D
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 08:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71710E1B7;
	Fri, 28 Jun 2024 08:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxTrZN5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C638A10E10D
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719565091; x=1751101091;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fnsro8zXIt0N+QLsUkLWwGRvrnH7r27q0btvS3DiYi4=;
 b=YxTrZN5aMl6a0AqzS8653dYVFYXMOKhU5/uGx9WEB31netITQrdRB3BI
 6usB/+VRaSyWHOAn5lGoOIUNCNM2GWtJm8I40S6cbkZzzAqxnT0/DZ/JS
 Zn+nzStEY3m5k6vNbhpgJHTgJKcTZzqoJJywrUPgRmXECeUrRRvPZCj/v
 9MhvNcMB4Y9eSPgdYSXGf/MbEfXQYm+77whqZooKAKpkU1i/j7WrVnHZl
 UfMzPMAVaMlS0/n60tF+7RrS6Hu1QDsuhEfYr8S7dyauDDU/pjvk/XxWF
 nMz/3mQFx7K6o4hlRLtQA8W5PfMaPEI78KxkWLT67csXBUrexCiUvDGym A==;
X-CSE-ConnectionGUID: Lr17ADcSSnqvXud2R/1XEg==
X-CSE-MsgGUID: q6NjadDzRXG+DfENA7vlmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="27425725"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="27425725"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 01:58:08 -0700
X-CSE-ConnectionGUID: W2B007BoQU6XuJwbaEOnYg==
X-CSE-MsgGUID: OUu8Ji9AQZGgA72+vMgZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; d="scan'208";a="45327703"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 01:58:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 01:58:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 01:58:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 01:58:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 01:58:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WShay1KYresBudq5xAkCHsJSuvRet/qg3DIFky3cgC4G+NTkU8LwThANfVVfMOJSWKlIpwTVFxTG4FQdwrz43XqL8gIS/HJPFDmdQ8xxyzhUYa95L+1H/+w1rd0ObpIjsitBCnM8pbDKswlMB0IdAgixY0go3qQPzaKBQ4Y/XnUL50ooky0C/CMx5BhHVBPOEu84eXvd1brhjvfgFFUjc42WXowS7Nou84UIgeUN7h71jhcJy3JXx1Y6k5ZLBhp4tGw+EZ366ww7lChO2gbHNCogUlObmu4LzJ1cctiRu2HIeHBARK6mqai4pS+qOURrwbeyKY81uD6cK5rB+AKnnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Xn3+vNmaCYcOCmamqHzj47a3gQB681GlXRLGIIuAmk=;
 b=Y7wPhz5izfMxpnOToZAE3V9D2dSxXABFUDbOyb6XbuCERU0N+M8asOR+OOeBq8v/BOcsIWnSygbe7IDkDhhGmG/1E6a+0RBjszl40VeqXWVMOafmzzCKROSAQTlRC5SJKscI0k5VaYkvk2qsRpX8M1JLNjwSR47G9/9fgFu/kQ3kn4iNtAQtrJOGpkpskD25YVvc78jlhpptN1A8sWusCu8MwncyHj4EOPuRP1/QedJGcIyYx4RzcgDYYuxZFSmG9N1VStNJBxIoO2mTsTv3V4l6NAdAACWh1W7g5FVFfDBX61Oh1obllfAP4CbSrjgOi2rDXBkwZ0FipyI7YEeueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 CH0PR11MB8233.namprd11.prod.outlook.com (2603:10b6:610:183::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 08:58:04 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 08:58:04 +0000
Message-ID: <cb366a61-07f7-4fa5-b1c1-5f9d3a567d7b@intel.com>
Date: Fri, 28 Jun 2024 10:58:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Configure TLB timeout based on CT buffer
 size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20240626150109.10878-1-nirmoy.das@intel.com>
 <cdf789fa-b486-4f21-9c04-5d6ef53188cf@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <cdf789fa-b486-4f21-9c04-5d6ef53188cf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0005.eurprd06.prod.outlook.com
 (2603:10a6:10:100::18) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|CH0PR11MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c13b6bc-6fa7-41b4-23d1-08dc97506bf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkJRdVJ3ekRnaGVOZEtTL3VVcnJ2enZCbDZzaFU4Qk1SUWZLbVdmZm45aCtU?=
 =?utf-8?B?M2YwT0pJRmM1Z3k1azB5UWl5R2xKVnJoTUhPbG95RldOZFRZajZ3TDMxUUMw?=
 =?utf-8?B?SGN4dGpjWlllUk8ydnNNemp3ZUNzQ3pHTGZHcUREa0tZeHJHaVBMRW1LQXdB?=
 =?utf-8?B?b212QmNvQkRUWW8wbHRDRVFFZkU1M2x0eWtyRUluOWxHMkgxTFZMWkFpeHFK?=
 =?utf-8?B?RjM3emFaeWFzZFBZWXROeWpKMDBqSzBqQUE2YUx2Ri9iclBXWDREeDdZNzFo?=
 =?utf-8?B?T3NvNnZtQUJZR3RWRUpEY3doUXRrRjZ4Q2dLM2RYcFFuVG5PN1BEa3ZMRnRU?=
 =?utf-8?B?OFdVN2RYRzdZdCtqZitqY0ZwR255MnN0K2xCcjY3dXR1bFVPVUU0SFJlTzhS?=
 =?utf-8?B?VXZBTWh3Ung1Nm11Vm9lSGNuM21FSW9oUWd1eXNpQUx1M09PS1o2WDVDWnJN?=
 =?utf-8?B?UWlLdWpXKzZnUjBtZ0F6ZWVHaEFkcUlEZWN6RUN2bWRUN3JleUNWMWJSQllE?=
 =?utf-8?B?SzRNSUkrMHd3UXBYSFFnQzFYbXJkVlRiamdkcUpmTE12VllyVGpkcWltanZr?=
 =?utf-8?B?TXBibkRBM0s3N3k4Nm92a3BFYnBWVEwzTk4zQmNyOGZkTHZuYzZ5TkhjOWxZ?=
 =?utf-8?B?NGtVaDJBSGtxTW8xcTk5MXMySVFBQTlxVXltL0hkZmRPM3pUZGlnbThDUGxU?=
 =?utf-8?B?bTNPSzh5RGtWWUVnak9BSm15VG42OTdDWXNDdFNtNkFFU0xQUWF5L3lVYlFB?=
 =?utf-8?B?M0FDanBURk5FNk5kMU9MNlpSRjVqK1R5NDI5MWxIZ1A0TDRWN3RZN1JwZTNn?=
 =?utf-8?B?Qmk0aVZzeHc5dzVkOWF5NHdJWDdGcjMyd2oxZHFFVVdMQmFUMGtVRzFuMU8v?=
 =?utf-8?B?L0ZudWRyUTJ4VENRNVF5djUxUzl2OUs4SVY5Sk16aFF2SENCby9ReWJieUtV?=
 =?utf-8?B?QXdkSDFxT3dMeDhGTGFQblBIVnVXRDdpZEpGUk1WRnpOR1JJTVJTVUVqZk5y?=
 =?utf-8?B?ZEdmN3RHb0h3V1lieHk4QlZxamR2ekdUSG4wc3BMYUFuK1hiampZMzRIQmV0?=
 =?utf-8?B?Z2krL1Nxc3Q1SUJoVFA2MStBQVBSdGl4SHFnT0RPdUtQcExYMTJXbzBtNzli?=
 =?utf-8?B?RlUwa1ZMWDlJS1BwWDFOeVZPRGt2b3lmQXZqeDR3cWFHQzl3bHEvd3NGa2VU?=
 =?utf-8?B?ZUZwemh1b2EwTERiODBCNGFjbkVHa2Iwb3YzaytyUlJUcG90U0lNd05Ickpj?=
 =?utf-8?B?clhKTGU0bjZLcjhDYzBxcUNZMVBGYmtaQzBCVmEyN2xVakh6QnpERlpvZGpB?=
 =?utf-8?B?WERDeGM4WEI0cDR0UHpWKy92K2R3eWlnZ2JiNFZBMzE4b1puYjV0Q3I5cUVS?=
 =?utf-8?B?cjF4MThPeEVGS0taS2l3RHc5aVg0SWZyQ1VpN2tmWFFQNUhab1RsejBsQUN1?=
 =?utf-8?B?bFEyYTlNUzE2NkxNTElxSExBcWdWZHIxSjJMS05Jcmxqdk40dldpcW1pTnBW?=
 =?utf-8?B?S0hoZy9qbXZISG9Ob0tXd3lwcURKOHpOVlp0dkoySFY0dXpCVDZmSmo1cSto?=
 =?utf-8?B?WlZGUnZYNXVnSG0zMkY3RnpXU2RPdklHMG5na2FBMUhUN3BseVlacG53WVc1?=
 =?utf-8?B?N2hSQmpBanEvaXlNN0p4SFczcDdBb0RWMHZPT2dpcUZpdGxoMTdHTCt6Ti9r?=
 =?utf-8?B?SUYxUWYxZXBhbFlOSmt4VDlZN2hrN1Y5SXdLVzJQWGdITERtVCszc05uVU5H?=
 =?utf-8?Q?7kcUPv7u29qOw59QFM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJtUDh4NDZkbk9oOWE2ODh6ckNkdUxrMGdUU1MzaXpZd0JIYVVVN3FWaEJ2?=
 =?utf-8?B?TlFwM0VIVjVpVE8xUFhDdlNlWWVGU1RzeU9pbWRnamlvbDd0Unl6NE1TK2pM?=
 =?utf-8?B?L0VtQWNIaEg1ZGcrd3h1ZWJJZEc3amxOTG5pazlPWHdrUlpLTFNvR05lMXNl?=
 =?utf-8?B?UGhGU0taLy8rNXhSMUZac05HamRUOG02TWFENlBleDlYT2M2ejRDa0V5Ym81?=
 =?utf-8?B?QnpneUxBQjdLcnJxS05sRjBNVDNRK2Z1MVllTzRSTm90WHk2eHozaEN3VUdm?=
 =?utf-8?B?U2pIRG92RUNmZXVMbS9iZjJoNlRPakYzVzVTTzZQQ1kyZlg0ek1lRFdWUUlQ?=
 =?utf-8?B?MkkxMy9QNS9vdWE3T01DZWdHT25GS2tFQWV2ZWdHN2xyWmlDMWsyM0JCd1Yv?=
 =?utf-8?B?dVVkWlZ0MFlXSlFkUlR3eS91QlB1Q05lS2Jub1JrTVlhSDZIeGJBd2liK0JY?=
 =?utf-8?B?M3Z5bEExRnJxUVFsV1ZnNUhJeVlCNjU3czgwb3ZtSERSN3NvSE9rdExVb0dk?=
 =?utf-8?B?dVRCSy8yRU1FbFVHNjVuU2RYOFR3Q1ZpZU1IaDVWdXhnRzh6NHBLeEtvRFBF?=
 =?utf-8?B?YzNsQ1VFZ00zeUNRTXNQMEd1T3dqNVI2MkhqUW1NSXNlajdsRjlabVVFcTZL?=
 =?utf-8?B?a0grRm4yd29jdmkycThiZER2YmtVN1RacDU4Y3RUWVlsaTh2VjA0eE5vSjJs?=
 =?utf-8?B?b0lLRjlzVFZLZWZ4RU9wTWJzd2FJMXNrUHI2cSs2Z3kvbTdhSmhIL2YveE1t?=
 =?utf-8?B?cHpQRUFJc0JzZ2hpbzRHNlNYUWlLc29aT3VUcndtbVRjZUcveWtiUG4rNmxY?=
 =?utf-8?B?VkNHYmNFaVF4bElodTd3N2dOUnVWY3hwYjVJL1pxVWVPNlU4L2JVVmloYUNP?=
 =?utf-8?B?WVduL050UCtBaEpEQ0hUbzAwTUs1YUNvSGZvOGdJckQvRDNuVDJyQ1RVSW0w?=
 =?utf-8?B?emNVSVJLZEplSWs1dm5HS1lzK3dYSVRkNWYyOUZ3NjZVcEJYWmxHZEV1aktJ?=
 =?utf-8?B?QlBKUGxGVTZWMHVOWXVuU3J6V2lJa2l0MDdzUk1TYXBxb1JWa3Bpek02bFVh?=
 =?utf-8?B?NVpFNG02MElQNVZYbmxkMWFOdW5kd2lRbG5yK21mRkFJVUpNbW1jMlJUSi9q?=
 =?utf-8?B?YTF2UnkxdytpbWU4ZjZLRWQ5ZjAyZTZqUXREamV1QkNtMmJwYVRXWGtPUDND?=
 =?utf-8?B?NUphUUF2V3JNQXJKd0swdGIvYzFmSzhYaWxIUmdXZlpza2JRTFM5c1JHTnd1?=
 =?utf-8?B?d3RtdVNvTFNaN0FDNEZGR3prVndSTzVjSnQrWHBUUzB5N2h3UHFrT2QrN2FG?=
 =?utf-8?B?T0trMVdtbGlnMnpLUVNqd1dGeVRsQzV2U0QxZ3ZJU1hETDlaQjZrK1FlS3Rq?=
 =?utf-8?B?Ly8xb09nOWVoUFFVZC9zUDI1UXlxZlRxZmxnVXIvQ2VFUVdyRGtURmxkWVlo?=
 =?utf-8?B?NTQ5bU4rdGltWFBBM3VuRElNeHNHNEdrRnkwT0d2Rnk2cW01WC9SU2RIemll?=
 =?utf-8?B?K3ZhL0JiOHNoajdFbGI4U1h1eHpla2hDSldYeG5VSVcwQlhrR1pEaWMxaGd6?=
 =?utf-8?B?OHhxKzJ5UUZzQ0NBczAzU1lML3cyTnh1a0YyaU5Jelg3Q25xVlNMOWtuMEtn?=
 =?utf-8?B?NjQySG53QS9nQVZQL05TNFkvM2dnRGRjT0FwTTNqbmMrNUhkcU10K1dXWDNu?=
 =?utf-8?B?bG5nNkRJMTRnRUV4dEI2N2NkSmN3THgzYndtbXpnWjVaQ2ZDWm5nQ3NabitF?=
 =?utf-8?B?KzZlbW1oaUluRnlPNXM5eFdnYmNFb2lpbU9Oa3hTOVNReDZ4MG0vRUoxSS9F?=
 =?utf-8?B?bm5RYnQvUW9KRVdSNjNjbFE1R1psVmdkbytqaG04NlJ0b0F6Tm1jenNET0dO?=
 =?utf-8?B?SG0yYjJQZUhhR1VlZmxHakVZS0FHZkp6SDVxRUNETmQvb3N6eUhyeGs3SnJo?=
 =?utf-8?B?TXgwb1VNY29Zakg4aUIvd0MzTWhXR2JZQVJLejhrOWV4dUpHbU1YVHVySmkx?=
 =?utf-8?B?SmNqdkE3czM3WnUxZVZGUlJYZ0ZXc3VqM2xwWUVyR29oZ1g5MFlJVkl3cjJa?=
 =?utf-8?B?N0xET2pudzdXcmkvUHl1aHVtN24rOCtyaitPWmRHUTFNU1JQUTB5ZFVsVURW?=
 =?utf-8?Q?+aLZ3vDUhCXRxjbeIUDbZCMdO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c13b6bc-6fa7-41b4-23d1-08dc97506bf4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 08:58:04.6129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veN01O2ye98aaYx1hLUw8AZnUFr4S0qyCRIgRlReRhsh8IPR0EHurQ9ql0J4rFU389unHdOML1Gkhzo/vSV4KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8233
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

Hi Michal,


Thanks a lot for taking time to review this so nicely!

On 6/27/2024 10:40 PM, Michal Wajdeczko wrote:
>
> On 26.06.2024 17:01, Nirmoy Das wrote:
>> GuC TLB invalidation depends on GuC to process the request from the CT
>> queue and then the real time to invalidate TLB. Add a function to return
>> overestimated possible time a TLB inval H2G might take which can be used
>> as timeout value for TLB invalidation wait time.
>>
>> v3: Pass CT to xe_guc_ct_queue_proc_time_jiffies() (Michal)
>>      Add tlb_timeout_jiffies() that replaces TLB_TIMEOUT(Michal)
>> v2: Address reviews from Michal.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 30 +++++++++++++++------
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 16 +++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>>   3 files changed, 40 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index e1f1ccb01143..d509b72a6d89 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -17,7 +17,22 @@
>>   #include "xe_trace.h"
>>   #include "regs/xe_guc_regs.h"
>>   
>> -#define TLB_TIMEOUT	(HZ / 4)
>> +/**
> downgrade to normal comment
Will do that.
>
>> + * TLB inval depends on pending commands in the CT queue and then the real
>> + * invalidation time. Double up the time to process full CT queue
>> + * just to be on the safe side.
>> + */
>> +static long tlb_timeout_jiffies(struct xe_gt *gt)
>> +{
>> +	/* this reflects what HW/GuC needs to process TLB inv request */
>> +	const long hw_tlb_timeout = HZ / 4;
>> +
>> +	/* this estimates actual delay caused by the CTB transport */
>> +	long delay = xe_guc_ct_queue_proc_time_jiffies(&gt->uc.guc.ct);
>> +
>> +	return hw_tlb_timeout + 2 * delay;
>> +}
>> +
>>   
>>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   {
>> @@ -32,7 +47,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   		s64 since_inval_ms = ktime_ms_delta(ktime_get(),
>>   						    fence->invalidation_time);
>>   
>> -		if (msecs_to_jiffies(since_inval_ms) < TLB_TIMEOUT)
>> +		if (msecs_to_jiffies(since_inval_ms) < tlb_timeout_jiffies(gt))
>>   			break;
>>   
>>   		trace_xe_gt_tlb_invalidation_fence_timeout(xe, fence);
>> @@ -47,7 +62,7 @@ static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>>   		queue_delayed_work(system_wq,
>>   				   &gt->tlb_invalidation.fence_tdr,
>> -				   TLB_TIMEOUT);
>> +				   tlb_timeout_jiffies(gt));
>>   	spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>>   }
>>   
>> @@ -183,7 +198,7 @@ static int send_tlb_invalidation(struct xe_guc *guc,
>>   			if (list_is_singular(&gt->tlb_invalidation.pending_fences))
>>   				queue_delayed_work(system_wq,
>>   						   &gt->tlb_invalidation.fence_tdr,
>> -						   TLB_TIMEOUT);
>> +						   tlb_timeout_jiffies(gt));
>>   		}
>>   		spin_unlock_irq(&gt->tlb_invalidation.pending_lock);
>>   	} else if (ret < 0 && fence) {
>> @@ -390,8 +405,7 @@ int xe_gt_tlb_invalidation_vma(struct xe_gt *gt,
>>    * @gt: graphics tile
>>    * @seqno: seqno to wait which was returned from xe_gt_tlb_invalidation
>>    *
>> - * Wait for 200ms for a TLB invalidation to complete, in practice we always
>> - * should receive the TLB invalidation within 200ms.
>> + * Wait for tlb_timeout_jiffies() for a TLB invalidation to complete.
>>    *
>>    * Return: 0 on success, -ETIME on TLB invalidation timeout
>>    */
>> @@ -410,7 +424,7 @@ int xe_gt_tlb_invalidation_wait(struct xe_gt *gt, int seqno)
>>   	 */
>>   	ret = wait_event_timeout(guc->ct.wq,
>>   				 tlb_invalidation_seqno_past(gt, seqno),
>> -				 TLB_TIMEOUT);
>> +				 tlb_timeout_jiffies(gt));
>>   	if (!ret) {
>>   		struct drm_printer p = xe_gt_err_printer(gt);
>>   
>> @@ -486,7 +500,7 @@ int xe_guc_tlb_invalidation_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>   	if (!list_empty(&gt->tlb_invalidation.pending_fences))
>>   		mod_delayed_work(system_wq,
>>   				 &gt->tlb_invalidation.fence_tdr,
>> -				 TLB_TIMEOUT);
>> +				 tlb_timeout_jiffies(gt));
>>   	else
>>   		cancel_delayed_work(&gt->tlb_invalidation.fence_tdr);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 873d1bcbedd7..df95b0e878ad 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -112,6 +112,22 @@ ct_to_xe(struct xe_guc_ct *ct)
>>   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>>   
>> +/**
>> + * xe_guc_ct_queue_proc_time_jiffies - Return maximum time to process a full
>> + * CT command queue
>> + * @ct: the &xe_guc_ct. Unused at this moment but will be used in the future.
>> + *
>> + * Observation is that A 4KiB buffer full of commands takes a little over a
> s/A/a

Wish checkpatch could catch that.


>
>> + * second to process. Use that to calculate maximum time to process a full CT
>> + * command queue.
>> + *
>> + * Return: Maximum time to process a full CT queue in jiffies.
>> + */
>> +long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct)
>> +{
>> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_4K;
> maybe make sure CTB is in 4K blocks
>
>   	BUILD_BUG_ON(!IS_ALIGNED(CTB_H2G_BUFFER_SIZE, SZ_4));
>
> and to better reflect the time logic:
>
> 	return (CTB_H2G_BUFFER_SIZE / SZ_4K) * HZ;


Sounds good. Will add that.

>
>> +}
>> +
>>   static size_t guc_ct_size(void)
>>   {
>>   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 105bb8e99a8d..190202fce2d0 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>>   }
>>   
>> +long xe_guc_ct_queue_proc_time_jiffies(struct xe_guc_ct *ct);
>> +
>>   #endif
> with that,
>
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Thanks. I will resend with above suggestions.


Nirmoy

