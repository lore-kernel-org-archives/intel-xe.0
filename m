Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBB8C83F29
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 05:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3C810E665;
	Thu, 31 Aug 2023 05:23:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A98F10E665
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 05:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693459431; x=1724995431;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xMhVJYcnmVfj4IitGRv6gAwHeCFuCkcxvEzfTZ5i+BQ=;
 b=LEsSCPF4aLsl4uFko8Wcm035IVPkiSahiwahjSW62xc4Sb07Qp8S9Df9
 DNT5hn1gFXUUJWMdJUjKmNCBMK8QNQNoNGzDHEo2/TVvNH4+8I8OWK0ke
 2C3pFjdarz7hId00jfCzDcsM5mLmPh7YF1wL6ZLGN4Wu9ab8y12Jdn19I
 5P4TOz5whi3J9we+MDQ/EcTfHcvIlYrWHmONRU3Avv/ktv+AXRB3rJhYz
 s+PSJUuu+VI8S8bbFzIHwu/J2sSM0ojNE1rM57+YJRWuuO7+thce/rQsS
 OZVEL2MTC80DIf3YrvolmZePaEK/+HHYJHAjBejnOCDXd0IyFfOdqm4jQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="439768651"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="439768651"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 22:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="689178016"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; d="scan'208";a="689178016"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 22:23:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 30 Aug 2023 22:23:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 30 Aug 2023 22:23:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 30 Aug 2023 22:23:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPV55DhXqmzuoeH5n2DNkwyzT1jkwIiJQ0lgoMCpjkVULYIhSeo0khuL9G49mGfH109Izb/IihmFaFsGGNCJbbAlHM/ivagl6RX5+Dyqng1lCUYcbPQCLyzkuXXc7UwXNH8MukCeobQHSedNj4FgSKQsdVCqWZcth80ED9jDIy6EjfZj7Om3HUlN6MyPkWVkTN+S+8WKpUK0pneE/iGqRDCsHVCJSL7lJ3n1v33V0wIownbvokk8OlRff14MDYsFoqXgMxWclaM5pZbYzNG2HtiFr1BVkLtpR68r7pSxC6aNtqJD39kpPXzYaoFO9j5KqP1+oUleqoDtXTJAshkFMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6z18EpTvD/7kxswdb2sgTitcNjb2RqZLeu4Dwf21oI=;
 b=C57Mh+f0DWi3ay1qufN+7s6kiDSljBcUVdnYgwDwDM//5QMZzMJJ1mZM4hjfpC64qMoy8qXrSfC5MdGNdbM13x2gLAHjmMZGzGuFz8Ihjynx2MANU6L1Avd94oLTTpqGumZSBz49qNq1JWi5O2xIBm6mXXGDAwlWyq3gL4ghZlkfc0uFYwGZN3TrqG0Rn/nRCOQFDUHz2qhXhFGqGKPBoq0bJllMSUEh5lYEffLof7lVE1zCCaa0dwBOh1ZEScYZdjCurDh0qIYvV3DVcbi9llsYm7qA56sAHuLRHdpEnEzOj7rAV83yYn+ugiSakCz8KYTUGeSMDJNaarW2oFU+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by CY5PR11MB6234.namprd11.prod.outlook.com (2603:10b6:930:25::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 05:23:40 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::bddf:185b:23c:241%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 05:23:40 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Thread-Topic: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
 suspend
Thread-Index: AQHZ1rH8xVpew1Twn0aVdibZK9Z5xa//U/xAgACYjICAA3FDgIAAhgKA
Date: Thu, 31 Aug 2023 05:23:40 +0000
Message-ID: <CY5PR11MB6211EA7222270115D2E3DCFF95E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230824174618.1560317-1-badal.nilawar@intel.com>
 <CY5PR11MB621124B2BA3F61F7DF797A0C95E0A@CY5PR11MB6211.namprd11.prod.outlook.com>
 <f7e1d567-a7ce-fe10-87d9-3b5c3b104bf6@intel.com> <ZO+u6e06mWzZqX2d@intel.com>
In-Reply-To: <ZO+u6e06mWzZqX2d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|CY5PR11MB6234:EE_
x-ms-office365-filtering-correlation-id: e23ba82b-082f-450c-f75f-08dba9e26f93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NKDP+ccvi/uXQD4iWBuGguzGeBVVxL9Z9YWjgFp+vcbDC6rXByHSyOWdWP19Za7RUX8CeQVIb9rwkkJy6zNEEkXTB2inyf9HX16YcamAGoY/HNJeDLCIRZRfyTA5CdOrQ3dOkUgSpP9sXRJvovmQKiNKwSOIl53JUdEW48JBrQ2unSM5Hsfowrl6vtUurG64MDuXonSHOyKw2DstvoR5A6t/jl264dahDwSzAQL45CC72g3gWUZC2z1F+Wix2y2h1SAfNogGFm2PFJ/Z0rdG6quL2mTBI/uTVaQtDNUVcEE4r4M1H278z6trjHjWCduv8j/FH1sVHYzu+qA6+sS3uA3MCTbFhSzDuBmBFipxOT5wyye8llMRUtbckNAWBD/resng67uqFARrbup3NSCJV1ZIj8zl+QGXLER0+1AlE2vNvwZYVzirox8MopP5hqvKTc33W7BQBqGAnOdaBJfkVbDJdG68BXbAu6y+2eObqWSag50k2Gk5YigZyyQLu3chJSMrdGfxmNyIp9ifKB5XBo9cQ42YdCW12hz3N6WAPYh6qzwsCdnXu+tzRf7ebU5Z1ygkgYyp3ts7Kg/wS3EROf8ayKQl8vxvwpnZs82QO/9IZdpICDatpTWzHdWcGEiz
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199024)(1800799009)(186009)(7696005)(9686003)(6506007)(71200400001)(4326008)(38100700002)(33656002)(38070700005)(86362001)(82960400001)(76116006)(107886003)(2906002)(122000001)(55016003)(52536014)(30864003)(8676002)(26005)(478600001)(53546011)(15650500001)(110136005)(83380400001)(41300700001)(66556008)(66946007)(5660300002)(8936002)(66476007)(66446008)(54906003)(64756008)(316002)(6636002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WlOD8GmTS0qJKj6oVRecYp4MhqXj9vnYJkpSfsyvk7TDxwG79AwA62iJJneG?=
 =?us-ascii?Q?DmicPaAFIFVFcBIaO/ioeVNnAbu0/J/yxeHP9k8XhXtgUq+LlkdripTaJVC8?=
 =?us-ascii?Q?7jh/78S2dPdu6xgvNU6FckUw1yS30HbBK4CIUFvVsMeUjL4uLnZ8YlQagdjI?=
 =?us-ascii?Q?dTiwe+JKXcEbZtUbJVT3Lq9qlx94yGSWGsldSGQpWg/c+yMo/5ILSF8wLQo8?=
 =?us-ascii?Q?9RAG5VRlzDneP/TmxKbiyHmBRZui8y6UH1APAQ6DGmT0K9g/aI0QOzDzeZbk?=
 =?us-ascii?Q?l6AkSRPVkSfl0OFoM2EozafZTa+DBLcrn/Ht2OPGGl33t0Nq7cHlEGwwIIwa?=
 =?us-ascii?Q?1exb9KlfChRpbPidHka6C8iZVXMTtQp8eQvu6+PlsEKTNzFwUwufu9BIgQcX?=
 =?us-ascii?Q?KFODl9iqTmNJjJGpVKGC16w+XKlbWqEopjH7xlus34yH7izfsk5rV7FBm9vH?=
 =?us-ascii?Q?kZ4GEj+XplBCzn526pHRzrKdDG9PCTYf10ZnpRf4klM+VpbXY0CsrZgCL6PM?=
 =?us-ascii?Q?pqam/esLj/pa43tF9u285CF+KOxLUzEOm/ic4ZRd7blWOo45czaVVIb3+MPZ?=
 =?us-ascii?Q?I3kev6sjp4Clgd2alE8kvfvTgJO06bS84eqGA4I0OA+mW0BGhZ2ML3faheG0?=
 =?us-ascii?Q?K2fJYaTO1DO90Nvl5Lm9Q4HukDEAjveg6gW3fGt1mCIL/Y5ii3X/bgLPQk9i?=
 =?us-ascii?Q?eabeUjcRLhUFF2FmzyITRpshZKIzxIp23HHS7JmjzWa+vpa/quK0yjGjPr8n?=
 =?us-ascii?Q?b8D7buaJ9zMYwBPal29a+pjK3hkv58HgkBLGs8fWWxMN9BfetWkzwOgae4BI?=
 =?us-ascii?Q?l40LmOSewno6yUvUy/+6H3iCxX0CZy3QeZUYavUqdGdvJfDXoCWu6KLJZ9Jd?=
 =?us-ascii?Q?7dsHufPUs6n40gUcUT4HUVpOdh4N/UuRf0DQIzXMHaUcXkorUfhtT5CobB34?=
 =?us-ascii?Q?zmGch1dPA++Lwi2TyhJUwWsXUdTRKKCWl/e6/okb+r/x326ildnYS5BvOqWm?=
 =?us-ascii?Q?zukP7yBJSKEVHYRhTAzi/dczFGsL4Pbc++O+hDkQIIZATKvA++d2SzZrqnV9?=
 =?us-ascii?Q?aBR5oaobdtgga96Q/rAfeRzF8EJAd2v7DEm/8AVv4N7TN0NQdXpCeMWTYqqr?=
 =?us-ascii?Q?mrpekbDjEvB9BNFV3aYz7vnWMEFCEbK2eBY42mHVFuL/hg8iCp6CmXk2UsA9?=
 =?us-ascii?Q?+7OJy7HtgPv16iYPFG2RPbfnrB00CuQZDEq3q4JLlBkrE1IqXQ9SIkj4IHuS?=
 =?us-ascii?Q?OzaAIgBTn0spCHXGJRQSvkN3jTmvPQ+DAFsPIxdf0+4cUnxBTQqxO5FXCpcS?=
 =?us-ascii?Q?jHlW24Z9PMAhOOi/krLnWS2a4QypmZTf/QjB4904kIZ0S1EMqm8agQXENwg8?=
 =?us-ascii?Q?uEjL+3BNh6SbZzlFRz5SuWrHEJL30q1Urn5mPWKDClbjSdNHlfm5bAVlNses?=
 =?us-ascii?Q?cur7Ovk0NhwMX0wyNH1Ur3wLB7a2HojIDL431yFamNBw3DSSz0FI3R5b0DwC?=
 =?us-ascii?Q?McnxtetKDTk7Bt9I3+Ap5zIjUo0izeyKJnEiyIkZ/4N/HGdLpbKxJQJX/aiD?=
 =?us-ascii?Q?eLeppQF2zwJyb/ywV9lraj5TPR7/tGjVkxg8iSjk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23ba82b-082f-450c-f75f-08dba9e26f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2023 05:23:40.2551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PK6lzoqxUapIoojA1O4E85wzVnfHX7oPQ22jHJQtq7hrYDbu0dQXl0zKs/uhOvJ5KUs/b5kncWj+uKbhCnN2Dsw38T5wnNRVkqhRR8oArlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6234
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings on
 rpm suspend
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, August 31, 2023 2:35 AM
> To: Nilawar, Badal <badal.nilawar@intel.com>
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
> xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com>
> Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/dgfx: Release mmap mappings
> on rpm suspend
>=20
> On Mon, Aug 28, 2023 at 10:00:31PM +0530, Nilawar, Badal wrote:
> >
> >
> > On 28-08-2023 17:46, Gupta, Anshuman wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Nilawar, Badal <badal.nilawar@intel.com>
> > > > Sent: Thursday, August 24, 2023 11:16 PM
> > > > To: intel-xe@lists.freedesktop.org
> > > > Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Auld, Matthew
> > > > <matthew.auld@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
> > > > Subject: [RFC PATCH] drm/xe/dgfx: Release mmap mappings on rpm
> > > > suspend
> > > >
> > > > Release all mmap mappings for all vram objects which are
> > > > associated with userfault such that, while pcie function in D3hot,
> > > > any access to memory mappings will raise a userfault.
> > > >
> > > > Upon userfault, in order to access memory mappings, if graphics
> > > > function is in
> > > > D3 then runtime resume of dgpu will be triggered to transition to D=
0.
> > > IMO we need a configurable threshold to control the behavior of mmap
> > > mappings Invalidation, if vram usages is crosses to certain
> > > threshold, disable the runtime PM for entire life time of mapping.
> > Agreed. Other option could be disable rpm on server descrete graphics
> > for entire life time of mapping. But mainitaning threshold is more
> > promising and gives control to user.
>=20
> what use cases we have here for this?
> I believe that for discrete we could entirely block rpm if we have displa=
y or if
> we have shared dma_buf. any other case we should handle?
If Discrete is used for display then anyhow display is going to block runti=
me PM completely(be it PSR or Non-PSR).
The use case is with display turned off or with hybrid gpu use case.
Currently on Xe we are missing to have mem access ref count on mmap mapping=
 and therefore mmap for vram bo is broken.
dma-buf will be also the use case in hybrid gpu use case.

Thanks,
Anshuman Gupta.
>=20
> >
> > Regards,
> > Badal
> > > Thanks,
> > > Anshuman Gupta
> > > >
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > > > ---
> > > >   drivers/gpu/drm/xe/xe_bo.c           | 53
> ++++++++++++++++++++++++++--
> > > >   drivers/gpu/drm/xe/xe_bo.h           |  2 ++
> > > >   drivers/gpu/drm/xe/xe_bo_types.h     |  6 ++++
> > > >   drivers/gpu/drm/xe/xe_device_types.h | 20 +++++++++++
> > > >   drivers/gpu/drm/xe/xe_pm.c           |  7 ++++
> > > >   5 files changed, 85 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c
> > > > b/drivers/gpu/drm/xe/xe_bo.c index 1ab682d61e3c..4192bfcd8013
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -776,6 +776,18 @@ static int xe_bo_move(struct
> > > > ttm_buffer_object *ttm_bo, bool evict,
> > > >   		dma_fence_put(fence);
> > > >   	}
> > > >
> > > > +	/*
> > > > +	* TTM has already nuked the mmap for us (see
> > > > ttm_bo_unmap_virtual),
> > > > +	* so if we moved from VRAM make sure to unlink this from the
> > > > userfault
> > > > +	* tracking.
> > > > +	*/
> > > > +	if (mem_type_is_vram(old_mem_type)) {
> > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > +		if (!list_empty(&bo->vram_userfault_link))
> > > > +			list_del_init(&bo->vram_userfault_link);
> > > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > > +	}
> > > > +
> > > >   	xe_device_mem_access_put(xe);
> > > >   	trace_printk("new_mem->mem_type=3D%d\n", new_mem-
> > > > > mem_type);
> > > >
> > > > @@ -1100,6 +1112,8 @@ static vm_fault_t xe_gem_fault(struct
> > > > vm_fault
> > > > *vmf)  {
> > > >   	struct ttm_buffer_object *tbo =3D vmf->vma->vm_private_data;
> > > >   	struct drm_device *ddev =3D tbo->base.dev;
> > > > +	struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > +	struct xe_device *xe =3D to_xe_device(ddev);
> > > >   	vm_fault_t ret;
> > > >   	int idx, r =3D 0;
> > > >
> > > > @@ -1107,9 +1121,10 @@ static vm_fault_t xe_gem_fault(struct
> > > > vm_fault
> > > > *vmf)
> > > >   	if (ret)
> > > >   		return ret;
> > > >
> > > > -	if (drm_dev_enter(ddev, &idx)) {
> > > > -		struct xe_bo *bo =3D ttm_to_xe_bo(tbo);
> > > > +	if (tbo->resource->bus.is_iomem)
> > > > +		xe_device_mem_access_get(xe);
> > > >
> > > > +	if (drm_dev_enter(ddev, &idx)) {
> > > >   		trace_xe_bo_cpu_fault(bo);
> > > >
> > > >   		if (should_migrate_to_system(bo)) { @@ -1127,10 +1142,25
> @@
> > > > static vm_fault_t xe_gem_fault(struct vm_fault
> > > > *vmf)
> > > >   	} else {
> > > >   		ret =3D ttm_bo_vm_dummy_page(vmf, vmf->vma-
> > > > > vm_page_prot);
> > > >   	}
> > > > +
> > > >   	if (ret =3D=3D VM_FAULT_RETRY && !(vmf->flags &
> > > > FAULT_FLAG_RETRY_NOWAIT))
> > > > -		return ret;
> > > > +		goto out_rpm;
> > > > +	/*
> > > > +	 * ttm_bo_vm_reserve() already has dma_resv_lock.
> > > > +	 * vram_userfault_count is protected by dma_resv lock and rpm
> > > > wakeref.
> > > > +	 */
> > > > +	if (ret =3D=3D VM_FAULT_NOPAGE &&
> > > > xe_device_mem_access_ongoing(xe) && !bo->vram_userfault_count)
> {
> > > > +		bo->vram_userfault_count =3D 1;
> > > > +		spin_lock(&xe->mem_access.vram_userfault_lock);
> > > > +		list_add(&bo->vram_userfault_link, &xe-
> > > > > mem_access.vram_userfault_list);
> > > > +		spin_unlock(&xe->mem_access.vram_userfault_lock);
> > > >
> > > > +		XE_WARN_ON(!tbo->resource->bus.is_iomem);
> > > > +	}
> > > >   	dma_resv_unlock(tbo->base.resv);
> > > > +out_rpm:
> > > > +	if(tbo->resource->bus.is_iomem &&
> > > > xe_device_mem_access_ongoing(xe))
> > > > +		xe_device_mem_access_put(xe);
> > > >   	return ret;
> > > >   }
> > > >
> > > > @@ -2108,6 +2138,23 @@ int xe_bo_dumb_create(struct drm_file
> > > > *file_priv,
> > > >   	return err;
> > > >   }
> > > >
> > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo) {
> > > > +	struct ttm_buffer_object *tbo =3D &bo->ttm;
> > > > +	struct ttm_device *bdev =3D tbo->bdev;
> > > > +
> > > > +	drm_vma_node_unmap(&tbo->base.vma_node, bdev-
> > > > > dev_mapping);
> > > > +
> > > > +	/*
> > > > +	 * We have exclusive access here via runtime suspend. All other
> > > > callers
> > > > +	 * must first grab the rpm wakeref.
> > > > +	 */
> > > > +	XE_WARN_ON(!bo->vram_userfault_count);
> > > > +	list_del(&bo->vram_userfault_link);
> > > > +	bo->vram_userfault_count =3D 0;
> > > > +}
> > > > +
> > > > +
> > > >   #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> > > >   #include "tests/xe_bo.c"
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h
> > > > b/drivers/gpu/drm/xe/xe_bo.h index 0823dda0f31b..6b86f326c700
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -247,6 +247,8 @@ int xe_gem_create_ioctl(struct drm_device
> > > > *dev, void *data,
> > > >   			struct drm_file *file);
> > > >   int xe_gem_mmap_offset_ioctl(struct drm_device *dev, void *data,
> > > >   			     struct drm_file *file);
> > > > +void xe_bo_runtime_pm_release_mmap_offset(struct xe_bo *bo);
> > > > +
> > > >   int xe_bo_dumb_create(struct drm_file *file_priv,
> > > >   		      struct drm_device *dev,
> > > >   		      struct drm_mode_create_dumb *args); diff --git
> > > > a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > index f6ee920303af..cdca91a378c4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > > > @@ -68,6 +68,12 @@ struct xe_bo {
> > > >   	struct llist_node freed;
> > > >   	/** @created: Whether the bo has passed initial creation */
> > > >   	bool created;
> > > > +	/**
> > > > +	 * Whether the object is currently in fake offset mmap backed by
> > > > vram.
> > > > +	 */
> > > > +	unsigned int vram_userfault_count;
> > > > +	struct list_head vram_userfault_link;
> > > > +
> > > >   };
> > > >
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index 750e1f0d3339..c345fb483af1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -328,6 +328,26 @@ struct xe_device {
> > > >   	struct {
> > > >   		/** @ref: ref count of memory accesses */
> > > >   		atomic_t ref;
> > > > +		/*
> > > > +		 *  Protects access to vram usefault list.
> > > > +		 *  It is required, if we are outside of the runtime suspend
> > > > path,
> > > > +		 *  access to @vram_userfault_list requires always first
> > > > grabbing the
> > > > +		 *  runtime pm, to ensure we can't race against runtime
> > > > suspend.
> > > > +		 *  Once we have that we also need to grab
> > > > @vram_userfault_lock,
> > > > +		 *  at which point we have exclusive access.
> > > > +		 *  The runtime suspend path is special since it doesn't really
> > > > hold any locks,
> > > > +		 *  but instead has exclusive access by virtue of all other
> > > > accesses requiring
> > > > +		 *  holding the runtime pm wakeref.
> > > > +		 */
> > > > +		spinlock_t vram_userfault_lock;
> > > > +
> > > > +		/*
> > > > +		 *  Keep list of userfaulted gem obj, which require to release
> > > > their
> > > > +		 *  mmap mappings at runtime suspend path.
> > > > +		 */
> > > > +		struct list_head vram_userfault_list;
> > > > +
> > > > +		bool vram_userfault_ongoing;
> > > >   	} mem_access;
> > > >
> > > >   	/** @d3cold: Encapsulate d3cold related stuff */ diff --git
> > > > a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c index
> > > > 0f06d8304e17..51cde1db930e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -172,6 +172,8 @@ void xe_pm_init(struct xe_device *xe)
> > > >   	}
> > > >
> > > >   	xe_pm_runtime_init(xe);
> > > > +	INIT_LIST_HEAD(&xe->mem_access.vram_userfault_list);
> > > > +	spin_lock_init(&xe->mem_access.vram_userfault_lock);
> > > >   }
> > > >
> > > >   void xe_pm_runtime_fini(struct xe_device *xe) @@ -205,6 +207,7
> > > > @@ struct task_struct *xe_pm_read_callback_task(struct xe_device
> > > > *xe)
> > > >
> > > >   int xe_pm_runtime_suspend(struct xe_device *xe)  {
> > > > +	struct xe_bo *bo, *on;
> > > >   	struct xe_gt *gt;
> > > >   	u8 id;
> > > >   	int err =3D 0;
> > > > @@ -238,6 +241,10 @@ int xe_pm_runtime_suspend(struct xe_device
> *xe)
> > > >   	 */
> > > >   	lock_map_acquire(&xe_device_mem_access_lockdep_map);
> > > >
> > > > +	list_for_each_entry_safe(bo, on,
> > > > +				 &xe->mem_access.vram_userfault_list,
> > > > vram_userfault_link)
> > > > +		xe_bo_runtime_pm_release_mmap_offset(bo);
> > > > +
> > > >   	if (xe->d3cold.allowed) {
> > > >   		err =3D xe_bo_evict_all(xe);
> > > >   		if (err)
> > > > --
> > > > 2.25.1
> > >
