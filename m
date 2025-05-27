Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44CEC54F30
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 17:38:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3F610E061;
	Tue, 27 May 2025 17:38:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WBCDPn+L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CD210E061
 for <intel-xe@lists.freedesktop.org>; Tue, 27 May 2025 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748367522; x=1779903522;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BdCFvvR1DZ+fk0LU4qC7NclfK/01kumV5j/1LoyWFOg=;
 b=WBCDPn+LCInaEC6+OBt0Uxzf3cI7Uk5jLSFcBx5G0sqyLfgwJOVZ9vXO
 DqXAUQDz4Aa2ILIPdnsNviVtojANCNGJADwuMTl0wiJhdSiNMCpkm0GQ+
 Ly1vlU/GOJUlbkeeCVu+qEsu89rqhRG0ANLmwKwtBDYNxknLMM5ReYExt
 o0rly835FTFvh2gweIiRphBvC7YcdrnKto3I1vWHR8R5xwHH74huaz4If
 HREeVwpAYy83IJ9BOWjGGJO5C6zjZCa06JbqtBBzXLtKg+728ULUED8NC
 O8AZhOTLI93iJ9FbjfQ8A8uXf+r/G28dV3KjrQMReb1KbB5g3slBMe9Ur Q==;
X-CSE-ConnectionGUID: wZdAq+TiR66gYiWkXSCrYg==
X-CSE-MsgGUID: FJ7wbxpySLulIzUmUri+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="54024656"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="54024656"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:38:42 -0700
X-CSE-ConnectionGUID: W87r+T2nS7y7Qz8ivmu6gQ==
X-CSE-MsgGUID: t5L1i2UHQUKPos2/jFQoUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="142824231"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 10:38:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 10:38:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 10:38:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.87)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 10:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ihw3ddKJ+AT8A/dxB2NYLDKb9C6xRCehG0B2KQOuReZD3wp+voZfffXK4ptJSh1jyZuKMxqKSBv0JbJnBRncQSSJgmhit1Ei+X9rbxPN6Z/LbeRtsUjZRJZvWT5PdgbJYn+IEAi+Tqow5sHjr2UkcND2C/S0zM9tIyeuWoPOdjr2aqWb4KtncS7YzinQZq6pjGZYHZogzUTuBFbBTL4Iveqni8H8a4uYkqYon7ul2Ea6qRVjdTj4ewdMtYoyNoe7w+/B2AOhH80uVkLjLdWzlUyMq3d++SxC+/ezAj3rrvkVea199c6IawXXMhguObS1mRS3MpXe1KbdLJmQA4x+kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AE3036VBG1JCu0boSMD5drsCCbopVLEWWu2xEtRwPkk=;
 b=tWuVn15lspOjEVGw7yHM1vRs8xh+HTiTxMXrd2UVuXJByIoQSOvPZn0rkjOM/1u/hfICTZOLZU1sEFL2Yiw1/WUU/idggVoWKGVh4OSlsMYskSJ8mYw9hTMB1MfDPjvxp/gUdycLF49kMQvYBcvJdV8OgBWa5exmcez/BNp5ubJQAAGXPTcH8NzsR2U8yiFAglbgx56pudB8qvxk8TeXsee85ny4gWBYWJiU6qKNQM6Fcdx+9Gm+fYhw3J3xszVJcOCHg6AI3prnTf/JrG+RLSh0Oaao8AKYutLTzzOja96+j97qCKtZwbIXN6IOtmu+x9ClPFuSd17jVzv87xbPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by CY8PR11MB6820.namprd11.prod.outlook.com (2603:10b6:930:60::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 17:38:39 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 17:38:39 +0000
Message-ID: <df375ce5-20a2-4154-b9b5-46c1e17fce66@intel.com>
Date: Tue, 27 May 2025 19:38:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Fix out-of-bounds field write in
 MI_STORE_DATA_IMM
To: Jia Yao <jia.yao@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Brian3 Nguyen
 <brian3.nguyen@intel.com>, Alex Zuo <alex.zuo@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Shuicheng Lin <shuicheng.lin@intel.com>
References: <20250523150418.168362-1-jia.yao@intel.com>
 <20250527163050.287042-1-jia.yao@intel.com>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <20250527163050.287042-1-jia.yao@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::24) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|CY8PR11MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: ccf8d881-8200-4fe9-a70c-08dd9d4550c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzZldGtTR0VHL1dUYXBRclRubExPNkd1blZJZHMxSitBbEZPMlA5NmhzN3I2?=
 =?utf-8?B?Um5uWlN5OHYyU3IzNzE0bGVaR2owbWpJZnJQTlF0TjJoWDJIUDRjcnNSdURX?=
 =?utf-8?B?T1VvaHB5ek14dzVyUlU5dUt4eDBoSkVWRThpREU2SDc2ZGlEaks3dzgxcHg2?=
 =?utf-8?B?ODUxaDBpdnVtNWVWa1VPM3ZuT0Q2TVpvMCtHYVdWYnJXS2gvODNtcTBid3Ny?=
 =?utf-8?B?TG5GcVlsajBYU3hHRVFWeHZiWFkxMi8xSjg3c2d4ODFGWllRNGFtUXRhUHcy?=
 =?utf-8?B?d0diTVo2Q2JxcGh6Tm03WFAxei8xVEtGZXlicnhUaVZiL0NENkIrbCt5MldM?=
 =?utf-8?B?dkczdzg4QUdYU0FwSkhGSnpyc2VGVVlENk1hb1FUMkFBNEhyZVRSRmNGeldy?=
 =?utf-8?B?VE84ZnE3c1ZwT3d0UytjMHdFaVFZU1lDUjNvMU5BaUdJWUNaS0JnS2VLOXYx?=
 =?utf-8?B?WmRoVmpnYzZmV2pPcmVvUlNSOFpVR09oclNBYm8rTHNtcXE1dUxDYnpxSitl?=
 =?utf-8?B?UzBWQ3VjOGU5QmVUVlhVMVFjODFMdEVoSUxNbDd6SnF0ZDBNTFV3cnBKa011?=
 =?utf-8?B?THV0OUloTnBXQkwveC8reUtZWTUvS0ZVTStWWi9UdGg4bXdSRStxN0lCK2RH?=
 =?utf-8?B?OEN4SnEyZGZlTUpjYlY0M3A4N2RvRGpQTFFUd01rV2w0NmtWYWxkNzlnbFFV?=
 =?utf-8?B?ZDVkT1puNG1aZHQyOWdZeHpKRE1ubWFQU3lCSnN0bzVQNVhFSjNldU9WR01R?=
 =?utf-8?B?N0YzdXE4bVpQeEU1RWJSSXpGZ05laDFGQmtpYXlEeXM3eWpkSGg1ZUxMZUoz?=
 =?utf-8?B?R2FyUVRlZ012SHVkRDhPRk01ZEdkMkcyNXU5M2c3NWRwSjQ0L3N0K2N3bWtZ?=
 =?utf-8?B?bHowdjNsTklZdEJncFpzenpiT2w4eHJYaDJOMW5EZFVJVmpmYXgrMjlOK0Zy?=
 =?utf-8?B?TWpYZ1M1dk1DdUxPaERwUnhINEFmZWJGd2pWaDRtRkptenV2eDdsblpHeHEv?=
 =?utf-8?B?SjBJSVBLb3RoLzlKZWwvVkZtcUs1bGh2b1JtWnFFdVFhdDhPYU16YzRIeHhr?=
 =?utf-8?B?UFBwek01em9YNDU1RDhMWitzV1VwZVY0VzRiNEgvMmRqbE5OcTlMekc0U0dq?=
 =?utf-8?B?eG5tWmpsOXEreTUwL0VPa2NhZGI2eDlGUjdJWDdyUGlNcEhxTjB6UUFRaDVU?=
 =?utf-8?B?UXZ6dXJEcjNpZkxqTS9MTG5vWkRaR0t1Ri96cGhkeEFLQ09wN3loRkpWblp3?=
 =?utf-8?B?Z2FtSTR0dE8yaHRsT0k0cVhUazNYNWFyUlV6Ui9RWU1lVjhUbCtIOGUzSStj?=
 =?utf-8?B?RFBUMGllVTN4V2dYYkF5dTdOOUtlVDNmcmp0M05OVkJueHhWVHAxaE9CM1Ry?=
 =?utf-8?B?bXR2QVdLd1IxeU5lREhxc3FJVEtrSXJhWUJtZFpxR0FKUy9PSEFiMklEd1VW?=
 =?utf-8?B?TWlMTlpDekU3M1JJVzRzeVJZcjlSU3FhYi9tNzJnNXVNdGxvbmcrc2F2cDI5?=
 =?utf-8?B?RDNhanNmMXpUZ1g2NmpDb2czYzV2bzlhMTJrYlJaWlo3cHhCUnZ2bDZkaVJz?=
 =?utf-8?B?TFFvcStEYk11SEdyVHpiZGJ2U0tDdGlXU2FLRUFoSFVjWmZ2dkJFSlA4WWta?=
 =?utf-8?B?T2tFNDlCQXJYZ08vRS9pa3RCTlRjaGNORDFBVUdsR0NhSklleGRvclBycUlr?=
 =?utf-8?B?bnVONnIyYS9GK2JuVjJleDAwVkRiVWsrQnNZQXpGc1lONFdkMDlORWowZEJw?=
 =?utf-8?B?dE1ZeXpNUmI3elV1SGM0YldOQjhxQzgyaTlqRTJ0eWl3SGxtR0ZPYk5YOW9Z?=
 =?utf-8?B?ZFFqb2lSa2F6MGpSbUtBZ0Y0cUZYdEhxUDdralFuYTBFeGNvV0tOUGtmTnd1?=
 =?utf-8?B?QnFxOFRkNEhLYys0SGlSbm14OXZTMXg5UndSMUF3elhVaUhSN3UyODFuWTVq?=
 =?utf-8?Q?aabr8cnDXUY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzRlNy9pQ2EvVWx3K05BOU81UUhjL29jZDhET3NXdGg2S054em5KVW9DNkpY?=
 =?utf-8?B?KzBwY3RzMVZNSUNzT01JSjJrN1UwTWpFd2p4R2c3eGEvd2ZLNHUya1AvRkQ1?=
 =?utf-8?B?RWsxY0VYeWEzK3djVGxBZ0Y4M0QzYllkWkkrWVNaNUJYc1pPdi9xbFU4L2N6?=
 =?utf-8?B?NXVoNjltQTF3endoelZ5Y1V4WlBmcEY3M3pSTThLelRJdjhnZlRIMzkvbzlU?=
 =?utf-8?B?MHRsQ0lTMGNkcGxQdGwvYmVkZXhIalVLODZhZjdjTjFLaDd4cUU3VWR5S3JN?=
 =?utf-8?B?b1IwaktGamNsSmhYRnFkdXJKR1pnZ2R5dVl2a0c2THZ2QUNpQlAzSUIxSFJN?=
 =?utf-8?B?OUJzbkk3T3hHNXROamFpSEFGZlo1QWh2MjJNVXJRcCsyM29MaEJjZC9WTkJ2?=
 =?utf-8?B?WUxPNlJXeXpyL3U1cWJhVTJlYnRJV3VUdmx1dHU0QVRUcGFmalU4QXlEbUhE?=
 =?utf-8?B?R0FrVnBUL3h4U3RJc3dTdlFvM3M1ZVF1MnZFNG16R2J0Uk5VUU5BemJsVFF5?=
 =?utf-8?B?Y2YzRmJWb0IzMVhPUjRFenFMRGthaHY1T0lzVkIwV21OOStRSW5Td0lIdXdy?=
 =?utf-8?B?QytlTWFhK0MxM0FDSXVnNVR4YmhpRkVMaVMvTnZIUVlSTkkveTBMZFlSU2wv?=
 =?utf-8?B?L1RKUE5MTGU4N0lkV2wzd0FlaEZJR3k5VG1TTnVGckNFL0lQNmZiaFZNaERN?=
 =?utf-8?B?bDdLakZycFBBUGFLVkhsdkwzNDJDWTlsdXBwcHhOZlNUSWhscjdXYVlyald4?=
 =?utf-8?B?RjB3MDB1MWVmV0pKOXBSV0QvQUZMVmxpUlk0T1dQZlBHcGdvMzhVSWdId3k4?=
 =?utf-8?B?SkdkSmtPaVZ3OTBWT1FQblBpeHhYd0NhTUV6NU83b1dxTVlKSTROd0FwU0Q0?=
 =?utf-8?B?VlBzemlyZ1RQUDdTOEZWZU9zc3c2YmVnRlpKL3VrK2NvMGJRclBiYXo0cU9M?=
 =?utf-8?B?YmcxNTFXYVM0TllhKzZzbndZUXFGNktFM3VxNnFpd2c4ZThJNkc3bUFNbkh3?=
 =?utf-8?B?S01GaW1BZlI2TDJPZFR5azVFTTlsVk1TNG9hQ1FlR0FEWmx3UzRZYzBydEk3?=
 =?utf-8?B?dEdvRFZyemdqekoyVm8rWVJmbjQ1UUhQZTlxUjVQbXBSSG1NVWVVck9IcUJv?=
 =?utf-8?B?bTFpOXNpeVRvM1owZ0xjWE9YUmpIaWVHYUxoU29NaXhsM2gwRXV1QXZxSGxz?=
 =?utf-8?B?TGdOb2Nka1V4VHdFNVA1OXJXdEo1RkdBRWc3YkluYUpwOEV3N3FNbHEyTVdm?=
 =?utf-8?B?am9NVis5eHIxbVY3MGJqcnVoTWNJZkpTY1MyckZvTHV1RlJrYWhSdkllQW5L?=
 =?utf-8?B?ZlVPZm5jTVg3Y1o0WXNhYXNGMEtMa3BCYUlnNTlLbUFNTVNXVWpwRzVDSjhs?=
 =?utf-8?B?WU1FM3kxNUNEVjIxakh6YXhicm1reU1rU3pnQkcwOUtKNGxpaGFlZWIwSVNF?=
 =?utf-8?B?RkJ2bHJDcm0zam1icXE0d1VCR0JTRlBRdVNodEN0OTZPVUt4eVZjcVRsNHp1?=
 =?utf-8?B?Z2ZLdUZQeDJ4ZGZ4UVcvMHc1STRJLzROanVJT1JYRW8zRUF3MnBKdUMyMElK?=
 =?utf-8?B?NmV1cW4yMnk2U3UyM0VybmVUNmxPMGlleXlWSVNpOWVqWTRMQnNEYVlCMEQ3?=
 =?utf-8?B?emJxMEhVT3Q4TGI1VmZJTXJHMXpPK0o5WEFHMFdEWllIbHcvaXQ1NjIvZC9G?=
 =?utf-8?B?T1RnZ1ZvREx6Y09UTmRJSjE5c2c2Q0NMN29xWFY3V1J5MmlVUFBRYjQ1b005?=
 =?utf-8?B?LzdZbng2SnpOb3RrZDBERVQ5dkJxdk9MZUZRU2h4TWxIMGNmVVdodFRZWksz?=
 =?utf-8?B?dUJKVm93b0o4ZDlZSUY0Ukk1S0ZJS3dRS1QvaHRzdTlWVkU0a3ZRTnBoc0d4?=
 =?utf-8?B?UkZPTHZYa2FFdnNiRHdabDk2L2l0VjI3SVczeVdlM3d5TG9SbHdXMkZWeEhP?=
 =?utf-8?B?aUZWRXpYSzBlaDlhV3YvZGdDY1MxZkpRbkpsU0xRSzQrL2hXUnNjbE1DNVox?=
 =?utf-8?B?amhsdkJpK0t1dUtQRXk2OEJSZzRQaWFiMDlnZHVDYk4xY2Qxd0sxTXMyc041?=
 =?utf-8?B?SkFiUU1oMW1RbjlTaFRqU3pzczZPWXhTL1loa0lQTE14d3AyQW9NM3ZzVGhO?=
 =?utf-8?B?V1pRUnNhSzEwTGl2V3RrUzVUZytTek1BaGovei84V1YrVDVCY0FRZHo2clBj?=
 =?utf-8?B?TWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf8d881-8200-4fe9-a70c-08dd9d4550c3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 17:38:39.1371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VG0LPyrGKDFplwBVvQ85uiyblPC6sTAqzy3nV1gnwJpIZ+22L2WDe6n/rXFaSdeP6FYaosCBFTiTNghpkd5kURa9rwmC6IOD4TjrQSWxMlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6820
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


On 27.05.2025 18:30, Jia Yao wrote:
> According to Bspec, bits 0~9 of MI_STORE_DATA_IMM must not exceed 0x3FE.
> The macro MI_SDI_NUM_QW(x) evaluates to 2 * x + 1, which means the
> condition 2 * x + 1 <= 0x3FE must be satisfied. Therefore, the maximum
> valid value for x is 0x1FE, not 0x1FF.
>
> v2
>   - Replace 0x1fe with macro MAX_PTE_PER_SDI (Auld, Matthew & Patelczyk, Maciej)
>
> Bspec: 60246
>
> Fixes: 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Brian3 Nguyen <brian3.nguyen@intel.com>
> Cc: Alex Zuo <alex.zuo@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Suggested-by: Shuicheng Lin <shuicheng.lin@intel.com>
> Signed-off-by: Jia Yao <jia.yao@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..1ede50780a14 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1555,13 +1555,13 @@ static u32 pte_update_cmd_size(u64 size)
>   	XE_WARN_ON(size > MAX_PREEMPTDISABLE_TRANSFER);
>   	/*
>   	 * MI_STORE_DATA_IMM command is used to update page table. Each
> -	 * instruction can update maximumly 0x1ff pte entries. To update
> -	 * n (n <= 0x1ff) pte entries, we need:
> +	 * instruction can update maximumly 0x1fe pte entries. To update
> +	 * n (n <= 0x1fe) pte entries, we need:
>   	 * 1 dword for the MI_STORE_DATA_IMM command header (opcode etc)
>   	 * 2 dword for the page table's physical location
>   	 * 2*n dword for value of pte to fill (each pte entry is 2 dwords)
>   	 */
> -	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, 0x1ff);
> +	num_dword = (1 + 2) * DIV_U64_ROUND_UP(entries, MAX_PTE_PER_SDI);
>   	num_dword += entries * 2;
>   
>   	return num_dword;
> @@ -1577,7 +1577,7 @@ static void build_pt_update_batch_sram(struct xe_migrate *m,
>   
>   	ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
>   	while (ptes) {
> -		u32 chunk = min(0x1ffU, ptes);
> +		u32 chunk = min(MAX_PTE_PER_SDI, ptes);
>   
>   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
>   		bb->cs[bb->len++] = pt_offset;

For that,

Reviewed-by: Maciej Patelczyk <maciej.patelczyk@intel.com>

Thanks,

Maciej

