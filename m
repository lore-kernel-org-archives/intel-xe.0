Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27419D262A5
	for <intel-xe@archiver.kernel.org>; Tue, 20 Jan 2026 21:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB06810E257;
	Tue, 20 Jan 2026 21:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M1yyCIEP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC28C10E257
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Jan 2026 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768945016; x=1800481016;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fFMbWWTrnR2tHatPJXROmZwu41tTSDlLXfGvvwplo/k=;
 b=M1yyCIEPgCHSspE2zNxXT3feYpbj3WNR/pijQvCBSpkLd1/ZBlEcreE6
 lVLPdfsKsdAqnuN0zhASjb6l8HYMCpvYpwhMOZtZpN3lrm5aAYyyWyOlL
 YLJ1dfdW+RncUdhd3fv0EuEMGfIQFW2UDWEqfOl0rKEJZVjGxZGaRus7q
 vkp8CN4WGTWdj0ODQcaZ04fawZQaiUJo0NEJgmBPmaPaoeAZ1kFQMf/v0
 QG6oTb3bk8WCi2G810HqOG0HagMxgCmEOFXVU46GjBCe7bGjOnDhU6lAf
 zRtL+lBvn7dxiH067XohF2YA+vGsYTmRSaER5Ku6AF8UlQJUImJJgvz5O A==;
X-CSE-ConnectionGUID: VWzIfFU8RpCUhknMoYW5OA==
X-CSE-MsgGUID: gEK6vv5/RtOWKe5LjfaWXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="74034034"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="74034034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:36:56 -0800
X-CSE-ConnectionGUID: lDKPgYp8TouKkn81eUfMqw==
X-CSE-MsgGUID: MW+CrMM5Q++QWFjKwfXaCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="210686210"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 13:36:55 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:36:54 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 13:36:54 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 13:36:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRM7yghLRwRfeZT15ppcFkwM1Z6nK3SKo6sGXqq0q1deMvGrZWJLCv7zKnQNZAU+7IaslKtykcizZ4qT+joXSafmKp05PtsSu1rM2JkcbRlyep70OgQHwy4hqmPkTOohp63ueAVveQ6QH5fBdgLHxBba1Y7aNwx2CgNEX+ZLxUpUCohz/rgmap5tmJC3+lWkFWavVwoWaKVjj/XSK0gCMTtwpzFvnO4a3ujkPKHmXd4/LTj36i9r/RMhMPExqDJtzqNjL0mNZiGko9hl0mwseLNbv+HM0Do4zBQtgeykVOJP/UkP53qQbWeWPOEu+TmEiJZ27m6ePMQHPflCXbcbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7tE+PjfsyUZJp9bT6dMK1OSohpRn91mXnDkKbwsQMU=;
 b=UL1AdZTK2D6Y4q39IfDqywmz8kZmZm+lQOEz+Kx770ATyOoNIWbpnMwck5t7i9SJ0xfUaW6nAEOvdEYF4VRFyuG5+MOAEYLESAaAST0vzxE8Pt7DA6Wrv+zgbZmiulCNSj5zmsZpfpdOmT9NbaZWdNPRuhT3VQSKCD/iJtK7uCg6fVGnAuZzQ+IoI+ap9mHAf9qPls7si/XdOvYnK0CJ4sLfsXzEXFujVaLXDMPnezneV4yDqYXJMP7beLYMLo3n7lhgBsmvYS5lR8WF0yL1osj/TZcUwych+EK4iNlb06g+0286MsdLjrbbfIthw4ZCZyi7kzTaDOK89yeicZUBvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB7974.namprd11.prod.outlook.com (2603:10b6:806:2e7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 21:36:52 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 21:36:52 +0000
Message-ID: <efaf7eea-987b-44f0-a3f0-1b0c73f2f1ea@intel.com>
Date: Tue, 20 Jan 2026 22:36:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe/guc: Wait before retrying sending H2G
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260120185047.593-1-michal.wajdeczko@intel.com>
 <20260120185047.593-3-michal.wajdeczko@intel.com>
 <aW/tdSZ3HAjTjDDA@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aW/tdSZ3HAjTjDDA@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0019.eurprd02.prod.outlook.com
 (2603:10a6:803:14::32) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB7974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9abc5d-a7df-4950-3e3a-08de586c0694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjBVZC9oeFd4cEd5eUVoTnpvV0d3ZjNsYVl6c3FWWE02cU1QOTUxam52blBO?=
 =?utf-8?B?amNtbE9weEZaTlN0MzdFd21sVFZQTXRMdlVaUWZhZ2JrSHg1bnVNNlZRSVRZ?=
 =?utf-8?B?d3lMMlEreFYwMTRrRUxjd2FvZ0M0UG8wM0NYSGVRNXNNVjRoQTFjWWxzdGNV?=
 =?utf-8?B?YjJmSkFWWkNpRTRzT0RRMFIrRCtZWEVqTlhzR1FVc3VldExqY2IyWEJJTnl1?=
 =?utf-8?B?VEpCS1VQMDJYQ1BSQk1jblhZREQzeTBIS3hMcXZIV0tCT2pqT2xSVys0eEo2?=
 =?utf-8?B?STMwVncrUlRFVTlXd1ZnVUNVd3N5aGU0Z1dSQmRyUEI1b0NTK0xiUytPajJv?=
 =?utf-8?B?b29OUlFGbG50dUlpYTFBc1lwcDNzdlVwZG5qRjBsWk9kYjZTOW1hS1BYdFVN?=
 =?utf-8?B?Z2NZNmVxN3pBTmdndk0xMVFQYUVqU2tndHFkdWhWaE5xWmFSQ2xnTEZneHdY?=
 =?utf-8?B?RVRBUzVYTC9kaDE1L2lXMklvalE2cXBwSGtaZktPQ1l1TnUzUlgrRjFVTFZu?=
 =?utf-8?B?aTlKc3lpUlB2SzNUc3JBVWxYK2Exem4vY2Ztdkk3aVMyNXNzZGc2ajNnd0RJ?=
 =?utf-8?B?dzlOd0lYVHBidFprWFpRM3pYUzRuZmRHTnpDUm5uWjlKVTR6RU9YcmpoajYz?=
 =?utf-8?B?eDRwMnJRcDVuZHpValpXRWpZT2Q4bXhpNUlHY3VvUWRmTkdYdXRBUmVpOW43?=
 =?utf-8?B?UlAyeVRKVmRQVFNNSFdrTjlQSDFERGM2N2hIclpqUTlwT05iRzBNQXl3bDdQ?=
 =?utf-8?B?aWtZRUtCaFhzMVZHTVpjRU5aSlFubTBWSVNpUktVZUtUejZoajU5YXoyTmR0?=
 =?utf-8?B?RHhxbU9iVUFGcHBzcjkxaDZRSE1maTNMSG9MZHVLQ3ExT0o1U2NabndhdXBR?=
 =?utf-8?B?MjFNc003Y3VEZkVCUnJHSEREc0szbzdJckU2NXlxZmdtZWFJTjI1V3gyS1pv?=
 =?utf-8?B?UVFpTGxzaUtyRHVnTWEyOENBcEt4SjQrUmRneld2akRqd2hZVTB3WFFGcVkv?=
 =?utf-8?B?WXBJV2tMVEJ1eHdYRWg1MGg0SEdJOVpHQ09yVzBjODJyUlZPL0pzQ3BORUNx?=
 =?utf-8?B?ZjRIcnExME0wdmR0Z3VtOUU0THA2dno5dnJSaVdid213Q1MxK0dVOFlNeTBD?=
 =?utf-8?B?T2xyRzBTMHV1S2dMTld0clQyR0MzSFpURTdqOE9sTlJrbi9QZFQ5bFFqb0t1?=
 =?utf-8?B?cFFRdkF3OTFZSlZQM1I1dEFiSmNzOEFaelgrY1o4QktHSFVaWmZhSUVZc3c3?=
 =?utf-8?B?Y0F4ZjhzQXNMTkxiU0JGQjZnN0FSOExzSDFQTDlUVVpkSzAwdkZDeFlhQlMr?=
 =?utf-8?B?d0JNRVJBVFRBcEJEK3k5aTQ5VE5mM2o0OVlIK0pTeUJzSjVwdzN2d2Fyckk1?=
 =?utf-8?B?ZGlGR1JwcmVXQ0FiRWJyNHkxRlUvSHVZcFZzMjlMRFFYanN5Ky9iYVZKb28x?=
 =?utf-8?B?SXVjVFY3cmhqVkFPM21jcEpkSVNXdGIrWXRoODAyNnFFZ2NuQndCMndvWlpC?=
 =?utf-8?B?VGc4YmZpdm0waGhDT0dnL3NpV1d2cmZmcmhLM1BoTWJqb3FXM2pQeXRocXRS?=
 =?utf-8?B?UFI5NVVmem1hQXVIbldQMHVUWHoyZWJvTW96bmliRVJva1BBNVIwTEZCMDY5?=
 =?utf-8?B?WTc4UjZSMUxBWGRQVjNjVktTRVBrTXN0MDBtbzVlTWtEYUNsNHNtdjRDLzlK?=
 =?utf-8?B?VG5BaU5YcDdPQWhuT2g4MTlZa2ZIUzNwbXIvcTNxbmd0MnJxVnMxeFoydG1J?=
 =?utf-8?B?ZFZ6bTFUR0dIRllla0NReDlONUs1cXFrRzRteWlRWmk3TWVhRkhFMXJQb1FP?=
 =?utf-8?B?SStSaUR2S2pvbWFqajJoNnpQOGhDRlhJb0tjcVdLTFFJWTdyY3M2azNpMVJF?=
 =?utf-8?B?eFh6ZXdlbUZSL2V2V1Bqa2ZJYytZUzFnR3BFdW45R3VEYjI3cGtpOFBTOWtF?=
 =?utf-8?B?SlpnMU9TMDdjNkpBUUltcnZpZFdhUzc4VzJsQThVYlhaWmJReGhYSVJlSENw?=
 =?utf-8?B?VlM4OWoyVmFBSUpENzYxblU2RGNNMEJkbDA5WDhIdWw5NjFrV0pEcHl0M2Zm?=
 =?utf-8?B?VVlLOEZQdDErTDJYc0cwbE5QelRZWEd2M3BuSEFSOHhjMzdEc2tlbE93b1lQ?=
 =?utf-8?Q?5A4Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnlGS1BuVmlqNS92cnZwMnZxd1dHZ2NDNTdLNi81ZGxyVU1qTmZkU0JCK1Nn?=
 =?utf-8?B?eXBTZUFZN0U0dGwrYytRRElLdkt6bERXaUo0TEsxQkZvYzNrL0daejcxUzN0?=
 =?utf-8?B?c1FsYldLQlUzVXQ5YVlWemFxRWFRdWk5ODRzNVh6ZTRwSVdiazJaL2Q1RUZQ?=
 =?utf-8?B?dkx3MVQrZVBNY1pHUmpXRk9NbzJkQXdXTVFQd2VhRUtzTXJXQmNpcjlCS05s?=
 =?utf-8?B?My8ySFIwNktMei9XYjdzMGlPWk93eER3L2Zsc1hNbTdTUHpwQ0RBOFBnWDhP?=
 =?utf-8?B?VlVaN3JWY0hXQ1U2ZUVjS25DbFhXeWRxQ1F0NFhyb1hXZmNOOE1USjBhYzc4?=
 =?utf-8?B?b0xzZEJSZzhvaG9xb0xRNVhNbG5oRFZDVjc1M3R4YTRiMlNpM0RoL0JYeXky?=
 =?utf-8?B?dnFaZXdXZUFFSkIwRnVucm51N1VsZXp3VTlLNTBqNUFFai9VSnozQkpPSWpB?=
 =?utf-8?B?SjZYVnB4L3dyZlZydXNzYnZ6bjRjczl3czFPdmErSGFDWWI1WEozRnBkVTdh?=
 =?utf-8?B?RUpGNzdUaDdzSXNYRktLNC96eHpnamd2cFd4UnExZ3Q2WXdGSVFuZ2RRQ3gv?=
 =?utf-8?B?ZFU0M1kvTnZGbG05TzJlNW81bFBNd2ZOeGcycDJEL0Y5ZE9oUzBweDhtQlgv?=
 =?utf-8?B?Y1ZzcnlDRGRYNkU4NUxIUlRwSFNDTEZ3NXhScFZlWnlVNjdzb2h4N2RoQytP?=
 =?utf-8?B?anVhMjRtRDJ5WlFRQXBqRnA5Y0kxcHVzTGxKbGtVbklmRGt1NFh6R3hJb1FW?=
 =?utf-8?B?bWE1cVVYbUNzOXFXTFJ0NnBDeEFqS2lzcFF2RWhvTXFSa1dtTzlHWTcrVXBT?=
 =?utf-8?B?b216T1kwRzREcjllSW5UK1lDUE1rTHkvUzBwREVobEJlWjd4bFUyWFV2dzc1?=
 =?utf-8?B?Zy9PdFVmWU41VmxCaTBiTDBmQ09uWW5WZ243YTlpSkptRjlKcFQ4RS9BY2Zs?=
 =?utf-8?B?R01nbmlLelE3Qi9GWC9NS1o3Ulc3RlExT0dWRWl3SzlyZ2RzT1JBTE9OdHZ1?=
 =?utf-8?B?cmdnc3FRODRGcE9za2tMdlZPekc3TjhhSTdCUjdWR0JvalBKWEVoUmlJK0E3?=
 =?utf-8?B?ZjZ5TmcvRld4MS9SMGpZalJ3MGlSa2hWNHd3alNjRllNNlVrNmZ5dU8velFE?=
 =?utf-8?B?cis5dmRwSWpKUnRWVzl4c2tWSGxJMFQ4SzFaWXFpeEdVMkc0MDRhcGJQL1Nr?=
 =?utf-8?B?b2s4b1dsSkw5S2RTSktoVFg5VEYxN1F0NERyMkkyVU9VZ1ZuTG0vM0JGZTI1?=
 =?utf-8?B?ZEUyM3lnUzE5bm55S3VyclVwcnR2NzZLZFM0Qzh3R2F1TGRLYWhzTmc1cENM?=
 =?utf-8?B?Z2N1QXZ5d3RWbEIyUlpOODl2dHNpbUVTY1JZWThwZldDM0FYWGxrRzlrQnVs?=
 =?utf-8?B?bytGS3o5dE5DZ3huODBMa0VrRDJEZHBiRk4zR1hWN000SzhzdTNWSU41RDZ1?=
 =?utf-8?B?bGlDTVhQYy8xOENLaDhVZEwrUlgzOWlsdnZEK3h5aExTemF5ZkpyaG0zWk1X?=
 =?utf-8?B?R1VHQTJjWGxpYkNrZldKbDZWVjlyZEhYeXRzdXFzZytlY00vOU16N2dHV21I?=
 =?utf-8?B?b0h4ZDJIVS9NMHRaTk5Jb3BicE8xNnJGbEVWSDUvWnlWV2QrcjcvNm5GN3Rt?=
 =?utf-8?B?Y0RJQkhtWkFyNmNHRHNSc1dqTmgzb0JyYWJPOWdOaHlrMGkyVEFFeGtOOFBU?=
 =?utf-8?B?WS9sUW1Yb05BNVZ2UTgyMGZGb3lNOVpFTXVVNkpHcWlNcjYwcE14WElTdll4?=
 =?utf-8?B?eHVrRFVHc0pWZU1jcFJnN05TQ2wyY2hVbEdpSUVIRkVsM2VTRk1rck9yS0U3?=
 =?utf-8?B?MFp0U2paRWp3RDIwZjV3TFM4bC9ZQ3ZUMkNhOEFTalNGQzNmN0FiTFBkbm5o?=
 =?utf-8?B?RmltNnJta1lpY3lYQTh4MnA5aTBSVENsZzl0aWRsNGFFZXpiek0wZlZKQXBQ?=
 =?utf-8?B?cGZnRStiRTJ1U29qbENPeFBpRGJkODhRbjcrSkVIZENydmYxL3kxSytUdUFv?=
 =?utf-8?B?SzQyY3QvV2h6VUY1dmFRdFl1b25SS0ZJRHRwc20wcGxHNVdiMWJ2Q1B1bHc0?=
 =?utf-8?B?NTFCSFZsUmQxVGlGVmpPSko3WTdLUktCdWtLOTFZU3Nac0MvZlNTNjZRdnFY?=
 =?utf-8?B?RWx1MkhpL0s4Q0ltcTF2cTFSWnNSMStIWk9PUmtvQ1RwZDlGR0daUDRVWVUr?=
 =?utf-8?B?MFVqamRoWEVqMG1PV3FXV2RTTllHWDJ2RTRFV3kwQ0c4dmJxM0FYNHNXM2RF?=
 =?utf-8?B?eWRwTFlGL1FlMnBPRU93Yjk3MzlISExiYWM0NVBMZGNIQi9WWFRPYUtOWGtI?=
 =?utf-8?B?dHpJYXZuN0Q0ZEtUMVBVa0RBb1F0L2NxZ3BxNE14ZUdBOFFTejE5RDJoMnFH?=
 =?utf-8?Q?vo+qNk4Z6NKBr6mI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9abc5d-a7df-4950-3e3a-08de586c0694
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 21:36:52.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zh4bAIThG0s20xeXfil74hzHO9Qvm1pXsR0GQWyUt+N6rdHNDM8mcNPH9X/NpejwPiJFXsuUDxpvJv4+nUb8MFsJMRMMeTHl4VGxQAYKJfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7974
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



On 1/20/2026 10:02 PM, Matthew Brost wrote:
> On Tue, Jan 20, 2026 at 07:50:46PM +0100, Michal Wajdeczko wrote:
>> We shall resend H2G message after receiving NO_RESPONSE_RETRY reply,
>> but since GuC dropped that H2G due to some interim state, we should
>> give it a little time to stabilize. Wait before sending the same H2G
>> again, start with 1ms delay, then increasing it up to 1s.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> Should we model the sleep after the wq_wait_for_space algorithm?

while we can change the sleep pattern, this sleep here is not strictly
related to the VF recovery with 100ms expectation, but it is trying to
cover some generic HXG situations, where we don't really know for sure
what was the reason for H2G being dropped; and while as of today GuC
uses RETRY message only during VF being in MID-FLR state, we still 
can't tell how long this will take

> 
> Tomasz change that function here:
> git format-patch -1 a00e305fba02a
> 
> Likewise should we update the CT sleep algorithm too?

if we want to be sure that our reaction time is always < 100ms
then likely yes; but then we might also have to change logic
in xe_mmio_wait32, where we also have simple wait <<= 1

> 
> Matt
> 
>> ---
>>  drivers/gpu/drm/xe/xe_guc.c | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index 2a3b057fc828..3ba0ea015611 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -1397,6 +1397,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>>  	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
>> +	unsigned int sleep_period_ms = 1;
>>  	bool lost = false;
>>  	u32 header;
>>  	int ret;
>> @@ -1477,8 +1478,12 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>>  	    GUC_HXG_TYPE_NO_RESPONSE_RETRY) {
>>  		u32 reason = FIELD_GET(GUC_HXG_RETRY_MSG_0_REASON, header);
>>  
>> -		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
>> -			  request[0], reason);
>> +		xe_gt_dbg(gt, "GuC mmio request %#x: retrying after %u ms, reason %#x\n",
>> +			  request[0], sleep_period_ms, reason);
>> +
>> +		msleep(sleep_period_ms);
>> +		if (sleep_period_ms < 1024)
>> +			sleep_period_ms <<= 1;
>>  		goto retry;
>>  	}
>>  
>> -- 
>> 2.47.1
>>

