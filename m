Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4B4C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 20:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7F610E041;
	Wed, 23 Jul 2025 20:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RG+7p+Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21DB310E041
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753303573; x=1784839573;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fDm6OnpqR+XLlV9mfnH+hH6OKZRJI/QMc5G1/SQmbNs=;
 b=RG+7p+PhSKmWhBSOf5m1T5t0ANeaPAeaD5nrp1HupU52SCMLsyDvvvbz
 6O+W8WB8zEZuMpPK3V4ZDCTvlMmvxy4kKcwbLRVsnsJMBas5X+nzxYzS7
 9rFpTWEwJ1uLY9J0tNtci3N0bEsO1zLswxOvF5QMFRxEV7noJzIcXIG2t
 7zMz7EdYqqSf7xsymDFPtIqqGhh2PsKpeznZVZTqIYasFH5C1iJll2+2y
 biA17Htj3rXjELW5cn8CFABvlXtVRvQLBGgohaOGvtQX+WEMBASSAG0fN
 w6dvt/33fBExrrGaG4Mt3Uvb9aXy6OnDupeF7yrsWmU38WmpeOpElJ0nF Q==;
X-CSE-ConnectionGUID: hXNxvA60Qhqnv8FAYjszZQ==
X-CSE-MsgGUID: FHAUaCc/Qz+vmsnZZZjdZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55561028"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="55561028"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:46:12 -0700
X-CSE-ConnectionGUID: UFpbPIOdS5ayMky1q7wrjw==
X-CSE-MsgGUID: zIv3ixLUQ9WHry4kxb6jKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; d="scan'208";a="160457017"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 13:46:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 13:46:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 13:46:11 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.83) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 13:46:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZAFZMu7vNDau60dCYWlepnxoFWHHZS1eaTA3VCYS3hjdp3SIx7FJsTIhcQO1cBatY7DEu5eScVLBE22bAoeEwFIvVaBezJMD686lPj7W0FfvLk4EYxpKIFgVz6YA2YYmJWq7c31xlwOSurG8cDRj5cKoKZ+D8Nlz74/C7qd2X5pbtZAPLD0aw4tNeVP+BO/s0PXCesewbO5YVG8xCJLzG1/UklU8zjAbSo7KB8gXwQJa3Ds8MfrCWnk8oo/Dfw9bEpp5jelctNJhCFu/2iDXVdrZEs5ZFgmS2VBDN1rEQgqQ5PsiaF5+sFjWopYG4LTvCGzUiEU85rQWoiIaJV7W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PaHumUC9wl63Z3RItIosQqw6ZMZptw97SsgQrceDP1Q=;
 b=VXgbwDQ49ZVCsoqcYRWAjk27fIGUGy+Fg9Bjq70rDuWvO1hZ2LGU6nQ3UcBMM9BheqjwjSEdmYXx3v3zURxI6F4FmufHP8Dqz5IH1XKeYAg+W0RFDM08/4F+7ttgLvZ2/ZNNb7/32TMfombQAsdi0A2q9w3r4UDJNB11hXOS2YKRNp1an8nR/PdACDDAPYAARkfey0qXbgykrFt6fMpp1pkzETWRUboeox7Nv1Q60mwdF7GFCwqqv5uKTnpwiy5Cppo6KaYHGwlxcphrLsQnxSd/tZTtrQf+o2Bd1OOprifdRfWABtYcw8CWO5fPuRg3U+XHHYn7ddY7rWV5z4Qo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 20:46:09 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 20:46:09 +0000
Date: Wed, 23 Jul 2025 13:47:57 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Kassabri, Farah" <farah.kassabri@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>
Subject: Re: [PATCH 5/5] drm/xe: Split TLB invalidation code in frontend and
 backend
Message-ID: <aIFKfcST9legrQiO@lstrano-desk.jf.intel.com>
References: <20250723182222.48423-1-stuart.summers@intel.com>
 <20250723182222.48423-6-stuart.summers@intel.com>
 <aIE1XbbGohxwvI5F@lstrano-desk.jf.intel.com>
 <aIFDe7w41uKnayGO@lstrano-desk.jf.intel.com>
 <dafc298f5f296f6d653f526fa58592aacd482caa.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dafc298f5f296f6d653f526fa58592aacd482caa.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: d249deb4-10ba-46eb-82a4-08ddca29f413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1FnejhtUFZ1azJRVHBWZi9pOEt1cGVXdkNTVkdXQXFKUzZlTzBkMmZuZ3lT?=
 =?utf-8?B?Y2dFU1RrUVQ1Q2lWRGFXQUU2MmpxZjdXTkVuQTlWVXdXSUFFeXY3MHR3VFU0?=
 =?utf-8?B?OS9idVdIenVkaytMYTVlR2dtbjFSblFFNTBkL255WWQyZmJPOHFNWUFwejFD?=
 =?utf-8?B?SDQ2VXJwKy9EY1hsb29MYlhabzRWMGxvbGdNZmpJTkxxbkJDM2dyd3pOKzFG?=
 =?utf-8?B?MWZsdFZ6a0Q1TXQzRnAxVmZHaS9Ha290Wk10MFdRaEdYSThJM0ttWWdZeTIv?=
 =?utf-8?B?VGwrcTdDWEZacGIyMzkzeGIyQk5WZkZxS3ZGZGVucmsyR0xlSE9PbVQ0Z2FT?=
 =?utf-8?B?c3JueVh3V0g3RUdqWkVkYnRnUXBPQXVCNC9rV2w2bVV1d0xwaTRhVGNaT2M1?=
 =?utf-8?B?K0UwWUNHbU1HMVc3dWZxL1JaYVI5M3Zra3B6NEREOWFLcUcxWDVTWjM2WjdR?=
 =?utf-8?B?UDUzeFRIMGY2blZucXFJZ1k2OUxCVEx3bnJCa2FVSlZ6U1cwSmVuTzhLamJx?=
 =?utf-8?B?M1c5L29YQUc2Zy9VMkFsTjc1V08ya0lnYnBRN2dNaUR0S05IT2s1U2EyRWFa?=
 =?utf-8?B?aHBYaklvQnduY0UzZFdUM3A2VW9WRnZiUHVNajJTdkZpUjhZTFBRMWFOeVBD?=
 =?utf-8?B?cG1PTE9sYnVaVUdBbGJCY1FJcGI3Yms2cHAvVjE0TyswZ05ORFlyYjZUNlJz?=
 =?utf-8?B?VXJQN1lIb2sxL0JqV1pJQjVpK09kSS8xSVY3M2dWaDVTRGJGaXlOT3VscXUz?=
 =?utf-8?B?ZnZiU0JaNDRJUHdhS1Y2VkRrdTZSUTRyeUc3ZkdZdnNwMDJFbE1wYXRVbk44?=
 =?utf-8?B?TEU1OU4wYlF2WE1zNzFSSUtGc1JRZDdEcEVLbjVzTE5vTnUzdklPZ2pxTlZp?=
 =?utf-8?B?ZDlDV0xuRW9NWjRQTlJIc3VoZDVNejk2NkhicHZRVjVaVWY5RG9DZkxzUFhB?=
 =?utf-8?B?UlNYcHNyWmJUbjVJKzNibmQxRDZDUm5nd1R3dG5DR0dhNnBJRVU3NjlNWEpo?=
 =?utf-8?B?L01zUytmbU94YUhqcEpmT0ZXeFJFWTZmS0t5TDBmajRKWEI1Q0wyTXdXUzlu?=
 =?utf-8?B?ejl1dFFMbkdyaWR0S3loNWNVYXRmTFA5dFhvY1hjUUFSZW1kQS93VC9nL2E0?=
 =?utf-8?B?SWlySFdxS1ZxeGxEaU4xKzlMQUdlYUF1K0VFUmFqclJWZTZLWDFXODNjcHRz?=
 =?utf-8?B?YUtvS0hzcDJJdGs4cmVNd1Fxb1JGT1VrM2VpUHNZM1g4TFNTNEVkbS9haGlz?=
 =?utf-8?B?ckRZR2RzK3FGNGk2RW42ZnhGMklzU1AwRzkySmNLOXQzMi84YnRnaHduQ3F5?=
 =?utf-8?B?Z2c2cm41bnRvcDNmNExxbjdIWDNaY1hsUzJ0eHNDNEpJbk5jRmhpcUMxK2hm?=
 =?utf-8?B?UWVESDBMSm1GdWtkZ3BCM3NsR0RWeEx6c1dqTk5NM1NSY0JMRjRkNFByYzJ5?=
 =?utf-8?B?VFZLSFgrNWptU3RId0tzTFM1WnVzYmdtakZoWE05cUZFK2RxOVpybHoxTVo2?=
 =?utf-8?B?L3lVKzhsdUlaWWNpblVBbWMxdGhYTTVGQ21OVE1xajBkVWJrQTNZSzFCRVhV?=
 =?utf-8?B?OUZVRmRmZVNyVER4QUR4dlBzai8xRmw0RjhwTWpIYk9CRFEyNmk1RmxNOVFn?=
 =?utf-8?B?aW1ON2JpV2pxQTVtMjFUU2xQdEhCclFoME5ROC9XbWNiUnpaaHFDQ0RYRWli?=
 =?utf-8?B?TXBTYW9ueG1PSjJhNjc1S2NULzhPcjRFNFUrNGtwSkgwYUcrV1lNWDF2anky?=
 =?utf-8?B?OFRtVmJ2TDJxZ3kxNFR5aCs3eDZYR3pnc1dCazQwWlkrcHdpVTREWmxPTVpn?=
 =?utf-8?B?ZDlSa2hjazE3RnlYbE5pcm8vamhnQzhiZUUyeFNQSksvNmlPSjdXa2I5M0tr?=
 =?utf-8?B?TXIycVR2YUdyS09ZRVhuRUkxUSt3QjIyZm9yVmV5Wkd0dEF4L0pwbDJjQ1dp?=
 =?utf-8?Q?LaOeDAmDlPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDQ4eTdDUVN2QTJqTVpCYTd3c2dsTjBpcTI3TkQxVGZGcmRPbXMzbkVEaE1B?=
 =?utf-8?B?dFpVaEZCQlB4YzR4K3pkakd5UlpsYldYV1RnRGZHTUw5S25HQjFYdWNON1Fs?=
 =?utf-8?B?bFFNdG81KzVBRkZ2c3R3alJpQ2NmNWRORy80R25sdXpxMS94ZUkveG5GbGVB?=
 =?utf-8?B?OWsybUhUSlZtS0VRVU1DV3VZbjgzcEFDK3o5eC9KekhFQ2RaVy90SllNRDNX?=
 =?utf-8?B?dzhjejVYUlNkY1NKRFNsODV1cUI2ZWxKaXZRMURLVXQrYTlBZVNaZTVBYWlk?=
 =?utf-8?B?S2c1djNpMjc1ME5LSzh3ZnFZWmhUaWxiNmRUbUlra3kzdGdMRDQxeFFFL3B6?=
 =?utf-8?B?dDZKNjE4RFF4cXo5VzFkYzZ1bXdwZjlFSUFIeU5ZWDB2ZmNpa3Zxcyt6YjFm?=
 =?utf-8?B?ZDFJeDJnejNuaFBua3k2a3VvWS8ySC81WGJ2QmtmRjRsOUVrWElHQ3k0N1ZL?=
 =?utf-8?B?WE92OXFnejl1R2V4YkpDWWszRzFIV0pSU2ZaZHRUM1FSQkNCRkJpVnJHTDJa?=
 =?utf-8?B?THh6ci9jR044dXJtTXNsejdVU0ltV1ArZmFFZFpPUFg0eDM3WDB0ZFlvdzB6?=
 =?utf-8?B?TzdINVpNZ2lxeStNa3kxUVVZYUZNTDJQUzc2WTU2Q2IyODVsTE1yQVYzelpJ?=
 =?utf-8?B?QTNFc1UrSkhlRmxycks5Qm1URWdUM0lXaFNIUGROWEU0elU0ZlhTWEUxYXFV?=
 =?utf-8?B?L0xwUDdLVzMyQTRKZVh1Nk1rK1Nyc0p2eG1zTG9XUDFCNU1LQXUwVjhuRGVw?=
 =?utf-8?B?dTB5OXFJbTNwemJaRnVoRFdCc3k4TTh0WTZRb3Nmc3gxV1F1ODV1Ny9KZVoz?=
 =?utf-8?B?dXpGWUFZaW1GTkllaGhhWVd6dWVUQ2l4MWxQUTI0YmNJRHpZakxGUDZMNWVa?=
 =?utf-8?B?c3pESmVkTGxiUU1VNUJpY0wzVXQxWWhUbGd4UVpZSWdRV2UyUDhhUEtzQzMx?=
 =?utf-8?B?cjFVazFDamtyRnJEM1Y0c1VVMnpxL2RSaHUvYkNSS1hHajhTS0djUDc2OFZN?=
 =?utf-8?B?STYzY1hUYk9DeW5TTFhDZkdIcmdnczF5eGlGd1JDSUZKc1Y5anlzc1hzdEZh?=
 =?utf-8?B?cy80dHA2TUh5VzhqWDFWTzZPTy9RYkl2U3Z5d1ZrZW03dUpVcnJkV3BnZU9i?=
 =?utf-8?B?MjJMRHlDbFZzQWNqMVd2OHkweHJyTkxNOU5CNVN3MEZVQ1pPd3RaNG45emlw?=
 =?utf-8?B?NTQ5c2N4dVlvM0kzVkN5TksrSW5tMXhxcHlDbm5mTTZHTndrMGFsdUV5Rmp6?=
 =?utf-8?B?bnFkc0xtOHdMSjN1RkNWSUZ2TVVaNzVyUFN5czVTNVJTYnhkM0UyVWozMVZB?=
 =?utf-8?B?VEFjdGJVSXV2b1dzN0hXUDNXYW5PTysxcUJ2dGRkSlBYZU04TjFPTTU1Nysw?=
 =?utf-8?B?L2tyRi92dXlnWTM4TG9XY09TYmdtMDZZUEcvbXIzWEkwSWVkQmJadXdWckJI?=
 =?utf-8?B?MkxTK3I3eUZTd3RKVlRQYmd3RXc4U1BTcjEvN3oyaDQvWlZXQzd5czVGZ2lk?=
 =?utf-8?B?MjJqbSt1VW5mRXVrQ0JpbytBRFYxbi9sc1RoMTNoWW95c0RDdzF4WjhUeFBx?=
 =?utf-8?B?NnVuL0NJVVE3cGNyWHcvOVF5N3RUdndjamRRTENNK25UZnlERWJlSmovY3RQ?=
 =?utf-8?B?alRkVVprNjExQzBjMzRlWnFGcEJZVWh5aGJkVkFkR2tTMFlDdUZTS29LSks2?=
 =?utf-8?B?WVRwWHNNNVQ5cFlYQkNDZ0VoZWQ4RnJ0NXR3aWZybXBVR3dSUU1qYWdLUVlt?=
 =?utf-8?B?dHhNQVI1ejdQNlN4eXlMUTNQVEtyZDBTaEtNbHc4RUErVTVMK1Rnekk4MVVW?=
 =?utf-8?B?M3hkUFYxTzZ2Nkp3WjFaVFNiYmJOM2VMRmd5ZGJLdTB2RU1Qc3BjUWlVSnVO?=
 =?utf-8?B?YVZnZVFIS0JXRW40STRBaEY1clhpUnhqSWoyUktzYXVHSnM4NGtDT2RtM0hZ?=
 =?utf-8?B?NEJIL2hsTmIyQjdlRkFZemRBSFVUV0s2TjRtdVZVbUFOVXlpU25JdHAzaUwv?=
 =?utf-8?B?N3Vxd0Rid1g1SUpzMmliOXY5UThDUzk1SWFtQUpVQjNzdVlNbzVTWnU0aUZT?=
 =?utf-8?B?MmpHY3AvS0tIcmFyaDlNeTB6YjQ5dW5CaDlMNUl0cWgxODA4VXhmT25QanR6?=
 =?utf-8?B?ZnE3MGFxWVV3OEptczBKYUJCVkVXa0xvTmNIVWpBTFNONFozWEpZWW9sSit2?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d249deb4-10ba-46eb-82a4-08ddca29f413
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 20:46:09.5736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GL2I4VNJ8n1JGdV1LOmkuFWNQq5/4o/OsLK5YK29jJwDg0LWVf0EIQMXrxi56A8txp0EptQpiIAZzoMkkmthg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

On Wed, Jul 23, 2025 at 02:20:31PM -0600, Summers, Stuart wrote:
> On Wed, 2025-07-23 at 13:18 -0700, Matthew Brost wrote:
> > On Wed, Jul 23, 2025 at 12:17:49PM -0700, Matthew Brost wrote:
> > > On Wed, Jul 23, 2025 at 06:22:22PM +0000, stuartsummers wrote:
> > > > From: Matthew Brost <matthew.brost@intel.com>
> > > > 
> > > > The frontend exposes an API to the driver to send invalidations,
> > > > handles
> > > > sequence number assignment, synchronization (fences), and
> > > > provides a
> > > > timeout mechanism. The backend issues the actual invalidation to
> > > > the
> > > > hardware (or firmware).
> > > > 
> > > > The new layering easily allows issuing TLB invalidations to
> > > > different
> > > > hardware or firmware interfaces.
> > > > 
> > > > Normalize some naming while here too.
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile             |   1 +
> > > >  drivers/gpu/drm/xe/xe_guc_ct.c          |   2 +-
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 263 +++++++++++++
> > > >  drivers/gpu/drm/xe/xe_guc_tlb_inval.h   |  19 +
> > > >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 495 +++++++-----------
> > > > ------
> > > >  drivers/gpu/drm/xe/xe_tlb_inval.h       |  14 +-
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  77 +++-
> > > >  7 files changed, 505 insertions(+), 366 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_guc_tlb_inval.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > b/drivers/gpu/drm/xe/Makefile
> > > > index 332b2057cc00..8a2f836b3ab2 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -75,6 +75,7 @@ xe-y += xe_bb.o \
> > > >         xe_guc_log.o \
> > > >         xe_guc_pc.o \
> > > >         xe_guc_submit.o \
> > > > +       xe_guc_tlb_inval.o \
> > > >         xe_heci_gsc.o \
> > > >         xe_huc.o \
> > > >         xe_hw_engine.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > index 2ef86c0ae8b4..90ebda5b3790 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > @@ -30,9 +30,9 @@
> > > >  #include "xe_guc_log.h"
> > > >  #include "xe_guc_relay.h"
> > > >  #include "xe_guc_submit.h"
> > > > +#include "xe_guc_tlb_inval.h"
> > > >  #include "xe_map.h"
> > > >  #include "xe_pm.h"
> > > > -#include "xe_tlb_inval.h"
> > > >  #include "xe_trace_guc.h"
> > > >  
> > > >  static void receive_g2h(struct xe_guc_ct *ct);
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > new file mode 100644
> > > > index 000000000000..27d7dc938cb1
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > > > @@ -0,0 +1,263 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "abi/guc_actions_abi.h"
> > > > +
> > > > +#include "xe_device.h"
> > > > +#include "xe_gt_stats.h"
> > > > +#include "xe_gt_types.h"
> > > > +#include "xe_guc.h"
> > > > +#include "xe_guc_ct.h"
> > > > +#include "xe_guc_tlb_inval.h"
> > > > +#include "xe_force_wake.h"
> > > > +#include "xe_mmio.h"
> > > > +#include "xe_tlb_inval.h"
> > > > +
> > > > +#include "regs/xe_guc_regs.h"
> > > > +
> > > > +/*
> > > > + * XXX: The seqno algorithm relies on TLB invalidation being
> > > > processed in order
> > > > + * which they currently are by the GuC, if that changes the
> > > > algorithm will need
> > > > + * to be updated.
> > > > + */
> > > > +
> > > > +static int send_tlb_inval(struct xe_guc *guc, const u32 *action,
> > > > int len)
> > > > +{
> > > > +       struct xe_gt *gt = guc_to_gt(guc);
> > > > +
> > > > +       lockdep_assert_held(&guc->ct.lock);
> > > > +       xe_gt_assert(gt, action[1]);    /* Seqno */
> > > > +
> > > > +       xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> > > > +       return xe_guc_ct_send(&guc->ct, action, len,
> > > > +                             G2H_LEN_DW_TLB_INVALIDATE, 1);
> > > 
> > > As written, you’d need xe_guc_ct_send_locked here—but you actually
> > > don’t. More on that below.
> > > 
> > > > +}
> > > > +
> > > > +#define MAKE_INVAL_OP(type)    ((type <<
> > > > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > > > +               XE_GUC_TLB_INVAL_MODE_HEAVY <<
> > > > XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > > > +               XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > > > +
> > > > +static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > u32 seqno)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       u32 action[] = {
> > > > +               XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> > > > +               seqno,
> > > > +               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > +       };
> > > > +
> > > > +       return send_tlb_inval(guc, action, ARRAY_SIZE(action));
> > > > +}
> > > > +
> > > > +static int send_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval,
> > > > u32 seqno)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_gt *gt = guc_to_gt(guc);
> > > > +       struct xe_device *xe = guc_to_xe(guc);
> > > > +
> > > > +       lockdep_assert_held(&guc->ct.lock);
> > > > +
> > > > +       /*
> > > > +        * Returning -ECANCELED in this function is squashed at
> > > > the caller and
> > > > +        * signals waiters.
> > > > +        */
> > > > +
> > > > +       if (xe_guc_ct_enabled(&guc->ct) && guc-
> > > > >submission_state.enabled) {
> > > > +               u32 action[] = {
> > > > +                       XE_GUC_ACTION_TLB_INVALIDATION,
> > > > +                       seqno,
> > > > +                       MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > > > +               };
> > > > +
> > > > +               return send_tlb_inval(guc, action,
> > > > ARRAY_SIZE(action));
> > > > +       } else if (xe_device_uc_enabled(xe) &&
> > > > !xe_device_wedged(xe)) {
> > > > +               struct xe_mmio *mmio = &gt->mmio;
> > > > +               unsigned int fw_ref;
> > > > +
> > > > +               if (IS_SRIOV_VF(xe))
> > > > +                       return -ECANCELED;
> > > > +
> > > > +               fw_ref = xe_force_wake_get(gt_to_fw(gt),
> > > > XE_FW_GT);
> > > > +               if (xe->info.platform == XE_PVC ||
> > > > GRAPHICS_VER(xe) >= 20) {
> > > > +                       xe_mmio_write32(mmio,
> > > > PVC_GUC_TLB_INV_DESC1,
> > > > +                                       PVC_GUC_TLB_INV_DESC1_INV
> > > > ALIDATE);
> > > > +                       xe_mmio_write32(mmio,
> > > > PVC_GUC_TLB_INV_DESC0,
> > > > +                                       PVC_GUC_TLB_INV_DESC0_VAL
> > > > ID);
> > > > +               } else {
> > > > +                       xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> > > > +                                       GUC_TLB_INV_CR_INVALIDATE
> > > > );
> > > > +               }
> > > > +               xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > +       }
> > > > +
> > > > +       return -ECANCELED;
> > > > +}
> > > > +
> > > > +/*
> > > > + * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > > > + * Note that roundup_pow_of_two() operates on unsigned long,
> > > > + * not on u64.
> > > > + */
> > > > +#define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > > > (rounddown_pow_of_two(ULONG_MAX))
> > > > +
> > > > +static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval,
> > > > u32 seqno,
> > > > +                               u64 start, u64 end, u32 asid)
> > > > +{
> > > > +#define MAX_TLB_INVALIDATION_LEN       7
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +       struct xe_gt *gt = guc_to_gt(guc);
> > > > +       u32 action[MAX_TLB_INVALIDATION_LEN];
> > > > +       u64 length = end - start;
> > > > +       int len = 0;
> > > > +
> > > > +       lockdep_assert_held(&guc->ct.lock);
> > > > +
> > > > +       if (guc_to_xe(guc)->info.force_execlist)
> > > > +               return -ECANCELED;
> > > > +
> > > > +       action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > > +       action[len++] = seqno;
> > > > +       if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > +           length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> > > > +               action[len++] =
> > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > > > +       } else {
> > > > +               u64 orig_start = start;
> > > > +               u64 align;
> > > > +
> > > > +               if (length < SZ_4K)
> > > > +                       length = SZ_4K;
> > > > +
> > > > +               /*
> > > > +                * We need to invalidate a higher granularity if
> > > > start address
> > > > +                * is not aligned to length. When start is not
> > > > aligned with
> > > > +                * length we need to find the length large enough
> > > > to create an
> > > > +                * address mask covering the required range.
> > > > +                */
> > > > +               align = roundup_pow_of_two(length);
> > > > +               start = ALIGN_DOWN(start, align);
> > > > +               end = ALIGN(end, align);
> > > > +               length = align;
> > > > +               while (start + length < end) {
> > > > +                       length <<= 1;
> > > > +                       start = ALIGN_DOWN(orig_start, length);
> > > > +               }
> > > > +
> > > > +               /*
> > > > +                * Minimum invalidation size for a 2MB page that
> > > > the hardware
> > > > +                * expects is 16MB
> > > > +                */
> > > > +               if (length >= SZ_2M) {
> > > > +                       length = max_t(u64, SZ_16M, length);
> > > > +                       start = ALIGN_DOWN(orig_start, length);
> > > > +               }
> > > > +
> > > > +               xe_gt_assert(gt, length >= SZ_4K);
> > > > +               xe_gt_assert(gt, is_power_of_2(length));
> > > > +               xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M)
> > > > - 1,
> > > > +                                                   ilog2(SZ_2M)
> > > > + 1)));
> > > > +               xe_gt_assert(gt, IS_ALIGNED(start, length));
> > > > +
> > > > +               action[len++] =
> > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > > > +               action[len++] = asid;
> > > > +               action[len++] = lower_32_bits(start);
> > > > +               action[len++] = upper_32_bits(start);
> > > > +               action[len++] = ilog2(length) - ilog2(SZ_4K);
> > > > +       }
> > > > +
> > > > +       xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> > > > +
> > > > +       return send_tlb_inval(guc, action, len);
> > > > +}
> > > > +
> > > > +static bool tlb_inval_initialized(struct xe_tlb_inval
> > > > *tlb_inval)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +
> > > > +       return xe_guc_ct_initialized(&guc->ct);
> > > > +}
> > > > +
> > > > +static void tlb_inval_flush(struct xe_tlb_inval *tlb_inval)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +
> > > > +       LNL_FLUSH_WORK(&guc->ct.g2h_worker);
> > > > +}
> > > > +
> > > > +static long tlb_inval_timeout_delay(struct xe_tlb_inval
> > > > *tlb_inval)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +
> > > > +       /* this reflects what HW/GuC needs to process TLB inv
> > > > request */
> > > > +       const long hw_tlb_timeout = HZ / 4;
> > > > +
> > > > +       /* this estimates actual delay caused by the CTB
> > > > transport */
> > > > +       long delay = xe_guc_ct_queue_proc_time_jiffies(&guc->ct);
> > > > +
> > > > +       return hw_tlb_timeout + 2 * delay;
> > > > +}
> > > > +
> > > > +static void tlb_inval_lock(struct xe_tlb_inval *tlb_inval)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +
> > > > +       mutex_lock(&guc->ct.lock);
> > > > +}
> > > > +
> > > > +static void tlb_inval_unlock(struct xe_tlb_inval *tlb_inval)
> > > > +{
> > > > +       struct xe_guc *guc = tlb_inval->private;
> > > > +
> > > > +       mutex_unlock(&guc->ct.lock);
> > > > +}
> > > > +
> > > > +static const struct xe_tlb_inval_ops guc_tlb_inval_ops = {
> > > > +       .all = send_tlb_inval_all,
> > > > +       .ggtt = send_tlb_inval_ggtt,
> > > > +       .ppgtt = send_tlb_inval_ppgtt,
> > > > +       .initialized = tlb_inval_initialized,
> > > > +       .flush = tlb_inval_flush,
> > > > +       .timeout_delay = tlb_inval_timeout_delay,
> > > > +       .lock = tlb_inval_lock,
> > > > +       .unlock = tlb_inval_unlock,
> > > > +};
> > > > +
> > > > +/**
> > > > + * xe_guc_tlb_inval_init_early() - Init GuC TLB invalidation
> > > > early
> > > > + * @guc: GuC object
> > > > + * @tlb_inval: TLB invalidation client
> > > > + *
> > > > + * Inititialize GuC TLB invalidation by setting back pointer in
> > > > TLB invalidation
> > > > + * client to the GuC and setting GuC backend ops.
> > > > + */
> > > > +void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> > > > +                                struct xe_tlb_inval *tlb_inval)
> > > > +{
> > > > +       tlb_inval->private = guc;
> > > > +       tlb_inval->ops = &guc_tlb_inval_ops;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_guc_tlb_inval_done_handler() - TLB invalidation done
> > > > handler
> > > > + * @guc: guc
> > > > + * @msg: message indicating TLB invalidation done
> > > > + * @len: length of message
> > > > + *
> > > > + * Parse seqno of TLB invalidation, wake any waiters for seqno,
> > > > and signal any
> > > > + * invalidation fences for seqno. Algorithm for this depends on
> > > > seqno being
> > > > + * received in-order and asserts this assumption.
> > > > + *
> > > > + * Return: 0 on success, -EPROTO for malformed messages.
> > > > + */
> > > > +int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg,
> > > > u32 len)
> > > > +{
> > > > +       struct xe_gt *gt = guc_to_gt(guc);
> > > > +
> > > > +       if (unlikely(len != 1))
> > > > +               return -EPROTO;
> > > > +
> > > > +       xe_tlb_inval_done_handler(&gt->tlb_inval, msg[0]);
> > > > +
> > > > +       return 0;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.h
> > > > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.h
> > > > new file mode 100644
> > > > index 000000000000..07d668b02e3d
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.h
> > > > @@ -0,0 +1,19 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2025 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_GUC_TLB_INVAL_H_
> > > > +#define _XE_GUC_TLB_INVAL_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct xe_guc;
> > > > +struct xe_tlb_inval;
> > > > +
> > > > +void xe_guc_tlb_inval_init_early(struct xe_guc *guc,
> > > > +                                struct xe_tlb_inval *tlb_inval);
> > > > +
> > > > +int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg,
> > > > u32 len);
> > > > +
> > > > +#endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > index c795b78362bf..071c25fbdbac 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > > > @@ -12,50 +12,45 @@
> > > >  #include "xe_gt_printk.h"
> > > >  #include "xe_guc.h"
> > > >  #include "xe_guc_ct.h"
> > > > +#include "xe_guc_tlb_inval.h"
> > > >  #include "xe_gt_stats.h"
> > > >  #include "xe_tlb_inval.h"
> > > >  #include "xe_mmio.h"
> > > >  #include "xe_pm.h"
> > > > -#include "xe_sriov.h"
> > > > +#include "xe_tlb_inval.h"
> > > >  #include "xe_trace.h"
> > > > -#include "regs/xe_guc_regs.h"
> > > > -
> > > > -#define FENCE_STACK_BIT                DMA_FENCE_FLAG_USER_BITS
> > > >  
> > > > -/*
> > > > - * TLB inval depends on pending commands in the CT queue and
> > > > then the real
> > > > - * invalidation time. Double up the time to process full CT
> > > > queue
> > > > - * just to be on the safe side.
> > > > +/**
> > > > + * DOC: Xe TLB invalidation
> > > > + *
> > > > + * Xe TLB invalidation is implemented in two layers. The first
> > > > is the frontend
> > > > + * API, which provides an interface for TLB invalidations to the
> > > > driver code.
> > > > + * The frontend handles seqno assignment, synchronization
> > > > (fences), and the
> > > > + * timeout mechanism. The frontend is implemented via an
> > > > embedded structure
> > > > + * xe_tlb_inval that includes a set of ops hooking into the
> > > > backend. The backend
> > > > + * interacts with the hardware (or firmware) to perform the
> > > > actual invalidation.
> > > >   */
> > > > -static long tlb_timeout_jiffies(struct xe_gt *gt)
> > > > -{
> > > > -       /* this reflects what HW/GuC needs to process TLB inv
> > > > request */
> > > > -       const long hw_tlb_timeout = HZ / 4;
> > > >  
> > > > -       /* this estimates actual delay caused by the CTB
> > > > transport */
> > > > -       long delay = xe_guc_ct_queue_proc_time_jiffies(&gt-
> > > > >uc.guc.ct);
> > > > -
> > > > -       return hw_tlb_timeout + 2 * delay;
> > > > -}
> > > > +#define FENCE_STACK_BIT                DMA_FENCE_FLAG_USER_BITS
> > > >  
> > > >  static void xe_tlb_inval_fence_fini(struct xe_tlb_inval_fence
> > > > *fence)
> > > >  {
> > > > -       struct xe_gt *gt;
> > > > -
> > > >         if (WARN_ON_ONCE(!fence->tlb_inval))
> > > >                 return;
> > > >  
> > > > -       gt = fence->tlb_inval->private;
> > > > -       xe_pm_runtime_put(gt_to_xe(gt));
> > > > +       xe_pm_runtime_put(fence->tlb_inval->xe);
> > > >         fence->tlb_inval = NULL; /* fini() should be called once
> > > > */
> > > >  }
> > > >  
> > > >  static void
> > > > -__inval_fence_signal(struct xe_device *xe, struct
> > > > xe_tlb_inval_fence *fence)
> > > > +xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence *fence)
> > > >  {
> > > >         bool stack = test_bit(FENCE_STACK_BIT, &fence-
> > > > >base.flags);
> > > >  
> > > > -       trace_xe_tlb_inval_fence_signal(xe, fence);
> > > > +       lockdep_assert_held(&fence->tlb_inval->pending_lock);
> > > > +
> > > > +       list_del(&fence->link);
> > > > +       trace_xe_tlb_inval_fence_signal(fence->tlb_inval->xe,
> > > > fence);
> > > >         xe_tlb_inval_fence_fini(fence);
> > > >         dma_fence_signal(&fence->base);
> > > >         if (!stack)
> > > > @@ -63,57 +58,50 @@ __inval_fence_signal(struct xe_device *xe,
> > > > struct xe_tlb_inval_fence *fence)
> > > >  }
> > > >  
> > > >  static void
> > > > -inval_fence_signal(struct xe_device *xe, struct
> > > > xe_tlb_inval_fence *fence)
> > > > +xe_tlb_inval_fence_signal_unlocked(struct xe_tlb_inval_fence
> > > > *fence)
> > > >  {
> > > > -       lockdep_assert_held(&fence->tlb_inval->pending_lock);
> > > > -
> > > > -       list_del(&fence->link);
> > > > -       __inval_fence_signal(xe, fence);
> > > > -}
> > > > +       struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
> > > >  
> > > > -static void
> > > > -inval_fence_signal_unlocked(struct xe_device *xe,
> > > > -                           struct xe_tlb_inval_fence *fence)
> > > > -{
> > > > -       spin_lock_irq(&fence->tlb_inval->pending_lock);
> > > > -       inval_fence_signal(xe, fence);
> > > > -       spin_unlock_irq(&fence->tlb_inval->pending_lock);
> > > > +       spin_lock_irq(&tlb_inval->pending_lock);
> > > > +       xe_tlb_inval_fence_signal(fence);
> > > > +       spin_unlock_irq(&tlb_inval->pending_lock);
> > > >  }
> > > >  
> > > > -static void xe_gt_tlb_fence_timeout(struct work_struct *work)
> > > > +static void xe_tlb_inval_fence_timeout(struct work_struct *work)
> > > >  {
> > > > -       struct xe_gt *gt = container_of(work, struct xe_gt,
> > > > -
> > > >                                        tlb_inval.fence_tdr.work);
> > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > +       struct xe_tlb_inval *tlb_inval = container_of(work,
> > > > struct xe_tlb_inval,
> > > > +                                                    
> > > > fence_tdr.work);
> > > > +       struct xe_device *xe = tlb_inval->xe;
> > > >         struct xe_tlb_inval_fence *fence, *next;
> > > > +       long timeout_delay = tlb_inval->ops-
> > > > >timeout_delay(tlb_inval);
> > > >  
> > > > -       LNL_FLUSH_WORK(&gt->uc.guc.ct.g2h_worker);
> > > > +       tlb_inval->ops->flush(tlb_inval);
> > > >  
> > > > -       spin_lock_irq(&gt->tlb_inval.pending_lock);
> > > > +       spin_lock_irq(&tlb_inval->pending_lock);
> > > >         list_for_each_entry_safe(fence, next,
> > > > -                                &gt->tlb_inval.pending_fences,
> > > > link) {
> > > > +                                &tlb_inval->pending_fences,
> > > > link) {
> > > >                 s64 since_inval_ms = ktime_ms_delta(ktime_get(),
> > > >                                                     fence-
> > > > >inval_time);
> > > >  
> > > > -               if (msecs_to_jiffies(since_inval_ms) <
> > > > tlb_timeout_jiffies(gt))
> > > > +               if (msecs_to_jiffies(since_inval_ms) <
> > > > timeout_delay)
> > > >                         break;
> > > >  
> > > >                 trace_xe_tlb_inval_fence_timeout(xe, fence);
> > > > -               xe_gt_err(gt, "TLB invalidation fence timeout,
> > > > seqno=%d recv=%d",
> > > > -                         fence->seqno, gt-
> > > > >tlb_inval.seqno_recv);
> > > > +               drm_err(&xe->drm,
> > > > +                       "TLB invalidation fence timeout, seqno=%d
> > > > recv=%d",
> > > > +                       fence->seqno, tlb_inval->seqno_recv);
> > > >  
> > > >                 fence->base.error = -ETIME;
> > > > -               inval_fence_signal(xe, fence);
> > > > +               xe_tlb_inval_fence_signal(fence);
> > > >         }
> > > > -       if (!list_empty(&gt->tlb_inval.pending_fences))
> > > > -               queue_delayed_work(system_wq,
> > > > -                                  &gt->tlb_inval.fence_tdr,
> > > > -                                  tlb_timeout_jiffies(gt));
> > > > -       spin_unlock_irq(&gt->tlb_inval.pending_lock);
> > > > +       if (!list_empty(&tlb_inval->pending_fences))
> > > > +               queue_delayed_work(system_wq, &tlb_inval-
> > > > >fence_tdr,
> > > > +                                  timeout_delay);
> > > > +       spin_unlock_irq(&tlb_inval->pending_lock);
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_init_early - Initialize TLB invalidation state
> > > > + * xe_gt_tlb_inval_init_early() - Initialize TLB invalidation
> > > > state
> > > >   * @gt: GT structure
> > > >   *
> > > >   * Initialize TLB invalidation state, purely software
> > > > initialization, should
> > > > @@ -123,13 +111,12 @@ static void xe_gt_tlb_fence_timeout(struct
> > > > work_struct *work)
> > > >   */
> > > >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt)
> > > >  {
> > > > -       gt->tlb_inval.private = gt;
> > > > +       gt->tlb_inval.xe = gt_to_xe(gt);
> > > >         gt->tlb_inval.seqno = 1;
> > > >         INIT_LIST_HEAD(&gt->tlb_inval.pending_fences);
> > > >         spin_lock_init(&gt->tlb_inval.pending_lock);
> > > >         spin_lock_init(&gt->tlb_inval.lock);
> > > > -       INIT_DELAYED_WORK(&gt->tlb_inval.fence_tdr,
> > > > -                         xe_gt_tlb_fence_timeout);
> > > > +       INIT_DELAYED_WORK(&gt->tlb_inval.fence_tdr,
> > > > xe_tlb_inval_fence_timeout);
> > > >  
> > > >         gt->tlb_inval.job_wq =
> > > >                 drmm_alloc_ordered_workqueue(&gt_to_xe(gt)->drm,
> > > > "gt-tbl-inval-job-wq",
> > > > @@ -137,60 +124,64 @@ int xe_gt_tlb_inval_init_early(struct xe_gt
> > > > *gt)
> > > >         if (IS_ERR(gt->tlb_inval.job_wq))
> > > >                 return PTR_ERR(gt->tlb_inval.job_wq);
> > > >  
> > > > +       /* XXX: Blindly setting up backend to GuC */
> > > > +       xe_guc_tlb_inval_init_early(&gt->uc.guc, &gt->tlb_inval);
> > > > +
> > > >         return 0;
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_reset - Initialize TLB invalidation reset
> > > > + * xe_tlb_inval_reset() - TLB invalidation reset
> > > >   * @tlb_inval: TLB invalidation client
> > > >   *
> > > >   * Signal any pending invalidation fences, should be called
> > > > during a GT reset
> > > >   */
> > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval)
> > > >  {
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > >         struct xe_tlb_inval_fence *fence, *next;
> > > >         int pending_seqno;
> > > >  
> > > >         /*
> > > > -        * we can get here before the CTs are even initialized if
> > > > we're wedging
> > > > -        * very early, in which case there are not going to be
> > > > any pending
> > > > -        * fences so we can bail immediately.
> > > > +        * we can get here before the backends are even
> > > > initialized if we're
> > > > +        * wedging very early, in which case there are not going
> > > > to be any
> > > > +        * pendind fences so we can bail immediately.
> > > >          */
> > > > -       if (!xe_guc_ct_initialized(&gt->uc.guc.ct))
> > > > +       if (!tlb_inval->ops->initialized(tlb_inval))
> > > >                 return;
> > > >  
> > > >         /*
> > > > -        * CT channel is already disabled at this point. No new
> > > > TLB requests can
> > > > +        * Backend is already disabled at this point. No new TLB
> > > > requests can
> > > >          * appear.
> > > >          */
> > > >  
> > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > -       spin_lock_irq(&gt->tlb_inval.pending_lock);
> > > > -       cancel_delayed_work(&gt->tlb_inval.fence_tdr);
> > > > +       tlb_inval->ops->lock(tlb_inval);
> > > 
> > > I think you want a dedicated lock embedded in struct xe_tlb_inval,
> > > rather than reaching into the backend to grab one.
> > > 
> > > This will deadlock as written: G2H TLB inval messages are sometimes
> > > processed while holding ct->lock (non-fast path, unlikely) and
> > > sometimes
> > > without it (fast path, likely).
> > 
> > Ugh, I'm off today. Ignore the deadlock part, I was confusing
> > myself...
> > I was thinking this was the function xe_tlb_inval_done_handler, it is
> > not. I still think xe_tlb_inval should its own lock but this patch
> > written should work with s/xe_guc_ct_send/xe_guc_ct_send_locked.
> 
> So one reason I didn't go that way is we did just the reverse recently
> - moved from a TLB dedicated lock to the more specific CT lock since
> these are all going into the CT handler anyway when we use GuC
> submission. Then this embedded version allows us to lock at the bottom
> data layer rather than having a separate lock in the upper layer.
> Another thing is we might want to have different types of invalidation
> running in parallel without locking the data in the upper layer since
> the real contention would be in the lower level pipelining anyway.
> 

I can see the reasoning behind this approach, and maybe it’s fine.

But consider the case where the GuC backend has to look up a VM, iterate
over a list of exec queues, and send multiple H2Gs to the hardware, each
with a corresponding G2H (per-context invalidations). In the worst case,
the CT code may have to wait for and process some G2Hs because our G2H
credits are exhausted—all while holding the CT lock, which currently
blocks any hardware submissions (i.e., hardware submissions need the CT
lock). Now imagine multiple sources issuing invalidations: they could
grab the CT lock before a submission waiting on it, further delaying that
submission. 

The longer a mutex is held, the more likely the CPU thread holding it
could switched out while holding it.

This doesn’t seem scalable compared to using a finer-grained CT lock
(e.g., only taking it in xe_guc_ct_send).

I’m not saying this won’t work as you have it—I think it will—but the
consequences of holding the CT lock for an extended period need to be
considered.

Matt

> Thanks,
> Stuart
> 
> > 
> > Matt 
> > 
> > > 
> > > I’d call this lock seqno_lock, since it protects exactly that—the
> > > order
> > > in which a seqno is assigned by the frontend and handed to the
> > > backend.
> > > 
> > > Prime this lock for reclaim as well—do what primelockdep() does in
> > > xe_guc_ct.c—to make it clear that memory allocations are not
> > > allowed
> > > while the lock is held as TLB invalidations can be called from two
> > > reclaim paths:
> > > 
> > > - MMU notifier callbacks
> > > - The dma-fence signaling path of VM binds that require a TLB
> > >   invalidation
> > > 
> > > > +       spin_lock_irq(&tlb_inval->pending_lock);
> > > > +       cancel_delayed_work(&tlb_inval->fence_tdr);
> > > >         /*
> > > >          * We might have various kworkers waiting for TLB flushes
> > > > to complete
> > > >          * which are not tracked with an explicit TLB fence,
> > > > however at this
> > > > -        * stage that will never happen since the CT is already
> > > > disabled, so
> > > > -        * make sure we signal them here under the assumption
> > > > that we have
> > > > +        * stage that will never happen since the backend is
> > > > already disabled,
> > > > +        * so make sure we signal them here under the assumption
> > > > that we have
> > > >          * completed a full GT reset.
> > > >          */
> > > > -       if (gt->tlb_inval.seqno == 1)
> > > > +       if (tlb_inval->seqno == 1)
> > > >                 pending_seqno = TLB_INVALIDATION_SEQNO_MAX - 1;
> > > >         else
> > > > -               pending_seqno = gt->tlb_inval.seqno - 1;
> > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv, pending_seqno);
> > > > +               pending_seqno = tlb_inval->seqno - 1;
> > > > +       WRITE_ONCE(tlb_inval->seqno_recv, pending_seqno);
> > > >  
> > > >         list_for_each_entry_safe(fence, next,
> > > > -                                &gt->tlb_inval.pending_fences,
> > > > link)
> > > > -               inval_fence_signal(gt_to_xe(gt), fence);
> > > > -       spin_unlock_irq(&gt->tlb_inval.pending_lock);
> > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > +                                &tlb_inval->pending_fences,
> > > > link)
> > > > +               xe_tlb_inval_fence_signal(fence);
> > > > +       spin_unlock_irq(&tlb_inval->pending_lock);
> > > > +       tlb_inval->ops->unlock(tlb_inval);
> > > >  }
> > > >  
> > > > -static bool tlb_inval_seqno_past(struct xe_gt *gt, int seqno)
> > > > +static bool xe_tlb_inval_seqno_past(struct xe_tlb_inval
> > > > *tlb_inval, int seqno)
> > > >  {
> > > > -       int seqno_recv = READ_ONCE(gt->tlb_inval.seqno_recv);
> > > > +       int seqno_recv = READ_ONCE(tlb_inval->seqno_recv);
> > > > +
> > > > +       lockdep_assert_held(&tlb_inval->pending_lock);
> > > >  
> > > >         if (seqno - seqno_recv < -(TLB_INVALIDATION_SEQNO_MAX /
> > > > 2))
> > > >                 return false;
> > > > @@ -201,44 +192,20 @@ static bool tlb_inval_seqno_past(struct
> > > > xe_gt *gt, int seqno)
> > > >         return seqno_recv >= seqno;
> > > >  }
> > > >  
> > > > -static int send_tlb_inval(struct xe_guc *guc, const u32 *action,
> > > > int len)
> > > > -{
> > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > -
> > > > -       xe_gt_assert(gt, action[1]);    /* Seqno */
> > > > -       lockdep_assert_held(&guc->ct.lock);
> > > > -
> > > > -       /*
> > > > -        * XXX: The seqno algorithm relies on TLB invalidation
> > > > being processed
> > > > -        * in order which they currently are, if that changes the
> > > > algorithm will
> > > > -        * need to be updated.
> > > > -        */
> > > > -
> > > > -       xe_gt_stats_incr(gt, XE_GT_STATS_ID_TLB_INVAL, 1);
> > > > -
> > > > -       return xe_guc_ct_send(&guc->ct, action, len,
> > > > -                             G2H_LEN_DW_TLB_INVALIDATE, 1);
> > > > -}
> > > > -
> > > >  static void xe_tlb_inval_fence_prep(struct xe_tlb_inval_fence
> > > > *fence)
> > > >  {
> > > >         struct xe_tlb_inval *tlb_inval = fence->tlb_inval;
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > -
> > > > -       lockdep_assert_held(&gt->uc.guc.ct.lock);
> > > >  
> > > >         fence->seqno = tlb_inval->seqno;
> > > > -       trace_xe_tlb_inval_fence_send(xe, fence);
> > > > +       trace_xe_tlb_inval_fence_send(tlb_inval->xe, fence);
> > > >  
> > > >         spin_lock_irq(&tlb_inval->pending_lock);
> > > >         fence->inval_time = ktime_get();
> > > >         list_add_tail(&fence->link, &tlb_inval->pending_fences);
> > > >  
> > > >         if (list_is_singular(&tlb_inval->pending_fences))
> > > > -               queue_delayed_work(system_wq,
> > > > -                                  &tlb_inval->fence_tdr,
> > > > -                                  tlb_timeout_jiffies(gt));
> > > > +               queue_delayed_work(system_wq, &tlb_inval-
> > > > >fence_tdr,
> > > > +                                  tlb_inval->ops-
> > > > >timeout_delay(tlb_inval));
> > > >         spin_unlock_irq(&tlb_inval->pending_lock);
> > > >  
> > > >         tlb_inval->seqno = (tlb_inval->seqno + 1) %
> > > > @@ -247,202 +214,63 @@ static void xe_tlb_inval_fence_prep(struct
> > > > xe_tlb_inval_fence *fence)
> > > >                 tlb_inval->seqno = 1;
> > > >  }
> > > >  
> > > > -#define MAKE_INVAL_OP(type)    ((type <<
> > > > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > > > -               XE_GUC_TLB_INVAL_MODE_HEAVY <<
> > > > XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > > > -               XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > > > -
> > > > -static int send_tlb_inval_ggtt(struct xe_gt *gt, int seqno)
> > > > -{
> > > > -       u32 action[] = {
> > > > -               XE_GUC_ACTION_TLB_INVALIDATION,
> > > > -               seqno,
> > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_GUC),
> > > > -       };
> > > > -
> > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > ARRAY_SIZE(action));
> > > > -}
> > > > -
> > > > -static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > > -                             struct xe_tlb_inval_fence *fence)
> > > > -{
> > > > -       u32 action[] = {
> > > > -               XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> > > > -               0,  /* seqno, replaced in send_tlb_inval */
> > > > -               MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> > > > -       };
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -
> > > > -       xe_gt_assert(gt, fence);
> > > > -
> > > > -       return send_tlb_inval(&gt->uc.guc, action,
> > > > ARRAY_SIZE(action));
> > > > -}
> > > > +#define xe_tlb_inval_issue(__tlb_inval, __fence, op, args...)  \
> > > > +({                                                             \
> > > > +       int __ret;                                              \
> > > > +                                                               \
> > > > +       xe_assert((__tlb_inval)->xe, (__tlb_inval)->ops);       \
> > > > +       xe_assert((__tlb_inval)->xe, (__fence));                \
> > > > +                                                               \
> > > > +       (__tlb_inval)->ops->lock((__tlb_inval));                \
> > > > +       xe_tlb_inval_fence_prep((__fence));                     \
> > > > +       __ret = op((__tlb_inval), (__fence)->seqno, ##args);    \
> > > > +       if (__ret < 0)                                          \
> > > > +               xe_tlb_inval_fence_signal_unlocked((__fence));  \
> > > > +       (__tlb_inval)->ops->unlock((__tlb_inval));              \
> > > > +                                                               \
> > > > +       __ret == -ECANCELED ? 0 : __ret;                        \
> > > > +})
> > > >  
> > > >  /**
> > > > - * xe_gt_tlb_invalidation_all - Invalidate all TLBs across PF
> > > > and all VFs.
> > > > - * @gt: the &xe_gt structure
> > > > - * @fence: the &xe_tlb_inval_fence to be signaled on completion
> > > > + * xe_tlb_inval_all() - Issue a TLB invalidation for all TLBs
> > > > + * @tlb_inval: TLB invalidation client
> > > > + * @fence: invalidation fence which will be signal on TLB
> > > > invalidation
> > > > + * completion
> > > >   *
> > > > - * Send a request to invalidate all TLBs across PF and all VFs.
> > > > + * Issue a TLB invalidation for all TLBs. Completion of TLB is
> > > > asynchronous and
> > > > + * caller can use the invalidation fence to wait for completion.
> > > >   *
> > > >   * Return: 0 on success, negative error code on error
> > > >   */
> > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > >                      struct xe_tlb_inval_fence *fence)
> > > >  {
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -       int err;
> > > > -
> > > > -       err = send_tlb_inval_all(tlb_inval, fence);
> > > > -       if (err)
> > > > -               xe_gt_err(gt, "TLB invalidation request failed
> > > > (%pe)", ERR_PTR(err));
> > > > -
> > > > -       return err;
> > > > -}
> > > > -
> > > > -/*
> > > > - * Ensure that roundup_pow_of_two(length) doesn't overflow.
> > > > - * Note that roundup_pow_of_two() operates on unsigned long,
> > > > - * not on u64.
> > > > - */
> > > > -#define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > > > (rounddown_pow_of_two(ULONG_MAX))
> > > > -
> > > > -static int send_tlb_inval_ppgtt(struct xe_gt *gt, u64 start, u64
> > > > end,
> > > > -                               u32 asid, int seqno)
> > > > -{
> > > > -#define MAX_TLB_INVALIDATION_LEN       7
> > > > -       u32 action[MAX_TLB_INVALIDATION_LEN];
> > > > -       u64 length = end - start;
> > > > -       int len = 0;
> > > > -
> > > > -       action[len++] = XE_GUC_ACTION_TLB_INVALIDATION;
> > > > -       action[len++] = seqno;
> > > > -       if (!gt_to_xe(gt)->info.has_range_tlb_inval ||
> > > > -           length > MAX_RANGE_TLB_INVALIDATION_LENGTH) {
> > > > -               action[len++] =
> > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL);
> > > > -       } else {
> > > > -               u64 orig_start = start;
> > > > -               u64 align;
> > > > -
> > > > -               if (length < SZ_4K)
> > > > -                       length = SZ_4K;
> > > > -
> > > > -               /*
> > > > -                * We need to invalidate a higher granularity if
> > > > start address
> > > > -                * is not aligned to length. When start is not
> > > > aligned with
> > > > -                * length we need to find the length large enough
> > > > to create an
> > > > -                * address mask covering the required range.
> > > > -                */
> > > > -               align = roundup_pow_of_two(length);
> > > > -               start = ALIGN_DOWN(start, align);
> > > > -               end = ALIGN(end, align);
> > > > -               length = align;
> > > > -               while (start + length < end) {
> > > > -                       length <<= 1;
> > > > -                       start = ALIGN_DOWN(orig_start, length);
> > > > -               }
> > > > -
> > > > -               /*
> > > > -                * Minimum invalidation size for a 2MB page that
> > > > the hardware
> > > > -                * expects is 16MB
> > > > -                */
> > > > -               if (length >= SZ_2M) {
> > > > -                       length = max_t(u64, SZ_16M, length);
> > > > -                       start = ALIGN_DOWN(orig_start, length);
> > > > -               }
> > > > -
> > > > -               xe_gt_assert(gt, length >= SZ_4K);
> > > > -               xe_gt_assert(gt, is_power_of_2(length));
> > > > -               xe_gt_assert(gt, !(length & GENMASK(ilog2(SZ_16M)
> > > > - 1,
> > > > -                                                   ilog2(SZ_2M)
> > > > + 1)));
> > > > -               xe_gt_assert(gt, IS_ALIGNED(start, length));
> > > > -
> > > > -               action[len++] =
> > > > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > > > -               action[len++] = asid;
> > > > -               action[len++] = lower_32_bits(start);
> > > > -               action[len++] = upper_32_bits(start);
> > > > -               action[len++] = ilog2(length) - ilog2(SZ_4K);
> > > > -       }
> > > > -
> > > > -       xe_gt_assert(gt, len <= MAX_TLB_INVALIDATION_LEN);
> > > > -
> > > > -       return send_tlb_inval(&gt->uc.guc, action, len);
> > > > -}
> > > > -
> > > > -static int __xe_tlb_inval_ggtt(struct xe_gt *gt,
> > > > -                              struct xe_tlb_inval_fence *fence)
> > > > -{
> > > > -       int ret;
> > > > -
> > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > -
> > > > -       xe_tlb_inval_fence_prep(fence);
> > > > -
> > > > -       ret = send_tlb_inval_ggtt(gt, fence->seqno);
> > > > -       if (ret < 0)
> > > > -               inval_fence_signal_unlocked(gt_to_xe(gt), fence);
> > > > -
> > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > -
> > > > -       /*
> > > > -        * -ECANCELED indicates the CT is stopped for a GT reset.
> > > > TLB caches
> > > > -        *  should be nuked on a GT reset so this error can be
> > > > ignored.
> > > > -        */
> > > > -       if (ret == -ECANCELED)
> > > > -               return 0;
> > > > -
> > > > -       return ret;
> > > > +       return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval-
> > > > >ops->all);
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_ggtt - Issue a TLB invalidation on this GT for
> > > > the GGTT
> > > > + * xe_tlb_inval_ggtt() - Issue a TLB invalidation for the GGTT
> > > >   * @tlb_inval: TLB invalidation client
> > > >   *
> > > > - * Issue a TLB invalidation for the GGTT. Completion of TLB
> > > > invalidation is
> > > > - * synchronous.
> > > > + * Issue a TLB invalidation for the GGTT. Completion of TLB is
> > > > asynchronous and
> > > > + * caller can use the invalidation fence to wait for completion.
> > > >   *
> > > >   * Return: 0 on success, negative error code on error
> > > >   */
> > > >  int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval)
> > > >  {
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > -       unsigned int fw_ref;
> > > > -
> > > > -       if (xe_guc_ct_enabled(&gt->uc.guc.ct) &&
> > > > -           gt->uc.guc.submission_state.enabled) {
> > > > -               struct xe_tlb_inval_fence fence;
> > > > -               int ret;
> > > > -
> > > > -               xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > > > -               ret = __xe_tlb_inval_ggtt(gt, &fence);
> > > > -               if (ret)
> > > > -                       return ret;
> > > > -
> > > > -               xe_tlb_inval_fence_wait(&fence);
> > > > -       } else if (xe_device_uc_enabled(xe) &&
> > > > !xe_device_wedged(xe)) {
> > > > -               struct xe_mmio *mmio = &gt->mmio;
> > > > -
> > > > -               if (IS_SRIOV_VF(xe))
> > > > -                       return 0;
> > > > -
> > > > -               fw_ref = xe_force_wake_get(gt_to_fw(gt),
> > > > XE_FW_GT);
> > > > -               if (xe->info.platform == XE_PVC ||
> > > > GRAPHICS_VER(xe) >= 20) {
> > > > -                       xe_mmio_write32(mmio,
> > > > PVC_GUC_TLB_INV_DESC1,
> > > > -
> > > >                                        PVC_GUC_TLB_INV_DESC1_INVAL
> > > > IDATE);
> > > > -                       xe_mmio_write32(mmio,
> > > > PVC_GUC_TLB_INV_DESC0,
> > > > -
> > > >                                        PVC_GUC_TLB_INV_DESC0_VALID
> > > > );
> > > > -               } else {
> > > > -                       xe_mmio_write32(mmio, GUC_TLB_INV_CR,
> > > > -
> > > >                                        GUC_TLB_INV_CR_INVALIDATE);
> > > > -               }
> > > > -               xe_force_wake_put(gt_to_fw(gt), fw_ref);
> > > > -       }
> > > > +       struct xe_tlb_inval_fence fence, *fence_ptr = &fence;
> > > > +       int ret;
> > > >  
> > > > -       return 0;
> > > > +       xe_tlb_inval_fence_init(tlb_inval, fence_ptr, true);
> > > > +       ret = xe_tlb_inval_issue(tlb_inval, fence_ptr, tlb_inval-
> > > > >ops->ggtt);
> > > > +       xe_tlb_inval_fence_wait(fence_ptr);
> > > > +
> > > > +       return ret;
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_range - Issue a TLB invalidation on this GT for
> > > > an address range
> > > > + * xe_tlb_inval_range() - Issue a TLB invalidation for an
> > > > address range
> > > >   * @tlb_inval: TLB invalidation client
> > > >   * @fence: invalidation fence which will be signal on TLB
> > > > invalidation
> > > >   * completion
> > > > @@ -460,33 +288,12 @@ int xe_tlb_inval_range(struct xe_tlb_inval
> > > > *tlb_inval,
> > > >                        struct xe_tlb_inval_fence *fence, u64
> > > > start, u64 end,
> > > >                        u32 asid)
> > > >  {
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > -       int  ret;
> > > > -
> > > > -       xe_gt_assert(gt, fence);
> > > > -
> > > > -       /* Execlists not supported */
> > > > -       if (xe->info.force_execlist) {
> > > > -               __inval_fence_signal(xe, fence);
> > > > -               return 0;
> > > > -       }
> > > > -
> > > > -       mutex_lock(&gt->uc.guc.ct.lock);
> > > > -
> > > > -       xe_tlb_inval_fence_prep(fence);
> > > > -
> > > > -       ret = send_tlb_inval_ppgtt(gt, start, end, asid, fence-
> > > > >seqno);
> > > > -       if (ret < 0)
> > > > -               inval_fence_signal_unlocked(xe, fence);
> > > > -
> > > > -       mutex_unlock(&gt->uc.guc.ct.lock);
> > > > -
> > > > -       return ret;
> > > > +       return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval-
> > > > >ops->ppgtt,
> > > > +                                 start, end, asid);
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_vm - Issue a TLB invalidation on this GT for a
> > > > VM
> > > > + * xe_tlb_inval_vm() - Issue a TLB invalidation for a VM
> > > >   * @tlb_inval: TLB invalidation client
> > > >   * @vm: VM to invalidate
> > > >   *
> > > > @@ -496,27 +303,22 @@ void xe_tlb_inval_vm(struct xe_tlb_inval
> > > > *tlb_inval, struct xe_vm *vm)
> > > >  {
> > > >         struct xe_tlb_inval_fence fence;
> > > >         u64 range = 1ull << vm->xe->info.va_bits;
> > > > -       int ret;
> > > >  
> > > >         xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > > > -
> > > > -       ret = xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm-
> > > > >usm.asid);
> > > > -       if (ret < 0)
> > > > -               return;
> > > > -
> > > > +       xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm-
> > > > >usm.asid);
> > > >         xe_tlb_inval_fence_wait(&fence);
> > > >  }
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_done_handler - TLB invalidation done handler
> > > > - * @gt: gt
> > > > + * xe_tlb_inval_done_handler() - TLB invalidation done handler
> > > > + * @tlb_inval: TLB invalidation client
> > > >   * @seqno: seqno of invalidation that is done
> > > >   *
> > > >   * Update recv seqno, signal any TLB invalidation fences, and
> > > > restart TDR
> > > 
> > > I'd mention that is function is safe be called from any context
> > > (i.e.,
> > > process, atomic, and hardirq contexts are allowed).
> > > 
> > > We might need to convert tlb_inval.pending_lock to a raw_spinlock_t
> > > for
> > > PREEMPT_RT enablement. Same for the GuC fast_lock. AFAIK we haven’t
> > > had
> > > any complaints, so maybe I’m just overthinking it, but also perhaps
> > > not.
> > > 
> > > >   */
> > > > -static void xe_tlb_inval_done_handler(struct xe_gt *gt, int
> > > > seqno)
> > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval,
> > > > int seqno)
> > > >  {
> > > > -       struct xe_device *xe = gt_to_xe(gt);
> > > > +       struct xe_device *xe = tlb_inval->xe;
> > > >         struct xe_tlb_inval_fence *fence, *next;
> > > >         unsigned long flags;
> > > >  
> > > > @@ -535,77 +337,53 @@ static void
> > > > xe_tlb_inval_done_handler(struct xe_gt *gt, int seqno)
> > > >          * officially process the CT message like if racing
> > > > against
> > > >          * process_g2h_msg().
> > > >          */
> > > > -       spin_lock_irqsave(&gt->tlb_inval.pending_lock, flags);
> > > > -       if (tlb_inval_seqno_past(gt, seqno)) {
> > > > -               spin_unlock_irqrestore(&gt-
> > > > >tlb_inval.pending_lock, flags);
> > > > +       spin_lock_irqsave(&tlb_inval->pending_lock, flags);
> > > > +       if (xe_tlb_inval_seqno_past(tlb_inval, seqno)) {
> > > > +               spin_unlock_irqrestore(&tlb_inval->pending_lock,
> > > > flags);
> > > >                 return;
> > > >         }
> > > >  
> > > > -       WRITE_ONCE(gt->tlb_inval.seqno_recv, seqno);
> > > > +       WRITE_ONCE(tlb_inval->seqno_recv, seqno);
> > > >  
> > > >         list_for_each_entry_safe(fence, next,
> > > > -                                &gt->tlb_inval.pending_fences,
> > > > link) {
> > > > +                                &tlb_inval->pending_fences,
> > > > link) {
> > > >                 trace_xe_tlb_inval_fence_recv(xe, fence);
> > > >  
> > > > -               if (!tlb_inval_seqno_past(gt, fence->seqno))
> > > > +               if (!xe_tlb_inval_seqno_past(tlb_inval, fence-
> > > > >seqno))
> > > >                         break;
> > > >  
> > > > -               inval_fence_signal(xe, fence);
> > > > +               xe_tlb_inval_fence_signal(fence);
> > > >         }
> > > >  
> > > > -       if (!list_empty(&gt->tlb_inval.pending_fences))
> > > > +       if (!list_empty(&tlb_inval->pending_fences))
> > > >                 mod_delayed_work(system_wq,
> > > > -                                &gt->tlb_inval.fence_tdr,
> > > > -                                tlb_timeout_jiffies(gt));
> > > > +                                &tlb_inval->fence_tdr,
> > > > +                                tlb_inval->ops-
> > > > >timeout_delay(tlb_inval));
> > > >         else
> > > > -               cancel_delayed_work(&gt->tlb_inval.fence_tdr);
> > > > +               cancel_delayed_work(&tlb_inval->fence_tdr);
> > > >  
> > > > -       spin_unlock_irqrestore(&gt->tlb_inval.pending_lock,
> > > > flags);
> > > > -}
> > > > -
> > > > -/**
> > > > - * xe_guc_tlb_inval_done_handler - TLB invalidation done handler
> > > > - * @guc: guc
> > > > - * @msg: message indicating TLB invalidation done
> > > > - * @len: length of message
> > > > - *
> > > > - * Parse seqno of TLB invalidation, wake any waiters for seqno,
> > > > and signal any
> > > > - * invalidation fences for seqno. Algorithm for this depends on
> > > > seqno being
> > > > - * received in-order and asserts this assumption.
> > > > - *
> > > > - * Return: 0 on success, -EPROTO for malformed messages.
> > > > - */
> > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg,
> > > > u32 len)
> > > > -{
> > > > -       struct xe_gt *gt = guc_to_gt(guc);
> > > > -
> > > > -       if (unlikely(len != 1))
> > > > -               return -EPROTO;
> > > > -
> > > > -       xe_tlb_inval_done_handler(gt, msg[0]);
> > > > -
> > > > -       return 0;
> > > > +       spin_unlock_irqrestore(&tlb_inval->pending_lock, flags);
> > > >  }
> > > >  
> > > >  static const char *
> > > > -inval_fence_get_driver_name(struct dma_fence *dma_fence)
> > > > +xe_inval_fence_get_driver_name(struct dma_fence *dma_fence)
> > > >  {
> > > >         return "xe";
> > > >  }
> > > >  
> > > >  static const char *
> > > > -inval_fence_get_timeline_name(struct dma_fence *dma_fence)
> > > > +xe_inval_fence_get_timeline_name(struct dma_fence *dma_fence)
> > > >  {
> > > > -       return "inval_fence";
> > > > +       return "tlb_inval_fence";
> > > >  }
> > > >  
> > > >  static const struct dma_fence_ops inval_fence_ops = {
> > > > -       .get_driver_name = inval_fence_get_driver_name,
> > > > -       .get_timeline_name = inval_fence_get_timeline_name,
> > > > +       .get_driver_name = xe_inval_fence_get_driver_name,
> > > > +       .get_timeline_name = xe_inval_fence_get_timeline_name,
> > > >  };
> > > >  
> > > >  /**
> > > > - * xe_tlb_inval_fence_init - Initialize TLB invalidation fence
> > > > + * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
> > > >   * @tlb_inval: TLB invalidation client
> > > >   * @fence: TLB invalidation fence to initialize
> > > >   * @stack: fence is stack variable
> > > > @@ -618,15 +396,12 @@ void xe_tlb_inval_fence_init(struct
> > > > xe_tlb_inval *tlb_inval,
> > > >                              struct xe_tlb_inval_fence *fence,
> > > >                              bool stack)
> > > >  {
> > > > -       struct xe_gt *gt = tlb_inval->private;
> > > > -
> > > > -       xe_pm_runtime_get_noresume(gt_to_xe(gt));
> > > > +       xe_pm_runtime_get_noresume(tlb_inval->xe);
> > > >  
> > > > -       spin_lock_irq(&gt->tlb_inval.lock);
> > > > -       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > -                      &gt->tlb_inval.lock,
> > > > +       spin_lock_irq(&tlb_inval->lock);
> > > > +       dma_fence_init(&fence->base, &inval_fence_ops,
> > > > &tlb_inval->lock,
> > > >                        dma_fence_context_alloc(1), 1);
> > > > -       spin_unlock_irq(&gt->tlb_inval.lock);
> > > > +       spin_unlock_irq(&tlb_inval->lock);
> > > 
> > > While here, 'fence_lock' is probably a better name.
> > > 
> > > Matt
> > > 
> > > >         INIT_LIST_HEAD(&fence->link);
> > > >         if (stack)
> > > >                 set_bit(FENCE_STACK_BIT, &fence->base.flags);
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > index 7adee3f8c551..cdeafc8d4391 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > > > @@ -18,24 +18,30 @@ struct xe_vma;
> > > >  int xe_gt_tlb_inval_init_early(struct xe_gt *gt);
> > > >  
> > > >  void xe_tlb_inval_reset(struct xe_tlb_inval *tlb_inval);
> > > > -int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > -void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct
> > > > xe_vm *vm);
> > > >  int xe_tlb_inval_all(struct xe_tlb_inval *tlb_inval,
> > > >                      struct xe_tlb_inval_fence *fence);
> > > > +int xe_tlb_inval_ggtt(struct xe_tlb_inval *tlb_inval);
> > > > +void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval, struct
> > > > xe_vm *vm);
> > > >  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> > > >                        struct xe_tlb_inval_fence *fence,
> > > >                        u64 start, u64 end, u32 asid);
> > > > -int xe_guc_tlb_inval_done_handler(struct xe_guc *guc, u32 *msg,
> > > > u32 len);
> > > >  
> > > >  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> > > >                              struct xe_tlb_inval_fence *fence,
> > > >                              bool stack);
> > > > -void xe_tlb_inval_fence_signal(struct xe_tlb_inval_fence
> > > > *fence);
> > > >  
> > > > +/**
> > > > + * xe_tlb_inval_fence_wait() - TLB invalidiation fence wait
> > > > + * @fence: TLB invalidation fence to wait on
> > > > + *
> > > > + * Wait on a TLB invalidiation fence until it signals, non
> > > > interruptable
> > > > + */
> > > >  static inline void
> > > >  xe_tlb_inval_fence_wait(struct xe_tlb_inval_fence *fence)
> > > >  {
> > > >         dma_fence_wait(&fence->base, false);
> > > >  }
> > > >  
> > > > +void xe_tlb_inval_done_handler(struct xe_tlb_inval *tlb_inval,
> > > > int seqno);
> > > > +
> > > >  #endif /* _XE_TLB_INVAL_ */
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > index 05b6adc929bb..c1ad96d24fc8 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > > > @@ -9,10 +9,85 @@
> > > >  #include <linux/workqueue.h>
> > > >  #include <linux/dma-fence.h>
> > > >  
> > > > -/** struct xe_tlb_inval - TLB invalidation client */
> > > > +struct xe_tlb_inval;
> > > > +
> > > > +/** struct xe_tlb_inval_ops - TLB invalidation ops (backend) */
> > > > +struct xe_tlb_inval_ops {
> > > > +       /**
> > > > +        * @all: Invalidate all TLBs
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        * @seqno: Seqno of TLB invalidation
> > > > +        *
> > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > reset, error on
> > > > +        * failure
> > > > +        */
> > > > +       int (*all)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > > +
> > > > +       /**
> > > > +        * @ggtt: Invalidate global translation TLBs
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        * @seqno: Seqno of TLB invalidation
> > > > +        *
> > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > reset, error on
> > > > +        * failure
> > > > +        */
> > > > +       int (*ggtt)(struct xe_tlb_inval *tlb_inval, u32 seqno);
> > > > +
> > > > +       /**
> > > > +        * @ppttt: Invalidate per-process translation TLBs
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        * @seqno: Seqno of TLB invalidation
> > > > +        * @start: Start address
> > > > +        * @end: End address
> > > > +        * @asid: Address space ID
> > > > +        *
> > > > +        * Return 0 on success, -ECANCELED if backend is mid-
> > > > reset, error on
> > > > +        * failure
> > > > +        */
> > > > +       int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno,
> > > > u64 start,
> > > > +                    u64 end, u32 asid);
> > > > +
> > > > +       /**
> > > > +        * @initialized: Backend is initialized
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        *
> > > > +        * Return: True if back is initialized, False otherwise
> > > > +        */
> > > > +       bool (*initialized)(struct xe_tlb_inval *tlb_inval);
> > > > +
> > > > +       /**
> > > > +        * @flush: Flush pending TLB invalidations
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        */
> > > > +       void (*flush)(struct xe_tlb_inval *tlb_inval);
> > > > +
> > > > +       /**
> > > > +        * @timeout_delay: Timeout delay for TLB invalidation
> > > > +        * @tlb_inval: TLB invalidation client
> > > > +        *
> > > > +        * Return: Timeout delay for TLB invalidation in jiffies
> > > > +        */
> > > > +       long (*timeout_delay)(struct xe_tlb_inval *tlb_inval);
> > > > +
> > > > +       /**
> > > > +        * @lock: Lock resources protecting the backend seqno
> > > > management
> > > > +        */
> > > > +       void (*lock)(struct xe_tlb_inval *tlb_inval);
> > > > +
> > > > +       /**
> > > > +        * @unlock: Lock resources protecting the backend seqno
> > > > management
> > > > +        */
> > > > +       void (*unlock)(struct xe_tlb_inval *tlb_inval);
> > > > +};
> > > > +
> > > > +/** struct xe_tlb_inval - TLB invalidation client (frontend) */
> > > >  struct xe_tlb_inval {
> > > >         /** @private: Backend private pointer */
> > > >         void *private;
> > > > +       /** @xe: Pointer to Xe device */
> > > > +       struct xe_device *xe;
> > > > +       /** @ops: TLB invalidation ops */
> > > > +       const struct xe_tlb_inval_ops *ops;
> > > >         /** @tlb_inval.seqno: TLB invalidation seqno, protected
> > > > by CT lock */
> > > >  #define TLB_INVALIDATION_SEQNO_MAX     0x100000
> > > >         int seqno;
> > > > -- 
> > > > 2.34.1
> > > > 
> 
