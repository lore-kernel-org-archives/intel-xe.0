Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55CAE77188
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 00:00:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8D310E246;
	Thu,  9 Jan 2025 00:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNtsPFl7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D644110E246
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 00:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736380812; x=1767916812;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XgkJ7p/Jos9PCM2v5ZP2HDDg4Z/jf4hcluuHuBtGZM8=;
 b=PNtsPFl7r/wXzXYB6MDLd7xi8TnQAKeABgD1/Y9OyAfK3/pFZ3GZ0etg
 rUnbD3ETORSP8Z2Qb+3c6KaPQkB0123VVGv2yecysg0LBNo3LHJpL8vwW
 rY826FMa3VFjhd62LWal5zRAprL41o8GMntzpznqBtXuDY6k8U9g3mdiq
 lcji5zzuMz+AyY7mm6wQ3PM0oNCMWkmRxvtLEbfEL40t1DA+TIs7skWWJ
 um2f6P3gTaJlUoiqTPfhNGJC/a1QS+gf+Q5cskm+3KuNeRxpNT33yaK8E
 lMEeXTx8kW0ZgBBBqkpV8vurYMVu+ieoBy72DYeU9naBM+7uKm8JsaiYa w==;
X-CSE-ConnectionGUID: ip4PxCZwQEelnAdNQC5FmQ==
X-CSE-MsgGUID: 80IyJCSLQGW+mSggFIByjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="39444033"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="39444033"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 16:00:08 -0800
X-CSE-ConnectionGUID: 14pauWEyQRi1ydbJQDRHAQ==
X-CSE-MsgGUID: mOwFZaxPRm2xRZU1Kbcf2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="108142962"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 16:00:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 16:00:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 16:00:05 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 16:00:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcqP3+7B+a2mkA73XDi2B7/CByrnS3K1TVmUUrnOsYjVtC1VWygU/RnXdm16tmnUGbiehdTYxTUSuHEdmSYCrQ85s0jyvNFlz9UsKEsWTk8O/reqolV0SeKk3vdjjQreMb+uYcBSkSYLbWqo5fmpnIC78hCPmgcay5R17eO/6paXRnYaclLJjfrnt1QZyubU0WTLGXxAn7c5WpURm2N7111T8jl/XJrT6VdiPZkSmc6sMEZRlp4xScZ4cdD47l7IRnvlMmWoW9DeMvh047sb7GWdsfTfKapwHnCAVgevF3+4AMkdifGWUihfH6QsmDzp4JzQR1vpj2ppPAsvGeV7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8UYNyo+jvU9do+z7ip67byLE0fTBxYScvlXE8YwGzlk=;
 b=l1e5k/P52zMp1HioOYoZknLJO4nNcX1Mj1bTWFA/2hK20BftYYxU/c+e7S6saXZ6HK4Aso7WetuvQclUibsE+Lp15wOPHFS30hmOlV4cstDrE1Z8g+OlplKnRRt8KJjxvmKECob7QHaqwI4vCwHAjJiepzj0P5ttPyQVALxgtnwwXqdPJLqqzoAfOsK9fP+kq95YkAF0Uwnvlad5aQODannzbB74E65gENe5GSvMAd8YcLxfPX0XA2PqxqxrVBSiihX9y2MWJrUIK3XYRLkqRvS+ZV5l91rD6BKg+nA4emZE+DP/gKrRNQNvqtXs1xd9ORtIWVT/fHC7RGGMoBD7zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 00:00:02 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 00:00:01 +0000
Message-ID: <789cbf9a-fbd8-44e8-a528-22a6c098189e@intel.com>
Date: Wed, 8 Jan 2025 15:59:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Julia Filipchuk <julia.filipchuk@intel.com>,
 <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?=
 <jose.souza@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
 <3god5fzcfbzxwlssqdb6eenzedqkykv2scpktlk5uglgf2ro73@bjuq2knwuweh>
 <ef3c1576-74bf-4fbf-be8b-9ff8d24cc24f@intel.com>
 <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <qj6jh2z7qncr73nesmsdjaa46rxnm34tf4slp6y4ctv4w2dzv2@lttsv323fanu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0101.namprd04.prod.outlook.com
 (2603:10b6:303:83::16) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|DS0PR11MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c110cf9-7e9f-4039-3486-08dd3040905a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk1ocWZ3VVNGUUZhVExtek5JUlc2UExuanpCeUk0TGdHZDROT21UT1VSM00v?=
 =?utf-8?B?bWI5d1p0b2tqZ3pkOFdjckdxOHBFZkx5WjBGeUNkb3h2OFRBUm5TSElPRDRu?=
 =?utf-8?B?NWJiNzF6RVhwdmkvbE1kV2o1ejIwR3BGZXNQeXo4NXhFamM2akE0K1cxSTFK?=
 =?utf-8?B?V1JSVjdaaFdSbFpnVlRuWXV3aFVGZVZJMFBmSlZmUmZ6SVd2TnBobi8wS21T?=
 =?utf-8?B?Z2lTRnNQNjNycmlFOHhCMUlvUGdOb3M0S3lxSVRFWGVBQ250STBzclRXdmsy?=
 =?utf-8?B?cHg0eENKT1NQWHd6NHgxK2t6UStyVmlqNE9DSUxoRjJBZk04eUhKMGh6U1cz?=
 =?utf-8?B?ekRuSlErZnhCbG45dW5LbHZwNVdGT2YvOUZ5aTREOEpGczV0TkxwZkF5RDk1?=
 =?utf-8?B?SzRnd0FNY3p6ZVhMeklZd1V4TUZVY0RpU0N2YUdKTTZIY3dxMzh1ODhVdWNw?=
 =?utf-8?B?aFh2cldUZFZvVkFOdVBXdnRhSExZeDdEZytiM00rT1VGT3hDK2R2ck9VZVNY?=
 =?utf-8?B?ZDhyZTV4S29xSGRPZ29xNVBtbllOMWxpa1FIY1B1UUsyVWhLaFNORDJsRnZR?=
 =?utf-8?B?V0tmMVE3K1gxM2EzYXRlWXFQYS9zaWFlK0I1RXJoLzd4WFNkQzVaKytXc0Vv?=
 =?utf-8?B?UnBzZWRocXpKeVcyRTBRMTNGem9BMENNWkFtQVYvRlhUM0UzcndDdFZOd0p2?=
 =?utf-8?B?c0FwNmhieGdPT1VGOGZtMHBCNXhER0hkRFBpRDJ3UEg0NXFvSjRRUkVPYnZI?=
 =?utf-8?B?bUZ0dlVIM2lpZ3hFR0lNUDdHc1pXaEIrQ0lIWUk4S0VwY1dsOWFvS2FRK09o?=
 =?utf-8?B?U3ROalJWalRSbGIvL0NId2pTNWExcDNtc2lhdXBKWWNnb1crMWYzYms1RCs5?=
 =?utf-8?B?WHNkMWVmUU9qZGM1a29TWHQ1aEtrZmwxQzdHKzZ6M2NJTkZ0NTRyWUZXZHFM?=
 =?utf-8?B?NFBEbUJJelBrbUdyYWJMR3ZMSWU5RCtpbldaanIxUjNCL3dJZDh4ME0wLzhw?=
 =?utf-8?B?YWNMRi9MeDJBejhQdTZxZk05WkpGNlNjNWVxY2s3UmJELzQxOXh2c3RsSHJi?=
 =?utf-8?B?bks2MkorOUNuL2VGWmZRNXJWdFoyWkpEYjJMaHRBU1VxbktiQ2d2QlVFL3JH?=
 =?utf-8?B?YUN3RUdKS3pXRnRCQkVRTjhXQUNMQitPNUpPNFgwOGtjYUZxcnZIU2JYemFB?=
 =?utf-8?B?dERGL1M1YkNqMmErNHFnbVh2VHNIbklWYXlvLzBENjVpT0t6NTlJcUVqTFR3?=
 =?utf-8?B?US95Y2Y2V0NTQ0N2U0hMcGRMVzgya3pDV09ub2YrL0xKWWFWTTdFd1Y0V1lQ?=
 =?utf-8?B?YmVidHJkaEJqRjZLWUZMc3hxeFp2UGdsZ294dll3MXdWK3kwL2wzakplaUpK?=
 =?utf-8?B?aHFrRUYrZ09zNFhpNVNwWHNVVG9ySVZTcHR4cHJhVDdXb2haVTRQaGdsS2VZ?=
 =?utf-8?B?RjdHNk0wdlA5RTJYVENWNFR2UkowTVR2SkYrRis2S0p5K2hha3VkWWxwYzVV?=
 =?utf-8?B?QlZNUFRIOUptUWtiOEljRHNRQVpsdG9teDJBVzBKMDhhckhtTzJET3BUa1hr?=
 =?utf-8?B?TkFnc1RoWVpibEtCNGlEamlWSGtyZ2gvRXRvV0VjYTZqR2U0OWY4VDZKSm4x?=
 =?utf-8?B?UUhEczNscHI1REVSY2JvZlhyUDAwa1RURUV0M0w0Nk1nUEl0Uy9JaDNSZGtl?=
 =?utf-8?B?RVY3RkJqYUsrZkJydGlSd3QvNEh6V2VKajAzb3k1YmxrT3BhNzBpTUtZaGRy?=
 =?utf-8?B?cStHbW5rTTZSZ3NQaGx3aDlvOGpuNUEvM3Jya0hTbDlYN1dOL2JTUjZBbG12?=
 =?utf-8?B?WGhxNE9VZlNyd1VCREVBdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dpMmR4eUZJeUdFOHJXcFc1c2JFTEdmR3dRTHpFL09ZRzJmcHdLM210cGVJ?=
 =?utf-8?B?U2ttNWRSWnlBMXdCTnAvcmxOakd5QTdqbUY3ejRjdlh3RWQrN2FRL0VZbWRB?=
 =?utf-8?B?V1ZkZ29nejVzaldzNzBDb2VwMjlCR0xEaW5iSzM3clVaa0ZKakIzdFUwVjJF?=
 =?utf-8?B?c0Nnb3FSTDBTMU1wSDNMNUdKT3ZHbUlDSVY5TFhyRTcwNWVHcXQvblpVRU1s?=
 =?utf-8?B?SGJYTG9GUkdLU0I1Yy8zMStWZjd6UXBqdGxlWU1aMDloQ3dnQVpZTWpYQXcz?=
 =?utf-8?B?RGtBNWNQMWRITDMvRmYrb1BHbXBZa0RSdFVJMlVoYU92cGwwTG56c3I4ZlMy?=
 =?utf-8?B?dWJVNWVPTG1SSkg0bDU3TFdTZ1hhWkN3L3RUWVQ2T1hkZHQxeXN0Q0k1TjQr?=
 =?utf-8?B?OE5wZFRDRnEwd2dRQWQxNnB1ZlA5OG5RQy9MellvSjFpM216Y2lXM2g1L0w1?=
 =?utf-8?B?OG1MSVBZdEliUCszRE9ERjFGaWNKb0tBRHFuSmFTdVJWenpIeC9pS1pUZTlO?=
 =?utf-8?B?YXBkSmpZS3B5bGV2TGxYSEpmVkhTak1jdkxmdG9sU0ptRXBKV3RGaHRxWG16?=
 =?utf-8?B?TnJ3REVnazRjR2tHU3dHZTZQeHJzR2RoZnpPalg1dVJWZ21RQ0ZtRklUMytn?=
 =?utf-8?B?VmFFRUhNU2NPdkZuUGlwZlRkUXRmOFkxMEFMUzI0WVRSQXN6amlSOXhsTStG?=
 =?utf-8?B?RFh5dXl2VDlkUkZ1aTRMYVlGMllrU0ZQMTNsZjZyRnhPSHorUGpQa3h5aURC?=
 =?utf-8?B?dERpSmU4THFJTXF2UWhqbHZ0NnpsNmtHYWsvM04rMWw3QkZNRjFPOE9oTDhP?=
 =?utf-8?B?TWhUWG9FTWZNQ2pxNGIzU1U3ZUtOU0tOMmF6OEo4STZUaTdqS0JMMEw2SGxn?=
 =?utf-8?B?NUtZWElYOXFwako5VWxpdVVLVVpJdUphdiszVzFPNTRIbFREaWQzTVN3NnpQ?=
 =?utf-8?B?WnRTVHhOTWNnQWRPdFNTclE2SExvSy80RVA4aWR0eGRvQVRzb2ZCWDZwbDBP?=
 =?utf-8?B?eHJwOGhmOHpMWXRYelZMNmRMdlRTY3Y0aW10MFFZM2xiR1I1emNLVEZVUHJD?=
 =?utf-8?B?MUltVE8rZTJVMUY0YWIzYlpvbmp4UFkzQkpocnErTmVDK1lQTytzalV3TGc1?=
 =?utf-8?B?TTMzKzhRQ3JJSTBqc3BBTmtFMVVNOXNLSmh5TWxRTUJEMW5zRlNaeFJvekVF?=
 =?utf-8?B?akppcWhBSGdYalArckZ6MWxsOE82LzhIN1lDSVpWbTQrS0FrbmVIVDhGakUw?=
 =?utf-8?B?OXkrcVBuY0UzYTdQM1daY0xNQ0hwYSt2a0NlL2ltSnpsQTZsVTc2UnlmbkhP?=
 =?utf-8?B?RDQvM3BtV3JTVHFGcG9hMFBCWGhHbjd0MFRMNWs5M1FORWd6ejdncnRiZDA4?=
 =?utf-8?B?SVNkYVlDWkczUHliamk3Q2lBdjF4bzBGTjF3SUJXZGFIc3VvT0xCZDRvMS9W?=
 =?utf-8?B?Z0dHV0ZETFdmajFQSlVqdWxKY1hYR0NZdnBXcnozME9VZHJMMEZ6WVRJNFlK?=
 =?utf-8?B?WlZER3hiWlpNYnhITmZxL1Fpc1dGUmE0elVhZGNvbjB6UGZhWUM4RXhsZi92?=
 =?utf-8?B?YytWNmFwRy9KejdwaFZIZ0V3RU1OMFRSMVN1ckVKcm1SWkJtNkJNbmt2STgv?=
 =?utf-8?B?OVJVOW9Ic2xLL2twZVRDd0pMS1BxOVZkWCtjb05ObWFZSjJVaFQ2V2lnTzFy?=
 =?utf-8?B?Y29ncFA4MlRYNmZSYkVIMjFSZEZSSElaNlFLZ3BQL2U2NGJEenNmTnNKNDVL?=
 =?utf-8?B?WXArVU9hZ09LWEV5SkZmQXBUeWJsQTRHNlhZUHNVbEdjQS96aUVsVUg5SzJp?=
 =?utf-8?B?ckRrcmFnZkMrSW9qc3A0aThrd01tY2hDSjBid2hxYUhza1F1aVJsL0lUVjdJ?=
 =?utf-8?B?dU1IakNkUnRQejRqMU9iVzlYaGNKZ0JQaTBGTXN0WUFNdHJIenAwaThXZ0lU?=
 =?utf-8?B?OEE0blJXQUc5OS9BcERGYUFuTXNuN05Ka0hQd0RPcVloSUFGTnQreFhSVjN2?=
 =?utf-8?B?dC9HR3lMRnJEWlJ2QlJzejhTdUJYanJUWU4yTXE2Rms4cjQ0YkRNM3pjU3dz?=
 =?utf-8?B?VW9wSE43QTdLQ0J5Vm9ZUEE1ZENoZFp6U21Eb01KeEkxT2FvRFZJcGVmUlpW?=
 =?utf-8?B?QVR5blRtUXArVHo3MnE3SFlaRFV3U2VhUDJhbUE2NjhtdUoxUnE5ZmsvNG5F?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c110cf9-7e9f-4039-3486-08dd3040905a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 00:00:01.6371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmUSLGzUfctly0bsR1YzjV+VoRxLnI9aqAlF7AN7JtMG2fZ4NG+GVUe9h+OriV0k2Qf+579Da3tKVtCN6RSmv0pCE9qW8SIp7MSXP635FjM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
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

On 1/8/2025 14:11, Lucas De Marchi wrote:
> +Jose
> +Rodrigo
>
> On Wed, Jan 08, 2025 at 12:14:49PM -0800, John Harrison wrote:
>> On 1/7/2025 13:10, Lucas De Marchi wrote:
>>> On Tue, Jan 07, 2025 at 12:22:52PM -0800, Julia Filipchuk wrote:
>>>> Change to disable asci85 GuC logging only when output to devcoredump
>>>> (was temporarily disabled for all code paths).
>>>>
>>>> v2: Ignore only for devcoredump case (not dmesg output).
>>>> v3: Rebase to resolve parent tag mismatch.
>>>>
>>>> Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_devcoredump.c | 8 +++++---
>>>> include/drm/drm_print.h             | 2 ++
>>>> 2 files changed, 7 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c 
>>>> b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> index 6980304c8903..8e5d1f9866a7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>>>> @@ -424,10 +424,12 @@ void xe_print_blob_ascii85(struct drm_printer 
>>>> *p, const char *prefix,
>>>>      * Splitting blobs across multiple lines is not compatible with 
>>>> the mesa
>>>>      * debug decoder tool. Note that even dropping the explicit 
>>>> '\n' below
>>>>      * doesn't help because the GuC log is so big some underlying 
>>>> implementation
>>>> -     * still splits the lines at 512K characters. So just bail 
>>>> completely for
>>>> -     * the moment.
>>>> +     * still splits the lines at 512K characters.
>>>
>>> did we investigate where this is done and how we can overcome it? I
>> Yes. And the comment could be updated as part of this patch to make 
>> it clearer...
>>
>>
>>      * Splitting blobs across multiple lines is not compatible with 
>> the mesa
>>      * debug decoder tool. Note that even dropping the explicit line 
>> wrapping
>>      * below doesn't help because the GuC log can be so big it needs 
>> to be split
>>      * into multiple 2MB chunks, each of which must be printed 
>> individually and
>>      * therefore will be a separate line.
>
> so there's no "underlying implemenation that splits like at 512K chars"?
> Nowe it's something else: a 2MB chunk because of what?
The GuC log is captured in multiple 2MB chunks because we can't kmalloc 
a full 16MB block at a single time irrespective of memory fragmentation 
- the kmalloc function aborts with a page size error above 8MB, I 
recall. Might even have been 4MB? The 2MB chunks become approx 512K 
characters of ASCII85 output (when mostly full of zeros). Because each 
chunk is a separate bo object the memory is not contiguous so each must 
be printed with a separate call to xe_print_blob_ascii85(). If 
xe_print_blob_ascii85() includes a terminating line feed at the end of 
the print then that means multiple lines for the GuC log.

>
> I don't really want to keep updating this instead of fixing it.
>
>>
>> The dump helper could be updated to never add any line feeds, not even 
>
> when you say "dump helper", what exactly are you talking about?
> xe_print_blob_ascii85(), __xe_devcoredump_read(), __drm_puts_coredump()
> or what?
xe_print_blob_ascii85

>
> If it's about xe_print_blob_ascii85(), I think this would be the first 
> step:
> drop the \n you are adding. AFAICS calling the print function in chunks
> of 800B would be fine, just don't add any \n. If that still adds \n
> somewhere, we can check how to drop it or you then may have a pretty
> solid argument to adapt the mesa tool with a newline
> continuar char and send them the MR.
As above, the chunking is at the next level out. So dropping the 800 
byte \n won't help with the GuC log still being split into multiple 
lines. You have to either move the terminating \n outside of the helper 
and into the callers or add a bool parameter to enable/disable it. 
Either of which is just messy.

Or extend the helper to take an array/list of pointers in a 
scatter/gather fashion.

And if you drop the 800B \n then you break the dmesg output facility. 
Which means we can't get logs out from CI panic type situations.

>> at the end. And then the burden would be on the callers to add line 
>> feeds as appropriate. That seems extremely messy, though. And it will 
>> break the dmesg output facility. That does need the line wrapping at 
>> ~800 characters which can't be done from outside the helper.
>>
>>>
>>> understand having to split it into multiple calls, but not something
>>> adding a \n. particularly for the functions dealing with seq_file and
>>> devcoredump.
>>>
>>>> +     *
>>>> +     * Only disable from devcoredump output.
>>>>      */
>>>> -    return;
>>>> +    if (p->coredump)
>>>
>>> but we do want the guc log to be inside the devcoredump, so rather than
>>> adding more workarounds, can we fix it ?
>> The simplest fix is your suggestion of adding an extra white space 
>> character at the end of the line in the helper function and updating 
>> the mesa tool to support multi-line output. That seems like it should 
>> be a trivial update to the mesa tool and it keeps the KMD side simple 
>> and consistent across all potential output methods. But Jose seemed 
>> absolutely dead set against any updates to the mesa tool at all :(.
>>
>> The more complex fix is Joonas' idea of using an official structured 
>> output format of some sort - TOML, YAML, JSON or whatever. Something 
>
> it actually doesn't fix this particular issue. It fixes others, but not
> this one.
If we do it properly then it fixes everything. The format library would 
have helper functions that the devcoredump code can call to print 
integers, bools, strings and BLOBs. The debugfs/sysfs output would just 
stream the encoded output exactly as is. The dmesg output layer would 
add the 800 character line wrapping in a way that the dmesg decoder can 
undo before passing to the decoder library.

>
>     "Guc Log": "<encoded data .........."
>
> if you need to split lines, you still need something to do do it in
> whatever format you choose. One json I remember working on in the past
> that embeds the binary is the .apj format... example:
> https://firmware.ardupilot.org/Copter/2024-12/2024-12-02-13:12/CubeBlack/arducopter.apj 
>
>
>     {
>         "board_id": 9,
>         "magic": "APJFWv1",
>         "description": "Firmware for a STM32F427xx board",
>         "image": "eNqUvAlcU1faMH5u7k1yCQGCICCgBoIaRW0EtVSxhg ...
>
> here "image" is base64-encoded  afair. But in your case, just printing
> the json to dmesg wouldn't work because of needing to split the line.
> It wouldn't fix the kind of bugs we had in the past too:  in json it
> would be the equivalent of adding a field to the wrong object and then
> move it elsewhere. An application trying to read that object in the
> previous place would be broken regardless.
>
> toml is more for configuration and yaml isn't a good one for this case
> as it further relies on indentation. I wouldn't oppose to use json, but
> don't expect to have dmesg to magically work because of that.
TOML basically says 'use base64 and print it as a string'. And it 
supports multi-line strings, so the reader would have to drop newlines 
within a base64 object before doing the base64 decode. Or just use a 
base64 decoder that ignores whitespace.

YAML seems to make even more explicit. From the 1.2.2 spec page:
     picture: !!binary |
      R0lGODlhDAAMAIQAAP//9/X
      17unp5WZmZgAAAOfn515eXv
      Pz7Y6OjuDg4J+fn5OTk6enp
      56enmleECcgggoBADs=

So the userland reader just gets binary data straight out of the decoder 
library with no processing required.


>
> So let's fix the issue at hand and let the talk about xe's coredump
> format for a later time.
The issue at hand is that we have two fundamentally conflicting 
requirements. DMesg output requires line wrapping but the mesa tool has 
been coded in such a way that it breaks when given wrapped lines. There 
is nothing we can do about dmesg but making the mesa tool's parser more 
robust does not seem difficult.

Switching to an externally defined encoding scheme that internally 
manages binary objects and supports wrapped lines would fix all issues 
and guarantee future compatibility.

Note that line wrapping is not the only problem with the current mesa 
tool. Unless it has been updated since? The tool breaks if the context 
information is not part of the "GuC Communication Transport" section. 
Which is totally incorrect. Context state is very definitely not part of 
the GuC CT layer. That absolutely needs to be fixed. And generally, 
anything we can do to make the decoding more robust and future proof 
would be a very good thing.

Note that the devcoredump content is highly dependent upon the internal 
workings of the driver. It is going to change over time. So the more 
robust the decoder, the better chance it has of not breaking when some 
new piece of data is added to the dump or an existing item removed or 
modified.

>
>> that ideally supports binary data and compression natively and has a 
>> helper library that can be included in the kernel source tree. That 
>
> oh no, we'd need to define the schema - there are plenty of json 
> libraries
> in multiple languages for users to choose from  and that would be 
> basically
> then main benefit of using it.
Well, we can certainly define extra formats on top of a base format but 
it seems like it would be simpler if the base format supported all the 
data types we need already. Doesn't really matter either way as long as 
the underlying file format supports all the uses we want of it.

John.

>
> Lucas De Marchi
>
>> will then remove any and all confusion over interpretation of the 
>> file forever more. But it would require updating all userland tools 
>> to use the appropriate helper library.
>>
>> John.
>>
>>>
>>> Lucas De Marchi
>>

