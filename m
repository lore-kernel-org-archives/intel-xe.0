Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992ECC9832A
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 21:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00CA210E20D;
	Fri, 25 Sep 2026 21:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atBbKpNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4343510E20D;
 Fri, 25 Sep 2026 21:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790373578; x=1821909578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KUMjpXcc2kQpSu36SJB4AvqqpbP8l0Pk0PbfaFZazt4=;
 b=atBbKpNpipY9oXlhhZvg9YGx0naH0OBLzl5Ogc5rCKk2f25OshVjLuyu
 n2ZS96ePm/TRF2iOPiinEFzc1Z3xLuVlPSzrMyPpaBk9TungIhCTCfDyo
 H0GJtJ9DrZBsTkv9bI6yafIveb9ua4bL5jvNAnYHovyiU2EwoaSX5uQB8
 YxZAzKEIHKP0cNXudAxTQd3TS7Q4kXZt1kosgPeXqGbrW5GVmuuvLtowD
 yKIc7JLr0OfTakyt6im2co/Qw2Kg+hgPZMlcz+f4i5hOfss8tIibC/KR6
 YUzJyhS69vCicJK9jAKq+zSTWpV94B/CI2Kx+WvO33m2MPlIx20bywgeM Q==;
X-CSE-ConnectionGUID: 0Y0nPTbtT9q9nt/kCvCHrw==
X-CSE-MsgGUID: LMptuyCJRBKbuc7ziUnI1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="100498163"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="100498163"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 14:59:38 -0700
X-CSE-ConnectionGUID: DngIdrGzSOWpVpYM25zFSA==
X-CSE-MsgGUID: Ct6YufoxQ4i5TGmKtkPFHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; d="scan'208";a="302371140"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2026 14:59:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 14:59:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 14:59:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.48) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 14:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3DInZboH/7aOauPa3/u/nhPG7hJFs6UkxtDabdrUB2YCl+aSbfioSVPMmCAWCZx7j8b02v/eEzYcZ6p8nOcl1MYNwI0ptXkRA1jbVCN8TTPN8Z3IMxy7MOMM1f/jKXbdpctka8f7XF9kvFB0/rHlxEQJJkMDSQBgPVY2vE0h9FtE9Bah8d+Vq7AR2WI/KdjzsJ9nDuKlA/QxX4BzjQjDLEQK3IMQjOCt9S5byK80pm11ZGwE3PzXvLUlyji5OznMTDYBPFWPvA4h5sfG8F8igj7R6zbzLPSL/EH+psTl3vvesjk6p04P2iDFDYKGv5faYjfdqRgBK9JVQjwRgD7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUMjpXcc2kQpSu36SJB4AvqqpbP8l0Pk0PbfaFZazt4=;
 b=V/QertoM24iSbrHvTERKUB2Ib9DSTbr09VzFmXfQP1mpLHmfg9YaRnzaK5nm8+SJzYg2MHwf30jlwkhuWHrzEdiSv711zySDiqboB42QFyDB7THgwBi4URlpRxn8XOG1IkPjZ5T+NsZmG9QSdITerx8J0Ee2OcStC+l+dNXGjabzhLJeD1XW0VGGiFVXvhJ70M/3dq8A0dI7DUFTYwlPxwOmOOx6RCJ9qR4YFG7mryqnCOdwGdDxAxQ8iqECVTYWiRh2EJnSsZA+XinnwB8NhRvp22sd4HpECRv9uTUVmocRg0Xk48H4m4ck37jpCyzSWrHlBbc+mUhaka47gFGApQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5955.namprd11.prod.outlook.com (2603:10b6:208:386::21)
 by BL1PR11MB5953.namprd11.prod.outlook.com (2603:10b6:208:384::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 21:59:28 +0000
Received: from BL1PR11MB5955.namprd11.prod.outlook.com
 ([fe80::cd6f:5d38:d39a:7d63]) by BL1PR11MB5955.namprd11.prod.outlook.com
 ([fe80::cd6f:5d38:d39a:7d63%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 21:59:28 +0000
From: "Hu, Austin" <austin.hu@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "huchao426@gmail.com"
 <huchao426@gmail.com>
Subject: Re: [PATCH v3 0/3] drm/i915/fbc: Dirty rectangle bounding and CFB
Thread-Topic: [PATCH v3 0/3] drm/i915/fbc: Dirty rectangle bounding and CFB
Thread-Index: AQHdS4ElJBzRn106DU2R+sdMLawv8bbdl80AgAIJrPs=
Date: Fri, 25 Sep 2026 21:59:28 +0000
Message-ID: <BL1PR11MB59552B526399838D45334F74E8802@BL1PR11MB5955.namprd11.prod.outlook.com>
References: <20260812215350.3753102-1-austin.hu@intel.com>
 <20260923172803.1011636-1-austin.hu@intel.com>
 <4c41153d0be6d50515eceaf25618ec82643c65c2@intel.com>
In-Reply-To: <4c41153d0be6d50515eceaf25618ec82643c65c2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5955:EE_|BL1PR11MB5953:EE_
x-ms-office365-filtering-correlation-id: 89200f8a-2915-4532-06cf-08df1b50458e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|22082099003|18002099003|38070700021|56012099006|11063799006|10067099003|4143699003;
x-microsoft-antispam-message-info: ORkqWTO0fJSBGlMdm7UJT0lb0Mv5ZGmFdXHr9OXVMZr7UdrxH+2FTkAOHDQKm7nqjFfCits3dzjGlfo7AMfGkEfX5a2ymffZcL1mYyHd7NDtdhVDFjrw+uMcAnSKq6bWwrhynMyobaBAhIxEONyzwb/vX1KSdnfiViBAlFvAWLlOo/PFD5xqBbVQdhZH4AoErBGqrQcgElsxw9h+1qS/e6o0eAuhJYdSv5RL7KW3mAx1iwJ1jNEL7JAShshJU4hdFd//CoyspAbZKegP53pyXcOC22+bSRcPcZHb3gIKOohzNxaWujd/NSFG48ailoZgCixTpdkfNSh7tfigHTWTct//ktGr083902TwvRoo9Z/kicsw6wXFhosziVrj9HDsRvM+kPOax9xfNGxGuQhlGfTynne9DgKSssoBw5SfsB9ukzHOR+vetvfC4YGIlx2yS1NsEoxu71aLaOlpckOhuyJa7iJ2lzlM2/IRupa+sjT4kl253QxteSt7trhM+2boT0q+g/if4pwdXDHs1l+br3zaZcyTmRnPHRNf7mbZSSnLR0YhdoG2J78p6kFP1Rc418RDalbHBNms0R+KhP8goTMQ6R8dei4AxCOSdMBqaMkM68fFYbHCUPPHMDs6qXW2JFPpyP3G0J+LAEeeVLTbOHL9K9CyqkZ2YBDghv39WAoVrdTFWRdd58S5zhI4jxmT/s4XfAKFHxAJr8pmH4jVTwbsPRePfWUadkkwAAzJ17o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?X4xtCpc3CyPfFIkS5ncm3LA9ERy+AebGddAsSYHSB8vR+paCzINAo6LQXk?=
 =?iso-8859-1?Q?vjYCSrHFS9DDaNxjTM6O8bk4rbyYoSFAnaEmocYL7pwgfPCnUbvYcRQ6sB?=
 =?iso-8859-1?Q?XGzL3rQD5FQ4KiEEEHj8Fj9V5LiZ9V+mw2ve49YfO5jDcRZFtrUsdx+EHn?=
 =?iso-8859-1?Q?FAe/OgazxyPcoEXP2jqzWb1+0SEHNMAXn7iBfkg912drqVBVIHko8PH7ea?=
 =?iso-8859-1?Q?eqTecOjbxTyVrq2/0XkF2vjM/hNsI8pLMwiMWGs46tySaI+uHZQAnpVlHs?=
 =?iso-8859-1?Q?FgBKSzogY/S2OCUTnf9+r9XNuenP8bZ11fOXL43HvByjp4Qw3nfIh3GKy3?=
 =?iso-8859-1?Q?lHL1SoyENr7CsRlg53jtwgi/uyCPkh56N2HZhelwVszlHxM/Efd7+QMohX?=
 =?iso-8859-1?Q?B5r1NF5u5h5WlUCjv5sAMWGrwO6tc1H/HLmOVC4HoJ/0gUX0FKNR54SNfc?=
 =?iso-8859-1?Q?dnz0FZn15xote5rn3qKNvnL/D/bjJRM98wJ5dubA33R14G74Q+rpsqS4p2?=
 =?iso-8859-1?Q?Uhfrh+OXb4Wl070UrUe34DuNbo63GwQ1j6bcPFNlRoiu3l66FUZvjz8ziq?=
 =?iso-8859-1?Q?RsL8l11IIib5ZACR4/2WAqUTs1SweScly2HbH6Pp6qR1k+AuTtqkRPGdx4?=
 =?iso-8859-1?Q?phEOByOjqjwtVqCu69Hv+BIxGroIEskixpJgpz1WhIUZ0HmIqVFC8lUJft?=
 =?iso-8859-1?Q?bGJOTt9y5t8aXIJsL2ylOwkF2UOeAdx02f1/b6VzQWw60Z/+wF9r1JvvLC?=
 =?iso-8859-1?Q?iCskN2yIxcZZf9uBa4MNT/3QzdjpImDej3NLdVvxP9IntmlnOFmBboldzs?=
 =?iso-8859-1?Q?HGnNUSG6fnJnNFtm0dEMkd6PjtfygZzMacBUMLRlWltiWywSD00yqpSNas?=
 =?iso-8859-1?Q?hsCBnjVvGgkVObSgAiRo5jMEtTJrPGUDZVmsxaY3HZeq73ZY4ETzdUXJD6?=
 =?iso-8859-1?Q?kR2HQ8jA0nW6nGzsgwPkv4V71RmLD6NiZx8dhgJbsZm/0wbbT7uNDBqBZK?=
 =?iso-8859-1?Q?PvtiHDePp6tP/umbaxZbX5CHijYbujbzd/J5x36Uoo7jS3r6UbMemFPy1n?=
 =?iso-8859-1?Q?WpOQ8irQ3mhr7d1AvRuCEzPKs0PCfai/jZuvpxRBZ+B9ju4Ne1uI8/nRo4?=
 =?iso-8859-1?Q?ZmiiuboWixDyZrQZmd8Zm0K3qvqPa5UAIWmUedlsiWqR/FZ+fkgWvXyzQb?=
 =?iso-8859-1?Q?WQNm1Oej8Veg3eBJTJDhh7WIq1DGWy6JeZXYkSW0DEPuZceDv96s7dqrBd?=
 =?iso-8859-1?Q?gAHFYHDBJiWWgEvrmWz5+zdmsEfjaUfkii7+TRWLHLbTbc3fB747oaleSg?=
 =?iso-8859-1?Q?AgXDDDv1xm2XDo/hin4UL2rCU5o3QoIm+vpU2jlhyJxp4ZvakTMNol7+gx?=
 =?iso-8859-1?Q?atQCyCxY1Lzdc/mvggFaOP3jUqL31yAby9GQDOHMRaxZL8fkQLYwy2xZWL?=
 =?iso-8859-1?Q?/UxJ9GkjUQCV3Yw0eIi7pokHTpjLOIlNjTYSm3P1MKVGIWHpTzFH2NhUqa?=
 =?iso-8859-1?Q?dDqTW9f4mUVwzUbrgIpJHuN24PNfnUFChV70VsRrCQOVBTlypOs/FcUF9V?=
 =?iso-8859-1?Q?SCEwyFmBpbRGaOSKNfiS2TtEFsVhwLgCH9IcU31/5kD7Db8r0nKhUfp+iv?=
 =?iso-8859-1?Q?cS5M9MzCeSq42r0eUshfe2Y/ijDX2XFbh8r54AHWmc0sqeYoBHapQTCV5s?=
 =?iso-8859-1?Q?fhuMIf+impEkprdUnhxyZieqUXYEkqYVhGAY6gDVrcsQa/flL+IocH3xqL?=
 =?iso-8859-1?Q?DXllol/yY6jyiKrD4i/2UKbobWovcf2g7TI22ip6xvGjOy?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nUpVxo8JZjP4Wp658nZL1kDNCVQTv4f00uQb6XFkFhptB9mKfFmCuu5B2RA1NalRFGuOZsCf9VA/ik7ZPRolmTntYWgRZEbWzjNrNSZOjjka5wqazHAe5QuIWtbmYqpDE5kSEgz4teXHzOE3FayOGt+Gqe6yFc/IHW/jjsGaQRBA6MPPnMJ/Owuz/lo5R2ao67S0rBcJWy8zyYwzQrHy0w/yTza2K39eTOCb0shFrb55FN6GgAyTdM88lnki+bUJQJ5HAhTAU3QAjawmp8brbGBWJj10BZY1JDxTl9N5YG7loybwDZWgCAekXveOm7OK9h0aAYJx+h3mdkj5hFAP/w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89200f8a-2915-4532-06cf-08df1b50458e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 21:59:28.7576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: apVzcMV36pNKdnbZ/EJJ/xlxwHDPESwcKMjZRIF8tQc0knT75W4qxNgxb+4TxQ3sfgeEtxD8fW1WGrpfilMnbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5953
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

On Thu, 24 Sep 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:=0A=
> Please base your work on drm-tip and send new versions of the series as=
=0A=
> standalone threads instead of in-reply-to previous versions.=0A=
=0A=
Thanks for the feedback, Jani! I have rebased on drm-tip and dispatched v4 =
as a=0A=
standalone top-level thread.=
