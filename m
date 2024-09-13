Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD38EEE27A
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 04:06:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6F4010E975;
	Fri, 13 Sep 2024 04:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jGkbOv3n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D892A10E975
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Sep 2024 04:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726200390; x=1757736390;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CGj8ydsuDxJB5cktM/Ci52Y0G0vqCYSGuuILRX+eK6o=;
 b=jGkbOv3n1LWKwAN8kG3a6imTaesu87KpEbE7Q7Mtk8g6OlqWG+9IX/Av
 RBhA3XUsolYt40srtHvzLIKUFneFoMAOIAHK4db23SRDkGwpaEYrG9cly
 3VuFI4/fPocC/COVV5UNeXB+v9QCqPpXD5I94A/fc2PIkuSVr9mPqXdc7
 kJKSeF5bmRzLcaWI8MfUm0m0yGQtZAXKW8yrwmc4iTeyIRhnLBQa27EqU
 uRt8/ndegZ9G8VxyzRXecSOpQ5NwjWDlvpYZmUzENnrLW64BCFfIRxYD7
 xqAU4NiefB/c5aubXB7Q+7ZHogoIlxURepxjsRwvzSTmsA1IbcUvzjnot w==;
X-CSE-ConnectionGUID: K0u1MdSXQlmdf10U/4mA0w==
X-CSE-MsgGUID: hIfXOr4zRAyEPMpsRhmP3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28983032"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="28983032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 20:59:28 -0700
X-CSE-ConnectionGUID: XnMZS6zgR/iFQHEukKH8lA==
X-CSE-MsgGUID: tlN+A+hOSE2AUZV4E+f4Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="68008191"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 20:59:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 20:59:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 20:59:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 20:59:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7sieRKU/MLbyW6XVTUtX8PYx7BXZ6FEqOcMtUJMaHuR9SFr/qFyTCgzJqGpqlGSv3qs7VvmFxkXdldA9wu0DZHE+AL+qAZra8ciIeVa/LOt72vcwTiQQpJxFYP/gRzzI5m7hnFwDQfBBUERZjuc9JJsfGG80WtrHz1RB5bjuLzXLtyEhROICvPNUMo3qttd7Ct/A1riLQ+K9jAX1eebnAxX+HRbbnoRdMwokVMCMHwYF0Wi12mM3Bm+b9zCo1CiF/OaKUfbJonqVu9WWI5CGyZBMgYjyWXjkhBiaep1q/3p+2gmztjjWppM4syZ2ewugWd8MJmqRgv/h7a9vCX94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vyHcM2XjBev0RfNUS16Uu7PcXPWLqqryvwFtxW/NpLE=;
 b=jXfwoYp5og1IBxQWCJu9Cmnd0FJfejKzKA5g/BwZB8Q7EE5qHpS0phLgdnxDFEDXozq06abmJimkb1V7f5UlcdPgQDoH4sdc68kdMd0KAtnjD2YW+Q34l5/G4lTvdybwtBpJ25+jnx26HjfwHqGPA7WUlpPiZMHYQmF/egPqsPBvjMm7isyEeXRmvQZK7Gn75aryx4Dx7ED3jW01cz3O6fFGFRDatRzNRcvxfQqOrOOE4MMtgrpj8yPiUnEZAITTqTkmA9OIvj/5Xxp+ITVTETnvg1sLvhECe/P8RwTJaqQBfMhoZoXUdLqbMwaA8FRgLaxsBYhf5/4cp0ewWV05Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7649.namprd11.prod.outlook.com (2603:10b6:8:146::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Fri, 13 Sep
 2024 03:59:25 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.7962.016; Fri, 13 Sep 2024
 03:59:24 +0000
Message-ID: <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
Date: Fri, 13 Sep 2024 09:29:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 2851f985-5755-4998-0ecf-08dcd3a874a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnNvMnJ3c2ZIN09pS2g2aWpNKzNNWFQ3Zkgvbk9Jb0l3OVVZTnprM2EzcE1Z?=
 =?utf-8?B?akZLdXF3d05iSEJUdEtzVmx1MUFGU3RIbUMvSnRaRktnME4zYjhKSGYvck9z?=
 =?utf-8?B?djh0VUxET3NrN1R4QkNOWTVlVDV5aUswN1RVNWl1dVN0aDMzeXZmVWE5b2Mw?=
 =?utf-8?B?VEkxWkNmaHRieUxUeU91NHJxdEwwVzNiSFRZSkNGdU9TdVVvRElJSEpZbEtJ?=
 =?utf-8?B?Tk9ZSFl6QmZnSFYwS3hZQ2Uwc2RrVG93M1dhMFQ1cDFCdmZLZUFYRndCUVBX?=
 =?utf-8?B?a0grZDFKSW5lVm5zUDhsNUNuWXRkR3hBN3B3SDJPTGs4a0RiM1lad1NkQm1C?=
 =?utf-8?B?ampPeU1Mayt4aWZvV3NHbzU4V2RjajZxSjR0T3BGRXlDRk1WdzRTL3VjcUVM?=
 =?utf-8?B?WUd2WHM1UldiQjlmNi92NmgwZlRNelNxNHVNWUQ0TGtaVUl4RW0vazVkRGRi?=
 =?utf-8?B?WXpBZ1NVREZEbWJ6VTExMDMxa3pnOG1XdHlPYnVVT3k0VC8xNWFQVm9tZlZ0?=
 =?utf-8?B?b0NJV0RHTng2MzU1VHBYRUo5VnhGT3M5S0QzQndYVGxoYThzeEZQTjJJdUZK?=
 =?utf-8?B?S3JxMURmQ3RZQ3ZKbkpPNStEdlZyR0psOUdkczVacVllQ0R3b3k5Tk1OWjRu?=
 =?utf-8?B?UGUxTGs0WXVYelFFd1NMZDJpYTI0S1o3TEd0bXNwSmV2bG1Rbk5QeHVMTDhT?=
 =?utf-8?B?WHFXQ252Zm1WWUZwNzhmdDhobnhna3NYNm9lS0VjaTBRLzR2VnJkNEtqN3BB?=
 =?utf-8?B?RnAzb3BQUi9aYTlVQU80aUVSSFl1enIvRE9vb2N4MFpodEdqeExlRmpZUGR6?=
 =?utf-8?B?TEgxN2VPRzhRK3Y5U1NZeElYcUh5MjI0c0dDQzNrMjRIZmpCMG44dGdDV2VJ?=
 =?utf-8?B?YVlHTzVjSUorSU8vNWV3cUdoZjJHdFZlK3lYYnhEd1pjbG5yU3lIMHUxY1Bq?=
 =?utf-8?B?bVFKMG1QdEV3OGJMUTNlNklRY05BWWltT25GS3dGcGNhb3dBSnVWdW5NMEFF?=
 =?utf-8?B?YkRCS3NYb0JJcHdjMDlhUC9oT2V3NFJueG90MzNqbDZBS2R6RlRoMS9samcw?=
 =?utf-8?B?eGlkcFNFQ3ZncUQ5WVM3eDNPNlpIUE9UazdpbFFyYXAwYlRXcVExajU4VFQ2?=
 =?utf-8?B?dkZqU0pMS3ZVaFF1Z05zL09CSUE0WTFqR0QrdHNmcDJPc3ZjZjB1T2d6ZjFY?=
 =?utf-8?B?cjk3MDJyMHdvOVdtWHR3NGwvRXlDcWNBZE5CdW0wUHBBVEVqWXRKb09RNXFs?=
 =?utf-8?B?RENQbjhrU0dOQzlUL1owaXRXQXRnd1EzaThnYlhoS0ZYdDVsc0ZWQm5zNXVJ?=
 =?utf-8?B?dkxDNTVEY0oxQ2tTSjF0Nk5ReUN5cGtld3FxeXZVcFA5SFJIbzdSQjRJd25I?=
 =?utf-8?B?REJ0eHRLUFpxMWJ3MXduQUJjQktXS0gyM29YL0xYRkQveG1XNzZGb3NORWRF?=
 =?utf-8?B?Rm1LcVl1Qjl5MlUxbU95UG5JWjNKYUhrTnk5MU9jOFlyQVpVL0xBUktJa3hO?=
 =?utf-8?B?dDdMaGtueUsrSDJDZjZZUDZtRk4zWS9MTVAwRTEyL1cyeGl0R0dYV291MlFR?=
 =?utf-8?B?U2txdDhNTkZ5c1Q4NndwYkpTb1NEcXl0V01OV2l4S3Avb2w0eFZVVVNlRFpa?=
 =?utf-8?B?cFhtRkt6WGRVSEREankvN0d5Qnd1Tit6SSt6Mm5FelVUZFZUMXNQWWp4cnk3?=
 =?utf-8?B?elExV3BpS1N1Mk1JUVdEbU1jL1AzUms5S3hxcjZSZkY0YXpaTjRqSGtDczFs?=
 =?utf-8?B?Wk5zdEJqS0Y4MTdPbENaR3ZmSE5uLzEvYnkwVmVkY3dYUHJ5eGxYakJZcnBl?=
 =?utf-8?Q?kTVtlBZljfcuq8ked69swF3aj/+J5+ZznzHf4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vko4VnpVd2RXaFhDSDl0bExpRGRsdHdHZVY4YnFxWkJsbTdqODhZNU16bVk4?=
 =?utf-8?B?dFdIM0pOeHREUFZaNks2Zk9EWk56ZWtLN0ZUem5GUnBYbE9MMyt2NEJBVEts?=
 =?utf-8?B?RlZDRFVCMG5udmRWNDR4bkFCenhobitGU3BaZjE4ckhwTjF0LzQ1Ly9zRVph?=
 =?utf-8?B?Nit6UXFld1VPQXhCVndwSDlFUGdSbGFxZHBJZ1hxKzd3K0E3ckM1QnFTT0Jv?=
 =?utf-8?B?Yk9oZTBpRjcrL1Z2VVh4eWc0dlBYSml2bG9lRlRvS2pTeUJjc0p0aEMwc0pM?=
 =?utf-8?B?RVNhL1h3bGFhb3ROc3NadXcwaXlMQVRTZkVzWnFWamhIdHNjMk9hUm5pZWRD?=
 =?utf-8?B?Zjh0UGw0OEpUWEYyVmU0WTIwMTVBUUNvUzlwVkNLOGZzWGhpTXhRMDdCRFox?=
 =?utf-8?B?RGVjUmpES2lid0djaXlNRDVIQ0graTFxVWNsNkJNQkNwWWg2VDhVQ05uOTdn?=
 =?utf-8?B?dlFvTDF3UkdiUy9DWFl0d0wwVTkzZndsMVZKYkJ2TzBiN0RmNGxjNERyN2hE?=
 =?utf-8?B?SXZZRHpKK0VGdDZnWUZISzZOWXhEdXo0Sjc1Z0RQcENqTW1LNGo0WUozc3FQ?=
 =?utf-8?B?RWZIQ3VTTm4yR2p3LzBrajdpMncvcjIwU0lKQVo4YXZKbFpjQ3FzeWVIdUky?=
 =?utf-8?B?ejI2NUZEOVE0WjFhWWhQb2ZNOUxCTktuNEFpcmxkUVNGNzVOVXpaUUtVbW8y?=
 =?utf-8?B?ZE9ZNDVFSUppam9EQStRZkxHZTYrenFWSW1ZbUE3MzdCZCtMYWd2S0VsK0hU?=
 =?utf-8?B?M3c1cDAweUhnd3pPK1RNWEp0bTBReEg4Wk5pZEk4Sk54a3dsRzJsekRsQzg0?=
 =?utf-8?B?SmRXSUFtTlkzVjdQRFNVNUwrdCtsYzFhdHI4Y2o0eVFUMFJubkZZVmVoTDRW?=
 =?utf-8?B?bXo0UnYySkhaOUdydTkxQmlFcFhtOG42MWE3VXBhaWJGSWZPdllHdEtCR2lx?=
 =?utf-8?B?YUZ1dWxhSkJBRWtVdjZINUExZHpzQTBYR1dLMDg1Ui9qVkVNWVpMQWEwWGh1?=
 =?utf-8?B?ejZyaENhczBSVXF2cHdwVyt1QjJiamRyUFgzTW42ZGVhUkFhbkFMVkZtWGZB?=
 =?utf-8?B?d2lNb0srM2JjYW41MTI1cSs0MDBCREZEbmZkbVVFUXJVdkJVbWRyb1RBNkl6?=
 =?utf-8?B?a0wycmx3SzZ3VGV1SkdKOHRqbHZYM1ZqWVdoMHloVHpRVzBIQVVpSnNWc3E3?=
 =?utf-8?B?cHZXUk5JTWtwZ0VLS3dnVWFkS2hIZkFoYWsybUxjV3RhamdZVElKcllQY1A2?=
 =?utf-8?B?YW5tQ0llTEh4RzhWSGdrWEhSWHRQU2pTYkVrclkyenJjQ0ZDSlJ0Zk9GOEoy?=
 =?utf-8?B?QmZjMkZORnFCWDlESzc5U2FhaUpwM3dua2RvTTJadnJ6T3c2KzNzSURZSlow?=
 =?utf-8?B?R0RBamtSTkZLLzJsVkJPMFpoZ0lpYmtsREhWMHdpbFBNRy8xMmI1ZHZLY0tH?=
 =?utf-8?B?cDJ2WWtrUG5teFIrdVJEOXU5aVpVSGtINnpzSm1ra1o4VktUTWJPQUtTZXFG?=
 =?utf-8?B?V0tUL1psUEZvNGFMcFFLc1p1T3d1NWhubmN5L09GYVRycTFJTGtaR201dWRD?=
 =?utf-8?B?cU9HU3psWU1TZ1Jvd3I2TVlzazB4bWVqYS81aENmelBaYjQvNlRwOEI1dWxK?=
 =?utf-8?B?VWxzazBaQlpXbXhDbVZkd2dyQW9UbjlPNkZjbS9yRlNZS1IvcDUxOUdCQ256?=
 =?utf-8?B?MzlpNWNrTGJ4MTh5aVlsVDNCZDdsOEk5RmtabVdjc05IWTRkS0padTdYa0tR?=
 =?utf-8?B?dHdCSlZmWVkxNXZGRWxxcVNNbGYxbDBndFFWK1NQd1QxMWc2dVhEYko4VlZX?=
 =?utf-8?B?TWtscjFHbzRSYSszTFBEYWxpYlhkR3NUVGhQUjNVM2htRmREU3NGdFVYQXE0?=
 =?utf-8?B?VUhBbUZobllYTmZ1UnRDRVpSY2MySTY1Mk5GbUJMenl5K0Zjd2ROQzdxUVdi?=
 =?utf-8?B?RTFhTEthcG5LRkMrSVM5UmN1ZGFLWVVYS1laMW5JeWl0VU9nU3RBcmdoOWtt?=
 =?utf-8?B?MG5LT01lVVZXSGtwQTB3NUdyWUo2dURLSTlxNm5QWnZuZ1YxVG0rMVUyMEFa?=
 =?utf-8?B?K0w5RW5CczRaUDNEaEo2SjBwYzl5SnlZRVJvOWR3cW42NDRYVlBTRFJOY2cr?=
 =?utf-8?B?M2FZaDFnSnlXWTBLMkV6bTMreXZhbXdCRnlMTVhDbXViRDhlWW9HN1FTbktw?=
 =?utf-8?Q?vWNCDh2tjZKaGPE/W7XoBow=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2851f985-5755-4998-0ecf-08dcd3a874a2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 03:59:24.7651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbmA3rT0WUfTx19lMHApRnnT1Jwq1PbRypHEUqG8ogwf3+a5VV3hJjene6Wy2cHuwzVzLGOklmD8UNOiAh2AZAXma9I29E4Q1XaKAc4SEic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7649
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



On 13-09-2024 03:01, Michal Wajdeczko wrote:
> 
> 
> On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
>> If an acknowledgment timeout occurs for a domain awake request, do not
>> increment the reference count for the domain. This ensures that
>> subsequent _get calls do not incorrectly assume the domain is awake. The
>> return value is a mask of domains whose reference counts were
>> incremented, and these domains need to be released using
>> xe_force_wake_put.
>>
>> The caller needs to compare the return value with the input domains to
>> determine the success or failure of the operation and decide whether to
>> continue or return accordingly.
>>
>> While at it, add simple kernel-doc for xe_force_wake_get()
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 35 +++++++++++++++++++++++++-----
>>   1 file changed, 29 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index a64c14757c84..fa42d652d23f 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>   					 (ffs(tmp__) - 1))) && \
>>   					 domain__->reg_ctl.addr)
>>   
>> +/**
>> + * xe_force_wake_get : Increase the domain refcount; if it was 0 initially, wake the domain
> 
> while likely this is still recognized by the kernel-doc tool, this is
> not correct notation for the function() documentation


I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
will fix it.


> 
> [1] https://docs.kernel.org/doc-guide/kernel-doc.html#function-documentation
> 
>> + * @fw: struct xe_force_wake
>> + * @domains: forcewake domains to get refcount on
>> + *
>> + * Increment refcount for the force-wake domain. If the domain is
>> + * asleep, awaken it and wait for acknowledgment within the specified
>> + * timeout. If a timeout occurs, decrement the refcount.
> 
> not sure if doc shall be 1:1 of low level implementation details

Does this sound okay ?
This function takes references for the input @domains and wakes them if 
they are asleep.

> 
>> + * The caller should compare the return value with the @domains to
>> + * determine the success or failure of the operation.
>> + *
>> + * Return: mask of refcount increased domains.
> 
> if we return a 'mask' then maybe it should be of 'unsigned int' type?

Agreed. Will fix in next version.

> 
>> If the return value is
>> + * equal to the input parameter @domains, the operation is considered
>> + * successful. Otherwise, the operation is considered a failure, and
>> + * the caller should handle the failure case, potentially returning
>> + * -ETIMEDOUT.
> 
> it looks that all problems with the nice API is due to the
> XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
> 
> maybe there should be different pair of functions:

I am not convinced with different pair of functions:

In current implementation:

int mask = xe_force_wake_get(fw, domains)
if (mask != domains) {
	Non critical path continue with warning;
	 or
	critical path:
		xe_force_wake_put(fw, mask);
		return -ETIMEDOUT;
}

do_ops;
xe_force_wake_put(fw, mask);
return err;

Above flow remains intact irrespective of individual domains or 
FORCEWAKE_ALL.

In case of individual domains if (mask != domains) can be replaced with
(!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path 
since mask is 0;


> 
> // for single domain where ret=0 is success, ret<0 is error

This leads to caller only calling xe_force_wake_put incase of get 
success. so in case of caller continuing with failure, he will need to 
ensure the put is not called.

for example:
int ret;

ret = xe_force_wake_get(fw, DOMAIN_GT);
XE_WARN_ON(ret)
if(!ret)
	xe_force_wake_put(fw, DOMAIN_GT);

> int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
> void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
> 
> and
> 
> // for all domain where ret=0 is success, ret<0 is error
> int int xe_force_wake_get_all(fw);
> void xe_force_wake_put_all(fw);

In case of xe_force_wake_get_all(fw) failure, how the caller will know 
which domains got awake and which failed ?

ret = xe_force_wake_get_all(fw);
if(!ret)
    No way to put awake domains to sleep

> 
> and
> 
> // input: mask of domains, return: mask of domain
> unsigned int xe_force_wake_get_mask(fw, mask);
> void xe_force_wake_put_mask(fw, mask);
> 
> this last one can be just main implementation (static or public if we
> really want to continue with random set of enabled domains)
> 
>> + */
>>   int xe_force_wake_get(struct xe_force_wake *fw,
>>   		      enum xe_force_wake_domains domains)
>>   {
>>   	struct xe_gt *gt = fw->gt;
>>   	struct xe_force_wake_domain *domain;
>> -	enum xe_force_wake_domains tmp, woken = 0;
>> +	enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
> 
> it looks that you're abusing even more all enum variables by treating
> them as plain integers

Miss at my end. Will address them in next version.

> 
>>   	unsigned long flags;
>> -	int ret = 0;
>> +	int ret = domains;
>>   
>>   	spin_lock_irqsave(&fw->lock, flags);
>>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>>   		if (!domain->ref++) {
>> -			woken |= BIT(domain->id);
>> +			awake_rqst |= BIT(domain->id);
>>   			domain_wake(gt, domain);
>>   		}
>>   	}
>> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
>> -		ret |= domain_wake_wait(gt, domain);
>> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
>> +		if (domain_wake_wait(gt, domain) == 0) {
>> +			awake_ack |= BIT(domain->id);
>> +		} else {
>> +			ret &= ~BIT(domain->id);
>> +			--domain->ref;
>> +		}
>>   	}
>> -	fw->awake_domains |= woken;
>> +
>> +	fw->awake_domains |= awake_ack;
>>   	spin_unlock_irqrestore(&fw->lock, flags);
>>   
>>   	return ret;
