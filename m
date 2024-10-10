Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48735CEE323
	for <intel-xe@archiver.kernel.org>; Thu, 10 Oct 2024 09:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165FB10E8B1;
	Thu, 10 Oct 2024 09:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cAy7s3xT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE27B10E8B1
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Oct 2024 09:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728553198; x=1760089198;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=h0pvRnM4PSICCRqbX+yDe4XeLp5/HOhH1r5+/91JdFo=;
 b=cAy7s3xTiAXqIb/AfXJ+sLQ1iHGZcLkgiT96/2t9nRKdU+NNvcw7QmBC
 MBN52Bbo66GYyFiH2t2ZwxZ5C5vzf2jGwMJqeXpwuqO7/PszpgVuvy4nL
 V9l17zoJJT11F7l5+GgOQnIioI71gc9fIUelxTJfomuZpDjuABbCF8Rjh
 YTzSDQMiKWsj8UeiP6J/2kyhiZ/BQEU1TzyKyDTKGf4gNerarVWbVcvu3
 NidrtSUOGe1sXy2qkaVFFGmsGJEzoy7H9BQl+y5Mq1CTGsoJ7x4A4W15y
 3OgIf9P91VQ5OjGnNLqFCyEAFp9elN5Gc02DLdbbEQ+GIoOF9rFVRJ3+s A==;
X-CSE-ConnectionGUID: 7w+mRxv9QoKBOlUpnlyvdg==
X-CSE-MsgGUID: MgOXnPmeRcG5Iw893yy71g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28016747"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="28016747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 02:39:48 -0700
X-CSE-ConnectionGUID: U7s6RgTpS6G1FVj43EPKDw==
X-CSE-MsgGUID: pl+IkNZQQke1lgH2m7oVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="76633506"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 02:39:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 02:39:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 02:39:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 02:39:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pDHBy2o75kp1Ajs/1Z8b0CcAZk6xhi4vWrCUZfcSUFR17GNo7KuavUTb6BGyBogiG5/WfBt9IzyMgzNuFTfAwYQAPb0A/0ERP1q6u7YdWxWKFnBMNX1IIJdiybHGrBTzJJClOEslGWeA9ta3ojA7OVmLb7gir+WMEVJjI8NCFHWc3G8hZlKPp54Zcq6NxpGBT2M/Mr7N1VGOrrh2ygLJsx3zqh92NLHM65IaaAhMp+SZwUPwRax9YyVLQINNIoKd4Z03ECwopIKa5wRevSQfrVxQcOxRzKVemkwGwwby95J9nnu128cMAA8Trt+lJxxTvApyNtaau6MCmAnBKP1zMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3dXOYzotnCPLrnZkNeWoZEt2ZND1n7KX928Ne7T/mu0=;
 b=FMEeDVGesmR+3JPuxv2puXPR8DLh7CdJzf6EPphxF2z68sI2f2iDvoMTz/4WBXPIlQah4HWegsG6J8YUsSZPartG1+TDT0e5PLIak+FRgTa/BG9oSEdSkW23r68kjDYH1o9cOzKGzO5NKsPCgG2ktu7GbdU6M0+NGUpdCdqpU07Hibd/dcce8VcuPUvJr1jmMaYdlngJSut8gTG4CjLB+sk7ueX8Djsv/Gwv7HDuAhyoWzU5Di2LXDyPpmC7u0EWF8jXtp/MFbkA8pJIiBj3mw1ryTRiaow2WGC8AI0ww60zp6vrMMSBdvTx6mSVZEjiRrijstsNdsuW1CzP+JhEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 09:39:38 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%3]) with mapi id 15.20.8048.017; Thu, 10 Oct 2024
 09:39:38 +0000
Message-ID: <5907dd91-4aac-4d41-a85d-13cbef8de44f@intel.com>
Date: Thu, 10 Oct 2024 15:09:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/query: Tidy up error EFAULT returns
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20241010034847.389734-1-lucas.demarchi@intel.com>
 <20241010034847.389734-3-lucas.demarchi@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241010034847.389734-3-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 3534e399-6a55-4ae5-2561-08dce90f7521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnZDM1Y1U2l4cGM4ZmtkVlhTdXVvbmYvcHFKVUF3Qm1nRWozQzM2OXVRQ25L?=
 =?utf-8?B?L0xWazVjNU94RVhTaEl2TVlmbmx0cE12eUtZRmZLalpPeFhlUDNrM3hndklz?=
 =?utf-8?B?aHl5UW81Mm5uSUQ4Rno3TitIVDJwM2duVko3TXVObFVKQzZrRS9FUnpEMnlv?=
 =?utf-8?B?TU84OWxyYTZwSnYrK011R1QvaVpyeHZ4UlFXLzl6MHVYQytJMUdCdHdEMGhH?=
 =?utf-8?B?SFhiUTl4c0JtUjlVREVRT0N4WS9HeUdocjZBdVR2OFdRZnZQRkNrSXpRRGlJ?=
 =?utf-8?B?V2tzaFRpRUJkMEhTSDBYS1Y0SlNhbEExNlVBM29SVEZZWlcwbnQ4b25JbjY0?=
 =?utf-8?B?M3RVSFZlMlNQbjFudUthZXJFVHo1a3dqNHVOQjhsVlJSdVNvZTFldGpkemhr?=
 =?utf-8?B?V3RxTFdiSTcyUGJtSUpHbHM3TVJ0aXdkem1RZUtNMUswZXoxUGtvaXJFZGsw?=
 =?utf-8?B?dGl1RzJGUTI4WTJBT09CdGZlWkhsdFhGVVVIbHl3dGxpQzI0RHJLSHVQb2sx?=
 =?utf-8?B?cGJ3b1FZUGJXdGgyZDNFaUJRTFZRWGhLK2JwYUpSZEYxdXNHS3NvZWhLN2lR?=
 =?utf-8?B?RG5jRmZLTktCMGEwOElIT1pKMEJTZnlwVEFsaVhTSUYzdUtWRFpWVGk1Vzk3?=
 =?utf-8?B?TGk1SXliWXRra3pVVEV4YTVJL2NZS1RtWW5VZHpIRHlUZ1N1QWw5R25NTmdn?=
 =?utf-8?B?Mm9XckVPY1lqNEVHSngwRTVoZWRxQzlOT1UvVnhiMkU1TzdVYUVlVE1sMTJY?=
 =?utf-8?B?THMyR1ZyZTJMakZmbm9NUVZaR0NuNG00dWttZlByM2Rkdkx6MHhXMjYxTldI?=
 =?utf-8?B?NVgweEYwalVvOHJuNEl3c3JjZTlqTTBlVGhjZnl5M2kvLy91U2YxQ0toVnRh?=
 =?utf-8?B?SWl1Kys0ZTQ2blJoOC82Nmx3TXdXaVd1aTYvcUw1eUcydVJUajZBMFJKdGNy?=
 =?utf-8?B?a3RqZGZaUGwvUlN0MmRpbVdENGFvaitROG1SZkpSTXN0d1NpbU5JaTFPVExl?=
 =?utf-8?B?bmdEZEhkQ3o2YlNEMGpZSWZVanU5cGZFZklzMm1FalJSeTNuODFvREl4Y3pz?=
 =?utf-8?B?WjRkc1o3OEZqcWtMWWQ2OWUwakFjTjZlZ0ZZcHlWeFB3ZlpQb3pjcVFsV3RC?=
 =?utf-8?B?MXBOSFV3cVRpcHh0SjZJbStyQXd5MGhvQ1crdUFwUFhzNFg0MFFMYjdQNGZF?=
 =?utf-8?B?dTRFWFZleWlVTzBmWXV6WERNUDJOUGRFM2FHelBxT0NYVzB0blJnTERyQXhq?=
 =?utf-8?B?N2N3NDFvVTJFOGE1UTMxVVRhRkVLaFVTSERwNVVVQXIxbEdyVEExSEJJc0dC?=
 =?utf-8?B?LzdNemREWWVYVllpREhXd1BSS1NmZmVFaXhoWk45VDZWNUczYlFYdTI5WWl4?=
 =?utf-8?B?aWxhN0dpU05ZVDY3dVd1SUNYRVU1c3NES3FUZnU0RXBhTWE1cWZ1dFVXQlZs?=
 =?utf-8?B?UWYvTFBqL2lmKzVST1JXajViNkxFT05kMy9hb2phVE0xMDlwNGtDQWxMRlhm?=
 =?utf-8?B?clZVNXc1OGJWVXB0S3ErL0NuYnk0TDRmMnlXV1NhYTZrc1p0ZFVtTnhxUVEw?=
 =?utf-8?B?Ny8vUVE1dVlKUzFKZlFBTmRnWkx5VzZYZFQ3cXE1dGZ1MXBvd2hiSGI3WHlL?=
 =?utf-8?B?WkpvekxqQnNlbS9SZXp5a0ZpUENOTytBTnZranhDZ2NRTWZyU0I3UzVadFZC?=
 =?utf-8?B?NDRiUjlwRGJzMnR4eEcrdWFlYmNDQzVPQnNHY2Z6QlFZbGg3RzVGMWlRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3kwbFJzK0FjYVdtaEZ3Q2ZzZ3drTUFiOVBBY3JWeGp3ak05QTVUbndaOVpv?=
 =?utf-8?B?WVE2SVo0RlJVNFE1Q2R2cWZmR0ZhcVE4NWQ0dmNRaXBhWWF5YmpQck5IRlhX?=
 =?utf-8?B?cUJaVGF4YklZM2xUSGU3Uk1BeTVXYnJNSlE0VlEzN1RmTk1FZW5iczJJS1dM?=
 =?utf-8?B?Snl2ZXNMMExVNzQyYUpFNGVweC9aKzB1bmZCNll5UjBDZi9sR1dlSU5xM2tS?=
 =?utf-8?B?UXF5eUJNeWZoM0NLcTFqbzRHTGtwOVdGSDlVMlUxV1E3Qm9CdUFNV1RpZjRu?=
 =?utf-8?B?Z0ZwSG13TFpOeUpaMWtUU0FJZHd4WHZKRjgrQWpHUEswdVhnL0VSdExyam5s?=
 =?utf-8?B?dnJkODlxaTdTS0JNWmtJazRFWUw2dTRGMlJnME9Hb3VIS3F2NEpqQ0J4RVdM?=
 =?utf-8?B?aE52MTNhOHgwM044cHNxdzdveDZvcXE2RzhpeTZLdXRFeDZJOWMzOE9SbU42?=
 =?utf-8?B?ZEVwMnhSVnp5RGsyKzlIZUdKRVN4M3FMZmY0SzVyRzNJbUVzaFJDRHNudkRF?=
 =?utf-8?B?amVHU2Q3OXhoU2ZTNDBZUTRwYXpPMExVTzFkajJwZzBWWnBxMFNxKytaaTU2?=
 =?utf-8?B?NE52N0Y5RkZLY0dJak44VDFIQzZpNHh6cVF0MlcwaUdPK0MwbXNEWW52YzAr?=
 =?utf-8?B?UXAvUkRiSlVSRmE4UkpmaXFGVDRqWHFac3F0R3dpTkhqWkxZZjc2VUd3VUMv?=
 =?utf-8?B?c0tEVjFSTG54aWI5SjB4cW02VW5laC9LU3RQSzNzUUkzUlluS1laYzlydEFp?=
 =?utf-8?B?MUw4WlpOQWNBbDZKQTV2RHQ5akhxcjc2YmdyVnJoVGJQU2ZlOUVQd0w3Zlg5?=
 =?utf-8?B?THFvM3ZXTDVhOVNpRFJMWU0rWDRlVEJoRmg2L0ZqSnNraHRjYzNwL3I0Tnpx?=
 =?utf-8?B?eTljMUZHYk4zM3hjaFZ1MzZ0TElGRVlHaXdpamgxQ0lSa2FIUnVOS2ErZ3Z0?=
 =?utf-8?B?elBCRGZUUTREbE0xQlV3ZFhuY3AxeElVVTZGdWNXd2ZhN0VzQXQwZHBkSGFF?=
 =?utf-8?B?bjFoN29EWENnN2xnSEhTWWdOWUlXemF0SWhnVmZiV3hKWEk3K3poSkl6NU1p?=
 =?utf-8?B?a0ppR28wL0N0QkFsaVZCWmxib3NCZi8zYitjMHlSREp3eWMrVzZvQ040UnRn?=
 =?utf-8?B?aDMxVXpGT1luMk5PRnVyazltbHFuVE1xR2h1R3U2WkpQRXdONUhjQnRBVlZn?=
 =?utf-8?B?V1g5K0pmNEpQMGRYTnFGRVBSRUluck9aOE96T0d3MWIvRWdtdk8rN3ZpSndE?=
 =?utf-8?B?bWJvS1JzbUU1WkttelZRdEEyTDFSVWVsK2ZxdllsZVdtQyt3WTdpWmVxUklH?=
 =?utf-8?B?QmJzNEx2YTRLbGJtOURWMjRuazFFdUZOMld6YVJuQW52cUJXSy8yYWhIRnBR?=
 =?utf-8?B?OXBqM3ZqRHZDTmEwcXl5YlBrMk16aXh2SkVsUjJoOUE1dEk5RnZSMlFzQmxR?=
 =?utf-8?B?aTdaTDhsM2ZZZE1FVkxFOTFsZ2xBTlFodHdFOWtsSFUxV09tMVFheVM4WDFM?=
 =?utf-8?B?VEhRVWJlTGZIdlRRdUNUM2tSbGdsOC9LWHQyZHM1V1h3amtkMjhIQW0vWUpY?=
 =?utf-8?B?VmJ2NlJJT3VSaEg3dGNkVVAzaGl4SVh6NTlOd1Q2L3FlSU9HT2szZjVkQ0tj?=
 =?utf-8?B?N3VjM0ZFYWlVbHFSbDJqOFBLd2ZLL1EyRkkzV083dXlEcE5xZ0ZyNVNWV3cx?=
 =?utf-8?B?NTJmZnd1MkU2NlV6bk5BOTVpT2RrWUtaajlTUE5Wd2Yzdlhydk9ERENzY1pp?=
 =?utf-8?B?UXdDdU10dUFDSW5YSHVYVEdwVWFaSVdYYWdDaEVaRDMzejBpeno4SXRWSmFy?=
 =?utf-8?B?cVE4TWFxRERSbGtIRE94cVdaNy9XTXdkOVZSQTdaWU5XQldFRXkrNFhjOXpr?=
 =?utf-8?B?NExod3RtS3NuMVBpVDNuanFRTHRQUVh1VHpmQXhLdWlvMDdoOTVjcXJ4S1ls?=
 =?utf-8?B?NEF5MVRnQmNQanFlVU9HdUFUTHcwaDJiN2FSQi9yV1gwdW9CUnc4QmQ3QTFN?=
 =?utf-8?B?YXBQTFpycmpYV2k3YUF6REFCQ2R2TUVrMlZUaE9FZi9TYmszQzZNQTh2a1JJ?=
 =?utf-8?B?Y2o4WFZmRkVySmMxUU1MczRYVGpuVjl5aUo5RUdCU3k4Q0lCdTU3NGVYRVRv?=
 =?utf-8?B?Zm54KzN3b2RmVVRSdDVPMkc3dFdWNC9MRjdNZFJ3dlJlZzVmRWVvRnRURXUw?=
 =?utf-8?B?U2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3534e399-6a55-4ae5-2561-08dce90f7521
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 09:39:37.9960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Ul8e/uSQyJqcKAYr1FEXv8ckL1D17qu5Y/W1q+NPfDb8f6HQk7zFPCC6moLCjpi8JiyzHapxYyqZVSXwxyFuS5AHj4exvPmqbOmx3DvZSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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


On 10-10-2024 09:18, Lucas De Marchi wrote:
> Move the error handling together in a single branch since all of them
> are doing similar thing and return the same error.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

The logic remains the same, LGTM,

Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_query.c | 14 ++++----------
>   1 file changed, 4 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index d86959076b078..cd2799c0ba510 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -163,16 +163,10 @@ query_engine_cycles(struct xe_device *xe,
>   		resp.width = 36;
>   
>   	/* Only write to the output fields of user query */
> -	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp))
> -		return -EFAULT;
> -
> -	if (put_user(resp.cpu_delta, &query_ptr->cpu_delta))
> -		return -EFAULT;
> -
> -	if (put_user(resp.engine_cycles, &query_ptr->engine_cycles))
> -		return -EFAULT;
> -
> -	if (put_user(resp.width, &query_ptr->width))
> +	if (put_user(resp.cpu_timestamp, &query_ptr->cpu_timestamp) ||
> +	    put_user(resp.cpu_delta, &query_ptr->cpu_delta) ||
> +	    put_user(resp.engine_cycles, &query_ptr->engine_cycles) ||
> +	    put_user(resp.width, &query_ptr->width))
>   		return -EFAULT;
>   
>   	return 0;
