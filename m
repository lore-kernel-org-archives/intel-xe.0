Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFC61C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 19:39:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A404F10F7EE;
	Mon, 22 Apr 2024 19:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg17ctAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A9910F7EE
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713814756; x=1745350756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=zlJnpHEMu66J+YfxnzaphvhUvuN6Vb/aJaFg9l/Lk3Y=;
 b=Fg17ctAs3VfeuZAXB88RIi0QkS2K6WVIX4J8UicXEn9ZpdBkwwWcyt9C
 TtCWjHsJi1m+0TdPjjy9fc9GszsNtkC8VyRG5+68PpvbOjnxJYe8NneBp
 38LWeF7arg42E93SfwzBc3qjNgz9tXVoaWmBh76BWY8z2lB2kf6soho1n
 yG8TXaFBAxjuaI5Z/qliGPh/ZmbpLHEMLPYQu2O0BcjUTi5RIs1101i0I
 m/E5xTFpj1Mfp9kmpkhNxYe6yFFauJ9G7QCEEDuxMLg5k74FgR7fyngiG
 qJ1OIbWoLHIaGONopwnkkoHcTT+BfPc4oLWV5z/PSL+Kv9f8V2HsDSRn0 A==;
X-CSE-ConnectionGUID: EkAhuzCeQpevyefdXIQPZA==
X-CSE-MsgGUID: RwxNzO9QTpa4SQukTapLbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9481750"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9481750"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 12:39:15 -0700
X-CSE-ConnectionGUID: pktok2cCRhm9J5fZ8i4CNQ==
X-CSE-MsgGUID: uAFe5udXQMyG8lS+PRZGkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24192660"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 12:39:15 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 12:39:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 12:39:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 12:39:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZbQXhOI1ISxEthFc0jWH5os6DjOUbGoYmAw7f80p+Vt382IaXPiaqn082oFnUoM4gjY7lvMro8rNhvtwx5DONZrHusHGs4jJUCMsMYcEY7oVv9Nh5iPdeWxlrQQrenV+6FydgyKb+3M9easoPc3vvbKJC+5m34c7wHp06/znfpwk7fJ55bamvW4yOoyOcThQpXVDkOtox/HWfhIIccGMDnRvaR2Eo6yuVeXL3t2yfIPAuuSLwbtS0srkfhHIdCqIETaaaWAPGRcJPvTXEyTlVrqyuC2pYC5eVxWdngeNJ+Zhco5hOVaBbtuzWfrfoOeUQxXuZlTnm/ib7bXdS4qPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SobItV76K2R7oz2wj2Wyoj10UIW5/KIZsqJG6kSOiSA=;
 b=aI2GG/3NdUHFicYEThuM9gtTp6rCtp5ehxs365Yt4R+plTTYaR37HYsW9aV0J8KM9pYov8zl6gZoXvHv6h+T81UUVjwpHEhq/kGKF31dgyKt83OYvu2CvgY2gMB3RCMdZdNEQ87OZIT9xEC/A+y9415joTfN7cU67mQuLzNSu7I86OEhG+NPTJteefXNjbEbcR7fWAQidkijQCvy+eVMHeQXnuJ3tzrDRqHG0R18/HOn61hw3J63DrZkBJl5IQMFz7OuGZohOULJgre0HInRRJu8NAmeHlQ/wfysMSEnTZoBJ0WGgktfrF2lo5ld/N8IykHdKrv0hvAGLyZ5CSNKDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB5975.namprd11.prod.outlook.com (2603:10b6:408:17d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Mon, 22 Apr
 2024 19:39:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 19:39:12 +0000
Date: Mon, 22 Apr 2024 15:39:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe/pf: Expose SR-IOV policy settings over debugfs
Message-ID: <Zia83fbRFA7XrXFh@intel.com>
References: <20240418203442.226-1-michal.wajdeczko@intel.com>
 <20240418203442.226-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418203442.226-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BY5PR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB5975:EE_
X-MS-Office365-Filtering-Correlation-Id: ceab1787-a56f-4a85-c348-08dc6303e2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3V5NC9DcmcwUEo0dEMxdURIS3A4aWRYT0x2cGJlaVJHR29uN3JKS3A0RWN6?=
 =?utf-8?B?VGl3UU1WY2I2WXE3SDRLSVY2eVVqMG12ZDlPQ0JxTlk5QnNMOGhXcldrTW1s?=
 =?utf-8?B?S050akJKNDRTL1pEVTlDK3pnV0Z2ZmxBbmNKQ1dUdERtM1psc0hSSC9ubGp2?=
 =?utf-8?B?MjVUQUFSK1phNnNJbUg2OVh5Q0VDSkhLRkJKRjAzUEJEMERQd2xOeDI0Q2Zw?=
 =?utf-8?B?ajExZk5nNEwvOFJRbWY1eERCRThVRUt6cTlwM0pHQzlNNGRoektBcVdIVmdj?=
 =?utf-8?B?cnBPUFhGaG1mYlBBNFJ0Vkl6OFlHU09xM1pGWjJxMjBQMEtSVHVscVlTM3VZ?=
 =?utf-8?B?ZkZEZnRkVUkydE9QbkFrYU1CT2JsVm9hdEZibjJVc2dNNitWRGFZUXpsSkZl?=
 =?utf-8?B?a21HazBSbU5KYUtuWENPT3lvRVdXdm13d09zWVQ4VFFMM2FTN2RwaHl6VE5O?=
 =?utf-8?B?dk1LbHpPd3l5a015NmZLcng0STdNd0ZXL2xRYWxVOWIzSEJrd3UzWXo4aTNH?=
 =?utf-8?B?MUo0OFFndnMySi9uMU5DVFM3YWIvNXZkNXh1ajBzaXVrUllreURaS3RiYkFI?=
 =?utf-8?B?aVd4V0tQVmI4M0ZrZTBMemE0N21HSlNhNHF1UXU0YkRPRjlWRmdxS2FiWWpo?=
 =?utf-8?B?ZXFiYXRSbVJtM05JUDVNK2dWN29PNFFpOTZVWlZWQUdqZ2dlcFNhMWhsTXdx?=
 =?utf-8?B?dysrOHQzMHVIczN6TzNmOHJoQmhRbTlNZDdGb1g1TkNUM1hESHplSkQ5V3Jn?=
 =?utf-8?B?bFBqVTYwNC9YL2NDdnlHUmw1M0g1RFB4WEwwbHZBdm5lVEkwTG1TVlQwc3RY?=
 =?utf-8?B?MkhmR25iNGJPTDVINUZHSWRGdVlqRUo5QnRySGhsdmR4Q1F5YUFEMkROSUxQ?=
 =?utf-8?B?djY3Skpwb0dPTmRxczdUcmNxVWxxT3pYN2p0WWt1ZTBqMytJVFlJb2JuS2V3?=
 =?utf-8?B?UjJMdkVxWk1TNUJBakgxYk1ROUpReHVLRXltV3V6R3QzTHJLd21SMzRDZ3Z3?=
 =?utf-8?B?UnQ0bXBaOXYvODBRT1Nta1cvZDUyamNZSG1Qdko2L3MxNld2TGtNNWd3a053?=
 =?utf-8?B?WHZXOVl1anViak8yd05kejhIOXNmZlRXdlViSU9VZjZUVDRBTEVuaXNNR1Nj?=
 =?utf-8?B?eEZWd1JTZDBUVVNqL1RJQ3FoR3JGc0R0Q21NdzlFRmlqWDVvRG5SZVRlWENO?=
 =?utf-8?B?UGxyaU9SNjFDbm80c0w3N0lxOFlucEZLVnUvTk1JM0pIeGkrcy9aOG5VVnVJ?=
 =?utf-8?B?V3dWaEh2cG5vZW1KVm1OdUd1d3FJMWh6dVN4NlJzNEQyTEJ3YjVrOGpJRkVX?=
 =?utf-8?B?S0x0WEMxTkltTm53ZHJTY1JxUzZWODkrUWVqenBqT1pyem9UOUFVSlAwTVRr?=
 =?utf-8?B?Nk03WU56bEw3NVMwT2ZkQWVLYnpoTEVWc09IeDQxMnYwNm5CczkyeUxLUFUr?=
 =?utf-8?B?QWVtZDFVSGdQaDV0dEVxVFF6Mmt3SmxaMWVEd1ppWVE4eFlneFJsZ05GYVZk?=
 =?utf-8?B?WGdhNllNV1Rjb0RielBvdjM1WnVuN3pnRXZGRmU1M0s4UkZMa3RuZVlZcTNj?=
 =?utf-8?B?R09Kd1dISVRJRjNzMzAwUFoyYkVsMCs2bEJzM0VwMit1RWRRV1dJZ2h1bTls?=
 =?utf-8?B?aUt6dTM1bDVzQjVCUlk3UlRyVFl1OTdCNWg4Y1ZNakdKVDMyUGJ5UFpRRUo4?=
 =?utf-8?B?VnRIWDZ1aW9VTWZyZHlaSmk1ckF4aVZyUEQ2dlM1N3FZMUVCWDBnZjBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHVXRERuWDVlQ1FNQ2NjdmE2QXhmOUJXK0E2WG1mT2NCc2RQMUEwWlFZNytO?=
 =?utf-8?B?LzhIcHBIRGwzdnFBOUhyZWkySlp4TjgxS1ZweCtOMHRYc2JjajAySm1PRnR6?=
 =?utf-8?B?ZHFzcWwvSmsyYjhyamRTczdNTzdpakFjQ25uZ3NSSWF3eHZTL2laTzNTUkg2?=
 =?utf-8?B?dkdzeTNYRGpiSU5JUkNGMzlLc080WVlUcWl0ZjQwUWRtdjJ4Z1lZeXM4R1Vt?=
 =?utf-8?B?S2Z4Qm1ONzFhUFRMNDl3SUZLd1NMTS92SUhUWDkvZWNJd0JZc2h1c1dzVEtH?=
 =?utf-8?B?ajd3b1VqMWYyNFV2RXNoeHArcHRoYmdwVnZYaVdoZ1l2QXJYaDhrOWlRUjlo?=
 =?utf-8?B?VTM0WUxOeGxZdmdDRlNTL1dHL1p6MmtzV2RsVXJ4OEtLVmVZSU9Kb3JGT200?=
 =?utf-8?B?RW5NcjlIZDFFOUMyc1daZVU0WkN2QlU5MHpydmFxOThxMXp1NnR6eVdUWkdy?=
 =?utf-8?B?alZrQlhxcFk5Tkh6WWdxeWs1NW14bmlyZWRibHFBRkVlR2QzcCtFZ3JTYStV?=
 =?utf-8?B?bi96M3Ztb1M5S3pzYVRjU0pCUk5TZTIxVHkxb0hpbHJPNFBlM2ZjRUk1VHVz?=
 =?utf-8?B?cWJObWpwb2g2VEh6RTlrdFJtekVrM0tjK1U0SUNkTnJ3bXNSSk1PczZ1N1lW?=
 =?utf-8?B?SjlXbm5kTzNUVXBvS3F6a04yc3JNejgxWXJnZUxZUi84K2hmVWt3UHRYREMv?=
 =?utf-8?B?RHhpZHhvaTd6SUdZeGVpc25IWjlqbEdCb3U1UnY3RGZPR3IyR0t2UG9SSmc0?=
 =?utf-8?B?amlhdnN5eUlQRlFYK2pETVkzSVRvcDE5WHFVdjlzczNWT0Vyby9TaW5zUE9T?=
 =?utf-8?B?eHNjM3A5NWJQNHNXOFMveEZRNVQ5czlYOWNpV0hJZDFaOU9RVzFha0htWUFk?=
 =?utf-8?B?VmxJblY0RjlESC9NY0U3RldaMVA1MERWU3R1aURFSmszSVZBa1BOMlQyMGUv?=
 =?utf-8?B?ZERuZzU0QTFmSkJhTFBhK0tWSVlEOHlyT2xhTTdWaUhVTitTbTcrcExvaXFJ?=
 =?utf-8?B?emo2eHhNMmpaNmExZXptWXVsRmF6VVZxQ1ozY2pHQ3gvVWVjZjZyZE1iY1NN?=
 =?utf-8?B?WWw0MHNHTDFrUDNZbklLTHB4Z0RWN1NtU1RhRnZIVkxuczd2RlpCVldzNFdK?=
 =?utf-8?B?TU9HS0xqMzR3NzNaVWZMTzhISzB6R2ZZemRLWjdlZ1p5S05FYVFNL3hQc2RE?=
 =?utf-8?B?WEt2SnVGOFkvR0tQcXJZcGJ0Qy9rbFZnR0w2NUVpWGp4a1RPYk1WbEE5VjhK?=
 =?utf-8?B?UFdPVG52ZWQwdW93OWplSzhVcGxTamtsREQxbTUwbmg4UjRqZ0UwYndrUGEv?=
 =?utf-8?B?YXUrYlBoN0wzM3JHSjBPSnZTN2dKejgrdWxWNjdZRkM4ZDBuSmNJcURJQVpp?=
 =?utf-8?B?TnNZVGRSdFdDeHlPcnYzTDU1VUpDUEt2ZWVyanZ1Z205RWU0OE9ySVl3cWVi?=
 =?utf-8?B?NEdzaXd0Q2huZCswSnVLeHhFNXE1TEtzbEdiSDdwMUdGdDRiVlFLd2NmUnZZ?=
 =?utf-8?B?UUtkWFVUZzA1ckxLbDJvZXU1eW1Mek50ajl3S0prU0lsYU9JZjdKczlHYWl0?=
 =?utf-8?B?NE1EcXZNZWM5TUtibi9GbmtEaThIT05VYXJuaUNHL28wK25kZjFIWXozcUVx?=
 =?utf-8?B?MUduZ2R4RTZLMlIrcG03aUlzNkhzUlVUTkxmNG5hMlkzbENNQ0Z6OFliWHRI?=
 =?utf-8?B?MUM3cVBJSnF1aFBxUXVTN05iR0cxU0RWMTBNV1lLaENNNVdIOSsxM1hYemZy?=
 =?utf-8?B?MGVSVTRkUVRhVkJXV3hDc2xnUWgzcCtKSXRYcTAybWwyYUZRU2s3aEpFS2xT?=
 =?utf-8?B?VWVVTlMwQ0VZd3VsNVFKUUVILzM4dzVIclk5dC9vVE9MTVduS2lwY0hHUlRH?=
 =?utf-8?B?M3ZBWGNsMTRVV0h5Yi9KVEFSZkY2a0dvc1FMZ3ZOd1luSzlGWXBMcXVYSGk5?=
 =?utf-8?B?MnBmWUV4a0dKaTNhUHpnOVRQbzRYL3BHbjB2VnpqcytWRktqQjlPTnRZOXdG?=
 =?utf-8?B?UmJsL1lIbk5rZTBQb1MxWFZFWStYMVFlS1g3S253dEhybEZRRmxvSEZRVXpM?=
 =?utf-8?B?cDFRNWJiYzdWbmQ0ODJBbC92MmVKZmVScTFvcVY5V09oaHM5amZTSmw0UzlV?=
 =?utf-8?Q?FwHXWmDLiIuSHy/ZWM0TsS8iq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ceab1787-a56f-4a85-c348-08dc6303e2f2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 19:39:12.5261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WTdMXhp7ziTQNteB4/8RrbXRGvetMxwRi+IUNQO4I9vaYZYS/kz1GlV6NXgMBLUhFrxFsGEr6H1jsk+nH8rmdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5975
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

On Thu, Apr 18, 2024 at 10:34:42PM +0200, Michal Wajdeczko wrote:
> We already have functions to configure SR-IOV policies.
> Allow to tweak those policy settings over debugfs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 50 +++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 8909bb950a8b..3a83af7aa039 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -17,6 +17,7 @@
>  #include "xe_gt_sriov_pf_control.h"
>  #include "xe_gt_sriov_pf_debugfs.h"
>  #include "xe_gt_sriov_pf_helpers.h"
> +#include "xe_gt_sriov_pf_policy.h"
>  #include "xe_pm.h"
>  
>  /*
> @@ -76,6 +77,54 @@ static const struct drm_info_list pf_info[] = {
>  	},
>  };
>  
> +/*
> + *      /sys/kernel/debug/dri/0/
> + *      ├── gt0
> + *      │   ├── pf
> + *      │   │   ├── reset_engine
> + *      │   │   ├── sample_period
> + *      │   │   ├── sched_if_idle
> + */
> +
> +#define DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(POLICY, TYPE, FORMAT)		\
> +										\
> +static int POLICY##_set(void *data, u64 val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +	struct xe_device *xe = gt_to_xe(gt);					\
> +	int err;								\
> +										\
> +	xe_pm_runtime_get(xe);							\
> +	err = xe_gt_sriov_pf_policy_set_##POLICY(gt, val);			\
> +	xe_pm_runtime_put(xe);							\

I like that this takes care of the runtime_pm in a 'global' way without duplication...

> +										\
> +	return err;								\
> +}										\
> +										\
> +static int POLICY##_get(void *data, u64 *val)					\
> +{										\
> +	struct xe_gt *gt = extract_gt(data);					\
> +										\
> +	*val = xe_gt_sriov_pf_policy_get_##POLICY(gt);				\
> +	return 0;								\
> +}										\
> +										\
> +DEFINE_DEBUGFS_ATTRIBUTE(POLICY##_fops, POLICY##_get, POLICY##_set, FORMAT)
> +
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(reset_engine, bool, "%llu\n");
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sched_if_idle, bool, "%llu\n");
> +DEFINE_SRIOV_GT_POLICY_DEBUGFS_ATTRIBUTE(sample_period, u32, "%llu\n");

... but, is there any other way we could accomplish this without this style
that hides function... I hate when I have to understand anything in i915-guc
code because you cannot navigate or grep for the functions that are declared
with magic macros like this.

but this is my only complain and no big suggestions. I would like to hear
from the xe maintainers here.

for the debugfs entries and rpm handling and everything I like that.

> +
> +static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
> +{
> +	xe_gt_assert(gt, gt == extract_gt(parent));
> +	xe_gt_assert(gt, PFID == extract_vfid(parent));
> +
> +	debugfs_create_file_unsafe("reset_engine", 0644, parent, parent, &reset_engine_fops);
> +	debugfs_create_file_unsafe("sched_if_idle", 0644, parent, parent, &sched_if_idle_fops);
> +	debugfs_create_file_unsafe("sample_period_ms", 0644, parent, parent, &sample_period_fops);
> +}
> +
>  /*
>   *      /sys/kernel/debug/dri/0/
>   *      ├── gt0
> @@ -261,6 +310,7 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>  	pfdentry->d_inode->i_private = gt;
>  
>  	drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), pfdentry, minor);
> +	pf_add_policy_attrs(gt, pfdentry);
>  	pf_add_config_attrs(gt, pfdentry, PFID);
>  
>  	for (n = 1; n <= totalvfs; n++) {
> -- 
> 2.43.0
> 
