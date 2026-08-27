Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15401C61DB9
	for <intel-xe@archiver.kernel.org>; Thu, 27 Aug 2026 04:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9FC10E387;
	Thu, 27 Aug 2026 04:34:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VFGA6uta";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0E10E387
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Aug 2026 04:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787805263; x=1819341263;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G8YCkgX55f884qvr7bPRENRQKQFukJm/MimdpbC+Lfo=;
 b=VFGA6utaVNo1Hl69xRP3/Yncy6hTlMsDMgIBIyx6PLnPlC3tYwe8j/jI
 Dfy1Vgx2Cr0/MJZMOrmUVniAEp+Zzx4wdQvtzX0h9Gld7RQmXpTLGHMgW
 z3v/RxH5DULrgnUJ0FSpfvNiu53VKyjaLyKbOmErEuIkrTShcG3ADxKna
 +b6zgGA4aFvs7oeFvTe098HZmeVYbEKYmn/097XyV6qxAibQ4l+zww9Bl
 NuciPT0dY0mcKgCJwm+NA+uNMIkw1rEDSozTWdvcvM2RzCGFxzEba4okp
 jS52G6gs2MfC+7opR6euznjbljwGwuqxurBOW5kBzB6Mt/2Oof/DdZhEn g==;
X-CSE-ConnectionGUID: K217sNXWRdaVETOOV5oiTA==
X-CSE-MsgGUID: oyeEMu2VQ/C0pLReJb0Q0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99649189"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="99649189"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 21:34:22 -0700
X-CSE-ConnectionGUID: WiR2c28sSi2Ywk21krDA1Q==
X-CSE-MsgGUID: VobLpUQMTBm5pBaW9yHg/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="264522226"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 21:34:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 21:34:22 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 21:34:22 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 21:34:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVXV1TL8thItqLQ/CejliSuPC+JZfCPgUrTIGpLM5rm7e9QipSgz8qboaK2MOTmkb5OzOfwoSJSA40cJ0RZXXO3NBZKXryFhxVCFje7XaL3iOV2GDprrTvTwGy+nEfSlQltji4pa0rKEhvt88dSu634czq8uyd/vyvdE0d7zfcPCoM695/uIbeU5IPwgrGaYJ0dapGEvvBRwbdXTDb1NhHMceur+rATPlChiJ5gzXPO3V5nDvgRGQtIfQrAnizbkwYTcOVp6i7LB9FpHaDux1uzVaVOq3wlGGcjBsEXGxmoT3MH/GEjVBjhH4d9sBYutWdM9cDAFgDk/tHX+tqhirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ir+RQdBHmgaeHhWmDWNHDmpvc1R8d/ISdiB0XMmwGsU=;
 b=H+I+UUTEm4O5q82vJav9Q0FdGt3k7MKKslO2Fy+oj9MTh7sfVXRrQX9codldV3519c70T/Od7R+TrwqvU8rhOcSXxlzIc1fTcs76sbAGg/crjfC1CZQmTTwYLCmQy1pxLX2BdzcSBAxTQ8gFVegfP1Btyg2UecDc9Qs/khrq2lpJRv050++DPjZmRPf4qYPsZIWgA0VgFOiIsw8mSbJ2D5B2FceSmOJjBUOsa8/s2ImdIUxw7hay3W21WANotwnJ1DH4eKj8pVwOwDF7UcoF8ZyGvP+QMu8o43fFWmSL+yN9Q/XX51N9mbP+UaiIBH6bfWoRF2suxmq+j6M0qFUDtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB7625.namprd11.prod.outlook.com (2603:10b6:806:305::12)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 04:18:57 +0000
Received: from SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3]) by SA3PR11MB7625.namprd11.prod.outlook.com
 ([fe80::a120:f916:60ba:5ad3%5]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 04:18:57 +0000
From: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Thread-Topic: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-queue
 platforms
Thread-Index: AQHdNU3d4Vo72grrDUyBOnuU/lMDC7aww0sAgAADvYCAAH5BwA==
Date: Thu, 27 Aug 2026 04:18:57 +0000
Message-ID: <SA3PR11MB7625554F8C1CBEB9A032A900C8AD2@SA3PR11MB7625.namprd11.prod.outlook.com>
References: <20260826112533.3289978-1-tilak.tirumalesh.tangudu@intel.com>
 <20260826112533.3289978-2-tilak.tirumalesh.tangudu@intel.com>
 <20260826201034.GL681121@mdroper-desk1.amr.corp.intel.com>
 <ao9LXSeD1awMkzdD@gsse-cloud1.jf.intel.com>
In-Reply-To: <ao9LXSeD1awMkzdD@gsse-cloud1.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB7625:EE_|PH0PR11MB4917:EE_
x-ms-office365-filtering-correlation-id: 7570b97c-5da5-4f28-9a82-08df03f2503a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|3023799007|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info: MpoD6J0D2ltjcWD4s0yyK0SQY0VQnMHUYMRNSLN3gmgF7IJV+n1xAoOFNBn0tW0nwp3ZcidjSiBjmqK7LnkHC5a3sggyftjfS2qY6RXVAJLhupwfy528zLquFJOGxmqqMiFOZWxBwwhetoSYP4mK9OYg3h6rE+OiMyk6N+rpzGI5wrBTFq5OYXIiVjv96XIsBgUvWDDQX16GfVNzh7hn5T38DNWUq7L4GbmMC+nsqBfl6AG6Th0PVS5/j3DJWl7vTUU20ZUwJulGncyyPa55O3njEn6GH2bxYKZRkNMecCwP7vRyt0X2R1A1mniq3bxmzmV7xm5w8oyqUt8ysTmYojVvPOh3Sua0Yaq2FRscQ/Eh7HpMOgOm/aOJMlOd7hSc14LE+WUjF4oN6QPnCiyRheauvVuIDugvLE3R3MhqJxneZTtVViiEP9mN4r481UI4VHDiqVwcLNBmhm+lYfVZj8yOnUXNssnWu9jnkzxU3o6huT0RxKPvD6eRes5Gho3Te9w7TRmSi+jwdngz9hqkshbJu+l0ttMI4wVJldfnuR2Jcq+CAxoMAvrqd70fLbLm8zs5xBJYGdj5iiA/OdpRtH490aJOTri0NZrUgAKXn3P7N5MR3RKhn6Tx3sC2VNblWqg8qCNGCA+OIZoizRpHoEIrKTtCnlsdl2fxBd49es6892MB0ZPXPLvFqzeNJqt/naNdJ6J0ZpumTKlKqSrLauibx9KTcBPgV4ZJuEYRhAI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7625.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(3023799007)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9tOhwPMPpm8rOAqaR1dtVF8TbUg+g9vrm/0hyU2Q7prHAgpgxJk2LTZIO4S9?=
 =?us-ascii?Q?NrSGyT6CCVg9pMuPYobj1YuFSR3niE371QucBcigb64VCA13QnslEexP3f5V?=
 =?us-ascii?Q?Mh60u2NAEUb4LU+OJXYUEY7wDgT4xjT6nkcYBi952U4Cc+L3+eaq0/q3rTt1?=
 =?us-ascii?Q?wnHK4yCbZGkfE5YEFG8i4qe0F+oXgeCUoGW827ZDKomOXkx30hNXvXsoV1sJ?=
 =?us-ascii?Q?FVQ2yy9WGNedjdpoLO/uIQM2czYOT5xiP90Vh8BakrWU+2UP77UNhsCIC2qo?=
 =?us-ascii?Q?+Dosw0ubWiNL4UBreQh/+MERRX2as8Y7Qezwlb83E7nmSjWxDrXop4SY/rnF?=
 =?us-ascii?Q?EfP+8qg8qwFerBx2iTahC2ssWcLmsso7Ju0xopDV+5EsAkFxXs0zxGSguN6h?=
 =?us-ascii?Q?5d2l9KOXnoMfLfupDEEDTwVkz1ZSCI3Ns5Wkl5Fcm6B4JdKuoqJv5ACKvZLI?=
 =?us-ascii?Q?XY3MpTe2ddOv9t4n7YN/8jpMVyExx6frTdGe9T5YlJj7d7MEdqDlckP3TEb8?=
 =?us-ascii?Q?VsSGKZmNDecHYtFyuZn49hAFYy6fZlYwz0gRmA/QkYJb4KCcgKEp+mg17XKA?=
 =?us-ascii?Q?9VPMlXw6tc5vCDO2jWxha5pWWimXxt2jIqIZcp2eX6nmFoVkI/tW/J8Sn5pC?=
 =?us-ascii?Q?2MO5U44sos0x2xhq77gNL2x8spb/6JE0Hsj+fV0DrZ8mbKe9x3d78LKDPd8/?=
 =?us-ascii?Q?0IwLT9F3MQGVko7Vq9TDW/+zw3SNbebWlBT0Fef4tUhGmK1rwztDegMz3c8r?=
 =?us-ascii?Q?l/wrKt5uNu27Wl4mH+x8Oem895yiWhNx5Dc74/rbmzDYQ3xzxdwoCCS2Pxb1?=
 =?us-ascii?Q?7e9JZZDPlMNNtB6BgMvUMpuA1248R08EazIVL3p5mz4RcEpYqxlsKBsQjhYj?=
 =?us-ascii?Q?tqk7AwvlAsv6CJFQ/0qljS0teOPxTasjK9irKK551y5JZkFqsYaQQlxAkXw8?=
 =?us-ascii?Q?uxH7jOPnhzdqXTZJFBah0eQNvnGgH3b2Z2tZidO5gEJykJU2B3tDOKZYcElL?=
 =?us-ascii?Q?0DAa78+qjlowzJTGDyUgMqc2RN0hAmxPQzVMPO0QLd2G9qXT9TLWfMP8aKP4?=
 =?us-ascii?Q?7pQdlo7OcWOiQ2VJ8pLa3pfaB24i25hVfs8Wjpj3q0FvjHaXW59XAOpjuEVc?=
 =?us-ascii?Q?S2xNgiKWWyxkkjAG3ooZTaGJn1HZMOaq4wKokKyEzOc6CiH3q4uv84WdyAF1?=
 =?us-ascii?Q?uw4aLUFDnM0kezfvCM1RjvmLWeJpv2CSCvXhuAVfza9sUGzHS4nBOTNIkZ7U?=
 =?us-ascii?Q?dkPd+v1/h1wNUhD9DkLfhrOiCJ0gVyBZNiKy9pSvAMS+LKIeqNaSLsBdTag7?=
 =?us-ascii?Q?hCOO7lUL3/icCTLeNrJTqTiyhHUJtk9jjVRiOttWyAqWu1bsb1306oVG9Spf?=
 =?us-ascii?Q?p/evj6icMJcP4knXPjIs501NHtwMVoMyzgL58Wsg+e2D9MFTgovtMpMhsVqQ?=
 =?us-ascii?Q?/69pSikT7LA+ijBylQZ/T9mkZJrPsVnguF1qKnMtuC8Cfbda/4VQIWI/QGFI?=
 =?us-ascii?Q?h6hsotNel/k8KAce3YiittovHlCPwyleeAiIwNjyCLomix2EEYYpS7U931nY?=
 =?us-ascii?Q?V7GKQs5j0OvB07ae5ZlS1Osw/WkA+ogQ3Kch5vyzDvAImUwJIoqUY03kon/b?=
 =?us-ascii?Q?TfJ/qymDVS9i7lvRMSgBvPbMSZ4/RoF8lJSycDNFkiIwF6RBCYB9P+TlvyXe?=
 =?us-ascii?Q?S1FZE0PeG5y+U6qTS++pOJlPM1o9uJMYYhT2R3O/HbYa4dp+eUwi/UnKRARb?=
 =?us-ascii?Q?x5xHcaVtPDK2mRAL19VzZdTl6w7pC7A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oBuvtaSg9tkT38SBYTvsZUmTn3eyoS1Qj7mBkcDoinFp8Prnde1XJuBwt90cVa4OJu3I0EMNlvIqkJNDl6cwf6yl6Z9vhmfPnytDlvzjImqxamIEX38ALeQJn2AafodhCPIDR2mR01f4ckvsUzBIDdGIvj9EiYwr0Dm4hOqp3vL4Mieezn5IFzya2oTqQ9y5TO0fCFx2IhZpRtxODh9+/2kvs8rY0RDzevZfDDyQrgmh9wKUGAJghUj0xqSxstLTucc7vHsCQNx0GakIUmZkvekpKgbIbCurpCHq7gTE1icn7we/8U1K1tChqx+3UeLh70KRZZ1Tw9dyKJshqBGjFA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7570b97c-5da5-4f28-9a82-08df03f2503a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2026 04:18:57.2750 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: awFq5FMTfTRPwCVt/x8exHxCA5HkiaZEzrzcyg93hENdF6QLbeVrIPANZJKBn1AKLtuM1C2/ihrtGAiMlxEInE6FpiUq+Aoj8IA5qNt7n02b1exL5r5cMvyVzWac0zw3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
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
> Sent: 27 August 2026 01:54
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Tangudu, Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>;
> Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [PATCH 1/3] drm/xe/ggtt: fault on unmapped GGTT for multi-qu=
eue
> platforms
>=20
> On Wed, Aug 26, 2026 at 01:10:34PM -0700, Matt Roper wrote:
> > On Wed, Aug 26, 2026 at 04:55:31PM +0530,
> tilak.tirumalesh.tangudu@intel.com wrote:
> > > From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> > >
> > > On multi-queue platforms an engine can retain a stale GGTT TLB entry
> > > for a range that has since been unmapped and recycled. When unmapped
> > > GGTT entries resolve to the scratch page, such a stale access lands
> > > on scratch silently instead of faulting, masking the error.
> >
> > Drive-by question; I haven't reviewed the changes in depth.  How does
> > multi-queue relate to GGTT here?  Multi-queue submission is something
>=20
> The ring buffer is GGTT mapped (?), multi-q doesn't context switch like n=
ormal
> q, if we missed TLB invalidations we get slient errors as scratch could b=
e
> prefetched into the TLBs - this is my *guess*. More below.
>=20
> > userspace can do, but those userspace submissions can't access the
> > GGTT, only the PPGTT.  GGTT accesses would only come from privileged
> > instructions that the KMD inserts into the ring and I don't think
> > those are ever multi-queue.  Am I overlooking something?  It seems
> > like GGTT and multi-queue should be orthogonal.
> >
>=20
> Also my question from the last rev has yet to be answered:
>=20
> I'm a little confused about the rationale here. Can you elaborate on why =
this is
> being done?

Apologies for the response miss .
>=20
> I'm inferring this is done to detect missing TLB invalidations but this i=
s not
> stated anywhere - i.e., a reader of the code can't lookat the at the git =
log or
> comments in the code to figure why multi-q doesn't use scratch and everyo=
ne
> else does. Likewise the commit message should or code comment should
> answer Matt's R question as well.
>=20
> Matt

During secondary queue append, Guc does lite restore and skips full context=
 restore, so
TLB invalidations are missed.  This was observed while running multi queue =
tests
on another OS. We now detect the miss and do explicit flush on unmap.

I will add this in commit message and will add one liner comment in the cod=
e
Tilak

>=20
> >
> > Matt
> >
> > >
> > > On multi-queue platforms, skip allocating the GGTT scratch page so
> > > cleared and unmapped ranges hold PTE=3D0. The whole GGTT then
> > > consistently faults on unmapped access for the entire boot; other
> > > platforms keep the scratch page and are unaffected.
> > >
> > > v2:
> > > - Add xe_gt_has_multi_queue() helper and address nits (Niranjana)
> > > v3:
> > > - Drop scratch entirely instead of toggling per-unmap (Matt Brost)
> > >
> > > Assisted-by: Claude:claude-opus-4-8
> > > Signed-off-by: Tangudu Tilak Tirumalesh
> > > <tilak.tirumalesh.tangudu@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_ggtt.c | 39 ++++++++++++++++++++++------------=
--
> > >  drivers/gpu/drm/xe/xe_gt.h   | 13 ++++++++++++
> > >  2 files changed, 37 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
> > > b/drivers/gpu/drm/xe/xe_ggtt.c index 8ec23862477f..bd65100283e3
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > > @@ -20,6 +20,7 @@
> > >  #include "regs/xe_regs.h"
> > >  #include "xe_assert.h"
> > >  #include "xe_bo.h"
> > > +#include "xe_gt.h"
> > >  #include "xe_gt_printk.h"
> > >  #include "xe_gt_types.h"
> > >  #include "xe_map.h"
> > > @@ -533,27 +534,35 @@ void xe_ggtt_node_remove(struct xe_ggtt_node
> > > *node, bool invalidate)  int xe_ggtt_init(struct xe_ggtt *ggtt)  {
> > >  	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> > > -	unsigned int flags;
> > >  	int err;
> > >
> > >  	/*
> > > -	 * So we don't need to worry about 64K GGTT layout when dealing wit=
h
> > > -	 * scratch entries, rather keep the scratch page in system memory o=
n
> > > -	 * platforms where 64K pages are needed for VRAM.
> > > +	 * Multi-queue platforms leave unmapped GGTT faulting (no scratch) =
so
> a
> > > +	 * stale engine TLB entry can't silently resolve to the scratch pag=
e.
> > >  	 */
> > > -	flags =3D 0;
> > > -	if (ggtt->flags & XE_GGTT_FLAGS_64K)
> > > -		flags |=3D XE_BO_FLAG_SYSTEM;
> > > -	else
> > > -		flags |=3D XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> > > +	if (!xe_gt_has_multi_queue(ggtt->tile->primary_gt)) {
> > > +		unsigned int flags =3D 0;
> > > +
> > > +		/*
> > > +		 * So we don't need to worry about 64K GGTT layout when
> dealing
> > > +		 * with scratch entries, rather keep the scratch page in system
> > > +		 * memory on platforms where 64K pages are needed for
> VRAM.
> > > +		 */
> > > +		if (ggtt->flags & XE_GGTT_FLAGS_64K)
> > > +			flags |=3D XE_BO_FLAG_SYSTEM;
> > > +		else
> > > +			flags |=3D XE_BO_FLAG_VRAM_IF_DGFX(ggtt->tile);
> > >
> > > -	ggtt->scratch =3D xe_managed_bo_create_pin_map(xe, ggtt->tile,
> XE_PAGE_SIZE, flags);
> > > -	if (IS_ERR(ggtt->scratch)) {
> > > -		err =3D PTR_ERR(ggtt->scratch);
> > > -		goto err;
> > > -	}
> > > +		ggtt->scratch =3D xe_managed_bo_create_pin_map(xe, ggtt->tile,
> > > +							     XE_PAGE_SIZE,
> flags);
> > > +		if (IS_ERR(ggtt->scratch)) {
> > > +			err =3D PTR_ERR(ggtt->scratch);
> > > +			goto err;
> > > +		}
> > >
> > > -	xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0, xe_bo_size(ggtt-
> >scratch));
> > > +		xe_map_memset(xe, &ggtt->scratch->vmap, 0, 0,
> > > +			      xe_bo_size(ggtt->scratch));
> > > +	}
> > >
> > >  	xe_ggtt_initial_clear(ggtt);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> > > index 65a4655b0994..92d934d50244 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.h
> > > +++ b/drivers/gpu/drm/xe/xe_gt.h
> > > @@ -160,4 +160,17 @@ static inline bool
> xe_gt_supports_multi_queue(const struct xe_gt *gt,
> > >  	return gt->info.multi_queue_engine_class_mask & BIT(class);  }
> > >
> > > +/**
> > > + * xe_gt_has_multi_queue() - Check if gt supports multi-queue on
> > > + * any engine class.
> > > + *
> > > + * @gt: the GT object (may be NULL)
> > > + *
> > > + * Return: true if any engine class on @gt supports multi queue,
> > > +else false  */ static inline bool xe_gt_has_multi_queue(const
> > > +struct xe_gt *gt) {
> > > +	return gt && gt->info.multi_queue_engine_class_mask;
> > > +}
> > > +
> > >  #endif
> > > --
> > > 2.46.0
> > >
> >
> > --
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation
