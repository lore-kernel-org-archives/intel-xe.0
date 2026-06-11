Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C90CD98C7
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 23:08:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F110F1C4;
	Thu, 11 Jun 2026 23:08:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SpkJJUL7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BA210F1C4
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 23:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781219298; x=1812755298;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=/hViZ4qN2wjfTzMKYIDVoOfil06LXvEQgjikyPkg/rs=;
 b=SpkJJUL7R6uIpkbOdAocY6Z9K+ZdFRX2b/UMkE7w5f6+WjdT4e6kz56+
 qkmS85fadfxRAsKmXcwpZaZ3xVi5lRLMl1lSPJGCmqvfDU0aUegN4lfmy
 dVWTn/BauX40s9pPcDdHwFyyXZvE8lUQ5pHkPFmHH/m5RiMBFdor4Qo0x
 y6UhHhkunbx+/3fgj7I6LCpr6cBA6M81P37g4luHjS9BSeeUFWv1IOjq0
 HhoY+vcNQSGhEWvN4qs6wMds80wzF6WsyvR6Gmax16wPSnzlrU50ev5o6
 JizgHf2FeeMKw9NKA6KN6WxbJSN1JVMXbZTscRvHGafsOb7T6UVVpgcgu g==;
X-CSE-ConnectionGUID: XhWNMTFmS82kQcyB5UKFbw==
X-CSE-MsgGUID: o4Xe6sPDSzmsdtRHuKSe8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92613836"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92613836"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:08:17 -0700
X-CSE-ConnectionGUID: 1dCYTeWHQpqdlvH9YPqrxw==
X-CSE-MsgGUID: 5eYQ6TXcReGIxLCKo0AVxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="251583423"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 16:08:17 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:08:17 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 16:08:17 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 16:08:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3RExDEwGo5wXbUIKw93fp4mSo2t1xOYXVLURdiOgUGccLunTmNx8krDLX7o2x3Khsg5N4PR6O3G6tZIC30vmFWonUjxK2u081G0g6m7q85cmJjSPy2VeGPGWncqWc/SFwgiUOEA+c9Is2QbgZcIYuab2V9VWiUlF5CEqaTUCawS6xsAGgnfkM8Y79iz73cfZ9rdIzXBUx6kaaGtweJqdnws/JBCUBphSBRGyHxsNLJbNc/NqbMnWUZlDAfHlngcQlA+bdM1B9hdcuclfvEEQoOqtVKCo5YTZRoFLl63kV11uoqbCJYHmrgZCwWLe397l48WvGFNHqoOzKrVtyomyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/hViZ4qN2wjfTzMKYIDVoOfil06LXvEQgjikyPkg/rs=;
 b=hYfZSrw1wmhCK76vmhfwSu12LPlRVRez+FFqxBKdygKt3AZJbWmP0ZUhaRR0OgmGsBZMeiX92l0GPoxS5+0JpDtFlJYDPV8xkcYE9LECWXObjJcEFysBSEGB6LbS2JwMcKyYCMFNCVJjS9XTIAQpMNEXcB1oM8dHR9Ih5Tg+7IAjOjNKOyaMZ8Mk4VhLLEtDJRthUhX54c27mRE5uCCd9mfXeVha7IHUPXGvXmWgbnSVEgai+OhJq7riw3VtZheay2DUrnU61P+dvDMb8SZTorX3BER8J6Gab5ACE2aV7FMppJ6VoI4XakU6k6sV6IpzoABCN6lKd1YItuAm/AcqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9)
 by DS0PR11MB7802.namprd11.prod.outlook.com (2603:10b6:8:de::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 23:08:07 +0000
Received: from CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76]) by CY5PR11MB6320.namprd11.prod.outlook.com
 ([fe80::9cd7:94d5:90f:4d76%6]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 23:08:07 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Wang, X" <x.wang@intel.com>, "Teres
 Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>, "Levi, Ilia"
 <ilia.levi@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 00/11] Enable per exec queue MSI-X vector assignment
Thread-Topic: [PATCH 00/11] Enable per exec queue MSI-X vector assignment
Thread-Index: AQHc+SAf1Nkx6cgd5Ue9ztCUPbProrY4db4AgAGGU4A=
Date: Thu, 11 Jun 2026 23:08:07 +0000
Message-ID: <7d5380e8499fd44a91bbecca387e2f7b09828412.camel@intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
 <ain4aHd9KLMh+2Fd@gsse-cloud1.jf.intel.com>
In-Reply-To: <ain4aHd9KLMh+2Fd@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6320:EE_|DS0PR11MB7802:EE_
x-ms-office365-filtering-correlation-id: f67d6cf0-f05b-4909-f4a0-08dec80e4cea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|4143699003|56012099006|11063799006|6133799003|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info: gp9QUFKfslTzg0185+cRunjgSAZfRXM7hgQJSdbwpOx0bmnUobks0dqbPdedDwNaSuppvZRr7Few9pAA3vkZ3ZQA2GqtXtLaz//qBsmmabBEOhr/8ZSfc/EBIUCKkWGEF/xpWZ4T7G2XEq7oR6VP6oLysKt29SCtqiRjbqbo6EyI/2v8iXJWnm7zW3jTPoQL9zNla647Mk5zqf/SrTn/ruxe5UABkQo0px7yPd4jS9Wna6aS3S1lXTSb8rJc4nNs6PQWsbwEP+BrAzTR5WRbl5bSuSbQgHrcyAOcPKa1Bz9NYirVSOL/OL8a67qg2BuIFGHjRZaMQAWLvRqm1BoasSIj/X7v+4Mk3PGsr6y7uFsf6wmtjH3s1x+Hd3vcB8D6yxZXVGh/CwjugaTzBOdXggG5EpjVN1HPFXCE39aRNHW+4es+cPePF00rK2vpJBVHqTsHR7N+fcoChKCWuSMx752faYBBXfNEseZrNI3VvvUgrRNL3v2Ln33tI2zZZXhWi+922yNFOTLZShbjm5s/ovvwdcqHwxIRG1CS8Scb1p2cxZuInzZEmKB4QgBsmS5Y6ygaH0XHnhMw/qe3N7Ef+/9B5spfZ2SWHGs4rdTzSPzYn5/1k/h02n2ZuS8oaAt1F2D3KO80QqjE6op6UP5OP79ieSBT57gURvmb8T6G9r9eah41U8USRPwdExHRpb6CHqERlB3W9jjRVjlHv5zzRU5Jk11WZ7A5MQK6q3gW825/XqxffkqA94FWyDNr3QmC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6320.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(6133799003)(38070700021)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGJGVTJGaW1weTBhaFVHWVVRV2tEV2phMy9JYUxFQlk3emZ4OXE2eVFVejVQ?=
 =?utf-8?B?VXcxdmhBdFgrRjNsZ1ZWazRrUWt5RG9sNzVERytaNFAva0h3UFJJaVA0eU5q?=
 =?utf-8?B?MkFTNUt5ZlBjNnB3MXVBZ3ZCWU0xRnJuYkVZeEhTWjRwK1p3NnhveXd5c3pL?=
 =?utf-8?B?QjdlOTlURzVvbExES0lmcE5XSkJHeEdVTDlTMUlRb3R4eGRHOVkydFFNRzBR?=
 =?utf-8?B?MFptL25MY3hVZlExMEZhNG12UTlJUllSNmphY1UzUmhuNFF6OWhUNmM2R2Ry?=
 =?utf-8?B?WU82cGlJK1NaM2NOcjFkRzA0aThKTTVURzUveGpPRkNUVUZROU1lbnB4Uk5i?=
 =?utf-8?B?VWJpNEJqZ3Q0RTV6UzA3MzEyaUpXY1BhenZlWFJnL1J4SThqNXJXb2p2UHQx?=
 =?utf-8?B?MnZpc3I4UExJNVlBY24rSEdIeXlpWnpJOFpOLzFmSllxWFlUUFV3L3VQNXIv?=
 =?utf-8?B?RW54YzdqT0RvZWhjcTZNSUhjRVUrZ3pWUnpuZ1pOaUhTdWRBazJEbDcwazJM?=
 =?utf-8?B?dEtmMEdSdVFua0tPa0NkVTBJbnBBNUx3bXFNNnlreENGdkZZN2oySldNdlVC?=
 =?utf-8?B?M0IyclkxdkU3Z3N0SUFnQTRGNDNYOUhoUEN3VlY4SHJ6WTRLZytpWllYZ1hK?=
 =?utf-8?B?RGtDQnNYSXcwUTVSUmMxM2pXS05zcklTOGx0cVdibUhBeDB3MUFzTGlsYmNs?=
 =?utf-8?B?YVdNR3lKUGhMSEVQYjN3bEpNTHVkMzFaSmg4V1dZVzQzSmJjbDJvU29iRDg5?=
 =?utf-8?B?Y2EvSXQySUptQVJ5Uk9MSi9WZ2QyZHNubXBKWE15cVpqbWhaOTFERE5iL0ZM?=
 =?utf-8?B?Sjd3ak1DU09odkdxM0svcGx5RUdmaXJyRkUzZ1Zlam91NXl6dGNONUtWT3hS?=
 =?utf-8?B?eDhKTmd6S29KN1NUY2VnVFRsR2pDMzFiTTVickVvd1pPODZBNUwxa3BGTVZl?=
 =?utf-8?B?OUplanhqV3padlFwM0IrWks4aE1INk8vSlZHNjFGUXV0bVhzRG9TeThDZmNr?=
 =?utf-8?B?UGhLakx2NEJFRUxiUVhUanhNR2ova2xzRHZHVDlGN1BDTkdYR2xYbERSeTA3?=
 =?utf-8?B?THU3eVBKWlB4V0JGVndCQ20wU2tleUI0a01nYnE3YTNjOXV1cFZvT3krU01x?=
 =?utf-8?B?WFY1bmdMNFhJQ1VNVUovRW90dHdXMHFCUTlqQ1VzcEJUd0ZkQjFiQk91SXZj?=
 =?utf-8?B?dHZYV2VnYWs5NzZaYzIyaEFjNEUvcWxwSGFmS3EraG5JcVlsZ3BuVWh6Tk9Y?=
 =?utf-8?B?SHJIMzl1VmloQWwySnpSb1pMYmxjaXAvazhpOTc5bWtidFM1ODB1aUltYmx3?=
 =?utf-8?B?NVd5TUx6d2pQUlBoUXBxRmV4eFhiZ0RlaGs0dk4zc3VRRi8zRjdXS29naEI0?=
 =?utf-8?B?Yk9UZk5lMnk3SXBTQkg1b2F3Tk9zUE9IMllxdTdFWUdqYThRcGNrRFlPcmhq?=
 =?utf-8?B?akhhaFllK0w3TFpuNkNDTGxsOVJxRGZNU3RYcnRhUTFxd1dibzJSS213T3RK?=
 =?utf-8?B?YjlOeEZSb0YwdWZDeHNKcWtHNUYrVFAxVTV2WU5FSy8wVGxJek5ubTRDN0RE?=
 =?utf-8?B?YUdqQzM0Z2dCU2JPNU1LbmdrclU2aFVOd25EbVJ1azgwSXVFbVN1ZHlOYmdR?=
 =?utf-8?B?RTBMbE5GSm1YM0paT29CbGlwWHMwMzBLeTlSSGljQlBqaytqNWM1Uk1PVkhY?=
 =?utf-8?B?d2R3ZDBuUEJ2aWRnL0lDZ2NtVkhqRGNtY1NvV2cyWG5kZDRtZ3JWdzE5MUFP?=
 =?utf-8?B?bnAvN1lMVmo5ZklxMnhPSWllNDBTZ3dLckhtZTNhZnlnVXVhaVJwak56d3VL?=
 =?utf-8?B?MWdLeXlUeTVMVkc5TU9jQzkyZHRZWWdFWVNQeitPdlArNFBCWWVVcmNQeE1r?=
 =?utf-8?B?cE91M21qV2I4V2xTNmpDS2hDU043cnN3R0s3TWxSOGNqc3VoM1FuZ1lwaXh1?=
 =?utf-8?B?SGxnMk0rbzJlUkZUcmdyT2NxNWczZjZFcmY0SkJkZ0k5YzFOdnRvYzVRM3lR?=
 =?utf-8?B?aDgzdzZ3V1NnT3pxWHBEZVBET2lNZjJmSWh3dGxHcEpLMmwxMlpld3ZBejc1?=
 =?utf-8?B?SmhUVnkxWjdPQWR3ei9LUzF3YkRsTlFENXpGeHRYU2s2YWRLN2lRcWJHdmt0?=
 =?utf-8?B?d2JBTitpYVF0WHhjazNhQnErQ3lUUDNONFhTWDBuTFhHeGEvVU9pZnl0M2hS?=
 =?utf-8?B?ZXNxYzlJRjNwUnpydC9VUWdNS3FoalVnR1g4ZEJlQkhIWDMyaGZvUnEwQ1ln?=
 =?utf-8?B?Snl2RjUxT2UyMTNkc2hFOGMrbUM4VmwvWW5Cd1Q4SVEyUmlBd3RSTHoyVVo0?=
 =?utf-8?B?YVJGWEJtZ1IwN25xczlrTTFjbkZId0tZRHFLeDQ3MVhYdncrWWNVUVZCSStS?=
 =?utf-8?Q?sBuaE7zwf6FjWPUY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <99C5D026A3ABC44F907DBE92D5A8B914@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TIzZs5XwwYc7/iNz9CGe6G3gUxofuVQXnljZptU71SO+qil2ruhDAguiIlZ7hf5UnCPSKWRsenewHA+/tJ/CuYmFDqmRO30o9hUlhJP1pHgeWl1t7vj5LQllZCu+nT21qJ4HwKKq4y3TWhBZn1mbrDYpxqQZa8nVlWj86YsNT8xh9iOD89JYgLBDIDsoz1ED9TON9cfZ4OjoQ6F3zcAc2dXuZ/xioYpnhqQseFNcSKqkZ+uSXI+5a4MGulE0gdkekPQcvCl5Itrzzl4w42iyjItXNbVdmR5INDLM1kCQuLtY8PApCjpwccQPy1jL7YZvioPkLY3PtadlGL4P82zvhQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67d6cf0-f05b-4909-f4a0-08dec80e4cea
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2026 23:08:07.8233 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6qctP5Kgmtcut8yShvK/6paXtnVPvdY8kvrZbtvB4XJqyX9vtqfEcmZHYPgIE54VAnYSjK05DOzSHws/wjVdSx3VvCmzgOnQPAQZNe8eZ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7802
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

T24gV2VkLCAyMDI2LTA2LTEwIGF0IDE2OjUxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBXZWQsIEp1biAxMCwgMjAyNiBhdCAwOToyODozMlBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIHBlciBleGVjIHF1ZXVl
IE1TSS1YIHZlY3Rvcg0KPiA+IGFzc2lnbm1lbnQgYXMgd2VsbCBhcyBhIHBlciBleGVjIHF1ZXVl
IHdhaXQgcXVldWUgaW4gdGhlDQo+IA0KPiBUaGVyZeKAmXMgYW5vdGhlciBpbXByb3ZlbWVudCB3
ZSBzaG91bGQgY29uc2lkZXIgb25jZSB3ZSBoYXZlIE1TSVggcGVyDQo+IHF1ZXVlOiBhc3NpZ25p
bmcgYSB1bmlxdWUgeGVfaHdfZmVuY2VfaXJxIHRvIGVhY2ggcXVldWUgd2l0aCBhIHZhbGlkDQo+
IE1TSVggdmVjdG9yLiBJbiB0aGUgTVNJWCBJUlEgaGFuZGxlciwgd2UgY291bGQgbWFwIGZyb20g
dGhlIHZlY3RvciB0bw0KPiBxDQo+IGFuZCBvbmx5IHRyaWdnZXIgdGhhdCBxdWV1ZeKAmXMgeGVf
aHdfZmVuY2VfaXJxLg0KPiANCj4gVGhpcyBzaG91bGQgcmVkdWNlIElSUSBvdmVyaGVhZCwgYXMg
d2Ugd291bGQgd2FsayB0aGUgaW5kaXZpZHVhbA0KPiBxdWV1ZeKAmXMNCj4gbGlzdCBvZiBwZW5k
aW5nIGpvYnMvZmVuY2VzIHJhdGhlciB0aGFuIGFsbCBwZW5kaW5nIGpvYnMvZmVuY2VzDQo+IHdp
dGhpbg0KPiBhbiBlbmdpbmUgY2xhc3MuIFdlIGNvdWxkIGFsc28gaW50cm9kdWNlIGEgdmFyaWFu
dCBvZg0KPiBod19mZW5jZV9pcnFfcnVuX2NiIGZvciBNU0lYIHRoYXQgaW1tZWRpYXRlbHkgYmFp
bHMgd2hlbiBpdA0KPiBlbmNvdW50ZXJzDQo+IGFuIHVuc2lnbmFsZWQgZmVuY2UsIHNpbmNlIHRo
ZSBsaXN0IGluIHhlX2h3X2ZlbmNlX2lycSB3b3VsZCBub3cNCj4gc2lnbmFsDQo+IGluIG9yZGVy
Lg0KPiANCj4gVGhpcyBjYW4gYmUgZG9uZSBhcyBhIGZvbGxvdy11cCwgYnV0IGl0IHNob3VsZCBw
cm92aWRlIGEgc2lnbmlmaWNhbnQNCj4gd2luDQo+IGluIGNlcnRhaW4gY2FzZXMuDQoNClNvIEkg
d2FzIHRyeWluZyB0byBsaW1pdCBpbiB0aGlzIGZpcnN0IHZlcnNpb24gdG8gY29tcHV0ZSB1c2Ug
Y2FzZXMsDQpidXQgbWF5YmUgeW91J3JlIHJpZ2h0IHdlIHNob3VsZCBnbyBhaGVhZCBhbmQgaW5j
bHVkZSB0aGlzIGZvciB0aGUgbm9uLQ0KbHIgY2FzZXMuIEknbGwgYWxzbyByZXZpZXcgdGhlIHN5
bmMgY2FzZSB5b3UgbWVudGlvbmVkIEkgdGhpbmsgaW4gdGhhdA0Kb3RoZXIgY29tbWVudC4NCg0K
SSBndWVzcyBJJ2QgcmF0aGVyIGtlZXAgYWxsIG9mIHRoYXQgaW4gdGhpcyBvbmUgc2VyaWVzLiBP
biB0aGUgb25lDQpoYW5kLCBJIGRvIHdhbnQgdG8gZ2V0IHNvbWUgb2YgdGhlc2UgY2hhbmdlcyBp
biBzb29uZXIgdGhhbiBsYXRlciBzbyB3ZQ0KaGF2ZSB0aGlzIHVzZSBjYXNlIGFsaWduZWQgd2l0
aCBhIGxvdCBvZiB0aGUgU1JJT1YgcmVsYXRlZCBjaGFuZ2VzDQpnb2luZyBpbiBoZXJlLiBCdXQg
YWxzbywgdGhpcyBpc24ndCBzdWNoIGEgaHVnZSBzZXQgb2YgY2hhbmdlcyB0aGF0IGl0DQpzaG91
bGQgaGF2ZSB0aGF0IG11Y2ggb2YgYW4gaW1wYWN0LiBJJ2xsIHRha2UgYSBsb29rIGFuZCBnZXQg
YmFjayBpZiBpdA0Kc2VlbXMgbGlrZSBzb21ldGhpbmcgdGhhdCBzaG91bGQgZ2V0IHNwbGl0Lg0K
DQpUaGFua3MhDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiB3YWl0IHVzZXIgZmVuY2Ug
aW9jdGwuIE1TSS1YIHZlY3RvcnMgYXJlIGR5bmFtaWNhbGx5IGFzc2lnbmVkDQo+ID4gZHVyaW5n
IGV4ZWMgcXVldWUgY3JlYXRpb24gdXAgdG8gYSBzZXQgbWF4aW11bS4gT25jZSB0aGUgbWF4DQo+
ID4gaXMgcmVhY2hlZCwgZXZlcnl0aGluZyBlbHNlIGZhbGxzIGJhY2sgdG8gdGhlIGRlZmF1bHQg
dmVjdG9yLg0KPiANCj4gPiANCj4gPiBUaGVzZSBkeW5hbWljIHZlY3RvcnMgYWxsb3cgdXMgdG8g
d2FrZSB1cCBhIHRhcmdldGVkIHdhaXQNCj4gPiBxdWV1ZSBhbmQgdXNlciB0aHJlYWQgaW5zdGVh
ZCBvZiBicm9hZGNhc3Rpbmcgb3V0IHRvIGFsbA0KPiA+IHBvdGVudGlhbCB1c2VyIHRocmVhZHMg
bGlrZSB3ZSdyZSBkb2luZyB0b2RheS4gVGhpcyBpcyBpbnRlcmVzdGluZw0KPiA+IHdoZW4gd2Ug
aGF2ZSBtYW55IHVzZXIgdGhyZWFkcyBvdXRzdGFuZGluZyBhcyB3ZSBkb24ndCB3YW50DQo+ID4g
dG8gd2FrZSB0aGVtIHVwIGluIGEgc3Rvcm0gZm9yIGVhY2ggaW50ZXJydXB0IGNvbWluZyBpbi4N
Cj4gPiANCj4gPiBBZGRpdGlvbmFsbHksIHRoZXJlIGhhdmUgYmVlbiBjaGFuZ2VzIGluIHRoZSBt
ZW1pcnEgY29kZSBsYXRlbHkNCj4gPiB0byBpc29sYXRlIHNvbWUgb2YgdGhlIGludGVycnVwdHMg
aGFuZGxlZCBoZXJlLiBTdGFydGluZyB3aXRoDQo+ID4geGUzcCwgaG93ZXZlciwgd2UgaGF2ZSBu
ZXcgaW50ZXJydXB0cyBhdmFpbGFibGUgZm9yIGNvbXB1dGUgd2Fsa2VyDQo+ID4gcG9zdCBzeW5j
IGludGVycnVwdHMuIEN1cnJlbnRseSB0aGVzZSBhcmUgZW5hYmxlZCBmb3IgbGVnYWN5IE1TSQ0K
PiA+IHVzZSBjYXNlcywgYnV0IHRoZSBiaXRzIGFyZSBhbHNvIGF2YWlsYWJsZSBmb3IgTVNJLVgu
IEVuYWJsZQ0KPiA+IHRob3NlIGJpdHMgaGVyZS4NCj4gPiANCj4gPiB2MjogRHJvcCB0aGUgZHJt
X2RiZyBjaGFuZ2UgcGF0Y2gNCj4gPiDCoMKgwqAgRGlyZWN0bHkgY2FsbCB4ZV9od19lbmdpbmVf
aGFuZGxlX2lycSgpIGZyb20NCj4gPiB4ZV9tZW1pcnFfaHdlX2hhbmRsZXIoKQ0KPiA+IMKgwqDC
oCBPbmx5IGFkZCB0byB1ZmVuY2VfbGlzdCBmb3IgdXNlciBxdWV1ZXMNCj4gPiANCj4gPiBTdHVh
cnQgU3VtbWVycyAoMTEpOg0KPiA+IMKgIGRybS94ZTogQWRkIGtlcm5lbGRvYyB0byB4ZV93YWl0
X3VzZXJfZmVuY2VfaW9jdGwoKQ0KPiA+IMKgIGRybS94ZTogSGFuZGxlIE5VTEwgaW4geGVfZXhl
Y19xdWV1ZV9nZXRfdW5sZXNzX3plcm8oKQ0KPiA+IMKgIGRybS94ZTogQ2FwIE1TSS1YIHZlY3Rv
ciBjb3VudCB0byBYRV9NU0lYX01BWF9WRUNTDQo+ID4gwqAgZHJtL3hlOiBBc3NpZ24gZGVkaWNh
dGVkIE1TSS1YIHZlY3RvcnMgdG8gZXhlYyBxdWV1ZXMNCj4gPiDCoCBkcm0veGU6IEFkZCBjb25m
aWdmcyBtYXhfbXNpeF92ZWNzIGF0dHJpYnV0ZQ0KPiA+IMKgIGRybS94ZTogUmVtb3ZlIG1lbWly
cSBzdGF0dXMgYW5kIHNvdXJjZSBjaGVja3MgZm9yIGVuZ2luZQ0KPiA+IGludGVycnVwdHMNCj4g
PiDCoCBkcm0veGU6IEFkZCBwZXItZXhlYy1xdWV1ZSB1c2VyIGZlbmNlIHdhaXQgcXVldWUNCj4g
PiDCoCBkcm0veGU6IFRyYWNrIGFsbCBleGVjIHF1ZXVlcyBpbiBhIGRldmljZS1sZXZlbCB1ZmVu
Y2UgbGlzdA0KPiA+IMKgIGRybS94ZTogSG9vayB1cCBwZXIgcXVldWUgdGhyZWFkIHdha2UgdG8g
dGhlIHVuaXF1ZSBNU0ktWCB2ZWN0b3INCj4gPiDCoMKgwqAgYWxsb2NhdGlvbg0KPiA+IMKgIGRy
bS94ZTogRW5hYmxlIHBlci1xdWV1ZSB1ZmVuY2Ugd2FrZSBpbiBpb2N0bCBhbmQgd2FrZSBmdW5j
dGlvbg0KPiA+IMKgIGRybS94ZS9tZW1pcnE6IEVuYWJsZSBjb21wdXRlIHdhbGtlciBwb3N0LXN5
bmMgaW50ZXJydXB0DQo+ID4gDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUvcmVncy94ZV9scmNf
bGF5b3V0LmjCoCB8wqAgMyArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfY29uZmlnZnMu
Y8KgwqDCoMKgwqDCoMKgwqAgfCA3MQ0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2NvbmZpZ2ZzLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCA2
ICsrDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMiArDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmjC
oMKgwqDCoCB8IDExICsrKysNCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVl
LmPCoMKgwqDCoMKgwqAgfCA1MSArKysrKysrKysrKysrKysrLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWUuaMKgwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaCB8wqAgNiArKw0KPiA+IMKgZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuY8KgwqDCoMKgwqDCoCB8wqAgNiArLQ0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jwqDCoMKgwqDCoMKgwqAgfMKgIDYgKy0N
Cj4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuaMKgwqDCoMKgwqDCoMKgIHzC
oCAzICstDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfaXJxLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDM2ICsrKysrKysrKystLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2lycS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDkgKysrDQo+ID4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfbHJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE1ICsrKyst
DQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWVtaXJxLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDU5ICsrKysrKysrKy0tLS0tLS0tLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVf
bWVtaXJxLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3N5bmMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMyArLQ0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9mZW5jZS5jwqAgfCA2NA0KPiA+ICsrKysr
KysrKysrKysrKysrKysrLQ0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3dhaXRfdXNlcl9m
ZW5jZS5owqAgfMKgIDQgKysNCj4gPiDCoDE5IGZpbGVzIGNoYW5nZWQsIDMxMCBpbnNlcnRpb25z
KCspLCA1MSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiAtLSANCj4gPiAyLjQzLjANCj4gPiANCg0K
