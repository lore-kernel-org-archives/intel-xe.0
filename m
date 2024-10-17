Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48928D37492
	for <intel-xe@archiver.kernel.org>; Thu, 17 Oct 2024 13:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DD010E074;
	Thu, 17 Oct 2024 13:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="imnAsF42";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF54E10E074
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Oct 2024 13:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729172632; x=1760708632;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sZLYKSQ2NteczGXOEib88hqjQtuzav2+tSAT+81Z3Rk=;
 b=imnAsF42uOeyLE8zUsoNRB59fqNkppErUUCnX5CFXJ0BYA0IZlgGts2p
 uLBj3CvhoRr3f+ym4bgLW3G+kB69rPzHMHh+FXhnEbXYmLlrb/kRBPyLh
 d5DQtWY/j+sIixcM9B7jy+Vnwsf6JqyMq0S576gK0W3wMA05g8NeNJkQg
 Zm/n0ia5gDC+hjx1mHzrkbVekwayM9EZVzAP8pZRsyyd0IzfkWWtuzD32
 PKvSjS9fweUloTRTTTWeEFKzWLDmzuUlVBMlo2fIVcoCKm6BcK+2bmPrl
 +gRVd2zCfOfJdUPK49i/xbyBl4OESm+rljT/SHsKAbd5EJmZJx6un/A76 g==;
X-CSE-ConnectionGUID: wbEHd4VjSfa4VQ7XU8pR5g==
X-CSE-MsgGUID: DYBDrIZmQkCUreFkv78DhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11227"; a="46152982"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="46152982"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 06:43:51 -0700
X-CSE-ConnectionGUID: U8RHsziwSDiZVRt00vvcNA==
X-CSE-MsgGUID: 7f0V9weSR8e/yGF3OSUYwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83103073"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 06:43:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 06:43:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 06:43:50 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 06:43:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 06:43:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fJ/HpJSU9UnGxU2rWYO3+522yvLnLSPwpEEsptMMJxItm9QnJY0X3fefI70rw5kIbSl5T1ZB1VbVDBknDE5JwpKmT8r1JHitw0auCeyx1s6KWhhb30VzoiKddNMSQfUTRozw5DEx/E/RC5AtbFras/AW/Yo39lpfTSN2tqDPTZyeayNwHgdOnYJQilUZD6blTGAxgYiTdd+ufbYgN7yxgDSY3/NPFCMEXPdVeMBveQJLP7+QzfSIP9xxQ8lijbsg+v2WnSbqWPap9zcZLKu2eppqDpA4vehitlnUKjivmgsqpEJfVtV3KAxeRzo/fMlLwDOjtGcisg/iajUshj0A+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwAN2YuzjFBK4DQLJJV/oxJtdOATXjyDubwk1O1Z4hI=;
 b=PwZ6DtyBUwnwjCHEiD95rMiobN6NgwdsxqQ4ooMaC2uGisDapR/0q1B+ECBAcHxBunxnLsI50y9ot00ZaX1l/7YLb8kPHibO8OIRahdsRNXgBK+iUAYhDbH51UPOxWo5fswAZd0qjWzm+BwZOlIeVi2rXt7AgnDXLHjSofsupH1DA0qXWLz/M/VxsQBwkO7HZmj9Xj+LJflC8VRkDyPceeLonapOxV/1P8TZx/+TBvmgqkoEFpbcWwWwKTz+q87MYhOZedHskjgvHooEv9Hns0oEQ/CG2qApKlX762MJi9xaAlQdVswCeNMc0YSp1qNnlI0+erOM86nJRuCzs55n5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 13:43:48 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%4]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 13:43:48 +0000
Message-ID: <97587abc-acc6-42f6-ad78-cbbd2607c48a@intel.com>
Date: Thu, 17 Oct 2024 19:13:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc/ct: Flush g2h worker in case of g2h
 response timeout
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <john.c.harrison@intel.com>,
 <rodrigo.vivi@intel.com>, <matthew.brost@intel.com>, <matthew.auld@intel.com>
References: <20241017111410.2553784-1-badal.nilawar@intel.com>
 <20241017111410.2553784-2-badal.nilawar@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241017111410.2553784-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0009.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::20) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 22adde81-0736-4fc8-316a-08dceeb1b9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjNKYVplWTRVN0NqalF1SFV4QUxKbnRTVm5YdmpMZ1ZncU1uaHM5TGVhZzJa?=
 =?utf-8?B?cFhOenJMbXhIVHBmZlpEZmJ1M1YzaGNKQkxIUVhIMUpXSkRnT21MMVJPY3h6?=
 =?utf-8?B?dHloUFo4ZmFTMHI2NHZDR0cxZ3FIa3JLdGxvdkpVckZvd3I5dnZKY0VTTGFs?=
 =?utf-8?B?YVVSdGZydEJaVTJEMzBTMlZodWlIOFZIOWlOVTBqQjVKeWdxZlNwUDUwaG91?=
 =?utf-8?B?SVpZeG5wUkc2RUNjNW00U1dTUFl2MjNsSUFXY0pzdGRQMTYyMzRudjVlemt5?=
 =?utf-8?B?UGlQUnhZNzhnZTdOSEd0ajhRYlI2alpLZWtnWlFSQ1c5NDloWmdTcG1obEdj?=
 =?utf-8?B?V0lOaFQ5WW1mdzZqUmFQTzUvb1N1eTVxM2NIeThNdzAxQUZtK3NwL211eWdJ?=
 =?utf-8?B?QXpENWVyNUd2U2c2S2gyb0Q5WjdGNDRpaXh1ZHBobmZWYU5mZXVjRjQvejcv?=
 =?utf-8?B?NS9GZ0lkdUJkVGZPbjByVEl3Tm9HUUVOazh2MlpzbHU2SW1ZOHo4UnJ3N0RX?=
 =?utf-8?B?RUVSRWRIRkRWb0VmcENRMmd5YUU1azJsNlU2WUVFU2l5MXlQUy85cldNeEwv?=
 =?utf-8?B?WFFzeDBMbkxLM0QxS051YkFxaHVDc3FPOGdSUFlyaHNSVE5Kd3pxZHg4N3Z0?=
 =?utf-8?B?V0lvUmdoTVVtQmFmS1diZittT1ZwZG9Db09MMHNhRTBhQmxHaFV4dTJvOWFT?=
 =?utf-8?B?dTh1emx1KzRPWmtYMXZuSHhrNGptdFZyRE00T3pjeG1weHR4MXZEd3QzaFVF?=
 =?utf-8?B?Yno2UDh3dk9HajhOS1JadVpsS1BDc1VTMHVoamFMdEFjTHZZVkJHVUdSNWx5?=
 =?utf-8?B?RklpREJvS01QQVUwbEpZMjlaY2JzbzEwQ1o5bUxTZm5WdjBUUE1tcUIwWTgr?=
 =?utf-8?B?TkZWNUFuYm41YWM2ZHkvZGg0QUVOOG9DT3QzbFBzd3lOZHYvUldZUVJkTTE5?=
 =?utf-8?B?MWZjd29KNTllaEUyZzRENngrSzB2czNOR3RxaE52ZituRncxc1NCMXUweUJR?=
 =?utf-8?B?VGNoVkpZYUZLNHpVOHhWMVh1VEpSTEsxVHFXTGd0TmxLWUt3YnllbzhRdTRQ?=
 =?utf-8?B?K1BQNTMzYzBnQ2QrOFVQVE1CNkFGV0tuZWFVcDhSMktGOHFhSHFhdlFVeTQ4?=
 =?utf-8?B?bVFtRUJnQkRrYmFrUUpPaWlxYS9DZ3VpYTkwTFl1SHdyOGpFN2libUxndGNQ?=
 =?utf-8?B?ekJaT2w4M1prZUJnQXFMTm1GMEFoMnJ3MGtLYURKTXpFWDhvQlgxemhmb1RX?=
 =?utf-8?B?dHJJVVVVN3hXNzdLSEpVOEhGcHRKTWI1cnR4b0VhM2NrdmQxWnBhNlVXcGlL?=
 =?utf-8?B?dlNEMUM1djRPWWZFM0pMeE9HWFBzbnkvZnBJaVIxcDQwOWRZZkRDZlhKakRC?=
 =?utf-8?B?TzdIaXpaYnRldFRQa3VpU2dFU3ZBS2xDM2ZHODBBd3FPbTFmU3JaN1pXeTZG?=
 =?utf-8?B?bnQycnYybGJnRGFOSW1CeERIbzBJV1ZLVTlTLzhaSUxzTEx4aVNXTmxXaTlo?=
 =?utf-8?B?Mm9YWXVSQXRjSUM2Ujl4M3BJbTZ6aUpxemhYcmxMZmxvdCs5WGMvZXJsbGFn?=
 =?utf-8?B?aVViQnl2LzgxcVhFMnBSbEx3eEpUM296dkwzZXdkL3NNWC9sMGNkRkdaTGVB?=
 =?utf-8?B?MExDNnJsUEtFRlJGRHgraWZQckV0OThJanBCRFR3U3lBR001NFVhV1lQbTFO?=
 =?utf-8?B?OWhLQXhnWDQ2ak0wY21KeFpVTnE4WUtaVXdrQWhnM2JuNFBhUUViYzRBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3VKd0U1dWdCeDlDdnZUMkVrQ0tPZjhBVkd1S3VtcDc5NDZPcU9mMmFTQVBU?=
 =?utf-8?B?MmtBcGtpaDRkUTA4clg4WVVPclhwZDJGaVo0SzZiNGVLYVdoVWR6MDZXQlRN?=
 =?utf-8?B?V08wcXZQa2s1aEFRQWhyb292UGlSc2IxQkZFa0FBOEFhVXNGM2NXYVNDblhI?=
 =?utf-8?B?WTB0amRJdDBGQmRzZ21pcTA1YWFIYUptNVFwV0lOcnBhWWw4MVFhU3NGakc2?=
 =?utf-8?B?NzdPcW5tdm4vYlI2MGtobUNURXoxNzVqaDFRWlZlRHg1Mkg1SXo1M3pPSmJo?=
 =?utf-8?B?YkhkWTdXTHdEWmM5OXgwbVNEYktqdVRxcThPY1dMSjdMOVI3UDhobmE0UDk2?=
 =?utf-8?B?dlpHVlgxZTQyaHl0enR3cGc3RUFFSUtqUk5JajVLY1lxUDJFazZzUG5ZSVVE?=
 =?utf-8?B?UWdhVFhyNmZua2tUUTNxejZXSmNvYkVFSkRmRG9YcUorMzJGSGpGMkxwY0Qy?=
 =?utf-8?B?L0JVb1MvUU9yM3Yxbm96emJvOHBsbFR4cVJFSzIrYncwQ0w3WW1UTmJaT3Y1?=
 =?utf-8?B?OWVvdC92dlJzMzhsWElybmlYaWZxSTBLRVBGaDA3a3F2Y1hGTzFLZGdVZWZQ?=
 =?utf-8?B?VS84Wmh2L0NkTHhtcHROMGhjZmNUZW8xVjNMNUIxYlNJRkQ3ZVl6REVieFJW?=
 =?utf-8?B?L1YxcmhVRHBBTW9SVGxLV0FvdHNNZXNmb080R3JoWlBzdFJRSzB1VytROEg0?=
 =?utf-8?B?QVg5c3RQSHI2M29YWngyWHl4TjRienZDZGZaR0NnSVh0Zmtac3VNcVRPL2cy?=
 =?utf-8?B?RVp2TVFJQjdqTEhPYkl1SE1ZUGFVU0lYQllRVDdhTjJvTzI3KzdIYnByV0RV?=
 =?utf-8?B?dFoxSnhERW5ZZlZTczE1SzQzQVhtMjJOT05JdG1IQXp0aSs1Y1VlaHRmZzQv?=
 =?utf-8?B?NlZubndLd2F2Y3RLRmlFQXRvajl3K0xKUURKZ2FSZ1BOSjRzQ0cyZ3l6Y0sw?=
 =?utf-8?B?dkQ4MnZEZHlTREJ6OGgzVkMyMG92UkVBNTVRYVRBOUhTanFRdUV6eW5TaDVM?=
 =?utf-8?B?THlsUGh2VENSZmU0UFNZNjNqSzdhejZGNDdGK0RuQm81Y3RuUTQ2R0lzZ2xk?=
 =?utf-8?B?TGFQcGZieDVNeG12N1V0Y0F4b2pOdXpKTnNTV0pyK1EzaGFNLzZYQ0V2Rys0?=
 =?utf-8?B?RHFFb0U5bWJoMzJDTnFXNWtyWWVhM21DTUxoTk11Vml5UWFWOXh1aGUxL2Ur?=
 =?utf-8?B?NE9WNzRLbnVTbVZYcEYzcjdFcVcwR2d1ZnZxV1FRS3dwZTR2TTk2WW5HRCsr?=
 =?utf-8?B?Sm42ZVJWQTdVRFBsWTZueXR3S3NLUTh1QTdLME9TWkNSakZPNmRXcVNYMlc1?=
 =?utf-8?B?K1poSnUvdjFZZzlqaGRPZXpWejhZVGZIMlhqNUVTcksvWlNOcUx0b2Q1djZZ?=
 =?utf-8?B?bStkVldYYnhId1JwZWt4bm11TWtFREQ3aWF4YlpsUWhDSjAzVmxTSXdPR3RK?=
 =?utf-8?B?YkRWdy96VEVKTjFQL3pjUy82NHJyYW9PdC9JWTQ2ZS9JeW1tVTFpdXVxa1Nw?=
 =?utf-8?B?ekZrd1pYakJkTXBsU01KcG9ScG5vYjI5SmIweTMvUXhlS2p3TmhzU1M4RnJJ?=
 =?utf-8?B?TE1yc3VxTHNadEZuYjBIYXZoUTJsbW1CLy9tYzZCeXlFSHFwQWs0Z0s2aytN?=
 =?utf-8?B?MC9wN2VYdEFuS2lzWCs1WStYR0wvbDIxQlB1VmRBUHlhZmZRYTY1VEh1dkxB?=
 =?utf-8?B?Y2VJcDN0VVJNM1lGcU95YUlrMXR6b0VQdWpPczJlUHgrN0tNTjFSZ2Q3Zit0?=
 =?utf-8?B?V05QczhXOFI3Ti9jMi8wK3lVc3BGUERkMW1aNEhnTk05a2puTmZqcDZvdi9Z?=
 =?utf-8?B?c0hhemZqcTVjK3liMHlaRUw0Z3hIR3VabU5WRUNxc1hzODhtV1dFZngvMWhx?=
 =?utf-8?B?eEY1KzJ2akR2M3B6MElLOUM0SXVmaXBUbTJlZmVhK2lsSjJwamlwOVNESC9H?=
 =?utf-8?B?T2pHdkgzOHhsdGtCblpnb0ZNQWxEek5zUjNnUXJWYngwNVA5WWtlY20zV2lo?=
 =?utf-8?B?L3U0TzRoa09vbVNoRW5sSGY4VzdVVTJsYXJleHZpSTJNWVY0MkxDYXdiY2ZK?=
 =?utf-8?B?U0x0NlhOYUNvK0kreUZkbEt4R3Q0YytRUjFUSUZITHl5SXdXQ045RkZFNjNT?=
 =?utf-8?B?K0ZiemlURXJ2YlJOejlNMWNWRjZPZzY0WE91Rnk4OE9JYllLYVJpdVg1VWQ0?=
 =?utf-8?Q?gDuAXwoNKsl/AiSXcIcuGFY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22adde81-0736-4fc8-316a-08dceeb1b9fb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 13:43:47.9923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moeKbTl8I6cR9JB/36jnZtJx8EhxLEKqoXdVmwPACsYo5XpR7sG9kq6rL/n2xY/YI6GH7JUuipWPovwL9pHO03fBFfkMea7EwVyax4xJKds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
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



On 17-10-2024 16:44, Badal Nilawar wrote:
> In case if g2h worker doesn't get opportunity to within specified
> timeout delay then flush the g2h worker explicitly.
> 
> v2:
>    - Describe change in the comment and add TODO (Matt B/John H)
>    - Add xe_gt_warn on fence done after G2H flush (John H)
> v3:
>    - Updated the comment with root cause
>    - Clean up xe_gt_warn message (John H)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2902
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc_ct.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index c7673f56d413..c260d8840990 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -1018,6 +1018,24 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>   
>   	ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>   
> +	/*
> +	 * Occasionally it is seen that the G2H worker starts running after a delay of more than
> +	 * a second even after being queued and activated by the Linux workqueue subsystem. This
> +	 * leads to G2H timeout error. The root cause of issue lies with scheduling latency of
> +	 * Lunarlake Hybrid CPU. Issue dissappears if we disable Lunarlake atom cores from BIOS
> +	 * and this is beyond xe kmd.
> +	 *
> +	 * TODO: Drop this change once workqueue scheduling delay issue is fixed on LNL Hybrid CPU.
> +	 */
> +	if (!ret) {
> +		flush_work(&ct->g2h_worker);
> +		if (g2h_fence.done) {
> +			xe_gt_warn(gt, "G2H fence %u, action %04x, done\n",
> +				   g2h_fence.seqno, action[0]);
> +			ret = 1;
> +		}
> +	}
> +

LGTM
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

>   	/*
>   	 * Ensure we serialize with completion side to prevent UAF with fence going out of scope on
>   	 * the stack, since we have no clue if it will fire after the timeout before we can erase

