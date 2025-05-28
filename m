Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFD9C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 13:06:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865F410E1DE;
	Wed, 28 May 2025 13:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nI19cv67";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1616A10E1DE
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748437602; x=1779973602;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7tX2qMaQg9+OwvWN6RutwMFAwjKoNLL2Qh7xj9mQks8=;
 b=nI19cv67HM+MjcN1Uc4Bb+bH8Mors3pQDfeHwPp+gcgWaTUQ3q6CIjRH
 WvHmukmqyQT+rcmx579c6GK3HkQdpo5sCwOlqX7ym89xZu0Hv/R2pZn1W
 +j98hJ6Jx8NFke4CS0LVNQUWQhSamxU4Yo7fYQXbgoDQb1Bd86MpCkt+7
 RQjTrjw1HCNrn5AkMDsEN0TaDj4y43qD9uBRPyW03E0t5WGYtZXoAM9ej
 uSkSQNrQuMIIdtt6Vepg+oqSwDY0iOaL5C30sjPBT2Elsg+ARAagGgjIA
 w6gEIB14E86KdCXpe2gQplZdKXodw1kW+BnuvP+FdewF68AVi3uipGM3N w==;
X-CSE-ConnectionGUID: hagl4Md+Tf+YrsqhUZGrOQ==
X-CSE-MsgGUID: EJi+rg3KTMqaq3vc+83fkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61121578"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61121578"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:06:40 -0700
X-CSE-ConnectionGUID: OayrjUbmSOWJZfiVM/O3iQ==
X-CSE-MsgGUID: GNsFPVSWTbC3nec7SFc6dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="143875998"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 06:06:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 06:06:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 06:06:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.77)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 06:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXXtgvSPxfuHkKSk0GrmIG5XlJ0xONM+o3E5zUanKEp8KFo9NuIfs+SQtFM5TkEqJXdZyZh8YLIQgISWuTnqGv1v6WzhIO+HzCYX7utjBkkP/6L1uqo7rS2RGsIVtSxyV2hBqhtSgmp5vUGutwe05KhKkny9PikKBAQfgFwhf8xUE0SDm4u9zWwAnwF1LmgOSNGgQXT3IGXlmCldPXfYAP/9KKQ0dinYSOZXMPQ+30AMQ+Ib/DALMYXo6J7SE5+/bWyquobcB6eUV+fHh9ERQ+WxBYQka0y2FkcCvtpahWF2LBTfRzk7pjmzD5xDDCxwdIStrf2UOrYkjO+qvv2MAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tX2qMaQg9+OwvWN6RutwMFAwjKoNLL2Qh7xj9mQks8=;
 b=Ee7vg8i62QCnyoo7sV0aZZFCuDNSyPDOkE4CItcBkRMgQE2ZF7fZpsmVx7u6sWuXo45DOZ38/2wRpIyWTrszdTIYu4TOryADOF8j7C5lFiH05jm8HLfz2om8jdJoq3MYqJaM/EHZEHfJ+sTio4LfN3tRO2WqDxWc7SIp9AZZYyrbxiKspkTlC2HCRQq4L+toVkNV6yeH/fX6cr0Of3xrgHn/SiRKQqo6a49A2x9Y9jt7dazSuDGTboWNpumm4DSk0RdtISpg06r8SYSUcBw4ZvDVvcQfHQQIFncvmI/QYNCpSiaxCmcIX2rvcYROWuB0B+4cVlNPw1tstyKRVXMz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 13:06:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 13:06:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Tseng, William"
 <william.tseng@intel.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v3] drm/xe/sched: stop re-submitting signalled jobs
Thread-Topic: [PATCH v3] drm/xe/sched: stop re-submitting signalled jobs
Thread-Index: AQHbz8SH5g4FxMr8Wk+Qt063LF2wULPoAsGQ
Date: Wed, 28 May 2025 13:06:36 +0000
Message-ID: <SJ1PR11MB6204E84396E9C554AE7E80328167A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250528113328.289392-2-matthew.auld@intel.com>
In-Reply-To: <20250528113328.289392-2-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DS7PR11MB6295:EE_
x-ms-office365-filtering-correlation-id: 65795776-3b6e-4903-7232-08dd9de87a5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ODVrNUQ1UUVBV2pEZ3FzUkNDcUkxNjI0Z0V6Ly9VaDRMd2VEREFCZkRSRUNk?=
 =?utf-8?B?bTF3QW1TZDFvQldWRDVFS1BkZWg1T2hEQ3JEdG5Ba2xjSnp2MTNOSVRIekkw?=
 =?utf-8?B?WlExa2pCb2tCdTZ5anJVYVdaL2loaytTVkhRc1ZLZkU2VERpVUI3RnMzNHl5?=
 =?utf-8?B?NkZseGhKRUdTYXhRRUpvdnRVRi9jNk9JODdBeVNpSTZ5R3NXRkNZdU5jRFNM?=
 =?utf-8?B?MXdDTk5IVHE2RFBZR0g0YVQ4RDIxVENLb0d5OXZkWlE4VVhIQjVESktza1dG?=
 =?utf-8?B?eUhIR3hVWE03MG5HME9ldzdhdnZ3akp4dHJxMDNuZmdJekRDekZ4a0c5Q0RB?=
 =?utf-8?B?RjlXSGsrM2hWaEx6R1YrQmpoRm5rOVFDeW9lZVZXcWlJOXVSVEJ2YW8wTW03?=
 =?utf-8?B?bE5WMklnWHgwT2RPaDhDc0M5d2lMc3JuMTZxTHJOUmttVzZJbWIyMXRMZWgr?=
 =?utf-8?B?VGdZV2pBRXRrb1hzZVpBUGJYN0FLdC8xbzFkV1RvUmVISUo4WTI5ZjJ6S0NZ?=
 =?utf-8?B?aC9LRGZvWCtrSi8yV1BjT0pZRERLTWRlNWE2dTFVOTJESlVQbmZ4elhJNUlt?=
 =?utf-8?B?ZHNLQWlIWjNXTUtzZDU3MWQ4UzlXMEpuZ2hvOWVRdWhyUWNjcS95UU9tbVlR?=
 =?utf-8?B?YWJTVENsTGxWTi83VzN5UEx0bzQxVHJTUWp1MUY2eUhtNTIvMUtrS24yYnFS?=
 =?utf-8?B?MHoyK1RxTG4ydXJXNURaa3ZPa1NtMFhFemM0ZVFnOS9jaUYrMGVqVkFad2pS?=
 =?utf-8?B?M2thY1g2VVhNNWxaQXhPVW9iNFJtWWhzZit1dTAxem1pT2U5QmltdGYxZlIx?=
 =?utf-8?B?UE5GYnk2aDlFY3BUcVM5RnNlK1QvMkhkdmhSdENxT1JBMXJCckovNGxWQVhH?=
 =?utf-8?B?Q29PZElXMFAvNjFvNUpmamZ2OFAzS21xZ3lybUIwbmxkTXRtNjI4d3JLbUR0?=
 =?utf-8?B?c244ZmEyUEIvUnp0NjFaRmFQVHJVVHVZeHNnZTlmSXYzbSs5Y0oyU3dYMjBY?=
 =?utf-8?B?bnlodkFaRFlRTk1zUURGTWwwTXlUMkl6RXVlR1VtUXNxbDBrR216Vmp4a1ZD?=
 =?utf-8?B?andIVG53dlZjbThnNU5CeDN6bFZoMFdvcXZjekM5RHFLZ29GNnQxQUFuUnJX?=
 =?utf-8?B?cU9oUTE1bFZxem9ONzJzWnFYZVFZVjM1bFU2NThoUHc5UmsrZ2N3ZDUwYmNG?=
 =?utf-8?B?Skg3TXBxUlh1R2h6eDlsS3R0OGwzYlJWd1BXNEhMVjBrQk41dFNqdnBHVExI?=
 =?utf-8?B?UHlock14RmFWTFAxWi9INWlTRTlaZmxkTnFMbFFNYzJoODhlRlN1VUQ4emVP?=
 =?utf-8?B?UlJFUVdFTzJ1TndZdjAvdE41b2wrRmd2SmkvWTNQaDZVajNkalc1SzI4Z2RX?=
 =?utf-8?B?K29wNHNjTys4WjlKamlzQUYzdzNoN2FCeklYVzRjZ0lteWE3dVBjWnNKSldp?=
 =?utf-8?B?SDlSSDVaUkplRFpTcStTSHVFR21NME53UmhIdWNnVFkxSGFYcktiM0xKMlNm?=
 =?utf-8?B?OWV2eVJMVUtMaXBzRmg0cVlzTzloVlJsaHZpREFVazVLYllMMEp3Q2dsZnZC?=
 =?utf-8?B?M0dldnhaSkZxWU5qSFRYVW1sZ3NZWmE2N0F0N0ZqU2JaMkVaVGkxanRDeE43?=
 =?utf-8?B?N0RJZUhFYlM4Ui9aQndvQzV1RUZ2S2t2RTN2RE52N0hURFd0VUJyazRRMVl6?=
 =?utf-8?B?amJqZjA1czlRbUVBeFpWSzhTbXduMVhncENDU2c5aDFVbWtXV01Pb3JzT0xz?=
 =?utf-8?B?d21YU0R0dmFQL2hRZDMvZTVDOTh4MFN0YXpCclUvVEJIYjRZMXNsSkdvRHor?=
 =?utf-8?B?MWhwcGhReE55OTVKZ2pQR0ZDZ2xNMy9RdGhsa1gyeHUwei9vVWpiWXZuclp1?=
 =?utf-8?B?SmptK05JTENyYVQwT0dsLzlYN0hZVWtzYUd5L1FLRGJxRTF6UUtRc0kzZEkz?=
 =?utf-8?Q?N8+n3cnjyX8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlR5bkFJRVExdGF2ZzlkcHMrNjIyQUtzZ2FPbFVPQWZnSS80Q0JFMFNMV0px?=
 =?utf-8?B?TnF4WjVTSmN1bUlYUEhlSXR1dHZGVlJJTVZtLzNKRFRCK1EvNURTS2JtcXRY?=
 =?utf-8?B?eXVqTUd3K3BGb2JDMEtqT2d1VFdXdUswNWI2aFVwV2kyNHJqQTc3QlBvWlE5?=
 =?utf-8?B?eXhpUldMN0RJQVVuaHVkcVUweThVWmUwQkJoc1krQVNmR202bXhQVW1vbzFN?=
 =?utf-8?B?bjVGRHUyTTk3TDRaRUcwQ2V6KzJCbTF2L2dITzFNaHlQanZ1bTJDSFh6NkUz?=
 =?utf-8?B?U3FjMTl0RTM0WWoxc2FMbVliYXlFd2pKc3k2dVlPWEEvRnYyRFdld25RSG9F?=
 =?utf-8?B?M0lFL0lpdnlJVldWeEtxL0tJMFdNVTMrSXRkcEp4TWhXQjNaMGk0UnRmOWxn?=
 =?utf-8?B?cjVlak1QejF5cmwvQzlRS2p2aXUwZUVXL3ZEWHhlbHAvdEJ2M1V0NG1WTWlL?=
 =?utf-8?B?Y1ZqNFlTa3pETU1RdWRWWGtGeXlDQTZTNFJ6WnB1dEJTRE9uaE4waTNUWndV?=
 =?utf-8?B?Mm5icjZvcnlNOHhxcGxpa1dGVnliSjBESUhKank2R2kvNkpLUkhBcHd4cThF?=
 =?utf-8?B?ZkVJU1FMT2xudDZTMkFwNmIrRW85NEhpanFlTytJRXZtUVVVdEdIK0RwbjBx?=
 =?utf-8?B?bVRoK21IOTBlMkg4dHpyU3VVUVFVYXlvd3lwMzE0VTRvWjRZUGNtbHJuZnJN?=
 =?utf-8?B?V1RvYVM4WUl1czgxb1hhTnptL0FPWVA3am5MaHZFckFXWHBKcXZremFDSUJ6?=
 =?utf-8?B?a3dLc3FJejJKUlNQQ3dZMHFlZnRPZmt1Q0FiWit3ejc3TlgzK1J2VHVGbVJ3?=
 =?utf-8?B?L0lybHRndlhaNUFrRmljVnQ4dXNRMnZENng0dUkwWHM3MXh1VlZSTDVaNFNV?=
 =?utf-8?B?VWpCa21oSEdhTVJmamFReUZHSFlJNzZ1RGZwaUh4T3AzZkxZTCtGQmF1Y3M5?=
 =?utf-8?B?cG0vUUJBcnVCMGNLTHltYzhhL1pyeXoxclF2ZWlLSkhTTVB1UmR6TVJMSkxQ?=
 =?utf-8?B?dVZVdjNNNzg2QjFiQ1RVKzVpUlNCcXhBS0lUNjdaZUJvV3NuMWVoZmpmMG1L?=
 =?utf-8?B?aWNWeTV1VlpwMzhSYnlvS1hqUk1WbFhwM1k5U2p3QkRha0V4OGhrZEx5UExZ?=
 =?utf-8?B?SGRnV1JNT0toMHlRNU1Eem82VnQ0RjdpUk14cEd1Y3k1VW9UY3Fmak9pYWhL?=
 =?utf-8?B?SUJRL0s3OXZYcGNyMjZ2WjVEMHJFTnUxQmo5UjdBTEFueTdtSnlQN3ZtNGNX?=
 =?utf-8?B?azVsdzMydjc5OG9oU25XOTRLM2NmYTdxRDdkZkdIQUxoeUxlekxzaDFtMVhi?=
 =?utf-8?B?dUxpVHAwQ2Z6SThRZTBySy9rbUR3d3ZyaXc5STUwWDQraTZOZGRiS0l4eHdv?=
 =?utf-8?B?SUNKcmdVQ1Z3aGhtRmtKNnRBQnpscThGRlpZWHdxQThFdmNROXFRVWhNY2NS?=
 =?utf-8?B?ZzVJSmRadTZnaFJzdFBONFoyM1pPbGo0Um1mdjFreFIzaXFIRDZkUTE2WGRr?=
 =?utf-8?B?cG5OQTVXd3p3bXV3andLMXZTRmdRMS93RUlmTVhVOUN2M2JsQWNkamV6azJC?=
 =?utf-8?B?bjQ4ZkNrM09sMk1KTDUvQWlvTVdDZ0ZmZzR3dVhJWndkVmFNMG15VVpwMjFi?=
 =?utf-8?B?T21nVkhTdEdTeEN5WXd4MmVOVzVISGFsWU9pMk92RSs0d01kazJRQ3pxOEdM?=
 =?utf-8?B?ajQ5NG9DMVM0MmRkTmtKTVVFTmt4MEMrN3ZMQ2xiRzJyK1hWUC9NSjEyc0tE?=
 =?utf-8?B?dkdIQWZHR1Y1VVZ0YmtkR2Y2bDNlMkZ3VlhMdVBqZUpmUzZ2V3crQm5nK3pX?=
 =?utf-8?B?VWhXcWNkeXBzc3hVaDJXbzVvTU9McnJjeFJzalZTSFFxbmhBY1BPNmRuOWc0?=
 =?utf-8?B?RmpoRCtJMFZLOTVLMUhPcHFvMnhlNW51L09SWWpQOTU5ekh3K3JNeE1yNXpE?=
 =?utf-8?B?d3Z6U3VNSkpxWkhFN3NYVTBabTY2R0gvSmRNbExpKzBZN2NDT3c0eWcxN0kr?=
 =?utf-8?B?OGZ4YjJSR3puS3R6N0hvOWRZdG90aVpMSmRaUy8xU0RYVGt4SzhTQUYrUnJK?=
 =?utf-8?B?L0dRdzE2R2QybEVKb1NXQXk5KzdRRjlVcUdsMnB5Y3FlU2gyVTZ5aFFVMmxx?=
 =?utf-8?Q?vWwbPWmGAFBv2oUIYPZwYpEZy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65795776-3b6e-4903-7232-08dd9de87a5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 13:06:36.7092 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HC9deMNiyCp+/gu0OmjKfZmKTMMxbyqp42nO1N3IfpVAmfIsm4Ps29rMd+qaPXxyZXJQ7OyEa00G0f7Ts/XtA5SRB6tlh0NBxFiV7icQSx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gTWF0dGhl
dyBBdWxkDQo+IFNlbnQ6IDI4IE1heSAyMDI1IDE3OjAzDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9t
QGxpbnV4LmludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IFRzZW5nLCBXaWxsaWFtIDx3aWxsaWFtLnRzZW5nQGludGVsLmNvbT47DQo+IHN0YWJs
ZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIIHYzXSBkcm0veGUvc2NoZWQ6IHN0
b3AgcmUtc3VibWl0dGluZyBzaWduYWxsZWQgam9icw0KPiANCj4gQ3VzdG9tZXIgaXMgcmVwb3J0
aW5nIGEgcmVhbGx5IHN1YnRsZSBpc3N1ZSB3aGVyZSB3ZSBnZXQgcmFuZG9tIERNQVIgZmF1bHRz
LA0KPiBoYW5ncyBhbmQgb3RoZXIgbmFzdGllcyBmb3Iga2VybmVsIG1pZ3JhdGlvbiBqb2JzIHdo
ZW4gc3RyZXNzaW5nIHN0dWZmIGxpa2UNCj4gczJpZGxlL3MzL3M0LiBUaGUgZXhwbG9zaW9ucyBz
ZWVtcyB0byBoYXBwZW4gc29tZXdoZXJlIGFmdGVyIHJlc3VtaW5nIHRoZQ0KPiBzeXN0ZW0gd2l0
aCBzcGxhdHMgbG9va2luZyBzb21ldGhpbmcgbGlrZToNCj4gDQo+IFBNOiBzdXNwZW5kIGV4aXQN
Cj4gcmZraWxsOiBpbnB1dCBoYW5kbGVyIGRpc2FibGVkDQo+IHhlIDAwMDA6MDA6MDIuMDogW2Ry
bV0gR1QwOiBFbmdpbmUgcmVzZXQ6IGVuZ2luZV9jbGFzcz1iY3MsIGxvZ2ljYWxfbWFzazoNCj4g
MHgyLCBndWNfaWQ9MCB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIEdUMDogVGltZWRvdXQgam9iOiBz
ZXFubz0yNDQ5NiwNCj4gbHJjX3NlcW5vPTI0NDk2LCBndWNfaWQ9MCwgZmxhZ3M9MHgxMyBpbiBu
byBwcm9jZXNzIFstMV0geGUgMDAwMDowMDowMi4wOg0KPiBbZHJtXSBHVDA6IEtlcm5lbC1zdWJt
aXR0ZWQgam9iIHRpbWVkIG91dA0KPiANCj4gVGhlIGxpa2VseSBjYXVzZSBhcHBlYXJzIHRvIGJl
IGEgcmFjZSBiZXR3ZWVuIHN1c3BlbmQgY2FuY2VsbGluZyB0aGUgd29ya2VyDQo+IHRoYXQgcHJv
Y2Vzc2VzIHRoZSBmcmVlX2pvYigpJ3MsIHN1Y2ggdGhhdCB3ZSBzdGlsbCBoYXZlIHBlbmRpbmcg
am9icyB0byBiZQ0KPiBmcmVlZCBhZnRlciB0aGUgY2FuY2VsLiBGb2xsb3dpbmcgZnJvbSB0aGlz
LCBvbiByZXN1bWUgdGhlIHBlbmRpbmdfbGlzdCB3aWxsDQo+IG5vdyBjb250YWluIGF0IGxlYXN0
IG9uZSBhbHJlYWR5IGNvbXBsZXRlIGpvYiwgYnV0IGl0IGxvb2tzIGxpa2Ugd2UgY2FsbA0KPiBk
cm1fc2NoZWRfcmVzdWJtaXRfam9icygpLCB3aGljaCB3aWxsIHRoZW4gY2FsbA0KPiBydW5fam9i
KCkgb24gZXZlcnl0aGluZyBzdGlsbCBvbiB0aGUgcGVuZGluZ19saXN0LiBCdXQgaWYgdGhlIGpv
YiB3YXMgYWxyZWFkeQ0KPiBjb21wbGV0ZSwgdGhlbiBhbGwgdGhlIHJlc291cmNlcyB0aWVkIHRv
IHRoZSBqb2IsIGxpa2UgdGhlIGJiIGl0c2VsZiwgYW55IG1lbW9yeQ0KPiB0aGF0IGlzIGJlaW5n
IGFjY2Vzc2VkLCB0aGUgaW9tbXUgbWFwcGluZ3MgZXRjLiBtaWdodCBiZSBsb25nIGdvbmUgc2lu
Y2UNCj4gdGhvc2UgYXJlIHVzdWFsbHkgdGllZCB0byB0aGUgZmVuY2Ugc2lnbmFsbGluZy4NCj4g
DQo+IFRoaXMgc2NlbmFyaW8gY2FuIGJlIHNlZW4gaW4gZnRyYWNlIHdoZW4gcnVubmluZyBhIHNs
aWdodGx5IG1vZGlmaWVkIHhlX3BtDQo+IChrZXJuZWwgd2FzIG9ubHkgbW9kaWZpZWQgdG8gaW5q
ZWN0IGFydGlmaWNpYWwgbGF0ZW5jeSBpbnRvIGZyZWVfam9iIHRvIG1ha2UgdGhlDQo+IHJhY2Ug
ZWFzaWVyIHRvIGhpdCk6DQo+IA0KPiB4ZV9zY2hlZF9qb2JfcnVuOiBkZXY9MDAwMDowMDowMi4w
LCBmZW5jZT0weGZmZmY4ODgyNzZjYzg1NDAsIHNlcW5vPTAsDQo+IGxyY19zZXFubz0wLCBndD0w
LCBndWNfaWQ9MCwgYmF0Y2hfYWRkcj0weDAwMDAwMDE0NjkxMCAuLi4NCj4geGVfZXhlY19xdWV1
ZV9zdG9wOiAgIGRldj0wMDAwOjAwOjAyLjAsIDM6MHgyLCBndD0wLCB3aWR0aD0xLCBndWNfaWQ9
MCwNCj4gZ3VjX3N0YXRlPTB4MCwgZmxhZ3M9MHgxMw0KPiB4ZV9leGVjX3F1ZXVlX3N0b3A6ICAg
ZGV2PTAwMDA6MDA6MDIuMCwgMzoweDIsIGd0PTAsIHdpZHRoPTEsIGd1Y19pZD0xLA0KPiBndWNf
c3RhdGU9MHgwLCBmbGFncz0weDQNCj4geGVfZXhlY19xdWV1ZV9zdG9wOiAgIGRldj0wMDAwOjAw
OjAyLjAsIDQ6MHgxLCBndD0xLCB3aWR0aD0xLCBndWNfaWQ9MCwNCj4gZ3VjX3N0YXRlPTB4MCwg
ZmxhZ3M9MHgzDQo+IHhlX2V4ZWNfcXVldWVfc3RvcDogICBkZXY9MDAwMDowMDowMi4wLCAxOjB4
MSwgZ3Q9MSwgd2lkdGg9MSwgZ3VjX2lkPTEsDQo+IGd1Y19zdGF0ZT0weDAsIGZsYWdzPTB4Mw0K
PiB4ZV9leGVjX3F1ZXVlX3N0b3A6ICAgZGV2PTAwMDA6MDA6MDIuMCwgNDoweDEsIGd0PTEsIHdp
ZHRoPTEsIGd1Y19pZD0yLA0KPiBndWNfc3RhdGU9MHgwLCBmbGFncz0weDMNCj4geGVfZXhlY19x
dWV1ZV9yZXN1Ym1pdDogZGV2PTAwMDA6MDA6MDIuMCwgMzoweDIsIGd0PTAsIHdpZHRoPTEsIGd1
Y19pZD0wLA0KPiBndWNfc3RhdGU9MHgwLCBmbGFncz0weDEzDQo+IHhlX3NjaGVkX2pvYl9ydW46
IGRldj0wMDAwOjAwOjAyLjAsIGZlbmNlPTB4ZmZmZjg4ODI3NmNjODU0MCwgc2Vxbm89MCwNCj4g
bHJjX3NlcW5vPTAsIGd0PTAsIGd1Y19pZD0wLCBiYXRjaF9hZGRyPTB4MDAwMDAwMTQ2OTEwIC4u
Lg0KPiAuLi4uLg0KPiB4ZV9leGVjX3F1ZXVlX21lbW9yeV9jYXRfZXJyb3I6IGRldj0wMDAwOjAw
OjAyLjAsIDM6MHgyLCBndD0wLCB3aWR0aD0xLA0KPiBndWNfaWQ9MCwgZ3VjX3N0YXRlPTB4Mywg
ZmxhZ3M9MHgxMw0KPiANCj4gU28gdGhlIGpvYl9ydW4oKSBpcyBjbGVhcmx5IHRyaWdnZXJlZCB0
d2ljZSBmb3IgdGhlIHNhbWUgam9iLCBldmVuIHRob3VnaCB0aGUNCj4gZmlyc3QgbXVzdCBoYXZl
IGFscmVhZHkgc2lnbmFsbGVkIHRvIGNvbXBsZXRpb24gZHVyaW5nIHN1c3BlbmQuIFdlIGNhbiBh
bHNvDQo+IHNlZSBhIENBVCBlcnJvciBhZnRlciB0aGUgcmUtc3VibWl0Lg0KPiANCj4gVG8gcHJl
dmVudCB0aGlzIHRyeSB0byBjYWxsIHhlX3NjaGVkX3N0b3AoKSB0byBmb3JjZWZ1bGx5IHJlbW92
ZSBhbnl0aGluZyBvbg0KPiB0aGUgcGVuZGluZ19saXN0IHRoYXQgaGFzIGFscmVhZHkgc2lnbmFs
bGVkLCBiZWZvcmUgd2UgcmUtc3VibWl0Lg0KPiANCj4gdjI6DQo+ICAgLSBNYWtlIHN1cmUgdG8g
cmUtYXJtIHRoZSBmZW5jZSBjYWxsYmFja3Mgd2l0aCBzY2hlZF9zdGFydCgpLg0KPiB2MyAoTWF0
dCBCKToNCj4gICAtIFN0b3AgdXNpbmcgZHJtX3NjaGVkX3Jlc3VibWl0X2pvYnMoKSwgd2hpY2gg
YXBwZWFycyB0byBiZSBkZXByZWNhdGVkDQo+ICAgICBhbmQganVzdCBvcGVuLWNvZGUgYSBzaW1w
bGUgbG9vcCBzdWNoIHRoYXQgd2Ugc2tpcCBjYWxsaW5nIHJ1bl9qb2IoKQ0KPiAgICAgYW5kIGFu
eXRoaW5nIGFscmVhZHkgc2lnbmFsbGVkLg0KPiANCj4gTGluazogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNDg1Ng0KPiBGaXhlczogZGQwOGVi
ZjZjMzUyICgiZHJtL3hlOiBJbnRyb2R1Y2UgYSBuZXcgRFJNIGRyaXZlciBmb3IgSW50ZWwgR1BV
cyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHRoZXcgQXVsZCA8bWF0dGhldy5hdWxkQGludGVsLmNv
bT4NCj4gQ2M6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVs
LmNvbT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBD
YzogV2lsbGlhbSBUc2VuZyA8d2lsbGlhbS50c2VuZ0BpbnRlbC5jb20+DQo+IENjOiA8c3RhYmxl
QHZnZXIua2VybmVsLm9yZz4gIyB2Ni44Kw0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9ncHVfc2NoZWR1bGVyLmggfCAxMCArKysrKysrKystDQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2dwdV9zY2hlZHVsZXIuaA0KPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
cHVfc2NoZWR1bGVyLmgNCj4gaW5kZXggYzI1MGVhNzczNDkxLi4zMDgwNjFmMGNmMzcgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dwdV9zY2hlZHVsZXIuaA0KPiBAQCAtNTEsNyArNTEsMTUg
QEAgc3RhdGljIGlubGluZSB2b2lkIHhlX3NjaGVkX3Rkcl9xdWV1ZV9pbW0oc3RydWN0DQo+IHhl
X2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPiANCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCB4ZV9zY2hl
ZF9yZXN1Ym1pdF9qb2JzKHN0cnVjdCB4ZV9ncHVfc2NoZWR1bGVyICpzY2hlZCkgIHsNCj4gLQlk
cm1fc2NoZWRfcmVzdWJtaXRfam9icygmc2NoZWQtPmJhc2UpOw0KPiArCXN0cnVjdCBkcm1fc2No
ZWRfam9iICpzX2pvYjsNCj4gKw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnkoc19qb2IsICZzY2hl
ZC0+YmFzZS5wZW5kaW5nX2xpc3QsIGxpc3QpIHsNCj4gKwkJc3RydWN0IGRybV9zY2hlZF9mZW5j
ZSAqc19mZW5jZSA9IHNfam9iLT5zX2ZlbmNlOw0KPiArCQlzdHJ1Y3QgZG1hX2ZlbmNlICpod19m
ZW5jZSA9IHNfZmVuY2UtPnBhcmVudDsNCj4gKw0KPiArCQlpZiAoaHdfZmVuY2UgJiYgIWRtYV9m
ZW5jZV9pc19zaWduYWxlZChod19mZW5jZSkpDQo+ICsJCQlzY2hlZC0+YmFzZS5vcHMtPnJ1bl9q
b2Ioc19qb2IpOw0KPiArCX0NCg0KV2hpbGUgdGhpcyBjaGFuZ2UgbG9va3MgY29ycmVjdCwgd2hh
dCBhYm91dCB0aG9zZSBoYW5naW5nIGNvbnRleHRzIHdoaWNoIGlzIGluZGljYXRlZCB0byB3YWl0
ZXJzIGJ5IGRtYV9mZW5jZV9zZXRfZXJyb3IoJnNfZmVuY2UtPmZpbmlzaGVkLCAtRUNBTkNFTEVE
KTshDQoNClRlamFzDQo+ICB9DQo+IA0KPiAgc3RhdGljIGlubGluZSBib29sDQo+IC0tDQo+IDIu
NDkuMA0KDQo=
