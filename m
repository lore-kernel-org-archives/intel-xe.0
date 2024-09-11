Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CBDEE57D0
	for <intel-xe@archiver.kernel.org>; Wed, 11 Sep 2024 20:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BAC10E97E;
	Wed, 11 Sep 2024 20:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MTT/WUs7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8D10E97E
 for <Intel-Xe@lists.freedesktop.org>; Wed, 11 Sep 2024 20:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726084801; x=1757620801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KPOu4xb0Tkco5+iaRkKo3xTgssV35GwsRexJ4+817cU=;
 b=MTT/WUs7LqECNDSuX5ui8ZRurNAjuMhroFKNkL55ARuZPxP0qR89gpZy
 T2sMMyHc2APORK6InbkHWrPDVHOywuP+AbF1d7D5SSYDK8fGPTnaMiSCD
 5/gkWLYZCFz4DAx0hiz0LVmEzoHzjLibd+JIeGRME4m5Cq4wdJSRrPDYp
 znzQMi94poOMzLVgOBVQlBekZIkCEbbzsBw+uaEG/7+RkZ+EYUU7/FTUx
 w3viEGiAwLUhVz3DWqe8m1OH2w8I6Csl7THWAy/mqDo/5IDGXUungyZaI
 1QbSbzQcgRzm6kJEA/uPMafgrVKUcZCwJTKO/6L7RhrX4Lf1KQDH3yYIk w==;
X-CSE-ConnectionGUID: trh995ZpQHKS6btox7zC2A==
X-CSE-MsgGUID: rdYATM7PRVKgWdQe06xJZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25066347"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25066347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 13:00:00 -0700
X-CSE-ConnectionGUID: XSf/bjRoS3aP9zurNYTpkg==
X-CSE-MsgGUID: v4Cp15lNTSu8JpeHRzwaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67202175"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 13:00:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 13:00:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 13:00:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 13:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEmKXuYxPL9iIHVwr4Pk6169SXc6RWRqNfNw0d8shDMvfPdYSmimqPUz6rqk/XDgrtzK2qJ8yhHIIbDGLXGEoKeiFG5UB37uDaTFaBP5dHW2k/2/3gErT/ZHPt1VIoVwOJFmbEM0Qjoh0WpWE5j7GY8ohKJn2yvo/gaq4I3Mlrq387G2V8EzDD4d8Qwwjtp5RkbZxGA2QStVAFEjYuse4MikJqel0O91NbY2e8I/yM2F35+QQWZNHb8HG2Iq28uzJ+o6+fWNgbnAsAdAkH6sPYX6iQEDYv1gNS6fM84ZgdWFmswzubxSAM6O/KP4ZQDu8n6wf9HCtbDiPdrlbkmC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEGqlzkJ9BzG/mVJKP/m4LQQUhTRYaCxNL1mMsPV5dg=;
 b=xPE+fgaJ0hGO/vpXB+M9KVYd5brJamTvcqsepQRed3RphiNmS9pP20YlssqG+B35Xv+LDBtPMYkerrqeG/1GdPiGAfwFAHm2h9BEqZByQ9M6P5P2MHsWk+RufJ5A8Naze0mJ7nXaTyL/dK8afNaiLv6gSjbvJ/1/KZL/NBWwM92wIGmxoWrEHdugtiILTN883bfsgzpw3+5om2f/yivmWsBxrOjaFcUk5uVZ6X3e02mVkAr/tMGskPSQ6eCAtx2aY9URXUl/VnuuC+qgjyLBWwMLiLm47piQPIJGXixxRavUr8n8zLhBLlALMdiqWZKnVN62l9CSCME6yQQwScjc3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 19:59:57 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 19:59:57 +0000
Message-ID: <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com>
Date: Wed, 11 Sep 2024 12:59:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Intel-Xe@lists.freedesktop.org" <Intel-Xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
References: <20240905205106.1063091-1-John.C.Harrison@Intel.com>
 <20240905205106.1063091-4-John.C.Harrison@Intel.com>
 <sm6iyfzcaq6vbgytgueqqbjjzjniarulya6xzsuo7gyollceyj@iovrnktwvloq>
 <d80bec85-adfe-4410-ae04-e6bb0f41c764@intel.com>
 <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
 <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
 <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a484150-ab50-4054-407f-08dcd29c4fa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5DcWsreTFpVE5rdVA1cnhmVURkTklsSk1LTE1jV2NnUGFxd3J2TE00dnFw?=
 =?utf-8?B?VVEwYzZOTTZzUnp0TWdKT0pQT2pnOUtxR3dlZml5MzNLTHhZOGNPTU83ZUZi?=
 =?utf-8?B?NFZzK2lFNmxkS3ltV3RXTDNVQ0lOYlZ5Wk0vNnI5a3BrVFZ2WlZmQ3ZyS2Mz?=
 =?utf-8?B?S3owN21Ub0lZU0lSOWdYUGxwNVpNbkJUUFNETTUraURWa1ExcTJ0aVZEU3U3?=
 =?utf-8?B?WUE3YlpZUTQ4d0U1cHJNNU9mS2VNZTZJejBOWHQ3TVl2bWFjMFkzZFlQZVdQ?=
 =?utf-8?B?dWdKbm9JMnY5ZnhtM1ZoKzNWVzQwTFdtaFY2YmpQeCtIamsyRFhRMmhpbjd0?=
 =?utf-8?B?c28venBTVjFEM1BBbDBMNjV0dmpiNFpSUWRyWXN3ZmsrVGlCemh6NGNLNzJS?=
 =?utf-8?B?c1JSZVVmNXRuSmVRRHk5d1paK05xMEhMUTRESThJSllTdDFQQURPSzQyakxp?=
 =?utf-8?B?SGdPY3UrZngvS0FGZnFjSWZpSU5NbWZkaXpqSDRjYTVIUnVRTlNYOFhKNmxE?=
 =?utf-8?B?eFNQRnROUVVpR1dCTHlTRVh6dkZUeVR2TVRRMEZEZ01rVzZtU0QvbU4xY2tC?=
 =?utf-8?B?YVpQTXFxMWNQK3VNZ0paT0FPbXZ4MUQzMEZNT08yaUNzS3hmY2U2aFpidk9n?=
 =?utf-8?B?MTNMVGlYTkIxYmlrcUNGQzJtQWFTekdyeStCRnBscnBIck9nQWhrYWk5SVBv?=
 =?utf-8?B?Y01zWHV2Ny9oSE0rWXlNTUZRMktPOHlJNEJHbUFRUEpzM2VsUHB2YVhNTUZY?=
 =?utf-8?B?YlgwU0FvZFlkcHVLcC92K3AwWk1DRFE4RnlnTU9TaGowd0d4QW5aMkxLck5h?=
 =?utf-8?B?VHJ6QTV2alJ2cDhpYS9SdHVIbms4dlg3UjNKU3lWM1NQVWF0YjJ5MHIzbzVu?=
 =?utf-8?B?cEZadnF5WGdkRDlhZjlMc25pSEx6MU90enZxSGJDSWNIZ09QUXZCbm1vMW9z?=
 =?utf-8?B?a3BCdjh4M2k3blJoWkVKc25ERFYwdE1iek9VbGZLczFEZTQ1QlR1UlZkcnhn?=
 =?utf-8?B?K0hoZ0MwdDUxYnc1eVAreC9DZ0piUWVLeWNKUThheXhUQUU1dnpqWlVoTUhP?=
 =?utf-8?B?RFpDdFFEM0Jub2FTZE13cnRKc09jaDJ3djlkYm0xVFRBWEZPM29EbThuZmlN?=
 =?utf-8?B?Tms4aHFobUdaQXdVSHpZZTdpLzhJR3QxT01XSUU1ZCtydkFBTDNkYmRXcVVw?=
 =?utf-8?B?bStJT0Y1cnNOdDZjbkFoUlFIRHo0VEFwaEFmaHB0b09yQ25wOE8vaVVmTVhL?=
 =?utf-8?B?S0EzNVY3MVVESVNIVmtGS3JIaWhOUE1HcytLYXZIKzdrdEZ1a2VNSXBBUGRl?=
 =?utf-8?B?alpPcDJvMWZmV3JxUkJQSUkvZjNzL0tJUFU0OTRPWUZCS2pWVHlpcS9uMnVD?=
 =?utf-8?B?US9YV0dtQm5FQVo0UXVCR3pmREkzYktZMXFmeEZzWWY4bmpkT1lxRkJlbkty?=
 =?utf-8?B?TGdsWUUyV0Q4VmRLNmdnL1ZSTUFpS3NLcXpubStEUTBsL2ZraGdMWjZrQ2tz?=
 =?utf-8?B?WmtsM2trVGRubHNDN2JLSUhNSXNxRnpuZzI5NlRnSWRLcHlkUjhWM0JNTEd4?=
 =?utf-8?B?SlpzM2EzZGRlMWswTEFobkEwL2VWL2pOSU9iREpxN0htU1BkbDJtcFhXanN5?=
 =?utf-8?B?OTc2SjhKSXFoNmt0Zm5oRldaTEpjYjEvQXNYNEt0QktuRU1rL1dTUmMyTzhE?=
 =?utf-8?B?ckNsMFg1VGRia21tMW5GUzlOcm1kaUcyZ3VvcmE0NWU0R24wbm1SWlo5UFVz?=
 =?utf-8?B?bFF4V20wNXJvb2duaVJhOVh6WHg5dXNIMUZqdU44TUE2Rzc4Qjc1OVpRaTJv?=
 =?utf-8?B?aVUvUDlrVzBXWldXTkNSUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHFRazFJQlJiV2JleFdUMEZXTFNMVFdqeGNMeFc4T29OYnFHNzlzckdiV2Vs?=
 =?utf-8?B?d3I5S0M4RG10YkRuRjE0OE54Q1YzRUNHeFdmMHphVkJxYXNkTEREa3BlaXdV?=
 =?utf-8?B?NU92MDE1WjNPc1ZiZWtHMXgwVkdCY0VxRFlad0NjQmdVMHdTSExTRk04YnV4?=
 =?utf-8?B?Z1VTc3E0K0wrdmJHdlc0WkdmNkxMY2xIbU5lVWZ3UDFQZklXMWlQNktPbVh4?=
 =?utf-8?B?R2UxbVh6aEgwdkxzbVlTRUFXb24vVTlhZFJaejErU0lQNHo4ZW5RUmNFSS9u?=
 =?utf-8?B?cDdIckVzRGljbXpTNWhhNWZlbDIvTENnd3JoYXZjcnd5MjRSUnpqVGlINXFm?=
 =?utf-8?B?YkgrcHBRaGt0VURkbmdNbEtjeldzd0YzdDBWNDM0V1NBNExMMHZMN21QNkYx?=
 =?utf-8?B?Yzk5M3dPRkJRT1VDcGFtcFF1SHRXdmR6anpKdHByRU1ZS21pUGE1SUlBb3JU?=
 =?utf-8?B?Nm5IeUhwMWV3dTRsN0wrb3ZML0lVV1UvNG5zT2NZandldzNuaXhDM1QxWTkr?=
 =?utf-8?B?WXQ1UDBuUnBsV1ZMMjh6TlZ1dEgxQlpObE9MS3ZtbDFnOEVsMmxvYWo4UTN3?=
 =?utf-8?B?ckVab0NpQW5CMks2ZERQZnZqejRrUEpKcS9nTmMwcTF2TjRBZ1hLdFRST0JQ?=
 =?utf-8?B?aU9kK3MrL3FUL2w5OUJFdk1HUlUvVWk3ajE1VzU4ZHZ3aDJLMk1GR3VIWkI3?=
 =?utf-8?B?dE8yWHFCNnRoTTBIeHV1RmN1Rjhic3kwUkpXbTJVWEVubkYrMlQ0UENuUUti?=
 =?utf-8?B?RDdlN3FPZ1lZUDNvcktuMUl1MzZiOXhTa2QvTll0Z3lYSThYV0pjeGpRSnVn?=
 =?utf-8?B?WDBRY043Z05oUU1PcGFhNW1oVDYrSmpWRmdHaWlCcGFYbTlvTXUvVzNKakxL?=
 =?utf-8?B?dkZEUzg2RzFjdXJsSmlJdGpqNlVZVkJZWDQ3NldHWjNPZkkwMHhPUFVOTGpm?=
 =?utf-8?B?RURMZGZtbkwyeHBkQmZ2RHlLZnE0aDAyK1ArUlBiTDlRYm1uOUpmNHhtMUZL?=
 =?utf-8?B?NlZNaWhabG5pMEs1dGVKNUdzbUhSZnhoeW5VTHQ0aDJOZ1h5Sks2czRVamRN?=
 =?utf-8?B?MklkWlRqSDlZODFOUWVNZTVJczBaLy9ac2ROZTdSTlA0bnVZTk1xR3pWQnpH?=
 =?utf-8?B?dnhaY0dWU3h0TFlxRHJTZXROcVArTXhwMjJRR0EwcUpqYThjSTJzQklYRVNI?=
 =?utf-8?B?SU5LK1VKRlE5ODRrSHJxalo4UGM5NDU3Qzlqcy9UaDc1d01OV29pY004VHJH?=
 =?utf-8?B?RWk5Z0hoeXUvV2ZSSEdQeFZ1TEN2dndLZlQyS2p0SVBoWEFWdGR3djRqdy9O?=
 =?utf-8?B?UUZmWU50RG0xdVRWQlNvZlE4MW1qczVpTjRLeFQwWnZmVE1JemRQUHZuTFcx?=
 =?utf-8?B?YTJxS0p5cUtiT3IrWGhUdEcxMm16Z2JIMTZVV1BEUTV4SW9lSFB5S0dwcVla?=
 =?utf-8?B?azNoL1RCYWVGVElSUml2RW9kamh5RkI1U25EdnlmdHVtSVF3NlhoZm1ZTGpW?=
 =?utf-8?B?dGdodzQwdytsd2ZVRm9wZmdvRk8rV1A0Vm9IdWZzM2pvS0FqdG1ra2VJd243?=
 =?utf-8?B?dktJdndLdjE0TFF6WXBoa0I0aUV6ajlzaU5MZTBlUzVFSy9EV04waGV3ZnpJ?=
 =?utf-8?B?TjNFc3BxQndGTTRSTk5xZ1NheVk2Ukg5b2toeGl4dE9uaTM4eUl6N1l2NzNN?=
 =?utf-8?B?cjNjWmtiVnRoZVhhaE1yQVZubmJxRHdCMUViTUpxQm03eGd4MmdkT0EwZEYr?=
 =?utf-8?B?bnN4N1E2NEJHS21JUlZRYU1EUUVLU1VRQWlXdTJuWmtuNk9rQWxZcmdZYlFN?=
 =?utf-8?B?aE8wNkJPVDFheTlKTDVBMkZRTDVnTkdRRmRkL0lFcENPeG1mUWVQSjFtMEdu?=
 =?utf-8?B?NC9rTWlxTzVnWmdObkJ3TE1CS1F0L0JGcStCdUJ2eGFJeXBMMlF5MXh6NzFG?=
 =?utf-8?B?Nk96U2dMc1grNlJnUi9HMmllNXJUdXdhMWtiODBxYXg5YjArSnd5U1NkdStC?=
 =?utf-8?B?VzRoVmFtZnVybUV2bkF1VFlrZWVtWDNwRXBWZStjWHdpa09GWTh2SnM5R1Rk?=
 =?utf-8?B?d2s2ejNYaHh5WHk0MlpCK09QRi8wWkh6R1RyN1hWcG5MTXFQMDJJYlNrUjBN?=
 =?utf-8?B?OFNvNG01cEpYU0dzbG9HQzhDV3VlOWt0U2Vsd3lMK0l5MlR3dGVHODl3RFRq?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a484150-ab50-4054-407f-08dcd29c4fa7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 19:59:57.7391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ffjJQo8rcyXXDGharYPxMDXE0e2HjXkCaCR+O726aUyJTY5X65DjsEloo70AngNaJcQ0yD9M5K3RPepSlBfIFmWOHtSfAiYDTbhupXFLjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
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

On 9/11/2024 12:54, Souza, Jose wrote:
> On Wed, 2024-09-11 at 12:35 -0700, John Harrison wrote:
>> On 9/11/2024 12:30, Souza, Jose wrote:
>>> On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
>>>> On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>>>>> On 9/10/2024 12:43, Lucas De Marchi wrote:
>>>>>> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>>>>> On 9/6/2024 19:06, John Harrison wrote:
>>>>>>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT,
>>>>>>>>>>> John.C.Harrison@Intel.com wrote:
>>>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>>>
>>>>>>>>>>>> There is a need to include the GuC log and other large
>>>>>>>>>>>> binary objects
>>>>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping
>>>>>>>>>>>> to a printer
>>>>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>>>>>>> As per earlier comments, there is a WiFi driver or some such
>>>>>>>>>> that does exactly that. But all they are dumping is a binary
>>>>>>>>>> blob.
>>>>>>>>> In your v5 I see you mentioned
>>>>>>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a
>>>>>>>>> precedence for
>>>>>>>>> including it as is from the device rather converting it to ASCII85 or
>>>>>>>>> something else. It seems odd to do that type of conversion in kernel
>>>>>>>>> space when it could be perfectly done in userspace.
>>>>>>>> It really can't. An end user could maybe be expected to zip or
>>>>>>>> tar a coredump file before attaching it to a bug report but they
>>>>>>>> are certainly not going to try to ASCII85 encode random bits of
>>>>>>>> it. Whereas, putting that in the kernel means it is just there.
>>>>>>>> It is done. And it is pretty trivial - just call a helper
>>>>>>>> function and it does everything for you. Also, I very much doubt
>>>>>>>> you can spew raw binary data via dmesg. Even if the kernel would
>>>>>>>> print it for you (which I doubt), the user tools like syslogd
>>>>>>>> and dmesg itself are going to filter it to make it ASCII safe.
>>>>>>>>
>>>>>>>> The i915 error dumps have been ASCII85 encoded using the
>>>>>>>> kernel's ASCII85 encoding helper function since forever. This
>>>>>>>> patch is just a wrapper around the kernel's existing
>>>>>>>> implementation in order to make it more compatible with printing
>>>>>>>> to dmesg. This is not creating a new precedent. It already
>>>>>>>> exists.
>>>>>>>>
>>>>>>>>> $ git grep ascii85.h
>>>>>>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>>>>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>>>>> And the list of drivers which dump raw binary data in a coredump
>>>>>>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>>>>>>
>>>>>>>>
>>>>>>>>>> We want the devcoredump file to still be human readable.
>>>>>>>>>> That won't be the case if you stuff binary data in the
>>>>>>>>>> middle of it. Most obvious problem - the zeros in the data
>>>>>>>>>> will terminate your text file at that point. Potentially
>>>>>>>>>> bigger problem for end users - random fake ANSI codes will
>>>>>>>>>> destroy your terminal window if you try to cat the file to
>>>>>>>>>> read it.
>>>>>>>>> Users don't get a coredump and cat it to the terminal.
>>>>>>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Lucas De Marchi
>>>>>>>> They might. Either intentionally or accidentally. I've certainly
>>>>>>>> done it myself. And people will certainly want to look at it in
>>>>>>>> any random choice of text editor, pager, etc. 'cos you know, it
>>>>>>>> is meant to be read by humans. If it is full of binary data then
>>>>>>>> that becomes even more difficult than simply being full of ASCII
>>>>>>>> gibberish. No matter what you are doing, the ASCII version is
>>>>>>>> safer and easier to look at the rest of the file around it.
>>>>>>>>
>>>>>>>> I don't understand why you are so desperate to have raw binary
>>>>>>>> data in the middle of a text file. The disadvantages are
>>>>>>>> multiple but the only advantage is a slightly smaller file. And
>>>>>>>> the true route to smaller files is to add compression like we
>>>>>>>> have in i915.
>>>>>>>>
>>>>>>>> John.
>>>>>>>>
>>>>>>> PS: Also meant to add that one of the important uses cases for
>>>>>>> dumping logs to dmesg is for the really hard to repro bugs that
>>>>>>> show up in CI extremely rarely. We get the driver to dump an error
>>>>>>> capture to dmesg and pull that out from the CI logs. Even if you
>>>>>>> could get binary data through dmesg, pretty sure the CI tools
>>>>>>> would also not be happy with it. Anything non-printable will get
>>>>>>> munged for sure when turning it into a web page.
>>>>>> I think that's the main source of confusion on what we are discussing.
>>>>>> I was not talking about dmesg at all. I'm only complaining about feeding
>>>>>> ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>>>>> good reason to do so. I'd rather copy the binary data to the
>>>>>> devcoredump.
>>>>> But the intent is to dump a devcoredump to dmesg. It makes much sense
>>>> It seems like an awful idea to dump hundreds of MB to dmesg.  When we
>>>> talked about printing to dmesg it was about **GuC log** and on very
>>>> initial states of driver probe where we didn't actually have a good
>>>> interface for that. And the log wouldn't be so big. If we can already
>>>> capture the devcoredump, what would be the reason to dump to dmesg
>>>> (other than the non-valid "our CI captures dmesg, and doesn't
>>>> capture devcoredump", which should be fixed).
>>>>
>>>> If any sysadmin have their serial console flooded by such garbage there
>>>> are 2 reactions: 1) someone got in control of my machine; 2) something
>>>> went really bad with this machine. It's not "fear not, wait for it to
>>>> complete, it's just normal debug data I will attach to an issue in
>>>> gitlab".  And I'm mentioning a serial console here due to that
>>>> cond_resched() added, which is only needed because you are trying to do
>>>> in kernel space what should be in userspace.
>>>>
>>>> Oh well... looking at this the main reason to use ascii85 I can see is
>>>> because we already have parts of *our* devcoredump using it, and
>>>> userspace relying on that. That's new to me. Let's stop bringing dmesg
>>>> into this discussion.
>>>>
>>>>> to have a single implementation that can be used for multiple
>>>>> purposes. Otherwise you are duplicating a lot of code unnecessarily.
>>>>>
>>>>> And I still think it is a *very* bad idea to be including binary data
>>>>> in a text file. The devcoredump is supposed to be human readable. It
>>>> no, it's not. devcoredump doesn't dictate the format, it's up to the
>>>> drivers to do that. See their documentation.
>>>>
>>>>> is supposed to be obtained by end users and passed around. Having
>>>>> binary data in there just makes everything more complex and error
>>>>> prone. We want this to be as simple, easy and safe as possible.
>>>>>
>>>>>> For dmesg, there's a reason to encode it as you pointed out... but
>>>>>> no users shouldn't actually see it - we should be getting all of those
>>>>>> cases in CI. For the escape scenarios, yeah... better having it
>>>>>> ascii85-encoded.
>>>>>>
>>>>>> What you are adding to devcoredump also doesn't even seem to be an
>>>>>> ascii85 representation, but a multiple lines that should be concatenated
>>>>>> to form the ascii85 representation. For dmesg it makes sense. Not for
>>>>>> devcoredump.  We should also probabaly need a length field (correctly
>>>>>> accounting for the additional characters for each line) so we don't
>>>>>> have an implicit dependency on what's the next field to know how much to
>>>>>> parse.
>>>>> The decoding is pretty trivial given that line feeds are not part of
>>>>> the ASCII85 character set and so can just be dropped. Besides The
>>>>> output is already not 'pure' ASCII85 because the ASCII85 data is
>>>>> embedded within a devcoredump. There is all sorts of other text about,
>>>>> including on the start of the line. There are multiple ASCII85 blobs
>>>>> in there that need to be decoded separately. This is nothing new to my
>>>>> patch set. All of that is already there. And as per comments on the
>>>>> previous devcoredump patches from Matthew B, the object data can many
>>>>> hundreds of MBs in size. Yet no-one batted an eyelid when that was
>>>>> added. So why the sudden paranoia about adding a couple of MB of GuC
>>>>> log in the same form?
>>>> I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
>>>> HWSP and HWCTX").  Probably because I haven't seen that commit doing an
>>>> ascii85 encoding before, otherwise I'd have similar review feedback.
>>>>
>>>> Looking at this just now, so I will also have to balance the previous
>>>> users and existing userspace consuming it.
>>>>
>>>> +José, would it be ok from the userspace POV to start adding the \n?
>>>> Then we can at least have all fields in our devcoredump to follow the
>>>> same format. Are these the decoder parts on the mesa side?
>>>>
>>>> 	src/intel/tools/aubinator_error_decode.c
>>>> 	src/intel/tools/error2hangdump.c?
>>>>
>>>>    From a quick look, read_xe_data_file() already continues the previous
>>>> topic when it reads a newline, but the parsers for HWCTX and HWSP
>>>> seems to expect to to have the entire topic in a single line. But I may
>>>> be missing something.
>>> Sorry I'm not following up this thread.
>>> Add a '\n' where exactly?
>> To break very long ASCII85 streams across multiple lines. That will
>> allow the devcoredump file to output via dmesg for the situations where
>> reading from sysfs is not possible.
>>
>> This patch is adding an ASCII85 encoding helper that is more friendly to
>> output via dmesg. The patch does not currently change the existing
>> ASCII85 encodings of VMs and hw contexts. However, the intention would
>> be to update that code to use this helper eventually.
> It will break the parser and I don't think we are allowed to break it at this point.
The intent has always been to add compression as we had in i915. That 
will presumably also break the parser. Although I'm not seeing how a 
debug log parser counts as critical user space that must not ever be broken.

> What I can suggest is add another sysfs with a coredump that skips the binary dumps so it is readable by humans.
That will just lead to confusion and problems with people sending the 
wrong file. This needs to be kept as simple and error-proof as possible.

John.

>
>> John.
>>
>>>> Lucas De Marchi
>>>>
>>>>> And again, arbitrarily long lines (potentially many thousands of
>>>>> characters wide) in a text file can cause problems. Having it line
>>>>> wrapped gets rid of those potential problems and so is safer. Anything
>>>>> that reduces the risk of an error report being broken is a good thing
>>>>> IMHO. Robustness is worthwhile!
>>>>>
>>>>> John.
>>>>>
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>> John.
>>>>>>>

