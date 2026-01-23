Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F45D77883
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 17:01:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3376010E2B9;
	Fri, 23 Jan 2026 17:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CcnQb8OS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A4510E2B9
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769187698; x=1800723698;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=mWOn/+pJcH3x5U0fZtOVc5WCAf2kPmAws13Bf3ePrx8=;
 b=CcnQb8OSSIt90wIYg7z129lepimfILvhhyBkAUQ6Yjszmwonfrof19RH
 fV03+rcLh8VNp2PPypHRvSDg2FOgSDmGgRJC80RZQcIJCZoi6l8lnTiue
 m2RGiaIsmyvjJtr1W0ZyLwKzukC2WdI1Sa1jCM0v2qcjRXikjsrayEpvf
 nOo879hbwsuFTwRPZ9lEnaeVa/N+/9JUS4KxMq1E15/iClEsD0JWIo5lH
 Hbz1jqAByRSv5EY9Yegc6yn5e8oh4lk0tZurMTAT0i6WFTENFmYY+C6Pz
 WnrN5nkTNOgEPzj82acE+/Uf4cJfCYf5xg5PTjlB9odqRL1/821wSNFg+ A==;
X-CSE-ConnectionGUID: AHKyMNfDTWe2cwLGLeSaAw==
X-CSE-MsgGUID: Fv87fEYaQSmjFA14VfQKJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="74301999"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208,217";a="74301999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:01:35 -0800
X-CSE-ConnectionGUID: anx8HidmTRexL/h61x9mvw==
X-CSE-MsgGUID: YNh4R/NJTbSH1gR/+2JnhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
 d="scan'208,217";a="207488875"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 09:01:35 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:01:34 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 09:01:34 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 09:01:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWGBqZDUSISsIW4DrJKtkRj22HtUckLTPIFc1GtvEBAQXMk1xdIchb1vA6uOke0kw4yqaOWd43ovlXqY5z9GgQQ2FkgKiYhMroUigxyBzVGn6cH0NEWJFxotseVlvLsmI7e75faU+/ZNhpVzSr6wJZnKZbrx/GDcU5jAY5iLLcwOfqU1bTuugvG1jTCdZ3gyDGhtFiuClCiC17MsYA6ECurG/7idbJCAVl3Wp5bHBDtb4zfY0+ztcsRk2iE3oVIZoWFVaY0HxmJJbGOJ824Ba7B4rVP4yFUx96gjjpt1xaO1Mhd1Jwu7gTlBh4PBaa1aY61Jse7semgRD7s/9koOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yN1HTvxzowdJQOonO5HLaesK7TIfRPoFwwjjEnubeBk=;
 b=Gu9gMQweCUHZImpj58OD0eWRp42/+PEgNWdn8hInaFbtH1R7JlJUyCYzjbnicaxugPP6ZgFLpxUR6amjtSVnnpn4Faijtf66A1erNkAP0rpXpoz0Biz7+9TRN+RaPrJIIpX6BWZDGDgGkZ92gke4gAaJfMKOB4gJ5vvtUZViJA+hbt6GjVaU002HbFec5za0/H5pnToovTN9ixTEaP7Ex+Nt0urZk0kgfkc5T1DYVvAw7UAu9wQd/iKnLtQ0Pflmq6GemznuMaHvn3RnGCZLCT8w/Dpn8r8uSmuHyDi2MKqI6JNachTWoIgShjhxeCHirY1CVzeMxznvdBb9VEG7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 17:01:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:01:28 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: Mail problems for Lucas De Marchi?
Thread-Topic: Mail problems for Lucas De Marchi?
Thread-Index: AQHcjH46dqtjT6n8CUaWhLY9SILSBrVf7E4AgAAOee8=
Date: Fri, 23 Jan 2026 17:01:28 +0000
Message-ID: <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
In-Reply-To: <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|IA4PR11MB9060:EE_
x-ms-office365-filtering-correlation-id: f2a5bd9e-6ec5-456e-ac8d-08de5aa10cde
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?09PNl1DjTLojH6rfL77NuJFipOIUx5WDNaKq8tzbRpHNCZwb+ySOJmr1HEqn?=
 =?us-ascii?Q?XFhNnnSJpzGNxBeafGis27VG8EU3yQoboX0+eeHoNRmKlapj1S/0fJOdFmDv?=
 =?us-ascii?Q?fgX+6D6PpbHhrfwMXcy3E45dsO2PHui1NZJW7AxV3zfIhxSGw4w4kRsZcx6J?=
 =?us-ascii?Q?ex1NxCt7pFCqnnkfnhnck8C2t52PnCgB3RF+rPkYwVmDRNsraAVyAm217JjC?=
 =?us-ascii?Q?WfkDguao2PaUWo1iGSdILmZBIYOcP6b4mbOB3y8gbPTg0jZHGzP0a2yH9bfQ?=
 =?us-ascii?Q?FD2afqg8M1abFJBklH+GTA2gETq9eg3wWF5q9QiuqUDTKDlALCJdCCii63xO?=
 =?us-ascii?Q?zBRig/AftweSxM90o2rc0hFUynaxxZuHwE54uqmFG29bxHmbMMx39cs/VCAh?=
 =?us-ascii?Q?NCGG/pqDVQklwHaNDw6NlMFx1CDeHI03O/f0n4RREMQofVftiIuibNgVPbkv?=
 =?us-ascii?Q?bYAkGLHvzOfA6bNqArs54xBj4g4dpPprv3D1QJkqAkKXXzGK8Es9dJ8VzF1c?=
 =?us-ascii?Q?Fa1Qd5sziG4dZWr3Nx7d6XZn3+zzyYJw0DtTo5e9wumleXGl4exwVFE5TBUB?=
 =?us-ascii?Q?h1InBrO2Br6LrSxXVivq/IL2vHfla+di8Ckb73pRldB/RM2LdNYoGpxMJTvk?=
 =?us-ascii?Q?J2paAlCxq0tCc2bwWvxJmCVZH9/Ifjhe6GXEa0M+DvsN2KPfYZFGXM1GuEeO?=
 =?us-ascii?Q?U2wVEWO4T2FMudW0rkyCkAaePRDlCF5QbCvBnrjgT6+ekbaFoce/bRV+hVRj?=
 =?us-ascii?Q?1UHmnpjOHBgHYIhdQ8zAdMb9TEVbMwNlxQKnzIsGj4POUgKz1Ud11htMZ+cl?=
 =?us-ascii?Q?aBENAsV6O6lH7jcf0IkX1oYw5/nnsIFm69eIHpleFXBIXTwNxqtCWm44M6lh?=
 =?us-ascii?Q?g6vgHPalrIoT3lJEYy1u+v3iI19AA5d1iiYw2kcOckrNLPTOm9/sWj9VEkAy?=
 =?us-ascii?Q?O4BjxxRU2tM1wUb9YrPvQZWQbui+RDqMr22bwOAAiINeoVQruYDSR2o8AQaI?=
 =?us-ascii?Q?PNVAe+osbcQHYf0rgIeFpNalS7yAyOe9tiPCajMx3I8FB7P6p7T7Gv6pllNF?=
 =?us-ascii?Q?sAPNwExx4dch5eMTw6ZK0f7YQJFo0u2/+nu7DhlL2Xrxev4zMZn+iRc0/uIu?=
 =?us-ascii?Q?6zrlb/uABfmA5PtNyAzIFEgKGI0CtpgJxeHA2l2HmoQtrZNK/gNai46oY0W3?=
 =?us-ascii?Q?L5jEZgxhXpJXowc3WpPskBo03G6kecsycSr9Rdw8hyTp0nLy+dpKaeUW11uR?=
 =?us-ascii?Q?bNeL9TArXGkdATdKrgTAS4YqnY+oIVoLudnZqsm8UTLoRyH3jWXBLuhbPB77?=
 =?us-ascii?Q?TW0nhR/KdtEiQOQzraasnzvNI7ED5tVXXx5BKT5RFtJgosa1KDxIWBOaYONt?=
 =?us-ascii?Q?mhNCS/Bq4+2H3t6/n0A6irvIg8eEuS+KD9yHeYNDRS/Htf/ifGsCsYfAODcg?=
 =?us-ascii?Q?g2eOruL0fRjCMa9ah4zjXOt/k8kmhFs2+gR1AnGDzsh/IzI1Qsi7tSgo3pI1?=
 =?us-ascii?Q?noFkJ+WIbWmq93s6yI5CoQ6GurDOArTnyTQo+Xy22d+HE2bhi9fvR6M2924D?=
 =?us-ascii?Q?f05Sd+XZeXxaKVUpXkkdFw3u8ZfAnPFIDwljutxO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700021)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KKIRwcjnzLAOii4jappGkmd4IJZ6D7/VnW3WiG1FhpoIQquXvGtGRIvAKIGD?=
 =?us-ascii?Q?PAjo9aKRRSnPDJb2mVtxMcUg2VErGIncCBRA73tq7v/pJDBPzfUu9bz2CVoR?=
 =?us-ascii?Q?aHoC2K0Ek+JrN0mdLeY2KMdZMPa1QihUyCQLx2Gp9HtvFL1L+u/gCQWhT9aE?=
 =?us-ascii?Q?HaCA8RexcVHIWwMoNv+AymsY0bbv6kHekN3Gcv6TQ3bNUsXhngiDixG/09+H?=
 =?us-ascii?Q?R5RMkIrvj6HRvDWrvp7kz3acZc1vTROPnaerdTpFTZrrGZ4FHZB/+Q3bI+ph?=
 =?us-ascii?Q?P6nSY59skq7OJvriETpqxfuDeJYNxK+8y+rgOVKiGwtauOKx5UjWmEe9jRKE?=
 =?us-ascii?Q?Jyg7j40fRZeNgHlQvRFuxhz5LFo4r2j5qKA4lknP6Zm9V2s7ny4b+B8g+yel?=
 =?us-ascii?Q?HBssGq8SdXRnDzttWwRQ3wILqzaB8C+p0xs9qHkiFkvs1sgDgH7UYcSa8I/P?=
 =?us-ascii?Q?dfjTQ60z3p/ck6RRMvM9waeJBcbYJQlGJPVBoEz0Gr6n+nX1BUeR+tyb+4vu?=
 =?us-ascii?Q?geUS/8yq2MbKQ+jo7kzgTNzGVuMFF79t9QhRjNPgiB2Myucu2GiVIinKrfmw?=
 =?us-ascii?Q?50mUp4+U1s3CtTtva9L2DzzcztwOzZp7xe9MX7rUAwlV8YtTmp+sERJXTSWn?=
 =?us-ascii?Q?M8rONbdDVq/2B599HTNhpcv2sn8qmjWmOTh3aZ/4UA7Qf3Jq53d5PN/1QyB+?=
 =?us-ascii?Q?3qALvtm9Q8QaNWXrN7lC/6jIJX/j9yPVJkqSZNdLcuD+UDVrlLjv+//kj/Vq?=
 =?us-ascii?Q?HQ7G2eFRXoFqKVDJsfODIufWm4m7bmZICdSgxVIkHgGwZm4QEXiPVs1lhzN6?=
 =?us-ascii?Q?Z8TiCWjpGsODcb8MGxnAZuF+xp3VYiHKG1KNkcuGeYETCI8GZaqqnvi02YEs?=
 =?us-ascii?Q?mkqzpvdzHTG6u0ugcU+89N9hA6blrSqBxY2Cx3U/7vB+qG1b2dJdo4kxqK7X?=
 =?us-ascii?Q?p/tVMyyqBc3EL7w/udTRnVIhVzxPdRMXw/aYsJtFihhvYmykTy2z0cfjmRN0?=
 =?us-ascii?Q?LW4tyTbugRMQvnBgzYjGU0WcF3NLIyTJmDVyBl9wjb3qe8gb8fiXi+O0+qdI?=
 =?us-ascii?Q?BC9yktOjMxt3XwFGVBh90DhHr9DgWDkdqahbZTZtbeDwXjgpLrJnwcMUyrJ4?=
 =?us-ascii?Q?EYpXV7cK3tMHTrdpS3pMp/wxzqV1BAdlZYxKPIVeF0q+7VMeNrZwaKWjj9C2?=
 =?us-ascii?Q?Mzc9qCij+yd9naOCOsOlTTeyq2VugNHjk3+zTNNCYvJg3RCp6bcBnEexgnbE?=
 =?us-ascii?Q?6udKB+YTl/WPARkxvkiDSqv4fcnd2FfNh+jULeXSoA61gDbiuPpcMjRQtSjA?=
 =?us-ascii?Q?xXHJfYJA4kfM/EhWxHQnun1e4g0M7mRJ3WNWYp28fJRbIzdLavUT/12eT11W?=
 =?us-ascii?Q?gjCstgTVopXfxpUlk8PV5Zt8/zB9xaZ7YjpFK5bAh/PWlxhhEaIJZiZ122R5?=
 =?us-ascii?Q?BW5bqvE+zupL5fTo12T1FHBFvvVnGUubslhI1tbEVUbeCa2guwwfwlM6gxYO?=
 =?us-ascii?Q?8YsZWFHodz2UpcL//sms26nhME3giZO5/9f83SemXuEGEA5YczcWC1c9SGuA?=
 =?us-ascii?Q?Dn8yWx3U0fhMeoFps+xHKlo3oCcFlMP6+rVtQ9zg4b9tr3wFg4JDoH4aYaom?=
 =?us-ascii?Q?UMUMHMwp40YFiRnpVCdrdaD4sGdkoN9OcuoGsyLmcn8tXXx2Z9wsXdGLtra4?=
 =?us-ascii?Q?9BofBV2wnqrUhGuS4bUvyblKLZ+tXyujVG2nGJ/St/CIlJrk?=
Content-Type: multipart/alternative;
 boundary="_000_CYYPR11MB8430903D2AE8BDD782B59B128B94ACYYPR11MB8430namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a5bd9e-6ec5-456e-ac8d-08de5aa10cde
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 17:01:28.5302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rk9KypCxjyLvUChvcOoBZrH/burCLPnXV550BT6I0TC1LRoaoyFrQH5D87kNvUc/Sp9BdYfXd7iu4LaHFON5bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
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

--_000_CYYPR11MB8430903D2AE8BDD782B59B128B94ACYYPR11MB8430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Commit aa8225d4ee87 ("MAINTAINERS: Remove myself from xe maintainers") addr=
ess that
________________________________
From: Souza, Jose <jose.souza@intel.com>
Sent: Friday, January 23, 2026 11:09 AM
To: Vivi, Rodrigo <rodrigo.vivi@intel.com>; broonie@kernel.org <broonie@ker=
nel.org>; lucas.demarchi@intel.com <lucas.demarchi@intel.com>; thomas.hells=
trom@linux.intel.com <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org <intel-xe@lists.freedesktop.org>
Subject: Re: Mail problems for Lucas De Marchi?

He left Intel
https://lists.freedesktop.org/archives/intel-gfx/2025-November/381835.html


On Fri, 2026-01-23 at 15:37 +0000, Mark Brown wrote:
> Hi,
>
> When attempting to report an issue in -next I got:
>
> <lucas.demarchi@intel.com>: host
> mgamail.eglb.intel.com[192.198.163.16] said:
>     550 #5.1.0 Address rejected. (in reply to RCPT TO command)
>
> That appears to be a current address in MAINTAINERS, and is a contact
> listed for the drm-xe tree in -next.  Are there any updates needed?
>
> Thanks,
> Mark

--_000_CYYPR11MB8430903D2AE8BDD782B59B128B94ACYYPR11MB8430namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Commit aa8225d4ee87 (&quot;MAINTAINERS: Remove myself from xe maintainers&q=
uot;) address that</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Souza, Jose &lt;jose.=
souza@intel.com&gt;<br>
<b>Sent:</b> Friday, January 23, 2026 11:09 AM<br>
<b>To:</b> Vivi, Rodrigo &lt;rodrigo.vivi@intel.com&gt;; broonie@kernel.org=
 &lt;broonie@kernel.org&gt;; lucas.demarchi@intel.com &lt;lucas.demarchi@in=
tel.com&gt;; thomas.hellstrom@linux.intel.com &lt;thomas.hellstrom@linux.in=
tel.com&gt;<br>
<b>Cc:</b> intel-xe@lists.freedesktop.org &lt;intel-xe@lists.freedesktop.or=
g&gt;<br>
<b>Subject:</b> Re: Mail problems for Lucas De Marchi?</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">He left Intel<br>
<a href=3D"https://lists.freedesktop.org/archives/intel-gfx/2025-November/3=
81835.html">https://lists.freedesktop.org/archives/intel-gfx/2025-November/=
381835.html</a><br>
<br>
<br>
On Fri, 2026-01-23 at 15:37 +0000, Mark Brown wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; When attempting to report an issue in -next I got:<br>
&gt; <br>
&gt; &lt;lucas.demarchi@intel.com&gt;: host<br>
&gt; mgamail.eglb.intel.com[192.198.163.16] said:<br>
&gt; &nbsp;&nbsp;&nbsp; 550 #5.1.0 Address rejected. (in reply to RCPT TO c=
ommand)<br>
&gt; <br>
&gt; That appears to be a current address in MAINTAINERS, and is a contact<=
br>
&gt; listed for the drm-xe tree in -next.&nbsp; Are there any updates neede=
d?<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Mark<br>
</div>
</span></font></div>
</body>
</html>

--_000_CYYPR11MB8430903D2AE8BDD782B59B128B94ACYYPR11MB8430namp_--
