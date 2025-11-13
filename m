Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EA4CD6E55
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 13:30:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4953110E057;
	Thu, 13 Nov 2025 13:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="doJVKhPD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C706A10E057
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763040637; x=1794576637;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=E+sGHhj4lB8AIDVr4gNzsaCZbnAFZN39FDbmDRgCOwk=;
 b=doJVKhPDd1gL4nFrUU8ymJCkGoiAVt4jh8GFRg+mojs4KBNZLLQ+rtOf
 D3Oi5RiyovvTWIAwOy3dWT4HLEROPFg3fIup2ChpHOcrETmQTNDFCeGMS
 VDxBBudLOibkmt1RbWBTEerz2hh+EI82MGf+xR1V4tzY3PkzFmhEkSqSL
 Ci3UGnJFMeDBQqBwoBnxJHck9baWF7KU026x+7Vo/YFW5M90/+FRmVLwi
 s+zPYTVXYy7J4qloyNs0kaFFJRnNX71pJmmShVdmqYcKHJqKwWYPgvtaQ
 AGCf7iYNBJ0ypVTQUiN3lxwQlf+k74jLGj6S5nkt/YfO6ZIXCEqobOiu1 A==;
X-CSE-ConnectionGUID: Zot/fSA6TSm0NI8PQDkOsw==
X-CSE-MsgGUID: ItL5vaZeSCGI/Fhq/fBpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64828281"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64828281"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:30:37 -0800
X-CSE-ConnectionGUID: +JlEuKBqQmO4olawirj9iA==
X-CSE-MsgGUID: FtVYaJBlSdu4xMEkP2lW3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="220305635"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:30:37 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:30:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 05:30:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.23) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 05:30:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDAqfHiS38v/LnQFnkEy3yIkHyqnN3K9dhs2Lw07xtM6oBmuolm/LuMBHV6yLeToKkcC4xJ33Ixsq+jfgS/59Pl128wYBE0SiYOGsxqNiehj02lYDLykeCkbjSWztb9McRqoHcjaGd7+VkzBo7kfcFaZeT0QTkeB144S/4K4Sf++d/NLl9bt3D8WEyt2FTox5C9k1boOnXoYgvPm68NN5u8/7HvRMhkJnsTRukW1IAV6zo1czhRF3IFS1QSL6zpkErJZq4u9kflqP4eQ/BEegr2e1pWZnxqWgYHOt+pCNjL4HX+ydWBPFefsxm5spblDyZNwiWqkHDI75FwajxEb5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H52bIgaExpe6LD7xdj2JNO7MedDQo1QaHNI6mrLc3T0=;
 b=cMF6+oF1z70nBAdkiOb4wJk2gHBmGklnO1JmjKffX5DkVgdTYBNRhbcEcN9Ulnl48cOyqm1hRpDCzzQurF6WVYN8rYQgP2G4IxMY6+Ny0iEGUAWrQsrjyUSxbXzjroo+D5cmORuoGpPyBIZKdEbg+rBQXM10qht7HBf/mq1E8ZA2nrmqjJwkVGLEk6PMXWEbI3eTSshKqv5noZGUSrVNN8VSREAJP5K1TaLMx6AbijrOzA6Rkf1nUEXwM3O/P/r/92g3mo1xKgtHF/E4f2Q7M48X24yV6Ic9myZ69o9Tr9h6FX9F5FThIFloDqxKko3vdYOISQjJZF6oZRizVuwtHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 13:30:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 13:30:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110232017.1475869-42-matthew.d.roper@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-42-matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 10/30] drm/xe/mocs: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 10:30:16 -0300
Message-ID: <176304061624.3698.11188036014431727920@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR11CA0079.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6def99-b37b-4f9e-570e-08de22b8d314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmlqNmxSd0FzYzQ4S0hiNjltTVZDSDNSUXdwOTl2Nk9OT2RaZ2pyRmJZK1d5?=
 =?utf-8?B?Tkk5bGlxTHYwbEpQQ2ZqSDVRdU1EakRmQ0VwcE1BcHh5aXhVbTRZa29CYjdX?=
 =?utf-8?B?S3hxM3QxNlQ5RHJSMFUwWE53SCtvTTdCZ095ZjhGR0ZMSzdFSXFqa09jU1Fk?=
 =?utf-8?B?MUdwSjRCZE9zRERaZ0M5dlhCVzY3WWpwMjFiL2Q2YllZTDVEbmdBbTIvZDhF?=
 =?utf-8?B?MkdXejJncDJpa2pMUFlhcTB4TjJZSDJ6SW5hK0pjaEhxdUh5ejB5Rmo4Y3pM?=
 =?utf-8?B?WTY5bloxcTFFdDBrakpXT3FwZFhCODlMNmtFZFM0MHhMUFl5UDZyQ1RaQWpW?=
 =?utf-8?B?bFI3SWZpUUVNV29IOWdpMjFtd2VQbng3NmNLam0zU2tKbFFpRnhuSm1vcnVx?=
 =?utf-8?B?S1JBVDNQakFmUjlwQlJadk14UDRGb3FpSGpDSHcyTmw1V0xkbFd2TGxneFl6?=
 =?utf-8?B?T3JMMUt0MzltaEpXT2s3VTRpYXFtY3V2eHg3alZJbEw2bjV6K0JBNzNvOHlB?=
 =?utf-8?B?eVg3Y2ZJOGoyS0dzdEtDYzBKVXkreC84NXRoREdMU1VuQmJWS1pNQnhxZWNF?=
 =?utf-8?B?SFdsUXphQktUUnYvQmxVSndOUDdPQytEUnByMWo2NjUyOXhlY3p5Z3VXejZq?=
 =?utf-8?B?cUhYWm5zSmI0NEZvWjk1RHVVS3NLalV6N3F4NHp2VU9VRDJMNUNHc01EeDRw?=
 =?utf-8?B?c2hUMEExLy9VcjRCU1pXekFnbjU5OEQyN2tBRVdNSzlpUmdpUUlYck9pc1Jw?=
 =?utf-8?B?eHlRUWRjVXpqTTBXdW9qVk9IV3R1ZGlXRVRQOUhzTEN3NUVoS3VuL0RMQVcr?=
 =?utf-8?B?OUg5aE4wR2V0TDNjeHNZUzdhWU9BNk8xeVdZWUpGc3BDQTZxcXg2SmY5alpF?=
 =?utf-8?B?Y0FIb3c2S2gxNzFDL1dRMTJpeERkdlJZQTFiRjUzbWRJWktBRkluRGpqNmUx?=
 =?utf-8?B?Z1hhTUU2djNtRXdQUUIveWtaRm13a0VJU0o5TG9IOTdiMTYrVWlmZzJKK3F4?=
 =?utf-8?B?d3IyekN4UWNIMHlVNEhLTHV1Qy96RFE5bXpUK01kTUV2ZDRFeDYzbkllNEM5?=
 =?utf-8?B?azFOKzhPdEpFTlFOVFpKUjVkTlZ1d3pOTEpGNEMyWWxkSitvd1FSb1Y3WkFR?=
 =?utf-8?B?emhxcG04NTZsWm1Kd3ZmNmhMUnEvMS9GSjdZM1BSZzUydllBdlZjYTJUQkl2?=
 =?utf-8?B?bEtuSldjSEZ2RWpqRUdsK2dmcjVPc1NBWk01ZXY4cys1S29WWEIydTBCS0RJ?=
 =?utf-8?B?bHU0b2dxVW4wOThZQnV2d21GSjBnbWw0Q1lHeHJ1cU41Q1ByeTRrQVlYMklJ?=
 =?utf-8?B?eStic01NKytiMWxRRHBveWlpUFBQMWtwTzNvWmU5eG10WVIvSGY5RWhLQUxE?=
 =?utf-8?B?eE1DNmdyME5yTURWOEhwQnBKMGRhNnJRRWJ6Rm95UVVGandrdWV3R1Yxa251?=
 =?utf-8?B?Y2lKR2REbEE0MVQwZXhXcU94TUZ3RGJ5b09iWFkyUmViZkQ0ZzU5ZFRCM3Vh?=
 =?utf-8?B?WUk5TDBRWjU0OE5VRXhQNEpvbFc2a0RsSGpJaW40OWI0MTY0YXJnWDJXNVF5?=
 =?utf-8?B?NExJd2hrYlhsRlYrZ250TnI0SlVNakVTTnZRRmtJKzl2dzJvaXpwMUFSLzJX?=
 =?utf-8?B?dFFsaGU2T05HcmNLSWF1Y2RidFhkK1p6ZXBsR0N4VVVUT0lSaW8xT2NzZzBj?=
 =?utf-8?B?UWlqZHBEZm16b3BkOGVLL1FWZmZaeFF4Ym9ZT0dOMkwrc2lvOG5mTDAvWVpu?=
 =?utf-8?B?S0pKWS9CQUxucTVTSUZra200WDhZVDNGcEMvazdUd2hVdUp4czdabVFybjB4?=
 =?utf-8?B?VDRIKzZCUGV6cXYzdlVLdXM2by9meDMxQ1pPZ2lZUUNRTU5SdnZnalZuNVk5?=
 =?utf-8?B?d3Y0Ry9KR1l3THRYRnZGK213dzFWalNIemFEUEtiZFJyUGFOeDBtdXQwM25Q?=
 =?utf-8?Q?F7/h7AxOOLwewIzjLlphUt+YpAM6IiAg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bm9KeTREOHF1SzdobU11RGkyVDFWdnJyMUR5SjFacWZHM0Q1V1o3aXE5b3FI?=
 =?utf-8?B?M3VRWWNLOHlyRnJlbDBJeFQ2UjVtK0NIN2NBemZwZDFONWtCSE5tdEQ4N3o4?=
 =?utf-8?B?UHcwUVUwQkZwVG1mczlDZ1VSeVArT004OG1NK2dxVXA3d0FYbk1SUHhQdmtn?=
 =?utf-8?B?c1lyQVVGdlF5NFhIZk5yTEs3VHRBbXMwSGk3YVdUT3NHb0c4YldWVFZMNG95?=
 =?utf-8?B?VWw3YW16SkZHQUxWTTZNMDVaQ1ZpcFVRVDZMQzlwWmFpNTlUQ1BVZk9jQjI0?=
 =?utf-8?B?dzJ5d1p1SnNiais3MUkrb0ZHR0dGcHB4ZzliQ1ByZVA5MFdlam5rY0JNbUFt?=
 =?utf-8?B?VG5KVWphUlBYTm45bm1CNXBkY0tPc3RZWFFUS3ZLY1dWQ09zOFJybC9mTldX?=
 =?utf-8?B?WDlYOU5QSGNwQXlvM2lMMWxCRnZSYTFOelhBS3BTZFFDUCtWdURoK05nTW1D?=
 =?utf-8?B?eWtjc3NualhyOUwxR3IwM0NBYjBqMmx0clJuTm5kelFLRm9MYmNUM0p6TE9q?=
 =?utf-8?B?cmFjNVpxWW1SRnU4ZTFiNmIzdUZqMkl3SFJOWFNEM2hONU5YRUlEclZmbHkv?=
 =?utf-8?B?cmcrajhoUDZOb3pvTmVHWW9aTkNTYitCQzJtaEVPaC8rcytjWTArOFFhMEF4?=
 =?utf-8?B?NVdvV2pMRE1vcFUwcWFPWVdKTVY1Sk9nTXFaVU44a2hkQVpkTkJ2T1IyMmJB?=
 =?utf-8?B?R1pSZ2hkL3M1NnY4WTVsWk0vMzRxMmRaS2Q5QzVnNmpkM0wyS2wxMDdGRXM4?=
 =?utf-8?B?RVFTRlU4bk5Ja2tMSEY5TytIZ2JTWHBEeXdvS09LTmFwN05mdG5xOVJtNFU2?=
 =?utf-8?B?NWVyRnNHVGI4alJ6NFdCMytMalR0QzZSWGtnc0Nwc3lPYTZOa1Q1bTZqYmxN?=
 =?utf-8?B?UElEMVBza1RCdmN2bkJwQjVNdThNS1ByQTB5dzBmem1INzI2MTVtLzYzUnBO?=
 =?utf-8?B?dk9ucFBSNHc3NklxOE9iTmxaODU3NFRpbnQ0RHl3U0YzUkVreE1MUk15c2k3?=
 =?utf-8?B?VzRZWmh5M2U1N1BuTjNCUUtoUm5mL3FvelM1eXh5b09RbzJyUzJ3SWlHdHdG?=
 =?utf-8?B?ckcxdlRLQTcyYTFDNW5sNmRBUFZGWnJCOGx0Y0orS3RwQzNyMERmK1BWYVE0?=
 =?utf-8?B?QzFZeWliQW9lWG8ya0pZZG9JRVZrdFF3VnV5VTZBdVdjWW5wQkwwMURnRmZt?=
 =?utf-8?B?UTE3QWNieHZJV2dMQUpnV3hMOUFkYWt0VUhMNUpMYVlYZUgwVTVxc3M1YkNO?=
 =?utf-8?B?dkVGdktyaitacUN2SXBVNXRyZGhRWHNpc1E5cm9PckRpYWJSZGpHbVo2SW50?=
 =?utf-8?B?UXRFdVNXZWU0NWtUWTNKc2R2OUZJanBXYUJoZStublgvSFR6TXZHWkM4OVpH?=
 =?utf-8?B?NzZXQXdMUW1WbC9aNHhOcnEyREs3bGVPMmpGVEFLSW1kMnJ0OHpuNlNJWE9U?=
 =?utf-8?B?aytjUC9MT2VORUdUQjdEOS90SXVaOFk5Z3hnd05vemc5d3dUOU5Mb3MzMEto?=
 =?utf-8?B?Zmw1V3lqOEJHdmlVSFdxMTJTaE96am9KbzN5VGQ1Z21wVENkeHJCVjFqb3Bt?=
 =?utf-8?B?N3R5WUFjL0tNd3FNQTZ0NDNUekhCa0NTNWdObk1sdi9mL3VmaTVpTk1pR3BP?=
 =?utf-8?B?NWVoNGprVWlJbjV3clhXem5CbkJDTGFjaFprY1U2dUQrTEl3RDZZVmZBcjk2?=
 =?utf-8?B?NERsc2RwTXlYT3hYMDdXYkpEWlNhSmthNVBrdnhOSUJKd3czZ3hKRVB4UGRq?=
 =?utf-8?B?aUg4VWxNb1RUcTlhL1VEOVlzK1Rnc2puQmxVcVR0Slh6Z2t6SzNWQkNSMXJD?=
 =?utf-8?B?ZkNmSitrbWl6a1dXcCt0Nm11VzhtTk5zMTN5d0ZWRm93RWU4RnhTbXhJeGVi?=
 =?utf-8?B?RUlYM0VSNHAxbG8wNVh5TVJYa05VaFBlN3dRUm5KTXZobFZwdWV6djZBTmhy?=
 =?utf-8?B?T3FnZ3hXNWNMR3ZXU05TTWFORWtaK1F6UW1zb05xckVmRlFWYWtHL3hmeHp2?=
 =?utf-8?B?MzNDc0JKOWxXejhITjV0MEJ6YVNUR2ErZytmZisrTW1wWHhnV2twbXEyYW44?=
 =?utf-8?B?S3ZzS1pKMTE2bVQxWndiSDhzZW9xUzlCOEhLNlR3QUtJUCtGZ2R3dUVxeFVn?=
 =?utf-8?B?RUhxY0l1eWhOcU9Ydk9pa1kvdlpVcy95N3FkUG1CTXp2eWpUSTdJTGZISlht?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6def99-b37b-4f9e-570e-08de22b8d314
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 13:30:34.4910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMRWGIzQewgisCL4tAwdJc3r+f++Z1amqWEjWoq35LvGgWSnjzviPKObW6tPUnj6y+z12so9D9Mg00QBsc+CkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8287
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

Quoting Matt Roper (2025-11-10 20:20:28-03:00)
>Using scope-based cleanup for runtime PM and forcewake in the MOCS code
>allows us to eliminate some goto-based error handling and simplify some
>other functions.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_mocs.c | 17 ++++++-----------
> drivers/gpu/drm/xe/xe_mocs.c       | 18 ++++++------------
> 2 files changed, 12 insertions(+), 23 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests=
/xe_mocs.c
>index 0e502feaca81..53a0c9c49f85 100644
>--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
>@@ -43,14 +43,12 @@ static void read_l3cc_table(struct xe_gt *gt,
> {
>         struct kunit *test =3D kunit_get_current_test();
>         u32 l3cc, l3cc_expected;
>-        unsigned int fw_ref, i;
>+        unsigned int i;
>         u32 reg_val;
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>-        if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
>-                xe_force_wake_put(gt_to_fw(gt), fw_ref);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_AL=
L))
>                 KUNIT_ASSERT_TRUE_MSG(test, true, "Forcewake Failed.\n");

Shouldn't KUNIT_ASSERT_TRUE_MSG() be called with false here?

This issue was already present and is unrelated to the patch. However,
since we are touching this, maybe we could fix it with something like:

    KUNIT_ASSERT_TRUE(test,
                      xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCE=
WAKE_ALL));

The patch it self looks good to me, so

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

The suggested fix could be sneaked into this patch or we could leave it
for a separate patch. Your call.

--
Gustavo Sousa

>-        }
>=20
>         for (i =3D 0; i < info->num_mocs_regs; i++) {
>                 if (!(i & 1)) {
>@@ -74,7 +72,6 @@ static void read_l3cc_table(struct xe_gt *gt,
>                 KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
>                                     "l3cc idx=3D%u has incorrect val.\n",=
 i);
>         }
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> static void read_mocs_table(struct xe_gt *gt,
>@@ -82,14 +79,14 @@ static void read_mocs_table(struct xe_gt *gt,
> {
>         struct kunit *test =3D kunit_get_current_test();
>         u32 mocs, mocs_expected;
>-        unsigned int fw_ref, i;
>+        unsigned int i;
>         u32 reg_val;
>=20
>         KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
>                               "Unused entries index should have been defi=
ned\n");
>=20
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>-        KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
>+        KUNIT_ASSERT_NE_MSG(test, fw_ref.domains, 0, "Forcewake Failed.\n=
");
>=20
>         for (i =3D 0; i < info->num_mocs_regs; i++) {
>                 if (regs_are_mcr(gt))
>@@ -106,8 +103,6 @@ static void read_mocs_table(struct xe_gt *gt,
>                 KUNIT_EXPECT_EQ_MSG(test, mocs_expected, mocs,
>                                     "mocs reg 0x%x has incorrect val.\n",=
 i);
>         }
>-
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
> }
>=20
> static int mocs_kernel_test_run_device(struct xe_device *xe)
>diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
>index 6613d3b48a84..0b7225bd77e0 100644
>--- a/drivers/gpu/drm/xe/xe_mocs.c
>+++ b/drivers/gpu/drm/xe/xe_mocs.c
>@@ -811,26 +811,20 @@ int xe_mocs_dump(struct xe_gt *gt, struct drm_printe=
r *p)
>         struct xe_device *xe =3D gt_to_xe(gt);
>         enum xe_force_wake_domains domain;
>         struct xe_mocs_info table;
>-        unsigned int fw_ref, flags;
>-        int err =3D 0;
>+        unsigned int flags;
>=20
>         flags =3D get_mocs_settings(xe, &table);
>=20
>         domain =3D flags & HAS_LNCF_MOCS ? XE_FORCEWAKE_ALL : XE_FW_GT;
>-        xe_pm_runtime_get_noresume(xe);
>-        fw_ref =3D xe_force_wake_get(gt_to_fw(gt), domain);
>=20
>-        if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
>-                err =3D -ETIMEDOUT;
>-                goto err_fw;
>-        }
>+        guard(xe_pm_runtime_noresume)(xe);
>+        CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), domain);
>+        if (!xe_force_wake_ref_has_domain(fw_ref.domains, domain))
>+                return -ETIMEDOUT;
>=20
>         table.ops->dump(&table, flags, gt, p);
>=20
>-err_fw:
>-        xe_force_wake_put(gt_to_fw(gt), fw_ref);
>-        xe_pm_runtime_put(xe);
>-        return err;
>+        return 0;
> }
>=20
> #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>--=20
>2.51.1
>
