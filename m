Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D8DEE57C2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 23:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C16F110E0A7;
	Tue, 30 Dec 2025 23:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mySdoTgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8C210E0A7
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Dec 2025 23:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767137778; x=1798673778;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9dovrbt5P6LimJmv9a5xK3UWFBuFT7qc8H9Av6xN0XI=;
 b=mySdoTgAkh6cnhtMrjkEMU+/no0/WAOa2HYXELC2zWgvohEmQsvhLRw6
 ptTP8OCeoEEC5yYUtGKZs829h62I7ytuXF3+sP5j/SCw6sCdEpZVdLwjw
 2P8RKBuoI8LDn7R19z+IwVTdkY6jzY6tHh/zCGPz7kYLpyJ3x7j6cpIL9
 9tVSHpq+iMX7ODJpawFmYGzohxLZUS10bYCifXWrun5wxiJnyn48EO/5B
 GTnDJbdw2sOJDIEM+N5weSpsFMDDBhpZkvtG6TCoRQLVPG08Yk+zZl4es
 CSJ7sAo4EnbygejwEEYLQiqN3e8FuDwZ/MLxoFykSiZskWv6cWTw8vJR9 w==;
X-CSE-ConnectionGUID: Tl3BoRJ2RDaTasKjT6K5Eg==
X-CSE-MsgGUID: w4gZUVDnTyKRNvtJzyGhiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80170685"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="80170685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 15:36:17 -0800
X-CSE-ConnectionGUID: Xd7T6NaCTiSnp/q9x7NPrw==
X-CSE-MsgGUID: IPtr65rTTbKTlMhLH8h6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; d="scan'208";a="202268115"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 15:36:16 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 15:36:16 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 30 Dec 2025 15:36:16 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Dec 2025 15:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPE7toKJwHd23unblfe1vUXFzioOxGZJZNkZFpoH3zRLvjR3enHKFDO0dgI84DGJ436k2UDZ/cxTiQv6K2XONMOnrDr2Rd5u6KPvjBxmiDLIZV9fTRa5T9K2EknqpYSvDtpCbNUpNc9aJt97GSRX6u2/TJjEjRCjYyhn6qDCHdR7KlwqkYCApJnVrD16Wyl2LEvHmCVMgFMd1mDngIgXmVmA6UEeJFsY5E6MGoW4b72zMBvGLJ9yRvtWgll7KVXFrHTJHJU3JLMCP3O7R+QV3VaAsZo8UgVv4hWBMMf50GTx4y0lb0+yYQiotb96MzydLC87XvwXGeeqiXV4EGUs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIDk8yZ+VeSWFPBnQ+rm7r476knLK4uqd2kAVkbOhrM=;
 b=SsvwjILAQv9gr+NtoPl2XgZtWVfsy5o9qzB2nkKWs33yjhiOCZIA7qUbYPrvrca2N3/hwFMtwIxJxxmsGv5o0MccXT0YWB8i9JkCjtbh7gdcM9eEq7qMP5l2ZMJfLQBtRR+rDchAFOeuhEc0gHkbAj/igzMgabPX4xTZS2mAqv7eeXFecGvZFy2XTUS39nwMK/okkLpKchQvXRQ2EJer01BwN5W5S/vjzmIMhRdbPANfjVBMGzcyaQ2Y3SBadatf+Lh/uou2rUe9SR85+vw0Bbgei3/Phr7LVb6zhGPsVgCXPwTVT/OT4yPvyAs5D/ab3zbMHijwPCKmqBzWUNJpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY8PR11MB7340.namprd11.prod.outlook.com (2603:10b6:930:84::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 30 Dec
 2025 23:36:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9456.008; Tue, 30 Dec 2025
 23:36:13 +0000
Date: Tue, 30 Dec 2025 15:36:06 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v1 1/1] drm/xe/sysctrl: Add system controller component
 for Xe3p dGPU platforms
Message-ID: <aVRh5o7gifmgkFdF@soc-5CG1426VCC.clients.intel.com>
References: <20251230151722.293657-3-anoop.c.vijay@intel.com>
 <20251230151722.293657-4-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230151722.293657-4-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY8PR11MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fab180b-2baa-465c-f8fb-08de47fc3837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZE1iSm9NWTJyeEVxaW03QlVXcE8rVEJ6UmlITnc5cWptT05aUTFvb3o0MUpG?=
 =?utf-8?B?RWMrNUVVc2ZVZkxhVFAwbVFQUXRQZXJ3aEY1K3lJcEtoS0tOTDd3NlNHd1hZ?=
 =?utf-8?B?K2JmS0R2VUZYTU95R0FsTmhrRnhOVlVXWkliYzN1YUJJOS9JR0J5aW5OZVND?=
 =?utf-8?B?RHRDTDAwWm9lYktUNzRub2pyeFE1dXozK0kxdXJidmpKeGNSbmhBZzByOUUz?=
 =?utf-8?B?WlRyNVArK3NDRDJJU01YZk1KdWZjMS9RczMxMzlDc0dSU0FEL2xiMCtXenFr?=
 =?utf-8?B?QUUvUWRpTnBJTEZTeTdwcUJXWWVKWE5vQXpPbit6STBFQU8yQlBFd0dPV0NW?=
 =?utf-8?B?cmtTOHlrNjZCV1JuSFhCTGF1UWJxR0QxRk5tZExML3ppV01MaE1NSDlyOXNs?=
 =?utf-8?B?aXM0RUQ2dEhtdFFXb0kwRE1pdGxUNVkyQ1ZOQVlLR2ZCL2xpSW5JcG40cVo3?=
 =?utf-8?B?bnd4QVp3SFgxeE41WWdTNnZyQXBaZFdoK2JmTUJmVzNkdmhCWWNWanVHcEdH?=
 =?utf-8?B?Q2JzajRvOHlkWEV0U3Z4cDBIWVFmSmV6UWljMUVjR3dTSWVuanZXZ0pxWFRi?=
 =?utf-8?B?R3h1TGo1SDN3dWphNFV6d3YvWjlhbk45a2VmRzltVmNqQUdlSWR6cGpCVjdl?=
 =?utf-8?B?YVk4MmcxeUgyWlRPQUEvcUI4NTVZd0YrK1lac0FYOC9ETEw5amdENWk0UEQ3?=
 =?utf-8?B?VXB6TzF4QTZYRGlCRTVyMGlzaUkraHY3RlFCeTByWVBPQ0haOXMwVXBKRENs?=
 =?utf-8?B?WTZDTDc0K0pYQ00vUDR4N2FMQVJQcGN4TTJtUDlERlRUaWRIV05rdFFHZjVY?=
 =?utf-8?B?RDlIaWppNEllUXNCVXhtWEVDUVIrM0dRUWlWcEJ3clZSVFY3dVZhK1BCT1la?=
 =?utf-8?B?WFYvdC9mNkJXcUZab0oreTBwbUtPb1h4T1NCMHhkcHd2ejVLdU9pNzRtLzJF?=
 =?utf-8?B?cE96K0hQUUN1NHVxMjl6S3pkRmtLUGlIbUNSVnY3d25jd0NFMmpIVjd5dEZU?=
 =?utf-8?B?M2RGMjVTbFpaVkNISFBBdUo2V3V0YXdnMyt0Z0ZHczQxVjhZZi9zTmZqRkxm?=
 =?utf-8?B?Q3lySkJaMFJXTy9XTHovUGxCTE1lWWxzNm9GTXpFV2VtSlVJUnZvemNwQzM0?=
 =?utf-8?B?OFBOTU1VbUJpZ0pSM3pST2d6akJwakJuQ1hqVWcwUWtEUG5laFdNY0tGN0Q1?=
 =?utf-8?B?U2dSaW1rMDJKS081TU5XcjRqWFlBNDE3SjhPQXRUWWpNL3NsQXhTK3d6SkNW?=
 =?utf-8?B?aVM5L1ZNQnhKM0xsUG1jb0kvbUw2VlZDaHJVUkwzTERsTWpsbVZYLzJFZ1pr?=
 =?utf-8?B?K2t1c29LaTAvWGl6cEpVc01BYTlCNTZXN01yeHh5V2ZDWWJ4bURHTFZJNEJX?=
 =?utf-8?B?WjhVQUlvakd4WS8zVzdKdi9iQnIxZjE5QXA3WGZRR1M1bm1iVXZBaGttcTQz?=
 =?utf-8?B?d00vZXZXN3ppQ0ZzM2JRTGlkd2xsdHJpUjQzMzVUTVBQK3M5ODV2UGVrMzFP?=
 =?utf-8?B?dHBmdnkwQU1NQUpuMmVQeVNKc0lXdkhnRGhHc2JGY1RZWklyRm5OMjk0YmFl?=
 =?utf-8?B?REJ0R2VFbC9xSHpETmR2YXdSVnMxVzRxNkNRaTRhNENxOEpnUHMwci9ZamVk?=
 =?utf-8?B?a2ZoWE9aUUZDR2JvckZuZHNtWHp6QUppeW10Z09IL0Z0MW5oaGJRZHdPMlpC?=
 =?utf-8?B?WVFWbXNvZjlsUkoxSGNqM1BtSC9aWVRJRmJBOTd0SnplaWJnL2RMcjh2UWtB?=
 =?utf-8?B?MVR5djZOZ2lodHNvMjIrWjhwRmtOS3M1Tmt5QkJ1b05SakExYWtYRDh2bEk2?=
 =?utf-8?B?SUh6TCtGN3FZZEtpcklJWFZjTU1EaElndjN4UHozQUZmUnp6RHVYVnFhUHNL?=
 =?utf-8?B?Z0RJSUNIbU9SQXVYZGtXZEZZVjlGb2V0OW9lMkp6bHR3eDlBMzRqa2c2WWs5?=
 =?utf-8?B?ZGcvV2JiQmNzTStwa0Q5RmZOV2RmN1ByeGY0K0Z4QzNDaGlnUWVvLzQvQlNs?=
 =?utf-8?B?SHA4Q3QzL09BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHhpVklPSHh4cytQbEc3bjVyUTB6VzN6Z1FTSC9jTjJ0bjlzTTRKMmtHaXM0?=
 =?utf-8?B?NThJUEpraWE4VnFIZHMwNlRXUTBYbFJCaGNMbGs4WTE4UEpaRTh4S0RWQUto?=
 =?utf-8?B?WUJVczJvYXJ2bUVqNzR3aE91dUtWdU9aY2xOZTArdjd2UEVwT0tMWHdJazBN?=
 =?utf-8?B?R3VvSFZaSmtKaEdia3FUNTR1V0hoQVZDU0l0Y0ZIc21hck9nV0NYQnBDUVBE?=
 =?utf-8?B?NHVwRXNUR3E2eXpjUStjS05xRENKYzNPRnV2dk9qSTl3M1pnZEUyZHQ0M21x?=
 =?utf-8?B?b3A5L3ljVm9HQlp3eVlmTHl2YUYrSW1vMktCOHhDSUNyM0VDTTNJRzh5dWlk?=
 =?utf-8?B?QjJOWkNpRWR2ZytjQ1RSbHNLa1dpV3BvOGNQay9wNU1SV2Ivbnh5YzJVYmo4?=
 =?utf-8?B?WVJiSnFLY0dLMnNYTUFidUM3ZzEyOWJNV2o0S0JGTlBhaFZBZ1VSMVR5aGZh?=
 =?utf-8?B?YWx5U2ZNeDJ2eDhZOVBMS3Jwdis2WlpqUHFWMisvaTB4WFB1WGc0QnRVR0Rm?=
 =?utf-8?B?UGxmaXVxdWtlanNWdnh0UjdTOUlzQnBBMlg5ZU0wUXQwWGw1U3NXTGV1OFFp?=
 =?utf-8?B?c1kxbUtBWG5CaHp0NmpkWldkUUNPQml6dkU2aGRtTGFTSCsxVEpxUWVGREtj?=
 =?utf-8?B?THVlWGs3K1l2dHc4MjJINHhrK2lHMEJHaDgxTnVEcmNsVGhvSjFJUGZROTM0?=
 =?utf-8?B?ODMxWUQ5WjRvSGRCeWFUSFZCbUNLWmo5WlJTZHE3OVZCaXREWDZ1czZMaTQ3?=
 =?utf-8?B?bjBSVk44NjVjYjdGa1RmYmRhdzJIT3Z4MGlSTm1LQVZBV3R1bGFQbzhHVk13?=
 =?utf-8?B?U3lFT1QrMDlrekh3QWRPNkdpbXpOWmRYdEVIanhlRlJUb284NU40QkdWRGF4?=
 =?utf-8?B?aUs2VzRYQ0F1TFFJWTREVjFxTHRQcUtwTWFPaUpreW9UQThIQ0tTZGxFZDdu?=
 =?utf-8?B?bGIwRXpHNkc2OFROSE5yYklvRTBWRUc1NzFHbit4R2EvaDdCekIrd2t5M3E5?=
 =?utf-8?B?UG41Vm9lV2ozU0JzYmZad1VQd1RhbG42azcybzl0Um1hTjNIQUVYU2t0OGdD?=
 =?utf-8?B?LzAzU2VZRHdndWE4WmtvdjBQaFBMZnQ4YWVyYy9PWERsSGIyU1lWTmowMm1O?=
 =?utf-8?B?SDdFeUIyRXp5bG0xc3ZYNHVXblVpY0VoN2FJRjFTTzhmcjJKaWVkckh3SFFi?=
 =?utf-8?B?ODQ0RTBTSjVpK1YzUS9hYzdNNUxTWUx1QlBEeVVCM3paVWo1VlZRT2ZhaW51?=
 =?utf-8?B?ZGdKdmp4YWNXWWllNmVzZHR3ZzFtOXJHU2dHUmNsQys2aG5kaGcrK1dwZW11?=
 =?utf-8?B?a2VmdnVsRnlnUEVScWQ0TDdBaXhzQlk3Vk1xblVFbjc5TlFZU3cwZm1tUjk5?=
 =?utf-8?B?TmZoTXJYUzE3STRtMXA1WFBRUjA1RU1NUVlBbTY1ZTN5cHRXUkZNelFPNHV3?=
 =?utf-8?B?dGJtajdkSU5QRnJzYmZlbVBnbDUxMDdYYWhXYnhLaE53Y3Z2eUpPeDRsWDR2?=
 =?utf-8?B?N3liWDNNMXhPUkxadTFXUHdGYk4xY3hyNExJTDBsNmhWZWlLcGZIeTRjVm5j?=
 =?utf-8?B?QloyVklTbkZEWWM3ZXpmZEVGUUd0dzZYU2VIWW1wQllaSkNXU2N2VDd2d2Vp?=
 =?utf-8?B?Mll3SUprNVNOeFpnLzIrSVpDWkQvaGRtKzE5MCs4cHJ6VzVpUFNnbHZKcmlk?=
 =?utf-8?B?QWxSZ044NmREMWFTVkQ0dHVNcXk3SjNvZUk4NW44QUtkOTlKM2dIRVpTN1Q0?=
 =?utf-8?B?QnlFTzhBd3NwWHVPcGViSngvek1nOFd5QzlXZkFWdHR6OWFTcmlwSHRpRnRG?=
 =?utf-8?B?Q0xQQUJ1Nk5KdWNZS1pKekxHWWI1aUhaZHFlRzlBN2ROZlhBQUlwemMyYnpR?=
 =?utf-8?B?ckZ3ak9Ja1hIMU8rZnowdUE3Nmc2eXNJL0pwbTNHMGNEWk1kUG1tY2lCU0RB?=
 =?utf-8?B?WTY3ekZYMVVMMzdMdFlWZVlVWlVPRUZZTWpIREFnbWJGblk5Skp1WmR6aWVG?=
 =?utf-8?B?RVBJYVorUFZDSW02ZHhpK0k4eVpKcmlnTlBDTUFZZW4rRUpJa251NlhWdHBw?=
 =?utf-8?B?eTBqUm5vMkdsbUZHclRpeGxRYkhLZXNDZzAxaks0WjRqVGJnNW15S2d2blY4?=
 =?utf-8?B?RldiZG1VRVZQNE9wcEc2cEVWcWlrWUlVaDVhVU9sVW9nYkRjWktjZ3kwUVhh?=
 =?utf-8?B?bzJRUjIzWmExSzkrZUVtUWpzNEdMTnZKMllPK1d4SE95c3IrRElLRmUwSU5p?=
 =?utf-8?B?TDNPNWRFTzlGRUJrdWRxck5wU2QvNFg2eW1SaitaSFlvbTJRalRla2k4aXlx?=
 =?utf-8?B?SlVYSXp3ZmJZTG91OEt1N2RTd0wzb2ZaTkorZG5ENlhmUkNaTHMrV2tvcjYz?=
 =?utf-8?Q?xJ/Xm6U+CQ3xietI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fab180b-2baa-465c-f8fb-08de47fc3837
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 23:36:13.6670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h4cQetGEt1VG1bbdwWeP6AgHgXysv3474rawIUqlK/jtVuB8KUvPGO2s0dnsPxAa1Lorz/uf/gNhNItKuTLeqfDUVzOIf36WdCrouTrd0c0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7340
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

On Tue, Dec 30, 2025 at 07:17:23AM -0800, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add a new system controller (sysctrl) component for Intel Xe3p dGPU platforms.
>
>This component provides the foundational infrastructure for communication
>with the System Controller firmware using MKHI protocol over a mailbox interface.
>
>Key features introduced:
> - Detection and initialization of System Controller interface on Xe3p dGPU platforms
> - Mailbox communication with System Controller firmware
> - Fragmented message transfer for large command payloads
>
>This implementation establishes the base for future System Controller feature
>enablement and firmware command handling.
>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

Commit message should follow '75 chars per line' format. In general, 
please look at the CI.Hooks and CI.checkpatch warnings/errors and fix 
those.

checkpatch can be run before posting:
https://docs.kernel.org/dev-tools/checkpatch.html

>---
> drivers/gpu/drm/xe/Makefile               |   2 +
> drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h |  44 +++
> drivers/gpu/drm/xe/xe_device.c            |   5 +
> drivers/gpu/drm/xe/xe_device_types.h      |   6 +
> drivers/gpu/drm/xe/xe_pci.c               |   2 +
> drivers/gpu/drm/xe/xe_pci_types.h         |   1 +
> drivers/gpu/drm/xe/xe_sysctrl.c           |  64 ++++
> drivers/gpu/drm/xe/xe_sysctrl.h           |  13 +
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c   | 438 ++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.h   |  61 +++
> drivers/gpu/drm/xe/xe_sysctrl_types.h     |  25 ++
> 11 files changed, 661 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 3315f93a35b2..cd03e4c53127 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -121,6 +121,8 @@ xe-y += xe_bb.o \
> 	xe_step.o \
> 	xe_survivability_mode.o \
> 	xe_sync.o \
>+	xe_sysctrl.o \
>+	xe_sysctrl_mailbox.o \
> 	xe_tile.o \
> 	xe_tile_sysfs.o \
> 	xe_tlb_inval.o \
>diff --git a/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>new file mode 100644
>index 000000000000..b31b6e24c18e
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_sysctrl_regs.h
>@@ -0,0 +1,44 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_REGS_H_
>+#define _XE_SYSCTRL_REGS_H_
>+
>+#include "xe_regs.h"
>+
>+#define SYSCTRL_BASE_OFFSET		0xDB000
>+#define SYSCTRL_BASE			(SOC_BASE + SYSCTRL_BASE_OFFSET)
>+#define SYSCTRL_MAILBOX_INDEX		0x03
>+#define SC_BAR_LENGTH			0x1000
>+
>+#define SC_MB_CTRL			XE_REG(SYSCTRL_BASE + 0x10)
>+#define   SC_MB_CTRL_RUN_BUSY		REG_BIT(31)
>+#define   SC_MB_CTRL_IRQ		REG_BIT(30)
>+#define   SC_MB_CTRL_RUN_BUSY_OUT	REG_BIT(29)
>+#define   SC_MB_CTRL_PARAM3_MASK	REG_GENMASK(28, 24)
>+#define   SC_MB_CTRL_PARAM2_MASK	REG_GENMASK(23, 16)
>+#define   SC_MB_CTRL_PARAM1_MASK	REG_GENMASK(15, 8)
>+#define   SC_MB_CTRL_COMMAND_MASK	REG_GENMASK(7, 0)
>+
>+#define SC_MB_DATA0			XE_REG(SYSCTRL_BASE + 0x14)
>+#define SC_MB_DATA1			XE_REG(SYSCTRL_BASE + 0x18)
>+#define SC_MB_DATA2			XE_REG(SYSCTRL_BASE + 0x1C)
>+#define SC_MB_DATA3			XE_REG(SYSCTRL_BASE + 0x20)
>+
>+#define MKHI_FRAME_PHASE		REG_BIT(24)
>+#define MKHI_FRAME_CURRENT_MASK		REG_GENMASK(21, 16)
>+#define MKHI_FRAME_TOTAL_MASK		REG_GENMASK(13, 8)
>+#define MKHI_FRAME_COMMAND_MASK		REG_GENMASK(7, 0)
>+
>+#define SC_MB_FRAME_SIZE		16
>+#define SC_MB_MAX_FRAMES		64
>+#define SC_MB_MAX_MESSAGE_SIZE		(SC_MB_FRAME_SIZE * SC_MB_MAX_FRAMES)
>+#define SC_MKHI_COMMAND			5
>+
>+#define SC_MB_DEFAULT_TIMEOUT_MS	500
>+#define SC_MB_RETRY_TIMEOUT_MS		20
>+#define SC_MB_POLL_INTERVAL_US		100
>+
>+#endif /* _XE_SYSCTRL_REGS_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index e101d290b2a6..805d48dd954d 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -66,6 +66,7 @@
> #include "xe_survivability_mode.h"
> #include "xe_sriov.h"
> #include "xe_svm.h"
>+#include "xe_sysctrl.h"
> #include "xe_tile.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_sys_mgr.h"
>@@ -1032,6 +1033,10 @@ int xe_device_probe(struct xe_device *xe)
> 	if (err)
> 		goto err_unregister_display;
>
>+	err = xe_sysctrl_init(xe);
>+	if (err)
>+		goto err_unregister_display;
>+
> 	err = xe_device_sysfs_init(xe);
> 	if (err)
> 		goto err_unregister_display;
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index a85be9ba175e..6295b2c35d4a 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -29,6 +29,7 @@
> #include "xe_sriov_vf_ccs_types.h"
> #include "xe_step_types.h"
> #include "xe_survivability_mode_types.h"
>+#include "xe_sysctrl_types.h"
> #include "xe_tile_sriov_vf_types.h"
> #include "xe_validation.h"
>
>@@ -340,6 +341,8 @@ struct xe_device {
> 		u8 has_soc_remapper_telem:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -606,6 +609,9 @@ struct xe_device {
> 	/** @heci_gsc: graphics security controller */
> 	struct xe_heci_gsc heci_gsc;
>
>+	/** @sc: System Controller */
>+	struct xe_sysctrl sc;
>+
> 	/** @nvm: discrete graphics non-volatile memory */
> 	struct intel_dg_nvm_dev *nvm;
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 91e0553a8163..b6dc3030b673 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc = {
> 	.has_soc_remapper_sysctrl = true,
> 	.has_soc_remapper_telem = true,
> 	.has_sriov = true,
>+	.has_sysctrl = true,
> 	.max_gt_per_tile = 2,
> 	.require_force_probe = true,
> 	.va_bits = 57,
>@@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
> 	xe->info.has_soc_remapper_telem = desc->has_soc_remapper_telem;
> 	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> 		desc->has_sriov;
>+	xe->info.has_sysctrl = desc->has_sysctrl;
> 	xe->info.has_mem_copy_instr = desc->has_mem_copy_instr;
> 	xe->info.skip_guc_pc = desc->skip_guc_pc;
> 	xe->info.skip_mtcfg = desc->skip_mtcfg;
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 5f20f56571d1..53e44a32883d 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -56,6 +56,7 @@ struct xe_device_desc {
> 	u8 has_soc_remapper_sysctrl:1;
> 	u8 has_soc_remapper_telem:1;
> 	u8 has_sriov:1;
>+	u8 has_sysctrl:1;
> 	u8 needs_scratch:1;
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
>new file mode 100644
>index 000000000000..9f3e0b1db380
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.c
>@@ -0,0 +1,64 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include "xe_sysctrl.h"

The above header should just be placed in alphabetical order below.

>+
>+#include <linux/device.h>
>+#include <linux/mutex.h>
>+
>+#include <drm/drm_managed.h>
>+
>+#include "regs/xe_sysctrl_regs.h"
>+#include "xe_device.h"
>+#include "xe_printk.h"
>+#include "xe_soc_remapper.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+
>+static void xe_sysctrl_fini(void *arg)
>+{
>+	struct xe_sysctrl *sc = arg;
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);

You could use a helper and replace it everywhere with sc_to_xe(sc):

static struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
{
	return container_of(sc, struct xe_device, sc);
}

>+
>+	if (!xe->soc_remapper.set_sysctrl_region)
>+		return;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, 0);
>+}
>+
>+/**
>+ * xe_sysctrl_init - Initialize SC subsystem
>+ * @xe: xe device instance
>+ *
>+ * Entry point for SC initialization, called from xe_device_probe().
>+ * This function checks platform support and initializes the system controller.
>+ *
>+ * Return: 0 on success, error code on failure
>+ */
>+int xe_sysctrl_init(struct xe_device *xe)
>+{
>+	struct xe_sysctrl *sc = &xe->sc;
>+	int ret;
>+
>+	if (!xe->info.has_sysctrl)
>+		return 0;
>+
>+	ret = devm_add_action_or_reset(xe->drm.dev, xe_sysctrl_fini, sc);
>+	if (ret)
>+		return ret;
>+
>+	if (!xe->soc_remapper.set_sysctrl_region)
>+		return -ENODEV;
>+
>+	xe->soc_remapper.set_sysctrl_region(xe, SYSCTRL_MAILBOX_INDEX);
>+
>+	ret = drmm_mutex_init(&xe->drm, &sc->cmd_lock);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_init(sc);
>+
>+	return 0;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
>new file mode 100644
>index 000000000000..f1ad12656e48
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_H_
>+#define _XE_SYSCTRL_H_
>+
>+struct xe_device;
>+
>+int xe_sysctrl_init(struct xe_device *xe);
>+
>+#endif /* _XE_SYSCTRL_H_ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>new file mode 100644
>index 000000000000..e9f4d4b13bb1
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -0,0 +1,438 @@
>+// SPDX-License-Identifier: MIT
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#include <linux/bitfield.h>
>+#include <linux/errno.h>
>+#include <linux/minmax.h>
>+#include <linux/mutex.h>
>+#include <linux/slab.h>
>+#include <linux/string.h>
>+#include <linux/types.h>
>+
>+#include <drm/drm_print.h>

Do you still need this one? Can you also double check if all headers 
here are needed.

>+
>+#include "xe_device.h"
>+#include "xe_mmio.h"
>+#include "xe_pm.h"
>+#include "xe_printk.h"
>+#include "xe_sysctrl.h"
>+#include "xe_sysctrl_mailbox.h"
>+#include "xe_sysctrl_types.h"
>+#include "regs/xe_sysctrl_regs.h"
>+
>+static bool xe_sysctrl_mailbox_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>+					      unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	int ret;
>+
>+	ret = xe_mmio_wait32_not(xe_root_tile_mmio(xe), SC_MB_CTRL, bit_mask, bit_mask,
>+				 timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static bool xe_sysctrl_mailbox_wait_bit_set(struct xe_sysctrl *sc, u32 bit_mask,
>+					    unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	int ret;
>+
>+	ret = xe_mmio_wait32(xe_root_tile_mmio(xe), SC_MB_CTRL, bit_mask, bit_mask,
>+			     timeout_ms * 1000, NULL, false);
>+
>+	return ret == 0;
>+}
>+
>+static int xe_sysctrl_mailbox_write_frame(struct xe_sysctrl *sc, const void *frame,
>+					  size_t len)
>+{
>+	static const struct xe_reg data_regs[] = {
>+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>+	};
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	const u8 *bytes = frame;
>+	u32 reg_data;
>+	size_t i;
>+
>+	if (len == 0 || len > SC_MB_FRAME_SIZE) {
>+		xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
>+		return -EINVAL;
>+	}

This check seems redundant. You are already rounding up cmd_size to 
frames and then the frame size passed to this function can only be up to 
SC_MB_FRAME_SIZE, but not zero. If this function were called from 
outside this file, then additional checks makes sense, but it's static, 
so this check can be dropped.

>+
>+	for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
>+		reg_data = *(const u32 *)(bytes + i);
>+		xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)], reg_data);
>+	}
>+
>+	if (i < len) {
>+		size_t remaining = len - i;
>+		size_t j;
>+
>+		reg_data = 0;
>+		for (j = 0; j < remaining; j++)
>+			reg_data |= (u32)bytes[i + j] << (j * 8);
>+
>+		xe_mmio_write32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)], reg_data);
>+	}

I would suggest to simplify the logic here to make it more readable, something
like:

static const struct xe_reg regs[] = {
	SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
};
struct xe_device *xe = container_of(sc, typeof(*xe), sc);
struct xe_mmio *mmio = xe_root_tile_mmio(xe);
u32 dw = DIV_ROUND_UP(len, sizeof(u32));
u32 val[SC_MB_FRAME_SIZE/4] = {0}, i;

memcpy(val, frame, len);
for (i = 0; i < dw; i++)
	xe_mmio_write32(mmio, regs[i], val[i]);

return 0;

>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_read_frame(struct xe_sysctrl *sc, void *frame,
>+					 size_t len)
>+{
>+	static const struct xe_reg data_regs[] = {
>+		SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
>+	};
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	u8 *bytes = frame;
>+	u32 reg_data;
>+	size_t i;
>+
>+	if (len == 0 || len > SC_MB_FRAME_SIZE) {
>+		xe_err(xe, "sysctrl: Invalid frame len: %zu\n", len);
>+		return -EINVAL;
>+	}
>+
>+	for (i = 0; i + sizeof(u32) <= len; i += sizeof(u32)) {
>+		reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)]);
>+		*(u32 *)(bytes + i) = reg_data;
>+	}
>+
>+	if (i < len) {
>+		size_t remaining = len - i;
>+		size_t j;
>+
>+		reg_data = xe_mmio_read32(xe_root_tile_mmio(xe), data_regs[i / sizeof(u32)]);
>+
>+		for (j = 0; j < remaining; j++)
>+			bytes[i + j] = (reg_data >> (j * 8)) & 0xFF;
>+	}

A logic similar to the write frame can likely be used to simplify this function.

static const struct xe_reg regs[] = {
	SC_MB_DATA0, SC_MB_DATA1, SC_MB_DATA2, SC_MB_DATA3
};
struct xe_device *xe = container_of(sc, typeof(*xe), sc);
struct xe_mmio *mmio = xe_root_tile_mmio(xe);
u32 dw = DIV_ROUND_UP(len, sizeof(u32));
u32 val[SC_MB_FRAME_SIZE/4] = {0}, i;

for (i = 0; i < dw; i++)
	val[i] = xe_mmio_read32(mmio, regs[i]);

memcpy(frame, val, len);

return 0;
>+
>+	return 0;
>+}
>+
>+static void xe_sysctrl_mailbox_clear_response(struct xe_sysctrl *sc)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>+	ctrl_reg &= ~SC_MB_CTRL_RUN_BUSY_OUT;
>+	xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);

You could use xe_mmio_rmw32() instead.

>+}
>+
>+static int xe_sysctrl_mailbox_prepare_command(struct xe_sysctrl *sc,
>+					      u8 group_id, u8 command,
>+					       const void *data_in, size_t data_in_len,
>+					       u8 **cmd_buffer, size_t *cmd_size)
>+{

In the caller cmd_buffer has a different type and here it is u8**. For 
readability, I would recommend using a different name here, maybe 
mkhi_msg.

>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t size;
>+	u8 *buffer;
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);

I would move the xe initialization to the top.

>+
>+	size = sizeof(*mkhi_hdr) + data_in_len;
>+	if (size > SC_MB_MAX_MESSAGE_SIZE) {
>+		xe_err(xe, "sysctrl: Message too large: %zu bytes\n", size);
>+		return -EINVAL;
>+	}
>+
>+	buffer = kmalloc(size, GFP_KERNEL);
>+	if (!buffer)
>+		return -ENOMEM;
>+
>+	mkhi_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)buffer;
>+	mkhi_hdr->data = cpu_to_le32(FIELD_PREP(MKHI_HDR_GROUP_ID_MASK, group_id) |
>+				      FIELD_PREP(MKHI_HDR_COMMAND_MASK, command & 0x7F) |
>+				      FIELD_PREP(MKHI_HDR_IS_RESPONSE, 0) |
>+				      FIELD_PREP(MKHI_HDR_RESERVED_MASK, 0) |
>+				      FIELD_PREP(MKHI_HDR_RESULT_MASK, 0));
>+

FIELD_PREPs un-aligned by one space.

>+	if (data_in && data_in_len)
>+		memcpy(buffer + sizeof(*mkhi_hdr), data_in, data_in_len);
>+
>+	*cmd_buffer = buffer;
>+	*cmd_size = size;
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_send_frames(struct xe_sysctrl *sc, const u8 *cmd_buffer,
>+					  size_t cmd_size, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t bytes_sent, frame_size;
>+
>+	total_frames = DIV_ROUND_UP(cmd_size, SC_MB_FRAME_SIZE);
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Mailbox busy\n");
>+		return -EBUSY;
>+	}
>+
>+	sc->phase_bit ^= 1;
>+
Empty line not needed here.
>+	bytes_sent = 0;
>+
>+	for (frame = 0; frame < total_frames; frame++) {
>+		frame_size = min(cmd_size - bytes_sent, (size_t)SC_MB_FRAME_SIZE);
>+
>+		if (xe_sysctrl_mailbox_write_frame(sc, cmd_buffer + bytes_sent, frame_size)) {
>+			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>+			return -EIO;

If you failed to write the frame here, what happens to phase bit. Should 
you toggle it back?

>+		}
>+
>+		ctrl_reg = SC_MB_CTRL_RUN_BUSY |
>+			   FIELD_PREP(MKHI_FRAME_CURRENT_MASK, frame) |
>+			   FIELD_PREP(MKHI_FRAME_TOTAL_MASK, total_frames - 1) |
>+			   FIELD_PREP(MKHI_FRAME_COMMAND_MASK, SC_MKHI_COMMAND) |
>+			   (sc->phase_bit ? MKHI_FRAME_PHASE : 0);
>+
>+		xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, ctrl_reg);
>+
>+		if (!xe_sysctrl_mailbox_wait_bit_clear(sc, SC_MB_CTRL_RUN_BUSY, timeout_ms)) {
>+			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>+			return -ETIMEDOUT;
>+		}
>+
>+		bytes_sent += frame_size;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_first_frame(struct xe_sysctrl *sc,
>+						  const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,
>+						  void *out,
>+						  size_t frame_size,
>+						  size_t *payload_bytes)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	u32 frame_data[4];
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *resp_hdr;
>+	size_t hdr_size = sizeof(*resp_hdr);
>+	size_t payload_size;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, frame_data, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	resp_hdr = (struct xe_sysctrl_mailbox_mkhi_msg_hdr *)frame_data;
>+
>+	if (!XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(resp_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_GROUP_ID(resp_hdr) != XE_SYSCTRL_MKHI_HDR_GROUP_ID(req_hdr) ||
>+	    XE_SYSCTRL_MKHI_HDR_COMMAND(resp_hdr) != XE_SYSCTRL_MKHI_HDR_COMMAND(req_hdr)) {
>+		xe_err(xe, "SC: Response header mismatch\n");
>+		return -EPROTO;
>+	}
>+
>+	if (XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr) != 0) {
>+		xe_err(xe, "SC: Firmware error: 0x%02lx\n",
>+		       XE_SYSCTRL_MKHI_HDR_RESULT(resp_hdr));
>+		return -EIO;
>+	}
>+
>+	payload_size = frame_size - hdr_size;
>+	if (payload_size > 0)
>+		memcpy(out, (u8 *)frame_data + hdr_size, payload_size);
>+
>+	*payload_bytes = payload_size;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_process_frame(struct xe_sysctrl *sc,
>+					    void *out, size_t frame_size,
>+					     unsigned int timeout_ms)
>+{
>+	int ret;
>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms))

response frame timedout message must be here.

>+		return -ETIMEDOUT;
>+
>+	ret = xe_sysctrl_mailbox_read_frame(sc, out, frame_size);
>+	if (ret)
>+		return ret;
>+
>+	xe_sysctrl_mailbox_clear_response(sc);
>+
>+	return 0;
>+}
>+
>+static int xe_sysctrl_mailbox_receive_frames(struct xe_sysctrl *sc,
>+					     const struct xe_sysctrl_mailbox_mkhi_msg_hdr *req_hdr,
>+					      void *data_out, size_t data_out_len,
>+					      size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	u32 ctrl_reg, total_frames, frame;
>+	size_t hdr_size = sizeof(*mkhi_hdr);
>+	u8 *out = data_out;
>+	size_t received = 0;
>+	size_t frame_size;
>+	int ret;

int ret = 0;

>+
>+	if (!xe_sysctrl_mailbox_wait_bit_set(sc, SC_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>+		xe_err(xe, "sysctrl: Response frame 0 timeout\n");
>+		return -ETIMEDOUT;
>+	}
>+
>+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>+	total_frames = FIELD_GET(MKHI_FRAME_TOTAL_MASK, ctrl_reg) + 1;
>+
>+	if (total_frames == 1)
>+		frame_size = min(hdr_size + data_out_len, (size_t)SC_MB_FRAME_SIZE);
>+	else
>+		frame_size = SC_MB_FRAME_SIZE;
>+
>+	ret = xe_sysctrl_mailbox_process_first_frame(sc, req_hdr, out, frame_size, &received);
>+	if (ret)
>+		return ret;
>+
>+	out += received;
>+
>+	for (frame = 1; frame < total_frames; frame++) {
>+		size_t remaining = data_out_len - received;
>+
>+		frame_size = min_t(size_t, remaining, SC_MB_FRAME_SIZE);
>+
>+		ret = xe_sysctrl_mailbox_process_frame(sc, out, frame_size, timeout_ms);
>+		if (ret) {
>+			xe_err(xe, "sysctrl: Response frame %u timeout\n", frame);

this message should be in xe_sysctrl_mailbox_process_frame.

At this point you have already copied some data into the out pointer, so 
you might as well update *rdata_len with the partial copied data. So you 
can break here and return ret at the end of the function.

>+			return ret;
>+		}
>+
>+		received += frame_size;
>+		out += frame_size;
>+	}
>+
>+	*rdata_len = received;
>+
>+	return 0;

return ret;

>+}
>+
>+static int xe_sysctrl_mailbox_send_command(struct xe_sysctrl *sc,
>+					   const u8 *cmd_buffer, size_t cmd_size,
>+					    void *data_out, size_t data_out_len,
>+					    size_t *rdata_len, unsigned int timeout_ms)
>+{
>+	const struct xe_sysctrl_mailbox_mkhi_msg_hdr *mkhi_hdr;
>+	size_t received;
>+	int ret;
>+
>+	ret = xe_sysctrl_mailbox_send_frames(sc, cmd_buffer, cmd_size, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (!data_out) {
>+		if (rdata_len)
>+			*rdata_len = 0;
>+		return 0;
>+	}

The above check should just be

	if (!data_out || !rdata_len)
		return 0;

I would recommend writing to *rdata_len only on successful receive.

>+
>+	mkhi_hdr = (const struct xe_sysctrl_mailbox_mkhi_msg_hdr *)cmd_buffer;
>+
>+	ret = xe_sysctrl_mailbox_receive_frames(sc, mkhi_hdr, data_out, data_out_len,
>+						&received, timeout_ms);
>+	if (ret)
>+		return ret;
>+
>+	if (rdata_len)
>+		*rdata_len = received;

If you added the above comment, then at this point you already know rdata_len
is valid, so the check can be dropped.

>+
>+	return 0;
>+}
>+
>+/**
>+ * xe_sysctrl_send_command - Send command to System Controller via mailbox
>+ * @handle: XE device handle
>+ * @cmd_buffer: Pointer to xe_sysctrl_mailbox_command structure
>+ * @rdata_len: Pointer to store actual response data size (can be NULL)
>+ *
>+ * Send a command to the System Controller using MKHI protocol. Handles
>+ * command preparation, fragmentation, transmission, and response reception.
>+ *
>+ * Return: 0 on success, negative error code on failure
>+ */
>+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len)
>+{

Why void *cmd_buffer? Do you expect anything other than 
xe_sysctrl_mailbox_command? If you do, your function signature will 
change anyways, so why not just define it as struct 
xe_sysctrl_mailbox_command *cmd?

>+	struct xe_device *xe = handle;
>+	struct xe_sysctrl *sc = &xe->sc;
>+	struct xe_sysctrl_mailbox_command *cmd = cmd_buffer;
>+	u8 *buffer = NULL;
>+	size_t command_size = 0;
>+	u8 group_id, command_code;
>+	int ret = 0;
>+
>+	if (!xe || !cmd) {

I suggest splitting the 2 checks here into separate if blocks and use 
pr_err or pr_debug if xe is NULL.

>+		if (xe)
>+			xe_err(xe, "sysctrl: Invalid parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!xe->info.has_sysctrl)
>+		return -ENODEV;
>+
>+	group_id = XE_SYSCTRL_APP_HDR_GROUP_ID(&cmd->header);
>+	command_code = XE_SYSCTRL_APP_HDR_COMMAND(&cmd->header);

Would be good to check if the group_id and command_id are valid here.
>+
>+	if (!cmd->data_in && cmd->data_in_len) {
>+		xe_err(xe, "sysctrl: Invalid input parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	if (!cmd->data_out && cmd->data_out_len) {
>+		xe_err(xe, "sysctrl: Invalid output parameters\n");
>+		return -EINVAL;
>+	}
>+
>+	might_sleep();
>+
>+	ret = xe_sysctrl_mailbox_prepare_command(sc, group_id, command_code,
>+						 cmd->data_in, cmd->data_in_len,
>+						 &buffer, &command_size);
>+	if (ret) {
>+		xe_err(xe, "sysctrl: Failed to prepare command: %d\n", ret);
>+		return ret;
>+	}
>+
>+	xe_pm_runtime_get(xe);
>+
>+	guard(mutex)(&sc->cmd_lock);
>+
>+	ret = xe_sysctrl_mailbox_send_command(sc, buffer, command_size,
>+					      cmd->data_out, cmd->data_out_len, rdata_len,
>+					      SC_MB_DEFAULT_TIMEOUT_MS);
>+	if (ret)
>+		xe_err(xe, "sysctrl: Mailbox command failed: %d\n", ret);
>+
>+	xe_pm_runtime_put(xe);

hmm, not sure this ordering is correct. Ideally you want mutex_unlock 
before runtime pm put, but the guard will only make sure unlock happens 
at function return. If using guard, you may want to define a similar 
guard for runtime pm. Maybe that's what Michal was suggesting earlier.

>+
>+	kfree(buffer);
>+
>+	return ret;
>+}
>+
>+/**
>+ * xe_sysctrl_mailbox_init - Initialize the system controller mailbox state
>+ * @sysctrl: System controller structure
>+ */
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc)
>+{
>+	struct xe_device *xe = container_of(sc, typeof(*xe), sc);
>+	u32 ctrl_reg;
>+
>+	ctrl_reg = xe_mmio_read32(xe_root_tile_mmio(xe), SC_MB_CTRL);
>+	sc->phase_bit = (ctrl_reg & MKHI_FRAME_PHASE) ? 1 : 0;
>+
>+	xe_mmio_write32(xe_root_tile_mmio(xe), SC_MB_CTRL, 0);

You could use xe_mmio_rmw32() instead.

>+}
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>new file mode 100644
>index 000000000000..6380d1d68f8f
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
>@@ -0,0 +1,61 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef __XE_SYSCTRL_MAILBOX_H__
>+#define __XE_SYSCTRL_MAILBOX_H__
>+
>+#include <linux/bitfield.h>
>+#include <linux/types.h>
>+
>+struct xe_sysctrl;
>+
>+#define MKHI_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define MKHI_HDR_COMMAND_MASK		GENMASK(14, 8)
>+#define MKHI_HDR_IS_RESPONSE		BIT(15)
>+#define MKHI_HDR_RESERVED_MASK		GENMASK(23, 16)
>+#define MKHI_HDR_RESULT_MASK		GENMASK(31, 24)

My interpretation was different from reading the spec. More like 
group_id is at bit[31:24] and result at bit[7:0]. Have you confirmed the 
above bitmask?

>+
>+struct xe_sysctrl_mailbox_mkhi_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define APP_HDR_GROUP_ID_MASK		GENMASK(7, 0)
>+#define APP_HDR_COMMAND_MASK		GENMASK(15, 8)
>+#define APP_HDR_VERSION_MASK		GENMASK(23, 16)
>+#define APP_HDR_RESERVED_MASK		GENMASK(31, 24)
>+
>+struct xe_sysctrl_mailbox_app_msg_hdr {
>+	__le32 data;
>+} __packed;
>+
>+#define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr)	FIELD_GET(APP_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+#define XE_SYSCTRL_APP_HDR_COMMAND(hdr)		FIELD_GET(APP_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+#define XE_SYSCTRL_APP_HDR_VERSION(hdr)		FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>+
>+#define XE_SYSCTRL_MKHI_HDR_GROUP_ID(hdr)	FIELD_GET(MKHI_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+#define XE_SYSCTRL_MKHI_HDR_COMMAND(hdr)	FIELD_GET(MKHI_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+#define XE_SYSCTRL_MKHI_HDR_IS_RESPONSE(hdr)	FIELD_GET(MKHI_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+#define XE_SYSCTRL_MKHI_HDR_RESULT(hdr)		FIELD_GET(MKHI_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+
>+/**
>+ * struct xe_sysctrl_mailbox_command - System Controller mailbox command structure
>+ */
>+struct xe_sysctrl_mailbox_command {
>+	/** @header: Application message header containing command information */
>+	struct xe_sysctrl_mailbox_app_msg_hdr header;

>+	/** @data_in: Pointer to input payload data (can be NULL if no input data) */
>+	void *data_in;

>+	/** @data_in_len: Size of input payload in bytes (0 if no input data) */
>+	size_t data_in_len;

>+	/** @data_out: Pointer to output buffer for response data (can be NULL if no response) */
>+	void *data_out;

>+	/** @data_out_len: Size of output buffer in bytes (0 if no response expected) */
>+	size_t data_out_len;

Empty lines between members above will help readability.

>+};
>+
>+void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>+int xe_sysctrl_send_command(void *handle, void *cmd_buffer, size_t *rdata_len);
>+
>+#endif /* __XE_SYSCTRL_MAILBOX_H__ */
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>new file mode 100644
>index 000000000000..80e674cfa385
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -0,0 +1,25 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2025 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_TYPES_H_
>+#define _XE_SYSCTRL_TYPES_H_
>+
>+#include <linux/completion.h>
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+#include <linux/workqueue.h>

Use only what's needed in this header. If you C file requires some of 
these headers, you want to move those to the C file.

Regards,
Umesh

>+
>+/**
>+ * struct xe_sysctrl - System Controller driver context
>+ */
>+struct xe_sysctrl {
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: MKHI message boundary phase toggle bit */
>+	u32 phase_bit;
>+};
>+
>+#endif /* _XE_SYSCTRL_TYPES_H_ */
>-- 
>2.43.0
>
