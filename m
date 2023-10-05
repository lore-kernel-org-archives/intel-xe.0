Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3764E9270E
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 15:26:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF00E10E41F;
	Thu,  5 Oct 2023 15:26:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC99910E41F
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 15:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696519614; x=1728055614;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hYCB0xyp5XxnYzbn87iiPniEpdTTnQcleN2CNyij+Q0=;
 b=MThij/za5tudMUNk9bDMO6c6fGfXWXjaHa8Vcmah/rmGSisOrmAFx7eR
 iSpuXmv/OE5FVBGljsAJL1QxL7Q9dgS9BcCfZ+d2V7y3MSVV/niDJVI4c
 4AlNjuxT2VKSynFF6EhxlopM1UYIfaGBf3eQ2PZbGiOQdq5vdTi5fINZP
 93DNUAFSG8tfdqBmuYyEOOjFZrsDXzD7XVCtrRtxBY5imCTjgok60j7Yx
 fyu9SN4J+ZACC7+JkSkQtcXNnMIb2ybJiojuJeYDauRYIoWYT/GMn+LIV
 2JD7YUzCPWmuOINK4w55epYAGAEAFqevDfH33Qv1O0fchDx5kkvarPGoe A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2132868"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2132868"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 08:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="842449015"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="842449015"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 08:26:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 08:26:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 08:26:52 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 08:26:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJMUl+62cVEvImjgNJIO2Aj0D56firhLUkOjR4gIlTU7Hn2YY2QhuOtpZpxZJh1p6NfwimXd4EmSZ5f0kfcJHuPnwjs8nWWiq2BcyXMLxWxuU4IJsglAtYtGGfBB7t+GlBQPV5Idb491ZZpTQLgpK09+egWMB8hFthpto+QKHrCpBA2ocHw2nlZhCIzjBYPMUjsTB97PD2dC5T+GInVnJodpM7RwPALguV/LfgCj2D0iZIX40vr9nRAPEvHQazyNhJqyO9vhAfZYrOVZ0ikD697olqJbyx21ZzrdpSRVj9IEb5wJshewOunJN7GydirxlS0mJqX51h2AC4omRYp7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpDrPqiaj4EXEo3HAyo+Nn4WilTN5TTAjjbhz8yPsAw=;
 b=jjRhUtY7tKfJGp57ld/2niPunq7VwH/q8uxTq/b5S6+Am0aBYYyw8D55FzvzSZx+drChVejE7urqAewQSCsvkF1yY+57K3GStMt5JH9gsQqr9vZkgg4+6Kj8rRbgAbVUN+Z6mtKZzunu3ItsVJL+MlTDDPGh2LwgggKt7M1PdGEOtFaXcqtJZqr8t7SImN8T0wnEhAwaQMncjvDH/HH2t6vbGuZZzv8x5EtbQ3vzWNdjHJh0cjO0BJ2dVYsWmx/SRjSxa7bHZMgpqioEIPC2w/i2U0wT3HA9gh7mWJHn4Dn2Tvgn1gKv2/C9MbEnUFF6KY/HV0xOxXT1yk3O+3sbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by PH0PR11MB5175.namprd11.prod.outlook.com (2603:10b6:510:3d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Thu, 5 Oct
 2023 15:26:51 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::d205:bbb8:b281:af59]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::d205:bbb8:b281:af59%6]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 15:26:51 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
 count
Thread-Index: AQHZ9p+UUd2ubXmmg0GbEjNY19m7r7A5z3UAgAGAKuA=
Date: Thu, 5 Oct 2023 15:26:50 +0000
Message-ID: <MW3PR11MB4748563072E5947514D726C2AECAA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231004085138.1825175-1-janga.rahul.kumar@intel.com>
 <ZR2QPM/V8p5+5cb3@intel.com>
In-Reply-To: <ZR2QPM/V8p5+5cb3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|PH0PR11MB5175:EE_
x-ms-office365-filtering-correlation-id: f529b4c5-571b-49b8-d138-08dbc5b77f60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y/r3MW5R7HaaPmA3i1RnZySSGFs3c/ZNuPPmycQV+OXweiJg8aKoGqvrilKvJXCjUU5Qa0NdQGAB8GnvrgORGdJCxvSicIdAiI6sM+2RZVsybbCWoaTWGjAuf+6jIwivT5tGAXmM3cmTEqc7eEcDBZM9jd6LIlTLjSfM7wJGPTRJYX2wlp3r2K0YPAmUl2x5y15p60ZGtCP6eofBvId4QXlDugywZL4KAyhCCOfnbzhdCB/S4avHFIAf/Y3SOzR16IN10Xu5VWjEtbP+KgE6yekbyzrulc+/7b9F+cl9+8lDpO1UQZIj7SxQZ1e8Oo9mr4v7XuP/TdTXOqMnwWeM9JS8KrcRsysk8Uo8ZZti9Sff7hz91ztXiIj25FwfoXPB7NMVBhDpBh8XxLDDdZvh1ruxbIwZXESmug/a8hGDaImpHAHvPGmyOkB6I+/YY6m6M2tpoWiwhNxx1tPLAgFQcOHhRFblcR5lTJGQbVPaRG4qrXGRY/5BZC1s1O8DxKNBg1j4AAfunjF3yItWAjA0z3ONRHnV+aiGKNGx2cpL3RCyKodB/9lED+ehLQRtntP+Y89d+VIFK3ep+wXmqccUOUqtrZgZWWLHReOzHIQXGhqNIZQtOq9NWHOQDIVLuNhV
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(136003)(366004)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(53546011)(66446008)(66946007)(66556008)(54906003)(6636002)(107886003)(64756008)(26005)(66476007)(83380400001)(122000001)(55016003)(82960400001)(86362001)(38100700002)(38070700005)(71200400001)(76116006)(6506007)(478600001)(9686003)(33656002)(7696005)(2906002)(316002)(4326008)(8676002)(41300700001)(8936002)(52536014)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wz/fFovAdolttVOUb02rcJUWOFeILEUSRnxoDYw1ZfzOGNJyQzta8Y7IRtCx?=
 =?us-ascii?Q?S9eZ2N+0KZO7x26rCC/R+5iR0i7JzzH4pF4ohf7pch/mZlX+01Npr6VNbnpy?=
 =?us-ascii?Q?rxx2osvp7OrpORxNwXOhV3nKyLr/WsZyglb3OajPhQYaqveCwi16kLPt+biN?=
 =?us-ascii?Q?hmP5k3TQ5k3liLGQHizRwi/xXHlKqYnWMaxLe7yJk4HTpaCGwgX9golehH2q?=
 =?us-ascii?Q?NifmZUvbGYpNu+3UA4g0WiFy6WsM8LIbi76kC7uQoineY4E4hj2TpspRPzlO?=
 =?us-ascii?Q?gG0OUPdNbDxTPQP3/6cTvYERD5NIr0gPTu/yrvKr4cQDUlLbdMDh/bxfjtjF?=
 =?us-ascii?Q?Gx6fW9vDCcHCHOh3b1idddfwD+oNhx937Ivwf5/iyIyzOPWQkOhwXBfEPgNQ?=
 =?us-ascii?Q?9iVrsZiSt1ad7PrVWh2jlEcZH/u+zYxj/75SDazJFCYzFYZayfWAM25a/S+6?=
 =?us-ascii?Q?JPXrk1KEKmVpyHBYv84vLZqvIj+MJNVKgmW0bebc8M73wJ6gE3F53Kd73bjS?=
 =?us-ascii?Q?juWRLWDaibaieABT7bvUME/mebY9bsuXYDWUca055uS+XCXu5GArkekUTvfZ?=
 =?us-ascii?Q?p1xcSIg557sbXFTNkGavsPLDklcQIBFQzrkxNT3mEC+KSK0+/e5iRT3TbLYR?=
 =?us-ascii?Q?ueV3AxC7ayYQq9fB7gpArP1TRkHC1aEwrzkWwoKrwerKjyt+y1fTRAQf5O4V?=
 =?us-ascii?Q?G4dHccRXj9nRHRNv+p6YGpc8oLoDtecviXQ8cSaGOcMCo6+5JiAn1fJQntEJ?=
 =?us-ascii?Q?GPHETDDWy+o0/0YUZUNgtyHXrCflXHcy2u4KYKei/6Lba9K9ed3dPVjQdEh0?=
 =?us-ascii?Q?wULNJGKyAYbBAP4JLSYRvpjJdUcKlbH97oggLb2dmYgDD0gNh+UqxiDc0OMq?=
 =?us-ascii?Q?scOPItql2q1yDWizHYPabikgdW2+INA0xr3lKZzY3fIwajMlcOG2DP3FqJ4D?=
 =?us-ascii?Q?c3zMLJ5AalQMQtxyoxToCqldJEPjEhZh0+921Cq2bW94GN40KXb2cafeAKNC?=
 =?us-ascii?Q?KtuEXzVdg8fnpSB+sCTji4odSz2URvJwZcHv8yDt3migu7frLIB71ZoqVsz8?=
 =?us-ascii?Q?ScF8IltfMXGihv+WfbW7eIj+6HOxQSeuVcXi9dss/tF7BojM6rp/mkIXJxPU?=
 =?us-ascii?Q?okmN34p6iVAW3/kD6AYugrbSjVdirLGZ7XCagTHhuP57wikZFjMZYBEO8xG6?=
 =?us-ascii?Q?JRTzRtv/gro6jdPDLM1wUTo72LXcNUexBryQXhD3Ekv5QEZkij06EIok6vK+?=
 =?us-ascii?Q?k3MmfoF6Tplpo0xWSfzb+hIxOR4XcRICjYdAP9cfvG1MXuhpdH9RwAZf55rl?=
 =?us-ascii?Q?hc6FaSvga0hujNjZ+lsegb8jBueIf9Q8h8+6ACLevWH2+fM1huVpBv4PHpUD?=
 =?us-ascii?Q?vXGjiIgf/Mn6ANKR4xArSpeFLbTCcgLW4UJYvNkXFgBFerioeOTKQs0pgriw?=
 =?us-ascii?Q?jxF7PW2aUl+lnce2MupKpjv983UTXjshfFdy9Mtm/DIbBvZF+7d93tvs9l3V?=
 =?us-ascii?Q?mkjsnW5g2oUfafJ+EIi916xAs+ki3Rwb9JFZNn3iixGb5j/l+LgKCxLu3Prg?=
 =?us-ascii?Q?xJ+ocSgNibHz/hYQpNFVpt2L28UbwpigACVVuWhLd3fqV1//02MtFxoR6xYv?=
 =?us-ascii?Q?0g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f529b4c5-571b-49b8-d138-08dbc5b77f60
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2023 15:26:50.9561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kk6Som91pYVPx4U10SK/Ogudx/StF95UEu5hNJjOWAW9awyMcukw9UkF0T5VyaIt0YMnE1jPP4S04TO4uYSokcSKEEDkSScMjK5hgJ599tE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5175
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
 count
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gandi, 
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, October 4, 2023 9:48 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend query ioctl to expose tile
> count
>=20
> On Wed, Oct 04, 2023 at 02:21:38PM +0530, Janga Rahul Kumar wrote:
> > Tile count can be queried by UMD's using the query ioctl.
> > VM bind ioctl has tile mask param whose valid range can be determined
> > based on the tile count info.
>=20
> And what exactly UMD is doing with the tile count?
KMD is expecting UMD to pass tile_mask(bind_ops) as part of VM bind ioctl (=
drm_xe_vm_bind_op param)
        /**
         * @tile_mask: Mask for which tiles to create binds for, 0 =3D=3D A=
ll tiles,
         * only applies to creating new VMAs
         */
        __u64 tile_mask;
How can UMD be sure of the valid tile_mask range if the tile count is not K=
nown?

>=20
> Please let's hold on this idea for now. I'm more trending to propose kill=
ing
> both tile and gt concepts of the uapi. For user the important parts are t=
he
> hw-engine and the memory-region where the BO is placed.
Sure. For user hw-engine and region info is most important but also the rel=
ation between the engine id and its local memory region id is also needed
in scenarios where user want to allocate a bo on same tile region on which =
the engine resides.

Thanks,
Rahul=20
>=20
> >
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 2 ++
> >  include/uapi/drm/xe_drm.h     | 3 ++-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_query.c
> > b/drivers/gpu/drm/xe/xe_query.c index a951205100fe..ada1f26dc1d9
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -200,6 +200,8 @@ static int query_config(struct xe_device *xe, struc=
t
> drm_xe_device_query *query)
> >  		hweight_long(xe->info.mem_region_mask);
> >  	config->info[XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY] =3D
> >  		xe_exec_queue_device_get_max_priority(xe);
> > +	config->info[XE_QUERY_CONFIG_TILE_COUNT] =3D
> > +		xe->info.tile_count;
> >
> >  	if (copy_to_user(query_ptr, config, size)) {
> >  		kfree(config);
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index d48d8e3c898c..1d207b5398ae 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -257,7 +257,8 @@ struct drm_xe_query_config {
> >  #define XE_QUERY_CONFIG_GT_COUNT		4
> >  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> >  #define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> > -#define XE_QUERY_CONFIG_NUM_PARAM
> 	(XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1)
> > +#define XE_QUERY_CONFIG_TILE_COUNT		7
> > +#define XE_QUERY_CONFIG_NUM_PARAM
> 	(XE_QUERY_CONFIG_TILE_COUNT + 1)
> >  	/** @info: array of elements containing the config info */
> >  	__u64 info[];
> >  };
> > --
> > 2.25.1
> >
