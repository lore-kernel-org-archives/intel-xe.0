Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C936CC4167B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Dec 2023 14:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95EB510E54F;
	Tue,  5 Dec 2023 14:10:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A9510E54F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Dec 2023 14:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701785446; x=1733321446;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5/GnAiwzO61F7au1RSyPsP+eMfqoWnN0Q95aExcgT+Y=;
 b=T1vv/2lpYg/WFXflWmSKo8LVcjrXUz0tXwnXX/a1ya/hi982R+rOYDXV
 shaPi8glwYL2NGzP6ImqwvPXiXXBHnpizaU/iHrGbh+Zde6RG/aq6wwQl
 ScIWTszaeiwCYKjF2pXPJevCPoPgJhJ+XxeOyYP6zM88R5sQqe7gTESDE
 pvBL7yzFxTHaDR0ksd+7AbrXy0K68SUu+TQ+9CO3b7wgD3a6m0FZAa1+W
 lFdqylg5Uee0SjFwTuQ0EvuhWZjVIqMC0TqQQSKM01Izy7wy038I4DNck
 GYjHIASDfZbq5x0FaGJjt7LMSb91VIIzaYbmCDGPMZZulTmUx/BXaRHbj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="384300310"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="384300310"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 06:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="836980092"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="836980092"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2023 06:10:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:10:31 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 06:10:30 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 06:10:30 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 06:10:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NcYN5M3pKZbmZDzPkwCy+cJ5MgFPBuddy8fK+EuuZNCy9uXDnJAcPmjSCApGEXfYJ88AfCKe5tu6Vr7ZMWwBtxEXxBOrN8Ec5OPvkqA/DSOKMbrZpcSoe7PaxQYeTHAUNzmAx4j7LtVxrJbOp74WQBjXo9lDsahYhGrVdoD9Rggs0TXrNVeC6T7CX0lKoLo5XPqe9/dK0VvA69qkDl1dSWz4F8FlWNz9Ssoktk+8gK1s1Ag3Ffx3eMBzCzuGqjpQF9ZNLEfJ+cJYWGEOtCL9aSQKvdbLNZdyrZN7ncBYfQ+nAJc06FCjrey0i809M8fTfoSdSAonu99zmtqbP9lVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTEQd1qdx5w4RN2Ky5xHRn9yOFNFpJcS79XE7vJW4Jc=;
 b=WSrWfUQlLDdpBw1F2CJXNbNOO4Y15TGs12crbyf+wsS/nRlyiKEm2Vj2yBWOr7sGXPCtiDJSOGzBw6QvULx4nvrzSthgziigfV0aSg83/HpTyx1hsZDyBadVL9YXuwS6Di8kblmSeBx2amiB52Q87ujWwNwYDid2v33DhMlC3ZJyD7HsS/K5YI6R4Zzwwzobz83JenJjYmV/z14SvLf7WfcJa9ZJmxPFM4T8IJfxhH7mC0ylIj6C/IJEySPXvC7OcFXeq3yU8tPzq5v3hikhxfSmSkVV1jOA3xd8svxzRG9JuIZLAth0ig83Bo1lQkVeEfJOyiNPG/22hcETt66mbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) by
 SA2PR11MB5099.namprd11.prod.outlook.com (2603:10b6:806:f9::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 5 Dec 2023 14:10:28 +0000
Received: from DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49]) by DS7PR11MB6197.namprd11.prod.outlook.com
 ([fe80::dcc5:de54:e4ab:7e49%4]) with mapi id 15.20.7046.033; Tue, 5 Dec 2023
 14:10:28 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
Thread-Index: AQHaJqYS0B4aSHqDi0CzbuawfzvDqrCZdWuAgAFCOSA=
Date: Tue, 5 Dec 2023 14:10:28 +0000
Message-ID: <DS7PR11MB619749FCAA441D9E8430493C8185A@DS7PR11MB6197.namprd11.prod.outlook.com>
References: <20231204114525.791141-1-tejas.upadhyay@intel.com>
 <w4zznqo5xdko2gpx7sfhcmkncxgmqk5ewtopzpof6z6vvry3je@pla64iszsa3p>
In-Reply-To: <w4zznqo5xdko2gpx7sfhcmkncxgmqk5ewtopzpof6z6vvry3je@pla64iszsa3p>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6197:EE_|SA2PR11MB5099:EE_
x-ms-office365-filtering-correlation-id: 6d4e1c0f-f249-4f8d-a9e6-08dbf59bef21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b3S+lF01B/6cV+DPmHOF56r15N3bJ7BOmyDr2LDzO/C0RPpjy9h4m7pFPTGMokpczID03/W5ve75iWHSrnhdk+AK5oB6TtJjEdcCo1eY5MdCboeTnI/UmUm3+XnElR/w8Tz42KmAL3d2UtQ9be6jZ4wFX022D7/RQu4sOx9hYIrmtViEsSfq4bHDJ1zJXnqRWyw9g4N3rmd0NYBPh4f3Eht+DLCS+ZyojyOOqEEPgaVdH1FsvWm0003OCjwlf3Si2LPk68mogh1Idtr9bdt4oVdf+g2U7+zn0GAH8o9K9QrhaTubkoaAS9b0R8etzuwp7fivfJdQ3bkfmzYJ6z8G4r/fUoqrtrPvW4B+cXNJRwA6cYafrSa4oDZpQuHxadjmS0MjTGZTHPTKWFUkmJGNaRm2YUhP2DvmH3//dUVSTfBCmHLqW/4qfArTpkzVAX/wz7sMtsMgo+tZ+BTBE8VhXePjRRZHN29TsxF8Hzhmme6mrvhUjGC6Ki5LshAeYR6/dHniLyPayU8Ni0v5aHcC5/UlCMnVsTHYybt5YZfaZhfnn4YslRynIO4ghzV+cGqzgW4jJP1chOR8nFHxhijKlfrdeqkuMygWJp66QtEpHrYC5tGpqvhTchkXpPTdPtsx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6197.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(82960400001)(9686003)(26005)(38100700002)(83380400001)(6506007)(7696005)(122000001)(55016003)(53546011)(71200400001)(478600001)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(6636002)(316002)(8676002)(8936002)(6862004)(4326008)(33656002)(2906002)(41300700001)(38070700009)(52536014)(86362001)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CMw2WNYQYvVvXrcto1T+/TPsxBjGV7myeyNZqE8p76rs3U6Qf1yRJ4XcpV6B?=
 =?us-ascii?Q?zi8tJS1rkwk14hq+kP0CndYsVsP4pw8tXL1I74WfI9K25YoU7kc2lZlagu6Q?=
 =?us-ascii?Q?xiy1IsoG0Oz6ifESz+XhqHwZaH9sUH6emH4gSUjjf8JVlpTDxQ4zAzKkWjjd?=
 =?us-ascii?Q?UNRTcHxlGiA/MNobk4Su6t0DqArRP0SivMhsdP1MleRHNko0xf4r7xw1hNZW?=
 =?us-ascii?Q?Q8dTszzUOER3zTqZtl54vt5/B2MnR4UlesfDjVWcteiWS/ct8Zp9JlMAkDaB?=
 =?us-ascii?Q?GPu8kmmz7dM68OH8WmYu7mBFYRkfb+MoLIwCRUmZYmppmLY303PaVh884eRn?=
 =?us-ascii?Q?xx21QcmaAmMGs4gZKspDih0NVdz0LsYA5ibMcp2gjS3QTrzFRi5qZ8ZN3SdX?=
 =?us-ascii?Q?sBKGPi5G/rV1z7V87cMax7r9dHvfnU6tVhLaZ4Hj/2lHhL2AshlRtCkolFg0?=
 =?us-ascii?Q?WEhwPnPRV1sZpHjo7eR3RWc2FzmgMJmF9A1haowwuD2B7KQV8J3ZR97VLIIQ?=
 =?us-ascii?Q?NMTxsWXIjz9hCVVA/ZD2B1nHiH63ud0+DhXni7sAsKk0T62pUfNpi4kYZjVt?=
 =?us-ascii?Q?dsYt0WP9iGLXTif/R6jSsNdIBS8eQgHRkkGqhtQae75L+4w3fsNs+OCclrFT?=
 =?us-ascii?Q?Em1/ZKK1aqgv1s1YlFlvvhLLIC6pYsZkpiS4dCbFgGCpe2g19QPtpNOixPvc?=
 =?us-ascii?Q?aX+OwS+oIXyjXfIdlgk/JJFBd5Jwxsfosu97jS0sVustqjV6hY6/911IrCRy?=
 =?us-ascii?Q?uP4sOLrzlk/uaWax84lEW3t3MN2I3UHGnnYxTqXO4cD1YvCvWCbbO4LqqugD?=
 =?us-ascii?Q?NE7o377K93LAeFq/ykXEsp/rJ27b4K34Xset3x2jZ0wP0OZZHUEavKnwZX+z?=
 =?us-ascii?Q?dz10tW+LKLo/cr4Jt6pIwvDaxGE6eDpOshwHxS3fgbaRjC6d8+I0+zbZTh+x?=
 =?us-ascii?Q?DClgBB07zmrWLSD10L8DefOk548peJfUKAN00ViWYtKfnf2Q3vsus/rJl2TT?=
 =?us-ascii?Q?RxyQVn/AWj0WAU6zcgIcGfrE3Qu/rovJbuhXe70OeOLj2G0/XLVhO1IfR8Kh?=
 =?us-ascii?Q?mWtpKTrwlxrBTjqiocFpkbkLXOcYfD1Gi4TVrIweRKpudVUfXUBgPGwy2G1t?=
 =?us-ascii?Q?Bx7k3LWAPTA7G89cYuGrw7jl0icGVQqLhEHhT6As5fZdyQNenDWDQl+6wQg+?=
 =?us-ascii?Q?fhlM11bRcQMCTckJ9ia9PlnzEX+/Rm+2R4AtdlVMKQSF9+fcIZ3xuCofwh6i?=
 =?us-ascii?Q?UuIROlnsDwXBOQ0eYswBVyoGCMEPJqCTeuH+mcYYzW8+Lkyu4Mki3b7drOVS?=
 =?us-ascii?Q?hiWAxOzQAVoxXTTSWws3Mhc880JSKVLuYl9hEz4sKpgNR2ro5aKQNtVS/okf?=
 =?us-ascii?Q?fyl4s7kWypmiQx4rgGRooSZeVFGO3ycpWMp+tPl3Fq6wmXmxWeWsPVla5Noh?=
 =?us-ascii?Q?PO1gmg/5ZjBxHz9cPGEb1M6Er+gT1hdzTwytvYJatvHV+umTyUuY2biB37kI?=
 =?us-ascii?Q?GHMZGl07/pa/546MwRBKy//HKGFBuvk+2PE+FKl3vJkcCTQdvQ8h+rOeJnw/?=
 =?us-ascii?Q?Gw6N5iLPvM6Q/jdu+sUF8Vgi/ZmEYo/HzxXB3IiB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6197.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d4e1c0f-f249-4f8d-a9e6-08dbf59bef21
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2023 14:10:28.3348 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ICOvbXK5ncrbrCVB4sH5/zhBh5MeaZAITWm7JUpZ1QbzZ6ob3I8cvsfYdnnpHUbC8JHl6Zdbsf7oq76veqkeEMye40ygXsHTQqmBYuKKvsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5099
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Tuesday, December 5, 2023 12:11 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
>=20
> On Mon, Dec 04, 2023 at 05:15:25PM +0530, Tejas Upadhyay wrote:
> >As per bspec RING interrupt mask register will have lower 16 bit masked
> >by upper 16 bit.
> >
> >Bspec 60352
>=20
> am I reading the wrong spec? 60352 doesn't say this register has masked
> access, i.e. in order to write any of the 0-15 bits we also need to set t=
he upper
> bits.
>=20
> Compare that to e.g. 60279 where we do have a masked register
> BCS_SWCTRL.
>=20
> In this register it seems the upper bits are just another field to be set=
 rather
> than considering this a masked register.

"If an interrupt is unmasked. On occurrence of an interrupt and if the inte=
rrupt is enabled, will result in generating an interrupt message to the hos=
t."=20
By above sentence I could understand that this mask for all interrupt bits =
mentioned in lower bits.

Thanks,
Tejas

>=20
>=20
> Lucas De Marchi
>=20
>=20
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >index 444ff9b83bb1..d9013c698710 100644
> >--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> >@@ -39,7 +39,7 @@
> > #define RING_MI_MODE(base)			XE_REG((base) +
> 0x9c)
> > #define RING_NOPID(base)			XE_REG((base) + 0x94)
> >
> >-#define RING_IMR(base)				XE_REG((base) +
> 0xa8)
> >+#define RING_IMR(base)				XE_REG((base) + 0xa8,
> XE_REG_OPTION_MASKED)
> > #define   RING_MAX_NONPRIV_SLOTS  12
> >
> > #define RING_EIR(base)				XE_REG((base) +
> 0xb0)
> >--
> >2.25.1
> >
