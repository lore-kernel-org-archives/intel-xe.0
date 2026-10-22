Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ED3606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 04:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JP5JLz8o
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D289B10E2AB;
	Thu, 22 Oct 2026 04:40:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7A710E2AB
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792644008; x=1824180008;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4YKs8iMb1OUAq9ymWh9drji4iDn2gysYUMbDjgCVJ1w=;
 b=JP5JLz8oCLZJVrjtIvjuIQ43xrOB4leQNtUHZbrMNt7C4umuvsE4CI4l
 2KxAFwvJnv+mrOBmDMTwCEfQnBBaQkNhToVfjTOZN96lrlr3yympCR24E
 dchWOxlM8kdDIvp/+xIpy+e0NYqlDmLWcWV3AFmbn6hjRSEISqogeR2CY
 4TSl/NdbfFG6sPwaeuSPt2s7Plf5TJqLNVozRZbjC0Z7Z6m7uaEbGEQM6
 Zm6QD2Bjne92zX7/30vtB14gzKiPLY1zz8RvqZqZ+uTGEq5m4WFY/1RxP
 N2tc35M5GbxV7GdTmRpgNu9LER4cr0zlCskzp9TDGdHuyX2Wu9O/ZQYB5 Q==;
X-CSE-ConnectionGUID: AxtK+g47RNm3Fo/sGy6fJA==
X-CSE-MsgGUID: 6lxmrTqTTq2wXKxN127gcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1259164"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1259164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:40:07 -0700
X-CSE-ConnectionGUID: DIKKn/amR3SEt0Z7tQQ/Kg==
X-CSE-MsgGUID: RPxoB6ZXQ8uP8m+jVoz5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3327020"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 21:40:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 21:40:06 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 21:40:06 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 21:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxbV8OpPKft07NFmNgX0yuokIHt22r1YuK74LJZvBe1PWak/Fq/jALtqV6CdIqFqnJGV/2FQZGzkgDi2283/3CT4V1YmhfBEoEbfnVXwsWW9C/ECQlTDMgACSb43Y2WnX6tcxo/ngTRzMD0rKw3F9mk0KLg1ZJgzBmwObEQpO9oWJ6L9ZOQoZRTFeNkCChzalyTNSEjhGTMn81gIUtq04ccPe4AdQALOxtmneoC1gS3E1SyDQJb75fSoLzw/ATKLPpGExUW5UCQyhqJ/RL++CLxQULVOs4AGShRTMk6FgbLEnRIJ/iVRnrpfkc9v8RmI1mvCt7bjDOLOJW9YKevGVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEJc/X7yeCZrZ+Iouh/DLGMREupx2PMWm8d8O3ILJrg=;
 b=Qwg0tAlGn/ecoX1h2Nhg/JzCULBlJZfIuMuIJCDVj2w+7oFC0Sx2CXZpiXCT6dsQOVT1wWZY/PjJNkmIkUH53xoUHd3J+BbWWiUfSVgLkrVqZo4ywdi/iKpbVqwRNrbo7NFq5Fh7PG9BO9zIoDU0RmYNjeI5IOY4RMn+kaqOYWcFU9poWjt47l0Jue6g98SGtt9qg1rbfH6MTrcg7QKrv2FMWDVpW1URE58pN4h6Cogi6ECZbZUGb4ZtZ556CQx1YVBA1TnVWetWOFWEVMFBaIVYJEaq0WI74u3MMzgDio9PbenyiVVLvB8MsnjWsQaKfbPMcMoNibXODtipDvLF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH3PPFB8E59DF50.namprd11.prod.outlook.com (2603:10b6:518:1::d44)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 04:39:57 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::6021:79ca:45d2:ae46%4]) with mapi id 15.21.0472.016; Thu, 22 Oct 2026
 04:39:57 +0000
Message-ID: <c51e19af-aa41-491a-b1c9-07ba5ea17de6@intel.com>
Date: Thu, 22 Oct 2026 10:09:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 7/9] drm/xe/amc: Guard xe_amc_work() with runtime PM
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <michal.wajdeczko@intel.com>, <lukasz.laguna@intel.com>,
 <matthew.d.roper@intel.com>, <matthew.brost@intel.com>,
 <mallesh.koujalagi@intel.com>, <rodrigo.vivi@intel.com>
References: <20261020023641.200658-1-raag.jadav@intel.com>
 <20261020023641.200658-8-raag.jadav@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20261020023641.200658-8-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0302.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::19) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH3PPFB8E59DF50:EE_
X-MS-Office365-Filtering-Correlation-Id: 6012cd39-ddf6-4006-26ea-08df2ff68612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|10067099003|4143699003|261009223027099003|11063799006|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info: FxfFyTbxbjG4vJaa50pSboUldt3R3L3rVhsBISFfz5hCLj3jBH/6+lWTDp34jb+qunnbS1RUFZWzyACy02raPn/rmx2BCdz1xJTkamGjtY7rwkycz9RIUkvo7rggj9U5OUxp5xoZfdrsYLNfdJdwVbO9F0divgS5q/+sUmQtGTWvNO/oBbVZWGk4q7Vn4riBScbomirvp7avSrZRLSqVK38zYUNnEtnZKb9NwOIXMT7stsgaVIfH2ZYol5Wr/QpQqeFFlXRFkh0g4JpRSZo1tU9UTSKEPRvjkixlKj7AYQer1GnD3P3ymaUUO8pSoG2gbAalFuEZngopiX6MHTAtNyE+RRJSlJnbvMCqfavt0OmklUEigth9I76Xj7Pc9tGiHmargPLO3gwnGa9T+bKzLKBHBM1peA620JSWD8TaLG3PWFpy9qYzvGgshJvp4qB3SFD6jwCV+mROtov3TV6aIBftFwxWHpTaYq4jNpEMlXU6EeIh+eV3WocDTJ5meVBt9t1d0JXWkFiiNMI6bSGWrQAwQWvOqCRgh+S4f40T+d7qJpzwCpKT5HOG845ehPRxNxi1iu9a5MwZU/5pSI/GYoPksODefEhlRrF5d45AVvowdbSh/XLzv5SbYyiRdsuP10r+pZXkNy0rhB5bRRGaIdnQN36ik5vLh+h8bXrTao4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(4143699003)(261009223027099003)(11063799006)(261021121427099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGtiRGJYMVJobjNYaVFiMDJZS2tLdUVScUk5b3N2Mk1pSzd2Mm1TN25KTmhG?=
 =?utf-8?B?NFJ6MU5Ldm55S3NzdnpmSDRTV1lXOFZkQ0JrVnJCNDNkU0gyYVNvNlAzeEFl?=
 =?utf-8?B?bStLSlRpN0s3MHFlRUIrZUVSRHdCRWRiUnNqbUZSNiszWkpPQzNxNjUrV2NT?=
 =?utf-8?B?RDBna2ZxQUFrN2tKMDFBblQzWktEazd6Z3VDRExDT0VYUDlORkNzK2VnRi9l?=
 =?utf-8?B?blp1R1dFdnlkMERtVWJXa0p3ZDRGemdUS05SVlBmaU1kNFBKM2E2Y2EycmQv?=
 =?utf-8?B?dWgvVFZZNG9CWmVzeGhEYmVML3VFTDlHMVI0Q0JiYVoybXIvZzdKYno5b3Va?=
 =?utf-8?B?ZVcwWjRUOFAyWThBRDQ1dk5Sdk9QVURlZktLWXB2RVdJVjE5TEF5dkI2Wkh4?=
 =?utf-8?B?VGJJRHZVcTh4TXBLcll2UzJGNFdYTUpiMGJFRENKZlBNSFVLeTNtRzZ4NU1S?=
 =?utf-8?B?SjY2NlgvQzBHa0NlQlBkMm5tQ21UZG0zQWU1R3hlV0FqbDYyanVHOG51Y0Iz?=
 =?utf-8?B?c0NOMUJha3VWT1hnVnUxdHNPMFlUdXF6VXNINzh5eXB1YzhwcFlheDdHUU03?=
 =?utf-8?B?ZXlhVis4RXZaYUQxWlZwQjhmc01IakVLTk52ODN4YnlZUWIycXdiY1J6aURp?=
 =?utf-8?B?ZFNpM2kwRG5ZU09EdnJEdDRhU2V3ZTBMKzdTUVlJeExvUXUxbUxERG5JZ3Jm?=
 =?utf-8?B?clJOaWM3bTNqUTMrMVJ5aDJNYXN1czlqdDF5WEZnOWJibENQYTBvbmVtMWF5?=
 =?utf-8?B?Sk94Q1gvK3FaNmxTdkNOWDArQUoxbkRRcFptUlVnR01tNVNRMGFMR1lTVE5H?=
 =?utf-8?B?Kyt6d09hQzVZMWlNa3drcDZWd2NXbkFUZjFaR3FUZjlJa0tzSDQwNElrMHZX?=
 =?utf-8?B?SmQydFllRWFZNFZQcC9jMmxzQVFMVllBT1dCajhWSklyd2NaQ2l3YUZ0NjM5?=
 =?utf-8?B?RVVNQ3Z4VXRpWHJ3c0kwdUcvUFN2dkk3S2FNSTNoNGlHMkxHQW9QZ3BkSytp?=
 =?utf-8?B?UHZSNGY1L3Y2THVYWXhDTXRSZjJCNjJFQUllSy9jd3BZSm16aDhiUVdoekNk?=
 =?utf-8?B?UmpyT0lXenJDb3A5U09Rc21meXo4WHBoaGMzYXVuQ2NxclA0bUpOSWNtc3gw?=
 =?utf-8?B?UW12SkJyakxHazhZZmd6cWdBaUtYS3VESHpDSFFYN2UrZk56UHdCZ2ZyN0lX?=
 =?utf-8?B?U1lFclBjeC9BSW9Ka0RxZ0RjZXhCY1JjYXlFWjR0VVYrQThNeEZ0bUNpb2Ex?=
 =?utf-8?B?R1lqbmF5RDdmWmFvS2lmWUpPY2J2UmVRY0JGVGYzNGl1NjE2bG9RVzcvNmU4?=
 =?utf-8?B?TkEweVRSMExxZXBBbW1ZdHVUTExWQ29Vcy9RbHNSL1M1cG52bkVROUlDYUtt?=
 =?utf-8?B?cytpOGVlZUpxc084N1pTZ3UyM3h4RFdGaHhlVEZmWDVvdFlpZCtOb0RHNUVq?=
 =?utf-8?B?K0l1c3FpOHVYK1dkczM3Y2MzMTRleHBnRVlndUJrcklIVUptNmUxL2tONlV4?=
 =?utf-8?B?T1FBdnBhMHU5NndlRzZvb3FiRGw0U1pZWFV1M0JvZGhYd0NvSFlhZ3hJQmFv?=
 =?utf-8?B?d09BOE9hRWpkNm4wSVpqVFpxUVdUV1Z5Nkx4Vm5PcGFUaUtjVXJQMHpkbDdh?=
 =?utf-8?B?WGFiTDc5bFovRkY2SnZWYUVsWTBNV1ZhZnhSVHl1eEJKbTVqK3Y5VlNNcS8v?=
 =?utf-8?B?NVJSUEF2dHdndllrTFFFL2xRQklnZ1pIWGZWY08rUXp3dWxwVWxyaHN1UnVx?=
 =?utf-8?B?cjExby9aVkFNbHVOMWNkajg0UU9DRUg2YWtZUjBVUUVVdklldVpVNk1BaTVR?=
 =?utf-8?B?NllKTkxhdEtRKzFxbVBBUzNqcS8yYVhKM1R6WFRqVjE2b05EaTJhNnBZcmZU?=
 =?utf-8?B?WW5EaWNzL1R4VTJIUldVbmJxSjkwSUdOZ3lTTXRXaFZtZU5UeVNNK04wNk9x?=
 =?utf-8?B?czhPVU9KUzVNMDd3dllIWHZQNWREdHB4RlNoamNoak1aQTRYU29uTGh5dmtl?=
 =?utf-8?B?NmE2KzhxZ3R5US9OTnlkc3pFcm03aEpsTWFMRDJ2ZjhBRzBnOGJJR3o4UVhQ?=
 =?utf-8?B?SHptYnVGRndQNDZqMUlLK1JlMzRDcXlaVExad0MzTUVKS2tiZzJsZ255clNs?=
 =?utf-8?B?dnJ3eVE0ckUwQzZDOUpTYURmSHRQR1k3OXhncUo5VmZkMkJRcG5iQk54aEJx?=
 =?utf-8?B?ZFdTZVBNMXE0YThGbmtFbnRZcExNWXVZQm5ZeWszY3JHSWFxVzM5Wmx1ODYr?=
 =?utf-8?B?WXBSRmtselMyUkZMSUl0a096SGFTR1J1ZGRnczNGbmMrc0tDem5lNzg3RlR2?=
 =?utf-8?B?ZGFGV09VdzY0SjNyL2ptR0hyWmxNTDFYaXNKRVVDV0ZEUU9MZzhFUT09?=
X-Exchange-RoutingPolicyChecked: rnTQOu4rBm6+/6q3CzbiCYb9SzmOU/CyMB9zTEnK5HZQ6AXvlVXJ1g3V1afYI1wcIcX9d0f/yx+/3J+WHRICq7tNhEAzZczzMLfb0jR/e6GdkjoSjrvjQNXJOt6eIJsmMxe1XgOsQti0SJy0oF5nFH1DhZrIIPpDws3Tohie9f44mRV/m13JTB9JTaLh+9P7usPL+h6/qA1uG4fL7Rv4hsW2uT0flgY+0MTU9hR3F7pOr3PcPx6g7YqHo/DB73Z0vu6tIO1Qf5JBd0V/TW0F7a01bsCZOceumr0J9jrokHkvaPjecxy2A9zoXF0xd4peBV29v1hxFZliXNDT298CDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6012cd39-ddf6-4006-26ea-08df2ff68612
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 04:39:57.2786 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/yyFIltadiMgjTs1jtdlUX+VeEzrXisNW3TuF+HD6g0nBdsRp+dVqZCjqLY0TyNFZQ+t3aohCBfwR3eXBtk/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB8E59DF50
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 20-10-2026 08:06, Raag Jadav wrote:
> xe_device_declare_wedged() callers are expected to hold a runtime PM
> reference. Fix it.
>
> Fixes: a55b76b8bc2c ("drm/xe/i2c: Fix the interrupt handling")
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
> v10: Guard wedge callers with runtime PM (Sashiko)
> v11: Use traditional xe_pm_runtime_get/put() with goto (Sashiko)
> ---
>   drivers/gpu/drm/xe/xe_amc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index b7390a4ee3ce..1f85df598e56 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -15,9 +15,11 @@
>   #include "regs/xe_i2c_regs.h"
>   
>   #include "xe_amc.h"
> +#include "xe_any.h"
>   #include "xe_device.h"
>   #include "xe_i2c.h"
>   #include "xe_mmio.h"
> +#include "xe_pm.h"
>   
>   /**
>    * DOC: Add-In Management Controller (AMC)
> @@ -108,11 +110,14 @@ static void xe_amc_work(struct work_struct *work)
>   {
>   	const struct amc_request *request = &amc_get_alert_reason;
>   	struct xe_amc *amc = from_work(amc, work, work);
> +	struct xe_device *xe = xe_any_to_xe(amc->i2c->drm_dev);
>   	u8 alert_reason = AMC_ALERT_UNKNOWN;
>   	struct amc_response response;
>   	struct i2c_client *client;
>   	int ret;
>   
> +	xe_pm_runtime_get(xe);

Even though Sashiko did complain about guard.
Wouldn't usage of guard maintain consistency and be better here?

With or without guard
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> +
>   	client = amc->i2c->client[XE_I2C_CLIENT_AMC];
>   	if (IS_ERR_OR_NULL(client))
>   		goto out_reassert_interrupt;
> @@ -167,6 +172,8 @@ static void xe_amc_work(struct work_struct *work)
>   		dev_warn(amc->i2c->drm_dev, "unknown AMC alert: %d\n", alert_reason);
>   		break;
>   	}
> +
> +	xe_pm_runtime_put(xe);
>   }
>   
>   void xe_amc_handle_alert(struct xe_i2c *i2c)
