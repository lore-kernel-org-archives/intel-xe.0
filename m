Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8621C5ACD9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 17:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932DC10E82B;
	Fri, 20 Feb 2026 17:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlFpP+Ar";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118610E830
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771607491; x=1803143491;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GXFFEw6qNLg0pcnCD3hTDBmY/19x/6lv3kEKfHnNeYc=;
 b=IlFpP+Aroqdm070Lmso2DDE84viOS92E9NQkYLOQqJTxZPXTGmQ7sEV+
 /bTOfuA7LPZVcSXqRmld1izKH3sPdRKF4dx57hM+63SgYh2Sq6KVxCRcn
 EcDtpoWIPMrMakzvttRtNl96wUhSGM86hD8VnYfHgY60q9G9A9+GG5b0d
 zCOgnkZkeAelKFv8KQCdywSKdy1Yd0vu28L77z2xhKbDTUOFA2TU8hvMx
 rN9HU83bwKPKq1c+yVfIo3e0C7dKG26GSSdosCaiksYt/ILyETI1ERMfK
 SXCHhRmOWboJcJ5sBmzxiZ1lBxNFnFhqCNmDR+su4AvAc8xkb4luSoowx A==;
X-CSE-ConnectionGUID: 0Ru2bDAGRtOgg0PC7yl02Q==
X-CSE-MsgGUID: Zhj9jFiXSiyXx8j10pFxqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72580725"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="72580725"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:11:31 -0800
X-CSE-ConnectionGUID: q0+Vg6AXR5q5H7ELuB/4mg==
X-CSE-MsgGUID: 1gZ5qVsURPaI0eaTkp7OGQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 09:11:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:11:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 09:11:30 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 09:11:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqpsliF+RfOx/MJisAOZ1Yo3ZX1MHBs7Ao7LuriZd5nVVlX5/P+Y2bgRGy2ftig/xrRaVDUTwkNxF+81cEFyP14AAoMv4vy0PG4LETZLD6a5M2wSA2AQC8Za5CulM0xvjQXCYBIOjCQoVIvrF07TNxt4lSPeprzqJ13i5qCNnZ1uvPN4sC7KhJ9nDouZCeEKGOuvMUft3baO4/Y4JerJ0JOGCvme/3OgcPovKvvcOIslK/d1ftVq6EQGj95Ju91HhZiWcHetzWNOA9cy7/F+3ao98yL3thVr0zkuMag+XfaKE7umRGQRVDveznPFdgCLJ0Nz21OTORdNOc7SC6PYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5gmI0w/PHxTGRUGyGJnP5PjBwyooTb76ZmAz2cj8zY=;
 b=EWm77dSEfaaiiWjUB7Kro4PE0dJl3sJvEqaqguYNYthUbSboo6mevDn/jqgc+XL8AqUkHPmxcjCjcAAT9V+qQvo5F/BXCji8GNkY35TmVNTcIXuy14ogfkDVZpwspz19su0eMm87tF6VmUVHEnc/VvuciEM74R8Iczs5EcH/B3gQyVYlmUgdYO6bHslL8vi7t7vXbWINMQxxgoCqG6u/PxA68yRP2K70yVtbqj7iL6GZQ7439C/52W8UM4aIfKSx+k6hH8ZTmJQUTpga7AYjI5WubMCuQ4ZAXx3OUGYsE1vFm2I9qzSzpgwAJp+CXYpQPZh/j2Kueift8cNbIyFIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 17:11:27 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 17:11:27 +0000
Date: Fri, 20 Feb 2026 09:11:24 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Julia Filipchuk <julia.filipchuk@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH v6 2/3] Reapply "drm/xe/xe2: Enable Indirect Ring State
 support for Xe2"
Message-ID: <aZiVvPmGtxxOi4JF@lstrano-desk.jf.intel.com>
References: <20260220170137.328131-5-julia.filipchuk@intel.com>
 <20260220170137.328131-7-julia.filipchuk@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220170137.328131-7-julia.filipchuk@intel.com>
X-ClientProxiedBy: MW4P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: 30827669-ee9b-482a-8b14-08de70a3152f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0x5d3hEVWQ0dXdBR1ZwU2tXVGZHbnpWQ3dLVzFrRXZ2TzlpTk5Eb0gycmpI?=
 =?utf-8?B?SFVOZXFaeHVOb1NQUFExZDNXV0YveEZLdkc4a1V1T2F1NVBNeWFiMWZ6VjFi?=
 =?utf-8?B?UXpZZ0tzeFp3VG12V0xBSUt6YWNrUk1iaXVyUWptd1g4RmdZVGphcEJjaUhh?=
 =?utf-8?B?d3laN3ZtOGhXQW5Ud0QrdWlab1k5cDhhVE5UYjIxaGZPSHFJMGRBQW40bnZY?=
 =?utf-8?B?eTZnUHJ5dmJGdlovb3JoM2Z0YVlZTlZTRk8xWkdMc2pJSlJ1akRJbTZvNldE?=
 =?utf-8?B?Sy9ESkUwcVVsRVliVkp1ZEFPMTZXQmZxcEFCODFvQ3MweTRpRElIT2ZSQjVU?=
 =?utf-8?B?Q2tMRXRJaG83dnBUSU5CLy9WZTdXQlF1eUJaNk1tSnBHTmJXdW53MThmcEtV?=
 =?utf-8?B?a0ZuU2gyamQzLzE2aUsyTzlHOTYvaG5lU1ZEM0QyQkxwU3NpN1pOYVdVQ2Nh?=
 =?utf-8?B?NjY2S3NUWEV6aGd0UXVRZDhwdFRtRGRlWWtWajRZTitSU3BtSzhpdFMyOVhp?=
 =?utf-8?B?bWJDMEgxbGJFZUc5RXB2MzRVVzlORk1ueENGL0RkOVJKa25veWFLQmRuS1ho?=
 =?utf-8?B?YTlJaWg3SUJvZVBYNmtyU2F0ZDJSVDRKU0VJQWFDeDFZOXB1OXdaMi9EaTJi?=
 =?utf-8?B?R1hteE9zcmNiajFQVHVSZGlUbEYzaC8wdWJRMmM2TTlDb3FMOHBTOTByb0hk?=
 =?utf-8?B?a2t6R3o2MjgwZWp4VjlqVEdVOUVVenVuU2M2enhaUkVSNDhhV1REM3AvNEtR?=
 =?utf-8?B?a25hUlRuYjl6VHRXK1RmSGFYVXk3VGUrZ28rZFlPQ1VJVzYvc1pOY3FUMHB2?=
 =?utf-8?B?UFNtdHdtdDdUdGVPQlB5UjhQNGVvQmRUVEdpQ24xQm9MUk92M3o2TU1MQnZ6?=
 =?utf-8?B?bEpDRlJDcnlVWGdmb3N4U0NRbUNuYmRtOEx3N0JhanViTUJFZWo4T2hRa2xJ?=
 =?utf-8?B?WlFIai9LR3BPNUFuaVFzWlI1U2pRVzU2UGxscTZIUzRWWlBaM3I3VDVtMzR6?=
 =?utf-8?B?a3FBWGVyTU5NZ0ZIMG92R2FLU3l5WjFtK2YyZkFYQ095S2pnTkR5QWhjek83?=
 =?utf-8?B?eVdUVXVYREJsT2x4ZFVhaVlpd2YyYVpwQmo4S3RrVEYwam5Edm5aVllHNyty?=
 =?utf-8?B?a0Q3YXI5aFJ3N1VJYlVhWnFNbi9UUzZTMW1hSFpSWmZnNkdVc1VDUHY4QUVD?=
 =?utf-8?B?MHFtcHN6cWZKMEg3RXVxQjJwdnRYc3RmRlVFTm1sU1BYVVE1QUJIOERiR3h3?=
 =?utf-8?B?WEVQTGgvYkVvVGZWdU8xeUtqQVRrWDdwZVZUYVZXRkFqb0g2NTF2aUJlS1RR?=
 =?utf-8?B?emdkZVpiNmRreFlqZHFJVUd1SUxyZTVJNDhCRzQ0N3VrRTRjMTVWaDY1Sldz?=
 =?utf-8?B?a09pc3l3SG5ZeFRmNDZGSkJRaGUxZUtyUTM4R2hPV0RYVXJJLzgva2FNeDFo?=
 =?utf-8?B?NVQwZkdRek1iM08xdTdGMzFoSGtsU0NGUU1KNmx0TkdtQ0dTUkJUZmVpZC9O?=
 =?utf-8?B?cnZST1pzTTY1L3VHUE8yZUVWMnJtQVhqeGx1SjAyeTJOK1NKdXlkSXc1RURj?=
 =?utf-8?B?MDNZdFFvcTRDd3NEQXgrbFZSU2JhQzZ2Q3pqLzVTQzJrSjc1dXViZW9wa1Za?=
 =?utf-8?B?NVZVc244MUxBWW1ZNVNFQVRNYW9Kc0c5MzNUM3hNNGtSbFJhdlpvZWllQkN3?=
 =?utf-8?B?Umc0bkNGbnE4bGYzZnlXeEtMelc0WTFWMG5hOXlrYWt5R2Q5N3RhTXpraTZN?=
 =?utf-8?B?emxON0UzVHZtdXBMd0UwZDJGK05lSmlDakMwTkpQVHgwVHZxWlR3aENHdVVB?=
 =?utf-8?B?NWFTUDczQTI4Ry9xbDBEN3JHU3JpcGNVcSs0UjRyc05oc1lMMUR2MG9zOGcz?=
 =?utf-8?B?V0JJb1pGRUlRLzNaa0Q4OUdmKzhJQ3ZxazZhaWw1QlhqOFJJQnRWcjdNL2Vv?=
 =?utf-8?B?MW9pRHB6aURkUUNQSTVKTklsUExHVWo3QXR6OUdYWTViVmFJaDM1RGF1RFUv?=
 =?utf-8?B?ZEowY3h3djZSTCsxUTRTYkJGcWlPazR3RUZFc3F0c1pkVFhDL3QrcGZHZDhl?=
 =?utf-8?B?UUxwUmQ1S3RwM0VMcUJFWVZ2QUF2R2VqTGZ2STV6TWVNNEN1NWh1eUk0UHNa?=
 =?utf-8?Q?kzGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWwrdlVyU0s5ZHN4QU5CZGY3WitIQmhHV2RUMjJkTGlVRWVnVVFSTkY3T3FK?=
 =?utf-8?B?WmRCVTNDcHlNTTdsalZWVG45Q0gyaU1HUFVRNkhLWjlSUTRwRG1RSGhUaGtw?=
 =?utf-8?B?Qm9UMWZjSlBnYTVYN1JBaWNFcUdSWnVwRDhGMEFGQ2dXN1RVc3Q3Q21QVnhK?=
 =?utf-8?B?dTNiSUJBUU44cm1TZ1dNWFRtSUt1NXBHVk9DZnNQZXNlcG1yc0NoenBYb0No?=
 =?utf-8?B?V1dBRFZqOTVwNHUzaXQyZkxqRnlWVTRPeFpXeTNyTzh2K1V1L3JIb1NmWFZM?=
 =?utf-8?B?QTdVcVN1Ylh2RGNacTdPTzNXSEpxUFdicE5HaG1aSlpoY21IQ0pENXRKR3d2?=
 =?utf-8?B?aVIyajlKYWJlU1VHMy9jVzRIcEV3ZEI5eUZVYUd3dzFhZVF3WnhRcmoxTjdO?=
 =?utf-8?B?YVVqcVFsZjlWMVEyOXFCNyt4ck1EVS9hR2NScTNXL0tHUWV2TGlaU0Zhby9y?=
 =?utf-8?B?Um5EVGExMXNvbEZpZDJMWlU1Y3d0QVphTVBlSE9kcGlCazRRc1ppc1BwZHgw?=
 =?utf-8?B?Y1ZtWEdUSkk4bGdsbUdhN1hqb2pPS0NxRkJieU41ZW44cXMzTGhWbUEwSGYv?=
 =?utf-8?B?Y2VuSFV0SFdJNkl6bEd5UXJjM1lMRjVHRkQzem11ZWw2WCtZSzlvbVRmcDRV?=
 =?utf-8?B?dit5NE5wTGQ2NE1nVmZ6M29KdHFpM0hWSzRiWHpneDB5bXlUYWt5bjB1S2NZ?=
 =?utf-8?B?UW81MS9Wd3FGcVlQdUlXVTBiWmhFUHNBWEc1bWdHdzNxTHZpOUF1MERVK3Bv?=
 =?utf-8?B?SkVtV3NmeWptak9LS1ZKWlJESXVGeGI5QUpYRE50cGhtU2x2dVRvMWZSQTV0?=
 =?utf-8?B?TVF0RXJHbGVOTURCNlMrWnRvTFZZR0szWWVzdEJFNjErTDhFS0Z3c2dHdUph?=
 =?utf-8?B?TUMreUFuNi9yNXZIaGxaeC9od3NQU3ZLQzZoVW1sOGgxdEd1UnBTbjl0d1BC?=
 =?utf-8?B?eWxmOEczZ0FJajhTbUZqcW5Wd3Q0aFV5ZXo3MGtJTUpQODZpYTFIL0gyVmNz?=
 =?utf-8?B?WUZEd2NHcEgvamYxT1Y3S0l6L1ZudVJlc3VqdGlPS2lRV3cvQW9lVGV3b2Ri?=
 =?utf-8?B?aHRmOEdJeis4UlI5VkJBdnptNmljR04zb0NTMFByaGFtUXViSGJDTnZBS3F1?=
 =?utf-8?B?NUJ1aU9Bb0Z1dktKTzFseFE0UUVrY3MxcXBHSGpReHVKMnlpWU5JdGI2MGJp?=
 =?utf-8?B?aEc5KytUU1hEUzV2VnlOcW1NM0psSHNKdUVtajBKWld0elJGWXFNUVhSa0tI?=
 =?utf-8?B?WFJacHFsckJsU1hxTmhjRHhYWmluWlpKMFJJeTNQOGxtWUlnK3ZmblNPTkFj?=
 =?utf-8?B?b2lSUlpSSVpPTWdEZm5aaCtqQ2ExYzBGS1l5S0M1RXB5UlV3b2V2Wk1NeGg3?=
 =?utf-8?B?dVpKVWw5Y2RDZmZlOXNGd0RWQmcwTGlKdmZyL2liaHo1TCszMHpNdU9PYWpF?=
 =?utf-8?B?WkJNM2lRZ2QyZ1lyUzJ1ZTV2NXRhazhmem9OeTBtYmtYQm1mOUh3SEhZMkhk?=
 =?utf-8?B?U09XcTAzejJHSmVPemptaUl6YytIZU5HMU9zMkFEbkhOMEs2VGNuU3BpWVFL?=
 =?utf-8?B?RG4ybHMzL2ZuQVByUlFONTRFMVJzbU1qN3orU1o4OWZKTFJSVjhrWlNUdkNw?=
 =?utf-8?B?a2dZakt1M1gvSmZubnRxUmpibTIwazVZajhPOFI0QTdLY1I5d1owRndEVWQz?=
 =?utf-8?B?aDJkWVd6c0ltK2lPZURjeUN1Q0FPa2RmWUNGRXZ1aUR5WG96N1Z5OTVOd083?=
 =?utf-8?B?Q0ZuWXBGNXNFNU1qT2l0THUyU09lMWpFYVBnRWVITEFpbnR6K1BQczI2MWMr?=
 =?utf-8?B?QUdOUWppclg2ZWVOdWIvR2RsNjhkK0dGNW1tWHdWS1l2OGlUR0pESkx4K0FG?=
 =?utf-8?B?cFR0a0psbTByNm84YlBEN1plVnFWL3ZHUitUT1FwR3VVamp5a2t6d0pjbVVh?=
 =?utf-8?B?Z3crY0grSVVQc1VnWHNPRzFwUlRGbGl5OUMyUW5rZzJMc1J2WXB4S2JETDBU?=
 =?utf-8?B?M2hPT3RNdTdkR2NzakxJbk9Sck5FSk1IQVRhdjdWVVN5ajJGVkt6S3JnZGRv?=
 =?utf-8?B?dU5TRURLbm5PRTVhamg0TGFJcHFNRFVScWh1ellWLzJ0NVZUb1BGZWpiY3dW?=
 =?utf-8?B?amNWanhSSENkeDVYYVNjbFdYV0NCR1BxQ204Tzk3S0dLQ1ROT1M1YUt3aG9N?=
 =?utf-8?B?cXRaYzQ0MTBWZnJRUTN6dVFSc09CVDcvVVJNWUpla3g3UGhTZG5CaHdoRHNR?=
 =?utf-8?B?WDY0MkVvbURoTGd5d1JIVnpleEpwSm9qNGZVNlBGNHpNK1dnVGQwNDRkQnpy?=
 =?utf-8?B?U1dPYS9YNG5hY2NQNzl0dVY5N20zRjlHbHp4ck80Z1hRRUUzeks5ZnJXM1hl?=
 =?utf-8?Q?SfKo0TK1vxIAoUd0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30827669-ee9b-482a-8b14-08de70a3152f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 17:11:27.3977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvQg9zbYFdrEz+AxRdsF2sGXvda0zf7rk7dnGR8k061SN2MOKY52ms/m3hvD0p3dJLRRy2iMQzDmkAU7zI+8mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
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

On Fri, Feb 20, 2026 at 09:01:38AM -0800, Julia Filipchuk wrote:
> This reverts commit 03d85ab36bcbcbe9dc962fccd3f8e54d7bb93b35.
> 
> Previously this was reverted due to failures on LRC context switch.
> Issues should be root-caused and resolved with GuC WA 14025515070. Now
> setting indirect ring state is available by default.
> 
> Note: Will be cleared if WA not available due to older GuC version.
> 

Is there a reason we need indirect ring state on Xe2? AFAIK, this is
only needed for multi-Q or if we did user-space submission. I’d rather
not have an officially supported kernel floating around on Xe2 with a
mis-match of indirect direct ring state enabled, since it’s a very
subtle delta that could surface in odd ways.

IMO, it’s best to leave indirect ring state off on Xe2 unless we have a
concrete reason to enable it.

Matt

> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index e1f569235d8a..ff8039198da1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -100,6 +100,7 @@ static const struct xe_graphics_desc graphics_xelpg = {
>  #define XE2_GFX_FEATURES \
>  	.has_asid = 1, \
>  	.has_atomic_enable_pte_bit = 1, \
> +	.has_indirect_ring_state = 1, \
>  	.has_range_tlb_inval = 1, \
>  	.has_usm = 1, \
>  	.has_64bit_timestamp = 1, \
> -- 
> 2.51.0
> 
