Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80640CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432C310E509;
	Mon, 13 Oct 2025 20:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ap4zzyop";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ABA10E509
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387141; x=1791923141;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zYtF3aBzjad+PuP80C8xIxJlPuaQrTPVEcP4QHdMWwc=;
 b=ap4zzyopiz6DVPc2KA92ByQwBj5xpNeNv+6pW3IgywJ0KsEfruo7SDE4
 46rEAyhsWMrhFhW1j+lCRclhRQrHr5Mx2AyKM88Ph33jxM2+v1kLZ/os1
 BXLKriLtBYQOa6wk2gnHF28i8FBThXDpIYaTaAdrWQGC1PELQj8dWDWuJ
 pBwusoc8VrlutvGjo2H10dBpW5o462/KTZI0hbfcoYjEUM63noI/XlE7w
 lBtiim4JbXOlOENam5IwQlYEaEiGXFCUJO+IAGVIRu1ytM10aKWgKGcXR
 1V38wThJTNhq47AdgFdFqZZ10F7xSf6OL0oox/ervBzMTU7fRiK/s9z51 w==;
X-CSE-ConnectionGUID: 8vo4sORxQA+09VZPAby8pQ==
X-CSE-MsgGUID: TDPZfTgqQYe9glPblolpSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="85160210"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="85160210"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:25:41 -0700
X-CSE-ConnectionGUID: C5jEF7BrRYyWyiDJ7uzFeg==
X-CSE-MsgGUID: hLxV+F5oQROpuk0t8qky5A==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:25:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:25:39 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 13:25:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:25:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3RdT8EFqTI+/RXB9oqp/MXiSwc8XGyhdgwWZk4AIGhJqwO3AS8/xO2qs8P2MBOsqkyR18J6H5GC0zv0XiLbzOG9CuGlk348/cqAemGFwAR4D6ahCWkYzM1YFf9Eu1fM2PIOiZp/ClNmd9925VapItj12yMyiL34MwCANKzJAgtKogJ6YZWFa9oz4he4wUu0i+y6cCBGqFJZrnVxrf8MKhKfaRwPfEpKHWCgKP0sE+Xh1f9lGSv0zFjmNIHfnfpaWJWVYJ8Jx3qA6AQv8nGJ6sH6h74Xx9s5PVRMk7OliSl77QMG+caFOT8j0K7op+aF3rh8yPdDI9ps/SgMvWX75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jhw9ZvSG3RoOoPtPKuPwLiegeUEkVlM6h4Za/D/6UJI=;
 b=kJmMZmae9XwpEL+AlEAg/iTFhteoiphhLvZjcd0HwQNMY0ul4kKuw8LoVldrvJDl+sKPS3GjSQ39N/X8jjrH/mmsGL/v8g/RrYsuB3gC5CvV3cy9zbfdk5TUcAn36oOIZ0Q2fQts4erjC/3M80Ny6aDLG802Tt/E3StXwUVvxBSdN7WPW0bHjxQDrkR+lg8iOHJjGE1NAtHHK7YX7gjt011zZW38RSwdm3hV3WzGi/CV4xCW2QWCjDyx+Oan9K2bDddIdzlw9u9UEwWuKb+cUWBMHy5X+WQTzK/AqVrAsejuGn8KeHub5YT5Xlkj9kUJ58Vv5+PL/1Ww2ugIPdDvpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7005.namprd11.prod.outlook.com (2603:10b6:303:22e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 20:25:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 20:25:37 +0000
Message-ID: <f72f8b30-61e5-487e-ab75-3c0965b2b5d0@intel.com>
Date: Mon, 13 Oct 2025 22:25:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] drm/xe/sriov: Disable SR-IOV if primary GT is
 disabled via configfs
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251013200944.2499947-25-matthew.d.roper@intel.com>
 <20251013200944.2499947-48-matthew.d.roper@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251013200944.2499947-48-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0026.eurprd02.prod.outlook.com
 (2603:10a6:803:14::39) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: a4e920c4-990d-44ce-c760-08de0a96ab94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QU9Wd0g1WkRneExxNlNIWFNqQkwzUGlmUldueHdYZTlIbDdaYThvNGFLaGN2?=
 =?utf-8?B?MnZLdG8wQVJUc3ZmZ2N0ZWtGeTJSQ2Z3K3dicHJ4L3drVFhEbHhPc1NSa1Zp?=
 =?utf-8?B?bkZaNERBQjNKWVFzdnVUZmx3UEdWSTBJZ3RMeEhCWWVjMWdlNHhpUmRlZy95?=
 =?utf-8?B?NnRnUmdEUTROajhMbFY1NUJiNWU5djFiRFYycGVVU2tUL3JsVDZwK05vd1VQ?=
 =?utf-8?B?QWdmSGtOWnRadVVBK1pWMkFNS1A0UkZEWldiKzFaUTYyT2NabmxQMU9qRWhu?=
 =?utf-8?B?UDBGTWZuU0ZrOUNCYmp3d3BZYXBDeG1JV0JtSEU1YktqODBUYlZVMWc0K3BE?=
 =?utf-8?B?R3dLbmFsQi80eEtaWnhHaC90NXB5RXJYQkNjOWhwenc0VWlzWDU5MWxNenAr?=
 =?utf-8?B?aUxBc05DN0V5THlTeEZOZUJsaDIxUlN5RWNUWGFmdkVBQUh3OUxpVjN6eHpZ?=
 =?utf-8?B?WElJdnZKYVRRWHlQSitPNllGUXVmUkJ1UkNkUVR4SlUrNXJDYlNzZUJsZExi?=
 =?utf-8?B?V0VzR0FOa3Qxa1BoaG9uWFVoTThUdys0d3NJSzJnNUsyeDlkZWZWUXcvMHpm?=
 =?utf-8?B?WXZzd2RoVGc1YVZZSytYalY0SEUwSlVXNnVNTE9qb0ZMNENBVEczMVdUR3Zq?=
 =?utf-8?B?ZWxFK0xENFdzbVRJVE9XOFRiUVRBOVh0eDNGKzZzU1dhdU5hcG1zNHZrNjRm?=
 =?utf-8?B?NXBDOFlpa1Rkem5PbDN0ayszVGFZdjRaVGpYQm9MU2oyZENQbjF0bHhheCtW?=
 =?utf-8?B?T2VEaCtKV3lTS1B6QW5sSDVlano0VFRac29JQjZGWDUvbVVXRmxyN3dnRXZv?=
 =?utf-8?B?Y1BWcFc3ZXlVTFd4WlZtRTRsRDMvMGRENUpGcHlYeVlQSDVYS2J1ektzWkNz?=
 =?utf-8?B?K01Ya1JuOXJ1MURrZW5Xa3hJVlEvZDRJVElManVvcE83NHBialRHRkIxdU1T?=
 =?utf-8?B?anNHckZ2VlQ1M0ZwNXd0MlhHU0RjdGVTSWhnV3RvZ1pCSGg4eHN1TnFCVU4x?=
 =?utf-8?B?Q21GSVk4cjdyZVdiT09TdkZjTVBBMm1PRy9pb1JCZXRLY0dIaHUwTjJZdm9x?=
 =?utf-8?B?L1lMaThJSnNjV2tLa1NuUlNGRXd0MjVZZGUyRGhyaE1rOHRXV3RVWUdWRGhH?=
 =?utf-8?B?MXM5NEVIS1BpclFyZlRqWkY3dU1tTEJ3ak42RW56L1lCdWRZVEM1eldHQWNR?=
 =?utf-8?B?OVBIKytxVGRESzhIZkhmK1J4eHdYTENNSkMrVlhlOWxsWXV2Tm8vV3Ixc3pB?=
 =?utf-8?B?OHlYMDQ2cUpUajdzTmpOY3N2WHp4S3N4WFUyTngvOFo1K2pLbFNqUHJERnN1?=
 =?utf-8?B?di95UDViVW9EOHVvQmljaWpYYzQ1TmRJMW11S1BjRStSYzdHSWkyOE1DR24r?=
 =?utf-8?B?MWZ5Zk1nQ25hRXJpU2hPUThBQVo0bTZaTUJzYzZ4MDJ0ck8wU1EzZmUzK0Fl?=
 =?utf-8?B?Z2Z1RzM2WVJrVG1jbzZOai9hYWJ1c2ZvaHhLNkhxZGNjNUpXMzdXUXhYUGMr?=
 =?utf-8?B?dzRlY0k1V2VKeW91NjAvNGlOaGlzU1paT0wramtQU1VjNFEvcStpb1BScGR5?=
 =?utf-8?B?bEFvVGVScGFTWjgvUE85cUxuM2tja0VDa0tCYVp3bERPRjh0RktlTDJQNUJ5?=
 =?utf-8?B?d1Z3ZHNVRVdaVmpYQnVPTUNTRTl2R0pmbXNBNHVwamIzeGV3TUZ4ek5ka2dF?=
 =?utf-8?B?STJ3MnljZkc3cjVkU1ZYdnFrVWtsTHpxUnh4dW8vN1JGZGpIU1B5MjhQMDl0?=
 =?utf-8?B?UXdLd1crMlRmcUxrNWFCMStvbloyN0FkV05LNC9PK0kvYU1JODFiVzNzeEZK?=
 =?utf-8?B?clJxa2drMHB5Y0NPYVowWU9tTjhnMXp1Y2V3UkdOWXJXMG5yb3FmNGpobVhN?=
 =?utf-8?B?QWsxOGZtSWN5NkFhWjRkczBqTFJUL3FqNGtwYlcwQ2NOSHhhandERkpDZXB0?=
 =?utf-8?Q?YnpahUb9l4DlT2pjO0N800dJan9E2TQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVp4YUhLSlZVSDNJV1E0YXFmUFVrTFFIaHBWWXFQbUJEZ2xTc244ZkQrWG0r?=
 =?utf-8?B?bkk4ZWI1Y2ppV1J2VFJsYm9yL2JVRUFYb1FwVG5PNnFXeUxZUHJtc29pa1lQ?=
 =?utf-8?B?ZjZuZC9KUGFtbzNndHF5eTYwS1VMaXpUMUM1eFJxbWVocDdyaWdDTlp2V1c2?=
 =?utf-8?B?OUh3d2Q0YWlGT1E0MkwxVlNQNnRPYnpwNWFjbkhDVGFIRDltN3luZjR0STEw?=
 =?utf-8?B?b2NSZU5GRW82ajdmVEdmU0djdU8yRmt4Yk95aXZDL2xxbUszSkxUQmg0ZEdI?=
 =?utf-8?B?WHVJZFhUMVJNQnU5bVpQdnQzam1WM1hTU2ZwRE80aGVQcjNDcEIvTW5LY3BX?=
 =?utf-8?B?K01qa3FlZjZBK2VtODM1elNKK0xNQTdoYkx5UCtEOFVOTkVNTUxPTks0eFN4?=
 =?utf-8?B?dXc3R2grYTFobFZkSzhtMUVibGNXL3pQS3lvYUpnaEZlTTdNaFBLSExwRURJ?=
 =?utf-8?B?WUI4K3dWMDJWdnlUQWZMa0dwMG81K3VjK2FEbWJEbElkay9yRHl0SWgwWnMw?=
 =?utf-8?B?ZmdhZTJZRTRlSUdqcFZYMTJrYi95NEtla0d4WlBJSGd5Tm5mYXlpSndudWVl?=
 =?utf-8?B?UW4xWmxWUVdWZ0VjdTNEa3JOd2cyYWZBYkFoVnQ0clNnaUNpd0taVmxnVFdE?=
 =?utf-8?B?OWI0RzJxcVcvc3IrRWNxMjBqT2FDMmNDUGkvdUYrd2dNQ1FVUWRtV1JsZlFh?=
 =?utf-8?B?M0tzZlBUNTN0SGFucGRzK210T2dkYnVzeFpSWDJlVU9nOTFIK2xXc2Z5OG8z?=
 =?utf-8?B?SEp3VGgyRnpXZlZIVnZBcGhRZGgra3oralpBcnIwZmZ1M1NndkZhV1BVMjMw?=
 =?utf-8?B?RUJrdFRPNmNiMTdXQTQzNys0R0VNZWd1dFlrZVdZb0tmNyt0djZMUGo2ZTEv?=
 =?utf-8?B?WVRCNlMxM3U4V0QzSytXangycmgwZThYMFIyOGcweEU3WjZHbXlydHprMndi?=
 =?utf-8?B?ckdWK3o0KzRvN3N0MTVvMGQ5MnJnOUJpYVZrZFlCZUdXaWUyTzZkTlVuTUY1?=
 =?utf-8?B?SFR0d0hiSndMMUFNbUthWjRVMFdseVR4ZEF2Z0FJdnZqOGFhMHhIeFhzVGhu?=
 =?utf-8?B?N1RCR000Yk5mTjdVT3l1WmwyL3l4M041dE5yd3NCMmY4VlRUTk4wNUxLWWhr?=
 =?utf-8?B?ei9UWkhkQjRBR1h2aXhGbXhJc3ZOV3h2RVNXVllORUhub1Q1aU1VRlBVL3d3?=
 =?utf-8?B?d2pERlI0WWRGYVJ1eVo1NXNOd3V4Lzcxbk5BdWI2ejlJQXhTUzh3YlphWmwv?=
 =?utf-8?B?NjV4elE1MWtRMDVZNHFlR2FaeFB3RDdBS3FoT3FtcDk3YzhpQ3kyeUU4MTFz?=
 =?utf-8?B?dituREd2VTdqVTJjaFdWYlp3Nk9lQ2hwM3lXVTM3UXNMaCsrUkRuaUNRa2F2?=
 =?utf-8?B?NGgvMUY1MDMraGhMRStSaFVyaEROY0U4Ukwwb2tRMTBjMm00Vk9saXpzOUxn?=
 =?utf-8?B?dUZuTEZ6eVpNSDkxbjJpcnhHek9XTmtxYVFCUE92Yk53RGxnNXVIaS9ucHpa?=
 =?utf-8?B?RHV3V2J1ODBkelo5UER2WHhNU1g0QXZHUWtGRGp4NHZlemUrUGRNcExpdVQv?=
 =?utf-8?B?ZWsrZHJXRzlKVFpnWnU3M1Jxd1JVTWs3dGI4STBRU0xhaDdEVU9YQUVJTjFO?=
 =?utf-8?B?NGFMekx4eDNuNlRrRUowMitQaTVjYjQyWnc5Y0JiMGhqT2RzRXByU01ubnlH?=
 =?utf-8?B?TGEzTENEcWMwQ1R5V0RLZmVIWTUyM3ljWGhrbmVqMHhMQ0VSanNwdWpob3cz?=
 =?utf-8?B?YTdHZG1LV1B4MGZaNUp5V1NaNHlJaTNKVXdxWlNUZmZweEJhOE1XT3lOZHNS?=
 =?utf-8?B?OC9QaEVlVTIydXMvUS9Dd3VaN0JiTFJnQ2xhNGh4QVBnVWdyQlBZeUR1YkVv?=
 =?utf-8?B?OWZ3N0lIUzBoMzVsaGpGSGU5bElYN3V1QzVMSlVLTW5DVXFDdTJwNkkvQzdH?=
 =?utf-8?B?b0FYSHAzMmhOM2huU3Y1Z0ZRbERHMTlOQWJkclcxY3MvNjhxSW50akVCZnBw?=
 =?utf-8?B?dmZ2RmRSTStJalRZSkZVM25HRFBvS1VwZ1JuY3pOSGFrblpISlRuQU5iTEln?=
 =?utf-8?B?Nkkxc09EZjFTVXZNR3QyZ2Z5a2FnZVBWTGVRTWpTcGZpZEJQZ3IxdG9JMUth?=
 =?utf-8?B?dHRDU1VnVnhyRGZYcDRjbEhsdlVGK2U2RmxRNGluMDNpbWU1dWVRRVlnb1RY?=
 =?utf-8?B?Q2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4e920c4-990d-44ce-c760-08de0a96ab94
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 20:25:37.5468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ojn+AyUxlRDJcxQYcTxYXXZqVj9v6rdvK17ymvb/CKpo1fhPjULCi1Bfhifd9A2kuCiWvUGK/bRkEcr94VApEJgAEDxzRZjQrF5LJ1Xdnsc=
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



On 10/13/2025 10:10 PM, Matt Roper wrote:
> SR-IOV operation relies on the primary GT's GuC to operate (in both PF
> and VF mode).  If the primary GT is disabled in VF mode, fail the probe.
> If the primary GT is disabled in PF mode, force the device back to
> native (non-sriov) mode.

I guess we should update this msg to the latest approach:

"Don't enable .has_sriov flag if the primary-GT was disabled by configfs."

and then we can keep the change log under ---

> 
> v2:
>  - Move handling to xe_info_init().  (Michal)
> 
> v3:
>  - Just update the .has_sriov flag in xe_info_init_early().  (Michal)
> 
> v4:
>  - Drop unnecessary comment.  (Michal)
>  - Flip condition order for consistency with other checks.  (Michal)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pci.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index ef559a79c5ba..24a38904bb50 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -631,7 +631,8 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_late_bind = desc->has_late_bind;
>  	xe->info.has_llc = desc->has_llc;
>  	xe->info.has_pxp = desc->has_pxp;
> -	xe->info.has_sriov = desc->has_sriov;
> +	xe->info.has_sriov = xe_configfs_primary_gt_allowed(to_pci_dev(xe->drm.dev)) &&
> +		desc->has_sriov;

but this part should work, so

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

>  	xe->info.skip_guc_pc = desc->skip_guc_pc;
>  	xe->info.skip_mtcfg = desc->skip_mtcfg;
>  	xe->info.skip_pcode = desc->skip_pcode;

