Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F13D1CDAB
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 00:22:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE2510E19C;
	Thu,  4 Dec 2025 00:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQ8kQTn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D1D010E19C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 00:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764807739; x=1796343739;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3HJeqZ8wg2Exf0CuKFk95DkqRQT62O27mQxE5uis6f4=;
 b=MQ8kQTn/ALiMuPxZs+CmfvVP7oUMtNtLfsAY5vDHj+z3AvRqczt3MKdw
 Nlo3GJvy6E0ZciwHMalbjjjwSFwNFUx1IY2Q/x4gdra9SoGHgiuYZaHWv
 yKFjurqn1y99TT7ih6H8fHwQWpVeWJ9gSWGsRwKPhvbZpdOCChoGk+SjP
 hug698/wk3MuxC1J74U49buebrYue+VGLDSJVYiUO81z2XjlYm8x6E1AY
 R9orqzIXGzXxFtV070BJNx7WPb2ibDes49nIjWQabKt+IKItQg3oqPXoq
 OGMQTILq3wTdpeD4k+g9lmtIcWwPiyB7sqENpwk3YErn+i0eCd19ctdQ4 g==;
X-CSE-ConnectionGUID: Hqdk0jwDStuBgSPTW3A/6w==
X-CSE-MsgGUID: 6ZT6ivFkTAeCZTmrvYx0Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84419754"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="84419754"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:22:18 -0800
X-CSE-ConnectionGUID: yksVv1a5QlWWbk8Gjvmbww==
X-CSE-MsgGUID: XkUyBAj7RkKTete+57DHnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; d="scan'208";a="194931301"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 16:22:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:22:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 16:22:18 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 16:22:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiyuyNudl2Rby7pgtAEsFPz09YUdQclAqotkSS5we0kv6VqbQHKPHu/8GG3PdKoxjZKF4G6zBJP4BoEKUyhza5s/7I7NOq+e18Oay+qAH/CoDLwnY3VOZndTL/g1MWxWsvthoJEP/qCakwEO26+/7WxOdtxAmc9fZFjOFghxfSrvOYPYopn5eN5GhB494HGMtjJCwE4n5U1LLBkWpQ+XPujRUnc/cM0uQmIQA1+sBB7cPKBKP0IGb0OiMXSyPRYwTNH7lIBP9BACROnuSyJgIQA8s53rUDf+mGveLA4Y/ymyIh99M4Woc5AHTZeFH+LNTGhjKMAKRh4QMhay7ExgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3K5Ooh7h4q0Yzy/RwlnxYTLQg59um7AUqFcx1ttAHo=;
 b=txW9cIwojpAV15FyJmj5+AVfyTdyV8wuvF9+JI9iEU0Y5uYuV1/myTLZdhovfEsl/eeeYi42vjfu86FkM237kFvSGT+9AUNbEpkELxFIp3L7fZ5o9KlKJAL32rpPtXLF5kuBerzgp8LyovJz8aJc1mdjPdXxUVvoiTg1OaLTJl4uuLDuEgywuVeYGENpl7CSNjMwmkirreHjpGCZ/MytYZJDQKBscqQYqq/mo1EfVgtGiK50c9hyoeMZVCYVuS9ETtkalq93Brg0UGbM21DbrDdUXKE5uVQd7cqELQ920HNlt6vJ2GXosnXC2ijkZ7zXAF1Bmqh3qNC9lXHC6yY1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SN7PR11MB7068.namprd11.prod.outlook.com (2603:10b6:806:29b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 00:22:11 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 00:22:11 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcXyjJG7EwvMuSJ062FpUI1FjWxLUQlpUAgAACXKA=
Date: Thu, 4 Dec 2025 00:22:10 +0000
Message-ID: <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
In-Reply-To: <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SN7PR11MB7068:EE_
x-ms-office365-filtering-correlation-id: 0ff629b7-3cba-42f9-3eb4-08de32cb2aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?UEMU1Gt6a39+VnHlD17YvHCLIHZB++/x39aHoURAXK2G1fw2Jykv6kNMBKTx?=
 =?us-ascii?Q?oGxOyyZqPaIC+fnjQoHvKb2WIAyPjJKYgwTXBWrbvqB+zuXk7I3Uwr2czte1?=
 =?us-ascii?Q?xeRWUI7KcFfjYfPINoRKB0rWobslZwLVPXoQ3jpVOD4Ly4gI29SLe+MgoPci?=
 =?us-ascii?Q?dTNcdoFDxa3JboVjfO3nFny1g0E88TsH8lMYJpOpK+bHPUPIsww2UhuOHz6L?=
 =?us-ascii?Q?jdQEAyeYeGSbrJ0BFVKy2MvgjIwqSBI/lq39Z+MDhAKbaD4dUrbglXNYv1SZ?=
 =?us-ascii?Q?sA9vOx6kjwEUnBV8D5f2qqZSbRvgmAxhrdPdEvhXr7yeSGTUfkecuHxabfEY?=
 =?us-ascii?Q?3FSiMshX4szTSJwYNtxiUKrPlx6J9F2zp+dj/M0ONvo1LZqvfl+Aq2zm/UgX?=
 =?us-ascii?Q?unMmmPROjrxTlSDwHPxgIlN3AAEsjfkSqWjAOZOgw8o/uHROxS/EIfx0UhH8?=
 =?us-ascii?Q?QeFhMerKJPk2eDtQCMUaj+4HnchjTTcHCvIV4Fh4dgfQkbIVXISVnCVZyhao?=
 =?us-ascii?Q?KMgguBhyDI57cXJfHvtYmhdWxkDi3vNzFQuXScoZRGozN2L05yxgOhv2Ppw1?=
 =?us-ascii?Q?t6BleCDIa92mr/0hgVmOyUufbrqfxUxZ3IU7Jyy6nrLqSsuvhf96Cq5mP8kD?=
 =?us-ascii?Q?sj5/l2PozBSczUTeC/dA/BhwlGnlTceylX/azPHYLfIDDQ2oI7JfUZylk6L+?=
 =?us-ascii?Q?+NwUezo/ZVh68d/b1CJYvYPaPTuuwguSfGXgBevXpSJZRyYXb+7ghlBrNdpw?=
 =?us-ascii?Q?kQrBcgpgWOXbF1KjBRUDgN2c7XORU+lP6lKLz6OFyQJvl3iCQ3GhI/RBiSE7?=
 =?us-ascii?Q?Y3ilLjwnq0ro11gES/XrA9rkhmylxDjtRZa9g/EMzt9HVGKiIRlFDLgGNEb8?=
 =?us-ascii?Q?6LVNvOy1oM5Tuj84S0jW8B0GrnGr609R9YQGcObBxV+M8vezGvRTuW0Y2UMD?=
 =?us-ascii?Q?HZTO+5gvmjWzuKGIILAaYRgq97V/Y+/lRTixHjgZfBabDFkkahT6bTwmPIvb?=
 =?us-ascii?Q?9lLjnjJjLjGnC5YtHUPR6eXKSRI4Cqc29lkXTjiI/I7cTYoSQa32nRfPI2BP?=
 =?us-ascii?Q?31BFzwfn4pB5/dngtssNoVUAWKlD3l5sT9WjA79URHhbmARmyBFg2+DXUurp?=
 =?us-ascii?Q?vKpRoSplVdSMgPB+c6zMDg4lIk3/x+Kvl7iH3G9BMe70gDPapL1JsSEtCGHB?=
 =?us-ascii?Q?LXfkmT6S9RV3xXI/hYlLDMo0KumuBwtPhqYF5ISViQ+wb/HxuYXWrovU6wXD?=
 =?us-ascii?Q?j16BAaCzs9n/OSCreUaSghk7O0fvo7OI+F3G39kKnqoii9N8jo7P6jgiNUGg?=
 =?us-ascii?Q?x52le7CMTXZSe2N/8HOI/vQTPSaBCmp5jDcxOrhYVAyao+AO8x3+XTaUGVsn?=
 =?us-ascii?Q?ZR0yrjVgvyykrTxQFe32SKgUoih45NDySmqAOXFBYtIWow++zMRP/XTf6BVN?=
 =?us-ascii?Q?zCM7HqbjE10DV6R3LbxM3FhN47AKco/r9b+MaG49EJPdVOqNw96JVa09pbjA?=
 =?us-ascii?Q?R3NXTC7jcV5OlTzdEEBBVHvVUn6E6uFKAPvp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ceMtSqZkdJ8f5qOlRCdlvQLhP4L8Hjoc4SkNRzPxV6aBdup/keHj0A2/I7JC?=
 =?us-ascii?Q?LrKIrCNzKmesUm5vLll+jpCsqM7Kcc6nTmvfB/WYscgE7RcN+beNXp5E0Pkb?=
 =?us-ascii?Q?xG1HtGsxBsqRRlaTTsRAP5LbVSgoXnIkG8vdlUS8Z8CvaAJORSAiyae7+BTc?=
 =?us-ascii?Q?eThuuRPck4ETWU4y/7lXc3+LjZVPQ586/rGzN9KaUU2yZqm+JXmaBnni/P8U?=
 =?us-ascii?Q?stzUVTkmxuuoDJfsLmb58DTazfytHss2JxIUYBroEznumaoKPxylBzZrJe1C?=
 =?us-ascii?Q?BM4geQBMq4v7NyqitBGUgQNmwrJjhaJ0IUaegw+bVp8BkdIK7u/9WOsgYzZQ?=
 =?us-ascii?Q?9Fjpfyc6CF1XhOBEKg9Bd7C2KEGeknMG5cre9r3GHjXKI6c281lPGkteFuHC?=
 =?us-ascii?Q?v/piMqbARUR+OoyNSYit6+XnUfstfU32IE2qNl8WjFZrYH3aWZJhtf6pMPZt?=
 =?us-ascii?Q?TA1wU9jKKudcWBBenVyhiqdNrqllRxPQhYjtzKNl99xXwYpYG1FiMG+5r6T6?=
 =?us-ascii?Q?uz3m49R9PV2prmXOSC2sGsYJMISeQ5sPPCsg605fxVU1QWStE0ul3UF0nGAV?=
 =?us-ascii?Q?i75jHxwB+fLJy2FuEC5R/UyFlAtEgEe3qCZ/HcHu3a81e3iXtT+D6TEItF+o?=
 =?us-ascii?Q?7+dpI3ZbE72FCF017lmDGbLsNrsZO+WvR5tP283fR7oysVy4rZFODyyiKlqh?=
 =?us-ascii?Q?Fd449f9IgthoWGvGvXkaKhn30UzsSA7XfzfM8ShP40o68CexLIsQHLOnAMQ4?=
 =?us-ascii?Q?lglwyT9HuI3/6c23gjCDvxkt3PwUTVL1zMLV3v4vVnr7zLhDExMh98yTmmby?=
 =?us-ascii?Q?zUsfA5KtOz5WTsvZxwuO62FkUbU+uO5MDKr8KNCF1K6Z77kTrztFi/j2RRIm?=
 =?us-ascii?Q?VhLS7mA8Ed9UGjkl3nLotXm9OOsNdw0YJY0UjSUBNhUYVJ7VrJjYilG5pXYv?=
 =?us-ascii?Q?VBGjNkBPf6CiMfsDOj/ANstbTS5v9VsmhpVcgY2YMbbKCrUYTMQAO05etEUQ?=
 =?us-ascii?Q?BeT4HrRRaLwc6HN4il1GWYxUFLw5dlz6ev8ISbdelQ6fZfN0iGlE/wtffy73?=
 =?us-ascii?Q?/N7N1UpIkNjIM9kvYwe2ttwi2qMtpx+/alzg5mWht5ykhvlzesIyoNO6/j5+?=
 =?us-ascii?Q?3XIsjFauDTi6CZIKA35UsVLrgWzNswNOVTVw84uoSNWRmRDxDeD7ig3PAbaq?=
 =?us-ascii?Q?VFvqS+Y1evsoKi05qbxH8MesttJ7EO4ArIY+f+ccvp9zL8ZVGMYlQjSNmwwW?=
 =?us-ascii?Q?MwnKklwPia9uRyG3Xa6V2us8F6hJbbzLRDmVWj+MzARNn7i46r5msDA61zq+?=
 =?us-ascii?Q?Uw3fZTiNhDTKxxechilxy7TdTq+Ek0XJY3KcgPbJaCE3xkpO/CpvFNcdi6S6?=
 =?us-ascii?Q?vp+9iN7RBsBhTVEoS8EXRx4mSVoaRYmxsnjfVyuxW7DaChGocG3u2p4h5M90?=
 =?us-ascii?Q?Kzl8hvmsgMZL6MC0Q1WzpUCGFcoEYXEc0w3B6qTPDVDO66qYORjXd18IbEQg?=
 =?us-ascii?Q?ra5WXXUqhF4Cjxi0iIznuBLNCOi5sLG7oi/l4a97GkJ3t2J1MECMCTe7VFE/?=
 =?us-ascii?Q?PAbVNJmJ5zkxW5lZTIKf0zIqFtJ2Zk9d/Bo93XBf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff629b7-3cba-42f9-3eb4-08de32cb2aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 00:22:10.9301 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+kAODIVrh4x4gIh7Hf7BgbQw96erltsPTyryWE9HexAZHWMsTUAt9fPeZvkZlTWzNSuVBwnFdzEy2oX2GwZUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7068
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

On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > Use page reclaim list as indicator if page reclaim action is desired
> > and pass it to tlb inval fence to handle.
> >
> > Job will need to maintain its own embedded copy to ensure lifetime of
> > PRL exist until job has run.
> >
> > v2:
> >  - Use xe variant of WARN_ON (Michal)
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
> >  3 files changed, 36 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 347b111dc097..833d6762dd8d 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, struc=
t xe_vma_ops *vops)
> >  			goto kill_vm_tile1;
> >  		}
> >  		update.ijob =3D ijob;
> > +		if (pt_update_ops->prl.num_entries !=3D XE_PAGE_RECLAIM_INVALID_LIST=
) {
> > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > +			/* Release ref from alloc, job will now handle it */
> > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +			pt_update_ops->prl.entries =3D NULL;
> > +		}
>=20
> Do we not need to do this on the media-GT? Or is issuing PRL a single GuC=
 sufficient?
>=20
> Everything else looks good.
>=20

It should be sufficient per tile. KMD will request GuC FW per tile and afte=
rwards GuC FW will
issue Page Reclamation to all the primary XeTLBs, for GT and media within t=
he tile.

However, I realize that this means we should be disabling PPC flush for med=
ia TLB invalidation
otherwise, it will conflict and do a PPC flush anyway. Will have to rework =
some of the logic
to handle this if so... Taking another look at this.

Brian

> Matt
>=20
> >
> >  		if (tile->media_gt) {
> >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index dbd3171fff12..2185f42b9644 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -7,7 +7,9 @@
> >  #include "xe_dep_job_types.h"
> >  #include "xe_dep_scheduler.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt_printk.h"
> >  #include "xe_gt_types.h"
> > +#include "xe_page_reclaim.h"
> >  #include "xe_tlb_inval.h"
> >  #include "xe_tlb_inval_job.h"
> >  #include "xe_migrate.h"
> > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, st=
ruct xe_tlb_inval *tlb_inval,
> >  	job->start =3D start;
> >  	job->end =3D end;
> >  	job->fence_armed =3D false;
> > +	xe_page_reclaim_list_init(&job->prl);
> >  	job->dep.ops =3D &dep_job_ops;
> >  	job->type =3D type;
> >  	kref_init(&job->refcount);
> > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, s=
truct xe_tlb_inval *tlb_inval,
> >  	return ERR_PTR(err);
> >  }
> >
> > +/**
> > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > + * @job: TLB invalidation job that may trigger reclamation
> > + * @prl: Page reclaim list populated during unbind
> > + *
> > + * Copies @prl into the job and takes an extra reference to the entry
> > +page so
> > + * ownership can transfer to the TLB fence when the job is pushed.
> > + */
> > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > +				       struct xe_page_reclaim_list *prl) {
> > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > +
> > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > +	job->prl =3D *prl;
> > +	/* Pair with put after bo creation */
> > +	xe_page_reclaim_entries_get(job->prl.entries);
> > +}
> > +
> >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> >  	struct xe_tlb_inval_job *job =3D container_of(ref, typeof(*job), @@
> > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref=
)
> >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> >  	struct xe_vm *vm =3D job->vm;
> >
> > +	/* BO creation retains a copy (if used), so no longer needed */
> > +	if (job->prl.entries)
> > +		xe_page_reclaim_entries_put(job->prl.entries);
> > +
> >  	if (!job->fence_armed)
> >  		kfree(ifence);
> >  	else
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > index 4d6df1a6c6ca..03d6e21cd611 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > @@ -12,6 +12,7 @@ struct dma_fence;
> >  struct xe_dep_scheduler;
> >  struct xe_exec_queue;
> >  struct xe_migrate;
> > +struct xe_page_reclaim_list;
> >  struct xe_tlb_inval;
> >  struct xe_tlb_inval_job;
> >  struct xe_vm;
> > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, stru=
ct xe_tlb_inval *tlb_inval,
> >  			struct xe_dep_scheduler *dep_scheduler,
> >  			struct xe_vm *vm, u64 start, u64 end, int type);
> >
> > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > +				       struct xe_page_reclaim_list *prl);
> > +
> >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> >
> >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> > --
> > 2.52.0
> >
