Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D626C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 22:57:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0CF410E24B;
	Fri, 31 May 2024 22:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uj6Mtw5w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEB110E24B
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 22:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717196232; x=1748732232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tH4ehoBW90XpRpIIRItY+VVbKveDUCtlz8RNT5K4sHw=;
 b=Uj6Mtw5wsJaxYmGYgwPrOcPoIJ74+fcz4I+57r3slnvn7FLMa/3K6oyi
 ChGEIQArjd5+vKhYJ6RuMsegY00KBlrl4+iWshughyo2fCsPCxZeaetmr
 zAB7D0ogJgblmSF3JjiQMENj43nLHPdFnyUnV/RK41B7zRfvxgiU0v7zG
 QqEmKurBLdV+HlswsDoiCkZn00AGpKKhN9zdja9GJt8HFx3NGoq07E1f3
 a+UqeAI+GwAgZI5geaAs7xZD4qd3jNw60Clto4M5F7dacvet4opWrm8yj
 8M6bDWWAO4RApiTGrtm3cw2fXPLY6NmfPxm80Qrlyjqj8MbXHugbLllwb A==;
X-CSE-ConnectionGUID: Y6N5SV8GTQCIOuIQO+TEFg==
X-CSE-MsgGUID: c7c70Zd+QvWUo7e8e9YKZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="31258521"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="31258521"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 15:57:12 -0700
X-CSE-ConnectionGUID: n/cF1P+qSEyjfyND2AWzhw==
X-CSE-MsgGUID: Ia3AAL5PQhGpYEvBVHw5gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; d="scan'208";a="36932303"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 15:57:12 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 15:57:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 15:57:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 15:57:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZVo4reiUQk5J9WVseLKslb6zLbe0+0uR1DrexBSzUi3yKooCNzjqro7ZObuZGG8sVaW+n1oWXDsA/vId1Jdrg0TT9wwsh2rpndqWID0jZQtbmEpqVoAQa9bi3Z5eHmGE7cTinw6gR9Yudg2lZIA2C2vnElIp2+p3UZgmd/MdUHENVPFelMAcCfP0Aveacxu0cVjHpBkDEC+IrE80DoO34r1Kfmx8GwhVDn5MQ8i2P6O7SgEysHEJzYYlpp/v/r++Fj8li2idW8sLlFEA7ckfVV628+0tqZWCFSiEvOPz+xJlRFE5K4bGUlQSlnFVWOG+YTClz4TEmMO8Hkc1d+EdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUlAYA+owvHxkmVH57UUJu2iPkm3I+hnmRe68iH81FA=;
 b=QT6uiT1kX5it9uXPUUcN5MkPf+b7VM5265zcHAMiatsQ4jqO7E6u/i+X0dU0fmmmkC4ujf6Ae4rIHJpof7gAjgcbRYMNT4vG5cAaWWEwuK842/IVcfhsBuXNS72Ndj7QV5aj2QVgHvwYScpx/Ds7ypgANDtNUr3x4Vd6UeLYcQfPya/fBG7yPU0kHqkUstkZ2zX4lglAC27A2esaEymzh/LrQdJ3+EPuY41o518WyUl8H9rShoUM1lKViPtzrlS/iKjDMloIM/TyLRwKOQ9MuJUJz336mRAa3YvFhqp9B8dJK7ZMjTpAPRwrc51jiXluO9KwbMDUQ/NxmCBjStTyTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Fri, 31 May
 2024 22:57:04 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::497a:383a:6d76:ec5f%3]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 22:57:04 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Topic: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Thread-Index: AQHasykfIsGvi7iSpk+TPtbYf0ZunLGxhHJggAAD0ICAAALTcIAAB6CAgABCsQCAABPJAIAAB55g
Date: Fri, 31 May 2024 22:57:03 +0000
Message-ID: <BL3PR11MB63621681F228D2AE8482C1109AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB63623093B3F25F03F4EB14099AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <ZloC+a18NbT/jXrY@DUT025-TGLU.fm.intel.com>
 <BL3PR11MB6362F6BB0C6FFD668F3E86759AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
 <ZlpLhKSfUN5Y3z/n@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZlpLhKSfUN5Y3z/n@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA1PR11MB6568:EE_
x-ms-office365-filtering-correlation-id: 1b071283-ebc9-4fce-6bfa-08dc81c4fd1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?a9tZOndmTwuvHZ9QJeaRmm52HwoPOGX+PfK42CFq783qrCPTGDTU2YgNZSYk?=
 =?us-ascii?Q?NGTT8pFacwUnEO7a1HkOy4b5EEmTko+z4k6ZbAGWSvXoKe7sVi6qKxzwuaz2?=
 =?us-ascii?Q?z9BgWrMH9+IrweYVhzNpcPh+kNz7WQ0QxPqw8rIZv/Kbx775vUTd5vIsD5P6?=
 =?us-ascii?Q?LP96T1J+KmuqoJ1sUS2zj2Iy8wADOhgYCco+sDhX+sIrJ3pLrwtm54WHynUa?=
 =?us-ascii?Q?31xPJjnSghRbdAgT4/QI9MtWhCE2iPQNe5Qi2m08a/FG8VnWb2Jt8zH19SVC?=
 =?us-ascii?Q?tY5cB/+1mdcrlBglb/AaXtz5hfHnZOutixz/7QMxGfNNNihohEz/FXH/HZ4G?=
 =?us-ascii?Q?G1cbUifSka9AwCCRT9iwJ9imXhOLiPTQOCTyGmj9cvTzk60j2vBytSgobE+g?=
 =?us-ascii?Q?qQ/ZtykNBRnkNZlifmJvWCTtMlSqCdvKzYGnV9Ts4VY3P/mJVGmbuKCHelU7?=
 =?us-ascii?Q?WoJ/xu0Zj45/xP4iSkweLGIXolDfy7tSOfAamse2QJxL6q79FTjfj8/tCHec?=
 =?us-ascii?Q?2u/MWS8c5wH0nFZcXA/ozY3wT7kH0rKN9fgeyugUmgrOhVAMSNeZf5aYgbu/?=
 =?us-ascii?Q?tWxDTg7s+23ONn1LQvXdRLIZC1kNJYlIuOmchRcSRjdAbPTfgw8WyNP2vRQw?=
 =?us-ascii?Q?Eue2mHvZq3SFrf+lyuk8rgLv7xPNBVoPyb5+24VPFuRDFZLN+8IpQpsh12PV?=
 =?us-ascii?Q?1508ov72DaB+Ak2cfog2wx0ZLMmT9yPzRa2UktSr/dn7VOw2APcW4Ik1vERE?=
 =?us-ascii?Q?zums7bzN54Xv7cAelcagZy4x4vcKpPCleRfA9VuM2/P+Ndv2uEggluKWulre?=
 =?us-ascii?Q?baRKenyUF29/Ycy/Bxs0oODcXFDj278kuaYrjrGQDJRTVLVhDDW+TpLftYvU?=
 =?us-ascii?Q?dDXOStVMYZNgfmRIkWthtlhzND6PU3dJ0pV6rtoSMw14ybXh7+YKMlogKEdT?=
 =?us-ascii?Q?EEqinSZBmGne6ypr5WasNQywgbCdIp62bD1GhdYQYhpLHXfkRKgKe6YLdyYB?=
 =?us-ascii?Q?DovA5/kdvp1OrVgrTqHfG3fsfOIwG7NNcVUxPlX3W4elvrvFpwNvkqEBSyE/?=
 =?us-ascii?Q?sd4CBwZjgVr16nXpCayPj2gktBVD23eBNa6xBBKGryXgOXs8aCRRRDSPv/mH?=
 =?us-ascii?Q?9ymiDK/zNS59rPMBMtZarBJZwcncmroE6o4bBtAIqgIvzYp4RRKcRJNr9U36?=
 =?us-ascii?Q?LuKpHRTn1FCc3K8kaSttoAeMRp3Gm4CTPUhyK++fxm1ISYhU5R4UnS4ItDJH?=
 =?us-ascii?Q?pFt9taPpqnbcFHYGizYKnDusnor0KgOhycZ2zuldiw1WAc6+sIw/kAyCIgMp?=
 =?us-ascii?Q?UfRHk83v8Mes9iCq+o/OazC72w+Q3lh9tqamD9GQtmzaEQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AWNG5K+/c9gZS9qVQletuzzavz8ir+H+1tTKFWaWpheh08j4vNvO0CJ/qyWx?=
 =?us-ascii?Q?Wl+LzVuUZvH6zCeADGuI3Ct8PJ9VzjK0cADdNK9yp4qbJmgY7OeQkjoX3vxq?=
 =?us-ascii?Q?oY2KieE7fDYPJDEpb1rb8VinagS/b1K51mtFuhLUa384TJlEx0GtKxB5Mrde?=
 =?us-ascii?Q?k/L3iiwEOmv1PfI1nxLhA3KLGh4sD8dfzxBXHW3jPIJvzos+MzeBAVDDw95p?=
 =?us-ascii?Q?+v+7wwFie9WfXvOZEcFRetCzH6DAOCQ6Pt+ikr2sM9uQvIfEwOKso2FwsHFO?=
 =?us-ascii?Q?vYw1NR3B2Idu67CuCkyr3kR6lwviqjqMe2PwXtQxobthnb+rPtoQuaqRpeqo?=
 =?us-ascii?Q?UevdxknCDdXhc8/jRJZrYcxS1/xZYkv0oKNxAr2OgF7a3hTgTxeP/DFFnbJo?=
 =?us-ascii?Q?cp0ilh4n6mFgbiAHKDZgM1mee7jA4r0oDfvvtqBROAhIbsFPlRyZvlGdOYyC?=
 =?us-ascii?Q?XQAzUKeZn9qk77eOdwTm8YNJX2TsOmqL7wv6BqpIJKKwEB6V7Ikv/1jqAwJP?=
 =?us-ascii?Q?AZrBtdOjI6qubGmnvvDDiSHOB8cLZ7vOJs4efMXCBJoDOUpAPgYP5RzliJZo?=
 =?us-ascii?Q?93oe1/n/PPZjEVn/lj2k/ZVeIFGeW/68LC9HUKE884Ty8Fs7QT8FA3CVFFre?=
 =?us-ascii?Q?/NFaEoE00Jk5ATlpR7eG5A1VafBaVoEd2gn0XU9wPLa5/K9loFowbe+Brfmu?=
 =?us-ascii?Q?eTc8ihPAzxxO1z65OXlN9iqal4ZHQtgZHxwaUWGRfE/xAIcW9vz/d/+mBEJn?=
 =?us-ascii?Q?+02gb9Tn94zxfzOMzfIDF8dTR1ccdA0lPsxdDLOFzNXdK0uxY4oF3fvcM+I4?=
 =?us-ascii?Q?BmB/YvZK517PpmZ3DnerfSMp3a8rLgfpmr4Any5r5o13n+sDIFOAx+9ty5KK?=
 =?us-ascii?Q?tHSeVq1e9ySMFJIUDzAuc/pJWPnPJcN52lzrMjq90zaA9EO5TTTiCz0ES/o8?=
 =?us-ascii?Q?YVS36bxbaGoPZ6MokFrBwaVflKEmB9n04mb21TfLeiLFugoyZgn1CFBltk3L?=
 =?us-ascii?Q?LEeACc3XB8Z2auXdhxSEtVzcAKYMrznwyfvH68TP3OzM1JAhxgPstgeUBLWA?=
 =?us-ascii?Q?9g4uVu3sQ+l/S6dYgBCzww97nLFEQR5Kcu5TxexJbIf1ytWxd3v4x5piGjAf?=
 =?us-ascii?Q?XrJrPF74wN10V3njOEnXMt5lEflOdmRFXZwlj4Q6Aex2cx+idSj/Jd7sv/V0?=
 =?us-ascii?Q?ncD/VGfnK/uK9WEq2/2VJCBKtjBbKHsmIq/yH/u+EgAhanTvfc/F58oLNW1V?=
 =?us-ascii?Q?Tq/hWVwkQzJr6Npwyq6nkvezYUuv/uMRky18sU/flsyFmV1q2kUAEsLK7Ycp?=
 =?us-ascii?Q?mMRNrdKFjfeddxVxTbGcWaQRROxwTU/OkYU30Sl0j1NUXlBZZ5vv5W+HOykW?=
 =?us-ascii?Q?6sjxio4C/9gBAYQ61ZuEkLyBzdp+J81ihIR3q276TlZF2Suj1rlFXW2XHigz?=
 =?us-ascii?Q?em1pY1B18218feuCXKY6SX9f5cJKk11WNP7m81zKD1e8BNKeH5TCtRDD54jr?=
 =?us-ascii?Q?6thsTySng+xa/a3z27SRx4S9IsZ+U3IJpNGP6FMFNlKiqzXOb0EsUp3f72Z+?=
 =?us-ascii?Q?mMo4Fp5GjOj8p+jUo8A=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b071283-ebc9-4fce-6bfa-08dc81c4fd1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 22:57:03.9661 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+7e79P69qQZtJWYdMENHHilu4XiNDznEK+YBMmMYBXuOH7hI8n9VhAEGII+HJOXDJ502z6CZhaX71/U22cb1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

> On Fri, May 31, 2024 at 03:22:45PM -0600, Yang, Fei wrote:
>>> On Fri, May 31, 2024 at 10:52:37AM -0600, Yang, Fei wrote:
>>>>> On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
>>>>>>> Overmapping the identity VRAM mapping is triggering hardware bugs o=
n certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk=
.
>>>>>>>
>>>>>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>>> Cc: Fei Yang <fei.yang@intel.com>
>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_migrate.c | 54
>>>>>>> ++++++++++++++++++++++++---------
>>>>>>>  1 file changed, 40 insertions(+), 14 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> b/drivers/gpu/drm/xe/xe_migrate.c index
>>>>>>> b882d32eebfe..2d92ec27981c
>>>>>>> 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>>>> @@ -69,7 +69,7 @@ struct xe_migrate {
>>>>>>>
>>>>>>>  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */
>>>>>>> #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE *
>>>>>>> (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
>>>>>>> +#define NUM_KERNEL_PDE 15
>>>>>>>  #define NUM_PT_SLOTS 32
>>>>>>>  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 5=
12 @@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *t=
ile, struct xe_migrate *m,
>>>>>>>       struct xe_device *xe =3D tile_to_xe(tile);
>>>>>>>       u16 pat_index =3D xe->pat.idx[XE_CACHE_WB];
>>>>>>>       u8 id =3D tile->id;
>>>>>>> -     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[i=
d]->level;
>>>>>>> +     u32 num_entries =3D NUM_PT_SLOTS, num_level =3D vm->pt_root[i=
d]->level,
>>>>>>> +         num_setup =3D num_level + 1;
>>>>>>>       u32 map_ofs, level, i;
>>>>>>>       struct xe_bo *bo, *batch =3D tile->mem.kernel_bb_pool->bo;
>>>>>>> -     u64 entry;
>>>>>>> +     u64 entry, pt30_ofs;;
>>>>>>>
>>>>>>>       /* Can't bump NUM_PT_SLOTS too high */
>>>>>>>       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +=
160,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_=
migrate *m,
>>>>>>>       if (IS_ERR(bo))
>>>>>>>               return PTR_ERR(bo);
>>>>>>>
>>>>>>> -     entry =3D vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SI=
ZE, pat_index);
>>>>>>> +     /* PT31 reserved for 2M identity map */
>>>>>>> +     pt30_ofs =3D bo->size - 2 * XE_PAGE_SIZE;
>>>>>>> +     entry =3D vm->pt_ops->pde_encode_bo(bo, pt30_ofs,
>>>>>>> + pat_index);
>>>>>>>       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>>>>>>>
>>>>>>> -     map_ofs =3D (num_entries - num_level) * XE_PAGE_SIZE;
>>>>>>> +     map_ofs =3D (num_entries - num_setup) * XE_PAGE_SIZE;
>>>>>>>
>>>>>>>       /* Map the entire BO in our level 0 pt */
>>>>>>>       for (i =3D 0, level =3D 0; i < num_entries; level++) { @@ -23=
3,7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct=
 xe_migrate *m,
>>>>>>>       }
>>>>>>>
>>>>>>>       /* Write PDE's that point to our BO. */
>>>>>>> -     for (i =3D 0; i < num_entries - num_level; i++) {
>>>>>>> +     for (i =3D 0; i < map_ofs / PAGE_SIZE; i++) {
>>>>>>>               entry =3D vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_P=
AGE_SIZE,
>>>>>>>                                                 pat_index);
>>>>>>>
>>>>>>> @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile=
 *tile, struct xe_migrate *m,
>>>>>>>       /* Identity map the entire vram at 256GiB offset */
>>>>>>>       if (IS_DGFX(xe)) {
>>>>>>>               u64 pos, ofs, flags;
>>>>>>> +             /* XXX: Unclear if this should be usable_size? */
>>>>>>> +             u64 vram_limit =3D  xe->mem.vram.actual_physical_size=
 +
>>>>>>> +                     xe->mem.vram.dpa_base;
>>>>>>>
>>>>>>>               level =3D 2;
>>>>>>>               ofs =3D map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ =
-258,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, s=
truct xe_migrate *m,
>>>>>>>                                                   true, 0);
>>>>>>>
>>>>>>>               /*
>>>>>>> -              * Use 1GB pages, it shouldn't matter the physical am=
ount of
>>>>>>> -              * vram is less, when we don't access it.
>>>>>>> +              * Use 1GB pages when possible, last unaligned chunk =
use 2MB
>>>>>>> +              * pages as WOCPM is not allowed to be mapped on cert=
ain
>>>>>>> +              * platforms.
>>>>>>>                */
>>>>>>> -             for (pos =3D xe->mem.vram.dpa_base;
>>>>>>> -                  pos < xe->mem.vram.actual_physical_size + xe->me=
m.vram.dpa_base;
>>>>>>> -                  pos +=3D SZ_1G, ofs +=3D 8)
>>>>>>> -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flag=
s);
>>>>>>> +             for (pos =3D xe->mem.vram.dpa_base; pos < vram_limit;
>>>>>>> +                  pos +=3D SZ_1G, ofs +=3D 8) {
>>>>>>> +                     if (pos + SZ_1G > vram_limit) {
>>>>>>
>>>>>> I'm afraid this patch wouldn't take effect on platforms where
>>>>>> vram_limit is 1G aligned. Even for the last 1G, this check wouldn't =
be true.
>>>>>
>>>>> We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leave=
s this code in a risky position where the 2M pages could largely remain unt=
ested. Perhaps introducing a Kconfig option to enforce the 2M path could be=
 considered? However, excessive Kconfig options can be frowned upon, so I'l=
l defer to the maintainers to decide if that's a good idea.
>>>>>
>>>>>> Should be if (pos + SZ_1G >=3D vram_limit)?
>>>>
>>>> But the problem we are trying to solve here is that the last 1G
>>>> page overlaps with reserved memory region, there would be no change
>>>> at all if we don't break down the last page.
>>>> Or vram_limit has to be usable_size + dpa_base, because usable_size
>>>> excludes the reserved region.
>>>>
>>>
>>> I misunderstood your statement. Yes, I have a comment in the code for a=
ctual_physical_size vs. usable_size which needs to be addressed. Need a pla=
tform expert here to answer.
>>
>> Harware is checking for any PTE crossing the reserved memory boundary. S=
tolen memory is considered as part of reserved region too, so it would be s=
afer to stop virtual memory mapping at DSM_BASE, which means using usable_s=
ize instead of actual_physical_size. Of course if the DSM_BASE is always 2M=
 aligned, there wouldn't be any problem to continue mapping reserved region=
 with 2M pages, because no PTE is sitting on the boundary anyway. But break=
ing down the last 1G page into 2M pages is a must.
>>
>
> Ah, yes. I understand what you are saying here. Agree then it is best to =
break down the last 1G into 2M pages. Also still a likely unclear to me if =
stolen memory needs these mappings.

yes, this needs to be answered, but I don't have one.

> We also likely want an assert somewhere in the code ensuring usable_size =
is 2M aligned too. Does that seem correct too?

That's correct, if usable_size is not 2M aligned, then we need to break dow=
n further to avoid creating PTE sitting on the boundary.
I hope hardware design wouldn't go that far, lower granularity doesn't make=
 any sense.

-Fei

> Matt
>
>>>>> No, it is always better for performance (TLB usage is better) to use =
larger pages if possible. With that said, the logic is correct.
>>>>>
>>>>>>
>>>>>>> +                             u64 pt31_ofs =3D bo->size -
>>>>>>> + XE_PAGE_SIZE;
>>>>>>> +
>>>>>>> +                             entry =3D vm->pt_ops->pde_encode_bo(b=
o, pt31_ofs,
>>>>>>> +                                                               pat=
_index);
>>>>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64,
>>>>>>> + entry);
>>>>>>> +
>>>>>>> +                             flags =3D vm->pt_ops->pte_encode_addr=
(xe, 0,
>>>>>>> +
>>>>>>> + pat_index,
>>>>>>> +
>>>>>>> + level - 1,
>>>>>>> +
>>>>>>> + true, 0);
>>>>>>> +
>>>>>>> +                             for (ofs =3D pt31_ofs; pos < vram_lim=
it;
>>>>>>> +                                  pos +=3D SZ_2M, ofs +=3D 8)
>>>>>>> +                                     xe_map_wr(xe, &bo->vmap, ofs,=
 u64, pos | flags);
>>>>>>> +                     } else {
>>>>>>> +                             xe_map_wr(xe, &bo->vmap, ofs, u64, po=
s | flags);
>>>>>>> +                     }
>>>>>>> +             }
>>>>>>> +
>>>>>>> +             xe_assert(xe, pos =3D=3D vram_limit);
>>>>>
>>>>> Also while I'm here, I think this assert will pop on 2M pages. I thin=
k a break is required after writing the 2M pages.
>>>>
>>>> hmm... pos would be incremented to vram_limit no matter it's 2M or 1G.=
 Unless vram_limit is not even aligned to 2M, which I doubt that would ever=
 be the case.
>>>>
>>>
>>> The assert is for ensuring whatever we map is fully and exactly mapped.
>>> So yes, if vram_limit is not 2M aligned this will pop. In the current c=
odd if we use 2M page, the outer loop also increments pos +=3D 1G after set=
ting up the 2M pages which would create an issue. Sorry if reviewing my cod=
e is confusing, just noticed this during my reply.
>>
>> You are right, I missed the outer loop. A break after the inner loop fix=
es the issue.
>>
>> -Fei
>>
>>> Matt
>>>
>>>>> Matt
>>>>>
>>>>>>>       }
>>>>>>>
>>>>>>>       /*
>>>>>>>        * Example layout created above, with root level =3D 3:
>>>>>>>        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
>>>>>>>        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
>>>>>>> -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
>>>>>>> -      * [PT29 =3D PDE 0] [PT30 =3D PDE 1] [PT31 =3D PDE 2]
>>>>>>> +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
>>>>>>> +      * [PT28 =3D PDE 0] [PT29 =3D PDE 1] [PT30 =3D PDE 2] [PT31 =
=3D
>>>>>>> +2M vram identity map]
>>>>>>>        *
>>>>>>>        * This makes the lowest part of the VM point to the pagetabl=
es.
>>>>>>>        * Hence the lowest 2M in the vm should point to itself,
>>>>>>> with a few writes
>>>>>>> --
>>>>
