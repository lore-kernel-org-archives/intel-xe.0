Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498D60A2604
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AXJ6djbg;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Nt8nlnDk
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580B210FD22;
	Wed, 18 Nov 2026 14:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF76E10FD57
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795012094; x=1826548094;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ps5osopjOgbae9CtGCfmmAfuuZDvHT8JSo2HGEEWtxY=;
 b=AXJ6djbgjO5tEKxMq1AGoyT0eUgGQDt+OlX0qTwddhZY4I+/iDPR1YcO
 F0FnJo98pL7xMPCmwfC04GBh+Mi2dvMWPBPvs6aZmaLoNr9hqLlowO251
 5m3DuVHt+a3v4h5Q/1SwW+S6gMQgTVjiiGtjPQhhK2z8BR56pwYIvBBQ3
 0PVvlr96GDR4Pd0siu5uUM3jWACybZlNMWr0pnMvjySft5LKlNnGuY5yg
 2YCzpI/Hi49+3O8JdNxlIb5V8XxEA6+BmJWVgBUKAcYXJx3uUojhWKZ0K
 hJvJFW8YSyDHgPgxsNHdGd6LeJQsXGqpwBH97SWEA+NXJ7vLsO/bLV+qc Q==;
X-CSE-ConnectionGUID: F30tjAT1QXW9/eu/qMVPbw==
X-CSE-MsgGUID: eQPAMUhkSCWwGaPAstEnIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3744878"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3744878"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:28:13 -0800
X-CSE-ConnectionGUID: 1mrmjDA6SjaSGXK5+h2Big==
X-CSE-MsgGUID: SFdGD0DfRm+sK/3fOwmTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="12091218"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 06:28:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 06:28:13 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 06:28:13 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 06:28:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb6og03xECq/mNssG0n+1WcYnsZJk5TxEaqIXhRM+tNWHozz0wbJbPk8atdUWy3qB4oFGq0BtA/Kg7jTYDTkIXLpomW5/fvX/m48151vCWs9VQNGZAAKpyOosjwwqxprXCnNXXA1AJOSZbWWMisV5+EJGcmlU68C7BjcZ5peiiBnESredhibbzgCvhmP8dxkSBidWCk1r7gC+5/ploQjKbZWUGQwlwS+tAZHSUT1sSQ4bo+2HV3nbA/3LNaeWHt6xrk6gzCsWRmV51YCpATPH2qTIajYdXrS4MVdb3Mo5xBfkT6wA4Uj1rV8wDRoRTO+GY0zv55Vtqj4JlAD2HkILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhY/6ynZ5uuloDBDDVXLSpvfZtycYM7WKAo2+v15KHg=;
 b=oO1T/CoIgHdg+FkE0CDI/y8bYufsHWt8WKeTOFJndKzqWscUDEARqitEr4mwtWrKKlQZUUwoHtzqTGtFaxcC0XHQcz421Art0b+5PrkuNaoMZ4Fmx5qvXUs68xwkdl04klR4XvhvLsIQDVFlBJQFYF65o2ks+mRMXfoenU5DaK31LxeZJOBIs08uofnWPRS3YSMSaZoPDtgdsnlZhwwmOO1LGk5g6uyN7pZ0GmuXjeBo8iCKG9AHKMb6BYNrObzVodMDf+D6rQwK9GOD1CvGFUTxr4hZIZoXAMJleG4FSVhKJ75lAws37oj7xSF21jtUOBthWWLr4/wSUfitUsjhWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhY/6ynZ5uuloDBDDVXLSpvfZtycYM7WKAo2+v15KHg=;
 b=Nt8nlnDkbCv4/LnQ3w/XSN7lBvwYgVr1oqCUGr6FFijYWIvnRVk+RMQ3G8TgnATOuDElZo/NSwcPF12ay3OBXIQ2v95+DL1VVffx6MsR5RiwqlA1ddal10Fp+JAYS2oVCYpQ8bp4dppvrJ5Zq9SKjWzWTUHxnZylth+ieaVbXdg=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by CH3PR11MB089109.namprd11.prod.outlook.com (2603:10b6:610:361::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 14:28:10 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 14:28:10 +0000
Date: Wed, 18 Nov 2026 19:58:03 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Sundaresan, 
 Sujaritha" <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, Stuart Summers <stuart.summers@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Reset GuC before unmapping its post-hwconfig
 buffers
Message-ID: <av2184pRAeesmIai@bvivekan-mobl1>
References: <20261019100448.759503-1-sujaritha.sundaresan@intel.com>
 <at9epeRtNe-eKEdY@bvivekan-mobl1>
 <3032c66b-9718-4917-b335-caea298c794e@intel.com>
 <f4facd87-04f7-47b8-8cfb-dfa42fae965d@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4facd87-04f7-47b8-8cfb-dfa42fae965d@intel.com>
X-ClientProxiedBy: MA5PR01CA0199.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|CH3PR11MB089109:EE_
X-MS-Office365-Filtering-Correlation-Id: 042d724f-9900-413c-af56-08df45802bba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|261022105027099003|261102123227099003|261028144727099003|261021123027099003|261021121427099003|261022075727099003|261026121527099003|5023799004|11063799006|261026140227099003|4143699003|56012099006|10067099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 4VHSmecGVC+pU3vxueH1r/ZqApyIzyM33BJO32sSfo695BzNK4IqoeuWdTMtJjEs4u/cg+jk9xQ4MVrgO3F36QePTwEOcjehuTF07aiEHBKRkJD8XJikiV4puiFSxANdTZkS5yfTSMTGzwyStTqEXHnW/D+Tz5FUp+c0kGKplqrITHCFVgUV+ZCXqRQcsYwoX6X9iAlCvB1HRs11KQs8NRt/9REDaKWGJpj1eqoQDHU0XveBn3YW+8KH+dqs7KazHumrkSGJpF2dgLsd1zXHkya7jlx3NXwfHfxYKJzc4Kkb3bGBcVLrcw32XzZiux9Fl7mtFYVE7TEMz4a4Ve9KUJLvziGO8H+ynC1qHsJLZc9yk6Nxr1vXooaodkBaA6W8drUHLNcAPOvzWUv3DcuuQGgINkKvaAUsXJkvyCj0zsAAFNj7W6GL2byUjGHpbGDjbQBineDst1QrzAdZ3unr0dPhWtykxcb2Ka0XxtyzpOW35lkuRsl8UV3ZbWXiiFSblQ2SRNgi9fdmqlnw9ap/cAY7W1yR3qpXeyMI5ZIcKFo/EGXc/WkUI1vt03TKYF3Z8sbQXoerIisU/LUI6tJdmvEYg2vuScfahPAI0TYj2xsRYDZctmdkNxKMKDGwom1nChHrM/AslvZn5glEuDoweaf+TW2eSkMeZ0X4L6GAi3Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(261022105027099003)(261102123227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261026121527099003)(5023799004)(11063799006)(261026140227099003)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVZiajY4ZGY4UTVEMUhrVDVEWmJTbEJFSlFkWDFTTEJCUmpQZjVxL3JYUFNn?=
 =?utf-8?B?bUdEYTdSNWp6NDdycFl3MG9pVEtuQkttOGsyU3ZGZjlWYTdrekZUbG5xM09T?=
 =?utf-8?B?NS9lRzhzc0N4bmhydGNDT2ZBMzVucFhtZmJVVWRyaUdIYmR6b3QrMGVpb2JX?=
 =?utf-8?B?Y202c3JickN1VnBnRlJwbG1RZzJGcGxEKzRJQ3d3VjF6dTdTOHVEc2huaG1t?=
 =?utf-8?B?WWZmVjVGeVd4VXRSRGJlTFc0cnNLSmJRQUlnZTVVMGZMTDVCN0RJL0dJdktK?=
 =?utf-8?B?RVFDYmJNL0Y5d1ZUalhITU0wVGJMdXRMRVZGS2t6Q2IrWUN5ZGxGU2VGVU1k?=
 =?utf-8?B?cFByL1Q4ZnNHTDdTQXRKSFp1MHRzOHEweWR0eVZvbHFreEdzdndkUUxRaysz?=
 =?utf-8?B?ZmZPKzRkTjZtNEQzQXRXOWFnM05SSHNLS3hPZHNnb05DYWw3WEhHdjRsOFBq?=
 =?utf-8?B?Y2J0MWRpcmdwaEpyc0ExVUdlS1psTjkvWU5YUVVBQUR6ZUFERkwwK2M2c09P?=
 =?utf-8?B?QmtKbHpnMk5MTmwrQk1IWmJXbmp5cWdkdHZZQ1V6dHc2WVY3TWZETWZBYU9p?=
 =?utf-8?B?ZHQyWWwvVStWL3RYdDJSL0RUSWcwd0dVa2FUU0tSampRUW5QeWoxSmE0RHUw?=
 =?utf-8?B?WFF0SXQ3WDI2VXcvY2RDM1BnOXBJSDk0ZTBVbkNCcStUUU0rZENCOEVMUWtE?=
 =?utf-8?B?MUVFSnlwS1lWcVF4cDQ3eWxGWmtOdDdhRzVNbjhHL3FsSVVlQndoTEZmSjY3?=
 =?utf-8?B?OE1TNzBUNFF0Ny9YRUY0eXVOUnNUUkI5Q1Q0aktrbDJGanR1cGYxTndSaExy?=
 =?utf-8?B?ZCtUdXZMd2trS1h1cC80OVl2L2ZoZngxSXFidmh5ZGNPV3pLQkdCTGZCQm5q?=
 =?utf-8?B?LzZTVEZkM3R4TzlCYU5OVklvamFQMUx4MWJva1QwZ3JwbkVHVXJxZWliMzJX?=
 =?utf-8?B?eWtLS1V6K1BWR0dzNitOUnp0ZGZlNzBhdG9McWFudVZIditxZDBoQy9neGNm?=
 =?utf-8?B?cUMrUUxNdS9VN09HZWdqTlprWk50WkF2aXcrcFpIdWlHdXdpbnhOdE1YVDNV?=
 =?utf-8?B?WjlrRXRTc3AwRW9YU3RKd002ZjA4THlLV3pTZUZ6OHJXZndvTjVCUzk4R3VH?=
 =?utf-8?B?bHNROWw3RTNxVThveFVrMENRTHgvNmh6YnhnNFA0bFdSUCt6ZjBIL2FzS3NJ?=
 =?utf-8?B?Rk4zNVUybzQzWGVzYjNNcE40RDd4Nm9mWTVFdWo0alRBVkpDdThtSUNDMmYr?=
 =?utf-8?B?VmZIc1NCZTNUZm9aVTJMMjIzM21VSms5WGc0c1I5bENVaTZmM2JodE1EZUdi?=
 =?utf-8?B?WHRLclkrRUszUjR6T2FWeTVWTnJrZHdOT1ZXSGlEM01sMTE5anNGakJUaFRQ?=
 =?utf-8?B?MVpnQURrQXpPWkkxNnl0VWhPYnhqV1JiZGpNa2VxSkZOSk9qd09kQmtCMWtL?=
 =?utf-8?B?emF5eWwwTVhRWVM0QWVIcmJXQ2VxRW5mVTNXbjhTaUpXeG50cWVGdXI4QlNK?=
 =?utf-8?B?VVJ0aDlyWUlMQytiSVUxSUFkSjFUVXpZR3c3NVhtUjhNWkc2djBwUVBLOXJ4?=
 =?utf-8?B?ZEtPYlM4d0c2SXkrSDUzRDFnTjJCZnV2SzM4WWsyOC9ESGI1NTk3REg2YjNQ?=
 =?utf-8?B?Umo0Qk9uZGttRWNTdWlkU2lTcElnL1lTVHA1YmgrcWdqeTk5bWN4WFM5N3FS?=
 =?utf-8?B?Zlllc3I4enR1SlM2dDkyUmRVTnF4QlFOODRuLzYrem84VzZZUFlzQTRFQTMx?=
 =?utf-8?B?UU1zUDB2dS9taFJqNm1Fby9kRHhlY0FVcnNzNkloa0F6Wk8relgyeUM3UXpT?=
 =?utf-8?B?VVREbDRJTXpxRk5nNjJGVHNKdFdMUHd0U3ZZVCtCWFFMQ2loRU5UNmo2d0Z4?=
 =?utf-8?B?UmE2UlJqZXRxVlFHMGQrSWJJRUQ4N20rQ2N4Y1F1cEx3OEdRRjJKZzJUWEEy?=
 =?utf-8?B?WTlHc0p4cmh0WGFJTWRzSDN5NExyODg4UzlDSjJpdXpiYnd4S3V4MHVWbUY2?=
 =?utf-8?B?QXRQa2Flc2twSkdmSzhpVTJIdzJNdDRCR2RYYlRZaTFBREtONlZUYUpINk1h?=
 =?utf-8?B?eDlnV0d3ZXNXcUpxS0Z0OHdLdDAvZ2J2ZktmQ2VScWF0eWppSFh2bXoySmh6?=
 =?utf-8?B?YWlpSW9oTklVSDg0cGhZdXdQSlJRRWlnVmt5bk9wWDlmQnZSUkp6Vll3amRO?=
 =?utf-8?B?eU9aQWFyQ0crV3ZBSE1mWm5mOGJPSzdaR3lFRkdFUTZFM1FKYW9ISHNDSWdt?=
 =?utf-8?B?SERLdjlZMHJ1MkRFR0J5VFJlZ3UzSE1XTmhRQlZSM0RIRW44dUowdEs1Zzl4?=
 =?utf-8?B?V1VMT3BCU1E4SkZBcTFYdDl4OW1RYitmbm04L0hsR1NweS9EMmZCcVdIeGhY?=
 =?utf-8?Q?e2+DVtLGTIM4EJ0GjDu5xpQPxJEJmIhj9gql4?=
X-Exchange-RoutingPolicyChecked: clzIGYCs247iec7ig9JQ2CI3s0DBmEitzA/gU9cfnxy2MBBRleeiJ1NZSv893B0v3K5UDKWpai9Lqgin5P60eHZ4LrHbZQOK2Fic+PV5z2pFYvQ8K1oS6V3CIBiMMTPzdX1Y82nfmrxuakVC8VDCJ++ZymtjzeKWrX4hbY+8Hza1v4Ja4Fbs//VIrCedOgyPxtai9jAF0s9I6n87TXLjPa1CaNJfTELP+4gOd5goT1qVCfuqoeOmmDzQ1jGu6oyNHXfOcVEMO182xbu8kk9T+tXk8q+jcknj3jRn73mt7lsRtNBezjHsrlyJH40Ij5ATqRNyMry4zzPH65Z/3PQG5Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 042d724f-9900-413c-af56-08df45802bba
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 14:28:10.5075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daAhjopdBpFB1hkVx2esZ2LGFJrY9M5nBolRJjudm0suRQYyilq4T5Ca+4JTnnh9kVtKmvBWDtN7w0ajlhh+6THTWJ/P5kPsoQLauw2eJ0sucx5EmPD6RVQtEQdHytpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB089109
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 13.11.2026 11:51, Ceraolo Spurio, Daniele wrote:
> 
> 
> On 11/3/2026 11:37 PM, Sundaresan, Sujaritha wrote:
> > 
> > 
> > On 10/26/2026 7:37 PM, Vivekanandan, Balasubramani wrote:
> > > On 19.10.2026 15:34, Sujaritha Sundaresan wrote:
> > > > guc_fini_hw() resets the GuC on teardown, but it is registered before
> > > > xe_guc_init_post_hwconfig() (re)allocates most of the GuC buffers. As
> > > > devm actions run in reverse order, these buffers get unmapped from the
> > > > GGTT while the GuC is still running and may still access them. When
> > > > unmapped GGTT entries are left invalid, this results in a GuC page
> > > > fault on unbind or probe failure.
> > > > 
> > > > Re-register guc_fini_hw() after all the GuC buffer allocations, so the
> > > > GuC is reset before any of them is unmapped. Keep GuC submit and RC
> > > > teardown running before the reset, as they still need to stop or talk
> > > > to the GuC.
> > > > 
> > > > Assisted-by: LLM
> > > > Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
> 
> Do we need a fixes tag for this?
> 
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_guc.c | 30 ++++++++++++++++++++++--------
> > > >   1 file changed, 22 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > > > index 6c35474ab843..14ae73844d76 100644
> > > > --- a/drivers/gpu/drm/xe/xe_guc.c
> > > > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > > > @@ -882,9 +882,10 @@ static u32 guc_additional_cache_size(struct xe_device *xe)
> > > >    */
> > > >   int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > > >   {
> > > > +	struct xe_device *xe = guc_to_xe(guc);
> > > >   	int ret;
> > > > -	if (IS_SRIOV_VF(guc_to_xe(guc)))
> > > > +	if (IS_SRIOV_VF(xe))
> > > >   		return vf_guc_init_post_hwconfig(guc);
> > > >   	ret = xe_guc_realloc_post_hwconfig(guc);
> > > > @@ -897,28 +898,41 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> > > >   	guc_init_params_post_hwconfig(guc);
> > > > -	ret = xe_guc_submit_init(guc);
> > > The teardown function guc_submit_fini, registered by xe_guc_submit_init,
> > > is invoked before releasing the buffers shared with GuC.
> > > 
> > > guc_submit_fini stops guc submission and also does a soft reset using
> > > XE_GUC_ACTION_CLIENT_SOFT_RESET.
> > > The GuC specification says, on XE_GUC_ACTION_CLIENT_SOFT_RESET, the GuC
> > > revokes the log and CTB buffers.
> > > 
> > > So I believe, after that GuC shouldn't be accessing any buffers shared
> > > by XeKMD. It must be safe to release the buffers after sending
> > > XE_GUC_ACTION_CLIENT_SOFT_RESET.
> > > 
> > > Did we understand why are seeing this issue now but not earlier?
> > > Is it a regresssion from a patch, either in KMD or GuC?
> > > 
> > > Regards,
> > > Bala
> > 
> > Hi Bala,
> > 
> > 
> > Thanks for the review. I did some more digging here.
> > 
> > 
> > The soft reset in guc_submit_fini() goes through fine. Right after that
> > we unmap the GuC log buffer
> > 
> > (0x1e6a000-0x286b000), and the GuC faults reading 0x1e72138, which is
> > inside it.
> > 
> > So from what I see  the GuC is still touching the log buffer after
> > XE_GUC_ACTION_CLIENT_SOFT_RESET.
> > 
> 
> The CLIENT_SOFT_RESET was initially introduced for use by VFs, to allow a VF
> to reset its own state. Although a PF can also use this command, the type of
> state being reset doesn't change, so global allocations (GuC log, ADS) are
> not cleared by this command. I believe that the "log" in the specs refers to
> extra log buffers that can be registered with the GuC to get extra info
> (like the engine utilization buffers), but I'll ask the GuC team to clarify
> the specs.
> 
> I agree with the approach in this patch, we should definitely reset the GuC
> before we start unmapping its buffers. I have not reviewed the code changes
> yet, so no comment on those.
> 
> Daniele

That explains why we are seeing this issue now. Patch looks good to me.
Please add the Fixes tag as pointed by Daniele.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> 
> > 
> > ee460b8855d4 ("drm/xe/ggtt: fault on unmapped GGTT for multi-queue
> > platforms") dropped the scratch
> > 
> > page on multi-queue platforms. Before that, this late read just landed
> > on scratch; now it faults.
> > 
> > Thanks,
> > 
> > Suja
> > 
> > 
> > > > +	ret = xe_guc_pc_init(&guc->pc);
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
> > > > +	ret = xe_guc_engine_activity_init(guc);
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = xe_guc_pc_init(&guc->pc);
> > > > +	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
> > > > +					      guc_additional_cache_size(xe));
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = xe_guc_rc_init(guc);
> > > > +	/*
> > > > +	 * The GuC keeps accessing its GGTT-mapped buffers until it is reset,
> > > > +	 * so move guc_fini_hw() after all GuC allocations above to have the
> > > > +	 * reset done before any of them is unpinned and its GGTT PTEs cleared.
> > > > +	 * Teardown actions that must run before the reset, either because they
> > > > +	 * still talk to the GuC (like GuC RC) or because they stop the CT and
> > > > +	 * submission (like GuC submit), must be registered after this point.
> > > > +	 */
> > > > +	devm_remove_action(xe->drm.dev, guc_fini_hw, guc);
> > > > +	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = xe_guc_engine_activity_init(guc);
> > > > +	ret = xe_guc_submit_init(guc);
> > > >   	if (ret)
> > > >   		return ret;
> > > > -	ret = xe_guc_buf_cache_init_with_size(&guc->buf,
> > > > -					      guc_additional_cache_size(guc_to_xe(guc)));
> > > > +	ret = xe_guc_db_mgr_init(&guc->dbm, ~0);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	ret = xe_guc_rc_init(guc);
> > > >   	if (ret)
> > > >   		return ret;
> > > > 
> > > > base-commit: 5bc00022b24f8a7bc6630609e9fd93dd977a87d3
> > > > -- 
> > > > 2.34.1
> > > > 
