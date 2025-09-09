Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC06CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5657710E709;
	Tue,  9 Sep 2025 13:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM/UQP/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F388D10E709
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757424085; x=1788960085;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=RMeLjvQaDXj7v7lO9rZjP1V0CoVK/xowJ82+4ie69Uw=;
 b=ZM/UQP/gN8Eu0BbCgCZr6TP/9pIjIBQHBOQ+5tjhjhRb2t0JTA74tLh5
 tQ2bd93QVhYY4GFphzr6g4OuW/0X0fTeDsI6K8q3D1VZja/9IzzHb/WXF
 hSOaHePSZMe1roipCbCFPddSJ/UlNxtOlFtKm8P0ALqalPjWjojTJMg1u
 hGlUKv4UfvypQZjAsDzgLfWl9gIsKL6URreg5WRuCFJZW+oOCm3R7HlPk
 GbJ5cx+rYfviGtPHRZB3OrDJeg9xZPGKphnyixnii0+l64V/JP2NqLnmN
 V/ZcytuAvldCiwOMN7htHNkX5223WeAl7vbYTAUjT60UiSlXHY0vigpte A==;
X-CSE-ConnectionGUID: Vr2VRudETfKc8wEsnzRp1g==
X-CSE-MsgGUID: tGVKEARKTuu2vYJt7R4YSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59646729"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="59646729"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:21:25 -0700
X-CSE-ConnectionGUID: 0Wo9gPtRSheH87eIrCmpow==
X-CSE-MsgGUID: 9IuJPA+VT0KjudqLdT9PaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172999976"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:21:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:21:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 06:21:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.82)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 06:21:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kr2nCgM6qbZCPwmMdUD39c1qAGpF3vcAU1d/+7sImgFpyCUoIVoFXuQij/+lKTqdMy+v1RIGMVPaeU6PzaWP3Bbf+OkZIN1wU/EebZ/czWH3rGj6RxcKMUL82kvgw9646q6ki52L/lUD3D4TTBuHeTxUGFTMbYE79cfqgTNNOLCMfiGhSm4I6tpnHrpLzEAL3E+PaWroj15B7YievI+jSowh3o4mPnGp0z9muElLfcDi4pW2bqum+z5UWSwzuKLQjtXquQ1N2ZdgwYI1j6njxPAKeDtLMs+pQy2NffepSd2rYOpUZx6Ax9RixdH1/O9QCQuCeiGpG55THYSzf0IE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFrRGk3V0ZmiTwzLT24q7URITtljV/Sno0bQC14WFJc=;
 b=ig9BvLwNVlDeVQRTTBTLokcvUmB/uRRlykIen6Jhna8bsfMGjIs7d0LWcFXf+AbIvvhwR28q2H9wh9oZ3kc1GdgMGoW9+AUDsJAcywWze2zsywZRvtUHRb8hOd2UmIONkg7zqKM3w1HPcL5uuoD41zGWt0iUA1WiE9jW2NzjyjFiES54vLm7ciHUKAbKtfBCNksKjbgT89XTj0Z33cptVioHg8TbDftO87W9+xcTVtwMlMv4qzI/EnI7EbYQ54dSr5IGnE3O6kE3sBLzujjswTKa7nNIxZo4/tyz3FdY+EVhhqd5jcBW/nQZWiaD34oamlqDGb/5ZJAc16kM6dxBDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by LV4PR11MB9490.namprd11.prod.outlook.com (2603:10b6:408:2e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:21:20 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:21:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <trmhqavvrqo5ujkot2apdmtmiylbkhpnbinfocnotyvh3fo2v2@so2ll7po7bzn>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
 <175710134539.5916.1325336923027423466@intel.com>
 <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
 <175734053228.1838.4745774366865518571@intel.com>
 <trmhqavvrqo5ujkot2apdmtmiylbkhpnbinfocnotyvh3fo2v2@so2ll7po7bzn>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Tue, 9 Sep 2025 10:21:14 -0300
Message-ID: <175742407469.1838.8196804884213124088@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|LV4PR11MB9490:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fbf6b2-1573-4b2a-2444-08ddefa3c374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDY0VnQ2bDNxcmVVTmVVaFM5amNrbzNxSWRNSDlmZTY2UHJEN2ZxM2xkUEhs?=
 =?utf-8?B?Mm15bE9vU3pvWWUrdDN3NEwyM25SaHpSR1VRenhSM2pzTkdOWm1KSlNQL29z?=
 =?utf-8?B?dlpGUUFpODlQWlh0RUNHc3YxSzgzdHdaYStUaEpvRFB2Vm5yWGRnUXpCYjg4?=
 =?utf-8?B?ZnF3K0RkWVVWZm5wMklDRG9nQlJ2aVlZQitWMDZLOWtUNU9ZNmJPdDYzTEtm?=
 =?utf-8?B?amV4R2xyTERVZ3lVYzcrWWpBb21hSmdhbGdTN0FxeWZnWmZ3VlJqb0V0VlNH?=
 =?utf-8?B?N1V0KzQ4ZGg0QitZNUtKM0crTEU3dlFYRHo3TGhjTXdkZzlMcmlDLzFzeGVC?=
 =?utf-8?B?R00zSEdtNjRhWEMxTE9JNmEwa3lESURhT2U2MFBnSUQ4Qzl2Z3VXdHhObEhY?=
 =?utf-8?B?bDhVTVFxdEo0NDF1dGJCdmdTNTNtaUhoVjc3TjQ2UnFIQ015SVFrZlloM2xO?=
 =?utf-8?B?dytnaEJoVTdWc1c0MGFtSHgxa3Q4ZjRVVERQMWlVK1VuQ1FsZmRrSStTdmhv?=
 =?utf-8?B?dWdRM1d0NFdCSlpOL2MrbktpWEpLcWUrY0lqbU01VmZySW1MSDlSZTFvK2dH?=
 =?utf-8?B?aHpwblJTUHA5OHZjbmlJajF1RTBrL05abUFRdHBkcFZSNVlSNFcwRzR5dWNF?=
 =?utf-8?B?T2dtci9RY1dza2o5SFZZR0hJSUhHc1Z6QzNqT0x2UWgrVXFQY3lmeVJ5bFFV?=
 =?utf-8?B?ZGdCNTJqVktkY29mRzZ5NkFRdXptRGVhS1dMN3I5UFlXR1RRZnF3eSsvUTN1?=
 =?utf-8?B?eU5iMW9tVEpmTU1HTStuQnREM1llR2JoSFNpMVZRMExremJiY3FTZE1SNHpX?=
 =?utf-8?B?Y0o1SjJReTY0N2NQNXdSS0dZY1h5NUVJODliQkpRNmNjcWFtM1lXVkl3ay8w?=
 =?utf-8?B?V0dQU2xrRmt4YTJSZkNyTXQ4TUxhS25VdHBFck9Hek4vZUZRc00vUzhEMlB0?=
 =?utf-8?B?ZXdkc0VHOWlTU0JWWU8zRzY5MWgxcHc2aWgzZXBwZ3NGNmxsenRza0x5SW5W?=
 =?utf-8?B?VEZ1L0Q2aUNDWU9jdjZpb0xTWUs5T0pLV2k2ZHFLclhxTTF1b21zZ21uK1hV?=
 =?utf-8?B?YjhzVDR6R1FpbVRWN2dJZHprUHprTStlSXRkaGVOd3p0UFlBL2hVc1kwWWkv?=
 =?utf-8?B?SFBmb0ZRYlhGekc4Z2owRWpBWVdvd2pWaTFicjVqL3dIbjZWRmJNdHJnU1Fl?=
 =?utf-8?B?Sk1qSVgydTUyTk9uUE0xZEJmbC84bncraGVFMjF6STF5MnhGYXREcTM0UGo3?=
 =?utf-8?B?cGpZdHZRQXViOGpoN2hncTlETmJsWjgwdnowY0FGeGZtaWhLclZ4N3FLWFpr?=
 =?utf-8?B?NkN3RjRuODVheGVGZVZUSTBjejhXanREVUE3OExWWEM3MUZjTVZjd2RqSmh1?=
 =?utf-8?B?Zi9EdWVldlVmQ3drZkJ1MVhhblZIVjYyVFZuTDBOOFM4Y24zNENWTmFuZ3or?=
 =?utf-8?B?QTNJOEtMNFFZMGVTOVROYkdMaDVXbUFBbFFkNzVOd3M3K2VJd3NlWXdjaEc3?=
 =?utf-8?B?UCtsZm1taEpjOGxaRTZKZnJKNWtyOEFNT0tHcVF0OEwwbDlyUEI1M2RWOCtR?=
 =?utf-8?B?Nm44S1hWUmtxR1JaaTNWMlRuN0pLMU9GMS95dXJlVFpKY3orUFdGK1B2Q0Zt?=
 =?utf-8?B?WjJqcWFYOUVyckNrb1NYTkNSM081Z1Z6WFlRS0V4Mmh0d3NWZmY5SloxTjA5?=
 =?utf-8?B?UXNXMTlaa3hFczZDclVpd0ZWYkNJZTNseUhLRHF1cURzczZqdjBTRXVLR2lQ?=
 =?utf-8?B?T24xZkFweDJVNk4rSE1iaGw0anhNMUNWc3F3TzEwclM4NXFpZWRvdUVZR25U?=
 =?utf-8?B?d2tZSGdBdXVvL1JQNjU5Mi9HUm5VcFJGWUUrVU9qeHl5YlF2OWd2MzlEN0d4?=
 =?utf-8?B?RFJGclZiWnhBeW0vWG1paGRBblBKaWlmclI2WjRycmlSWGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0E4MUdzZC9oZkdHRjUwT0YzZGU5SlU3WWxzMG9RVnY1NEIzVVczRitvcTF3?=
 =?utf-8?B?MDdGTU9NdmNESDRsYlFHbjFqQWNXT29WK3V6YkM3QkQ3dlFDdFA2OFlRQ3lF?=
 =?utf-8?B?aE0vRWg2Z2w2UWQ0QjBqMThJUnZrMk85V3FyVFVRVU9ZNlRlbnUxSlBUc0pC?=
 =?utf-8?B?MHl4S2R2S1pidllIYjMrdXg5bitOc2hsK3laZE5xWEZTclM0bXoyL2lkdGhC?=
 =?utf-8?B?ZFFjcDlxZitWVjIxRVUyODhVTkVMSEg0M1FxRlBONkNtTWhhV2lTMnc2ZWZy?=
 =?utf-8?B?QlhuNFB1UXFrUDVFYm5QQUNMWXNIa3daejhVM3REWjhrZVhnVFJ6bWVZOXpV?=
 =?utf-8?B?eXQ5Q2RFZS9HRFFNRU4zU1RJSFE4QjErNGFrNU00bVB4aE9lVXo2WG1Eckpq?=
 =?utf-8?B?K1hEbjdBd2ZyVjNLa01TbUx3RzFVamh0bG1pWmU5ekdFaFdPdkxjOE50Ujhj?=
 =?utf-8?B?OEQvbUZCVGdoZnVROGlUMHhwTk81N3FxWG93RVRnd2dTRVFEVFZpWHVSM09l?=
 =?utf-8?B?a0tIU21reUdqZUJjNzF6KzdUZ1pJK1BRR2pOaEkramhwNUlDUElwQXk5bmI5?=
 =?utf-8?B?enh0RFdBOEh6WVI2ZlNzY3VJbjZvMm93REMycFZ2MWMxM0V6NXl4SzExZU5Z?=
 =?utf-8?B?TE5LUVVGcjU0L1NHejBSNWYxbHkvVUt5Sk1OMkJWV1hScHJSd1J2TkhkUmRm?=
 =?utf-8?B?LzdoV1BLRndDWlpqN1lzdmw5NTFpYlRreFRIalA3aW9EeURjbGlBdzFTY2pt?=
 =?utf-8?B?YkNoaTVLYjA4U01USHdhWGVQSUVkZ1N1T0dQYmU3UUVla2txa3VpTUN2NDU2?=
 =?utf-8?B?dTk2NFJIcitBaktMYnMxbXhmSlB0WVRGaTV5YkhyQmxyckh1UFJ1T0NsYXNU?=
 =?utf-8?B?Sm5ZMHZqaWl0Q0ZhYm41alhXTExzdTJwbVQzUW90ZXhFZDBKeDBBSHIyVEhm?=
 =?utf-8?B?RXp3U25VWFVQWnc5VGJrTGVjdG45SzFWc0t1S2xSZzZwc0ltSzZhbU0wN05Q?=
 =?utf-8?B?T0djZExKUlBManN4T2krRzVVbGZOeXRnT0J1N1RtU0J1cVVWZUpWci9RWWRi?=
 =?utf-8?B?N09TUmQ5U0g1cWFFa1lDTDJ5clVJZHoybXR0MWdqL2NjVko4ZnJWZ1YrRUpS?=
 =?utf-8?B?NENVbUtxMm1mUWV6Si9UWlYyWUFTYVgvcUVoc1dycDdjekRsS0pxMkRTTmtC?=
 =?utf-8?B?M3ZpUGQ0TWpPN25YYmoxVU51M2lrVlh4OFF6ZU92R1BZMGRmdDJ3cXZqWk16?=
 =?utf-8?B?L0JEaFM0cVhQUE5Xa3FkRmRZS2diU3gxWDJKcGJvMHBHL0ozZlE3am0zbjB5?=
 =?utf-8?B?RUVaRjI2aFJDYUtHenFyclRpOE12MCtWbDZKS3NhNEI3OHZnemNmOVkyY2R5?=
 =?utf-8?B?SmJ5bTB4VjhJQUxPemNQai95ZGhXQm56b3Y3MGFEa1VJRUdFL2NyT0hkWU10?=
 =?utf-8?B?cW1LWUFMMUo5MlU1bEZKTm9jNHBvMDl6WDUxUjRWWHhDRWxoNjdLM0Z0eTY4?=
 =?utf-8?B?TmZxb2xmOTVxdktuYU04SXZHanVUcU9mZC9Yd2xZeU5FMStpOWM2VWhXdVlp?=
 =?utf-8?B?UU5UOW53cUhsM2JrcmhxOHphSVlQU0xwUVFsREZjRm00NDVzVVVkS2JpREw5?=
 =?utf-8?B?MFcxTGU2VS83U2hDWWxsSklrUDB6NytKMERQRFp5dGhNRXpyeHAzdVFjcHpK?=
 =?utf-8?B?ektjN2pSNnVrbEcwRnJLWXkyQkJmSGJ1VHozNHBEMU9WZDBLTnNkZnI4UFFM?=
 =?utf-8?B?WU9iZnZBV2xCbHJVOHJjcE9sUnAwNjR0SzF6RXNKR1M1Y09DVmZiNWhyQ25l?=
 =?utf-8?B?OW01TEZsR3ZRZVdpd3JZZWNxd3E3cFdHbDRRTVc2emVURTl5NXkwY1IvQUpW?=
 =?utf-8?B?YnFmTXZudnRoUVFka3ZJem9CdEIwZCsybmVnU3ZBd242MWcrMUxlU3VZOW0z?=
 =?utf-8?B?SVBzL01OYVV1eE9McHJVTVdTWjhqWmpMTWlyN1U4VjViWDlKelNpd2g0SjhR?=
 =?utf-8?B?aURhY0tMM3QyZU5vSFd2WEZnQUdkWWFIS1dOODlKd3FtSzBaU2RuZ2NzNTRQ?=
 =?utf-8?B?TGRzRjJhamZGYWlnN0h3bDlub08zOUQ3RHhuemRFemh0NEZFWW84RlRBS0lj?=
 =?utf-8?B?b0FDNXQ5WHdxb2w2ZFBUU2RpaGZqNzJoaVNzMHFXemJlS0IzR3lKdnJLaTRi?=
 =?utf-8?B?Zmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fbf6b2-1573-4b2a-2444-08ddefa3c374
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:21:19.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SJFoSW7WSF4wkGyLNWbx9eJ3cQsXTmPVMbISwUEb+2AL0FrWQLbhVefHkJ0DjrmZGDDxs37Vz1ZeCRYcsgqnBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV4PR11MB9490
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

Quoting Lucas De Marchi (2025-09-09 10:01:52-03:00)
>On Mon, Sep 08, 2025 at 11:08:52AM -0300, Gustavo Sousa wrote:
>>Quoting Lucas De Marchi (2025-09-05 18:38:28-03:00)
>>>On Fri, Sep 05, 2025 at 04:42:25PM -0300, Gustavo Sousa wrote:
>>>>Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>>>>>configfs has a config_group_put() helper that was adopted by
>>>>>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device"=
).
>>>>>Another pending work to add psmi later landed in commit
>>>>>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>>>>>the helper.
>>>>>
>>>>>Use config_group_put() consistently to hide the inner workings of
>>>>>configfs. No change in behavior since it does exactly the same thing
>>>>>as currently being done.
>>>>>
>>>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>
>>>>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>>
>>>>By the way, after taking a look at how we are using configfs, I wonder
>>>>why we are defining each "device" as a config group instead of a config
>>>>item. Shouldn't defining them as config items suffice?
>>>
>>>The xe_device maps 1:1 to a group, i.e. the <configfs>/xe/<bdf>
>>>directory. When setting/getting a file (aka item, create from the
>>>attributes), we find the group they belong to and use that single
>>>lock to synchronize:
>>>
>>>                  1:1                                1:n
>>>        xe_device ---> configfs_group (xe/bdf) <---> configfs_item
>>>                                `->lock
>>
>>Unless I missed something in the documentation for configfs, the
>>attributes themselves are not config_items, but they are rather part of
>>a config_item.
>>
>>I believe our current hierarchy is as follows:
>>
>>    xe (the root config_group for the "xe" subsystem)
>
>which corresponds to static struct configfs_subsystem xe_configfs,
>that has xe_configfs_type as .su_group.cg_item.
>
>This is responsible for creating new device groups with the device bdf.
>
>>    |
>>    |-> <device0> (the config_group for the "device")
>
>
>>    |    |
>>    |    |-> enable_psmi (attribute)
>>    |    |-> engines_allowed (attribute)
>>    |    |-> survivability_mode (attribute)
>>    |
>>    |-> <device1> (the config_group for the "device")
>>    |    |
>>    |    |-> enable_psmi (attribute)
>>    |    |-> engines_allowed (attribute)
>>    |    |-> survivability_mode (attribute)
>>    |
>>    |-> (...) (and so on)
>>
>>The way I see it, we are defining each "device" as a config_group, but
>
>why would device0 (which in our case is actually defined by the bdf)
>not be a config_group? the rough mapping is basically: each directory is
>a config_group. In sysfs it's possible to create a group without it
>being a dir, but it doesn't seem that is the case in configfs.

By what I read in the documentation, both config_group and config_item
are directories in configfs:

  - a config_item is supposed to represent an object that contains
    attributes, and each attribute would be a file inside the
    config_item's directory;

  - a config_group is supposed to contain multiple config_item
    instances.

>
>xe/0000:03:00.0 is a config group created by
>xe_config_make_device_group(), that is called when userspace calls mkdir()=
.
>
>And then we have the plain config_items inside it:
>     |-> enable_psmi (attribute)
>     |-> engines_allowed (attribute)
>     |-> survivability_mode (attribute)

By what I read in the documentation of configfs, those are *NOT*
config_item instances, but rather attributes that belong to
the config_item facet of xe/0000:03:00.0.

>
>Maybe the confusion is because there isn't a .make_item defined?
>
>>we are not using it to create child config_items; and we are using the
>>group itself only as a config_item.
>>
>>I don't see much need for us to use config_group to represent the
>>device, at least not today, since we don't create child config_items for
>>it.
>
>not following. Maybe it's easier if you write a patch to refactor it as
>you are saying would be  correct. From the docs:

Yep... I could try something.

By the way, I'm not saying that our implementation is really incorrect;
it works.  I just think that we are defining devices as config_group
without really using its features and that the config_item abstraction
for them would suffice.

--
Gustavo Sousa

>
>        If the subsystem wants the child to be a group itself, the subsyst=
em
>        provides ct_group_ops->make_group().  Everything else behaves the =
same,
>        using the group _init() functions on the group.
>
>That's what we are providing: a make_group that creates the bdf group
>and has the items inside. Compare that to e.g. one that has the items in
>their subsystem's root: kernel/crash_dump_dm_crypt.c. In that case we
>have a make_item() defined and this is what we see in configfs:
>
>        # tree /sys/kernel/config/crash_dm_crypt_keys/
>        /sys/kernel/config/crash_dm_crypt_keys/
>        =E2=94=9C=E2=94=80=E2=94=80 count
>        =E2=94=94=E2=94=80=E2=94=80 reuse
>
>Lucas De Marchi
>
>
>>
>>So, I believe defining the device as a config_item (which would contain
>>the attributes) would be enough, no?
>>
>>--
>>Gustavo Sousa
