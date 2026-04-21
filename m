Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BDCF8FA75
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 13:21:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFD010ECAD;
	Tue, 21 Apr 2026 13:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwnBGEH9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C9D10ECAD
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776777672; x=1808313672;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zbB8CqgsHxR6NyY1Fa6X09fFYaWWh5UuTll3MmCDsuI=;
 b=OwnBGEH9qSlY1CYqHzlTMUe26d/10wFU21Y34bVWDZToYdVpWuVeZxD7
 SMAxp+XLQnZGFZDDyVPXCob5+IDYC0kNjOiugGSHoyXsU8uE94YUr2+v+
 wBD1u7EDnNxpZwBwbitni1GZVHvMZX+o+J946zA+G7eTn1iZp29qkoi4Z
 IYGLqA0/qdjLrYPNa4tDroX/v9VkGn+yKOtUQZ+dfj9C6ZIukSb79QaB9
 Eo9zi/nc6lygpubmw2BgF0OSs89Jna3nkL4O5PtrtnaOo29HNLIl0dWVF
 Gdjtt6O+dM8VnIljuKDHhubbfi0kauglfN3CaGo1JIaFgXOdDpWAYe0JP g==;
X-CSE-ConnectionGUID: rama2TEMSh+ZFCQ+/q2nuw==
X-CSE-MsgGUID: Ij47zk2xTl62ZzU6Idf3DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88785098"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="88785098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 06:21:12 -0700
X-CSE-ConnectionGUID: aEpd3neyQ42oPdh8Pu1nCA==
X-CSE-MsgGUID: ifIFs74IRo+CQpCq2t6DWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="255296316"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 06:21:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 06:21:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 21 Apr 2026 06:21:10 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Apr 2026 06:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRwsQ18bM+HLdiToTKM1wgSW+80LIgIFpxbBgVysCrsk6S8NMTqtQ4ieojQGRXIvPFmMHUhrWnBOSfr2sSu1L2Joqc61Rh+SXuFyctACPwfDWkLLzr2dFO645XOSJDXvu9EMDvHGHTJj6QdsL5gs38M1P7jqKJwnrtaAV2zRP4I5IJo8uuk/WyeUC0gbOrgtSockJa03tkn02+gmdkUqvUH5l2jFOoiylikWftcTytLctmCuZ1f6Y1eFC+rdyqoAlVYw8XtYpduzOINV3pw2VJkJlJqjY5rWoXhvKD9tM039rpteiZ9E7gNk8p1gTJ7eqJ3apaA0T+O/pjQQTIURug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EABmHLTJjE1incA+x+Wv18uAr9mc+yWkcr/MEbxlqzA=;
 b=Z8lYJdBg8lX9jCFuWTCMBVjg7a6NALo9ksOw2+aMzkNVQKdYsSTeOCpnnq9monOi0pdDiHpzGZZv08eKtsFR88kc/OK93SELkMN5NuzXFaxyunfb32M+YOxST9pw0GBgSLRFRHxtH92OCbRBczC7yumVmeuhko41ZSNXbOjyAoxAuBQ2iLZWsV5fZVP3YLAChm5t1aaeA+DpnsI7djxwfY93o5ls6YWbeBLyv5tEKQnGf31v3daICf0XmTSKmTFmqMF8tI0xR8n34W0wcHW7IgnAs7z9ZK4HzBIIvegBxsxsowpEVY9/XIpOPrTj6zjX5eJTgOWvcASx8kjW4PTKOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB6346.namprd11.prod.outlook.com (2603:10b6:208:38a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Tue, 21 Apr
 2026 13:21:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 13:21:08 +0000
Date: Tue, 21 Apr 2026 09:21:03 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
CC: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aed5vwPcAdxS45aU@intel.com>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan> <aeJI1WrAr33degB-@intel.com>
 <aeZFqaIlrddHmlCn@ashyti-mobl2.lan> <aeaD3n25U8LqGTM8@intel.com>
 <aed0EPEZ8oQLzPNc@ashyti-mobl2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aed0EPEZ8oQLzPNc@ashyti-mobl2.lan>
X-ClientProxiedBy: BY3PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: f5c4309f-0db1-464a-eef1-08de9fa8d964
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: sb/d8VzWQlH9a7zJInovQTGAqcdeKZuhLKJ+iMIVJSO6G5JTGeVqoaGWGuRjOAIQExOdJuFis2zSwvKgcmvEwtzeRQPWbIc7hjrbXhdd7ln4YucdI0cDhdirsFWRMeGaidqKGBcOlekqTgcTJWa74lh56ddhrHTr76w5Gx74wSiHFp/0KdR/lTWAXlMxHn8Ucbn7gE8mm05WVfRhOAwepZrnoDFYPE8F1Vik12hi9KohiE5OU9ieB3wKlPghPgDXqMxltjOyxejUqiXO1tLlWbjIcz7h3khvKlnXluZNZ+gVAn+IXlZEBX9krAJQpQgYe4XfUTvlruHshtDKLNeJb8++Usu2pMVpvyJe93k5KTlGwGcOej2CK/6sHXLJpOF43InP/q0o/zIB4TNeMntFwAjVxmVDnSaZgod75F1lMsCEQNgAU8qnwI/hywFwKwRdnN4m+t2DyGh1kPvLqmEW+Sp5pxWRM5DWrPawVSNW2K70gXZw+E2whzRX9YLHZoy9xdJEeFGG4s1S/Un4kiRpp8ygsEIVsfXswhJ0Tps7TIoMGufuqC67j8MYsstG1BMTm9TRxg4BTLdOjo6LyMYRvIZh0Eww5Za3PJ4OeDyukf2MoJIjUDktBCyKgFsKsKvz/DlFeqra/6tc1zzbO3Cu710IlyFt3qcaIsRLARvFecxJxZ7eF3I59KQ3bi8+ocvnikxo4PsRDodFg/6wrtsx3rSTPLwR+Pkr1R5o+T9PcsE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Vkh9JxvSSLXZyCrg0A9+UsAdVWWXgS31QCF7AiSuA2PIGon1UcqwwFUH/iRQ?=
 =?us-ascii?Q?uy1RSRXGn/W1g+MDBm15siaViUg5IVTC87lz4HCtC+DFWHwKdrC5yAQFzvE6?=
 =?us-ascii?Q?Yhg9ydUvRAnMVq/FpggtHJJIDT43+Qc3p4SrxsJeCt85BSp9r2vxH5KpRT4Z?=
 =?us-ascii?Q?iIfkjmRs29/GsXlNa4/AGWqmaHjHgTLcdDE3ShHKuQqIFl67f51ocCwJWFXe?=
 =?us-ascii?Q?tFyFTFGuYK4jte6W+6zm2Me8TQfHPDoFE+S3WjtBoZXl6OoNhInH8XlLl++s?=
 =?us-ascii?Q?gW1mW7Yh5+oH42PKu75tmO34/cziIUtPjcjJQSMR65DRKsg2eQ6U/MWbyrku?=
 =?us-ascii?Q?KLVqMrW27bpdSk3b1E20emt9mYb7zgpQaX1f+5qHqBaIVCJJiYeK4Gz9hecK?=
 =?us-ascii?Q?9VQr76oY2mObS3rDIxVyYTwbraDlviIqPTPul9nuZGeQ6PMrgL6J2FZRUp3T?=
 =?us-ascii?Q?q3ttTS+uFtcFx0G9GzmSYk8Qf1bgeLERqc9i78w0NCZiPC+ekPEMaPSCDPYk?=
 =?us-ascii?Q?fMH2gysx0dWSMIaxGm+iM2T/XbCgzCLImkTZuwRyei/zZvbeqAN8CyYr8Edh?=
 =?us-ascii?Q?BlezhLLqj1Roh5NqgP0ffAYx1+RYzEXX9anpNZDdNxbtYy3zCMktEWKDOaz1?=
 =?us-ascii?Q?cdtYZsNRZc5YpMngktKJjKygUiWUQ5kv/hQVaUFzwqzly+1hhBeqY31n18or?=
 =?us-ascii?Q?Nj8cS0cg5jxAVSTZTgxbYw2iox2ZdEKM6A3e8sO+bPqZao9C9YOUyHyECu+X?=
 =?us-ascii?Q?rII9N23iHrnbaLeNYXpdut7HdjkRVvTldt7DGsAtYzN5jhoQOy1SD964rJh9?=
 =?us-ascii?Q?TAtPKE8Z3WaRuSfeQYmu3p/IY+rCP70YY+ZWihg0kXlaOTYzSc5ycy85ttLa?=
 =?us-ascii?Q?ythm0ps6ZxXLgZCCW6NnQiud4rZgLRKiVk6xfXTtXVjBJnEriGAeO0LliVn1?=
 =?us-ascii?Q?gOkCAe72rBn0ZuoB2vd0De3MLmP45JM949Kd9RAyEjOUYplXYiWI8ZtYOQGG?=
 =?us-ascii?Q?KSuEW8lSmho8w5OxJP4TopIxrI7yAtNL6tWM4yS6OK6KqGWcLOAlYe5ZLrYD?=
 =?us-ascii?Q?OgfISKOnNDLKIFPHaw7C0c8RVT81svirL7N7+3alHFjOYGh3ziE25OZtRk1Y?=
 =?us-ascii?Q?tmzXKah960TKGCT3NA7R2xOTP+3MM2+6/1CDY7+L8VwPFSVjBIPrZxd+GcR9?=
 =?us-ascii?Q?9HfkyFiR8pg/k0b9PK+nhJA9n4rdgMeuk8cd3808/eokYFhVnJNzocELqlEu?=
 =?us-ascii?Q?GFfPe5gEzulS3O4oAAtU0o/6CBzSEOqfArxchRvGcqEEtReLTjIBnqhOYaS+?=
 =?us-ascii?Q?0T4kJuKR6J3hLfWB75sHB09XFnI8Vlq9zFGIoPyljh9QvXFJKMyeB84C3xU+?=
 =?us-ascii?Q?9Xk0mZ946aGR+savB3pnA6zgCf9l58mOKblQWpTm5GtMPfxgZI3sAHfqYtJC?=
 =?us-ascii?Q?seG+Alq2Lrc1wLheIja1CibB3yh4V/dLIuiL9UDz5Px2HJqXKY4fdSlEyouH?=
 =?us-ascii?Q?7oFAWG5IYygPxXoQIllXZYOFeP0wxC1r3vSy5otKXQ5XGZOQORZ7X47AosvX?=
 =?us-ascii?Q?sMQwMXVDCfYHJhLeT0kEhf40mxVoXmLiTgUKVIR04UyKzKSYrsJcnJBSqwhI?=
 =?us-ascii?Q?CBXbDZd28IHQJ5wvQDp/GZ7sX9AH4gDnr5nSVM6ueUwkbp8CzuNBpITe5J0s?=
 =?us-ascii?Q?NaRKQn/UOLQROsGROUXyUY0u2Wh2txIh9OnZIJRO+UmTrw28/YsunQOG3wwa?=
 =?us-ascii?Q?K3NfPIp1SA=3D=3D?=
X-Exchange-RoutingPolicyChecked: wGe2TS8jxPdBuxo7c4UL+Ag9qq4lrQlsRKeylpKTfSIonuFAUJVNBZke20kBluCP9nTpL9zBZNbrDoHcmfGNULz7sT6pI557+F3+pxU4i71QKEoJmTdLkvMrnXWxZzhJeo/23/UlKpw56TIujT9ZAj7MbpD/bztNomY+LDrIAOBkddEXJStFaG/V66QOEq3q6TC8oi7MJx6aDFjSLMhgD/rRryt5XSkySLunlkERS2CQnSc6ntQ5ofArGgc+DVY/2XAgwTLoTIC1+W66JRU3lE+oE8NONmgUDsn4HyKA2eBykYJXoWWbgrcy+1l/2bjKDNFd2/GK4dYwqG867KFncw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c4309f-0db1-464a-eef1-08de9fa8d964
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 13:21:08.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: er/dIb32JapMNFirKqDmiYJZ5Ld7U9jNUuz5IbknG+QDIkeTFGTjit2FFoP3CF+cebyuXWHkCh04XlPWWIIKsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6346
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

On Tue, Apr 21, 2026 at 02:56:48PM +0200, Andi Shyti wrote:
> Hi Rodrigo,
> 
> > > 
> > > If we need two strings, then we create two files.
> > 
> > This part I don't agree. This is just the same as the power cases
> > which I already had pointed out.
> > 
> > But right, you do have a point here. Different from power, we don't
> > necessarily need to expose all the supported modes + the current one.
> > After all, these states won't be that different from state to state.
> > 
> > We just need to document it properly and then just print:
> > either
> > 
> > ok
> > instead of
> > [ok] warning critical
> > 
> > or
> > warning
> > instead of
> > ok [warning] critical
> > 
> > or critical
> > instead of
> > ok warning [critical]
> > 
> > The full string with all the supported modes do sound bloated for
> > this case. Considering that the supported cases themselves shouldn't
> > change much and that we keep that documented. My bad, I'm sorry for
> > the confusion here.
> 
> Think of what a miserable life have userspace developers when
> parsing power files. They need to parse for the '[', for the ']'
> the number of words, etc. We have here an excellent example of
> how *not* to do things. :-)

not that miserable nowadays, just one AI prompt away ;)

> 
> > > If we just need to provide information to system administrators,
> > > then we can either use the debugfs or procfs that don't need to
> > > be considered as uAPI.
> > 
> > That is not true. In many data center deployments the 'debugfs'
> > is not available and the admin and cluster tools still need this
> > information. It needs to be stable API.
> 
> Bingo! :-)
> 
> Then you need to define an easily parsable, well documented api,
> so that it's accessable to everyone, applications and sysadmins.
> 
> Overall, I don't think this is a matter of taste, but, anyway,
> you are the maintainer and yours is the last word. To me, this
> looks incorrect.

I agree with most of your statements above, except that to me
this is easily parsable. But at the same time I also agree that
the simple state string is even easier and we should take that
path for this specific case.

But because (**and only because**) we don't expect changes in the
'available' modes in the HW/FW.

But the /sys/power style should be the way to go if we needed to
be prepared to have a flexible SW API that depends on different
HW and FW underneath.

> 
> Thanks,
> Andi
