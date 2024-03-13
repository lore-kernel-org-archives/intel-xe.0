Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE75C54E58
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 02:16:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FBF10F3F7;
	Wed, 13 Mar 2024 02:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsFq7umu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC5B10F3F7
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Mar 2024 02:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710296193; x=1741832193;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=elkBu3Qlj8zCeCu1f3Jkb/l0E88i7xIKxoWFTu/MRW4=;
 b=CsFq7umuE3kSF8ftoi0VMEa7FXfMtFunQl77mCLhJgS5s6vmPmLH55pn
 QVdv/NkepCb17QoVD9xjDa+wO3L36Z5CannGKIfv7iGkDV4wXNl32pZiA
 jVzWhCFvCtvV5EI5yXoWBCQ5siY+1KMEgX9vSd7YA5yMhSjZlltUHz7pT
 9pios79cliOvDGJd3ing05kllojXWFVg9n2qlHyggA8Hcvaa9Bec51ZF3
 zGahM/2v81Eqw/Opsd/snluECtbAZhbdwuza/ZBMp+h4kOqDOs/ZJn5u5
 KOEx/ZWcuanEGLVY8CUd1ygMFBqbM1TGBq/b5Un7xhAcfXF3eCuJFcqwj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5172621"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5172621"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 19:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="16341820"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 19:16:27 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 19:16:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 19:16:27 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 19:16:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/BNOnhpjy/OaOWML74ZdsbuBJ/ykX63l8iOvAPMJdvYBUGhN0vplekDabRCbE29m9U2xCF41B3cNPZEFK1+oe387aRZG1Kl0w3jobzo0dfXcIKuMVnHEeIS1Z2tjZoP28g5hXS1WcNPBew5IkRAn36sP368HiWPnMB3kyGbtl8XriKzhQoQ33Nge2urW48y4W6G64jlPf1GBnn5Tr1BCan2uCpqzFFrYymi83NQfrqDh6oshzcIN6r6TkfO1rZintLuemB/g7kMjMhkY2FY4XvrViKJbl5d3DfKBSrMmX0itTglHxPq3TdhRWqn6U73bo8sQKbJBWe0npbjFpYhDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elkBu3Qlj8zCeCu1f3Jkb/l0E88i7xIKxoWFTu/MRW4=;
 b=bCLDy5nU7SiHh/IlEWo/eFWMyGVjVDQWbm+o603GD0bz197xSHHQK8DDIcFvieN9tlNzNtSJWKXTlP+KEkrwV5FSTn7WwJoMrISLsm6N7U92f5YID8jQ03823C8caDn34HKMLv8/089HFt90YAaNDycUg2Yc1M3qfUBnLv0z/UAERIe9JG4OhHfxEjEYHItVfnt8sF3RUVhrHPuGOyoR1lYvgJRINyqe4Sq1oL+7gFcUQ/EeiDM2EonbXEgnPIhCZkVoXFMl+hSbIQulh1cEBbpgCS0PtvjHNubVt0D210/IMb15vabJ1eBqPJdcxp4cYMoh5l3qaf3cglQ8lsVPUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7796.namprd11.prod.outlook.com (2603:10b6:610:121::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.17; Wed, 13 Mar
 2024 02:16:24 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Wed, 13 Mar 2024
 02:16:24 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: Separating xe_vma- and page-table state
Thread-Topic: Separating xe_vma- and page-table state
Thread-Index: AQHadFDywx5K1cRH40+OxAMGoL7g0rE0pF2ggAA+GgCAAAmNEA==
Date: Wed, 13 Mar 2024 02:16:24 +0000
Message-ID: <SA1PR11MB69912840ED414B40B6F3A829922A2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <72ea6bc36260bcc2eaeb97d1abcb8bebf69f3f53.camel@linux.intel.com>
 <SA1PR11MB699139B15B97B2B056312F41922B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfEA5ieJ+M9rttI3@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7796:EE_
x-ms-office365-filtering-correlation-id: 4a0a1014-5292-4ab4-da7c-08dc43039507
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5EsN+zUxtOhRa3jpa4agmVG62O7dyUUB2xhqwDj58N1O5bXtfDwEWC/pEr+O2rFUW9mVJVaVSobeY1ldTe+dcq0TtKqgsfMW5lrKOggMr4mDUnydVRLqSEOFoBVYNnvtuLhVjLcU8rINmaY2uauOJpYZj8jNz+bvybob0wThviufJ3wN7ra5GcTpb3iPw9gvVa2uXMBjV/Kj/50O8yXr1wbAnqZyKFXJC57fSGw4JoTPE+WHbVx7m8GglNvHYc6qaPJIlLVEYO67kUGSfZgbrDXM3YDDOb+EGdfmMMxxtVIq+UFmNgIaQEC8HyaXGLl0pSfcm6NblLaW6eLTLyqatXlu4dvPEdMcOkDk+zgZIa7eavNOPR8qmiy2hhN5cCuVhoSvaEdJsKLjkXSS7eFgiI3nDwJjP1YPc7EXDPCzJjEIAjKg3tQd1JzNjFPYWjnKKO2CGvtWABb3Curii7osMMD1b8GZCAyDaAQnQwVeQIup9JpAPUfS+uaYmhzPS5yIMCJEvmB4nSYTdKOs3xPn0n2o1A64G8u2GNEQVIgaZIxIHRh9t+G2iH9dBgjb6T41BcJSAGSiAxIe2egFsd+oer1wxxNBkRoECrwByS7j91EvpwDZJXC40/t48cr0Xgkwdls5g8S5lxPoGbXoFhIL2m2Bge3NLU32DUCXULJDuOQ5Y4k/VQ4PaETSgVfug+9l
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ClHtFwgMLuIjwksNJNToEcyG7NKUS2PQoppsJOqccKFM0zBoSCnVdUOX6V?=
 =?iso-8859-1?Q?GPtJonKy3N3jOIO9fVYbDG3FiQzscE3x2vmuci8IkQn1KkWjo/RW3Nq4Mm?=
 =?iso-8859-1?Q?Pnmh3IsDrzD5vmoh/VjCLJl29gutq8C04gEswlXaWlt17ZBEVXgOmLQ5DT?=
 =?iso-8859-1?Q?Cy1mP1sbE/A0A2AhhVbWm/HlrUYUdvgcd0GN1zOcyLAOb90ReTl5tCQEN2?=
 =?iso-8859-1?Q?R+4zoTd3vB00C7shutWb5CDZpSTwYzgewxelJQgMQxbmhaSZtD2tUIknxo?=
 =?iso-8859-1?Q?fhJnFPLP3bB2/49Mwx+jUNfHIUxCE4MuUq9IGyAzdcjZYkdWgVIFegK56/?=
 =?iso-8859-1?Q?ZqLL/C9o6VEepDdFbXkUwIf2kUqwI+dWpwjP4+VKXHi2lOdYzmniBhFLzK?=
 =?iso-8859-1?Q?3FIfyweqhBN77KN6jpi0XVJVvpquxkWo2CvmLB+PtR4OFdQlZZT7LzBYOQ?=
 =?iso-8859-1?Q?Etkc8jBO8O8Hmos99WbX9smbdsiUTQyp4hsnvOnxp3HbooVkdhscLGk43g?=
 =?iso-8859-1?Q?dX3/K6DfURuTkxRJnUpEbT9m6odFt1xoH5+3KgvUs+mGEge3TkNElTfXxl?=
 =?iso-8859-1?Q?Y81AGfhlA+xZdgFqaGENYKx7+BsFVgOv5Y0KIYNYyAiF+o8fHEqrvX9H3K?=
 =?iso-8859-1?Q?h24FpEF9ryr3BzcQGzoUf9CpmvTpqJ+Ip5+JKqEP8WzReqPfd5Cctn9Rwv?=
 =?iso-8859-1?Q?cC6SwfBj+L0HRn3qGVEw1nNytY1A3MJzRWu0qn73CuDfXSxUYXFSAykRDQ?=
 =?iso-8859-1?Q?zsdx2RbvOMidJU/MyoSt6eCHOk6REDTC2YDREZe3nTLHu+Ob6ytRb1Bn2R?=
 =?iso-8859-1?Q?OK4v1Ud/mHig4BtYpy7e6rP45/StOgdwLPdO2hrftZ2qaKoG8YxNDjxgyx?=
 =?iso-8859-1?Q?AbM0tX6wu6J5Y7YXvrbWC9xlBDxhNsL802OZfHCsDxz524s3375R2P+e25?=
 =?iso-8859-1?Q?uR8ysxWrI4YPIdFj5UkFNPu2bJxzcNTquQKVw/kPU57YXVu8AlXlSi6yev?=
 =?iso-8859-1?Q?2TwCtn1JkhzXhUT3RQSzgefIH97pD18bfsLhmnUYFNlV4bACUNEEf1kYZF?=
 =?iso-8859-1?Q?wVkbvrDT0LnrgW7ai6a3KygAWklJtuAP7vZiSYY0cq1DK2VUeIw5kdQdF4?=
 =?iso-8859-1?Q?JE58vTCOpZd6ep8EuxXwNKqWSCOKO0JIdnVu5XS8dQIrO8E1zT1ewvVJ7u?=
 =?iso-8859-1?Q?L0lbJepU+4+QJlk1dFfrBWEFW85m+tM31ZRmXOFPbPYg27bHrnPvIZk0wF?=
 =?iso-8859-1?Q?jYTiV47biGGnLC5fSAVpGntv0QR2ElYqUX2TepgLyuWV38Tj+qWdn3CSi4?=
 =?iso-8859-1?Q?CJkgBtR/TaVRjtzGsQAX6u1yLzoHbV3TJeBwjlZoai7SB/xiqEfgXY2GR/?=
 =?iso-8859-1?Q?kwe0sdHciZtQZUTC7UckL9npFCCWznSMPGUxXnnaaAFiMko3IHetTuzPut?=
 =?iso-8859-1?Q?mPESH3ifMo5tqDSY3cJayEZtWiN+gaBc3YtjJYHl+mWmyCpqjSZHpL2fMk?=
 =?iso-8859-1?Q?domlAmuhN+sHmwPFPQz7uIoLVC17hlFJGX0Fv8iYDQDn9wEeSPdbzVj3DX?=
 =?iso-8859-1?Q?GLpgCoIkRWg/hfat1v+Ox+AlMh9Jj68nDKU3z8cjDbgAbMQSx4zX1l0RTI?=
 =?iso-8859-1?Q?iwmuG1K3jou8I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a0a1014-5292-4ab4-da7c-08dc43039507
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 02:16:24.3793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dDaKmw/NmDJzEBG4n+yS5PcU8rwEywODin82ynk/2uHpnDa0r2zSSr4eT2WSIqHc/f8RZhb0rL7KI5aIthtccw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7796
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Tuesday, March 12, 2024 9:27 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: Separating xe_vma- and page-table state
>=20
> On Tue, Mar 12, 2024 at 05:02:20PM -0600, Zeng, Oak wrote:
> > Hi Thomas,
>=20
> Going to reply to both Thomas and Oak to not split this thread.
>=20
> >
> > > -----Original Message-----
> > > From: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > > Sent: Tuesday, March 12, 2024 3:43 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Subject: Separating xe_vma- and page-table state
> > >
> > > Hi,
> > >
> > > It's IMO become apparent both in the system allocator discussion and =
in
> > > the patch that enables the presence of invalid vmas
> > > that we need to be
> > > better at separating xe_vma and page-table state, so that xe_vma stat=
e
> > > would contain things that are mostly immutable and that the user
> > > requested: PAT index, memory attributes, requested tile presence etc,
> > > whereas the page-table state would contain mutable state like actual
> > > tile presence, invalidaton state and MMU notifier.
>=20
> Thomas:
>=20
> 100% agree with the idea. There are 2 distict parts of xe_vma - what I
> call GPUVM state and PT state. In addition, there is what I call IOCTL
> state (sync objs, etc...) that is updated in various places in xe_vm.c.
>=20
> Functions to update these respective states should be clearly seperated.
> In the current implementaion is a complete mess in this regard, you
> mention xe_vm_unbind_vma below, in its current state there is no way
> this function could be easily be reused.
>=20
> My series [1] vastly improves this seperation. It still could be split a
> bit better though. In my next rebase I can look at this series through
> the lens of clearly maintaining seperation + likely update [2] to do an
> unbind rather than a invalidation.
>=20
> [1] https://patchwork.freedesktop.org/series/125608/
> [2] https://patchwork.freedesktop.org/series/130935/
>=20
> >
> > It is a valid reasoning to me... if we want to do what community want u=
s to do
> with system allocator,
> > And if we want to meet our umd's requirement of "free w/o vm_unbind", y=
es,
> we need this "invalid" vma concept.
> >
> > The strange thing is, it seems Matt can still achieve the goal without =
introducing
> invalid vma concept... it doesn't look like he has
> > This concept in his patch....
> >
>=20
> Oak:
>=20
> I'm a little confused by what mean by "invalid" vma concept. Does
> that mean no GPU backing or page tables? That is essentially what I call
> system allocator VMA in [3], right?

Thomas also mentioned this "invalid vmas" concept. Here is my understanding=
:

1) from the system allocator discussion: we introduced a gigantic vma which=
 is invalid because address in this gigantic vma are not a valid gpu addres=
s.
When we create a vma in gpu page fault handler, we carve out a vma from gig=
antic vma, this vma is a valid vma.=20

Note there is subtle difference b/t invalid vma and vma without backing or =
page table. A valid vma can be migrated to system memory and at that time i=
t lost its gpu backing or gpu page table but it is still a valid vma.

In the POC code you give, you don't the migration logic, so you don't need =
the note of "invalid vma".

2) from the userptr discussion "free userptr without vm_unbind": in your pa=
tch, when user free userptr without vm_unbind, the code behavior is, you in=
validate that userptr from gpu page table and put it into a repin list. Use=
rptr vma will be repined on the next exec submission. I guess Thomas call s=
uch vma (freed, but not vm_unbind) as "invalid vma"

For me this behavior causes unnecessary complication. I would destroy the u=
serptr vma when user free it. We can create a new userptr vma on next umd v=
m_bind. Is this simpler?

Oak


>=20
> Also based on Thomas say below related to xe_vm_unbind_vma and [2] we
> should be able to have VMA that points to a backing store (either
> userptr or BO) but doesn't have GPU mappings. We do have this for
> faulting VMs before the initial bind of a VMA but we cannot currently
> dynamically change this (we can invalidate page tables but cannot remove
> them without destroying the VMA). We should fix that.
>=20
> [3] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocat=
or/-
> /commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
>=20
> >
> > >
> > > So far we have had no reason to separate the two, but with hmmptr we
> > > would likely end up with multiple page-table regions per xe-vma,
> >
> > Can we still maintain 1 xe-vma : 1 page table region relationship for s=
implicity?
> >
> > This requires vma splitting. i.e., if you have a hmmptr vma cover range=
 [0~100],
> > And fault happens at range [40~60], then we will end up with 3 vmas:
> > [0~40], a dummy hmmptr vma, not mapped gpu
> > [40~60], hmmptr vma mapped to gp
> > [60~100], dummy, not mapped to gpu.
> >
> > Does this work for you? Or do you see a benefit of not splitting vma?
> >
>=20
> Thomas / Oak:
>=20
> Agree for at least the initial implementation a 1 to 1 relationship will
> be easier. Also unsure what the benefit of not splitting VMAs is?
>=20
> That being said, I don't think this is something we need to decide now.
>=20
> >
> >
> > and
> > > with the patch discussed earlier we could've easily reused
> > > xe_vm_unbind_vma() that only touches the mutable page-table state and
> > > does the correct locking.
> > >
> > > The page table could would then typically take a const xe_vma *, and
> > > and xe_pt_state *, or whatever we choose to call it. All xe_vmas exce=
pt
> > > hmmptr ones would have an 1:1 xe_vma <-> xe_pt_state relationship.
>=20
> Thomas:
>=20
> I like the idea of VMAs in the PT code function being marked as const
> and having the xe_pt_state as non const. It makes ownership very clear.
>=20
> Not sure how that will fit into [1] as that series passes around
> a "struct xe_vm_ops" which is a list of "struct xe_vma_op". It does this
> to make "struct xe_vm_ops" a single atomic operation. The VMAs are
> extracted either the GPUVM base operation or "struct xe_vma_op". Maybe
> these can be const? I'll look into that but this might not work out in
> practice.
>=20
> Agree also unsure how 1:N xe_vma <-> xe_pt_state relationship fits in
> hmmptrs. Could you explain your thinking here?
>=20
> > >
> >
> > Matt has POC codes which works for me for system allocator w/o this
> vma/pt_state splitting: https://gitlab.freedesktop.org/mbrost/xe-kernel-d=
river-
> system-allocator/-/commits/system_allocator_poc?ref_type=3Dheads
> >
> > Can you take a look also...
> >
>=20
> Thomas:
>=20
> It might be helpful to look at that branch too, the last 3 patches [3]
> [4] [5] implement a PoC system allocator design built on top of [1],
> using existing userptrs for now, and is based on our discussions in the
> system allocator design doc. Coding is sometimes the easiest way to
> convay ideas and this roughly what I had in mind. Not complete by any
> means and still tons of work to do to make this a working solution.
>=20
> [4] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocat=
or/-
> /commit/3fcc83c9b075364a9d83415ca73a9f9625543d7c
> [5] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocat=
or/-
> /commit/d2371e7c007406fb5e84e6605da238d12caa5c62
> [6] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocat=
or/-
> /commit/91cf8b38428ae9180c92435d3519193d074e837a
>=20
> > When I worked on system allocator HLD, I pictured the invalid vma conce=
pt also.
> But somehow Matt was able to make it working without such concept....
> >
>=20
> Oak:
>=20
> Still unclear on this. Maybe we can chat offline to clear this up.
>=20
> Matt
>=20
> > Oak
> >
> > > Thoughts, comments?
> > >
> > > Thanks,
> > > Thomas
