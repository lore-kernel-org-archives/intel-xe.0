Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAE8C369B2
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 17:16:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF0610E324;
	Thu, 17 Apr 2025 17:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNa0KXII";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8C110E324
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 17:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744910158; x=1776446158;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=uVBcNXKkovPp/cKidSpPnCtwipPS/xV8buUoMGD+8JQ=;
 b=hNa0KXIIvbi2QDu/8hojWYocNKjC8Dk4W4fmOCwYYNtZiNF5zwQ/lKHS
 7QARoRsyQAtLNylaIW5dISt5NiqmO+XCSqqfgx3tPhh1ROUFVDWZrqar3
 4nPu6UL5+lmO2oGXhSA9JwTms4ndXgGot8OcudBL/Mk9yik4vF6zv0hO+
 JFVo2BBdsIpKPwPp+e7UE92z55FshOAfM44Ew6odBnXsvg16gV+WROWfM
 /+bIKH40JEeN3G3yUP7Uai26DmtwGcVV2xiyQVaWgcRrPTKVhgexcAcdv
 4boRvD1YWnMUk4miBnmy1gZcS5hvJsokOzSVRP+ltC9JuD47GdCsCwZ7m A==;
X-CSE-ConnectionGUID: 6S2BUqRRRp6HZFQ0VxW59A==
X-CSE-MsgGUID: 7AJqoi8pQGmVE2wQ2BBPuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="64055238"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208,217";a="64055238"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 10:15:48 -0700
X-CSE-ConnectionGUID: dLHWETtPS76imrtl54oGkQ==
X-CSE-MsgGUID: 4gH13Fh6SRi3ClzMfBkHhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
 d="scan'208,217";a="130847120"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 10:15:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 10:15:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 10:15:47 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 10:15:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXR+bCtur/77GPMXNEtFI7nkH1JpBpkmita+MdmxOPKPSn9UMjXpdYnMzsnBd2hd3EN5Ki/JOs7DYQ286sZQ3fUnzhVJQJAqQO67AlDmepFh/e7HNF2/QECv2uxbmoXcmKAT3Y+TCXxN9HFm1jgvFO/g8XYlUXJAwDoLXzZv2YxKN0AAdy9Ab5eykeAKvihIa08ebWMRLhI07A0GjEiXqxAYp1zV900ZDdWluaAi5vBrDPPCNtGl1tDfMIGcxIE9kiPf/fheZP8ZF+Zc0xrp+d/Ad12AoZkaKOL7jYl6HLjNqjLeJhQGRUm41JLovemlCWzrrAfeVyCXlarHZhmcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9n0DfH3gVxm9Gcb7d4MW+9gAA8a78AIXzMp6BDYRMQ=;
 b=rPG+uWlqALKFvxPEiycP4u61eZPHnDFPoPy/fTdLBWNLUEb9O6q1VokT1mR3nAcSVXiTKWBKF8qfcXiBkvqGsjAebeVbkan0qeQlNFGuohGCfyRuEUc+YdgsZJpde4+wsFZVSBQcjO6WbCPV+/qRzDDEJ0ZyR478OlQqctWqG3FBOee+DfNZlLk50wDq8ZCgbv/QXE63jXxrl6ckJSe01NAgo0hgayw/0XWMj6LBq6lXyek4XSq65yj5Xj7CWPlEm1FlrBKSJCJ1QnVgsXwIHmskqLR705dqc/3fhNs+N5mRj/k0cP+l2EHoS+m/suuBA+kJNFDFRxPbLX3u0DYLgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 17:15:12 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%6]) with mapi id 15.20.8606.033; Thu, 17 Apr 2025
 17:15:10 +0000
Content-Type: multipart/alternative;
 boundary="------------J52fwo6HwTKT4uHx3ZgbuVS3"
Message-ID: <c929e34e-0179-457b-b115-c58c51be94af@intel.com>
Date: Thu, 17 Apr 2025 10:15:09 -0700
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS94ZS9weHA6?=
 =?UTF-8?Q?_do_not_queue_unneeded_terminations_from_debugfs_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20250416201622.1295369-1-daniele.ceraolospurio@intel.com>
 <174484314249.11746.17642220781982603966@b68e5b3b99e1>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <174484314249.11746.17642220781982603966@b68e5b3b99e1>
X-ClientProxiedBy: SJ0PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::30) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a284707-d424-4473-f084-08dd7dd368d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjh3TGg4b01lalNiMytOWVBMM2JlQmJWV1hJekxqL2M2WUJyV2RZWTIvaGJR?=
 =?utf-8?B?Tm5OWENhcmFLeE1hWVhybjFRS0FyRm5QenJjOUdyUVBXRnJhRUozVzY5cXoz?=
 =?utf-8?B?VWVuQWpIWGh4RzFXek5JQmpxaHFxNE5IamQvdm1WOHhqcFdneGxOU0ZiVHZK?=
 =?utf-8?B?b2ZKODh4amcwQUVtalczc3pJQTZ1ajFWNVhET0lsTUNGdFN4KytlZ1RMTWVY?=
 =?utf-8?B?WFkwOXByMGxkdjJoNVlieVFqakhCSWZtU1dZUkQ4QnZwdUtvNDZHbHcyNksy?=
 =?utf-8?B?M0JWekVMVDV2RXYrbnFjd2ZGVUZONVJBUkVxcGRXWk1CV0ZoNlAwT0h2VnQ0?=
 =?utf-8?B?Z1U1TXRLS1JQazlQam1Pd09pMDhnOS8wekN6K1NQWFp2UHVsbzVvcGNqSVhF?=
 =?utf-8?B?NmJ6RVFwSWE2N29kd1hCWDduY0o4LzJoTjJ2SWlkdzJxUVZTK1IwNElaTm1x?=
 =?utf-8?B?S2UxczJ1ZUhNQWRNTEMrNWNDVTFuQWkvbWlvdGZaMys0Zm1mcThSSmx2TEg1?=
 =?utf-8?B?VU54WnRrclJYKzdSbDRhN2wzbkFEcHF2RW11TkUySXhXdHFmMzFBMFpNbzhm?=
 =?utf-8?B?Q1dJTVRzVVU4NnVxMkdZejVGWmRad0FHMERhMmpySHF6b0VkdUVONGJzNWhW?=
 =?utf-8?B?VDlMSWFIb3FvZ28vd1c1TlJvbjc5bnYzdVppZUlMbHNQZ3VIaGIrRjdhaFZP?=
 =?utf-8?B?VzVyOElnalg3UThLT1h3NEliaEg4TW94K296RmFkZEw5b3pDYUV5ZCtoQzg3?=
 =?utf-8?B?akhSdkcxZXBKTWFBSnNQRFllYVc0S1BIMGJmSldUYVJEOGFidUJxSmhEZ2E4?=
 =?utf-8?B?WGp3dnc0R1dpK0FYc3NWSFRDc2lvRzlQQVVVT2hCNTRmUkZFRFpaUjI2TFlW?=
 =?utf-8?B?NmdnSE16ZmV4Rk4vdlJ2d1RYODMvQU5MNnEydVZrUjJ6RnZJNVROWG5DNmtZ?=
 =?utf-8?B?VjczR3Rna0JreVhlaDBaSHU1SGI5bGpXWVNRelNYV1d5WjNBQXdBa1ZtMTFV?=
 =?utf-8?B?bURPLzJCeFAvSHNCU1M1azk1M3VPcEFUaEQyM3E0Y2s5M1U3Q082dTdrZ3ZP?=
 =?utf-8?B?bG0wcGo4MFdIaFczeEZnVXVnOGY1d3puWHpSRXBPTURyOHFsTncrTDdkYjZ1?=
 =?utf-8?B?YWI5dkFSQnE5Z3BUdTNvODExVDMyZ3p1NVRyaXJVQU5EUytqTjdFMGh3czFO?=
 =?utf-8?B?TmloUEZnWnNnN0gwTjAwVmNhU1VVakFJZ3J4aXdna29VNW5GdHJVZ1FaV0JM?=
 =?utf-8?B?d2NRb2EzVkpFYkFQTFk0aDJKUERlSCt2U21ZSzdqM3E5UjNXYnhLNCsvY1dC?=
 =?utf-8?B?Z3B0VUJ5eFZjRDcyVytqOXVUWExOZnF4N0hlUFcrTFdrdXlSMy9ESkFXdnNu?=
 =?utf-8?B?TEFQSUdqekRGcnBRanlieFRsVzNsbEd6Y0Rwa3pGbWcxbVhOQ2dCVGpFdmtw?=
 =?utf-8?B?a1R5TmFqbkV2VHJ0b0g4L3BjSUZoY0R6dUxrUG5weDBVeHA5a0lnWENoYzlm?=
 =?utf-8?B?THZSNTd1Q3JXbmVsYjNwVXJSdnZRT2RzWHBNMjlIU1h1ZC9yOW9iSHhLVHZq?=
 =?utf-8?B?QllvRFVBaENKYUlINHZjWmFGZWk3bXI4R1YrenJETjBoZ0xMNVBkWGtKQWFo?=
 =?utf-8?B?V2ZGN1h3bTkrOTc4bFErOEI4MTkrcGFjR1BLdHF0U29mQWVBTEZGUVZocU83?=
 =?utf-8?B?dkNRMDNYdFRhcDNwbXg1S2x6RW9kUjZjZHc2ZWFmR1ZGN1h0MzE3MEU0OWxu?=
 =?utf-8?B?ZUtzc2UvaSs4a3JzYnpBMkVmOGJxekFuSzdhWlVvVk1yYndaeGlDT1pTTFNl?=
 =?utf-8?Q?WkzRACMBeO26GAnlHfqPKg0vBAZQsMQExL9FU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlV0THFBNDZJckFlVlJDbjRXcTRCT2xrMmhPSXArQVNPNG1tQ1BOanpzQTE3?=
 =?utf-8?B?N2piMW90VFBLL2JnQmhQeUVlUjBLbzVlRXdvUTZPdzBQRGh6aGlPcVVrSElz?=
 =?utf-8?B?bE9WbHJDS0kxVUxHdUZ0dXVWTzJmcGxNQ2NndEtiSlpmQlJmUHNMNjBwTzJh?=
 =?utf-8?B?cEJSMkxheXJHNFRRWmw0QWkySFZSclFBRE5IMVdCWGNOQUJJQk9KMzU1QzZv?=
 =?utf-8?B?bVR2N0pWaXlUY1kra0FodG9JbGF4aWcvZVc2bldRWkNRRlR1Z3dQRlVTZmdG?=
 =?utf-8?B?TUxNR1djcG1JbWlWQ3JRNm1GQjI0M2syaHFHTkZNV0xpTG5HNzVnVmxzMko4?=
 =?utf-8?B?SHB2TTMvWk1oNnJ5czM4R1RRcTIwcUYweVJoMGJYWENDSy82L25sMEZCckt3?=
 =?utf-8?B?Q2ZJd1FGWVFiTnJaRFBFNGh6WGhxS3dQdmdXVlFPQ0M4T1dDc3pjUTFubis4?=
 =?utf-8?B?andQV0xpVDNRWE5uNlRDdUVyMmFpTVl2UDJTYm9XWkVUc21mcWRjVGsvdWhn?=
 =?utf-8?B?SjRxWjFDU1l6QS9hK1daTU1JbnJmcXo2c3VLZEM2ckJlNGJnU1JjR2xnTjFZ?=
 =?utf-8?B?d0x5alkwZ25Ud1I0Tmk0TEgrMVppbnBlUTZTQzVPZTZBZDN2NktXeXdmWU9D?=
 =?utf-8?B?eHVBcXBGYzd5K1V5MkZESXdSQ0FLUzRvUzdpR1FQQmtGSzd4WWlDOHFhMUFy?=
 =?utf-8?B?T3lZU20rMk50cWxSWHlsYlQxU3FnUEdOd0ZJWDRNdC84TXcxL1QzdHJBeHdC?=
 =?utf-8?B?azlTMXpjc2Nyc3VLckFVa050Nm43aVljMENuaHkxZWhhMWNUMnpRU0w2bXRa?=
 =?utf-8?B?eDNmdlJEVHEvTDRaY0gzY2Jrb0pXMnZRVmUzb3czUWc2cENiN3B5UUxJRXdB?=
 =?utf-8?B?eWU1U0VyZG5tdmZyMFRsbXRRUktlRVVKUDF1RS9VeTYzS0c5dlFnV1lIeDBa?=
 =?utf-8?B?ZEY4TmQ5YzB3cTZoZmpYbXA2Wk5XMVJwenpFb21tQ2l4SmtSTUZXNTlVdG5m?=
 =?utf-8?B?dFBjWlhNbk83TnZYMkxhOGMvT0wvd2ZMeFIzc3lNQk1pSlVmTXBFcW5Id3Fu?=
 =?utf-8?B?UnRqNWxaU1JqbUY5VTNPUFFzQjFMQmVGRkxBTEp2WlRocnE3KzJuMlA2VzdE?=
 =?utf-8?B?aXdnVkVoWnNySWpyTDhqamo0cVpLOCtXQkVZRnh4djRiTFQ3WjcremJnc1Rq?=
 =?utf-8?B?eUVSZk5BS0F0VUZxQlNsZWFjMGtKWk1jdng4MllQWjVOZDZ0eHJpUk1xaSsr?=
 =?utf-8?B?Y3BYM1Z5eHA1VmNIQWFlZ2Z6UjZ0UGkrQmwrTFM3NXB1UXZlQzBzNDRWSXBQ?=
 =?utf-8?B?Zmx2eG54T0JFd3V4SGxvaEx5UTRNSjhrVW94T2daODVydFQ2QTZsVi9QZmJP?=
 =?utf-8?B?UjRHYkFUaDdUdFFsbU50Szk2V20wdUN3WENhSEkrazhYMnIzZVhLa1JQay9i?=
 =?utf-8?B?WFl1b282cmxhQ1Y5T0JtMmx2cVNSSno0MGtGai9zcDFWYXYvWWZibFQ2NlZ3?=
 =?utf-8?B?QzNkSGg1L1gwdVltMVd4emUxK1haeHFaRzIrdW9tKzBZYk9TM1lFQUdlK3N4?=
 =?utf-8?B?eG9QOVpxc2NMQzRoNGYxUG1Zbko1VjJoUWlUVnhrWlh2N0R6T3ViZlVhNkVv?=
 =?utf-8?B?UWxyZE9pRjhVbXdFTkxPc0F0Q1pPNTB1TElYMlpzVVM5RDJQOHpsTTNHdGRi?=
 =?utf-8?B?Z1Q0S3lMZ05IbDFRaTlRUlo2V1NIU0tSZXZqMlhEMFhHRHVmKzBpeHR3U3Fh?=
 =?utf-8?B?T1ZCRElqK3U1R0t3T0dKS00wOTllbjJYQjk0a2VIUmQxREMzbmpoeDROcFUx?=
 =?utf-8?B?RlhWbnlFa1FJdVJBN0JaVFRrUXdMQWZZUHhCQUtleFNwSXRLanVyY04zMmFR?=
 =?utf-8?B?TnZXNExHeCs4M0Z2YUl4RGIxRGg5ZkM3SzlGbkp2LzFab09nYWRVbldnNWRi?=
 =?utf-8?B?c0ViZEhJaDNjcSt3WE4xSWszclN3Qm9LeFlhc0ZJZkkrZ3paNkFwZ1VOTHhw?=
 =?utf-8?B?TGlZdDkxSktoRkpaakN2S3RvZEtMYlFHTkhnbDQrSlp3eTd1KzgycXRIakU0?=
 =?utf-8?B?MVhiSDhoMktsNGFQSjZPN1o1NEdyUHFKTktUdHBHUks1Qlp6bU1qTlJ6bEs2?=
 =?utf-8?B?SlFXZHRWWlpXSGlrVjlRZko1dk5RY1A5aXFhNG5rRnI0VEhXc3JpT3QzK0lF?=
 =?utf-8?Q?b3uDHWLm9aw2WtAH2cS8cSs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a284707-d424-4473-f084-08dd7dd368d4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 17:15:10.8254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL0df/VcWCR4GTAqzt/rCs/Lp7hYEPfRA/pnU7vQTPsMaaD+Eo28yHzYN6SzyXDUDrp7JNhKK7xhoe84k2BbVc0QKocL49ofIr24Ef4eamc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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

--------------J52fwo6HwTKT4uHx3ZgbuVS3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/2025 3:39 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/pxp: do not queue unneeded terminations from debugfs 
> (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/147787/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/index.html
>
>
>   CI Bug Log - changes from
>   xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69_BAT ->
>   xe-pw-147787v2_BAT
>
>
>     Summary
>
> *WARNING*
>
> Minor unknown changes coming with xe-pw-147787v2_BAT need to be verified
> manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-147787v2_BAT, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (9 -> 8)
>
> Missing (1): bat-adlp-vm
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-147787v2_BAT:
>
>
>       IGT changes
>
>
>         Warnings
>
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>       o bat-lnl-2: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html>
>         (Intel XE#4749
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4749>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html>
>

This is not a new failure, the test was hitting 2 different bugs and 
this patch fixes one of them, so CI is now catching the second one. I'll 
send a separate fix for the other issue soon.
Patch merged.

Daniele

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-147787v2_BAT that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html>
>         (Intel XE#1466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>) +2
>         other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#1470
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470> /
>         Intel XE#2853
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-small-cm:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +11
>         other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +2
>         other tests skip
>  *
>
>     igt@xe_mmap@vram:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_mmap@vram.html>
>         (Intel XE#1416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#1420
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> /
>         Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html>
>         (Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o bat-lnl-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>
>
>         Possible fixes
>
>   * igt@intel_sysfs_debugfs@xe-forcewake:
>       o bat-lnl-1: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html>
>         (Intel XE#4624
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html>
>
>
>     Build changes
>
>   * IGT: IGT_8323 -> IGT_8324
>   * Linux: xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69 ->
>     xe-pw-147787v2
>
> IGT_8323: 09df30b83439380ed9b7f76d31c38d08e31a450c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69: 
> 34472c052bf7c482187a422340b2b228d4d0fe69
> xe-pw-147787v2: 147787v2
>

--------------J52fwo6HwTKT4uHx3ZgbuVS3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 4/16/2025 3:39 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174484314249.11746.17642220781982603966@b68e5b3b99e1">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/pxp: do not queue unneeded terminations from
              debugfs (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/147787/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/147787/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69_BAT -&gt;
        xe-pw-147787v2_BAT</h1>
      <h2>Summary</h2>
      <p><strong>WARNING</strong></p>
      <p>Minor unknown changes coming with xe-pw-147787v2_BAT need to be
        verified<br>
        manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-147787v2_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (9 -&gt; 8)</h2>
      <p>Missing (1): bat-adlp-vm </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-147787v2_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Warnings</h4>
      <ul>
        <li>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
          <ul>
            <li>bat-lnl-2: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4749" moz-do-not-send="true">Intel XE#4749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <br>
    This is not a new failure, the test was hitting 2 different bugs and
    this patch fixes one of them, so CI is now catching the second one.
    I'll send a separate fix for the other issue soon.<br>
    Patch merged.<br>
    <br>
    Daniele<br>
    <br>
    <blockquote type="cite" cite="mid:174484314249.11746.17642220781982603966@b68e5b3b99e1">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-147787v2_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466" moz-do-not-send="true">Intel XE#1466</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470" moz-do-not-send="true">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853" moz-do-not-send="true">Intel XE#2853</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-send="true">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849" moz-do-not-send="true">Intel XE#2849</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-small-cm:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_evict@evict-beng-small-cm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_live_ktest@xe_bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@vram:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_mmap@vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416" moz-do-not-send="true">Intel XE#1416</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420" moz-do-not-send="true">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838" moz-do-not-send="true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xelp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977" moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342" moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>igt@intel_sysfs_debugfs@xe-forcewake:
          <ul>
            <li>bat-lnl-1: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4624" moz-do-not-send="true">Intel XE#4624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147787v2/bat-lnl-1/igt@intel_sysfs_debugfs@xe-forcewake.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8323 -&gt; IGT_8324</li>
        <li>Linux: xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69
          -&gt; xe-pw-147787v2</li>
      </ul>
      <p>IGT_8323: 09df30b83439380ed9b7f76d31c38d08e31a450c @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-2962-34472c052bf7c482187a422340b2b228d4d0fe69:
        34472c052bf7c482187a422340b2b228d4d0fe69<br>
        xe-pw-147787v2: 147787v2</p>
    </blockquote>
    <br>
  </body>
</html>

--------------J52fwo6HwTKT4uHx3ZgbuVS3--
