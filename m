Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C9CA1017
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 18:56:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03DB910EC34;
	Fri,  5 Sep 2025 18:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UXsjVwS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DE410EC34
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 18:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757098581; x=1788634581;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rY0D3EZ8C92M/U/lTtcz29MsqKY+jwSouecT+h65qms=;
 b=UXsjVwS1sjiHGwXgL0gum/zMSoucZxT1BcCR4v3xVozYlqc3KjR/J6CH
 oErQRWxo0ALLo463zJPJsyKEoVMZu8juhDpx8chYAltbgFGTFeLek7G20
 Fy+bpkWQwvqvIKD+qrRmAR+gBUP1aIeUUOMLHRKz4UebGYjrpk7oWwiJr
 MmJtZciWv2N+oxtf+XSUUDiQrrsnv+D9GRRotWv5xT/BsWem83aAM7W7s
 FD4dmj4hXlUMRyYMG50SFUfrjxOR88UWJ5It+5hC/FAEcjbM8VBSrqCQw
 hQSsqTtmGTbV0vAlRYCLTOP7WNYaz4OrkZBj3YaoZSGFlBkrL79dLwT5a Q==;
X-CSE-ConnectionGUID: /jPabbC0SiKmfLwi/A8d0Q==
X-CSE-MsgGUID: WRVxGpnRSuuJakdHzuSZ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58490602"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="58490602"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:56:21 -0700
X-CSE-ConnectionGUID: r0Hh30n1S3aUevJEEGWAjQ==
X-CSE-MsgGUID: nRMJ/3QWTvW8HY+07katog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="209399589"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 11:56:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:56:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 11:56:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.62)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 11:56:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n4hN0ALybEUA1gIFNwHkxnDkWyKqFVfrdPx4fUjha6Nfk5GUwBKQfyuoBXJjZE9qnu9gbNUfsgX0DLFu3rQwh0VuOJFb112jgEmAoGGNn2u/0V46lEFMV2LGTfz3QmgfkEL3j46TOTvwLbXG6VUrmZoDbCEe28kzE4jRjtmi4ejRghO6ScFXDkaQJ4BuMfLZX4J4O730MoSzWjyOxSmJoSAiz27/cJPGdoOSXxN3muJPCKAboJiXIvT3WubYk0VCtMaX0Wz3cPJbmmEtJLNUZa2k+6HEszbAqsEeCl7rMSbj+afbkBBAkH1Tr7VQyhZaOc+g2LtjAz6bAY6LGo522Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UAkXSHhiKPKLWho44tnFwCSOAakt0+TfG2KtklmgXdQ=;
 b=hgv/617M+/DVXQGJsXw8JyDCmZrLLMLK/dbQvQjB/zZjBfCbgrCVOlh/Yp+EAjA1m64N1Fa4J+LC+tmwrz9Pit285kAKLoPRQ4UMAbSFB94PHDOJyvhVBkgpkHJ57I1nfrB8FKjhfZhCLKxie9KJNYSKGaS9gTP2LiR9WB6S6q7uJtmLs+U5aJLqJLGUoDIenSULmhLmNJAnoiPwV/cqK33LqzJ4uezeV/mypLnZj9alSal2JxGAhd9kpWLZvGgcznCKVyR6EzN1+TLzuPRiCWS4ndlCTP0gLuBCQ8x16FKxRmWbfyppEE56dyxr4XOflBM1+32RMrfxlPNC64E+GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ2PR11MB7575.namprd11.prod.outlook.com (2603:10b6:a03:4ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 18:56:18 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9073.026; Fri, 5 Sep 2025
 18:56:17 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
References: <20250905173625.8398-1-michal.wajdeczko@intel.com>
 <175709654211.5916.895894170330275840@intel.com>
 <e3be21e9-cc3c-4646-b7ac-ead4a575565d@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Don't expose dgfx residencies attributes
 on VF
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 5 Sep 2025 15:56:13 -0300
Message-ID: <175709857376.5916.4353119381649921234@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::32) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ2PR11MB7575:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c0f82d-879c-4b14-f6e5-08ddecade550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bTBkcDVURHJrbjVCU0RGTWVxUlBDWm1OWXpPL0UrUDN1RlZiUHlFbVlsWDI4?=
 =?utf-8?B?d3I5Uk5FMFAvVU9CczlMTWtxYm5NN2JtV3RyVURQaUh0aml0L3pZM3p3OFhX?=
 =?utf-8?B?SnhPQTgyWFdQckNWMmh4Kzc1ejZGc1llZXppRFQrM0hGVUg0N016SWdaRkFU?=
 =?utf-8?B?eDM5L256ZnhJUExweVl4UnBzbFdlRkNsRTFUdGVXZkJCaGxOeXNKd08xVDlk?=
 =?utf-8?B?QmFYcjVwRWNuNnlMQXBhRENJM1V1ODBlT3ppMnpGd1pjNkVCY3pONk5iRVFa?=
 =?utf-8?B?MDhmZmd0V01ObjVsYUhvKzlyNlp1aWNOT0ZnSEJ2Nit6RG1XaFpkTGpDNDdj?=
 =?utf-8?B?VUxrZ2pQQXQ2eDlMYWJCdkhVcVV3RU9yYTQrcG9pdUR0RGNjWk96dTVLUHZL?=
 =?utf-8?B?bldZZXAwaHpkcmwrWVRnZG13QWlNYzEydXpQdmltSjhxRVVneXpDVmJsNmQy?=
 =?utf-8?B?VzZnRUxoWlVRMzhvWkQxT2dQR09keU9KY3ZrUnAwc2VGMk9EVGJ0YzlGb0R0?=
 =?utf-8?B?Y3djSy8vQWRtcnJpbWcrejlvMXF2Z1lpc1hXV1g0MXptQ1RrMUc3V0dPMGxQ?=
 =?utf-8?B?c3B6Z3lUNElBMitkMk9LeTJqN3pwMTRhVmt1L2xNL2M3Q0RaWkNjLzlVYU80?=
 =?utf-8?B?d2NQQlpYYkxlcEJnbzk1MUVlRlVrenlLQmkralpBbkFJeEFPbWVWWUFIZmh0?=
 =?utf-8?B?OXlxN0JIYUFpWEZiQWhIVGM3MFBndzVpQ29oYmZsSC9DMWkybUp5SnJhVUlT?=
 =?utf-8?B?TEVUaEkvdzBpLzBaZUdYUkhjSzBJN25WRVdhS0xtZFc0RGk5aVlwTDVzUm1N?=
 =?utf-8?B?eGR5NlFaeFg2U2hXS3B1Qlg1NnpPS0h1Vnp2YTRoUGwrSmFPMDhFak1zRmZZ?=
 =?utf-8?B?blRBYjFTM3RJWWhwRkVzNHdWaXdrSGdlR283ZnB5YmFIcmF3cUtNQ2ZyYm1l?=
 =?utf-8?B?ams3WVJFbEdOemJqZXJSZjB5TkxDNzM3ODNCeTYxZDkrNU5xazVqTWRSYy8z?=
 =?utf-8?B?bUNTUkgwcDZFeVJJek81cGVKZzZiVDRFNU5UWTBYVlNHRlpwVmlwKzB3S21V?=
 =?utf-8?B?cU5ZdnhVbWZPRHdGTXpEWWNPRC9GTWRTektUSTBpQjJobXVVZHBydWZvdU9U?=
 =?utf-8?B?ZnFreGpXVkJIYVJaaSs3UlQ5aDFTQ3RPU2IwbU1lQmtuU1VLWnovNWJMa2FZ?=
 =?utf-8?B?dVoxU3dxbGhCaSttLzNxeDNyejJ4NE1mNFNOajR1K2x6MmgxbkdWN1BoVEta?=
 =?utf-8?B?THpnZkE1Z1RHbHoydDVzVytLU2JxWTZWbEh5RVBuazJQM2xOZkc3ZC9IbzNz?=
 =?utf-8?B?Y0JKQll1YVhFUkJlL3ZkWXhldG53dmZWK0pVeWowR0lZZGt1YjdMNXB6a0gv?=
 =?utf-8?B?Q291aUI3OS93SnBZVUtQb2JhY0tsQUo0M0dDQlNRZEUxZG81QjNCVE1HbGhT?=
 =?utf-8?B?UnVJeVNSRFJ1RW9WcHlTSzBvTW92N1JtN1UrR3E5QkVIbFQ2YWhHUnBjSnZO?=
 =?utf-8?B?VFlOSlA5WGV4UTJicjdzVDQ2TnZIRG0vc0UrUEc2RjRtQk9iL1Y0Ly9GMk8v?=
 =?utf-8?B?YzVYZzk2Njd5M1NneE5lMEsrUFZQbWZuNDF5ZVVkZy9pZXJuNTUrSWIxRjIv?=
 =?utf-8?B?akU5a2VIQ1BYdW1sQTA1cnRsTFFYRzJ6clRsTWhTVWVpczVDdHkrTVo5Yml4?=
 =?utf-8?B?eE1yYWtJTFNYUGVPZ2F0VmhDUGd5aHMyV3YvdUwxcFZGWXN2SVJNWExIaU1H?=
 =?utf-8?B?MjNmSnlVa1ZaL3hlVVpYeHFlZUVNdkNxb3ExOExPSXpmb284eU9SN3dsTnpX?=
 =?utf-8?B?MExzODFGaXJFVW9tOFBPNkpRQTJGS1gyWDQram4zWmxBNlptTUFWOEE3N3FF?=
 =?utf-8?B?Z3hVRFEzdURFYVltUElQeHY3bFp4ZllUVTdGRVczdy8xRkoybkFjSFQvQmla?=
 =?utf-8?Q?i8ivDGbs2uY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEF6ZmNHaEgxcVdMMlFrU2pvdzhpUThaU1JzSk1pQTVObXUyVGdlYTF6ZTlF?=
 =?utf-8?B?SnRnZjVmZTA2b0plOTNtMnhRT2JGWWE3Yy9oSktDREh2WWZ0YkNZT2p3aVZ5?=
 =?utf-8?B?ZjB1N29RSlZWdWlycmpDakVCNUxpT3o4NVFDK25qWGVTNG1UbVZwM014UkNP?=
 =?utf-8?B?VjdwdHhXL0J1VUo1WFg1YnlyK0RVNm0yTFEvQWlDbW84ZmlIMHhFanFMb3FO?=
 =?utf-8?B?NkVOUXl4TXhUa1luUGRyR3hMbERDRVJCY3JKVnBlTGVoQis3NWpaSW9lOVFj?=
 =?utf-8?B?UmZ3YW83VVVwTHNmS3NmMExid0syQ1grK0JLR1NacHdFMWJ5K1ZzVHVrMXQx?=
 =?utf-8?B?MzBrUWFaOTdxcW1ML2RlSWlaZGFLR1JQODV0MVAvbjFRRTJTcUVoK0YzWTU2?=
 =?utf-8?B?bzRPRTJQbC9LcDV3WDhyWHZkcHRKYUVpUjFFWTh3OWVnMWFjeU1ockZGVE1x?=
 =?utf-8?B?UlBzT0ZBakpDLy9BZGVEa29NQ3NBMkkzUjhDV2E3UTlyL3JzUmdhYkJoVjdT?=
 =?utf-8?B?M3ViQmV3RTJsWHdicEhSYkE3aE5DZ2ZLU2N4cXpXZ090Sy84ZzltY1pMbWFH?=
 =?utf-8?B?OU9ZY2d0YW5qd1ZmVk12VE1wOW9aQVAydlYxTDZValVNdFByd1Bra2dGVFlh?=
 =?utf-8?B?WGhKekRLakxqRE5OUk53OGxrQXhST0xicEk1TmJKbUZGN0JvNFRhNURNczdl?=
 =?utf-8?B?N3AyaEJ5MHVnK0ZNd2FHdmFlOEQxYVlKYURWWmdROHZRWi90aEo5VjJWUW1m?=
 =?utf-8?B?ZkFSTmR2aSs3bmNlT09oaHRISTliaWhrQ3dyR21mK2hoY0x1SHd5a25wSFMy?=
 =?utf-8?B?TVZYellUakc5WjRaOFBHeURhdURCZHlQdHpyMVB0VkRDTDdDNk5vMzE4TGFD?=
 =?utf-8?B?RCt3VzZZa2Zpc0FyYnFhVUZKK3hENWE4RnBwYW5yMkJGbFBOdUFoR0ZlV24x?=
 =?utf-8?B?K2NPM2dLcm8yWnp3dGRCSjRndlh1ZDJpcm5aa3k0Ymx1UjBjaXNSVmNCb0Fr?=
 =?utf-8?B?cnc4cHN4OVBWWjViL0hLZ1V3eW5VSGJEOTRpNFRpd0p5YjFZcjRGQ2FGR1RY?=
 =?utf-8?B?MTdtQ0pHNTl5MFN0NFZPS3VUZTcrR3FiNWVtTFE0ei9yOUZHTXhqbVNVcHpl?=
 =?utf-8?B?Y3FmQkY4STlOZVBqYTl1NUlNU29xS0c2eUNrb0R5dXdaWmZMcVFlZWlVc3FV?=
 =?utf-8?B?anFoVkM4aStMLzZkdXRsMWlsVGpEcUF1Zis1UnYybVVaTVltak9NOTlXaTQ5?=
 =?utf-8?B?ajFHSDBqNStJcEpjSmtoVno0L1JDbkk5OUYyV3ZEOUl6YkdnM3FNM3dDaFZm?=
 =?utf-8?B?SGRYemN3WDk2ckIzUXVhYk9HS2lndGljTmZvWlI5SjNWSUsrNDRMMXhOL3E5?=
 =?utf-8?B?elovc25hVTdzUUc4WXp4MWY5RHA2UnpsYzZXQjVEclI2aHI0L1JDeHJwTHoy?=
 =?utf-8?B?UmYvOFhoSVdpZ3FKMWpTbm9aK1RHeThKVFkwQ01zR1N3UDBkb29wYm4zZWNI?=
 =?utf-8?B?V3A3YUQwWnlPbWdlQTJ4WHIxdW4xMWdKV3JLTE5aeGdRUXU3TG8wcFU5NTlH?=
 =?utf-8?B?NFZ3RFlxaWxBTUFyZVVXRXAwKzhKb2E2d3RndHBmRXJWbXozYzRzK1g3VW5t?=
 =?utf-8?B?ZFdLZEN3aEZQMlBSOWtNWWducmtlQnJIUjRSUnhCcEw1akR5S2J1VFYxeXZj?=
 =?utf-8?B?dGJjT1U0NDdDamRRQXZzbXowdHJ2Snd3WXRaSldOQmVUd0x3cTkvUWljbm5w?=
 =?utf-8?B?NkVVTVlIZ2RoTG5pb0t3QUpmRHlrcDBUMnpWbldvS1VYNlhjSnZ3Nkp0dnpl?=
 =?utf-8?B?T3F5YlVLZjBRWU1kSWhWQSt6ZVNpbDFHamc4dnZ6a2N0dGNENDdGVjlsaGRu?=
 =?utf-8?B?QUk5SWY3Y29lakJuaTQ0aldXd01TSElyZVRuMStkOFJ2eTlYN1EzS3FSbnZo?=
 =?utf-8?B?aWJ0em5OQUtucFpFYno3K3cwaEJURHR1cEpRcDdOMXk4SVV5eVlUWGY5NUJn?=
 =?utf-8?B?RmNhN0szNUU3R3JsaVNGU1BCUG9KSVlmclY3SGRZNmt6bHJmWVhJZlhSYXhZ?=
 =?utf-8?B?eStnbDY3Z2dSTXRZZDJla09QeWFxSjlKZW5pYWE2WDVZUS9lVm9XeC9yREMr?=
 =?utf-8?B?UkI5MlI4ZWtJRHo0ZThNekttRmtGbEJNQjB0aFEwclkwRk51eldSZS94cmN1?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c0f82d-879c-4b14-f6e5-08ddecade550
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 18:56:17.8818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lkZn1rJswbD/3W8Ff+mPx+Y+mD+X2tlrnnKYmLqKKnwhh/iqcmNpZSGakZm5kQwAqINzXfsIrJ9cAnm7Qom/eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7575
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

Quoting Michal Wajdeczko (2025-09-05 15:40:14-03:00)
>
>
>On 9/5/2025 8:22 PM, Gustavo Sousa wrote:
>> Quoting Michal Wajdeczko (2025-09-05 14:36:25-03:00)
>>> In addition of checking if we are running on the BATTLEMAGE,
>>> we should also check for not being a VF driver, as VFs can't
>>> access necessary registers, and doing so leads to:
>>>
>>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+=
0x0
>>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>>> | Call Trace:
>>> |  xe_mmio_read32+0x110/0x280 [xe]
>>> |  read_residency_counter+0x42/0xd0 [xe]
>>> |  dgfx_pkg_residencies_show+0x115/0x190 [xe]
>>> | .. [drm] Package G2 counter failed to read, ret -19
>>>
>>> or
>>>
>>> | .. [drm] GT0: VF is trying to read an inaccessible register 0x35b004+=
0x0
>>> | RIP: 0010:xe_gt_sriov_vf_read32+0x5e2/0x8a0 [xe]
>>> | Call Trace:
>>> |  xe_mmio_read32+0x110/0x280 [xe]
>>> |  read_residency_counter+0x42/0xd0 [xe]
>>> |  dgfx_pcie_link_residencies_show+0xe7/0x160 [xe]
>>> | .. [drm] PCIE LINK L0 RESIDENCY counter failed to read, ret -19
>>>
>>> Similarly, there is no point to expose inject_csc_hw_error on VFs,
>>> as HW errors support is already disabled for VFs.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Soham Purkait <soham.purkait@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>=20
>> I posted a very similar patch[1] ~1 month ago.
>
>oops

But I think we can go ahead with this one, since it also covers skipping
inject_csc_hw_error.

>
>>=20
>> There was a spec-related question from Rodrigo, for which I could not
>> find the answer.
>
>I guess the answer in indirect - there is only small set of registers
>that VFs can read directly, and above one 0x35b004 is not on this list.
>
>Bspec: 53221

Ah, thanks!

--
Gustavo Sousa

>
>>=20
>> [1] https://lore.kernel.org/all/20250729-skip-residency-debugfs-for-vfs-=
v1-1-3c5edec08c8b@intel.com/
>>=20
>> --
>> Gustavo Sousa
>>=20
>>> ---
>>> drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_de=
bugfs.c
>>> index 4b71570529a6..8be8304cb05c 100644
>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>> @@ -346,7 +346,7 @@ void xe_debugfs_register(struct xe_device *xe)
>>>                                  ARRAY_SIZE(debugfs_list),
>>>                                  root, minor);
>>>
>>> -        if (xe->info.platform =3D=3D XE_BATTLEMAGE) {
>>> +        if (xe->info.platform =3D=3D XE_BATTLEMAGE && !IS_SRIOV_VF(xe)=
) {
>>>                 drm_debugfs_create_files(debugfs_residencies,
>>>                                          ARRAY_SIZE(debugfs_residencies=
),
>>>                                          root, minor);
>>> --=20
>>> 2.47.1
>>>
>
