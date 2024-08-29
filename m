Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8530C87FCD
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 17:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17B210E74A;
	Thu, 29 Aug 2024 17:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nJwJrDTi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8481410E74A
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 17:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724953674; x=1756489674;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=nJwJrDTi8XaGvXABdDpvPr8p/McMJcH74JVIWqkHg3Z4kg99qy4KXIHf
 Ill8G5UBbEkjupmRaJaBbMfCGazxHL76MXEtvmw+NVzdSlyND+2V2Vjps
 XuCbvmgpCMj8tllzPgcdVtVNeHE63yMxi5AjluExTp2QBx2JSeq/o2bC5
 0VngU99Lc2jMSV2BiSHlc3jzPOiyuDjyu6Cf5qpr4zC9fIyVaWyFcpMIF
 uCb39GVRSvpFhILA8dVKnOvdqE4AYt5SwE2WVFGbRWTUjL8VU83t28Jre
 CWStXyqfrv605sD7g48tLENtPckVBZ1J80oWt2KEUpvTzKj56XF4Q+6YY A==;
X-CSE-ConnectionGUID: V1nFAgZITCiTUTFJjTPCRQ==
X-CSE-MsgGUID: lzGK0nDATGa3djiMzk85bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="48951562"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="48951562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 10:47:54 -0700
X-CSE-ConnectionGUID: aSyXKuLLSSi8lDwJ6yZ2pw==
X-CSE-MsgGUID: RSBGtkcrQ9K8g6jTp4U1RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="94471379"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 10:47:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 10:47:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 10:47:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 10:47:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 10:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wqt9nkYYnhKCBvvDbBq66JxYk/jzMdmThoj+jQVgjLn8hupE/N6YonmgoG3TAE13vuTdpRLBRzit77cNYNhGwtiqRUOB2/m+ymR0hkunufD4bb/IklhI1H3gvW5Df7K8PhnVaJ0XvFXpLpUGLEVKsnBBN/dd8b1zJI6R6g2vLLX9MOWYPfvBhSdEEt7CWJr0oWuTCX+p/7Rwi4j9sGiJf0bWNoLnLRvU9I6oeXjODyDlyPn9JFr5CDiANBNde7foBf0K8026AeN+Su/pzyg4ur/N25zHL0xBCUfxC1jabOJNOoV5+s3rW1cXe7QVP8XfrpwlPGShzTcUfV4lNsUsnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ahWlNeatoPntwvWPgT8bW+j+TfHyo1D37+LNhy13k=;
 b=Rl5imgnkOjq343dwgkyvQZq64fZ+elLsaTOQAlHOBK/RrEhoEyfglo2wqpanfF1pZ3Nkdh/SL76C0n3qV7ii8Wr/i+mWf36ZM8PQzjvLa5doJBCNKIxtB7q75/QmWlnqzDIu7VjOlcv5FcvE/o1I90arVc2+Zg3iEObSnCvcxllHGLkDod1xPM6cMJl1IDO4j4B9msCSa6t2xMqzo6gQQaCh0Sy8w0o1cNHtlmh0tMXa0V0T/YsyQTeSaC0/npMVRFqKMp57UmqvCyUn8CKYqjcS4hfqeRCzT1cGHhwdH4ZS+fPvSD4CfNEULd6QEvdLQdoWOeBqEKEtMhE/cah8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by MW4PR11MB5910.namprd11.prod.outlook.com (2603:10b6:303:189::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 17:47:48 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%3]) with mapi id 15.20.7897.021; Thu, 29 Aug 2024
 17:47:48 +0000
Message-ID: <eb7edfbb-9440-4547-ba1b-6e31386c4089@intel.com>
Date: Thu, 29 Aug 2024 10:47:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/gsc: Wedge the device if the GSCCS reset fails
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240828221457.2752868-1-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240828221457.2752868-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|MW4PR11MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: a63c1f65-2a4b-4c59-6d57-08dcc852b257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWE1WW1XbUk3OThzVWtVNHByeW9jbEcvblRXa3FIUWdEaGU2S25sLzd5SmJF?=
 =?utf-8?B?M0V1ME1xSzFSa2M0YldXYXp3bXYyd3FiNFhzbDAxRk9PMUk1Wjg5dGxrK2Uv?=
 =?utf-8?B?dmRrWVFkdEhkd1U3VnFYclJvMUlWYWNWVVNjdU5Ud2VidlpjZDFicTlPYjNl?=
 =?utf-8?B?aFVQeU11dk5KVnFyQ0xDdVNzZXlMbE0zYnloVzl0bHlJQ3Z1UC9STXAvN3BR?=
 =?utf-8?B?Yy9nZFN0b2l1WEMzbGxPN3JDeEkwcEdiM2JOQytxWTZydlBvMFJxbElOTlVj?=
 =?utf-8?B?MmNleGdvZHNOSldPcG03K2tLZjFvMittWHVpWFVKbW1FQVdZaFU1OXhRWEg4?=
 =?utf-8?B?MzE1TmFlOXFpTU0xRnpHU1dHclpSNFdOclBiUDRYUERtS1c0dEhCejVDclRD?=
 =?utf-8?B?dk9JS3RQN21RMnpxbDhsRFoxSTdVdkpsQlNsdFV1Rm5LN014d3l2TFRFU1h1?=
 =?utf-8?B?MEFKZVJlR2ZYQUJEOGhZbUorblhCU2xuVCtOSnVqWGFMZTYzUWJsMFEwS3po?=
 =?utf-8?B?V0d3eThxN21aTmc4b1YvNDRCZzEzR1RwU2t2R0dBcXkremNndjI2S25JVFRo?=
 =?utf-8?B?UzU2Q1VnOThjUnNtbWhncm5tWEFYRFIvMXZaRHptRFhXWVBZUmt6c1JVQ2NI?=
 =?utf-8?B?UDA1RXlkWEFtdVFXOHd0eGVjbUVFMU9ZZkQxWTdYdTdlM2hVSnRDKzR3blpY?=
 =?utf-8?B?Z1NaZ2c5WUJsZFhmQm50Sm1kRDZwby9xZzFxR05QRUpKbGRreEtodG5YYXpS?=
 =?utf-8?B?V2dxN2pXSkFJR1Y3UlRCeUg3am83Y2p0VDU4YTF4VTlUWUxPYWlNTUs3eDVH?=
 =?utf-8?B?bndRY1hzYi90dlN6cFJXMVU2UnRUaHhLQkZZcE5XYkcrdmU3a2N5UER4UGlm?=
 =?utf-8?B?ektTem9YVVZ1ejhJbEFIUzJsd0NUTU5HMmpyTGgzOWNUdUx3SENVWDRSbjNX?=
 =?utf-8?B?clpibTNLTzk4SDkrMW4rVlBVNU52SWloMm14dTk0VGNzbWRaLzNwcUlxajY0?=
 =?utf-8?B?RVd2OWExaU5EZlBycmh1UTVFeHI2UnIxNnJpbnZLS3drV0JsSjBLQkZ2T2JT?=
 =?utf-8?B?MEhkVG5FUStuMmlIWmNTMENSc20zdU5SQno4ZjZQanJHMGF1ck13MEdQU1RK?=
 =?utf-8?B?Mkd5MXhUUWx4YTF5NWw0cUx4SllNSVBXUGxFbTlLZlExUjFUdERZQ1A0VEFE?=
 =?utf-8?B?M3lpZEU1WGxtZnB3cG1Dd3NJaXJDdzgvdDJzSmx5SjduZ1NzYTdvTFR4VGJL?=
 =?utf-8?B?WEMvY3JabkpZOGFDTkNQclpyLzN3cEc3U2swSnB0VE1PTlhIeEdEMlJBcDUx?=
 =?utf-8?B?UWMydkpVUnd2R0V6bm9sRGFyNnh1UkxzZm94L2R2TVF4TnUzRlc5WTVybHh5?=
 =?utf-8?B?UFJxL0M3TmdzZDduRlo1R0h6Vnk2UlZVbGl4ZHR1Z1RUV0YrY2FIWGtoUDhj?=
 =?utf-8?B?VTlZUVZaRkJFcFlFYXdHcTFvZktXMjNQMysxREViMUFBZ2ZONjJQRjFkN1Rx?=
 =?utf-8?B?Nzd5Q05SZEZ0c3cwTk0xTzg0WGl3Mi9GVFJ0MjdZOWRZYlo1YjJMalM5Z2Zo?=
 =?utf-8?B?cncrSWtTQ05uTWRRNHpZUjd2N1RwNlR4bVFpWUZ3L1RiNDNlRHdsWTlFK3FV?=
 =?utf-8?B?bU96Ri9lRHFWL3g2UmhJV0JXdnpmdFlrL2RORmZ3eW1SbVYrQTlDLyt4dml0?=
 =?utf-8?B?a0ptTWJZMFp0amlvS1R1UmE4VncwM21Ha2lKM1lkbFEyM3BTU0JEaTdMbjEz?=
 =?utf-8?B?elNDNWZZdjVDUUk0Q3Z2d0xvOE9mWlZaVEZDUEY3NDJ3cXk1VEFZNWorZGRz?=
 =?utf-8?B?ZmlhWm5sZzlPZGVUVXEzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1JjWXNKVHNyWGJmcThhdUtSNkpndFdydk9MamxINnhwQllwcThXZ08rcjFk?=
 =?utf-8?B?R1AxM3dzWFdxa0dLRlAzY2E2NGNJTXJSQWlFUk9LK05lVFpFYUI3enVYTWdv?=
 =?utf-8?B?TWtRNUF3ZU1RS1JteU1sT1U5NlV2d1dVTUt4UVhUazh5b2NxKzcyRUU0M010?=
 =?utf-8?B?Wmx6UkhGaUhSZFcwK3E1eThEclBRdGZ6TUFNQWhuc1VDVkdWYUltWEZwQzdm?=
 =?utf-8?B?ajBvaWRyZGdzdlFmUlJDTm1YOUFSR1hnWHhDYXpJUkRpT29UcTVia3JGVmVK?=
 =?utf-8?B?cGRIL1dPbzAwNlp3WUN0MUxEcFhBYk1ZbFVzWHFiY003clZySWdJeXdNQnBF?=
 =?utf-8?B?Y0Z2eGtWUWU4TTQ2UmtaTUUveTEydjZSeCttVkJxamtIOUxFODNQQnNtbmxp?=
 =?utf-8?B?YXFUWnZZYkRkU0tmd1pxeUdMd2xRVjBPUTRPdHhsbHVmRTRtdHZiS2c2WTBU?=
 =?utf-8?B?Zlk4U1BURFZBSEx3bDdycUhBV0Y1TVREMFBjbldUZCt5d0dGeE9Va20zTTJR?=
 =?utf-8?B?SUY0WTNZOUVoU2Qrak9zZXg4YXBtQkp0NVNXUysrTkIzQ01xd0tFQk55V01I?=
 =?utf-8?B?Z2s3UFpkbzdpLzgvRTQrampLaWFaVy91Vm5DazdmSExtazZOVnNack9LSytW?=
 =?utf-8?B?Q1BaWG44WkR5MW1HaTc1N2RnS2NmMkJHMmRQelBBRkNvcElIQlZvS2ZOT0pw?=
 =?utf-8?B?RmNOSXJ3bGFHd2ZzT0toS3dYNHFBNE5FNzNuWmhLOWIzYVJBNU1aNGxBREo5?=
 =?utf-8?B?bTNjTG05ZWJKM2FYQkdzOWltcUQxSTFPQU1YSkV0K3RtSSt4UjIzdDk0OERE?=
 =?utf-8?B?T2FFUVdTQXEvZWswOGZPdm5wV0hhNjFMK0YzbDlYUXZjZjAxL0ZPNm5Bam0w?=
 =?utf-8?B?L1QycG1Fc0x6eWxwbThsSEErTGV0Rlg2ZGRSYllkVU9ZRTJWcTUveVJaSnRx?=
 =?utf-8?B?QXU1ODJNNlUweUd0bFk2ZlJGelkxRkNlS1Z0TFhCVmxXRnZ3MnpBU3g3Y1B4?=
 =?utf-8?B?VDR5R1puamlhMjZJKzAxQUtsNFcwS3ZPTG9mdnA1TEZjTlJ0RUVqOTVoeC9Q?=
 =?utf-8?B?WVFiM0cvMEsxVXk5RW01bmREL1FwSHBxRjZkNzQ5Y0tkdGZUWVpJUXNJSXRt?=
 =?utf-8?B?d2lQNS9NckUvbCt3YnFCajEyOEhvbjBQcFhjL2hvR3p0aTJab2U5Tm5CUzBh?=
 =?utf-8?B?c0c4NEYvS0ZxQ2FzK3lxRElaN2prL2JkazJSRFNob0FIR2l5NzNiTXMwVWY4?=
 =?utf-8?B?R2JoQ0pnblRMeWxCc3daVVNYSStJYUpXRlUxQUdXSW93T2hPMHRXWjNhWHh5?=
 =?utf-8?B?Z0lZTmM0MEFGZThzSGsvSDJJRWNjeUlDSEFWd3lLY0x5QTRhZlFnbkdsdk41?=
 =?utf-8?B?YzUrV2YxRS9kQ1J1YlQ5VUdPWW4xOTJxWUxnV3QrVTVQaDJQN1dvQk5vK3ZP?=
 =?utf-8?B?SlU5R1ZiZ2t6WGVsUnRuaFBpbzJRTGNPVFM2RGREZTdZcUJ0cTdCODE1WjNO?=
 =?utf-8?B?WXJSRS9tdVpVL1pROXJkNVNITDIwejB6M1VNbFFuTjFYT01yeUpYallZQURo?=
 =?utf-8?B?anZVYk1oOW5Xd202eTRrbzFsdXQvdGRvSk9yY0h6OWE1M1U0UzBoZkNCanJO?=
 =?utf-8?B?STNyb2FsTVlIWVdoTDFuamRUNnNBbkJlYndiaHZzUXZQR1loRE1MWks2QlBo?=
 =?utf-8?B?TnRtUVYveUFSMksweFpwMzZSWXFXYTdVeU9ZckROSjRqd3BxZmdYOFlYV1Ji?=
 =?utf-8?B?N2VXMmJydk9oQUF1b2xhak1vUzV6a05scnRIaGNIZHhMbXB0N0IrOHZ2Q01E?=
 =?utf-8?B?aHhGRHdzeW9XM0IxWlgxT1A5RGVzdklOSitBMjQ4TFJvSC96bFQzMzFtdTJ3?=
 =?utf-8?B?aDhxd055bHR3dkZiWThpTmUraktETXZOTUsrVzJBeStySkt3bi9laG1WSHlD?=
 =?utf-8?B?UDh2aVc3aGRZbnFLK1FYaXMvbUNjNCtPUENLYnVaL09ZMis4THNGd2ptdTFC?=
 =?utf-8?B?T3N5VWJnYkhYMmRUR1dkbWVndXo3VGhoWlhIZUlXUjFGb3FMbGljOG1oQyta?=
 =?utf-8?B?bUp2TzJWaHU2YnhJNVdTZ3V0aVpsclZTWU5uUkVNaFhPSnM5UjFnU1BkN0ho?=
 =?utf-8?B?OGZoeTFxc09DWml2dTFrZUtTQ3AxOW9OeXdaSmF0eFRzU0hpMUVvOVhZTFU1?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a63c1f65-2a4b-4c59-6d57-08dcc852b257
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 17:47:48.6601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ASUmbxlF3xfFq84UR9x0qrMjIePEKUJ5jvsap+dIomYoAwKYxfznuSz6uCUtI7UmOlutcp8b6NL4AeIqO8f1PB8GbJha7PDFRLYvQYvS6bU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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

Looks good to me.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
