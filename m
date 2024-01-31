Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302F4C47DB3
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jan 2024 22:47:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6904310FD68;
	Wed, 31 Jan 2024 22:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D69310FD68;
 Wed, 31 Jan 2024 22:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706741226; x=1738277226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/n3QJ9RIUYJgDI1XRzU1hnqJbCbMPYaZz5kxUTltvq8=;
 b=n2c8XBmJ7hObuMb5zyQi56uhh/Vrjyh+yOg5TRw07LQK9fQVmP1mpW4B
 0JwWvHPMxG3sQSalyu6cAL4rg9eqJmSoePZOVT4e3mgPwO2pfoqnfmpTT
 QQNHw6rslgrQ1BmBm0Bglkp1xN6dRKV5E/j9OlAmK6jKnrYnynMtklD/m
 Efe7Wo+7ONhAz5IikdSj4fPIRJAgI9PrF+bcOvRLFCnzjfC52MPyevVTj
 4hJN/Q6S+rK5Sd07tTL/uTTqFoMRdHRW1SMeNOdYykKmB1dXQsuunArhQ
 VM3ynJg9BfYUhcxJsXyzZ+dUTgptqpEanDNtSn61/U9o1JpCTB8dS2ZiM A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11119875"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; d="scan'208";a="11119875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 14:47:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="4187454"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2024 14:47:06 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 31 Jan 2024 14:47:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 31 Jan 2024 14:47:04 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 31 Jan 2024 14:47:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c5BeQ/1hwTK3chocEU5iURnHEMAvDlu2R9GF/tBnylPDbxYoYKYOEA/0CPjHMeiONCJ9YPR9CDrf9SI+sasKcDefQSwOHvdnYe6EsypEK8i1RuicHpfCcCicmnqSgcJcDnG2t38MDxytKKp6vKz1jEgKBoNXo8oeGPFAsYDqojLvpkudESKgAt0AsojGjrZS5AMaUC8dzapDQCcZmJL4CuhnwObRhJGw8h0Wlp9Gls1r8RMmetG6W7G8tlpGiJhQfDrJyU20QD5oBoTC0ViaVAOJMMZiEtOwokjlfDM7yp7BZvNTKbaEYSO1yEhV2QCcGZJI3TMkRV5ho2elznnMPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJoggVYqICmIfKSttUmfkjOAoNA+u9Nz+QpeYtXHM8w=;
 b=bW1vhj3DmpPfbB5x8089BoO/LvixU2Yb02E55AahaLO6cszIMRHFM8GPANIMoFDBig7fAeUjfurSkG/fciFxfFzpJ6kCALRkU6xNYvNkFYCVt0mIrhhogJzKiJPbj4cHdQ9elMofH8FtJUsbr4JStGgK8j5/Nrw25XqhQauDYrEaGST+880A4PiCLgQj5pVdsmi3FkSiJsvJfv96AFytif26h31so9XQdkrOzuBBqDxOV1Ckchu1cyZWOKUHaAxexijLo9LZltMeHzZX1ZOewnEB3VGqMm9J9ImD41mAshJXUzfgN8y1z5kb+EqkWsHPqTCGfuQ4wg5o6MD/Z0BgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS0PR11MB7969.namprd11.prod.outlook.com (2603:10b6:8:120::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 22:47:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::6c14:55af:8583:6ba7%7]) with mapi id 15.20.7249.024; Wed, 31 Jan 2024
 22:47:02 +0000
Date: Wed, 31 Jan 2024 16:46:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 3/6] lib/kunit: Unload base KUnit module only
 before reloading it
Message-ID: <m3j2mworpv2l3d7vtqcm3qjkrhqbnqn5jjqhbcpmlcu6nzx7ew@uu4k74ef2p3g>
References: <20240131181156.80571-8-janusz.krzysztofik@linux.intel.com>
 <20240131181156.80571-11-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240131181156.80571-11-janusz.krzysztofik@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0191.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::16) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS0PR11MB7969:EE_
X-MS-Office365-Filtering-Correlation-Id: cccf0af9-4e9d-4bb8-dd8d-08dc22ae8a7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IgARqBMjO2MLHir3YKk5s+9MnNboabFqfcy/Xo0RDHFX1U38Z4feO3XGkqHWc0DbpzvvdIh64W8740E1XF18C62RzidoHqCMvErcACc9RWV2BkByrA6x8q5bJmOeNxeUeXd2TnuNTd3reQGmOGMIzXvsIVkA8DixvOf4idmWoia/ZZpnmecYrx8eHdHUAZLGsW3RhpG2fkGyw0rXGfY/KpYVdDrvWKeeSiSMhDlx7U2hQB+pLKwz+cebBqTB9qVr+bguS1jp4iAd5QNOKm7TEcFxXaa9QxtDyCV94fh4l6r/qAydIvVgKaw466kwWAnGFbEWJgC5UW3wnHYcmio6CNhLaJIcYZkYT3TLcs5bswRCw6Qxf53z39YbpkUtS8keBOZQP8wiLgmNfGxhntmqCSyijfcTn5r4n983QSPqBlEADC6eFZrN6N0mNt/wkGCqWjgAjK4+KJvqFeAF+G6tcMJaOJKvIYoR1FkRBEwWiR8AUCl2Yf/F4zCZWErgO1jXF+p+hGNuzTCqSWcsrmKWrlj6NAOtFlimrK14/Wf0YESbR8QOnZXPg34pJmsE0cLj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(396003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(66946007)(82960400001)(6916009)(66556008)(66476007)(2906002)(8676002)(4326008)(8936002)(9686003)(6512007)(86362001)(5660300002)(38100700002)(83380400001)(26005)(6666004)(33716001)(6486002)(6506007)(478600001)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izeM8KA3kn8aGgAdlYdLZtHYXPRLYqkvz/lXbRqoj+Llsdj/8Vm8YEq1X0oy?=
 =?us-ascii?Q?0L40HRCEYZEe6WBuMt82945I9DzRbQbUob3aB+l3Fh6co28YXPm0Yl3MXJFG?=
 =?us-ascii?Q?WLpP0ghUZMV/KKMKZuhdrfJu8dRbaBAqQGIkIkgnkDcQIa3nXv0Wem2BX7Hw?=
 =?us-ascii?Q?Y0sKzLqLZHGKvcP/bZCqYQBAnXJkpiq/glvDUUfPt762CzrtOq2wsBHWnrdK?=
 =?us-ascii?Q?tW7M23hrFXTn+jAYDAh3mTkPQvFsL2qU5gjTfjG7n839vC/f9aE2h92u1i/2?=
 =?us-ascii?Q?06M/4/YTtLSkVZ4zHfeHLG8pLKZuUEkEtaPnXX5/imKPUygLWfuo9bPiOOBI?=
 =?us-ascii?Q?GqRGewIgyCbUrCvCl+rRz1KLqE0iW+YOeEP1fI4EKVrsQFLSinaDGVZXYIJq?=
 =?us-ascii?Q?PpMy1JIg6orv7j0F82TfNbjmhbvQ4C/Fyo0YUZ1wxl4Y4mPm3QBlj0cb/Md3?=
 =?us-ascii?Q?uAdo/V7fozhdLU9Z67sBVnmkTCRCznawfi9BAVGP4PJeazzJRtPThuNRTWYy?=
 =?us-ascii?Q?fgl6R1jKM8GEVoVTvuUvekXSYB/YVZkpAdVLP9aB4OVn//6mRfKf9ACbCIiQ?=
 =?us-ascii?Q?6om6uVgTdf7UJdCDoVeteYCKzKuPCyZvGQ5iO8T93Q4a2/5Rk66YmNYZkoyP?=
 =?us-ascii?Q?HfafuEeTxtpn1mbsEJKVwE58kMe6VyMR5RpJyD7ubViOydTf9TuYQHEiPib8?=
 =?us-ascii?Q?e36O5A21pvqItFhovMAgUgDUHkQtAB/S0NlUBrUP6MaYmRkfza4jgWMs/WRq?=
 =?us-ascii?Q?QrajyKlWHDk6TJUF6zlme+CIm4/tYt5qFKm4yLuwkdYfASF3j0JDXvtlc10Z?=
 =?us-ascii?Q?k1SCAwjmUATUiQCQHR05nNpWjuoy2qriEtL9rH5XXbzUt4QkqcJwSLlbumQV?=
 =?us-ascii?Q?8SbSU1aivPmtYT9xeFquTidqcAplbR/Z7OIFYJPR2nnXktifvCBjNxB2tc8m?=
 =?us-ascii?Q?iSWAyrMkv8xGgSihvtqL4pbvHppmUKzJfCTyobddy/zD5a7vt/jePzq512Zf?=
 =?us-ascii?Q?GRBsviLmJutkdeeRxhA3nkokz40+DPt0mrjEd3DCGDowyUXpvh3mflrYx2GL?=
 =?us-ascii?Q?4Gcl6wdUkIHoRUBOX7SBf18VeqRtGuvWBuZf1VdZsFF5rOgYYKvhNKp1IFKo?=
 =?us-ascii?Q?KrtxMNFfnTooMds/pGCSliDfoMcQuTfeN2kOGfqkIE7VBKDkwGqvP1Z88Lro?=
 =?us-ascii?Q?V46872d9WR6oRJVqBNaWQjRx1jVSRjVDdAqocyQLukcAZ//3hcI17EfcWp+A?=
 =?us-ascii?Q?rkDoDnbLjdBBp5cbCUUrWXikAY4sKkySaJ9DsGvryLSpV+USBXCp0kdE97sJ?=
 =?us-ascii?Q?Ov6jyTbb7ltExE1Yco4XahLvSuGZINqY1tJW/CuyTror9ky429GozBbu9sts?=
 =?us-ascii?Q?9h3naFJPGVO5JAPdzkgCCnApxTPAAIGK4RjKGlSVnsD9JcDG9C6W7Ej+uQgJ?=
 =?us-ascii?Q?kXXlH4iUpeWXS52vA3ZLGfJf5bwWP9wFPjHc+56RnFHMmRSHpih3fer+h9Sl?=
 =?us-ascii?Q?6KH8WxLIlkIf7Rg4MY9VdCFuAC7BFJM5DzrakWVLiIPPMYNRmAnuuTlMwfQL?=
 =?us-ascii?Q?c4c4byMVeQLCrttbYF1JVLF8ZDUPkfKmAmm5iCRHLyH/6J8HZtp4tp3oIVMl?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cccf0af9-4e9d-4bb8-dd8d-08dc22ae8a7e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 22:47:02.5159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AnVsba4WwNCBdmoMYAr4+fOEESaF3FSImOch98Nr1eNMGmmd4AeYumAhGR6NDFtUCBvlbrC9p4vybQa34tuJO6aeRCqFTYCPirBPT97ymWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7969
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
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 07:03:50PM +0100, Janusz Krzysztofik wrote:
>In preparation for replacement of the current method of reloading base
>KUnit module when a new set of module parameters is needed with updating
>those parameters via sysfs, unload the module right before it is now
>reloaded with new parameters, and stop unloading it in other places.
>Follow-up patches will remove some of the code added here, but even then
>they will be shorter and more clean with that adjustment already in place.
>
>Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>---
> lib/igt_kmod.c | 23 ++++++++++++-----------
> 1 file changed, 12 insertions(+), 11 deletions(-)
>
>diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>index d1091bdc79..d2c28d0a64 100644
>--- a/lib/igt_kmod.c
>+++ b/lib/igt_kmod.c
>@@ -1130,6 +1130,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
> 	 * iterating over KTAP results collected from blind execution of all
> 	 * Kunit test cases provided by a Kunit test module.
> 	 */
>+	igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));

with the rw params, we should be able to run with a built-in kunit. Will
we be able to with this call here?

Lucas De Marchi
