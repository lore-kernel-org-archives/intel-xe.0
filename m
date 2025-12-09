Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CBED3B7EA
	for <intel-xe@archiver.kernel.org>; Tue,  9 Dec 2025 06:15:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3010E169;
	Tue,  9 Dec 2025 06:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mt/I9u1N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2734F10E169
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Dec 2025 06:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765260901; x=1796796901;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWamJb4kuJunq6XVPjjZv0Nzydy9Imk5CZ7VVKR4x7M=;
 b=mt/I9u1NN/1ur1Zlexvxsj/QfkpCtDBtrQpvRMhbM6i9D2v42zXlfD2S
 O+azsaeprHWL4SZ0cgOrb6viLviueEoj5b1udLB3JP8LWR0dlz+lh9Zk9
 3M8DHI/xum8pLVZlSHkLPnjxkyYSXAd6sOoHJPkskFPqJQGtfRHtU+dbc
 LixX8CnALGHkdmuxBxOR97F19k+/B/e1I/H/bV+mQ0B+PzMUuAhYkCC03
 3e7tjfTR5pnp5C1vVgJ2YOJY25TfFTLmZ17K0C58KQ6UpuoIE0KKUZfV7
 c9PN3l7t0Dszw06Dds3JYP29NUbgvCtOofhVlUaAp1xDC1muuUUw58ufz g==;
X-CSE-ConnectionGUID: /cvXbaJLQ1+SBdhVgm9Fjw==
X-CSE-MsgGUID: JnCuW/hAR/qXRv+JXE1vKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67174684"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="67174684"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 22:15:01 -0800
X-CSE-ConnectionGUID: FdMqpMKIS2maoEmvTeDJ8w==
X-CSE-MsgGUID: zWKZRHVzTbmXhSCGm/B5BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="200583055"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 22:15:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 22:15:00 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 22:15:00 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 22:14:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8CqR0S4+ECQ8NrNvXykKddEaG5uasnSluiCdlPzthE/34ITICLHUydrjutEOu9GOmlXYFFhv+z84CGtGuKKfLUiSRtgqIoa1OUobNri1IPFqgeTCm4/A4VHLPxCqypnugebAIzjlGRGaPMLR+nhlD1RJ80DH010EsW4Xi4EVOOossILRydTqin0DD2YWS7+FCkjieEGwVJrC8ruybrPMPgHJmT7BABfEt+lnYUTCbAbJATfEndyp6UrZq6OJLnM4Ecd1OgGlBaPYgoAVurmKV63RbFHQXlFbi8owMB8+N/fhKVl/LOWBuH3uSl9+C2VRDZksA5SDWnJRoiJFet6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EA4WxfDo13dKeCTGJ9yAvDBn2Aw5yTYMPgCZaY4+voM=;
 b=G7HZfBkkwjPxgv5RZf7VyvZVn0cWC/d7mkMmOgCTv5DZROMSNJAe01625LvlHPY1TOloDK3RG083S0ldpcItgbera+57V56YOg6vQiDbyxzjmG+i6vBWZ7kifO7YOI9CU2hZpqLgnb8GcaDmSScoqPG86Kg3Sz/rVdHEpnvcpOCvuscmeB9Qm9j8lgfcgDWqmUryUm3T12FnUtL5LXzGqxJ+Txmu46YI3SRASGRbyvj2i6JIpACvpwPwqC+BjYH4wnNVA1p3dAMdsSRiOfe0RAEcuj+HJQJPWtgYlOLj+gd3vbezjopvDdoOIKLW4qIxju+DKSwZfufbWmEK+Q/ulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA3PR11MB7655.namprd11.prod.outlook.com (2603:10b6:806:307::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 06:14:53 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 06:14:53 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcXyjJG7EwvMuSJ062FpUI1FjWxLUQlpUAgAACXKCACEoPgIAAA04g
Date: Tue, 9 Dec 2025 06:14:52 +0000
Message-ID: <SA1PR11MB883967D9B2745094C3136B27AAA3A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <SJ1PR11MB62042AFB9ED9CE6A6CC0EDA681A3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62042AFB9ED9CE6A6CC0EDA681A3A@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA3PR11MB7655:EE_
x-ms-office365-filtering-correlation-id: c36cc36d-8b2d-421e-5518-08de36ea4459
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7vQ1d9Z+2qIEhVaPMHOt6lJX3unas9cDSEP9x56TMQqJUlPnJ1T9kD2YrixS?=
 =?us-ascii?Q?2nTDUL+DQ4W4nkJVu4mFSeWQCnNjhOyU2OZyN83P+/xt6VFGE3K5dJ1NwRcl?=
 =?us-ascii?Q?FaraIFmVK0UhnZB2c3ujtxu2fG65ge40wsaPgqBtDw1ussypr0Ga/0gZsdzz?=
 =?us-ascii?Q?68efZQmZvUbV8ZmCgdEVYcdBaGcAbVlEOB8leL1au6eGuQDy0niutpQyALH8?=
 =?us-ascii?Q?8X4twKz3A5jErPcOdH6aWzAoZV6UFr1QhGidln38HknUC1cCZnbKbtk+TxIb?=
 =?us-ascii?Q?l0cz6helfx5N6aTt6BlOQuecJ9Hgro9WQ+dkBbOIllrX3jZXWU0NXb3w2Fv7?=
 =?us-ascii?Q?aDof79POHhgJwYTemZnVFCbpMMDT3v1tXo9wWNFH7bkXAnZTGYeOqGYLNOQA?=
 =?us-ascii?Q?LpH05eg6UmcH1AuVhOW/66kzgbm85vyCRf8I3PoQaYVyRjGcQdBzeY2B9EK9?=
 =?us-ascii?Q?N7hREEzwkprQKCy9INWR6dhKes1+2RTsDuCVuhqMpLpeAIgRACP4eJ28E3mn?=
 =?us-ascii?Q?8RP6qtXDHuDWF4wJsNjpUQ632LnQL5MNjVWOBQaS9Jdp36CGFSZXfM8BAVx7?=
 =?us-ascii?Q?z/1p4PPKVAexfEq9ub5ybQ7qfmh+Re2/oU17oMYvHMBPiIKqyuvpDiKwS8Gz?=
 =?us-ascii?Q?uAjrIF/EQcyzXFVOQClDzfNSb348s4xlkEwBrXe+LASHzrlO+bmrrb6OQDt2?=
 =?us-ascii?Q?oCo1enb6ZMax338EGNIVRj+G9xTdHkPkZc7QdqV/GSjDHxIjBZ5UL8cqbhYX?=
 =?us-ascii?Q?GvRtGFhez2oxbRC3gg3VTvW9w+meTwItttenAKMmO4e1XSziByn+NBGqS1ML?=
 =?us-ascii?Q?8JBGWwPmVOHqPsRkKVFAYee2MO08A/Aii9KqHYGusONaDl36aoLYkI93yBFk?=
 =?us-ascii?Q?XQn9Y44EBmZmSNbx7zMFNGiMc8IUt1Zu+40Ctdyha1CIVkuVkolhWoE/IQJI?=
 =?us-ascii?Q?ZAeqgvX3Tts0XB75EcDYZCNe/EztKKiHt17unD5M6Kk7NUMb1P5pooRxaPMa?=
 =?us-ascii?Q?3kugqSPVJigAYm+YX51hZsxXOP/e14gxh4nsLvGGHzJkpu+1xk+jKNizKvag?=
 =?us-ascii?Q?5/PqvfR5s9BatenBtS2CRI6fGvKlUO/sINoK/eOW+2C7QlbB9uhjbFVulR7d?=
 =?us-ascii?Q?pNgSbAodw4LdZDv6q1GNWdisgE1Tz8aXq7tTPGqI7xTCCkF/m12inrIhxYGZ?=
 =?us-ascii?Q?hMse3fzk/C6Yk3eUWtDe+GFNR6h/mz2cJ+0MqFWXjg48Uli2djzdIYLdsmqH?=
 =?us-ascii?Q?A/L6eDdsXbaPO5Cfi4+XuPG0bxm3EFbbWNWjs2uvkqWewtMX9yan4KD5oHRk?=
 =?us-ascii?Q?lQ9vKEHpcPd86DgcIY+zN5HeUyvjwvqLyJvPzayeeVgaxVLVEOUTDPNs0ekN?=
 =?us-ascii?Q?X9be5AfuiSlW9fxPu6EOzyqVHAA65oAuegCq79V6Et59w0VW9HZGPqoj6SR9?=
 =?us-ascii?Q?iLMeSTnuq5ISuCW0Y6OaX6NMr27pZ3atbsvVeQcvP3HffWNjUVE85YTEBNcu?=
 =?us-ascii?Q?L59Uuw83A4qs+DBZv2ITdWvMAt4bzdQ8E/z6?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mjY6yWnfAu/cLuGr86QDIcOdnana0BGkiufl49+EA7bsTOCjaiUg39eaL2TS?=
 =?us-ascii?Q?fDWgRJw9g107S7zKD7yhGHczLVfuw9ALtO1pgbxbhbNCgOZ/qM7ZWlwYzABC?=
 =?us-ascii?Q?SgLLjObtDgACZNqy5XlWKwWADlI57P8fUUAe3XQKFw7v078/0CJwBYXIFzwS?=
 =?us-ascii?Q?WMGOdbMlF6+a4pxQB4X+k3IPIX0/MrSNE8ujW36swJkwyeHpSZLDjMzGbQxi?=
 =?us-ascii?Q?oDPOP4WnynPr4QQDOOVmH1fF5VKj/q94mIGSRwl6ImMv3bPGzHFDXDPTt2oJ?=
 =?us-ascii?Q?l62/KK/G0IWbLfJV3uSuaC0+NmDU+RsDh1MhpPwUgSYZZCW9AK8Eeyl55m1v?=
 =?us-ascii?Q?QywI9YfbHBhs/kvtqj49LwFseksyVwePHlcYzLlWr65zdJZ49b6gpvQC/whO?=
 =?us-ascii?Q?IVIJMHtdDLtz5O1r927I2Rvdb4tAxwLJkc4kFNRq6V/uP0Le0Vo2Mt79wCa4?=
 =?us-ascii?Q?P8cqWnWATYDKoOYCppz/Z8W4D+oV3hafpv3rjbD2vmVWrlH0L7dyUbE9JQE7?=
 =?us-ascii?Q?VkcIAPoS0//qp6kMtellTxSw4LdIgnkh4vBXbQueGakJomZ4paE5cN2qV9Cw?=
 =?us-ascii?Q?iGsgiDx23eNLGcsJ7oYfOacqRrgAQ4sU49iaO1Z/vCy3tX3HBlnh5173HXcc?=
 =?us-ascii?Q?pwA1CoGYNGz0J2V4bBZDOEsr0JeRnr7Xj+43KC44giScROLuGW1Yfv8+nX3J?=
 =?us-ascii?Q?36gTGtgE14EunvHewj90LyjcgWC9briFNRhM315dANxtirIRvgGXpO4Ld9d+?=
 =?us-ascii?Q?QHIhPvPnq+bdmbmJJfAGKjRJjVfOad8o3GQRnoo1LqqaCUALF0c2XbCXhVTI?=
 =?us-ascii?Q?/qsRJGqseaod7e6dzavS7+CvJ7xONimbCWBS2JHxZux+RJm/ROTIQxncGqQe?=
 =?us-ascii?Q?ZXSNuxcFfnn+TGqdyul5mOWycbElWUrUcCDbVLa9KLDSm5b7jf6bvbHe1mxm?=
 =?us-ascii?Q?7xlqFWvGikDoUB/138/IksixjaAWbUCeHjIwdqOee8ybNg/v/Ve+SWIl5XDa?=
 =?us-ascii?Q?bBEeh1KDOZiasy7E5EwFfkeSMUtlCIfujFtnd6Cz8S5gNuIQ68htEnpsWfrR?=
 =?us-ascii?Q?tTgyFUdXJeT4JbUpx7UQ4VTQD+2tpluO8GIgNHIYti9xn9FdihF8rUy1/Wfa?=
 =?us-ascii?Q?sZPNeVbQ9sypAo7jDiKEm3B/YcNSi9oSpkM4K+q1oPOxJU3MilRLA1+UqgCh?=
 =?us-ascii?Q?LVrhCXl1WemS9Lq6dIr+3r/todYgsRKALVQhrXoBkvOF1l2XqlWpmWlgo24j?=
 =?us-ascii?Q?MHT6WpD7h8XS+UEo8Ng4JbctExC9/6/o49LyTu0FfhNJzGD7fOPfsAhWD6/B?=
 =?us-ascii?Q?bHetCft6kpYpbjEkZ4hMOoD+CvDcW0OyDdDTkslB3eUwhSvq+8EgKtnyIzv9?=
 =?us-ascii?Q?36D6WhYDAIWwwFtLF62fnmVNAp0yr0v6p0eVHGhXCOV7sDTk2KPN/EEpVSvS?=
 =?us-ascii?Q?v3VKh6udJsLszBdmMVjSbVha50JIdTxfN44zGvXHfBaj3NKw4qwjeyE5sJhH?=
 =?us-ascii?Q?JcUw8BBxQUYv+tyhJgoQ3p5n4VviutRp0SHHTkNxoUJ6HtUrDR0qRV7pmFmJ?=
 =?us-ascii?Q?4P8+Su7hhAkcmDp2foLk+dB69L2XBAnKU61b058U?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36cc36d-8b2d-421e-5518-08de36ea4459
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 06:14:52.9974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDrFwLUxqf1mzPQQmvGLMtAmDeqN1jsmhnN5oGKFX1NCL1EXY07wRhIVN3eP/Z2MNk7y5Z4sRpY/jdopB/Faxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7655
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

On Monday, December 8, 2025 9:57 PM, Tejas Upadhyay wrote:
> > -----Original Message-----
> > From: Nguyen, Brian3 <brian3.nguyen@intel.com>
> > Sent: 04 December 2025 05:52
> > To: Brost, Matthew <matthew.brost@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Upadhyay, Tejas
> > <tejas.upadhyay@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.com>;
> > Summers, Stuart <stuart.summers@intel.com>; Wajdeczko, Michal
> > <Michal.Wajdeczko@intel.com>
> > Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval
> > job
> >
> > On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > > Use page reclaim list as indicator if page reclaim action is
> > > > desired and pass it to tlb inval fence to handle.
> > > >
> > > > Job will need to maintain its own embedded copy to ensure lifetime
> > > > of PRL exist until job has run.
> > > >
> > > > v2:
> > > >  - Use xe variant of WARN_ON (Michal)
> > > >
> > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26
> > > > ++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > |
> > > > 4 ++++
> > > >  3 files changed, 36 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c index 347b111dc097..833d6762dd8d
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile,
> > struct xe_vma_ops *vops)
> > > >  			goto kill_vm_tile1;
> > > >  		}
> > > >  		update.ijob =3D ijob;
> > > > +		if (pt_update_ops->prl.num_entries !=3D
> > XE_PAGE_RECLAIM_INVALID_LIST) {
> > > > +			xe_tlb_inval_job_add_page_reclaim(ijob,
> > &pt_update_ops->prl);
> > > > +			/* Release ref from alloc, job will now handle it */
> > > > +			xe_page_reclaim_entries_put(pt_update_ops-
> > >prl.entries);
> > > > +			pt_update_ops->prl.entries =3D NULL;
> > > > +		}
> > >
> > > Do we not need to do this on the media-GT? Or is issuing PRL a
> > > single GuC
> > sufficient?
> > >
> > > Everything else looks good.
> > >
> >
> > It should be sufficient per tile. KMD will request GuC FW per tile and
> > afterwards GuC FW will issue Page Reclamation to all the primary
> > XeTLBs, for GT and media within the tile.
> >
> > However, I realize that this means we should be disabling PPC flush
> > for media TLB invalidation otherwise, it will conflict and do a PPC
> > flush anyway. Will have to rework some of the logic to handle this if s=
o... Taking another look at this.
>=20
> PPC is physically private cache for render only, isn't it? Or we have PPC=
 for media as well!
>=20

Yes, it is render only. In later replies, we confirmed that a PPC flush on =
media won't affect the
page reclamation or render PPC so we can leave the media TLB invalidation w=
ith the PPC flush
as it translates to NOP.

Brian

> Tejas
> >
> > Brian
> >
> > > Matt
> > >
> > > >
> > > >  		if (tile->media_gt) {
> > > >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt);
> > diff --git
> > > > a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > index dbd3171fff12..2185f42b9644 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > @@ -7,7 +7,9 @@
> > > >  #include "xe_dep_job_types.h"
> > > >  #include "xe_dep_scheduler.h"
> > > >  #include "xe_exec_queue.h"
> > > > +#include "xe_gt_printk.h"
> > > >  #include "xe_gt_types.h"
> > > > +#include "xe_page_reclaim.h"
> > > >  #include "xe_tlb_inval.h"
> > > >  #include "xe_tlb_inval_job.h"
> > > >  #include "xe_migrate.h"
> > > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue
> > > > *q,
> > struct xe_tlb_inval *tlb_inval,
> > > >  	job->start =3D start;
> > > >  	job->end =3D end;
> > > >  	job->fence_armed =3D false;
> > > > +	xe_page_reclaim_list_init(&job->prl);
> > > >  	job->dep.ops =3D &dep_job_ops;
> > > >  	job->type =3D type;
> > > >  	kref_init(&job->refcount);
> > > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue
> > *q, struct xe_tlb_inval *tlb_inval,
> > > >  	return ERR_PTR(err);
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > > > + * @job: TLB invalidation job that may trigger reclamation
> > > > + * @prl: Page reclaim list populated during unbind
> > > > + *
> > > > + * Copies @prl into the job and takes an extra reference to the
> > > > +entry page so
> > > > + * ownership can transfer to the TLB fence when the job is pushed.
> > > > + */
> > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *jo=
b,
> > > > +				       struct xe_page_reclaim_list *prl) {
> > > > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > > > +
> > > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > > > +	job->prl =3D *prl;
> > > > +	/* Pair with put after bo creation */
> > > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > > +}
> > > > +
> > > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > > >  	struct xe_tlb_inval_job *job =3D container_of(ref, typeof(*job),
> > > > @@
> > > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref =
*ref)
> > > >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> > > >  	struct xe_vm *vm =3D job->vm;
> > > >
> > > > +	/* BO creation retains a copy (if used), so no longer needed */
> > > > +	if (job->prl.entries)
> > > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > > +
> > > >  	if (!job->fence_armed)
> > > >  		kfree(ifence);
> > > >  	else
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > @@ -12,6 +12,7 @@ struct dma_fence;  struct xe_dep_scheduler;
> > > > struct xe_exec_queue;  struct xe_migrate;
> > > > +struct xe_page_reclaim_list;
> > > >  struct xe_tlb_inval;
> > > >  struct xe_tlb_inval_job;
> > > >  struct xe_vm;
> > > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q,
> > struct xe_tlb_inval *tlb_inval,
> > > >  			struct xe_dep_scheduler *dep_scheduler,
> > > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > > >
> > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *jo=
b,
> > > > +				       struct xe_page_reclaim_list *prl);
> > > > +
> > > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > > >
> > > >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job
> > > > *job,
> > > > --
> > > > 2.52.0
> > > >
