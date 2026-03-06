Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E0FCB623
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 16:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A3B10ED80;
	Fri,  6 Mar 2026 16:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="faLSGMRa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F70510ED80
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Mar 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772815235; x=1804351235;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ga8wJaBL+MWle3ht/J5m74SB9sDiKShyu+atuGmKV94=;
 b=faLSGMRaMWCmGEQZ84/YK+V8Xkx/eDOOOG86bibteXORxkrJL++sTsNl
 6fEbakkFXIz/Oasll8cylqlukQ0mm0xAlyb7T9VpmVzI6mHCSyPat8S3u
 byu7W4HKBrYIKRerC2H9gSpr8hM/ONIrZHfdK69O2EyoI7Afc9TFsAsJI
 lKpAuu7cRrX0vIwQNt5mlvH7vcMQdyOb8aWf2eNe/QQUwD/Z8KYcEsrSI
 TfU20lJOB+QDxcV5ORy7vTLmsPtET+cwOovT6D0xCZZJPUFcBjWSqHl7x
 e+ugTdW+N8HA41lKCfLUuALyfJNmPnyeCO2/LrFsHBlpXNYmB49b7s51J g==;
X-CSE-ConnectionGUID: KpLwShkwSyCjVss8ftMrYQ==
X-CSE-MsgGUID: mplKjT3DQc6WOMrQrjOobw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="72952241"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="72952241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 08:40:34 -0800
X-CSE-ConnectionGUID: 9ZACi4BKRwG2ETCPx9mQDA==
X-CSE-MsgGUID: 4cKPYmcFRpKRiZDcfRm7IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="245319161"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 08:40:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 08:40:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 6 Mar 2026 08:40:34 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 6 Mar 2026 08:40:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkZL2XhnHzqA9zvX1Q71F6xnCchZCPLiiaynjBLfDVrDnnikZxfBezw+9ZFLta9pq1xqLjVHT5Lxl32j/0oKThlu/XwmfCK5q9IUmUL+8f6AYwXgXxOSb5lweVzaTNRW6dSsYaY6WIcDse3iliRRFYkRnnnt8Qu20gkg3uPW/cUQdTafyqzkrMSDDtiYDLXyJVWn3yKUSi4UF9n70RIw5K1DO/YiWeXJ0ghWUqYgEcHQKAMMApBg8+KfYLC5HhfSRnHQrPWBLB39qEysCqgsJ0r3Eav77IcdWvIt2+vJF5GM9uusiN3siHdezvWplCxZawXWPZvzg7C7pKmxEVi+Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH+46u7SqIbTnAiBSLxiIbazaNFzs/Vu20ksjBr0xH4=;
 b=PzsLG8B4fi9M0I4x3I4aJhfS1C2QmiZWZw07xxZw/8W6IvSWhaNu5RfgpFsF3D1kuqIdZQdPem/nbW6x5BrdntlUIaG/+zbbtFCEHMQxTxgksZImJskxCMkK+Pw/Ikbrd8XAxCgf9l7nKcyEHq6DTNPeknMGJW0NxT94280+p8Nvq6AE8cqYJBMyNaIV9n7xBefh/lN8t/4dKmY/kuyBziQXi2l/HQoVZxRfRXNWK2JOb1h43j4Ghf36kIncorPT8cHe9FGD1EVSfKc0jz5EZesYy3ADw/fr+ZI/V7ZcdrjO2q+kbNcBoSOXcn84+ENqBGfQRItfur+s2t9DFEdEKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 16:40:29 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 16:40:29 +0000
Date: Fri, 6 Mar 2026 08:40:25 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/7] drm/xe/rtp: Add support for matching platform-level
 stepping
Message-ID: <20260306164025.GX52346@mdroper-desk1.amr.corp.intel.com>
References: <20260305-extra-nvl-p-enabling-patches-v1-0-5020d5289dea@intel.com>
 <20260305-extra-nvl-p-enabling-patches-v1-4-5020d5289dea@intel.com>
 <20260305222256.GS4694@mdroper-desk1.amr.corp.intel.com>
 <20260306005358.GW52346@mdroper-desk1.amr.corp.intel.com>
 <871phxxeje.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <871phxxeje.fsf@intel.com>
X-ClientProxiedBy: SJ2PR07CA0024.namprd07.prod.outlook.com
 (2603:10b6:a03:505::14) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a617f99-05c4-4793-6774-08de7b9f1303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: +jahTTjrWE2/eUUp8SLOhCRQ/nsmnJWfZCd9SwV6LevNqaE7X25APNaeDBQ+nPrWqxXEPtCACr1Nu2aleJtXv9lcquKUxy/xj7Ot/zJJyoIUPVXgAgWFkYK9sg1zWtv8EjfLa04CSA3oVN6dImw5F/io0XigL5tyEQa5HjKLUIGun0054GfuhrTEJb0XCwwQjO8Kw/pRMgBVZbwbESqmlOPFT6KkYlU2a3tOpmXPdHg6zrX9JhTKafHhsefPensCt0nG5hyDQiPMyboPSIDq9ruXwnSS3aoBio2xO/rJwIZOX+K3YcyCazAEotMS+soN58iZvrbAG6tPg+EhgCJSU+rJjI/sya1227hEqu3QcF3egs+jV22/yx83Z66D/0mfywCtsPnHaYqqW+7z3YWtdOSiz6Jhamx6ruFgxLE8UdKBLwnCxmhau/WFOIO51lfAsyuqZEHwqlc4R79zbWzsOiPzCkCHPDYhje3BKq4T+G6LPR925K1dzhnEfwgVx+zLas/ogU76iORCUDWNOGDjb6Hrlm1qClYe/cdkzNdomP7sasvd6vCFWIN8SluGReFjfCyx6ekwE08bBr0xWOQgEqraxXnk3iw/0B5CBs31Fcj0ql6YxT5jB+cB/QBToKimwW521ly11uYT0d7wWXKdk+9BmhQM1T8gPg4O3FW5QcqkHN2YnskyKVoWOOzQZTRU5P4Wb99m1V+BXhDHxa/dgNSdN8tCEJTUOcv+KCZBEtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jlzRbx93IV5JdizDPWiSD40hoDusAy8tzkS1gpeXis9ZY5bdVr69jdDc03Fp?=
 =?us-ascii?Q?yTy1Jy3F6TqfhASqZBmd30F4YGXsmKVvRT49Td/iVVYVDE1tbjCz5YfAa14n?=
 =?us-ascii?Q?N2nmJH78ngV+mZ0a6tmhNQ5Ij2DIpc0FeZicXDsxcb8r3LVMW3JnH8cV9Z/z?=
 =?us-ascii?Q?JSWQSLnGfB/05zyACeMpr8svdo7YtxKXVT9g+EZxWTEy1ZKkIVQqViqvZvrL?=
 =?us-ascii?Q?I1R2uWEFc4vn/cB7abBMGDAlQoBmPesY4+QFdroVelIm8GHaGjM9Q1PFvaag?=
 =?us-ascii?Q?ywX3/qUWQyFGAYioClO5IKwCGIPeTav9wfyhlloU1/GbaCYKEh8t4L+fWi0O?=
 =?us-ascii?Q?vFlJW6WoxZwPVGtIUsprSvqWbT42KHHvwgNNBPfWhBv51t9ORoGNF5nWxBdY?=
 =?us-ascii?Q?4G2LmQpEZm55yWmbALn9poTFXIcdi/veCVdPOrj2S1yhuXUw1YerDa765tpa?=
 =?us-ascii?Q?b5NUhePL117wfuICE2nN3Mdbu7UHFB+BGDwZ+bkNu1pcW6as73aSXHxm0w4n?=
 =?us-ascii?Q?8ZRp7oUyMktdgOE8GycGxpQ5j0xW+lnQVvHM33BxvOKJM7cH/Wt843nttIiT?=
 =?us-ascii?Q?9ml715smUDtTVS7b26Z43QiakY5/bJyQ2rGKH0y0AAUzeQlTcCtVZ96Fcac/?=
 =?us-ascii?Q?xxlSLprWSb3ZOpYtBUcMSo0FOivBP0ybm2EaW5eweptZN6BfkLJSZbaAkOMh?=
 =?us-ascii?Q?zuzp41udohgvkVjR3L5OISyyxrXztUH70vQZWpm+K/vDE211QAXe6dWGMFAq?=
 =?us-ascii?Q?LzgldfcUeedlQeNOmvpimddB6+yDLAtZM0DzXoMh6QcYlUXnKwcWwT1sTdq7?=
 =?us-ascii?Q?vLhJIRX+g7XOEmcD9/l7b6hhoc4HKLKpGW+p7tFmXIq3apDWyTbg3qgxAIT/?=
 =?us-ascii?Q?zL3yKNC3LNZkPTr/oc4Z+ZucwTANWN1LL8qk5hRlEZkjZs93zcD3GYhd3uOW?=
 =?us-ascii?Q?LHF8BI4UDZFIgRzZqe7xbL9IMcr7GiK199kQkDIVOrgnWk03QR5oOC+bMAG6?=
 =?us-ascii?Q?MIH4GVyYSmuVugpsSg0PZwZsUbxPyuAuTsdDQjCps9/B12l9Kzefu2+7i3MF?=
 =?us-ascii?Q?NyRhbw2aH/Z+9gNZHIQEVrZMiOQ+ywKzO/RiPmIXU5kA1jAiJdbe+BBe9JEN?=
 =?us-ascii?Q?OxW64Qf2DAJV2GWu5gBXTHzZz1ebNI3/O9tz96oAq9frHSVF3VkBRy6qSMx5?=
 =?us-ascii?Q?iLEOLoGxf4F67WrEsE1DFKAK6DX5/Q04DJZsl00EnHgitq2asg6IJ4RwJJer?=
 =?us-ascii?Q?zxanEcEazITlA8mMbjy0DX0mVx94u3uJaG0t4Vp8BQGGt+ONC0t1qqW6vdx0?=
 =?us-ascii?Q?l3nYWiO09JdiFKOaohDe+AZtJ2izDMURtmX1ivR7GEL23g+S3Bk9ymUSagjy?=
 =?us-ascii?Q?tVe70kIwbg0hqIkFOIagRbOz+Xuvbu/b8JqZZly4gCD0juuCiCBLITQI/vWa?=
 =?us-ascii?Q?bI2M2UO7APBOyTHRucqvxzzP5TGNI32kDWSo4gcXjdVL97HxA9uXRhntCE9I?=
 =?us-ascii?Q?Utb0+bYoIP9t7nesr7ZzfYatAV5bs0M9eA7QPo/vlB9fmOQo3duY6ndv7X6a?=
 =?us-ascii?Q?L0yRJUpeZYSzr+XABS3tVWTSRXyCh4zBAlxgcJ1wKb7Fzs3WSDortpxNqRYB?=
 =?us-ascii?Q?frprVfQmzAewslq2igSS1EFOo+mB0gbw9KSMI8t51aAvRR68nLWTkbsX3cJr?=
 =?us-ascii?Q?2jnbev1lgrOWWgdICq6uM2U9Rr+IEqRIaL2XTNB8Lizl40Cn/Ho21JXnJd/Y?=
 =?us-ascii?Q?35+91zPbPDmEK9kA2MSj7wxTb3m5M1M=3D?=
X-Exchange-RoutingPolicyChecked: IGfqGyCO4r7iyxvu6fwHOEkWzfD0jiTSUaqoY/1WGs/ldS6kZ4OqQJ6iOcnCe2YULKrsUNB4rU0JySxhkUn8LHeAunhGy79kmuSTBqPKcslWo6y9VIQQKZVAC8ZLbIIPYP3MmdqmfJCu2P+aqwhotSJO7zpGKSzb1yo9AZMvXHc0S/zA4fKyWRFzsrzfE1jR7DWHXW20y/IntwCFfIo/44Z/ralMt5FEdSwfsI1Ppew+DOIYTeGz8J22+leAxJvJJHpbKTtOC5bCj2HfPO5RRpYTaNQoCqR/1gln/pDo8ddYttAZ+Zi7CikyLnBWak5wTU1OuAYtfdPYl766ollLkA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a617f99-05c4-4793-6774-08de7b9f1303
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:40:28.9421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YbDgGOlTdBdOxMr7JrW9Fle4ykL0oRmInUosgCUUqTot6MrRX0qai5YhrVuUR9x1TM3C98YMdbCU8N9Et6FRV9gXGshsirQEKzVV0GrvOE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Fri, Mar 06, 2026 at 10:39:49AM -0300, Gustavo Sousa wrote:
> Matt Roper <matthew.d.roper@intel.com> writes:
> 
> > On Thu, Mar 05, 2026 at 02:22:56PM -0800, Matt Roper wrote:
> >> On Thu, Mar 05, 2026 at 09:02:31AM -0300, Gustavo Sousa wrote:
> >> > Add support for matching platform-level stepping, which will be used for
> >> > an upcoming NVL-P workaround.
> >> > 
> >> > As support for reading platform-level stepping information is added only
> >> > as needed in the driver, add a warning when the rule finds a STEP_NONE
> >> > value, which is an indication that the driver is missing such a support.
> >> > 
> >> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/xe/xe_rtp.c       |  7 +++++++
> >> >  drivers/gpu/drm/xe/xe_rtp.h       | 20 ++++++++++++++++++++
> >> >  drivers/gpu/drm/xe/xe_rtp_types.h |  1 +
> >> >  3 files changed, 28 insertions(+)
> >> > 
> >> > diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
> >> > index 7bfdc6795ce6..991f218f1cc3 100644
> >> > --- a/drivers/gpu/drm/xe/xe_rtp.c
> >> > +++ b/drivers/gpu/drm/xe/xe_rtp.c
> >> > @@ -55,6 +55,13 @@ static bool rule_matches(const struct xe_device *xe,
> >> >  			match = xe->info.platform == r->platform &&
> >> >  				xe->info.subplatform == r->subplatform;
> >> >  			break;
> >> > +		case XE_RTP_MATCH_PLATFORM_STEP:
> >> > +			if (drm_WARN_ON(&xe->drm, xe->info.step.platform == STEP_NONE))
> >> > +				return false;
> >> > +
> >> > +			match = xe->info.step.platform >= r->step_start &&
> >> > +				xe->info.step.platform < r->step_end;
> >> > +			break;
> >> >  		case XE_RTP_MATCH_GRAPHICS_VERSION:
> >> >  			if (drm_WARN_ON(&xe->drm, !gt))
> >> >  				return false;
> >> > diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
> >> > index be4195264286..7d6daa7eb1e4 100644
> >> > --- a/drivers/gpu/drm/xe/xe_rtp.h
> >> > +++ b/drivers/gpu/drm/xe/xe_rtp.h
> >> > @@ -35,6 +35,10 @@ struct xe_reg_sr;
> >> >  	{ .match_type = XE_RTP_MATCH_SUBPLATFORM,				\
> >> >  	  .platform = plat__, .subplatform = sub__ }
> >> >  
> >> > +#define _XE_RTP_RULE_PLATFORM_STEP(start__, end__)				\
> >> > +	{ .match_type = XE_RTP_MATCH_PLATFORM_STEP,				\
> >> > +	  .step_start = start__, .step_end = end__ }
> >> > +
> >> >  #define _XE_RTP_RULE_GRAPHICS_STEP(start__, end__)				\
> >> >  	{ .match_type = XE_RTP_MATCH_GRAPHICS_STEP,				\
> >> >  	  .step_start = start__, .step_end = end__ }
> >> > @@ -66,6 +70,22 @@ struct xe_reg_sr;
> >> >  #define XE_RTP_RULE_SUBPLATFORM(plat_, sub_)					\
> >> >  	_XE_RTP_RULE_SUBPLATFORM(XE_##plat_, XE_SUBPLATFORM_##plat_##_##sub_)
> >> >  
> >> > +/**
> >> > + * XE_RTP_RULE_PLATFORM_STEP - Create rule matching platform-level stepping
> >> > + * @start_: First stepping matching the rule
> >> > + * @end_: First stepping that does not match the rule
> >> > + *
> >> > + * Note that the range matching this rule is [ @start_, @end_ ), i.e. inclusive
> >> > + * on the left, exclusive on the right.
> >> > + *
> >> > + * You need to make sure that proper support for reading platform-level stepping
> >> > + * information is present for the target platform before using this rule.
> >> > + *
> >> > + * Refer to XE_RTP_RULES() for expected usage.
> >> > + */
> >> > +#define XE_RTP_RULE_PLATFORM_STEP(start_, end_)					\
> >> > +	_XE_RTP_RULE_PLATFORM_STEP(STEP_##start_, STEP_##end_)
> >> 
> >> To use this effectively someone will need to pair this with another rule
> >> like
> >> 
> >>         PLATFORM(NOVALAKE_P), PLATFORM_STEP(A2, C1)
> >> 
> >> and using PLATFORM_STEP() by itself without a corresponding PLATFORM()
> >> or SUBPLATFORM() would be a bug.  Maybe we should just make
> >> PLATFORM_STEP a rule that takes the platform as well as the stepping
> >> range so that it's impossible for anyone to ever use PLATFORM_STEP
> >> without tying it to a specific platform?  And also make a corresponding
> >> SUBPLATFORM_STEP() rule for cases where that's relevant.  E.g.,
> >> 
> >>         PLATFORM_STEP(NOVALAKE_P, A2, C1)
> >> 
> >> or
> >> 
> >>         SUBPLATFORM_STEP(BATTLEMAGE, BATTLEMAGE_G21, A0, B0)
> >> 
> >> We'd need to update the union in struct xe_rtp_rule, but the size of the
> >> union shouldn't increase.
> >> 
> >> What do you think?
> >
> > Anyway, consider this feedback optional.  I think it's fine to land
> > as-is if you want.
> >
> > Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
> 
> Thanks!
> 
> Yep, your suggestion makes sense.  I would say that the same argument
> applies to GRAPHICS_STEP and MEDIA_STEP, right?  In other words, e.g. it
> doesn't make much sense to use GRAPHICS_STEP without also using
> GRAPHICS_VERSION.

Yeah, it would make sense there as well.  There are a few places where
people use *_VERSION_RANGE() rather than *_VERSION with an associated
STEP rule, but that always seems a bit risky to me (even if the specific
cases they used it in are technically correct when the code is first
written) --- it's too easy for the range to get extended to additional
versions that need different stepping(s) or one of the existing versions
in the range might be updated to have a different stepping range than
the others.  There's just a lot of potential to make mistakes as
workarounds evolve over time when combining both a version range and a
stepping range, so I'd be fine if we baked specific versions into the IP
stepping rules and disallowed ranges.

> 
> So we can probably go ahead with merging this as-is and then have a
> follow-up series handle stepping-matching macros in a way to always
> require the relevant higher-level info (i.e. platform, subplatform,
> graphics version or media version)?

Yeah, sounds good to me.


Matt

> 
> --
> Gustavo Sousa
> 
> >
> >> 
> >> 
> >> Matt
> >> 
> >> > +
> >> >  /**
> >> >   * XE_RTP_RULE_GRAPHICS_STEP - Create rule matching graphics stepping
> >> >   * @start_: First stepping matching the rule
> >> > diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
> >> > index 6ba7f226c227..166251615be1 100644
> >> > --- a/drivers/gpu/drm/xe/xe_rtp_types.h
> >> > +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
> >> > @@ -41,6 +41,7 @@ struct xe_rtp_action {
> >> >  enum {
> >> >  	XE_RTP_MATCH_PLATFORM,
> >> >  	XE_RTP_MATCH_SUBPLATFORM,
> >> > +	XE_RTP_MATCH_PLATFORM_STEP,
> >> >  	XE_RTP_MATCH_GRAPHICS_VERSION,
> >> >  	XE_RTP_MATCH_GRAPHICS_VERSION_RANGE,
> >> >  	XE_RTP_MATCH_GRAPHICS_VERSION_ANY_GT,
> >> > 
> >> > -- 
> >> > 2.52.0
> >> > 
> >> 
> >> -- 
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
> >
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
