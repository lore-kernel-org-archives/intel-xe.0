Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D20C3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 05:09:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054610E1C7;
	Fri, 19 Jul 2024 05:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcTnKbcb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76CED10E1C7
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 05:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721365749; x=1752901749;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O2Uif9tJ62hCbFA4uEwQpmRkbLEZrqC+IInkcJ/SXGk=;
 b=RcTnKbcb7eMr9TamZS1U0qj9406G/PCkhMvXFvGkyTe+T0G+ofgU6Rfa
 36fgzUlI/ljGLQseEgbg45ikcQsul+P6FmFvKY1lqfejl7BKel2a7WG30
 Uz3BeMiywAuc+fjJlqkXFhSUiFC1LAcic9lRnCQE0qJgXGTjFxsgXQT6G
 olUvWNMD3X+h4KhkxoxrpcDA9BGcFepjQcwceRBI3ri9cCJIrdMa6yDdI
 ORZuxUaGnu5wOufE46t5Smc6jCAPzbYLiG2LMM4jDIvQ+rKaLb/hFxLC+
 291YGvps/SnRX9cPdKy8hBf64cpxVJGEKLWrAqMd+RWYIUH/ieyzsfz+6 Q==;
X-CSE-ConnectionGUID: abjQqStuSC+ihr/IbFKVjg==
X-CSE-MsgGUID: nC22yvlDS8GevdpH9/9CJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="41492815"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; d="scan'208";a="41492815"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 22:09:08 -0700
X-CSE-ConnectionGUID: gPjTF0TdSmS/k2mRvPZ+Yw==
X-CSE-MsgGUID: rYT46+qDTo2kY3Oeh3NXTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; d="scan'208";a="50751108"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 22:09:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 22:09:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 22:09:04 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 22:09:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 22:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9TjgrPtfUCGN+iLUxy6MBhjxPGkszH5TRG4PdfqYU7l43Pcl4xoNBpyAmcVdvZoSUvmp7ZwBpSPqcw6ATuYp11Vc/MKPQZUdz/a4TsFWvG2tu/UffHT3ipmgNdh1AtUmISzPKbhXKEYz24y98Ab3Qa5f9DP519swQCYQxJVQBH7y0BiZ7K+tESQImFlveTzI20fvJ5kpQBr4YO76GF431oPqlUUvLqkfBRTMcL2K+vw2FIePPoFIhKSM3N3baZcLG0u6zSdLHo7T81rzaqsdplJ29+SSHWDSqoISx5lr4lpjMLvAxfwxuV0hJNr/yOU54fVlkQKi5BkjvdbG7WftA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bowk2LBnj6a2bxdscvh8UBnSeJ5J713sR2fNxU9M4VQ=;
 b=V7eMVm6E1y8V9gLkyjBOpsIwCq7XcUWNWC0FiBDTwzVoV7LBC+h/fb/CbSI9vjHGMT3vV+YQlFbCWqrJYMVR9AWwO1pgUuEotSadEzMgTS6QsJ5Bc1wGXMd5Oh/sT/wnGMXM7rQgYL2/yegOLHF5gG8AEYXbrB73xX9r/mU5Ng6qcFW0ZD0aFwhfsPIHFlsccpBxPDvx6rQgSXQ0aoe+paWG1Yk2N223xjrwmgce7M8jp6d0nly0O1W+0zizmWouxcLbZ3UQo/TCZWEe2kB2h0/vaTzZyjRlOTKP1L9mtSwG94RUUFyNs0pUvieuyJp3OPgNJ2oR84Sz26dz2/iRQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5901.namprd11.prod.outlook.com (2603:10b6:510:143::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 05:08:42 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.7784.017; Fri, 19 Jul 2024
 05:08:42 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Unlink client during vm close
Thread-Topic: [PATCH] drm/xe: Unlink client during vm close
Thread-Index: AQHa2RTHRUD7kzxzjEmRktj4GtbcG7H8pGIAgADb0EA=
Date: Fri, 19 Jul 2024 05:08:42 +0000
Message-ID: <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
 <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5901:EE_
x-ms-office365-filtering-correlation-id: d4daaffa-bdd6-4ea2-70d0-08dca7b0dbde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?OhnQ++/lA3l+WXhdYdL1Q/KnhzHJdBnzN20jDXVjkPktS5YLTsur9oiYheDi?=
 =?us-ascii?Q?+rXNXh/899025/pfhm87pe4pjitLoaMzOe2WVPzDl5d1zRcXaLRa9jNcU8nS?=
 =?us-ascii?Q?4Mg+34kCJ5qd4HZ02qvg71pdvwXUbAlI8O9980GlZ/Esj0y22+2XP/7+xDQF?=
 =?us-ascii?Q?EhodJZMLdbKeyUoxHVi7015DJDNWJZeBT4ksjwFVZkwE1AXbJfjQJcY1nA62?=
 =?us-ascii?Q?JhTiVC9w+MgVgODrfvxf30vscQtfM6HgwivFFPbScgIoSQegzjEvrV29ZVhq?=
 =?us-ascii?Q?R4O+vOrwg+2r+qVqzwXOp0DrHavfCb/5gLvPXDHf8LhAeU3S1qaGAg8F96cI?=
 =?us-ascii?Q?/Q2/dglRmzcr1JqZdGs/jeYp7WAKsAwCTweDsDPeNfK4fDAdbC6P5e9Kk/+P?=
 =?us-ascii?Q?7E8LZejncJ0Sup8NQeR3Fot4DynQP7sBSUaQZQJE7sMr7f0mu8BStJZTtIHy?=
 =?us-ascii?Q?EARvLVJX64UQFEkiQlv58SBib+OUdd6OEWEjnjeUjhbeS0zvUyHD9Tz5zHAe?=
 =?us-ascii?Q?fQJWUxzVfQkBtTWyG6D/oxiQmUSlyBoBeyNJrImblgjNYmwmPI48mNXhFWir?=
 =?us-ascii?Q?GiwHTwKwbLXPQS8TIhlrIP6U2yPObZ5Qk3tM4XNGRmK34fTLYNvPUaw1NcXh?=
 =?us-ascii?Q?En54sVyj0LoLycNk11BOvpECSOI8rmbKRogwVYL4DWBVmxv++P8iEDwZ1Cs6?=
 =?us-ascii?Q?UCkMA+p2PUEZX4i5i3u3M5xOg59aXcfJ0zltzAsgU/nknWVjSKI48M63DuqT?=
 =?us-ascii?Q?qgSCryvKCfpqJff9YMRTNOkqiVcFO2Rz4z3oUjHcRa5Xzrlj1MTWKoDPQPPW?=
 =?us-ascii?Q?y0FGDae6I3RzC7Zw6HRuEI5dZ5xmxkWs1FxYil1Me6SHrEDKdICyWRSQupu5?=
 =?us-ascii?Q?h193YQ1N0LQDYcZj6ZiBmg/Wq1Rwf8B8LRyhr8QCoe9+3WiGPEF/O2+roc20?=
 =?us-ascii?Q?gwiWdegaR7xa8O1J83UpsS2TNtLWOpXpJXasYPum9ywonOXXwkGvISlt+4Cb?=
 =?us-ascii?Q?AsS2RPVAhQhCy2KvmdbYh80CaDiHz0Wc1ZmSs5ScBquERfr6BdV4/nsySGnG?=
 =?us-ascii?Q?JLK+0WntPEm2py8kupyMSfJF/6R8BGpKxb0YN8qzsCJeSBq0s+Hr213t4QN+?=
 =?us-ascii?Q?COuTEVA/bJIHDKvPYhr+CYNdEzug/shSEeBRT7PusXeiu1trx66p4Da7FCxE?=
 =?us-ascii?Q?iPNiJXI6hF8fgv4BOI1yCO2EaKQ7m29DguvLjNSvDIWHqIDoGIRbXFFhNXAa?=
 =?us-ascii?Q?UjCLdUWEl7/xLJKfMIBI4hpO0w63IuBLkuY9BRHxenqMH5cNo9BQE0Qahdxa?=
 =?us-ascii?Q?CFe9ULiDp/zmfm22imnbiW2PgIUaLh4Qg07VIVlaXB19tKzGLe2zH0jOD4iF?=
 =?us-ascii?Q?d/SWDLw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b29AHT74KAlAjtItO4/1f81P3D7mVyrjGpxE786SkcP7hLBn/pBXIpinY19y?=
 =?us-ascii?Q?F1cbTTvSSTr8xUTH1PsDjVWjN6GVT66V3u47CZoeYTGqRe0MOwOwkr9YJcQE?=
 =?us-ascii?Q?Db1k7Go0pOlkvC67LMWPZyHYNPFGas3HX9a4MWnu3PL6UM5P3wl7MI3FMQAm?=
 =?us-ascii?Q?vPlhhtyCOeginsWQmuG0liifvUvV2vUbIrjfxGPsXkMekiplpr8ZoEU9Nbid?=
 =?us-ascii?Q?YmskVHmuwUs3yEDkqDhzzuS0RuoSYEdlAiV+kykWsy7Ldyw941R+9JA8BZ/s?=
 =?us-ascii?Q?lPI5X8QDgNesCrgXaA8hI2c8UyCSqJhv0FgZ5D4S5zyh2MamtRwM9/6MRCRM?=
 =?us-ascii?Q?qCWGl8Ltn0uF5fzC/Q/5Dv7YmgjFoEuzGQxmsiMqQyPjtvaB+Yup+TFScZ9K?=
 =?us-ascii?Q?ah9G3hv62VT8Ft2a6705By9huYU6JaGSB3Un/SeDAy+SepL46nt6kzPlbUpa?=
 =?us-ascii?Q?ekFWo1KzZ5qDxzrx8JEbf+Lcd7WBk+6gyA9+MpFTCqTryGJCVWcN3nLDcEAS?=
 =?us-ascii?Q?ULPFnAxe6t7Oe4e4SrAZ6lgB6mVeMhMcSGwF2ylI9yagwILrBobKzMUS0bXe?=
 =?us-ascii?Q?oz9Leh41jJZXmI7iKmf/U+t2HnZa2EUZP8m6OkNkAzwchJYNpKdJn23idVhz?=
 =?us-ascii?Q?XE6P35+7dXvIss81O7bIWdWIX+b73GxuUkiZ31ufyiPRqx6bt9qurMoXcjNd?=
 =?us-ascii?Q?cPZgQTVPBPS17B8F/EUvf9Em9hsfN+S9H9ZawbKjI1oZQ0RkwVwJS3SqSzkM?=
 =?us-ascii?Q?qVgFbj5EtvDvwGy/06XnRHwYGSycF7quxXnYIjQBnXtnJgh4w7P9bkf09WSI?=
 =?us-ascii?Q?Q+s3PHVQgMH6gVtjtj3uzJimGklLj7HfqtXeVZDBZLg1/Dx4M48BCFCVigZS?=
 =?us-ascii?Q?/WiT5G6MJ8v9CtnCBbfLUpJOkLk1I+sQnpaysvOVoiXMHYhTSPxhjjykqbcx?=
 =?us-ascii?Q?w7zZX3rZdVcFJD9RfItB3tnIzjE0qDxpiVRraYawwjjDm1Z/Y2GgpjBcQBAK?=
 =?us-ascii?Q?fn4qLivGabnYa/4CjHWyEmNEUdpsl2DTDol50zTaQGnXw1sE0duXG2bsjGT0?=
 =?us-ascii?Q?Q0mCnDcZLLKW6AIF77UGqG4QFsm+9tt0aj24UPe5Smj3kn3aHMwNnLyCRi27?=
 =?us-ascii?Q?/x59v7sMYjuzNAQ0+H2jmWIzgeWqMtoBd8PqnCMSoMI0VE0E9tny+UnH+p1G?=
 =?us-ascii?Q?peRSSHjPvmMHiqf5k4gruYEy1toE0e034zLMbXNnQKkddT2wu1tPhGBSDRDE?=
 =?us-ascii?Q?jQXlZWQm3hcuKxVW9QsRcTWdoC+H7FfqeujnSW7ak1GaS0YpguO2aGIjHPnu?=
 =?us-ascii?Q?Cg4hKcD/XYujtBxN7bVCMfLImHgFg+OVAK1gOy8jyZ3lSqZOToPvIyBfa/ge?=
 =?us-ascii?Q?SX4+5eqw5eC3XHv1LVb55DMaLVrLtr8pkqKTItTfblNMTLW4LApryEA+L+dF?=
 =?us-ascii?Q?sFe0J/VmrC1WSA3Isc90xVhc+lwtrhSUZXqMuTQjNXAjHiPpIykm2ylhVdpD?=
 =?us-ascii?Q?nrf8fn07RTwp8t9JQ6V8d5frTTXiOjJUwCxRp07+ro+3C1SIDaDogQG+tEH0?=
 =?us-ascii?Q?FwPe/YGnDmXD6Efn3t6p2aZHuV9UpL+4KJiPmx2X?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4daaffa-bdd6-4ea2-70d0-08dca7b0dbde
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2024 05:08:42.4539 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N/1hdPz6A/e0i43vZkhSlaxFw3xXXqFhLtW60TSWngWK9a6Is/tgxeZYc4ITQB1E6AchY2y4oES5WzyUQYBLGpOuT1WSXoDv0rYDpAU2mB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5901
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, July 18, 2024 9:28 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe: Unlink client during vm close
>=20
> On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
> > We have async call which does not know if client unlinked from vm by
> > the time it is accessed. Set client unlink early during xe_vm_close()
> > so that async API do not touch closed client info.
> >
> > Also, debugs related to job timeout is not useful when its "no
> > process" or client already unlinked.
> >
>=20
> It kernel exec queue timeout jobs, now the 'Timedout job' message will no=
t
> be displayed which is not ideal.
>=20
> > Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
>=20
> Where is exactly is this access coming from?
> BUG: kernel NULL pointer dereference, address: 0000000000000058

In guc_exec_queue_timedout_job() accessing "q->vm->xef->drm" after client c=
losed fd causing crash. We cant take ref and keep client awake till jobs ti=
medout is what I thought.=20

>=20
> Also btw, the correct tag for gitlab link is 'Closes', "Fixes' is the off=
ending
> kernel patch so the fixe can be pulled into stable kernels.

Ok

>=20
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> >  drivers/gpu/drm/xe/xe_vm.c         | 1 +
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 860405527115..1de141cb84c6 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct
> drm_sched_job *drm_job)
> >  			process_name =3D task->comm;
> >  			pid =3D task->pid;
> >  		}
> > +		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=3D%u,
> lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx in %s [%d]",
> > +			     xe_sched_job_seqno(job),
> xe_sched_job_lrc_seqno(job),
> > +			     q->guc->id, q->flags, process_name, pid);
> >  	}
> > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=3D%u,
> lrc_seqno=3D%u, guc_id=3D%d, flags=3D0x%lx in %s [%d]",
> > -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > -		     q->guc->id, q->flags, process_name, pid);
> > +
> >  	if (task)
> >  		put_task_struct(task);
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index cf3aea5d8cdc..660b20e0e207 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)  {
> >  	down_write(&vm->lock);
> >  	vm->size =3D 0;
> > +	vm->xef =3D NULL;
>=20
> This doesn't appear to be thread safe.

Would you please elaborate!

Thanks,
Tejas
>=20
> Matt
>=20
> >  	up_write(&vm->lock);
> >  }
> >
> > --
> > 2.25.1
> >
