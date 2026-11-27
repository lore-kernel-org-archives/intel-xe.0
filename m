Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2356E606A31F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 12:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cBqnG6/G;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CGnID3Yf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D568C10E3C0;
	Fri, 27 Nov 2026 12:19:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826A410E3C0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Nov 2026 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795781985; x=1827317985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pUFE2hgHiFRkJDd+ZcXu+sHLFOgxNV/0aAGsQpFVnio=;
 b=cBqnG6/GWrFTbVotGiFBizJuAmmWNSIGDCTxwH2WrrlaWxTzFANmpeWL
 y830rrdoe5xgNrrGzdPQFHQxW+SY6+kxOlpaqXb6KK7uDwMBnfs2w1sfN
 KIcDKa3K8vugMHV0PN0YIcNeP6Jk6330ErBIV5tP080zs7SMQCy9O25EB
 fVw/L+VyrxUEM6i2ss/ljL+6t5HU7RXk29ojmsyQZkZWq40iHMril6yHF
 tdHU14DeNDD3k3jsgdEKNmAXlZ5sJdiPDcN5AD1Emro+73EnM1pSRcx9/
 GZseCybOwYWnDFS7WCfF+HH720WVC/eCq5g3E1VMd4qsUcSnxEQchtea0 A==;
X-CSE-ConnectionGUID: jtpCDqG8R2iUDrgkZNzFjQ==
X-CSE-MsgGUID: GnfagLMLQ6azwX0p2DNAsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4699622"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4699622"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:19:45 -0800
X-CSE-ConnectionGUID: ST4sQB97Qlm096zB2ISO7w==
X-CSE-MsgGUID: acqvCQlFQze8HcgfWGWKCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="14154221"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:19:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:19:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Fri, 27 Nov 2026 04:19:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.28) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Fri, 27 Nov 2026 04:19:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2xN6FXXFubD4SwMiw7W6Y14IaAnRQmMwf5+FXLn+Chb8PjCNPRdWvc+ayBUR/gYfyHiahfMo0lUPcXDGvOnNJ4fkAhosdQntvKLtauM6g9u8BS8/qMGdFctNZtLqdeBof8ulKfdEv3A6/rn+5AoxhXmO7wVd+Vhefk5TwAeGNi7Wa19RSdgqfapcwp7VLU6VEm6KaimIWrzV0vdQteR7YmwjkdzTglUyE1yooKmZo2gFjyOqNJzThKcvD3WsRTNIdh//+jOvvVNAdsmWv4i5n+lZTqRoBdw7DwzX87ydWxYdKZl05qGQ05t+3xLS0SL/MUO7+1/vZ8gUooq5OxA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4C+tXOFJzIOzsK39P1VPEORRkiNAd7MJHrZ11yP2+0=;
 b=AQsWhj5T6JwiD7lk9fc7duo00pxlf215pwj28yAbzxzjxSMAYXttyabdZshxULGXMGM7OaPQNZxFkLJg5WqQcgipJp9uiyyJgi4+CK+ShZuJ6MoJBOM1Mtzw9UJRcXNvcWdKEBu1pZXmDOTiig0ZQPMmaUI/kTiXDXIs/9aWJjlgLKGInXAzehJLqhviuen2BJsBUf5L9jTvuMn0dC27+V+ZDQp3/P9mi07E+OdEBdRzKET+KrWyyTmNA+UpBxSGqbRSqYdC62kQF/+p9mNk6ftUqEROw/yqiNR4MeIWUFOsl1Uckn/exTdijkDqYWJrTcA5+4yijFrnguiOAEnXqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q4C+tXOFJzIOzsK39P1VPEORRkiNAd7MJHrZ11yP2+0=;
 b=CGnID3YfAJoSJL6Vj8U6AgQJNT60WxKL2aLl63+phWLY61SGk/VOwY5JpzmBudq7RoGbfVHvNR+dPMi/r18D5WakaLz8AwjXuZkiKiQ1Ei2Sz1eWqmr8kOnU11p9BRls0eTpAfv4aTN6QDsj+5gDPIM/C4uTIhXYHA70BdgMDLE=
Received: from CHBPR11MB250747.namprd11.prod.outlook.com
 (2603:10b6:610:408::12) by SA1PR11MB887662.namprd11.prod.outlook.com
 (2603:10b6:806:520::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 12:19:41 +0000
Received: from CHBPR11MB250747.namprd11.prod.outlook.com
 ([fe80::554b:b2f8:6717:77bd]) by CHBPR11MB250747.namprd11.prod.outlook.com
 ([fe80::554b:b2f8:6717:77bd%5]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 12:19:41 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Ranjan,
 Joshua Santhosh" <joshua.santosh.ranjan@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Tauro, Riana" <riana.tauro@intel.com>, "Koujalagi,
 Mallesh" <mallesh.koujalagi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 4/5] drm/xe/i2c: Expose AMC alert reason through sysfs
Thread-Topic: [PATCH 4/5] drm/xe/i2c: Expose AMC alert reason through sysfs
Thread-Index: AQHdfjZ+izOCGqVgRkeYcKRiCkz5Z7dB1aGQ
Date: Fri, 27 Nov 2026 12:19:41 +0000
Message-ID: <CHBPR11MB250747FF8E4C63EB326FC3BC7B95412@CHBPR11MB250747.namprd11.prod.outlook.com>
References: <20261127061333.1019047-7-badal.nilawar@intel.com>
 <20261127061333.1019047-11-badal.nilawar@intel.com>
In-Reply-To: <20261127061333.1019047-11-badal.nilawar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: joshua.santosh.ranjan@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CHBPR11MB250747:EE_|SA1PR11MB887662:EE_
x-ms-office365-filtering-correlation-id: 482cd513-1ba0-43bc-70c1-08df4c80b678
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|1800799024|366016|376014|261028144727099003|261102123227099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261022105027099003|261022113327099003|38070700021|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|261009223027099003;
x-microsoft-antispam-message-info: fDAMxzfQ8uphXhWeZjz6tgsbGcUDFql3nGU2dGzGTRh2tb8xKjzfdeS2dnOOOFgLrgZWY4qbe4VOQc9kY0l8/jmcUYeLG3fLewOgQh9ix9UQVDEKsJm8ChF18qA8HGCY4+j77lN2uuu6MmLLbFqvC+T3QuFNHrcnj96aJ8e+j7a3wvi0slgOHijgCXCP0KDfo3AcPC/5A7jrOpFSmocjrXLJsBh9ne6ciMzpnZ+5rNZ2/bJ76PMWl2og5K55TQZMwBy4bss9PI1/xUvAPeFhUU7cUqYjX5V/ze6+GdsT3WLvbvshm3qO6ztg5HgwZVz8fhluctcqKwGmN7t5IJ5ygfdbYmWfj51V0F/7mWHFMBr+oavsbWOvxajATm79jpmv1Wc+X/tKJDY9BcOIn7tsvAWoAjaHeCnaeCbZxL7L8gQN/tB7CLoGM9otFk2T/a6L4f39oHGUw+1qhkX3OtbmikYQKPuECbzTDHgFWRoFSuE2rmmGF5U2PKCKlDZZPGdQnm5RN37iblLuib/jEKlVYIb3fV6OPA5Q79mGvrzPPSGqY6bn8RWWmsXHgYg4dkB4KAsZY1Z5yScv72BGn0KN9tkOlWEfOVm/KSnTULlYsy1p3dfQ0jYVC7yChurFmUzo8vJoIIfb6EF06OuOOHW6xwZBlGtPmPjp8TogB3LrGwo0TrWrnES82kth9dSKlLhvFWm+AUcpDrw3WFKtDHlX51VkNgiNN55Wo00a2jziIF0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CHBPR11MB250747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(1800799024)(366016)(376014)(261028144727099003)(261102123227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022113327099003)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(261009223027099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YB7kehC+B7YKN8kKTSKlNm25k0XbRHzGxe+hYQxknatIQHqQLjDCiTCs1xwf?=
 =?us-ascii?Q?HwfXWmfuJPYvaIA1YQc2UOd4eJM3XXfRpyzikWt7hKBUcqXdp43QAX77XZkS?=
 =?us-ascii?Q?0bRZ173yNxv0D+o6u8YjdLdt2n+0sjzBtwyFzBci3zJ+ZLpB3ITqxiBpN0d8?=
 =?us-ascii?Q?Kn1hrzsPmcW3515vDCTRg1Ato97/ifszkt7UkpY+LOjIoHm85jcCqkjErRO+?=
 =?us-ascii?Q?OOJS24aaGx6g5W1CDYKBZ+cXLbd+6Dj5AxEKbKz0SVNW9qCFuhoYEaBL/r6I?=
 =?us-ascii?Q?8ystEP/se7qxNMo84+dSjbX57ob7GIwPG601R8O3/f1wr97U+rVx8ic5QR7x?=
 =?us-ascii?Q?iM4qpcX8+v8y88M45SzDy+56J8gzAbNQ7hUhBEP0SckgDGpvHSX9loJRNiKZ?=
 =?us-ascii?Q?iig1hj0Am9jr2yONcTwC1QFdPzr1divD27rkcZuXF16J6PzCkzP2cllxzIgr?=
 =?us-ascii?Q?B9qEmCgbgOtQTVfmif7Z0bexNyDS6n+QWw0ULuGXgqiMD9owYfZjHQvExXia?=
 =?us-ascii?Q?7ItdfEElrHI9PhRITFRpNADU0ukaxbQUZm6J0SSE4GmGVantkImk/2SmYfCj?=
 =?us-ascii?Q?FG03V6n4d8eoSlWgujgi7WJS0A8IGmMVO+fdFxDcH7rqqQ/nf7TpQx1LUQGU?=
 =?us-ascii?Q?u7cslgZQbIR6hMy+yxEy+To2T5P5jRUwTHLCVCDvyEacrIUGuld3u1w6ngQg?=
 =?us-ascii?Q?fEmcBeJhrNCqfEJBKhRZNRe0vH6C6/RpCryzCDthEuPO+F/BI1FBtxKknhn9?=
 =?us-ascii?Q?qzP0o2r43OrBfhuGTP128eDXKgDS8W81XSnp2e+rZPQVVe6DO8n+yUxn8Xs4?=
 =?us-ascii?Q?7IY3+8YbUJBheq6Hi9XBP59ywZEmqg9Gf/upmh5eqSNjSdINPCmNrkR9ETIW?=
 =?us-ascii?Q?e5B4ewvxAgonbSPEeasf/TQ7D1mAAK2zii7fnzcxxN0TkysWxYlBOzyOBZQN?=
 =?us-ascii?Q?o9wH81uoiuElmxkqhNq4gsfC3Bo+9SAGm0syNpxpABMl2gZKqPYjrzwroPcJ?=
 =?us-ascii?Q?5gS9KPL92hc2pi709F2/y61Km0YIOC7EbuU9s6gKo0vkKUYkIAvgGFVHrj6A?=
 =?us-ascii?Q?IBOEmEz36YIZ+uJbQsPq/3qj8A3usqk8frEf3IAn9Y+AcsUBl+uOm19yUjfY?=
 =?us-ascii?Q?77vzv6GrZvDcFdIhZOsjSKYWmsGhf2yhDwkEUZhs/ajGZbnJJb8YAjVVI/4P?=
 =?us-ascii?Q?SVlH0dbvJcxc6WLB3v1kv5nxUz7HDouLTrlFjFVJ0WjvUy674J3IlNk8yVqG?=
 =?us-ascii?Q?UzIFV2GnlpgCqIBEWP0+V5ZK1KF2vbHy6KnzLlNdCu1WdZ6h/X0OvrRI5a6Z?=
 =?us-ascii?Q?wzQCqb2BcMaJwxkDgd6G90JE7rYWAxGXMXwbsZNl82gDIZ5GJgVu5yiglPlJ?=
 =?us-ascii?Q?xrdVw5bYwDy4MQkjbTjdMNw8ILiOAYbqLRqBFMOPib/6/P80L7loEYJ6M+zV?=
 =?us-ascii?Q?O5EV2VC7WzWvQKxZeVGfunet1BB24qbIYyaN51qKBlYTxSJMarpsyhXV0hYW?=
 =?us-ascii?Q?C1OYYcVRxkdjVcKUV+0UyzYeXSELLeJ8Kc3qUMrMFODntII4OctcVKSLkd0z?=
 =?us-ascii?Q?zWnMdHDY2qSQYW6OAOhaLbMxTLr0mRBfziTOqkuIs/eeYfhR5hVxarhl0mIp?=
 =?us-ascii?Q?Jn+M4a/bMwGCmCmBzkA8zQMvjDX6bUO4iHrjMmdLjbeOB19R5OAJro+sqc0A?=
 =?us-ascii?Q?GuEOPAU/jw9K1WfHlUMKud7X5AP4UhWh7yzCnHFIICPcHuW6OW3/TVRgTRb1?=
 =?us-ascii?Q?hrhSRpY+RQtNX8mwqSD8FsZFMv6iGcdWXbBqExxzCv8xznTJAO8yCN4As9t/?=
x-ms-exchange-antispam-messagedata-1: y+89ZX3Psc58AA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: QE3pM08bLsD+KWAKMcwvijOm3J8ZGu5vFhD0oaWgoSpNSPhNAxmqaId/GPLeSU6uDlFM6+Bx989U/uEplIGGJUMxDPOB0Cc3i27WdSR0CB1zPkao6vNAtYX99l2CMlN1Sh5FnOAzsa9SYWIcvhpVflirVD4HNUNYuDvMAY8F94+0E6fbqHoS1Qljvwu0SbGU8XJ3S790dErXLuiC56vgMhVLcWRciSzj0OGSDoFFyCNurNLtHaF2oiNN/9o5E/j903n7PSFUDpRS8grhgy7oD+I0k/zKWdZiX186/ou3MqToRtJRO5oQLnzluCWEaaGMal7BXaFFj8l6UdgSRqkLaA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CHBPR11MB250747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482cd513-1ba0-43bc-70c1-08df4c80b678
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2026 12:19:41.0284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tn31KAhan2uyokaKWxi+LKPScvSekVymzn/hrXzog+z4wu9rV2xgILgprA+9dfj0yx7Fk3q8m5D2ZSqV6NVLqnw3CiqvxM7NrS/sDM8sACk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB887662
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Nilawar, Badal <badal.nilawar@intel.com>
> Sent: Friday, November 27, 2026 11:44 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Jadav, Raag <raag.jadav@intel.com>; Tauro, Rian=
a
> <riana.tauro@intel.com>; Koujalagi, Mallesh <mallesh.koujalagi@intel.com>=
;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>;
> heikki.krogerus@linux.intel.com; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: [PATCH 4/5] drm/xe/i2c: Expose AMC alert reason through sysfs
>=20
> AMC raises an SMBus alert before a power-removal or power-cycle operation=
.
> The xe driver uses the alert reason to select a recovery method.
>=20
> Expose the reason in a read-only sysfs attribute so userspace can identif=
y the
> appropriate recovery action.
CC: @Ranjan, Joshua Santhosh to help with a public consumer PR.
Thanks,
Anshuman
>=20
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-amc     | 24 +++++++
>  drivers/gpu/drm/xe/xe_amc.c                   | 69 +++++++++++++++++--
>  2 files changed, 89 insertions(+), 4 deletions(-)  create mode 100644
> Documentation/ABI/testing/sysfs-driver-intel-xe-amc
>=20
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> new file mode 100644
> index 000000000000..8c2731cfa91c
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-amc
> @@ -0,0 +1,24 @@
> +What:		/sys/bus/pci/drivers/xe/.../xe_amc_alert_reason
> +Date:		October 2026
> +KernelVersion:	7.5
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:
> +		This file exposes the reason for the most recent Add-In
> +		Management Controller (AMC) alert on supported Intel Xe
> platforms.
> +
> +		An AMC alert is delivered via an SMBus interrupt. The device
> may
> +		be wedged; the required recovery method depends on the
> alert.
> +		The attribute is read-only and available to all users.
> +
> +		Read returns a single line containing one of the following
> +		alert reasons:
> +
> +			"none"
> +				No AMC alert has been received
> +			"unknown"
> +				AMC alert received but with unknown reason
> +			"Firmware Download"
> +			"Thermal Trip"
> +			"OOB Request"
> +			"OOB Reset"
> +			"Catastrophic"
> diff --git a/drivers/gpu/drm/xe/xe_amc.c b/drivers/gpu/drm/xe/xe_amc.c
> index b0e9250fa971..a619346a3451 100644
> --- a/drivers/gpu/drm/xe/xe_amc.c
> +++ b/drivers/gpu/drm/xe/xe_amc.c
> @@ -49,6 +49,7 @@ enum xe_amc_alert {
>  };
>=20
>  static const char * const amc_alert[] =3D {
> +	[AMC_ALERT_UNKNOWN]		=3D "unknown",
>  	[AMC_ALERT_FW_DOWNLOAD]		=3D "Firmware Download",
>  	[AMC_ALERT_THERMAL_TRIP]	=3D "Thermal Trip",
>  	[AMC_ALERT_OOB_REQUEST]		=3D "OOB Request",
> @@ -59,6 +60,8 @@ static const char * const amc_alert[] =3D {  struct xe_=
amc {
>  	struct xe_i2c *i2c;
>  	struct work_struct work;
> +	enum xe_amc_alert alert_reason;
> +	bool alert_seen;
>  };
>=20
>  struct amc_header {
> @@ -107,6 +110,50 @@ static const struct amc_request
> amc_get_alert_reason =3D {
>  	},
>  };
>=20
> +/**
> + * DOC: AMC Alert Reason
> + *
> + * Expose the most recent AMC alert reason through device sysfs.
> + *
> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-amc for the ABI
> + * specification.
> + */
> +
> +static enum xe_amc_alert amc_alert_reason(struct xe_amc *amc) {
> +	return READ_ONCE(amc->alert_reason);
> +}
> +
> +static ssize_t amc_alert_reason_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf) {
> +	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
> +	struct xe_amc *amc =3D xe->i2c->amc;
> +	enum xe_amc_alert alert_reason;
> +
> +	if (!READ_ONCE(amc->alert_seen))
> +		return sysfs_emit(buf, "none\n");
> +
> +	alert_reason =3D amc_alert_reason(amc);
> +
> +	return sysfs_emit(buf, "%s\n", amc_alert[alert_reason]); } static
> +DEVICE_ATTR_RO(amc_alert_reason);
> +
> +static void amc_remove_alert_sysfs(struct xe_i2c *i2c) {
> +	struct device *dev =3D i2c->drm_dev;
> +
> +	device_remove_file(dev, &dev_attr_amc_alert_reason); }
> +
> +static int amc_create_alert_sysfs(struct xe_i2c *i2c) {
> +	struct device *dev =3D i2c->drm_dev;
> +
> +	return device_create_file(dev, &dev_attr_amc_alert_reason); }
> +
>  static void xe_amc_work(struct work_struct *work)  {
>  	const struct amc_request *request =3D &amc_get_alert_reason; @@ -
> 156,11 +203,15 @@ static void xe_amc_work(struct work_struct *work)
>  	}
>=20
>  	alert_reason =3D response.value;
> -	dev_dbg(&client->dev, "Alert reason: %d\n", alert_reason);
> +	dev_dbg(&client->dev, "Alert reason: %u\n", (unsigned
> +int)alert_reason);
>=20
>  out_reassert_interrupt:
>  	xe_mmio_rmw32(amc->i2c->mmio, I2C_CONFIG_CMD,
> PCI_COMMAND_INTX_DISABLE, 0);
>=20
> +	WRITE_ONCE(amc->alert_reason, alert_reason <
> ARRAY_SIZE(amc_alert) ?
> +		   alert_reason : AMC_ALERT_UNKNOWN);
> +	WRITE_ONCE(amc->alert_seen, true);
> +
>  	switch (alert_reason) {
>  	case AMC_ALERT_FW_DOWNLOAD:
>  	case AMC_ALERT_OOB_RESET:
> @@ -174,11 +225,12 @@ static void xe_amc_work(struct work_struct *work)
>  		recovery =3D DRM_WEDGE_RECOVERY_COLD_RESET;
>  		break;
>  	default:
> -		alert_str =3D "unknown";
> +		alert_str =3D amc_alert[AMC_ALERT_UNKNOWN];
>  		break;
>  	}
>=20
> -	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str,
> alert_reason);
> +	dev_warn(amc->i2c->drm_dev, "AMC Alert: %s (%u)\n", alert_str,
> +(unsigned int)alert_reason);
> +
>  	if (recovery)
>  		xe_wedge_declare(i2c_client_to_xe_device(client), recovery);
>=20
> @@ -193,6 +245,7 @@ void xe_amc_handle_alert(struct xe_i2c *i2c)  int
> xe_amc_init(struct xe_i2c *i2c)  {
>  	struct xe_amc *amc;
> +	int ret;
>=20
>  	amc =3D kzalloc_obj(*amc);
>  	if (!amc)
> @@ -202,13 +255,21 @@ int xe_amc_init(struct xe_i2c *i2c)
>  	i2c->amc =3D amc;
>  	amc->i2c =3D i2c;
>=20
> -	return 0;
> +	ret =3D amc_create_alert_sysfs(i2c);
> +	if (ret) {
> +		kfree(i2c->amc);
> +		i2c->amc =3D NULL;
> +	}
> +
> +	return ret;
>  }
>=20
>  void xe_amc_exit(struct xe_i2c *i2c)
>  {
>  	if (i2c->amc) {
> +		amc_remove_alert_sysfs(i2c);
>  		cancel_work_sync(&i2c->amc->work);
>  		kfree(i2c->amc);
> +		i2c->amc =3D NULL;
>  	}
>  }
> --
> 2.56.0

