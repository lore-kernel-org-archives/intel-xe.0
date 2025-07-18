Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D58C83F17
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 08:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AB410E922;
	Fri, 18 Jul 2025 08:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTwbdmqS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AEF10E922
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 08:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826692; x=1784362692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=/UmarzfZrUnH5L95vpayt2uSvojKlb0M5aDw0WLBWVE=;
 b=nTwbdmqSXmuuT8BQUae4aTSikXVSSQDtLg6/hqlAANItk0dXd5URk6GQ
 w6wrtKNNJm73oRZ7nrrWBRZsK8FgWAs/qGnvF4iBJ7v/I0oYDkYs9C2K4
 IjS9TQLNn5ZJbAAQOXR8gqpqIjLXTx8EN5RrQLpqKgw4buhUdUPlSZ2ZI
 PjEu52o3Va6p/zVMrwrYgfXxoApMb5Dk4jIEikX6MfNmUKIFK9N0Yjk/7
 OZnpMvw1quTcKI9wom4OsbPh3xkChovqXFYqABtby7zLaEt66vxPhIgSD
 nDbIutaQHOtqo88yUs9bD2ABkO2s5dyfGPNnCiYMZkspam/kA1pB1Fn1w g==;
X-CSE-ConnectionGUID: NeRr+hzwRoq4QPcWvoGamA==
X-CSE-MsgGUID: kWyIl4v4TQWAoYYDsbfXlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54328971"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54328971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:12 -0700
X-CSE-ConnectionGUID: OgZR58X2SuKfAQV27dfnzQ==
X-CSE-MsgGUID: NcX7+JYgRPmWgphyjs9OSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="162271419"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:18:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:18:11 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:18:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNS7XGDoPAcatVrP7n9CpmTcGrhsg4Coi2M2qAFKApqEjrEJpDPo6ueHXfKbDB8nixSmf1ARCY7oylcSCHKoTU7JMeawoC4KjRBDDJgwbGaTzZuxaW5OH7g3jfcVT94L0DpMv5ms14VhX9OVOMFZozIYVlfPXOzBjWSI8M9FO95y3V/05x49SbR6EhKU2b9FSvmRPAbjwbuE1BnLItNRlGdmxRh3LOXtJF7NK0mTWnhIjMbsqsSHFXbsSEpAkTWmtBtKCX73k+sZkrB/dBsD5n1rNxxfvdaekjHEJchvYMw2aCU+/R0V3+DePijIi5FNDvHQ2BABAGWlqi1Irw1/Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65A4sIuG+GUsZZ4kCdEL4bCWKSFB4K0EWFQMiABuvGA=;
 b=g/TcjMWf9mZIbRlcJ8GQko/j5ihxtW8sPj3KiP6Lxwz+cBQwQmnqUWWbMH2vSmPOVgfrBYI/blqIPV3vZmKgHj7g3m1434qyBejcIhzbVMhHThCbRDUGJB1HeZ4zlXTmKIR6bEpc2l7luOjdkVHup+q+8Dg5IWEKZ/7lN4LmrFvPBvyKhkp7JbssMLUZaeDSx9xfAVrFZvXUudu9VH7Y+QzfMKGSwUt1NDTIhbutd9Ds++xJVViKSEBln9ARIWghdj/nLIA+QMg7NF6+Wccu3BtPlhRefmVl+4p2hVhprRa9ToUhRv/jxjBV6DWwWrjTShGNrAB3CfkfT3Km/bgNpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH0PR11MB4807.namprd11.prod.outlook.com (2603:10b6:510:3a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 08:18:08 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:18:08 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v1 1/4] drm/xe: Add initial support for separate kernel VRAM
 region on the tile
Date: Fri, 18 Jul 2025 10:17:49 +0200
Message-ID: <20250718081752.630122-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718081752.630122-1-piotr.piorkowski@intel.com>
References: <20250718081752.630122-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0150.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::10) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH0PR11MB4807:EE_
X-MS-Office365-Filtering-Correlation-Id: 3755f975-7981-4143-c999-08ddc5d3a0e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlhnTCs2dFg4cEJpYXNybVJJNnFSUE1rRm04MnRyV3JKSFU1SnZKckZlVUFh?=
 =?utf-8?B?WlBuWFpZN1JKMTFSTW84TlBiM3FmVER5RnJVaHptTndrZEYrT3pmL3dFSG9T?=
 =?utf-8?B?cUttZXRMcUtjcDRvckpxRGZzb3VBcjJDdHJuUkk3dGVaNFpJa0FYZUpKVU5v?=
 =?utf-8?B?MU1CNUhPWllSODBzZlN2L0xSWTV0bWtTNktxbFVPS2FZbkR6QURxRnl3d0Qr?=
 =?utf-8?B?bm95R0ZyZnRuWHlHQWRnVkVXU3c1dmQ3bXNqMFIvY2RLZ29JN3NMZnlkK0pj?=
 =?utf-8?B?K3lJT3dHRjVQK0FWNlhlalBYNUk5RXFkWDBPQ1B1b1lhTWFlMWJsUzlBNGp6?=
 =?utf-8?B?QnZ4aXVHcTFZanJyR3R6ZnAvRGdWMWswSE9Qakkyd1E0WjVRUkRBUFVIWU5X?=
 =?utf-8?B?NW91MFI3L3pTT0V3QUpOSUxSR0craVhYRW1ZN2JFS1I0U1VDSlJoMWJqTW5G?=
 =?utf-8?B?WWFhK1NDMTdkNkw3S2dZQzZzcEYvazVBWk4ybTlSblZHMVd5ZzFZdHpBU0ty?=
 =?utf-8?B?ZlRLWVZYcEtzTnZKNXVTUDYzM2ZGK0pYejJFMm9vd0pVbjdXa2RJU0RxUy9z?=
 =?utf-8?B?bmZxdDZiSHlwS0NFVE1VTTdNc0xmV3ROQ05VK3dubHVNS0QzOGg2amJkV1F4?=
 =?utf-8?B?Q2t6K1kyRnlPaXNsRk84RHV0SHV3alAvT2dZQ0RpK1VLVlhtUHZ3RUIxUktI?=
 =?utf-8?B?K2w0MEpHUXBDNDU2cmFzUFZKeURSQzZJYndwTFM5UHlMUTNDYnFPb3MveHIw?=
 =?utf-8?B?OGFIVUZjQ2RKSmllU0pGVHNWaUo5VnB6Z2tiYjlqbFFGei9LWGRKNUtVWVFL?=
 =?utf-8?B?YXNhejlMT3hidW1RamdJNDAvVVBJNzBnbk5hc1BIRkJUbDRRTGptNkNRbksx?=
 =?utf-8?B?bVI5RFNSWjNKMG5NRkhyR2JienZvZ1VWdS8wUlUyMUtBQmUvMElBRWZtNmor?=
 =?utf-8?B?bjFiUnpBQk0zb25PNU9ybmFUMHJlRWUwbFdoWGNZcDBWeWVIMmlPNm1ENkxr?=
 =?utf-8?B?akFCN1Y1TkNxWG5LY09tNzhtMHRXN25TQVFKeHBCSy9RVlJHdEdHWERRNVMw?=
 =?utf-8?B?QjQyTm1LWVl5UmwwU1k4aWJQVzZBWXFBcEZCa09LRElxdThGUVpnYVlFYlpY?=
 =?utf-8?B?RUhsbW1mNGd1RUd3eWhZOUttZzRXcVlIZVJLQUR3N3RFR3VuZWdFeVhVS0NZ?=
 =?utf-8?B?RHVIekE1TXBSR3U5RVltRDBacGFwR2M4U1U0Q3pWcDhjNjdhZmRvRjVrUzZ1?=
 =?utf-8?B?SnZQWTNwWEgycTc5endJbE5yNzFibGczaTZKQndJQndyaXUvY3pEbStGejh2?=
 =?utf-8?B?SnprQ0J0S2JjenVkWlhCQkNYMHIxT0tUWVpjSlVjQUxnN0VrQVZIaGNLcXF6?=
 =?utf-8?B?SUZXRWhsWk1HQmU5Z2w3b2xFZWtEV25VUFFBOXN5SzR2MlA4QTNBUWljQm9m?=
 =?utf-8?B?cGhnbkY0WVl4SDkxdExaUHkzaUxkSSs3cUtHNDlBQ3c5K1JrSHphOUNmZy9p?=
 =?utf-8?B?bGw4RnRrVWRGYWdpSXU1WHcxeTAyR1dDOFk4eEl0YmV5VTAwN0hKM1Uzb3Ix?=
 =?utf-8?B?UG5UaVVRNkhaVzlOaVdWWjlpcVBkQk1MRHd6L0YwLzNibGdZcGhEQ2tJODc5?=
 =?utf-8?B?WjhLaktka1NZYzBHNU5PMmRscEJGUHR2K3oxNVF2ZmxJcFdOWjlBSy9pSHpO?=
 =?utf-8?B?M251WTdKZlMreXd5L3JINkNYVHNKRnNld2FZRHZ4Qjc0OXcxOE9mRGV4S1ZI?=
 =?utf-8?B?S1AyRVplbXlMS0c0U3N5aWFWc04zL1JZVUgwZDhCT0ExajBOazY1dG5mRW1S?=
 =?utf-8?B?SUZKSlJoQlhXemR3RUhJMnFrbDdwS1lDL2M4YWQ2NGJrUHd2cTlZbCs1eGxq?=
 =?utf-8?B?Q2prODR5OVpiaE1Pa3dCM2Z2dW9QdlFhMGtIcTNiWitQSkNnNFpNUFNwQUc3?=
 =?utf-8?Q?dc5QnsBMud4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STBTZVRNbFRqYTk5cHdreEJBNGM1R3YwRFNCdlAvd3l1djRjd3F6akhMdFV1?=
 =?utf-8?B?Y1dOQThCNCtuQjd5cHpIanhVcERHekx3K2FYWkd6d2ZPZmhhdGNtU0VuNGxE?=
 =?utf-8?B?aUxpbTdzVEZJanZDNXhaWXgxeFB3Tkhuc0drMWRRZkNMeW5PM0hoQVF3L0xl?=
 =?utf-8?B?bml5S0YxemhhdFU3Z3dFOGdNZnBMQ3ZYL3R0akFia3JYeFJUbTZhWUp4ZjdW?=
 =?utf-8?B?VGpiZWRTeWY1UUhHT3FOQUJmTDU5RTNqbmx1cWpoT3BVNEY0UVRVTDBmd3Ux?=
 =?utf-8?B?YWdqZEZJbXhzT25Lc3FqdXhxWjNKWVc1QWhBMlYzUTVDd08wQmlUVHd2bGhZ?=
 =?utf-8?B?SmhxMGU5dTArenpjbEhyZWFOT3dURFE3OVRFMVB3TFZpbk1aV0NPcDNEMTBY?=
 =?utf-8?B?ajZsSGJRczJsc3lKN1BHL1RMdGp3VllHbm9DQlF3Y2hrL2hvL1JORUd3RFNV?=
 =?utf-8?B?T0RpTm1ZblA2ZTlUeGJhVUw0NE5aK2tjaiswRnJuVW9Hdms2TFVCYkxYWlln?=
 =?utf-8?B?eWlSMFlHdExFYXRneGQwVVBYRWt4RWxKemxnVFhtUEYrWWNTdkRJOVQ5RE5J?=
 =?utf-8?B?bmt1Q1JLaFNpNHZ2NXd5ZlRSNVVXdGhuZVFtNW5XYXV5bmttWTVTNWYrYXhk?=
 =?utf-8?B?V2NPL1JZaCs5T2lnU09rclB6Q0txYllabXdXV2ZnRzFHYVlITGxKWmgrK0F0?=
 =?utf-8?B?NjRTU2NzQkdYaXlwSVNJZmJBaE9VZTZLUzZNb2ZkdWZ2OFRvdmkvSC9lR2dR?=
 =?utf-8?B?YmxTOXNVNDVEVjIvWndKMUlVVkJkdUdSVHFJSy9xVFRnVUlSN3dlaTNCbWk2?=
 =?utf-8?B?YUpjVzVtUW9KeUlGbUdoRDRBUG5NbytBaHNnNHBlQTZ1UGdFc253cTg2Q0Rz?=
 =?utf-8?B?U1djQU9qM3pFUEJEa1NaNittUjgvTHRiL25BRUhKSDMrOGRTdjdEbjBZVU1j?=
 =?utf-8?B?Q0ZTcUd4UnQrM2ZNQnJmdFNKWFRnWURhdkJ3Uld2SVUxc1VVT0NUTEc2REN1?=
 =?utf-8?B?N1Nsb0ZIKzJKZTF3TVk2ZU5jYzZpMEdPVHI0OExTUmdydm9BTW9DeG9pZ3pL?=
 =?utf-8?B?TGY0WWErVEcybDJjazdJVzdjQmd4OVlsUEtFeEc5THg3cVdvS0srZDhZUWFt?=
 =?utf-8?B?T0RpaFdrUURNM2grYllabGROMXUzK3VEZGl0a3c3QmFrWUtqcGkyaklybDJI?=
 =?utf-8?B?MUd4NHpyaXlST0tPRkxxMXNuNzU0VW4xV2k4MGxGWjZXNUhIczNWTURLUFk2?=
 =?utf-8?B?eGN4aDlybWJEN1ZUWEd3VVFiaHRFNkowVDBhdm50T2p6T2NvS0xmWVdsZHdK?=
 =?utf-8?B?NFBrajg1SmcwWW9pQlp4bllieHRkVHNaaVkvWUQwQzNoZ014bXExOWloM2JE?=
 =?utf-8?B?QmRkMElnYzN1d3pOMEoyeWh4MVhJMTBIQ0lDcUVjYzROalowQ1VrSU5wQzVL?=
 =?utf-8?B?TGtlNHRFM1hmalVLRW11QjFLK1FXNFBNaE9JaHc4am9DTkluT2Izd1pwRHhY?=
 =?utf-8?B?ZGJGWjRudldNazlkRXN5Wmg2dUFkUnRSbHowbzk1bGtLL2huemtGeGpHUnVl?=
 =?utf-8?B?Yno3bU84R1VvdG54YjR6Q05RemVBbnlJR0lQcWZ1K0RNWFY0L09oMVVETzlB?=
 =?utf-8?B?ZENkS2JBY0srT082cGNIYVhPNEVmRHM3d2M2ZlEzZUpvYyt1bTVZVXhIMTJS?=
 =?utf-8?B?TW5jRnNxM3hzUVZyMmpHVmEyam9wb1pNa2k0anpQcEszQktwZXdZSG1xejRE?=
 =?utf-8?B?bTFPMFNNY3N1Q0p2a2NTSWVISStMOWVqZTN3RzhtVW1qQUYzS0hsZHE4bnRw?=
 =?utf-8?B?cjY1Q0FTTWFFVnBIZ0poZ3dqcFZBWHo4S3VGVWJGVVdIZUNSSkthcXZKRG9Y?=
 =?utf-8?B?QlZOTTRGcC82cG4raGswVUhpMnNUSUp6c21QaTByL0N5YXlRQzJJbklTczg5?=
 =?utf-8?B?TVBrWklzeGhlRHI3eTlwQjRxTFV1bU1NeEU2a0lZVFNTbk1Bb2hrSFBkc3di?=
 =?utf-8?B?WXk3NmNVK1M2V1BLUVhLUm94TXl4V05COGE3YzlONzRvdzdUUHNsdHN4QkJz?=
 =?utf-8?B?RWU2YXlFdnJRSXc4bVJCcGxwU1hLUlJpTGlYamErUERoQ1RCT0p5N3hBTTZK?=
 =?utf-8?B?cVZIWVNlZVliVkIza2d3OWg3NkNOOWxMVkZ2VTdPNXFsUktsd3lDSUFhVUda?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3755f975-7981-4143-c999-08ddc5d3a0e9
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:18:08.6850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84uuTyxBXzul4g2X4Niq/WXflyRtSOf3t6iD9QS8ZdtUOi+rucVEHUpPniu7LtZiJ+d1PUOKgkZvbBnfEHOSjLRi55uxR7zcThyZ5wQ6ZOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4807
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

So far, kernel and userspace allocations have shared the same VRAM region.
However, in some scenarios, it may be necessary to reserve a separate
VRAM area exclusively for kernel allocations.
Let's add preliminary support for such a configuration.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c           | 87 ++++++++++++++++++++--------
 drivers/gpu/drm/xe/xe_bo.h           |  6 +-
 drivers/gpu/drm/xe/xe_device_types.h | 10 +++-
 drivers/gpu/drm/xe/xe_tile.c         |  8 +++
 drivers/gpu/drm/xe/xe_tile.h         |  5 ++
 drivers/gpu/drm/xe/xe_vram.c         |  6 +-
 6 files changed, 94 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 00ce067d5fd3..12e899726534 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -33,6 +33,7 @@
 #include "xe_pxp.h"
 #include "xe_res_cursor.h"
 #include "xe_shrinker.h"
+#include "xe_tile.h"
 #include "xe_trace_bo.h"
 #include "xe_ttm_stolen_mgr.h"
 #include "xe_vm.h"
@@ -208,6 +209,27 @@ static bool force_contiguous(u32 bo_flags)
 	       bo_flags & XE_BO_FLAG_PINNED;
 }
 
+static u8 vram_bo_flag_to_tile_id(struct xe_device *xe, u32 vram_bo_flag)
+{
+	xe_assert(xe, vram_bo_flag & XE_BO_FLAG_VRAM_MASK);
+	xe_assert(xe, (vram_bo_flag & (vram_bo_flag - 1)) == 0);
+
+	return __ffs(vram_bo_flag >> (__ffs(XE_BO_FLAG_VRAM0) - 1)) - 1;
+}
+
+static u32 bo_vram_flags_to_vram_placement(struct xe_device *xe, u32 bo_flags, u32 vram_flag,
+					   enum ttm_bo_type type)
+{
+	u8 tile_id = vram_bo_flag_to_tile_id(xe, vram_flag);
+
+	xe_assert(xe, tile_id < xe->info.tile_count);
+
+	if (type == ttm_bo_type_kernel)
+		return xe->tiles[tile_id].mem.kernel_vram->placement;
+	else
+		return xe->tiles[tile_id].mem.vram->placement;
+}
+
 static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
@@ -240,12 +262,17 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static void try_add_vram(struct xe_device *xe, struct xe_bo *bo,
-			 u32 bo_flags, u32 *c)
+			 u32 bo_flags, enum ttm_bo_type type, u32 *c)
 {
-	if (bo_flags & XE_BO_FLAG_VRAM0)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM0, c);
-	if (bo_flags & XE_BO_FLAG_VRAM1)
-		add_vram(xe, bo, bo->placements, bo_flags, XE_PL_VRAM1, c);
+	u32 vram_flag;
+
+	for_each_bo_flag_vram(vram_flag) {
+		if (bo_flags & vram_flag) {
+			u32 pl = bo_vram_flags_to_vram_placement(xe, bo_flags, vram_flag, type);
+
+			add_vram(xe, bo, bo->placements, bo_flags, pl, c);
+		}
+	}
 }
 
 static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
@@ -264,11 +291,11 @@ static void try_add_stolen(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-				       u32 bo_flags)
+				       u32 bo_flags, enum ttm_bo_type type)
 {
 	u32 c = 0;
 
-	try_add_vram(xe, bo, bo_flags, &c);
+	try_add_vram(xe, bo, bo_flags, type, &c);
 	try_add_system(xe, bo, bo_flags, &c);
 	try_add_stolen(xe, bo, bo_flags, &c);
 
@@ -284,10 +311,10 @@ static int __xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
 }
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags)
+			      u32 bo_flags, enum ttm_bo_type type)
 {
 	xe_bo_assert_held(bo);
-	return __xe_bo_placement_for_flags(xe, bo, bo_flags);
+	return __xe_bo_placement_for_flags(xe, bo, bo_flags, type);
 }
 
 static void xe_evict_flags(struct ttm_buffer_object *tbo,
@@ -1895,7 +1922,7 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 	}
 
 	if (!(flags & XE_BO_FLAG_FIXED_PLACEMENT)) {
-		err = __xe_bo_placement_for_flags(xe, bo, bo->flags);
+		err = __xe_bo_placement_for_flags(xe, bo, bo->flags, type);
 		if (WARN_ON(err)) {
 			xe_ttm_bo_destroy(&bo->ttm);
 			return ERR_PTR(err);
@@ -1953,34 +1980,33 @@ struct xe_bo *___xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
 }
 
 static int __xe_bo_fixed_placement(struct xe_device *xe,
-				   struct xe_bo *bo,
+				   struct xe_bo *bo, enum ttm_bo_type type,
 				   u32 flags,
 				   u64 start, u64 end, u64 size)
 {
 	struct ttm_place *place = bo->placements;
+	u32 vram_flag, vram_stolen_flags;
 
 	if (flags & (XE_BO_FLAG_USER | XE_BO_FLAG_SYSTEM))
 		return -EINVAL;
 
+	vram_flag = flags & XE_BO_FLAG_VRAM_MASK;
+	vram_stolen_flags = (flags & (XE_BO_FLAG_STOLEN)) | vram_flag;
+
+	/* check if more than one VRAM/STOLEN flag is set */
+	if ((vram_stolen_flags & (vram_stolen_flags - 1)) != 0)
+		return -EINVAL;
+
 	place->flags = TTM_PL_FLAG_CONTIGUOUS;
 	place->fpfn = start >> PAGE_SHIFT;
 	place->lpfn = end >> PAGE_SHIFT;
 
-	switch (flags & (XE_BO_FLAG_STOLEN | XE_BO_FLAG_VRAM_MASK)) {
-	case XE_BO_FLAG_VRAM0:
-		place->mem_type = XE_PL_VRAM0;
-		break;
-	case XE_BO_FLAG_VRAM1:
-		place->mem_type = XE_PL_VRAM1;
-		break;
-	case XE_BO_FLAG_STOLEN:
+	if (flags & XE_BO_FLAG_STOLEN)
 		place->mem_type = XE_PL_STOLEN;
-		break;
-
-	default:
-		/* 0 or multiple of the above set */
+	else if (vram_flag)
+		place->mem_type = bo_vram_flags_to_vram_placement(xe, flags, vram_flag, type);
+	else
 		return -EINVAL;
-	}
 
 	bo->placement = (struct ttm_placement) {
 		.num_placement = 1,
@@ -2003,13 +2029,24 @@ __xe_bo_create_locked(struct xe_device *xe,
 	if (vm)
 		xe_vm_assert_held(vm);
 
+	/*
+	 * In the case of kernel allocations, if the tile has dedicated kernel
+	 * VRAM region, and tile->id does not match to tile->vram_id, it means
+	 * that we are using unified VRAM and we need fix VRAM BO flags.
+	 */
+	if (tile && type == ttm_bo_type_kernel && xe_tile_has_separate_kernel_vram(tile) &&
+	    (flags & XE_BO_FLAG_VRAM_MASK) && tile->mem.vram->id != tile->mem.kernel_vram->id) {
+		flags &= ~XE_BO_FLAG_VRAM_MASK;
+		flags |= (XE_BO_FLAG_VRAM0 << tile->mem.kernel_vram->id);
+	}
+
 	if (start || end != ~0ULL) {
 		bo = xe_bo_alloc();
 		if (IS_ERR(bo))
 			return bo;
 
 		flags |= XE_BO_FLAG_FIXED_PLACEMENT;
-		err = __xe_bo_fixed_placement(xe, bo, flags, start, end, size);
+		err = __xe_bo_fixed_placement(xe, bo, type, flags, start, end, size);
 		if (err) {
 			xe_bo_free(bo);
 			return ERR_PTR(err);
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 8cce413b5235..dde8e0274ff2 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -61,6 +61,10 @@
 #define XE_BO_FLAG_GGTTx(tile) \
 	(XE_BO_FLAG_GGTT0 << (tile)->id)
 
+#define for_each_bo_flag_vram(bit__) \
+	for (unsigned int __bit_tmp = BIT(0); __bit_tmp <= XE_BO_FLAG_VRAM_MASK; __bit_tmp <<= 1) \
+		for_each_if(((bit__) = __bit_tmp) & XE_BO_FLAG_VRAM_MASK)
+
 #define XE_PTE_SHIFT			12
 #define XE_PAGE_SIZE			(1 << XE_PTE_SHIFT)
 #define XE_PTE_MASK			(XE_PAGE_SIZE - 1)
@@ -127,7 +131,7 @@ struct xe_bo *xe_managed_bo_create_from_data(struct xe_device *xe, struct xe_til
 int xe_managed_bo_reinit_in_vram(struct xe_device *xe, struct xe_tile *tile, struct xe_bo **src);
 
 int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
-			      u32 bo_flags);
+			      u32 bo_flags, enum ttm_bo_type type);
 
 static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
 {
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb6105523f23..3a417305c1b8 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -155,7 +155,15 @@ struct xe_tile {
 	/** @mem: memory management info for tile */
 	struct {
 		/**
-		 * @mem.vram: VRAM info for tile.
+		 * @mem.kernel_vram: kernel-dedicated VRAM info for tile.
+		 *
+		 * Although VRAM is associated with a specific tile, it can
+		 * still be accessed by all tiles' GTs.
+		 */
+		struct xe_vram_region *kernel_vram;
+
+		/**
+		 * @mem.vram: general purpose VRAM info for tile.
 		 *
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0be0a5c57ef4..a14f549effdd 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -124,6 +124,14 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
+	/*
+	 * If the kernel_vram is not already allocated,
+	 * it means that tile has common VRAM region for
+	 * kernel and user space.
+	 */
+	if (!tile->mem.kernel_vram)
+		tile->mem.kernel_vram = tile->mem.vram;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index dceb6297aa01..5d834378b354 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -23,4 +23,9 @@ static inline bool xe_tile_is_root(struct xe_tile *tile)
 	return tile->id == 0;
 }
 
+static inline bool xe_tile_has_separate_kernel_vram(const struct xe_tile *tile)
+{
+	return tile->mem.vram != tile->mem.kernel_vram;
+}
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index b44ebf50fedb..7adfccf68e4c 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -13,6 +13,7 @@
 #include "regs/xe_gt_regs.h"
 #include "regs/xe_regs.h"
 #include "xe_assert.h"
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_force_wake.h"
 #include "xe_gt_mcr.h"
@@ -283,8 +284,11 @@ static void vram_fini(void *arg)
 
 	xe->mem.vram->mapping = NULL;
 
-	for_each_tile(tile, xe, id)
+	for_each_tile(tile, xe, id) {
 		tile->mem.vram->mapping = NULL;
+		if (tile->mem.kernel_vram)
+			tile->mem.kernel_vram->mapping = NULL;
+	}
 }
 
 struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
-- 
2.34.1

