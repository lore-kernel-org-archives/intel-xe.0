Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE55C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 16:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B492F10E232;
	Fri, 28 Jun 2024 16:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pm5PgmY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F93C10ECBB
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719593943; x=1751129943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=msoUo6iElXe3jpY63dqINILTamh7THFNnRpGBSKGIeo=;
 b=Pm5PgmY6sVN0OwBVq62UVjcMB9r+lyzjInSNQ6rsKqxPh9bXHl24Uh8C
 M1sV2oXLoPx/gHWbyZi8phx2xff64ayDUeH12jTUx3Y7JIaFaO8hXUXSM
 pj1etsuxCXe99A1FD8vIE4rq1Fw3vRxUumSmvwaaqPDc+i09YpRr+Oc+7
 60PKEZcnP7NlR2AhOMssSj6fkibf+j+DcdywuOwr3/fF+6sziCJOt9Gqr
 9/F9x/1wfis+r2Lx2LmCqwGdnnAY+VrRSFGPPzA5eqclV2H4FKOdSwRW3
 E0yYCHv8/iROpbL4sj8uOxglGnYEDdmafoVY+yWM6ZjCF49p1dlcZLRvg g==;
X-CSE-ConnectionGUID: NRd/Tb29RLyqYBw5yXopjg==
X-CSE-MsgGUID: YM+jk7weSWCWxqAfzYWr5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27407752"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="27407752"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 09:59:03 -0700
X-CSE-ConnectionGUID: WHGOWp30RHCPE/UDoFGQ7Q==
X-CSE-MsgGUID: Thq9wfGXTiiT5nfyzAFPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49978941"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 09:59:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:59:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 09:59:02 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 09:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GmRunWNyfIWFIi1KNJR6rkjg0kmpgkOwtcMoQub6Qv/h1YHuYWvjDOJdvoj0CZj9D6d3f6ibb21TXU70gAADsUP9K6m6gGxZcDCxG9sUOHDi2SwS6qePCOcMzVQmAdGQ5W43FyHTaYi3ljr5+KIErYPtDb1vrRqWx6YNvqsnPdlz933LZ2VU6g/Ae8hWgsFFXpijXNUilEz/Ws2QBJLKM62fRVq/vu7CyekuuyAcvFszpGDTv8D0TnVhifWKgd4slASJp2lQ2LrBAtMg/+e6eLQFgGc0k+fwNBZesj7H2Rzsty7hcGxB2J83nsnlCdfw7OH/wjxzUgj1Y9HodYD2nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5y4bIWn1uisGoyIz9Gq90YX/a6SsGfh+nOzDPhPUG68=;
 b=S8fwtC5Onylm9frubay/ctXDSqV4RMEkr2lvQ0vrzAj2g3CJ9myhaM6nQJcXPWUCBSjd3qI6gWxVYxQTW1yJrNQfOCq6cUTXbnMWhGYNUlye2h5VnbPNe3EeOONYthAK79MfBQaxiAbZRNlZwk1WBdoepSBTd1jMh0+wAAjKnMMMc6l67Ut2m6AW5UBj/gtFueToRvkS5/e88HKmVyllbHyEL1603xPBEqNGbnPcvcC9UpFwaI9ohJx9QYiGAYQvCi8KT+7mhOfCyklS7axtLN361Q1axxqAewrYtXfmPGVOesiLiJxgCkpFq7KF5pVKV5OR0z/yCnPpk6ZjrSXYZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.27; Fri, 28 Jun
 2024 16:58:59 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 16:58:59 +0000
Date: Fri, 28 Jun 2024 09:58:57 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH] drm/xe/oa: Destroy the stream_lock mutex
Message-ID: <Zn7r0a+8uKOaeLWP@orsosgc001>
References: <20240628052125.1847989-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240628052125.1847989-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f43dbb1-e3f6-4f7b-6f93-08dc97939ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTV1T2hMNit3TkM2Zm5DRFQyQzZ1Vmw0ZksyL0NoQkYrVVJ6S1ZFV1ZGZDEz?=
 =?utf-8?B?WGZxSDhEbG16cWdTUlJINW1SaUZMM29BMWtrODFsT0JUNjFyaDJqWXRibXNm?=
 =?utf-8?B?OGd0LzhqbmRCQVl1ekZCdmJYWXNMUnZSemdkUDdRWWZNejc0ZVRvcmFwNlF4?=
 =?utf-8?B?VXJESU5ZUkJteC9qV1VWSTlLaGN4VmsxZ0xxeWNocGVFam9vM2F6UU1LWm10?=
 =?utf-8?B?RnkvWDlGRkc3cENaRUhWNGlWL3dKTVRvYkJqaEgvRWcrSklKa21vaVdCY2tt?=
 =?utf-8?B?d0VyQm96em5Kb0Jjc0wrNjZGMi9VYURaMC9Gc3BVSEQxejJiMlZVdG5XSUF1?=
 =?utf-8?B?c05aRUdWbjI2bUNrWGoxUlUxMWdUcEI2emJMQ0FOZG9vSXdJNmRJbEM4clVs?=
 =?utf-8?B?Q2p5SWg2YVBNbzV0eHV2N3A3TC9vcHlUM2U0ZElzcENKM0t5U2FwKzJTVG9l?=
 =?utf-8?B?cTZTdHRyaUxnRXk2WWQ2VmNrK2EzRlhaS0I4R2M5RG1YUVdqVW1FZHBUbXdL?=
 =?utf-8?B?K2FJRDlwV053dUpDR01Iem0wMEVTdnc4ZFNzRjIybkpST0M1OS9uK01sVGs4?=
 =?utf-8?B?QU92aTB5eFhwM1c0N3FuZDhHVXY1cThqMVdzNmc4QmxDaHg4elozT3NWQXVF?=
 =?utf-8?B?SDBINzdjYmtlSEYrQ0xKeUlGWVBhOHJqM1JmMDFvSFRDdkoybEU0aGJBYU9y?=
 =?utf-8?B?TzdaYlArYUxWNFRMbWJBcDIwSTg5NnVURmxHdm1ncVZFcDRJMGhJUFg1V0lY?=
 =?utf-8?B?UXIybWhyQVE3NVJuQS9BUjJqTzFkNVp6aUtCV1JxSi95MHc0WnlyQXhsZGZ2?=
 =?utf-8?B?ZDR6SFZNUHU1VDJibitURmlIaGN0Q1pRNTNkUkg4UkI3dUlZOXVSV3haeHVX?=
 =?utf-8?B?aHR3Sjk4bXdkZUM0M1cxV0drSlQ1OFBRVVBOL1lBSTNrc05FV1ZhdnhzTFRW?=
 =?utf-8?B?Qm8xR3V1T3Y0TnZwaThyTVlLRktyVk5XSHE4MlpnY0I2TGpoOWJaNnZuOGJO?=
 =?utf-8?B?VEFmQkJ3UFg0Mk9YbGtVYVdsWktPUEVTaS95emMySXI1SG5qdDBZQWUxWkZJ?=
 =?utf-8?B?V0tsQ3ZkTnlSU21ueFJKRzAxNFd4ME1BU25ZblRlUnRBTVp3S2l3YVJDaVor?=
 =?utf-8?B?QWFmbUl5bksrSnM5WlJMa2RCTEV4R3NacW5RQmNBd3hVU09KM3FCWDU4elpY?=
 =?utf-8?B?eFVkMGFmQXNGVVZIY2FRNTcrakJjTHd2UUJsL1o0ZVJzS21xZFdjUVZoN0FQ?=
 =?utf-8?B?eFdUekVyRlJsWFBpc0QwVlEydnNZNzBsQUlaZnpGSElnVmx5eUdYZHVMNHBR?=
 =?utf-8?B?RkNjSzQ0T3hOcmRwRDhhZUJPZkRKZ2xXRTlVNnJkME44WEFoNE5tYXQ2Mk9v?=
 =?utf-8?B?RTFlbUF2aEN0a0Z4MDNQaWpuV1k5MDRlRFlZMG1PNTNGNXJ1bjdXNlkyWnUv?=
 =?utf-8?B?bWZIdFZoUjVvSG5wY3BXSWdBMGI5OGtMc3Q0cm9XdDRhV1dSZWIxaFpnZXNR?=
 =?utf-8?B?MFpkamVNUkYzaXJmSVhMaGZUUXdUT2M4aSttSnpMV2F4aUNhNTYrbnhVRi9X?=
 =?utf-8?B?WDQ0Q2U4L3JEckRiVnJleHhrT0R1VXd3VFNFa0RPRWFGd1Y2SFl0cWtTcHk5?=
 =?utf-8?B?S0FOeXFwd2ZBQWtOVmYwWTVlQ00wSGdDZ2RJM1QrZ0N4ZFVHdVFHNlJQNWpS?=
 =?utf-8?B?ejgyaEVoaUFxUmFTQ0tQRGtxaUh4dENicHJFUlE4dGt6dE9acDEreS9mNmxK?=
 =?utf-8?B?bjBxbG1xQXVvdjRRNStPZ01UNnkwZFcyQ3FvNnh1OW02RGdRMzhobGdYT2E1?=
 =?utf-8?B?UjNaa3VLZ25LTFdRNUxTQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZkRkdYeVhWSFZ1NGNSQ1ZYVW1yNmFpZkVZQlZwdndYSHprTjBVZnViN1Fi?=
 =?utf-8?B?bWRFU2dOSXl0T0crREhHa3k4L1RZVHc2cWdZcHFVSmUvNnZZcUV6TlZSK0dV?=
 =?utf-8?B?b0RpbkVPSmR2cm5KeVdBcWlKVnlUUjQwcktIUFAzdEZwak1uRHU1L1JOVFVu?=
 =?utf-8?B?MnVidFJhMzVXRDhTQ2FZM1BhTHZOZjdqWkVkSGFWMjNRRGFjNkJWNnJKWmV5?=
 =?utf-8?B?YWlXd1R6dW91RHViNzFWVFVtVWRlTUJDeXBDUHE3SVhBYnV1cytIN0hmaVZv?=
 =?utf-8?B?dVZBeDJWWjQ0NDYwdFY0NERIa1hJdVlqWTBWVTJuQXJ3SDQxWFJkUnRSZitS?=
 =?utf-8?B?Y0NzU0NXNmJtUUpJeWZsME1ROExHT29WKzZMbUd3SjJmc3FpTTAvTHhKa2NG?=
 =?utf-8?B?Q3lxV1RGWm14Zk5hQXEwSzZrVTc5dVVUTUNXN0pMNWVhRVlXNWV1RTY0Uy9p?=
 =?utf-8?B?QlRLS09hRi9RUEcvZ0JsR2dQSkcrUC9EWFZnKytIb0lDRTlsVlZMMUl2cXZo?=
 =?utf-8?B?UEgwNlFzdFpZdW1EZ3RFVjhqdHQ0SjRDY3l0WmNSaE52RDArcXJQYVJNNkVN?=
 =?utf-8?B?M0VTUWZLM1lhaE9JaktKNGVtR3lHQUlheEY3SHU3dFkvQkU1dkNpMWhhTjBa?=
 =?utf-8?B?ZTNrbTFxVHlBM1JlbGozR0FnTHA3S2RRQTl1RmluS0tSblczOWRtSWYwSm9S?=
 =?utf-8?B?Q05jQnhYOUY2S3plQjRKUjJoUWlvZ1pNSmh3bEZkbFEyYVh4TTBnSU9iUURn?=
 =?utf-8?B?ZVZXMkp2MmpDUjAyWVo4UnFtelZxUTI3dURlWEg2NC92Y20vZVdzT2t3bWov?=
 =?utf-8?B?dzVqVEEwWlIvbHdFcmVWa1EyK1RsOEdCVnJlSnlFZk14a3pZU2FORVFWUVZB?=
 =?utf-8?B?Qi9vNHQ0b0lFbEdna2FoYkV5RnU2R2NmbG9DY3h3L0RjbXRtT3VoUXA5UFgy?=
 =?utf-8?B?eVJnaWJmRGx1N202NjJPd2V4cVF4Y2o2S29pd0pmT2EwZU8wbml6eTVhczZ2?=
 =?utf-8?B?azdGQ3llaXRkNk13VVk3dzFPcVB2dG9ZVUhabWZoTis3ZGxJT1oyRXpxOWZn?=
 =?utf-8?B?UTdRSzRWYU9DN2JkVEk5dHh6NDJWVmF1WVpnUm1rc3JFTkZmVmtPcGk5OEx4?=
 =?utf-8?B?aXdtYk4rR0pYa25xSkNFSWdPdEQ4WXNJVGlMZzBkRVVpaWZZWTFKWFlGQnJR?=
 =?utf-8?B?YkVSdHY0bWU1ZXNPZjREZmVNQWZWK1o1OVY1VENxWjB6S0pvUmthd21JNjJC?=
 =?utf-8?B?Y0ZESk1KT0wySVpmTjNzRW5NenEvWFRZUHR4WW50NjBiTVBtTDZOTlVIMVVx?=
 =?utf-8?B?KzdIMzk2R3B3dHZGS0JjZlNWUHN4U0xVTHlHUzJJcVFrR25iMk56aDV2SkhN?=
 =?utf-8?B?Mnk3WU5DcHRlK3VoRmVaNzR6T2VGWTRVc0t0cUVheW93UnhFc2xMQlZvU2V4?=
 =?utf-8?B?a3BGV3FDbnFoUERpa3lNYW5ZdjZ3SzFIVWREb1FhTGY0WjlxZk9OUStYWnU2?=
 =?utf-8?B?WFdZcjhqZjM4SDgvcm1qdno4TFVYeEp5ZkxxSnVPNzVLVGJjbE4vTkNiRGlX?=
 =?utf-8?B?VVZyVWNPRTQzUW5JenY2bnVKUmhYZ0N6VjRXTlpubXh1R3cvaktpQ3Z3NHNa?=
 =?utf-8?B?a1gyY3F2K3ZFWHBuNk1DazFQV2VvQzY5dGF4NHM4cmpxbGJIMUVvbndWMXQx?=
 =?utf-8?B?b3VTYitrakxOcVBxQVIxZVQ2b0VQc1dWSGRvWmFoUFJ2NHRHbGRrMjVBWjBz?=
 =?utf-8?B?Rmd0QjdHamlXTjN5a1hLNkN4bnZyTG4wekREODN3OEZTRit6akg3alkyWVRq?=
 =?utf-8?B?L0c0dmVscEVSdDlNTjN4YWdsMHlLRUtJQi9td0h3blR6QjVNRnNjbTJ5anlE?=
 =?utf-8?B?dGxCZmJ3TVpZQkR3MjNoU0pCMzJXY0lQY3J2RmFnd0x0WWNkcmVsK3VSV1Vi?=
 =?utf-8?B?SGJQT2VUbnFKSzF4WDFCZ01GbEE3RGpET0xCMnN4cUFjak9lOC9JM0E5MGpI?=
 =?utf-8?B?MVFnUkN5Z3hrYnRnQ0pVYzk0ODZRWHJtTytucGttcFYxM1NRa2ZYUERVdHh3?=
 =?utf-8?B?eldaSDJ4NGYzMzcrWG9NT3lhNVZlWTdFcGxSZUZqZUJQY1FUVHBjb0VSY3pz?=
 =?utf-8?B?M3JqUjdOTGNFQks1UlBSNXBZMjA0TjlpdmttbGZaTDNTMDRNOER2NkxLdnFw?=
 =?utf-8?Q?YSkuHNoM4mrEk0PazKq5hCY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f43dbb1-e3f6-4f7b-6f93-08dc97939ab3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 16:58:59.2449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMYDuy+U8MgIYDcyNmoNXjyoNR8QCUtHyYFwqhPNKF5M9ciC8hQ67AiOM/HG3CoFR8DrF+H5SPP2rZcrgks+DZGuKGukMrOWLOGk0sVz7tY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

On Thu, Jun 27, 2024 at 10:21:25PM -0700, Ashutosh Dixit wrote:
>The mutex allocated in xe_oa_stream_init() was never previously
>destroyed. Do so now.
>
>Fixes: e936f885f1e9 ("drm/xe/oa/uapi: Expose OA stream fd")
>Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Since we are holding a drm reference, what is the logic behind using 
drmm_mutex_init() for some mutexes and just a mutex_init for this one?

Thanks,
Umesh

>---
> drivers/gpu/drm/xe/xe_oa.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 6cc3f0217341..4188516a7816 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -824,6 +824,8 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>
> 	WRITE_ONCE(u->exclusive_stream, NULL);
>
>+	mutex_destroy(&stream->stream_lock);
>+
> 	xe_oa_disable_metric_set(stream);
> 	xe_exec_queue_put(stream->k_exec_q);
>
>-- 
>2.41.0
>
