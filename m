Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AD1C83F09
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 12:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945F710E7BC;
	Wed,  9 Jul 2025 12:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H83+Iauh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6438D10E7BC
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752063356; x=1783599356;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=9643ykSLGE12Zf1/GT+f+aS1lVusz2BR0SlP59MpPLc=;
 b=H83+IauhkxdS35x8lub65t8qnN8RGU+0chnlaU9MqH5yweZRchngY6zW
 kXGorSI8qppv6869vNIALnVFeRbjX+0lJ2Mdf8prcQq7JH2bPaJdBLOQk
 c3NYs3JQaIi2woH0yWY2WscH2QkoPrN0ds8lrIW2U9sN9Ki+B5qHkmy0a
 mcm0fj5yG9wTsODNB2fEOQOLp6gzlUBAptFwWXa/cd8ynWSGFG8D09By3
 JKM2mmu19dXBLIbgWoIqnrPVtNqcllDFc/n4ZyxH+4SpDc4zBAJx+w+vW
 v7z6lgkA/7o6o3rQqx8F2951RRrdv2gL4koES4iRpSvQP77EbXOP81QCX A==;
X-CSE-ConnectionGUID: n1UUfW+oQMOs7XIlsNHVeQ==
X-CSE-MsgGUID: q9uEz448QK2Jfj/hC/3S4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54466477"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54466477"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:15:55 -0700
X-CSE-ConnectionGUID: fwGXbN0TT5KmxOHJEl9QOw==
X-CSE-MsgGUID: +rGOzKLpR86bTNHHKLPeww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155848437"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 05:15:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 05:15:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 05:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9ARhYmLqMkQ9rEkogLRgc5tl8LBWLX4B932dRFFzbcDuIf+gQMeUyApzWNs8QowcqYoYwP28BDH5Gq9XrZOm742nORpjTOblZcTXqmkTDHz6a7uKUWI/EqMkBJnh2VlALoPkPxYpCc+SlmXRvU/KVi3WfOBSGbLE87uGS8GCnfdF0P8kAWz3wDrj9urk3x+P/CxtY9/5RH1Xr8dc3JrpILVwCUNxKpE6ej8yUbZLPc/8XNmtfVkjnCleXL++UrqF+u1ksrg77mZG5oOU9g3qCCCaj4mURc89TFrj0GuNw0xQLCF9VnXYkEFmVq5tIOtpBmNRqDH6P2QZW7u6up5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H72x7or7vJTGrlet3k1tqZVlMUQH4pDLakagby1jQV4=;
 b=kqJwaRBeuGrT5fHuqGn6PR+DOUhWtw9gqz/eBonrJqE8aAUyXs8SdM8bUnu9Dm2euZpx6IMzHA/bOKBA4oLllRsklCDnwMvHbeNJXUdXwoYVrzQtsMAc+nIXUujAfAi7I96cTf3n6uU7o5aH+ZR99LAOpmmwhU/ktBw7BznYo/25ZAD0FjoFDiAGnjSJ30774Gg86k7x/PjbF+OBkmutvsMtF6MKTMae2TymYU6fC958qukPqMSAecoumjdcHhgZfCDkbq2+V+8Pc7kQ9xfoumi72Afbe51i6LT2rApxj6RfVJ1r15mZgxSR0ZAElAw+AjHPXcufSorG1DN2n/bEVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB5008.namprd11.prod.outlook.com (2603:10b6:a03:2d5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:15:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 9 Jul 2025
 12:15:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Auld" <matthew.auld@intel.com>
Subject: [PATCH v10 1/5] drm/xe: Use devm_ioremap_wc for VRAM mapping and drop
 manual unmap
Date: Wed, 9 Jul 2025 14:15:39 +0200
Message-ID: <20250709121543.4129807-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
References: <20250709121543.4129807-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0222.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB5008:EE_
X-MS-Office365-Filtering-Correlation-Id: 333e1c08-19ff-41e3-4b01-08ddbee25940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WlRtWE1McnRFTDNlaHZaOGRrbC9YbmhDWnlhc3V0ZWtFU25pQXA2N1QwOEdp?=
 =?utf-8?B?TTlJbmtmQ1orOWVHWGlDSW9obk9xSCsyWDVRUVdhSXVUWEJoNUFSaHhGNUVj?=
 =?utf-8?B?Rlc4VWw5Znl4MW9pOGNscHAvRjJmWHpsTWtIeGZ4NUJYWitZVEJ2Zlhld29J?=
 =?utf-8?B?UXJyakR0ZW5UbDluc1lheDFiS2M1bjFwK3BsY1VSb1lpZlZXNjJSUGdmWkRC?=
 =?utf-8?B?VU5hd1NpU3FpYkpxTlVsZlpySjVMQU41RU15ZmdWc1hKcldkc05tMTVDNUVL?=
 =?utf-8?B?RjhGcmVKWFNVNFNjWjBDa3Z3cjl0Z3NqMUpybXp0M21XbWFWS0VDZEticmY4?=
 =?utf-8?B?K2pXMkR3d2xXcVVDOWI2bmt3alF3S0k5eW1yK1lLUUNaQkR6SVQ5TjRCVTc4?=
 =?utf-8?B?UEFza2QvMURSVHRqR1JjOGxqYWZKaEhzSnQvQndmeC9zdWNubzdLUkNsWlBu?=
 =?utf-8?B?ZmhWQ0FwdHUwR2tvV0tKZUVEMS9seDFPTkFqSTJpWDRVNlBhd2ZoMUdqRFpx?=
 =?utf-8?B?K0hoa2VQL1J3cEZST1Z0TmVQQ3BtamRna0NuNGtPbERxR09oYW9ZcDFkZU5S?=
 =?utf-8?B?cFYyRzM2ekY0STRFU0x6WWhpcy9OS0ZSbU8rZVdQRUFwQXphdjNhazZ5UnJ6?=
 =?utf-8?B?Z1dSRkR5TzJxaGc0OEM3cFIrc3VNWG9MTG91d1FVK3N4QzJHd2R3a1Z4SStS?=
 =?utf-8?B?L1JQVTdaWEdqYWw1N0poWGVUVVhvSk1nTjB0ZFBibVVEZkU3SVJ3MTY1Sy9R?=
 =?utf-8?B?azFER204SStqSldISW5ISjVRSjZBeEVTVkhlWXNOdVc3RG0yTm9zMDhQdFdX?=
 =?utf-8?B?TTgzOFNyeFAwWkUyTDE0ZFNqRkVKYmRpQkRpZTNQT3lXYnJML2IvNXVDaGJz?=
 =?utf-8?B?ZW1OZExLa3J0aU5OaFlnbEpXYm5Qc01xWlJyb0dIazVzNnNSZm4zU3JJRnNj?=
 =?utf-8?B?RWRPak1ZbXQ5OSttTy93Qm1rU3dpWUVDaEM3eDNJcGQ5cGVRWE1ySmJhKzhL?=
 =?utf-8?B?MXR2WTYrb3ZaUjd0K2sxUkRuK08rTExlT29qSE1Bay90RkhRbkdSR1pyZVFJ?=
 =?utf-8?B?UWp0R2NEakJqU0hRUkxnMEd6TUZsNHBuUTU4d3A1OUNRbUl1MkZIZkEzMHBH?=
 =?utf-8?B?WVFnK21zUkVLdTZvWDNZT3lQc2wra1JRRjVkd0ozQ2EzTzdtRCtZTkxyNFd2?=
 =?utf-8?B?Q3VMaEFqdG9nQnVEamRtcC9kVm54TTRKR0g1dUNpK1YzL1Uvc2t3S0p3SHhq?=
 =?utf-8?B?MVIvbTJhdjExM0NySWZYeE9DTlM0K0tlUjlNYUlCR3o5SXY2Z3lkbGwzdkNz?=
 =?utf-8?B?QkdnT0oyNDlFNHlyU2hBS1hyakd4NU04dFJueXBXN3g1VTgrOCtpT3pSYVd5?=
 =?utf-8?B?ejlZQUQ0THF2bzUzeDNPRk50ZTNZNVp3SlJWVndlYkNHR1F3aGRHdGU4VXJX?=
 =?utf-8?B?ZWJmWTNyem1VYkxVY3M2Szlmcm9vSDRpQVlYNTlWZCtlTHp2YmZtZFNPQlJa?=
 =?utf-8?B?eWdSR2hJUlluNjJucGQyUkdtNU9JOUVrYkthSG56eTY3eWlweVNuQ3ZsSFdj?=
 =?utf-8?B?RlhNV2hTWnVJNWpZQXVCWVkxSk5HNEZFUFlWYmowdWpvWisxR3JJY3ZGQ1dr?=
 =?utf-8?B?Nkgxd29QTlJKek9ycW03Tm8wdUZ2SHNWMjFrSHFRVkZiSGluQXZrRGdQcmFt?=
 =?utf-8?B?R2QvRGYvdytROXJqU3BUbVpMc3dhdGp6bWsreGg5dUNVZStZTENuaHo0c1Fy?=
 =?utf-8?B?MXovZklQamdGWXJVYnJUaEdOVzVaNUVWNzhDajVXcURGS28xTUQ1eFBTcUh4?=
 =?utf-8?B?ZExHWGJpNHpPVUhYcUZ4Smo3VDNEL2FyWUM3R1BVc3JGcFV1WUZIUDVBOUcv?=
 =?utf-8?B?cUdMUzhjRHpDd2ZMYzBJMHN3Rmorb0J4UlcrZWZNNHNvZko4d1lvSEtSemM1?=
 =?utf-8?Q?lBonJGV1sFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZycHBjbnMzK2JXaVV1QUk1eU43d1FPRWVxbThxNXJXeW5OdWFoQzdiSS90?=
 =?utf-8?B?Um5qVjAyKy9vNVErbDMvUE5YM1ZsakdhSWhzYlRJNUlGSGVQa3RiRUMxR2lm?=
 =?utf-8?B?RFExTHQwbzBSM01wSUhrR1dMcW9OTEc1czhtSFEyYlljbnV3UHRHR25MVXR1?=
 =?utf-8?B?WitBR1ZTN2Jibm94dkxVSEU2TUdKR29ZTDR0L2RERHJqK3hMTUtUaEVxUDFQ?=
 =?utf-8?B?RGNNL0VGcXZTK2pTUmdmUWhDVE1TY0hsZUhtcXlibURsT01EUGE3SkVNWHR0?=
 =?utf-8?B?d2VoSDdQZkw1eWNuY2xjK3BNZnZMY2hYM1hkV0MxaEJCNFFqQzN4Y1hDTnpa?=
 =?utf-8?B?a1FXMDN0bWNEUWlqR2MrNFBPNFFzSjVpdXlBa3FhVXR2K0x2b25VVHFacnlt?=
 =?utf-8?B?SmlZREVMd0Ryd01tZjc3U0RjRU8zc1l6eWE4MmUvUUlmc29XMldUNDhWbkx5?=
 =?utf-8?B?L3pIdzFWaXFmeDRQdExCd3BJWm54L3cxYndWeUdIWHh1cnc4MjRGbWRGR2ly?=
 =?utf-8?B?cW9DVmlqVDQxMG54ak5GeURsYi9JZUxQNmhQMlRaeG1ubTVZU3NscFY4RDlt?=
 =?utf-8?B?elpsU0U2OFVKaFhSN1NHUGtJMjNJVFJFbndWdUVnaFdJTUIyclJHTVlCUVNy?=
 =?utf-8?B?ODkwZUIwblZYK205WnRPenBoRkFhSVpCMXI0QjRhODFzZk81VXNvK3BlSGZm?=
 =?utf-8?B?SGJJcUplNVRHV0hkRTRKay9WRS9CVUhsQmhjc2NFRFN1QWs0RjRXN2JCVlcv?=
 =?utf-8?B?enZlWmtFL0ZSTDVoWWxuVVNEb2pCbWM2bDQzOFRhTW1KUlpwSTFoVUJuRW96?=
 =?utf-8?B?SUNUQytNMGlDSlZiSVJEQUQ2MmZOM05RaXVZN0NYd0tSZitjMFZhYXgwZTdl?=
 =?utf-8?B?bUZPOWV2Zk9Ob24yRWJZdFlkVWJHUmhBakNpWCtxNWhlNkl5M1RUKzExbFBk?=
 =?utf-8?B?TGV3WVN2emNNVkV3S09ic1ZmM1d2aVhqd3Q5WnZOR3FlYlZFUzJGdGNWdzlV?=
 =?utf-8?B?MWUwazFkaTd6NEYzbThGTXN4R0FBSGhSaU85NUx1cmZ3dkdORzlBZE5aK0tS?=
 =?utf-8?B?YjFZUE9XVzR1OXBVNGVPckx2ZXhyNVg3Z21PdldOV0g3MUN0Y3hKT09EMGk1?=
 =?utf-8?B?NmlGdkFQL2RHZUpQMXVib291M1VFWWNRb2RVczZMcGJlZ1NLU1VnRzBuTmRS?=
 =?utf-8?B?Zkd0cHJiYzd1QzJTMDNBOTVZQ29uYmxZSFlSeS9EYjVnR3dsWTNBVUN2OUpj?=
 =?utf-8?B?Ni9MUmhQYXJCT29oSVBrWG1JcHArMHhST1QxdnVVc2w1V3FIMFk1b0RzTlV5?=
 =?utf-8?B?a09vWUJBNVhqOFZJenRNOTA1MkQzWHFSbDBwSk1QYjBXL1poYy9ObHBiK3Bt?=
 =?utf-8?B?YXJ5VTdNK3kxb3FhQmFjQVZxdENZZGh4b3VIQ1FxZHBrTk1YNGt5czlrVnV1?=
 =?utf-8?B?emlEUHdHaXg5M2hlSkhmU2ZwR0hSeGpkUGRDUklqMTg4Z2JJREtYc3RiMzcr?=
 =?utf-8?B?b0FOTk5rcmF6R3FJM0g3SW1jMU5zTUtMdFlGc0pzYTdWSTE0RmRhMDVGOUp0?=
 =?utf-8?B?RGwyQ3doUlMyNmZRQVY4OUtaQkZORnN2Tlg3NVY4Z21IN3pPcXltaVNZcE9B?=
 =?utf-8?B?OGJ1eE8yTFZVRXZzL1VRbStua2N0K2N1QWxPUlNUTS9hOC9SQUVleGowOUV4?=
 =?utf-8?B?RERwVE1MQTJTcTFTMkFlTDd6WXlHakhBSm9YSk5VTFpUNk1UaFc3YlpOeWFo?=
 =?utf-8?B?U05uMUg0K24zS0tLSFFKM2JNdkI3bEU5N1JacGEyS2hZeG42amFtS0RsSzM2?=
 =?utf-8?B?U3hMR2MwQzF4bUZxeUtaeXNOeGsvSFJNeFljdUJLVDE3NjR4akhTaHJ3VFVu?=
 =?utf-8?B?UUZJRW5qMjNlcVU3b2htQlB1Z0g1TFhtT1lYQXoyOTlyNzF0ZFJzTE9LZ2Q2?=
 =?utf-8?B?NVp1a0NsMVVnR0ppWmdHcE0rT1ZWNFJJNkVxNVZyVW8vYXZlNTNYRmx0NGVt?=
 =?utf-8?B?ampwN3UrcjlJRkxNb3NkRWNCRVNvenlqbGJpV3o4VU9JYmpTVm9rN3Q3SWgx?=
 =?utf-8?B?bFpwTkVQSDFuNnQwTDErY1FwdDNxcUhlVG82aEx5TTBJWW81aHBmRTAvRXdE?=
 =?utf-8?B?VWwybmJaSU84OEdTVG8zTVdNRW1ZRzJGckJ4MFZLVWR6RURiZ3dqM3ExdS9U?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 333e1c08-19ff-41e3-4b01-08ddbee25940
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:15:52.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBkjQElxeyjQQ8/B+1y9C3d8/Sg4Qc6UL1iB0I7mKzHXAsYUiVrXiMAHe7GjnWMeVeRscTQX+G8DyjDU4Xwnr0K2oTNPEiHY/p9kz9/pi6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5008
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Let's replace the manual call to ioremap_wc function with devm_ioremap_wc
function, ensuring that VRAM mappings are automatically released when
the driver is detached.
Since devm_ioremap_wc registers the mapping with the device's managed
resources, the explicit iounmap call in vram_fini is no longer needed,
so let's remove it.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Suggested-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_vram.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index e421a74fb87c..3a4c84e9efc6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -156,7 +156,8 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 	xe->mem.vram.dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = ioremap_wc(xe->mem.vram.io_start, xe->mem.vram.io_size);
+	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
+					       xe->mem.vram.io_size);
 
 	return 0;
 }
@@ -278,9 +279,6 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	if (xe->mem.vram.mapping)
-		iounmap(xe->mem.vram.mapping);
-
 	xe->mem.vram.mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-- 
2.34.1

