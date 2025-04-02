Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F1C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 18:24:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ECE010E8B9;
	Wed,  2 Apr 2025 18:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kd/D+oFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2283910E8B9
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 18:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743618279; x=1775154279;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ld9A/ucn+XJ/+uNTDsozTryAHJ7U90a2+FJvg0+QsH8=;
 b=Kd/D+oFDf8JIkygAh1cdwyzP5gh0cSJrHNq1vEVXRL8HRwpTnVOHcdw5
 1gegf4mHXbDbwK9QZDzsAwiVe4FWGQBFpEHaUt+Z000R4NJ1D2kJT14gi
 K8/8kin5L20DghbeCXYsswG7NgMHNlja4G4tIEQFnRmEPMTih0P3rvdg1
 J6oY/LQgUbweDkNDaa4e3TByGcaEVBUj1f4lBzpz2W9FmDzQ4doogDAms
 RG16hL9gpUEOxwrOM68Nc9m+A0NMDaTeiUgf1/RytcOYlX1C0SbY4nIGt
 6Qn4J2aJRYlw8Y5lLCymt1q8PAfT6ek9f+UrkQA2nDI286nKDnwhydW1l Q==;
X-CSE-ConnectionGUID: mYg/JxZES6eaZ2/fm3MicA==
X-CSE-MsgGUID: hYM22O+tTCCCJARYi9D+Bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70365892"
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="70365892"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:24:37 -0700
X-CSE-ConnectionGUID: X99WyU6DQ7y6guzoKJ9yYg==
X-CSE-MsgGUID: f9O+QbgTTxONfdz0mMdE2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,183,1739865600"; d="scan'208";a="131763998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 11:24:37 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 2 Apr 2025 11:24:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 11:24:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 11:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=srxcrglZXtD9+hpH4yUI37uYIWR9zHiYOMfn2Dk/oyAQEfPzwGHu3XKQGIl7Vzb3FG4E+7IZtfMyW7McDMw/9WPd2vOcDY3dQr3+YrqUutvvJrYdicUYtEXZUxELiRYgbsXsqOvaXpuG3BnBC/uIgB/B0Zfrw7XBwBFXw+TNZ+1kOlmnW2Tet+XzV7YRYgimV6Ogw8RMdDbl/u3s79P0FqM4C9YrL2kzfjWey8ZsBm/V9gAUljeVhgpO12k5B8MZJKsieQutRSeEGfiqXfxUijnQ6WkYYQfMsCTYJJ8fJqPgzRB1Hl4bJyP22PKMoe/dc3eh18VP9twIz4oe4BSkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G52SvE4guOQv5htJgR0qBKABdPZU9nzuN47BNFBZpSg=;
 b=HpvXr2krOec+icCXbSMfGdIB74e4QAxA9cojLS72TlIE5qfx2s8vyTvbK8gZi/uI2do/uW2YKE5sy0BU0fnSMAjotasoBaA2eSUedUFEUaeqTLqIu/tOJvOCDc/t9U/VEnpXQs/2ubzkAdtryCsYHlkKCnEidJ3PGQpKgT+ZtShZkHZSvj36UJriefch/QxBiJMReCybrDT18GoHUPjyMBUK2+tY+VovRd0bZe9BdlxnnVK1Z8r+qVf73gUKdt4rkJ4Ix9BlY69mlrF+Xwn1CQIz5wH0hvD7U4MaxRTTzhiObdF+qTGvPZ9FE0l865p3dI+SUboXfSkzgEksA/yKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV8PR11MB8678.namprd11.prod.outlook.com (2603:10b6:408:20b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Wed, 2 Apr
 2025 18:24:34 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 18:24:34 +0000
Message-ID: <2cdb9c41-6b0f-4399-b2c5-f9651a0b98a8@intel.com>
Date: Wed, 2 Apr 2025 23:54:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe/debugfs: Expose PCIe Gen5 update telemetry
To: Raag Jadav <raag.jadav@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <riana.tauro@intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-2-raag.jadav@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250331142336.640226-2-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0315.namprd03.prod.outlook.com
 (2603:10b6:303:dd::20) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV8PR11MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc6c115-584b-40c1-515a-08dd72139e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2NYYjdEa21GUFcwSzg2K2NEMmRhVEpEQmF3LzlZWUpEeDJxWVdvTGU0bldO?=
 =?utf-8?B?Y2wyNCtMdkZ2NGNsRUkrVG41V2tIWXU2NmpRSkJsV0F3eDNYaWtQakluR0JQ?=
 =?utf-8?B?ZWhEMVJKMkNONnZKT1A3TkdYSjhFa3JRRElUMEhKdUtTcCt0b0xlSDZ2Q0hq?=
 =?utf-8?B?Z2ZvZEdSQXAzenpoRDA5elZ1UWE3SXJEY0NiRGhhWG5EeG5XNmxoWit0L05C?=
 =?utf-8?B?OVc3cGxJeVVHdEZzaU5hSkcwbnNiL1RsbEsraXBZeXNielRTV0ZHY3M2V1RE?=
 =?utf-8?B?a3VQenJWSDM3QnBzTjNGL1k4YWNTNXVsT1QxYlZDbjhBUm12Z0F5dTBxS1dX?=
 =?utf-8?B?L1QwRVFYalI5aS9oVFdQbW9sR3dieVp2VDBFTmw3czh1MjZDeGhxRGhIT0Fi?=
 =?utf-8?B?MlMxaUt3RmpxajFoUERSTEMraStUOWVlM1RsOVJiZi9KMFpCMFkwSjVsUkUz?=
 =?utf-8?B?VWpSN2RnQVYxM3NJUHkwYi9PRTFPMkgybjFZNW1BSVM2ZWhPYWZ6MmJXT3BP?=
 =?utf-8?B?RXBMTEJZblRuY1pPTU8wSWlwcDhoNzRKVDVlakNGeDJ2dXNPWnFYcC8yQitH?=
 =?utf-8?B?K2tKdGxvY1RueitoaTlnNndiOFN5N0wzNGg5TGNadlBCK3FuWlZiaTFJN0w3?=
 =?utf-8?B?ZG4vemV1Z1EzRmd0MmgrQ21MbG9nNFdBcm03dU1Sa05TUmlWMUF1TWVOSlQ0?=
 =?utf-8?B?Nm12SklhdThEbU14TW45b1ZGTmRCb0ljTUwwWjFLbmNvamlCOHdXUnFWTkc5?=
 =?utf-8?B?RG5wUzQyODg5ZjNXQWpaOHVhZVMrV0Q0ZE83a3ZoY3h2ZHRFckdPMFl0S2VQ?=
 =?utf-8?B?RGxCbVF3TW5PMkF2d0N5cjN5ODhpQmFwckc4eHA3S1dXT0JGbUZvQ2R0SlBY?=
 =?utf-8?B?WDdGL09BbUpsUzliZkRxb0s0OEI1ZFB5ZWlnUmlWSXVMM3dnN05tZDhDMnBZ?=
 =?utf-8?B?MUxLSGRPVEtydndVQVM1OVFSZXdhWEZ6ejY0bzBFd21qblVBNHRjalQxYmY2?=
 =?utf-8?B?OXNMKzdQbVpnaS8xb2dkRE5pazZpWTdUU0JrVUtEYUxibWdwOXRPMmE5VlBy?=
 =?utf-8?B?NkExSkFzbk5YbjNuUUU4VGgvL1E3RExrQ0JvWm43MVErYmRmN3N0UDdIRy94?=
 =?utf-8?B?ZkdrVkFoYWhZVWdGNkliUkwwc09ua3YwS3V2eVBqVTFqMWZ2NTk4QnYrMDBL?=
 =?utf-8?B?SURXSlpxa09OWlBxL0c2eHpqdXE0amtkVFBvQ3dOcGdyRmFleUJ5YWE5dGd3?=
 =?utf-8?B?YUVRRnhWN0VLdTZXY0NiM2VKdkpzaVJ4UGgyMFhsbnhOWWQ5TzRKQzRrWE1o?=
 =?utf-8?B?ejBLQ2dkbTJ6RVZHV2hpR2UrTC8xVUQ1UEFtcFlTQ29JYnJ3SkZjeVZJcU5h?=
 =?utf-8?B?NGI2YU5IZ3d1SDFKdEdTOHdYd3hpR0xoVzltODdlV1pOTDdGRmpZUksvMnNW?=
 =?utf-8?B?Q2wvTHJtSVBQUzZQSm4wbnV3eEJ1Z0oybjdSU1FST2JUWVZHSnVhZkluOWt0?=
 =?utf-8?B?NHZOQnNhcFBBOUNqenl2Ny9aN2llWW9UMGhFZGozeVVhNE05VlhYZ055aVho?=
 =?utf-8?B?NkRncnREMyt4cFRZUDlHUHNiY2ZRcVlmVlZTbi9MYkhYZW5IMUphd3JKNVV4?=
 =?utf-8?B?S3B3TGtzNE5JUXZINEE5NjgzdTI2bkJvaWpCTjdwam9PVUVnUm9JbytJZ3gr?=
 =?utf-8?B?VGZ5em9JUFFPZFVuWFlsMS9maDcvTjg2Ukk0UTlLc0NXc3hyQ3cwY0g5Tk5I?=
 =?utf-8?B?VlZXamN1NFhMOFFzTU1hdE44Y2V5eTZBajhuSGYweEVXRDN6ZjdWdjdIZEZD?=
 =?utf-8?B?UnB3TkU1L25uSVpNOUVzVVo3ODJReUVEU2pJK3Y5QzlZZEhRYklHdDlSSUNE?=
 =?utf-8?Q?k+D16UeQonyNR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVJ1VEtxZENFZHhoZ3YrY3lVRTZGMlRoQmZ5VytaSzRib3NzV1JKN2hEVDhN?=
 =?utf-8?B?Mks4akIxMXV2NkVQU3FEOUJYREZySXNWWlhzR0w1MnprWkhIa1E0YVFaQ0pF?=
 =?utf-8?B?VHk0d1BYNVJtQTBPNng1dTNYeW5hMEVYaDNhY1N0QytvQ3U3U2FtNTcyaFhj?=
 =?utf-8?B?YzZoSjFvcVdVc2lzWVBMaHNFT2h5RjBtNjZSOHZDVSt1RG9BeWJ5d3RXZWY1?=
 =?utf-8?B?R21OZHRSQkhISDhyUC9CYzNVb3JiQWY3ZXJmN2VSRTJJMkIwOXdoOEFSNHdI?=
 =?utf-8?B?dmMxK1R3U0ZScDN2ZVJETm5JVW9rUE85RUc0R2g3d3VTQkxWamZkYmFCc2NO?=
 =?utf-8?B?U01MbWFGNlhFVVUwSWs3YkkxUmtJSkRIN3ZpS013ZVFOVHIwZFp0RkVnUSt3?=
 =?utf-8?B?bnMwSDZ6ZXlmUU5rUHpLL1BLNjA4eklSVlgwYitSbmNnU3ZRVUtua3V1T0d3?=
 =?utf-8?B?VTdxblNtNlZNMDdZUHNxYllWV1ZiZUhndVpKMkxvVUk0bmFabkdYQkVVVzhk?=
 =?utf-8?B?allaREIxM21HZTJha01xYXVGeVFuT0JuckFpUFF4SjBJR3hZaXhOSUEwejYz?=
 =?utf-8?B?YnhERUtvcmlDY2psTlNJUmN4dzJoQUlXZnVDbTE3Y2pBWWZOaWlTV2phdzN5?=
 =?utf-8?B?OElkRG1KUjJZTk5kUFpvWTdIVytZRk9IWlc3T1RVaThEL0VOaTlsSkhXNG1T?=
 =?utf-8?B?c05OY0wxVDBrdHlvclgxOXdiUXphZld4UjMrQyswMHJ6d0JQSWIwVXdIbFlU?=
 =?utf-8?B?MjMyR2hxcHFWK2lweWI2UGJnVE5pNE5MekxsMFcxTG4vVGZaVzczZVQ2UnZS?=
 =?utf-8?B?U0orS0JOZERCVHo5RVd6QUFKdmJOR0p0TFNIay84OXJUTkpiVXl6aHJiaEZC?=
 =?utf-8?B?eUhsWjljRjZRdTJtTGliWWM0MG1ENDRmL3ZIRFRyVzQzNFkyMEJlTWJTMmtn?=
 =?utf-8?B?cTZOTGRpL1Q3WmRnSWZQbHdDYkhSazlOOTF1VXMzbVlZb24vcjRtKzZPN3VU?=
 =?utf-8?B?cTU2dTZQQXdWaVQ3WHlkdEZ0eFgrbE50c2xVdFY1VU5taGNla1RlM0IrZFZP?=
 =?utf-8?B?V3M0eGtUakR4TnFFUEVIL0JNbkZZbHJtNzhFWG9EdkVuNjNJZmdRMVNLbnFh?=
 =?utf-8?B?Yk1UV01MUTZDNWlYdVlhbTFkMDlxaHlwLzVmTVhTZXdtT1ovNGZ6L0gwVlpj?=
 =?utf-8?B?djUwNXFhOE1lK0dLd3lYRHl3T3lJL0JVYllMSGxyand1MnZ1Tmw0ZVNYNlJD?=
 =?utf-8?B?Y0p5cTFWRjhKNXFnL0NiRlJEOFJ4N01FTzlqekRiUERZT2ZDSjk2NTZuSFlT?=
 =?utf-8?B?eHBpRzd1dnVDLzYyQmx5WVdvNnJiQUZXTlUrNFE5c2I5MUszVWJMU3ZEbk1Y?=
 =?utf-8?B?UytLTjJkRlhseWM1YXNrcjFKRm96S09BQ25GQ1lkNy9WUFZCMTFFSWxCQkp1?=
 =?utf-8?B?NTlka2hYOHYrRU43UlRMUllLUUxvb3V5TVhqV0Y4RkhObGhqdjVGSHNZbHpt?=
 =?utf-8?B?Tk9MeFlXakZhVzFtVE1xb01pZW1NY2F0dzRhL1pKNXVFNjY3YXFYdk4yTDls?=
 =?utf-8?B?OTBkZFcxTjVhZ3EyRDE0VmRwNWU4d1BKZmR1RDlwTk1Hb0FqVTVLNVR4ZlQ2?=
 =?utf-8?B?ZFBQd2ljY3BVSlM1OTgrMHpwQlBkMDZLUkMxRHFhdFhZYzdTVzNBV2tzQWlz?=
 =?utf-8?B?WVlYaGxjQi9GanA2TlVFcWorb2xrMTlaQzlaYkU1WXBubThaOVVieDNxM01x?=
 =?utf-8?B?OXRLSVd2dVFtTmFKZDhlUmxXRTUrYnFjSEs1UnZ4SVI5dTBueC83a1FJeHJz?=
 =?utf-8?B?QjNmU0c4c3ZzM1VQNitvdEZxQXpUTzNtekoxMVc2UEhGN3VLcnY4aUhGMzc5?=
 =?utf-8?B?c0s5RFVaam1RWWREMWYrckhKMENuRWxCS21hcnFneGhpQWJVY2xhcFhjQk1V?=
 =?utf-8?B?bXVYaEpFOC94VWlEMG45czQxRGUvUTg0NDRtU0lETnZzOCtkWnZlU2ErT2J3?=
 =?utf-8?B?akN4a2ZrdjZSYnlBM1YxUUhrZ0hWN2hMQVV5Z213QlJhWVNIanhCMzM3ZnJB?=
 =?utf-8?B?NGxXVlJtTE13TVhwdFl1M2ZOeXYyUFZJZ29VdjVTUldTZVJGWkFtWjFrQi9m?=
 =?utf-8?B?K2tTZ3dqV0FHN3kxcHlha29lTWJ0R1NKblBsNEUrOFVJM2lqK2hYd0N2VGVM?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc6c115-584b-40c1-515a-08dd72139e25
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 18:24:34.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k+jBZdMzVWggS6+rL6+DcZcMuSzd6q4ePfdxoYKtkSKEfUg1Oalr2qDKES5AQCs1BXPNlubk3RUI2+n6csmxaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8678
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


On 31-03-2025 19:53, Raag Jadav wrote:
> Expose debugfs telemetry required for PCIe Gen5 firmware update for
> discrete GPUs.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c   | 93 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pcode_api.h |  4 ++
>   2 files changed, 97 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d0503959a8ed..67c941abf4fe 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -17,6 +17,9 @@
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
> +#include "xe_pcode_api.h"
> +#include "xe_pcode.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
> @@ -191,6 +194,89 @@ static const struct file_operations wedged_mode_fops = {
>   	.write = wedged_mode_set,
>   };
>   
> +/**
> + * DOC: PCIe Gen5 Update Limitations
> + *
> + * Default link speed of discrete GPUs is determined by FIT parameters stored
> + * in their flash memory, which are subject to override through user initiated
> + * firmware updates. It has been observed that devices configured with PCIe
> + * Gen5 as their default speed can come across link quality issues due to host
> + * or motherboard limitations and may have to auto-downspeed to PCIe Gen4 when
> + * faced with unstable link at Gen5. The users are required to ensure that the
> + * device is capable of auto-downspeeding to PCIe Gen4 before pushing the image
> + * with Gen5 as default configuration. This can be done by reading
> + * ``pcie_gen4_downspeed_capable`` debugfs entry, which will denote PCIe Gen4
> + * auto-downspeed capability of the device with boolean output value of ``0``
> + * or ``1``, meaning `incapable` or `capable` respectively.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_capable

Why not on sysfs?

So how about simply using "downgrade" instead of "downspeed" through out 
the code?

> + *
> + * Pushing PCIe Gen5 update on a auto-downspeed incapable device and facing
> + * link instability due to host or motherboard limitations can result in driver
> + * not being able to successfully bind to the device, making further firmware
> + * updates impossible with RMA being the only last resort.
> + *
> + * Link downspeed status of auto-downspeed capable devices is available through
> + * ``pcie_gen4_downspeed_status`` debugfs entry with boolean output value of
> + * ``0`` or ``1``, with ``0`` meaning no downspeeding was required during link
> + * training (which is the optimal scenario) and ``1`` meaning the device has
> + * downsped to PCIe Gen4 due to unstable Gen5 link.
> + *
> + * .. code-block:: shell
> + *
> + *    $ cat /sys/kernel/debug/dri/<N>/pcie_gen4_downspeed_status
> + */
> +
> +static ssize_t pcie_gen4_downspeed_capable_show(struct file *f, char __user *ubuf,
> +						size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> +	char buf[16];
> +	u32 len, val;
> +
> +	xe_pm_runtime_get(xe);
> +	val = xe_mmio_read32(mmio, PCODE_SCRATCH(16));
> +	xe_pm_runtime_put(xe);
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n",
> +			REG_FIELD_GET(PCIE_GEN4_DOWNGRADE, val) == DOWNGRADE_CAPABLE ? 1 : 0);
> +
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static const struct file_operations pcie_gen4_downspeed_capable_fops = {
> +	.owner = THIS_MODULE,
> +	.read = pcie_gen4_downspeed_capable_show,
> +};
> +
> +static ssize_t pcie_gen4_downspeed_status_show(struct file *f, char __user *ubuf,
> +					       size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
> +	char buf[16];
> +	u32 len, val;
> +	int ret;
> +
> +	xe_pm_runtime_get(xe);
> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(DGFX_PCODE_STATUS,
> +			    DGFX_GET_INIT_STATUS, 0), &val, NULL);

Its better to restrict this for BMG as for other DGFX platforms bit 31 
might be reserved bit.

Thanks,
Badal

> +	xe_pm_runtime_put(xe);
> +	if (ret)
> +		return ret;
> +
> +	len = scnprintf(buf, sizeof(buf), "%u\n", REG_FIELD_GET(REG_BIT(31), val));
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static const struct file_operations pcie_gen4_downspeed_status_fops = {
> +	.owner = THIS_MODULE,
> +	.read = pcie_gen4_downspeed_status_show,
> +};
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -211,6 +297,13 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("wedged_mode", 0600, root, xe,
>   			    &wedged_mode_fops);
>   
> +	if (IS_DGFX(xe)) {
> +		debugfs_create_file("pcie_gen4_downspeed_capable", 0400, root, xe,
> +				    &pcie_gen4_downspeed_capable_fops);
> +		debugfs_create_file("pcie_gen4_downspeed_status", 0400, root, xe,
> +				    &pcie_gen4_downspeed_status_fops);
> +	}
> +
>   	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
>   		man = ttm_manager_type(bdev, mem_type);
>   
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index e622ae17f08d..1f802d9793ad 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -66,6 +66,10 @@
>   /* Auxiliary info bits */
>   #define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>   
> +/* PCIe Gen4 downgrade capability bits */
> +#define   PCIE_GEN4_DOWNGRADE		REG_GENMASK(1, 0)
> +#define      DOWNGRADE_CAPABLE		2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
