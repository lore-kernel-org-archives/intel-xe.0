Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60001C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC0710E2B4;
	Mon,  5 Aug 2024 20:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/5BMRpl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94F610E2B4
 for <Intel-Xe@lists.freedesktop.org>; Mon,  5 Aug 2024 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722890874; x=1754426874;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=m8Du9xzmOJOHRps2wiTpaX4sN7WLsJWU41GcBbzuHXg=;
 b=e/5BMRplD+cWJCGlg7cCHgjRD5krate243JYTlzYwgX6xbOqhv5MkV47
 g2r1PQq8+RMzUlQtJUvXZzKzaUk+CpgQ7ss58xarO2xbGphq2z6eX9Ow0
 4VDdT1HIUw8fN90uyOezXf7bAuebAlzODc8k6FEGfO+LQVA3oNfoRBLMk
 0+FgQZKrHS0sO32r9/gdZLbqb59q6x2wKRDICk1mYl/cQUJ1CPdG90WCQ
 dGxx5ZpCmNXVETOUbT0WqYOMF3IIx7VmDb2XXAgQJWp8tCLdiHI/1ireY
 7Tcpwwt4P5E0jpssXsoshgHpLwhBYiumap49xdAA8SwcayM0+k+/HMuoC Q==;
X-CSE-ConnectionGUID: pdjW6HnyRU2s8sO7wVdzIg==
X-CSE-MsgGUID: TLkP7uOORh+mANxCCNnbcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32255919"
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="32255919"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 13:47:54 -0700
X-CSE-ConnectionGUID: GKMsmR+IT6+H9xg47Bf7ew==
X-CSE-MsgGUID: B3vsav7sQS2ThOkzS8mojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,265,1716274800"; d="scan'208";a="55967119"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 13:47:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 13:47:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 13:47:53 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 13:47:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Izs3eJCP7z4AH45+MqiohCxm0THBfgV6lgH+6+JNTXvHkvu8y2IrbodDrXYk5jz/JOP9LY84LbuJrBHroehspsyWZyCen7CprgkO6vIrXcmg8ljHpXYQuM1+iAxnwZUVijnWBS5aT1JuT+1zDtlQgu2ZvONZEy1/6omcfEQK1aXADsk8M64bFXQg/l9JSBfnecIq5DfBflW0v0x8S9VIC80HzEuBBh/OCmqYCoDV885nz3BZ7jfIISXcfjeyBsq0col7BTPgDDxiMspFhDdAB0KRY9/UxtF0a2g04PtXGoDBpNRKDtzOLAGlREj+zafXSeKN+bt2OY3mkyutXZ05bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mW1qb6ZCeUvFiAQWIRf8yLaozU6VGOomViNbdOGhE1Q=;
 b=zRg6i2HKGMFOW6/XUnkRbQMFsvEs7Wz6BiONmf8l3NTWnjKstpPGvqMnvWpiM+3PxnUe+NaC0216VTcQ/K+eLGy88ZletK+FgsYXDqeEIuc4c91GTnrKX6DKRbyGIAJZLeD/sS20aLecuh9Ja4J6RhQDLH4CePd18YnV3sMdLktkkWOl7Kc8z1IBmyhMbTaS/dFCm7XOjc4cBDoV1kLH13qVnkuEnQq04PcYiZnsVRCGvV2sYdRbWlz0hliqi3DAEtnMSKdZuVM3rtWZirHOowsLCKxBPhgQzs3Vf3CezLR1GrqgQ1MBEPYfJGU7wZ9RkncqguCTozelyJW49YFKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7499.namprd11.prod.outlook.com (2603:10b6:510:278::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.29; Mon, 5 Aug
 2024 20:47:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 20:47:50 +0000
Date: Mon, 5 Aug 2024 20:46:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 8/8] drm/xe/guc: Add GuC log to devcoredump captures
Message-ID: <ZrE6MOIGZKk7Xj+5@DUT025-TGLU.fm.intel.com>
References: <20240729231753.3101070-1-John.C.Harrison@Intel.com>
 <20240729231753.3101070-9-John.C.Harrison@Intel.com>
 <ZrACbsc9phJWZI72@DUT025-TGLU.fm.intel.com>
 <4d692553-36bb-4eed-b884-e7c176e6def3@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d692553-36bb-4eed-b884-e7c176e6def3@intel.com>
X-ClientProxiedBy: BYAPR02CA0054.namprd02.prod.outlook.com
 (2603:10b6:a03:54::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: bab7a7a0-b535-4e5d-676f-08dcb58fdea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1F8K3IYjJ5EyL/qfZtMoc3LHMhhhTY6sK7Yr6d0IeVpn3DbC0N2Lmh0bCzCt?=
 =?us-ascii?Q?VwlUoqldx+w7b0KjzGSW1/GSzItMlv32vg/34gFguiNev9F5SLmzj46zK+Zw?=
 =?us-ascii?Q?yrB75RENGlIoHmDBoFEGcz3U4/Tbyb1vSmcwp8i4XcUUYpzgWhJwCbnl/oqS?=
 =?us-ascii?Q?qMby1wBtPT5FTg95KbRajl5DmLhQmPWmL6zdTzCe2BjBcoOKA4FI4bNlel+e?=
 =?us-ascii?Q?hHr0HFj6xbDeeGCO2YTZ/ECau2E+I+/vbpgAU+QSUM12HZFCFsJHcUuY9Tle?=
 =?us-ascii?Q?SrQte1oDbxJYoLn0Mnhwvazi+cJBDgcGSAwEizzt58eHi2NJWZrCErwqwN7I?=
 =?us-ascii?Q?MMSRfeFssjzFvoCwdUZKifb4uoE5oRmMuVxk69Mx7yzuOiZBWuCqVBlrhT4i?=
 =?us-ascii?Q?t3POE744CiJx5qoDFaVOjvjoF6aW43+uMgjIey9nHmKUYYxMPLOpnlvwWluM?=
 =?us-ascii?Q?qYoRNj7s3/4dnd3moWy83irzj3NwevPFe0F/83Rg2UVq0wjWm5mtFeB57Cht?=
 =?us-ascii?Q?AMlW7HA57Wkq3SSJe16BYC45PhBiK+OW4uw7oePajWck/F3XUt9ald3EQE0q?=
 =?us-ascii?Q?+3aX7girNn4uLyfB88Ynn0xVlrkV0iWa5PkZ9cHEDPLqWCVCgf/yavznVZPZ?=
 =?us-ascii?Q?ekZXBa08w+1k2ZXn55CdGmgYFzplmlgfaNfOvvrjNZVOb7Jnaw+pwwJ6Ztjs?=
 =?us-ascii?Q?AU7U85e3+b9Im8iQd/mKWGx8rSQ5TtANu9WzipDEbMoMsA3ihvsE1ga+OKFX?=
 =?us-ascii?Q?fCkIkVTdPHnKl5hIb11BQrDbAjEshmNEKPJ/uzZha5ah40Xknws9bAkhcfI9?=
 =?us-ascii?Q?x2KW9RHpo71WwH3fiKt+JiJj9GHJ7VbDkj9SkpFtJwW/kTw9dVEdSpLeM/02?=
 =?us-ascii?Q?HEUnOsM8/akBMAHl8Pb4xHSV6HlelSh4lCJYRCNx6HVGFbkKZRP5XQAIzM31?=
 =?us-ascii?Q?O9fwkpQM4G/rcpINfiKlWcsNTOGBOA9vB9/nzPyoVfmQiDEH7Nk3h3h1o0Xk?=
 =?us-ascii?Q?zRgb2MtFw9pnZg29WqOk2XGGRR8thDTiQToNpwkusC9pULmFGgXlq821tbuL?=
 =?us-ascii?Q?KK2In79cLDaUxOleVUvYSLfgs86Rp03RtxKdLmo07SzSrj2tpjgJ4ny0PmRp?=
 =?us-ascii?Q?AZ+wWP8gvVj76uOSmoRFDWrYUaDsP80Ti7HXd3nFEmOPaF8E8BdaR47QBRmY?=
 =?us-ascii?Q?wm9GTHX+qLxUeXdo6WcaFF59gngVLlsLstfUWZncUjNYl3t86mHw+K+awXDU?=
 =?us-ascii?Q?jJkF+sh0j1vlhED1WeUbp70aVKuHEFmE7y9ZTrqlzLUcKugmFRTHr6jWnnM9?=
 =?us-ascii?Q?574=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VXuhr7PjWduip9u16TxQYwipXCaDg8jaSR7URE1KfNCQ4f7OAkwrFBy89vyb?=
 =?us-ascii?Q?vo0ycz4xv7wlFl+9Ldpx7+uJH8YOVhKmbWYUdRjubFyLpWgsSbYZFA3tVsCU?=
 =?us-ascii?Q?kUpYFBnasLQaYyHLmR0okl/HraMnnH8efRYNZ7qM/SZJ3nkskv6I0ysM22YA?=
 =?us-ascii?Q?nnRGbMdsjUPGzYOD9eUi9anV+uIvwvp2ol0CKYEh3z8cJSbcwfwIqgdQa4tr?=
 =?us-ascii?Q?156dC6o8M51G9tTS1yUJOPAgSyGEYx3o+rvIXM21iwIgOuoBLvAfUdONeotv?=
 =?us-ascii?Q?yPxAZ7E0HIDEymhtoayIzaMvTO95xTgsil0lsbx7Ny9a9AyebyAM6zSAb5p8?=
 =?us-ascii?Q?vTn83Hs4D7XEE038X75JQDvCSX7RxZf4lQSwuj4mlObvmCpvbh8kutJOSUNw?=
 =?us-ascii?Q?UZZKBMd7JWThbXbXq9XAO1UaBzq41c3kKWTOz6Zahf7yi5oqnCD8i7N83AcO?=
 =?us-ascii?Q?pj6hI0xYvAZG8ir3G+dGWxv5VMrXDSyD/1oMiLJCJXAPTWp12Wa+Fsk1Pp/t?=
 =?us-ascii?Q?rkNdnS8nyE6KIeaqVp7s6xAQxlnh2IVraa0IhYDjKtt7Ka+qPYeCvJnItbv9?=
 =?us-ascii?Q?UdoPXh8H2kTfzyxWYefCJZaux/v45oDp7UTBBSRCrYBvw85fsPbO6bNzy2Um?=
 =?us-ascii?Q?38Fdefmga0GMfD4aFiu5tr6w7+yarXEZEspmQxRuUGKul2K6mNHRH9YR/wWN?=
 =?us-ascii?Q?xk/Ocih7bQIrhvZ8XV0Xndkh1xo5MVqp8FedH6yfdfhoBU65PlYKtH+jkJJL?=
 =?us-ascii?Q?HQ2e0NeoNChTdbqN3vP98E1lBlSvJ1/MzKBpAzVz41eRUHBTfK3fr47TWlUB?=
 =?us-ascii?Q?9teSG8fec4h0mDfqbQ2cdRHPxS7/J3PdLpgnaG8vV1oKYbQLhy0n2Zqfd89Z?=
 =?us-ascii?Q?oOaq2DN3jzcmDtMp92Pw4EZdcvz+iUvZZYlVt+Yncxuy/bC63arYxsgfN1oI?=
 =?us-ascii?Q?JO4k1Ft9t6Ax+isiKodbxADrucPSXEaoJxGDZ0MYpsKkzFHN8OSwmcUPjgR0?=
 =?us-ascii?Q?S3mGSTGhbHz3tcT4y3UjPT+eAF9P/JilygZVb5EhMmyg9n+o6/nMJ18SNmJY?=
 =?us-ascii?Q?FbgRxFEWDbFqD0EtLG9g11ajW+JUmsbtI5PbmsjRPkqip/TDpEc0sst/6tZH?=
 =?us-ascii?Q?TgEiDGkNOaJcMhe+4hy7JeJYQUU9UidLPjJdevjupr+i/0WWNbizKuO4jBfg?=
 =?us-ascii?Q?oCfSj6zrNoSQuy+FA/BxaO/pFAGevFzIXSmkgokV7iLHQQyikWOOqarJwTMb?=
 =?us-ascii?Q?/ucO2RPGAVdOrxrEzX/g+aFjsiJ484O+YTuiEitacdjCuugtktrPmslyJ/qm?=
 =?us-ascii?Q?h4dWShC75D/Ao8EIvYijU5a3QQGgXW8j7JP3OXqgbLQa8CWjEHLJgAuPnQQf?=
 =?us-ascii?Q?5jpn+mm0x8fWLCtf4Gh1rSf/vbJvAMQ0Mxs7v9GKxa3guSCYZObtmtJENlJw?=
 =?us-ascii?Q?vNw8YQZ6xupAXLYTx7xsRcl8Rs1reAr3pF5H818n0TjUvVN7IpTkRaOoq0me?=
 =?us-ascii?Q?voiqHAdTkJeJUtnUmwOpQnik/XZ2ti5krUvwhxisjDpoEapH6iRl2rDTrsPr?=
 =?us-ascii?Q?iAT4OhT99aruiYqGDm+J2Bta+cotdQmFVKgabUYqhW5tFOlpxvWh7CZApm3V?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bab7a7a0-b535-4e5d-676f-08dcb58fdea5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 20:47:50.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EbenSqVNezuVCxCuOJ5S6BLWiqL8GzLArG/72bhDvZoNIiyu6qL7sxMD7feOi8/uqrh+55xpUIcVTflS3Lharg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
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

On Mon, Aug 05, 2024 at 11:41:05AM -0700, John Harrison wrote:
> On 8/4/2024 15:36, Matthew Brost wrote:
> > On Mon, Jul 29, 2024 at 04:17:52PM -0700, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > Add an ption to include the GuC log in devcoredump captures. Note that
> > > this is currently optional and disabled by default. The reason being
> > > that useful GuC logs are large, very large when converted to an ASCII
> > > hex dump! And as they are not always necessary/useful for debugging a
> > > hang, it is not desirable to force all core dump captures to be huge.
> > > 
> > > NB: The intent is to add support for buffer compression to the core
> > > dumps. Then the log can be included as standard without being too
> > > onerous. At that point the module parameter override can be removed.
> > > 
> > Briefly looked at this series and questions / few suggestions.
> > 
> > 1. Remove mod param to include GuC log from devcoredump and always
> > include it. We had a bug in devcoredump which has been fixed in [1]
> > where large devcoredumps took forever. This has been fixed, now
> > capturing a devcoredump around 256M takes .3 seconds so adding another
> > 8M or so seems fine.
> Yeah, that was the main reason for not wanting to always include it just
> yet!
> 
> > 
> > 2. Instead of printing GuC log as hex, can we just dumped it as binary?
> > This is what we do VM mappings with dump flag set and LRC. grep
> > 'ascii85_encode' for an example of this. It would be nice to keep binary
> > dumping uniform. Then surely we can update our scripts / tools to parse
> > this output.
> Note, that's not binary. That's ASCII85 encoding. There are some drivers
> which genuinely include binary blobs e.g. ath10k (https://starkeblog.com/firmware/wifi/linux/kernel/2021/08/11/dev-coredump-and-firmware-images.html).
> But yes, it is way more compact than a full hexdump.
> 
> Do you know what userland tool is currently used to decode the ASCII85
> objects? The intel_error_decode tool in IGT does not appear to have been
> updated to support devcoredump files.
> 

No idea if we userland tools parse this. Maarten added this to both the
LRC and VM code, so maybe ask him?

I don't really want to hold this up as having the GuC log is a good idea
in devcoredump but also want to weigh that with having a uniform driver.

> 
> > 
> > 3. Can we move GuC log in devcoredump to
> > xe_devcoredump_deferred_snap_work and just use kvmalloc? I suppose this
> > makes debugfs capture a little tricker?
> No idea. I haven't had chance to look at your changes in detail yet. So not
> sure what is involved. For certain, I would much rather capture the GuC log,
> CTBs, etc at the point of the error rather than in a worker thread some
> random amount of time later. The longer the delay between error and capture,
> the more chance there is for things to move on, wrap, overwrite, etc. And if
> you are using kvmalloc, that must be in some kind of asynchronous worker
> thread?
> 

This was existing code which runs in xe_devcoredump_deferred_snap_work
(a worker). Again Maarten added this but from the looks it appears to be
capture minimal software / hardware state directly in the capture, kick
the worker, the worker captures larger memory buffers where kvmalloc can
be used. I think the GuC log fits with that design by capturing in the
worker.

But yes, this comes at the cost of an extra delay from the failure point.

Matt

> John.
> 
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/136770/
> > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 22 +++++++++++++++-------
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h | 12 ++++++++----
> > >   drivers/gpu/drm/xe/xe_module.c            |  3 +++
> > >   drivers/gpu/drm/xe/xe_module.h            |  1 +
> > >   4 files changed, 27 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index 08a0bb3ee7c0..b7c241bd95d5 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -17,8 +17,10 @@
> > >   #include "xe_gt.h"
> > >   #include "xe_gt_printk.h"
> > >   #include "xe_guc_ct.h"
> > > +#include "xe_guc_log.h"
> > >   #include "xe_guc_submit.h"
> > >   #include "xe_hw_engine.h"
> > > +#include "xe_module.h"
> > >   #include "xe_sched_job.h"
> > >   #include "xe_vm.h"
> > > @@ -74,7 +76,7 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
> > >   	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> > >   		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > >   	xe_vm_snapshot_capture_delayed(ss->vm);
> > > -	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> > > +	xe_guc_exec_queue_snapshot_capture_delayed(ss->guc.ge);
> > >   	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> > >   }
> > > @@ -116,9 +118,13 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >   	drm_printf(&p, "Process: %s\n", ss->process_name);
> > >   	xe_device_snapshot_print(xe, &p);
> > > +	if (xe_modparam.enable_guc_log_in_coredump) {
> > > +		drm_printf(&p, "\n**** GuC Log ****\n");
> > > +		xe_guc_log_snapshot_print(xe, coredump->snapshot.guc.log, &p, false);
> > > +	}
> > >   	drm_printf(&p, "\n**** GuC CT ****\n");
> > > -	xe_guc_ct_snapshot_print(xe, coredump->snapshot.ct, &p, false);
> > > -	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
> > > +	xe_guc_ct_snapshot_print(xe, coredump->snapshot.guc.ct, &p, false);
> > > +	xe_guc_exec_queue_snapshot_print(coredump->snapshot.guc.ge, &p);
> > >   	drm_printf(&p, "\n**** Job ****\n");
> > >   	xe_sched_job_snapshot_print(coredump->snapshot.job, &p);
> > > @@ -145,8 +151,9 @@ static void xe_devcoredump_free(void *data)
> > >   	cancel_work_sync(&coredump->snapshot.work);
> > > -	xe_guc_ct_snapshot_free(coredump->snapshot.ct);
> > > -	xe_guc_exec_queue_snapshot_free(coredump->snapshot.ge);
> > > +	xe_guc_log_snapshot_free(coredump->snapshot.guc.log);
> > > +	xe_guc_ct_snapshot_free(coredump->snapshot.guc.ct);
> > > +	xe_guc_exec_queue_snapshot_free(coredump->snapshot.guc.ge);
> > >   	xe_sched_job_snapshot_free(coredump->snapshot.job);
> > >   	for (i = 0; i < XE_NUM_HW_ENGINES; i++)
> > >   		if (coredump->snapshot.hwe[i])
> > > @@ -199,8 +206,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > >   	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> > >   		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> > > -	coredump->snapshot.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> > > -	coredump->snapshot.ge = xe_guc_exec_queue_snapshot_capture(q);
> > > +	coredump->snapshot.guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
> > > +	coredump->snapshot.guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> > > +	coredump->snapshot.guc.ge = xe_guc_exec_queue_snapshot_capture(q);
> > >   	coredump->snapshot.job = xe_sched_job_snapshot_capture(job);
> > >   	coredump->snapshot.vm = xe_vm_snapshot_capture(q->vm);
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > index 923cdf72a816..6ac8da1631f9 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -35,10 +35,14 @@ struct xe_devcoredump_snapshot {
> > >   	struct work_struct work;
> > >   	/* GuC snapshots */
> > > -	/** @ct: GuC CT snapshot */
> > > -	struct xe_guc_ct_snapshot *ct;
> > > -	/** @ge: Guc Engine snapshot */
> > > -	struct xe_guc_submit_exec_queue_snapshot *ge;
> > > +	struct {
> > > +		/** @ct: GuC CT snapshot */
> > > +		struct xe_guc_ct_snapshot *ct;
> > > +		/** @log: GuC log snapshot */
> > > +		struct xe_guc_log_snapshot *log;
> > > +		/** @ge: Guc Engine snapshot */
> > > +		struct xe_guc_submit_exec_queue_snapshot *ge;
> > > +	} guc;
> > >   	/** @hwe: HW Engine snapshot array */
> > >   	struct xe_hw_engine_snapshot *hwe[XE_NUM_HW_ENGINES];
> > > diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> > > index 7bb99e451fcc..dd837125f397 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.c
> > > +++ b/drivers/gpu/drm/xe/xe_module.c
> > > @@ -37,6 +37,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram bar size(in MiB)");
> > >   module_param_named(guc_log_level, xe_modparam.guc_log_level, int, 0600);
> > >   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
> > > +module_param_named_unsafe(enable_guc_log_in_coredump, xe_modparam.enable_guc_log_in_coredump, bool, 0600);
> > > +MODULE_PARM_DESC(enable_guc_log_in_coredump, "Include a capture of the GuC log in devcoredumps");
> > > +
> > >   module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_firmware_path, charp, 0400);
> > >   MODULE_PARM_DESC(guc_firmware_path,
> > >   		 "GuC firmware path to use instead of the default one");
> > > diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> > > index 61a0d28a28c8..81be7fb05bd1 100644
> > > --- a/drivers/gpu/drm/xe/xe_module.h
> > > +++ b/drivers/gpu/drm/xe/xe_module.h
> > > @@ -12,6 +12,7 @@
> > >   struct xe_modparam {
> > >   	bool force_execlist;
> > >   	bool enable_display;
> > > +	bool enable_guc_log_in_coredump;
> > >   	u32 force_vram_bar_size;
> > >   	int guc_log_level;
> > >   	char *guc_firmware_path;
> > > -- 
> > > 2.43.2
> > > 
> 
