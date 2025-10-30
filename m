Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E55CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 20:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26DB10E8E6;
	Thu, 30 Oct 2025 20:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ew1hGKEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81210E8E6
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 20:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761856703; x=1793392703;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uYQLw59BnHmGmwpEKXRqIOtw4nRqTtC/U63CuIc/Fm8=;
 b=ew1hGKEi23VldShtfoO1+Qb6D7LPq/2ADCtd/iXfauGH2aKm/HaCutMN
 GkoxN8FerGeVBCzIMxoxCu2HDH2t769Twfkuvs/woc+VxPlNBPZWdMDqh
 qWnFrfvLVg20k1e419YheztjNtxLit9eyzoPTsgU9IyZwIC6JNXOh4x/2
 aB2yN+uAJPqMsIeXQmxIegYk4yKN4pbdkBi+XdGXHkPvmY5iZLN7kF9zj
 NHz76goNHLFPIzgBYPHNcj/09V2PFg/1rCg4Ft9c/KGYNIzsifBhaF6Om
 So29EJRSrUPRx/NpHFvcd1Lm4vdxxfycfJ5b53ESKHKIamG6WhXU8YsOU A==;
X-CSE-ConnectionGUID: tQ72Rl4oTBW+epnPMkxzaA==
X-CSE-MsgGUID: aFTVYeEmSp+Kas8PQZVIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63898636"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="63898636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:38:22 -0700
X-CSE-ConnectionGUID: vShng5D4RSG5k8TpTBtAGg==
X-CSE-MsgGUID: pQtTi5e0QBu4rna2q/6Jdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185712377"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 13:38:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:38:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 13:38:21 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 13:38:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLH+3KxR2YYHCtFk3Xc70gbc9xppjIJPBnLDXaWCXutH72VMzI1PoW/Mj3MCY0dGTBZEJuvt3h3CH5JxhwD+EBw/iOyQw8y7WTC561FY6XNRXY4Pwt+5tSg94pGA8R1BDkzaSJeH9NnLLsjNqCuxUg7+LJlQxPsNPEC2gCQkI8E6XUJODzNGzWixFBpiAud0TWDwCyfgv2YobFYczrO58GstT0joA3vhsE0ICMO2LpjOljJBn6a/CujitNvdNSLSK71DiD5bqMoLXCFkEz7PR3ZSdg+I10DBFK4RqCn+JULs2zlV5nK1NqUH/eUVA44O+EPxnQjWCpT8rI8G5ieG1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYVKMUTYBC0hUt/n9o57+/h2uGvjOVsEUzeH2g5KUtA=;
 b=rHrSewhFhUO5RMRZE9whGawOuTwZ3AdaY4sHKvzYaqwE+plaTLHMwKJTk5Ytlb9oGOG9O04WTHjVfh9cAEKerTti39qoN5m85RHBrW/5DKunW1A3qwe+5jehBHsTyYDw+pYLdDsYklzcDdxaP7wSuHhPf5Y71ewvqeRl5mG1Gt3hZ5e8H6jmLpkLsEY1yC2jmFHkgt7lV0/KMONv7jZJWOCBNXfD3k4V+Qcxn/3rm9r2tqiDa20CwuhkiXOC/kJ3hKVQOvKlswM4PhPuNstrvKTySZ4yjlgXHMu1Rg8lYv8qQsFUFTLRe89ikA0Wp7y1nMjOaoYSpQIRxoBi+bU19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by CO1PR11MB5010.namprd11.prod.outlook.com (2603:10b6:303:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 20:38:18 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 20:38:18 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Thread-Topic: [PATCH v2] drm/xe: highlight reserved PAT entries in dump output
Thread-Index: AQHcSS1gdKDGQw+bP0WTfr2LZRDRC7Ta5BcAgAA1jsCAAAdPAIAABTtA
Date: Thu, 30 Oct 2025 20:38:18 +0000
Message-ID: <SA3PR11MB80460315A0B4E7818109DF0686FBA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <20251029233959.778689-1-x.wang@intel.com>
 <20251030163538.GT1207432@mdroper-desk1.amr.corp.intel.com>
 <SA3PR11MB8046353AE0BBAE6A4A804C6F86FBA@SA3PR11MB8046.namprd11.prod.outlook.com>
 <20251030201328.GI2806654@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251030201328.GI2806654@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|CO1PR11MB5010:EE_
x-ms-office365-filtering-correlation-id: 23933189-79b0-48bb-2d96-08de17f44262
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|42112799006|1800799024|10070799003|38070700021|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?wYdcm3TRxgkO8ZRdf3FN9rSCwPWAUehisjlrnKyVp4pVwF3Br6pNDX+lAMtM?=
 =?us-ascii?Q?jfFJVZ5wLxs6UrLozkuNNLgHXxupsDM784Sy5GLwBxhuuEsWK6Uz1mxhzJhy?=
 =?us-ascii?Q?JI3ZCRtnuRZXrdYBgA5T6JPy+Pow3MUqZfh1q+Tx+fgwv9ohfYqls+zKt7BR?=
 =?us-ascii?Q?GZqviWDgjMVPpoubQ6kEFAOJNxJQvwTbSBfKwDXEPAcwFUrF7Nbx/IKR0qdm?=
 =?us-ascii?Q?Oa08McfwVAnAZKQKIU4Q8tAurzDfuaE19JmAzQrfo18LSnAulZ6OtLKMLhj+?=
 =?us-ascii?Q?GVDuDU07hn05k3G/UwBiuRdihPsrrPjkVAj8EGuUo2TdhjuTKYCU5evJr9q+?=
 =?us-ascii?Q?EcWN3BzmfXH//LR13YDpBjqSHSnFTPwvJuXeO+XiMCHpMe5e8mCE/FQm+FoG?=
 =?us-ascii?Q?rQP9jASaAfjNeDbfL05V7YBlvkSWgoXHOuX2VA9EEgJQTIPocN482cg2VQSh?=
 =?us-ascii?Q?8rKOTX5qDmvPfUlqwUMIBq/yqbzQtGFuD0mqqh6SjhhD45IQR1d9jcDV+Q9b?=
 =?us-ascii?Q?QcJpipWysbbtILxFjvKpXCl335ZC6TeCoh/5u7/MiTsWw4ZhBiYtpgheuDED?=
 =?us-ascii?Q?yFOag4BYZrpz97KrOKVtZ8bSBw5wJfbGTYqiyKuhFJAVQ+6Tfh57zjpqRxiI?=
 =?us-ascii?Q?nxQG1BVnpHYjCaVfmFV2saZZD+yGdmrjYXTID1j3kwuE2rtXWAIyPUoH36Ez?=
 =?us-ascii?Q?K09wkCBmiGOddTtYJEMLFTiw+TemoizS6dW4HErXlv4X+8ZMfviExBYY1wO2?=
 =?us-ascii?Q?4m2vDaHhrFDM1f9gax2Cc3pViYHxjhWcOW7HxjVWBxqpViapqmeTWYkQ16OE?=
 =?us-ascii?Q?7UVpXJeDqi5nGzcRdde7aZWwjSvzD5v14vfG8HwataFK3GPglAtPAw3SAUD7?=
 =?us-ascii?Q?5LkVwQ++D1kTfUvLo11s/p8DoJELlRpiLf/YLAKwadlreBUfcmvqr2lqE/dM?=
 =?us-ascii?Q?GozU0Rq2DdTjRl8CFQS9A5MhNl2UNuYHCOUoYRgaRtK0MNEssp0VtK6GDp1D?=
 =?us-ascii?Q?USjcJvQii8Yv/R+RCrczfMnzJ2Se6YFeXUJjt/8JX7kLNnxISUYjENZ3+hKD?=
 =?us-ascii?Q?sYzgG5GA1cKTfJqE7DIUQ19i3vlDBsCPeKEZMiFIu0Z5iXNJFJGcCWFvDY9N?=
 =?us-ascii?Q?nWKGdQxHhALVBAMswgt+jxsVkCSYyoErjmHKcicw+CeSSli22geTATW3gGRf?=
 =?us-ascii?Q?axR6ElR6hqK0ozpNQMasQCjphShmtFYwQLC8YObrS10LZO7A9zjynR+LaT4+?=
 =?us-ascii?Q?FlbAdZzRpctrJe5nsnBzYHXq2kI5brAV7clBlXLx7Yj6sNApR1uqiMUNG9Nv?=
 =?us-ascii?Q?DbEwWrB2t2DDT3DYH/aW7vbFf9/JDbWumIQjvRh1SAMUoRYClOQCbZplehcB?=
 =?us-ascii?Q?IjvkLQ8pgXtv3Fs8RVcUIS0sJee36zTY7WjCwwx2dhWfnPS14vmzydPvAFnf?=
 =?us-ascii?Q?es2q8CfldQn06dXOCqYpI3O1qQGMQCCu/kIiXnghHt1P0b3arvife6Stl7Zf?=
 =?us-ascii?Q?B85+nnX0pD8xYpzCe6UGq1VIf9vygaqPbERK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(42112799006)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LDYOQsHsPs148f5DuOp0VBuXkSkIlbb9ZOb/rH1wq4bXP5ewMk3MRfYJzibM?=
 =?us-ascii?Q?lUH/cUzc3WTsYMWBG7E2PxCvbJuIFl1SlmgzKSv0mSB0XK9bRvRMQkDwo3+r?=
 =?us-ascii?Q?PozRWi2a56HsWqtEpEmo0inlX7wg7+/t6PvatZ+j+/+MSR6OkmKkADuMLxTV?=
 =?us-ascii?Q?0QSjGJaqOiZdj4iAXzSntb8cEGT0PEJ0VzxdnJaoP7WDVfTuoMnCGoaLmydR?=
 =?us-ascii?Q?GGaxIpc7R/GnD4q5pytdcq0zpPhMmrmKWcWUQYBKTbD8GR/AcrBtO3vSu+bP?=
 =?us-ascii?Q?m5IAGkw8NjRy8RfiNf13VP8NmN8YsN48gLtmAg0zmitMnDi1u8tolzLIfeaT?=
 =?us-ascii?Q?x0ceMi7D2C1YkgFrP7D5ND5Zn+jwteIxQwIav8sV5vKBZkpw7IbMhr6n91op?=
 =?us-ascii?Q?tdA3FqaU6ZbRCTjnQcLM5Ch+tWDuVQk8uZbIqNnlNkOitz/KRcMLMJ6WJuFU?=
 =?us-ascii?Q?l/FCHgmLS+ece7Cbf/Lgv6QrvDLv7VwvPAWGhMu4AuN0yVhTYYFMDn/qeklY?=
 =?us-ascii?Q?RrkRW/vS2rJ82dW6ABPNemZqjpoKPDPXGHO+wZkzE0O6Y8an8P+4fyrho3rh?=
 =?us-ascii?Q?ved9xqS2KkLaM9j2tc9Zq7zyygDeV05VPsw2Xa3xJakNAAaXekYeKDfwXuPC?=
 =?us-ascii?Q?Px9w7qFzJjh+QEFedOznZkzBazRU69yJTXzIeUCbjViP8y1PcuYomHtvHXtl?=
 =?us-ascii?Q?jShql8UbFnZ9iV3pIBb0BjUrV6/5uW+9qTj0B2Kyj8UiN3NZu9euqsIJN95r?=
 =?us-ascii?Q?+Sg2cZkECDaPqVCpn8fmihtJmQ7le2DY7GXxMPiThxw4Th6CPzX2lSLfwWST?=
 =?us-ascii?Q?n0+N2MbBTvotMyD3Zkv6qaiCEy6A0HsUzuMwawCANduUtdqzfF7/oSPpBTB+?=
 =?us-ascii?Q?Ml+MRb9Xt8u7FkknGJkPVy3yWJK4rie+70cTEFSRV9CeQNRN3bB9uZ346v44?=
 =?us-ascii?Q?TBYSWJ/TKR0N5EjqoAm2auAguehHGFTASoSaZ3bUOEwXLyAn7HpxdbYYravt?=
 =?us-ascii?Q?vAA2eD64nKR7yyR8Lt9dF5hx4M2AkkitnGeWEIcC12U3v+1DXq6I5tzoynOO?=
 =?us-ascii?Q?vTL8bRBy/AmUICPyKfTXQITDGBVwRfCmv3D3848jXQMEl0jS9NyN5gkU0PYO?=
 =?us-ascii?Q?xJy8Jawfz3zxW/Y8NYuOoNNZ6nCxd0JJu+sQVz/oOascIS8f1kt4hEsg6r76?=
 =?us-ascii?Q?/kTMPRF+VoLzGsmJFK6FAInflNggFXmna3UFNWw5GiqO6bRqO6DXFblQUahp?=
 =?us-ascii?Q?WgO+T+VJp8JOrdHuebEN6CjfMDoK8wjXrDyxTWwjELX6v0R2mW5p+p+Wjc1L?=
 =?us-ascii?Q?7JzylU4BPqi3CadmN+XSNsJhwQaNKHomvAEv6V5p5oldwIQ3SfdX4FzVZsYV?=
 =?us-ascii?Q?CrfUqJ8FnQ74yuupg7Z4h7Uk4+0+iiNN4uWC07f4AF/Hxujy62E8AQsMnEjD?=
 =?us-ascii?Q?vR0ItIHtvlkrU2MCteCNWQaeg1nS71U5XVnskoOG7mjO4uJ7LhdVqag+dZxK?=
 =?us-ascii?Q?yi07xhVejJusawG5FLxcgMgzJArkvwMVtFD6cmAXxt55RAHoqDmbXWx0L5bv?=
 =?us-ascii?Q?md9j4DyE2uly8wJJ0NA4leUSIdMZjK9pjiSPlLSvphnlaZLcZfznzfilFuqO?=
 =?us-ascii?Q?4X7poIFqjeLTbYGvigPGnkw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23933189-79b0-48bb-2d96-08de17f44262
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 20:38:18.5850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J7iIYvmagrxtidMJjRCEMJI0OoGnMht6/3dvosyolgzyuquMSuqvUa517QNP0aeLtj3TZpiOJreq6o1CAL5eFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5010
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, October 30, 2025 13:13
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.c=
om>
> Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in dump ou=
tput
>=20
> On Thu, Oct 30, 2025 at 12:55:12PM -0700, Wang, X wrote:
> >
> >
> > > -----Original Message-----
> > > From: Roper, Matthew D <matthew.d.roper@intel.com>
> > > Sent: Thursday, October 30, 2025 09:36
> > > To: Wang, X <x.wang@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng
> > > <shuicheng.lin@intel.com>
> > > Subject: Re: [PATCH v2] drm/xe: highlight reserved PAT entries in
> > > dump output
> > >
> > > On Wed, Oct 29, 2025 at 11:39:59PM +0000, Xin Wang wrote:
> > > > Enhance the PAT table dump by marking reserved entries with an
> > > > asterisk (*) for improved readability and debugging.
> > > >
> > > > V2:
> > > >   Added a note in the "PAT table" header explaining the meaning of
> > > > the
> > > > asterisk(*) to improve clarity for readers. (Matt Roper)
> > > >
> > > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pat.c | 12 ++++++------
> > > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pat.c
> > > > b/drivers/gpu/drm/xe/xe_pat.c index 7649b554942a..d9f9d5bb8e5d
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > > @@ -368,7 +368,7 @@ static int xe2_dump(struct xe_gt *gt, struct
> > > drm_printer *p)
> > > >  	if (!fw_ref)
> > > >  		return -ETIMEDOUT;
> > > >
> > > > -	drm_printf(p, "PAT table:\n");
> > > > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> > > >
> > > >  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> > > >  		if (xe_gt_is_media_type(gt))
> > > > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> > > drm_printer *p)
> > > >  		else
> > > >  			pat =3D xe_gt_mcr_unicast_read_any(gt,
> > > XE_REG_MCR(_PAT_INDEX(i)));
> > > >
> > > > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)\n", i,
> > > > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)%s\n",
> > > > +i,
> > > >  			   !!(pat & XE2_NO_PROMOTE),
> > > >  			   !!(pat & XE2_COMP_EN),
> > > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > > -			   pat);
> > > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > >
> > > I think you still need to add a 'valid' field to struct xe_pat_table
> > > (and then set it as part of XE2_PAT()), right?  At the moment your
> > > patch is still checking against coh_mode, which is going to mark a bu=
nch of
> legitimate entries as reserved.
> > >
> >
> > The .coh_mode has been set to XE_COH_NONE(1) or
> > XE_COH_AT_LEAST_1WAY(2) in the XE2_PAT() macro, for the reserved entry
> the .coh_mode value will be zero.
> > So, it should be ok to use this value as the valid determiner.
> >
> > If we change the definition of XE_COH_NONE to 0 then we need a .valid
> field in xe_pat_table.
> >
> > 	/**
> > 	 * @coh_mode: The GPU coherency mode that @value maps to.
> > 	 */
> > #define XE_COH_NONE          1
> > #define XE_COH_AT_LEAST_1WAY 2
> > 	u16 coh_mode;
>=20
> I guess if the only values we set right now are non-zero then this works =
out
> okay at the moment.  But it still seems unnecessarily fragile since there=
's
> nothing documenting that we're relying on coh_mode=3D=3D0 to imply someth=
ing
> unrelated to coherency.  If someone reworks PAT coherency handling in the
> future and changes the specific enum values used here, it would be easy f=
or
> them to break the valid/reserved status of the fields since it's not obvi=
ous that
> we're relying on 0 having a special meaning for anything not related to
> coherency.
>=20
> So we either need to document that we're relying on this clearly (both in=
 code
> comments and in the commit message), or we should just go ahead and
> create a dedicated 'valid' flag to help prevent any future mistakes.
> Since the structure currently holds a u32 and a u16, there's already 16 b=
its of
> unused padding at the end of the structure which we might as well stick a
> 'flags' field into and use to track validity explicitly.
>=20
>=20

I'll go ahead and add the valid flag like you suggested, using the padding =
for a flags field.=20
That should make things much clearer and safer going forward.

Xin

> Matt
>=20
> > };
> >
> > Xin
> > >
> > > Matt
> > >
> > > >  	}
> > > >
> > > >  	/*
> > > > @@ -426,18 +426,18 @@ static int xe3p_xpc_dump(struct xe_gt *gt,
> > > > struct
> > > drm_printer *p)
> > > >  	if (!fw_ref)
> > > >  		return -ETIMEDOUT;
> > > >
> > > > -	drm_printf(p, "PAT table:\n");
> > > > +	drm_printf(p, "PAT table: (* =3D reserved entry)\n");
> > > >
> > > >  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> > > >  		pat =3D xe_gt_mcr_unicast_read_any(gt,
> > > XE_REG_MCR(_PAT_INDEX(i)));
> > > >
> > > > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > > i,
> > > > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]
> > > (%#8x)%s\n", i,
> > > >  			   !!(pat & XE2_NO_PROMOTE),
> > > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > > -			   pat);
> > > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > > >  	}
> > > >
> > > >  	/*
> > > > --
> > > > 2.43.0
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
