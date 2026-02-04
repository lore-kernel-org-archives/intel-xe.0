Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C581EA794B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Feb 2026 23:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1565110E34E;
	Wed,  4 Feb 2026 23:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LMWJqSOP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657D810E34E
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Feb 2026 23:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770246324; x=1801782324;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QTB+NJpx7JsXP72TC5EHIhuvf8BiCxF+i0Wg1wZd3tI=;
 b=LMWJqSOPav+0N4FczyvXcW/8xjIoBOyS4beJ9UG6YAr66NrxCFUwo4po
 2XHLJF8OhlKA/XGdKpNUZ+HNiad4HzidAKni6cgdZZwQqcqeU//OkK55p
 J6YlA65Bx/0o9KB75tUBZgJ6dFuz0AdK1IHhvvc6x9OvKjnT+WusmKkq8
 8nfrZsGYIVO3m9tmm9iVED1jpXVHA0EqkYxPrTGvVc8l9iuWI7HdJU3LL
 YnDD3xmQDQVoYJjcPzU+sstKngYOy+imkYmHGPqyuMAlw8nQzyYrZDPT/
 lRPViaZ8CAYARj9gg30AX0NjuTv5mKgJX09QFqZHoSRVPWzGItUduByJT g==;
X-CSE-ConnectionGUID: Oa0uciF4RJKZI2jDxdmZwQ==
X-CSE-MsgGUID: SuFw8KzUTrOgAtack/HflA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71427514"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71427514"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 15:05:24 -0800
X-CSE-ConnectionGUID: qoY1aR4kQOKD6xx2Q0Ge7Q==
X-CSE-MsgGUID: itAC48I+RCCNdQZi/kI0Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214474066"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 15:05:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 15:05:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 4 Feb 2026 15:05:23 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 4 Feb 2026 15:05:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5qtVb6dkteMG5xJAaD2MoTUMCYnRWPNtfFCQXXx95BNgBt/Mug5P6c+3IIB6CTvj1dmcUU+Eq4PQktpiQzwxByvez3CaCNvpr00ysaMrEhbBXNHKZHnHy3yKtNZiHfR6A2NPVq2SVnlpGnDWHfSPE993zxjHxKi9yhEHWG5tDNN1CCKkXAcYEXx7VO/JNpPMa7ecETnG65g/wNI0WVXWSF2x3L51AE1ATMBv0af22iQjmUJVoT14vU0fKcLaFjyqHOy+QLNMMIfpbsfyyj55rGeWrk4HHZL/Doy0cbKQuPjeBV6/T0Xg5AksHvKiCHDl0ilH4titrdQn8UZ2Wjv/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AVNrbOQn9c1fnf1Oew+dUX2Z4YQzCQbcY55BvBUSoCM=;
 b=j+NIfXBZvfEgL/CTN+H+mEdgNPBflq9fXeShtrBs1PyqPy1bHJDZC3tHg6EqLVL3Qie2i2AwIeMUq17VJ3XG2649SrahC0QSUw00CiBqaLgj9EfCm2cAbMwG1VpjgTM9RPXdmkNah+oOKdGoA3rGf/gofpA83RLIY/kUaZXRlBTZ8Pni4rbLLyA0TvTbixGcHn375xzP6rcUksBTFkW2y/8396SZOFaIPcoYlhqrkygpLehv2GRvtOxtvaGAzMVoS7EW2U2dPl6zogTjR54CCp1V5fg1eNKtxBFsgyNSMGOnERzKw4SV3puMkK9EMDklJXVcqOKqgcJcWH+7XEHmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DM4PR11MB6430.namprd11.prod.outlook.com (2603:10b6:8:b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 23:05:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 23:05:10 +0000
Message-ID: <de7a555b-0bc0-4198-97db-bfcc53344621@intel.com>
Date: Thu, 5 Feb 2026 00:05:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/xe: Use FORCEWAKE_GT in xe_guc_pc_fini_hw()
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260204014234.2867763-1-vinay.belgaumkar@intel.com>
 <20260204014234.2867763-3-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260204014234.2867763-3-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU7PR01CA0006.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::6) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DM4PR11MB6430:EE_
X-MS-Office365-Filtering-Correlation-Id: f19ceead-5cf0-4f5a-673f-08de6441d870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkJMcU14dVNYeG9SNlR5c0lMSXVYclhjNS9aT0xsREFEWmJhK3hwMnhXdnl2?=
 =?utf-8?B?WFFZY09oTlRQT0l0WVhqbEl6KzdBdUJJMjFYS1Z2UDNpQ0RuNDE5eGRoRGVz?=
 =?utf-8?B?YzlsVVVCWnJVZkRSbjBkWmxKU0h0cTlNeXJUK0I3NCtYbWV6ZDlKczZoUXdP?=
 =?utf-8?B?K013SUY5QmIzWWE4Z0ZKdHFERHdsMnNUc0oxUVFySkIyZFhqUmY0SmlEOGZh?=
 =?utf-8?B?NnAxRXZPT2N6NmYvY2h5QmV2KysvMEQwWVg0Q0ZVbTl3TnVWWlYwZFZCK05D?=
 =?utf-8?B?aGxlayt3TDkwRGg4bnU1Y1owTm5EVkdCcGpjMnU2ZTZDYlNYOG1aOEJTWGh3?=
 =?utf-8?B?c08zTWJ4cTZrcXBpUi9ubEtWVlhKeEZscmQzUUdEY1JJb2FoaEFJbjlrUHNR?=
 =?utf-8?B?SE45MmNmd0VSVk9seUhjaTZJVStxTnk5OFQ3WTAvek5hWWZBalVuMENXWlBx?=
 =?utf-8?B?TGFyN29nK1JQR0VlOUZmbloxaGNqZU5VMHUrMFFaa3Jrbmk2bEtqQytIY2lF?=
 =?utf-8?B?d2hzYk5sS240dUx0dXBkMlFXUVlpdEx0S0MrODlGWkEram53SSs2WTRGQnJF?=
 =?utf-8?B?cFF0UmNmM3c4U29lZG02OHR2MjE0UkpwYWVYdDNkQmZOWHRBa29SaWFOS1No?=
 =?utf-8?B?ZHVTeVRJNFpob2E5VG93T3lOWVZ3NHBWdkRpWnJqd0RDenMrRDJrUURQSDR4?=
 =?utf-8?B?U3dtcFJ4c0pma1I0WUttMzZOdTRUUmE1Rnc4SHdLMG1nWGpVeGhzUldmTWFQ?=
 =?utf-8?B?YmVpZExSV05TODA5QnUycHRYWGVSNEZJZm9scEpFTWs3Qno4Y2RKVlcxcDZY?=
 =?utf-8?B?KzJ6d2ZYTjZ3Uis3TDFsbzNVSmg0T2orMXlNcUdSRFpLNUtVU2NLYU1LSEFz?=
 =?utf-8?B?OVVmbHlBOE12ZWJsMm56U3hiR05jSitlN0NXVVNJaHhCODFrY09NR1JwdWY0?=
 =?utf-8?B?UzRaN2VOSmRHejZDN2diWVVmb1B5ZUdSR1cra1NBV1g2T2VFb3gwQW42Kzk0?=
 =?utf-8?B?elEyMzJVTEdPODJSQWx2K0ZSL2taSTZ1VG1Cbi94MktlUkNvaCtYWnY0Ukox?=
 =?utf-8?B?K2FUdEN4am1nZkJRM2ZxMkw2K01xVE9BL0U3K1l2aGozSUdkOTVWbXpDeXNJ?=
 =?utf-8?B?ekVDa2w0allMcFNkOUg5OWJXSGNSbGQ4aGRRMG1YR3lkT1YxOTY4azRydjFj?=
 =?utf-8?B?aENZVWdKcEMzTzRsWDNFQWh4MnNHR20rQVlCSjlBTHRPSGxXUWVIbnB4UUEz?=
 =?utf-8?B?RGJzRzRqajJvL2NIRzFXcXI1Z0dwQmVLSldsTnlTSytOdGFjSWgwdFVHekpK?=
 =?utf-8?B?a3h0UEUxTjdRRjZLejI3U2ZSZGdjdFhsZUR6QU9tcm4xWitxd1Fkc0JMS0d4?=
 =?utf-8?B?c24rTUV3NmxGYXFUQ09UWDhPbDhiY215Y2ptajZXeHlLcXFLT3MyckRRNmth?=
 =?utf-8?B?bHpBeUIxOFg0bUxLb2VObDBGMy9hS2xMbGlhOThDL1NBeUxxVVk2Y0g2LzRx?=
 =?utf-8?B?WWhvU3BGaHp5WjI4M1MzTGJRSmlTbG9DSEFPbkl2OHpONVZRVy9CbWEzenZz?=
 =?utf-8?B?S3VVaWVuNzFrWm1hOU5YYTV4K1gzVXJnUi92WW9xU0N3eTUxd3BZNG1sbFB0?=
 =?utf-8?B?Y0k1K3R1QnpwVG9NMHJPZzdKNGJhUnhKRlQ3OW1JQ3YvTlh0MVFPMDBLa1hE?=
 =?utf-8?B?SjU3NS9lV2d1QzNhc0t5Rlo3RmlsWko4ZkhGaFhzRWJIVHcrZlh2RUQvZGdq?=
 =?utf-8?B?eHdLWndTYjM1SlFBWXVENTJSL2ZPZzlMbnp1MXpMV1BXeTlWTDV1T1UwTUU5?=
 =?utf-8?B?NHRKOFRoMUswTm12aWtKWDRSbUFzRmJYOGdrNTBxM3dNbmwyb0w2V2tpNGVG?=
 =?utf-8?B?LzNIeEM1cnY2WkcvZUFrNGZuZUcyTjNmZWxFR2pLMTI2MWhVd2hZMzU0UnAx?=
 =?utf-8?B?S1VxSnFmc1RtaExQUGxDaVNkL3c3eUhIbktCdzQwWnZHSHhoU0lQYlNWTmZm?=
 =?utf-8?B?VVFUR0FaUmR3blU5dmNLbVF4dGtJM1gwYU9tUzFyS0h6azVoaWJMeUF1QUFK?=
 =?utf-8?B?THZ1am9jVUtucWRrVmRwTDM3dm50YllKQ0pLb3JxT2J1dWkvOGdHRVM3K1F2?=
 =?utf-8?Q?CFeA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vi9mYy9GVmw5OWt2Y0JsVzIvUXlkRldFTTBOVUlNY3Qwdzh3SjFRWTZLYUNW?=
 =?utf-8?B?NTBDd2lYYkl3QjBYWW9QLzZTSGpGYUJMR252aURodXNtaFhSS2xXV0FsQm12?=
 =?utf-8?B?ejZVaGdPSHhidVBxWStEZFk3bXZWb0JET1F6ejkreEtOaUJ6aEtobVJvVlNu?=
 =?utf-8?B?bkNlZGNIRFYwMmkwRFdKUlAxZk5UKzcvVVMrdjUzVUFFWDhlbm1LZFdBUUxi?=
 =?utf-8?B?bFh0ZTNRaXNNU1Q0UVBOV3NadGNjRlA3RmZtdlBSeUw1NU9BODBGYlkzWFhq?=
 =?utf-8?B?N2dIeHVMQkR0U1BjOWh6RnVtYklLaEtPV1QzMjYyR2gzMVo1ZVBQSHRoMk9E?=
 =?utf-8?B?RVF1WmU4WmU0blRYTCtvNUZudGljMVFyK2tFaEVDV0pKR1ArblN4bCtYN0xt?=
 =?utf-8?B?VVlGQ3ZxTXg4YXR1VjQxRzFBaER1MitkaU9tWkpOZWViS1p0SUVFcWhNanpo?=
 =?utf-8?B?WXBkaXBPMEVRbERlSndvNU5kcitKWjZRUk1yRmFWMFBvUnBsZVhTNEt3RXJi?=
 =?utf-8?B?MytReVpFWkJwdWRieUtjcE5QRmxack9ubG5ZS3htd1FOZzcvYzA1ZDFTeEV3?=
 =?utf-8?B?RkV4QTZSem5Lci9VS3RIUWNBSW1WTFlqNGl1K2UwNlE1Z1RUY21HRTY3ZHFD?=
 =?utf-8?B?Wmx3MnJ5K2hycWlwcUREbUdpNnh4dmIzNEFsRUY0QUVEV0puWnBpUk95bVJu?=
 =?utf-8?B?dDAzdXVrUndkdFpzc0QzNEFoc0JFNWZlK3YxcVdiSmNtbmJNOVVXZVZyeS9M?=
 =?utf-8?B?Q2FKSm5DdGpPZ0N2V0E0Tm9DbDJBOGl2ZGc2VWR5S3kxeFI2MkMyMjdaR3o5?=
 =?utf-8?B?SHhOdlVtOHloYkdyNGpCa1dCTGFhZTBRZm14OE5INTdWOVZ4cWtDN3BIaUdB?=
 =?utf-8?B?dk1NelUzQ2s4RmJEdHJ0OTkrTWcwQTVIczJTb3VjbHJzdWE3dEJVc0JDdUpz?=
 =?utf-8?B?ZW91a1dFb0NMYW45a3MzN0ZjUklJK09XU2JIYW43V1RKRUZQSWJSRWpBM1Nj?=
 =?utf-8?B?YVRCV3RiQ3k5NThZaDByenNiQXpRdjgvcElWMExnVlEyOTV0dFZ4N3V1a0N6?=
 =?utf-8?B?UERzbzZHTE1USXZPWjhESzd5bzZPOGxVb3d5Tm1WRTcxeU1hR1c4VEx6WWRv?=
 =?utf-8?B?dXVObHBYUjN0SWhCMmw5cGpkSU9ndVRaZ29MNEJXeDNBd0FjUnpMNWUwc2U5?=
 =?utf-8?B?V05yK0x4MVBtakx4Q3Y1YVZKM1daQXJNOGkwaTdxK1pSNTUxLy95R3FqVkdU?=
 =?utf-8?B?L0ZWcE1MN1NScEhEMTdLRTBBa0ZScTZCVG41RVRXZ21tbWx4QXMxd3U5M1Nu?=
 =?utf-8?B?dUxpNVBHRThsbEJBY1ZZYmZHMDRIeDNmWVd5ME1kNlE3Y01tQklQODNYTjdJ?=
 =?utf-8?B?L1FXT3l5VCt3czdOZFdzYk9lUUxDbzFUdFRwZzgrSm5QMU9JbExteG0wTW4w?=
 =?utf-8?B?OHpSQ0NWdm4yczQ5MWlKbUkxTzVqemltRElnK3J3c1BRWnRaRmdKTFhlaUZs?=
 =?utf-8?B?SFI0ZFY4Y1JybnhEeTlTQ2l2TEhsWHZremdESDk3R3dMMUFKVWVXQTFVeHc0?=
 =?utf-8?B?dnZuaUNjcld6Zkh2V3ltZnkvNklpd2QrQXdzMmpxMEhraFA0MVMzYmptSXkx?=
 =?utf-8?B?VlNTdXM3eXFrcFkxTldDNFoySDZ1dkhvV3JkeUUrbnJaQXVhcHJKYWF1M1FE?=
 =?utf-8?B?TDlLSmpZbHM4a1Z4ek9iT2phNktDOG4xYVJaOXJ0Tm9sRTVQVlpGdFlRb0Z6?=
 =?utf-8?B?YVd2QzdRcHdhTFhyVFVuVStlTHZJaW1Bcmk1NTluRk9RSDB5VGV2TERZY1ll?=
 =?utf-8?B?WFRYb0JpWGIrTGRyN1pmcUZIQnFnSGZoWGt3eWlDTG9hNFUxVDB5d29tdmJI?=
 =?utf-8?B?WHBhSFR4aEJpdDBIbFpWOStvNjdTUVVXWFFhVmhjWlVQQlN2TUlQUWZXaVVW?=
 =?utf-8?B?QnhCV09HSmFPNjlpS2dFWHM2OThLWXdTYmZvenNFN0Z1ZjVIbS9HdVdSSStE?=
 =?utf-8?B?Z3Y2Y0ZvdFZyMitpdXczSVU1ZDFpMk41RnJDekMrZEwwc0NvWHVCMFV2L3c1?=
 =?utf-8?B?NXV4aEViV1QxSDBYYmZsYksyd0lOTGZ6M1RZUWhxYXIwdEFXOUErZG9jS3Zj?=
 =?utf-8?B?OFMxbVVGaWoyR2pJMHlpemV2MkpVSWZjb0lGNWE5YlZPZVQ5MHNxcGdyM1hM?=
 =?utf-8?B?OFNES3psVW41WlNHQTJ5UHM0THU4TmpIem1WajFNeXROM1lPSGFwaE45NUcy?=
 =?utf-8?B?bEJiM2xGUGNBc0REVDFPV1lIbHM5cXFYRkEwZmVyMkR1Uk4wb1FWejluS2pT?=
 =?utf-8?B?Q1hBVTI5WWVIb1IwcnJNSERERXlXRjYxWWp3L2t5RWJmeXlacGlBbHM1SS9F?=
 =?utf-8?Q?6be4hzzHfA2BO5Fk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f19ceead-5cf0-4f5a-673f-08de6441d870
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:05:10.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGmA5nwLmLWx1CcEgU5XUCAQpqaI/isKFKgfTvGTskvmwtpT0rcQa7HdLUZN7XoCKu3ue9RR5/USn6MMuUkObpVSq/ZK/q5PhfbcXZeKnbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6430
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



On 2/4/2026 2:42 AM, Vinay Belgaumkar wrote:
> No need to use FORCEWAKE_ALL since the registers being written are in
> GT domain.
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index c8313e308f96..878eb273c3e6 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1300,7 +1300,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	if (xe_device_wedged(xe))
>  		return;
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
> +	CLASS(xe_force_wake, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */

