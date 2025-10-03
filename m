Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D28CAC5B0
	for <intel-xe@archiver.kernel.org>; Fri,  3 Oct 2025 16:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBEC10E94A;
	Fri,  3 Oct 2025 16:26:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZqoUE6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD2410E946
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Oct 2025 16:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759508814; x=1791044814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xsPexO7co5M/KmQP6gSUTP/O4vsI6QUi82wrtXtSECA=;
 b=XZqoUE6GjWY/GPuMSasdXnesD9RGT3JQJi2vzvtFwAy8mibDZuy8PszT
 bPKGDG5Qfv+5n3RtH7Bn1LYpKqQesGgUIr93k/AAtF1fMjL4KtQm27d3R
 3Pa6rB3Apz01YlrPyOMCSmF04oU+s2QJPXkX7/HjiLB2jAocT7vXrw2kr
 0QHufLUMnuMC47wS7+TdAeAgAdlkWDWTZTl0SoH9dmDqzO/uR6e1O5OUK
 nHDYGo0rovtmxQJaxrqS4S8J+KMunjRJVJrz1isZqIDC24FoMzmaA1Hdc
 +BZ0dmEU15WmE5ZLv8SMsX4d87HCM1dcJnfd5P3RVkWk4BWOfKRdyelkJ A==;
X-CSE-ConnectionGUID: 1tGO4qpFSp+CiMYnrvprxQ==
X-CSE-MsgGUID: da5kLy3tRxu1bwiBrDQwJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72893418"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="72893418"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:54 -0700
X-CSE-ConnectionGUID: qqerojiFSQGAs4tiocqWcQ==
X-CSE-MsgGUID: je0tXK0aQ66XyoGp1VjdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; d="scan'208";a="178449928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 09:26:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 09:26:52 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 09:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSRSiZJRAy9GamIJv6iLvlpntvSTY1to/lRYhWgWaiWY1yNBuJCCw16YJRazhg0eDogqoJBdwZv8/YET4x46od0P+P0YlIq/LAogxWUESwKUu5xPgg71fYnAISnDgNBVirZ+Ga1PQNZfBycVjmbn1mbxufWfsnMWr9jhBAGh0oHC0bbikr/qvoxCwdEwtcv5KHAngDT2zAnsRwgTS7nz72j76yyAcLbpyFgx9CXQP1x55cRuujTVLg6SGtsurLV1XIpNLCu2AEnPt7xPdgTQ0e4fM0E/uA0pc41Xfkaj2DSkMIXuJXZn5kUSrdrND3gutPgtUId8pfQSiHYt0693Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAorWY33H0ANf5bSqHvegDA8SJlQJxpacnqx3DkbBgQ=;
 b=UQkOOhazRwwKUGyto1u/qJs9ZE4xVz8aKk/MBzQT8l4+yXVLPss5kSzoVnHSUP7M5ZFGf35NqRjITqYMRAAfuqLre6PCjIDr88XZYHXYvck8yOMXWjcDhPlxF2TQVZv0mxQZmSyibPFlPEZxcdwiBl0JHcjOWnElYOZrv6Tx0Jg7YRq7qDvntVoOvI+0h8pkWZRSNIqpNtWF/RGdvTaEuZyAgvK6V3GQRTEFfwuY3V9/UpE5hCKzZ6tu9yz5+clNyHn9QAkP4otQOUUQR3QwzhJxfLbELC8X4b5ye5uyfpU+yzN0uB3FSbFoVZebrSJ9F6AU6Vkizzyn81osCxcPag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by CO1PR11MB4898.namprd11.prod.outlook.com (2603:10b6:303:92::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Fri, 3 Oct
 2025 16:26:48 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 16:26:48 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v5 4/5] drm/xe/pf: Force use user VRAM for LMEM provisioning
Date: Fri, 3 Oct 2025 18:26:18 +0200
Message-ID: <20251003162619.1984236-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
References: <20251003162619.1984236-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB7PR02CA0029.eurprd02.prod.outlook.com
 (2603:10a6:10:52::42) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|CO1PR11MB4898:EE_
X-MS-Office365-Filtering-Correlation-Id: aafaf983-58ff-41f6-179d-08de0299a60c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHJJc2dSRVRaVXJnZGR1OVhjRExFdDBHdlFnbUtSN3p4Qlhrakw5MUI2UTVL?=
 =?utf-8?B?blpJTzFENC9QR0J3dWg2dFpuSXhYR2VrTDM0N0hmUnVTZ3NzdlQwT3MvMUov?=
 =?utf-8?B?TGs2K0dERzJZdUgzYytrbmgvTWUvSVJnODVnSzdZcFluMmZNeE1ENmF2N3Rn?=
 =?utf-8?B?NGZhbWJqNlRKYzlIZFFsTGxRS2ltVWx1YnFBN1ZxTkgzV1RCcmV2dm5GaWxi?=
 =?utf-8?B?b05nNEorU2RyNEhHeUo0UDZXOGE5VHZMeml3Z240dXROTkVOZVZKTVo0NDA5?=
 =?utf-8?B?Y0hQclZuK0dobDhmZDNsZktoQ3JTU1BGRUJqZnZRdXZlUEVmVE5IcW1LOTJ5?=
 =?utf-8?B?NWhvNklZcjFTc2xZbjI2NndRbFZSOVpYSFpyb0ZzN1FMY1JMeHZDYlcxbVN3?=
 =?utf-8?B?Yk82dUJDODVSbGxvcGpGTHZXM0UwQ01ReDFndzJ4ZGxwTHB1VzdsSzhxTFFr?=
 =?utf-8?B?aTNrWE5MQkFzanYzK0UrVkRTQWNHYW5sbXo5SngyNFdzR0cvQm1KeHdpZCtZ?=
 =?utf-8?B?NkVFSEY3OEo0bXZ6Mkx6R3UzbExZL2Z6U2cyeFBaRG0xVUNNQWlRYUEralFT?=
 =?utf-8?B?QWpMMVRZUjhma2NCN1g0a3RtcTFOZEJ5dmk3Rm5UMzltSHkzY1gxckdnNDRm?=
 =?utf-8?B?TWdKZGxiSDdYQ21reEUrZDhFRkU3QXZ6WFdISVR6SjFCNjM5MlF4MHo3NjNj?=
 =?utf-8?B?RENseUp2L2NSWXRRUE1LOGE2c1FMazNOVk52QlF2MThMUlE4eXRTcWNlVWRp?=
 =?utf-8?B?dnhoSDB4WFFMYnduVkRmK3dHZ2xpOFFiL01obDM3eS9RYVJyaEdIK3FWcUF5?=
 =?utf-8?B?MjhhMGZVeU1GZ3YrdEpVN0NUQmRPNklpQ3RVN09FZ3BIc1JwY3kyVHFkMlEy?=
 =?utf-8?B?V0ZQRFFTQUE4TWE4S2tDL0U2SlUrb0pxa2ZPRHI4OHlDMDdLdE9yZzFEdVNB?=
 =?utf-8?B?cnB1TTFFK2syNXVFQTQ1TGwxa3c3em1rb2c1akdudlVkblhjT0praU9pdzU5?=
 =?utf-8?B?OHJLTS9OZ2RVZ2ZlK29vOWQyOGVEdUVza0E4Mlc1TGp5Y3YxMXU3WXpBM01P?=
 =?utf-8?B?bmpDZ2drUmNpRG5UVTNsRzRVOTVnN2dtNWZiUXhzNXNOSnBaaE0wbThJVklR?=
 =?utf-8?B?b2hUS0l0Q3lWQzl0YVdrODZJQlpYbm40TTU2KzNjNkZxcDlTenc1eVgxS2NE?=
 =?utf-8?B?VDdnVWpxSVdLaTU4T1kyZ05RYkhkZFFYNnNJemRGV0YxWFV6RS9nby9WaFlu?=
 =?utf-8?B?WXFBQVduZ3Rvd0NubS9qbVMrOS85amsrM29uRVVUa1EyRWJaVG9aMFFiWCtk?=
 =?utf-8?B?R3lURmFkTkVEdEp0M0VmS1lFS2dRbmhTK0VWTUt1ZGtpYVJMTnk3L3RnWjF1?=
 =?utf-8?B?eFVkbkNNRURoUjdkR2NwWkpJU3NEa0dlQUFQRmpKTHArRER6UjM0QVJYMFBX?=
 =?utf-8?B?Kzc2VHlScXlnVFpsNEJlTGNsRWtJcHNqeExqaFM2RzZSdmJ0Syt0QjVqSEhL?=
 =?utf-8?B?NUZTVGRXWUZxcGNFZGdOOUZjL3ptRGhDeTVhaGVIYjBicDlaSmpLTHo3V1Ny?=
 =?utf-8?B?ZkdzNWF4WWpGekp3NDV1Y3hwOFFCdjhRNThMb3FtYXVoYlV6RitGYUR0a0tw?=
 =?utf-8?B?QlFZUlkzWFNGUm9Wd1FMazdHeWJTL0VYQmFGbUFLQnozNGhrM1BlSE5KMVBO?=
 =?utf-8?B?R1R6RktKUFh2MzcxZzlPd0hlQ0QrNGYvSkZBZ00vSThxNE8xc3M1MXZNWEhD?=
 =?utf-8?B?MWdUcTBSLzg0c1gwZjdLN3FLemhwWERkUjFjNVdyN3Zmdm5ScEdXL2srYzFC?=
 =?utf-8?B?Y0tXTDdULzJBenhNb3FmOTU3ZFBPYzVuSXN6MHpvTzJHNFdiUnk5Nm1HdStY?=
 =?utf-8?B?V2w5VzFKMWwvcmR6TzFOK0Ntb21rWkNIT0pkSldDMTFpYm1VQUdhTytMTEVE?=
 =?utf-8?Q?EzVizkmVzCPvADzbfWacsAo1I9qlAVAG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SldVL0h6NUJMMVNWRk9TLzJzVlV5aCtNREwybUJzN2NuVy9WTDR2YnhQd08w?=
 =?utf-8?B?MjNMTlBZZDMrcUp6UitIVFVMbjV3QkpIM1JZUE5VQVFTZUZ3VUgwNkpxSWZE?=
 =?utf-8?B?ZzFQUUFsakx1aC9ZNXQvNUp5UTdDckFvcFYzd2JWbktaMm92eTNkSkREQjRa?=
 =?utf-8?B?K3kyS3F3NXhQek1jY1BZMFFoNkdHU09kOGZvcVFFZk85UG4xajhPQ28xaURu?=
 =?utf-8?B?NC9ldXNtckNIL21JVXZMRGhpM3RDVTRoL3RLQzF1TjhMZmZwT082U1F4Q3ZU?=
 =?utf-8?B?L09KSjRHdG1oN0s0NmgzcHp3bThvRG1taWJsUWU0bzZicVNQeFZQYlFTd3gr?=
 =?utf-8?B?Zm1oWmxSNERuWFBjZjlUbkVEd0phbEF6aGQzZ21UUzlYSmR3RkkzY1FHRnRH?=
 =?utf-8?B?NU1jUEpCNXpKbDRhY1ZFMG54b0xYRmdKZkdOSWU1dVNSK0orNW5xR2VTM3dr?=
 =?utf-8?B?RitGS0lMMnVNMTRUT0pOK2Y1MWVWbFZJTGlZZm9sc2p5Sm1lOUtCVmg0SW1t?=
 =?utf-8?B?Q05CWEU4cUpSbm5Say9aL3QrazJBa09EbWtsTUQvVG9tU3JYTnFVZkdLS2Zt?=
 =?utf-8?B?Mms0T0RadFRLVUtFc0ZIVFI2M20rbW9VcTgyY1FPMWtIOTF4VkJManZhK2gv?=
 =?utf-8?B?UmJCVWE1d3h3aHl3QVhvZEFuMG5Wc3ErbllrcmRIaksvaFliZWh3MHF6SFFB?=
 =?utf-8?B?dm40NUw1V0hDaThvcXk4ZHJxYWtHSVpxa0V6bndNUWtYNlkrRmhGSUZ5Y3Jo?=
 =?utf-8?B?Z2prSGVDZmZzR0o2bTBFUTRXcDBmUGZTc2tZSU9LWkgrZmxVWjlncS9ZRjNk?=
 =?utf-8?B?S3JDK3Q0QzdzNHRBRnJ6WkZwU0tSUXQ5S1RoVUgyRmt6WDNFTG9MTjV1WDEw?=
 =?utf-8?B?ckdoWStRc0swRE5oeXlTV0RkdUhmbzRxWlRrYlUvUWdaS2k3eTArd3FFWERw?=
 =?utf-8?B?SjkrenlpWmZxWGF2TzVHSElZQmkxOXlXYi9BQ2RYcTFxVnlZdGZPeGVueHU3?=
 =?utf-8?B?cGUwS2lDNjd0ZHd2ODE1NnNaV2c3K2RPNUZzTXkxbFJkYnZvcjJnTmxyT3hG?=
 =?utf-8?B?Uy9ZZFhTSkJibkg5L2kzR2F0bWRuY1JkeXlra3Q0MjhtUGhuWUZJbXJQdTNr?=
 =?utf-8?B?S2RncHRwZHlsc20xS2cwT3ZORWNpYWlmb0hKNitrcGczaXltQkh4UURGK2Y0?=
 =?utf-8?B?UlVjMllTMlpPYk13ZGtwUWllTGo5QlJTSkFNWUVoVWEwaTUydGNxNm1jMnpB?=
 =?utf-8?B?NkY2UUFhc0xCK0FQRXhmNDBpK2tRTTNmUU5EL0hMUW1FQTRhYWlubE1rRlR4?=
 =?utf-8?B?K3FsWkRjbHMvVmpsVkl2ZWFOK1FkOXNZS1dmTVBmWTJiaTQ5eHRpYXd5OXNs?=
 =?utf-8?B?L0VxYkxtMG0rMDBhOXljV0IrNkpJSTRLNTdhZDBkUktpR1Rsdis3VmU3RC90?=
 =?utf-8?B?TURZZDZWTnhmQ1VZSFdvbmxXK0RtVFhGZ3ZNbHVsTlRaNEVIUk84Y3BscFBp?=
 =?utf-8?B?WlRsMFhSNzdiakpOTDlDa0k3Z0daZFFDQUpQWWZBQmswVnFVeWpVcjJHK1pn?=
 =?utf-8?B?UTZ6VGtjUjdsZEdndGVyajNiSVZPZG5PT2dWY3RnSXhvWnJnRkppU3Q2QVlR?=
 =?utf-8?B?emFaM1UrckVUa1JhMGVaMWY4VXBZQXhVTmZWaE9vakdpUjZoRnl3enZZbE5G?=
 =?utf-8?B?bndpYjFCZ2M4dEZuTG5NcHA4ZHVWWHVwZjBBQkE2YldXcGNFVzF5SEN3dEJk?=
 =?utf-8?B?bjl5clFPOVFnWGpkNU9nbXNLazJ3UE0zaVNKMTlISlpyTjN5K3NRL0VQQmVY?=
 =?utf-8?B?T1hYS1ZObDdkenk2RDJNblVpZ01mQ1JBOHhzL1JIT0R2RWtSWWFEbWZ4ay9z?=
 =?utf-8?B?SDJOQUMyblZhUnhBWURuaHIyNjVDdDA0N3pwTmEyNjFuT1ltVyszMVJnLzBQ?=
 =?utf-8?B?aWlFSTdxeFprSkpFblJKeHZpTXJuMVBYOXgzdEFBWEhTMzlyaC8wUVkwdjZa?=
 =?utf-8?B?alE0Z1FhUnUrOVBQTjFVMUFYUHR1dTkxNDdxNVNHOHRHRW1LT1JFbkxpSGVv?=
 =?utf-8?B?UDRBRFlIeUxpd0k3MTJsR3h4MEZCcm5qSUVNOGY3YmFjSyt2OVlCM0kxcGNU?=
 =?utf-8?B?OXRYNWZlM0ZMVmg1dVoxZ0l3NjArbHlDZGtRTW1OeGZybjFYdFpDSVozVndO?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aafaf983-58ff-41f6-179d-08de0299a60c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 16:26:47.8922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4NZQgjW/A1YK5/f8XHw1ipe5aBC3u5yZIr3yh9vMOtgEkwq2kiyGFNvzxl0+rDJ+y46c9EyhPmzlNYGagxMRpvBFgxbrYB9URngOmSvz6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4898
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

The LMEM assigned to VFs should be allocated from the general-purpose
VRAM pool, not from the kernel-reserved region.
Let's force the use of general-purpose VRAM for BOs intended for VFs.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 6344b5205c08..b2e5c52978e6 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1484,7 +1484,8 @@ static int pf_provision_vf_lmem(struct xe_gt *gt, unsigned int vfid, u64 size)
 					 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
 					 XE_BO_FLAG_NEEDS_2M |
 					 XE_BO_FLAG_PINNED |
-					 XE_BO_FLAG_PINNED_LATE_RESTORE);
+					 XE_BO_FLAG_PINNED_LATE_RESTORE |
+					 XE_BO_FLAG_FORCE_USER_VRAM);
 	if (IS_ERR(bo))
 		return PTR_ERR(bo);
 
-- 
2.34.1

