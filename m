Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795DDC282D1
	for <intel-xe@archiver.kernel.org>; Thu,  6 Mar 2025 07:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279F210E8DB;
	Thu,  6 Mar 2025 07:44:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bomarjJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CD710E8DB
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Mar 2025 07:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741247046; x=1772783046;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CqHwqaDUXPp4Qd6XoWOln4b/SNcR32dQzpFVqIVD/iU=;
 b=bomarjJmU5/JnVcg1Os1xSTktJmiHh4w3F+1xdPdzedLz8DPRdRJjz0P
 ffU7PtOubg4OxbuQp3gmuosa7yF15ANYoGCicErUGcjHrz3rl8IZE4YyP
 1ShQi1SSJ+wyMASt7DFgrH2lxqx0skDT/spqrymvMjB12XYVf3d6oOYlo
 ojQEbHH02ZyXG3nRS4QghgBEjbtYPoULLVyHqvoY5fjXR8kiGBLvYOAo2
 biM2YQ/EiTEWSM3XteEmdTNgPgB5crA0mFjQAMHKi/qMxVE07PWgwHh1W
 tsNvrkZc5QI0L9y77djIx7rKh5mUtP9yhJRi8IKtrWzQcBuccaQ7ys1hp A==;
X-CSE-ConnectionGUID: xVtpFYRFSaSdBlmlPPyN6g==
X-CSE-MsgGUID: feSHiaitSrGDCm1OaY8lag==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45050712"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="45050712"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 23:44:00 -0800
X-CSE-ConnectionGUID: t0X3oD1aRmG/ibDUHaxSvQ==
X-CSE-MsgGUID: ecOKyeBrRDaJi855bncb2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118865170"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 23:44:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 23:43:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 23:43:59 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 23:43:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMetMtfFGXs+Bm2/lxuPd67PYqKqLVdjjrJZvoRXB3V9SIj+nfwp5ctKuc6lEOgsBUkqw4ZCH1AtJ9KExMXbzfkrNxMIjMfs3bbqKexEPy8CUfJt0D70o9bg1n6IUJLc2IRXvJZ2k49+CwWojnwSsEzNN8nmm39e/HHWpscAA77Fw2DKG0buP5B6mh3awQhJ/yXaLIK89KNAgZpJB6U4F//Q9BoLS5TAPiB39ygaer3o/XLFeRIkxQgD4alOTYKswYHCHZoCc7ZiU4DuG2J3nhqEP9t9dHTLhSJxLDR97AWH29YyisPTLfd14anSkI1VsrMhs8Ll5L/Zkfhw2mQRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLAKNa9Mwjw0cshTdwuG8++7OJSNpyZDCtIh8wm0p2M=;
 b=h0VUempPmzSHLmlGASZfHXbfC7N6NLqrezV8Lrp4pPg8P7/+LdRPDGv5MY+SHcs48WhMVR1qikUG42H9VC9zZsjuCPADElUorJXbqFq2gmT2+kuhkWLHjX59+IhykM6RlHZFNEpMuPSC7NI22E3FL13/f55VA+L7P6kZGfQu2JKiYNHbzfZSrhhXYjwYnMIP2whApDOUP4VNKqyK1F95SFz+yPEPE1x2HiKf+HmPY8jyzLgRcdwzxfiR5I2dj69mB8EtwzxOX4FK+fmXnYDdnOli/GvNxb7LJXqwFhghCFOV5qRvdVQ2obt5PKVYXv5X6mjEOe3/xfk3qc+GVq6jUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7607.namprd11.prod.outlook.com (2603:10b6:510:279::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 07:43:57 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8489.025; Thu, 6 Mar 2025
 07:43:57 +0000
Message-ID: <2611cbec-0a53-46d5-a199-87d4099992e1@intel.com>
Date: Thu, 6 Mar 2025 13:13:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: fix enable survivability mode
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Francois
 Dugast" <francois.dugast@intel.com>
References: <20250306055407.511405-1-riana.tauro@intel.com>
 <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <v7b65hpbmftedtbgq6qggel2xcvyal6wmxukx462rp2a75464w@5blgurlukprs>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0073.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7607:EE_
X-MS-Office365-Filtering-Correlation-Id: e750ee1d-a7be-4abb-1f93-08dd5c82a6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVkxMlU1a2VQVXNIR25YYWE0eGgxaW00a2hTNWNRNHZCTEM0cTFYSnByMTZ3?=
 =?utf-8?B?SGxSam5kNTJTTGozMER4Z1ltYVNsUzVsSVZiaW16NTFvdFpJUUNjSWFZM1U1?=
 =?utf-8?B?bkRkVXdTYllnMlRPQ1ZHWHZoeTZIS3RWUFFYNzlQNFJXTGRjakx1RUk1R2xz?=
 =?utf-8?B?RlFobDV0b05xUjRLa1Bia3NXQi9yYkNxUFdCcmduK2lhZFg1TklwTytXalE5?=
 =?utf-8?B?QUtjQlZ6UXB4SlJmQ0sxYkROa3NmQlR2RmMvRUdJQml5elNYM1BVbjR2cSsy?=
 =?utf-8?B?b2Evc1pGWEZKUENhemRJWi9qOGppNGgwUGRROFVIcytOeENrVkVOMHVaNXNO?=
 =?utf-8?B?OFd2bWh3WHFqZ3VtN3hXc3VxWEw2T1lWTlkzYUFReGZqYW1QSG1PVW1mZC8w?=
 =?utf-8?B?SDNUOFdweUs1cVRoVlV4L3lJQmtqeXpSY05nMVA0QUdTNjFlekFKQ0ZkQVgr?=
 =?utf-8?B?aW8zcDR1TmFwM2ljZENEa2t3elVXbWIwdkdrdXVuMkRxM3RjZ201Mm50bWF4?=
 =?utf-8?B?b09wYVVDdW5Nemh3VUttOGppangrMFFMSnlxZ0RmV1JLem9kSy8zTFRjKzhX?=
 =?utf-8?B?N2tReFdIRmY5eGdCcVpLTEtUdUp2Tm9TMExLWFNsanczcGhQMlI0a0F2aDg4?=
 =?utf-8?B?Y0tpT0I4Q2dWdXBId0IvZ0dTMUFUMG52TzhVY21KUGYrYy9MbUdmUS9BNi9M?=
 =?utf-8?B?NnV4SnlQS2laOTRkZFgvaStrRFNGcjJYNFVSRjJoc3NpRDM3Zkc0cHRDYmlv?=
 =?utf-8?B?RU81ZW9yQUtobzZmeGZtWU5vTTN3SFR1cWNueWU2OEJrajdMUU9nMVM5VVN1?=
 =?utf-8?B?aC9CRGZaa3BoSEtZQ0ZLRjFDY0JzL1RSS2xXRkFYUXlDcmo2QUU0dTVBRFM1?=
 =?utf-8?B?OGRXaUtaMk9McmpIS2FTaVFYb2pzNWFQcDRCTHlaaDFnbk1uaXQ4eUp5UFJL?=
 =?utf-8?B?T2RoQ1BLWHNmOTZiN0FqWDkvUkx3TU1OSHI5dGxGQndjQmZERU10ZEJZREwx?=
 =?utf-8?B?cVlVTEFmUWZEc1J1bFR5MmZLSmg2bEpWeW5uV3VhSlJuSkRrbDFsa1pYbmE0?=
 =?utf-8?B?YUV6a3VIVG9UWm8yN2oxWllSNU1CMmwzaUJ0OG5hei84dFVEMVV0V1dtb255?=
 =?utf-8?B?SEI2YkVzWG9lZE05NGRwRGhiaU9pcjhic3dwMGI0S2czTHhzc3gxUHhQK0ZM?=
 =?utf-8?B?NHpPS2w0cGZ1dUp0SnpFdHczTi9IZG9VOHY2bHFiSG5icVZZMGZ4NVUrYlpC?=
 =?utf-8?B?MlBQL0ZFOUNqVnc3VWtkMjZMcnE0YXBlLzVRcXBWS1BnZ052Q01uNVVOcTVs?=
 =?utf-8?B?ZE1IMzFabUw3QkpRTS9qTVFRYW50ajNUcEFxTzMwdStvODZIR3ZBMjJ4R3ls?=
 =?utf-8?B?aVBDMjNuWENaMjlLRzNRZ0hFbHZzKzlrdDlmZWF0V1FKRlBMOUwwbGZDdFJy?=
 =?utf-8?B?RXFNWU1odm80TmZGUnNEaGFxYTlIN0xTalZnT3RXUFA3Yk12TnM5VUN5VDE0?=
 =?utf-8?B?K0xuWUw1Q2RRbzVBb2lib2Z1dDJpOGdpd0tQS29MQTlmOUEzSktSYXE5Y2V6?=
 =?utf-8?B?TGRZeTdtNkFkRTRtNEFTVjBPTmVmelNRWlpkdnZrVlZRZGJPVE9mTFI3OHky?=
 =?utf-8?B?T0ZhdHo0eGczRGNib091bmNmMXk3N3pyaWp0cWM0N3R6bG9yeDVGMGNHSzhB?=
 =?utf-8?B?bjFVdld1bDNYdVNoNS9GUW4xWGRJRXpJeFdMZjhQRHg4anBDb21PNlNMTlNL?=
 =?utf-8?B?aVpsRlpjUDZja3VsY2FWSFppcWtjZ0kwM0lNTDQ4L3hOYlJUNnlPWEhkUnFK?=
 =?utf-8?B?NUluSFcxci9jVnNIN0g3NzhoSjg2eFRwWElsODVObW81ajlCdWo4RVRoN3ZS?=
 =?utf-8?Q?tGE5AM0HEOwZZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkk5dW5CdHBPWG1aY0l5M2Z4TVp4UW1kNVEwMkNBRUNoOXNQS0FESVQwR0Zn?=
 =?utf-8?B?RGtHVzgxRm5MbmxrRW1veHQwZVJReEpzZU1ZMzdVcnZjSUg0WXhzTGZSdGV0?=
 =?utf-8?B?TExJb2VuTHpocGd5SDM0MmZEN1F5bjNTdUhiMjBBK0RXV1Q1RWFJcyt0M2Zi?=
 =?utf-8?B?RnE2UDExMFFQTXhLdWMvMFVOakpJYWFZbncxR3NxUmNjNmZRcy9CQ20zb1c2?=
 =?utf-8?B?VnVlOFdOL24rbzFpZmh0SUl1bHp0RWxoTXlPU3BrbWE0MnMxQ01VbkcrTWsy?=
 =?utf-8?B?eGhZRGZmREZXRlJUMXpxRmUrR1FBRHNicWs2TFRySjNwb3JWMUV2bXFuRGdU?=
 =?utf-8?B?N3lVVnVoMXg0TGQxeWpMUVNWV05lNzhUVjNoRjc1TGN6TmpjcmllRjh0T2pS?=
 =?utf-8?B?cWF2Skg4WnlqbUZwK3M1ZlBTSUlKWkJpR1hyZmxOTEJabEs0WkVVVkdMVmMr?=
 =?utf-8?B?bXVzSldFTjBOVGMzN1I3RmZTVm1Bd1RPamlaK25VUlRJZ04wOUlkVGRUa09r?=
 =?utf-8?B?V1MyMkZrN0JBV1pVdG1wL0g4MWVTc04wdlp1dUhWRU15Mjd2THY3RkRReHpy?=
 =?utf-8?B?OUtaL2YvaEs4bVZwWU9CV2ZLYVJBeHRMUTdkNTVXcDNmWUE4YlVUSWdYVFFF?=
 =?utf-8?B?eTk3dnlvbWxFbUdUYjBkYzVCRWVrNkV4STVYWnIwNkk5Uk5UNkw5Q3dZQ1o5?=
 =?utf-8?B?aGN5VUVaUTY2V3Q0WGlEc0srcm9xZ3FLQXNGOXFSR3VMUzFOdFZIc2ZYVEdZ?=
 =?utf-8?B?emNEemNFejdoVEdjeEJza3MzSUNDcmFoZ0l0TUpoVFpKNW1QQnQ4VHdBbStC?=
 =?utf-8?B?bVFNVnc0RFI0VGNZWTJmeWxLVVRybGZPc2J1d2Vjazh1aDhpalJMUjFtY2hx?=
 =?utf-8?B?OE9wb1pzL1VGTUJRSFJUM0VWY1orcWxucU5GM20rbkxFNEs3cW1iZWIwLzJ5?=
 =?utf-8?B?TkJpYmxiOHVsenYrVDFOWjFTM1o3VXdxUVpyM0VWVEJuQUdUNjNTRmFiMUtY?=
 =?utf-8?B?YThIM2labHcvYXZuSGxDUFM1Y0gzNFBDcDdSektITXVSVitPckhpSDlyL1l6?=
 =?utf-8?B?cXRUdkc5K3VIR2wxd1lzYmR6SFo3c2hJOVowV0ltTENXUWNONDIxYVJKd1pF?=
 =?utf-8?B?a3dWUS9BWWFMZTR6N1d0RFNCcE5pSUtOZzFhYjlpVllpbFZMQnRhVkdGbHha?=
 =?utf-8?B?MUJJeldFeDVnM0k5YU1ZVHdMRTNXWU1IR1BTakJhUGdJUjR3STRFWFM3UGkv?=
 =?utf-8?B?blVxdXdEa2dzRzNSSnBxK1NaNWpFVkMxaGhDaGxwVWpnd3k3Z1hNdDMrL296?=
 =?utf-8?B?L2tsTkk1aFJKeU9scEU1c0E3Sk5GSlQzeTVDQmxTWHlhSTBIMk11V3JuKzVL?=
 =?utf-8?B?aHJJS1hpUnZSZFh4R3J2ZUc5QWxVTTBGWktUSFVIeU1FOS8xZlpmakEzUWJh?=
 =?utf-8?B?UDNTWG5ianB0bWhyb3A2OFAxQmdBSDZOS3A5QTY3V2NNV0VFTkNUSXZ5NHds?=
 =?utf-8?B?b1NFcm9KOHFyNlVMcVJKbndFOVlKUTFjN00wTFc0NHNuajcwamtRSnI1SjEz?=
 =?utf-8?B?cEluNWI5MktsVEVINGpYM0tjcTFyQkpzQ2JuWms4a1lZbHZPZUZkaWg4ZWYy?=
 =?utf-8?B?c0JPQTl0Wmd2VGJ2SUVVaUtHUHZtc3pxaFZDOXM4VUpkQ1piYVhMRWVpOThL?=
 =?utf-8?B?c3l2WExuRm42TDBzMmY2Ync2bGhrQVNiVndKM3VDRmI4eFZnZTZ6eGNNNGMw?=
 =?utf-8?B?WHNWYmhGa3pwNURRUnRDQ2p5L1pYekdUbm40dFFEbGJpYzZqSWVhZmZXNk12?=
 =?utf-8?B?UEJzUGlCeHdXQXNtVTlNSnVBU3oxakdnbS9RS0dQWnZSdlhyZEk3T0d3aWNa?=
 =?utf-8?B?WEpxeENvKytaR0hrSnQ0emtjSjNFamR3by9PRlEweWdFdjE3QllRcTVoRDhp?=
 =?utf-8?B?dzhta25qVXhNcHRiTjVvU016ejVIVGt6UW9KRUdOd1ZuTGtnM3l2VVNLREg3?=
 =?utf-8?B?RFJxaGJON1FmS3BFVGZ4K1RteERpdjVubTNNcXlqb0l3LzhBU1hqbjhmZlNK?=
 =?utf-8?B?MHh2NE9rbFEzZkJJQ1pvaEg5Vkh2SWJaWU5FRlE0UXhEV1ZHVmFiOXdQMlJP?=
 =?utf-8?Q?M2HkFKa6Rxult0PaizbxNKm11?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e750ee1d-a7be-4abb-1f93-08dd5c82a6c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 07:43:57.3194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmvNUktk5a6qFUhmMI0UJPnFhYR9fhkfODYdC82woPCZ5dN7LUth4ZnOfZzgifED3l/7bJcZQbiSw9amhB0Qjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7607
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



On 3/6/2025 11:34 AM, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 11:24:07AM +0530, Riana Tauro wrote:
>> The current implementation skipped entering survivability mode even when
>> survivability enable returned success. Enter survivability mode
>> if enable returns success
>>
>> Fixes: d40f275d96e8 ("drm/xe: Move survivability entirely to xe_pci")
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_pci.c | 5 ++---
>> 1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 6b5fa067b39b..ee0665e54489 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -857,9 +857,8 @@ static int xe_pci_probe(struct pci_dev *pdev, 
>> const struct pci_device_id *ent)
>>      * HW to be enabled. In that case enable it and return success.
>>      */
>>     if (err) {
>> -        if (xe_survivability_mode_required(xe) &&
>> -            xe_survivability_mode_enable(xe))
>> -            return 0;
>> +        if (xe_survivability_mode_required(xe))
>> +            return xe_survivability_mode_enable(xe);
> 
> ugh... the mix of bool and int above threw me off. I remember fixing it
> but probably forgot to put it in the series.
yeah missed it during the review too.
Thanks for the review. Will check if any test can be added for this.

Thanks
Riana
> 
> +Francois
> 
> Can we inject 2 errors to easily test this in igt?
> 
> 1. xe_device_probe_early() to return error
> 2. xe_survivability_mode_required to return true
> 
> Thanks,
> Lucas De Marchi
> 
> 
>>
>>         return err;
>>     }
>> -- 
>> 2.47.1
>>

