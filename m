Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C58C52D7C
	for <intel-xe@archiver.kernel.org>; Fri, 23 Aug 2024 18:52:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B4B10E06E;
	Fri, 23 Aug 2024 18:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZUt0NIqX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450DB10E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Aug 2024 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724439175; x=1755975175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NUtmxMBX60FmiqyfuSAld8Pd6khzUSHRkeVl448rV3A=;
 b=ZUt0NIqXKMxCFWmECLVoWTohOjA68b2hgHWozWMxZ5tjCQntRpRVSU0W
 ZzRwPQqO9/vU/nad7bJCVnlrC9h+In9dchM6XkdnZ99CNC/S3tqqDWBUp
 u3hsf0lW05R2dC1hwdgijO2Avis0sPgKep+766LsppGxfiPa9FpdTM/tg
 RoZHBk58FA7djEqHi1ekC3S7hsj62Xm5+YTGI58RLEvxN78CkI5KXY1e3
 /zBX1NwhqJL6zZ2ikEL7J70FaHWFFHykdfQ2kgW9cKTlv0WlauBshCchP
 aRAVbEHYUIS4iPdrCxEveZ8hxiQPnpTNkbhOo50hB1Hj2ekXD1cy2mfUk A==;
X-CSE-ConnectionGUID: C8ckGi+wTJ2ConrnYzY9MA==
X-CSE-MsgGUID: YWFAQKOXRqChZ0fjhR6Uyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33547254"
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="33547254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2024 11:52:54 -0700
X-CSE-ConnectionGUID: p2ZG2tfqQjG+rsivibBq+Q==
X-CSE-MsgGUID: Y/CT7PUjRhKSEqPNlTHjeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,171,1719903600"; d="scan'208";a="92674190"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Aug 2024 11:52:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 11:52:54 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 23 Aug 2024 11:52:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 23 Aug 2024 11:52:53 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 Aug 2024 11:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQ6chJBxGU3LwZq3vlHyONNxzp62ytJ3jGO2n95ARqNanEQGUICZ16L36WXjnA6gvrXZn+JR8qdkzUvqm9UW4EfYr25nXWho37T1MJPthuuxDv6ccSQG/3qPrbim1uJna1jgx5dZRZINx2H/VF0VYTUXC56ugWDh4SisgjGmEQcc1GzQkV9BmK62QVz2YJgfGsuo82Q8dGTwfymmaECSyUzRXWCLmZDciAyC63q6foP1fP+UPwLTzK4gVa0OvDt89z1RzDQfIfQ8yLTTACy0IEL8OUZDh5mY9qsxIIxi+HFEF1tO4UbbnUqiKI9mwbnt11VzjJnl1ctnZDy+L0QEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVWW8ktdpvxDek9wIP3mpPiH8M5vMabw9R1be5P0d/E=;
 b=DtklgOMQHqyr5naqDMkmyTYtVhaK8DdCFvgtvJEpMKf5bkftT1yaG+8l3EkDFVoRY6vFLoV0//qw0Se47Uum+WA54FM/V4YPCJVLKDuFPNhrwTyQwVj63kBr22eH207caFpSXeORvSeRi9ZBTmy1FHqBp4IblvMz8sCU6KUbDL9EydXonAXonHi26hETWzjRSQ7p31z7vtgYgLT00MK/XUGM9udafno7dLV3xhGVWyCbRIjDPt6uEHyoG47r3AKN+cZG9tYzuNQolr9PgrHHJmTF8Z8jcM75r7vDEdeTZ/DUq55WOhl3C0nKfK46NgFaporq5Z2cmV/6E84UWtwPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7559.namprd11.prod.outlook.com (2603:10b6:8:146::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Fri, 23 Aug
 2024 18:52:46 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 23 Aug 2024
 18:52:45 +0000
Date: Fri, 23 Aug 2024 18:51:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Use separate rpm lockdep map for
 non-d3cold-capable devices
Message-ID: <ZsjaM2xDiVo3ddFX@DUT025-TGLU.fm.intel.com>
References: <20240823165817.96481-1-thomas.hellstrom@linux.intel.com>
 <c518fb6b-ab55-4b5f-b1d4-f503bb9f051c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c518fb6b-ab55-4b5f-b1d4-f503bb9f051c@intel.com>
X-ClientProxiedBy: BYAPR11CA0074.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b423eed-2dab-40ee-71ff-08dcc3a4c66b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?TbApNbufB3UZJaiLxaKfPgpOWuxLbMolQLvwCXak8D5IJI2zap4VkOipDC?=
 =?iso-8859-1?Q?fmuCWmFIP01SdkS6bOH87sT0fhPC4xHS/13pCUmPLHh5LpanWyA30vJ+rZ?=
 =?iso-8859-1?Q?zYpKCPKWhnFEbi6fQp5oH/nGlE+iz80hd51BHx46+Tk/fTzqEDvz8KeN8K?=
 =?iso-8859-1?Q?Gj6W5b3LzhFdvTWw9iv79ZXcYaZM8W0r7VIRyuwtV7iO4bnoH0Ee7G1KQ8?=
 =?iso-8859-1?Q?+NG5+jcvGfDScnPHowcFOMeGnpA6oASrzhVib4GMKHYZgpla08AM2UOsq4?=
 =?iso-8859-1?Q?r441eY3b13GfTHvX6Id4SUBbzJCa5W57jLrg93Ji6idhTBRETznXgUDQ4l?=
 =?iso-8859-1?Q?wMm0mPHJqio59viV+zYPGO52zbmiHvt288noAkBQojzrqtGK7TKQmQ0y6f?=
 =?iso-8859-1?Q?PuA/FWokF//d/DCz5YkdkAumw4HMBv+b+kkVkj55jNKeMEhB/JyY6o24Lv?=
 =?iso-8859-1?Q?PIhWqVCQB1dee2bHrB8sJ8hixPoYZ+5Rm9uKro01FbRFlYBbzM6Bq9lAxY?=
 =?iso-8859-1?Q?kOLVVS0cARd7QhwDVBb7rmDntlZiZhVE2UiIx2XDjx6Sk7uck4rbHq42Tj?=
 =?iso-8859-1?Q?6maijNrKh+UDSmdPNmAxU9Xnwq9MXKrB/m3g6xi1G0OKz3ZCEy2WmS4UON?=
 =?iso-8859-1?Q?H2L3lUYlGbNKV3Det8EtNeqMHXeGNM761u3LfbDI1F5sm7UCYLxhNW9lya?=
 =?iso-8859-1?Q?ebop+Pt+qsesKW9oPibNq6FDARK++Z0z/Nf9/fXFv4tNSSapPVhmMLzo76?=
 =?iso-8859-1?Q?lFFNCEqLWRLCZ1ZV1Lsg0ip+HMCevFASDl4BQXuMDY3kBGxB3B/Aswbl93?=
 =?iso-8859-1?Q?/fpBfZfAiq5Vu9cVV5LlDGQSyDWnaIeAHfxpJEANP5xXzByqX0chiKxnCH?=
 =?iso-8859-1?Q?lhj+7BhIfW4zhuBIIKRqeNJb55BQbRS3ehOgBMrTRazbIfyuUka0b1rW9Q?=
 =?iso-8859-1?Q?Geyi1mqJ7pymocaXmQgzbZM2W2+c7ZO7v/6qFtFGqlaOAGP2uYPxhJrLly?=
 =?iso-8859-1?Q?MWjJDTv9ySRmCQ2UOL/RayAvZ3v/EnV2WqKktcYYJceRZK3oKdKuMut2tQ?=
 =?iso-8859-1?Q?oLbxtoKtpgiMiFVD1RmywkRIhOKTKM04RkTfGJetGQQ7GmEFsDVYfAoCQE?=
 =?iso-8859-1?Q?kl790j/btn9bhrt0XOMWpD3aqn527y7kIJfMI1sg+pCdddGmfNbNsFrABs?=
 =?iso-8859-1?Q?mf0sc60GubC14q550CE00eiRUnFT4qHmkC63nD8Yp7B83CyO/krwC6Dw2z?=
 =?iso-8859-1?Q?0ptG4Dwyd5+ETetz3hXInVuElpKUXKVrLZssQjl9dAMeVvFdzyvh0OSvhx?=
 =?iso-8859-1?Q?/7/6uytnJ8Imys91Xm7bcyEOcwIfdBKwOyTUW91Yh3/r+s78o/7LV46d38?=
 =?iso-8859-1?Q?+MC1FhwFgKw1YnCNJIvI5aeT4EZGilYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LOI3DO7eWxbtSuXdX8np+wL8moo/zs7g6iZ4x+0FNRp5lvkjDv6wGQT/oq?=
 =?iso-8859-1?Q?G6yFWOrgCN/FqV2RFvVA6XtFLt6jPMPzwxaekY1nNucyHU6c5SKFmHbJSm?=
 =?iso-8859-1?Q?a3AL6qKCsNP8/mGi/SYRB/c62XtjflxCxU+dhYAi2k4IGcixBg2CnjrJCX?=
 =?iso-8859-1?Q?tj9jwDBZbbvN/tw2sv+PK1v+TiFOo7f2VWBEEpdNZ26LFE6C9/Z/B3Ei64?=
 =?iso-8859-1?Q?OQgb8720/oKINBp3AbgRDWJ9syji+ULfHb0lxLpwuduo2fDXXF7PbB5Xz4?=
 =?iso-8859-1?Q?aVIqr21ZxUJ7ymPew+GNAM7VTvHByJC1twmFBSw9gwdcrtre8mVibplyz/?=
 =?iso-8859-1?Q?vEzraJVVtrgC1MUScuK1qjeD+P4sgf3qrz0/Hn19L0iNgd7w7l0S1mGFmT?=
 =?iso-8859-1?Q?/mWyjiZ6HYzr7aNfFV7O+vSzCEMBSrKld1+iQMqlgYiQJ8UlIm4et686wi?=
 =?iso-8859-1?Q?AxNIYbL9NIS1znOf4K+IQPti/rRqsou22xW99qzXSF/0TdddSmQQbzqa+V?=
 =?iso-8859-1?Q?+nSJfHeYx+E5EzL8QUrKSsZFA7yc8X5RUoT9uPOSGQkjOxFNZxnPsGrPUh?=
 =?iso-8859-1?Q?LfziHTF3mQS25uuPlXgnDe5DyIocamLwT0CzMMCNCOuz8hmDR996EnNMZ6?=
 =?iso-8859-1?Q?zh5r21m05FstdjrhDpkwTnOQY2vNLFZXncPouzP9+FohJo8rvboZnplmfy?=
 =?iso-8859-1?Q?2j3DXZzxldy2v/57Wcb9IYvdTlDQ0AnofBdLTXPx199cioMDclGowKcm1J?=
 =?iso-8859-1?Q?JwSDV6EfKoVfbfhkMaB/DOIuKMnx4TNAic0GrhCthyzic2es7UeQAzTkL+?=
 =?iso-8859-1?Q?5+SfY6res74R+mmEJxPfKaVB3hG6U3TaQz0QiEoBXkhnnZrUzbqs+5Ayxm?=
 =?iso-8859-1?Q?vv8DMga7ZE7Gf/LFZRkNzBupOuoG+7Bwm7g0KrE9qSbs8bZ9M0DcFQYFYR?=
 =?iso-8859-1?Q?+LPKyKmQsuo0aLBgXsbvuzdlhc0SXaq1tieyPQNG7T0q/JyZ8/qM6A4Sij?=
 =?iso-8859-1?Q?HVHR0EWG+uPsFOgp/u6YUbP28iUi+XqIQubWxeOD57B/KFZN2dSVN3YL7r?=
 =?iso-8859-1?Q?e/9ajy7s7FmrrbKlBXzHfXh5WC29G9d2KVGByTtlvaPTXgo7FqbywK78YM?=
 =?iso-8859-1?Q?ptbbEbkiXJQEVqW/SFFbm5+ULMipia7sMPIcKwFyIBOwbG4bwzQqihH5X1?=
 =?iso-8859-1?Q?qNNdxWpC1d4nt8nplgGni0g1vJt8xutLnKGinDz3UFb5ri2ecOuqZIAKYH?=
 =?iso-8859-1?Q?o+n/3UKmXo/RlDZiuxW2ez6VbjhOsY5AU91q3RmnF1zRho0lVOaqmXqUSm?=
 =?iso-8859-1?Q?cyqRqRAmMNMeEr9tpwGjIFtKvHKJhGG8PC6+1FMd96atfWQNO6o5+TZJW7?=
 =?iso-8859-1?Q?pxY51qEkWPzvhk7iM7Mn+8g850Rtoz/ZIje5LMKv6+xHIWxXdJ2psLz0zC?=
 =?iso-8859-1?Q?JPOyKSca35xrDHKryQZr+/gLlWO+mNbhR1CnOj9UrK+u8Xc/JitHu+9Xcm?=
 =?iso-8859-1?Q?zdFNcle5Hk9oQYa8O15BrWKBTNSu0U0wWTF/Eki8GdJrcX7xyej/9y/8A6?=
 =?iso-8859-1?Q?Q5JSqtG4O6hR00qzrZnuwDkx66OqjNTHAk2FAgqioWFZ7zPl2vA9WUpdLH?=
 =?iso-8859-1?Q?2U6vubGpJX3JZF2PayFBi0Nd1SYTZ/M6fOosWrhegJYjZYcNONG4RGqw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b423eed-2dab-40ee-71ff-08dcc3a4c66b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 18:52:45.2004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V5brrOkSdBShPHDIYCNcKNFzdspLxQsD5eLrTb5eZHNp6LeQ4frfkFztNEaLSSxI8kzdcivA9aU9xIfpSXvztA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7559
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

On Fri, Aug 23, 2024 at 06:13:02PM +0100, Matthew Auld wrote:
> On 23/08/2024 17:58, Thomas Hellström wrote:
> > For non-d3cold-capable devices we'd like to be able to wake up the
> > device from reclaim. In particular, for Lunar Lake we'd like to be
> > able to blit CCS metadata to system at shrink time; at least from
> > kswapd where it's reasonable OK to wait for rpm resume and a
> > preceding rpm suspend.
> > 
> > Therefore use a separate lockdep map for such devices and prime it
> > reclaim-tainted.
> > 
> > v2:
> > - Rename lockmap acquire- and release functions. (Rodrigo Vivi).
> > - Reinstate the old xe_pm_runtime_lockdep_prime() function and
> >    rename it to xe_rpm_might_enter_cb(). (Matthew Auld).
> > - Introduce a separate xe_pm_runtime_lockdep_prime function
> >    called from module init for known required locking orders.
> > 
> > Cc: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
> > Cc: "Auld, Matthew" <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 79 +++++++++++++++++++++++++++++++-------
> >   drivers/gpu/drm/xe/xe_pm.h |  1 +
> >   2 files changed, 66 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 9f3c14fd9f33..747fb96453d3 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -70,11 +70,29 @@
> >    */
> >   #ifdef CONFIG_LOCKDEP
> > -static struct lockdep_map xe_pm_runtime_lockdep_map = {
> > -	.name = "xe_pm_runtime_lockdep_map"
> > +static struct lockdep_map xe_pm_runtime_d3cold_map = {
> > +	.name = "xe_rpm_d3cold_map"
> > +};
> > +
> > +static struct lockdep_map xe_pm_runtime_nod3cold_map = {
> > +	.name = "xe_rpm_nod3cold_map"
> >   };
> >   #endif
> > +static void xe_rpm_lockmap_acquire(const struct xe_device *xe)
> > +{
> > +	lock_map_acquire(xe->d3cold.capable ?
> > +			 &xe_pm_runtime_d3cold_map :
> > +			 &xe_pm_runtime_nod3cold_map);
> > +}
> > +
> > +static void xe_rpm_lockmap_release(const struct xe_device *xe)
> > +{
> > +	lock_map_release(xe->d3cold.capable ?
> > +			 &xe_pm_runtime_d3cold_map :
> > +			 &xe_pm_runtime_nod3cold_map);
> > +}
> > +
> >   /**
> >    * xe_pm_suspend - Helper for System suspend, i.e. S0->S3 / S0->S2idle
> >    * @xe: xe device instance
> > @@ -354,7 +372,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   	 * annotation here and in xe_pm_runtime_get() lockdep will see
> >   	 * the potential lock inversion and give us a nice splat.
> >   	 */
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_acquire(xe);
> >   	/*
> >   	 * Applying lock for entire list op as xe_ttm_bo_destroy and xe_bo_move_notify
> > @@ -386,7 +404,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >   out:
> >   	if (err)
> >   		xe_display_pm_resume(xe, true);
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_release(xe);
> >   	xe_pm_write_callback_task(xe, NULL);
> >   	return err;
> >   }
> > @@ -407,7 +425,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   	/* Disable access_ongoing asserts and prevent recursive pm calls */
> >   	xe_pm_write_callback_task(xe, current);
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_acquire(xe);
> >   	if (xe->d3cold.allowed) {
> >   		err = xe_pcode_ready(xe, true);
> > @@ -437,7 +455,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >   			goto out;
> >   	}
> >   out:
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	xe_rpm_lockmap_release(xe);
> >   	xe_pm_write_callback_task(xe, NULL);
> >   	return err;
> >   }
> > @@ -451,15 +469,37 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >    * stuff that can happen inside the runtime_resume callback by acquiring
> >    * a dummy lock (it doesn't protect anything and gets compiled out on
> >    * non-debug builds).  Lockdep then only needs to see the
> > - * xe_pm_runtime_lockdep_map -> runtime_resume callback once, and then can
> > - * hopefully validate all the (callers_locks) -> xe_pm_runtime_lockdep_map.
> > + * xe_pm_runtime_xxx_map -> runtime_resume callback once, and then can
> > + * hopefully validate all the (callers_locks) -> xe_pm_runtime_xxx_map.
> >    * For example if the (callers_locks) are ever grabbed in the
> >    * runtime_resume callback, lockdep should give us a nice splat.
> >    */
> > -static void pm_runtime_lockdep_prime(void)
> > +static void xe_rpm_might_enter_cb(const struct xe_device *xe)
> > +{
> > +	xe_rpm_lockmap_acquire(xe);
> > +	xe_rpm_lockmap_release(xe);
> > +}
> > +
> > +/*
> > + * Prime the lockdep maps for known locking orders that need to
> > + * be supported but that may not always occur on all systems.
> > + */
> > +static void xe_pm_runtime_lockdep_prime(void)
> >   {
> > -	lock_map_acquire(&xe_pm_runtime_lockdep_map);
> > -	lock_map_release(&xe_pm_runtime_lockdep_map);
> > +	struct dma_resv lockdep_resv;
> > +
> > +	dma_resv_init(&lockdep_resv);
> > +	lock_map_acquire(&xe_pm_runtime_d3cold_map);
> > +	/* D3Cold takes the dma_resv locks to evict bos */
> > +	dma_resv_lock(&lockdep_resv, NULL);
> > +	dma_resv_unlock(&lockdep_resv);
> > +	lock_map_release(&xe_pm_runtime_d3cold_map);
> > +
> > +	/* Shrinkers might like to wake up the device under reclaim. */
> > +	fs_reclaim_acquire(GFP_KERNEL);
> > +	lock_map_acquire(&xe_pm_runtime_nod3cold_map);
> > +	lock_map_release(&xe_pm_runtime_nod3cold_map);
> > +	fs_reclaim_release(GFP_KERNEL);
> 
> Would it make sense to also prime the d3cold wrt reclaim, but with the
> opposite ordering?

Do you under the dma_resv_lock? dma_resv_lockdep already does that.

Patch also looks good to me btw.

Matt

> 
> Anyway,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> >   }
> >   /**
> > @@ -474,7 +514,7 @@ void xe_pm_runtime_get(struct xe_device *xe)
> >   	if (xe_pm_read_callback_task(xe) == current)
> >   		return;
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> >   	pm_runtime_resume(xe->drm.dev);
> >   }
> > @@ -506,7 +546,7 @@ int xe_pm_runtime_get_ioctl(struct xe_device *xe)
> >   	if (WARN_ON(xe_pm_read_callback_task(xe) == current))
> >   		return -ELOOP;
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> >   	return pm_runtime_get_sync(xe->drm.dev);
> >   }
> > @@ -574,7 +614,7 @@ bool xe_pm_runtime_resume_and_get(struct xe_device *xe)
> >   		return true;
> >   	}
> > -	pm_runtime_lockdep_prime();
> > +	xe_rpm_might_enter_cb(xe);
> >   	return pm_runtime_resume_and_get(xe->drm.dev) >= 0;
> >   }
> > @@ -666,3 +706,14 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
> >   	drm_dbg(&xe->drm,
> >   		"d3cold: allowed=%s\n", str_yes_no(xe->d3cold.allowed));
> >   }
> > +
> > +/**
> > + * xe_pm_module_init() - Perform xe_pm specific module initialization.
> > + *
> > + * Return: 0 on success. Currently doesn't fail.
> > + */
> > +int __init xe_pm_module_init(void)
> > +{
> > +	xe_pm_runtime_lockdep_prime();
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> > index 104a21ae6dfd..9aef673b1c8a 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.h
> > +++ b/drivers/gpu/drm/xe/xe_pm.h
> > @@ -32,5 +32,6 @@ void xe_pm_assert_unbounded_bridge(struct xe_device *xe);
> >   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> >   void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
> >   struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
> > +int xe_pm_module_init(void);
> >   #endif
