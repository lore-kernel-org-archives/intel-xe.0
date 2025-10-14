Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5C1CCD187
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 08:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389710E577;
	Tue, 14 Oct 2025 08:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCAOyMkh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 021B110E577
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760429639; x=1791965639;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uhKQlB3JEAjrpyuUXTzRfXqX+Endq39dwulzQ6onpTM=;
 b=DCAOyMkhe5SYRFQmUAyo16QgVMuPGKar1G2+RZXIQr/qrdqjaAmMRTly
 m2iQbkWkq7BiCAfWBhScBqk/eBY4DONQvlTqqsmx8Vj1jxc3DHVscXCP7
 70DDb9wm+1BTIKK7v5E68QeF1R6PpNHBptJ+3LPM6GBkoMUOzJXqUtpH3
 Sntkyi6r1LnPavFEV3C7FtUshC5YsSj/mdgHKKozlXD4LwHCfvktjQ1lW
 6HTqaCmOVqeXtLnb/ABEcI1o/bpmynLGAE10Evbr56KiR3dobiSpOjWHP
 H0gAua/cUyD4G8ft1iRqEXsynTh9jg1JBj9xma0m0SJGowVS8UUmEBRu/ w==;
X-CSE-ConnectionGUID: UM+8QRHtT/GQD7qVkolI8A==
X-CSE-MsgGUID: hFlDm9bHT3+sy2ROERY99w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62732969"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="62732969"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:13:59 -0700
X-CSE-ConnectionGUID: d/RSf5IGTCCmD0cZAqh8HA==
X-CSE-MsgGUID: huRSBK+AR2qmag5KTYg/VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="186919497"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 01:13:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:13:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 01:13:58 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 01:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+LI0+GWDAqb4xqCtgqYB4cGX0z/BxW4yNpY8ZH+apyVHKrWAg5QL5hOWyGOlgJx8c+Uxlr4enkUKdsY2+zqL9cWiDvjzzdPpqxvpzPUN779O8KU3SP/oKuonm23CO3HI93eD25oCZ0nMscodOnJzHhrMiie7vvTxLyE370jfnDq3mvAMFSB3yLQGXzz5D3XFEbuYXUNCWCWtkXUOGHIPjxV8OdrudgB669dDAjcvf9fCqG1aG0KdASpfj83MmKe1A5oYtT3Gn5vyvX/KT0aTffwwud7o6d2LbfvlUEKJmMgsBDKflmjCzW2L2q4+Its0XxV69RFinZWHDYOsw655A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjHqvu6StW6zmyCUsX7zESuFtomfdWz5IYA7mzanSC8=;
 b=FbZAGToSqJ5kpAmmGMVFH2zkv36JDJqxRhvxBEHonrw6H/zLDIRDxk4Xin6Xn4IV7iWNsFu1axtXp292FfLmdVTkQnpAf1B4vNVWLcAibpYt9CJMTXzXV9G2WcfsyHglpOS/5xLpxTlbKukvvh/gknTNKXBUF5O+N/QC3reVLkdjsNCFbi68Znkt3AUChJhgNydzdtc9CbSLRLhi5Z329mQBp118c/akdjaQOHe562D1xt3JpIB3naQov4kHzm9c1mROlEY2YrCTr0furidwIwVOyVlbkZCYOLg/TpwVOSvuKBqhVAVlFsfBiKS9zE/5F/pz3zuyF4f2xzhK4gnmoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 08:13:56 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 08:13:56 +0000
Message-ID: <85daf888-2470-462c-bd3b-1d52b678102b@intel.com>
Date: Tue, 14 Oct 2025 13:43:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/23] drm/xe/xe3p_xpc: Skip compression tuning on
 platforms without flatccs
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-21-bfb74f038215@intel.com>
 <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
Content-Language: en-US
In-Reply-To: <46abe5ec-3fff-4019-8af3-b273b9627f8c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::14) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|MN6PR11MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: b4587881-abc1-488d-eaa6-08de0af99eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1VXOHFmNHZTUzdPSTZuemNqUXpiUGJsNUwyem9zblI1a3pIQytJN2s5akFF?=
 =?utf-8?B?TEZhamNEUElydHlyZ1p4SDNxd2VzOUc5NkcreUhUbDh4L3c0ZGdNREsyank0?=
 =?utf-8?B?bDgxMG80elIzQzIyNWJsRnE2Sm9sb2JkOVpPc1drd2ZPRFRqRk9nN0hRbHdk?=
 =?utf-8?B?R1A5bjJjaFAwSGc0UkdhbXhJOWFCZlhaTS9naStVL1BoRExtSm50TFZKMTZS?=
 =?utf-8?B?bTZHbUhSV01ra1hGSU1uZzFlbFkzZi91ZTBvYzhZOW9INXd5cmJralFIci90?=
 =?utf-8?B?VkwwNElnZmNTS0NqcmF2ZjFkV0l5YmY1TGJRL3Z0bVNVMFhsUFY1eWIxbms4?=
 =?utf-8?B?aFZmUWhLdHJCSlNGVmNEMmFqSW5Scmg0VXk1ZitjdG43ZE92czhpL3RpdFhX?=
 =?utf-8?B?NWg4Q0kzZVhtckMwZXhkcjF4b0lJeHUvUHZISloyYzZkamFMSW45VXdVd3lD?=
 =?utf-8?B?L2pzRmYwTGVEUlFwNEN2UUJTdjdtV1k2N0Y0OEw1RlRDMmkxUXhibEVLQmtO?=
 =?utf-8?B?QVU2bnJHR2lJNGhMSXpaTGRJcFNUSFViU1lhdU16ODY0Q0ZNT1RlS29jUHNm?=
 =?utf-8?B?SmVPYklJTFI4K1RLWDBOSTFHdHJjblpMRlM4NnJmaFpudzJyVUgvbnZVK1Jj?=
 =?utf-8?B?QTRJU2t3RVUwWTlqL05QTFBoa1JRV1BQZmZjWlN3OHRlWGU4aGlleTIzM0lj?=
 =?utf-8?B?ZmpjaEcvMDNkeUlPWVFEODZDMTkvMEY3RlkzZWwwc3oyZGQ4TFlreDAyZ1Jr?=
 =?utf-8?B?MXBsK1NDaWJrdnBvaFR0M2FkWDB4M2tGQ1h6aG5HZk50RzJmS3BCZ1FqQkky?=
 =?utf-8?B?OGxpM3U0RVlHbGZ5U29wekxiak5aQXhqZmRhbUpYZTMxa21GUjJZVjFvM1Zv?=
 =?utf-8?B?SE9MNWFSYy9NTy90UWdSWWNRUDNWQ0pxL1FIc043dWxQcVdheENzWENjVmdS?=
 =?utf-8?B?ayszci9ZYW5JMCtzMDI4Njl6UnpGQ0dyeTdleWNCdU1ZRU1uY216MVc5TC9X?=
 =?utf-8?B?UVFuWC9lMlB4Z3BXblRCRFUxditTUzZNT0tlUzNLMUxrSU4za0Q2cEplVUhR?=
 =?utf-8?B?MHc3VnU4SlNKNXJmOE5CWXJITU1YNlhIa214R0pyYjI0Q0txTlllNi9DeHZi?=
 =?utf-8?B?RGRMQzBhby83VERGeGpvSlpkSU9LUitpNmx6cW9rSFZvVG0zQnBPT0FnSTFR?=
 =?utf-8?B?WnNPSDIrTUpWZ1diTjNTWWNaTnJGVklkT2Y2RVQwNEE0dExVUHhiQ0NqajBS?=
 =?utf-8?B?ZWZRKzhNeU5DV2lRSUNXVWtWUk84TnI5RXQrY0JMNGt6VzhKVVEzL0JrSXNs?=
 =?utf-8?B?Rm40M0VQcUZ1MkxHNlhuUTJWaXlGQThtZG9oTEpnSTBNRW5LRUJrQTViVTh5?=
 =?utf-8?B?QzFuYiswa29OUjhiY0g2L0k0OUpid0JTZEFyT1N1TEFtUGg2aWpTbmxaNVgv?=
 =?utf-8?B?aGg2eGlyZ1loOGo4YUp2R3M1VmVQVkhjMEw5UW1UVFpsQ2wvWUhYSlY2eHlO?=
 =?utf-8?B?TDY0ZVF4TFRsSTBlUFNtSlhoMDdWRU5uTzF0djRrNjdZcUkyTEw2bHBGeXJT?=
 =?utf-8?B?RDlNamMzY3pHaXBsUmFHYlp1MWtrSXFhYmVTNUJ3RDRNY2xYTFNNMmxDUmFO?=
 =?utf-8?B?TUpXellGTXhNY1o1T3dIaElxV1VnTjJVaU1oMDFIWlJVOWt2SXRZMXJTdmI4?=
 =?utf-8?B?YzcyWXFVQjU4dTlBbUUrd2VnVU9mQUM5Z2d0bExuSDdNMHhrL3RoZXNrbGZD?=
 =?utf-8?B?RXh3T1dsRmdFcVFyYVo4U0s2WVBNLy9qZ2pMc2dhYUFZb3laQmp4M1M1WlZt?=
 =?utf-8?B?cnV0UGM3NktJRUpaUENCQlFxYjVTbUplUFNhYTRxdkJqZ1lUTzFPT3dkQWts?=
 =?utf-8?B?ZDhtZ1d4YzQzTWVmeGlFMVZZSU9hRS9SVEdKZHh0M1RKbEJhZGtzd3EvMWJt?=
 =?utf-8?Q?hymMOdKRKxsKbaUhDmSXlY+0MVaJ8Ptx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWlhZm41ZEhnZGxaKzhqeXpnRmFSNklsL2tKRXhMYkpaRVFSTG15dWVXN3B2?=
 =?utf-8?B?dy9iOFZtNjI0dUt1dUNJdGYxSU1JSnF4QTlJL0FyVUFJQldzc2x4SlZFTjJz?=
 =?utf-8?B?aktYdXVIQVJGdTEwak51UXc2REpqWEN6a1FLN3R3K3cwMGlvRnpOSGZyaEpF?=
 =?utf-8?B?cFVvUWNLcGRtSHl5Z3c0SzQ0cXo5ZmxyMkNMMzBGV0RFYjYzcUVBWTc1ZFhD?=
 =?utf-8?B?dmVwcTVFVXJEdTNJNU1SYzROcmdiUStpNldTNjhPY0dmYit6WkpaUjZuSStI?=
 =?utf-8?B?NkdHcWJ4bTRFcCtQR3B6eUg0RVBXK3VhZ2JLWS9nR1NRYUdwRDJCUyt0ZnM3?=
 =?utf-8?B?NWgyUmJ6RG9yY1UycU9VRSs4QWl3aFJpd25PZ1VVdytMK0F0bDN6V1VXZjhr?=
 =?utf-8?B?Qy92azkrOFZVQytVd2haUEtOcjNwcTY3S2xjTVVNOEIvdWYyTkd4bFpSNVNY?=
 =?utf-8?B?bVFKZkx3bnRkZjNTMmFtMkgrMEFYOS93MFhtQnFHczBMcDV3eCs0UjFNdkVn?=
 =?utf-8?B?TStTWUxpa3ZhUFM0bVpsMzllaGFweDg1MU1zTlFhQ2pzRDdTSTlEa0FCenlq?=
 =?utf-8?B?Y1RMYTNaM2dDTW5qdzJEOGNEUmt1WWZLYWF2YUVpamo3M3loVjRTMEhwKzhK?=
 =?utf-8?B?TTJBRXdVVXNoSk04aklUUnFmVVZKZTFURUN4S0JhV3hYNnlPSUI4OWE2bnc5?=
 =?utf-8?B?M3V2djAzVkY2djFDZjgxUHBwai9LR3htdmdVT2lRWUJXZzdZakhUSlNmL3I5?=
 =?utf-8?B?SEhEMWsxcVloaWlsUzVGeVZTblBobnNWQVhpZjNKVDlNQXU0aWRWWmRYajEr?=
 =?utf-8?B?T0VOMHBucTB4aHBJcElrSkdhSW0rVzlwaGtyK2xOempnSlc3QmRuUTBEM1dl?=
 =?utf-8?B?SHR1VEhmdkt3eXpwSHErZ3RiTG9xWEUrRENzMldrQXdqVWpiUnFyOGNSbXhK?=
 =?utf-8?B?Sjc2RzlUTDIvcDNsemVKS0ZzcXpna0hDVEpNNnFYTzJUalJaVEF3ZENVL3lP?=
 =?utf-8?B?MWZYcFRmK1lQdXFJY0NGVlRNYU50ZlhRR2JBcGdYU2NnMEx5d0c4ejNhK2hB?=
 =?utf-8?B?Nlh2eEZ4UDFQc1JBUlRLUHBkRXBibzFNVmRjY1VmZGJzUEcvdnZ4UDBzU1JE?=
 =?utf-8?B?NE14ZWR0c25pMEZFZHh0Wk5HQmVuUXNHZFZkdzVtYStySG9iWWoyOEZDZkd5?=
 =?utf-8?B?MFdzalZWQ0xDSlZWbHc2V3FPVTZZTGtXZTBvUExsRzJVTkZtajFlcURMaGVE?=
 =?utf-8?B?aFlsZW1rUWRHdnVyQmU4WUFlVitTbVhaZ1lsemJFU21BT29wTVRwejg1U0tC?=
 =?utf-8?B?bXBFUUtDYS9Rb0FucmM0dlBLRzJPMTJYQ0kvSUpQV2JXSE05RlZYamk1RWFt?=
 =?utf-8?B?NWtjT0dtT3RrUVM0dHRnNlZGZGJ4ems0eVo4UG5FZW1aNjFQOE9XKzEvajVC?=
 =?utf-8?B?Um1HVlltK0pCOGphWm1kUTlUOTllZ1FHSWFia3crNzl4SmViOERLUFJwRFRy?=
 =?utf-8?B?SzE5VnBiT1V1clRDUXFLaHUwQlpzbjNRdWVoVmJyLzJOemo2YXd0RVRQeGhE?=
 =?utf-8?B?bkRoN3l2eXlrVnNhMk9TVWxiOTltRkhSWmhKZ2xOczRXb292dllYck56UXlD?=
 =?utf-8?B?aUdoNUVibldGamp1eTNoMzlsT2NGZjZTQ21adnBreTAxRzFwT0JyOUt5ckEy?=
 =?utf-8?B?U1BxOWNWTVJzd0t0V3d1Q1F2RFM3emV3NGFaTGRNZ3RTMUhEeEx3dW5kbTBU?=
 =?utf-8?B?ZHp5amhORlBKM1NVcHg0NTYxSytjSHpNd3BkYmc1TExJNm9PWUNNdmxldURX?=
 =?utf-8?B?emF1NjFpKzZWeU1YWFlZdS93cDhTY2g2aCtoRzRoaFVCL09ZT3pOVFgvZDBE?=
 =?utf-8?B?KzMrTXdRSzNKTlBtbGZkTnE2b1FHdHlJd01DU2xBdjJObkF1aGhRT2hOY0Rq?=
 =?utf-8?B?aDdZamZKNFk5Z3QvQXM4NFNrRnF0K21yZklJaVpQVVhJeDAya3FEMjltVXlH?=
 =?utf-8?B?LzUvSjZUY1pFQkNOMDJVUnJrc0haWE5IcEE0VmdiZDloTzJMWUFzNit6TExx?=
 =?utf-8?B?cFpkTTNFaW9nNnV0NHFRMnBzZVdJeGoyYmJqcmZxaDlUZ1ZmOG16M2JhTTNJ?=
 =?utf-8?B?OGtDQjcyYU1jYzg5R25NNjZxcnd1ay9IYVg0UDFrMStiZGtKdkhLS2ZqSGxj?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4587881-abc1-488d-eaa6-08de0af99eb5
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 08:13:56.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ETcitjGzH9mXTBYkww+o3yhNhmsltMSxJdSnndlEAjDrnPE1RhPTrgK/+zB3cP41A3F0HNj+gzB97bxMgeskW2ubWk//YT6YTp19u5NLIcs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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


On 10/14/2025 13:39, Shekhar Chauhan wrote:
>
> On 10/14/2025 8:54, Lucas De Marchi wrote:
>> From: Matt Roper <matthew.d.roper@intel.com>
>>
>> The compression overfetch tuning settings only apply to platforms that
>> support FlatCCS.  In Xe3p_XPC (and any future IPs that also lack
>> compression) some of the registers being adjusted by this tuning will
>> not exist or may have been repurposed for something else, so we should
>> take care not to try to program them.
>>
>> Note that our xe_rtp_match_has_flatccs() function will also return false
>> on platforms that do have FlatCCS in the hardware design, but have
>> compression manually disabled in the BIOS.  On such platforms the
>> registers still exist (and it would be fine to continue programming
>> them), but they would have no effect, so skipping that tuning is also
>> safe.
>>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> The patch in itself looks fine to me, but, the patch doesn't 
> specifically play only around Xe3p_XPC. Maybe we can move this patch 
> out of the current series, or if we wish to keep it here, can we 
> instead drop the xe3p_xpc from the prefix? Thoughts?

Forgot to add the name/signature here, apologies, and adding it now for 
future references/conversations,

-shekhar

>> ---
>>   drivers/gpu/drm/xe/xe_rtp.c    |  6 ++++++
>>   drivers/gpu/drm/xe/xe_rtp.h    | 10 ++++++++++
>>   drivers/gpu/drm/xe/xe_tuning.c |  9 ++++++---
>>   3 files changed, 22 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index b5f430d59f805..22a879270c1ec 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -376,3 +376,9 @@ bool 
>> xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
>>   {
>>       return xe_gt_has_discontiguous_dss_groups(gt);
>>   }
>> +
>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>> +                  const struct xe_hw_engine *hwe)
>> +{
>> +    return gt_to_xe(gt)->info.has_flat_ccs;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index ac12ddf6cde6d..92f0d16110dd5 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -483,4 +483,14 @@ bool xe_rtp_match_psmi_enabled(const struct 
>> xe_gt *gt,
>>   bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct 
>> xe_gt *gt,
>>                             const struct xe_hw_engine *hwe);
>>   +/**
>> + * xe_rtp_match_has_flat_ccs - Match when platform has FlatCCS 
>> compression
>> + * @gt: GT structure
>> + * @hwe: Engine instance
>> + *
>> + * Returns: true if platform has FlatCCS compression, false otherwise
>> + */
>> +bool xe_rtp_match_has_flat_ccs(const struct xe_gt *gt,
>> +                   const struct xe_hw_engine *hwe);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c 
>> b/drivers/gpu/drm/xe/xe_tuning.c
>> index fd58ea5e78bf6..7c140d8cb1e07 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -40,7 +40,8 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>                      REG_FIELD_PREP(L3_PWM_TIMER_INIT_VAL_MASK, 0x7f)))
>>       },
>>       { XE_RTP_NAME("Tuning: Compression Overfetch"),
>> -      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED),
>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>         XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>>                SET(CCCHKNREG1, L3CMPCTRL))
>>       },
>> @@ -58,12 +59,14 @@ static const struct xe_rtp_entry_sr gt_tunings[] = {
>>         XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3, COMPPWOVERFETCHEN))
>>       },
>>       { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>> -      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +      XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 
>> XE_RTP_END_VERSION_UNDEFINED),
>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>         XE_RTP_ACTIONS(SET(L3SQCREG2,
>>                    COMPMEMRD256BOVRFETCHEN))
>>       },
>>       { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media"),
>> -      XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 
>> XE_RTP_END_VERSION_UNDEFINED)),
>> +      XE_RTP_RULES(MEDIA_VERSION_RANGE(2000, 
>> XE_RTP_END_VERSION_UNDEFINED),
>> +               FUNC(xe_rtp_match_has_flat_ccs)),
>>         XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>>                    COMPMEMRD256BOVRFETCHEN))
>>       },
>>
