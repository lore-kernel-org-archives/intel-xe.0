Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF67FCA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 20:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7681E10E1EE;
	Mon, 18 Aug 2025 20:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DZPVNW/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC2BC10E1EE
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Aug 2025 20:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755549746; x=1787085746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4t1KmOu+Z9gDhTVYBw/qm6SwPim6Zx5QL/rXpztiOCg=;
 b=DZPVNW/YTN9tg77uz507suCpXP2p/0fB/C7eWqumnfxkjhWlAn3oDg4K
 v1SqfWlwfRFJ8RqT3MHyIUgJvkMLpyZcTBhv52HVhlH1efOi9d7fwJeDd
 RStl+eRE0l+Mu4giQzkyllN9XABrSyXWVuMc7cOwNivJac70IVVrmfnhe
 EDI6HijAMelvHj22rTAYvo1hVG88xGanwE4TEnuNSHcuBCHZNmRYzt0Ld
 1XEpgOdXgb1TuJZQcFrvfaTVKvDCqt/cMwioMLvIRuOJmH+pNpvKlBGpm
 WUXNtwgPz0VIVbKkoSuU6hHgMwbg5SFGbYQ+w50KXdyy+Ai0npr/p76pO w==;
X-CSE-ConnectionGUID: QW24eU+xQgiZ63sjLYqsxw==
X-CSE-MsgGUID: MUiho1Y5RsO+e6zufeaxbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57712949"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="57712949"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 13:42:26 -0700
X-CSE-ConnectionGUID: k0R0AzyoTe6pDv43SuJYxw==
X-CSE-MsgGUID: sZ2I1CpkS5KTW0ywGzC1DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167290173"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 13:42:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 13:42:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 13:42:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 13:42:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvIZTgJGSVW8ZS7ZVTZ2uI0O3je0KwVh4z/wvo33E+j7l1f1tPwia6yrd/ueBVYMbcEpW0z8NICIh2DijFlGi/XoGqXbnFRaOlvi00nlbtE9OE6lP3ibf/XrZs4gd4Gj8Vob8C+DYJUViPvmsV2PCyVCv2Qg7EuM8r1adC16AcAlke63QZquLv2/KHgbd4UQSRZjzo9VQ10VdDsEVAW9pPrzAIleCXc1v3ePJfq+kl0LzXBkCF4rDgTEx5nFLPRk8q4iVqEo7zUaQ+UIkZ5KNQmWCf30oAXAJlYVGacdM5Ks/emuXgJP5Bj87egov1+kSJP4/l8dgrF9NYIcKN1KUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4t1KmOu+Z9gDhTVYBw/qm6SwPim6Zx5QL/rXpztiOCg=;
 b=ItpVaJIEvble7FUWcICIX2AiwMNxtzMqBk5FakLordHwAphYVMtrqPvGMh/ug/OjjCBNscx/WXsSk9eHP+kJY23F/SHvj7OXyTCJ6okl9U/wSGb7xkFNo6i98YHjJb9X2/DXems6HRJfNzAz45eN4vsW65oJlB7PG6io1LhTuY22WKpBTwsx0sTdxyu2NYzbh43ne5jj8yPGoC+jwYoulzCX8jg8KVFw/qHGoFlrQkWUecYeaYRY/Ou2m6PVmbT3FWlM/bbipybM0ccQ+A+PsWmK6RB4ITA7IVaVi4q5ZtoNvUtIEImshqBhxDWjT/tgVJEEM5ypjWakDtS1ak7RdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH3PPF2CAD058EC.namprd11.prod.outlook.com (2603:10b6:518:1::d12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 20:42:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 20:42:20 +0000
Date: Mon, 18 Aug 2025 15:42:16 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/kunit: Extend platform generator with PTL
Message-ID: <5chau7g2j6ausdqv7ogzufhb67a6zlrzzfy4oqy5xyft2acbw6@delkdg44r6ok>
References: <20250818192032.633-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250818192032.633-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR08CA0051.namprd08.prod.outlook.com
 (2603:10b6:a03:117::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH3PPF2CAD058EC:EE_
X-MS-Office365-Filtering-Correlation-Id: 37268e2f-f5fd-4d85-d5f1-08ddde97ba69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l1RAKIfLidVDgtO7VjqLUyRXOtAr9mmI/Ujcjh1uvcLxnJ07R/K1dfqWaSp8?=
 =?us-ascii?Q?5kHxJ2Wn4tLqQSW6jbE63ha8NDZQno6EoknzXM+kp9FANugmrX36EEOOV2bY?=
 =?us-ascii?Q?/4XD6HE2jtck1N/ytQLFMM5sjaTLxAR26FRRbYF77BekTWjMfx6W8sut+VJA?=
 =?us-ascii?Q?gILlYGoRbIphB/W//xAzejnh6KZzfAB1M7/o1aQc56JIXX6xCHtn3V+xM2pl?=
 =?us-ascii?Q?0eZk7U8Y1WmlLu8kp2/bKunLCiz4v4KDRZ3whiBGNw4HV5+6yw/eFOI89O1o?=
 =?us-ascii?Q?3uxupYx2KcoFRxTkJkgJmlSD51PBwIFGsfw0WBXyyiVEUGmuJzWyZqdirHoD?=
 =?us-ascii?Q?MfgzbBN7Ddt5nvTEM+DI5zrJTfBd5FDlwv85dPuZqsPjEGgTyxo27upsSWba?=
 =?us-ascii?Q?Tr8IO+bNCpp5ozlxsvLzeKY3xR8oDpj+T1Sp+T7AJ8qB/RyVAj7hPeJ6aiCV?=
 =?us-ascii?Q?qQXsF/5/KfeypA0usERDUDfQggvxLUWryxAZLTb36uDYH+gM9eBNHts+k3ny?=
 =?us-ascii?Q?ba5UL2Zh7RqxVWHrUQvT0JnNcEf4fGPZETNI7pGMwKGn1CoC0AtFUoZ6Q5KY?=
 =?us-ascii?Q?XvkZ+kDprUVs6FUJHQjSHuRqlsrgikK8hbAPUED5GjDOcTTACX9sazZPxYNM?=
 =?us-ascii?Q?e92E1+LsmImqDY3Gxd5+ddgugaxFtlQyjeE0z+WhkO/Zl6mwKrxMhlt9T8YI?=
 =?us-ascii?Q?HgPMUuIXFsvvyGTMdla+8tXHR3ztNQWIdZumkhS7+8cJ05qhlX2JkJZVuQKQ?=
 =?us-ascii?Q?bcNL1B4hVhmlvOyZH4KQ3J1aRK/sAktON2qRIxf2lqwznGG0ZSd0TybobPSH?=
 =?us-ascii?Q?G/2+dykB6g/GDpxd5n0hQ5EaoS5H6UUikxTQC/3PCKQfeFRuaMxfmPsXD3DO?=
 =?us-ascii?Q?WTlZXCI7c9qvDhHsemnxSOLpeT8L4JOccbvgD+9Ud1kJ5PA5TwuW7thzEoSw?=
 =?us-ascii?Q?lOfeCouEn6Wh1vKeeANZSa25PzcxrpPQOVmkLqXLI0b/EGOUvDGDykOnuz4O?=
 =?us-ascii?Q?evbkNje7ZT96Nku6V35VAoZED09W9yYbkZv/8TYaKNUF1pgCBEYoj6O7XP7l?=
 =?us-ascii?Q?rptGST63UP/dU/I1VtvzMp0hEpv9o7GlQpFI2CV4imLIosnpE4p+02hC2cpE?=
 =?us-ascii?Q?Yx7ioeKtBpMge3MwCd6RfPxeXAEYn7gPDlgaOpzKEwIcDrmsDX5uQkoeI8F4?=
 =?us-ascii?Q?9qq+nUcIDY5cb3jeqEl35yFm6tmso/RzG0M00JuI7anREmm9Bw9XkdQcwtkA?=
 =?us-ascii?Q?Z07vT3XtO46Xscxv/DzZEVBxk04ZJMqPAPYmjU73fk5FJ349TEbFP3FHjRX6?=
 =?us-ascii?Q?3/bhxYJYvVauAPw1fi9HPnBjAJY8onzSxqcyfUuZIa/1IBEYGkF6bppXstJj?=
 =?us-ascii?Q?0MLORNwtkXDy2r8Xo4xjBMv73GWOScGEQL55bMmMVjnILGJSTl5cH+ohGqsL?=
 =?us-ascii?Q?J6c2juA0rtw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EaVDOhH7eApNkMsrMniBP3z3ch1uWgCMPWqXxdo0ggW0udTvRz8T2fSSW2am?=
 =?us-ascii?Q?sDM5pRVVRWLVVNS5iqOr8Tn9ugfzfWruBRSvei+Z/8fjtOlPRg7WHUcEWIHE?=
 =?us-ascii?Q?Efv9CKk6qlxRXxrIbswqxxKVX8djCZQxV5NejfLDdZwSCFOjXnNlXk4D7Kmp?=
 =?us-ascii?Q?v2pA6f4D8u/dK+zWqfxG8OzL/VWLqnUGjWvTJxVV7q+0jEX7Jls/epJwQg4m?=
 =?us-ascii?Q?StAqmJNZD9w1UnA40KTqZSUmaVyDm9k1gQQoLKy2gr43WV54U1d+ewLlUy55?=
 =?us-ascii?Q?8ygP5FOxQKUUFU4GhQVJ4KCJ48OXax1wBXnSDKo9A8/Rq2qRcqB376taNFT3?=
 =?us-ascii?Q?iEp5+HAnu4cWXquHvt5mN4B5y79L7NSVXvTPlcR9bojVcf64C8WhhGgajH8J?=
 =?us-ascii?Q?4keAWhSylSfCUqiDIfZGl5t/HL+0CpygZDpLSKTRbniyi0N+rak2/GBIqFLV?=
 =?us-ascii?Q?dgj/xKC+agUSFlClyGHUKoeoaR/TmqK2S4zzuRQ8bXYXyMGJN8Z/5T1UU544?=
 =?us-ascii?Q?0xtcbkDiaI24qjSVHo5FuGTaH/q8fScslNzscAm1NFvPpxI4iMdTKl2gfjW2?=
 =?us-ascii?Q?8fmzZK0eCL1gIllBshMHpCgG6wGFOjIh+HLn1OCzk78GhEVIYzyg5vIVCHp3?=
 =?us-ascii?Q?SIm1RCfuZfmmib7pbmv4d201LsCp6NsLKOkwW0hRRqlIhXrfmFpzyko3MhK5?=
 =?us-ascii?Q?wyTxzFZCBTaTM8j3mZTvBB/sLD0S9zSIeUW7kajjTfv4oNzLQw2qY6O/gm3b?=
 =?us-ascii?Q?I1+Fx26U8udxqPHYOjmXoHOuehpXf9xPq9wl/po8A3aB8AkwxKLWucnJ3RMm?=
 =?us-ascii?Q?WR+n1IDEbRO/6cV8Ww8+HKITDE6iMRFwVcdLvdVhe871k9LPk2TxHLRM2/uS?=
 =?us-ascii?Q?nwiDErInD5dIEaDgwOdI8BQW4pkyfYCvTjublkoR5fZ9yYMOjcvLrtKCSjP3?=
 =?us-ascii?Q?SSfAHUknWJ23SC6McGemMKJ6NLSq9pRly46/ykE+JfNmjEbxTUOqqd1E1Pje?=
 =?us-ascii?Q?Zq4q1/7YKsvD4wuSAZ70/ll/0gWyJbyfy6V1TXjgJ4corNQ4N41gNUMwo3cY?=
 =?us-ascii?Q?vLBYMsuZ8WthcRbsayZxM+NlRJ+ZaynIVvTBP4zczj2uoSpNawcJvv9v74M1?=
 =?us-ascii?Q?aq722mSIJjlFfesQcyTg3dUptS0kJpNVGATJQAsuGgBFBJNk2tKNXJHZVk/0?=
 =?us-ascii?Q?KVj5hyIV543T4MiOdIDbqyBwwTIfRHGYEDkET5nwDjooslsq7suHtvy3Nlg0?=
 =?us-ascii?Q?q6ESbs5BRyJ1makCx4WvraB6a4nhclQLO+2nchInpYIX867Iow0GDuB87PVu?=
 =?us-ascii?Q?lSg0hpyt//E1FBNZiaUwmCAOHfYRWG+EPQg5mK2GPJb4O+H/iOevbi84uIbm?=
 =?us-ascii?Q?TSEsZ1B9cnJh1cGD7m9R83CGc0HJFAnGTNwh0dlHO1xn1gio8vm8Q1BRf4K1?=
 =?us-ascii?Q?jTt2UYN5KTjE18mNSXN7HCQqM2XEic3ppB6pLjAPyLFlLkvTrKuJCPSa6WWv?=
 =?us-ascii?Q?cY2mJS3yNDb5M51aGazg3UnATRMLu3X5t6e8Ob9uZvbJiM+baI6QLoHTdw61?=
 =?us-ascii?Q?hqzznNbZOGGRcH7DyBwgKfODw2h+iWaImi4AJux71xuxe2ZJavoFgn9R0RIO?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 37268e2f-f5fd-4d85-d5f1-08ddde97ba69
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 20:42:20.7486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: utqtRGjyVfkKIxtsBPRB5bQTswJZ6FyrNSd46N8AR2QkT9+2NG+p+6piGCsUff9inRguw+g66C3BVw4nl2pN4QozsgSnK0ra5tzyqcYfKlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2CAD058EC
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

On Mon, Aug 18, 2025 at 09:20:32PM +0200, Michal Wajdeczko wrote:
>Our list of typical platforms used to generate test device objects
>does not contain any PANTHERLAKE. Add one.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
