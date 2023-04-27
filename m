Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2852AC77B61
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 09:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F5C10EAEC;
	Thu, 27 Apr 2023 09:06:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E3110EAEC
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 09:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682586411; x=1714122411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qvimL2hdAgcfzZV2zTo616UUuwkmuIGpygHg42BUoqA=;
 b=Fi+rFukhCFI6OhAEg+KseIUx8E2YhHPuwQ+x01RNrS+FSkyIrDOlLJn1
 gKpfhAw2k4rzcigFVwrgpa0/j/JJN+zPth3K9C5i/rmVp0THC5G6vm0ZO
 TCmULPkllQf0naNgDj0gP4FrGMzDfQkUmMB1huWpoQdKlBqBUjd/q3Q+8
 CBVsqR6Jqi2ozmxFoFwv1XW3zIjEOlUJiP4BuORyYXHHJMRRVD0jpEq+/
 z4makqEYlq5TwPJVzmUTu7EBfG3fvEeP+bMic5OZI12LcODjWTeJPaYgA
 DyzST1waaQuNVjfTsS5QG6y/VHN/xoU00Kkv7O1gTGHuvB+0LYBfN84kB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410408880"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="410408880"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 02:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="818450854"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="818450854"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 27 Apr 2023 02:06:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 27 Apr 2023 02:06:50 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 27 Apr 2023 02:06:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 27 Apr 2023 02:06:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fD+P0fUh8PMtmRHGy2oQJBJAx/hox/hhdHvdyimmCtvvBkfF5NriLYRhJ8+BuklUDRQ0IQ4SdZlvMT3gz5u1PVRIbxt7GFTMGQRdnPP5+Tsa45AWh6J7gPQez2461OFERiiXbV+haSxIRJeKFkN8mx+ryXpBQL7ZCS26nR/AMYO3BJOwYjzVCh7emKfXTlcHqzz7V8zA6I5aoMMIrpzjJaBkz/1LaHrWu4c1nCRd/NPS8tNQbXydz/wsW7lH25A0PHVNtvs8+TQFLG4iSgCjOL0cH5Xaip/OlIWvxTtiPbkBCYLkjNtfSxn1yDHOALPgW8iXgRDnvtSt6S7GvRcODw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEZ64CM1TUZtNgVcXiJUH2BtN3qq+GJntU+Cjr+nd2s=;
 b=QFnDCgzUGF2yXUijII2AzSpF66mZCTnk2m8dLnIS5mfC6R9ihrGti0qgoPYvoeyB5ZZvO/t3SgNLn08hSUIRaJpVZpQIIKa9fWzBCiM9QC8p7owmIB6lQbNwZuC960gUuNZME2e9l7Gr+oDip7+HWEw27O/5Va6wVuWbeUKaoKudLbzYrrJyQAdNg1rclaW5lqZbETvh8YOIR6YSXnbHvVTrWU2kN/Qw9ibAMeNihcMAZ38FLDleew03LyuIXZ5Pm8qlr/LiFfMGcLJuwjwt8v5tgM13Ax7hVyHpGkVZXJQ36kUY6UbwdpYAmPpdUxDRYbRsOzIbm8oRYU2+YNN4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Thu, 27 Apr
 2023 09:06:48 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::3cc2:6622:cce5:cd02%6]) with mapi id 15.20.6340.022; Thu, 27 Apr 2023
 09:06:47 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
Thread-Index: AQHZdDpBONjp46Lv7ECYUujFPu4QSK81yWcAgAAHUrCABJVwAIAAEfKggAGlBACAAsc4IA==
Date: Thu, 27 Apr 2023 09:06:47 +0000
Message-ID: <CY5PR11MB6211A2399834E233821FAD36956A9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230421101511.3532534-1-anshuman.gupta@intel.com>
 <ZEKVvAvVm8Z7uIBK@rdvivi-mobl4>
 <CY5PR11MB6211AB6A30A90B44C8F71AF595609@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZEZ0ThMp9vwXmwg0@rdvivi-mobl4>
 <CY5PR11MB621135801959F3DD42F3330395679@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZEfLNoY6fb4HNN8D@rdvivi-mobl4>
In-Reply-To: <ZEfLNoY6fb4HNN8D@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH0PR11MB5903:EE_
x-ms-office365-filtering-correlation-id: 7799ff21-7439-44f6-d8ef-08db46febadd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ckI4Hj/lBFzukBh/YDQNOWOLJKJic0RQDmmMw0whRy7wPJuMrK6kJ/5xneojJR9JuLJuIrB9dSCqMvTj+MhrwsbXtN6nIE8mC1I654yz/JsriZe2n2prD9vGiKvMTIs2bEonD2blUv2WC1xQZjvVCV9FBcFXka1hmgRftpIqeomKt9B6Qbb9ZPWdBz8LppYz+xP74kbGNy0mCoYZ/QLV8tl/Y3o1MYEndBqmUafecKEegl5qAngEvJTcjE3a3mttwmFgogaM6elXQNYEqZckJa22XCwHgv/C2meKrfy3FLF54tUwIyZIHK++YHfCU8+FhDAxzgo7btAUinaM436Qx355FHa9/kfHbXgm76SW+SFShJXf7Nt+WaTkUmd7r2ABhpFsXQ5dDS0t9nHbcJCQ1ROku5SiPaTuW3sN5lTd5VlnH5iEzznQrl9WvV/maU3lIIIwKpXQRVrC+uSs1AqmVSewvR3E6mPno0JGdgIJ8Hbw9rSGep20Ad3UpCQwIMQ8ZV/pTRfIpd+sqFe3gGrCAZCnFJxyOFJO27kI4VW674G9AAnxWnFO8gxmXvqmbCSRtXrSzhZDUwJCoW4qkWnqNQcS264rn/XzLPlB53pjgpc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(86362001)(38070700005)(33656002)(2906002)(55016003)(53546011)(71200400001)(7696005)(83380400001)(186003)(9686003)(6506007)(26005)(966005)(107886003)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(478600001)(82960400001)(316002)(5660300002)(122000001)(38100700002)(8676002)(54906003)(41300700001)(52536014)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tRhkLUwoXkEETtxaL6oT/FUTIDp1AzdPp2NvEUZ00Sywljs5I+lZKNr3yTr9?=
 =?us-ascii?Q?XMfm9B/olQnXsGVioMyEIyZnteKFYSBgSSgaRWalApCrTf3/ve+h/WfyjgcP?=
 =?us-ascii?Q?h6EJi0Hrq8vEJ8ImfPXL6FDbqipdsB9acGdxFzfjm59VvtpK8U8fFEwyM6KP?=
 =?us-ascii?Q?+QPUuGnRrLfdYkFUIisKj6+6zFW3E7/DLdV9te/waJmT4FY47Qlmsj4g1MY0?=
 =?us-ascii?Q?7hgc7+5+oWCLaMw4cXIZWXeTLMkXCPtIt9w2eHoJzHbyokWO/DRHOGE1vfaw?=
 =?us-ascii?Q?UFDcFOkGTgTQzt0kLurRkXrNyVac0zKKRqMVw2jBWPQNiidVF2UC62R8a59S?=
 =?us-ascii?Q?fEbVmWNMtzsPGNj/p0BsSqejNz0h0vYfToOe1kdN0qZE6UNbsxC/VUNKB7xM?=
 =?us-ascii?Q?cq0+4GYFQoPGVg6WAN5lfQ4qcU6yEAHp0DVdA+5089ojY/JlFHiLL7sXuCRP?=
 =?us-ascii?Q?qTZV9sDtWnp7Yj8oVMBnqRY3vVHgmRl4I1xnzB+SDi/9sfnRd5JhD/JWmgyw?=
 =?us-ascii?Q?wgbuUky/7ih+KDJEHBxboi7aNoBjs9VzkVEVy5dxEDvXi/tNZCIk5iec6aNZ?=
 =?us-ascii?Q?MgSjli8yCBhT3koy/0C4JyLYHXz+dy+wtqeX39Y0VE8R0s0wdHvvrKijeJ0Z?=
 =?us-ascii?Q?uDnRQUhAxkMy0KKqNQ7kDxPsmEjInsHK1sz4o3q00DwqifhkC9gm7bXmOzEW?=
 =?us-ascii?Q?8ZacfyldP3WKKFmrqbYavmwzfWXWcBxZP/WadTRm24c+0PO5QGcvBBoYgGLv?=
 =?us-ascii?Q?mXhujlD0WgGb/Z1txDV8x+j6cuZgcQ1T9UrGqQd8nZ7X3AQre5uTPLqSn9S6?=
 =?us-ascii?Q?IyVJjP6gXitREcP1YZcDe9SB2jbglt+bxQHRVCqCi0S5/HYWAKtrg7IQEe/I?=
 =?us-ascii?Q?T5hf4d0K0OrKOrTzNta0G3yGQ1s7qs7i2ecInrVRiW1A2cKeVeGjBpVglDZd?=
 =?us-ascii?Q?St2KGqlqO343un19PocDzo3vCe1dv8YYdssXYQ64M238RkeMolc8al8dI3IZ?=
 =?us-ascii?Q?56wCEZwlcpZ+iAlDgixvZLq075wfvLvWZTZvWRpS/H326bKOWs5mRJFpbI3o?=
 =?us-ascii?Q?2p2lkCZ4fY6RhJTf0ArtH1CL8UDU4GN8XSSxzW+3O2PfeuBZpd0/RVYuf2UU?=
 =?us-ascii?Q?Bq0KApH/cXEnsIrvzw8FV+1/8Nd6SvYVjvm8JFf+aoaT/hROee6++Kw2fPM4?=
 =?us-ascii?Q?5JDW+E9qxUvlPm3UqeORoLM56/5xFbvf1g1qPQ+4e+XpH/UQvPrHf7i6JcUM?=
 =?us-ascii?Q?xAnW9USaQCfMlISf8JiydjMqQAfFaH9xSGCSJ4j19LIsL1P2UBI2pRD/SNWQ?=
 =?us-ascii?Q?NW+kEr5Q8jjfOSoR0msD5iR3oyAef8aRLK4bsghIHY9xyXGL3deCJfFkK6sk?=
 =?us-ascii?Q?mbvzRWuM9gDdF/tADICtlxdQl3JxdLW4DohwbwX0VbadU4xGrV4v1qcCKLNY?=
 =?us-ascii?Q?u2B+6BtoLKqSAGLJ6MyqOEp0swy+krKJG1lnwnWOQU9/OlwaQFiB2YV3Ocig?=
 =?us-ascii?Q?mR0eJr4iodh+LCOVOrDxODFAh7rKirun7RC1oB9W84ZBoZIA/iTu9dnnT5dO?=
 =?us-ascii?Q?cNXdUHk+I3v+sRIHRrafxBgM1xXVv9F6Xr/KgWZk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7799ff21-7439-44f6-d8ef-08db46febadd
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2023 09:06:47.3610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOKgZ4ur8I6JOuYc1Se0o2A8LYhWAK8iBRKCmnvXVdq4SygW8qP5JCHElILVcWFtDWWA61NG1yhYaCwKHpxoqyLKlKQ/cCqtw5WUYky9XqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
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
Cc: "Chehab, Mauro" <mauro.chehab@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: Tuesday, April 25, 2023 8:03 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Chehab, Mauro <mauro.chehab@intel.com>; intel-
> xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on unbounded VSP
>=20
> On Mon, Apr 24, 2023 at 09:50:00AM -0400, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > Sent: Monday, April 24, 2023 5:52 PM
> > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > Cc: Chehab, Mauro <mauro.chehab@intel.com>; intel-
> > > xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on
> > > unbounded VSP
> > >
> > > On Fri, Apr 21, 2023 at 02:30:42PM +0000, Gupta, Anshuman wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> > > > > Sent: Friday, April 21, 2023 7:25 PM
> > > > > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > > > > Cc: intel-xe@lists.freedesktop.org; Chehab, Mauro
> > > > > <mauro.chehab@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > > Subject: Re: [Intel-xe] [PATCH i-g-t] test/xe_pm: Assert on
> > > > > unbounded VSP
> > > > >
> > > > > On Fri, Apr 21, 2023 at 03:45:11PM +0530, Anshuman Gupta wrote:
> > > > > > Discrete GFX cards gfx may have multiple PCIe endpoints, they
> > > > > > connects to root port via pcie upstream switch port(USP) and
> > > > > > virtual pcie switch port(VSP), sometimes VSP pcie devices
> > > > > > doesn't bind to pcieport driver. Without pcieport driver pcie
> > > > > > PM comes without any warranty and with unbounded VSP runtime
> > > > > > pm and system wide suspend/resume IGT
> > > > > test
> > > > > > cases may get pass as false positive.
> > > > >
> > > > > I'm not sure if I'm following here... you mean that in cases
> > > > > like this we cannot suspend/resume at all? What are the false
> positive?
> > > > > I'm not following the whole scenario here...
> > > > Recently Linux core kernel revert the L1 substate save/restore
> > > > feature
> > > from Linux.
> > > > That eventually requires L1 substate to be  disable from BIOS,
> > > > otherwise s2idle fails on a HOST with DG2 card as DG2 was not able
> > > > to exit
> > > form L1 substate. But due to the unbounded VSP our CI missed to
> > > report such issue.
> > > > As VSP were unbounded and DG2 Link was not transitioning to low
> > > > power Link State and our tests were passing instead of failing.
> > >
> > > But then on this case we are just avoiding the test now?
> > > Why don't we cherry-pick the linux core kernel fix as a temporary
> > > topic/core- for-CI instead of blocking the test?
> > We don't have any fix yet, Atm Linux core Kernel does not support L1
> substate during Suspend/Resume.
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com
> >
> mit/drivers/pci/pcie/aspm.c?id=3Da7152be79b627428c628da2a887ca4b2512a78
> f
> > d
> > >
> > > Or why are we not handling this case in kernel side then?
> > > Why block even s3 tests if this is only about the s2idle?
> > This is about D0/D3 and Link state for our discrete graphics card not d=
irectly
> related to s2idle/S3.
> > Due to unbounded VSP, PM core will always keep the bridge devices in
> > D0, L0 state, There is no point to test D3 and Suspend/Resume with
> unbounded VSP.
> > Unbounded VSP was the one of reason on i915 that we missed runtime pm
> wakeref before accessing lmem.
>=20
> I have 2 problems with this patch:
>=20
> 1. It will fail the PM operations, while the problem is not the PM operat=
ions
> itself.
> 2. It doesn't protect the PM operations. I'm failing to see any protectio=
n in
> the kernel level.
> It will be just errors that will be ignored.
>=20
> So, we need:
> 1. A test that tackles the right issue.
> 2. A protection at the kernel level. If we cannot do PM operations in thi=
s
> case,
>    we cannot simply fail in the test and ignore the kernel failure.
Thanks for the review , considering above having a WARN_ON inside
Xe driver for unbounded bridge device will be sufficient ?
Thanks,
Anshuman Gupta.
>=20
> >
> > Br,
> > Anshuman Gupta.
> >
> > >
> > > >
> > > > Br,
> > > > Anshuman Gupta.
> > > > >
> > > > > >
> > > > > > Therefore assert the xe_pm igt tests on unbounded VSP.
> > > > > >
> > > > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > > ---
> > > > > >  tests/xe/xe_pm.c | 11 ++++++++++-
> > > > > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c index
> > > > > > 23b8246ed..78d9374cf 100644
> > > > > > --- a/tests/xe/xe_pm.c
> > > > > > +++ b/tests/xe/xe_pm.c
> > > > > > @@ -33,6 +33,7 @@
> > > > > >  typedef struct {
> > > > > >  	int fd_xe;
> > > > > >  	struct pci_device *pci_xe;
> > > > > > +	struct pci_device *pci_parent;
> > > > > >  	struct pci_device *pci_root;  } device_t;
> > > > > >
> > > > > > @@ -344,6 +345,7 @@ NULL));
> > > > > >  igt_main
> > > > > >  {
> > > > > >  	struct drm_xe_engine_class_instance *hwe;
> > > > > > +	struct drm_xe_query_config *config;
> > > > > >  	device_t device;
> > > > > >  	char d3cold_allowed[2];
> > > > > >  	const struct s_state {
> > > > > > @@ -369,8 +371,15 @@ igt_main
> > > > > >  		device.fd_xe =3D drm_open_driver(DRIVER_XE);
> > > > > >  		device.pci_xe =3D
> igt_device_get_pci_device(device.fd_xe);
> > > > > >  		device.pci_root =3D
> > > > > igt_device_get_pci_root_port(device.fd_xe);
> > > > > > +		device.pci_parent =3D
> > > > > pci_device_get_parent_bridge(device.pci_xe);
> > > > > >
> > > > > > -		xe_device_get(device.fd_xe);
> > > > > > +		config =3D xe_device_get(device.fd_xe)->config;
> > > > > > +
> > > > > > +		if (config->info[XE_QUERY_CONFIG_FLAGS] &
> > > > > XE_QUERY_CONFIG_FLAGS_HAS_VRAM) {
> > > > > > +			igt_assert(device.pci_parent);
> > > > > > +
> > > > > 	igt_assert_f(!pci_device_has_kernel_driver(device.pci_parent),
> > > > > > +				     "pci bridge device does not bind
> with
> > > > > pcieport driver\n");
> > > > > > +		}
> > > > > >
> > > > > >  		/* Always perform initial once-basic exec checking for
> > > > > > health
> > > > > */
> > > > > >  		xe_for_each_hw_engine(device.fd_xe, hwe)
> > > > > > --
> > > > > > 2.25.1
> > > > > >
