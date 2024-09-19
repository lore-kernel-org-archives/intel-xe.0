Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2894FCF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 16:32:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C749410E0A5;
	Thu, 19 Sep 2024 16:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gtnY++WZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F3510E0A5
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726763557; x=1758299557;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y+TRwXoZv6LlU91uFHtTWPMZjPbZp8x5KeTOH3Uk44k=;
 b=gtnY++WZ6GUT0EUjs/fUci9MMFMVHZS4YxkgP1b0EliS0y3AIm7LOG2A
 DRlDXZRG22NbhA24OfBS3JlpS9/AE7fKJhW4vwrsJ+mGxIRxBvnNjKQNo
 FOMD3zEI3ebtJfS5+2LS4Mq5KAKcoM/TMTUPWgO6S1oYC8nRQkUnrJwF4
 uR1FnWBMjKwYXAsqVI7KER+a1orKP9FvG0kB+A7C5YT2d554qi82DMJUC
 qyNi0jXblDDPQ9985l/Em0O5e6hDA0ecxsdeN5k+3FX/7OrpI3I884u5a
 40kCWJElRJu25aCGxEdoDeYuyXxBKGsfcc2puILyuBltKv6MhFFnZaIyf g==;
X-CSE-ConnectionGUID: 1m+k4O+KSQmpruY0s9Iffw==
X-CSE-MsgGUID: Fq5OfU7qQWae8O1ExKRo2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28645483"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="28645483"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 09:32:36 -0700
X-CSE-ConnectionGUID: 2vup4mF5SC28Pz9qqFlnrQ==
X-CSE-MsgGUID: fDKzwYnMRJeV8GYdB0Xfxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="107468365"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 09:32:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 09:32:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 09:32:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 09:32:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 09:32:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZUoEuvwkpofU8iu37EUxyF/7gXXP+16jCz5YJDS/jDsIV2C44aqFGOdY3fFoAzADnNIQADPvTNBkLn08CSTGyjw4+Z1xOar8bgdQL2YLelfLcMhtazpBHkc2eDAQasb0rRKFi1N3iHjIPGisf49++lsSJZEcYNxXcqDwfMWM2FS4ku49k3eUqo4W6O2DPIMlN9YRtLjJ+G6k+2l0JYadpjfPFZCS7DkXFAluLsDssodBT73WE0WqpH0KQVbHyhwNHD5/YTMpjVvyym9X9rce3ePGusUIEzdlnf9ZoO3b7jgZYNLDG8iuUpb7VkgX8CFJK67qUUAqWH3p0YuYP19/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVMsA783Co8SXm6PLph3QfB0mNXPTVqCa+tO3YfVjY4=;
 b=kPJNw5LeJ2lMME0ho4lhtBDGocCU+b7GLdmzXfjlBDQfyTUFreqPjzQDYbk8xWJi5OB/2+xuEiyMTjtOd4HzPUSj/vpiBO4iUbSmvYaguWuFC8iU9wv3hT49/7w2+CKfALuVjvDLK3TnoLuhhUPLPPi/rep6zsDUfotenIz3J5EBAIgv4/RA5xMKaf3FoEUu+6cWOzW2Mbfg5tjMQ1GI8qkpSbSERgOGOOp/NirH2dplBEzVUYvkZ84pFpHR+Ztbioxc7kCYamOe83CBfnieULzd9zI1LLqDAv0PMCLocFGAfmVJUkeRcTyPDYv7gTXWslJLXL5f5Aa/qbUMQlceNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by CH3PR11MB8659.namprd11.prod.outlook.com (2603:10b6:610:1cf::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.28; Thu, 19 Sep
 2024 16:32:32 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%4]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 16:32:32 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: RE: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Thread-Topic: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Thread-Index: AQHbCeiv/exosdoE+UiE7MOgODL4jrJd3+6AgAFQVKCAABKKAIAACexA
Date: Thu, 19 Sep 2024 16:32:31 +0000
Message-ID: <BYAPR11MB31598BEA9375C5162EDA9C4792632@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
 <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB315944FFB3DE254952FE298592632@BYAPR11MB3159.namprd11.prod.outlook.com>
 <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZuxHslDgHJem4LJT@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|CH3PR11MB8659:EE_
x-ms-office365-filtering-correlation-id: 9fb1ff97-a247-4098-d0d3-08dcd8c8a8ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gx+C2wF5kszM2Hv7nZdWBoobBl8DEbUO4iReLadZC58e7H9Nao0E55QitWHT?=
 =?us-ascii?Q?MvE60l9Co7L+efUXYiywRns+Ysq8W8rT9nzoE7SfEN8rus3CFX2fMiUCkb/T?=
 =?us-ascii?Q?/G++Zwp8vI4XSFmLZEt+A8UtIWJMVDo3Wa4mu4f3ivh8aP0uAr/ae92QnxHP?=
 =?us-ascii?Q?CP29qdElmqA33aYUO/YpWKnZnTPRZQqTdDmSTuLlUaiB1pZ6ksDKM9MzhL4G?=
 =?us-ascii?Q?/UTrX1x0OcynW+sbF94t/Gi9c68GCo5ZcWsqeaWvIf5IvqfpMWD0WBL3zfjq?=
 =?us-ascii?Q?n7Zh4qwzQ7V4nkQbGdFYoHo0thOH8NZoBwF956T7p1c1t/RhOqnjRqUK4U5r?=
 =?us-ascii?Q?bReCyp+yCW6nT567Gclj0FeXlmNogybJOiGk2o1Hyr8AMOQdYqw3MJWj+xWS?=
 =?us-ascii?Q?gY0RzYWEFCtbUO9WMLVMtkDS0ThsSID+DNHRTG5Ux+lXg+0baF28HGnkCO8L?=
 =?us-ascii?Q?gQK4Mvv2HH2GynG7NHSt4I8A3uHNw3HSdpQxvavooQbYEnf/Mhjgqu8rHIEm?=
 =?us-ascii?Q?waH3waNCR9LkGfVrqt9ponjtVARH2d6H0Ur0IWU4Jqo6tSUBL0PiLonLzuRO?=
 =?us-ascii?Q?G020XNRgMrWjIHAp0qCVlisiMycgN1Rar4wlbrGbp5uSYORV8cC4uRy8HswL?=
 =?us-ascii?Q?PbtzFWa4F28Hp4scB1vD5FZkTnlaVZ4iqqHgtcVFKvlLDwoBFTlGJNpBW7MB?=
 =?us-ascii?Q?fH9ui+8LwvuPiORpzD4Co1DsXgn01zSTDD3KLYuTxhUkPhQERzzY2TiqqEkh?=
 =?us-ascii?Q?iMgDv2OgfE5G8g8Zv3hciU9KiOO+hUPeJkMIKf/BxRnmPROCovOaXEgiKvtw?=
 =?us-ascii?Q?s28FgdQGwGd3TiGEI0UYrQFMECWEqSeTaLg3gMAdkxaTseYYe1BetZHhPguv?=
 =?us-ascii?Q?QeOjFCvjOn391DpFpDRZQniTutCvRxAZyg2geFpASWKHTboUwhLX92ME/K65?=
 =?us-ascii?Q?MsIvgs0Sg+pyCPhaOb2Tosum5NhPM7Diy3ESluAkUdbQY0zcT6hBVHvNyDjG?=
 =?us-ascii?Q?FqSr804fXgW3lCmZHIlfix1xxHeZejZfBs8S5IKJsMEVfJloziA0CQoBa5cl?=
 =?us-ascii?Q?YmfC/9nrY4rqGd8XEjYwbiDywB24rVqbaGxEkTR2CbO/iRht2PbhMao0ygBF?=
 =?us-ascii?Q?RimwW1hZe2rnPRxuIBWaqzlnp1Atho3l8Usem/sjz3j4UBUOhV8/BGmvLIbc?=
 =?us-ascii?Q?GdHUZB70WztWswWhWqJ7S/BBbfS5f///c4+aQuRlng9NFJI4rX/3YTq1c39G?=
 =?us-ascii?Q?tLo3sgk+OeXfAcbvFksnbpFoxWQacLY1x4UQzqo7/M2AZka4nH9l9XgC6vRn?=
 =?us-ascii?Q?sonaXsXdFa/RdykaoHk0kIyLwpz0yLyCuZ1iOQZH1CBd94sJ2EuqsTcBCYfl?=
 =?us-ascii?Q?RxnFiQyztBLdYBWh7imaZruz2ep+dq9IqE6121HTUaoCKpTxcA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AOmIG9gjwvYng3/c/zubjytW58Re1y82iZcFwcTUZ/7tG7NfDPPJf8vKZlbf?=
 =?us-ascii?Q?2iTjdjJSEz48qAm9fRwKjCx4L+YPkfwDZGeArH7LcB5UXVFjUk5+NgM5I91R?=
 =?us-ascii?Q?v+lUHS7aT138X/TSnIrxHpprXftD27nCtYKQ8viRmcYUzXoKhWo4dOotIMIv?=
 =?us-ascii?Q?qJ2N24L5MYgYOY8PCPmJA9lxjPNL1Wy5S1A56JbYaXDeCF+D6sjO9ZvsJqjg?=
 =?us-ascii?Q?bLUlOywNNa6ih9Jh+IhAS1yQslERZL+h8xFJPu82L0NASlpYJyikihw42fyH?=
 =?us-ascii?Q?26A1G2ePDVL30kiuxDzcpekGjfgMqdS3G+a0VI8d2/DVhluvVFOjekfhohmw?=
 =?us-ascii?Q?foR4uQtaUcPZUPtwL6740vJvj80/fWEvl/6z8H9kY8UZYAF3VG1akVB22gnM?=
 =?us-ascii?Q?UnP7yYN/yB54hqCxm4e/If0V3vujoIIhcVusa4yL6zqZne0JfoGJz5jP5IR3?=
 =?us-ascii?Q?vZPMHskS4ehtnv/eSLogZR2pS3fHIZSu8azxcx2HZMWHazgVrOKRIFNklebj?=
 =?us-ascii?Q?SqvTqi7h7oNulvyLOlK/ebVquLJVx4RB6e3U8RD1UsNdfC5TD/A33IwMdzD+?=
 =?us-ascii?Q?9GBmZgZZ64QpfFwMe6kzCE37ADl2X9CvNpFYE9oA9490MWxdyYAJhFWQNVZ4?=
 =?us-ascii?Q?pj0Zd88E0nUM0FxcxO7Lm7VeA1qi5WWGCLwXa0Qrp1lPJtaKfxpTflaxH+5w?=
 =?us-ascii?Q?BzthUO0o2h9Gtpg31idDUEvBF9qbSWj1cUZStYGco7/PpESFV9q9y+GuBkAv?=
 =?us-ascii?Q?AoZog9fnyQ1rVR+3JGqAE/grLkw8Xi/raCLj6Cy5LyMGRz/LFqRnhOfkoFkK?=
 =?us-ascii?Q?CoVrD1vhrG5Z4s+oeeH26+nbNt9vSHFiNOU/B2p/3xZL6z/GD5QpHSjDoN8e?=
 =?us-ascii?Q?ZIfr3BpczGN3gARsG2lBSMTkp7glf1dTZ8ZY0UsmhrgVPnLvxG/1/HaUJ7cc?=
 =?us-ascii?Q?EmlnkQZmiZYl7EoPxqGv7GE3w85UK79D11z1p05f8dDM74gSnGM8+sa+O1YW?=
 =?us-ascii?Q?AtFustVCe68LoXSrfbkFl7XcRhJ24fDxdlMK+Hj1l3ZTecneGEadABwC6fs2?=
 =?us-ascii?Q?J+QD93jtkrlMQPTjH4vGn8SZqTAATWVlcKl5lWbUBtq+elJTwd3OgeVW0Uzz?=
 =?us-ascii?Q?MtK1V8k2QmOo0rwV/JIeGyOU2fXAXZSaczVyPidBHz4mIEGV295jGAa/OFQF?=
 =?us-ascii?Q?ga5tJx2HBqtjNb83mD0tOetAZeszjwhGDC/IKCgiukQFEu2LZLkSghE1m3Dt?=
 =?us-ascii?Q?ZFIf1xEHDuhiCMqIoWoRpI1PYu4wEbuuNkdYxyDcwUXZLqBbSUV6hlUaAVW/?=
 =?us-ascii?Q?ljNMxSbQGQ2OFCMJxFToFSVTWkzKSXVPc+rPm3x3UaNmt3O4ZDwQXNvekGiV?=
 =?us-ascii?Q?2tlyh1U6Nxc29wOQFAtN6IC4LXqxMAy+EsKqe5E++wi6qerPLNSINfNpCfF5?=
 =?us-ascii?Q?EHuZHF3kPBa46Kzvr5zqzVx2/FaHfPg42sETJO4KZFD5BFxT9QXQSWJQMB/H?=
 =?us-ascii?Q?Dwz5xZ9rs8ARRRvd4nIcljtqLSye8uVZR1h2vTcVSnWb8h0Heki0WBYfr0NM?=
 =?us-ascii?Q?drdKpgF4H9ciHflBuqI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb1ff97-a247-4098-d0d3-08dcd8c8a8ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2024 16:32:31.9555 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BqIlHndF+f/nhQYKVmXzXlwiVk8IXhe97adz5YZNNOEcZGB4sVuBqWn/lsyMeYD7H5M66la97TIg9YJx3io5ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8659
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
> Sent: Thursday, September 19, 2024 11:48 AM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during
> a map operation
>=20
> On Thu, Sep 19, 2024 at 09:09:57AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, September 18, 2024 2:38 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; dakr@redhat.com
> > > Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range
> during
> > > a map operation
> > >
> > > On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:
> > >
> > > Please sent patches which touch common code to dri-devel.
> > >
> > > > Considder this example. Before a map operation, the gpuva
> ranges
> > > > in a vm looks like below:
> > > >
> > > >  VAs | start              | range              | end               =
 | object             |
> > > object offset
> > > > -------------------------------------------------------------------=
-----------
> -----
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 |
> 0x00007ffff5cd0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 |
> 0x00007ffff5db7000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > Now user want to map range [0x00007ffff5cd0000 -
> > > 0x00007ffff5cf0000).
> > > > With existing codes, the range walking in
> __drm_gpuvm_sm_map
> > > won't
> > > > find any range, so we end up a single map operation for range
> > > > [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> > > >
> > > >  VAs | start              | range              | end               =
 | object             |
> > > object offset
> > > > -------------------------------------------------------------------=
-----------
> -----
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5cd0000 |
> 0x00007ffff5cd0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cd0000 | 0x0000000000020000 |
> 0x00007ffff5cf0000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5cf0000 | 0x00000000000c7000 |
> 0x00007ffff5db7000
> > > | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > The correct behavior is to merge those 3 ranges. So
> > > __drm_gpuvm_sm_map
> > >
> > > Danilo - correct me if I'm wrong, but I believe early in gpuvm you
> had
> > > similar code to this which could optionally be used. I was of the
> > > thinking Xe didn't want this behavior and eventually this behavior
> was
> > > ripped out prior to merging.
> > >
> > > > is slightly modified to handle this corner case. The walker is
> changed
> > > > to find the range just before or after the mapping request, and
> > > merge
> > > > adjacent ranges using unmap and map operations. with this
> change,
> > > the
> > >
> > > This would problematic in Xe for several reasons.
> > >
> > > 1. This would create a window in which previously valid mappings
> are
> > > unmapped by our bind code implementation which could result in
> a
> > > fault.
> > > Remap operations can create a similar window but it is handled by
> > > either
> > > only unmapping the required range or using dma-resv slots to
> close
> > > this
> > > window ensuring nothing is running on the GPU while valid
> mappings
> > > are
> > > unmapped. A series of UNMAP, UNMAP, and MAP ops currently
> > > doesn't detect
> > > the problematic window. If we wanted to do something like this,
> we'd
> > > probably need to a new op like MERGE or something to help
> detect
> > > this
> > > window.
> > >
> > > 2. Consider this case.
> > >
> > > 0x0000000000000000-0x00007ffff5cd0000 VMA[A]
> > > 0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
> > > 0x00007ffff5cd0000-0x0000000000020000 VMA[C]
> > >
> > > What is VMA[A], VMA[B], and VMA[C] are all setup with different
> > > driver
> > > specific implmentation properties (e.g. pat_index). These VMAs
> > > cannot be
> > > merged. GPUVM has no visablity to this. If we wanted to do this I
> > > think
> > > we'd need a gpuvm vfunc that calls into the driver to determine if
> we
> > > can merge VMAs.
> >
> > #1, #2 are all reasonable to me. Agree if we want this merge
> behavior, more work is needed.
> >
> > >
> > > 3. What is the ROI of this? Slightly reducing the VMA count?
> Perhaps
> > > allowing larger GPU is very specific corner cases? Give 1), 2) I'd sa=
y
> > > just leave GPUVM as is rather than add this complexity and then
> > > make all
> > > driver use GPUVM absorb this behavior change.
> >
> > This patch is an old one in my back log. I roughly remember I ran into
> a situation where there were two duplicated VMAs covering
> > Same virtual address range are kept in gpuvm's RB-tree. One VMA
> was actually already destroyed. This further caused issues as
> > The destroyed VMA was found during a GPUVM RB-tree walk. This
> triggered me to look into the gpuvm merge split logic and end
> > Up with this patch. This patch did fix that issue.
> >
>=20
> If a destroyed VMA is in the RB tree that would be a big issue and
> definitely would need to be fixed.
>=20
> Adding a test case to show the issue you describe would be good.
> Also if
> we end doing something with merging adding a test case for the
> description in the commit message would also be good.
>=20
> > But I don't remember the details now. I need to go back to it to find
> more details.
> >
>=20
> That would be good.
>=20
> > From design perspective, I think merging adjacent contiguous
> ranges is a cleaner design. Merging for some use cases (I am not sure
> > We do merge for some cases, just guess from the function name
> _sm_) but not merging for other use cases creates a design hole and
> > Eventually such behavior can potentially mess things up. Maybe
> xekmd today doesn't have such use cases, but people may run into
> > Situation where they want a merge behavior.
> >
>=20
> I don't think Xe has a current use case, but the situation you describe
> is very similar to a system allocator case where we would want
> merging.
>=20
> Simple example below.
>=20
> Initital State:
> VMA[A] 0x0000-0x0fff - System allocator VMA
> VMA[B] 0x1000-0x1fff - BO binding VMA
> VMA[C] 0x2000-0x2fff - System allocator VMA
>=20
> User op:
> Bind 0x1000-0x1fff to sytem allocator
>=20
> Ideally we really want this final state:
> VMA[D] 0x0000-0x2fff - System allocator VMA
>=20
> The without merging like above as BO bindings are bound / unbound
> the
> system allocator space will get fragmented into lots of VMA which is
> not
> ideal.

Yes I observed the same when I ran system allocator. From one log I capture=
d, I end up with below fragmented address space:

VAs | start              | range              | end                | object=
             | object offset
---------------------------------------------------------------------------=
----------------------------------
     | 0x0000000000000000 | 0x000000000044c000 | 0x000000000044c000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x000000000044c000 | 0x0000000000001000 | 0x000000000044d000 | 0x000=
0000000000000 | 0x000000000044c000
     | 0x000000000044d000 | 0x0000000000002000 | 0x000000000044f000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x000000000044f000 | 0x0000000000001000 | 0x0000000000450000 | 0x000=
0000000000000 | 0x000000000044f000
     | 0x0000000000450000 | 0x0000000000019000 | 0x0000000000469000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000469000 | 0x0000000000001000 | 0x000000000046a000 | 0x000=
0000000000000 | 0x0000000000469000
     | 0x000000000046a000 | 0x000000000000f000 | 0x0000000000479000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000479000 | 0x0000000000001000 | 0x000000000047a000 | 0x000=
0000000000000 | 0x0000000000479000
     | 0x000000000047a000 | 0x0000000000006000 | 0x0000000000480000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000480000 | 0x0000000000001000 | 0x0000000000481000 | 0x000=
0000000000000 | 0x0000000000480000
     | 0x0000000000481000 | 0x0000000000011000 | 0x0000000000492000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000492000 | 0x0000000000001000 | 0x0000000000493000 | 0x000=
0000000000000 | 0x0000000000492000
     | 0x0000000000493000 | 0x0000000000005000 | 0x0000000000498000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000498000 | 0x0000000000001000 | 0x0000000000499000 | 0x000=
0000000000000 | 0x0000000000498000
     | 0x0000000000499000 | 0x0000000000001000 | 0x000000000049a000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x000000000049a000 | 0x0000000000001000 | 0x000000000049b000 | 0x000=
0000000000000 | 0x000000000049a000
     | 0x000000000049b000 | 0x0000000000002000 | 0x000000000049d000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x000000000049d000 | 0x0000000000001000 | 0x000000000049e000 | 0x000=
0000000000000 | 0x000000000049d000
     | 0x000000000049e000 | 0x0000000000010000 | 0x00000000004ae000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x00000000004ae000 | 0x0000000000001000 | 0x00000000004af000 | 0x000=
0000000000000 | 0x00000000004ae000
     | 0x00000000004af000 | 0x0000000000019000 | 0x00000000004c8000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x00000000004c8000 | 0x0000000000001000 | 0x00000000004c9000 | 0x000=
0000000000000 | 0x00000000004c8000
     | 0x00000000004c9000 | 0x0000000000036000 | 0x00000000004ff000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x00000000004ff000 | 0x0000000000001000 | 0x0000000000500000 | 0x000=
0000000000000 | 0x00000000004ff000
     | 0x0000000000500000 | 0x0000000000008000 | 0x0000000000508000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x0000000000508000 | 0x0000000000001000 | 0x0000000000509000 | 0x000=
0000000000000 | 0x0000000000508000
     | 0x0000000000509000 | 0x0000000000015000 | 0x000000000051e000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x000000000051e000 | 0x0000000000001000 | 0x000000000051f000 | 0x000=
0000000000000 | 0x000000000051e000
     | 0x000000000051f000 | 0x00007ffff58b1000 | 0x00007ffff5dd0000 | 0x000=
0000000000000 | 0x0000000000000000
     | 0x00007ffff5dd0000 | 0x0000000000020000 | 0x00007ffff5df0000 | 0xff1=
100013e668400 | 0x0000000000000000
     | 0x00007ffff5df0000 | 0x00ff80000a210000 | 0x0100000000000000 | 0x000=
0000000000000 | 0x0000000000000000

This list can go on if you run more test with single gpuvm. In a real world=
 use case, this could be pretty bad.


>=20
> So here 1) from my list is a non-issue as UNMAP system allocator
> VMAs
> don't interact with the hardware. 2) could still be an issue as VMA[A],
> VMA[C] could have different caching or migration policies.
>=20
> > If we decide only merge for some case but not for other cases, we
> need a clear documentation of the behavior.
> >
>=20
> If this was added merging it likely would a be optional user controled
> thing. I suggested a vfunc or something to test for merge condition,
> we
> could just use a user defined cookie attached to VMA that GPUVM
> could
> match on for merging (also could be used as enable merging if cookie
> is
> non-zero). That actually seems pretty clean.

This approach sounds good to me.=20

This is a low priority thing to me. I have to deal with some higher priorit=
y thing now.
I am open if other people want to continue this work, in which case I can h=
elp review
And test it a bit.=20

Oak


>=20
> Matt
>=20
> > Oak
> >
> > >
> > > Matt
> > >
> > > > end result of above example is as below:
> > > >
> > > >  VAs | start              | range              | end               =
 | object             |
> > > object offset
> > > > -------------------------------------------------------------------=
-----------
> -----
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > > >
> > > > Even though this fixes a real problem, the codes looks a little
> ugly.
> > > > So I welcome any better fix or suggestion.
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_gpuvm.c | 62
> > > +++++++++++++++++++++++++------------
> > > >  1 file changed, 43 insertions(+), 19 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> > > b/drivers/gpu/drm/drm_gpuvm.c
> > > > index 4b6fcaea635e..51825c794bdc 100644
> > > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > > @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  {
> > > >  	struct drm_gpuva *va, *next;
> > > >  	u64 req_end =3D req_addr + req_range;
> > > > +	u64 merged_req_addr =3D req_addr;
> > > > +	u64 merged_req_end =3D req_end;
> > > >  	int ret;
> > > >
> > > >  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr,
> > > req_range)))
> > > >  		return -EINVAL;
> > > >
> > > > -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > req_addr, req_end) {
> > > > +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm,
> > > req_addr - 1, req_end + 1) {
> > > >  		struct drm_gem_object *obj =3D va->gem.obj;
> > > >  		u64 offset =3D va->gem.offset;
> > > >  		u64 addr =3D va->va.addr;
> > > >  		u64 range =3D va->va.range;
> > > >  		u64 end =3D addr + range;
> > > > -		bool merge =3D !!va->gem.obj;
> > > > +		bool merge;
> > > >
> > > >  		if (addr =3D=3D req_addr) {
> > > > -			merge &=3D obj =3D=3D req_obj &&
> > > > +			merge =3D obj =3D=3D req_obj &&
> > > >  				 offset =3D=3D req_offset;
> > > >
> > > >  			if (end =3D=3D req_end) {
> > > >  				ret =3D op_unmap_cb(ops, priv, va,
> > > merge);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  			};
> > > >  			struct drm_gpuva_op_unmap u =3D { .va =3D va };
> > > >
> > > > -			merge &=3D obj =3D=3D req_obj &&
> > > > -				 offset + ls_range =3D=3D req_offset;
> > > > +			merge =3D (obj && obj =3D=3D req_obj &&
> > > > +				 offset + ls_range =3D=3D req_offset) ||
> > > > +				 (!obj && !req_obj);
> > > >  			u.keep =3D merge;
> > > >
> > > >  			if (end =3D=3D req_end) {
> > > >  				ret =3D op_remap_cb(ops, priv, &p,
> > > NULL, &u);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > -				ret =3D op_remap_cb(ops, priv, &p,
> > > NULL, &u);
> > > > -				if (ret)
> > > > -					return ret;
> > > > -				continue;
> > > > +				if (end =3D=3D req_addr) {
> > > > +					if (merge) {
> > > > +						ret =3D
> > > op_unmap_cb(ops, priv, va, merge);
> > > > +						if (ret)
> > > > +							return ret;
> > > > +						merged_req_addr =3D
> > > addr;
> > > > +						continue;
> > > > +					}
> > > > +				} else {
> > > > +					ret =3D op_remap_cb(ops, priv,
> > > &p, NULL, &u);
> > > > +					if (ret)
> > > > +						return ret;
> > > > +					continue;
> > > > +				}
> > > >  			}
> > > >
> > > >  			if (end > req_end) {
> > > > @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  				break;
> > > >  			}
> > > >  		} else if (addr > req_addr) {
> > > > -			merge &=3D obj =3D=3D req_obj &&
> > > > +			merge =3D (obj && obj =3D=3D req_obj &&
> > > >  				 offset =3D=3D req_offset +
> > > > -					   (addr - req_addr);
> > > > +					   (addr - req_addr)) ||
> > > > +				 (!obj && !req_obj);
> > > >
> > > >  			if (end =3D=3D req_end) {
> > > >  				ret =3D op_unmap_cb(ops, priv, va,
> > > merge);
> > > >  				if (ret)
> > > >  					return ret;
> > > > -				break;
> > > > +				continue;
> > > >  			}
> > > >
> > > >  			if (end < req_end) {
> > > > @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct
> > > drm_gpuvm *gpuvm,
> > > >  					.keep =3D merge,
> > > >  				};
> > > >
> > > > -				ret =3D op_remap_cb(ops, priv, NULL,
> > > &n, &u);
> > > > -				if (ret)
> > > > -					return ret;
> > > > -				break;
> > > > +				if (addr =3D=3D req_end) {
> > > > +					if (merge) {
> > > > +						ret =3D
> > > op_unmap_cb(ops, priv, va, merge);
> > > > +						if (ret)
> > > > +							return ret;
> > > > +						merged_req_end =3D
> > > end;
> > > > +						break;
> > > > +					}
> > > > +				} else {
> > > > +					ret =3D op_remap_cb(ops, priv,
> > > NULL, &n, &u);
> > > > +					if (ret)
> > > > +						return ret;
> > > > +					break;
> > > > +				}
> > > >  			}
> > > >  		}
> > > >  	}
> > > >
> > > >  	return op_map_cb(ops, priv,
> > > > -			 req_addr, req_range,
> > > > +			 merged_req_addr, merged_req_end -
> > > merged_req_addr,
> > > >  			 req_obj, req_offset);
> > > >  }
> > > >
> > > > --
> > > > 2.26.3
> > > >
