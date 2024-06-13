Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C10C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 06:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD6910E924;
	Thu, 13 Jun 2024 06:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCBogcNq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F052610E924
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Jun 2024 06:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718261588; x=1749797588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DV0c+hZFQXJxzD97V1Q91LG7U4maRGq5a/Necav/W6g=;
 b=aCBogcNqIFxZJL6XkIp31u52l8rPk3MzPWHQzQZLR3Eq/gZhwimAjSM1
 3T4ow06C/AS69kNh265m5D1w67jQV1UAjCH0D3/slRqGjO4JiQ9rXqheD
 G6JfWrY7J2v+oc8mdErZ1S+khVx1NE1whfKsmxNRY3vujOwXRXwFHZLP2
 O9CicyZFo0Qupn3SS3uS7WyyQX+wpWAcLwsOtQWRBDfhNCB0J4dvmpSCH
 m2bQUBwM3maw2+a1Y9Eh/aDrcnbYxbCHMcYbtEFxuRMXwFN3DzRKhdztI
 KrudC/U1oY3JemqLcaumT35x8+Jn25k4zP39eIJmAQJrlm8FS+NigWOpr Q==;
X-CSE-ConnectionGUID: Z0R0Imr8TS2NfQx92P9uMg==
X-CSE-MsgGUID: zKn7dTFNQNGa7YruO30LYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14782472"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="14782472"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 23:53:07 -0700
X-CSE-ConnectionGUID: acHMJv7tTaiijZ/UI4WBqg==
X-CSE-MsgGUID: +VyUGeUER9uObsCqN7zXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="39926052"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 23:53:07 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 23:53:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 23:53:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 23:53:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 23:53:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rnd1DhUgEyN8G3WQeac3ISR2ebGYLCAX2yKFXLsam/yJvyLwA0Opwv6yb7wlgaf6t+v2wEAP5TRFEIxJv7n7/3xJMtXxe5TWhG1crhiGwGRpdyHiLvEVwmSh+v1Y8e6WakwGCAJy7Ua6EQh1aesgrPxAC4iVQ6sn+TXD7lvbccIUiN8u+nXXmOhu7eyQW+detQbmREjp9zRXmX7mglQFAPx2hH8dFkf03MJN9DthO18Tl70PuAoQkOPm8eTUPs8QFM5hnsw20EQ+hLFXzB4ijqpStarKPRusriyVFW69qZLuj91dIXoGMRIfaP4RxTnQKMCHo+UnW1s+nn7s4eHeOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/tN3DnNQqcsyg2UKudx+FwCUPBQEqzI9kwMkwrg8Gs=;
 b=SyMF5J/UY25F5ypilmbmMEY5Aov5niN22vlucW+D/zlIWEtGUis/WyiuK1JAdzmfEvieiZtocUpLEF1u5N/kkd0Ps0HPBFVRZ9KbGxyG6551zuPMVBCHIKTZnMmkWMB5lOwgYAc/jfBi60s3AJALReI8gta1tMRoNskwREIquiU+nTjEdxVxFL/Jc8DMbZ4R2rZQRt1m5wYnIti/hlIPZZt4LXhMC9K+EPKMJuc591H3g+kT5mpdEKwhtF9Zu10Ph8Ox/wMZKgiUCe4pzONnby8roDzV5EN8NoGY/kSejsC1r5VBhShCyBr2ScQFvlX+FvquL+C1O2h+otHpb5EQOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 06:53:04 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::3ac4:e20e:84f1:f826%5]) with mapi id 15.20.7633.036; Thu, 13 Jun 2024
 06:53:04 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH] drm/i915/display: Update vtotal math to address 32b build
Thread-Topic: [PATCH] drm/i915/display: Update vtotal math to address 32b build
Thread-Index: AQHavVqCR2vrKEoUhUuhJXlluYKIoLHFQZVg
Date: Thu, 13 Jun 2024 06:53:04 +0000
Message-ID: <CY5PR11MB63448958B467C44C627EDBA2B2C12@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20240612062925.271213-1-mitulkumar.ajitkumar.golani@intel.com>
 <874j9xjr5p.fsf@intel.com>
In-Reply-To: <874j9xjr5p.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: 436aa617-2f13-41dd-92c7-08dc8b75795e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230034|366010|376008|1800799018|38070700012;
x-microsoft-antispam-message-info: =?us-ascii?Q?KwuEz8doBFLAHJ/ajobRNqlPxuNvOcyH7Baiscf3PcqZMjmU03buHYPKiUED?=
 =?us-ascii?Q?C4GhCjkpp/WtxMeXgDGyebC/Ns8zoNwyOjgt+YGmy0Q2j+wZl+nFnJjNzLl7?=
 =?us-ascii?Q?9lhY6EGMCAl3f6NmMZztwn4ky4qBuj+CNPaDgK6c6E+8IkGxwkTg65jj71O5?=
 =?us-ascii?Q?5+nfefk9t0256nEARqorup6Qwc2cQFv8EnzGeQaKX3IAdXMdZQ8B7SN80Cjf?=
 =?us-ascii?Q?TvsTcDoTN8R0V87KpDoazrKT6mNxXbNjN88pxOtRH6pXDXZB+c3ijMZHcHIM?=
 =?us-ascii?Q?98ncDqYAlaNdhhNUw71DXgONiYZwltiSx9hHixABV/Eb4KwV2404rwpmM+bZ?=
 =?us-ascii?Q?3NCqJhb01dS2x/3Jbn4fsmvfNqF8aTvHU7ngP9iGBh9qznZ57/zm6+veArXG?=
 =?us-ascii?Q?QalJTMTQqeeeG+t5clRL1B+IZPsokO/d7J3nFCNBVzRBIgcWCHfXZ6o55G8z?=
 =?us-ascii?Q?4Br7cKAx3GDFEMjoJvqgfWCtN/ixZUox1WBV4wIGmiC0OhqYsENK70oo587u?=
 =?us-ascii?Q?Hc0RHRDgryjTiINCDYyles3jZL/Orrbopx4LV4xHC2fDkS561hdwvcH6UPDv?=
 =?us-ascii?Q?/5MM0D1U/dEFqyUK6T+cFeoOd/TRdfOeg6TsASBHDgL7v81QzWtft2I/Ty4s?=
 =?us-ascii?Q?mt55f3UzIyGHRho2ioXngsgNpFENBgNslMoBT6fdUvJ0DXo9+fHLsZg4Irfa?=
 =?us-ascii?Q?WnLN6O5pIwkchOEOBVz1Y6cDng0LKwzClGXeEcNaK8+f2KQgbIQ4eYgVzK1I?=
 =?us-ascii?Q?SAni1yfIR+nFIuC2KVIcVUax/m+nyG4bycR7/G2fsVIOZd2YjGVuaA3LUuy9?=
 =?us-ascii?Q?XD2LY1Se9JPGvkFQbTsJS3nG/t5KyZVpo4oHcRnMKUfWj3jF0Hivkff7b48e?=
 =?us-ascii?Q?xxLtEjVehknyoIuuClhS6WEG5dXqT8Yr/PapTpBzL5FzU1EDrBdK+krn0C3o?=
 =?us-ascii?Q?e8GUMm3I3iPpcYyxZ5UgPKRyN4TdR1ZwaYWQqjHQYxazgDEbqppSLDXLxxO6?=
 =?us-ascii?Q?w21qBl3S3mQrZwOtlLmdX0a7QY6mEjOjdhDkv1m2LKI+NHZJjuIMg6JJxpny?=
 =?us-ascii?Q?m+B2TEdyoqaWPK90uPRP0mS3jEUIjHh16NhsikQvtRIm1YXQ/0AYiKg1ITjC?=
 =?us-ascii?Q?U7KVUi/qTB0h/0CXQZ8lu6/0P1jTI0Irz4FnfrLUz05oIADW4zXJd9o5i3wf?=
 =?us-ascii?Q?7ea5yN4sSPYquQ6KijmmDU45xho/ZYPquTgWDwAz3l8nFVDGtxnTSEHCqPHq?=
 =?us-ascii?Q?d5i1f4X+r5F17hfEWZ0Su+T6VzmD9QQyb8BtTeTdoTspzNL58Kl8PNR/Rz3H?=
 =?us-ascii?Q?uQy2TpxA740f5MyBlrfAy7nJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230034)(366010)(376008)(1800799018)(38070700012); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yKvaXm0iA8dJwveAJMeJLsQ1jfnMO0K9H6L1tseitPgxbYGs6d2JutieoX5c?=
 =?us-ascii?Q?aqgQBGGA7cDlViK3eoTz39exx/wuXFuD5vL11WEBlfxgjKRbaXAfMa37zuR4?=
 =?us-ascii?Q?wH6+OW1Lab/kJL3xBaJ9JJA2hSybbdIiRdwLyX85VQfOI32U4n7Xabo2zgrM?=
 =?us-ascii?Q?JkXcSzwzOu8qFLYE71AsfGwxloE56eY0f5kNB9o4G8SOoxvVDbGt/yG4h/na?=
 =?us-ascii?Q?yx0Nq/5ZeqwppiSOdCC9rZNpK+KAdkqlDXXL+Yw7Q/3kjd1PVSbY0n/MMcq6?=
 =?us-ascii?Q?GwfTrzQqTJR2E9uKyJ7lTrzDS5cyt6afBOV4FPlqgEWII/j72nr2zikxiq3q?=
 =?us-ascii?Q?u0/2sZO/v56r1iRlpcKiWeHZXg0O1AK/5jlaKV/RruuYCmGOVE7W7a59D/RB?=
 =?us-ascii?Q?qqhfVrdKhNYBQtf2ezm9zjiVMa2ZVpX5/EOh/3dQmDIN/2SwG/1yedb968BD?=
 =?us-ascii?Q?7SSGvA6Q5kosq6bM9mYd1iRQkHVrlO4IKb2HCYdDrL9jv/ywyOti0l8p1oRA?=
 =?us-ascii?Q?Bni5ZlSynkq71UUO+LRREJ7Tox5feBzR8M6IIB+5QW54HQn5Pw/ZeyhshyNi?=
 =?us-ascii?Q?9rNSxFXoimNouW1B3KCWrMc7AYayfF8tf5OCTuzPju6Nb8MGbAfoaEyb9mkk?=
 =?us-ascii?Q?qWr/aU/H9BGdenLH8K9ptUkc3Zif67BDWSHZwk0z1w1NAKIR/B1LuNCh/tRZ?=
 =?us-ascii?Q?IIwdoL84g17JOFEerBD5I+kJ2JcBKTPNegqAg2qjTA8sLdUhDcEtg2bjyGqz?=
 =?us-ascii?Q?+THOlAOyoXHy6u2D9CAEAyhASs4z5BOTDXxkuQVmvvgQOei6VqYYkqJAOshX?=
 =?us-ascii?Q?s0LGfEkS3QYUbocH8U8X+8iZsBV9rBX/L2S1d07FLHWkEfa2xG941P+ReFbT?=
 =?us-ascii?Q?Ra9kgoM7mBFeruaSj1qe6DhFPaCpSUgfw/QQhVFqCMxs5tXrNhJ55OoYa/M7?=
 =?us-ascii?Q?cFqUuyk1jf+eUnXvrhrB64xXntVciizG8cU5zUb7sx4vPY5yOcmTZ+Clcs/5?=
 =?us-ascii?Q?301rSTj81e1lwJPyuDc27HIy2v0SJsuCHLbOQZM92mlgiwu9U52IEVm7tGLG?=
 =?us-ascii?Q?DDKL2BTyH9jpfvJRQFSuIJdbreyaLcwrYNlkwl8G1uBQxEBtjoVfMFgr0JSp?=
 =?us-ascii?Q?j1MfSZJVnU63TB7dHJrP6EW1o1i8vJ6OX3t9yH+gCUs2zbTLVoaKM5yn9isf?=
 =?us-ascii?Q?XovFgTJhGa5EbGtHmf1Luvh8282tevWRiHjyeOtVGSvBP7QVfdZBket24U15?=
 =?us-ascii?Q?EKGh37N2fRO/xmgFtnutDBR+VQZJnIGQprbDoj0kBLStn1muep9S4q0E7FVZ?=
 =?us-ascii?Q?PWk1aWFo3eBAags3KWNMPJSGinCsVJUV6OkEB9VSD93t1dtZOIq6z939rGDb?=
 =?us-ascii?Q?MJ2wkeR1DC1l+rgtWYo4LQgO3Cm6B7ERCmVNoxcW7X+kA2euCW5LMAtf0aHx?=
 =?us-ascii?Q?c+QmWD/vb0xrPxiQBzd7n5rMi1AXCOLA9WXA4vZQYh2WEgnd/CYbe+JkJeCv?=
 =?us-ascii?Q?+XoU8jbiAV8JQk8X634lCj4NqZrjvUDU1ogc/6CjBrNowkejmqmAY16egT7k?=
 =?us-ascii?Q?fIuDnrMeE8VmHyIQlGTc7EzFxzQ6ZBCeaa86hLv0rcYfIpp76GmM7BTowblA?=
 =?us-ascii?Q?Qlk82P8SP/4USzgwT/Hp8eY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436aa617-2f13-41dd-92c7-08dc8b75795e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 06:53:04.3231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ze46YtNmG1OObI+pqq79qPgFP9yLN7l9bUh+QGxx/ZwV/5XPYvJ9B66OzZMQRlYO/c60//xlh7g5R+SH79PFY3qDMTBPirSvoy83jhLX8TzlxvqL4Q47TycVasqbMdVW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

Hi Jani,

Change is floated to gfx as well. Also we clubbed to one other fix,

https://patchwork.freedesktop.org/series/134801/

Floated on both xe and gfx mailing list.

Regards,
Mitul

> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Thursday, June 13, 2024 11:55 AM
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/i915/display: Update vtotal math to address 32b
> build
>=20
> On Wed, 12 Jun 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> wrote:
> > Fix vtotal division calculation which works for 32b systems.
>=20
> This should be sent to intel-gfx (too).
>=20
> BR,
> Jani.
>=20
> >
> > Fixes: 1676ecd303ac ("drm/i915: Compute CMRR and calculate vtotal")
> > Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_vrr.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c
> b/drivers/gpu/drm/i915/display/intel_vrr.c
> > index 05f67dc9d98d..1e37383e14e7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> > @@ -149,7 +149,8 @@ cmrr_get_vtotal(struct intel_crtc_state *crtc_state=
,
> bool video_mode_required)
> >
> >  	crtc_state->cmrr.cmrr_n =3D
> >  		desired_refresh_rate * adjusted_mode->crtc_htotal *
> multiplier_n;
> > -	vtotal =3D (adjusted_mode->crtc_clock * 1000 * multiplier_n) /
> crtc_state->cmrr.cmrr_n;
> > +	vtotal =3D DIV_ROUND_UP_ULL(adjusted_mode->crtc_clock * 1000 *
> multiplier_n,
> > +				  crtc_state->cmrr.cmrr_n);
> >  	adjusted_pixel_rate =3D adjusted_mode->crtc_clock * 1000 *
> multiplier_m;
> >  	crtc_state->cmrr.cmrr_m =3D do_div(adjusted_pixel_rate, crtc_state-
> >cmrr.cmrr_n);
>=20
> --
> Jani Nikula, Intel
