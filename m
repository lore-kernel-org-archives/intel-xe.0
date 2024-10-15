Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C6D216B9
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 14:44:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A703F10E595;
	Tue, 15 Oct 2024 14:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c35efNMz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A710E595
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729003461; x=1760539461;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aot4kROODKQeIDSF/qCHEsVi4DSIubMq0PxMMpLyzoU=;
 b=c35efNMzC/l1ycYYWeffLxNnS/rckNKNku/R+M33wEBHGaTfjXnA32Vk
 0zcNJgLoDtRAtwyKex9jG6xbZbyr95AVxKvEgvStnOfWWewtJtBNK7Ocz
 RrnawfBHWS88HuFP1oAhlT9+JWGYt815sXBJyde6tBTHb/TMeZRUk5FKK
 hEEdyEK+fVUdbLTynsfd5iZ0rV3kdciYHE2ixAiXVOMWJxG8gXT45NUq0
 ajU9yspj1l0bldAZ6Q2CAm9u8p1Mky/zdtLAkeHGHL90TWksPFlrcXbp1
 0k+3Cbk14evn02O2Y+Y1uscYwN9T/uUMmIop/mXcRt3/5CoBU1BLj1HdZ A==;
X-CSE-ConnectionGUID: jQqdalbmQvaMRiFfVIM0Nw==
X-CSE-MsgGUID: CbRH5UH7RtSDaRUh/iZCIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="39035667"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="39035667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 07:44:20 -0700
X-CSE-ConnectionGUID: GulrRsD3TsGckDKi8nKK9Q==
X-CSE-MsgGUID: +RGNi1SjTCaK9fi15Xjgyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77801801"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 07:44:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 07:44:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 07:44:15 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 07:44:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 07:44:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZSDV1VH5UT4m2CQB2DexVXnLbbJFepKfOJuw7sUy4OF+fu9xn1QvJat3WtjFQ2Tm16rh0RWHml3+Hok2XxMVRwDcr6x1O5wHY5zS5pUY6Uv9Z0WwW+OGPngNS08jrWl+8B5+nzbvH5aktkV0Rin2jvdHuBavMVIZOJSKNTeYchQh9cbNKSRepPWZEsSpLCdUUyB3ZGPokPseA0rZHSfXolhHgxugVcZv+FINNQHivKFhZOKVytFoKN6qlO2EU5ImSu2TCYZvpIUyoEZgN6R76maz4FSQUH1A9qMadpGa9cwj1s4U9P75CvbrliiBysxbZtbsvIFUyr/qmleei2izA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gOOaIeGo0wHFmepb7Li5WYFXYrNIepvkVB48qYkBxE=;
 b=dSGFrFbWpzBVRb1y6xQ2CZcyKnSlwprkZT9oA4A2c3+KKgsvhwO5s8HMI7ty0DB8E66thQ2jGaoq+XgK0BH2plvxD+h62NmwUFqmA0r2O/fD12qKmuN1bfvLOBu9Fa3tcPU07W9gU6LzfdR6ANKwfVk52lGdm7vjVlw95m3t073+iOLkW/xf8FNmySiLw974QqBArwMGLqM3FnopxQAuvoT5q3Ya2h3YQyhweRKgG0H8Jyc47bovmYff0/M0n3GDL8AswJ6MfAAREXM9CliTFsxC/WMz/0/tVvH/zBJ8KgWHdvE9jdVYZwSeJ6tVlc08TLW8JVMsa63k7Me4FKwANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB7214.namprd11.prod.outlook.com (2603:10b6:8:139::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 14:44:12 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 14:44:12 +0000
Message-ID: <4702de0e-8d22-4a7f-8fcb-66bf5597f4d1@intel.com>
Date: Tue, 15 Oct 2024 20:14:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 09/26] drm/xe/gt: Update handling of xe_force_wake_get
 return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-10-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-10-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 31823c09-9a15-4127-1c4e-08dced27d53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YllNTnF3cVhsMUsxaFhBb3JBYm0rN0g3clcwZXFhZnRjaGJhUW8wMkV0ZjVX?=
 =?utf-8?B?MTZJam1BTEVsdDJ5dHpxaU1sSzRqRGc5NG9pTjZCUi93QWZXZjVhd0Nwdnl3?=
 =?utf-8?B?a2JiR1I2QUlhR2ZVVzJybG4xU09kSm5TZC83eVhhbFJYL25qZnFNanRFZVpi?=
 =?utf-8?B?Ym5oQU1ReGxkZWthM2NRZ3E5WWFuRUw3b25tbnZzUjhDemI0UWJBd2JKMHVQ?=
 =?utf-8?B?TTVlZHlVeWZnM2I4N3FydXozc0VBL1dTRHhrVVNEQ0xNSlloY3FaL0JtOVVt?=
 =?utf-8?B?RmxLSHZxajlTUVZCK3NxUllrbXc4NUJVNXRVK2VHVFpFUTIwOXNHbS9mSWZG?=
 =?utf-8?B?R2Q2VXNxelpMOTZpc3ZMK2l3VVJzUkhCbE81WFIyZkljTXZ6dTJsY0dwSE5F?=
 =?utf-8?B?ZXR2SU9DYjdDUVJsZTA2dkxSRHNJWU9UeDI2TVBmMzgrTFF6U2xESXlpNy9n?=
 =?utf-8?B?OXdGVmNCc0RyREUxWHRSOVdBZ1Z0bi9TWUFXaUk1ZHo2UG8za2pDakwzZm50?=
 =?utf-8?B?VlpIRUJhNUhDcTNDSWdIdTJLYjNHK0JYNGZvbm42SXplbURkY1QyaFA5RGlt?=
 =?utf-8?B?UWpTS0V4M2thNHJGalp3cFJnV0Fyb0Z3Y3lIZWNIbGNzR2k2M1ZKZGFMNWRp?=
 =?utf-8?B?V1pXL0tZMVlPaHArSDExVDM4UUdYVGtJMVdlR2U4cUJJbVJmV0FlemFrWHBz?=
 =?utf-8?B?WXRyM0c3bGx5ZWZmVkUzUlZEMjR1dEF3cG51ZVVTdVkwZjNROFd6dFBkTFlN?=
 =?utf-8?B?Z2xXQW5qd09ab0pJUGhUQjFyZTBZTHU1aFFHclRhanZKckJpVURQaUNvR3Er?=
 =?utf-8?B?Qzg5TFllVFZyVW9TY0pPN1ovVnVoelY3ejR6NE03ZEVPREFZLzMvRDFhYVF0?=
 =?utf-8?B?R3lSNUFaVHJFY0FiT2J2NnBQQmRIQW03bFZpcjBidFZrWUxWTklsQzZQSEhn?=
 =?utf-8?B?d1U4YVdpczlCdjUwd3NlNUx2Nno2b0pDMGJMOEhVMU43UmpDbmo3Y25JeXk0?=
 =?utf-8?B?bDBzTC9IaXE5a20zYzlMQW9xNVI3SXM5cEZ6MCt1MW9yM0JrM0xxdzhmZWZo?=
 =?utf-8?B?Zm1hZzF2Z2pvUkFuVEUvMWE2cGZHbTl2RUxFNVlvc2hHYlRnaWdtRkdxRjhx?=
 =?utf-8?B?TFhrM2gyWG9pcG80Uzg2dGhiV2pZZ0lWY25wV0Uzc0hHK0NaZHF4T3FEaGw1?=
 =?utf-8?B?OEdWNDRRbUt0KzRwTSsrVERFVlV3QkxpMVpYQUhwL2xvcnlSSWdXWlZLM2Z0?=
 =?utf-8?B?U08veHpWenM1ZXlSelJOTHdqNjZaM0ZpVWRsenZ4YmRBWWs1eXZrRXMvd1Uv?=
 =?utf-8?B?eHNTY1lsSHZnNURFR3hNOTVjd0NoNUNCMmhBQmN5OEErSDJhNFFOdjVnOG1J?=
 =?utf-8?B?UTRacXUxSENRYklGakFKOUFudlFrZ2gyRzlIZnd5eUxBK2NlTXdJSmdQYmQ5?=
 =?utf-8?B?NU1qblAwMWtObFpDZ1ZNbTdlVTBTK05ZRzhKNEFmbXlHaEdxcDV2ZUo3cWFa?=
 =?utf-8?B?UmdtM0wyTWFzSEs4dGNmMUs4ZnhxSm5KaFUwWDlkakNXQTVuN21lcERLL2dT?=
 =?utf-8?B?NUwvMzFJVWRuMTI4b0xOZ2dITzVKQjA4SlQyZ2haNzJHWGtFNkpwNEpMRDFs?=
 =?utf-8?B?akVJTEJ6dHBrZzIwY1lrczlJVmhUT0JmbHFUY2pHWHNHYUlFK3dVYzl3dys5?=
 =?utf-8?B?NkNaeGd6aTl1S2l2SThTM3dRMm1YOUpoRTJ6eTZDcjN4U2g4QkhPa1VBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L045Tm5xSUxXQ21jS2pTL24zYjYweUVBMGJDSktOcjBrVExMbStvUzhaRWt0?=
 =?utf-8?B?cERReG5EYURTK2xLK1g1WVF3WlJ2VVJHUUJKOU1vSERrQ3NCemQySXJ1M0tp?=
 =?utf-8?B?dzRGV0luMlN2Skk2ekxweDJBbGJPM3ZtZ01UWi9wVWpLVGg1MDZSUmVScUdP?=
 =?utf-8?B?ak1RbFhFOXRLOTdiUG5ZajNZdUdtMk5HNmc3MHdhY28zV2NmaE9sbUNkNFBo?=
 =?utf-8?B?VEJOK3ZIK1BVcGM1NU5OZ2hEWTVHZU9xMWhpRWVzbFpGclR2alU1VGN1UG15?=
 =?utf-8?B?OVhoSG1EOENXdmp1YXUxbVRPOGVyanV1MHY2SEd1SmJwT09wL1VKVUpRR0Rt?=
 =?utf-8?B?MlNqRWZVdUR3Sit5ZFdRNGxaa3RLczVhRzZ6NHhqMkR4ckgwLzlkMHFLWHZj?=
 =?utf-8?B?ZUdoWS91dkdUWTBzVWJCbVQ5ZGYzSHl5NUp6bEVDT3lwZk1Hc0pSNFUrc3ZG?=
 =?utf-8?B?NVdURVhmdHdjR0w1N1FhT1RkMmpaVytQa3BwaVl5Ylk5L1Fja1g4QTdYcTRx?=
 =?utf-8?B?SHhuL1NiRXdHbzRwRHVoTk1ndGFwVk12N1B0bC9LSjBRNEF3L2hGUEpsSE8z?=
 =?utf-8?B?d043aytiWEJHV2NvM0QrR3lqcTJobkUyeUd6dEhtaUtYcjNBT1ppL2hXcWlT?=
 =?utf-8?B?ZmlMKzV3a1ZIbHZ4Tk8vYW9HTlZSc2loSnF4NzZNWWRsMDBIVENtbGlFcmNa?=
 =?utf-8?B?V3gybnU5bmEwOFRmV24yUVY2UFpVTDJhMS84c1NXM2c4Vm1IMS9pd2ZkMVJq?=
 =?utf-8?B?YkpBQTFPNlB5NmFpbnZVcU91REwvYkw2MVl1MFpINFlmYnZSOFc3RDlESjBS?=
 =?utf-8?B?WFBhT2tpNGREZDd6R00zcXJYRkx3TncwajFTZnFyQTEzaUVrdWVGUXRPcWJS?=
 =?utf-8?B?MDhWeDlMdFpTcWp3VHhpeWZBNHA1S0ZQekljTUw0M29IeGZsSWNhY3ZmVlJZ?=
 =?utf-8?B?cCtIQUp6RDFnZFBCRkRxQXpZUGhVOU5COHEvNkhzVTk1czQxRW50ekJIeHlZ?=
 =?utf-8?B?NTVuNTZzdENTeVBFMzV1eit2dHR2TU9BSk9iKzN5cUlMNTlKdllwVlpMcmtP?=
 =?utf-8?B?dWw4ZEVhdU5SOU9adFFiTEFjSnA3bVFxekN6ZnoxN0tQc2U0c2pRankvbWEw?=
 =?utf-8?B?cTBpRngvYUJHeEJ4aEJJV2hLd3UwMzArR1Nrdjk3dk1YYmRIMEFVNE0zOWRm?=
 =?utf-8?B?VUdTdDNac2kzVktDVDdVV1RLY2Z6Vm1IMDBSUDRSOWc1NzZMYlcvWlJ0WXU0?=
 =?utf-8?B?S1NkSThVeTR5eS9pTzdRM3hTVWZKbU5kUEVINEtYZUZPbXNpZnBySGs5bEFu?=
 =?utf-8?B?eGJMckhNZitEa1ZxdWFiVWxqY1N3SHBWN1lqT2dsWHVBSko1SENMUnN6by9S?=
 =?utf-8?B?bTkyM2Y4dllrY1k5ZWFBbkorcmFoTWhmWi9JREdYREZUU1I5eDltQ25QQllD?=
 =?utf-8?B?UE14UjZMejFuMXlJNUpkaVJ0VXluNEw1U1cyRTVuODJlcEVLeElZV21UK2NN?=
 =?utf-8?B?ZEtpWjRmWElvVUtCRlNSOXdLa1QyQ2xaN1BsYW1JYXFCcWxSUGo1dUE4eXBy?=
 =?utf-8?B?QUZmRk9FSWNVeXVSaXkwelVQdUVJcVVzSUFwMi81UHJhcTNGckdFVHBQdk54?=
 =?utf-8?B?aHh6aFUrS0lJaXdwNjlzNTh0OUJPakZJMkdyRitGU2ZpS0x5WWNkUnZtSnZO?=
 =?utf-8?B?YnB2bEZKSDd1bWJvMU1uc2pTeElRNDhsa25aTldOOGwwaHRNVWJISW8zWlJS?=
 =?utf-8?B?aWFVR0hwdzVCNFN4MnlvWDVJZG4zL29Ia0JLamdWb2NSRWprdmJuUFN5ZlZz?=
 =?utf-8?B?ZW5VaHM5Vy9IcmYvRXpxZkdqYytpSWtxNTZOSUpRNnN4ZUpGTldpM3ljWWFi?=
 =?utf-8?B?MmpqNTU4ZHhjdGhkbm85dU1LdlhVeWgvZzZSVW1pWmhLVW5TL2lkd1NpYXBp?=
 =?utf-8?B?SENDdCtpVkR6MUJLKzJrSUZHN0x2NU9EQ3lTMFUrSkM1WW1iN1pUTnpmWW5V?=
 =?utf-8?B?c1RjbElFMSs2U0d4S3FXblE5UDMwVmVaVlY0TFJrZ3hodDcvRC9sZkR6SjNR?=
 =?utf-8?B?YlI2N2txQ3lIOVlCclNtcHFOMzJMZURLOStYT2hlekVYTGd3aldWcjBPTXBv?=
 =?utf-8?B?MWNCYjFDOXZrWE9kZFpxMVVDMC9NZVFlRWVBMlVDdGFldmgyUEE2QnV5SGV0?=
 =?utf-8?B?eFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31823c09-9a15-4127-1c4e-08dced27d53e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 14:44:12.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq+xpV3bf4+ukd/d+T15pkQ5dd05gPI8g42OmgF/keHGs9XMpH9GfV8CqRAxf/VAHiKLmBKUqbaS+ZP97Ji6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7214
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to verify
> all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v4
> - Rebase fix
> 
> v5
> - return unsigned int for xe_force_wake_get()
> - remove redundant XE_WARN_ON()
> 
> v6
> - use helper for checking all initialized domains are awake or not.
> 
> v7
> - Fix commit message
> 
> v9
> - Remove redundant WARN_ON (Badal)
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c | 105 ++++++++++++++++++++-----------------
>   1 file changed, 58 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 1c79660fb086..adb51845c21a 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -97,14 +97,14 @@ void xe_gt_sanitize(struct xe_gt *gt)
>   
>   static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (WARN_ON(err))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	if (!xe_gt_is_media_type(gt)) {
> @@ -114,13 +114,13 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   	}
>   
>   	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	u32 reg;
> -	int err;
>   
>   	if (!XE_WA(gt, 16023588340))
>   		return;
> @@ -128,15 +128,15 @@ static void xe_gt_disable_host_l2_vram(struct xe_gt *gt)
>   	if (xe_gt_is_media_type(gt))
>   		return;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (WARN_ON(err))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
>   		return;
>   
>   	reg = xe_gt_mcr_unicast_read_any(gt, XE2_GAMREQSTRM_CTRL);
>   	reg &= ~CG_DIS_CNTLBUS;
>   	xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -402,11 +402,14 @@ static void dump_pat_on_error(struct xe_gt *gt)
>   
>   static int gt_fw_domain_init(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err, i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref) {
> +		err = -ETIMEDOUT;
>   		goto err_hw_fence_irq;
> +	}
>   
>   	if (!xe_gt_is_media_type(gt)) {
>   		err = xe_ggtt_init(gt_to_tile(gt)->mem.ggtt);
> @@ -441,14 +444,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   	 */
>   	gt->info.gmdid = xe_mmio_read32(&gt->mmio, GMD_ID);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -	XE_WARN_ON(err);
> -
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return 0;
>   
>   err_force_wake:
>   	dump_pat_on_error(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   err_hw_fence_irq:
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
> @@ -458,11 +459,14 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>   
>   static int all_fw_domain_init(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err, i;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> -		goto err_hw_fence_irq;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		err = -ETIMEDOUT;
> +		goto err_force_wake;
> +	}
>   
>   	xe_gt_mcr_set_implicit_defaults(gt);
>   	xe_reg_sr_apply_mmio(&gt->reg_sr, gt);
> @@ -526,14 +530,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>   	if (IS_SRIOV_PF(gt_to_xe(gt)))
>   		xe_gt_sriov_pf_init_hw(gt);
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   
>   	return 0;
>   
>   err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -err_hw_fence_irq:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
>   		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
>   
> @@ -546,11 +548,12 @@ static int all_fw_domain_init(struct xe_gt *gt)
>    */
>   int xe_gt_init_hwconfig(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	if (err)
> -		goto out;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	if (!fw_ref)
> +		return -ETIMEDOUT;
>   
>   	xe_gt_mcr_init_early(gt);
>   	xe_pat_init(gt);
> @@ -568,8 +571,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>   	xe_gt_enable_host_l2_vram(gt);
>   
>   out_fw:
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> -out:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	return err;
>   }
>   
> @@ -764,6 +766,7 @@ static int do_gt_restart(struct xe_gt *gt)
>   
>   static int gt_reset(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	if (xe_device_wedged(gt_to_xe(gt)))
> @@ -784,9 +787,11 @@ static int gt_reset(struct xe_gt *gt)
>   
>   	xe_gt_sanitize(gt);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> -		goto err_msg;
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		err = -ETIMEDOUT;
> +		goto err_out;
> +	}
>   
>   	xe_uc_gucrc_disable(&gt->uc);
>   	xe_uc_stop_prepare(&gt->uc);
> @@ -804,8 +809,7 @@ static int gt_reset(struct xe_gt *gt)
>   	if (err)
>   		goto err_out;
>   
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_pm_runtime_put(gt_to_xe(gt));
>   
>   	xe_gt_info(gt, "reset done\n");
> @@ -813,8 +817,7 @@ static int gt_reset(struct xe_gt *gt)
>   	return 0;
>   
>   err_out:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> -err_msg:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	XE_WARN_ON(xe_uc_start(&gt->uc));
>   err_fail:
>   	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> @@ -846,22 +849,25 @@ void xe_gt_reset_async(struct xe_gt *gt)
>   
>   void xe_gt_suspend_prepare(struct xe_gt *gt)
>   {
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   
>   	xe_uc_stop_prepare(&gt->uc);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   int xe_gt_suspend(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	xe_gt_dbg(gt, "suspending\n");
>   	xe_gt_sanitize(gt);
>   
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_msg;
>   
>   	err = xe_uc_suspend(&gt->uc);
> @@ -872,14 +878,15 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   	xe_gt_disable_host_l2_vram(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "suspended\n");
>   
>   	return 0;
>   
> -err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   err_msg:
> +	err = -ETIMEDOUT;
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;
> @@ -887,9 +894,11 @@ int xe_gt_suspend(struct xe_gt *gt)
>   
>   void xe_gt_shutdown(struct xe_gt *gt)
>   {
> -	xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	unsigned int fw_ref;
> +
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	do_gt_reset(gt);
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   /**
> @@ -914,11 +923,12 @@ int xe_gt_sanitize_freq(struct xe_gt *gt)
>   
>   int xe_gt_resume(struct xe_gt *gt)
>   {
> +	unsigned int fw_ref;
>   	int err;
>   
>   	xe_gt_dbg(gt, "resuming\n");
> -	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (err)
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		goto err_msg;
>   
>   	err = do_gt_restart(gt);
> @@ -927,14 +937,15 @@ int xe_gt_resume(struct xe_gt *gt)
>   
>   	xe_gt_idle_enable_pg(gt);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   	xe_gt_dbg(gt, "resumed\n");
>   
>   	return 0;
>   
> -err_force_wake:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>   err_msg:
> +	err = -ETIMEDOUT;
> +err_force_wake:
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal
>   	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>   
>   	return err;

