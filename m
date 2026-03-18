Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0289103E16A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 12:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30B510E528;
	Wed, 18 Mar 2026 12:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y2VUQSZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C5510E528
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773836160; x=1805372160;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gl1lvn9ijRKVsU7aEDlTaaBXFq5yApe3neaDogjBj2I=;
 b=Y2VUQSZsPdJWX5h7EAmUnN/v7OaqiHlM6+x3zo5Pneh1DcqfiFSf9Gg9
 JxoD5OLtnP4b0NmgM208i/tG/6PPaUkjPhsg7ion30ta83Kow0P74IM2Z
 eBVRoga3LaB7FKeAz+aKZgeA5/ZWeGhoJCNRPAqBWGNNQFr7D6wQm7AcW
 WXQ3kc2UXIwrIF5vhbDRnYbgxWfCwizSseMxoDCilAMpBh5/yZ5dSF/KN
 NcMnAUf9omgzHODrkICVQRwitE0+OZOf9Cfb9zSe90HLi1KWpB54EPOPd
 DXBFkHaSCSu8zXgxZXTQ+dmREq1yZa84lUpeudkgHKO964JdNWOq7/K7p w==;
X-CSE-ConnectionGUID: ld+8PTgnTDGgI5MsiDH04Q==
X-CSE-MsgGUID: CI+nDwdRQcq7ne3CgX+R5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85202334"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85202334"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 05:16:00 -0700
X-CSE-ConnectionGUID: LOpZIxAmT16cpTi5hT2sAw==
X-CSE-MsgGUID: TGM5ZTRrTQ2yyyoE521z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="227549158"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 05:15:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 05:15:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 05:15:58 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 05:15:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYi2zj1ZeAde01q0egAUYJoZjbPYlAGGby+Rj+8Lo/mTDbNKhm+dgZbJZTm3g8d2Y/FQkuyUISdM8KmQoUlVnsyHWDiqmw0BrGE5PQvMhIso0lxRLHlR+0TmKhwLEgzIlffV8+ncGrCboGly7llcAnmpsxfspKNcLIOQ8/5xBOSzwDz4gTCk/GT/cQdKwZ947wP0GCQGUcTbFSjhZHnsOsFZn+WP6dn7ZU3v/UlEQFHql6cDmq/7geUwsgBfExmE9Kf073neNEqd2LJ3rQEO8FQJ03SQ4kLXPmUUDLcvc1/RYvbqoeSFXRe8QVDyAielACK0H6Y0Uq2IKwWQpsjaCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlsJ+w61ed+W02y6M86NkDXx9Y5HQv2qXmBP7FnKE4w=;
 b=LHxXDxHaWVN1ve+j5BXSv2Wg0/yqgGgpX+UDBzApwh32DiT5ubGwRDIi4terWralVBRzwV9enxXuzIL+wxXNoc2ivu5RpFEGlKFSa+nU56ey/FwNO9dSJd6dJKK11Moadh7LuPD9ibSS+VBCXkHo2bCZThxT64puQWi6Cj7c0T28c9Vyjw5d/GjdnHA9UjNtFGwqBCf1ev1fkB+pghGQgq7kISw+aVoK67pgY7qvYNiqJeH+ecP94moF/Ej6PP9OcqE8WEJ6QVRw6lNQ+9aEhvBFpWvrelZrcgdCXHLGHTWR0NFWl3x2uR0IUvpAXhW+i3KdmbzkdQKrUZVlwBjYiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by IA1PR11MB6538.namprd11.prod.outlook.com (2603:10b6:208:3a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Wed, 18 Mar
 2026 12:15:48 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 12:15:48 +0000
Message-ID: <f6743382-3132-4904-b876-b695f8bf3ede@intel.com>
Date: Wed, 18 Mar 2026 17:45:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/12] drm/xe/bo: Add purgeable shrinker state helpers
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260303152015.3499248-1-arvind.yadav@intel.com>
 <20260303152015.3499248-11-arvind.yadav@intel.com>
 <fd01cee5878be605002e2a4f349be9f5b76010a6.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <fd01cee5878be605002e2a4f349be9f5b76010a6.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0173.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::9) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|IA1PR11MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 3088ec0c-5b64-4b6b-d032-08de84e81677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 47mZSM0zKcFGzSoRAwk1cKqJof5Kn3niA4SaKa4QUKuOVYzHlnMWw78q5hswLUeS6soe/FXO9hoo2jeFelsTuGldBgPwL3OY7BqkxSstynPMWZ4DUzIycW1UXK2qE7YI2CZqr0NQWu5wiig/LgispJ5zfSlBRgyptpmoV06kYllAlqdAgwWskQhsPY0r0glfHtVpcInz6CHCgkJIZN7KzJXgqFa4bsbnvNRPyIcgB0tgKRJVd+aMV2LEeUtbJGLSHnR+wRDAWeajhSzYwq/VBtiFiEKBXd238KqjD0GVsAT/MM28VNfkrdq5Jz+ObjQk5SE5xA2MMfAcJATcgNFtlafA4zLGD8AQfRNAJXNalve+l1lldKI4axWP0mZhbVpKLI9oHSHM6QPBphdPJx0ruK3zh81GkjmuXvD1+noOJywbN6v27DnWABL2W6ShaOlHHIhL1vM7avcgl4tJ+ikdLHNwllsWBciGSxCSuFvgPExbNgHwcArGTmFcZTEk3MUS1sIO4HrdoQh6VBt1McaAk7kj6advytlB2UqVKpYVRBpCs7HK4pfPFLYyLvDlkftsaKWy6xH+UDyFKwQ5Fq4OA+L+xHMb28FoNn1XguA2WBEmp+/lwz4WmIKG4SoIG8Z5bNprb/Lpxg2KfY3M14osrezFy/KcDM6dDJXg5MF0ZhLedWDw9szMG4d4NjhgnsDX7SANfOq4L7n0WnjPrQIw2DlbnlfL7nPm9OqgoxtRjts=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlZxa2x6WDlRa3lqYmJhS1MzVk01b0llQ0l0NXh6WUNkaDlqbmxuUjNFNjRV?=
 =?utf-8?B?a0pvbjBQcS9SLzNGQm5JQW5HeGx3RThkWnFRWlFhaytuUGF6TnVUZkFZdkxl?=
 =?utf-8?B?MExaeHRjNGhwdzBlek0rTzNIdTVMMERmbHhseTAxN2JtS2NGU2xLMFd6WERa?=
 =?utf-8?B?SFhKWjZEQ0tSbTJ3eEFpUW5qaTFmN2RzcktscGJXMzZFbkRCMThPcTAwMlBo?=
 =?utf-8?B?STl6UXNwS014c0pnN1ZqbFBBYXFBOVlaVWdZOC9Wc3J3cWZZaGl5by9OMjdk?=
 =?utf-8?B?ZENEUEVQYTZCR3VJVWU0SnNkVkI3VEJkbkc1UUdHeExYQWZBVktEbUExcnNV?=
 =?utf-8?B?ZVJISXZmek9XL2VkTEVYYzk0cUU2SXdZdUtaZ1NCWUxCR0pka0gzbENsMzgw?=
 =?utf-8?B?YjF0R0gxeWJPYllXLzZPcE9JV0RVZFBBSXRXeDBQZjdwSkdzWHQrd3ZMa25v?=
 =?utf-8?B?RTFhSjVQV3RnakVzZTZvRGNORHJqcUhpL0VwcUFvY25xa1ZuU1ZHVEc4Znk4?=
 =?utf-8?B?TVlYUzVLVXhLRmVFSW0vK01OaUgrZEs0MFFhQTFON2Y0Y3RYOEVKcE0rcGp4?=
 =?utf-8?B?SkFZTWJrTkZZT05JenRaZmFsWFhReGhSRTlsZTFlZDV3TmtxNDZhUnJvc3R3?=
 =?utf-8?B?TEpldzdSbThXRExmblQ1Z2xDY1lLc3hlTFloYmc5OU00MWdqeVpZTWpsSmFt?=
 =?utf-8?B?OWFkYS92Y3NNTkJFMVJtdVR0Rjk0YWRDbWZiK2lFYUxiTnltM0IrdzQ4TGw4?=
 =?utf-8?B?MFFDelpPRG5oWGd0M21yd2tWRFpWT0NFU2R1MWVVelVoTlN5R2tPM3VPYThn?=
 =?utf-8?B?TlJ4c3FkSlZRU3NNRlkyK1FIOGlGTzNJR3VtTlIrdGNrcUxNV0gyUnBDbDZ6?=
 =?utf-8?B?UzJHSng0b21nVjQxekNvdy9nQks4WHMwUkFZZzgrV2Yzcy9tSlV6aWdBQ2l6?=
 =?utf-8?B?elR5VFoyYVpqVm82S3FvaGlnNWdxbkxNM1I0YkRNRjFwdkNiQ28rYXJ2eXo5?=
 =?utf-8?B?UkltbFZHdEtHRGhzc1gxSE9YejZEeUc1QmM5dktvRzVCK1cwUGlPcG5xMkt3?=
 =?utf-8?B?dTJtWGQ5eXhUMnhVd1FGTVU3QXpaUVd2b0ltcDFwdUFUdUtJNVpHU2pCM0VL?=
 =?utf-8?B?WDB3K3FFdndVN3dFR3p2czJidFFtLzRsY3NZZzh4ay9DRFpIRDl1aFZscHRV?=
 =?utf-8?B?WW1FU0lONjh6WFlzOFF4aWFzUjJjclZYQ29zOERqNE9oNlNGTm1jSStQSEF5?=
 =?utf-8?B?TlVaNDZMbkhCVCtvbnQvN0VmMXlsMlBkS1RXSVgwTXJEZG9MNVl1bk5hZXNB?=
 =?utf-8?B?VkJyM2RRMnRSaGhVOGl1bzRyU0N4SmhhKzVPelBDZDJaZnpxaVNWVjIrVlRO?=
 =?utf-8?B?VWtadzlNTDFOOVVES1JGdFBtS2hrZnlHU3R4cGlReElKNkVJTTNNU0ttMFd6?=
 =?utf-8?B?OUt2bDRxTkY2TEhVMUFRUThEQjBFQ3UyV1NoNW9jNFVtRlVheHR1d3ZHVVpm?=
 =?utf-8?B?S3h3NnlDL01hM3M5NG5haklBeitnZkF6bHJ6ZDJmYzZSNFd0U3dGTVVQVHFW?=
 =?utf-8?B?QkU5QWxjYTROWkxiUExtNGNXY2N4ZlFzRjNPa0M1T2ZnV2s1S3FqcFVaMS9S?=
 =?utf-8?B?VjZsM2JaS3VndVdjb2E5dHRCcEMzMklCUWhzNnVmYk5jb2tRR01BRm8xNlUw?=
 =?utf-8?B?T2hQTzczZ0IxTDFTMXYxSXk5U2lpMllsS1hydkVJd0k4a010anJjNDN2T2JQ?=
 =?utf-8?B?NGlrbDVseVJCdXpHRG0vTGRDRXhGNUthYkpkUjdIeTZJdXNndVJINTk2TW1W?=
 =?utf-8?B?K0tuaUIrNGZKTDJPOWovM1B0dkg5Wkd6Znk5d3ZHS1hSekVlVEsrWkRIMU0v?=
 =?utf-8?B?VkxZT096d3puSTBqK0hBRXk1KzIyczBaaUFJMGZOVTQ4TXpUNW9tUC9lTFl2?=
 =?utf-8?B?WVlldkZvYnoxSU5nZG9jNFFKUkZ4TnJqOWdwRGhhWGxBSVVxZ2twZHcremRt?=
 =?utf-8?B?VFdJM1lyN3VJQjFVZCtCN3hoSjZ0Lyt3ZnJ4ZVhpOEFvbkVVaElaa0c3eS9W?=
 =?utf-8?B?enhYMHlsNWxmZzg2WmhkL0hIaU0vTFlTK1M2U2lkMlhuVzc3WW9UY0haMEkv?=
 =?utf-8?B?T2VLOHNaM0dOUndvQlFPa3lvMlN3NWI1TG9Sd012SjlySTg5eUhmem5ybGo3?=
 =?utf-8?B?V2FJQ2FoZVU2YW0zZG9GS2R2Nm9VamVxTEFFUlI3bnNOZjA4ejB0bS9weFBq?=
 =?utf-8?B?ZFJoNmZoS3d3a21ENkxiUmdOY0Y2d2pQSFpyWi9Bb05zR3NTcnhNSzY3bEMx?=
 =?utf-8?B?ZjNwanJwa01LeDlTbXcxclNiOXh4elFOWkVoV2hxR0ZpU0RWeTJCQT09?=
X-Exchange-RoutingPolicyChecked: ei80u/DevyMgrKGrjuqAXdIAvP9kBaSC/7kBaSJO4tm5Keknjc94U5jagYSNg5r096CPCsqNjk3/X+DZH8wGR8VG5xRyWu2hiUlqvo8YaVHET5iBbNkHgF2LTngmM/KXyG6LH1MJ661Zg2xdKjEGmf885ST4ZD93Sohvmr9ON5yhJGLLV8ucRbTy4q/FuGj+40qcn0P+Dx1dnvMoBjYDjqkFfu4/H4sA185Cxs/+RR7l+W8hEuOIru8tjfLGomr5XSbsaHvV1MQPfaBTQpZhqICIrLmz4nx1kDnSvOM90nAqEaslq9J60sWfEWiQfloNxH5e6WJgNLjW8E/tN0zj+g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3088ec0c-5b64-4b6b-d032-08de84e81677
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 12:15:48.4996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJCGYFwi7H9TRIRTBSdAZQap/chhk1SNh1Lxn3bVx05abm2+OdqU9o5A6MDTZSBv1OkUv5t2gPm5mKbD2LWRSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6538
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


On 10-03-2026 15:31, Thomas Hellström wrote:
> On Tue, 2026-03-03 at 20:50 +0530, Arvind Yadav wrote:
>> Encapsulate TTM purgeable flag updates and shrinker page accounting
>> into helper functions. This prevents desynchronization between the
>> TTM tt->purgeable flag and the shrinker's page bucket counters.
>>
>> Without these helpers, direct manipulation of xe_ttm_tt->purgeable
>> risks forgetting to update the corresponding shrinker counters,
>> leading to incorrect memory pressure calculations.
>>
>> Add xe_bo_set_purgeable_shrinker() and
>> xe_bo_clear_purgeable_shrinker()
>> which atomically update both the TTM flag and transfer pages between
>> the shrinkable and purgeable buckets.
>>
>> Update purgeable BO state to PURGED after successful shrinker purge
>> for DONTNEED BOs.
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant
>>      patches (Matt)
>>
>> v5:
>>    - Update purgeable BO state to PURGED after a successful shrinker
>>      purge for DONTNEED BOs.
>>    - Split ghost BO and zero-refcount handling in xe_bo_shrink()
>> (Thomas)
>>
>> v6:
>>    - Create separate patch for 'Split ghost BO and zero-refcount
>>      handling'. (Thomas)
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 63
>> ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_bo.h         |  2 +
>>   drivers/gpu/drm/xe/xe_vm_madvise.c |  8 +++-
>>   3 files changed, 71 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 3a4965bdadf2..598d4463baf3 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -863,6 +863,66 @@ void xe_bo_set_purgeable_state(struct xe_bo *bo,
>>   	bo->madv_purgeable = new_state;
>>   }
>>   
>> +/**
>> + * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
>> shrinker
>> + * @bo: Buffer object
>> + *
>> + * Transfers pages from shrinkable to purgeable bucket. Shrinker can
>> now
>> + * discard pages immediately without swapping. Caller holds BO lock.
>> + */
>> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>> +	struct ttm_tt *tt = ttm_bo->ttm;
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_ttm_tt *xe_tt;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!tt || !ttm_tt_is_populated(tt))
>> +		return;
>> +
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>> +
>> +	if (!xe_tt->purgeable) {
>> +		xe_tt->purgeable = true;
>> +		/* Transfer pages from shrinkable to purgeable count
>> */
>> +		xe_shrinker_mod_pages(xe->mem.shrinker,
>> +				      -(long)tt->num_pages,
>> +				      tt->num_pages);
>> +	}
>> +}
>> +
>> +/**
>> + * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and
>> update shrinker
>> + * @bo: Buffer object
>> + *
>> + * Transfers pages from purgeable to shrinkable bucket. Shrinker
>> must now
>> + * swap pages instead of discarding. Caller holds BO lock.
>> + */
>> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
>> +{
>> +	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>> +	struct ttm_tt *tt = ttm_bo->ttm;
>> +	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>> +	struct xe_ttm_tt *xe_tt;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!tt || !ttm_tt_is_populated(tt))
>> +		return;
>> +
>> +	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
>> +
>> +	if (xe_tt->purgeable) {
>> +		xe_tt->purgeable = false;
>> +		/* Transfer pages from purgeable to shrinkable count
>> */
>> +		xe_shrinker_mod_pages(xe->mem.shrinker,
>> +				      tt->num_pages,
>> +				      -(long)tt->num_pages);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_ttm_bo_purge() - Purge buffer object backing store
>>    * @ttm_bo: The TTM buffer object to purge
>> @@ -1243,6 +1303,9 @@ long xe_bo_shrink(struct ttm_operation_ctx
>> *ctx, struct ttm_buffer_object *bo,
>>   			lret = xe_bo_move_notify(xe_bo, ctx);
>>   		if (!lret)
>>   			lret = xe_bo_shrink_purge(ctx, bo, scanned);
>> +		if (lret > 0 && xe_bo_madv_is_dontneed(xe_bo))
>> +			xe_bo_set_purgeable_state(xe_bo,
>> +						
>> XE_MADV_PURGEABLE_PURGED);
>>   		goto out_unref;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
>> index 0d9f25b51eb2..46d1fff10e4f 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.h
>> +++ b/drivers/gpu/drm/xe/xe_bo.h
>> @@ -272,6 +272,8 @@ static inline bool xe_bo_madv_is_dontneed(struct
>> xe_bo *bo)
>>   }
>>   
>>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
>> xe_madv_purgeable_state new_state);
>> +void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
>> +void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
>>   
>>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index 8acc19e25aa5..ab83e94980e4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -312,12 +312,16 @@ void xe_bo_recompute_purgeable_state(struct
>> xe_bo *bo)
>>   
>>   	if (vma_state == XE_BO_VMAS_STATE_DONTNEED) {
>>   		/* All VMAs are DONTNEED - mark BO purgeable */
>> -		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED)
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_DONTNEED) {
>>   			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_DONTNEED);
>> +			xe_bo_set_purgeable_shrinker(bo);
>> +		}
>>   	} else if (vma_state == XE_BO_VMAS_STATE_WILLNEED) {
>>   		/* At least one VMA is WILLNEED - BO must not be
>> purgeable */
>> -		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED)
>> +		if (bo->madv_purgeable !=
>> XE_MADV_PURGEABLE_WILLNEED) {
>>   			xe_bo_set_purgeable_state(bo,
>> XE_MADV_PURGEABLE_WILLNEED);
>> +			xe_bo_clear_purgeable_shrinker(bo);
>> +		}
>>   	}
>>   	/* XE_BO_VMAS_STATE_NO_VMAS: Preserve existing BO state */
>>   }
> I think this can be simplified a bit using something like the below
> applied after the above patch: (untested).
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 07acce383cb1..9f0885cd3cfd 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -835,47 +835,14 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>   	return 0;
>   }
>   
> -/**
> - * xe_bo_set_purgeable_state() - Set BO purgeable state with
> validation
> - * @bo: Buffer object
> - * @new_state: New purgeable state
> - *
> - * Sets the purgeable state with lockdep assertions and validates
> state
> - * transitions. Once a BO is PURGED, it cannot transition to any other
> state.
> - * Invalid transitions are caught with xe_assert().
> - */
> -void xe_bo_set_purgeable_state(struct xe_bo *bo,
> -			       enum xe_madv_purgeable_state new_state)
> -{
> -	struct xe_device *xe = xe_bo_device(bo);
> -
> -	xe_bo_assert_held(bo);
> -
> -	/* Validate state is one of the known values */
> -	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
> -		      new_state == XE_MADV_PURGEABLE_DONTNEED ||
> -		      new_state == XE_MADV_PURGEABLE_PURGED);
> -
> -	/* Once purged, always purged - cannot transition out */
> -	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED
> &&
> -			new_state != XE_MADV_PURGEABLE_PURGED));
> -
> -	bo->madv_purgeable = new_state;
> -}
> -
> -/**
> - * xe_bo_set_purgeable_shrinker() - Mark BO purgeable and update
> shrinker
> - * @bo: Buffer object
> - *
> - * Transfers pages from shrinkable to purgeable bucket. Shrinker can
> now
> - * discard pages immediately without swapping. Caller holds BO lock.
> - */
> -void xe_bo_set_purgeable_shrinker(struct xe_bo *bo)
> +static void xe_bo_set_purgeable_shrinker(struct xe_bo *bo, enum
> xe_madv_purgeable_state new_state)
> +					
>   {
>   	struct ttm_buffer_object *ttm_bo = &bo->ttm;
>   	struct ttm_tt *tt = ttm_bo->ttm;
>   	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
>   	struct xe_ttm_tt *xe_tt;
> +	long int tt_pages;
>   
>   	xe_bo_assert_held(bo);
>   
> @@ -883,44 +850,44 @@ void xe_bo_set_purgeable_shrinker(struct xe_bo
> *bo)
>   		return;
>   
>   	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> -
> -	if (!xe_tt->purgeable) {
> +	tt_pages = tt->num_pages;
> +	
> +	if (!xe_tt->purgeable && new_state ==
> XE_MADV_PURGEABLE_DONTNEED) {
>   		xe_tt->purgeable = true;
> -		/* Transfer pages from shrinkable to purgeable count
> */
> -		xe_shrinker_mod_pages(xe->mem.shrinker,
> -				      -(long)tt->num_pages,
> -				      tt->num_pages);
> +		xe_shrinker_mod_pages(xe->mem.shrinker, -tt_pages,
> tt_pages);
> +	} else if (xe_tt->purgeable && new_state ==
> XE_MADV_PURGEABLE_WILLNEED) {
> +		xe_tt->purgeable = false;
> +		xe_shrinker_mod_pages(xe->mem.shrinker, tt_pages, -
> tt_pages);
>   	}
>   }
>   
>   /**
> - * xe_bo_clear_purgeable_shrinker() - Mark BO non-purgeable and update
> shrinker
> + * xe_bo_set_purgeable_state() - Set BO purgeable state with
> validation
>    * @bo: Buffer object
> + * @new_state: New purgeable state
>    *
> - * Transfers pages from purgeable to shrinkable bucket. Shrinker must
> now
> - * swap pages instead of discarding. Caller holds BO lock.
> + * Sets the purgeable state with lockdep assertions and validates
> state
> + * transitions. Once a BO is PURGED, it cannot transition to any other
> state.
> + * Invalid transitions are caught with xe_assert().
>    */
> -void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo)
> +void xe_bo_set_purgeable_state(struct xe_bo *bo
> +,			       enum xe_madv_purgeable_state new_state)
>   {
> -	struct ttm_buffer_object *ttm_bo = &bo->ttm;
> -	struct ttm_tt *tt = ttm_bo->ttm;
> -	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
> -	struct xe_ttm_tt *xe_tt;
> +	struct xe_device *xe = xe_bo_device(bo);
>   
>   	xe_bo_assert_held(bo);
>   
> -	if (!tt || !ttm_tt_is_populated(tt))
> -		return;
> +	/* Validate state is one of the known values */
> +	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
> +		      new_state == XE_MADV_PURGEABLE_DONTNEED ||
> +		      new_state == XE_MADV_PURGEABLE_PURGED);
>   
> -	xe_tt = container_of(tt, struct xe_ttm_tt, ttm);
> +	/* Once purged, always purged - cannot transition out */
> +	xe_assert(xe, !(bo->madv_purgeable == XE_MADV_PURGEABLE_PURGED
> &&
> +			new_state != XE_MADV_PURGEABLE_PURGED));
>   
> -	if (xe_tt->purgeable) {
> -		xe_tt->purgeable = false;
> -		/* Transfer pages from purgeable to shrinkable count
> */
> -		xe_shrinker_mod_pages(xe->mem.shrinker,
> -				      tt->num_pages,
> -				      -(long)tt->num_pages);
> -	}
> +	bo->madv_purgeable = new_state;
> +	xe_bo_set_purgeable_shrinker(bo, new_state);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 46d1fff10e4f..0d9f25b51eb2 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -272,8 +272,6 @@ static inline bool xe_bo_madv_is_dontneed(struct
> xe_bo *bo)
>   }
>   
>   void xe_bo_set_purgeable_state(struct xe_bo *bo, enum
> xe_madv_purgeable_state new_state);
> -void xe_bo_set_purgeable_shrinker(struct xe_bo *bo);
> -void xe_bo_clear_purgeable_shrinker(struct xe_bo *bo);
>   
>   static inline void xe_bo_unpin_map_no_vm(struct xe_bo *bo)
>   {
>

Thanks Thomas, that makes sense. I will combine both shrinker helpers 
into one and now call it directly from xe_bo_set_purgeable_state(). This 
also removes the dual‑call pattern from xe_bo_recompute_purgeable_state()

Thanks,
Arvind

>
>
>
>
>
>
