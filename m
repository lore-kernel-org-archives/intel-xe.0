Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB8E77188
	for <intel-xe@archiver.kernel.org>; Mon,  6 Jan 2025 14:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF2C10E1F4;
	Mon,  6 Jan 2025 14:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hH6bqv9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A48B10E1F4
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Jan 2025 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736172449; x=1767708449;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWMYOhe3PE/MdXPqDIWnjKn/15oMwWYE1o5wRxPo5w8=;
 b=hH6bqv9liqLlRTtDKF+GNKuCu7aR9p3fbS2SLcF9Kb6JsC5rnSAQZ4t7
 rvUOF8tX0B9ZSn+IqFM1Ng9qdY7H36k3o+FRCqqWWExxCcIW6A9TWDmLX
 S8O1KUWi+pqP01EQm6RU1XocxT0Qe8ZiwHoi6HUnaP9s5xZbXOlA53sUq
 zf6ixDh4iTcd9MAgCOx005TkcflzwhxA5ZLIDyx1AXKYcAmpsWPMI1EJR
 1+Onj3VZEpEqU08o1/I2BUj4h7zFaQxlJvv9WZLkFPSzrQDnztkDyjulO
 KxrGb6lYRu/970z0Q62d39Ic4Vs9r00BYxepN84p0RUAPBDJ0jVo1l1Y+ A==;
X-CSE-ConnectionGUID: S8SC6EQbRkGa8QxtBTJOOg==
X-CSE-MsgGUID: CHQyrz7rSEynZNS3KpX6EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="23921629"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="23921629"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 06:07:29 -0800
X-CSE-ConnectionGUID: ZQUtyqNvTDOrL5aTdVuanA==
X-CSE-MsgGUID: wn5O+0PzQwm0aMfGSuWCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103315088"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 06:07:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 06:07:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 06:07:28 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 06:07:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tf3fZfL66PMf1guF3SZ+wQNKHpKGXb8lPV9CYvINCoNPG8+ZOgJTRSqOx2IuFf4273CbVdF1S09qZiR2QOb/XPc5EQWVT3VkYAMyKR2cNEBK1cy3Xhn+QdpZh6Favi5h6ywP78CKdnKbOlHsjGWkzeEfmzb6rwze8SaJ+/wUnAV/ryex4uAiz9Y7/VPp7IIaj8Xa8tD1wZNcqEAALE0FP7YJZjTBniP1sZglBd9zc6Wof5AFVXNlxwMymb/4iS3b3EAjOnd3w0rCEAwLaYxPNdDwaNWhbRIZeMeCCbEZU/38NaKegV0Im6i2mPVtw4L60K4QSto7wqAcAM+iB0O/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WARKO+GiJtckqrTRjl5OQPPJm1/6eOZzNVdf0UADrwE=;
 b=u53fuyvdn68edGfF2iiUKkJK1o6qAmGdp8JdFEgOkFh0U2J7Ti+uSayvYQiq5eQkO2X6nx8DgLSzuMrgGngSf/twG6UfM97KdFJ9JmVRCKM2sk0Gk35NHlFP/pEdlIKksitvG53fwUvEY5gmUxlDoXiGsK8PC3bSOZeXRpVIHkv7fP8vQWofAK8I5Z8jocKm7fNta9lkisY2XK60EkVfild33tpJutvEZ0WBjR70kQGyocZG3clIcRn4ryFZ8/gnuzPlAOENjfYb0GeEPFI7y4gjf7Ye/PnGgQZlgZzfkKKpWgps7UzFzLiyfvnL6kXos8bPvTUq/57oNfRI3xhSGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 14:06:41 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%3]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 14:06:41 +0000
Message-ID: <f685a1d7-38f5-4cf5-8688-ce441816b221@intel.com>
Date: Mon, 6 Jan 2025 19:36:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] drm/xe/pmu: Add PMU support for engine busyness
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <vinay.belgaumkar@intel.com>,
 <aravind.iddamsetty@intel.com>, <john.c.harrison@intel.com>,
 <ashutosh.dixit@intel.com>, <soham.purkait@intel.com>
References: <20241121063904.3033754-1-riana.tauro@intel.com>
 <20241121063904.3033754-9-riana.tauro@intel.com>
 <4k3j4q3sakdke5fd3l25rrntjtdjxcm6447xg66czx6whofjbb@jel5xjc7kf77>
 <5165cae4-729e-4b78-84d6-fbbbb3470fb9@intel.com>
 <erhe5xquod7e7mlr5nnnaqtlzxsvgytrnxw3xczydibvqcxxtt@v2ta2k3tzip4>
 <517cea2a-96ae-4f78-9761-ec3f553516dd@intel.com>
 <d3d24cd9-c54b-43bd-a9d9-d7682b4fe10e@intel.com>
 <Z2Rp7q09O3knfGqS@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z2Rp7q09O3knfGqS@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB5866:EE_
X-MS-Office365-Filtering-Correlation-Id: 63471623-3feb-48ed-df6e-08dd2e5b57b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWhkUmFoNFQwNVIvNytIUjFSak5wK1FjQ0VRYmVXWHZrMGlsRVNkNWRNaVBZ?=
 =?utf-8?B?bnhGSGN2ME1ybThEaTRPbU1PSnFBT1YyRDhQMEhDRHdMaFpYM1cwSndPK3Vq?=
 =?utf-8?B?dzJKQ0pVeWZGa3IyTUtnN3RERElFZy9oazA0N2pweHR4N0RJWFN2TjEyY0du?=
 =?utf-8?B?eXYwNHFOZW5KQUlPczNWT1p0dFA1QnRTWDZKcGxWNks4eU9HWkwrV01TZXVw?=
 =?utf-8?B?bDVRWDdDWFg1V2VpTjRCNUszSytnbVAwK3JFM2hDSGs0N0cvcHJtZUV6c0c2?=
 =?utf-8?B?ZFg2UGY1cUlWc2pkdjlWM2lOWlZ1ZnlaYWJPMVR5bk9mSDU3R2FxR3NUSDBm?=
 =?utf-8?B?dWwvcDZFR0RwT1ptdkhTY0xlY0xpa2Fnb1N6bmRsdzZaTHdueXBHYnhtaTNx?=
 =?utf-8?B?eXhZWnlKZ1F5T0xsbWZLRm9CMCsyaVZQbmdPR3NUdThFdWNrT2t3UDFBK1FO?=
 =?utf-8?B?YUZybC9HTmcybTZnZ3VOdmhwYXBmMnRkVEZNWFlqbnBzWGhrOUZrbnhFSFE0?=
 =?utf-8?B?bDFqZ25vdW10bDVBUlljbzlMekxGc2lQa045WEI5d2RmU3ZIc0dFM1M4STdE?=
 =?utf-8?B?YUIyTW51Rzk3YlBwUFlYRk42SWxOSjNBVXh2ejBEWCtxN3VaUjUyVXRHc2Vk?=
 =?utf-8?B?SWJISkpYN0hScmtSQ2IvOHlnVkE0RElYKzJSdDQ1NDV1WHNUelFFZFBxdUxP?=
 =?utf-8?B?TVdrem0rL25TQlp3YTBlbUxSRmZSN3hWditJKzdhNW4zUlE3VFNrVFlzM0kx?=
 =?utf-8?B?b0RFdWNQWmVWdnBLMFVMUlZVSnIxUzUrQW9uTFF1eHdFNHAzZUIyWVdWR1VZ?=
 =?utf-8?B?V1o3U3BLNVJzcUNBSEpDbitXVVFUdUZVZ2tPUjA4VllVSjJLeFl1V2ticVlI?=
 =?utf-8?B?czMwOHhoL1RhYU1WbHpSd3dQZ2p3SE9qQWdwVVNQcWNQK2hlVWwrSzFoQk9M?=
 =?utf-8?B?aVRXSElwcnFyY0dWMW50YTV0SnA1Y2VhSXAwRVdRMkhtUUN1OFFrRzdtN0NK?=
 =?utf-8?B?K0diN3F0eHZSbmxLdlZsSk9GVU85RFhpM0FSUG9IR0hBbk1IOE1ZYWtEYU15?=
 =?utf-8?B?UWxveDE0RVh6TVh0dW9oUDhqZlVOcDNzWWxUZ3M2a1h5VDdab2NHVW1CUnBE?=
 =?utf-8?B?NGl0WVBkVVdoWGUxVDdydGRFOGJUNGFkZGtaRFdXc3E2Wjk2bWVoZ3RFWEdL?=
 =?utf-8?B?RXVIbXM1anRZSzM2RG0yVGtIMUhCU25UYjhpSWc4ZzZ1ZGRQV0trRmlwT1pa?=
 =?utf-8?B?K1hDQzNqM2I3UEh6OVcrenZpSklHblNrcHNlWmVQV282NTJqbWVtNEsyQmFG?=
 =?utf-8?B?VFc5U01iNmVrQStVU1Qxem52MVFWNVJvMmlabno4VCsrWVF2Q3YycFRDY3pW?=
 =?utf-8?B?b3ppeUZrU0lGU1U0VEJvcWp5dXZIall1OHlXeTg2emRFZnhPbG1VSkpSYlk2?=
 =?utf-8?B?NVNWZ1prc0NFeVBaQUs3RDVNNkxJcXhYblNZdXgrR1BlY0tKUjFxdnhGRE1H?=
 =?utf-8?B?V2JjcFhmdWhwamJhYmltNFhIRGcyS1pxMW5JcnVVUjRZMXoxN3VBOUxSUkZh?=
 =?utf-8?B?TDF4WVRrdlUvc2cydWttVXMrcWVsY0Q2NE0xbVkwSEhqd1p2eFkyY2ZhV29F?=
 =?utf-8?B?QnowdzUxUXV2Njl4MEdpTHpyamNVVDlUS3RDYmRmTWRHczNrU3BiRzJpcUtZ?=
 =?utf-8?B?MUVsVytia2t5a2IzQlQ2eW5BWjBiRHowdGhWN1lNWXZZeGZrVFFicDU5c3NW?=
 =?utf-8?Q?pvvxgddHhKMCBQgfch8wB81XysqyJ1jWAjrHjXA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ajZaSnZWcmRYZEhlR3FpRmVadXlLYWZPQktCRHZUS2t1U0JyekQ0OWZjS09p?=
 =?utf-8?B?QTQ2amd0dCtJZ28zWHRBSUpublp2LzFsMW5acUF3WnNwMTBBV1N2V3RmazBP?=
 =?utf-8?B?SDh6RkN2VE1BZXN6ZzhYeXFjS040TEV5THlDUzlOSStMYXRQODFHTXNNVFpw?=
 =?utf-8?B?dStDbVNqMlJFcTJxQWFUQVB1RkVYbFRHRUtERkpqRlVONTBFQTB5cTlCWWJn?=
 =?utf-8?B?SG9rOWhqaFllcXBtK05NK2RTRkI5OVM3aVBpOE9ScnBWWEJncFU4eUM1Mitw?=
 =?utf-8?B?ZG14dlZRSWtndU1mckFkbEtkZ2xFMDZWZUNkQnF0MjRGcWZzTnY5T0Q4VzJ6?=
 =?utf-8?B?N0ZYQmsxY0RZS3hBOW1WT3lZVEhGR1JyOGtReGdGek8wZ0tuNlR6Zk1CZVR6?=
 =?utf-8?B?QVlSUUtBR2swS2JvY3FocEVsdVd2TGJTOWlPU0RqYWM0cm5zR1FUM2hDMXVU?=
 =?utf-8?B?N0l5RzQrZFk4MDJHOURhUVdwN0N5M2RGUUJkU08wdDJrSDlnZExTYW5Ldmw0?=
 =?utf-8?B?U2kxbVQrejZhbGN4Zlp3c25DL1lyOWJQanMyUU1IOURkdTE2bEsrSUFlUm94?=
 =?utf-8?B?U2l4bUczSmFGcEVISEhXUjBOYjFPYm50SjMxdVc1TzFpYnBLVkFHZTNsL0o2?=
 =?utf-8?B?NVdvZE1kZjM4M2U4ZDFkOGlSd2Z4SGNYa3pSZmdLUXFVc01yMkk1dWF1WGdo?=
 =?utf-8?B?dHREWm4wTTBRWDBnaVhFNm11OHI0MVNTNzVDZHpXY1JEY0RpaU4ybzV0V1d5?=
 =?utf-8?B?aGFvbFM0d2xod01ydlZjSVUrcjFqU2lXd1N2alVQV2pCT2lzSVZDMTBwWGpw?=
 =?utf-8?B?WVdiSWhxbXUySVNOMm56RmVqSnRBUzNORlhLRmxQa3FhUklta1VTQmRxQTA4?=
 =?utf-8?B?UStZSlVwRCt5dXEvdFROU2JQbzZ2Vy9vOFBybzlmbC91Q0pmSHdKUmduMTNO?=
 =?utf-8?B?bGJrQjNRL0ttbyt1VW1yMmxBT0ppdHUyWFAzVzZQSjlaWnpSWkk1eXVNUUdm?=
 =?utf-8?B?alVRS0Z5RmlidncxNHhkUHdWeWtUYmM3RGQ3b0lWcEpvaCszQ3FhYVowNWIz?=
 =?utf-8?B?OHR4ajMvMjZhV2Jwa3lIN2VJams2ckxPV3JCc1ArUXVvWk9iSHBIWVBCOFZa?=
 =?utf-8?B?YS85N1drcWlGTmRKaUNNTXRCbThBZWZzb09rTFJpcXRSanhBZFI1OVp0Z3A5?=
 =?utf-8?B?OUNVWE1xcElRVW00TGNhcjVDNklUckowbXcvTHQxU0poSjBwNjdCbS80ZVZh?=
 =?utf-8?B?c2FmN1ZQVk14VzF1QVc4dUUrZGpESHY1d2JBaVdMenhoejRtSklCc2J5clBY?=
 =?utf-8?B?cVpmUjV5K1JuUjVTalpxdFRYMXZRSUplYTZEOGZCRHoyL21INVZQOGRDem4x?=
 =?utf-8?B?VFdXUDdQcWZ5ZTdNQ1FqZWpvdVFac0VWcGRWMzNYbmpaU0F0aTBjV2c2bFlU?=
 =?utf-8?B?TmdjWjhuUFJaTnljVS9CRU5tVlRia3V4R0pKaldBWWJzYjJWSlFtRWdJQUxu?=
 =?utf-8?B?Yk1oRDQyNnNuOUdQcXhhcGZ6ZmV6dmxidGg1bDlQNjFYTmgwZWFOTHMzQ3gz?=
 =?utf-8?B?bXQwNllMSEc2eURZZFBkS0o3QTc5Wi9sYW4ya2g0TDFTbzFGbzBCZVZLeDNs?=
 =?utf-8?B?R3NXMm5IRXppMnVVQUY0bjRVamE2M0I1TzBnNFFPNm9MYTAwQVdzY3N2Uisx?=
 =?utf-8?B?V3plTVdwQm5Kb1dveWoxMVZOTjVTWUdoQVI2ZlljVGVEem5obkxaMFo4UmVD?=
 =?utf-8?B?UWR0RSsyT2NDMTJkOURzU1NvS0xIUE5JcFlvbXF6NzNmS2NqYTZhUGpsZ091?=
 =?utf-8?B?OTNIWlArbmNhWDN4dXRkNFQvQnZkSFFucmx2aVV3dkVnR01MejRtUktmKzhQ?=
 =?utf-8?B?dGs5dDdUNzJGUVZGZGVzYUdkb1R1MkU4TE5UWVgzNm1FU1VoY0lkdnVPODJR?=
 =?utf-8?B?N0EzVFRramw0U3A4YWNuYXpJK0htZ1ljOEkrYjVWZDhMQ01nZzdBSEc2TWFi?=
 =?utf-8?B?OU9MWWhxQ0xlMlprcUc2TUpDeTB1Zk1EZUhGOHRNS2JnTGQvczYxZ2Fha3cz?=
 =?utf-8?B?S25lVllrNUthdVJUMStIOHVMb3YrK1QwaGFHSUJPUVlGVHdDSDJib3pNTXF2?=
 =?utf-8?Q?L23CPkqexuyjtXtDKeVo0z5gx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63471623-3feb-48ed-df6e-08dd2e5b57b7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 14:06:40.9367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbdsdg6rzq9PwnmkPlQJynW4nPegHs5Bhae4gE5IG4zNWWidYvyrbmET40zs7MBpL9PbyAAE9ywkmpAqR1wzHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5866
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

Hi Umesh

On 12/20/2024 12:16 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 19, 2024 at 11:17:16AM +0530, Riana Tauro wrote:
>>
>>
>> On 12/18/2024 8:21 PM, Riana Tauro wrote:
>>>
>>>
>>> On 12/18/2024 7:43 PM, Lucas De Marchi wrote:
>>>> On Wed, Dec 18, 2024 at 10:42:53AM +0530, Riana Tauro wrote:
>>>>> Hi Lucas
>>>>>
>>>>> On 12/13/2024 11:28 AM, Lucas De Marchi wrote:
>>>>>> On Thu, Nov 21, 2024 at 12:09:04PM +0530, Riana Tauro wrote:
>>>>>>> PMU provides two counters (<engine>-busy-ticks-gt<n>,
>>>>>>> <engine>-total-ticks-gt<n>) to calculate engine busyness. When 
>>>>>>> querying
>>>>>>> engine busyness, user must group these 2 counters using the 
>>>>>>> perf_event
>>>>>>> group mechanism to ensure both counters are sampled together.
>>>>>>>
>>>>>>> To list engine busyness counters use the following
>>>>>>>
>>>>>>> ./perf list
>>>>>>>  xe_0000_03_00.0/bcs0-busy-ticks-gt0/               [Kernel PMU 
>>>>>>> event]
>>>>>>
>>>>>> this will need a rebase on latest versions of the pmu patches as we
>>>>>> moved to have gt as a param rather than mangling the event name.
>>>>>
>>>>> In case of multiple gts, there might be different engines for each gt
>>>>> So should we display a common name and unsupported in case the 
>>>>> engine does not belong to the gt?
>>>>>
>>>>> sudo ./perf stat -e xe_0000_00_02.0/vcs0-busy-ticks,gt_id=0/ -I 1000
>>>>
>>>> why is engine not a param, like gt?
>> Wouldn't it be better to have engine name in the event name? Otherwise 
>> anyone using perf tool needs to find the engine class to name mapping
>>
>> @Umesh any inputs here?
> 
> sorry, I am not clear on how even gt_id is being passed here. How does 
> the gt_id fit into the struct perf_event_attr {} that we pass as the 
> event configuration? Are we using the config1/config2 fields to pass 
> these additional params?
> 
The formats(ie bits) are read from the format directory

  	    engine_class    - config:12-19
             engine_instance - config:20-27
             gt_id           - config:60-63

Then the config would be formed like this. Taking the start bit of each 
format.

config = read_pmu_config(fd, "engine-active-ticks") | (eci->gt_id << 
gt_id) | eci->engine_class << engine_class | eci->engine_instance << 
engine_instance;

Here gt_id would be 60, engine_class 12 and so on.


> fwiu, whether we pass engine as a parameter or use the name in the 
> event, we would still need to validate if the engine belongs to that gt.
That would be checked in pmu_init. It will return non-supported if 
engineis not found

Sent v3 with engine_class as parameter
https://patchwork.freedesktop.org/series/143138/

Thanks,
Riana Tauro
> 
> Thanks,
> Umesh
> 
>>> are you suggesting to have both engine and instance too as parameters?
>>> Something like this?
>>>
>>> xe_0000_00_02.0/busy-ticks,engine_class=1,engine_instance=0,gt_id=0/
>>>
>>>
>>>>
>>>> Lucas De Marchi
>>>
>>

