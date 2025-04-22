Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C554AC369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 14:44:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C8A10E0D0;
	Tue, 22 Apr 2025 14:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOf2fVem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E48A10E0D0
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 14:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745333077; x=1776869077;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ebyh8QoMEBRZBysHaSvuEQ+w2UfvrkYhvaj++jrYqig=;
 b=VOf2fVem8JfR4RY+E15wTge6/6DJpHp0AMHViHm70DvjRHdvBzujZYV9
 3hZLQ7MbPAkSzg6TylVjnlJiOpZ16weMgqlq+VsIpDQ4jj+1QvEq3Lr2a
 CyGDIAcex4FgPT4oCBd5AlnFZNY3Q85uADCFJI3ctMcPiPGgdHHSmqXJB
 tdgKbuUHbKEfVXcHerUG6wFr4tt77z8xJCEPHXg072kw39HxvGBoVcICk
 W1OjJfWJdNOLG0xg9F5psOBJ0qKcNiQougKGsTvVcgRMeHmDJCNhkGt7Z
 yI+aw52+5VAV+6lRRZ5EBo6G7hEPkKuQOn2TRnYFiSDtxSDnxF1/iCGtI g==;
X-CSE-ConnectionGUID: f+88yVTpTS6h/2kdzwtPPA==
X-CSE-MsgGUID: jOpKN5yfQxyLUK87LMimlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50700007"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="50700007"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 07:44:37 -0700
X-CSE-ConnectionGUID: BlTp4KvIStahazJlUa1K+A==
X-CSE-MsgGUID: qnySGbNsQAS5q/1xL57aNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131784655"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 07:44:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 07:44:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 07:44:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 07:44:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMUdg/xbNm8J33cFrxX07qKz0L5d8sy0y/gg4om5dSte1DUfZYxVoDHOD95xXJ8AcnBO2nznbUFQPBsY83PE71NklI+IXC+2c/kfTfRsBI8MoHyTay2WYcrS8zlodqKhu7r21UL+FtUFChESuuXB8ieBZKjt6jEB/r44djnHjStwppwWs2rX30OOWdV22/zQeKz+HVgYRFRY+MGnNw6zV/u4G6PdCjPF82uqIAi9JHoN7u5qoZvrka0ftSPj7k1UL87yBmQKJfEvccLoUp+NBv2W3uAVrG3UqJ87CvUcQNuFKYxo66vAaHpEcHzUN/eQd3KMu6BtpyANtNtgbxYb9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G4AUz3P7fIPY7cXgSLGeGXz27God/5psanuZ2jTSmz8=;
 b=kFhjSHobcNc8l6CG9yd3q/RxPW4xbPv34MHITw9+CwpvEFYGjn15QxOxigSrwDytUQVkMAsc7OcoK1WLw/U0Du85cnmb17vEeq/Qe7e5D3MdgWkbC/opnZU0wW2piI+UNC1qx6oWSXkky07YZws9bFcDwIcTMpI2KE7bVJuB6T+me+uE0tlNtJFvkB324egLuTNSJmPLhdprMs2I49OinQZIRXVRMjQhx1ozdWeqZmwyGBts8r/ibG52CG6+v4qFWYQBUNE3xf37fB2XzS2f9HyUIrxI8JS2dVyIOnzLDloZ8kIAkongTBQeVKnVevVG/li8V8KScmzAOycsVo+THw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 14:44:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 14:44:33 +0000
Message-ID: <76a843e7-31ce-4870-9b54-f5f81851fc68@intel.com>
Date: Tue, 22 Apr 2025 20:14:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] drm/xe: Rename wait_for_lmem_ready and make it
 non-static
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250421135029.3489950-1-karthik.poosa@intel.com>
 <20250421135029.3489950-2-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250421135029.3489950-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 1538a914-8460-46b7-58db-08dd81ac31d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWcwblZVZzFVSlBRaDJvNlUwN3RkK3ZIN0hlVmJQcVl4Z3hMYkI4MGluQVdP?=
 =?utf-8?B?RkdqVXhoQUo2NEM4VjFWWFJNRzgydXFqL0x4UjZ2R282QityY0R0YXhnaGF0?=
 =?utf-8?B?UGxQZzVaWmN0OERTZkx6eFdjV1ZORE0zeEh3eTM4dkt6TGdQU2x6NTRXZUh3?=
 =?utf-8?B?dG4vNTNXd2o1QVFrWG41L0F5VEo5OWFTeHpiVWgybHpGRXZoaEZvNXhwT2FL?=
 =?utf-8?B?TG55MDZEZWFwTmpyYzl6NTQwK3NUMlcxLzRwbFUvbFdQeWoyNThhWUpaVGtK?=
 =?utf-8?B?SzVuazdiNGtObjNYWFpXOXUrTmVWY2lES213MURBdlZObVNPU0dNaEZMMDVo?=
 =?utf-8?B?SCt2dkMvYWEzUnNkcFI0OTR2MXNGQ3VrRC9Ed3JMMHp3Nm9vcEFUOU4wOE1X?=
 =?utf-8?B?VjUwY2ovUWR5bStCcWp2M1BqekpKb0lOYkd0dEpSTnk2M3pPWFhsbzRKbHlV?=
 =?utf-8?B?L0R4UGxIUDVkb3JjdnFCR1k5TVUrSWRDQTh3Q2hWVlVaYkp4Vm9KcTR1NnFk?=
 =?utf-8?B?dFhhV05VTU8vWnlrVE9Ja1VXOFNSVDh1cmUwTkJiWmJPNkRRSFNqd2RWc3NZ?=
 =?utf-8?B?SVZCUTZ6bkJmQVhaNldUckt2ZTNKYkpmY0hwcm42WnduME5CQnE1Y0pPNFcw?=
 =?utf-8?B?VjQ3NnFUNGYzTFh5b1VjNWtxbGdTY1RiSU5CUWxOMzVhR2FZcm5Rci84T052?=
 =?utf-8?B?NnhXcUs4enZWNmxtN0ZaeVEwRE40TVhvd25rMHI1ZkR6M3J5aFZjd2lQQmNL?=
 =?utf-8?B?WkJZcGdRVnYzczNFOW1qdmV3UE9HSys4U2NzTmFEWHBYZW0yS3NOUUl6ZUpQ?=
 =?utf-8?B?S3JSOHc1N2dkZ2lTUkJ6Q2NtVitscU1jRkQvTUl4aGRBS085RFBIemJaam9N?=
 =?utf-8?B?MU02dCtrZUV5a2x0WFhCdmJRSG9sMzJrUEFkR2ZRdVJqVUZnZlpiTVhJYzJQ?=
 =?utf-8?B?MG1OY0JjUnJmcU4yZWdBWGJLRWR1bCtnWWtZQ0lXUFBLN0dnWVhmUWNQMnBh?=
 =?utf-8?B?NmhSSTFpZXYyRTVNd3Y3ZXZiWXBnVWxadDFHSlNBb2oxRnhDam9tb2hpZzF0?=
 =?utf-8?B?Ym51L2N4WUMvSGZtVFlUdkltcUhkSHNjQzN6dmV1bTYzYlMwaUg3U25OcjQw?=
 =?utf-8?B?UnpHME9DVGtvS2N6R2k1WTRBSU5RVlQrcnJnQzN0MTJzWHJYcTZFaU1XbkNx?=
 =?utf-8?B?dEFhc2NsMHJqYkFrNFp6ZldNY2djcHB2ODFxQ2hlMU1BN1prZFNUN3k4eks3?=
 =?utf-8?B?WSsrUDhTWTErOWV5L2lpc1NoTUZhVWxJVm02eWJpR3JIOHdVTlM5OFVhYXJZ?=
 =?utf-8?B?VWpBa0FmbnR2bmYrd2NFK1UvdGx1UVVsVkZmL3l4TTNCRmlwUnNmWi9yVE1O?=
 =?utf-8?B?dUVqYktyUTZ4ZUhCSmMyT2Rpc0RnRGhvb0toZ2lYSVBGQ25zb3ZHM0ZoN0ty?=
 =?utf-8?B?Wll1MjJhY0NncHR3UkJRSkRIUnQwT2lXVGxTZTBVeS9nQWRJbVRwckUwSDlM?=
 =?utf-8?B?M053dDMzK0V5TEFrS1R6OHZXa0dqTnRSUkVGNEc2Ny9IRC9sbnJ0eS9vc3RP?=
 =?utf-8?B?ZE01NFYxTXV2Ry9Mc3dCbExjaU9iRThOTjFjVllGV3lsZWMxYVhTRDhweVR3?=
 =?utf-8?B?S0xFQ1Zaa25yYUVlU0lhTWlUTUZmZTZYRk5xL2UyUE1pckFvMnlqMFdqRHlu?=
 =?utf-8?B?NDU4bmhsaVlaU2tiMi9zUkVVeDc1dnFGekJVWlFxRFZpWGxWZlNuYWYzSUYy?=
 =?utf-8?B?R01TQnloNjhMRlhQb2pKNk9hQTk2OXlKamhtTDRQdEdLR3RvZFh5akJjaHFZ?=
 =?utf-8?B?OTJQQVN1QXN2QnBtNzk5R3R1cUx1cW9nR0xUT3BKN2VQNnA5NUdsd2lLRGVr?=
 =?utf-8?B?eFRPSnNna3hmTHJ2SmtNd2NYWVNtRjJrNWNwclhOREFIUGJJR1lZZW42S3Aw?=
 =?utf-8?Q?U8UpJdO7MKk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmlKZFJGek9xMUZrZk1UR3lwL3pNTWVqQkZ1a2xCKzZrY3NEUkdFclQxZmpw?=
 =?utf-8?B?RzhzSU8zbXN6cGE0aytHS1Jtc2FzWjRKcjNvRjJOZlJtTFZqVDIwMTdpQ3ZX?=
 =?utf-8?B?dkErcDdRMVpqUlpWa1ozUUMvejlFc2l5bVk5RDBySWd2bDdFZFFrUDhmdEd0?=
 =?utf-8?B?c2RpNlN5K2hEU1RDRjF5U0RjbHRIbUxCc01JZWZXUmdqSUVUa2JGYi9XNDha?=
 =?utf-8?B?SE9aNGNRNTV0cWF2cUZBUXlDTDA2ZHBWaGZ2OEZEeThKVjh6Sy9wRmxUcUZl?=
 =?utf-8?B?UUF6LzVTOTlxM0FxdkxVbWZPcDBla1M2VXhZdzVMNmJRbDZaRXlrVHFxTmIv?=
 =?utf-8?B?MUdXbEFYOWl5TnM1c2xOaXB3UlpCRWhLZEQ3dlVsR0x4WlpRZnJ4TFUralNw?=
 =?utf-8?B?V29ZMmZ1d2o1Z3gzM3VBaTZHazRrK01DT2p0RTU2d3ByWFpZKzgxdkRoRDRJ?=
 =?utf-8?B?QXpjU3JkTVozaHpTOWIwSjVENHg4ajFBQTdDS3psZVZ4c3RtYWRKSlpreXRQ?=
 =?utf-8?B?MzlCTXV6bWczeCt6RGgzWnhsZVB6d2JUQnl6SzM2ZEpBTVd1RnVZNjJLZmpW?=
 =?utf-8?B?TjFzc0UrR3ZSK1RmVmQ1T1BQZFVXS2p3SU1tR2w5Vk53UWYwa25HQmYxL0JS?=
 =?utf-8?B?NlM5S1B6bXVCcGNUT0RpejlvaCtaYTVscDErVGJDaVl4UmZoUERxQXhwQ241?=
 =?utf-8?B?dEZ5ZjNEM1lRZk9KdlFDTGtUSmFtNXdkdEdqbEwzMmZNcFFqQXlPczlpc1d2?=
 =?utf-8?B?aWdqd3BRdTdkaER5N1d1V0lGVGo5T09ySlZNdXRPT1AyT296ZmN4VFJTUStL?=
 =?utf-8?B?b1N4aTgwWWd2eUxsaFRlTXdySjliYzkwd0c1WjhuVjV5SXk3TUlKRS9GaUMr?=
 =?utf-8?B?bHpQRUpta1RacllrR2VKblg4eTR6NWRwcVFQaHZjeDl1cnBYakY1OFA3c3FE?=
 =?utf-8?B?NGU0M3Nyb3A1ejRpMXpROUNaNjk4eTh1VzEvRkE2UXBLa1loWWVUMXBhMkNz?=
 =?utf-8?B?YXRYZWJXb2hlVFNuNit5MDRPRTJmckJaamludzYzNDRPNkVFRWhBMUN6M3Bj?=
 =?utf-8?B?TEU3ZmdyN2ZWdjNINjF3Z0dXZ1lweWZXc0xxdU5VZHBJY1hkMXFhQWFiY1VM?=
 =?utf-8?B?RXkySllON0p0YW5OaHlTZ2haMEw4NG9ERFc4TnV4b0k1VVlmSmZYdjRaNHl3?=
 =?utf-8?B?bkZ5eFNvcWlRck9yRWU5enhhQW5UOEJUZnlnRVhxVTdCK0lEZk93QTlHcDYv?=
 =?utf-8?B?UzhraU9GbVY3Nms2eGppL3I2dmZJVU4reVRkczdmNkQ3WDJsVFlac3ZmcDVE?=
 =?utf-8?B?SHFjVWRrazJydytCVzhoS1lmcnRBdWs2WEt3Um5Fc3VCTmx3S0xLQSt6TUww?=
 =?utf-8?B?eXFiVWV2ZkQrUUhYUjlXaTJuYUlDWk5KOVVQazVRbDR2OW8rOUhjVktjUHFS?=
 =?utf-8?B?YjR4VGxBcERnRTB0Qjd6WWlRVEJvTitYOHlaU2JBUDQ2SXQ3QjdEWmc2Wk9B?=
 =?utf-8?B?di90TG1TTWZ6WEpyeithSkZacXN2cGg5dkR0dEtCTHA1OTR1UTNlUk9GSm11?=
 =?utf-8?B?U2lYTkdSNGRzRHBOZnFzU2w4UTNKdndqYzdIa01rak5CRFhpSFk0bDR4WXgy?=
 =?utf-8?B?b1dPSnlza1Y1WmRTTFEwSm83N21POHl2OXZmQm9GN0FJa3JSa2dXRHBwWGNR?=
 =?utf-8?B?ZTBtamNoYjFHY1NxZGZhSVNEbzJZUHkvL1liMEIyRUJBanJhZzRZRC9UKzJM?=
 =?utf-8?B?cnp1S2NOanZsMkROZkMxZjlYZnlwMW5vR3JFdWJ4WDBSTEdtdmFNa2pQaTQr?=
 =?utf-8?B?TUJnOTY3TDNkeG5SQjJvcmJjM0RFVVliaGpzODZwMHdQcThMU3hGOHF0Mjd6?=
 =?utf-8?B?V2lFMGtiQVhUMDN0L0lrZSsyd21KSzNSKzhNK3M2TXdvQ0dobExkd1Zua0JP?=
 =?utf-8?B?UzlTcW4yWWNrd0ZNeGlRcnAxVlhlUVptZGtLazJRQnplZWFMeVR3cVgzd2Zx?=
 =?utf-8?B?bExpWUFyQmo5TWVkOE1Ja0FrV2JmUnFodmhOUFh5NC93SjNxbnBNZUVpMDlz?=
 =?utf-8?B?d1h5bWNDcGJZSy9rZ1cxTGdLVVNETjROQ0o0YmhEU1hJbmdPVFJ2bHNZRUk1?=
 =?utf-8?Q?jSRoi2y2YlIvJ/fCTubTzaPmD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1538a914-8460-46b7-58db-08dd81ac31d3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 14:44:33.2219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0G/boAtjhraM1kPE0fu6dqjSiqESdvZR2yUjalOGZ+oswaEH1g6KAMydnQrCMLc772EpkAfzrcikQ251i3rEDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
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

Hi Karthik

On 4/21/2025 7:20 PM, Karthik Poosa wrote:
> Rename wait_for_lmem_ready to wait_for_vram_ready.
> Convert it to non-static to enable calls from other functions.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_device.c | 6 +++---
>   drivers/gpu/drm/xe/xe_device.h | 1 +
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75e753e0a682..fb178315d3df 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -630,7 +630,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
Since you are renaming to vram, rename this method too>   	return !!val;
>   }
>   
> -static int wait_for_lmem_ready(struct xe_device *xe)
> +int wait_for_vram_ready(struct xe_device *xe)
use xe_device prefix, all functions in this file follow this convention>   {
>   	unsigned long timeout, start;
>   
> @@ -676,7 +676,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>   
>   	return 0;
>   }
> -ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO); /* See xe_pci_probe() */
> +ALLOW_ERROR_INJECTION(wait_for_vram_ready, ERRNO); /* See xe_pci_probe() */
Also send a patch modifying xe_fault_injection igt

Thanks
Riana>
>   static void sriov_update_device_info(struct xe_device *xe)
>   {
> @@ -727,7 +727,7 @@ int xe_device_probe_early(struct xe_device *xe)
>   		return save_err;
>   	}
>   
> -	err = wait_for_lmem_ready(xe);
> +	err = wait_for_vram_ready(xe);
>   	if (err)
>   		return err;
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..dc79b3812d66 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -47,6 +47,7 @@ int xe_device_probe_early(struct xe_device *xe);
>   int xe_device_probe(struct xe_device *xe);
>   void xe_device_remove(struct xe_device *xe);
>   void xe_device_shutdown(struct xe_device *xe);
> +int wait_for_vram_ready(struct xe_device *xe);
>   
>   void xe_device_wmb(struct xe_device *xe);
>   

