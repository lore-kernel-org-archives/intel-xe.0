Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA4C9FCA198
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 22:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FB110E5D8;
	Mon,  9 Mar 2026 22:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dakXvDU2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CBD10E5D8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Mar 2026 22:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773094135; x=1804630135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eDpR6NEoBpDcPHmQK3LOTmCJvaqLKGS2WqO4UeR9Pgw=;
 b=dakXvDU2AkgiJLhezUZSA2XhfJtRB8Z5hblvm5dJJYDVQjRmHDTFsOUT
 dUb5CjpulqNQpRIaNWmaUQH+0k/OglZRZM/UIpXG7RraqVHFwErFLmjlL
 3y+/N/OWRPxPfXTuU6a3AHgAjssKKV+v7r+t/B+7dGIo66Q0Ukqoj9w/3
 D6iq5Lhs6zJ6w8I5UUHwBrTfDrqZZ8IT8fWzLzn/G1lWgkIzxUPCY4qoN
 6bb7kygg52WUgpCkcXhJRwMJ0xlwnkBKK387vJ146nSGzHDv+8K42nxiZ
 J1xqfU1wyqPz1tkYPZW8lvwsycbZTGLrMhukE2tX+OB3JxQqfmnY81Jif g==;
X-CSE-ConnectionGUID: 3/q0UcigTC+6PfRv+k8lXQ==
X-CSE-MsgGUID: k4CmjJNDRbCNWXzOj6jMvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="84840495"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="84840495"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:08:55 -0700
X-CSE-ConnectionGUID: +UavsxJ/QwKXt+j+cxQWaQ==
X-CSE-MsgGUID: LXMinv2dQDG6fDBR/1cv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="222541307"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 15:08:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:08:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 15:08:54 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 15:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ht8rsy0cMVQed7BoIsNWZmZLCDwRAd8TyCI31vVzF1fc+SnomZyoKunzugNt9mzAyhi/BzM+ydbgcZS/PUqKtrRwUj2BXlR8Qp6oGUnvce20VAn3tc6vy474rVuoI/1kno88zIO0ADcE/mc/LhqDgyRa22OuM/bKMlYxOe2wint24N+h8+nG2VBnXURhtcCWsjufQVDNEWQjZKAJE+AQMZePgWKcirYvJnkU56YMfYaKqPdHZfhvK69oJrzMa9bb3MLWwy9PJr/DF9FikEZ+EYRCEBqDMLb+oaBU+M/ec4JUjXYahRxSIg3Vjw6QdmrZYNntpd2KA7I8wJIkjDh5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiKJHJHvuIvH1jfvpw9wa5d7fRXhYeRGVojGO0K+cBw=;
 b=vCiFHxuZFfHT2FkOXMLOO7irew5+S/04dTURLGAo3DnaQH8pvuELjWRRryVkM0/ew3+QvHwrV0KMOS5wn10YHZRAY6App98J4ABXUMQutTPtLuCPSmwNEMsRHH5x0ru12Anm47W/goXYGhX5TYdVZ3sdSEsx+XbvTZsMnn1ve2JDBWoDNc6ul8mQsDMlnzyngoploDpfu3K03q9zIgknED4uaYO07XEk5jaDH8T/4Hkn9OnZg6az/I/ZNXOnEHH7mTGPbpjqkJpSyTHGMw8JGamyWGSnzTcQIM6+LNlXut406PwxB3WVJe/onUJy6gmj1sgUlg/6lzsoRCNYUMOS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 22:08:51 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 22:08:51 +0000
Date: Mon, 9 Mar 2026 15:08:48 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 Extra enabling patches for NVL-P (rev3)
Message-ID: <20260309220848.GC52346@mdroper-desk1.amr.corp.intel.com>
References: <20260309-extra-nvl-p-enabling-patches-v3-0-0416900dd498@intel.com>
 <177309013042.335367.3672549934691530510@a3b018990fe9>
 <87ms0gacfd.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87ms0gacfd.fsf@intel.com>
X-ClientProxiedBy: SJ0PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::22) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: bccf9b33-998d-4e3a-86b9-08de7e2871e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: XdKjgc/536JhobY63lPAiXcJ4+4S2dHmZAR84UCFTDB+ebNQ5OubYOY5PI+EgXUT7xkec1Sg952BT3UvKbc48jA0D1NRajZQai8E49BZQUqOysSnibkGC+Bb1vGhhn2lsv6RJ7mdIwIIdAp0NmoehltIbRt6Im9XWy/BTlacSzzePwzOXEnV0rrF/Rnd4QlliKIoSxyWer44kogswUnULKPu4RA0NQRqvMlKUGCLNSULpv10O7q/BzxwTeJlQ79/vEjggZsG2ViY5IxMj6XGq3WIBbjHfzkzmu9szRbqpq7Z6+fyfXlyUYv8kNU6FeLdB3U/tK/n20YWm2slfKOCUisVTykThDdwQdSiyLSHgBVzO3xVDdg9STDJWCUh3kVhMhcGhFe/WN85AQoZ0TnzP1NzXedJOjwmVrjxMDgXPi19LPpygGZ4SwWE4BjuSxOTfHQ4eC5FNGTGeu1L1egatnBl7JgV2JuwnR89ubQ7ynx3BvrNRSRNrsj5buKxD4QeIDf05ZixjewSwcFj8KMoEr4QY3J4/gGhdak9a2646aaNJD5sQMj2p8fMlKvWctVnEDtkoOq4TIcUcsZdHVwZmdlJOycGm8JKl32TLVjYv/P7HUt/gGIYtCxBxS+nn7u43pOmAdcvQBQvTrxwBq5E/gdqPom6iqEgR1dWx1uc2IqULjyX4A/zJb3DC9UlIo7H
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kl1xIn7//O8X0MXa3MXeSr8n6eFZuJCbjyV7BjqSHwRhMYA2bkijdKGHmBTi?=
 =?us-ascii?Q?ZZZokMgCTWnCbEIr1PQNWEseLboZQuGXPruresR4o2yBiABzUyT3Y9HNqzks?=
 =?us-ascii?Q?EpLXgVTE6kioOkfLxPUwl7Rqay6XBmHwxTjz2snBjHPRZtZ+yEw0nPDRHhr+?=
 =?us-ascii?Q?i0AXY9cVTw90C3/WXsS5HzDuQaJ7b4xtRbjSdMVyNMZN+olxx+TYKRvHvw/B?=
 =?us-ascii?Q?WL7/8cGtQzU3Xt5sxDZCBEqj57eBadZ6qI3LWZalvVi+eX50xvOM837dGkLH?=
 =?us-ascii?Q?bXHlSAyl1GdOVIBpiioejWUPM3WJMriUFqtL6fQbZ/G4pOYEElo0AtPzGRNH?=
 =?us-ascii?Q?hT91hxCj8inf1bpYSm95bhqCjw/eIAs57VnDH8L1qiWJn/WEHFVrvXDqRKLy?=
 =?us-ascii?Q?LBCbQx6tX6E3eQkkMVrkJqcvI4h1O8HajEmd0+feE7RGr9aRmRNvw+JsTjrQ?=
 =?us-ascii?Q?1BnsXXpI48wAfinWklqRFJw4nakkAdfU0WV6WUktmw9wtcggXWBp/puFxNFh?=
 =?us-ascii?Q?k26HSNpZBto2nEHWSoU/7a2R5tYUbfUmvc2Mz0uQMbMnzj7P3CdoaMHLdwdp?=
 =?us-ascii?Q?cdONkEJYmbLaqCsnZxomLsEZpndFlPONN4ZCq704TrQCDnAi2XgpxR61FNw9?=
 =?us-ascii?Q?BtcFn0I/gaGk0Aekac5R4nuZInM9X3JFcsBS/kAqp4aQRfy40G3ws3FJe314?=
 =?us-ascii?Q?Lg6bxuO9UV9NQ01qgIlTmo9IsEkxJebrBLZfSY8VEbLkpnZ3e7WQrpZWvRCL?=
 =?us-ascii?Q?P4Zyg3U43fNVDOiRsXnzKYsTEo5ptftrxhI9YRivg3MOhUPgTk7b/bd24fWI?=
 =?us-ascii?Q?6/0KY/EYli98MDv3E7PKeuR0BQ7YVNGsUquIVRlZ0F2Cp1XcUDwUDmB714n8?=
 =?us-ascii?Q?gr5gyy0nv9ph0DmiSWsps83SdCe+/hnDRMh1TH9DAQ0ajii3+VqIvdFrMgOg?=
 =?us-ascii?Q?WEzEcY9fUX4U5DAVL0WRmU8WLfAt4oFJjIl9sc3cw/EWT0VqzlKYw0QxU1bb?=
 =?us-ascii?Q?+P+U1qmTv7MkO+FsJV+gneHgVpkyTY3FnlmbpHIOIAfv6b3oX+N/3Zw1KjU0?=
 =?us-ascii?Q?pjwoq3AsLDEV2IYxEPxtEKfiVADsjV1LYBD0fnIJH/1SUeCQmhsXSqRNmD/2?=
 =?us-ascii?Q?/K0MhfgJOqkgocHQzV+n31JsZbE6Oj8pFABWQdn9r3KK37lkNIQtvLP28Wqk?=
 =?us-ascii?Q?2F3EY+x2FW7MN8J+/b5q83L4aePr0o7DmoPo44IkmD7J0Ym/ezH42keHXeqt?=
 =?us-ascii?Q?M6u+XjIZVZ0dH9lCct1/tWoSa5xUeRKqS/uag40ynHLXYdhKp/+H4IJZs6RS?=
 =?us-ascii?Q?U9nkzwZVGOsSDdISct9LlrkKwAMjJZKaQLC5/+ZnAqPPnn2nFr3xnfvvw0Eg?=
 =?us-ascii?Q?ARXhmQNsPHwFWWzRE7DTbggvXlGkbgKKpVAebr6pBPMVFTavCTURdE48uBRu?=
 =?us-ascii?Q?h2YTAdwFxIm6JPkpN7yRnPJHP68C0fDjHBcURMxQc5nxNhDCf8jzu/oFQEdy?=
 =?us-ascii?Q?qmL8YMyF2qQKUpDr94ZgJyvCP3/KKt/mPeX3xzbDPIfxqVovviaMbpZE6Y6X?=
 =?us-ascii?Q?SVbyC5bN3rdKJL3/+Q25mUTrQps3URdHhmHYHiZ50yoxtVyhKw1eiGx92iOh?=
 =?us-ascii?Q?ofZRooF22G+w0I4hCUYCQTfXO7exrpnowVY2k7IdE9eyv0tYv01LWZJD+J4N?=
 =?us-ascii?Q?ssfjjJ7OD0YymIYDS/GJNjoIrxanxYUk5NSQbPhX3C6fz3HO3jccruwIRmrI?=
 =?us-ascii?Q?v0eqj7zb/J53IH09n90W2NeB25/QDZ8=3D?=
X-Exchange-RoutingPolicyChecked: hfS+2UHOdBYC+Cum134Y1bsE8lPoKV1wZ4GotJqKkM38KiVEMsemYRqKXG7QWFedor95JVNYr50kvy32r8ODnZvjuu2fw3mucP+ZHP2WFuVhuLG3KcbcE87hozKvFyhf3+iQHmQdjFJwYWPsztPx/aCoyWDsJOv16eQ5HOF404iCDtl80B1cMb9QP4FLT2SVy+PdqKx9ERdDniljaaSRbXztJHIQEe1EIYT8/MZSHtDzMuxl7onnB5EjBzASOr/HGLvM1sZwouxisK5Hc3vbtSlqFe4wkoOBhiX88BGBnVVNf2ZTe3xvwCNKEoTKTJ00k2rzZx8drxUdxYrEJki7AA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bccf9b33-998d-4e3a-86b9-08de7e2871e8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 22:08:50.9542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KBzh/9kGwy9SocWzjtyZcDI4MW9smqtdvkeSjoeZFW4ia5oQVNAykrNepe8Cmt0qg8o622LPEZXYQjj+0PDNf3obgn4FxKcTbw5/mgXm9e4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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

On Mon, Mar 09, 2026 at 07:03:02PM -0300, Gustavo Sousa wrote:
> Patchwork <patchwork@emeril.freedesktop.org> writes:
> 
> > == Series Details ==
> >
> > Series: Extra enabling patches for NVL-P (rev3)
> > URL   : https://patchwork.freedesktop.org/series/162666/
> > State : failure
> >
> > == Summary ==
> >
> > CI Bug Log - changes from xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c_BAT -> xe-pw-162666v3_BAT
> > ====================================================
> >
> > Summary
> > -------
> >
> >   **FAILURE**
> >
> >   Serious unknown changes coming with xe-pw-162666v3_BAT absolutely need to be
> >   verified manually.
> >   
> >   If you think the reported changes have nothing to do with the changes
> >   introduced in xe-pw-162666v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> >   to document this new failure mode, which will reduce false positives in CI.
> >
> >   
> >
> > Participating hosts (14 -> 12)
> > ------------------------------
> >
> >   Missing    (2): bat-adlp-vm bat-ptl-vm 
> >
> > Possible new issues
> > -------------------
> >
> >   Here are the unknown changes that may have been introduced in xe-pw-162666v3_BAT:
> >
> > ### IGT changes ###
> >
> > #### Possible regressions ####
> >
> >   * igt@xe_module_load@load:
> >     - bat-ptl-2:          [PASS][1] -> [ABORT][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-2/igt@xe_module_load@load.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-2/igt@xe_module_load@load.html
> >     - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
> >    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-dg2-oem2/igt@xe_module_load@load.html
> >    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-dg2-oem2/igt@xe_module_load@load.html
> >     - bat-atsm-2:         [PASS][5] -> [ABORT][6]
> >    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-atsm-2/igt@xe_module_load@load.html
> >    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-atsm-2/igt@xe_module_load@load.html
> >     - bat-wcl-1:          [PASS][7] -> [ABORT][8]
> >    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-1/igt@xe_module_load@load.html
> >    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-1/igt@xe_module_load@load.html
> >     - bat-ptl-1:          [PASS][9] -> [ABORT][10]
> >    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-ptl-1/igt@xe_module_load@load.html
> >    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-ptl-1/igt@xe_module_load@load.html
> >     - bat-wcl-2:          [PASS][11] -> [ABORT][12]
> >    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-wcl-2/igt@xe_module_load@load.html
> >    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-wcl-2/igt@xe_module_load@load.html
> >     - bat-bmg-2:          [PASS][13] -> [ABORT][14]
> >    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-2/igt@xe_module_load@load.html
> >    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-2/igt@xe_module_load@load.html
> >     - bat-bmg-3:          [PASS][15] -> [ABORT][16]
> >    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-3/igt@xe_module_load@load.html
> >    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-3/igt@xe_module_load@load.html
> >     - bat-bmg-1:          [PASS][17] -> [ABORT][18]
> >    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-bmg-1/igt@xe_module_load@load.html
> >    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-bmg-1/igt@xe_module_load@load.html
> >     - bat-adlp-7:         [PASS][19] -> [ABORT][20]
> >    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4683-50b85be0adadc4ab0b1e557627bebd7fdf1fcc3c/bat-adlp-7/igt@xe_module_load@load.html
> >    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162666v3/bat-adlp-7/igt@xe_module_load@load.html
> 
> Oops. It appears we've hit a chicken-and-egg situation here. MMIO
> functions depend on device workarounds to be already initialized; device
> workarounds initialization depend on xe_sriov_probe_early(); which, in
> turn, needs to use MMIO functions.

Ah, we do still have that early MMIO device workaround in
mmio_flush_pending_writes().  I looked for that before but missed it
while grep'ing.

A quick fix would be to drop the FUNC(xe_rtp_match_not_sriov_vf) rule
from the device workaround and add it as an extra condition in the
function itself.  Then we wouldn't need to change the current placement
of device WA initialization.  Then longer term we can look into allowing
device workarounds with additional rule capabilities at varying levels
of device/GT initialization.


Matt

> 
> --
> Gustavo Sousa

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
