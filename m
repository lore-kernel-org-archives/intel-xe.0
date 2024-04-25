Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD5A5C4345F
	for <intel-xe@archiver.kernel.org>; Thu, 25 Apr 2024 13:10:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9041B11A44E;
	Thu, 25 Apr 2024 13:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NI1B2aj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FB911A44E
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Apr 2024 13:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714050634; x=1745586634;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hyoUmJyVRwiT5KO1WpKH0TTZETNOHjzrdd8BzSU3tSc=;
 b=NI1B2aj3UNwfzgRpy87lQmIaE0Tg8PV1x37CDSQXcZzFgXgpiW+Utb9N
 p89Vx4DM9Yg689nbz2LyeSlXJTymD1ARJmHr1la72/wLvY0amXqYSSVGB
 a7R1SRJdPN7Gn+YaygCBw7fz2je8WW1z+xa3y1rANlGRj4sWuQ7NDWhi3
 31yQYatD/3UlXftOAsJoC7lp44yz2vMB7vlCR2oCMPRVuaW7JaifmSCM/
 HTyF6SdrYvzkpn3B3Y1QgVinxcyIP0AqdVdG8agJTW24gDAyr8u9elVNN
 hB4rYnNHCorJQrCbwMn3Reoin1niM18PurItHa78WM5DYB6H8/aP1BmGB g==;
X-CSE-ConnectionGUID: piPQnaQHSyiWLYONJhog8A==
X-CSE-MsgGUID: ELlnU6HzRJ2vwstgqDsMTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20280569"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="20280569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 06:10:32 -0700
X-CSE-ConnectionGUID: d9q/OXMQTSGJzb6hkpNgoA==
X-CSE-MsgGUID: BrFoKcoBSY+K+W1GDtJWdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="29535554"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Apr 2024 06:10:32 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 06:10:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Apr 2024 06:10:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 25 Apr 2024 06:10:31 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 25 Apr 2024 06:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUDoUXoem0Rg1vjfsHWxjZIYmIL07zFPyAiNIGWD9vp+trG4dbmdSmTkxsiCbGTcTF7G51ivKSYATJ/yhmOtnkRQhxlHzQ9MQVawPBfRHaZ1d5d7V5v1ojrS4DSmJIV+reWz2GA8K2FgEdR8RqiBgMnPgTiLTW92iyeioiK1aR1mkKKgDAoyCd97RXg1xmPzdi7yIFBrqYAON9hk8rOowqK7TsITfiecEXasAPtlBkxm6t/fE178ceuA4gTZ57U1GmR8zOrrHelUolEmUHiOpq00DAGsLK43yE7Cu2+M/KnYrbKalqa3CQ1fkD9RKOzuV1Hsox0bXDqK+gvY7tmHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwIVhg0nXipLyUxxblcdBs4US3kpk+uiPF1EkqrlmHI=;
 b=UFbW4jqoCGi6sidYm8TtdDrsjIgUau2yo11eVhwOqQKv2E649PIodqEMkGQAoH5SQzoC+3/aCQdfokvdfwFfuI8oP7U96B6lbCUTuriQrA10If09JBOfRKAp4Fx+RexBlLjpg/F31OneNwh+cpRaR7uOQpdJpp9/HXoNvMHtNt4WKfmmr79z5zsGuS+u7FvmuKoa0DOZsAh21EmB1v89Jsk2uFGUcamv2fepOGl1jJrm9l9rQf+N6wK1hCEeY5mT3OjTxhcqDdobCMakUEsfyIMU1m5lPIvoLIX89R2oSS5MlE7SWeTawONA9TDlPUXr/pNl678kDdU7PQn9upJHJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 13:10:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7519.020; Thu, 25 Apr 2024
 13:10:28 +0000
Date: Thu, 25 Apr 2024 08:10:26 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH 12/17] drm/xe/oa/uapi: Query OA unit properties
Message-ID: <yg5xs4zqutz2qmaeingpennxj6n7da2jqjl3f5d2i6o43n5xuk@yo3cwwfkv7ec>
References: <20240315013518.2848986-1-ashutosh.dixit@intel.com>
 <20240315013518.2848986-13-ashutosh.dixit@intel.com>
 <851q6umjez.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <851q6umjez.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:74::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d84fbb6-c021-4a14-82ba-08dc6529142e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ijFXJwy57GH4FhL7ZjtpwzmkkUqIaHotzaXHkJjOHnK9tZHRCaq+gS8Q9jkq?=
 =?us-ascii?Q?v6gfhYQo9mJJBBtGZaRHz375lWI9SxjsVs6jzJLMymojlaYoOLA0v08l1bpF?=
 =?us-ascii?Q?F1qudsVRv9D3YK42cWfM6hgnxaPQ6J/w36nf2iusWZMVps8cFXTtvT7dhd0o?=
 =?us-ascii?Q?CjXI7tvmLWD79ZQ5lN6TgYs6ZK0NZsFDOn+WB2pGW0o+dwo/fu+Ck0zZ2Qtn?=
 =?us-ascii?Q?cMs1SclBs1VXXLjUKuvPfWkO25XDA4w2U9siULwVVOAAFayC31W/2jCKoHEJ?=
 =?us-ascii?Q?TQig6CIRJclGk3cypG4jjIb7QeTWHKrSDSHuU/9hlJ/wahtnfq/r2qydic5H?=
 =?us-ascii?Q?WcKclXN3SaOtgM9da4imbEf+FrSfxbJV5nqydB00y5bVrKWLfXvXMPn5Z4XF?=
 =?us-ascii?Q?kW2NHwkQbjytG2+KnUSrz2ztJcMPnm33yxAhF7veZVn/1U9TurhKPM5scPij?=
 =?us-ascii?Q?loZPxKjLZgTFllkj97g3s4inRgwKTbvsczExNvtkGe10rpksKGoKGl7fj3TX?=
 =?us-ascii?Q?ATHhL699Rd3uwsUxmAtVVnbk0ckIrcMQYor/wFNrmP0eXSsm0vuBjqZp4Q2k?=
 =?us-ascii?Q?R3ghxhsnjWyDSn5JB0Q3n1PZiZLXvteyfs6Z5kvFunpXvkfZgBU9hFSXmPhE?=
 =?us-ascii?Q?HzTqviotchB14TOJQO02DaaM32eij6THV2OLEMcJqjm73PLBwsHDfrZ/kGmV?=
 =?us-ascii?Q?ObKwVhzE3cy05jCHiCGr8wsWEmhD/peiTn63B6+UGpdVX2a3yyLqP/P+PZcC?=
 =?us-ascii?Q?RzSn+i5TKuG00kgfTNr7abxUsSjnZ1UT0YRy1A4Shh9CLKU38EblRwT0MT8i?=
 =?us-ascii?Q?HhYWQrtfdtgiqq688BJDU65tmRnIevn65Cp6ehw6mW2A4PfwWXDHpPjTxVtR?=
 =?us-ascii?Q?zOPJFs9VGpIkSMlnzEn0aF/tU4DkBpCNwPTudway76qQFP8g3fbAGGricAsE?=
 =?us-ascii?Q?4ZOkUh4QrLOUph2SiFjIqDGfEuPAabeCRS4kuWILFwN9dhDixheoGyxRu3mh?=
 =?us-ascii?Q?t6hecnaDZnjZPR2paCysdYDdljxCSf26EKP5eoksuqz5CFidIPNd/cr8CQCE?=
 =?us-ascii?Q?QjkzH3DGkMByOgwkmWRbF/gLWwLlYU87o8a0PZadP3wSYuwazUHMBtdwt2N+?=
 =?us-ascii?Q?C+F87Vmsy7jWbY5VWvr/IcgzaHD3YuVzigH6JdDHXm3P2VXwYPGcUhtCcf8L?=
 =?us-ascii?Q?NtEvNOGm7woS/E03BmMzxdC3065Cramk5SxuQHbiwSu5qmA3DxuW0ZHhqFI?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lpn/5fH8rjq1gPJ+WEY6SligYaY2LA8LlwzG2kYUh0OCTG+O8MitOZHoeL9j?=
 =?us-ascii?Q?u5vxGP2kkOLCmRP26PjfTqkryysntXaBtW8lSel9r/m6iyajXzUThu9TEzHm?=
 =?us-ascii?Q?9AuURVRJUscT+03Bt6xqbVvwWQRTU2cbhxbOPTRa5A1esJ9zxUMxrTr4u1NW?=
 =?us-ascii?Q?5g/Rgy8CoU50y7zkHBJr3vCn3znddedYRWSFC/P1GrbnJg/9rQCjp8YFBwyb?=
 =?us-ascii?Q?89qP4nKWlA3MhyaMnj5isn3th6ePHIzuyFqgi6T2l9MwxWAU75aUU/9UjErx?=
 =?us-ascii?Q?pAXf1T4ZC1CNgaf38kJ+RLhk2kEAh6l5SGc0fxjvkf9ufhugvUyPiB8Ca1jc?=
 =?us-ascii?Q?vy1hkBbL5X3nNBFn9ghg65+9kw+tfmK+orzhrMOEGi0zLhLWWOAmMyelmrB/?=
 =?us-ascii?Q?LI/YIw+MenTz830USngUSvw1zhxLpi6Gw9oskCbvzobF6G7BykwtbfhFylE1?=
 =?us-ascii?Q?degr46tiiv+EDOIRx8UyefziFgGIomTtaoKc8zGRy5hrQO5CsZNAljdmVydY?=
 =?us-ascii?Q?ECy5U2dTsGGNfofwerrQSCtJDMUjIAP6ftmtHsSWFwDgZ8E2P4KAZ21LkuzJ?=
 =?us-ascii?Q?luXsx7jLLCf7Q+BOwXkINHEC+XwUBA7yYOpUg431cYHlSzs0vRLCpAAa2ymg?=
 =?us-ascii?Q?glMT5aSI7trX2FmYs1lJPJh7GwH5S9ql4h5WuNNh0sQZZ/SW72uJpwJlH1Z/?=
 =?us-ascii?Q?8LakLEvgV0IvL7+/vqL0DexC8x7ihU0jSMbQmVQ+0Q420vJj7FNP2T5ZMzDV?=
 =?us-ascii?Q?iLOlCuKKdxoKv8nA7vChV+77bl2hfjrQTJ+0ITnxUYAucqQvdm+3heIUoCyv?=
 =?us-ascii?Q?K3XvlC2xzc6HXgXraB7l4AEtB37/XMb+fOcfWPCQNvqIcUrB4UrYeKjdxGdK?=
 =?us-ascii?Q?3F0SPnCgXnPARDgLFcOG0aaGkieOIP8kUy9T4D4e7TqQEdaMlOo21ntrQ3Nz?=
 =?us-ascii?Q?cBJn0ZdN0HlwxX19RO8FRN223saliDP8+CgWjfqaq3n32c1DvGUwOWkdb17n?=
 =?us-ascii?Q?rv4pemSSbsTxe7XS3IK8poCDdYwMBNlvKlTJRNdNo3tXHhCBwnMJjLO0TFun?=
 =?us-ascii?Q?joNVQafZ4UaNc6YHjOB9BcMfJMfdtVdvxzNm4SkUrAoNMw8UlaLqRpu6dsjO?=
 =?us-ascii?Q?T/AHnvmSjuedUoO61VYLKd1ovcNuNZ9hlIE/VcdAsjp+I9BiKEaCWog+NWFt?=
 =?us-ascii?Q?MMPfumDgqYIaXPqsrnOtKiPy3Ig29wzV1qKQMT52V/7VKDFSWfcqEWgiPZ+v?=
 =?us-ascii?Q?ALwHHOVVCw+ioLGvednaj7tghLIJQ/dIJ2IHsGsxT4PBYiM36IPz1O5iJR5q?=
 =?us-ascii?Q?lCXSybYvINJwgGZUMSqLegThrZ+Uxxj2SGbYlwrHO34yabthmIVxOvgDRagm?=
 =?us-ascii?Q?s4xbrugZIVrXhktZbo8IVAWKJ9scUSaPKM8kWP4eRNtwtrZVGgSyrRTtlAqM?=
 =?us-ascii?Q?qAFSmrSN0ON+yrJmMpCeLQNwrzDpkN+IsPxhGzpz7fN6NZIQyQpMNJzPpQC1?=
 =?us-ascii?Q?QFLWjQ5hkKF4//prEevdqkrqIL2clbFamxLV41X/s4JrwJeHCOW0Buf2csia?=
 =?us-ascii?Q?1hAE1BhRsQdsVR2np3kH0kHPTLA0k+rumpnKcqr0xfV3LD9Gh19Qxo3O/B/B?=
 =?us-ascii?Q?fQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d84fbb6-c021-4a14-82ba-08dc6529142e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 13:10:28.8414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82uMZXUSO07m47K27PEz96NX3ASW5/Q6Fk/lDn9FynCeB2UhjeVBM5Ls82UAX7qMVsEotSrzcmDDFMVnAWXW0Il10RWJ8dbMyFpbzlStmfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

On Wed, Apr 24, 2024 at 04:26:44PM GMT, Ashutosh Dixit wrote:
>On Thu, 14 Mar 2024 18:35:13 -0700, Ashutosh Dixit wrote:
>>
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 4bfa06ebf6da..54d0912f2ba8 100644
>>
>> +/**
>> + * struct drm_xe_oa_unit - describe OA unit
>> + */
>> +struct drm_xe_oa_unit {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @oa_unit_id: OA unit ID */
>> +	__u32 oa_unit_id;
>> +
>> +	/** @oa_unit_type: OA unit type of @drm_xe_oa_unit_type */
>> +	__u32 oa_unit_type;
>> +
>> +	/** @capabilities: OA capabilities bit-mask */
>> +	__u64 capabilities;
>> +#define DRM_XE_OA_CAPS_BASE		(1 << 0)
>> +
>> +	/** @oa_timestamp_freq: OA timestamp freq */
>> +	__u64 oa_timestamp_freq;
>> +
>> +	/** @reserved: MBZ */
>> +	__u64 reserved[4];
>> +
>> +	/** @num_engines: number of engines in @eci array */
>> +	__u64 num_engines;
>> +
>> +	/** @eci: engines attached to this OA unit */
>> +	struct drm_xe_engine_class_instance eci[];
>> +};
>> +
>> +/**
>> + * struct drm_xe_query_oa_units - describe OA units
>> + *
>> + * If a query is made with a struct drm_xe_device_query where .query
>> + * is equal to DRM_XE_DEVICE_QUERY_OA_UNITS, then the reply uses struct
>> + * drm_xe_query_oa_units in .data.
>> + *
>> + * OA unit properties for all OA units can be accessed using a code block
>> + * such as the one below:
>> + *
>> + * .. code-block:: C
>> + *
>> + *	struct drm_xe_query_oa_units *qoa;
>> + *	struct drm_xe_oa_unit *oau;
>> + *	u8 *poau;
>> + *
>> + *	// malloc qoa and issue DRM_XE_DEVICE_QUERY_OA_UNITS. Then:
>> + *	poau = (u8 *)&qoa->oa_units[0];
>> + *	for (int i = 0; i < qoa->num_oa_units; i++) {
>> + *		oau = (struct drm_xe_oa_unit *)poau;
>> + *		// Access 'struct drm_xe_oa_unit' fields here
>> + *		poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]);
>> + *	}
>> + */
>> +struct drm_xe_query_oa_units {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +	/** @num_oa_units: number of OA units returned in oau[] */
>> +	__u32 num_oa_units;
>> +	/** @pad: MBZ */
>> +	__u32 pad;
>> +	/** @oa_units: OA units returned for this device */
>> +	struct drm_xe_oa_unit oa_units[];
>> +};
>
>It has been pointed out that the doubly nested flexible arrays used here
>break compilation on Windows due to this MSVC issue:
>
>https://learn.microsoft.com/en-us/cpp/error-messages/compiler-errors-1/compiler-error-c2233?view=msvc-170
>
>Umesh had previously already pointed this out here:
>
>https://patchwork.freedesktop.org/patch/571290/?series=121084&rev=7#comment_1048210
>
>In any case, this is considered unacceptabe and needs to change.
>
>Current options:
>
>a. Include a "next" pointer in 'struct drm_xe_oa_unit' (suggested by
>   Lucas).
>
>   This works except people not familiar with the MSVC issue might wonder
>   why it is not simply an array, or why we are using a linked list
>   construct for something which is actually an array.

it's actually quite a common approach when you are parsing binary files
or protocol buffers:  you have a header that points to the first item
and each item points to the next one. Extending it to this query just
seemed natural to me, but I don't have a strong opinion right now on
which of them is better.

>
>b. I am thinking another option may be to just do this:
>
>   diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>   index 03c559af2027..6c864dc1b65f 100644
>   --- a/include/uapi/drm/xe_drm.h
>   +++ b/include/uapi/drm/xe_drm.h
>   @@ -1506,8 +1506,8 @@ struct drm_xe_query_oa_units {
>           __u32 num_oa_units;
>           /** @pad: MBZ */
>           __u32 pad;
>   -       /** @oa_units: OA units returned for this device */
>   -       struct drm_xe_oa_unit oa_units[];
>   +       /** @oa_units: struct drm_xe_oa_unit array returned for this device */
>   +       __u8 oa_units[];

given the expected use is to use just as an address that is then cast to
the actual type, I think that should work fine even if it looks ugly.

One caveat is about alignment: we'd in theory need to make this u64 so
it matches the alignment. Not a real issue here since all the UAPI
structs have pads to cover holes.

Lucas De Marchi

>    };
>
>   Though the next pointer has the advantage of it being simpler to reach
>   the nth element of the array.
>
>So I am still trying to figure out the least hacky way to change this. If
>you have any suggestions/opinion about this please respond.
>
>Thanks.
>--
>Ashutosh
