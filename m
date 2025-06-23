Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A0C7115D
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 06:28:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06CA810E187;
	Mon, 23 Jun 2025 06:28:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aE5jauFM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD4B010E187
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 06:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750660124; x=1782196124;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TMq2jK3MAKDMOH7Yaqlpq8omoV0DERB7pUj1IthWlno=;
 b=aE5jauFMPzy1Ed0pwWVjyjkjFVAZSFwR+u/sr3ne1FSWZYXH8OLgu6i+
 4QuKxTK7QZ6q0Ijxe5rS43ig9oG/vvGSQNVy1sPrl+PON87KQ4EYm5h3j
 KfGgoeVPcCeL6fXq2QIXe0avj1/IpdQ6QM+4mWAnTyxMImLYqWfU1zTBv
 NRIKOT2Mr8tKyzhdc2HPck9qWYne8e9htJnWVOjNpAh8YlqvTsvQVYVr5
 HzEemK39w4j7XHgxHveLg8VF9ZkmStC2e2MWxLPp3a/PlL+jwAC0x6QSU
 zOw9PuNPOue0HrR58rCTeKdqDtB0p3hGpfnU14fcteBjWZkYSv01YNglv w==;
X-CSE-ConnectionGUID: cl/z3SBHRuCNVfyEsnUtgg==
X-CSE-MsgGUID: o/S5x24VSNGuzy2A693KJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52941551"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52941551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:28:44 -0700
X-CSE-ConnectionGUID: qYL1VFI0Rb24ZI8GZZmq4Q==
X-CSE-MsgGUID: 0ApufoKRQMuZAcOG5jKpSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="150977748"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 23:28:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:28:42 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 23:28:42 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 23:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qRklKHxG3aDTXlSOrsAoXfYlgN3ZTvXIc/EjBVI6pMmBTpHvDOcGIBqMSS/XZLNWvieZef3FQSWXav+T5WQcrxbk4Zv6+1uB4LS4ceI2uejhO/EVupy7vIztjc2vTveSrEO2aM+vta6ZXd6LwxNj7A0Hcp2Q73afiuN/wMYMo2dtxAhRzBe7wD+WoramnC3f1cvO3ekRPD6UUN8m142YCYdzmxXJlxA87abL+iFdcz9JTGA+866ODnao5PVvBhcwdh5TI/MZQ/ipxNPQUgzQuF32a2pMtRSgEGEfPflyE8P19nQGqryG2tp6MST45oKbf9MmUiJY2rPNW6ZN1fP5QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmwzDNS0VtX1SevI9j2El7grcIeBdCjeW+eQ1wX+BHY=;
 b=anQAtICq4Gj72Emw0W6/QDZU9ooY9RqT1kr+4+NlTCjt1pK59QDxiyrJ5uJmqSL0Ch0zJnUG8yl79kSD65w/3/bcWgPdaSygA6SEu+1HkdezcD6pgNnT/MV+h5oZ/37+a5j+xlO49tIqxU/MZVpoReRxrLffPdvk1VFdugaBNnEfMZk4gYUdSfsGWw1sMcZxzfrXFdEODU2Tmuy+qGafOMviC9wlLCU56XNkf0DEriulR/aoSc5yqr0gt5s1sO5BLyOjOt/klc/eoelCnYD/YYKSl2FIrnJ+hRsXYSEM9zzv74/Ie2EwbvCnebFlP58pTq5z3UP6emRnpj6kJ6ng2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by PH8PR11MB8258.namprd11.prod.outlook.com
 (2603:10b6:510:1c1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 23 Jun
 2025 06:28:26 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::2ae2:110b:2487:40ed%6]) with mapi id 15.20.8835.018; Mon, 23 Jun 2025
 06:28:26 +0000
Message-ID: <36b563ac-c95a-4ae9-b895-7195cc2062c8@intel.com>
Date: Mon, 23 Jun 2025 11:58:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/20] drm/xe/vm: Add an identifier for madvise in
 xe_vma_ops
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-11-himal.prasad.ghimiray@intel.com>
 <aFjoXh8eORIrcYcb@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aFjoXh8eORIrcYcb@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|PH8PR11MB8258:EE_
X-MS-Office365-Filtering-Correlation-Id: 2706141c-71f8-47df-77f0-08ddb21f28ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2tqaHd5ZXZjQlgxZENnblBZRWFWbnc4NnA4cytLTFFCWUdoRjBOV05oKzVC?=
 =?utf-8?B?RXZsZkdjRDZEU2FIL0dHVEQyK1gyZ2JQTStadU0vN0x4b2lEZCtQcStDeUVI?=
 =?utf-8?B?Zjllai9nbkpCVmZ1R3h1NjZWdzJDTCtvakFIQy9HM3dXaDU1NnhydEVBVnlq?=
 =?utf-8?B?VUR4bW1YdkxsRVkvMGJqb3FpWDFCTUxtbkJiOFFESEc2Y0FxSU9SUEx2YmZy?=
 =?utf-8?B?UFkwbDdtditYY1pRbGdMa0IwYnVXYnp6NWprRWIwcGpaN2tYeUJaeExTelB0?=
 =?utf-8?B?TUIrYVJZS3gxS1pPeTJJamVIMWh2THJ5MzBneW9SaVJEYXlrU09wWXhTOUhE?=
 =?utf-8?B?V0FVditBVmR4NGV1b3lWNEhxOHJMUFlmcFJmMTQ3a0NWMzFMY0lVNVRjK0Z2?=
 =?utf-8?B?TDB2OHNLVEhFTU9xYkRNZUJCcHdJTGNlblRiR0dkUnZwUjF4anF0NDRkTys0?=
 =?utf-8?B?cmxzUXRVWnExR29iNk5LTHlYSUZTYW95SXBQaEhsVzd6WEp3ZzVVWFBIUWxz?=
 =?utf-8?B?RGU0ZlZBd0RNTXNTS2xHZ05La0RlaTh4RmxTMEFpejBtUWQ1RzZZaktCWFA4?=
 =?utf-8?B?Ukh4QXBEbFlQVDFncmVJcjlZMVBJTHdvSUVUbktyQ24zWkVKdnM4MTBVSnF6?=
 =?utf-8?B?TmxnTEVlM0owNDQwQXo4eWR3cFBUSXVuMk5uWmozVFdGQnZRc25Lc2hxNG8v?=
 =?utf-8?B?cEVTclllS2MybnpKOFRUUXZ2NjhNMlFSLzRiTG5OQnFMdlgzektZT0sxUWRo?=
 =?utf-8?B?VFFUekZXK3F5eVJHZ3ZIOU1aYzJpQ1BqZVZuQ21yVVNwSGtERzNhbC94THd2?=
 =?utf-8?B?cm0zcmxzdTdqbUdnc1Q1OXR6aXRKencxanZ5SzJoTlZ0TGNXSFphZ2dMVXJx?=
 =?utf-8?B?bkNtUUxncEFOUDhhN0xyT3ZXNExlemFBYWR3RWdXUXg2MndtQXlVRnZoTm1I?=
 =?utf-8?B?bmxvck0zVEFYR1Z6aElWalMyMDBHWFZSRXhlYllKeFhJNVJmU3FyTlNVcDlm?=
 =?utf-8?B?bXA4WHZkZU1pbWxCY0ViL2ZyWXNwUkVGdGFDRnp2V2J1MzQ1c0M1ZVlNUGxG?=
 =?utf-8?B?MElraklFOWM0R1ZQQjN2NzUrREJKdndJREFKQWV6SEZTR2Y5NENBZGdSMDdI?=
 =?utf-8?B?aXVybFlHSmwxUHNJZG1XUTBaQS9JR0tSWHZzNnJlRGpVYXRLVXVBamNJSWdZ?=
 =?utf-8?B?NGJlZHVJWmRhQzdLNW5CaTF0Qlo4Q2t5RHhGdjR3a01Rd2lOa1Q1cUJzTk5K?=
 =?utf-8?B?LzJkQUMybUx1QU1Dcjd3S3EvZGdaWkpVNDVMVVdpd2FkdnhWbTVzSlNJT1c3?=
 =?utf-8?B?dHJCQjZKOW9hQkI5VkwzN2U4eGJlYXJPaVV5ajVackQ5MEZSTXdvNnI2NXRP?=
 =?utf-8?B?UUE4cFVROGMvTmJWZ2lQNXdzUmcvb3kwOHFabC9ITlRKcjBNWU9vU0RTSzlQ?=
 =?utf-8?B?QnpLNzh0VEwzY2U2SnpwSnF0czJHNU9nWFpLTG9YbmlBOTZMdklDcmVlNWJt?=
 =?utf-8?B?N3NBYUJPTkFkTWRIeHl4QnROaTVkcjl4YnpvTkVhd3NUQkpvL0JDdk1nTEJn?=
 =?utf-8?B?WGRxL054WlYvdEZZa3BYUlJEMUduakxoL1ZacHkzNzFza2dkaG9Kbk95cUdT?=
 =?utf-8?B?eEExVk0xekdOeGNEOE9XYlljV0s3SEp4VFpDRTZZMU1lL1QwSlZKRDBZQVpC?=
 =?utf-8?B?QzNNK2FKSnlRajRmdTduSldTeG1qdTJVR0s1d0VKb0tISldrbXBWZjFQT3Nl?=
 =?utf-8?B?RENBd3NSYjhOdjZsMnh3eFB5TTRhZGpFaURJVEVQQzJ3eVRZYlZiNVhKd1ZJ?=
 =?utf-8?B?Nks0ZlFaakFmRVNnN0NJb0w2UGZPci9mdHFXL0ltV0xpNXRQODdLaUNuamR0?=
 =?utf-8?B?dkE1RkU4ekVkSGJyeGQ4ODh5SVprbjQ0K0hKYmtFdEU0MUIzMEF0ZUxMUEdh?=
 =?utf-8?Q?oawH7XWKaE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXBhcGdpQ1dxaXIyQ2xkTE1wSGluaWRPM1ZBaXlEekpjQ3F0VURuSEtlS1dC?=
 =?utf-8?B?K2tTYTYxL084WG8zQjA4OU1PdFdEaDBaNVhvcmNQaEhiVEx2OXV1U3M1Wisz?=
 =?utf-8?B?NGltWTYzZHVPZE5XWjdQTnF5SnB5SUFZKzlNMVlOR0VRemEyN1o5MFlvMHM3?=
 =?utf-8?B?R0xyczZHaDZaME5lVnBrUy8zb0FwU3ZYb0hRalU4c3ArVVZLRnhIOGdKei9s?=
 =?utf-8?B?d2dIaEJXNU5XM2hFanZBdXFURUY4NmdIZkdvSTlFbTRpS0NwZUJXWXllRVpP?=
 =?utf-8?B?TEhYUGx4TVFvbHFLVzZGcGc1SzRUZDN1YXVGVnBWVk1DRDFLbm1UUlhPWWJR?=
 =?utf-8?B?dnlPdVMxTmZtL0xoTWtnOXFhY0VmQy84VTB2Q2dWUXBKUHk2Z1hsZmYwZlFv?=
 =?utf-8?B?RDBRaEZwVWcrTWdXYjNGUFNBaWdQMGttUURlRnZTWU9zNTVoWGFIZjZyUUh3?=
 =?utf-8?B?WW5TbjJBVCt3TkplRHJNaVREcktjQUwyWVc0dGdyd2JsajBsMzFWRlhJcVZr?=
 =?utf-8?B?eXE1dFFtZE9JZlZadURCaE5McVh4cXhzb3lvTVF2UVVMSUY4Qi82VjlTSDV0?=
 =?utf-8?B?K1VSTUI4am1CZXF0SUE2MGxmNjdVQTlXRWdSTWV0Q1ovQTd4am9oVGlDbWJs?=
 =?utf-8?B?ZlkwYWJkdWRUbTg1TmhIT2JBNmxnVmtxVlBQQTFVSW5Qd1p2TmdiaHpKeGVs?=
 =?utf-8?B?Zjk4T1JpNFZGc2J0aGp0N3ZNNWRRZVRrdFVLbGdoTzZZejBUMksyQVFBODlO?=
 =?utf-8?B?YThJWVVRYlhDZWZHQWhlV3NGcVd2TzhGbHhKVkoxR3ZiMHNNRGZ3YTkwWjhi?=
 =?utf-8?B?aGVVcWFpeUZQT1FaalI1YkJTcmg5Y28vUXF1YmY2Qjd1bkU5dk5RS09zZ0M3?=
 =?utf-8?B?TzJjbXZXRk5ZVFk5L0FLelYvM1ZWN1BaQWdwbk9KT2tWY0dNTVZ3d1dsR0cx?=
 =?utf-8?B?S1FsZFVrSzdtNUVTUGY2Q25XcEV0VlA4NWJFK09TWk9UMTEzbi9IUXcrTEF1?=
 =?utf-8?B?UjBVMkYxbjBHUnNCZlpKNDREN216RUxMMHFhT3RRazVGWHdWRHVFMnUrdzRz?=
 =?utf-8?B?UlRSWCtNMDBlOGdaeWMxT0VJaUpOaVpuL1R1VzBxaTMxcVdqenpDMS9yTHlw?=
 =?utf-8?B?OStmTE1zaDYxeEx1bFI0b3k1TVNHSjZEdUoreVNkam0xTlhGeVc2WU40dHg5?=
 =?utf-8?B?OGJmQ2JBNU5ndXdWSFUzS1BuWkVqUk1NeGNyT2lRbCswc29qcTl6c2k3QUcz?=
 =?utf-8?B?aHZhdFNBQWt0QmxhdWkwTUZuQi81eS9oaXhKdFBkTFJ4Q2hJMFAyNFBNNGta?=
 =?utf-8?B?Z2ZtVG0vZG84MmVHQnJRazVtMXFiLzY4eDNmZzdGalBpcU1jaGo3MGxMRE9n?=
 =?utf-8?B?emFrZC8zMVh3ajNBa1hIWXNtbVlTRkplZUsrR0ZDOGlpdDF3Z3d4aVovNnBa?=
 =?utf-8?B?cVY0cTVWbzJZem1mQjgrWjVJN2psOGp2RFRaV2IxeGZyK3g2T2M3RS9COFVK?=
 =?utf-8?B?VFJVVjk1cWtKbFNnQmJjRGJnY2l0TEtQY3lOQ0VpT2ZFTkc0NERuL09HY1Nz?=
 =?utf-8?B?eEgvOU5OaEd5c0JhU1pzTHh5RjlzWkFQUlUzZlZzOHBhSUx3T0tDQkpMbHJp?=
 =?utf-8?B?d2oxWU9Xdnh1SlVrdFpvcmkxa1ltTzVUWTk0d29EcGUwL0dValR5V0plenNH?=
 =?utf-8?B?SXFEaXFTWTdQWVFuREh1NU45TEJERVVUd1J4bEJGVkhSODBYMVFtUWZCeU82?=
 =?utf-8?B?WU93N3JrSldNTWhxMEhPOVFUdU1OR0tJaTBnMGFGTmhsMUQxTUl1ZWRyTlo2?=
 =?utf-8?B?Tk5zVThVK3hMZDRvcWtjRmx1YldjS3dsK2R5OXJmMU5XQVZtZ2o4amN6VjZq?=
 =?utf-8?B?cjhJTm9ZTkxRMEpueVZUYTZMRUpmOUFoMkFTZzRLNVpRSnlFbGlaRE5aY2du?=
 =?utf-8?B?R0ZuTDVsUStqMG1HM1B6OE1UQVNReDlPcW1YYXBNMW5UWjJWUWRTSURLTEdX?=
 =?utf-8?B?YmRWRjJhNUhWS3dLRlVCbmVkN25tWXcydXNRRi84MFFuTTh5NmZiQ29XTVB0?=
 =?utf-8?B?azdKcnNReVVIdUFhMWdzeElNNHRKcmY2WEZRODBuTU1UYWhMT3c2Sk50U1Yw?=
 =?utf-8?B?a2FyL1pDUTZ4R3pFZVBRTlNGNjdGdzhBcE1tY3BWQytqd2k3c1UzaTBjVlpT?=
 =?utf-8?Q?31r+r/6xmWaoUi7KMt9sQwo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2706141c-71f8-47df-77f0-08ddb21f28ee
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 06:28:26.0040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hjrvcxfi172oEw9kk9dD1cQM8R3nQ2SExoPAgGh7/nEcxJN8JK8vEBWL0Bi7zimDPtuh1ovZzTLinsjxNzNTEffcOqlidRBU/0ey0u8Ukv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8258
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



On 23-06-2025 11:08, Matthew Brost wrote:
> On Fri, Jun 13, 2025 at 06:25:48PM +0530, Himal Prasad Ghimiray wrote:
>> The flag XE_VMA_OPS_FLAG_MADVISE is introduced to  determine whether
>> xe_vma_ops is initialized by madvise operation on not.
>>
> 
> I'd just squash this into patch #7.
> 
> Then move patch #11 directly after patch #7 to tell a coherent story.

Makes sense, will modify in next version.
Thanks for review.

> 
> Matt
> 
>> Suggested-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c       | 1 +
>>   drivers/gpu/drm/xe/xe_vm_types.h | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f5f8de113eae..e059d9810d26 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4237,6 +4237,7 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>>   	}
>>   
>>   	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> +	vops.flags |= XE_VMA_OPS_FLAG_MADVISE;
>>   	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>>   	if (err)
>>   		goto unwind_ops;
>> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
>> index cde2583da303..c7156f8e2ed2 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_types.h
>> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
>> @@ -489,6 +489,7 @@ struct xe_vma_ops {
>>   	struct xe_vm_pgtable_update_ops pt_update_ops[XE_MAX_TILES_PER_DEVICE];
>>   	/** @flag: signify the properties within xe_vma_ops*/
>>   #define XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH BIT(0)
>> +#define XE_VMA_OPS_FLAG_MADVISE          BIT(1)
>>   	u32 flags;
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/** @inject_error: inject error to test error handling */
>> -- 
>> 2.34.1
>>

