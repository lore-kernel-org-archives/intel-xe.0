Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6890FC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A8F10E405;
	Mon,  9 Jun 2025 16:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITOV4syu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FE110E3E8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 16:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749485209; x=1781021209;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=0Qg5fny9HlmNXBQ0xl4gysNl6Dt7fpEZPXxeth66C80=;
 b=ITOV4syuZRlUC7qVDtOu5sWvgrK5qvQi8/cbd5XaMBbmGuFUl9pFlbfl
 K/Z5AuNMbXxBbELyaBT0xgxW95kOLu0XB4JSCh4k+2Q4bNQ5l7or9SVyk
 FRoOhQ2sEig64l4/G0Q0bbmreNTmRiw67ptPbq1eVorLOSEJ0YyGmt5gA
 yxj/AVEtB1xOEe7II8nAaM8lITbbXPk35PGsuuQkoxJYc1Qi27VCMaWF3
 U7hAEb2fgrpwtZeTezjzf421c0ECfSaTNCstJFoAqEUiGbESuMEYHBVK2
 wPdnHda4gVBcMX7hxuuOdmFOWKn9wgzOln9jFtlbQp5ePigyXowEhSIjw g==;
X-CSE-ConnectionGUID: IAl5zzIyRS2NnVBV28RGjA==
X-CSE-MsgGUID: EwZZrxUhR3+TgvtpKr+F5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="69015368"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="69015368"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:06:49 -0700
X-CSE-ConnectionGUID: KKfIx1oAQKWxuYjhRJ72QA==
X-CSE-MsgGUID: J9NFUbPhRwinbDczvlhF5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146477497"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:06:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:06:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:06:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:06:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVn+zIZsuY71YaYO7M9vBDqLA2pyBIDNy9Uh2XL/1ShnkoQtNTKTNqMSQLtEN7xpXh9ln4UlraV6f5SPOgYYqcAuaf9cot/WIcAs4SZKKMK2jtdKqtFHIs3OZUjGunKvU9MbAPiqmbO/NtDctJ60dgj0G6WHZrq+rtYDrJ2J/2ra7n0IRtmqzhiMdhaEk3Ro0cHTYwYkhklsQgWKZlcZnwTUuK2jsoJZjR4wCqBPAS+rCBC7TAD0Cgl7bGCEBIo3vJT06PnmLj/vnCaeQEjILzYhSMFVJcH+iokjFTsTCS4HEch0lGy3HJOKP6mSH4iVnzGKeFBZ3c7MVb/f4MeVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8rdoM8kgwGV9AGPBtN5cNJge2vjBLL/yKd9ZgXZ+Fk=;
 b=NCp8qCNbvzLoUFKnDS7EEQPXPF1711+lyHH0O9E+MLjsiglZxETuT7mvlfeV1VoGqaHFBG2oyi1pw4QhaJfHUGwNEtbS7TbmhKf4iMgrF1eLNwflpVOG44AkS4wlu0UdmUGvrkoo1b/b5eyS5xPUoT9wP3kNv4Nmb85taHyvpuaghhkvdO6ZyUqF1snQnwnX4Udrsy2khcn0FPnR/z1HAUvej+rXoirFYzeINbztcqlR23qPSSKFOrGzEg7s45UEYTZFQ+FZ+Q0K/XD8V9Dew/Ca+cy1iNBMc6ZoqV9wXhkX7ag20E26/l0emB/lZ7uxzzLtD3gdt8lekA16XCDhIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5290.namprd11.prod.outlook.com (2603:10b6:408:137::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 16:06:44 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 16:06:44 +0000
Date: Mon, 9 Jun 2025 09:08:18 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aEcG8m5W9M/8YEad@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
 <44e1ab5b-2e1a-4ab4-9de5-f57b0ea1fbb3@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44e1ab5b-2e1a-4ab4-9de5-f57b0ea1fbb3@intel.com>
X-ClientProxiedBy: MW4PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:303:8d::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5290:EE_
X-MS-Office365-Filtering-Correlation-Id: dd548073-facc-443f-b604-08dda76fa0d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REMwSHhmcFpvSFhTNHh6UWs2dnZ6OERHWmx1bHBWZnBDaE5MTXRseFF1bkU2?=
 =?utf-8?B?T0tzMzNXUVR2WmR1UFVLOXROT2ZQUTFMYUVLZTlyTmZSSVQ0RG1ZbGFsY3Ix?=
 =?utf-8?B?Q0cvd1dRb0VWZzNidTA4VytRdVVpWTNsS0tDaXZsMFNyWitURWZHZ3QyNG5i?=
 =?utf-8?B?K25YSjFRSEozU0VaZ24rWTNQc2VmQllaMkthTlhDNTNsVkJRenlveUkxcEZy?=
 =?utf-8?B?Yk1nSWUwbkdyYWdINkhZQXJXQVZ2VG1EUXNQVFVNaFdyY0l2RGNmT29PdFdm?=
 =?utf-8?B?K2Q1a0JpNkxIbDRDZkdOUHRwTlBrUU1QS2RIVHdJRlQ0ZlF4UmM5akh3Qjdm?=
 =?utf-8?B?R2tHTjhLQ2dhWlVJd2Z0dGRoNUtGdWpFNVVRVGtJUmREMFdhUTl1QUdmQjRF?=
 =?utf-8?B?blZLLytneTV6T3NreHg4RkkxanhJYjR6NFRPbi9rYjhqVXNtOEt0SVdaam43?=
 =?utf-8?B?TStIZkZaaG56T0k0ci9ZNW1YNzBNZS9ydXV6UExZNi9vcTRQSUpTeGttS2Qx?=
 =?utf-8?B?b0NobVRkT0FMaThxODljY1IrcGxVZFd5M21DREdkNUxGU1g4RE5QaUI1eDVM?=
 =?utf-8?B?TndXWEhzbjFoL3VhSFNwOWs0YktBK1pnVXRNeFo0c2svSldLUGdvWkg2NEtp?=
 =?utf-8?B?NG5NOXBwbTlaTUUxSUgvVVZIL0liYmxnWHY2S1NYVXc4b0pkK3FET1FNWks0?=
 =?utf-8?B?YlVVZ1hjTktkZWZqMzFkUTd0eXU0cUg0eUllMnRQKzRtcXZrN3FtWkRjendY?=
 =?utf-8?B?VDZVS3R6ZGZJN1BnZzVSWWh5bWI0eWxJSnBTMVhrV2N2YTVkUVBwbkQwNzZE?=
 =?utf-8?B?WFFFNndLLzRqY3VQY0VqQWhieWlKWHppbm9TdFVteDV2Umx2ZHJFY2VpRE84?=
 =?utf-8?B?djJVK1lwSTYzUUp2K0dsaFZrOExHQ3Q4ZVh6ZWpvUU44ZmdhWjhnODVHUkxw?=
 =?utf-8?B?MTVTOUhKWnl4YzJTN2lIVHNRVVUrK3JoVTB2eDhoYUNmMUJzV3hNd0E2bGZV?=
 =?utf-8?B?MjkrbDdzVVNnWDRmMzdReGljekhnTHpzcWUwRXVkSFY5ekp6NlhoUEd6d1ZK?=
 =?utf-8?B?VkNqc1FRajBCa2wzc2Z1eEJkajJ5WklMUVY5ZHFIR0I5RkovSXZ6RENCcTlk?=
 =?utf-8?B?ZXZvSHk3Zm45MDBEc1lETzJWUmFCanhOdmYxdzQ4Z0s3WkZxTVJ3UkJPR1FW?=
 =?utf-8?B?eHM2aFMzcnFFUG5LeXZybzRSTSs1OFY0ZFlQZUtsUzVXNG1YMW5vVWF6VVgv?=
 =?utf-8?B?Qnp1VWtlQUJDdmdKS3p6T0JNOGdtMWdWVEFSVjVZL3NVbHpsV1BVOCs0QXJV?=
 =?utf-8?B?VkpQazVxelJ3VS94Zk5GZzEwa0hkOTg0WW9sZ0w5VUtMVGgxV3p3QnBwblQ1?=
 =?utf-8?B?UDZla0F3SmhmVm93THZtN1BpZWc2ZUFkSWtpMzRMaXdUZkNjRi9ZM2pQM0l1?=
 =?utf-8?B?cXh3RUV0K3kzVnBVck5Sb3VyVVJEcmQ1WlI3ZmhQdTJYNlQ2TXpMUEY0RWc1?=
 =?utf-8?B?cTF3R0tpT0liRzdYWDQvb0krYXlxVGIwcWRhWjNoU0xCMUZzVUVGbU90UFRn?=
 =?utf-8?B?RXk5MTRPcHR2RGhXaWt1TzJ6K3NsVDZwTVF2c3dmaW51ejY0QnYzUDRLUUUw?=
 =?utf-8?B?M3hCWGYrWlVQekVGemdOdVhXZ1hpVzUrRDBnS01qRGl2VkgrcHE2N0ptMDYr?=
 =?utf-8?B?SDlBdWNCMEtNMlk5Uit5eEVaTWNLMWF0cGRGdU9Hc2VERmpxYUplOW9wbVQw?=
 =?utf-8?B?ZzhHM3RPYWl2Y0NETU5mdm1HNkZzZ1plQWEvK1dWL3ZRSjlrUlJtcEF6WEpR?=
 =?utf-8?B?RUNWVXc2aks0YWFkY0dteHlZZlNrVjA1RW9VcTl5SldnL1gwRzZLRmNINVBo?=
 =?utf-8?B?Z0xxNFFqOTVlYVBkNFhtTENYaWpBcXFYQzlZMTVUVHQ2RHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N05GQTlrUnh0K2NpUk84TlM2NUNTV0wwK3hnVmZvMjZWbHZ2N2xqK1dDdENN?=
 =?utf-8?B?SWRQRnB3OURCTUQvWGZCRHNaTVROVGRUOVMzUkUwZnVUcmxPaElaR2l3NGYy?=
 =?utf-8?B?MWV4TnM0Qktham4xdm9WWEt6VkI3UkxQUUZrSG4zcWVjK05TNzZBV3kvWWpF?=
 =?utf-8?B?Um10NFpnWEYzbkludGp6UEg0c2RQaHFvV1lnUW1RMng0TDdKVW5OUDJRSDNO?=
 =?utf-8?B?RmJyRXVNdWhJTkt5T0FjUU9FQVhQYmJMQjRERUpwdFgyL2FhVldhSlZCUE5C?=
 =?utf-8?B?V1NtMjhEem5UOHFCVjZzL2tzZ0VUTHRVUkpoWFNvTE1Nc3FsQjc5WGdvYkZI?=
 =?utf-8?B?WWFvV0kvelAwaysrNUhHNHdac1llVkd2eWp2V3JiR2djREpoU1YxTUxWU0c2?=
 =?utf-8?B?dkp1ekRIUHdaQlcrRmlPTEp2bWdmNlRCYm9pOURaVEl1RFdibEhJaEplSDVH?=
 =?utf-8?B?ZUQzeEhiMVhPenZReUFBNUpJQzAzd1BUWkR1SkoyUlhXdEZ5L2d5TXhWaFdy?=
 =?utf-8?B?V3M5cW1QOXhQdDU4MFVkVXQxa2I4YXcxU1VQWjNPSCtrK3NPSHR3SDgvaUhM?=
 =?utf-8?B?UGlIRlY3ZUFFK3FYNUJYZktnU3VZOGFrOElnMXR6RVZIeEkvRWJQZkVjN2RR?=
 =?utf-8?B?WlRuTWlLd2R4UE9GREpzY3V1V1FIeC9nbUZ2STdKNzd1WjRNTjZGVFNJUUxp?=
 =?utf-8?B?bjJheDlram5uZExFRDdjcnlmRU9qNnBsQ0pocytvb3hCZVVSY212c2hQOWZ3?=
 =?utf-8?B?V1dnbWdJK040THEyLzVyNkN5UEpraXI3Y0RlT2ZRMU1JcVlHNVFpM1FPbWNu?=
 =?utf-8?B?K3NJWWVZQjhTMWpWekx0R3lyS2xJb05kdGZib3VnN1l2Q2NpSG5JQU1QQzNF?=
 =?utf-8?B?b0U4RG5USnJWS2UrU21xZTM0YU95Z1drb0lzMk5JNEtxNnhaelE2VklQN1hI?=
 =?utf-8?B?WEY5UUs0clFnR0JQZTlCWHB1VWp0SGlyWFVSRzlIUlE5SGV0MWF2NCs1c1VE?=
 =?utf-8?B?aytuMnFNRnlZRHY1N2psY0doL1NJNUtaS2tDblJWMTRvQ1BEb3RuQTVhVGtL?=
 =?utf-8?B?RG1wckRma1RuMXdlMW9pVXJCRWZTUU83eGFURzRLUS81WEZmME9URjFHZmRC?=
 =?utf-8?B?MHg4MEdUOFZRb25yK3FwUTBPSXVDckIybFg2eENWQjBNZEU4NDZ5N0JxRjRY?=
 =?utf-8?B?dUVEU3Y2bTI3Q0czWCtKMDdLUzBFWHBlU25GblpwZmVlS0JOdTh1TUl3QjFK?=
 =?utf-8?B?NGl2QjVzSGFhTUR6cm1EWGRtdVJpaUp1WWtndThpMVdWOG1YdzdDa2JDcjM5?=
 =?utf-8?B?R0oyQ1pZRzhkQlB4cS85SlNVbkszWjk2cnU3QWx3TzN3Sk9VdzZrQTZKM0RN?=
 =?utf-8?B?U2xPYkd3RzZDNzVpQkF4c0ZKSUY0cnlvMTJlejlQWkJEK3hZOVRZRjBGWGhQ?=
 =?utf-8?B?RUl6dzNoY1ArZ3lxUjRRem80U29iVkxaUXdNYTRlQkhIb0NTQnFrVktWVVZZ?=
 =?utf-8?B?aFhJL1puL0JFemJ3Q2xqY1E2Y2FEVW9tTjN2WFgvcWdtV0RxWU95VzZONGpQ?=
 =?utf-8?B?N24rQXgxSEF3dUczRmdSNEVTTmRiTTdqNFIvM2E0bjN3aWFJak1sSUNoQTJx?=
 =?utf-8?B?SmNUU3ZUNDl5SktVc0tlUnRxQXp0UENPR0xzYld4NTMzS0JvbFU0aCszbmd1?=
 =?utf-8?B?OUsxY3ZOdE5xaGVJVTRNQmRna0NOSjVZYXJSLzMwT0MwbFZSWnVjT0ovOHdv?=
 =?utf-8?B?SHc0NSs2ek0zWjZ5enlXS2tyTUdtb1ZpVUpqbHcvTmpBSG9GdGgrTXF2T21r?=
 =?utf-8?B?TFA3blVCSDQ2L0hzanhWMFZkN1dLZTh3bzRNZGxyK004S2lTbDh2eEJuY0RS?=
 =?utf-8?B?U3lnd2VuYzhJQVJFTkVhZzE3L0VncHNPV05taWVZQjVtcCtQSTlrK2c1NnNr?=
 =?utf-8?B?VFYycXRFNUpoYjlxQk1TT3ZkRlNqWCs4aVEzSlJDMlRFTzZMZjU4YlJRT3cr?=
 =?utf-8?B?T0Y5YVJjaHpUWm1sTEpDZU1Ra0hHRWhFVWh5MlQ1K2J1dm83d21KeUtDbVRp?=
 =?utf-8?B?U1hmSE9vVlRybm83RUhxYnd5c2wyak1mOFNGZitMUUYySGFvUjgxV3Vra0Yx?=
 =?utf-8?B?anQ4VmhrTURYQUlZNWV2bVRxVjNFRTRlbU92RlFVditDMWJSN2lxZHpmZkVE?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd548073-facc-443f-b604-08dda76fa0d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 16:06:44.0069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/1m2XEGC98k3ixyotYXEjK5yVokZdl6Suvuh2H/viM7sE1w4SRqXS9aUcILn7P8yAOJ6Xw38XA7FWyz3zhxUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5290
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

On Mon, Jun 09, 2025 at 02:39:27PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 06.06.2025 14:45, Satyanarayana K V P wrote:
> > Create two LRCs to handle CCS meta data read / write from CCS pool in the
> > VM. Read context is used to hold GPU instructions to be executed at save
> > time and write context is used to hold GPU instructions to be executed at
> > the restore time.
> > 
> > Allocate batch buffer pool using suballocator for both read and write
> > contexts.
> > 
> > Migration framework is reused to create LRCAs for read and write.
> > 
> > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > ---
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Tomasz Lis <tomasz.lis@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > 
> > V5 -> V6:
> > - Added id field in the xe_tile_vf_ccs structure for self identification.
> > 
> > V4 -> V5:
> > - Modified read/write contexts to enums from #defines (Matthew Brost).
> > - The CCS BB pool size is calculated based on the system memory size (Michal
> >   Wajdeczko & Matthew Brost).
> > 
> > V3 -> V4:
> > - Fixed issues reported by patchworks.
> > 
> > V2 -> V3:
> > - Added new variable which denotes the initialization of contexts.
> > 
> > V1 -> V2:
> > - Fixed review comments.
> > ---
> >  drivers/gpu/drm/xe/Makefile                |   1 +
> >  drivers/gpu/drm/xe/xe_device.c             |   4 +
> >  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
> >  drivers/gpu/drm/xe/xe_sriov.c              |  19 +++
> >  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
> >  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 186 +++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
> >  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  46 +++++
> >  10 files changed, 315 insertions(+)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index f5f5775acdc0..3b5241937742 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -140,6 +140,7 @@ xe-y += \
> >  	xe_memirq.o \
> >  	xe_sriov.o \
> >  	xe_sriov_vf.o \
> > +	xe_sriov_vf_ccs.o \
> >  	xe_tile_sriov_vf.o
> >  
> >  xe-$(CONFIG_PCI_IOV) += \
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > index 660b0c5126dc..bf96045770c7 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -925,6 +925,10 @@ int xe_device_probe(struct xe_device *xe)
> >  
> >  	xe_vsec_init(xe);
> >  
> > +	err = xe_sriov_late_init(xe);
> > +	if (err)
> > +		goto err_unregister_display;
> > +
> >  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
> >  
> >  err_unregister_display:
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index ac27389ccb8b..caf3bb1ef048 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -22,6 +22,7 @@
> >  #include "xe_pmu_types.h"
> >  #include "xe_pt_types.h"
> >  #include "xe_sriov_types.h"
> > +#include "xe_sriov_vf_ccs_types.h"
> >  #include "xe_step_types.h"
> >  #include "xe_survivability_mode_types.h"
> >  #include "xe_ttm_vram_mgr_types.h"
> > @@ -234,6 +235,9 @@ struct xe_tile {
> >  		struct {
> >  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> >  			struct xe_ggtt_node *ggtt_balloon[2];
> > +
> > +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> > +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
> >  		} vf;
> >  	} sriov;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 848618acdca8..2c6d757db810 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
> >  	return 0;
> >  }
> >  
> > +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> > +{
> > +	struct xe_tile *tile = gt_to_tile(gt);
> > +	struct xe_sa_manager *bb_pool;
> > +	int ctx_id;
> > +
> > +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> > +		return 0;
> > +
> > +	xe_pm_runtime_get(gt_to_xe(gt));
> > +
> > +	for_each_ccs_rw_ctx(ctx_id) {
> > +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> > +		drm_printf(p, "-------------------------\n");
> > +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> > +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> > +		drm_puts(p, "\n");
> > +	}
> > +
> > +	xe_pm_runtime_put(gt_to_xe(gt));
> > +
> > +	return 0;
> > +}
> > +
> >  static int topology(struct xe_gt *gt, struct drm_printer *p)
> >  {
> >  	xe_pm_runtime_get(gt_to_xe(gt));
> > @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
> >  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
> >  };
> >  
> > +/*
> > + * only for GT debugfs files which are valid on VF. Not valid on PF.
> > + */
> > +static const struct drm_info_list vf_only_debugfs_list[] = {
> > +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> > +};
> > +
> >  /* everything else should be added here */
> >  static const struct drm_info_list pf_only_debugfs_list[] = {
> >  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> > @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
> >  		drm_debugfs_create_files(pf_only_debugfs_list,
> >  					 ARRAY_SIZE(pf_only_debugfs_list),
> >  					 root, minor);
> > +	else
> > +		drm_debugfs_create_files(vf_only_debugfs_list,
> > +					 ARRAY_SIZE(vf_only_debugfs_list),
> > +					 root, minor);
> > +
> >  
> >  	xe_uc_debugfs_register(&gt->uc, root);
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> > index a0eab44c0e76..87911fb4eea7 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_vf.h"
> > +#include "xe_sriov_vf_ccs.h"
> >  
> >  /**
> >   * xe_sriov_mode_to_string - Convert enum value to string.
> > @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
> >  		strscpy(buf, "PF", size);
> >  	return buf;
> >  }
> > +
> > +/**
> > + * xe_sriov_late_init() - SR-IOV late initialization functions.
> > + * @xe: the &xe_device to initialize
> > + *
> > + * On VF this function will initialize code for CCS migration.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_late_init(struct xe_device *xe)
> > +{
> > +	int err = 0;
> > +
> > +	if (IS_VF_CCS_INIT_NEEDED(xe))
> > +		err = xe_sriov_vf_ccs_init(xe);
> > +
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> > index 688fbabf08f1..0e0c1abf2d14 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov.h
> > @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
> >  void xe_sriov_probe_early(struct xe_device *xe);
> >  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
> >  int xe_sriov_init(struct xe_device *xe);
> > +int xe_sriov_late_init(struct xe_device *xe);
> >  
> >  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> > index ca94382a721e..8abfdb2c5ead 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> > @@ -71,6 +71,11 @@ struct xe_device_vf {
> >  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
> >  		unsigned long gt_flags;
> >  	} migration;
> > +
> > +	struct {
> > +		/** @initialized: Initilalization of vf ccs is completed or not */
> > +		bool initialized;
> > +	} ccs;
> >  };
> >  
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > new file mode 100644
> > index 000000000000..41fe1f59e0e9
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> > @@ -0,0 +1,186 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "instructions/xe_mi_commands.h"
> > +#include "instructions/xe_gpu_commands.h"
> > +#include "xe_bo.h"
> > +#include "xe_device.h"
> > +#include "xe_migrate.h"
> > +#include "xe_sa.h"
> > +#include "xe_sriov_printk.h"
> > +#include "xe_sriov_vf_ccs.h"
> > +#include "xe_sriov_vf_ccs_types.h"
> > +
> > +/**
> > + * DOC: VF save/restore of compression Meta Data
> > + *
> > + * VF KMD registers two special contexts/LRCAs.
> > + *
> > + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> > + * compression control surface (Aka CCS) save in regular System memory in VM.
> > + *
> > + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> > + * compression control surface (Aka CCS) Restore from regular System memory in
> > + * VM to corresponding CCS pool.
> > + *
> > + * Below diagram explain steps needed for VF save/Restore of compression Meta
> > + * Data::
> 
> nit: this last word likely can be part of prev line
> 
> > + *
> > + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> > + *     LRCA        LRCA
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |     Create Save LRCA            |                              |         |
> > + *     [ ]<----------------------------- [ ]                             |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |   Register LRCA with Guc     |         |
> > + *      |           |                    [ ]--------------------------->[ ]        |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           | Create restore LRCA |                              |         |
> > + *      |          [ ]<------------------[ ]                             |         |
> 
> don't we need to register in GuC this 'restore' LRCA ?
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                    [ ]-----------------------      |         |
> > + *      |           |                    [ ]  Allocate main memory |     |         |
> > + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> > + *      |           |                    [ ]<----------------------      |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      | Update Main memory & CCS pages  |                              |         |
> > + *      |   PPGTT + BB cmds to save       |                              |         |
> > + *     [ ]<------------------------------[ ]                             |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           | Update Main memory  |                              |         |
> > + *      |           | & CCS pages PPGTT + |                              |         |
> > + *      |           | BB cms to restore   |                              |         |
> 
> typo: cms
> 
> > + *      |          [ ]<------------------[ ]                             |         |
> 
> those above updates are happening as part of BO allocations sequence,
> likely depicted as above 'allocate' box - so shouldn't it be drawn as such?
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                   VF Pause                         |         |
> 
> this is out of VF control, so maybe
> 
>            :           :                                            :
>        ------------------------  VF Paused -----------------------------
> 
> 
> > + *      |           |                     |                              |Schedule |
> > + *      |           |                     |                              |CCS Save |
> > + *      |           |                     |                              | LRCA    |
> > + *      |           |                     |                             [ ]------>[ ]
> 
> shouldn't we also have arrow from HW to save-LRCA?
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                   VF Restore                       |         |
> 
> and
> 
>        ------------------------  VF Resumed ---------------------------
>            :           :                                            :
> 
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                    [ ]--------------               |         |
> > + *      |           |                    [ ] Fix up GGTT  |              |         |
> > + *      |           |                    [ ]<-------------               |         |
> 
> what about showing RESFIX_DONE notification to GuC here ?
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |Schedule |
> > + *      |           |                     |                              |CCS      |
> > + *      |           |                     |                              |Restore  |
> > + *      |           |                     |                              |LRCA     |
> > + *      |           |                     |                             [ ]------>[ ]
> 
> shouldn't we also have arrow from HW to restore-LRCA?
> 
> > + *      |           |                     |                              |         |
> > + *      |           |                     |                              |         |
> 
> btw, I assume this 'restore' job is happening as part of the RESFIX_DONE
> message processing so return arrow will fit here as well
> 
> > + *
> > + */
> > +
> > +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> > +{
> > +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> > +	struct sysinfo si;
> > +
> > +	si_meminfo(&si);
> > +	sys_mem_size = si.totalram * si.mem_unit;
> > +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> > +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> > +
> > +	/**
> > +	 * We need below BB size to hold PTE mappings and some DWs for copy
> > +	 * command. In reality, we need space for many copy commands. So, let
> > +	 * us allocate double the calculated size which is enough to holds GPU
> > +	 * instructions for the whole region.
> > +	 */
> > +	bb_pool_size = ptes * sizeof(u32);
> > +
> > +	return round_up(bb_pool_size * 2, SZ_1M);
> > +}
> > +
> > +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> > +{
> > +	struct xe_device *xe = tile_to_xe(tile);
> > +	struct xe_sa_manager *sa_manager;
> > +	u64 bb_pool_size;
> > +	int offset, err;
> > +
> > +	bb_pool_size = get_ccs_bb_pool_size(xe);
> > +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> > +		      ctx->id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> > +
> > +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> > +
> > +	if (IS_ERR(sa_manager)) {
> > +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> > +			     sa_manager);
> > +		err = PTR_ERR(sa_manager);
> > +		return err;
> > +	}
> > +
> > +	offset = 0;
> > +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> > +		      bb_pool_size);
> > +
> > +	offset = bb_pool_size - sizeof(u32);
> > +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> > +
> > +	ctx->mem.ccs_bb_pool = sa_manager;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> > + * @xe: the &xe_device to start recovery on
> > + *
> > + * This function shall be called only by VF. It initializes
> > + * LRCA and suballocator needed for CCS save & restore.
> > + *
> > + * Return: 0 on success. Negative error code on failure.
> > + */
> > +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> > +{
> > +	struct xe_migrate *migrate;
> > +	struct xe_tile_vf_ccs *ctx;
> > +	struct xe_tile *tile;
> > +	int tile_id, ctx_id;
> > +	int err = 0;
> > +
> > +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> > +		       xe_device_has_flat_ccs(xe)));
> 
> make it as 3x separate asserts to clearly see which one will eventually
> fire (and to make then logical AND condition)
> 
> > +
> > +	for_each_tile(tile, xe, tile_id) {
> > +		for_each_ccs_rw_ctx(ctx_id) {
> > +			ctx = &tile->sriov.vf.ccs[ctx_id];
> > +			ctx->id = ctx_id;
> > +
> > +			migrate = xe_migrate_init(tile);
> > +			if (IS_ERR(migrate)) {
> > +				err = PTR_ERR(migrate);
> > +				goto err_ret;
> > +			}
> > +			ctx->migrate = migrate;
> > +
> > +			err = alloc_bb_pool(tile, ctx);
> > +			if (err)
> > +				goto err_ret;
> > +		}
> > +	}
> > +
> > +	xe->sriov.vf.ccs.initialized = 1;
> > +
> > +	return 0;
> > +
> > +err_ret:
> > +	return err;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > new file mode 100644
> > index 000000000000..5df9ba028d14
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_VF_CCS_H_
> > +#define _XE_SRIOV_VF_CCS_H_
> > +
> > +struct xe_device;
> > +
> > +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > new file mode 100644
> > index 000000000000..f67f002c7a96
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> > @@ -0,0 +1,46 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2022-2023 Intel Corporation
> 
> 2025
> 
> > + */
> > +
> > +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> > +#define _XE_SRIOV_VF_CCS__TYPES_H_
> 
> _XE_SRIOV_VF_CCS_TYPES_H_
> 
> > +
> > +#define for_each_ccs_rw_ctx(id__) \
> > +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> > +
> > +#define IS_VF_CCS_READY(xe) ({ \
> > +		struct xe_device *___xe = (xe); \
> > +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> > +		___xe->sriov.vf.ccs.initialized; \
> > +		})
> > +
> > +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> > +		struct xe_device *___xe = (xe); \
> > +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> > +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> > +		})
> > +
> > +enum xe_sriov_vf_ccs_rw_ctxs {
> > +	XE_SRIOV_VF_CCS_RW_MIN_CTXS = 0,
> > +	XE_SRIOV_VF_CCS_READ_CTX = XE_SRIOV_VF_CCS_RW_MIN_CTXS,
> > +	XE_SRIOV_VF_CCS_WRITE_CTX,
> > +	XE_SRIOV_VF_CCS_RW_MAX_CTXS
> 
> if we need just READ and WRITE then maybe we can use existing
> definitions from <linux/kernel.h>
> 

This seems like not such a great idea.

> > +};
> > +
> > +struct xe_migrate;
> > +struct xe_sa_manager;
> > +
> > +struct xe_tile_vf_ccs {
> > +	/** @id: Id to which context it belongs to */
> 
> did you mean GuC context id here?
> if yes then maybe name it as guc_id as done elsewhere?
>

It is ctx_id, I suggested s/id/ctx_id/ for consistency.

Matt
 
> > +	int id;
> > +	/** @migrate: Migration helper for save/restore of CCS data */
> > +	struct xe_migrate *migrate;
> > +
> > +	struct {
> > +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> > +		struct xe_sa_manager *ccs_bb_pool;
> > +	} mem;
> > +};
> > +
> > +#endif
> 
