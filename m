Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87766CA1005
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 06:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D64C10E5B5;
	Tue,  2 Sep 2025 06:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oG6eZUpY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D391E10E5AE
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 06:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756793863; x=1788329863;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=R6xCto4eBz/ntVB0A/x8ci8o+hls0urLbTreYTdChrU=;
 b=oG6eZUpYYOO3LW6OeUurAijnZXEbaD32XWl6YbHME0mINVMcyaWG7kLq
 FquzD/B4uuzSlaDXjh7okdvUENxxL4PM4+dyKfqyU5f2vaRNY/Yrkt/Yc
 cy203Ixf1QWbtOFvahwKJzeuGTMMgrSFZAbSKL+x+4MgzsIVFU8oZlPar
 4a+BTMABJY7HF1BPwCsPjUrzJyaPWYlIeWQl1St5dnbwPGEb8T+gk7se+
 O97DKp5oU29thW/n2zD9I2ZOB2yGRbXtDKnPFYcnvkrlVMsBnAZa0Vz0H
 AmK5NVL18NQ1oIHrsNed+I9nfOP7J2r0sAzvz7jmZ5Z1yBB9IybZWM4nf A==;
X-CSE-ConnectionGUID: BtCGY3dVQtiJI7RB9jQSJg==
X-CSE-MsgGUID: m9SpScoZSD6lFib6mWHy1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59190821"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208,217";a="59190821"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:17:43 -0700
X-CSE-ConnectionGUID: izgyYea4QUKypLo2pZynzQ==
X-CSE-MsgGUID: JT/STNR7Q4aGKzhfRb/iBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
 d="scan'208,217";a="172039656"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 23:17:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 23:17:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 1 Sep 2025 23:17:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.51)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 1 Sep 2025 23:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN8jYof8BWcu7t/TNQ4+KoqBaQx5vropAi1TWbGXAVMk9h7s3fi2/vpB3Ox8wWVl3aTV0a1R5tMBpIcaJF+guyJz7Vjl8yVCvvjdsCwlqV+42nw55yv7xRu07mmsC3ioPZ1RxDxb1j31aDLLNhr8ovhifU1BywIjwl02y0e7v9zjg2Bzq9ExjxuSc6fCdptKMoUB07JDuQnOzl76CyLYOUkiuC3EhsFh1D4LGnbjuw9HeprDSz3Ha5ndiFvOwPU8pFAhRKN6oxTdlZYw3zWCeXthfOKieXZlEkj1dkdg4t/61cICjS6XR4ZsLR/sEkRD64LM9tlXFdWWyc+QD2sTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fArjKTvkye3KAsD6ganSl1dQLzjS9sjahGeLxgXr5Lg=;
 b=V7HERy6kWgGqLfUr4u/c7JoWDim1obfrkNxY2hFMriBkGvL+tUsklFFenoWbQhRXEbhJdCsqF13QJILdm/dhR7fTsdlcvC2QirYRj4hZXgV6C6orrC9GTa5AGdTGsLBSk6Wa3hI3ZzTl2rbGM0HXhEPewd91Fyyq1H9V4M7BKIykq7KJKvZ9a47WFSt4Gt5p1IoXd8jcTVOeCbK7O0rangAurT2+pljSIcltb4lZDO6bg97Esv3EswOyC4Mi96XtdyOursqYJgMfuCq85tZfBT1EbOU2yBq2+0ePeqdo2DwG6S2iOJrFzS/S/+VY4sppPPtxcVALLLJw8bqjYWcQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 2 Sep
 2025 06:17:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 06:17:39 +0000
Content-Type: multipart/alternative;
 boundary="------------0gr2LY0Kyg0yXWRJQDrTnekf"
Message-ID: <00cebdc4-6427-4720-8e54-c7a230732cb6@intel.com>
Date: Tue, 2 Sep 2025 11:47:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
To: "Rafael J. Wysocki" <rafael@kernel.org>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Gupta, Varun" <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <linux-acpi@vger.kernel.org>,
 <linux-pci@vger.kernel.org>, <lenb@kernel.org>, <bhelgaas@google.com>,
 <ilpo.jarvinen@linux.intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ville.syrjala@linux.intel.com>,
 <uma.shankar@intel.com>
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
 <20250529111654.3140766-2-badal.nilawar@intel.com>
 <CAJZ5v0h7BENMDCOHVD6ZdF7o1OwE=RAOzkC0+r+G=-3qpjfn0Q@mail.gmail.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <CAJZ5v0h7BENMDCOHVD6ZdF7o1OwE=RAOzkC0+r+G=-3qpjfn0Q@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: dce5d68b-158b-415a-9654-08dde9e86ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3NPbklJSHlablFDRHRtdVJXbXpSaHdsZVlZVU1CdnBzRkI2UjZISHNrMW00?=
 =?utf-8?B?bHM0bzVaUWV3Y0crUzhTeGZVUjRpWDZBc2h4alVyU0wzOHpoalg2dmJxNTIw?=
 =?utf-8?B?b2RrdzBxUVV5UkpIWWpMR2liVTRFZWtjc0c0SEpTS200OGNOUU51bmpTQTdL?=
 =?utf-8?B?RTlLcXBvRDZwZVNCVHlEWmxDTUtFMVNGcG9EZzJYSUhUb2o2ZFVSUzNTWUx5?=
 =?utf-8?B?TWpPSjdkY2w4cW51OHAvUEsySU4vTjJIZ1R1dmQrYVFOdFFoOGR1ZnRTRE9X?=
 =?utf-8?B?d1RNUDczUWduT2l4ODJXMzBIQlVxWTNBZno3UGE2bmN2amwxNURvUmZ6WXF2?=
 =?utf-8?B?QVN2UDErbEw5MjhnbkRGa1BUd0RDTHV4SmRPNFg5YXpxY05ST1NPY3IzTU14?=
 =?utf-8?B?Qi9VMjFDbHJ4V25sL0JQWktPVWV0T3VqWTArbmo4bFFZQkN4UmJHNDVTeGJj?=
 =?utf-8?B?YllwN3VVU1NjSUFnOFZqOCtIU3diaWpzbVpPNW1UY3lGaGdqWjVudDN3bnZx?=
 =?utf-8?B?NXNQdk1URENhR3QzR24reFJndlpjUGpxY2hTVGQ1ZnlJdXVHUFZ3S0c5UzBl?=
 =?utf-8?B?SWU0Mi9mdVhrNnd4SmV4MUJUa1JPNmVzdzBMZGplRGpFL1NIN2cyMmdQYzI2?=
 =?utf-8?B?ZEdxUEVZUzYvRVc2azgwRklXQyttTkI1LzN4RXRTZ2lnclN5Rk9yaWRKK3p6?=
 =?utf-8?B?L0hKUDcyM3JMa3pzQWh3R05vM3RmOXY3MFB5aGlOaGN0cXdGcU5JMXRSc2dw?=
 =?utf-8?B?V2RyTXZrU3VkN01PckZ1TndlclFuTGpudTN5alhINVFISEpsWDJqNjFhWXkr?=
 =?utf-8?B?dFJ0cjJhOEkvK3NlNjEzKy9ibS9mNkE2OHg4ZnRNbnlpL05OQ1Vqak43U21O?=
 =?utf-8?B?bmZaUTZTbTVyelN2L1FlL0czUFh0OEF3ZktTeHRJTlpuVUI3NG9lSDM3d3ZR?=
 =?utf-8?B?bFM2QmhJSnE4TDBZSzU1eWNVZFdweTFzNEVQRHpDK3pXMEo3K21OYWpCRHFC?=
 =?utf-8?B?NzIrZ1ZaNWFXSGtWVXZMbDJpRVl0alp1SCtrcjVpTkxtVmRPMURldVV4bk1y?=
 =?utf-8?B?U0VxUWJTdjYwTnVmUTdOOE9HVGNuYXJxUGFpWTlrdEpUSlRUak9seUkyY25r?=
 =?utf-8?B?TmtwbzVQUzdydGwzWFJuQjE4T3NYR1BGcDQvN0Y1Z2xKS3YyNlBxbXExMnc1?=
 =?utf-8?B?eEJxdUJEY2lXZDBOYVJmUEVEQm1lOGpzWE40SnBvK2pvSE1rM1hnS1IyNmk3?=
 =?utf-8?B?bjhkNlA1TnJhWjExSmtuVVRpRzhTMTY2MkJDbFZvT2hkTTg0bVBFUmlxbjJU?=
 =?utf-8?B?aEZvbmxhTi9BbXI5eUllbnpPQU5ITlBSM0Y5dHhUa0ZVWExsV3dFNlVhL0Y3?=
 =?utf-8?B?WThLWC9FOGE1WlpFT3Z1S2NTSTBtOXlSTHE2aEpyc1AwcnptR2Zoc0VIYW9R?=
 =?utf-8?B?Y1Y4SUpRcytFTzNQTkdFSTdWcFNIYU1IMFZSN2VtZ09lRVRjSk9LUEdqUGVY?=
 =?utf-8?B?OHNBV0FuM2RzZEt2SFpaQ080QXk1RHJ4a0IzZHZXR0IxQnd3eldOQ3puYmRH?=
 =?utf-8?B?WDRjSVRZWFpBWWJRVWJUQlFmUHE1SHJ1ZkJ3SFVyczZrMXcvSXZTdllVanFM?=
 =?utf-8?B?eHp2bUE0WVJHWGZaczdZdmNzZXNYU3YyaTRLRVIvenpuTUdIQkh0cTIyeW1X?=
 =?utf-8?B?a3IvdTBvMUFpU3NjNUhDRGFYWHp5UzFoT3BEdmEyZXlWSWpBdXIzNlQ2NW5M?=
 =?utf-8?B?aUtuZ1FQUnpOaDNJTlEzeWlSdnlabWJLY3Fad0wrTUdlZHp2dW0zU3FudVU4?=
 =?utf-8?B?ZmdKQWV3a0Z5TXZoSUE2L1VLbFBRL1ZPQmtEOWtRYlFHekQzTGFHSXQ4OXV3?=
 =?utf-8?B?RHlIWmZkRzVjMGRnaTRlRUg4UmJsc0x2UVp1VG5jejMwbVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckQ3QXhXVFAxVlpJRlhUMEs1UW5qK21iaDNiTUhuM0s1WDI3TWdteEthQU9t?=
 =?utf-8?B?TnJUUG1XeTJSOWJVTFBOOCtmckFnQ2F6MC9rcHlCVzRtdSs1Unl2QStDNTdH?=
 =?utf-8?B?M28zVGl4RFNpQkxaWDBLOWYxQnRDN2dGaFpXaXhWaERvL2VJTmFPYTR6RGdJ?=
 =?utf-8?B?dUh3V1dIWVRsbUdZK2NrTUUwb255VktYVThSTXoxQWlOZUcwcU9MdU1hY25J?=
 =?utf-8?B?KzRXUXI4Z1JTS1ljdEJTRXcwMWZYaUJzcVVxZ3NYS3RLNjFSZks3WUZQN21P?=
 =?utf-8?B?U2ZjRW1YaExIbUhNM29NTDVWU3YwMUNEQmQxZGlOWGhMZkJyR1NQVW5ldHBl?=
 =?utf-8?B?anpNSHhKOXJaUlYweHYyUFExUzlzN1JjdlVlaEN4dXV1UHEwUEFjU0dHMWN1?=
 =?utf-8?B?R1hYTGM3Z3p0VExrOWpTYnpmcFptQ3RDQmlEMWdyL1VLWldxZHg0aExtc1dK?=
 =?utf-8?B?TmFpZi9aRTEwbjZaMFp6d3B2UXc5S0pKaG40UHUrVDdKTFc2ZURIS1lxc2hB?=
 =?utf-8?B?VWkwYXpYVlV3ejFmalNBVUthaWt3YmtMeWVCaWdVWnBWL2pISlIvQ2IxRFdU?=
 =?utf-8?B?U0Y4VlNXVUFhSW5ZUmo4VTh1MDlnc3N0RkRoeXVzSkVkWmZrd2V1cTlsRDQ2?=
 =?utf-8?B?T1cyaWNhdlE4MktBSjJjd0tJN3k3WVhMMnJRZ2VuUTgrZjBHUlhCUkdJMXNa?=
 =?utf-8?B?bldia1NCQzVUdUt3YnZxRXhVWXBOTDJweGp3Z201NERrM2lZQmwwTERWdmgw?=
 =?utf-8?B?cC9XZGhNRGF0M0Q3MlVhQWEvT05iVDd1N1JlS043RmpKQ09KT0N0Vys1bWZv?=
 =?utf-8?B?S1RtcjBGS01JeEZFL21tQ2VlK3MzM3FiZm9KQnlQeEhIc01tR00wRVJHeVpp?=
 =?utf-8?B?OVVEOFZrcHMycUFhYU4wVXNJKzhqWEVuUmVaazhNeDUraW1JSytyZU9jak5z?=
 =?utf-8?B?NmQxa1AramJVcHI0YStTbjZNU0pFQ0JUaHZlV1kxY1JpYWxQbnJvaVdKaXpE?=
 =?utf-8?B?aW1TTHJYOEdNWW1lSmFwYjdZY3haazRxRnZlNytzL1RDVTR0cmRxclVWNjBo?=
 =?utf-8?B?RVhJOGdzcE1oQzF0M2U2RkRkU3U3eGJHbzN4TmtSZDJLdHNxeS96RFNxblpT?=
 =?utf-8?B?dmpUOFk4SWRLMGJOc1dPVHY3eDVCeGloL2J3WUZBTkpBODBCQjJRM0lqUEtK?=
 =?utf-8?B?Z1RCNzZRQkhlSGp6ampWUm9GN2hJdVd0dkZTVkpySWJsQ3dDWTJnNGZzU2Uw?=
 =?utf-8?B?b3I2Lzc4RnZkRWQ0SUZlazV3Uzhhb1pVb2ZKanFMelNZUVdmbjdvS1kzWlA4?=
 =?utf-8?B?SGUyb3RQNCtGb0tRNUZQNitkQ3MvVWhreDJKS3dHM1M1dGZkejM3Q1dKeWpW?=
 =?utf-8?B?RkxiaGdTeTNFK0tHS1hKYkU1b3lYUFdDd0E3RWRIQzBWMkQvK2lDNXZUU3BL?=
 =?utf-8?B?VEI4NGtZUlRkTXRlRHdYOEpDYVRwQXQwcTVhbnVMUWJCbjRENExoVzJtQ3do?=
 =?utf-8?B?NGk5L0RuVVE4Q2cxUzBIeGt0RW14R3JGSXNEUVR0NU50SjhSWkd1Ni9aemtN?=
 =?utf-8?B?Tk0vRzBCRzV3TkpxUHNjS1Z6dDRoM01TZnRQZFREM0xYZzN5UFZJb2J3KzhF?=
 =?utf-8?B?dXVLa2JvQ2JCU1h4UllXVnUrRlByN0hRT0M2eU1IMWtBNUR6S0VNMlFlMkFY?=
 =?utf-8?B?WnRRb1dhYTkvWDZQRlIvSWxLckxRK1JJbUVYdmVOZTYySkVVa2g3S1ZEekFU?=
 =?utf-8?B?VFRVNjNIb0hLVDhSK1BJSTN1cFFwNmxNZ2lDSFFJcUZqcm1sdDlpTm9QcVlR?=
 =?utf-8?B?Z1FvR05BK0MzL2t4dTk0T0hPSUxNUWgrb3RhN0VjK2paWFdqTTBGeWFWK0hk?=
 =?utf-8?B?eGhEQ1BDRjg1S0NNdTVUc2p4ZkxvVGRqa1hVU3Z0ZjF5TlVXN3BlbHVPUTdD?=
 =?utf-8?B?aGo0eTdBNHRnVEFvVzM2T1JUd0Rwd1RPL0YyRGJ1QS9nU3VhNVdFdHZjNWpT?=
 =?utf-8?B?RUFqM2Yvb1BRYWNOUDNEVHo3K3pYNHpuY0Q4U3EwUmZSRnV4YVNmaGY5TFJy?=
 =?utf-8?B?NDZ3RjcrRURVUkdSMkNQdUJ0R3gyRkwyeXAxUWo1S2xnWEFnL0FYMk5nZmw1?=
 =?utf-8?B?LzRaZFBGbHdDMHN6TUpkUGdSWkZRK3NSYVA1N00wQ2orMjduNWd4VFRtQm5C?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dce5d68b-158b-415a-9654-08dde9e86ab3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 06:17:38.9470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckzB0miQAW0pxowMI9RVhXicmdht2g2tADgO/8f/28pxdZIsOgKSH7iWA0KzJrvTLZrxRmfJEp9F7SKjvcDslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

--------------0gr2LY0Kyg0yXWRJQDrTnekf
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Apologies for delay in response.

On 02-07-2025 16:38, Rafael J. Wysocki wrote:
> On Thu, May 29, 2025 at 1:14 PM Badal Nilawar<badal.nilawar@intel.com> wrote:
>> From: Anshuman Gupta<anshuman.gupta@intel.com>
>>
>> Implement _DSM method 0Ah according to PCI firmware specifications,
>> section 4.6.10 Rev 3.3., to request auxilary power needed for the
>> device when in D3Cold.
>>
>> Note that this implementation assumes only a single device below the
>> Downstream Port will request for Aux Power Limit under a given
>> Root Port because it does not track and aggregate requests
>> from all child devices below the Downstream Port as required
>> by Section 4.6.10 Rev 3.3.
>>
>> One possible mitigation would be only allowing only first PCIe
>> Non-Bridge Endpoint Function 0 driver to call_DSM method 0Ah.
>>
>> Signed-off-by: Varun Gupta<varun.gupta@intel.com>
> What's this S-o-b for?

Varun was handling this patch from Anshuman earlier. Anshuman can you 
please confirm whether the contribution
from Varun was significant and needed to be co-developed or can this 
S-o-b be safely dropped in future versions.

Thanks,
Badal

>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> Signed-off-by: Anshuman Gupta<anshuman.gupta@intel.com>
--------------0gr2LY0Kyg0yXWRJQDrTnekf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Apologies for delay in response.</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 02-07-2025 16:38, Rafael J. Wysocki
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CAJZ5v0h7BENMDCOHVD6ZdF7o1OwE=RAOzkC0+r+G=-3qpjfn0Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">On Thu, May 29, 2025 at 1:14 PM Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a> wrote:
</pre><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">From: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com" moz-do-not-send="true">&lt;anshuman.gupta@intel.com&gt;</a>

Implement _DSM method 0Ah according to PCI firmware specifications,
section 4.6.10 Rev 3.3., to request auxilary power needed for the
device when in D3Cold.

Note that this implementation assumes only a single device below the
Downstream Port will request for Aux Power Limit under a given
Root Port because it does not track and aggregate requests
from all child devices below the Downstream Port as required
by Section 4.6.10 Rev 3.3.

One possible mitigation would be only allowing only first PCIe
Non-Bridge Endpoint Function 0 driver to call_DSM method 0Ah.

Signed-off-by: Varun Gupta <a class="moz-txt-link-rfc2396E" href="mailto:varun.gupta@intel.com" moz-do-not-send="true">&lt;varun.gupta@intel.com&gt;</a>
</pre></blockquote><pre wrap="" class="moz-quote-pre">What's this S-o-b for?</pre></pre>
    </blockquote>
    <p>Varun was handling this patch from Anshuman earlier.&nbsp;<span data-teams="true">Anshuman can you please confirm whether the
        contribution&nbsp;<br>
        from Varun was significant and needed to be co-developed or can
        this S-o-b be safely dropped in future versions.</span></p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:CAJZ5v0h7BENMDCOHVD6ZdF7o1OwE=RAOzkC0+r+G=-3qpjfn0Q@mail.gmail.com">
      <pre class="moz-quote-pre" wrap=""><pre wrap="" class="moz-quote-pre">

</pre><blockquote type="cite" style="color: #007cff;"><pre wrap="" class="moz-quote-pre">Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com" moz-do-not-send="true">&lt;badal.nilawar@intel.com&gt;</a>
Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com" moz-do-not-send="true">&lt;anshuman.gupta@intel.com&gt;</a></pre></blockquote></pre>
    </blockquote>
  </body>
</html>

--------------0gr2LY0Kyg0yXWRJQDrTnekf--
