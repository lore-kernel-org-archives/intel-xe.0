Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA0C3DA4A
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 18:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210110E50D;
	Wed, 14 Aug 2024 18:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA3Kugtb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B07610E50C
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Aug 2024 18:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723659978; x=1755195978;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=Zz+f0Xnv/7wReL4BEWb2YpYFw22FvxTVtZ4XMwS/z20=;
 b=ZA3KugtbnmU7cFJGwg4ZwwpMPQeZlZfTJZd09XwOUm/xgCeBnLmmXO07
 O2vulcuHUZEu5TkVaK1s+q02PEch0vTgtD7IsXgjrlBBBgMYbD6OJ2Qvz
 K+zuFstGWSXmbjxWWoXNQmIXmeMupEWnX/gv1f5pDsahnScz8bvLuBQ3r
 qTVa+UwL11JVEEuUydtubx5OAVDaIWFXlM7KIiIxNe31PzBLw5mMehmRc
 rNktTOzOha26/ypJ1mixx6WDrsO8KworftSr/rloHH2kbDtsdCxquwGN5
 6L2y5mEEMHYjD6Psaiqwxl2jJ7pHbzW+BsNM6cU6HRpdaKX3Agr/hP7Nf A==;
X-CSE-ConnectionGUID: sQDQdnvBQrq/jols/Wn9CA==
X-CSE-MsgGUID: x1e2I474R06mqne76MIPYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21540442"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="21540442"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:26:17 -0700
X-CSE-ConnectionGUID: KZGvHRBhRHaGo+s09MoBDA==
X-CSE-MsgGUID: IKlzdXjxRPGDn87nNkT9Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="59847839"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 11:26:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 11:26:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 11:26:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 11:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zM23X5ReQ+vy0EgkQFLe2HNWrKcuizq4xWdcnXXCcF21QfIpZPiiTCfT//zS6GcVYtdIKJ7VioJfaLLRq9J7RXtjuwmhZo5mJoy0EOuk4pBrXaJZ1PRL0aJ9/zIYKTItR/g14us3DP7khysQcIxflMsO9MtOK5h3nSW7ESUGzK/B0MlAFjcn1Qu1Yb2hK97xyHLZXliHOBOrVENXvt6Mhm5GijK1TOzQaw/bn+r0d83upwXlf3BlJHTcSEB2DqT3vKu+uJHzWxTlJKOzgesvO8EzFUtwismHe9mBwYSLc9hEK7A8mp1yjRYzOpPv3MQYD7jQo2i/O8U/sbx7LzsRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJOm4LgtDsxN97KSjWPVRkHJwD7jc0nPZtxq46Fwydk=;
 b=aapY9zFbSQdozm2Hp7PG+jBs5ltwFyvt04Oeh0+UUEHIbRSVOQjKvmShYnfjkOeIYnU6o2zBKxjO7fOrd1ftBNhGf98bFqFRJqx6iwd97tAro+wDwtLV6gq6M0WVfITUZUsB/e1RbyF6aIshqJaKyTyep2Cc1FIJQ1f70vvHCqnl6YfLCjzRzke9R9rmdciKtITuC5BmQoyz8Z2PdbLy/w1VqJTHMiapJS+4js2W8xVtUrEN1iw9ZGUM9iBSeQPIMMK0WYftCuqyz6tATJuShESF/BqntznfSrMk80fGqwjqp1lEwB4nWf7vFXOQYKBf1wZoKmsYbUkPNn3rNG5CcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB7386.namprd11.prod.outlook.com (2603:10b6:208:422::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Wed, 14 Aug
 2024 18:26:13 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 18:26:13 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <tpla4fjc74lefz6imbsujf7zg64kz375bdt5eibv55feyrqcdj@6cmx3dq6yr7o>
References: <20240814165929.533310-1-francois.dugast@intel.com>
 <tpla4fjc74lefz6imbsujf7zg64kz375bdt5eibv55feyrqcdj@6cmx3dq6yr7o>
Subject: Re: [PATCH v2] drm/xe: Add driver load error injection
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Date: Wed, 14 Aug 2024 15:26:08 -0300
Message-ID: <172365996808.1939.9566458415051009979@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW2PR16CA0072.namprd16.prod.outlook.com
 (2603:10b6:907:1::49) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB7386:EE_
X-MS-Office365-Filtering-Correlation-Id: 04814589-fbec-421a-8414-08dcbc8e93cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: Hbn/y2Py6ZZPeLJbOOUsbg0vja7F/eao3/mzxiHjnZcUlXM1Ao7TEkKo0e1zKnOXAhKeaEGOCw3rtEL0ql1mg63217SkuP9wOqxeEBJekBe858/QPZoAjUHZjmR6Q0yP+XAJmVmszmX5Gg5qcT877r+/kRPnTVTSKb1ESD7b8pqGl0QNJQnit9y0qkTGojABchgKfOMQncofU5cfRa2a8PSASepJasNq7Izv6p8iP595+QsstLVsuNRKkyMfCFwx/aG4awvJGQuEMDc9RdvmDFz81h5iivG7mJTLzlPVAXuosC1Jiq5Lu4hXSkks3ulrzGnXYwM6LnUF7UZ/yNnKOslbuCcsev9WBFF3RrO25boJjd2F9DgSRA2kWb1PdZ2EaWvbkGPPuz2Lr6DNri0I9d00g7WL46Yy1B1+QJZISyDHRK1Dfx65OdkE3Pp7dJrfPY2N+JfLUJxu0OcuTEHz4XHHRjJ3Mcr4Y0W1dFueNRIrx7u5bSpcyS0tP5BNqs0mDW+0MFpmftDj4EoSDggA1vkXqdmPkcjeb0004dIuwR0Gp61vIraONMra9+wpz/4+mZKPCLo1GUlH9nJFbEDN9n++EfN1sPE9Ohl3RJRRAGKgwUVU7nt6u18GPgLLtRxoQT69cofZJBiyL8B9M3PYJdswuGvVKo9iORB5bSXhPmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWQ4MldWd2pDeGtLMTZ2Y2cxK2o4OFM5WHN2eUxFb0xFalVRUElpcllneHlz?=
 =?utf-8?B?b2l0a1l4RXBnYlArcCt4eGVnbzA0bGlhQkNHSEdXb3NXYzRUeG02SjZmTW1s?=
 =?utf-8?B?YXdHeE1PVEtUWXJUUDV2N3pXUGdWVmsybkcwbDQ3V1FrYzRjdS9TckEySUpr?=
 =?utf-8?B?b3B5bW54R1hLQUYwOTF0V04rSzVIdUNibEJoSFIxNE90U3ZBVnJxMnB6OEQ3?=
 =?utf-8?B?MlQ0RlNicGg0S29xOXhMN1NIOFlZa1dycVBBdE9UUDk1WVlTU204UGgyYmFJ?=
 =?utf-8?B?NnRJYzNUazVBaE4rN24zT1luZGZxVTVGY0R1dXZ2Uk1TUjA3MFYzZFFFZjZH?=
 =?utf-8?B?S3dFQXZmMmJDdllWVENCUFVWOVpWSWtxMGJveW1wVld2TzFxOGtmYmZ5cjBL?=
 =?utf-8?B?emg5OXJHWGxjSTRvZDRJeDk3WEgxU1NHMGVodEJDK242ZmRmelBpbGVoK0Rs?=
 =?utf-8?B?S0FMWlRQTGJlbHJTSjNjWWFzc29NdG5yY3VuNU1OSzdUOTErMkFPLzdDdHkv?=
 =?utf-8?B?eGJqaU05bG5kSnppQTBsSEY3QVQxM3Bmc2RZT1B4bWI1SDZrY2N0N2hpNzZ2?=
 =?utf-8?B?Y3M2VTl6aWo4Y1FIWUVtVU9KbFlKMlRtNEpXbkdkbERUL1VmZEJGbW9WMk9N?=
 =?utf-8?B?QmpZQnlvd0FCamFHbVRRYmdHYkYzdERDQkdxVngxbHhvUnVEaTZLS2dzeTJn?=
 =?utf-8?B?S3BBV2FURUw1ZEFWa1U4OEdhZmNSdUY4VUVPZ0V0cEJGSXBsZ3R3UTR3OTZh?=
 =?utf-8?B?bnliRjc5b3YvWE1DZkRNYzN4UFZibEdBMDkzaTEvR2FiRjNZZ3lCeFB2UU8r?=
 =?utf-8?B?ckV6SnQ4dTZSejBVSTQxWDFUb3VrNXhLd0hLbnpQT0NvY09qakVxN01MeFZI?=
 =?utf-8?B?SzlTZXRreUJEYVFNeHlINkp2OFdrUFdWMGRJV2ExSFQza3lCdHlwMUxUTllN?=
 =?utf-8?B?aTFsNUgxZXB2MG5oK1NrTFlWTGk1R1ZnYzBQaTBMcC9acmRDeE8xMjd5T25R?=
 =?utf-8?B?TmE1Nk5xdFkvS3l1WmZSalZhdUFPY09CTDY0bGtOOXBCVG05RFBoakkzL3Qz?=
 =?utf-8?B?b2ltWGZ6ZHA5SDRHY2Mxajdwb3VIbXhObUl5TTVJTHJFbGozd3p1V0JBdGd5?=
 =?utf-8?B?dzA2aXM0bm4weDRXSUt0bG8wZkxhZ3FuZWVYa0lzWU4rWU5abThsTWdDajl4?=
 =?utf-8?B?Zmo3MDdvT28wdTVnZHR0SVpWak9WVlY4UUp6cEkxd2lCSTNzYnRaRTFTcEV4?=
 =?utf-8?B?UU05bCs5VHB6SFRBbkhhSTJkNW5ETDlIdjl3TXlhdk9sVmk3UDFxRDNWU2di?=
 =?utf-8?B?TWpvL2ZIU3k1WGRUQ3ZTTlhFZnZ2SHhHeW1ycm56YStNSHFDMlp2YXRvZ0ls?=
 =?utf-8?B?ZTFkdlV1N3ZudFNjU296dWR6aU1xYlFlazFLY21NS0dIMUc1ZkJLWnJrUWNh?=
 =?utf-8?B?R0RCczVvb2dPZm4zendsSSttSkU0WHhSSG1EQWlCTW9YRG4rc0FaWTczSnJR?=
 =?utf-8?B?WXRRZWZ6K2lscGtyQ21FUUd6NHo4Zmh1d3F0WDNjQXNjdHUzRXdQcjkzNnc2?=
 =?utf-8?B?SzdOLy85cWxoOU1CSXdoUWxTejQ2UExlaG9RdmZRdHBIbm1yWHlQY2d3ZVZo?=
 =?utf-8?B?WUdCbWxpRjZVTlVHTzdPV0hSWXpDTkg3dTZvdEs5KzFEK0hTOUpTMGJubzNG?=
 =?utf-8?B?OVlpWUhEeU0xaEc2a2pCU3RmbFNxZVpUbFE4aXQ4a2FvdVQ1akNrbVkreXl4?=
 =?utf-8?B?dW5sZGxOVStFSDdKQkdUL0pkTnRaYWFKYnRKOE10eEF5UzRFd2JhdW1lbDZR?=
 =?utf-8?B?MTdIUnE5MkltUnB1UW1SSlpmZ3AzQTBKN2NzUXdqYzFrWUtPVEg4M1l3S0g5?=
 =?utf-8?B?cFRHbDJZcVU4cG02M0x6aDFBakp2aEwrMFVQMm1JTGVwZlA0Y09mL3ludGZE?=
 =?utf-8?B?N1JlMmpwTXBLbjNKTWd5eGVCYi9jbWF6RDdDWDJWeVRIMXpmMkp6N25Cd2ta?=
 =?utf-8?B?VGhPdWJYQ1ROQWhmZzNyRE8wOU9zSndjZEZMdWE1bzIzWjQzUkVOL1lPNlNp?=
 =?utf-8?B?NCtDM0pUREF2NUx4Vm1UQUV6aS8rbk5ZV3pYYU5MOTNydWl6WW5RSXoyR2Js?=
 =?utf-8?B?ZFBVSFMzRDBRUk8wLzVITjJhK2wzMjZvRG1hR3ZlTE12Qm1SdTdnejR5RnhP?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04814589-fbec-421a-8414-08dcbc8e93cf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 18:26:13.4111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZS00DTxAKJpTWqm99HZk9owKpWSBTEYS1gbzXWeJZCIntN69qQP7kL07Wn547xMx9HjHpRaZncL/DMc2VqdM3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7386
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

Quoting Lucas De Marchi (2024-08-14 15:18:14-03:00)
>On Wed, Aug 14, 2024 at 06:59:29PM GMT, Francois Dugast wrote:
>>Port over i915 driver load error injection.
>
>this sentence needs to go away, then you explain here what this is and
>how it's expected to be used for tests. Also a good opportunity to

Even though this is supposed to be temporary, the explanation could be
done as documentation in the code instead of part of the commit message?

--
Gustavo Sousa

>explain that this is used to fix up the current problems and avoid new
>ones to be introduced, but in future it's expected to be replaced by
>infra from fault-inject.h.
>
>>
>>v2: Fix style and build errors, modparam to 0 after probe, rename to
>>    xe_device_inject_driver_probe_error, check type when compiled out,
>>    add _return macro, move some uses to the beginning of the function
>>
>>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_device.c       | 43 ++++++++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_device.h       | 25 ++++++++++++++++
>> drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
>> drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>> drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
>> drivers/gpu/drm/xe/xe_guc.c          |  2 ++
>> drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
>> drivers/gpu/drm/xe/xe_mmio.c         |  2 ++
>> drivers/gpu/drm/xe/xe_module.c       |  5 ++++
>> drivers/gpu/drm/xe/xe_module.h       |  3 ++
>> drivers/gpu/drm/xe/xe_pci.c          |  3 ++
>> drivers/gpu/drm/xe/xe_pm.c           |  3 ++
>> drivers/gpu/drm/xe/xe_sriov.c        |  2 ++
>> drivers/gpu/drm/xe/xe_tile.c         |  2 ++
>> drivers/gpu/drm/xe/xe_uc.c           |  1 +
>> drivers/gpu/drm/xe/xe_wa.c           |  2 ++
>> drivers/gpu/drm/xe/xe_wopcm.c        |  2 ++
>> 17 files changed, 105 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
>>index 1aba6f9eaa19..6d3cdeeaadfd 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -374,6 +374,10 @@ struct xe_device *xe_device_create(struct pci_dev *p=
dev,
>>         if (WARN_ON(err))
>>                 goto err;
>>
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>+        if (err)
>>+                goto err;
>
>        err =3D ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>                              xe->drm.anon_inode->i_mapping,
>                              xe->drm.vma_offset_manager, false, false);
>        err =3D xe_device_inject_driver_probe_error(xe, err);
>        if (WARN_ON(err))
>                goto err;
>
>
>rather than adding another flow control
>
>>+
>>         return xe;
>>
>> err:
>>@@ -474,6 +478,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>                 goto mask_err;
>>
>>         err =3D dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_siz=
e));
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>         if (err)
>>                 goto mask_err;
>>
>>@@ -577,6 +582,7 @@ int xe_device_probe_early(struct xe_device *xe)
>>                 return err;
>>
>>         err =3D wait_for_lmem_ready(xe);
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>         if (err)
>>                 return err;
>>
>>@@ -745,6 +751,10 @@ int xe_device_probe(struct xe_device *xe)
>>         for_each_gt(gt, xe, id)
>>                 xe_gt_sanitize_freq(gt);
>>
>>+#ifdef CONFIG_DRM_XE_DEBUG
>
>comment here:
>
>        /* After probe finishes, stop checking for error injection */
>
>>+        xe_modparam.inject_driver_probe_error =3D 0;
>>+#endif
>>+
>>         return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize,=
 xe);
>>
>> err_fini_display:
>>@@ -995,3 +1005,36 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>         for_each_gt(gt, xe, id)
>>                 xe_gt_declare_wedged(gt);
>> }
>>+
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+/**
>>+ * __xe_device_inject_driver_probe_error - Inject an error during device=
 probe
>>+ * @xe: xe device instance
>>+ * @err_injected: the error to inject
>>+ * @err_real: the error returned by the actual function
>>+ * @func: the name of the function where this is called from
>>+ * @line: the line where this is called from
>>+ *
>>+ * This is not meant to be called directly, only through xe_device_injec=
t_driver_probe_error.
>>+ *
>>+ * Return: err_real if !=3D 0, err_injected otherwise
>>+ */
>>+int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_=
injected, int err_real,
>>+                                          const char *func, int line)
>>+{
>>+        if (xe->inject_driver_probe_error >=3D xe_modparam.inject_driver=
_probe_error)
>>+                return 0;
>>+
>>+        if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_=
probe_error)
>>+                return 0;
>>+
>>+        if (err_real !=3D 0)
>>+                return err_real;
>
>why isn't this the first check? we don't want to count any error
>injection if the error was real
>
>>+
>>+        drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d=
]\n",
>>+                 err_injected, xe->inject_driver_probe_error, func, line=
);
>>+
>>+        xe_modparam.inject_driver_probe_error =3D 0;
>>+        return err_injected;
>>+}
>>+#endif
>>diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_devic=
e.h
>>index db6cc8d0d6b8..31270a54ccf9 100644
>>--- a/drivers/gpu/drm/xe/xe_device.h
>>+++ b/drivers/gpu/drm/xe/xe_device.h
>>@@ -179,4 +179,29 @@ void xe_device_declare_wedged(struct xe_device *xe);
>> struct xe_file *xe_file_get(struct xe_file *xef);
>> void xe_file_put(struct xe_file *xef);
>>
>>+#define XE_DEVICE_INJECTED_ERR -ENODEV
>>+#define xe_device_inject_driver_probe_return(__xe) \
>>+        ({ if (__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJ=
ECTED_ERR, 0, __func__, \
>>+                                                     __LINE__) =3D=3D XE=
_DEVICE_INJECTED_ERR) \
>>+                        return XE_DEVICE_INJECTED_ERR; })
>
>#define xe_device_inject_driver_probe_error(__xe) \
>        __xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR=
, 0, __func__, __LINE__)
>
>>+#define xe_device_inject_driver_probe_error(__xe, __err_real) \
>
>#define xe_device_inject_driver_probe_error_override(__xe, __err_real)
>        __xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR=
, __err_real, __func__, \
>                                              __LINE__)
>
>or with some other better name, but without changing the flow inside a
>macro.
>
>>+        __xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_E=
RR, __err_real, __func__, \
>>+                                              __LINE__)
>>+
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+
>>+int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>>+                                          int err_injected, int err_real=
,
>>+                                          const char *func, int line);
>>+#else
>>+
>>+static inline int __xe_device_inject_driver_probe_error(struct xe_device=
 *xe,
>>+                                                        int err_injected=
, int err_real,
>>+                                                        const char *func=
, int line)
>>+{
>>+        return 0;
>>+}
>>+
>>+#endif
>>+
>> #endif
>>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe=
_device_types.h
>>index 5b7292a9a66d..139336ad4194 100644
>>--- a/drivers/gpu/drm/xe/xe_device_types.h
>>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>>@@ -484,6 +484,11 @@ struct xe_device {
>>                 int mode;
>>         } wedged;
>>
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+        /** @inject_driver_probe_error: Counter used for error injection=
 during probe */
>>+        int inject_driver_probe_error;
>>+#endif
>>+
>> #ifdef TEST_VM_OPS_ERROR
>>         /**
>>          * @vm_inject_error_position: inject errors at different places =
in VM
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 58895ed22f6e..4c73576bc5f3 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>>         xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>>
>>         err =3D xe_wa_init(gt);
>>+        err =3D xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
>>         if (err)
>>                 return err;
>>
>>@@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>                 goto out_fw;
>>
>>         err =3D xe_uc_init_hwconfig(&gt->uc);
>>+        err =3D xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
>>         if (err)
>>                 goto out_fw;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_pf.c
>>index ef239440963c..0d50cbb496c3 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>>@@ -7,6 +7,7 @@
>>
>> #include "regs/xe_regs.h"
>>
>>+#include "xe_device.h"
>> #include "xe_gt_sriov_pf.h"
>> #include "xe_gt_sriov_pf_config.h"
>> #include "xe_gt_sriov_pf_helpers.h"
>>@@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>>                 return err;
>>
>>         err =3D xe_gt_sriov_pf_service_init(gt);
>>+        err =3D xe_device_inject_driver_probe_error(gt_to_xe(gt), err);
>>         if (err)
>>                 return err;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>index de0fe9e65746..61009499fddf 100644
>>--- a/drivers/gpu/drm/xe/xe_guc.c
>>+++ b/drivers/gpu/drm/xe/xe_guc.c
>>@@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
>>                 goto out;
>>
>>         ret =3D devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>>+        ret =3D xe_device_inject_driver_probe_error(guc_to_xe(guc), ret)=
;
>>         if (ret)
>>                 goto out;
>>
>>@@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>                 return ret;
>>
>>         ret =3D xe_guc_pc_init(&guc->pc);
>>+        ret =3D xe_device_inject_driver_probe_error(guc_to_xe(guc), ret)=
;
>>         if (ret)
>>                 return ret;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_c=
t.c
>>index beeeb120d1fc..29a8314b0ee1 100644
>>--- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>@@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>         ct->bo =3D bo;
>>
>>         err =3D drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>         if (err)
>>                 return err;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>index bdcc7282385c..f79ac35251c5 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -137,6 +137,8 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>         size_t tile_mmio_size =3D SZ_16M;
>>         size_t tile_mmio_ext_size =3D xe->info.tile_mmio_ext_size;
>>
>>+        xe_device_inject_driver_probe_return(xe);
>
>as above, let's keep the if (...)  here rather than inside the macro.
>
>Lucas De Marchi
>
>>+
>>         mmio_multi_tile_setup(xe, tile_mmio_size);
>>         mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>>
>>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_modul=
e.c
>>index 7bb99e451fcc..dbc737085bf1 100644
>>--- a/drivers/gpu/drm/xe/xe_module.c
>>+++ b/drivers/gpu/drm/xe/xe_module.c
>>@@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.for=
ce_probe, charp, 0400);
>> MODULE_PARM_DESC(force_probe,
>>                  "Force probe options for specified devices. See CONFIG_=
DRM_XE_FORCE_PROBE for details.");
>>
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_=
driver_probe_error, int, 0600);
>>+MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error")=
;
>>+#endif
>>+
>> #ifdef CONFIG_PCI_IOV
>> module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>> MODULE_PARM_DESC(max_vfs,
>>diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_modul=
e.h
>>index 61a0d28a28c8..d612a7ae7a4c 100644
>>--- a/drivers/gpu/drm/xe/xe_module.h
>>+++ b/drivers/gpu/drm/xe/xe_module.h
>>@@ -20,6 +20,9 @@ struct xe_modparam {
>>         char *force_probe;
>> #ifdef CONFIG_PCI_IOV
>>         unsigned int max_vfs;
>>+#endif
>>+#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>+        int inject_driver_probe_error;
>> #endif
>>         int wedged_mode;
>> };
>>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>index f818aa69f3ca..97b82d5366d9 100644
>>--- a/drivers/gpu/drm/xe/xe_pci.c
>>+++ b/drivers/gpu/drm/xe/xe_pci.c
>>@@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>                                   desc->has_display;
>>
>>         err =3D xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>         if (err)
>>                 return err;
>>
>>@@ -647,6 +648,8 @@ static int xe_info_init(struct xe_device *xe,
>>         struct xe_gt *gt;
>>         u8 id;
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         /*
>>          * If this platform supports GMD_ID, we'll detect the proper IP
>>          * descriptor to use from hardware registers. desc->graphics wil=
l only
>>diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>index 9f3c14fd9f33..4c05352eb01a 100644
>>--- a/drivers/gpu/drm/xe/xe_pm.c
>>+++ b/drivers/gpu/drm/xe/xe_pm.c
>>@@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
>>                 return err;
>>
>>         err =3D drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>>+        err =3D xe_device_inject_driver_probe_error(xe, err);
>>         if (err)
>>                 return err;
>>
>>@@ -246,6 +247,8 @@ int xe_pm_init(struct xe_device *xe)
>> {
>>         int err;
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         /* For now suspend/resume is only allowed with GuC */
>>         if (!xe_device_uc_enabled(xe))
>>                 return 0;
>>diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.=
c
>>index 5a1d65e4f19f..164cc119ad96 100644
>>--- a/drivers/gpu/drm/xe/xe_sriov.c
>>+++ b/drivers/gpu/drm/xe/xe_sriov.c
>>@@ -105,6 +105,8 @@ int xe_sriov_init(struct xe_device *xe)
>>         if (!IS_SRIOV(xe))
>>                 return 0;
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         if (IS_SRIOV_PF(xe)) {
>>                 int err =3D xe_sriov_pf_init_early(xe);
>>
>>diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>>index 15ea0a942f67..bc0193bd35ed 100644
>>--- a/drivers/gpu/drm/xe/xe_tile.c
>>+++ b/drivers/gpu/drm/xe/xe_tile.c
>>@@ -124,6 +124,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct x=
e_device *xe, u8 id)
>>         if (IS_ERR(tile->primary_gt))
>>                 return PTR_ERR(tile->primary_gt);
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         return 0;
>> }
>>
>>diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>index 0d073a9987c2..32e0466bf0a4 100644
>>--- a/drivers/gpu/drm/xe/xe_uc.c
>>+++ b/drivers/gpu/drm/xe/xe_uc.c
>>@@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
>>                 return 0;
>>
>>         ret =3D xe_wopcm_init(&uc->wopcm);
>>+        ret =3D xe_device_inject_driver_probe_error(uc_to_xe(uc), ret);
>>         if (ret)
>>                 goto err;
>>
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index 564e32e44e3b..1c0c1ea8058b 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -832,6 +832,8 @@ int xe_wa_init(struct xe_gt *gt)
>>         if (!p)
>>                 return -ENOMEM;
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         gt->wa_active.gt =3D p;
>>         p +=3D n_gt;
>>         gt->wa_active.engine =3D p;
>>diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.=
c
>>index d3a99157e523..eb7f1554108d 100644
>>--- a/drivers/gpu/drm/xe/xe_wopcm.c
>>+++ b/drivers/gpu/drm/xe/xe_wopcm.c
>>@@ -263,6 +263,8 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>>                 return -E2BIG;
>>         }
>>
>>+        xe_device_inject_driver_probe_return(xe);
>>+
>>         if (!locked)
>>                 ret =3D __wopcm_init_regs(xe, gt, wopcm);
>>
>>--=20
>>2.43.0
>>
