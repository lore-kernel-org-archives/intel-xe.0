Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AF2C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 13:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637B910E5C3;
	Tue, 23 Jul 2024 13:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKq2nMFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BB8210E5C3
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Jul 2024 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721740556; x=1753276556;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DgEhXm9T2VTFoz/wrht8dIkslT5hpJTbGmRt40mxS64=;
 b=ZKq2nMFDnYzMvJSNhgOYcjuV9SigFNp8fxdWCNEDb3cSiv4PtGkc3CAF
 JyLuEYyZXwmahtwxSbytpa6d9E+RFOG0xXkbjxY8oLCM8ysbEE4jiXunz
 j0DU5CxsFbk/s49v/5e4m5Rv0Ux8x49hoCANO4cCiUBXH1rbAoS59MH3g
 2RP4Dzn1jXg+pzqwJ7KMA9JTamjNgHZOfipn92k05ogwpv5/ZK0HsbdGc
 6GypX+9qrvPmP0oyaFa2MrgoU5HniRC+yo5OYyTZQ+xTMUKg78KG8W8N4
 Pg3ek15sSwdmd5xuIN1CkiVnMP0S6POaMqaUtTfcfrT4pvkIG3NEAjYPv g==;
X-CSE-ConnectionGUID: euPskiR1QjC9neLuDII8uQ==
X-CSE-MsgGUID: di77qn0KRou/MaP01pov5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="19548470"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19548470"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 06:15:56 -0700
X-CSE-ConnectionGUID: xJrGcHF1S7SXwrcb0uxT5A==
X-CSE-MsgGUID: y82HPYrjSsCHbiR1a3ZGQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="57074187"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 06:15:56 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 06:15:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 06:15:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 06:15:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAzHD0mpFGuBgrG/b7IKsYJ/sPFF2eU/u7WCElN8neERdceRDZimDbJN2ENo23kQotqdgs1ddBFnk4E6tznkjG8YvR9Ruz+NntfT55ePpPaXHhQPglRnBRB7IINQ5253hME0sxOIXM9mSUvfnMi6rflvoYcNw8Lf2cBFDGDIWTAPgYMgKLFOpJWzft5WcAu5IhvxTTkZktR+sq0bwvZXZ0rVdJiY9rragVbwh7O81oGU9OjJfxfQvWAbhAyMu7xtW9USeFtTJy3TL13iVfPJXgFPhCJfpuVUVyA1/3AIqJcW4kKciZrqkq3dGO0veJzuVL/G5ZkD27J/MUL4X5dlWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9ugLmbKr4rpYckeOCdUdyfbMISnn9ZfnLPKhEYgkyg=;
 b=uYBBxpyUncjhjDIuYZ8g/fGGzGWn0FavtxwacQSY31+FEHYr6U+7IOvQOvk0DRnlTk9o77V/oev8z4kwXccv476Ft5/QwVb+ckxFRnzVHMWCS8+ogl4E8PjyxyEPjxELXdnkFUWER/VE4YmUsrpa9U5y0RAfDJN5c2zNb3SXUN3QLCwtA6vBr7dThhgQituVn/Bn1NMBCbaKwd2RjEPmqDiO9CDN+7OVTQyiXgA+oMhOq+tGJi089Zr6w8FBALB2N449lkKCO5Yz1wPAeCLpMFjUJZR0jicXbnbls8lKRuJoV/9Sft/airJgethkNl03R856+wchx4U5W5ZBMpRuKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB8526.namprd11.prod.outlook.com (2603:10b6:510:30a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 13:15:53 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7784.015; Tue, 23 Jul 2024
 13:15:52 +0000
Message-ID: <ec4ed028-64ae-445f-bbc6-3376972c750b@intel.com>
Date: Tue, 23 Jul 2024 15:15:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Create debugfs for tlb inval stats
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240723111610.21564-1-nirmoy.das@intel.com>
 <20240723111610.21564-3-nirmoy.das@intel.com>
 <95966c2f-45d2-43f4-a744-9b14fe05ba9d@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <95966c2f-45d2-43f4-a744-9b14fe05ba9d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0028.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::8) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB8526:EE_
X-MS-Office365-Filtering-Correlation-Id: 79e6690e-8aaf-4987-2091-08dcab199411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d09pbmtodHJDOXdtaitmcTZkNHdxQ0dDa3V3M3dTV2E2SVQzc3NkK1N4enBj?=
 =?utf-8?B?Nk9NV1hkcXBPTHZJN0hyZWVCeVdNZWt1djF0K3ZkVVEwNDEzM2VtV25qOS8z?=
 =?utf-8?B?RzQybnlFWmRtdktDTFh2aGRYODJ5bXNid2hnZTlkeFBSa3JZQXNPb0s0OGg5?=
 =?utf-8?B?ZW1lNmY4QWFlK2EzeFQ2d3FkT0tKV0tMVnA1bENDcUF5dDNvVHg4VkhoYXRH?=
 =?utf-8?B?MVU3YTVRb25rZHRicW54Y3V3M0ZUT0RXZjNhaFY0YTlseTErZWVUZnUwbk5N?=
 =?utf-8?B?V2txSzBYNTJ2TENuMndiSFcrMnVkRTlEMDlDaDQ5dEpVUE44L1hmQUhZNE43?=
 =?utf-8?B?L2dnUnBzZE5DcGZCYmJESmZnNGxYRGlNTDgwZzdFVzg1MXdrWmtOYU9kT3kz?=
 =?utf-8?B?Y1liRjU3VUhPa2FUVWZrL21wN1Zsa2xHTTZSZFNabzE2WUZ2UEhBYzlYQ01M?=
 =?utf-8?B?UCsyekxLOVpzeUN6TGU5L0hJd1hzZDBpTTF1Q2htMlhpTFdWRTg2RHdTdlJv?=
 =?utf-8?B?SjU5WGZlTk0zYWxPQUFBRDN0MXJ0WFZ5djhQdmtTUUNWTWZyb2FudUovTlli?=
 =?utf-8?B?SDJWeWw1WWY4bmEza0FCNVh3elhSaGdnOVoxSllzeUEwL0I3enAzc25ncUZP?=
 =?utf-8?B?ZTVLOENRaGhVaDV2aTI0dlVwdE9maXpOOVRjM2NvVkFuVENTVTIra3dzd0Q5?=
 =?utf-8?B?T0xKWnBsazg2cjd3blBiOWhtL2l1MWJOQWZpZE9TZldCeG5YN2tlYW9WMkFE?=
 =?utf-8?B?aW9vVnNDZytwVTdIay95a1cvTWhuZ3NxNWQ2bW9pSW90Q3k1U0dmZVN4cXlx?=
 =?utf-8?B?YnRnSDZKdkRCdjBuUEptZi9RREZ5aXc4TERFUTBkSHlqUmVjRUFMWitGRmpx?=
 =?utf-8?B?U0FIeGYyTmVsT2NLazExSlc2QzhDTU52bHdRNkl3bC9IKysyWG1LSUxNN0g3?=
 =?utf-8?B?Rlkvc1FkZ3ErTlNacEdIdDJmc2Rha0xsUzhXSUlLYkkyRkFyd21IejNBS0s1?=
 =?utf-8?B?S041eTl5d0w5WllBRm9ib3VHV0h4RVZLYWtyYU1lTlZiZUYwMGxCdmRYNUFt?=
 =?utf-8?B?d1c1LzhJMVh6MlVibzQ3QTI3SWNCLzA0Qk0yd215WkdWMGd3SFFXd0gvZERx?=
 =?utf-8?B?WTkxWGlpQWxnV3gvTWVDbVpoNjJYVDZ4dVZRbTlhU3JyeXF3MXd3Mjd2Ulha?=
 =?utf-8?B?Q1F4T3J0Q21IVDZHWGJWMjZHQUsvMGtucm1RbXd6NmpqUm11MUpQT0ZGNVI3?=
 =?utf-8?B?UnhmY0RxOXdvdnd4SWhTTmI0djB1VlRrN0lKT0JySEF0QWZRSFFBSVdOdjZL?=
 =?utf-8?B?Y3lkRFZNWEQ2Qzk4c3ZqVjh0dVpHQXExRCs4bXdUVDRGYVlPeGVzZHpLeVJN?=
 =?utf-8?B?WmU2RkhadnIzSGtRK1lneGljY2tGMjcxZUtOSVViZURtaXh5UUlXeUlvVVRE?=
 =?utf-8?B?dkRKZDY0WDFQN0FuWk83WWFmR05LdGtOak9HUG83dDNDU1k4QmN4S3dORm9Y?=
 =?utf-8?B?Rm5JSGhJMWNUMitpblVZb3p5NDBrS0F5SmF2cmRIenh6TlU5SVk2Zlg1YUlF?=
 =?utf-8?B?MkZDSFMya3IwTmRraGdCQlgvcW50bXZ0TE12R1ptSXBNSXlQUG0yZGNtbm1Q?=
 =?utf-8?B?RU1jczlGTUhKT3R6TVcxS1Exbks2Y09PNkxJRzVyOEJvQTlkVHRxdkR1enpJ?=
 =?utf-8?B?em43bzdoUVdnZzVUdzZ4R2JlWXR1MExSS1ZnZjRpU2JhcmlyK2c0Z09wdWhp?=
 =?utf-8?B?NVp5cHZhbkM1amd2N3A4S3lMT0ZuV3JMMHhXRkVBcHp1T1lMVzgyZHBzdmRl?=
 =?utf-8?B?RVNmajRVM1pHRXJKSDUzQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L25mTHlGK2R2dmdHL3lZUVpWSk5BeFp1eHYzalRQZm96TzYvV1dDM2tFSTNM?=
 =?utf-8?B?bm1YdXdzVlVaS3RLMHpDRWozQzU2VmNob0NOdDNqZzBhNk1ORW1ZL2Y3U0oz?=
 =?utf-8?B?SFVVQWtYUTIyTHkwa1Vpb1p4WlpWRkpBQzNBYXJ3SnozdlNxc0I2SjNhSjFo?=
 =?utf-8?B?NW9tWTVhOERpUmR3NDlYeEZzQlJqR2RzVWc4VitiN2VjK3lIMU5SSkFONjVM?=
 =?utf-8?B?NTc1T3VLakt2eGZQV2dwZ1lFcXVITG0zVUpzbGt4ZUN2TUFTanJScGJNUVVm?=
 =?utf-8?B?VUdJM1VrQ1dsamNNYkhRemZRc2k1M1FEcjQ4QWtUcTgzZW9IRU1XSHlTNVQy?=
 =?utf-8?B?Um9RQUdoODg1U1Q5Y2xYODJEZ2kyWW5QcForeVlsYzdYL0N4d2YwZnRsTmFR?=
 =?utf-8?B?aUgrNjlvMUNkR2xyRnE5eENSWGFxQ0xkT2dXajhXRE8wMFZLWXpOeURPQ21J?=
 =?utf-8?B?WCtrVXZtY1ZpbUw1YndSSGlyU3FLN1pVMVBGWVQxMVFZKzhmS05hbkw5dEx4?=
 =?utf-8?B?dHl2dU9yUkJmc0VqSEcrVGdHTjZCYW1uQzB6VTgyK1A2VWVDVnNldWdRVzBJ?=
 =?utf-8?B?cXFJQnR0OTRhT0FHWGVrdWFSS05sMU1sNHlHNkhFU3JFMjMxOEFYSjBhLzk1?=
 =?utf-8?B?MHJRQnhzQ3dXQzhLb0FYUTNJdWwzOXJxMldzR1FPVmJhdFMyU3RPWjZDRUl5?=
 =?utf-8?B?SlpHanZuVXNQcXROaHBtOTRwQ2RnUkRBUGJjNXY2cE5uWm44WDNUUk0wL1BY?=
 =?utf-8?B?VW1iRXY3TitjaTZpVmEzK1BTTzdQS0xncm81VnN4eEs0eGVaWDRCbmprVVcy?=
 =?utf-8?B?ZXZtZThxSkJjZ3ZJRGJvdTJ2dVBHYmZYYVYvVzFtSDRTTU5jYlJPbzNLWXM3?=
 =?utf-8?B?SnNQSDNlUDFncGhraGJvU2pIY3JIdkRFMmVMUmNuc0NQZDVlcWc5QlpBN2d4?=
 =?utf-8?B?ckJzd2NXcDU4TDVpUUF5QzN2OHNYZ1I2YThoUjRrSlVzNU1FL0Vua0JJNFFx?=
 =?utf-8?B?Z3VuZ3FuVDVtUG5HeG1xYlgzbC8vZ3V2dWJuQ052T0NXZk1ONExOem9CNGhT?=
 =?utf-8?B?ZzVocnNZS1RyYW43cmxKYk1ZaFkwNTIwNXU3VVM5cWE0bVI5akcyYi9BVklR?=
 =?utf-8?B?dFNTNVF1VmEyTnFIUkxjQjdlcDNzSUdudjdWVWQvS1dvSHI0ay9qQkVwS0lo?=
 =?utf-8?B?QUhZYlNnaFhzMGk2S053Tk1yeSszTEtVWW5VS2Zlck9pYXYyZ3g3NVk2ZlEx?=
 =?utf-8?B?azQwNUc0N0QwRTgrazBTZVhPNjBMQkJybVU2TFRnTHNOa1JtclpQeTNtTk5J?=
 =?utf-8?B?azZaQ2trZC9pTEVkdU5TeVVYU3M2Ni9aMTlHbmtFNFVCQWR5emM3VXlRdkMy?=
 =?utf-8?B?UmZCdVFaS0pQZE9DU3RtMnRnNjZqME80cmppZEF4V25pb0RENGhBUVhJSy9Z?=
 =?utf-8?B?bHBaR3VTdDg3R3plWnBCSzhDS3hJbTNXdjhpQkV2ZjdHRDlUTlBxdG04SUhv?=
 =?utf-8?B?Y04yTHNSNm43V2dHL1UrS292c0dJMnJwb05qSG1zQXp5L3ExbGREdVNWZFNs?=
 =?utf-8?B?bVJSdFArd0Q3RFJPUFdoUE5nc0Vzdk04RE1Na2pTYW1IYy9ETTRvbzlEOVQx?=
 =?utf-8?B?bTZ3YkxIcUpVazQ2enpLWUttYTEyLys5M2NRQzBoODVCbk9PSWN3NzlBUGYx?=
 =?utf-8?B?d05TMmRzbWp2MWdKOVNWYzFXbjVaalBTZDZzd2lybEpvQVg3RjY3a2xLZzlG?=
 =?utf-8?B?ZFBZYVZxeU42K1B5U2hJWXJYUGZyUzlnaWFQcHd6REJpckU4NXZHek12VjZI?=
 =?utf-8?B?NVJ5b1V3T1Jtc21mRjlaeHNNUHdhYndsQ1NGNThjUG90ejEwOFVyTjIySmw3?=
 =?utf-8?B?S3gxY0pGd3d0azV5OXBscjk1MHI0cFFocXZTenVUNXRvdzJ3MzE5SE9aWjdR?=
 =?utf-8?B?MHdhdllvVVlvNkIrUC9QOGxnaWw0SXYzdTM5ZmwyNS9IdmR3eXllbGQ1ZzBw?=
 =?utf-8?B?NkxQdGFMMURlSUZXQTkxT2VMQTcvem5nU252bHpzQU1wZ3lFOVBPZndCb01Y?=
 =?utf-8?B?d3hUWXZ4NTlrUzBvRGRnL21pWER5S002anVEbHFKUHdwbUMrTk5mUndWVFph?=
 =?utf-8?Q?7lUG6ll+oyaaDGjzhs+LN5zVG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79e6690e-8aaf-4987-2091-08dcab199411
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 13:15:52.8754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcaniS0DDZfsEoHIZq3qHwk8OevjSOwMaDZq9xdnIW1Cj2nNz1iFjjYTiZb5W1eVJahDeoDM4qqQVSfeAGl/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8526
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


On 7/23/2024 2:14 PM, Michal Wajdeczko wrote:
>
> On 23.07.2024 13:16, Nirmoy Das wrote:
>> Create debugfs file for each GT to dump tlb sent/receive
>> stats.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c          | 9 +++++++++
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 7 +++++++
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h | 2 ++
>>   3 files changed, 18 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..959d979927dd 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -17,6 +17,7 @@
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>> +#include "xe_gt_tlb_invalidation.h"
>>   #include "xe_gt_topology.h"
>>   #include "xe_hw_engine.h"
>>   #include "xe_lrc.h"
>> @@ -269,6 +270,13 @@ static int vecs_default_lrc(struct xe_gt *gt, struct drm_printer *p)
>>   	return 0;
>>   }
>>   
>> +static int tlb_stats(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +	xe_gt_tlb_dump(gt, p);
>> +
>> +	return 0;
>> +}
>> +
>>   static const struct drm_info_list debugfs_list[] = {
>>   	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
>>   	{"force_reset", .show = xe_gt_debugfs_simple_show, .data = force_reset},
>> @@ -286,6 +294,7 @@ static const struct drm_info_list debugfs_list[] = {
>>   	{"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = bcs_default_lrc},
>>   	{"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = vcs_default_lrc},
>>   	{"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data = vecs_default_lrc},
>> +	{"tlb_stats", .show = xe_gt_debugfs_simple_show, .data = tlb_stats},
>>   };
>>   
>>   void xe_gt_debugfs_register(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index f84717c1aafa..62a6f42b6c60 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -540,3 +540,10 @@ void xe_gt_tlb_invalidation_fence_fini(struct xe_gt_tlb_invalidation_fence *fenc
>>   {
>>   	xe_pm_runtime_put(gt_to_xe(fence->gt));
>>   }
>> +
>> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p)
> if you make this function as returning "int" then you will be able to
> plug it directly into debugfs_list without the tlb_stats() wrapper


Sounds goodI will modify it.

>
>> +{
>> +	drm_printf(p, "GT%d, TLB Requests sent: %llu, received: %llu\n",
>> +		   gt->info.id, atomic64_read(&gt->tlb_invalidation.sent_count),
>> +		   atomic64_read(&gt->tlb_invalidation.received_count));
> printing the GT identifier (GT%d) is redundant as path to this debugfs
> entry already contains GT identifier:
>
> $ sudo cat  /sys/kernel/debug/dri/0/gt1/tlb_stats
>                                      ^^^
>
> GT1, TLB Requests sent: 212, received: 212
> ^^^

Agreed but I was thinking when we do "cat 
/sys/kernel/debug/dri/0/gt*/tlb_stats" then keeping GT ID info  is useful.


> btw, maybe 'last seqno' and 'default timeout' will be worth to be
> included in debugfs ?


I will add those too, should be useful.


Thanks,

Nirmoy

>
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>> index a84065fa324c..f420029ec02d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h
>> @@ -10,6 +10,7 @@
>>   
>>   #include "xe_gt_tlb_invalidation_types.h"
>>   
>> +struct drm_printer;
>>   struct xe_gt;
>>   struct xe_guc;
>>   struct xe_vma;
>> @@ -36,4 +37,5 @@ xe_gt_tlb_invalidation_fence_wait(struct xe_gt_tlb_invalidation_fence *fence)
>>   	dma_fence_wait(&fence->base, false);
>>   }
>>   
>> +void xe_gt_tlb_dump(struct xe_gt *gt, struct drm_printer *p);
> missing empty separation line
>
>>   #endif	/* _XE_GT_TLB_INVALIDATION_ */
