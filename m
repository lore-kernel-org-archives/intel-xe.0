Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC141C3ABB6
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 10:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA5710E076;
	Mon,  5 May 2025 10:42:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khYeK5ed";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E258310E076
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746441776; x=1777977776;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yPGZ8bgbcRCGo1tUXZY7xHbfXcFhFFEl6xv5+Dbxu5k=;
 b=khYeK5edlyw3Md9THMAMNWiHsgi8a3nyyg0zJcxsnPKnJtJUGypKktnf
 wPdg8vOtSzspxuGCWGcf61i9WzrfREPpkwu6aXmrNxMSmxe9wss147JO+
 +NLxrJfvSK6ElC0xCtecQXIWpc0f0PLH8Sb4aTNM8ueP+LhJBDBSAzhPY
 CC0vgkFJkvZ+3isoVDhpmosxoGzA1zuoacGu54UFHSG2bSN4pVEyP1IUa
 7MxFSVnYOa5lvtSq8AQM+KfdNS+LkPY9rgvCaoimvRbYRAwQXONK0huTM
 GmmaM49YmkDsXMvCSGgTj9tV64EsG9XT/NtPjP3pQ9zwwDvNxtkFVbzUV g==;
X-CSE-ConnectionGUID: EMRKbUuLQT2EIlebvUL54A==
X-CSE-MsgGUID: ciCZvPTSQWal2e123oDKCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="47951194"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="47951194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:42:55 -0700
X-CSE-ConnectionGUID: 2psTCo4/TD2nvAFSt7VGQg==
X-CSE-MsgGUID: 990BlG+WT6WnR257ogxEXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135120681"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 03:42:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 03:42:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 03:42:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 03:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pexwf2cuUCrgXWDkzPN7UdAo9RjePI8YREQJIh8L1Q9y9AnMNbmO4YnSLWCBZyAydyTjX9lcV0sRBMfU+W6T8wcCse8gtB2611x3aRhMAk2bkc9IafC5KxXzx8SqvS6Ox35m1yrN/dxLYodigPs2Rpkw6WfRsNa9GeEiojn8a/Ohj+MU+iBF8RKd3ENSQ6HCUAo8d2uLlPaZAqXVm/srTL2Qth2hL31MWr2TU0D5Zertmc/P9CiTq7HJ2ove2iTSYcOuqjxS1OGzX5kss2s7F0D25jTwW68d0vsU8Gv/s28Q3T+uueWDOiWsZ+uO1iyeJc+0NQnpv7/u8LEL8XD0SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgCsJyf9tnx68BnsvQmlTCP8KBnXmZYnVgyOEQuHUiM=;
 b=ZtmtvNjCXjv+thgHNF12CTxLb9TjDTZIlGB/4t+Wi4wTk3HzMRdT/xRsTz1bvSskJRP7EySX0oqUcpvnFgzGuPXGsGYAqN5itElanYygSJ5yGpdn7MQ9PpSrhMUKZwBVrNKJk0ivhFpvX4j4Tr0v6YGOYAX6Qi2MiVNgsxnb/ooEbjnrkOX2O2LBxOTQsZ+IjMDqUbMZSfUq7d06nrUE8CQnS785xHCmtOz5y/Yg/1HdjpxkQOqYPWfBLArtfkheUjWsskhO8wqnctIeq21BWwz9KTCAe3MW/4eNgdbioaBLS3gRwccMzjWejYlrkpUFFrw89bL3ME9EB5ll46harA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM3PPFE9E88246B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f5b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 10:42:47 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 10:42:47 +0000
Message-ID: <8e848202-84d3-4edf-8e8d-098b8ee1daff@intel.com>
Date: Mon, 5 May 2025 16:12:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/xe/hwmon: Expose powerX_cap_interval
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
 <20250430203607.926585-5-karthik.poosa@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20250430203607.926585-5-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM3PPFE9E88246B:EE_
X-MS-Office365-Filtering-Correlation-Id: aafa635b-75c3-457a-d00f-08dd8bc1937c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VjaGNVdWtLUGxWMnJ4RWoxVVppU3ROcDhLMmRRU0hHM3hGZEx1MWhLR3B3?=
 =?utf-8?B?R2ZqQ2ZrWGl5SDdqR3dyamlmRSttQmdFdC9HVVg4U3l4ZWtXK0Mxd2lZNGM0?=
 =?utf-8?B?OUozUkdDZ2ZhT3FpM3FpN1Yvem1ZdS9NV2tLZkRaU21UNi80SGNibWhubis3?=
 =?utf-8?B?RWVmZHkrbjBzS2V4eTJVWkNqN29PMFI1SW1sdkRJTzZaSVBIR0ZGTlZtVFpa?=
 =?utf-8?B?VWorR25sb1V1WmJzZDB4bjRTZUd0ZzdRYWpSYVpGSDJ0TzZTL3FTbHl6MXRk?=
 =?utf-8?B?L1gvcHcrVDBpSXVDVjF6WWFjb1Yya3hmTExpTXVXMDdTcXU1eFFDVEdDTGdN?=
 =?utf-8?B?amJPamdTMnZ5WDFmOFB0RkRCUVpVMjVDTmFDZ1VLMmk2anJQOHFWTEs1Yk9r?=
 =?utf-8?B?bDdrU3Nmdkh4Z3h6SmljV2JkRmNPYVo3RGdRVlZJNHU4bVJSSnA1YzgzMkln?=
 =?utf-8?B?UVdDenFoLzZnSiswUFJqNEpEM0ZoMFpKajJ1Tkd2ZXZkUkFkWTZOeFhnNUVt?=
 =?utf-8?B?NjhrNURYRWpKclN0K0QySG5oRm1COUo2UXY4Y2Voc01CWSsvSVhJRE9EVnhX?=
 =?utf-8?B?RTlMdENlUEovcEs3empKNkgvQm5LekpqYXdtbkFCWlYweUd5cGUrbHJGTkN2?=
 =?utf-8?B?Um82bmFCclZiVDJNY2JIcjNPOXFpSHJlNWRYS0hRS0xobEFwYUU3ak91VDQ3?=
 =?utf-8?B?Q0JVN2xxQTJ4YnhidjV5eWIzZVByUFZCLzRaa292enZqdmkxeFVxY05QUWYz?=
 =?utf-8?B?bnNZTWtWbEdyTlFjY3pZMUZqVHRRd0hFdG9aOGFmZ2h2aVlPdjBEU012UjBZ?=
 =?utf-8?B?UUNYV2g1SlpraFE4ekdMM1dxcVZLcXlrRVdxOGh4Q0w3VFdYMU9scEd1RGFv?=
 =?utf-8?B?MEYyVnllMmtZSzlwdWs3RU1YZUhBWDRNWjhra2NjV1A3ZXdjbU1wWnl2MU9y?=
 =?utf-8?B?S0pxRzlRMWg0cXA4OVYvaHN2ZVA2bU9FZDFWTk1rOHJlZmdzSUFzcURqTnMy?=
 =?utf-8?B?a1A4UlRLWW1PSFhzMEdnR0kwZGx5WG93cDlBNE1IaFJHMmZ6YWp0V2l4Mk1q?=
 =?utf-8?B?aUMwYXYvNlpwTVJMSzVjRzJHRi9mQ2FVR3Z0Uk5lRVR4RmZoZ0xyTjRYUk53?=
 =?utf-8?B?b0gweno2YmZuOHB5bGRONDY4bGZ1bmp3MTdnL0JSdUdWalFQaEwyVVFMb3ZS?=
 =?utf-8?B?K1lmdjNkSFdiWENrOTFaRzZZWFdsWjcranYzYjdWbGFxNHdjenEvMThXVEc0?=
 =?utf-8?B?ZUtjRzZXTWVYZTlYb0t3aXE3NThhQzhoM3d6WllvbmpHMytwektjRTlHRUVj?=
 =?utf-8?B?WXp3NWVXREZLNzFIUjlueVZ0QzNQUnF6L2tBY0pkKzNnNDB4M1A2NHM1OGxu?=
 =?utf-8?B?NnNPd1duQU51blIyWXFXZlVZSmtVOHBnVUJRMFluN0ZzQXoxRVl5K1BhdE9K?=
 =?utf-8?B?TkI1SVE3MUVKMUV2ajA4OXdtWWhnNXZjSXFZQVhjREp0RDh3OHNGSVdYM0dr?=
 =?utf-8?B?YVJVeVlHakhKT085SWw5OTN5Rlh3Y0VGV2tUTUhySmRFZ25RNytuVmZ6Rkhq?=
 =?utf-8?B?dlI4cU50V1N5Ui9ySUxDSFpnSzNkU0dCUHVaekhoVG5uMGJadkJFRTZyalVh?=
 =?utf-8?B?YjJ5ajdGUmlIdVNWMHc4S0JLMU5abFNPQ1pCMS9OS3Ntck51OEd0T0kwWjlL?=
 =?utf-8?B?dVFZTzJsWnNmbGlTWlhjMzY4TnNiZDV3MzdlRndwZDRIRUlKMWhxODE5NDJF?=
 =?utf-8?B?OXk4VEw0cEtab3o5VGtHb3dmTHBWcGFtc2VlakV1bU5GcWx2YXMwNS9CcDBt?=
 =?utf-8?B?N25VT3dPWHRxbW5OVGt2TXNYVDNjdHpNMzF1cUF2dEFUVUZZV3ZzRktkYWxw?=
 =?utf-8?B?UW54WTRROC94dDlQU1BpRXM4RHpSbmx6MTlGNzg2UDdSaFIzbTVOc2VDV2FP?=
 =?utf-8?Q?TlN9cHaSLGE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RkY4Vjk5c0x3K0FCdmJjdlFObjBQdEtKUUUzVTVEN1FhWC9hVXk1UXdBMXo1?=
 =?utf-8?B?a2NXWE5vWm12d3BCN1lpc1BRR1R5TDVDRlJDOXArMmNiN1ZuYWE0cWlrdXFQ?=
 =?utf-8?B?NkFCZnpnTkZrSElZalU5WFp6UGpSNVlSaEI1allqQmxjZDcyMWh0R1pSeUJT?=
 =?utf-8?B?WTRlUU40WnduOWdBYURCRU1ua1ZEUlpmQkJaQnZVWTlUdEVETzAyd1NCMzho?=
 =?utf-8?B?aXdaZGVhRDZHVWdqcUVEOFFSMUViOTg3TDBiMkFqcjBmejZNQUFpdTBKZzFk?=
 =?utf-8?B?RS9TclF0S3dyRTZjS3V4WjZSZk80RGZZMUVSRkZyUWlQTktVdUUzWjZRdmc3?=
 =?utf-8?B?cW1icjYvZkN5NzhYS2tZbDl5TUV0MVZjQWh0dTJxc3RXall1NWZTNjlidWZC?=
 =?utf-8?B?YnJZOVJlQ2JTNlVnVEtNdHFjNkFqd2NZVG1jcUNrb0lzUTRPU0ZCVG81TjNU?=
 =?utf-8?B?WnB6WDVONHVrd2lHOVFyT21YRVZ5NEs1elRHK2NYaUlsQzhENEhUN3Y1MGVP?=
 =?utf-8?B?WEIvcXQ5NTVaeDNGTjlSNVl6cUE0aGRzaS8rYUpBRmpHUmpTa0c5UjVBK09m?=
 =?utf-8?B?QmV3WEJXRzNGVjlVeG5FYXpmR3lMM3ZYUG9LTWtiUE9CNE1menpKUGw3cnF5?=
 =?utf-8?B?NnRiNlh1dlRTUWYxVzQyMU1NalBJdDYzQTRZd091U3Y1QkQ0R09ITlY0NWto?=
 =?utf-8?B?cURGek02NSsrZzRpUGhpTTZWRzloeGM3SzRIU2NWYUhjdHdKMUdBOWxRMFd0?=
 =?utf-8?B?RHp6YmVVemZRRHZPTXcwVUUycE40QkFtakV0NVozQXowUGNUeVB0bmJWUXF5?=
 =?utf-8?B?UE9RM0hZR0dRSlN5Y0hqb0V4WTlCMWVKeGRaUWM4SkxGQTU2aTdwUUdmem4r?=
 =?utf-8?B?ZW54OVBObHpDY3Q4bFQ5SFdxMDgvQWZicDY1bk9uZzhTU1U3RHkvRlFId3VZ?=
 =?utf-8?B?d0c2Z0dUUVkyc1RmZ0M5Z3FOZWc2MFIrZTBJb05KMTVGWCtGOTBXSndaRzNi?=
 =?utf-8?B?T3JRSjlVMUxmRnFobXZRU3FDN0Z3RGtocDFTZWFIZmNZUVNhMGJMMGlYN2Fm?=
 =?utf-8?B?SFFwQTdZVWYxMWthTkkyZEhIRXBab29OcklkTTBxKzJMZk5MYk1naDNOZnQ3?=
 =?utf-8?B?YmFvcFpDazVEenUxMjArVjByT1VYeUc1ZkszeEprajRZM1Ntc2JjNHE5MnNC?=
 =?utf-8?B?ZkEyNlNaS3BZMmEyOHZWMkZQVTROd1pJaXlVYm80bC9zTUtDV05pTzU3bTNx?=
 =?utf-8?B?NC9DY3o5Tk80eWNXdjlCYUUreXFkTDFHNXJ3bXFrVTAyaS9jU050Rm56M2c1?=
 =?utf-8?B?MjJOWDgyeGNka1RsNFdBVXlFV0Z2V1luUnJhRkZ1WVRjTHBVSzdqaXlkTG85?=
 =?utf-8?B?Y3hQcHg1NTM0OUtNeXl2MXZhVXozNEEycklmQ0wraHFDamVoQTRscXdrRzhj?=
 =?utf-8?B?RHRaWjVndnFMNFhkMlltV2lBdXZhLzk0MFI1aU9uZ0dXT29MN1ZPK0RDckdP?=
 =?utf-8?B?NkMyVEg0RmFEUVBHRVVEZ3E2b0JGTHYvN2NjRXZTSzJxOTNZb2g5RmpSeXgx?=
 =?utf-8?B?SE9PdlNHOFNRM0s3a1dXTkxYaUt1RUxjQVVySzh3YVR1ME5CTEw4MXQySkRp?=
 =?utf-8?B?SHVWVU84TlpOZERPRG92eVNLSDVoZ3VtMzd1OSt6VHp3ZHMxOWFvVWYrWFky?=
 =?utf-8?B?ajJVRCtQRnYwMW9TWU96Tk5BdUJZWkh3d1RnRjcvZ1Z4V2VvbTR6anRoZzA3?=
 =?utf-8?B?aTYxNzBuYXJEbDJWSExBQVRQekw4WTJzN0wrT2xSVVdvcHJ0NGc0cHlGMlhG?=
 =?utf-8?B?Y1k1UkprNzBycitxdDlvYy90T0ZEZHBJQllPLzMyRlEvcndoQ3RXeFVBODFv?=
 =?utf-8?B?SHZ4cUZwTzh5c256bnVrK2ZkMmZKQWtTUlR2UTVSZll2UlBhNFMyWENMY0tU?=
 =?utf-8?B?Rkd3TTZyK3M5QmdjcTJJVDFlSmlLUE43VG5GVW5SMERiRkkrRGNKbnl4YkIz?=
 =?utf-8?B?ZzVoQlhBS3FwcUpXZkhQV3hnMXhtZVpyanRnY3BpbUFvY245Ynd5UEJqdmM2?=
 =?utf-8?B?M25zbUFpemliOCs4RWxEWWg3T1d2MXFqa3pmS2Vrd2I0SmozM1VTenBBNWVB?=
 =?utf-8?B?MG1kQUJjRDM2VXBsVURnSEE0Y3JMRHp2dE4xS3BNT2dVYkdsRkVvR21UOXlj?=
 =?utf-8?B?UFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aafa635b-75c3-457a-d00f-08dd8bc1937c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 10:42:47.7994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApVHDxd5EGX4dIPpkDClAY57HTtbNYZSVPr+zjNPjPY2BKcskGc3OlHd0UnNATKLF5E4+4wVUZs5ldRAfnv/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFE9E88246B
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


On 01-05-2025 02:06, Karthik Poosa wrote:
> Expose powerX_cap_interval to manage burst power limit time window.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon    | 18 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                  | 16 +++++++++++++---
>   2 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 9dc2ee348aa6..124fa0883924 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -176,3 +176,21 @@ Description:	RW. Package burst (PL2) power limit in microwatts.
>   		limit. Writing values > 0 and <= TDP will enable the power limit.
>   
>   		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap_interval
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card burst power limit interval (Tau in PL2/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap_interval
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package burst power limit interval (Tau in PL2/Tau) in
> +		milliseconds over which sustained power is averaged.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 115758c88175..ada8c15829a3 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -473,7 +473,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>   	u32 x, y, x_w = 2; /* 2 bits */
>   	u64 r, tau4, out;
>   	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
> -	u32 power_attr = PL1_HWMON_ATTR;
> +	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>   
>   	int ret = 0;
>   
> @@ -528,7 +528,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>   	u64 tau4, r, max_win;
>   	unsigned long val;
>   	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
> -	u32 power_attr = PL1_HWMON_ATTR;
> +	u32 power_attr = (to_sensor_dev_attr(attr)->index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>   	int ret;
>   
>   	ret = kstrtoul(buf, 0, &val);
> @@ -612,10 +612,20 @@ static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>   static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>   			  xe_hwmon_power_max_interval_show,
>   			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
> +/* PSYS PL2 */
> +static SENSOR_DEVICE_ATTR(power1_cap_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL2);
> +/* PKG PL2 */
> +static SENSOR_DEVICE_ATTR(power2_cap_interval, 0664,
> +			  xe_hwmon_power_max_interval_show,
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL2);
>   
>   static struct attribute *hwmon_attributes[] = {
>   	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
>   	&sensor_dev_attr_power2_max_interval.dev_attr.attr,
> +	&sensor_dev_attr_power1_cap_interval.dev_attr.attr,
> +	&sensor_dev_attr_power2_cap_interval.dev_attr.attr,
>   	NULL
>   };
>   
> @@ -626,7 +636,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>   	int ret = 0;
>   	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
> -	u32 power_attr = PL1_HWMON_ATTR;
> +	u32 power_attr = (index > 1) ? PL2_HWMON_ATTR : PL1_HWMON_ATTR;
>   	u32 uval;
>   
>   	xe_pm_runtime_get(hwmon->xe);
