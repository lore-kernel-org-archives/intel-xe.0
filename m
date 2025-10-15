Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59191CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 11:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5EDD10E787;
	Wed, 15 Oct 2025 11:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzlMHzEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D437B10E787
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 11:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760528331; x=1792064331;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HSt3FC4f4OHxWSaIEmvQ52phetKXirrWFCXhFJsK2Is=;
 b=gzlMHzExgQPPWVzjHanCszuz7T4wGDN//nW43DhoQYvTGMP6oFVlur3g
 5y218wLp+Twx85PJr84T+87pU8+Em+3EejsU9BJDK8kevhNP3lSjRNcrg
 Akw+VNz3ZT1/TmOdkgy7Q2gcq1+TGaaBpVmpQxS0p4zm02ramLLselWua
 psRB+uVYLMKApspxLNyslP6mf2CYMPmK+jciMYqEQcg/9EKWoGl300D9o
 23IoJHvrKxhmO3jeNllRn3mHzMdNLD0Yj6AuTQWeNWT3vv1NpWB7bNGEp
 xaZdkIKycXPQZNJzt1v9bu74iUQtJZAm4Jb/t0pzeQDUQQaBrY4v2jmdU w==;
X-CSE-ConnectionGUID: gaw/YU4rRN+IX7wIE5MUeA==
X-CSE-MsgGUID: Y9qc6eHHQoGoOzh5Tg8heA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62596910"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="62596910"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 04:38:51 -0700
X-CSE-ConnectionGUID: z6ElEgCCQyWx6h/jDJTOZg==
X-CSE-MsgGUID: EX1ANK1xT9uCvJX7XGhV4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="182101780"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 04:38:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 04:38:51 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 04:38:51 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 04:38:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umOgHjGgY5AjxeKcfja2byc7Jhx3jfWKRJzPQUACmldba3BZAVOxq8CHVHyDUxl20YJiDIUTqgvfiJnWJpzWQktxO6xhsCHlYuvf+hsUelAGn2rKzG4sjFqbW6Af8m6Otyy1lJv29SKN1nOabQa2brwMJf30p8yvH/l2eH4+cafjTPI92xkkysuzlAnzd9ZTFBvVBYocLqk/xUqwfagFF2+nCIWwynthcFr23mqYQE4VgSjPlC8Yq6gTEZLuVJPhhpQNyTU2sglw1tWc/ma7eF5PTuVYg8wqooE9RuLzbFaoQqmDiv0HSeL5vwb23VK45zdw0QsW5PWqJ6pUHS/x3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSt3FC4f4OHxWSaIEmvQ52phetKXirrWFCXhFJsK2Is=;
 b=su/jxPSp1kuT7WOXflylsJPMpVaYmTQ827utWOn1hvHjM7T/zwo627wFhoqfUKVmtx5GN4dlpph+ZfKGthpZ/9X7oGQ12+irqk1Xd3A3RNq2//QptplgtTVSTKX2wjOiSZX42/nILU1ahFCLfAAcvwIkWlt6OqUO7nAAmHVNGYUFH7UDObEkZTBBNqeHYNYQPE57bGp5XdHBW00ORdyPiY+OhkpTb3IQCvWDcURG9zn4pTfkklIDGMXGJ2f3QcwgbSK+uxcYtrDQ1xibU7+lU6G1JZk30QqR3EwLfnJFpQzHzcrH0iwsIpDOvfbbnCbRXiFhPSnJ1gPlLlyQxf/cVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5254.namprd11.prod.outlook.com (2603:10b6:208:313::16)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 11:38:49 +0000
Received: from BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625]) by BL1PR11MB5254.namprd11.prod.outlook.com
 ([fe80::bf0c:ea27:d51f:1625%5]) with mapi id 15.20.9228.009; Wed, 15 Oct 2025
 11:38:49 +0000
From: "Poosa, Karthik" <karthik.poosa@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>, "Anirban, Sk" <sk.anirban@intel.com>
Subject: RE: drm/xe: Prevent runtime PM wake while reading rp0 frequency
Thread-Topic: drm/xe: Prevent runtime PM wake while reading rp0 frequency
Thread-Index: Adw9yAfrIel28mraQBqtkuqwsL1H3w==
Date: Wed, 15 Oct 2025 11:38:48 +0000
Message-ID: <BL1PR11MB52546B55031A832837655172E5E8A@BL1PR11MB5254.namprd11.prod.outlook.com>
References: <20251015094611.1468939-1-badal.nilawar@intel.com>
In-Reply-To: <20251015094611.1468939-1-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5254:EE_|LV8PR11MB8769:EE_
x-ms-office365-filtering-correlation-id: c596d451-fe0f-4e17-3d21-08de0bdf686c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MWFYYTB5QVY3VW9XekhZTzkraDd4MDkxWGZZZFlxSy8xcGFYMzBodzNZUXpu?=
 =?utf-8?B?MUJjSFdESnYvWUFOeUU2NUZsekRsWnNFcVhmcXRMbXBsY0U3RXFiaUcyWjkv?=
 =?utf-8?B?NDkvOEZETU9XVUZyZjBHRWlWdndNTEJEblFXNkd3eE53cXF2N0l4a1NVdFRs?=
 =?utf-8?B?RmZYZi9UNkdnRFlOTVA0WENVam1yem02WVhtcVNYN2F1eUk2WjJMQlgxWExV?=
 =?utf-8?B?M0d6TWI3a2FiLzBJTUlaRGd4VldJWmJXSTRVd3FOSnl3VGlrWGt0WlM4WmxZ?=
 =?utf-8?B?ZFB6NEQ4eE12cGcrOFJDazJyQ2o3NUJVNkM4YjdhYkpiZFJvTnc3RTllOG1C?=
 =?utf-8?B?NHpCMUQyRUltZlNQRnpOd25sQzdsUmY5SlZxK0MxN3dKaVVrUS9iM3FRVzcr?=
 =?utf-8?B?a3RzSGFzWEg3QWJlZVR0YmI2Y1hwV0NWemxWa296eVAxMHlNbEQ5ZHpYSi96?=
 =?utf-8?B?TTIvRnlGbHdSTDR3UHZhNERpbDlXUWdjSnRRZ0h3MVVMOHp0Vlord1l3K09Z?=
 =?utf-8?B?N2R6cXNVNlgwa0U0b1AzK1pSNGQ5c01hblN0Sm5Yb0E2MzNhdmt6c1R4b1Ur?=
 =?utf-8?B?SzhnS2NUWUNCb2hQUHVsNlY1SzM5TmRtZUxHUk1keGtsNHh2UjUwZk5IdzNS?=
 =?utf-8?B?OXljSnJ0bS9BeEFHVlJscTdRaGNCdzJ2ZGtadXFPOExvSUFrZDVUSXQyck55?=
 =?utf-8?B?d3lsMWhvS2Y4bnBTMXlPUitBNUZVcWkra1JrY3huSTRkR25MbXFNVlBQb0ox?=
 =?utf-8?B?dXRiZER2eVBxWXhNT0dkZEZ3elBXeG9GTFZzWUZlMFRRc3BHV052elR5Vk9B?=
 =?utf-8?B?cWZwbVNJK21oekk5WmtRN3NrMkQ3UVYvVldPS0JyTEhQdWFnVTdnRGVUY3hO?=
 =?utf-8?B?Wm1WdkNvdEhDeXNSWlZGengvaFhWa05aSHVQTmEvWkw0QVZpNmx5OXVGSGFV?=
 =?utf-8?B?a0I3dE82SkV3MGVrYnRJaTR1RHJJYjZVRnlVOThZK3FyU0JTZW1hL21VNncw?=
 =?utf-8?B?cWhCL1JEKzBONGNXSGU2Y2gyK1FPaVpZTkRDV1dYTFJIclV0cllrL1Y0L1g0?=
 =?utf-8?B?dDVwSGRQVmticzJaenllTzRZV3p4T3FneVl6bW9XcFVoMjM5YkRaYkt4VCtR?=
 =?utf-8?B?Y3pxTUwwVVhHMWxIUlB5UzhPalZBakdWNHR3bTkvWjdoZ3h0NmRKZGNPYUdn?=
 =?utf-8?B?SWpLQjdYd0FWTFMvbzE4QTA4L3FtejlhSmdUSlRsMkNqYUw1QXRYR3ZSK2FN?=
 =?utf-8?B?ZnBTMkFkZ2RSRmhNM0NBUVJRWjJGUERBdG5mcTU2VzMrN1luRGhMSjNsQkFj?=
 =?utf-8?B?S1Z3S0pGMll6V2FuMW1HWU45ZUQzU0Y5S2xlWXRwU0FEUXhZeUoxU01kZmpE?=
 =?utf-8?B?b1I5RmZua0kyMnZ5S3F3UW00KzlyK3UzcWNkbDR2cjhzR0lzeTU4NGVQcDJh?=
 =?utf-8?B?dDhJNVdOQ2RKSWtjV01QQlVydW9jcVQ1RjdKVytJZEJaQUNKNTVwK2VlMEJC?=
 =?utf-8?B?d2ErZVJBUVpOaGV5dHFUTWwxZXZMSldkV0IxWTFnT2crWlVZMnpLNC9kRG9r?=
 =?utf-8?B?dkl4WXN2M0J5MHpRUWRoWVYyT244b0lqTHRxNnVraFZ4UEVaNS9zWFhSM01z?=
 =?utf-8?B?UmZQREJtS0ttbU1OYnBIcG5nRDhreDdYZ0w4dy8wVHRZUElEMWVoMDBXMVVy?=
 =?utf-8?B?TUhBZXlWa3NwZjhJZUp3cTRIa0loU095bUd4ejJ0a28vTDYvWDJTTHBWTVdh?=
 =?utf-8?B?WThldWdMVFprL3RsL1YrMTdpd3MrVmt2YXdWUUZpajNtUTB1NVJVYWZOdW9W?=
 =?utf-8?B?TVVENlZwSFZ2VGdVRUVqM1hGV3pHZU0rUjZvZklYS2IrbEY0VzdHQlp4S1RK?=
 =?utf-8?B?U0JiZzlwR0ptRXFtMndtNWczMlNCYytkTy9nZWRodmZvalZNTGE3VnJPdDNB?=
 =?utf-8?B?b2ZoSnJDZDA3cG1YWkhnRWkxL1dnV2ljSGdQZDlXSHBJT3BZV0hCejI3Z04x?=
 =?utf-8?B?VThSSGtqbTNQZXI2OXNDUVVjbm83eEtDbjBkcU00UndXSDIyNnRCcTVjb1U2?=
 =?utf-8?Q?YohPnL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5254.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L3ZDbmpnQUlRdXJrTkYvNzFqL3dDUWdVN0xUamVTcUpYMVV4N0d2VG9mSGdk?=
 =?utf-8?B?MVhtcklmeDh6ZEhCampmV2N2OGFMZk1UeE5RbzhLNzFSVThQQWEvei9JdEtX?=
 =?utf-8?B?YWNUTEhDTm0vQ1NkeVFqQnl3TW1IWUd5K2FPMWFwT2lEUU5xVFRmZnJGcGVM?=
 =?utf-8?B?K0g2cDlJWmZ4TXBCNkZNLytDUkpWQWdJWkxHTXUvV3lZeE5ZaXlBUDRuR1JV?=
 =?utf-8?B?MHBiOW5qdmFVbUpHZmMzVW5WanZOWEpZbExORjVsSzlzUlNxSm5zTnA2eWp0?=
 =?utf-8?B?bG5sQkMxZE82WDNBclBZNm9zNU0wTXN2WjN0eTJWbXpSNDI3dUw0TTYzZzcv?=
 =?utf-8?B?OXF6TllCUHVjK1YvYlVubWgzSStoVDd6Q3BoOW1UTnVvd3BEM3o2ZVR6Nlpa?=
 =?utf-8?B?bnJQZ3ZHM0NxYm42WWJTZGtuckRJS2JHZzJzdmFKZXBWVWo2UFAvYnVCdFdI?=
 =?utf-8?B?QzJQUUZOdFk0bFFmWUoxa1psNHV0N20rc3p2eERhNFNNS3pFRTQzUzNKZE5S?=
 =?utf-8?B?UXR5NXd1MHBTSnpXcWJmR0d2eVEzYjliYk1aMU8vbU9veklLdmpwVVZlaG1K?=
 =?utf-8?B?Z3M1WlVzZHM3VGVQMUh4L1g5OE9rVXdwVmNxaTFBc2E5N1p2NjdObFNZZnI2?=
 =?utf-8?B?dHE0THA3b0ZXYjJTTFhOUkZBNmFob2hLNXMzK3JzUTMyL0thYkNYeWNEZ3V6?=
 =?utf-8?B?bTBzVWVCaG1Pa1dlNDBlUDIzMkRKdGhyc1NQQlpxL3lGNmdkWUNaVjMyTWNI?=
 =?utf-8?B?TStrQnFuMXJRaXk1dmFsakhLaUNkYjYxNS8xeHlrTDRVVXczNXpuOFgxbzZ1?=
 =?utf-8?B?SVFYQ1dkMkx0c0tibWdqaTZLWDFnNUF3dFdxbHNGcmRxMXFHbWFzTUVZUGdG?=
 =?utf-8?B?MzJiNzRNOWRZMnRnOVROTWs5SmlXTDkvbHl0WWU4VzB4WG14TlFPNGl4MjE2?=
 =?utf-8?B?N0l6QlY3dTJldUk2eXVlcjZRbU9VZnZlT1IyQW0zSmJFU0tQd3NPVkRHbzhi?=
 =?utf-8?B?dVZHWlpkRlErTW5FdTB2SDFySndxY3R3SHZyRWNBdjczOVFBaHNkcGtzakVy?=
 =?utf-8?B?aXBnVWl5NUhtUHJoR0ZrdnRBZk15Y2lDb1Vyb0oyOWNJY3BlMHRiRnpldFpa?=
 =?utf-8?B?NDNUaEs2T1dDRXBOLzIrVXdWRm1yYU9Wc1puS3RGTklxNisyVFZKejJWVnNX?=
 =?utf-8?B?dzdDZ3k4MmU0Z2tVaVdJRWl1QWJuR0UzVm1JOGl5NWFBN2R4Sk9sR1dOMXVh?=
 =?utf-8?B?WHd4OU9JUURnM2czY2xkcS8rajFUTkY1N3lWN3RPemhvWlI5N0E4TXUxUGJu?=
 =?utf-8?B?eWJhbUkxbDFoTmNvRlVTRWMrenZqQ0FOeDJMb1JiRFJVNnNuWitQZ1dEbE55?=
 =?utf-8?B?MFJYNDIwT1NwL2RLN3JyM2lldGtCaWRReGFJZUpqc2dzZUxubmlPdGJEeGgz?=
 =?utf-8?B?ZGRnU1NCcmkrM3JqMjFoWjk0dkEvb05KcGlCVXVQRDhybFZyUDVjNXp3VGZZ?=
 =?utf-8?B?S2lVK08zd08xK3l0anQ4cTNHTmJqUW8rQTErNWxkMFY4TEhybVhZS2NVckRE?=
 =?utf-8?B?dmRDaTVGU1NBemFFMDIzcHg5RFczTHdTL2FMbU9oUkhsbUNMazNvZUxKWTEw?=
 =?utf-8?B?UVRRSXF6dGdWVlZIekdldm9OYnZMdVJySDFOenFleFAyU0xZdFNaUjlpMnVQ?=
 =?utf-8?B?ZnoyYThjdGZYK3Y3L2xibmNuTEgvUERoak05REdYeWZNQ09UelNkOFkyS2FB?=
 =?utf-8?B?UDlpeTRuN1NjSlU2MDNRangzRjFsRFRleWZ4S2svcjErRVdMZWpDdEg0dnY3?=
 =?utf-8?B?R01Ec0ZMZ0tMZ2IwTnduVXFPQmQ5RVVPcmdqOHhrb2FMU2ZWTmNUcGU3YW9I?=
 =?utf-8?B?dHQyZHVVOUZQTzNXaWtPenV5ckZncGYrbkNYWnJ1dklNMDA2bE96K3dpdnJY?=
 =?utf-8?B?MWRPWEc0NldMT3R5eDhmajlidjVud2JNYXQrRkZpak1mWEFQL281eXI0RnMz?=
 =?utf-8?B?em9sdEFKdlhyVFkycmxxRy9PMVlmRXZpV0c1aHN4S2t0bFRwRFJTOW1pZDBX?=
 =?utf-8?B?dm4vK2hSNnh6andRcytqUUVRdzVXQytvMU5WblQxMXZQeHdYK0poTGVNOU9E?=
 =?utf-8?Q?NAcodPnHRrLctKEVP266gBFc5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c596d451-fe0f-4e17-3d21-08de0bdf686c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 11:38:49.0370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBEg64D/SedHhgXgqC6p6Hw4hZodfGcHpZ3Y45hJJvh0xrY9riGMMSW0CjKdKn7/GAq+6v2vdQYcNKa4kGwo/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJhZGFsIE5pbGF3YXIgPGJhZGFsLm5p
bGF3YXJAaW50ZWwuY29tPiANClNlbnQ6IDE1IE9jdG9iZXIgMjAyNSAxNToxNg0KVG86IGludGVs
LXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KQ2M6IHJvZHJpZ28udml2aUBpbnRlbC5jb207IHZp
bmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tOyBzay5hbmlyYmFuQGludGVsLmNvbQ0KU3ViamVjdDog
ZHJtL3hlOiBQcmV2ZW50IHJ1bnRpbWUgUE0gd2FrZSB3aGlsZSByZWFkaW5nIHJwMCBmcmVxdWVu
Y3kNCg0KVGhlIHJwMCBmcmVxdWVuY3kgaXMgYSBmdXNlZCB2YWx1ZSB0aGF0IGlzIHJlYWQgb25j
ZSBkdXJpbmcgcHJvYmUgYW5kIHRoZW4gY2FjaGVkLCBzbyB0aGVyZeKAmXMgbm8gbmVlZCB0byB0
cmlnZ2VyIGEgcnVudGltZSB3YWtlIHdoZW4gYWNjZXNzaW5nIHJwMC4NCg0KU2lnbmVkLW9mZi1i
eTogQmFkYWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+DQotLS0NCiBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfZnJlcS5jIHwgNyArLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2d0X2ZyZXEuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9mcmVxLmMgaW5k
ZXggNGZmMWI2YjU4ZDZiLi43MDEzNDkyNTFiYmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3RfZnJlcS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfZnJlcS5j
DQpAQCAtOTksMTMgKzk5LDggQEAgc3RhdGljIHNzaXplX3QgcnAwX2ZyZXFfc2hvdyhzdHJ1Y3Qg
a29iamVjdCAqa29iaiwgIHsNCiAJc3RydWN0IGRldmljZSAqZGV2ID0ga29ial90b19kZXYoa29i
aik7DQogCXN0cnVjdCB4ZV9ndWNfcGMgKnBjID0gZGV2X3RvX3BjKGRldik7DQotCXUzMiBmcmVx
Ow0KIA0KLQl4ZV9wbV9ydW50aW1lX2dldChkZXZfdG9feGUoZGV2KSk7DQotCWZyZXEgPSB4ZV9n
dWNfcGNfZ2V0X3JwMF9mcmVxKHBjKTsNCi0JeGVfcG1fcnVudGltZV9wdXQoZGV2X3RvX3hlKGRl
dikpOw0KLQ0KLQlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlZFxuIiwgZnJlcSk7DQorCXJldHVy
biBzeXNmc19lbWl0KGJ1ZiwgIiVkXG4iLCB4ZV9ndWNfcGNfZ2V0X3JwMF9mcmVxKHBjKSk7DQog
fQ0KIHN0YXRpYyBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgYXR0cl9ycDBfZnJlcSA9IF9fQVRUUl9S
TyhycDBfZnJlcSk7DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTogS2FydGhpayBQb29zYSA8a2FydGhp
ay5wb29zYUBpbnRlbC5jb20+DQogDQo=
