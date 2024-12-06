Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30697E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 07:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07710E5F6;
	Fri,  6 Dec 2024 07:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRA49arm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322C110E5F6
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 07:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733470807; x=1765006807;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=iYSDim8q8xeobhFfJnMOX2jSvazbbNSwwV/2wIkdmaQ=;
 b=jRA49arm9W7g/mhaxR1OBzBqWsZHWjbb1RuSk0VEKZ1sVbqv4ISKdZZp
 u4ORbXXZI+oG8QV3JIvA2rJ1q/nf1wl9SI9hvT2ER/1tdgFFgUXDSqDkE
 Nm1azkjVe6sHluy9N2faz/g5llPS22O8XiuHWFY+mWShooRKrkTTJA1V/
 1N7aqWyhxyF7KWZ35BKRzfIWPjdiQBAc4GJCnQxdKJn9ZwU+gp0P+7h5q
 aZzgY1uQEn12JSN2ppk08mBbTEYpSAY+TrH0xB+WE2X7JkRzvCzsEHqGt
 0dHdP1HKrfVe8xJKkgh/GiMwt4r63ZQekkMLr1DCWUJbVWOG58XKaDRHF Q==;
X-CSE-ConnectionGUID: FQvkph9OTnSk8dxRELwVnQ==
X-CSE-MsgGUID: eLarx24aRvi+0Rls4F+fgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="59215936"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="59215936"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 23:40:06 -0800
X-CSE-ConnectionGUID: GaKrVRq3Q3GTXLNbCeQprA==
X-CSE-MsgGUID: ObV/aF+/Q6mRQgeR/BMnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94406469"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 23:40:05 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 23:40:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 23:40:04 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 23:40:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VofmQ/qMkQ/+tX8faKBf3phqdZL3oQHn4GwLqsscPqvNKjxec+TcoRoUMLaFWfZg9TCk/PSpnW6ijfoNEQPriAMrJwgUqU2hEbvh0PT2yJz0Hre/Zpfcm5bLSBTzwIwAuZaxxit84E0CkROY3e7WrqUMNuoZbmYyJ4GpqnQ3sIqmomxjeiJx3rzm8yeobBZuz3htthRlkVSaIk7NvY20HHJn019tI/2iFl9NbK0tfHD/7ksu2ZHTX86HU2BDvCRoAFh3fV8FHnrKz48D4BFyrY6bQ7IxfcYQUwyl8ruM1Z+EEqQx3ft28BI+2ZLpQ2DoTJtkbuu1zptnAQehiPd3UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo6Wd9knlMwic97D7CiuH4R5af98Fu4k7uxy6Z14FZE=;
 b=PHFnVvg8jO4e8Tg7jzLG6fT2b1RiAkl5FKeQyaEViD3ZUc2PR5CMOc8yLU0zN9dhcogNDlPSLiU95NbjZEM6YtiTz5WKxH3NWA+swJpi6MfbL7RVLocqmZaXh79rDEOanGlL5obp6r/IK0toRfAknQVt+M9CZtkZJD5i1/5uAjemLvpRaxiRD1LRcKkuz2jADhTG6KCm53ahdWnIfsRFYBuFMRyGRtRHGl8lddTMfwvn50ayYJGkYos6kRGvyZv9eVBsdT/EbDEASX+GoSu1ofFZT9Kh35W0pp4UKzw4aa4CfswZQFaydxBII4OeqHw1QTjlpU5b5U4PNZyeZjNbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7622.namprd11.prod.outlook.com (2603:10b6:8:144::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 07:39:57 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 07:39:56 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v1 0/1] drm/xe/pf: Use an explicit check to see if the device
 has LMTT
Date: Fri, 6 Dec 2024 08:39:47 +0100
Message-ID: <20241206073948.870892-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::21) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: b23962a2-703c-4b2f-fa0c-08dd15c92e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmZQT2I5dEh6UWUvUGdiTUMzZzQwQ21rOExiUTVMLzZzNmF3ZzBpbWo0Vnor?=
 =?utf-8?B?aGZRWStPMFdhdjRoV3VHK2tkK1RzMmRWZWFhditoeWY1NlIvbHQ5ZGJvUm56?=
 =?utf-8?B?YVppaGZTVUhoY3NrQnJJdWdyT0MzY3M0Tkg5d0Y3UW55VGYza1RDUDFwemMx?=
 =?utf-8?B?dTlDenRvZFFqYlNpbXg5N01tMENZVzRyTmVUS0dEU3MyY1BRR2RYRklia3N6?=
 =?utf-8?B?MWU3akFMQmpuc3BzdWRUbkxSb1ViYytQUjU0MmMzbkNhM0ljNlVWUHBYVmZ4?=
 =?utf-8?B?b0ZDWXpqZFZVcFlyVTZVSUEvb2Yzc1IxT2QwQS81UTFNRlR2Zno1V1V4cCt6?=
 =?utf-8?B?WURpTUJsS0NXcnVRVzV2bzFXZ0JRNlFHU3FyZlpNc2o0UWZZeHJwclYzTXFG?=
 =?utf-8?B?Z2ZQTFRKQ0FtYnRGRnMrSmJMYjMxUXMyMUVuUFcxdEhhdmgyZ0Y5M3c0Q2Rz?=
 =?utf-8?B?Q1lRbngyOGZiVUhMbHpKUDdsd21FVWh3V1lmbmdDNEFJVU1Qbnd4Z1FFa2Qz?=
 =?utf-8?B?ckQ4b1g5UXl6RHZ1U1YxMXFXbmgvREduQXRVQkZXcUU3aHQ0ZUdJV1drQUxN?=
 =?utf-8?B?TGRodXBBWFgrbjQzOHNSa2VtTk8wMWkvL2xlUUlNTTJoT2ZpRS8zS3dxdTJZ?=
 =?utf-8?B?bWJ3cE1HVnBrNU1PMWRnM3RsRzRTK0Y5b0dpRER5cmNvNTJNTkJ1QXc4bFB0?=
 =?utf-8?B?V0dQZkh3dDk0OXh6U3V0WFlUQktDMVRHc094VzlHVmZIRnpUQ0VRSXpZcjdx?=
 =?utf-8?B?Zm43UDBqazNRdEcrSFdoMEROWnVQNjN3YW5XbG5leUEwcHpRdm5xN1d2OWVl?=
 =?utf-8?B?cWE4a2JhSVltTGFXMlZxOUZ2dWJSZnd6M1pYQUpwV3FjUGlNV1lVRysxTVBI?=
 =?utf-8?B?S0wybEc2dStkOGt6N0p5RkZFQVlZTmlFelZIcldDaFNsOGlCZ09sRVN0WXhk?=
 =?utf-8?B?UG84dlF6TkdtcFphSGdZY2ZOd0kwRlZHRHFLbkZFNTFYamgyTkJ6c3ZodVV4?=
 =?utf-8?B?UWhhL2ZCa05UVmlWdy9Zd1NMQkpuSCtBTTExZkJMYW9TMkZZNXBSTFNENmVU?=
 =?utf-8?B?OHNSelJQeTdSdWV6bmsxeStUbWlXa2NLTzBmbEQvNVZVZCtWV2ZDZWhnUG5i?=
 =?utf-8?B?M3Y2MlFSalRRWXBEZXN3V3ZNb091bXBkN3JUUUJ6clloMXgwQm1vR2RGM1hu?=
 =?utf-8?B?dzdpWEpxSlFsOFA4TkJzWWVBVEFmUzhERXRuWWcrbnRSU3hQYXdlRXhKbmpi?=
 =?utf-8?B?U01rKzhQZWpINWZQVDZGMGo3bDViaGhLbnpDeExZYVRwYmFmTlEycFNaTE1V?=
 =?utf-8?B?MXVDZUp2S05rNS9qTlc5cnIydGhBUVg2SEErT3NPZmpnV1o3N2ZFYUJqRk14?=
 =?utf-8?B?TG5Ka0dGN2VqcXh4clQ4VE1lQjhYdVhZNUFBblBDWERzcGtwQjZHN1dlNnRM?=
 =?utf-8?B?dlQydFhoK0dWRUt2T3poSVZuZkpRTGNZcnlLazNPdWE3VkdVVTFuVm52M0dH?=
 =?utf-8?B?N29tRHhCYVdFdmJlMThGRXhpYllkZjBYYnRLaUl3WW9wSlRCdzZMZTVyZHZM?=
 =?utf-8?B?bTR0MExVUzNkenBGMHgxb2xvV3QzeHpBUzJlQTQ3N01MbXdGWGE3c3ZpZ0VD?=
 =?utf-8?B?TkNZYTBTTkoyWExkaXRmZE14OWIvcHVyNU8xWGhHeXF0VzlBazRFbEZERlpY?=
 =?utf-8?B?OEk2WEo2eXdDSWdyMXYvQ280T0dmNGxpOUNuMXhYQTBuOW5hZ0pXMnhKeStp?=
 =?utf-8?B?dWp1OGdYekdhVTJpdEpZTHVHK0dKZGFqeXdQbzg1NGJFcmZkVStYZTk5dmFn?=
 =?utf-8?B?QzNzbndTNVdqRlNJNGdoZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDdUZnFSYXZCUTcrU1JXUFZmWnVGeXgrOXhGbUhWRWFlUUNSV2U4cE5McXBj?=
 =?utf-8?B?SVZ4c1JmZE9PaUVIQ0c2L1BMUDh4K1pkSUxDZ280eHNwd3R0c1QwVGZTZ2Fz?=
 =?utf-8?B?V1FESmlUQzErUHhRa01ENUVyemRTVU9iU3E1RVR6aWVpRWFPWFYxbmQwQlhv?=
 =?utf-8?B?OGV1eGtRb2VwUHozZEp5Zmc4Uzg5SDBaVzAxY202elJsWk5wRTRvK0c4SEVu?=
 =?utf-8?B?amt4Q2VoOVFkdVc2T0JWVHdoUUU0aWNlMEoxK0hSSW9pK2NqTEpzTXRwVjd5?=
 =?utf-8?B?dWliWndBcDdwSGlsYUR0TTFCaERsb3V4M0tHRzI0YytNSWpLMEpEMC9laFVS?=
 =?utf-8?B?a3BwRzdKVFlzelJNUUt3TFo4SmRUSko1Q0VMbFRPalIxRGkwQkVrYTl3aXg0?=
 =?utf-8?B?djBsajZYbHZWWkVXZVBnRU1YUHd1SllWSk9FS2ltVjRFeUJEdERPMXhxUmpB?=
 =?utf-8?B?azJZbkZTRGNUekJWZWxSTWNubnZrWmUzd0NwUDFWampKOU5tdndNMXgvS01n?=
 =?utf-8?B?dmJ0dlFCWmhxYW56eTEzRktGcHFZYW9WaDViWnFDS2trM3djMVU4Z1BGcGpl?=
 =?utf-8?B?TnZBL3JBT0VWZ0x1Z1RDcE8vanFJa1pVQU43VEtFYlR2eC94bEtvbDFObFhS?=
 =?utf-8?B?SldUQU5rd3RjUWRtOEM4QjlENEZDaWp0aCtGeUJGTE04Q0grOVpUNHRZTTUw?=
 =?utf-8?B?aWNSMWNtYUVza2tDOWxTeTRPMWFYWlVVTEZSc0xsb3Q5enh2VWQ0cDkzaldO?=
 =?utf-8?B?b2NmWjRib09Kc0ludzh2cU96RlYzR2d0MGVvYUU2eXd5ZkJtWHBPMUwyYjFZ?=
 =?utf-8?B?dlJ5WEw2RFdMSGdTN2NpWDh2czRhSXluZUVpMnQvcDAxdm0wdDh0bDdKbjBw?=
 =?utf-8?B?bU0rdVNPVytvTTVZYlB4SHdueE8zNG1SYWF2SFRicExXTE1NMWkzS1R3a1Vh?=
 =?utf-8?B?dWRmMnZjaTFuaFZROHNNMGJyMEVDMWU0dFNqem1BTFJFV1p1akRpRXFSZXMw?=
 =?utf-8?B?bG9icXVUVi80MHFzMzBiaXN3c0lFNlNwZThvYll4VHo3eVBGbHNDLzUybjJW?=
 =?utf-8?B?ajFUSkxKVGxOTWFCSm0wNEIreHBFd2NiSlZ3amhRME1QeEFnYy9PbFM4eWt2?=
 =?utf-8?B?YkJTK2FNcU9udFVFMEZpSGVzN2t1elJkdHFhZjE0b0h4QTJtK0d0dTJGZnhQ?=
 =?utf-8?B?UWZoODZQbC85RFY5ckN5cjMvYmtCTkZSNHZjOGQwdDA2aGpUTEgrN0J2RDh3?=
 =?utf-8?B?YXhLVVZZQURNWndzdlZSSkJuL2VyNG9XVkV0UWkybmtEKzBuYnBPSUgrQ1Jv?=
 =?utf-8?B?dzZtc0wrU09WZDRDNUhTY3p0SU1JNFllYnNVWlZaMW1ka2k4NGxoaXM1ME9D?=
 =?utf-8?B?cGZvOHBiRnRaMjZua3M0L2NvOW0xajFSWGtXNEVPMERaeGhMUzVVQ29qTEYr?=
 =?utf-8?B?L056a0NzVlYxRlpsY3I5NXFEbDFSellOSys0dXdXY0ovWU9lOVdOdWpQN0RI?=
 =?utf-8?B?THcvSWl4NHhZdDFZT3BEMkZJYWgyaWx2SGp3NW1mM0Z5L2pMcWUwNUxSUkFC?=
 =?utf-8?B?OVU3cFBtbkxrWnBVa2pvRERjenlwL012NXd1SVBjSTRqdGkvL0FKRkdoR08x?=
 =?utf-8?B?cEdtNGpIVzJMZmQzVkhtcGNpNnlMZVBDM0NBQWpqR3p1dnlCZk5Lb2dUY1or?=
 =?utf-8?B?QkljMWN1K2lUdVRNTjBHalJnQXhTaFBZZ2FKdUg2Q1k3KzhIL2JqSS9wVEpW?=
 =?utf-8?B?Q3hQUGFQNmtCSzZ4R3hlRUkyY0NNaUp5L3k2RTlCeVZKM1BubmNOZU5nTWZp?=
 =?utf-8?B?bTVlcTdpT2h5b3FqSmhLcDVKcHFnU2dZTXlhc3BQRTJTRFAzcHUzMzl3Wmsw?=
 =?utf-8?B?THdPSUVpOFdQTUxNNnJpUFY3cnZPM1ZpRnN5aDFQTW0zUUI5VE9BM1cxeWRo?=
 =?utf-8?B?N1pmdkhhS1UrajhyQitCWnBiUW03UitVeWxkYzV0aTVtRzdzN0JFR3ZHb0s2?=
 =?utf-8?B?dmQrWFQvbjBseUcxYTRDdjZzVWlOZGlCUGhTckQvTGdab3ZxV3NiL3hHTUVx?=
 =?utf-8?B?MlpyVU1Ja2ZOZ293UXpDVllPUHlqMkpEUVBZeEdsdDJWTHpYZmxkSjYzOVpZ?=
 =?utf-8?B?TTRLdTBlR3BSbHJ6Nzl0emhkZzhWMG1SamgyM2xsUkVMSjM1WEkyb0lzVDdE?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b23962a2-703c-4b2f-fa0c-08dd15c92e66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 07:39:56.8762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6cPNuyx/chc1HF6xWdonu2lLAlEv7NWzSl5yBs0tY/owS2Vlc5ZoDPoqQXbtjBZwfvj4oGe4Be6IGe2lxQfkkazJySrWmM+ZxF3/5Hq+vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7622
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Piotr Piórkowski (1):
  drm/xe/pf: Use an explicit check to see if the device has LMTT

 drivers/gpu/drm/xe/xe_device.h             |  5 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_lmtt.c               |  6 ++----
 3 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.34.1

