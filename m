Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CEDC25B79
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:53:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9876810E18B;
	Wed, 22 May 2024 16:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XZibmdnU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E9A10E004;
 Wed, 22 May 2024 16:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716396790; x=1747932790;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yUfF+Hxs8elFBUC88u6IdMYTZIRtanztMAMXPgu+KbE=;
 b=XZibmdnUPE/z4/6vMWYAfvvmIcroBpQXygdMYQ342ua2byDyIvquge4l
 1dNISGbULobeebS5rsZDCOVmiNJ4qsOooBukI7UM9L0nSwBGM7O0cZg96
 1DBIZXgUP0T85UmUtRgfViYQ6JnJkWZ9ySS3mQBQAVPNEu0/lRfiCvW4M
 CpaI9CeIqJor+vzOv5B9Efa0NLx5NetYdzMLtCafxZgA479EKktc9iVA8
 5v/a7jbXXCxU2SaHHELHnLzt7gRUz61fSr7DrusoOhgXAySed+tsTAeWO
 jMqi6VnfJtnDXl93P8QosobAraQ7fxmg2t4zq3EeBOaHAOsaUr0NRGv1h w==;
X-CSE-ConnectionGUID: Cgl4iRR+RfygalO5Bsqkdw==
X-CSE-MsgGUID: OGHSEAMtQ6ucGs9k3A/upA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="15614319"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="15614319"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:53:09 -0700
X-CSE-ConnectionGUID: fvBwdS7VQeu/wPZ/m4663w==
X-CSE-MsgGUID: 49fB+DlIRaG8/AcGqxv7jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="37738248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:53:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:53:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:53:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:53:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8N4R/l/396wWIMTXdbX48/dYxPfuRw2LZyzkYTQ1c3rNOICMVtXBKRN9m3kZxDmWOwWIufT/VHeYWZ7lDC2ZUwmfJKONLlBBJFs/2LatvT888d/JjzJ+9dSoACdGGNfBe9qEEyzn4UQbE2LdN9OSSsxs+pNo4ad3b3dj4TMFCkX60fv5IyDQcrfFptwy40q0s/u0ZLqnImRyGzE1illantdj1F65dCCTr7hZa+GKWiY3jJatphcG6HGNbKbgvinnjpLAT9SHsS8raaHdvOSfLtAk4g4tEaK6m9S+vIzb9RQpl/oomfvFxsATN/TsyU4yHY7nX/4jsNfyIqpCaCasQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ETBT0gV9qgH2ANMg1c0574P6VpdD8ymNhy/0ULRN8g=;
 b=XhmcLAF6Dy/kod4N9GQ5Lp+KYykbLJ4ihhYeXHgxI5MmSbG618jWHC2K67oQJA/SrFOfAgz5+IyQYSSP75RBVeKN8hK41nJo53dY8BkYjwFbSaOArYFvrHFUhb+1/+uRVfZ8L37aN4JuVzXRezQvtv/gpIo4rf/OltYK5hmvQPBz16DFcsfHnrWQ1aRmXuDoB0KWPYqpDcwIf/+Jf4KXi53Du3ObuAdKHZ4gP20Sc1imCgCjDBR0giaL/OkIpAZzewKWnPhnGk9l5b5Mg2MKMP9LYZGsExJ4ryfjhiECV0Ju0UxFrJMMLDxaxAlqEqwN6SRwMI1IaxSsxaxnPM6duQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DM4PR11MB6167.namprd11.prod.outlook.com (2603:10b6:8:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 16:53:05 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 16:53:05 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Thread-Topic: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Thread-Index: AQHarD0mUxkBmHBk7Uqqu25eJFFxfrGjPaYQ
Date: Wed, 22 May 2024 16:53:05 +0000
Message-ID: <SA1PR11MB6991921B29B701D3E9E0AE3592EB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
 <Zk3aEQd/2n/fuBXC@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zk3aEQd/2n/fuBXC@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DM4PR11MB6167:EE_
x-ms-office365-filtering-correlation-id: b9c4ff89-65c1-4ecf-e873-08dc7a7fa6a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?5iu0xcF4Pegf4freDKCocC9zC5g8rodTDhhmN+P9dq+4hqC5QleFtXBgfpMK?=
 =?us-ascii?Q?vxIKyBByHJsotbFoe/FU1wIMKJlek4oaD7pET94AZs1YsoXOIVQcqGVqnhCB?=
 =?us-ascii?Q?Dcsy/RvSjBr8O4a8qi3U57UeIJFmaxt+pXTvkbEBnMO9kyplADe0lxbEjbaC?=
 =?us-ascii?Q?iJ1hR2Ldww2QZ+zUarMe/cFdeL+u0vVr8VjngUTuOxEwNMDFv4iKF4ounat+?=
 =?us-ascii?Q?wFk4hLHv7WEej/bABIsCZ6n4bZyBSPEJEaTLqgFNPC7EZlQPRQ8wnSJ3knXd?=
 =?us-ascii?Q?uvS4B99Wgacj3vIzALrVXfBkz66Q5hhG6H+Gu7z+PejusEWWHZHC8LusvfHn?=
 =?us-ascii?Q?dnN7UVeV20p5azM73CB5Ad/Vjx5krBtBXmQj++ukhB6Th+brkGJZ+X+KIHN6?=
 =?us-ascii?Q?GfnCWUXjf1+FlLxA37eH4dCpzU15ZZHUbi97hc4dONpc0WYurRpF+sl5Qcek?=
 =?us-ascii?Q?TeqTQ8/MYfb9EiFzxxWz7tZUwkjTA+78fXDhnBtkBLFjSlhZ4oa1l7CfiYqH?=
 =?us-ascii?Q?hal5hsGt4mwun7rCSM6YiSVfvLaSwfyUNb9U8oiSC5u61f79t0SbQPKMU6g1?=
 =?us-ascii?Q?yJbTNb0tWF8/fY/8S7Tn+NDoV3Vf9kB8nn67BSBXYjowXJDoqUt0+mPCH6xT?=
 =?us-ascii?Q?GZNRRxJsSwB2BtuETCXhaTRlCLOyOURiQSWI+7PRoh6/OFQp2CKlstdFlCgh?=
 =?us-ascii?Q?ugdADRQRgBLBLgru6jZsdkjYZOmYyB6YKJu9iVAT2xXp/ze1jSwDKM2gZos2?=
 =?us-ascii?Q?AqhxxeBa2GNjreRuSLn37qrKOA83svvZwQjbhf4Mc2r8jYGmDqXEkzvFjnO+?=
 =?us-ascii?Q?Xpt+vXvd3n1Cg7QOsRIvzfKmt1tJxUjTCVWlOMBpoufqJXxt36pGHTrdhiXv?=
 =?us-ascii?Q?oVqEqQnc/XFypYf/mnYa9Ucoca09MuO+tdMPori2xWLBz/85coFGX6QKRXDN?=
 =?us-ascii?Q?prCUupQoih6seKr/2ZtYpoy6e4oZW8XL9Tit5P0S7Q2Q+0We1yusckRbbAWc?=
 =?us-ascii?Q?Re8uqHOiuEEK05Emx72w/G+gG+a4No7BXPx1OjATEd5gQA+2Tr74aAosyqN7?=
 =?us-ascii?Q?o5fhJNxOqQGf6Pm2ZEt9wox3QB0iq2+dlN8dgkMUUggBe1reiAVzhdj7cz6i?=
 =?us-ascii?Q?gwFgnpp76piF1JXnUBCM+DOwSHVHub+CP+FgihumNos041DBi0WyUmaBsB/L?=
 =?us-ascii?Q?K0hVCPNdkdOlRyM4DGjXx+VPq0UUUAahLm8OPz/BZARRstXCPwx814KL9Uup?=
 =?us-ascii?Q?YtR7AF+i1JLjs5pl/jfwF41IQTGJF9weG2s3+ySkbx5oZp49i1Qt6xxJ4s+t?=
 =?us-ascii?Q?ZPw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nRHaFZhe95XgvveFKnxHsJYmvzYmn8MjEWkDublSKVogImGgvgWffPxGvc1u?=
 =?us-ascii?Q?AgeK2Fj9vrf7GE8r/5prpJb5J9UwnPrTlPxYHal6holyswJt1wg53QSAlPws?=
 =?us-ascii?Q?xWIcdUO8dzMLyYc9uazV+FsmOszVVk/EpWj209cIgcX3nwIdtnTbCjkoLN8X?=
 =?us-ascii?Q?8UkNuwRkQvuP+qpD3mm7qj5JfJaZ27LusEGRwmPp/9XaNrCQfGJrktCSKjcP?=
 =?us-ascii?Q?r4zvs9sidAAvt9XyveCIsW0gbu4pZFVi4RzRqBWRJHhXsJA1fa5R3esx4oRu?=
 =?us-ascii?Q?SkEvkQMlg8L9XTDzGyMrN6INVnxzndsvCdwrNT4/EpueKWh7tpd+DzLZwIS1?=
 =?us-ascii?Q?g7EgQ2EqwL5UzSYHR46hMSccwFcorQwGf3OfgEVnyB8pPOJuX16TWprh81ab?=
 =?us-ascii?Q?9snqtJvoWdvxcMsxYdD9V7qdeiRUrilEquFe8Ylr7a6iGLVwo/Uiz2eMZVyG?=
 =?us-ascii?Q?ggko96JUbt+rux2cAEX9F4ipsYc1zSIYGh5fUe0a36c6JMdz+Y91DE5xGwEP?=
 =?us-ascii?Q?g57OrN+FnRCSPjxjPxk78MF1a3qPgQVtxOIO8B9F2I0p/jGisYPwNU0vKW0C?=
 =?us-ascii?Q?/HVuuEl9mgEG/NRSXgJGkIKI8D0s6Sfb7byan8C6kxJFlXR4CkS36VFwPG0X?=
 =?us-ascii?Q?KN+8aSaUHQA38lI8De7UrMnYcIKQC5sm8q3xXX8S93W9p9BKOPW0M5HkkqPq?=
 =?us-ascii?Q?sb25aa6HAoO2RSkAS+/tZ0i6DQOkg7by9P9QZJQq0uhb2V797c2VCPdtW66X?=
 =?us-ascii?Q?cXM80zJOyk+M7pZT0pCSkbC2eRgmmq68WenR4cDmA3fufjm+LCW5L4uCqclF?=
 =?us-ascii?Q?+P+dtcX5rtJZ7Yt8ejPJ3Vi0wDrYV4uo056Z7LKDVd+RQMu7aI2MVyq+RNF/?=
 =?us-ascii?Q?c67WNk9B9maEvPh7lCT3nuqxIE3wCCnTzXdAhKqn4zpFprvexzvE99/FgI2S?=
 =?us-ascii?Q?3tnfUrX3bpsRcpcAbqyClAmw390o8k3WKsAKYxDqNNhjHfhDew8VHA8jYecw?=
 =?us-ascii?Q?X/huiFaQ8AldS0N59flsVf6PNu51GAWI5ScRT+7Z67JRnngWaDDapi6iF6zC?=
 =?us-ascii?Q?LHkNnk/N/ayXnRT0qIon+LKsmZIIfngl4Nd5z2NvAbqg61JOpdxMFG2lSmRY?=
 =?us-ascii?Q?keFTXlA3snG5KJf7MHqx508dMIy7YZFT6Go7Sil5801F94WZyZSUPQ48FU3F?=
 =?us-ascii?Q?SS3cDLfSJ+MriYgOQhjzCm06BbrdhjD0exTGp7pp8FF9qXHcIgl4K4WxQ/ZL?=
 =?us-ascii?Q?BvVfYmJa8gDWwjJwHowP3qJYMncC6qU9AofAc2OnecD/NF1DGkUJzWrSx/Xo?=
 =?us-ascii?Q?P6ng8FgnUS11JYcoH4i1QiERHBy0bbzBr3sjbmw0ox+a9Ua+SKHGZuM5Xkof?=
 =?us-ascii?Q?bxTg/FCNMx8/a1CWJTusB/DJuC15q/Wxd82NiTsPmB2FqN4NuqV2MzSeaAZ5?=
 =?us-ascii?Q?xD4dMG5/on2GDuTYcR4pBCFXFOyEE+sLI4yJUocYIDkeqSYiCIP/lD62D66v?=
 =?us-ascii?Q?mO6XwkW6Y0+vyCg7jqqALOyrmzInv/4QPrnYX5QzO5Li3f4bsT4jG1bAf5Xe?=
 =?us-ascii?Q?0AhyyiNBxxb6MqiF6EQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c4ff89-65c1-4ecf-e873-08dc7a7fa6a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 16:53:05.4771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yC8GanzaQdgsmfpVts+VCdj0MA6iV3hwiW1NSx5y9QQawwNXkjCAFqS4mDMQvf8LHlYQWul1SgK6DjeClaGjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6167
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

Hi Matt,

We will investigate your tests and see whether we can achieve the same cove=
rage with our approach.

See also comments inline.

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, May 22, 2024 7:42 AM
> To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>; intel-xe@lists.freedesktop.org; Zeng, Oak
> <oak.zeng@intel.com>
> Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Sha=
red
> Virtual Memory (SVM)
>=20
> On Wed, May 22, 2024 at 11:38:18AM +0000, Matthew Brost wrote:
> > On Fri, May 17, 2024 at 05:16:48PM +0530, Bommu Krishnaiah wrote:
> > > Introduce helper functions for object creation, binding, submission,
> > > and destruction, applicable for SVM and other tests
> > >
> > > xe-basic test is validating the helper function introduced in 'lib/xe=
/xe_util:
> helper function'
> > >
> > > svm test cases:
> > > svm-basic-malloc
> > > svm-basic-mmap
> > > svm-random-access
> > > svm-huge-page
> > > svm-atomic-access
> > > svm-atomic-access
> > > svm_invalid_va
> > > svm-mprotect
> > > svm-benchmark
> > > svm-sparse-access
> > >
> >
> > There's a lot here I dislike. Let me be direct.
> >
> > Firstly, this isn't an SVM test; it explicitly binds userptrs and BOs. =
So using
> > SVM prefixes in the test names doesn't make sense.=20

It is SVM test. Those test use BO for command (batch) buffer. But the buffe=
r GPU read/write is malloc'ed or mmap'ed. So it does test SVM/system alloca=
tor functionality.

Malloc'ed and mmap'ed memory can also be used for command buffer. We can ad=
d a test case.=20


And having RBs with
> those
> > names makes even less sense. With that; This email is directed at
> EVERYONE
> > replying to this series.
> >
>=20
> Didn't send everyone, CCing interested parties.
>=20
> > At a high level, I've expressed my views on generic helpers hindering t=
he
> > ability to create truly powerful tests that provide the necessary cover=
age
> for a
> > complex driver. See my thoughts here [1] [2]. I don't see anything here
> that
> > comes close to addressing my concerns.=20

I replied again to [1] with more details. Please take a look.


These tests are so simple they
> won't find
> > any bugs in the KMD beyond the implementation being completely broken.
> >

Agree those tests in this series are simple. But this is just a start. We p=
lan to do more complex tests which are documented in https://jira.devtools.=
intel.com/browse/VLK-59767

We will also look at your series to see whether we can have the same covera=
ge.


> > This is what I think an SVM test should look like [3] (for the record, =
I have
> > shared an eariler baseline of this code too). While it has some complex
> coding
> > patterns, once understood by a developer, it's quite easy to extend for=
 a
> new
> > test case. Let me give an example...
> >
> > Take a look at this diff [4]. It's a few lines of code that add HUGE_TL=
B
> > testing. This simple change spawns over 100 tests of various varieties =
(e.g.,
> a
> > single exec with HUGE_TLB, two execs, many execs, multi-threaded
> versions,
> > multi-process versions, etc...).
> >
> > Before change:
> > ./build/tests/xe_exec_system_allocator --l | wc
> >     938     938   32872
> >
> > After change:
> > ./build/tests/xe_exec_system_allocator --l | wc
> >    1070    1070   37852
> >
> > Being extendable like this ultimately reduces maintenance costs over ti=
me.
> >
> > The test I've shared creates true coverage and is just a starting point=
. It will
> > need to become more complex over time as the SVM uAPI grows.
> >
> > I suggest investing the time to learn how the code I've shared works an=
d
> develop
> > within that framework. If the same level of coverage/extendability can =
be
> > achieved with helpers, great. Anything less, in either area, I don't th=
ink is
> > acceptable.

There are two fundamental design difference b/t your approach and the appro=
ach we applied here:

1) Whether to create/use helper functions:

Our helper functions created concept of xe-buffer, xe-command-buffer. I sti=
ll think with helper functions, we can simply test writing.

2) use one big test to test many functionalities vs many small tests, each =
test one functionality

It is obvious, our approach is much easier to maintain and understand.

So the key is, whether we can achieve the same coverage as your series. As =
said, we will take a closer look of your series and give it a try.

Oak

> >
> > Matt
> >
> > I can't find PW links for [1][2] so instead have shared the email threa=
d
> subject
> > lines. Everyone on this email was on those chains as well.
> >
> > [1] [PATCH RFC i-g-t 0/2] helper function
> > [2] [PATCH] lib/xe/xe_util: Creating the helper functions
> > [3]
> https://patchwork.freedesktop.org/patch/594807/?series=3D133846&rev=3D1
> > [4] https://pastebin.com/jUN5BwUy
> >
> > > svm kernel implimentation:
> > > https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> > > branch: origin/drm-xe-next-svm-unify-userptr
> > >
> > > v2 igt patch: https://patchwork.freedesktop.org/series/133096/
> > >
> > > Note: xe-basic test is validated without SVM. Remaining tests are not
> validated because the SVM driver code is still under development
> > >
> > > Bommu Krishnaiah (10):
> > >   lib/xe/xe_util: Introduce helper functions for buffer creation and
> > >     command submission etc
> > >   tests/intel/xe_svm: basic xe-basic test
> > >   tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
> > >   tests/intel/xe_svm: add random access test for SVM
> > >   tests/intel/xe_svm: add huge page access test for SVM
> > >   tests/intel/xe_svm: Add support for GPU atomic access test for svm
> > >   tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
> > >     functionality with invalid address access
> > >   tests/intel/xe_svm: Add svm-benchmark test to measure SVM
> performance
> > >     with a simple benchmark
> > >   tests/intel/xe_svm: Add svm-mprotect test to verify SVM functionali=
ty
> > >     with read-only memory access
> > >   tests/intel/xe_svm: Add svm-sparse-access test to verify sparsely
> > >     accessing two memory locations with SVM
> > >
> > >  include/drm-uapi/xe_drm.h |   1 +
> > >  lib/xe/xe_util.c          | 214 +++++++++++++++++
> > >  lib/xe/xe_util.h          |  40 ++++
> > >  tests/intel/xe_svm.c      | 476
> ++++++++++++++++++++++++++++++++++++++
> > >  tests/meson.build         |   1 +
> > >  5 files changed, 732 insertions(+)
> > >  create mode 100644 tests/intel/xe_svm.c
> > >
> > > --
> > > 2.25.1
> > >
