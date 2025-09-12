Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC753CA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 14:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44CB10EC4A;
	Fri, 12 Sep 2025 14:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkuUb02J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A8510EC4A
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Sep 2025 14:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757686037; x=1789222037;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=LJrrtqKwAQoYGsVyQTedl4MH+JlSL8HewB5KTu/BOTI=;
 b=VkuUb02JU22jLw4xbQctXIKjJvvVRZ9P2lQxJ59Rn+N92og+ioJYwV2d
 4fXrn453RrEv+rKJxAT73kGgrESPTbgmY8oSRfEYtaO00bU5YOIOIBBAG
 dYHPija7tZfwTQkdcMCAssBE75DwXLaG5KAY6QlCWUbWG8uMq6aY+g4Ep
 vGfVnggz2ySoiQIUwuv2mWREtbDS/ozHoxtMNryjRqQ/2u2agR3G9auxw
 B2uMsD02BDrWmqb2C2oAfZtcaHNO/5BypWLjqQBtvxHksrtCHYcvblmtc
 t/3ONr1T2dxhqtgKyf2VKxTwYcoBYRcGMGCyzLbYZebrDLwu8T2cqzwWU g==;
X-CSE-ConnectionGUID: apmlAt9lR/e8ZX4U8yaGXw==
X-CSE-MsgGUID: h2IVk7CxTEWwqnJ+cN6ahA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="82619101"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="82619101"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:07:17 -0700
X-CSE-ConnectionGUID: 1MNUVqAlTqKMPuYXiYPJpg==
X-CSE-MsgGUID: 9yd+fE3FT+C1MRzaebRtpw==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2025 07:07:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:07:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 12 Sep 2025 07:07:16 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 12 Sep 2025 07:07:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d84t3tHcnlTz+zTMmN2Z1fXETNw5aAM+C3GM0L+jYevZC7J5dzmzR071L7+z33wWy2lPItZei5RanRIuZE9BwHn/4dHl1JL3g5Vw7GbBhhyCusJjF0BjgfY61M1642OEFm8a9IkH6ApkbLAvWalUgDu9FFQoJs8v05/EQimNijcsuNLOhoUNvCgSSHz4BJu9q91bAzd2avQf6yL8OdUSZVOcZZWC8nlFJr+NE57dAfj7HFWYGQe9zgsFiMGkPhczRTt0RSfgxgmP+4NCFLDYADqj268QezktP0iYSWC9ahotBvXHeJgJwyzSvI8Oro2rhYRWQNMbyWbaRxEs+EXgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92WFN7TRqnKV5QSJzrUI5373tayqi5QTZ4aR4/V4Z1Y=;
 b=fJK8TNMENh2lhHcVQR308twsjFyOQ04e++hf7NdFT6QcA/sJ1cRBn7PeOBqoD+DPrPDyzULdnjU3xehDbsWKGxUnmtdXqxIA6B4oIIs+2eRyiHsSGsa0DGYVziWc6NKEbjXUsJLcml6wkMnG0b7XDqR5l3BdXglujdn5p7Obm+bZaAKQGxulubAyfgPRNNc5iWPtAmLWesTtkzDOz/d16DkAN+sHonke72yMvVPHBjan9a25BTzZh6ytQZVX96AanD4gOcJt0ul71Pd5i8TrybZj4nVvvraerdTqOGTZMdZePXmEWer0YUY+//iEwdZqByyBwHCN0PHA+UKO/EtMkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.18; Fri, 12 Sep
 2025 14:07:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9115.017; Fri, 12 Sep 2025
 14:07:13 +0000
Date: Fri, 12 Sep 2025 09:07:10 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Stuart Summers
 <stuart.summers@intel.com>, Matt Roper <matthew.d.roper@intel.com>, "Riana
 Tauro" <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Umesh
 Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>
Subject: Re: [PATCH v4 6/6] drm/xe/configfs: Add post context restore bb
Message-ID: <b3jh5ppikyzfb5lvur36fpldsstiert6577p62vnmy2jimq34l@mbjxcka55yik>
References: <20250911-wa-bb-cmds-v4-0-c8f7e48f7eae@intel.com>
 <20250911-wa-bb-cmds-v4-6-c8f7e48f7eae@intel.com>
 <aMPUQcgJsZARb8P4@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aMPUQcgJsZARb8P4@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0065.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: d8767ed8-bf03-4837-9903-08ddf205abcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X7joRR2jZyYIYrcm/lxq7BBPd/2A4AEy8ZFzvtdw4Y3qIgDBSb8WFkIyOjoh?=
 =?us-ascii?Q?yueH7KLPo/kEmDhphSSg8VtAfktJ7+XNF0e1ISrWjC3xqwf+pZKHBEGbHmqp?=
 =?us-ascii?Q?TlkDsR7SAtQKMBkOivA+lAbL+yEkeWN2i37Zik8W9qOc1z8jAQaE6hgjvLYp?=
 =?us-ascii?Q?v/N2Zcjp898/6EXJTW9M2EuAFdXfDS3uvL2jiAbsazgvGBfbyRZE+xTO/AzQ?=
 =?us-ascii?Q?FWBzgOZGwUE3l4CCLtlYZT56NC8NVsSozK7UcvxNjqEo80XbsjFZ16KkVP0m?=
 =?us-ascii?Q?TZqZGgs+Nc98r903OJn7ncKpBXhhhwBSQOJHv08T26T1ROFTMgSUObgcNaqg?=
 =?us-ascii?Q?DO1XCPZ9tn1kDbFN5H6vf55vdX3isjoyDpjAGEZ1Kggc80IaffOZDcsVliRw?=
 =?us-ascii?Q?IEaw6GC1nDxhfJs5qh8NFc51kjz2kXrxrf7Nu2x0xH9mg1TrPlXvBWyU+9mO?=
 =?us-ascii?Q?qXZh0Eli0MiVPwTEHUhhlQ2p0XQAFQGi6sDoGFspElpTE+sr66Jyud/5DqD0?=
 =?us-ascii?Q?wiDevNa28BxFSFRCf4EoaU116O5VxXSqPuSuA2wZ/B6Wyxz6qA9kA3vTzwHz?=
 =?us-ascii?Q?Qasm/UaZOb5GWrkgDGQHr79FT4gPY4YzrXYe7QVdvb07iD9d5N9BDq6W3yyz?=
 =?us-ascii?Q?uI0yunGME7/kEgz1kWokFBH7uNN0OLEDv4HrzAoRlKJrczpRA/YYOn5eHrzC?=
 =?us-ascii?Q?EmA//LVwjktMOuS9Ze3rWlgUt6Mz7VZT7HKeh86rVwWTFX80R60dp3VZOgqT?=
 =?us-ascii?Q?j9LEWSpyhNf+byt1zQAXehdcz6R7KU01Vf2TZEKywwQr6UWSE0hEkmJXVb78?=
 =?us-ascii?Q?auyOmFSSQjFyXrjy15x2TENq+W+AFq6ZKJSB+BtQBByuvhMZ3NselVtBp6DJ?=
 =?us-ascii?Q?dAg00TwNY/yDMuYycBySNBYzSRkdCxW0R9Zg2IHNQ/Ie0R3A9xgY2M6Be7TB?=
 =?us-ascii?Q?FVr9ic9xg9qAPad+XYVXzK98TmKilyQgYkPo63ky8rOafQZM/pBK2iUzzMa8?=
 =?us-ascii?Q?m0kMZoc8JVY5E4cVmLkYOaXJw88NZJfSSbGz/RXO4gRQ1fBypVC4YvFsbJa8?=
 =?us-ascii?Q?IR1t1StBSPqu3YC6eOGw+Np4LL1D42crIGhplWa/d0ha2rugTvV9zaXpUyUn?=
 =?us-ascii?Q?+JSww9XEEtRpesfTtEpG5xndTOGY21NLwPXIANgRdaetd8st7bKLhKMHfCLi?=
 =?us-ascii?Q?PY1ORHEVPPV1C2veg0CLTbuMwxVnv/2RNJ3NbwQX88gd36uAlPoDCn9hSqp+?=
 =?us-ascii?Q?7L/PPRlA0bo+OPGoBehJwzT6PV0lwaA3Fi8uuS/NXSeY1I2hBHWkdbzaKI1F?=
 =?us-ascii?Q?j4d1TL3GmWt9McPxExusGgGkmzT7+yWslGBmFAUR/qd0KCS5/us2HVfMAtx6?=
 =?us-ascii?Q?TiTDggMMwZkDHKG1ns8Nbz3Kd9l4u6QMOWJvqQZTb6vszgnrcPW1DHn/g5LB?=
 =?us-ascii?Q?ISAnFftXBGc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mDbPXnJh7M6zYvYQiIIi0WuPqevkdzJSf6gebJZwygpFFRWyEbcA01Q3lFjs?=
 =?us-ascii?Q?LZqIui8f67Gyxn7z3N1Ygi6PFtUVNX6rrGmOD+b/Lz4caDkXSEyHWVzzlRh2?=
 =?us-ascii?Q?ytwukjNB2mVlV8Cv4Z0ovy3UDGxZ3bXWQmEmy7TfXpo3wPpGrzj+1yiR0peZ?=
 =?us-ascii?Q?UCjjjCKcS0bvvUdFhrfw5/ktQMeiDwqpdAZLhFX1bh5MAGX5P5YSnELMkYia?=
 =?us-ascii?Q?8MnqkUwjJL36//DoxSbGda73t+zzk2lshETX8+iIpxxm674IjYs4omUX+sJ7?=
 =?us-ascii?Q?Eg7mrdzq3Dih2Obx2cnboHgpA7j2UjV87NIbx8xurCthdqsoFAlV/nbsy2IL?=
 =?us-ascii?Q?Yu1t6z1ksEfvRJXb3ekh68//jIZkhMDB0NZcRphCwHJAL6WwUkSfdeYFhZ7+?=
 =?us-ascii?Q?f7Rg7KDwJzEYnfbMoC5Xqa3Bd75xTvyjeBlOZBsaev9hls1jTJzhFwiUZp7M?=
 =?us-ascii?Q?eFLdvaaxV3f4/GXaqZp3LxPFcmlbt43PvZiA0/l2D/qqbFhBdC66y8rFOOsx?=
 =?us-ascii?Q?7rfokpjAFLTwkzGZBMvIQ3d7R4tLUqPJVxgCVBBsqRPfNbeeoQNvM1sGUSkZ?=
 =?us-ascii?Q?+VgK7xuKNOwH5H7zQD0/Zheqbahe+AhR742sMFLpE+ap4u56T9Ei+X1yJ+ZG?=
 =?us-ascii?Q?6suyrz6+ULjE387qvrvNX/oN1ZTq8FoPvtjdv2UaqrENrl0UNEWUwKxK6qCU?=
 =?us-ascii?Q?aPo+JjhWF8PRBFUGtTfTuj8yoIxEQRLqVVBoDHu3zwFlbIcC5/A9bhrAZbOM?=
 =?us-ascii?Q?pAtT/2cKnjPFfPP8AyIygjBwzIdU/rxS51iAfXHBBUmTfnfTX5ZGZ6RO+VQg?=
 =?us-ascii?Q?56KOsBe4f+mR4VeNrlJpQ8MfxsShS5O7Wegrs51ixsOZdNSr+ARq/N1qMxNO?=
 =?us-ascii?Q?XmelL0tTsM1ZDJSCE1HktUZclyG5970Im+xtF/6FKj2LwryswpVh6kVfRdSp?=
 =?us-ascii?Q?nPOMqlTUSzGUM8T0Y9jSTuaVYkCnIC2R0M0mva8BMAzLbfTo1XPJ/XfXZrC3?=
 =?us-ascii?Q?t/98vn2YWp4csyl5Fvh+Qypzb+LsuFkdgQI0D0bX5oR0LonVCau/vkq0Hgh/?=
 =?us-ascii?Q?5rCJQR6r8LG04cu2a3CGrd2YIIAAFCJdqLe3xtjRhrAmbgsv27qm5d5HDZsJ?=
 =?us-ascii?Q?VxoJCOALeHTUnZI5MfNhx2prPcvLfrTiNUFwKcN3MAwGa14uHpa1J62ZNfSL?=
 =?us-ascii?Q?s2ZKASlrHodIL+dnCFQG4Q1U1zWzN4gqJd8SQbm7cssVcwpgOhuP9EmcHnb4?=
 =?us-ascii?Q?H0b7baL9QK4dI3nJc6eIU5Dqa7oB/rmmKos/ArA+hmhqpzQ900Z3LIFFR17p?=
 =?us-ascii?Q?rGu9SyVu1R5KE1erRrYBRFtwz6ZiyJRDqVt0bTKgLZzC8HA3QuGNxbX6mYib?=
 =?us-ascii?Q?YiO9cUyX4Ew1vYdv+9YYjgw2SWtIEzy8j9e8K2M5b0LUxKRKwLtrvgZCXn56?=
 =?us-ascii?Q?tad/BJdeIL5M/hUnBwHsD+z8w1J9FDzSpFoYXML/Vq8S3GKqxZCX3q7GEI68?=
 =?us-ascii?Q?EKizRoT2H9OYfhmgAdvvYrHbyzZcj8ME/HGL0pVHjIBr6mmfIhOzycy8zB2l?=
 =?us-ascii?Q?X0UT47DvHIdOl/2H0GtHIYYD+jBecSQBhwe7i+wGxo2KEgDuvUwQVQ2MCj1I?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8767ed8-bf03-4837-9903-08ddf205abcf
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:07:13.1611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w9Cd67rByDbLglyIqDT48wpLxOKtmAE/d4Yr4OYoQQbqjlEMngRVktGH9LdAWlfYFlnlSRiZvzzZvilRnzJYgAC9AVIba1dgvSwVuxFG3Js=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
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

On Fri, Sep 12, 2025 at 10:05:21AM +0200, Raag Jadav wrote:
>On Thu, Sep 11, 2025 at 12:36:30PM -0700, Lucas De Marchi wrote:
>> Allow the user to specify commands to execute during a context restore.
>> Currently it's possible to parse 2 types of actions:
>>
>> 	- cmd: the instructions are added as is to the bb
>> 	- reg: just use the address and value, without worrying about
>> 	  encoding the right LRI instruction. This is possibly the most
>> 	  useful use case, so added a dedicated action for that.
>>
>> This also prepares for future BBs: mid context restore and rc6 context
>> restore that can re-use the same parsing functions.
>
>...
>
>> @@ -123,11 +156,18 @@
>>   *	# rmdir /sys/kernel/config/xe/0000:03:00.0/
>>   */
>>
>> +/* Similar to struct xe_bb, but not tied to HW (yet) */
>
>Should I assume we plan to do it at some point?

no, the "(yet)" means that it's only a struct to stash the bb. There
isn't an exec queue associated to it like in the xe_bb case. The hw
association will come later in the runtime flow, not in a future patch.

I may remove the "(yet)" in the next version to avoid confusion.

>
>> +struct wa_bb {
>> +	u32 *cs;
>> +	u32 len; /* in dwords */
>> +};
>
>...
>
>> +static ssize_t wa_bb_show(struct xe_config_group_device *dev,
>> +			  struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX],
>> +			  char *data, size_t sz)
>> +{
>> +	char *p = data;
>> +
>> +	guard(mutex)(&dev->lock);
>> +
>> +	for (size_t i = 0; i < ARRAY_SIZE(engine_info); i++) {
>> +		enum xe_engine_class ec = engine_info[i].engine_class;
>> +		size_t len;
>> +
>> +		if (!wa_bb[ec].len)
>> +			continue;
>> +
>> +		len = snprintf(p, sz, "%s:", engine_info[i].cls);
>> +		if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
>> +			return -ENOBUFS;
>> +
>> +		for (size_t j = 0; j < wa_bb[ec].len; j++) {
>> +			len = snprintf(p, sz, " %08x", wa_bb[ec].cs[j]);
>
>Should we use '0x' prefix?

Then maybe we'd need to change the input parsing as well :-/. Not sure
it's worth it.

>
>> +			if (!wa_bb_read_advance(data, &p, NULL, len, &sz))
>> +				return -ENOBUFS;
>> +		}
>> +
>> +		if (!wa_bb_read_advance(data, &p, "\n", 1, &sz))
>> +			return -ENOBUFS;
>> +	}
>> +
>> +	if (!wa_bb_read_advance(data, &p, "", 1, &sz))
>> +		return -ENOBUFS;
>> +
>> +	/* Reserve one more to match check for '\0' */
>> +	if (!data)
>> +		p++;
>> +
>> +	return p - data;
>> +}
>
>...
>
>> +static ssize_t parse_wa_bb_lines(const char *lines,
>> +				 struct wa_bb wa_bb[static XE_ENGINE_CLASS_MAX])
>> +{
>> +	ssize_t dwords = 0, ret;
>> +	const char *p;
>> +
>> +	for (p = lines; *p; p++) {
>
>I found it to be zeroed page but does it gurantee termination at page
>boundary? (just thinking out loud about overrun cases)

it's actually not a zeroed page, but it is terminated:

	if (!buffer->page)
		 buffer->page = (char *)__get_free_pages(GFP_KERNEL, 0);
	...
	copied = copy_from_iter(buffer->page, SIMPLE_ATTR_SIZE - 1, from);
	...
	/* if buf is assumed to contain a string, terminate it by \0,
	 * so e.g. sscanf() can scan the string easily */
	buffer->page[copied] = 0;


>
>> +		const struct engine_info *info = NULL;
>> +		u32 val, val2;
>> +
>> +		/* Also allow empty lines */
>> +		p += strspn(p, " \t\n");
>> +		if (!*p)
>> +			break;
>> +
>> +		ret = parse_engine(p, " \t\n", NULL, &info);
>
>Nit: Can we work without a double pointer? I've always found it easier to read.

It's basically "where info should point to in case parse_engine is
succesfull". Pretty common pattern in parse/lookup code like this.

in this case we need to use the ret to know how many chars we parsed.

	info = parse_engine(p, " \t\n", NULL, &len);

would avoid the double pointer, but also make it harder to follow as
we'd need to encode the error in the pointer and use a different pattern
than the other functions.

sorry, but it seems this is a better alternative.

>
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		p += ret;
>> +		p += strspn(p, " \t");
>> +
>> +		if (str_has_prefix(p, "cmd")) {
>> +			for (p += strlen("cmd"); *p;) {
>> +				ret = parse_hex(p, &val);
>> +				if (ret < 0)
>> +					return -EINVAL;
>> +				if (!ret)
>> +					break;
>> +
>> +				p += ret;
>> +				dwords++;
>> +				wa_bb_append(&wa_bb[info->engine_class], val);
>> +			}
>> +		} else if (str_has_prefix(p, "reg")) {
>> +			p += strlen("reg");
>> +			ret = parse_hex(p, &val);
>> +			if (ret <= 0)
>> +				return -EINVAL;
>> +
>> +			p += ret;
>> +			ret = parse_hex(p, &val2);
>> +			if (ret <= 0)
>> +				return -EINVAL;
>> +
>> +			p += ret;
>> +			dwords += 3;
>> +			wa_bb_append(&wa_bb[info->engine_class],
>> +				     MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1));
>> +			wa_bb_append(&wa_bb[info->engine_class], val);
>> +			wa_bb_append(&wa_bb[info->engine_class], val2);
>> +		} else {
>> +			return -EINVAL;
>> +		}
>> +	}
>> +
>> +	return dwords;
>> +}
>
>...
>
>> +CONFIGFS_ATTR(, ctx_restore_post_bb);
>
>I know this is alphabetic order but let's be consistent, either at the top ...
>
>>  CONFIGFS_ATTR(, enable_psmi);
>>  CONFIGFS_ATTR(, engines_allowed);
>>  CONFIGFS_ATTR(, survivability_mode);
>> @@ -379,6 +640,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>>  	&attr_enable_psmi,
>>  	&attr_engines_allowed,
>>  	&attr_survivability_mode,
>> +	&attr_ctx_restore_post_bb,
>
>... or bottom.

ok

>
>>  	NULL,
>>  };
>
>...
>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index f337954066f55..c706585611d55 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -8,6 +8,7 @@
>>  #include <generated/xe_wa_oob.h>
>>
>>  #include <linux/ascii85.h>
>> +#include <linux/panic.h>
>>
>>  #include "instructions/xe_mi_commands.h"
>>  #include "instructions/xe_gfxpipe_commands.h"
>> @@ -1120,6 +1121,12 @@ static ssize_t setup_configfs_post_ctx_restore_bb(struct xe_lrc *lrc,
>>  	if (count > max_len)
>>  		return -ENOSPC;
>>
>> +	/*
>> +	 * This should be used only for tests and validation. Taint the kernel
>> +	 * as anything could be submitted directly in context switches
>> +	 */
>> +	add_taint(TAINT_TEST, LOCKDEP_STILL_OK);
>
>I know we add wa_bb support in this patch but perhaps this belongs to
>previous patch?

yep, it would be a better fit there. Thanks

Lucas De Marchi

>
>Raag
>
>>  	memcpy(cmd, user_batch, count * sizeof(u32));
>>  	cmd += count;
>>
>>
>> --
>> 2.50.1
>>
