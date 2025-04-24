Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3EC369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 10:04:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5607110E7C0;
	Thu, 24 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g2Onzjif";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FEA10E7C0
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Apr 2025 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745489060; x=1777025060;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=T+N1qtIKg71iU2miqUAfJE9/oo9cplb0TPD+8hIPSc4=;
 b=g2OnzjifIYdj3pAvLYvchwT4A/JrvW4vPYSCj04G4ekU8aVMyE9m2jBg
 CSSoDA+8Z1s8e/Rk2Z6ZtZfLv/a59+/MHowJo4IVAaonAluOkoI1mqk38
 K5YLjjt0FzDg6I/geMBn9ltLExMmakg810rTq9Kauu4JfPqn/lQE+evzq
 cUYKOVmiiuk9ypqc05cF6obdeVJP8NLQwD4J796QykYTJvrHowZcL0Je6
 f9TEW1kK1AnPxUYYL2DpiCbWbCNN7ap/SAUMXAH4gPA/BZw7k9UNsNpPL
 kQwI1K6bimn947XGdl9X47oU09tR8q25qVSTrcKUjkq7vRBMvGGsQnQbf A==;
X-CSE-ConnectionGUID: ipdQ7JJnQKq2ar/qlH6SKQ==
X-CSE-MsgGUID: 9yVINwVqRQCcOV+yJ7mw8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46820965"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="46820965"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:04:20 -0700
X-CSE-ConnectionGUID: DZ3szhHJSjy5jFaj5gTA8Q==
X-CSE-MsgGUID: os2FI2LkTZ2zLkRXdx7awA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132421200"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 03:04:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 03:04:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 03:04:19 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 03:04:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mz6QmNOpMcdI1iurgMfPUvULsS0OqlbBCO5iBeXuxBDRVQthpP18LgbKHfRjpAvyNoyFbfnE/qzHjJGpqhHC3NKWYjjMTeslE6z6kkPruqrI7+LUfQH68A9wGbY6EOdcJZ4MGLg2YRRd1unXDy9R80WmRy6CiSFOIJ/hwyuC59R4QyvK0223czwYZ4zdUArL/QJ0EXDlV++b5gWwd3XQhJA3OjwH96a6GmRjDlLDAVnuP8ukaVqrhFBMjqOoYeiqBKROwdYOjaB+t6z2LBbc2fZYvRxb7CuIyKySmwt3gJgjsOXkFuCzFfwjGMs3Yo7xdlUyBLMlyEjJFHQFIIFKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6ylSc+LczziVtJv0AOpHyJ4VEACM80ESEtOifJBEO8=;
 b=i3E7ZkPXfajB/RUcRrVS9596b7lCrTXhAIMgsQhlE3FZ1UaXOy5cEsDc/zo1pNbypomUaMkfiy9UKy+Zse0SzccvFaPGiNAXHg4Ghfrs/DGDOoYfKReVM4THzNgSs16dkTj5bX3x3geBqfZb5Gycqn3JIfjD22yg/cVxyRQMCaC6ZT24PZn9NKfT4kVpg76POseubrHC6EnVwFVcRfIpRYSHEglDQFIAghHu2cBdWH2ooZwgyMkobffIqA1RfEH/EHbPP69oZiaxDL0qU+x4L1WuS123q7t2cLHvxjKZrNZ3vr54A+PcSVIXzrZ+lBcIm6p6jp54uXXdgW6ADzWo5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 10:03:36 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Thu, 24 Apr 2025
 10:03:35 +0000
Message-ID: <0f22ea7e-e6cf-4464-8044-4520ebe9ecd6@intel.com>
Date: Thu, 24 Apr 2025 15:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/32] drm/xe/svm: Implement prefetch support for SVM
 ranges
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-15-himal.prasad.ghimiray@intel.com>
 <aACJoZMXsfA+hu4F@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aACJoZMXsfA+hu4F@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6830:EE_
X-MS-Office365-Filtering-Correlation-Id: ed9bf6df-5038-4304-61b9-08dd831746c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ynp5dURyOUx2T2U5cDJCOEFIMUZkNGRQbG5xUXpjRXpTK2hWQmhLUHI1R1B2?=
 =?utf-8?B?Rjlvc1lyeTM3TUMvSUNYQ2cwNHRkR1lBY0JNc3JKMCtoQ1JFVDRpT3hKbjA1?=
 =?utf-8?B?b1RhTGJVbE50N3VFRTN2NVJwMlpxbnNEVEI5U0xGYVJ1L1VVMnN5V3U5NTJN?=
 =?utf-8?B?cnJqbHRqUUNUUmV2T25ValYvVmNZVlNZUHVpczZGSTlZMHRLbjNIa0FjZzBB?=
 =?utf-8?B?Smozd0RWeXBJV3VtM3dsVFd0azZKMXFRcjJKRHpMU1dnYVQ0aXk1a3h5Q3pL?=
 =?utf-8?B?VGxnWENhZHRuL2VGN2Z0K3FBT01kMUhvcDg2UWwrR2psKzJrMXlOUlIydGJU?=
 =?utf-8?B?NkNCU2VQdXRGQ25UNjJjNVZrbDdQQXNKcTNnZnNha05QdEpXYXdJU0k4ekh3?=
 =?utf-8?B?VFYrUEQ2eTE4anlpVTVwNGkxRFlVcGdsRFZiZmgvRU5qbUdhV3F0OWJFMXVU?=
 =?utf-8?B?SEdGQXdQR3NQZTJVT0MyM1pMUnZONXR4TUJ1N2ZtSFVVSXZaeWZsOXlTcXBH?=
 =?utf-8?B?Mis1WGErbGxGelFFY1YvVHd5NUo2VDQyRFIrc0ZBMHIwdTV1VEZCb25GV2pV?=
 =?utf-8?B?d2plTHpHVGJVRTBRWXJiS0wzUksrNXBWcXhYUVZpZENwNkg4ZmwvS0h3K3RV?=
 =?utf-8?B?c044bkVGL3VKNkt4NzgrZGpOTlRVbFJmS0hrK0cvUHc5dzkrdWh4RmRzcDA0?=
 =?utf-8?B?dG9mZFZoMjQ4NWxKdThmUjVkSy9NZXFaNms5amp2anBRd1BESk1aOVhwYjE5?=
 =?utf-8?B?ODI0c0ZzWlZDeHFSR1pYOG1SQ2dLdVg5SUp1bXRpaWdQVlU0ZjFEWVNMeVd0?=
 =?utf-8?B?ZXI5VlJnY1JXNkEvZk9aWHZNdEVSVGU4ekU0WThkN01LNDZ1M2w3Y1FXeDRa?=
 =?utf-8?B?N1hqaUVlTXhTNlY5MEFuRkRyeG9tVEdQVHUxbFpub3BxRVN1dHFBUlo0VGc2?=
 =?utf-8?B?bmtEblE5K21zR1RzaWlhMnJWdXhVZzBDWHY0UnlOMmYwMDNqRHRNd1pVNHNI?=
 =?utf-8?B?dEhRWVlUaDkrWlZiSzNvZ0d6V1NzdWR0RXgwQWNnYjhtTlFEOU9lV25Qa3Mr?=
 =?utf-8?B?VzJicWpVVGtXOXIxTjJnL21kM3JQQ240VUdORFB6Vkh5aFRRcVlFb0NjTXhM?=
 =?utf-8?B?Qml5NHFqS2V5NXB0UDhoR2FEWForSDNTZlhUenVGdkVoUFp4eUtUMmJZZzQ2?=
 =?utf-8?B?VnYxNWRoWGhXNWVGTzZURWI1azNzUGxmU1BmWU1ZdmVPRTRvckxJMy9GV2VR?=
 =?utf-8?B?K2tMTGxFaUhLZzhXVGprWGY5dDNEUDZ1VGthMG40cVpBVFZ6akZCVzZrMGpi?=
 =?utf-8?B?RWs2QWJhbHdiUVhWRnpqZXFWeVduVzkvYzZvVGUyNEF1ZXFRd2drMEJVVEZh?=
 =?utf-8?B?aVpDSVhBWFJRdm1Kczk2QURVM3BjVERTbVVRMkRlN0dMZ1dvT3pxKzNxQVZM?=
 =?utf-8?B?MkNZcXR5dzVHdEg5RGc3Y0M1ZERwMXlzS2U0djF5YlR0WWNEUGlHT2U1S2pN?=
 =?utf-8?B?bnJyMW8rQ05hdkV3OC95d2RIbm9LelVyVjVhZWF4Snk4bTRnMHk2NkFKV1p3?=
 =?utf-8?B?V3FramlhNU01SUJrMkpTdTgrMDR6ZW0ydGFycG1EMERTeld4MGJEdE44V1dP?=
 =?utf-8?B?b1p0OGc0SEJVZ0owMXdiaS9wMENXNEhkd2NpelBod3NCd3hGY2hRUU9qRFR3?=
 =?utf-8?B?dElLUDdhcHRrdFA0NmNqMWNCU3U1K1RwVTFTR1AraG5lTlYxY3NJdUxBa0k3?=
 =?utf-8?B?bys5VERhY2F1Zm5PdjZOQnhUZzRTdWpsWDQrNTFUWFNVZkZNYU1YWHk2TExB?=
 =?utf-8?B?ZmFmOEtrSlhkdXdYWWh3QVZadi9RTSt5S2VXSC9vWHJZWlNoWWljQTU4azht?=
 =?utf-8?B?d2lmU2FFY2RvKzVwK3FHRmdyT1FnVVdXcVR5NXFvQmlRZWRrSnN6MGlvcFFH?=
 =?utf-8?Q?YqM9CIzy7iE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lLWDNlWWlySnU5emg1bDR2WjBndVBhOHp2WVAwNy9BVFRBaGZlTjRBY1lk?=
 =?utf-8?B?UVJidFI5dTVKV0svWFFocm5oWHMrOEkyY3lxaXlRUkR5bmNCdWpWc3ptenhO?=
 =?utf-8?B?bjFuV3A4SEFhcDk4T0VPN0l6VFlrQkhSODBVdERzTTI4R2pXZEFUeEdTWTRM?=
 =?utf-8?B?WWw5OGpRdG90R2JtaG1va3lLU0x5b3ZVaXh1Vjkrd1gwSkJpMlVGa2pidmlB?=
 =?utf-8?B?K2hXQWt4eStKZVZ0a1JqYXlydmgyNFdnYzJHNGZwa1czbEswTS95aTQ5Vmsv?=
 =?utf-8?B?Q2RqaGMwTnFGWCtXS3hkbmNSSitTOXFtaGQ4YmYwUkZLK2k1WisxSHpiMUt0?=
 =?utf-8?B?eVAxckxyVDRZcXhwUUF2MHFzd25lbnVadXIvTSthczdBQTBXY2NOcGtFbWwx?=
 =?utf-8?B?TE1IcnJDY21INm1qZ2g4TWNySW8vZnRwdy9Db0VwQkR4SGx0a1JGZmJBeWRs?=
 =?utf-8?B?eThpQ01NMUxXd1FPcHlac1Z4RkFnYmpxeXJZNHJKYmplRTFYSDd1NFQ2OVBh?=
 =?utf-8?B?aGl5ZzlQSlAxMnRDeW51UVh5OTFFeVNQUDViOGZ4U1NWQk5mam4wQXFsVVZz?=
 =?utf-8?B?RTkrMVE1NC9RTjBmbSthVjF6NkVtVmRMc1FMcWFJOTNPSkZKckpGeXIwT2U3?=
 =?utf-8?B?QVRJekt5UmZiSG5NM0tpeS90NnRGeUlLVjkvbGdGamlaeVpid3Rhcm8xcGNC?=
 =?utf-8?B?VlNURmpLTVhBY2tSOFZFZTBMMlBZbFV2SWFIY1lEM3k1UzUrZ3phd1gwekls?=
 =?utf-8?B?R0Zkd0xXMHdSb0VWYytZbmJBekJDN0krRDY2dDBsL1d3M3RHU1BENFFtZUhG?=
 =?utf-8?B?VWVLNUIrZUs4WnN6WHNvMnd0ZnJkNnF2SUg5bTM0UDJrLzR3aGlpYWdETEFp?=
 =?utf-8?B?dHQrQ2I5elpUb1dJMjhKOFNvWCtrOUZWd2RuS3RDTVFIdTAyZDd2VWhqMFNq?=
 =?utf-8?B?VWlTLy9JS1JGcE00WU1SR0ZRSGhGR21JdGJWNWxvUlMvaVBOdkprZGduUjVW?=
 =?utf-8?B?MW1yOGNBY09sMVBuY2tWaDM0YzhHUW5xb096QVB1K3NRVFpKdWZMeUdOOHd6?=
 =?utf-8?B?NGhWZU9tdGNYa2VQbWpIQTJ0MWl0OHJyWEllajRHTG9KY093TGNIUW9IVGhi?=
 =?utf-8?B?RkpzaktFZmpxVnA5TzA5Qk9JZTgyaW1JSlR5RkZKK3hZLzMreWdmTEJHbFRh?=
 =?utf-8?B?eWxGaENhODF6aE1GUmVEdzRabWJyRTRoV1VFbGNPcGhxaURHS3hVdkx4a1Ex?=
 =?utf-8?B?SmEyTzVsd3lxMERObThIdmpERklQUnF0RE16VXB5TkNGeXIvMVk2cXM2Y3BC?=
 =?utf-8?B?YmpPcGZVUU92RWdDT0U1eUVTUUtQczF1ZEg5cjJDazdrQlM1bUtIN3EwaHRq?=
 =?utf-8?B?ZDBmQkJLU1VDVHFIRlZMUXJoNGtwZUgxc2pld24vSVNKdHdqZUhDQ0dLekhD?=
 =?utf-8?B?RXNCRzZ1ZGlqRHNGenNIdG5UdFA4YjhibkpZenRRTlVGOFZCMThqbC9Zc2VE?=
 =?utf-8?B?Z1ZMa0tmd2k0VnRPUzc5WHVpdzVxcDQyQ05rWUk3MVoxTzNDRlRmTmZFMExZ?=
 =?utf-8?B?bUxZTjdIY1ZsVWZrSU1GVE5oaVl0RlRBMEdyQVI5Sis5YjgwRkZZc2hiaksw?=
 =?utf-8?B?cG5MSUd1QjdIRkFOQTNRcENENDExUkswRWlSMGRMTHNZaXF3blcxQVVvbFZo?=
 =?utf-8?B?OWRKYmp0SHZmYzlRMEQ0RHV2T0cwZG53MTN3SHNjSktIVkpqbVN3a2drVWdI?=
 =?utf-8?B?d2NJR2FEck1TV2x5WndRTkp5bVBlNnBINGY0Q1lkcnhZMjllQnBhdWEyN3J4?=
 =?utf-8?B?MXlzQjhtYmJBcmcrckZZY1dhbXBHYkIxYUtsalF4K3NJL1BFV3puMHpKVXFX?=
 =?utf-8?B?b1BKbTk5d2VuWXd6VkR1UTE4TSs1amI2Y2tjMUJ6a2J0LzdJK0tlM1JFcGlS?=
 =?utf-8?B?elZUNldMLytEZWMwTmQyelVlMXJERkJKTTFDMURNSjIvVWhoaE8vRzluQnNW?=
 =?utf-8?B?WWVkYlVaalRndEFGamZJeUZac2RSYmNVams5REptK3gzek9sTTNMZVhWWktT?=
 =?utf-8?B?TnpMMWsyVzBTbzZENnBmbktncGxMWncwS3g5Q0ladDd0clJzcmowQk5Mazlq?=
 =?utf-8?B?TzdxWEU1SjRnVTBBdlkzcUxFOTNvZG9zTWh5MEZ0LzZocWdhSkd5aGlmem5u?=
 =?utf-8?Q?qUoTDpuwXLFhe3hGUe79Rsw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed9bf6df-5038-4304-61b9-08dd831746c0
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:03:35.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLUI/Y3IdJ9Pdftdl8Bwfxfao6I95bBafSIP1jtRy3nqj2kpWtgNlIQcAauTdidUbGHkhNttzv6eZiZl4GwkJSuhzUDNoo4PEBypg1kvdW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
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



On 17-04-2025 10:24, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:01PM +0530, Himal Prasad Ghimiray wrote:
>> This commit adds prefetch support for SVM ranges, utilizing the
>> existing ioctl vm_bind functionality to achieve this.
>>
>> v2: rebase
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c |  61 +++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c | 185 +++++++++++++++++++++++++++++++++++--
>>   2 files changed, 222 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index de4e3edda758..59dc065fae93 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -1458,7 +1458,8 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	struct xe_vm *vm = pt_update->vops->vm;
>>   	struct xe_vma_ops *vops = pt_update->vops;
>>   	struct xe_vma_op *op;
>> -	int err;
>> +	int ranges_count;
>> +	int err, i;
>>   
>>   	err = xe_pt_pre_commit(pt_update);
>>   	if (err)
>> @@ -1467,20 +1468,33 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>>   	xe_svm_notifier_lock(vm);
>>   
>>   	list_for_each_entry(op, &vops->list, link) {
>> -		struct xe_svm_range *range = op->map_range.range;
>> +		struct xe_svm_range *range = NULL;
>>   
>>   		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>>   			continue;
>>   
>> -		xe_svm_range_debug(range, "PRE-COMMIT");
>> -
>> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
>> +			xe_assert(vm->xe,
>> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
>> +			ranges_count = op->prefetch_range.ranges_count;
>> +		} else {
>> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
>> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
>> +			ranges_count  = 1;
>> +		}
>>   
>> -		if (!xe_svm_range_pages_valid(range)) {
>> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> -			xe_svm_notifier_unlock(vm);
>> -			return -EAGAIN;
>> +		for (i = 0; i < ranges_count; i++) {
> 
> xa_for_each as it doesn't make any assumptions above the key (e.g. the value of i).

Sure


> 
>> +			if (op->base.op == DRM_GPUVA_OP_PREFETCH)
>> +				range = xa_load(&op->prefetch_range.range, i);
> 
> I'd move this logic above... So I'd write it like this...
> 
> if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> 	assert
> 	xe_for_each
> 		do_pages_check()
> } else {
> 	assert
> 	do_pages_check();
> }

Looks better.

> 
>> +			else
>> +				range = op->map_range.range;
>> +			xe_svm_range_debug(range, "PRE-COMMIT");
>> +
>> +			if (!xe_svm_range_pages_valid(range)) {
>> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
>> +				xe_svm_notifier_unlock(vm);
>> +				return -EAGAIN;
> 
> So in the case of prefetch, this is bit inconsistent as below when
> things race, you return -ENODATA which is converted to 0 in the IOCTL.
> -EAGAIN here could result in a livelock in the right conditions as
> -EAGAIN means must retry. I think maybe just -ENODATA if a prefetch
> fails... If there are any other binds in the array of IOCTL they will
> just fault I guess. Maybe not a concern as only VK uses array of binds
> at the moment.

Ok

> 
>> +			}
>>   		}
>>   	}
>>   
>> @@ -2065,11 +2079,21 @@ static int op_prepare(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (xe_vma_is_cpu_addr_mirror(vma))
>> -			break;
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			struct xe_svm_range *range;
>> +			int i;
>>   
>> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> -		pt_update_ops->wait_vm_kernel = true;
>> +			for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>> +				range = xa_load(&op->prefetch_range.range, i);
> 
> Again xe_for_each...

Noted

> 
>> +				err = bind_range_prepare(vm, tile, pt_update_ops,
>> +							 vma, range);
>> +				if (err)
>> +					return err;
>> +			}
>> +		} else {
>> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
>> +			pt_update_ops->wait_vm_kernel = true;
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> @@ -2273,9 +2297,16 @@ static void op_commit(struct xe_vm *vm,
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>>   
>> -		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
>> +			for (int i = 0 ; i < op->prefetch_range.ranges_count; i++) {
> 
> Again xe_for_each...
> 
>> +				struct xe_svm_range *range = xa_load(&op->prefetch_range.range, i);
>> +
>> +				range_present_and_invalidated_tile(vm, range, tile->id);
>> +			}
>> +		} else {
>>   			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>>   				       fence2, false);
>> +		}
>>   		break;
>>   	}
>>   	case DRM_GPUVA_OP_DRIVER:
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 57af2c37f927..ffd7ad664921 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -798,10 +798,36 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>>   }
>>   ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>>   
>> +static void clean_svm_prefetch_op(struct xe_vma_op *op)
>> +{
> 
> Can we rename this with fini convention to match xe_vma_ops_fini?

Sure

> 
>> +	struct xe_vma *vma;
>> +
>> +	vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma)) {
>> +		xa_destroy(&op->prefetch_range.range);
>> +		op->prefetch_range.ranges_count = 0;
> 
> Do you need to set 'op->prefetch_range.ranges_count' to zero here.

Looks redundant.

> 
>> +	}
>> +}
>> +
>> +static void clean_svm_prefetch_in_vma_ops(struct xe_vma_ops *vops)
>> +{
> 
> Same here, fini convention?

Sure

> 
>> +	struct xe_vma_op *op;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
>> +		return;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		clean_svm_prefetch_op(op);
>> +	}
> 
> Brackets not needed.

Noted

> 
>> +}
>> +
>>   static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>>   {
>>   	int i;
>>   
>> +	clean_svm_prefetch_in_vma_ops(vops);
>> +
>>   	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>>   		kfree(vops->pt_update_ops[i].ops);
>>   }
>> @@ -2248,13 +2274,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>>   	return true;
>>   }
>>   
>> +static void clean_svm_prefetch_in_gpuva_ops(struct drm_gpuva_ops *ops)
>> +{
> 
> Same here, fini convention?
> 
>> +	struct drm_gpuva_op *__op;
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		clean_svm_prefetch_op(op);
>> +	}
>> +}
>> +
>>   /*
>>    * Create operations list from IOCTL arguments, setup operations fields so parse
>>    * and commit steps are decoupled from IOCTL arguments. This step can fail.
>>    */
>>   static struct drm_gpuva_ops *
>> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
>> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
>> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
>> +			 u64 addr, u64 range,
>>   			 u32 operation, u32 flags,
>>   			 u32 prefetch_region, u16 pat_index)
>>   {
>> @@ -2262,6 +2300,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   	struct drm_gpuva_ops *ops;
>>   	struct drm_gpuva_op *__op;
>>   	struct drm_gpuvm_bo *vm_bo;
>> +	u64 range_end = addr + range;
>>   	int err;
>>   
>>   	lockdep_assert_held_write(&vm->lock);
>> @@ -2323,14 +2362,61 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>>   			op->map.invalidate_on_bind =
>>   				__xe_vm_needs_clear_scratch_pages(vm, flags);
>>   		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
>> -			op->prefetch.region = prefetch_region;
>> -		}
>> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +
>> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
>> +				op->prefetch.region = prefetch_region;
>> +				break;
>> +			}
>>   
>> +			struct drm_gpusvm_ctx ctx = {
>> +			.read_only = xe_vma_read_only(vma),
>> +			.devmem_possible = IS_DGFX(vm->xe) &&
>> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
>> +						 SZ_64K : 0,
> 
> The alignment looks weird here.

Checkpatch confirms its good.

> 
> Also you don't techincally need to set check_pages_threshold here give
> this is used by get_pages which is not called here.

Thats true, will remove it

> 
>> +			};
>> +
>> +			op->prefetch_range.region = prefetch_region;
>> +			struct xe_svm_range *svm_range;
>> +			int i = 0;
> 
> I don't think you need 'i' here, you probably just can use xa_alloc
> rather than xa_store if use xe_for_each everywhere else.

Yes xa_alloc with xa_init_flags will be cleaner here. Will change

> 
> 
>> +
>> +			xa_init(&op->prefetch_range.range);
>> +			op->prefetch_range.ranges_count = 0;
>> +alloc_next_range:
>> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
>> +
> 
> I think you want to check if range has a mapping and is in preferred
> location, if it is then don't add to the xarray as no reason to try to
> migrate it or rebind the GPU pages.

Makes sense, will add a check here.

> 
>> +			if (PTR_ERR(svm_range) == -ENOENT)
>> +				break;
>> +
>> +			if (IS_ERR(svm_range)) {
>> +				err = PTR_ERR(svm_range);
>> +				goto unwind_prefetch_ops;
>> +			}
>> +
>> +			xa_store(&op->prefetch_range.range, i, svm_range, GFP_KERNEL);
>> +			op->prefetch_range.ranges_count++;
>> +			vops->flags |= XE_VMA_OPS_HAS_SVM_PREFETCH;
>> +
>> +			if (range_end > xe_svm_range_end(svm_range) &&
>> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
>> +				i++;
>> +				addr = xe_svm_range_end(svm_range);
>> +				goto alloc_next_range;
>> +			}
>> +		}
>>   		print_op(vm->xe, __op);
>>   	}
>>   
>>   	return ops;
>> +
>> +unwind_prefetch_ops:
>> +	clean_svm_prefetch_in_gpuva_ops(ops);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return ERR_PTR(err);
>>   }
>> +
>>   ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>>   
>>   static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>> @@ -2645,8 +2731,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>>   					return err;
>>   			}
>>   
>> -			if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			if (xe_vma_is_cpu_addr_mirror(vma))
>> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
>> +							      op->prefetch_range.ranges_count);
>> +			else
>>   				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
>> +
>>   			break;
>>   		default:
>>   			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
>> @@ -2772,6 +2862,58 @@ static int check_ufence(struct xe_vma *vma)
>>   	return 0;
>>   }
>>   
>> +static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>> +					 struct xe_vma_op *op)
>> +{
>> +	int err = 0;
>> +
>> +	if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> 
> 
> if (op->base.op != DRM_GPUVA_OP_PREFETCH || xe_vma_is_cpu_addr_mirror(vma))
> 	return 0;
> 
> Will help with spacing. Or do this check at the caller.
> 
>> +		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> +		struct drm_gpusvm_ctx ctx = {
>> +			.read_only = xe_vma_read_only(vma),
>> +			.devmem_possible = IS_DGFX(vm->xe) &&
>> +					   IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>> +			.check_pages_threshold = IS_DGFX(vm->xe) &&
>> +						 IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ?
>> +						 SZ_64K : 0,
>> +		};
>> +		struct xe_svm_range *svm_range;
>> +		struct xe_tile *tile;
>> +		u32 region;
>> +		int i;
>> +
>> +		if (!xe_vma_is_cpu_addr_mirror(vma))
>> +			return 0;
>> +
>> +		region = op->prefetch_range.region;
>> +
>> +		/* TODO: Threading the migration */
>> +		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
> 
> Again xa_for_each...
> 
>> +			svm_range = xa_load(&op->prefetch_range.range, i);
>> +			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>> +				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>> +				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>> +				if (err) {
>> +					drm_err(&vm->xe->drm, "VRAM allocation failed, can be retried from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
>> +						vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> 
> Not drm_err here, drm_dbg as user space can easily retrigger this.

Sure

> 
>> +					return -ENODATA;
> 
> So this gets squashed into return 0, which I think is correct for now.
> Same explaination as above wrt to error codes.
> 
>> +				}
>> +			}
>> +
>> +			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>> +			if (err) {
>> +				if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
>> +					err = -ENODATA;
>> +
>> +				drm_err(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
>> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> 
> Same as above.
> 
> We are going to want IGTs to test these error paths btw, issue prefetch
> then have another thread immediately touch some of the memory to abort
> the prefetch.

Sure will look into it.

> 
>> +				return err;
>> +			}
>> +		}
>> +	}
>> +	return err;
>> +}
>> +
>>   static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   			    struct xe_vma_op *op)
>>   {
>> @@ -2809,7 +2951,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	case DRM_GPUVA_OP_PREFETCH:
>>   	{
>>   		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>> -		u32 region = op->prefetch.region;
>> +		u32 region;
>> +
>> +		if (xe_vma_is_cpu_addr_mirror(vma))
>> +			region = op->prefetch_range.region;
>> +		else
>> +			region = op->prefetch.region;
>>   
>>   		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>>   
>> @@ -2828,6 +2975,23 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   	return err;
>>   }
>>   
>> +static int xe_vma_ops_execute_ready(struct xe_vm *vm, struct xe_vma_ops *vops)
>> +{
> 
> Let's make these names consistent.
> 
> How about...
> 
> s/xe_vma_ops_execute_ready/vm_bind_ioctl_ops_prefetch_ranges
> 
> s/prefetch_ranges_lock_and_prep/prefetch_ranges

Sure

> 
>> +	struct xe_vma_op *op;
>> +	int err;
>> +
>> +	if (!(vops->flags & XE_VMA_OPS_HAS_SVM_PREFETCH))
>> +		return 0;
>> +
>> +	list_for_each_entry(op, &vops->list, link) {
>> +		err = prefetch_ranges_lock_and_prep(vm, op);
>> +		if (err)
>> +			return err;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   					   struct xe_vm *vm,
>>   					   struct xe_vma_ops *vops)
>> @@ -2850,7 +3014,6 @@ static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>>   	    vm->xe->vm_inject_error_position == FORCE_OP_ERROR_LOCK)
>>   		return -ENOSPC;
>>   #endif
>> -
> 
> Look unrelated.
> 
> Matt
> 
>>   	return 0;
>>   }
>>   
>> @@ -3492,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>>   		u16 pat_index = bind_ops[i].pat_index;
>>   
>> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
>> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>>   						  addr, range, op, flags,
>>   						  prefetch_region, pat_index);
>>   		if (IS_ERR(ops[i])) {
>> @@ -3525,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>   	if (err)
>>   		goto unwind_ops;
>>   
>> +	err = xe_vma_ops_execute_ready(vm, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>>   	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>>   	if (IS_ERR(fence))
>>   		err = PTR_ERR(fence);
>> @@ -3594,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>>   
>>   	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>>   
>> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
>> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>>   				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>>   				       vm->xe->pat.idx[cache_lvl]);
>>   	if (IS_ERR(ops)) {
>> -- 
>> 2.34.1
>>

