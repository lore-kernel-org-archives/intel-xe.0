Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79A0CA0EFA
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 20:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6691710E196;
	Thu, 21 Aug 2025 20:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pdb9BtBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9771910E196
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755809686; x=1787345686;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=fiUHvCwFFHsLyUud13DubIgXP1BkdYQKk1iurzdXyYU=;
 b=Pdb9BtBMHRTL52CzpGmrg9EaMRgBCjkarxxCGFSYKaOs+Nelk76he3oX
 GFZICle3Gm/AwxyMy2Syd/RnmuQ0BlUgt3q0RnVc7d20YwGTkgDGBoTjY
 u1nNVLp1+fzsV2KWCQcgcbH4BOEsV/vvo6eB/TFJ1rENBnGP2RmsxopI5
 +a6KZN2qvFt04aQw40swltMdFLDTPhw3/CGeKih10OVawSxVpQpkYmQz9
 /VwWQtm58PjpDfkwhZKu56fx8ufD0AvAGpbVa/7meS5rI7HTNDrXoY4/Q
 JDUHVFE8YWsqjmOVLIlPKmUhSoC50esYen4dskf1ybFT4TDwrKdyd0zP9 A==;
X-CSE-ConnectionGUID: yq2/qjZFRE+fGvCRi3E2OA==
X-CSE-MsgGUID: ZZZRCkyNS3KgmSB0QGR6NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58063014"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58063014"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 13:54:46 -0700
X-CSE-ConnectionGUID: wlywIzyaScCJjdd9In03lg==
X-CSE-MsgGUID: isNwoE3bRoKB9ajGOyytHg==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 13:54:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 13:54:45 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 21 Aug 2025 13:54:45 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.80)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 21 Aug 2025 13:54:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDzH+pWphl57Gsdq4lr4nt7T4Omy0sWQf9r4p4B/Iv3vHwIJbV6wJxBDjUxBF2YBRfirXJjcFKy2sSbkuVF4q+TvYuhrWADbg+Wpi4NT0pWu6zaRlh01DlifZuQeGvqn6j8qgO6e35DEn/Ywh7qcJDXXWGU8r22A83Bsf0WGPNeJvq6HZfSLFuOl7C7z0TQeXFkXV7jUzghh3/m5uwPxmDliL5qrxpeC8x25y1reUZFK/g/dy+lP8WFrrtxs9cyuwltA9WjXJDQCBOk+5T3sUWkklYdsCpb5eKqrgz44bWPadTK4NMQPxYi/YRWr7NG6yp+p7Uu3UK+h/3jVpoMJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK/btBZD9J565ypy4Dy6PspfqhBsRBRcwaz+UH12cUQ=;
 b=qJGEhC+WFd6WW3mwyu0Ja2kanMepP36rpvKoPP53Ne/Db0KwQTM34rBcInuhJQNAl4NbCr0cVbVfx28N8jllYFbK3/Dk7cXuLPBIIaPTlsq/gQaVVYGQqUKQ7fviMFXSbaqZAk/A9sB03qHSuhwQet2qLyHMZ4kOQPCPwY4pO80LE8B74/QK4krgwytfnsoBx1AS5tVPDnmhS19YQqRSQMm10wWhlsmeMM/Nn7Sm8s+qCX7EIJi/r3jjhfM2Rq988SUeaulg4Opp8p7EvqwvXDtpxo4yhXpNvY60hICU9Lv6QAv5UxQxYJj7IxEEWA+jBKnvVyaamCXMMItXt0J7DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by PH0PR11MB5951.namprd11.prod.outlook.com
 (2603:10b6:510:145::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Thu, 21 Aug
 2025 20:54:43 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 20:54:43 +0000
Date: Thu, 21 Aug 2025 13:54:40 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v5 05/12] drm/xe/psmi: Add Wa_16023683509
Message-ID: <aKeHkJST2ef9LeHt@msatwood-mobl>
References: <20250821-psmi-v5-0-34ab7550d3d8@intel.com>
 <20250821-psmi-v5-5-34ab7550d3d8@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250821-psmi-v5-5-34ab7550d3d8@intel.com>
X-ClientProxiedBy: MW4P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::14) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|PH0PR11MB5951:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b75f59-f971-4b69-fea1-08dde0f4f441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXZzc21tTlJtbWJoZ2owVWpGWCtCTnowZW43eGpOaGZMVE9ORzdYemV1QkRn?=
 =?utf-8?B?TGlFdUdtTy9LOTJYb3lOcXFOOGZvRy9GNGdOTWN5TnZaQUZDOEI5ZWpIcy9P?=
 =?utf-8?B?N3ViNFBEZ0dNbGV4cllwRkJkT3FZRWk5NFRjMFZsMU84cm1HbGVsYTlUWVJ0?=
 =?utf-8?B?RkFZdlZpTlJLL2NKVmw4R2l0V1crRjhjSWlFQS9nVHQvbklYOWFIL3dsRUYv?=
 =?utf-8?B?MVA2SkhkYVNYYU9xV29tOHUyTzl2U0tWOVV1dmlSTGlpZDF0Smlwa3NLVi9H?=
 =?utf-8?B?S0x5cDJrdkl3MFIwRVNIeG8zd0RmRXpNcjA2S1Q5V043S1FqdHk5U1Nkc3BH?=
 =?utf-8?B?NUtuZ3RMa2pBRzFYNWJwM1A5UGpCUVFpajdESDRUZ3llQm1NS0F3aTNaS25t?=
 =?utf-8?B?K3FYVDkrMXRPYkNIRVZ5STNLU1lDUU1VdVQrNS9mQUppOXhZYllpK2g0WlA1?=
 =?utf-8?B?MExyb29kb3FHY3R0V1BqbUdXbnEzdG9HeXBwa0ZrVFpJaHNqUUtRK0Foakxl?=
 =?utf-8?B?VFBTYXJuaXpzZUFXZ002WHNVRTZWd3l6VjVNRkxGT0p0bStEWHlDbW1sYnNr?=
 =?utf-8?B?U0x4NGphelM3VFNhLzVZNlk5bEQxc0xqVWJGMCt3UHJxTTUwMnI1bUtsUUZJ?=
 =?utf-8?B?M2h4SGp6MTF5ZnduWGEwMlRsbnhDT1EvZTRzd3VTNWVwaHE4OGlTS09ja1Zq?=
 =?utf-8?B?N2xjSVQya0p1M1RzL2E0UEJiKzVMbW1KODlsN2M5UFNKYlJhQ2Q1YnB3M1FR?=
 =?utf-8?B?NFBWTGpGMGdYZnJRclYzdFpYZ2tvRzBjWkFsSnUyRTFKSlh1NGhBVldheUgx?=
 =?utf-8?B?WW1HVzYxUmx1TWlxSWNPYTNWQ0UvS2wvdW4vTllKcTBBSzRIRWxDbWM3SWVO?=
 =?utf-8?B?Q2NNMTkzeG9VaTJLVVBmY2VEbEV0MHFXY2lMZjExRlJpenN4dXduUitmZ3BN?=
 =?utf-8?B?WStCTUtnMmJBek5tMUkyM3JKZFc5ZlVkQUVyUG1UVldOdytDMFZwaXVZcUU0?=
 =?utf-8?B?RktNbTVNS2RBU2lZOGYwVml3dmpxM0o5L3dvTXVKdTREWkdZSmpINFhkVzYy?=
 =?utf-8?B?b0IzRk1uOC9mUGowSEY2bDV5VmhROFRUTHZaOTFuSUpjOHpkU3RrdWtCNjB3?=
 =?utf-8?B?WlNxVlBNMGJYMUh3ZWNaMTFBY2s0QUY0anZNaTJ2M0QxbWZIQXh3a2ZNUWhi?=
 =?utf-8?B?amVNak9DWUN2TVNOcDZUOHlEekJuazl1bkNJSktXRlpzM0EzMHhLaEN5VUhR?=
 =?utf-8?B?MnhmdFp2WEFsOWsyVXBCZkZCU3RlUzFYTWdScE5aTnh3M0FwYURsVXBXSzBO?=
 =?utf-8?B?VXFMLytOdkhjTkJBMSswWXBPblV0T3h2RWM1WG1ZRUVHbW9mZmRhQkRTc3RJ?=
 =?utf-8?B?aVFLbDZoSUYzVjMzVGRlOEtWczdKQXhjcWNLVWpjVStLSW1QRklORnRiT1l4?=
 =?utf-8?B?aS80OGoySGRJTktuRlVQanhpVFBkTWN2b2pCY1dUcVc2enc4K2t1N01xbGl1?=
 =?utf-8?B?QmhOVmJkd1RBV3JaOXBCemNrR0JUeW1LbHYyUisxZlRMdzhkdW9Zd3JzWjl6?=
 =?utf-8?B?bWxEUmpEM3VvM3VtSDU4VUJIK2dMMURuejJaNEREeGVMOTJnTDFVc1FDbXRJ?=
 =?utf-8?B?ZFFGV3hHZXZWMGFaRkQzb25YaUUvMmNFbFR0QWY4TlZjNnhsc1IzMTRxcjdv?=
 =?utf-8?B?MTRlelRRVXlXTHpJemRiUkFFdkRXbWJxSTNPeVF6REl4ZENHMWt2MzhJV29D?=
 =?utf-8?B?bUcwR0FTSWcyNUdWUzJhUC9uMkszYldWSjdmUHRyV2RSSHNPc3k1YWhiOUpH?=
 =?utf-8?B?ZlhJQUNVSGh6aEJib0ZGMDhIVFM5T2FVU2wrM1lYZ2c1YkI0OTQxMVFSTmNy?=
 =?utf-8?B?WVNsRHFzM1pObnhTTVJZUXA4bm1seXFUakR1TnVBRzREYWk5SStLSDliOE0v?=
 =?utf-8?Q?GsPdlBw5p9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEpzMlJ0ejBjc0FUQmRlbHh2TmdFY0xvWWIzQzRKTjJ3dWtxL0R0MUMyNnNB?=
 =?utf-8?B?MFh0Q1FJUHVaYnJwMkFDUnJCNjN2NllpUDNzTTl0dUdLdnpmV09odGJwVTRj?=
 =?utf-8?B?VFo3THNBeWxNeDhoc0NWRW9BNWhGc2hPb043ZjVuTjZZZ3MzQk5Qc2VnbXpa?=
 =?utf-8?B?aFVpSnFvOXgyQ0d4WmlzMlNCT2VMOHgrZzlBQVhWaEN0Sk1mYzNYUHh5OGhk?=
 =?utf-8?B?THIwMkRMeGpkbDc5UmFVQytCR21UcFkyQUpPQzA5TlA1ekx0VXVqOVF6MjF4?=
 =?utf-8?B?ZUY4VFphZnhGZUdRUzc3Q2lBR3dLbS8veThuSlNHcFNTcUpnbktNMGdxTEI1?=
 =?utf-8?B?UE5aN1c2ZGpPRkJoQmxjeUptY1c2eXBpMWwxU2VsRGl3Q2FTZkd4a0pVbjVz?=
 =?utf-8?B?R1AzSnpUVUV2T1pUUHVKNGY5cVpqTytpYmxWcURHL2hlYTdQS1I4T1c5Uk9v?=
 =?utf-8?B?V2pJODFraDlNY1hYZE9ZYzhPVXR4cVlNRmI0Z0NWVGd1SUV0Y2RwMXd0QmZ2?=
 =?utf-8?B?LzJNRUZlY2dmSUxOM2ltSVdvc0ZJTmE0cWpEcUN1RERnRmxIbHM1b0pEdThL?=
 =?utf-8?B?NmxPN1EvbU5vWmFFN2ZUamtlbHFKanVZL1JEeTNwRW9KTVFrcEhKd3A1MHhz?=
 =?utf-8?B?UHJXcHdYbDZqMFZ5bFZ0ZkN2UzQ3N3pmZUpSZjJRSWpOTnlpN3h0QTJrcFZW?=
 =?utf-8?B?Rlpqd0Nubm5xRC9iQ1Q0dytjTllwL2ZDSVBYeXB1ZzUrVDdZdXVQcDdiV3dH?=
 =?utf-8?B?ZVdlSU1IUEJ1RUEzMXpmSXBCU1dKemI3R2V5TXdhOWZqQWpqSGFnWXh0TnFB?=
 =?utf-8?B?ajJ3YU4xR1dhNHFTRXFIQU9paXVmcVErcGtKZ0FjV1JHZnN0Nk9vQmlhYmdC?=
 =?utf-8?B?MDRmK2NoMmVpT1Z0ejJsd1VxT0dvRGhOTzlQUmowYTJFVVdwbVRPVjZ5Nkti?=
 =?utf-8?B?VUFOWEFEYXd5UDcyY1BwYWUyWEFBU3pBNThWVUxUQkM3WmJzSEc2ZTJuK1lS?=
 =?utf-8?B?LzVhaWJvNWhBc1MrUHRvcERIZUxKNEd6a2tDTnZBQzN1K1k1d0VMVmVJNGVC?=
 =?utf-8?B?RXFrWE9RZFBjVWZzWUNvdlV2NU9Ia3h3Mk1zcUFlVHJsRFZSRndoeHhieHNa?=
 =?utf-8?B?KzdJenRuMlppY3hHWEc5VnlYb1g5TjZURDgyTHV0QS95eWFuckk0bG5EZm00?=
 =?utf-8?B?dHJyTWErWU1mU2JIeUlsOTN3SzVNd1VxQVhiV2l4d1J1aUxVR0VsNlQzTlJt?=
 =?utf-8?B?VEFxVk5wekRWNExHc0l2VHFMblgvSlVYNk5vOEFGWEpQbVpNOEJQSHp6QUtH?=
 =?utf-8?B?R1h3SWRxOVR0cnlVRGZ2SzY4K0JlSkZjUDNrbzRaaVBXY25VQTdiV0JsWjFL?=
 =?utf-8?B?bzhpcWpiR2F6VzRJdFMrWDh3UGRhZkh0YXBOdDllVnFabU5UL05ZWmpyc2Fw?=
 =?utf-8?B?RVpjdUx1bEw2bHBEU1B2cXVEK2hIa29TQlhUazBZdktZeGY2RVBhRWlJdlBE?=
 =?utf-8?B?Vi9CWDMrdTZkRFE3aUgzaElhaVlUMEtDRHpPYzE3dlhuaUtVaHVCQkdYK0NE?=
 =?utf-8?B?RGxSUW52QVZkNXBGT29JU01EbXRSVk9Dd2NSeHhPNzhWc2JvT29YTmJtT21u?=
 =?utf-8?B?NnFNNndWd2NmTGQ4bUlFTThLWUhKMWNyVVdqZmVGZU1FbGw2VWh6TDRydXNE?=
 =?utf-8?B?RFFXZGtGa2Y3VnFaZmovVVR3UEtzdjBYNkpCWTQzN1g5ekU1OGhDSThVSWUw?=
 =?utf-8?B?NDVaYmVGckZzYlYvcVFCZXRwVHFEZFBabExHVG5rUTkwcE5XTy9uVlFOa01Q?=
 =?utf-8?B?OHpvTE1udnVIWmI5L1F5Ti9lYVBmQWM5UFV3TlJuaEsrTTAxUzBSeDZRYWlT?=
 =?utf-8?B?TFRSUlZxK2N4clVPMjFFZ2cwN2Y4OE1GU013b3A0emo0Wlh3Q2xraWFWbU9Y?=
 =?utf-8?B?YWtPNXBFd1JBMGhLdVYvY2oxQXdkVitvY21KN0pSYk16VUFIZU9pZm11SXFr?=
 =?utf-8?B?YjBsSDNPUmx2elltY0JGcDQvNGhjKzVBeWdBbGFuR1VpUzdDbU5QWGJ1WkNS?=
 =?utf-8?B?U1JMYzhUSGd3MVpaL1NyTmVmSzdoWU8vQkdTWXVNYnkxM2lxR3ErVVA0SXBq?=
 =?utf-8?B?Y003bG56WjNya0RwaGt5TlFlM1J6enVrTXR1ZkdVczQveGoxQ1lHRWxLWmwx?=
 =?utf-8?B?aHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b75f59-f971-4b69-fea1-08dde0f4f441
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:54:43.3159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGAv8IMc7XX3WBOjV7m4zEEF+hbOsFO8mZWB982Gz3ORqTpXlAD+h4wgMGOZvRvQvsibRuzm0pcZXWj+kSh1j+M8qy+Cel0vosvOtWVzrVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5951
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

On Thu, Aug 21, 2025 at 09:18:00AM -0700, Lucas De Marchi wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> This WA ensures GuC will restore the media MCFG registers at C6
> exit.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
> v2:
> - Enable only when PSMI is enabled
> v3 (Matt Atwood):
> - Fix wrong check for GRAPHICS_STEP() rather than MEDIA_STEP()
> ---
>  drivers/gpu/drm/xe/xe_guc.c        | 3 +++
>  drivers/gpu/drm/xe/xe_guc_fwif.h   | 1 +
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 883f700e532a7..37d06c51180cb 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -219,6 +219,9 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>  	if (XE_GT_WA(gt, 14018913170))
>  		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>  
> +	if (XE_GT_WA(gt, 16023683509))
> +		flags |= GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6;
> +
>  	return flags;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 400004f1838a0..0508f1064178e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -108,6 +108,7 @@ struct guc_update_exec_queue_policy {
>  #define   GUC_WA_RENDER_RST_RC6_EXIT	BIT(19)
>  #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
>  #define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
> +#define   GUC_WA_SAVE_RESTORE_MCFG_REG_AT_MC6	BIT(25)
>  
>  #define GUC_CTL_FEATURE			2
>  #define   GUC_CTL_ENABLE_SLPC		BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 303a5e05d9932..27cd19b98f8ea 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -72,6 +72,8 @@ no_media_l3	MEDIA_VERSION(3000)
>  		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
>  		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
> +16023683509	MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_psmi_enabled)
>  
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
> 
> -- 
> 2.50.1
> 
