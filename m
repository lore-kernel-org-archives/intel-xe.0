Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868DC3DA49
	for <intel-xe@archiver.kernel.org>; Sun, 28 Jul 2024 04:51:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF910E03B;
	Sun, 28 Jul 2024 04:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MZUDoiwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B554210E03B
 for <intel-xe@lists.freedesktop.org>; Sun, 28 Jul 2024 04:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722142310; x=1753678310;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qnuVVazVLsmZqRFueDtfJGPXTuBXZ+YAqpBJBZ4S9a4=;
 b=MZUDoiwSeCLmSakvj3P7trRWYcLGPpj37U2R7fDxVSx41ZDnKBs5OBDd
 waLWOQSMg9RufzlbRRpvbEnJQ0t4uA5ac3N6+Y7bRpIX5UajLPrJMGpgR
 SCR3+8i5xwc5tGbnrEKxxLKh0yAlUCCCwrn+zExckz4nS772j5/i8/nDU
 SupYrrCJgCy2saBLbciSHShjksMVdTa2sal8K3L/NHSXB0V2V8YUlSt+h
 CVEBOXtgJp2u2Kz1IkIUkgqjmjGgUJA9bIk9MVBoIYoX421jNNo89tjGl
 apy4lXJJo8UTLOHYuo8GawhUrUGjZqPjkGvypV3tPt+98BThsJMSLHYjc Q==;
X-CSE-ConnectionGUID: sbsj1EDMTqSuP0aUZKWt2w==
X-CSE-MsgGUID: A+FYdPUfSQizRta92coIGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="45310505"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; d="scan'208";a="45310505"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2024 21:51:37 -0700
X-CSE-ConnectionGUID: 8UV1XUfSR4W44h+XrJmYgw==
X-CSE-MsgGUID: Mw8+DkusTve7Xu0c68RFVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; d="scan'208";a="54230748"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jul 2024 21:51:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 27 Jul 2024 21:51:36 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 27 Jul 2024 21:51:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 27 Jul 2024 21:51:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 27 Jul 2024 21:51:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ey66TL7LXAQqoUeG5BYS81TP796zU57Z1X5FBKiihay9lMfu2DhCHbdFgzdCH8nXm0LAeL5YXCVYgllbSIwqP1G61KNeRV1JxMHJ5fg90H9w9H/zyTHYR7CiEzPFGVwoe9xJVpMVv4Rq2JRKfyx5LmmveA6Zi/MQp8crklw19VLWXC7ngxMKRhh8RichYfaE+a8bAVKAK0F5+5XgRFAkfJ9W4D0cH+LcYB3BrWO4esq5AKRzSQW2u3lsqG11vq0aRzsG/myUbHF/5UWcMVcPOh1ew8aTaK4FxRxbx9kkBuOpqgSd3p02owkPsJzIvXBIPqNiiPo90Ze9o/ufhSb4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DeSS+TktOC4zYtIdWlc6x8Qd0WECBfu+br3QnLqwNo=;
 b=mRMZT8/HA1k/KnQgd+vxPpTESMo6bPNhdD/GVNXpsIioG2EX7WS+2tLFWbdH8MocC99NsaJrXt+jbC6hcfq7bxa5qI3SagjQ7O/cIrJMHVOY5bqBoFLQKZ56AAF20sLlgKkybwCXqBWP0e6E+Dkg+gXFIEhrWHFNB3oKQGYOzAgo1iXBFkQ+NeP+J9UuB+T/jvbRZROOl0rsr13KBLTXk+59bbwc3Si1ErHEHIoiDyUEgdxRR5Z0YUztJ9+i/IYDnyvfSUa5kdHyvea0G2XZBIc/DEv6aje3gWihZebdUfCaBH7KD3NNj+OJh+SUrB1AZZ65Ke5C8YE51uGSalye9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.26; Sun, 28 Jul
 2024 04:51:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Sun, 28 Jul 2024
 04:51:26 +0000
Date: Sun, 28 Jul 2024 04:50:31 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christoph Manszewski
 <christoph.manszewski@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Maciej Patelczyk <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 20/21] drm/xe/eudebug: Dynamically toggle debugger
 functionality
Message-ID: <ZqXOF3ACeHABbCPj@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-21-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240726140818.54304-21-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY5PR17CA0004.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: 06f79673-0fc9-47f2-fb8c-08dcaec0f000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SppE5e80IbBfsl3x4V+1eah1Hu+NKOhiQTJOYhj2L5uoYRXFLpU+se688068?=
 =?us-ascii?Q?7+teyRYDgwmV0H3G8bFP9hJBGLPu9zohcpxTy8elsh2Q2RFFPKMPRC9SCrTs?=
 =?us-ascii?Q?dqZH6SRvozPKEhAJut3EPQkiDJQV/XrKUkZSEixMUogT55bEg0pza0iNbunD?=
 =?us-ascii?Q?KF2yKrLJI82WxMweeXq8iq1q9Z7rNvh0z4oo/SC510Q2etjKJRst3weVwiHw?=
 =?us-ascii?Q?YSDBYIXkachyRboohEky16rYL++7jrZ/7bkwCGQt3k4IpCACCr67IsGYEszI?=
 =?us-ascii?Q?wsqew6VSY+n5rSlKAd76xugMyrAzlx7+h96iezb5CmEnv5dh8EmCcORbnvU+?=
 =?us-ascii?Q?cdM8spFqmOfxbBGclLtcJGYd3YUSwpQEW9HFWUA2mpBV+/H4FYPf8vFPYteU?=
 =?us-ascii?Q?LwrEmBA87NXspViXbJjH5BCLXWpiu6a2/TpOqVZO0a5bck9nr+lz3bq8m60k?=
 =?us-ascii?Q?t4nDpDQn6upPraagqdWF4C4ykyLIS1H1p+cbW+Vj2cUc26zUQksO2OMuwyFC?=
 =?us-ascii?Q?jh0BuR9uu/Fck7L9E9qToOJS42ZeNKTJA69rlW6sOUZePqlR9I9TYswzBiID?=
 =?us-ascii?Q?tiDwJRP1W2KF3+o8DynX6XVtTNL/okYMdsZPaZfJrGd8fEV43CtSCozKQQFI?=
 =?us-ascii?Q?rifEgvCVmaKJO9I6BUzh04SfcaYxhbLkaAW0wU7uyEzlilIfmIZR1Ex1Pe3/?=
 =?us-ascii?Q?xfopjdR84RXsy1rLPEDywQQkPWNH4onlMWzWb8E/lDZ2R1rQHWsfvDW8pdWH?=
 =?us-ascii?Q?DfDxNg62rvoVpD/b9sVr+FgZ/kni08HO3UopXoFnzEx9bK3X52L1i1TfIYlt?=
 =?us-ascii?Q?MwIx7P4AEM/g5cirYxMols4jC3iZ9GqTYD16zJmwyAOXOF7HUooYpNW7Sc8F?=
 =?us-ascii?Q?j1mWRUgGCpPhekGihSTSY02fpeqPos0byIXuqI54oowweD5/JVebkyuxevQt?=
 =?us-ascii?Q?8FDelTPmfwtuSsthvVyIgTtM9/ACMhnpX0MumNUXRd4v+1BTy+agIkeal93v?=
 =?us-ascii?Q?Tku00pc7lnnavQBzdj6rBQenOSR3KtMnjybz8TK/LUFe1R1tgRZ7G+kOqDRE?=
 =?us-ascii?Q?zzmq+3eittMq0pdYTsdIP8duUaTMktwJalCpRdjOv27hCc9nw52TxSi7jd5G?=
 =?us-ascii?Q?8t3T5Qp0HIJ/U3NRcfGJjttT8TBhelvM37n/LzB+/x2ZRQp0XIVgB6cNdw//?=
 =?us-ascii?Q?SfxgtLxso6e5Knh11uwPWu/s+Oq53/N7PIqsy41QcDAZuCBUH77jLvFT0hIs?=
 =?us-ascii?Q?3MEDuMwnubkZh7AFMSubBWF4pYhiLqlZMEz+7cEtHSfCAy3WJPxa++AQ2nki?=
 =?us-ascii?Q?CIJkoEMKyAlb6mGIsho8Bq9qyGSqx70hw0PLSgiga5ElZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hNoWsIaIT7jDWkMspKHCEpGLa2lnlULLJp2cGeO+hRJNCUov1Wm/HhzqF279?=
 =?us-ascii?Q?dZQcTZHc92M6NPLahx5ARjNFKF0mm6ZUCNROVI8ww53dMpxKe0lgBZzT5cmM?=
 =?us-ascii?Q?LdZhc25wa4b5RMULwGJyQO4vu2ERop2RetozIjy9lY6c17o8rdEsb1mQfPRj?=
 =?us-ascii?Q?GAaQtfUkkw1FONh/EAOxozViNfMu5yADbFGI5M583fJH2p4bVhKZJVwGgvi+?=
 =?us-ascii?Q?eJSXgWmeGGhJ+dBuk4lJP6FjN2Ljd2Qy2VMib9GlMot7nmoK/Avt3jSRhQ8j?=
 =?us-ascii?Q?Pvypz4VoKg/xHxhTp0S9ZwfxzUHkFNTTomDn30CEx+JNakrwNbz/KEApgCAA?=
 =?us-ascii?Q?VRgW9K1UOPBPwU0/xlKRjnXnu10qLS60ZqH9zyLOPopv6c04dzUd0r0Ckz0y?=
 =?us-ascii?Q?0pAW4fHb57j62XqhGlWk7SqqrlRjY7aZ0zVW4XCltaRW8fi6eSc6TD3124x1?=
 =?us-ascii?Q?0vkJs1L2Wa3n+jQN+ebFP4VTL33DJNiImhcDXg/tI8JebUECD3mBZ2v1nr8d?=
 =?us-ascii?Q?9nDdPljukau+3IqALKkOr+W0AxSYdWjs8ri23RuzpNONTri1Yo4vamKggbBx?=
 =?us-ascii?Q?3gCI0aAPcCndCx36rkcqWzIOVg+4SMxZRacDM3SIrx8UxZLEOEF6Wow44Sur?=
 =?us-ascii?Q?g3huNOTV6jm6R3Nvun6Kaf5GIUWncDchAqiyUaZdzsjg/6+jXR9IfkWO5iSU?=
 =?us-ascii?Q?/Czn7UjbxhkaNocaDe2LE0uBazuxoJRU9f16ChHtdW0srKwUxVDW1qw7TRBF?=
 =?us-ascii?Q?q8Il7rFC+rFSOHcElRh1+ef6y2777ERPofYiPpK54jte8eA2Mrs8aEpzZQIF?=
 =?us-ascii?Q?GifH7BMFczYeUzLiGU9DWP3NSbIgqj3JfERVLFqe5dlLJa8QZ+4/CE2sa5Xs?=
 =?us-ascii?Q?V6aqOf77BNnuEkFxCoigC6Rz47/OT983/xDP0nIwczmAGq0Qet2mL91c7X4I?=
 =?us-ascii?Q?3d0nqOucHOBNcS5hcKqWaKqgxmVfyT0JE45JZ2e+6m0b7Vg9fb/Xi+OM2X+V?=
 =?us-ascii?Q?H7pgg88a4f+oQcDgkdG/QgajaNrQql2X+myfbFfB6lNC61PujKArOSrsNmpF?=
 =?us-ascii?Q?YZZiR8LP7exSg8ov/vWWaMLfD4H/SZdXgwWK0/Hp/+bC7I1fr2H2ZXs9oKO5?=
 =?us-ascii?Q?0uIW+87gbez7ai72hThITZiKnHrp1SAkq4GXciau2iMVVK9nTcxZVTnsP4XJ?=
 =?us-ascii?Q?wTSHtTF4ihbx0YfEkLwHa66WK7YRkACpdT7YomaEyDGyWgEGg5/69KSRXKA2?=
 =?us-ascii?Q?NtPYeO+KCCwx4/cBLCKK4G1h2911kMRgzBqXFJA+P2w1n8yVyVjeyk7n1bgF?=
 =?us-ascii?Q?S7MJfZUSF0/UVcn6pSdC7deQ3PSwhgUTb+CYyzrbeJ/7lXaghoF5Cg1mXVC6?=
 =?us-ascii?Q?GFAv1vXY9ZpTCIVl73TAZZBHP8zTIBunUh+tI1aDCAyMMaZ6CP/OruoBFQb3?=
 =?us-ascii?Q?F3fqZG10WiD99fsWIAD4owmqEeE8Htgr1m76+illhotRLz80wG3hJAQFuNHe?=
 =?us-ascii?Q?dpaYtAJo4de8QTz4YZbk/lXO99KFFgY8oe707hjp6mFsirVMix7mz0PYRWt/?=
 =?us-ascii?Q?QvYTXQemrRNwU+zjIt2GCv5AAwi7L3deqY3SROdNN9jN+3tHDY+P3PJGFPfl?=
 =?us-ascii?Q?tQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06f79673-0fc9-47f2-fb8c-08dcaec0f000
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2024 04:51:26.5325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JnkBOxnUSjXOGyporSWdWiEYrq4LUM2icpj4m6uld2eqCHDHTAKEPACI3Df+tw76kXAu0x4RoIeTOdnk9XWh0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
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

On Fri, Jul 26, 2024 at 05:08:17PM +0300, Mika Kuoppala wrote:
> From: Christoph Manszewski <christoph.manszewski@intel.com>
> 
> Make it possible to dynamically enable/disable debugger funtionality,
> including the setting and unsetting of required hw register values via a
> sysfs entry located at '/sys/class/drm/card<X>/device/enable_eudebug'.
> 
> This entry uses 'kstrtobool' and as such it accepts inputs as documented
> by this function, in particular '0' and '1'.
> 
> 1) Adjust to xe_rtp graphics ranges changes.
> 2) Fix pile placement. Wa 14019869343 (aka. 16021232320) was
> added later in the pile, move disablement to appropriate commit.
> 3) flush reset (Christoph)
> 4) dont allow exec queue enable if feature is disabled (Dominik)
> 5) bind to drm sysfs functions (Maciej)
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       |   2 -
>  drivers/gpu/drm/xe/xe_device_types.h |   5 +
>  drivers/gpu/drm/xe/xe_eudebug.c      | 174 +++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_eudebug.h      |   2 -
>  drivers/gpu/drm/xe/xe_exec_queue.c   |   3 +
>  drivers/gpu/drm/xe/xe_hw_engine.c    |   1 -
>  drivers/gpu/drm/xe/xe_reg_sr.c       |  21 +++-
>  drivers/gpu/drm/xe/xe_reg_sr.h       |   4 +-
>  drivers/gpu/drm/xe/xe_rtp.c          |   2 +-
>  drivers/gpu/drm/xe/xe_rtp_types.h    |   1 +
>  10 files changed, 178 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 268faa1800c4..30a2bf2a7e00 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -785,8 +785,6 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_debugfs_register(xe);
>  
> -	xe_eudebug_init_late(xe);
> -
>  	xe_hwmon_register(xe);
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index beb1f3c8dc63..17aedbba3130 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -517,6 +517,11 @@ struct xe_device {
>  		/** @ordered_wq: used to discovery */
>  		struct workqueue_struct *ordered_wq;
>  
> +		/** @enable_lock: protects the enable toggle */
> +		struct mutex enable_lock;
> +		/** @enable: is the debugging functionality enabled */
> +		bool enable;
> +
>  		/** @attention_scan: attention scan worker */
>  		struct delayed_work attention_scan;
>  	} eudebug;
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index a80ffb64df15..80066f787ec2 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -2000,9 +2000,6 @@ xe_eudebug_connect(struct xe_device *xe,
>  
>  	param->version = DRM_XE_EUDEBUG_VERSION;
>  
> -	if (!xe->eudebug.available)
> -		return -EOPNOTSUPP;
> -
>  	d = kzalloc(sizeof(*d), GFP_KERNEL);
>  	if (!d)
>  		return -ENOMEM;
> @@ -2064,70 +2061,199 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  	struct drm_xe_eudebug_connect * const param = data;
>  	int ret = 0;
>  
> +	mutex_lock(&xe->eudebug.enable_lock);
> +
> +	if (!xe->eudebug.enable) {
> +		mutex_unlock(&xe->eudebug.enable_lock);
> +		return -ENODEV;
> +	}
> +
>  	ret = xe_eudebug_connect(xe, param);
>  
> +	mutex_unlock(&xe->eudebug.enable_lock);
> +
>  	return ret;
>  }
>  
>  #undef XE_REG_MCR
>  #define XE_REG_MCR(...)     XE_REG(__VA_ARGS__, .mcr = 1)
>  
> -void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
> +static void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe)
>  {
>  	const struct xe_rtp_entry_sr eudebug_was[] = {
> -		{ XE_RTP_NAME("GlobalDebugEnable"),
> -		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210),
> -			       ENGINE_CLASS(RENDER)),
> -		  XE_RTP_ACTIONS(SET(CS_DEBUG_MODE2(RENDER_RING_BASE),
> -				     GLOBAL_DEBUG_ENABLE))
> -		},
>  		{ XE_RTP_NAME("TdCtlDebugEnable"),
>  		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
>  			       FUNC(xe_rtp_match_first_render_or_compute)),
>  		  XE_RTP_ACTIONS(SET(TD_CTL,
>  				     TD_CTL_BREAKPOINT_ENABLE |
>  				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> -				     TD_CTL_FEH_AND_FEE_ENABLE))
> +				     TD_CTL_FEH_AND_FEE_ENABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
>  		},
>  		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
>  		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
>  			       FUNC(xe_rtp_match_first_render_or_compute)),
> -		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE))
> +		  XE_RTP_ACTIONS(SET(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
>  		},
>  		{ XE_RTP_NAME("18022722726"),
>  		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
>  			       FUNC(xe_rtp_match_first_render_or_compute)),
> -		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE))
> +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
>  		},
>  		{ XE_RTP_NAME("14015527279"),
>  		  XE_RTP_RULES(PLATFORM(PVC),
>  			       FUNC(xe_rtp_match_first_render_or_compute)),
> -		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB))
> +		  XE_RTP_ACTIONS(SET(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
>  		},
>  		{}
>  	};
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> -	struct xe_device *xe = gt_to_xe(hwe->gt);
>  
> -	if (xe->eudebug.available)
> -		xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> +	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> +}
> +
> +static void xe_eudebug_fini_hw_engine(struct xe_hw_engine *hwe)
> +{
> +	const struct xe_rtp_entry_sr eudebug_was[] = {
> +		{ XE_RTP_NAME("TdCtlDebugEnable"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 3499),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(CLR(TD_CTL,
> +				     TD_CTL_BREAKPOINT_ENABLE |
> +				     TD_CTL_FORCE_THREAD_BREAKPOINT_ENABLE |
> +				     TD_CTL_FEH_AND_FEE_ENABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> +		},
> +		{ XE_RTP_NAME("TdCtlGlobalDebugEnable"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, XE_RTP_END_VERSION_UNDEFINED),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(CLR(TD_CTL, TD_CTL_GLOBAL_DEBUG_ENABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> +		},
> +		{ XE_RTP_NAME("18022722726"),
> +		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1250, 1274),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN, STALL_DOP_GATING_DISABLE,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> +		},
> +		{ XE_RTP_NAME("14015527279"),
> +		  XE_RTP_RULES(PLATFORM(PVC),
> +			       FUNC(xe_rtp_match_first_render_or_compute)),
> +		  XE_RTP_ACTIONS(CLR(ROW_CHICKEN2, XEHPC_DISABLE_BTB,
> +				     XE_RTP_ACTION_FLAG(OVERWRITE)))
> +		},
> +		{}
> +	};
> +	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
> +
> +	xe_rtp_process_to_sr(&ctx, eudebug_was, &hwe->reg_sr);
> +}
> +
> +static int xe_eudebug_enable(struct xe_device *xe, bool enable)
> +{
> +	struct xe_gt *gt;
> +	int i;
> +	u8 id;
> +
> +	if (!xe->eudebug.available)
> +		return -EOPNOTSUPP;
> +
> +	/* XXX: TODO hold list lock? */
> +	mutex_lock(&xe->eudebug.enable_lock);
> +
> +	if (!enable && !list_empty(&xe->eudebug.list)) {
> +		mutex_unlock(&xe->eudebug.enable_lock);
> +		return -EBUSY;
> +	}
> +
> +	if (enable == xe->eudebug.enable) {
> +		mutex_unlock(&xe->eudebug.enable_lock);
> +		return 0;
> +	}
> +
> +	for_each_gt(gt, xe, id) {
> +		for (i = 0; i < ARRAY_SIZE(gt->hw_engines); i++) {
> +			if (!(gt->info.engine_mask & BIT(i)))
> +				continue;
> +
> +			if (enable)
> +				xe_eudebug_init_hw_engine(&gt->hw_engines[i]);
> +			else
> +				xe_eudebug_fini_hw_engine(&gt->hw_engines[i]);
> +		}
> +
> +		xe_gt_reset_async(gt);

What are you trying to accomplish with the reset? Reinit of some HW
settings? Doing GT reset does have a side affect of killing exec queues
with jobs active on the GPU which is not ideal. Please explain exactly
what needs to be done, and maybe we can brainstorm something that won't
kill things.

Also exposing a GT reset via sysfs might be potential security issue
too.

> +		flush_work(&gt->reset.worker);

Flushing the reset worker here creates a lock dependency chain with
xe->eudebug.enable_lock and all locks taken during a GT reset which is
not ideal either. If we need to do a GT reset (or something else with a
worker that takes locks) it probably best to flush the worker after
dropping xe->eudebug.enable_lock. This relates to my other comments on
locking, we shouldn't create lock depeendecy chains unless we have to
and the chains are well defined.

Matt

> +	}
> +
> +	if (enable)
> +		attention_scan_flush(xe);
> +	else
> +		attention_scan_cancel(xe);
> +
> +	xe->eudebug.enable = enable;
> +	mutex_unlock(&xe->eudebug.enable_lock);
> +
> +	return 0;
> +}
> +
> +static ssize_t enable_eudebug_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +
> +	return sysfs_emit(buf, "%u\n", xe->eudebug.enable);
> +}
> +
> +static ssize_t enable_eudebug_store(struct device *dev, struct device_attribute *attr,
> +				    const char *buf, size_t count)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
> +	bool enable;
> +	int ret;
> +
> +	ret = kstrtobool(buf, &enable);
> +	if (ret)
> +		return ret;
> +
> +	ret = xe_eudebug_enable(xe, enable);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(enable_eudebug);
> +
> +static void xe_eudebug_sysfs_fini(void *arg)
> +{
> +	struct xe_device *xe = arg;
> +
> +	sysfs_remove_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
>  }
>  
>  void xe_eudebug_init(struct xe_device *xe)
>  {
> +	struct device *dev = xe->drm.dev;
> +	int ret;
> +
>  	spin_lock_init(&xe->eudebug.lock);
>  	INIT_LIST_HEAD(&xe->eudebug.list);
>  	INIT_DELAYED_WORK(&xe->eudebug.attention_scan, attention_scan_fn);
>  
> -	xe->eudebug.available = true;
> -}
> +	drmm_mutex_init(&xe->drm, &xe->eudebug.enable_lock);
> +	xe->eudebug.enable = false;
>  
> -void xe_eudebug_init_late(struct xe_device *xe)
> -{
> -	if (!xe->eudebug.available)
> -		return;
>  
> -	attention_scan_flush(xe);
> +	ret = sysfs_create_file(&xe->drm.dev->kobj, &dev_attr_enable_eudebug.attr);
> +	if (ret)
> +		drm_warn(&xe->drm, "eudebug sysfs init failed: %d, debugger unavailable\n", ret);
> +	else
> +		devm_add_action_or_reset(dev, xe_eudebug_sysfs_fini, xe);
> +
> +	xe->eudebug.available = ret == 0;
>  }
>  
>  void xe_eudebug_fini(struct xe_device *xe)
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> index 02c9ba56e752..2f66aa87a0f6 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.h
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -24,9 +24,7 @@ int xe_eudebug_connect_ioctl(struct drm_device *dev,
>  			     struct drm_file *file);
>  
>  void xe_eudebug_init(struct xe_device *xe);
> -void xe_eudebug_init_late(struct xe_device *xe);
>  void xe_eudebug_fini(struct xe_device *xe);
> -void xe_eudebug_init_hw_engine(struct xe_hw_engine *hwe);
>  
>  void xe_eudebug_file_open(struct xe_file *xef);
>  void xe_eudebug_file_close(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index bc2edade5e5b..b6fc65ab8aa9 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -360,6 +360,9 @@ static int exec_queue_set_eudebug(struct xe_device *xe, struct xe_exec_queue *q,
>  			 !(value & DRM_XE_EXEC_QUEUE_EUDEBUG_FLAG_ENABLE)))
>  		return -EINVAL;
>  
> +	if (XE_IOCTL_DBG(xe, !xe->eudebug.enable))
> +		return -EPERM;
> +
>  	q->eudebug_flags = EXEC_QUEUE_EUDEBUG_FLAG_ENABLE;
>  
>  	return 0;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 74813bc20787..0f90416be0ba 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -504,7 +504,6 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_tuning_process_engine(hwe);
>  	xe_wa_process_engine(hwe);
>  	hw_engine_setup_default_state(hwe);
> -	xe_eudebug_init_hw_engine(hwe);
>  
>  	xe_reg_sr_init(&hwe->reg_whitelist, hwe->name, gt_to_xe(gt));
>  	xe_reg_whitelist_process_engine(hwe);
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 440ac572f6e5..a7671722a84e 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -92,22 +92,31 @@ static void reg_sr_inc_error(struct xe_reg_sr *sr)
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr,
>  		  const struct xe_reg_sr_entry *e,
> -		  struct xe_gt *gt)
> +		  struct xe_gt *gt,
> +		  bool overwrite)
>  {
>  	unsigned long idx = e->reg.addr;
>  	struct xe_reg_sr_entry *pentry = xa_load(&sr->xa, idx);
>  	int ret;
>  
>  	if (pentry) {
> -		if (!compatible_entries(pentry, e)) {
> +		if (overwrite && e->set_bits) {
> +			pentry->clr_bits |= e->clr_bits;
> +			pentry->set_bits |= e->set_bits;
> +			pentry->read_mask |= e->read_mask;
> +		} else if (overwrite && !e->set_bits) {
> +			pentry->clr_bits |= e->clr_bits;
> +			pentry->set_bits &= ~e->clr_bits;
> +			pentry->read_mask |= e->read_mask;
> +		} else if (!compatible_entries(pentry, e)) {
>  			ret = -EINVAL;
>  			goto fail;
> +		} else {
> +			pentry->clr_bits |= e->clr_bits;
> +			pentry->set_bits |= e->set_bits;
> +			pentry->read_mask |= e->read_mask;
>  		}
>  
> -		pentry->clr_bits |= e->clr_bits;
> -		pentry->set_bits |= e->set_bits;
> -		pentry->read_mask |= e->read_mask;
> -
>  		return 0;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.h b/drivers/gpu/drm/xe/xe_reg_sr.h
> index 51fbba423e27..d67fafdcd847 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.h
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.h
> @@ -6,6 +6,8 @@
>  #ifndef _XE_REG_SR_
>  #define _XE_REG_SR_
>  
> +#include <linux/types.h>
> +
>  /*
>   * Reg save/restore bookkeeping
>   */
> @@ -21,7 +23,7 @@ int xe_reg_sr_init(struct xe_reg_sr *sr, const char *name, struct xe_device *xe)
>  void xe_reg_sr_dump(struct xe_reg_sr *sr, struct drm_printer *p);
>  
>  int xe_reg_sr_add(struct xe_reg_sr *sr, const struct xe_reg_sr_entry *e,
> -		  struct xe_gt *gt);
> +		  struct xe_gt *gt, bool overwrite);
>  void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt);
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> index 02e28274282f..5643bcde52bd 100644
> --- a/drivers/gpu/drm/xe/xe_rtp.c
> +++ b/drivers/gpu/drm/xe/xe_rtp.c
> @@ -153,7 +153,7 @@ static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>  	};
>  
>  	sr_entry.reg.addr += mmio_base;
> -	xe_reg_sr_add(sr, &sr_entry, gt);
> +	xe_reg_sr_add(sr, &sr_entry, gt, action->flags & XE_RTP_ACTION_FLAG_OVERWRITE);
>  }
>  
>  static bool rtp_process_one_sr(const struct xe_rtp_entry_sr *entry,
> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> index 1b76b947c706..20d228067da3 100644
> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> @@ -33,6 +33,7 @@ struct xe_rtp_action {
>  	/** @read_mask: mask for bits to consider when reading value back */
>  	u32			read_mask;
>  #define XE_RTP_ACTION_FLAG_ENGINE_BASE		BIT(0)
> +#define XE_RTP_ACTION_FLAG_OVERWRITE		BIT(1)
>  	/** @flags: flags to apply on rule evaluation or action */
>  	u8			flags;
>  };
> -- 
> 2.34.1
> 
