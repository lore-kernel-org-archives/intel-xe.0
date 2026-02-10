Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43903EA3F16
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 07:35:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB66210E385;
	Tue, 10 Feb 2026 07:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qdmuccc3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CAC10E385
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 07:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770708915; x=1802244915;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m+pFXw874fGRxgU8+6O0hlbMJX7J7VUFlXB+GUbej24=;
 b=Qdmuccc3r9Qz3SgxSh/xA9cqIGnvcDxRjBkoYVK5ut11bw4Scc1zdj7C
 DMlXRcK5NRAg0oGYudQYWBoOn5cPdxxjO/ON8dpuByEb1xSyzqjww45Wz
 rvCWSJKBh/r/NzBz29JwTmbN1z+CEXMEb1WmaXMvZHPynLKwQeFH33z9k
 DzQLjP+jOuX/NdKEmfGD0Qz1uPHVcypolMlnTVNuJ6BoR1I2a5vVdkq0G
 zXoEzI6dUhlR9z27W969ZE/3Rc4vyVm+WCZa3w0SdbMW+wAXoaFhnzFu9
 HM75KLbcAor5Lo4FsxaQG096ETq0db0GfcljabRmKCuT9E8ySuz/e+k9d w==;
X-CSE-ConnectionGUID: dGNE3s64S9q1jGfPD/CrGg==
X-CSE-MsgGUID: k/FHErVuT9W+xXXMLLuXeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="89415326"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89415326"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 23:35:14 -0800
X-CSE-ConnectionGUID: r0AOnyqgR9idGW1IzyFPTw==
X-CSE-MsgGUID: D9hi4En6SeCbfFUjozllLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="234794675"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 23:35:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 23:35:14 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 23:35:14 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 23:35:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjgVtHLskYLsf+aTm3nbGWqYW47Wbh2ULmcAwfC7Bv0gDWasMC664RebJ9q/G+WYewmmCKXMKayc2xLPdH2N5ugYuyUS6iW77C55s0TidFxKEf7Zf1m4LhgziqcasJufO4Sea7z3YW0NoSidRB2Fjkc9NmPfkopN8k2A+aaZz0sEd8KvFreujXXr70GHYwh1vl9hi0P6LNIPFosNqZb/G837ogQrAhC27o7VC1ykFcykoXt2EFTT/xGGywNCbs4qmRqWae+pe79T5cmEJO6DYbSf8InNwZAkjaXPWD5FNpjzIvG0kZI52+vAU1GoYSmIZWcOIdqzHrSqHkVv0zoDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THy2McemuNicPCK44A+oKudVMV1EwfQtxcEZpqb4Zsw=;
 b=Fjw7cpWugfR8bUD1ARdX4RhSXP+Jrfx7cidTa+FK4M+UHxLWV7ymDCleczEvWKMf+fScMqVi5ErPHC7YBXO01E0Z94PJHya4yNdeVPozgmzCUjrJtLDpHD+dAjMUayJNmhmhAymPe0jJVrjPXhZsNlRjnpd+ysd+W3jcoUuZ2AoYjpKfoDkk70GGJPrQHqCw2mVwsWXsJ6bZfI6qWvWSdGKIi8WLcCzPVJXnLkdtLLD48yjYrlF/9Oqs1BWvUg/hnXNu8S7K36Q4ulnqL0f0soZcNPr/PV2ZtY2UrLVNf6zs3EQCZ3RZktsAx3jced/1jWN2FZ8Lj0RBNwJ7MuGMxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ5PPF6806D69E4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::831) by SA3PR11MB9487.namprd11.prod.outlook.com
 (2603:10b6:806:47e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 07:35:12 +0000
Received: from SJ5PPF6806D69E4.namprd11.prod.outlook.com
 ([fe80::16a5:1a74:21d8:8e3d]) by SJ5PPF6806D69E4.namprd11.prod.outlook.com
 ([fe80::16a5:1a74:21d8:8e3d%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 07:35:12 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
Subject: RE: [PATCH v3] drm/xe/xe2: Apply Wa_14024997852
Thread-Topic: [PATCH v3] drm/xe/xe2: Apply Wa_14024997852
Thread-Index: AQHcmlE6kLXN5PsFEUy8w56i/3yXvLV7eMAQ
Date: Tue, 10 Feb 2026 07:35:12 +0000
Message-ID: <SJ5PPF6806D69E4F3EBB2FD7D2E0681F359D062A@SJ5PPF6806D69E4.namprd11.prod.outlook.com>
References: <20260210055023.890477-1-arvind.yadav@intel.com>
In-Reply-To: <20260210055023.890477-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ5PPF6806D69E4:EE_|SA3PR11MB9487:EE_
x-ms-office365-filtering-correlation-id: d63638ad-a584-408c-69b5-08de6876ed21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LcjKu/IWtb/JgYA1eRp9aKNjK6qTAv2/4h7qKwXnR2qtiFz2TOMlNcj6Q/x+?=
 =?us-ascii?Q?rbfelnHURMJ0UD5AUDbdXYockJVlYaOPCMYRA/tEmHaAsR8DpSsYUStkShq4?=
 =?us-ascii?Q?YAx2bmYYAZT5AGcBW1ig3yNeM7On+ixpv7wQp0dYQOzoIPwDIeWNE+InpSpd?=
 =?us-ascii?Q?Brgds0+eClpibpVeYHdW3/f8gHtQyd1cA+Ex0X+ipcRx8OGtBgK5Et0P7SCK?=
 =?us-ascii?Q?z+v6iSxYpzQAP3GgppOiSlCoK+x279LocDtNmhlJj6ygaWlZbKkd2sE73tlS?=
 =?us-ascii?Q?PS718x3CNS7OGgd1TLe/DMk6HWZ0yA4rpiytBHciXdRD9WBEyfqF78rmsFkD?=
 =?us-ascii?Q?Mma/68VvSSao+tEkyg86GIJhHUZIr0PaVPlSp/q2k/DMCfjzg+RPAaPCw54U?=
 =?us-ascii?Q?aaj7RNaBzwTwJ88HkQmK3pxo9VCdefTDlwfJ54tbW/j6sftEdVRu51sktYLK?=
 =?us-ascii?Q?Uyr17wnA5MZVpDVDxxP0WTkBq8L4Pg+srMEoPuPKmoBEU4USmzXjqxHJXphC?=
 =?us-ascii?Q?WvSAZOXsxICZRrf7f/LV37OiCNM8RH400nc1vFUsAuFzL2gtcwAtrVeRYlDP?=
 =?us-ascii?Q?j08MtcpAikqe+My9SY+P9pmTdpEXHJ/PN5E3Ey5IHPsiJxGsxi6lyclnQ1mA?=
 =?us-ascii?Q?9BlAQ0JEcqzDWt0GIZGg7vwA3OKpFZgRWJjRlQ8mcfT2+mQxPNTwf8EdFeA+?=
 =?us-ascii?Q?tf5WY843hgu8qgJBhlaW9qJdqGvQLYiQQu8XmH6p05U8vLjbM6wyRA47QfNl?=
 =?us-ascii?Q?aXKC3vWOBXWfvv9GWkKwd4XGaz0pn6XuQCYEwMKhzXg6+S701qwJjcfK6Px7?=
 =?us-ascii?Q?+T+M+981arRdZvH0GbDG7mu1LI8//zbd5F6zgbF7j1CNhYcEEvR3FJ1FbneS?=
 =?us-ascii?Q?xdIbu5czdSKQILz45HMS0HZnZYQPKMxvb6n61PJHWz1am0YdyFmA3aXZaaY2?=
 =?us-ascii?Q?1XVXTR2xYIvdgtB6NoCX9+eAbYGx4r3P+M6BVzOa2qALJhDJndOs9PUhxq//?=
 =?us-ascii?Q?8ePwoCI9gNziN+0STdZZjojA0kV/jxTsRFxCv5nBpDqYQJgeubJC/yq2Zkwb?=
 =?us-ascii?Q?sQu9Ci/fcZjg05laxcb1h2VY+OiwpePN0Tn+7Wpa9Rgj1/R31ta4vF7nj6Qm?=
 =?us-ascii?Q?UjRbVY1+G6wiKpADLGLrvsKj+GZ07x0yqVLmr3PnVi3SA2KYFRgqOaDwj7nS?=
 =?us-ascii?Q?vKKou92g0UOi70FsehMlTXOK7nj8x97eBD5cOKgPccMSIvBBrHnbSzN4TIOK?=
 =?us-ascii?Q?zqD9lts/EMBdOaqT5EMXXtGWyLIL/+foavcvTU+hptfrWtu+f7QOHkPvGP92?=
 =?us-ascii?Q?YsF9OG6aERXo3LfRdvQXIpRao0xdEzhN/B9MpXCvRgk05jJ+M2y5vel1AmXr?=
 =?us-ascii?Q?gW9VjhNBpAYkrXvQtHuJF52Rr9YtU0Qjfu8bISbrzGx6USF9dQTEDEviM/gi?=
 =?us-ascii?Q?JZV9SiQ5BZ/QmbL7c2sv1Tg5qWTTi3oQh1pxTByc7uZoN2AYNRS3xFU3oIzu?=
 =?us-ascii?Q?w9yR1ZaMd/gzXJ+fgmzKUlgFuUpLZk+WLoMwH6ZiNA0TLJJHDqKpNH0emxSv?=
 =?us-ascii?Q?FlWFWZZsTwmNCPCkuRndd8+W5OG/8VHcRHok4brQRbwOfKHihGHpux0410GU?=
 =?us-ascii?Q?SE5it0Qu1Kr8aJytWfODGfg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF6806D69E4.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sgHE5rPOvdJMCLPBLKKsWO+PYO2VW1qHPbUbB1zxoY0TF/Rqq9yklsMdAH1I?=
 =?us-ascii?Q?Vo3iWK+q0p04LE5xWSp4ce9tHMeZ+RAd0L1OH2EQdZ73dR2+cQujNmxSxFfQ?=
 =?us-ascii?Q?7kXAcMbVBRKZc3dKGlC0f0baAPkfC0yPsboYv9ZWd+KQK8weI2naIUoYCdf/?=
 =?us-ascii?Q?JKSRzDq//yB/bRoAmRJLxdwyUe7yEoJVQuEOU6uRc7QhErlNrWRZUd1QxVhZ?=
 =?us-ascii?Q?tu3idkCwdn7ncw3T8lB+19YrcM/hBRsbLej9n47UCz9E+SfkSUvvxm+v/xyy?=
 =?us-ascii?Q?T8eAqQ3UPyUiduFxOMAKn+lgh/Tla9+qq/xUfr8kLgDD4gz09v+yNkiPImTc?=
 =?us-ascii?Q?I/b51RnLEMRoXUGrlQM6fqBG+5CefJH0OoffoH5IYtLTWHkvVIqk/tdyZhad?=
 =?us-ascii?Q?KBBC6JunM/SmokMbpUSIB4gXjAOIHq5/zVuHx4fmOKA+b2PEam36MeuoKEFY?=
 =?us-ascii?Q?I4Zku5AkmQKZ0eR9lFevRKF//GlamaMVjgX/0WbHbpXldAyUrSoUbbdKKRdX?=
 =?us-ascii?Q?jsLQe8VhA2TcZXkE5aoDf3YqKaTbiCNsGvrQp3CmNEO9vs64+ah+Bbr88Gs+?=
 =?us-ascii?Q?I2C6NnM6A6RSedLLZAVi5ampXf4kI2RwJfT72Pv6Tu+Xu2wKQiV5/A83Z39b?=
 =?us-ascii?Q?EE0THxe9oTta4qvx3w/yCQHFXniZM++yVmBINrHjWjk4xIIRRMFad0Ie111Y?=
 =?us-ascii?Q?JflBmPZ9g+8HMpFrFYoPyFa2D6age/QRXDR4q2jyBa/+KlaKh3fU88bD9VnY?=
 =?us-ascii?Q?EMiB2qa64cugN3lH2he8+PBhbh///LviOROQFdrXVNaNDwDY6/jrj4vfCqon?=
 =?us-ascii?Q?5bHXLWFf57cWiwd1l6bbOiNOHvwJIvFmYgGbYghlnGTW2UKNgnZm8WzMC1kh?=
 =?us-ascii?Q?62YFmD8+FvgqvQ2hNm1k8mcx/5UomIarog2QFCW6L0RrsNaxbCvkfqe9pDo3?=
 =?us-ascii?Q?cSwlYidzMrcOTiQHfo/AmswatOZ7/YvUMBxxLZ0DCscsWOQldQeHus/kwS1b?=
 =?us-ascii?Q?X/X3mPVP4N9A1Ti+Uwc0bQbh5fzjqwSk2cH534NQxRAvEXUPeOdPVDDzzH4J?=
 =?us-ascii?Q?hc6b3P9en/GDYmDEOqH+sZE2PHgqUwDjG+faQO8nb6L688M3ducS/ulOjkln?=
 =?us-ascii?Q?CkAMpIdvd+Dz0aF5gB1ICUY5n4M3zW41Uv/MboM2WiStzosanxCSaJj3cJGd?=
 =?us-ascii?Q?p/zV8seMmIbjRhTF7xx/aV5KoL/67wcFc1fk0WnyugA6psT2I69bMBU+USr1?=
 =?us-ascii?Q?cyHBcnnRDv8Qix0UQpfkT0kqfWlWoYBB4i83HnAt7DTZfhgXFPj8RqXl+7wc?=
 =?us-ascii?Q?tLIuIEqVeXhLFtcu5JwmEzeoB/Yqc3xEo/f2g6StuNyI1VGsCOg9hob8Ol6C?=
 =?us-ascii?Q?rwMDzLvPq4U/RxxqvxluUZ9/xNP7MZ3je6kLW61SrFTc9RnDxSmuFDI4Y78f?=
 =?us-ascii?Q?sQa34KJAGdHqLe9s3Og1GJ58YNg50pSFQYAOidMQAlDf4mjeZWNH5fuZ4cTz?=
 =?us-ascii?Q?boTaEhy1/eKC1h/hwodFIXo9fuZL/XD0Rf67dYZuu9aM0tTKlkjkdpjCsgJf?=
 =?us-ascii?Q?TTqvyEsyqVWEHO6GitOMB9UjcdL1l6BlsHVD2xQUWAno2NpfEYUgppND4VD1?=
 =?us-ascii?Q?bijNmVqS/pUrN4GQkssUZTgP0kJeN8qFY11+Htb9oLXhbjqRP4fJp7RNdEGz?=
 =?us-ascii?Q?Cej+wqPvBoCSXif1Y3RpSZQc6Do0rL2uIaN9HGu0YFKB0E2z1kHBAoWCzYiG?=
 =?us-ascii?Q?8it0uPaIUQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF6806D69E4.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d63638ad-a584-408c-69b5-08de6876ed21
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 07:35:12.6669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUCGSyY1p25bslxFv0dzeHNkbmxZyI6QwsfIQUtPCuSVjBBwcUgcgzhcth/P30SsVbPic6CVRuwWXhmwoK/caw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9487
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
> From: Yadav, Arvind <arvind.yadav@intel.com>
> Sent: Tuesday, February 10, 2026 11:20 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Gote, Nitin R
> <nitin.r.gote@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH v3] drm/xe/xe2: Apply Wa_14024997852
>=20
> Applied Wa_14024997852 to Graphics version 20.01 to 20.04 Whitelist regis=
ters
> needed for userspace to control autostrip on xe2.
>=20
> v2:
>    - set Bit 31 of FF_MODE, for TE autostrip disable (Nitin)
> v3:
>   - Need to whitelist these for Xe2 IPs (MATT R)
>=20
> Cc: Nitin Gote <nitin.r.gote@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 1d36c09681aa..9881a2d2f10c 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -75,7 +75,8 @@ static const struct xe_rtp_entry_sr register_whitelist[=
] =3D {
>=20
> XE_RTP_ACTIONS(WHITELIST(CSBE_DEBUG_STATUS(RENDER_RING_BASE), 0))
>  	},
>  	{ XE_RTP_NAME("14024997852"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005),
> ENGINE_CLASS(RENDER)),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> ENGINE_CLASS(RENDER), OR,
> +		       GRAPHICS_VERSION_RANGE(3000, 3005),

LGTM,
Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

> ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(WHITELIST(FF_MODE,
>  				   RING_FORCE_TO_NONPRIV_ACCESS_RW),
>  			 WHITELIST(VFLSKPD,
> --
> 2.43.0

