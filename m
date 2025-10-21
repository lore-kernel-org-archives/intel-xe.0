Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3473CCD1A7
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 14:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A756710E60B;
	Tue, 21 Oct 2025 14:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMmwFWO3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D2E10E60A
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 14:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761057771; x=1792593771;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JDiDZ32K69tsumy6FJByAL5VtY8wKqzC/qdWqBd/H3I=;
 b=kMmwFWO33xfdzsHG7BO+390Hbvo0azssH6wNgt2aWYG1R7B1g5fa0dvd
 cnunFpRgqHC86dNP1+EmTjjBBlDBVNUkBrQoL5x3u2MM3Bmpc3KbKnNo3
 DE/pDL0hZTqfCOvycFcqOxDzpDEBINHjPh61qtmeOduGqt9A/vLw93T0p
 BDFBModRCDHrjp7cT/bGNHA4U1hbsxhCEqf1mnuAQTTYTAb8qYBq5y/fQ
 EqyfyzPHYB5jlKPLJL4lka0XeBQ966TVsSru/819APT9lxguRMkWXWBVU
 Ff60vBZJUurM2wTIBtRDB/nClL3GAjEz3wanLyCOvDwEXcQn4tbVs2nKr g==;
X-CSE-ConnectionGUID: SKyDBkzBSQSFkLh5ObWwDQ==
X-CSE-MsgGUID: ClTvdqNSRvq1KaCyXoBEwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63281142"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="63281142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:42:51 -0700
X-CSE-ConnectionGUID: AO2hIk6eTuKTlsplP0CP1g==
X-CSE-MsgGUID: /wP95PeXQmy/pEswYgsN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="182768838"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 07:42:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:42:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 07:42:50 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 07:42:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRlH+1+mkvlhLOEbCwGCDKd3hNw9TxiwqQfsFJE2jXiJdt+BErYlY8qRurzhzhJDIqSzWtyxoB8BdAC1/FUtt33sZDsH+iotKQiKkrgNgQZwxClhNIexeSLnuoJCgZGJfB0s1fQCAN8Nh4DL5xH6S1cCe6Y4KIpMB3Qsb62pXu5T+jWJwEVPiPORQTpyd9RyhuQ3Zu0MJB0YkUjTiqG3qANVoUPtC2BRJKOusDoJVd4o2+ENWOX808nHUoH//bf0bpqoCaA/3OXnUJmy2mCAZCEiIHsnV3UVxlyw/tQGmvDvrlu5ARsE8a0WYIoxfwytlwDnAfWLHCLvVLfA6Nup1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xEnCt2ALz4xhv6DiDtdtHAIDNq6Pqcer8Vun8Xwgw0=;
 b=K0MwLG/b1IBqASstvo2oGFOEZaEVMImY69hucAyLxSAblhxNWQAPhTcTZ2eXzx6KFypc9QD7eyZiT4CkjHjdT5fwWQ9slAOLkd/ivTkaxHyx+rGd66rGiRI3P2emcUqKQG9MHVVuEFRECU3FJX1JABxur9+iGoE5dMtQOcp2oZrR7yWzclNdIoNSL2w6rm45eU5Dl8Vt9iYAY3azK3LsvNVaio+HXbMtQUtRVNN2IBbKsFGX+O/ZFn+qE1/fk3TX/jkyzRuJyQOhJcFJsKuFmDDxZr5N55f6q1mFCv6rJGQ4Z449EycYsrSyLjGbVPZHICBi+veLsUCCbbM55nK7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF92ECB6678.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::846) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 21 Oct
 2025 14:42:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.015; Tue, 21 Oct 2025
 14:42:47 +0000
Message-ID: <f7dfd924-d999-49bd-98be-2dbe176a26e7@intel.com>
Date: Tue, 21 Oct 2025 16:42:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: Tomasz Lis <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251021123943.1436375-1-tomasz.lis@intel.com>
 <20251021123943.1436375-4-tomasz.lis@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251021123943.1436375-4-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::27) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF92ECB6678:EE_
X-MS-Office365-Filtering-Correlation-Id: 76b86f4e-a37c-476a-2d1a-08de10b01a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rm5qUk9pVjNmb1g1UWU5ZVZqZFd6MlU4dDFMMEg3bGV3TC84Q1FPS2Jibklj?=
 =?utf-8?B?enI3Q0tvcS9PWEo0Wk5QaXdNRmp3dVZVRFBycURIK0s4RlVXRGNCM3dkcytP?=
 =?utf-8?B?cC9KQjBudzVzLzZRbDVnbW9zSTdqMU9SRG5sR0I5a3ltU0IyUDdvWWZoRndI?=
 =?utf-8?B?UUtYSHAySTdzd2F0YmkvZ3FrSWpGNlk4dmlpeGQ3azMrM0FoTjJ4bVRkZ1RB?=
 =?utf-8?B?R3A0d0F2N1ZOSkJpS3hhTUdzQVIwUHlKeXpvZTlHQUovTjhBbjdSRTlmNUR1?=
 =?utf-8?B?L2ZLclpncVdSTmIzK09sZ3IxeXR2Y2l2UmI2RE5rYlZGUm1pNFdJOVlJRXZC?=
 =?utf-8?B?ZTRSQ2tsZURCSUNYL2dla0N5K2R3bnVJcVJ3YU9oYzR6MHhFQmJ4SndsRi9S?=
 =?utf-8?B?S2M1WExOZ0tjOHhuek1Bb25vZmJGTzlreTdhWnc1dzRBZ0wzbGxaL1dndk9R?=
 =?utf-8?B?Q2VPa1hPZXE0ZEUvTisyWE4yZkJMcVlPaEtYSFVqTElZMnBvME5USHBVU1JX?=
 =?utf-8?B?Y3hSWlFtbVBQcEdDeXZjQ01ZVWZPTkkwaWxEK3pTbEZycWo3ckRXVU5JTzhi?=
 =?utf-8?B?UEVBVVozTGU0Y2xHYVdRam1vYmhGQ1QvNTMzQlRVTURzOFlrTS9nbTlpVW1k?=
 =?utf-8?B?dmRPNW5QMWRoNkZ2bzgvaTlwUFdHN1lGb2pkQ3Ftb2hHRko4MGk2OHBwUDYw?=
 =?utf-8?B?RG9mQXdudVAycFVoc29XWlBZWUZhdHl0K0ZoZ1pBY0gxcmNVV0gwS0ZsVE55?=
 =?utf-8?B?ZTVPMndYRHA2N2dpSlJVSThqUG9MQkxxaWVLNkZVWUFISmx4K3g5VzBwWkc4?=
 =?utf-8?B?cldYWkR2eVhsZ2hJZFYzMFhTWFVtc0tQbVE0OXFwK2ZKOGhFd1pDUHVaSjNT?=
 =?utf-8?B?ajRBOUdHbWNsZnV4WWRJeXdSV0d3elArczZOV2YrUkRjWE9QK0FyT0pMWVFC?=
 =?utf-8?B?TXcwN0h2K0RDb0s1WGI4Nm94dklMQjJrZkxqS1JGYkpUclg4RmdzSExyUWp5?=
 =?utf-8?B?MS96bENKM1NWSUZBNUtlRTR6aDdqaWNWZXJvdDBmTWE5ODhjbllPeXV2ckRl?=
 =?utf-8?B?R3JRVyt0N0ltcEFZbldRdWE1V3U0UlN5VWFzVFI3QlJhUkJhMUNnaWlnKzRN?=
 =?utf-8?B?NUl5c3BEV21aeWlEc3J5Z0J3WVI0YTVheGc4d3I0S0FmNE5zM280NEZKMFNv?=
 =?utf-8?B?dDJwaXAxak9FSjUwb0daOWl0aEc5LzVud1VTam1xZGdiUTJtT20vR2czSEJJ?=
 =?utf-8?B?citwRm45WTBBdDU2RldINHRPVXdDNTgwRy9JWXBzQ1RJb3JHd3VPZkxQR0Zs?=
 =?utf-8?B?S3BiYzZ3QzVYamRobEpXSnBsaytXenFRZldMZHd4MFlFOW80SEc3QmtWdDB3?=
 =?utf-8?B?NXJmdjB5RTdmeEYzUi9kZnhscEU3NitsdU1XUjVRNnBCS25WWHNrYzVxNGtp?=
 =?utf-8?B?RzJnbnhId2dLaFdwTkxWU1BkQlR4OHg1R0MxQUdEaWNUeTFpV3F3RytxbFoy?=
 =?utf-8?B?MlNpUUFlRzRjWm1iSkVaaTZ2aTlUZlJ2UFJ2eTBaREg0czBTTWZBVHVjeHht?=
 =?utf-8?B?Z0dHaWdZV1VyeVdqemt4Z3puNUJUdTFPSnFjMVg4aW1xKytiTzFrQXYrMStH?=
 =?utf-8?B?RW1pSVdxOXJLcGxuQStRSXV4aVFLU3doV0dGbllUbGw3NHVLMjQ1RWZNaW1T?=
 =?utf-8?B?MEVtcGlVL2JjR3NxZ0VYeFVnOFJjRHlVanhTTzdpS1RVOFhVcnljWmNwQ21M?=
 =?utf-8?B?MDVqampXZFBEOWsvNHhZZXpJZWJWbmpVUFJLaFRUMWkweWY1MVFpcFJvb0VY?=
 =?utf-8?B?WTlNamR2S1BUdnppMDlSYUZZK09FR1dWSEQwYmdyUThNaDRlZ2kvbUdzQ3Ju?=
 =?utf-8?B?MWpCRmg2QWtiTktVcldRcXBvRzdkeWl5NnZaU201eStMbHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnZES08wSnBsdW40cW90MGhHcXp4THZ6Nk83Y0dRalNRU3pOT2NTYnliOHdF?=
 =?utf-8?B?NlJTbzVQWDVpSngzTE1HWkdTT1J3MmVxR0NxY3dmdjA4NG1OazBnSHdZUWhY?=
 =?utf-8?B?UmU3Wi9nR2pYekFUWHhjcHpwYzRkeHB1ekh2TndhUHZmMDR0anRiM1QxZzAx?=
 =?utf-8?B?d3dKMkRUaXNwY2taWDE4UVNZNmd3TkgvaDhVRzJ6MEVDN1pQdHFpYUU5cXYz?=
 =?utf-8?B?U3gxR0JrdnV4RXhzOHNWNFhaVVI5UUdwZ3M1VUtFS1IwdjRjSzVSL0FSeFBs?=
 =?utf-8?B?ZFlCaVpDS2pQTXRMRGxkUjJKWCt3ZXdpeHVyNnZIWnJFU2czU1QxUEZ3ZEM0?=
 =?utf-8?B?U2V4VktnL3FNTHNUZ3BZMkdXVktRbGo5WnZYcXUxYjVyWXROTFVYQVdJd0Z2?=
 =?utf-8?B?a1ZQQVc2MWhsNVZIRGVFU3drY0xjUXJ5ZW1VWmtPanJGMjlBTmFCOFh6bnl6?=
 =?utf-8?B?UzhQOGwwMFhabjdnTUV6Tk9CUTFYRzJHL3A0bW9YV2VodE1FVklsKzlRZU1D?=
 =?utf-8?B?ZXY0eEpJYTlQTjhpODh5d1pOYWxMa2pGZ1F5Z3h3Q3VRQlVvQ3VCVmdsNmts?=
 =?utf-8?B?UW54V2RkR2k2VDh4N0tNdjBSMWFmNnpsaisrZE5CQlg3QWRsZks4OC9rdGpa?=
 =?utf-8?B?VUZ1L3ZhN1NWUEFiMVBIUWFocUNUOFFtRmlJaW5hb3FwVDQza2xUOWZIVG4z?=
 =?utf-8?B?dFB3a0phWU5ZajBEMlRYRXRJWGdUa1kyOGpVSCs4V1RJUUZiM2g0QVhjMXZr?=
 =?utf-8?B?VVg0UEVJajVZSEpTaWMvblNpL21QSXVtaXZOWTAvYlRyb25mejFEZmFVcWhz?=
 =?utf-8?B?QVNrcGU2SjBoQ3Zza0JWRkRwN0d2UnQxN2JuMFU5eW1QVDczanNud0RzbEhN?=
 =?utf-8?B?REIrZnFyY3dOWXlBVVFNaG1ZNmNwNzNnR1RUVzBXL1NwdENabGIyZ0dSZ1hr?=
 =?utf-8?B?UUdIRFRwU3V0anJQd2NsaUtMcmwzWW5YYUxwRkE1Zms1bUd3QkZybnJGU2xK?=
 =?utf-8?B?K1dTNlU3eU9qWWVFZlNoeVVRSkhLbTNJU1NYQmVkbkoxdVVON2VucnFaR1Zh?=
 =?utf-8?B?STRLTXBOdldJQS8yM0hpVWV0RStJMGZaOWNuVndFc2lYMmN0R21jWUZVTEN3?=
 =?utf-8?B?SDk3UExSeE9kUUt6Y1luL3hCc0dCeW02M2NHdzNBV0FxZG5kelc0YnFycjkz?=
 =?utf-8?B?SnNVcnZucmMxM1UvdGlqbTdwOCtFVDMyang0YXQ3Rkw4c1ZHbjV4R0xrNE1X?=
 =?utf-8?B?d2trWENEMllMdWV1b0dNZ2lidjJya3U2eXgweFE4VVVjNjErTmdyNHBHSzZW?=
 =?utf-8?B?QTlIY1puUW9FMUEwSkJjR01RaUx2dzJ2eHBRczdYNE5lYWFoNEhqeHVvOTlO?=
 =?utf-8?B?dUdHTXI0K21hMzE0d05vci9MY2E0MzdCUjVjblowQVpmM0EzbEJvZWk4Tlpo?=
 =?utf-8?B?TDlLNUloc3FkZnpxRzkwMEo2czc2L1NqRGxZZVJ4SkR4N1BtQjluUk9xYWJ2?=
 =?utf-8?B?UnFqVG0vbkpCdXNrY2pjdXdDRTlaT1ZrMEp1WFdCQS84c0poK0Y1blBmREdX?=
 =?utf-8?B?ekVva3VEL1FQYkloeWh3a3ZFdUVJSk9JdEJyWEJidkUrOHN4dVNJNEVxdnJq?=
 =?utf-8?B?WXNJSzBXTTJnNWh6L1lheVZ0RmdOYUJlZm5WVTdiNW95NlRNc3hnbWJrcFdm?=
 =?utf-8?B?alZ6MlZYYktlQlpITnlLT0VJWkxDc0I1dUJDdW5qTWhleE9CMzZJbElxSm9p?=
 =?utf-8?B?UUQxTElJQXpTZS9XUXpTeGJEL2dwT0k3cEdQbmpsUkJBaHJZNzZVeHlOUnJL?=
 =?utf-8?B?cy9zVUVYRWFaMTk0bWNsNmx3TG15ODMzUkg1N1RzTGF3OEpkYjRHWGkyS2NJ?=
 =?utf-8?B?b2RYNFQrUjlOL0owRi9rWlVzOTRlUDdQdDlxOG9hcWlseTlPem42clZ2eXho?=
 =?utf-8?B?VGxaSTV5ekFGVTNOZnoydzFmd1pCWngyZGQwS3pxWVBYZ0RTM1J5cWQzVit4?=
 =?utf-8?B?QU9jaGF0dTF6U1dkNGlCOXNwWVc4YXdEVjdBOFNCMTd5cXQ1QXpYNXRGWDZt?=
 =?utf-8?B?TjRnd1VvNHFNcVdOSEJIdEtDb0l4NjduVVlKUFcxWklOamxaK1pEZHBqSU95?=
 =?utf-8?B?aC8xNG1NR2R0QVY4QytIN1hnc0I1ZUJOQWpiYU1OZXhvZE9lM0hBSXVHdXox?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76b86f4e-a37c-476a-2d1a-08de10b01a19
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 14:42:47.4308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bh22nz24wISWiJQkQ1/gREhUdNuxeCy2BKWuwSW+ZK/6xCNTWxcpOwJvC9J2/V1F6gINVWXY9xQHqNlTn5tnRlXK7uBxTbcdAGol5umhr4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF92ECB6678
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



On 10/21/2025 2:39 PM, Tomasz Lis wrote:
> The check whether GuC ABI version meets requirements shall be
> performed after said version is received from GuC.
> 
> Doing it in wrong order was triggering a warning:
> xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
> 
> With this change, dislodge part of the VF migration support check
> and moved it to after GuC handshake.
> 
> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
> 
> v3: Update commit message, move check funct to ccs module (Michal),
>  rename xe_sriov_vf_migration_disable(), remove its duplicate
> 
> v4: Limit scope of some functions to xe_sriov_vf_ccs file,
>  switched 'Fixes:' tag to a different commit (Michal)

btw, please move change log under ---

> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Tested-by: Matthew Brost <matthew.brost@intel.com> #v1
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
> Fixes: ff1d2b5e3d28 ("drm/xe: Read VF GMD_ID with a specifically-allocated dummy GT")
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_vf.c     | 29 ++++++----------------
>  drivers/gpu/drm/xe/xe_sriov_vf.h     |  1 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 37 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 --
>  4 files changed, 40 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index 5ad39e315cb5..0a1331db2a9a 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -133,7 +133,7 @@ bool xe_sriov_vf_migration_supported(struct xe_device *xe)
>  	return !xe->sriov.vf.migration.disabled;
>  }
>  
> -static void vf_disable_migration(struct xe_device *xe, const char *fmt, ...)

as it is promoted to public function, now it needs a kernel-doc

> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...)
>  {
>  	struct va_format vaf;
>  	va_list va_args;
> @@ -156,25 +156,15 @@ static void vf_migration_init_early(struct xe_device *xe)
>  	 * supported at production quality.
>  	 */
>  	if (!IS_ENABLED(CONFIG_DRM_XE_DEBUG))
> -		return vf_disable_migration(xe,
> -					    "experimental feature not available on production builds");
> +		return xe_sriov_vf_migration_disable(xe,
> +				"experimental feature not available on production builds");
>  
>  	if (GRAPHICS_VER(xe) < 20)
> -		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
> -					    GRAPHICS_VER(xe));
> -
> -	if (!IS_DGFX(xe)) {
> -		struct xe_uc_fw_version guc_version;
> -
> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> -			return vf_disable_migration(xe,
> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> -						    guc_version.major, guc_version.minor);
> -	}
> +		return xe_sriov_vf_migration_disable(xe,
> +				"requires gfx version >= 20, but only %u found",
> +				GRAPHICS_VER(xe));
>  
>  	xe->sriov.vf.migration.disabled = false;
> -	xe_sriov_dbg(xe, "migration support enabled\n");
>  }
>  
>  /**
> @@ -196,12 +186,7 @@ void xe_sriov_vf_init_early(struct xe_device *xe)
>   */
>  int xe_sriov_vf_init_late(struct xe_device *xe)
>  {
> -	int err = 0;
> -
> -	if (xe_sriov_vf_migration_supported(xe))
> -		err = xe_sriov_vf_ccs_init(xe);
> -
> -	return err;
> +	return xe_sriov_vf_ccs_init(xe);
>  }
>  
>  static int sa_info_vf_ccs(struct seq_file *m, void *data)
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.h b/drivers/gpu/drm/xe/xe_sriov_vf.h
> index 4df95266b261..e967d4166a43 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.h
> @@ -14,6 +14,7 @@ struct xe_device;
>  void xe_sriov_vf_init_early(struct xe_device *xe);
>  int xe_sriov_vf_init_late(struct xe_device *xe);
>  bool xe_sriov_vf_migration_supported(struct xe_device *xe);
> +void xe_sriov_vf_migration_disable(struct xe_device *xe, const char *fmt, ...);
>  void xe_sriov_vf_debugfs_register(struct xe_device *xe, struct dentry *root);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index a2d61b37ff21..11851c18513b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -10,6 +10,8 @@
>  #include "xe_device.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
> +#include "xe_gt_sriov_vf.h"
> +#include "xe_guc.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
> @@ -260,21 +262,44 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  	return err;
>  }
>  
> -/**
> - * xe_sriov_vf_migration_ccs_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
> +/*
> + * Whether GuC requires CCS copy BBs for VF migration.
>   * @xe: the &xe_device instance.
>   *
>   * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
>   *
>   * Return: true if VF driver must participate in the CCS migration, false otherwise.
>   */
> -bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe)
> +static bool vf_migration_ccs_bb_needed(struct xe_device *xe)
>  {
>  	xe_assert(xe, IS_SRIOV_VF(xe));
>  
>  	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
>  }
>  
> +/*
> + * Check for disable migration due to no CCS BBs support in GuC FW.
> + * @xe: the &xe_device instance.
> + *
> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
> + */
> +static void vf_migration_ccs_bb_support_check(struct xe_device *xe)

if you make this function bool

> +{
> +	if (!xe_sriov_vf_migration_supported(xe))
> +		return;
> +
> +	if (vf_migration_ccs_bb_needed(xe)) {
> +		struct xe_gt *gt = xe_device_get_gt(xe, 0);
> +		struct xe_uc_fw_version guc_version;
> +
> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
> +			return xe_sriov_vf_migration_disable(xe,
> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
> +				guc_version.major, guc_version.minor);
> +	}
> +}
> +
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_sriov_vf_ccs_ctx *ctx = arg;
> @@ -307,9 +332,11 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  	int err;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> -	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>  
> -	if (!xe_sriov_vf_migration_ccs_bb_needed(xe))
> +	vf_migration_ccs_bb_support_check(xe);
> +
> +	if (!xe_sriov_vf_migration_supported(xe) ||
> +	    !vf_migration_ccs_bb_needed(xe))

then you can simplify the whole block here as:

	if (!xe_sriov_vf_migration_supported(xe))
		return 0;

	if (!vf_migration_ccs_bb_needed(xe))
		return 0;

	if (!vf_migration_ccs_bb_support_check(xe))
		return 0;

>  		return 0;
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 0e6b27016dac..f8ca6efce9ee 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -14,8 +14,6 @@ struct drm_printer;
>  struct xe_device;
>  struct xe_bo;
>  
> -bool xe_sriov_vf_migration_ccs_bb_needed(struct xe_device *xe);
> -
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
>  int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>  int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);

