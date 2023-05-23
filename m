Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A0C0C7EE23
	for <intel-xe@archiver.kernel.org>; Tue, 23 May 2023 20:43:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681F410E4CF;
	Tue, 23 May 2023 20:43:31 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC0B10E4CF
 for <intel-xe@lists.freedesktop.org>; Tue, 23 May 2023 20:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684874609; x=1716410609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lFbqLsxhwNsVg0XE8QW2UVf+slcTyjGOZQmLYFmz29c=;
 b=G/UIWCAmjpN3djg2UZNZDXERFJQtAtECvq6GOG0HikKpdl+5yDnXKhvq
 ja2354zOnMl2ygUmcXc/ZCf/L5vSrDq1tWegmbEN/79dzZVySiAv5fm5m
 zJwWOVhEBBJViEpw2oGlyAn7p5Ir5iuRhd7VfBzRlWZH2Sl18BXVjEESE
 WIboAFe+CgcWKTNsMqEK59I3NiPjQyR7nIfsPmrq9z6i7oKA15bd6hnj7
 QSEfsZJOPT/TdvcUqjTvlmkYXKC2KjZd+jGvV3Kv5pssVRcr7ZQw27D9v
 dR7OspKL+63mC7rXR92Erx8g//SBEYdfdM0UOI9TLO2yc/Vs+y0XGM9Ih g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416817092"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="416817092"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 13:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="681570337"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="681570337"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 23 May 2023 13:43:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 13:43:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 13:43:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 13:43:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ChOCa/M9dAz6qM5CBPYhcplLEILQWwFJAhYfShOU3wcjTOjaw+yOf48cvO7a7APFGYKViyqEidu1+iJtadn59v2CMPGNguyR7qNMNkGRdEQlDTtQi1TB6oo2dHWjRpvYTxDO3zy9Wz8K5T+SGw6ZC6rWrssa8V2cySoZgaG27WUuWKbr+LKASdSal6g8kdIFUUI5M0ZDYO6ffddn9Aw0J2dEL+Y5aBjgJAX82kNWjw7zAwRt+m9m9OGVMniR4XLRAGxCJYDURV+L1CDXhVCX0lbtCiPyZUd6FfkqIbjDxKRYdY8NoiSw3V1pl/qF71/RmdJaSDF+D0iFBmvcnxhxfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxWv7v/BA2EJHmkZLrQQQC1g/B3NN/ZJAXMVmsK/Q34=;
 b=Hi2vIQX8ABD5g9dVlAoX7/KlGY+SFObfozBiRd0E19ZtU+HkOMEIkzqJIo0nN0V6/QORf8udIE3SFmGLovUJjmRvNPufXsuN+DSnylhcrYgYUP2vipPCFV+yJ0Xn5lrDJMecoLZMK4N6xZq774qan0NFkNCYScHUU9rhYtpGksUfSpLuW/P+b5EuxuSZwQz+Fvj+ycVC5GGiep18T+rarvm/Hqef1yAsoNpGmtmMz3kOOCasRGbkBfH1aCHYanchMPIN88zNLEf7UwRZe0zHjWkAHvDPsgnwTYWcYXO050H7oxKB1Ith5JEbheApc2HX3FMBteEctH1v39+1Y8nkzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Tue, 23 May
 2023 20:43:26 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::dee7:af80:a6b4:da21]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::dee7:af80:a6b4:da21%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 20:43:26 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
Thread-Index: AQHZiCZ3DNuPiTaRM0aT5vMeB1odeK9d+aUAgAGKWQCACNiZEA==
Date: Tue, 23 May 2023 20:43:26 +0000
Message-ID: <CY8PR11MB6940B04E9E0799F7A9C35083C3409@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230516184420.11806-1-niranjana.vishwanathapura@intel.com>
 <f87a9e48-adf3-489b-23e2-abe45b18b569@linux.intel.com>
 <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
In-Reply-To: <ZGW4cvKYZ2e1YFCS@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|MN2PR11MB4663:EE_
x-ms-office365-filtering-correlation-id: ff538e28-7c7d-4914-2029-08db5bce5bad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m7ucPkZ+As3nepEL7b3GJ3lVKzB+FhBuK9YtJkcq9Um70pm/53Esc2hb/xOApxfCNvNoOmKzvH5bTs+xYOOg7WQrn3NeJvzs6zBEF60NMdb6NsibPi/FqONtbDcT/E/kXn2Od3yrQIRnPmNnApJBlXj/duCBgW0WXkuHVYrRts/eRJ4fuXn0LbXdBjImD+DTn5ZD3lB9/nW+W2984LVMkd4DBftzzQnIRJFTqo5VFyA/CcHCYon7a/NbsqX6wgZUNPpxdbltPpOd7yEnYySU8OzmJSOJciM60/9calMM1JookhQ3FtcsQxXsGT4EwrDw4fIztg+skoeYVm1GKT76hh0Ow8jGZVXshE1C60+s/mD+2RrhK+eFL329WTN0JouSc4W4IP4G4WDZWZrdqHiOm5cdXII2mouCD16LzaP+CEfZVHHe2rk23gQjUbLgFbhziiaKCCKL7DakvDhAUh/JNrGzPGUrwSYHKJjzcTyxniTwVyNpQf6+N/txDfsrvZSgC72wk1L1/rCTcwQgjCoP/bEv4xwb5u6KuWJCbVEdyA/YQlllQ2FH3QuvId89xSNnBqePsoWKTbp1p2saEghAcnF5TNu1wc9XBWAuNhi8nLA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(55016003)(33656002)(26005)(122000001)(53546011)(186003)(6506007)(9686003)(82960400001)(66574015)(83380400001)(2906002)(38100700002)(41300700001)(7696005)(71200400001)(316002)(54906003)(110136005)(966005)(478600001)(66946007)(66556008)(66446008)(66476007)(76116006)(64756008)(4326008)(38070700005)(86362001)(8936002)(8676002)(5660300002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8sioF+K5iFOk1Wq3eAW3GDP50nLss/PSnEAzmDCvSF4KAi6kuva9v84LHl?=
 =?iso-8859-1?Q?GMiVMvL7McXnr0bxqDeRypTiwGVP/R9AlBOVyZT2Kmv2QgYN9caAVO3Bz7?=
 =?iso-8859-1?Q?v9ohxQG3dtDjDJvGA1rVe1du95zuq7IU5MSLkwJs4GMYzD8jHyQ4Z97OWy?=
 =?iso-8859-1?Q?OYIftf/eg7MsDK0Vkb/F3VaP8aW6Cmb85zHGKxZx4uptT++xcGc4XpXLES?=
 =?iso-8859-1?Q?/C1lIv7yWGRftYTaA6jhW3mE/aelvY22VrTDCjHIQBprF9wI+Z48oVOZj0?=
 =?iso-8859-1?Q?cXnkhsBgxUYBUBMmLqg007aIYR0hLwKnr1aa1xQj3fjlK2cCTHZTJd5ieT?=
 =?iso-8859-1?Q?Bh9AS6Vv0eDcp5Urp9/X05MNoFOi0dFjYkZ0PX59xZikYoNN4j7RgVPeTU?=
 =?iso-8859-1?Q?4QryCk+Qy/w/9dk4jKMPIOhLNUDdthHo7Qimuagdx1QagzT7seGdVcR2Dv?=
 =?iso-8859-1?Q?L6Zh+koinPhfaJIIrm5jEcaxc9OOU78jGoe/qhv/WfNp7hmaYnf2Q8Ts6e?=
 =?iso-8859-1?Q?nZux4sqwAK855QFVr0NFbadBIzltyNEd5JExTfj+FcIIYWWx/KeYk/3eoq?=
 =?iso-8859-1?Q?c89jZrtEqgl2xEItA+Lz3ZbTs6KnwLtFlDMUr4hQqaD2Y6LBRdqw5pHyfE?=
 =?iso-8859-1?Q?FRmQeXfqkmoZM+xe3XpQjCDRfjTn8TZlspIwvpWS0y2CEXNFLR7nMEuwos?=
 =?iso-8859-1?Q?82eLNTjlpehgsNH2C/+1MvG23rLLPQBsnhDsI7P3UkE4KIXdvuf5jIPiZ+?=
 =?iso-8859-1?Q?2OAZBj3sjV6fKvsei3w1aSx1oX8v6x2f68u8mma0gyUXFqYJYMjj+4xPRp?=
 =?iso-8859-1?Q?5p6as9wqHRiqWdbUzSRxzSRIAAwTr0XGG4R5BWtvHGvvN8ZULqjWPJwlyi?=
 =?iso-8859-1?Q?9tLkZDUISI0Jpd3aDgXFOzxq+AyvREENMdaIXv1I1rqdVo2+2rUEzHcaIt?=
 =?iso-8859-1?Q?ngGI76HCWPyDyFROlDDBMWTTG1mQ/rR4u/DwIJCVtqk9LkygQCSWl0LYKa?=
 =?iso-8859-1?Q?xQRkUYyMRPbV/vhIhvRz4MtpjomnyHrXTplSTAPbwXZcbqqAicewbrxlyF?=
 =?iso-8859-1?Q?PNwVqeDNvxyzLa9n63/f7MWg8CA6dzxo8PDYSUqi9JFZllI+QFdiMRAm9Z?=
 =?iso-8859-1?Q?EPLwR/YnXeqPCrOSfnkQ5r3XCo+RDM5Uxo05o+5UtTsYAy2UwDVaUcdQiT?=
 =?iso-8859-1?Q?3QNuosxi5WXwVe9J/+VgU1RCvfXLhk4LK3wREfuMIh6pTAxIqhRz20WQja?=
 =?iso-8859-1?Q?KAf79RDUARnxkBg+/BaSxcF9JusY4nS+I7CHEGvly3Io/s3mAuALVlekKE?=
 =?iso-8859-1?Q?rCFpS7OMtg3cUjD6+IuA+FX+PItRctNRQIpXIweGivl8/TmElc3Z5cO56i?=
 =?iso-8859-1?Q?vr1TD74tzbgC8bRxMoQla8kiZdAugRl0zApf81lcG0xrHmIJOFeQOeJNAg?=
 =?iso-8859-1?Q?HNYFbRcY4+6BVta5Isf2eAlmzJvU4Cm4NYmtlHsIm61g1RZPLHBitjxg+D?=
 =?iso-8859-1?Q?vNwuYakuNBaem3uEQKzo6hH5QJRuvlPjfA++4OTf/+c1NnH+lZGT9R6PYv?=
 =?iso-8859-1?Q?qg7flmndSyz43pouMiVxlgqS4Mdw4g9hIbjOGKpzYn7z5Zp3eRH33VLQ3N?=
 =?iso-8859-1?Q?55FxsAL/75E/0Rp03f/i7dZ1ky3i1ouKPk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff538e28-7c7d-4914-2029-08db5bce5bad
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2023 20:43:26.1913 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YTRsEIp4U8DJ9QdwxxG1CMch1zsUhX4rGgu3rkGbQ4BCemc+rVUXTwg4PK86tVltMoa2bSS73ZjmdYThBkzrFzItNUzgYhCImQG4cyjgWpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element size
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
Cc: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Specific to this particular patch, if following the same patch below for up=
streaming i915, the change looks good to me.

https://patchwork.kernel.org/project/intel-gfx/patch/b0f6e50a8cdfc484f2dc18=
d3215e86465e2e1f1c.1627551226.git.leonro@nvidia.com/

So, with that,=20

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

Thanks,
Bruce

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Niranjana Vishwanathapura
> Sent: Wednesday, May 17, 2023 10:33 PM
> To: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> Cc: Hellstrom, Thomas <thomas.hellstrom@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply upper limit to sg element s=
ize
>=20
> On Wed, May 17, 2023 at 08:01:08AM +0200, Thomas Hellstr=F6m wrote:
> >Hi, Niranjana
> >
> >On 5/16/23 20:44, Niranjana Vishwanathapura wrote:
> >>Specify maximum segment size for sg elements by using
> >>sg_alloc_table_from_pages_segment() to allocate sg_table.
> >>
> >>Signed-off-by: Niranjana Vishwanathapura
> >><niranjana.vishwanathapura@intel.com>
> >>---
> >>  drivers/gpu/drm/xe/xe_bo.c |  8 +++++---
> >>  drivers/gpu/drm/xe/xe_bo.h | 21 +++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_vm.c |  8 +++++---
> >>  3 files changed, 31 insertions(+), 6 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> >>index c82e995df779..21c5aca424dd 100644
> >>--- a/drivers/gpu/drm/xe/xe_bo.c
> >>+++ b/drivers/gpu/drm/xe/xe_bo.c
> >>@@ -251,9 +251,11 @@ static int xe_tt_map_sg(struct ttm_tt *tt)
> >>  	if (xe_tt->sg)
> >>  		return 0;
> >>-	ret =3D sg_alloc_table_from_pages(&xe_tt->sgt, tt->pages,
> num_pages,
> >>-					0, (u64)num_pages << PAGE_SHIFT,
> >>-					GFP_KERNEL);
> >>+	ret =3D sg_alloc_table_from_pages_segment(&xe_tt->sgt, tt->pages,
> >>+						num_pages, 0,
> >>+						(u64)num_pages <<
> PAGE_SHIFT,
> >>+						xe_sg_segment_size(xe_tt-
> >dev),
> >>+						GFP_KERNEL);
> >>  	if (ret)
> >>  		return ret;
> >>diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> >>index 7e111332c35a..a1c51cc0ac3c 100644
> >>--- a/drivers/gpu/drm/xe/xe_bo.h
> >>+++ b/drivers/gpu/drm/xe/xe_bo.h
> >>@@ -296,6 +296,27 @@ void xe_bo_put_commit(struct llist_head
> >>*deferred);
> >>  struct sg_table *xe_bo_get_sg(struct xe_bo *bo);
> >>+/*
> >>+ * xe_sg_segment_size() - Provides upper limit for sg segment size.
> >>+ * @dev: device pointer
> >>+ *
> >>+ * Returns the maximum segment size for the 'struct scatterlist'
> >>+ * elements.
> >>+ */
> >>+static inline unsigned int xe_sg_segment_size(struct device *dev) {
> >>+	size_t max =3D min_t(size_t, UINT_MAX,
> dma_max_mapping_size(dev));
> >>+
> >>+	/*
> >>+	 * The iommu_dma_map_sg() function ensures iova allocation
> doesn't
> >>+	 * cross dma segment boundary. It does so by padding some sg
> elements.
> >>+	 * This can cause overflow, ending up with sg->length being set to 0.
> >>+	 * Avoid this by ensuring maximum segment size is half of 'max'
> >>+	 * rounded down to PAGE_SIZE.
> >>+	 */
> >
> >Is this a bug in the IOMMU code? In any case, shouldn't the fix on our
> >side be using
> >
> >dma_set_seg_boundary() and
> >dma_set_max_seg_size()
> >
> >to set reasonable values that avoid that problem?
> >
>=20
> Thanks Thomas.
> Hmm...I am not fully familiar with the iommu code here, but letting
> sg->length overflow may be an oversight?
>=20
> Looks like dma_set_max_seg_size() doesn't enforce upper limit to sg
> segment size while sg_table is created. We need to use
> sg_alloc_table_from_pages_segment() to specify that. It seems
> dma_set_max_seg_size() is used to specify the maximum segment size the
> created sg_table has while doing the dma mapping. The iommu code doesn't
> even complain when it runs into an sg element with size more that the one
> set through dma_set_max_seg_size() during mapping.
> So, driver must ensure that. I think we would still need this patch and u=
pdate
> it to call dma_set_max_seg_size() also.
>=20
> Yah, looks like we can call dma_set_seg_boundary() to set a very large
> segment boundary say (0xffffffffffff) such that the maximum sized BO fits
> into it (ie., we never run into any BO crossing the segment boundary). Bu=
t I
> am not sure if that is the right approach.
> I am not seeing many drivers calling dma_set_seg_boundary() (pci probe
> sets it to default 0xffffffff). Our GPU may not enforce any dma segment
> boundary, but not sure somewhere else there is one.
>=20
> Any thoughts on which approach we should follow?
>=20
> Niranjana
>=20
> >/Thomas
> >
> >>+	return round_down(max / 2, PAGE_SIZE); }
> >>+
> >>  #if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> >>  /**
> >>   * xe_bo_is_mem_type - Whether the bo currently resides in the given
> >>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> >>index 2aa5bf9cfee1..5c2fdfc0e836 100644
> >>--- a/drivers/gpu/drm/xe/xe_vm.c
> >>+++ b/drivers/gpu/drm/xe/xe_vm.c
> >>@@ -117,9 +117,11 @@ int xe_vma_userptr_pin_pages(struct xe_vma
> *vma)
> >>  	if (ret)
> >>  		goto out;
> >>-	ret =3D sg_alloc_table_from_pages(&vma->userptr.sgt, pages, pinned,
> >>-					0, (u64)pinned << PAGE_SHIFT,
> >>-					GFP_KERNEL);
> >>+	ret =3D sg_alloc_table_from_pages_segment(&vma->userptr.sgt,
> pages,
> >>+						pinned, 0,
> >>+						(u64)pinned << PAGE_SHIFT,
> >>+						xe_sg_segment_size(xe-
> >drm.dev),
> >>+						GFP_KERNEL);
> >>  	if (ret) {
> >>  		vma->userptr.sg =3D NULL;
> >>  		goto out;
