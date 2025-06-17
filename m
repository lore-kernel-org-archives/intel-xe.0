Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CE5C71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 23:09:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B801D10E08B;
	Tue, 17 Jun 2025 23:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUD+Gg0Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E16B610E08B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 23:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750201798; x=1781737798;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tgFTHk/dkwMAjbwfqlLVzNJQgO0E1PeLSb9oAeiXCcE=;
 b=aUD+Gg0Zcf6N+KCLVXx1vsSDz+6cl5ZFrSLgosdKg+4TZowYzdj1j9uo
 dfA7BiIIK6Y/BqqzXiV7pPObd9Ypua20XqcJ7GxgldSUNIp6//LxnFjoi
 TGDuGyfbd5AZd6aH3uG+WwZg8PjWKmD0xHFxmcoVSs+4zwyro3lQG7Y2E
 Y3dNo3P/QyU8ZoMl+Kf6nJH78bjLU5HeE2VQS9b42uvmSvPBZsK32vdkl
 /FNws3DXSqgYnOZsqzYbuT1/BtFv596r1dh2NeuIda5JrIdIGrtQvhnLO
 Po1LUcgpXPMinBlfvx3jk767CTuF06GufybEs9fMgH8tjB1aLIbQBbVbb g==;
X-CSE-ConnectionGUID: a6dsSEyGQt+E7k0V2xlaUw==
X-CSE-MsgGUID: K5s3JnY5ScuI2Jw3UKZ5FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="62676507"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="62676507"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:09:56 -0700
X-CSE-ConnectionGUID: ooClAwWmSS+CWly8kHWTxQ==
X-CSE-MsgGUID: sIlaDJqjSqyZJGxA1/u2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148855507"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 16:09:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:09:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 16:09:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 16:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KrmfoIXpzq11q05u/sEsDwAm6DV0DWidcVPb4emLz90KZF08rYYRVBy1+41Dbmug1CLo2SWjA29NH2CTJ7l/6011U+d1SkPoCJKuEjCqxgirOYObzV28dnik8n7m7vw6odnsAYBNb923JFwaVX7tjbwF9OL9vmHukVNGGScB9dIjMSaFIzsxtE9BMFLuuhnji/GJxWGluST1xlvDWTxnxWo+Lj3JsDlzs9REDtk4vU8Jvpzh16cb6GYUE2L4iEZqXtrWSIUZYllzB/yf1zm81GPjl10kXuaWr3Q77bbEl33HmnNZQR5oV3Ko/wgx1pedvTgE8gS88hbkCnOIWZ4Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1SPu7TgToG/2uOtMQg23IB0ES5TWe/S7ZZf8cCUp14=;
 b=UsSehMtKmwWCC5ZB4Ghwt2tQiit2Shr9ndYi7uF9KdnmDIH7f1czLBDqGLYFbHZPqB1MEJJd++vqg1NR8j0KBPK/Plzg30qGpVsbr+klwaoE/JGP5Q0ZkN4eDj5xMX3go4QrkbVpa0GkLXqRTr7Zb6c4tHb7uMGfHzVsrQ+IVui9g4beKvuj+S2xvxL5zB55ptfDGSX11oLOd88HBdNKt9eJj2tnn0EjAeyuQQFky0AF5V1iBR8MUStshbWceBbXleecjznSi9bGAbEH5TIPxUDhOFZsez1ITKvvyHv1b93N8+DDw6QWS0ITFkONn/Oqf1J+MCSbfmYQXdUYa7nImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BY1PR11MB8079.namprd11.prod.outlook.com (2603:10b6:a03:52e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 23:09:38 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Tue, 17 Jun 2025
 23:09:38 +0000
Date: Tue, 17 Jun 2025 16:11:15 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
Subject: Re: [PATCH v7 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aFH2ExQpaqn6SiQm@lstrano-desk.jf.intel.com>
References: <20250616150805.26780-1-satyanarayana.k.v.p@intel.com>
 <20250616150805.26780-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250616150805.26780-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW4P222CA0020.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BY1PR11MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b19b4cb-f602-436c-9c94-08ddadf4084f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFNLTnk2cTlIanU3SUJhVHMzMVZlaEo2Q3krRGZubXo2WFBaQ3c0RnhZcVRv?=
 =?utf-8?B?Rk5IQ3ZJYlhmNmtMQnkwYWJmL2JaNnB1aU42YXZrc3FXbFVBd1J1bjN5WHdr?=
 =?utf-8?B?RGQrTnFCbHExU3YrZXJvditxN2Znb1VqaEpVRWRzRFBJb1N5NjZKRGFnS1hn?=
 =?utf-8?B?cUxrd0U0Y3pvcXdpRlhDUFVONmpOR2NJbW5UTWpRTWZEUUcrbGE5ZDh1NXlq?=
 =?utf-8?B?ZlFDNGVzSGtYR1RkMHFmUnF0cjdqM2UxaitwMkhKWGlxVWRkSWZZRVBrYlFR?=
 =?utf-8?B?NjZVMlJGSUVUZzY2ZzVmY3JaeGE0d1dBL2d5cE9QcDBHVUJJNDdaU1BjaTZa?=
 =?utf-8?B?cHdJMHZhWThZMGtKNkszN1EvZEgwVnFzZkwreURCZTJnWHBBWVFRNlBUdGtu?=
 =?utf-8?B?SEhPeVJiekxPSDMzbnlESytXcFQ5NGhSdUFBWUI2bmk2Uk9TREphcG55N3kv?=
 =?utf-8?B?VzdVamdhc1JMbFR1eW1RSjBTK3Z5MU5pOEFkUXZVOHlvS1VzOUZqTExoZDVR?=
 =?utf-8?B?bXNPTmlmSmZrQU5maEI0RjRKUVl6emVqcFBCN2pGZkNhc0lhWWlCbDFjREpH?=
 =?utf-8?B?UTY4R0VkREtjZ0tzMTFWQTRqWDNSMmlrb0xZcXk0MVNWNUZzZG4valg1SUxh?=
 =?utf-8?B?MjEwODM1a2trbXNNWXd3cms5ZkFtSUc5dmIzVGtkUE9PZituakJvVlcvdmlQ?=
 =?utf-8?B?VDV2M0tDcVlEajlYVkNYN0ZVaDBtdTRhY3QydHhLNjgxaUZlcWRhdVNXajlC?=
 =?utf-8?B?eDF3djdmMkkxaFNFS3hVSDlyeXk0NGxaV2Rsc3Y3RWUrbGNCbUJ3eGFlMG1x?=
 =?utf-8?B?YlczQ1o2ZkV6Ti9rUjBXSEVla0VsQkVOWFFkUU14VUlUN3N2WWVLUzRPK0NT?=
 =?utf-8?B?bUpMUUtZa2dZL1RlOWhvdG9XSDhqc0JBM1ZFczduWnFXMm1haElES09QN0tP?=
 =?utf-8?B?ZHRVd0plTS9wWFB2L0tCMFUxWkRrQ2lGbytJV1hYbFVRTEJKZE9QMXdUdUdn?=
 =?utf-8?B?S3FkQ0xHNzc0aE01QVpRQmtzU0FidjMyV1VHd0NzeW9VenNDcmIrN3NWaDdY?=
 =?utf-8?B?bHFoSEJ5TUhwUjBzNDdpNEtyZmNNQWlvMEZqVlRjZkd5ZjJZWW1lZXBNbVQw?=
 =?utf-8?B?ZVhscStRMEdVOXVZa0I1Z29ROTh0YnM4WjU5dERuNHd3UWFGd1RCS2c5OWhy?=
 =?utf-8?B?dG91ZDlMNFN2R3ZyanRuUEowMGI4NnczdU8zRnlHRXBHT25zTDJyVEJDWlNW?=
 =?utf-8?B?M2hFbHBablJ6WjUvaG85TEM0T2pnYUR4eHBKMUMvZ0VxbE1NQ2ZVbS8wZ1Bt?=
 =?utf-8?B?Q3ltVytSUWExaTFrcFlWc2tIbldHVGZMdXdScUREaHFxTzhJUHlTTm1wQXNn?=
 =?utf-8?B?aG0zajAwSWU3eGhKOVFzL0kzbjNUbFRLbGl0LzlrL3JlVlRaSXNQWmlNWE5B?=
 =?utf-8?B?Q1dwaXFIaGEyNGIzazVLSlVER2g2RjlzZmJZUnVwbTdqbk4waGtlbzZwM1RC?=
 =?utf-8?B?UnVIT3N5K0dkRjkxZUhScnZDallSemlvWFgxNmFhS1Q0aWRUSGo5NzBSNmoz?=
 =?utf-8?B?WTJnL2hDbnBjZVZLRmRjNHpDc00zQWRzdUdRZDN3Y29VMGxDSk8rZ2lsZEgy?=
 =?utf-8?B?S2x2aDhDamQrMmZid2QvUXc4NjF6NXZISHovNVFjS2lBQkJWOVhRN0JJaHRJ?=
 =?utf-8?B?YnB4eHhyOXZvLzlrcXFrM1pVY1dOb3pQSjIxYWhnaGI2bHlrRitqVTN5eEJY?=
 =?utf-8?B?cEt6aTM2ZVZaRGpOZkYxVTRLSmFVbU84N0xwL3hnaTF5bmk3WExDVGJvaGJn?=
 =?utf-8?B?V3E1SkhjV1hodlhNWWdKWmpuSVcrSmJzUkVEVkVhZnVST2JFZk1IVWFuSy9Y?=
 =?utf-8?B?OHRaRGppSk5SV0w4aWRZdTRsRkFDaCtRVk5rWVMzQ0RJL2QveDVWY2cvTVRF?=
 =?utf-8?Q?NLPH0NjcX0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFpHSHAwOEZRWU16cjFJdFoxQUNXaW5KWmdKeGlWb3lkRnBQSDBrdUc3M1JF?=
 =?utf-8?B?SlI0U1JvMkFZcWVFRTVrUW9taDNlVTBQMFYyNTVudWZHWmNvZ0hzNzE1ajlq?=
 =?utf-8?B?N1hrcDYzbzRVTHVnaWkwbndMMHlVSVhzeXpVbEZUc1pRRkd3aHlRY1p0aTBj?=
 =?utf-8?B?WnhXZjgyOWxFdzQ2UHJnNHhPZzUxY2JLNjBJM1NpV3ZYVExGekRlR3lRYm5P?=
 =?utf-8?B?aXEvOWRkbXhXOUVya1J1K3ZidzFTQUluZ0N1UkpiOG1pdVJ2ck45eXZ2NFhi?=
 =?utf-8?B?SHVpdWl5SnpoMFh3TDFVVWhkVWdOQytNYklHM0NSUEliNWJtU1dZTFQ2angr?=
 =?utf-8?B?Q09qQVpqWExlbW5ibUFiYTBHU0tIb0tQL3d2ci9ZZlJ0ZlkrNUhIVjk0ZHhD?=
 =?utf-8?B?TmlGT0xnQlZ4VmVHam5nQ1JLVFVNLzlQRk5VYmwwcG5SWGJCL2d4Y29IZnRy?=
 =?utf-8?B?ZnlHaGhLVzl0ZUl0eGI4bVRENDUzcDQ2MG1EbjdWYUh4QlB2VUpNUmp4TE5w?=
 =?utf-8?B?dkRSMU5hS25CbldYOFE0VndxQjJDSVZuMFhNUDNBSkZQZ0x0dS96emN2UVhn?=
 =?utf-8?B?WlhDb2t4TitTZk1LdFhHcmJiVW9LazlmaVVtM29ET1N0ZUo3aEh0cGtEanpN?=
 =?utf-8?B?d3FrMWIxVjVJR1liR1F1TTQwcVRSMXRMVm0zVy9FUWVCdFJETVhrSVp0T1Rt?=
 =?utf-8?B?SUkwaUhDMWNFb3dQMEpueEU3eE43bjlxcXJCSXVtdTk1bjZvci9Xb0V2c1BM?=
 =?utf-8?B?ZjJ0T1pMNjRaWFNPcExoNkxPUlhVaG9rNGtBTWFEM096K1F2bitMN004TEwr?=
 =?utf-8?B?WThTbHNidGN6ekk1QzRxbktucHBHUGdZcm9UU1hNUWRkcVk0bXE0K21UTnVp?=
 =?utf-8?B?MEJVc1RxUkpaZm5DR2lxbUxZQzBRMzNOWXNvME1nRHpiUXF4dnFDUThjd3Fa?=
 =?utf-8?B?Z25xODZaZVUxejRxUDBHRDZEcmxSdGp6MHJ1dmpyVUpTRUxxLzdwMERHc1RF?=
 =?utf-8?B?MHUvbDVLRjZzUmhmMjhscmFHR1hRUjJrcmRkaUpCZGlsakRSYTd6dS9MM2Ux?=
 =?utf-8?B?L0VXbmJhV1NMQkUyS3FML3lhUlNoSGVrTUo3akRuQmcySE04dXpFSWhEMUlE?=
 =?utf-8?B?V2VKbFlDTjFYc0NwVUNCeWJ1WFlZSWVpbHJyZ2FPdXFJZzJIekVCbVE5SExC?=
 =?utf-8?B?OXV5WkFUeGhZbmlBMXlEU3BhTTZWNFk0dFpsRkJSNmdHOHVxenkzSUVOdmtp?=
 =?utf-8?B?ZnU0TGtZYVFkaitnRkVvU3JnaWpNNVViTEhwUXlLc2ovb1RtUlpFY3VqV0Yv?=
 =?utf-8?B?dkx5S1J0SXRHYms3aUJQUGJQSkxnVVF5bXBWMjBYQUJtVUk3MzZaMFFkSWk5?=
 =?utf-8?B?dy9pcG5KVEhEdTUxL2dsb2FSdFFnUVNHLzNNNURWaWNlTUx4bzRqVWJJeTJD?=
 =?utf-8?B?UDdUREV5Q1RFUy81SFRrdXI1WGJCVVBEcTlraVgrVnl1N3k3aHRSUlo0bkg2?=
 =?utf-8?B?MXBLb1IrNkE4T3U0cFk4WGFZL2g5ZWlsTmVLQUx4dWZHUm5OOVprVzQ0YnJG?=
 =?utf-8?B?b1BTSmdneHB6cjFFdElIWnNSc2ZzaWgzMkRDMU9XQmlKeHo2L29Qczg4bkd6?=
 =?utf-8?B?L1dITGJETGNUdm0zSHlXZFpnQVZOUTZxTTk1UkFBQS9SOHNDTnhZT29QdnIz?=
 =?utf-8?B?TE13UStvR0VvMTVMNGtOVGNNTjYxZmw4YWVqMnNQa0trWk5YSi95SXBhNTBt?=
 =?utf-8?B?bmRGNzQ4SThaL2IwZlBhRUpoZWxieko3ekFkTEordVJ1dXBCSWFFMEhUaHVk?=
 =?utf-8?B?RWo3ZFdGT2hRNE40enNPcHBTbWJZVXZ3MnRtRGN2YVBGS2JaZnY2RE9SbnFW?=
 =?utf-8?B?bzVrMStoL3BrOGZOMXdEVHJpc21vdVBmVlNsM0dIK2ZpMDNXSFZvVko2RDBO?=
 =?utf-8?B?OXh3aCtLTEFSaHpJUmxDazhtdk5ocjJvSFg4N280M1ZRTmplWEthVWhIVHRV?=
 =?utf-8?B?K285NmVSa1ZMamV2RFgxMEt1a2ZyZDhtMVBSYWlCZWNTVzdNeFJBdm5iQldq?=
 =?utf-8?B?eWd5Nkh4ZVJ2cDB4UlBqT01USUdjajR2RmRkU2ZLRW9jWUJSN2RiSmJLcGZ5?=
 =?utf-8?B?Mk5YTWF0L0owSVBkL1ZpOG5qNFE4TFNPOGgwUitUdUJNYlR0MDgxVkc0bmo2?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b19b4cb-f602-436c-9c94-08ddadf4084f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 23:09:38.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iMxWBzkC4fNuxkrAMGouHIxt2q5eWr4UAgJnS2HAHxT4vhwFrGKZU24g7XjGpREInmPUTUdtiJWrjRmGDt9Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8079
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

On Mon, Jun 16, 2025 at 08:38:04PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> ---
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> 
> V6 -> V7:
> - Created xe_bb_ccs_realloc() to create a single BB instead of maintaining
> a list. (Matthew Brost)
> 
> V5 -> V6:
> - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> 
> V4 -> V5:
> - Create a list of BBs for the given BO and fixed memory leak while
> detaching BOs. (Matthew Brost).
> - Fixed review comments (Matthew Brost & Matthew Auld).
> - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c                 | 54 ++++++++++++
>  drivers/gpu/drm/xe/xe_bb.h                 |  6 ++
>  drivers/gpu/drm/xe/xe_bo.c                 | 23 ++++++
>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
>  drivers/gpu/drm/xe/xe_migrate.c            | 95 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h            |  6 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 72 ++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
>  9 files changed, 270 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..9a9c33c7362a 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,60 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * We need to allocate space for the requested number of dwords,
> +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> +	 * space to accommodate the platform-specific hardware prefetch
> +	 * requirements.
> +	 */

This comment doesn't make sense as you don't insert a
MI_BATCH_BUFFER_END instruction.

> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));

I think you can skip the bb_prefetch here too. However when you insert
the single MI_BATCH_BUFFER_END I think it actually needs go at BO size -
bb_prefetch(gt). Also don't allow the SA to allocate from the last
bb_prefetch(gt) in the BO. We could (and should) actually do this in our
existing SA code too.

> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
> +struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
> +				u32 dwords,
> +				enum xe_sriov_vf_ccs_rw_ctxs ctx_id)

Not what I was suggesting.

> +{
> +	struct xe_bb *new_bb;
> +
> +	if (!bb)
> +		return xe_bb_ccs_new(gt, dwords, ctx_id);
> +
> +	new_bb = xe_bb_ccs_new(gt, dwords, ctx_id);
> +	if (IS_ERR(new_bb))
> +		return new_bb;
> +
> +	memcpy(new_bb->cs, bb->cs, bb->len * sizeof(u32));
> +	new_bb->len = bb->len;
> +	xe_bb_free(bb, NULL);
> +
> +	return new_bb;
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..7dfe9422dfab 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -13,8 +13,14 @@ struct dma_fence;
>  struct xe_gt;
>  struct xe_exec_queue;
>  struct xe_sched_job;
> +enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
> +struct xe_bb *xe_bb_ccs_realloc(struct xe_bb *bb, struct xe_gt *gt,
> +				u32 dwords,
> +				enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 4e39188a021a..beaf8544bf08 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -947,6 +948,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	dma_fence_put(fence);
>  	xe_pm_runtime_put(xe);
>  
> +	/*
> +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> +	 * BBs from BO as it is no longer needed.
> +	 */
> +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> +	    new_mem->mem_type == XE_PL_SYSTEM)
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +
>  out:
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
> @@ -957,6 +972,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_VF_CCS_BB_VALID(xe, bo))
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		xe_tt_unmap_sg(xe, ttm_bo->ttm);
>  	}
>  
> @@ -1483,9 +1501,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..642e519fcfd1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..6c30b106b817 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,101 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
> +
> +{
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	struct ttm_resource *src = src_bo->ttm.resource;
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_res_cursor src_it, ccs_it;
> +	u64 size = src_bo->size;
> +	struct xe_bb *bb = NULL;
> +	u64 src_L0, src_L0_ofs;
> +	u32 batch_size;
> +	u32 src_L0_pt;
> +	int err;
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +			&ccs_it);
> +
> +	batch_size = 0;
> +	while (size) {
> +		batch_size += 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */

This comment / math doesn't make sense arb_clear() +
MI_BATCH_BUFFER_END, rather just 2 flushes. I think a value 6 is
actually correct too as that is the size of the 2 flushes.

> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +
> +		/* Add copy commands size here */
> +		batch_size += EMIT_COPY_CCS_DW;
> +

This is where you should split the loop. All of the above is loop
calculate the size of BB.

Then allocate the BB, reset iterators, size to initial value.

All of the below is 2nd loop which emits instructions.

> +		bb = xe_bb_ccs_realloc(bb, gt, batch_size, read_write);

Again, no realloc, rather just a single BB allocation.

> +		if (IS_ERR(bb)) {
> +			drm_err(&xe->drm, "BB allocation failed.\n");
> +			err = PTR_ERR(bb);
> +			goto err_ret;
> +		}
> +
> +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +
> +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +						  src_L0_ofs, dst_is_pltt,
> +						  src_L0, ccs_ofs, true);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		src_bo->bb_ccs[read_write] = bb;

Maybe an assert when storing the BB bb->len == calculated size do ensure
our math is correct.

Matt

> +
> +		size -= src_L0;
> +	}
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..96b0449e7edb 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -24,6 +24,8 @@ struct xe_vm;
>  struct xe_vm_pgtable_update;
>  struct xe_vma;
>  
> +enum xe_sriov_vf_ccs_rw_ctxs;
> +
>  /**
>   * struct xe_migrate_pt_update_ops - Callbacks for the
>   * xe_migrate_update_pgtables() function.
> @@ -112,6 +114,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index ff5ad472eb96..3e37cb95ff32 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -5,6 +5,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gpu_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -208,3 +209,74 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_migrate *migrate;
> +	struct xe_tile *tile;
> +	struct xe_bb *bb;
> +	int tile_id;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (bb)
> +				xe_sriov_err(xe, "Probable memory leak\n");
> +
> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +		}
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_bb *bb;
> +	struct xe_tile *tile;
> +	int tile_id;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (!bb)
> +				continue;
> +
> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +			xe_bb_free(bb, NULL);
> +			bo->bb_ccs[ctx_id] = NULL;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 6dc279d206ec..e240f3fd18af 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -27,6 +27,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_CTX_COUNT
>  };
>  
> +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> +		struct xe_device *___xe = (xe); \
> +		struct xe_bo *___bo = (bo); \
> +		IS_SRIOV_VF(___xe) && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> +		})
> +
>  struct xe_migrate;
>  struct xe_sa_manager;
>  
> -- 
> 2.43.0
> 
