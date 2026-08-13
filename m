Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F81C5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 16:53:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6221710E503;
	Thu, 13 Aug 2026 16:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XaweSfJm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06E210E503
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Aug 2026 16:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786640029; x=1818176029;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nNdRukCY4ATQmz3EI64jYb4pbOBg92Ab26DeTtts4eM=;
 b=XaweSfJmHxfmzuQHLtEVZPthEc8sDPYfQAIm9oW0lnHINR8p8UCL4IjH
 QvEBB1XsHqZ48DAHv8RqL4GrVmWr3JJcVYtyvv5uyaOOmYVUXIoXHTgMF
 gi2euYTwKXBwNeM9pYCcX30iOqN6w41Cje8eUrfY+1yAMC8HHBDZGgPkB
 gFIoBfHE6MD62jOUlREYy541Cj9sp0UAJhFQkuVKHchSCX9p0/5w9QtoX
 0NPxThdL7dM+6HSfUFdHkzTe6mKxvkk51rD92EgjWzeDPxdzr0YGTcDdy
 56mTdFodnPhCDAt3HqKTDhmI2rwB77eONYH1V6IygDf0lUhtt+UEeqCAG Q==;
X-CSE-ConnectionGUID: 7goLFrffTCGQVk43h6HFKA==
X-CSE-MsgGUID: J1bmQbUYTS6NaezzZFS5dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="104603154"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="104603154"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:53:49 -0700
X-CSE-ConnectionGUID: qz9Ck6tcSAOmyP3m484N6Q==
X-CSE-MsgGUID: t+B+OKUhQUKi4G6j9b+tFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="293917500"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 09:53:48 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:53:48 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 09:53:48 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 09:53:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPpeoXtSwhgI1wQ1uD5WcoOECO08CnTPxEdrFpKBHlFiDjPg6WCUuPaBzz6wlsO6Ple6Gwwis74ErXhFVW9KG7Exd1QaUZhtjf37Xtae9pEPK5I5kKDGLFRdlCttDf1V/A4kLWd0Ne5+Dh0NU0c+07jE6AAJrQcNC7R/BebGZs5qcL2sfi6JRH73Ky8UPJ8qLrFRFjk8dLZrWNrBxkyY1CcOX/oBG6ppXgBjLPRTBJ1q62jR8t4C22imAXFPlt8OE5sKMF2ryLk7V4w31dEXW5PUK7J56EmKb3Az0gM1je+aR5Qd8RfLmAWkcZRpSvrN15GXu5vSUkydsDv/G2FB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tjwW+G+wqsy5nlK8Sx81AsUMQRQETc23FeFLu/gd7g=;
 b=JfvqwR+Fhfsj7E4amf7LHXpS9ntv3zgVZJRfuuld9DQRHnYY1/SXCaNHIWPvSM+4y8YUKKXAlVEm0OnnG32JBJdefPon68vzKVwjjCe7y5wqTkF4WVCJCrae7EEHOLwxSsYtSHkvxnl0n0jbA2vwyw0jLANUwJms2ypjfJtd9LL0+X4uRsT69yZ0cO3fCGdvXUEPtmxu87L/9CfgiJ33RFDn2vlcm6+tt6TYU9yd4/neS++qhaUweE/gpGTPc81Hjmtk0V7OGHlgbW9uDjqgSFhNFPJIwr4UsXgi5nXY6w7AXzli/vzoa894LS3mwxY0/yrUU+l9bH5I2RMBjDT/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CY5PR11MB6114.namprd11.prod.outlook.com (2603:10b6:930:2d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:53:45 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:53:44 +0000
Date: Thu, 13 Aug 2026 09:53:42 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>
Subject: Re: [PATCH 3/4] drm/xe/pcode: Report pcode errors using SIGID
Message-ID: <an32lrASTxm5S9wX@soc-5CG1426VCC.clients.intel.com>
References: <20260811235254.153783-6-umesh.nerlige.ramappa@intel.com>
 <20260811235254.153783-9-umesh.nerlige.ramappa@intel.com>
 <a0ba4234-5767-4c63-a0e8-1d05540faf99@intel.com>
 <any2bd4cNnfwj0O5@soc-5CG1426VCC.clients.intel.com>
 <1ffbb6ac-dfba-4873-8a47-76a5b6e66bb8@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ffbb6ac-dfba-4873-8a47-76a5b6e66bb8@intel.com>
X-ClientProxiedBy: SJ0PR13CA0166.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::21) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CY5PR11MB6114:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c36e99-e423-4966-6e74-08def95b6fcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: mtfbNpUSldZ76cRkNE0GzyaMyrZPmb69PMITEC+dQWib6Z9Lxcn2pfUj/m2KVyeWk4nvKqrt/y5RanTaRgIZC0//r9vvSTzOC4q48wtTVRhw1RVEN4Qt3Q6H5+ixVTeV7URfJUKM2nnYW/56jIxKOuFt1+Ny4mZeDPLQaQscAKcQHJHXfpII8siNvOyIEdV1Q/u0L5wivCkNaPdWxzowmMbRQUwoDlcStnteUO6cVr+9XB0cy7+ll8qRaVxvNn8e3U9D1C+AUBCLGn977zTFVpxx1zQOfz3NA82SLJvBH/zatIvpQzvk2YpOI6b/b0skLru2kGn5YEBI3htymGC+eWeSLhsYpmFkfxgAjbsWqP0jYF1yibKbOPM1ZLJs90pdt2y17PdlAXRWBRoVevhc5OCLo15hRh2yXRzBM3aKsUXynErPF15ciVVZamwxrvMuGtmdjDYTpjGfz81R76SBHRPfZ4lSstC2j00xt0iJ58KDnDtFjT1F5EfQ2ttS9VxymkBT4w2RIFSgvvC9fmKZqK/XLM3fEriEuBwz8Jq2MZXyaKCcBxFM/SCGwI2hFNZuTy+amQoLYCpgUq1XJPpSWQR6m4cnrYlbSSySWnfqMNc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk5kVmlWNEFWa2ZNVVl4OWU0NFQxSVhSUGJqL1BsT2ZMVVYxQjBQRjFQOG5X?=
 =?utf-8?B?eUsrUWZmbk10eGxUVjhzdGkrNGRGWVZiZm5Bd01Kdmppc2dPUnZmSTZXYzVM?=
 =?utf-8?B?Ky8zT3dDWGJJWGkwR2czQzlUSjBxdlJzOWJrU1dIZVBkNG9QVGVtVGZJQkow?=
 =?utf-8?B?cFoyZE9GSXpwcklkaUc2SmloUDRrYUpPM0VWRWN5WStMa1dxRCtQNkEvSzRI?=
 =?utf-8?B?Qi91UFNqUlNiVCs2STROZHJ2ZlFETjBxeW5mV2lIYmptd2RkZW10QXZGTDQz?=
 =?utf-8?B?Z0p3QjFqZlNkdzY3Y3NsZHdFbFVoZHZoT0xUOGxzU1pwWC9nTldXVUwyY05z?=
 =?utf-8?B?V0xNY0E5QWJ1UUZDL3Z4eXVhZkZjT2FrNnByb2FBZzFkZkgwSURzeDZsQmts?=
 =?utf-8?B?SjV0RU1lYjVFakZHNXY4VEhBTFpqZ3FCcmxWR0ovZlRqMk9zaERJOUt0T2lw?=
 =?utf-8?B?VWdqTlJwaXFWNDJsOGZGeFk1SkU4bElLOVdiWHErZVZRazhZTG4yMEcvNS9q?=
 =?utf-8?B?Y2FLaGdPWTI0SzZTeFpIWlVSUG0vbCt4UjRqOHNEM1hzT2ZZd2ZSdmprMWpY?=
 =?utf-8?B?MkVmMGNFSTJsNGNkZ0tBTm1YQW1HTzVEM25KMS9vd0JEMGhMYzRhWHBiUUZN?=
 =?utf-8?B?Z1ZBWnRaM0EvdUw4SURGdjRBV3p5M29xSk5TdCtGNTdlb1UzaEhXTTBQaHNI?=
 =?utf-8?B?M3lzR3RUZGVDR2FvVktCOGpsKzhySUt4amRzWFRuWnlnSHlyNTdaMmVoalJW?=
 =?utf-8?B?RVdKbmtNY1BBY0d1L0tqcDdtdXZLcWtCMWU5STlkYzZnRGd5VlRjRFV4UHBH?=
 =?utf-8?B?MUVrVUgxUDhsTXl2aUllcEtkcVdZYlNwMGdHQXlYNUUwZjBVZjlEQjRwTXUx?=
 =?utf-8?B?emVTNTB2NUVtSloxOWVKNGQ1SmZZMFNSUWFtRmxpTUFGVGFRNVRIeTlyaDlR?=
 =?utf-8?B?Vi9pU29ZcVk5UUJxcFdZYWNib2hRWVNUWUl3eFRoUEoyQkhGR1lTcHk1cDdW?=
 =?utf-8?B?aDlBazVNQ0dFVG9IZ3JnalI4UHJ3ZzZ6VXNaMGNWS3hoRzBRcWRiYzRJZkJh?=
 =?utf-8?B?T291Y0pxS28xalBhQXM4REZZemxycitzeXd1eFF1TGJTVnRvQVlnTUhNUVVm?=
 =?utf-8?B?VWx1bmplRlJrYktsYnVjRkJPdjNHRWFwUjBGd3pkMzU0cmVyckJhR05OS0tZ?=
 =?utf-8?B?MFhveTMyTVBzNW1VRitMVDVZMlJ2ZUdGcW5XM285OUxoR29NckVXaEl2VEVC?=
 =?utf-8?B?L1AyaVk1b3BuNnNSbENZTDZLZ3c0N1BRdmJMa2pQM0pSUXF5a3dxenhCSHBu?=
 =?utf-8?B?ZXZ3MHY0aVlFMW43RG13RmREZDVPUzV5bFJpVGlPSy9CMDRGUm4zS1RuVmVv?=
 =?utf-8?B?TWVUZFlxTnlPQ2QyQStNM2dwa2QxeEFKd2MwVzFacmpDUG9vTGpsUkdpVGtG?=
 =?utf-8?B?YlY5TFVUbzQ3Q0p0YzJrams1Qnp6YmtqNXBSUmxsZjdwcURTUG9OeFBYTlc3?=
 =?utf-8?B?Zk41alhKUlZCWkR3RHQvQVQxZU5kTWhXYlpWeHlnNDRGK2tKa3FkbStFSGdi?=
 =?utf-8?B?MGJseEFKT1MzdTB1V044YTBldzFLK2FIRW9VM2REVTd0RlEycWRhbFBpQjdp?=
 =?utf-8?B?dHlPSUE5TGMxaFdNYm1XbXRBZ1p5WU43eFZOckFoMFBwZ1JYK2hJWkwwSURN?=
 =?utf-8?B?eFg4MWlYcER3L3dVSGl6dmhWREpIbjdLSDRPYURqUDZtT1ZHUzdCSVlCL1Vv?=
 =?utf-8?B?REh4a2hycjRrVmNQNkQ4eFA2WFRjTCtUSzAvazZLR3EvZSswMU9PVnYyT05F?=
 =?utf-8?B?ckFSUjZ5WS8wRHNEM0l5V2locGh6a0dCVmRwaExiK1lQU1Y3cmNYYXJwVG1S?=
 =?utf-8?B?djRSOTFHUlVvU1I4Sm5GQ2pyZFMwWjJrcUxVMHY0TmNUM0ZJWk5LRklBd0J0?=
 =?utf-8?B?MUlnTFljSmxiMGhYZEZFWVZjNHc2QThIcTNUL0ZtQ0lDMmRRaUFuazlYRC9R?=
 =?utf-8?B?Q3grOXRLRW5CZXVDMWFISzJsa1pHVkNxUEMvWnVhM0NVaFJzdC9ScU9sL09t?=
 =?utf-8?B?NGFZNVB1S1lVa0ladXNqS0N0Zkd5anlOWmZFNDFWN2prSER3SWU2UnFPdlJP?=
 =?utf-8?B?UU9EempDRXVweVNmZVBmZjk4Ty93TjZHcUxBY2lHdU1lNDEyeStiUzJqWm95?=
 =?utf-8?B?bERSTXNsSzI0eVhsMDlKS3Y5cE9FOUdSMXZoNXArR245M0NyWTQyaXFzMU1L?=
 =?utf-8?B?c2Z3TGQwMXFlclZBb1A3eDBiT0R6bkZyZnVjdk5CSHdtajEwNnBlTVhWT1Fp?=
 =?utf-8?B?dzlhbjBhT3lCU2pyU0ErSnQ1VW9Bb09FajN5cXdKMUZDSVNzbmJCbWRRMEU4?=
 =?utf-8?Q?fFP/RKT2XVYF5IuE=3D?=
X-Exchange-RoutingPolicyChecked: TfiJGuZfC2QOGsI1OsBt7FOJevryT6JY60BZjExXLVrFF+l6RKCAj4wwV5erS6PBRZ5wltLltGeRSKSO4KEqEjmkJ2ijjnhFyJT8DR0mfLiMhEAW0E/y/9l5aQ5VqS/cVt6rhin9KMmMbL/EUwSQaGkKBj4mrMsAYtGNW4KoMAymHm4yJ7JJio06DZjY9f6e0+0R16eScX4f//E2WfZnVjOOdbVK68LZNSODAAPRzK2+ECNn+QJsvDqdbWhLYuASugvAZz4sSI++dvmuVoRVP1q2GJ5SNZ9yKtjPrRpJZLsK3jci8cIXifzeQWAltY6DkfvFuKWp2YSVmRrsN8UIBA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c36e99-e423-4966-6e74-08def95b6fcf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:53:44.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DW688qWFMaXPEu/6zqRNU95uEaLzWKTOjiRj4jzcuzncn2YUzdG4X6g4e0gjWcevwNuLXzA2RlEqwB5YO1WMEApUESjwgFAWUCvzERPg97c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6114
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

On Wed, Aug 12, 2026 at 09:45:40PM +0200, Michal Wajdeczko wrote:
>
>
>On 8/12/2026 8:07 PM, Umesh Nerlige Ramappa wrote:
>> On Wed, Aug 12, 2026 at 07:05:35PM +0530, Nilawar, Badal wrote:
>>> Hi Umesh,
>>>
>>> On 12-08-2026 05:22, Umesh Nerlige Ramappa wrote:
>>>> Use xe_log_err() to report pcode errors using SIGID.
>
>hmm, it looks that there is overlap with my series [1]
>
>I guess we should hold on with adding more SIGID usages until
>we complete review of the infrastructure patches and first set
>of SIGID usages that will act as 'golden' examples
>
>[1] https://patchwork.freedesktop.org/series/171022/#rev4
>
>>>>
>>>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_pcode.c | 12 +++++++-----
>>>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>>>> index e9125341481b..b35c1a77effd 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>>>> @@ -14,6 +14,7 @@
>>>>  #include "regs/xe_pmt.h"
>>>>  #include "xe_assert.h"
>>>>  #include "xe_device.h"
>>>> +#include "xe_log.h"
>>>>  #include "xe_mmio.h"
>>>>  #include "xe_pcode_api.h"
>>>>  #include "xe_pm.h"
>>>> @@ -61,9 +62,7 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>>>>      }
>>>>      if (err) {
>>>> -        drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>>>> -            err_decode, err_str);
>>>> -
>>>> +        xe_log_err(tile, PCODE, err_decode, "Mailbox failed: %s\n", err_str);
>>>>          return err_decode;
>>>>      }
>>>> @@ -225,6 +224,9 @@ int xe_pcode_request(struct xe_tile *tile, u32 mbox, u32 request,
>>>>                  true, 50 * 1000, true);
>>>>      preempt_enable();
>>>> +    if (!status && ret)
>>>> +        xe_log_err(tile, PCODE, ret, "Request timed out on retry");
>>>> +
>>>>  out:
>>>>      mutex_unlock(&tile->pcode.lock);
>>>>      return status ? status : ret;
>>>> @@ -319,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>>>>          mutex_unlock(&tile->pcode.lock);
>>>>      if (ret)
>>>> -        drm_err(&xe->drm,
>>>> -            "PCODE initialization timedout after: 3 min\n");
>>>> +        xe_log_err(xe, PCODE, -ret,
>>>> +            "Initialization timed out after: %d min\n", timeout_us / 60000000);
>>>
>>> Is a SIGID needed here? My understanding is that this failure is translated into survivability mode, at least during probe.
>
>IMO yes, it's a FW error, for which there is SIGID, so we have to report it
>what will come next (wedge/survivability) is not to be decided here
>we should report per site, not per condition
>
>>> Also is it correct to log CPER_SEV_RECOVERABLE for this error?
>
>initial documentation was reserving FATAL only for real PROBE errors
>or for SURVIVABILITY mode, but at least for the latter it is no longer true ;)
>
>>
>> I thought all FW errors should be reported based on this conversation:
>> https://patchwork.freedesktop.org/patch/744654/?series=171725&rev=1
>
>that's also my understanding
>
>>
>> fwiu, the chain of errors leading to the eventual failure is still useful, but not entirely clear on what's needed and what's not.
>
>IMO if for given error case there is a matching SIGID we should use xe_log to report it
>
>but we should still check if existing error makes sense ...
>
>that's why in my series I'm splitting almost each new SIGID
>usage addition to new patch to have proper discussion

For PCODE, then let's just continue the review in the below (Michal's) 
series since the latest one has all relevant errors.

https://patchwork.freedesktop.org/series/171022/#rev4

Thanks,
Umesh
>
>>
>> @Mallesh, thoughts?
>>
>> Thanks,
>> Umesh
>>
>>>
>>> Thanks,
>>> Badal
>>>
>>>>      return ret;
>>>>  }
>
