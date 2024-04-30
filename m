Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CF5C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 18:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A1A6112DED;
	Tue, 30 Apr 2024 18:11:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lRUgRHeC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933AB112DED
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Apr 2024 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714500693; x=1746036693;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TfBWwrKes0p5Ap8rqG1ve5R9DbKNSpuNbqrVF2+RwkE=;
 b=lRUgRHeCoifDgXYHyBB5DyzGT25RwIOAtxlhmwPpv2FJm5O6m2/bs9hb
 D+1WgEbpO1L5O0Gz2E2RJmcGJRmsQtem1pqs/vtj7Lw0Hlm9uy/snS+3B
 z6zf8QQaZjriQNoQ9FSycXeYmdmCVPb7++64gJ/4IuwlO1b+jWJa0B193
 /E53/WtMmrf+ESf3b0HZ3V9HGNXUxOpVDq5jFJbnKBD0/F2B/cPVzEIwL
 BT3mU1OtgZePAaDaVl40PTbPLRVPwaEhhzU+VCRQg0sPWn5au1iEpQrPr
 V+2R6aSt6+TVUSqGG+tLfOE5lj9G0g6aB9bbWqYUaR68J9ss9OQbgjCuU g==;
X-CSE-ConnectionGUID: pQnDeGU6QL6Qf6HRQ0FKvA==
X-CSE-MsgGUID: TBFzrGALTASKO8y1Gg9RDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="14049922"
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="14049922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 11:11:30 -0700
X-CSE-ConnectionGUID: ex5qYJYcThG9foK35Ex5eQ==
X-CSE-MsgGUID: nbCZeHTLS3aMtYfpJShXEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,242,1708416000"; d="scan'208";a="57723907"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 11:11:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 11:11:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 11:11:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 11:11:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D/Rr4Deb1RZ0vvUZoc6Z96l76zsUvgTIjURl3vfmY9he0+tIPRxjARog8uvyiTMolIlXrHu/qRV5jncPwwtuVQI5fyYPZ2lKo/SCQZ0QAlmerT29RNmr2YHv6C7ls+P3ykbiYoyRuTpqHEA1AKii1gP13kz8rk4e1PEiy1bEGevmogBT/O6NwUSEyaIuA6QstrRr22hZ9Dtx7tETOcRzJy77Ud/eItIDRnQkE6jQ/clQup27emEdL2bXhTMPICX8/tMwlXBn+xc6ZIM85e+Wy9opeS9D8cIRexwLxOtkww2GcqgHgjHOV61CWxGOF2nw6OIP5cC1oHn7pmiFyo9TWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvvRnBgxM9PVPTKphXl+Aszw5EpVP1lkHQI7x1wDaMU=;
 b=dCscp8uWWVtvAFT3L1EXt0iK3zXnDGXwS4jDbS8CpEyBOGCyOXTB/8dly6han7pTiwHXwSSa/YhJAfF1NUdbc+7R+oE+MTEyOLUxbz1Vw0sJwDQhuakFZI9+yEjC4Gfuu1rTaUIgz9J+zxfdUAKrPQmp0P5vMLtpgUCih7xyZRxtMUFhkVgRVoRP6XtNHEL5w8Q3+hJ5C/CXbpCICQjWgAVUxPwvNbtDCDfWfMM0zUd3HUcFSsp1gV6smHJjNoD7puzRXYYRtDx2QZjh5W5QUbLdBtA/UmW48W4CNuEbzmwrpAYV9pM4S330pPHEf0+HEgqZP09cgp/ramlcB4dwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 18:11:26 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7519.031; Tue, 30 Apr 2024
 18:11:26 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gandi, 
 Ramadevi" <ramadevi.gandi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2] drm/xe/mocs: Add debugfs node to dump mocs
Thread-Topic: [PATCH v2] drm/xe/mocs: Add debugfs node to dump mocs
Thread-Index: AQHalJy5jg8dRIU6zkKvmaPcYaxwibF5LVaAgAf6sLA=
Date: Tue, 30 Apr 2024 18:11:26 +0000
Message-ID: <MW3PR11MB47480F712E9596AE4F80CCBAAE1A2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
 <cavhfcapykkmtenzny2ww4637ctgl2b274oucjcdat4kzsp3qp@2pzyrlqy5eep>
In-Reply-To: <cavhfcapykkmtenzny2ww4637ctgl2b274oucjcdat4kzsp3qp@2pzyrlqy5eep>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|CY8PR11MB7010:EE_
x-ms-office365-filtering-correlation-id: 44130af5-4dc4-4f53-0058-08dc6940f38e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?5ViTKJ9SVzAkH0MD1Y0DX7qD+vDWk4+lA1RXVcUF29gvQKbZrUAeedm982kv?=
 =?us-ascii?Q?NE4aWIf4VUiqsZkPsKqs4R98LUhzV9ST7ZIb1b7EUqY4Fbche6cwL8H/AD8o?=
 =?us-ascii?Q?P4H6hZu6Fs1+4cMC9gwrYpebgLi4LEmSx17D3oeDwy1q6Db33hIoqyCDJzGN?=
 =?us-ascii?Q?8JRagYIHWnOQadVUoVZnVjpsad86liPsvG/mbzZbEn1zDJen5VOWk3j4Mwu5?=
 =?us-ascii?Q?/4dd4UHqJ5jxuhxFACNxD9w2SsGIVU48zSKo/rn7nuI09BmhYWuk3tW1ioRh?=
 =?us-ascii?Q?Bm8Ew9y985jMQiB0vHe4NIhJkkfNjSMrb/v53EDK+hQvKjMXnhHN6IPZzF7D?=
 =?us-ascii?Q?1sZJfD1LaSFCnjNz+YBMoNbCNUvMKRqDHBzhGTAv4/1VA0Hnn8NxTRRzREht?=
 =?us-ascii?Q?1g3ykDzrPnYGluN/L7orBSSvT+vSnqel+v55Zq1clmoadZDrITipRM7S6CYj?=
 =?us-ascii?Q?BEFG26YfIYkvafwuIvHe5zsAdwZBL/Ny2LJlUG0d1PKxD2Ixp48u3GE2lhrw?=
 =?us-ascii?Q?KmQP9eRBIljFKu2IAdQoDn8ixjrlZbWXDSY6HgN2ZuvO1qyeVRvQp4vBpucD?=
 =?us-ascii?Q?b4H0qvuuW8rAVXr+2i/pVzsNHT4GN1ZPnxzQg3XUBfK6v/m4/v8zbnIWuVsR?=
 =?us-ascii?Q?9VlsbgC95rzz1RhNKDQQ05sG38WHx5YpzmPDsmeAOjrrxOe9uU7DY4LPtPeQ?=
 =?us-ascii?Q?ihEsZvw4/80SIzxMgCzSmprk3uVTztXmkMxL3G0mKTwl25wBGhOEJqDH5pT5?=
 =?us-ascii?Q?MX7CpelwsU/VAJsIZAk35qnJa7zsX8YaaxmikDbaNk3BAjG+rnlT46cw/Ism?=
 =?us-ascii?Q?hSI+nyH1UJpCmWkQ7lawzt/CqISdpGkxHxUZ/OzavXYaab6HGvH8AH3KTdre?=
 =?us-ascii?Q?M2sefjSI2ksvkNZLnb2CrRFjWxP1z2mfDfXjdCrb5+iYwJDFU+/7eFvuvamK?=
 =?us-ascii?Q?kmss0t+N7tPWBgdUua1NPGTCKMUv1ODczMjGUy7w8R1l9TEINNV+6zjH/zD2?=
 =?us-ascii?Q?1R19wdtdSeJL1AFHIqKM1TV3wVCqsfPnARv34NVLhiIi8YkSp3IKWxnrxB9w?=
 =?us-ascii?Q?bVmBVSMTUw/taB4ch8MebCopBRXQTOgY+vRTNKtcBECK50ndWNpV33W1V12p?=
 =?us-ascii?Q?B9uOP3HdErIrZgSJVTtMNIGVgwW4wrOjVRtqAmC7A3B0CK4Tp2qkcF/bgdea?=
 =?us-ascii?Q?BvdT14IDqtMulaietor2pmr1j/6W8KhQ6dJguI34uWZNw3+cUA27MJzLuwXj?=
 =?us-ascii?Q?65uh+pHlay66jSLMMQEkkGTZCTCeYVNCqZ118EVmj/jBqwXzzKjx7jRP2iHX?=
 =?us-ascii?Q?jNE2Xu7OPAgTw97wne5aeuJn9vb2YC+sGiIij56bVYW3xg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kLAE1fE42R2FVv2GeOjNrn49jUls0jWNJZKl90sBM+8fIW+nhb74iHGZYfDN?=
 =?us-ascii?Q?qAvcRhH64P+p77uVmt73D/H7LTzhUMWGx7A1yTqaDYdGiyKpIFSwsiEzPkQv?=
 =?us-ascii?Q?iHCctE2yVjV00gXkEdhDoUojnHMP6hpW9Dk0cjt97dlBQQl0ikwz1RWYGpvL?=
 =?us-ascii?Q?a5Tee1TrxAM491q8Gnt8yneYO+NmP1U1F/rczifUZX6iwd5fkITnTlX4h1mb?=
 =?us-ascii?Q?rax7WvxqxDjhD2sUte/ycDEN0J/TVpibpAqhnemBuX3kChXMRC+M9JJ85LHB?=
 =?us-ascii?Q?9wY4kklJSBVtBk4hsRXRLYDI4ZeSTmbBGZRgwzQTAO8FGiGe5JgMw3CNPWv3?=
 =?us-ascii?Q?MrIZDHXL2UblfiB98MTSYPqEEb61L2/kL48KPnMG4TnehD8n4I5+C5S1Q5uE?=
 =?us-ascii?Q?0FCByrnrEJBot0ejAUkJJedyaYPjcMsVQ8rcF5Y1b+HFpjooSTyB+47oYFka?=
 =?us-ascii?Q?ONVZCu0B2l2jTj203Qu+35ko9T8LyqBvwDBiGjYA1ibnvEWozlVYU5hjXedZ?=
 =?us-ascii?Q?caRFimKBITNeYWOWSl+h130qSEl0MkDK3djq2zMZIhYY3WDpEg5KkJQShRzL?=
 =?us-ascii?Q?0kkqW6Qq+kO8hKfWX58bDFd2ki35X73Ow2yQiHLFmmgEpFp+mvYiQoyS687R?=
 =?us-ascii?Q?vMOC1IiYuJF20MNx8SanLPjA+XrctqBNCCcVUa8ZgG+xN7BNjsq5pPj58f3R?=
 =?us-ascii?Q?uOMoz0KtVEZ2JhY7EGkmzlnG9h1hPI5xbpRu95raPn/gDHAH8vfR122wBjfP?=
 =?us-ascii?Q?+Xgha45FM/ejDMWH7bXtrAmPTWY3fJWcfgtRcIsnS2gxAZSvjSdwW+jUXeF8?=
 =?us-ascii?Q?lmq2+rlie9G8DX3L+t+G1X13s8rAgSGirQ/JlOES+AnXg3mINjv30hkvM6ik?=
 =?us-ascii?Q?caMX/jWlqHvLEKbnjfbiYQWKJeWT/bepNWx+mwvT0gUpEjdZ3k3uN7IFG+Pw?=
 =?us-ascii?Q?XKPZqxKfRTkL+nV+WXadPXXsxOghFPcisfyoVg+4AdwZFImDSwunHAkkRS5U?=
 =?us-ascii?Q?dnnZWX7A+JUYCSr7ZRVWPx+2HDri3A0TzKw8ikkqDW5pgxmz6wgTeIdEUnrW?=
 =?us-ascii?Q?G9lc9VropgO9q4hQ0PFvT0bcijsO3ncvHcrufugP2diiB9JXtZn9twaaxQGI?=
 =?us-ascii?Q?bygBa3GXzDsLiAqeAj92LVFS+PX6aA0LRFlyCQGF9Iw/mFNUW44o3Hgl7V5C?=
 =?us-ascii?Q?1YwT63k2xGpiJi/E+0QWxYviOXVJAI5sbWXQexhpxO1+n9kTIB0t/P+rFpwM?=
 =?us-ascii?Q?Dj0bgt5oC1ugMmBjYihZjDvpErWIXzgeSYmJM8OByXleI36xklpP9o9sFs1p?=
 =?us-ascii?Q?bjS4QuBd89DvvCX2/oG472hMW6zrPURJ1CXgZWNKrdbVhiyc2mMJMnDLLr07?=
 =?us-ascii?Q?WAy9Bs7oMHRWDaPy30nVyyiNS180PlhD2WXIsg18+G20MtSEH2AEDHPcGAw9?=
 =?us-ascii?Q?xy2tuWJvais9ryq0DX3PlJq/wCfiThCoE3PBEj5MWuFSzfXzDAI0C5zli/z/?=
 =?us-ascii?Q?EjNawdQLf8yYQ0WAfJv/YIRHWTXppH6wnvkDRa0zXkVUkEj4jSPmy6uBuOTt?=
 =?us-ascii?Q?Ea+3p19Oisr2I82jZnT8IhxtFyODsB+ptcUuDD+CuMPba5HSAhtJIlzrYrQE?=
 =?us-ascii?Q?xA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44130af5-4dc4-4f53-0058-08dc6940f38e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2024 18:11:26.4509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/WTtc9Oxf1OvhY5C1Cw+h+FG7Z8l7c0kwpsWkQuvgPdwjv6m+ArUhg74gNWUyNVb6XDVyCR101zwsFwgqnLm9UU5R5vMvfADIZ6HnhwAGo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7010
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Thursday, April 25, 2024 9:42 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH v2] drm/xe/mocs: Add debugfs node to dump mocs
>=20
> On Mon, Apr 22, 2024 at 03:35:50PM GMT, Janga Rahul Kumar wrote:
> >This is useful to check mocs configuration. Tests/Tools can use this
> >debugfs entry to get mocs info.
> >
> >v2: Address review comments. Change debugfs output style similar to pat
> >debugfs. (Lucas De Marchi)
>=20
> it looks like there's an igt series that is supposed to use this?
>=20
> Please add a "Test-with: <msgid>" to point out to that series
Done. Updated in v4 series.

>=20
> >
> >Cc: Matt Roper <matthew.d.roper@intel.com>
> >Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >---
> > drivers/gpu/drm/xe/xe_gt_debugfs.c |  11 ++
> > drivers/gpu/drm/xe/xe_mocs.c       | 274 +++++++++++++++++++++++++++--
> > drivers/gpu/drm/xe/xe_mocs.h       |   8 +
> > 3 files changed, 283 insertions(+), 10 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >index ff7f4cf52fa9..041eef92b705 100644
> >--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> >@@ -17,6 +17,7 @@
> > #include "xe_hw_engine.h"
> > #include "xe_lrc.h"
> > #include "xe_macros.h"
> >+#include "xe_mocs.h"
> > #include "xe_pat.h"
> > #include "xe_pm.h"
> > #include "xe_reg_sr.h"
> >@@ -198,6 +199,15 @@ static int pat(struct xe_gt *gt, struct drm_printer=
 *p)
> > 	return 0;
> > }
> >
> >+static int mocs(struct xe_gt *gt, struct drm_printer *p) {
> >+	xe_pm_runtime_get(gt_to_xe(gt));
> >+	xe_mocs_dump(gt, p);
> >+	xe_pm_runtime_put(gt_to_xe(gt));
> >+
> >+	return 0;
> >+}
> >+
> > static int rcs_default_lrc(struct xe_gt *gt, struct drm_printer *p)  {
> > 	xe_pm_runtime_get(gt_to_xe(gt));
> >@@ -253,6 +263,7 @@ static const struct drm_info_list debugfs_list[] =3D=
 {
> > 	{"register-save-restore", .show =3D xe_gt_debugfs_simple_show, .data =
=3D
> register_save_restore},
> > 	{"workarounds", .show =3D xe_gt_debugfs_simple_show, .data =3D
> workarounds},
> > 	{"pat", .show =3D xe_gt_debugfs_simple_show, .data =3D pat},
> >+	{"mocs", .show =3D xe_gt_debugfs_simple_show, .data =3D mocs},
> > 	{"default_lrc_rcs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> rcs_default_lrc},
> > 	{"default_lrc_ccs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> ccs_default_lrc},
> > 	{"default_lrc_bcs", .show =3D xe_gt_debugfs_simple_show, .data =3D
> >bcs_default_lrc}, diff --git a/drivers/gpu/drm/xe/xe_mocs.c
> >b/drivers/gpu/drm/xe/xe_mocs.c index 1e92f8ee07ba..e45d2b2caadf 100644
> >--- a/drivers/gpu/drm/xe/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/xe_mocs.c
> >@@ -43,6 +43,8 @@ struct xe_mocs_info {
> > 	u8 uc_index;
> > 	u8 wb_index;
> > 	u8 unused_entries_index;
> >+	void (*dump)(struct xe_mocs_info *mocs, unsigned int flags,
> >+		     struct xe_gt *gt, struct drm_printer *p);
>=20
> please follow the same pattern as xe_pat.c. Everywhere we use function
> pointers we put them into a ops struct.
Done.

>=20
> > };
> >
> > /* Defines for the tables (XXX_MOCS_0 - XXX_MOCS_63) */ @@ -57,6
> >+59,17 @@ struct xe_mocs_info {
> > #define LE_COS(value)		((value) << 15)
> > #define LE_SSE(value)		((value) << 17)
> >
> >+#define LE_CACHEABILITY_MASK	REG_GENMASK(1, 0)
> >+#define LE_TGT_CACHE_MASK	REG_GENMASK(3, 2)
> >+#define LE_LRUM_MASK		REG_GENMASK(5, 4)
> >+#define LE_AOM_MASK		REG_BIT(6)
> >+#define LE_RSC_MASK		REG_BIT(7)
> >+#define LE_SCC_MASK		REG_GENMASK(10, 8)
> >+#define LE_PFM_MASK		REG_GENMASK(13, 11)
> >+#define LE_SCF_MASK		REG_BIT(14)
> >+#define LE_COS_MASK		REG_GENMASK(16, 15)
> >+#define LE_SSE_MASK		REG_GENMASK(18, 17)
>=20
> convention for register in regs/ is:
>=20
>   * Define the register contents (i.e. bit and bit field macros) from mos=
t
>   * significant to least significant bit. Indent the register content mac=
ros
>   * using two extra spaces between ``#define`` and the macro name.
I saw 2 spaces between #defien and macro name in xe_reg file and updated th=
e same in v4.

>=20
> it would be good to follow it here too, even if not technically in the re=
gs/ dir. So,
> let's define those masks with LE_SSE_MASK first.[Janga Rahul Kumar]=20
Done.

> However.... are we too verbose here? Main use for this is to double check=
 with
> the spec. Do we need to spell out each field individually?=20
Spelling out each field individually helps  in mapping with spec easily.
this pattern dump will be very helpful while programming mocs for future
Platforms as well.

We were already
> logging them to kernel log:
>=20
> 	mocs_dbg(gt, "GLOB_MOCS[%d] 0x%x 0x%x\n", i,
> 		 XELP_GLOBAL_MOCS(i).addr, mocs);
>=20
> Similarly to xe_pat.c, I think the output should match and the only diffe=
rence
> being the time in which we are outputing it. +Matt who added the PAT ones=
 for
> his opinion... it seems the PAT ones are also a little verbose, but we do=
n't print
> to kernel log on probe.
>=20
> >+
> > /* Defines for the tables (LNCFMOCS0 - LNCFMOCS31) - two entries per wo=
rd
> */
> > #define L3_ESC(value)		((value) << 0)
> > #define L3_SCC(value)		((value) << 1)
> >@@ -64,6 +77,17 @@ struct xe_mocs_info {
> > #define L3_GLBGO(value)		((value) << 6)
> > #define L3_LKUP(value)		((value) << 7)
> >
> >+#define L3_ESC_MASK			REG_BIT(0)
> >+#define L3_SCC_MASK			REG_GENMASK(3, 1)
> >+#define L3_CACHEABILITY_MASK		REG_GENMASK(5, 4)
> >+#define L3_GLBGO_MASK			REG_BIT(6)
> >+#define L3_LKUP_MASK			REG_BIT(7)
> >+#define L3_UPPER_IDX_ESC_MASK		REG_BIT(16)
> >+#define L3_UPPER_IDX_SCC_MASK		REG_GENMASK(19, 17)
> >+#define L3_UPPER_IDX_CACHEABILITY_MASK	REG_GENMASK(21, 20)
> >+#define L3_UPPER_GLBGO_MASK		REG_BIT(22)
> >+#define L3_UPPER_LKUP_MASK		REG_BIT(23)
> >+
> > /* Defines for the tables (GLOB_MOCS_0 - GLOB_MOCS_16) */
> > #define IG_PAT				REG_BIT(8)
> > #define L3_CACHE_POLICY_MASK		REG_GENMASK(5, 4)
> >@@ -107,6 +131,8 @@ struct xe_mocs_info {
> > #define XE2_L3_1_XD		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 1)
> > #define XE2_L3_3_UC		REG_FIELD_PREP(L3_CACHE_POLICY_MASK, 3)
> >
> >+#define XE2_L3_CLOS_MASK	REG_GENMASK(7, 6)
> >+
> > #define MOCS_ENTRY(__idx, __control_value, __l3cc_value) \
> > 	[__idx] =3D { \
> > 		.control_value =3D __control_value, \
> >@@ -255,6 +281,82 @@ static const struct xe_mocs_entry
> gen12_mocs_desc[] =3D {
> > 		   L3_1_UC)
> > };
> >
> >+static bool regs_are_mcr(struct xe_gt *gt) {
> >+	struct xe_device *xe =3D gt_to_xe(gt);
> >+
> >+	if (xe_gt_is_media_type(gt))
> >+		return MEDIA_VER(xe) >=3D 20;
> >+	else
> >+		return GRAPHICS_VERx100(xe) >=3D 1250; }
>=20
> this is a prep patch moving the function
Done.

>=20
> >+
> >+static void xelp_lncf_dump(struct xe_mocs_info *info, struct xe_gt
> >+*gt, struct drm_printer *p) {
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "LNCFCMOCS[idx] =3D [ESC, SCC, L3CC] (value)\n\n");
> >+
> >+	for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j++,
> >+			   !!(reg_val & L3_ESC_MASK),
> >+			   REG_FIELD_GET(L3_SCC_MASK, reg_val),
> >+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j,
> >+			   !!(reg_val & L3_UPPER_IDX_ESC_MASK),
> >+			   REG_FIELD_GET(L3_UPPER_IDX_SCC_MASK, reg_val),
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static void gen12_mocs_dump(struct xe_mocs_info *info, unsigned int
> >+flags,
>=20
> s/gen12/xelp/
Done.

>=20
> >+			    struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	if (flags & HAS_GLOBAL_MOCS) {
> >+		drm_printf(p, "Global mocs table configuration:\n");
> >+		drm_printf(p, "GLOB_MOCS[idx] =3D [LeCC, TC, LRUM, AOM, RSC,
> SCC, PFM,
> >+SCF, CoS, SSE] (value)\n\n");
> >+
> >+		for (i =3D 0; i < info->n_entries; i++) {
> >+			if (regs_are_mcr(gt))
> >+				reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+			else
> >+				reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+		drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u, %u, %u, %u, %u,
> %u, %u, %u, %u ] (%#8x)\n",
> >+			   i,
> >+			   REG_FIELD_GET(LE_CACHEABILITY_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_TGT_CACHE_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_LRUM_MASK, reg_val),
> >+			   !!(reg_val & LE_AOM_MASK),
> >+			   !!(reg_val & LE_RSC_MASK),
> >+			   REG_FIELD_GET(LE_SCC_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_PFM_MASK, reg_val),
> >+			   !!(reg_val & LE_SCF_MASK),
> >+			   REG_FIELD_GET(LE_COS_MASK, reg_val),
> >+			   REG_FIELD_GET(LE_SSE_MASK, reg_val),
> >+			   reg_val);
> >+		}
> >+	}
> >+
> >+	if (flags & HAS_LNCF_MOCS) {
>=20
> watch out for coding style... shouldn't have the { }, here and in other p=
laces.
>=20
> >+		xelp_lncf_dump(info, gt, p);
> >+	}
> >+}
> >+
> > static const struct xe_mocs_entry dg1_mocs_desc[] =3D {
> > 	/* UC */
> > 	MOCS_ENTRY(1, 0, L3_1_UC),
> >@@ -279,6 +381,14 @@ static const struct xe_mocs_entry dg1_mocs_desc[] =
=3D
> {
> > 	MOCS_ENTRY(63, 0, L3_1_UC),
> > };
> >
> >+static void dg1_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> struct xe_gt *gt,
> >+			  struct drm_printer *p)
> >+{
> >+	if (flags & HAS_LNCF_MOCS) {
>=20
> you should eather uses flags or use the function pointers to differentiat=
e these.
Removed flags wherever they are not required.

-Janga Rahul Kumar

> From flags we have:
>=20
> 	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) >=3D 20)
> 		flags |=3D HAS_GLOBAL_MOCS;
>          if (GRAPHICS_VER(xe) < 20)
>                  flags |=3D HAS_LNCF_MOCS;
>=20
> So if keeping the flags, dg1_mocs_dump() would be gone and you'd simply u=
se
> xelp_mocs_dump()
>=20
> >+		xelp_lncf_dump(info, gt, p);
> >+	}
> >+}
> >+
> > static const struct xe_mocs_entry dg2_mocs_desc[] =3D {
> > 	/* UC - Coherent; GO:L3 */
> > 	MOCS_ENTRY(0, 0, L3_1_UC | L3_LKUP(1)), @@ -291,6 +401,43 @@
> static
> >const struct xe_mocs_entry dg2_mocs_desc[] =3D {
> > 	MOCS_ENTRY(3, 0, L3_3_WB | L3_LKUP(1)),  };
> >
> >+static void xehp_lncf_dump(struct xe_mocs_info *info, struct xe_gt
> >+*gt, struct drm_printer *p) {
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	drm_printf(p, "LNCFCMOCS[idx] =3D [UCL3LOOKUP, GLBGO, L3CC]
> >+(value)\n\n");
> >+
> >+	for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+		if (regs_are_mcr(gt))
> >+			reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+		else
> >+			reg_val =3D xe_mmio_read32(gt, XELP_LNCFCMOCS(i));
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j++,
> >+			   !!(reg_val & L3_LKUP_MASK),
> >+			   !!(reg_val & L3_GLBGO_MASK),
> >+			   REG_FIELD_GET(L3_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+
> >+		drm_printf(p, "LNCFCMOCS[%2d] =3D [%u, %u, %u] (%#8x)\n",
> >+			   j,
> >+			   !!(reg_val & L3_UPPER_LKUP_MASK),
> >+			   !!(reg_val & L3_UPPER_GLBGO_MASK),
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+			   reg_val);
> >+	}
> >+}
> >+
> >+static void dg2_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> struct xe_gt *gt,
> >+			  struct drm_printer *p)
> >+{
> >+	if (flags & HAS_LNCF_MOCS) {
>=20
> same comment as for DG1
>=20
> >+		xehp_lncf_dump(info, gt, p);
> >+	}
> >+}
> >+
> > static const struct xe_mocs_entry pvc_mocs_desc[] =3D {
> > 	/* Error */
> > 	MOCS_ENTRY(0, 0, L3_3_WB),
> >@@ -302,6 +449,34 @@ static const struct xe_mocs_entry pvc_mocs_desc[] =
=3D
> {
> > 	MOCS_ENTRY(2, 0, L3_3_WB),
> > };
> >
> >+static void pvc_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> struct xe_gt *gt,
> >+			  struct drm_printer *p)
> >+{
> >+	unsigned int i, j;
> >+	u32 reg_val;
> >+
> >+	if (flags & HAS_LNCF_MOCS) {
>=20
> if it's a pvc-only function, we know what it has, no need to check flags.
>=20
> >+		drm_printf(p, "LNCFCMOCS[idx] =3D [ L3CC ] (value)\n\n");
> >+
> >+		for (i =3D 0, j =3D 0; i < (info->n_entries + 1) / 2; i++, j++) {
> >+			if (regs_are_mcr(gt))
> >+				reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_LNCFCMOCS(i));
> >+			else
> >+				reg_val =3D xe_mmio_read32(gt,
> XELP_LNCFCMOCS(i));
> >+
> >+			drm_printf(p, "LNCFCMOCS[%2d] =3D [ %u ] (%#8x)\n",
> >+				   j++,
> >+				   REG_FIELD_GET(L3_CACHEABILITY_MASK,
> reg_val),
> >+				   reg_val);
> >+
> >+			drm_printf(p, "LNCFCMOCS[%2d] =3D [ %u ] (%#8x)\n",
> >+				   j,
> >+
> REG_FIELD_GET(L3_UPPER_IDX_CACHEABILITY_MASK, reg_val),
> >+				   reg_val);
> >+		}
> >+	}
> >+}
> >+
> > static const struct xe_mocs_entry mtl_mocs_desc[] =3D {
> > 	/* Error - Reserved for Non-Use */
> > 	MOCS_ENTRY(0,
> >@@ -353,6 +528,36 @@ static const struct xe_mocs_entry mtl_mocs_desc[] =
=3D
> {
> > 		   L3_GLBGO(1) | L3_1_UC),
> > };
> >
> >+static void mtl_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> >+			  struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	if (flags & HAS_GLOBAL_MOCS) {
>=20
> ditto... if it's MTL-only function, we know what it has.
>=20
> >+		drm_printf(p, "Global mocs table configuration:\n");
> >+		drm_printf(p, "GLOB_MOCS[idx] =3D [IG_PAT, L4_CACHE_POLICY]
> >+(value)\n\n");
> >+
> >+		for (i =3D 0; i < info->n_entries; i++) {
> >+			if (regs_are_mcr(gt))
> >+				reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+			else
> >+				reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+			drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u]
> (%#8x)\n",
> >+				   i,
> >+				   !!(reg_val & IG_PAT),
> >+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK,
> reg_val),
> >+				   reg_val);
> >+		}
> >+	}
> >+
> >+	if (flags & HAS_LNCF_MOCS) {
> >+		/* MTL lncf mocs table pattern is similar to that of xehp */
> >+		xehp_lncf_dump(info, gt, p);
> >+	}
> >+}
> >+
> > static const struct xe_mocs_entry xe2_mocs_table[] =3D {
> > 	/* Defer to PAT */
> > 	MOCS_ENTRY(0, XE2_L3_0_WB | L4_3_UC, 0), @@ -366,6 +571,32 @@
> static
> >const struct xe_mocs_entry xe2_mocs_table[] =3D {
> > 	MOCS_ENTRY(4, IG_PAT | XE2_L3_0_WB | L4_0_WB, 0),  };
> >
> >+static void xe2_mocs_dump(struct xe_mocs_info *info, unsigned int flags=
,
> >+			  struct xe_gt *gt, struct drm_printer *p) {
> >+	unsigned int i;
> >+	u32 reg_val;
> >+
> >+	if (flags & HAS_GLOBAL_MOCS) {
>=20
> xe2 always has global mocs, regardless of dgfx or igfx.
>=20
> Lucas De Marchi
>=20
> >+		drm_printf(p, "Global mocs table configuration:\n");
> >+		drm_printf(p, "GLOB_MOCS[idx] =3D [IG_PAT, L3_CLOS,
> L3_CACHE_POLICY,
> >+L4_CACHE_POLICY] (value)\n\n");
> >+
> >+		for (i =3D 0; i < info->n_entries; i++) {
> >+			if (regs_are_mcr(gt))
> >+				reg_val =3D xe_gt_mcr_unicast_read_any(gt,
> XEHP_GLOBAL_MOCS(i));
> >+			else
> >+				reg_val =3D xe_mmio_read32(gt,
> XELP_GLOBAL_MOCS(i));
> >+
> >+			drm_printf(p, "GLOB_MOCS[%2d] =3D [%u, %u, %u]
> (%#8x)\n",
> >+				   i,
> >+				   !!(reg_val & IG_PAT),
> >+				   REG_FIELD_GET(XE2_L3_CLOS_MASK,
> reg_val),
> >+				   REG_FIELD_GET(L4_CACHE_POLICY_MASK,
> reg_val),
> >+				   reg_val);
> >+		}
> >+	}
> >+}
> >+
> > static unsigned int get_mocs_settings(struct xe_device *xe,
> > 				      struct xe_mocs_info *info)
> > {
> >@@ -382,6 +613,7 @@ static unsigned int get_mocs_settings(struct xe_devi=
ce
> *xe,
> > 		info->uc_index =3D 3;
> > 		info->wb_index =3D 4;
> > 		info->unused_entries_index =3D 4;
> >+		info->dump =3D xe2_mocs_dump;
> > 		break;
> > 	case XE_PVC:
> > 		info->size =3D ARRAY_SIZE(pvc_mocs_desc); @@ -390,6 +622,7
> @@ static
> >unsigned int get_mocs_settings(struct xe_device *xe,
> > 		info->uc_index =3D 1;
> > 		info->wb_index =3D 2;
> > 		info->unused_entries_index =3D 2;
> >+		info->dump =3D pvc_mocs_dump;
> > 		break;
> > 	case XE_METEORLAKE:
> > 		info->size =3D ARRAY_SIZE(mtl_mocs_desc); @@ -397,6 +630,7
> @@ static
> >unsigned int get_mocs_settings(struct xe_device *xe,
> > 		info->n_entries =3D MTL_NUM_MOCS_ENTRIES;
> > 		info->uc_index =3D 9;
> > 		info->unused_entries_index =3D 1;
> >+		info->dump =3D mtl_mocs_dump;
> > 		break;
> > 	case XE_DG2:
> > 		info->size =3D ARRAY_SIZE(dg2_mocs_desc); @@ -408,6 +642,7
> @@ static
> >unsigned int get_mocs_settings(struct xe_device *xe,
> > 		 */
> > 		info->n_entries =3D XELP_NUM_MOCS_ENTRIES - 1;
> > 		info->unused_entries_index =3D 3;
> >+		info->dump =3D dg2_mocs_dump;
> > 		break;
> > 	case XE_DG1:
> > 		info->size =3D ARRAY_SIZE(dg1_mocs_desc); @@ -415,6 +650,7
> @@ static
> >unsigned int get_mocs_settings(struct xe_device *xe,
> > 		info->uc_index =3D 1;
> > 		info->n_entries =3D XELP_NUM_MOCS_ENTRIES;
> > 		info->unused_entries_index =3D 5;
> >+		info->dump =3D dg1_mocs_dump;
> > 		break;
> > 	case XE_TIGERLAKE:
> > 	case XE_ROCKETLAKE:
> >@@ -426,6 +662,7 @@ static unsigned int get_mocs_settings(struct xe_devi=
ce
> *xe,
> > 		info->n_entries =3D XELP_NUM_MOCS_ENTRIES;
> > 		info->uc_index =3D 3;
> > 		info->unused_entries_index =3D 2;
> >+		info->dump =3D gen12_mocs_dump;
> > 		break;
> > 	default:
> > 		drm_err(&xe->drm, "Platform that should have a MOCS table
> does
> >not.\n"); @@ -467,16 +704,6 @@ static u32 get_entry_control(const struct
> xe_mocs_info *info,
> > 	return info->table[info->unused_entries_index].control_value;
> > }
> >
> >-static bool regs_are_mcr(struct xe_gt *gt) -{
> >-	struct xe_device *xe =3D gt_to_xe(gt);
> >-
> >-	if (xe_gt_is_media_type(gt))
> >-		return MEDIA_VER(xe) >=3D 20;
> >-	else
> >-		return GRAPHICS_VERx100(xe) >=3D 1250;
> >-}
> >-
> > static void __init_mocs_table(struct xe_gt *gt,
> > 			      const struct xe_mocs_info *info)  { @@ -578,6
> +805,33 @@ void
> >xe_mocs_init(struct xe_gt *gt)
> > 		init_l3cc_table(gt, &table);
> > }
> >
> >+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p) {
> >+	struct xe_mocs_info table;
> >+	unsigned int flags;
> >+	u32 ret;
> >+	struct xe_device *xe =3D gt_to_xe(gt);
> >+
> >+	flags =3D get_mocs_settings(xe, &table);
> >+
> >+	if (!table.dump)
> >+		return;
> >+
> >+	xe_device_mem_access_get(xe);
> >+	ret =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> >+
> >+	if (ret)
> >+		goto err_fw;
> >+
> >+	table.dump(&table, flags, gt, p);
> >+
> >+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >+
> >+err_fw:
> >+	xe_assert(xe, !ret);
> >+	xe_device_mem_access_put(xe);
> >+}
> >+
> > #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > #include "tests/xe_mocs.c"
> > #endif
> >diff --git a/drivers/gpu/drm/xe/xe_mocs.h
> >b/drivers/gpu/drm/xe/xe_mocs.h index 053754c5a94e..d6fa4485a6e9 100644
> >--- a/drivers/gpu/drm/xe/xe_mocs.h
> >+++ b/drivers/gpu/drm/xe/xe_mocs.h
> >@@ -10,8 +10,16 @@
> >
> > struct xe_exec_queue;
> > struct xe_gt;
> >+struct drm_printer;
> >
> > void xe_mocs_init_early(struct xe_gt *gt); void xe_mocs_init(struct
> > xe_gt *gt);
> >
> >+/**
> >+ * xe_mocs_dump - Dump mocs table
> >+ * @gt: GT structure
> >+ * @p: Printer to dump info to
> >+ */
> >+void xe_mocs_dump(struct xe_gt *gt, struct drm_printer *p);
> >+
> > #endif
> >--
> >2.25.1
> >
