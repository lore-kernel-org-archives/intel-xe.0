Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197ACC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 19:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B322310E324;
	Tue, 22 Apr 2025 19:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDWcv3ob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9E810E324
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 19:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745348514; x=1776884514;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aMwOKLlGbcfsF7fiQqYcz/X0n5rmKTbgHmRLGmZR5tw=;
 b=QDWcv3obm+NnKRMN97B1SYHFHiD9sy/unPOwfBq1GHrWbV+VzMiMxOdf
 UllVeKJaWMHJ+Q7K0dk9Q+xWsn8WwFXD2InyRjhzdXv4zf8T/svaWvb0L
 qKy1jn59n4J4mPbm92B522Fu7MI8EK/3yCH1C7UIIIojNIJ59qQXrzT9I
 YXV9YFoq3anaHbcH7UItjqtSrL1oKDb2IX4mGsXa33Mg9QcEWkcIhjzdN
 JhtLg/TJNM+Rn5gkDV5zZ2bLb0CpryAKRon2bTROGuuOje2p7J+KLLvfm
 X0+Rto+Zluo58J254U/pvo6KGPEMRlzyGzuSA25IdqNmENzOYA6sm0Tvr g==;
X-CSE-ConnectionGUID: /7a0iyWdSlu2I5n/pj3pSw==
X-CSE-MsgGUID: yZvJFDGwTJ6MAulo90IQ0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="46936020"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="46936020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:01:54 -0700
X-CSE-ConnectionGUID: X6QuhsTMS4K12S90w6ySbQ==
X-CSE-MsgGUID: jjQcpZVGSrK9dIKBv/xn8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="132633679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 12:01:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 12:01:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 12:01:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 12:01:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uG5iAdxJnjjRVvkh+8gDY4o2Auvs66HyZ4ljuBQPgAtbvSPkMhmw4QkB2wypawgg+mGqkzcyxZFy8y80c5E/WgATSv4vUwVAtGL5xlJXeNO4V0upI5fIPp+h4b+PayR98FNQhxUjZBRgRBfgQuGs1Eho1e1Aci9pUggS+I2IsJQd/VyqxWza05xvNf4RwquVqodKT2XhDuo++ykrI+WGWrqZ8nxm1DpgxTJiAC0E3KFS5jfCEhp65MhhMIjftZoW3awKsn47gX9+d+G2BkKnkJ1LAfvKsmjwFQNzYwhVTgNItJTWVLj/PQQQfSSTmEOcWs2PcZ30qNAqtVsHHWQPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1EdBkPwm63gWLzzCWMy/oZjAc2cLCBlcM+OmNArR7o=;
 b=tYJklfm6R/Wnkva8xnj1uVbhIX0e4zrJtItyhJto6aQddQxDEqHct5KvwSmm6INaxMy+5Cm7vZTHVilklend6DWLGm7DeNnArlZdCqlD+Vzo8GWgnJCGTN/xPN4Andro5BRXzgMV/ymBn7K4ONuiZjHNi6W6Wl6DQTUpcogN+cIJzKoOuAf+X9UYvhettSaUIrGOwaWMlF14tWR9s8/FRDNZpfpxqV76AOmtFWTSRzmDUAj25Y+BKYU3DeQ2kPI3Uu1Q+nO3l58iDlLwQ71eCLTuH6OTOioWvYQUyny99R/pL8r530L70K/8ZyIQQWjHf2NOx+4pQen8IL8X8lcizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by SA1PR11MB6736.namprd11.prod.outlook.com (2603:10b6:806:25f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 19:01:36 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%3]) with mapi id 15.20.8678.021; Tue, 22 Apr 2025
 19:01:36 +0000
Date: Tue, 22 Apr 2025 12:01:27 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.s.atwood@intel.com>
Subject: Re: [PATCH 1/1] drm/xe/eustall: Do not support EU stall on SRIOV VF
Message-ID: <aAfnh9L-GZ1RNe2f@intel.com>
References: <10db5d1c7e17aadca7078ff74575b7ffc0d5d6b8.1745215022.git.harish.chegondi@intel.com>
 <87fri1105c.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <87fri1105c.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0267.namprd04.prod.outlook.com
 (2603:10b6:303:88::32) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|SA1PR11MB6736:EE_
X-MS-Office365-Filtering-Correlation-Id: 75295b75-f7eb-46dd-c441-08dd81d01b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmk2c0t3Ty9jelEvMzhmNitxbE1nYllralhYamtkbWxqajdGRW9iSUNRQkt1?=
 =?utf-8?B?ZUsrMnRYcHpOeUFGSmlXRGlDNDVCaEM0d25qb09XNXpRNTR6aFh2eTkwOVNh?=
 =?utf-8?B?MTh4Ulh4K1k2TGJ6RGpKeUs5V1ptdUZTSHJ3UitoVk82ZmNSUlVhRlpocmg0?=
 =?utf-8?B?YmJWNGEwUllHQTVJVm5yckc5OVppeDgwNEI4SlVlaitXdUUyb0pDTkk2T1V2?=
 =?utf-8?B?OXZadjJhUkh6UHRsTFp2MDZCRmlwb0o2T1BRR1A4YVpBU0c4MkpFR1JaWUZN?=
 =?utf-8?B?elpPYVJRY1pNTTUvdmxPQXZmNVpYeW1UYVVjN3NpcWJha0c2bFg1MVVaYWp4?=
 =?utf-8?B?azlzZDh0SytmN2svbG82NjF2Y2hzRkFZdVNENTg4dHdVYzFITjFRNG95Umsr?=
 =?utf-8?B?VTByWUJHUWgrMXpuN0lDNGUvQmVHSkVBTktzZ1ZQQzRaQkVCY0wrbHEwZmt1?=
 =?utf-8?B?UHBDRGw4RkZoYjdNZFhUeDdFaVo1MCtlQkVGeXNTdG1LMFpRbWdGNGFVWVVq?=
 =?utf-8?B?Q2ZPYzFqeHhsazBvOVg1TWhKMFlUSjdjdjFZL3BFUEV0NGZVQzNBT3NBN0tS?=
 =?utf-8?B?TFhEQTBzWDVFdnd0ajlhd0REekxIZUJrYnhrODBSdlUxdURqcG83Wk91bmUy?=
 =?utf-8?B?ZE13V1UxaUxBTFdMSEZQTm9uK25VWDl0VXA2ODRXUzhveVNsbkhRUG9mVmh1?=
 =?utf-8?B?SXVMRHRkRk02WDNPT2xrZ0FrdC9yaTc4OXhLVVBVYXZvSzBjUDF4Z2RFRVBO?=
 =?utf-8?B?S0p3OEJzWXdDdjRWKzNxUnNuQzNHaGg3NGZPajBNK1NSTElUaWwxVkJCaFk0?=
 =?utf-8?B?c21BM3ZUazJPNjljOE1CRVo0eHJpVmFNUGYxUjlKcGIrWTBFRVVXb1h2WVpZ?=
 =?utf-8?B?ZzJuZlVTSEZ3TjhlMnB5VnBWZkZGR0lleGc4U05Fa0pVamdQMVNodnZhRFJ4?=
 =?utf-8?B?SFBiZm9GTHFKVXJmTHI2ZzluZi9hZk8yZUpBbThpQUxobEwvbENnNER4dlF3?=
 =?utf-8?B?ZE1xWmlPWVQrWnFYVnV2Rm9ld1M0SkRYS3htYXFoeklHWVduOWxmMC94VWhQ?=
 =?utf-8?B?T3Rsbml5YTdHYk9LMVFnaHk2Z1ZKeXFrV3lZR2x3Zm1xYXgrRUsyTWF3c1Fz?=
 =?utf-8?B?YlA3aE1KZ1VWalYwekNObEc5d2pLbVU1Sk1XZ3dCM0hJd29Cc2J5Y3AwZDM4?=
 =?utf-8?B?NE4xOWtYQndrKzcveGROallkRUVNYzJzM3BSWnpKYjU3U1pVYjd4N2Y5MHc2?=
 =?utf-8?B?S0NxYmJ1cGZKaGVZaTFrU3hoSTJsVUxwZXZpdm0yYnBBaGVRRi84MWtNenov?=
 =?utf-8?B?bjlBaWJlZkZaOE4xZTVkN09kTTVYMkFMMmNURTMwSXBZc1M5UHlySUhKV29q?=
 =?utf-8?B?Q1JTUzZDcDI2M0p2bDBTeW8vZEU5OHI1WGR6aCtIcWxtcE1EM0pLZ2FOZXZW?=
 =?utf-8?B?enpuNTd6cDR6QSszaWZmWno0SVk3Z0pVWExHOVZDSlpmRUZ6bXZ6TWNOWnha?=
 =?utf-8?B?d0czTE9NMHZJQ2tNRUdlb0x3ZzlKYmRqb25VOTlNYmYxaXpFZDJFZHBUQitk?=
 =?utf-8?B?MU9rQTQzeFRSSWNvV3I2K3NUNmtLa0VIbjg2Vnp3RWhYSG1nWFdxMGlYZE5o?=
 =?utf-8?B?Vm9LamZSNHJ3ZW1uMHY5ckVzZjYzOUFmcjlxT3lXV2FPS2tCL0FTR3JFYTBa?=
 =?utf-8?B?TDUxTXViT0lsUUUwZ2cxNnZmZytLUDFOaFZ2Ukk5cjljT1F5UmZkR1FoMEha?=
 =?utf-8?B?OGhxNXphdmFOQjgrSWxPZWhUQTJSU29mNDhRYU4zUXBWaGVSSnU0WGNYUU9T?=
 =?utf-8?B?TFZwMER3WjdicExNNFVXNUY1eit2TFNCWTRZMFJteUdnS0w5Znk3QW1qMGlF?=
 =?utf-8?B?NlZXTFNTdm1ZM2NaUkt3Sm5jbWswYVVhL1dXb3JBZ0MrRmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bldWRmR6WmRXNlMyeVF3RVlFVmhIR1lDMHdCNmx4YnVZZFVXWjFHaXdFSnJo?=
 =?utf-8?B?alpjUGw2blVqRzE4aGtZcStnRGFDcUJGUVJ0K2JqOUliQVdKSmJQTUdKQnpp?=
 =?utf-8?B?TGNjUytrUXNwejMvcHBmblZQTWlJV2VVQTRUa1VGZVBGQ3JjOEFhdHR1UTNx?=
 =?utf-8?B?ZUlpQWRTZlRlbCtvREcwbDJ4N3R6S2wyczJZTXlUSnFaeC9LVzlxRmxTKzBl?=
 =?utf-8?B?WFhSNG50OEZvWWp2a1JRYWZFZlhmMWJaa09GaGVFRTdTdjMvSGc5Kzl2M2lk?=
 =?utf-8?B?TXFDbEhkZVRrbXpnYjRZWEtjYWxHVjE2RzhWV21sZFA1TDBBdk1PYlZvSVZJ?=
 =?utf-8?B?aG9lR2ZSSzJ5Q2xmKzRaTnlMWVlWakVFTmdiQ1FEUzVWT0NlWFFPdzZHNkdP?=
 =?utf-8?B?TGVSd1NBSy9RTjVWMUJ6NUI4dm1rakgvTzJlK01GQWhGT3RqTllESWJyZzFD?=
 =?utf-8?B?YTMwdlNMbnpOMjQ0a3gyN2Y1bE10RFFvSlpTVTh0QlVycVJIVXlQWTlFQUha?=
 =?utf-8?B?V0laNHZtWmhuRnBIL0wrZkhUWFNGREhDc1NsUzNOenU4RnA4SW9tZTFId2RR?=
 =?utf-8?B?OTc5RmhVeXFqNDhZNkEzcWFWSXZZUldzRXRpbFU5enk5ODFIUzZhMXJPdmRO?=
 =?utf-8?B?a2xodlprZmsxRWF0c2kxemI3U0xlZ1ZyWndHRllqbEhjREFFTlRjdVlPNTMw?=
 =?utf-8?B?QlJGdmpoazIwRC9LeGs1clpsWTB2cTdIOVN4Vzh3UU9Mbk9PV1pNcndhdE9W?=
 =?utf-8?B?TXowbW9WNjNVRkdaR1ZmcG1qR0pMUW0xQ3Zha0VjSGR2ZkNOdUtFWVNUK2VF?=
 =?utf-8?B?SkxBU1FkUkljM1V2TnJUdzF4akN6SCtUSGFnWG41YjhUVFlRcXE5OTdyZUFL?=
 =?utf-8?B?Y3ZqZHE4TGN2WkcrS1VkVGRzb0EwYzZWVUJtWjJuOVphN1BhTW11cWhOT0RP?=
 =?utf-8?B?bGdmWUxPa3VRMXA0dklrUmtLOGplZVU3ejNJZXpSY3FHdGdtdFVuZlNjUlJ4?=
 =?utf-8?B?eUt5dTc4ZHllMW1PeFQ2clhkellhT2o0aVZuUU9mL1IzRTVaYUY2UlkyWGRu?=
 =?utf-8?B?dDJmM05SMlNMcDU5Y215eGNnbUd5SUlxWmxiKzNsT2pLUlRaRGtUbFVSNXlR?=
 =?utf-8?B?UGNNWWtpYzZFdk1Ta29tY3pmNjFtKzNGSnlobGhONndxVnZ0bVdBcEUweGVQ?=
 =?utf-8?B?dGJSaDlVaEtXTTZzMmdtNXZmcnl0UEljdG1COHltSGVOOXV5Znhud2tseXRv?=
 =?utf-8?B?cEJvQXJZaTE2dmc2OERhckhoUi9CbHdGRGMrNWpKQmpoVmluUzFDekd3Uk9i?=
 =?utf-8?B?QWNsOG9WRkMxcGFpQXE5MmFNNjBqd01MMU5oNDlpRjFBYXo0MXJxeXl0TVgy?=
 =?utf-8?B?Z2t5NXBRNzhPOVJPQ2RYMkNHVWdBa1cyS3RYQ3loTFN1Q1Jsa1k3dnZqQU1T?=
 =?utf-8?B?d2ZId3BCek81MEszZUh6aG45NXR2TmhWM0k1eXBmKy9VNm1mNldmZUNhc2VQ?=
 =?utf-8?B?T2ZoNGVzK010Snljb0ZtTnpCVVBkTFlrVC80WlFsRVJCbk9NbG92aXplRnNL?=
 =?utf-8?B?VmFRdGFZMXBnN2MwZHJxTXRtY3pJc1pINXZ5bE5XQnRsU2FMc3hVYUlHMEt5?=
 =?utf-8?B?bkhza0liU1haamdOTVBDR1VLMHh5NzBYZGpkeWpRalFkYi9VN2tWbDFRZ3ZJ?=
 =?utf-8?B?RXNiTUljR045MDNoci8xNGpVWkEyNTZnYmtQanppdk8zQ3JCZ2daM3BlT003?=
 =?utf-8?B?S0NCd0tMZWJCOWFPUk02ZVZQQ3FsdkFNbUc0dUZ6djFoMnVLaTFHNFFCSFk3?=
 =?utf-8?B?Zm95N0lEVSt5UnpVRmxqVFJxc21zbDBUL3dQcDRWa1RyZGlTSVA1ME9ZQzh4?=
 =?utf-8?B?UUZxS2NOUElJWU1TdE5zQk9zeHZIV2laUEZhQ1d0OERvWTh1cUpxNnMzNXFT?=
 =?utf-8?B?TWVaNEhZeFFZYkREcFRWU0FxMkl0NkZvdkR4QjZFek1HSmdvVXBUYjRGekla?=
 =?utf-8?B?a25qMDB3WHE2QktHZW5RZnlOZ2FUSGxjbmVIRW9VWUVDeHZMbVY0K1hVSHBD?=
 =?utf-8?B?aGlJUlFsaG1xbEtuWEM5Z0FlNjBOUXA1TWEwdCtrbVZLMVlBNWdoSEN4WGk1?=
 =?utf-8?B?N01oa2VndXk4dTZaVTZGSmZxM015cUloUVh4RXZyU1ZMRm53eGJQdktxbmpx?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75295b75-f7eb-46dd-c441-08dd81d01b15
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 19:01:36.6571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HO8ikNgWaVftw09cBhFZFKRY+F9yBvFwbRSoPpvaU7FF1lWPGLDzNBUYDOLCRlcI+558r69DKFebXmsN08fKenbX3pOx9LwpjZXtKs9JJA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6736
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

On Mon, Apr 21, 2025 at 05:59:43PM -0700, Dixit, Ashutosh wrote:
> On Sun, 20 Apr 2025 22:59:01 -0700, Harish Chegondi wrote:
> >
> > EU stall sampling is not supported on SRIOV VF. Do not
> > initialize or open EU stall stream on SRIOV VF.
> >
> > Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_eu_stall.c | 3 +++
> >  drivers/gpu/drm/xe/xe_eu_stall.h | 3 ++-
> >  2 files changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.c b/drivers/gpu/drm/xe/xe_eu_stall.c
> > index f2bb9168967c..64788277ea52 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.c
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.c
> > @@ -208,6 +208,9 @@ int xe_eu_stall_init(struct xe_gt *gt)
> >	struct xe_device *xe = gt_to_xe(gt);
> >	int ret;
> >
> > +	if (!xe_eu_stall_supported_on_platform(xe))
> > +		return 0;
> 
> This check is not strictly needed. If the check is not there, just some
> unnecessary stuff will get initialized.
> 
> But if you want to add this check here, you will also need to a
> 'if (!gt->eu_stall)' check in xe_eu_stall_fini(). If you test this patch,
> maybe you will already see oops when unloading the driver?
Hi Ashutosh,
This check would prevent calling devm_add_action_or_reset() for those
platforms that do not support EU stall sampling and therefore
xe_eu_stall_fini() will not be registered for callback during module
unload. So, I think it is not required to add the additional check in 
xe_eu_stall_fini().

Thank You
Harish.
> 
> So either remove this check or add the additional check in
> xe_eu_stall_fini().
> 
> > +
> >	gt->eu_stall = kzalloc(sizeof(*gt->eu_stall), GFP_KERNEL);
> >	if (!gt->eu_stall) {
> >		ret = -ENOMEM;
> > diff --git a/drivers/gpu/drm/xe/xe_eu_stall.h b/drivers/gpu/drm/xe/xe_eu_stall.h
> > index ed9d0f233566..d1c76e503799 100644
> > --- a/drivers/gpu/drm/xe/xe_eu_stall.h
> > +++ b/drivers/gpu/drm/xe/xe_eu_stall.h
> > @@ -7,6 +7,7 @@
> >  #define __XE_EU_STALL_H__
> >
> >  #include "xe_gt_types.h"
> > +#include "xe_sriov.h"
> >
> >  size_t xe_eu_stall_get_per_xecore_buf_size(void);
> >  size_t xe_eu_stall_data_record_size(struct xe_device *xe);
> > @@ -19,6 +20,6 @@ int xe_eu_stall_stream_open(struct drm_device *dev,
> >
> >  static inline bool xe_eu_stall_supported_on_platform(struct xe_device *xe)
> >  {
> > -	return xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20;
> > +	return !IS_SRIOV_VF(xe) && (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20);
> >  }
> >  #endif
> > --
> > 2.48.1
> >
