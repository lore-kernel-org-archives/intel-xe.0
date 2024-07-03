Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A59C2BD09
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jul 2024 14:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6884010E7E6;
	Wed,  3 Jul 2024 14:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mNLYocZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CC210E7E6
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jul 2024 14:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720016127; x=1751552127;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IagMfwfNz8CAj2TA25Tc6258m8CSHlSamA0EeL6GH04=;
 b=mNLYocZv7/0keB5B/krKZx5jy5j3sva5Ag/20xXiBbA16yHjPGlHO713
 q+cCKF+z3TRK1THgsko6tuRwNxesD2ER5Fn+P0v2mWVoQv7+yEvZHznZl
 LeOltfkRBe6wTwff+BoEmSGzN8MDRzNWcQHIgNEN7/46OsKmVMNPGEf8a
 orx1EnEDfGP7P/Zi05TYHD3Kh2I8Fm3hUJSSEa8raDpO1I6ko2RiVWumZ
 23kA9nNoiCGiBFhs8dgrXnL/0fJJk/Rz/QUoAiqaAsBI43pNvyVL3+ST9
 vIHCymdyPplj7hUPzilKhmQO+FlTYB+soE3hMRcNUGTJzRMHDcjTdVhvJ g==;
X-CSE-ConnectionGUID: I5mVu6JdQ3aOpfGIrHaKoQ==
X-CSE-MsgGUID: 85O9DmDFQw6YO2y00vYzBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27854108"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="27854108"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 07:15:27 -0700
X-CSE-ConnectionGUID: jL5hHvW2T/mEVotQxK0sfQ==
X-CSE-MsgGUID: 5do3YrrfQKObkmIm6w+qLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; d="scan'208";a="46047596"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 07:15:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 07:15:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 07:15:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 07:15:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 07:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToDY8WdTaUoX6B7h+dif63IQgE5obgGllS1rQ1egL/nBeJOorVoVQ6hjDhD7x9FddUWJrMPqpTCXX4FnFX4VNen8MghPdoTIdqU4pEYPVLFyWU52OjIwz8RmdCJ5Yh8ijhO5JTeDGSCdVE7WZKEYX7FMI8a5ryct1LUX4k7VFsszFb27mOOrg/U42ZDVAvvj3RaXlrzxzKZCL0Mulbz+VcmEEs0G2HOKTIj36Wa7qDRK1Gbi9hYHU22W3ufnnibQlm7Qm2aJE8Ytns6bKgCrq6ekR9lSQrx7s5JxUZZ20Op4rXJDUQC9wKbMoMs/SJNRu14fbui9iBrHltpol/6uMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZDNCewjUjM6OI1RH8UCtiJktHex/lysgiFggsagLGM=;
 b=Lzpordpta63wjI1XG4uHl3XDOM5UM3tROqwhC3Gt78+TJJ/MOuN+iKbtFpz1Z1n16eDY+dSPhUV2E48FaByPZZI6mbNJt9LAkheLqn3mnW1zL338vBqkzM5eo/nrJGg+2uC2mb0fqZAA3skIgtfsE1gsMPShjqn20kMflQzEuTCjXq91Os2ltq62m78sBDIuZLf+Li0Sv1jhlatyZdkTgq/L0G7jVZQOr24Z6r0XuOPfMYADPtkvN1MnXFdgUYL7hG66DjA12nz7A27rBDWWwC3WZWCCNd1b0Dtj4BsCqjDF6f5ZjVFLKm4EykORvRaN8djQGQ1mGmcsxiLaBlWa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Wed, 3 Jul
 2024 14:15:20 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 14:15:20 +0000
Date: Wed, 3 Jul 2024 10:15:18 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [CI] drm/xe/guc: Remove spurious line feed in debug print
Message-ID: <ZoVc9gx7BASG3gT8@intel.com>
References: <20240626201206.1433-1-michal.wajdeczko@intel.com>
 <bf81ea948d144186d471b653ffd5dd9a45b03d09.camel@intel.com>
 <4ae7c9a4-b0f0-46cd-b53f-3c19e1936b5d@intel.com>
 <d06de2f9329d59b92b8156f43b4374fe62d0e6c8.camel@intel.com>
 <bea8fe47-f124-42ab-b6d3-ee380a257cd6@intel.com>
 <0a1de6fdf21f6cca1751792fd80cf1639b0c79d2.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0a1de6fdf21f6cca1751792fd80cf1639b0c79d2.camel@intel.com>
X-ClientProxiedBy: BY5PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::31) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7408:EE_
X-MS-Office365-Filtering-Correlation-Id: 69db2b10-1866-40ea-697d-08dc9b6a9252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7DAv76rQ3AeEv+DxAXbTuTuKGoC1Y30uk3u2MUZ6uq7SpSTakbutoYj2CaGg?=
 =?us-ascii?Q?ae4dgW/T/mFqpZytk7EKZkQzL2hs7tvXWBHPijhifA8qMWyuqdAmGjFRCa6h?=
 =?us-ascii?Q?2NoOJz8uCfEcHH2aWijILNSPzhC0zm/zMfQI/46c/jsg+tsSB2T5h14ISq5d?=
 =?us-ascii?Q?O4ePqXWbk7r9iEQHaB+LqqIeExalwhwT/g8HTyvFsqxcdHUDwa5BVWT95QLf?=
 =?us-ascii?Q?Tj7cEJrfdjKeoflFb6K+sG18aKgnfZtYtVFWV7J2Poo+5SlHFjFT1qy6767D?=
 =?us-ascii?Q?m+nRkZr2HXluqcP0KQwbWi60/opfQfeo9dKjUpG3gOL0C0R1kJbKFbXWPyAf?=
 =?us-ascii?Q?e+HbIa1zjaGyx6kEPfhFT42C9LKvialgiTC51RmEq9Z5bI4QAPSjl84xsj/w?=
 =?us-ascii?Q?DSHcY1bGRbEbOkSrzMzWHNuOlKur1+rYzTjlFxSfEqtXxKle1kFpYQUGf+iS?=
 =?us-ascii?Q?0ARwJnwHTpmEa6Oo9F0bIpYoNim+rjyH7Vnk8a6K0XYadO/xF+clSQtYJLnZ?=
 =?us-ascii?Q?NSzmTMMZALarXSOun29YFj/JSyOLvUL2Z8FebdS9e0TTdUkvMhOdPluylAga?=
 =?us-ascii?Q?JPJXFe26QT+5qq1tIZWFwf+grOY78zpHyeKnRPNgtQHvLfCzSIG1NWy4SoM4?=
 =?us-ascii?Q?sATFIUJNFaP4+YJWSLZH0eseOAqJykFXdmz/ibDcdynrPmk4QsEyZu1ZGFo2?=
 =?us-ascii?Q?4vcAwGjiKaJ6AVF7CVopLrYu7er/gqBmiAYBA0DRPTy7QFAHBWJO0OBgzSKv?=
 =?us-ascii?Q?aKmcTBFxZ25h15uxHrq3/Vgvn8eJs3I2P1VjJsZFFw8h6GPD++Rxf5uKS4FF?=
 =?us-ascii?Q?NdZ4TGdHcn6zPflWL5H5JscesJtOgxyrOdrkfvqUYKtpzOLH7KPiKNe3rpwW?=
 =?us-ascii?Q?M742bhACaxW4y4TwfuJJoRuAb/XpkeUzX9+73ouxWcU4y5gZzfmlsoVyjJSn?=
 =?us-ascii?Q?6pzPkx283kIFw9lBt7jmLuYUHDp6NQPmhiEu+AXa8aGKOb+ivyBUWQoYOzSz?=
 =?us-ascii?Q?Ejvfa5seAPnNbSYUBNGDZq60i+3MR45vlqiA15Y7aXhZtmb5iF8YekDAwsLd?=
 =?us-ascii?Q?38qUs2HUQHpkxTSdRhiybf//ABxTqljMuOUPUkwQI82oh/y2Xi0fp5Nbz2GA?=
 =?us-ascii?Q?XWtpbFeuwDs8kJcvgint+PNmrl0fsMqMwEQHBw+waagHbGqyzSMx0hFFRNFT?=
 =?us-ascii?Q?ofqAgv2f4d+bMko3PxxBxk7X4CHXpBpB4FCw8BM8D3IpIbJxermt71QedD2u?=
 =?us-ascii?Q?AmXvUDIGDZr+rxa1ZdWuEPK1mDJRfuJL0HrvU1eMy4LPndfnNLiPKKmK2S/N?=
 =?us-ascii?Q?eLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a/CAV5UIj3vdBRuEKbNVg4FjfSMt/gtL/rRzP+rA3ZUg2pXrFvr5LuvnCh81?=
 =?us-ascii?Q?f0RVRyxqqb+8Pg7lsS5ysYH3cpGZOfJ1MLfncZT5JoMtd0l4/hCHd5Tv21FO?=
 =?us-ascii?Q?c0pm3nB9fRKNbLcxFrFryCI+7tJW8LWl00owKOfO6g3KPMRJF8LbE6lRsGgn?=
 =?us-ascii?Q?KWskLAzaPbA2KYYfDfx6Y3RNu3SMp0YQTv/P94sW8kqeHn0ux7pxACCaiAPy?=
 =?us-ascii?Q?90L+PVZ8e77mFyDv3O39JP8zAfKw6iPa6wmLPD1RzdsYmalH/lEuiKmi3suE?=
 =?us-ascii?Q?gFHEFT0mKl5hPPe+br0ix0JJTw5XyrNkdD2Jw76cu36Rs8gZJMG1DwdFmWUi?=
 =?us-ascii?Q?FqnxCJv6cSzz9yxOyIPFKaM2qMtmhXZmgILwuB7g/Pfl5Lk+uKrXAo3589UT?=
 =?us-ascii?Q?sUv0mYwYgITYfS9i/TCCff0CE7t4I7zOXCLNMiaCxOgmzSvfxisLZ443pMW+?=
 =?us-ascii?Q?g2cyNp5KqflDvM/lLj9DShFjNs1ixI0iJFvIYWhMGAhpcr6J0P3ahjGRTXTO?=
 =?us-ascii?Q?zFVgNPo74HqscVG7HINl6tPTTqgvG6VEgnt53cxQZYWLwztnz663FtxSiZ4R?=
 =?us-ascii?Q?xezuJPWuL2eaNcighnj8PGL8ghJAmDE9+tTaecNCclPIoQU11vzPIIiqlXLx?=
 =?us-ascii?Q?FDoyi9fRz0/kXITI6pNq7VwVv3YMcwjIgMg8bVxgfzqCu66HzqP27Bg53WKc?=
 =?us-ascii?Q?X5jgtWCDwSaO46WXBijEdoM/LR7BioeWGD7FY8bohSy2bRODyburcFng+1PD?=
 =?us-ascii?Q?gmDpxuwj4rBdhF/4c+gFgIcllH310Fm2Zh8LjN3uqW87apFYgAx8EmVu4Yxu?=
 =?us-ascii?Q?9exn+25VFvixd82//mSiNbmFaAAqSmw2UgUK2qN3eYXflgaimRzrUvfHriVG?=
 =?us-ascii?Q?lcjslUqroQGPM4f08yA85Cbr9hkq8BICX6CFm0Lpsoq3PMZK84NiDeevWK8O?=
 =?us-ascii?Q?kV0/nnsHt5Va6DovwHCxo7KRt2snPvICGazyBthsTBb0rcgGaYSuGfopvzZG?=
 =?us-ascii?Q?j0QGqxzsodRgyiDWSKcCCgfXxFa/XlRb2eGI3J29mji1doNJUy7ZFjE35kW9?=
 =?us-ascii?Q?6jGHe3v/il+YHI7m78y0/RSu83ari6xQuQENxABWS1Ju1iU3+NumE2czLHy5?=
 =?us-ascii?Q?drxoOlTh8ce7WwYFN7sD+Yjeir7CXbMLAgI/H+qUGSE1Xo6tywXEb7Mm3iKb?=
 =?us-ascii?Q?WPRaXMC16PJk9ES1SVNw4EkcL9x/wh8vZN4bUQXgn1W+M7P1LMXG0keNTm6t?=
 =?us-ascii?Q?ah4qQpIzxzzdjHvcbFvLf0bjJSBNynv1TJ/7MWk3/wffNp8l60X2JRYsPVOR?=
 =?us-ascii?Q?1FDc2aNxnPtsL7Mv+eyO5SaScMLAd05vkeWPmWEgTStBu2wmd+dOmQvDShZ1?=
 =?us-ascii?Q?oNxw6y95cZx/dSnlun88BYsbKcQ3mNTC8zQaz7fn3Hn9Ba/gDxbYsWynXIfW?=
 =?us-ascii?Q?Ik0ahBmAAST0ZvRILvHzIZjljEF8sQ5V53Yo4ZnWtdonXQyJJTnQo4Ak7mn6?=
 =?us-ascii?Q?tzPqrPUw7i/jyEYcdKv6L4iQVXXm+tVnCnsb0zHPu2umgGNi+IBAIkhCCYPo?=
 =?us-ascii?Q?kC/pG5090zKUdgj1PaFA4oL2ERNlqFgC7lkk0WMF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 69db2b10-1866-40ea-697d-08dc9b6a9252
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 14:15:20.6118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Eg3TH786M6pxGsjFBXxNmB8xVgYcO/9wbIcANVIjaMa7IpiL6lxObx0Tth0ulq1TJ6CKLzXgXkzQt2z+yIdjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7408
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

On Thu, Jun 27, 2024 at 03:27:56PM +0000, Souza, Jose wrote:
> On Thu, 2024-06-27 at 16:42 +0200, Michal Wajdeczko wrote:
> > 
> > On 27.06.2024 15:53, Souza, Jose wrote:
> > > On Wed, 2024-06-26 at 23:18 +0200, Michal Wajdeczko wrote:
> > > > 
> > > > On 26.06.2024 22:35, Souza, Jose wrote:
> > > > > On Wed, 2024-06-26 at 22:12 +0200, Michal Wajdeczko wrote:
> > > > > > From: John Harrison <John.C.Harrison@Intel.com>
> > > > > > 
> > > > > > Including line feeds at the start of a debug print messes up the
> > > > > > output when sent to dmesg. The break actually appears between all the
> > > > > > usefu prefix information and the actual string being printed. In this
> > > > > > case, each block of data has a very clear start line and an extra
> > > > > > delimeter is really not necessary. So don't do it.
> > > > > 
> > > > > I guess the indention was to have one blank like between guc_ctb_snapshot_print() 'cmd[X]' lines and 'G2H CTB (all sizes in DW):'.
> > > > > I agree with the change if you add one line breaker in the end of guc_ctb_snapshot_print().
> > > > 
> > > > but 'cmd[XXX]' lines already have additional indent compared to 'H2G|G2H
> > > > CTB' headers so IMO this extra separation line seems unnecessary:
> > > > 
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: TLB invalidation time'd out,
> > > > seqno=27, recv=26
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: H2G CTB (all sizes in DW):
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 1024
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 572
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 451
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 568
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 572
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[568]: 0x80670003
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[569]: 0x20007000
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[570]: 0x0000001b
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      cmd[571]: 0x80000003
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0: G2H CTB (all sizes in DW):
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      size: 4096
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      resv_space: 1024
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head: 210
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail: 0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      space: 3068
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      broken: 0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      head (memory): 210
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      tail (memory): 210
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      status (memory): 0x0
> > > > [ ] xe 0000:4d:00.1: [drm] *ERROR* GT0:      g2h outstanding: 1
> > > > 
> > > > and IMO printing empty lines is just a waste of paper ;)
> > > 
> > > This same function is called during gpu hang capture(devcoredump) and the output of that file has new lines between sections for better reading.
> > > This a old sample that I had around:
> > > 
> > > 
> > > 
> > > **** Xe Device Coredump ****
> > > kernel: 6.9.0-rc6-zeh-xe+
> > > module: xe
> > > Snapshot time: 1715877420.647211377
> > > Uptime: 70684.605982665
> > > PCI ID: 0x9a49
> > > PCI revision: 0x01
> > > GT id: 0
> > > 	Type: main
> > > 	IP ver: 0.0.0
> > > 	CS reference clock: 19200000
> > > 
> > > **** GuC CT ****
> > > H2G CTB (all sizes in DW):
> > > 	size: 1024
> > > 	resv_space: 0
> > > 	head: 978
> > > 	tail: 599
> > > 	space: 378
> > > 	broken: 0
> > > 	head (memory): 599
> > > 	tail (memory): 599
> > > 	status (memory): 0x0
> > > 
> > 
> > but G2H is still part of the CT, no need for extra split
> > 
> > > G2H CTB (all sizes in DW):
> > > 	size: 4096
> > > 	resv_space: 1024
> > > 	head: 626
> > > 	tail: 0
> > > 	space: 3071
> > > 	broken: 0
> > > 	head (memory): 626
> > > 	tail (memory): 626
> > > 	status (memory): 0x0
> > > 	g2h outstanding: 0
> > > 
> > > GuC ID: 9
> > 
> > hmm, so it looks that we need to fix two more places:
> > 
> > 1) in xe_guc_exec_queue_snapshot_print() we need to drop spurious \n as
> > well:
> > 
> > - 	drm_printf(p, "\nGuC ID: %d\n", snapshot->guc.id);
> > + 	drm_printf(p, "GuC ID: %d\n", snapshot->guc.id);
> > 
> > 
> > 2) in xe_devcoredump_read() we need to add proper decorations/separation
> > lines since xe_guc_exec_queue_snapshot_print() is not part of "GuC CT"
> > 
> > - 	drm_printf(&p, "\n**** GuC CT ****\n");
> > + 	drm_printf(&p, "\n**** GuC CT ****\n\n");
> > 	xe_guc_ct_snapshot_print(coredump->snapshot.ct, &p);
> > +	drm_printf(&p, "\n**** GuC submission ****\n\n");
> > 	xe_guc_exec_queue_snapshot_print(coredump->snapshot.ge, &p);
> > 
> > and maybe also
> > 
> > - 	drm_printf(&p, "**** Xe Device Coredump ****\n");
> > + 	drm_printf(&p, "\n**** Xe Device Coredump ****\n\n");
> > 
> > > 	Name: rcs9
> > > 	Class: 0
> > > 	Logical mask: 0x1
> > > 	Width: 1
> > > 	Ref: 4
> > > 	Timeout: 0 (ms)
> > > 	Timeslice: 1000 (us)
> > > 	Preempt timeout: 640000 (us)
> > > 	HW Context Desc: 0x01480000
> > > 	LRC Head: (memory) 280
> > > 	LRC Tail: (internal) 552, (memory) 552
> > > 	Start seqno: (memory) -125
> > > 	Seqno: (memory) -126
> > > 	[HWSP].length: 0x1000
> > > 
> > > ....
> > 
> > then the output will look like:
> > 
> > **** Xe Device Coredump ****
> > 
> > kernel: 6.9.0-rc6-zeh-xe+
> > module: xe
> > Snapshot time: 1715877420.647211377
> > Uptime: 70684.605982665
> > PCI ID: 0x9a49
> > PCI revision: 0x01
> > GT id: 0
> > 	Type: main
> > 	IP ver: 0.0.0
> > 	CS reference clock: 19200000
> > 
> > **** GuC CT ****
> > 
> > H2G CTB (all sizes in DW):
> > 	size: 1024
> > 	resv_space: 0
> > 	head: 978
> > 	tail: 599
> > 	space: 378
> > 	broken: 0
> > 	head (memory): 599
> > 	tail (memory): 599
> > 	status (memory): 0x0
> > G2H CTB (all sizes in DW):
> > 	size: 4096
> > 	resv_space: 1024
> > 	head: 626
> > 	tail: 0
> > 	space: 3071
> > 	broken: 0
> > 	head (memory): 626
> > 	tail (memory): 626
> > 	status (memory): 0x0
> > 	g2h outstanding: 0
> > 
> > **** GuC submission ****
> > 
> > GuC ID: 9
> > 	Name: rcs9
> > 	Class: 0
> > 	...
> > 
> > would that work for you?
> 
> In my opinion this looks worst.
> Lets see what Rodrigo that implemented most of it thinks.

Well, I do believe that keeping empty lines in text helps
our human brains to parse the text. For the same reason that
I kept the empty line between this paragraph and the text I was
responding to. But also for the same reason that our entire
code has many empty lines between blocks.

Even for similar blocks in the same function we add some empty
lines. It makes things easier to read.

Mainly this reason was the main reason that drove me to add
these empty lines there. But that is just my personal preference,
and I don't have stronger feelings here. I would be totally
okay with the removal of these empty lines.

Also, I have to agree that empty lines in dmesg are really ugly.

My biggest stronger feeling here would be on breaking current
tools that are already parsing devcoredump. If this breaks the current
tools I would prefer to avoid that breakage and keep things as is, or
changing for dmesg, bug tweaking the devcoredump as Jose suggested.

Jose, would this break Mesa tools?

> 
> > 
> > > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > > > > Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > ---
> > > > > > cherry-picked from [1]
> > > > > > 
> > > > > > [1] https://patchwork.freedesktop.org/patch/598024/?series=134695&rev=2
> > > > > > ---
> > > > > >  drivers/gpu/drm/xe/xe_guc_ct.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > index 873d1bcbedd7..113e6348c6ac 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > > > > > @@ -1489,7 +1489,7 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> > > > > >  		drm_puts(p, "H2G CTB (all sizes in DW):\n");
> > > > > >  		guc_ctb_snapshot_print(&snapshot->h2g, p);
> > > > > >  
> > > > > > -		drm_puts(p, "\nG2H CTB (all sizes in DW):\n");
> > > > > > +		drm_puts(p, "G2H CTB (all sizes in DW):\n");
> > > > > >  		guc_ctb_snapshot_print(&snapshot->g2h, p);
> > > > > >  
> > > > > >  		drm_printf(p, "\tg2h outstanding: %d\n",
> > > > > 
> > > 
> 
