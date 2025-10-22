Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456F5CCF9E0
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 12:28:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043B710E768;
	Wed, 22 Oct 2025 12:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BlmX27F1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A9710E768
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761136094; x=1792672094;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=eyVkeL7psEKNw8U8Fpb1TKeNurwU9pOTQJoqSRsOjTU=;
 b=BlmX27F1mACaKJR5UoZieo9i9YHmHFr3OPGDtBRr4uejP3DAOfRXepfN
 FCHJTkW9xMms40db/qO2H8zkwlkzYoRUZub63xAIrwz7U6JjW2SjwMR8f
 Nwo5YnUfxWN6gfPS4dyZ2ue9+Z1RTGgg4fDbANS7DZqroLCUfLrTxMOKO
 OIpLAmW40ODTF3qvNvniWOue/2PsxhYvwTQUaA/kRFWJBqHLWFUJdTl4T
 yKJz/bJyUu7fAc5mNcQA31AZl6Zokbp0zL1WPIOHyD53JqyVrA9ymcp5K
 T7D7L+IZFBhFElR58Z1NQyRm/lCxW4hLGalHamu8buDZIghfJ5HsnrPQE w==;
X-CSE-ConnectionGUID: fcEx06cdRECc1DK4uPEiog==
X-CSE-MsgGUID: bsyk2l5bS/SH3QrOz31Rzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74626388"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208,217";a="74626388"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:28:13 -0700
X-CSE-ConnectionGUID: vTtJ9vuKQPulZPuNi58tuQ==
X-CSE-MsgGUID: t2C8bkrHSoOPjlxLGavyfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
 d="scan'208,217";a="183905324"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 05:28:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:28:12 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 05:28:12 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 05:28:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0Ktvn+omwGpIJTyq/CN1YyEFxV3mAN7wvZeAF0krySCLC2tXX9Jnuw0vPWwiIK6KJP9GHHv4vDjmMBDPoy5IoWDfD79n9kmN0aGohSr0fTSY5U1W50AScgOAkXxgSvzq+aDPiAUc0W0l9+FJxq8mdMMd8+N2McNXOjAMCTRslNKrl84I+QPk3gvdfId2wKo4Oce05GuhzhKjkoTDR01GrUKFDlZwauY3QVrWV6uV2cOl+/lIzs+64Idd6pLBJ/yiPY1q6YvIsdMCoXiCD1hbAqzOHH+OQTlE9kyVhZvkJSGJk1m2ZXprTIFhj0Yv9QLHFkDuVbfXCoFq4PloKAl0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRHWU4viNI8A3M2QaztVYnabACvv9rc5OhnahIIuVYw=;
 b=dMorLEX9cpXKwzrVUK20NMElTgiVVdu8siWo8svi0NkXTiNt2kcuv6Khvh2GShMeS1hAZ08mhwAA+pnhEScBYGtHPfj3+sGYbRWkyQJxtC4ZukKAmrDGvm/M0b82hcvDUKBEsSS8tCvxt7zo2Zotlaru5UE/Trcg+WVeOdvQ0nPul1WXpG6S7LlO1P3w/kQFPRtbnZaq2MpUGaLZRBNJcsBpk3tPy/H5gNNRC4QtFiqcHXTpzvQA3nCDmvzh+kngm4pNPgGG8q1qgR1d5FQl4ODSoA1ONipfAbF/e1UeYJ6DPtyI/IOT6oWLWz5cZLw5glXe9IwOwAnmy2G9cVPtpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Wed, 22 Oct
 2025 12:28:08 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 12:28:08 +0000
Content-Type: multipart/alternative;
 boundary="------------ofx5x0tpHQkHBPHWczhCEUmq"
Message-ID: <cd63843b-3eb8-4bf4-9a77-dff7d9321e06@intel.com>
Date: Wed, 22 Oct 2025 17:58:03 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc?=
 =?UTF-8?Q?=3A_Eliminate_RPe_caching_for_SLPC_parameter_handling_=28rev3=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251016092536.1918086-2-sk.anirban@intel.com>
 <176067641152.24656.11350417770914321658@97596180aaec>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <176067641152.24656.11350417770914321658@97596180aaec>
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: d430af9d-25e9-4aa8-5289-08de116674d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0o0RHUvd0FzbDJqdE93SmpOanFZSFNwZWtTZHc2L0k3QkErUTVmR2NLQmV5?=
 =?utf-8?B?M2krZmQ2ajFqRkgwWHU1TnppOTc5eXl2VFdEdHBza0E5N0syanNSUThFdW9v?=
 =?utf-8?B?ejF3MjNkSk5QVVIrZnluUGplellhMFhzaHAwRzZkSi9Tb0ZFclExYW5PVW9m?=
 =?utf-8?B?OHhjLzRkeDJKZGxXc1FBc0Ezb2JLV2JYQ25OOWxneTIwVERIOUxFU3V3UEgr?=
 =?utf-8?B?bU1vb2orZStuLzQycEw3SGFqZVV2RFMvcDBZZm05V2Jmb3k0TUFHN0xqRlI1?=
 =?utf-8?B?ZmQwc05MR0dtSkdTbWludUliaWpIdHk3MWxmRndwQmVPbGx5aVZqUW9XZS9O?=
 =?utf-8?B?R3U3STYxQU11bjBUUzBRekNXaGxDQndRYU1vMXJkVG1uY2QxQzByT0svUzFR?=
 =?utf-8?B?OU5CZDdrdjkwR0YvVFA5aXB0QUpBQnJUTFBOZ0ZkRFNqTjFka1UwRzdsNWpN?=
 =?utf-8?B?T3RlQ2VtRlYrc3RFaEN1WTBaV1l6d1EvMkdRcEVWQnVJN0poQVR2SFVyL3Rp?=
 =?utf-8?B?UndFc0o3MWRIR01DbE05dWVad1NvZEYxOHc5WmdHSnVBSDlWM1prTDB6VUlX?=
 =?utf-8?B?bTJtczRvMkhFWFZoMi9QREltV3JpUFo1dEt6eEZHZEdjQmQ5WmdGQnJjU3Vu?=
 =?utf-8?B?SDBpR3cyK2JHTFFKalpFSVV4OVBxYU9UWlJqRTNXLzFscGVYRU5lNkp5SEZH?=
 =?utf-8?B?S1FOZkoraUFGa1ovWlY5dDRkSHhvQ29qVHl4L3dOWU55bGpyZkYwQzNhTmpu?=
 =?utf-8?B?YkRxVXVFUkhka2NvcUk4QWlONDBXeXp6QUpZZXlyc1pnckJ2TUpvSHBwUHlZ?=
 =?utf-8?B?UWlKOVNSU2s4VEZ4T245c2FraCtPUGJyNWlhTDNpeEtjOWxoS2FUYXZocjhQ?=
 =?utf-8?B?QUJFang1QUl5bGRiem9LcHJDb0p5cUFvb3k3cFdtcUdJUms5STN6RWtHQnpV?=
 =?utf-8?B?cUduRVJBVjREUVdselhWc2Q3S0hmWHozVFNUblNjS0tZK2w0aHEzYTU2dWdQ?=
 =?utf-8?B?NDlmNnM5UEFTb3ZNeGdhZmdPYmgwdEN4THMrNEprbFRyRitpUkFEejcvMzVG?=
 =?utf-8?B?ZkRIb24yekFDZm4vVG1LZlFIUU9GODdxVnZzOGU2RlRiRlR0WDZZTVdCNXAv?=
 =?utf-8?B?SVhQWDRtZGdRWmxIM293SkkxbVZrZUtlUUlubldBc3R1V1cwWnJuanB4amVh?=
 =?utf-8?B?Q1NwUzRGcUpWMGx4cmdrOFlWUGZSQTB4eU5pSmk5dHNPOFpna1laSVo5b2Rw?=
 =?utf-8?B?bE5oQlRZa3RSeGxNTEowY0Ewc0RyQTlCRmFsZE43Q3huS2kxQlNFazlXRTB4?=
 =?utf-8?B?TmJtZFJqY1AvbUhzbkl5TkRheUFqVmtEZjRabGZwYVZ6SW1pWGRMV2g1d0tR?=
 =?utf-8?B?ZHBnbXBEMVpReTJUZlVmUnl2VlFIcUFVdnRGdG9YQnR0ZDRPOFRzM1luS3pr?=
 =?utf-8?B?VCtTREFiUyt5NlhPYXUwNStsT3g0czV0b0lmcHkwaTVKNmpBUWxvZlhyKytT?=
 =?utf-8?B?c1JkL2c4cFBIbmZxdk9aait1a1psKy9GendNbXBiZVlsRFAxcVBOdS9uL2Vy?=
 =?utf-8?B?SEk4Smc2TUhQMlh6SmFNMFh1cUVFajRmZjRLZVlWd3hXTVJIbjRrRytrMnhJ?=
 =?utf-8?B?VHVIb0tVOENBM0dyaGNERjE1cjRvT0N3c1FEak1nM0xHdmFyVmZjMFB1eGtq?=
 =?utf-8?B?RFZ1a0FiUk8wS0ZzSytSMEVJZWxYb1JhQ1lQUnJYWlZydUxmL04xclFQbXVL?=
 =?utf-8?B?bisrWHF3ZTlxL0RROFBFenJ4ckhlbS9lS0ZISmU0WmQ1SXdrM08rWC9pODJN?=
 =?utf-8?B?V2ZWTGQ5OTFmZWwraldvSnJ2NTI0Vi9nd3BNZG9KaWJScjNidndVbFloeFV5?=
 =?utf-8?B?VVAvcmJMelptMUZ4UTBiSDdDVmZ1eTdNMG02Q3pYOWJnL3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFHcVM3Tkg0RExiYXRvMnNYcHo2czZJYmRMNTFLTmJCdEgyUi9vN2xNSml0?=
 =?utf-8?B?Z3d6bUhPRzA4UzJmWXlzNDd6VFBXdHI0K2RiU1dhWGc0NkFKVmcydURqcEJ5?=
 =?utf-8?B?WWh2d0JEbkVMR2hvaG9GSEI3SERwTzExNHpONzlrdUVuaU5XT2djRUhlQUZ0?=
 =?utf-8?B?WUwzME9pTWhPQkNEQ3VJOEkwUmdGZnlhTVJuWkQxVkFqU01wc1ZVd2k4dnlw?=
 =?utf-8?B?MWd6aU1qSUhZMnVWMFlxMDBBeGZaYXlHYkF0RklVazQzQUxKMzE2dndwQjNX?=
 =?utf-8?B?Q0lNc3lJazUxVyt1K1pGWkw3MzdkWW5ENDNJUEZXdWhQZy9HTVJySGNiWW5w?=
 =?utf-8?B?d0E1YlRwbmVlbW9BOThRV3l4S1JFTGZyL2VWSStwUjhzZVFCOUFEb3ozN0Mw?=
 =?utf-8?B?VFQyRnFGcmlQNWFQNGRmT3RRNEFDbnpRQU5ZdzFkUnFWcjNDRmFKN1Z2bmcx?=
 =?utf-8?B?VWZlN2U1cXNmamNVbktXNE8wcUJJbDcvZmdaNHhURFBQSEZ2bUNCVGRGWEVX?=
 =?utf-8?B?cytDNzJ0MUVTM3JpTUh6RGR4bW5CSGNTSzZjQnVVallaU3lzS0VBTXJZalV5?=
 =?utf-8?B?SGlBbTQwKzRYT2h6WXhxSGIrcVJmMUZrSDlxTWNUSlk2aDNzVko3ZDd4NTR1?=
 =?utf-8?B?VzRKSFB4VDRkR2U4VHVRbnUrOHdqZFpmMGo4b1pmQjJNZXZrTFhSRmhPTlZh?=
 =?utf-8?B?UEt6cFNlOHErUVZZcGl4NlB6VVkvL3p6OXN2Z3I1Y09ROSs5aWpJRlBEcUF0?=
 =?utf-8?B?b0s2ckJWQ2tkUkMyNFZPc2ZZMlBFT3lOU2FyU0QrNlBMcTB0UWxMNzB2L3Fw?=
 =?utf-8?B?NmFjSFhmUTg2dlVFbHJ4UCs4VGF2OEdYS0FjaGIweUhUZS9jU0poMXk1V2c2?=
 =?utf-8?B?S1ZMcVlMYmJyQlBDeFFzRVJZSk81R0RtNUdTblp4S3BxWGNDcCtPQTh0aXBp?=
 =?utf-8?B?ZFBTQlVzKzk2TTdFQmh3Qy9TYUhocG00VVhHZlZ5YmxiV1l0ZDRNYWhYb1ph?=
 =?utf-8?B?N3VUNUd3K2pyVC9XL3k2cjdEOFpiMk5KenczWThDd25CS0pJY0Z4ZUVXME5p?=
 =?utf-8?B?M1FKV1lIK00ra1NHckhwUkhnb2NPaXJHbVlIRFd5NFZJdit1Tm1rV1N3SEor?=
 =?utf-8?B?MEZpWDNIM2FUdytxbjIra2NSR1JGL1kwVzAwcGdsOGdjd29yV2JwYjFCQVJJ?=
 =?utf-8?B?ejFJbmpUdit0VUtQVGZQUG14aVJwTk51bDRKVlp6dnpCaVZMMmt1M3BzRjdJ?=
 =?utf-8?B?Q040eDhtbnV6SW1teStVM0hzL3dtcFVxbHJIRXhJVjNQZEZOcW5FazZ3YzRG?=
 =?utf-8?B?YVNVWkx2UlYxYklrT2ZHZTEyMEtFR2xONGNJM2wrc3Y5UnArWTVKYVdVaGxY?=
 =?utf-8?B?am5sVlpJNUc5Qm5RZFlpL25SSDdCR0NIKzBHTHluSUVJTllUSVI2TXlCaXJN?=
 =?utf-8?B?RTUrL1hMazZuVC9sVXpTd3NXTXl1SmJYbjRLUFlpampmVlZOK0xJaGZoSjUx?=
 =?utf-8?B?NFRUQ1drd2V2Y1ZRNDNpY0doTUFrY2h2ZnJvK1l5TWRyeDh2R0lCMVBZTWVW?=
 =?utf-8?B?RVlmcWtDUDBpV0c3VjJkc0JSb0F6Ny9qQ2c5TkJyVlJ2cmxzakMzTGQ4Mnh4?=
 =?utf-8?B?YmlvSWZxL21Da3k4Ty81V3JKMktlTzRFZnZSdjZrL3lUaFpIcVc3SFdpaWs1?=
 =?utf-8?B?UmhMek45OUNPZHVOdDdVZlZwSC9MUmlFb2d4cWVvL0YwN09kSlhjdVN5c1M3?=
 =?utf-8?B?NkxZR3FsSm8zbXZ6ZktYVTFTbU84Qm9vOE91ZDdkblVlc1p4SGJJaXJqSlU1?=
 =?utf-8?B?Q0VFdjdZTS9wUWdBempvaUdOZzZQWnhFYnIxeFpQVjNuTGZRd0pFV3Q3K2ky?=
 =?utf-8?B?NHJwWEFHb1AvekJScTd0RlZ0dnBKc2V3UU41dUhMN0Y3TUZqODh5YWlTSW02?=
 =?utf-8?B?bStxV01BYlB1VlF4aEVVWlg3VDRNRHFmVHRGSm9GS0hKTzNueXh5cVl4VEFN?=
 =?utf-8?B?QUlTU0tsbk5PL1J6aVFscXNrNDExNHZPVkpTV05pVXZaN2taSmlOSDZqNGVQ?=
 =?utf-8?B?aWZBYkVYU1VxRlY3WEE2aDBoeUg4Ry9VRnBBTHZBZnQ3YnNDcXZzTnpIeElG?=
 =?utf-8?Q?hcLogt3jYkYISKxgAolfPjcph?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d430af9d-25e9-4aa8-5289-08de116674d3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 12:28:08.5842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4t3gDJYZ3oQ+IrboF+pOZgwQFTeku5zvg2bF+t3Sn1eEFCKa9kcl77HpAmYntgW7IzNGEVK/6iPMrDa7OHTAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
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

--------------ofx5x0tpHQkHBPHWczhCEUmq
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
The failures reported here are not related to my changes.

On 17-10-2025 10:16, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/guc: Eliminate RPe caching for SLPC parameter 
> handling (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/155809/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/index.html
>
>
>   CI Bug Log - changes from
>   xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL ->
>   xe-pw-155809v3_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-155809v3_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-155809v3_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 4)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-155809v3_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@xe_gt_freq@freq_fixed_idle:
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-434/igt@xe_gt_freq@freq_fixed_idle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-463/igt@xe_gt_freq@freq_fixed_idle.html>
>
>
>     New tests
>
> New tests have been introduced between 
> xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL and 
> xe-pw-155809v3_FULL:
>
>
>       New IGT tests (31)
>
>  *
>
>     igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.84] s
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_invalid_mode@bad-vtotal@pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.0] s
>  *
>
>     igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.00] s
>  *
>
>     igt@kms_sequence@get-forked-busy@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.48] s
>  *
>
>     igt@kms_sequence@get-forked-busy@pipe-b-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.46] s
>  *
>
>     igt@kms_sequence@get-forked-busy@pipe-c-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.45] s
>  *
>
>     igt@kms_sequence@get-forked-busy@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.45] s
>  *
>
>     igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.44] s
>  *
>
>     igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.41] s
>  *
>
>     igt@kms_vblank@query-forked-busy@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.42] s
>  *
>
>     igt@kms_vblank@query-forked-busy@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.41] s
>  *
>
>     igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.27] s
>  *
>
>     igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.23] s
>  *
>
>     igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.27] s
>  *
>
>     igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.22] s
>  *
>
>     igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.76] s
>  *
>
>     igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.72] s
>  *
>
>     igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.43] s
>  *
>
>     igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.37] s
>  *
>
>     igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.45] s
>  *
>
>     igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.42] s
>  *
>
>     igt@kms_vblank@wait-busy@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.43] s
>  *
>
>     igt@kms_vblank@wait-busy@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.42] s
>  *
>
>     igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.33] s
>  *
>
>     igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [2.29] s
>
>
>     Known issues
>
> Here are the changes found in xe-pw-155809v3_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#1125
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125> /
>         Intel XE#5574
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-overflow:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +9
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +6
>         other tests dmesg-fail
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +13 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +4
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +62
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +27
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>)
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#4417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html>
>         (Intel XE#4417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +2
>         other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#4416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>)
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html>
>         (Intel XE#4416
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_chamelium_audio@hdmi-audio.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_audio@hdmi-audio-edid:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_chamelium_audio@hdmi-audio-edid.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +14
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_content_protection@dp-mst-type-1.html>
>         (Intel XE#307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/307>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +6
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_display_modes@extended-mode-basic.html>
>         (Intel XE#4302
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331>)
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>  *
>
>     igt@kms_draw_crc@draw-method-blt:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_draw_crc@draw-method-blt.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_draw_crc@draw-method-blt.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) +3
>         other tests dmesg-warn
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>) +1
>         other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@display-4x.html>
>         (Intel XE#1138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@psr2.html>
>         (Intel XE#1135
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135>)
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb-interruptible:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-fb-interruptible.html>
>         (Intel XE#310
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +11
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +7
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-panning-interruptible:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip@flip-vs-panning-interruptible.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#5208
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208>)
>  *
>
>     igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +2
>         other tests dmesg-warn
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +10
>         other tests skip
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543> /
>         Intel XE#4921
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921>) +1
>         other test dmesg-fail
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-modesetfrombusy.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html>
>         (Intel XE#4842
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +13
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +18
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +51
>         other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_joiner@basic-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_joiner@invalid-modeset-big-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
>
>       o shard-adlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html>
>         (Intel XE#5195
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195>) +4
>         other tests fail
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@2x-scaler-multi-pipe:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html>
>         (Intel XE#2571
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html>
>         (Intel XE#734
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/734>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +12 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@psr-cursor-plane-onoff:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr@psr-cursor-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +14
>         other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +4
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr@psr2-sprite-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#362
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +33
>         other tests skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_ccs@block-multicopy-compressed:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_ccs@block-multicopy-compressed.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#488
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/488> /
>         Intel XE#5607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5607>)
>  *
>
>     igt@xe_ccs@large-ctrl-surf-copy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-copy.html>
>         (Intel XE#3576
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576> /
>         Intel XE#5610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5610>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt-many:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_compute_preempt@compute-preempt-many.html>
>         (Intel XE#6360
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6360>)
>  *
>
>     igt@xe_configfs@survivability-mode:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_configfs@survivability-mode.html>
>         (Intel XE#6010
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010>)
>  *
>
>     igt@xe_copy_basic@mem-copy-linear-0x3fff:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_copy_basic@mem-copy-linear-0x3fff.html>
>         (Intel XE#1123
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>) +1
>         other test skip
>  *
>
>     igt@xe_copy_basic@mem-set-linear-0x369:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html>
>         (Intel XE#1126
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126>)
>  *
>
>     igt@xe_eu_stall@invalid-gt-id:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>  *
>
>     igt@xe_eu_stall@non-blocking-re-enable:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eu_stall@non-blocking-re-enable.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vm-bind-discovery:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-discovery.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug_online@debugger-reopen:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_eudebug_online@debugger-reopen.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eudebug_online@single-step.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#5565
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5565>)
>         +18 other tests skip
>  *
>
>     igt@xe_evict@evict-beng-large-external-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_evict@evict-beng-large-external-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#5564
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564>) +1
>         other test skip
>  *
>
>     igt@xe_evict@evict-beng-threads-small-multi-vm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-beng-threads-small-multi-vm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261>) +5
>         other tests skip
>  *
>
>     igt@xe_evict@evict-small-cm:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-small-cm.html>
>         (Intel XE#261
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
>         Intel XE#5564
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564> /
>         Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392> /
>         Intel XE#5575
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575>)
>         +15 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-defer-mmap:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +12
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288> /
>         Intel XE#5561
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561>)
>         +33 other tests skip
>  *
>
>     igt@xe_exec_reset@cat-error:
>
>       o shard-adlp: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_exec_reset@cat-error.html>
>         (Intel XE#3868
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +362 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +124 other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-adlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> /
>         Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_mmap@small-bar.html>
>         (Intel XE#512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/512>)
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378> /
>         Intel XE#5612
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612>)
>  *
>
>     igt@xe_oa@mmio-triggered-reports-read:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_oa@mmio-triggered-reports-read.html>
>         (Intel XE#6032
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6032>)
>  *
>
>     igt@xe_oa@non-zero-reason:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_oa@non-zero-reason.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +6
>         other tests skip
>  *
>
>     igt@xe_oa@oa-formats:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_oa@oa-formats.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +1
>         other test skip
>  *
>
>     igt@xe_pat@display-vs-wb-transient:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_pat@display-vs-wb-transient.html>
>         (Intel XE#1337
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337> /
>         Intel XE#5572
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5572>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_peer2peer@read.html>
>         (Intel XE#1061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061> /
>         Intel XE#5568
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +2
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s2idle-vm-bind-unbind-all:
>
>       o shard-adlp: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173> /
>         Intel XE#4504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504>)
>  *
>
>     igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0:
>
>       o shard-adlp: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_class_render0.html>
>         (Intel XE#5213
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213>) +1
>         other test timeout
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733> /
>         Intel XE#5594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5594>) +4
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-topology:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-uc-fw-version-huc:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +3
>         other tests skip
>  *
>
>     igt@xe_spin_batch@spin-mem-copy:
>
>       o shard-adlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_spin_batch@spin-mem-copy.html>
>         (Intel XE#4821
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821>)
>  *
>
>     igt@xe_sriov_scheduling@equal-throughput:
>
>       o shard-adlp: NOTRUN -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_sriov_scheduling@equal-throughput.html>
>         (Intel XE#3868
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868> /
>         Intel XE#5213
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213>) +1
>         other test dmesg-fail
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#6168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html>
>         +1 other test pass
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#5299
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-dpms-on-nop-interruptible:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-2/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@kms_flip@flip-vs-dpms-on-nop-interruptible.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
>
>       o shard-adlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html>
>  *
>
>     igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
>
>       o shard-adlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html>
>         (Intel XE#1874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html>
>  *
>
>     {igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc}:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>  *
>
>     igt@kms_joiner@invalid-modeset-force-big-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html>
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
>
>       o shard-bmg: WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume:
>
>       o shard-adlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (Intel XE#2953
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953> /
>         Intel XE#4173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173> /
>         Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_async_flips@async-flip-suspend-resume.html>
>         (Intel XE#4543
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543>) +1
>         other test dmesg-warn
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +7
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * Linux: xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed ->
>     xe-pw-155809v3
>
> IGT_8587: 8587
> xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed: 
> aaaff197c9186f4959c2bcb18035725188b950ed
> xe-pw-155809v3: 155809v3
>
Thanks,
Anirban
--------------ofx5x0tpHQkHBPHWczhCEUmq
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    Hi,<br>
    The failures reported here are not related to my changes.<br>
    <br>
    <div class=3D"moz-cite-prefix">On 17-10-2025 10:16, Patchwork wrote:<br=
>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176067641152.24656.11350417770914=
321658@97596180aaec">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/guc: Eliminate RPe caching for SLPC parameter
              handling (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/155809/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/155809/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155809v3/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL -&gt;
        xe-pw-155809v3_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-155809v3_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-155809v3_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 4)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-155809v3_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@xe_gt_freq@freq_fixed_idle:
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-434/ig=
t@xe_gt_freq@freq_fixed_idle.html" moz-do-not-send=3D"true">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-d=
g2-463/igt@xe_gt_freq@freq_fixed_idle.html" moz-do-not-send=3D"true">FAIL</=
a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between
        xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed_FULL and
        xe-pw-155809v3_FULL:</p>
      <h3>New IGT tests (31)</h3>
      <ul>
        <li>
          <p>igt@kms_atomic@atomic-plane-damage@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.84] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start@pipe-b-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start@pipe-c-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-hsync-start@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-vtotal@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-vtotal@pipe-b-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-vtotal@pipe-c-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.0] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_invalid_mode@bad-vtotal@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.00] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-forked-busy@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.48] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-forked-busy@pipe-b-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.46] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-forked-busy@pipe-c-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.45] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sequence@get-forked-busy@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.45] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-busy-hang@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.44] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-busy-hang@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-busy@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-busy@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.41] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-idle-hang@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.27] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.23] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-idle@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.27] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-idle@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.22] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.76] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.72] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.37] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-busy-hang@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.45] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-busy-hang@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-busy@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.43] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-busy@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.42] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-forked-hang@pipe-a-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.33] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@wait-forked-hang@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [2.29] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-155809v3_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@intel_hwmon@hwmon-write.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1125" moz-do-not-send=3D"true">Intel XE#1125</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5574" m=
oz-do-not-send=3D"true">Intel XE#5574</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-interna=
l-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_atomic_transition@plan=
e-all-modeset-transition-internal-panels.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370"=
 moz-do-not-send=3D"true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb=
-size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=3D"=
true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb=
-size-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true">I=
ntel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@linear-8=
bpp-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">I=
ntel XE#316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@x-tiled-32bpp=
-rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Intel=
 XE#316</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@x-tiled-max-h=
w-stride-64bpp-rotate-0.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874" moz-do-not-send=
=3D"true">Intel XE#1874</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-asyn=
c-flip:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_big_fb@y-tiled-max-h=
w-stride-32bpp-rotate-0-hflip-async-flip.html" moz-do-not-send=3D"true">DME=
SG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) +6 other tests
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-=
stride-32bpp-rotate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=
=3D"true">Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_big_fb@yf-tiled=
-16bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true"=
>Intel XE#1124</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_big_fb@yf-tiled-addfb-=
size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=3D"t=
rue">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_big_fb@yf-tiled-max-=
hw-stride-32bpp-rotate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-se=
nd=3D"true">Intel XE#1124</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-=
tiling-1-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-s=
end=3D"true">Intel XE#367</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_bw@connected-linear-=
tiling-2-displays-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-=
send=3D"true">Intel XE#2191</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_bw@linear-tilin=
g-2-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=
=3D"true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_bw@linear-tiling-3-dis=
plays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true"=
>Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4=
-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"tru=
e">Intel XE#2887</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@ccs-on-another-b=
o-4-tiled-mtl-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"t=
rue">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +41 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_ccs@crc-primary=
-basic-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=
=3D"true">Intel XE#2907</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a=
-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_ccs@crc-primary-basi=
c-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-=
do-not-send=3D"true">Intel XE#787</a>) +62 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_ccs@crc-sprite-plane=
s-basic-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=
=3D"true">Intel XE#2907</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-=
planes-basic-y-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-=
not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +9=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-=
b-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@crc-sprite-=
planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +27 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-=
a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-433/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do-not-send=3D"true">In=
tel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send=3D"true"=
>Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4522" moz-do-not-send=3D"true">Intel XE#4522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transitio=
n.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4417" moz-do-not-send=3D"true">Intel XE#4417=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" =
moz-do-not-send=3D"true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@mode-transitio=
n@pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4417" moz-do-not-send=3D"tru=
e">Intel XE#4417</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4416" moz-do-not-send=3D"true">Intel XE#4416</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" mo=
z-do-not-send=3D"true">Intel XE#455</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cdclk@plane-scaling@=
pipe-a-hdmi-a-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4416" moz-do-not-send=3D"true"=
>Intel XE#4416</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_chamelium_audio@hdmi-a=
udio.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#2=
252</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_chamelium_audio@hdmi=
-audio-edid.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Inte=
l XE#373</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_chamelium_color@ctm-=
0-50.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#30=
6</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_chamelium_edid@=
dp-edid-change-during-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-=
send=3D"true">Intel XE#373</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_content_protection@dp-=
mst-type-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send=3D"true">Inte=
l XE#2390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_content_protection@d=
p-mst-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/307" moz-do-not-send=3D"true">Int=
el XE#307</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_crc@cursor-of=
fscreen-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"true">=
Intel XE#308</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_cursor_crc@cursor-slid=
ing-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">In=
tel XE#2320</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_c=
ursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-not-send=3D"true">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v=
3/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_cursor_legacy@cursor=
b-vs-flipa-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309=
" moz-do-not-send=3D"true">Intel XE#309</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions-varying-size:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_cursor_legacy@short-=
busy-flip-before-cursor-atomic-transitions-varying-size.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/323" moz-do-not-send=3D"true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dirtyfb@drrs-dirtyfb-i=
octl.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send=3D"true">Intel XE#1=
508</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_display_modes@extend=
ed-mode-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4302" moz-do-not-send=3D"true">I=
ntel XE#4302</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_dp_linktrain_fallbac=
k@dp-fallback.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send=3D"true">I=
ntel XE#4331</a>)</li>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_d=
p_linktrain_fallback@dp-fallback.html" moz-do-not-send=3D"true">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/sha=
rd-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4294" moz-do-not-send=3D"true">Intel XE#4294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-blt:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms=
_draw_crc@draw-method-blt.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp=
-2/igt@kms_draw_crc@draw-method-blt.html" moz-do-not-send=3D"true">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953=
" moz-do-not-send=3D"true">Intel XE#2953</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send=3D"true">Intel XE#=
4173</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_dsc@dsc-with-output-fo=
rmats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#=
2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_fbc_dirty_rect@fbc-d=
irty-rectangle-dirtyfb-tests.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-=
send=3D"true">Intel XE#4422</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@di=
splay-4x.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1138" moz-do-not-send=3D"true">Intel =
XE#1138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_feature_discovery@ps=
r2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1135" moz-do-not-send=3D"true">Intel XE#113=
5</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_f=
lip@2x-nonexisting-fb.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/ig=
t@kms_flip@2x-nonexisting-fb.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-=
send=3D"true">Intel XE#2316</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_flip@2x-nonexisting-=
fb-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/310" moz-do-not-send=3D"true"=
>Intel XE#310</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a1:</=
p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_flip@flip-vs-expired=
-vblank-interruptible@d-hdmi-a1.html" moz-do-not-send=3D"true">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" mo=
z-do-not-send=3D"true">Intel XE#4543</a>) +7 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-4/igt@kms_f=
lip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/sh=
ard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/ig=
t@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html" moz-do-not-send=3D"true">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55809v3/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank@c-hdmi-a6.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>) +1 ot=
her test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-panning-interruptible:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip@flip-vs-panning=
-interruptible.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-send=3D"=
true">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5208" moz-do-not-send=3D"true">Intel XE#5208</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-8/igt@kms=
_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html" moz-do-not-send=3D"true">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5809v3/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html"=
 moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543<=
/a>) +2 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rccc=
s-downscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-3/igt@kms_flip_scaled_crc@flip-6=
4bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2380" moz-do-not-send=3D"true">Intel XE#2380</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscal=
ing:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-16bpp-ytile-upscaling.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-=
do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscal=
ing@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_flip_scaled_crc@flip-6=
4bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@kms_flip_scaled_crc=
@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55" moz-do-not-send=3D"true">Intel XE#455</a>) +10 other tests
              skip</li>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_flip_scaled_crc@flip=
-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send=3D"true">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543" moz-do-not-send=3D"true">Intel XE#4543</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4921" moz-do-not-send=3D"true">Intel=
 XE#4921</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms=
_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html" moz-do-not-sen=
d=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155809v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe=
-b-hdmi-a-1-y-to-y.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543" moz-do-not-se=
nd=3D"true">Intel XE#4543</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-modesetfrombusy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking=
@drrs-modesetfrombusy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D"=
true">Intel XE#651</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_frontbuffer_tra=
cking@drrs-rgb101010-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-=
not-send=3D"true">Intel XE#651</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</=
p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-433/ig=
t@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html" moz-do-not-=
send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-155809v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-pri=
mscrn-spr-indfb-move.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842" moz-do-not-se=
nd=3D"true">Intel XE#4842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz=
-do-not-send=3D"true">Intel XE#656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz=
-do-not-send=3D"true">Intel XE#5390</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-=
blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bcdrrs-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-=
do-not-send=3D"true">Intel XE#2311</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-b=
lt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@kms_frontbuffer_tra=
cking@fbcpsr-1p-primscrn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653"=
 moz-do-not-send=3D"true">Intel XE#653</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw=
-mmap-wc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_frontbuffer_tracking=
@fbcpsr-1p-primscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653=
" moz-do-not-send=3D"true">Intel XE#653</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-=
send=3D"true">Intel XE#2313</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_tracking=
@psr-2p-scndscrn-pri-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-d=
o-not-send=3D"true">Intel XE#656</a>) +51 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_h=
dr@invalid-hdr.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_h=
dr@invalid-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">=
Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_joiner@basic-big-joi=
ner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_joiner@basic-force-b=
ig-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3012" moz-do-not-send=3D"true">Intel=
 XE#3012</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_joiner@basic-ultra-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel XE#=
2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_joiner@invalid-=
modeset-big-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"tru=
e">Intel XE#346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_plane@pixel-format-s=
ource-clamping@pipe-b-plane-0.html" moz-do-not-send=3D"true">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5195" moz-do-not=
-send=3D"true">Intel XE#5195</a>) +4 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_plane_lowres@tiling-y.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2393" moz-do-not-send=3D"true">Intel XE#2393</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_plane_multiple@2x-ti=
ling-none.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-send=3D"true">Intel=
 XE#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_plane_multiple@=
tiling-yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel=
 XE#5020</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_p=
lane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/sh=
ard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2571" moz-do-not-send=3D"true">Intel XE#2571</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_backlight@fade.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Intel XE#870</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc5-retention-=
flops.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3309" moz-do-not-send=3D"true">Intel XE#=
3309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/734" moz-do-not-send=3D"true">Intel XE#734</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_pm_dc@deep-pkgc.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2007" moz-do-not-send=3D"true">Intel XE#2007</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-overlay=
-primary-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-s=
end=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +3 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr2_sf@fbc-psr2-cur=
sor-plane-move-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-=
send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +12=
 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_sf@fbc-psr=
2-primary-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-d=
o-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a=
>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr2_su@page_fl=
ip-nv12.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel X=
E#1122</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406" moz-do-not-send=3D"true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-plane-onoff:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_psr@psr-cursor-plane=
-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">Intel =
XE#929</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_psr@psr-sprite-plane-o=
noff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
34" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel X=
E#2850</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_psr@psr2-sprite=
-plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">I=
ntel XE#929</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_rotation_crc@primary-y=
-tiled-reflect-x-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"=
true">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@kms_rotation_crc@primary=
-y-tiled-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D=
"true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_tiled_display@basic-=
test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362" moz-do-not-se=
nd=3D"true">Intel XE#362</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@kms_vrr@flip-suspend.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +=
33 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@kms_vrr@seamless-rr-switch=
-drrs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#=
1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_ccs@block-multicopy-c=
ompressed.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel =
XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/488" moz-do-not-send=3D"true">Intel XE#488</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5607" moz-do-not-send=3D"true">Intel =
XE#5607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_ccs@large-ctrl-surf-copy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_ccs@large-ctrl-surf-c=
opy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3576" moz-do-not-send=3D"true">Intel XE#35=
76</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/561=
0" moz-do-not-send=3D"true">Intel XE#5610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt-many:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_compute_preempt@compu=
te-preempt-many.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6360" moz-do-not-send=3D"true"=
>Intel XE#6360</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_configfs@survivability-mode:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_configfs@survivabilit=
y-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6010" moz-do-not-send=3D"true">Intel XE=
#6010</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_copy_basic@mem-c=
opy-linear-0x3fff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"tru=
e">Intel XE#1123</a>)</li>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_copy_basic@mem-copy-l=
inear-0x3fff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1123" moz-do-not-send=3D"true">In=
tel XE#1123</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_copy_basic@mem-s=
et-linear-0x369.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1126" moz-do-not-send=3D"true"=
>Intel XE#1126</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@invalid-gt-id:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_eu_stall@invalid=
-gt-id.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5626" moz-do-not-send=3D"true">Intel XE=
#5626</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@non-blocking-re-enable:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eu_stall@non-blocking=
-re-enable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5626" moz-do-not-send=3D"true">Inte=
l XE#5626</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</=
p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_eudebug@basic-vm-access=
-parameters-userptr-faultable.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not=
-send=3D"true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-d=
iscovery.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel =
XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@debugger-reopen:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_eudebug_online@d=
ebugger-reopen.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">=
Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_eudebug_online@single=
-step.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#=
4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
565" moz-do-not-send=3D"true">Intel XE#5565</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-large-external-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_evict@evict-beng-larg=
e-external-cm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send=3D"true">In=
tel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5564" moz-do-not-send=3D"true">Intel XE#5564</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-small-multi-vm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-beng-thre=
ads-small-multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/261" moz-do-not-send=3D"tru=
e">Intel XE#261</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-small-cm:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict@evict-small-cm.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/261" moz-do-not-send=3D"true">Intel XE#261</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564" moz=
-do-not-send=3D"true">Intel XE#5564</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a=
>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_evict_ccs@evict-overc=
ommit-parallel-nofree-reopen.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-s=
end=3D"true">Intel XE#688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalida=
te:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_basic@multigpu-o=
nce-bindexecqueue-userptr-invalidate.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz=
-do-not-send=3D"true">Intel XE#1392</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5575" moz-do-not-send=3D"true">Intel XE#5575<=
/a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_basic@multigpu-onc=
e-null-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"tru=
e">Intel XE#2322</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_exec_fault_mode@=
once-bindexecqueue-rebind-prefetch.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do=
-not-send=3D"true">Intel XE#288</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:</=
p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_exec_fault_mode@twice=
-bindexecqueue-userptr-prefetch.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-no=
t-send=3D"true">Intel XE#288</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5561" moz-do-not-send=3D"true">Intel XE#5561</a>) +3=
3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@cat-error:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_exec_reset@cat-error.=
html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3868" moz-do-not-send=3D"true">Intel XE#=
3868</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_exec_system_allocator@o=
nce-mmap-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=
=3D"true">Intel XE#4943</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-nome=
mset:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_exec_system_allocator=
@process-many-execqueues-mmap-nomemset.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915" m=
oz-do-not-send=3D"true">Intel XE#4915</a>) +362 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-exec=
queues-mmap-new-race-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_exec_system_allo=
cator@threads-shared-vm-many-large-execqueues-mmap-new-race-nomemset.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4915" moz-do-not-send=3D"true">Intel XE#4915</a>) +1=
24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_fault_injection@probe=
-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917" moz-do-no=
t-send=3D"true">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5530" moz-do-not-send=3D"true">Intel XE#5530</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_mmap@small-bar.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/512" moz-do-not-send=3D"true">Intel XE#512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@force-load:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_module_load@force-loa=
d.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612" m=
oz-do-not-send=3D"true">Intel XE#5612</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports-read:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_oa@mmio-triggered-rep=
orts-read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6032" moz-do-not-send=3D"true">Intel=
 XE#6032</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@non-zero-reason:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_oa@non-zero-reason.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573</a>=
) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-formats:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_oa@oa-formats.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@display-vs-wb-transient:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_pat@display-vs-wb-tra=
nsient.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1337" moz-do-not-send=3D"true">Intel XE=
#1337</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5572" moz-do-not-send=3D"true">Intel XE#5572</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pat@pat-index-xehpc.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2838" moz-do-not-send=3D"true">Intel XE#2838</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" moz=
-do-not-send=3D"true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-1/igt@xe_peer2peer@read.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1061" moz-do-not-send=3D"true">Intel XE#1061</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5568" moz-do-=
not-send=3D"true">Intel XE#5568</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basi=
c-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE=
#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
366" moz-do-not-send=3D"true">Intel XE#366</a>) +2 other tests
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-464/igt@xe_pm@s2idle-d3cold=
-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Int=
el XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/366" moz-do-not-send=3D"true">Intel XE#366</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@xe_=
pm@s2idle-vm-bind-unbind-all.html" moz-do-not-send=3D"true">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-a=
dlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html" moz-do-not-send=3D"true">DM=
ESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2953" moz-do-not-send=3D"true">Intel XE#2953</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send=3D"true">Int=
el XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4504" moz-do-not-send=3D"true">Intel XE#4504</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@all-fn-engine-activity-load@engine-drm_xe_engine_cl=
ass_render0:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pmu@all-fn-engine-act=
ivity-load@engine-drm_xe_engine_class_render0.html" moz-do-not-send=3D"true=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5213" moz-do-not-send=3D"true">Intel XE#5213</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-pxp-fb:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@xe_pxp@display-pxp-=
fb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE#473=
3</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_pxp@pxp-src-to-pxp-dest=
-rendercopy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Int=
el XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_pxp@pxp-stale-bo-bind=
-post-termination-irq.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D=
"true">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5594" moz-do-not-send=3D"true">Intel XE#5594</a>) +4 other t=
ests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-436/igt@xe_query@multigpu-q=
uery-engines.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Int=
el XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-155809v3/shard-bmg-2/igt@xe_query@multigpu-query-to=
pology.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#=
944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_query@multigpu-query-=
uc-fw-version-huc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true=
">Intel XE#944</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_spin_batch@spin-mem-copy:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@xe_spin_batch@spin-mem-c=
opy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4821" moz-do-not-send=3D"true">Intel XE#48=
21</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_scheduling@equal-throughput:</p>
          <ul>
            <li>shard-adlp: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-2/igt@xe_sriov_scheduling@equa=
l-throughput.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3868" moz-do-not-send=3D"tr=
ue">Intel XE#3868</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5213" moz-do-not-send=3D"true">Intel XE#5213</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-466/ig=
t@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html" moz-do-n=
ot-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3862" moz-do-not-send=3D"true">Intel XE#3862</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard=
-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.htm=
l" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-436/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-n=
ot-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-no=
t-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4345" moz-do-not-send=3D"true">Intel XE#4345</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6168" moz-do=
-not-send=3D"true">Intel XE#6168</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155809v3/shard-dg2-434/igt@kms_ccs@random-ccs-d=
ata-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">PASS<=
/a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-=
a-6:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-dg2-464/ig=
t@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html" moz-d=
o-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705" moz-do=
-not-send=3D"true">Intel XE#2705</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212" moz=
-do-not-send=3D"true">Intel XE#4212</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4522" moz-do-not-send=3D"true">Intel XE#4522<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15580=
9v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-=
hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-=
7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.ht=
ml" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_c=
ursor_legacy@flip-vs-cursor-atomic.html" moz-do-not-send=3D"true">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-d=
o-not-send=3D"true">Intel XE#1475</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_cursor_legacy@fli=
p-vs-cursor-atomic.html" moz-do-not-send=3D"true">PASS</a> +1 other test pa=
ss</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@kms_c=
ursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send=3D"true">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299" moz-d=
o-not-send=3D"true">Intel XE#5299</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_cursor_legacy@fli=
p-vs-cursor-legacy.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_f=
lip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
16" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@kms_flip@2x-=
plain-flip-fb-recreate-interruptible.html" moz-do-not-send=3D"true">PASS</a=
> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-dpms-on-nop-interruptible:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-2/igt@kms=
_flip@flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send=3D"true">DMES=
G-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-8/igt@kms_flip@=
flip-vs-dpms-on-nop-interruptible.html" moz-do-not-send=3D"true">PASS</a> +=
2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" =
moz-do-not-send=3D"true">Intel XE#301</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3149" moz-do-not-send=3D"true">Intel XE#314=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
809v3/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html" m=
oz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-1/igt@kms_f=
lip@flip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send=3D"tr=
ue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/301" moz-do-not-send=3D"true">Intel XE#301</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-lnl-4/igt@kms_flip@f=
lip-vs-expired-vblank-interruptible@c-edp1.html" moz-do-not-send=3D"true">P=
ASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms=
_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html" moz-do-not-sen=
d=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-=
6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html" moz-d=
o-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:=
</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-6/igt@kms=
_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html" moz-do-not-sen=
d=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1874" moz-do-not-send=3D"true">Intel XE#1874</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-6/igt@=
kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html" moz-do-not-=
send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>{igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-=
mmap-wc}:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms=
_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-=
not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2953" moz-do-not-send=3D"true">Intel XE#2953</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-n=
ot-send=3D"true">Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_frontbuffer_trackin=
g@fbc-1p-offscreen-pri-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">PA=
SS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_j=
oiner@invalid-modeset-force-big-joiner.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012" m=
oz-do-not-send=3D"true">Intel XE#3012</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_joiner@invali=
d-modeset-force-big-joiner.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-lnl-3/igt@kms_v=
rr@cmrr@pipe-a-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4459" moz-do-not-send=3D"=
true">Intel XE#4459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155809v3/shard-lnl-8/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz=
-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p=
>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-7/igt@xe_ex=
ec_system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send=3D"tr=
ue">WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/5786" moz-do-not-send=3D"true">Intel XE#5786</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html" moz-do-not-send=3D"true"=
>PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume:</p>
          <ul>
            <li>shard-adlp: <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-adlp-9/igt@kms=
_async_flips@async-flip-suspend-resume.html" moz-do-not-send=3D"true">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
953" moz-do-not-send=3D"true">Intel XE#2953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173" moz-do-not-send=3D"true">Intel =
XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4543" moz-do-not-send=3D"true">Intel XE#4543</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html" moz-do-not-send=3D"true">DMESG-WAR=
N</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
 moz-do-not-send=3D"true">Intel XE#4543</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_f=
rontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
312" moz-do-not-send=3D"true">Intel XE#2312</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-7/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390" moz-do-not-send=3D"true">Intel XE#5390</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_f=
rontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390" moz-do-not-send=3D"true">Intel XE#5390</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6/igt@km=
s_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/i=
gt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>) +6 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-1/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-6=
/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) =
+6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_f=
rontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312" moz-do-not-send=3D"true">Intel XE#2312</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/ig=
t@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>) +7 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed/shard-bmg-6/igt@kms_t=
iled_display@basic-test-pattern.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-n=
ot-send=3D"true">Intel XE#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-155809v3/shard-bmg-5/igt@kms_tiled_display@basic-=
test-pattern.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send=3D"true">In=
tel XE#1729</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed
          -&gt; xe-pw-155809v3</li>
      </ul>
      <p>IGT_8587: 8587<br>
        xe-3930-aaaff197c9186f4959c2bcb18035725188b950ed:
        aaaff197c9186f4959c2bcb18035725188b950ed<br>
        xe-pw-155809v3: 155809v3</p>
    </blockquote>
    Thanks,<br>
    Anirban
  </body>
</html>

--------------ofx5x0tpHQkHBPHWczhCEUmq--
