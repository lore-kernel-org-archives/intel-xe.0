Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F09AE77198
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 00:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE310E41E;
	Wed,  8 Jan 2025 00:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsiU5mXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A094E10E41E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Jan 2025 00:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736297295; x=1767833295;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Mq0lsxTzN1NBH2W0M0DJL8dol/Wgdnh3vxBDeMjv0zA=;
 b=fsiU5mXLVkLFNF1+rzmhiDCtiawyLptvYqnKU1TK9cEHqppCP+yoFMin
 KTyMyS6wCH95XA3oy4aThhaLo4/6tnzyvfWXI2qmbJuoAiIRdZpL/+uiS
 O4HpWuy4+whel2kLt0oneC+W7hBbcCj0ZKuc68xe/8qtWFlh6v4DSiy5X
 2U3uxfnKY7orqjfKsNVpnjHkq9bQjgCCLNCwx2L+nUyJ6CsZYm78abH0J
 FICRrXjrt6dLK2JqFHURjFDPGa971h2Yn2GCnK2fALWE04TKJGec/tFWK
 Q5Yq60XK6AgmVFWNBaeEklhI2fmTUcZekfTy+qVxXL4r1ZaPOHwQk/gKy g==;
X-CSE-ConnectionGUID: c7/+yYNLTXqBPONh68Wb5Q==
X-CSE-MsgGUID: sYSqlzPvSzmaEsHdWGxzCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40273057"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="40273057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 16:48:13 -0800
X-CSE-ConnectionGUID: bCLWAVsORku4vPCJzi4Sig==
X-CSE-MsgGUID: kVZtvF1FRDe1lEoSRIGxHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="107924139"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 16:48:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 16:48:11 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 16:48:11 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 16:48:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Psyp8nWnrdmSy1LTvW6KsBkn6dfZmO5gQ8UdpzxBAwY7DfwykrvOAsk4F5f4eBjo9dIVblMMDIYYKhwui0dNLiZvIqyhmgURGRDFv0WkUu6zNjhhQWt70yXzQ14ixCTd35aqkGoWHPyUrxyxEGw3TwwBwMNqDqpdLnVaqIc4VdMUh0ZHXshFT9PtlpGquINwf8N8bEy4Fg3OXQGGnpnEpz0dZHB45wTITXZiAz2MbjXjkaKmyWcj/IXcULBD4amIEBuNT2JFKGveZ6ycAnFXWK8+NqXzzBt8lyYuZVmXpuwOrG763vwp8tlLLu8bnRKjys6//0fg8UwOHqDV+7819g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfKffLjJ0wUKDcWY+zB95XjHhsB8tvJ7mpIdvLu+5TM=;
 b=c6K+mOQAnSI7QJ1+2OSrILX7gU5kVUNDp0lvwaozWphtAGcAqZfQBANIbXqfM1oC1cBVxdFj+FbB5Dq4YURAfo3W2LqIePCJZ/wJecXt47PTAQMZQN3MJVtBOWLcBw2+J5i3JxVMUYGSnGgfqu8voT4/gGkgRp/lZTzyw1vBf/w/EyayjSNdbEmWrdp5Eg3baLAmd4sQSR7fo2WDquozy4eCcIA3trC7eMBnDr9/SqbxmTu8gXTP1jhbpF/T2O8KpRM4gwLXzrTIJz82e1STKOSfKY2fzNwhMdiI4pog4S7qOpuID3s7IhyIEQsw++AewQR9UK4JMndpLpVTEwWD5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Wed, 8 Jan
 2025 00:47:36 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%4]) with mapi id 15.20.8314.015; Wed, 8 Jan 2025
 00:47:36 +0000
Message-ID: <3a6509da-fd5b-4791-b2e9-016a38758f89@intel.com>
Date: Tue, 7 Jan 2025 16:47:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] drm/xe/pmu: Add GT C6 events
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241220011910.103280-1-vinay.belgaumkar@intel.com>
 <20241220011910.103280-4-vinay.belgaumkar@intel.com>
 <Z2XdfKRCvrACcl74@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Z2XdfKRCvrACcl74@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0153.namprd03.prod.outlook.com
 (2603:10b6:a03:338::8) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdfb0da-2dbd-4402-04c7-08dd2f7e0b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkdjVlNvMjNKRC9odFJ1SG5YalVpamhlVVg4RGE3WDVlalY5VEt0eUxLbHRj?=
 =?utf-8?B?WDlWRFFSYWxKajdVaURKemhwbFB6bm9mcUNvWkNldFk4WXo2bkczclVMT0Z0?=
 =?utf-8?B?dG55VWdrZGFrcE44czZ3Yk80UVBQYWdxVk12V1FsV3NERGI4clZtN0lNamxT?=
 =?utf-8?B?b05USnBvckdDdkVHR3VZRUhnYllWb2pyK1E4bjN5WE8yZVh0Wm50dlpzVFhv?=
 =?utf-8?B?b0hjZWdaaHZTd0o5b1FaeThuRndQZHFzVHpDUERPMHlWaFNxalRieW1NVFRH?=
 =?utf-8?B?Ly9SbjdTOU8wZGRCdjQxOTFMUHUxK0dmRmZHd0JLRkFZbzlLZ2pzYzVXbTZj?=
 =?utf-8?B?bEhzdmVMY1NZT2JVNVg5Q2IyK0V3aUpiT2x2QmpGSlRNS012NW1SNkE2d2FR?=
 =?utf-8?B?dGRlVGVKVENzdkMzZVNibFpLbE0vVWJyajBHZ2N5TGd1R3RqRkltaWk2ay83?=
 =?utf-8?B?NWFaNFNHM0tOYW1hbC9jblBIK0JJRURhK05YWDJKSFk2UHJ0ZXdRalV3TkVm?=
 =?utf-8?B?d3M3MkV5Q0ZuMEdYMVFGd2dGSFNrTGdqYmttK282djhoV2lKU1BrOVRUeTEz?=
 =?utf-8?B?NFlpcUtSNnhyTnNlSDI1T08vYk9DS2JuK0J5WmpuTGNZY1JhQXJFc0dGcFYv?=
 =?utf-8?B?T0Y5MHN4T1ZldUxhVFFOZXNSa2FnVXp2T2Y3MmY3Q2dTbVZ2Tjk0RGxoTlhD?=
 =?utf-8?B?Rk9PNnBvcjlsQUNWejZBOHFZbXh4QWExQU52b2JwUGtuQnZRQnUrRElpNnRL?=
 =?utf-8?B?RE5MMGMwMzJtZ2ZKblBEMUg4NFBralNJOVluTTBOVzNOdjZwZXdwaG0yaVVJ?=
 =?utf-8?B?UCtSWFJiQlhqWUlIRzNxWHdxNGZHM1BJQmZ5SDJxUmd5NDk5ZHhmR3ZZRXpG?=
 =?utf-8?B?cEtJWmU3a1d3L0ZUZkNPZU5Wdm1BS3JSR2FWeVpjUnVDSytEeVgwWHBRbGR4?=
 =?utf-8?B?WDAxaGg4WHFhd2ZhSnpkZ2E4YjArWlRqNFlYYkxZM3VEK3pzRzYrMzVHWkR3?=
 =?utf-8?B?elIzd0p6bXNvVXZuZGpROC9UQ3V3OHhPNnQxelhsS1B4ZkExREJkaHBaWWhy?=
 =?utf-8?B?RnRYcmZlUElXM2NYMi9hc0Rya3lLb3BGcWorajBLWHRHekdOenBkbTZGYkJI?=
 =?utf-8?B?dkprMUFZTDZFbnIxTjB0SlhBb3JEVUgzRmlnWEFNMUErWlMvRUxYK0hJVlVh?=
 =?utf-8?B?aXRoNnVqZFMzYlBNU09YeGQ2L2hiVkF2a0dTa1FwMElnK3d1NlEyRURpSzBI?=
 =?utf-8?B?SGwyeDNWRGNBWlNpUE5NclhiR3d1bzY3aSt5ampxMGNCZFh0VlpiSzlXZDc3?=
 =?utf-8?B?THdyTEpDbWJVVUc5WVcxWHYwb2hOWk4zRGE0azJnS0FJcTRQT0JIWWhsZmNW?=
 =?utf-8?B?NllHUmNXOGpCaUhBVU1NdXBESEtrYXc0R0dwK3N1UmFYMGVZZ3VFdFFRcjJ0?=
 =?utf-8?B?aDRRdjNsMEdkLzZKNUhick14WEMxall1MHVQdEErNEFLcmNpd2VzWk5ReUdD?=
 =?utf-8?B?NnJteEhialdVVHNsZi9FcHo1T2FCTDZrMk9HM2FNVUdFVHQ3eU0wWnRVSEVQ?=
 =?utf-8?B?Tkh4UWdYOVdLSUZTa25MRldWcW9TRTRvRklMYTl1U1pTbXAwN3VqNWZMR09T?=
 =?utf-8?B?cGpjbUl6MFZFUXdSZ1JkYnArQmZ3dldEWmVkb0F2eGliKzhmRnIwdEQrWXZW?=
 =?utf-8?B?eFRyNTg2M0xSeEU2KysvZFhoRUlEa2NEUHd4Z09EUTNiYWU1M3JHWnpuWGVE?=
 =?utf-8?B?Vy9nLzEybnNJYnJubW1SSGtXNnJZYXRzQ0JOS0xuaVBTeFNXczc5aHZKbnhi?=
 =?utf-8?B?RTVNZldnc1RkcFMwMnVsVDBPd3JWQzJHd1h2V3J4WmNlT2Nha3FSTEZjTVNt?=
 =?utf-8?Q?kHb1CppB+XOuX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEFHN3psMnRJb043V3A4TGZEZ2hSNFhoWTNEUHhOTDhZZ0syS0pVdW1lRXdp?=
 =?utf-8?B?MWRFbTA3WlRJUlBCZzNNaVNRaGt5aW5jcUNYTDB3c1BVR0RIcDNxeEVPK3VH?=
 =?utf-8?B?UXhtOXdqNmpISlZ1V281N1dvU2x2Mms2d3BTYTdFNWJwYUtIWXpLTTN1K0Ex?=
 =?utf-8?B?d2gzZTAxK0J0QkpsZVhGUTl3RFhBT2VmYlFIR3JOaDd3NnZLdmZWMGd2R0dN?=
 =?utf-8?B?UXdMSDB3UnhmWUFmM0JsWW5jRHFYcU1obEM3Y1ZHRXRwTVJRUWlSazdrKzA5?=
 =?utf-8?B?M3hNbXl6RWlHQXVsUkM0cEdkQXNLUVJYYmtJTmlGakJPQWZKdWVyRkd5U0Vu?=
 =?utf-8?B?ckxqOFlrRFVxOGx1anpiNnMyb1A5M0YyMjlYNzlqbW4xN2xyTDVhZEhMMDRa?=
 =?utf-8?B?UHAwclh5WEVxMFMvR1ZwQUl0Q1hqREJMcUZDMkQwMVM4TXcyT2pvK0pNNDZu?=
 =?utf-8?B?Y2xydXZKeGFNaFVvd3pmSnZkNC83RW1IU1Y3dnM3eW1DQW55RldiVFhVUDdW?=
 =?utf-8?B?UnBSYlQ5bUZ5Q2k1OVdqNnBiUUUxeXFGenhjRnN6RlppeGpGQ2Nidk5wN0Nz?=
 =?utf-8?B?V3BsQU1RMDdWZHJCWFJkQk1mdXhGT21IazFNd1hMNjdxU0pqM3o0OWY2QWJJ?=
 =?utf-8?B?VHRjOE5iYUVtQWNucHA2ZWtGUCtuSjlzZDhnd3JRSmJHVWF6MjJyTy9aNkpw?=
 =?utf-8?B?aDhsbkJNNU1UOHQxS0hGM0kwNFFsbGhBYUNlUHU3K1BObjJqZHhCcUplZFh4?=
 =?utf-8?B?VWhMV3JyNkFjQUMrVVNUaDlhRENiQyt3OFBkMmwwS1ozd2tMSGJ1RHBqcDkv?=
 =?utf-8?B?SGZKNXhUZVc4amNQUmRtL2JRaFdWMXZZM3NKV2tPajQxcERLRUEwbkh6LzFE?=
 =?utf-8?B?dmRwMkkrSEJEU0k4YnUyYlVMNUFEb3RtbHdHV2pGcGprZklRL3BJWE1SSmQ0?=
 =?utf-8?B?MmRTOXJqMGQ4SWpVcWpSUG9sQVB3N2xwVUphcUJMbEhUVzExNWptSlQ4RTZu?=
 =?utf-8?B?dWJKODZTNk0xNUVING1MV1pZWUNwcmNEMHJ4SW9HRVpVM2dwVnRJeWR2Ympi?=
 =?utf-8?B?OHRBNndjd3pzV1duQktTTlJEbjJ5YnhZVEJtdGVZY0lPK3dnQzZ0aXRNT0VT?=
 =?utf-8?B?RWFtWkdTNG5TcFFldDJ1VU5Pc2pLOGxQSXNhL2JGZExvZkxIYjBod0cyU0ty?=
 =?utf-8?B?TXlvT3RYUnhkSDBDL3h1ZVZsTGh2LzFtQzl0c2R5dCs2NUVsY3RwdjFvZHRH?=
 =?utf-8?B?WmtFK09RaFQyRkMzMUVZOUJMTDkvWDhjWlc3UkltR2RaSHNIOUVGT21LTm1Z?=
 =?utf-8?B?cHBGMzB0MlFLVm9WVER0ZGNwcU9VR1FkT0NqQ1A0SE1SQjhkOTRidHJHWkxH?=
 =?utf-8?B?ZTRHZmh3dm1ibElmaFNzZCs1dWFPWXVQQ25LSElwUHVtSWs0dGE4OUhyMWR0?=
 =?utf-8?B?czZHdVA5OU5UTlYvaUpjSDNzWDJmRU93SlN2NmYwdlZxNTJFcTV3NmVIWHlX?=
 =?utf-8?B?b2ZHOG5iTS94SS9zU1RKb1F1cE1CRmpObVRXcFA1aURGdjhzNkt1UTVZaUlh?=
 =?utf-8?B?MGJmbFNxRERhK0tudTladVBTd04yNHJSanZVdHorSkNTVU92cDBFejNWOUdB?=
 =?utf-8?B?MDZYSEZOdHhpeG1OWjBZeFQrUFJGQW9BZTZHam1mN3gzRFkrZmlGaTB1cHFW?=
 =?utf-8?B?dlhoejR3N3JYUmZ5MW9OVC9UWmx0RFN2SUIyaUZXSkFNdk5WZVJ5eUFOWDNO?=
 =?utf-8?B?dEJySzRodjdsZm5YMEY3Y2dyV2drWVQxcHdBcGl4VVk4ZGZnRVBxald1MERt?=
 =?utf-8?B?Z1VFMzY5QmdiZVhray93c1Z2aDlReTJJZUw5K2NmWFMvR3ZBMmRIaEk0MnY0?=
 =?utf-8?B?TytxTTdvYjM4MnZucHhJU1BTcEJqOERZbk1OSHMvNXphM1k3bXhmbDIxVHNV?=
 =?utf-8?B?YkxRUC9XOUdXUStLQUI1a1ozODcweGV5NGxTS3ppeWNjQVhkNTdQSG1UMG5a?=
 =?utf-8?B?MGhSVXh1Q0FmdGVJcFMvQzVnNjNCc1p0WVdRUjliZ0xFWDRoOTIrTFR0dktH?=
 =?utf-8?B?K21hVTZGRGNvOEZaU3lSc0QxMkt5WXFYVWYrNzBtMGRQQUVYaXRTRDVJbzk1?=
 =?utf-8?B?WXV6YkxmYS80TU1pNklwOEQxS3ljeHJOY2JrWXo4eE50d2crSGhXNDhKMGw5?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdfb0da-2dbd-4402-04c7-08dd2f7e0b79
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 00:47:36.3556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e6ZmP8ZgUkg4riBgeIAKez35L40cvXRWCAuF61ROvdTb+7BWkXv8Lhiw1tdKMwlntligeTTf/T2co2uIxwj0VyePuFfG4q4t1pLd6puxlU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
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


On 12/20/2024 1:11 PM, Rodrigo Vivi wrote:
> On Thu, Dec 19, 2024 at 05:19:09PM -0800, Vinay Belgaumkar wrote:
>> Provide a PMU interface for GT C6 residency counters. The implementation
>> is ported over from the i915 PMU code. Residency is provided in units of
>> ms(like sysfs entry in - /sys/class/drm/card0/device/tile0/gt0/gtidle).
>>
>> Sample usage and output-
>>
>> $ perf list | grep c6
>>
>>    xe_0000_00_02.0/c6-residency/                 [Kernel PMU event]
>>
>> $ ls /sys/bus/event_source/devices/xe_0000_00_02.0/format/
>>    event_id  gt_id
>> $ cat /sys/bus/event_source/devices/xe_0000_00_02.0/format/*
>>    config:0-20
>>    config:60-63
>>
>> $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I1000
>>
>> $           time     counts unit events
>>       1.001183454       1001 ms   xe_0000_00_02.0/c6-residency,gt_id=0/
>>       2.004434757       1002 ms   xe_0000_00_02.0/c6-residency,gt_id=0/
>>
>> v2: Checkpatch fix, move timer code to next patch
>> v3: Fix kunit issue
>> v4: Fix for locking issue, fix review comments (Riana)
>> v5: Add xe_pmu_disable() function to reset enable_count
>> v6: Change rc6 to c6 (Riana)
>> v7: Fix another comment format
>> v8: Replace RC6 with C6 (Riana)
> hmm... I didn't like that... in the current way it will easily get
> confused with cpu c6... we need to either use gt-c6 like gt-idle
> is using or keep the rc6 like people are already used to...
> But this 'c6' only looks like cpu...
ok, I'll keep it as gt-c6 in that case. Here and elsewhere.
>
>> v9: Define sampling freq in next patch
>> v10: Use raw_spin_lock* instead of spin_lock* (Lucas)
>>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com> #v5
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt.c        |   3 +
>>   drivers/gpu/drm/xe/xe_pmu.c       | 214 ++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h       |   2 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h |  49 +++++++
>>   4 files changed, 268 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 41ab7fbebc19..64e60bcf131a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -47,6 +47,7 @@
>>   #include "xe_mmio.h"
>>   #include "xe_pat.h"
>>   #include "xe_pm.h"
>> +#include "xe_pmu.h"
>>   #include "xe_mocs.h"
>>   #include "xe_reg_sr.h"
>>   #include "xe_ring_ops.h"
>> @@ -875,6 +876,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   
>>   	xe_gt_idle_disable_pg(gt);
>>   
>> +	xe_pmu_suspend(gt);
>> +
>>   	xe_gt_disable_host_l2_vram(gt);
>>   
>>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> index e6d25e8b7b7c..1115724a580d 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.c
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -11,8 +11,11 @@
>>   #include "xe_device.h"
>>   #include "xe_force_wake.h"
>>   #include "xe_gt_clock.h"
>> +#include "xe_gt_idle.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_mmio.h"
>>   #include "xe_macros.h"
>> +#include "xe_module.h"
>>   #include "xe_pm.h"
>>   #include "xe_pmu.h"
>>   
>> @@ -46,8 +49,29 @@ static unsigned int xe_pmu_target_cpu = -1;
>>    * To list a specific event for a GT at regular intervals-
>>    * $ perf stat -e <event_name,xe_gt_id=> -I <interval>
>>    *
>> + * For C6, following command will give GT residency per second-
>> + * $ perf stat -e xe_0000_00_02.0/c6-residency,gt_id=0/ -I 1000
>> + *            time             counts unit events
>> + *     1.001183454               1001 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *     2.004434757               1002 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *     3.005854217               1000 ms   xe_0000_00_02.0/c6-residency,xe_gt_id=0/
>> + *
>> + * To verify this matches with sysfs values of c6, you can run following command-
>> + * $ for i in {1..10} ; do cat /sys/class/drm/card0/device/tile0/gt0/gtidle/idle_residency_ms;
>> + *   sleep 1; done
>> + *      2348877
>> + *      2349901
>> + *      2350917
>> + *      2352945
>> + *
>> + * Each value is roughly a 1000ms increment here as well. This is expected GT residency when idle.
>>    */
>>   
>> +static struct xe_pmu *event_to_pmu(struct perf_event *event)
>> +{
>> +	return container_of(event->pmu, struct xe_pmu, base);
>> +}
>> +
>>   static unsigned int config_gt_id(const u64 config)
>>   {
>>   	return config >> __XE_PMU_GT_SHIFT;
>> @@ -58,6 +82,35 @@ static u64 config_counter(const u64 config)
>>   	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>>   }
>>   
>> +static unsigned int pm_bit(const u64 config)
>> +{
>> +	unsigned int val;
>> +
>> +	switch (config_counter(config)) {
>> +	case XE_PMU_C6_RESIDENCY:
>> +		val = __XE_PMU_C6_RESIDENCY_ENABLED;
>> +		break;
>> +	default:
>> +		/*
>> +		 * Events that do not require sampling, or tracking state
>> +		 * transitions between enabled and disabled can be ignored.
>> +		 */
>> +		return -1;
>> +	}
>> +
>> +	return config_gt_id(config) * __XE_PMU_TRACKED_EVENT_COUNT + val;
>> +}
>> +
>> +static unsigned int config_bit(const u64 config)
>> +{
>> +	return pm_bit(config);
>> +}
>> +
>> +static unsigned int event_bit(struct perf_event *event)
>> +{
>> +	return config_bit(event->attr.config);
>> +}
>> +
>>   static void xe_pmu_event_destroy(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -77,6 +130,10 @@ config_status(struct xe_device *xe, u64 config)
>>   		return -ENOENT;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_C6_RESIDENCY:
>> +		if (xe->info.skip_guc_pc)
>> +			return -ENODEV;
>> +		break;
>>   	default:
>>   		return -ENOENT;
>>   	}
>> @@ -125,6 +182,63 @@ static int xe_pmu_event_init(struct perf_event *event)
>>   	return 0;
>>   }
>>   
>> +static inline s64 ktime_since_raw(const ktime_t kt)
>> +{
>> +	return ktime_to_ms(ktime_sub(ktime_get_raw(), kt));
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>> +{
>> +	return pmu->event_sample[gt_id][sample].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64 val)
>> +{
>> +	pmu->event_sample[gt_id][sample].cur = val;
>> +}
>> +
>> +static u64 get_c6(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	const unsigned int gt_id = gt->info.id;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	bool device_awake;
>> +	unsigned long flags;
>> +	u64 val;
>> +
>> +	device_awake = xe_pm_runtime_get_if_active(xe);
> why get_if_active here?
> are you sure you have an outer protection ensuring the device is
> awake?
> anyways, please use the _noresume variant... so it will spill
> a big warning if we try to access this and device is suspended...
Might be better to check if suspended directly - will add a change from 
Riana for this.
>
>> +	if (device_awake) {
>> +		val = xe_gt_idle_residency_msec(&gt->gtidle);
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +
>> +	raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	if (device_awake) {
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_C6, val);
>> +	} else {
>> +		/*
>> +		 * We think we are runtime suspended.
>> +		 *
>> +		 * Report the delta from when the device was suspended to now,
>> +		 * on top of the last known real value, as the approximated C6
>> +		 * counter value.
>> +		 */
>> +		val = ktime_since_raw(pmu->sleep_last[gt_id]);
>> +		val += read_sample(pmu, gt_id, __XE_SAMPLE_C6);
>> +	}
>> +
>> +	if (val < read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED))
>> +		val = read_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED);
>> +	else
>> +		store_sample(pmu, gt_id, __XE_SAMPLE_C6_LAST_REPORTED, val);
>> +
>> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +	return val;
>> +}
>> +
>>   static u64 __xe_pmu_event_read(struct perf_event *event)
>>   {
>>   	struct xe_device *xe =
>> @@ -135,6 +249,9 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>>   	u64 val = 0;
>>   
>>   	switch (config_counter(config)) {
>> +	case XE_PMU_C6_RESIDENCY:
>> +		val = get_c6(gt);
>> +		break;
>>   	default:
>>   		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>>   	}
>> @@ -165,6 +282,28 @@ static void xe_pmu_event_read(struct perf_event *event)
>>   
>>   static void xe_pmu_enable(struct perf_event *event)
>>   {
>> +	struct xe_pmu *pmu = event_to_pmu(event);
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		goto update;
>> +
>> +	raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	/*
>> +	 * Update the bitmask of enabled events and increment
>> +	 * the event reference counter.
>> +	 */
>> +	BUILD_BUG_ON(ARRAY_SIZE(pmu->enable_count) != XE_PMU_MASK_BITS);
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == ~0);
>> +
>> +	pmu->enable |= BIT(bit);
>> +	pmu->enable_count[bit]++;
>> +
>> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +update:
>>   	/*
>>   	 * Store the current counter value so we can report the correct delta
>>   	 * for all listeners. Even when the event was already enabled and has
>> @@ -173,6 +312,31 @@ static void xe_pmu_enable(struct perf_event *event)
>>   	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>>   }
>>   
>> +static void xe_pmu_disable(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	const unsigned int bit = event_bit(event);
>> +	unsigned long flags;
>> +
>> +	if (bit == -1)
>> +		return;
>> +
>> +	raw_spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +	XE_WARN_ON(bit >= ARRAY_SIZE(pmu->enable_count));
>> +	XE_WARN_ON(pmu->enable_count[bit] == 0);
>> +	/*
>> +	 * Decrement the reference count and clear the enabled
>> +	 * bitmask when the last listener on an event goes away.
>> +	 */
>> +	if (--pmu->enable_count[bit] == 0)
>> +		pmu->enable &= ~BIT(bit);
>> +
>> +	raw_spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>>   static void xe_pmu_event_start(struct perf_event *event, int flags)
>>   {
>>   	struct xe_device *xe =
>> @@ -198,6 +362,8 @@ static void xe_pmu_event_stop(struct perf_event *event, int flags)
>>   	if (flags & PERF_EF_UPDATE)
>>   		xe_pmu_event_read(event);
>>   
>> +	xe_pmu_disable(event);
>> +
>>   out:
>>   	event->hw.state = PERF_HES_STOPPED;
>>   }
>> @@ -330,6 +496,7 @@ create_event_attributes(struct xe_pmu *pmu)
>>   		const char *name;
>>   		const char *unit;
>>   	} events[] = {
>> +		__event(0, "c6-residency", "ms"),
>>   	};
>>   
>>   	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> @@ -511,6 +678,33 @@ static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>>   	cpuhp_state_remove_instance(cpuhp_state, &pmu->cpuhp.node);
>>   }
>>   
>> +static void store_rc6_residency(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	store_sample(pmu, gt->info.id, __XE_SAMPLE_C6,
>> +		     xe_gt_idle_residency_msec(&gt->gtidle));
>> +	pmu->sleep_last[gt->info.id] = ktime_get_raw();
>> +}
>> +
>> +/**
>> + * xe_pmu_suspend() - Save residency count before suspend
>> + * @gt: GT object
>> + */
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	raw_spin_lock_irq(&pmu->lock);
>> +	store_rc6_residency(gt);
> and here you forgot rc6 anyway...
>
>> +	raw_spin_unlock_irq(&pmu->lock);
>> +}
>> +
>>   /**
>>    * xe_pmu_unregister() - Remove/cleanup PMU registration
>>    * @arg: Ptr to pmu
>> @@ -536,6 +730,24 @@ void xe_pmu_unregister(void *arg)
>>   	free_event_attributes(pmu);
>>   }
>>   
>> +static void init_rc6(struct xe_pmu *pmu)
> and here...

will change to init_c6(), here and above.

Thanks,

Vinay.

>
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	struct xe_gt *gt;
>> +	unsigned int j;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		xe_pm_runtime_get(xe);
>> +		u64 val = xe_gt_idle_residency_msec(&gt->gtidle);
>> +
>> +		store_sample(pmu, j, __XE_SAMPLE_C6, val);
>> +		store_sample(pmu, j, __XE_SAMPLE_C6_LAST_REPORTED,
>> +			     val);
>> +		pmu->sleep_last[j] = ktime_get_raw();
>> +		xe_pm_runtime_put(xe);
>> +	}
>> +}
>> +
>>   /**
>>    * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>>    * @pmu: the PMU object
>> @@ -575,6 +787,8 @@ void xe_pmu_register(struct xe_pmu *pmu)
>>   	if (!pmu->events_attr_group.attrs)
>>   		goto err_name;
>>   
>> +	init_rc6(pmu);
>> +
>>   	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>>   					GFP_KERNEL);
>>   	if (!pmu->base.attr_groups)
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> index d07e5dfdfec0..17f5a8d7d45c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -15,11 +15,13 @@ int xe_pmu_init(void);
>>   void xe_pmu_exit(void);
>>   void xe_pmu_register(struct xe_pmu *pmu);
>>   void xe_pmu_unregister(void *arg);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>>   #else
>>   static inline int xe_pmu_init(void) { return 0; }
>>   static inline void xe_pmu_exit(void) {}
>>   static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>>   static inline void xe_pmu_unregister(void *arg) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>>   #endif
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> index 2b3f8982023f..f47a6e1b109c 100644
>> --- a/drivers/gpu/drm/xe/xe_pmu_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/spinlock_types.h>
>>   
>>   enum {
>> +	__XE_SAMPLE_C6,
>> +	__XE_SAMPLE_C6_LAST_REPORTED,
>>   	__XE_NUM_PMU_SAMPLERS
>>   };
>>   
>> @@ -25,6 +27,26 @@ enum {
>>   
>>   #define __XE_PMU_PM(x) ___XE_PMU_PM(0, x)
>>   
>> +#define XE_PMU_C6_RESIDENCY                    __XE_PMU_PM(0)
>> +#define __XE_PMU_C6_RESIDENCY(gt)              ___XE_PMU_PM(gt, 0)
>> +
>> +/*
>> + * Non-engine events that we need to track enabled-disabled transition and
>> + * current state.
>> + */
>> +enum xe_pmu_tracked_events {
>> +	__XE_PMU_C6_RESIDENCY_ENABLED,
>> +	__XE_PMU_TRACKED_EVENT_COUNT, /* count marker */
>> +};
>> +
>> +/* Global PMU mask to track enabled events */
>> +#define XE_PMU_MASK_BITS \
>> +	(XE_PMU_MAX_GT * __XE_PMU_TRACKED_EVENT_COUNT)
>> +
>> +struct xe_pmu_sample {
>> +	u64 cur;
>> +};
>> +
>>   struct xe_pmu {
>>   	/**
>>   	 * @cpuhp: Struct used for CPU hotplug handling.
>> @@ -67,6 +89,33 @@ struct xe_pmu {
>>   	 * @pmu_attr: Memory block holding device attributes.
>>   	 */
>>   	void *pmu_attr;
>> +
>> +	/**
>> +	 * @enable: Bitmask of specific enabled events.
>> +	 *
>> +	 * For some events we need to track their state and do some internal
>> +	 * house keeping.
>> +	 */
>> +	u32 enable;
>> +
>> +	/**
>> +	 * @enable_count: Reference counter for enabled events.
>> +	 *
>> +	 * Array indices are mapped in the same way as bits in the @enable field
>> +	 * and they are used to control sampling on/off when multiple clients
>> +	 * are using the PMU API.
>> +	 */
>> +	unsigned int enable_count[XE_PMU_MASK_BITS];
>> +	/**
>> +	 * @sample: Current and previous (raw) counters for sampling events.
>> +	 *
>> +	 * These counters are updated from the PMU sampling timer.
>> +	 */
>> +	struct xe_pmu_sample event_sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @sleep_last: Last time GT parked for C6 estimation.
>> +	 */
>> +	ktime_t sleep_last[XE_PMU_MAX_GT];
>>   };
>>   
>>   #endif
>> -- 
>> 2.38.1
>>
