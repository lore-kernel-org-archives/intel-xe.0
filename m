Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92382C369AE
	for <intel-xe@archiver.kernel.org>; Fri, 11 Apr 2025 22:58:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3416E10E138;
	Fri, 11 Apr 2025 22:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9gvfbEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2EBF10E138
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Apr 2025 22:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744412289; x=1775948289;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8FkwVny1twAixY2+DK7OiZHxz20G8tMp7exkWvOjwZY=;
 b=H9gvfbEPNTdcRH7/VZm6wanZnK9bTrqPHsir41Gn/aiXV3aXu9wJek1h
 pwULGleSpKtNvgpfMYKrnQVDQ++lMd0OZ8PT1qHqJU/M8rxCGzlfyZDZ/
 tdDyRFbOOK8072SRtWjbW+Drl51odw4OyN727VZKaaq4lYGaWzk//CggG
 6iHOdFhp26vlwP/b+du3MhlZChR7bh7KmAcjCcGQOTpWfmfTsO9bFJwKf
 XXQes8gQ844rrYht3BrMIfWexihpEkAgeL8omF55/Sq8a2TsGuvIAeex5
 7qjRTgXC4FduJSQNesjCUhLOu4MJQXuOiwBlAZbTHb68skFOfBdT1yoYm Q==;
X-CSE-ConnectionGUID: yC/imaOtTkOBRbenDip3wQ==
X-CSE-MsgGUID: OFxO9qy6T4efyTajQ07imQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="45985219"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="45985219"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 15:58:09 -0700
X-CSE-ConnectionGUID: N89xlq1TS0OOQrskTMZhQQ==
X-CSE-MsgGUID: 1ruSzUhrTA6o04oVRlcGLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; d="scan'208";a="160287813"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 15:58:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 15:58:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 15:58:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 15:58:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oadKgrU5YEFYLhhXVH+i9XePW37PofXRQm7DSvmJni+mZpfKLJBikRV/OTWrzPfxOTjFDyzo+o1+CiXTNDhUxt2M+u8Bg3U3LgK4wiPIe3pYNOCsA9aFAg/MdXnzFN+tzUw7rCIsWzJ5eijBg42yqzg8mHwExA9L7YQ7RqfaEBlPynWcI1U07gx30qhO7oLwKpcXSaqZGhwg8SKs0iPsMOT9wt55k7dA1nJ49Lv3j27fenbl/RPXHerWLTlGYLwE7MQ5AJVvdskfO1CECXB/SYgSO8OHNdyIyRhgo2gbcqM9WMWpO015jWHeZzCDpd+HUdFdKM2ixmRZpm4g1/m4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TZ/NtII0Oh1diFoIPnMbkSkHkb1vpZGza56di1FIqk=;
 b=dbAof+pb/iZC5RlB3btVJ+b0KzqhbSsPTo2jKh//LSHd8iuKpuUAen09bmLPjmvWP8fRcR/4HGjeEftc2K8O7tLr74S7iz4fbvTqRKSV5Cwh6/23r2bNa+CcTmKxd7I5PuRuWl0AJtB40jaQPlLrPnm4i+PMyQESErMiHppb8ida3fCB55lMmLvH7Ohzum9qXTlH/1TXSnSnBUe4u0WWSJvNEKyqXWBfvkvFX6SZFAndnWfYY1vsjRcTDy9j/l9apglb42keGjoczH0PkNpu8RamQXZTWZWXb6Gjcq++yfykNkbz6Fn7DeGG2QbIuu1Wmv1ZfD5clnCglQE0rwC27w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB7962.namprd11.prod.outlook.com (2603:10b6:510:245::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 22:58:05 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 22:58:05 +0000
Message-ID: <ea4eee3c-bf2a-4ea3-9f81-58e05055f2f9@intel.com>
Date: Fri, 11 Apr 2025 18:58:03 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drm/xe/guc: Add GuC log LFD format support
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250410155853.574830-1-zhanjun.dong@intel.com>
 <20250410155853.574830-4-zhanjun.dong@intel.com>
 <ac5494fa-bc3a-4f74-9eba-476153206240@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <ac5494fa-bc3a-4f74-9eba-476153206240@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB7962:EE_
X-MS-Office365-Filtering-Correlation-Id: 693ec292-973b-416e-3319-08dd794c51d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZQQTFRY2s3T1YzWEF4S1F2TU9VRjQxZ1dabEFFbHl3emQ3ckJkQmdYNDdJ?=
 =?utf-8?B?b3FiZTBsL3ozaVljWTEyYzFnenJ3b24vSVRXVkFBcmV2NmRwVEY0L0JVR3Zo?=
 =?utf-8?B?QkdUWjVOaTJ4bG5wWVdHd3dvazg5dnIzU0pNWkdOUEEwdm5tdmFFN2pEblhZ?=
 =?utf-8?B?VzZlc21PVzJYMjJXNHhmKzJkY1JvMTc5aVpKYkNZNnZacy91RjJOQXhIcnhk?=
 =?utf-8?B?bVdYekthKzMzZUducVRCRW5PWFZBVFNTWExtN2x3OHRRU0c2TCtmZUJBaGs4?=
 =?utf-8?B?MExPMThRNWdyWkNuclBPV2VXY2ZNdjdZRzBmUndiYmhOTkFGWll6akdQNnJG?=
 =?utf-8?B?OWltaEZYS2VHc0dTeWVkV2pXWjVhMVY2dVgvQXpOcndBMkIzSURVN1FaMUhj?=
 =?utf-8?B?VVJ3K2pBQzlFZ3BxRmlpUTFaQ1FwUnBIOVNSdUVGeUZJajFSb2ZXSUJMNVpi?=
 =?utf-8?B?RXdRUUpRVUVSMTVWb0V2azFwTUJ5S2xBSUVWd1EwRmc5dWNuUzdEcVRmWHdE?=
 =?utf-8?B?aEp2VWNCbnhidGFUMTE1b3MwbU5BZzhTZXZPaXVGWHZWYXBhTEJxZDJCQjFI?=
 =?utf-8?B?K2o5U01tQjVrVW41OERNdFcwemxZM2FLQytUTHFGVDYvQXRjWjE1akF6bVRY?=
 =?utf-8?B?ZnZsaWU4SWFMbkErVXhTYjdBMWxrNVFvQkpXY3BaZHZkK29ydDlPemtPNEYv?=
 =?utf-8?B?WHlyMlFHbStQVHNyd3MyS01CTkJZUlhIM2poMnczWG8wdlg5R2lNZXdYVmF0?=
 =?utf-8?B?UmR4WEk1bDFMbmptcWN3YWxyMEZiaFhpZHRFcGpQTWxNVUxBZm51cTdTandk?=
 =?utf-8?B?NFRzallrbnB4UW9odDJZeUFMNm9BdW13OS9vQVdHNUtNYnVraE43MTE2dHU2?=
 =?utf-8?B?UGxENTBhSmx5cGxrNWxCcTRHWUpIeE1KNGxmVEpNNEErMlV4ckFCQ0Z3bzY4?=
 =?utf-8?B?dU9TZVBBc2VPRVRZejAvQVZ1UGEzejUzWHBuRXljeTNUTXpuZDA4elUvYmNX?=
 =?utf-8?B?dHpUVm5GRHlpNHNDam9PUng3dk1wR3NsN2ZocVNySndCU0ZLSzI3bDNUNlBp?=
 =?utf-8?B?bHRtYTNuZmxtajJhUG82WFM4Y2U1SWwrYXl4UWtQLzFsZnYyVHp6K3drd2t3?=
 =?utf-8?B?Z3RDUk9sdnVVd09XT1ZkSjBMZTdweEIzM0QyeUViZUsxcEhVdS9RQWw2WFc0?=
 =?utf-8?B?eUtPZXROMGhkNnZXc1RXNVlGOE9RSldUNjdxWHpIbVI2aHZxS2J1N01aaG1T?=
 =?utf-8?B?YW9VUHlXcGpmME1XRmsvNUxLakpSRzBuc2J4RmFCOWhjVGMvbjRWdVVzNzBk?=
 =?utf-8?B?RHUvWGRSWEZwa0xRRG5wd1doM21SVTFNZWVVRTlmSW8yRlg0YUwyblhOaGEz?=
 =?utf-8?B?QWVWVWNsdU5NQlM2NGhwcWdrUkpIQlVmZ25ySm0xKzU2YUVkSmhveHR6N0lO?=
 =?utf-8?B?QVcrR1VMSTVkbHY1YU9ycHNiR3Axc0pjMjFLZGNORHhZdDQ0bHdmZWtYdWVT?=
 =?utf-8?B?dzh3R0pyQUZaT0ZWQTlscmZ4bGQ0WUJvMEVjN3EraXMvc3BnV3g4SStYU29I?=
 =?utf-8?B?M0J1bEE4cXNFZzZhMFZkemVmTHA0b3FyVjlZdDIzdGhEdXEwUmpvMWFxelhF?=
 =?utf-8?B?eVkrblRkRGppRHNGTDVFVGxOV2xOMDVGbVhnVHJPQ2JxeFVkZlMvTm9VaUpx?=
 =?utf-8?B?SnVEeFJrazBLRFFMUlowL24rUjdSaDdtQ1RhMGVTMVdwYXE2VzZHbklFTjhQ?=
 =?utf-8?B?aHdQMDUrV0ZyeWxQWExZNGdpT0wvaWgyL3NxREFqUk13T0tsMCtueHN6eFpV?=
 =?utf-8?B?TkpiV1cvZVg4TExycW5wUW4vY051WEJud1M5YktUeDRwK2lsT1lIcVdId0dv?=
 =?utf-8?B?bGdNMFBrQTdlOXdMSnZyZW13WW4zZ29yT3N5M0pTWXhqWjl3NjRkTDRFV25u?=
 =?utf-8?Q?Enrb9jvEip4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnhlUWY2bWc0UDJIdUhZWGdhTFE0Mzg1VUpxeGRPZFJEWGg2aHR0dDZnQnhs?=
 =?utf-8?B?ZWZVWFp5cTRudnRyQkdGMUxoa1l2RWRTb2VGZ3QvMHRUSU9ySzd4b0dQaUVK?=
 =?utf-8?B?Z01pMFk4RFpZMXp3ZThWZUZ5NnRRS1NtQ1lRUUtxU0VTai9aM0JSSzI0VFNa?=
 =?utf-8?B?bkl2bGxRL2Nrc1Mra04rNzZmRisvbXRmY1ZOWUNsU05JNEFjQmppbzZHNTBK?=
 =?utf-8?B?cW8rRXdZcWowZDBVc3ZoVnFZR3pCU1VxUWxZbXh1MkVEU2Zpa0NtMkhlNjl2?=
 =?utf-8?B?UkN3b3Ezdk1QR3BSdnZPcUJCdWFLTTBpM2VuN1pwcHF3emphZml4b2k2RFhM?=
 =?utf-8?B?UHlLM0svRUJxT0Ryb2VmUFZBeDc1QXhCQlovNS9kTzlGcDc0QmpTa3R4dnAw?=
 =?utf-8?B?N0NSOGRaVDBySXRJRS9jZ25iQ2lRWE1sT2dqekcyY0d5Z3FHaVZCQ2RPamlN?=
 =?utf-8?B?dm12a2lyeFNxWFpSRno4MkN6MmNRaUtkRU9lZHlId1p3WW1UT09ocjVIWjhS?=
 =?utf-8?B?RXp2Y2wzdU16Y1ZrZEFhazhJNW9LQkdsZi9NYUVyNGY0d2ZsbzZBTkRoN3pp?=
 =?utf-8?B?elpXT1lxcGJpenhkdWM3Ym50MlplK1pCaEFxTGVuVWhvaHlrejNnL0ZZdHpl?=
 =?utf-8?B?VUJ1TlBCdnlzMlRLT21NRzU4YXBJZmdtZGUvREdzQ3hGbWhPdTg3UUJ4VUtG?=
 =?utf-8?B?Q1FkRTNTK1QrM0IzMS91UFJPL01mNXI3a2NDamRNQnZZdFNKV2FqWWJhMnhk?=
 =?utf-8?B?VlJpQmFPNDNZY3JGSFhNQUxTMGdUUkErSVVCTVVEUW9KSGZTS0pDeklDVC9o?=
 =?utf-8?B?Nm1pNUVwVGF2NHBjanRUT2twbW9LNS85UmpIdjhIMDYraGh2MGwyL2dEekc5?=
 =?utf-8?B?YWYxZXJiL0dtUy9LYWt0d1phYjZLbkhPVE1pYU1pZ0crVDI1ZHhLRXVpaG1w?=
 =?utf-8?B?OXVkakw0QkJacVZnRWFMM3h5MTQwQ3JJTExnbWpQYllVZ2o3RXpWRWZUM01v?=
 =?utf-8?B?dUkvazFqWFE5SFluS3pBTUdKZmp3blY2eExBaWk5RDI2RlNzZFNnTzFiMXUr?=
 =?utf-8?B?UHdtdGplZjVLV2RadkxUR2hrK2I3L21OVWNoMzhvNnozTjBxVVVqcmdGNXJI?=
 =?utf-8?B?SVJUNEZ2UVRQbjlVcEo0em9yNFA2cUZwMXJ6S0VHenVJcGo5TFc0N0pwaXRt?=
 =?utf-8?B?eUVlRjU5eTZFTnpraVJScDZZQjBZRVJJaisySlNxTHp0bXFwUC9Ya3hXV0xS?=
 =?utf-8?B?cXdhSFl0eVB1Uk0wbmR5Qi9vWXpUSTRCRkZCTitPZUdYcysrRVRkY2wydUFP?=
 =?utf-8?B?TEVWRDM0ekt5U1cydUJPeDRLbVRwZG1qZlhIa3dtbzlSR1lFVG5ZVENsVjE3?=
 =?utf-8?B?MkxKRHRhb3B5N2RMVVhWajJLTnZRS2NnSHZZY0V3WGdMS3huNWRiUDNxdWVh?=
 =?utf-8?B?Z1N1MFMrc2VGOW9weVpoTzJkMXFndHRaeTVRY0RMbkFQVW5FemNJcmdjUjNW?=
 =?utf-8?B?YnF5aXQreTl0MG9wVlQ1eE9mbFVheDFrY0w1eFgvc1JXT1FJRkJ1TmZtZlhV?=
 =?utf-8?B?Y0RCZ3hMdVpDU1h5S2FUTU14bVBwbTVhajVOOTdFSmtpN2xMcitJSVJDRnBW?=
 =?utf-8?B?YWxoVEo2b1JFVWpsS0pXekhrOC8xc3FudU92QnhrNGRWaFFoUG5NVExmZS95?=
 =?utf-8?B?aGl3ZzlqOGdnazdKTlZmMGkyeVBidWZlYTE3YU80bko2Qjh4TGcxYnNoQzly?=
 =?utf-8?B?a2RYWmFJa1V5aWFMMDhyNVZaYjFNdVNNUHlZRExWTlFjWlZIdTlmWjBhblhY?=
 =?utf-8?B?ZElJS1dwd1dic1RGSERZak42eENxRkJMbDA3M3FDR0s2OE9QTjFlVDZIVXdZ?=
 =?utf-8?B?V285c09YVnVvMFRsQnhWWVRvMkVjVE8rN1Q1VHZnaVBER3hZM2tzL0pPU0ZU?=
 =?utf-8?B?L0dDUFJuWURqY0ZKVW8vdjhmL2NoUmh4MkxHK0toQ2pIaHFVdmNCOHhJSTBn?=
 =?utf-8?B?cGMyYVNiZ282em0zdHdsKzNPTDVoTExBUTdsOXdiMHVZdmxpdGVXYi91RGFr?=
 =?utf-8?B?R2t2ODUyQTRVQldFTjFtTlZJWGhucmNFZ1ZsNUEwSzRvMnJaUlJqY01UaUFX?=
 =?utf-8?Q?HTf4A9FRzbUynp6SzJzahEaR7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 693ec292-973b-416e-3319-08dd794c51d8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 22:58:05.6643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSnAXWH91N8ahbwYLEcNKm8Wo5pAe0eThSA4yuN7Y9cB9a/mGiaKUaZXptPgn+a72Gtws9OfSZgRuaMtuAIoKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7962
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

Thanks for take time to review.
Please see my inline comments below.

Regards,
Zhanjun Dong

On 2025-04-11 12:14 p.m., Michal Wajdeczko wrote:
> 
> 
> On 10.04.2025 17:58, Zhanjun Dong wrote:
>> Add support to output GuC log in LFD format.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_log.c | 344 +++++++++++++++++++++++++++++++-
>>   1 file changed, 342 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>> index df849a0ee7e5..7cdf6bf238f3 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -7,8 +7,10 @@
>>   
>>   #include <linux/fault-inject.h>
>>   
>> +#include <linux/utsname.h>
>>   #include <drm/drm_managed.h>
>>   
>> +#include "abi/guc_log_lfd_abi.h"
>>   #include "regs/xe_guc_regs.h"
>>   #include "xe_bo.h"
>>   #include "xe_devcoredump.h"
>> @@ -19,6 +21,57 @@
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>>   
>> +static struct guc_log_buffer_entry_markers {
>> +	u32 key[2];
>> +} const entry_markers[4] = {
>> +	{{
>> +		LFD_LOG_BUFFER_MARKER_1V2,
>> +		LFD_LOG_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		LFD_LOG_BUFFER_MARKER_1V2,
>> +		LFD_CRASH_DUMP_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		LFD_STATE_CAPTURE_BUFFER_MARKER_1V2,
>> +		LFD_STATE_CAPTURE_BUFFER_MARKER_2
>> +	}},
>> +	{{
>> +		GUC_LOG_INIT_CONFIG_LIC_MAGIC,
>> +		((GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MAJOR << 16)
>> +			| GUC_LOG_INIT_CONFIG_FORMAT_VERSION_MINOR)
>> +	}}
>> +};
>> +
>> +static struct guc_log_buffer_entry_list {
>> +	u32 offset;
>> +	u32 rd_ptr;
>> +	u32 wr_ptr;
>> +	u32 buf_size;
>> +} entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT];
>> +
>> +static const struct guc_logfile_lfd_t default_guc_logfile_lfd = {
>> +	.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_LFD_T_MAGIC, GUC_LOGFILE_LFD_MAGIC)
>> +};
>> +
>> +static const struct guc_logfile_t default_guc_logfile = {
>> +	.magic = LFD_DRIVER_KEY_STREAMING,
>> +	.version.dw0 = FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MINOR_VERSION,
>> +					GUC_LOG_FILE_FORMAT_VERSION_MINOR) |
>> +		       FIELD_PREP_CONST(GUC_LOGFILE_FMT_VER_T_MAJOR_VERSION,
>> +					GUC_LOG_FILE_FORMAT_VERSION_MAJOR)
>> +};
>> +
>> +struct guc_log_init_config_save_t {
> 
> don't use _t suffix
sure, to be removed>
>> +	/*
>> +	 * Array of init config KLVs.
>> +	 * Range from GUC_LOG_LIC_TYPE_FIRST to
>> +	 * GUC_LOG_LIC_TYPE_LAST
>> +	 */
>> +	u32 KLV[GUC_LOG_LIC_TYPE_LAST - GUC_LOG_LIC_TYPE_FIRST];
>> +	struct guc_log_buffer_state log_buf_state;
>> +};
>> +
>>   static struct xe_guc *
>>   log_to_guc(struct xe_guc_log *log)
>>   {
>> @@ -216,21 +269,308 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>>   	}
>>   }
>>   
>> +static int xe_guc_log_add_lfd_header(char *buf, int buf_size)
>> +{
>> +	int len;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t))
>> +		return -ENOMEM;
>> +
>> +	len = sizeof(default_guc_logfile_lfd);
>> +	memcpy(buf, &default_guc_logfile_lfd, len);
>> +
>> +	return len;
>> +}
>> +
>> +static int xe_guc_log_add_payload(char *buf, int buf_size, u32 data_len, void *data)
> 
> data likely should be const void *
> 
>> +{
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
> 
> maybe declare buf as void* so you will not need to cast it everywhere
Thanks, will do>
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
>> +		return -ENOMEM;
>> +
>> +	/* make length DW aligned */
>> +	lfd->desc_dw_size = data_len / sizeof(u32);
> 
> DIV_ROUND_UP ?
Good point, will try>
>> +	if (data_len / sizeof(u32))
>> +		lfd->desc_dw_size++;
>> +
>> +	if (lfd->data != data)
> 
> hmm, what is this for ?
Emm, will check, might not be needed.>
>> +		memcpy(lfd->data, data, data_len);
>> +
>> +	return lfd->desc_dw_size * 4;
>> +}
>> +
>> +static int xe_guc_log_add_typed_payload(char *buf, int buf_size, u32 type,
>> +					u32 data_len, void *data)
>> +{
>> +	int len;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + data_len)
>> +		return -ENOMEM;
> 
> that seems to be repeating/duplicating what's done in
> 	xe_guc_log_add_lfd_header
> and
> 	xe_guc_log_add_payload
> 
> can't we rely on above checks?
Good point, will be removed

> 
>> +
>> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
>> +	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, type);
> 
> shouldn't this be done by xe_guc_log_add_lfd_header() ?
Good point, to be changed to put type as a argument to 
xe_guc_log_add_lfd_header>
>> +	len += xe_guc_log_add_payload(buf, buf_size, data_len, data);
>> +
>> +	return len;
>> +}
>> +
>> +static int xe_guc_log_add_os_id(char *buf, int buf_size, u32 id)
>> +{
>> +	char *version;
>> +	int info_len;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +	struct guc_lfd_data_os_id_t *os_id = (struct guc_lfd_data_os_id_t *)lfd->data;
> 
> vars should be declared in reverse-xmas-tree order (if possible)
will check/reorder>
>> +
>> +	os_id->os_id = id;
>> +
>> +	version = init_utsname()->release;
>> +	info_len = strlen(version) + 1;
>> +
>> +	if (buf_size < sizeof(struct guc_logfile_lfd_t) + info_len)
>> +		return -ENOMEM;
>> +
>> +	strscpy(os_id->build_version, version, info_len);
>> +
>> +	return xe_guc_log_add_typed_payload(buf, buf_size, GUC_LFD_TYPE_OS_ID,
>> +					   info_len + sizeof(*os_id), os_id);
>> +}
>> +
>> +static int
>> +xe_guc_log_add_log_event(char *buf, int buf_size, char *log_bin,
>> +			 struct guc_log_init_config_save_t *config)
>> +{
>> +	int len;
>> +	char *data;
>> +	u32 data_len;
>> +	struct guc_lfd_data_log_events_buf_t *events_buf;
>> +	struct guc_logfile_lfd_t *lfd = (struct guc_logfile_lfd_t *)buf;
>> +	struct guc_log_buffer_entry_list *entry;
>> +
>> +	entry = &entry_list[GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG];
>> +
>> +	/* Skip empty log */
>> +	if (entry->rd_ptr == entry->wr_ptr)
>> +		return 0;
>> +
>> +	len = xe_guc_log_add_lfd_header(buf, buf_size);
>> +	if (len < 0)
>> +		return len;
>> +
>> +	buf_size -= len;
>> +	lfd = (struct guc_logfile_lfd_t *)buf;
>> +
>> +	lfd->dw0 |= FIELD_PREP(GUC_LOGFILE_LFD_T_DESC_TYPE, GUC_LFD_TYPE_LOG_EVENTS_BUFFER);
>> +	events_buf = (struct guc_lfd_data_log_events_buf_t *)&lfd->data;
>> +	events_buf->log_events_format_version = config->log_buf_state.version;
>> +
>> +	data = log_bin + entry->offset + entry->rd_ptr;
>> +	if (entry->rd_ptr < entry->wr_ptr) {
>> +		data_len = entry->wr_ptr - entry->rd_ptr;
>> +		if (data_len <= buf_size) {
>> +			memcpy(events_buf->log_format_buf, data, data_len);
>> +			buf_size -= data_len;
>> +		} else {
>> +			return -ENOMEM;
>> +		}
>> +	} else {
>> +		int cp_len;
>> +
>> +		/* Copy rd to buf end 1st */
>> +		data_len = entry->buf_size - entry->rd_ptr;
>> +		if (data_len <= buf_size) {
>> +			memcpy(events_buf->log_format_buf, data, data_len);
>> +			buf_size -= data_len;
>> +		} else {
>> +			return -ENOMEM;
>> +		}
>> +
>> +		/* Copy buf start to wr */
>> +		data = &log_bin[entry->offset];
>> +		cp_len = entry->wr_ptr;
>> +		if (cp_len <= buf_size - cp_len)
>> +			memcpy(&events_buf->log_format_buf[data_len / sizeof(u32)], data, cp_len);
>> +		else
>> +			return -ENOMEM;
>> +		data_len += cp_len;
>> +	}
>> +
>> +	/* make length DW aligned */
>> +	lfd->desc_dw_size = data_len / sizeof(u32);
>> +	if (data_len % sizeof(u32))
>> +		lfd->desc_dw_size++;
>> +
>> +	/* Addup log_events_format_version size */
>> +	lfd->desc_dw_size++;
>> +
>> +	return len + lfd->desc_dw_size * sizeof(u32);
>> +}
>> +
>> +static inline int lic_type_to_KLV_index(u32 lic_type)
>> +{
>> +	XE_WARN_ON(lic_type < GUC_LOG_LIC_TYPE_FIRST || lic_type >= GUC_LOG_LIC_TYPE_LAST);
>> +
>> +	return lic_type - GUC_LOG_LIC_TYPE_FIRST;
>> +}
>> +
>> +static int xe_guc_log_add_klv(char *buf, int size, u32 lic_type,
>> +			      struct guc_log_init_config_save_t *config)
>> +{
>> +	/* LFD type must matches LIC type */
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_FW_VERSION != (int)GUC_LOG_LIC_TYPE_GUC_SW_VERSION);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GUC_DEVICE_ID != (int)GUC_LOG_LIC_TYPE_GUC_DEVICE_ID);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_TSC_FREQUENCY != (int)GUC_LOG_LIC_TYPE_TSC_FREQUENCY);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_GMD_ID != (int)GUC_LOG_LIC_TYPE_GMD_ID);
>> +	BUILD_BUG_ON((int)GUC_LFD_TYPE_BUILD_PLATFORM_ID !=
>> +		     (int)GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID);
> 
> maybe this could be moved to abi headers, as it doesn't seem to be
> related to the implementation itself (both sides are ABI defs)
Sounds good>
>> +
>> +	return xe_guc_log_add_typed_payload(buf, size, lic_type, sizeof(u32),
>> +				 &config->KLV[lic_type_to_KLV_index(lic_type)]);
>> +}
>> +
>> +static void xe_guc_log_loop_log_init(struct guc_log_init_config_t *init,
>> +				     struct guc_log_init_config_save_t *config)
>> +{
>> +	int i;
>> +	struct guc_klv_generic_t *p = (struct guc_klv_generic_t *)init->lic_data;
>> +
>> +	for (i = 0; i < init->lic_dw_size;) {
>> +		if (p->key < GUC_LOG_LIC_TYPE_GUC_SW_VERSION || p->key >= GUC_LOG_LIC_TYPE_LAST)
>> +			break;
>> +		config->KLV[lic_type_to_KLV_index(p->key)] = p->value[0];
>> +		i += p->length + 1; /* +1DW to include kev(u16) and len(u16) */
>> +		p = (struct guc_klv_generic_t *)((u32 *)p + p->length + 1);
>> +	}
>> +}
>> +
>> +static void xe_guc_log_load_log_buffer(u32 *guc_log, struct guc_log_init_config_save_t *config)
>> +{
>> +	int i = 0;
>> +	u32 offset = GUC_LOG_BUFFER_STATE_HEADER_LENGTH;
>> +	struct guc_log_buffer_state *p = (struct guc_log_buffer_state *)guc_log;
>> +
>> +	memset(entry_list, 0, sizeof(entry_list));
>> +	while (p) {
>> +		for (i = 0; i < GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT; i++) {
>> +			if (p->marker[0] == entry_markers[i].key[0] &&
>> +			    p->marker[1] == entry_markers[i].key[1]) {
>> +				entry_list[i].offset = offset;
>> +				entry_list[i].rd_ptr = p->read_ptr;
>> +				entry_list[i].wr_ptr = p->write_ptr;
>> +				entry_list[i].buf_size = p->size;
> 
> you can't use/modify static entry_list[] as could be accessed by several
> driver instances at the same time!
Good point, this seems to be a bug. To be fixed.>
>> +
>> +				if (i == GUC_LOG_BUFFER_STATE_HEADER_ENTRY_LOG)
>> +					config->log_buf_state = *p;
>> +
>> +				if (i != GUC_LOG_BUFFER_STATE_HEADER_ENTRY_INIT) {
>> +					offset += p->size;
>> +					p++;
>> +				} else {
>> +					/* Load log init config */
>> +					xe_guc_log_loop_log_init((struct guc_log_init_config_t *)p,
>> +								 config);
>> +
>> +					/* Init config is the last */
>> +					return;
>> +				}
>> +			}
>> +		}
>> +		if (i >= GUC_LOG_BUFFER_STATE_HEADER_ENTRY_COUNT)
>> +			break;
>> +	}
>> +}
>> +
>> +static int xe_guc_log_save_to_lfd_buf(char *buf, int size, u32 *guc_log_bin,
>> +				      struct xe_guc_log *log,
>> +				      struct guc_log_init_config_save_t *config)
>> +{
>> +	int index = 0, len = 0;
>> +	char *char_bin = (char *)guc_log_bin;
>> +	struct guc_logfile_t *guc_logfile;
>> +
>> +	if (size < sizeof(struct guc_logfile_t))
>> +		return -ENOMEM;
>> +
>> +	guc_logfile = (struct guc_logfile_t *)buf;
>> +	*guc_logfile = default_guc_logfile;
>> +	index = offsetof(struct guc_logfile_t, lfd_stream);
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_FW_VERSION, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_GUC_DEVICE_ID, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LFD_TYPE_TSC_FREQUENCY, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_GMD_ID, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_klv(&buf[index], size - index, GUC_LOG_LIC_TYPE_BUILD_PLATFORM_ID,
>> +				 config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_os_id(&buf[index], size - index, GUC_LFD_OS_TYPE_OSID_LIN);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	len = xe_guc_log_add_log_event(&buf[index], size - index, char_bin, config);
>> +	if (len < 0)
>> +		return len;
>> +	index += len;
>> +
>> +	return index;
>> +}
>> +
>>   static void
>>   xe_guc_log_snapshot_print_lfd(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
>>   			      struct xe_guc_log *log)
>>   {
>>   	size_t remain;
>>   	int i;
>> +	struct guc_log_init_config_save_t init_config;
>>   
>>   	if (!snapshot)
>>   		return;
>>   
>>   	remain = snapshot->size;
>> +	if (!remain)
>> +		return;
>> +
>> +	drm_printf(p, "Kernel timestamp: 0x%08llX [%llu]\n", snapshot->ktime, snapshot->ktime);
>> +	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>> +	drm_printf(p, "Log level: %u\n", snapshot->level);
> 
> what's the point in printing above in clear text and encode rest of the
> info in binary LFD printed as ascii85?
Timestamp related GuC spec change review is in progress, before review 
finished, print out here is for debug purpose and will be removed once 
spec review finished.

The log level is a readable info to let user know the log level setting 
quickly. If they are looking for level 5 details but got 3 here, no need 
to dig into data, they need to redo test in level 5 again.

> 
> I would expect that lfd function prints lfd-only stuff
 > >> +
>>   	for (i = 0; i < snapshot->num_chunks; i++) {
>> +		int len = 0;
>>   		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
>> -
>> -		/* To be add: Output snapshot in LFD format */
>> +		const char *prefix = i ? NULL : "[LOG].data";
>> +		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
>> +		char *lfd_buf = kzalloc(size, GFP_KERNEL);
>> +
>> +		/* load from log bin */
>> +		xe_guc_log_load_log_buffer(snapshot->copy[i], &init_config);
>> +		/* Output to LFD format */
>> +		len = xe_guc_log_save_to_lfd_buf(lfd_buf, size, snapshot->copy[i], log,
>> +						 &init_config);
>> +		if (len > 0)
>> +			xe_print_blob_ascii85(p, prefix, suffix, lfd_buf, 0, (size_t)len);
>> +
>> +		kfree(lfd_buf);
>> +		XE_WARN_ON(len <= 0);
> 
> what's the value of this XE_WARN ?
Emm, seem only for out of memory, but no need for XE_WARN.
To be removed.>
>>   
>>   		remain -= size;
>>   	}
> 

