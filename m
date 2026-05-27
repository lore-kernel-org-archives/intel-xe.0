Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AE7CD5BD0
	for <intel-xe@archiver.kernel.org>; Wed, 27 May 2026 23:23:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA41F10EAA8;
	Wed, 27 May 2026 23:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbeQ2fkq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1210EAA8
 for <intel-xe@lists.freedesktop.org>; Wed, 27 May 2026 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779924231; x=1811460231;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z0WmCnBJMxqBzmOaB67OLL+xtCbGfpgbMeAkdvm7MN0=;
 b=nbeQ2fkqukERBrJg/SrWGIy2Ljm+JqeBTkcrHv5W3peBfGN0vOOMLZiW
 N19ehdhvy36hOCOH6un0IdyAm2tPbjhJmIBpSvqBNNnPJXmDY6qS13zIG
 29UP3pSifWJO0X3kaknZdfEN/yHduM4GwoFxumUjWZI9dhUX+b5mZ5PPl
 KeYdFoXVM6iKN4fRV8b8RA+bBIYIASFJyeol8hVKt3ouuC+mOLGVtv5vb
 AHdwMYgWlLgdK5C5181vxw0LIZenNAl4E91q/rvHrCOQQR8FGR/5O6DMN
 4mk7vYfuOlHafhB8u51xy4WCcld74cKRyVi8+cRgrgb9yaoACHrTTnRmO Q==;
X-CSE-ConnectionGUID: 4B5iPcNcQtm8+VcYQmkU7g==
X-CSE-MsgGUID: WovbYawYTWeTNobcq3Igow==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80493007"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80493007"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 16:23:50 -0700
X-CSE-ConnectionGUID: +2bE3Rb4R2aOXrpmQH1RdA==
X-CSE-MsgGUID: VKudOWNiRq+MuBD370fQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="241346170"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 16:23:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 16:23:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 27 May 2026 16:23:49 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 27 May 2026 16:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QlQQ+/ZKuGNwcbL8fuMoaNOSF8JygOjm0Ej+J5oSrkKkFpyZ7ZWpdNPSX13xBXe27yQDQm6jHb8aqtsjDOqvS5IYc1OBnH1qFjqfvwNlX/1UuMxl3rtIul63WAAC5HDkPENxH9O77d9zZ/9vLSQC7MCrfQyxiLQY5mQRLOlrBvKvuiRli3h1b9glT/JHtH7erLYWAD64KMwDf7shw5D6LoQPD691HuAlg8o62BojJzj3/aOI2SXXFbp79IPNKsrR6pHOMWIayTozGhmlLJ35PTtu4BN+RIAWReK2y41cTU7DXZ2HI95TEMLUHe7Qh/4YUfNPFo9fR5dBdgF708JpQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYgUdjDGU2omJD9usJJAhSi/GIylvvz0qf8V4mc4/Lc=;
 b=mZWT9VMs3TdKsiDSPYBYGRUIhZRE2mBESlPSqOEX1riQM0PeeQ5N9Kmr59bqzuuZeh5U+grfSssPgHRWEn8WrI3Se22bLuNaogbHSFPohY0eXglrGql9zJuV7y4YzDNEtLKILscjVX9Re3w7OfCOKaEMMVIRGH0qakRNxxh9yR31YyT+8q2n4GrMYq6WowqH5AJd3H4QeTDSO2UxyHawArxzhJK4DJktehQisSszjv7Sxons9L1NDRTfrXV+UXZd+GKCZs6TiJ7vQgf5v6qtaxAM/lgekyzeY59eDHKW5+Fhq9oUwF9XNmkB9aRGedL3Nhb5QCM+t5wwrLbnsasNvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 23:23:45 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 23:23:45 +0000
Message-ID: <24aa5891-2445-4b17-b803-58b9556b9fad@intel.com>
Date: Wed, 27 May 2026 16:23:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] drm/xe/guc_submit: Introduce
 guc_exec_queue_reinit()
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>, <dev@lankhorst.se>,
 <jani.nikula@intel.com>, <lukasz.laguna@intel.com>, <zhanjun.dong@intel.com>, 
 <lukas@wunner.de>, <badal.nilawar@intel.com>
References: <20260516093131.27442-1-raag.jadav@intel.com>
 <20260516093131.27442-3-raag.jadav@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260516093131.27442-3-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0279.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::14) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 2500e218-5d93-4a2c-2224-08debc46ff8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: U6rthcZONS89xvNCGShFeYzMLPPIl6M+1EP9i3lleKOpCJWFWBtdKYJIMSqCgzIueAD6aWv1MoSRZecDWRE3YCJsCP/qDozxEvN1VX71HgaLdL7/vec17ogcT2Xp/CZuxF9ZY6BpsPMZVDvI1OxF+C6P4egMgi0SYw7i5BuNyNroGg9leOcvKgJviGL8+tR90XrrWha3bQ1rMz3lqVpKk0fnM9hyxZ8OlUPdyPfTD6P8DsyG/xFm5sLzIyH3oEN5h9exCgj4wGeTBMzfU2tueHAofhUFHyiun0cwIbXcQsCq3Q+IWHV1dWYQ2FKxyUTDH7c7dMPxaQLxaP2CXjMUkZGJquMoHyuaK5bxsf5/LE+wKDFIwMvNJvE0UQuwIFPPJDF/NHDfhBT3+Uc4VvKtdXqvo8D1lLO2Rp78jPJndYs/M4AdvLyihs40gbvEhcSmDEzWLKaCHm80uiCLZwpHQ9ARrGzNNU/W1JF0rAckvCzkrzH3KSOTdOKehwj0ZOz1Gnk2UlHc8aGhGb6dBtorSRa2NYtXb5tJM/mLMAElGPajTVF6SZpjvoDLSfQ9VGyHhLLhtPMS3d1BN9uy+yh8i0wZ/qWEOXC1RM3twEy6QDkSOHV7gj+NNpg4Xl/ZSq2Rqzw8ae6TGfWeL1Inq6Oy9tU9XtpOCs+s4lSjQ846OhEz90EsKxS9dJTFqiTV1Ljn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDlBVGZqQ0NEQ2NxUWl4RkJjd2JsT3p3Qm5uWnF3dis0dGtNck05eHdYM1BF?=
 =?utf-8?B?K3lWTk5sR21XNEVHeDl5Q3FHWXRONTZLcnp1MlRqOVo4Vms5OTJSY1gyM2Vp?=
 =?utf-8?B?c3E1bVBidER5eUxiUW9FYXQwdlNldlluYkVMK1YyWkVhaTFNZSs2WW1UY3FG?=
 =?utf-8?B?OEFkQmt0UFEvb1dtenZhbEg3aEVWQlNSV3NzOUpVdlJaNk43ZE9oL2lCRXN6?=
 =?utf-8?B?WU1JWG1GUUJKNk1IVWZ6VDl6ZnppaWtha1Z4dG5uUkpTYUFsTVhkeXNlUXZG?=
 =?utf-8?B?c0FVWkhkcndzaS8zN0NjTTN6RW9iVE1MV2dkdkhsQ2tSYnVxVWo0UjhTZTRa?=
 =?utf-8?B?bjdEZTZRcnRHRkIvNXlyanJYTUFXaU1NdG43KzZPdDdFY2RCb20xaE00QTR2?=
 =?utf-8?B?UGRxdmlEV1ptMEhMSFMzRHI5Sm5QZEdQUlRXcE1zdFhQSVZBY3hJVEhaWVgr?=
 =?utf-8?B?a3pUeE9vRWt5M09NYUczblhZMXV4UC9BekJZMlhwTkNSYjlsaVU1azJ0b1Yv?=
 =?utf-8?B?OCtkSUZFVWRLT2ExN0ZiWlB3Q2h1dTh3VHUvZjBydVp0d0kvUlhSYWxmWndv?=
 =?utf-8?B?NXJsekowZnRLK011clNyWmpmSkR6SVUwR08reTg3dEtSaE15ckE3Z0dTd3R4?=
 =?utf-8?B?TTMvbVczVURVYjRwZ2hiWVlFa1Y2ZFdFbGRmY3hMcFc2cUNNVWtFbk5yZUlS?=
 =?utf-8?B?blZBVzZ2MGw2ZTczYkxrSUFnTUVtaHNDN1dsN3NiN3daRnRPM3JZclB4Nytt?=
 =?utf-8?B?eXNsVmg4WHFnOHU3bnJIYUJqZGVPME00OFdaSEJIaVQ5d3FZSlo5T256UUlL?=
 =?utf-8?B?U09oZTZZRkR2MUJqMmdIWHZnWHJabGxUd0xsUEs2ZVNjMHFGN05yM1FwYnN0?=
 =?utf-8?B?NmtYbHZDU05PQnZUUFc3cDg3UWZ0RW1XcmhyQUkycTg2LytESXZsOGdRcEVT?=
 =?utf-8?B?ZDB2clg5RGFmQWx4OVExWTBRTW13TiszajhuazdKOTdHdGRaL3RaL1kxdFp0?=
 =?utf-8?B?NkRkRm1CbmpxWDlWbEd5T2I3TWZ4RDgxQ1NTVmlNYldwbTlFM1pLZHR0aWts?=
 =?utf-8?B?Q3IwRlZucDRZSkxMNmhtYkJ0TzNJaG16Nzg0VktZS2FWS25iU3hKbmRrdlpW?=
 =?utf-8?B?K3dMWmVlRHBQMnRDSWJra25KbDA4dDNqWnlEUnVtZlFtc2k3VktDeURlYW9r?=
 =?utf-8?B?akhocDlqZ0VCWHI1U2Urc0hhMHFFYi81WXZ5S0N6bHduTVl2WnNoTHh3WTJ5?=
 =?utf-8?B?b1Q4WFd3YWhDTzdSeVlrODd4WTE2NWN6Z2dsOFJPamVmQTRTSFJpcFhkTkxm?=
 =?utf-8?B?WHZ4bCtkZ3JlVE9NQ0trZ1c1NzR1dElIQjZ5eDc1U2FvcDVZdUVlVWc5NERE?=
 =?utf-8?B?SGxtdE5EL0dKVjlXT2I1L05pYmltTVg1NzZiZlo5VWJaTUx0MCtMTFI1TGMr?=
 =?utf-8?B?S0dDZ3AycHM5N1ZzUGlRTERtMVhXSy8xRExXbWh3MmJONE1reWFNRDRTQVI3?=
 =?utf-8?B?dW9ETjVzNEFYbUxEUXVqUHEreG8zaWdiNEZWNVRaYUxDWnVKOTIxbVZPK3FY?=
 =?utf-8?B?SlQwMVBvVkF1clFFRjR2cENPUVNoUFVYZlNvaXZRNFVkTWRCRWZ6UUd4OW8w?=
 =?utf-8?B?MUthR0dUN0tQQlFvTDJTV0dDS0dEQTlyQmxoQ2Y1cHQ2aDB1TGpTcW53UjBh?=
 =?utf-8?B?YTBDNzFMZ1N6ZlpmY1FaaGs3ZUxhN1pqM2RpZUZ4c0Erc2hzVTcvNFJvbzg5?=
 =?utf-8?B?MkpXR3hROTVqc2dqUjBTUXBDZWh4cHdRZWlqd2JnQ0Z3RWdrclpadjNzaGtZ?=
 =?utf-8?B?UkZEU1F4WHU1WFpTeVVmcjVrTHRHRnRVMG1nV0ZSeExxY0p5cnBaN3Fpb1gy?=
 =?utf-8?B?TWRTUkhzcFVueUtsR040K3FDZWIwajhCMVR2UXdWZWpJZ0NrM0pkTm9Ta2Z6?=
 =?utf-8?B?YVd3OURGMEJGSnBjVEZTbS9aS25DUjZxS1U3UFhnUU0zNkRyaHZFTzRuNHJj?=
 =?utf-8?B?ZmVGWE5ZaXFBcGxvOVB5S2dxcXdFM1FPNTJVSFdsRWNSRlhCTUJkTitZM29C?=
 =?utf-8?B?OFN0cnhOOFhCNHUzOHRqck1EV2U4dnJlOGgwZjhISGEwcisvQWMvMUJiRFBQ?=
 =?utf-8?B?UGU5UFpZQ3VXTWsvaFVrWXRBa0R4OVd5ZWVZWk9iVXVYdnNoVTlGV2haL0pH?=
 =?utf-8?B?bEg3OWpMZ0lqSVFFYVlFWk9raTJYYW41dndHM0I2UW1DOFMyTkc1T0x3b1hu?=
 =?utf-8?B?UTI2WU9McVlKVmc4Wm42Y0ZobjlzRlJ5U21rMTh0ODg4eTZ4MEg0akZsNENm?=
 =?utf-8?B?NVFwT3UzcHhXV1J2N2VrY201eTJqT1pZdHpDMnAxVVFvY0c2aDNVMjNmUEdG?=
 =?utf-8?Q?pOBhifuOIFSyjHLM=3D?=
X-Exchange-RoutingPolicyChecked: LR9+O0OQqQ9q+cG+o7p0ccOyql5yVhFYB+iVV/V/R9Fk2Wul3f2IlmmqN3jguWoGw94Ic9UcfJSfjiSaSspcnrdim6Etla7ucJRocWwpytBYVtLne8XYRTE5/1QNSVGBO8UdANEySo8bjSkHpGf3WNXfxcmYdmFQpmkE/AOl+MMdyiPBKTnV+EYu+LTDKGoOZg7ABHCX/jrO2Xi8RBCJe9oN7ENc/XPzO+8FvOQBFmwRkjYrl4f+LfHYszR271sBCYfEg6sUlmIByLl1rSnDI3qOVtb++M4oyP/FMNlFs1ZR7SU/9O19E3iHLdkDoLHG6wPtCYhbuUObldHhv941+A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2500e218-5d93-4a2c-2224-08debc46ff8d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 23:23:45.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FIA0+Vxw5NHS/LDJOIAXIDb/syvcfjmOv2n5F+bwm/EO7oBhbzJJW1jWU3AdegWs5ameoVyX2EpKA+Y1JM4uL7Krhhy25OuvLYgr9+Atfe0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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



On 5/16/2026 2:31 AM, Raag Jadav wrote:
> In preparation of usecases which require re-initializing GuC submission
> after PCIe FLR, introduce guc_exec_queue_reinit() helper. This will restore
> exec queues which might have been killed before PCIe FLR.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Tested-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
> ---
>   drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>   drivers/gpu/drm/xe/xe_execlist.c         |  6 ++++++
>   drivers/gpu/drm/xe/xe_gpu_scheduler.h    |  5 +++++
>   drivers/gpu/drm/xe/xe_guc_submit.c       | 13 +++++++++++++
>   4 files changed, 26 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 2f5ccf294675..f1e45e8f30e7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -274,6 +274,8 @@ struct xe_exec_queue {
>   struct xe_exec_queue_ops {
>   	/** @init: Initialize exec queue for submission backend */
>   	int (*init)(struct xe_exec_queue *q);
> +	/** @reinit: Re-initialize exec queue for submission backend */

AFAIU this is limited to kernel-owned queues, so IMO we should reflect 
that in the name (and add an assert in the implementation)

> +	void (*reinit)(struct xe_exec_queue *q);
>   	/** @kill: Kill inflight submissions for backend */
>   	void (*kill)(struct xe_exec_queue *q);
>   	/** @fini: Undoes the init() for submission backend */
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index 9fb99c038ea8..1c9235a68f95 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -403,6 +403,11 @@ static void execlist_exec_queue_destroy_async(struct work_struct *w)
>   	xe_exec_queue_fini(q);
>   }
>   
> +static void execlist_exec_queue_reinit(struct xe_exec_queue *q)
> +{
> +	/* NIY */
> +}
> +
>   static void execlist_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	/* NIY */
> @@ -466,6 +471,7 @@ static bool execlist_exec_queue_active(struct xe_exec_queue *q)
>   
>   static const struct xe_exec_queue_ops execlist_exec_queue_ops = {
>   	.init = execlist_exec_queue_init,
> +	.reinit = execlist_exec_queue_reinit,
>   	.kill = execlist_exec_queue_kill,
>   	.fini = execlist_exec_queue_fini,
>   	.destroy = execlist_exec_queue_destroy,
> diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> index 664c2db56af3..1e079ca3891c 100644
> --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> @@ -51,6 +51,11 @@ static inline void xe_sched_tdr_queue_imm(struct xe_gpu_scheduler *sched)
>   	drm_sched_tdr_queue_imm(&sched->base);
>   }
>   
> +static inline void xe_sched_update_timeout(struct xe_gpu_scheduler *sched, long timeout)
> +{
> +	sched->base.timeout = timeout;
> +}
> +
>   static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
>   {
>   	struct drm_sched_job *s_job;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 4171eff4e8ad..43eb414bcb26 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -2032,6 +2032,18 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	return err;
>   }
>   
> +static void guc_exec_queue_reinit(struct xe_exec_queue *q)
> +{
> +	struct xe_gpu_scheduler *sched = &q->guc->sched;
> +	long timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
> +			msecs_to_jiffies(q->sched_props.job_timeout_ms);

Can kernel queues even be in lr mode? I'm also not fully convinced that 
duplicating the timeout selection here is the right move, because if we 
change the code in guc_exec_queue_init then we'll have to change it here 
as well.
Maybe we can save the timeout in xe_gpu_scheduler when we initialize and 
then just restore it from there?

> +
> +	xe_gt_assert(guc_to_gt(exec_queue_to_guc(q)), drm_sched_is_stopped(&sched->base));
> +
> +	xe_sched_update_timeout(sched, timeout);

IMO we should call this xe_sched_reinit, so if we ever get more fileds 
to re-init we can just add them in.

Daniele

> +	atomic_set(&q->guc->state, 0);
> +}
> +
>   static void guc_exec_queue_kill(struct xe_exec_queue *q)
>   {
>   	trace_xe_exec_queue_kill(q);
> @@ -2274,6 +2286,7 @@ static bool guc_exec_queue_active(struct xe_exec_queue *q)
>    */
>   static const struct xe_exec_queue_ops guc_exec_queue_ops = {
>   	.init = guc_exec_queue_init,
> +	.reinit = guc_exec_queue_reinit,
>   	.kill = guc_exec_queue_kill,
>   	.fini = guc_exec_queue_fini,
>   	.destroy = guc_exec_queue_destroy,

