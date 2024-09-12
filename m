Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572B5EED635
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 18:06:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF010EC02;
	Thu, 12 Sep 2024 18:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n1g2z9or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19DD10EC02
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Sep 2024 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726164392; x=1757700392;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DA4ae5Wtr8tjmu3ZOvMgWG1bPRwHklJEsKY7jqZCIpw=;
 b=n1g2z9orUHZyBMxAU2Bd27pl6AKJeNegHPnQSO6QvpUmBlbNzpJ4ZYDb
 ta0BWgarywo/rymfkUDF3VAyE6uR6g2QoNV8wMBKx/iUch8CAqLdgnvxc
 VYtqU6Yj36k7LeQrXjISyp+o+r0JA9vutqrj4/GbSMkw62KapUQjyeMK7
 U7oNDSHI9Y6RYiAy3kUv+1mfmsbOShze0TMGkK5Uz38EKVIwwZF7x7Nwu
 md4Rciyy5o+S9b6dJrOKOHQJbxz80RduSOXpKHCYMN9nr/Ce0IKjx/i0w
 DYTAhXWAsFgUxO36C9Xp6RjOQ17qLGlK32M03/2cSRyLQWrOXGOk3mFtG w==;
X-CSE-ConnectionGUID: pWIl3NnzQiOWJrzyuFQExA==
X-CSE-MsgGUID: oeYHMJ9jQM2ZM0mUWVq7Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25233482"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="25233482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 11:06:31 -0700
X-CSE-ConnectionGUID: SEmPzX0pQSyGoQfrF2liXg==
X-CSE-MsgGUID: zy7hhXoqQ4uutX9XTf472g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="72792913"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 11:06:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 11:06:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 11:06:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 11:06:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLBz9WQlHJYezMTUr05GUHGZvBO/06kikN+6XqJUTK5TvpZxKuFtuNXkeGw0bYnBPo87K9HQjvTxVgOW3A6KK6iozNtiuSr0wzqBU9L4zNtyVxNpDQvr3fv8aWklbNrpkcGbskIOvBOHo03DC24/ClXAgXi9zM0Mj+s+X8GbOpE8QYcG7/QeKrofWovQZ0UC5JkcZRoNXubA7CX9v3yNxdhww7OQejTJStwPQ9YY2vIMTeeW6dpC5yIgSHpUrmlk8BJN64IY8ugLCn6reoQ0+DpbFAIp+LBRa3o2z2boGNKes+e1uJT2lsUjo2bw7E4WBEJ+K2lpL7Ie8I99uVwn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBJKwCyr+SVk55EKjQuq7Z3eTb+T0e/Pfx9Fauxq1ps=;
 b=y+OllhctHW/9i5ZcnrqaIS6wzBnVyiorBmi1yhmNaFpOyjHp2c0YkTuLvc4WCr15isp1T7z93q/8i56BM4QR850oWa8wEB4BxG+/A9GSnd6VTGIlKnHET6Y3dmHSTFXzja11I/jXhItUU/0PslU4JzNmI11l0jeUYxiJ+exKVI/HUtGs2fEK2Bz8kGhSn14N66Yzy6M+COdfOB97Zn5OTLvs3atgHsmikgyZyXwUjWn4h/uGOjrG2ES93VqpimxDsjNOHKDcvslDMNTPbjg8wxms504YTC64Rjgj0OJ07fIejRrw5KVY/GnaBzwDRxSIWexWQ8UFx56QhoOJQK3asQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 18:06:23 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 18:06:23 +0000
Message-ID: <c07f4afc-e995-40e5-aed8-1a5db0c3547c@intel.com>
Date: Thu, 12 Sep 2024 11:06:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] drm/xe/devcoredump: Add ASCII85 dump helper
 function
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Intel-Xe@lists.freedesktop.org"
 <Intel-Xe@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
References: <avsxdhqepybtshgp3zfhdtv2beqaub7mg3nvkj7yws7utc5e5p@44uqzzgz6h3m>
 <b2002802-50d5-42bd-abb3-ffdf8ed33e69@Hendrik.org.uk>
 <21bc8c69-3a0f-4c68-99af-63f3f029f37a@intel.com>
 <eu7zw22lmcvkldfyt66abmi7gutl6eshey2ny4ev24d62jjagq@vm7i5j2s3mjx>
 <61ce4887-9cc6-4e46-9412-958c992305a9@intel.com>
 <3jexgpnh3br3gqi4ol4c3hx3tyhwevq5nqo5xssyie3xglqohz@e7mnj4dewupu>
 <34c59c0413c51d574baa39a62a735d0de67f8a2f.camel@intel.com>
 <7c75dda1-e62b-47ff-a6e2-0da2f080126f@intel.com>
 <0daf2e5c9ece014d5f85b5bcb0cb44dafa2449c0.camel@intel.com>
 <c57ee885-2cab-4a7d-8ce3-d9e7b3ab55d3@intel.com> <ZuLzSMH_hBl9RWdv@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZuLzSMH_hBl9RWdv@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: b98001b2-0074-4853-8c33-08dcd3559c76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm1ma2RXV01Cd3V2WEtXWnpFVGx5Ty9BZUxrMCtFSnI2US9MR1M0cW1DSDY5?=
 =?utf-8?B?RzFncyttNWoxQW8vRlJLZTc0N2RDeWdpRVdZalpxU2poWVkrSDNnSlpoSmVR?=
 =?utf-8?B?c3RLd3dhenNRUytkQWcrUDBHL2pRNFo4R3VzamVwZXU5S2w4S1dLZE5JTlJR?=
 =?utf-8?B?bWRUdzQxVFFIc0F5Mk9qRXpPNFNadzVyelZCZmU2dWJoRVE4OWpDdi9Zb28z?=
 =?utf-8?B?TzVlWEZCK0NxSTVEYzA3Qm5FUHRJd1VSa25XTFR0eGZxYjUrMC8raW5GQlg5?=
 =?utf-8?B?NE0rRHArekRJemRHL3FCNEdaZTUvTDd2ektYclB3NXdJZjl5c2xlcmNyTENw?=
 =?utf-8?B?VmZoMXNyNjQvTEhPMkVscDZlU1dpVjRFK3RqUFZjcFB3TUw1WW5WWHBxYzBk?=
 =?utf-8?B?MXZoRGUzMzhwdStQaXlFVGRYSUpTcTVXQUNXV3VuTGI0UlNaVnZ3K1NNLzhL?=
 =?utf-8?B?V2F4N0xBZkNSV0wyRDFGNkZvSDF3TmdQTGVoVUdSOHMxeTRJbEIwVUFRRlow?=
 =?utf-8?B?c09QL1dCdjV5MmFlOFBHOEZCbDkxR3l0SlNoekpjYk8vWTAzUTJtUlRvVVcx?=
 =?utf-8?B?UGdpMDhoSXhsczU1anRoRmlNOUZzQUlpVTB3TjQ2N2Z2NC9jMUFDT2E2MERF?=
 =?utf-8?B?bU1mMHRTL3lxbVhXa3NHVVdQR3I3c0tFc1QvcUkvYVMwUXZSby83SVlGdWI2?=
 =?utf-8?B?bERKL0s1UTgyOUJucmNaa2FTR0ZFM3BxUkJDY1lrUm1VdW0xWHdHellvYzJr?=
 =?utf-8?B?V3ZBbWdkalFTUEtqUlNkREJsNW9xbkFkK3gvQzVpRS82MCtWRDc0VGEvWmlN?=
 =?utf-8?B?VTZQTVY0VnJJdHJxL1IwNmNLT2d6UE0yVDVQaE54VDl0cTdWN0VHRjMwcmRj?=
 =?utf-8?B?OXhWb2lpc2NzM3hpUEt0cFI0dUNqWmhmZlJTaGduS3NoQkhqRjNEUDAzZ0RY?=
 =?utf-8?B?WngyWDdUQ0ZGQ2dsdlJDaWRsZVJKMytsTmcyK3ZJWGd5bG9nenoybXUvbzhw?=
 =?utf-8?B?QVFHRmcvU2JZMmttaCtFdzc5YVd6a1RuWnprN1RObEpGM01Xc1QrRlQzcHJQ?=
 =?utf-8?B?NmRyOG82ZGN5QWJRWkhBU2tidE5XajI0NlY3YmptNFZDdmJ3ZW1sbE84aDZt?=
 =?utf-8?B?ck0vWVM5NWJJdnJKckFpMFlEb3ptNGpZY0kxMnR6UzkvK2lkd0RNNDkxM2lU?=
 =?utf-8?B?U2RNMnY0SFBBV1ZoZjBCcU1MclFaYmpPenIrZ09JM3ZEUE4rY1dtcjVDTFlV?=
 =?utf-8?B?dEZjV2R6eHBwNmhKVXo4Z2lFMGpzamppeEYzNXlTTFVJaVFOQjExTzFGRE5k?=
 =?utf-8?B?STZEZ1hUZnpaWkE3a0dUaVFwazgvNndUUVdWRitUdjNiUWJxTTJITzhVUnlS?=
 =?utf-8?B?bHpRb2g5OVFNNjJHWVZVODF1eDNzS2h3YkIxUnpmaHVTMHRhVkNBUUtrMCtN?=
 =?utf-8?B?QytTOTRiQllJVFFVYnZ3b2xBYThzUzdzQTZFbEVoQWdFVHhVOFVPa3NwbXF5?=
 =?utf-8?B?eFJEbndsTkxmd3ZrNG9hM0YwY2s0UmVlS2ZweXFma1cxWStCVVlocldRaTVm?=
 =?utf-8?B?Y0hvdlc3NW5HRmFkWkNVb0VQNG5UVk03YUR3QmtJL0tGMXd3aE8zTFYzblRY?=
 =?utf-8?B?TW9JOEZROXgzWm54UlpPenpxWFM5UXd0aEwydTJxNXh4cHNkbHFGUXlqVUJa?=
 =?utf-8?B?VThlYmpPVnpZdXB3aDAyamdFSDdSbnN0MGp4WGZkYjd4Snc0TXJCNHFNemFH?=
 =?utf-8?B?c0srejE3bHo0WEhNbC9UOUdnVi9yeTB6NlNoeEFQSXc0b0g4VmV3aXpoMTc5?=
 =?utf-8?Q?RmSQMr9Lwni5urR59EbsQbxmvFNuuFE+kG7Dw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGdtazVURUcxdjNPQjJ6Z293bkxiUm9Ga3ZmNjczU1NETWpUejBDbkJBa1Rm?=
 =?utf-8?B?MlJQR3luSksyLzhxZ3BCMHJpUmVhaEJickcvY1lGNEZsekpJbUdsTy9SSHhv?=
 =?utf-8?B?ZWNNYWJLN0xRb29JZURqbi94ak01ekF3ZFp6STlGUVdkRWVwTk42U2ZLc3hk?=
 =?utf-8?B?S0xYQ3pLZ0VvUmpGbjF5YTFXVU1FV2o0ZkcwWFVGM1U0ZktrK3JWS1lUMVZO?=
 =?utf-8?B?dVBJL2V5aFA3UVJHWU5RY0svandTT2dKM21QdGtaOW1GcENPUHEwUUk3SHU4?=
 =?utf-8?B?cmFDVjhyNS9uRWVibThMaFRhRHpNRUdpdTBzMkpDeStrYXBoY0hCcUN5NTNp?=
 =?utf-8?B?Q093RG1MSlNEd1FRWXB3MlQ2MmN4UVhNMEZKODViQ2htSE1wdGh5SjE4SVBV?=
 =?utf-8?B?QzlRMmpSc0JQL3U3QjVGRnZnaVlGK0trUnBidmR3SFdUWUZBMC9xdEl3Wmpa?=
 =?utf-8?B?cU1ZaXk0UEdXRStDYjlXSVBhL09UTnFha2pDOHFiSTBBUXNBMTFNWEg0SFRD?=
 =?utf-8?B?NGlWWkxJY2Z1SW81S3F4YzZ2TlJMVWtoWFhleVN3bDRUb2t1L1FVblM5ZmY3?=
 =?utf-8?B?RXBKM3BaUUYxVmdVcWtnNWN5ME0vcXE0eUVIcC9xa1gyTmtmVnZPY1NyOUhD?=
 =?utf-8?B?SEp1UjRIODlYR1A0Q1dIMzJlQmdUZ1VoRTRPRmpFZjFuczVZL3hmNThWa1Rn?=
 =?utf-8?B?RW9vemhFb3Y5SmdtL3ZvclgwdUIyTzUvM1VHei84eU9PbGhNdTZaMHpudGFO?=
 =?utf-8?B?czFib2tFanZaQk1SZisvc2NHdU95cVYrS21CUk5KVUh1WEUrUkI4Z01ySHIw?=
 =?utf-8?B?SHJEZnZBTm53S3B3c002ZDA3OFJZMmlZNE01WVpvd2t4OFRZNkZVSkh1ckpq?=
 =?utf-8?B?VDlOTy9vekdUandjdXdBM3pQamhDRzFKV2V1d3M1K2U3WHdQSkNaRmhlaFpC?=
 =?utf-8?B?Q1ZER1g1emtkdng0Tmg3MU5wRmtxZFFaNngzZDZoSUExUGlJa0ZFaWp2VUQ2?=
 =?utf-8?B?TGtmR3MzWkRyVmloUEd5cE92Y0VqU1JwR1dKSEl5dGo4Zzh5NmtBU2w4ekpv?=
 =?utf-8?B?YWpYZGdOajYvaG5ESkljK0pyZnVvNDZoYUt0WG54NEtVRGRlMTIrYUFzbHMy?=
 =?utf-8?B?ZytUMVphbDBNY2JRTjNtOHl4WjlRSHZra0U5Q1Vtb3gzUWRNelZmZlYvaHpG?=
 =?utf-8?B?bllMZzRJVGh6Sm40Z3dvU2JFWWZGNWkxZHh6ZzlmbVRWVzJ1RzdTamhXbE5x?=
 =?utf-8?B?MXNjUnRQcTMvNitBdllSR3BSWWt2U2kxSE5udzRYUjdPSXZJanQzZDBqR1k1?=
 =?utf-8?B?aURJbnE0bGRtQnFHQlVZTUFNc1laU29WaDNWTHlET1B5dnRRaFdkNkNSaENH?=
 =?utf-8?B?ZDRPbjhZRVovWXExUUM4ZzZ2L3lRQk0rdk44WC9EREUyL3NOY0VscEs1V05y?=
 =?utf-8?B?STRDZDlpczZNbW90cXFQM2dxQi9DWU5pNGxuQ2F3UjVEQmdveVhHYlhkVUEx?=
 =?utf-8?B?bFJhWU1qdXdiRHlqc1hJVlhYck5KRE1QeDRFUk1SSDBUSmIxaGh3WDdwV1JR?=
 =?utf-8?B?M3NicGlrZ0p3NGpyVHpRUDNSZDZpTDZybjdLOWY1OXFtUlpTWVNjL0lpcUxK?=
 =?utf-8?B?MHpINkp4R0lycnZKNVRjdzNRWXRSa2FPTFFjTHBCeS9ZQXJ4MlBrVm11NHoz?=
 =?utf-8?B?Ni8zUzlhSXVDNERNb09ObVhlbzAwSGVKR1ZrSmVyckttUkNnUCsxYzhydFFB?=
 =?utf-8?B?eE9CdXN6NFltdE9XcDdndkxvZ0N1MUJZVlhWRXBSWE5nTHFEY2RNUGxTeGdq?=
 =?utf-8?B?Z1JDOU1yL3hLSXVZcWVzQ2pibDZNd0RnV0d3VGl4c3kwbEx4a0VtQ2lMRjZX?=
 =?utf-8?B?a3FkZlI0UzJtM3BCTDFIaUJvTlJCQmtJU1diem9xSlBQUVpMWDF5cVFldm4r?=
 =?utf-8?B?RWQzSUFtZUthZjNYQnJQRzBvM2prZmwzUThOT2xZUUdhd05PZkgyc01NNlh4?=
 =?utf-8?B?Ujc5V2d5VXdSODVia2xBb1Y4bnJWa3UrU2pHL2FlOWFERVFiTitraU5TZVdT?=
 =?utf-8?B?ZWNsUGdjUkNjMUROTVlteWpYSkZZd3Q3N1JSTHUyUHdBeUhBcVA0S3RJcnll?=
 =?utf-8?B?VW5saU8vMjRGa0lJdnd1ODA3VTNERGx3czZuZll4c21LNnhTUkFpMGFoVmF6?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b98001b2-0074-4853-8c33-08dcd3559c76
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 18:06:23.2075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12UOKZrfQ/kB1EQOZ7HTa7sEF4RrGhSrhYRI7OoxP9kruziA2/J3KfcwVERHEYTf5+UQeYPAGgvcLCnUATTCYN1Z9P8dxnhom99CilA66aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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

On 9/12/2024 06:57, Rodrigo Vivi wrote:
> On Wed, Sep 11, 2024 at 12:59:54PM -0700, John Harrison wrote:
>> On 9/11/2024 12:54, Souza, Jose wrote:
>>> On Wed, 2024-09-11 at 12:35 -0700, John Harrison wrote:
>>>> On 9/11/2024 12:30, Souza, Jose wrote:
>>>>> On Wed, 2024-09-11 at 14:12 -0500, Lucas De Marchi wrote:
>>>>>> On Tue, Sep 10, 2024 at 01:17:11PM GMT, John Harrison wrote:
>>>>>>> On 9/10/2024 12:43, Lucas De Marchi wrote:
>>>>>>>> On Mon, Sep 09, 2024 at 06:31:41PM GMT, John Harrison wrote:
>>>>>>>>> On 9/6/2024 19:06, John Harrison wrote:
>>>>>>>>>> On 9/5/2024 20:04, Lucas De Marchi wrote:
>>>>>>>>>>> On Thu, Sep 05, 2024 at 07:01:33PM GMT, John Harrison wrote:
>>>>>>>>>>>> On 9/5/2024 18:54, Lucas De Marchi wrote:
>>>>>>>>>>>>> On Thu, Sep 05, 2024 at 01:50:58PM GMT,
>>>>>>>>>>>>> John.C.Harrison@Intel.com wrote:
>>>>>>>>>>>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> There is a need to include the GuC log and other large
>>>>>>>>>>>>>> binary objects
>>>>>>>>>>>>>> in core dumps and via dmesg. So add a helper for dumping
>>>>>>>>>>>>>> to a printer
>>>>>>>>>>>>>> function via conversion to ASCII85 encoding.
>>>>>>>>>>>>> why are we not dumping the binary data directly to devcoredump?
>>>>>>>>>>>> As per earlier comments, there is a WiFi driver or some such
>>>>>>>>>>>> that does exactly that. But all they are dumping is a binary
>>>>>>>>>>>> blob.
>>>>>>>>>>> In your v5 I see you mentioned
>>>>>>>>>>> drivers/net/wireless/ath/ath10k/coredump.c, but that is a
>>>>>>>>>>> precedence for
>>>>>>>>>>> including it as is from the device rather converting it to ASCII85 or
>>>>>>>>>>> something else. It seems odd to do that type of conversion in kernel
>>>>>>>>>>> space when it could be perfectly done in userspace.
>>>>>>>>>> It really can't. An end user could maybe be expected to zip or
>>>>>>>>>> tar a coredump file before attaching it to a bug report but they
>>>>>>>>>> are certainly not going to try to ASCII85 encode random bits of
>>>>>>>>>> it. Whereas, putting that in the kernel means it is just there.
>>>>>>>>>> It is done. And it is pretty trivial - just call a helper
>>>>>>>>>> function and it does everything for you. Also, I very much doubt
>>>>>>>>>> you can spew raw binary data via dmesg. Even if the kernel would
>>>>>>>>>> print it for you (which I doubt), the user tools like syslogd
>>>>>>>>>> and dmesg itself are going to filter it to make it ASCII safe.
>>>>>>>>>>
>>>>>>>>>> The i915 error dumps have been ASCII85 encoded using the
>>>>>>>>>> kernel's ASCII85 encoding helper function since forever. This
>>>>>>>>>> patch is just a wrapper around the kernel's existing
>>>>>>>>>> implementation in order to make it more compatible with printing
>>>>>>>>>> to dmesg. This is not creating a new precedent. It already
>>>>>>>>>> exists.
> No! no big dump in dmesg.
Please see other response. Dumping via dmesg is intended for internal 
use and impossible to repro fatal scenarios. There is zero expectation 
and end user would ever see a dump via dmesg. This entire patch set only 
includes one actual trigger for doing such dumps and that is only if 
CONFIG_DRM_XE_DEBUG is defined. Which it would not be for an end user.

And if you are saying that internal developers are not allowed to use 
dumps via dmesg then we might as well give up and go home because there 
are very many bugs for which this is the only viable debug method.


>
>>>>>>>>>>> $ git grep ascii85.h
>>>>>>>>>>> drivers/gpu/drm/i915/i915_gpu_error.c:#include <linux/ascii85.h>
>>>>>>>>>>> drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c:#include <linux/ascii85.h>
>>>>>>>>>>> drivers/gpu/drm/msm/adreno/adreno_gpu.c:#include <linux/ascii85.h>
>>>>>>>>>>> drivers/gpu/drm/xe/xe_lrc.c:#include <linux/ascii85.h>
>>>>>>>>>>> drivers/gpu/drm/xe/xe_vm.c:#include <linux/ascii85.h>
>>>>>>>>>> And the list of drivers which dump raw binary data in a coredump
>>>>>>>>>> file is... ath10k. ASCII85 wins 3 to 1.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>> We want the devcoredump file to still be human readable.
>>>>>>>>>>>> That won't be the case if you stuff binary data in the
>>>>>>>>>>>> middle of it. Most obvious problem - the zeros in the data
>>>>>>>>>>>> will terminate your text file at that point. Potentially
>>>>>>>>>>>> bigger problem for end users - random fake ANSI codes will
>>>>>>>>>>>> destroy your terminal window if you try to cat the file to
>>>>>>>>>>>> read it.
>>>>>>>>>>> Users don't get a coredump and cat it to the terminal.
>>>>>>>>>>> =(lk%A8`T7AKYH#FD,6++EqOABHUhsG%5H2ARoq#E$/V$Bl7Q+@<5pmBe<q;Bk;0mCj@.3DIal2FD5Q-+E_RBART+X@VfTuGA2/4Dfp.E@3BN0DfB9.+E1b0F(KAV+:8
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Lucas De Marchi
>>>>>>>>>> They might. Either intentionally or accidentally. I've certainly
>>>>>>>>>> done it myself. And people will certainly want to look at it in
>>>>>>>>>> any random choice of text editor, pager, etc. 'cos you know, it
>>>>>>>>>> is meant to be read by humans. If it is full of binary data then
>>>>>>>>>> that becomes even more difficult than simply being full of ASCII
>>>>>>>>>> gibberish. No matter what you are doing, the ASCII version is
>>>>>>>>>> safer and easier to look at the rest of the file around it.
>>>>>>>>>>
>>>>>>>>>> I don't understand why you are so desperate to have raw binary
>>>>>>>>>> data in the middle of a text file. The disadvantages are
>>>>>>>>>> multiple but the only advantage is a slightly smaller file. And
>>>>>>>>>> the true route to smaller files is to add compression like we
>>>>>>>>>> have in i915.
>>>>>>>>>>
>>>>>>>>>> John.
>>>>>>>>>>
>>>>>>>>> PS: Also meant to add that one of the important uses cases for
>>>>>>>>> dumping logs to dmesg is for the really hard to repro bugs that
>>>>>>>>> show up in CI extremely rarely. We get the driver to dump an error
>>>>>>>>> capture to dmesg and pull that out from the CI logs. Even if you
>>>>>>>>> could get binary data through dmesg, pretty sure the CI tools
>>>>>>>>> would also not be happy with it. Anything non-printable will get
>>>>>>>>> munged for sure when turning it into a web page.
>>>>>>>> I think that's the main source of confusion on what we are discussing.
>>>>>>>> I was not talking about dmesg at all. I'm only complaining about feeding
>>>>>>>> ascii85-encoded data into a *devcoredump* when apparently there isn't a
>>>>>>>> good reason to do so. I'd rather copy the binary data to the
>>>>>>>> devcoredump.
>>>>>>> But the intent is to dump a devcoredump to dmesg. It makes much sense
>>>>>> It seems like an awful idea to dump hundreds of MB to dmesg.  When we
>>>>>> talked about printing to dmesg it was about **GuC log** and on very
>>>>>> initial states of driver probe where we didn't actually have a good
>>>>>> interface for that. And the log wouldn't be so big. If we can already
>>>>>> capture the devcoredump, what would be the reason to dump to dmesg
>>>>>> (other than the non-valid "our CI captures dmesg, and doesn't
>>>>>> capture devcoredump", which should be fixed).
>>>>>>
>>>>>> If any sysadmin have their serial console flooded by such garbage there
>>>>>> are 2 reactions: 1) someone got in control of my machine; 2) something
>>>>>> went really bad with this machine. It's not "fear not, wait for it to
>>>>>> complete, it's just normal debug data I will attach to an issue in
>>>>>> gitlab".  And I'm mentioning a serial console here due to that
>>>>>> cond_resched() added, which is only needed because you are trying to do
>>>>>> in kernel space what should be in userspace.
>>>>>>
>>>>>> Oh well... looking at this the main reason to use ascii85 I can see is
>>>>>> because we already have parts of *our* devcoredump using it, and
>>>>>> userspace relying on that. That's new to me. Let's stop bringing dmesg
>>>>>> into this discussion.
>>>>>>
>>>>>>> to have a single implementation that can be used for multiple
>>>>>>> purposes. Otherwise you are duplicating a lot of code unnecessarily.
>>>>>>>
>>>>>>> And I still think it is a *very* bad idea to be including binary data
>>>>>>> in a text file. The devcoredump is supposed to be human readable. It
>>>>>> no, it's not. devcoredump doesn't dictate the format, it's up to the
>>>>>> drivers to do that. See their documentation.
>>>>>>
>>>>>>> is supposed to be obtained by end users and passed around. Having
>>>>>>> binary data in there just makes everything more complex and error
>>>>>>> prone. We want this to be as simple, easy and safe as possible.
>>>>>>>
>>>>>>>> For dmesg, there's a reason to encode it as you pointed out... but
>>>>>>>> no users shouldn't actually see it - we should be getting all of those
>>>>>>>> cases in CI. For the escape scenarios, yeah... better having it
>>>>>>>> ascii85-encoded.
>>>>>>>>
>>>>>>>> What you are adding to devcoredump also doesn't even seem to be an
>>>>>>>> ascii85 representation, but a multiple lines that should be concatenated
>>>>>>>> to form the ascii85 representation. For dmesg it makes sense. Not for
>>>>>>>> devcoredump.  We should also probabaly need a length field (correctly
>>>>>>>> accounting for the additional characters for each line) so we don't
>>>>>>>> have an implicit dependency on what's the next field to know how much to
>>>>>>>> parse.
>>>>>>> The decoding is pretty trivial given that line feeds are not part of
>>>>>>> the ASCII85 character set and so can just be dropped. Besides The
>>>>>>> output is already not 'pure' ASCII85 because the ASCII85 data is
>>>>>>> embedded within a devcoredump. There is all sorts of other text about,
>>>>>>> including on the start of the line. There are multiple ASCII85 blobs
>>>>>>> in there that need to be decoded separately. This is nothing new to my
>>>>>>> patch set. All of that is already there. And as per comments on the
>>>>>>> previous devcoredump patches from Matthew B, the object data can many
>>>>>>> hundreds of MBs in size. Yet no-one batted an eyelid when that was
>>>>>>> added. So why the sudden paranoia about adding a couple of MB of GuC
>>>>>>> log in the same form?
>>>>>> I suppose you are talking about commit 4d5242a003bb ("drm/xe: Implement capture of
>>>>>> HWSP and HWCTX").  Probably because I haven't seen that commit doing an
>>>>>> ascii85 encoding before, otherwise I'd have similar review feedback.
>>>>>>
>>>>>> Looking at this just now, so I will also have to balance the previous
>>>>>> users and existing userspace consuming it.
>>>>>>
>>>>>> +José, would it be ok from the userspace POV to start adding the \n?
>>>>>> Then we can at least have all fields in our devcoredump to follow the
>>>>>> same format. Are these the decoder parts on the mesa side?
>>>>>>
>>>>>> 	src/intel/tools/aubinator_error_decode.c
>>>>>> 	src/intel/tools/error2hangdump.c?
>>>>>>
>>>>>>     From a quick look, read_xe_data_file() already continues the previous
>>>>>> topic when it reads a newline, but the parsers for HWCTX and HWSP
>>>>>> seems to expect to to have the entire topic in a single line. But I may
>>>>>> be missing something.
>>>>> Sorry I'm not following up this thread.
>>>>> Add a '\n' where exactly?
>>>> To break very long ASCII85 streams across multiple lines. That will
>>>> allow the devcoredump file to output via dmesg for the situations where
>>>> reading from sysfs is not possible.
>>>>
>>>> This patch is adding an ASCII85 encoding helper that is more friendly to
>>>> output via dmesg. The patch does not currently change the existing
>>>> ASCII85 encodings of VMs and hw contexts. However, the intention would
>>>> be to update that code to use this helper eventually.
>>> It will break the parser and I don't think we are allowed to break it at this point.
>> The intent has always been to add compression as we had in i915. That will
>> presumably also break the parser. Although I'm not seeing how a debug log
>> parser counts as critical user space that must not ever be broken.
> We shouldn't be breaking the current userspace tools. Any change like this would
> need to be synchronized between all the current decode tools.
That is why the comment was 'eventually we would like to'. Nothing in 
this patch will break a user tool unless that tool cannot cope with new 
data being added to the core dump. And if we can't add new stuff to core 
dumps then again, we are fundamentally broken.

>
>>> What I can suggest is add another sysfs with a coredump that skips the binary dumps so it is readable by humans.
>> That will just lead to confusion and problems with people sending the wrong
>> file. This needs to be kept as simple and error-proof as possible.
> Perhaps it is time for us to convince devcoredump folks to accept
> multiple files like nvme folks were asking a while ago? [1]
>
> [1] - https://lore.kernel.org/lkml/1557676457-4195-4-git-send-email-akinobu.mita@gmail.com/
Is that likely to happen any time soon? That thread was from May 2019. 
We need something now. And it's not clear if that is adding a filing 
system within a single core dump file (i.e. read one file from sysfs and 
then extract later like a tarball) or creating multiple sysfs files that 
all must be read together and passed around together. I would strongly 
advise against the latter. As I said already, the whole coredump thing 
needs to be as simple and easy to use as possible.

If more official support is added to devcoredump itself in some number 
of years time and is actually beneficial, then we can move over to using 
that interface (and break the user land tools again...). But until then, 
this version works with the least amount of disruption for significant 
benefit. I.e., it lets us actually debug problems right now.

John.


>
>> John.
>>
>>>> John.
>>>>
>>>>>> Lucas De Marchi
>>>>>>
>>>>>>> And again, arbitrarily long lines (potentially many thousands of
>>>>>>> characters wide) in a text file can cause problems. Having it line
>>>>>>> wrapped gets rid of those potential problems and so is safer. Anything
>>>>>>> that reduces the risk of an error report being broken is a good thing
>>>>>>> IMHO. Robustness is worthwhile!
>>>>>>>
>>>>>>> John.
>>>>>>>
>>>>>>>> Lucas De Marchi
>>>>>>>>
>>>>>>>>> John.
>>>>>>>>>

