Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DB1D2C12D
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 15:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D4110E406;
	Tue,  5 Nov 2024 15:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YifS8un/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A6B10E406
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730820036; x=1762356036;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Aiae42d+suxvgYNU0glBnT9N9s3QS7eJcVCCxabGako=;
 b=YifS8un/RVWMEYsVfrzld/joMH7LHnU04jlAbnlwlJ7lWw3OfUbbKjwm
 pbdA3fruikJOcUU382asBqimrtLmFvHxFjIRgeL0uQajbHaOYCN4RW7K2
 pVLUC8zdiRlPeksYPuR2VuwlNp6y5h7c7/HWoEs2hfPszrOm+LjUCYt9Z
 AHtonfSJGN+D/pblh2tHEF95XtY2LKaRnbOHBkro23p5BFWL8ojPw5GnD
 s4GVM0PIqEfjndlS1FLYLDwqs8ocjn3fVZ0u2fYX3f4rcqAy60V7sycv7
 JwKYdAtpCjnD/rZ3bxbA6ltHyn/US1H5AAvKGfX1s6UkSmmk9ZzBScviN A==;
X-CSE-ConnectionGUID: n9v04Y//R4mWEago1Lb8lQ==
X-CSE-MsgGUID: Foclp14pSqmKi46insriJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34359527"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="34359527"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 07:20:36 -0800
X-CSE-ConnectionGUID: BbJNbEZ/RamUKb/OvVVyvQ==
X-CSE-MsgGUID: 75qQRLQ3TFC/N9J7Ea8C/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="84387654"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 07:20:36 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 07:20:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 07:20:35 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 07:20:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yc7beklFyo0nzIGkONxQACvCWgiwO5i0ijnHEEzsJO8ZFAALxFEUfVGL6uANHm3hP+LIprXeWcSVs8r7niizCTnHbxVAdVF8GJnIsQ/jJ2GhFDLQMxb+Knm+2s2dV0otGyvwtvb60Ox72MbnbTbq2r+yUMcjPJ3EFeapf85vWCQ4kWt+/HWT8pX1ggLq0w5T/OGk3FAZvig+1jTd1ZWJM/DJykxx+FP/RvE7zJ7rmLnwm+i9y99ZsiPD4F8nZipk2L41XUd474kE3NJx1aoXgTmx2w1w9QE3bPYY9pDTJpikS0Aw1fZtXXXxFAIPkomYrQCu8lVCEshBrUNssRN7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgyAZptvnS+fuRYiAa/Qx3XUSbKdwCY7SU06gKnOTYg=;
 b=JssvFypgdivbMWNfMmGPdvzA0MJ978gnuyRM4aVuRxpMdZaGSaEIsVi++RrgPx6Lbv+5qrlC/V8nosazE+zeOlvV1hdIHf4tLJ831MXQTnVZ4opZowhRP3dAjnUdawhgOo0FkBrSgkqPq/Ra3skbqKa1YuiMaeVP4T8y4///XKbjZ7o4VCFSR9mv/S7++beyNj2zBBRg/CEL/aIxgderhPkgOjJJlj2tfEpKFL+mFGecaI8nzexbAUec90vd5rzYbuOncFm3jmpI0dId9Gpk1EhLfYQDmoTEjiRcdmYhjD1fqf5L9OICMCPDK1jIuypf8Zb4vNgUe1C5RJOvgVT0Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by MW3PR11MB4698.namprd11.prod.outlook.com (2603:10b6:303:5a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 15:20:29 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 15:20:28 +0000
Message-ID: <70144d1b-b56f-426c-9a4f-d641af2a6ee1@intel.com>
Date: Tue, 5 Nov 2024 10:20:26 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/guc=3A_Fi?=
 =?UTF-8?Q?x_missing_init_value_and_add_register_order_check?=
To: <intel-xe@lists.freedesktop.org>
References: <20241104182425.162007-1-zhanjun.dong@intel.com>
 <173081096202.1412035.3833085597004110387@2413ebb6fbb6>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173081096202.1412035.3833085597004110387@2413ebb6fbb6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0041.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::18) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|MW3PR11MB4698:EE_
X-MS-Office365-Filtering-Correlation-Id: 5509cc4d-85f4-4b0f-60d8-08dcfdad6170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2M2Z2NBVXlkWk1HcURNMWY1bVpPeDIwendYeW84a2xFQlhZVUVVTG55bmUz?=
 =?utf-8?B?TlBkY1BWNlVsbXRtUVFXQUJ5Um1Ib0t3bE13MTRlWUNEazZhNmFPTHdvUW1m?=
 =?utf-8?B?VFFNWURWRTd6ZUtRdGpqVFhydCthUWdVT3ppdCtkaE9UZlpnZkxOWnIzYmg5?=
 =?utf-8?B?OHVhb3lJZ0trNVpISmN2TnppTDFJd2hJYjlKUkszZkJJcmVOVkdyWTZvODMv?=
 =?utf-8?B?SGdZbWUrMzVjMW9sRE5Jc0Vjb3Z6c0RqdWJHSzRLa2J4SDJFMzJQVUxPQzVs?=
 =?utf-8?B?L0VVcCtMbDV3MUdCS1hZWWxiVTlwMjI4Z1Q2RmdNOEgrYnpaTGRjSndNNUtM?=
 =?utf-8?B?elNaOGwxZ0hZUkhkMHFkeVl0WFZwU3N0aXVpeUkwNEdoM1BTU3JvQmJzM3ln?=
 =?utf-8?B?Mmg1R25EZnZvcnJzMU5xT0tKUDZ4UUt2QUtmL1dmUzhBMmNESndxSG95aERy?=
 =?utf-8?B?aXkxVHM0MksvWnZLVzFVRVNsZzVxa2svTG0veDBlOUtqeDBuaVBBem91Skh5?=
 =?utf-8?B?VS8zayt4UEZwRTVoWlJaa25Rcy9vN2lhUnc5OS9tVjdldDB4cWU0REdFbHE3?=
 =?utf-8?B?WnZZVC8wTEd5MnRUZnJkejdwNVE5YVVmbldraDNVMnZMbjBJd2RiWWZQRGtV?=
 =?utf-8?B?S0pjYjkvWFc4N2FDdkE5eXR3ZEtWZkpLOU9hcVIwNUJoc205aHFYUUo1U0Zn?=
 =?utf-8?B?YkhLcFVRMlpzYVBIU2FlczBwa0RtNXQ2eU9nVHJwTzlSczVVd3liVFI1MGZj?=
 =?utf-8?B?aTM5VjBtdVRVajBUNFdoQWZQQ1hJRWhiKy83WmVkQldtWnZpWWNaTXI2Yi85?=
 =?utf-8?B?Sm02czJDR21pcFFTSnFMWTdTTUQrYVQyaFFLZCt5SXlEZklKeEswaGJ6SFJD?=
 =?utf-8?B?UG92U3phc1p6d29xdTZjUFl0dWxwT2lqVGdMb2FNZ0FjanhWM0RCYXViL2xG?=
 =?utf-8?B?YU1KN1RvU0ZkcC9JOXluUkdsdytaZXBDR1Bvbzc2Q0hCaXN6anE4UWp4Nmox?=
 =?utf-8?B?cnNIUEd6b3ZPbzNMSUZlQVpxY1NKSDdVRlI2UTB0MXRDbDJBeXBUWXZieXBW?=
 =?utf-8?B?WndsNGJhakZjSGNYNTNwNnV5K1dSRGkrbmpYRk9mSGdZWEZTY3E4RFJudDhP?=
 =?utf-8?B?Rk5ERmxXVUM2cXdVTXdKYVJzQTA2amlCaTVhMFdrazRjS2hJd0lCY25GNDRF?=
 =?utf-8?B?ZUg1c2J4WE41WFdqNUJ0VlZFWTE5U2EvY1hZZXczdjl3TDBFL2RTSDU1OWVx?=
 =?utf-8?B?VVJuM055QkRuQ0JkVkpuUFRFWEx5TDB5MnNlajZESy9nR1Nla2cvQ2RvbjFq?=
 =?utf-8?B?YlgwdWNacFpXRE0rWjh1TXE2VUt0L05VQXV4UW9KT2xrK3lhOTA4U05zejlj?=
 =?utf-8?B?TDhERndSQW13SmtKa29aL3dzN3NYZk5WSVVpSmZoSDhnYXBib3pOMTdoQnB5?=
 =?utf-8?B?bTZWM1JESXNtWEkzTTdjWThPOGV5SGxLZUl4R1QrWFhwOUJaa3Y5dTY3RmN5?=
 =?utf-8?B?UjgxRzFka1M0aEdNR1dZUk0xYkxlSzNDZTRlYWVpeEMvN25lbGdsVWJPdGRm?=
 =?utf-8?B?NnhlSjh1VUd6bG1mSkhCd2JqT3RkU1V3VGxIK3N1SlQxYVhaelllYWVDZytO?=
 =?utf-8?B?U0QyMUJWaDYvaXlYVWYrRTlOcEIrSTlXbGlFK3QyMEc3MzdiVWNTOW1ROFZo?=
 =?utf-8?B?eXNQVElJWFVpNVRSZzYrV1FaYVpyMkFCU2ZUVmJXc2NIYytsZ3duM2FBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STY3MnJBUWIyOEoxcWZVN3lFb212a3B0c08xS0JjM0VXUkVXOEZ6MXFiaEl4?=
 =?utf-8?B?Nk05dHljandvbllQOVhoRTUzQmJvVXpNUk9oU3oxdWF1bkdnbHVLV3kvR2RG?=
 =?utf-8?B?eHh1eXdBTVNYMVVVVHhBaVRTWkZpd0p4QlJhTnIyMWRDbURnOVdEeEJ5R1gv?=
 =?utf-8?B?WFBCUyt3czJjNjViN2l0Y0pKbFB2emhSYlZvTytVb1J0cmN3SlBUQm01b1l4?=
 =?utf-8?B?dXI4SGdVeUNrejVNaUd6cktvSkJyV0tCdjFvUGZLWHhnMDRJWW1ucmMzN3Y0?=
 =?utf-8?B?cVExaVJEcFlYZG54VkgzTFcwbFExL1JyYjVPakZ0bVd0USt0QkpQY3VDamc0?=
 =?utf-8?B?Ylpya1ZRMEtIMEpLUG1iQmF1MTdEWHZxZ1UrMUtkbUl2MG5zcVFDSEIvaVZW?=
 =?utf-8?B?QVlBYkVzcytLb1dQY3BCS1VMZ0VxaTNmWXhaR1JFZlRiQTF6ZVR0U0pmeFB2?=
 =?utf-8?B?aENHb29WcUlsbFJ1ZUY0cVEzTUpoTWlmbG1VU1hYbXJGcVM0LzFaK3BnenBQ?=
 =?utf-8?B?a3BKMEhkVUJZNUZLWk9jZjZVTFlUQTFXOUlSdUJmaXBTRjAxYjVsanpyRWpN?=
 =?utf-8?B?OUlIYUhiUDcvWEw3QUZmdGtBdWY2VUFLM2E0SGZMaDRqQ0Noa09OYnVVdUwr?=
 =?utf-8?B?NkZ5Q2Y1QTV5WWpRTVlISUNQUTU0MzFYNDFtUUVXRG5EamI2T1NHa2NCQmRQ?=
 =?utf-8?B?ZkRYRnV0TWU0QS93ZkJLWE04VGNEZEg0dUVHYmNJRmIyZFJBK2JKTWxxaVk0?=
 =?utf-8?B?QmR0SG82SW8rakp5THJNb2tnNXU2Wi9UYXpKRk81ZUNQWCt6Y28veU0rcDg2?=
 =?utf-8?B?YldROWNLeTZTSXZGQWdrSnZlODV3TmIxNDdDem9JdVgremNkRU9JZkRMZGh0?=
 =?utf-8?B?d09paGRYeHBidUs4UTBOVms4MlpHNkY5cHVsVE5HOEU5S1JjSW94MEQ2ditE?=
 =?utf-8?B?Z1lJbm9aRHRHdXA4cW5nWWpXa1d0eWtYRmZ5N1JnUVFJSHBGSUl0Y3RvejlT?=
 =?utf-8?B?S2VDdkJESnNmdXBONjZWSytZVml5ZEtyd3Q5OCtPYjJrVjhOVnhUZ3FzUC92?=
 =?utf-8?B?ak83U1dsZ1FDKzNERWcwemVyTCt1Ui91VDdMN3loby9BYUc0WjhwMStVcXV3?=
 =?utf-8?B?YS9ZNWd3T1pkanFHdGkrbTdNNmoyRGJXSnBKcXQ3QVV3MFplQ1NCUFZscDd0?=
 =?utf-8?B?QVJRY3kzbS9xNks5bHpiQkNDajM2dzRrTHN4bmQ4alZ1dzJTcnRFclJGNnpX?=
 =?utf-8?B?SENOQk5DYk5DWklOUjRJQ2RlUHd0bU5mYjBRWFdsY1MwRVlBL3R4dWJCSzZG?=
 =?utf-8?B?MVRSTUkrbnQ0bkJhdmJnaHFiUXFTL3VJanZrUHY0bWxwQ1VzenNqNmpXeWdy?=
 =?utf-8?B?aVZyM2drQkFkZE5VVmphUFhaSmZjaXRDZE92dzVxUDNMVmRnZVg3U2F6QXV5?=
 =?utf-8?B?MEdtY2EyRk8rZ3dWNEZHUHViUEdZZEFOamx4RnhLZXROa09CQjVaRktPMkox?=
 =?utf-8?B?Q2JNMzhZYk0wbkcwWno2RTIzMzhxV0p2enUxTDVPNmRtR290eTZDNnZqaDgy?=
 =?utf-8?B?VXdnTzQ4dlkrcmhXaklCbWJMMkZ0eStFZy9sTjRNM2svYUpZcmYzK3RYZlpK?=
 =?utf-8?B?S0RLR0E5TDNtY2EwRzNCVFA4N3ByVUxGTUZmVjd2dHJ6NjBGWThCM3grRGcr?=
 =?utf-8?B?WmdXQnEvdnp4ZTl5aUY0d1dzSXdvbnBnUXhDS0dLdkpjUW1LbG9tb0hoSWc4?=
 =?utf-8?B?ZlhualZMYm9sUUw4U1UrY0lHS2kyQ2F6NjdFYlg4bHJhejRvem01a3VmQzNn?=
 =?utf-8?B?blFESnFrdkhTNWRpUzdIV3dndHUzblpIUVVqWlNuRmNZSGphZHVpY25Qc2h1?=
 =?utf-8?B?TlBpNk1mQ1BYalBlMTQyZzRjejBTcEtjb3Jobis2R1ZBcEdOTEZpeE5tMjlo?=
 =?utf-8?B?YUhEbnU4VkZ2dDFMVkJ3STdwUVhpYzFzODFnSCt1dzNYNjRWRnIvVENUek9n?=
 =?utf-8?B?TFJlL2tGR2Fydko4QmFlMG9oc1JUTjVoMk1FZk1KUEZNSUlDOU9aTFZ1amVU?=
 =?utf-8?B?bTBnL2Y1cU8xZDQyQ3YxR1UvWDhEMHV4YWhPK1FIVWpmTlR0YXEwVlhhK3p1?=
 =?utf-8?Q?q39wOH3G++qJ5zT6NAFIwcTtH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5509cc4d-85f4-4b0f-60d8-08dcfdad6170
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 15:20:28.8912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eexpjd1rENzA1xWnmjqd1D01avpLENvW4mNu9e/shjCJkTVzukER1475PnNxHcllO4e4h9T6oh74Ew4WJ6Q5eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4698
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



On 2024-11-05 7:49 a.m., Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/guc: Fix missing init value and add register order check
> *URL:*	https://patchwork.freedesktop.org/series/140889/ <https:// 
> patchwork.freedesktop.org/series/140889/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/ 
> index.html>
> 
> 
>   CI Bug Log - changes from
>   xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f_full -> xe-
>   pw-140889v1_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with xe-pw-140889v1_full absolutely need 
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-140889v1_full, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe- 
> pw-140889v1_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_gt_freq@freq_fixed_exec:
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-2/
>         igt@xe_gt_freq@freq_fixed_exec.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-1/
>         igt@xe_gt_freq@freq_fixed_exec.html> +1 other test dmesg-warn
> 
The failure is not related to this patch.

Regards,
Zhanjun Dong
> 
>     New tests
> 
> New tests have been introduced between 
> xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f_full and xe- 
> pw-140889v1_full:
> 
> 
>       New IGT tests (18)
> 
>   *
> 
>     igt@kms_color@ctm-0-75@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [1.70] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@ab-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.95] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@ac-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.91] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@ad-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.89] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@bc-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.88] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@bd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.89] s
>   *
> 
>     igt@kms_flip@2x-busy-flip@cd-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.88] s
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-vs-hang@ad-hdmi-a6-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.91] s
>   *
> 
>     igt@kms_flip@flip-vs-rmfb-interruptible@d-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [4.00] s
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check@d-dp5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [4.37] s
>   *
> 
>     igt@kms_invalid_mode@clock-too-high@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>   *
> 
>     igt@kms_lease@lease-revoke@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.06] s
>   *
> 
>     igt@kms_sequence@get-busy@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.46] s
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc@pipe-a-hdmi-a-6-pipe-b-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.25] s
>   *
> 
>     igt@kms_setmode@clone-exclusive-crtc@pipe-b-hdmi-a-6-pipe-a-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.25] s
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-a-hdmi-a-6-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.46] s
>   *
> 
>     igt@kms_setmode@invalid-clone-single-crtc-stealing@pipe-b-hdmi-a-6-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [0.46] s
>   *
> 
>     igt@kms_vblank@wait-forked-busy-hang@pipe-d-dp-5:
> 
>       o Statuses : 1 pass(s)
>       o Exec time: [2.43] s
> 
> 
>     Known issues
> 
> Here are the changes found in xe-pw-140889v1_full that come from known 
> issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@fbdev@nullptr.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-bmg-5/igt@fbdev@nullptr.html>
>         (Intel XE#2134 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2134>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@fbdev@nullptr.html> -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@fbdev@nullptr.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-1/igt@kms_addfb_basic@addfb25-
>         y-tiled-small-legacy.html> (Intel XE#1466 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-6/
>         igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-
>         a-1.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-8/igt@kms_async_flips@alternate-
>         sync-async-flip@pipe-b-hdmi-a-1.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-0.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-
>         hw-stride-64bpp-rotate-180-hflip.html> (Intel XE#1407 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1 other test
>         skip
>   *
> 
>     igt@kms_big_fb@linear-32bpp-rotate-90:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-434/
>         igt@kms_big_fb@linear-32bpp-rotate-90.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-
>         rotate-180.html> (Intel XE#2231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2231> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other
>         tests skip
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-
>         flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-
>         stride-32bpp-rotate-180-async-flip.html> (Intel XE#1242
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-
>         async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-
>         hw-stride-32bpp-rotate-180-hflip-async-flip.html> (Intel XE#1231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231> /
>         Intel XE#1242 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1242>) +1 other test fail
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>       o shard-adlp: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-
>         hw-stride-64bpp-rotate-0-hflip.html> (Intel XE#1874 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>   *
> 
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-1/
>         igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-
>         flip.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-
>         hw-stride-64bpp-rotate-180-async-flip.html> (Intel XE#3194
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194>)
>   *
> 
>     igt@kms_big_fb@y-tiled-64bpp-rotate-90:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-90.html> (Intel XE#1124 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2 other
>         tests skip
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-1/igt@kms_big_fb@y-
>         tiled-64bpp-rotate-90.html> (Intel XE#316 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-
>         addfb.html> (Intel XE#1467 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1467>)
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-
>         hw-stride-32bpp-rotate-180-async-flip.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>   *
> 
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/igt@kms_big_fb@yf-
>         tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
>         (Intel XE#1124 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1124>) +1 other test skip
>   *
> 
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/igt@kms_ccs@bad-aux-
>         stride-4-tiled-mtl-rc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2 other
>         tests skip
>   *
> 
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-466/igt@kms_ccs@bad-
>         rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-5.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +13 other tests skip
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-
>         cc.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test
>         skip
>   *
> 
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-ccs@pipe-a-dp-5:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-466/igt@kms_ccs@crc-
>         primary-rotation-180-y-tiled-ccs@pipe-a-dp-5.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +45
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@kms_ccs@missing-ccs-
>         buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html> (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>   *
> 
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-d-hdmi-a-1:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@kms_ccs@missing-ccs-
>         buffer-yf-tiled-ccs@pipe-d-hdmi-a-1.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/787>) +5 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/igt@kms_ccs@random-ccs-
>         data-4-tiled-mtl-mc-ccs.html> (Intel XE#2887 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4 other
>         tests skip
>   *
> 
>     igt@kms_chamelium_color@ctm-0-25:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/
>         igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>   *
> 
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/igt@kms_chamelium_edid@dp-
>         edid-change-during-hibernate.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2 other tests
>         skip
>   *
> 
>     igt@kms_chamelium_frames@dp-frame-dump:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/
>         igt@kms_chamelium_frames@dp-frame-dump.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>   *
> 
>     igt@kms_chamelium_hpd@dp-hpd-storm-disable:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/igt@kms_chamelium_hpd@dp-
>         hpd-storm-disable.html> (Intel XE#2252 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +1 other test
>         skip
>   *
> 
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-463/
>         igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html> (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>)
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-0:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-9/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-4/
>         igt@kms_content_protection@dp-mst-lic-type-0.html> (Intel
>         XE#2390 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>   *
> 
>     igt@kms_content_protection@legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-8/
>         igt@kms_content_protection@legacy.html> (Intel XE#3278 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3278>)
>   *
> 
>     igt@kms_content_protection@legacy@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-464/
>         igt@kms_content_protection@legacy@pipe-a-dp-4.html> (Intel
>         XE#1178 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>   *
> 
>     igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html> (Intel
>         XE#3304 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304>)
>   *
> 
>     igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-1/igt@kms_cursor_crc@cursor-
>         offscreen-512x512.html> (Intel XE#2321 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_cursor_crc@cursor-onscreen-512x170.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/igt@kms_cursor_crc@cursor-
>         rapid-movement-128x42.html> (Intel XE#2320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>   *
> 
>     igt@kms_cursor_crc@cursor-rapid-movement-64x64:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@kms_cursor_crc@cursor-rapid-movement-64x64.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>) +14 other tests skip
>   *
> 
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/igt@kms_cursor_legacy@2x-
>         flip-vs-cursor-atomic.html> (Intel XE#309 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2 other tests
>         skip
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/igt@kms_cursor_legacy@basic-
>         busy-flip-before-cursor-atomic.html> (Intel XE#323 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/
>         igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html> (Intel
>         XE#309 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/309>) +1 other test skip
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +2 other tests skip
>   *
> 
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-8/igt@kms_dsc@dsc-with-output-
>         formats-with-bpc.html> (Intel XE#2244 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>   *
> 
>     igt@kms_feature_discovery@display-3x:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/
>         igt@kms_feature_discovery@display-3x.html> (Intel XE#2373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373>)
>   *
> 
>     igt@kms_feature_discovery@psr1:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_feature_discovery@psr1.html> (Intel XE#1135 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-464/igt@kms_flip@2x-flip-
>         vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) +4 other tests fail
>   *
> 
>     igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-dp4.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ad-hdmi-a6-
>         dp4.html> (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/301>)
>   *
> 
>     igt@kms_flip@2x-flip-vs-panning-interruptible:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-
>         panning-interruptible.html> (Intel XE#1421 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>   *
> 
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@kms_flip@2x-
>         nonexisting-fb-interruptible.html> (Intel XE#310 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/310>)
>   *
> 
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-6/
>         igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>)
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
> 
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-dg2-464/
>         igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html> (Intel
>         XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#2049 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2049>)
>   *
> 
>     igt@kms_flip@plain-flip-ts-check@a-edp1:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-
>         check@a-edp1.html> (Intel XE#886 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1 other test fail
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>     downscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-
>         downscaling@pipe-a-default-mode.html> (Intel XE#1397 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling.html> (Intel XE#1401 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1401> / Intel
>         XE#1745 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1745>) +2 other tests skip
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-
>     upscaling@pipe-a-default-mode:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/
>         igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-
>         ytilegen12rcccs-upscaling@pipe-a-default-mode.html> (Intel
>         XE#1401 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1401>) +2 other tests skip
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling.html> -> FAIL <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-adlp-4/
>         igt@kms_flip_tiling@flip-change-tiling.html> (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +2
>         other tests fail
>   *
> 
>     igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-4-rc-ccs-to-4:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-3/
>         igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-4-rc-ccs-
>         to-4.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-lnl-7/igt@kms_flip_tiling@flip-change-
>         tiling@pipe-c-edp-1-4-rc-ccs-to-4.html> (Intel XE#1491 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1491>) +1 other test
>         fail
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-
>         mmap-wc.html> (Intel XE#2311 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2311>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-
>         render.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/651>) +5 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         render.html> -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-
>         render.html> (Intel XE#1033 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1033> / Intel XE#1727 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +2 other
>         tests timeout
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-plflip-
>         blt.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-
>         primscrn-shrfb-plflip-blt.html> (Intel XE#1861 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-
>         move.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-
>         onoff.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-463/
>         igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html> (Intel
>         XE#658 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/658>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-
>         onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-
>         move.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +1 other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
> 
>       o shard-bmg: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-4/
>         igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (Intel XE#2333
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333>) +3
>         other tests fail
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-9/
>         igt@kms_frontbuffer_tracking@pipe-fbc-rte.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-
>         move.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2313>) +2 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) +1 other test skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-
>         onoff.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2231> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-2/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-
>         blt.html> (Intel XE#656 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/656>) +8 other tests skip
>   *
> 
>     igt@kms_getfb@getfb-reject-ccs:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@kms_getfb@getfb-reject-
>         ccs.html> (Intel XE#605 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/605>)
>   *
> 
>     igt@kms_hdr@static-swap:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@kms_hdr@static-
>         swap.html> (Intel XE#1503 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1503>)
>   *
> 
>     igt@kms_joiner@basic-force-big-joiner:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_joiner@basic-force-big-joiner.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_joiner@basic-force-big-joiner.html> (Intel XE#2890
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +7
>         other tests skip
>   *
> 
>     igt@kms_joiner@invalid-modeset-big-joiner:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-1/igt@kms_joiner@invalid-
>         modeset-big-joiner.html> (Intel XE#346 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>   *
> 
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_joiner@invalid-modeset-ultra-joiner.html> (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>   *
> 
>     igt@kms_panel_fitting@atomic-fastset:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-466/
>         igt@kms_panel_fitting@atomic-fastset.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/igt@kms_plane_scaling@plane-
>         downscale-factor-0-25-with-rotation@pipe-a.html> (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +7
>         other tests skip
>   *
> 
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_plane_scaling@plane-downscale-factor-0-5-with-
>         modifiers.html> -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@kms_plane_scaling@plane-
>         downscale-factor-0-5-with-modifiers.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +13 other tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-3/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-a.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2 other
>         tests skip
>   *
> 
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-3/
>         igt@kms_plane_scaling@planes-downscale-factor-0-25-
>         upscale-20x20@pipe-d.html> (Intel XE#2763 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2763> / Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>   *
> 
>     igt@kms_pm_dc@dc5-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-4/
>         igt@kms_pm_dc@dc5-dpms.html> -> FAIL <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-8/
>         igt@kms_pm_dc@dc5-dpms.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>   *
> 
>     igt@kms_pm_dc@dc6-dpms:
> 
>       o shard-lnl: NOTRUN -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#1430 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1430>)
>   *
> 
>     igt@kms_pm_dc@deep-pkgc:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/igt@kms_pm_dc@deep-
>         pkgc.html> (Intel XE#2505 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2505>)
>   *
> 
>     igt@kms_pm_rpm@basic-pci-d3-state:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> -> SKIP <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_pm_rpm@basic-pci-d3-state.html> (Intel XE#2446 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2446>)
>   *
> 
>     igt@kms_pm_rpm@universal-planes-dpms:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-7/
>         igt@kms_pm_rpm@universal-planes-dpms.html> -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-8/igt@kms_pm_rpm@universal-planes-dpms.html> (Intel XE#2042
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>)
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-
>         plane-move-sf-dmg-area.html> (Intel XE#2893 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-433/igt@kms_psr2_sf@fbc-
>         psr2-overlay-plane-move-continuous-exceed-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-
>         overlay-plane-update-sf-dmg-area.html> (Intel XE#1489 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-
>         overlay-primary-update-sf-dmg-area.html> (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>   *
> 
>     igt@kms_psr2_su@page_flip-xrgb8888:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-7/igt@kms_psr2_su@page_flip-
>         xrgb8888.html> (Intel XE#2387 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2387>)
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-434/
>         igt@kms_psr2_su@page_flip-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>)
>   *
> 
>     igt@kms_psr@fbc-pr-no-drrs:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@kms_psr@fbc-pr-no-
>         drrs.html> (Intel XE#2850 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2850> / Intel XE#929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +1 other test skip
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/igt@kms_psr@fbc-pr-no-
>         drrs.html> (Intel XE#2234 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2234> / Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +1 other test
>         skip
>   *
> 
>     igt@kms_psr@fbc-pr-sprite-plane-move:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-433/igt@kms_psr@fbc-pr-
>         sprite-plane-move.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>   *
> 
>     igt@kms_psr@pr-primary-page-flip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-4/igt@kms_psr@pr-primary-page-
>         flip.html> (Intel XE#1406 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1406>) +2 other tests skip
>   *
> 
>     igt@kms_rotation_crc@bad-pixel-format:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/igt@kms_rotation_crc@bad-
>         pixel-format.html> (Intel XE#327 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
>   *
> 
>     igt@kms_rotation_crc@primary-rotation-90:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/
>         igt@kms_rotation_crc@primary-rotation-90.html> (Intel XE#1437
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437>)
>   *
> 
>     igt@kms_vblank@ts-continuation-idle-hang:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/igt@kms_vblank@ts-
>         continuation-idle-hang.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>) +2 other
>         tests skip
>   *
> 
>     igt@kms_writeback@writeback-check-output:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-3/
>         igt@kms_writeback@writeback-check-output.html> (Intel XE#756
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-8/igt@kms_writeback@writeback-
>         check-output.html> (Intel XE#756 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/756>)
>   *
> 
>     igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-
>         vram01.html> -> ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-432/igt@xe_ccs@suspend-
>         resume@tile64-compressed-compfmt0-vram01-vram01.html> (Intel
>         XE#2625 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2625>) +1 other test abort
>   *
> 
>     igt@xe_compute@ccs-mode-basic:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-8/igt@xe_compute@ccs-mode-
>         basic.html> (Intel XE#1447 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1447>)
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-discovery:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-434/igt@xe_eudebug@basic-
>         vm-bind-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test
>         skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/igt@xe_eudebug@basic-vm-
>         bind-vm-destroy-discovery.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1 other test
>         skip
>   *
> 
>     igt@xe_evict@evict-beng-large-cm:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-5/igt@xe_evict@evict-beng-
>         large-cm.html> (Intel XE#688 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/688>) +2 other tests skip
>   *
> 
>     igt@xe_evict@evict-beng-small-multi-vm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-9/igt@xe_evict@evict-beng-
>         small-multi-vm.html> (Intel XE#261 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/261> / Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>   *
> 
>     igt@xe_evict@evict-beng-threads-large:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@xe_evict@evict-beng-threads-large.html> -> TIMEOUT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@xe_evict@evict-beng-threads-large.html> (Intel XE#1473
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>)
>   *
> 
>     igt@xe_evict@evict-large-external-cm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@xe_evict@evict-large-external-cm.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@xe_evict@evict-large-external-cm.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +39
>         other tests skip
>   *
> 
>     igt@xe_evict@evict-mixed-many-threads-small:
> 
>       o shard-bmg: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/igt@xe_evict@evict-mixed-
>         many-threads-small.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>         XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>   *
> 
>     igt@xe_evict@evict-threads-large:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@xe_evict@evict-threads-large.html> -> TIMEOUT <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@xe_evict@evict-threads-large.html> (Intel XE#1473 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1473> / Intel
>         XE#2472 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-8/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-basic-defer-mmap.html> (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-6/igt@xe_exec_basic@multigpu-
>         many-execqueues-many-vm-null.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>   *
> 
>     igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-3/igt@xe_exec_basic@multigpu-
>         no-exec-userptr-invalidate-race.html> (Intel XE#1392 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_compute_mode@lr-mode-workload:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-1/
>         igt@xe_exec_compute_mode@lr-mode-workload.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         adlp-8/igt@xe_exec_compute_mode@lr-mode-workload.html> (Intel
>         XE#2125 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125>)
>   *
> 
>     igt@xe_exec_compute_mode@once-bindexecqueue-userptr:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@xe_exec_compute_mode@once-bindexecqueue-userptr.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +2 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race.html> -> FAIL <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/igt@xe_exec_fault_mode@many-
>         execqueues-bindexecqueue-userptr-invalidate-race.html> (Intel
>         XE#3160 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-imm:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         imm.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-
>         userptr-invalidate-race-imm.html> (Intel XE#3320 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3320>)
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-prefetch:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-4/
>         igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-race-
>         prefetch.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-lnl-5/igt@xe_exec_fault_mode@many-
>         execqueues-userptr-invalidate-race-prefetch.html> (Intel XE#3160
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160>) +1
>         other test fail
>   *
> 
>     igt@xe_exec_fault_mode@many-rebind-prefetch:
> 
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/igt@xe_exec_fault_mode@many-
>         rebind-prefetch.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_exec_fault_mode@once-userptr-rebind-imm:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-3/
>         igt@xe_exec_fault_mode@once-userptr-rebind-imm.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +2 other tests skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-userptr-prefetch:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-434/
>         igt@xe_exec_fault_mode@twice-userptr-prefetch.html> (Intel
>         XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) +4 other tests skip
>   *
> 
>     igt@xe_exec_queue_property@invalid-property:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@xe_exec_queue_property@invalid-property.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         dg2-435/igt@xe_exec_queue_property@invalid-property.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +30 other tests skip
>   *
> 
>     igt@xe_exec_reset@parallel-close-execqueues-close-fd:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@xe_exec_reset@parallel-close-execqueues-close-fd.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-
>         pw-140889v1/shard-adlp-6/igt@xe_exec_reset@parallel-close-
>         execqueues-close-fd.html> (Intel XE#358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/358>)
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-waitsip:
> 
>       o shard-lnl: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-lnl-1/
>         igt@xe_exec_sip_eudebug@breakpoint-waitsip.html> (Intel XE#2905
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +3
>         other tests skip
>   *
> 
>     igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-8/
>         igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) +2 other tests skip
>   *
> 
>     igt@xe_gt_freq@freq_reset_multiple:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-7/
>         igt@xe_gt_freq@freq_reset_multiple.html> -> DMESG-WARN <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-8/
>         igt@xe_gt_freq@freq_reset_multiple.html> (Intel XE#3184
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184>)
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
> 
>       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-5/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html> (Intel
>         XE#2998 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2998>) +1 other test incomplete
>   *
> 
>     igt@xe_oa@oa-tlb-invalidate:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-2/igt@xe_oa@oa-tlb-
>         invalidate.html> (Intel XE#2541 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2541>)
>       o shard-bmg: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/igt@xe_oa@oa-tlb-
>         invalidate.html> (Intel XE#2248 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2248>)
>   *
> 
>     igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/igt@xe_oa@oa-unit-
>         concurrent-oa-buffer-read.html> (Intel XE#2541 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
>   *
> 
>     igt@xe_pm@d3cold-basic-exec:
> 
>       o shard-adlp: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-3/igt@xe_pm@d3cold-basic-
>         exec.html> (Intel XE#2284 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2284> / Intel XE#366 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@d3cold-mmap-system:
> 
>       o shard-dg2-set2: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-464/igt@xe_pm@d3cold-
>         mmap-system.html> (Intel XE#2284 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2284> / Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>   *
> 
>     igt@xe_pm@s3-mocs:
> 
>       o shard-dg2-set2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@xe_pm@s3-mocs.html> -> ABORT <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-432/igt@xe_pm@s3-
>         mocs.html> (Intel XE#1794 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-unbind-all:
> 
>       o shard-adlp: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-3/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> -> ABORT <https://intel-
>         gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-adlp-9/
>         igt@xe_pm@s4-vm-bind-unbind-all.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_pm@s4-vm-bind-userptr:
> 
>       o shard-lnl: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-4/
>         igt@xe_pm@s4-vm-bind-userptr.html> -> ABORT <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-2/igt@xe_pm@s4-
>         vm-bind-userptr.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
>   *
> 
>     igt@xe_spin_batch@spin-fixed-duration:
> 
>       o shard-adlp: NOTRUN -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-4/igt@xe_spin_batch@spin-
>         fixed-duration.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1727>) +1 other test timeout
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@core_hotunplug@hotreplug-lateclose:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@core_hotunplug@hotreplug-lateclose.html> -> PASS <https://
>         intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-4/
>         igt@core_hotunplug@hotreplug-lateclose.html>
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       o shard-adlp: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         adlp-2/igt@kms_async_flips@async-flip-with-page-flip-
>         events.html> (Intel XE#3194 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3194>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-adlp-9/
>         igt@kms_async_flips@async-flip-with-page-flip-events.html> +2
>         other tests pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-4:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         edp-1-4.html> -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-lnl-4/igt@kms_async_flips@async-flip-
>         with-page-flip-events@pipe-b-edp-1-4.html> +1 other test pass
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-x:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         edp-1-x.html> (Intel XE#3229 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3229>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         edp-1-x.html>
>   *
> 
>     igt@kms_atomic_transition@plane-toggle-modeset-transition:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-3/
>         igt@kms_atomic_transition@plane-toggle-modeset-transition.html>
>         (Intel XE#1426 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1426>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-8/igt@kms_atomic_transition@plane-
>         toggle-modeset-transition.html> +1 other test pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip.html> (Intel XE#1874 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1874>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-adlp-6/igt@kms_big_fb@y-
>         tiled-max-hw-stride-64bpp-rotate-180-hflip.html> +2 other tests pass
>   *
> 
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-4/
>         igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-
>         async-flip.html> (Intel XE#1231 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1231> / Intel XE#1242 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1242>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-
>         hflip-async-flip.html> +2 other tests pass
>   *
> 
>     igt@kms_color@ctm-signed:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-3/
>         igt@kms_color@ctm-signed.html> (Intel XE#2929 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2929>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-5/igt@kms_color@ctm-signed.html> +2 other tests pass
>   *
> 
>     igt@kms_color@deep-color@pipe-c-edp-1-ctm:
> 
>       o shard-lnl: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-3/
>         igt@kms_color@deep-color@pipe-c-edp-1-ctm.html> -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-7/igt@kms_color@deep-color@pipe-c-edp-1-ctm.html>
>   *
> 
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
> 
>       o shard-bmg: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html> -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-6/
>         igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-
>         varying-size.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-
>         size.html> (Intel XE#1475 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1475>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-432/
>         igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-
>         size.html>
>   *
> 
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-9/
>         igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html> (Intel
>         XE#1475 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1475>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-
>         cursor-varying-size.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-render:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_draw_crc@draw-method-render.html> (Intel XE#2231
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-4/igt@kms_draw_crc@draw-method-
>         render.html>
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_draw_crc@draw-method-render.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@kms_draw_crc@draw-method-
>         render.html>
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html>
>         (Intel XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-
>         interruptible@b-dp2.html> +13 other tests pass
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6:
> 
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a6.html> (Intel
>         XE#301 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/301>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-
>         vblank@a-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@flip-vs-panning@b-hdmi-a3:
> 
>       o shard-bmg: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@kms_flip@flip-vs-panning@b-hdmi-a3.html> (Intel XE#2635
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635>) ->
>         PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-7/igt@kms_flip@flip-vs-panning@b-hdmi-a3.html> +1
>         other test pass
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a6:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-
>         a6.html> (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1195>) -> PASS <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-dg2-464/igt@kms_flip@flip-vs-
>         suspend-interruptible@c-hdmi-a6.html>
>   *
> 
>     igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-4/
>         igt@kms_flip@wf_vblank-ts-check-interruptible@c-edp1.html>
>         (Intel XE#886 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/886>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-lnl-5/igt@kms_flip@wf_vblank-ts-check-
>         interruptible@c-edp1.html> +7 other tests pass
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-
>         downscaling.html> (Intel XE#3194 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-
>         downscaling.html> +1 other test pass
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-2/
>         igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html>
>         (Intel XE#1861 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1861>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-
>         shrfb-scaledprimary.html> +1 other test pass
>   *
> 
>     igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_plane_scaling@plane-scaler-unity-scaling-with-
>         modifiers.html> (Intel XE#3007 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3007>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-bmg-6/
>         igt@kms_plane_scaling@plane-scaler-unity-scaling-with-
>         modifiers.html> +2 other tests pass
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_plane_scaling@plane-scaler-unity-scaling-with-
>         modifiers.html> (Intel XE#2423 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2423> / i915#2575 <https://
>         gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-
>         modifiers.html> +1 other test pass
>   *
> 
>     igt@kms_pm_dc@dc5-psr:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-5/
>         igt@kms_pm_dc@dc5-psr.html> (Intel XE#718 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/718>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-8/igt@kms_pm_dc@dc5-psr.html>
>   *
> 
>     igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-7/
>         igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html> (Intel
>         XE#899 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/899>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-
>         leak@pipe-b-edp-1.html>
>   *
> 
>     igt@kms_vblank@accuracy-idle:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-1/
>         igt@kms_vblank@accuracy-idle.html> (Intel XE#1523 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1523>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-1/igt@kms_vblank@accuracy-idle.html> +1 other test pass
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-large:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html>
>         (Intel XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-
>         many-threads-large.html>
>   *
> 
>     igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-
>         reopen.html> (Intel XE#3198 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3198>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-bmg-4/igt@xe_evict_ccs@evict-
>         overcommit-parallel-instantfree-reopen.html>
>       o shard-dg2-set2: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-
>         reopen.html> (Intel XE#3198 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3198>) -> PASS <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html>
>   *
> 
>     igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate-race:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@xe_exec_balancer@many-execqueues-parallel-userptr-
>         invalidate-race.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-5/igt@xe_exec_balancer@many-execqueues-parallel-userptr-
>         invalidate-race.html> +1 other test pass
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@xe_exec_balancer@many-execqueues-parallel-userptr-
>         invalidate-race.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         dg2-463/igt@xe_exec_balancer@many-execqueues-parallel-userptr-
>         invalidate-race.html> +1 other test pass
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-race-imm:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-1/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race-imm.html> (Intel XE#3160 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/3160>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-invalidate-
>         race-imm.html> +2 other tests pass
>   *
> 
>     igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>     invalidate-race-prefetch:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-
>         invalidate-race-prefetch.html> (Intel XE#3160 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3160>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-
>         userptr-invalidate-race-prefetch.html> +1 other test pass
>   *
> 
>     igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate:
> 
>       o shard-lnl: INCOMPLETE <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-5/
>         igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
>         invalidate.html> (Intel XE#1169 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1169>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-lnl-4/
>         igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-
>         invalidate.html>
>   *
> 
>     igt@xe_oa@mmio-triggered-reports:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-7/igt@xe_oa@mmio-triggered-reports.html> +1 other test pass
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-4/
>         igt@xe_oa@mmio-triggered-reports.html> (Intel XE#2249 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2249>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-1/igt@xe_oa@mmio-triggered-reports.html>
>   *
> 
>     igt@xe_pm@s4-basic-exec:
> 
>       o shard-adlp: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-9/
>         igt@xe_pm@s4-basic-exec.html> (Intel XE#1358 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1358> / Intel
>         XE#1607 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1607> / Intel XE#1794 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1794>) -> PASS <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-adlp-1/
>         igt@xe_pm@s4-basic-exec.html>
>   *
> 
>     igt@xe_pm@s4-mocs:
> 
>       o shard-lnl: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-2/
>         igt@xe_pm@s4-mocs.html> (Intel XE#1794 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-8/igt@xe_pm@s4-mocs.html>
>   *
> 
>     igt@xe_spin_batch@spin-fixed-duration-with-preempter:
> 
>       o shard-adlp: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-9/
>         igt@xe_spin_batch@spin-fixed-duration-with-preempter.html>
>         (Intel XE#1081 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1081>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-6/igt@xe_spin_batch@spin-fixed-
>         duration-with-preempter.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_async_flips@alternate-sync-async-flip:
> 
>       o shard-adlp: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727> / Intel XE#3194 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3194>) -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) +1 other test dmesg-fail
>   *
> 
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-edp-1-
>     linear:
> 
>       o shard-lnl: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-lnl-8/
>         igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-
>         edp-1-linear.html> (Intel XE#3229 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3229>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-
>         b-edp-1-linear.html> (Intel XE#911 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/911>)
>   *
> 
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (Intel
>         XE#2385 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2385>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@kms_atomic@plane-primary-
>         overlay-mutable-zpos.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>   *
> 
>     igt@kms_big_fb@4-tiled-64bpp-rotate-270:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_big_fb@4-tiled-64bpp-rotate-270.html> (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html>
>         (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_big_fb@y-tiled-16bpp-rotate-180:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-4/
>         igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_big_fb@y-tiled-16bpp-rotate-180.html> (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_bw@linear-tiling-1-displays-2560x1440p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-
>         displays-2560x1440p.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_bw@linear-tiling-1-displays-2560x1440p.html> (Intel
>         XE#367 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/367>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-
>         displays-2560x1440p.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/igt@kms_ccs@bad-
>         pixel-format-4-tiled-mtl-rc-ccs-cc.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html> (Intel
>         XE#455 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/455> / Intel XE#787 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/787>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/igt@kms_ccs@bad-
>         pixel-format-y-tiled-gen12-mc-ccs.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html> (Intel
>         XE#2887 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2887>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-
>         tiled-dg2-rc-ccs-cc.html> (Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +3 other tests skip
>   *
> 
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       o shard-dg2-set2: INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1195 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1195> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>) -> SKIP <https://intel-gfx-
>         ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2351> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_chamelium_color@ctm-0-25:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-435/
>         igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#306 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/306>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         dg2-435/igt@kms_chamelium_color@ctm-0-25.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>)
>   *
> 
>     igt@kms_chamelium_frames@hdmi-crc-single:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@kms_chamelium_frames@hdmi-crc-single.html> (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-single.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>) +2 other tests skip
>   *
> 
>     igt@kms_chamelium_hpd@vga-hpd:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#373 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/373>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         dg2-435/igt@kms_chamelium_hpd@vga-hpd.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +1 other test skip
>   *
> 
>     igt@kms_content_protection@lic-type-1:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-432/
>         igt@kms_content_protection@lic-type-1.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_content_protection@lic-type-1.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +3 other tests skip
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_content_protection@lic-type-1.html> (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_content_protection@lic-type-1.html> (Intel
>         XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>   *
> 
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@kms_cursor_crc@cursor-onscreen-512x512.html> (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         upscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-
>         upscaling.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2293 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2293> / Intel
>         XE#2380 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2380>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +1 other test skip
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#455 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/455>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-
>         downscaling.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/651>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
> 
>       o shard-bmg: FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2333 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2333>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-
>         blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2231> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +3 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html> (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html>
>         (Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-3/
>         igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html>
>         (Intel XE#651 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/651>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-adlp-4/
>         igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html>
>         (Intel XE#1033 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1033> / Intel XE#1727 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#2311 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2311>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html>
>         (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +6 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-433/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-
>         mmap-wc.html> (Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>) +4 other tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-7/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2313 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2313>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-bmg-5/
>         igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-
>         blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2231> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +6 other
>         tests skip
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-464/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#653 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/653>) -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-dg2-435/
>         igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-
>         blt.html> (Intel XE#2351 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2351> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-update-sf.html> (Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +1 other test
>         skip
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html> (Intel
>         XE#1489 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1489>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-
>         plane-update-sf.html> (Intel XE#2231 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2231> / Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel
>         XE#2231 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2231> / Intel XE#2890 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2890>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-433/
>         igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (Intel
>         XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890>)
>   *
> 
>     igt@kms_psr@fbc-psr-no-drrs:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-432/
>         igt@kms_psr@fbc-psr-no-drrs.html> (Intel XE#2850 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2850> / Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-dg2-435/igt@kms_psr@fbc-psr-no-drrs.html> (Intel XE#2351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351> /
>         Intel XE#2890 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2890>)
>   *
> 
>     igt@kms_psr@fbc-psr2-primary-blt:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_psr@fbc-psr2-primary-blt.html> (Intel XE#2234 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2234> / Intel
>         XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-
>         blt.html> (Intel XE#2231 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/2231> / Intel XE#2890 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2890>) +2 other
>         tests skip
>   *
> 
>     igt@kms_psr@psr2-cursor-plane-onoff:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_psr@psr2-cursor-plane-onoff.html> (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/929>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-dg2-435/igt@kms_psr@psr2-cursor-plane-
>         onoff.html> (Intel XE#2890 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/2890>) +1 other test skip
>   *
> 
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-8/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#2330 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2330>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-0.html> (Intel XE#3007 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3007>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-463/
>         igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html> (Intel
>         XE#1127 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1127>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-
>         tiled-reflect-x-0.html> (Intel XE#2423 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2423> / i915#2575
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_scaling_modes@scaling-mode-center:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_scaling_modes@scaling-mode-center.html> (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/
>         shard-bmg-5/igt@kms_scaling_modes@scaling-mode-center.html>
>         (Intel XE#3007 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3007>)
>   *
> 
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2509>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-4/igt@kms_tiled_display@basic-test-
>         pattern-with-chamelium.html> (Intel XE#2426 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1500>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-466/igt@kms_tiled_display@basic-
>         test-pattern-with-chamelium.html> (Intel XE#362 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>   *
> 
>     igt@xe_eudebug@basic-exec-queues:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-6/
>         igt@xe_eudebug@basic-exec-queues.html> (Intel XE#2905 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140889v1/shard-
>         bmg-5/igt@xe_eudebug@basic-exec-queues.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3
>         other tests skip
>   *
> 
>     igt@xe_eudebug@basic-vm-bind-extended-discovery:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-434/
>         igt@xe_eudebug@basic-vm-bind-extended-discovery.html> (Intel
>         XE#2905 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2905>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-
>         extended-discovery.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +3 other
>         tests skip
>   *
> 
>     igt@xe_evict@evict-beng-mixed-many-threads-small:
> 
>       o shard-bmg: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@xe_evict@evict-beng-mixed-many-threads-small.html> (Intel
>         XE#1473 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1473>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-
>         many-threads-small.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
> 
>       o shard-bmg: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-bmg-2/
>         igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html>
>         (Intel XE#2322 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2322>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-
>         execqueues-many-vm-null.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +1 other test
>         skip
>   *
> 
>     igt@xe_exec_basic@multigpu-once-userptr-rebind:
> 
>       o shard-adlp: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-adlp-6/
>         igt@xe_exec_basic@multigpu-once-userptr-rebind.html> (Intel
>         XE#1392 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1392>) -> TIMEOUT <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-adlp-4/igt@xe_exec_basic@multigpu-
>         once-userptr-rebind.html> (Intel XE#1033 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1033> / Intel
>         XE#1727 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
>   *
> 
>     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
>         (Intel XE#288 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/288>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-pw-140889v1/shard-dg2-435/igt@xe_exec_fault_mode@many-
>         bindexecqueue-userptr-imm.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +5 other
>         tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo:
> 
>       o shard-dg2-set2: TIMEOUT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         dg2-432/igt@xe_live_ktest@xe_bo.html> (Intel XE#2961 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2961> / Intel
>         XE#3191 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3191>) -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/
>         intel-xe/xe-pw-140889v1/shard-dg2-433/
>         igt@xe_live_ktest@xe_bo.html> (Intel XE#1195 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +1 other test
>         incomplete
>   *
> 
>     igt@xe_oa@whitelisted-registers-userspace-config:
> 
>       o shard-dg2-set2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-dg2-466/
>         igt@xe_oa@whitelisted-registers-userspace-config.html> (Intel
>         XE#2541 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2541>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@xe_oa@whitelisted-registers-
>         userspace-config.html> (Intel XE#1130 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +2 other
>         tests skip
>   *
> 
>     igt@xe_pm@s2idle-vm-bind-userptr:
> 
>       o shard-dg2-set2: ABORT <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f/shard-
>         dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html> (Intel XE#1694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694> /
>         Intel XE#1794 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1794>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/xe-pw-140889v1/shard-dg2-435/igt@xe_pm@s2idle-vm-bind-
>         userptr.html> (Intel XE#1130 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/1130>)
> 
> 
>     Build changes
> 
>   * IGT: IGT_8093 -> IGT_8094
>   * Linux: xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f -> xe-
>     pw-140889v1
> 
> IGT_8093: 8093
> IGT_8094: 19b8958a209f1ea14a3ae06b31d76179fed5733a @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2159-0a6cc4357ae4d824f909468ca1deed28ae5ac96f: 
> 0a6cc4357ae4d824f909468ca1deed28ae5ac96f
> xe-pw-140889v1: 140889v1
> 

