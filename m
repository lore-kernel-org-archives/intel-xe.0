Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EC5C3DA6D
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 10:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4F210E04F;
	Tue, 20 May 2025 10:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hfYNQcqA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977DB10E04F
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747736541; x=1779272541;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0lXIjzK5aYIU5ux0VZ4ZSwnhB3G1fpKW/vBA6yFbvB8=;
 b=hfYNQcqA5OzWkQ3xDXp5iYA9hf+a5RhV0VzCJIUwPkHz3dEX3/lZflh4
 ZTn2x5LkYabKQzocZTSU3zKK/ICZ6M4SvcrlwrfJJ02a+QcERNxS9ZOBa
 9Ece0ZtshoVpsLv5xX0v9iuinV0ufzTUw/BwTmB2+UHNDa3CeF+IlPaDB
 my6Ag24qbUhUZRAfRnAD/pJKC5dJVka2qhYD8j1mMLUuwZGpmdyS3YBNp
 Gvxp8Ykk9Us7HPWLvHw5Obk3dDICPjltnXhVctOY5uwUSFCNcVhSbdoWs
 n5GMSFwju18Xd2L0jvp12X47GO7l7sbyTb1XfOBaUQUmZ7pyd/zUzkG2R g==;
X-CSE-ConnectionGUID: mFu1XKQoTBaN6FYYQ8zn/g==
X-CSE-MsgGUID: NsdLXGHkSz2z7LEVhwd14w==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="60320258"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="60320258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:22:19 -0700
X-CSE-ConnectionGUID: 7SjNep6FSTWn9qn6vOQ9sA==
X-CSE-MsgGUID: lPbLiCR8SmGScQUqKM/U9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140180271"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 03:22:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 03:22:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 03:22:18 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 03:22:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmoITOWfXAJ/wqiHR9qvYH70ZlEukGPin0ds/Z1lpgoywhXoOjbsIolomhRQCSKk48mqGGAbl6xAtjQmfVhakUj0WJko377x/frF76KE5F1p3B2ZMVIKyRy0B/Henrf7iyGe1BmCpXi+7eNPw6v5FSeMVignELChDwZ0XIh5UkkEK5XWBwzMTdEkfBt6zvyCeXT4YcjvY1nADxLRISZGhu0046RAAwQZguhNncSTgyqi3cYg7JWJFfQblUwNfiwSLNQsIQgtVTMpaamJoq5zVdu4kcnHyR/xYIOAMXrwuyj3h5WOZTrhbxzlLllL4cZ2X37YhEDeKQXwjHbc0usePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3ReL1YusLzKgubE/09easV0r5brrPiQDcV0nBnOMXo=;
 b=LKD1ZtoGHsukN6l65qF9xNyoFXv86rGp+vH72mL7bHCmy7l2KYQwwPmt2ncSmU1/Xw+3lR4rD0NMSSQLiG4I+IPgQr40qQ4/VrBv7eXEeMwyeQn33kxs1eJNu/55S12Jf2Kptzt8LXm7zAN5Pjd1FhjfDPUyXU4Asma8zK1ujY5vcNkPdNT6hf4L/B02RHU1jQCVeT1Ldnt0vVfTYwMbLs5/8JaO1Sis/lHwaBZBCyaN5ufNQxYNJoXDGJfKmWJ5VjPMvS51O5GwgVBPts7951E9f52mQSH9d8YfDiRIWCZrzSqLKt4ztbMUxExxmBltoh/r/d9juoTBuFz2CGX1Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:22:15 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 10:22:15 +0000
Message-ID: <dfb08565-1c88-41b3-8e03-0f4e2bdfc832@intel.com>
Date: Tue, 20 May 2025 15:52:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/32] drm/xe/svm : Add svm ranges migration policy on
 atomic access
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-26-himal.prasad.ghimiray@intel.com>
 <aCUXcxq8i7LjGl0w@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUXcxq8i7LjGl0w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0105.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 6955c456-5708-414a-9e61-08dd9788312d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVZGdzUwUmVaVjlKNmdXT0hJR3BMVHlvaDhEMllaZ1RvLzVadms4WWdSL1hH?=
 =?utf-8?B?MXU3R29jNVhCMDF1aEtoS0FtcWk1elM4SCs5c2xKQmN1eVBycDI0OWV6YThK?=
 =?utf-8?B?QmhMNnQyVm9paWw3SXZIdzkrWkdNUmdDeDVYYUFGVlVDK2hpOGo0clBmV2Jk?=
 =?utf-8?B?cFdrQnk1UlJneTVLcjBSWEtVZ2dTYkZFK1pMMVkzYW5jNjFCR2dtaDFFMGZa?=
 =?utf-8?B?clNMek5JSmNVcmFBNERtZkh1UjFDa0lOTjM0ZzJMcjBNUHhCQjc3R3VKbzV4?=
 =?utf-8?B?K1QvdkdFenZHbWFhRXViSzVBNUFLeTB4dnJ5RHRMRGZaRXJSTEd4UzNXazl3?=
 =?utf-8?B?aEt0WUFUbk1zNEpJbE1GeUEyMEVrVXp2dzZTcDhKTDI1TDlxN3pHVlUzZ0R3?=
 =?utf-8?B?cVBtQXBOTGQ3ci9hbk8vM2NyakVPdVY1YTFyeG5xWFpSMmRpSWxOWElBYlJ0?=
 =?utf-8?B?T0ErUmNQRk1POXhFVmdlOUJKWmhpaW5ORDhJK3VuVHpYZ1BVVGxIUjNOc0hQ?=
 =?utf-8?B?Zm1hc24xcU5CbVYrcDRCaUxFcmJOWEg2UXBYUm9vZzQ0WXFqZ09RS2hZWGlV?=
 =?utf-8?B?MklkNlRwZDFpd2JJcUpXYXdHMysrelhtOGVQZ2tobmRIQzJyWUhmZ1U3QUI1?=
 =?utf-8?B?K2lhY3kvMkJSS245QnV0ZmJsOFBEVmQrQlEyZEtlTjNGZlhrbDQ4T2ludUpO?=
 =?utf-8?B?QzNHRnkwOFJ1L2NvK2NjbmxNSkRxV1BEOXVjRHA5T2xJWW1ocC84dVdML3Nu?=
 =?utf-8?B?U09mcG1wdTc5Sm5TaHlxRVFxcEFvekJSV1BZSTd3OFdTeVVMT25hbFRtSjY1?=
 =?utf-8?B?T05OdXBTclhlUmNWMEwvc2dCSTNBditCUk9ZemFKdFlHSWpGZmhxejBvd0Vz?=
 =?utf-8?B?NitYRzljT0Z1Q0FId21hb004Z0NmK3BOdHlkMUNSNzRObWswNVZGaVE1OWll?=
 =?utf-8?B?RU9IMWJYOEY3Tzd6M3NNUTNQOWYwTjIwdmhRV0lmTWNlL0o0WTJqZ3BLQ3Iw?=
 =?utf-8?B?blRjdGRKdVBidGdMdlB5c3ZKNEpLbllxbGt1Z1pGMWZOK2ZEakdNTzBWWGlB?=
 =?utf-8?B?L2gxKytISGc3ak0wY29lVUM2ZjlnbTYxenQwbnhWK0Zkc0xUaUtqY29QVHE2?=
 =?utf-8?B?Z2VkUXpWTzhXUU9WMXo5c0xQd05URnVOK21uSkMvUG85dENPdmJPcVBkRXdh?=
 =?utf-8?B?aDJKb21DSi9EWkFPZDkwMzdjTGJZYVptbjBibE5HcFdPZGVrc0dCN1dhdHJG?=
 =?utf-8?B?V3RSMGpZVnNqb3NHQ1ZWTEl0U09DNU9SWXYyTDVES2FldWZWQmxFNkVCaTJI?=
 =?utf-8?B?TUhOM0NCMitLUWRuSzFFZjZ5dGljY3JwRjAzNStBK1NReFF5VGU1bnU0VXlo?=
 =?utf-8?B?WXErNmE3S0Jsek9zZ0RicDlTS241ejByOUVKYU5nUFg0OUpmT0dTV2NmNkJj?=
 =?utf-8?B?ZDdNV0VxbklkTzlVc2FZS0xvVzFmSTVBMi9LV2s2a3ZPZ09NdFlXb29XVVBz?=
 =?utf-8?B?djBBOE8xSUJxWFhFZlk1T0hNYkhVRlNUT1ZRb2tUcEtRaFRZN0RFWkhSMVZw?=
 =?utf-8?B?cEMyeVNrUTVLWnV6Z20xTTk0eVlnL3BXSDY3VXRhV1o0NXZ5RHVsUnNOYVlL?=
 =?utf-8?B?Zlo2eHkxV0VKeXFOY0paUFA4Z0hvSXlvbUFMcVpBdXdsUGlnQW1ibkdhdGd5?=
 =?utf-8?B?WjhMN1YybFpyN0hVVHlkdTdVWmxhZTRzRHdOa1dYQStnVi93ZzExakFZU3lE?=
 =?utf-8?B?V3J5UHJJOUloWDgxL0hjR3RjOFN4MmZxV0FLYmw1UCtaMDUralMyZ2N4Y0NY?=
 =?utf-8?B?NGJwVnM3VmRGcnIrNlZGZFZSUXh3aW5lTG1FMGVDeWEzSEtTM1VTMmJ4SGxD?=
 =?utf-8?B?ZFNSMzBXUGN1WjQyMHFMaG52QWtmaWxiWE1oYk92UWVvbGFQQVQ2UGFZUGN2?=
 =?utf-8?Q?jEShNzr8bm0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTB5UWt3MTJRaGcrbEpnTVF5QVhLTVE2aGpWdGNLakRMZm1WaG9IbGxpQkQz?=
 =?utf-8?B?SXRjc1Q5M1Y4TWt5SnE1b2RMU0QwTU51alBsNVJERGNRbGFzaVdaTnhQdWJw?=
 =?utf-8?B?UEdwQktROGlOcmw4RjBYMTZ3WnV5RHlSSXVvNWVtQ1NXVVFiWkFjK2xYWCs1?=
 =?utf-8?B?SHVPZExhQzQzQlhjWjJya3JRUXhhYmhabmxMUTIxbzYyZzFuM3E4YzZDZXlY?=
 =?utf-8?B?WUR5Mkx1aTF3T0JuVjdWQjhXVHBWdnAxbCtoMlNLdDdDZzQ4MXEvVzVZTy93?=
 =?utf-8?B?QS9xd1hmWEQxOGQyZGxVdUxFZWdXR2xHWFl4WDNLSHFtUzZvYnRUUkhiTnBG?=
 =?utf-8?B?cHEyWkVuOFZGZDBQSnhIdUY3OWsyQkh4ejUrVmtKT0liM1o0eU11d1ZHZEJH?=
 =?utf-8?B?WHBtb1dLNVVPNlhwcDBza0NFNldrWkVHTmYwMlFOYzZpTUpwTkhEMTBBeHhG?=
 =?utf-8?B?UFpoWGFjZlZad1B6UEtOMnFQVFlXdW01azRSMDM5MmFJZXkvRDZFcEdPWjgz?=
 =?utf-8?B?emFnV2dWSC9aSUlEK0RvNEo2UEh1SjZHbWZ4TG5JRnhkNUZvRDEzL2dKRDJj?=
 =?utf-8?B?N3F4SWZuWU1VRlJpYnV2cXlrdTdSZGVqZUd6eVZYeWZXWGxmd05FYkkrY1Jy?=
 =?utf-8?B?TVZsTnBaMFYvL3JtZjlJMEVDUnpHajdYZE5TMWFGVXFJWG1ya2VnYnRWamk4?=
 =?utf-8?B?Y0hwdkNqUWxmV1dWNHlDbytzRElleHhkRFFIZlpzclhPZm94bHZsaU1MS1Vy?=
 =?utf-8?B?c2IzdHpTNzhMV0pEbG9rWXJ4eVBKSEF2azh2K2tiYzJzd2ZKUERiSGNCSTdh?=
 =?utf-8?B?R1JDYmxtdC80MXNIazdxdWdQaVFzOWlPejdmWjlScC9EenlaaGJYRzBvWWdO?=
 =?utf-8?B?MkJCTnprdTU0QzRTcGo0d3JET3ZXOFF3WnN4eVJDQ3h3RkpvVUh6NmcraW9l?=
 =?utf-8?B?cXRwQ2VQcXIvd2NUYkRpUGVBSytzZWxLUk4wL0ZwZTdxQnM0RHJuVXNad2dv?=
 =?utf-8?B?M2EyeXlJM0lRT0MwRUNUTnpidnhIMmlxTnF4SWdDUldJQmM0YkZFWW1RaHZS?=
 =?utf-8?B?VHcwRVhhd2tZeHFtVnZ0d2VBUkI0aEVod2dKdFFlQjNoMnh4cGFTZS85WFhr?=
 =?utf-8?B?RXMrem9MMm9qZUNhUDVWQ0RlVlhaT3JqcVNqaFU5TXZDSlZRemVuTDZoWDgv?=
 =?utf-8?B?U2dROWRSV1BxWjJiTE5HVzRxTU5aMEtGR0toZTZsMlZzQUUyVXVDd0YxV09u?=
 =?utf-8?B?U1NaUStpd2ZNVWRhVlRJYXIzUFl6bmFxVUxOQ2lrYjBOVGZpdkl5bWM2VDM1?=
 =?utf-8?B?MjFTUEtCNlo3NE95VnRwV1pOZTF3RDBTOGRQbEc1d0lWQzJFQ0FRQmIrV0Vu?=
 =?utf-8?B?NlI0cXpGVUhzMXhKS0JBQ1E2cXFVbHBrYksvQ0hVZW5jclJ1dUZxaTJ6MjJ5?=
 =?utf-8?B?cEZHZTFxdlUrR04zRHJtZVFIRTFqNUVSRmZjV1JWWXdTUkxsZjNXQ0d6RlNG?=
 =?utf-8?B?U2l5WXRmMk5LcGY2RUwwSmI4MFRKV2kxd1VUK0Z5L0U0dEZrblBOYXhSblEv?=
 =?utf-8?B?TTAzTlp4aDhIZWFNRXBhcnhaenRnMk9FRFhjdFZpbjFYSDJjQkZMWDZEVFdY?=
 =?utf-8?B?dlErZXByc2FjZUJwam83TURzMlREbzRuS2MvT05QWHZyZDRVNUxLRWtPYUMw?=
 =?utf-8?B?NjZUbFRxWHZvVFFDQnYxUmhPMitmUWRoYnFQVnNxblRKYzhKSmdmU3VnOHc3?=
 =?utf-8?B?VXpJNDFvczNFVDF0RUdXdFB5RmRndEljTGUvT0ZJQmxIbEhQemZEVVBJdGQ0?=
 =?utf-8?B?RitnNXJuSEhkTjNNS29GMVdRSW9nV1VlS2dDcHZDa2hGNy9UMks0d2hKUlZr?=
 =?utf-8?B?UUxKNHh3ZG9INE0yWDJxdHgxWWR2VWpqSkhBNXRramkrTnBjZldVUjF5dkxv?=
 =?utf-8?B?YURRdnFCeTJUWFlxWjQ5L2lMYXNGRGRsTFh6NTRUaTMyejI1aS9GeStuS3lC?=
 =?utf-8?B?WnhPZnpqWWYxSk9kN3FPRFZSa3RrWTU0NEdEaEFVK0laNDFnM1dza3ZuWnZr?=
 =?utf-8?B?RmhNTUQyVGN0TWJTWS9Bd2NSOHlwUzQ2SVJLOVNnNlM0SGpETXpsS2N0cjFJ?=
 =?utf-8?B?NHlJTm5md0RjOWlXS2dxSUNpZ0JsUDRyb2swWWhld2RXdGczR2hkNWkzOFpq?=
 =?utf-8?Q?mB4Y8hIT4AnjQxWHVGE9UDY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6955c456-5708-414a-9e61-08dd9788312d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:22:15.5894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uOnQrOeeY4heNfA9/m49gGKKBRAr/e/R/zgU4fJqr4MIkyiQ5+E5MfDcL1n4BiTX3yvp/+Um6pQrp8dcK9jAH/uAzcL11MWnePGyLLdKTGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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



On 15-05-2025 03:51, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:12PM +0530, Himal Prasad Ghimiray wrote:
>> If the platform does not support atomic access on system memory, and the
>> ranges are in system memory, but the user requires atomic accesses on
>> the VMA, then migrate the ranges to VRAM. Apply this policy for prefetch
>> operations as well.
>>
> 
> I think the baseline was changed a bit here, but I believe it mostly
> makes sense. Will review again on the rebase.
> 
> A one nit below.
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pt.c         |  9 +++++++--
>>   drivers/gpu/drm/xe/xe_svm.c        | 14 ++++++++++++--
>>   drivers/gpu/drm/xe/xe_vm.c         |  2 ++
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 11 ++++++++++-
>>   4 files changed, 31 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>> index 2479d830d90a..ba9b30b25ded 100644
>> --- a/drivers/gpu/drm/xe/xe_pt.c
>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>> @@ -645,13 +645,18 @@ static bool xe_atomic_for_vram(struct xe_vm *vm)
>>   	return true;
>>   }
>>   
>> -static bool xe_atomic_for_system(struct xe_vm *vm, struct xe_bo *bo)
>> +static bool xe_atomic_for_system(struct xe_vm *vm,
>> +				 struct xe_bo *bo,
>> +				 struct xe_vma *vma)
>>   {
>>   	struct xe_device *xe = vm->xe;
>>   
>>   	if (!xe->info.has_device_atomics_on_smem)
>>   		return false;
>>   
>> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
>> +		return true;
>> +
>>   	/*
>>   	 * If a SMEM+LMEM allocation is backed by SMEM, a device
>>   	 * atomics will cause a gpu page fault and which then
>> @@ -745,7 +750,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>>   
>>   	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) {
>>   		xe_walk.default_vram_pte = xe_atomic_for_vram(vm) ? XE_USM_PPGTT_PTE_AE : 0;
>> -		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo) ?
>> +		xe_walk.default_system_pte = xe_atomic_for_system(vm, bo, vma) ?
>>   			XE_USM_PPGTT_PTE_AE : 0;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index efcba4b77250..d40111e29bfe 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -717,6 +717,16 @@ static bool supports_4K_migration(struct xe_device *xe)
>>   	return false;
>>   }
>>   
>> +static bool needs_ranges_in_vram_to_support_atomic(struct xe_device *xe, struct xe_vma *vma)
>> +{
>> +	if (vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_UNDEFINED ||
>> +	    (xe->info.has_device_atomics_on_smem &&
>> +	     vma->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE))
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>>   /**
>>    * xe_svm_range_needs_migrate_to_vram() - SVM range needs migrate to VRAM or not
>>    * @range: SVM range for which migration needs to be decided
>> @@ -735,7 +745,7 @@ bool xe_svm_range_needs_migrate_to_vram(struct xe_svm_range *range, struct xe_vm
>>   	if (!range->base.flags.migrate_devmem)
>>   		return false;
>>   
>> -	needs_migrate = region;
>> +	needs_migrate =  needs_ranges_in_vram_to_support_atomic(vm->xe, vma) || region;
>>   
>>   	if (needs_migrate && !IS_DGFX(vm->xe)) {
>>   		drm_warn(&vm->xe->drm, "Platform doesn't support VRAM\n");
>> @@ -828,7 +838,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   	}
>>   
>> -	if (atomic)
>> +	if (atomic && needs_ranges_in_vram_to_support_atomic(vm->xe, vma))
>>   		ctx.vram_only = 1;
>>   
>>   	range_debug(range, "GET PAGES");
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 92b8e0cac063..0f9c45ce82b4 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -2930,6 +2930,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>>   		for (i = 0; i < op->prefetch_range.ranges_count; i++) {
>>   			svm_range = xa_load(&op->prefetch_range.range, i);
>>   			if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
>> +				region = region ? region : 1;
>>   				tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
>>   				err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
>>   				if (err) {
>> @@ -2938,6 +2939,7 @@ static int prefetch_ranges_lock_and_prep(struct xe_vm *vm,
>>   					return -ENODATA;
>>   				}
>>   				xe_svm_range_debug(svm_range, "PREFETCH - RANGE MIGRATED TO VRAM");
>> +				ctx.vram_only = 1;
>>   			}
>>   
>>   			err = xe_svm_range_get_pages(vm, svm_range, &ctx);
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index ef50031649e0..7e1a95106cb9 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -69,7 +69,16 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			  struct xe_vma **vmas, int num_vmas,
>>   			  struct drm_xe_madvise_ops ops)
>>   {
>> -	/* Implementation pending */
>> +	int i;
>> +
>> +	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
>> +	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
>> +		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>> +	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
> 
> Again I'm unsure if this debug message how a ton of value without
> knowing the VMA info.

Agreed, will address it in all places

> 
> Matt
> 
>> +
>> +	for (i = 0; i < num_vmas; i++)
>> +		vmas[i]->attr.atomic_access = ops.atomic.val;
>> +	/*TODO: handle bo backed vmas */
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

