Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3E8D1267A
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4DE10E6F7;
	Tue,  2 Dec 2025 22:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPw64PqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624F510E6F7
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764714445; x=1796250445;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XKtN2+PopZlTQqqUEc6x4iKLmAxjR1jBH1xUSEeQR04=;
 b=XPw64PqJvIdNFI+BqaMQLqju7/Nh2RWrrfZKd5ZtK54R0LvMUR1GBqK0
 H5na4d+s5/6hCwfFU/zXrF78FS0xSgyJOk7szi8vfvqbly3DNKyq76HqW
 oSXI6bqQvvpncwzybO+uxGA2zjNE3zeayUbhQWSz0j2nhj3+MyV8ODi2K
 5RF7urxMFldD0QgPhEXnXKZS8SHi39ObgpHqsynqH662rjwdwIfEWHoOv
 HFS6kt/9RiqdOFytxpC5/ilky/smT5KBl7DEHiLpcgiPKB+qBhpUGE3vT
 co861+3lWAO7IwyHQxJHiirmlGYieUQTXjo9HmLyXJ9v3yOVJ6/qsriiT A==;
X-CSE-ConnectionGUID: fejI1VRATHOM7eoGAjmH9g==
X-CSE-MsgGUID: tB+FUv6URc+wI2xeL6uPUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66734182"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66734182"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:27:24 -0800
X-CSE-ConnectionGUID: x3IKAwH1QNG0Yokzlf7xQQ==
X-CSE-MsgGUID: XgxdFn2vQ0u1UVjbQcGUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="217847261"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:27:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:27:23 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:27:23 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:27:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1T4nL6DONy9YtcUQ92BcetDaiN7xrDrlb4voeQ0FWtpCw/eARvkODH+32RpaCHGmzWG1UyQirI32Mb7p15+4F8QGo9tDdpuUZECuhh8iTRjAmN3PwZl9QqlAf1HJowOUAgmg7Mxectz4Fyuf2GXSUnzT5fFPszij3HTK8pr2oEf9TRJxBweULiYI7VI6Ml8OQNJw040csgf+xzOhKcHRFMpLZA8gIfm47AhySvRRBlGafxk/wTJq/Jw1Gkq1VjuYpJVobTZ5N7BhEySFgfDdqi6Oexq7i5DnamJoxmFASKMK9WPMJDURpjE2yI3F94oYz8YTSY+i/q0xUECpQZxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wx3ReOSWKFGLup7co20bdQyHrmaSlleH6sfop6tNYH4=;
 b=QC0zcdKE2DLILtvan05WEi291Qu/naTanUjY6Uzy6evwGqe3N0eIw8bJYXIRSna7HFD3cKZj/v6zd0cESVNzjyNZuLotn0YtDq8dHHdC8rigzjMiXu6H8sgPO61B9fEpFvdE9yTN/4sS43Fer6x+Qdym5gBZStVe2xou76lS5283MTZXRKMTDc1in3/h4wgrM0EhbnFkEkwUUS4sqis27N4RZK3Y2/9kl209nBU+BsO69k9gcpiEgAlL8mEJZJG3mL4xSJ16+eNrlsLWkX38W3l+BLieyJbU3hkwYEj/6lIg0JSndbwhJji5rNotj9oksscEutaA+6vMNK4VrL6h5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:27:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%7]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 22:27:20 +0000
Date: Tue, 2 Dec 2025 14:27:16 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/xe/oa/uapi: Add gt_id to struct drm_xe_oa_unit
Message-ID: <aS9nxJK9YYbDmpj0@soc-5CG1426VCC.clients.intel.com>
References: <20251202025115.373546-1-ashutosh.dixit@intel.com>
 <20251202025115.373546-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251202025115.373546-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0068.namprd04.prod.outlook.com
 (2603:10b6:303:6b::13) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: e28f834c-63e6-49b2-a705-08de31f1f576
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2VTdVdqQ3VvWklMZjcyc0N0WG5FTmRWdEpRaGgwM0Q1ZUZRdkdJbDd1OFky?=
 =?utf-8?B?YXlkbUJrQm1UTFYzKzZud0dHYmhnN1RuZVU5T1JDYU9FYTFzc0xrRDNrRlU3?=
 =?utf-8?B?Vm5Ed3U3Wks3ZStCOStlOU9uTVRUQ3VTNGlFYXhKMUJ3b2syNE9LY3BuZzRV?=
 =?utf-8?B?T2JUblkwOFB1L1pzbklTc2txNVZoTmxhV1pkYkVLWG5FRkNzemFlZDl0alY0?=
 =?utf-8?B?cXdHV3RxTDM3aVVsdVFCMjAxQWdGOE00MU82RFcwUFpaZm02SzZoQ3JxWW83?=
 =?utf-8?B?NEZIMmpJenhJbll2NThYL2ZkalVNajBOT3k0REorellUUmRVdkt6V3ZkZEJZ?=
 =?utf-8?B?N1pWOEZhSHBHK3hobHV5dmc4U3d2aVdCVk5sbGIzN2pYY2Z0YkJpUlZQc1Jt?=
 =?utf-8?B?ZUhrRjlrRjAxVmU5OGlDTkR2UFN6aWVDSFdHSFJNM3BNRDFLRW1tTmkwaHJm?=
 =?utf-8?B?VEhVQzI3VHE2MHpEVVk0NFY0NmtzY0ZTcjFPdXBrMGl5RHhwNE5uWHVRekFr?=
 =?utf-8?B?dGRhcWorU1VmRklGbzJQTktYZ2Z2cUJ2VW1oTmxJbVZ6dEVBZjJpaVIrb2JZ?=
 =?utf-8?B?dHhiZnR6blpQb1dYbUpqRkVMcFdkUTdnRzROSFlqRXJVZnJvczlKUlBLd3dQ?=
 =?utf-8?B?eGkrOHJMamxIUEVlOVZQQjN6blBUWHlRbVZldjNuTlUrajcwQ0FoL2NmMk10?=
 =?utf-8?B?eUF2bVczNlgwSE5CY1VFZjVpZjFuZWtBTEIvc3JvTlNpTFpFRFRKSHpkVWda?=
 =?utf-8?B?UTZyNEt5M3lEYXM3ekZ0d0VHU2hpV0daUEtBTktWSzJ6d3pXVFdtR2FiTVBV?=
 =?utf-8?B?OHJiL1gzbGZ5ZEEreGRxSi92VFJYZlNITnNxS2lPUVF1NXhQdU5nTFl0UFYz?=
 =?utf-8?B?d0ZmdE9Ib0RJbzdlcnc3Q1FLa0hpOXBZcVRDZUladVJYNTBoazQvMS9lT0tm?=
 =?utf-8?B?K094ZThvU0lzeDNCdVpJU01JODJGU1RqMGpRdWhNMVdjYytDbEpYc2l5UDJG?=
 =?utf-8?B?RXhCWnpqTnZ5bjVNQkJKNlB2djRNQ2d3TTBQaXRrWXVRa2dtZnF2dzVXWUlO?=
 =?utf-8?B?UUNBb29qUmlVcUUvTTNsL1dCeisvTHpJM0xacGRkQmtlMzQ4RmtmQTRNb0U3?=
 =?utf-8?B?SjBTMVhlMXB3aThsNElnbm1GRDJjSGFYS2ZMR0tsQnpZdEkwRmRlcktRUWNM?=
 =?utf-8?B?N2VWVmVhWkJ0ZllSZUl4TG5kd1A5NitqZnFJRnY1b3h6R3hwRUpTU29ZTmha?=
 =?utf-8?B?Wmcrb1JzVjNneGxwN25JL1hrY1A1VWtFRWluU1hveFRJOHEySzg2a2lnYU9u?=
 =?utf-8?B?dFBJbUlKb2svSk1Xcjh5VjRXRTUrSERwajBKdlNMdllWOFNoTnYzcHVjRzY4?=
 =?utf-8?B?aUhsYWVIeXVZcnBhNTdWRkg4WHlSMUpwT2FiQ3VSZUxlNXBpUTZiNjVMTXZ1?=
 =?utf-8?B?RDF3YU1pR1REd1JVYmFBa1BLVDFUOFhKUE1TbmxCVFN1NjZ6NlVnV0VEaFZP?=
 =?utf-8?B?Wkk1bDRySVRQZkc4bVYxcTYzZ0pCdEs4OU9ydzlES1NWRDNXd1Z6bXhEelJ2?=
 =?utf-8?B?TmVBMWRxQW1qb2hFNWxsNXM3MHFIRmVoRUd2bUhDL2pXSEowWmdCZ0RWR2xi?=
 =?utf-8?B?V2tSODdvRFNad3FHdEVhSWFwd1VMd01neTJ2T2cwOVNiUXFhR1cxcGRzRE1w?=
 =?utf-8?B?dUdKTmY5NkZyYVRla3p1QW81WVJuRVpjdytGVXlsbEZPZklreXluOXB6ZDBm?=
 =?utf-8?B?eU9abnpCQUpUNk1OMFhCZGFDWis3SUtobjBrM0VSbUpSMXg4OS9LMDlWQkxx?=
 =?utf-8?B?TUhwQVljSzlnRlJOczMvRGNGcE5xejBxYW5JR250Qm5BSXRPdFdwaCtZRUU3?=
 =?utf-8?B?Q2NJbXRxbFZwL0MwNjd6Z2hEelV5Y3MxbDZGV1lWMFNJVDhRejZQYmdzTm5a?=
 =?utf-8?Q?lIsxWAfdFtTyQDPhUOT83gFi788sUYtg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXZrUFdpZWZRMk4yaUlnZkZqY0xySElRME1lU2lzQno3L3BNOVdwd3p1dFc3?=
 =?utf-8?B?RlhVTkJzdW92MldGOTd3bWtkZy9VRlZUWXFxYUtnNnR1ajBoZUthRW94dWVm?=
 =?utf-8?B?d1N1WE1QNmFzeVpDNW9rK3pTZVJpNlJteGU5ejg4elNCSXpaVFFsSnZybnBr?=
 =?utf-8?B?RUY4S054TW53bG4xV0lBK2FUekJmcDd3ZU4wYmI0STdyS0VnamZCWWFaemRl?=
 =?utf-8?B?NHR4ZktRS1REdjJITElYZEhwT0RCRmd2YjE5ZTRLR04zdTlreXBOL2pZcFV6?=
 =?utf-8?B?c2F4QXVkTjR5MXZNY3U3Ti9SS05wbWVmOGVwR2tUWm9XNUYvSTI0K1MwR2Ji?=
 =?utf-8?B?R1NqQk55MDVNKzYzMmJqTzJjRUdRcks5cktzRkwxemJSaUxmNWx1WUFUQUVo?=
 =?utf-8?B?MzRxVjNzQ0ZwdGp4d2U5OGxGTmxjc1ZuVTlZY0llbW1ZUkJoY3cwcTVVRS9q?=
 =?utf-8?B?V2Y1ak9aZEMrNGZrZDVNczlKSEh4eTJuOUJUcXhhWWZNd2xSSG53K1lZaDVR?=
 =?utf-8?B?MXN6UVZXODZlbktXOC9Bc1U2UnkwOXRpMis1Z1ZOamJZT2ZDK0hVNWFlcXZl?=
 =?utf-8?B?MGc4WEFHdWlpUnBwK2FUQjFYWEZPMUcrWGdMbnVrTnZYZVgvUmxXL2lzTzV1?=
 =?utf-8?B?aWlPUFo0cTlDY1o4anR6LzY5bzJsL0J0NTYrY1Y2U2Y1TkVFeWxEY0xJeTU0?=
 =?utf-8?B?YzFabDBta0JVVnBUV3NUVmVHSmtlT3lYclQzaWc1TmJKd3M5dEtONGdac0RG?=
 =?utf-8?B?ZWtoM0hmNUZQRXE3ckVvTENnS3R4cE05MXhNWTB2VkJsWnlmdkhLMHI3emRB?=
 =?utf-8?B?WFVGN0FQMmgvU2d1enkrM1d1K0pjRjQzU2JLL2orM0hNU1h5WERjZWRMd0oy?=
 =?utf-8?B?RUd5MnhhaGZ1YlRMaWpNN2dDR3F4bEdkVmd2aFVielkvbFFSV1hFM2p2aWd3?=
 =?utf-8?B?cTN6eHA5OWRtaU50MHg1ZmdxOS9kdnlLWkxnQ0l1SjV3dENURUtUbnplS0x6?=
 =?utf-8?B?NlNhcU5zUml2bDJ2MklEbmY5dlo1SXFVM1V3S2ViUW5iaHFndzNRMkJxYjI1?=
 =?utf-8?B?SU9FTlBsTjlQSU80aDlncldrbTBuSFZWdzlUaHl6bkVYMmRDUmhOOHl5YjRm?=
 =?utf-8?B?SldyaW9sYlVJdkVZN2VQdFpUL2NHdGN1dEhveEI2M2xFbG5zeFZqU0NPdVJD?=
 =?utf-8?B?ZlZiQlVYcHhLZjdadDlnUGdPWlJjcjlybHQwbVRLSkowb3NiUjJ0UWt1T21H?=
 =?utf-8?B?eEcvUGFOOUptalpnWUdnWkVBUnpNVGR4aGdMZm1UOGZZdkR3bzVqZE9VYTVt?=
 =?utf-8?B?WEhkUS9RZlNQUHZQdkloeDNuTmxDNXhEK1g0bEZuOEZvYjMwNysvbVpBK2dr?=
 =?utf-8?B?NzVqMldHaFRCTzdOMHZJaE11cnB1cWtieFRhQ3RhM3pJcnRpSDhwZlVHM2xO?=
 =?utf-8?B?eTdYRFpyM3c1d2xuUFZRTWZBdjgwUzdmUk8vOUJLdTJXLzlFSmRWdHlocHFK?=
 =?utf-8?B?WVRBVThqNHN4VEJRcmxnRXNsVkhnRjJZakF4bitEQXNwWml3Z0lpQ0F0bjJN?=
 =?utf-8?B?YU90bE1zNXh2SDFiR3c3aFUydmQ3eU00R1Y0MTZPK1U4SzU5ZHBJMHcyTi9L?=
 =?utf-8?B?aGRnZHpBYnRIcEFCRWhRWXpKVStFZjgxaStzczNpMHplS0EyMURZMHFqM3dq?=
 =?utf-8?B?dnA3M1doUnhkaFh0T2pFMW5TTjNPcjdmMzVKdHd0R2dzNFlSd0hELzBlU3NP?=
 =?utf-8?B?WC9FSUJtVTc1em5pd1hlTEdFajd5TzU1RU13dTNFeDZDbDNXZUtWMm9UZ3A5?=
 =?utf-8?B?Q0pQNTlqaDNBQXdrQnVTQnJQQkVFL2c1a1dScVlzS0hXQVFzeS9GRUZyRDBV?=
 =?utf-8?B?QXhQL2hNYVR5Y2pwakVvL0EvTldVbnhaS0t0WldLek9RUk5MNGRlcFMzcTVh?=
 =?utf-8?B?eWpwYlEzdWxhVkw1MFpwdHFMMURQM1FWMUNJM25Rc3JOcjZQTGh3NjRVdUpp?=
 =?utf-8?B?V2ljcVBLNURnQ0JDNHh6TEc2czl3b1BPSU5rZkEzelJLNEVFbjNENmtoN1dO?=
 =?utf-8?B?VTZ2Tmc1L0lWTVhPTEhrcGl0VUx2andCL0kzbzVhVy8vR29wTHNYWXdMQUll?=
 =?utf-8?B?VksyQWloQ3dyaDhUcEYxZE93UzNQTTVaOXlNczJySGdQYkhVMk54eDladWEz?=
 =?utf-8?Q?VFtUli4efpyL3difzcfmKjM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e28f834c-63e6-49b2-a705-08de31f1f576
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 22:27:20.9119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXorVWJTSLYfMAS3GCo/CVMmJwgO8iStW3QhDoHksy/jSQz/xTBGW2XVljcVUXmxcp8ExhjvxleM74hY6BOXPePb4kGEWKHCAxm8F1iiaZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
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

On Mon, Dec 01, 2025 at 06:51:12PM -0800, Ashutosh Dixit wrote:
>gt_id was previously omitted from 'struct drm_xe_oa_unit' because it could
>be determine from hwe's attached to the OA unit. However, we now have OA
>units which don't have any hwe's attached to them. Hence add gt_id to
>'struct drm_xe_oa_unit' in order to provide this needed information to
>userspace.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>---
>v2: Change gt_id to u16 (Matt Brost)
>---
> drivers/gpu/drm/xe/xe_query.c | 4 +++-
> include/uapi/drm/xe_drm.h     | 9 ++++++++-
> 2 files changed, 11 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>index a7bf1fd6dd6ac..18bd8047ebfdb 100644
>--- a/drivers/gpu/drm/xe/xe_query.c
>+++ b/drivers/gpu/drm/xe/xe_query.c
>@@ -682,7 +682,9 @@ static int query_oa_units(struct xe_device *xe,
> 			du->capabilities = DRM_XE_OA_CAPS_BASE | DRM_XE_OA_CAPS_SYNCS |
> 					   DRM_XE_OA_CAPS_OA_BUFFER_SIZE |
> 					   DRM_XE_OA_CAPS_WAIT_NUM_REPORTS |
>-					   DRM_XE_OA_CAPS_OAM;
>+					   DRM_XE_OA_CAPS_OAM |
>+					   DRM_XE_OA_CAPS_OA_UNIT_GT_ID;
>+			du->gt_id = u->gt->info.id;
> 			j = 0;
> 			for_each_hw_engine(hwe, gt, hwe_id) {
> 				if (!xe_hw_engine_is_reserved(hwe) &&
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 37881b1eb6bad..4413c7f918740 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1681,12 +1681,19 @@ struct drm_xe_oa_unit {
> #define DRM_XE_OA_CAPS_OA_BUFFER_SIZE	(1 << 2)
> #define DRM_XE_OA_CAPS_WAIT_NUM_REPORTS	(1 << 3)
> #define DRM_XE_OA_CAPS_OAM		(1 << 4)
>+#define DRM_XE_OA_CAPS_OA_UNIT_GT_ID	(1 << 5)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>
>+	/** @gt_id: gt id for this OA unit */
>+	__u16 gt_id;
>+
>+	/** @reserved1: MBZ */
>+	__u16 reserved1[3];
>+
> 	/** @reserved: MBZ */
>-	__u64 reserved[4];
>+	__u64 reserved[3];

Maybe I missed this in earlier reviews, AFAIR, we should ensure the MBZ 
part in the implementation (i.e. check that reserved fields are zero 
when validating the params). Not sure if things changed with Xe KMD.

Regards,
Umesh
>
> 	/** @num_engines: number of engines in @eci array */
> 	__u64 num_engines;
>-- 
>2.48.1
>
