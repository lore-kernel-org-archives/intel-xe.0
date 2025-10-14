Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C468CCD184
	for <intel-xe@archiver.kernel.org>; Tue, 14 Oct 2025 07:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247B910E56C;
	Tue, 14 Oct 2025 07:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8JWxlLp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B9F10E56C
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Oct 2025 07:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760427924; x=1791963924;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0YdPrPu9K6qseQYekN0kpJRCepYfkrAkOJJUNZR4x/o=;
 b=l8JWxlLpPENLjZPVIu7oic92BVUXhdoXtNu9nihM5L40WHpNEgHyzqWh
 AKECFZgIrtBBKVNqlBX5RxkoBg9ISdoHx4Zg2FDXHLwkb3coJg1Sdu+iu
 mOLV4CcQGCLRKC5WBag1mgu9IE/9xEoGqlOysBQBrv/3dRVsBy+Z/OjW6
 UJIo0UK7lMBeeGMfFQOvCFwiKxhhlUtx/Z1IyMdo+G/IHaN5hnLUPSnpB
 Ip2m83QCZaLjIsB2wIkYAPLJR6xqMhBlxMb/KxNZPSlXRl1E4do74GxOD
 1mxpTMkWbnFPKLSwMhxLcoWo9Gxt7946Pa0/kYy24gfgwhco2MTbOK80O w==;
X-CSE-ConnectionGUID: p2H7d6feQM+P0NDr1OP/Sg==
X-CSE-MsgGUID: pIJiaY7WTU+TuWRXBo+iFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62490969"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62490969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:45:23 -0700
X-CSE-ConnectionGUID: uy4np5muS46/OM8lxfscnQ==
X-CSE-MsgGUID: XZLxHbv1SWmR6A/KSOsU+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; d="scan'208";a="185835246"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 00:45:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:45:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 00:45:22 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.35) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 00:45:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiVw85Rn/uJofZvh2Mb8Mp0ot3VLBvfuKfzulFgOnsmj5kc2TXqkJ1HVZsxDu59EaV1ZRCDimRHkKNOJ0JtaK8Arqv4rKfiYjbwP5XN6HWzAO1W2CwbpEWo33D1qNhTfaurtgOk7Ax+0isWU9obCR64XrTmmoxEUiqnBr+nzo/HrNuA8DYMV6A9xlCB2cvDrFacCjcfRslFP0yiy4a5i+Lx+FQdkAkrNmSdFMe0vCBh4A6jRalyoWsOa8y2k20unYd/3h+CmTmInrwN1e95CqLwWsxqD0F66b0evECu0F/8CW207wtni8/1JmC4R+zF8Shd/5BwLEuVvE3cBS8mpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tW8u544Qmvk8X4KdvTKcUMyZczaE3iI8hCE7qhU31M=;
 b=EZDwsPfxN0ObAxQaFgkNYP4Mrv2yKrxLJ633C4qM/8CjT/OyNsUA+w736bwPGjelSc6RDYFWF2dtZ3YNxJ7U3kz2fsduc0bQIilE2SgljVKCHhScSVY63frISgG+Bz8kmacb4M0fdQAuZYaPH86kulfDd5Kx0tWmgAlHj0A/gsV8C+wrHHn/UjZEFREj580qug8126t3RiBfVE559tWwqg5FaqXEpsqKfwDG6ZipxK5rv0qM23viGAwTYM1W0xG2cMEnO9tziZUnN/ACbbprfRpad0T7yf5KCcihXzuNG3CaMstsrhgqQuUkUsqRxBzY9oKk+JU0+yFmnLSeTVrpUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by DS7PR11MB9451.namprd11.prod.outlook.com (2603:10b6:8:261::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 07:45:15 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 07:45:14 +0000
Message-ID: <34c48c4b-a7d9-4146-afe2-afb27cbc213d@intel.com>
Date: Tue, 14 Oct 2025 13:15:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/23] drm/xe/nvls: Attach MOCS table for NVL-S
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>, "Matt
 Roper" <matthew.d.roper@intel.com>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-16-bfb74f038215@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251013-xe3p-v1-16-bfb74f038215@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::17) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|DS7PR11MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 32faad6b-b122-466b-b5ed-08de0af59c9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjhqQmJBSGdRS2xTUFFFLzBYand4NlorWHU2RTd6aWhjVVJSNlMwZ3pWK1h5?=
 =?utf-8?B?RnczUEhaV1RndjZCKzkzSjE5SWcwU0FuM0FZR0hOK2FqdlVxYXltRTV5WGhF?=
 =?utf-8?B?ZmhoeVFrWWdpMTJ0d08xTE5FKzhHbEtQQkM5S0Vpc1E3MjNQdkJCbEhSWm5L?=
 =?utf-8?B?dkc1aUkrUUtQdmZGWGxBRDVYQXJKRTdsd3lLZ3pZeTJjN000WEZIWnB0Vkx2?=
 =?utf-8?B?bitTSDErOExmWkNoWnlodmNBMHZSamFlRUhxa1FSbnFzZUlRVTl0OE9sRExr?=
 =?utf-8?B?a0JhN2FmR0Y2WmdZZ3dNNUN3bWtwOWhXTTFMeU5qZGZzbkNYZ3VSMXorL0tZ?=
 =?utf-8?B?QVpIRFhjcCtYd1Qyd2phcnZ1bmU4dzZHaksvWDQxM1RNNkljRVdzZUtKUVA4?=
 =?utf-8?B?Tmx4RFZGTitwMHhJVVRHV3A3WXpRTUNjb0JLaHR5TFVyUGZmWXNJb2dDZHgv?=
 =?utf-8?B?dlBXVFM0M0owcS9CT0Z5cXpkNTh4cmJFWldOYklLU2JaMkFGZnh2Z0FNd0pD?=
 =?utf-8?B?dEZxYWxuSGNrRlJVOXFwTEo4QndEUmdESVlad2hKcUpHZDFrMWduOXF1bkxK?=
 =?utf-8?B?RmMyU0diS3RBbXIycmZRT0EyK2tkbkRkY0syOUdnL0xRa2Zjc2FpNks3WTFU?=
 =?utf-8?B?b2JjTENHRlRVWEVYWHdFMDg4RmRqZ2crWHZjV2ZQU0tWVDJia3JwaFZabXI5?=
 =?utf-8?B?MnkwdThFdFR2cXJvVUh0aUtTM1gyb2U0V0RGUzhGMGRRUC8ySkdsNWlxWUtu?=
 =?utf-8?B?OXkvSlVUSGNaajdob3FrODdvUWZMSjU3UDlSSjFRSHFaWnlDdnBITzhwekFz?=
 =?utf-8?B?a2xKNGttUWlHNSs1L3IvYkNDMkVndk93dUpjQnJGTG9tN09wbjNIaHFrTGs4?=
 =?utf-8?B?VnFnZGNiQUhTYVpRQkErUzVqbklsZm1aZk82VHlQZlBiTkdraVJqNG9jMG9R?=
 =?utf-8?B?NDRZaExVSUcxejloNkRkZW85THFPbkp5QS9EQXFrVnlON2ViREdpb3ZQTTVU?=
 =?utf-8?B?NU9YQ1B6QkNoUDVvUjJFcU83TzhKWUsyazZhWDZnbjVEbTZqYnlQNEY5REJQ?=
 =?utf-8?B?VFlualNmeklMeDRGVUhXY1Bydm45cFVkcFhkUGEzbFFkaVhJcGFocU9NQk9Q?=
 =?utf-8?B?UjFDSHE0SVlWUFNCWUtkTjJYczF4QklZRGx1N0N2Sk02c2ZZbEdhSTZwQW4x?=
 =?utf-8?B?a0FVUWpiUU1KZ2w3dUdsclAyNHFON01wVUFrSVJHOHYwbmlkVjZtUVNPQW5T?=
 =?utf-8?B?cTV4ZmFyZUtrc0EwY2ZzUHMwU3FwWjUxMjdJSDN3dGt6VTcyQStyczNWQWVC?=
 =?utf-8?B?a1lhVzJYNTlTUUF6TXB6QXJlTENGUmRoclBUTEFXUEh6YndSZHBwaUFJdmh4?=
 =?utf-8?B?UEhEQzBYRzlUKzFadnZUOFhmMXBYUGd5ZXBvSzRldGR4eW9KVWpHSG9rMjE3?=
 =?utf-8?B?Vkp0bjNsUjJid0g2aFJvdDg4cXJEdEZKOGpZdGxISG1EalREYldDc0hjZi9x?=
 =?utf-8?B?YkVOUkRoMHdncHp2MDlRODdUQktQZ0dlQmlFZ2ZmU1M2MEwyamY2QWs1R1lm?=
 =?utf-8?B?WG5GejZPQVRDa0RTRG1lV0FDRVptYkpTT0RxblBtYVRDUTg4bk1pOHR5cHE0?=
 =?utf-8?B?ZCtWVDRsNUNhejhPdmNaZnc0dGh4UzlUVnEycVpJTkVieTRQd3VaSU1OSFpO?=
 =?utf-8?B?SFFpaGdpRzA5ViswZ1BmQ0oyZk1VVWFWRTlDUkJPSHpiclZlY3RDMW41TUs0?=
 =?utf-8?B?d0VUQk91R2lkdngwSzdyVmpKb0hsd2YxNHBWdnhWc0NiNFYxMHh2Y1Uremps?=
 =?utf-8?B?SEc2VzZVSHN1Q2ZhdkVkWHA3eFZpazZVcWNodUpEanJyUUd6RWRnVWlweEpP?=
 =?utf-8?B?WkJSOEF4eEJMLzd1VWR5ZUd3SThuSms3ZkV2bHVtUGQ1VURoMjdvOFZaQ1Nj?=
 =?utf-8?Q?Mpq54riL3dDhVUkUHxivehLdOCn8A7gN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1FkUzRJNVJ3aFVSVEI4dVloczlPaFFBUmsvMDN4QncrZXE4c0I4TlorLzlm?=
 =?utf-8?B?OFV0Y3hLY0xvdkZzR0pMdDZzV1FQdVhPb3N4dlhZcWxMYlJsM3gxK3ArM3ZX?=
 =?utf-8?B?OXVwd2x0NUkwRTR0SFVFMmFaQnd1bjhxNlFLSFZGVlU1Q0JhSmtFMDFqYi9G?=
 =?utf-8?B?Ri85b1p0bDFzUVdlOHZSU0RJVytEZ3VlaXgxaDFvWkRnZUkzT3doTy9HTlRv?=
 =?utf-8?B?N245Z2ptRmcvL2RHbExUbmdRVHJnbyt2VFF6cnFuenVHemRMM1FkMERtNXIx?=
 =?utf-8?B?MGp3dWFpWmgvQjZqNTNYV25wSitkSDMzbU5MNnk5RERyNDd1d1ZCOWpwSFMw?=
 =?utf-8?B?dFlWWCszd0luMS82U0xNMS9PYlIyb1ZhR3lTYU1sek9pRm1reGt0SzExakZ1?=
 =?utf-8?B?Y0ZrOUZIZFpYM2pmdTZsMHA4cjdvL253R1FvWnpXeTNJWmZ6VDNKRVE0N2tL?=
 =?utf-8?B?RU05YmZDZHRXUHVkWW1icy90bUVGUUwyZEx2STFqRThOV0JOVDFFRXN6WEVk?=
 =?utf-8?B?ZUhDNEZsdmxaZmpNdCsyOFNXQU9ldjBOSXNzRk00eCtkMU50SFRQdEdVbE5K?=
 =?utf-8?B?VWNMM3k0YVBZTUo4REZlc2NnYWJQN2V4c01vWW5sRTZhbnBXVXU3UzNGU3FY?=
 =?utf-8?B?R05GWnJ6VGhzWUJJOXAxSGpQQkJxUnBlSjIzNkt0VEExSkdackRFa2tSTW5u?=
 =?utf-8?B?cGZGYTZ4MWE1NHdVd2VlNUdWcGI0TjBhV3VGU0lLMEljZ3RZbEtFMlFhemM4?=
 =?utf-8?B?dk1xMlNNWExWTEpaZWk2eG5iaUQxUStOYVMrNmMycGR5dlRicGxuL2RwR2U0?=
 =?utf-8?B?Z0RSS1hYSFQ1L2dsWGljV0xuOWFVZUpGSklRTVlwL2JxbVlrZUM4bjJFVmNT?=
 =?utf-8?B?Uko4NjBINlFURVBMQ1BLV0tCajhhOUdzYWY4L3BRS1pKaWJoTWJSaWtqQTdn?=
 =?utf-8?B?djZ5RVNkeUZqbUlmOG5McUNZTmJnYjNVMkNSNlluM00zTmVLZUliZy9ld3dF?=
 =?utf-8?B?dkZSVTNjaEEraGJWSGNIM3EvNFJoWml0ejI0SG1EWG5ncks4ak00TVpWNStS?=
 =?utf-8?B?M0xQU2ZZVXhTaUlWRWNnWkNOT0REUDJqUm5nYTZrYUx4b3hkS3cwakc1L3hz?=
 =?utf-8?B?c0YvS0psOGFrNWJBby9MQVNhZkhvdHFnbHo0VW5IOTdoVEhNRkRwR0h4V3FQ?=
 =?utf-8?B?ejJMT2lVSWo0UC9ZMlBTSnFtZysvWmYwZTNVdE5iUWIvUzEwOFBPa1dhNFR6?=
 =?utf-8?B?anhFdE9aU0VKVVZrbEdZTjdZVnl2UGZWQTVUVEhPNk9QQ0FmbTdBcmM5dGZV?=
 =?utf-8?B?M3oyeGw3SGMzK1pNaHZ6U2NRQTBKQ1RYcVBQaHVTL2FSUUtxZ3o1VnZyMlhO?=
 =?utf-8?B?ZGg1VG9SQk9FT2VuVG1YOUFKNHVMYXNTd0tSVE1TU1BUdGxmSDZtN3ViZVBw?=
 =?utf-8?B?TExLbFVvQjBXdVZrczUySVI1YjluY2I2ZUdKR3k3TmxXT3YxeVE5RE5LUTBN?=
 =?utf-8?B?Q3NkUGZ6bmJNdEE4MnVFNGFLcWtHZzdDTmdPWDI4RU9vT2orQXUvbmpIN3p0?=
 =?utf-8?B?eFYzVU1FbDBCVUF6Vm1WQ0g4dXFjang5aHIvUFc5c2NoSEhxWjUyVE5YUXRI?=
 =?utf-8?B?ZlZvUTBYdk10QWRWVG8waThwSVJiejdrS3N4WmtnSzk5dGw1ZDBKMWRlZnNV?=
 =?utf-8?B?N2ZoTU0yWFhlOFk5UXNTUlRnL0k5YkNXOUdIY3A0SWMrTmNLNWdHM1J2UEpW?=
 =?utf-8?B?S3paUGtLakxMdm40WEdiWDlTN1Zpc21PUm15cTZIRHZDRXEyWDdQNnkrOUZi?=
 =?utf-8?B?VW1aSGduWkxUKzBZeDJQMnNWZlQvczFXTTZUelEycmJXcG94YTljaHVJVVBs?=
 =?utf-8?B?Unl5L3RsSmFiVUpTVkE1aGcrUWp4bmNDb1A2Um5IWTB2T2xqWE5FdytQclRq?=
 =?utf-8?B?bHhUMmNIQnhjQzlwL0RrQ3d3cDNNVWtsTlppQnFMZFQ2di93ZEJ1VXppNHp3?=
 =?utf-8?B?Z1d1NDBtWEd2NVVJSzFLVDE4MnVYQkVmb3RyVGNZczBvdWxKUjI2WC9IdTVF?=
 =?utf-8?B?Mk5WMS9UYXI0MDgzZHRPeHhWalA2TEthTy94ZFQyREdUN3ZucWdqOHNSZHhY?=
 =?utf-8?B?V0JibTFaRmVmcGhSZ1pTQnFQNVZTS3VOYXVDamF3THBVMFpNZGk5cjdtVUlU?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32faad6b-b122-466b-b5ed-08de0af59c9e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 07:45:14.7969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYfKUBIifuXmhuTVwRjiBeT59nu8tvRlkfW2Jy5+pBZFS4FEVSTNTtqnkdI7h2Pb5NqET/9YoCS5//2eK6V3MyHlZLkx1FGRL2q44WwKAdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9451
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


On 10/14/2025 8:54, Lucas De Marchi wrote:
> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>
> The MOCS table for NVL-S is the same of Xe2.

Nitpick: Maybe rephrase it to "The MOCS table for NVL-S is the same as 
that of Xe2". Also, can we have the Bspec listed for this, to assist the 
reviewer.

Aside from this, LGTM,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_mocs.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 7b68c22ff7bbc..e8ec4114302e5 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -576,6 +576,7 @@ static unsigned int get_mocs_settings(struct xe_device *xe,
>   	memset(info, 0, sizeof(struct xe_mocs_info));
>   
>   	switch (xe->info.platform) {
> +	case XE_NOVALAKE_S:
>   	case XE_PANTHERLAKE:
>   	case XE_LUNARLAKE:
>   	case XE_BATTLEMAGE:
>
