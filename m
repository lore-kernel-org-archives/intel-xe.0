Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDDAC27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 18:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBDD10EE1D;
	Fri, 14 Jun 2024 18:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPOpi6oW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E57510EE1D
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Jun 2024 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718388871; x=1749924871;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=nBi8jNKUNF3E26WPqJ4IKSh2u3+yfq5bNTFa7cPqrJs=;
 b=KPOpi6oWoOydmrJhA2GEDsexhDX2RorDkAGbHrgXWFIrlevb1QOGLVM8
 E+MdUCegDfej9/+MuGh3wPRS8pc4gzGcaEy58ZLC1V+fLbkIxDxfynIOp
 Px4jGgK74+iUOqNaIwo0gcKqOpiKYkq88Al/fujejdn/heJdoqNYyjAVK
 rcEm/2OiJQBpIfRq2IIqKSE7S4d5mU6KuSND3XucYfbIleAMkwjeQMGcF
 dj1iaygJ7CaNmbkOnGMuOITRvbLbEHNx3PgWMYErtjsYNJCFGPMp5SZTA
 bKk8ndCIgV5qyG+bn2Tp+Ig9vW6jxI0vNrbf6eMdKffKuD5wiqMDSWc/r A==;
X-CSE-ConnectionGUID: GK3+c8xuQFWQoc6x9dheNw==
X-CSE-MsgGUID: jR5u3LbfQqCej26Vml/T4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="19073876"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="19073876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:14:30 -0700
X-CSE-ConnectionGUID: xglJwMC4T+yV8N2RR1N6jQ==
X-CSE-MsgGUID: ZoGLh5h8QaeIWbQrOCp06w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="41251623"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 11:14:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:14:30 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:14:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 11:14:29 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 11:14:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luHum3FzhwFUvoFp4aPIhenur2R3BC3YjJltBHk7SJWXYwAe1bNqTnrb8qj+DMNKVYdMUvVK/Q0BATxg2HmHqGjNTOI1nmTCTo0TM1bwDzrowp4evtI+6Fw6cd5xfnUg11N2eipYqICAfSiTf7KOAykNUtA0RlQiXQoDMkDlr/cUzzzoKHZF6jYElJ+w+wk0wRslCtKihZiPZAqACyyWO2O/MC+u+xvjLGH8CXAXzuQAQWzbeF4sSt0osXo8NjDyErTqMdm3bcwf3cdI9QuEHXELNLGrjzi/yVXRLqBCSw8ew0Y7BEK7Zbr+eIOExiVUi43L+txR7QlBLX2lAopHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nBi8jNKUNF3E26WPqJ4IKSh2u3+yfq5bNTFa7cPqrJs=;
 b=MYrKyuBSCaXx/SSWv5gS5VtqPFFlzs++kImjqDkah2mBtZy1pxF1PhrO5Fa2GOYLo0r8MVoddTti/hfGC8heuUIwuKYL4UYsKCHXuOzSkewje7LhFa+QZzbKFqxoRwVwt4L1AeZebY44iknm/XbMtRiVs3/Lj3ASVibFEcI7VuMYzeYh/fbsO8rpH9Rl7TT+vgR6CtCbkUWz01Dxz7iVGDs4qEiw7Ul3vKeIXih3hhY/G4TtizXG1E/RdNUMm4UMVvLt7Q/QKej+ueIQfRciDFckRNWTrCHuNtIBsbxarNxke19yLsrtCPYmCUTohmosf0MZgBLc6i/lSZ/mhZvrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24; Fri, 14 Jun
 2024 18:14:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:14:27 +0000
Date: Fri, 14 Jun 2024 13:14:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2] drm/xe: Use fixed CCS mode when running in SR-IOV mode
Message-ID: <bj4mocvgelphy5yrlafuehv4bfgud4yl5p2yijd7edcdjvge5y@gy3mg6ccqrkh>
References: <20240614101415.2208-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240614101415.2208-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW3PR06CA0029.namprd06.prod.outlook.com
 (2603:10b6:303:2a::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA2PR11MB4874:EE_
X-MS-Office365-Filtering-Correlation-Id: 09572258-4d2f-4ea8-db15-08dc8c9dd3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|366013|376011;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8tzePCCbBErOPw/m8adNM1vUfxl81uFDabZUDPSXPFVG28g3KbK2en2WxPc8?=
 =?us-ascii?Q?kbnSv5WgwusKCKs9D7QnO6T4E9B1z9EoakMuQgIUXcvGLCpFUnGHUpVa0UPb?=
 =?us-ascii?Q?MhXoi2lQ1mswju3rcvyEEH5Pcwhhl7DQpxJms7FU+AaJDKAIobfScSy+ACxw?=
 =?us-ascii?Q?kIo5ErDlMwcAhC/HGpOw3TUU3KIUAzSYJiw/WbDkvrQw9Nd3w76djaXQRntg?=
 =?us-ascii?Q?Tc//O+wD2d6up8+GDDvpyh/Kb541FTCyiSZ5rynYeYwhZuIkWuv9YkOI7wz7?=
 =?us-ascii?Q?CBLykGqg/J7MExjXAya1dbOMQjuaAR11NMrS0xED6JXRnBzErmJL0yYdj4ho?=
 =?us-ascii?Q?aLUpG1k9hc2XT4LUaVHS4paZvqyjZgADi7QYelBqji+mzd4kq2FOFGvn/QgU?=
 =?us-ascii?Q?Mjm55vd4JqmfE3uTG3BG7Q8yLoGsq45DjePlwG0i/sERKvCJN3iUpao4qwG0?=
 =?us-ascii?Q?cXbvZnIiA0qfVQ6zRLUL5dYiusB2tSQYLFEVd+m1xZEtnj6An7dzYgUyOk1y?=
 =?us-ascii?Q?ikcPQX/+gmmZugqyy+ht74W+XY1Jk2ph+WgWTGJ5gWP8MvTtstx+8mZ7qH06?=
 =?us-ascii?Q?UuaangOE+C7keconJuGcRbfI1ZtijqjlGdpN7ocmtTxKdSpMPI4qhS6AfXm5?=
 =?us-ascii?Q?QB1MeRL3T1Xxcn6tvDDJZj5Xzwy7ch8F7Gx964fdS9DWci3/xWJ9lSSkGef4?=
 =?us-ascii?Q?burbusD09ofWZholI6TOT4HVx6lLkWNJUGfgOm6b/JLRAClhis/3IpmEDb3m?=
 =?us-ascii?Q?cg668Nny9r5EeaTtfpI/zizMzSE8VKeuioWeQRax2qjrGrdY1viYY2gkhXUi?=
 =?us-ascii?Q?VmA1ZgR91G/W66lcaYFePapLovIFoe4JlEz/KQe6UYsMpqYH7RLAvN11sv7E?=
 =?us-ascii?Q?zqhT5Ggtm+8AtT3aeLGXtpoE6VMM7upile+5ofWvoXcTmKqFO6c2JheqB1gw?=
 =?us-ascii?Q?h8dzP26ggubqXD5hFxis9DJrzDX+SZxVG4y1/Fh/1VmHluwjSf22z+Bv1R2g?=
 =?us-ascii?Q?b7yIxsaCH5knd95ZDcWsi1V5EEa5Iw9ig97bVYNcmG1LAIG7EyAyU9rvFQAW?=
 =?us-ascii?Q?36csyZ9pHJ7O31nrCxJSek8rQN36+piGXBaD2skXjiupCPDoLLWWsqcmDiTC?=
 =?us-ascii?Q?l13raz/ZE8XAAJRx4PUU01Y78UYOIPf3mB+ID8/UAhSAmEvdWcOrFGdkVffy?=
 =?us-ascii?Q?J/q45mIY/BC50smS/IUm4YtsOwzaQ1DUEXU8U6G1la4SmntDE3TsFWsVrA8N?=
 =?us-ascii?Q?ZOxMh8E2kGOEPpeV5P9PYthk3qhzpYsPalUCJyCuTLZ6NGYDGFKa6xuPwj+l?=
 =?us-ascii?Q?JjxiTJO/t6yZZ9AfNZWOpNR/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZCavTTWmnfGlkf+Zx1nmg7jkdFq4JNo9L/8MISdJhHAgPeCtMdNUKL12kkG?=
 =?us-ascii?Q?OjB8dPP0Iugc+GbvVonDnq1OXJZGk5JC19j2bS8LZjlgb6JrUJK+KWFfRMlE?=
 =?us-ascii?Q?ZfWdOujuQgPwTm+gEexjcgqjuqfE41XZNM7U42sTwl3OQBQCn45QB3cII6mc?=
 =?us-ascii?Q?KteI3dgqFhd9pohnf4Pd/8EL4dU7Zf24gIUDrjpcQnodEb7bOo+euwiwhz70?=
 =?us-ascii?Q?d8yM7UvO4Gu8vBEz794x226nL9/fzT+viXFyiM7BUWULvJM5iVtsoVprPYdk?=
 =?us-ascii?Q?8mk2Uwebl93yFB5BDJaUgRYcboOcgql9rq9lWAEjVHziyY/Ok6kuvRh+iwPD?=
 =?us-ascii?Q?FVIBO7lySe9zpCaZaCHSQC7qqyktK4jNltO5JkceSD4BgrIbkUAtlh/ZBvLK?=
 =?us-ascii?Q?oIfEd/s9Zk7CdPHMWV0sixcP3Nc+Sxn1GLjpJoICC2JyrikNJhUe9cvuM/Le?=
 =?us-ascii?Q?lyLeq4ur9uglkxTYBaAIdvXqW125n8uAtiwgterH5BHFIfbhFxbMgs2GClkj?=
 =?us-ascii?Q?3DgQfRMccckSMUSmJZWXzLp4qHqcS4yTTA+INSr6N5O/17F1EqdmZ316NOb6?=
 =?us-ascii?Q?tqRYHUSUwjF3O25XJ1rRkMRlDy2AFp9gZg2ZOxulX2GRDkbZ5uP5tw40COvM?=
 =?us-ascii?Q?VzxjtF4xz0Y57PORKbyZrAcG/d6MiEuspRMu77m4skgrdo7DTkLWQzo+uM0p?=
 =?us-ascii?Q?aVqyGgXpwviENRgo6XWmUorQyl7a2qtASHI1hnrL2MOt4pn8K+QiDvmyuIir?=
 =?us-ascii?Q?0fNepEGC0N26hU0AZ2ax7GjTVBm/IRWEspIjX4BMs+DcQk9kSBK6UjsU/SOZ?=
 =?us-ascii?Q?ctxS4rkNtECO6y2rquukJhcy29PeuJ3kQW3w8Oviasucy5I0+RqhVIqZFOQQ?=
 =?us-ascii?Q?+Kk09r2xmB5dBD1GpjyLG1nSyd+KoODTMDrVZ786YuM3xbY+kAsg8CVlpGrA?=
 =?us-ascii?Q?W8M9sKuOlsykr5qqK3eGAmDHVh25R2EdXPW1//PodtYq/DbVsMyJzwqhF7vp?=
 =?us-ascii?Q?ywUmRu3sGuQLMiJKvxKOyqZK+2F3+4DMxtP5JZ+rx0eNI9i9junVuPWxUiQQ?=
 =?us-ascii?Q?4Nq3c1WUGbFc3ZTCrJE2bEAKnweAXnwyvjWEF/SIWh4DtSafYaxn4Mf2ncDN?=
 =?us-ascii?Q?ahhTt8FgTaN194pK564ynh8KWkQYKUMwNlls3vxxmw1qiVBkT6P5e2n3sf4z?=
 =?us-ascii?Q?y9V7JoU0qQGqsDYMD8vTsTSU94RRUDhCGSuKfoe4RIARw9wYj1Wv5goUcBRr?=
 =?us-ascii?Q?dZOTWlotl4PygeEmeQZb0OamwX9f1qqwluV4v156kI0IBRAYVpZ2D3NoATPj?=
 =?us-ascii?Q?M1ZiIa3w4stiNuArTqHLLe8ILk92urzrgDF4ioFOiQuqEJ8lZEXsDy3l2cIF?=
 =?us-ascii?Q?0RTaJg4KIzfw3s1Yh37lIsUVppYvt4CieKQogSByzMSSZhk2PHmtTX4qnqi9?=
 =?us-ascii?Q?TEhqoLfGBGcLnSc+/AhWg/iIhB6Q8QVg2XWx8Yqy44fvaoVlBdsjGr0OQxbN?=
 =?us-ascii?Q?ZWxr3oBT45var75Ldbvp+OE/AUVS0orH4k94veArnLVVxsGM9NwgAVyMsMhU?=
 =?us-ascii?Q?yxjGGq7JWNKgfbMAaAPrKSnhbg9biN3hzesjlwLrU5WBCIcmZe4i/9Bo58eF?=
 =?us-ascii?Q?Hg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 09572258-4d2f-4ea8-db15-08dc8c9dd3ec
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:14:27.4852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUc8AlCf8uTDBMF4yVTKpNL9GuqbEAFy6wsa/I+O3EsPcFl+SlJld+Lu6cFBl4X1U1C3eR/6jlPib67QlhVdJ94ugAETKLADNkXHOXuz67k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4874
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

On Fri, Jun 14, 2024 at 12:14:15PM GMT, Michal Wajdeczko wrote:
>We don't support changing CCS mode when running in SR-IOV mode yet.
>When running as a PF driver just apply default ccs_mode=1 that VF
>drivers will assume as already applied and fixed.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
