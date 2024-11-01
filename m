Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6CBE6F07F
	for <intel-xe@archiver.kernel.org>; Fri,  1 Nov 2024 19:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F8210E209;
	Fri,  1 Nov 2024 19:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZX0C4uZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B036310E209
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Nov 2024 19:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730489408; x=1762025408;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CsdtQZhXoxUBF5AW0urecYzGrTeldqsZ0hlCzxpTJ/A=;
 b=ZX0C4uZk6dnzDMAfUmpdPb5qvkFjBTcVmE8v1Tg+NoR6yoTNYhaJMS+y
 JgeZx36CIhrmxJGnHwwYPTsTqo15x3h8kBFJYoqr7WH2hemgxRmNysFyz
 a0mMFpPAmnnt6s+bINewD/blTItaxAJ9liG9ibtTEUsFmGFNGmrDNmi+L
 twODeupO43rxAFHN1BtoAMmoI7fSSdwt+ouoI0uER7a2CXqC1kn4MC19R
 z7qpV2jUcczj93kSL6EG4qhHwDJbzLdQFSaokznmjmmXwFNATpRpJQE5r
 nNtvYY5HR1W6bF9TCfUaRcFa+JLTlF1oMLuHUPGi2P8oHE6cTzdLcrcwf Q==;
X-CSE-ConnectionGUID: ahawloq0SRK0nqgHHHShcQ==
X-CSE-MsgGUID: 23BhilbbQqKfsNSpWzmDFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52832740"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="52832740"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 12:30:08 -0700
X-CSE-ConnectionGUID: n04NTumaQOWavtffnXMgAg==
X-CSE-MsgGUID: /zJF1zxxQ864PF6y+8fp2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87832301"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Nov 2024 12:30:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 1 Nov 2024 12:30:08 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 1 Nov 2024 12:30:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 1 Nov 2024 12:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieD3OtiZ0pTsiIi0tEuX7ub6r+Fd1dEhZ7KMjAfjftiTRQBWw75xmOl7RwW6rzYEaxisXKiT6EA+reu0QsBlmImXMj5RJXJmRcGKu6ywkLaxZ5/PP/Ta+l2Hx1inbKSMSliSzhfMW+gwAPfYaSaD4vA+wbGOiLNiNja+a3CJrniI4xXtOkAwPvtuMQBdCujHu8rIZebbzTyDhcQCg9E9CeEnpzS/vvkpYubtWlLUY74hi9oP0L4ElOgF9yOBaZ/81hRW+mQj9ljFgCcAbWYn+6gW123BK75mXsLHuCnwoaAMm3Q/SfF5cpjgg+anA/hErwMg1sEdNl05e7QU98LFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwYanKH6LhmTKPcIlPA3Glfg0WLH3Z+bD9zoVnZsgEc=;
 b=gOIGbuOH9hh9O5jinjjqCF+BuOsXUElcapq3Watu3+5lIec+NK5umihNgHZj07YxDz6joGFsORUAh95TYluKMGOf5pih6+IUiuxiQNgypeglFjzyxJiwB28XBumBXA81bG7L6W1d8vLAm93AZz5CirihVfZPj5sKsnmIzpEjcq8WrgTf6Vk15BR4gbXvqmSXY+/sUpDr8vpxVeymhbVFtS3Wyr24x7P5fBYpkfctvipIIHHgy2IcvPAK5MJevD3VJnntO46NUIXaMp5Jks1jjA20DxxdDqZIgyCDXnoaE4UOOEQO+kplTH7/yUnAoZI6keNpmi2z+lnOus0ToUgRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7976.namprd11.prod.outlook.com (2603:10b6:806:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 19:30:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.015; Fri, 1 Nov 2024
 19:30:03 +0000
Date: Fri, 1 Nov 2024 14:29:58 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, =?utf-8?B?Sm9zw6k=?= Roberto de Souza
 <jose.souza@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Improve devcoredump documentation
Message-ID: <2lm6buuc56u6awcerm4qjjphrhkdha5a4askhjnqsusj727xhu@d3l7xdlecqbt>
References: <20241031182916.1441987-1-lucas.demarchi@intel.com>
 <20241031182916.1441987-2-lucas.demarchi@intel.com>
 <ZyRrisQfc_59rrK-@black.fi.intel.com>
 <4kw2zzb76m42zbisvsy2fu52q2litchy6dfl4hyrmvze5u5dvk@hjs2pdynjemd>
 <ZyTutrXXD73sofRo@black.fi.intel.com>
 <49fb16e0-8cf9-4d2c-b783-1ad851bf9dd0@intel.com>
 <dpxgkdqk4xlqfezu2xdig63di2nbsim3einoyf4uqytygfxttx@n32pwkzfpg2y>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <dpxgkdqk4xlqfezu2xdig63di2nbsim3einoyf4uqytygfxttx@n32pwkzfpg2y>
X-ClientProxiedBy: BN0PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:408:142::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7976:EE_
X-MS-Office365-Filtering-Correlation-Id: 318ce6bc-92ae-4b2e-9001-08dcfaab9531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1JT92IDqLgc7XWUwRxZWCPsoQ8uvX/qVNmsWHhq7VhthgxnmQSMVPHZ1tl/Z?=
 =?us-ascii?Q?ricJV6MkoNHwHtOtZuOq2sHBz6ZXaWOzxTuwc/Zyi5AKqPygP+ObUIEJi3Kv?=
 =?us-ascii?Q?GV9fISSlnMtUG+Ir5xwamqwLHM8vNSOW4okNi0DUzaFX5AKTLMsL+DemEmQ9?=
 =?us-ascii?Q?g5A3fO+KRXOpHZRO1FigQGC75pZzGBxxsjyoIAHAXul2gyOhWwJ8/ZXGzIS1?=
 =?us-ascii?Q?2/ydVvvW51dEktVuhW2Fq6rwIkiqJEN+4is3YHygnSYLQq86XqhTu9HIerG3?=
 =?us-ascii?Q?B8660T3z02SNteMcZWOSf9JShOI/nrMUpV2zGdIgFLsS8xMFzBanJ5wQTjtL?=
 =?us-ascii?Q?UQq8YomvuTCrELP5yLufK1Qu6ANnvBbi3PnMJ3fj4LiGV6icOdYm2ZFCmOF+?=
 =?us-ascii?Q?rHs+8E6CYLy9XG+cTwfVVbp393OAOHBLjQMBwZMItrkz6Kri7sw7MRL7+IcQ?=
 =?us-ascii?Q?F4AHELuTxmHPV+Rd2lrAokh5B7iWy1twSDZXleEdTwLhHKUXlX+f11E6sd7M?=
 =?us-ascii?Q?6tzvd4VZrc0geJqsk0JCLMwLEAGzxB4xMfixU+G1rmV08QRhgr32TY5PacrO?=
 =?us-ascii?Q?fKOksE7ZSdZYdf7YqRX7HKYrZgXLX9efeSr7VPYXsPFRTiNoNqHUJWLE5sbt?=
 =?us-ascii?Q?K0oL6QI3ssqF/NKVd21ARgTcetZMAms2dbSv6xElJ0t9hjbBXTNU9bMyZSo/?=
 =?us-ascii?Q?wTpwCok3+dDw/teJSPO64FLAEBTdcDrdj+5gpN/+yqFEBaz9IBfPEoJrxh/h?=
 =?us-ascii?Q?GqON4M9FyGHykJQ2UQkxdq66FTa2v462e7QTyOB2t7UivAAxkImKI1TY1Gcj?=
 =?us-ascii?Q?N/fDKSF6Ol7tkQ8kDI3dRQdSBGZl/z0+rErhpzduPQ8P9bHDinmNhp4nUEXq?=
 =?us-ascii?Q?jHWpnXp0uTxZvM9XIg282yb1ZL8WTPeBn3L8LNs7oGO3ca4HJ+hPyqdpUEfM?=
 =?us-ascii?Q?dxuYkl94hb/dvfSUvAZCKxiXb9MgHNw3mnjvYgUHCYIySPtBr7mJS8Q1mYK/?=
 =?us-ascii?Q?5UJpnjIFjCAXlqiljR9izoAJfGVmUoUPn8gkO44ymX+W1rA83UK+zdifVer/?=
 =?us-ascii?Q?g99pY+EB8Semqm5+AwTuvHyPFSvL9C9jThkFbp9jJNPbCpKhDg4Vh9Xb1/9c?=
 =?us-ascii?Q?hq1FGrsEyaO567vwx9bjF1aUytxBA5vNlp3t2abRFALAA+ZJT/ljdWEGeUKd?=
 =?us-ascii?Q?Nl3IOHrvBvRMUMS7Uwc/F7hRQtpedX2HnjR1POMfR/8a0fUHjK2hvUSyr7W3?=
 =?us-ascii?Q?TkXZvyvOwy4U+N9tPnUVtXzZX6O+RO/c3EmYHRRekO+QZpIDJN9hRtgarJsT?=
 =?us-ascii?Q?cTK9tjHGPZh2uEV73Cv2Vh9G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yiQc/3dRVWDibBV8na0Yodtu7gHa5MTMaELJUzNZwNhRJ6LK7j9Bbbm583s9?=
 =?us-ascii?Q?stPI5LtFCv2PlsZkLFYZ7y4mbS9Rsu4kgdByhYmjJdazl/+7BP+ZL2p2XFn3?=
 =?us-ascii?Q?3TGtI9BwFAWGAQkbAO0xTkwVPyjK10moLfS9ldxaLn0jwI+yK1mZdn0OXWAV?=
 =?us-ascii?Q?1q1oRQ6g20NA89aFVznnq6utFZOYeOWWSVNEC8QComok73WY9n34iIKcco4C?=
 =?us-ascii?Q?0kUTNMChytfqW75Ahl7LGzsvxd1ZvasC63B4yMGXMk0F656F/xPisFPNtdWR?=
 =?us-ascii?Q?uhMVkaq4V2I5jSTD3rIFLd3UiYEs2OoAfhLRZ+WzKlduxUBtOrgl/4cW+Brz?=
 =?us-ascii?Q?sBeAWjR7HfqjKMqf2Tnt0XxSOqmJ9quuUio+8XjHtkx4NlLdvAQ1tTYaMTZA?=
 =?us-ascii?Q?z2KZtsIDEYJ60hKu2EnEpL9+AoeMKsUiWv2ccf3atU8VCOLtFUAPMUf7MlBx?=
 =?us-ascii?Q?N8UO4N7os/KEUL0KSRt9OHbJwhwvmERwH2f6Ee5RfpR0077rCx8MmYxmn16X?=
 =?us-ascii?Q?Myqgia8zkvVMG15MosiTNuV0k1K39bVtp2SihdX8zqBzPPgH5XvTacpEo3uI?=
 =?us-ascii?Q?VY6vg0ojwp5ciaUrleOIJUotoExyyaT/d3gr0OAmGXBSAuiAM+6G/4i73VpP?=
 =?us-ascii?Q?6py8lrymgMMzSs+f8Su3Gh8monPVdjYOe32Lj8ha/ZrxVzCdhyO5fGD8ftDW?=
 =?us-ascii?Q?rjcgEN4P3+I9WTtctDacL75OtF3yLsjqkIxdHcFtScMEjDo7AKxbWKesmty1?=
 =?us-ascii?Q?6kbmvYksdq0wslK2xh2UAg6YofgQMEVIAU0ZT3n7XNZiArzIayiDjMWF+b7j?=
 =?us-ascii?Q?PfYADaEpjbedl0g33lKiRhYzda/xrcZWCmtqqM76LKUQrWVeH+UfhGLnAYss?=
 =?us-ascii?Q?E5U6J31Tawb60XyJjy7tscb1Df3cs/sF/EyqDCWQwaylb87z8pl9tMXwpkG5?=
 =?us-ascii?Q?oLd3XotTcWr36LmK64DH+pqLtmLig5EOlhgkUi9WqzqLXE3Ac807A4+z/As0?=
 =?us-ascii?Q?vcuG32uXsTnGnU29eAdb7Hl9xb0xzw/3VEkrWtNpbsOanuSxD8YloDlBGMsJ?=
 =?us-ascii?Q?Fn3lv5reEqWgjUD6BXBDE0JbyS2XuRcVBRpjue1tlE/fMWlfjP322ugj9raF?=
 =?us-ascii?Q?0q6hvgdCHnfLesNSnxKN4xGzK9/eO9oc/jW7/80LtAWSewKilg2be8v5SpEz?=
 =?us-ascii?Q?2xv0uJM7ASbMQVv5ZIAw41hNg/bjwgzE42/JHh6VEfljyPGCxkP86Pu6sYAO?=
 =?us-ascii?Q?tFIUrhKXltVLmPJiTyNTWAlvpJeM6G47lsWF6QQBmzOuFU6dnnhGEttmMZlN?=
 =?us-ascii?Q?GZgMJeBZ7zip+xjDXwd9dACoMRsTUP/rdMZFlf0pRX9pc4LkDqAhx3lGZuSy?=
 =?us-ascii?Q?kw60X9iyOGArl/X8Kn513likHzCUps8PzxI9RB2UgMmMtlbIZed5ZJM2FR4G?=
 =?us-ascii?Q?vHFmEw8j+kpkH/hlst2zsMEGUPy6yZSKJGJ9JAfc9QSbRTxM+e5+2oxwmP3M?=
 =?us-ascii?Q?0IJhxu2ViR+IeQ7TfTs6sRN9Kr+eOQhMkeYFiAazi8e2LxZeQvzgNmsUYr6N?=
 =?us-ascii?Q?E1hqumzdZ3Srloh4ptMUdgGuez4FiBCC/+WcKr1MbkwXXFZ/Kp2hJcsXeqg/?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 318ce6bc-92ae-4b2e-9001-08dcfaab9531
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2024 19:30:03.0932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HItZyFsjAy+HnL3fxsFBA5lWJUxxpeVnoI12dtLGQ0Z4ZtDMSLpXNUPcRGLokyeVc6jyiyqckg7A10ZK1zZ8t+rTI52x5cMoYI/UDdh4Pz4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7976
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

On Fri, Nov 01, 2024 at 02:19:22PM -0500, Lucas De Marchi wrote:
>On Fri, Nov 01, 2024 at 11:39:59AM -0700, John Harrison wrote:
>>On 11/1/2024 08:07, Raag Jadav wrote:
>>>On Fri, Nov 01, 2024 at 07:44:37AM -0500, Lucas De Marchi wrote:
>>>>On Fri, Nov 01, 2024 at 07:47:54AM +0200, Raag Jadav wrote:
>>>>>On Thu, Oct 31, 2024 at 11:29:15AM -0700, Lucas De Marchi wrote:
>>>>>
>>>>>...
>>>>>
>>>>>>- * Snapshot at hang:
>>>>>>- * The 'data' file is printed with a drm_printer pointer at devcoredump read
>>>>>>- * time. For this reason, we need to take snapshots from when the hang has
>>>>>>- * happened, and not only when the user is reading the file. Otherwise the
>>>>>>- * information is outdated since the resets might have happened in between.
>>>>>>+ * The following characteristics are observed by xe when creating a device
>>>>>>+ * coredump:
>>>>>>  *
>>>>>>- * 'First' failure snapshot:
>>>>>>- * In general, the first hang is the most critical one since the following hangs
>>>>>>- * can be a consequence of the initial hang. For this reason we only take the
>>>>>>- * snapshot of the 'first' failure and ignore subsequent calls of this function,
>>>>>>- * at least while the coredump device is alive. Dev_coredump has a delayed work
>>>>>>- * queue that will eventually delete the device and free all the dump
>>>>>>- * information.
>>>>>>+ * **Snapshot at hang**:
>>>>>>+ *   The 'data' file contains a snapshot of the HW state at the time the hang
>>>>>>+ *   happened. Due to the driver recovering from resets/crashes, it may not
>>>>>>+ *   correspond to the state of when the file is read by userspace.
>>>>>Does that mean the devcoredump will be present even after a successful recovery?
>>>>yes.... if it's not succesful then it's moved to the wedged state. Easy
>>>>way to test is running this:
>>>>
>>>>	xe_exec_threads --r threads-hang-basic
>>>>
>>>>You should see something like this in your dmesg:
>>>>
>>>>	[IGT] xe_exec_threads: starting subtest threads-hang-basic
>>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=rcs, logical_mask: 0x1, guc_id=34
>>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=bcs, logical_mask: 0x1, guc_id=32
>>>>	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vcs, logical_mask: 0x1, guc_id=18
>>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=34, flags=0x0 in xe_exec_threads [2636]
>>>>	xe 0000:00:02.0: [drm] GT1: Engine reset: engine_class=vecs, logical_mask: 0x1, guc_id=17
>>>>	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=18, flags=0x0 in xe_exec_threads [2636]
>>>>	xe 0000:00:02.0: [drm] Xe device coredump has been created
>>>>-->	xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
>>>>	xe 0000:00:02.0: [drm] GT1: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=17, flags=0x0 in xe_exec_threads [2636]
>>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=32, flags=0x0 in xe_exec_threads [2636]
>>>>	xe 0000:00:02.0: [drm] GT0: Engine reset: engine_class=ccs, logical_mask: 0x1, guc_id=27
>>>>	xe 0000:00:02.0: [drm] GT0: Timedout job: seqno=4294967169, lrc_seqno=4294967169, guc_id=27, flags=0x0 in xe_exec_threads [2636]
>>>>	[IGT] xe_exec_threads: finished subtest threads-hang-basic, SUCCESS
>>>>
>>>>
>>>>If you run it again, it won't overwrite the previous dump, until user
>>>>cleans the previous dump or the timeout on the kernel side fires to
>>>>release it.
>>>Yes, which I think we're covering at later point in "First failure only".
>>>So maybe establishing the mechanism itself before explaining reset/recovery
>>>would be a bit neater...
>>>
>>>>From a distro-integration pov, I think it should have a udev rule that
>>>>fires when a devcoredump is created so the dump is copied to persistent
>>>>storage. Just like it happens with cpu coredump (see systemd-coredump)
>>>>
>>>>>Perhaps moving the 'release' part to above paragraph will add required context.
>>>>not sure I follow. Are you suggesting to swap the order of "First
>>>>failure only" and "Snapshot at hang" ?
>>>... in whichever way you think is best.
>>Note that 'snapshot at hang' and 'first failure only' are totally 
>>separate concepts. And neither explains the release mechanism. 
>>Reversing the order of the descriptions would be incorrect, IMHO.
>>
>>The point of 'snapshot at hang' is to say that the universe 
>>continues existing after the snapshot is taken. It is not just that 
>>the driver recovers but that it keeps processing new work. In an 
>>active system, it is extremely unlikely the system state (hardware 
>>or software) would match what is in the snapshot by the time the 
>>user is able to read the snapshot out. That has nothing to do with 
>>when or if the snapshot is released, nor with how many snapshots are 
>>taken.
>>
>>The point of 'first failure only' is that only one snapshot is taken 
>>at a time. If there are multiple back to back hangs then only the 
>>first will generate a snapshot. Further snapshots will only be 
>>created for new hangs after the existing snapshot has been 
>>'released'. And I'm not seeing mention of how to release the 
>>snapshot? It would be good to add a quick comment about that.
>
>does this look better for y'all?

trying to paste again, with whitespaces and typo fixed:

/**
  * DOC: Xe device coredump
  *
  * Xe uses dev_coredump infrastructure for exposing the crash errors in a
  * standardized way. Once a crash occurs, devcoredump exposes a temporary
  * node under ``/sys/class/devcoredump/devcd<m>/``. The same node is also
  * accessible in ``/sys/class/drm/card<n>/device/devcoredump/``. The
  * ``failing_device`` symlink points to the device that crashed and created the
  * coredump.
  *
  * The following characteristics are observed by xe when creating a device
  * coredump:
  *
  * **Snapshot at hang**:
  *   The 'data' file contains a snapshot of the HW state at the time the hang
  *   happened. Due to the driver recovering from resets/crashes, it may not
  *   correspond to the state of when the file is read by userspace.
  *
  * **Coredump release**:
  *   After a coredump is generated, it stays in kernel memory until released by
  *   userpace by writing anything to it, or after an internal timer expires. The
  *   exact timeout may vary and should not be relied upon. Example to release
  *   a coredump:
  *
  *   .. code-block:: shell
  *
  *      $ > /sys/class/drm/card0/device/devcoredump/data
  *
  * **First failure only**:
  *   In general, the first hang is the most critical one since the following
  *   hangs can be a consequence of the initial hang. For this reason a snapshot
  *   is taken only for the first failure. Until the devcoredump is released by
  *   userspace or kernel, all subsequent hangs do not override the snapshot nor
  *   create new ones. Devcoredump has a delayed work queue that will eventually
  *   delete the file node and free all the dump information.
  */

Lucas De Marchi
