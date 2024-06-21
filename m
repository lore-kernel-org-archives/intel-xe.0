Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86609C2BB85
	for <intel-xe@archiver.kernel.org>; Fri, 21 Jun 2024 18:32:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC9910E04D;
	Fri, 21 Jun 2024 18:32:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpOUmCrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C5A10E064
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Jun 2024 18:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718994748; x=1750530748;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=XCyIq42gA+a4EfbCpw4erWLKoAatAvYDWN0T2FOb8XU=;
 b=WpOUmCrHxAcVe8rkN+209yfJTmKfSmbL4lZy4ILTCU/10k9wr7bfIqJG
 DYw5yyfY/+/KGZRb9deQKRzKHV1nXSQrBYmvSBGM09/+Cmw+rjPtAolO4
 ecJwiB0EcBQuMiptYEtmcKPU7nay3PRogYBa1qYN5CNljFUhMiVQ5Umsi
 r/I3bMD8nZStada4PHUDZA2OmjERXnKYcBM7ph2ktRDwHURRGFMS3jx+e
 6VTmk7TGTgYqARU6ZvS/yPG9yFAw5N7VTL3w3/Cuu+1NW/wFDI6E9O3sV
 X3wGs1M7U/u19t+Y415cpAcKBU+MbGwArir5Cjhb/M3KWWfNxBDgqflJg g==;
X-CSE-ConnectionGUID: lowHKCNqQ26pBMCeAWPKBQ==
X-CSE-MsgGUID: pDtNLQHLS1W6bL26jAA6Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19853752"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="19853752"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 11:32:27 -0700
X-CSE-ConnectionGUID: sXbJXrNoSFey9daKy9nl1A==
X-CSE-MsgGUID: 1xMNtbHEQzOiWiNwxWOxfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; d="scan'208";a="42772841"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jun 2024 11:32:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 11:32:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 11:32:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 11:32:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fhka50bYbNr2E0TII2MfYlp/VCplYpxJ774towXcJO/fMNJUkkWdnpMfaCGYvIJCzTvRtZdu8ohT7n0u4cCYFgkVvdmGqT0g1MFVRVjGrktYw0WIwEuiiNzF/BwG7bbFsoUJlJ2uU7C3YlxmIeSTgSJqd1sSGe4HZW/GNnPXpwPkeUXXrKQj2U22kXyY/vqiHLBLk1LFmigJvlQW2WPJ97Zg+IhFhmznH/N7x0JA6GcUOEN4T7ERm+DInR4+32nSOXvJAn8Zg7yvxk5y4PnDDFN80f+Cdfu4rPkACQyqc8W9cACHfxsiR4SAK7eXr00xIX6qVH7FgMpSv0tE9VlZgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEBqvgSOnA7L6uud3B3m+nafMtErM9aI22dp+tRiWbs=;
 b=F61uU/k3GXMl81n9ICkXrftsK3C8ZMbzTd9/a5iNYVdCQn6vOWn3LLNk13AIUKCd+Ctj1kyoA+1TJ7t6VAMQES+TpzaK7f9xnh8jMS+s5n85x0GFwUuKzT62o6ovTtuEQkTdTBLF7JmOBdagZRJR8ZkyFzHdq4kB309Y2nmojJZvJDFPfVPqv6vURLXF9uWf5dKTuU2DxES/71g6cor4RtYWtDJiq05RIa5Z3njiAo8OUQySKAMD3hC8wbTxrWf+zXLE8jeeg4Br4wS+n6v97PsQxPW+kEr2cFnTIdARZc4zV7jh/mbYSBYogd8JyTY3pGE796kufcPyhbvUQvuleA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.22; Fri, 21 Jun
 2024 18:32:23 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 18:32:23 +0000
Date: Fri, 21 Jun 2024 11:32:20 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, Riana Tauro
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <krishnaiah.bommu@intel.com>
Subject: Re: [PATCH v9 0/2] drm/xe/pmu: Enable PMU interface
Message-ID: <ZnXHNCQcKimE06ar@orsosgc001>
References: <20240613100411.1579218-1-riana.tauro@intel.com>
 <878qz8u1on.wl-ashutosh.dixit@intel.com>
 <af6df0d8-bafa-4fd5-a747-ff9e3092c3c6@intel.com>
 <875xubtu61.wl-ashutosh.dixit@intel.com>
 <ZnR/uGMcxOETqhsm@orsosgc001>
 <25d256e1-ce8f-41f4-b010-ca28b5eef557@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25d256e1-ce8f-41f4-b010-ca28b5eef557@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3c5322-cfc6-4421-77b5-08dc92207dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjV6N01vbTA0K0x0TXoweDFEcDdtRzdJZ0N6S2R1NzhVbTFVb0F6OGM3RFV3?=
 =?utf-8?B?UERiNkdlN3MrcVBhRjNkNzZPbGUva1JMbUZ1QXlpU2FvRUFOTU5WcHg1ZHBs?=
 =?utf-8?B?UmhURVRwQW9FVHBTU2FqRlNieEw0dFpwS0h0dVJBbDF0NHc3VzE4WXpWVWtX?=
 =?utf-8?B?VWlxSmhmL0xFNkF2NlN4aUxkWXV1MXRJU21DSGdXMTlOSnh4ZGduZ3pSNmpU?=
 =?utf-8?B?QU9xY1E4YXF2ZTJtMDd3R0laZ3NLRVJ5TnNib2RMeXVSR0ZtaG1URk1hR2hY?=
 =?utf-8?B?eDRtaGJOY05rbS9mTjg1OWNqL2IxTWR0RGd1TnNuc3BvT281bGZaRXBsNTVO?=
 =?utf-8?B?em8rU0tUb2gxNHR5RmExYk5lYmJGNkFIRmZ5dTdNc2dReXlUK3F4MWZyUUkr?=
 =?utf-8?B?bnRVdGVZdFZraEl0N2ZXSk1KaTl0UTUwbE50NkpmQVNKb2w1dGhMOHppcnpr?=
 =?utf-8?B?NmZncGpUOXFJMjgrMlVZYytpOWVXYXBIQlljU3hDR1lwUWlHODBPZ0RGbGJr?=
 =?utf-8?B?azQ1YmlndUxseTZwTzBpSXZ0ZThUZlZ0UDg0TmRvWVdBejNrb2hjMSt4cmhB?=
 =?utf-8?B?dDZoQVBCNmRnK1NZaTlGa0FDYm5VelQyVGlxaWpOcUlNNERweUVTcmY5ZVRO?=
 =?utf-8?B?TEs2UEs2aDdSbXlCSWp6TCtkdWdoam5DWTJKQTl4d1gvaHk0aVIxZXNDbHky?=
 =?utf-8?B?Vy95bGM4SGF4ZWJiT2xDQTZKT3BBcE9mdlJCdlV3eURBQ2lTZzVkZUhOWjIv?=
 =?utf-8?B?TGlQaStNNzQvMmVoeklGNk9UZm0wSFZFVVh2bWx5Umw0MFphRkNkcHBJRlV2?=
 =?utf-8?B?OXMwK2x5R2pSUm40Y0tRRWZGdXRpQ0czaTlCdHAyQyttNDRGRFllcEhwejlY?=
 =?utf-8?B?UTdHNkpCYzlaM0dsdFNrVWlXSVBCV0xXOXVrelVieDU3RTk5KzMyQnlSVVo1?=
 =?utf-8?B?ZVUxZXJUR3J0WVZTWWE5SWYyVjdZa1d1c1B0WDZSSFFVM0M1VkhQeTZrbVkw?=
 =?utf-8?B?eWxjRFVLUjNKWnA0SFlhSG5KY2huNHNCRnBBejRwUGVUK25lSmxkdEVUNVdY?=
 =?utf-8?B?cGl6V1pKRGRCVGVoeHlLSUthWnFTYWRMa0FNZHBSbzRnZTBrTkV2Zk9YWUNQ?=
 =?utf-8?B?UXVSYTZpSG9qSjd5RnN1NERzNWk3cmxtZHY4V1o3aW1YT3RlN0dPbGlncUZq?=
 =?utf-8?B?RDRuWW5jY2tWK3pKa3pqa0gxcWZqSmNXYzNjdlIybHNsVUN0SDVBUFNkS0p3?=
 =?utf-8?B?VkVCdDhBbmozSmNYZ2U5STZqK3I3TzR2N0hja2o5ZWJ6UGF3eng0WE1HR1BS?=
 =?utf-8?B?Vi9mMGtUdmZST3BTRUkyVVo2cDhHY1RMUVFKbjN3QUdZb1pROXYwdG9lc1hZ?=
 =?utf-8?B?enR3MmFPQlFDaEk3Q3ZRcnBIdUxUTjRhMml6NXYyUlY0ZE1qNVBCclMxUXIz?=
 =?utf-8?B?K09EMEFYb1ZzTW5PMWNlZjFLMkN5ZEQvQ3pXaW1HMFFEcjVQTGhMdFNzcWdZ?=
 =?utf-8?B?Nld1Kzh0NFZtLzJqbHBubnlHWXowRkl3THR1VnVuL3NJL1hFNjdXcGNOTGl0?=
 =?utf-8?B?cUxjZlh0NkxPQTlWR0d3T3FwTXZnQ2VFcWFQUlFBdkJPdytJV0RTNXpTNytq?=
 =?utf-8?B?d3RrMHFhZUhOUXh5NnFKcEdVdWlNRDhwRGJybGxtM0NucTgrRUNjWFIyMURN?=
 =?utf-8?Q?16h4/s7yofXI19sfEzyY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(366013)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0xwdmJNRGNhbGF6UG0wVCtrTUloeGN4SW5oOW95NlRKUnl2a2VHZjNleUc0?=
 =?utf-8?B?dlpzRWlQMFV5eXBjZ1orZDdWNzRBblFJN3A2MjREMWhVbkExT0NqMXZnN3dy?=
 =?utf-8?B?YnJqWnB4V0c1M3RlTkswdEs4RmluYkl4aG5KbnRBSnAzY3VPVjRDNEJZNGRJ?=
 =?utf-8?B?cXZ1N20vVUd5YlZ3bmM0UkZrOHZ4M0FWZnBXQ0s2TUlJQUV5c3NVM00wdTdE?=
 =?utf-8?B?SHd5a0VhZFJqaE5xUERwL1NSdTlSd2ZKemZXbnZQUExSL2dpaXkzMUNDSE1n?=
 =?utf-8?B?M3BWSDhHd3U4T081WFE5SFN2aEZ6ODFaYk5kK2gxa0NmRkhzY29kWTVNUlVC?=
 =?utf-8?B?OEJ3VngyUVp4cEsrRW11S0s4TStkandJd2lOYjZ2aHRCYnFXaE5GSE1NdGVx?=
 =?utf-8?B?K1RKTXhzWG5Mc0srTVpKcDliSXpOcGsvckwvWlVOOVliVUkrWkZxOE1rYlFH?=
 =?utf-8?B?dUZobDM3M0hKZkVMVktzTThTc2pvT3FzV0xoMW01Q0h0dDVJbHJwN0x2ZDRi?=
 =?utf-8?B?aGN0TktjZnZtb2tPRmU1WUxYSDY4OXNrNTU2UEtkMjB4MkI4WEl2MG92aVVj?=
 =?utf-8?B?WmdsN20wSlBTNWZsMGlObU44VHRhb01lYVNMM28yaEZsL3RrVGI4WnMzcmFB?=
 =?utf-8?B?WEE5SFFBK3NCMUlIWjBpMnEzT25tNXVyc1UwWXpUbzVqejBoUmpRK1FNcXlm?=
 =?utf-8?B?bHF6ZDlvN3JqZ3JHZ05PK2Z5dWhzVmlRMkJScitTbVNBUmE5OFBNd24wSWUw?=
 =?utf-8?B?c2ZTZG5FdjVBUGx2Qys4OTFPZUhva3hLYUJyczFrS2gzV3Q4OTRpY0NvZ0Qv?=
 =?utf-8?B?Q2MvRTVVNHBER0RjZFN4SlpUSUxoWlZQR2x3TVFnVy9XdGJwdTFvTlgzUVJk?=
 =?utf-8?B?UytiQWJXZFNPWXZPZEROTWVPaElydW5QKzJTMGJSTjVXa2hKMzF4TFVJbDM2?=
 =?utf-8?B?Wm9ubDZSM0FTQ09EcC9MamFUQzVhY1RocW5penRIaUVjSWR6aGlnZTJNV0Rm?=
 =?utf-8?B?Nzd0U1MvUitSc0hSWG1ZSVNtdS84cUREL3IrVW1leGk5eURra0o4WjA3clUx?=
 =?utf-8?B?UmtFbnMydmpZRyt0RFNVdzZMaU5aV04rbkFtMnZMT2RDYmNFdHpWMVlSb0RQ?=
 =?utf-8?B?RVU1eTRFV1FUclh2T0FYeE9CQnFIc3BkM1c1SW9FRm1FdUFodUhYUnlZRjVJ?=
 =?utf-8?B?YkM2T3VzckJxWG9pTXl1aUYxdHNMOGhMZG5meElFbWJueTc5ZGFYNXVjNkdw?=
 =?utf-8?B?RjRVbXlyMnI0S3BRZXVDczBCbzlwOVVyTTFUNEFNU1FQUnUrT1QxZFpwakRh?=
 =?utf-8?B?YVc0ZDlidXJCUndzbzV0WlozVkZHS3JyVE4vZmMwak80UVJlZTV2NnhaUTYy?=
 =?utf-8?B?RU4yNUw0alFxUmZlTVRna1VaOWJHeUZWb3RwLy9oZDBCVEtRWTJ2NG94cDVj?=
 =?utf-8?B?MmlPNnNHSTBhclNBb2VTeDR0YjBDWFcvYmJxL0dYOEJsV2RjbkdUL3V1bDBZ?=
 =?utf-8?B?RmluMGVFSERib2ZzbEhKc3JhMUUxLzkxMFF1aHFKKzc5NG5FUW55a293NXJI?=
 =?utf-8?B?dUpLVWVtRU0zaE9RMnVaT2c1OExaajh2OFJMUWNzcHVhTGxtMWpmYkNCTThQ?=
 =?utf-8?B?aXAzbXBGbFBEc2VXT2Q1QldXZFl6UWc3bE5DNVlSUGFYTDBlMDdWQmN1Yjd2?=
 =?utf-8?B?cVFiZmYxRDBGS2h4QzI5NEMwVnNnTG5Mc1Y3cHI0azZXNkhaM0YvQTVESjNO?=
 =?utf-8?B?M05VcFk4dDBCVjVBbCtwZ3lMd2k3Q2JRUmxWRlp4UEM1N2NPWnFRNVRqVUE0?=
 =?utf-8?B?djNwWWc3Nkd6aytINmlPeFRxeGpwTjBmbllyRnhId0NvZDNMMnZva1Rmdm0v?=
 =?utf-8?B?SXd4YWVZdU5tMk5DQ1R3SmE3a0JFN3B2L0hTQ0Y5WXFqcVlHRDJsSmVlS05T?=
 =?utf-8?B?ZjBVOXZUYldXSENDY25GaEFuVmIzRmh0SzNMVGE1T0JCRUt6Y1BPcUcxN2FZ?=
 =?utf-8?B?VXpoTklPSyszZ09WNzNna0E1OWxmY3Nia2FZTDVhdzhkRkN3cmViVndtQnhj?=
 =?utf-8?B?cW9JM21YQ0NucXl5U2tucmh6UWhMcG0vZG9KbitMYkp3WGh6bUgxVWFsVnZx?=
 =?utf-8?B?UWtuRUdxRXhQRkF6S2FWNEF5dmhseHcwUnFkQ21BNnB2eExkenFsczdJUGNm?=
 =?utf-8?Q?kINngCw/usbi6zXv83KVRfE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3c5322-cfc6-4421-77b5-08dc92207dec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 18:32:23.0814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3aFC2w62oaigp02F+hqNeub0KSZRX1ALso+5KjBkCUzefkCjMwP22DVANovq+9KG2jS3Vm/FDR3HSSQiCw4KlYC9WaisUOitfX+NKDCMY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
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

On Fri, Jun 21, 2024 at 09:59:11AM +0530, Aravind Iddamsetty wrote:
>
>On 21/06/24 00:45, Umesh Nerlige Ramappa wrote:
>> On Fri, Jun 14, 2024 at 08:34:30AM -0700, Dixit, Ashutosh wrote:
>>> On Thu, 13 Jun 2024 22:50:39 -0700, Riana Tauro wrote:
>>>>
>>>> Hi Ashutosh
>>>>
>>>> On 6/14/2024 12:09 AM, Dixit, Ashutosh wrote:
>>>> > On Thu, 13 Jun 2024 03:04:09 -0700, Riana Tauro wrote:
>>>> >>
>>>> >
>>>> > Hi Riana,
>>>> >
>>>> >> There are a set of engine group busyness counters provided by HW which are
>>>> >> perfect fit to be exposed via PMU perf events.
>>>> >>
>>>> >> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>>> >>
>>>> >> events can be listed using:
>>>> >> perf list
>>>> >>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>>> >>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>>> >>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>>> >>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>>> >
>>>> > PMU patches merged previously were dropped in 90a8b23f9b85 ("drm/xe/pmu:
>>>> > Remove PMU from Xe till uapi is finalized") because PMU uapi was expected
>>>> > to change. Why are we re-posting these old patches again now, without
>>>> > including the planned uapi changes?
>>>>
>>>> The uapi changes were dropped and there are no other upcoming changes for
>>>> Group busyness. So re-posted the old series.
>>>
>>> What happened to VF busyness (which is why I thought the uapi was going to
>>> change)?
>>
>> There are no plans to support group busyness from a VF, so we are just exporting group busyness to maintain parity with i915 for Native/PF behavior. The only change would be to expose the counters in ticks rather than ns. I still have to look at this series to see if that's happening.
>
>how will the counter ticks be used to get the busyness in time

There will be no concept of "busyness in time units". User would just 
take 2 samples and calculate busyness as a percentage. The counters will 
be unitless. More info on equation here:
https://spec.oneapi.io/level-zero/1.9.3/sysman/api.html#_CPPv418zes_engine_stats_t

Percent utilization is calculated by taking two snapshots (s1, s2) and 
using the equation:

util = (s2.activeTime - s1.activeTime) / (s2.timestamp - s1.timestamp)

Note that zesEngineGetActivity is used to get single as well as group 
engine busyness from the KMD.

For single engine busyness, KMD will get the information from GuC and 
that would be a pair of counters - ActiveTicks and TotalActiveTicks 
corresponding to activeTime and timestamp in the above equation.

For group engine busyness, we should follow the same semantics.

Regards,
Umesh

>
>Regards,
>Aravind.
>>
>> Regards,
>> Umesh
>>>
>>>>
>>>> Thanks,
>>>> Riana
>>>> >
>>>> > Thanks.
>>>> > --
>>>> > Ashutosh
