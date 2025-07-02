Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB23C83013
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 04:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38CC10E661;
	Wed,  2 Jul 2025 04:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kn8z6lev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D1410E643
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 04:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751431871; x=1782967871;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TCdo8dNTe59hABYcwgjYnugDoUnfvxinJKG42Cmdkss=;
 b=kn8z6levCOlVVtrxKjXTOL317P/sQHPFAVFs3DgLu9whvfPAz94yR2gy
 0AgDRCnglc1xWGHglT7Cq5Sip+4yCKUtU1fbPtevPiNhIUWTBI6G4CPVi
 8GjOFkYtqCzfTYL5hSvdYhEceAiE02j7M8FuL/Fyzt59qjoqb61SfDywl
 QoofFLIByuGW4JQLG/A3hgJQfU0us/2lshbjGV0kLeHsJZp6BfCqhQyFk
 dhTIpRkIiaJG2FxLRkFmKWLUZPBD83T5ZK7L8uU0Z9OkiMQriwD7Md1ls
 vbn2JaVYPxhQPsSmL3HK+RgZgHLCw05eoJCxOoC/vQt+lOyChzgwJNoFo A==;
X-CSE-ConnectionGUID: 4r5kvjzsS96qWMVX9SjCPw==
X-CSE-MsgGUID: NlZEeibhSIiFWQT3t6TZXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53645902"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="53645902"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:51:10 -0700
X-CSE-ConnectionGUID: wFntQRJxTbS0TTJrIr5DPg==
X-CSE-MsgGUID: iM6a5KioRLqjhRiOCbXprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; d="scan'208";a="185005876"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 21:51:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:51:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 21:51:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 21:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeF+TOW/Z3v5rdtPpUN6vN3bRTHFxV8ydWtldqYBRObiEukXNYN6g5QE1vB+hgGYLKchuKXJmFxTcR+adiuNCF385DbVdt34n+MpgMlWC+L8FXXMmxugR5D6LBnIusuyWw/SB51hxo0bUyxl5fxNJf0toG+3+3TI8h5aG64Cw+YtpJeJ3nikF6PlHrYzqOfO7MVrog5TqUoNBRNPnTF4devLStiaSNqGHcECSa2qnQQCxl8xDouYTFrRG5E2H70PwKqmt9t24dIJ0pfffUtb0LGNfGtgaitqDcbXLv5lalDn2K/W7rxCmMCdGqPNzbeFaAFTkBvjYA9987/gWMMXZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUBnTXYM3RfTXSISq8k9B567N7W7B/xlZFTFF5xqQ6U=;
 b=nuKwXi0+gHBOSjNHUrlv8fduKOWdXlM0aTraLLfyzc9q/AJ1/vm7h6FqdXkQxl/3cI4HLJ7aYofEHiB4UmVkl+p/PLhjbZZroBKg7tp4osVibvJH84SuniFCdVd5e+hZ9JyPFTq/dVuyaAdUr1iasoL9cUKz4oIPfazd5w/9aTsE5ypEhBt16IM5/xrhcls0PXmZOM2vtRhzdx/IyxKhKZbaIfaydJjchWjL6MYKaJJNg09Gz1nJsn03NGgKgkK2VgZKKMblXRZ/JE0e7lbH2E+o+OEMWRL0vwgtyDPft1RB7IKE5rxcrWRbTIXwjePudoCRoY964fy0YqlRUK5JOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6480.namprd11.prod.outlook.com (2603:10b6:8:8d::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 04:50:39 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 04:50:39 +0000
Message-ID: <08deed6f-7526-4447-800b-8aa12de4d26a@intel.com>
Date: Wed, 2 Jul 2025 10:20:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/xe: Track maximum GTs per tile on a
 per-platform basis
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20250630173438.2342706-8-matthew.d.roper@intel.com>
 <20250630173438.2342706-10-matthew.d.roper@intel.com>
 <2648dfda-07d6-4ba2-a6e1-649d06ae5325@intel.com>
 <20250701165517.GK4868@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250701165517.GK4868@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6480:EE_
X-MS-Office365-Filtering-Correlation-Id: 658afd50-f08d-44ef-d3af-08ddb923fd99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yjd3blYzK2x2R2k3U2RUZ0NKMlFiMDFGWHNFWUlrQ20zODVGZU4rby84MFV3?=
 =?utf-8?B?Ykp3MXh1L2FqYXd6NjlkN0FkZmNGTzZVOGNNbldkT2lacWRQWkIzNzZLODB2?=
 =?utf-8?B?MUNpK2p1SkhYbEIrUzBudjMydU9jUUNicFhwcEZZMllvNTJlUTNQbFJ5a2Ry?=
 =?utf-8?B?bVJ5enJ3SGRDMXZwQnRZVk9ya3dycUlLejY4Nm1EMi9BZmp5VzZuNTlmTWxZ?=
 =?utf-8?B?T2JPdEhyM0tKQ29PTUhKR3dreTlRbXYzMmlIemJCZkgwZDdiTGxLb1EySDFV?=
 =?utf-8?B?OC8yUUpMRlo3VHRDOEFVY281RThSN3VTZS8rN1VQOHZqRUxzc0JBUzhMNzlZ?=
 =?utf-8?B?T3NyVDNZd0VuaVZFcytlR25Tc29oZ0l4UkkyYVBMN2RFTXUzQWh6UmxYYktk?=
 =?utf-8?B?L0JXalRhRjRFK0dkNlRqdllHZ0VrZFY2NzNrWWlCQlJya0RhNW5qUVVVWnlh?=
 =?utf-8?B?NXk5bUNWVTRzdEtTNlNLeG81M0dsaHd1cUtKUEtGTzYxcFFNdjhBcCtJOU9l?=
 =?utf-8?B?d3Y1UC9Cdmc1bERpK1drL05oQWV1TzN5YndCVWMwMTA1QTlBSStsV0MxQ09F?=
 =?utf-8?B?N0lYRVhwNFMvb0ZnVk9ERWpLRDFodHFQd3pzRDQwblVHQ3RZU0tRQkFaTnl1?=
 =?utf-8?B?NTBOcDNzK095RGFoMGNFT3VyN1NCM2VhNllyQ2VJTFlYbE1HR2s1bklTaW50?=
 =?utf-8?B?U3ZVTFR3cEMvRk9ISXRjMGhLTnJaUWdtM3hhOC9nMDQyV1QyWXBHWjNWZ3dp?=
 =?utf-8?B?NCtTZllMazdwWmlvdXF3T2RwbWx4WGpFd2kvdndzMmJONWZqUktya3dKRVlF?=
 =?utf-8?B?WXo0YjJzR1FJUU45eWZvamtxNmlsYnQrbnJOYWc0YVJBVTJPRGt5NGw3Njlu?=
 =?utf-8?B?UXJXcks3WVJacVpxNXBBdFd4YThwcERzSHVGWUJ4WDdnVjIvMTdSdnRDb2lX?=
 =?utf-8?B?ZVRES3dxSXEvdnhhM1hkTWZSSGlTZnRqTE5idnZBN3BjNVN2RDlxTnpGdzg4?=
 =?utf-8?B?K1pBNTI0Qi9kcm5lMlp2M2pvcmxqZ0srdlJ4bzlBTjRiaUxKUWhkWlpzdm4z?=
 =?utf-8?B?dmFPZGh2ays0cTRlaXJTU24vb0NKaG9sa0xZRDV4eSt5cnd2TU5jS0pBa25R?=
 =?utf-8?B?Y3JWS0xWMTBTT2VRelo3SE1aaFA0cFVYODcyZUhjT3BGUGNvc1lzbkM2QzZI?=
 =?utf-8?B?djUxRVJ0bTgzeWhGMjZNVER3dHMyTjUrM053M2ozNHhnUTF2MmYxYmxlZjhz?=
 =?utf-8?B?SUZXb1hGQncvRW8wVlV3d3VZdE5rK0JVZjZ1TnhueDJBL1VzQS9EVkFEOXYx?=
 =?utf-8?B?cm93cWplVU1WRlg1Q05VSXlzUlVCV2l2ZGdPaXZYSThSTWtjVWp5NmZLcmcz?=
 =?utf-8?B?OEE4dE5IUmNHSFZIUTlMaTRGVDFpRWFzd2hnZlN4MUNERHVvMXV0OWJyRDh1?=
 =?utf-8?B?eEFXMFlyellVY2VTQlUzZXl4TGJKdjJ2ekZvaU1tOGlNOXArYmJ2RTZQL1c2?=
 =?utf-8?B?L3l2Q3RFcHN0SUo3R01EQkFaOWlWVjdzRWxWeExtdy9wZ0IvQ3pMTksyUERh?=
 =?utf-8?B?VjN2ZWxqTkp2eEVVSXVjdlA3amJCMXZ5dFhtUlBTaWcxQ1E5ZHJRckJDOUJR?=
 =?utf-8?B?bUR4TzNzU0JidVdZWENPeVgvck5QQnZNZU9vQklGU3dwZjVLZ3FTdUhrdkcy?=
 =?utf-8?B?TFJsbGJZTVVyNDVVaFlOaE1iejhhMkgwNUFoRFV1c2E4ZEJBUGNESmZSRmhC?=
 =?utf-8?B?RTRUaHJFMHUybjVsTmxYZ2EvTnVjOW03QWd1YVR2cHhhaGk3cm1laVk5YkFF?=
 =?utf-8?Q?JixllYOS0FkfA7Q3TZathybuJqqoK/MqifSoI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjRSWjhTYjRmL0d6di92OFI5aEdYSC9DS3pKVWx3azdDZ1BSWHg0ZmZ1S0R4?=
 =?utf-8?B?UGhSNGpTK0syMFBZb3hmNGpHS01ZV01yVStFT0NxRDVVRDQycmtSVWgybEV6?=
 =?utf-8?B?Qlo0VDB1RXY1UHM4OWYydG80VkJ5QWF6dG5wWWJXY0o5T0oxRlRlZEd3cXdH?=
 =?utf-8?B?TzFlUEhuUGlPN29UMVRvNllvVXFyMnVhUkRRL3d2UC9WS2Z5c2JLWmFGM3pX?=
 =?utf-8?B?WDdwRkl4V2pkTXFNemEyZloyeFhidFY2YXVRNWlXUDlOcUVvazh5anVwZmtq?=
 =?utf-8?B?MXJPUHpRWVhQRWQvSjdlRnpLQ1U4amo0SERibXNvcDNVT2tTL0MwMWNzaURE?=
 =?utf-8?B?YWVSNWhmUnBpeS9ZTWhVVmJidFhMaHhUQ3gxRmFrR05uZzhtRnBVSTlibUVS?=
 =?utf-8?B?UWZBNU5VYkIzWjl1TDJpSUVFR0c0bXUxMnkzZjl2Qktmc2t0Nk5tRTNlZUtw?=
 =?utf-8?B?L2FBZGJYeUhxZFRWQWs4WTBtakc1RG5RTVZHdTREcWVPa3VpNkxnRlhPTGhv?=
 =?utf-8?B?azU5ODhvQWtCdCtBNlJQNzJ3OVRNaDBRbm5neWJ6Uk1LSXROR253SnZkZC9o?=
 =?utf-8?B?SlVaWnR6TFVaRm9XOEtnY1lzdkxJRkJkTXYvV216dnJNRUhXajRZTnFuYU1R?=
 =?utf-8?B?SHFQOHVTOFdGb1FEbm5TcnFIc2RMYUMvdWl5VWV4eDBiWkgrS3VFMnEzVWRp?=
 =?utf-8?B?eEtUNmFSUWpFVnhxaG9GYzRqSUNxY0g2MTFPWTJWMnZnQlE0QVhWV2VnWXZS?=
 =?utf-8?B?bnJiRHVVQjFGUXJOb3JMYnVjNjgvYXNrWmI1ZEZEMHBjV2xVZ3BrZHdNQ3Vj?=
 =?utf-8?B?d0dZeWlnd0p4NG04aVVNci9WaWVXRzVjME1tQVdkZFhyc0t5ZWdZcTR2SS9I?=
 =?utf-8?B?b0xxRFphY24wZ2JlZWJrQUxkQkxkTFh2TXhYUFF0K3Q0anFJQjQyZExQamdK?=
 =?utf-8?B?MFR3MG5sRGd6aG9QM1VYaXFrSTAvR0MreWF1UW9IL29iMnFXdlJBajBaUTlp?=
 =?utf-8?B?L01McVZxY056VkFYWlF0NFZ0Nnc0SXJ6b1V3cWtoak9qTHFBZnVwckhNZjMz?=
 =?utf-8?B?a1VYK0VoeHREUC9vSXQ5QzZvTS81NmQ1V3pMYU8rcmtXQjQ4KzZoaUNadnJG?=
 =?utf-8?B?Q0doLy9wQnIrY3lwNUdZaS9NN29zR3VuaHFGNWVpTFI5bFdVOGNtY3hhTUZT?=
 =?utf-8?B?azlVYmh1UURKL01NZG8wVFArdlB0SkNGZE5KbFcyZVNxM0h0SUkxMk8xU3Jn?=
 =?utf-8?B?VFRJdE5GWWFLSzM4SHBFTXdGSGtsQnZVZlA2MHloditSdHBtZEgveGpEN3V6?=
 =?utf-8?B?TmpENFJaelVIODloSm9mYlp1dEUxaDJOZEhmcVZHRStpbDMwRi9RVnJhcGJ3?=
 =?utf-8?B?V0VpSWltcHVqUm5Ed1JaRG1hS0VvaiswT1gyN3JDdFg4ZTRwakZKRnlkUytp?=
 =?utf-8?B?ejRtQ21ORDBpMTRTN0FLVjBzUDJLU0V0WjJMOWNRYzlqeGNPZzlYN0FzVW02?=
 =?utf-8?B?d2doQnh1WFBZOFl6SFgvcW82YWZYNW40VGhGSlNQcW9tVGVZbVBkM3JVUytp?=
 =?utf-8?B?bTNBV211cVJBWTh5T0h6QkRseFVtajJVOUVrRTUvNDI3R0pEVGl3eDV6VDhQ?=
 =?utf-8?B?cWhyaHpMOTNGMDNJNCt4bDJ6SEFMQzA5V1l1MTNmckFGRkk3SkVYTXBkNWN5?=
 =?utf-8?B?TlFhZ2dDd0hFRE9wQnI5TUlwRjljL2VobDJPVkZJbHhmVTZqSWtWcStab01T?=
 =?utf-8?B?OTR6eGxnL2R2OGdUOUJsTlQ3RWVtK0JHb1FyS2RBNk5sZDU4Z3VYWEk0ZG5u?=
 =?utf-8?B?QzBxUFJNYjZYRHExV0RKaG9oVFlsOGdIRnE0a2owNHpPZFF4TldoVUtjQXZ0?=
 =?utf-8?B?S1JFeXVITG1qQU04c3BOQ3NNMTF0Z3lTaHVNcVZtTDVndnJEbzBKcFR6VFls?=
 =?utf-8?B?VkNHNnBwRXpwV1RJUTlKczEzakF5QzY5d3lidnIzOUxMeG9VWDhrdHIyT1g3?=
 =?utf-8?B?M1ZDYkFIVkVnQUdWa3VzK3BDYU11WlI1ejlaRGdwQUJJYjI0cjlKckhMa0dp?=
 =?utf-8?B?R3BZakJ4Q09ZYjBYU2tRMitEOEJydGNxdldTb3VQNjhYVDk5VDZoNW1NQjZm?=
 =?utf-8?Q?lhHrjfyXNkOfCTPkp7D8w1bux?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 658afd50-f08d-44ef-d3af-08ddb923fd99
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 04:50:39.6553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JLMLsALnfVQ+vAhWj0FDM4Lv/mnGxXmhbpmJrzGGeDwuzFb2uqBKVZnnxejmDu2DHkF+q+d0oM7/5m893pHnyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6480
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

Hi Matt

On 7/1/2025 10:25 PM, Matt Roper wrote:
> On Tue, Jul 01, 2025 at 10:35:50AM +0530, Riana Tauro wrote:
>> Hi Matt
>>
>> On 6/30/2025 11:04 PM, Matt Roper wrote:
>>> Today all of our platforms fall into one of three cases:
>>>    * Single tile platforms with a single (primary) GT
>>>    * Single tile platforms with two GTs (primary + media)
>>>    * Two-tile platforms with a single GT (primary) in each
>>>
>>> Our numbering of GTs has been a bit inconsistent between platforms
>>> (e.g., GT1 is the media GT on some platforms, but the second tile's
>>> primary GT on others).  In the future we'll likely have platforms that
>>> are both multi-tile and multi-GT, which will make the situation more
>>> confusing.  We could also wind up with more than just two types of GTs
>>> at some point in the future.
>>>
>>> Going forward we should standardize the way we assign uapi GT IDs to
>>> internal GT structures.  Let's declare that for userspace GT ID n,
>>>
>>>     GT[n]'s tile             = n / (max gt per tile)
>>>     GT[n]'s slot within tile = n % (max gt per tile)
>>>
>>> We don't want the GT numbering to change for any of our current
>>> platforms since the current IDs are part of our ABI contract with
>>> userspace so this means we should track the 'max gt per tile' value on a
>>> per-platform basis rather than just using a single value across the
>>> driver.  Encode this into device descriptors in xe_pci.c and use the
>>> per-platform number for various checks in the code.  Constant
>>> XE_MAX_GT_PER_TILE will remain just as the maximum across all platforms
>>> for easy of sizing array allocations.
>>>
>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_device.h       | 41 +++++++++++++---------------
>>>    drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>>>    drivers/gpu/drm/xe/xe_pci.c          | 18 ++++++++++++
>>>    drivers/gpu/drm/xe/xe_pmu.c          |  4 ++-
>>>    drivers/gpu/drm/xe/xe_query.c        |  2 +-
>>>    5 files changed, 43 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index e4da797a984b..4e719d398c88 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -60,35 +60,32 @@ static inline struct xe_tile *xe_device_get_root_tile(struct xe_device *xe)
>>>    	return &xe->tiles[0];
>>>    }
>>> +/*
>>> + * Highest GT/tile count for any platform.  Used only for memory allocation
>>> + * sizing.  Any logic looping over GTs or mapping userspace GT IDs into GT
>>> + * structures should use the per-platform xe->info.max_gt_per_tile instead.
>>> + */
>>>    #define XE_MAX_GT_PER_TILE 2
>>> -static inline struct xe_gt *xe_tile_get_gt(struct xe_tile *tile, u8 gt_id)
>>> -{
>>> -	if (drm_WARN_ON(&tile_to_xe(tile)->drm, gt_id >= XE_MAX_GT_PER_TILE))
>>> -		gt_id = 0;
>>> -
>>> -	return gt_id ? tile->media_gt : tile->primary_gt;
>>> -}
>>> -
>>>    static inline struct xe_gt *xe_device_get_gt(struct xe_device *xe, u8 gt_id)
>>>    {
>>> -	struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>> +	struct xe_tile *tile;
>>>    	struct xe_gt *gt;
>>> -	/*
>>> -	 * FIXME: This only works for now because multi-tile and standalone
>>> -	 * media are mutually exclusive on the platforms we have today.
>>> -	 *
>>> -	 * id => GT mapping may change once we settle on how we want to handle
>>> -	 * our UAPI.
>>> -	 */
>>> -	if (MEDIA_VER(xe) >= 13) {
>>> -		gt = xe_tile_get_gt(root_tile, gt_id);
>>> -	} else {
>>> -		if (drm_WARN_ON(&xe->drm, gt_id >= XE_MAX_TILES_PER_DEVICE))
>>> -			gt_id = 0;
>>> +	if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile)
>>> +		return NULL;
>>> -		gt = xe->tiles[gt_id].primary_gt;
>>> +	tile = &xe->tiles[gt_id / xe->info.max_gt_per_tile];
>>> +	switch (gt_id % xe->info.max_gt_per_tile) {
>>> +	default:
>>> +		xe_assert(xe, false);
>>> +		fallthrough;
>>> +	case 0:
>>> +		gt = tile->primary_gt;
>>> +		break;
>>> +	case 1:
>>> +		gt = tile->media_gt;
>>> +		break;
>>>    	}
>>>    	if (!gt)
>>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>>> index 7e4f6d846af6..78c4acafd268 100644
>>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>>> @@ -294,6 +294,8 @@ struct xe_device {
>>>    		u8 vram_flags;
>>>    		/** @info.tile_count: Number of tiles */
>>>    		u8 tile_count;
>>> +		/** @info.max_gt_per_tile: Number of GT IDs allocated to each tile */
>>> +		u8 max_gt_per_tile;
>>>    		/** @info.gt_count: Total number of GTs for entire device */
>>>    		u8 gt_count;
>>>    		/** @info.vm_max_level: Max VM level */
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 824461c31288..316031854c26 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -57,6 +57,7 @@ struct xe_device_desc {
>>>    	u8 dma_mask_size;
>>>    	u8 max_remote_tiles:2;
>>> +	u8 max_gt_per_tile:2;
>>>    	u8 require_force_probe:1;
>>>    	u8 is_dgfx:1;
>>> @@ -208,6 +209,7 @@ static const struct xe_device_desc tgl_desc = {
>>>    	.dma_mask_size = 39,
>>>    	.has_display = true,
>>>    	.has_llc = true,
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    };
>>> @@ -218,6 +220,7 @@ static const struct xe_device_desc rkl_desc = {
>>>    	.dma_mask_size = 39,
>>>    	.has_display = true,
>>>    	.has_llc = true,
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    };
>>> @@ -231,6 +234,7 @@ static const struct xe_device_desc adl_s_desc = {
>>>    	.has_display = true,
>>>    	.has_llc = true,
>>>    	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    	.subplatforms = (const struct xe_subplatform_desc[]) {
>>>    		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
>>> @@ -248,6 +252,7 @@ static const struct xe_device_desc adl_p_desc = {
>>>    	.has_display = true,
>>>    	.has_llc = true,
>>>    	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    	.subplatforms = (const struct xe_subplatform_desc[]) {
>>>    		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
>>> @@ -263,6 +268,7 @@ static const struct xe_device_desc adl_n_desc = {
>>>    	.has_display = true,
>>>    	.has_llc = true,
>>>    	.has_sriov = IS_ENABLED(CONFIG_DRM_XE_DEBUG),
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    };
>>> @@ -278,6 +284,7 @@ static const struct xe_device_desc dg1_desc = {
>>>    	.has_display = true,
>>>    	.has_gsc_nvm = 1,
>>>    	.has_heci_gscfi = 1,
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    };
>>> @@ -301,6 +308,7 @@ static const struct xe_device_desc ats_m_desc = {
>>>    	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>>>    	.pre_gmdid_media_ip = &media_ip_xehpm,
>>>    	.dma_mask_size = 46,
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    	DG2_FEATURES,
>>> @@ -312,6 +320,7 @@ static const struct xe_device_desc dg2_desc = {
>>>    	.pre_gmdid_graphics_ip = &graphics_ip_xehpg,
>>>    	.pre_gmdid_media_ip = &media_ip_xehpm,
>>>    	.dma_mask_size = 46,
>>> +	.max_gt_per_tile = 1,
>>>    	.require_force_probe = true,
>>>    	DG2_FEATURES,
>>> @@ -328,6 +337,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>>    	.has_display = false,
>>>    	.has_gsc_nvm = 1,
>>>    	.has_heci_gscfi = 1,
>>> +	.max_gt_per_tile = 1,
>>>    	.max_remote_tiles = 1,
>>>    	.require_force_probe = true,
>>>    	.has_mbx_power_limits = false,
>>> @@ -340,6 +350,7 @@ static const struct xe_device_desc mtl_desc = {
>>>    	.dma_mask_size = 46,
>>>    	.has_display = true,
>>>    	.has_pxp = true,
>>> +	.max_gt_per_tile = 2,
>>>    };
>>>    static const struct xe_device_desc lnl_desc = {
>>> @@ -347,6 +358,7 @@ static const struct xe_device_desc lnl_desc = {
>>>    	.dma_mask_size = 46,
>>>    	.has_display = true,
>>>    	.has_pxp = true,
>>> +	.max_gt_per_tile = 2,
>>>    	.needs_scratch = true,
>>>    };
>>> @@ -359,6 +371,7 @@ static const struct xe_device_desc bmg_desc = {
>>>    	.has_mbx_power_limits = true,
>>>    	.has_gsc_nvm = 1,
>>>    	.has_heci_cscfi = 1,
>>> +	.max_gt_per_tile = 2,
>>>    	.needs_scratch = true,
>>>    };
>>> @@ -367,6 +380,7 @@ static const struct xe_device_desc ptl_desc = {
>>>    	.dma_mask_size = 46,
>>>    	.has_display = true,
>>>    	.has_sriov = true,
>>> +	.max_gt_per_tile = 2,
>>>    	.require_force_probe = true,
>>>    	.needs_scratch = true,
>>>    };
>>> @@ -616,6 +630,10 @@ static int xe_info_init_early(struct xe_device *xe,
>>>    	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>>>    				 xe_modparam.probe_display &&
>>>    				 desc->has_display;
>>> +
>>> +	xe_assert(xe, desc->max_gt_per_tile > 0);
>>> +	xe_assert(xe, desc->max_gt_per_tile <= XE_MAX_GT_PER_TILE);
>>> +	xe->info.max_gt_per_tile = desc->max_gt_per_tile;
>>>    	xe->info.tile_count = 1 + desc->max_remote_tiles;
>>>    	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>> index 69df0e3520a5..94a8e1db71e4 100644
>>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>>> @@ -160,7 +160,9 @@ static bool event_gt_forcewake(struct perf_event *event)
>>>    static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>    			    unsigned int id)
>>>    {
>>> -	if (gt >= XE_MAX_GT_PER_TILE)
>>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>>> +
>>> +	if (gt >= xe->info.max_gt_per_tile)
>>>    		return false;
>>
>> This will not work.  For pmu events, gt will be across multiple tiles.
>>
>> Here for example, if a tile has 2 gts and there are 2 tiles. Then a valid gt
>> id is 3. But max_gt_per_tile is 2. So it will return a false
> 
> So it sounds like the change here is an accurate conversion of the
> existing code (changing the global constant XE_MAX_GT_PER_TILE into a
> platform-specific xe->info.max_gt_per_tile value), but the original
> logic is already problematic? 

Yes the original logic is problematic. Have sent a separate patch
too.

> In that case we should probably fix this
> as a follow-up patch to avoid mixing two different kinds of changes into
> the same patch.>
>>
>> Can we have
>>
>> if (gt_id >= xe->info.tile_count * xe->info.max_gt_per_tile) or a
>> xe_device_get_gt check similar to
>> https://patchwork.freedesktop.org/series/150943/
> 
> If we're trying to make sure the GT itself is valid, then it would
> probably be easier (and more accurate) to just do
> 
>          if (!xe_device_get_gt(xe, gt_id))
>                  return -EINVAL;
> 
> since that would also accurately raise an error on unused GT IDs that
> fall in the middle of the valid range.  E.g., if a platform only has GT
> IDs 0, 2, and 3 (media fused off on the first tile), then it would warn
> if an ID of 1 is passed too.

Yeah this should be the case. If the gt id passed in pmu config does not
exist then it should return event not supported

Thanks
Riana

> 
> 
> Matt
> 
>>
>> Thanks
>> Riana>
>>>    	return id < sizeof(pmu->supported_events) * BITS_PER_BYTE &&
>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>> index e8e1743dcb1e..e615b0916217 100644
>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>> @@ -141,7 +141,7 @@ query_engine_cycles(struct xe_device *xe,
>>>    		return -EINVAL;
>>>    	eci = &resp.eci;
>>> -	if (eci->gt_id >= XE_MAX_GT_PER_TILE)
>>> +	if (eci->gt_id >= xe->info.max_gt_per_tile)
>>>    		return -EINVAL;
>>>    	gt = xe_device_get_gt(xe, eci->gt_id);
>>
>>
> 


