Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C15C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E0410E045;
	Thu, 26 Jun 2025 07:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0W5+bsz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B9710E045
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750923837; x=1782459837;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rMsIC9wZp/9BlQkaRq4+V1ZO+1MK0Jh8W3KT7LBVVac=;
 b=X0W5+bszVWIZ1AwNPoU+AU+5+0aCupWwl+l5wAnJpk5dhJSyOx9LoSsF
 Rx1hqTWnuoePawYdvQc89NMYzIdEfVJW0lvmNeZO6oAUWcUugDRl7mkah
 MpLHJnnWBCIwjOJWiWCN6uI+q/joALytwF85MvPZqeyXyNoyhXPeqOpT1
 2tHUBtjm5hXEOyXEm40Hu3WCkfFMm9JgMReWs++p/Fg/8vgCpXGn5o05z
 V81z5XSP/x9QKGlCuK5t6HzZY0ZVTC8LNQv8Ln99QTc1JRdui5HejLXZr
 5uOzb7RXD4MTlqZT4gIg/hrsV5kjHYBLzoMt4nGe3NXLxJgITbYkJbrD+ w==;
X-CSE-ConnectionGUID: Ngv2rWVET42aPmrQA22EMA==
X-CSE-MsgGUID: /Pb2XD0vTs+B9NyMmqAilA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78645087"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="78645087"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:43:53 -0700
X-CSE-ConnectionGUID: BUn+DozsQfGvnwYdASxRxw==
X-CSE-MsgGUID: SGUUmFLVTgC1JeBsmEOb1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="176105709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:42:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:42:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:42:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2fTtn5FiLwGcEPdAXog2fdTTrw8ZlVs/gdF8zQpB+rEIbSBHhlY2ATcc0hSs/hcW70qOYPQQUSCcwH86A1mMHXhGZMZKa0ZzDHDXaX+TU2D0CAZIoLiqi8JnQTnPAthc6Ibg9+ttpp4daUMmWXU+rsCfTnuj6+vTKg9ZgElwvLjw3mI5LkaFLanuvMqGHUCD4El0E17XYVtCIUQ/2hmDy/Zh1Oub1wSUTt5A7xxQhr/ITnLFS/8JN4c3u4iealkxST2TTfsseb3YXV5VDAwaGs4w7Zmvf2YFiT11j38YAphNVrC3BiOG1XItQ5IDQBYq0Tga3Zxg6GPyZag6PfFcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9zkt7Dnuxfpg2OiJNpAtD+IPA62MbQl2Qx/b58bNiM=;
 b=YHlv5kc5k7DDhVH2DF7G25VBJPStWBHBT7Md6lJg3oreMeYFWhYNVMaUYEQzzQJlu6zaZwwEyPhM5o356yvWl0k+2bK0oW2BmVJKylb8MLW08R/sWg2DXbx/kJLY31quc0o5hebsyxBzafg0IN4l7ShUH00FE5UpbA0ODnz/WmKS4qwKTh8dz/MVIffwQTnVxRP3yMzQMSnp2kzvkKfyY8xl8X42EUhQWDhRGoNx6ZiZfpgbe3ENJkKOEdUPfUarV2ROox65JyOiBvdmak3oELuEi9YOiQH/TW6V7DdaqlE2EQ/lmdJ3UKDdi+BRKRNb6OtkXa9Es96pAMF5sF1ztA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH8PR11MB6903.namprd11.prod.outlook.com (2603:10b6:510:228::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 26 Jun
 2025 07:42:30 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:42:30 +0000
Date: Thu, 26 Jun 2025 09:42:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/pf: Stop requiring VF/PF version negotiation
 on every GT
Message-ID: <20250626074227.eslhw4ot3jvt4rsy@intel.com>
References: <20250624200923.1348-1-michal.wajdeczko@intel.com>
 <20250624200923.1348-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624200923.1348-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: LO2P265CA0231.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::27) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH8PR11MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: 917f541f-a97e-4992-f5a8-08ddb485013e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cmowR3lCY1dGTGszVFl1Z0EwZ3RQWXMxUTVqN2FDL01iRFBBemM0Q2ErRGNo?=
 =?utf-8?B?RTY5NVB3bnZ0eWUyNnQvUmlVMnZiL05NcUlTeTlIWTVqZ0JRN1E4L0E5SUlk?=
 =?utf-8?B?RmhuNlFaRzRzOGNHMlZLV2NjNEJTTFNGTjhoTndWb0tKcWxKQjNnbjNuNHV0?=
 =?utf-8?B?TzE0TUF0NGEvQW5PN3V5UGZNK2lENGdEcW1aakdjZXNkTHB6SU83U2pvM2Mw?=
 =?utf-8?B?NHFkend5eXpGc0pjTDF6cytoaHMrMk0zeERpQnI4Tld4ZU1TOEF3TEpaSG5B?=
 =?utf-8?B?ajFEZWZrem5FZmJnclcxeEU5eGJybTNZS2JGS2piclRUYVczOFlkd1lQbng3?=
 =?utf-8?B?aHZzbXFFeW9pSlRpOGMyZmFxMEl5MkJWS2gwWnVJdUNTSnJnTitSQ2FyWjhJ?=
 =?utf-8?B?Yy85ckFhVzd4ZUUrcmcrMFFHYmxKc0xWT2lRTmx5aWJLVWJRdm9WL1oxQ01t?=
 =?utf-8?B?U1E0WEFSSTFpVnlBSjF0K01IQUpac3pNSjFtamJxdUJ2cjF6K3ZXVStXOHVp?=
 =?utf-8?B?TWswMTNvVXRhNzdjaG00V1kyNW1JNVEvdVdaWk4vOVM4ZkVlQmdZb2JKbGxR?=
 =?utf-8?B?c2t4MEtKa3VMdkpuRjlDd3pSRTg4dy9BWHhycjhCaXhnM0crdW9oLzNQdlUr?=
 =?utf-8?B?dlVUQTZaQ0QxaHZLblp6dmxwL28vL0ozNzBUUUx3c2RBZTZqWGpLd2FQWXNu?=
 =?utf-8?B?ODhRVDZiTnR6bTM2dVhVTk5TVlluWHN5d0IzTHhEN3lnM09RY3pOeEVRZGJq?=
 =?utf-8?B?WEVRcUFMMFhySHFCdFFzazJUeThqejZTR053L0xHZEpqZ3V1RFZjRkZoMnF2?=
 =?utf-8?B?QkV2emwzblhtM0Q1WFdOTkJxSiswcDZPeTd5d2VaRGREUzlSWEN2bHhSZTdw?=
 =?utf-8?B?ckZFNXpsZndPazBscE1CMkdpb0xXdjBkeUlhTnZrcGhGK0dDTGRJWnFiOFRk?=
 =?utf-8?B?bEdpbE0wMTNDWFBUQXFFSWFvU29DcEc1bDhEWkU4ZVczWlV1cDlXUmxaME8y?=
 =?utf-8?B?REhJWWNCNTJWTWRtQ0VlRXpXSm04ZHdhMllQUkVxVWtQNUJXSHRzdi9QYlNS?=
 =?utf-8?B?TVZtdGtTNi9xYVhhaWtwdzJ2aWFwOWpNS0svZ3lRcFpNdFNwRkpYYnFrRFZr?=
 =?utf-8?B?Z2NYTkYvR05WUjhaREd0QmMyZmlDV0JMK2ZjQkRhZ0NDSC80d0NVazlOallX?=
 =?utf-8?B?b2ExTWNiUmFKa05yODl6V2NYLytUTFhRZ0FaUXREVnJ2MTYveUZ1ZW1UdElE?=
 =?utf-8?B?V1IrV1lKb1g0aEtOL25DbUMxcjV0R1I5R1pLVTRXRDFiVDRIY2s3Sy8zL1Bv?=
 =?utf-8?B?TVJ0cWZDbnl6cUF3bzh4L2RRQWtwMGYwT05Mbitac0tqTjFERWJIRTVuYWdH?=
 =?utf-8?B?TDdKMjk1aU9VNDIxV2J1dmIvM05lWDAzSkhVTjVpNDZWaUs0ejVvcEJ0bENR?=
 =?utf-8?B?YzFZb01xUVg5a2E3dDIxTlQvdWwvVWJZenhOT2xJNnVieURnekF0QVVIMDhM?=
 =?utf-8?B?aCtaNUlJQWJhZ1FlbDFZbkVEWDBqN1JRb1VVTy9ZV0l5RmVWa1BZejNrdGs3?=
 =?utf-8?B?K0FTRVZKbHN2bVFaUlgxcCtubGc5WXBCVkpVeVdINi9RYmVNclNwQ0ZMaEI5?=
 =?utf-8?B?SGkxb3hwUCtsdjBIN3ZpOFovL1lOTE9LYlkxWjdWKzlxakRZSmlqeFhwM0FV?=
 =?utf-8?B?QWRTcVdUWEdIUFA4Q1MxaVRyNXM0NENNdi9QR3dPSFJ6VWFSMmVHdEtiUjhX?=
 =?utf-8?B?OEFTRlNGdGd5QVk0VTNPR08zNS9zQzU4eVpIazVzcHBNQ1BiWm05eUI4ejg0?=
 =?utf-8?B?cll3QUxvclNjUXNBQnhJTFBnL1hXd1RtYlh2aldPRWp2dlA0OS9EREd3RGFU?=
 =?utf-8?B?NkRuanY2aHc5VG43Ujd6bklCTDhYMDBPVEF6bFlXZFV6dG41WTgxZHFBVDZS?=
 =?utf-8?Q?npeuKOBOgX8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnJUbXl2MkNBbHB1RTlmdDcwNFQ2SUtZcHpodGg4NFNiVERVRTRiUVVoUDdl?=
 =?utf-8?B?eVZwbjFyVXBkSndkR3FlM2lKeFNmL3pMM0dab05USkcxNzFTNlJWajFEaGpN?=
 =?utf-8?B?bGN1WkE0NTZhN1pYYUNEZlZIQnJIWXNmS3BNbGFzUHY5dEhCR3BiZGxaY0Uv?=
 =?utf-8?B?T2w0MzN5VUhqZ0RxWkpVQWJlRlIrT1NocVVJQnNrWDVMUGN0d2dXNlpRR3c1?=
 =?utf-8?B?bEZSM1BLWVZpU040R2tKMkprZDczSkEyY2wyR3NpVmhDTUZBR1k5b2lIa2RZ?=
 =?utf-8?B?RTNoaU5IR1RRaWlZdWxSYVhDZlpzWjIzNmV6TzZYL0xLTHVYVi96UTdQcDhU?=
 =?utf-8?B?cUpSSWdkY0hZb0tuZmtLVGdVY3VkU1M3WEhUV21aRVV1OEt1U2NWNkR5eHl6?=
 =?utf-8?B?bEhVK2N6RjRWZElhSm1jdFVTVy83VHFNU1dNQjBWS2RzT2NFMnE2UzRGN2pw?=
 =?utf-8?B?bCt6akcrZkNBQUJLU0hQWkM3TXBlRjR1V3pPMEM2MXRvZ1VHUDF2VTVwSm1F?=
 =?utf-8?B?Wnc1bTNjUTZZek9aUForUlVKaG1VYnVoZDUwK0lVV0hZalBvWGVYVE9FSHU5?=
 =?utf-8?B?VFF5eWErTlR1Z1Z4UnFpbVozd0RxRUdZL2U0OVpWN3cvZEVvZG1uUjBQLzlV?=
 =?utf-8?B?Tmc1bzIxUlpaSE1BMzh4NWg4WG9GckNxZndLejRaRUcwMlljL1I0b0ZwdUdC?=
 =?utf-8?B?MlExOFFOckVkSE1BUVQyK1MvelNxMjc0YUMrMTdQVCtMS1NEdEV0bVdvZ0RC?=
 =?utf-8?B?ZDlMMW01SUVhR3lDbkErNHNWY0VNTzlQVE9tVkQrYWtLRzJ3U1doTzkxVGdr?=
 =?utf-8?B?dk5nUzZFT28wQkxqNWR2dmx6eXI1MlhYRVc0SUtCWWJ1bXZYUUhZSGZKZ1pY?=
 =?utf-8?B?cUtDcC9uR0lmaWZ2d3h2UVZhREJyMnlJNGRSZk5QZXcvckxhYVlnaDlGdDdJ?=
 =?utf-8?B?RmhlSjhvTXhYVUFlM3lPRkZ1TURQVDB2bkhsaUlUbmxjUldiUDJCY2JONkNn?=
 =?utf-8?B?cVJJanUyKzdlZkRoUDlVWjQwYnFmYUpSSHdNRzgxa2RUeFBPM29PS1BVTDVh?=
 =?utf-8?B?NURZSUlwU1diTjdMODdZVExPUFljSGh1a3B0S2Nxc1I2alRrNmZ4bW40cTls?=
 =?utf-8?B?WmEybEE3SUdnZXFEWXV0S0RxQW55eGlqZjJYYVh3S3B1ZE5PLzZ4MjZIWDFq?=
 =?utf-8?B?L2hLdTQwUnk5WmxydzZmempaQkxWQm9Sek1xZmhuMTdiMWpiM1ZzNXBOWTYv?=
 =?utf-8?B?bU5JdkhGR0ZkbWRSM09lUE1JZmFpd1UzV3dZSURDZTBuc1NtY2NMZ0tZNmpz?=
 =?utf-8?B?UWM2TGJlY3pVbjI3Z20yQS82R0kxa21LWlMyaXIzSnJGdHBSb0VxVVZJa1BV?=
 =?utf-8?B?b0o2dk1obkNTK0RvQnFnZVFBanVpbEswbU1LZHpTMnFPaGxuQU9hbE5RUUth?=
 =?utf-8?B?WWR1bFoxVTNFYzRrOVBjQVlUMWFFM29DL3VTazg5MXpaTWNDWWlxVHd5UHg4?=
 =?utf-8?B?VUZNcVdVV0FFUWc5WnhPMTFtMWJHV282UVEyd1FLN1Y1UWVVOW9IaGswUnBi?=
 =?utf-8?B?SEN1UTN0TGJpMy9JY0puREViOGtNRGwzNXM4d2k0OExJcXhqVitCalpwRGpH?=
 =?utf-8?B?TWRqUitic1RoTVdLN055MU9sZjFkSDFoeGo3VDBIbGdVVUV4L1hyWWFnY2pQ?=
 =?utf-8?B?eE9FOHM3UVhQckx3TFUvS1d2WXJSbkxqc09UNjlEMHFHVEVQY2p4S2twcFRo?=
 =?utf-8?B?VThGNjdJMER2VEhwUnB2MWMxY1gvYzAvR2VraWNrQXY4MTFyeThycExnUWFP?=
 =?utf-8?B?TFN5NmNsRXZUU0U2Nkp4L2p6R2JJNWcrZ0tVWGU1NjRLVk5hRTZXTHR1cEJZ?=
 =?utf-8?B?WHNabWF5dlM4RHc4TUV6citDeE9ybkZxY2hGQmRvYk5pN2VSTytDbE1ycVpN?=
 =?utf-8?B?bzBWTldTWEQ0ZjZnYWQrS0Nvd0E0cDNROHRiTnBMcDQ2MURZT085T1ZwZnZQ?=
 =?utf-8?B?bWhNd1pVWDU5YkZLWG1YcHlqWE5VK0srd2ZNWUVMZG9xTnpPWjhXVTJLLzdt?=
 =?utf-8?B?V0hsWHZBN2t0aGlidkx6QmIvM3Bubyt5RnY5QWxjTXRtUWR6a3lWZmFvYmRa?=
 =?utf-8?B?NlZYVlUvQWsrMkM3VkNEeGZtNS9kV1FDamphdWIyM2xJR3UwSUFhWG5KbVcw?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 917f541f-a97e-4992-f5a8-08ddb485013e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:42:30.3095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C/ikRJYV/DI+5NVq3rGPSynXUMQOiHr9IRxh/49BMFL93gUjeL0z55+qsLEB+k15ikGyV0RWcuK7S9bLEYaq+5xR638mETmtcWnQJRCEnrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6903
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-cze-24 22:09:22 +0200]:
> While some VF/PF relay actions must be handled on the GT level,
> like query for runtime registers, it was clarified by the arch
> team that initial version negotiation can be done by the VF just
> once, by using any available GuC/GT.
> 
> Move handling of the VF/PF ABI version negotiation on the PF side
> from the GT level functions to the device level functions.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   3 +-
>  .../xe/tests/xe_gt_sriov_pf_service_test.c    | 232 ------------------
>  .../drm/xe/tests/xe_sriov_pf_service_kunit.c  | 227 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |   6 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |   5 -
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c   | 164 +------------
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h   |   2 -
>  drivers/gpu/drm/xe/xe_sriov_pf.c              |  18 +-
>  drivers/gpu/drm/xe/xe_sriov_pf_service.c      | 213 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_service.h      |  23 ++
>  .../gpu/drm/xe/xe_sriov_pf_service_types.h    |  36 +++
>  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  16 ++
>  12 files changed, 545 insertions(+), 400 deletions(-)
>  delete mode 100644 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index eee6bac01a00..9634605a4590 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -155,7 +155,8 @@ xe-$(CONFIG_PCI_IOV) += \
>  	xe_lmtt_2l.o \
>  	xe_lmtt_ml.o \
>  	xe_pci_sriov.o \
> -	xe_sriov_pf.o
> +	xe_sriov_pf.o \
> +	xe_sriov_pf_service.o
>  
>  # include helpers for tests even when XE is built-in
>  ifdef CONFIG_DRM_XE_KUNIT_TEST
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
> deleted file mode 100644
> index b683585db852..000000000000
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_service_test.c
> +++ /dev/null
> @@ -1,232 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 AND MIT
> -/*
> - * Copyright © 2024 Intel Corporation
> - */
> -
> -#include <kunit/test.h>
> -
> -#include "xe_device.h"
> -#include "xe_kunit_helpers.h"
> -#include "xe_pci_test.h"
> -
> -static int pf_service_test_init(struct kunit *test)
> -{
> -	struct xe_pci_fake_data fake = {
> -		.sriov_mode = XE_SRIOV_MODE_PF,
> -		.platform = XE_TIGERLAKE, /* some random platform */
> -		.subplatform = XE_SUBPLATFORM_NONE,
> -	};
> -	struct xe_device *xe;
> -	struct xe_gt *gt;
> -
> -	test->priv = &fake;
> -	xe_kunit_helper_xe_device_test_init(test);
> -
> -	xe = test->priv;
> -	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> -
> -	gt = xe_device_get_gt(xe, 0);
> -	pf_init_versions(gt);
> -
> -	/*
> -	 * sanity check:
> -	 * - all supported platforms VF/PF ABI versions must be defined
> -	 * - base version can't be newer than latest
> -	 */
> -	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.base.major);
> -	KUNIT_ASSERT_NE(test, 0, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.major,
> -			gt->sriov.pf.service.version.latest.major);
> -	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> -		KUNIT_ASSERT_LE(test, gt->sriov.pf.service.version.base.minor,
> -				gt->sriov.pf.service.version.latest.minor);
> -
> -	test->priv = gt;
> -	return 0;
> -}
> -
> -static void pf_negotiate_any(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt, VF2PF_HANDSHAKE_MAJOR_ANY,
> -					     VF2PF_HANDSHAKE_MINOR_ANY,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> -}
> -
> -static void pf_negotiate_base_match(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.base.major,
> -					     gt->sriov.pf.service.version.base.minor,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.base.minor);
> -}
> -
> -static void pf_negotiate_base_newer(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.base.major,
> -					     gt->sriov.pf.service.version.base.minor + 1,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.base.major);
> -	KUNIT_ASSERT_GE(test, minor, gt->sriov.pf.service.version.base.minor);
> -	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> -		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
> -	else
> -		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> -}
> -
> -static void pf_negotiate_base_next(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.base.major + 1, 0,
> -					     &major, &minor));
> -	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
> -	KUNIT_ASSERT_LE(test, major, gt->sriov.pf.service.version.latest.major);
> -	if (major == gt->sriov.pf.service.version.latest.major)
> -		KUNIT_ASSERT_LE(test, minor, gt->sriov.pf.service.version.latest.minor);
> -	else
> -		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> -}
> -
> -static void pf_negotiate_base_older(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	if (!gt->sriov.pf.service.version.base.minor)
> -		kunit_skip(test, "no older minor\n");
> -
> -	KUNIT_ASSERT_NE(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.base.major,
> -					     gt->sriov.pf.service.version.base.minor - 1,
> -					     &major, &minor));
> -}
> -
> -static void pf_negotiate_base_prev(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_NE(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.base.major - 1, 1,
> -					     &major, &minor));
> -}
> -
> -static void pf_negotiate_latest_match(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.latest.major,
> -					     gt->sriov.pf.service.version.latest.minor,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> -}
> -
> -static void pf_negotiate_latest_newer(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.latest.major,
> -					     gt->sriov.pf.service.version.latest.minor + 1,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> -}
> -
> -static void pf_negotiate_latest_next(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.latest.major + 1, 0,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor);
> -}
> -
> -static void pf_negotiate_latest_older(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	if (!gt->sriov.pf.service.version.latest.minor)
> -		kunit_skip(test, "no older minor\n");
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.latest.major,
> -					     gt->sriov.pf.service.version.latest.minor - 1,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major);
> -	KUNIT_ASSERT_EQ(test, minor, gt->sriov.pf.service.version.latest.minor - 1);
> -}
> -
> -static void pf_negotiate_latest_prev(struct kunit *test)
> -{
> -	struct xe_gt *gt = test->priv;
> -	u32 major, minor;
> -
> -	if (gt->sriov.pf.service.version.base.major == gt->sriov.pf.service.version.latest.major)
> -		kunit_skip(test, "no prev major");
> -
> -	KUNIT_ASSERT_EQ(test, 0,
> -			pf_negotiate_version(gt,
> -					     gt->sriov.pf.service.version.latest.major - 1,
> -					     gt->sriov.pf.service.version.base.minor + 1,
> -					     &major, &minor));
> -	KUNIT_ASSERT_EQ(test, major, gt->sriov.pf.service.version.latest.major - 1);
> -	KUNIT_ASSERT_GE(test, major, gt->sriov.pf.service.version.base.major);
> -}
> -
> -static struct kunit_case pf_service_test_cases[] = {
> -	KUNIT_CASE(pf_negotiate_any),
> -	KUNIT_CASE(pf_negotiate_base_match),
> -	KUNIT_CASE(pf_negotiate_base_newer),
> -	KUNIT_CASE(pf_negotiate_base_next),
> -	KUNIT_CASE(pf_negotiate_base_older),
> -	KUNIT_CASE(pf_negotiate_base_prev),
> -	KUNIT_CASE(pf_negotiate_latest_match),
> -	KUNIT_CASE(pf_negotiate_latest_newer),
> -	KUNIT_CASE(pf_negotiate_latest_next),
> -	KUNIT_CASE(pf_negotiate_latest_older),
> -	KUNIT_CASE(pf_negotiate_latest_prev),
> -	{}
> -};
> -
> -static struct kunit_suite pf_service_suite = {
> -	.name = "pf_service",
> -	.test_cases = pf_service_test_cases,
> -	.init = pf_service_test_init,
> -};
> -
> -kunit_test_suite(pf_service_suite);
> diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
> new file mode 100644
> index 000000000000..ba95e29b597d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_sriov_pf_service_kunit.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0 AND MIT
> +/*
> + * Copyright © 2024-2025 Intel Corporation
> + */
> +
> +#include <kunit/test.h>
> +
> +#include "xe_device.h"
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +
> +static int pf_service_test_init(struct kunit *test)
> +{
> +	struct xe_pci_fake_data fake = {
> +		.sriov_mode = XE_SRIOV_MODE_PF,
> +		.platform = XE_TIGERLAKE, /* some random platform */
> +		.subplatform = XE_SUBPLATFORM_NONE,
> +	};
> +	struct xe_device *xe;
> +
> +	test->priv = &fake;
> +	xe_kunit_helper_xe_device_test_init(test);
> +
> +	xe = test->priv;
> +	KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
> +
> +	xe_sriov_pf_service_init(xe);
> +	/*
> +	 * sanity check:
> +	 * - all supported platforms VF/PF ABI versions must be defined
> +	 * - base version can't be newer than latest
> +	 */
> +	KUNIT_ASSERT_NE(test, 0, xe->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_NE(test, 0, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_LE(test, xe->sriov.pf.service.version.base.major,
> +			xe->sriov.pf.service.version.latest.major);
> +	if (xe->sriov.pf.service.version.base.major == xe->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, xe->sriov.pf.service.version.base.minor,
> +				xe->sriov.pf.service.version.latest.minor);
> +	return 0;
> +}
> +
> +static void pf_negotiate_any(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe, VF2PF_HANDSHAKE_MAJOR_ANY,
> +					     VF2PF_HANDSHAKE_MINOR_ANY,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_base_match(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.base.major,
> +					     xe->sriov.pf.service.version.base.minor,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.base.minor);
> +}
> +
> +static void pf_negotiate_base_newer(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.base.major,
> +					     xe->sriov.pf.service.version.base.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_GE(test, minor, xe->sriov.pf.service.version.base.minor);
> +	if (xe->sriov.pf.service.version.base.major == xe->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, minor, xe->sriov.pf.service.version.latest.minor);
> +	else
> +		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> +}
> +
> +static void pf_negotiate_base_next(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.base.major + 1, 0,
> +					     &major, &minor));
> +	KUNIT_ASSERT_GE(test, major, xe->sriov.pf.service.version.base.major);
> +	KUNIT_ASSERT_LE(test, major, xe->sriov.pf.service.version.latest.major);
> +	if (major == xe->sriov.pf.service.version.latest.major)
> +		KUNIT_ASSERT_LE(test, minor, xe->sriov.pf.service.version.latest.minor);
> +	else
> +		KUNIT_FAIL(test, "FIXME: don't know how to test multi-version yet!\n");
> +}
> +
> +static void pf_negotiate_base_older(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	if (!xe->sriov.pf.service.version.base.minor)
> +		kunit_skip(test, "no older minor\n");
> +
> +	KUNIT_ASSERT_NE(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.base.major,
> +					     xe->sriov.pf.service.version.base.minor - 1,
> +					     &major, &minor));
> +}
> +
> +static void pf_negotiate_base_prev(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_NE(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.base.major - 1, 1,
> +					     &major, &minor));
> +}
> +
> +static void pf_negotiate_latest_match(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.latest.major,
> +					     xe->sriov.pf.service.version.latest.minor,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_newer(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.latest.major,
> +					     xe->sriov.pf.service.version.latest.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_next(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.latest.major + 1, 0,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.latest.minor);
> +}
> +
> +static void pf_negotiate_latest_older(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	if (!xe->sriov.pf.service.version.latest.minor)
> +		kunit_skip(test, "no older minor\n");
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.latest.major,
> +					     xe->sriov.pf.service.version.latest.minor - 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major);
> +	KUNIT_ASSERT_EQ(test, minor, xe->sriov.pf.service.version.latest.minor - 1);
> +}
> +
> +static void pf_negotiate_latest_prev(struct kunit *test)
> +{
> +	struct xe_device *xe = test->priv;
> +	u32 major, minor;
> +
> +	if (xe->sriov.pf.service.version.base.major == xe->sriov.pf.service.version.latest.major)
> +		kunit_skip(test, "no prev major");
> +
> +	KUNIT_ASSERT_EQ(test, 0,
> +			pf_negotiate_version(xe,
> +					     xe->sriov.pf.service.version.latest.major - 1,
> +					     xe->sriov.pf.service.version.base.minor + 1,
> +					     &major, &minor));
> +	KUNIT_ASSERT_EQ(test, major, xe->sriov.pf.service.version.latest.major - 1);
> +	KUNIT_ASSERT_GE(test, major, xe->sriov.pf.service.version.base.major);
> +}
> +
> +static struct kunit_case pf_service_test_cases[] = {
> +	KUNIT_CASE(pf_negotiate_any),
> +	KUNIT_CASE(pf_negotiate_base_match),
> +	KUNIT_CASE(pf_negotiate_base_newer),
> +	KUNIT_CASE(pf_negotiate_base_next),
> +	KUNIT_CASE(pf_negotiate_base_older),
> +	KUNIT_CASE(pf_negotiate_base_prev),
> +	KUNIT_CASE(pf_negotiate_latest_match),
> +	KUNIT_CASE(pf_negotiate_latest_newer),
> +	KUNIT_CASE(pf_negotiate_latest_next),
> +	KUNIT_CASE(pf_negotiate_latest_older),
> +	KUNIT_CASE(pf_negotiate_latest_prev),
> +	{}
> +};
> +
> +static struct kunit_suite pf_service_suite = {
> +	.name = "pf_service",
> +	.test_cases = pf_service_test_cases,
> +	.init = pf_service_test_init,
> +};
> +
> +kunit_test_suite(pf_service_suite);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index 1f50aec3a059..bceebffe8492 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -15,10 +15,10 @@
>  #include "xe_gt_sriov_pf_helpers.h"
>  #include "xe_gt_sriov_pf_migration.h"
>  #include "xe_gt_sriov_pf_monitor.h"
> -#include "xe_gt_sriov_pf_service.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_guc_ct.h"
>  #include "xe_sriov.h"
> +#include "xe_sriov_pf_service.h"
>  
>  static const char *control_cmd_to_string(u32 cmd)
>  {
> @@ -1064,7 +1064,9 @@ static bool pf_exit_vf_flr_reset_data(struct xe_gt *gt, unsigned int vfid)
>  	if (!pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_FLR_RESET_DATA))
>  		return false;
>  
> -	xe_gt_sriov_pf_service_reset(gt, vfid);
> +	if (!xe_gt_is_media_type(gt) && !gt->tile->id)
NIT: Maybe we should have a helper like is_root_prime_gt or simillar,
To be honest, in my code, which has not yet been made public, I already had
cases where something like this would have been useful.

> +		xe_sriov_pf_service_reset_vf(gt_to_xe(gt), vfid);
> +
>  	xe_gt_sriov_pf_monitor_flr(gt, vfid);
>  
>  	pf_enter_vf_flr_reset_mmio(gt, vfid);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 13970d5a2867..af6a713ab5b2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -77,11 +77,6 @@ static const struct drm_info_list pf_info[] = {
>  		.show = xe_gt_debugfs_simple_show,
>  		.data = xe_gt_sriov_pf_service_print_runtime,
>  	},
> -	{
> -		"negotiated_versions",
> -		.show = xe_gt_debugfs_simple_show,
> -		.data = xe_gt_sriov_pf_service_print_version,
> -	},
>  	{
>  		"adverse_events",
>  		.show = xe_gt_debugfs_simple_show,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> index 821cfcc34e6b..98b9e796ac89 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.c
> @@ -19,91 +19,7 @@
>  #include "xe_gt_sriov_pf_service_types.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_hxg_helpers.h"
> -
> -static void pf_init_versions(struct xe_gt *gt)
> -{
> -	BUILD_BUG_ON(!GUC_RELAY_VERSION_BASE_MAJOR && !GUC_RELAY_VERSION_BASE_MINOR);
> -	BUILD_BUG_ON(GUC_RELAY_VERSION_BASE_MAJOR > GUC_RELAY_VERSION_LATEST_MAJOR);
> -
> -	/* base versions may differ between platforms */
> -	gt->sriov.pf.service.version.base.major = GUC_RELAY_VERSION_BASE_MAJOR;
> -	gt->sriov.pf.service.version.base.minor = GUC_RELAY_VERSION_BASE_MINOR;
> -
> -	/* latest version is same for all platforms */
> -	gt->sriov.pf.service.version.latest.major = GUC_RELAY_VERSION_LATEST_MAJOR;
> -	gt->sriov.pf.service.version.latest.minor = GUC_RELAY_VERSION_LATEST_MINOR;
> -}
> -
> -/* Return: 0 on success or a negative error code on failure. */
> -static int pf_negotiate_version(struct xe_gt *gt,
> -				u32 wanted_major, u32 wanted_minor,
> -				u32 *major, u32 *minor)
> -{
> -	struct xe_gt_sriov_pf_service_version base = gt->sriov.pf.service.version.base;
> -	struct xe_gt_sriov_pf_service_version latest = gt->sriov.pf.service.version.latest;
> -
> -	xe_gt_assert(gt, base.major);
> -	xe_gt_assert(gt, base.major <= latest.major);
> -	xe_gt_assert(gt, (base.major < latest.major) || (base.minor <= latest.minor));
> -
> -	/* VF doesn't care - return our latest  */
> -	if (wanted_major == VF2PF_HANDSHAKE_MAJOR_ANY &&
> -	    wanted_minor == VF2PF_HANDSHAKE_MINOR_ANY) {
> -		*major = latest.major;
> -		*minor = latest.minor;
> -		return 0;
> -	}
> -
> -	/* VF wants newer than our - return our latest  */
> -	if (wanted_major > latest.major) {
> -		*major = latest.major;
> -		*minor = latest.minor;
> -		return 0;
> -	}
> -
> -	/* VF wants older than min required - reject */
> -	if (wanted_major < base.major ||
> -	    (wanted_major == base.major && wanted_minor < base.minor)) {
> -		return -EPERM;
> -	}
> -
> -	/* previous major - return wanted, as we should still support it */
> -	if (wanted_major < latest.major) {
> -		/* XXX: we are not prepared for multi-versions yet */
> -		xe_gt_assert(gt, base.major == latest.major);
> -		return -ENOPKG;
> -	}
> -
> -	/* same major - return common minor */
> -	*major = wanted_major;
> -	*minor = min_t(u32, latest.minor, wanted_minor);
> -	return 0;
> -}
> -
> -static void pf_connect(struct xe_gt *gt, u32 vfid, u32 major, u32 minor)
> -{
> -	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> -	xe_gt_assert(gt, major || minor);
> -
> -	gt->sriov.pf.vfs[vfid].version.major = major;
> -	gt->sriov.pf.vfs[vfid].version.minor = minor;
> -}
> -
> -static void pf_disconnect(struct xe_gt *gt, u32 vfid)
> -{
> -	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> -
> -	gt->sriov.pf.vfs[vfid].version.major = 0;
> -	gt->sriov.pf.vfs[vfid].version.minor = 0;
> -}
> -
> -static bool pf_is_negotiated(struct xe_gt *gt, u32 vfid, u32 major, u32 minor)
> -{
> -	xe_gt_sriov_pf_assert_vfid(gt, vfid);
> -
> -	return major == gt->sriov.pf.vfs[vfid].version.major &&
> -	       minor <= gt->sriov.pf.vfs[vfid].version.minor;
> -}
> +#include "xe_sriov_pf_service.h"
>  
>  static const struct xe_reg tgl_runtime_regs[] = {
>  	RPM_CONFIG0,			/* _MMIO(0x0d00) */
> @@ -285,8 +201,6 @@ int xe_gt_sriov_pf_service_init(struct xe_gt *gt)
>  {
>  	int err;
>  
> -	pf_init_versions(gt);
> -
>  	err = pf_alloc_runtime_info(gt);
>  	if (unlikely(err))
>  		goto failed;
> @@ -311,47 +225,6 @@ void xe_gt_sriov_pf_service_update(struct xe_gt *gt)
>  	pf_prepare_runtime_info(gt);
>  }
>  
> -/**
> - * xe_gt_sriov_pf_service_reset - Reset a connection with the VF.
> - * @gt: the &xe_gt
> - * @vfid: the VF identifier
> - *
> - * Reset a VF driver negotiated VF/PF ABI version.
> - * After that point, the VF driver will have to perform new version handshake
> - * to continue use of the PF services again.
> - *
> - * This function can only be called on PF.
> - */
> -void xe_gt_sriov_pf_service_reset(struct xe_gt *gt, unsigned int vfid)
> -{
> -	pf_disconnect(gt, vfid);
> -}
> -
> -/* Return: 0 on success or a negative error code on failure. */
> -static int pf_process_handshake(struct xe_gt *gt, u32 vfid,
> -				u32 wanted_major, u32 wanted_minor,
> -				u32 *major, u32 *minor)
> -{
> -	int err;
> -
> -	xe_gt_sriov_dbg_verbose(gt, "VF%u wants ABI version %u.%u\n",
> -				vfid, wanted_major, wanted_minor);
> -
> -	err = pf_negotiate_version(gt, wanted_major, wanted_minor, major, minor);
> -
> -	if (err < 0) {
> -		xe_gt_sriov_notice(gt, "VF%u failed to negotiate ABI %u.%u (%pe)\n",
> -				   vfid, wanted_major, wanted_minor, ERR_PTR(err));
> -		pf_disconnect(gt, vfid);
> -	} else {
> -		xe_gt_sriov_dbg(gt, "VF%u negotiated ABI version %u.%u\n",
> -				vfid, *major, *minor);
> -		pf_connect(gt, vfid, *major, *minor);
> -	}
> -
> -	return 0;
> -}
> -
>  /* Return: length of the response message or a negative error code on failure. */
>  static int pf_process_handshake_msg(struct xe_gt *gt, u32 origin,
>  				    const u32 *request, u32 len, u32 *response, u32 size)
> @@ -371,7 +244,8 @@ static int pf_process_handshake_msg(struct xe_gt *gt, u32 origin,
>  	wanted_major = FIELD_GET(VF2PF_HANDSHAKE_REQUEST_MSG_1_MAJOR, request[1]);
>  	wanted_minor = FIELD_GET(VF2PF_HANDSHAKE_REQUEST_MSG_1_MINOR, request[1]);
>  
> -	err = pf_process_handshake(gt, origin, wanted_major, wanted_minor, &major, &minor);
> +	err = xe_sriov_pf_service_handshake_vf(gt_to_xe(gt), origin, wanted_major, wanted_minor,
> +					       &major, &minor);
>  	if (err < 0)
>  		return err;
>  
> @@ -430,8 +304,10 @@ static int pf_process_runtime_query_msg(struct xe_gt *gt, u32 origin,
>  	u32 remaining = 0;
>  	int ret;
>  
> -	if (!pf_is_negotiated(gt, origin, 1, 0))
> +	/* this action is available from ABI 1.0 */
> +	if (!xe_sriov_pf_service_is_negotiated(gt_to_xe(gt), origin, 1, 0))
>  		return -EACCES;
> +
>  	if (unlikely(msg_len > VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN))
>  		return -EMSGSIZE;
>  	if (unlikely(msg_len < VF2PF_QUERY_RUNTIME_REQUEST_MSG_LEN))
> @@ -529,32 +405,6 @@ int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p
>  	return 0;
>  }
>  
> -/**
> - * xe_gt_sriov_pf_service_print_version - Print ABI versions negotiated with VFs.
> - * @gt: the &xe_gt
> - * @p: the &drm_printer
> - *
> - * This function is for PF use only.
> - */
> -int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p)
> -{
> -	struct xe_device *xe = gt_to_xe(gt);
> -	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> -	struct xe_gt_sriov_pf_service_version *version;
> -
> -	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> -
> -	for (n = 1; n <= total_vfs; n++) {
> -		version = &gt->sriov.pf.vfs[n].version;
> -		if (!version->major && !version->minor)
> -			continue;
> -
> -		drm_printf(p, "VF%u:\t%u.%u\n", n, version->major, version->minor);
> -	}
> -
> -	return 0;
> -}
> -
>  #if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> -#include "tests/xe_gt_sriov_pf_service_test.c"
> +//#include "tests/xe_gt_sriov_pf_service_test.c"
>

This should probably be removed.

#endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
> index 56aaadf0360d..10b02c9b651c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_service.h
> @@ -14,9 +14,7 @@ struct xe_gt;
>  
>  int xe_gt_sriov_pf_service_init(struct xe_gt *gt);
>  void xe_gt_sriov_pf_service_update(struct xe_gt *gt);
> -void xe_gt_sriov_pf_service_reset(struct xe_gt *gt, unsigned int vfid);
>  
> -int xe_gt_sriov_pf_service_print_version(struct xe_gt *gt, struct drm_printer *p);
>  int xe_gt_sriov_pf_service_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>  
>  #ifdef CONFIG_PCI_IOV
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> index 32788b83b8bd..f66b839deeb8 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -12,6 +12,8 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_service.h"
>  #include "xe_sriov_printk.h"
>  
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> @@ -82,9 +84,22 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	int err;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
>  
> -	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	xe->sriov.pf.vfs = drmm_kcalloc(&xe->drm, 1 + xe_sriov_pf_get_totalvfs(xe),
> +					sizeof(*xe->sriov.pf.vfs), GFP_KERNEL);
> +	if (!xe->sriov.pf.vfs)
> +		return -ENOMEM;
> +
> +	err = drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	if (err)
> +		return err;
> +
> +	xe_sriov_pf_service_init(xe);
> +
> +	return 0;
>  }
>  
>  /**
> @@ -122,6 +137,7 @@ static int simple_show(struct seq_file *m, void *data)
>  
>  static const struct drm_info_list debugfs_list[] = {
>  	{ .name = "vfs", .show = simple_show, .data = xe_sriov_pf_print_vfs_summary },
> +	{ .name = "versions", .show = simple_show, .data = xe_sriov_pf_service_print_versions },
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_service.c b/drivers/gpu/drm/xe/xe_sriov_pf_service.c
> new file mode 100644
> index 000000000000..a8e90e5ac5f8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_service.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023-2025 Intel Corporation
> + */
> +
> +#include "abi/guc_relay_actions_abi.h"
> +
> +#include "xe_device_types.h"
> +#include "xe_sriov.h"
> +#include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_printk.h"
> +
> +#include "xe_sriov_pf_service.h"
> +#include "xe_sriov_pf_service_types.h"
> +
> +/**
> + * xe_sriov_pf_service_init - Early initialization of the SR-IOV PF service.
> + * @xe: the &xe_device to initialize
> + *
> + * Performs early initialization of the SR-IOV PF service.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_sriov_pf_service_init(struct xe_device *xe)
> +{
> +	BUILD_BUG_ON(!GUC_RELAY_VERSION_BASE_MAJOR && !GUC_RELAY_VERSION_BASE_MINOR);
> +	BUILD_BUG_ON(GUC_RELAY_VERSION_BASE_MAJOR > GUC_RELAY_VERSION_LATEST_MAJOR);
> +

NIT:
IMO, xe_assert IS_SRIOV_PF should be here, especially since you are now using union for PF/VF.

> +	/* base versions may differ between platforms */
> +	xe->sriov.pf.service.version.base.major = GUC_RELAY_VERSION_BASE_MAJOR;
> +	xe->sriov.pf.service.version.base.minor = GUC_RELAY_VERSION_BASE_MINOR;
> +
> +	/* latest version is same for all platforms */
> +	xe->sriov.pf.service.version.latest.major = GUC_RELAY_VERSION_LATEST_MAJOR;
> +	xe->sriov.pf.service.version.latest.minor = GUC_RELAY_VERSION_LATEST_MINOR;
> +}
> +
> +/* Return: 0 on success or a negative error code on failure. */
> +static int pf_negotiate_version(struct xe_device *xe,
> +				u32 wanted_major, u32 wanted_minor,
> +				u32 *major, u32 *minor)
> +{
> +	struct xe_sriov_pf_service_version base = xe->sriov.pf.service.version.base;
> +	struct xe_sriov_pf_service_version latest = xe->sriov.pf.service.version.latest;
> +
> +	xe_assert(xe, base.major);
> +	xe_assert(xe, base.major <= latest.major);
> +	xe_assert(xe, (base.major < latest.major) || (base.minor <= latest.minor));
> +
> +	/* VF doesn't care - return our latest  */
> +	if (wanted_major == VF2PF_HANDSHAKE_MAJOR_ANY &&
> +	    wanted_minor == VF2PF_HANDSHAKE_MINOR_ANY) {
> +		*major = latest.major;
> +		*minor = latest.minor;
> +		return 0;
> +	}
> +
> +	/* VF wants newer than our - return our latest  */
> +	if (wanted_major > latest.major) {
> +		*major = latest.major;
> +		*minor = latest.minor;
> +		return 0;
> +	}
> +
> +	/* VF wants older than min required - reject */
> +	if (wanted_major < base.major ||
> +	    (wanted_major == base.major && wanted_minor < base.minor)) {
> +		return -EPERM;
> +	}
> +
> +	/* previous major - return wanted, as we should still support it */
> +	if (wanted_major < latest.major) {
> +		/* XXX: we are not prepared for multi-versions yet */
> +		xe_assert(xe, base.major == latest.major);
> +		return -ENOPKG;
> +	}
> +
> +	/* same major - return common minor */
> +	*major = wanted_major;
> +	*minor = min_t(u32, latest.minor, wanted_minor);
> +	return 0;
> +}
> +
> +static void pf_connect(struct xe_device *xe, u32 vfid, u32 major, u32 minor)
> +{
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +	xe_assert(xe, major || minor);
> +
> +	xe->sriov.pf.vfs[vfid].version.major = major;
> +	xe->sriov.pf.vfs[vfid].version.minor = minor;
> +}
> +
> +static void pf_disconnect(struct xe_device *xe, u32 vfid)
> +{
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	xe->sriov.pf.vfs[vfid].version.major = 0;
> +	xe->sriov.pf.vfs[vfid].version.minor = 0;
> +}
> +
> +/**
> + * xe_sriov_pf_service_is_negotiated - Check if VF has negotiated given ABI version.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @major: the major version to check
> + * @minor: the minor version to check
> + *
> + * Performs early initialization of the SR-IOV PF service.
> + *
> + * This function can only be called on PF.
> + *
> + * Returns: true if VF can use given ABI version functionality.
> + */
> +bool xe_sriov_pf_service_is_negotiated(struct xe_device *xe, u32 vfid, u32 major, u32 minor)
> +{
> +	xe_sriov_pf_assert_vfid(xe, vfid);
> +
> +	return major == xe->sriov.pf.vfs[vfid].version.major &&
> +	       minor <= xe->sriov.pf.vfs[vfid].version.minor;
> +}
> +
> +/**
> + * xe_sriov_pf_service_handshake_vf - Confirm a connection with the VF.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + * @wanted_major: the major service version expected by the VF
> + * @wanted_minor: the minor service version expected by the VF
> + * @major: the major service version to be used by the VF
> + * @minor: the minor service version to be used by the VF
> + *
> + * Negotiate a VF/PF ABI version to allow VF use the PF services.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_service_handshake_vf(struct xe_device *xe, u32 vfid,
> +				     u32 wanted_major, u32 wanted_minor,
> +				     u32 *major, u32 *minor)
> +{
> +	int err;
> +
> +	xe_sriov_dbg_verbose(xe, "VF%u wants ABI version %u.%u\n",
> +			     vfid, wanted_major, wanted_minor);
> +
> +	err = pf_negotiate_version(xe, wanted_major, wanted_minor, major, minor);
> +
> +	if (err < 0) {
> +		xe_sriov_notice(xe, "VF%u failed to negotiate ABI %u.%u (%pe)\n",
> +				vfid, wanted_major, wanted_minor, ERR_PTR(err));
> +		pf_disconnect(xe, vfid);
> +	} else {
> +		xe_sriov_dbg(xe, "VF%u negotiated ABI version %u.%u\n",
> +			     vfid, *major, *minor);
> +		pf_connect(xe, vfid, *major, *minor);
> +	}
> +
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_pf_service_reset_vf - Reset a connection with the VF.
> + * @xe: the &xe_device
> + * @vfid: the VF identifier
> + *
> + * Reset a VF driver negotiated VF/PF ABI version.
> + *
> + * After that point, the VF driver will have to perform new version handshake
> + * to continue use of the PF services again.
> + *
> + * This function can only be called on PF.
> + */
> +void xe_sriov_pf_service_reset_vf(struct xe_device *xe, unsigned int vfid)
> +{
> +	pf_disconnect(xe, vfid);
> +}
> +
> +static void print_pf_version(struct drm_printer *p, const char *name,
> +			     const struct xe_sriov_pf_service_version *version)
> +{
> +	drm_printf(p, "%s:\t%u.%u\n", name, version->major, version->minor);
> +}
> +
> +/**
> + * xe_sriov_pf_service_print_versions - Print ABI versions negotiated with VFs.
> + * @xe: the &xe_device
> + * @p: the &drm_printer
> + *
> + * This function is for PF use only.
> + */
> +void xe_sriov_pf_service_print_versions(struct xe_device *xe, struct drm_printer *p)
> +{
> +	unsigned int n, total_vfs = xe_sriov_pf_get_totalvfs(xe);
> +	struct xe_sriov_pf_service_version *version;
> +	char name[8];
> +
> +	xe_assert(xe, IS_SRIOV_PF(xe));
> +
> +	print_pf_version(p, "base", &xe->sriov.pf.service.version.base);
> +	print_pf_version(p, "latest", &xe->sriov.pf.service.version.latest);
> +
> +	for (n = 1; n <= total_vfs; n++) {
> +		version = &xe->sriov.pf.vfs[n].version;
> +		if (!version->major && !version->minor)
> +			continue;
> +
> +		print_pf_version(p, xe_sriov_function_name(n, name, sizeof(name)), version);
> +	}
> +}
> +
> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
> +#include "tests/xe_sriov_pf_service_kunit.c"
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_service.h b/drivers/gpu/drm/xe/xe_sriov_pf_service.h
> new file mode 100644
> index 000000000000..d38c18f5ed10
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_service.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_SERVICE_H_
> +#define _XE_SRIOV_PF_SERVICE_H_
> +
> +#include <linux/types.h>
> +
> +struct drm_printer;
> +struct xe_device;
> +
> +void xe_sriov_pf_service_init(struct xe_device *xe);
> +void xe_sriov_pf_service_print_versions(struct xe_device *xe, struct drm_printer *p);
> +
> +int xe_sriov_pf_service_handshake_vf(struct xe_device *xe, u32 vfid,
> +				     u32 wanted_major, u32 wanted_minor,
> +				     u32 *major, u32 *minor);
> +bool xe_sriov_pf_service_is_negotiated(struct xe_device *xe, u32 vfid, u32 major, u32 minor);
> +void xe_sriov_pf_service_reset_vf(struct xe_device *xe, unsigned int vfid);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_service_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
> new file mode 100644
> index 000000000000..0835dde358c1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_service_types.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023-2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_PF_SERVICE_TYPES_H_
> +#define _XE_SRIOV_PF_SERVICE_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * struct xe_sriov_pf_service_version - VF/PF ABI Version.
> + * @major: the major version of the VF/PF ABI
> + * @minor: the minor version of the VF/PF ABI
> + *
> + * See `GuC Relay Communication`_.
> + */
> +struct xe_sriov_pf_service_version {
> +	u16 major;
> +	u16 minor;
> +};
> +
> +/**
> + * struct xe_sriov_pf_service - Data used by the PF service.
> + * @version: information about VF/PF ABI versions for current platform.
> + * @version.base: lowest VF/PF ABI version that could be negotiated with VF.
> + * @version.latest: latest VF/PF ABI version supported by the PF driver.
> + */
> +struct xe_sriov_pf_service {
> +	struct {
> +		struct xe_sriov_pf_service_version base;
> +		struct xe_sriov_pf_service_version latest;
> +	} version;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> index 918dc089eb1d..956a88f9f213 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> @@ -9,6 +9,16 @@
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> +#include "xe_sriov_pf_service_types.h"
> +
> +/**
> + * struct xe_sriov_metadata - per-VF device level metadata
> + */
> +struct xe_sriov_metadata {
> +	/** @version: negotiated VF/PF ABI version */
> +	struct xe_sriov_pf_service_version version;
> +};
> +
>  /**
>   * struct xe_device_pf - Xe PF related data
>   *
> @@ -24,6 +34,12 @@ struct xe_device_pf {
>  
>  	/** @master_lock: protects all VFs configurations across GTs */
>  	struct mutex master_lock;
> +
> +	/** @service: device level service data. */
> +	struct xe_sriov_pf_service service;
> +
> +	/** @vfs: metadata for all VFs. */
> +	struct xe_sriov_metadata *vfs;
>  };
>  

The code looks fine and seems to work properly.
Above, I have left two suggestions for you to consider, and there is also one pice of
the old code that needs to be removed.
After removing the unnecessary code:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


>  #endif
> -- 
> 2.47.1
> 

-- 
