Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7ECA0EE6
	for <intel-xe@archiver.kernel.org>; Tue, 19 Aug 2025 18:55:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7F210E659;
	Tue, 19 Aug 2025 18:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K3U+r8WN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3099310E652
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Aug 2025 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755629758; x=1787165758;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mync/oZhhGZRcX4AnRc3h5GwtmYxcuX3DbD6+1tmAkM=;
 b=K3U+r8WNPYQFQ4cMe0zKh8UN6OTLO0f2VbyY6cR/LsD5npvWU3SbXJNz
 s8UovR80EMn8nTZmwmkOwDU6AFP+gGMTeH6cmf431uYaOFITvZcYx+NR3
 8bIg62vlOoJ3r8VFOigg7buarhdtJnJ0JifknsCpmYA3ZqSvf9jZzmidB
 5PevgGhSUekOSlTz3SdA+2hS2kqpp3/Dwui4ABoLDY36+4jCxBJ0CxgKZ
 YIG5/5eMBu1kpOQcPqJH6RMlQ/3MgL/lqY087DzZo3rKGD+xbeFyHLpab
 clCh4bQTIXEyAu6mLkaoBBnehGroYuFLadgIebgW4s66VwLt3op3r0dgp Q==;
X-CSE-ConnectionGUID: Embrpk5BRquoo+rypUlwjw==
X-CSE-MsgGUID: f7+uRsyFS7OFOh0LcdQG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58035718"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58035718"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:55:58 -0700
X-CSE-ConnectionGUID: dpFFy4FsT6+XzU/Y7mUhQg==
X-CSE-MsgGUID: vdZpMOQzQdesbbvGzCJ6KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="173287334"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 11:55:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 11:55:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 19 Aug 2025 11:55:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 19 Aug 2025 11:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWMyMTVBudK3sCaSZozmZNmcQzxuMWufHFm39h1ujV/3UOfkaabzFwMIHCT4ouO2AywLIFfi/RARgEe5ENqA7bbH5RDqg/QH+pUdHON76C/JS452/X/3RLdtoIGY/SNvh/P8xyrfVLut6o0RtzWaQwdoUETyYiAxgquoGQue1OGwgCL9Z8rCGBHcm0/HVCOdLcO4VUKCtOkLUvt4Qycc7WW2HLtrH8JTXUYT0wK1UhNR6eht1I47n+fXxEcthP8jM9N9KCUddUCsRbE2MVKDPv8eiA+wJnsyCxnSB4IGL6s6tlMn+xoZucxQqOPjSpvZ2NZ78maVXq0fDoRN8xicXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSaFq+3+hyYpM03D/o5fwTQ4e/WEIKGQqO8Jil5Hs20=;
 b=oT6l0Hd6023QAQE5y6Smbki2TBL5K65VqrjmV35outZTDm4DnLmbpgny3imsedf+xyJePexj1djWViXo6KDtV5xN/AgkNzsdrnmISNdPDP++wCYCIF8SwmYEOEwE4FW7wwW9+3I9JRqf5LOtzBR5+2vt3KarqXNgBc0OZ76nNyu15xI+jVq7P0YXYZSNKmW8C8QQk2yiB+CKCQCXn5WxMY3sUxrpukwBJCzK1nPCA1CjjP5wq6UUUXlgCaMN80YkoOzSZNVV4/ThK1AVMiXrgaxgNw5fmNtR3QM7wPjU/FL2SE+Cci+/4YC9k4Ufv/10pk9r34jm2+3Q7KefWH7I3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e) by DS0PR11MB8667.namprd11.prod.outlook.com
 (2603:10b6:8:1b3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 18:55:55 +0000
Received: from SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a]) by SJ5PPF89507EDE4.namprd11.prod.outlook.com
 ([fe80::d66a:6830:d9af:740a%6]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 18:55:55 +0000
Date: Tue, 19 Aug 2025 11:55:53 -0700
From: Matt Atwood <matthew.s.atwood@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/xe2hpg: Add Wa_18041344222 for Xe2_HPG
Message-ID: <aKTIuYJj6MNhaOaG@msatwood-mobl>
References: <306e119c48afa00957bfa16b326bbe6882d10779.1755110252.git.harish.chegondi@intel.com>
 <8002275b1375cc0483249abb4af0155f6d66c986.1755110252.git.harish.chegondi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8002275b1375cc0483249abb4af0155f6d66c986.1755110252.git.harish.chegondi@intel.com>
X-ClientProxiedBy: MW4PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:303:dc::27) To SJ5PPF89507EDE4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF89507EDE4:EE_|DS0PR11MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: bf7cd4f1-9fd7-4001-fa33-08dddf520709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUwrRHdWaStyeVRuc2wxMVRNb21ROUxnai9rSUZ6MHVPdFNlbHAxZU51b0dV?=
 =?utf-8?B?VzE2NDYyTm5jN29zSkJZN2QvcHl0SUh3UlF5alNNMlFXZXgvTHhzTkNnaHVH?=
 =?utf-8?B?eDVlT0tXMXg4Q3d6ZlFoWGM4Q2s3M0dMbm5vbDIwL3gxWlJhanR3K1NNMWJj?=
 =?utf-8?B?WGRpSWRDTWxxMXppTVF2YjVGMjVaNk1QQStyMDJyb3FidXIzMk1JbFlvNWQ3?=
 =?utf-8?B?UzBKWDI4cDFXZ3JJMHhwU05KdEYxQ25lL3l3VGxUSFVJR2NydjFNTFJRUEZq?=
 =?utf-8?B?eVp4d2ZNTERUNkR0eUhMNUYvTEEyQmI4VGk5WWZCRTVEelRFSmtPczRSa2o1?=
 =?utf-8?B?bXg1dW5QWTJ3bms4dWVQLy8vK3hLUGlGZ0NNeWhkNEVvWkdsekZneVhGZTk4?=
 =?utf-8?B?K01idHVpclZQQXVCa05QME96RUpsZDV5K2xtM2sxUTNLNWxQeTdmUjJydTF6?=
 =?utf-8?B?dzYwblhsZ1NoeUlqbHpudVJ0SzAvQ0pZdUp6ejFQQ0ZBb0F3My9oZzN6eXI1?=
 =?utf-8?B?NmtpZ0VCenNiMmRqbVpXbWlNb0k0SWpmSTZXbnpHT01FUEZhMDM1c2piQ0V5?=
 =?utf-8?B?U0tvY2Z3dzFsaTRqQ05yZXRFSTF0NzJwcCt4MVRwVjFwdDg2b0R3RnIwTmZ2?=
 =?utf-8?B?clJsa3gwNlZ2YzRtV3NjQmJWcFpOclJBMG5PVE10RjB4eDFtUDJwa1UzUmV2?=
 =?utf-8?B?eTdtcTdBVXNOekVJZ2dtRHZ5OHlMTTdBRS92RFNrdGlFMEYxRnVVVit5YU1G?=
 =?utf-8?B?aW02ZGdFdTdvL2VKa242SDRkRmtmWnMyV0FFaVV3VE04M2ZuLzRPbkxFSTNx?=
 =?utf-8?B?V3F5emo5Mmc3VmhPVUo0ckFqUi8vdmoxNG5RV3ExWmVjaCtJc3dDNHlQeEhZ?=
 =?utf-8?B?aVR6UUMrc08wVllEQW40azc2ZFhMd2xUUmdjcW03UW1BOEd6cHUzV0p6dmg3?=
 =?utf-8?B?aG1neHd3TmY0WlJsN3VISmZyTFJseHZVUER1cy90R0hwb1dOODk1WlU5Qi9i?=
 =?utf-8?B?aWpNQU96S09sa2MvUnRkVStBaFRaaG1pRzVXOE9uSDVvelJDV3crcDB4VVBR?=
 =?utf-8?B?WmNwczhRNnNaSnpxTm1lSTA0Y2tsNERKWnRsVjZQWVFZRkt5NWtteUJmK05n?=
 =?utf-8?B?L0IvRGpyWFFWWU0xOWIySXdsNDM2dmtYVWVIcFI3QjJYR0poT201d2laYnJJ?=
 =?utf-8?B?YWdTS0hYUlN3RTc4cjhLTXRKVmdiNFh6SVhqTXJUMTcyQU5FakFPY3ZvcXJv?=
 =?utf-8?B?eTNJemtyeXJ6NU8xbVV3WEZpbmg4NzdMZk9qRHlYdUk2RjhnejJVQTlmRG5F?=
 =?utf-8?B?akF0VkJBWFNmRDFLMjN6YnhoTVNwb2MyNjdxNFlqZlhRSGtXNnU1QlFRQkdJ?=
 =?utf-8?B?RmpRZWp4OHJjU2R6L3Z5MmVOT1RqOHkyS1kwaUpidmpOZkk0VmFuZVR2TURJ?=
 =?utf-8?B?dEtPb1RzQlpZRUpXZnRvVStKUzVrdWpkalRDUEJPVVhEZVR6c09TeUtieGd3?=
 =?utf-8?B?b2lVd1N5aWptcFFEVkZaVmwzNDl0Ui9KOUxiRHVTYWlIcWtFMTFQelY2WVll?=
 =?utf-8?B?YmhLTmUrYkNtT3crR2p6dnNudTJjZGtHdzJqQUcwd0pTNmZQV1pkWUFoL0Nx?=
 =?utf-8?B?bmMwdkpMcTQ4ZW5FUmVycWg4Mm1PYzhvWWRjM3E1UjBNVDJ6ZDJQMjBpalo3?=
 =?utf-8?B?bk84RnpTQ1lBV1YvcFVDVmdVYWh6cWUyajJOV0FydG5MWUxNM0NRS2ptQ2hK?=
 =?utf-8?B?NExhOTZjTWwzaGM1SWwrMmhpZ2RBbGJmV0xJUHMxcFl2N2VKaXUvcHhTLzZq?=
 =?utf-8?B?M29XUXQ4YmRvMG5FK2ZwQnN3TGFaZWxnc3MyU1NFTHZkeng4Zk5EUjdRRTln?=
 =?utf-8?B?YkZQZ1BkZUxrTU5sdlJwQzB3d2FWUEYyOExPQi9Pazg4Z0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF89507EDE4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEpUQTJoQVBFT0k3WCs5dlV4ZHNrRDIrZjdnZmdoWlV5YkpzMnp5R2RhQkx5?=
 =?utf-8?B?akhJUHdpaFdVTFoybFN3WXlpTjJuZUlONkowYVFpUC9mN2xGNEJ2QmV6dDVN?=
 =?utf-8?B?T0I2VjUwRmFkUWhaLzlvbVRlaDV2Ti9HKy9TNmhoeTZUWGRvczBnUFNZZElI?=
 =?utf-8?B?NnBCcGk4cUVoMUNQNXZrZkpRVnFyRE9nMDJoRU5kUitHZ3FHNHhtVDJzSUU5?=
 =?utf-8?B?VFoyMXRPK00rTnJ5WXBKWWpHbGk2RllBUGdPY3VzZ29YSThJU0ZONFI4NTk5?=
 =?utf-8?B?YnVuS1lCVTJLWldjQW9aVmp6V1hQanByUEU0VmJFcUdqQ0NoelVsV20vQm9G?=
 =?utf-8?B?Y0loUkRNTlFZcVoxTnR6NDN6R05EVFl1MEVzMTI5Nit3eEVDbXMxUVd4YWM4?=
 =?utf-8?B?dmpOWDBOSUNHeDNUUlZ3SmRtcW9ySGZqSkVpbE9zZllLbGxaek5yd2Nrdkc0?=
 =?utf-8?B?cFZLbE54elZ1WGtKQWxPV3lZblkzaUhZUVZkTkt2VlhXenY1c0toa0x0V3J1?=
 =?utf-8?B?MU5nMUtoUG9YNUMrWGQzSUtlSXphaXdDK0tTS3JMY3BwZ3pGYnMrMUV6RlRv?=
 =?utf-8?B?NGNkSzBxTVFUeXpVNmxJbFp3OWhHcUhORDZZUXBtNE9wMFp0Y0grOHVEcm1O?=
 =?utf-8?B?VWdzK2VoY29uMlQ5RTl1aExEMDVENXVDSGJMU0l4czE3UzNZTkhYMCs5NFAv?=
 =?utf-8?B?VHM3a2JmcmhQeGx4VjVWSnZ2eENVc0dOZDNjT2YxbU5sUThkelZVN3A2QXlT?=
 =?utf-8?B?bFgxbk0yd0VYeGFMTGRkRmZzeEFGTjZsY0F3SnJ2bkZidWlkT3B4SXIzWW5Z?=
 =?utf-8?B?QTJKU09MaWszTE8xb2RTaFU4M1BaVk5nWWplOURVTExaOWQ4T2hISWMzNkFh?=
 =?utf-8?B?dDA2c0pOWjJ6cGV5aFRoUyt1c2xWSExXMXN2YnI5YTlYMkF1QlNBbzBIamZJ?=
 =?utf-8?B?RUkrcEJ3NWdMMk9RN3hjZEx1L0M5NWh0M0tnbHZxdjNTdHRxY01oTG5PWjEr?=
 =?utf-8?B?aG1zRGRVUTcyUG1rSFVlcnhjUm9NUW9GWldPZmFxWnZjemtXRHhmMFQ1ZWZF?=
 =?utf-8?B?OFBpS2t0dHplY2lrLzAwOVVHYUlKK01XcUZQWXl4cko4RzRlS3RySVhPR0tL?=
 =?utf-8?B?WkR5ZDBSSkc4V2NJZmlvbUM5Mk0ycGhTTXdWajRoZS80c3ZhRHNlaWdnbzJu?=
 =?utf-8?B?ZHdJVGlxWlRMVzhuQVZrbzBlbU95eThjYVlMWEU1ZG1CR3RxUzhwRjJlMCt6?=
 =?utf-8?B?RVpFRHhERjFLQk5aZWcyZDdDUEFVUG9EWkNMT3prM0ZkbHhrSFVyQWNkY0dz?=
 =?utf-8?B?VUFCZXQwa25ZSG9FcUtjd3ZYNG10c0g0ZVhpZ3dSaWxjNFpMUHorblV5RjNU?=
 =?utf-8?B?WC9YZ3I5bEFXQkt0ZlRzOG51Z0tLRlZLVXZFOEQ1V2lESjZVSnNkZkpiZE9O?=
 =?utf-8?B?ZFE4RVlCNHFadFlTZ3lJRVFyRkE3dm82SFdaOEN3TUhPNmZSMGZrOG9PTy9M?=
 =?utf-8?B?bTloZk01T2lnalJ2c0ZMUGhqeDV2RkY0d1ZlMVUzU3BaSVRtWjNSK2g2aEYz?=
 =?utf-8?B?blhRTWlKNTh3c1IzVThJUTIvUDllN0kvLy9rS09RQ1d0U1hib3NnNE5vV0hB?=
 =?utf-8?B?RDlQaURNb0VGN0tKZ0pkelc3S04vancwbUNRbElBYitvY0F5ZUl2K0dCeElS?=
 =?utf-8?B?WTFEblpDWitqMnloQmR5VTR4RmJHZ09yWXFJTERScjFpNThoSldlNWVXNEcw?=
 =?utf-8?B?TWlmUHB3S2NZTCtPNjR1dHZ4SXBxazgwOENaZ2VhbmxRSjNiQjk0di9NVmtY?=
 =?utf-8?B?MDlFTG1ueW44M3NGY09YYkRhZnlablV4UXpWR0gxandTVExDRTZ0THlyckta?=
 =?utf-8?B?TUx0dXdTcVZKU0N4d1BUMnc1eExzRmlZRHd4U1BoRms3M245RXhCdUZyNU5y?=
 =?utf-8?B?RFRIRGxUbXVXdUxhbHd6bEFhNzVPeG5hbEVKN05TSjEyMHRvUTNrYmtBcU9z?=
 =?utf-8?B?OCtRUno3MDgrZnIrbU5WV2NTWFZSRXl6Ty9TMDluaXMzQ0xmcXVWUkVVelhL?=
 =?utf-8?B?bmRLUHZ3S1dxcGtTenVTaU9XanZNOVRLMXdQQVNxbHpqK25iVkdiaVBjeWEv?=
 =?utf-8?B?RklQcXdhUm1IWFJlRytCa1AwVUZPQ1BlNTB0ZmtMOG1JVmRRTWJNTEk0Y3ZW?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7cd4f1-9fd7-4001-fa33-08dddf520709
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF89507EDE4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 18:55:55.6763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nir8iLT7/yJTAUmMIc+uirkBZ/jpfVVvywi+r+0sBTCjmEoYwzOVLEmiUbUNwZFK1WvOLkTHhyvbzNsx3c+6wkpOFDTOVGGGxC91rhXh4A4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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

On Wed, Aug 13, 2025 at 11:38:43AM -0700, Harish Chegondi wrote:
> Add Wa_18041344222 for Xe2_HPG that requires disabling
> the perf mode for subslice count for eustall sampling
> when the enabled slices are discontiguous.
> 
please add bspec references.
Bspec: 79472, 56024
> Cc: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
with the changes above
Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>

> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  1 +
>  drivers/gpu/drm/xe/xe_gt_topology.c  | 17 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_topology.h  |  1 +
>  drivers/gpu/drm/xe/xe_rtp.c          |  6 ++++++
>  drivers/gpu/drm/xe/xe_rtp.h          |  2 ++
>  drivers/gpu/drm/xe/xe_wa.c           |  6 ++++++
>  6 files changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index f96b2e2b3064..06cb6b02ec64 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -522,6 +522,7 @@
>  
>  #define TDL_CHICKEN				XE_REG_MCR(0xe5f4, XE_REG_OPTION_MASKED)
>  #define   QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE	REG_BIT(12)
> +#define   EUSTALL_PERF_SAMPLING_DISABLE		REG_BIT(5)
>  
>  #define LSC_CHICKEN_BIT_0			XE_REG_MCR(0xe7c8)
>  #define   DISABLE_D8_D16_COASLESCE		REG_BIT(30)
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.c b/drivers/gpu/drm/xe/xe_gt_topology.c
> index a0baa560dd71..0ed7dc9044a5 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.c
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.c
> @@ -12,6 +12,7 @@
>  #include "regs/xe_gt_regs.h"
>  #include "xe_assert.h"
>  #include "xe_gt.h"
> +#include "xe_gt_mcr.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
>  #include "xe_wa.h"
> @@ -328,3 +329,19 @@ bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss)
>  {
>  	return test_bit(dss, gt->fuse_topo.c_dss_mask);
>  }
> +
> +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt)
> +{
> +	unsigned int xecore;
> +	int last_group = -1;
> +	u16 group, instance;
> +
> +	for_each_dss_steering(xecore, gt, group, instance) {
> +		if (last_group != group) {
> +			if (group - last_group > 1)
> +				return true;
> +			last_group = group;
> +		}
> +	}
> +	return false;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_topology.h b/drivers/gpu/drm/xe/xe_gt_topology.h
> index c8140704ad4c..fd08b382e259 100644
> --- a/drivers/gpu/drm/xe/xe_gt_topology.h
> +++ b/drivers/gpu/drm/xe/xe_gt_topology.h
> @@ -47,4 +47,5 @@ xe_gt_topology_has_dss_in_quadrant(struct xe_gt *gt, int quad);
>  bool xe_gt_has_geometry_dss(struct xe_gt *gt, unsigned int dss);
>  bool xe_gt_has_compute_dss(struct xe_gt *gt, unsigned int dss);
>  
> +bool xe_gt_has_discontiguous_dss_groups(const struct xe_gt *gt);
>  #endif /* _XE_GT_TOPOLOGY_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 95571b87aa73..04400b4889fb 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -363,3 +363,9 @@ bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>  {
>  	return !IS_SRIOV_VF(gt_to_xe(gt));
>  }
> +
> +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> +						  const struct xe_hw_engine *hwe)
> +{
> +	return xe_gt_has_discontiguous_dss_groups(gt);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> index 5ed6c14b9ae3..6acd1b1819d0 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.h
> +++ b/drivers/gpu/drm/xe/xe_rtp.h
> @@ -477,4 +477,6 @@ bool xe_rtp_match_first_render_or_compute(const struct xe_gt *gt,
>  bool xe_rtp_match_not_sriov_vf(const struct xe_gt *gt,
>  			       const struct xe_hw_engine *hwe);
>  
> +bool xe_rtp_match_gt_has_discontiguous_dss_groups(const struct xe_gt *gt,
> +						  const struct xe_hw_engine *hwe);
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 52c7df4c3afd..523973916a09 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -612,6 +612,12 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>  	},
> +	{ XE_RTP_NAME("18041344222"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> +		       FUNC(xe_rtp_match_first_render_or_compute),
> +		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
> +	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
> +	},
>  
>  	/* Xe2_LPM */
>  
> -- 
> 2.48.1
> 
