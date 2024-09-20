Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD1ECF9C55
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 15:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C93710E2F0;
	Fri, 20 Sep 2024 15:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OJgna0pm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA89D10E2F0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726847844; x=1758383844;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w/w1TcxzLro0VF6FsEE/fnpYmYRXGZa47Iygre7jgaY=;
 b=OJgna0pmjY8JtD1sUZdH99ZpLl/zuxlPVmGdrakHuYgTciTX+IspolHw
 2oGogF3Lp+XF59nyJ/DFDaOS9cIcatkVG/qu/BY+IpjuIR2Hwzt3tA5zz
 ljEBaQQK0my+qHDd7ZWPGntOjNK5R8KoaXDpsW21Bgv/eG2nDaJLxFGYc
 F+akdOW5H/q+EFiQUlQmgJKuA3kJRM8EDZ873u/iPbM76mWrw8HCk9aof
 aYig4BlACU3956xQ+RRhufpnXW92aeYRRJGIWtOzf6um4wqtEiFaHw+N+
 SxXnj+ZjJXCocgEmqS/9aGowel69G9pLPJqS0eyJfkr5SP6lVvAFtk9b+ g==;
X-CSE-ConnectionGUID: 6mNaSlieQMekWJ6ns9/INw==
X-CSE-MsgGUID: Pf9M5e9vQ6uXEStuMUj8wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29648076"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29648076"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 08:57:23 -0700
X-CSE-ConnectionGUID: 372X9j1STIafMYejexcoEw==
X-CSE-MsgGUID: bEBeg1yvTIaXsesqMAQ1YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="101085946"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 08:57:23 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 08:57:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 08:57:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 08:57:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 08:57:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieYkpwCWSD+ZEue0WV5Xi6N5PJQhQ+Ak9N7kDRqLGNcZU2aUc2S7J1s99GHgoAF2hXOgLvvQs8oxJfHCrsudLX7/O63n53IJVREQimfZL42piuYMWlPVQA5ZmfZyZJRkeoza9IzA5Om6hBRTeXRVraQ/Vv9Ud0OK5//vYn8yjh++OtEPOYy9CN6Chjx0eAeeJkoq68MeLyVnKH/5czko9Vg4s7f1g4Va4q9n3546LPSZ4crlaLW2k7VoDQCfBXLBTnvnmsN4p+Kq7egl2nuj2/sYKef1XWaWW2sCQoWSkEyzeYHgXLaDcpLNJWpVXvHnG93ay9dRaxCASwPKeztqbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rruj/hLnSEWrBpnt4BIslMVFTYLBKWAnRmzd1c79gtA=;
 b=su/PIJfp/RUJ4euYCKLZGNt8erPMKhkCksD8gt8I5XZp3WWxsoTpzTJpwdMb9RNt7lW8+StmSRBIl2HH7jKHvmjBT7NVwAzeIvq2bg8ZSXkfgXTZw59boNilWu7QskGFB+JME5ke2PLnKxfeCoslYYexwgWOP+k5dDk9RLXVgehLtBKkgwxWoe4ny/ZIfzPvsscODTDDP0oaheRi7n0XexqfTzY5p+k/BUlKmlVDevIKopI/5gWtz1mIFS6h4N9fw0STnajwmpusVojKsjgdcyxivhYZq5iInpG1TCQOdAA+PvQrEsOQI0YuUecsC0L02INRJPUa0qYunp9uTFJcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 15:57:19 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%4]) with mapi id 15.20.7962.022; Fri, 20 Sep 2024
 15:57:19 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Thread-Topic: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Thread-Index: AQHbCehuuocj9nq8eEu4l4GR2eayVrJfePcAgAFFYjA=
Date: Fri, 20 Sep 2024 15:57:19 +0000
Message-ID: <BYAPR11MB3159727E185F70F6AD2C7974926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
 <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|SJ0PR11MB4845:EE_
x-ms-office365-filtering-correlation-id: 6c8a78ff-9ea1-4931-f5bc-08dcd98ce813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?g8hhaC/D9D6HFvlhHgCBScb+Qc7Rh3r169TehwLpNMYINplyirnjFqmtiTnf?=
 =?us-ascii?Q?DG4B5rAAOioT8XEwNbFeDaA11m4plO0WjZsG66I5cUp3q7CndZGxD77Nqr6o?=
 =?us-ascii?Q?B5ZKPhwyCxLK28ol2kpus2y94L4KqOQU8S10qEc++y/hrhEp3oULY0cLbRJq?=
 =?us-ascii?Q?FkU3Sm1pnG2CWu6RJB2RuoTV/wrnaIpPgAkqYtW/DpUyb7qaChZ7D75ZWdA9?=
 =?us-ascii?Q?1IapwCEBngBa0DnHjpAGP61he8UYKuEqFxVXVZhdeqxtQxZsJBocPF0VFBiK?=
 =?us-ascii?Q?hvn0O2UALBmFR0IzUaOuQ/B5g0cxg0NX6h79K6zHvkJCZhy4dM65Yi2PTnCy?=
 =?us-ascii?Q?Zrf76S/Vhq03ZHFlvLtU4d/mjKsUjdpY07yBnGleMzQkdecC2NBsCAbASBoa?=
 =?us-ascii?Q?eUxFIllebnPWPd8YydGrr47ZUmGX/BLGjv6n3JWCXoDyATZVr9JKOZCzns/y?=
 =?us-ascii?Q?JBK7HvAVxqfZay9q+oExY6Hl2Bc/MgBV0gnaGHpE1q7bdizmEB8hJwti8wLX?=
 =?us-ascii?Q?qRug0p0UStKPXEk34Gb4q6ESZVdPwNq4lIAN+Pp//s4y9rxU6Q0tKKXQX4fq?=
 =?us-ascii?Q?EL5YLZwRlYalVCgpqBZCYfn7+SEn/17VvI1KyI4pl75X/grchwf6S54emeG9?=
 =?us-ascii?Q?2iLxrLJcaPyH788KTq0ugBv3mCcqFZBj183ytKSebDNMfjHxw6JiGhU2rMoc?=
 =?us-ascii?Q?9VqAFUsQQ8hdcWZTI4IVKbVKMNTFUvaycQVTgQyPemiDGs2z3S5Xw4tQ72ro?=
 =?us-ascii?Q?O+oACwKNEGDUfX6+cgyrxiSK0c+jZYcM82hoHYNn0E2Lq3tdFtAnc1gp0DQ5?=
 =?us-ascii?Q?cAqLe3OSop9BIQpON8tdNoQNXrul7GAJFhpUFinEtoT4eFqQKYicARoJPKO/?=
 =?us-ascii?Q?i7JwHXAj8uVcoaSVP/AW48ExLoV94mZ+HYxpCoGczwRBtW1Nd9Akz9BCBAix?=
 =?us-ascii?Q?9t4ZLpgQkr7kKMM/feHliiUg8PQVi+gzg+57EZJiD8+Jqy0+swxSP7Iv5IqG?=
 =?us-ascii?Q?uvT/++HokCLRJfGkyZzJZ+o+I6v7n6jAqVrdlARHV0BbADKZtHhDoolWL9pA?=
 =?us-ascii?Q?6AaKP9NxNdPtOt5r5c+oYkoxtrEHozkOXHjrvbYKW0bj6B+IbKZxDCxs/Cxo?=
 =?us-ascii?Q?bXUAF7azqYHGy8da0gmZ5hk4pq/owRdCkTIGnjm3rJBe+Ojb+Xht6/I/uuqI?=
 =?us-ascii?Q?uD98i+fgyFb4hOgV0B/zIfRm/h4cGUr56ymRj0rtKSG39N3j/g1Ycwn+hHOV?=
 =?us-ascii?Q?bTnstOuL1n/ein8xD8y5JheJkrxZIOpeBYlG/QY40fzi+X6Wz5BwrEz2ObkI?=
 =?us-ascii?Q?SV4ytLWNA4dpYNSXlbZvAvkQ4/fOdnXSCDwWzEYYQ7fxsg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XrTq3TMRQJ1dAQWM9T9v777chnV7c5KLSLwK7WDrntcKqczCkvzXxHetGeCs?=
 =?us-ascii?Q?whHWXVpxQv+u5Tg6qyKy0EBt0O/FUjdxSZVDHHcj0ZVA0BknGU5lSoskCIMw?=
 =?us-ascii?Q?F8d/sSyPKPI7xF2ebvMahMke7fCR/8ntJSdIGGEuNKjg24iObbzy+nPs1nZh?=
 =?us-ascii?Q?6mTpDv5jhQ3gqy2pYq/cedvBLwKrrM+ee1WiVEg7sTdDZXd6PhdJY9DmxGLZ?=
 =?us-ascii?Q?mh6xCBZLBXLiAAaOJ50Og7k11sYmnEgMw2sfTw8B93g7y0Y79AC11HdOWkjX?=
 =?us-ascii?Q?VXLhKAjemhLvqeCjCRDkCwfVYEo37LXCxO/kcTNBs2SrdGtojanftU+sIZRP?=
 =?us-ascii?Q?jd9OMcJf+2C23spskec+ZRJ1poZyK9DhQyr4AB2ieqB+tpDCbKj+nl9g95eR?=
 =?us-ascii?Q?zkSSnNVeFmd8XcCpjilMD0QDTrcqgPv3V1EDvvRujpA7qMbHHuL0MAmmLYHy?=
 =?us-ascii?Q?X2jaW+II2pzASok4p0LUxmYIe+A7Iiy9puwNSoWSARcBdt+ZTWKVVGNiIlSB?=
 =?us-ascii?Q?N4ZW72QAeH3kj5S/gbSTUVScR28R7nE7Fj/VivNzIgfUeftFq9RMV3J3mFW4?=
 =?us-ascii?Q?IjRq0t61I+B0/Uxu7o4Fo72hbDjY/tBCTyRNc6ituQpUvbIcFy9oNKmI0Jq4?=
 =?us-ascii?Q?UYW9xo/Zdo97srvwOgMWJMXMEnReFluN0VQePeI/aqyQyd+Bnll5suNS/GjD?=
 =?us-ascii?Q?90YapKxwSEa0AB6UblKB0ZBg0Z2P7F0l1dlW2qb9v25H6kmAlgAEEMLQvTOI?=
 =?us-ascii?Q?U0QV7lsY2UNC87PMZHlpiQ77OYA+jEKhCxVEGWZDE0t//iWrEi56Gl4MCJMi?=
 =?us-ascii?Q?w4hbYa6Il/uKzcZanRsPaFTsLXejWthAgHhjr/EbS1X/Y9Gz2br5O5IDI/z+?=
 =?us-ascii?Q?OD0oe3kbCeSyjHTH+HPASyorQCWzCklBFegOGVdnUKviL92/MBg4mZPfC8iQ?=
 =?us-ascii?Q?+R/r/e145W4jXRNVnKbnLqXIy8LFAmX5ZvyCf7lrvmUs0kAoATYyn+UgwIvI?=
 =?us-ascii?Q?15KNU9IiUg9c4T013ANVquIk7NiL8SW+ZeSX6vvbeMIXIQKrgtm7M4UrPQD9?=
 =?us-ascii?Q?JdL6x5xXpEff0pe0lsaguKbck9YTGjIo0hxgzLrYIWB9eIPvgNodXDwjegcf?=
 =?us-ascii?Q?6TEIgoQUMQ4tuqUeEQGjq9/pRodzgBRinG6V72P4a34H8f8vVGHcjnq3rOvN?=
 =?us-ascii?Q?BYk9UqdZqjGKeSTxCKJnGSoNaO3wy2gej5SxH4S4BpLZlc2UAVvtCc9cy25n?=
 =?us-ascii?Q?JgZCCTgvI8ea2xuTFmKpBkNAcI1K4INNvT/rlHu5qQRyuIMk9aoUJ/YNWdmj?=
 =?us-ascii?Q?kuqWYDDbeB+0g2CJ5VLO5u3+x4xIfAFoCdHFQ8BeNgjPnrsxucmMsbvEOmBn?=
 =?us-ascii?Q?83e7941q3nv7ZtK47N8WHFDt9QD1b71PLwtFXV+vYgD6th2A7DqZGPwGckwR?=
 =?us-ascii?Q?iqzYAcQeW5CPvTF94fxDgmpvR/0RJIdCO1rvcot10NdyW53g5qeXgWTJW3V7?=
 =?us-ascii?Q?cAkOz/Cwh/QDILo47arIbc2P55jFh2ntTRk17NajSK94qyCrBE1XJbelSFNr?=
 =?us-ascii?Q?kih1jK+p7GPeutYhrL4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8a78ff-9ea1-4931-f5bc-08dcd98ce813
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 15:57:19.1847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lw8MYHitHySiy03aRYb8/Rt5E2OjqV8qOOb3QdntTm7EH4viGr1NcCq6IU78HXwMRf03GXHTFIuDYH8jycBY0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4845
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
> Sent: Thursday, September 19, 2024 3:02 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
>=20
> On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> > Add debugfs entry to display all the gpuva that is bound to the
> > device. This is done by walking all the VMs created for each device
> > process, and display va information of each VM. This is useful for
> > gpuvm debugging. With this change, user can display gpuva info
> > as below:
> >
> > root@DUT7279PVC:/home/gta# cat
> /sys/kernel/debug/dri/0/gpuvas
> > Process "your process name" GPU VA space
> > DRM GPU VA space (Xe VM)
> [0x0000000000000000;0x0200000000000000]
> > Kernel reserved node [0x0000000000000000;0x0000000000000000]
> >
> >  VAs | start              | range              | end                | o=
bject             |
> object offset
> > -----------------------------------------------------------------------=
------------
> --------------------------
> >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> >      | 0x00007ffff5db7000 | 0x0000000000001000 |
> 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
> >      | 0x00007ffff5db8000 | 0x00ff80000a248000 |
> 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> >
>=20
> This looks useful. We may even want to extend wedged mode to
> switch the
> VM to a state where this is available after a hang which causes a
> wedge
> as this could useful. Can be done in a follow up later.
>=20
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 44
> +++++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> b/drivers/gpu/drm/xe/xe_debugfs.c
> > index 1011e5d281fa..0c7bee1c2a8d 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/string_helpers.h>
> >
> >  #include <drm/drm_debugfs.h>
> > +#include <drm/drm_drv.h>
> >
> >  #include "xe_bo.h"
> >  #include "xe_device.h"
> > @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m, void
> *data)
> >  	return 0;
> >  }
> >
> > +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file *m)
> > +{
> > +	int ret;
> > +
> > +	mutex_lock(&vm->snap_mutex);
> > +	ret =3D drm_debugfs_gpuva_info(m, &vm->gpuvm);
> > +	mutex_unlock(&vm->snap_mutex);
> > +
> > +	return ret;
> > +}
> > +
> > +static int show_each_vm(struct seq_file *m, void *arg)
> > +{
> > +	struct drm_info_node *node =3D (struct drm_info_node *)m-
> >private;
> > +	struct xe_device *xe =3D node_to_xe(node);
> > +	struct drm_device *dev =3D &xe->drm;
> > +	struct drm_file *file;
> > +	struct xe_file *xef;
> > +	int (*show)(struct xe_vm *, struct seq_file *) =3D node-
> >info_ent->data;
> > +	struct xe_vm *vm;
> > +	unsigned long idx;
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&dev->filelist_mutex);
> > +	list_for_each_entry(file, &dev->filelist, lhead) {
> > +		xef =3D (struct xe_file *)file->driver_priv;
> > +		seq_printf(m, "Process %s GPU VA space\n", xef-
> >process_name);
> > +		mutex_lock(&xef->vm.lock);
> > +		xa_for_each(&xef->vm.xa, idx, vm) {
>=20
> Kinda a nit but I've said this in a few other places - the xef->vm.lock
> read usage isn't right here. This look protects the xarray lookup and
> ref to VM and nothing else. It is not designed to do anything else -
> e.g. holding the lock then calling another function.

I don't see a problem calling a function holding xef->vm.lock. we require
Vm to be alive while calling show_vm_gpuvas, and xef->vm.lock guarantees
Vm is alive because it guarantee vm is on the xarray and as long as it is o=
n
The xarray we hold a vm ref.

>=20
> With that this loop should look like this.
>=20
> mutex_lock(&xef->vm.lock);
> xa_for_each(&xef->vm.xa, idx, vm) {

I don't think xa_for_each is safe againt removing items from xarray,=20
At least this is my understanding.

> 	xe_vm_get(vm);
> 	mutex_unlock(&xef->vm.lock);
>=20
> 	/* Do something */
>=20
> 	mutex_lock(&xef->vm.lock);
> 	xe_vm_put(vm);
> }
> mutex_unlock(&xef->vm.lock);
>=20
> This avoids unintentionally creating locking chains, in this case
> xef->vm.lock -> snap_mutex. We should strive to only create well
> defined
> changes of locking. Once we start unintentionally creating locking
> chains it hard to unwind in a driver.

Can we annotate the xef->vm.lock -> snap_mutex locking order?
It is reasonable to me from the locking hierarchy here: xef->vm.lock
Is at the xe file level, and snap_mutex is at vm level.  we can create
multiple vms to one xe file, so the locking order seems natural to me.

the key point is, not be afraid of creating locking chain, instead, creatin=
g
locking chain at reasonable order. Fortunately, the locking order in this
case is very obvious.

>=20
> Likewise I suspect we really shouldn't be holding dev->filelist_mutex
> and doing things underneath it. Fixing that would likely require
> converting &dev->filelist to an xarray or writing an iterator with a
> hitch though so is a bit of a larger change. Looking at the usage of
> this lock, I'd say this is kinda abusing this lock too and I don't think
> anyone in the community would be all that happy about its usage
> here.
> I'd lean towards we need to properly fix this, or alternatively maybe
> just maintain a per device storage of all the VMs.

Take a look at drm_client_info function. Holding filelist_mutex and doing
Things underneath, including hold another lock, seems fine. That codes have
Been there for many years without a problem. It is just natural to hold
Filelist_mutex to walk device's file list as this lock is designed to prote=
ct the
File list. I don't think it is a abusing of this lock.

So I think it is reasonable to annotate a dev filelist_mutext->xef vm.lock-=
>vm snap_mutex
Locking order. This is the same order of creating device ->device file desc=
riptor for device->gpuvm
For a device file descriptor. Any reversed order locking is not reasonable =
thus a kernel driver
Bug.

Oak

>=20
> Matt
>=20
> > +			ret =3D show(vm, m);
> > +			if (ret < 0)
> > +				break;
> > +
> > +			seq_puts(m, "\n");
> > +		}
> > +		mutex_unlock(&xef->vm.lock);
> > +	}
> > +	mutex_unlock(&dev->filelist_mutex);
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] =3D {
> >  	{"info", info, 0},
> >  	{ .name =3D "sriov_info", .show =3D sriov_info, },
> > +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm,
> show_vm_gpuvas),
> >  };
> >
> >  static int forcewake_open(struct inode *inode, struct file *file)
> > --
> > 2.26.3
> >
