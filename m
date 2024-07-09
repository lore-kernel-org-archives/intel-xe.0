Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31AFC2BD09
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jul 2024 16:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9204D10E607;
	Tue,  9 Jul 2024 16:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GxxgE5Wj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEF110E607
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jul 2024 16:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720543085; x=1752079085;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Yn9pgDU/4caub3cfsfkuFQCB/sX/0QcV0L+vBnaQ/K8=;
 b=GxxgE5WjcpsNRozmM9eyyoq9CqlBALUYhCJ0DCNT0D5jsFRIgy435+kK
 17ubB77BzuB+NzTRECtBmATtd3rzFjQhbHwX5tgMtkarIlLPxqJhgedwy
 zJ+PClx/zzEy8tgVcuVwfIZZtARllBgXuMrfR/o/LLgHjiwsBfy2NLrc9
 TbxAjWLMQs/fI/Y5uGX3Hxnh7D3eMcYAIixYT5pw4u/5xDlst+7M2Ex+J
 jMKThX4ZlM3rN0HJBKCnlwMEIjnMDHQKjup7vPem8WEcwUwiyyxAMCE8n
 DsmEGezrlOGBLw7oe6kuHzFh9rWRi+I+pVID1ZwM67A+uQ+COq5WhlCW8 w==;
X-CSE-ConnectionGUID: VGeUu0p9Q3CKi1CrkxNtyA==
X-CSE-MsgGUID: 2SC4D3bjRaama75MIE4e/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="17634264"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17634264"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 09:38:05 -0700
X-CSE-ConnectionGUID: jI4ISVL8QcO7O3bJidUJfA==
X-CSE-MsgGUID: WzE34HSkQNKia9sYx9svzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="47836819"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 09:38:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 09:38:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 09:38:04 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 09:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C40LxhGMZNBCUSTPjUdst5A+quc4BH9Bx7bIx1xqua9jXFj8PQwEpxfQ0RwDRDJR2ar6UtRO/ZiPA1KcyP/SuTACFOl6IOb11OpVItP451cEQIhNZMJ6AAET63/Jj3u91fbMWxDSKyT4f27y9xd+Kg3Oi1dymTnDX5iljPPsBez+bjevmwVRAhEZ+Y+FVFPwGEZhXcYYQ0WqJX6kcKICru2PYaZmvbP1r1LDN5fjUi9wvsl3cgrjSYYLWSUOxcKr9CxiK9EM/wtiNggf95jLQTM7Pcq0xbG9tvy+Xu6Arj2W7ljL2w5jqlz/8OCwNy2wBYiq9kw+VPsfbLgUwpM/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=986SNs2Pfip1Pz3L8JgKByt3rV2DkG/NZ/2PnUt/wMY=;
 b=foXYteooQ8QC6RI1vMnv+cl40Y1iX8aqT6T9jRwgN4Upri0unMRgAmp/uSYt2SyGsrh+P/t4Nk3aE0zEl2mGAXyMs5LuQ6KsqutCbJUHX7uCOvDgJrT5WExHaFFmU2C0NpAuVnVVEMBeREKKhWF0IbgEKPco7AGr/J/8uiPd6Vn52Xdm/kmGhnhbPUAAN8kKeyt87chmJKU9JfdsAJos7A/ZCdRQxC7rM9ecZ5uuJlAz2HgjJRGWbStRT7O88IDTC2HyDeENGq+kI5ctESl+82N1zYvKa1UBBXakz5dAPI7qoBBk6zAgmtIW8sx8Snu3tnyqESgoz6qJnLRoNVqgyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB7427.namprd11.prod.outlook.com (2603:10b6:a03:4c1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 16:37:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 16:37:56 +0000
Date: Tue, 9 Jul 2024 09:37:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe: Add ref counting for xe_file
Message-ID: <Zo1nYs4AA1Hp0QQH@orsosgc001>
References: <20240708202103.3347869-1-umesh.nerlige.ramappa@intel.com>
 <20240708202103.3347869-3-umesh.nerlige.ramappa@intel.com>
 <5vo72c55ibxeyhyokdmr7ogilf25fo6jk7hht3vkc7ekkixgpl@tmdzibnr3mjz>
 <Zox1iBxWvN7GtG2Z@orsosgc001>
 <ZoyEO5sqdnuWzKH6@DUT025-TGLU.fm.intel.com>
 <mxnhwrka3iarajprb75wvsbeem3kxv4yxkxujqjgirkyghr3pv@i5cxlljd6j2j>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <mxnhwrka3iarajprb75wvsbeem3kxv4yxkxujqjgirkyghr3pv@i5cxlljd6j2j>
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB7427:EE_
X-MS-Office365-Filtering-Correlation-Id: faa0b97f-f2bf-47bf-b4fc-08dca0357cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXRxMmZ2cHVmY0hmS1h2WnB4ZjZrYk45SzF1UkwzSlVzaFhUdGJ5Wk84cHpy?=
 =?utf-8?B?WExJVC9yMGVxeU1Cenh2RWM3bkZUTE1oNGRnWEgvT3pSRkVJZjZHY0ptTmx4?=
 =?utf-8?B?dEpvRmowemZid3JJNk52RTlWOVdTT1pwZDhsMkkzT2Erd3pSQUVhRWVqRkNi?=
 =?utf-8?B?WGQyOHp5RTJXQ0lJNnpJWDdySkM5TGsvMGpQOWFMY0l2ZFRDemZHdFIrVFpS?=
 =?utf-8?B?MTFaZkd6MG0rS1JxRFJOZ1MzT29ma05PNFZISlpXdzg1VFQ3RWNSSGd6dW9i?=
 =?utf-8?B?dlZKYXBEbTZUdGhDNEhrNDlQUEtXNmFLTGZtd1FNQ1JxWGliV3cyd2VJSWdw?=
 =?utf-8?B?dkVEY3hMS1lBdHJRaWdVeDRZVXhsckZ0d0xtK1c3elF2WHI1QWdSS1VrV0VE?=
 =?utf-8?B?VVEyMjlTM0lzNzdaeVp5T0I1VERsYm9ySHp4NkJrdUNlRGVMMnVadlhWcWJD?=
 =?utf-8?B?OGxtaWxsandvTGRUU2s4aHJuazArZmFCNHF4S2psVUd6Ukg4Uk9hS0VhSHR4?=
 =?utf-8?B?Z1NLUVdmTHk3eHZ4SGZEa3lOQ251S24vNnU2bEV0WHgzVmlNMEE2NU11SnNM?=
 =?utf-8?B?MGlWeWIvZzViTlVwVEFDWnRnNjJkOXR2ZmNRdDE1dWNOZnd1Qk4wemxVREpE?=
 =?utf-8?B?R3JYeFhnUzBQRVhENDk3N2R6L2UvTzJqcG9zNG9PUko1WHRYUXJRVERxaDI1?=
 =?utf-8?B?S2lWOG11bUFyQzJ4SnowejVMT28wUnllblIzUm9WWWdWaFpDK0dsWUgvVnBV?=
 =?utf-8?B?bk5YN0J4Mk14RzN4SlRGQzJxOFVEa2xKM01kSjNhaGRHeEhUVW50L0FsWDd1?=
 =?utf-8?B?U1lhclowTWhoQ1pZTlNIQ3lZaGszZEVIUEE1b1AzVU1kR1NGcEFDS2R4NmJo?=
 =?utf-8?B?WDdNUWxrQUlDM1Z5NWhYc2FvTk1ZZXFxdWxKUEo3U1k5Y20rSTUzUnVXUzVt?=
 =?utf-8?B?Y2ZZYUM4S0IyUmJ5S2ZEalVQMmtQQTZXVmg0dXlhK2hFSGpaOGlRTHNmNUM3?=
 =?utf-8?B?d3lET3BiWkx2RVRaUElKR0FZNFE0bXVjdERkVDdLOXRWRFFRY2hOc3NKdmE0?=
 =?utf-8?B?bGZ3bFR2WGlzMWJ3Q0VEK2tWbWV3K0pxN2ZqaCs4bjE0cUdnb0J5eVA0eVhp?=
 =?utf-8?B?UzNhd3FINU9MOTc0NWdwYXlMSFNCODEvbmRnVGlNS3NQY2JHVWhqVUV2c2FB?=
 =?utf-8?B?TURJaDhmSW9UeVJxN1NIN1JjY29XWUZ0YUpzU0VsdWd5dElNVGpFeHFwVGZW?=
 =?utf-8?B?S29aZERMY0N4WVUxeTQxRWdob0xjNmdvZmNwbFI0dVQ1S3V1aFNPeGpVUVhB?=
 =?utf-8?B?ME0wWUdSU0lYNnNScm1GNU5wSDFRalpyWjJyQnRGUEhldFlyelp0aFBDanVu?=
 =?utf-8?B?YytwSDNLeTBHQnNHU1lJaXhWQ0J4TFoyUzVBL3J3YStCV05kK3loNnpIS09H?=
 =?utf-8?B?UlcrN0x6S1FqZC9FTVVvWXFlK0ZyemVESTE0ZWNBS0pBcmJpYm51c2RPaGpI?=
 =?utf-8?B?b0pPQ0NUajd4NkI1enNHZGRxZ2h0aFgvVmtIUmN2cnlzZ1c5YUV5VjBoYkpy?=
 =?utf-8?B?alpacEZLTmt3N01IaWVvd25ZMHZsN0g0K20xcmFYY29hVnJoMzduaU5PRXV5?=
 =?utf-8?B?a0N6MU80eG5PNnY3a0d4elBHTGtXOGprYWsyN21XTjQ4Z2pGYU1ac01OdUl5?=
 =?utf-8?B?TXNoaC9CblF1VEJJWjlxVWFkeDdvUXlHeHFLQkNlZXpkdklGZkxkeUUxQUs5?=
 =?utf-8?B?RUNHTkVBWGhqUmF6Yis1QnZxV2VpNy9VOE1xdjZJbmZtWTlwZjRockdvc2M4?=
 =?utf-8?B?QWF4VVNZSWlLbUV4VlBzdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlBVVXR3cGJCc2dwVS9uM1VLQTU0OEYwbkhhMFE3b2lEMlFKcnZXMXgzWnp3?=
 =?utf-8?B?SWxKRE1JcVU4ZjRXUmo3ajlwNDlCSkJLb0NtQnEzRHdjb2R6Y2VtRkcvaDFi?=
 =?utf-8?B?Z2hvL3ZOazJ6RGU2YXdmWStOWWtBY296RExhWjg3V0FWSkJOWGY5Ui9id2M2?=
 =?utf-8?B?Y0o1ODlwQ2NzcGkwRE1FMTh3UTBTZFdCR3JVUlJOcnM0MTRoaXNucG4rRGJu?=
 =?utf-8?B?dmVsWTNmSmFEam9tRjlOM2JFa3pVUUh6cEhHTkRMa3dQaS92SzNQZGdDTkND?=
 =?utf-8?B?R2FzZHRoVUMyeXR2amUwUUV0c3B6VE5DTklKWDR3WElpRmZjeDA5SjI3MlJ2?=
 =?utf-8?B?aFJ0bjhzbWUrZTNtQ0EydGNsMUFSeHlEWSsxSVE1dVVYMDEreG5TYkZ4Rnhw?=
 =?utf-8?B?dmpBQzN1Sy93cjZOVVpQUDBLeDJwSlpPMmVhMk9nT3krNE1iaDBMU2RFMTVs?=
 =?utf-8?B?S0JzN1pjcUFCU0Ryb3dVVXROTmdZSCtPWkcvMTZMNmFKOVRxKzd2RCt3TFVL?=
 =?utf-8?B?LzA4M1I3b1pJM2Z2ZHN2NDNZbFhlc1ZVdFZPM2RjTUFSRStuVyszSEVoOWM1?=
 =?utf-8?B?T2JzRGpVQnBYN2NseUhHL0xIMkg4a2RJZGZWMzcza3hrc3JrK2lkY2p3dTIr?=
 =?utf-8?B?ZUgwVzZhdjU5NndUSHVFZWRqUjBlZlNwYUpDdEo2YXZLUGdVWTBtcEF4a1gv?=
 =?utf-8?B?Mk02a3hKcHhXUm1ZRmZLS0Y4QXMvRHFlT0J4YXBKWWZ4S3dEUGFBRGpyV3d1?=
 =?utf-8?B?bGsycXh1bkozUnArQ01oTVhLR2R3RHkxczVMeUk3Q0ZEa1d0RHl5REs5K0gy?=
 =?utf-8?B?ckpNRTVUcllrUDluNHBPUWZjTXo4b2hWMVFNTnBtNEFKa0ZaSzZWeXJycFF6?=
 =?utf-8?B?WkRvc0wyb0hDNmJ4VVNzbDJnTXl5d0w0L1FzdHJuZnlZUU10dlZiSDJaZnpF?=
 =?utf-8?B?NXRVU3dkY2RKUmI4c2hyTUpuMmN4MVFFSjk4QVFXUFJzM012ejhMV0tjcDJs?=
 =?utf-8?B?WjBCclF1c0tqTTE3dkw1TlJ3N0V2cXNNbjZjQXVHMzFVRDZBc096OEMxU05v?=
 =?utf-8?B?SmhPN1BsbWZTWTd6TTNCb2JDbWNJaEhSK3RGcnF5QmdicE5IZVdYblVKWVV0?=
 =?utf-8?B?eFNKSjN0OEhDWStPTGdUalhnMHJNVTBCNTY2c2NyVEJSeFowVUZOSGpIMzdW?=
 =?utf-8?B?azBZVEVNSlE4dlJBQ0JhUVBxU2VYSVJBZzNaWENacVVTc3JCQUpTVml6djFT?=
 =?utf-8?B?QmZEUkVLSjIxbVM4OGZLMVZBRmV4Ui9vTlJPQ0lkVzhWWnpnMG04MHBSeEpl?=
 =?utf-8?B?WWJMZlE5UHlJckdKV3pGUDc5V1c2V1JUd1A2bXZ0N2ZQVm9QTnRHeVpaVTIy?=
 =?utf-8?B?bG1mZWpubjVzMkplWTR3UEJtYUpnUGN6Vk9VQTV1K3lPbkRyMjdsdlg2ZlRG?=
 =?utf-8?B?OVRIaDVxMzlobVQyb3Q5V0k3NHVQWCtmTzUvbXVyZTh5Y3JXaXZwMnVHWTRV?=
 =?utf-8?B?NzZ4dWNIUEhlZ3BXVVdmZER6c09mdDl3cnc4bUlOK1VBK1h0OHRNOVJtZVM3?=
 =?utf-8?B?eW0xbGZKTGF1TG54NlRLMk5RNHEyRkk3KzdYSlBXTzIvVG1pU0Nydlh3OUJk?=
 =?utf-8?B?RzdVUVhnSUlncUJZQy84bW1SZXpNOFVMOGVZbjZsWGJLOU5kQmZ0dmJ6UXJF?=
 =?utf-8?B?T28wUkcvSXBUOUJtL3FPSFJIK2ZOeitYMUVCUUpPTmxOeDFneVIrZFA4aDRy?=
 =?utf-8?B?RjRUNDd5UEJFbVBObGppOUs2MGlabEZTc2JzTnovUjUvSERZck0yNHF6NytK?=
 =?utf-8?B?TXRKZ1ZjTG1VMVcrbzFnSGtrZk1VeU5BY3IzOGkrUkpBRWdXM2JQRVlYMTNa?=
 =?utf-8?B?bEROMy9IdkQ2VXlSdFdQc29COGQ4Zk9SZ0pRbEpHK1loekRRUzU4OGF5T2ZT?=
 =?utf-8?B?N2xHdFZKSjNlR2N3M0xTRGVoV0h4ZzZrQ2VaK0E0QXQrZGZubm5yNWxScHEx?=
 =?utf-8?B?Mys3YlF4K2o5emJaV3NseUlpUmlNWkJxbU0rZHZUblZzZFo3V0kvaCs1VThH?=
 =?utf-8?B?M3FzWlZ4S2RzU3Y0MjdEMWdLMDUzZ01kb0lIR2FSRzJQZERSQkVWTUp2b0Fh?=
 =?utf-8?B?TFVaeFlLUlRKNmhEL002M2FjazFFSmJ3VWlMd2t1MllOMEYveEFaUXFKTlRw?=
 =?utf-8?Q?0LeYbU4iqKPkTKxgjGXe/b0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faa0b97f-f2bf-47bf-b4fc-08dca0357cb0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 16:37:56.6765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNZ6JqKR0PiQiOXcxnx2+odfB3zoph+JKiQNt4BnbTlrgWCl+hG6WPU7Z5nbyrpLFQD4CyZelp1YgSb206WU6XAO4uNJtKqidKfb14jBt2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7427
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

On Tue, Jul 09, 2024 at 10:11:47AM -0500, Lucas De Marchi wrote:
>On Tue, Jul 09, 2024 at 12:28:43AM GMT, Matthew Brost wrote:
>>On Mon, Jul 08, 2024 at 04:26:00PM -0700, Umesh Nerlige Ramappa wrote:
>>>On Mon, Jul 08, 2024 at 05:52:00PM -0500, Lucas De Marchi wrote:
>>>> On Mon, Jul 08, 2024 at 01:21:00PM GMT, Umesh Nerlige Ramappa wrote:
>>>> > Add ref counting for xe_file.
>>>> >
>>>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>> > ---
>>>> > drivers/gpu/drm/xe/xe_device.c       |  7 +++++--
>>>> > drivers/gpu/drm/xe/xe_device.h       | 12 ++++++++++++
>>>> > drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>>> > 3 files changed, 20 insertions(+), 2 deletions(-)
>>>> >
>>>> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>>> > index babb697652d5..e6eacf1bcce0 100644
>>>> > --- a/drivers/gpu/drm/xe/xe_device.c
>>>> > +++ b/drivers/gpu/drm/xe/xe_device.c
>>>> > @@ -87,11 +87,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>>>> > 	spin_unlock(&xe->clients.lock);
>>>> >
>>>> > 	file->driver_priv = xef;
>>>> > +	kref_init(&xef->refcount);
>>>> > +
>>>> > 	return 0;
>>>> > }
>>>> >
>>>> > -static void xe_file_destroy(struct xe_file *xef)
>>>> > +void xe_file_destroy(struct kref *ref)
>>>>
>>>> why do you export this?  I don't think anybody should be calling
>>>> xe_file_destroy() directly and this function being executed should only
>>>> be the outcome of kref being 0. Also, if it's exported, it shouldn't
>>>> really have struct kref as argument, but rather a struct xe_file
>>>>
>>>>
>>>> > {
>>>> > +	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
>>>> > 	struct xe_device *xe = xef->xe;
>>>> > 	struct xe_vm *vm;
>>>> > 	unsigned long idx;
>>>> > @@ -130,7 +133,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>>>> > 		xe_exec_queue_put(q);
>>>> > 	}
>>>> >
>>>> > -	xe_file_destroy(xef);
>>>> > +	xe_file_put(xef);
>>>> > }
>>>> >
>>>> > static const struct drm_ioctl_desc xe_ioctls[] = {
>>>> > diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>>> > index bb07f5669dbb..2a8b370b1fda 100644
>>>> > --- a/drivers/gpu/drm/xe/xe_device.h
>>>> > +++ b/drivers/gpu/drm/xe/xe_device.h
>>>> > @@ -169,5 +169,17 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>>>> > }
>>>> >
>>>> > void xe_device_declare_wedged(struct xe_device *xe);
>>>> > +void xe_file_destroy(struct kref *ref);
>>>> > +
>>>> > +static inline struct xe_file *xe_file_get(struct xe_file *xef)
>>>> > +{
>>>> > +	kref_get(&xef->refcount);
>>>> > +	return xef;
>>>> > +}
>>>> > +
>>>> > +static inline void xe_file_put(struct xe_file *xef)
>>>>
>>>> I think if you just make this non-inline, passing file_destroy and
>>>> leave it in the same place, it should work.
>>>
>>>the put is called from xe_exec_queue.c and xe_vm.c also, so passing the
>>>destroy may not work.
>>>
>>>Based on the patterns below, xe_file_put/xe_file_get will need to be moved
>>>to xe_device.c and then exported. It looks cleaner, hoping that'w what you
>>>mean.
>>>
>>>In xe_device.h:
>>>
>>>void xe_file_put(struct xe_file *xef);
>>>struct xe_file *xe_file_get(struct xe_file *xef);
>
>yes

ok, posted v2 with this change.

>
>>>
>>
>>My opinion is the way you have it is correct.
>>
>>Most of Xe is coded this way...
>>
>>mbrost@lstrano-desk:xe$ grep _get\( *.h | grep inline
>>xe_bo.h:static inline struct xe_bo *xe_bo_get(struct xe_bo *bo)
>>xe_device.h:static inline struct xe_file *xe_file_get(struct xe_file *xef)
>>xe_exec_queue.h:static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
>>xe_lrc.h:static inline struct xe_lrc *xe_lrc_get(struct xe_lrc *lrc)
>>xe_sched_job.h:static inline struct xe_sched_job *xe_sched_job_get(struct xe_sched_job *job)
>>xe_vm.h:static inline struct xe_vm *xe_vm_get(struct xe_vm *vm)
>>
>>I'm kinda confused by what Lucas is suggesting.
>
>just don't make xe_file_destroy() non-static, which would basically
>ignore the refcounting. xe_file_destroy() should rather be local to the
>.c implementing xe_file_put().
>

In the above instances from grep, most of the destroy helpers are indeed 
exported. Those might need to be changed as per this review comment.

Thanks,
Umesh
>
>Lucas De Marchi
