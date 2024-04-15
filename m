Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA619C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 20:26:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03251127CE;
	Mon, 15 Apr 2024 20:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ToN37xrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F98A1127CE
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Apr 2024 20:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713212802; x=1744748802;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YfuYdZ0CpQIDk7x4iI8PVldlEYpvil85oysZBtmLlso=;
 b=ToN37xrHzlabxT1NpOHcAdOksIjfvgEJ+f7ilOTUs2hoBSBVUBY5DuCb
 z4xKj0yRgWdps1bsl3pWQxQtBeceIhVY5ci+JZQYEhB3WwMoRcdd6wml2
 Sk6Ht+KRdLD1xz6N59Sa2X2KFf87/+TKdH06QBx920AwlLFn4/+ACvtmA
 RufLiJjwSet4lrdOagdQTzKfXsj0jblxUYZNe1HT59yg4vcv8fZ4jMAuP
 OSIGbCp23kVM9a8Ff3yC/AIiEHzPx36gln69moWzz9ZOHsxKqG5qeHZBh
 9PROwaLeKdQrcr3KS9U8r6usbf1qPKZ2zzk7K6gF1+tieN04aejLSXJB2 A==;
X-CSE-ConnectionGUID: I1upRKcHRSyge+MTzy06Tw==
X-CSE-MsgGUID: BFG7OzDLSgWYddTmqrkXZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8745730"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; 
   d="scan'208";a="8745730"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 13:26:42 -0700
X-CSE-ConnectionGUID: SGivNnvhRUu38IHj7iZg3g==
X-CSE-MsgGUID: V0WO7ZJSQv6lD5k6+osmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="22613709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Apr 2024 13:26:41 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 15 Apr 2024 13:26:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 15 Apr 2024 13:26:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 15 Apr 2024 13:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INIK3YKwgIgTdzDNmSzufdVBraHMl20ad4Wac4jl9tEgAdq8Aki0QU7QsbXa9tODlnQT4+hAYqxIMGpIY1GFT/xYLvkN0x19T7vp6YZQbgF6AStB50h9qcayFCDqeJ1YW91KvUkDQrFnM+1TUDD2JdE+GG+rr3z+yPJAe0kk11xYEle8oS2gUPJGkA1uAUnAK1/xAfBhVycfQ+o00D49ebkfuay4apWmlVQPxNTO00D+VBiXu5x+/Qn2QgNOR+bjVtvhQfd6LdoGIaTp6SU4dlSGTeyeaU4580+U8PEJV1aAtiDVMCmBimRNUhIylL2bQEOTTBOFAPVK8N6K94FtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfuYdZ0CpQIDk7x4iI8PVldlEYpvil85oysZBtmLlso=;
 b=W3T+qNKl2k9V5+U1YO2gKOWcXpRfIlwil8g8aeHjlerqsvCBw7bJnKhrSdryrHV3fCt18DZqSgnstJl1lAnU/dcPzWpMMjzyk/JBovPqxD+qBeybyoFkTX3v6xBhaGQF4qAFDBmMQUYWKeU8vse+4yQYlvnSvcd6iztOKZp9CSwuxD7cdohVLgEBpKHqVzsKALV9HSvEnl1xyIvIMXdHxNmIkRCX0Nl/uCVqhjgc3KqAmf8V0QHSS+4DqBGenrrasY9TIRoJYvf76HfLL/I6Qb4lraxAW29xQ3HMGP5CdaaY7CHh2jwyeULiBZrkrlWochFNK6F691EzHm29vY0uQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Mon, 15 Apr
 2024 20:26:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7472.027; Mon, 15 Apr 2024
 20:26:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Gupta, saurabhg"
 <saurabhg.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Topic: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function
 definitions
Thread-Index: AQHaj2dxZPppdwTCZUelWMQC388cILFpuDsAgAADl4CAAAt+oA==
Date: Mon, 15 Apr 2024 20:26:38 +0000
Message-ID: <CH0PR11MB5444382EEBFD7D79F6CB7763E5092@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240415184608.2918959-1-jonathan.cavitt@intel.com>
 <dde80e98a80b9fcfbd46c9dab4ef9bc27bc108f1.camel@intel.com>
 <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zh2Dlx9hhQTTcuD9@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW3PR11MB4585:EE_
x-ms-office365-filtering-correlation-id: c44fefea-a553-4bae-7d8a-08dc5d8a5a42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c+diXgPj0r8GRkuoqJcOz9odRuNRPqydkHkOxNI+D50T981K86ckTXzvWmGKIITW+PWzuF63jCcpChMFhM8UsM+CPLX8Gp3xOMCBC/MqqoF9vodyIvZA5hslvnzQZFfqqR4Tz632DH6DoYY+RLKfDN++U4ZzVLwj+uH72hmU0D23mqbuoA47swfT0HxHsaibsd8psRzcF3NF7pGAEfUFe/fshfU3P8UsYeHac/+aq1HkayCzu0cxJO9hkI9ANpQktNfEIuvV3PwkxU7Sgjnsjd6Qf+aWyjj1ZPWM582GDWFFDs8LZJHDmp7xEWi3w0eNpKPJctFljo9cTCv2m5XQIM4HvoRE9bVvqsIv47dH+ihz0h/i0N3fXlbamJ/roDvq12GeoQ4792UqhpYyErHIhFvrISxbxnJTn0dod72HL1A2Y9foh3Cp6QI65yjE/vK9xmQmv73g4Y/VzSe4T6Ejrrs79XGQjHEab9N6hppGkcJgtXgIqzfYV96yhq9lKQt+w59FYRIkIVcq24Ab8VROkAiqYu5w4p48SHmC6PQRVneW8nuDqBz5UjTCk9u06Ov8E/ImXHDdTfa4AdCs66uUezqT8pCsddiwooqYzMJqhvrFOr+Icb7dPFgPnirqo0wJR3LMhN5w/WziDvBxtXUVrG1+/4aOn7gh8hxCmCP+tAyadPsTSOE6/Mrp63jGsH/i2xMCyoFtpt86EGm8x4kUslU25FfW5GrqNgx75jPZGhY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?PhX+5n3SGMaXKnmtCk92zj0Tf4EHPYmhiRTqQyp/XDIIdIHdl4lX0JA0Ut?=
 =?iso-8859-1?Q?4qYiIDtXcQ6L3zxcqIj5R5hnX2WY8AFUvTDFgofLnUhofhxI6SgdOtOLvs?=
 =?iso-8859-1?Q?4M5BfFA7bdvGdzlkk4nPC3k1Eb6Par8gOUR1LzWj4jepmqYAdp/Us1876B?=
 =?iso-8859-1?Q?dCiw4x1bbWNorH6iXS8dnxA7oYY8zWuVp4ModGPYfjMjSBBk9ZkdhX12zs?=
 =?iso-8859-1?Q?pqZkXllDfMOm3l46v9CyfWYMOwji38QHvEHKZuH1U0QkQzRiUi4EtU+WEP?=
 =?iso-8859-1?Q?n+vfIkjKrrae+RJRPjaiyUWWqgz66c45l6zaUwqz0Zl8W3ywKDPKo1jA08?=
 =?iso-8859-1?Q?yvNSfsbs1qmv49xpZO6u7JyEhlJ1TELWDfTb0YsfeIm3vOkd1GI7tMkP3S?=
 =?iso-8859-1?Q?2kbTNItfGHL/m3r47l0IB8qzfHAttGh3CFSggedbF1QVQjqXPHuRoM2xMU?=
 =?iso-8859-1?Q?DTWffbnvEhQdXM+/zQHUoYT8QkrXE68jZ+d895pE4t47mUUYFS53ka4v1D?=
 =?iso-8859-1?Q?1hhFH18FhtElElZ6woT04orfDEHW2ZH3MQW1F9DmDAIlVei8cng38CzfsV?=
 =?iso-8859-1?Q?1Rkjn9ZZJNCNKA5boMkQ5kU0txNiaMRGQNYCfGwvMdf/YYvy6fYBKmQGxt?=
 =?iso-8859-1?Q?rBBlbG0cZlzf8Fn0R3o64Wc/vib3BjKYRTdac+VDXfimzZN1Ciz0HdlCEf?=
 =?iso-8859-1?Q?P5nHknKYzu3h7JglELqhkrvO3wOe8MquTmqt99zpOZ8d+YOfCTIGNXVfmI?=
 =?iso-8859-1?Q?M4SZjzSk8bzIs1rBKqkOZPDmkQ8k77HRef8UdpPWiuwnk2c/bc782dCNyq?=
 =?iso-8859-1?Q?uOFBVAYaO+u99vjwjBynpfFEFMu01G5DcwAxuhzpXLYJQuh4DORzGe0wYk?=
 =?iso-8859-1?Q?EXwA70fBF3kDs4oHH0SOm8JPfQKBznQ1p5c4crqE8TwNlQk8OGPXjFAcTJ?=
 =?iso-8859-1?Q?YoT6rYzhf2BfrRkcl0/Twz9SOK712ylDufQox6Vl1/rf9uCYwsCjpvPGby?=
 =?iso-8859-1?Q?yIW8I7gwb7QSKFjsWl8FRaQcvolLw8K5uBzhm6zOo48N1Y5FtukIDrVzsG?=
 =?iso-8859-1?Q?G9nf3SfnDc6lCyyS+PRlgbLkE0aDch6jpkGvH4x5LNB8YaoWFfR2Yza1ba?=
 =?iso-8859-1?Q?kNlujubhuAGqUYGdJaP054BalhU5RmSR70XEa/erudG+TDv7afmlRkO6Ss?=
 =?iso-8859-1?Q?8S5sobB8+X8Uo2CqW1zKqJMq8jFlJFii97QxzgVau9oEMxIMTW4beiP/za?=
 =?iso-8859-1?Q?LZkDR/DypdOeHG9/QGj2BzzNqDSHnO/IVKcqn7xYbZsxzZJGv/yjFKnmPd?=
 =?iso-8859-1?Q?zBV3AIJo9tgQdg5rca5BPGq4DNPRvyJjMPQ4mqzXndvf++iwNKyh7ho5Vd?=
 =?iso-8859-1?Q?uTQadyZEE643LYvzK4BpYJNNcPzxMpBkfFoStSwm2Cx3tapbESIiae2nT2?=
 =?iso-8859-1?Q?MRE9yNxPVObm467ZXVUso/X4hgGRaGtgQ9L+xK90628+yFUqcxap1TC3LB?=
 =?iso-8859-1?Q?whid+PU5n7QTdme5z8E4uA7llR9a6nXM0UmklFIoWw6Mwg0vpyfAcBpE7n?=
 =?iso-8859-1?Q?ZC/8XOUGYK2hTEQ8AOXWGjs0s8hnb2zlV2MA8Ko7y+mFJdfhPIYzqI0iFR?=
 =?iso-8859-1?Q?oAGuuHX4l7zkM7dWVtDYwUgouRPQQyNe+S?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44fefea-a553-4bae-7d8a-08dc5d8a5a42
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2024 20:26:38.0567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MLDTcndl2Y667gPYLt+/VkzYneXvd/QLM4m41452i31L9WZ6Ikm5LvKT2XVau03NyqlcKRAzKbbc/N588x56tXzDdVepSG9Mu9xvTU1e/IY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
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
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Monday, April 15, 2024 12:44 PM
To: Summers, Stuart <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org; Cavitt, Jonathan <jonathan.cavitt@intel=
.com>; Harrison, John C <john.c.harrison@intel.com>; Vishwanathapura, Niran=
jana <niranjana.vishwanathapura@intel.com>; Gupta, saurabhg <saurabhg.gupta=
@intel.com>; Roper, Matthew D <matthew.d.roper@intel.com>; Welty, Brian <br=
ian.welty@intel.com>
Subject: Re: [PATCH v5 1/4] drm/xe/lrc: Add xe lrc ring tail function defin=
itions
>=20
> On Mon, Apr 15, 2024 at 01:31:32PM -0600, Summers, Stuart wrote:
> > On Mon, 2024-04-15 at 11:46 -0700, Jonathan Cavitt wrote:
> > > Add defintions for the functions xe_lrc_set_ring_tail and
> > > xe_lrc_ring_tail to match the definitions for xe_lrc_set_ring_head
> > > and
> > > xe_lrc_ring_head, respectively, except tarting the lrc tail.
> > >=20
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > CC: Brian Welty <brian.welty@intel.com>
> > > CC: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > > =A0drivers/gpu/drm/xe/xe_lrc.c | 10 ++++++++++
> > > =A0drivers/gpu/drm/xe/xe_lrc.h |=A0 2 ++
> > > =A02 files changed, 12 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c
> > > index 615bbc372ac62..e91ecbcceba5c 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -834,6 +834,16 @@ void xe_lrc_finish(struct xe_lrc *lrc)
> > > =A0=A0=A0=A0=A0=A0=A0=A0xe_bo_put(lrc->bo);
> > > =A0}
> > > =A0
> > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0xe_lrc_write_ctx_reg(lrc, CTX_RING_TAIL, tail);
> > > +}
> > > +
> > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc)
> > > +{
> > > +=A0=A0=A0=A0=A0=A0=A0return xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL) =
& TAIL_ADDR;
> > > +}
> > > +
> > > =A0void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head)
> > > =A0{
> >=20
> > I see lower in xe_lrc.c we're doing this (xe_lrc_snapshot_capture):
> > snapshot->tail.memory =3D xe_lrc_read_ctx_reg(lrc, CTX_RING_TAIL);
> >=20
> > Should we change this call to use the new wrapper also?
> >=20
>=20
> Yea. Also xe_guc_submit.c sets the LRC tail. It should be updated to use
> the helper too.

Please list all of the places where you would like me to use xe_lrc_set_rin=
g_tail
and xe_lrc_ring_tail, and I will have those ready for the next revision.
-Jonathan Cavitt

>=20
> Matt
>=20
> > Thanks,
> > Stuart
> >=20
> > > =A0=A0=A0=A0=A0=A0=A0=A0xe_lrc_write_ctx_reg(lrc, CTX_RING_HEAD, head=
);
> > > diff --git a/drivers/gpu/drm/xe/xe_lrc.h
> > > b/drivers/gpu/drm/xe/xe_lrc.h
> > > index d32fa31faa2cf..f355b0eeb5658 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.h
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.h
> > > @@ -24,6 +24,8 @@ void xe_lrc_finish(struct xe_lrc *lrc);
> > > =A0size_t xe_lrc_size(struct xe_device *xe, enum xe_engine_class
> > > class);
> > > =A0u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
> > > =A0
> > > +void xe_lrc_set_ring_tail(struct xe_lrc *lrc, u32 tail);
> > > +u32 xe_lrc_ring_tail(struct xe_lrc *lrc);
> > > =A0void xe_lrc_set_ring_head(struct xe_lrc *lrc, u32 head);
> > > =A0u32 xe_lrc_ring_head(struct xe_lrc *lrc);
> > > =A0u32 xe_lrc_ring_space(struct xe_lrc *lrc);
> >=20
>=20
