Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7FDC35FFC
	for <intel-xe@archiver.kernel.org>; Sun, 23 Mar 2025 02:47:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9C310E176;
	Sun, 23 Mar 2025 02:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cD7Ozq6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 317D510E176
 for <intel-xe@lists.freedesktop.org>; Sun, 23 Mar 2025 02:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742698063; x=1774234063;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iQrQ4TjrZ8MvgoZ+Q0Jt/ToxGsengvl+iw4/nn1Ze7A=;
 b=cD7Ozq6NbFXrckiJEXYJRLCn/x7QDrv9u2rYlWtYOWHctyXk8Yakcr1P
 rwft9AX20Bc41CiTk7srEKbpsVvGQCC+rXdroFQvGtFxrc2we9oLRJ+md
 A/zFaMHf/bklgalorG7DmJ2gQ3ssS+pKjeGT2Ambx6jmCB/6z7lhV+Waw
 yP2NX2a6n7ab+30NVz75wiWkO1lOvgvAZ7wySHUHWPmhtmENpmRS5t5q3
 bIvVtYuAd2SDs24IrCc9nQFKnoKVjlDBneJdhNMxMo+aYO4heOlGCIRrs
 MhXP/XfMBihKvkvZDuiFHO/unmDSpO4dRiTQSHVwrkM3RYeLP5NWW3nUj Q==;
X-CSE-ConnectionGUID: n5kykfx5TW+1f8lDJy5gSg==
X-CSE-MsgGUID: 11ykRhDKSg6asT+nApP+nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="44050257"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; d="scan'208";a="44050257"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2025 19:47:43 -0700
X-CSE-ConnectionGUID: Q2OkdwlUQP6emz8ZZjOueA==
X-CSE-MsgGUID: xKVYuzEZQleEw8iP5KFl3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; d="scan'208";a="128403504"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2025 19:47:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 22 Mar 2025 19:47:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 22 Mar 2025 19:47:42 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 22 Mar 2025 19:47:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q8wd78KfqJwHSXUlAjfDGI9+quEWxjGMrkrqneRZWY71k8caR9qaN+53FLzBhOt6AObepxczIjlebZeulHQWfz5OSQuXFXU+Tvy2CKghBn52RLEZHYKSCLP4SBqgBaqdIRhoxKw0ZEp2NofXXwhCYDjcpGkfQ1E7lAK+dZo5SPFtsHBMPuBbeXZMlQ3+jzepfUDgpJdqsllfCFBj0omgqB+UpJ+Gd1XS9x444venwdOPEv5b7i/DcTc+39ewh+dG5RYAU/EmV9MfsqDjtKn6I1N1OunarzbpE3hGAqvYgGItrSUYRvxBTUwkwZ/D6JcZPNuPyeFWehz8j421fUqGSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUCB7fzDO9B991eSHHsVLZurQPGWDCGcRMrim6MUcz4=;
 b=EKN2kpB3GunQ13evJ0kZq0iFdIXqF96M0bH+AnZFBYayWCiSOZ9X1tqVqbgzxduKdFCr5e7oy84yDkvIQZWcKMCY86NMTdeTyT0TECiGU6fRvxZK63a5dc6E81kZNcW9fbvsGEIkEk+g73eJGrbYfIE1Z5VQL8dfrYMtQ3K0RHsvTqaiGRjHUxsnCRpgjzRkH+WQSB514ZzxbqsE1+9pw5Zwk1IZ7/86xUlpvNf6OLLsexBsUsxE9ANafFe5UfImaRIu7MTic0cob2bNU+562O2aoLWxhzgQqSSGZ3lzzstD/gjMKgOJvsEVnAtxrYyTBkqkyWUp0nHR6kjOXURqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB7153.namprd11.prod.outlook.com (2603:10b6:a03:48d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Sun, 23 Mar
 2025 02:47:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.036; Sun, 23 Mar 2025
 02:47:07 +0000
Date: Sat, 22 Mar 2025 21:47:04 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events
Message-ID: <iizcoecokne5qgkpr7kp4misfdok67eo2scj5czijpo6vqitks@xs3ehyr3kcbb>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
 <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
 <87o6xsai7y.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6xsai7y.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW3PR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:303:2a::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6b963f-5e53-488b-e239-08dd69b50073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PxKPKPDSNntB8iocdxEDuv13eihqIfazcrH+nIF5rWqht40zHhR6p12Z9s?=
 =?iso-8859-1?Q?uAOVBCJfKHLlXFTFJEGOQoo9cdRr0z37TvbH8Hqlch59KlkBu52YumDBGx?=
 =?iso-8859-1?Q?TGj/LtRPxktXg/5Sp9PCz/eCYRYe6b5WaScxU1bFVJSFRpqMQfBqmJwMJ+?=
 =?iso-8859-1?Q?pgCSHO5VXRunTIFVFL+SLs/G7/FORyPZmyr4FmMiooh241qwRiqqJZMN6s?=
 =?iso-8859-1?Q?qC/Elrz7sUID17aZnRrhohqhEm7IUTDnNhVQJa5V9Wt1NE7EWSs33QI7Dt?=
 =?iso-8859-1?Q?1l9joOU6CxlXor65A7ZrPm2ZBkwwwLzh+qh0hrqGha3+sLg3cEqB8YXtFl?=
 =?iso-8859-1?Q?5PbL6OIURstEH8eNbhnoW7prvHmJLxFqDADZm6azNIgXw08ZIZuiapZ7b7?=
 =?iso-8859-1?Q?tEn1Kkwkv9Sfdq5oNPHvVpom321V9vMoFiRocxh6FXYybExccxszoem8lD?=
 =?iso-8859-1?Q?X4f6qNe4eYz6wZXbMCiq1v+w4mxgEDCMS8BazEfl/9y6USlFq2ySA23thQ?=
 =?iso-8859-1?Q?CNxdEShQilBnncalXzBQOHgrDNEY4ghDc7VeiY2NvevD6JXip3M8aqw56w?=
 =?iso-8859-1?Q?GzQvUhyFd+E7GzzGZlaeJK7W/cneBYpzYGlziOk9GXDUptxB/6MrMSASiO?=
 =?iso-8859-1?Q?AMV9/tEiU0pp9G/Cg0PF/bhB+hhgR6SpZdJn4T/8KAb0235EnUijcnLGct?=
 =?iso-8859-1?Q?hb0Bi0ak5RBq60pGd/r+OE4WzPHNk96C7d6M3ETgO60r8U3fdneAGQTt9V?=
 =?iso-8859-1?Q?Eo4QMVV8i+I7FOasJB6mZrHpYcxAcureJ53APE6NTTtCp95/VLRo6NMETU?=
 =?iso-8859-1?Q?5Hd1TRd9CVgwVy7VNEB6U3Mt9X8J3zoMLgqtls2b3airrl33HQhbVg/Mjw?=
 =?iso-8859-1?Q?vFFiRwh2ACjE4zykpOGXKzh+K1G+Q4YvkJOMytYo/3HVgTSq77uo0SAj7Y?=
 =?iso-8859-1?Q?I99uholNDGAUj6Ocl+fPLY/ng4cfHGEWyH9s4HNLRVayJFShr6Ab5tXN5Z?=
 =?iso-8859-1?Q?ZIcDSqVsTAv+tn0UJQJU65Sl0KMtApXXew5pn9sQ9gniQsCp+UMGHy7/ae?=
 =?iso-8859-1?Q?uQSaffmQgH7+d0qPoIuc5Q/EMRiMXa29RiuxXeAd/xF/lnvPzOQa2W4nW/?=
 =?iso-8859-1?Q?qN6dpc5gP0XhocygE5GzZckO0wtz35JgsPKp8OKU0Yy/lcrvCU2Ntmkmv9?=
 =?iso-8859-1?Q?EPdJ6Q0fexryelrmcbY6KwlKDIaqGcS5bJnw8h17x8sGj4OWe6v+9srPRE?=
 =?iso-8859-1?Q?5jziYFwZu4lHtNkaDQGkbt767o/9xBbW6StwTEqGHs/Jp3v0ivAbJlz3/9?=
 =?iso-8859-1?Q?Ybs0p8ID/JQjU4AwXdPFSAloR9l0lxaGgEnFeDzo+DGNPeJbpNUPv128Cz?=
 =?iso-8859-1?Q?NswD9Y2UraiOYeZcE/mVe21R0ydP2kKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DNSxaUTeS4zi0GEz4NhV7dBA1aTKUG6Sd0NQk2+gx+8rylhCKfaSfZKhbB?=
 =?iso-8859-1?Q?4Xd7vYFW6w+GLvD2ikPK6NNd4rR1QeSZ+hZ64RggGWd0C39eaRQbSMLAxp?=
 =?iso-8859-1?Q?7bJQ7MqAlPJDb6qKwXJdVaKpl1ex8nByrBAqIyep5RlZJXgolSCUehPsxn?=
 =?iso-8859-1?Q?KlKepglpQoh7z3BAPbVUdwfo819/+11AgIwV9/ovuMQfVtMjIWP8ol2iKU?=
 =?iso-8859-1?Q?E6qinfkOkI0QtZ5hp57zoyPyC7HkiDpzNaIf+snwsCjMiLRrQnQsu/3Uh9?=
 =?iso-8859-1?Q?RngSPnZPycCnWCbATwW3+cZkajaNNt2U0wMvAt5Isbb6xVTZNcl1Vrqoax?=
 =?iso-8859-1?Q?s4CXUjGqYYB7+qawvxZFVM9mmxwsKA3DmdJfqBPWJDpSl+OmBhnb6JCugx?=
 =?iso-8859-1?Q?AjbPXJOvA13x2NPjxhJyze9Sq3L1VA+/YiWKMwwe0OWKzoOD2/Qk4ZOENY?=
 =?iso-8859-1?Q?ALuXsYCLx2YPZsMkCFwXCGYrCduK6Icpy+QBFwdzlX/O28CQUhpzMjkifO?=
 =?iso-8859-1?Q?/GF2gNElNwuewL9bLXXeJmq2uZkV1shamdttcuiW9yuq6TbeyhA5anKtRT?=
 =?iso-8859-1?Q?Ql6v8lj6xxiuvaPwa78qxnuKchXUtTloSN4c4g7aC+Ef7ftrZF/TG6DzIa?=
 =?iso-8859-1?Q?8NLSddSgUNSn5x2uaafXKuv0a5doDWyp1kbMjlR0A6yHcRnrOw76jt5R8+?=
 =?iso-8859-1?Q?TzJjDNn/LCflZIfNHAgf5toutvdc0ZZQlsGkCJHjpTAmIs9p1IMA59Jc8q?=
 =?iso-8859-1?Q?oH6xvnv9/e8mzs5stdC444D9Ac/x+2Ea9z2ZagcTZHUqdBwCFXUv3swJby?=
 =?iso-8859-1?Q?9WNggdHCEY8A4PUWARnn0JUGVpj2Loih6L4OJ9P6LrDluxC4B/AodjwVJK?=
 =?iso-8859-1?Q?Wbpv29uicc+mw2FMydAn4pIDUh4IpP94BvQRcCC33EZXNAfDY7X6cozhkF?=
 =?iso-8859-1?Q?Mow6CsFIVCAItFbopBdk8aJIWt1Vo7gwYOluw7KpQKgdOecodpU4hAuQWq?=
 =?iso-8859-1?Q?br+7NwqIXxIg6RTod29r3r5hP8V2jkoUlMJqFQPJLf45v+/ERScZ8/Fk4L?=
 =?iso-8859-1?Q?3CjDoBoY+tDOu8wMoYZCcegG8Xkqa/azfKiffVqtr5Of7SexZ43iR3CpVB?=
 =?iso-8859-1?Q?aDpQz9Mug+HnstVnihv6hgADg2gC2nLRjR3k1v0Gs4LyTGxWkhAaCwJp4U?=
 =?iso-8859-1?Q?MeMKcfr/avmHZdWajWXPuTF51ujmm57/tfNMEz/3geG4Y5k6g0TU1pLPYv?=
 =?iso-8859-1?Q?klXJGUZHVkBoLQyWKd4z/iSU9/7IL0nNf/ytUirMKjdQG6IdqNf8EGSW7f?=
 =?iso-8859-1?Q?+ojAQ9fE26yffeCLKKL/T2moEvJKnfrqGgl6OB6Q2+09de8pAin+re4ura?=
 =?iso-8859-1?Q?jIdzCaahizCOBuF7/pIet8ol82Mv0scKWYCxcl8EWDyjxyLddd045E95W1?=
 =?iso-8859-1?Q?Ihk184vOxfEMtrxP6HA6/afWREvGVLqpLdf8en57mBif2jfp9iXlqu31gC?=
 =?iso-8859-1?Q?lnGAikh/XEulvG8K3XP2e65QDMvC32Jzji8G8sisoUzfVcKiXI1wZlpm5a?=
 =?iso-8859-1?Q?mL/EzQwQiMJvOfX5EDthsmaWXndjsviOZT3rs3hH6HDcpzkRObDhUX/xXw?=
 =?iso-8859-1?Q?Pmm7/9ivpsx7KCKG6EjklV6WIzf7YSSs164fUxt++AlodzCrWjUjc4ig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6b963f-5e53-488b-e239-08dd69b50073
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2025 02:47:07.5897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GlZbL546S0YbW8t2dcM2me0u1xHtZRxOZeOczxeVfkNrbVopY82kkZZ1Ezx9wyb3LOHB2XC5bt2NPn5LJAIIPdEdZ36Smhp2jryEgeYxe48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7153
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

On Sat, Mar 22, 2025 at 02:06:09PM -0700, Ashutosh Dixit wrote:
>On Sat, 22 Mar 2025 05:57:12 -0700, Lucas De Marchi wrote:
>>
>> On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
>> >
>> > On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
>> >> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrote:
>> >>> Define PMU events for GT frequency (actual and requested). This is
>> >>> a port from the i915 driver implementation, where an internal timer
>> >>> is used to aggregate GT frequencies over certain fixed interval.
>> >>> Following PMU events are being added-
>> >>                      ^
>> >> why do you use "-"  instead of ":"?
>> >>
>> >>>
>> >>>  xe_0000_00_02.0/gt-actual-frequency/              [Kernel PMU event]
>> >>>  xe_0000_00_02.0/gt-requested-frequency/           [Kernel PMU event]
>> >>>
>> >>> Standard perf commands can be used to monitor GT frequency-
>> >>>  $ perf stat -e xe_0000_00_02.0/gt-requested-frequency,gt=0/ -I1000
>> >>>
>> >>>     1.001175175                700 M xe/gt-requested-frequency,gt=0/
>> >>>     2.005891881                703 M xe/gt-requested-frequency,gt=0/
>> >>>     3.007318169                700 M xe/gt-requested-frequency,gt=0/
>> >>>
>> >>> Actual frequencies will be reported as 0 when GT is in C6.
>> >>
>> >>
>> >> I think we need to document somewhere, but at the very least in the
>> >> commit message what the event count actually is. Let me see if I get
>> >> this right:  if userspace is sampling every 1sec, and assuming the gpu
>> >> is at 700MHz for the first 0.5sec and at 1.4 GHz, userspace should
>> >> expect to see ~1050 as the value. Correct?  I find this frequency
>> >> handling very different from anything else reported via perf. Other
>> >> than i915, are there any other cases you know of?
>> >
>> > Yes,  user will see a gradual ramp. One thing that could work is
>> > something along these lines:
>> >
>> > @@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct perf_event
>> > *event)
>> >                 new = __xe_pmu_event_read(event);
>> >         } while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));
>> >
>> > -       local64_add(new - prev, &event->count);
>> > +       if (is_gt_frequency_event(id))
>> > +               local64_add(new, &event->count);
>> > +       else
>> > +               local64_add(new - prev, &event->count);
>> >
>> > This will give us instantaneous values and will not need the use of an
>> > internal timer.  Should be ok to do it this way?
>>
>> yes, I think it'd be preferred. It's much simpler and don't prevent us
>> from eventually adding an avg_* event if the needs arise. Which would
>> also be clearer on what that is.
>
>Instantaneous values would show 0 if the sampling instant landed when gt is

instantaneous values make much more sense from the perf point of view
IMO. perf is **sampling** them - other than the same thing in i915, I've
never seen an event that returns an average (not even documenting it as
such).

What would also make sense would be to support perf-record so the
samples are recorded in the buffer that is passed to userspace. In this
case setting up a timer to save them (since we don't have interrupt for
our pmu) would be nice.

>in C6. Also instantaneous values are already available via sysfs.

with the caveat of a slower interface, but yeah... that's why I was
asking earlier: do we really need this if it's already available via
sysfs? I was told turbostat wants to consolidate all the data to be read
via perf instead of reading a bunch of files from sysfs.

>Also, the way i915 calculates the average freq is itself
>controversial. i915 computes average freq when gt is awake and disregards
>those intervals when gt is in C6. There was this patch to suggest that
>average freq also take into account those intervals when gt is in C6:
>
>https://patchwork.freedesktop.org/series/109372/
>
>But it was not accepted since it would change uapi.

one more reason not to fall in the same trap. Let userspace decide if it
wants the average or not. If it'd need to sample too frequently, then I
think we need to look at supporting perf-record rather than doing the
average (which is actually an integration, using the rectangle method,
and then dividing by the perf_read delta time). At the very least,
rename the event to make the avg explicit.

Lucas De Marchi
