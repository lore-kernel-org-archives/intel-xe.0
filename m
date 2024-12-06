Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E914E77173
	for <intel-xe@archiver.kernel.org>; Fri,  6 Dec 2024 13:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C6010E199;
	Fri,  6 Dec 2024 13:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daGFFmxL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5755A10E199
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Dec 2024 13:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733492382; x=1765028382;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=zbTIVusPU0jG7+wHgtSGDFF42ZbCF8X/jsO7OFJzQ8I=;
 b=daGFFmxLVpdKP30JjtgGppHfHs+9T1fnbnBdRRBIgT+MWX7X36moLxF+
 K4szFnY7yRPrR/2Z0Vp0QW9h96+MMM0PP5nJTSIQKiVTUICfW6BaLrMmu
 Ql0Yjfq9OMhrYSbGYii7ZFQlZGA1f6EooIzWbu3OF3fbRNiEqOoYjsWif
 2cgtfqBqxMOBzpsu92JVw5EalpgXcRF/IApZAcdcC77CRuJDiEFIe7MM7
 ik7u7Lu/LxCPxMpujaTJNWjXelr/EoSRO3dTAwZUGaG00qVO1LoeYYoxh
 u2frdn0iv8CtFFUwI4incadMbk2shUJ6GK8oTQEg5cJvwECaTrvWe9MC3 w==;
X-CSE-ConnectionGUID: H4iiskxsTc65XCw7OZShLg==
X-CSE-MsgGUID: 3NM1dEPLTHWo4c4j0HzHnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56338113"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="56338113"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 05:39:42 -0800
X-CSE-ConnectionGUID: RrrF6jeKSNOhaS3QsAtn0A==
X-CSE-MsgGUID: twWljSEqQIKIFeo5RGrB+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="99362854"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Dec 2024 05:39:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 05:39:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 05:39:41 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 05:39:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=woAxXiFuxBWpYbWL0UK1qHek2idbnR2GsJU32jCYm3ozIBA9+qXqAsoaDmWHpGiMjl6Ca3YuYA4K1DplaK7ZKNWC/1yholuSqp1C3pwCKsBJ5CuJO2RBV5KzvHInbLqLhcGTCLBG5bnUSnF39HbX80Ud+gtqBohAB1q+1V4bqq4WIoQj2RRlP1Vl0YV0cnIvSz8ndMyjzjFS6VfFDN24OJgbRbl+bFCU/HNQtBUcO+2JQHzKeKyR1UCJyGq5Br22f0OO/1xwTozZsaouU4Nu3iTQqO7neX5avVV9lMBa1wjQCBOo37RCY58FCKoxjr9jAfuaq1eJSWC5cVCi9UMxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMopT7VxzmLts1Hib0Jc5hgXqSRQrsVWRsN9nOAYwA4=;
 b=KRDXHY5i+vS/W0xtz3sv7//wN+KXCWrUuxcgQB9U9kKOGN9FH6/SqbfV7T+egEt/f47LPHtk2js64TsJwURFqYYK/oPR9qlN6uxt5NcudZjSaUD/vvigSP+CPmJuOZfuP2yjEHd6DoQQrKiflpIjfuC4scXEbyTAs3Go5DWhCZQqZTfgYTwGul6iIQL1A5NWNcUP4o+2l5fD53IYLQ9VOsN5qZPn3K3GZjC6VNVu6mu8RH40RJxi+lvupvNC7XpTMBGQbg3c2SUVVq6u3oaclGo/y5zbv+pGZW925OzQoCK7L1LjiK4oRIWegTEfwK1YrFzmh4DfYKaxiL/DbI2wtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB6350.namprd11.prod.outlook.com (2603:10b6:8:cd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.12; Fri, 6 Dec 2024 13:39:38 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 13:39:38 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v1 0/1] drm/xe/vf: Allow VF direct access to extended registers
Date: Fri, 6 Dec 2024 14:39:28 +0100
Message-ID: <20241206133929.891568-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5e49f0-0432-440b-eccb-08dd15fb6e1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjEzSXpOaFpaOVp5bG1CUTFuVEFrZXNmN294SjFQYVVXM1pENVJvWFVYMzdP?=
 =?utf-8?B?NkdjZnlZeUNIUkxUM3dLWjFFSnVBQktFaXZNSWQ1UkprYnozeGoyZndYRXFi?=
 =?utf-8?B?TEdDZHo5Ni8rMXNtNUU5cWs2ZXFVYVFYNU1SNDBwcTRhVkVLdENZdVpGY3hS?=
 =?utf-8?B?WC9MZys3YStibVRsYkw1bVowTDZEc3FBR3kzNCtGMCtTTzMzbUZycFpFa0tJ?=
 =?utf-8?B?WHFmVTNoMk9sdmp0RUJmZmlvS0tMQjlqaVUvNnMyVElMRVhwMzRvMFpody93?=
 =?utf-8?B?SEg4K0lNOG5HbDVja0dzYm5xcG5JMVRtSGtKaGdTTnpTaXcvQmJ6RWxTdU1y?=
 =?utf-8?B?T1N6Q2lBV21hS2ljRjZCQzVtdk8zRjJuUlRKSU5SMmtFUldoeEMvWTIycm5n?=
 =?utf-8?B?ZWlITTBJdWl6RTI1TUIvOW1XVE51QUJzejRtWEg0WVF6WS8wNjJmdFFMbFAz?=
 =?utf-8?B?Mm15UGx5azZUUy9VN0VpZytjSlBLQThvaUljNnVpc21hUFIrV1Y0Z1pBYWZk?=
 =?utf-8?B?NFhwSkRDdTR2aEFlMXc2YkswdXpLNXIwSUprdHd3dTFZcVpYL2E4QzFNYSth?=
 =?utf-8?B?Y1JwMlRKZ0M4NTB4V25Ic09xQmJnMEZTQ0JOb3cvWHhTZTVFcjI3ZnViUGZD?=
 =?utf-8?B?UnovRUpMU0xueE5xV0ZEbmdHM2ZhZG5ZK2VvMjNVRWhTTmd0R1FOQ3hVcE0r?=
 =?utf-8?B?UlBOckptTGtzZ3BzNDNUSnUrK1ZCeXVPbzFma0VzL1BaYnlORzZhdnNoOWFT?=
 =?utf-8?B?MVZDaGlsRDFRbzRITDQvbkwyYzZzcktBenluWXdBR2hZMER2MVpZY216MFNY?=
 =?utf-8?B?VWlzM09XQ0ZVdkdCcHdDOWxndlVhYmxSOXZvbkN5eEVUc3dSMEVvRGliZlcv?=
 =?utf-8?B?L1lNdUs2OGE0anl6aFRDK0N6SlJadXdkNzZ3SkIyTDlrakFYU1pqSHk4ZG11?=
 =?utf-8?B?QkhuVFhuU214UTR1dStnMDRhNFhSTnVSQnVRSnJyN0NWODlBKzNJNEdadGND?=
 =?utf-8?B?Y3J3RFIvS1FZcEpka2JCdGhIUHplUk9IcE1mV1Vac3BTVkhwQnljRFk2R2tZ?=
 =?utf-8?B?c2hkNFo3TXBpeU5QdFVrTy80aUgxbzNWd2pneGFuNlVYd3BjYWtWbDc1Njda?=
 =?utf-8?B?aTVKTHBITUg5ZUJqY0RJUm5lK282c2Vta1JOZTNkQ3NlcUZTeHNBYmxqOFVh?=
 =?utf-8?B?R2h2NmN4a1ZWTC95cHB2UW1Cc0xpRzFSZ29KaFZqdFhmTDBPNklsUUl4aCtQ?=
 =?utf-8?B?WjZydU5uQmlWZ3h5WGdyaWlmUThlc1Y3SDdPeU0wQ21Ia3dhN3ZZQzkyOEts?=
 =?utf-8?B?WXdKaytMQkZIeWQwVnA0R1pSNStIUDNwNVZYTDJvWEZndUtYbm1YRmFvb1RR?=
 =?utf-8?B?WUhMSlZCS256Q3hHcUwxci9zTlhjT0duWitRR3JzazVEOGNPckczWHN3cGc0?=
 =?utf-8?B?dFJTZGFkZWUxb0RXSDF5OFVwMXRCRzJjam9rb2ZLa0RRQlkzNW1DSy8rcUU2?=
 =?utf-8?B?MUovR0o2bzFQOVllV3ZmZy96cTZXZ3RqSWQzU2RrTE1zNDRBOGRhSDhjTkNY?=
 =?utf-8?B?L1AwL1JnelFDdnZ1UmxUN1pwUnZ6amxHbUNyY2o3cG9ScTR2ZGx0Y3orZ0VQ?=
 =?utf-8?B?V1ZxR0I2bWNkc2RrUDNFOFhrYWlBcnFnOHJBZ2dpSVM0bERLclFtNFN1bUpO?=
 =?utf-8?B?akJ0ZHdSeEVIbkRUU2JLWjlqd3F3aFppeDZGdk5mM25ZdkJnTHlsSEhiQ005?=
 =?utf-8?B?M2xIVlhIQzdKbXdwVDc4cDJ6UVFxSldQK3dEWGdPa2lQNWpBQVpHU3Jmck5v?=
 =?utf-8?B?bEF0UFpKeXVqUUthR2hjZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVcrdWpGQnRLS01McjdhVHRhbFRSRFlnZ3RkTFk4R2IrYWVId2IzMnhxM3Nm?=
 =?utf-8?B?RGExWnRiUG5hczY3WUpHOGp2MExQTVV5cFpJQWp2dWphK1k3S1BTaEx3dTZ5?=
 =?utf-8?B?eDFzUGhzWWo2VTBMRlhacmZ2cGUwa2ZOWDl4Y0pkeW1YVS80cGNsVnlubEl6?=
 =?utf-8?B?eW5LdFlEeTNySTJtVEhITHhrY2h3RjRLVTl2a2pZVWhDbXovTW10eFhaNU8w?=
 =?utf-8?B?SGRBdkUrWXpneC9VUVJJT2pCZ01CcU0yNVJhNnFqVERZOERRVlA0S3pEWUJR?=
 =?utf-8?B?SVVwSTU3Y2dYdUlWaWFyMGxlejNpVDNTakZieHpCa29WanVKV2MzcE50THRp?=
 =?utf-8?B?VWxOeDE2N2ZUN002VlUrTU5sK1JhV010TnUramQzNGpSU3JtQXFBWGRYbWQy?=
 =?utf-8?B?M1RtejloSndUN0RqSVdod3ZZbkRsT2MyK0RYQjZDRVJYZElhUEQrTU1VY2pz?=
 =?utf-8?B?NXQ3SlFRZUJkYlp1c3ZXUDhVQ2grblNweVhyS25pdjZmcnhOcVVXSUIyVW9S?=
 =?utf-8?B?U3YrTXhjaGhPYTUrcDM0M2ltVHo4RzZTWmZUSVFyOXVEQWcwb2JLSUJEaVMw?=
 =?utf-8?B?cjJNZHAwa3R6UGNOR2VGNC9TRG43clJLTTRTeSsvZVZKQjkzeXFKY1VJalkz?=
 =?utf-8?B?aEs4ZmRiSzJoMmFROXF6Wmp2SVhqNTgrbllnaENYV2NmQk5UaEYrcUorQVJQ?=
 =?utf-8?B?MmhPWTNrUnlQSzA4VTZqQjM4K1p4dHBLbnZuQ0xTcmZPU0pSM2lwNXZRYzFC?=
 =?utf-8?B?L2d6R1dSdHFnVnY4ZlR0aU5vS2oyenpwQ0dVYlJDalNSUEt6Y2lIRWF1cHNV?=
 =?utf-8?B?QjYva2hkUUdhWEZhQlFNQXkwNHk0MmcvbGFBK25tWGQ3SGVidHdiZ0I3akhO?=
 =?utf-8?B?dXYwM0pMTDRTYmEvM3RRNk1weXFoMjZ3aDYzZytrRjdRbzFLZDNRNmF1Q0hN?=
 =?utf-8?B?akdON3pXb0VZUlRVd3hjRDZoc0NHaVR3WTJGTTZCRnFuYW1GanJTbVdSU2s2?=
 =?utf-8?B?aFhJTzAxQkFTcU42azVpMFNQdUhzRGxWTmJldDZFaGdSemdYSDJaanNwNmRT?=
 =?utf-8?B?Z1h4V0l2VzRFcUs2WkhkcVAwZ3NIWk4wbHhLemhqenlITFdVem03NW01QW11?=
 =?utf-8?B?cjZOMlNtN2p4MWNJTzgwQUx5ZU9jeUc4Nzc4WTc0d0grU1NxWHN5cUNqOWly?=
 =?utf-8?B?aUk5UUphZ0k3ZGdxZ3RacUxSbkIzbHJBNEowU25FMDhJNkdKVVYrNFBNeVFN?=
 =?utf-8?B?SlgvQlhvY1VOMGFGd2tBQ1gwdmJ6bHd1WXNLV0hsbHRVbnVuaE1CclRBZDFQ?=
 =?utf-8?B?VXpEWEVUeU0vS3Z2REhrWWppUXBHSWdtOS9vcDEvdkVKTGZRVVNtMVFmVzN0?=
 =?utf-8?B?dVV4N0JqRFY3cFdwc2FuaGdKRmtneG8vL0grSUNFSUMzS3MvWnhPSE13Qzlx?=
 =?utf-8?B?K3MvdEh1UFBmN3JNK1p0ZEZRTmZ1SG91endmei9FTmVBSGxScnFJM1NpZXFx?=
 =?utf-8?B?Y0lQUXdQNVVoVURXMDVVdksrQXEyZWJiWUtMZHdVMjVmcnNtRG12cXpqQy9q?=
 =?utf-8?B?d2RWallYZHhqa0NnNGRRTlFZWlI1VWd0WkhrV1dUU1BodWFMVzlEenlneHlV?=
 =?utf-8?B?cFZ6WTAxRW5BbFFPQkk1bTgzY2ZETkNqWTVXL0FRSjVTRXNFUFpnVjF3N0gy?=
 =?utf-8?B?N2RVQ0xWQkJLK2JiWnB6K2t4elJjMFFqV2JhK1BKeDFlNGJUaU5ZYmpWMHNt?=
 =?utf-8?B?K0M3N1NwZ1pVMG10djZFbm1wZ3JGREhSS2ttSE53ams4ZGtoOXJOUW9Xd1JG?=
 =?utf-8?B?MWM4WDk2Nk15b3U3UTM5ZVFGdGk1RjFyOTA1R2N2bTR6NEc1ZDhMelFyTWFt?=
 =?utf-8?B?SWp4d3psa2U5ZU9ESXhvQ0ZUSUQzaEp0RElKa1lONmZNV3F0dmx0RVR6QUlj?=
 =?utf-8?B?Y0tBSDJ0azhvNCtxT2xQNm5KMDVGK2w2aXJhYkFUK0F4UXF3NTdZMHRaQUZt?=
 =?utf-8?B?YUFyZTcvaUllUm5hN0laenpZS1l5SVhtaEh2RE1IK3FwTUN5Y3h2QnlXL2NK?=
 =?utf-8?B?KzdVRVBlSzlYZkJsTFdXTVE1ZU03YUZ0OUM4MFdJM1B1bHJURTNpcEluSito?=
 =?utf-8?B?OGVTK2g1V2c2YnRTUE9jQzIyYTJCcklYSTJQL1pSRlN3ek1UUFdEV3FTL2Ix?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5e49f0-0432-440b-eccb-08dd15fb6e1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 13:39:38.5907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhugyU6U3VnoRsMy5on9CDX7ivqpQlbl09FM9CXYKD7raCjGcN5FQRR57z10pHq54WYfZF7rG3Ole6+iqdIpzuUTLWQmNfhBPqmEdM4l+80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6350
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

Piotr Piórkowski (1):
  drm/xe/vf: Allow VF direct access to extended registers

 drivers/gpu/drm/xe/xe_mmio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

