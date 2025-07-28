Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F38C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 19:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A79410E57B;
	Mon, 28 Jul 2025 19:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TN0ZqVij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0743E10E57E
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 19:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753729342; x=1785265342;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rl22fRFqDLOoVKWTe3/Yml9ETOgBeT5JEmh26KrCTZw=;
 b=TN0ZqVijVf3F+6rBUDO5szIQOAOqEirVwiOak6mtM3fVgJHkzFY2Okso
 A4+FGUoCE7xs2N89ibhpBiEEXq6Hfwc1wW2VEC/7CcyWCp1J2rcrGoflw
 azpGhp9GPoBDSnBWf40tExWyvzMGU8mOjMvaw44/lVIm6pQ0KaH0ljr8z
 6EfoQHfhrPEBIpAeCQPMh/50kLCbkB9fvhGCiTBnH7OLqeZd9WfqlktzR
 daWFSEBHeYho46jad+nM+9/BGs/y4aPMLGk5fujAx36Z9W1K+zshakycb
 26OQOhY9JocFWYL4ft2WVDahLOJOqgJfo1wyqhztJFOuJPe4DMwShJQj9 w==;
X-CSE-ConnectionGUID: oDLTNFfRRHauPDzWT9HL7A==
X-CSE-MsgGUID: ggvgqrvVRG2a02Y3w8AIwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="67343298"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="67343298"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:02:22 -0700
X-CSE-ConnectionGUID: GL7jtQ/9QvKkTQgCVAUg1g==
X-CSE-MsgGUID: KOYF9V4YRtOjdmbZgxwOgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162201651"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 12:02:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:02:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 12:02:19 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 12:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4wZ7oQaB5O7He/lLXg0uhGitCTdX+aZs8M+JP5e4AI8nJDyNyD1wJ2RsNhZv8XXTLQ8Wf8+Q0AutzA3ypWlw+LdA1TrB0UyGh5bMExuIou8LUwJhEM7Ic0c/2QdKjMSzIyaltN/ncaGU369YpANWJCOmMTaJ2aV5H8IAS/ncnZT76tI7NVZHVIkk19Y0wZ7Ep/WZSpHQRA32rGnq/dA+13gr+psWVE5oLxG6vektD50ECgHPQw4b9l5r7+9WLLP+famOiqnW3cjo8US/Y40+PmsSlG7o39B05lssBL+igZ29vp6jiKrjM6F7yc+fUFbUxeX9bbhAXNIat2zUpleKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WDA4WNyBGLrDt6rCg9xXifI7Q+vy4Y1Jejh+auECxJU=;
 b=UdQzM9kbqnU4dgvpOc+tsELOfevru3wc2ZQcmMsylBkJvgk4eO+QJChvaJFtVaXwEqhbHePWW88Cna+xwFbSPTHklQvpxlUa1kjWmqiOvmgWWFnzch3CDU/tMGyaPgLG4La5PnhqCIJh3+ti2aWyFn49qKB3jfi+s3Ka4MFhOfqeLBBBbP0I9uBCs2uYcGrZ642tQxXPzCGw0jZ74u0a5Kw8GVR9rVlAKsFde2qIgrwQbmzW4Uo9z5zMHV4QIoFi1xL55QA6BGZebwIWNX5lEFeNAioal4A+K3RZ9pnWlyhkpzlbsi6iKEAJleETWP1OYECYqAWSa4Bwxnz1Hfnkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DS7PR11MB7738.namprd11.prod.outlook.com (2603:10b6:8:e0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Mon, 28 Jul 2025 19:01:26 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8964.025; Mon, 28 Jul 2025
 19:01:26 +0000
Date: Mon, 28 Jul 2025 15:01:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: Re: [PATCH v2] drm/xe/devcoredump: Defer devcoredump initialization
 during probe
Message-ID: <aIfJAvs2OZ5oS2ce@intel.com>
References: <20250728084751.4057124-1-balasubramani.vivekanandan@intel.com>
 <8ca6af6970ef166f66b6786f55156af876133ddd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ca6af6970ef166f66b6786f55156af876133ddd.camel@intel.com>
X-ClientProxiedBy: SJ0PR03CA0148.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::33) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DS7PR11MB7738:EE_
X-MS-Office365-Filtering-Correlation-Id: 443501ec-4b6b-47ed-fec8-08ddce0926b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mgkPc+rXLhLqRw7BcmwSuj6qT+fguDwBaKOq92YnocQWspn2avR4ZXkBq6?=
 =?iso-8859-1?Q?Dc6Ib57nNyLVWyy+Ox0mdkgwR6+RBkPu11xdzC8CIAT8EEHOukW433nNrm?=
 =?iso-8859-1?Q?hglxhor3zUjZLto1Jfg4LtEzrcatFlzWwrV+WebjIEiWny/oWeAFoD2E+0?=
 =?iso-8859-1?Q?3pIRJ8llnRSYtVskFErhSHe/gcVQlW6I0RJvFEKDEaNTApHmVjxuj3ll3p?=
 =?iso-8859-1?Q?v1uPcUwvYwfYqakhSTbxITu82MvZe/XfoDaoxOjyBIkgywjl3mpwtnNnEy?=
 =?iso-8859-1?Q?I8SbPE7X9EKYMfaJ+3V4X6Q+ryEb1U89hHlKP+SZtQ0MMwoAlIlKPvVzlR?=
 =?iso-8859-1?Q?v8duwxMMB9QWbf3DsmRqtmdRDr9OY9bYrCAksJYBvbzRLCCMO63rbcG95A?=
 =?iso-8859-1?Q?qfpz/MPKF1E+JkzE5STeLxG2bILWLYFx9GUoneMULAn2KXqfEwUDrxObtA?=
 =?iso-8859-1?Q?nN+xhGZXB7V7z1GMncu9t7v8hJqQvXM0rekBBCirgfCdXwyq7NvEvnFTdO?=
 =?iso-8859-1?Q?oVkzLKDB1pCbVvoWLYVC8lBaZYGg+Ut6/w3hjOW8epylsolwNfmrGoKt09?=
 =?iso-8859-1?Q?v9a9qlALfWOqpKmQpRJpQ8r0a7ZR0E4OTNpXhbPr3vGGp7Zvb9D4e2ADUr?=
 =?iso-8859-1?Q?j+LvCykSjEbekCWE/iOfIk8Ql1lyx6plG1qehD2hOSciHpd15jCtfx2cV1?=
 =?iso-8859-1?Q?QPjov3XpXpA9AorrZbwGNN8DnRqG/R+E8yIy2qCCA+quFNmE1ln67Roi+s?=
 =?iso-8859-1?Q?pvl3XELrR2NhT5MKQPM11ek6TecogHVo0Mx3vHZnaZbyTg2M2BbBtXPRrt?=
 =?iso-8859-1?Q?n1MF+02ohYcCOOzbo7Ieqj3LaZDFSBpPH0ptf8tZD6tGk054sKl72/LtPm?=
 =?iso-8859-1?Q?4lp6a0Sj2jE8mfwhBavchYOI3KUDrVQEbmel2Hm6Px8EfNrHnjtFTAHIin?=
 =?iso-8859-1?Q?jk6dbP2u+0Ha+XxrRp4EUx2bGTu3QLB8CKq0A04tujzZCmhFEG0QZqVNRl?=
 =?iso-8859-1?Q?QZqku09nHqGqFuP9exw8O+D6Bs9kTAA/nyVn60Pn8LqBtZsKaf8cfwqCsU?=
 =?iso-8859-1?Q?3CyAp2muARs8B3wP1jIqz8lSW4TrRtVY6njAx/mUW5gt9xJTzxMoCMHiTz?=
 =?iso-8859-1?Q?c7X/80nFmMLOMkxnrgXtFLI/Nvg3MNEGiMpUahj6Plsxxo4XPI1dcUC6gW?=
 =?iso-8859-1?Q?wbyML/QFsDa6jhyjy5yP0n6UqVvwtllUfnVpQTOEYxa1rHEiTNtRzHebz/?=
 =?iso-8859-1?Q?w5VaNK3o3m/p5zseXaku4Awlxwcge2hBSAr4gIA0hsrxQjl9o963yblqZu?=
 =?iso-8859-1?Q?kplOiT3dIY8SJmv5IDoBi9ykJ1pKU7sxL5Zx53is1d16OqEJo/Y+vrQjhR?=
 =?iso-8859-1?Q?mPrWL1inX4myHncnxHsQV3jM5lcFq9zbuOrWvKc+bery3a4Y9YsCX2Ge/I?=
 =?iso-8859-1?Q?xJuzh8FxkZsxmHvYsF1dineZlZfOyzBkIhUHEwpByaJwcZ4Fbnw1VxIj3t?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YemAWeSBg4r6ff3hl0n6P15TEq3yTogR8GJZ8dKPsOigQsIAaKw65p4isD?=
 =?iso-8859-1?Q?RQsHJqEVOOP5ggPZCropuch7zZz4a/Jl9qezcz3Q76OvBJGmzFOO43CBZe?=
 =?iso-8859-1?Q?WyX+qBecGd8uqfZLdLov6YBHZZv3PyefZpWLPOYDXqn+C4+IIHwK5DuGzx?=
 =?iso-8859-1?Q?UjAC5kFsP1SAGQ2CfO6DQvgZGNKYFs2Vn1qSh2oks8ohyWadH7hPHD9SUL?=
 =?iso-8859-1?Q?BXia7FWcqw+ed0vm14fHdSvXSg5UCA/UJeN8ZQsYcfj0k8y/8WVVGjCOW6?=
 =?iso-8859-1?Q?yL1eHhlLvogWl7lR7UJzVeEnCV9s5DQ+EQt0KGLrXW/vNqZPOqQFiKfUD6?=
 =?iso-8859-1?Q?urSzxT9XdNvwC4M7IWXzNG70XVsb2AcoEvz8g2IoX5afbbaZY2rwoBoSkO?=
 =?iso-8859-1?Q?UG4WgsL6lUwdHaEQTcu3+KFXsVSOSbb2BMYSlAaZsmwNVQn8zW2ohCH5Jl?=
 =?iso-8859-1?Q?09g6XZqDIC0OMvU9odHk07T5W5UE4L9WXDw1QYn17dOl7hRTtcFXMHadWI?=
 =?iso-8859-1?Q?XQysrsA1yHMnK7yXxL8OBCpV7oIQSa8zsx8K4ri3TXJ1XgZjwhIsNRwuYB?=
 =?iso-8859-1?Q?BEFr3o5026voL/mZk6Gj7n+4ly/mDeus3omei4oLqu2MVgQUh3lc4HPgJa?=
 =?iso-8859-1?Q?ZKDvzMUj5v9P1ztrUZ7kl9oFty7hy4l9SonFae1Dgou1RF0hqVE8/MGoaX?=
 =?iso-8859-1?Q?wniTfCWUJBgok97UAAGzpUj4lnxM87qYu2zNcyxbVzIzWnUsDIEJLQEZGf?=
 =?iso-8859-1?Q?HRgAfazLkGA6qPP9ZHWEwruc/sBYipQWSLw5x3crp6WJ0lNI3hzDK8XaFw?=
 =?iso-8859-1?Q?uLtcUEkq3RFs7QXg0UayEUnmezIv8IxeugDyY4zwnL7e7Kby+M552XFiK/?=
 =?iso-8859-1?Q?DMypJo7J2shf1+Q1nGTy7Ovl2A/bx7wJVspcqhMSQTrhA+2Wp0yGIocTYY?=
 =?iso-8859-1?Q?XrlmD0x+bH1BAGXemKtCoYn12ENpKSf8y1udgfF749WIT8CBB68+HyAjuy?=
 =?iso-8859-1?Q?/j6nsN5p8xecy7jD3j3UTFNQHBrl6z9i//3nY0eDRZRMCO8ifdSLeUGoP2?=
 =?iso-8859-1?Q?VGkw5cgXInOS1YM1a9cbm0RKualsU34tto086ar8kIggXjcSUr0ydL1gIp?=
 =?iso-8859-1?Q?z226aN0q9WU7KSPo6K0m/FpZMVxbPEpi75BYMCJa9+zEFXzMS7G24MxC46?=
 =?iso-8859-1?Q?Gt4uyMa+HhXnqF3TfUFH+SOzaTYOV+ZkhY4241yu5FIBcv9Wcvjjq9NoWC?=
 =?iso-8859-1?Q?8mE1xnwkLEdosQJMZGpd7av9SxRU95aap5HshL0Kswi+olVEzlCZu2h0Xu?=
 =?iso-8859-1?Q?bIiiUVt6DHnc/1eNFOz/BBaT6Tz9+6LkHfgUKXwTA8xR/dphKaJQytWbqB?=
 =?iso-8859-1?Q?q8KPYTeJvG2+ScOZjhO8U8XBUVKr2CZbUe6slQieqRqDwn3uhsXJS/APct?=
 =?iso-8859-1?Q?SbsL52lQwU4seU142SxLOJP8PnY6o9L7HW/htBvRu96d3U8qm0+mWr0VSN?=
 =?iso-8859-1?Q?/S+AypZ3wkfDLWfnwxuWWQxVnuuUMtPS4rUtO+63I3ddJoFPusmA0gd7P+?=
 =?iso-8859-1?Q?iRz1dY3H4ZGvW6J1KrPGOYG+GI5TK04WbBsqeqdVYtduSxnDsWlaNxPMYN?=
 =?iso-8859-1?Q?Al61Q/9oFMDqqKG3pjINvOoySFEAT4ZOCQhlU38Qr8kyFsymOpD/nEbg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 443501ec-4b6b-47ed-fec8-08ddce0926b3
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 19:01:25.9669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3+yaj0fy6hth/X5F4LQmWxKWFDdodDe2BafMOwSD1CK6Li+Yl1AWsxLeKsY71PWKhOOqPBAatqg1tdrm18NDsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7738
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

On Mon, Jul 28, 2025 at 01:56:07PM -0400, Summers, Stuart wrote:
> On Mon, 2025-07-28 at 14:17 +0530, Balasubramani Vivekanandan wrote:
> > Doing devcoredump initializing before GT though look harmless, it
> > leads
> > to problem during driver unbind. Because of this order, GT/Engine
> > release functions will be called before xe devcoredump release
> > function
> > (xe_driver_devcoredump_fini) leading to the following kernel crash[1]
> > because the devcoredump functions might still use GT/Engine
> > datastructures after those are freed.
> > 
> > The following crash is observed while running the IGT
> > xe_wedged@wedged-at-any-timeout. The test forces a wedged state by
> > submitting a worload which hangs. Then does a unbind/rebind of the
> > driver to recover from the wedged state.
> > The hanged worload leads to a devcoredump. The following crash is
> > noticed when the devcoredump capture races with the driver unbind.
> > During driver unbind, the release function hw_engine_fini() will be
> > called which assigns NULL to hwe->gt. But the same data structure is
> > accessed during the coredump capture in the function
> > xe_engine_snapshot_print by reading snapshot->hwe->gt.
> > 
> > With this patch, we make sure the devcoredump is stopped before
> > deinitializing the core driver functions.
> > 
> > [1]:
> > BUG: kernel NULL pointer dereference, address: 0000000000000000
> > Workqueue: events_unbound xe_devcoredump_deferred_snap_work [xe]
> > RIP: 0010:xe_engine_snapshot_print+0x47/0x420 [xe]
> > Call Trace:
> >  <TASK>
> >  ? drm_printf+0x64/0x90
> >  __xe_devcoredump_read+0x23f/0x2d0 [xe]
> >  ? __pfx___drm_printfn_coredump+0x10/0x10
> >  ? __pfx___drm_puts_coredump+0x10/0x10
> >  xe_devcoredump_deferred_snap_work+0x17a/0x190 [xe]
> >  process_one_work+0x22e/0x6f0
> >  worker_thread+0x1e8/0x3d0
> >  ? __pfx_worker_thread+0x10/0x10
> >  kthread+0x11f/0x250
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork+0x47/0x70
> >  ? __pfx_kthread+0x10/0x10
> >  ret_from_fork_asm+0x1a/0x30
> > 
> > v2: Detailed commit description (Rodrigo)

Thanks for that, now I could see the path, but now I agree with
Stuart below...

> > 
> > Fixes: 4209d635a823 ("drm/xe: Remove devcoredump during driver
> > release")
> > Signed-off-by: Balasubramani Vivekanandan
> > <balasubramani.vivekanandan@intel.com>
> 
> So I can see how this fixes the problem from your description and
> looking over the code. I thought generally though we were trying to
> decouple the devcoredump from the underlying structures.
> xe_engine_snapshot_print() is grabbing a lot of information from the GT
> at the time of the print rather than purely as a snapshot which doesn't
> seem right to me - we should be taking the snapshot at the time of the
> error and the print should just be relaying that info.
> 
> So not that your change is bad, but I think it masks a problem we have
> in the implementation of that engine print. If we call
> xe_guc_capture_get_reg_desc_list() at the time of failure rather than
> from the print itself, do we still see the same problem?

Indeed the real fix is to entirely decouple the capture from the read.
capture should be done at the snapshot time.
Read should not depend on the gt. Although this might not be the only
case and we probably need some quick fix for now.

Perhaps we go with this patch, but mark as a FIXME comment and ensure
we have a gitlab/issue + VLK opened for this work...

> 
> Thanks,
> Stuart
> 
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index d04a0ae018e6..ae48cd3c7bf0 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -821,10 +821,6 @@ int xe_device_probe(struct xe_device *xe)
> >                         return err;
> >         }
> >  
> > -       err = xe_devcoredump_init(xe);
> > -       if (err)
> > -               return err;
> > -
> >         /*
> >          * From here on, if a step fails, make sure a Driver-FLR is
> > triggereed
> >          */
> > @@ -889,6 +885,10 @@ int xe_device_probe(struct xe_device *xe)
> >             XE_WA(xe->tiles->media_gt, 15015404425_disable))
> >                 XE_DEVICE_WA_DISABLE(xe, 15015404425);
> >  
> > +       err = xe_devcoredump_init(xe);
> > +       if (err)
> > +               return err;
> > +
> >         xe_nvm_init(xe);
> >  
> >         err = xe_heci_gsc_init(xe);
> 
