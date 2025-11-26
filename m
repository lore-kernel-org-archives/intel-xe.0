Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0938FD10373
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 02:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1DB10E4F7;
	Wed, 26 Nov 2025 02:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UT/tG3Vl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B0B10E4F7
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Nov 2025 02:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764124448; x=1795660448;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2cgUd3HX70bXSQ65vZWhYqjaXb6I5WTdgdtYwFI1vF4=;
 b=UT/tG3VlAMzbjplZ8Lb5QRkDfucznqSdzqX/DoEsAu6fwhDdsa2It3+U
 XNdiW50jU/qeTDW4DWTUuaLHwI3QMHB4/C5gicAdyKRdSyq2aPWPt1Io1
 a8Sinc/Qe7GugV31SDYoifKJgSpE8UT9Ft2tsgBLxAyKWJCcA5HHgMeph
 sFTli5FKUJXJMvpu4oiTdk3TRdTIsLg/3E1q+SuSEy/FzwBdk81JOPGc2
 g6mhOq+qRevsrKuqS0jgL9seZ7Lrm9oGZw77k/w1akSZa+oyL96PDPcJM
 a53ROztLE1qqj4iFLLcNOSC/BBVooAmQu3f9jgUZvr+Tzi7TO/oj2TFG3 Q==;
X-CSE-ConnectionGUID: jnQW6KSAQzGfgJh2l8fvbg==
X-CSE-MsgGUID: gdIgakznTIeXohRX2U4k0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76774667"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76774667"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 18:34:07 -0800
X-CSE-ConnectionGUID: Umrx5rskTCiX3O8k0A7czw==
X-CSE-MsgGUID: 9VHbg82eS6ORlb86kDNbxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="197288699"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 18:34:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 18:34:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 18:34:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 18:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcogqSzC/Bf+XVgfQ5GZs7C0zmSXd0uAin1qcBldPLN5m9jIpHv3NIrhayEqeGrhFW3fGlZmCxqGgnzcfshTSlFatY6pgoJGHmbDMC8XRvolHONqwZUOum6HNjExA9s2gzOydRYPfGENTzYnrvK1eG8A4q7iPGgWYb9gzCyHpv808F9kuBWmwqUlBSEKTVv4/Mn8t68qrRRGSik8M70SkYmhN0YtFGif2t/5W5bciGXbh9Q1uVTd4IiDJhmwMvihuCkjXzOOwKyO5Rwp/tnbvXd0dGIqdTMquUUikLNt/Uqy9M6OFaOgGPX+3is3lNDnf+gLD07WmPahSweec2uGWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUsB05tcfVPTLT+BibWRfGpt3tSyIeA3OPbGY+B4N7A=;
 b=bKS6rGMBexbI5O/XobIivNrU5uF2vtLD6yoD3Tb5WFJecDscqoJACDBFZqiLVug4goILDrHeDu7AnInBcP/zi+Anj6n42VqEFHwK8g+aqCjepgxNG5HDGeSaQEEmtzQH629V4ZUeyv9NFygack5A1ZgTgqkDcNfNth/iTEc/P29zm4/3AadbntK9Jj0zAHuQuiyDhquXF3zqQp7R5XU6qpmRXgzZzFyB2k1HS/5HUgh3xTaPbQtXbXvSRvqAyPCuKNnYf9EWDTkiq7MFHv/Do0lPzV+/P0nLBoW9wyO2YF4ByBY6a5Wq4kEau3kJ+PvsRpLu2RsA+4ax1Sb+a54bzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS4PPFCECA32305.namprd11.prod.outlook.com (2603:10b6:f:fc02::51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 02:33:56 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.016; Wed, 26 Nov 2025
 02:33:55 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Topic: [PATCH 06/11] drm/xe: Create page reclaim list on unbind
Thread-Index: AQHcWGqafCc1cGxJfkCPRCmuyqMP+bT/GKGAgAM0OFCAAXaKgIAAAYtAgAAHuACAAAB74IAAOYyAgAAqpDA=
Date: Wed, 26 Nov 2025 02:33:55 +0000
Message-ID: <SA1PR11MB883986543DA6EEB904179856AADEA@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-7-brian3.nguyen@intel.com>
 <aSIMb4EREPix3SDK@lstrano-desk.jf.intel.com>
 <SA1PR11MB883987BC9C5A7FCAE239C273AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX2qxiSvdNrXvbX@lstrano-desk.jf.intel.com>
 <SA1PR11MB88393D5D019B5943600FCBA4AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSX+cMn4sFswa2HE@lstrano-desk.jf.intel.com>
 <SA1PR11MB88399ACA52B1883BE83A6D40AAD1A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aSYvHf9WLnGGWWxq@lstrano-desk.jf.intel.com>
In-Reply-To: <aSYvHf9WLnGGWWxq@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS4PPFCECA32305:EE_
x-ms-office365-filtering-correlation-id: 58fd9a8a-252d-47ff-7f9c-08de2c943f1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jt+xPADqUm+c35YKpCmuzwQOlzIv4kRT584lpvNwlb9tulD2rhmorXHc3A5w?=
 =?us-ascii?Q?KRS7xSHlyfLGDZl4uAKEtCk7bFREAEwy+xt9lTLPuOQysmjBnHC04Q+b7BKy?=
 =?us-ascii?Q?13wnAanl2zpd6AVRTc5lPnXD4ywCx4ena32nki07tK/We32sQYF6f7WrgqvS?=
 =?us-ascii?Q?deYQHrdU585kr4FACzLNj0KV1nQRhhQEVsFr55EE4Pb53RAUjLDZiHbzh09L?=
 =?us-ascii?Q?uyOHEL5+T1b7iL7yLLQy/JSpDX4oypgCA4dfEM0Ua+NHCTW67Bwj+O/FVMHb?=
 =?us-ascii?Q?Ord1ArGgTXGZxcVj9xcmU4yLZ6vpR5YNgpenK1LaVwE5V3tQiQXdqP6YpIc4?=
 =?us-ascii?Q?t/Vcd3h91txB0Wk34xQrAsiaZwNDgVCHQTrvsUq5la/2F8cRmo+aBCls9zuW?=
 =?us-ascii?Q?5mppy62NyowjIG6WEcu9c7n8XJRdCvhEOAYF87MRSj/FpIzCmUG8tEEz2avm?=
 =?us-ascii?Q?otnK6Ld5+EPFZsUKhaUHs1SK0y18DOfNQgyvVEECD4A3TeUfAyjNJzaSFidg?=
 =?us-ascii?Q?2R59qqdIAwr85rTCe1ML5mSCtJiTbLF5QIncvEtgtv/yd607lhbL5HNLm4CM?=
 =?us-ascii?Q?RJwS+Bhd3ICP8s3uuIri21qOczBbiMS+xbqsltKqG4ouaRAF1sV5KBuHdW+D?=
 =?us-ascii?Q?B1sAQKE2fIR8LlUtRHxXaHjaAwBXIo3hFO2qTVqQxDjCdPYS7KWB0HfB54og?=
 =?us-ascii?Q?1PlgyZp72cmBnS0qQ/dm8h+/6HPukkd5UqV1uRlMNqjwz78DhNqkHlRGAHAL?=
 =?us-ascii?Q?4htyXCHtlFFZ8LtMdfoJho6ib8is1UugD8OCQBGm03al2qHUVx0WEWb9D9Aj?=
 =?us-ascii?Q?utGxMOKhpZKmNz8NwPrKwM/tCLZ+KV96qRDlRitpEGjkq1c7kqDbJcYjcdkk?=
 =?us-ascii?Q?Xoi4EGHZoFL9PdN/Wr117TMhbzOWjIDT7hnnNHnBVaUBXGLomUSoTltGW3KP?=
 =?us-ascii?Q?zImYnfPVBa9XwUD2houMqqcAcKQpGy+BYFem9wtYjhpsL2seEqMkq9rm3Yl0?=
 =?us-ascii?Q?+bSDeSmNa1txXgxOKue6eNse9htPGUzh3++eDATh2ONaXRPTdC7GCYJl9NXc?=
 =?us-ascii?Q?CCjwOCZGHO1ns6XJd5UPfuGAfq7r+eQbrzU0eW98h+KhOd+zuHgMubMjXcaA?=
 =?us-ascii?Q?EzilwXkukyzpis9i0lpLA5sE/iPXJJH1PpIOVWaeKNPXoaCtHiqktlJQk3+D?=
 =?us-ascii?Q?b/Bk3/7q19HUB+HFwEaZgRbhfRXTVDjFKa7sCFG+OAYxRRo90f0phGo4og0n?=
 =?us-ascii?Q?4Q5x9ZncQVdtrQIuIi9Zk77Eky77hVwby6lSv0360J8YBud4/XSrSVtNOBeV?=
 =?us-ascii?Q?3vaqJ7Fmbh4PJZAYxI2mU5LEEZ8XhPlsL4rFgQQRy8DeDYfeT6GX6m7aesCR?=
 =?us-ascii?Q?5stH/9tacZuLCWC0VK7RyHTJobvcsove81LSlQWP9GiL3L9uW4BO0X2uqttf?=
 =?us-ascii?Q?XyE4wmM/CJl5wIwIIKhrz7LlvmOS6OIicBVZML9TwvcGe970+iBf0WwF3VFN?=
 =?us-ascii?Q?E6jhSx/G7ejmsEcK7b90QoTOMP4N4YxfLiex?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LOchX6kpIGDHGejQcgxSFQWeUIT48jYCCIAx6CKaFJEID0Y5XGsgMq4tptOI?=
 =?us-ascii?Q?XVLhnjfpfnraP4uidG6W2pcrnHonMvCGa3ClzEvvAtFM+3uLAWj7Rxj6qLGr?=
 =?us-ascii?Q?+KfBtiPwWCH4FJwfkzce8i0l/cbnzfyVJeSW92aaY4XIOZcHSgUZGRawQSPt?=
 =?us-ascii?Q?SWPGYWfrhwYEQ8AwdzqdrJPENM3++GKy/rK1KoGze/aIfkraoafsY39aMyYg?=
 =?us-ascii?Q?r/BCSlasyi1MoHvFLrRr2DVEAak+uXkA5q98qe7qZB2pK7cZYwbjWCR9ljdz?=
 =?us-ascii?Q?YEY480v7ZARNUUgzZb470LJW1l2Mr5ibPCIIZp3TX145eG/hiXvT/C0NPlfm?=
 =?us-ascii?Q?mldwai8hSwUQx0x/ukneF0C0Pyk25q+qA38i/C83F6U4V2LIIxQ7UF7PJ+Ta?=
 =?us-ascii?Q?qG4TZKqsP5BJqKlJ2q0ymUwQuJcxchhC9DjQ1UsZ/QFhlvJ1ePE5xo8AOJV1?=
 =?us-ascii?Q?sWAVewbvxFUKv3sHt2EyRAiOvmLmcdcgaEKQF/UPt1dEHlGuKstqDVwAMlfv?=
 =?us-ascii?Q?SiCMvzWNpXnPQ9ToZc2wH6pivAsrIR0v5gmWCzQN2VGG0w9s9ETtd9W89xep?=
 =?us-ascii?Q?/biTOmAcbKRLo7OUW7RibIAqDMZich68psES6LlYSc8EoPAlKjub2N3+CqCC?=
 =?us-ascii?Q?2gyvcF9KShrRwBYtf0Sr5gFsZqa1kAOxEwjzGa87EbBzbbj/PMs5sypMV3QK?=
 =?us-ascii?Q?6wAtDbhdg+vt+vf/Dwh9VoNdf3vFwiaTdXMZbGVJCthZv4yNELRuyjvjNJQN?=
 =?us-ascii?Q?y9wMz5Rq5J1nNR22InAKaPUWIrkVAkOcm+gtu2wkg+YFpXujy86ZJu+zm3x/?=
 =?us-ascii?Q?ViqSphXtsjDPPPt8b5MgDl6L24rZNJhPIZgfgApdo8/RAC+zKMz4DSthmCa3?=
 =?us-ascii?Q?V1jhsNEjnQg11eSaP5Dw9DbzVIpjkJ9SMc55A92DWpJaFfjPBjXiYIm8xqrG?=
 =?us-ascii?Q?xVfHjftpCwvxPqwZpLyjn8EVt/NcqgcoPIb8g0+V5VTRUD+tjxRyd3TBGoKF?=
 =?us-ascii?Q?lwkuxv7VM2LDLEgiGkHFiqjr/XHudTpKMD2pxpXkQTfF9l7XbwXuVAkRXqrS?=
 =?us-ascii?Q?uNgl0MO5lsZrfH3DpAbzIAJau6xgUJIkRUJb5JsjTrXJVdSoikAWix/sCKUn?=
 =?us-ascii?Q?jms3nO4SzgE4bM5k1hrXK4zhNm7aKIDx1QYgtAvU8B5hX032cKS/HjZiwySX?=
 =?us-ascii?Q?d3o/zr3pEf4+HjIT1rgvP6Sp5cjhSZeJHpr4141VqSuya6qBlXhrpAuicNcA?=
 =?us-ascii?Q?KU5okPq2N+D20X3mQN4UILeeNJiclMlfxz6UKLhkS9U3hrICSpF3CemuB8Z2?=
 =?us-ascii?Q?kl+TrEWlHmrb0OSYeUYK6ChiS6FNTQySwWBWhIbqjhe3Q4rTY5JizSkKEIkV?=
 =?us-ascii?Q?WEfMmOBvKUw/SaCSv+iSng+ygOE20n8TY56ui8T6lInkO1uR0ixake77FN6Q?=
 =?us-ascii?Q?n6bE4OTpM8C53mDs47uIlEhL3dbvTOmdehLkPPCBYe1zcTPjn4p0jhE2rwlc?=
 =?us-ascii?Q?pLUdFz22pQ0F8ijf3lU93s+9VZRHgaSopqz8jBUfAPrBZtrJmnt5tSelE807?=
 =?us-ascii?Q?UFHiJoSO/joRd0r6lsZCW4Ch6lmtrEzAWQ5KXzndQDqYFaNypxgkqY8VGg2w?=
 =?us-ascii?Q?OiFOTGLNp6zaXxymE6wyOx/KZ4W+TVXWN4PHwnXNdBod?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fd9a8a-252d-47ff-7f9c-08de2c943f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2025 02:33:55.8614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: En2RjVekwQq+IZmMo6q65OZ5JlNROiXOIijZCw3hEQ6zWCLXMDap0TPJDTNv48qGsuwATNZqppTNrLdz0feGgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCECA32305
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

On Tuesday, November 25, 2025 2:35 PM, Matthew Brost wrote:
> On Tue, Nov 25, 2025 at 12:46:20PM -0700, Nguyen, Brian3 wrote:
> > On Tuesday, November 25, 2025 11:07 AM, Matthew Brost wrote:
> > > On Tue, Nov 25, 2025 at 12:01:25PM -0700, Nguyen, Brian3 wrote:
> > > > On Tuesday, November 25, 2025 10:34 AM, Matthew Brost wrote:
> > > > > On Tue, Nov 25, 2025 at 04:18:19AM -0700, Nguyen, Brian3 wrote:
> > > > > > On Saturday, November 22, 2025 11:18 AM, Matthew Brost wrote:
> > > > > > > On Tue, Nov 18, 2025 at 05:05:47PM +0800, Brian Nguyen wrote:
> > > > > > > > Page reclaim list (PRL) is preparation work for the page re=
claim feature.
> > > > > > > > The PRL is firstly owned by pt_update_ops and all other
> > > > > > > > page reclaim operations will point back to this PRL. PRL
> > > > > > > > generates its entries during the unbind page walker, updati=
ng the PRL.
> > > > > > > >
> > > > > > > > This PRL is restricted to a 4K page, so 512 page entries at=
 most.
> > > > > > > >
> > > > > > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > > > > >  drivers/gpu/drm/xe/regs/xe_gtt_defs.h |   1 +
> > > > > > > >  drivers/gpu/drm/xe/xe_page_reclaim.c  |  52 ++++++++++++
> > > > > > > > drivers/gpu/drm/xe/xe_page_reclaim.h  |  49 ++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_pt.c            | 109 ++++++++++++++=
++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_pt_types.h      |   5 ++
> > > > > > > >  6 files changed, 217 insertions(+)  create mode 100644
> > > > > > > > drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > > > b/drivers/gpu/drm/xe/Makefile index
> > > > > > > > e4b273b025d2..048e6c93271c
> > > > > > > > 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > > @@ -95,6 +95,7 @@ xe-y +=3D xe_bb.o \
> > > > > > > >  	xe_oa.o \
> > > > > > > >  	xe_observation.o \
> > > > > > > >  	xe_pagefault.o \
> > > > > > > > +	xe_page_reclaim.o \
> > > > > > > >  	xe_pat.o \
> > > > > > > >  	xe_pci.o \
> > > > > > > >  	xe_pcode.o \
> > > > > > > > diff --git a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > > b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > > index 4389e5a76f89..4d83461e538b 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/regs/xe_gtt_defs.h
> > > > > > > > @@ -9,6 +9,7 @@
> > > > > > > >  #define XELPG_GGTT_PTE_PAT0	BIT_ULL(52)
> > > > > > > >  #define XELPG_GGTT_PTE_PAT1	BIT_ULL(53)
> > > > > > > >
> > > > > > > > +#define XE_PTE_ADDR_MASK	GENMASK_ULL(51, 12)
> > > > > > > >  #define GGTT_PTE_VFID		GENMASK_ULL(11, 2)
> > > > > > > >
> > > > > > > >  #define GUC_GGTT_TOP		0xFEE00000
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..a0d15efff58c
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > > > > > > > @@ -0,0 +1,52 @@
> > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > +/*
> > > > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > > > +
> > > > > > > > +#include <linux/bitfield.h> #include <linux/kref.h>
> > > > > > > > +#include <linux/mm.h> #include <linux/slab.h>
> > > > > > > > +
> > > > > > > > +#include "xe_page_reclaim.h"
> > > > > > > > +
> > > > > > > > +#include "regs/xe_gt_regs.h"
> > > > > > > > +#include "xe_assert.h"
> > > > > > > > +#include "xe_macros.h"
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * xe_page_reclaim_list_invalidate() - Mark a PRL as
> > > > > > > > +invalid
> > > > > > > > + * @prl: Page reclaim list to reset
> > > > > > > > + *
> > > > > > > > + * Clears the entries pointer and marks the list as
> > > > > > > > +invalid so
> > > > > > > > + * future use know PRL is unusable. It is expected that
> > > > > > > > +the entries
> > > > > > > > + * have already been released.
> > > > > > > > + */
> > > > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > > > +xe_page_reclaim_list
> > > > > > > > +*prl) {
> > > > > > > > +	prl->entries =3D NULL;
> > > > > > > > +	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST; }
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * xe_page_reclaim_list_alloc_entries() - Allocate page
> > > > > > > > +reclaim list entries
> > > > > > > > + * @prl: Page reclaim list to allocate entries for
> > > > > > > > + *
> > > > > > > > + * Allocate one 4K page for the PRL entries, otherwise ass=
ign prl->entries to NULL.
> > > > > > > > + */
> > > > > > > > +int xe_page_reclaim_list_alloc_entries(struct
> > > > > > > > +xe_page_reclaim_list
> > > > > > > > +*prl) {
> > > > > > > > +	struct page *page;
> > > > > > > > +
> > > > > > > > +	XE_WARN_ON(prl->entries !=3D NULL);
> > > > > > > > +	if (prl->entries)
> > > > > > > > +		return 0;
> > > > > > > > +
> > > > > > > > +	page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> > > > > > > > +	if (page) {
> > > > > > > > +		prl->entries =3D page_address(page);
> > > > > > > > +		prl->num_entries =3D 0;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	return page ? 0 : -ENOMEM; }
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..d066d7d97f79
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > > > > > > > @@ -0,0 +1,49 @@
> > > > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > > > +/*
> > > > > > > > + * Copyright (c) 2025 Intel Corporation  */
> > > > > > > > +
> > > > > > > > +#ifndef _XE_PAGE_RECLAIM_H_ #define _XE_PAGE_RECLAIM_H_
> > > > > > > > +
> > > > > > > > +#include <linux/kref.h>
> > > > > > > > +#include <linux/mm.h>
> > > > > > > > +#include <linux/slab.h>
> > > > > > > > +#include <linux/types.h>
> > > > > > > > +#include <linux/workqueue.h>
> > > > > > > > +
> > > > > > > > +#define XE_PAGE_RECLAIM_MAX_ENTRIES	512
> > > > > > > > +#define XE_PAGE_RECLAIM_LIST_MAX_SIZE	SZ_4K
> > > > > > > > +
> > > > > > > > +struct xe_guc_page_reclaim_entry {
> > > > > > > > +	u32 valid:1;
> > > > > > > > +	u32 reclamation_size:6;
> > > > > > > > +	u32 reserved:5;
> > > > > > > > +	u32 address_lo:20;
> > > > > > > > +	u32 address_hi:20;
> > > > > > > > +	u32 reserved1:12;
> > > > > > >
> > > > > > > This is wire interface with the GuC. Bitfields can based on
> > > > > > > endianess of the CPU. I know this is a iGPU feature for now
> > > > > > > but it could possibly change in the future, with that, to fut=
ure proof can the layout of this be setup via defines / macros?
> > > > > > >
> > > > > >
> > > > > > Sure, I moved over to the typical FIELD_PREP/GENMASK macros
> > > > > > used elsewhere for the guc interfaces.
> > > > > >
> > > > > > > > +} __packed;
> > > > > > > > +
> > > > > > > > +struct xe_page_reclaim_list {
> > > > > > > > +	/** @entries: array of page reclaim entries, page allocat=
ed */
> > > > > > > > +	struct xe_guc_page_reclaim_entry *entries;
> > > > > > > > +	/** @num_entries: number of entries */
> > > > > > > > +	int num_entries;
> > > > > > > > +#define XE_PAGE_RECLAIM_INVALID_LIST	-1
> > > > > > > > +};
> > > > > > > > +
> > > > > > > > +void xe_page_reclaim_list_invalidate(struct
> > > > > > > > +xe_page_reclaim_list *prl); int
> > > > > > > > +xe_page_reclaim_list_alloc_entries(struct
> > > > > > > > +xe_page_reclaim_list *prl); static inline void
> > > > > > > > +xe_page_reclaim_entries_get(struct xe_guc_page_reclaim_ent=
ry *entries) {
> > > > > > > > +	if (entries)
> > > > > > > > +		get_page(virt_to_page(entries)); }
> > > > > > > > +
> > > > > > > > +static inline void xe_page_reclaim_entries_put(struct
> > > > > > > > +xe_guc_page_reclaim_entry *entries) {
> > > > > > > > +	if (entries)
> > > > > > > > +		put_page(virt_to_page(entries)); }
> > > > > > >
> > > > > > > Kernel doc for static inlines.
> > > > > > >
> > > > > >
> > > > > > Added.
> > > > > >
> > > > > > > > +
> > > > > > > > +#endif	/* _XE_PAGE_RECLAIM_H_ */
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_pt.c index
> > > > > > > > 884127b4d97d..532a047676d4
> > > > > > > > 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > > > > > @@ -12,6 +12,7 @@
> > > > > > > >  #include "xe_exec_queue.h"
> > > > > > > >  #include "xe_gt.h"
> > > > > > > >  #include "xe_migrate.h"
> > > > > > > > +#include "xe_page_reclaim.h"
> > > > > > > >  #include "xe_pt_types.h"
> > > > > > > >  #include "xe_pt_walk.h"
> > > > > > > >  #include "xe_res_cursor.h"
> > > > > > > > @@ -1538,6 +1539,9 @@ struct xe_pt_stage_unbind_walk {
> > > > > > > >  	/* Output */
> > > > > > > >  	/* @wupd: Structure to track the page-table updates we're=
 building */
> > > > > > > >  	struct xe_walk_update wupd;
> > > > > > > > +
> > > > > > > > +	/** @prl: Backing pointer to page reclaim list in pt_upda=
te_ops */
> > > > > > > > +	struct xe_page_reclaim_list *prl;
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  /*
> > > > > > > > @@ -1572,6 +1576,69 @@ static bool xe_pt_check_kill(u64
> > > > > > > > addr,
> > > > > > > > u64 next,
> > > > > > > unsigned int level,
> > > > > > > >  	return false;
> > > > > > > >  }
> > > > > > > >
> > > > > > > > +/* Huge 2MB leaf lives directly in a level-1 table and
> > > > > > > > +has no children */ static bool is_large_pte(struct xe_pt *=
pte) {
> > > > > > > > +	return pte->level =3D=3D 1 && !pte->base.children; }
> > > > > > > > +
> > > > > > > > +/* page_size =3D 2^(reclamation_size + 12) */ #define
> > > > > > > > +COMPUTE_RECLAIM_ADDRESS_MASK(page_size)
> > > > > > > 	\
> > > > > > > > +({									\
> > > > > > > > +	BUILD_BUG_ON(!__builtin_constant_p(page_size));			\
> > > > > > > > +	ilog2(page_size) - 12;						\
> > > > > > >
> > > > > > > s/12/XE_PTE_SHIFT ?
> > > > > > >
> > > > > >
> > > > > > Done.
> > > > > >
> > > > > > > > +})
> > > > > > > > +
> > > > > > > > +static void generate_reclaim_entry(struct xe_tile *tile,
> > > > > > > > +				   struct xe_page_reclaim_list *prl,
> > > > > > > > +				   u64 pte,
> > > > > > > > +				   struct xe_pt *xe_child)
> > > > > > >
> > > > > > > Nit, xe_pt can be on the same line as 'u64 pte'.
> > > > > > >
> > > > > >
> > > > > > Done.
> > > > > >
> > > > > > > > +{
> > > > > > > > +	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl=
->entries;
> > > > > > > > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > > > > > > > +	const u64 field_mask =3D GENMASK_ULL(19, 0);
> > > > > > > > +	u32 reclamation_size;
> > > > > > >
> > > > > > > Nit, I'd make the last variable declared on the stack for rea=
dability.
> > > > > > >
> > > > > >
> > > > > > Ahh got it, reclamation_size moved to after num_entries.
> > > > > >
> > > > > > > > +	const uint max_entries =3D XE_PAGE_RECLAIM_MAX_ENTRIES;
> > > > > > > > +	int num_entries =3D prl->num_entries;
> > > > > > > > +
> > > > > > > > +	xe_tile_assert(tile, xe_child->level <=3D MAX_HUGEPTE_LEV=
EL);
> > > > > > > > +	xe_tile_assert(tile, reclaim_entries);
> > > > > > > > +
> > > > > > > > +	if (num_entries =3D=3D XE_PAGE_RECLAIM_INVALID_LIST)
> > > > > > > > +		return;
> > > > > > > > +
> > > > > > > > +	/* Overflow: mark as invalid through num_entries */
> > > > > > > > +	if (num_entries >=3D max_entries) {
> > > > > > > > +		prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;
> > > > > > > > +		return;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	/**
> > > > > > > > +	 * reclamation_size indicates the size of the page to be
> > > > > > > > +	 * invalidated and flushed from non-coherent cache.
> > > > > > > > +	 * Page size is computed as 2^(reclamation_size+12) bytes=
.
> > > > > > > > +	 * Only valid for these specific levels.
> > > > > > > > +	 */
> > > > > > > > +
> > > > > > > > +	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64))
> > > > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K)=
; /* reclamation_size =3D 0 */
> > > > > > > > +	else if (xe_child->level =3D=3D 0)
> > > > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K=
); /* reclamation_size =3D 1 */
> > > > > > > > +	else if (is_large_pte(xe_child))
> > > > > > > > +		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M)=
;
> > > > > > > > +/* reclamation_size =3D 2 */
> > > > > > >
> > > > > > > What happens if we have 1G page? That doesn't seem to be hand=
led.
> > > > > > >
> > > > > >
> > > > > > Page reclamation hardware does not support 1G page. This
> > > > > > should be handled and fallback to standard TLB invalidation
> > > > > > PPC flush. I can add
> > > > >
> > > > > Make sense that we fallback. I am however not seeing where this f=
allback occurs.
> > > > >
> > > >
> > > > !! Ohh I got it now, I silently dropped the 1G pages... My bad.
> > > > I'll follow the new changes suggested below.
> > > >
> > > > > > a comment somewhere discussing this but the format for PRL
> > > > > > only supports 4K, 64K, and 2M pages to reclaim. I'll add a
> > > > > > comment here mentioning the HW support being limited to these
> > > > > > pages and rename the is_large_pte to is_2m_pte.
> > > > > >
> > > > > > > > +	else
> > > > > > > > +		return;
> > > > >
> > > > > I would think for the fallback, we'd set prl->num_entries to XE_P=
AGE_RECLAIM_INVALID_LIST here.
> > > > >
> > > > > Maybe I'm missing something?
> > > > >
> > > > > Matt
> > > > >
> > > >
> > > > Given the 1G page, I'll follow this idea. Invalidate the PRL, and
> > > > then change the if statement in the
> > > > generate_reclaim_entry() caller to accept all PTE and invalidate it=
 in this function above.
> > > >
> > > > > > > > +
> > > > > > > > +	reclaim_entries[num_entries].valid =3D 1;
> > > > > > > > +	reclaim_entries[num_entries].reclamation_size =3D
> > > > > > > > +		reclamation_size;
> > > > > > > > +	reclaim_entries[num_entries].address_lo =3D
> > > > > > > > +		FIELD_GET(field_mask, phys_addr);
> > > > > > > > +	reclaim_entries[num_entries].address_hi =3D
> > > > > > > > +		FIELD_GET(field_mask, phys_addr >> 20);
> > > > > > >
> > > > > > > As suggested above, use macros/defines here to setup the entr=
y.
> > > > > > >
> > > > > >
> > > > > > Got it, moved over to using other standard define macros.
> > > > > >
> > > > > > > > +	prl->num_entries++;
> > > > > > > > +}
> > > > > > > > +
> > > > > > > >  static int xe_pt_stage_unbind_entry(struct xe_ptw *parent,=
 pgoff_t offset,
> > > > > > > >  				    unsigned int level, u64 addr, u64 next,
> > > > > > > >  				    struct xe_ptw **child, @@ -1579,10 +1646,27 @@
> > > > > > > > static int xe_pt_stage_unbind_entry(struct xe_ptw
> > > > > > > *parent, pgoff_t offset,
> > > > > > > >  				    struct xe_pt_walk *walk)  {
> > > > > > > >  	struct xe_pt *xe_child =3D container_of(*child,
> > > > > > > > typeof(*xe_child), base);
> > > > > > > > +	struct xe_pt_stage_unbind_walk *xe_walk =3D
> > > > > > > > +		container_of(walk, typeof(*xe_walk), base);
> > > > > > > > +	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > > > > > > >
> > > > > > > >  	XE_WARN_ON(!*child);
> > > > > > > >  	XE_WARN_ON(!level);
> > > > > > > >
> > > > > > > > +	/* 4K and 64K Pages are level 0, large pte needs addition=
al handling. */
> > > > > > > > +	if (xe_walk->prl && (xe_child->level =3D=3D 0 ||
> > > > > > > > +is_large_pte(xe_child))) {
> > > >
> > > > So right here, I'll make the change to accept all the leafs of the
> > > > walker and handle the 1G case in generate_reclaim_entry().
> > > >
> > > > Brian
> > > >
> > >
> > > It is possible we are even higher up page table tree too (e.g. with
> > > 57 bit VAs there are 2 level above 1G, 48 bits one level). We need to=
 handle those cases as fallbacks to cache flushing TLB
> invalidations too.
> > >
> > > Matt
> > >
> >
> > Was planning on just making everything else not 4K, 64K, 2M pages defau=
lt to invalidating PRL.
> > I believe that will handle these other levels as well? I am assuming
> > these other levels with
> > 48 bits and 57bit VA will still just look like leaf PTE with no
> > children so I can use a simple (!xe_child->base.children)?
> >
> > > > > > >
> > > > > > > And also here? 1G pages are unhandled? Please explain.
> > > > > > >
> > > > > >
> > > > > > As stated above, page reclamation only supports 4K, 64K, and 2M=
 pages.
> > > > > > 1G page will have to fallback to the standard tlb invalidation =
with PPC flush.
> > > > > >
> > > > > > > > +		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > > > > > > > +		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > > > > > > > +		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk)=
;
> > > > > > > > +
> > > > > > > > +		for (pgoff_t i =3D 0; i < count; i++) {
> > > > > > > > +			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) *
> > > > > > > > +sizeof(u64),
> > > > > > > u64);
> > > > > > > > +
> > > > > > > > +			generate_reclaim_entry(xe_walk->tile, xe_walk->prl,
> > > > > > > > +					       pte, xe_child);
> > > > > > > > +		}
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > >  	xe_pt_check_kill(addr, next, level - 1, xe_child,
> > > > > > > > action, walk);
> >
> > Since we're on the topic of this section as well, how will
> > xe_pt_check_kill() affect the page walk here? Do we need to handle
> > some case where the whole directroy is killed before we look at the chi=
ld pte? In that case, worthwhile to just invalidate PRL or
> attempt to walk it?
> >
> > Brian
> >
>=20
> This is what aborts the walk at higher levels. So I think here if we abor=
t the walk at anything above level 1, we'd need to invalidate PRL.
> So I believe if xe_pt_check_kill returns true + level > 1, we invalidate =
the PRL but perhaps that isn't needed at num_entries would be
> zero.
>=20
> Matt
>=20

Okay got it. num_entries I'm assuming here is the xe_child->num_live and no=
t the PRL num_entries.
For the level > 1 check here, isn't it better to check of the one being has=
 any children and if so,
invalidate the PRL? I'll go with adding both checks for now. (level > 1 && =
xe_child->base.children)
Thanks.

Brian

> > > > > > > >
> > > > > > > >  	return 0;
> > > > > > > > @@ -1654,6 +1738,8 @@ static unsigned int
> > > > > > > > xe_pt_stage_unbind(struct xe_tile *tile,  {
> > > > > > > >  	u64 start =3D range ? xe_svm_range_start(range) : xe_vma_=
start(vma);
> > > > > > > >  	u64 end =3D range ? xe_svm_range_end(range) :
> > > > > > > > xe_vma_end(vma);
> > > > > > > > +	struct xe_vm_pgtable_update_op *pt_update_op =3D
> > > > > > > > +		container_of(entries, struct xe_vm_pgtable_update_op,
> > > > > > > entries[0]);
> > > > > > > >  	struct xe_pt_stage_unbind_walk xe_walk =3D {
> > > > > > > >  		.base =3D {
> > > > > > > >  			.ops =3D &xe_pt_stage_unbind_ops, @@ -1665,6 +1751,7 @@
> > > > > > > > static unsigned int xe_pt_stage_unbind(struct xe_tile
> > > > > > > *tile,
> > > > > > > >  		.modified_start =3D start,
> > > > > > > >  		.modified_end =3D end,
> > > > > > > >  		.wupd.entries =3D entries,
> > > > > > > > +		.prl =3D pt_update_op->prl,
> > > > > > > >  	};
> > > > > > > >  	struct xe_pt *pt =3D vm->pt_root[tile->id];
> > > > > > > >
> > > > > > > > @@ -1897,6 +1984,7 @@ static int unbind_op_prepare(struct x=
e_tile *tile,
> > > > > > > >  			     struct xe_vm_pgtable_update_ops *pt_update_ops,
> > > > > > > >  			     struct xe_vma *vma)  {
> > > > > > > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > > > > > >  	u32 current_op =3D pt_update_ops->current_op;
> > > > > > > >  	struct xe_vm_pgtable_update_op *pt_op =3D &pt_update_ops-
> > > > > > > >ops[current_op];
> > > > > > > >  	int err;
> > > > > > > > @@ -1914,6 +2002,13 @@ static int unbind_op_prepare(struct =
xe_tile *tile,
> > > > > > > >  	pt_op->vma =3D vma;
> > > > > > > >  	pt_op->bind =3D false;
> > > > > > > >  	pt_op->rebind =3D false;
> > > > > > > > +	/* Maintain one PRL located in pt_update_ops that all
> > > > > > > > +others in unbind op
> > > > > > > reference */
> > > > > > > > +	if (xe->info.has_page_reclaim_hw_assist && !pt_update_ops=
->prl.entries) {
> > > > > > > > +		err =3D xe_page_reclaim_list_alloc_entries(&pt_update_op=
s->prl);
> > > > > > > > +		if (err < 0)
> > > > > > > > +			xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > > >
> > > > > > > I don't think you need to call xe_page_reclaim_list_invalidat=
e, right?
> > > > > > > If xe_page_reclaim_list_alloc_entries fails the prl should be=
 in the init state.
> > > > > > >
> > > > > >
> > > > > > Yes. I'll drop this call for now then.
> > > > > >
> > > > > > > > +	}
> > > > > > > > +	pt_op->prl =3D (pt_update_ops->prl.entries) ? &pt_update_=
ops->prl :
> > > > > > > > +NULL;
> > > > > > > >
> > > > > > > >  	err =3D vma_reserve_fences(tile_to_xe(tile), vma);
> > > > > > > >  	if (err)
> > > > > > > > @@ -1921,6 +2016,13 @@ static int unbind_op_prepare(struct
> > > > > > > > xe_tile *tile,
> > > > > > > >
> > > > > > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, xe_vma_vm=
(vma),
> > > > > > > >  						vma, NULL, pt_op->entries);
> > > > > > > > +	/* Free PRL if list declared as invalid */
> > > > > > > > +	if (pt_update_ops->prl.entries &&
> > > > > > > > +	    pt_update_ops->prl.num_entries =3D=3D XE_PAGE_RECLAIM=
_INVALID_LIST) {
> > > > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > > > +		pt_op->prl =3D NULL;
> > > > > > > > +		pt_update_ops->prl.entries =3D NULL;
> > > > > > >
> > > > > > > Call xe_page_reclaim_list_invalidate for clarity?
> > > > > > >
> > > > > >
> > > > > > Updated.
> > > > > >
> > > > > > > > +	}
> > > > > > > >
> > > > > > > >  	xe_vm_dbg_print_entries(tile_to_xe(tile), pt_op->entries,
> > > > > > > >  				pt_op->num_entries, false); @@ -1979,6 +2081,7 @@
> > > > > > > > static int unbind_range_prepare(struct xe_vm *vm,
> > > > > > > >  	pt_op->vma =3D XE_INVALID_VMA;
> > > > > > > >  	pt_op->bind =3D false;
> > > > > > > >  	pt_op->rebind =3D false;
> > > > > > > > +	pt_op->prl =3D NULL;
> > > > > > > >
> > > > > > > >  	pt_op->num_entries =3D xe_pt_stage_unbind(tile, vm, NULL,=
 range,
> > > > > > > >  						pt_op->entries);
> > > > > > > > @@ -2096,6 +2199,7 @@ xe_pt_update_ops_init(struct
> > > > > > > xe_vm_pgtable_update_ops *pt_update_ops)
> > > > > > > >  	init_llist_head(&pt_update_ops->deferred);
> > > > > > > >  	pt_update_ops->start =3D ~0x0ull;
> > > > > > > >  	pt_update_ops->last =3D 0x0ull;
> > > > > > > > +	xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > > >
> > > > > > > Can we introduce a function called xe_page_reclaim_list_init
> > > > > > > for clarity? It might do the same thing as
> > > > > > > xe_page_reclaim_list_invalidate but it would make this a
> > > > > > > little more clear. Likewise later in the series when a job is=
 created, you can call xe_page_reclaim_list_init there too.
> > > > > > >
> > > > > >
> > > > > > Sure, I'll write another helper for this and modify both those =
PRL creation points.
> > > > > >
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  /**
> > > > > > > > @@ -2518,6 +2622,11 @@ void xe_pt_update_ops_fini(struct xe=
_tile *tile, struct xe_vma_ops *vops)
> > > > > > > >  		&vops->pt_update_ops[tile->id];
> > > > > > > >  	int i;
> > > > > > > >
> > > > > > > > +	if (pt_update_ops->prl.entries) {
> > > > > > > > +		xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > > > > > +		xe_page_reclaim_list_invalidate(&pt_update_ops->prl);
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > >  	lockdep_assert_held(&vops->vm->lock);
> > > > > > > >  	xe_vm_assert_held(vops->vm);
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > > index 881f01e14db8..26e5295f118e 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_pt_types.h
> > > > > > > > @@ -8,6 +8,7 @@
> > > > > > > >
> > > > > > > >  #include <linux/types.h>
> > > > > > > >
> > > > > > > > +#include "xe_page_reclaim.h"
> > > > > > > >  #include "xe_pt_walk.h"
> > > > > > > >
> > > > > > > >  struct xe_bo;
> > > > > > > > @@ -85,6 +86,8 @@ struct xe_vm_pgtable_update_op {
> > > > > > > >  	bool bind;
> > > > > > > >  	/** @rebind: is a rebind */
> > > > > > > >  	bool rebind;
> > > > > > > > +	/** @prl: Backing pointer to page reclaim list of pt_upda=
te_ops */
> > > > > > > > +	struct xe_page_reclaim_list *prl;
> > > > > > >
> > > > > > > Can you move this above the bools in the layout of
> > > > > > > xe_vm_pgtable_update_op, likely just below "struct xe_vma".
> > > > > > >
> > > > > >
> > > > > > Ahh got it. Moved.
> > > > > >
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  /** struct xe_vm_pgtable_update_ops: page table update
> > > > > > > > operations */ @@ -119,6 +122,8 @@ struct xe_vm_pgtable_upda=
te_ops {
> > > > > > > >  	 * slots are idle.
> > > > > > > >  	 */
> > > > > > > >  	bool wait_vm_kernel;
> > > > > > > > +	/** @prl: embedded page reclaim list */
> > > > > > > > +	struct xe_page_reclaim_list prl;
> > > > > > >
> > > > > > > Same thing here, move just below "struct xe_exec_queue".
> > > > > > >
> > > > > > > Matt
> > > > > > >
> > > > > >
> > > > > > Moved.
> > > > > >
> > > > > > Brian
> > > > > >
> > > > > > > >  };
> > > > > > > >
> > > > > > > >  #endif
> > > > > > > > --
> > > > > > > > 2.51.2
> > > > > > > >
