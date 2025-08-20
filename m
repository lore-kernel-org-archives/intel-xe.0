Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2858CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 20:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A60810E7E7;
	Wed, 20 Aug 2025 20:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSzj4knJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C36810E7E7
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 20:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755721872; x=1787257872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KcU3CMBFbk+BRGZAtOP7AWcyUdIR2oCY8LRjwBvkpuE=;
 b=dSzj4knJ+Mdl6atu1NppTWGDe932esfg7Fh/x+/mTDSJD88CunHyrGyy
 d2J7tFlsEC/Pd8LrKm/IvLJZjIaBkJmgzmMsxUjAF+JKifvfpOGrDPK9s
 PXLWsXCO8qtpGBu5hVJ089WTUeyQAcD4fridZYIf1qzC53HRrfOGXPlDT
 nw3aPFgbUS9/6LNc8vqheYNz6+uBHNAubv83lTHffVZyoojHS48n1AVWB
 Pz/eNZOfEcSqcz9vj4L34i1qmAWZnYSEhiDjyQFfsgk3iJw0RZuia4e91
 YzWOP9FUsZ4luiuzAjEx/IwjVoAAuM59imkLJtle37QEDVxpBjJnfhm5Q Q==;
X-CSE-ConnectionGUID: 2sI3E3JeRkqAH/fcunycow==
X-CSE-MsgGUID: CF2FSyH0REasUY3uNpOJGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="68706630"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="68706630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:31:12 -0700
X-CSE-ConnectionGUID: jdxfSa3YQg6xnrlONcIUqQ==
X-CSE-MsgGUID: 5AHoXmWbS0mZkjQGJH+DwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172441246"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 13:31:12 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:31:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 13:31:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 13:31:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBDinamz3Q1s1pqd8Irmg9gmQ9Zsxn8ty2xrAmcSxwpS9TMS27mqbU0DPYH9KOc03cZVqUXHiclebq6KLAj10uqBKVfPsoBEwK7acWD9O9DS4TtAYD5Xizn9ThEtAbGpOVt/8FjU1ZnXFYJ59OlM7irOoClYNnqeueSYyshGNLhnz2Qzh82bXOazq5pKSeJJ8VdGul0fr2DFd8lT+8HZodl30Ui6wlGQupDqZkh4+n/+4ZM2yYoSVcUAuc1aNSYlarexBKthY+t+tbClaYfOuZZDNE34tDHcRZnaEIitNxyNi4v+J7Zx0JmV0mB+Ngcr3rYzkRVbXJynGtyCL082wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLbqXH8QvIupWv6OYr7Tt5vLVJ6p04sSqaEJ2QxaPd0=;
 b=EJfn4hbRlR6qFhh9hEAJMhSPLJa6TbzIFvVzRp9mCFPJ/SqrSXR5GRpeV/AagolkoSaEVaAIqGSwTSTrtaxV13igc7GD0NVr4IPUJPY/vjJTymOukkPAw/pyRkZ3DHsmb2JVrxj2wla/ZD4QO/9eTHb+3gdpCnxKzRcz3ZIc/72x3GlW1721axFvQE/QVHa7au0a/u4aMKCUHWlCz/+wvPSCHFFHYlF1djPnUWZhDPjcjRinmLwLeuDJT/MuTngg+RpGzHsSxGOCqEVbEF3ryhAN3C6UO++Obzvs8q3IKVyMkHLKzXcu5wM/kBVVMdxrFjUy6CJ1TM1U6dyE/32Lrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 20:31:08 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9052.013; Wed, 20 Aug 2025
 20:31:08 +0000
Date: Wed, 20 Aug 2025 13:31:01 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <badal.nilawar@intel.com>,
 <prashanth.kumar@intel.com>, <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <prashanth.kumar@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, Badal Nilawar <badal.nilawar@intel.com>
Subject: Re: [PATCH v4 04/13] drm/xe/psmi: Add Wa_14020001231
Message-ID: <aKYwhfWLEjkAJqsW@msatwood-mobl>
References: <20250818-psmi-v4-0-a330783ce1c0@intel.com>
 <20250818-psmi-v4-4-a330783ce1c0@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250818-psmi-v4-4-a330783ce1c0@intel.com>
X-ClientProxiedBy: MW4PR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:303:8f::10) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DM6PR11MB4738:EE_
X-MS-Office365-Filtering-Correlation-Id: 879a29ea-7559-4bae-ec5b-08dde0287e56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhiV05mZ3ppaWNtN0ZBQTdYSjhlaGMvSGNObFQyUHhWL21RUzZSMzI2djNy?=
 =?utf-8?B?ajF6ejVTWWJjTnpZQjMvb0o3cDRZcVA4TlhXZ2NEa3ZteDhqc1QwS3BpanQ3?=
 =?utf-8?B?Y25wM1VUelZTRm41aXBBajYzeDlRNzRybkZ2L2lpeU5wUGJWMW1pYk05OHRr?=
 =?utf-8?B?aWtwSms2UkZZWDUvMTcwaDZhNWRsWWd0eGU0S2VnR0hCREVqVDIvdVhqS3BT?=
 =?utf-8?B?ZDFzMkttSnpnRFhJUHU3SE1DN0pGUFRickV4eDVIcitNT3NtRjlsV3dZMzhN?=
 =?utf-8?B?QTlhUi8zMDBCOGtNSS83TG1oWWFOMFFuYkxPVE9iaktxV2FRa1ZYQTRvNVgw?=
 =?utf-8?B?RkRGMURBMkxyb29JWjhjYlMwL1R3NUV0VWdEdmdYdG9kT1VEOGRsenc1b0hk?=
 =?utf-8?B?cjFsV3E0WkFxclFCUy8zSnFMRkZFSnc1U3RPYUhNUEJnUjhyR3hwekduTWtZ?=
 =?utf-8?B?UlVSVXdIQ1E3d2lsQ09teGZHNEwyL20wcUJKUS81aDJXRWswRE9zdGkzSDJB?=
 =?utf-8?B?QUJXdkR2VURWVG1DbDU4SndNQVBoaVIvamkvcjRvb2t5MU9KS3lOT1Q3ZUNY?=
 =?utf-8?B?Wlh4YXdDZ1pLblZqaUtHN1NLMCt6MUZJQmtrWk9LRC9Vems2a0hUby90TE91?=
 =?utf-8?B?M0hMOHdEWEdvaVlTbUNMVzBBR2Z4M3BNeG16b3pNb3J4V1FVelB0dkk0RDdY?=
 =?utf-8?B?M2wzZkpXbFU5dzNTV0ppWmx1RlpOckFwcVE2V1NsMjBFbExhZkJ2R0VtWW5m?=
 =?utf-8?B?MUM4bUk5QndEYkUxYktDS3FhUk5YaTFseDFkRUZwQW9DOUVNY3RyRDR2K0d1?=
 =?utf-8?B?ZXBwQjgzdU9uaXBlOHU4aHV1czRTYWJYT1piRm5wZ2NoZHRSNTBqWVlMUXZO?=
 =?utf-8?B?K3pialI2UkpTRFplUENGQVMzUUdxU1BBOHZEdXlxRHI3Y0FPNmdBM3ZuZmdh?=
 =?utf-8?B?RThETzJwZjhZN2tPQUgxU2VZTHdLcFlqQThOejBmb0dUOFA5SitOY2k1akps?=
 =?utf-8?B?ZWhVSmlka2s0K1Q3Z3ZCeEQwaWVpZ3BhaklVSGFVVFJEQU9FZCtNTisvS2h5?=
 =?utf-8?B?ZTdqYzM1aFdQTFB1WEZ4NVM1NjM5V0ZlSTFjZmdRbXc2R1ZXelVvRmpVaHBW?=
 =?utf-8?B?V1hZWHAwaHpuUE95OG5QMDZ4SGRoMmxHWWZtZzBvVGYxNkFBSE1Cd2lWdjUr?=
 =?utf-8?B?U2I4bVp6WEpZU29xN2RZbjQ1UDNyL3A2bjNOR2kvMzc3TlVkTzI2N1hBeVor?=
 =?utf-8?B?KzMyZ3cyUXJ1UUFjbldQRVdhbEVyMytqNDNROEh6S2JjM00zdHFzYjd5alJr?=
 =?utf-8?B?MGZOekZDOEFzT1h4WEptN3o2NlpVRVVKRzRLUU9FU05uZ1NqU2NhNjdyNmxi?=
 =?utf-8?B?YjQxWnZEVmxGOThvajFocDdiVFlDOGVrTTk2SklxUDlQaU9IdFQ0MVlFVkpk?=
 =?utf-8?B?clkvTkhtWmYxQk40aGxFVEtqakFLRWQzOVJ1QnZQMFpwNU52MEFObXlqQnpq?=
 =?utf-8?B?bFE1cGNrbHRkVTlCYkRKZG9sSmNZVkxlUnVUcnVIMDgvd1dha09ValhyQTBY?=
 =?utf-8?B?VXR0L0dqQnE2TGxGMjJZNHdTQWtTUm5uVDNLbUFBNGlnMVJqZUpScGNLUWl5?=
 =?utf-8?B?dUpGNnZwWHZhcjlvd0xiQzJCZmFSOEsvVkpoNFFrMmhOdVFPSWtBNldEdWZE?=
 =?utf-8?B?bU9zcVVxZUNESVRGb2J5bmY2Rkw4QjY4TzRKRjdKUVFiMlcwVjBTTTZXa05u?=
 =?utf-8?B?eWxpNGM2b1pRZmhGTWhvdTNnMURCNE9TYWpGM3oyOWtacmZvNm81SW12RCsw?=
 =?utf-8?B?bHFOeklQTmpQU3l0dlhVUGtBOXFqT05PUDlZdzQ1dEtYKzJLL3AxSG94U3pI?=
 =?utf-8?B?WFFOTCtCdHAyK21CTm5ITUxYdGs2YnF2d2t4TG9ZZlBZVkhSK1ppWkk4Y3Fo?=
 =?utf-8?Q?fOJT4Oq0oxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHdjcTgxU2xjNXBsS3U4MkxtY1h6NTFpNVpZaTFveHpkZlVQVWw1TXdBNWNo?=
 =?utf-8?B?RFJIWndPTUI3WC9CTUtNN0NlT0x3RVdFeUQxYUJTKzlobnBZR2thVmpMdGds?=
 =?utf-8?B?YU9TRmdlUDlxSjRZcWF3RHV6RWdKV0M5dFRtQVM4WDhqVzZxSGJNcStJODRX?=
 =?utf-8?B?ODFTckVsQW9xQUlDNVhhaGtwVWZLcnBoYjFOZXZJemJOT0JJRmplS3dtSlZB?=
 =?utf-8?B?MVEzVktNS0R3bEt2UXpoY1dKQjl1L1pRNWpsSjQ4WUt2NmdxQk1ZdGxQTHVD?=
 =?utf-8?B?YS9zMkFZNmNkQWZtbWlyazF5ZnoxZkMyZHAyMThVYXF2N3Z5ZVg4SlVVVFFq?=
 =?utf-8?B?d1VpdXFsY3M1VU9aTUFIWk9IWUdCWlNWREpUamswT2s0MElOMTA3OUNxdGdK?=
 =?utf-8?B?Qm5ZY0dGSHUyNHBIaFpHMk1EVkVFSnYrazM1RWJYOUZBTnR4bGV1eXA2dDFU?=
 =?utf-8?B?Qzd6ZnB3MldaYktwaHdvQ3NVYy80Ym1jNXlZWDJIZmRrUys2dHZrbzczNU9D?=
 =?utf-8?B?cGpUekxOeldhZTBuRDQ3WGR3M1FOMDdvZnhQNEJOYndhdGg5NHZGSUtiakV2?=
 =?utf-8?B?YnZadDduWUYwd085dXlzR291L3pwc2VDWjJ3Q1kycHIwUHcvb24zeU52cW5s?=
 =?utf-8?B?aDVPN0lVSGFWTTM4YzBjY3BXVkYzbTlvVVRGYzZqY0UrNE1GeEhiRk9kN2xv?=
 =?utf-8?B?TkExbmthOGhlZzlOaDdEZ3M4RVpjcHUwbC92V0NyM3V3bEhOdzc1Wm9CV0Nz?=
 =?utf-8?B?NDdjOTF0aG1UQTZWVUhyeUdYcEE3MDk0bDBjaVduRzVMN2JKOVRpR1NRNEdr?=
 =?utf-8?B?OEVuMS96SWduQzN5S0QrM2tKNm05WkxaOHkyVTJVWksvdnZmWVdLakpjRWYr?=
 =?utf-8?B?UitreU8vaUp3VlQ3ZFRuWmdBT2N4MEljMzdyaTMxaWJvR09jZGxBQUxJSncw?=
 =?utf-8?B?YVY0aFNXYTJHMHJmS0FOaVhkblJTMytYVjJ0Nmk4RHZmaE5iR29OZDZrT0Vk?=
 =?utf-8?B?M2t1UnFHSkthZ1NhU25NZGcwT1NlZy9YaHB4b0srYldmMlNmbnc1bXZoVnpE?=
 =?utf-8?B?T09KVUxkNDQ1Qm9wZk0xL04zb1BWaXlCbVVaTldOVFZmRnRnd2hXT0VsbzRp?=
 =?utf-8?B?OC8vTjNpcFovVlZ0MjNJcjFpcEEwbE9HNlVtS1l2d2NOSHdKVUZPU0JZT2FN?=
 =?utf-8?B?aFBrWW15V3RsY05laHQ0VVNxZER6S1Y4VUl4U0I2TmV6aWtVQVNkcXNzbWRj?=
 =?utf-8?B?aHdjV2xQWDQ3Z1p5Um82bDI0ZEZYL28rR2g2TWh3Q1dncnJVQXFWQXI0Y2FM?=
 =?utf-8?B?WGFQM0VRT2YzYTBQbEhvdWJxcHlFRUFyYjlGUmdtZkNHLytha3VQTHI0TC9Z?=
 =?utf-8?B?VUpsdkt5TzNMY2FuZFhkaXVNa1k5dzQvQncyUEt6amFicVRzTTZzNXEwMzJ1?=
 =?utf-8?B?MUdsaDhSdlUwOGNocHdway9Kd1ZQRGFVSzdyWlA4OC9oVTJOK3hoNFhvZ2dX?=
 =?utf-8?B?WDZwbkpxYVRUa1RtblM3N05mZThqWG1UbXM1em5aaFZHTTdWenRpZHRCdUtz?=
 =?utf-8?B?bitBTGdIS0dxdzVDNlBVQi9HbDhHSTEzYytYQXluNEFwcHozZ3dNUCsvcVZ0?=
 =?utf-8?B?ZkZMVU5YenhPOW9TQWFkeGs1RjFtV3dDaHppZm96eTZyTTNBTDhkNllkTXY3?=
 =?utf-8?B?Rzg4OTdGK21udVdPYnJsNE9WWnk5VjB4T1Q1VHFNT1k1TkltdnlhVjAzZk1X?=
 =?utf-8?B?Vmc5Ukx6ckRTa3hpdkFWUkNJVHhqeVlNVWpvNUxIQ2dsQVNsMXk5Y1laUE5E?=
 =?utf-8?B?Tmc0NlVReDN6WXhsUWg5aDRxR2xXTTh0d2sySGlPc1BsN2o3b0oxQk5zUjh5?=
 =?utf-8?B?M2JsbTYvMTVoSmJKbkZud1F2YXpTS0NzSHpsaWlCNHR3QWhHQ0RkdG4rWHd1?=
 =?utf-8?B?QlF2ckw4Z0hkTThlSW9BNS9RT2w4UDVDSW1CeGt2MTRuY292aEtNQmpmUHRW?=
 =?utf-8?B?SSs2Y3JubU0vZnNsQmtLR1JMTXc3MmNFVkpWUUdXM2lwZm16b3UyWUNkWS9p?=
 =?utf-8?B?VUZNL2MrL3E5UHNaYWYwTDlVdFhNUzVFYkZpTHIrVXpjVVN2T0JzZVREc1RE?=
 =?utf-8?B?ai9yVjlTbEpFNDJ6c1BRUFRBNXRPWEFQYktaanN2QkExZWQxSnRMdUtQSzA0?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 879a29ea-7559-4bae-ec5b-08dde0287e56
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 20:31:08.1110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TUIigvsUtrFFzWR7gGTPgP2NLGf436P3MLXLvMNWSiJKtCqmV4w/josSDd5Fq5TA89qgWybDe1Ja/0+xPo/M6iwfJlXkCHpNUG/g195h0eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4738
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

On Mon, Aug 18, 2025 at 10:37:29AM -0700, Lucas De Marchi wrote:
> From: Badal Nilawar <badal.nilawar@intel.com>
> 
> Enable Wa 14020001231 to block psmi interrupts during C6 entry exit
> flow. It's only enabled if PSMI is enabled in runtime.
> 
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> ---
> v2:
>  - Enable only when PSMI is enabled
> v3:
>  - s/XE_WA/XE_GT_WA/ to follow rename
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 +
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 4 ++++
>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 4 ++++
>  3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index 31dbfeee289e7..0e78351c6ef5a 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -390,6 +390,7 @@ enum  {
>   */
>  enum xe_guc_klv_ids {
>  	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOCKED				= 0x9002,
> +	GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT		= 0x9004,
>  	GUC_WORKAROUND_KLV_ID_GAM_PFQ_SHADOW_TAIL_POLLING				= 0x9005,
>  	GUC_WORKAROUND_KLV_ID_DISABLE_MTP_DURING_ASYNC_COMPUTE				= 0x9007,
>  	GUC_WA_KLV_NP_RD_WRITE_TO_CLEAR_RCSM_AT_CGP_LATE_RESTORE			= 0x9008,
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index d7da676370792..5631722f34f53 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -359,6 +359,10 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  				 GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG);
>  	}
>  
> +	if (XE_GT_WA(gt, 14020001231))
> +		guc_waklv_enable(ads, NULL, 0, &offset, &remain,
> +				 GUC_WORKAROUND_KLV_DISABLE_PSMI_INTERRUPTS_AT_C6_ENTRY_RESTORE_AT_EXIT);
> +
>  	size = guc_ads_waklv_size(ads) - remain;
>  	if (!size)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 8d0aabab67773..303a5e05d9932 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -68,6 +68,10 @@ no_media_l3	MEDIA_VERSION(3000)
>  		MEDIA_VERSION_RANGE(1300, 3000)
>  		MEDIA_VERSION(3002)
>  		GRAPHICS_VERSION(3003)
> +14020001231	GRAPHICS_VERSION_RANGE(2001,2004), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(2000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3000), FUNC(xe_rtp_match_psmi_enabled)
> +		MEDIA_VERSION(3002), FUNC(xe_rtp_match_psmi_enabled)
>  
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
> 
> -- 
> 2.50.1
> 
