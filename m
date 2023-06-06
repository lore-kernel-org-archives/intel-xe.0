Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3018C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A674910E13A;
	Tue,  6 Jun 2023 13:22:13 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC02110E13A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686057731; x=1717593731;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G1dn9FZnf0h8qBRVc3QGQfvNz2urHyZHC7D/q7hkm6A=;
 b=ZwOji+KJgLrSuu6iI/GLGNfpHtf9V/fzMNV2sb3A05Ffwij+4b8Lslb8
 MYtcODcLqizVxorllzllMorULqjzQn0ezcPQcWVmsqrUbBaUYoDmS5sYs
 iXFMMBW9mV2P4iMOE3PGkJRutdASSuIvZ9Spr8nDF1wBxddeZqMMzWmlV
 MtordwCCj9GdpIRSKnugGjKFGycqvWvNjTzmSy1y54DXNWHl6uQ6na3nw
 yjV/0KvhaqEl4EdqaRtThbvphzBoR6Q72E4zADInF7HBXS0fVJXB97T47
 6Ad83/Zoh3xmiJ0uGa3fcI4OoGc1rwN47A8VI5MmhaFU7jdDNU60bb9pn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="422496065"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="422496065"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="798844319"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="798844319"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 06 Jun 2023 06:18:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:18 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:18 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:18:18 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH8GotpzxZRnUGpeCFGWnaeIHeW5JUW3Leak8amVsy2RHxPOh1LsORo8esmapW5GFWlCtO3jsWeKeVbJ1jGM2VTgZN3wnSs5wPufQDJVh+S1zQI1cp3n5+L3i+n6tzYWFHr03nTOcyEYcZQgKgkAPjUKnRfLmUdns+D9aGmQzcD3mJrdKQsaAeg4lin5FTj9Ekv9k+ygPh4Jh8gX+w+OAfHH9axxcqvTozelFV+FXLNHRO88MLLkCe4WdPZ/FEM/FT19Uf3AazcJ36p19f4+4aM5KIAox3GQcsuIlA0XMLhYkw8/PqL+04Eu8XAigIMo0SkGpg7w4Go+4kpeJzv4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcIHUsJ9MuRsV+2+Zi4Oe/RODXmHdTYJcWGbFQQ0mEA=;
 b=KPidob27dfb4gItLMx9rQtFezBy468LJGDq/9qowSx4EcCKiMknbeTcR8E7fSbGqdrUea5NnMlmouj/g6kz4QQOmpKfViWFIMw2ezqW9hBaV2A9nvca7Wv0O5F0C5BLkwxTi9kd8pyWXEbj7lgArZsmqoWpl53Xs/Xc81aSm9UavqAEFNIkHJqHF3Q0qBx8Yx1H2xs6UCTjYqFYCNYHZ07ZvZxSgfygkSWyKECQyBygqOGbUQkv1Y4rkRQDScfY4qI2ZqcM+4azOoGOuh6A8vQWRQ6DhPPU0eggbhKqYyuYND87aD+SXlP7YHlDL02Jb/JUWLPF/Nz/gJ/jYEjPXwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB7051.namprd11.prod.outlook.com (2603:10b6:510:20e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 6 Jun
 2023 13:18:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 13:18:16 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcndoX+xMJhwEqU0lzS0RGA9K99pBLQgAASFICAAAWnoIAAA9EAgAABS3A=
Date: Tue, 6 Jun 2023 13:18:16 +0000
Message-ID: <MW4PR11MB70560C2E0EA2EBBA0B960EABB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|PH7PR11MB7051:EE_
x-ms-office365-filtering-correlation-id: b1214bc7-38a9-41be-95b5-08db66907d1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s3iGb5v+FYZKzI6BeQeeKpBstht9+GY99KMoYOeYcLJk+cA5TNuBVqoOd0exdkNMlA9hktOXwftXNpMuE4C/Pa3+NlltSFUqFxwD6AG7QY6HDTiJ9wPjhN1OuUwUNJ9IgndUNuzwvE8CsyrTtw4dtBgwL9leLIh9bzjUsgjr7QpJhyx6OmRrOveUCH+YQWIC7hLlk8Mc2QeBrlhrcNGCTVDf9diWp/doambWUTOnSUSBd9i/gdnrn17NaQ4Ymr5xk/GmIR7p6vr0qw1xkzY45sZ+wHm5v/IjFB+6YONts+cIEgwlKFpxtxQBQXoAIIBzrFscYugbFKoXgYBewsLlQQbx/b3ufQ7uTvYXSaQVrkLL4do9cUOawpbgeR4ZRRHvZBk/8SCIzgU43H+Nwy8FwVGlUsZLre+Hxz7+OcKON9N1LsDTlSE/8YkDvQTSKx15I3bwTj1zlg629V1drKcEfXeqwimiJeOFEDLvHo31MGqQpbgEt9YaGSaQ4/xq4vTv5lgi2qnGJssU0vPttZcbb96aX9bVLvd1RGW4gorp7JmDOJOBh7IORn1AGmovqs+FixLtlhA9jOFZOHuGIeARtHgUJ4WFI/qA8sLAoqVIxxS8K/m8vROhQrUS818Z/x5R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199021)(9686003)(186003)(6506007)(83380400001)(55016003)(53546011)(2906002)(2940100002)(316002)(38070700005)(64756008)(76116006)(66556008)(7696005)(38100700002)(110136005)(41300700001)(82960400001)(33656002)(478600001)(122000001)(26005)(66946007)(66476007)(71200400001)(66446008)(86362001)(8676002)(5660300002)(8936002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3dL0cVmRhI7sr9i9glVA8UwrxbaZY2Ns94SNEjDSc4uzSC+E8KAmfql3GB7g?=
 =?us-ascii?Q?Fdc5OQXheP+Otx4eQKY5Tfl2wwtieO0d4PlWdSLyJ63A8fyENF7Xj8E+BCcc?=
 =?us-ascii?Q?v0UGmt1Lx8R73cp0suOrm7LZeArHwhmvGjYQf55PqqiFk0gm9VZo5Ac87fOk?=
 =?us-ascii?Q?CrU8KAkd48XWeIm7vd/wvRIHQBYb5TujI5UkCnZrhYvPU2JSdfKb1kP+8psu?=
 =?us-ascii?Q?+d9qOdoJFOXPwInt7ycOXnLezqukuIr9CXFVo/9+rYQfSsg98OPDtRufq9Mx?=
 =?us-ascii?Q?u5pchodpKDhXbNwDz8dfHQuNLG00PofEoePCTC7a4Xxj1FPRSGDdVQaiyb+5?=
 =?us-ascii?Q?W5EOVTdptkTAqswbF0NrEMtiF4/6DkcqyR18YlU5xzOoIuKJbVw7ZzFg1veW?=
 =?us-ascii?Q?q2e52fYczbGyJWzv4YKpBZ1y3pODbCRqy3OEAnuEXdwxUXp284FVJ0+dNfb6?=
 =?us-ascii?Q?cl8ZaOe4CiaHX+U7JJW2PtjHkaoZOktIsxSuLUAeSy233Ha+LQzmnM7I4gX1?=
 =?us-ascii?Q?Uo2lFSVfCpDv51ODmm47OqBbNGkHCRrIQEZ1ZZuXXBRi9PT69elos/AsW+6a?=
 =?us-ascii?Q?3ZZ8sPoKfzTw3LxnQ+YI1yHI95i0YaUe6AEi4kOyMfW/ldabZkxBlZgmRMxo?=
 =?us-ascii?Q?hPlYFzVOugQdf7k5UizlI1HWx9thLGSfNjy8ZDX8AqidOCW/SlT25yRaKvVB?=
 =?us-ascii?Q?c1GxGnpSWpG+mOlmfEy07WaCrF5JOEB52svJA/T9ucIucXuQOGcibbVmMEst?=
 =?us-ascii?Q?tp0ZHmZjeZAsF5ya2MExuTmqaoCVaoclgGcQCp8OnTHuoon2NI4dUg//vb8w?=
 =?us-ascii?Q?KVpCJXei70k9TFFa1jntSFVNK373mnUWzGbsh5L9WnRPcBfQLLh1n1Ic962N?=
 =?us-ascii?Q?fKOwUjDKaOdvfBcsf/2kL/DGwHsuNJ9DTWpIjSoCNpGnRslFsjrh40QitDG2?=
 =?us-ascii?Q?ckFlDeDXVq3eZlT4GADw0w65uFHuacJfJr3jtKpPJvB2eIeYBqqdC3hFQxRg?=
 =?us-ascii?Q?I5R++Wm1Sr91eLE3DKec1EeuzqOhxv+934QVrZQGRDiFjCFvL4+PgFtlEFKQ?=
 =?us-ascii?Q?RkGcW9jZyKyBXp+oq9Ds+9I1eCbttsIBvVrSKCKjUmkK+cHjgg/wOD9T7xLX?=
 =?us-ascii?Q?n1EqMM4+hSjclxXoZ1Gn28dIYQ2+HIW0ZS3rQMBe6lreJ4wsvLHBb3LEe48W?=
 =?us-ascii?Q?dnWl1PXiROi+/PO/TQdpY2nkwx91XAoAYkzAmq0VsAP1l32DpsrSdR+IRFQd?=
 =?us-ascii?Q?GgmGAqK5LbkuchzsDvKVdEXeFn6hTlgXhIAGu/EB4uF7C8anKoa2DKtCdic5?=
 =?us-ascii?Q?LWfyPcY3ApDEhU1PY90rxY30EVwKNteXIet8V1S5qd2BXoGhrJ494AVo727D?=
 =?us-ascii?Q?MRQiS0ZOTqZ/b3RmES/XYEkkSvMXz4RYiyTrkyleYBj8b7uzay3ONNUHKun6?=
 =?us-ascii?Q?NVzYm8fULKXfoWNiNpSCcb5V/B6XglNAtuYryhHZgXTN8IgQtOHabXSbQqh0?=
 =?us-ascii?Q?qhjgGx7ddgeP9MoCVLGIkCg0A9hBnKnMOVRVhuoXISCBTPF3BrDHPAJdiDAj?=
 =?us-ascii?Q?j7EpJ9q+1I5IG9OwYK9CSNexx0av2OE1w7MgQ8UNuD+DE9Rz0tLfwMuvG+rb?=
 =?us-ascii?Q?6g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1214bc7-38a9-41be-95b5-08db66907d1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:18:16.3375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w6b/1oel4lLnlwgb+1Sk0oFjWao/AtcGvLJszVXZMO6kSLhSc++8qZqbR7EI8NSe1xiTsoFebiYK3+GhDESb40a5AWEs4CYdP6iHA43p0s8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7051
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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
> From: Ghimiray, Himal Prasad
> Sent: 06 June 2023 18:42
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad
> > Sent: 06 June 2023 18:28
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Sent: 06 June 2023 18:06
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > xe@lists.freedesktop.org
> > > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > report per tile memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Tejas Upadhyay
> > > > > Sent: 06 June 2023 16:43
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > > report per tile memory size
> > > > >
> > > > > Add sysfs entry to read per tile physical memory including
> > > > > stolen
> > > memory.
> > > > >
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > > ++++++++++++++++++++++++++++
> > > > >  3 files changed, 53 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index db61da4d6212..7b5443aebd00 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > > >
> > > > >  	/** @mem: memory management info for tile */
> > > > >  	struct {
> > > > > +		/**
> > > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > > +		 * including stolen mem for tile
> > > > > +		 */
> > > > > +		resource_size_t actual_physical_mem;
> > > > >  		/**
> > > > >  		 * @vram: VRAM info for tile.
> > > > >  		 *
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device
> *xe)
> > > > >  		if (err)
> > > > >  			return err;
> > > > >
> > > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > > tile_offset;
> > > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > index 821bd49de277..d48c599e8cc1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_typ=
e
> =3D {
> > > > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > > > >  };
> > > > >
> > > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > > +device_attribute *attr, char *buf);
> > > > > +
> > > > > +struct xe_ext_attr {
> > > > > +	struct device_attribute attr;
> > > > > +	show xe_show;
> > > > > +};
> > > > > +
> > > > > +	static ssize_t
> > > > > +xe_sysfs_show(struct device *dev, struct device_attribute
> > > > > +*attr, char
> > > > > +*buf) {
> > > > > +	ssize_t value;
> > > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct
> > > > > +xe_ext_attr, attr);
> > > > > +
> > > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > > +
> > > > > +	return value;
> > > > > +}
> > > > > +
> > > > > +	static ssize_t
> > > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > > +*attr, char *buf) {
> > > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > > +
> > > > > +	return sysfs_emit(buf, "%pa\n",
> > > > > +&tile->mem.actual_physical_mem);
> > > > > }
> > > > > +
> > > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name,
> 0444,
> > > > > +xe_sysfs_show, NULL), _show}
> > > > > +
> > > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > > +
> > > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > > +	&dev_attr_addr_range.attr.attr,
> > > > > +	NULL
> > > > > +};
> > > > > +
> > > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  =
{
> > > > >  	struct xe_tile *tile =3D arg;
> > > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > > > >
> > > > >  	tile->sysfs =3D &kg->base;
> > > > >
Limit sysfs creation for dgfx only to avoid unnecessary failure logs in cas=
e of igpu.=20
And better to name sysfs as vram_addr_range.

BR
Himal=20
> > > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > > +			"Setting up sysfs to read total physical
> memory per
> > > > > tile failed\n");
> > > > > +		goto err_object;
> > > > Will do kobject_put and return 0. Which is wrong.
> > > > Better to do kobject_put and return err here.
> > >
> > > I don't think I have any action to do based on error, clean up was
> > > already done. Am I missing something here?
> >
> > In case of sysfs creation failure, you goto err_object do the cleanup
> > and return 0.
> > Should you be returning 0 incase of sysfs creation failure ?
> > >
> > > Thanks,
> > > Tejas
> > > > > +	}
> > > > > +
> > > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > > tile_sysfs_fini, tile);
> > > > >  	if (err)
> > > > >  		return err;
> > > > >
> > > > > +	if (0) {
> Doesn't make sense if disabled for default. Move to sysfs creation failur=
e.
> > > > > +err_object:
> > > > > +		kobject_put(&kg->base);
> > > > > +	}
> > > > >  	return 0;
> > > > >  }
> > > > > --
> > > > > 2.25.1

