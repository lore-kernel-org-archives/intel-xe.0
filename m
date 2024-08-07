Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0957C3DA7F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 19:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5F10E5BC;
	Wed,  7 Aug 2024 19:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kLkGQVgS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D3610E5B4
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Aug 2024 19:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723060607; x=1754596607;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uP3emdr+v3VDf4zb4E6/R8Wjm1eiIzpFKSfDCz/04qs=;
 b=kLkGQVgSwzZY4i5XFtB2rwGvcZFtzN2nLGy/d7EbkxoiypRC/Tg+PKHk
 owdIoAauRLdzik73Tnflf7VhTd8lTq9con2aImNMNoxCuhQ/C87Uxxw3o
 S6l7gK2Xrdsu7bLsooxcnbPdfHiaMys5DNheeV3lvnewz2tB+tatdEHnQ
 aa6jWYqQUPoIv+qJj2Dpw+pAkOJN7vdl6J7Uum3iOxHWOY2ZdQTy7WFQq
 AuAzbVVMoW7SS2OO+g7JliD5qkcznJNU6Z1UMQ5Oe1l1SeRAUWoXnTn/D
 28MqukuTfc2NQja5zVP879Vt/nqlquGw91YpZp/3pctV8I5y5iRqGrPlU g==;
X-CSE-ConnectionGUID: fNPB64NlQg+vhG0vlShgxw==
X-CSE-MsgGUID: mXDcPYjFTeyoFU+w7DvvRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21326190"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="21326190"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 12:56:47 -0700
X-CSE-ConnectionGUID: 0aIfX3RVSQCr7ne0CipXTA==
X-CSE-MsgGUID: iT03Uit2Rw2CYojDorgVew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; d="scan'208";a="56647872"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Aug 2024 12:56:47 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 12:56:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 12:56:46 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 12:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CE0yGQtt6qm73vh7fOceOcqOOJS37qt7eJhAVgF7D2wXt7aRUvG+utpKNwsKpGGY968cEa8TFptzlQkg7BSOgFX9Q23EuG36MowtjSMcu14Gfkb0c8C7TbMzheR8SC8fjXCz9qRRv+0E7DP3ZVmlJKaEyt1fUrhM+jJl9FaPmsytnSlO3TRhNsCNKowkCyyJpnvYFArOiyaEolVtTbEy4vomUvEkaNoxMnJoTRgeKnvlIf0hQch6U5UpAJdhwTwhS7zw7ODtjc7/MiUW7gXn5WUSKN059AbmLGDNKyE9DMNTovUtvwfY3QeI56/c8VGiNTpjmv1KO15LXFAvuZsv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlTxXaUi1wcmuv8wavyF++kXCnIExFbQ75i+i37jFxg=;
 b=ej6KNhlQr7Qx9z64Xcyi7cGrI4JRDZrZU3dFJFY0JcGicIrP0yfdg/Wvw2Jkoyoiz4EVG99wIW2OS3upR4zAUFTUqpfAaholCWtV06LZvthAg1unN2x+jMIoOSTvXy8ylbTXd8Zsss/AkytPAqaD6CUSdbVBiAAiOMiAJIBaVCtYkd1u8fdrZOQOvC3RIUyaMqpQPEq2OjGl4VO5MJvKMqsBRfMYmbXCDXIL8E3g0Jrx1E1hhFyVc3TY1E9+ORbnNpefsG9RM3WswwZThmsSr4JHdMv1eXGdUSm0lg4wXbckIUd8fpCYH48TegrvnRe6XQbitXJnVYtbakDiVwEvyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ0PR11MB4798.namprd11.prod.outlook.com (2603:10b6:a03:2d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Wed, 7 Aug
 2024 19:56:43 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 19:56:42 +0000
Message-ID: <7fd79c9f-8b42-4843-84df-2fe845f9108e@intel.com>
Date: Wed, 7 Aug 2024 21:56:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/gt: Add APIs for printing stats over debugfs
To: Lucas De Marchi <lucas.demarchi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Sai Gowtham Ch <sai.gowtham.ch@intel.com>
References: <20240807110802.13385-1-nirmoy.das@intel.com>
 <gos5am5tdkhozpwidgopru33w33hgt5dd4wqcn4xkjkllkl6im@bkldffzsasvv>
 <ZrOnbbp8LQn1ueiF@DUT025-TGLU.fm.intel.com>
 <yu3lrzj4k762rwttnhidnooi6nqj665dr3h5vcag3zahol6576@4d7t2j7ivomc>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <yu3lrzj4k762rwttnhidnooi6nqj665dr3h5vcag3zahol6576@4d7t2j7ivomc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0273.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::14) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ0PR11MB4798:EE_
X-MS-Office365-Filtering-Correlation-Id: e2240782-c8f7-4875-9ba0-08dcb71b0f27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHBGdUFsVVFHbTFMOXh5SmZvWEZoZ2JsY0VwSzlBb2NPNGZFWmQ5ZVF5bCtu?=
 =?utf-8?B?djFqQ2g5YVNURkI2UFlRZy9zUW9sT1c0a0F5RGQvYW8zMUk4djVFRjRCNGFC?=
 =?utf-8?B?bC9zVHBRcWVZT05HbkNTYXYxTWRPbG9zLzNmNFl4UUZNOWk4QmlxVVRXbE14?=
 =?utf-8?B?WkxDUzJ4UDVnRnFOb2kzU1U1TU9PSW9hakFjL2Z0azFwR1lqWG8zOGhYeG5a?=
 =?utf-8?B?dktWOHdwc2hCT3dFbG1vWlYra3JKbG56SmpqSHo4RUt2WllXdU9sM3Vhemp0?=
 =?utf-8?B?ZjluM1dVcWliRWllMTFXb2E2dEMwNWJuZWIyVDJOT3BVZ0x1YVBVQTNORHdT?=
 =?utf-8?B?M3hFdk85ZkpSUmRmd1ZYZWNBZWRCOU1qUkhQOVJXVmNFRllvSVpXc25IQU1D?=
 =?utf-8?B?WldhZlppMy9yODkzajhnZnlhcFB1aTNmMGNvbHhmRC8ybDlhQjFtSVQvK05u?=
 =?utf-8?B?TTg0bGdIbDc3OXJFcm1oQnFQY3RmY01XNXg5YkF0eEJnL09TQklnV1NZTVBX?=
 =?utf-8?B?RmhsS1pIUG1kQThJTktIRVBNOUxEbDZ2U1NQUjZMTEtWSmZvZHkvWEcxQjZo?=
 =?utf-8?B?UWpYY3hiVXBYT2tBMWM1Z0Z6ZVV4UmxYVTUvOTJiclBIV1JFdDJLVWcxMkl6?=
 =?utf-8?B?MlZBUWNKMEh0RGp0cXNSSTJyNjVxT1QweVduQitoZFl3akEzaERkV0Mzc1Mv?=
 =?utf-8?B?VWJYUlN0aXdkTGFValNPVzM2QkVnR1ZacE1XTzgrU0J3SHFxTkEycmsySGdD?=
 =?utf-8?B?UFJUeHZLc1lVWER6ekVmMS9mOXA1OWNBTlZEVUIrRU1lTlZPMHZkL1ppWXc5?=
 =?utf-8?B?cTYrU3l6MzNJbnNPRkUvamlLTDB6ZmtEckh2RldmYllMWFVDRk9JbmNRU3ZF?=
 =?utf-8?B?RXZ2R1hLTkpFSHQwdjhwbjRlcUdNSlc4TklYeHZocVJEazJjMHdPeE92b0Vq?=
 =?utf-8?B?UGsvdTVnQ0V5dzFSMitMQ2FISFRJUjJsTlZoSDNsRFR0eE5HUTBzN1I5bnhY?=
 =?utf-8?B?dUJPOHlibTVUOCsrMkRMVkkwa1UyQ3JlSHBLNTFDdmQ2QjVOeklZT0RRNDJD?=
 =?utf-8?B?blgya0hCVnBLeTFwTms3TTg5UkpaZjJvOWx1a0hNTysveVpIbjRORVJsN1FM?=
 =?utf-8?B?RXlIaUUzWWpET1dkdERNdFJMUnZCUHVEKzJrWnZXUnY4cGJ6ZjVhSTd3NytH?=
 =?utf-8?B?VFp0VDd1bzVlVHR2OTJIbHBQS3hJRW83WHN3V1RIUDVld3RaZXMzamN3WTR0?=
 =?utf-8?B?dDRibnRGS1lURGlwU1dsRW53SFB1bzR0am1JZFNzcWdvRlU3T3BBdWk5cFZy?=
 =?utf-8?B?cFI1SEdZMlBNMnFHdVFhYVJkTk8xOGh5SG5TVmdHNkxBdkNLbDlVWGpWZEpC?=
 =?utf-8?B?REFCRExUT2FBZHc1c1MrclVVRjc2eVNJS2NGSnhkSnllQVBWZlBSbHJzUWRu?=
 =?utf-8?B?bFFsUm80anNFVUhBcEtwNjFQWkJFQ3hRWVB1NVNsVWNMMkJrK1k3UDZTWi9q?=
 =?utf-8?B?Q0R6dit2d2lTUHArS3hucXhNd3JYTUtwb1pwUk9lNFpMandwdkZTUk12SVVO?=
 =?utf-8?B?ZzdyV2doaHFSOWtGVHhVaWxjU2JDMXpFeDkrVlBiV3dlQzJjaHlxbjA2TXl4?=
 =?utf-8?B?Z1lyUGVHS3EwbXFWcTM0eE91KzZCRnFzVmY1L0htZERSUll1Ty9Vam95Lytt?=
 =?utf-8?B?WTZ0MGdWWlVNRW13eS9Bd240YnZzZVVMdm1UckdUcDhtSlBsT0c2aGcwbkN4?=
 =?utf-8?B?MTJwYmNoUnpvM2djRXIrK1c3NS9KZzJqcWFRajVqZDZibVU2Nmh5QUdYT0Ji?=
 =?utf-8?B?Nnh0RW5YTXR1K0RKSVBmZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm4yUGQxNmJFMFpMREZ4Y0NBaDNVb0dSWXRNK3lQZnJydjE0QTlTMklVY0E0?=
 =?utf-8?B?WjF2M29yMHFWZS96am14ZW9ZdFpuVTV4dmJhTmlWMTNUZ3lHWUlmSUlNQUUy?=
 =?utf-8?B?bEF2V0FDVFRJZVhFVWhjaWNscVh4NXZPRVpxYk0rRC9oaStZU2lWNkE3KzIv?=
 =?utf-8?B?UEthTjFkdHU2dEZSNGE4M2pLQzdveHBWbFBjNllZY3E4WW1CMjhvditEbytX?=
 =?utf-8?B?MkM3RC94QWJpNkhKdWdLTldzNjBpNEtUcCtZS1J5VjFsaitIWUNHZXowMFlL?=
 =?utf-8?B?U1pPL3hJZzJZdTYzOUF0R29nekljN2d6OXoxQjhBeVhuQUtNUk0yUTFWZmk0?=
 =?utf-8?B?eVdOaXhsN3I1d0g2dGtPYUhnckQ1OFZhTmUydDJ4ZDlhK1gxdWdyRWJyRUJ6?=
 =?utf-8?B?S2VSRmZ3YWlvUkFJVEJ2UnZ2NHVvem1vaDliZ04wbm13WVF2T09xc2tEYWY0?=
 =?utf-8?B?ZkFmSHhMaEt2SzJYNzEzUit1UE02R2IxZ2djQ2JkYmY0R3JBUVg2cXZiT1BO?=
 =?utf-8?B?VS9LREhTanhhWU5ucHZqcmd0UnJ3UVJhVkVTc3VXaDZYMEtmYU5PUS9rcGsr?=
 =?utf-8?B?ZUgzbVdJRTdxMnZjM1Y3UzRyK1BXME1Sc0g3YXRjMHF5VTlTZjgzSDdibGho?=
 =?utf-8?B?TjI0KzIwVE40T05yRG1lVjNYZW9yUmlqOTB6b0dIWFNpaHlWbG0zNG9JT0tU?=
 =?utf-8?B?QmNTRHovQ3BGU0t3Z1Iwb0taaFQ1STgxV2xiNmZ3b2RJc3ZiN0FxUXBPOTJt?=
 =?utf-8?B?a0YydXh4a1c0RTNjRlIrR1piUmVrNllvUzFOWjYzTVJMaURJZ3JYT0p5Nllo?=
 =?utf-8?B?K2lCdlhmdDU1NlBVZEJ2Z2JETXZ3RzNpYVZNVlRQWGY2T0xjaDZ2SEhoTFFr?=
 =?utf-8?B?WEtHR0VMOVJPZzVlUk1waUV3NHp1eWZNWmtQaVVPb3lwVnE4bzBsc0I0NW0z?=
 =?utf-8?B?bE1VTVg4WTNHZi9sZWk4MVl5TmdaNlJYd1Q4NWFWQWRRVnREbkgySzJnRXNk?=
 =?utf-8?B?S3hzS2Z5SHBzY3BpOHFQLzhtUWw1TEVTV1M2Y1pnRGU2UTZlS1lseXpOOWVT?=
 =?utf-8?B?U1dtSmtqSUNNblNiUDZCU1VUcnRaTFVQenN1UFVwTk8vVm5ySHVHeW1ZVTRq?=
 =?utf-8?B?TFNjejQwUlVsUFJ2ZG44eEFHUENFQzIzMG83eUVtWWkrRExZQkhIVEFiTkN6?=
 =?utf-8?B?UWlQdFBwam52ZFBhdUVLL2RncElBdmFZM1ZCcXJ6Zk5OWlRFcjkzRFVJSS91?=
 =?utf-8?B?QmNsSjYwZEhqbmQ4ZXBGVHU2a2VYRCtRM2FRU1doakk1eCtJS0FzRGVWVHhC?=
 =?utf-8?B?ZUw4NGNmLzZxMDNaQnpOV0tBblJXcGlNcDhIMno2QURLVG1vTDU1eURqc29x?=
 =?utf-8?B?UXVIc2JxQWd3cW5OdjNXNVVFcUxxTEZyeFJ3Z0tiUzdkNlkvemNFRDNkSDdv?=
 =?utf-8?B?RnpjSWs2TTF0Q3pnQ0VZNldETFpWYUc2OXBCeFdyc1g0VjY0cmsyMEt3VE5z?=
 =?utf-8?B?YUx3WHVkWXQrRFFHZmt3MVQ3SHU1YXdPR1VUVS9TcVN3VGJzMGhIYklLU0pj?=
 =?utf-8?B?S29HU1ZCYXl1dStucXlXaUEyNkFRdDlWZEx1SjZJNklaSktiMFNqYUc0VFJY?=
 =?utf-8?B?clBXdjBBY1U4Si9vRmZBWWhjTmM0aEsvZVB0WmFnTFlJREVtQ1RLL1hEc2xP?=
 =?utf-8?B?anVXSTg3emY1NnZMUEJYQkhyUVc2THpyVUd1L0UvN1J1QUFLdVg4OXE4RHAr?=
 =?utf-8?B?d1U0UVBuMHhxWWJxWWZMTi90THQ0TUgwNlhMRFYyek9HQU43QmludkRxUnhn?=
 =?utf-8?B?QVFPWUhONGtsazN6dEQvYVhNYkV6eGZkZGswcGx3K01vSDJaMHR0cUIwclFM?=
 =?utf-8?B?cTY0MjRLbm9HSmhYdWFKaXd4MGxqOWhpTGRYNmpEUjV5ZlNtUDY3T0c2S25O?=
 =?utf-8?B?VnhrSHZOTjcvTVZWYUlYZVpxSmZlYVFzN0FIVGFMWkRxTkVheWpUUU5oQWdQ?=
 =?utf-8?B?YVozSlRUemZQL0o4amJHY3ZtTEFsRWdraXEwVDYxQnAzZmRnbitsZ2w5eFdt?=
 =?utf-8?B?WjQ3K014N29ENnZSTjAyWklkbkV1Q25MSlVnWjR6Y1lEcllYUjRxYU96ZHRN?=
 =?utf-8?Q?LK7H5NMEIM2cmr9LTnchNS04v?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2240782-c8f7-4875-9ba0-08dcb71b0f27
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2024 19:56:42.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1++dH+r54uaVk/g0FAj5WtP+l9F8ACXdUmFuvCNh0rRgvLKUyPjr2RYuxgMRZhLoH+ognfzOb/k0oUhNfxCQCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4798
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


On 8/7/2024 7:45 PM, Lucas De Marchi wrote:
> On Wed, Aug 07, 2024 at 04:57:17PM GMT, Matthew Brost wrote:
>> On Wed, Aug 07, 2024 at 08:59:34AM -0500, Lucas De Marchi wrote:
>>> On Wed, Aug 07, 2024 at 01:07:58PM GMT, Nirmoy Das wrote:
>>> > Add skeleton APIs for recording and printing various stats over
>>> > debugfs. This currently only added counter types stats which is 
>>> backed
>>> > by atomic_t and wrapped with CONFIG_DRM_XE_STATS so this can be 
>>> disabled
>>> > on production system.
>>> >
>>> > v2: add missing docs
>>> >    Add boundary checks for stats id and other improvements (Michal)
>>> >    Fix build when CONFIG_DRM_XE_STATS is disabled(Matt)
>>>
>>> I don't understand why we are even adding a config here.
>>> This should just be compiled out if build is without debugfs.


CONFIG_DEBUG_FS will work. It just didn't occur to me.

>>>
>>
>> I don't know enough about how compilers work these days but would the
>> atomic increment compile out without debugfs. If the answer is yes, then
>> agree we can drop this Kconfig.
>
> either this:
>
>
> static inline void xe_gt_stats_incr(struct xe_gt *gt, enum 
> xe_gt_stats_id id, ...)
> {
> #ifdef CONFIG_DEBUG_FS
>     atomic_add(...)
> #endif
> }


I will resend with this method.


Thanks,

Nirmoy

>
> or a dummy implementation separately would work.
>
> We can also use
>
>     if (!IS_ENABLED(CONFIG_DEBUG_FS))
>         return;
>
> Compiler would still constant fold  and drop it. See
> Documentation/process/coding-style.rst - 21) Conditional Compilation
>
> But in this last case we wouldn't be able to remove the symbol from the
> gt struct, which may or may not be relevant since it's just a few bytes.
>
>>
>> Also does debugfs havea Kconfig, did a quick search and not seeing one.
>>
>
> see above. And we already check it in drivers/gpu/drm/xe/Makefile:
>
> ifeq ($(CONFIG_DEBUG_FS),y)         xe-$(CONFIG_DRM_XE_DISPLAY) += \ 
> i915-display/intel_display_debugfs.o \                 
> i915-display/intel_display_debugfs_params.o \ 
> i915-display/intel_pipe_crc.o endif
> oddly we are not compiling out xe_gt_debugfs, which we probably should
> since otherwise we will just see a warning "Create GT directory failed"
>
> Lucas De Marchi
>
>> Matt
>>
>>>
>>> >
>>> > Cc: Matthew Brost <matthew.brost@intel.com>
>>> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> > Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>> > Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> > ---
>>> > drivers/gpu/drm/xe/Kconfig.debug   | 11 +++++++
>>> > drivers/gpu/drm/xe/Makefile        |  2 ++
>>> > drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 +++
>>> > drivers/gpu/drm/xe/xe_gt_stats.c   | 51 
>>> ++++++++++++++++++++++++++++++
>>> > drivers/gpu/drm/xe/xe_gt_stats.h   | 32 +++++++++++++++++++
>>> > drivers/gpu/drm/xe/xe_gt_types.h   |  9 ++++++
>>> > 6 files changed, 109 insertions(+)
>>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.c
>>> > create mode 100644 drivers/gpu/drm/xe/xe_gt_stats.h
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/Kconfig.debug 
>>> b/drivers/gpu/drm/xe/Kconfig.debug
>>> > index bc177368af6c..4db6d707c1af 100644
>>> > --- a/drivers/gpu/drm/xe/Kconfig.debug
>>> > +++ b/drivers/gpu/drm/xe/Kconfig.debug
>>> > @@ -94,3 +94,14 @@ config DRM_XE_USERPTR_INVAL_INJECT
>>> >
>>> >      Recomended for driver developers only.
>>> >      If in doubt, say "N".
>>> > +
>>> > +config DRM_XE_STATS
>>> > +    bool "Enable XE statistics"
>>> > +    default n
>>> > +    help
>>> > +      Choose this option to enable support for collecting and
>>> > +      displaying XE statistics as debugfs.
>>> > +
>>> > +      Recommended for driver developers only.
>>> > +
>>> > +      If in doubt, say "N".
>>> > diff --git a/drivers/gpu/drm/xe/Makefile 
>>> b/drivers/gpu/drm/xe/Makefile
>>> > index 1ff9602a52f6..b0bbb248f644 100644
>>> > --- a/drivers/gpu/drm/xe/Makefile
>>> > +++ b/drivers/gpu/drm/xe/Makefile
>>> > @@ -143,6 +143,8 @@ xe-$(CONFIG_PCI_IOV) += \
>>> >     xe_pci_sriov.o \
>>> >     xe_sriov_pf.o
>>> >
>>> > +xe-$(CONFIG_DRM_XE_STATS) += xe_gt_stats.o
>>> > +
>>> > # include helpers for tests even when XE is built-in
>>> > ifdef CONFIG_DRM_XE_KUNIT_TEST
>>> > xe-y += tests/xe_kunit_helpers.o
>>> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> > index 5e7fd937917a..3765c04919dc 100644
>>> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>>> > @@ -17,6 +17,7 @@
>>> > #include "xe_gt_mcr.h"
>>> > #include "xe_gt_sriov_pf_debugfs.h"
>>> > #include "xe_gt_sriov_vf_debugfs.h"
>>> > +#include "xe_gt_stats.h"
>>> > #include "xe_gt_topology.h"
>>> > #include "xe_hw_engine.h"
>>> > #include "xe_lrc.h"
>>> > @@ -286,6 +287,9 @@ static const struct drm_info_list 
>>> debugfs_list[] = {
>>> >     {"default_lrc_bcs", .show = xe_gt_debugfs_simple_show, .data = 
>>> bcs_default_lrc},
>>> >     {"default_lrc_vcs", .show = xe_gt_debugfs_simple_show, .data = 
>>> vcs_default_lrc},
>>> >     {"default_lrc_vecs", .show = xe_gt_debugfs_simple_show, .data 
>>> = vecs_default_lrc},
>>> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>>> > +    {"stats", .show = xe_gt_debugfs_simple_show, .data = 
>>> xe_gt_stats_print_info},
>>> > +#endif
>>> > };
>>> >
>>> > void xe_gt_debugfs_register(struct xe_gt *gt)
>>> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.c 
>>> b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> > new file mode 100644
>>> > index 000000000000..b13aee5488d5
>>> > --- /dev/null
>>> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.c
>>> > @@ -0,0 +1,51 @@
>>> > +// SPDX-License-Identifier: MIT
>>> > +/*
>>> > + * Copyright © 2024 Intel Corporation
>>> > + */
>>> > +
>>> > +#include <linux/atomic.h>
>>> > +
>>> > +#include <drm/drm_print.h>
>>> > +
>>> > +#include "xe_gt.h"
>>> > +#include "xe_gt_stats.h"
>>> > +
>>> > +#ifdef CONFIG_DRM_XE_STATS
>>> > +
>>> > +/**
>>> > + * xe_gt_stats_incr - Increments the specified stats counter
>>> > + * @gt: graphics tile
>>> > + * @id: xe_gt_stats_id type id that needs to be incremented
>>> > + * @incr: value to be incremented with
>>> > + *
>>> > + * Increments the specified stats counter if that is within 
>>> expected range.
>>> > + */
>>> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, 
>>> int incr)
>>> > +{
>>> > +    if (id >= __XE_GT_STATS_NUM_IDS)
>>> > +        return;
>>> > +
>>> > +    atomic_add(incr, &gt->stats.counters[id]);
>>> > +}
>>> > +
>>> > +static const char *const stat_description[__XE_GT_STATS_NUM_IDS] = {
>>> > +};
>>> > +
>>> > +/**
>>> > + * xe_gt_stats_print_info - Print the GT stats
>>> > + * @gt: graphics tile
>>> > + * @p: drm_printer where it will be printed out.
>>> > + *
>>> > + * This prints out all the available GT stats.
>>> > + */
>>> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p)
>>> > +{
>>> > +    enum xe_gt_stats_id id;
>>> > +
>>> > +    for (id = 0; id < __XE_GT_STATS_NUM_IDS; ++id)
>>> > +        drm_printf(p, "%s: %d\n", stat_description[id],
>>> > + atomic_read(&gt->stats.counters[id]));
>>> > +
>>> > +    return 0;
>>> > +}
>>> > +#endif
>>> > diff --git a/drivers/gpu/drm/xe/xe_gt_stats.h 
>>> b/drivers/gpu/drm/xe/xe_gt_stats.h
>>> > new file mode 100644
>>> > index 000000000000..04a1d61ce1fb
>>> > --- /dev/null
>>> > +++ b/drivers/gpu/drm/xe/xe_gt_stats.h
>>> > @@ -0,0 +1,32 @@
>>> > +/* SPDX-License-Identifier: MIT */
>>> > +/*
>>> > + * Copyright © 2024 Intel Corporation
>>> > + */
>>> > +
>>> > +#ifndef _XE_GT_STATS_H_
>>> > +#define _XE_GT_STATS_H_
>>> > +
>>> > +struct xe_gt;
>>> > +struct drm_printer;
>>> > +
>>> > +enum xe_gt_stats_id {
>>> > +    /* must be the last entry */
>>> > +    __XE_GT_STATS_NUM_IDS,
>>> > +};
>>> > +
>>> > +#ifdef CONFIG_DRM_XE_STATS
>>> > +int xe_gt_stats_print_info(struct xe_gt *gt, struct drm_printer *p);
>>> > +void xe_gt_stats_incr(struct xe_gt *gt, enum xe_gt_stats_id id, 
>>> int incr);
>>> > +#else
>>> > +static inline int xe_gt_stats_print_info(struct xe_gt *gt, struct 
>>> drm_printer *p)
>>> > +{
>>> > +    return 0;
>>> > +}
>>> > +
>>> > +static inline void xe_gt_stats_incr(struct xe_gt *gt, enum 
>>> xe_gt_stats_id id,
>>> > +                    int incr)
>>> > +{
>>> > +}
>>>
>>> Is there a reason not to force id to always be a compile-time constant?
>>> The only use case added in patch 2 pass it as a constant.
>>> This way the id is checked at build time, the penalty with debugfs is
>>> just an atomic_add() and the penalty without debugfs is none.
>>>
>>> I think this is largely different from e.g. CONFIG_SCHEDSTATS and may
>>> not deserve a separate kernel config: just handle the no-debugfs case,
>>> which is mostly implemented already by not building
>>> drivers/gpu/drm/xe/xe_gt_debugfs.c, with the remaining part being only
>>> the dummy implementations in the header.
>>>
>>>
>>> Lucas De Marchi
>>>
>>> > +
>>> > +#endif
>>> > +#endif
>>> > diff --git a/drivers/gpu/drm/xe/xe_gt_types.h 
>>> b/drivers/gpu/drm/xe/xe_gt_types.h
>>> > index 631928258d71..4955612fb01d 100644
>>> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
>>> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
>>> > @@ -10,6 +10,7 @@
>>> > #include "xe_gt_idle_types.h"
>>> > #include "xe_gt_sriov_pf_types.h"
>>> > #include "xe_gt_sriov_vf_types.h"
>>> > +#include "xe_gt_stats.h"
>>> > #include "xe_hw_engine_types.h"
>>> > #include "xe_hw_fence_types.h"
>>> > #include "xe_oa.h"
>>> > @@ -133,6 +134,14 @@ struct xe_gt {
>>> >         u8 has_indirect_ring_state:1;
>>> >     } info;
>>> >
>>> > +#if IS_ENABLED(CONFIG_DRM_XE_STATS)
>>> > +    /** @stats: GT stats */
>>> > +    struct {
>>> > +        /** @stats.counters: counters for various GT stats */
>>> > +        atomic_t counters[__XE_GT_STATS_NUM_IDS];
>>> > +    } stats;
>>> > +#endif
>>> > +
>>> >     /**
>>> >      * @mmio: mmio info for GT.  All GTs within a tile share the same
>>> >      * register space, but have their own copy of GSI registers at a
>>> > --
>>> > 2.42.0
>>> >
