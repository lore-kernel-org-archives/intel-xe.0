Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0960CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 16:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501DF10E957;
	Thu,  6 Nov 2025 16:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G4EAYEX1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28A510E957
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 16:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762448128; x=1793984128;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zOBjyJlaoaEsnmGwSWEokY52Uik51cBT64bvCysF0kk=;
 b=G4EAYEX1TmmwojV/LbWjaVwSvrjkrBCdn7bSA3Y0Qhb45KXUSf2dVBga
 bspEFYVM5i6oguee54np5yoNxIi5Ds5jDlbpFa8jQt6QwpGaFvsPYpHQE
 4QD1zLT3HikC1yByKDBmBwtfkyCNNoZvqol+Mq9hjjrMaKfs67YSIVgt0
 yUrrkMCLKwIkhxnxwevq2BI3BBMjDePcIZURUR+J4X7agBdq0njcpljlE
 MYODnM9jGoc5Hpt2dKdTAK96hIFKDS1ZvVl+TutrkYMMofpfoz9hsxeQN
 Yc614xAF2EvB2uzaxrsCV50+7ZFpbI+wixAobXGGfWeQGgWb6MbpZowV9 g==;
X-CSE-ConnectionGUID: LHnbwWZ1RR20hU9/vAQx1g==
X-CSE-MsgGUID: XG1f0on0QES4mFMuDE6IeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64519126"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64519126"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 08:55:23 -0800
X-CSE-ConnectionGUID: +2GsiMtnQGuZMg4/aIjswA==
X-CSE-MsgGUID: 2hfMKBAJQx6X6a3Gv6Q9fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="191902159"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 08:55:23 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 08:55:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 08:55:21 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.6) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 08:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVZHiKxHoIjhRqR90malXmX2QhBrgg79kyckrPszjM4MZrIt5HqiaOpVbPAQyCU4BxhxwB5xo08EFKq1MIJ2Bv6TYBMfEHiWzxxJE6G+b1OYb4y1BcIB+Ses6xEQP0rKRZeJ5Me+l23Ba7yrDgRXmxk0NGanQo9fQdfFaO467cm8L6FoQ4zuRO0XWCsnxmrnF1DGfVniez4s8kHIMzS8Yv4ISV9PBc6Ka+3NMuWQ5wiDQZ6LmmV8hJNKRqNrN7ql9wIrarnA8HNwpNmx2r3Rn4H9Y7hce/o0OX3oPDFOJS/04zi5BkC2IlZncRIz1QyVIql6jqZhQY90lqP4Bj7Ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ttBEe9NH+5Fx+nTeAmu6doYXD316xQbbfb82ie2gsk8=;
 b=rJvbWrHCpSHgeT+YSjES0KE/CCfhNkKmrP9coXIa8loG79PWw39dc6AkHsZbLjblgYvnpyXDxcyaK83kGoO5DnNDXSYzJh+fz/p3mwoeXp66aFKzBUPc4T9/XpCWfpqY7eS5egCVUpK0ORN6rPW/Shmz9v7Htg+uuMWYTvK3vwaKAXcleL61y7cELi96+on46HmLsFPQ7hIew+UQz6i+DC2ygSgOkyDZcXOZr1BSsanFz+2YfTSQMskZlMONyalkOf9qhPVdAGPA9kTRyhrmn8FbxDXaZwwZb456/LEpy4AIPn0U56HOkKaaU8It564Z1aTxfANRGTm/0WFosXGmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY8PR11MB7797.namprd11.prod.outlook.com (2603:10b6:930:76::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 16:55:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 16:55:13 +0000
Message-ID: <53319edf-7255-4f11-a36a-dfbe171aaca1@intel.com>
Date: Thu, 6 Nov 2025 17:55:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pf: Use migration-friendly context IDs
 auto-provisioning
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
 <20251105183253.863-2-michal.wajdeczko@intel.com>
 <20251106142455.juyvarn3wqqa43ld@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251106142455.juyvarn3wqqa43ld@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:802:2::48) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY8PR11MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a9b6a4-789c-4a89-c465-08de1d55411d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bE5pRnlkbVBHQXpEbjNiR2dOZlJydXc5VmJUWFhIa0hqMHd2WCtSY3RxQXhV?=
 =?utf-8?B?OUowWjJkNVpRa2hSYjkvRU9rVDVwUUhOaHpMVHE0OGR4cUU2K255S0hqaTBL?=
 =?utf-8?B?TDd1U2c5ZEU3NC80OGNhWnBOeFlsaUpIMDd5TFJ3enB6N3ZWUEhEYWV1ZDF5?=
 =?utf-8?B?RkJ1a200bWhteHdCTmczNHBBaDRiZnMxS3U4aFVyM0N2UW9MNHlFYWUwRVpW?=
 =?utf-8?B?bXI4c0sxeFJoZ01DeWVaZGpFZjB4WFRvb0t6OWlvek1OK29BTHBpcERRcHlV?=
 =?utf-8?B?THFpSHdYQ0g4N3lOUGQ1QzVCOWNMbDZrMHROdXVrMGlLYlU3RW1VWVZDUEkr?=
 =?utf-8?B?eXhCVklXVVEvelZJb1pjYzErRjYxeC9uT1lEaktvcnVjOHIzNmRJMitPOTVY?=
 =?utf-8?B?WnNsb2gwd1pvekg4Z05HcXVUZ3JtNE13OU4yZmFQbUNUQWtPOHEzbGZFZFN4?=
 =?utf-8?B?VEtOL1llNzBmZFpOWUtpM2Z1QmloWW9JYVY1WjF4MVpsT2gwMmdFOVlHbXJo?=
 =?utf-8?B?OFcvaW1SUGVROTNYVWRFUGt1Mk5wSFVTY1EyS0MzQlJQVTZwZ2ZWdyt3b2Zk?=
 =?utf-8?B?Q3VUVkdEaFhYd0IzeEl3V0RmVGVyNlk3SkNZaGd1RW9GaHRzQjkwN2ZBTi9B?=
 =?utf-8?B?VTFiTHUxM2pmL0x6cU9iaXRzRndRZGVHWlVwdEVpczRCamYyVVNDSm5LMjdo?=
 =?utf-8?B?eXJyUU10dlg2Qzk5VWlOTnhGQUJIQkwxYTB0bWh6aTlHbWhlUjVmOFhHUjA3?=
 =?utf-8?B?Q1o5ZmlxZGhWeDliNEtvZjhmSGtWWitacnBYQW92SUVYOHVwWWdLcHlFMnB1?=
 =?utf-8?B?WS93R2VlTDdXRHNVa1JFeW1yZTNwQXpadEx4VStDTHNIV1c1eCtDOU15VlBP?=
 =?utf-8?B?YXdGRFRCOUlVSlhoejZNdmlnUHpUcms5ZU5iWm0wODQ3QmtoaldLK2Rway9x?=
 =?utf-8?B?OUpGY2pLcmhnTTJnR3orbHpoYS9qVjlXY3ZQNEc4N3FTZEdCcHJrWWs0WHFK?=
 =?utf-8?B?TjJvSjdrbm9ybzB5MjdtczloK1JTdDk5ZXJ3UnB1blpHa3BubXM3em80dUN4?=
 =?utf-8?B?VmdaM2lSbHREUnk0cTJWNEJaWnBKYlpFc1FYbHljZEtJQTYvRWVGUUlyVnYx?=
 =?utf-8?B?RjZpN2MzUDVwRXYzc3p0NVg4VjFOM3NPSTl6SjB4RmhleVAraXBubHhIVWp0?=
 =?utf-8?B?bWV1UVBEd1Y2SDhJc0ZPTGNLUUxxWVlJeUpiMmlkaHhNYlQ4ZG1ZdVk5elhW?=
 =?utf-8?B?MUFkNS9vNlBwM21iaWR0TE5BWlJyNHhOM3hVS3VYVC96QldJelZzcnNLZlgz?=
 =?utf-8?B?UGdKZmdHMzV2bng4YzFMNCt5Uzlya0QrRFRzeURRc2VyYW9tRVN1eVc1QXF5?=
 =?utf-8?B?b2poaE5SQzdvbloyNUhDZU94S3NscCtGdEc1M3VRQlU5eUdEK05BcnRkUWtV?=
 =?utf-8?B?WEpQd200V0Q2MWtsbW1oeUM3ZHNQallUWjJzVFN4U1dQUkNldXhGKzNoNWZE?=
 =?utf-8?B?dld1Ry9temFUVllFbGVTTTkyb3N3TW9IRXVFQVN4aHUwUlp1b0EyNmk4R0R4?=
 =?utf-8?B?b0pqdGlnaDc4cEFLSnRwWktwUmxEc05vR0FWWUF2VGVVbTVwMUVmeFhTOGQ4?=
 =?utf-8?B?UzRaNUJlVjN1eHVaQ29UUU5mdCtTeitFR1JkcERwb3RhTzlsWTdiOWY1cGN3?=
 =?utf-8?B?bk1JeWdGUkUzMUxpeHYwemJJUDJQbnlVM3JPWkNBSitwL3BQd2dXeHBVbXRj?=
 =?utf-8?B?Ly83N0hTTWRtTjJjenVON1ZMUFdxMXVKdW5ka011NXZraGhUbTZlTmZDTHJ3?=
 =?utf-8?B?LzNLSEhEQ1RXUE9ZUjZ6V3NkVklMa0hhd29wcy93a0VoOU9NSXFOMEQ1YURz?=
 =?utf-8?B?RVk0WXdQcVJjQWhsT1ZqM3c3TWI1U0I1LzdRL29oQm9PM2wvRm1LRXo4MElJ?=
 =?utf-8?Q?n5TU1DTDwBr69X4ncBJiax/wGJXyR9QZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFJtcTBURGo5TERubzN6aGh4SW9jSEw2a0ljU0NxeS80MGVhanR2QlZ5T2VJ?=
 =?utf-8?B?M2YzeGFoV1I4MHEzRkx5NDdLYU9TYlE0MGJEZGJhSTVNQ2VRQ0g2WHlvcU5M?=
 =?utf-8?B?OUlZVU5FblhoTFM3R0UvMkVWc3FuNDJ5OE1tYTRaakJqT20rQ2dMR21zNnMy?=
 =?utf-8?B?TG1aWEtXZDk1K1F0S3ZsUldQSFhiSEt5MW1XMVBQZkFIYnhvV2krSzdYejkv?=
 =?utf-8?B?aVZmRWN4OVhGV0kzUW5YMzRrZGVhMzR3ZWw5N1ptKzhIdXZjRTBJVXI3a1N4?=
 =?utf-8?B?VWhvN2F1eE43SlFIaGQ0OEpXV0xZQS93VTZCa0xDMmliK0NSY1hTNC9OSGR0?=
 =?utf-8?B?aHM2WUVYWGllQ1Q0UUd1Z0taaEEzRzlTcDMxYnBlTzZQWG9CVlQ0bFlxTGlV?=
 =?utf-8?B?RlVJSkI5UTc2T3AzUjRFUXlDcGNMb3ZjWXBWcksvcVgvamhsUmU4czJEZTJJ?=
 =?utf-8?B?TmJSaWMvSDlZdStxdU55R2dHWkNjcktzVXRlTHV1ZCsvWkgyQXovTnJ2ODJy?=
 =?utf-8?B?L1ZZZzlid2JPMDB4MWFuM1ZJNFRnRko5VG4reHFWdlFCWHpHUnNVWEYrM3Mz?=
 =?utf-8?B?U01YWk9tWTd5ZzRubnpid28wT01OWEJsUUh6eU94VmZnTitsRHEyNExzQU41?=
 =?utf-8?B?RW5meGNwMVcvay92d1JoYnUwMWVwK29YbWtNbTJObHV2azBvZVFRQlZ0TnBQ?=
 =?utf-8?B?b1lmM3ppZ0dsNTZvTXNieGI3T3NlZVZWdVVLSVdxczlraEhpdTNxbVpKL2Na?=
 =?utf-8?B?N1kzWlE4ODlqU1VMWDU0V2tTSkNIcm9SNUp2OVJBbTQzVkhqaWpDMFFpSEZ6?=
 =?utf-8?B?cjhYSDJLUjRwVFBST0kxdEhjQmFCTUg2NHNOVGhnQTZjKzd2RTJWNDJIYTJt?=
 =?utf-8?B?ODZWdGdIaSs0QVZnL293SVNjTWlBOFlGbCtUM3UwOEt4eGZrQVJLeU9vVUp4?=
 =?utf-8?B?WWNPRUZWZkxSMUVDWHRjL2lYZFBJbWtDc3EvVUI5K3Y3dy9hMTFPRXNCVFFR?=
 =?utf-8?B?aFNTdW9VbFRvb1drTmgwYlE2S0NsKzVPaTZtOXhHK214VzdCMEMxL2FyZzhV?=
 =?utf-8?B?WW1SZktGcXJRWjQwUTlna25rSmoyUEZQU2lyUHFBMGtVU3FFWEthd0lhT0pN?=
 =?utf-8?B?N1V4MjN1RmlianVrdklLNUw5VUdtOElEL0JkY0F2YWhOSjdRZXJiMnNiN3ls?=
 =?utf-8?B?LzhUd2dzSmx6eGgrd2dWeXBKM0dQTnZyV0tOMElIR0VPQ3dKNXF6RUJTTDNB?=
 =?utf-8?B?eVkzWjA2U2pJVmlYMnVTaXBScTRFdkgwZ0VXSDUwdEsweHZXaUxuN0lOM2Y5?=
 =?utf-8?B?anVJWVFDS0MxZVFPTXczUHZucXVxWUtYcHdvdjFraDgvOTFJZDB1ZXh2SzhY?=
 =?utf-8?B?QTZSdGloUSs2S21DZWRJcjJWU1NzMWRPQlZnRXNQOTlNeXZ1NTBkOXBPc0Vv?=
 =?utf-8?B?RmFqMUhSK1d0clJRUHdySHpuazM3RTNCQkFRa2V6dXB1TFp5ZlBYRWkzSm11?=
 =?utf-8?B?Q0h0eHFHMWswTVZjS3ZQaTJWbDlqRmY1Q3M2L3VSZUpkNmhMZFdPY2RJSVFs?=
 =?utf-8?B?N0dzc3ErUDFTaDBjeExFdjBseER1Umo3YkRXQXdJVTA2VVZYdWx5QkZKRExF?=
 =?utf-8?B?dmUzWmxWNUZjZGdqeTNXMWxhMzNxWjFlUHNRUzFhRVkrWGdMaitXb05ISXJq?=
 =?utf-8?B?Qm5uVFBGRzdDOEJRaTZPT3hOWmxQRXMydmNoUkh1QmNNNzB4YVUxZzNESFF1?=
 =?utf-8?B?eDdNMVZFWFh2OU5CUUg5d2ZSTEtLNGhES2duTG1WRDZHNzA4UmFNVXdxbEsy?=
 =?utf-8?B?VmcvNW1tR09kanJUWUhrbWN3UVBTYjdIbFBTbWhnbzJGM3luWHdBT2c0bHVH?=
 =?utf-8?B?UkZmVFRCQ21MSG1oUm1rdTd6MHJPRXowNDFISW1ueXBGUEJlRTdLaFNzaitq?=
 =?utf-8?B?OFpUZ1YzWDQraDhwV0xITW51eDdCd3M2ek1PTTJWaklEbjNSZENRVG11R1Bq?=
 =?utf-8?B?S2o4UVl0OVEwdDVzRUsxYzFzdGQyamp4S2x4WlRTckhPTUhUQmt5RCswaVlC?=
 =?utf-8?B?WWRoay9EajhTMnk0RXcwaXpGYmduUEdSMWhWRXR5dnpKa0dKVmdxWGRCQkMx?=
 =?utf-8?B?YWE3OFdwcDRXNUxiekNKRFRRdCt6aVNzNmFzSFhFNlFqSnBTd0FTYkRsUTBv?=
 =?utf-8?B?RkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a9b6a4-789c-4a89-c465-08de1d55411d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:55:13.7407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD/THX3Sgj1r5kk0wK3igpgOt0Yn7nlBHKgnuKKI4/x3h4SJIOU7dk0ZkPNy7cJzEn67+VeuiN/iVMNpwSeHVIpovJQk6aRAS2Ep24zUGIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7797
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



On 11/6/2025 3:24 PM, Piotr Piórkowski wrote:
> Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lis-05 19:32:50 +0100]:
>> Instead of trying very hard to find the largest fair number of GuC
>> context IDs that could be allocated for VFs on the current GT, pick
>> some smaller rounded down to power-of-two value that is more likely
>> to be provisioned in the same manner by the other PF instance:
>>
>>  num VFs | num contexts
>>  --------+-------------
>>   63..32 | 1024
>>   31..16 | 2048
>>   15..8  | 4096
>>    7..4  | 8192
>>    3..2  | 16384
>>       1  | 32768 (regular PF)
>>       1  | 64512 (admin only PF)
>>
>> Add also helper function to determine if the PF is admin-only,
>> and for now use .probe_display flag for that.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 16 ++++++++++++++++
>>  drivers/gpu/drm/xe/xe_sriov_pf_helpers.h   | 11 +++++++++++
>>  2 files changed, 27 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index d90261a7ab7c..14feda215d5b 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -985,6 +985,16 @@ int xe_gt_sriov_pf_config_bulk_set_ctxs(struct xe_gt *gt, unsigned int vfid,
>>  					   "GuC context IDs", no_unit, n, err);
>>  }
>>  
>> +static u32 pf_profile_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>> +{
>> +	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
>> +
>> +	if (admin_only_pf && num_vfs == 1)
>> +		return ALIGN_DOWN(GUC_ID_MAX, SZ_1K);
>> +
>> +	return rounddown_pow_of_two(GUC_ID_MAX / num_vfs);
>> +}
>> +
>>  static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>>  {
>>  	struct xe_guc_id_mgr *idm = &gt->uc.guc.submission_state.idm;
>> @@ -1017,6 +1027,7 @@ static u32 pf_estimate_fair_ctxs(struct xe_gt *gt, unsigned int num_vfs)
>>  int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>>  					unsigned int num_vfs)
>>  {
>> +	u32 profile = pf_profile_fair_ctxs(gt, num_vfs);
>>  	u32 fair;
>>  
>>  	xe_gt_assert(gt, vfid);
>> @@ -1029,6 +1040,11 @@ int xe_gt_sriov_pf_config_set_fair_ctxs(struct xe_gt *gt, unsigned int vfid,
>>  	if (!fair)
>>  		return -ENOSPC;
>>  
>> +	fair = min(fair, profile);
>> +	if (fair < profile)
>> +		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %u vs %u)\n",
>> +				 "GuC context IDs", fair, profile);
>> +
>>  	return xe_gt_sriov_pf_config_bulk_set_ctxs(gt, vfid, num_vfs, fair);
>>  }
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> index 4a4340fb633a..3ddeba4451cd 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_helpers.h
>> @@ -48,6 +48,17 @@ static inline unsigned int xe_sriov_pf_num_vfs(const struct xe_device *xe)
>>  	return pci_num_vf(to_pci_dev(xe->drm.dev));
>>  }
>>  
>> +/**
>> + * xe_sriov_pf_admin_only() - Check if PF is mainly used for VFs administration.
>> + * @xe: the PF &xe_device
>> + *
>> + * Return: True if PF is mainly used for VFs administration.
>> + */
>> +static inline bool xe_sriov_pf_admin_only(const struct xe_device *xe)
>> +{
>> +	return !xe->info.probe_display;
>> +}
> 
> Honestly, I'm not entirely convinced by this condition for pf_admin_only.
> I wonder if we shouldn't set it up differently, e.g., through a dedicated
> parameter. 

yes, that's exactly the plan (but it's on my TODO list and I needed something
sooner, and logic that uses .probe_display shall be correct in 99% cases)

> But for now, I don't think it bothers us too much:
> Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

thanks!

> 
>> +
>>  static inline struct mutex *xe_sriov_pf_master_mutex(struct xe_device *xe)
>>  {
>>  	xe_assert(xe, IS_SRIOV_PF(xe));
>> -- 
>> 2.47.1
>>
> 

