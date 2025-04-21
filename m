Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10F6C369AB
	for <intel-xe@archiver.kernel.org>; Mon, 21 Apr 2025 04:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FD110E042;
	Mon, 21 Apr 2025 04:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsuKxVgN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF82D10E042
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Apr 2025 04:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745211542; x=1776747542;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HhKcyM4v05Ttt9+XWjsxxSlSAD2iqeq3oM5Lya8CnzQ=;
 b=fsuKxVgNYEH7PEm7U2KDCGHZn9PQ9LPZzqXw31SjftAgUClXEewDYaNG
 aQTorP1UpKbzzo7pAr8ZADfQnHVS7ZNnXm+mfgdfQzhIOuc3bFMsgesV1
 vmarLkc0F0wp4Ti4r5p2ucFHIuebHnFk8EOB/WflBkNl/Ck1wKXQY2dXs
 ecMud8XdgYaVZqTPxX7BAAapWRXbrwY8sF9sq0YrLsXHmiZxn1oPtei4w
 y17ylX1nJVOhUhsCo/v8pnspKCDXl1OhA8i5cxYyD6Jq/ueKB4E7aODfz
 9zPKOgK0LUbrgHGsDw9NOynb08+J682tPaeWzzkqHEYnGCFDGEnvsQ5Ig A==;
X-CSE-ConnectionGUID: WF/kySdHReSX5otLWVWG6w==
X-CSE-MsgGUID: JIxZybckQ0inHVcHBWvsJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46859498"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46859498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:59:01 -0700
X-CSE-ConnectionGUID: 3wMrwQTGTLyvCghAPpg0gw==
X-CSE-MsgGUID: K0ET0IyKRzStmsxApi8chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136774304"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2025 21:59:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 21:59:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 21:59:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 21:59:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APb6+EmRhseidkEMnvMrmxrSQXKlYYWV2iWj4KInZsquv0rWjyfkbEwLELoufgoNdqlXix1MY/HFpGIJqnLeeyu7ujEFKPFweEYo4Kvy17x6kLtQUk5RlxgUwIOYQR/VGQKCY74Hwqk6hFYeaPhiBYjTq2V9u0+4k6MdXjGjv0fvU7wYMySsVhqpN4BQCBEicaPCWpC0A0IOWuR1dySIlBd784NxOsTq/hx6xe4e4MlFt9Kk7iCFapCdGRRxBSWJqvvWQmtXpqVLvVFaSiTFsNbqMChsM2a3KYedEjN2FyyE9ltPv1Q3PUnwXp5spOuFKf+lypDkwTWk2J5y1h6oFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEyAUyFm4sfzPCqd9laaHvza+NTh8O87p6YWDkJT6HI=;
 b=Fq6fwu/P6Fl/GJ+GIHK+PYIICCbqKv4VNzftIdOaGik534Un29ABwz6J+9PpRO5u9dJRp+SVAB1qb8PawzLG9ykJdGnBmBGoz+XuKQpxThlTC12bfW5GJ1AvKEUSRuZ8H5cTfA9iSTdFK7fU5Dr/Up0rb59g8zMe4/BroZGxIZv8RT7pu6mPr3lTk4TTe/6MGDFXwqgpYumui796pCi97mEceLV9soB8T0O47p2zaoqw+9+zkuVz4HGx80kQbVZklFZVF6/zOxoxQIVIfvav/CFY7D9I3m0yqjlRAmhoippPsXtdTcdUWPOAKiBODpvCZcmondsEmoCyl7g6yWFv3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 21 Apr
 2025 04:58:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%5]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 04:58:31 +0000
Message-ID: <6c86072d-5c53-49ac-a482-cb9a5aa9ad71@intel.com>
Date: Mon, 21 Apr 2025 10:28:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/32] drm/xe/svm: Incase of atomic access ensure
 get_pages happens from vram
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-14-himal.prasad.ghimiray@intel.com>
 <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aACBRZD2Up9VNZJm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::16) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3bc485-c108-4e73-8bea-08dd809129a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlRUVktPSFl4T0NId29oSjFUQjlvdVlCR2VNQVpRTjJ1SVRHT1c1M1pMM1NW?=
 =?utf-8?B?TlpZVU8yTDFCRUUxb2VPVjF0M0NIWUNFY2RnRkFJMVA4aDdrclNyWWJ6S2dy?=
 =?utf-8?B?bjFiNnVxMUdobFhyQ2dtZXhqR1FnZmdiRVdBOTY1NzVOZXdoak5RQU5USk9S?=
 =?utf-8?B?aER2VHhnL1MrQ2NjY21nSFJlSTlLY3FzdlVBTk9zODBQdmsyOTluVExOVGNJ?=
 =?utf-8?B?UUtTZm5hSVFsT0dsNFRkb1NjTzNSYVhDWDlYS0RkVUVITlY1L0szN2hlVGc0?=
 =?utf-8?B?WUwxeGFlWExBNDNiSDI3Yk5hL2pueldLYjBhRHI5RC9RVzM0VGRrYkxHOStz?=
 =?utf-8?B?eWdCZ1BldC9Sbk9vUkhwbnVVT1hoc2VXRUxicUlteStyUWhtaGdsbFBubW9t?=
 =?utf-8?B?aXp0cWlZMTYrUEpxVzFtZldGNUFvM3krV1pmZ2NHellKNVZkc1EzaWgxQndn?=
 =?utf-8?B?dEdUa21FY1dsL2FNSmdFeXNFVWFwN0pRaTNkTkgzQUhnc2xPbDNDbWl5ZjRH?=
 =?utf-8?B?RjZlZVJqQzB6S3dva0hJOEs0QmJEQjk5ZTlmdSs2Nmo5cG1MWE1YNVBpc2k5?=
 =?utf-8?B?Rkxwb3orclA5dUp2QWwzSFNUZ29aSFpQcU0wemgxWWZmZVhwMXBUdjRCZmlS?=
 =?utf-8?B?b1dMTkVpYnN2YldMQWl4WGhqUXQwUDUwR21wVnpZMXVJZUp1TFJkRzVVYzVR?=
 =?utf-8?B?Y1c4UDVSRlBySklodzRhRVlsWUZTSkZvMTltQUtSWmdNNVFVWUZOYTVtRDla?=
 =?utf-8?B?bUJOTHlsSk1XK3RQQzByZHJqczJYRE5QbGdOSXNydXRORitXSVp2L3NaTlhQ?=
 =?utf-8?B?OUdwRWZjcXNNNENWSGI4VGZkUmY5Z29aaUo0MUJrZ3BqSzJLWmVaR3p1RE9T?=
 =?utf-8?B?eVZHR0Nyam9wMk5DOS9ZYnNwLzNUcUNkSlNpL2k4bkxjVFlWUmFFcnFvNjFp?=
 =?utf-8?B?aDFtM1BQN1ZKM3U0cFB2Wms2OTQxN0VvamJaMVJZU2FPV1BKcUZLaTNMMExj?=
 =?utf-8?B?RXd3TllZZStYd0thTmZDWStxcUVTcGFjbll6M2xEY1AraGxoaWw3R21rUVpJ?=
 =?utf-8?B?SkV5WFhvU0NEempuYjNraDBYYmk1MmxqQnhTekJueG04aFNTekRYL1VucXZB?=
 =?utf-8?B?ZjF1V2lIeWJxYTZINUREc01sQm12Y0dsVi8vRFhzcVV5OVZLZUF5Q3NmQW5y?=
 =?utf-8?B?ZUhodGZ4YVFneVk1b0tZQlNqL3hJK0l0azJRaXFtejI0bzcwcm5rM2syTDVx?=
 =?utf-8?B?Qmk3U0ZrUmRzODNnRVV3NjdpR3VZSk9tYks1ZlgyQXdONkIwMmZzV2QzcFAz?=
 =?utf-8?B?Miswa0VlekZsc0ZHMVBNZ3lEYnN0bFlmOGVUUUVhNDBnUzMvYkRuL3JuOC9r?=
 =?utf-8?B?Y1o5YUZJNGZSODJEUGVJZnA0VFhJMHpMRmw3d3ROb1RPeWdEdXdFOURpcjQ5?=
 =?utf-8?B?TjdWTnNEdkFKR2lmRnpCS2RiNlVnRzlBWG04NkJIamEwVDVHK0N5MkQyQzZU?=
 =?utf-8?B?SmlXTm84cWRac29FNEtpdW0rbGN2dURuTGp4YWdtS0NmWUdwNzhsSS9wbGE3?=
 =?utf-8?B?R1UwUWU1aE5mSjlZR2M3ZWtza08va05mdE9BQjFQdEg1NXVrbmFxcGozdTBt?=
 =?utf-8?B?K2hxMGNIOXJCTmI5OU1DNXl0ejlYanJXM2tTRnZ0YjRIdUViZWxhUDFITVJZ?=
 =?utf-8?B?K2plTVZ0aVJNa2ZIN2YwWkpYQmdzcHFra0hheEFBcUhUeEZBZFRkWmd3Ujdj?=
 =?utf-8?B?em91YlQwQVV2THNHNnJUc21RVFlyUmUyaThWV2JBRlYwV3A3aSszK0hzRnlh?=
 =?utf-8?Q?b9ZIXVlndOCoYBRD4meBNKngMv+2i7i8xuGkg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2N6dVFVNnIzbnJvMXc5UW1xKzluWkVpa0FDNzdwS2IvSFkzS2dZMU1pZ2Zn?=
 =?utf-8?B?dEZua0lUczFpUkpGVkx6WnNVaEQ3cXd6cVp3dURySXMxclpTQjlybTMxUWlN?=
 =?utf-8?B?S3l5bHo4Uy9nUUtuQjNRNXVpUzV5NHFOSis0VGlWWWcrZVIvbDlRaFJHTWFV?=
 =?utf-8?B?TDJ5NnhLVHE1eVVNcS9nNGxlL0RNT0V6MkViRjVseGVBZEc4czA5VStSQUlF?=
 =?utf-8?B?bnZCWlNYc2FyRC9OYXl6cG9MUE54NkI5ZkZxWVptTTRFZnhIOEl5YUx3Y01i?=
 =?utf-8?B?TFRFOTVENkhYazBlSnVSczhNS0VhVlBLWldVWXNxYlUyWCtxMXN3aEFhOXZF?=
 =?utf-8?B?eS9RYWk4dGpmNFhkZGxhUXRDR096Z0RBbFdidXBobkZkMjA2RG5HdGM5QTBR?=
 =?utf-8?B?WlZ1UkNzbEo4Sno5QlF3MVlhOGtzN1ZTTWlWK1NkUUorQzFvc0ROQ2FpUVIz?=
 =?utf-8?B?ZWF1YXdYbVRGb1NwMCt6aGJHSjFIdkYzbjJwN2Nhc2NGYUVUYUdzRWw0QVl3?=
 =?utf-8?B?TE1JZnBxSHlaK3QwQTV6d3ZXaG1LNm1ObEtaVTcvMHdFalFidXE2RkxyRHlV?=
 =?utf-8?B?SjQ1dWhnTC9KY2VMN2dCVjJwK3ordnFiL1dzZm5VbVNMZUtmQXpxYk9RaW9B?=
 =?utf-8?B?NHJEaFREdDliYkoxN3JTRHU4L1c2cVhEeklhZGllZnFYUEdMYWd4a2NOZVE0?=
 =?utf-8?B?bWd2MmFCSkZJTGVNRENDWlJNZTVzNEJnOEV2WVhVaDNOS2lzbjgyK1N2NVdP?=
 =?utf-8?B?NmxqMXVjVktKZnpHQUc2SGIxMTN2VGt4RCs3RUYxeWhXaUJEdnVqWUdGUnM3?=
 =?utf-8?B?T3FwVkttdUJpbk96UVM3L3N1TEZFNmtPUWpvWVZCT25RY3hOME9JdGNrakdv?=
 =?utf-8?B?K3g4MmpWd1N0a3ppUm9hWDNJaHRtTkRITjlCNlZLTjV5VExJUUFnVGFxWkxl?=
 =?utf-8?B?ZkZIdFdtdUhsd1ROM3J3a1FFb0ZzMG91Z1FMYXEvUnVrMGQ0YUZqQmllVldh?=
 =?utf-8?B?OGdRYkMwVWk3V2Q3b1M0Q2ZGd2lseDRVaE1DR1hodXg4RnorWDhEeUhLSDBw?=
 =?utf-8?B?SkE5R3czcURMTDZrSHdKUmpGTzI3ZDRlTk5aaExTUFExWnFzNDdkemo2M3Ji?=
 =?utf-8?B?M2hYVldpeDNWc0NLU213cGw0OFVUQlZRMFd3RDNXdG5HTkxodGlqQ3pNQlox?=
 =?utf-8?B?ZEg5OW5UeXJwcUd3UTJMWmdPOWpDL2JNSGZVOGRXNHRCMit4ZmkwSlRXdjZh?=
 =?utf-8?B?bkJxWENwZFFjc3lWRHA5V1dENzFCVTBHc2g0ZjhxdnFVSjQzQm9XcWdsRjJF?=
 =?utf-8?B?RHNxaDk0ODZoVWxVNFB3aE9qalhFbXQ2VGs1ZTFsVzFxd1ZJMHhGc2tQNjRD?=
 =?utf-8?B?MXZUa1JIbnFSanBocVR4RS9kZTNjQ1JhWXI2ZFoyK1cwMnIzZVlDeE5RSU1l?=
 =?utf-8?B?ZGF0SEM4RE5wR20zK3dPKysrdllrQ0JXa3JCM0RyVkNLQURsdzNMTENFMUdP?=
 =?utf-8?B?MmNodGdzYkhZZkNpQ1FlNEc3N2lOL29PdzMrOVc0NXJUQm91OUtQM0lvL2hX?=
 =?utf-8?B?NGtwS0xRcFh3cnQ3NVNDYkxtbTFqSWVmZTR3SWNJRzF2YkRVeklHT2R0THd5?=
 =?utf-8?B?bUR3ekFJS09TbjBJODNJOSs3TE8wdVpSaVVkbGJzbHhuanV2WXBXdzQ5aEh2?=
 =?utf-8?B?SVRjdC8xSk9pRS94V3Y0aFpYOVRYSENEcTNReTJzcDZmSzRsNmUxdHNnaTkr?=
 =?utf-8?B?R3JjVGtGQWhtWlZKRmZmMXpTZ3IzSGlJY0ozRU9TclZ6RFZJM3FCRHV1djhD?=
 =?utf-8?B?RHI0L2dUZ2hIekx2TTI2eXJGWHViMHVvWS9QYzVYNzA2bWJYV3ZCczdETkxk?=
 =?utf-8?B?dU1GZzNIc0Npc20rRjcvWkRseVEzN1lGaGR3Um1FUEFiZXZYcUN1UisrZ3JW?=
 =?utf-8?B?eitMbjRQQzlJUlBVMUZQVy8yb0RmZk1hdVhlQTFXMGkzYjJhcFozc3B0cXMw?=
 =?utf-8?B?NlhlaDArWVVMcm5rSTRpSVhTZitnWmd0VDVxZ1JPaWxWZXFlMGJlSG5wQy9S?=
 =?utf-8?B?amR3M1ZBeG9tRE1zeVlUMXpxdmlsVm1GTEtzU3B5aFB3SWlUd0lkRzJ5R3VO?=
 =?utf-8?B?cUMxRFBQMjBad0Y2NkRzNU0yUnAwaTZ6MU9PRlJPR00yeE5RNFk4cGF6RXJw?=
 =?utf-8?Q?Tw7iUzQM2vCLGEDzlht0j/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3bc485-c108-4e73-8bea-08dd809129a4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 04:58:31.6867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQWL9zTlH24Quh8GPyZZEBJl5xbZBme39rMLlfOfDwsKHkBWh3zYU51RwtxFFPWnyd2E4iJTTTMn+++Yra9GI188Q3kiwRkLaStDS3Uj8n8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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



On 17-04-2025 09:49, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:00PM +0530, Himal Prasad Ghimiray wrote:
>> Ranges can be invalidated in between vram allocation and get_pages,
>> ensure the dma mapping is happening from vram only incase of atomic
>> access. Retry 3 times before calling out fault in case of concurrent
>> cpu/gpu access.
>>
> 
> Again I pulled this patch into a series which will minimally enable
> atomics per UMD request. See the version of the patch [1] I landed on -
> that is basically my review feedback. I took ownership but left SoB by
> you as it based on this patch. We will need another reviewer though as
> we are both contributors but feel to comment there.

Thanks for update. Will use the version you modified for the prefetch 
series too. It looks good to me.
  >
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/649010/?series=147846&rev=2
> 
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_svm.c | 43 ++++++++++++++++++++++++-------------
>>   1 file changed, 28 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
>> index f4ae3feaf9d3..7ec7ecd7eb1f 100644
>> --- a/drivers/gpu/drm/xe/xe_svm.c
>> +++ b/drivers/gpu/drm/xe/xe_svm.c
>> @@ -778,11 +778,13 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR),
>>   		.check_pages_threshold = IS_DGFX(vm->xe) &&
>>   			IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR) ? SZ_64K : 0,
>> +		.vram_only = 0,
>>   	};
>>   	struct xe_svm_range *range;
>>   	struct drm_exec exec;
>>   	struct dma_fence *fence;
>>   	struct xe_tile *tile = gt_to_tile(gt);
>> +	int retry_count = 3;
>>   	ktime_t end = 0;
>>   	int err;
>>   
>> @@ -792,6 +794,7 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   	xe_gt_stats_incr(gt, XE_GT_STATS_ID_SVM_PAGEFAULT_COUNT, 1);
>>   
>>   retry:
>> +	retry_count--;
>>   	/* Always process UNMAPs first so view SVM ranges is current */
>>   	err = xe_svm_garbage_collector(vm);
>>   	if (err)
>> @@ -807,30 +810,40 @@ int xe_svm_handle_pagefault(struct xe_vm *vm, struct xe_vma *vma,
>>   
>>   	range_debug(range, "PAGE FAULT");
>>   
>> -	/* XXX: Add migration policy, for now migrate range once */
>> -	if (!range->skip_migrate &&
>> -	    xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
>> -		range->skip_migrate = true;
>> -
>> +	if (xe_svm_range_needs_migrate_to_vram(range, vma, IS_DGFX(vm->xe))) {
>>   		err = xe_svm_alloc_vram(vm, tile, range, &ctx);
>>   		if (err) {
>> -			drm_dbg(&vm->xe->drm,
>> -				"VRAM allocation failed, falling back to "
>> -				"retrying fault, asid=%u, errno=%pe\n",
>> -				vm->usm.asid, ERR_PTR(err));
>> -			goto retry;
>> +			if (retry_count) {
>> +				drm_dbg(&vm->xe->drm,
>> +					"VRAM allocation failed, falling back to retrying fault, asid=%u, errno=%pe\n",
>> +					vm->usm.asid, ERR_PTR(err));
>> +				goto retry;
>> +			} else {
>> +				drm_err(&vm->xe->drm,
>> +					"VRAM allocation failed, retry count exceeded, asid=%u, errno=%pe\n",
>> +					vm->usm.asid, ERR_PTR(err));
>> +				return err;
>> +			}
>>   		}
>> +
>>   	}
>>   
>> +	if (atomic)
>> +		ctx.vram_only = 1;
>> +
>>   	range_debug(range, "GET PAGES");
>>   	err = xe_svm_range_get_pages(vm, range, &ctx);
>>   	/* Corner where CPU mappings have changed */
>>   	if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM) {
>> -		drm_dbg(&vm->xe->drm,
>> -			"Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>> -			vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> -		range_debug(range, "PAGE FAULT - RETRY PAGES");
>> -		goto retry;
>> +		if (retry_count) {
>> +			drm_dbg(&vm->xe->drm, "Get pages failed, falling back to retrying, asid=%u, gpusvm=%p, errno=%pe\n",
>> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
>> +			range_debug(range, "PAGE FAULT - RETRY PAGES");
>> +			goto retry;
>> +		} else {
>> +			drm_err(&vm->xe->drm, "Get pages failed,, retry count exceeded, asid=%u,, errno=%pe\n",
>> +				vm->usm.asid, ERR_PTR(err));
>> +		}
>>   	}
>>   	if (err) {
>>   		range_debug(range, "PAGE FAULT - FAIL PAGE COLLECT");
>> -- 
>> 2.34.1
>>

