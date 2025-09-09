Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A12CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 12:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9B10E6F3;
	Tue,  9 Sep 2025 12:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2rRMI/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E7AD10E6F3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757421742; x=1788957742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=84YE1l/OPmPj8OFGN6onXyYx+BIiuXTQOpKRb0ZqkEM=;
 b=a2rRMI/uZ7k61cXFNfqPu4SrDXdgHGQLlYVIF5UoNCL/cxZPb793RuEf
 m0DRZSCbzg0l/c9reiXhN56Oq67oji5ZmNbm+lMx4r2xfIqJ6lMRlBroE
 OMpDTqZLyOFGCXZXJsJhz+Emrz36TzvhW50bLIUoLcrHhk9R5WzHQJiZZ
 GSnKJYSq6f1PRykIipx0QyDgC3Piz+lBddCabJfTCMDSb0qX1WDwf9VMB
 v0FNcAJj3tPGzKuwT2ZZULqnfH5O7vz/H2FMd0CEeNe6+iCSPg6e5CFFS
 dHghWPx9t+/0VBrxurqHPp7mkQRF+wpGq1tti5QHQQQa+SZvrE0a3i2CM Q==;
X-CSE-ConnectionGUID: eU2RF8/sTYKUYwNp3pnBZQ==
X-CSE-MsgGUID: KR45LogDTZ2Gbl0XVsaM7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82292555"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82292555"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:42:22 -0700
X-CSE-ConnectionGUID: ZzSDmP+xS8+QPuyWOq2m/A==
X-CSE-MsgGUID: COPr4HYER+W3A9VXDVKj2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172347918"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 05:42:22 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:42:21 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 05:42:21 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.74)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 05:42:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FraixsDJ4K2oy8P9ljvDFVnsySK0ga+B1xxzNM3eb9stZpXOKU6NzwJicNBhYwHyfXRLdIrMA3e209Y2SBqBvm5SD6gqvs2l0RRf2H/YRY9ra/RDbNU6aukO+P3BO1aFX54rSH/a+fJdlkIGJ6LKySub17fVNnXRHf/1y+cl9KPgFq56uMH0HSlG1qEU0mhkbIa7hTl7znc3/ZJGe62jPDgQveE6tRmZ9+TJi0To5zA+nGc3rt3iElKNkRMjDgVY1qgjB92f6lrZvJ7sAIRZPHkGt5qVt143MoouSLsqj86IiNcmEgjIni3DiREPe9j2wXo1FnlrizkOT83xy5TZig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FXPrhV+hQn3WzJviGEUGD8GTYMIq3c9+4HueF/n45Mg=;
 b=bflvGBY/T8EQTxnO0HPxftGn02JVj0b/TzVZW0SeoZkiqAOTHEn2f5rPm37uXn/xWz0DjXTSQbcGsTzL4f6zaCjonJPyQzQFF1I9DDE76VOVc5zgbc5EF/Jx0XEz/na9F0jKvfhT/57tQ3Ra1axazkAEGW2mjF0j+uNCY2BPH7Ei1hG3U44TBi8PtypTRhFd0CxYcYETrOTwkhdxT+l2fbK0a0S6Dlc1dXMvXKrKbw+mwCo9sbSN2KIHfg/lexMJIoKZde41a3TBpMFOz+zxGO5NaByY0Wtz5uTMt0YQgFPpcgUUOUFV+77+M7j8VnYpSLiyKm2CePKa1ntyu9Z75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5258.namprd11.prod.outlook.com (2603:10b6:408:133::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 12:42:18 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 12:42:18 +0000
Date: Tue, 9 Sep 2025 07:42:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v3 4/6] drm/xe/configfs: Allow to select by class only
Message-ID: <x3prpxb3zxfvuzt7txomppfv2dpc5pvwliyultq2kgh77tda34@zrhvrxe7od4x>
References: <20250905-wa-bb-cmds-v3-0-3da2b7bdc73e@intel.com>
 <20250905-wa-bb-cmds-v3-4-3da2b7bdc73e@intel.com>
 <aMAA9V14iZqHK8fz@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMAA9V14iZqHK8fz@black.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0102.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::43) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5258:EE_
X-MS-Office365-Filtering-Correlation-Id: 390a00bd-0cbb-43ad-cd2c-08ddef9e5018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6OVT83sj/RRDwSW6GYZSboMZjvkI2zYUEf1tx1p8E1hAPRy+50IqU8MbC4u4?=
 =?us-ascii?Q?DDF1M4Rcfd4JnmGwKpX/HVM9KkSCN+Uvxx4OsPWa3dtopRjFMw1Q9NwhjeMO?=
 =?us-ascii?Q?9WLbgfINSJ2TiVk9wCxSEdXzyMtzMZCkNzvLczg1wEueMgM90g+VNBq+M0g4?=
 =?us-ascii?Q?2uySiHX64rLc9jWqAwKne4Zeu0YfDi+g82CXH3BPSXezAolnJ4h2I6oP1Jgb?=
 =?us-ascii?Q?fZafkNacvGfTb1Rp8wwA40acsfDbjN7afthbg4KBbQOy/vmYIOOBzhH+dndu?=
 =?us-ascii?Q?OLQHXznwct3lcPq5o3hgE1XT6EzA9wmcB4/cJTySfW2CCRmNAPgkonWN/5/H?=
 =?us-ascii?Q?07hnEOgrsVLKkIyS0KmFQRFhFs8usxH9/Z4hBAbmyfy5xVFc8AKqJMk1AnMd?=
 =?us-ascii?Q?yJb3dgcogphJnQsJoT6UUTz83s+iZDh4OxnVTPrqS1Vg98PeZtJgyipppms7?=
 =?us-ascii?Q?JXbVIKbUEdbn0n/1GabxNE6OSwFZN7i6psv7WfkRx6ND5jAS6bA8avmHieUR?=
 =?us-ascii?Q?TtDhXy8BU7+x8k1EViDfn1/IAfOq73G5vtdfQTPTVqxRCC0AOe8YTquq+uUu?=
 =?us-ascii?Q?7Ed/9J7hbLkwTBRHvRFt9arjtDuIbjtFtsVtMS5s7PUAdDtY67HTiT9++MJy?=
 =?us-ascii?Q?ya/7fDmPfrHRrIaOqymdutQrUoVPjRfmkXVvbmHi7o7xHNOg7UmysEyGS7+Z?=
 =?us-ascii?Q?RM5+lqtDCseZx/6z3uVD3neSc3C4sZLDt4eKkkklUnI7SeZhswMien+RcTXe?=
 =?us-ascii?Q?XlP74+wXkAcjWu5Ha3mVKUxBqLeR9bpS859XBVIvb0lGr3uRBsQ3EjVy6UH5?=
 =?us-ascii?Q?zMU7fkfmBZ4RrDSdmDGan2Z77xHvk30rIV4TiQsMNR/yX6n1fqa9PeLICIwo?=
 =?us-ascii?Q?fXZia96dpXj7O43QgDnDc775i5hW+0OZnUUB0zPw//n9MfEP+fTcePq4fDIJ?=
 =?us-ascii?Q?YZd90YnxuwDBN7D3S97z7t2haQoADCaTfUK1fe2uZR2yeTtM7lnG2Rwjq2YO?=
 =?us-ascii?Q?i68EE/09QtCHo6dk3lywO9CvSzBCf3NrOzd2ke7POS1yXx/CTPz66HXrCOxL?=
 =?us-ascii?Q?Qs9Y0ITirwCdl6bOEaVm4+e9D6ti4hN63jb7DJKuCwWz+5wOBy3w0GuXL/zl?=
 =?us-ascii?Q?MkmIEYnfhWYEPzNlTt4Eju/Q8CTM3+vchwrvg2fNIqaIJ+cCtjQkBo8DYsOy?=
 =?us-ascii?Q?Pdvtvu0FStU8bO6keH5GcSueL/i1dD3EreyCqvsHARkTeDzttxChXiJ8zO44?=
 =?us-ascii?Q?0w3OUy95KkCFSdhCyyoiAXvMSgmvqgRIIktaoknCSSLQg/vI+wD7Na1COlwU?=
 =?us-ascii?Q?YTGylAnk/kMXMRfWU06ehcJ4oKljusU2vSGZs1azKAoNAS/TO6nvZ8RU7meH?=
 =?us-ascii?Q?g20IvV4go1ecclcaQebM50+u35mDiMTeSoI+6dsSHSWU6KnLS3jKpdURENLU?=
 =?us-ascii?Q?zOzZrM+DDzI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V+hU2FyqWyp1/Fxbf6CUWEUHE+fvDK9+tTz/gA70XLH8bklYXijahbHFr91K?=
 =?us-ascii?Q?jpO/2Quu9zWdUqw+GncuYMlsl1t2sQz7m85Y5AFNoHeaCm4wbbOvVy4JEDR7?=
 =?us-ascii?Q?sr+N0ZhyZbg8wuk4p0jTyc8eT9qTMJ6dzzT2xjjPeoja0BLlZsa/0xazIjDV?=
 =?us-ascii?Q?xtxaEXoLfF+d+/8DkV093+EbEr4PLbZOsakYPMm0CL8oPLtVsTUvR9do2EC2?=
 =?us-ascii?Q?yWgxWvNQC7qsIkcXg/nZKSXzeHbDIxQO6Z9yJfc2HFbziJFVetW34eVHJn/A?=
 =?us-ascii?Q?3maMrGy8bBCCLA90/hwY8taKezB/4zimkeiFGDtTIBe6OAAtIF8rV0Mpxcs7?=
 =?us-ascii?Q?ex8QwuqymkPCFtF8n3yfSAl3DGX//+pGChWeDeHO4BV238fumujRP0/c5kf+?=
 =?us-ascii?Q?ecc9k7lcbtgEGB1jZ24vVy/lS1elMxL7W3YRRJDR15qP/7KWHZwTvBNGIpyh?=
 =?us-ascii?Q?uyinESADWfL3TmM65vJkqFtTU5fHAsqLVS6ktDGJ/bzrhLSAW9JabE9JxTaI?=
 =?us-ascii?Q?q9fZwQr2iXP7XmI4eAAZKHWVirz8UIgIth2UUJ+ZwpiIVt9uTriJYNHuVU5L?=
 =?us-ascii?Q?VGOpkp3Zq1ygbmA+EbdJNAzymfhvAnEilH4pikxteQIOzJyO5TDbWJqczcY9?=
 =?us-ascii?Q?1LSO3rN4gkhGbscffAi9Mip7XYuuSt8IjXBbvWK33lp6aAKVIdyPWHERLyoC?=
 =?us-ascii?Q?Sd5jJT4MyYNkDSQj3nUVeiBK62sAZ7QKlKH0I0XGKPq+pFCtF8QVz5jeu9iT?=
 =?us-ascii?Q?9kOcQSXPFFTHlugrNwLQ0DDrtDFv4yJRJvGaJ0j6aeElQyvTbkgLtUtZQmCJ?=
 =?us-ascii?Q?aiRMn7Hg5osBrTUtVdsE3W0YjOxZ0LEbs4IjMc21xufnPTTUdY7v4WXGAr/n?=
 =?us-ascii?Q?v98bx57ne90xc2/Z6/rgV9XUQpUq71E1PnEoInWkT0kUBKv0zzC8Oh0nq/0B?=
 =?us-ascii?Q?cJC4p9TVHbR0mYzykxFLfHEO2iMet2mSOZzwfFv2EUSBV2A32zK0G5CJnffH?=
 =?us-ascii?Q?D53rzDAp25DvP3VBZVJoRf7ZCP7rGmOGcMCxWBErEjNYyC5JlwtG8NlfVR9K?=
 =?us-ascii?Q?GCQzNxV/JfZh6UfCHNZ7vhynTC3E1kOLV9QaV4iOPTVTDe0Pker9geob4OpG?=
 =?us-ascii?Q?vABBxlWtYOD/8fuv0Jkv4wvjzVgivh3B65HGHhWq82KJrIKR2hk2zKGUsZ6h?=
 =?us-ascii?Q?h8O+Qk0i1SAFKqeIKp3TVdh1UpkjWBmDV5YWYBN3QJIE9WiT4XgPBz9txRcp?=
 =?us-ascii?Q?c6s3bKB3vitA/dx5m+xJEfIiCKvDvMY/5XOH0Ptw1qtlrnBhgLom3Mk5PW2o?=
 =?us-ascii?Q?BXoZ+GLJjCL/vojcZ1sVT/S+6KyQ8huW/xWqOtUV0MsseqvxMDXNoh76Kh/D?=
 =?us-ascii?Q?UpPd3hufccYOd0lulJYdRkIS47vrwu3oqiyFTEV+UbLhjDcyfm75csJEJveX?=
 =?us-ascii?Q?oD+cjNnC9nUkAh+6NGszebb7SCP9FDCPnGw9vkaSyFfFPId5GAfHhK9CSQVw?=
 =?us-ascii?Q?WgHPN5XmZHBJr/H1203J6oGq6Cqz7ebrdJIXIYygMzmmlJpQR0+pTrByoYqn?=
 =?us-ascii?Q?pmNdKpRqMVQcLbOjGYYqc4jPXh7mbYTt0lXjfTCZef0SwoOspXaoCuD175UX?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 390a00bd-0cbb-43ad-cd2c-08ddef9e5018
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 12:42:18.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNCXEYqhF1+yoB/rp5rlexa1e1H9pmOjqdi7xzeq6p6Y8gFyuaK+RHtSEYbMXZ4eRq/qLrb0pcF40Fi6sIudTGDHdlcpPiVhPTk9vqEopVM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5258
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

On Tue, Sep 09, 2025 at 12:27:01PM +0200, Raag Jadav wrote:
>On Fri, Sep 05, 2025 at 10:50:32PM -0700, Lucas De Marchi wrote:
>> For a future configfs attribute, it's desirable to select by engine mask
>> only as the instance doesn't make sense.
>>
>> Rename the function lookup_engine_mask() to lookup_engine_info() and
>> make it return the entry. This allows parse_engine() to still return an
>> item if the caller wants to allow parsing a class-only string like
>> "rcs", "bcs", "ccs", etc.
>
>...
>
>> -static bool lookup_engine_mask(const char *pattern, u64 *mask)
>> +/*
>> + * Lookup engine_info. If @mask is not NULL, reduce the mask according to the
>> + * instance in @pattern.
>> + *
>> + * Examples of inputs:
>> + * - lookup_engine_info("rcs0", &mask): return "rcs" entry from @engine_info and
>> + *   mask == BIT_ULL(XE_HW_ENGINE_RCS0)
>> + * - lookup_engine_info("rcs*", &mask): return "rcs" entry from @engine_info and
>> + *   mask == XE_HW_ENGINE_RCS_MASK
>> + * - lookup_engine_info("rcs", NULL): return "rcs" entry from @engine_info
>> + */
>> +static const struct engine_info *lookup_engine_info(const char *pattern, u64 *mask)
>
>Now that we're returning engine_info, I'm wondering if we have any use for
>mask parameter?

We do, because otherwise we'd have to parse the rest of the pattern in
the caller: rcs0 vs rcs* vs rcs.

Lucas De Marchi

>
>Raag
>
>>  {
>>  	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>>  		u8 instance;
>> @@ -263,29 +275,33 @@ static bool lookup_engine_mask(const char *pattern, u64 *mask)
>>  			continue;
>>
>>  		pattern += strlen(engine_info[i].cls);
>> +		if (!mask && !*pattern)
>> +			return &engine_info[i];
>>
>>  		if (!strcmp(pattern, "*")) {
>>  			*mask = engine_info[i].mask;
>> -			return true;
>> +			return &engine_info[i];
>>  		}
>>
>>  		if (kstrtou8(pattern, 10, &instance))
>> -			return false;
>> +			return NULL;
>>
>>  		bit = __ffs64(engine_info[i].mask) + instance;
>>  		if (bit >= fls64(engine_info[i].mask))
>> -			return false;
>> +			return NULL;
>>
>>  		*mask = BIT_ULL(bit);
>> -		return true;
>> +		return &engine_info[i];
>>  	}
>>
>> -	return false;
>> +	return NULL;
>>  }
