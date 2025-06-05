Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38CAC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 16:26:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 914CB10E29A;
	Thu,  5 Jun 2025 16:26:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VD0HOFIK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A3510E29A
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749140786; x=1780676786;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TvP4QVjwNBaL8i5vi8iUZwflhee4eogsMdNSZ5+3wVM=;
 b=VD0HOFIKToZIRs6IeFlBQjOt2p8tXcENd+aAuN5+do8QQa4tBDqKcUWC
 KV4cWxumy+t6wil3yku1imScQsyawXlHgt6lmITft7WRz492VstVtE7y5
 qMHe5CrIaOXyzwBcJcafRjoKzO+cXGaj7fY0BhnU3F1bU6ilm7Nz4Y35/
 44yVVSXjFcoE9nJgv6nL6mdg370xnZcCSB5zntKMY2ag7HjTpTcX1fkvw
 5BCvjDw02r7vr7dtzUky6fVkFDt29Fp8iCKLLJaYsDle7kEV661EQLuZ0
 uYozM1GqN+R7ZeYM+Rw2t6anwzcsim/eNxzzXiQ6/nTuKuWOo668Y9cMj w==;
X-CSE-ConnectionGUID: Nv9UZA0ZQGC4gyusU/wEqg==
X-CSE-MsgGUID: yjwbP2xtQGO2eYU87H1AfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="55077020"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="55077020"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:26:26 -0700
X-CSE-ConnectionGUID: aUInVN8BS5iC0lIcf48b3g==
X-CSE-MsgGUID: sA+n5+UsQSe7F4Uh6bXQ0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="145528749"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 09:26:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 09:26:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 09:26:25 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.88) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 09:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhLNjn6BFCCpGHo6bxaEGGt2upRBss+mu24UTCHxL1gRG86yOueFImSlr7ioa6RmjZP7KJG3i/3F6kTyfvbAjPl5hcsGfL9+b/H7Nznt5STg9ZMykMz4ZrsEsn0X/Wd0HiUDKtu5z6d09Zld1zN6dVFKmbq10/F6duhI8VnPhCstj/KKX4uuS15p9+l6Q5nGhJ+HLTa0hlcsHq7kwQDnFUnkVAR+3PxdS9Z9/255Oo8vKj+/kIwl48ujKAtRIHFk/efRMRYOWG8TW3ryWQZXp2zeI3wPes82JH00TIlzfhjsa18lzLnUsTw2q+W92A20is2tWci25v3bcTT8A4lGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EobR6BcBmUi1B0E5E2etE+TlXD28d6xEWxcQ71bdqwI=;
 b=sNwk0O+so1No84w82/YEex5u0JhSB+duDD/w+RxlBRZI2G2CUBhJvsmBhErXnju9nBHIk+jWCrJ9SKX9TvBou4I5T5V0SD3EGdA7LFZhJKoRphRRjYbb9J7iMdjvCN05nEq/pgaozxyfKyJORuZYyb5fWHydhhBwTQ2qQeolTUSduNB+wwnxjPLDAzv+IzX1Qjq6hildOSkP9cL4woEcjv/jeyDQ7Xv84c4IcHVWrWW1Sk7e4OpkgyRc8+xLug2hiTgeIjZU0SmasL3SBpOQTfO2U9fZs4c67ZlrzXo5Hxaj3Hqb4OCYGFJH0MtzzYc4gUDCO/oKkqHr0rNu8mD38A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DS7PR11MB6037.namprd11.prod.outlook.com (2603:10b6:8:74::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.37; Thu, 5 Jun 2025 16:25:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Thu, 5 Jun 2025
 16:25:54 +0000
Date: Thu, 5 Jun 2025 09:25:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/5] drm/xe/oa: Enable OAM latency measurement
Message-ID: <aEHE_8PsycJH01J8@unerlige-desk.amr.corp.intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
 <20250603202133.2713863-6-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250603202133.2713863-6-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DS7PR11MB6037:EE_
X-MS-Office365-Filtering-Correlation-Id: 4292bbc7-8668-4d53-76c0-08dda44da506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmpoREZvTHRlWVJEOVIxWHdOMmZLemY5ZFpoeTl1L2ZweHJSYnFaR0xtK3VJ?=
 =?utf-8?B?L2o3L21KcGtSTlR4NnM2MXJadmFjY1ZMNG14bHFmS0lNSVBLV2JRMUZWQThh?=
 =?utf-8?B?bHpaNjdjNnZKYWdOdXkyOVJpbkxIZFBqOW1PU3Y2eEVzbXVTUVNXWCtqblBO?=
 =?utf-8?B?MlpkdWhDaVdJcGZpT29BZWlrQmJESjRtOXNwOTZqRFpjTjJCS0FoQWt4SVhO?=
 =?utf-8?B?ZGR1VzErY3JQQlVBQmViQlllUXhqNDVtMGZnK3ROTFVNRUt6NU04SDU2SVlX?=
 =?utf-8?B?TlNzdHZ5VnZvK0o4eGJsY2Z3QW9NcnljNnhNNkwvN3VVOERPazBqRjYxOXd6?=
 =?utf-8?B?RDduM3J2YngwNWdWNWZpQ2hia3NtWlZvUklaeldaSzlRMys1NWZMTzVuRDky?=
 =?utf-8?B?cEQ1YnZ3cjRScjh5STZQUUgwbjBJRmpoRjBjRDZVTWtoa0UrNjdvQVUvTGp0?=
 =?utf-8?B?RFlXRmNCMnBsZnhlK1FhOE4xVEhqVHVuUWFvNjFDZmNpMnZHVjdVL201R0hU?=
 =?utf-8?B?WlFLWlRBenNTb09WTVR2dytRMkgycjNnUjVSQ2VDeFd5RzRhRktFblV0RnJH?=
 =?utf-8?B?cWlTb21qcjgrYVl1RUE1aVBscFNldFlRdWJVTDFwTndaVTVKT2NOU0ovZVhG?=
 =?utf-8?B?RXRKZjA2VE5oK0RsblBWTU5UZ2trcEd1dTFmUXFRM0xHdUpJd2hxM1BCb3NR?=
 =?utf-8?B?YStGTFlMRFpweEViVGtuNjdiTlc3K0ZaVjB6a25iL08vQjJoNDFRNGZkaC81?=
 =?utf-8?B?cmtpa1FydVhJT2kycGNEckUvNnEyQWNRSXZTM0JJbm40NjY1K08yTVVLMk1O?=
 =?utf-8?B?cVZTZkk0amFjV2F2QlVwaHBHYUtSYXJJdTRaODVhcXpxOUxUNHNsak52WUlR?=
 =?utf-8?B?dWo5OVN2c3ljcCtHTEIwcDV3b1VkSzFNc0Y3NDNPNFdYZm5GTXFUbEtwK0Fo?=
 =?utf-8?B?VTl6djhjZStjR1dGN0dLMXcrQzNXQ3BPYTQrNHZPTlNIQ21SckJveVBsMXky?=
 =?utf-8?B?VXo3VU5uYWpzQ3RpUzNFc1FoOUxyL3UybTBvdDNrN3ZNc1AyWjNQWGVMdjQz?=
 =?utf-8?B?RzF4eTNrc24rRk1RaDJZUC9qVTZwQnpvRHFYU1Z1aHFJTWl3RmRSeHR5QVpO?=
 =?utf-8?B?dWZVbEZiYmVycXRuOUhzL3lOdi9YOGdqVmhyVGw0ZWhxWGRmcUJpd2tOYS92?=
 =?utf-8?B?YUN6cURYcHpWUFNHa0NVMXM2K1hZQnJnc3NWbmduVkY2VTBqNHQ3SzRNckVu?=
 =?utf-8?B?M1F6OVRYbkc3Skxyd0YrdUtUcjBZVHNPQ1ZhSFJHUExvTEk3U243UFM1V3ZZ?=
 =?utf-8?B?b2JPVWZuZkl6eldULzRCdDF4WTFKRFAxUHhoajIzRm5PeFgrV1RlbndxeGt0?=
 =?utf-8?B?NHFjeFgxQWEvc2NORlFBTW03aXNqYlRMaC83bDRobWQwTW9DeTEycEpGREl3?=
 =?utf-8?B?ZGtpVlphUy9CbTVEM285ZHNoUEs1eHZocHNJLytERkY3NytMYnI0MDI1aUN0?=
 =?utf-8?B?cGNMMW9EZ1dwYXhJSTVyZlc1NHJWc0M2R0pCQ2pZQmRESk9NTC9XU2JOckRE?=
 =?utf-8?B?OE51ZnRFNDVkUHlqcUx0cDRwcG91bW1nU3FQM2U1cW1sVVNGTzh0OG5pWm1r?=
 =?utf-8?B?KzcycDZEZWZjZWI2clM1SWVkTEljemlNTm55dEMzY3RmVWIzMFVvTW1qTVdO?=
 =?utf-8?B?SU1RbEppVVpRN2JOcU1TTkdaNGNHc3IzeHJkS05OZS9VR3FucjNQY3VINEN3?=
 =?utf-8?B?WUhwcDIva1NtSHIyZzFJNVdDWXdoY2g1MytxSUlnZTlaUnh5MTNVSi9ZSVAr?=
 =?utf-8?B?c1JpNjVkVVk5TTZONVFjd0V4cFN3N011dUN6NDM5aERRczVnOW8zeEZLWFh5?=
 =?utf-8?B?bENQM0c4UU1BYXNiU1ZJSElYWnpqN01UaTdVUUtFWWxkdEN4Vm94Tkh0MXN5?=
 =?utf-8?Q?wRCZwby+Omc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTBGU2JFTlVmSFdEOGJ3TFI0QVpBU21qM3VDaWYrRjdlR1hkZk5SNmYwa3lO?=
 =?utf-8?B?cE13MDlTQ0xYWmNodUo3Snp1TmxhZ1BwWEJoV3lxWjdGMTVydzVJZk1kV1ls?=
 =?utf-8?B?OGJRaDFBWmtBKzZHMmpaNG1ZNTFCY3ZrZVVuN3h0VzdhQmhBWHNEUGhHbS82?=
 =?utf-8?B?eGd4MEw3QTl2S0RWMkF4UHRMaTlTemNDNVYyOG1KczFxYVZEbjRnSjZQbVRL?=
 =?utf-8?B?U29FWHBFREZVUG8zT0RmVzlSN0M1cTh1eTZOenBQWThjcHd5bzVpSFZuOEdB?=
 =?utf-8?B?U0hGZTUyWE1oUVNSazdWTXpEbTZrWGNlZG9keGx3enlIaUhvMFpTWE94M0h1?=
 =?utf-8?B?ZGtKVGRYbzZUVzZ4L3A1T012d2JIRTZPbDNIeUV2VVNzc2hERUEwOTJXbkR0?=
 =?utf-8?B?eWJ6aVl5NzM3WXp5Ykx0MUxPUlFiR1hJMXp4bjR0Um9sRUJmTG9wZHdUT2hJ?=
 =?utf-8?B?L21lQWM1Q2RjNytSclFMd055L0hjMEZaNEVJTHJFbHEzaHhhcXE0T2tuQ1lj?=
 =?utf-8?B?SXFQR1VRNE0yc3BJVmJPSDlwOE9vb3MwRUN2NHRpWFdnenNZMEUxYzY1Z2Nr?=
 =?utf-8?B?NUd4bVVNY2V4b0tzckZ0ZTRwSzVaUndLSHJYbC9VcloxUUY1eWorZGVqb3li?=
 =?utf-8?B?K2JZMTdEVm9lUUJvRUw4c2s5VUFSUUFoV0VsUmoxRXBOUkM0Uk8rTlA0MlJv?=
 =?utf-8?B?R1ltLzZIdGhWWHcxenBqdkQ0TUJrNlhVZkNCajZidWpCVGZyUzVSR3N0cnQy?=
 =?utf-8?B?enVCbldVcVdmZVYyZWU5MW91SmZLRytmUDJPN0xQOVRmUENTd2dKRUh6MXhE?=
 =?utf-8?B?TDVsakdkdW51NG5TMVVXSFBoZ2IvTjZDK1VXVzRGWGdnUFAwN2FrQkZJUmh1?=
 =?utf-8?B?QlNLR2R3SlQzNzFlRzBBYUtkYkJYeTUxcFVWd1kxb3VGcWllbXV6VnZWRE93?=
 =?utf-8?B?Z2g4Ty9RR3BTK1l0NWhZcFQ5SDhWYlQ0eDB4QWxibzc3c25MTzcxTm5SVG9B?=
 =?utf-8?B?WkZJS2lPWVBRdVdqcWFmeHF5OXhiMmwzNFVVR1RwYnlFaldDZVh4ZzNFcERj?=
 =?utf-8?B?UFFEK1hwTkMyQ3RSTVZRcnhJSmk1bmhBMjVTZHZvazBISXRkckgyYlZWZEg4?=
 =?utf-8?B?ZHBpeDYrZEJSNE9CMzdpRFhLOTZjWTdkeEY3M0lCVUR1M1cyT1AwTzNJSDcx?=
 =?utf-8?B?Nnd2c2d5bWYzWUlBbzFCV3l4QlZoL2hCNVcwRHJNRXZQS2FkNGt2WHAvd3ZE?=
 =?utf-8?B?dEdpVVBOMmFHbkNaMGJzdjZTY3dXRU1FMEVIT3VPMWRiWUh4a05Vd3BHY1kr?=
 =?utf-8?B?a1ViOFNBdFlIUmVVOG9Rc2psT3N5OHNUbEluNGZZWHhmeWRiV09hbHUva1Bi?=
 =?utf-8?B?SmFSbzNiK0YvK284Y0Y1L2VlbW9RTGJhQnA3S25sMGtnaXJlMVRkTk5mZ1A0?=
 =?utf-8?B?U1ZJK0NsdW5lMjU4d21UV2RId0lySTRmYk9FeW5RVFhDdTFJcFVWWG14a2tK?=
 =?utf-8?B?OXhpT3g4VEhjUll4cTc0OXNDU1RWYVFpVGszTFVxQ1ZVSi94WVUvTWhaUXpx?=
 =?utf-8?B?ZSs3Q1JlKzBNL1lPWW5sdlBwU2lUbDQzYjRCMGhmMnB1dGhkUXJoYTB6VmJ4?=
 =?utf-8?B?U3VxaXVTK29sS1J1YkZLQjBBMlUzWVdUd0lMSTVkTDhWNGc3eGQya1Y4ZUJU?=
 =?utf-8?B?dUkvUzVtbUx0OElGK2dxM0NlNEhUcUIyellJNlg3VURZb0dxeGNhYlFLZVA4?=
 =?utf-8?B?TnZjTkFiNnFXVkhIb0plMTl2RVp6S3hxemFGOHFCdWpOalBlVGs1dXdoUWdu?=
 =?utf-8?B?d3pUNGxFZldpbFMzSjFSaGh3Rzk2R2dzVGhYMVh4cENhMC8xSW4yTjdlbGRY?=
 =?utf-8?B?Q2NkYmgxNkJTSDVNbnMzSjJYbzJtQzFDR3lIZEdDS1Y4NkthVXpvSEZJeEZy?=
 =?utf-8?B?KzhEQ05xWXZzUXZKYkR6b3Q5Qlp6ZGZCTlNOUUgyaWNuVUpWZlJNRG1lYmlw?=
 =?utf-8?B?VEJ0eGlYQ1ViT09HNVY5UU5TUUxYZFhoVkphTXdMWGhQNW9uSHpXenQ3WmNy?=
 =?utf-8?B?QjJ5VTBRRTRFYU83Y0FGd0MwMmpIK0F5UGV3b2VxN1ZobHNVQ0s5a3E1ZVlM?=
 =?utf-8?B?NDM4L1g0QlhkV3J5bTlqM0JhRUlDU0U1S3hST2Z1aDU2dmN1SVVMRmd5c3BW?=
 =?utf-8?Q?kIH6p/UOh7MRFf3TFCD6Hd4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4292bbc7-8668-4d53-76c0-08dda44da506
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 16:25:54.6638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcKjvAPO2fjM2EAodAgGx5eY6Q7fHZcmESyQzPbGt1HXg//KUx/15HsUHS+19YyEt/LF0nxpaNVXtUQ6oD0H1Wnzd5ZetqQMfRTRsEcs2NA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6037
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

On Tue, Jun 03, 2025 at 01:21:33PM -0700, Ashutosh Dixit wrote:
>Enable OAM latency measurement for Xe3+ platforms.
>
>Bspec: 58840
>
>v2: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/regs/xe_oa_regs.h |  3 +++
> drivers/gpu/drm/xe/xe_oa.c           | 11 ++++++++++-
> 2 files changed, 13 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index a79ad2da070c2..e693a50706f84 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -97,4 +97,7 @@
> #define OAM_STATUS(base)			XE_REG((base) + OAM_STATUS_OFFSET)
> #define OAM_MMIO_TRG(base)			XE_REG((base) + OAM_MMIO_TRG_OFFSET)
>
>+#define OAM_COMPRESSION_T3_CONTROL		XE_REG(0x1c2e00)
>+#define  OAM_LAT_MEASURE_ENABLE			REG_BIT(4)
>+
> #endif
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 35157424010bb..5aa68bd63b00d 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -844,6 +844,11 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>
> 	/* Reset PMON Enable to save power. */
> 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, sqcnt1, 0);
>+
>+	if ((stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM ||
>+	     stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG) &&
>+	    GRAPHICS_VER(stream->oa->xe) >= 30)
>+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, OAM_LAT_MEASURE_ENABLE, 0);
> }
>
> static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>@@ -1111,9 +1116,13 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
> 	 */
> 	sqcnt1 = SQCNT1_PMON_ENABLE |
> 		 (HAS_OA_BPC_REPORTING(stream->oa->xe) ? SQCNT1_OABPC : 0);
>-
> 	xe_mmio_rmw32(mmio, XELPMP_SQCNT1, 0, sqcnt1);
>
>+	if ((stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM ||
>+	     stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG) &&
>+	    GRAPHICS_VER(stream->oa->xe) >= 30)
>+		xe_mmio_rmw32(mmio, OAM_COMPRESSION_T3_CONTROL, 0, OAM_LAT_MEASURE_ENABLE);
>+
> 	/* Configure OAR/OAC */
> 	if (stream->exec_q) {
> 		ret = xe_oa_configure_oa_context(stream, true);
>-- 
>2.48.1
>
