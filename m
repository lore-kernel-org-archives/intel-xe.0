Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 552AECCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 14:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90AE10E8FB;
	Thu,  6 Nov 2025 14:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rzp4PICO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A1210E8FB
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762439971; x=1793975971;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SvExkHQXPDVflJ4Y0kVgPkmxcdPxv4A+Mh5RPgxim7k=;
 b=Rzp4PICOHNbcyPeMyFmozU2felid0zDnQSllHENfd6nYtFCXFCGaKT7w
 OfZDIKjzvvznntKHub1p/ROS5S6wNccI0HYMqEZ1h8Ym/nTdyXdl+BUVg
 LJpJCM7gcSDFYJ2AycezVDHDwOu1G2cq15L9p+Za7AsXWDDXrE0ycq7IP
 coQp0o0fQOoFGYiv1DAk2j5sLKrxqC6me3cOW5FsDA5NBuKLQwSNiOdaY
 h5ENbFUe0wsRYY+pfDrKDczXDIW8G7lCOtQFXsxmkKQzOIKZYw8dkmJle
 Y62lrQRb4Wk9i/ARS8RElJlY1hJRTJAThqYxutj2d3LdMfsMoXyGpUHqe w==;
X-CSE-ConnectionGUID: svKPLNv0QHC7MLqaCb0wPg==
X-CSE-MsgGUID: Sjveu2uLSXeSKa0U7smcmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64671168"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="64671168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:39:31 -0800
X-CSE-ConnectionGUID: 2kg6xQJYSpCwBaLpevVN3Q==
X-CSE-MsgGUID: xlMF/6q4QviDlXy72rUdtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188056110"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 06:39:31 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:39:30 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 06:39:30 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.67) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 06:39:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrfR6bbFiEtAYwdDzYRso1dJmUDzRTuSxoUkTxxipCfk1fs2tZl5J+Lo2Mcr77Se5wZ93psAvdGC9FdadY4D2fhWzH66ip3FMudsu6EaADgGIn0wC9yobQBbC/INFcPYhZvBQaBVUSWzKwI+OPBMnP6hx0GLQ/PW+s6LK9zfVV27kqcJN3iWsfykHcMaFQ+TORjOQL+M8dCWIgtm0idFyZNW/rpEFBNxBedbkiX7VAVQ6aanC/en/A5sppXUvD5Z1yUurq67cU9HjEXnGoH8SsROzqbcMawqmez+4ViiAm5YaW+1r0TE3i8RmuLZXR2fys6zcBZS1yeAoITLL37O7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMXa8/m3OOlAUEY33laTcbWvejSlVkekOcforIXVLMc=;
 b=qKrzQptuWHLFaubXkj3qSfCwm2e51OJRtcTRz7VE0JG8bM5DxhRooitVfFklaCzmlTuJ1IrvnqaglBFSvuwCk1SpbD8MeNBXr+6fCH/Iu/o63ecbgx5tOxezQB+gIhjnhUp3mdFSQU4iNj1QLP+vfuLGCdNRGtGQtbU9rOqVERuXshTsy3Z2YC4VXP6kXP/iBw+TUqsXvy3i/yXvtpb8thOINO2CFsF0sBpAJsRsJDQED/gRMg1RBKxQJZjrlOBbPTaSTIZgPuECFeh0M+2QVMqrslfOEhbLjVG6s6bPY/cTHj9D1xnmbxjt7UW/EGRRbzA8My8Z/jafFl+GJ4QwaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4707.namprd11.prod.outlook.com (2603:10b6:5:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 6 Nov
 2025 14:39:28 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 14:39:27 +0000
Date: Thu, 6 Nov 2025 15:39:25 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/3] drm/xe/pf: Use migration-friendly doorbells
 auto-provisioning
Message-ID: <20251106143925.looszrns2xzr6ire@intel.com>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
 <20251105183253.863-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251105183253.863-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::12) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4707:EE_
X-MS-Office365-Filtering-Correlation-Id: f149b399-3c08-4fce-61d7-08de1d4249d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzVBdHB4cVN6ZjlDVzBtOVRqRG51cC9rZzhuNkdac1JzaE5zczJVenM3Z3Zj?=
 =?utf-8?B?YThWUkFVRlhNMHZ2N2NldUpaa28yZTF1czJpOExSODZTUmpQRk8rREc3VXZX?=
 =?utf-8?B?QUZBcVdOOSsyT3FTbEJIRTEvSlBUVEo4SGRiMDJIMWd4bnBIUkRDYjNyNGlj?=
 =?utf-8?B?VEFqV3RoZVIwVjRaVVArVkdFeGc3U3YvbFNqRVZWbU1Ld2ZTWUk4U2J4eXFj?=
 =?utf-8?B?R0h4YVR1clBOYVBlU3lRWlppWXJ0SnFpakNHUlhNS04xY3R3RUF1cEF6WVEr?=
 =?utf-8?B?K0JYYnNBeGRlSW5NM3M4WWs2MUxpbkErTDBxUXdGL0EvU2hFM09jOVZyejRi?=
 =?utf-8?B?cjdlQUpUMFlseHdjWjBEdXlWRTcwc3gwWnFNOHE2d1djU3hjVHVrL1lSSkIy?=
 =?utf-8?B?cW4ycjZTMkVCOXlISDQzV09YTk9jTUQ3ZldCUjVxVTlLejFuNGt5dnN1Q1J4?=
 =?utf-8?B?dHZ0bFl1anNPNGRUUnRZMEpVNklSenhKbzQvci9iSm9ta0pmeHBOZVVldHhx?=
 =?utf-8?B?UHg4a29oM2hlSkpTVDBBR0ltdnFnZ1Zha0ZZYVlQNFBYRDNLY0xXRW9sQzAv?=
 =?utf-8?B?cGhMV2k0L3plaFpVQzQ2OFBXMlgvWEo1QnRydXkvTXlzT2oraHdoS3dtejd1?=
 =?utf-8?B?dWRiQnc1Y2E5N1VuZ0xPdVVhVUNmZ2hKaFRQVUZNMnkxa3V1YzdtZnVITENj?=
 =?utf-8?B?a1YrTjNDZDBLQmxFaEkrL3ZZc2xnVmlzNnVvZXBGMjlyckU3MGpEa2pnek10?=
 =?utf-8?B?aGRTdDY0S2RickVBUHBPQmowM1pKZGwrRGlOWTgzY0luS1NxWXNDMDhCWTNj?=
 =?utf-8?B?dThhV0greWdRdmZDYU1XWnd4MnRIYXk4eVR6ek1jazdHQUZ1R0RpYTZGVEpp?=
 =?utf-8?B?RzNDaWxZNEFFN0JJRVdXajNDQTlZZDVYSzdtbExFRW9tN1lGNGdMTnZCYlFa?=
 =?utf-8?B?YlpwYm9pMm9VOUJIMFlpNXh0WCtFeVp3dm9ZVllPUlVaNG5uUDZDZmh2YU9G?=
 =?utf-8?B?aUdReVkxNG1nS2YraEMxc05Udk5XbGQ0cTNxKzZqaWxxTXFFUmRmdXRXNHhZ?=
 =?utf-8?B?QThmM00zUVdwNWYzcXBDUm5lb0cySFJ2WUJNZ0dsZEFDejg4bVpmQmtQOHdP?=
 =?utf-8?B?YVp3WVAzRUNoT1UzcTRWc1FNQ1ZNbXM4dnZpeGd5Rkl6V0h5TVAwK21zbWN1?=
 =?utf-8?B?aFM4akplMUhuZXIvbFNURGdKYmJHWlJqNnh2aU42SnlGaDdmbjc3S2I5d0w3?=
 =?utf-8?B?c3BMTTByektPVHZRMVhNUmJPaHBsd2VVYlhHaGZpdEpoa2l2bkFGNERiUjUw?=
 =?utf-8?B?ejhYOHRWNlMyZ3BmdDlkTDJpeVdzUUNTaTllbWtNMXZVVXVSWjI4VGRHdVV4?=
 =?utf-8?B?Qjd2WEU0cVQwU0V1blN5VU9ZZ1FwVDM2Y1hhOUpXWWlYS1NZZGE0K2JocjBn?=
 =?utf-8?B?R1F5akh3Q0JzZXl1TG11WHdETFdqWmN4RHJaR1ZIeFNMQU4xOGdka2dnNHR2?=
 =?utf-8?B?bEJKYzBZdnpOdHdhUkZSdlZXK2syMklCQkkxRkdnaFVvdk5pelAzdGJWZHZD?=
 =?utf-8?B?Vk53OUxyZ1V1aXlGMS9jUUc5K2llS3VIdFFud0FUT2IyK241RkRRNVNCekUw?=
 =?utf-8?B?eGxxRlFKNFFTMmRjcFZtNU5UZEh2Q3lOYmdqZytkaHhaclVVYWltRGJlZmQy?=
 =?utf-8?B?Y3MxZ0hkTVVGUVBnQWFjVFpHNm00aGc4TzJPTEhzcFBYcUl6ajdiVmZZdFdi?=
 =?utf-8?B?Z3pGOUxycytPdmZNd0kvRnNlRG84UWI1YUllK29CSFI3emNuM3dMNHNkSDNO?=
 =?utf-8?B?N0lBbFMyeGZsd21Ga1VML0IrQ09BdWh1VlQyZm1hVjU1VmVTVlVDMzlwVnR5?=
 =?utf-8?B?dHBNN2ZOdkdtRktYTklvRW9TcjMybFpGd2czVFZzTmlDbEgrR05YTFp2ZG5h?=
 =?utf-8?Q?xRZcriNL2SQmZ/Kld9hplTYNSnNULrxw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3k1NCtCY2s4Wmxsa094dDlra0pKaTUyWDF6NktQRkoxL3A4ZjRzeFNNNDl3?=
 =?utf-8?B?L0VQWUZ1Tlc4ZERvcEVsb2QyRStwc0xxN2hGTFFuUGJkSExKWlNtMXplM1lH?=
 =?utf-8?B?OW12eG5vNjJGdXNrYnNESEpUNVdyS2hOd29Yb203ZkM3Ri9UbEdVTUZEd3BB?=
 =?utf-8?B?M1JZbmZPNjA0QmQvbnRlc3lWYWN1N3pHR25VbUJWcFR3Zk96c0RlUC9TRGNu?=
 =?utf-8?B?MU5FVHVtTDdDcGo2OTIyenFvRXRoeU1aNUVxOVYyQlkrdGFiaDlucmxTbXBJ?=
 =?utf-8?B?SkdlK1pweUZaZUtOZ1o5V3pZYWR3dUZwRTBkQUh6TDREUG1JN0Q5TlJCQTVS?=
 =?utf-8?B?amVlTW1SdzE1M0RNQjlZcWZFaUJ4ZUtBUDRSdUlPMFlwakNmYWM2UGlHYlZ6?=
 =?utf-8?B?ZE5LalAvQk9wUng5UW9RNVEyTThvUWsrM0NBbjk3aEtkRENPRE51N0JUa2pY?=
 =?utf-8?B?TDZtMVd1R2k4bnNYanloc1RUNjhQc2lQK3lGTEVSVk96aVJsR01sbG40cCtx?=
 =?utf-8?B?OHZ3YzdZVnNBME5URUlxWm9lMlg3dUNqSzZJdm50KzlianpldXIyNDJpRjNL?=
 =?utf-8?B?czdYVHEzaWJQUGlMVVExUXVObVdwUFNxVldJNHovSDQzQkJwNTVxZ0pmSUNa?=
 =?utf-8?B?OEJJaDFsWFFCQW5YZFNRL05vekRHL3F1djF1NEVvZDA0V0VuOUdQM2J5K250?=
 =?utf-8?B?YWZhMlpvWkFCQ0Rkb1V3blNyMkhnU1ZpWEJsV0dBMzJqbFdoc25YalV0ZVJP?=
 =?utf-8?B?UDVHSlJGSUp0cUM0b2xGeTRIcU5YWS92THZMMENvTHhYZkE2VkNReEZqYTFQ?=
 =?utf-8?B?LzYrRlpRU2hhaXhLcURLN0pQMEtmVnROUTFsaUp0cExOU3gxb2QyM3RqYUpO?=
 =?utf-8?B?aGIvcUhaNTVFQXpic29jcCsyUmdQWVpLU2xqd0VGRXhmRFJYRG50MkxOWW1Z?=
 =?utf-8?B?MlUxRkN1NHR3eUtic3kwNXFuQndRTFFEeTdBQ010TlF4bkdoMnlaSnZvQ2Za?=
 =?utf-8?B?UnRKTjFBRmxYM1FPVEFUNmV0T3FORzV4R3BFdkZXalltK2hITVJuU0cyT2Va?=
 =?utf-8?B?c2Q1dnE5TDJzemNGVmxmNndtT05LNi8vQWd4dHpRWHNsTGsyTEtUcFRQM280?=
 =?utf-8?B?SWxxWkhnWStWcEJUT3FYUzNnd2ZPMDR1cU9mbnhYTW5qSGpGL2JrZUltSHBZ?=
 =?utf-8?B?cVlLamtkM3BUeDFORW1SZTV4aUU4c0I1TEI3dlZ2YlQ1amh6THprcmFSbk16?=
 =?utf-8?B?U0RMT21PaHFoTXV3UGVtSWhmeWRvcmlJQW1WcGpGcWpibU5GVndkc1ppUEpr?=
 =?utf-8?B?NGFzVENkcDBHK3RTaWdoWHQvK3BnTTVWYmVseHJycW1qV2ZDRFNkOHRKZkhD?=
 =?utf-8?B?czV4aUZSQUdLblhRV0dZeTdEdSs4SGJhcU5nZ25nYjh5TlNrNnBQRERLemFZ?=
 =?utf-8?B?OEVjeXBuSmpDaG8ra2x4UlM1V2ROSVovVHJwd05MSEhKZW5ZOTVSeXk4TzVk?=
 =?utf-8?B?WUhlUDF1UExLKzMvMitUSzl6dmxKenRsaTBORjdEeUFzckpEZUVGUThoelBq?=
 =?utf-8?B?VDIvSXdUUTFxWnliUWJxQVJFRndBYWdobGUrUldYL3hscWYrQnpsZUhOSDY5?=
 =?utf-8?B?aFJtTW9vTnk4NGY4WWhoNUtVRnF1Q1diVUhJQWFPMnVjU3c1amwzSURpS1FQ?=
 =?utf-8?B?SE1tN3p2U2lZMVVPMU5GU21EYVpYbEl2VkxVV0xVL1g0S0lQQURNOXFDSEgz?=
 =?utf-8?B?bjBUbjluRHZ5SGNWSGFZczFaN1dYcjBVTmp4Q0JLYWJ6MHJHdUR4S05rdTMz?=
 =?utf-8?B?YWg3Y0pza3VBenhFSHpBaWJTcEhvdkV4b3J3NjlpcWRwdVdpMk9iWXZjaTRS?=
 =?utf-8?B?Yk1tR0xKUjFieU5JSWtqbExXK2VuUGlZOWNkSU9BNk9wdWdTRmZTR0w3YVNQ?=
 =?utf-8?B?KzFENHV2RzhsNG9HalV4L0lWZHlRclZLR0Z6VEVUWE1zZmNVQXZVenNEMWpl?=
 =?utf-8?B?OUQ4TVlTSDVsQURNT3BLanNvaUtaSVFtN00xN0pwNG5IcHoyWWt0TmNhVUVr?=
 =?utf-8?B?OEZBRktNSFhrUWx3MWRYeGdXRjdXcDRYcHB5U0dEbE1XeEd3ejhDay92Zmt6?=
 =?utf-8?B?Znh1ZEtWTVRBL0k1OWhkQ1d6RmZZTEk4TWpJSEsvV2pSZUVuekk2dHVzVita?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f149b399-3c08-4fce-61d7-08de1d4249d6
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:39:27.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0a5BgMX+qSNtqGU+nnGsGgXtHbebKu9yr6Of9uCSLeIh+e6A3gq8MluwbktliovqLYxEO5HNBMLdccqDlHF5dvS+gVcjvkz4JSnfZCKyx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4707
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lis-05 19:32:51 +0100]:
> Instead of trying very hard to find the largest fair number of GuC
> doorbell IDs that could be allocated for VFs on the current GT, pick
> some smaller rounded down to power-of-two value that is more likely
> to be provisioned in the same manner by the other PF instance:
> 
>   num VFs | num doorbells
>   --------+--------------
>    63..32 | 4
>    31..16 | 8
>    15..8  | 16
>     7..4  | 32
>     3..2  | 64
>        1  | 128 (regular PF)
>        1  | 240 (admin only PF)
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 14feda215d5b..701889e5dded 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -1249,6 +1249,17 @@ int xe_gt_sriov_pf_config_bulk_set_dbs(struct xe_gt *gt, unsigned int vfid,
>  					   "GuC doorbell IDs", no_unit, n, err);
>  }
>  
> +static u32 pf_profile_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> +
> +	/* XXX: preliminary */
> +	if (admin_only_pf && num_vfs == 1)
> +		return GUC_NUM_DOORBELLS - SZ_16;
> +
> +	return rounddown_pow_of_two(GUC_NUM_DOORBELLS / (num_vfs + 1));
> +}
> +
>  static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
>  {
>  	struct xe_guc_db_mgr *dbm = &gt->uc.guc.dbm;
> @@ -1281,6 +1292,7 @@ static u32 pf_estimate_fair_dbs(struct xe_gt *gt, unsigned int num_vfs)
>  int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>  				       unsigned int num_vfs)
>  {
> +	u32 profile = pf_profile_fair_dbs(gt, num_vfs);
>  	u32 fair;
>  
>  	xe_gt_assert(gt, vfid);
> @@ -1293,6 +1305,11 @@ int xe_gt_sriov_pf_config_set_fair_dbs(struct xe_gt *gt, unsigned int vfid,
>  	if (!fair)
>  		return -ENOSPC;
>  
> +	fair = min(fair, profile);
> +	if (fair < profile)
> +		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
> +				 "GuC doorbell IDs", fair, profile);
> +
>  	return xe_gt_sriov_pf_config_bulk_set_dbs(gt, vfid, num_vfs, fair);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
