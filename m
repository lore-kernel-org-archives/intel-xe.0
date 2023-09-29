Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46047E71D42
	for <intel-xe@archiver.kernel.org>; Fri, 29 Sep 2023 15:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C1C10E10B;
	Fri, 29 Sep 2023 15:01:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1728610E10B
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Sep 2023 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695999714; x=1727535714;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jhZOC8LwkoT0CSbhILlcU3o2GlwN1UqGOpG8jsteNJE=;
 b=mahSt5ev5qYEFmhnK8ZyxQMI73Wn+mpb66mJ197gJDoQDhR2hVealjoO
 XXSI+ZAi1y6PM45aZQmyJd6rq5h1qqHkMNcxaqsOuWj4fvjKjww1QszOv
 Xl/h0Vf/lreSf/n4gycxRfbFd8/Gl+N9qlmbfdAJfOHmhwdJLVTgsUa7L
 lkeimxSYsA41C7D9vGx7ggx/dfKaeL+TNNzg81ihrjBwrMSGDrUxR6b9l
 lnwZv9UiiTj7Wh4uDYXue4gQnweq9Zx6+tjC+0iQPasPAjEjpc4uJlrXm
 B3Ej8qV4VX0HE/r+WwQPHHuGKLXyIGOwyKalpb1RwkHtIIoBEI9RSPw8u A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="361693147"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="361693147"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 08:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="865737158"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200"; d="scan'208";a="865737158"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Sep 2023 08:01:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 08:01:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 29 Sep 2023 08:01:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 29 Sep 2023 08:01:51 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 29 Sep 2023 08:01:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EvsFYx6ERVWDwCbnhWLGbqCZxCGhsQXkY/lnj2tCCejyBrrQwwcxSNPLOKiNcbe2YgIti+h56XtyVklNGeAHInsElufEDNxW7ivQq4knDRkU6yjrfaZj4fazfL7dMm6imo3bQkRzjZK7QmI9q9DfjmWtnTEbUFtsPiFwPp2dxe6WIq9ccJnIT/xlbD3vgvjZpT6z+bzSwXpoWpGtg+/585buiWJTM734+YMrKBcUjMqeBvYo/guOvNctB2zMaXiKpp6O+6To1t02qe3U4/hlxYuidvDKWX2WgD0Xt7Q2QoJVcLc1Jvh+lIp2q5AjcjEyTmihCoCBoVfPA+Sgyd5cGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZ4FYN4nChZVCGdyx66q31wwlKE3DwQr22s5P5g7T2M=;
 b=Msp3JnjWAMy75PpUtuRJkkooTCCHVY47cAXGlzVDaF+xxgp+VDAXhUhtkuH+hK2sKhVcHIyKBXuPnQ+pZInpFCy1uYaYzyu4az8w2yjV99qKBidBKCFMcnidjuXDWL7Mcx5iQUESwoUxCi+1sN4zRCV6kmwkAfZE7Ws41Fzx3nCNSqZxv4SDwy4pmpRhLw9u0QgEldrZ0oC354dzMkYwjdflMvjwA/FZhOIn4v072uAmK9Si9yygRXC4H/LRitdDsCeX00COOejFYH5RR2LrwqKLlQSkqa21vMMPt3C8IqpDCOawnVYGUztm8RsWyrUo8W44pf4BUfN/3tHl/fxCCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 29 Sep
 2023 15:01:47 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6813.017; Fri, 29 Sep 2023
 15:01:47 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "Kershner, David" <david.kershner@intel.com>
Thread-Topic: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
 entries.
Thread-Index: AQHZ8hJ3LXqL+D0Bm06PrDXkVVnQ7rAxCjaAgADTcwA=
Date: Fri, 29 Sep 2023 15:01:47 +0000
Message-ID: <IA1PR11MB64189D31B23DF1F4667BCBB7C1C0A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20230928134816.881379-1-david.kershner@intel.com>
 <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
In-Reply-To: <ZRYtJxlhG/nU36n0@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|CH3PR11MB8519:EE_
x-ms-office365-filtering-correlation-id: a13e5152-be5b-4843-65f6-08dbc0fd0099
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qf7rvBTWeSS8UQQMvFMY7Id5ZR00P3ssuTyZQjdikuGszdzqZnTi0T2i9EgIFt3BK3QuEeoSDAjeU5+VySoprcow6QwtJXSgnHzcxll+cfEGaNmqPtIIsy0Y5sz6FIPl8u7CRxnzH+axWqE6FOyAk4caw9M6CBygtBMwcWQ1FXQrtqpsa2tHLZh/0tVugXU9yMA6Pev+IkF4lUSWzcp374IWk5qtf5oE8rJaAtDO1/eYOCx9ptKHQZvuztERxnFV8PugNW3nu3IlrYseZOEl3zHOc6a3y4+Lwsj4L76dbti+5Du1tnLpPNxxaMxh/LMz3FlujrM9hlaVjTvXX9bcB2xkiCBPYa2CByA1pZNYS5J8d/dmL5SH+0vpPcxoogb6KdMe5ezj72oAqam+P/HusWe1vP7ZzMk5wEaFfVpqpJQgH2IWzOObCXAsmZvTOcjk5UiNbXEV72tporQVgM9/hFEWcWtH8cqjODRDMuzNY0qT8WoY2YTSkrpdmER82o1qU2LpBW9kmIbO7JtnMstHnr4cy5BNF2mShxtgtfbGqzz25iLJQmu5kVy59pyzSJ+cMsJeGku3MleV5PqQsMVzFzNJydeff/Lo+5eCISSPagtSxhTTlT2ItqjfzvpLgTZM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(26005)(7696005)(6506007)(478600001)(9686003)(8676002)(316002)(66946007)(83380400001)(107886003)(71200400001)(6636002)(64756008)(66476007)(54906003)(8936002)(110136005)(76116006)(66446008)(4326008)(66556008)(52536014)(41300700001)(5660300002)(2906002)(33656002)(38070700005)(86362001)(38100700002)(82960400001)(122000001)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?S7iYNDtgoNMhiivjhl1p/KlrVOXrDQsH31f7XyUiZqvjtAKeDefXpwkk72J6?=
 =?us-ascii?Q?jEStQEwsHb8h12TqI6jRyV2M+kT6Ns53PA8XWY2JNBRAWr+ZqhtdSrmboFFd?=
 =?us-ascii?Q?nBpUODckfbCE7f1BHGnqgpOPyDIXoB705YHKQPK0R4hCoHfPzBX3w8n4i3kf?=
 =?us-ascii?Q?5jkqx9I1+eWQMkEgZiIqw8UBtnyKaJ6VaHbrqAcwREcPEHMPCx/MKMi7j8yo?=
 =?us-ascii?Q?CdRkpAOp6bGZbNiNS4Q7q5arG0u6Xt0EjWnhhqeGPfLm4j1d89NXk7IwCYit?=
 =?us-ascii?Q?CaSBJr0E6w/lbNmfNzosk+fG7WrmUyMiv4+XdyKQIdrjHoY7Ph2tjL5kBSoa?=
 =?us-ascii?Q?rpzFd2s5W+6yUOgnGxphHeL0/+GqQFjOQuib+niE5vFiUC67WYSuOqjWNV/6?=
 =?us-ascii?Q?uSOodgXHtqo8/eCsqtGm2e0w7Lj6uhr4n0XmjKqBc8Xn5euTTwE0Chlj3sjm?=
 =?us-ascii?Q?1GNhb11JPH1s8LhW6hHJMwERHCR1kR91EruFu8o/Hyk4Mf6XTDZCzy/x7Dux?=
 =?us-ascii?Q?OekjRwZp1HQ7V2ltDvNLUE9Ao6Jk3aw/op8TDu8DyJc0+uIhprwJwHuLZvCX?=
 =?us-ascii?Q?x9SCqHE65ZWDIfTFV8Hu4UVaSxIK6s1xTnmqcgVmCrTP1cJPvspE9cI/oQMK?=
 =?us-ascii?Q?1TYHqwgD0GsXmA8hPp0f7IpmeTUZFQ+z//GPG8lXsKdhZXPjMfbAi6XQoOtt?=
 =?us-ascii?Q?0ytI3ymJqOxJy262v/D0L6HhW2f91+SkTzCWjnn+I1Awa2fl3xdAK0o2pFqD?=
 =?us-ascii?Q?2SDSD3EIqptsPBYS6ov5NqD6O8TvVFyrJvUpb8Fcb96UhjmVws6/ZNBd6yyy?=
 =?us-ascii?Q?7wvj2Rm+O+ElPUKLrx5LZ6PqH8zsr5JGubFhwvyrNo+VWXgo8pRFsl9aYdHv?=
 =?us-ascii?Q?EbFMUIPNoQmkHP/RJ6zVkrHLIipMKga0Oa8JQBe3iaepw7wAYPAjAe4AUvw/?=
 =?us-ascii?Q?YRl395fLepfMO60VrHXwEdgHx3sWNhX/yv1m71iwGL4KHfDEt4/w1YBWUU4M?=
 =?us-ascii?Q?ABbU0pavsb7zLwzB+9MTZPFlWMz5MY+yk/hiyo76RJTE+aCG/t3SFJU3Qgpg?=
 =?us-ascii?Q?rRw8mT0n81MIF0XiPmwXZducBrIzKtAGnZP1iYfAhqjRk0xDBbxlslENNZTq?=
 =?us-ascii?Q?AdufNjKgI6u9wTrhi462O6Yntd8b+MO9Ib5ejWBayLisD5R8Pq33tOiYGofJ?=
 =?us-ascii?Q?v+TZWE8NcVNspi9A3r3mAG7DMe+Vs9bB6GCAX64QNzTWdObqYZ/wrOURc/hZ?=
 =?us-ascii?Q?6lsfBV6zb8MHvK5Z5KSdJdMQzmCUOF3c8vsc4AzBkyQyUjfYCYG3LyOqyJkI?=
 =?us-ascii?Q?Q0mdpCWlnixl7aeqUTP0SkF7WEC5gkg0Px3AZhKF+bVQwxDWt1Bm5akO0tWt?=
 =?us-ascii?Q?mV4AStgGDwJ1eD6K1m8TvCnWkzXNkuGIwSYuYS+/MrZhFDd4XNs/VPTc0ie6?=
 =?us-ascii?Q?hP6PX98jOeyuKz6375g9s1lzcZPKHM0JPq72OKDs/SeJjAG5jpALc2FpfPno?=
 =?us-ascii?Q?EiQuVXPsFYY4qCDgK4ZGq4GvNY5SUJPLsRW5/4RQHPEmFRDKgUQ03cFqg2tm?=
 =?us-ascii?Q?cLewoe3NQPl9AAjRlT1lz/CVvWfuJP4cqQyaGNI6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a13e5152-be5b-4843-65f6-08dbc0fd0099
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2023 15:01:47.1922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qfg+nJI7UDzMo1pk58+QsYmVtgrRMgRPhz4G6mDcRhRDmlpVwolVPi3aVtbgg4/4hhF4oLL5U2C3Goy9j5jQgHCcLGmyq2YLvrvu6UJF9M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

>-----Original Message-----
>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>Sent: Thursday, September 28, 2023 9:49 PM
>To: Kershner, David <david.kershner@intel.com>
>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.=
com>;
>Fleck, John <john.fleck@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>Summers, Stuart <stuart.summers@intel.com>
>Subject: Re: [PATCH] drm/xe/xe_migrate.c: Use DPA offset for page table
>entries.
>
>On Thu, Sep 28, 2023 at 09:48:16AM -0400, David Kershner wrote:
>>Device Physical Address (DPA) is the starting offset device memory.
>>
>>Update xe_migrate identity map base PTE entries to start at dpa_base
>>instead of 0.
>>
>>The VM offset value should be 0 relative instead of DPA relative.
>>
>>Signed-off-by: David Kershner <david.kershner@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_migrate.c | 19 +++++++++++--------
>> 1 file changed, 11 insertions(+), 8 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>b/drivers/gpu/drm/xe/xe_migrate.c
>>index 9438f609d18b..848cdb6af2e6 100644
>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>@@ -114,8 +114,10 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
>> }
>>
>>-static u64 xe_migrate_vram_ofs(u64 addr)
>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_tile *tile)
>> {
>>+	if (tile)
>>+		addr -=3D tile->mem.vram.dpa_base;
>
>See below...
>
>> 	return addr + (256ULL << xe_pt_shift(2));
>> }
>>
>>@@ -149,7 +151,7 @@ static int xe_migrate_create_cleared_bo(struct
>xe_migrate *m, struct xe_vm *vm)
>>
>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>> 	vram_addr =3D xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>>-	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr);
>>+	m->cleared_vram_ofs =3D xe_migrate_vram_ofs(vram_addr, tile);
>>
>> 	return 0;
>> }
>>@@ -223,12 +225,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>*tile, struct xe_migrate *m,
>> 	} else {
>> 		u64 batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>
>>-		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr);
>>+		m->batch_base_ofs =3D xe_migrate_vram_ofs(batch_addr, tile);
>>
>> 		if (xe->info.supports_usm) {
>> 			batch =3D tile->primary_gt->usm.bb_pool->bo;
>> 			batch_addr =3D xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>-			m->usm_batch_base_ofs =3D
>xe_migrate_vram_ofs(batch_addr);
>>+			m->usm_batch_base_ofs =3D
>xe_migrate_vram_ofs(batch_addr, tile);
>> 		}
>> 	}
>>
>>@@ -266,7 +268,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile=
,
>struct xe_migrate *m,
>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
>> 		 * vram is less, when we don't access it.
>> 		 */
>>-		for (pos =3D 0; pos < xe->mem.vram.actual_physical_size; pos +=3D
>SZ_1G, ofs +=3D 8)
>>+		for (pos =3D tile->mem.vram.dpa_base;
>>+		     pos < tile->mem.vram.actual_physical_size + tile-
>>mem.vram.dpa_base;
>>+		     pos +=3D SZ_1G, ofs +=3D 8)
>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>
>I think this is incorrect.
>We need to map the whole device LMEM, no just the tile LMEM for each tile.
>This is because we should be able to move the bo from one tile to another.

My understanding, is that the page table is created for the tile (there is =
one per tile),
to migrate data to and from the tile.

How is this different from moving from sysmem to vram? Where is the PTE inf=
o for=20
the sysmem side of this?

If this is for a general purpose page table, should this be created for the=
 device,
rather than having two page table with the same info?

I see that the only tests that use this are sysmem -> device and device -> =
sysmem.

Is there a use case test that shows a migration from one tile to the other?=
  Would like
to test this.

>And the identity map I think should start from device dpa (xe->mem.vram.dp=
a_base)
>instead of 0-based. The xe->mem.vram.dpa_base gets updated based on whats
>is >programed into PKG_ADDR_BASE.

This makes sense if there is only one table.  Since the created for each ti=
le, it will
have some over head.

For instance, the offset for the VMs are currently need the tile offset inc=
luded.  The
new code does not need that.  If we use the identity mapping with the full =
space we
will have to break the tile offset out as a separate value to keep track  (=
will need to be
added per tile..).

Thoughts?

Mike

>Niranjana
>
>> 	}
>>
>>@@ -441,8 +445,7 @@ static u32 pte_update_size(struct xe_migrate *m,
>> 		cmds +=3D cmd_size;
>> 	} else {
>> 		/* Offset into identity map. */
>>-		*L0_ofs =3D xe_migrate_vram_ofs(cur->start +
>>-					      vram_region_gpu_offset(res));
>>+		*L0_ofs =3D xe_migrate_vram_ofs(cur->start, NULL);
>> 		cmds +=3D cmd_size;
>> 	}
>>
>>@@ -1027,7 +1030,7 @@ static void write_pgtable(struct xe_tile *tile, str=
uct
>xe_bb *bb, u64 ppgtt_ofs,
>> 	xe_tile_assert(tile, update->qwords <=3D 0x1ff);
>> 	if (!ppgtt_ofs) {
>> 		ppgtt_ofs =3D xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo,
>0,
>>-							   XE_PAGE_SIZE));
>>+							   XE_PAGE_SIZE), tile);
>> 	}
>>
>> 	do {
>>--
>>2.35.1
>>
