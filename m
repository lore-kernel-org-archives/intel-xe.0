Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A82E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CDEA10E243;
	Fri,  3 Jan 2025 08:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHAbmhAh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F25810E243
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Jan 2025 08:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735891263; x=1767427263;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7DrwM3GR89BNLwy3pATI/ufZbC0lr/NNI5n6xh2YNbk=;
 b=mHAbmhAhZqSqC6igAz5nDl3S4CvfjwfkNc/0Bu2FKJjCMkJrchv+AsTw
 wTUqhyNjBfigxisufq6kMnVU+Q3/VEcCMn4YjMN5UomcDVtcLFLMecioi
 /hOargndv9Gnl2fTphDFU39aiBD7ibJSwTkxa4KR9FuHZjOOaybv+5dog
 o1eFPkC3p3QjFINo7itUxWqwp9hz/oYE8JtilOo0vIEBGWqXrNq9knd0d
 lmvXhE1Ulrh3/6gJ7Snm6rmbT1A9qUoit4ZaBsSmOCwN9absUdQYBfL6i
 n6d6z4aFo0dMRnk0ZmA7pR8tEe0O8QhZXFcPi0ldd8B1p7piupx4t7otn g==;
X-CSE-ConnectionGUID: cQN0y0MqRSmK4dmLj/Djsg==
X-CSE-MsgGUID: InBZc2lnT42ukezWyTqM9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36300401"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36300401"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 00:01:03 -0800
X-CSE-ConnectionGUID: rS7wRi/WQJ+/yLYPO6M/9g==
X-CSE-MsgGUID: igueKhk+Szq1Kjm/MXLiqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101584105"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2025 00:01:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 00:01:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 00:01:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 00:01:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZJ6HPs9ycnYjP8Y4Jj17pIK7CEBQC7/2+pUqoSvCkzZFNkugxz4v5W+JAxM7LmYlpkM/aVoTcRDLVftUmLYlGStEgbpfIc5kzbJ+UBk0goddfAHOL5dk8d2vYpgI2sHykrZY3yqOeZrNhqapGCxAVjxTqRYSnCexidDrHj4kM1ajfISVIOq+XT46dvc6zFGJ+a1RRPyacVtQi5mwoiy2DPPd2WAWp3/9JJCyn31qMc5ULUs7PJorPKKCn7MYoxODwn1a8QKL6xGr4wSk3awURI4hCX854mOKD25R7uIX0zFgo59p+1vPOeVYqAXQElOhOzxdW2PsazoDqYoYx2bYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tilXpDaJN+609aFARfBVUn0ggtnJtyp8QfNYfXSPMi4=;
 b=xA7t2hFWfQYJD+qub+szNk2BGjS7vihgAV+wXllEN9/9dJwstYzk95mSA22FbM7nNkFQhPHCK9KcP8lM6+ADGGd4Z1ImJYxoLo4/32Jr5fQ/LtLXRPSUfiNlGnr8VT7+jdid3ATbpUVTMNC/o3Boqp5nW4vgXQMnSFQq4CyBALebwsp+iUe3l/3H9MrMl8Nrhe4kqPc3u4FygK56xiInN26BOr5M2ZhwHt1kZjWIRPCQM/d4ZN4+jI+fT8dO6r7cRn7ng6+pcbRfU5S/bffuMSi/377h1SRnn0eleReIOaG0yWXCiMzpLpqm606724bWqSflpN2mLGeZSvCiug/iyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 08:00:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8314.012; Fri, 3 Jan 2025
 08:00:28 +0000
Message-ID: <580c3111-e10f-4b1a-b352-aa6c0c9a8655@intel.com>
Date: Fri, 3 Jan 2025 13:30:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/4] drm/xe/pmu: Enable PMU interface
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>
References: <20241220205927.441082-1-vinay.belgaumkar@intel.com>
 <20241220205927.441082-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241220205927.441082-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0124.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: 1103914c-431b-4bd8-5e05-08dd2bccaff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUd1aFBqNjBSa3ZyVUN3dXlpekFTSVFobk1ZU3ZBNlpLS2VZYzM3Y092TjZo?=
 =?utf-8?B?L2ExRXlRYzlkWmZEWEQ0WnNTbWpDSGlJT1AwVEo2VzdtWWlrV29yNVZEOG1a?=
 =?utf-8?B?cjlwMG5rRVFkUDJ0RmVwK3NDTDVvZnZCY0dWenhVMFNaejBHOHRhSEtURDIr?=
 =?utf-8?B?MVhwakNvQy96UWFUZkw0ODAxQzNpSHA1VHR6a1lMMEFjcDlJdmROeXFBR1Yx?=
 =?utf-8?B?OElJcEYxWEVCdWRkMGJZTDhleE1JSXEzQncvNm5aQUxNVWRBZnRlcUM2eEF3?=
 =?utf-8?B?RnJhQytzdkZmT2hxeTlBR3lYMUc4K0ZYSkFyMDNCaC9EeWVZUE1DdWJXOHBF?=
 =?utf-8?B?OSt5Rjh6VjNobVpLa2szakQ0N2dWRDJXem9xbUZvVk1JeHhWVExRcUorZkc1?=
 =?utf-8?B?Z1V3UnFySEhPQWQrWC9POEgzM04reTdJek5tYkExRWJZT3d2dUJKUUxmSno4?=
 =?utf-8?B?SVhIckllOThiaUUwQmIrRDFRN1pGWHBScmRtcmp3VlFwVHlzVlRCNGZTT3hx?=
 =?utf-8?B?RWcxb2kyTHYwbFJkb1VuQllscjlRcUZXNWxtOEJkQW5RUEtaT3lTdjJ6Zm5w?=
 =?utf-8?B?Rng0Y0gremRPa2NkNE1sano3MjFCRGJKTEZsNUEyT0IxNEhLTytpbmVJdTlp?=
 =?utf-8?B?dXNhdnJMQUZXU1JQNUNOOVFueXh6dkNTU2J3ZHYrQW94TVZ4RXA0cjM0blVR?=
 =?utf-8?B?KzM0aHpZWWt6VzNid3B4MTVLOE14WXhRUkYyQUY3ckFjU3RBdmpYSUp1R1Z3?=
 =?utf-8?B?M1hvWEJVa2R2V1ZzWkk1a2xGbFpGM2EwK2RwZHJzNmlDMzlFYzlkYXdISEhn?=
 =?utf-8?B?UUdMOUE2N1JxWS9VNlBxVDhTT2hGalFKdXY0UjZGUVRMNDIwN0lmR2FLeDRL?=
 =?utf-8?B?clJDeTUzZ2lEMzlLRk9haTJUdWhjRk5LUkltZ1R6QlZPdGZGMkJPcEQvbEZu?=
 =?utf-8?B?Y0k3ZG92TzRzREJUTmJ2KzNuV3UxRS9WNVJpTFJjRTBZVmpXSk9XZ1Zhcy95?=
 =?utf-8?B?eTFRU0NNU3Q0Z1g3SDQyOUJ5dDd1eHZhdXVZYU10dm1OY0IyakNZZHlqZWRk?=
 =?utf-8?B?ZDRuNitteTlSYTZ5RGkwNXdwb1JVd2tiU0xEcGx3UTJ3NGtUQnlieG5NNnp2?=
 =?utf-8?B?MW14RjdWTnNTZlJMZUk2aUkxRG9ZNmdtRkxQdVc5cFNiMVdkKzN2dmx2YWVn?=
 =?utf-8?B?TVg4c2xqV25acnNQR0pIcFRFUEJOOU9zbmJGTE5NK2oxWlFJd2t1c1R6cGp0?=
 =?utf-8?B?MHQ4cFdXa2tyR3NZMlhsNllMdk4xN1NlVVIrUUwzZTdmTXhrdGc3M2duV1FT?=
 =?utf-8?B?c2lLMEFocUhCL3YxazhiUUFlaW5lYm1nNXZ6MitwTjZRYUpGV3k4cVliSUZy?=
 =?utf-8?B?VFVVdm1GUVRldE0ranVSQ0hVZmR6RE5CT09VTHdTYmNqT1ZjYVVRRExqZWhO?=
 =?utf-8?B?d0Yxa0FLblFLd0NLSk9yc0srWjRTT3d2aC9uMXBxcVNrM2owZXNySGVXdCtu?=
 =?utf-8?B?UE5wbGxnV1J1WmJEQWZsSElkZmo5eE9zTm1wNldRZDhtSE1tS2c0WkZGa21C?=
 =?utf-8?B?ZmQrTkRJbGNIWHgyVHllbkZyVVFvUmdPZkVMWE5jQzZRR1Z1OHJLMUJuZVRN?=
 =?utf-8?B?alhyNFNhdXBKOUJkclVxYjFNUEtFbXA3azJ6cnpBR0lqUVVCNkZTOGQvRk1t?=
 =?utf-8?B?YXRiZzFxUkUzMHd2aEhlUUdxOVVtdm5HODh3dE54ZlVxdnB4M0tCNFVENThj?=
 =?utf-8?B?clFIaUFlZll6NWhqeldsLzZzWWxGSUZGd1RabG5hcWRNd2FaQnl6QzlZbnZK?=
 =?utf-8?B?MGdUUU5DL21wMGpDOWt1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEc2RTdkUlVNNVcrZG0xNzYxeDZqbWlSTTUyblhVSllKMm1QUUhVeE5nckpW?=
 =?utf-8?B?cmJVeUExdXdscVZVU0l6TlNFZlh3THNub3J4UzVLK2ZleDdNRU01eFZML3Qx?=
 =?utf-8?B?K2Z2b1VhVjR5a01wNW1jUFk4OGIzUXowU1F6M25DMVZCL3RRQkE3VWwwZGxv?=
 =?utf-8?B?L2gvcmFsRDJGVXFNN0RNYmZMclJBNTNFQ1lQMjJOQlZYSExuaHEyVU1sdFFn?=
 =?utf-8?B?YTk5M3FJUXptT1FCRHZiWnJGMjk0VythZzkwRFBmOUV4VFgvZDJqVTIzeFla?=
 =?utf-8?B?SHN5ejlHMVB4Rzlmd0NRQWswV1BORisvRlVBZ2tXQmVOdmJkTFpFU1Q4NEhZ?=
 =?utf-8?B?U0ZlZWJBUHRkRFVTZ1ZHTmNGQU8rQ2pxNDcycGw2WXB6ZUptdGxZdFNxN2VH?=
 =?utf-8?B?d0VIalpZejNvSzRTb1R5c2pUMlJXaGNJYVRabGdYcVNLQnFmVllnVnJ3dkN6?=
 =?utf-8?B?VEdmYk45OU5lUXNZYjVpTmNoSDB4ejk3YmNUTDJ3V2JLNkZrdEVGeFhyaWZm?=
 =?utf-8?B?K3lBOGxMTzdVTlYydEV0NUVTSEdjNG1KTm53TGlnampUSktockhWc2NSbGsw?=
 =?utf-8?B?WFlSSy9wOVYyaWowb3h0S3RGWU1oOVphb0g1Mk1OcTBYdTdjNWd5aTZtSzR0?=
 =?utf-8?B?aFVKK1hxU2NjNDFGRlBuRTNMblBkbzBLWXVGNFVvbmlIdWZpOEF3ZkJYS0h1?=
 =?utf-8?B?REhtaTZGcHZwemh4ZVNsSmZhcXZ4aVA4WlFhUHFIeUVkYzlFeS8vUFo0TThu?=
 =?utf-8?B?SXdsMlBtQmVhODRIeEozQ2h5aFVLUjlTbjI1bDNpQnQ1dkhyVjYrSXY4TFlq?=
 =?utf-8?B?Y3dmQjNTWWhVdjAyQkp4Y1k0Zi9uakZ5Q243Zk4wOVRnR1kzdmpZOXkxaGRR?=
 =?utf-8?B?QlBWSytaL1l3WkRwcmlwT1M5NWxGRXNkVVV6dERsRnczRERzTlF4L2p0NlRk?=
 =?utf-8?B?WkhSVjhaNVVVNzlPeFhkeVdKWlJWYm51UmxyZ1JsSnY1eVpGbU9OMmxmOWNt?=
 =?utf-8?B?c0Z4TzJGT1lqMGdCWlNFZitwMG1IMGJhRFJKRnN4aUpRTDhUS3NEZzI2eVV2?=
 =?utf-8?B?Z3hTZ2VBeUh5Q3JaeWgvUmx1VHRlYlpjaFhMZEU1dHJucEhZR0FFMGhsTFNy?=
 =?utf-8?B?Mk96ZXRqSk1lVTk4MHUwUFBaRUJPQU1ublZrMGxERjFpd1dLci9Db2NueWl3?=
 =?utf-8?B?UmdBaEFaRkZwaUJuOHJ5VGpQL09HaHVIc3dERkxMWU5hbDRBUXYyREhoYlBN?=
 =?utf-8?B?RWxKRmU5cmE1SnFoTngzemx5TmVMeGVnVVplbUpRTmRWSi9qTDlJWS9XTlNH?=
 =?utf-8?B?VzdMdWZRNDBZanYzM29mNHpneklkU01UUGVXWk1XcDg3cjF2NVFGVWRTTmNP?=
 =?utf-8?B?NW1YdnZ6S3FsenBKWUU2MUxOMDBSMFFRaEdhZmJOU1pPUDlhMnFjMFlhcFFm?=
 =?utf-8?B?Q3ZBUDdGM0N3RW5mS3Q4em5LVWhEaTZDVVBZS1Z2dWIvZlVVWXExWXg1RnRO?=
 =?utf-8?B?ZmptZ040QVg0bXJVdDVSbDZoRU5KdURFUXJnaTJGUFNqcDF6VEJWT3hmMG1P?=
 =?utf-8?B?VlRVL1IzeVdEVHpzV3pIUVdnY3ptRHhXSXFudHBwNUtjc2ZaRU1nVTlKUUZ0?=
 =?utf-8?B?UnVhQUY5Z3NhTXhjbndQRFFEalU5cWM2YmZEREpnVGhVcVJEWjQvdEQxQXhZ?=
 =?utf-8?B?TlRCejdXbzVNU3FxWlllL3orQlNwcFpxbFlobHZqVUdaci9pY1pmclVxNDkx?=
 =?utf-8?B?T1FjbDE0V1lTc1dCVUxmREVaeitXOFJQb1NRaFMyMlliMlRFeG9mZ1pEcUxp?=
 =?utf-8?B?djc4UUpNalNnS0FFbjdySzdnUTh4RmlUZHM2bFFkNlIrcmVVcWVyZ29QMlRo?=
 =?utf-8?B?TndUNVd6dGlXRG1ncThlQkVBOU9zbUZSYi8yRjNYZllaOHpVUjFOaEZuZFdX?=
 =?utf-8?B?azVuNENhQUVSOE51Q1FXT3ZuWGZ5em1OeW9LR0VNMWt2RzI1VmQvd1paN0Z1?=
 =?utf-8?B?SXdaQlJ0U0VLZGdwRHBJcExIczIxSFBEOWsvZ013dzI0YURNTStSUUh0bTVN?=
 =?utf-8?B?V3FucmlxNTRFV3RFcTBkbEc1QjZzRGRISHZpNmRQQW84UUhYb3JqNFJKU1l6?=
 =?utf-8?Q?9qhKyp7I7Ijs6WFoihdooJ+Ws?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1103914c-431b-4bd8-5e05-08dd2bccaff8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:00:28.6212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJExULFy5o7L57MwQ7FxhM6/sgahodHNFXbG6imzXTVgCMGVG51kHJB8/SOhl3smzx3lMAqA6/x59LN0/q4Wrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7005
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

Hi Vinay

On 12/21/2024 2:29 AM, Vinay Belgaumkar wrote:
> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> 
> Basic PMU enabling patch. Setup the basic framework
> for adding events/timers. This patch was previously
> reviewed here -
> https://patchwork.freedesktop.org/series/119504/
> 
> The pmu base implementation is still from the
> i915 driver.
> 
> v2: Review comments(Rodrigo) and do not init pmu for VFs
> as they don't have access to freq and c6 residency anyways.
> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani) and
> move drm uapi definitions (Lucas)
> v4: Adapt Lucas's recent PMU fixes for i915
> v5: Fix some kernel doc issues
> v6: Address comments from Lucas.
> v7: Define events per device and use xe_gt_id to choose GT (Lucas)
> v8: Use config field bits for gt_id as well. Use raw_spinlock_t
> to avoid deadlocks with perf subsystem (Lucas)
> v9: Fix checkpatch warning
> 
> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v4
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Co-developed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |   2 +
>   drivers/gpu/drm/xe/xe_device.c       |   3 +
>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>   drivers/gpu/drm/xe/xe_pmu.c          | 621 +++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>   drivers/gpu/drm/xe/xe_pmu_types.h    |  72 ++++
>   7 files changed, 733 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 5c97ad6ed738..9f3d24a5d611 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -301,6 +301,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>   		i915-display/intel_pipe_crc.o
>   endif
>   
> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> +
>   obj-$(CONFIG_DRM_XE) += xe.o
>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>   
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index bf36e4fb4679..ca557c22c979 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -49,6 +49,7 @@
>   #include "xe_pat.h"
>   #include "xe_pcode.h"
>   #include "xe_pm.h"
> +#include "xe_pmu.h"
>   #include "xe_query.h"
>   #include "xe_sriov.h"
>   #include "xe_tile.h"
> @@ -760,6 +761,8 @@ int xe_device_probe(struct xe_device *xe)
>   
>   	xe_oa_register(xe);
>   
> +	xe_pmu_register(&xe->pmu);
> +
>   	xe_debugfs_register(xe);
>   
>   	xe_hwmon_register(xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8a7b15972413..bd1e72d318f7 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -18,6 +18,7 @@
>   #include "xe_memirq_types.h"
>   #include "xe_oa_types.h"
>   #include "xe_platform_types.h"
> +#include "xe_pmu_types.h"
>   #include "xe_pt_types.h"
>   #include "xe_sriov_types.h"
>   #include "xe_step_types.h"
> @@ -525,6 +526,9 @@ struct xe_device {
>   		int mode;
>   	} wedged;
>   
> +	/** @pmu: performance monitoring unit */
> +	struct xe_pmu pmu;
> +
>   #ifdef TEST_VM_OPS_ERROR
>   	/**
>   	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index 0f2c20e9204a..d3a9d4bc9bee 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -14,6 +14,7 @@
>   #include "xe_hw_fence.h"
>   #include "xe_pci.h"
>   #include "xe_pm.h"
> +#include "xe_pmu.h"
>   #include "xe_observation.h"
>   #include "xe_sched_job.h"
>   
> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>   		.init = xe_sched_job_module_init,
>   		.exit = xe_sched_job_module_exit,
>   	},
> +	{
> +		.init = xe_pmu_init,
> +		.exit = xe_pmu_exit,
> +	},
>   	{
>   		.init = xe_register_pci_driver,
>   		.exit = xe_unregister_pci_driver,
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> new file mode 100644
> index 000000000000..5601e7a2377e
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -0,0 +1,621 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#include <drm/drm_drv.h>
> +#include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> +
> +#include "regs/xe_gt_regs.h"
> +#include "xe_device.h"
> +#include "xe_force_wake.h"
> +#include "xe_gt_clock.h"
> +#include "xe_mmio.h"
> +#include "xe_macros.h"
> +#include "xe_pm.h"
> +#include "xe_pmu.h"
> +
> +/*
> + * CPU mask is defined/initialized at a module level. All devices
> + * inside this module share this mask.
> + */
> +static cpumask_t xe_pmu_cpumask;
> +static unsigned int xe_pmu_target_cpu = -1;
> +
> +/**
> + * DOC: Xe PMU (Performance Monitoring Unit)
> + *
> + * Expose events/counters like C6 residency and GT frequency to user land.
> + * Events will be per device, the GT can be selected with an extra config
> + * sub-field (bits 60-63).
> + *
> + * Perf tool can be used to list these counters from the command line.
> + *
> + * Example commands to list/record supported perf events-
> + *
> + * $ ls -ld /sys/bus/event_source/devices/xe_*
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> + * $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
> + *
> + * The format directory has info regarding the configs that can be used.
> + *
> + * The standard perf tool can be used to grep for a certain event as well-
> + * $ perf list | grep c6
> + *
> + * To list a specific event for a GT at regular intervals-
> + * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
> + *
> + */
> +
> +static unsigned int config_gt_id(const u64 config)
> +{
> +	return config >> __XE_PMU_GT_SHIFT;
> +}
> +
> +static u64 config_counter(const u64 config)
> +{
> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
> +}
> +
> +static void xe_pmu_event_destroy(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +
> +	drm_WARN_ON(&xe->drm, event->parent);
> +
> +	drm_dev_put(&xe->drm);
> +}
> +
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_MAX_GT_PER_TILE)
> +		return -ENOENT;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		return -ENOENT;
> +	}
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_event_init(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +	int ret;
> +	u64 event_config;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* unsupported modes and filters */
> +	if (event->attr.sample_period) /* no sampling */
> +		return -EINVAL;
> +
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	if (event->cpu < 0)
> +		return -EINVAL;
> +
> +	/* only allow running on one cpu at a time */
> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
> +		return -EINVAL;
> +
> +	event_config = event->attr.config;
> +	ret = config_status(xe, event_config);
> +	if (ret)
> +		return ret;
> +
> +	if (!event->parent) {
> +		drm_dev_get(&xe->drm);
> +		event->destroy = xe_pmu_event_destroy;
> +	}
> +
> +	return 0;
> +}
> +
> +static u64 __xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	const u64 config = event->attr.config;
> +	const u64 gt_id = config >> __XE_PMU_GT_SHIFT;
> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
> +	u64 val = 0;
> +
> +	switch (config_counter(config)) {
> +	default:
> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
> +	}
> +
> +	return val;
> +}
> +
> +static void xe_pmu_event_read(struct perf_event *event)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct hw_perf_event *hwc = &event->hw;
> +	struct xe_pmu *pmu = &xe->pmu;
> +	u64 prev, new;
> +
> +	if (!pmu->registered) {
> +		event->hw.state = PERF_HES_STOPPED;
> +		return;
> +	}
> +
> +	prev = local64_read(&hwc->prev_count);
> +	do {
> +		new = __xe_pmu_event_read(event);
> +	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
> +
> +	local64_add(new - prev, &event->count);
> +}
> +
> +static void xe_pmu_enable(struct perf_event *event)
> +{
> +	/*
> +	 * Store the current counter value so we can report the correct delta
> +	 * for all listeners. Even when the event was already enabled and has
> +	 * an existing non-zero value.
> +	 */
> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
> +}
> +
> +static void xe_pmu_event_start(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	xe_pmu_enable(event);
> +	event->hw.state = 0;
> +}
> +
> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		goto out;
> +
> +	if (flags & PERF_EF_UPDATE)
> +		xe_pmu_event_read(event);
> +
> +out:
> +	event->hw.state = PERF_HES_STOPPED;
> +}
> +
> +static int xe_pmu_event_add(struct perf_event *event, int flags)
> +{
> +	struct xe_device *xe =
> +		container_of(event->pmu, typeof(*xe), pmu.base);
> +	struct xe_pmu *pmu = &xe->pmu;
> +
> +	if (!pmu->registered)
> +		return -ENODEV;
> +
> +	if (flags & PERF_EF_START)
> +		xe_pmu_event_start(event, flags);
> +
> +	return 0;
> +}
> +
> +static void xe_pmu_event_del(struct perf_event *event, int flags)
> +{
> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
> +}
> +
> +static int xe_pmu_event_event_idx(struct perf_event *event)
> +{
> +	return 0;
> +}
> +
> +struct xe_str_attribute {
> +	struct device_attribute attr;
> +	const char *str;
> +};
> +
> +static ssize_t xe_pmu_format_show(struct device *dev,
> +				  struct device_attribute *attr, char *buf)
> +{
> +	struct xe_str_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_str_attribute, attr);
> +	return sprintf(buf, "%s\n", eattr->str);
> +}
> +
> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
> +	(&((struct xe_str_attribute[]) { \
> +		{ .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
> +		.str = _config, } \
> +	})[0].attr.attr)
> +
> +static struct attribute *xe_pmu_format_attrs[] = {
> +	XE_PMU_FORMAT_ATTR(event_id, "config:0-20"),
%s/event_id/event
Most of the other pmu implementations have named it event

Also are 0-11 bits enough for events?
I'll use the rest for engine related?
> +	XE_PMU_FORMAT_ATTR(gt_id, "config:60-63"),
> +	NULL,
> +};
> +
We can use PMU_FORMAT_ATTR here

PMU_FORMAT_ATTR(event,           "config:0-11" );
PMU_FORMAT_ATTR(gt_id,           "config:60-63");

Thanks,
Riana Tauro

> +static const struct attribute_group xe_pmu_format_attr_group = {
> +	.name = "format",
> +	.attrs = xe_pmu_format_attrs,
> +};
> +
> +struct xe_ext_attribute {
> +	struct device_attribute attr;
> +	unsigned long val;
> +};
> +
> +static ssize_t xe_pmu_event_show(struct device *dev,
> +				 struct device_attribute *attr, char *buf)
> +{
> +	struct xe_ext_attribute *eattr;
> +
> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
> +}
> +
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
> +}
> +
> +static DEVICE_ATTR_RO(cpumask);
> +
> +static struct attribute *xe_cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
> +	.attrs = xe_cpumask_attrs,
> +};
> +
> +#define __event(__counter, __name, __unit) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +	.unit = (__unit), \
> +}
> +
> +static struct xe_ext_attribute *
> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = xe_pmu_event_show;
> +	attr->val = config;
> +
> +	return ++attr;
> +}
> +
> +static struct perf_pmu_events_attr *
> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
> +	     const char *str)
> +{
> +	sysfs_attr_init(&attr->attr.attr);
> +	attr->attr.attr.name = name;
> +	attr->attr.attr.mode = 0444;
> +	attr->attr.show = perf_event_sysfs_show;
> +	attr->event_str = str;
> +
> +	return ++attr;
> +}
> +
> +static struct attribute **
> +create_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +		const char *unit;
> +	} events[] = {
> +	};
> +
> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
> +	struct attribute **attr = NULL, **attr_iter;
> +	unsigned int count = 0;
> +	unsigned int i;
> +
> +	/* Count how many counters we will be exposing. */
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +
> +		if (!config_status(xe, config))
> +			count++;
> +	}
> +
> +	/* Allocate attribute objects and table. */
> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
> +	if (!xe_attr)
> +		goto err_alloc;
> +
> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
> +	if (!pmu_attr)
> +		goto err_alloc;
> +
> +	/* Max one pointer of each attribute type plus a termination entry. */
> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		goto err_alloc;
> +
> +	xe_iter = xe_attr;
> +	pmu_iter = pmu_attr;
> +	attr_iter = attr;
> +
> +	for (i = 0; i < ARRAY_SIZE(events); i++) {
> +		u64 config = __XE_PMU_PM(events[i].counter);
> +		char *str;
> +
> +		if (config_status(xe, config))
> +			continue;
> +
> +		str = kasprintf(GFP_KERNEL, "%s",
> +				events[i].name);
> +		if (!str)
> +			goto err;
> +
> +		*attr_iter++ = &xe_iter->attr.attr;
> +		xe_iter = add_xe_attr(xe_iter, str, config);
> +
> +		if (events[i].unit) {
> +			str = kasprintf(GFP_KERNEL, "%s.unit",
> +					events[i].name);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &pmu_iter->attr.attr;
> +			pmu_iter = add_pmu_attr(pmu_iter, str,
> +						events[i].unit);
> +		}
> +	}
> +
> +	pmu->xe_attr = xe_attr;
> +	pmu->pmu_attr = pmu_attr;
> +
> +	return attr;
> +
> +err:
> +	for (attr_iter = attr; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +err_alloc:
> +	kfree(attr);
> +	kfree(xe_attr);
> +	kfree(pmu_attr);
> +
> +	return NULL;
> +}
> +
> +static void free_event_attributes(struct xe_pmu *pmu)
> +{
> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
> +
> +	for (; *attr_iter; attr_iter++)
> +		kfree((*attr_iter)->name);
> +
> +	kfree(pmu->events_attr_group.attrs);
> +	kfree(pmu->xe_attr);
> +	kfree(pmu->pmu_attr);
> +
> +	pmu->events_attr_group.attrs = NULL;
> +	pmu->xe_attr = NULL;
> +	pmu->pmu_attr = NULL;
> +}
> +
> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +
> +	/* Select the first online CPU as a designated reader. */
> +	if (cpumask_empty(&xe_pmu_cpumask))
> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
> +
> +	return 0;
> +}
> +
> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
> +	unsigned int target = xe_pmu_target_cpu;
> +
> +	/*
> +	 * Unregistering an instance generates a CPU offline event which we must
> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
> +	 */
> +	if (!pmu->registered)
> +		return 0;
> +
> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
> +
> +		/* Migrate events if there is a valid target */
> +		if (target < nr_cpu_ids) {
> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
> +			xe_pmu_target_cpu = target;
> +		}
> +	}
> +
> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
> +		pmu->cpuhp.cpu = target;
> +	}
> +
> +	return 0;
> +}
> +
> +static enum cpuhp_state cpuhp_state = CPUHP_INVALID;
> +
> +/**
> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
> + *
> + * Returns: 0 if successful, else error code
> + */
> +int xe_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/x86/intel/xe:online",
> +				      xe_pmu_cpu_online,
> +				      xe_pmu_cpu_offline);
> +	if (ret < 0)
> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
> +			  ret);
> +	else
> +		cpuhp_state = ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
> + */
> +void xe_pmu_exit(void)
> +{
> +	if (cpuhp_state != CPUHP_INVALID)
> +		cpuhp_remove_multi_state(cpuhp_state);
> +}
> +
> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	if (cpuhp_state == CPUHP_INVALID)
> +		return -EINVAL;
> +
> +	return cpuhp_state_add_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
> +{
> +	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
> +}
> +
> +/**
> + * xe_pmu_unregister() - Remove/cleanup PMU registration
> + * @arg: Ptr to pmu
> + */
> +void xe_pmu_unregister(void *arg)
> +{
> +	struct xe_pmu *pmu = arg;
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	if (!pmu->registered)
> +		return;
> +
> +	pmu->registered = false;
> +
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +
> +	perf_pmu_unregister(&pmu->base);
> +	kfree(pmu->base.attr_groups);
> +	kfree(pmu->name);
> +	free_event_attributes(pmu);
> +}
> +
> +/**
> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
> + * @pmu: the PMU object
> + *
> + */
> +void xe_pmu_register(struct xe_pmu *pmu)
> +{
> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
> +	const struct attribute_group *attr_groups[] = {
> +		&xe_pmu_format_attr_group,
> +		&pmu->events_attr_group,
> +		&xe_pmu_cpumask_attr_group,
> +		NULL
> +	};
> +
> +	int ret = -ENOMEM;
> +
> +	if (IS_SRIOV_VF(xe))
> +		return;
> +
> +	raw_spin_lock_init(&pmu->lock);
> +	pmu->cpuhp.cpu = -1;
> +
> +	pmu->name = kasprintf(GFP_KERNEL,
> +			      "xe_%s",
> +			      dev_name(xe->drm.dev));
> +	if (pmu->name) {
> +		/* tools/perf reserves colons as special. */
> +		strreplace((char *)pmu->name, ':', '_');
> +	}
> +
> +	if (!pmu->name)
> +		goto err;
> +
> +	pmu->events_attr_group.name = "events";
> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
> +	if (!pmu->events_attr_group.attrs)
> +		goto err_name;
> +
> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
> +					GFP_KERNEL);
> +	if (!pmu->base.attr_groups)
> +		goto err_attr;
> +
> +	pmu->base.module	= THIS_MODULE;
> +	pmu->base.task_ctx_nr	= perf_invalid_context;
> +	pmu->base.event_init	= xe_pmu_event_init;
> +	pmu->base.add		= xe_pmu_event_add;
> +	pmu->base.del		= xe_pmu_event_del;
> +	pmu->base.start		= xe_pmu_event_start;
> +	pmu->base.stop		= xe_pmu_event_stop;
> +	pmu->base.read		= xe_pmu_event_read;
> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
> +
> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
> +	if (ret)
> +		goto err_groups;
> +
> +	ret = xe_pmu_register_cpuhp_state(pmu);
> +	if (ret)
> +		goto err_unreg;
> +
> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
> +	if (ret)
> +		goto err_cpuhp;
> +
> +	pmu->registered = true;
> +
> +	return;
> +
> +err_cpuhp:
> +	xe_pmu_unregister_cpuhp_state(pmu);
> +err_unreg:
> +	perf_pmu_unregister(&pmu->base);
> +err_groups:
> +	kfree(pmu->base.attr_groups);
> +err_attr:
> +	free_event_attributes(pmu);
> +err_name:
> +	kfree(pmu->name);
> +err:
> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
> new file mode 100644
> index 000000000000..d07e5dfdfec0
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_H_
> +#define _XE_PMU_H_
> +
> +#include "xe_pmu_types.h"
> +
> +struct xe_gt;
> +
> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
> +int xe_pmu_init(void);
> +void xe_pmu_exit(void);
> +void xe_pmu_register(struct xe_pmu *pmu);
> +void xe_pmu_unregister(void *arg);
> +#else
> +static inline int xe_pmu_init(void) { return 0; }
> +static inline void xe_pmu_exit(void) {}
> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
> +static inline void xe_pmu_unregister(void *arg) {}
> +#endif
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
> new file mode 100644
> index 000000000000..2b3f8982023f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
> @@ -0,0 +1,72 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _XE_PMU_TYPES_H_
> +#define _XE_PMU_TYPES_H_
> +
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +
> +enum {
> +	__XE_NUM_PMU_SAMPLERS
> +};
> +
> +#define XE_PMU_MAX_GT 2
> +
> +/*
> + * Top bits of every counter are GT id.
> + */
> +#define __XE_PMU_GT_SHIFT (60)
> +
> +#define ___XE_PMU_PM(gt, x) \
> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
> +
> +#define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
> +
> +struct xe_pmu {
> +	/**
> +	 * @cpuhp: Struct used for CPU hotplug handling.
> +	 */
> +	struct {
> +		struct hlist_node node;
> +		unsigned int cpu;
> +	} cpuhp;
> +	/**
> +	 * @base: PMU base.
> +	 */
> +	struct pmu base;
> +	/**
> +	 * @registered: PMU is registered and not in the unregistering process.
> +	 */
> +	bool registered;
> +	/**
> +	 * @name: Name as registered with perf core.
> +	 */
> +	const char *name;
> +	/**
> +	 * @lock: Lock protecting enable mask and ref count handling.
> +	 */
> +	raw_spinlock_t lock;
> +	/**
> +	 * @sample: Current and previous (raw) counters.
> +	 *
> +	 * These counters are updated when the device is awake.
> +	 */
> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
> +	/**
> +	 * @events_attr_group: Device events attribute group.
> +	 */
> +	struct attribute_group events_attr_group;
> +	/**
> +	 * @xe_attr: Memory block holding device attributes.
> +	 */
> +	void *xe_attr;
> +	/**
> +	 * @pmu_attr: Memory block holding device attributes.
> +	 */
> +	void *pmu_attr;
> +};
> +
> +#endif

