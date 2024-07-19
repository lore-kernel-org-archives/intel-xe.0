Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073D5C3DA59
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 17:32:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C446E10EC79;
	Fri, 19 Jul 2024 17:32:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jnna1H08";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1D910EC79
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 17:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721410333; x=1752946333;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ky+okaaAgOr/cBFBLqijtXs0MBqi+kWkqK2WtD2gG0A=;
 b=Jnna1H08T28fAfP4zATRzhhhpxCjpsXPccQbX4MhH9OjTH5ikqjoUYoo
 XcsVjhgSuCBfGp4GRqTsaL42hEHHi8NMLwJFU6QkVGxwoZgy8qh4aUAYK
 NSIflwOlzbusEeXiOK0EJ0lD9ToE/gCrRlt5BUXftTFiwVNsbRsfZW6ly
 3sfeknQUgupNHVuF1pUa6hwBHl1psni7lCPZuOTvNA9WTPlFy6XZ7pxH9
 YC+xhBPtevhMgASRBPwVoqTUvtNw4DEYs+wQTgl4MdKkQGqDSBo/MFBqQ
 8drPnTG4Cqp7aLWgtnvDm7MMhafX7g53Nd/hIeY7dbxW0OStuCr4kcW1G w==;
X-CSE-ConnectionGUID: Qc2tePFoRni1cugCYGpTLA==
X-CSE-MsgGUID: JE4TlC32TkqpPEellVV8Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="29651948"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="29651948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 10:32:12 -0700
X-CSE-ConnectionGUID: vg9NE0lnSa+nEXBjSUE7LA==
X-CSE-MsgGUID: 98LtDzWtQXSoOW+8HUjY7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="50922205"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jul 2024 10:32:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 19 Jul 2024 10:32:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 19 Jul 2024 10:32:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 19 Jul 2024 10:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQoSgPmilkplT29WLuhPUL/9PpOAFEczyE7RRJEGfv4+LMm1WHrqKRH4d9cX5axlfnzi/d3nfGxsVrrdW55Z+SEKtQtTKcwIXyGoURcMDesutW3/0Z14VhQFk0pmqtq5yRwN1EEhuRj1YXlh2ZfAwCiWOEq9mjHHXhw5TjS8XTp64cbdGwoQi4LOwKwcVa/spFXEyfTjFeoSFkt+A8jajdRl5uS/KzVWgNyqgj0mgfSGk8XslaUuMNl+B2iab1ouV6qSc3iOFN8NJFsujndB9SELEC2cHxwokGgd+CyUouzejqurzUK4PMIv48Wb2LnSeeGBlDaP8FEciimRLQZ2Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqZGA1H5016D/L84LEx6vtLxXYLImPDTzfM0iMf4SZk=;
 b=csH4FoAPEh86X9+tKwRyHeS1wH3Q4zErTF0X6WpBYV6SCnflBQgZMA2Kdaq7tAYmB1MO3gXd7aF3MXgY1QrNQGOPU9kc7fk5cO+wsasX4WNmYiFIaN+0CIT5ngxEW8+OTEVeKUr0A936nCeNTAGDvEC3tiDRUo+n8y4al+rnjzp/WtT/Tx4BQBAVDZwitWK8KB10nco2mA0U6qZbGuzB6Nh83BQjV81NAPX0POlbio15FgDIuxpNGyIPaC0BP18vicW6w5SPHZgpPWrKEJb2LvhMWPQ6sph9StZUWO9sMH3uU8MGwlZG1O7vqZxQpNFDGSsJVaWjyE/O37lmq9WEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7922.namprd11.prod.outlook.com (2603:10b6:930:7b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.32; Fri, 19 Jul
 2024 17:32:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 17:32:08 +0000
Date: Fri, 19 Jul 2024 10:32:05 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] RFC drm/xe/xe_gt_idle: Expose Coarse power gating sysfs
 entries
Message-ID: <20240719173205.GN2905419@mdroper-desk1.amr.corp.intel.com>
References: <20240715095455.4069296-1-riana.tauro@intel.com>
 <20240717192338.GV2906448@mdroper-desk1.amr.corp.intel.com>
 <7cfac150-ff3c-4b87-a258-ca4f722bc734@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7cfac150-ff3c-4b87-a258-ca4f722bc734@intel.com>
X-ClientProxiedBy: BYAPR04CA0016.namprd04.prod.outlook.com
 (2603:10b6:a03:40::29) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7922:EE_
X-MS-Office365-Filtering-Correlation-Id: 6675203a-6ffc-4de0-0acc-08dca818b6cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGRFOFNtS2IvVU1mN1owUFJXMW9xTTNNNklrNU1Nb05QbkpNSEx1eExvNS93?=
 =?utf-8?B?alJJeXVPcFdSYjZlTE54U1RBRm5XQ2lvWnA4cFlnZWRjdEFDS3Y5ckRuUmox?=
 =?utf-8?B?OThNNDlORnh0eHZZNUN4c3hvYi9wWVIyVjgwRHZ0emVxL1NFTk1zYVRiZHJQ?=
 =?utf-8?B?clJKNGZxZ3lic2M1ejBpbS9tQnV1c1pzc3BlRWU2Z1FkN3ZIbDZqRkZDUGdy?=
 =?utf-8?B?WXhJVHVjMW1FeE1XeDZsY21jWUgyTmVlaHpxelB0VUZoZUVRTHFBMkV4YS9I?=
 =?utf-8?B?azdEYUtUYys2cU1XejFTd3pBRytkS3FjdVdKQjJ4c3FBd2NTdkZOOW5pbjZn?=
 =?utf-8?B?aDltWUVuN2UycklYTGJkRVJwMlQxMnRRaHhQZkVLbjFrSkJzQjhoMG92ZTZ2?=
 =?utf-8?B?OWc4dGZxUWQ0TUJFY0dua2lnZ1BuU2RNbWVnK1UvdlJzUWxCZWtTcVFqNlYx?=
 =?utf-8?B?UUVKNlIvZ2dvbGFOVC9RQXNGYjVLMndrRmRKaFg5V1BjZXViaUd6WFJycW0v?=
 =?utf-8?B?ZHpTZW8yMHFoN2xWRzJWSFZaMnJjRXBpVGMveFZaZ0J4WlhGeGdKd1Vwazd3?=
 =?utf-8?B?Vk92R01aTlEvSWZIeFJSYmtFVzZGYUlVaWpZcWhpd2tia0k2dW9udDd0WWNJ?=
 =?utf-8?B?N2Rja3FybXJTTTkvb1VjT1RaVzRIY3JGdERIN3ZUZHY3d3FFVmg0VmdWRlMw?=
 =?utf-8?B?RU8zZjErbzBuQXdScVJMblc2SXJkM0ZGa1pvd3FheFkvTkNSMi9LNUhxeUlj?=
 =?utf-8?B?RnQrdVJBQ2tJWmN0WGMvY2ZScmRHTDBvSXFicWlYT0dGTVJGTWZzaG1DcDBY?=
 =?utf-8?B?WjNtS0crZXgxSWRLMUkxYjNPZ3ZsYnozU0loVXdkd2I5UEFUV0VlUVNSanc5?=
 =?utf-8?B?cFE1ampPVUltKytETjMzeXhPSVVEcFJDWVZIR1dqdFRKMUh4dFVIdy93SDJU?=
 =?utf-8?B?TnM1NDVWNlB6MWtEYjNBV3JlZEU1YUlIK1kyd3ZES2dDRS9xMGRpTHBhRlhN?=
 =?utf-8?B?RmpoajRpdzJscmFpY3A0UTY3eXRnRlRuNy9UWEFrUTloK1V2QlZDbkdGWWNn?=
 =?utf-8?B?b2MxRzk5b045djJwdURSckM4dHhmUW9MeGJnSmpaZDJ3dXBCSG9jc3dLMlVp?=
 =?utf-8?B?dTFZN2lPMG4yYXZNTlloK3MzYzNlczF1RVhYcmNWbUJMVTFSZFFXaVd3YWsz?=
 =?utf-8?B?RkZpZmp0bHFSWmhlYkRFWVNDSGVJZ05uc2w2MGE1c041bXhHZEVNaWwvK2s3?=
 =?utf-8?B?aGo0RXJvSENWVk5wMU16RG9LRUdXRTZ6dThNZ0RVQTYxcldidVRSYTFWK1dt?=
 =?utf-8?B?L0dUY2NVeTlraFlTeG9vZjFzbnVpRmhnYjh3UmtOTEVjdC9FY0x5WVhTV092?=
 =?utf-8?B?Y1UrQW1odTlJMGNxdDlVY0tUb3g2T0VjV2hwWmhmQkhHMDhBckFlcFhKaklX?=
 =?utf-8?B?a1NTMWVaQS9yUjN1c3h3Z1hHS0VjVjd6VzgvK1VSM1Qwa0pwaEYzNkprSkxN?=
 =?utf-8?B?TjBiTWFaMVozMUM0WnhNWVJjZ1NxSWRSS01DeWRsRktQdnFVVVJwMHpJZDBm?=
 =?utf-8?B?NWpxYWZyWUNEYk1YeHhDRnF2NEl5TThWNGJDSGlzdDN4OFFlZkZsWVAzNktz?=
 =?utf-8?B?VmhUMEtubGN1dk1HdTlPbWhmZ0NjSElUNXNPOFd4MFBUQzhWMkg1SDgzWmFR?=
 =?utf-8?B?VjN4bU0wTjhXRDAzVUJHZUhtcGZVL3gzbmtlaDRIUWFiU2FsM1JWaE1NRVRU?=
 =?utf-8?B?TGE0U2tKVHBKbi9wZ3FJbVR3SUdNWVlKREpDMU12QzczQ0pISDlsTGU4NXFG?=
 =?utf-8?B?WmdDZVJZZ3NqMTNJY3kxUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTVOdXhZeXhtc0FvUFBoSFFhM1JSWjh1WXVWQ2oxSGJac3hYRTQ3NXNTT0dE?=
 =?utf-8?B?eHdER05xYklkb3pLbjltVTQ0cFdMNmpRRWVOdURLYW1aRTByVXZhT3JYZFVW?=
 =?utf-8?B?YWhUbEo4VEVPbzY0N2w3SG1ta3lveXVneFFvWTFxelpLajgzZHQ5RHNFbm0v?=
 =?utf-8?B?Y0NsSnJhcTZrVEpmOFpQSlMyS1BWbmZYL3BsVkVleFFvQUxSMTZLTTEwaXFC?=
 =?utf-8?B?K1BGMGxxU05xb3lBL1ZLUDlCeENPUG90Y0RNNTAxTW5PRTA5b0NHQUpKd3NE?=
 =?utf-8?B?cHoxdE5GRk5BWktoNUIyRzhPR0pZUGc0UHI5L1NzUkZXdnJLZ01xV2hnb1J1?=
 =?utf-8?B?TjI0dXA1R3hXN2J6M0x4d0U0MWFZUzlydTN3alRIR0wzWEdQOUVCUFZsWkZH?=
 =?utf-8?B?VlYrSEI2UitwMjRPZnRtYk1GUmIyQ1JTTjFSajBIRnFBZHA4M21zOEVxTHpJ?=
 =?utf-8?B?Qis0MHNWUW5Xb3lNL01DTUw0dVhOTzVWQVZ0WlRwVHAyWk8xeGZlQ3JkU05O?=
 =?utf-8?B?MWpKREE3SXhQNDZ4TGVFMnJhbEUzRk4wTXJkRXU3aitmbi9CamliQWZHUVhP?=
 =?utf-8?B?dWMwMkVtZUp4MHVraHdqS3NVZEc1aXRuQVg2bHA5TEQvT2UzRGFYaVVZUHEr?=
 =?utf-8?B?ZGtOYStPcEFhRnh0bHRNcFRlMTBvcW1yWTBlalUrcWMrV2RVVEdpNWI0MUp1?=
 =?utf-8?B?eTBrQzdNRHZxQjAxbGl6TGFiZVc1Tm5nY2dyNXNUbjBwY3BsOVRVR05xZDZK?=
 =?utf-8?B?MjRUOUdQdFBQMXZEdHJaL3RvWDloUDVZdUlHTG9Vd3VraEdvcndUYU5CM3pi?=
 =?utf-8?B?ZE0wMldyZlV2RnhWTG5EYXo5akN1b2syWW9KOHBqTU5aNUpQZmxtbGcvWVcy?=
 =?utf-8?B?QmdDbmFFVDNFRnVscXJ6VDdJWE1XSHg2V0ttTmxrWVpIN1dtbDU3R2ZMeFMx?=
 =?utf-8?B?aFNLTmovR002WlpWVTZ6SlZ5RFV0aVhEaGVDNnBYQUFSamVWYUcrclFadTBi?=
 =?utf-8?B?eVRwRTR3Nm54b0R6R3hlT1dpR01maGdjL2RITWFYdEVqY3lPUGhvUFJ4VHlP?=
 =?utf-8?B?UXdHMjVMc3gvdUM2TXRPeUUxUXVzeVZoZk51TTdON0c3dVRpN2VOZm1ZYU1E?=
 =?utf-8?B?eVp2VTVDRisyU3BtU0pnQ0MxNjhJN0NCNjFnN0N6UG01U1VMRWFwZjI0Snh2?=
 =?utf-8?B?Q09MMTBocDcxK3VWQkQ1YXpwQ21XaDZvM2l5eHJRWGIzYTRaSHdQTmlYeGlr?=
 =?utf-8?B?K21hbnB3bno0OWNtZmd4SEVvQzg3VG5CTXJMK3pOWmxjemFCWjRJMFVNbUYy?=
 =?utf-8?B?YXc1Mkl3OTZSaUxxb0ZhdGZVQ2ZmdkdPNUwwZGFvdGJZRDVzT2I2aWZYYjVV?=
 =?utf-8?B?blZSdFloaFBydnBDY0ZtSmh1bk5FbVlZVE13Rk5ueGNLa1VLVFRyeGxGdU9p?=
 =?utf-8?B?YkhIRHhvcXc3RkFCSEpQMlIvUFNjN0ExZ1R2NlljMWRzUkhWd3VnSDJ4bkds?=
 =?utf-8?B?NXJZY0ljbUI0Z0c4dFk5NDFPMjhCTHY2bW9JQlVLdS9taTNEVE8rWUxhYWpY?=
 =?utf-8?B?elJnK1phR3lWYkJSZHl1N21BRm1taHFmOURuUDREazhiYnZsUWx3L0hxTU1M?=
 =?utf-8?B?TkxCeUdVMWltbnJBOTJjcnBGMmdaWVlLaVBIaHA3akdLNmN6a2VYcEdMSXFm?=
 =?utf-8?B?R1IwQmtrbk9sOElpL09mdktrRUhGVzRCNjdtRy9YYjFKYTJhRHR4ZWZwR0RO?=
 =?utf-8?B?ellPQVREWmlzVmhFMDN5Tk5KUHNYL1B5N3FwMUw3V01rYTZHZTZoSEw0NnBr?=
 =?utf-8?B?anMyc2dpWGYydmJLWGU1WEFGZjJWTEd6Lyt1azlMejBkdCtONkxjbUpQWU4r?=
 =?utf-8?B?TXYxc256OStCbGRvb3c5ZjEvVkRZODdXbm9lM2RtSjUrVENFNU5oVkM3d1dn?=
 =?utf-8?B?K3hLNkgwL1RGQjdvdHBLV0I4cHExd0lGeVAzSjgwQkhmWm1PeTBwdkdlTTBU?=
 =?utf-8?B?LzdwUmhOSGh2NUVoYmVsenB4Z0NnbFZCRGtvcFBTNEpyM2VNODBwTUJkVzVW?=
 =?utf-8?B?UjJrb1Z5OHhyMW8vNWVBU3FpNkFGYTlHOWRLM0hwbVJHd3Z1RStTOXd1UkV1?=
 =?utf-8?B?dGVaWkZhUmpmRllTZ2RUSWRqb2pzSE9ETjFHaFI1MUtmcDlNd2U0ejZNZDdu?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6675203a-6ffc-4de0-0acc-08dca818b6cf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:32:08.1144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifNnCCw1GDRucwhCUcc9ek1F67DMiDd7eXuuu4ohPILULtDCO6xpejLEyPeJx9RfandxryYNncWEcRH/gyRxFVY3qA0hZq6+kywHbm2aaZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7922
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

On Fri, Jul 19, 2024 at 11:16:05AM +0530, Riana Tauro wrote:
> Hi Matt
> 
> Thank you for the review comments.
> 
> On 7/18/2024 12:53 AM, Matt Roper wrote:
> > On Mon, Jul 15, 2024 at 03:24:55PM +0530, Riana Tauro wrote:
> > > Add coarse power gating sysfs interface under gtidle directory to
> > > display the powergate properties.
> > 
> > You might also want to explain what "powergate" really means here.
> > I.e., how does this powergating differ from what happens with RC6/MC6?
> > When can powergating kick in?
> Will add these details in the commit message.
> > 
> > > powergate sysfs directory will be enumerated for render and media
> > > if present.
> > > 
> > > The new entries will have the below layout
> > > 
> > > 	tile<n>/gt<n>/gtidle/
> > > 			├── powergate0
> > > 			│   ├── enabled
> > > 			│   ├── status
> > > 			│   └── type
> > > 			└── powergate<n>
> > > 			    ├── enabled
> > > 			    ├── status
> > > 		    	    └── type
> > > 
> > > type:    type of powergate [Render or Media]
> > 
> > What userspace software is expected to be reading this interface and
> > what will it be doing with the data?
> 
> IGT test is planned for this. Also this is required for debug purposes.

IGT doesn't count as a valid userspace for new uapi.  If this winds up
being just for debugging with no real-world usage, then we'll need to
put this in debugfs instead of sysfs.

> 
> > I'm surprised that they want just
> > a single "media" powergate rather than providing the actual powergates
> > that the hardware supports (e.g., one entry per individual media slice,
> > which would allow userspace to either consolidate them or split them out
> > as they see fit).
> 
> i915 actually displays this info in debugfs and does it only for a single
> media slice (ie slice0).
> 
> Since there would be multiple directories, combined it as one in this RFC.
> Will split it per media slice
> 
> 
> > If we just expose whatever the underlying hardware
> > has (which may vary by platform), then userspace is free to consolidate
> > some of the values itself if it doesn't need the lower level of detail.
> > 
> > > enabled: true if powergate is enabled for the type
> > > status:  Indicates status of powergate [Up/Down]
> > > 	 For type media, status is "Up" if any of the media
> > > 	 slices are powered on.
> > > 
> > > Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/regs/xe_gt_regs.h  |   7 +
> > >   drivers/gpu/drm/xe/xe_gt_idle.c       | 214 +++++++++++++++++++++++++-
> > >   drivers/gpu/drm/xe/xe_gt_idle_types.h |  17 ++
> > >   3 files changed, 237 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > index 8a94a94d2267..8586c830bea6 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > > @@ -335,6 +335,13 @@
> > >   #define   CTC_SHIFT_PARAMETER_MASK		REG_GENMASK(2, 1)
> > >   #define   CTC_SOURCE_DIVIDE_LOGIC		REG_BIT(0)
> > > +#define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> > > +#define   MEDIA_SLICE0_AWAKE_STATUS		REG_BIT(0)
> > > +#define   RENDER_AWAKE_STATUS			REG_BIT(1)
> > > +#define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> > > +#define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
> > > +#define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
> > 
> > Nitpick:  bits are usually defined in descending order instead of
> > ascending.
> > 
> will fix this
> > > +
> > >   #define FORCEWAKE_RENDER			XE_REG(0xa278)
> > >   #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
> > >   #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > index 67aba4140510..fca13e645d24 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> > > @@ -25,13 +25,26 @@
> > >    * device/gt#/gtidle/name - name of the state
> > >    * device/gt#/gtidle/idle_residency_ms - Provides residency of the idle state in ms
> > >    * device/gt#/gtidle/idle_status - Provides current idle state
> > > + * device/gt#/gtidle/powergate<n>/
> > > + *                              ├── enabled - indicates whether powergate is enabled
> > > + *                              ├── status - status of powergate [Up / Down]
> > > + *                              └── type - type of powergate
> > >    */
> > > +static struct xe_gt_idle *kobj_to_gtidle(struct kobject *kobj)
> > > +{
> > > +	return &kobj_to_gt(kobj->parent)->gtidle;
> > > +}
> > >   static struct xe_gt_idle *dev_to_gtidle(struct device *dev)
> > >   {
> > >   	struct kobject *kobj = &dev->kobj;
> > > -	return &kobj_to_gt(kobj->parent)->gtidle;
> > > +	return kobj_to_gtidle(kobj);
> > > +}
> > > +
> > > +static struct xe_gt_powergate *kobj_to_powergate(struct kobject *kobj)
> > > +{
> > > +	return container_of(kobj, struct xe_gt_powergate, kobj);
> > >   }
> > >   static struct xe_gt *gtidle_to_gt(struct xe_gt_idle *gtidle)
> > > @@ -129,6 +142,7 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt)
> > >   	}
> > >   	xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
> > > +
> > >   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > 
> > Unexpected whitespace change?
> yeah missed this. will fix this
> > 
> > >   }
> > > @@ -145,6 +159,70 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
> > >   	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > >   }
> > > +static void gt_idle_powergate_enabled(struct xe_gt_idle *gtidle,
> > > +				      struct xe_gt_powergate *pg)
> > > +{
> > > +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> > > +	u32 enabled;
> > > +
> > > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> > > +	enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +
> > > +	if (pg->is_media)
> > > +		enabled &= MEDIA_POWERGATE_ENABLE;
> > > +	else
> > > +		enabled &= RENDER_POWERGATE_ENABLE;
> > > +
> > > +	pg->enabled = !!enabled;
> > > +}
> > > +
> > > +static void gt_idle_powergate_status(struct xe_gt_idle *gtidle,
> > > +				     struct xe_gt_powergate *pg)
> > > +{
> > > +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> > > +	u32 status, reg;
> > > +
> > > +	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
> > > +	reg = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
> > > +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> > > +
> > > +	if (pg->is_media) {
> > > +		/*
> > > +		 * Media Slices
> > > +		 *
> > > +		 * Slice 0: VCS0, VCS1, VECS0
> > > +		 * Slice 1: VCS2, VCS3, VECS1
> > > +		 * Slice 2: VCS4, VCS5, VECS2
> > > +		 * Slice 3: VCS6, VCS7, VECS3
> > > +		 */
> > > +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0)
> > > +					    | BIT(XE_HW_ENGINE_VCS1)
> > > +					    | BIT(XE_HW_ENGINE_VECS0)))
> > 
> > If this is false...
> 
> Won't media slice 0 be always present if media is available?

Not necessarily.  Platforms that can support multiple media slices can
have various subsets of those slices fused off on the lower SKUs.
Sometimes that means slice0 isn't present, but slice1 is.

For example, https://gfxspecs.intel.com/Predator/Home/Index/48077 has
some diagrams that show configurations with a fused-off slice0 on
various platforms.


Matt

> 
> > 
> > > +			status = (reg & MEDIA_SLICE0_AWAKE_STATUS);
> > > +
> > > +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS2)
> > > +					    | BIT(XE_HW_ENGINE_VCS3)
> > > +					    | BIT(XE_HW_ENGINE_VECS1)))
> > 
> > ...and this is true...
> > 
> > > +			status |= (reg & MEDIA_SLICE1_AWAKE_STATUS);
> > 
> > Then status still has an undefined value here.  Ditto for the other two
> > conditions below.
> > 
> > > +
> > > +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS4)
> > > +					    | BIT(XE_HW_ENGINE_VCS5)
> > > +					    | BIT(XE_HW_ENGINE_VECS2)))
> > > +			status |= (reg & MEDIA_SLICE2_AWAKE_STATUS);
> > > +
> > > +		if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS6)
> > > +					    | BIT(XE_HW_ENGINE_VCS7)
> > > +					    | BIT(XE_HW_ENGINE_VECS3)))
> > > +			status |= (reg & MEDIA_SLICE3_AWAKE_STATUS);
> > > +
> > > +	} else {
> > > +		status = reg & RENDER_AWAKE_STATUS;
> > > +	}
> > > +
> > > +	pg->status = !!status;
> > > +}
> > > +
> > >   static ssize_t name_show(struct device *dev,
> > >   			 struct device_attribute *attr, char *buff)
> > >   {
> > > @@ -197,10 +275,130 @@ static const struct attribute *gt_idle_attrs[] = {
> > >   	NULL,
> > >   };
> > > +static ssize_t status_show(struct device *dev,
> > > +			   struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct kobject *kobj = &dev->kobj;
> > > +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
> > > +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
> > > +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> > > +
> > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > +	gt_idle_powergate_status(gtidle, pg);
> > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > +
> > > +	return sysfs_emit(buff, "%s\n", pg->status ? "Up" : "Down");
> > > +}
> > > +static DEVICE_ATTR_RO(status);
> > > +
> > > +static ssize_t enabled_show(struct device *dev,
> > > +			    struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct kobject *kobj = &dev->kobj;
> > > +	struct xe_gt_powergate *pg = kobj_to_powergate(kobj);
> > > +	struct xe_gt_idle *gtidle = kobj_to_gtidle(kobj->parent);
> > > +	struct xe_gt *gt = gtidle_to_gt(gtidle);
> > > +
> > > +	xe_pm_runtime_get(gt_to_xe(gt));
> > > +	gt_idle_powergate_enabled(gtidle, pg);
> > > +	xe_pm_runtime_put(gt_to_xe(gt));
> > > +
> > > +	return sysfs_emit(buff, "%u\n", pg->enabled);
> > > +}
> > > +static DEVICE_ATTR_RO(enabled);
> > > +
> > > +static ssize_t type_show(struct device *dev,
> > > +			 struct device_attribute *attr, char *buff)
> > > +{
> > > +	struct xe_gt_powergate *pg = kobj_to_powergate(&dev->kobj);
> > > +
> > > +	return sysfs_emit(buff, "%s\n", pg->is_media ? "Media" : "Render");
> > > +}
> > > +
> > > +static DEVICE_ATTR_RO(type);
> > > +
> > > +static const struct attribute *powergate_attrs[] = {
> > > +	&dev_attr_type.attr,
> > > +	&dev_attr_enabled.attr,
> > > +	&dev_attr_status.attr,
> > > +	NULL,
> > > +};
> > > +
> > > +static void powergate_sysfs_release(struct kobject *kobj) {};
> > > +
> > > +static const struct kobj_type powergate_sysfs_kobj_type = {
> > > +	.release = powergate_sysfs_release,
> > > +	.sysfs_ops = &kobj_sysfs_ops,
> > > +};
> > > +
> > > +static int register_powergate_sysfs(struct kobject *gtidle_kobj, int idx,
> > > +				    bool is_media)
> > > +{
> > > +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
> > > +	struct xe_device *xe = gt_to_xe(gt);
> > > +	struct xe_gt_idle *gtidle = &gt->gtidle;
> > > +	struct xe_gt_powergate *pg = &gtidle->powergate[idx];
> > > +	int ret;
> > > +
> > > +	kobject_init(&pg->kobj, &powergate_sysfs_kobj_type);
> > > +
> > > +	ret = kobject_add(&pg->kobj, gtidle_kobj, "powergate%d", idx);
> > > +
> > > +	if (ret) {
> > > +		kobject_put(&pg->kobj);
> > > +		drm_warn(&xe->drm, "Failed to create powergate%d sysfs directory\n", idx);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = sysfs_create_files(&pg->kobj, powergate_attrs);
> > > +	if (ret) {
> > > +		drm_warn(&xe->drm, "Failed to create powergate%d attrs\n", idx);
> > > +		kobject_put(&pg->kobj);
> > > +		return ret;
> > > +	}
> > > +
> > > +	pg->is_media = is_media;
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int gt_idle_create_pg_attrs(struct kobject *gtidle_kobj)
> > > +{
> > > +	struct xe_gt *gt = kobj_to_gt(gtidle_kobj->parent);
> > > +	struct xe_device *xe  = gt_to_xe(gt);
> > > +	int ret, idx = 0;
> > > +
> > > +	/* CPG is disabled for PVC */
> > > +	if (xe->info.platform == XE_PVC)
> > > +		return 0;
> > > +
> > > +	if (!xe_gt_is_media_type(gt)) {
> > > +		ret = register_powergate_sysfs(gtidle_kobj, idx, false);
> > > +		if (!ret)
> > > +			idx++;
> > > +	}
> > > +
> > > +	/*
> > > +	 * Do not create media pg status if the entire first media slice
> > > +	 * is absent (i.e., no VCS0 or VECS0).
> > 
> > Is this an attempt to work around the bug above?  Otherwise I don't see
> > why we'd want to tie this to media slice 0 specifically and not report
> > powergating when only the other slice(s) are available.Won't media slice
> > 0 be always present if media is available? I saw some
> code in xe checking the presence of slice0 to check if media is available
> 
> Thanks,
> Riana
> > 
> > 
> > Matt
> > 
> > > +	 */
> > > +	if (gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VECS0))) {
> > > +		ret = register_powergate_sysfs(gtidle_kobj, idx, true);
> > > +		if (!ret)
> > > +			idx++;
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > >   static void gt_idle_fini(void *arg)
> > >   {
> > >   	struct kobject *kobj = arg;
> > >   	struct xe_gt *gt = kobj_to_gt(kobj->parent);
> > > +	struct xe_gt_idle *gtidle = &gt->gtidle;
> > > +	struct xe_device *xe  = gt_to_xe(gt);
> > > +	struct xe_gt_powergate *pg;
> > > +	int n;
> > >   	xe_gt_idle_disable_pg(gt);
> > > @@ -210,6 +408,18 @@ static void gt_idle_fini(void *arg)
> > >   		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > >   	}
> > > +	for (n = 0 ; n < 2; n++) {
> > > +		if (xe->info.platform == XE_PVC)
> > > +			break;
> > > +
> > > +		pg = &gtidle->powergate[n];
> > > +
> > > +		if (pg->kobj.state_initialized) {
> > > +			sysfs_remove_files(&pg->kobj, powergate_attrs);
> > > +			kobject_put(&pg->kobj);
> > > +		}
> > > +	}
> > > +
> > >   	sysfs_remove_files(kobj, gt_idle_attrs);
> > >   	kobject_put(kobj);
> > >   }
> > > @@ -248,6 +458,8 @@ int xe_gt_idle_init(struct xe_gt_idle *gtidle)
> > >   	xe_gt_idle_enable_pg(gt);
> > > +	gt_idle_create_pg_attrs(kobj);
> > > +
> > >   	return devm_add_action_or_reset(xe->drm.dev, gt_idle_fini, kobj);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_gt_idle_types.h b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> > > index f99b447534f3..603f7f6b509d 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt_idle_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt_idle_types.h
> > > @@ -7,6 +7,7 @@
> > >   #define _XE_GT_IDLE_SYSFS_TYPES_H_
> > >   #include <linux/types.h>
> > > +#include <linux/kobject.h>
> > >   struct xe_guc_pc;
> > > @@ -17,6 +18,20 @@ enum xe_gt_idle_state {
> > >   	GT_IDLE_UNKNOWN,
> > >   };
> > > +/**
> > > + * struct xe_gt_powergate - Powergate properties
> > > + */
> > > +struct xe_gt_powergate {
> > > +	/** @enabled: powergate enable */
> > > +	bool enabled;
> > > +	/** @status: status of powerwell*/
> > > +	bool status;
> > > +	/** @is_media: indicates media powergate */
> > > +	bool is_media;
> > > +	/** @kobj: kobject for powergate sysfs */
> > > +	struct kobject kobj;
> > > +};
> > > +
> > >   /**
> > >    * struct xe_gt_idle - A struct that contains idle properties based of gt
> > >    */
> > > @@ -29,6 +44,8 @@ struct xe_gt_idle {
> > >   	u64 cur_residency;
> > >   	/** @prev_residency: previous residency counter */
> > >   	u64 prev_residency;
> > > +	/** @powergate: powergate properties */
> > > +	struct xe_gt_powergate powergate[2];
> > >   	/** @idle_status: get the current idle state */
> > >   	enum xe_gt_idle_state (*idle_status)(struct xe_guc_pc *pc);
> > >   	/** @idle_residency: get idle residency counter */
> > > -- 
> > > 2.40.0
> > > 
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
