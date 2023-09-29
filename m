Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A0EE7734B
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 22:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF2FC10E5A1;
	Fri, 29 Sep 2023 22:45:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515410E5A0
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 22:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696027512; x=1727563512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+AgRiJz1COlLX58pWZkI5OInf1AtgyUra72SztWEsC8=;
 b=YQy3AYjeiW61ylzt7+zjTTcv/lRre/jDTYs7o01NJ2ilqH1MjaRIPW//
 tE0Qt2TeixqEAnU8d8/mClAeW7Es6+duhwiV1iZ7erukrR0hD5Izxffvm
 nooCn/yhMbjyJ2BoaqjGY8V/kDQZNRD/10Buljq9WIyxhro9RISDDbOzf
 cTBGoKspMxviHCfXS/WeE8P0goRG7GxvxYie6/ucOrvRA8M05XSaHpNms
 I7EQr64Gy1nyrJnTdSy13G1U0IBHbGtm/NjMcg4OsZ44DhTbs7wiKyYoy
 sfbT6BjYVDYCqId4/7lBZntWeS0z1rmonFVQ6flWzN2QhAGt2yZWK40QG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362650578"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="362650578"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 15:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="779406910"
X-IronPort-AV: E=Sophos;i="6.03,188,1694761200"; d="scan'208";a="779406910"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 15:45:11 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 15:45:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 15:45:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 15:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JaP3VhXQg1mHECrDCU9d3IgjLQTpo3bjHyjVQVmLwhJIDV2xqPHLJpzWG3qyYDcImwbER+sYw3DQrbFJw++T8pxiOEsoZ2FOfUYQyTYktJDkGZjaoLT35YDaFH05GYhw43KJtLvisPMssBaNe1LG2g4urij+XewVvDgHf7fW9Cmk9F4soigmSjinV7Ew26XPdkq2FTJeHcv3v3K15l84/hfbzTs0acXVlHRebGFXyBV3jjGafqeKPc8Y/ycbb3B5NgDW/MN+bh9Kgy2qxCs733jF2Qt8QUJEuuftXqJ1yultzsMloI/PL2MuJ0t9WnaZLcBLDQsNapZFVSDhm+jSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/E7ExVa2xSM9GOZGp0wwODcTAysHV4N8BHVlrBJQfT8=;
 b=dXvPFmJ51eiY+OWPNFiXKfhRus8tgfg2QuG+QACOir0mKyu242sJv6xzUFdP09dSXt7kffsKemS2Iw8T9BfLJuf11RaHTlzH+Yv72o10jRNCP5JN/pc3eb1AGE3cRfVHgV2C+WhD+UDlBhz0UTG3D+N6HFva7DGlgEEiQ6ygkDXinx6aNpjwW4f93PaO/5fUzTyr4cyCjFvMfUqFH2vDbFIgbBu/W17rHCoOIBa2zWl0clSCwaSBBLXb9BImS1cbjeDfsXUp9rpER5ziCiDNQm/v0w30tfBy3rGUNfvykJkyapZk3uVcbeJPZnBFgll6lhp0zhXkO5B3DJPeSirsDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com (2603:10b6:a03:429::10)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 22:45:08 +0000
Received: from SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a]) by SJ0PR11MB5866.namprd11.prod.outlook.com
 ([fe80::8272:9148:30e8:383a%3]) with mapi id 15.20.6838.016; Fri, 29 Sep 2023
 22:45:08 +0000
From: "Kershner, David" <david.kershner@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Ruhl, 
 Michael J" <michael.j.ruhl@intel.com>
Thread-Topic: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
 entries.
Thread-Index: AQHZ8hJ3IuWF0EhmVk+j2Z5cvrfQP7AxCjaAgADdYYCAAEJdgIAAPddg
Date: Fri, 29 Sep 2023 22:45:08 +0000
Message-ID: <SJ0PR11MB58667BD5E23A37A43F080A7881C0A@SJ0PR11MB5866.namprd11.prod.outlook.com>
References: <20230928134816.881379-1-david.kershner@intel.com>
 <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
 <IA1PR11MB64189D31B23DF1F4667BCBB7C1C0A@IA1PR11MB6418.namprd11.prod.outlook.com>
 <ZRceh0kYnudtJpJJ@nvishwa1-DESK>
In-Reply-To: <ZRceh0kYnudtJpJJ@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5866:EE_|SA1PR11MB5825:EE_
x-ms-office365-filtering-correlation-id: d7de4a45-f26c-439d-da64-08dbc13dbb77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G1nQqvVuIyf2EoWZKfw6loqNE+Q8MDhME4TpSm38ngqD7kBgcXj7kISCVSrxhmqy3qevMJ+885GCBeOMf8WvcSvk4GlzkG3k//eqXXFW0x9BSC8t9Ay/e0BuF13axA0I7m/THbUaJHh/Z+chvJUxZc8HOxufuK63iRXdBDGrql5nu8dV878AlFBvL6wszAUniNQU7nY3+0rNGxXpasZskNdnQ9OfeS8zbeEnSEDUF0Gnrh772i7joZZao2MDlwc88OaVRXzOIpbp58TjI/eVJmL/lZE0PF4FlvO1uiGcmzs/8E5S6XCof/pFvLWoczq7izzUw4jB7loOkCcwcs4EXcKYPSCoKX5B2FdHlo1KreR1pC32YVn+Pdpbb6tMRHAdqvXoHXx+LuzogCO9dcWzWri16VT1wNsgFXGl0OlV8xsnW4tYSngbk7aaoRqwrUyLQzYuFAtPD6p52NiHB5hJLz0v8HEqVEm0c1ofiQOn418jNp1WClLS3Y+nzmOB2wQUaBRNiPrLR3oPf3GchssJ5BNIGKgL9q1jx0GBAcnGvaWFRv7TYk5EY6GAASEHxCi9DTo8vk7UQyiD7ApeTiHblQTMWCGqJL2uEcMN0MQ0vPF8IYvkrioNU38DJGHeM0QK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5866.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(9686003)(7696005)(6506007)(53546011)(122000001)(86362001)(38100700002)(55016003)(82960400001)(38070700005)(33656002)(107886003)(26005)(2906002)(71200400001)(478600001)(83380400001)(4326008)(8676002)(8936002)(41300700001)(52536014)(5660300002)(6636002)(316002)(66946007)(66476007)(110136005)(66446008)(64756008)(54906003)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZCmOA8SM0L+aA7sBsvplBEB0Iz8/mEY4ZR1Adgwlw6wwu8KGZ2T2hNapoKAo?=
 =?us-ascii?Q?RxnwTXMEU2DTDf1yJXw83aE5HPaW9zBw6ZdPmDMy5FPHiIFDHIvL3LTRQHEZ?=
 =?us-ascii?Q?pGzQ1PpRvR0nIlbTAvXFk3w1oa/nmClNrthtd8WSzKvlXfuY6vbNO650yXep?=
 =?us-ascii?Q?u7IJ1Vd4eci5eScL7EUVThQM4hSS2Mws+kK60aGHGjx6MsUJ/XMFNSF2VnTD?=
 =?us-ascii?Q?Nvh6p8xJ42qJlY4EtUeoUMdXIggdmdeqNOiuhiy9xq1SGbdSSxTxvImoKP/F?=
 =?us-ascii?Q?S8qEiHQA//A7kk0n/peBw4MxM0KG1heyn9zt39bcgh/NI/MPjA90V+Z/2nQ/?=
 =?us-ascii?Q?a6KZ73Z0VcDr2CpbtjdxP0fRtjdNP0JSZphP+HdW5lRGU2t6I3A/6KLQ33uM?=
 =?us-ascii?Q?7HEXUTW0oc9NZf7+ZVo2qUDDY1WhgjcCFtJe/YonFk8bC1eGGT5wi8FNoM4R?=
 =?us-ascii?Q?UPR+YxvKMahAP49RLwVTo5r3keeKcpQTHGrEtDk6YBxBrUH3vgdh05N2bFsd?=
 =?us-ascii?Q?l21+sKysBEBOz75cQLdt53Sdi1eI29k8Io4nFxT2THCGHbhbL/fpFNHoOsNM?=
 =?us-ascii?Q?ooDrHycvAWc3pm/47mh7rwGxlq01BPK+NopzdqxJnTHY3sFN1hLPImJB4sSv?=
 =?us-ascii?Q?NbwHuCfQhsr3DDYBVY3/c9q9M898Tf1/rZImw6bcRdXc3wgXzAV4cIvVYDNh?=
 =?us-ascii?Q?Nq+pn58cLUScGchQoqsXvimj8zbdMUUHO5VUqfCb3AeWLcT9fLyh607D0EQt?=
 =?us-ascii?Q?0RXzVrMVKxc6wNq6HzklLEuZBWpKzCe6oGe1ArhdrDbuEuTUXjzTi8CFAa5l?=
 =?us-ascii?Q?Co7I+lh27U/0hVjGy0ob8uRUsDRnFVS50J08mVCPAzmQBC1OV3WEjW/gxfne?=
 =?us-ascii?Q?IlxQ0ronFvpLuwhBOqlgivjG6IEWOMJYYuPlP8Wmi+z6pATuZV++nMePbMK9?=
 =?us-ascii?Q?q9MZCNuwFBggb43+YOF1ww8jaX8Yjfyoasm0YRMaNlY6pYGnAd6tm8Ke3DN6?=
 =?us-ascii?Q?rLDn4+Ezydy1N4RHDkZ8hDuLG99yAyioKLc+BZw/7+psXTS0muUAtM3VolFZ?=
 =?us-ascii?Q?oc5EW5989GYF/yEnHZ8Ma3HXYRygmXcnbtP7Sz/+u+YDRE+8BSC1Qdbdo6Yf?=
 =?us-ascii?Q?HQuVSJHxDk+ByM2yNzTeN9AahfwJ7HQCSlbVD8nsGiTQjrvipAolMH1/gL+n?=
 =?us-ascii?Q?3evu6hlKx493B4H0yuk94foHWaCMYgN97C74iMBcIHpHkT9Jm+CW/Vrl7nxF?=
 =?us-ascii?Q?ksyG5qZ+2HYHrT2wQBe010rISggn09X8gSI1167N6b0RNYmJgkaD+JUBaKiV?=
 =?us-ascii?Q?yCTQa1np+2fDvdN8mH8lJvOjowa5uPMHjAwJ2/wR54Ih+zxvREkIiB7ashXr?=
 =?us-ascii?Q?TYbGv8to3siRRWt6naS01BOm6q+QOgsKUtpCC72oaoba2voEi4iAao4vEmYJ?=
 =?us-ascii?Q?YIk9OX4VOotu9uOvthBt7uBiz2wPgtnlzTT44Snn2+PNMKUxeX04kKaLppnD?=
 =?us-ascii?Q?h6bViNF+CaZRnCBGc+2WoYWuYjAgdCo32JJiH+AkO1mZgZDpLecn8wTC5QDH?=
 =?us-ascii?Q?7pQyQ8Kwio0Vnby5oauMQHX2Z9AOFX84iRNAG2uZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5866.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7de4a45-f26c-439d-da64-08dbc13dbb77
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 22:45:08.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXI9CpTDuR9C8ABvmVD+Cxcru0iTxFrEnhmYnYzyGO5dNIxLDi38wjtbR2eWi8SXpPQLJuYwJLiRUmMplOBGu0aTzsETW9VJ6eQoqyGtQjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
 table entries.
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
Cc: "Summers, Stuart" <stuart.summers@intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Fleck, 
 John" <john.fleck@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Friday, September 29, 2023 2:59 PM
> To: Ruhl, Michael J <michael.j.ruhl@intel.com>
> Cc: Kershner, David <david.kershner@intel.com>; intel-
> xe@lists.freedesktop.org; Fleck, John <john.fleck@intel.com>; Roper,
> Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Summers, Stuart <stuart.summers@intel.com>
> Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
> entries.
>=20
> On Fri, Sep 29, 2023 at 08:01:47AM -0700, Ruhl, Michael J wrote:
> >>-----Original Message-----
> >>From: Vishwanathapura, Niranjana
> <niranjana.vishwanathapura@intel.com>
> >>Sent: Thursday, September 28, 2023 9:49 PM
> >>To: Kershner, David <david.kershner@intel.com>
> >>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J
> >><michael.j.ruhl@intel.com>; Fleck, John <john.fleck@intel.com>; Roper,
> >>Matthew D <matthew.d.roper@intel.com>; Brost, Matthew
> >><matthew.brost@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>
> >>Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page
> >>table entries.
> >>
> >>On Thu, Sep 28, 2023 at 09:48:16AM -0400, David Kershner wrote:
> >>>Device Physical Address (DPA) is the starting offset device memory.
> >>>
> >>>Update xe_migrate identity map base PTE entries to start at dpa_base
> >>>instead of 0.
> >>>
> >>>The VM offset value should be 0 relative instead of DPA relative.
> >>>
> >>>Signed-off-by: David Kershner <david.kershner@intel.com>
> >>>---
> >>> drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
> >>> 1 file changed, 11 insertions(+), 8 deletions(-)
> >>>
> >>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> >>b/drivers/gpu/drm/xe/xe_migrate.c
> >>>index 9438f609d18b..848cdb6af2e6 100644
> >>>--- a/drivers/gpu/drm/xe/xe_migrate.c
> >>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
> >>>@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32
> level)
> >>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);  }
> >>>
> >>>-static u64 xe_migrate_vram_ofs(u64 addr)
> >>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
> >>> {
> >>>+	if (tile)
> >>>+		addr -=3D tile->mem.vram.dpa_base;
> >>
> >>See below...
> >>
> >>> 	return addr + (256ULL << xe_pt_shift(2)); }
> >>>
> >>>@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct
> >>xe_migrate *m, struct xe_vm *vm)
> >>>
> >>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> >>> 	vram_addr =3D xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
> >>>-	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr);
> >>>+	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr, tile);
> >>>
> >>> 	return 0;
> >>> }
> >>>@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> >>*tile, struct xe_migrate *m,
> >>> 	} else {
> >>> 		u64 batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >>>
> >>>-		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr);
> >>>+		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr, tile);
> >>>
> >>> 		if (xe->info.supports_usm) {
> >>> 			batch =3D tile->primary_gt->usm.bb_pool->bo;
> >>> 			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >>>-			m->usm_batch_base_ofs =3D
> >>xe_migrate_vram_ofs(batch_addr);
> >>>+			m->usm_batch_base_ofs =3D
> >>xe_migrate_vram_ofs(batch_addr, tile);
> >>> 		}
> >>> 	}
> >>>
> >>>@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile
> >>>*tile,
> >>struct xe_migrate *m,
> >>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> >>> 		 * vram is less, when we don't access it.
> >>> 		 */
> >>>-		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos +=3D
> >>SZ_1G, ofs +=3D 8)
> >>>+		for (pos =3D tile->mem.vram.dpa_base;
> >>>+		     pos < tile->mem.vram.actual_physical_size + tile-
> >>>mem.vram.dpa_base;
> >>>+		     pos +=3D SZ_1G, ofs +=3D 8)
> >>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> >>
> >>I think this is incorrect.
> >>We need to map the whole device LMEM, no just the tile LMEM for each ti=
le.
> >>This is because we should be able to move the bo from one tile to anoth=
er.
> >
> >My understanding, is that the page table is created for the tile (there
> >is one per tile), to migrate data to and from the tile.
> >
> >How is this different from moving from sysmem to vram? Where is the PTE
> >info for the sysmem side of this?
> >
> >If this is for a general purpose page table, should this be created for
> >the device, rather than having two page table with the same info?
> >
> >I see that the only tests that use this are sysmem -> device and device =
->
> sysmem.
> >
> >Is there a use case test that shows a migration from one tile to the
> >other?  Would like to test this.
> >
>=20
> We can have xe_migrate_copy() function getting called with same object fo=
r
> src_bo and dst_bo, but different lmem regions for src and dst.
>=20
> We may not have a good IGT, but I can think of VM prefetch
> (XE_VM_BIND_OP_PREFETCH) and access counters as use cases that can
> trigger migration of BO between tiles.
>=20
> >>And the identity map I think should start from device dpa
> >>(xe->mem.vram.dpa_base) instead of 0-based. The xe-
> >mem.vram.dpa_base
> >>gets updated based on whats is >programed into PKG_ADDR_BASE.
> >
> >This makes sense if there is only one table.  Since the created for
> >each tile, it will have some over head.
> >
> >For instance, the offset for the VMs are currently need the tile offset
> >included.  The new code does not need that.  If we use the identity
> >mapping with the full space we will have to break the tile offset out
> >as a separate value to keep track  (will need to be added per tile..).
> >
>=20
> I did not fully understand your question. xe_bo_addr() has the dpa_base
> included (not the tile offset).
>=20

I'm confused, xe_bo_addr returns the offset based off of vram_region_gpu_of=
fset,=20
which returns the tile based dpa_base, which has the tile_offset in it as w=
ell.

Should it be returning xe->mem.vram.dpa_base instead?

David Kershner


> Niranjana
>=20
> >Thoughts?
> >
> >Mike
> >
> >>Niranjana
> >>
> >>> 	}
> >>>
> >>>@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
> >>> 		cmds +=3D cmd_size;
> >>> 	} else {
> >>> 		/* Offset into identity map. */
> >>>-		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
> >>>-					      vram_region_gpu_offset(res));
> >>>+		*L0_ofs =3D xe_migrate_vram_ofs(cur->start, NULL);
> >>> 		cmds +=3D cmd_size;
> >>> 	}
> >>>
> >>>@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile,
> >>>struct
> >>xe_bb *bb, u64 ppgtt_ofs,
> >>> 	xe_tile_assert(tile, update->qwords <=3D 0x1ff);
> >>> 	if (!ppgtt_ofs) {
> >>> 		ppgtt_ofs =3D xe_migrate_vram_ofs(xe_bo_addr(update-
> >pt_bo,
> >>0,
> >>>-							   XE_PAGE_SIZE));
> >>>+							   XE_PAGE_SIZE), tile);
> >>> 	}
> >>>
> >>> 	do {
> >>>--
> >>>2.35.1
> >>>
