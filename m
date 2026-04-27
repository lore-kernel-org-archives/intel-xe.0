Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B2EFF8867
	for <intel-xe@archiver.kernel.org>; Mon, 27 Apr 2026 20:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E6810E913;
	Mon, 27 Apr 2026 20:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5nPe/SV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B1F10E913
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Apr 2026 20:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777320945; x=1808856945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZGQBEOc7O4F22FYYuoOWoh01ckZVjfCuTfg0CaNXzJ4=;
 b=L5nPe/SVcdBG5sP6j6knOldjmer9usavXIazZjmPLoGSaFuhkVL8Ui+V
 GSYJ4ILEv3xXv3fdI3QwWnhLgG4VAOxkHfA0zx5533UA9ORZivLqL2fdV
 wWdUrF+vFE/R+oJF/70TBjvIgCmL37a1wazRUn9DmELZ9LRiW5EI9WSPw
 wAH57FjQtM8ZgZ6/3weV5X7fgR8ZBWI3srh64d+4pxlhKj510UMOLDESF
 OrBO2GF/q7d6di6NPffXF7JKsw01MyaPQPsercOr/iMpz0pbJ0l8gDdE7
 VmKZXZ6UScCDBJqy9nlkeiuo5epiF6ESG/e8LBS9YTckjAnCrGdqtxuhe Q==;
X-CSE-ConnectionGUID: YQrkmxh9TrmTi3d8xV6WPw==
X-CSE-MsgGUID: CHSAfDpqSgePM9KzyFEOAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="78415201"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="78415201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:15:44 -0700
X-CSE-ConnectionGUID: k9KNeE64TeGed79Hx1YDiw==
X-CSE-MsgGUID: WACAnha2QwisTbJDv/xA/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="257043717"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 13:15:44 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 13:15:43 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 27 Apr 2026 13:15:43 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 27 Apr 2026 13:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWJTSykj4UM2sxYW7UZDB1iyVvNbXtPeqlL/WLRq0OsIojT/PSnChjBTUkVwE8So8MTgXHnQhJNxml3Tk+/2D5CsMqNFeBAXHY8EMEUZ02lESrTOi1AHAepZ+PzTG1gTbETIUmIzF92ywM7cd3jasd0sOzk6AFDCZ0wmeILiS0AenveB0PswsvS9Gje2rm15CvVl1bDXRmlFoBXAtw4zR0lGGnldyJW5XftpjAFyy6qbJ3HEW5WBiKNP6kH1ztQBn73B8+xasoKuImyuMPotvExd5jRWiILGiY3u5JJeDAGOoq9mqVmYxmPkgy7A0IZdMCJbEhxBUbFf6wWDvdJhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v7nKDAhlbF30FkS1IHgvcrSmV7Bn1Z15s/KixgZQUBc=;
 b=Omyrg24REF0y3w5ss3Jha45NNZ/ux6YMHHRX3YFXFd6mmNRGpzqVy6SMhvmuaNFs9uXT8TLodO4CxBD8cP2WZJnZQBcFvXJoxnGw6ZaNMw/UZ3VquSUUjPk1848P72sa7as8DjtljotFnNEfExh6tX1/db736sbx8EG1XIKDWRvG5oDIJwdxej7mOg/qhlDEuJKoeSVG0T8eGCKdmnaK71qSIZo2QJ2bysBfsny8Bb/RxSSypCIKunAwsUqWTuXfeP4CC9jhtrlfD5wMTKXmsvOuZ8TkkgI+9rGnUoYSxagc8HhP9INuvhnrfsS7lq1117fQaVokTU9SJftk9lagqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH8PR11MB9745.namprd11.prod.outlook.com (2603:10b6:510:3a4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 20:15:35 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 20:15:35 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
Thread-Topic: [PATCH v2 08/10] drm/xe: Drop unnecessary STOP_RING clearing
Thread-Index: AQHc1CwXT0rTjjDlIEagdnl8DJZ3wbXzNq9QgAAWfgCAAA6awA==
Date: Mon, 27 Apr 2026 20:15:34 +0000
Message-ID: <DM4PR11MB5456C4E6270C638C83EE2634EA362@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260424-engine-setup-v2-0-59cc620a25f1@intel.com>
 <20260424-engine-setup-v2-8-59cc620a25f1@intel.com>
 <DM4PR11MB54564138FF5052CE5577471DEA362@DM4PR11MB5456.namprd11.prod.outlook.com>
 <20260427191926.GN7476@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260427191926.GN7476@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH8PR11MB9745:EE_
x-ms-office365-filtering-correlation-id: 62041fc3-12ca-46ab-1c8a-08dea499bd97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: IGbleTaD4cUE4+cFluUlrlCNfHFMsUlV2XtBSwGtToZVQYvijQ182N3mQ/LVdEfvm/JXc+nUfgjC07Xi03aNtGF5XPAdkeQEIxklx9rRFFudE5GYB+qBR+x+OP3gLgd4u9AFnSxNxue+NkLrK277h0In1UV7Oy2hv+PMyaezDeuPBM8DBqcdJURyfwp0jTHaCHEHeY6QUjlhk5rjZqdexcM15hxALWD6zmHSatmW5Sizhpv7eKz+1zsdwHziqJ78Pasnx6dPsSpQ0V4FVAc4U5XaVAeGpHd4AIEOgX68jSOK4nxCcSTw6NJzQ+5Z+SveOie0FFVhZifLd9i+A2uStaE89+ITo4XaeiQ1ZxHZQemjtKmmOwVs3mizw40keP4NaFlkVFGUGB4kURZzFYGqaYoGGBjU5gurxs7P26ciybT5F/vI0vZ25jzQJYWhn9va6kk9hhvXXXLNou+UyZZj68+rP2MUam8fpLwNr+75Hp2CB0MwJGPuB9Aj0yRuWeh+VykJ6UOibz1yIsJtBHrl7JjKX4CtsotEqrA9/j7V1TWJX1s7NuWVth6HM4LfMxQ3GRfYVT92lA+xUGQatyiSsV7Hr+MZrx5oruzFAW8IBNqO6dWrIE+ZIKNKTRA0QwFxCKXTnU7YpUf3D+g2w43ruXeepvs+j2rx3y2Rzistf2ZPJpfi/+s8aRI+AM3PMiUWivzny58+YdozkmANdunI13UEhUppiwZuY/reMYYEmWo6UXvQCD8gyqecYD/tzQ0mRYGER36dIvnIp6rnWqq++W76dIw6TqPtnFd7nT4O+cw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vkNPw67KfDOm3e7b5sGkEKHB1I2/o83g85kHyUtm0ff/ciGcSPO0baBC+OYm?=
 =?us-ascii?Q?Z+lx4BiqgbHGVdDo8odJsQlD0r8+B6Qjw0q3xGdAjiSMRPT/f3rvh5gLq4pZ?=
 =?us-ascii?Q?vK44r7NFMeQWbPv4rRPSo+AoWvHv/tSZ5bHJ5EMubc+N7Qr2OXcky15xcdJi?=
 =?us-ascii?Q?B29AEaH/TtgPLafs53pvMjXpl2qsYi7tn0PFRTNqAa/YQaxXQm+uqYpexXfk?=
 =?us-ascii?Q?2VGAtBZk7Btm0EWjfdOW30bkp5DEU7mRTZOtIS31gPx49f1iwKwF2J20P7wS?=
 =?us-ascii?Q?VBEc2EHvdBtjfCMuX1LJhUza6TqODPMMQWroqMIcuDNkhYefFiel2T1Vkdbb?=
 =?us-ascii?Q?tHBhJzp59EOOHDeW3EZrGI2+oahxPcCnBsDKwiPdCVCpb9DRmPQ76Ufip+Ch?=
 =?us-ascii?Q?j7unYYEJhiup5qwgKhBaUGJv+KADxuUyoqVi/ObJVfcWs0lg9GadKrpwIPBP?=
 =?us-ascii?Q?l50fOCj0WmxzFMul55DR7lAG4Oqb24Ju6JqMFez9xED2sMXzEhjYDawbKXPP?=
 =?us-ascii?Q?qiWlVC6p6PO/JyXrcp3Z3gSRbCE78e4rbZOXXiXgfYR8beStx9o/+iy8IDaP?=
 =?us-ascii?Q?olkCv6pJT8CWycTUTx4p2tkKgAqVy9KAmzajv9E508j84WpOX57+K+vnNPuz?=
 =?us-ascii?Q?FuknSOvfMHLSMt3irm7kTlo363720ytRv3RkCAmIsBQSVIxLLZKKGfEP93jg?=
 =?us-ascii?Q?BRBq/Wwq39FPmE+EcNMC5iCyThRvR9grEk9/7X7S6MDQ/Dv23P7ciJgwL/LC?=
 =?us-ascii?Q?losJV9wfJ0sQyicd9Ja8eenr/A+FDqD5yOfBtmCcGDgmlxlfPXoyzP3OlpSc?=
 =?us-ascii?Q?8HUprPumlsFwvFqwEwgAcMpiBDRyHO8RdHRAySBiJxKIgguiq6JlJb8P51T+?=
 =?us-ascii?Q?ExwJkq6l24SL2S1pkG8GZ6GenZczc5GRcr4ekTH8abGhOCa2K31Sar9rL1Q0?=
 =?us-ascii?Q?SRgN5RMq43GmsZrToWzq5wQ33F9bHumUuxJNlLfi5vTtncxjs0s952UyNsOc?=
 =?us-ascii?Q?GiZlyCy7nO02slyf/cRqOfQ3d1MeQR4myxxi6MP7Tz5KJQpMliHH0T9zddBM?=
 =?us-ascii?Q?BPVpz52SqCx9+yQtx180uZsPQpClhDVZKCDaBZcMQYWO/2SqIhGTdGc1HOcv?=
 =?us-ascii?Q?7BSBhk50dP6jVjXLHXvn7GjY83I+9NQtIDhnz6qAjfIBCNLqoF/vYMpQYKcT?=
 =?us-ascii?Q?SDz1/JvKqHktHj9A8WtCEw2/jObF5peclka91bvNdc3flDHEA2vNm52SISwi?=
 =?us-ascii?Q?uaUt7uh29fFM61ONOUmIANCz2chr/+ifAAT7WJgMoaIH26P73OSIw3Pm01ud?=
 =?us-ascii?Q?beaZ5JA2T1lmevyjB6lxnRhUTZcsNU5fHa/eQfXOd0Q4+LcCXSx3mLrNFdms?=
 =?us-ascii?Q?WWi7LMO1EBExiHbalR1TIVHe7YRdDNFmo2/QsnjRKNgUaxXqgKJA1ed19P31?=
 =?us-ascii?Q?MP7T3M2Yv/Wtv2w6+cavZEbGddUtIeQkX6gYz0cEyS8NNZ2bRVj8cgSanrg5?=
 =?us-ascii?Q?lQMuzELN5YibrlHSdPOa46LkSGqQn051E1Lcls37K9sSD1T3EbeTdmtpbhDK?=
 =?us-ascii?Q?JAkSebtSNbMgOJlkoqcZDPEVc0JAz0hstzfgBzHvFD7DN/yWWKX2QCfNZfSn?=
 =?us-ascii?Q?USU6KIKOrvHpJBmhUhtX2Ay9n7CZ0s9JlSHbgCMgBEmjeGKlH5o4E7D4tFg/?=
 =?us-ascii?Q?W2HwCTOt82PpvOjo7SeINryj+I1Y3jDyN5YKYuj+JkvsFe5LJ0RypQtWOijZ?=
 =?us-ascii?Q?n1CnfCv58g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: lJz5Kbd2fPwh/vHRZrisJQqgDDTdkY0BI2BywFjaAqPVt5IXpJZoPWAdwXYy1ivF4wHgmhWsA/djNQCRc4vrV4n2YeOD32601dvQRzQXhaWUhc+G3anl9SR9k0hYaKXq751b4bKybnjus5vIgYuZIEqwqYaSiHHcG+11mTtfHpBT6cmRFhYB5gAfUnjzUDTk9iujY5ruxanlLqAM3zYxd1pKzCmosuUO5Gi9dW7onKmAt9f3OE1xa1nkG6XJy07I/NQ41DWW7sEM8yN40U07F/8l4lL0roPgau7O7xRlHd/SjAr00vT0dYK6WLjKKkiO/AzHVrcdHWcb+Ef5Gy9Vmw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62041fc3-12ca-46ab-1c8a-08dea499bd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 20:15:35.0396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TBIE3T9gkLZRUQOd9zUIJQ6wccuZ7h+JWMvQhY5rr1Ix8IyyOYY8PCJX0ctM4BULU1MA5w3AgA3rTOlSe3PAWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9745
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

On Mon, Apr 27, 2026 12:19 PM Matt Roper wrote:
> On Mon, Apr 27, 2026 at 11:08:08AM -0700, Lin, Shuicheng wrote:
> > On Fri, Apr 24, 2026 1:48 PM Matt Roper wrote:
> > > The STOP_RING bit in MI_MODE is already clear by default out of
> > > hardware reset and will only be '1' if the driver intentionally sets =
it after
> that.
> > > Furthermore, MI_MODE is part of the CSFE context, so even if the
> > > hardware bit did somehow get set, a fresh value with the bit clear
> > > would be re-loaded from the LRC (which is initialized zeroed).
> >
> > Just to confirm, it is a masked register, would it also be cleared?
> > Thanks.
>=20
> Usually masked registers are stored in the LRC as 0xFFFF???? so that the =
exact
> value is loaded from memory->register on each context switch. But based o=
n
> your question I did just double check on hardware and this bit seems to b=
e a
> special case that doesn't get loaded on context switch with the rest of t=
he
> register.  I.e.,
>=20
>    $ sudo cat /sys/kernel/debug/dri/0/gt0/default_lrc_rcs | grep 209c
>    LRC[ 0x70]  =3D  - 0x209c =3D 0xfeff1000
>=20
>    $ sudo cat /sys/kernel/debug/dri/0/gt0/default_lrc_ccs | grep 1a09c
>    LRC[ 0x70]  =3D  - 0x1a09c =3D 0xfeff1000
>=20
> Since the mask is 0xfeff rather than 0xffff, every bit *except* bit[8] wi=
ll get
> updated on context switch, but the setting for STOP_RING will persist wit=
h its
> current value.  It's interesting that I don't find any mention of this un=
usual
> behavior anywhere in the bspec...
>=20
> I guess that means I should drop the sentence starting with 'Furthermore'
> from the commit message.  But functionally I think this patch is still co=
rrect;
> even if context switch won't reset this bit, clearing STOP_RING is only r=
elevant
> if it somehow got set between the hardware coming out of reset and the
> driver doing its initialization.
> The KMD never sets it, and looking through the GuC firmware, it only gets=
 set
> during one specific workaround ICL-MTL workaround (and in that case there=
's
> a paired unset when the workaround processing is finished).

Yes. I agree just the commit message update is enough.
With it,
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>=20
>=20
> Matt
>=20
> >
> > Shuicheng
> >
> > >
> > > The logic of clearing this bit appears to originate from very early
> > > (pre-GuC, pre-
> > > execlist) code in i915 where we needed to stop the ring before
> > > performing a host-initiated engine reset; after the reset the
> > > STOP_RING bit needed to be cleared to allow execution to resume.
> > >
> > > None of that is relevant to Xe (or even modern i915) since STOP_RING
> > > isn't necessary for execlist-based engine resets (and even if it
> > > were, Xe doesn't initiate any engine resets; the GuC handles that now=
).
> > >
> > > Bspec: 60356, 60184
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 -
> > >  drivers/gpu/drm/xe/xe_hw_engine.c        |  3 ---
> > >  drivers/gpu/drm/xe/xe_lrc.c              | 20 --------------------
> > >  3 files changed, 24 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > index 4d5cd1b6f50d..c4c879a9e555 100644
> > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > > @@ -176,7 +176,6 @@
> > >  #define RING_TIMESTAMP_UDW(base)		XE_REG((base) +
> > > 0x358 + 4)
> > >  #define   RING_VALID_MASK			0x00000001
> > >  #define   RING_VALID				0x00000001
> > > -#define   STOP_RING				REG_BIT(8)
> > >
> > >  #define RING_CTX_TIMESTAMP(base)		XE_REG((base) +
> 0x3a8)
> > >  #define RING_CTX_TIMESTAMP_UDW(base)
> 	XE_REG((base) +
> > > 0x3ac)
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > index b380d3cf6d3a..91e644067cc4 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > > @@ -327,9 +327,6 @@ void xe_hw_engine_enable_ring(struct
> > > xe_hw_engine
> > > *hwe)  {
> > >  	xe_hw_engine_mmio_write32(hwe, RING_HWS_PGA(0),
> > >  				  xe_bo_ggtt_addr(hwe->hwsp));
> > > -	xe_hw_engine_mmio_write32(hwe, RING_MI_MODE(0),
> > > -				  REG_MASKED_FIELD_DISABLE(STOP_RING));
> > > -	xe_hw_engine_mmio_read32(hwe, RING_MI_MODE(0));
> > >  }
> > >
> > >  static bool xe_hw_engine_match_fixed_cslice_mode(const struct
> > > xe_device *xe, diff --git a/drivers/gpu/drm/xe/xe_lrc.c
> > > b/drivers/gpu/drm/xe/xe_lrc.c index c725cde4508d..9db914584347
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_lrc.c
> > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
> > > @@ -682,25 +682,6 @@ static void set_memory_based_intr(u32 *regs,
> > > struct xe_hw_engine *hwe)
> > >  	}
> > >  }
> > >
> > > -static int lrc_ring_mi_mode(struct xe_hw_engine *hwe) -{
> > > -	struct xe_device *xe =3D gt_to_xe(hwe->gt);
> > > -
> > > -	if (GRAPHICS_VERx100(xe) >=3D 1250)
> > > -		return 0x70;
> > > -	else
> > > -		return 0x60;
> > > -}
> > > -
> > > -static void reset_stop_ring(u32 *regs, struct xe_hw_engine *hwe) -{
> > > -	int x;
> > > -
> > > -	x =3D lrc_ring_mi_mode(hwe);
> > > -	regs[x + 1] &=3D ~STOP_RING;
> > > -	regs[x + 1] |=3D STOP_RING << 16;
> > > -}
> > > -
> > >  static inline bool xe_lrc_has_indirect_ring_state(struct xe_lrc *lrc=
)  {
> > >  	return lrc->flags & XE_LRC_FLAG_INDIRECT_RING_STATE; @@ -980,7
> > > +961,6 @@ static void *empty_lrc_data(struct xe_hw_engine *hwe)
> > >  	set_offsets(regs, reg_offsets(gt_to_xe(gt), hwe->class), hwe);
> > >  	set_context_control(regs, hwe);
> > >  	set_memory_based_intr(regs, hwe);
> > > -	reset_stop_ring(regs, hwe);
> > >  	if (xe_gt_has_indirect_ring_state(gt)) {
> > >  		regs =3D data + xe_gt_lrc_size(gt, hwe->class) -
> > >  		       LRC_INDIRECT_RING_STATE_SIZE;
> > >
> > > --
> > > 2.53.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
