Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B3DCEACEE
	for <intel-xe@archiver.kernel.org>; Tue,  1 Oct 2024 17:50:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780AD10E037;
	Tue,  1 Oct 2024 17:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cbU8R+s1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8204110E15A
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Oct 2024 17:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727805006; x=1759341006;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GabiTN0HvAjKLPKT2jmeIrtxOchtq1MmonNZNDedujM=;
 b=cbU8R+s19WjgmE2GeZ1ytwdNUCd3eQnLQqmbYP3F2hI7NwpIAouuDLxh
 RR2Kow+3CqeDI5p4PpIaavE4hXjXLEwRAS4DMCTGYe4vMG3pbXugSlRYu
 LPEH4ZE6gWkNcNlZ3gcObI6puEOLZMJUudroft9wIrK7Fwqia0Z5nmZbl
 5HFiCA98B1HF9Ndn338EAJFnGESujTgVrxmGrRL58oKQVPx+/1XklLBco
 Nu86MbPos3ORszUFn5SGNoW0QACQePRBIx4xVgOi9xCo2nP+gu652eG/I
 qmhgIQx+UkAHajqBfslodm7jOtHjMqgQdpeWvmt1PK4s59M+hQHnbPriK A==;
X-CSE-ConnectionGUID: 3wNr+EATTFyu4ZlsG5WShQ==
X-CSE-MsgGUID: MkfFIZiNQ/+jsrUzGPsxdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="44416506"
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="44416506"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 10:50:06 -0700
X-CSE-ConnectionGUID: v8YS1X0RShukBwtoDcs/jg==
X-CSE-MsgGUID: vTOip53lSvWQd5i6Bz+esA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,169,1725346800"; d="scan'208";a="78494045"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Oct 2024 10:50:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 10:50:05 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 10:50:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 1 Oct 2024 10:50:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 1 Oct 2024 10:50:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 1 Oct 2024 10:50:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtrvLxb8PhfQrZqNroMk+cWygUU1iSWWk3t3MjI8wdij3P/SVjxEsFS3Cd8qs66mVKeoaiOw/I5XhTa+ZYF5lZA19GqA6G8r03+77eCkzsIrR8H3CTeD6EC8Klae/UDype+r9Mqt7AUMkxHWcG6TuTvAVErTJHwdmuS00GGPxZ84f2N5l7jdGKwW+r0NelMeE9+Ijb4l/h+I3wzLz7TZwcnCbqK0FEWqBWxcLu8RjP4QgMfnRgg7cVnqgUFFw5GFrKDsNOTLZWJ16hkw8L61PoBDbqzxN5h9yI0Ww6+12HFm+TmcDeB1S2KDzeGIQY0jIhPohcilGwwrb3tTOcWREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC9MRJm7JuV1wAPYTcxdl38IGBHRgc+THASeKhed/ds=;
 b=QyXevwgbUDeCGnMtuoa8dxT0i1/kEVHNO4GHikPYJZRQid9rpwuKW8Ca36FPbdmBhPjcFWZwYqay9pWJU1jbi2RupH8pzgMTibeUNfG7B338wYpmXJJc8MAIEFrodK2cmUzALw4RnGm5t8s12OjcL6GBhlGROJaXpbZnZRxtZ6AMpqd5qvn/Q5BuHN9dSUq6B+Nv0uXM+Sab9+o3sid3kWyWLaEoPf26O9nFdSN80f80auetitHP2zGAY/5TAA7qZqYRlfUXgpmNrIOTv9fJ69E/VtKnePV6YQ8B2et0EtuSBE5My+EqEeN8nIV1FkKeCjkdB73vuVs2N6NfkySAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Tue, 1 Oct
 2024 17:50:00 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 17:50:00 +0000
Message-ID: <a27b90ad-04c9-4f06-83d9-a22c8fbb7bfa@intel.com>
Date: Tue, 1 Oct 2024 23:19:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: In guc_ct_send_recv flush g2h worker if g2h
 resp times out
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <john.c.harrison@intel.com>, <vinay.belgaumkar@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240927192428.1160211-1-badal.nilawar@intel.com>
 <ZvcjVH9Y3AVjGMsI@DUT025-TGLU.fm.intel.com>
 <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
Content-Language: en-US
In-Reply-To: <2198b044-4b1c-4933-a229-d94095b87d5d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0113.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: bb00309f-907c-481b-49db-08dce2417856
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3ZrNzlVTmc2dzJPbnluVDY5eGRVclZ5VzRUMjdOQ3NGeFNmdmMwTzZxTTZI?=
 =?utf-8?B?NjZqMVc2QW5UKzdnMkJlZTdJSFdBWDExaTduQzV3MEh1bEE0Ry9TVHBwYzhn?=
 =?utf-8?B?a1lsLy9vZDRmNEtTYzdCUlFoVndHcFh3QitIRDF4cFR2WG14N0xFUXBwQThC?=
 =?utf-8?B?YjU1bDJGSGtMVXFFajJJS0YxSUNIUEZaMVM3c1owdnZtS1g2ekJ0cDZTdExK?=
 =?utf-8?B?enZ0SFMvY2cweXVBVmxYY0M2Yk9GRk52RTQ4U0NHaHg4SDhKTThodGFsWEJ1?=
 =?utf-8?B?SGVPR0tGQUNQc1lmQlgrWDNtSEI4RHFDRkdoc3ExZWdPUU51UU5vb3VSWk13?=
 =?utf-8?B?SzFIdkZjY0JzR0Jkbmk0L3dVOGdkV0JmMENmU2E0c0NGalYvSE1hMWtXS2Va?=
 =?utf-8?B?MlVCMWZsNkp4QWJGM0dNQzN6ZUNPeWFpbW5OTkkxdUxLcGJYM1UvZ3c4VjAr?=
 =?utf-8?B?eStMcGZucE5DNVhYa1drUWpKdWs4SGFRc1VtQkNUbDBoK2VHNU5SS05QL2x6?=
 =?utf-8?B?bkdNTks4NXNTb2tpeDZKMDViaWhpcDVZMHNtNkZidDVWM29mOCt3Nng0L3ho?=
 =?utf-8?B?TUJ2RmtQaUtkbjVMeUswTmd6NmNVTTMwK0lRRUJUUUJHc1dlTkhDcFJWYzJJ?=
 =?utf-8?B?eE54Tm5jSEFkTEVwSzVqUTRFM2tuM0l2dytkQ25QSUJmd0tEeDhlejR1aWtr?=
 =?utf-8?B?ZTQ2SmZaMUpsSDJseWhnbmx3WkU5a3drbXdtbDk2UEpiR0dpUW51WmppcWJ4?=
 =?utf-8?B?d21ybjhIeCszcVcwRk9laytLUTZMRjNmM2FTUVM4Z1hMcnk5dG9kRlJGYlN0?=
 =?utf-8?B?dHdBUGxQNityYzBHMFNhQlUveVUwbmZXTE1idm1BOEZWdnhMeW9WUkZBd2NJ?=
 =?utf-8?B?YkU2cnZILzFVS2hpNzB0TzB1am1KbHhITWNHS0VrZWJiMzRMOXpxWWo1Vlhk?=
 =?utf-8?B?dkl2aEdyRkxJdXB2dVJhSnpYMUFlQzNiN1JjbjVjbXZVbno3WG1CN0tTOEhJ?=
 =?utf-8?B?Njlodm5selNYR0ovd1FCZm1tOWNHcC9iZVk1K2QzNkNoYVh3dFJaSUN5UmU5?=
 =?utf-8?B?ZkU4TUxrMFZGR0c3M3p4ZjNpYzlxY3NwSS9JajBFdTZYVmFJZU56alhzaWpC?=
 =?utf-8?B?MS96WFNLRzVjZytESE9hcWFHYW5VemZpYkQ5UFdhTGtDMUZkN2UrWGpMUVpE?=
 =?utf-8?B?aXE2VGI5dVdXZjRJR3dVNUNEUGhsSlhDWXFtcWxwZ2ZyRmdwTDF0V3NPbVZL?=
 =?utf-8?B?Q1A0SEdOYWNuWGNpMlNrM3Q5WmlnRU0rUGxDTEI5MTdLbkpPcFlqcnRoYXJv?=
 =?utf-8?B?SVFSdE9kcjREays2RXVPVGVxSmcrSU9QN3RuZG84TVNHdWN6U3QzWVlDZGxB?=
 =?utf-8?B?d1pTUitvVjNTam96ZHJkTmZIUUkzTVNOZW5LT3ppM3pDekRpTmhvUmw5bThX?=
 =?utf-8?B?anBDODIrdzFwUGs5elZZS3F1eDVsZVRmejRJeWhESEhRcUxNVUpzZm11WXg3?=
 =?utf-8?B?Q0VTdnhXS1dQZVV0dzFDb2NVclh6VGhDMmtxN080OTYrc0ZxVkt4WGdFZlVn?=
 =?utf-8?B?RFQ1SXRjZTNnQ3NtbUFXcm5GK1ZEckoyZUlGQmNyTXE4NlFRNCtwQmN5K2tq?=
 =?utf-8?B?QW5sZ2dGRG0xOHZCWG1yeEVBck5KblNpd0ZtMjBNeWlqV2F4NnExY3Jkbklk?=
 =?utf-8?B?ZStpWFNHNW9qcEtGa3lhc2lybTJ5Z2MrR0czbkNSK3F6RVI2TTU3dFBQT1Yx?=
 =?utf-8?B?ZTlTb0dsNFZRalpKNzRmR0swZW94czlPbGRmQ2laZXlYcFFvcHl6WVNNdFRO?=
 =?utf-8?B?OVorVTFPa2c2eVk2ajVSZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitrRVBIUmEvM1E0MTgrYy9RVzFCT3ZxYkZpSkxJMGZ5N2NIblRObk4yUEU4?=
 =?utf-8?B?SjJGMHc4TjFrZFBmRW9BSEhKZklFc1VTM0VoeVhkTUJ6dDN3bWNsMmRRNzRS?=
 =?utf-8?B?ay83NHZoTkMveVZUd2lrQjZCY3RwNVZjN0x6OS9Cb016N2sxNnhMV2NhZmU3?=
 =?utf-8?B?Q0tObU5rM2xlcVdRSUZzeWZPL1ZXeEJLZjZ5WEJkWnBzdk9PNlZUektvSStL?=
 =?utf-8?B?ZVhTelppSlVrRVl2eWJvUzNlZ2F4ZDNIeGRIejdkVFc3aGRHbzVyRDM3dFE2?=
 =?utf-8?B?TWxKZ1djcXU3eUxEZTNWT0hQYnZCNE9GODhDT0c2MXY1ejl0YkFVUS9GY1lX?=
 =?utf-8?B?bmdVK1lnTXJpQVVaQllMWUU3ZmUyY2RuSnQzQ015UzgycTdwMW1JWWdtRTR2?=
 =?utf-8?B?Qy91ak5BRUVyTDJLZ2FBb3dxVHNmOTIySzRMWnN3R1R6VUcwdEg0TGdEdTdY?=
 =?utf-8?B?RDBQb1p6bjJTeExMQ3M0djdTblByc3lrK3h4QWk2WVRFRzdjWmttOVlSTmI0?=
 =?utf-8?B?L1RGNHN4S08xMHhRcjVOWkI4d3BUeENXbFRPSUlHMkx5aFYyVUIveVNtV1d2?=
 =?utf-8?B?bm5URlBTVXRVRWRISzNkaTRLMzZISmQ0TnVMemVCYmVZUXc5SXU2bk4xRUM2?=
 =?utf-8?B?dDFDVkM5dnhBdTg0VnNFanU0S3BKeUpPZG16T0pTSnIxVThQZm9vWHhLU3FX?=
 =?utf-8?B?SHVhWGZEeUpiOGw2akV2SGtocjcrajlhQVVtQkc3VGF6UnUycjI5WmVEQkUz?=
 =?utf-8?B?U0cxUEduSXlGSTRzZTdkWFJXMXlnQ2FIRW1TbkxRdEkwU1dFSUo5QUVxdlJq?=
 =?utf-8?B?c2RMUEVvTXNGcm9HdmxTWmkzaGx5WGdObEhCcTB3c1RQM3ZQamRPL3hUcUpa?=
 =?utf-8?B?TlNSam5JSXF0VnJNUVpGOGFKVjNkNmZSYitmbGFxWlRKTVpESXUxWTNpVFdM?=
 =?utf-8?B?UkVxSHc0VzQ0ZS9IRVk4UGRMU0dQaUs5eTU3TjBZQmxkTmdXTWJpUWlvTldh?=
 =?utf-8?B?YkJZZnYyZ2dxQnVnSUx4TFo3bFBYcVpkZWhha2thZmhkdWRaTHpRU2txMzBl?=
 =?utf-8?B?dWdJV2R5SWNEME5mQmFxMUc2QW4wRU9sVFIvcTVsNlZFNzdWZy9MQ2ZMQXAv?=
 =?utf-8?B?MmJhVlU4aEhRWW83dVE3ekZsM2tMWlVXOWRPNTJLUXNTVlpFS3FvS0ZOSzVN?=
 =?utf-8?B?dFpVYnpqZWlvYU9JUzAvVGdNWUNYY1NnazFYY1FEK3YyWmRZQ2RIZ1E0NXJj?=
 =?utf-8?B?elNTeDJnKzJzT1RDbXRLdUVkRm9KbHR4ZFR2UitoQk9PYjczOHFIRi9LcDY5?=
 =?utf-8?B?ZGNxaytSR0M0eHdwbkNzbmI1M1VwMGFKKy95Um1iZXNVOEVxS1BvVmRNQ29m?=
 =?utf-8?B?QURkVnRuZ29UWGhqQzhjVG1LeWlCeVlyMzVhbHNaeit6K29VelFweWpUUmp5?=
 =?utf-8?B?Wnh1cEcvTS9lZ0cwVStReFNDNk52UUFGZDM3OHAxdmVUSDNURXY4RkN2Uk1L?=
 =?utf-8?B?YWlWWWtEelFKQlVuaklCWHpsRUQwNlU4U1dkc3JjQWY4d2h5MzlDYTNzQkR3?=
 =?utf-8?B?VXVlQVF1azQwdGM3UHVnbThuL0dmMFNsYWhLdjBUR0VvRFZKQmsxVHNmWm1y?=
 =?utf-8?B?MkZiTXBpNFNDR0Z5K2srRmFvczU3MHZzUDZBNkNqZUV4M3Y3dnJRclhJamZN?=
 =?utf-8?B?NWFRRkc5aG1BVTFmNVhvRGhWTDhGOS84U3p4bTBoa2Z1Nk1OSitwM3V1WUhD?=
 =?utf-8?B?TXpuRldqOWVsWTd6K3VCNHRSa0NIMjM3TEdzb2VrNGc0anY4czhZVi9FcXg1?=
 =?utf-8?B?K3FUcjh2cnMxcDNBemhjUldIMHJySXpMVEU1RmgrTnNBeEVwNnpmRURnZGNs?=
 =?utf-8?B?MElDUTg3RXpBSytLSGphSVcwK3lZcS9KVFAxY2dEQUdzbjRIdjZ6UmJLbFp6?=
 =?utf-8?B?cUtDZk5Hd2pNNHdrbzhTUG96SWsvMlpNY0lKWUhZbnVOQ0RGWTI3WnI0RHpv?=
 =?utf-8?B?a3hqQUppaXJjYlNwNFhMclJrb2VvTWVIN1d6aU9rdVJZUmhoWm1jY0JnVzZW?=
 =?utf-8?B?amxLR2JRYXA0eERmaU5xV3d1TDkzc0Iwbk1QcXBBWmZzRGZTNGtxVjV6TWVE?=
 =?utf-8?B?Rmo1bDE2bmxMcWNYZW5KeG04TXFtNzBTNnhWVkFvSll0UjBpYzAyYVhLZWJs?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb00309f-907c-481b-49db-08dce2417856
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 17:50:00.3088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dku+i2bodH73OtkQb71Dgz2iKSd47MOf6PD1BnWoOgqhfoM9PAcsNWUZGc6Onn6ctc5CNNV799wj2WzV56JArg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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



On 01-10-2024 13:41, Nilawar, Badal wrote:
> 
> 
> On 28-09-2024 02:57, Matthew Brost wrote:
>> On Sat, Sep 28, 2024 at 12:54:28AM +0530, Badal Nilawar wrote:
>>> It is observed that for GuC CT request G2H IRQ triggered and g2h_worker
>>> queued, but it didn't get opportunity to execute and timeout occurred.
>>> To address this the g2h_worker is being flushed.
>>>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/ 
>>> xe_guc_ct.c
>>> index 4b95f75b1546..4a5d7f85d1a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>>> @@ -903,6 +903,17 @@ static int guc_ct_send_recv(struct xe_guc_ct 
>>> *ct, const u32 *action, u32 len,
>>>       }
>>>       ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>> +
>>> +    /*
>>> +     * It is observed that for above GuC CT request G2H IRQ triggered
>>
>> Where is this observed. 1 second is a long to wait for a worker...
> 
> Please see this log.
> 
> [  176.602482] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: 
> GT[0] GuC PC status query
> [  176.603019] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
> IRQ GT[0]
> [  176.603449] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
> running GT[0]
> [  176.604379] xe 0000:00:02.0: [drm:xe_guc_pc_get_max_freq [xe]] GT0: 
> GT[0] GuC PC status query
> [  176.605464] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
> IRQ GT[0]
> [  176.605821] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
> running GT[0]
> [  176.716699] xe 0000:00:02.0: [drm] GT0: trying reset
> [  176.716718] xe 0000:00:02.0: [drm] GT0: GuC PC status query    //GuC 
> PC check request
> [  176.717648] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
> IRQ GT[0]  // IRQ
> [  177.728637] xe 0000:00:02.0: [drm] *ERROR* GT0: Timed out wait for 
> G2H, fence 1311, action 3003  //Timeout
> [  177.737637] xe 0000:00:02.0: [drm] *ERROR* GT0: GuC PC query task 
> state failed: -ETIME
> [  177.745644] xe 0000:00:02.0: [drm] GT0: reset queued
> [  177.849081] xe 0000:00:02.0: [drm:xe_guc_pc_get_min_freq [xe]] GT0: 
> GT[0] GuC PC status query
> [  177.849659] xe 0000:00:02.0: [drm:xe_guc_irq_handler [xe]] GT0: G2H 
> IRQ GT[0]
> [  178.632672] xe 0000:00:02.0: [drm] GT0: reset started
> [  178.632639] xe 0000:00:02.0: [drm:g2h_worker_func [xe]] GT0: G2H work 
> running GT[0] // Worker ran
> [  178.632897] xe 0000:00:02.0: [drm] GT0: G2H fence (1311) not found!
> 
>>
>>> +     * and g2h_worker queued, but it didn't get opportunity to execute
>>> +     * and timeout occurred. To address the g2h_worker is being 
>>> flushed.
>>> +     */
>>> +    if (!ret) {
>>> +        flush_work(&ct->g2h_worker);
>>> +        ret = wait_event_timeout(ct->g2h_fence_wq, g2h_fence.done, HZ);
>>
>> If this is needed I wouldn't wait 1 second, if the flush worked
>> 'g2h_fence.done' should immediately be signaled. Maybe wait 1 MS?
> 
> In config HZ is set to 250, which is 4 ms I think.
> 
> CONFIG_HZ_250=y
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=250

Got your point. As flush will wait for work to finish last queuing 
instance 1ms is enough.

-Badal

> 
> Regards,
> Badal
> 
>>
>> Matt
>>
>>> +    }
>>> +
>>>       if (!ret) {
>>>           xe_gt_err(gt, "Timed out wait for G2H, fence %u, action %04x",
>>>                 g2h_fence.seqno, action[0]);
>>> -- 
>>> 2.34.1
>>>
> 

