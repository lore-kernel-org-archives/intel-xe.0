Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF94D2A520
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 15:03:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEA110E0A6;
	Wed, 16 Oct 2024 15:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XQtA4VUx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA610E0A6
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729091006; x=1760627006;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1EB6P9kd07bOSBy2MkJ6bTqUzQ85pQfOGF64h7Erf8g=;
 b=XQtA4VUxqTTiBwxo81NjIwCF+77BGm7XZp/AwCoGnw6rPVSSB/IlRKY4
 ve1zxrpD8h1PEbqyWrT8PSm+I/+ZmI4xcKxqTYlBnphtVxBedrxqmUi0H
 ihZQY5HOauvEZxtOc4LQ3p5dMVf7Hs/VzvFw6RYuclkoMltPrOwqyhhBY
 wbDtmu9w5PzylLlJW0DoJw7wBjOWiNIKBiYCrZ80klX04knd60V/J4j+d
 MhNpah5xNeoqxb70HgmhESJ79IXWJFyGXL8bUb55FIaz+kMElP1sb9n05
 A3H3I1X0bCG9uodW8nSPLACe4uOMiuFv2wScRs9OcgJ9cKhOKSvlARRJw A==;
X-CSE-ConnectionGUID: a1fOfhDZSquij132unCoIw==
X-CSE-MsgGUID: XSHQ6XrMQcGizWhKwo48OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32344714"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="32344714"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 08:03:26 -0700
X-CSE-ConnectionGUID: R5sXAbI5T16qj2v97TpG+A==
X-CSE-MsgGUID: PU9B50TKRta+C+ehxUTGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="79082156"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 08:03:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 08:03:25 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 08:03:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 08:03:25 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 08:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GF5sSqb99XrUPRxQfiaiE4+jOQ4D2r27RXNrd9ozQaemldr304pak0480EOgk5ChI37LlniUhy7Yy1GZ7Aepx56crGeDBgsr4xy4G4rKulF5N3uNUtSyZJ3E5tdLfZ8EJl3FB7H4Y5AmB/2xzyxIRB5KSBjIpFWP/U4LIAFm4YqLOR1z1aDiBLKZa6gG7c0BY+6zwmVWyPWDMSYdZJtKUOJuW0/D4gICHSk5M7t7i6Q1Lkg1vzk1pGUYPycQOuN4rdLe7XOUBi9tW1lSDIjY3sfsnzt53vSoHHWEyEkvBswJgpVAVnJlsHWCRo/GYgTZwQmxSYSMG0fgrKU3l6e7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvgIwC4ZWRonLP3D2Y18C0wWPFgDbL4oej4vRQvZxbU=;
 b=rit5VzlDAHJ8PsBFa2whJxF1JU9Nm+X4PtqYqPFy1YtOQnCxoxL/lKaw4DWc44nz8fQ0HSD9dFow+cGKNZgHqzDFX2gIhRpcE6LSlkkTmtvIId0S6sKj2yFPjrZg0abOTWGtwrrQPLSPqPRJbmoDFVYJCUu5Buo9MxY+a3YjTXSZ6g57KH+t15hZ18pQDgL6mHVBWHjyPe5pH9wAqZz5nz0V3R7sc7Io3KsZvh+ps93itOE/45b0O43u19ilOJGpyq1QdVrVBTezz75u+jhZGpPwu+C+OhL8N8sc365owZ/5U4ToTW/sV4B5lQi6SwL9iNcRWGeDAVeY8hOYKSXihg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 15:03:16 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 15:03:16 +0000
Date: Wed, 16 Oct 2024 08:03:13 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
Message-ID: <20241016150313.GW4891@mdroper-desk1.amr.corp.intel.com>
References: <20241015161938.845996-1-shekhar.chauhan@intel.com>
 <172904260349.1271178.7457279807914441163@2413ebb6fbb6>
 <b177a27e-898a-46df-ab26-5da875a09b09@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b177a27e-898a-46df-ab26-5da875a09b09@intel.com>
X-ClientProxiedBy: BYAPR06CA0033.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY5PR11MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 6552ea8b-8e04-45b3-fac0-08dcedf3a9a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WIOdpfY0CG7aVzFnGbQuzMqMwVu9YjBSSur+Ah5v+L5uOAHPamUuZyltEAl+?=
 =?us-ascii?Q?3etITB+khb2fF244bNGefjG9uxvCCgprbVGYpfbSVjKDH2zGRh9oKFul2tZl?=
 =?us-ascii?Q?LUeRGzNfeLpXF6ZbvOhrKnjMxhoZgT0wYHmzp4JA7O7FsaYsjryei5dB8G7y?=
 =?us-ascii?Q?sg9vTpCbuduNbxFP52ynm6T2b73xAX298VFe6dj5lywo9AaGbBvmiq6ZSptT?=
 =?us-ascii?Q?9duqcWQC960lx/+nnmmSxK42fi89mMQVtQKQhwyvX8in/lHd58EQjw+9B8Mu?=
 =?us-ascii?Q?r1NEKeRZeLFIkJBcaKlJ8N8khNOxxHi+GvRIgcEp2LB3AnwKtCJaX+WHoD0P?=
 =?us-ascii?Q?7WNmG5Is/Sk4/b+CMNTqR7k+mOG4xsUz9Z9uynIqE6cec1N1vT0EH53JLMRC?=
 =?us-ascii?Q?Ih9x/luU+zmipYbXo07wtIswDmrG297CDE/E8Az2pq3CaWNFFySHp9ly3Arx?=
 =?us-ascii?Q?o49xlHrPx17S9+8kMzoZIt9x2vrJ1mVzODQsqO25TcQdgoCtqSTrTH7lx4Id?=
 =?us-ascii?Q?QenY8Gw53cjMkRRYtHI+3ROUMy4dz70xN778bp/rqW269n3H2kqA7ktl1dOJ?=
 =?us-ascii?Q?bgzzo1rsu/fRsO6fIlpm8ow1J8qjfKYZjh0oYEvPEtWI8DuEoxY2zVBdl/7a?=
 =?us-ascii?Q?PLxwbIZepIFm2jC1tvsQZ5C712spaAyVGRN9kIpymnT1UQrFu2C51siWhZXl?=
 =?us-ascii?Q?5S/0Au2Ukbt2sV1wA29JHT2fwuLW+Bk3WwQGHMFAXtgHuyi55QwDKoGl7uDQ?=
 =?us-ascii?Q?NaGS7kMDrwwdTp84727M6GDMIIlDLyk6G/6QYfaNYqr14eZqSzIUPaVxg/rY?=
 =?us-ascii?Q?/7IJJOvkpVHyHyNZRFBfUTuW3T+SR8qiVVHH1VqeGYO1Vxz2l2vHpuF3+09a?=
 =?us-ascii?Q?HDyaw1XFw/a8t8OGJ7yFlvgjUR1XYgUQbHFd9wllieFQ5WEfATOBMshLPyaF?=
 =?us-ascii?Q?wj5Jov84v6Tv5Bs78LkiHRdBlR33ArTu8Pkb0zBcAMOBWfLnlaVyVdbAvxo+?=
 =?us-ascii?Q?lbqNTmQyRvFJqYW0tqXGCkqSAttsqxMAcwvb4QIGI36Mg6RZ3WYxOxoZINys?=
 =?us-ascii?Q?PKGynEzgzwXclL4MoG6RgvXDSAjTumgptfcg2jfQ9KFFKEx9pKdajSTl0K3g?=
 =?us-ascii?Q?HVXhWmnv0HRi4yio/wBwqpkQdk9P7DVQqK/oQmqWrFPYsm+JDfRuoS5bb5mL?=
 =?us-ascii?Q?sqkVtz3lYsDlDZQQm5yWkQre03ZTgD4Y8rywZKdlQVdL5VAZjD8YM5c4SlQ?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dy92LcHpwsT7lbzz+5vJz86QjK3QoCbwC6jl6vQekzWGsNJG33esNRlFGG8U?=
 =?us-ascii?Q?tvWaA1Mh1+ULutHSDKPkpH/mgVu27jjYyJ7gYTKFdUPud1Nnv3OgxTAjNS6F?=
 =?us-ascii?Q?2iGU6vq28h6VaVHVfsq1zL0H3QBzfZN9mqJRbsF4NbY8w/I6dXb9+DPWTvMg?=
 =?us-ascii?Q?DwYcAwArAg6qPkz3EapXxNQkNTJ343Mcur9sF8BvoTKZCKnT8R+uOHuGXD69?=
 =?us-ascii?Q?bG4A9F5d+R7SSbg8IStPMV8EJf+Ppa5Y29ipbT6VzF1QdnHc6PXwhcqbte6X?=
 =?us-ascii?Q?NfgnfQljaBW4zvQBAsU3K+YJ22Wmrcyw4m26JQMsDZJNBwdL5PNcVlEaIqEd?=
 =?us-ascii?Q?z067zh0rRhWQySzK1jrya4CW7cWaJuLA6Ru5nyHGofTfFXiRZEhCp/O6Ijo0?=
 =?us-ascii?Q?6maWVS3AItarYCLo/EVF100/OwQ1mMzKqMT0xl/nIMnCKLO69lxeWdqL1X5J?=
 =?us-ascii?Q?vhysrQMbQT94BeIsz5SWqELv5a/ZYfX3lCH+Cu7G4sYuY58qhKIFmZPpW9yR?=
 =?us-ascii?Q?b75agZ7yNqFKoDkz2ImolfzLVNVcmUMy0nnlK0AFp03UfCDY3risgbjtkkZr?=
 =?us-ascii?Q?avs8NjPICM8MuP606b6RLL57mYU4GK/L3OtPECuMj35yv/jyHlF0OEGKTCSU?=
 =?us-ascii?Q?hgPjvJgR5pUWz6pgYOtiies4J2t/gsmMmAvy4MF3NwQR/m/zwCwnMLP2Z0Tk?=
 =?us-ascii?Q?lpn87m65MefE+vN5jeY8fD9LbFo8B5+pwhFhpMKiJCVPycOnf8IAcdkgiA80?=
 =?us-ascii?Q?qTMuPxRDWQlRzqoLd/gFnqZncLgwKtXRQwaheZb2fcKA0winkcIetxWoXWA8?=
 =?us-ascii?Q?BajDYcfqF98+pvAenPyw1Ap77zXd7iccOP5H6Sen+B7/plgr8MTqmTM85xe2?=
 =?us-ascii?Q?v5Y9R5IfHHTYhRQTzjY6lN0fbBkBCWzbkzkFFQNC3mNB0U9vMDfMP5HwVw12?=
 =?us-ascii?Q?AUq4lCdmamjxro8l2VCSqZO+qSVLbjP2yAVAtai5dGMTixlO7viY2gnCE6FY?=
 =?us-ascii?Q?TS1a+FTIqCdxgRDB+MNNWf18cOA4xp/hPtPrYkRV0pdbQ46pacdWiSRZXK9V?=
 =?us-ascii?Q?axho1fgN5JW3EfaAGiryztSTcDzqP2kgbhtvdsEZweMewMkVVGt0yu/MlMgM?=
 =?us-ascii?Q?yDhI+MU0OrSAQ84onKkuJ3Fo9pOOUP25usJM4QqU796u0Q7pTu7+si0Xl94t?=
 =?us-ascii?Q?EUkebJJF7m9iVgn1SHLJZBvQgCXQVa09qlhg8NzW1CHefHiB2Eiv7mpC3lE7?=
 =?us-ascii?Q?WLdyqYzw2k3tT9+gHCvfi4VhNc7X+qrIILXBltELDUcrEX694+icEJ/mppWg?=
 =?us-ascii?Q?1j827l0d32uTGhNfoFQcv/J4Oij4VGVFLy3BwzQ1CE6z86iZx2Ib3tZ9cC99?=
 =?us-ascii?Q?gSBsxg1wk+zXueDSL8mx1F2bAE/hZZX54318zU/uiA1ESBsvqw7UcBiJBaI9?=
 =?us-ascii?Q?gPlZmVausjoeMlLkm8MSPRL0XNw6EuM+eNIOg0Knk9AJTn8vAcN/drkuwIdY?=
 =?us-ascii?Q?epWB9GuqG6y9TMN8CUNWRW44Oi0rCPeMP9gbI6z6fvkAzPkSsPhBqmYE7tL+?=
 =?us-ascii?Q?rLc3anCXufE/irn5paBNhWwgSPcD5+VFxSBuuI9P1RDlW3Zw9qdYvfYw01Ea?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6552ea8b-8e04-45b3-fac0-08dcedf3a9a8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 15:03:16.1447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pjTUf+sECXUrIZbtcDSxp7YsXb7TUPyAzxw3fRWctQZ/dTi9LPghjaw1agoTIPKa/SbNpveuI1Fr0BkkxWUZRdtY3q/yiSCIEYiH+Kcj7jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

On Wed, Oct 16, 2024 at 08:51:06AM +0530, Chauhan, Shekhar wrote:
> Failures look unrelated to the patch.

Applied to drm-xe-next.  Thanks for the patch and review.


Matt

> 
> On 10/16/2024 7:06, Patchwork wrote:
> > Project List - Patchwork *Patch Details*
> > *Series:* 	drm/xe/xe3lpg: Extend Wa_18034896535 to Xe3_LPG.
> > *URL:* 	https://patchwork.freedesktop.org/series/140010/
> > *State:* 	failure
> > *Details:*
> > https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/index.html
> > 
> > 
> >   CI Bug Log - changes from
> >   xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823_full ->
> >   xe-pw-140010v1_full
> > 
> > 
> >     Summary
> > 
> > *FAILURE*
> > 
> > Serious unknown changes coming with xe-pw-140010v1_full absolutely need
> > to be
> > verified manually.
> > 
> > If you think the reported changes have nothing to do with the changes
> > introduced in xe-pw-140010v1_full, please notify your bug team
> > (I915-ci-infra@lists.freedesktop.org) to allow them
> > to document this new failure mode, which will reduce false positives in
> > CI.
> > 
> > 
> >     Participating hosts (4 -> 4)
> > 
> > No changes in participating hosts
> > 
> > 
> >     Possible new issues
> > 
> > Here are the unknown changes that may have been introduced in
> > xe-pw-140010v1_full:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Possible regressions
> > 
> >  *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
> >  *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html>
> >         +1 other test fail
> >  *
> > 
> >     igt@kms_flip@plain-flip-ts-check:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-9/igt@kms_flip@plain-flip-ts-check.html>
> >         +2 other tests fail
> >  *
> > 
> >     igt@xe_pm@s3-mocs:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@xe_pm@s3-mocs.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-432/igt@xe_pm@s3-mocs.html>
> > 
> > 
> >         Warnings
> > 
> >   * igt@kms_async_flips@async-flip-with-page-flip-events:
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html>
> > 
> > 
> >     Known issues
> > 
> > Here are the changes found in xe-pw-140010v1_full that come from known
> > issues:
> > 
> > 
> >       IGT changes
> > 
> > 
> >         Issues hit
> > 
> >  *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
> >         -> DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
> >         Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
> >  *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-y.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
> >         other test dmesg-warn
> >  *
> > 
> >     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
> >         (Intel XE#1701
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701>) +1
> >         other test fail
> >  *
> > 
> >     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-463/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html>
> >         (Intel XE#1426
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426>) +1
> >         other test fail
> >  *
> > 
> >     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
> >         (Intel XE#1407
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_big_fb@linear-64bpp-rotate-180:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-180.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-180.html>
> >         (Intel XE#877
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>)
> >  *
> > 
> >     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
> >         (Intel XE#316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>)
> >  *
> > 
> >     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html>
> >         (Intel XE#316
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
> >         (Intel XE#1477
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
> >  *
> > 
> >     igt@kms_big_fb@y-tiled-addfb-size-overflow:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
> >         (Intel XE#1428
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html>
> >         (Intel XE#1124
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> > 
> >       o shard-adlp: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
> >         (Intel XE#1874
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) +2
> >         other tests fail
> >  *
> > 
> >     igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html>
> >         (Intel XE#1124
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
> >         (Intel XE#607
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
> >  *
> > 
> >     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html>
> >         (Intel XE#1124
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html>
> >         (Intel XE#367
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >  *
> > 
> >     igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html>
> >         (Intel XE#2191
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
> >  *
> > 
> >     igt@kms_bw@linear-tiling-2-displays-3840x2160p:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html>
> >         (Intel XE#367
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_bw@linear-tiling-4-displays-3840x2160p:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html>
> >         (Intel XE#367
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
> >  *
> > 
> >     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-d-hdmi-a-1.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
> >         Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html>
> >         (Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +5
> >         other tests skip
> >  *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
> >         (Intel XE#616
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +8
> >         other tests fail
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
> >         (Intel XE#2669
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
> >         -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html>
> >         -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) +2
> >         other tests incomplete
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
> >         Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +11
> >         other tests skip
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs@pipe-b-hdmi-a-6.html>
> >         (Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +41
> >         other tests skip
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html>
> >         (Intel XE#2887
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5
> >         other tests skip
> >  *
> > 
> >     igt@kms_cdclk@mode-transition-all-outputs:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html>
> >         (Intel XE#314
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>)
> >  *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html>
> >         (Intel XE#314
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html>
> >         (Intel XE#314
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/314> /
> >         Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_chamelium_color@ctm-0-50:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-50.html>
> >         (Intel XE#306
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_chamelium_color@ctm-green-to-red:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_chamelium_color@ctm-green-to-red.html>
> >         (Intel XE#306
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
> >  *
> > 
> >     igt@kms_chamelium_frames@dp-crc-fast:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-fast.html>
> >         (Intel XE#373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_chamelium_frames@hdmi-aspect-ratio:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
> >         (Intel XE#373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_chamelium_hpd@dp-hpd-fast:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-fast.html>
> >         (Intel XE#373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +6
> >         other tests skip
> >  *
> > 
> >     igt@kms_content_protection@content-type-change:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_content_protection@content-type-change.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +6
> >         other tests skip
> >  *
> > 
> >     igt@kms_cursor_crc@cursor-random-512x170:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html>
> >         (Intel XE#2321
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
> >  *
> > 
> >     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
> >         (Intel XE#1424
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_cursor_crc@cursor-rapid-movement-512x170:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html>
> >         (Intel XE#308
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>)
> >  *
> > 
> >     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
> >         (Intel XE#309
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
> >         (Intel XE#323
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
> >  *
> > 
> >     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html>
> >         (Intel XE#309
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
> >         (Intel XE#1508
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508> /
> >         Intel XE#599
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >  *
> > 
> >     igt@kms_display_modes@extended-mode-basic:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_display_modes@extended-mode-basic.html>
> >         (Intel XE#599
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >  *
> > 
> >     igt@kms_fbcon_fbt@psr-suspend:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html>
> >         (Intel XE#776
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>)
> >  *
> > 
> >     igt@kms_feature_discovery@display-3x:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_feature_discovery@display-3x.html>
> >         (Intel XE#703
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/703>)
> >  *
> > 
> >     igt@kms_feature_discovery@dp-mst:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html>
> >         (Intel XE#1137
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137>)
> >  *
> > 
> >     igt@kms_flip@2x-dpms-vs-vblank-race:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@kms_flip@2x-dpms-vs-vblank-race.html>
> >         (Intel XE#1421
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +4
> >         other tests skip
> >  *
> > 
> >     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html>
> >         (Intel XE#301
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>)
> >  *
> > 
> >     igt@kms_flip@2x-plain-flip-ts-check-interruptible:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html>
> >         (Intel XE#310
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/310>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html>
> >         (Intel XE#886
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +1
> >         other test fail
> >  *
> > 
> >     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html>
> >         (Intel XE#886
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) +5
> >         other tests fail
> >  *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html>
> >         (Intel XE#1401
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
> >         (Intel XE#1397
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
> >  *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
> >         (Intel XE#1401
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
> >         Intel XE#1745
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +9
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html>
> >         (Intel XE#651
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
> >         (Intel XE#656
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +9
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-suspend:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-suspend.html>
> >         (Intel XE#651
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +12
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-render.html>
> >         (Intel XE#656
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +18
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-tiling-y:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
> >         (Intel XE#1469
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469>)
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html>
> >         (Intel XE#651
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +7
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html>
> >         (Intel XE#653
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +6
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-render.html>
> >         (Intel XE#653
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +15
> >         other tests skip
> >  *
> > 
> >     igt@kms_hdmi_inject@inject-4k:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.html>
> >         (Intel XE#1470
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470>)
> >  *
> > 
> >     igt@kms_invalid_mode@clock-too-high:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high.html>
> >         (Intel XE#1450
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> /
> >         Intel XE#2568
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568> /
> >         Intel XE#599
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >  *
> > 
> >     igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html>
> >         (Intel XE#1450
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html>
> >         (Intel XE#1450
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450> /
> >         Intel XE#599
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >  *
> > 
> >     igt@kms_joiner@basic-ultra-joiner:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_joiner@basic-ultra-joiner.html>
> >         (Intel XE#2927
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
> >  *
> > 
> >     igt@kms_plane@pixel-format-source-clamping:
> > 
> >       o shard-adlp: NOTRUN -> INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping.html>
> >         (Intel XE#1035
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035> /
> >         Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>)
> >  *
> > 
> >     igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
> > 
> >       o shard-adlp: NOTRUN -> WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html>
> >         (Intel XE#2078
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078>) +1
> >         other test warn
> >  *
> > 
> >     igt@kms_plane@plane-position-covered@pipe-b-plane-4:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
> >  *
> > 
> >     igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html>
> >         (Intel XE#361
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>)
> >  *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
> >         (Intel XE#2763
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html>
> >         (Intel XE#2763
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763> /
> >         Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html>
> >         (Intel XE#2763
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
> >         +10 other tests skip
> >  *
> > 
> >     igt@kms_pm_backlight@basic-brightness:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_pm_backlight@basic-brightness.html>
> >         (Intel XE#870
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
> >  *
> > 
> >     igt@kms_pm_backlight@fade:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_pm_backlight@fade.html>
> >         (Intel XE#870
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
> >  *
> > 
> >     igt@kms_pm_dc@dc5-psr:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@kms_pm_dc@dc5-psr.html>
> >         (Intel XE#1129
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129>)
> >  *
> > 
> >     igt@kms_pm_dc@dc6-dpms:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-3/igt@kms_pm_dc@dc6-dpms.html>
> >         (Intel XE#718
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
> >  *
> > 
> >     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
> >         (Intel XE#1489
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html>
> >         (Intel XE#1489
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
> >         (Intel XE#2893
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_psr@fbc-pr-cursor-blt:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_psr@fbc-pr-cursor-blt.html>
> >         (Intel XE#1406
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_psr@fbc-psr2-basic:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_psr@fbc-psr2-basic.html>
> >         (Intel XE#2850
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
> >         Intel XE#929
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_psr@pr-dpms:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_psr@pr-dpms.html>
> >         (Intel XE#2850
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
> >         Intel XE#929
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
> >         other tests skip
> >  *
> > 
> >     igt@kms_rotation_crc@bad-tiling:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@kms_rotation_crc@bad-tiling.html>
> >         (Intel XE#327
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/327>)
> >  *
> > 
> >     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
> >         (Intel XE#1127
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
> >  *
> > 
> >     igt@kms_setmode@basic@pipe-b-edp-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html>
> >         (Intel XE#2883
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883>) +2
> >         other tests fail
> >  *
> > 
> >     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
> >         (Intel XE#362
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
> >  *
> > 
> >     igt@kms_tv_load_detect@load-detect:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html>
> >         (Intel XE#330
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
> >  *
> > 
> >     igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html>
> >         (Intel XE#899
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/899>) +2
> >         other tests fail
> >  *
> > 
> >     igt@kms_vblank@ts-continuation-suspend:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend.html>
> >         (Intel XE#1034
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034> /
> >         Intel XE#2625
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625>)
> >  *
> > 
> >     igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-435/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-432/igt@kms_vblank@ts-continuation-suspend@pipe-d-dp-4.html>
> >         (Intel XE#1034
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034>)
> >  *
> > 
> >     igt@kms_vrr@lobf@pipe-a-edp-1:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_vrr@lobf@pipe-a-edp-1.html>
> >         (Intel XE#2443
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443>) +1
> >         other test fail
> >  *
> > 
> >     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
> >         (Intel XE#2142
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) +1
> >         other test fail
> >  *
> > 
> >     igt@kms_writeback@writeback-fb-id-xrgb2101010:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
> >         (Intel XE#756
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/756>) +2
> >         other tests skip
> >  *
> > 
> >     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033>) +1
> >         other test dmesg-warn
> >  *
> > 
> >     igt@xe_copy_basic@mem-copy-linear-0x369:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x369.html>
> >         (Intel XE#1123
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123>)
> >  *
> > 
> >     igt@xe_eudebug@basic-exec-queues:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_eudebug@basic-exec-queues.html>
> >         (Intel XE#2905
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2
> >         other tests skip
> >  *
> > 
> >     igt@xe_eudebug_online@set-breakpoint:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@xe_eudebug_online@set-breakpoint.html>
> >         (Intel XE#2905
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +2
> >         other tests skip
> >  *
> > 
> >     igt@xe_eudebug_online@single-step-one:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_eudebug_online@single-step-one.html>
> >         (Intel XE#2905
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +5
> >         other tests skip
> >  *
> > 
> >     igt@xe_evict@evict-beng-mixed-many-threads-small:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
> >         -> TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html>
> >         (Intel XE#1473
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
> >         Intel XE#402
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
> >  *
> > 
> >     igt@xe_evict@evict-beng-threads-large:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_evict@evict-beng-threads-large.html>
> >         (Intel XE#261
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/261> /
> >         Intel XE#688
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
> >         other test skip
> >  *
> > 
> >     igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html>
> >         (Intel XE#688
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +4
> >         other tests skip
> >  *
> > 
> >     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html>
> >         (Intel XE#1392
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
> >         other tests skip
> >  *
> > 
> >     igt@xe_exec_basic@multigpu-no-exec-userptr:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html>
> >         (Intel XE#1392
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
> >         other tests skip
> >  *
> > 
> >     igt@xe_exec_compute_mode@twice-basic:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@xe_exec_compute_mode@twice-basic.html>
> >         -> TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@xe_exec_compute_mode@twice-basic.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +5
> >         other tests timeout
> >  *
> > 
> >     igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html>
> >         (Intel XE#288
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +7
> >         other tests skip
> >  *
> > 
> >     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html>
> >         (Intel XE#288
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +13
> >         other tests skip
> >  *
> > 
> >     igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html>
> >         (Intel XE#2360
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360>)
> >  *
> > 
> >     igt@xe_live_ktest@xe_eudebug:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html>
> >         (Intel XE#2833
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833>)
> >  *
> > 
> >     igt@xe_oa@invalid-remove-userspace-config:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_oa@invalid-remove-userspace-config.html>
> >         (Intel XE#2541
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>)
> >  *
> > 
> >     igt@xe_oa@mmio-triggered-reports@rcs-0:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@xe_oa@mmio-triggered-reports@rcs-0.html>
> >         (Intel XE#2249
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249>)
> >  *
> > 
> >     igt@xe_oa@oa-regs-whitelisted@rcs-0:
> > 
> >       o shard-lnl: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html>
> >         (Intel XE#2514
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514>)
> >  *
> > 
> >     igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html>
> >         (Intel XE#2541
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541>) +2
> >         other tests skip
> >  *
> > 
> >     igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
> > 
> >       o shard-dg2-set2: NOTRUN -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html>
> >         (Intel XE#1173
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
> >         other test fail
> >  *
> > 
> >     igt@xe_pm@d3cold-mmap-system:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-system.html>
> >         (Intel XE#2284
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
> >         Intel XE#366
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> >  *
> > 
> >     igt@xe_pm@s2idle-d3cold-basic-exec:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@xe_pm@s2idle-d3cold-basic-exec.html>
> >         (Intel XE#2284
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
> >         Intel XE#366
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
> >  *
> > 
> >     igt@xe_pm@s3-basic-exec:
> > 
> >       o shard-dg2-set2: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-463/igt@xe_pm@s3-basic-exec.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-432/igt@xe_pm@s3-basic-exec.html>
> >         (Intel XE#1358
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) +1
> >         other test abort
> >  *
> > 
> >     igt@xe_pm@s3-vm-bind-userptr:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_pm@s3-vm-bind-userptr.html>
> >         (Intel XE#584
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
> >  *
> > 
> >     igt@xe_pm@s4-basic:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@xe_pm@s4-basic.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@xe_pm@s4-basic.html>
> >         (Intel XE#2953
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953>)
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm@s4-basic.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-2/igt@xe_pm@s4-basic.html>
> >         (Intel XE#1358
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
> >         Intel XE#1607
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607>)
> >  *
> > 
> >     igt@xe_pm@s4-mocs:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@xe_pm@s4-mocs.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-9/igt@xe_pm@s4-mocs.html>
> >         (Intel XE#1794
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >  *
> > 
> >     igt@xe_pm@s4-vm-bind-prefetch:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@xe_pm@s4-vm-bind-prefetch.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html>
> >         (Intel XE#1607
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607> /
> >         Intel XE#1794
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >  *
> > 
> >     igt@xe_pm@s4-vm-bind-unbind-all:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html>
> >         -> ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html>
> >         (Intel XE#1794
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>)
> >  *
> > 
> >     igt@xe_pm_residency@toggle-gt-c6:
> > 
> >       o shard-lnl: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html>
> >         -> FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@xe_pm_residency@toggle-gt-c6.html>
> >         (Intel XE#958
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/958>)
> >  *
> > 
> >     igt@xe_query@multigpu-query-invalid-query:
> > 
> >       o shard-dg2-set2: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@xe_query@multigpu-query-invalid-query.html>
> >         (Intel XE#944
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> >  *
> > 
> >     igt@xe_query@multigpu-query-invalid-size:
> > 
> >       o shard-lnl: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@xe_query@multigpu-query-invalid-size.html>
> >         (Intel XE#944
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
> >         other test skip
> >  *
> > 
> >     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
> > 
> >       o shard-adlp: NOTRUN -> SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
> >         (Intel XE#944
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
> >  *
> > 
> >     igt@xe_vm@large-userptr-split-misaligned-binds-1073741824:
> > 
> >       o shard-adlp: PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@xe_vm@large-userptr-split-misaligned-binds-1073741824.html>
> >         -> DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@xe_vm@large-userptr-split-misaligned-binds-1073741824.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> > 
> > 
> >         Possible fixes
> > 
> >  *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html>
> >  *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
> > 
> >       o shard-adlp: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
> >  *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
> > 
> >       o {shard-bmg}: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
> >         (Intel XE#2436
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html>
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
> >         -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html>
> >  *
> > 
> >     igt@kms_color@ctm-0-75:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_color@ctm-0-75.html>
> >         (Intel XE#3086
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_color@ctm-0-75.html>
> >  *
> > 
> >     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
> >         (Intel XE#1475
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
> >         (Intel XE#1475
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
> >  *
> > 
> >     igt@kms_flip@flip-vs-absolute-wf_vblank:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
> >         (Intel XE#886
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/886>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
> >         +5 other tests pass
> >  *
> > 
> >     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
> > 
> >       o {shard-bmg}: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
> >         (Intel XE#301
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html>
> >         (Intel XE#1874
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html>
> >         +2 other tests pass
> >  *
> > 
> >     igt@kms_invalid_mode@uint-max-clock:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_invalid_mode@uint-max-clock.html>
> >         +7 other tests pass
> >  *
> > 
> >     igt@kms_plane@plane-position-hole:
> > 
> >       o shard-lnl: DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-5/igt@kms_plane@plane-position-hole.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_plane@plane-position-hole.html>
> >         +2 other tests pass
> >  *
> > 
> >     igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-6/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-3.html>
> >         +7 other tests pass
> >  *
> > 
> >     igt@kms_plane_cursor@overlay:
> > 
> >       o {shard-bmg}: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-2/igt@kms_plane_cursor@overlay.html>
> >         -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-bmg-1/igt@kms_plane_cursor@overlay.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html>
> >         (Intel XE#1471
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1471>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_plane_cursor@viewport@pipe-a-edp-1-size-128.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
> >         (Intel XE#361
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/361>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html>
> >  *
> > 
> >     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@kms_pm_dc@deep-pkgc:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html>
> >         (Intel XE#2029
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html>
> >  *
> > 
> >     igt@kms_pm_rpm@universal-planes-dpms:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms.html>
> >         (Intel XE#2042
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms.html>
> >  *
> > 
> >     igt@kms_pm_rpm@universal-planes-dpms@plane-68:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html>
> >         (Intel XE#2932
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html>
> >  *
> > 
> >     igt@kms_psr@psr2-cursor-plane-move@edp-1:
> > 
> >       o shard-lnl: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-4/igt@kms_psr@psr2-cursor-plane-move@edp-1.html>
> >         (Intel XE#2948
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html>
> >         +1 other test pass
> >  *
> > 
> >     igt@xe_create@create-contexts:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@xe_create@create-contexts.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@xe_create@create-contexts.html>
> >         +6 other tests pass
> >  *
> > 
> >     igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync:
> > 
> >       o shard-lnl: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html>
> >         -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync.html>
> >  *
> > 
> >     igt@xe_evict@evict-beng-threads-large:
> > 
> >       o {shard-bmg}: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html>
> >         (Intel XE#1473
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html>
> >  *
> > 
> >     igt@xe_evict@evict-threads-large:
> > 
> >       o {shard-bmg}: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-bmg-5/igt@xe_evict@evict-threads-large.html>
> >         (Intel XE#1473
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473> /
> >         Intel XE#2472
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-bmg-8/igt@xe_evict@evict-threads-large.html>
> >  *
> > 
> >     igt@xe_exec_basic@many-execqueues-many-vm-rebind:
> > 
> >       o shard-lnl: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html>
> >         -> PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@xe_exec_basic@many-execqueues-many-vm-rebind.html>
> >  *
> > 
> >     igt@xe_pm@d3hot-multiple-execs:
> > 
> >       o shard-lnl: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html>
> >         (Intel XE#1620
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-4/igt@xe_pm@d3hot-multiple-execs.html>
> >  *
> > 
> >     igt@xe_pm@s2idle-multiple-execs:
> > 
> >       o shard-dg2-set2: ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s2idle-multiple-execs.html>
> >         (Intel XE#1358
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-436/igt@xe_pm@s2idle-multiple-execs.html>
> >  *
> > 
> >     igt@xe_pm@s4-mocs:
> > 
> >       o shard-lnl: ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-2/igt@xe_pm@s4-mocs.html>
> >         (Intel XE#1794
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-6/igt@xe_pm@s4-mocs.html>
> >  *
> > 
> >     igt@xe_pm@s4-multiple-execs:
> > 
> >       o shard-dg2-set2: ABORT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@xe_pm@s4-multiple-execs.html>
> >         (Intel XE#1358
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358> /
> >         Intel XE#1794
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-433/igt@xe_pm@s4-multiple-execs.html>
> >  *
> > 
> >     igt@xe_vm@large-split-binds-2097152:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_vm@large-split-binds-2097152.html>
> >         (Intel XE#1130
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
> >         PASS
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_vm@large-split-binds-2097152.html>
> >         +20 other tests pass
> > 
> > 
> >         Warnings
> > 
> >  *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
> >         DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
> >         Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>)
> >  *
> > 
> >     igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
> > 
> >       o shard-adlp: DMESG-WARN
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) ->
> >         DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> >  *
> > 
> >     igt@kms_async_flips@invalid-async-flip:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_async_flips@invalid-async-flip.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip.html>
> >         (Intel XE#873
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/873>)
> >  *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
> >         (Intel XE#1231
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
> >         TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
> >         Intel XE#402
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>)
> >  *
> > 
> >     igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
> >         Intel XE#402
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/402>) ->
> >         FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
> >         (Intel XE#1874
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874>)
> >  *
> > 
> >     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
> >         (Intel XE#1231
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231>) ->
> >         DMESG-FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
> >         (Intel XE#324
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/324>) +1
> >         other test dmesg-fail
> >  *
> > 
> >     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
> >         (Intel XE#1512
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
> >  *
> > 
> >     igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
> >         Intel XE#787
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> > 
> >       o shard-dg2-set2: INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
> >         (Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         INCOMPLETE
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
> >         (Intel XE#1195
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>)
> >  *
> > 
> >     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
> >         (Intel XE#373
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
> >         other test skip
> >  *
> > 
> >     igt@kms_content_protection@lic-type-0:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_content_protection@lic-type-0.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_content_protection@lic-type-0.html>
> >         (Intel XE#599
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
> >  *
> > 
> >     igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html>
> >         (Intel XE#309
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
> >  *
> > 
> >     igt@kms_flip@2x-plain-flip-interruptible:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip@2x-plain-flip-interruptible.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html>
> >         (Intel XE#1421
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
> >  *
> > 
> >     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
> >         (Intel XE#1397
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
> >         Intel XE#1745
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html>
> >         (Intel XE#656
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) ->
> >         TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +2
> >         other tests timeout
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html>
> >         (Intel XE#651
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
> > 
> >       o shard-adlp: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>
> >         (Intel XE#1861
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>) ->
> >         TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +2
> >         other tests timeout
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html>
> >         (Intel XE#1861
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html>
> >         (Intel XE#656
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +3
> >         other tests skip
> >  *
> > 
> >     igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
> > 
> >       o shard-adlp: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html>
> >         (Intel XE#651
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>)
> >  *
> > 
> >     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
> >         (Intel XE#2423
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
> >         (Intel XE#2763
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>)
> >  *
> > 
> >     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
> >         (Intel XE#2893
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
> >  *
> > 
> >     igt@kms_psr@pr-primary-page-flip:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html>
> >         (Intel XE#2351
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@kms_psr@pr-primary-page-flip.html>
> >         (Intel XE#1406
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
> >  *
> > 
> >     igt@kms_tiled_display@basic-test-pattern:
> > 
> >       o shard-dg2-set2: FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html>
> >         (Intel XE#1729
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html>
> >         (Intel XE#362
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/362>)
> >  *
> > 
> >     igt@kms_vrr@flip-basic:
> > 
> >       o shard-adlp: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-adlp-4/igt@kms_vrr@flip-basic.html>
> >         (Intel XE#455
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
> >         TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-adlp-8/igt@kms_vrr@flip-basic.html>
> >         (Intel XE#1033
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033> /
> >         Intel XE#1727
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727>) +1
> >         other test timeout
> >  *
> > 
> >     igt@xe_eudebug@basic-read-event:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_eudebug@basic-read-event.html>
> >         (Intel XE#1130
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_eudebug@basic-read-event.html>
> >         (Intel XE#2905
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905>) +1
> >         other test skip
> >  *
> > 
> >     igt@xe_evict@evict-mixed-many-threads-large:
> > 
> >       o shard-dg2-set2: TIMEOUT
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html>
> >         (Intel XE#1473
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473>) ->
> >         FAIL
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-large.html>
> >         (Intel XE#1000
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000>)
> >  *
> > 
> >     igt@xe_pm@s3-exec-after:
> > 
> >       o shard-lnl: SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823/shard-lnl-1/igt@xe_pm@s3-exec-after.html>
> >         (Intel XE#1130
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) ->
> >         SKIP
> >         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140010v1/shard-lnl-8/igt@xe_pm@s3-exec-after.html>
> >         (Intel XE#584
> >         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>)
> > 
> > {name}: This element is suppressed. This means it is ignored when
> > computing
> > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > 
> > 
> >     Build changes
> > 
> >   * Linux: xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823 ->
> >     xe-pw-140010v1
> > 
> > IGT_8073: afc7d63f0733598ecf3d3b48a2edd23bf7609a09 @
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > xe-2070-01c7b2c084e5c84313f382734c10945b9aa49823:
> > 01c7b2c084e5c84313f382734c10945b9aa49823
> > xe-pw-140010v1: 140010v1
> > 
> -- 
> -shekhar

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
