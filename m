Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98077CCD199
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 16:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5556410EA51;
	Thu, 16 Oct 2025 16:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCOPADaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2529610EA51
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 16:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760632889; x=1792168889;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ZpmBkB2uVfKTdaPb802xqhkhvtEZ5Y3RMXq37e5V4wA=;
 b=QCOPADaUGaOY+4L2j04ZbBn5DqJw8+M6RrsMEnUJkH//mSuzoAOyoZ5R
 /zso1WeKpfGKIx4uIavwueKUppWZYgNvBLkPSjRhAtbkFs9DDv6lFdBju
 f3F11awyffYYA6bOH4KQ8WDreuPs8WzHQCBoyuuke7QT0sNy8bAmJZsq/
 wEYgO6guDeequpb36aMYyYhdX5B7Jni7rUPjyrlwxJdGcjP54bGC5IKpn
 hOpjXqmhAZSJ2xDHoC2Prv2Tv9FC0IFjXDHpmIwICUWwbRExAEFpcX8Ps
 E3h2P22bfNf32sM8WPltQSdauqZKAvojGL4b2s86wVwUaUE9tI6tmKA/4 A==;
X-CSE-ConnectionGUID: iUp7Be72SGmyJWIef08Zqw==
X-CSE-MsgGUID: E8fXl8x1TTir/VKQflAiEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62870279"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="62870279"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:41:29 -0700
X-CSE-ConnectionGUID: 4rHsUHm1QRizYA3GdzjS9w==
X-CSE-MsgGUID: /Igj2NSASQi1Yf5S4oDhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186897072"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:41:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:41:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 09:41:28 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 09:41:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLWt65GGtyX2eqSeVJxWXMRZ4iArX2l6/G9WWF7VJGkrRIBhw6AIePn0S+lQgYlBAS8tYkwtj9xATnnItYZBAMjkW+tNoRyRavwfAGjGyXRObnC8WGvNqZIzxPFIrNo/wPmb1214gJTXmaGrfD7ngk12Q4GUwqq/UFwr22bwJAxTGGgDfpychiSb7n1VDZZ2epzBhg2Xn76n05bzGeXrvAyQyrn1O2VIjnDIT0o4aCp4cLNNGGucnx+VrCVevzEs0p/6/Ivasi6/erNtduN7HzVG4TX7ncMoltv3BAZ+1+caBdrxpkFTOqvobq1PC7kvrRfO2v6+S5EKyTO/aCFmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmDf4BzwVdLFxsabuYglg8plpmymDgYgz+cg7y1sM/4=;
 b=Cy5oJrsY8uK4DQkrCPlSWi//QxBsPH1tu0i4kCzBVEx9SX1w3DXjftkJ13Dhmw3zoCJ4F1L9rBO+vUS7qZ3jqJ/fKsWWKmwmwiFxM+sp2BEec+wg74pCZJXSsF/y668gwifSuAc2vqnsS3OPXQcj7g7Xg0Q/QXGyHVnlI9Avxtok3ipJVrDZc47KEzm1by527/DaCM+Mjy44Qqg0yFI92jSYSxYtTxT50w24JpLAFY7nUhsFPXycGJNCYiOjzdHQVnWjhnw0Rd+UY8EaDKjlbqP5XCCRDsYgH6a5cOr76yk5NeIZHrrgyO8xAt2BOKStwkoTKDoPFTdB7J7lmGseLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA3PR11MB8074.namprd11.prod.outlook.com (2603:10b6:806:302::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 16:41:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 16:41:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251015-xe3p-v2-11-b9189b3056a2@intel.com>
References: <20251015-xe3p-v2-0-b9189b3056a2@intel.com>
 <20251015-xe3p-v2-11-b9189b3056a2@intel.com>
Subject: Re: [PATCH v2 11/22] drm/xe/nvl: Define NVL-S platform
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Oct 2025 13:41:20 -0300
Message-ID: <176063288098.2362.1249324139559028585@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA3PR11MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a892c2-76e4-4997-5df2-08de0cd2d885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3FGdVhsaUNRWXkxeXZyM013UzFTbzN4UHNjOXpUVWhLWGMrV1dIbkpOZmI3?=
 =?utf-8?B?Q25RQzZKUkFFOGd0NDJUaVFNLzkrOEhpdVNkVWhYU21EaklJeXBJZjZJSENZ?=
 =?utf-8?B?UWJ5UWJlYzNTVHRiVHhHRnJkTURWc1FxODBHT2xpMTVvY2hIK0VHVzBxNjVW?=
 =?utf-8?B?SzRyUTBjbDZEMTV5MVJxbTlFZmVEaGp0TG9EcVZIZjhkYWRBOW1MQ29ybzF3?=
 =?utf-8?B?ZWpVMjhjTjdXQXlDOUJzcFNLVVhKT2VXOHF1UU9SNEJScXdGbFFhZTNuWmdu?=
 =?utf-8?B?Mk9ud0NENDlWem96Ym1TajhaTXUzRS9ocEF1N0M3ZlRWSG0zWmJnT3ZMckdz?=
 =?utf-8?B?MHlVcEY1ZHNSbVNYc0E4OExvbTRaNDQvTG9hU3g3MlRRVllhdTQzMDJPTExE?=
 =?utf-8?B?bTdBMTczWW96VUZ0MTRLcDdDY0x0ZktZWjc3V0x0bklNaHQzV3VCOWRDQlRU?=
 =?utf-8?B?UVNSdHpub2luajdUWG83WmtoRThobTZwbXBPWkdhNkJMbThKblRTVkxMbUVr?=
 =?utf-8?B?R2Y2S3I2UEVaZGJWckozbVRESnpCNnFlemFvdERFbk1WMDJCdWVzR0tKdDVv?=
 =?utf-8?B?aEJlNmpTL2NOQWdZaEpkdWIvbk50c3FBV3VZQmVINXBLVTlyK1lmVXhab3NU?=
 =?utf-8?B?UmdUTnlOQ1dmRnhIM3cwcXRmWThwbGMxdFVBL0xBZzVZZE9McWp0R3B2NnBp?=
 =?utf-8?B?MFFDelAweW5NMVU1dWxFMmsrSmFqQmtkai8wcFNRN0ZPNDdBNUxWeEZ5eEFr?=
 =?utf-8?B?eWRuUk10WFNycjBBZUxoV0hQUUlYOUhZb2FsNyt2V3NzUXVUbWsxZ3ZPTi9D?=
 =?utf-8?B?Tjg2akU1T2txVk1ha3ZRLzdmUHFlNFAzM2h4MW1rM3kxK3pDZTlBcm9EL0hL?=
 =?utf-8?B?TDlpVFNQdjRKV0V4TVIzU2pxMkRZY0V2SEJrSzlNOSs5NEF6SkxLNklVUm9U?=
 =?utf-8?B?SWFBcDY0dEw2S2xJMDRwN1lHZ0hWUzJHa04wS25sdFdMRit5ZXc0a1R5d2hk?=
 =?utf-8?B?VjBOSE4rQzQzcHovTnBJeXFsUmJyc0ZuZ2pJTC9xOG9kYzhFYWptdG9mNEdX?=
 =?utf-8?B?d1NsWEJFbEdIMi9qUlpZQmRyUTR1c213YW9pTFNwNmZOVFNBMEQrQityMlVm?=
 =?utf-8?B?eGRjcW9KWGkySW1aWncySE9sbE50OGhBeEJtZWg0czVRSzhQZG5GSEw1OFZr?=
 =?utf-8?B?WEgwcW45amlYaDBKMDRxbkpWL25RUkk0TmlZalVaakpXQ1hseEszakdKUGlo?=
 =?utf-8?B?TkU0bktIOUcvT1Y0NStYYVFkWVVsa3JrQ3Z4Sm9jL3E5Qk1iYlZQVUNGMllY?=
 =?utf-8?B?QzJXdGU0ZmZoM0M3dEJtdWRQdG1UUWppUXl1bzc2T1NBY1Rmbzg0WVBleC8z?=
 =?utf-8?B?dHc2UFpSejFQVFdITHRTbXByTG9Pbi9MdCtUL2llWGFJNit3OVMzSU5vZFE1?=
 =?utf-8?B?aVpkd3J2UTQyb001Y2lvRjd1QlA3Sk9BSFduODVWenZJejJhOUovejk0VUVL?=
 =?utf-8?B?b1lub1NNSlZzbHA0Q2c4Q0FPaG9GNTluZGw2Z3VDWGtReFVOcGVqb1dZbVBh?=
 =?utf-8?B?Tnd2VEJVaStLYVlvNmgvd1JtMklHR2xER2t5UC9SeTF1VGxqWGhnbXNxdUp1?=
 =?utf-8?B?cmxwMkYrS0tueTVYcnAwWW9RUU9rRkdJU1BRSTVDbk5aS214UjJ6cEZaY2cz?=
 =?utf-8?B?OG0xZlFmd0lmZG9xa3phcTZzRi9ITC92QnpoZVZCbzllOHRvUFFsR3VQaDJu?=
 =?utf-8?B?L3R2d3pNNzZyS2NDbzNBUFVLZG9WOTNER1JWSmdIU0RQZU9RS1ZkVnI3bzNK?=
 =?utf-8?B?M2UwQ3k4RjRNaTdLRWR4Nmx3azRwS3RiUXdDSHdvd01hRjU2QitIYlNoYVd0?=
 =?utf-8?B?Z0U0K1dHR0ZSS05iMjhiSmN2aE9YMW9RdEZsbDdqT1Z5KzlhRkloa2MxYXlE?=
 =?utf-8?B?ZHdiL0psK1RHUFA3bWxYQ3V6eTVaUXdDN3RHMkg4Q1U0Y2gvNXFPTWQxVGht?=
 =?utf-8?B?dG9WdWNjVUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUl0endNRVVwczYreVNEV1BxZ2tXQi9tYU5xNnh2N05Zc0ppa2dCbi9nclF2?=
 =?utf-8?B?MDBoRmtBLzRYQ3RQNkxqUUc4Uitsckg4QVBmVUN3TTA5RVNFbkJQZU8rU0Fi?=
 =?utf-8?B?RGttQWFmQ3RpZnFWZEh2akU1VW5JeVhqZUg3WkFKOXVxbklZMFp4NktqSjM3?=
 =?utf-8?B?R2NJMXFGbkxyNnZCcmxDLzRLTFppYXJqN2N5WlNIbzFHZlMvK1ZsbDdxeUUv?=
 =?utf-8?B?N0FQRUNaZHc2NElPWjd1bC9sdkpYSnlHZEE1L3A0OE9OWmtYZzcveURnNEJz?=
 =?utf-8?B?dE5WMXhvTG5kYWxxa0ZiMitwVURhdTVBekMzVWRvYWEyRHN0R2VnYlBFcU4x?=
 =?utf-8?B?RWtIWGJwSUUydDFqV0ZDNjFpNG9Iaitpc0JQQTR4SFVSV2FoOEtmcG8yU3d3?=
 =?utf-8?B?R2Y2eGNIS0M3YkRhS1FIZkhiN1R3L3Z0Qmc2cjNsTC9IRE4xSzM3SGZpbHVZ?=
 =?utf-8?B?OXF5Y1RXS0ZFRkk0SHd6d2NGSTZmZ2NWUTJSRkxkdGVHd2tDbDZRU2pXRFJv?=
 =?utf-8?B?OXdXLzR1YmwyUFh1S1pOY0tHQlhSSEJ5TmZiYTdUbnRUNlp5TDU0d1VicHNB?=
 =?utf-8?B?cTg2Z01odUpWSWFQVHV5TFZFYXlEdkltUkh2UEF6amcwb2hHU1lZWU1uR2tr?=
 =?utf-8?B?d013c00vSHdQdzFnN0ZOYkxZUHB1U0Z6MHgwa2JIdmZMR3JWUHpndlV3Tk5u?=
 =?utf-8?B?ei9hWUVUaGdWbko0ZGlhY2ZpckdKMzBuZU8wTDZ0L01jUktxMTUxU05WKzlK?=
 =?utf-8?B?U0oxVVBraTZKNk9lcFpYTXJRNDNraFFwTEFUSGVZSjd4a0FPUlIvd25VdTA3?=
 =?utf-8?B?WlhLZHV2dSt5TzlHeFV2RVlQaVBwTlFWZFRkL0lTOFUxcDNtYzBoOERaNkYy?=
 =?utf-8?B?TDJvKzFVQjQ4WEpsU0ZTUDUzQnNQQXArZGlzdzc4Rk9aTU1vN0lRNUdqRklY?=
 =?utf-8?B?UkhENFI4SEVVUDA5Wmg0RnNxYk4xZGRsWmlUUG12ZHZvaHM4Uk1tVkY0R3Vr?=
 =?utf-8?B?Y2g1eThtRnlReTFjanM3TTlwVlFvMkFMSnJqcFlxNVM1cllEbngyYUJ5MjRz?=
 =?utf-8?B?eXZBMzM4V1AyZEprRXd5cWlGWE9wT0ZLRDdrWU1VT0sveC9PblNoZ2oxQ3U4?=
 =?utf-8?B?NHdCRFhVMmZIcmk4SmNTckMwNDdHN1VZYWN1M3drVzM0aFY2Nzd5ZXlWRllE?=
 =?utf-8?B?WHFtRmRmYm05SHB6R3JzbmlRODVRdzlIVm5IQVFMeDdVQktmeWpTR09ibWRl?=
 =?utf-8?B?aHNveG96RGRQb3NvSWNhTXVsbE1SVTZhNGZDbEF5WitJcTIzb1ZmSDdtNGw2?=
 =?utf-8?B?QTB6UUFoWVdIdUJNWW5kOHVhY0JOR1ZOUE1od1JiTjlCU0xHUDNZL3NMdHBO?=
 =?utf-8?B?NittUkp1cUhZZDc4dURuYm9TRWprTURzLzVJVjYxbjFaOE5aK3JwSDBmb01H?=
 =?utf-8?B?VDRTZmI5ZzdzYWs5eGl2eHkvMHYrZE5Cc0Vaai9jMHJDN255cmQ5eFRpRWtF?=
 =?utf-8?B?ZGFxVW5OWGZsZWN0RXNwQ09yVDBIL0NzbEh4TGFoQU1TQkczT0FjQmxHemNs?=
 =?utf-8?B?UGJtUWpPQjlGNnB3K2k0d3E5TmJGYjZ2Q2h5bWI0cDcvNXRidHErUzlyQ05i?=
 =?utf-8?B?L0psNU1VdWxuUHdRcUR1ajZNQk1LY1Q1aEo5MUh6cmNHeHAxcG9qUkVWRFpp?=
 =?utf-8?B?eVFhbkZQZzVpZ1ZXZys4cVRLa1B1SE5URG8zOUZ1V3pWdFpEbFlqeUdjbGoy?=
 =?utf-8?B?aVgrMFY3QWFOWjg2SVpDNzFCMDFISEFRdmpPNm1NWmlVTWJOZDB2bUFDdlh0?=
 =?utf-8?B?a1JvYjVBdEU0YnFwTStEOTVNU29PQjZsY29kbnVVMVBacjZpSldNbWpybzMz?=
 =?utf-8?B?K0FVUy9icWhtS3h0ak5helNHUFdTNXE0V29nMkJkaEFxc0tzZDdqSHdWWDhm?=
 =?utf-8?B?dlJFMzYrQm95cVBmZDE4Zkk4QTc1WWx1a0lzZHZkWmFicytFN1dwaHk4WmZI?=
 =?utf-8?B?VFc3Wkp3WHI1WERQNEh5NHZhT3ltMXJHbi9qWkNKSGlVOHhLSUw5NllaYm5Q?=
 =?utf-8?B?ckJlcjBreis5Zk94U0lUUE5nNVora3hkZHhVTytDZUI1dmd6R0MrTndtWkp0?=
 =?utf-8?B?M1UxN2F0bXVKb0Q4aDBqeDI2dkdicmg0TVZ4TXQwOFlWUitvV01yalVXWEcr?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a892c2-76e4-4997-5df2-08de0cd2d885
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 16:41:25.0951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5xz9ngLRSEBasMEYv2VxFj6PBs0euWbkljiTRivbUHLNgWuqAwWlgPODimprVr/O+8qTN5crqfFCIZqmOtViA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8074
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

Quoting Lucas De Marchi (2025-10-15 19:06:26-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>Provide the basic platform definitions and PCI IDs for NVL-S.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> drivers/gpu/drm/xe/xe_pci.c            | 9 +++++++++
> drivers/gpu/drm/xe/xe_platform_types.h | 1 +
> include/drm/intel/pciids.h             | 9 +++++++++
> 3 files changed, 19 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index b72f71b0f52c9..d836fd8e187a6 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -377,6 +377,14 @@ static const struct xe_device_desc ptl_desc =3D {
>         .vm_max_level =3D 4,
> };
>=20
>+static const struct xe_device_desc nvls_desc =3D {
>+        PLATFORM(NOVALAKE_S),
>+        .dma_mask_size =3D 46,
>+        .has_display =3D true,
>+        .max_gt_per_tile =3D 2,
>+        .require_force_probe =3D true,

With the recent merge of [1], we now need to define some extra
attributes here.  I believe we need to define: va_bits, vm_max_level,
has_flat_ccs.

[1] https://lore.kernel.org/all/20251013200944.2499947-25-matthew.d.roper@i=
ntel.com/T/

--
Gustavo Sousa

>+};
>+
> #undef PLATFORM
> __diag_pop();
>=20
>@@ -405,6 +413,7 @@ static const struct pci_device_id pciidlist[] =3D {
>         INTEL_BMG_IDS(INTEL_VGA_DEVICE, &bmg_desc),
>         INTEL_PTL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>         INTEL_WCL_IDS(INTEL_VGA_DEVICE, &ptl_desc),
>+        INTEL_NVLS_IDS(INTEL_VGA_DEVICE, &nvls_desc),
>         { }
> };
> MODULE_DEVICE_TABLE(pci, pciidlist);
>diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/x=
e_platform_types.h
>index 3e332214c7bb4..78286285c2495 100644
>--- a/drivers/gpu/drm/xe/xe_platform_types.h
>+++ b/drivers/gpu/drm/xe/xe_platform_types.h
>@@ -24,6 +24,7 @@ enum xe_platform {
>         XE_LUNARLAKE,
>         XE_BATTLEMAGE,
>         XE_PANTHERLAKE,
>+        XE_NOVALAKE_S,
> };
>=20
> enum xe_subplatform {
>diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
>index 452c1de606ff2..13c592e1a28c7 100644
>--- a/include/drm/intel/pciids.h
>+++ b/include/drm/intel/pciids.h
>@@ -887,4 +887,13 @@
>         MACRO__(0xFD80, ## __VA_ARGS__), \
>         MACRO__(0xFD81, ## __VA_ARGS__)
>=20
>+/* NVL-S */
>+#define INTEL_NVLS_IDS(MACRO__, ...) \
>+        MACRO__(0xD740, ## __VA_ARGS__), \
>+        MACRO__(0xD741, ## __VA_ARGS__), \
>+        MACRO__(0xD742, ## __VA_ARGS__), \
>+        MACRO__(0xD743, ## __VA_ARGS__), \
>+        MACRO__(0xD744, ## __VA_ARGS__), \
>+        MACRO__(0xD745, ## __VA_ARGS__)
>+
> #endif /* __PCIIDS_H__ */
>
>--=20
>2.51.0
>
