Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A0CD3446
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 20:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EDB10E076;
	Wed, 12 Nov 2025 20:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IV9ffNSf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 045C310E076
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 20:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762977633; x=1794513633;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=D0WebJWmO6dB+l+FQCORuXjDOCnuLYgH5khF7Qjw+aI=;
 b=IV9ffNSfS4WwRnU8BccdkpqpVy3VyvMYeYoeZN7pFH/476fcxaHgPbTo
 MBDJEDXxPSSlF9b/z5nKP5PtyereKt9NI9/ehQJgTA27ehjlwGZLmnEGG
 BdhnSLYX6+tVCjZ14BSpdmp8/rROy+5p2d1vs/HflzFFYaTfe7evXn8Ks
 9QaT8muCO+MC9dDDceqVFSOxUOu6l7WhmUi1Z0Y1tfET4HlH7qc85gS3Q
 DJn8k7+6AMtvFAFj0T1GJjN8x4vKCoLJdthbppf+OotvGKjn8XXqXRM06
 WnDjNQszrA8wxeFer1/Nh6/PPpI/TnfJU21ztqOo4cZ3VhZ+ElXxiO1Pm w==;
X-CSE-ConnectionGUID: W/8i0U29TdStLgq2SE6dBg==
X-CSE-MsgGUID: 95r08Cs6QbKqzVwzrzQG6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82683715"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="82683715"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 12:00:33 -0800
X-CSE-ConnectionGUID: uKXitFV+RV2eh9+w2bmSRA==
X-CSE-MsgGUID: OaIaBKeaQSK9IPha6TnEnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189311051"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 12:00:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 12:00:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 12:00:31 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 12:00:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6WhrDLX2Hj5qGfb/KQC2o/zOPJSLM/dL43KfZVTt/ZLGMTFZV8kULvYFRVFVE5YgfaGh27uz/PBc9B7AZlGs8YZ4QBmJIdFBms3IsxGem4w+CEoq2ZfdYV15OvLqUQC+bDOv4+PwpxdQh5rhBSI4ZtQeYJxeyx+hmwEav7a99wxosH9EfKhCurpuxN/xtYm//R0hmfIcy0NOGkS6ylgUcr9ha6psCXUMwqBZFvNSi+8P4J2LBuk+bWAZ1r1VZUwhaAPNfZZjRRKjTaj5soMZPXo8lEaQpMc9qmDRJ8OKRpAkc25jv5rGGxoWHrgdQoiRKQ3Th8W69GTPkdzU4s/Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCbMhFTcyRIV1QoZ9LhYMg0HaVquoQkxzg+3rvkBzKc=;
 b=hBTwA9NLm7X9GYdJcv+UDPnCi/uKa33eNr+Y1F8GOkqSozwrzOCd99zbIKRvOv8wFA+Eidw1SK94FRk68xtV+c484dsz2DHNMmCew4uMAaNuD/m3owqTyHzSQ65Nqzd7Y+q5kqSc/HYgNFCmMWCg6+k/UcLJY/vl/o9bZyk6NwmA66JxRCOZdqP00NvRPt66IfV5YH+vMLlShGJypXVWjItS5BVWgZDhMqjIor18melDXNy8sDBSQr2pbGQyf5uiI9ov2gWk1LmhvbJ+nf//XtiE0wQnHhDyDDMl2c2dHGrtvbCdOIi7VXopk+x5NmIxSw9Mbj+MhnwFQmE7vlNZMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8280.namprd11.prod.outlook.com (2603:10b6:806:25d::21)
 by SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 20:00:28 +0000
Received: from SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88]) by SA1PR11MB8280.namprd11.prod.outlook.com
 ([fe80::13a:4240:8d73:3c88%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 20:00:28 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-36-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-36-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 04/30] drm/xe/forcewake: Add scope-based cleanup for
 forcewake
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Wed, 12 Nov 2025 17:00:15 -0300
Message-ID: <176297761536.3698.16687933098897289557@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR08CA0066.namprd08.prod.outlook.com
 (2603:10b6:a03:117::43) To SA1PR11MB8280.namprd11.prod.outlook.com
 (2603:10b6:806:25d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8280:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4578c3-f594-4f99-7bec-08de22262047
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VEM3K2dNUERzSEt5U2FMTzZyUFRycnFERUhWSWQ2NmFnZXA3ZnBEV0d4UHNl?=
 =?utf-8?B?R0d2UWVuNXNURitFWHlacURDWnNMVWlTQU9jNTNVbWxVci9RWGMzZi90N3ZJ?=
 =?utf-8?B?NXJIMzMvRjJ4OVNTYU5XMGpoM1VEa0prc1c4YUlQeTYzcHBDTTViQ0krUUtK?=
 =?utf-8?B?bkx2ZzVaUnJ5aDRic0RJaGRNWlBadExOekFzaG5SSEZzKzZKdmxLUHA4MkN3?=
 =?utf-8?B?NXU5bXlaeFJvendva1dtYzJjbUdmeUsyOXAvc2k3KzA3R1dTbFFuRXFpNzho?=
 =?utf-8?B?TEh3bFJyUkxNUzVwOFlqRUtMNjFvb1BtN0N0bFNMbldwOTNlem93dnhtWTdu?=
 =?utf-8?B?N0I5RkY4M2ZlVUc4NkJ2cjN4cWxNcCtGSlZFbkRIR281NkNnZjNsQ0lTU1c5?=
 =?utf-8?B?VGpMNmdMWmJCN0cvMkpDYzV0UEJDK01pWUZPYUFEYUhtVm16WElJTmI3Nk1s?=
 =?utf-8?B?aEVQV2tuTzIyVitBR3lzeVdjcDB5NkJYOFdRbG5pV1RRckhtMDZzamN6L2lv?=
 =?utf-8?B?YTZTcVM1SnYxTlF0ZXlOTmJIMGEyallWR3kxSnFKWjZobkRsYVdCMVFwUzln?=
 =?utf-8?B?Mk5HcFlXd1ZreUNQeEVqaXo4TDdNNXRucFpoeGZxQkh1enFudGQ4aWVJVU9I?=
 =?utf-8?B?U3RQdStWYmFISDR5T3RjWFdwMFVkcE9MbVZURnFsU0FoY0lxTHlaK0I3MzNt?=
 =?utf-8?B?NlZvcUExNEdsLzFwR1VsYUg3SXQ1YUhEUzNMYVoyWk9FcXp2cGRGbHg3dk9x?=
 =?utf-8?B?QUFHNmx4ZURMQ29yeVE5a3hPZXhzQmM2cEtpZk9RdTY1NEl4ZEVvT3hVUG9n?=
 =?utf-8?B?Zjk2RHV6bmNFU3lPZklLN3kzZmtZUVVYSE1zQXN3QkVzNS9sNXpiV3VYNFVT?=
 =?utf-8?B?bHBuN2FTRlB5YldTRUs3ek9XdGoyblpRaDBlNGNaaUo3U3dyMkhMaStRQVc4?=
 =?utf-8?B?WGcwYldrWmNrVzNLY1huS0NDU3dvWmo1bmxqek14RDFHczlxakF6OXNmUGZN?=
 =?utf-8?B?OVZIbGlxRW4yblRNUTd0TW5ZcVdCcm9kb1RZdjdnc2dmQ1JCQ3A4V2FkNFlj?=
 =?utf-8?B?Mi9jUk9yZ1liQVNoSWppcVVhQXpEMmxQZ3VDY3FJNHZ3bjhweHJEYjU0UG1j?=
 =?utf-8?B?Slh1VzFUaldQNmpXckpWUGt4VGNuSFQ4a2ZlSURaY3FlWmp1aXVDNElhckk0?=
 =?utf-8?B?b1JTWlhFNUMyUThwNzdhQ0VFaFJKRHBkTUVYbTFzb3kvNFN3bExJSkNpYjg2?=
 =?utf-8?B?L1VOeHVsVHZhMG1Qc01FeFozNDhpdVJMUUExWGhoK2NhOWZSVHRSRVdJak9L?=
 =?utf-8?B?c2F6WStOQ09Sb1d0blg5TlZSV2Y0S3QvL1hjaER4RnplMldxL2lnMk5ZUGhl?=
 =?utf-8?B?YmRSSmthUW9pUXIxV1FqYnlJaG5vNTI2VWIxSVBPM3p4RUtnZ3RzQTZlQ2xZ?=
 =?utf-8?B?OHR4czR2eFhXNStkZUlLeDM4OGpjMEZQRS9ReGZOVDQzcnJuTFJvVWpNMlp0?=
 =?utf-8?B?NmgrMmt0Y3luUTQ3WitJWjhjVFh2MFFBbUZLZmtQeXRhWVBzdkkwc1d4Qkt1?=
 =?utf-8?B?YjBBdW0wUDQ3ZHRWYkpGbGdPeUNtK3R3RUcrL3FyNjIyeG50Q2w5V3JmM0tU?=
 =?utf-8?B?WWx0Qy9ZK0dMTFFnZ1QrOW1HbUdNejFqTHozUzBXL2ZSSGZ6cEhTL1duZVVS?=
 =?utf-8?B?MTd4OG1sU1ZZbWtJVEduaVpibjRxV3lpdGNlMVBnNG5WZ1M0eEt1SUlNdjNF?=
 =?utf-8?B?Mnk4K0x6UWNYWGM4bG03cEFBbmdJNmgzWGd3MlVNeVBic2VyVFBNbWdQb2lN?=
 =?utf-8?B?VGxtWEIwczNyTkE0LzBnMlU0M01CVWN5eUYrUHRKZHNjTmdOZHY4NlFjRllz?=
 =?utf-8?B?Q3JVM3BScWUxQ2FBZWRsY1JsdVpmeFo3L0JBZUIwVkxiZFRsSngzOTVra3Nh?=
 =?utf-8?Q?H9vkDr3RK0G0pRE7xnjsjW7WFtQfjXTE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8280.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFjNkplZ3ZYc1dVTGFnaVZNMEN2UkFRS1dZRnp1ei83VTExV1dVckdDRzFX?=
 =?utf-8?B?UEtrTHdiWk5rYjZDdVgybmh5REVZcnh5ZXVpWk00WUdJcFBKbHZ1UVJZeDg5?=
 =?utf-8?B?T1JIRlQ0QW9yWTZPMnl6b0M0a0dKd3cra2JPaldNeXlCWlJ4d2FpQzZHMnZt?=
 =?utf-8?B?Zy9CTTQ1OHQxL3pZazBQSWRHbWwvZGJHQnhZVGVFWVBzMUNtS3A3VHlpa3ZQ?=
 =?utf-8?B?TExHWGdTOHdFREhTZ25waHFYcVkrY3NVSWRvZk5TUzJ3dzRXNGoxODlETlJu?=
 =?utf-8?B?YmJweFNZSkROQVQvVUQxZFk4cmcrdjJJUXZWNXVua25nM0hjTXJONlE1T2p6?=
 =?utf-8?B?MVQwcTVVRmxVV1EvaXNkRFB2SG82elRQSy80QkRxUHNJWjFrQXZwYytNSzhY?=
 =?utf-8?B?STlTVlYyYVVnYytGeExOT01PeXkwNFh1WnRKdDVnQzYybXVxRTI1cDVieWZy?=
 =?utf-8?B?MjNSdkFFL0JaZ1VYSFY2b3hYZnZCZHQyOWs4TWZOeHZYcFJVb1NuWmhQVTNI?=
 =?utf-8?B?S2VYcStsMG5LUnNUMmx2TzhHKzFCUWtzUkc1Uk9nNzFQb2E4TmpQUmVMSkl4?=
 =?utf-8?B?NkpYdWlhTXFCV2x6L0VYdko2THpHbndpVkhiQy9QcWNpSDdjYVVxcVNLZ2Rw?=
 =?utf-8?B?YjkxNDBXYWhoMVBpU2Q5eHdSQ3kxdi9YK3V1MTZBY3dXRS96WTVGU1VIOG1Z?=
 =?utf-8?B?a3hSWW16Vi9FTWJzQzdmSVlWL1JkTHdoK2FsL0tMZWQ1bFBRVXBBY1Bkd01l?=
 =?utf-8?B?Z3c0Z2NQeUpRYzZmbXp6Wlk2R21IaTZWTjl2TjZ5dWxYdGpESE5XazBoanN4?=
 =?utf-8?B?a25lZ3dwR0QzM085TUdjTHA2OS9GN3ZVQVhTcDd2aTUzRDUvenRIY0VkSU9y?=
 =?utf-8?B?dWxxNElsUk16SnRhUG43ZHVITHU4STFqTHBPUnN2Sk8xblJWcjNHaGpVMFNp?=
 =?utf-8?B?N2VKNkdxNWVRZWNtYkVRc1VhZnZSbjl0MEFsdkFqQk9BN1F3QTVoQjdSanRs?=
 =?utf-8?B?d1BFOUpYUXR4bjI4cUJOdG9KNWlRRWZnUWt4eGxabGsyQXNFNE5oZ0xaN0hF?=
 =?utf-8?B?L3B2eDNQemV6ZEVOR1BQSHVYdkwycXpSZkovaGhaWk1adWsyMkhjaSs0RldE?=
 =?utf-8?B?ZFV2WFNISVpZN0VseGI2eWJZb3VHVGcweTRINUJQelB4eGswRzVhYlhMa3Bi?=
 =?utf-8?B?b29PdGhpMjJrUnJGekxWUGJjZ0JVbzIzbk1vSGx5WStkZnZaNVZGVVV0ZUln?=
 =?utf-8?B?YmZkclJKSnVyd3FBTVArNWhZSWZ5YnFwRVdSNGtCZmJWd3FLeXhFenhSMnJL?=
 =?utf-8?B?a1NHU2RVY3RCMUpuZi9sY3VsRlhlOTdIY2NYL0xET21OZ1NFTDBHL21CeEpQ?=
 =?utf-8?B?UDd5bjlSd2ZtQmZpMFF5dEgwY2FqZ1JMQllDS1IvNGRVN3VzZTZpcmhHS2RB?=
 =?utf-8?B?Q2JjVkVyVk1Ec3MwcjZlSWpRWGExWGthQUZJUFRPcmJsRVdMK1dBcmFnbldC?=
 =?utf-8?B?Z1pFT1NUdmNYYzhEZUlzVGpkY0YxOENPV0prSGxKRTZ6L0h4RmtjWWYxV0lR?=
 =?utf-8?B?Qi8vdXUwbTRFMVZUSWNkU2lyb3ZkR0RSNEFqdWd0d1B2TlYzckVLbi8ycjZG?=
 =?utf-8?B?YUtVMEgvQ3NGbWhhNVcwQ2J6SGYwQXJPQU1sUVBYWkMza0hySE1XQmN5UFRl?=
 =?utf-8?B?czFxMm1jOThBeE9ld0MrQWtydmxWRHRnVnErTjFsV3pQdjR1czN2YXBCWWhk?=
 =?utf-8?B?OFRKSnVmTVNDR2VBNnNVZlNBRytPRU1WOVBrOTd6dGt3NjR3Um9oOGN5ek43?=
 =?utf-8?B?RGpSRjlxa0lJdGpRRG5KY0R4TTFvc2FZM3dZQ2dPallsS1dETEpSRndJNTc5?=
 =?utf-8?B?RFRKL2dSMTFqcGUyd0gxZnp2TEV2QXYya2lVZ1hIdnE5TmZtY3hXc3BYMXBt?=
 =?utf-8?B?QzJ3ajI4dVZyMVZDTEozV2Ixd0ZkSHpOcU13YmhLQ0hRV091T2NGWDA5dlZU?=
 =?utf-8?B?OTY0RGZVY0dsZ3p3aGliV0hWbDNzd0RYR0tBcEhzTVozRkJEWUp1UW5rNzRj?=
 =?utf-8?B?OGJ4TklBMWlQeTFOTnBpWWNNVDRmTllaN05hQVlrZmUzZzF5Y21oeHhranVX?=
 =?utf-8?B?bG05Lzl6c0dqZ3E5YmNCMjcva0R2L09ZOU96eXhadTFNT1pKMDdHa1JDdjBh?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4578c3-f594-4f99-7bec-08de22262047
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8280.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 20:00:28.2058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ayM5y7rMi65iJI23aXTUqzbpyfpowRLmONdXZGSFaARSL963hFHewL4PIpTKe6fnPyW3itnBFEaN/IYqW7/sDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
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

Quoting Matt Roper (2025-11-10 20:20:22-03:00)
>Since forcewake uses a reference counting get/put model, there are many
>places where we need to be careful to drop the forcewake reference when
>bailing out of a function early on an error path.  Add scope-based
>cleanup options that can be used in place of explicit get/put to help
>prevent mistakes in this area.
>
>Examples:
>
>   CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>
>       Obtain forcewake on the XE_FW_GT domain and hold it until the
>       end of the current block.  The wakeref will be dropped
>       automatically when the current scope is exited by any means
>       (return, break, reaching the end of the block, etc.).

Looking further down in the patches, I see that fw_ref is only being
used to check for success.  I wish there was a way for us to do
something like:

    if (xe_force_wake_require(gt_to_fw(gt), XE_FW_GT))
        return; /* ... or whatever that handles the force wake error. */

, but I can't think of a way define such a macro, since we need a
variable in the scope where xe_force_wake_require() would be called for
the cleanup to work properly.

>
>   xe_with_force_wake(fw_ref, gt_to_fw(ss->gt), XE_FORCEWAKE_ALL) {

In display code, we usually have with_intel_something().  I wonder if we
should follow suit and use with_xe_force_wake().

>        ...
>   }
>
>       Hold all forcewake domains for the following block.  As with the
>       CLASS usage, forcewake will be dropped automatically when the
>       block is exited by any means.
>
>Use of these cleanup helpers should allow us to remove some ugly
>goto-based error handling and help avoid mistakes in functions with lots
>of early error exits.
>
>v2:
> - Create a separate constructor that just wraps xe_force_wake_get for
>   use in the class.  This eliminates the need to update the signature
>   of xe_force_wake_get().  (Michal)
>
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_force_wake.h | 28 ++++++++++++++++++++++++++++
> 1 file changed, 28 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_fo=
rce_wake.h
>index 0e3e84bfa51c..0204503b53a0 100644
>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>@@ -61,4 +61,32 @@ xe_force_wake_ref_has_domain(unsigned int fw_ref, enum =
xe_force_wake_domains dom
>         return fw_ref & domain;
> }
>=20
>+struct xe_force_wake_ref {
>+        struct xe_force_wake *fw;
>+        unsigned int domains;
>+};
>+
>+static struct xe_force_wake_ref
>+xe_force_wake_constructor(struct xe_force_wake *fw, unsigned int domains)
>+{
>+        struct xe_force_wake_ref fw_ref =3D { .fw =3D fw };
>+
>+        fw_ref.domains =3D xe_force_wake_get(fw, domains);
>+
>+        return fw_ref;
>+}
>+
>+DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>+             xe_force_wake_put(_T.fw, _T.domains),
>+             xe_force_wake_constructor(fw, domains),
>+             struct xe_force_wake *fw, unsigned int domains);
>+
>+/*
>+ * Scoped helper for the forcewake class, using the same trick as scoped_=
guard()
>+ * to bind the lifetime to the next statement/block.
>+ */
>+#define xe_with_force_wake(ref, fw, domains) \
>+        for (CLASS(xe_force_wake, ref)(fw, domains), *done =3D NULL; \
>+             !done; done =3D (void *)1)

I think it would be good to use __UNIQUE_ID() for "done" here, to avoid
shadowing any existing variable from the outer scope.  We could do it
with something like:

	#define xe_with_force_wake(ref, fw, domains, done) \
		for (CLASS(xe_force_wake, ref)(fw, domains), *done =3D NULL; \
		     !done; done =3D (void *)1)

	#define xe_with_force_wake(ref, fw, domains) \
		__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))

--
Gustavo Sousa

>+
> #endif
>--=20
>2.51.1
>
