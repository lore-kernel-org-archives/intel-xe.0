Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EAACCFA04
	for <intel-xe@archiver.kernel.org>; Tue,  4 Nov 2025 22:19:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9537610E67F;
	Tue,  4 Nov 2025 22:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cHNLMx2o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A7F10E67F
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Nov 2025 22:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762294772; x=1793830772;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ylm2zI35nATc2ebF9Xc8F7RXEBMRJzZor6ckv7F9VlM=;
 b=cHNLMx2oNBWUlI7xtf6ifH8XlxsMW5j94YfSwUu+mDQuUazoOE47AUuB
 9hXjEmH1CqRwRdGdw/HR39mbsWnBTM/dJiXUgcH4hqgmoJOie6ds7zRRQ
 upMcmOfng9acjbSwSXKOjyJP4WpUFd64VXraKgpG+U/iMjB1cRXNIvPiL
 0EqByn0jdsZ+K+hXJVzVgMC3V7j8zYHTGE0bDGG0mLGFvGKHKBrm6FJWK
 KD97pB1Q0BaP5tzahvGagatZkF+3qQJUK/X8HV/26gWjiRfisdC5kHtV8
 YLYzZMh4FI8Tx6/nlHgl+PtqEmdng4xjauw1wSi0Wz9h3ELksL+1WSche Q==;
X-CSE-ConnectionGUID: GWIxweVMTIaGfkXhKSk8sQ==
X-CSE-MsgGUID: 6ftbT3ppSbOUmKBqw50xNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64433491"
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="64433491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:19:32 -0800
X-CSE-ConnectionGUID: 02M09ybZTuqjjfRvAFJOxQ==
X-CSE-MsgGUID: Ybn3j2vQSRW8zbkmgbwQlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,280,1754982000"; d="scan'208";a="186568572"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 14:19:32 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:19:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 14:19:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.5) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 14:19:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yKYoqoI25+8GvR4dzLcrwWK4PZ4D42HcWHChXIDyjD3o45g5jklUCN4TZ8be3cvXWwNOSrvkVgNWWxwfgYAzmJGF+FXIHdwru28Mb7c1Y+6pod5QFmSy+p8Vk7GYTBFlYCCn8FnJoOqtlwXSNNzq7txE3kMxR+xliuYhdtTARCqxWKXGFpR/nN6vByx04VqWExnzNz1EFRNb73J0Ci7kCyCcsGd3zIz9N9HfTkndOW8PYk/FxKiIsv5c3iCRPQCL3sZJhZMaBM1MIgm9bO/08A0IutoeEfhG51U506+CZiud/H9kAYxbvGWRtEEO72glV4fjhOJq4QRj6ZCXXV6CeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dSA0HqQw5WWgMXhEKqWOs70bLodiOc3qhIHndXCpgBA=;
 b=aBpmO65xYHA13pLxg9pxAhJD+ak2/ZHRHA+BRLhaAmC/GAZ5P2eoNBix7KloADhuNx7lkK7O0FTO5KZ+V7C/xPuRfp8I2n3GzZGSMEHD6DOrOVWfsrTfn7qk/1P48Wy3fF1s2EAUEkatDsq56pIorFuw9bz4PlzzlqwZYiNC32FFKEi/hR3R8glGhiIp8vYqTN1WqHGemGPbkdnpiJEADtilDtZ4Df2vn0QgihtCm2evrRK67h1j5j3qd075jfTLYMhXdYNFa3X7QhYkf3tFzB4B67Aurx7qNiyqAOO7z3mOof/O5O6vxhalewIo00U6T9/SvAvO1wwQo18SYpv67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 22:19:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 22:19:28 +0000
Date: Tue, 4 Nov 2025 16:19:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v4] drm/xe/gt_throttle: Avoid TOCTOU when monitoring
 reasons
Message-ID: <beb3qawvx62udam44upaqsjf7ppxsaoh35oebtuy5xczv6hpyn@4eyzgcavv33e>
References: <20251031-gt-throttle-cri-v4-1-b4691ee9ebf4@intel.com>
 <aQWqyJD6n45ufeZM@black.igk.intel.com>
 <u5iaqtgrobvvzal4t7mjnspuacswc6ul5etk23toitrr7e4wdd@zkwdz2kvsfxf>
 <aQjW374EgQZH1_KZ@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQjW374EgQZH1_KZ@black.igk.intel.com>
X-ClientProxiedBy: BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::10) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: e8d8d363-16fd-4ffe-b23d-08de1bf0383e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?M7rRLTt2n7fzG+0CT+FFj9b+h5kbGpH/YxywQaG/CPArJmS4/QhFRUIZ5sng?=
 =?us-ascii?Q?c7DcoqV1EjHEFm2cpHsrEA91CEpIxzeSPEEzy1Nm+fmGN6lyWTSRG+jOPBQi?=
 =?us-ascii?Q?LvGg3kkM0LPMYRn1hlzNhVtyavJvU/aw22EYf8pltaf9m5lHGhAB+xkWZnfo?=
 =?us-ascii?Q?fLkDDSsu/Eq6Od8N/0TxtUtobq0stFbEUDQLNFAovK4aDbNOrYgqZK1eHpv4?=
 =?us-ascii?Q?24yY3cQIrUMIS02s9owLCLTD6bNUuPn47/44NhoYmD0/L7qZUYFlNaGbop5o?=
 =?us-ascii?Q?3mL02C/iLP4lNuYjZT+E2XNN6KRRizlAkq/q3KyN3wi6//qWWO09UdrMF7vg?=
 =?us-ascii?Q?pNMSpuRm8ljE06NEJ/rTsX2HFVGK9MjwspZqakwqfASLf8ADhQQ8GXNfd9iK?=
 =?us-ascii?Q?D0nYxq84JvKaCJXiluMTHYPdjcErmqebyTNp0sl64RB4lb4KgF/OyZmU0VdU?=
 =?us-ascii?Q?NX89tWURH4qcML0CSSos6gbjUHLpDprbk3Rcj8jjwcZoF+6wQ8HfHCjfczJL?=
 =?us-ascii?Q?7/4gyeTluo/1e/a6ld2QKjQTM1hdVr2Y7d2EolRTtQJEaeMOlFpeTpXHM87Q?=
 =?us-ascii?Q?NGtY/Eu+u3KrjALXFzY5tw4xBGs34Xu7CVphitpgJngTmLV3QcQEyYHui6cG?=
 =?us-ascii?Q?T7acdbJHYGpAC/QDOiatrv+fpZTtOkjMeJ3JFfVyjF+H/Goy+Dc2cosFbhPD?=
 =?us-ascii?Q?vaKKslgnWXehphPUsSB+DH1+wwnINv4ZluXcMl4vJgKY06Tfq8VVmRPEM1Cw?=
 =?us-ascii?Q?INNnxFzFZnxYmB/VdD1kUFXSOGqCTjupVPWsQ5QNKaz4hJTAPa52qX622xaU?=
 =?us-ascii?Q?GyaLXHhEo+ITV7/1FFyaXcGeOWu/q40DUwn5EtAv10QMUgUdOr/OGBHIAi0L?=
 =?us-ascii?Q?v4ramGV6lVISWKRQDZH0GklSoH7THYyYc0tycTzQCTAesxaZkRWYJVudmVFp?=
 =?us-ascii?Q?Z5IKZPzszepniNiCDWrqrDXMS4W/1F7AIlUW16Zw1Wz5KDb3bY5tNA+4bbos?=
 =?us-ascii?Q?hhdqE+LjmRB42Hw9cwuv60P5UgIcE+iF0TssvN7nQxOFdtDu4D8tkrZzaGk2?=
 =?us-ascii?Q?Om63SAYV5Ur75QgQj2NIfAP4b6UQMuYazkdzR0KjLTeivx4JbqmqIOyxsD7J?=
 =?us-ascii?Q?MkjqxzsHkFdutbFn5Eklo4vjbmpf71eJxzWoc4T+s7fiStZ43Qu9yPPfA8Cn?=
 =?us-ascii?Q?QH5i/JrGWK6LHPtT7eTk/9xbmUw9qLuRrkD9cMbYEK5UrUIdtvmQbGXATK9j?=
 =?us-ascii?Q?3xiTGtb4cZjN72Dtf7ntVq0gsPIECbdbzIotoTzplsv8usdFCS/5K+u6nj+M?=
 =?us-ascii?Q?t0Ns+eg20Yg+K5f2LtAfIMR0DTzUV23ikjuR+PBC2K0ftFZPPo3aIATtWMvo?=
 =?us-ascii?Q?1rX2ptTmJKCsVMHVNkMlCRwyMfW+pjVF/tXRYYqxUCGfVRSVYasAmmSdwT8v?=
 =?us-ascii?Q?wXiswEysG218UhWg0LJHnHcZobQ8MHnqV4HpY0aUT1hQEXlYUPUovQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZVWB110LbkY8ru8Q1fHAk6ZE8+5ytk0fGnsP/hnMwt2KQH+MsdtO9X5JWYLO?=
 =?us-ascii?Q?6W8UO7312xUBV1j5wj2GT0uj4f6WSV5qd+XsDKy+Y9ztDKwSSDhW9Rab2p8c?=
 =?us-ascii?Q?LyhWWOE8rvM/8n/PvlH1+TN2yIJDMhDf7lpz5IWyF920gnRkgmdr9I+OeBGe?=
 =?us-ascii?Q?g62wFKVI9WVArtMVpCSMHkxgAcu7Fcd7NBLCA5VNfH/BrRe7UZoFCLboncF8?=
 =?us-ascii?Q?3N/R3NpddZCM8n6ra9wUbPN8KBN+osJrIKytreQwMdMU/9rGHb25cngvwP/a?=
 =?us-ascii?Q?tC6n53V/A5710ZsAl4z78oLzEJKh6esQOdLAIwkBJd8U8qvdpJFu6dY/stuM?=
 =?us-ascii?Q?0eNcZ6BRtiwbXiKcO5u94Ej/zEdle1VhokhJzamtp6wv6TwOcPBwJzKKAFO0?=
 =?us-ascii?Q?PSn7Enbysrr43GdGHWtvnIhiimejKR7erBC/N2SfoxghslkjPV+PZon2W0gP?=
 =?us-ascii?Q?lq4AnFdbQU1TuM0u/k8XuJKvlqryMo0ilskFyZhndkkc83A1rpTMNix7+/LI?=
 =?us-ascii?Q?0haQgVZhsdUP+IOYySWIcLAACD+BU6Iq4olXbs5FXPsc+eqQMvSLPRrz2Mmn?=
 =?us-ascii?Q?gjBCDD2GatRbgk5mfqCr9tX+UCI9NxYy0UdOfvKUXgAc7l5+Wim9yezymj57?=
 =?us-ascii?Q?blTrJvVFfMfb5slZXXnU92NWU5Gqjlumh9K9dYw53X6bLiZ3CpzRNUAGEwL+?=
 =?us-ascii?Q?4yX1cbOLH1zqtmdczyFK/fhgvyPc7ecswxqvf39S6rvmVtm0TB7bwbiPJedu?=
 =?us-ascii?Q?fl0nDEYIksob9C8Ko9H4bEiJGiPAneZKvtxWqC7kyoXyTo6IxqRnieDWke9q?=
 =?us-ascii?Q?ipqpOGseJgdsDIydX9inAlehLhTECNGy7pRblUwCqpE8q42aPFJ4+QWmG0rl?=
 =?us-ascii?Q?HysTQ1XEQcNbhHadSy7+LyEWOUBSxvUgTZ9x8JN6CdHpd1a7r0pOCzLjLuBi?=
 =?us-ascii?Q?8vdX/O6Ej5UI1G9hautmNAZq2NoYsKIcGxu7lACjwEXBc/xSWnKfdWkCb+QB?=
 =?us-ascii?Q?vlyGf1cYCBVbbpdK1sGbx4TkJ1xexSi3kRai11mahIWvYKJKkFR7VAp2djnY?=
 =?us-ascii?Q?AYZ7nS1/lUPwN1UDdGi8fkkp9M3CAiBt5++jlLwICRk0W2AeyuQyRCLqWRP0?=
 =?us-ascii?Q?wbJqAvo+Ew6bUxk01izWs01UoNbDdPb4Nqixt8QvoKVP59+3vcVg3j59svCk?=
 =?us-ascii?Q?EmuEHuoFIm0hCGxKS2vzH2LyKnShRJa9RQ3PSFDjgNWRx50n4KdF3bHNJ9L9?=
 =?us-ascii?Q?4tJH4LZ7VwHfrKktna+RLYqWE2WYGCtw2mfWwuVSVy2/Wgh65Oy/IH6Le952?=
 =?us-ascii?Q?JFWI5Hi0lcKd22rsN77LA4mzfkBYk+US4cgV2XMuETNa83qNoj0PG2a8BnBG?=
 =?us-ascii?Q?gWjwnoaoK3w8fCK3eCQPG5bSB/vYe2WzFSdpZ3H3j16sj16JrESYPXOXvsyd?=
 =?us-ascii?Q?2TN8LwgxsTtHnfZ8zLbUDuYGR1OX04VXPzPZAV/plTqqa3sCGBZhZBhXHlNx?=
 =?us-ascii?Q?nqorbY+vyMjE4dcMX9gryfXQZQP8BtxaN8kSecQFQHN+6PeFp3CBDKgDwQpX?=
 =?us-ascii?Q?k9GpC6yRCPx4KEVfay99NY4pQTQi+Yff1gmnr8s517a19+wZTwA/Xx6+4a61?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8d8d363-16fd-4ffe-b23d-08de1bf0383e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 22:19:28.4845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 56RR/ME4k1F5rF8IvZcMD0ptr0d/TO7d8XucDmocivY6l6kFac5fdnjJWEDJhS842bMlps0SSYY3/22aQhjvJqA+iQeg3ciQXF997QVHjDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
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

On Mon, Nov 03, 2025 at 05:22:55PM +0100, Raag Jadav wrote:
>On Mon, Nov 03, 2025 at 09:20:40AM -0600, Lucas De Marchi wrote:
>> On Sat, Nov 01, 2025 at 07:38:00AM +0100, Raag Jadav wrote:
>> > On Fri, Oct 31, 2025 at 09:47:25AM -0700, Lucas De Marchi wrote:
>> > > It's currently not possible to safely monitor if there's throttling
>> > > happening and what are the reasons. The approach of reading the status
>> > > and then reading the reasons is not reliable as by the time sysadmin
>> > > reads the reason, the throttling could not be happening anymore.
>> > >
>> > > Previous tentative to fix that[1] was breaking the ABI and potentially
>> > > sysadmin's scripts. This takes a different approach of adding and
>> > > documenting the additional attribute. It's still valuable, though
>> > > redundant, to provide the simpler 0/1 interface.
>> > >
>> > > In order to avoid userspace knowledge on the bitmask meaning and to be
>> > > able to maintain the kernel side in sync with possible changes in
>> > > future, just walk the attribute group and check what are the masks that
>> > > match the value read.
>> > >
>> > > [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
>> >
>> > ...
>> >
>> > > +static const struct attribute_group *get_platform_throttle_group(struct xe_device *xe);
>> > > +
>> > > +static ssize_t reasons_show(struct kobject *kobj,
>> > > +			    struct kobj_attribute *attr, char *buff)
>> > > +{
>> > > +	struct xe_gt *gt = throttle_to_gt(kobj);
>> > > +	struct xe_device *xe = gt_to_xe(gt);
>> > > +	const struct attribute_group *group;
>> > > +	struct attribute **pother;
>> > > +	ssize_t ret = 0;
>> > > +	u32 reasons;
>> > > +
>> > > +	reasons = xe_gt_throttle_get_limit_reasons(gt);
>> > > +	group = get_platform_throttle_group(xe);
>> > > +
>> > > +	for (pother = group->attrs; *pother; pother++) {
>> >
>> > Shouldn't this entire loop be inside if (reasons), or did I miss something?
>>
>> it could be an optimization, but should work regardless.
>
>Yep, upto you.
>
>> > > +		struct kobj_attribute *kattr = container_of(*pother, struct kobj_attribute, attr);
>> > > +		struct throttle_attribute *other_ta = kobj_attribute_to_throttle(kattr);
>> > > +
>> > > +		if (other_ta->mask != U32_MAX && reasons & other_ta->mask)
>> >
>> > With above in place this will be much simpler.
>>
>> why would it be simpler? we would still skip the status attribute
>> (conviniently defined with mask == U32_MAX the status attribute) and
>> still do a & with mask
>
>Hm, I had a misconception that we've indexed the attributes as per their
>mask value. With that perhaps for_each_set_bit() would've been a great
>alternative.
>
>> > > +			ret += sysfs_emit_at(buff, ret, "%s ", (*pother)->name);
>> > > +	}
>> > > +
>> > > +	if (ret)
>> > > +		/* Drop extra space from last iteration above */
>> > > +		ret--;
>> > > +	else
>> > > +		ret += sysfs_emit_at(buff, ret, "none");
>> >
>> > I find the lack of '+' a bit more readable as it guarantees that nothing
>> > else is inherited here, or perhaps it's my needless paranoia at work :(
>> > Upto you.
>>
>> Keeping the pattern is good IMO. If we'd change then it would be for a
>> sysfs_emit().
>>
>> 	if (!ret)
>> 		return sysfs_emit(buff, "none\n");
>>
>> 	ret--;
>> 	ret += sysfs_emit_at(buff, ret, "\n");
>>
>> 	return ret;
>
>Either way works for me :)

I reworked this a little bit in that direction and will submit a new
version.

thanks
Lucas De Marchi

>
>Reviewed-by: Raag Jadav <raag.jadav@intel.com>
