Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADB2C27C52
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 17:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC6410EA49;
	Thu,  6 Jun 2024 17:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zf5T8nB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEEB610EA49
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717696019; x=1749232019;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UDq3rFsWLK8MVPZRawc/6Eo44xpAg5zZPxQAlWaddq0=;
 b=Zf5T8nB5raz90oWZOxWKpIaZNjJkDBFaQVPI91+9YVHOhNcMOSwhvAz4
 sKMsnfDnbVLKKt/O2sLTzy0/+7WGLVm7xE8sVKqAMkwGoha22I/euQxL/
 bgSF0VSa6t6opyguITsJ+Iq3Jcj1+/EipDK6t6zCqQZxorqjuJjDZRdZC
 G9oz5yrI5AfLxwycipmgiDozuzL58HHvq9H21K5mAH1V0RCCLTZhK9WGy
 BZk9wSWp811F6SG8PUtS+16YtxSeE/GN95/kn3Nu9yZp8IrqWbewi7Gba
 l5rtrF+ap42GP0jxIQwbVM4Mo9tlKt/R7Sn52cShnafZyJ3g1G2aFQiDz A==;
X-CSE-ConnectionGUID: QDlHZfHLRTiLdKr40OOUUw==
X-CSE-MsgGUID: 0O53vfaeRma4RBfSTH2dNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18213184"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="18213184"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 10:46:59 -0700
X-CSE-ConnectionGUID: xUv4B89BTdqQ7SEThzzXHg==
X-CSE-MsgGUID: MDnflh9eRfW1cU2ddl3moA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="37900972"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 10:46:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:46:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 10:46:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 10:46:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 10:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2kHDWeja//zki/Bcrd8QhtPEMZLoJ34I+bO1DThZUsLNwbKrACYANHoxbqzuP6xyeUYgIFFDPUQnRArpvc4bfCQvB71Cjxgp6/Kz0H83aVXibdlWXRj/HDPiu1P5DbJIjx9XnaJNiK3lt9fJZE8XvmSfYg43aDHWcyfvEe/m4D/pesxSF0CDqFXCCxtt9SiHs1M2skFgcHBvuIcQ2kp7cSc9SiDeT5Ct7suGB4KvFtE7EV8iJpsjargfTf4N97Tmv5+LhvhW3t7+W3ipoZEfNL2yO5SjebwFlRBdfE8qqG0SAOqbVIgSY50vsM11G7eFXhB5ZA87EMVcM54EFyUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ND0HZv5bknd2De/rc7v6dJ5ULixvZt/bh+hCIb9mbE=;
 b=BWmXac3YLpFNlxRl/l6T7ThxEcpG+LwUKy6J1XePXWtQ5p6c6iBeZw87ikEcaUQ/6vUHbdId/C5IBFPY9Z+WXpyAYsy5nItd67Vb3jThOA7RzlguJMSm6xaheQ2UbmA2p8N53wKu4XKGePnbtpCuhOZ8QRRVLp961ILTbea5+eiHZ3NrAoQvCVgoZkGOhziJ0mop8b5AYQ1+Qc7BmUABl9dniMTiZWayJjsls0z5Qf2JeU1HzlXmZncX8ozOkdCW1dihZ0rxu9vTsVXvpBfLjKNiJE+zpjWM6oYBY/qEyisX/Ld/gL+Ots5jfaqo1KPOT5ru5jBiPD5EivLAs/dKGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Thu, 6 Jun
 2024 17:46:54 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 17:46:54 +0000
Date: Thu, 6 Jun 2024 13:46:51 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Nirmoy Das <nirmoy.das@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
Message-ID: <ZmH2C6oT0A0-IjKf@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
 <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
 <63c1b974-491a-4349-bd13-d649d8dc2717@linux.intel.com>
 <ew5v4bxh7ocvaquhp7ghcuwexmkfdkzyp2giuanr3lhaetxntl@xlfupwcaraxd>
 <2f8c48f3-598c-4bc8-b9ca-da22e380c130@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f8c48f3-598c-4bc8-b9ca-da22e380c130@intel.com>
X-ClientProxiedBy: BYAPR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:a03:80::33) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|PH7PR11MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: ee997303-94f5-4146-b9a6-08dc8650a74b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?LJ41RjpZCOAF1xylupto7zuqFxEEIJ9SiBaSVqWjMxtXGMLbfcnTpjnRN0?=
 =?iso-8859-1?Q?suXgy2uyw65XwgikdX6hKMPgt0//+ZnAKsKkNAt4Cx5VkWRGFLwQa1Qu48?=
 =?iso-8859-1?Q?BL/rYdkqyuHMzUvhjM/aU4BlJweBwgNIvnW9k/KKTcBIiGZ/LU1QkOz3g6?=
 =?iso-8859-1?Q?5UNndDnQfg94chvL0gcVerU259S+Tj3MFj/zpvWe1jSstJLCm8i0GDx2Ip?=
 =?iso-8859-1?Q?K4bMyeB/nVDkmzt4/TpitTT4EMvAXA5aUYFGO0c7afTzQht4198qbpGm50?=
 =?iso-8859-1?Q?FtT3DSfTmp4Wninx1/7qkKR19v/4Q2OMDt1b4Hd5aaNBgDSjgiYjl8+0d+?=
 =?iso-8859-1?Q?M3wJF0EmLD+0j6g1X1p/U4+iVn9HpnhdSyAlYN8jewZOyn08Ob0KswJ38Z?=
 =?iso-8859-1?Q?01IKOcN1SaGvt5RJD3P2fTHyfUAHZv6jQfw76QFmTaizz29qMPERzsgZS4?=
 =?iso-8859-1?Q?jnjfXRxm7g0s5tWJRd8dqwrJTuQt1inpkFL1XY1LOj8h0epzNf2pMecqLc?=
 =?iso-8859-1?Q?NTpPr66W75pdUwBs05lkkvtrQOv7ssAMBzJfcQ73kuY16vWh4q4tuA9q45?=
 =?iso-8859-1?Q?aB7FE90h6fYY6VzSiYiLnq6hbz1DtCu6y1zZvJzPnlRKpFsx45pGmIc9PW?=
 =?iso-8859-1?Q?vbuc/kAOXJLlcIeY/HKGcMHXQqyvsTn2n+cPoQBzz9c0BC3JQ4mrYji8I1?=
 =?iso-8859-1?Q?cFxPJzUO3nw1MqZH+ng2fGoq8niYYj4CHoPMuuLSz0eA2RYJXzygrTmFZR?=
 =?iso-8859-1?Q?Bb0HcGvqtfsvyA9kkU8mXWEkia51ksLNSjZOCMUUoSFHIwTrYXmZVwASIQ?=
 =?iso-8859-1?Q?9AN8OApkUP2xUvxlON4KB8kwZIPNLcTxJIcuPqiEi52NJtC5JRGKY9BBD5?=
 =?iso-8859-1?Q?pbsAtL3Y2VqYByZKkz5hf2Wa2us/1ScA2qgsL3c1u3FdxXUTB3lZCtpRQy?=
 =?iso-8859-1?Q?l+jBP//14gNwrsaOmwaty4lL+rD5hwZlcfa06oyxiS7lRlQUXTz115X4w8?=
 =?iso-8859-1?Q?UtWr4+67QM2YlOClAIFd6GpI2A0/CCk4XlUBJwCgtZgFI/cR+qhXqYlu9z?=
 =?iso-8859-1?Q?MYSQy8uQEqJFyIh2t35hJtPSgJpZZ/MEmREtNiqxKUk4DdbnHVxdcrcYgw?=
 =?iso-8859-1?Q?yLtyMiJmOqdqfb9Rkj58ZwshHd1JWR+jVar+ruzUux//6Ff9JTq1QO1BPq?=
 =?iso-8859-1?Q?4G2ewvaWnY5Wk+GxDuaclUYmGKz6CmAeM0zLLbotzfhMuRgtjTQ2oFrOdM?=
 =?iso-8859-1?Q?J7G8MpwPFzdtLdukXH/fpLOOaNKURaO/+gIoaXivaIUXmzfcgIwFIm/Mdr?=
 =?iso-8859-1?Q?bsfBrgN6BxA32rKWeV0xupA8nXVBptFvceGODFdu9O+6cbwVIM7ebyK0b1?=
 =?iso-8859-1?Q?GrRcFUZxlC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?sHDu42ETzpdd0omcrPTiFiI+2UszXfOgYvjJk59ayd/v7xXJidb75FTCLt?=
 =?iso-8859-1?Q?MqWpKXXnAZRfZR9qfW7BhY4nfch4CvLvKcJRCJYRvLOW2wMj8bUBQ1QejO?=
 =?iso-8859-1?Q?2z1Y5qoyuntLR2ZixvKBc1eEDTOFAhn32uM/yKtDDU2444bqgwUDTuTXQZ?=
 =?iso-8859-1?Q?lu53kBjsLFR1b9NQ1yQadZRjQknjft0lUtXtoriMPaM6qF3LH+MHAXpRcz?=
 =?iso-8859-1?Q?GHsKHPTyKEsIeTKhS55UIG0A6vzZWErDROp9S3H1k1gSvnEUMZySnvw4CC?=
 =?iso-8859-1?Q?rJMAJyAm0zD0NLMa94K/2AsuWAQL6If8qB30vrPSz4JujQusWWOfnBX0bJ?=
 =?iso-8859-1?Q?spD4X6vvxCNKNdfMB5/OczzIwl7k5A1Iu528aHT2FBi5nX/y6jCwMkKD1l?=
 =?iso-8859-1?Q?uex5WA0NUZx8FWePmmEp1ZVtSAd+qtjfa/wbZYneSrS/CkbH6yJbFIAOMu?=
 =?iso-8859-1?Q?N15xxpS4srvL/s6nHSvh7m+LpQBaWH4LzDYtCbTSZTlC3FlWK8MK6UzEEh?=
 =?iso-8859-1?Q?Tw6alGOaiwOQ+dG6Mf2fFawu6lFsVs0rlMl58fYjmsByxlTh/pZEgKOb4E?=
 =?iso-8859-1?Q?eR3OdGpgJFZDQEa69GLm1xARIcQ5hPanK1AcNPTtEvIinip8+3yeSivht7?=
 =?iso-8859-1?Q?uZoKWgkO6jnOjgUOxgECc3MXMR1rRzalflpdNog5/Usemy23ARL/nc0MOo?=
 =?iso-8859-1?Q?r8tH64IO/FnB5c98BMOhzv2sGEuvvrOOcUEHmO5JxziTKd4rosbR7HKacA?=
 =?iso-8859-1?Q?cngdzgWSX1oAN4BtvsWxUUUN55EJP41Tnt3IINTLYepBO/9vJrwpffoqq4?=
 =?iso-8859-1?Q?IcQ4D8IwPDWG0cxSrSC8+ie8imanEMGgGHOjith/GsyYpLxgKoBYtOqElY?=
 =?iso-8859-1?Q?c16CqwUOeBWLQntTVuFszvZdtugJZOgT3fKKbXNR2fmRP1SStg9PDcNdoP?=
 =?iso-8859-1?Q?tytW2lFoZkYzfrOEIeaVQJ/q5/zDzaYrY+KZYHp7/ekfsr+nx9QBSXWtJ0?=
 =?iso-8859-1?Q?ZU46JNp7LTXUmUQMso3T7YUpI7jxpJHE702aRfTzUpRBKji3CYbUehple5?=
 =?iso-8859-1?Q?LH3IQ1bZSgl4NWa3rCArf8L3UAiduAHXDPsQ/sBM07Qc7twACW/tUrHfq4?=
 =?iso-8859-1?Q?eD3+7t0U5dfuwAtNefxD7bBSQaNLxxQcs9OT0M/llwjubx7PVGYFG+pcZy?=
 =?iso-8859-1?Q?CYdESXUatXjG+uR0OCfgon25zsw/32Phs8XMVnNiy9YTI4KlhBfsfbHOiq?=
 =?iso-8859-1?Q?ggph9x92EzLzXZytzcubYrVgFdqNKlMTK1FIog+ZMiy2QXNROBUSWDZStv?=
 =?iso-8859-1?Q?0zzb7v4BIwmDZZZ8yWrm9zvGpq+k4suri3+b0EiNjssXdkTgtgmTXGYo5i?=
 =?iso-8859-1?Q?OvMfFjkr05pOfCasGhfiEpp8w3Fq1g29jYK6RO8/huVwWYn4DS/VmZmFSY?=
 =?iso-8859-1?Q?Z7n+hIWM4KbTmE6VwVaL74F4M+EDo/B9QgWjHiPgBW1cEQDmBYgrSzd/SB?=
 =?iso-8859-1?Q?IE2+xxcLjFfVpfGsqqxTM0RLzBmBhYJOefjJTWMwlupNpW6AIw0/IoYnBC?=
 =?iso-8859-1?Q?M8794MLBuw3eUcL+2jHSMC/Ujp+4c6bAOR63zCCGGcZ3nFGz1ZP8QsFbxH?=
 =?iso-8859-1?Q?nLRn0GS+reXpMnYb6fGgB2lUwXt+Fhm2A7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee997303-94f5-4146-b9a6-08dc8650a74b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 17:46:54.3698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cuCqUr4MtokIXpuG3xO0GCwYEa4sTFkf/ZJUD8fgyXnQNT/8O/b6HpWv4/2UIGMtqhI/m0Sk4bzN4PJuPLs6Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
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

On Wed, Jun 05, 2024 at 12:49:42PM +0200, Nirmoy Das wrote:
> 
> On 6/4/2024 11:13 PM, Lucas De Marchi wrote:
> > On Tue, Jun 04, 2024 at 04:21:25PM GMT, Nirmoy Das wrote:
> > > Hi Michal,
> > > 
> > > On 6/4/2024 3:12 PM, Michal Wajdeczko wrote:
> > > > 
> > > > On 04.06.2024 13:02, Nirmoy Das wrote:
> > > > > xe_force_wake_get() increments the domain ref regardless of success
> > > > > or failure so call xe_force_wake_put() even on failure to keep ref
> > > > > count accurate.
> > > > > 
> > > > > Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
> > > > >  1 file changed, 8 insertions(+), 12 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > > b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > > index 440ac572f6e5..8fcc08658d89 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> > > > > @@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct
> > > > > xe_reg_sr *sr, struct xe_gt *gt)
> > > > >      xa_for_each(&sr->xa, reg, entry)
> > > > >          apply_one_mmio(gt, entry);
> > > > > -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> > > > > -    XE_WARN_ON(err);
> > > > > -
> > > > > -    return;
> > > > > -
> > > > >  err_force_wake:
> > > > > -    xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> > > > > +    if (err)
> > > > > +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
> > > > > +              sr->name, err);
> > > > > +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
> > > > what's the rule whether to WARN about the failed xe_force_wake_put() or
> > > > not ? should we also WARN when xe_force_wake_get() failed ? does
> > > > it make
> > > > sense to WARN about put() if get() already failed ?
> > > We don't have one yet.
> > > > 
> > > > maybe simpler solution would be make function xe_force_wake_put() void
> > > > as it almost nothing that caller can do and move WARN there if needed ?
> > > 
> > > We have code that  does "return xe_force_wake_put()" So question is
> > > what shall we do
> > > 
> > > if xe_force_wake_get() worked but subsequent xe_force_wake_put() fails ?
> > 
> > there's not much can be done here. I even don't think there's a reason
> > to wait on ack for force_wake put... in most of the cases.
> > +Rodrigo, what exactly are we protecting against there?
> > 
> > If that xe_mmio_wait32() fails, driver is toast. The reason we check (or
> > should check) the return on _get() is because we want to bail out
> > whatever we are starting to do rather than attempting it and handling
> > bogus values of an IP that is not awaken.
> > 
> > So, maybe what could be done is
> > 
> > a) XE_WARN_ON(xe_force_wake_put()) -> xe_force_wake_put()
> > 
> >     We cann probably move the WARN_ON() inside xe_force_wake_put()
> >     if we want to maintain the behavior in most places
> > 
> >     Then make xe_force_wake_put() void as suggested here.

yeap, I believe we have a rough consensus here that put should be void function
and perhaps (likely?!) with some warn inside it.

> > 
> > b) I'm not sure about the benefit of the weirdness of
> > xe_force_wake_get() incrementing the ref even if we failed to wait for
> > ack.  The only thing the caller is going to do is to call
> > xe_force_wake_put() and bail out. Why are we not unwinding then?
> 
> With unwinding of ref count and partial woken domains on error, we should be
> able do
> 
> 
>     if (xe_force_wake_get(fw, d)) {
>         ...
>         xe_force_wake_put(fw, d);
> 
>     }
> 
> I will let Rodrigo suggest how best to handle this.

I believe the benefit of trying to run the code even when ack timed out
is on clean up cases, since we use this force_wake on a broader scope,
rather then only around the specific mmio calls that we really need it.

So, I'm okay with make this proposed flow as the rule, on always
checking the force_wake_get result before doing operations.
But maybe on top of that it would be worth to scrutinize a bit
the callers and see if we can/should reduce the scope of impact.

> 
> 
> Thanks,
> 
> Nirmoy
> 
> > 
> > 
> > Lucas De Marchi
> > 
> > > 
> > > Regards,
> > > 
> > > Nirmoy
> > > 
> > > > 
> > > > what about making the flow more intuitive like this:
> > > > 
> > > > bool xe_force_wake_get(fw, d);
> > > > void xe_force_wake_put(fw, d);
> > > > 
> > > >     if (xe_force_wake_get(fw, d)) {
> > > >         ...
> > > >         xe_force_wake_put(fw, d);
> > > >     }
> > > > 
> > > > >  }
> > > > >  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> > > > > @@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct
> > > > > xe_hw_engine *hwe)
> > > > >          xe_mmio_write32(gt,
> > > > > RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
> > > > >      }
> > > > > -    err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> > > > > -    XE_WARN_ON(err);
> > > > > -
> > > > > -    return;
> > > > > -
> > > > >  err_force_wake:
> > > > > -    drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> > > > > +    if (err)
> > > > > +        xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
> > > > > +              sr->name, err);
> > > > > +    XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
> > > > >  }
> > > > >  /**
