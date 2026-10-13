Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9B0CA9ED2
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 10:48:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAFF10E2FC;
	Tue, 13 Oct 2026 10:48:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60810E405
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 10:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791888515; x=1823424515;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=wLcEXn1ki0lTfjfKvWry6ixlboA3D9sWB5TS51OU1+s=;
 b=bsSNwW5nvTDZvHSOy45+87UAUysthCPsSEaCgZceTRmg5OkYzJq10rKl
 4HvIzCSCDDL10NEOTXQJSSGnrHd7syknvU2yJhyk2jntll9SrLR5gpa+0
 8xkGJP7Jc2X4KxdlCAKszVpSNFCLSDZtq20oKmSoHTpTA1PXmR34S4Bn3
 PAFf0YJox9kZDZhbMKTz56gIl5OyM6G07VTcRgIjTHRSWzt7T/C+hjUZT
 Bc/wbP+gCksAXlMyXYaYrvFm4iuTe6+7ChFOEHIP3ELwlUT/pYYvLhQbm
 1AQs33k8z6xOOy/8L+ClrcbXOFRBTR1EpK7vEhpxP7kFQjuk2gxdf8/HT g==;
X-CSE-ConnectionGUID: IqkFn/vnTHSMw6gbZjAdBw==
X-CSE-MsgGUID: 8fRvs2axQS+zQNVqX9Ardg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="602695"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; d="scan'208,217";a="602695"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:48:34 -0700
X-CSE-ConnectionGUID: Mynh0apJSJaib6sN7uOkwQ==
X-CSE-MsgGUID: O52gY0rmRne0ExE2WaXmog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; d="scan'208,217";a="1016126"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 03:48:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 03:48:34 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 03:48:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 03:48:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GMJIifp1x8O0bnDCJeF2MGIPCYONm0A4caUOnh4u2d40czJbEVFA7iG/ixw7AU9G5I0DynTaQBAuaUVOOTiJzsC8lTO642xfoa+EhIXbFff5JIGhAOTjkcOZr47tdB/eZYoBMRVoETyo3SgzjSX4Lu7Aywyw/1oN7AtonvqXVGrnEPrj7Mb61cvRryWubLv4HBZQwT76aitAUNy8/bC8mlq5KH8dyxcJ1XeuvCfTWxVzaakAlWkoggFJUXR4Ewz2mSTtXifFf57waT7FST14iyPx/xqmbl5yhJfE/DxMtYlmBWLrh6ANAAQOTV6JpLGUs7wlamW0S/1cU1k6Tx/Jag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqe60ckPuMxdKd4fMTlfs+N6x9v7TAP469M39hORzM4=;
 b=HE5qnjWXh8okhEKt9F+tRva5D0LwMBcbBc9KUZqJFTFHQ7FpXLDh7snV8XhBXL7x4DilBqAnM2jYHO/q8rUJ62CSK4uGmTVducCvrsX58Nrh4SeGMOMKbL1gOMCI7Hv/Mai7l8oHnIdFjzZS0+ov1LM1xqIuMyyKOE0xLakdo1dxkZC4qu2lZ1H0Ywpx8IeJLE8Q3bYF6FhxS9dX82qc53vEODOabmPFRNu4p//CtqzYiqOF/ddCOzYXftZ2LzgdHUmTIa63L2En80dOg2tj7nMH9F4VV2rr3P7p6wy5omb40VuDZ/c3MKGk87qNN1fNOWRtogdWm1jLMNBSRdIL5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6939.namprd11.prod.outlook.com (2603:10b6:930:59::17)
 by DS6PR11MB727690.namprd11.prod.outlook.com (2603:10b6:8:529::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:48:09 +0000
Received: from CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307]) by CY8PR11MB6939.namprd11.prod.outlook.com
 ([fe80::d46a:5310:523e:2307%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 10:48:09 +0000
Content-Type: multipart/alternative;
 boundary="------------SocH5kZ5b0bJPIFT2UfMxJxm"
Message-ID: <623d87b2-7d53-4776-a1ea-1ee296dba681@intel.com>
Date: Tue, 13 Oct 2026 16:18:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] drm/xe/guc: Split GuC ID manager into usable and
 shareable pools
To: <intel-xe@lists.freedesktop.org>
References: <20261012115143.4100364-1-piotr.piorkowski@intel.com>
 <20261012115143.4100364-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261012115143.4100364-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA0P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::6) To CY8PR11MB6939.namprd11.prod.outlook.com
 (2603:10b6:930:59::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6939:EE_|DS6PR11MB727690:EE_
X-MS-Office365-Filtering-Correlation-Id: eb1053f5-1a61-4c25-3502-08df29177840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|10067099003|8096899003|11063799006|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 6b6BLhK4wF5wslbYPBkWlB1/nUSQ4kvY/md4dwnwhTjziufSZYTlkSymohCvZXozXrRA4hYGomKHtongdj3IvwvYsq+Q1RD+6kmwEYL3BQ87vdzzH8SztuPZRmYUz+GroQh3tfTH1SgxW0eVO4PVgOTgf3H00zex1bdlzptzipZQdzm2BXHoxJS2o9fFF0oomvvC+cWhMqSY3eW819vHkPRl6KE2c0KTuMDiOAooRbY8c1MqDl3pJ+8ve0hPM0hswsCToyaR9AbZajUZZDQfKMDyDxQEWkf7T80HMyGBj91JdtGnEnGZKT3OXyx+8S4S9uIdEIPrh6KqsW0DhzYBWptMefNhUUsL7HyE0pUZ+RKsylns+jMGc3W5nvBoQyRoMRM3KEST7SXXtu6s5ODm71Mp1rV2gmIHo9em/DUx5W5uzah2UD3kbVVCeMY8ymvIhsCxN3+6pcPpVX/MNwT9z2DVz+YzFpkGve7+C59ljIuHH9WkwXw4ErrH5dZW4R+w6hbfW6NJGfFKBE3CsGhxGNavDxlX5FNzf0pA8EDy11mK4vXgb/rpretySjVPvM6Np84SKV+OlJXjzRqrqaVjCjyA7sf1crYLut6GJQEKf4s183WD79TjLPR+SJquaX+lqLT0BX5tLqCto/UpXmH4jnJ3l3DFyWwUqXLMQO+K5iQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6939.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(10067099003)(8096899003)(11063799006)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWZ0QWNKUkprMTVQY1FMMWU5aExXR3JwZnpnYlVWdVZkakxJSW41MFdrMWta?=
 =?utf-8?B?TmpXeFVPV2d0aU5LQ081amYyRFJpWndSWEN4WDJqNXBpNTkxLzZ0cWdHS1M2?=
 =?utf-8?B?S2orZjJJUXMzQzVyYWdPMStWSFBCanVFWEdxOHdmNVB4QXR2b0VjZG94SlMr?=
 =?utf-8?B?SW9CL1Y1ZitwbzdmYTZoSmlTY3ZBd0RoOXdsVENydDFJd3lBWDVSWkJJNDBo?=
 =?utf-8?B?UE5ZMTdrVmJJT1RNUWtybC9kM3ViL3VXZVZnbUNhRm9zeHhnMlhra0FhODFR?=
 =?utf-8?B?ZlBjMS9ISDZvd1N5cEJKdTVWZEU3Y0pFWlJ2RGtsdHZCcGphYTlMaGp4SkJr?=
 =?utf-8?B?Y00vRldwbGpqa2c1amVqR1dxYmczZWpTRm4xVFdnYWZJMFpBTlpiTmlJalJa?=
 =?utf-8?B?R2RDOTVmWVZvK0k3VDZFdWVaazczcTV5TXdLYkUzOHEwOWZIdDREczZaeWhl?=
 =?utf-8?B?YXBZWVBnR0hBRHJhT0MxK0pVaitUWTBmVWtzdTlaMlBNd3lrUnl0NW02VUpv?=
 =?utf-8?B?anNaQTFFeXdwMzhWUGVyTlZndjRKVnRtaXlya3JnOXdsbGZELzdJY1dleU9k?=
 =?utf-8?B?Zll5bzRraVZsbGVyNURoeWJGQUZ1dlFDamNNS1Z1NC9TOG5qMWRhbE9JTGVN?=
 =?utf-8?B?T2RrajRnY3REbExOUERycnhselcyOXhhNTd3RTRLSmpmdHhia004TkROWHVo?=
 =?utf-8?B?MUlIRDBTTTJUY0pzdzg3TlU3YStFcG1jVkE3NVhEZ1BmTkp0WTI5VEQ5cC9s?=
 =?utf-8?B?S1ZUMWl3TlhKQzdqVlJuSkRTNjMvdTVXMXNmYldtU0JpQUVCazdodkVHSTUv?=
 =?utf-8?B?TVhVYmZwb043UmRIekp3eVdQU3pYRDc5bVljdGNBSUcyeTdBOUJOUE9uNDY3?=
 =?utf-8?B?VVM0bjJMRjlwdDh0RGdRMHcyWFNDZklEeFhjM2E3bE9DeXBaZTJLMUFSTDA3?=
 =?utf-8?B?ZVBJNTdBV29ma3UyeGlhUXlGdWtSSUttcEo0bTkrU2sySlM3YmZuaWs4RTNX?=
 =?utf-8?B?WXc4cWFKSHJpUE5QRzZLbUhFMWtpY1MzUnFFdFNnMjk2N1ZOb1RGaUNtTStS?=
 =?utf-8?B?SFN4WVh5ODhIdnJhVEZzblJDYUhOV0pJOUpBTWUweHNpK285cStpb3hDZWk3?=
 =?utf-8?B?b0kzWmszSW1LeVJUbU1aT0pHNVRmT05nUlo0UmRRR29xQjFwOGJnTFg1Z1E5?=
 =?utf-8?B?YmFuMjFoaHNNMU50ZTJVZGFzanV3bStKditXRUNITjhISEFHUnB5a3pWTCt6?=
 =?utf-8?B?ZENtS29sazB5ZWhLVkErR3dDR3JGODMxTXlXZEVERzhIK2t0RDFVTjFxM09K?=
 =?utf-8?B?WWgycTlQaUJ3YjlIS3NwVm1CVGVMNjBMcjh0V3ZpankvSUhMdkhtTDN2T3Vs?=
 =?utf-8?B?LzNqUnJDZ2dnUHJPS2VRZFVCVWZ5K0hjdEc1Tmh6OTYyZzVBOHJtTXNxOGZw?=
 =?utf-8?B?bFFKMHJOZjlUeFpJOVA4bzVvWU0rNDBvWTQ4bHBsUWtVSGhIMDdGanYzUjZH?=
 =?utf-8?B?azc3QVpCcFNUMnhBMzcyT0ZFV0VFeTdacHZqTTFUU2k1K04zSkV1NU9mTHU5?=
 =?utf-8?B?d1htYkNEU2FhTGFDTVBGZUhXYTVNbzRuRDhnZW9TWnVSY1c3bEpvaXI4VStk?=
 =?utf-8?B?S1psUDlaS0gxLzJFNkJmUlRadndsRXF2VXlHeFN4SjRHa1UwTzhPS0syOFU0?=
 =?utf-8?B?K1dwTFZxdms5OUxiQXdoTWt6RVhIa2cvdjdiOWdmMU83SzlDR2cyMWtJaXlK?=
 =?utf-8?B?Z3dXOHdYRGVkTm9KaXVYMUFTUkJ4RWVtSTA0aVlhNHBGb3NueGdEL015M3Zq?=
 =?utf-8?B?eEpoeFh4TlU2VDIxYmNzc0ZURG9OTDVIWDNsTW15UXpTUHNaNVBnSVhDZUdT?=
 =?utf-8?B?WFpGRisrVFVzaFFCT2hONHBvVHpqOTJBSVBmUklpazVYR3BYd1loeWgySGFP?=
 =?utf-8?B?NkJKbW0wOWh4YVhKOGtZOFBQSmhDVkNvSFBZYjA2QWJ0OXpTK1daaS9haTBv?=
 =?utf-8?B?ZVAxcVJFc0NYakJUczR4QjMxSGhja2pVTTJPYlp0Y3kyUEdTdjdCZit4TnFL?=
 =?utf-8?B?WGdNYVVYck8wbXc2ZGZuU1d1ZWVYeUhmTjNwVFlIbEhoKyt6ZWdjMmx1WTI5?=
 =?utf-8?B?SWxMc2pMaGRVbDdjazNWb1hKdHpkSFRSS1RORXNYYmlVL1FjZ3h1TDA2UGlt?=
 =?utf-8?B?UmJ5MExXaEkwTExNTUZ0SEhLSWJTMUVYSEJxbGdORXFtQXVSd2lDVmxQMnov?=
 =?utf-8?B?VzY0dzJESVpBU1dYdmZBSG1na0ZOSGdFVmtCU2dWNzgrMzNwQWV4U1NRSHlC?=
 =?utf-8?B?NE5FYjNISHRVZ2d5QmxlOTFURnRoN3BQd24ybTVZSHY1MFdBMzVVb2FLUUJk?=
 =?utf-8?Q?UYbJu4bqG2hJwfsM=3D?=
X-Exchange-RoutingPolicyChecked: RhoB29TF6QeDHvMr+3kWCREHqu7zVi0Pq14Icay/ZX5xMaIX1BiCrJjwAy6ozQeOqzq9FRe0IdmG5lqqFpRzAK3csm+mb30Q2IiBLASt13Tcjs8ayNr2t9vwUOHWrVOsmsJv4mPQ4FXlClmv5XwNCnK3BXfK6ukSAUFNU2aPA41UGFvln/D50YV2BnXHy6q/E2OdDrwsTOqdhRJstStl7Ju7z6NSp4CI6qgNsKL+68XvgeHYr+OLmGPfiClpSrzzKfJL3QEKzJ0FGRnJvG/yRofY7fY8NXVjhLEsFmTUTk0v/gtZXB8oPlzRgyAPm34aSGLs3nUwVyI6gYetxgfctQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1053f5-1a61-4c25-3502-08df29177840
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6939.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:48:09.2361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhMDdukvUGuwCIhugyL9OaDQiwY1ogxvcKchYxW8ejHByTSrV4zeDqmWdJj+qI82QXLr91xRhIB9IwF60B6y3VcjVPFn0QlkpnCXQHZe9OM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB727690
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

--------------SocH5kZ5b0bJPIFT2UfMxJxm
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 12-Oct-26 5:21 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Modify the GuC identifier manager so that it distinguishes between
> usable GuC IDs allocated for GuC submissions, and shareable those that
> can be shared with VFs. Both pools are represented as a single bitmap
> and may overlap.
> Let's Replace the single-pool accounting model with separate usable and
> shareable pools, add helpers for pool accounting and limits, and update
> debug reporting.
>
> For now, let's keep the current allocation behaviour by mapping both pools
> onto the same GuC ID space. This prepares the ID manager for separate
> management of submission IDs and VF allocations in following changes.
>
> v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)
>
> v3: Fix shareable spare quota accounting to include
>      PF-exclusive usable IDs.
>
> v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
>      Drop redundant checks and asserts (Satya)
>
> v5: Add quota helper and unify -ENOSPC check in shareable path (Satya)
>
> Assisted-by: Claude:claude-5-sonnet
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
>   drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 451 ++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
>   drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
>   5 files changed, 410 insertions(+), 128 deletions(-)
>
LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------SocH5kZ5b0bJPIFT2UfMxJxm
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12-Oct-26 5:21 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261012115143.4100364-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Modify the GuC identifier manager so that it distinguishes between
usable GuC IDs allocated for GuC submissions, and shareable those that
can be shared with VFs. Both pools are represented as a single bitmap
and may overlap.
Let's Replace the single-pool accounting model with separate usable and
shareable pools, add helpers for pool accounting and limits, and update
debug reporting.

For now, let's keep the current allocation behaviour by mapping both pools
onto the same GuC ID space. This prepares the ID manager for separate
management of submission IDs and VF allocations in following changes.

v2: Do not change how VF IDs are allocated in the legacy path (Sashiko)

v3: Fix shareable spare quota accounting to include
    PF-exclusive usable IDs.

v4: Do not apply spare quota to VF-exclusive shareable IDs (Sashiko)
    Drop redundant checks and asserts (Satya)

v5: Add quota helper and unify -ENOSPC check in shareable path (Satya)

Assisted-by: Claude:claude-5-sonnet
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/tests/xe_guc_id_mgr_test.c |  57 +--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |   2 +-
 drivers/gpu/drm/xe/xe_guc_id_mgr.c            | 451 ++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_id_mgr.h            |  20 +-
 drivers/gpu/drm/xe/xe_guc_types.h             |   8 +-
 5 files changed, 410 insertions(+), 128 deletions(-)

</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261012115143.4100364-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------SocH5kZ5b0bJPIFT2UfMxJxm--
