Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A59DD597A4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Nov 2024 21:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26B6010E660;
	Tue, 12 Nov 2024 21:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTxij5rE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0B110E660
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Nov 2024 21:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731446513; x=1762982513;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NLw01Aooo6Tm//mlkrGo2ZE0E7rVltrwd0GcyGrqfdk=;
 b=hTxij5rEvCyrWfvCV8ReTZzaSI7sv+eViNjUgDzZVaD5rDFuBdVTFiYa
 pybnLaXbeuUSX3F6Q2SJsdG4Uqnxk/aO6/w/HklxUlps+Gkhyv4YWRnpu
 4ikqAz90otY/USQGa04FKaWAhMDIPClj7C5Z2wAs94n/fxAA+OL8wr7AN
 ifFrUJNEmPgzLynxmwWCFZCY9qV6YKcA3AewnWpOpeZrucSSy+uq+6E8u
 rCCB43jB04TcolL+roE9OdBrQHEpDo2NVI4enXfeV6lkFd9/15/6if/S3
 r7MSy8CX8r01zIXTt8O2aMbgxcdIcivnNTrLJ2h9Y5Kjw1gWAI0C85U4i A==;
X-CSE-ConnectionGUID: 3YL+w46YQQajzJYeSjkPEw==
X-CSE-MsgGUID: ETwGfaw4Qa+otMUX91YlAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31407830"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="31407830"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 13:21:52 -0800
X-CSE-ConnectionGUID: ojlfwXuaS4Gf46IofwLCpA==
X-CSE-MsgGUID: 4LJhXByqQ4KjSR9txgE5jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; d="scan'208";a="88464979"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Nov 2024 13:21:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 12 Nov 2024 13:21:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 12 Nov 2024 13:21:52 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 12 Nov 2024 13:21:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7GqGBdx3Fq0WcV/+vU3wm3TKV61dgbVU3zLA/fWr/qX013P45g4P/RXadRBnIKJvcp7AzYBTOMMy+BW5guCF3ihYlAZMejfdPmFLmxQ5vOIHAtISpERgq3nSlA3p4izd8twUPqKncTXBXl6hMVWWN35v7FGo0Sh76ICNiUp2pknZnhr8COCVffUTQPWuiYkPIuQWrCzXJ1i7sFFv1PoGHuxt9PVt855Dt9ObC6sZr0NEJyD4jPhAiFekw6fBqBv0zEQgyzYfBImgDgd8+XZx48f1lXwWpyS4D/oydjmtM7YcUkVZE+EQGrNb55UAT9okMI4m+9UQNFVDswPGJ+MWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVzgU4DdYvbZ++0rIModKt8NlOSNF1GDf8WevZnLlBY=;
 b=e+PxYVqdpjJ16X4Tbj72Q/wQgwGMrLOOIS6aKIeon9f0EBcfsJVZ/LfmAWZgLF9WqIjGDEDtqsGdm9xEd7U9rSASq1j+tqs1qJMikFx94wRn0ZgqoPw2SFzCp2DYVV4J4ETg9SU1DFooqg9Muz4XBDTCAOSWb8lk3UzYJNnxHdnODFbDsvAc9NbicO5DYkIZOOjoMWRn19yEB89PRh/VJSN0YdSMlwWjZX1phg2fGuqAoeiuGqwieGXNtAsotpYz/ZctEV/RFQKOPjAfmcMC91r0Vy7eJEj9cYa+LeAMx+CBsm/0OH4tQNJDkb1obrTJK8z8UZiwwRuo060G1vPQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6065.namprd11.prod.outlook.com (2603:10b6:8:60::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Tue, 12 Nov
 2024 21:21:47 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.013; Tue, 12 Nov 2024
 21:21:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Teres Alexis, Alan Previn"
 <alan.previn.teres.alexis@intel.com>, "Dong, Zhanjun"
 <zhanjun.dong@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Topic: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
Thread-Index: AQHbMgWw15n4plELRUKWR+L6KunWx7Kt7xmQgAATloCAAAXp4IAF7IkAgAAFQQCAACDGsIAABB4AgAAEfICAAAS+YA==
Date: Tue, 12 Nov 2024 21:21:46 +0000
Message-ID: <CH0PR11MB5444989A724E09C2A4FF3E2EE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241108174312.272792-1-matthew.brost@intel.com>
 <20241108174312.272792-3-matthew.brost@intel.com>
 <CH0PR11MB54441F26FE46E5366FEC4EFDE55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <Zy6aVcXWot6hBV1n@lstrano-desk.jf.intel.com>
 <CH0PR11MB5444A8A2BFD2FF1C0B22CFB9E55D2@CH0PR11MB5444.namprd11.prod.outlook.com>
 <9d829b21-4327-4cbf-ad72-b3e47d57fa74@intel.com>
 <ZzOb3FtRFAMAQzt3@lstrano-desk.jf.intel.com>
 <CH0PR11MB544468E5716752CB21F19C2AE5592@CH0PR11MB5444.namprd11.prod.outlook.com>
 <20241112203006.GJ5725@mdroper-desk1.amr.corp.intel.com>
 <ZzO-kV7niWsIOiHC@intel.com>
In-Reply-To: <ZzO-kV7niWsIOiHC@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6065:EE_
x-ms-office365-filtering-correlation-id: 20a89ef0-73b9-4514-b0a4-08dd0360037e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?23TzwjnifFny5arAtUOSx8KKAcE2TUEb5Jlw0o+2+NUfm2dewDJ8fXRimyl1?=
 =?us-ascii?Q?8KY6H2APO6J9kN5JeiBVbNIzCWcRRfoqvbFA4hDQ/6yS8ICp1QAPcuS/FguH?=
 =?us-ascii?Q?Yo/0ABtHIpQBuxIgPRcinlhSECN/TMX+f1tHEec7H8jnHVb1hYBKKIJbc5FY?=
 =?us-ascii?Q?Odtd1LpFfeBCi/tbbA7k9BTKnDOlN2oCXS2LjcU5ybXzoc6w/rPcnZd/zuGB?=
 =?us-ascii?Q?m/clp3zFkeA7whJkdtHdDK36/k9yUFbBruew6oV/y+9IZTebc+ZDHTaFVPmh?=
 =?us-ascii?Q?jKZBtRdgUf8peFGaHxTwbw3lFUWgfa/leA/jd1A6v9DBzxQWKVhMykM5++XQ?=
 =?us-ascii?Q?tQtEmMikHvrrNQQC1GZJTD9zeXqC2X9NdA+f59gjIuZR9IiVM9Ayp8/adOsA?=
 =?us-ascii?Q?BjhgxdSFuHwKQGmnb60K3WXeepSGvm6tmrBlND1pSIH1wXgGqjIiIzFGJPde?=
 =?us-ascii?Q?kjwEBoP0FTwt0L6bze6BFO2n1Zn+RbB5WTgoQcDfmS2QoDE6TXPoQwhkzqLw?=
 =?us-ascii?Q?Ee8O4upDVlJDVuQjxGqxPKMy2zYVol6nsJ1/OgWBuaPuD6+oEbCBLUGQ9seU?=
 =?us-ascii?Q?wFHmRpofkN0bO/sNWQP7fVbnv7pO3ASNRvZhVAMNKbXWmai55MJSubtGz7zu?=
 =?us-ascii?Q?RZExJU7zvgsOwUVBHwhUuiGLGkhSCFHWDWW4qMt2lzQmHe/engKk3SOWRdrs?=
 =?us-ascii?Q?lq+eFGzKgvovtx4J+ObuGulDKsOb82vixmh2begYvUkexRu8GAJ7yOISFS4j?=
 =?us-ascii?Q?MICtvNHbSnBbov0/g1H3I4NMjwX3/odd2WOfFrmQhJMX4BrO3ba2Uv70clB5?=
 =?us-ascii?Q?u6stQMVKKXMXCqiZ7ufnLpftaEzxOHAlAEA+1n8Bi8mDfM84NPjb8KbT9k+k?=
 =?us-ascii?Q?rjSOnZmTAuRWGd3gCUawiEiSckGV6UcTtwIIUJBtwAOu63HOs44eo/5qxkpW?=
 =?us-ascii?Q?DI4Sm5uJul+nDl8b4xnfVJy/SiPYTZh1ksvgoH8G6BisDBbAyccmMHpsEs7D?=
 =?us-ascii?Q?7mD4/YIhXXaT7YgMarzsJeIK9jI0jlMj/TM5sUZ9iKsQc+6bgZJWURrm6AcS?=
 =?us-ascii?Q?mjeJyiwwnOuf1KJ5Q/nSIpGUoVxVrO+EVgtsz/1DiqXYkj2yiiUrVG2YLQzx?=
 =?us-ascii?Q?NYNTAbCYTZdVNsuyLi6wSy5zDGuEwsb3UghvqWLKTe3Kf1OOoA92IZLK6KjW?=
 =?us-ascii?Q?cTvd+YgaHhm7dafLP3HpnrKhewKZq/tZ9xw8JXLSiYwtLt/Jtho56yRoPIlB?=
 =?us-ascii?Q?OPMJB+O1W/vetRQJgYJyutLYyf9Rh455xA+4LW0tHV9c8ekkOdmThd1Kmf2i?=
 =?us-ascii?Q?UDgkU8CdCvJuD70PYfcRALvBkV5/ZM9UR9fMURVijdERNq1qTTy2D9cF9bDn?=
 =?us-ascii?Q?BsxqBoQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6OjbFMDGOIp8rv0T+WX+9yU5WsFm1HQ5oPad7BED0qhkx7fbVn4NSFqU2Wzx?=
 =?us-ascii?Q?bGN1KH0fkE7NpFB9vHWxHM6gr/AHuY9X8yHCCe+h0jKNVfH5jBT/LzrOXYev?=
 =?us-ascii?Q?C9oZ2QG9dZhbJaEpm03o00GGTlI2R4kbGcQq+x2eQxxQClS7xHSgbHkUPUaj?=
 =?us-ascii?Q?OsaEC9Pxyn8ig+j4qbPKDr+GOUmOrMCYdZaZNLxsh+dmMfFmOchFt4hhfNa8?=
 =?us-ascii?Q?+RGh/lqELdEvR3IQ9PIIU8fMB2XwLo7Ds3vDNu09YcSBBVBtZKrBv7/h5hvp?=
 =?us-ascii?Q?QQXwsPMXRTzALXbJqA0tJAmDl6BGHQYrsKAejXyTdBcUW+k8A8F4FsAn4FqN?=
 =?us-ascii?Q?T7LIdfyDdOHqbx4C2Od43liSkbREAnWS0BiZO68VmgEVxpeZp5CEiJeRTRSi?=
 =?us-ascii?Q?Hf6/LRx0vbGuqSeqMqvKcdvAadHYVumRueRZ5SrRj3nQIhos+N/jvs7/D/R/?=
 =?us-ascii?Q?rbS6uehjL6oytmAMeZgVqNxSJ5sn3GeRocpmKzLeXSNZvA1V3zLvEO9+l1/S?=
 =?us-ascii?Q?W90SV+FxOGx0qp4vgOQ3YzNuV5RJRbVRTDMpTXkZuTG7aptYG+Dkz/uiUM9z?=
 =?us-ascii?Q?gBeG98lziycqVnpPiREhZngADqfV7q+yMcB/yFQxg8OuGrp14uaFak1pqRjj?=
 =?us-ascii?Q?Ql3XWZ2raygfWxHd8LDOlGVNE5vOaow74TsmPSQ5D8o7h9SiirzKvOtplZ2B?=
 =?us-ascii?Q?pAm9TgX27fGnWcz33RjBm1FpFWK7O5GF0OksLUtYtn7dqfBpl2Oujzk0NaB8?=
 =?us-ascii?Q?q4+ITze2AxlpDaf5TwF55YHSmfQwofPF2J2jEBoJPqICDgub9nLuDTuPO7e6?=
 =?us-ascii?Q?ZsZteHYYokyFYT1GDHNS2orOmpRau+T8psDViXHS/zsC5P64SsfHlFUaL+aT?=
 =?us-ascii?Q?UcBB3xpTvqrPbWxgkH3pHcbPHjXo95udJPOdGPDZU9DWJxreXRPMWkQbCZau?=
 =?us-ascii?Q?KjS4kf+T+TkU6flzy3mja7s6SlYI8WglssO1uz6KbAQ8vLYY/eNbYdjIgatk?=
 =?us-ascii?Q?vQXjWaFzSU80EzOYDTmrR7ppqHcND8vcrwAd14yQ1ywSr6r5i+fRSOCE5XDt?=
 =?us-ascii?Q?yovNREk0JsUe4mkxiGnBuz302OmXJwV4H9i9IpN0OrV/SjWzIwPlUOjF7RDi?=
 =?us-ascii?Q?t/F4JYAzttRAFI9aX0t4v+J2k6A+Y/a8mlCmWecRQjY/cExXB9jHzJVsJTrp?=
 =?us-ascii?Q?LS188RzSE+FHvLWOnBnOyx5x4aA8hvCm8UoLkdNHz2o/Yg+zjFt6nKo/hnqV?=
 =?us-ascii?Q?XSN5mQQkyX0Nz4sd0+eCkMBB0fL3mvxInKco+7H/mBvdwO5yqPyXHRhVbJZo?=
 =?us-ascii?Q?Z7Ds6IkfZIR04Gr7duPMMXwRjwYk9+/sa8L29s99sr3A8grZX9sOnlVKdtfs?=
 =?us-ascii?Q?z9u9HKo2BP3vgIMBidkXYzE5G/M00lfN8DGsl0HBVBhcsnwgwQA335lTGCup?=
 =?us-ascii?Q?8MTbeidqCyGf+djuebHdODTMhlBjlTmmVuQKWy8U/qkmxusw5gLNhk1GbCV0?=
 =?us-ascii?Q?fydBZLQHFj6Rl3UkuccpdnzgbiC4B5sro0FCOfUJLw9mi8KBAK1d2s2RnJjK?=
 =?us-ascii?Q?OeXqz01F9taLwxbjSA9BIVbGUZpTrHjYCwG2xiRi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a89ef0-73b9-4514-b0a4-08dd0360037e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 21:21:46.6493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rlaprz00lMaWeW7EXSLX1rsxy8Ykbwop1meWkui8IW4/qSzU3fZzDWeHVhJeSGFHc0bj03g7qDWN5cXrX5hxTuKYGq7Bsrdwk/Vr01IQRAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6065
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

-----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
> Sent: Tuesday, November 12, 2024 12:46 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Brost, Matthew <matthew=
.brost@intel.com>; Harrison, John C <john.c.harrison@intel.com>; intel-xe@l=
ists.freedesktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@i=
ntel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>
> Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
>=20
> On Tue, Nov 12, 2024 at 12:30:06PM -0800, Matt Roper wrote:
> > On Tue, Nov 12, 2024 at 12:16:46PM -0800, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>=20
> > > Sent: Tuesday, November 12, 2024 10:18 AM
> > > To: Harrison, John C <john.c.harrison@intel.com>
> > > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.free=
desktop.org; Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>=
; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel=
.com>
> > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapshot
> > > >=20
> > > > On Tue, Nov 12, 2024 at 09:59:16AM -0800, John Harrison wrote:
> > > > > On 11/8/2024 15:34, Cavitt, Jonathan wrote:
> > > > > > -----Original Message-----
> > > > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > > > Sent: Friday, November 8, 2024 3:10 PM
> > > > > > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > > > > Cc: intel-xe@lists.freedesktop.org; Teres Alexis, Alan Previn <=
alan.previn.teres.alexis@intel.com>; Dong, Zhanjun <zhanjun.dong@intel.com>=
; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > > Subject: Re: [PATCH 2/7] drm/xe: Add ring address to LRC snapsh=
ot
> > > > > > > On Fri, Nov 08, 2024 at 03:05:34PM -0700, Cavitt, Jonathan wr=
ote:
> > > > > > > > -----Original Message-----
> > > > > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On =
Behalf Of Matthew Brost
> > > > > > > > Sent: Friday, November 8, 2024 9:43 AM
> > > > > > > > To: intel-xe@lists.freedesktop.org
> > > > > > > > Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@int=
el.com>; Dong, Zhanjun <zhanjun.dong@intel.com>; Vivi, Rodrigo <rodrigo.viv=
i@intel.com>
> > > > > > > > Subject: [PATCH 2/7] drm/xe: Add ring address to LRC snapsh=
ot
> > > > > > > > > The ring is currently in LRC BO but this may change going=
 forward.
> > > > > > > > > Include the ring address in the snapshot protecting again=
 any future
> > > > > > > > > changes.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > > > > > LGTM, though the terminology we're using to describe the va=
rious ggtt addresses
> > > > > > > > as "descriptors" is a bit confusing, even if it's consisten=
t.  I wonder where that
> > > > > > > > terminology came from?
> > > > > > > > This is just a rhetorical question.  I'm not suggesting it =
be changed.
> > > > > > > >=20
> > > > > > > LRC descriptors is name copied over from i915 and may even be=
 in the bspec.
> > > > > > >=20
> > > > > > > But yea, indirect_state_desc and ring_desc are bad names. Wil=
l change to
> > > > > > > 'ring_addr' here.
> > > > > > IMO it would probably be better to leave it as "ring_desc" for =
now as it's
> > > > > > consistent with surrounding struct members.  We can do a pass o=
f the full
> > > > > > XE kernel for inaccurate uses of the "desc" qualifier in the ne=
ar future and
> > > > > > fix the naming scheme here as a part of that fixup.
> > > > > I strongly disagree. Just because A is broken doesn't mean we sho=
uld add a
> > > > > broken B and C! It makes no sense to add a name we know is bad ju=
st so that
> > > > > we can change it later. Anything new should be done properly from=
 the start.
> > > > >=20
> > > >=20
> > > > I agree with John here.
> > >=20
> > > Okay, I submitted a patch to change the name from context_desc to con=
text_addr,
> > > and it was rejected because context_desc is actually correct.  But if=
 context_desc
> > > is correct, then would ring_desc *also* be correct?
> > >=20
> > > Pinging @Roper, Matthew D
> > > -Jonathan Cavitt
> >=20
> > As I mentioned on the other thread, "context descriptor" is a formal
> > hardware term that has a very specific meaning --- it's the 64-bit valu=
e
> > that gets programmed into the ELSP.  The context descriptor contains th=
e
> > various things inside of it, including the LRCA.  It's documented at
> > bspec 60419.
> >=20
> > The problem today is that the capture code is using "context descriptor=
"
> > as a name for something else.  We need to decide what the capture code
> > should really be doing.  If we want to capture the true descriptor, as
> > used by the hardware, then we should fix the capture code to record and
> > dump the proper value.  If we only want to capture something else (e.g.=
,
> > the LRCA), then we should rename the fields for what they actually
> > contain.  But we definitely don't want patches making statements like
> > "context descriptor is a legacy i915 term" since that's just not true
> > and will confuse people who read this in the git history for years to
> > come.
>=20
> I liked the variables named after address better. But I totally agree
> with Matt Roper here. Plus we cannot break userspace. There are tools
> out there already parsing 'Desc'.

Okay... Let's bring this back full circle.
Should the new variable for this patch be called "ring_addr" or "ring_desc"=
?
Ideally, it should be named after whatever the return value for __xe_lrc_ri=
ng_ggtt_addr
is, and on paper that should be a ring address, but the function xe_lrc_ggt=
t_addr
returns a context descriptor, and the function xe_lrc_indirect_ring_ggtt_ad=
dr
apparently doesn't return an address or a descriptor, so I just don't know =
any more.
-Jonathan Cavitt

>=20
> >=20
> >=20
> > Matt
> >=20
> > >=20
> > > >=20
> > > > Matt
> > > >=20
> > > > > John.
> > > > >=20
> > > > > >=20
> > > > > > My RB still stands either way.
> > > > > > -Jonathan Cavitt
> > > > > >=20
> > > > > > > Matt
> > > > > > >=20
> > > > > > > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > > > > > > -Jonathan Cavitt
> > > > > > > >=20
> > > > > > > > > ---
> > > > > > > > >   drivers/gpu/drm/xe/xe_lrc.c | 3 +++
> > > > > > > > >   drivers/gpu/drm/xe/xe_lrc.h | 1 +
> > > > > > > > >   2 files changed, 4 insertions(+)
> > > > > > > > >=20
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/dr=
m/xe/xe_lrc.c
> > > > > > > > > index e219657535cf..afb0f4f44748 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > > > > > > > @@ -1636,6 +1636,7 @@ struct xe_lrc_snapshot *xe_lrc_snap=
shot_capture(struct xe_lrc *lrc)
> > > > > > > > >   		xe_vm_get(lrc->bo->vm);
> > > > > > > > >   	snapshot->context_desc =3D xe_lrc_ggtt_addr(lrc);
> > > > > > > > > +	snapshot->ring_desc =3D __xe_lrc_ring_ggtt_addr(lrc);
> > > > > > > > >   	snapshot->indirect_context_desc =3D xe_lrc_indirect_ri=
ng_ggtt_addr(lrc);
> > > > > > > > >   	snapshot->head =3D xe_lrc_ring_head(lrc);
> > > > > > > > >   	snapshot->tail.internal =3D lrc->ring.tail;
> > > > > > > > > @@ -1693,6 +1694,8 @@ void xe_lrc_snapshot_print(struct x=
e_lrc_snapshot *snapshot, struct drm_printer
> > > > > > > > >   		return;
> > > > > > > > >   	drm_printf(p, "\tHW Context Desc: 0x%08x\n", snapshot-=
>context_desc);
> > > > > > > > > +	drm_printf(p, "\tHW Ring: 0x%08x\n",
> > > > > > > > > +		   snapshot->ring_desc);
> > > > > > > > >   	drm_printf(p, "\tHW Indirect Ring State: 0x%08x\n",
> > > > > > > > >   		   snapshot->indirect_context_desc);
> > > > > > > > >   	drm_printf(p, "\tLRC Head: (memory) %u\n", snapshot->h=
ead);
> > > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/dr=
m/xe/xe_lrc.h
> > > > > > > > > index 9d64cedc4d14..a2058a501353 100644
> > > > > > > > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > > > > > > > @@ -25,6 +25,7 @@ struct xe_lrc_snapshot {
> > > > > > > > >   	unsigned long lrc_size, lrc_offset;
> > > > > > > > >   	u32 context_desc;
> > > > > > > > > +	u32 ring_desc;
> > > > > > > > >   	u32 indirect_context_desc;
> > > > > > > > >   	u32 head;
> > > > > > > > >   	struct {
> > > > > > > > > --=20
> > > > > > > > > 2.34.1
> > > > > > > > >=20
> > > > > > > > >=20
> > > > >=20
> > > >=20
> >=20
> > --=20
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
>=20
