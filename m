Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58788CEE33F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:23:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9510E7BA;
	Wed,  9 Oct 2024 18:23:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHdjBldi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEB9110E7BA
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728498199; x=1760034199;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LC1VdlwrIA/cMHXxToM11qx+Ahf/IBLLl9PBcmDJ5xY=;
 b=NHdjBldiAjFSpVDawKludwDdTLRBotIQeyQN1k0UGD0o0f61HFL7GaVq
 umwRpQDmCg2bg/fRFcaPWTXAEs6777Tu12aUKZLJHIxLc7fiiacUsiZS4
 08/QVGog1ozvey0RSwc6krA3M19440+mDlkqp2DQRFvu7vRHZmLJA2baC
 JJHEcoa5vi4Ta/S0GM4CQQTjDT+Stwjctk0cDpBLD9Bgv/rmG6sx3kFZN
 pwwi167FkOGDiBTftzyI4TM9yL44F5Kb4GK1IwU5Afpvw4RoYGnm1KrIk
 oPQ12OUqZ/66D0XFip1LOq8oL7OcNcLzYlSa6Cf77/GtwYmBKruZzHX7z g==;
X-CSE-ConnectionGUID: y6kx/FYPTvCfy092myvD/w==
X-CSE-MsgGUID: kPDy4Tx9SBuAXZ9ikZ0Hbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27700260"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27700260"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:23:19 -0700
X-CSE-ConnectionGUID: Ny/WkmdgQVaceff8tIXIRw==
X-CSE-MsgGUID: /tyMz31IT3apoholg8eXvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="107181094"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 11:23:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:23:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:23:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 11:23:17 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 11:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foPkOc2Rs/g/d4PPIOCDRmcoiP7NYEUwL+8ZGdmnCwBS3R0kGutAuju2HbT3IVM0f2WztgUFmUV09uzSLi9uAntcjZ6Wbakhi6UuP01k1r9DnEPf6WcG8iElbqyneGqunwrQL1lBDpVPyTcanCLEEzsZ7Jnsk6/jKwMQDC2BDC3mOQbXfUH1cgugBgiG6LtovoCF4r91KIfBvfe0YJR5Pt/jsVztil8w9KCHlE7YopTenFsojJWr9j+VD0a1ZSOBsU8YDnMJWMp52fGludlAKQUpROzNb33RQfHU/pUb8iDco6keFb+iXfvD9w+UIN1EOmZTWL4cHv3T+doQq54O2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLnHZHGztfUDuoTJMZY/W5Ht11SXlmHkA9yXv/6cUKg=;
 b=dAu8HE5aU5lPbOcZ3M+aw6WJICwm3VMsV0gN3OHsQzKM/C9QfHUkudUzIYJh1iRy6znyb2QuAHlwRyB+T+TwEza+cJXb7PdBGjhqOXVe1g84zKBF/qX+1Lgoa4yVgr+GAf5PzowEo5/GCfZZgeoJBe8ufF1b26iU/wYAHKT951meN1qmn8B5dOKcqjLDBd16wQwMhN5RKNeNBZQE/2hAgIV4stY4FTZuzsKOrdlH+2s+hsRc+B1rn5p3ckJA5MxXr8k90SrydUSmYyiCd8Wom/5itEwotEuxzZDRJ+BjsW+BZlYNKImvumBPdJqvybXDZtoNFPFX4WQJhYxDkyZtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Wed, 9 Oct
 2024 18:23:09 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8048.017; Wed, 9 Oct 2024
 18:23:09 +0000
Message-ID: <dd0e688c-3468-4020-8291-d2389577c5e2@intel.com>
Date: Wed, 9 Oct 2024 23:53:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [core-for-CI PATCH] x86/apic: Stop the TSC Deadline timer
 during lapic timer shutdown
Content-Language: en-GB
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, <chaitanya.kumar.borah@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Zhang, Rui"
 <rui.zhang@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, "Pandruvada, Srinivas"
 <srinivas.pandruvada@intel.com>
References: <20241007135242.3028131-1-karthik.poosa@intel.com>
 <ZwVtFJzWMUrTwg5C@intel.com>
 <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <db359db0916475865e2c2a615a7dfb92eeb65c6b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b7ffaa-f483-41b5-fdaf-08dce88f6d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anNwOGg2c1lJMVMwbjBzOGFjLzU1Z2gxNDNWcU5nVUo2Si9LYUtjb1RHQnVx?=
 =?utf-8?B?RzV5WjBvM2hTc0JxN2hEZjNCM0hXd2tURmdTWkVWNUFYYmhEVEUzWWlKQlZq?=
 =?utf-8?B?WjNNM3I2N3ZrRDZadkhxdFZ6SGYyWTdVOVpGbFRGN1hreHNQd09vTU1POXFD?=
 =?utf-8?B?dUZKQWxBUnpnaTlqU2o1czFyTzhGNnNXdXF1Y0RsWEUrRld4eitWVzFlOVlx?=
 =?utf-8?B?RllCNlRLRnNjSDFqY1B6djFHaDdTM2ROTlByQkZjNllxU1R0RmkzTG90OTd3?=
 =?utf-8?B?QjhIK2tTUDRpS2doS0Z5NjYvN0pUTnZBSjFlbDU1YXh1MWMrcFltWkVwU2My?=
 =?utf-8?B?WU9ZalZnWXJjUENJVDFNOHhrampMd1lDczFVenA1WXhLU0hIZURuVDlnd0FH?=
 =?utf-8?B?N2FmNHAzY1hhT1dNcHlFTkpxQlN0SVRrNHJHWGZvZ2k2cFRYVUZsd202SG41?=
 =?utf-8?B?TUNKTTZ6UGx1bVlOcXhINDdyNnNTOTc4V3ZicXFUTnZjQ0oxSFoySUtrdmZx?=
 =?utf-8?B?RFZ1N09Pd3h1WTJRa0F0Z3FPczVLWjQ0T21EN3lXRmZmdmZ5TmI3VEFDUHE1?=
 =?utf-8?B?QW0vY3FXc2xoRll1dXFsdnFXMGRDdXB3blMzWVNxLzRMWDVLVzQ0V0M3VXFy?=
 =?utf-8?B?L2pocWVTZXNOMGJLd1ptNUpoLzdtczRHcEZNTEVzWFAreDQzWVovaEhMQ1pH?=
 =?utf-8?B?Y01sWjJtcFpvMzRpQTZyTTRlSUswSDlLU2huOExleVJFcTRrZ0JtcENHN0hI?=
 =?utf-8?B?T0pvQWsvdFpRS2FkalREQzdPNklDVXhySDdmS0N3UUpESDU3MEdPZFFJU1A1?=
 =?utf-8?B?ZURKaGVZejNjL1VCWXlPSjhVQXh6WlFzMmMrY1ltdi8wbHNkZ08ybFgxUzk1?=
 =?utf-8?B?aVh1NHp3U29IMmpwSW00dStsN1M0RTFJbXZkczZZWDRHRUZ0Vyt2dlRCWTFv?=
 =?utf-8?B?UmtjL3o3TThRdVlDNVd4dnVBb3F4SHlGMlpKem9ILy83Mlkvdnl4LzV4cTBw?=
 =?utf-8?B?U3UwcWhCRmFMSy80cUFKOUd6M2pac0NiNnV4YmtDT1Ezdy8xZHZ6VkE5K0I5?=
 =?utf-8?B?VzRQV290Y0tReDc3SFZFSTkrNitMcndOclIrTjlJWFBtdnEvKzkwZjJYNVRC?=
 =?utf-8?B?RXo2UGp2ZGdBUVkrRjdvajZIcUdvd0xmNmgzaHFWUmQwMXorTUNLM2ljL2k3?=
 =?utf-8?B?eUM2a1R6ZjA2d2VTNDF6TlhyME1BbDlGOG9TR2l2aUJPTE5JZGt4MVk3SXh2?=
 =?utf-8?B?UUp2NGt3Nm40STFRYXZnWHFlVlAyb1lrem90cFVUeDVhVS9WQVNPM3FjZHMx?=
 =?utf-8?B?QXY5emd6WEt1WkZ5anVMbXlyYTVLN1VpNjRFNGtlZndwRytjUkdSa2krSXly?=
 =?utf-8?B?T0xuMnZDOFkvOC8xd0dQV2hkNy9ZakRmWFlUTEVCdkVpSktZalVCNFFvdTlY?=
 =?utf-8?B?eFdEQWFobm9jb3hKR3NBRnI3REVZSGVBcXl2Y1BBY1FCV3RLUXMzaE1mQlo3?=
 =?utf-8?B?MElxcXl6ZHlsWmNTN21ZM1dQeGlwRnRjWURBLzdUU1pIaDhRZHI5QU14cUtl?=
 =?utf-8?B?c29lQUEvN05sbjRVTXh4REFkeVVEaDdrYkhVVWNTOUNldkhhbVUrQVJOU2pv?=
 =?utf-8?Q?HjsW/eO76r74rySdiJHDVOQMjvh+i3wNo+U2G5zCjh/U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZWY3pkbG1pMkhQeXNHcnFldWwyZnZLOTFxelA3QklyNEQ4SGpmNnloQjFl?=
 =?utf-8?B?blpVNmZRejZqM1NTTTV2QmhqT0Vhc0dQNGZnRkFsZG9MR09WTS82NUlKTDNI?=
 =?utf-8?B?Q2JiWndGVW1NclNXM3QreXFMRXBkSW1lQXNrbFpKZ0M3Z2hxejVyOVFPTm1R?=
 =?utf-8?B?elhBWkJRUE1kSmNIY2VLYzBvTnJONFZ2Zkp2TnlZdDRXTi9mWnc3M2VzanlS?=
 =?utf-8?B?YVh6MHR5NW54TVBiU2g3SHRXbDVmRVFIM2VUbDVNdW1iTzl6TXAwc1V4T08x?=
 =?utf-8?B?anUvNnRSa3lRc3BVWTdUTlVaek1RWFFBRlRWdXZtSG01c2xlSU8wd3UveWRW?=
 =?utf-8?B?akJaMEhPQWZDVXVUSjhwdjhSMVZ3cTNuODYxSGlhbzMzVkh3RkpxRmRoQmhB?=
 =?utf-8?B?QkFkS1ZoOEcrMXQ4cmkvaWgyLzY3K283OFR3ang4VmhPS3NsVVdLdUIyTW9m?=
 =?utf-8?B?ZG9OZlA5b1JpZ2g4RTZYZEJ4MndYSmNsSWNLQVVWSjhlai9XU1hhczcyRzBX?=
 =?utf-8?B?S0FvYTV2R0tDMWVuNmFvMTNsU0lXZkRJS2haZkpzclhKL1l5VDVQTjhSMURi?=
 =?utf-8?B?UVd2OUpRbzNybEpmQnY1WVNwcmZmL1ROSnFlaUsrNTJGS0kwSzFWSkFPSHRO?=
 =?utf-8?B?ejVObGxzZWYrdktOTEx4UzFhV3dKM3dsWWtILzg1OGtlWERYRnlFZ1YwQm5t?=
 =?utf-8?B?aDRmazhxa1pWam5tcHNUTDlMK3RUazlSZm5sQnRwMk1obzVaN2xrVUxHNEN0?=
 =?utf-8?B?UVoyYWNJMG5pVlNpd3ljY2o2dkV5dzFiL1JGMGJBTVpyaDVRTjZ0YzBmMity?=
 =?utf-8?B?QVRESGlOZFVaamVpU1lMZldkeUprN1MyZGdUZHBxWk1KN1RHZklQSk1QRWpm?=
 =?utf-8?B?amllT1FkMC85ay9yMUdFMGx6RTBFeXZRUlhhMjQ4SlQ0U1Q4WFJNVnZDME9K?=
 =?utf-8?B?Z3F5ODNiN0RUeVNEc1cyQmcyVUJ2RkdtZjZLb2hKTnJZK3ZQcjZYQm9UZjU4?=
 =?utf-8?B?dnhOeFcyRlF5bkY3MVlaRCtSTlNwdEUyUlpDVmxUWUhIYXY0Nk1ObGN4QlQ1?=
 =?utf-8?B?WGFxbHVoUnZHcTdsS280S1lMaGhCbUZzanlnazg3SjBtdGZxanJVQTFDRUxM?=
 =?utf-8?B?SjJLZlp3L3p5dFFrV1ZlUVBUNEZtN0ZvMFZpUzZBQjcxd3NGd2JNNFIzSEwz?=
 =?utf-8?B?M1ZkWUhnWUllRjFBaVFSQWVaTG1TcXJFb1Q0bHk5WGQ1VzNMRHZPck9HbDV6?=
 =?utf-8?B?S1RneWkyMUsraWtvQ0FYQkdDeGZtVUozMkRiVHczQy9NS08yb3JhUm9nNUto?=
 =?utf-8?B?aTZwbStSQWNCdXdLNWR4SFBXNDR2NCtSMjJsdUZjL01RUGxKVkRxVTFJWUFr?=
 =?utf-8?B?ME5hekoyQlc1OUprTDBJOEdaUFFyS0I0TmMrMUZLTGtZYUxuSnV4cklnY0VP?=
 =?utf-8?B?SUtZdXRWT1dpUEpLQWFZN29kb2RzS3VWMkR2NlFMbENuUjN1L1pyazJsWWhh?=
 =?utf-8?B?U1gyRjR1OFBxSDBxNEFZUHZXQ0dZNFg5b2FWUkx5VW5DV2l2dzN6Z3VnSnZK?=
 =?utf-8?B?NVBNTjZvS1FoWVN0U3g1MERCRVZJdTZKaVlYTFN3THg2N2twWHZxUGtkUDI5?=
 =?utf-8?B?cFJnUkVpTThDcmZMaGdwSDhRRkxEQVBiWFZrc3JLMnU2Q0VRcE9wTm5ya2tz?=
 =?utf-8?B?Um9sZzNqUWZuM1JUN2d5VEdaRkQxZnczRU1uRlhTeUJlOVUxdjlNa3RBQTJI?=
 =?utf-8?B?Q1FxRXFTSGZGOXJBRHRITlVueFRsbXZudmZTdE9XTGVYdzkrSC9kczBmRlM5?=
 =?utf-8?B?WnZTbytScVkxRE5jV05xSS8wRG15aW0wL1g0RFlVTWZ1Z2I5cEN2UjBTRWhZ?=
 =?utf-8?B?SXpqUXNjUStMdjhpSHVHR3pWc1QzRHRKZk5QQVlJbmtNbnJ4QU5EcG1odWFp?=
 =?utf-8?B?RTVJNUlJdzNkN0pIUW5QUngwOVE2U1RwUzI1UXZuUnVRaG5ndk14Umwwc3FX?=
 =?utf-8?B?dUZBaWNDZndiZmUyNm5pZ0NDaFZSeVo2UGt3bFpoNGxLUWN4R1dIS3ZpZDkz?=
 =?utf-8?B?cUI4OUV5cWxiYWtQQWRxYjRNZlpicSthNENvcS9PNmtBN0Q4UUxybzNadlFj?=
 =?utf-8?B?bnBDVmNER1Q0bHJxY0s0eStGK1BDdjM3SXZFUlI3Q3c3a0JUUHlGWE5FYlBO?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b7ffaa-f483-41b5-fdaf-08dce88f6d14
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 18:23:09.1512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUT1si4m/86d+lwfVYm+avhGOIPjWw1FpAEqGDYjjA60OFKGZckcw7oxv7QQm7aC0Q8mIufLpgYlXM6t464v1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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


On 08-10-2024 23:07, Pandruvada, Srinivas wrote:
> On Tue, 2024-10-08 at 13:34 -0400, Rodrigo Vivi wrote:
>> On Mon, Oct 07, 2024 at 07:22:42PM +0530, Karthik Poosa wrote:
>>> From: Zhang Rui <rui.zhang@intel.com>
>>>
>>> This is a core-for-CI patch for
>>> https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
>>>
>>> According to Intel SDM, for the local APIC timer,
>>> 1. "The initial-count register is a read-write register. A write of
>>> 0 to
>>>     the initial-count register effectively stops the local APIC
>>> timer, in
>>>     both one-shot and periodic mode."
>>> 2. "In TSC deadline mode, writes to the initial-count register are
>>>     ignored; and current-count register always reads 0. Instead,
>>> timer
>>>     behavior is controlled using the IA32_TSC_DEADLINE MSR."
>>>     "In TSC-deadline mode, writing 0 to the IA32_TSC_DEADLINE MSR
>>> disarms
>>>     the local-APIC timer."
>>>
>>> Current code in lapic_timer_shutdown() writes 0 to the initial-
>>> count
>>> register. This stops the local APIC timer for one-shot and periodic
>>> mode
>>> only. In TSC deadline mode, the timer is not properly stopped.
>>>
>>> Some CPUs are affected by this and they are woke up by the armed
>>> timer
>>> in s2idle in TSC deadline mode.
>>>
>>> Stop the TSC deadline timer in lapic_timer_shutdown() by writing 0
>>> to
>>> MSR_IA32_TSC_DEADLINE.
>>>
>>> Fixes: 279f1461432c ("x86: apic: Use tsc deadline for oneshot when
>>> available")
>>> Link:
>>> https://lore.kernel.org/all/20240929063521.17284-1-rui.zhang@intel.com/
>> The problem I see here is that this seems stalled. No review there.
>> Is that merged
>> in some branch and moving upstream and to stable?
> Not yet. arch/x86 patches are very slow to get merged.
> We can't ping unless no response for 2 weeks.
>
> Thanks,
> Srinivas

Hi Rodrigo,

Do you suggest that we wait for upstream patch to be both reviewed and 
merged ?

It seems we might need to wait at least another week before we can 
follow up.

>> Cc: Zhang Rui <rui.zhang@intel.com>
>>
>>> References:
>>> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12344
>> The right reference link we should have in this topic/core-for-CI
>> patch
>> is: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2766
>> showing the why we need the patch.
>>
>> https://drm.pages.freedesktop.org/maintainer-tools/committer/core-for-CI.html
Following Chaitanya’s input, I have created a GitLab issue for the 
core-for-CI patch and referenced it accordingly.
If a GitLab issue already exists, do we need a separate issue for the 
core-for-CI patch? If not, I will make the necessary corrections in the 
next revision.
>>
>> But was this really confirmed?
Based on the failure signature of continuous wakeup events, we have 
confirmed the issue.
Unfortunately, we were unable to reproduce the problem locally for 
further testing.
>>
>> Anyway, I'm hesitant here mostly because I don't believe we should
>> add this patch
>> if that is not getting propagated to Linus and/or stable trees.
Srinivas/Zhang,

Is there any possibility that this patch might not get propagated ?

>>> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>
>>> ---
>>>   arch/x86/kernel/apic/apic.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/apic/apic.c
>>> b/arch/x86/kernel/apic/apic.c
>>> index 6513c53c9459..d1006531729a 100644
>>> --- a/arch/x86/kernel/apic/apic.c
>>> +++ b/arch/x86/kernel/apic/apic.c
>>> @@ -441,6 +441,10 @@ static int lapic_timer_shutdown(struct
>>> clock_event_device *evt)
>>>   	v |= (APIC_LVT_MASKED | LOCAL_TIMER_VECTOR);
>>>   	apic_write(APIC_LVTT, v);
>>>   	apic_write(APIC_TMICT, 0);
>>> +
>>> +	if (boot_cpu_has(X86_FEATURE_TSC_DEADLINE_TIMER))
>>> +		wrmsrl(MSR_IA32_TSC_DEADLINE, 0);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>> -- 
>>> 2.25.1
>>>
