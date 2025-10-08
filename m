Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BCACAC5BB
	for <intel-xe@archiver.kernel.org>; Wed,  8 Oct 2025 21:10:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDDE10E8D9;
	Wed,  8 Oct 2025 21:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqTEkxEN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4010E8D9
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Oct 2025 21:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759957855; x=1791493855;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PWQc9KDpGxVDTL3+hEuJ5EQ4uFS0CmvaxFHFERMZn1I=;
 b=MqTEkxENeFMjDw38oZVNj796JVPYJtOopNKgtbLRhMvG4SXmXCmdI7GE
 /oR8mW4QJ+/Fts21e3oOtFrCiKCfv7x+v3SOnoPL5Q5NhyE6TwmtBDzs3
 wesHX2PR6AXbjbh0bsc44uzWSuvIIw2uJnQ4jRTRIXBTJ8BJWVwrjgFPC
 fCJU1d2VgOX/0DWdRSTWLFCB1TneiE8CrEC5Z+y3NGaAMUN2pKxjtFeHh
 WD3aM/Nr5Nx9kG00YDFAolJi7F3PMbrP7BDGy2ILTXMbOdyR8OdO6Vw1p
 rVDnJCyEycpOo1JHQ5QORZ+v9s/YShra7g1atEuJvcuc+hRqSYs5WDu80 A==;
X-CSE-ConnectionGUID: WUah+oAVQ/u3wV3QbZMzPA==
X-CSE-MsgGUID: GvNvEW5PTH6nD71woar77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73509518"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="73509518"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:10:55 -0700
X-CSE-ConnectionGUID: zp9kxLKxS3+i9RY3FI+3Ng==
X-CSE-MsgGUID: vNoXSpt3QqmdUwHrgPWHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="179659364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:10:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:10:53 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 14:10:53 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 14:10:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXH4e5NyiHSy0ZnPRK70mrW2NCJ+w0bc0MVTx7MtYBOlvq0qkfbG2FN7kYkQdudOYLu2XCGF4Tx0T9yh8dtRYxQr1UMRpb2b9AT4GVBPsP318v7PW23fwt4Lqh1LO68DE1g9UWH/MIb1msy5dMJ5NdSaIAeS4hS4ONdaieXyCISP6dePjijg9QPmygpqTMigdTwhIwda3E8xXTU1jnSa2YONSyE9YGcBZzKht7b5t5+h0Q20evXXvPXG+wnYk2BCpOq8V0FHaGECrD9k0PrUo3EU3QCdzZT/dlt+Dh0Jl5bbP/dH+DDj0TA124cVI1D3+V6DR/YHbaaqgR+/vbtJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qf3+VMoua5q/CpNhi/O4Ba31vBMFkdaD4Fi7IxTqPrk=;
 b=yGcI3p/hJdtQ/4UAuJChEmo7bomqm+ze/6mWeNBb7Lg1nGNR5opKthGjVMXOntcZTflLpr3XCcJESyX/AEPiSyu7oYNhRY5vL+bLh/GO2dCEeDw/qqBc7+VyYgnimArY6SzZbWq+jKUP0+RnPkhc3OOHXk4WLfY3Jo7BIxyXuAYUNk4neL+HCWzQliRJj8u0PLLQrALg6X2/MQw36R9ePbvbTKRlZw3teoxuoZ2XJqk+WKiNkwVc8T0k7+I5EASgBCSPkyYdVPAz/MsbA5OmnDIZwlaJdoTG+L37jM711Y87IOWdwnc2i5a1mP5pE4gIIQ4zxowbWQWTauGSsaL2fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7688.namprd11.prod.outlook.com (2603:10b6:930:75::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Wed, 8 Oct
 2025 21:10:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.007; Wed, 8 Oct 2025
 21:10:47 +0000
Date: Wed, 8 Oct 2025 16:10:44 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH v4 22/23] drm/xe/configfs: Add attribute to disable GT
 types
Message-ID: <kj7sdxboehoi7pnqereoytuky4k4vpdm7bmyf27txs4jf6knp3@qyqx3qcrsase>
References: <20251007204829.1468209-25-matthew.d.roper@intel.com>
 <20251007204829.1468209-47-matthew.d.roper@intel.com>
 <c45b55d0-697d-4e3b-82d3-5cecda6362ff@intel.com>
 <20251008200853.GH5409@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008200853.GH5409@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 986fb685-b4e9-46c7-c8ba-08de06af26ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TG1GdXBCSmRoRm92alI3MXk0c2NRNzRHMmgvdFNEN0FsbUtUblpCdTFXQlFz?=
 =?utf-8?B?cEhSclVSdm9TSjdlbGlUS2RJTUc4VlhzMkFPNldtQVJIUW5nQ21RVTNDQ01Z?=
 =?utf-8?B?b050YzlLQS80NVYxY25SR0RhVWRGM1k5M0dhbkJ4RHM0bitDK1Nkc0tlUzlz?=
 =?utf-8?B?ZW1hSHluSVVmTVIvakQ4WDQ0RzcyYmNONGI3Wk5QTEtHRDN2amtxeE45S2Vx?=
 =?utf-8?B?R244cDdLbnMxZkZaRkdqNE92c2pRM1phZ0I1RitianNpOHpObWpHN2pMRFJp?=
 =?utf-8?B?b0NZMU0zME1jS29mL1Y0eEhkWnV1MzJUdFJ4QThsVXh6ejAvcExlM3pEdldO?=
 =?utf-8?B?a0I5aVc2cUN2QjR1SjNHY2hpWTh5cEEyZW1NcmY2UWpKMnlEa3luc2VCWHVI?=
 =?utf-8?B?Z0lKbjJjaGcrWWNVMS9qeVVKQzdFMFU3STFOMm50MFhsazBnWnBUczl6OEdE?=
 =?utf-8?B?U3FqbldES2VYMThiY2lWTjBnWDRQZ2FYSnU2bnZoMnFTRStBVGV5K0hRNDd1?=
 =?utf-8?B?Q0FqYkFOc21tVzFMd3lBZXdiZHhBdUEzYnhSVDc3S3N5K3pBUlA1amxMQ1Fj?=
 =?utf-8?B?WjczaDFQVGtWWnlmVWM3bUlEUFdjWklMTW9zSzhPcmJkZjUvN1ZteEVHM1N6?=
 =?utf-8?B?UFEzU2JuYlhWZGVwcHZWdmsrMld2T3orU3owb1YveTNGdlVnR1FGR2JEa003?=
 =?utf-8?B?a0h1MHh0WWs1Q1lHU1dpZ3JJNmRYZUpyYlk1UnlKaEttWWdZT3pnVmZJMHJZ?=
 =?utf-8?B?Q2FTMnlyZXFYM2xMcDNEOE9peFdlSFAxeDFGd0dlcVdkcTY0ZE5pcHpSYmg1?=
 =?utf-8?B?QVhpUmxHWGpCVUJScFlRZjVVV1B0bHZmYld2MnNtbmRHeEdtaGhTeGRpNEN5?=
 =?utf-8?B?Y0kwNnIwSU5mV0VrOTN3TTdHcTIweFlBR3kwZTJaNzRyZ1lOSmdERVBDVmxx?=
 =?utf-8?B?M3l4YjdORE84WDEvQ01qTXFIZktxVHpXcGM1QisrYWlja0dBblc1SXhHeXYx?=
 =?utf-8?B?TVc3S0NrVU84djE3Y0xpN0d6QWFHOVhwbXIveTdZWFVDVmJleXl3d3JBdEhu?=
 =?utf-8?B?MUdMWnBlUmIvbTZHVjg2MW9YTnd2VVYyaDFNa0xEbzFWalZyRzlZU0JXR0Nx?=
 =?utf-8?B?V2JUNDVjdFNpaUhvNW54UWZqMVpIL0xMWmhQT0IwNWVhZzRiSVRxRHZxbndo?=
 =?utf-8?B?U2pyL0UyYm9iQm92cHpPRHNzczFvMmIxWDRlcXltRnlLQVowSC9oQ1FzQkhh?=
 =?utf-8?B?ZXZuQ3d2NFh2UzB1aVc2Q2Q2OEE4QTZXL1FUcGppbnZIS25GSFVKYXFmVkUw?=
 =?utf-8?B?dzVZVWtjK2llc2h5L2NSM1gwNjV0RUg0c25RajdzOWZnUXNOR3g5NzIzMTZZ?=
 =?utf-8?B?ajQ4OWlES1J6VjBtQVpBRnIxamRZbER3NjFUVFpUN3lyRXhzaEhEczFBYWdy?=
 =?utf-8?B?UVpLaTl0bVB0cno4TU9zaUJMZFA3K3ZROG1MdW5yUkNpTzd4UzI1U0hycGhh?=
 =?utf-8?B?T3lHa1NXSk9OcCtwdVNUOWdqWm1vWElKVnE4dkE3cUpuck1pS0twMitDbmx6?=
 =?utf-8?B?M0E0eTJyTEMweWUvS1U3UldVRitQK1ZrVzNCMW9iUFhLKzErNElaZHZFVEVv?=
 =?utf-8?B?Z2dEbS9lb3RWUTJzazVIaGVYcms2RHJQcVpmMGExMlNqTE9ObTNFZ29RcXR6?=
 =?utf-8?B?RHJNUXBwdmoxOFYxOWE0MlpVbmg0OUduaG1xaksvNkNlUXREb2lXcm9nOUwv?=
 =?utf-8?B?bStKUXlCcEkvaUEreCtTaVRjM0dKdHgvRkI2RUpuUHdiRkJVTExBTUNLTnMw?=
 =?utf-8?B?R2s5U0tkaFF3bndMMjNkcFVPa1kzSE1EaXJ0QkNSendtaERyNGVHUHkvZTVS?=
 =?utf-8?B?S1F1VFJ1K0ZSNEszTUh4dVFRNHJWZHZDb1B2WVdheW9vbnFEVmdWTGRDd3Zi?=
 =?utf-8?Q?WllpXV+o4E1wuVPSzK751WaRlMkSagVR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d04ramhCRzA4K2RhMzJTUmdqQUpkQ1E0UDdybnRFWUJmeHR6a3dpMEQxbnd2?=
 =?utf-8?B?MVR1M0V2cWZsZlYyZ1dmdFdDaDROdWtFM3RXTjZHakZqQnQxdng5NlczY3JH?=
 =?utf-8?B?c1lONEJra1AzQlRCM05VQmhHU01GZDhnazAySEVzc0RSa1l3NlU3b1pBRUJH?=
 =?utf-8?B?QW9HeHgvWnpHVjVIUHFiMmFTYU5DMmNVblBXeHp6ZFZHWGNGYmNyRk1GWHBx?=
 =?utf-8?B?dTh4c2J2dllKTlVrWmFQRXozSW5iOXdQNGZQRDE3RnNETUk4OHV1aHdTY2FK?=
 =?utf-8?B?K3UxQU9ZbmNzVklRYXdHc0lBNS9OTWVFWmlSTnVzUjVtYk53WEFvWDNWNDBl?=
 =?utf-8?B?d2VEMDZNMmpHRE9FQnJMUWlwQTlDMDZ4VUR3ZEx0a3Q5R2JZbUtGS2ZabFJP?=
 =?utf-8?B?Z1JIb1ZCbG9YWFk4NWRvUHlkajJyclY4Y3NHbExiMDBZSWNIQTdwdm5WN0Ro?=
 =?utf-8?B?QlErZ09XS0l0ODBoSllxM1N4a21wWVd0RHdobU1pd0pzaEtTamxwRWE3NVJI?=
 =?utf-8?B?UGhQVlJEOXlFT1cwcm1TUlZHTXBwZ0tlZkxISlBFbloyZHRMNWdzZm1qcE0r?=
 =?utf-8?B?d2haY3JoNXAySDhKU2plOVRmQS9UdVhQWmNUdldHWHM1cTJnTTdnY0RIblZY?=
 =?utf-8?B?cGlxUDY3SnJIUEJXUktaeGNtcUxzYzFtSVdNZE0yUFUrVnlheEgwOGZka0Vz?=
 =?utf-8?B?ditnNzlOTEZRUzNvMVpsVFlHaG1vMXJFOGpaTW1NTzdsWGZidEkwcmdMbC9n?=
 =?utf-8?B?anBabzF3ZHNyUW1kTk41UTdtY3ZnNHBPMHg0eC9CZ2c4SFF1U2daUTUzN3Iv?=
 =?utf-8?B?OEpjcG9XTEFXZitzcEdJMmk2WWZKRWMvR0hCNUd2RnVRWXpielVGWk1CNXNK?=
 =?utf-8?B?aEcvU2xOMzRPN3dXaTdpb3hOUllTZWFnVVRsY2ljWDgzaDhGbE5FRGZxcW4w?=
 =?utf-8?B?ZnY1ZnNmR1Zib1gxNHRqemwzR3lLZlZRRjM4Qm1Eb1FIenJTRlN6UXdQM1ZU?=
 =?utf-8?B?ekpTOHU0Q0VlVmV0ZkVqaGtJdjR1djQ0aEVoVkFtbEQzbUxGQjJrdHFvVjlV?=
 =?utf-8?B?OFUxakw3dittTHVKS3ZCdzJhd2VPWGprRkJaTlRVYmRUY0xxNGNpNlkxcmlk?=
 =?utf-8?B?RktUSUlIUThoWGZkUFg5SWh2bTdaUXcvQWxnem01QkFPUjQ1SDZEMXRTKzFY?=
 =?utf-8?B?ejR5bU5XNU5maXl6d2V0ZWVLcFdhcVVKVGFHOFdzR0Y0dG9sWnhNSVY4eHpr?=
 =?utf-8?B?QTF3eEpzd1pvWDdUdkYwbEVON1ZCWmZJYUljUVJWQ0lsc2ZXam9lbldRNnNw?=
 =?utf-8?B?aG5pZ1FQL2JNK0kxM1J2cHNPQW1wQ2pLV21TTzlVSjc0cTNFb1R2QmlMUUhX?=
 =?utf-8?B?TnI5SUJYUUUxZGJjMCtCZ3BzSXRER3pVbnBCTlBEMnBkdlJHMEVCS2preFdT?=
 =?utf-8?B?QVE0bGI3RXdKcEh4ZnJHTWhjVmhmMnhhTjJkMW1SWTFTTzFYMHQzL2dBQU1x?=
 =?utf-8?B?WFZOSmNyVmhGUUc5UFhhYjcwa1Y1RC9CTTBOa0lLc0Npb005R2dieG9aWTRr?=
 =?utf-8?B?QVZlZHZhQWZmanhMYzllamNQcHhISlBtN2tYMzBoYVp2VGtONHdld2Jma3V5?=
 =?utf-8?B?OFROZnNwV1JFT3NVa3NHc3gwVmFQNytEMWE5eHl3OVIwOFN3Vjh2UW5GWjRt?=
 =?utf-8?B?dDFQNDhaVTdpa2JXNm50dkJYMGFyRTRtZEpKWXRGS3FIZk9ka3dIY3N6bWhU?=
 =?utf-8?B?VjFtdjR4SnZlN0h1RDg1dnpqZ0xiUm92Rmdud2ZJMXZUY3NRWWI4RGVGYytm?=
 =?utf-8?B?YmJnZ2FiQWhBWlNxdEdxMm5JdHFSOUVIZW1HZ1dBTFA5TWg0dVJ6Unl0eDds?=
 =?utf-8?B?bE9wdDJ0UVpjWmk5bWVoRmJsTk5hVGlsS3NYcFc4ZTViT1liOVZFcUJrOXpS?=
 =?utf-8?B?QnJXUjg0c2ZTZnRXOTg5OFdRbXlxeWZSUTlub1BsWmpzaDlBbUNyb29Nc0x3?=
 =?utf-8?B?VXFSdWVtbTVaUUQxdXJrZ2IvcUZGZEI3aEFUYUJLSWMxZitIeFpBSXk4cXUx?=
 =?utf-8?B?U1B5YjFoSHc0SVpPTVRieUROcUVsd2xXamFPTWtoYXpPU2xaY0V1dUlmdXlC?=
 =?utf-8?B?NXM2VzI3NHlwWWN3eUhDTEowZEp4MWtWM1lwOFh4RVA4bHRzdk9vMDcxQkNh?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 986fb685-b4e9-46c7-c8ba-08de06af26ed
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 21:10:47.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ivCstJ6H3QTQu6t0GLLXru+PzUZ4cD9llW1sU2cc6dPW1At7nFJWRS5A+ELijtNOJvzRvpgh7UbarVj0jfbrJZCZjY6j0qky2+PE2o6OyQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7688
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

On Wed, Oct 08, 2025 at 01:08:53PM -0700, Matt Roper wrote:
>On Wed, Oct 08, 2025 at 12:12:37PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 10/7/2025 10:48 PM, Matt Roper wrote:
>> > Preventing the driver from initializing GTs of specific type(s) can be
>> > useful for debugging and early hardware bringup.  Add a configfs
>> > attribute to allow this kind of control for debugging.
>> >
>> > With today's platforms and software design, this configuration setting
>> > is only effective for disabling the media GT since the driver currently
>> > requires that there always be a primary GT to probe the device.  However
>> > this might change in the future ---  in theory it should be possible
>> > (with some additional driver work) to allow an igpu device to come up
>> > with only the media GT and no primary GT.  Or to allow an igpu device to
>> > come up with no GTs at all (for display-only usage).  A primary GT will
>> > likely always be required on dgpu platforms because we rely on the BCS
>> > engines inside the primary GT for various vram operations.
>> >
>> > v2:
>> >  - Expand/clarify kerneldoc for configfs attribute.  (Gustavo)
>> >  - Tighten type usage in gt_types[] structure.  (Gustavo)
>> >  - Adjust string parsing/name matching to match exact GT names and not
>> >    accept partial names.  (Gustavo)
>> >
>> > v3:
>> >  - Switch to scope-based cleanup in gt_types_allowed_store() to fix a
>> >    leak if the device is already bound.  (Gustavo)
>> >  - Switch configfs lookup interface to two boolean functions that
>> >    specify whether primary/media are supported rather than one function
>> >    that returns a mask.  This is simpler to use and understand.
>> >
>> > Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> >  drivers/gpu/drm/xe/xe_configfs.c | 145 +++++++++++++++++++++++++++++++
>> >  drivers/gpu/drm/xe/xe_configfs.h |   4 +
>> >  drivers/gpu/drm/xe/xe_pci.c      |  22 +++++
>> >  3 files changed, 171 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
>> > index 139663423185..e36cc5e1bc8f 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.c
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.c
>> > @@ -15,6 +15,7 @@
>> >
>> >  #include "instructions/xe_mi_commands.h"
>> >  #include "xe_configfs.h"
>> > +#include "xe_gt_types.h"
>> >  #include "xe_hw_engine_types.h"
>> >  #include "xe_module.h"
>> >  #include "xe_pci_types.h"
>> > @@ -56,6 +57,7 @@
>> >   *	:
>> >   *	└── 0000:03:00.0
>> >   *	    ├── survivability_mode
>> > + *	    ├── gt_types_allowed
>>
>> I'm wondering if we want to keep such advance knobs at the same level as others?
>> maybe create sub-group for them, like I did for sriov?
>>
>> 	    └── tweaks
>> 	        ├── gt_types_allowed
>> 	        ├── engines_allowed
>
>That makes sense to me, although I'm not sure if it's too late to make
>this change now since I think 'engines_allowed' is already part of
>v6.17.  Are these configfs settings considered ABI that we can't change
>now, even though they're explicitly intended for driver developers?
>
>+Cc Lucas to see what he thinks.

I think we are pretty safe to say nobody but developers doing bringup of
a platform are using this. I wouldn't be much concerned at this point
that this would break anything outside of our own muscle memory.

However I don't like the tweaks dir. These are all tweaks to how the
driver interacts with the HW. For the really dangerous ones, we taint
the kernel and document them as such.

Lucas De Marchi

>
>>
>>
>> >   *	    ├── engines_allowed
>> >   *	    └── enable_psmi
>>
>> oops, and it looks that I missed to update this part of the doc when adding max_vfs with:
>>
>> 	    └── sriov
>> 	        ├── max_vfs
>>
>> >   *
>> > @@ -79,6 +81,44 @@
>> >   *
>> >   * This attribute can only be set before binding to the device.
>> >   *
>> > + * Allowed GT types:
>> > + * -----------------
>> > + *
>> > + * Allow only specific types of GTs to be detected and initialized by the
>> > + * driver.  Any combination of GT types can be enabled/disabled, although
>> > + * some settings will cause the device to fail to probe.
>> > + *
>> > + * Writes support both comma- and newline-separated input format. Reads
>> > + * will always return one GT type per line. "primary" and "media" are the
>> > + * GT type names supported by this interface.
>> > + *
>> > + * This attribute can only be set before binding to the device.
>> > + *
>> > + * Examples:
>> > + *
>> > + * Allow both primary and media GTs to be initialized and used.  This matches
>> > + * the driver's default behavior::
>> > + *
>> > + *	# echo 'primary,media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>>
>> maybe "all" as an alias?
>>
>> > + *
>> > + * Allow only the primary GT of each tile to be initialized and used,
>> > + * effectively disabling the media GT if it exists on the platform::
>> > + *
>> > + *	# echo 'primary' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> > + * Allow only the media GT of each tile to be initialized and used,
>> > + * effectively disabling the primary GT.  **This configuration will cause
>> > + * device probe failure on all current platforms, but may be allowed on
>> > + * igpu platforms in the future**::
>> > + *
>> > + *	# echo 'media' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>> > + *
>> > + * Disable all GTs.  Only other GPU IP (such as display) is potentially usable.
>> > + * **This configuration will cause device probe failure on all current
>> > + * platforms, but may be allowed on igpu platforms in the future**::
>> > + *
>> > + *	# echo '' > /sys/kernel/config/xe/0000:03:00.0/gt_types_allowed
>>
>> maybe "none" as an alias?
>
>While we could add the all/none aliases, I'm not sure it's worth the
>extra parsing hassle, since then we also need to check for nonsense
>settings like "primary,none" and such.  Since only a small subset of
>driver developers are expected to ever use these, we don't need to worry
>too much about convenience aliases.
>
>>
>> > + *
>> >   * Allowed engines:
>> >   * ----------------
>> >   *
>> > @@ -187,6 +227,7 @@ struct xe_config_group_device {
>> >  	struct config_group group;
>> >
>> >  	struct xe_config_device {
>> > +		u64 gt_types_allowed;
>> >  		u64 engines_allowed;
>> >  		struct wa_bb ctx_restore_post_bb[XE_ENGINE_CLASS_MAX];
>> >  		struct wa_bb ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
>> > @@ -201,6 +242,7 @@ struct xe_config_group_device {
>> >  };
>> >
>> >  static const struct xe_config_device device_defaults = {
>> > +	.gt_types_allowed = U64_MAX,
>> >  	.engines_allowed = U64_MAX,
>> >  	.survivability_mode = false,
>> >  	.enable_psmi = false,
>> > @@ -220,6 +262,7 @@ struct engine_info {
>> >  /* Some helpful macros to aid on the sizing of buffer allocation when parsing */
>> >  #define MAX_ENGINE_CLASS_CHARS 5
>> >  #define MAX_ENGINE_INSTANCE_CHARS 2
>> > +#define MAX_GT_TYPE_CHARS 7
>> >
>> >  static const struct engine_info engine_info[] = {
>> >  	{ .cls = "rcs", .mask = XE_HW_ENGINE_RCS_MASK, .engine_class = XE_ENGINE_CLASS_RENDER },
>> > @@ -230,6 +273,14 @@ static const struct engine_info engine_info[] = {
>> >  	{ .cls = "gsccs", .mask = XE_HW_ENGINE_GSCCS_MASK, .engine_class = XE_ENGINE_CLASS_OTHER },
>> >  };
>> >
>> > +static const struct {
>> > +	const char name[MAX_GT_TYPE_CHARS + 1];
>> > +	enum xe_gt_type type;
>> > +} gt_types[] = {
>> > +	{ .name = "primary", .type = XE_GT_TYPE_MAIN },
>> > +	{ .name = "media", .type = XE_GT_TYPE_MEDIA },
>> > +};
>> > +
>> >  static struct xe_config_group_device *to_xe_config_group_device(struct config_item *item)
>> >  {
>> >  	return container_of(to_config_group(item), struct xe_config_group_device, group);
>> > @@ -292,6 +343,58 @@ static ssize_t survivability_mode_store(struct config_item *item, const char *pa
>> >  	return len;
>> >  }
>> >
>> > +static ssize_t gt_types_allowed_show(struct config_item *item, char *page)
>> > +{
>> > +	struct xe_config_device *dev = to_xe_config_device(item);
>> > +	char *p = page;
>> > +
>> > +	for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++)
>> > +		if (dev->gt_types_allowed & BIT_ULL(gt_types[i].type))
>> > +			p += sprintf(p, "%s\n", gt_types[i].name);
>> > +
>> > +	return p - page;
>> > +}
>> > +
>> > +static ssize_t gt_types_allowed_store(struct config_item *item, const char *page,
>> > +				      size_t len)
>> > +{
>> > +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
>> > +	char *buf __free(kfree) = kstrdup(page, GFP_KERNEL);
>> > +	char *p = buf;
>> > +	u64 typemask = 0;
>> > +
>> > +	if (!buf)
>> > +		return -ENOMEM;
>> > +
>> > +	while (p) {
>> > +		char *typename = strsep(&p, ",\n");
>> > +		bool matched = false;
>> > +
>> > +		if (typename[0] == '\0')
>> > +			continue;
>> > +
>> > +		for (size_t i = 0; i < ARRAY_SIZE(gt_types); i++) {
>> > +			if (strcmp(typename, gt_types[i].name) == 0) {
>> > +				typemask |= BIT(gt_types[i].type);
>> > +				matched = true;
>> > +				break;
>> > +			}
>> > +		}
>> > +
>> > +		if (!matched)
>> > +			return -EINVAL;
>> > +	}
>> > +
>> > +	scoped_guard(mutex, &dev->lock) {
>>
>> probably plain guard(mutex) will work here too
>>
>> > +		if (is_bound(dev))
>> > +			return -EBUSY;
>>
>> then we can take a lock and return earlier, before parsing input
>>
>> > +
>> > +		dev->config.gt_types_allowed = typemask;
>> > +	}
>> > +
>> > +	return len;
>> > +}
>> > +
>> >  static ssize_t engines_allowed_show(struct config_item *item, char *page)
>> >  {
>> >  	struct xe_config_device *dev = to_xe_config_device(item);
>> > @@ -672,6 +775,7 @@ CONFIGFS_ATTR(, ctx_restore_mid_bb);
>> >  CONFIGFS_ATTR(, ctx_restore_post_bb);
>> >  CONFIGFS_ATTR(, enable_psmi);
>> >  CONFIGFS_ATTR(, engines_allowed);
>> > +CONFIGFS_ATTR(, gt_types_allowed);
>> >  CONFIGFS_ATTR(, survivability_mode);
>> >
>> >  static struct configfs_attribute *xe_config_device_attrs[] = {
>> > @@ -679,6 +783,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>> >  	&attr_ctx_restore_post_bb,
>> >  	&attr_enable_psmi,
>> >  	&attr_engines_allowed,
>> > +	&attr_gt_types_allowed,
>> >  	&attr_survivability_mode,
>> >  	NULL,
>> >  };
>> > @@ -846,6 +951,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>> >  				 dev->config.attr_); \
>> >  	} while (0)
>> >
>> > +	PRI_CUSTOM_ATTR("%llx", gt_types_allowed);
>> >  	PRI_CUSTOM_ATTR("%llx", engines_allowed);
>> >  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>> >  	PRI_CUSTOM_ATTR("%d", survivability_mode);
>> > @@ -896,6 +1002,45 @@ bool xe_configfs_get_survivability_mode(struct pci_dev *pdev)
>> >  	return mode;
>> >  }
>> >
>> > +static u64 get_gt_types_allowed(struct xe_device *xe)
>> > +{
>> > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> > +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
>> > +	u64 mask;
>> > +
>> > +	if (!dev)
>> > +		return device_defaults.gt_types_allowed;
>> > +
>> > +	mask = dev->config.gt_types_allowed;
>>
>> btw, as we are using guard during write, shouldn't we also guard during read?
>
>I'm not sure; is there something racy you see on the read path that we
>need to avoid?  An individual get_gt_types_allowed() call racing with a
>configfs write doesn't seem like it would matter; rather the problems of
>a racing configfs write would be if it happened while a device was in
>the middle of getting probed (so some calls to get_gt_types_allowed()
>see the old value and others see the new one, leading to inconsistent
>device intialization).  But given this is a low-level kernel hacking
>interface intended for driver developers, I'm not sure how much we need
>to worry about them shooting themselves in the foot.  Maybe I'm
>overlooking something?
>
>
>Matt
>
>>
>> > +	config_group_put(&dev->group);
>> > +
>> > +	return mask;
>> > +}
>> > +
>> > +/**
>> > + * xe_configfs_primary_gt_supported - determine whether primary GTs are supported
>> > + * @xe: xe device
>> > + *
>> > + * Return: True if primary GTs are enabled, false if they have been disabled via
>> > + *     configfs.
>> > + */
>> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe)
>> > +{
>> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN)) != 0;
>>
>> can't we just rely on the promotion to bool?
>>
>> 	return get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MAIN);
>>
>> > +}
>> > +
>> > +/**
>> > + * xe_configfs_media_gt_supported - determine whether media GTs are supported
>> > + * @xe: xe device
>> > + *
>> > + * Return: True if the media GTs are enabled, false if they have been disabled
>> > + *     via configfs.
>> > + */
>> > +bool xe_configfs_media_gt_supported(struct xe_device *xe)
>> > +{
>> > +	return (get_gt_types_allowed(xe) & BIT_ULL(XE_GT_TYPE_MEDIA)) != 0;
>> > +}
>> > +
>> >  /**
>> >   * xe_configfs_get_engines_allowed - get engine allowed mask from configfs
>> >   * @pdev: pci device
>> > diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
>> > index c61e0e47ed94..5624e965b911 100644
>> > --- a/drivers/gpu/drm/xe/xe_configfs.h
>> > +++ b/drivers/gpu/drm/xe/xe_configfs.h
>> > @@ -17,6 +17,8 @@ int xe_configfs_init(void);
>> >  void xe_configfs_exit(void);
>> >  void xe_configfs_check_device(struct pci_dev *pdev);
>> >  bool xe_configfs_get_survivability_mode(struct pci_dev *pdev);
>> > +bool xe_configfs_primary_gt_supported(struct xe_device *xe);
>> > +bool xe_configfs_media_gt_supported(struct xe_device *xe);
>>
>> I guess we need decide now whether we want to continue to pass pdev or switch to xe as argument for all xe_configfs functions
>>
>> >  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>> >  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>> >  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>> > @@ -28,6 +30,8 @@ static inline int xe_configfs_init(void) { return 0; }
>> >  static inline void xe_configfs_exit(void) { }
>> >  static inline void xe_configfs_check_device(struct pci_dev *pdev) { }
>> >  static inline bool xe_configfs_get_survivability_mode(struct pci_dev *pdev) { return false; }
>> > +static inline bool xe_configfs_primary_gt_supported(struct xe_device *xe) { return true; }
>> > +static inline bool xe_configfs_media_gt_supported(struct xe_device *xe) { return true; }
>> >  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>> >  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>> >  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev, enum xe_engine_class,
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index a5932e4f4a23..9c8ab2b41737 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -695,6 +695,11 @@ static struct xe_gt *alloc_primary_gt(struct xe_tile *tile,
>> >  	struct xe_device *xe = tile_to_xe(tile);
>> >  	struct xe_gt *gt;
>> >
>> > +	if (!xe_configfs_primary_gt_supported(xe)) {
>> > +		drm_info(&xe->drm, "Primary GT disabled via configfs\n");
>>
>> nit: you can use xe_info(xe, "...") now
>>
>> > +		return NULL;
>> > +	}
>> > +
>> >  	gt = xe_gt_alloc(tile);
>> >  	if (IS_ERR(gt))
>> >  		return gt;
>> > @@ -720,6 +725,11 @@ static struct xe_gt *alloc_media_gt(struct xe_tile *tile,
>> >  	struct xe_device *xe = tile_to_xe(tile);
>> >  	struct xe_gt *gt;
>> >
>> > +	if (!xe_configfs_media_gt_supported(xe)) {
>> > +		drm_info(&xe->drm, "Media GT disabled via configfs\n");
>> > +		return NULL;
>> > +	}
>> > +
>> >  	if (MEDIA_VER(xe) < 13 || !media_desc)
>> >  		return NULL;
>> >
>> > @@ -829,6 +839,18 @@ static int xe_info_init(struct xe_device *xe,
>> >  		if (IS_ERR(tile->primary_gt))
>> >  			return PTR_ERR(tile->primary_gt);
>> >
>> > +		/*
>> > +		 * It's not currently possible to probe a device with the
>> > +		 * primary GT disabled.  With some work, this may be future in
>> > +		 * the possible for igpu platforms (although probably not for
>> > +		 * dgpu's since access to the primary GT's BCS engines is
>> > +		 * required for VRAM management).
>> > +		 */
>> > +		if (!tile->primary_gt) {
>> > +			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
>> > +			return -ENODEV;
>> > +		}
>> > +
>> >  		tile->media_gt = alloc_media_gt(tile, media_desc);
>> >  		if (IS_ERR(tile->media_gt))
>> >  			return PTR_ERR(tile->media_gt);
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
