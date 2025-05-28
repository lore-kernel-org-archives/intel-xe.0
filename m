Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12885C5AD49
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 20:02:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0610E6A9;
	Wed, 28 May 2025 20:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/2tgjg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562D510E6A9
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 20:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748462571; x=1779998571;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5GZkQJCoJHEMBmjXW2M1ELM2ACx0BB605vdFYQ4k3jg=;
 b=G/2tgjg58DqSFAQ75sq4OIkddZaLVHme9P7Y0soCn1hg6LY+tmBr/3Ik
 yKiVvempPr/XCrcn4PEgzKBclbc/NNYiCdQ2hcUV18nd5d8M1J/Wly+OZ
 GpRKS2XFgpcCOoX6wkY3n9Q3Sr5BsA9UUVUWORWIeYjzD/rjWbEkKDboB
 KYknU920lybHoHkv2qHJInSGQpKxhNuP7XTVwhi0WWSFWey6H85FgHqkZ
 hR8w6BrQS9LND83hyiIlc+qxVdTxYoYNvwLGrPTDAmJwPynEXOo821zJ2
 W0pxSGHvyoDRlLbTW1APjrTjL+VAA49wadnnIDSqLk6ixGFJ+6LQ7DDRp Q==;
X-CSE-ConnectionGUID: q+NTEu4mSQWMflSKWHAtkQ==
X-CSE-MsgGUID: QWL8ZR4TTzWdYKaWteezIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="67922450"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="67922450"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 13:02:48 -0700
X-CSE-ConnectionGUID: mvupZ8EJQAuqO4RfzwlxSg==
X-CSE-MsgGUID: iuvD1ooeSPC1aTVD5KLnkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="143800577"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 13:02:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 13:02:48 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 13:02:48 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 13:02:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtVYNolfX/vhsBKEOturVla6egKa+Hdp2mTtKgebB9yj8cq6BvOK3uqpbxTyZUCrlzqjjDosPMvD/krMnUihq9jcvHAVF00mv4MJUzquXQRKaGSeWQKE8U93yoRSbNm2jcGrewJGAqF6mnJFb47ozzNQikkDtoaAUZW7QeOTd4NUcu+bkpvhgrxQ2jgWf0cc36YwEyuv50QlHaLxcGp+57MCQ1/3tZCIysAB8Efu8NNIthGDxDbBMkA/3zxRCZ66pvixXKuz27F22naKGy8EHeCwtMMAsj7BlM49mZkKnf0Wg70m7affz4z6Y6f3O39cBKS5dacO65/4yZ625OqIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jcuXKH0vmbxN23W0ulZnTHJi1jK5kgreNQ+nN88BjA=;
 b=En0kd4p15f+eBbWRztm3oeRhoBcBlpMWLvcPVmyT7SSXMEe6yQ5LtLUQNbfG8gLorrYiTLfPeHMSxRf3zNlWUHdYIR1PdnWgMHGSH19kmRRQL1AarsTgGCl6MPMKzjyoNgD9uK8G2x8PGc2unm5J0aRnbPglzRfbpFZ315jTDduDhzWrxkP9ZDgR/G2zpmohNgyy6/bTO7iQKVfdCXhuwY5eOV8qSK6fu4LIyfr9cP+dA//S55hMTvjttxtmdo0Bx3nhDgCnxONrywzfQy9FwX18S6++072ZG01ISQEbxXeaIxZjh6+43DfDW6n1pKHwdzOpRoipxQbbgmbfTo5/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.25; Wed, 28 May 2025 20:02:31 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 20:02:31 +0000
Date: Wed, 28 May 2025 22:02:25 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Tomasz Lis <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Wajdeczko
 <michal.wajdeczko@intel.com>, Piotr =?utf-8?Q?Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v3 4/7] drm/xe: Block reset while recovering from VF
 migration
Message-ID: <75aq2gastxnu4l5c3izbvniqzpwyfk45ux5oedfrwg3ir4kh3h@fw5zpvvek36d>
References: <20250519231925.3196154-1-tomasz.lis@intel.com>
 <20250519231925.3196154-5-tomasz.lis@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250519231925.3196154-5-tomasz.lis@intel.com>
X-ClientProxiedBy: VI1PR04CA0088.eurprd04.prod.outlook.com
 (2603:10a6:803:64::23) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: c9fe522c-c674-4b5e-f5d9-08dd9e229329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEpKS1FwN3ExS056UTVNVmFuZ2FWOGx6RG5uS2oxbVNxODlsUUEvZnZmNlhF?=
 =?utf-8?B?VmJnZnNUZEpjY2kxT3lRdm02TEZhSzd1L1NkY1FRWEd2T2EzZFdoR2FWSjY0?=
 =?utf-8?B?UHZ0TWgxczZaUkNLVklIcUxtNit5OWcybFZUSVRIR0ZjY1U0WktJUThlK1hB?=
 =?utf-8?B?RGo4WVc1bTZhMjJOMzFsemlkZ3ZhWHNmYXFQMitiRVY3c25wR0V0SWk5dnBr?=
 =?utf-8?B?SytjUDQwMTkvcWdtSEcrVmd0Y3pPM3hvVFFKOFFTR04wM1l2WW02NlUyZVBs?=
 =?utf-8?B?UUYxTGNMZ1FWZTdXYVdOc0E0WVZWd3ViKzBXdjExbERoTjhaaGQ3TEtLVGJK?=
 =?utf-8?B?NjVKMVNqTjQ0NDFkYTQ5K3VYSGJXYjl2UlNSWXlXbGhZUnVtQlFkZHg5RWpQ?=
 =?utf-8?B?b3hvcjNuMGdic0xNZ1hnMkJkaWVhcUpOdVBVbldpRXB4N08rZzhqWXdSazlT?=
 =?utf-8?B?OVVHVXVuU2NuS1pXbklPYmM5VzVYRlQvZHE5NkJIZEFPTXVYOFNpTDNKRkJJ?=
 =?utf-8?B?SWwxVStxZzRVRGxLY3NPaEc4UXA4eGY4TXFOc1YxN3MyWldjRjVRQ2NUa052?=
 =?utf-8?B?YXRUYTZJVGhBbzBKTVFlcjFFOHVuMHZJK2p1WTBrQjI3VXFLUG1oU0FTK1hZ?=
 =?utf-8?B?cFJYdW5KbS9YRXlkZlEwMGllL21Vd3RqRDVwa3dXZzhRN2RwaGNjQ3NxMWE3?=
 =?utf-8?B?L1llODQxQ2U2WGtSK3FtVVB0cTNRL01BNTRQOXJHZ25OVkEzWUFTb1REWHIz?=
 =?utf-8?B?OE8yR3RBYk1EL1doS0FKY1JCclpXS1ZETzlxcVFaR2xMUjByaHFQT3d5dVJp?=
 =?utf-8?B?R0lTbCtWZ0dQdUZqbmhLOU5xQ2RjVUFwblRzZDBueGdTT0kwV25vWlJOTmRX?=
 =?utf-8?B?Q2FpdE0zMnluREs2SjBGa1BvTjlYS0tuTUZoMUF6QnhwdE80SnZ0SEtOK2dv?=
 =?utf-8?B?TXNuZ1R4MXNDc0ZMK3R4akFBcmErOGxpTzU0VEdwT2xZTm5INEtMVmxoaVZk?=
 =?utf-8?B?VDBLSS8zTTM2L2xRaG16UGM1T1MvV1lFRWFubk9FQkpoYmZsdXJDN0NxUDdD?=
 =?utf-8?B?OUZiRFRZb1lEcy8rdWl2Slk1ZzZ4a1M1VHhLdEVreFh6c3E2cENnNHdjaHAz?=
 =?utf-8?B?ckx6T3g2TjhQU0JhOGdLS2tRSUdDNmZacm9WeFdPcFNtUHJaYWw2NlNPWHBY?=
 =?utf-8?B?bDcvcGk1T3o0QTF6SlgrMFlXTHNRcFBkZVNZb1RpNkk3YmNuWm5wTmhEeGpO?=
 =?utf-8?B?MVhPS29VM0J2a2hxcStsT2lmeEJLWjZtMlEzWFA1ODZOOHZza2ZPRzkrK1NG?=
 =?utf-8?B?Mi9UcmRwR2FRd1NJRTNBQUxsOWptbit5R1V0ckdYeHVaNGRoemxXSFNNSmx5?=
 =?utf-8?B?eWMxRmRTL0dMUHhwWnkvZE5oMFg2TTZlU21oWnMycFVjeEJoczJpOGtkTGxP?=
 =?utf-8?B?a1pYaFdXaXplR2J2TXpKc1hCMnFpRUsyNUpXeVJVNVpzQnM5VGdUemJVYTBu?=
 =?utf-8?B?S08xNzFoTlFGSWJ5MUlFb1YwRVlyZDFOWkMwYnRJdU53N2grR0VPbG9wdndi?=
 =?utf-8?B?SlRGWDBORUQ1Vm1Cb1B2MlN2UlpmTWxjMFdoOEFjVTAyRUdaN1FQYnVSa3Bn?=
 =?utf-8?B?ODZoSUs3WlJZckpISWFuU2pqaEVkS3QxME0rcSt6cnpnWjNEZW8zRmVIQWpq?=
 =?utf-8?B?M3dQRGpCQkg5eHNVU1czM3hPY1FZSGdUSWErV0xoSmtyZ0Q3NHpSbzhzU0JK?=
 =?utf-8?B?clVoU2s3YnpaS0R6bHhxZHdmRjNWWnZzUEJ3Q2hpSW5xbWNFczcvVjkraTdM?=
 =?utf-8?B?L3ZiNW9VbU5yZXcyOFlEWXFjV044SEtkWDR0Z3B1MUQ5UDlLTUtoc0tlTy9w?=
 =?utf-8?B?Ym5maWpWNlBCVEJEaE9rY05Pb2hiaURtcGh4NlN5ZzJSU1l1MmhyTm5xa2dz?=
 =?utf-8?Q?VDX7jw5yrvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTBjbGxLWlFES0Vhb29jUmtpNlRud0pzYWR1OU02RnJhZURrM1BRUUF3SjlE?=
 =?utf-8?B?dkhLNHRNWlZHVHc0dzFiSVRqZk1mYUwwRXBLanN4S1N6THVpV3hYWi95ZkUx?=
 =?utf-8?B?V3Vvd1JEUmZYa3hEMVoxd0dyUXBBTlVRSENpeXhrVHZuUW55dlNEK1BTeC9r?=
 =?utf-8?B?WGp3TExuZE5rUFlwK3JDN2RsZEN0aVd4WGwzM2xaelRvblo1WlVLVGZFUjdo?=
 =?utf-8?B?N01xR2VaQjVQVzdnM21zb1FXaFdta01yalFra0lSZC9CTkIvL29NV2VPTlhm?=
 =?utf-8?B?L0hpbHB0VjVDdHR1WTJ2a05vM1c0WXJFbk5kT1d0dGxkdXQ1c3pxbjlvOVU5?=
 =?utf-8?B?ckdjZXVyOVh5MFlyNS9WZEdoUEZ0dWhybDZ4SWlDRTdiOFBOR1UxUXR5ZnBQ?=
 =?utf-8?B?ZDc4dHB6YWZweWV6THUwTlgvNEtuaEZLRVVYNzFSSittaEhyTzFha1BjbDhN?=
 =?utf-8?B?RFlkNjN4d3c4WlRmd0hKMDcyQjR1RC9mZHdCRjdnenh6TmxtcHI4Qld3dVVF?=
 =?utf-8?B?T2FMMFAxU1FDNWJ2UzRJNTNaRFhUR1FzZkRiNGtZaWNiOU5zVDM1M3dwMitY?=
 =?utf-8?B?VkplM1ZUZmxGN3htUHN0Q3ZaK0ZMdlV4eFNuWFhBMHErM3F6U2hWWVBTRkcx?=
 =?utf-8?B?dGJPNFpoZlV1ZmxhQXVmQUdtOHJEdE1TM252S2JBWGk5dEQ1cnpOdlBBRTdx?=
 =?utf-8?B?b1paVUlrZCtNL0d0OUFCMHZzVHphRDNLb0VSQmJkTnF4OWNKcnJ4UWkxOGZr?=
 =?utf-8?B?L2ZlNmJoUHV1U0ErMHoxVk5HM1hmUEhqM0ppVjlTaEhRVzRQMmhKU2hnWG5r?=
 =?utf-8?B?NEZyTVRVY0pQcUtWM3VDeWxCQXpHTXRjM3JVNmlCMlF2NHQ0cllhczVYTzg1?=
 =?utf-8?B?YmdmaDFHMGhJcTNLQnpjUWdBcHk4WFlxRWFPVUcxVjNnNnZ6TFdKaDRZc3Jo?=
 =?utf-8?B?RmhoODlNWEJVaVd2K3BKSVpFcStFZWZ6YUJsVXNoTXRUMzV1U1pteTdiWkFr?=
 =?utf-8?B?MmorMWJqbno4MlRyMmhEV2JRbTBiY3Z5UTVJd0UrWW5reTV2NldXdVRTNk4y?=
 =?utf-8?B?MEZrSmZ1VXV5eHVrelh3WkphdmUvM1BJQnViMExIN0dmbENKakZ5NE5yUlVr?=
 =?utf-8?B?VkJGTTdnOE0wYndnT0hEM3NWRytYRUUvNm1TMEs0SjJteTMrcW96YVlYcDRE?=
 =?utf-8?B?ZEg5eUcvc01aTkc1dkp6bG5uLzFOOW15ZXVpWVFJYnlMZGZCTzlGelVCZ1py?=
 =?utf-8?B?RUxPUVpTSzU2cVcrSlRCTjJzVDg2NkJwcVZJK0hRUVRQK2lpdHo0TkZ4REZ6?=
 =?utf-8?B?L29vTWhnZVpYZUV4OFRJbjVxZFpPRS90NTBZQzJCb1Q2emFrdDlMdmhZUi8v?=
 =?utf-8?B?cmpUSFJqSjl4SE9MTjQrZkg2NFI3SnV6NFJMWnNvVFB1R25PdllQYnUvM2lo?=
 =?utf-8?B?aGRYVkxjc2dVZUpYRzBlODBzc0JLRVFScjVoQmoxQ1JQMDgwNitPQVpyKzdR?=
 =?utf-8?B?VkZvc1RIYTVsempYbTNvQkc4V3FialNKNTJUdityTkNQOTRmeDJQWUJNekNn?=
 =?utf-8?B?WXN0NFBMMC9qT3c2cmJpc09XL0d5dHg3NWtaQWtKN1J0OVZNTmc1RnBXRlBH?=
 =?utf-8?B?UTFSUGFHM0Jhci9WNTBhRC91eWRLMDE5Ylh1L1FUUCtSNG5XSkQ2aDZUbUhx?=
 =?utf-8?B?NjFZd05SSzk1TURhU25KK2QyRFJucUxYeWl6bGhReUJ2SGdoMHFzc1lFTnpI?=
 =?utf-8?B?YnZiVDV5ZWFwSUxrWitsRVFMTWcxSWRlWmxVSVB6bjV0ZkFJZ2VOemlHblFN?=
 =?utf-8?B?L213NVQ4NHRPVzVsRE5oY2hWUlRKVCtNVWU2eG9QUHJQckR5SFN0d3pFVUpq?=
 =?utf-8?B?d3dVOHNjYitPM05MU2VVdFJGMXBBK0c2TThUODY5RTZxWkFZNTVKdGlaQXB4?=
 =?utf-8?B?Mm5hQllZWmJRL1B4bHhjTDBKOUFzNWpsZHZTRzFaMkxwakFQOWxiaUtvc1ZV?=
 =?utf-8?B?WWNVaHQ4WDRHL1lYcnZmYWNQTGkvQnNUZWV0T3dJTlNQZndOTWVPS2UyeTZz?=
 =?utf-8?B?QkhpdGFnbitjVWl1VlZSeWxVM3M5QmlFd0NOeGRsdWNUd2c0OEJZYzhlcjNG?=
 =?utf-8?B?ZHdxclpGdGZidmFTeHIyRVo1U01taDdDUC9vUXZzbmQ1bkk2bklROXhrSWtW?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fe522c-c674-4b5e-f5d9-08dd9e229329
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 20:02:31.4219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sg/Rl650s384TKM9pWd2gUWvHVPMWiCHq+iEZufpb28A6NwVyq5kamwOdvaiqn6lvaan7AwFQvjoVTT1fk94uLDP00aGVpCkOmjKwKLe9B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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

On Tue, May 20, 2025 at 01:19:22AM +0200, Tomasz Lis wrote:
> Resetting GuC during recovery could interfere with the recovery
> process. Such reset might be also triggered without justification,
> due to migration taking time, rather than due to the workload not
> progressing.
> 
> Doing GuC reset during the recovery would cause exit of RESFIX state,
> and therefore continuation of GuC work while fixups are still being
> applied. To avoid that, reset needs to be blocked during the recovery.
> 
> This patch blocks the reset during recovery. Reset request in that
> time range will be dropped.
> 
> In case a reset procedure already started while the recovery is
> triggered, there isn't much we can do - we cannot wait for it to
> finish as it involves waiting for hardware, and we can't be sure
> at which exact point of the reset procedure the GPU got switched.
> Therefore, the rare cases where migration happens while reset is
> in progress, are still dangerous. Resets are not a part of the
> standard flow, and cause unfinished workloads - that will happen
> during the reset interrupted by migration as well, so it doesn't
> diverge that much from what normally happens during such resets.
> 
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 26 ++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_guc_submit.h |  2 ++
>  drivers/gpu/drm/xe/xe_sriov_vf.c   | 12 ++++++++++--
>  3 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 6f280333de13..69ccfb2e1cff 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1761,7 +1761,11 @@ static void guc_exec_queue_stop(struct xe_guc *guc, struct xe_exec_queue *q)
>  	}
>  }
>  
> -int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> +/**
> + * xe_guc_submit_reset_block - Disallow reset calls on given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +int xe_guc_submit_reset_block(struct xe_guc *guc)
>  {
>  	int ret;
>  
> @@ -1774,6 +1778,24 @@ int xe_guc_submit_reset_prepare(struct xe_guc *guc)
>  	 */
>  	ret = atomic_fetch_or(1, &guc->submission_state.stopped);
>  	smp_wmb();
> +
> +	return ret;
> +}
> +
> +/**
> + * xe_guc_submit_reset_unblock - Allow back reset calls on given GuC.
> + * @guc: the &xe_guc struct instance
> + */
> +void xe_guc_submit_reset_unblock(struct xe_guc *guc)
> +{
> +	atomic_dec(&guc->submission_state.stopped);
> +}
> +
> +int xe_guc_submit_reset_prepare(struct xe_guc *guc)
> +{
> +	int ret;
> +
> +	ret = xe_guc_submit_reset_block(guc);
>  	wake_up_all(&guc->ct.wq);
>  
>  	return ret;
> @@ -1849,7 +1871,7 @@ int xe_guc_submit_start(struct xe_guc *guc)
>  	xe_gt_assert(guc_to_gt(guc), xe_guc_read_stopped(guc) == 1);
>  
>  	mutex_lock(&guc->submission_state.lock);
> -	atomic_dec(&guc->submission_state.stopped);
> +	xe_guc_submit_reset_unblock(guc);
>  	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q) {
>  		/* Prevent redundant attempts to start parallel queues */
>  		if (q->guc->id != index)
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_guc_submit.h
> index f1cf271492ae..2c2d2936440d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -20,6 +20,8 @@ void xe_guc_submit_stop(struct xe_guc *guc);
>  int xe_guc_submit_start(struct xe_guc *guc);
>  void xe_guc_submit_pause(struct xe_guc *guc);
>  void xe_guc_submit_unpause(struct xe_guc *guc);
> +int xe_guc_submit_reset_block(struct xe_guc *guc);
> +void xe_guc_submit_reset_unblock(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
>  
>  int xe_guc_read_stopped(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
> index fcd82a0fda48..82b3dd57de73 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
> @@ -150,9 +150,15 @@ static void vf_post_migration_shutdown(struct xe_device *xe)
>  {
>  	struct xe_gt *gt;
>  	unsigned int id;
> +	int ret = 0;
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
>  		xe_guc_submit_pause(&gt->uc.guc);
> +		ret |= xe_guc_submit_reset_block(&gt->uc.guc);
> +	}
> +
> +	if (ret)
> +		drm_info(&xe->drm, "migration recovery encountered ongoing reset\n");

I'd suggest debug level, as it doesn't seem all that useful in general.
But I guess you want to have a trace that this happened and the handling
of this scenario is somewhat iffy...

>  }
>  
>  /**
> @@ -170,8 +176,10 @@ static void vf_post_migration_kickstart(struct xe_device *xe)
>  	/* make sure interrupts on the new HW are properly set */
>  	xe_irq_resume(xe);
>  
> -	for_each_gt(gt, xe, id)
> +	for_each_gt(gt, xe, id) {
> +		xe_guc_submit_reset_unblock(&gt->uc.guc);

If we were doing migration recovery during reset, we'll change the state
of guc->submission_state.stopped (btw... is it possible to decrement it
below 0 now?).
There are "some" places where we have asserts that expect a particular
state, and some places where we use that state as an event (combined
with a waitqueue). Should we wake up the waiters at some point? And
perhaps synchronize with the places which depend on being in a "stopped"
state (if at all possible)?

Thanks,
-Michał

>  		xe_guc_submit_unpause(&gt->uc.guc);
> +	}
>  }
>  
>  /**
> -- 
> 2.25.1
> 
