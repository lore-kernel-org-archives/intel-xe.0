Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A13C54788
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 15:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F9E10E959;
	Thu, 22 Feb 2024 15:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpXxwa9W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A7610E959
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 15:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708614399; x=1740150399;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IoLeO/TpEqHBokzYHdn333OEc4W3nINyoKgazfGjaCA=;
 b=jpXxwa9Wjns0VZNv8hwWItFPOz0g2+KKCNrkt/5VISU1YeovYmOR9+8W
 XgwBOk0RptIpzXQVPfQryVpCkOIE2RbG+xA6nImotySGm2Kv00xISQP7s
 1zcB50BD/EO6DBBstn5p0r4lXTl2zjeD+SZabqyTnHzQMuMR9NI/4C9ja
 CV1kzn/dtLuD+8/e6Ts6lmtpecCkdBn0Yy3JqTXv+X+Hmb15i/sOLMb61
 Di1vio3dFcgwn3gPyPybab9BPESNwkRo+TwthiRK+WbUDZ4RfTZEU6+8I
 RjRSYiyzWoBfa+OxyCoyX8+adj2fPj36Rz4PeSWPjaAtcoud0LiSaD0zO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2967247"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2967247"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 07:06:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5420774"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 07:06:38 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 07:06:38 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 07:06:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 07:06:37 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 07:06:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndfBrWgiYlk7/Q0/f9m4PyV6EHFbBF0HIWm0bxhIjI95lHJsfi6Ear+WyXFe5aQ/QEH7+fCmUQMxZj+1RAIvC+AJ3pLjJR+kC/nHK4jHweJlj7YMOOYKEXAinQJDv8CHbU8r/60h/PdPHrvY1cBubWll/zX52TcFG5wgjgOZwjUo11AtfswUiDzg8btH1tPegJZ4HURjAcp/qE3oewIX7Hb+gg3UsXDev//7L3VheS2TnjZctYkem0R+gN3o8KLT1fwpuO5ehbjr2cH73lWvRVnJDCapDFB3dc6I8iYyF/ICcm8DncakUvJ3u+IQ7VhvQD9GDyiTgC/Xeiu660aQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rs16qzU1iETkPey/qm0wEHVqwBiV4ESPZ7BrQ11usU8=;
 b=WQtpOxqYL/+tsRweRF0kS0nOgZx/uICSB6FPaMM5LfPK4/Not+RotLSshWR7XpNNZOdMRVpHBeM2SwcKnwDM0SRpRUqz4fev59Nr7lrAxeDuYtG3BhUXSxETib2koMolsc6YTO8egCX1R7HXBRrInbnCStSLujZOc1q8YKgq2WHlYXvxO+ao4QrJY4hF3hXWXokI6Vus27RnJCy5wwJRgfJ8YtoSnHGdILia3pZppfHhH6WBeLi1EkbtjrnK8z3OanfDcuD4uHe3OIHgY70v3rKwi9z82+S740JljYf7+a/+iZYd0fekX2tfWt+G4iykgjyNRFwwHEMt3rIMFHjOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DS0PR11MB8136.namprd11.prod.outlook.com (2603:10b6:8:159::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.37; Thu, 22 Feb
 2024 15:06:35 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7292.033; Thu, 22 Feb 2024
 15:06:33 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Topic: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Index: AQHaYEYHfnvM7fqb+UaHLrAxq8puObEUvIoAgAAk86CAAE5vgIABT24A
Date: Thu, 22 Feb 2024 15:06:33 +0000
Message-ID: <CY5PR11MB62119BECB805D555AF191ED795562@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
 <ZdXngrtmc58-Zyfj@fdugast-desk.home>
 <CY5PR11MB621115DF0A46D62420E2859B95572@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ZdZITR3RSUNqDDHW@intel.com>
In-Reply-To: <ZdZITR3RSUNqDDHW@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DS0PR11MB8136:EE_
x-ms-office365-filtering-correlation-id: 182f6401-b273-40ee-a35d-08dc33b7dbb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rwjCTv+G+qFAnbYMK7hZaWFQkwbl7aNimHWp/Kcmlb2wAGhwyONAvYck6R8m2p69hTBvLDAUdnd77ujrc8tyL3UvsQbM/sgUUvOkx0iSvZKTH8JWmO7+/fNHZTPUf/XLq9kulhPohJnoBci9Mg3dXq9roByZ/Sk9kS1Dc9DZo4JIbN6bqmUia0kzruMLNWf+SQdpsEavBS9xvPTk/Y9iwHC5YOSOmG1fAuu6sv25sUXhkU4DblPDEw50JNd7Y5s6C+c53eprtv+zyDZeys/tZuv5hILrxGoPRNRqxcm5r9nWvTaEN1/x8aQHQf577Q60/QfcTNZ6EqNg0LTiZ8xTphgF7u46MN4eO/mJUPY0WyRND0AnsTFjb4asDOr4ox9AHKfNZw2VI3onDwiOR2MDk/KMXw5k1crDnFdoC8SyU2YFLWinI6od67T0+c0C1tIz5fL4wkOEXVXJqj5SnSd6IsiSkZaPOqOLZxXnVizvzgyQjTVx5ug1a6DLsyoAqlJU7sKgo1Yf8FgVY3K4jUamFcjCFwcIFN3Fr5Rp8dgxfQS4HfvctIlYuTQMGbvOKt9Zr70WGXEccMIlrZqrPPzndQesPrY4W5Ay7Vako7z+S09nVyEBQfaHf+dXGJGTCQ/B
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ufa936yd30J5i3H2SmhUJVJNVTKMVLorehFjVn7VSOzV9uj3vYp+xsWozTCd?=
 =?us-ascii?Q?P0ir24SsPCGwMeJIwt3u9sbO72/ySZX4FsTtTaJR7XPQolW+0C/ky8qKZNoG?=
 =?us-ascii?Q?W1xM3HDjfBtBr/HVp+5BP1DqwGq3Zqtv3vTsiTad0jDDLV6GpB/UT9DieLLI?=
 =?us-ascii?Q?cDRsmEXOidtzKSI8rtyRXIimkfNyeCzgh7+rY5ChUrWaysbckqRoQ4s/x/mt?=
 =?us-ascii?Q?L+28AiqE5D2ZgMltC5UMB4FpDSy2lxCqhKijBWBBS+puk75aEJ5cVt0xtRSj?=
 =?us-ascii?Q?S+NvdK8PFRybD7T5SRdZdWfxKQ72OxAvtWJajtx6dbTeqQ4X3WquyCZjbuZe?=
 =?us-ascii?Q?Ki+Xblg3lSWte8sF6bwsfhJMSlaoSzErYbwKDOo/RXkuBCaNlDnt6gXCGMDs?=
 =?us-ascii?Q?EzjU1o67oTmtTIxaTgWBp5z/BwyxZzq2fOKxAJu53Enei1C7L0uC9DjXtG3L?=
 =?us-ascii?Q?fiWil+8Lo7mwMedHwugnk2Npay+jHPn/0NR7uCF3etohJD5WfyPbN8Ie2Nh4?=
 =?us-ascii?Q?Zoe65ktBQKuLchzUaR+eXGy3SAvlM+d9JrhU47xUeaw9tUCXixGmKbkp84ZZ?=
 =?us-ascii?Q?BINkWoISOC0uDPIsWkW9WF1DNr0C7lEQT4Y5SIdjo3l2e2kHFSlHXPKJAUbA?=
 =?us-ascii?Q?WKLTCcEhQTABeQAGl09mjOvquI9dZeWKQPI4Y6NQ41xq/ov6WqqtQvPnzd/T?=
 =?us-ascii?Q?EGbYbnRV5BcvaxFtlLpu8v+4H8LsOOb5jVOG+TaGe98UdwR0akVsnmxkEPlu?=
 =?us-ascii?Q?s9km+LNubRYn7LjIAXClQH4pg+wKgAnTZgBnwPlQCSxDc+LT98/dHyw8hpPp?=
 =?us-ascii?Q?7TDpiLqYyQnrZ8C1TgAUsiWOozmTlDIEJzpxVuTzkMhiucDNfI2gITzSzzD1?=
 =?us-ascii?Q?47x0qXz2M0dMdk8fuEcOsLcSmaPZSWsQB3Pv5ZCbOnrwgDIToBQqq8YZadDU?=
 =?us-ascii?Q?5dhFDwkgqc+1CSzb1erqpLkRH5eePhmNdIdssNxA0E+JeKrFJSL1/bW3QL18?=
 =?us-ascii?Q?M/fMBzygj9cHeCDFuObcPnv1uH1JDmVLkCX2wBeL+iqQNXK1eL6709DBr+ay?=
 =?us-ascii?Q?JfqbkCpaITf6JPkusYOd2Ov8MkQdNdR5KG8uZbSnr8pmKLNizgciewX0jH+u?=
 =?us-ascii?Q?oHelC2+EAxA1YMYQ3eCAqyrfkq5Oyl38LHQuWq74de70a8NNXGtDFSPCSCjd?=
 =?us-ascii?Q?CtKJXa+E7EeKSSheCUw/NxrwG/bmks8q9zwVX9tRtVNRfMyYE8t/HHaxrRj8?=
 =?us-ascii?Q?lg6v8WnpHChh4GegmD9xftbass/voL5Mdd2PmIi9jZ3Dpo/AFTkvUdcFkeeO?=
 =?us-ascii?Q?ar7K5LxXATdnm/PLx1HEbd8CjAtZKtgExrrZ/0U0VJ/iEVM2f2yC6DKIUEif?=
 =?us-ascii?Q?bvCoo2dVLHVk6ZgfeAWn4rQGvtnfeSNn9lhqdaJT7AjlWhJclBrXZFxo0ea+?=
 =?us-ascii?Q?zII35fUiOm15jn4rY5qzK31RmTp4xKaUh/mC/KN4Wa6qtxjcn1KSNhCM5kMP?=
 =?us-ascii?Q?HxmPxyW0ftHrK1I1w17d42Cit5l5p4PhqvRNmlPTNS6I3XkVL9i2I7l1vPIp?=
 =?us-ascii?Q?ibQp9+Shzfrl7+HRGIZ7DRfYBchLTYABkzFbTOJo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182f6401-b273-40ee-a35d-08dc33b7dbb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 15:06:33.7680 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ++LgQLsJ2+IeS/wJfyKk0jy1EM2KUAfp49oZ6UXSse8s8XnFCMTV3EaLuwmI8TN/YpLmRhqYZ27vlf+YdTGEWMdWTz2W4rED6gCtCd2kqi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, February 22, 2024 12:30 AM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: Dugast, Francois <francois.dugast@intel.com>; intel-
> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
>=20
> On Wed, Feb 21, 2024 at 09:41:44AM -0500, Gupta, Anshuman wrote:
> >
> >
> > > -----Original Message-----
> > > From: Dugast, Francois <francois.dugast@intel.com>
> > > Sent: Wednesday, February 21, 2024 5:38 PM
> > > To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Auld, Matthew
> > > <matthew.auld@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> > > Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
> > >
> > > On Thu, Feb 15, 2024 at 02:34:17PM -0500, Rodrigo Vivi wrote:
> > > > Replace outdated information with a proper PM documentation.
> > > > Already establish the rules for the runtime PM get and put that Xe
> > > > needs to follow.
> > > >
> > > > Also add missing function documentation to all the "exported"
> functions.
> > > >
> > > > v2: updated after Francois' feedback.
> > > >     s/grater/greater (Matt)
> > > >
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > Acked-by: Francois Dugast <francois.dugast@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 108
> > > > +++++++++++++++++++++++++++++++++----
> > > >  1 file changed, 97 insertions(+), 11 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c
> > > > b/drivers/gpu/drm/xe/xe_pm.c index ab283e9a8b4e..64ffb9a35448
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -25,21 +25,46 @@
> > > >  /**
> > > >   * DOC: Xe Power Management
> > > >   *
> > > > - * Xe PM shall be guided by the simplicity.
> > > > - * Use the simplest hook options whenever possible.
> > > > - * Let's not reinvent the runtime_pm references and hooks.
> > > > - * Shall have a clear separation of display and gt underneath this
> component.
> > > > + * Xe PM implements the main routines for both system level
> > > > + suspend states and
> > > > + * for the opportunistic runtime suspend states.
> > > >   *
> > > > - * What's next:
> > > > + * System Level Suspend (S-States) - In general this is OS
> > > > + initiated suspend
> > > > + * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3
> > > > + (suspend to ram),
> > > > + * S4 (disk). The main functions here are `xe_pm_suspend` and
> > > > + `xe_pm_resume`. They
> > > > + * are the main point for the suspend to and resume from these
> states.
> > > >   *
> > > > - * For now s2idle and s3 are only working in integrated devices.
> > > > The next step
> > > > - * is to iterate through all VRAM's BO backing them up into the
> > > > system memory
> > > > - * before allowing the system suspend.
> > > > + * Runtime Suspend (D-States) - This is the opportunistic PCIe
> > > > + device low power
> > > > + * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
> > > > + * `xe_pm_runtime_resume` systems that PCI subsystem will call
> > > > + before transition
> > > > + * to D3. Also, Xe PM provides get and put functions that Xe
> > > > + driver will use to
> > > > + * indicate activity. In order to avoid locking complications
> > > > + with the memory
> > > > + * management, whenever possible, these get and put functions
> > > > + needs to be called
> > > > + * from the higher/outer levels.
> > > >   *
> > > > - * Also runtime_pm needs to be here from the beginning.
> > > > + * The main cases that need to be protected from the outer levels
> > > > + are: IOCTL,
> > > > + * sysfs, debugfs, dma-buf sharing, GPU execution.
> > > >   *
> > > > - * RC6/RPS are also critical PM features. Let's start with GuCRC
> > > > and GuC SLPC
> > > > - * and no wait boost. Frequency optimizations should come on a nex=
t
> stage.
> > > > + * PCI D3 is special and can mean D3hot, where Vcc power is on
> > > > + for keeping memory
> > > > + * alive and quicker low latency resume or D3Cold where Vcc power
> > > > + is off for
> > > > + * better power savings.
> > > > + * The Vcc control of PCI hierarchy can only be controlled at the
> > > > + PCI root port
> > > > + * level, while the device driver can be behind multiple
> > > > + bridges/switches and
> > > > + * paired with other devices. For this reason, the PCI subsystem
> > > > + cannot perform
> > > > + * the transition towards D3Cold. The lowest runtime PM possible
> > > > + from the PCI
> > > > + * subsystem is D3hot. Then, if all these paired devices in the
> > > > + same root port
> > > > + * are in D3hot, ACPI will assist here and run its own methods
> > > > + (_PR3 and _OFF)
> > > > + * to perform the transition from D3hot to D3cold. Xe may
> > > > + disallow this
> > > > + * transition by calling pci_d3cold_disable(root_pdev) before
> > > > + going to runtime
> > > > + * suspend. It will be based on runtime conditions such as VRAM
> > > > + usage for a
> > > > + * quick and low latency resume for instance.
> > > > + *
> > > > + * Intel systems are capable of taking the system to S0ix when
> > > > + devices are on
> > > > + * D3hot through the runtime PM. This is also called as 'opportuni=
stic-
> S0iX'.
> > > > + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't
> > > > + be called for
> > > > + * S0ix.
> > Hi Rodrigo,
> > Sorry of late review comment, was busy with other stuff.
>=20
> no worries. Thank you so much for jumping in. Really appreciated.
>=20
> > we do need modify the doc slightly.
>=20
> indeed... I also realized that to avoid confusion we need to detach the D=
3.
> In our integrated devices it is power important for the package-C states =
then
> for 'D3' itself. One might look at our PCI config for integrated and see =
D3hot-
> and get confused.
>=20
> > For integrated graphics D3hot is not necessary to achieve for the host
> > s0ix, like with PSR panel PCI device will be in D0 state as KMS CRTC wi=
ll be
> active and will  held a device wakeref.
>=20
> Then let's also detach the opportunistic s0ix from the runtime_pm with th=
is
> PSR case in mind.
>=20
> >
> > AFAIK for discrete card perspective, host s0ix requires PCIe link to be=
 in low
> power state.
>=20
> yeap, but that's outside of our scope so let's minimize the doc to the ca=
lls
> around the functions that we are implementing here.
>=20
> So, what do you think of this diff between what I had here in this patch =
and
> what I'm seending soon on a v2:
IMO let's keep the documentation limited to PCI PM D3 state, s0ix does not =
belongs here,
gtidle component should document the s0ix dependency and display C states d=
oc should
document the runtime opportunistic s0ix with PSR. Xe_pm is not correct comp=
onent.
Thanks,
Anshuman Gupta.
>=20
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -33,17 +33,9 @@
>   * S4 (disk). The main functions here are `xe_pm_suspend` and
> `xe_pm_resume`. They
>   * are the main point for the suspend to and resume from these states.
>   *
> - * Runtime Suspend (D-States) - This is the opportunistic PCIe device lo=
w
> power
> - * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
> - * `xe_pm_runtime_resume` systems that PCI subsystem will call before
> transition
> - * to D3. Also, Xe PM provides get and put functions that Xe driver will=
 use
> to
> - * indicate activity. In order to avoid locking complications with the m=
emory
> - * management, whenever possible, these get and put functions needs to b=
e
> called
> - * from the higher/outer levels.
> - *
> - * The main cases that need to be protected from the outer levels are:
> IOCTL,
> - * sysfs, debugfs, dma-buf sharing, GPU execution.
> - *
> + * PCI Device Suspend (D-States) - This is the opportunistic PCIe
> + device low power
> + * state D3, controlled by the PCI subsystem and ACPI with the help
> + from the
> + * runtime_pm infrastructure.
>   * PCI D3 is special and can mean D3hot, where Vcc power is on for keepi=
ng
> memory
>   * alive and quicker low latency resume or D3Cold where Vcc power is off=
 for
>   * better power savings.
> @@ -58,12 +50,28 @@
>   * suspend. It will be based on runtime conditions such as VRAM usage fo=
r a
>   * quick and low latency resume for instance.
>   *
> - * Intel systems are capable of taking the system to S0ix when devices a=
re on
> - * D3hot through the runtime PM. This is also called as 'opportunistic-S=
0iX'.
> - * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be
> called for
> - * S0ix.
> + * Runtime PM - This infrastructure provided by the Linux kernel allows
> + the
> + * device drivers to indicate when the can be runtime suspended, so the
> + device
> + * could be put at D3 (if supported), or allow deeper package sleep
> + states
> + * (PC-states), and/or other low level power states. Xe PM component
> + provides
> + * `xe_pm_runtime_suspend` and `xe_pm_runtime_resume` functions that
> + PCI
> + * subsystem will call before transition to/from runtime suspend.
> + *
> + * Also, Xe PM provides get and put functions that Xe driver will use
> + to
> + * indicate activity. In order to avoid locking complications with the
> + memory
> + * management, whenever possible, these get and put functions needs to
> + be called
> + * from the higher/outer levels.
> + * The main cases that need to be protected from the outer levels are:
> + IOCTL,
> + * sysfs, debugfs, dma-buf sharing, GPU execution.
> + *
> + * Intel systems are capable of taking the system to S0ix when all
> + certain
> + * conditions are met. This is also called as 'opportunistic-S0iX'.
> + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be
> + called
> + * for S0ix. In certain cases, like when Display Panel Self-Refresh
> + (eDP PSR) is
> + * active, not even `xe_pm_runtime_suspend` and `xe_pm_runtime_resume`
> + will be
> + * called.
>   *
> - * This component is no responsible for GT idleness (RC6) nor GT frequen=
cy
> + * This component is not responsible for GT idleness (RC6) nor GT
> + frequency
>   * management (RPS).
>   */
>=20
> > Thanks,
> > Anshuman Gupta.
> > > > + *
> > > > + * This component is no responsible for GT idleness (RC6) nor GT
> > > > + frequency
> > >
> > > Isn't it s/no/not/? Or s/no/neither/ + s/nor/nor for/? In any case:
> > >
> > > Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> > >
> > > Francois
> > >
> > > > + * management (RPS).
> > > >   */
> > > >
> > > >  /**
> > > > @@ -178,6 +203,12 @@ void xe_pm_init_early(struct xe_device *xe)
> > > >  	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_init - Initialize Xe Power Management
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * This component is responsible for System and Device sleep state=
s.
> > > > + */
> > > >  void xe_pm_init(struct xe_device *xe)  {
> > > >  	/* For now suspend/resume is only allowed with GuC */ @@ -196,6
> > > > +227,10 @@ void xe_pm_init(struct xe_device *xe)
> > > >  	xe_pm_runtime_init(xe);
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_fini - Finalize Runtime PM
> > > > + * @xe: xe device instance
> > > > + */
> > > >  void xe_pm_runtime_fini(struct xe_device *xe)  {
> > > >  	struct device *dev =3D xe->drm.dev; @@ -225,6 +260,12 @@ struct
> > > > task_struct *xe_pm_read_callback_task(struct
> > > xe_device *xe)
> > > >  	return READ_ONCE(xe->pm_callback_task);  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns 0 for success, negative error code otherwise.
> > > > + */
> > > >  int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > > >  	struct xe_bo *bo, *on;
> > > > @@ -290,6 +331,12 @@ int xe_pm_runtime_suspend(struct xe_device
> *xe)
> > > >  	return err;
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns 0 for success, negative error code otherwise.
> > > > + */
> > > >  int xe_pm_runtime_resume(struct xe_device *xe)  {
> > > >  	struct xe_gt *gt;
> > > > @@ -341,22 +388,47 @@ int xe_pm_runtime_resume(struct xe_device
> *xe)
> > > >  	return err;
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_get - Get a runtime_pm reference and resume
> > > > +synchronously
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns: Any number greater than or equal to 0 for success,
> > > > +negative error
> > > > + * code otherwise.
> > > > + */
> > > >  int xe_pm_runtime_get(struct xe_device *xe)  {
> > > >  	return pm_runtime_get_sync(xe->drm.dev);  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_put - Put the runtime_pm reference back and mark
> > > > +as idle
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns: Any number greater than or equal to 0 for success,
> > > > +negative error
> > > > + * code otherwise.
> > > > + */
> > > >  int xe_pm_runtime_put(struct xe_device *xe)  {
> > > >  	pm_runtime_mark_last_busy(xe->drm.dev);
> > > >  	return pm_runtime_put(xe->drm.dev);  }
> > > >
> > > > +/**
> > > > + * xe_pm_runtime_get_if_active - Get a runtime_pm reference if
> > > > +device active
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * Returns: Any number greater than or equal to 0 for success,
> > > > +negative error
> > > > + * code otherwise.
> > > > + */
> > > >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> > > >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> > > >
> > > > +/**
> > > > + * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie
> > > > +parent bridge
> > > > + * @xe: xe device instance
> > > > + */
> > > >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe)  {
> > > >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -371,6
> > > > +443,13
> > > @@
> > > > void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
> > > >  	}
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_set_vram_threshold - Set a vram threshold for
> > > > +allowing/blocking D3Cold
> > > > + * @xe: xe device instance
> > > > + * @threshold: VRAM size in bites for the D3cold threshold
> > > > + *
> > > > + * Returns 0 for success, negative error code otherwise.
> > > > + */
> > > >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold) =
 {
> > > >  	struct ttm_resource_manager *man; @@ -395,6 +474,13 @@ int
> > > > xe_pm_set_vram_threshold(struct xe_device *xe,
> > > u32 threshold)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_pm_d3cold_allowed_toggle - Check conditions to toggle
> > > > +d3cold.allowed
> > > > + * @xe: xe device instance
> > > > + *
> > > > + * To be called during runtime_pm idle callback.
> > > > + * Check for all the D3Cold conditions ahead of runtime suspend.
> > > > + */
> > > >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)  {
> > > >  	struct ttm_resource_manager *man;
> > > > --
> > > > 2.43.0
> > > >
