Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72752C71157
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 14:42:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A8510E2AC;
	Tue, 17 Jun 2025 14:42:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNMPcVQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A013110E2AC
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 14:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750171347; x=1781707347;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=AF9E6mNFOPhMpQ7aOJPlymjgNBLiRFUOx2tG4t6oyUY=;
 b=iNMPcVQYuS83pQMqqYIItdnQQD1a8bm+x/95TsZLywjzQ775pebDQGYw
 lfeCvFjApA+FupY1G4nwQnET9M+rp33vQiYO3WMQxuYPQV8p9R3Sekfqw
 2rN7oaQ+7c4+ZhWgs7x3u5sBgf1KV4V+r7HyOL214ibca+TgUU/H8oi9Y
 ohK1nXUQ1tzLbOxXMhy2CHfLnzIJPlmtGQLf77UOEBjz6I3MQ2bAv4lxs
 CyIaiOtVFIlrqPyTPQx6dndsxXSfNWonKHBfgVl6jdFMIoyYOlnyS6DNx
 JR6zTStJkVBKCd3RzGrkxD/N2yB9evd3i9xo+njDBKjQi1uxdJXOmHgB3 g==;
X-CSE-ConnectionGUID: +5eRE70VTiqy6lCpIN0P9g==
X-CSE-MsgGUID: xPLsx1WSRf6R4fd6n5Y9NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="56162508"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="56162508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:42:26 -0700
X-CSE-ConnectionGUID: x5guCJnSRciAcqylo9gIaQ==
X-CSE-MsgGUID: 0m3z+4qMQHuDA9YriJrxpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; d="scan'208";a="153567221"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 07:42:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:42:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 07:42:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 07:42:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oR80AhX2kl9k4qIEnIEa55MUjRQ9MVCjKL7MOrC4QqaahlO7kQsVn44sRHiHjhEp7Ih5os4D+pGFzDiw8kHg07iqGiET5o3B8Pk3W96/YhuYLhh5eRa6yFmmSZnV/Cv9RARTmD23HpxSOa2Ka/aNG0L540NtAYHFI2MuvNDicG4GqmqD3xthNhae0oAuYEno5yTqg7k/suLhvYzQOixSoRu1MPcKvEsXig+oqsbcBY1EDyCzuomadQfCV3uF4YitS+t+SaP8CP7JtPsCeuJFopa75sB067FdxG+eCT73kUmMMOX77j2PwITTgCZm4Fo2M1JM7y6jh39yre2H/MvRdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeFCRLp9HKdDJ9fUSU+vy/emRRRyJ+K9wbIVMDfToIU=;
 b=BW4vdYyDFFGl+UTCsvo8Me72JdhQ740OvbUBwtQkQJ2qUewYmplG0nkWqWvcQGYgxz6TUK0aJuH8fuSB7sgBf0JzWY7MvAsYveevAiYcdleHwaDn3tpJ0IlQnvMx29tyLJV1XxJHqKt50NQ2esP4P9SAeAEwzkevK1pq+iM7N9gdPfXp8ZtqzsJCRw+t2WYvuo9S4dTNnJVf/Hql51QGE11H5TQZuldVXrWPd/CI6a5OGTz4tQN5EktIQjxHYYEYAeG7OO78yWsWoGJsGwcsj6tWxbggY7K2dj1rfLNGODEVzvxgGRebcvsbpRU+h55zvyWi7xMc0yrMNPcHLAWGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS4PPF00BBED10C.namprd11.prod.outlook.com (2603:10b6:f:fc02::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 17 Jun
 2025 14:41:46 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 14:41:46 +0000
Date: Tue, 17 Jun 2025 07:43:22 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH] drm/xe: Thread prefetch of SVM ranges
Message-ID: <aFF/CsuVpyM7HTFY@lstrano-desk.jf.intel.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <813b13e287f6443f4518d8055f64f6539ca34b0e.camel@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <813b13e287f6443f4518d8055f64f6539ca34b0e.camel@linux.intel.com>
X-ClientProxiedBy: MW3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:303:2b::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS4PPF00BBED10C:EE_
X-MS-Office365-Filtering-Correlation-Id: e58c34b8-8fb4-4b92-12c9-08ddadad157c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnkwWVRzRkxDOFgzaWVMMEMvdTZxemNnb2o2cmdpSDd4TWFMYmZJWml3MFMr?=
 =?utf-8?B?N3p2bGxZRzY3TkgyMy83eFlTOVlHaFlVV0JmTTZ0K21oa1V3TzcwMnkrMG5z?=
 =?utf-8?B?aEk5dVhCdGlZd2txZzdKVDBUUGdpMkFJeGJYOWQ0K1VSN3EwTjd5S25SQzlW?=
 =?utf-8?B?TVdCc2Y2MGdKdERJSEJIUHBpekE3TkZ4QklJb0JFK1VYeTcvd3BUN1ZjUzlq?=
 =?utf-8?B?a3ZsVzRPWmFUTjk5dGdKQ1g4MG45UDloV3o5cXM5MVJaajN3MlNqT2tWSXJh?=
 =?utf-8?B?WFlZWTdEWHJ2VndwMXliOXhibTBJTTBVd05yK3ZROSs3VnYrMzBzZHU2b0VV?=
 =?utf-8?B?ZlBnaUdsTXBQQ0NaODJsV01tWW9MekNtWEx4U3EyYWY3UVEvOC9DNURJbXda?=
 =?utf-8?B?Y3ZUdzZIVTE5L3N4L3dsQnZkckNLOHk3NTRPYkF4KzhvanVvNjF1a3psY1Z5?=
 =?utf-8?B?dDR4clAzWk15dXVvLzlKTW1qVHVZMkJGS0hPQkppRzNRWUcwUnpleTlRRkhL?=
 =?utf-8?B?akxFK3MyaS9xSjJGMUdnaG5CRUtVa1Z5anN0T1FIMHo3NlBNekFrZHc1Q3VP?=
 =?utf-8?B?SDVpSnJ2UmJqOC9qRzBhRERLQVl6N292bmdzdFF4V0xEZ1NMVjVMc09yUGda?=
 =?utf-8?B?Mmt1R3dDZythVWNKa3RscElKdFZFbjlEc24wQTlsQ1B0cnkyQ2NWaDN4NEFR?=
 =?utf-8?B?TytpclJSd1RKbHIvL0htbDE4RXU0V0dDZmpaSUZrUjRGbDgveFdBWGtxUWFN?=
 =?utf-8?B?UTVibFQ4L3FUaklscW9wK1Byek5EQ3hHdWQyRzFPa3I5dUpGbkJGL21yazh6?=
 =?utf-8?B?b0V1QWtUdzd3K0lXdStOcE5JTm95cFFaRWIvb2E1UUkwRXB1aEkvb3BxR0dI?=
 =?utf-8?B?TFdsZVpFSVBYc0Nabkd1ODNWR1FYZ0d5WDJJTUd0bzYxUGRNNUU0UHQxeC9Z?=
 =?utf-8?B?S2toKy9oQi9kazU1cDNqZ3BYU1VDSDA4WUlXRkJGZ2IzN3R6R2d3bmlPV1o4?=
 =?utf-8?B?WUI2UVA3cmEvSUROMDRKd3hwa1JvNVBXQmtMZmE0VEtFSlhFOXJteVBtczJR?=
 =?utf-8?B?QStFbHZLekFTMzhmS21KUFU1ZDNsOVJlcjNKZmJTWUdJOWF6MWpKNEZrVG56?=
 =?utf-8?B?TnN0SkpWSTZ2eFIvamxOUkwyMGtNQzVDRkVBYUd3Wm0wZ29kY2t5NEJNM1NV?=
 =?utf-8?B?VjEwbzMvL3AwRlZhWjMwNnQwSjJzTDVSdHBnd0g1MEJVSkMxbWFkTmV1TzIv?=
 =?utf-8?B?WVJZZkN6TnhxL1ZkM1hlODBzYUZVRnVyUUF1Zmx5REVUdnBBN3BtbVB2NVp1?=
 =?utf-8?B?NUFpTFhJdzU4a1c0eEdacUZLeEhxUVlnVklsTytVUHRNWHAyNmhzUFJ0RlVu?=
 =?utf-8?B?cUJyWkkrc0V1UHVOWHBnV1pNeFBwYkFFTGpKa29pSHB2RVhhcmhOdVN0U2ty?=
 =?utf-8?B?YU5pT1crdjNKVFdXSXJzVFVhcVV2WGxWV05oTFVMT1Nla1UwWmdMRW1YSndB?=
 =?utf-8?B?S3o3Nlc1Z3NYNXRXYXFZc3Bocmxna2g4cS9SL2VpN0Urd2FVOWU3QVBlT1hw?=
 =?utf-8?B?U0x5bjNCOFhTalNPdkxkTm4wTFJqemVHQlpLaWQzdTQ1T09UWlpDU2Rialpl?=
 =?utf-8?B?T2JkL3BaTzI2bjU1VXhnWElSSkZvdUpEMUJTa3liUHpjaWc4TWxCUlJ6VnJK?=
 =?utf-8?B?WGU3YVNpMGhidHF3Tkd1VTdKeHVBb0FDcGIxMjR4N1pZYjczaElmWTZkVC9P?=
 =?utf-8?B?bDZOcnl4T2lOaHliREdDbndiVWMvUnhzdXJQeUNNQWdiLy9EZEhIaGcxeDU0?=
 =?utf-8?B?TmM5Um81MlpUMkJTTVRPa1NoNnRNbjZBdVdFOHhJYmwvNWxBYjE1RlFRRTJG?=
 =?utf-8?B?c0JhQlc1TWRyOFpNQjNuQlFJcER0cC9UYjArMnFMcW45RkhLVGZNblZLc1hU?=
 =?utf-8?Q?1+igWC1BNIY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alJYY2ZGb3VmZHh6T1ptd1hMeW54YmhVNHRmUHFaSVNJSlVNb05jWSt5TGtD?=
 =?utf-8?B?R0luR1FSQXR0bEt4d1QzaTVXcnF5Q01zM2tuNlhTUTl3ZnpLZitjSktvME9W?=
 =?utf-8?B?RU1xaVFDbTZQRUZTSXBtWnJOS0lsTXRaNHB1STFUZXdLWlViTFNySWZmM1BE?=
 =?utf-8?B?N2p0WXFPSG05ZkdmTmJqdDZVanlZWENST2RFaDZpN1hDeFRUZFRyVXVBeTYv?=
 =?utf-8?B?a1RNMlhkc0pnS2VOcklzaGJ6WXNSTUpHT3Axc09qUE1TL3pPdEFBaU5FNURF?=
 =?utf-8?B?VG1zajJCd3JsNVg4UWwzU1ZqWjZreFJ4ZFFHRUtWbHhMUzZJR2hqUlFYNmZG?=
 =?utf-8?B?a1VFMzUwVmJCZXRqTXdueDBjTkRYSk81TFR2bzc4alNsUTgyZnpibWZMQ2xE?=
 =?utf-8?B?N0VhT3luTEpUL3R2WG9jT1EwWXJZZDFURVYvYU1zNElTMm93TFhlYVBsNGFN?=
 =?utf-8?B?Rzc5RDI4VjB6SzIzZ1F6amlwb2R0Z0phME1DOFp4bkdsTzBvMHdrbkwwczNY?=
 =?utf-8?B?Q3U0bGdZMW5LQTlMK1BJN0NDeVpSajFGamFMd2JqLzVOeTJDTjg2L2hNK0xU?=
 =?utf-8?B?NVZPOExnSDAxNnRXUzFZWHo0Zi9ROHUzV01JMGZFbmgrZmUxVTE2ZEdFd0hp?=
 =?utf-8?B?TmxIUUpITklQaFc1MU1IeSsrNUFWclFCdVpCbDlCRlhxREFTdnZpTG53Vk9y?=
 =?utf-8?B?ZXU4N3Z6UnVML2l4ZlZjWUtmZENIeGdSQ1RXODFERmF0OHJJNGdNUXgrckQ3?=
 =?utf-8?B?cWtiZXB1LzBRdDRQdFRxN21oaFRHOHVOcWtBZGRCRnlTTFltRmRZRFBTVVZE?=
 =?utf-8?B?dzVOSGRudUkwcmR4cTB3TjB3d0RwMFE0TlpKQUxMc0JxVkJJNk5jaWZ6dHdk?=
 =?utf-8?B?SzJvNEFRcmYvTEpqNDIzajduMDVMNHdxK0JtN09iQ2NKeXlrMWEwamc5L2l1?=
 =?utf-8?B?NzV6SUx3aHpHbjZ2czUwdGJ0dkNMRlZzVmVXUjRZYnRtOHg4dy94Q0ZsZ3JQ?=
 =?utf-8?B?VmhpV3BJdmZSdDZYZU5yWGFtY0NwUVNlMzBhN21odVlKWjJyem1BcTRKV1Vu?=
 =?utf-8?B?aHh3c0NLT1RWamV2ODdYMTZZdnR5LzZtWTROLzZlYUswNFcyWXF1a3ZzZnUr?=
 =?utf-8?B?ZDlrVFVFbFAydHU4QnNFckxpNkxyRG9YMG5mQ1Q2NGMrdGluVjN1bXBhVk0r?=
 =?utf-8?B?SFBvM2xRTEZJQWdJYVFnWmhaNjk3czh2amVDZGhVT1lwc0VabnJUaHRhcG45?=
 =?utf-8?B?MlZ6QnVkRHphRWFqT0xNeERLcm9pdzZpQ2VBdGcwNitXU0JDWlR2bFlXZk5X?=
 =?utf-8?B?T3RZUU51VklEUU5rYnk1WWlDemtCcnNFWnJ2amdFWVFZVWZkbE1hNXNkakl4?=
 =?utf-8?B?TEFvRzhlck1PL1RKQzNsR05kd2prZTRyV204QndEK0YrbUNndXJaOWNXZkpJ?=
 =?utf-8?B?OW9FUGhyUmZxRzFXajZPVnlvSEJIOXdnek5oeGN6ekwzSnBSR1JUQlRSUU55?=
 =?utf-8?B?K0w1NlBlcjJSbktGV2IvQjhMaGNjMzJWcVdGSEFzZXpNaXdyeEV5Ry9KcWgy?=
 =?utf-8?B?RnpGWUtrUmxjdWlpdlMvVDhLTVZaUC9NdWdLUmw3MTlsVEVGdTNLOXlMMnR4?=
 =?utf-8?B?NlFZT2RCQTloVlZiQmp4VVhYczBkbWVuMHhsUUVGSlBMRy95alEwamhobkNV?=
 =?utf-8?B?aFd0eXQ5TEhwc2xRck94eURzSU5LOFRkRXY0VEVER29oTTd0aHZnaUNUZXEy?=
 =?utf-8?B?Z3EvTHFKamowVEQzZ0kvajVETmllS0VEUStsSkYyZDEvb1haMXZtc1NBd0NX?=
 =?utf-8?B?NmNwczZ1bE5IaVpMSXZQbVg2RHVBVExBUDVSbGxkSytaS2tUSENUU1ZCeGdQ?=
 =?utf-8?B?ZXl1akxWaTNTWG9IaXZlWjB3Z0RXUFo0TUR1aEYrRE9VUEZhejhMakdoYk9Z?=
 =?utf-8?B?aGw0bnhCZWxpRXJJbEhoZ0Fod202WVlYWGtBbjZzNUl4Z0NvUUswczF3RzEz?=
 =?utf-8?B?dTZuYlhUYVdPd3lRcG5HSGZWV0kzNmdYVHBmWVdSU3NsVWJmeDNFWTdGQUc1?=
 =?utf-8?B?Rm9KSnZ4T1RYOFRMK1FOMUZjL2FsaVRoT25TdUlyMUpXYWtXZDBKclFPZUpP?=
 =?utf-8?B?VGc3RUplb1FnZjIydldRa2tKL3RzaERpUDhwSG1UZUZtZ2M2V0Z6R0dNZmtT?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e58c34b8-8fb4-4b92-12c9-08ddadad157c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:41:46.0258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+vFUllQDDvqmZLFfHnKVakFsI/Bl/CfAQG7uqOYYuIEdPYRuMdYDnSRn9I1feflei8RB0bAkGDGfWEbvVvxdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF00BBED10C
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

On Tue, Jun 17, 2025 at 02:43:27PM +0200, Thomas Hellström wrote:
> Hi, Matt
> 
> On Sun, 2025-06-15 at 23:47 -0700, Matthew Brost wrote:
> > The migrate_vma_* functions are very CPU-intensive; as a result,
> > prefetching SVM ranges is limited by CPU performance rather than
> > paging
> > copy engine bandwidth. To accelerate SVM range prefetching, the step
> > that calls migrate_vma_* is now threaded. This uses a dedicated
> > workqueue, as the page fault workqueue cannot be shared without
> > risking
> > deadlocks—due to the prefetch IOCTL holding the VM lock in write mode
> > while work items in the page fault workqueue also require the VM
> > lock.
> > 
> > The prefetch workqueue is currently allocated in GT, similar to the
> > page
> > fault workqueue. While this is likely not the ideal location for
> > either,
> > refactoring will be deferred to a later patch.
> > 
> > Running xe_exec_system_allocator --r prefetch-benchmark, which tests
> > 64MB prefetches, shows an increase from ~4.35 GB/s to 12.25 GB/s with
> > this patch on drm-tip. Enabling high SLPC further increases
> > throughput
> > to ~15.25 GB/s, and combining SLPC with ULLS raises it to ~16 GB/s.
> > Both
> > of these optimizations are upcoming.
> 
> I looked at this again. I still think there are some optimizations that
> could be done in addition to Francois series to lessen the impact of
> this, but nevertheless to quickly get the real workload running on the
> GPU again when used on a single-client system.
> 
> I raised a question with the maintainers whether we should keep
> optimizations like this that improves performance for one client at the
> cost of others behind a kernel konfig, and also whether to expose
> parameters like the width of the queue both for this purpose and for
> parallel faults as sysfs knobs.
> 

sysfs knobs sounds reasonable to me, and perhaps just default to 2
threads and live with less than peak bandwidth for prefetch now until
Francios series lands?

> Some comments inline:
> 
> > 
> > v2:
> >  - Use dedicated prefetch workqueue
> >  - Pick dedicated prefetch thread count based on profiling
> >  - Skip threaded prefetch for only 1 range or if prefetching to SRAM
> >  - Fully tested
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c |  31 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_types.h     |   2 +
> >  drivers/gpu/drm/xe/xe_vm.c           | 128 +++++++++++++++++++++----
> > --
> >  3 files changed, 135 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index e2d975b2fddb..941cca3371f2 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -400,6 +400,8 @@ static void pagefault_fini(void *arg)
> >  
> >  	destroy_workqueue(gt->usm.acc_wq);
> >  	destroy_workqueue(gt->usm.pf_wq);
> > +	if (gt->usm.prefetch_wq)
> > +		destroy_workqueue(gt->usm.prefetch_wq);
> >  }
> >  
> >  static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue
> > *pf_queue)
> > @@ -438,10 +440,24 @@ static int xe_alloc_pf_queue(struct xe_gt *gt,
> > struct pf_queue *pf_queue)
> >  	return 0;
> >  }
> >  
> > +static int prefetch_thread_count(struct xe_device *xe)
> > +{
> > +	if (!IS_DGFX(xe))
> > +		return 0;
> > +
> > +	/*
> > +	 * Based on profiling large aligned 2M prefetches, this is
> > the optimial
> > +	 * number of threads on BMG (only platform currently
> > supported). This
> > +	 * should be tuned for each supported platform and can
> > change on per
> > +	 * platform basis as optimizations land (e.g., large device
> > pages).
> > +	 */
> > +	return 5;
> > +}
> > +
> >  int xe_gt_pagefault_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe = gt_to_xe(gt);
> > -	int i, ret = 0;
> > +	int i, count, ret = 0;
> >  
> >  	if (!xe->info.has_usm)
> >  		return 0;
> > @@ -462,10 +478,23 @@ int xe_gt_pagefault_init(struct xe_gt *gt)
> >  	if (!gt->usm.pf_wq)
> >  		return -ENOMEM;
> >  
> > +	count = prefetch_thread_count(xe);
> > +	if (count) {
> > +		gt->usm.prefetch_wq =
> > alloc_workqueue("xe_gt_prefetch_work_queue",
> > +						      WQ_UNBOUND |
> > WQ_HIGHPRI,
> > +						      count);
> 
> Can we avoid WQ_HIGHPRI here without losing performance?
> Also if count gets near the number of available high-performance cores,
> I suspect we might see less effect of parallelizing like this?
> 

Let me test that out today and give some numbers breakdown of bandwidth
per thread count / effect of WQ_HIGHPRI.

> 
> > +		if (!gt->usm.prefetch_wq) {
> > +			destroy_workqueue(gt->usm.pf_wq);
> > +			return -ENOMEM;
> > +		}
> > +	}
> > +
> >  	gt->usm.acc_wq =
> > alloc_workqueue("xe_gt_access_counter_work_queue",
> >  					 WQ_UNBOUND | WQ_HIGHPRI,
> >  					 NUM_ACC_QUEUE);
> >  	if (!gt->usm.acc_wq) {
> > +		if (gt->usm.prefetch_wq)
> > +			destroy_workqueue(gt->usm.prefetch_wq);
> >  		destroy_workqueue(gt->usm.pf_wq);
> >  		return -ENOMEM;
> >  	}
> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h
> > b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7def0959da35..d9ba4921b8ce 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -239,6 +239,8 @@ struct xe_gt {
> >  		u16 reserved_bcs_instance;
> >  		/** @usm.pf_wq: page fault work queue, unbound, high
> > priority */
> >  		struct workqueue_struct *pf_wq;
> > +		/** @usm.prefetch_wq: prefetch work queue, unbound,
> > high priority */
> > +		struct workqueue_struct *prefetch_wq;
> >  		/** @usm.acc_wq: access counter work queue, unbound,
> > high priority */
> >  		struct workqueue_struct *acc_wq;
> >  		/**
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 6ef8c4dab647..1ae8e03aead6 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -2885,52 +2885,130 @@ static int check_ufence(struct xe_vma *vma)
> >  	return 0;
> >  }
> >  
> > -static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +struct prefetch_thread {
> > +	struct work_struct work;
> > +	struct drm_gpusvm_ctx *ctx;
> > +	struct xe_vma *vma;
> > +	struct xe_svm_range *svm_range;
> > +	struct xe_tile *tile;
> > +	u32 region;
> > +	int err;
> > +};
> > +
> > +static void prefetch_work_func(struct work_struct *w)
> >  {
> > -	bool devmem_possible = IS_DGFX(vm->xe) &&
> > IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > -	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +	struct prefetch_thread *thread =
> > +		container_of(w, struct prefetch_thread, work);
> > +	struct xe_vma *vma = thread->vma;
> > +	struct xe_vm *vm = xe_vma_vm(vma);
> > +	struct xe_svm_range *svm_range = thread->svm_range;
> > +	u32 region = thread->region;
> > +	struct xe_tile *tile = thread->tile;
> >  	int err = 0;
> >  
> > -	struct xe_svm_range *svm_range;
> > +	if (!region) {
> > +		xe_svm_range_migrate_to_smem(vm, svm_range);
> > +	} else if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > +		err = xe_svm_alloc_vram(vm, tile, svm_range, thread-
> > >ctx);
> > +		if (err) {
> > +			drm_dbg(&vm->xe->drm,
> > +				"VRAM allocation failed, retry from
> > userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> > +				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +			thread->err = -ENODATA;
> > +			return;
> > +		}
> > +		xe_svm_range_debug(svm_range, "PREFETCH - RANGE
> > MIGRATED TO VRAM");
> > +	}
> > +
> > +	err = xe_svm_range_get_pages(vm, svm_range, thread->ctx);
> > +	if (err) {
> > +		drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u,
> > gpusvm=%p, errno=%pe\n",
> > +			vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > +		if (err == -EOPNOTSUPP || err == -EFAULT || err == -
> > EPERM)
> > +			err = -ENODATA;
> > +		thread->err = err;
> > +		return;
> > +	}
> > +
> > +	xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET PAGES
> > DONE");
> > +}
> > +
> > +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> > +{
> > +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> > +	u32 j, region = op->prefetch_range.region;
> >  	struct drm_gpusvm_ctx ctx = {};
> > -	struct xe_tile *tile;
> > +	struct prefetch_thread stack_thread;
> > +	struct xe_svm_range *svm_range;
> > +	struct xarray prefetches;
> > +	bool sram = region_to_mem_type[region] == XE_PL_TT;
> > +	struct xe_tile *tile = sram ? xe_device_get_root_tile(vm-
> > >xe) :
> > +		&vm->xe->tiles[region_to_mem_type[region] -
> > XE_PL_VRAM0];
> >  	unsigned long i;
> > -	u32 region;
> > +	bool devmem_possible = IS_DGFX(vm->xe) &&
> > +		IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> > +	bool skip_threads = op->prefetch_range.ranges_count == 1 ||
> > sram;
> > +	struct prefetch_thread *thread = skip_threads ?
> > &stack_thread : NULL;
> > +	int err = 0;
> >  
> >  	if (!xe_vma_is_cpu_addr_mirror(vma))
> >  		return 0;
> >  
> > -	region = op->prefetch_range.region;
> > +	if (!skip_threads)
> > +		xa_init_flags(&prefetches, XA_FLAGS_ALLOC);
> >  
> >  	ctx.read_only = xe_vma_read_only(vma);
> >  	ctx.devmem_possible = devmem_possible;
> >  	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> >  
> > -	/* TODO: Threading the migration */
> >  	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> > -		if (!region)
> > -			xe_svm_range_migrate_to_smem(vm, svm_range);
> > +		if (!skip_threads) {
> > +			thread = kmalloc(sizeof(*thread),
> > GFP_KERNEL);
> > +			if (!thread)
> > +				goto wait_threads;
> >  
> > -		if (xe_svm_range_needs_migrate_to_vram(svm_range,
> > vma, region)) {
> > -			tile = &vm->xe-
> > >tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> > -			err = xe_svm_alloc_vram(vm, tile, svm_range,
> > &ctx);
> > +			err = xa_alloc(&prefetches, &j, thread,
> > xa_limit_32b,
> > +				       GFP_KERNEL);
> 
> No locking (like in xarray) required here since prefetches is a stack
> variable, and no reason to expect cache trashing so use a linked list
> or simple array instead of an xarray?
> 

I think a simple array would be a good choice. Let me refactor this.

> 
> >  			if (err) {
> > -				drm_dbg(&vm->xe->drm, "VRAM
> > allocation failed, retry from userspace, asid=%u, gpusvm=%p,
> > errno=%pe\n",
> > -					vm->usm.asid, &vm-
> > >svm.gpusvm, ERR_PTR(err));
> > -				return -ENODATA;
> > +				kfree(thread);
> > +				goto wait_threads;
> >  			}
> > -			xe_svm_range_debug(svm_range, "PREFETCH -
> > RANGE MIGRATED TO VRAM");
> >  		}
> >  
> > -		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> > -		if (err) {
> > -			drm_dbg(&vm->xe->drm, "Get pages failed,
> > asid=%u, gpusvm=%p, errno=%pe\n",
> > -				vm->usm.asid, &vm->svm.gpusvm,
> > ERR_PTR(err));
> > -			if (err == -EOPNOTSUPP || err == -EFAULT ||
> > err == -EPERM)
> > -				err = -ENODATA;
> > -			return err;
> > +		INIT_WORK(&thread->work, prefetch_work_func);
> > +		thread->ctx = &ctx;
> > +		thread->vma = vma;
> > +		thread->svm_range = svm_range;
> > +		thread->tile = tile;
> > +		thread->region = region;
> > +		thread->err = 0;
> > +
> > +		if (skip_threads) {
> > +			prefetch_work_func(&thread->work);
> > +			if (thread->err)
> > +				return thread->err;
> > +		} else {
> > +			/*
> > +			 * Prefetch uses a dedicated workqueue, as
> > the page
> > +			 * fault workqueue cannot be shared without
> > risking
> > +			 * deadlocks—due to holding the VM lock in
> > write mode
> > +			 * here while work items in the page fault
> > workqueue
> > +			 * also require the VM lock.
> > +			 */
> 
> Hmm. This is weird. In principle, a parallel fault handler could be
> processing the same range simultaneously, and blow things up but since
> we hold the vm lock on behalf of the threads this doesn't happen. But
> if we were to properly annotate, for example drm_gpusvm_get_pages()
> with drm_gpusvm_driver_lock_held(), then that would assert. I don't
> think "let's hold the vm lock on behalf of the threads" is acceptable,
> really, unless we can find other examples in the kernel or preferrably
> even in drm.
> 
> This means we need some form of finer-grained locking in gpusvm, like
> for example a per-range lock, to be able to relax the vm lock to read
> mode both in the fault handler and here?
> 

This is the ultimate goal—to allow per-VM parallel faults. I hacked
together finer-grained locking a while back, but held off on posting it
until madvise and multi-GPU support landed, to avoid making it harder
for those features to merge.

I can post that refactor now if you think this a prerequisite to this
series.

> 
> > +			queue_work(tile->primary_gt-
> > >usm.prefetch_wq,
> > +				   &thread->work);
> > +		}
> > +	}
> > +
> > +wait_threads:
> > +	if (!skip_threads) {
> > +		xa_for_each(&prefetches, i, thread) {
> > +			flush_work(&thread->work);
> 
> Similarly this adds an interruptible wait. Ideally if we hit a signal
> here we'd like to just be able to forget about the threads and let them
> finish while we return?
> 

Is flush_work interruptible? This is undocumented and but from a look at
the code I don't believe it is. I agree ideally we'd want this be
interruptible but unsure if this is possible with the current workqueue
code.

Matt

> Thanks, 
> Thomas
> 
> 
> 
> > +			if (thread->err && (!err || err == -
> > ENODATA))
> > +				err = thread->err;
> > +			kfree(thread);
> >  		}
> > -		xe_svm_range_debug(svm_range, "PREFETCH - RANGE GET
> > PAGES DONE");
> > +		xa_destroy(&prefetches);
> >  	}
> >  
> >  	return err;
> 
