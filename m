Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FE1CA0FED
	for <intel-xe@archiver.kernel.org>; Fri,  5 Sep 2025 21:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A1D10E364;
	Fri,  5 Sep 2025 21:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HWNUTtqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E42810E364
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Sep 2025 21:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757108314; x=1788644314;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L3ORrI8TF31lEUkhpSpDP0Fp+HBC13nsIn4YXXH8GC0=;
 b=HWNUTtqeGAFvPV9TSWZ0QU5NsErRXC69vvSt9evtz5vIGopuSY2gYwf1
 G/agIJlWo2H/MNtQZpJVmLvOnm1ucentkuZfQrJ/XU8mhhuMAR3LaMVFF
 2//vwFcJAMntRnRPYc9xftE2BUOS3WcYQODIxMszVqcRd2l65kCgIwcwM
 PKsxzs95Zm2ofP2m3Q0hzU4Xi5cPA8hgAMDNbbkDp4esgO1vzbBjdLo0O
 hJVeTX41QfgoEXbKh4Yga7A03wRVolcSJvSn+euJ17qEKEu/M5gTovGac
 4mAmm+ymaeaccrJRJaXDoqL4y/xvb3ccPYgKkT8DJsYM2KGb0nasGdg0Z A==;
X-CSE-ConnectionGUID: 85nMV71WQSyipDReIRv3bg==
X-CSE-MsgGUID: 3Fe2S9OJTGG3K/GOVQZ6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59572594"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="59572594"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:38:34 -0700
X-CSE-ConnectionGUID: e54n4lR1QzaXK1ZgkKq8Pg==
X-CSE-MsgGUID: wmGNQHXSSKuu+lhe/FbIDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; d="scan'208";a="171453866"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 14:38:34 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:38:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 5 Sep 2025 14:38:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 5 Sep 2025 14:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oXg54jiQ5AgrxrHmTMGFXw8dbxyeUcX0Y95mAbMcGM1qd3ZmXyit3F94Y4WYG7lDM1LsO8VhyMf2EUAQTJ7v+tzLc0VUXcgmMkDGr9VOBKGkcoQYxWSEyXZ7u4wVfnTYIPbGTrCE67VTf60NXfuPJ4ZGvmz/FS9lt88iom73epxh0i0P0vjbIJVtV+kgpmjr8Chx5M2vZPrLYh3zTj+LkLdkQcPQab6XMsey3eSB5a5bXXNi66payhs4nKwhtZWoSLXZOO0SDTb9ialC+7ttWSr8WCMfVCqBZFMBpdJb53Ldkmqh7aHrs2QCZxuB+cQsmfPAX35LnTQBgC+bszy3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdVv39JJ596zqFLB8vUsEcumrOvtTasaYSZ+qP9Gmi4=;
 b=u/xwsT+gN8+3LHGPlT+GaVMK432phijt1dYHJnURberPa1dkizD7jTCBtgnHZcoTipRzMn3h1305NGs/hTrWoa6toQ+jKCXJxHYHzHQTZxGRpZUDj4ZXU/o9gMF3JYiQAm6g4J3K18epBTU61BluVhD+r0Z73fW13iDClOwVgaUbiaOcu3Aht4tW+atF+W8M1hCkRFaphsbMG8XrQJb4T2U0bJwnI3o+6v1qmYNHX+Az9GDkKAmwpGnf761/gL2+MsEOUmT5Sw0I/bln+mB4zh2dVZLHptvvQFmQA5ssjSKlSnCuT11lw/gaE//uREgVw68Vh+waWPjKJr3g5vJiCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Fri, 5 Sep
 2025 21:38:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 21:38:30 +0000
Date: Fri, 5 Sep 2025 16:38:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/configfs: Use config_group_put()
Message-ID: <y2dhkx3yplrpesqlx63d46y7w5zjv7w2cj5h262p3jq5vjgp2f@dz2bjsfce3qp>
References: <20250905162236.578117-2-lucas.demarchi@intel.com>
 <175710134539.5916.1325336923027423466@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <175710134539.5916.1325336923027423466@intel.com>
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: f861e4a8-0ca4-4a22-3df4-08ddecc48e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nbLQf1U6o1kTB+6NBcWHjR1FKI95Xnc0Ky7KKQEuC7QRScXNsdBBz25LE2Ls?=
 =?us-ascii?Q?TnGVHhntVieJBaHU+yuDT5ci7t6uUZ7ZwYSuIOu1M2kJMFDhQvXB6ZkH73v8?=
 =?us-ascii?Q?JPrz2MJiWIvDk9GIFPPiX+E/ft4ENd0TLb4tnHdZx4rwKVTeFSaxDYM45Ezr?=
 =?us-ascii?Q?z1jbA41/MX8uKo0JojWUTQQO9C1gDaoeiN6PdEBO+gnZfBCuckuyMXcLFjhP?=
 =?us-ascii?Q?Q8dnm5kMIwvhrs0uVt8L2ZyqxQ61FMoz6IppJGhxU+AhKSi2VB79c+hemI1E?=
 =?us-ascii?Q?5YPDQkz43yl14/F+sHEPxfgqFC2ln0b+ZEqwsmghO5hV25W4j+V5UfvfgkJN?=
 =?us-ascii?Q?lYBALvbA7i4uF7cRbGuREgxOXiscrsmcMMMPYZ/XhwDIoW4tTN+9OndrRBJd?=
 =?us-ascii?Q?yPO/AY4I54Fo1WeHwxfxe0OGt7qhZaOB1W18+Bu+r6txkUOxg935hjA9xMes?=
 =?us-ascii?Q?AoYGtHuVbwu0TYIhmlEXB9GMCPKyR6P3yb3MwvMyYEcY7JopQAaO3kOmZnNP?=
 =?us-ascii?Q?ueIMqhFf425fA71bfap3GdMYEUVM+qm8AAvMN0Ijpe53Rig40EY9vFuBGQMd?=
 =?us-ascii?Q?JThgd87RRfAfQavk9Z8KuFMcDIafJC22yfw8E/WOca5ZKqTxqmRsMwOF8Qya?=
 =?us-ascii?Q?GrHnrdU1/PWPJ4aRL9mUlGJdWSvRnQtw4K+YltSKajO0jYF+SipnNNpsjRax?=
 =?us-ascii?Q?Isg+2qQkyb+7Fm9dz9p+5zKBBPM9JDVSYcbqTpUvLzJH9bSsJ7IV/4UEd5pP?=
 =?us-ascii?Q?eolmgthEFgK1EEjRwxm0GUhulvfoy3Ud7wxh+7PSHdpMzOPedRHOR5UzakuW?=
 =?us-ascii?Q?FoyGrCcKA4jEzt+TiheBFVn3BFS44WqDiCVznP452mHSmcQvKz0G883rO4S/?=
 =?us-ascii?Q?W/Z2He+OTOlM2/Dpte8lkAtFd/zQYec7Sw+v+0nhDkUAYf3VTsV03amq+DQB?=
 =?us-ascii?Q?jvhfHj5mKK9qkUTR4BO5gBV/iq30nLN3k8SzXvqpy3m/dEZJHvZYY9JJTN8T?=
 =?us-ascii?Q?JcczPWthbmjeaAHaftVcOtbItI4b92FhIvj+/lyocr00cZOm/A3TJNRjIdG4?=
 =?us-ascii?Q?oENFgYYL9OPIRwJAjPtA7PD7T9jVhlSvlEun5RLTZADBQciCiiNXIpITucKT?=
 =?us-ascii?Q?MP791+74iFAX4iclpiepHwaeUUDelP71KVTOW042Y76dCQ6Uq2Vl+U6PsH2s?=
 =?us-ascii?Q?p5s1E1h60wFttA5Q64LismSKY2Eenk1BQTk2UrGJmx4uVc2N6rNTd4YaFMvN?=
 =?us-ascii?Q?4toKDdhUcKo08IvCAlCrM0ka40RslNdMo4egCKU/HRTjK6yz5Xcv+/3Wcm6l?=
 =?us-ascii?Q?B+nbzZNp6i0Vujno103VjILwWFHNkecqRdeT1vGgnlp1+mMi44K7CHxKXrp9?=
 =?us-ascii?Q?r6TT8TPmSP+B90BHbgFER77caopTvn7Hhl6huH9gcpfVc7qKNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EY7lqibBipbVgJKUh4/0jGjTw+89OHvRPTZ8e23yXIThqAgGNa+5m/yTAsu7?=
 =?us-ascii?Q?hso7qgRSYnG/fsdkFyqqm5IVml/Ecz7yZsxhYDU3Z4MTxPj8AcgaE3/LLkK+?=
 =?us-ascii?Q?zwP/9qVea9W3GhWXY1Gbg/hxjXurXhALUDgsIXUOHID9Bb5JPE04wxdvSPfb?=
 =?us-ascii?Q?HDiqcOJo9QyGIZss90XvXHyzDCTW3Nht3eye72m02HagnjREA6sKNutmbyiG?=
 =?us-ascii?Q?kh2wtnPumBWeM3k0lmCy9tL7FG0w1Y+6Zz5WJ4i3DlcMUlgfH4Gyd52rJglj?=
 =?us-ascii?Q?pWuKJebCy15MOiK7ll2UKXx9yrmMC0RYqSCutS1NSOjn5kQZFRK1c+Ma9qHG?=
 =?us-ascii?Q?hxtOcpaCW+lKEBzGdP0dnZOu2uvFJ8B+IBiISPY62xSh/Fqy1sKIfWSU20Sy?=
 =?us-ascii?Q?Pk93TcL3RMLS95sVoLpNSDnjSlinEAX8RRW34nEuTGPanRVlBIEaqwtbpIji?=
 =?us-ascii?Q?3pHt0RVjQRL0Wj3vkGDtu6tU/fFhidugmGgxfjCSwKuju8Uv9cDFOHnrBHYN?=
 =?us-ascii?Q?YstxOF8tEg/fHTFQD5Y4x6tOCAg4N4U7e7PgZJGV1/4wmmVux1EWWTA/hBkR?=
 =?us-ascii?Q?AcefvR3nJvwW6rOVdviP3GCqYwZuKxRtayQSImZFFHym2di9jZWp05A9twv6?=
 =?us-ascii?Q?1ntpWNZeMiSd1HAvrIQd2MqrW03BCINQaCvCESQgmGmSks7VV9QQR+MXViXP?=
 =?us-ascii?Q?UzDmTYwBiyZQL7y3IGSegct1mIAKdcvwUC9XpjxkGr21mOcBxFB9mAgHowO6?=
 =?us-ascii?Q?0fvknYvcmOIpwIknBdSN3D9eg7zUTLhZR7K4KzjzKVFlUEWquN2Q4IypcdBI?=
 =?us-ascii?Q?uZ7KpsfWGI7QhoY62lc/VlV6eTqikLdXO3sFFW3p5/ukt69lum8e/fOotIq1?=
 =?us-ascii?Q?vLD1DXSCLZ5Dey+T2v8t+D45SHBc+HkFebdIzYT77LThwlVNJgmKeeyd93VF?=
 =?us-ascii?Q?ikS8gv29k8oPv7mMr6khccn7NJRxGCPbfyobcmH+bXO8suTkZ1CsfLl41Pzg?=
 =?us-ascii?Q?ThFziB8kNc2Ba15lENhN0F5iipCr583rKl8TMN3ezKbqCCUvbQ9V7ejCkKbw?=
 =?us-ascii?Q?jLtBFVCha1qsNqPyPlWo0PHW4251Dpxl0JKdsZVjV2B9HlrUWNQK0D9I8HmC?=
 =?us-ascii?Q?Kib1cWJUXZTewsfuFNhOAwIb+InJGX7AEV+9fe4q8hlpP4LXX+Rrp62KNFDK?=
 =?us-ascii?Q?zjlQDgCzD6mnpVplPxrHE04haUIDXKrxZ8+l1KGkOYLOeZNFKfCYNpsz57dT?=
 =?us-ascii?Q?tcVoz6BL1MTQtJXPDi3XSV9xuoeZiAvSGwCc1/7JrqGF0AZPANs+ezgoAjaJ?=
 =?us-ascii?Q?rrEOXraMCA/hRizpjpKxNgn19xYxJuobV6j2WcN8kdn4yQSE0rCGb9TzxpR5?=
 =?us-ascii?Q?MkVcGonfEYn2ekIscI/gt8MQIwMl868hypESDz3pBVVJfLYmS3NZ9o7vfaCB?=
 =?us-ascii?Q?3bvn4pUUoDsIreKjl5UIeJFbAUNA+nC5/Igl4kH9cgXimElLP5mUGyjdC+lv?=
 =?us-ascii?Q?wYlOPY5dPbEbMQy72WwwvGz95mF0IxyLngiHFsepkk2k1tKx9WbDzUnhwo4D?=
 =?us-ascii?Q?eiWtFvqM/b6m8JnppByAWHgvED7kh23RThGP91UhlOirbCY2jz42FnqpylSR?=
 =?us-ascii?Q?OQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f861e4a8-0ca4-4a22-3df4-08ddecc48e6a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 21:38:30.4814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X7LlWpnXY6j9VEGAWN9iJ856E+XlbrWUYYxw/a+q9mRyR7AcR7UmsOQFvILw3sVJeG+u5M3CJBHqVtpgDQM/K+62LN0dEj2at+LfXNTk9GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7169
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

On Fri, Sep 05, 2025 at 04:42:25PM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-09-05 13:22:37-03:00)
>>configfs has a config_group_put() helper that was adopted by
>>commit 88df7939d728 ("drm/xe/configfs: Rename struct xe_config_device").
>>Another pending work to add psmi later landed in commit
>>afe902848b41 ("drm/xe/configfs: Allow to enable PSMI") and didn't use
>>the helper.
>>
>>Use config_group_put() consistently to hide the inner workings of
>>configfs. No change in behavior since it does exactly the same thing
>>as currently being done.
>>
>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>By the way, after taking a look at how we are using configfs, I wonder
>why we are defining each "device" as a config group instead of a config
>item. Shouldn't defining them as config items suffice?

The xe_device maps 1:1 to a group, i.e. the <configfs>/xe/<bdf>
directory. When setting/getting a file (aka item, create from the
attributes), we find the group they belong to and use that single
lock to synchronize:

		  1:1				1:n
	xe_device ---> configfs_group (xe/bdf) <---> configfs_item
				`->lock

Lucas De Marchi
