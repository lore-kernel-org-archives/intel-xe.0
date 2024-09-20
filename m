Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1BFCF58C9
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 04:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331FF10E2D2;
	Fri, 20 Sep 2024 04:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYbngCSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C8D10E2D2
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 04:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726806507; x=1758342507;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GE8njtoEtyZQoz6yUujszyWjgAHqxFCypSGZy4+gjlg=;
 b=LYbngCSEdI45iZ53F4pC9YRiazKqaKv2a0hXL7NXyFdpfx0MWvvKUHak
 jm5L6tLBN5r5wRrLym8Etl4yCeEQq+yVUZ/If+6dNKgk5tAWyVKVdkbPs
 1eKELVZQI8uCTDen/JD3TzwkiXkfLmWeKLOvqJsyw6+JoyfxPfl6ILxZg
 unhU4DvZ9gAFLnXX9yuZArdpcmFbYSiwgBT49dLoc27i4jA3NXDXGFRIQ
 iNw5PI9Ga7C+lMyKGXG2sp0MTuJHWBAvYtJlb2SqY9PjuHRaoOoe0Dcy1
 Q4v7OGe7vCrfrRbTMy2sKn4JtaF/xGrXZ26eNDHVv5mC7eaqJYanNisXo A==;
X-CSE-ConnectionGUID: pgZBlEnFQ/mBEsuoWM7utQ==
X-CSE-MsgGUID: ALDnt9WaTJ+EuRuKYl7PyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43320469"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="43320469"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 21:28:26 -0700
X-CSE-ConnectionGUID: +jd8aqo2TlCdEAWLmg7OLg==
X-CSE-MsgGUID: SdJy84XFSIyF/mZKWPOWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="74516084"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 21:28:26 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 21:28:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 21:28:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 21:28:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xsBAYBgLVACjc4+Ydrsa/JhjC5TVMk8wW27sQSlqLKbDsRbJ8ytYFurZMgOyOXaqHM0VgZ4USeWRS0MPiTMrxXAmSdsfKBMsdx8bwJ7NymDpl7cLAjLRAz+CfKKemKew2U2+DuGg5DOLQIZVj6PwnS6fJ8cNE53o2fFI6at49Y0k+f6GwXbeFwBh4ZiRo5mNHjB0TtF71Khnc1XJVfbk6ROiJGZKz9xQ0l7EmD2iKKn8uA/cQ1QDq0XvY1SJJ4j6azfZPB38TmQVd/HgzbqeLbL7ziwEo0Iso79PLlOKkPp+tSq5cuZY/mUqIwktRfjX+oRa55dH9wHYd9un2iX5+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FjSQ/r1jM+dOaPZb92VJ5sFyO4Y6Vh4nA72k2JrM3s=;
 b=H1RGqhalFke2lzhs1Z9fvWaBnRF+fZVW5JpYeMeCQwf4CDFQexeppaK5t8ReEPZ243Q8HwhWBmsoyn4rwRJzzU1QDWY5u8l7EVWmwJbNN1pDBaezVvv/bUq68qISqUzG5bbmd4Mdy9GhR7Lu6e9OxS+lp0ShYbhhbTBNhFPrLqlj5ESEY4stq1J5S0sBEEYHh5EugApUYHycKl7bgAKnIsDlRXJ53N+r611hycELe+tC+sbEaWsgGwMrn7ooYV7L/6v/O1pf1z9Y4h+MvsIUgp70LhHGTHkAgew7YG31lx1MXVBYjtds/eQTShH+PhR495bagXogbqQHAwUY4RvO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7038.namprd11.prod.outlook.com (2603:10b6:806:2b3::22)
 by SJ0PR11MB5134.namprd11.prod.outlook.com (2603:10b6:a03:2de::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 04:28:22 +0000
Received: from SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674]) by SA1PR11MB7038.namprd11.prod.outlook.com
 ([fe80::d13f:aaf4:415e:4674%6]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 04:28:22 +0000
Message-ID: <f9269ec3-dc9b-4863-9e41-e7a9946d9e1c@intel.com>
Date: Fri, 20 Sep 2024 09:58:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Prevent null pointer access in
 xe_migrate_copy
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>,
 Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>
References: <20240919224220.1325739-1-zhanjun.dong@intel.com>
 <20240919224220.1325739-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240919224220.1325739-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::16) To SA1PR11MB7038.namprd11.prod.outlook.com
 (2603:10b6:806:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7038:EE_|SJ0PR11MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 31fd6d08-7da7-427f-15cd-08dcd92ca962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmNFZWdxeEx3Q3IyTXpGck10cHlOU0JicXdXRW41bUNzbENrcGsvZDJGcXA5?=
 =?utf-8?B?YzY1R0lOdXQ2QTdLSVFXTisxekt4SG1TeDh4ZUZON21qdHpVazJJNHdpYk00?=
 =?utf-8?B?RDR0ZWNmdWhDVjZudVcyTGJWc2Q4aGl3alpkWkVLWUdPU044YkhEd29XNTE0?=
 =?utf-8?B?RkZ5ZDBUMzY4ZkI0TGt3cWZmWnNqckRBZDlJa0o4TWgrZjVoY2dVd0JzUE5Y?=
 =?utf-8?B?alRqTFo5a2FUQWRodlJ4OHNkcWM1VFllMGVQSG1XWC9wQk9hOUlpSmxOSmlJ?=
 =?utf-8?B?bVZvUVlGdEJwVVh4eHVMdmgvcC9UOXRsYXVxaTJFbTFXbmQ2c1UrbVJOeW9x?=
 =?utf-8?B?R1d1NTBWdFF2K1d0aXJTUFI0eDRIM3ZyNDZzcGphT1doTmdIWGhxaFFSWFlk?=
 =?utf-8?B?Q25NYzQ4dnhWd2NmS1VrUlRudXNJUkdaNXFqU05TSERIRzczcUNpUmlVYm5N?=
 =?utf-8?B?bTV2b2NsMVFvekN4ZmZ2SGtIV0UreUthanZxUDZ0R0J1VXF4OXpBM2tpbkdR?=
 =?utf-8?B?alIrV295cjNwOVQvd2ZsZ1RQMlpIdmU4ajZxUmtuaWFhRE5iYXhaTmhOczFE?=
 =?utf-8?B?ZTk2WWwzcHBVaHNpbHhTR3B3cXgrcDJDV29GdElNajRNMGNMbU1uS0t4cHRX?=
 =?utf-8?B?SEN6M3NqbUFuRTJqK1VoUFZqWS9UU04wQkRrR3QrVmF1c1FJYWJaMWR2M0RV?=
 =?utf-8?B?Q3pLZlcwQXlrTEZ6RHVZbHBINnBiem5weEFBSHVPQlI5N1lOZXQyM2F4ZEJW?=
 =?utf-8?B?VVdiOVc5VDYrRXVKb3BWdHFOaXZ2ditoTUExS3NCQitiK1J3cGR5L1BBMmwr?=
 =?utf-8?B?OW42ak5ZYXd4Q1llYU1TMFhoR1dOZnQxenltMzBUQldSMzVFeldkN1pOMkhL?=
 =?utf-8?B?cFE4UUttSEJ2eXA5dzVtSTZxWHdTNmxsbEt5dno1UmQ4czc2MFNtSXVFck12?=
 =?utf-8?B?c1l3UGZvbDBxV3J5dHIwVlZSMGJtQnJtNHQwUXRER2d3V2VFRzlWM3dVdFMw?=
 =?utf-8?B?aUhFQVlQZDdWcVlTYlVnQmRkdS8raTc4MnhsU3NxWGVOV3NOZEtLbm5PSUkv?=
 =?utf-8?B?Z01ZbEdvR1J3bXpkSGtxbSthRk0zeWVaSjZkR1pNQXRwZDUwVFFLbGhWRUVi?=
 =?utf-8?B?MkFLVTFEcUk3VnpkVVczRzgyMzBHNUpyTnhUQ0tqVWpZR3ZNL1lpZ0l0VUxG?=
 =?utf-8?B?ZENNVFp4elpWUU84ZWRLdzZCWDUyYWJ5Z20rT3BydTlCcDRhT0wvd1VtSFJu?=
 =?utf-8?B?U21Vci9tbGFYeXR0Q2dORWMya3Q4ejQzTXJwVFdZVXdWREdldS80REUxRGN1?=
 =?utf-8?B?QWlIa2RPaEZudXhKYUExczVDcnllOFhpWUd3RS9haVFMS1YzbytKSTdQSWMz?=
 =?utf-8?B?RFpWc0U2dzQ0M05IVFpMMzAza1BIM0ZhaS9Rd2wzQU5ZV1ZFMy96c2hsR2M2?=
 =?utf-8?B?Ym1JQnJIQWl3V1RqU1VvcmhOZFFVVE9sbm1pWkRVZWRCdjN3dEhPZVExV2Nv?=
 =?utf-8?B?UVVpRTVuUTNLTVNxbjdQVGpjQmgzUkNXU0dJdy9YWFljUDdxbkRwd1kvaGRx?=
 =?utf-8?B?MmNDV1BQNC9DS0tlVG9WQjk0eUZDYlR4R09JTFQyYzZMc2NSUldtZ0pqN0xU?=
 =?utf-8?B?aWFCUHVzN3Y3aC9heWhLRWNjWEdSRnVwZkpuSTJpeHNibmlhc0RzTytSamp4?=
 =?utf-8?B?bjdjL3V3bWpsemFyYnlSeXA0aTlpVkh2Sm5KVVowU05BM3BJb2VMWCtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7038.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkZGZkVaazl6akVOTWdzQXhSNFVjdDhDdldHS1RWY2lWTGhHUnNSa3RXVFFk?=
 =?utf-8?B?SEVRMWxSenZaYWV2d2htU3pHRm8yelJCYlA0Y0FvYXdpaklPWldIMnpFaVV0?=
 =?utf-8?B?UTFwcVpSVjFqd05hTm0rT3d2Vytvb3RKamVMVkZQd2RCMXNsOEdrWlhhbER1?=
 =?utf-8?B?NWNjTE9lMVBjL09keFdVUlE3cFEvNVA4QWVKc2toaU00UEwxUDZZYnNRd0w2?=
 =?utf-8?B?Q2oyRnhabVQ4TTZ6Y1pPMDJqbDhXcXpzNHROWUxSeDIwUWtPb1pKT1hNdVJy?=
 =?utf-8?B?NitOWTk3bFNzWTUwVjBTVm5obnI4akRKNDlwSGZxbXZLekdNalhwOVpLS3JR?=
 =?utf-8?B?bFFEMGswdkFhWkxuVXh1K3BsclgzdnFEU2lpMWFIR1h1Ym1Da1lIbS9jVmpZ?=
 =?utf-8?B?cUpiemFtZXZRMzVOVmxxOTFkVXUvTmEvQkdTTzBRREFBenRwcHpSMVJYZzcw?=
 =?utf-8?B?a1JUZDNHeG94dW1uajRjemRUd1NwNjY1TGtYZ25nREg3Qm53SnhXbmZUQjZp?=
 =?utf-8?B?OFZUd1JHY0Q0R2xzMytoOE5NN1EyWUhwcGp3a3lZb0k2VURiR0xSZ3FRMUlM?=
 =?utf-8?B?Y0paR2xVbW8vbkliVmtucXlrWEthQXdidnErYkljZkNsTUJCN291TFgrVFJU?=
 =?utf-8?B?UFF6Vm1WNjJISElaMGhPamtvOVd1ZHc5RFdFRVBRM3VOQ1NUTFlxa1hDTSto?=
 =?utf-8?B?aHB5RERwdkFzZlE1eHQrOTd2aGpPUnc2SjJhZWt5QXRrT3V1bXRQL2pkeDJ4?=
 =?utf-8?B?bzBaTmI4eEtOczhUWnMyMGZOMzdyS0x3Q0N0WnlsdEZrakhjTjVNcHFIV29X?=
 =?utf-8?B?c21WVEVQM0E5YWRSaFFZZEhXVk8rbGpEdk56SDdGWDlubkRnV29VSk1IUCtG?=
 =?utf-8?B?SEVaZlNYSU91YWFQSnRoNUd5OE5LdDlPenQ5NnF3V0tYalZNRUVYSU9kdE9Q?=
 =?utf-8?B?dzdrZ3UvWnIreGZITitsV09walIyWWtTRGNaTUpab1BrR1NUTUw0dEZIc01E?=
 =?utf-8?B?YndsVDlKUkxxMkdqaDZDdkhBaWhyd0VTVTAwUmgwNldFaG5pWnc2NzJhcncw?=
 =?utf-8?B?VlhLWHREbUVyZE15UUxtLzR4S21JcUFPOE9xZi9kYllkbFJuTGdCcTRFZ0dm?=
 =?utf-8?B?QUZ4OUhiNFRvSSt5VHQrZWRLZEdhSkcxNHliSitiTG5saVdjeXc1ZTYxN0V4?=
 =?utf-8?B?TUwyNk1vNGlmejZHVTdSRDdlMFhpTHBBTGVlek5QM1VGZ2U4RkovNEZQMjdt?=
 =?utf-8?B?SnZjQ2tIMms3TENmaWM1TFdha1lpb3BQMmtQdm9ReWJLNUZNOFBocFBZYi9o?=
 =?utf-8?B?UWsrNzBXQ01KcG4yWFlYaGhDT2N1OGNpTDZRZm1kK1RRb2c0Mzk3U2hBbkVk?=
 =?utf-8?B?QkVTbHNWdnlZc1h4T0p5R2tPZm0vVFkydmN3SHZkclBmQnYyY3V3NXRtKzI2?=
 =?utf-8?B?aTZRbVp6aUZtcEVGQ1g5TGlYRGpXRFFJNHRNR1loZE53V092TXFYQVVxbkps?=
 =?utf-8?B?bkhkSXJLMmRJTFNoYW5XWDBvTGFuQjJhT2pqSlJuZCs4VWIvSVdqcVdyUUJv?=
 =?utf-8?B?K3VHZWlOaWttUGJaMUlQZ0tibGxzMGZYdjN4d1dvTnVRbEdFc1BJUlZGdll5?=
 =?utf-8?B?MjFPdmxLUG4zd29VNU9wV20wOWw3bWpNWTNCRWluUzg2a3BkZkNuOXpUTnoz?=
 =?utf-8?B?cWhHSUFDY1J0cTBPcTJXdGFrTXpWMkcyQmdMUUhieU9LR1MwUFdFbldJVDNY?=
 =?utf-8?B?YmpiYVE1TE93MndRbWJEeEx0S2RrdWthRVUwUysyOThQOXBpTzZQV2tYYS9N?=
 =?utf-8?B?V3JBblhOWE5YU2QwblRYZEJzQWlNVFU0VEZ6SStTMGFyVGE5OFRSeWlmTHp3?=
 =?utf-8?B?dzVERVpySUJlRS8xYkthNjdQdXhXcm1nYjBFSUFiSllNa0ZNMnpybnB6b2NE?=
 =?utf-8?B?aGdORis5S0lFdmJoaG44R3hnclhxY2Ntam9mc2lIUmRDZXYyWDFacUQ3OEps?=
 =?utf-8?B?WWZ2VmpkQU1ncUxCQkZtd2N2MzhtU0pBRjA5bStqOUVJQkh5RlQwWjF6UytT?=
 =?utf-8?B?bjk1VzdFSGY3YVlJTXNqS1hzSXRtYWR3Zi9zQ3RMQysrbnVyZXdwUGVEVGVu?=
 =?utf-8?B?REVkTUFqcVNSYlFsQk1TSjFjOHlEc1dwd2pWdkgvcDd5b0pRLzR6QjRZYnFF?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31fd6d08-7da7-427f-15cd-08dcd92ca962
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7038.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 04:28:22.6594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64e4/eiiv19Cq7wS/YtUX40XGwJKvihJT3DLwd4eXxoXrJ+ztf6McKFJXwjMwim02KsbatN0ta6ylvxrI5KDppxGidoEPPv/wugMFXbdT2k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5134
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



On 20-09-2024 04:12, Zhanjun Dong wrote:
> Update lacks source flag to include resource is null case. This will
> prevent null pointer derefrence in xe_migrate_copy.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5f2f1ec46b57..5e8f60a8d431 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -682,8 +682,8 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>   	tt_has_data = ttm && (ttm_tt_is_populated(ttm) ||
>   			      (ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>   
> -	move_lacks_source = handle_system_ccs ? (!bo->ccs_cleared)  :
> -						(!mem_type_is_vram(old_mem_type) && !tt_has_data);
> +	move_lacks_source = !old_mem || (handle_system_ccs ? (!bo->ccs_cleared) :
> +					 (!mem_type_is_vram(old_mem_type) && !tt_has_data));


Just for curiosity, isn't !old_mem implicitly taken care here ?
shouldn't ttm be NULL, if resource is NULL ? IIRC, this was what Thomas 
had confirmed during handle_system_ccs implementation.

Thomas/Matt,
Can you confirm here ?

BR
Himal


>   
>   	needs_clear = (ttm && ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC) ||
>   		(!ttm && ttm_bo->type == ttm_bo_type_device);
