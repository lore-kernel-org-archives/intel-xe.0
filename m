Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05573CFC516
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC5810E043;
	Sat, 22 Nov 2025 01:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SYFO/3f2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F117410E043
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763776486; x=1795312486;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mrEnafOIno5Srk2nX/ErZ6AmQs0haODRQm42adH+i+c=;
 b=SYFO/3f2H3Fr7xMw1n7JayKGlI2avr12N6J6/3c05S7km7Y0WmbgGDSc
 KVbPqG7H91Wu/pF51DDwCvNb9yll+wXjmGRv8pUTaGwSPUtmMGZHnGP20
 3siSPwqXlCYHk9TbxbsntDtlz3lWuokEQbhosvyYVjGBPcxa6cRLSzKFj
 w5GvjIy44i96hQRSVY9gyKIOsKWMDBPezL6BKWRMWzXXzYSxlYWN7tHIk
 ma88YKQosdrD2V9NHkF3a3wwEFKYDq36roKX5tWReE3Pj7cL4kXOAK5ow
 KsNhPJ2MtVvFFkslWleY8Nuk/8mNWrv/4fZ3oO7hn/emd2eg9K9ENiK4S Q==;
X-CSE-ConnectionGUID: iB09uzwzTlWKohaX2KKTxw==
X-CSE-MsgGUID: D80mI26yRBWtCyVDMP+Irg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69731050"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="69731050"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:54:45 -0800
X-CSE-ConnectionGUID: L1cwviX/QEO6vn+8PHuiqA==
X-CSE-MsgGUID: FMpTlQ1TSZWAdKFFTZ1J2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191718040"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:54:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:54:44 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 17:54:44 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:54:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvbiZJhv7qPhmTLH1vy4wKjXvkrq8r3Lri9Mqjo7PGn8zz1pm38ov2ErummLd2pAcqYEsQN8PPdHr6oiHeZB60Whqz9EoUUM/mN3oEySjF3jdxc487uwrrSVrjBNsM0Oix+hRPLzNuUaR9h9VeHQKsHUh4W9n2KsdaG3xKBPaJ8DstgDif4+ttKWZplNOPuq6nu5nHsL7dZVc6K2bHHUGHv65t5NQNFsP+5zoNYx4TjZyqpz2Hk8IU9B8X/SiLxBXVRXERtobDNmWYIGp/Mz4i+wxQyhe8ZF9jX/J7X3Z17pSXQ03L/fHywhKhUUFP5QGu9fh6npncLZYbWSxw84FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCaOYgAA18MVbTieJi5evMETlkhFgZpOXkm1ZGikzJM=;
 b=SXcNP76149c5R8uw3F9n9MKJzOTj26EJIvyJDwan3QK4OfFQTvJFoG9dNiCYkeAAe3sww6kxc/L92s+2ZmLvOOxxzs+7r6wUbwbwz2mpi533vISbdocA8T/adzY1vJbiOSCSi7Oq8vx+2iDl4dfzeDF09JMN8IIPEt2kGOq6Y6qbl8a/cuHXT08ETpvBjl5WiDt3QoBxB7zKtUpEK0oQGtVxVOMy6yEHKR9IJKkxLqsvSadT3f/97RC+aMSb8Pr0Vjmp1NvJZ6//rlfd/04RLpktoLkovMLL0gehV+uv2EIzLdjsNpjaxnG/iPWiap9dSTelUR8/zdEdmxdwhj1KbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 01:54:43 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 01:54:43 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Topic: [PATCH 03/11] drm/xe/xe_tlb_inval: Modify fence interface to
 support PPC flush
Thread-Index: AQHcWGqVM1mB+DpWc0uEi08qflVNwbT9cUQAgABQx8A=
Date: Sat, 22 Nov 2025 01:54:43 +0000
Message-ID: <SA1PR11MB883940C3412B15E6E9E5E189AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-4-brian3.nguyen@intel.com>
 <DM4PR11MB54568A7D65434A8212340866EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54568A7D65434A8212340866EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: 70ee2fb7-20ad-4727-cef5-08de296a1b13
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?lf4AxZW8tBgE/kWBftRd4Qm5Vx8/2ApZJBJ/LIzr6/9orWUs8ZdHoSMiBraC?=
 =?us-ascii?Q?FjMabWG5Io/U/uBYwKHlcpjxaYoD8RA3rJM/TxHVr9vDD98iV5+7TIZIBKNJ?=
 =?us-ascii?Q?VQZIVRGZ4c0reEXuMeUec6CUrIRvotUpsWXQTJFcJVmFVdN7wx1qxvH0uyVL?=
 =?us-ascii?Q?vtRXmAawPKbKNvOeJAT3lzB+H/Mm4qQRfcbgozHEAZx9ofl0PtQ3lHt0Aw2G?=
 =?us-ascii?Q?VaX0vAgOGGbM9Bcmb870fhUKmeGKAE9+a0PHjYI6RcKNesNuuagHFP0ER2Dg?=
 =?us-ascii?Q?3ULx2M4rl2jCCUJGgrfpWzFqBJUAAlBMgwX2hfgainOv+QCTSRWaI7gbDxEO?=
 =?us-ascii?Q?c5laQmYvjF1Pm0mgsBWXmFk6TShlCbQwfrlzzDR6ZS4JUqIkp8BTHdCwRcr5?=
 =?us-ascii?Q?Vz3udhI6KKB+GPLkYEu7OUCzImkePzZGSCaOvgLIJbXar4fd+4QfFhXquj6P?=
 =?us-ascii?Q?yRNr0j+CBKLS3GWzM/1Buzba/UAmYhBCvJLD++OowaRcFRyw2Mb8l4o+zETu?=
 =?us-ascii?Q?bI5DK2w/bXk2b5hhfVHmKw+s/YfbO+MZQNy2REG6YTzBPa9sYD+nI0dZT9CP?=
 =?us-ascii?Q?Y6UYgjCFfRTNy//yFn6/oqTg1fdc+Yj06aHlKXkAOhNe6WwrtAZQ5QxgdSiK?=
 =?us-ascii?Q?6y5b5zkwNb4d4UtKtXxeCRX/oaZy7SafL/pXKy6qSg0RuA7bdFn46+m+6Cur?=
 =?us-ascii?Q?NX/IzMBzc8OBdI/XCkqRUQsv5U6mRXU/aCH/0aGoL6t5IK1rklRQ09knfudJ?=
 =?us-ascii?Q?9dXApvCs+FsqPZsYmFsLdLUbRFg0BPuU9LXnAjnZSVyf3YFbBKN6WAGjUjeV?=
 =?us-ascii?Q?eKO8OukQ1fzHRBabrxEZCsdJC3UxY8iyX0D7dHfdladg0v6f27I7CyEuLZqe?=
 =?us-ascii?Q?vrONi1sPQJ6dPjJnA+FYY8onO30QlZJPj8yPJ64OdyficMye7zt8W03jJeon?=
 =?us-ascii?Q?exuq40/6s/SVUr5ljpLNooSJZ2YhOQ0VbySN9IRs04vM0RXZwGVVpsoD7xU6?=
 =?us-ascii?Q?9rNjkjpfegSXM/v09xZwixzTss4Qh9uQYMI2F8O1o6+85Y+KnrSUNsjUyJ/M?=
 =?us-ascii?Q?D8fo12Nr4tSBj0Dk78TVWUn8oq9gAZvJmQ0/2jaNBA64WNow1MRZ7R1VLe75?=
 =?us-ascii?Q?Q9bG/ZIUKHWXIKHi6CWD1Fp2tF8Ij0bgHYc29j6ZyD+3FD0X+2N1kyc46fhb?=
 =?us-ascii?Q?v2zGLoZ0CEaz96MH9nFQ1xdPk67217snKM0JwbewjpoRbVf71scxlOJJtsHy?=
 =?us-ascii?Q?ga078fAuUswMB6iH1YmWsHmxX7EUdHOeuXxX+DC/ixWM1ZbFoL/DrbtzVUQg?=
 =?us-ascii?Q?u0TcsgfhAKH5fKZmULz7Ky3yQNUmKj0nVoByp82cSOyKDA5lRiFY1+ipfguj?=
 =?us-ascii?Q?uLFU9qckwwsHxDteoOv4mCGg5+dB9ZjZP2rUsnHYSIZFKNsDEJ2RcNUT/Ks2?=
 =?us-ascii?Q?F8mQfIICGXjIe5g7KxZPrEu9dkYfPDFIDwOWMmcZuRXqOU2pXk2VOkKlr1vS?=
 =?us-ascii?Q?x1yxFiMG7BeBciiQMc137TtX+s123n8w0fY9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pntlbduEpZXUHFS9ZKeVzcazYtWAEgQ/fxLUIOhx/XTfklZs3cYkY1r4BeTH?=
 =?us-ascii?Q?/Z97VEb8/4hLeK5Tqqms9VI7SJ1jMfrgscv921A8lcTFoY0si5wtYOZ08AdQ?=
 =?us-ascii?Q?ZdwQ0x6d3O2/gq8wJJRSqgzR+LtEmbHybH0EDB3854ciAp7Emkr4GGshH2EN?=
 =?us-ascii?Q?P3du+rYt+USBd2N5wCeIDP7GBIC+eFnijSMwnxVqOjfBPQYGoyWOHGMMRSFD?=
 =?us-ascii?Q?QsOZj5qL1WyG1h3mX4kPTixCnmNvxEO0d7E81L6qdMWejZY4bzAXUFKk/Cl3?=
 =?us-ascii?Q?f9NLQLy5TYwqvIvKoBHoZBlmS7IzTPoWbx1CvITLnAaQcug8IlRxaHGYIHzp?=
 =?us-ascii?Q?edkDreTyj/iofCPxdysfROwCmrHNW1/ctyxxhHE26pR/BY3AlAK/2zQBJTPe?=
 =?us-ascii?Q?U3lqX3+lORv7B0J7e1FHBe/SxIZ8+oF5+TObZAO4SHm+Mm5SmbNtTTnltQfu?=
 =?us-ascii?Q?UTe+7gqiD4gymmFJRH12/h9mbOjeDBS5fgQOn5Trhb7Dz+0f35X3BAlLIsbR?=
 =?us-ascii?Q?rCbPETHrj8B9d4jE0BKbatoJLXSKjbllCvd/GOej+1EkKyEOvmvhsagfy5Hr?=
 =?us-ascii?Q?4yXDqusIhVyRmJkhU4kRJq5wEIRI595J/50BK+IKdpdzyvYX0lHGVnXCx8Cd?=
 =?us-ascii?Q?XfJcaEYl2zdWXQWhLO8USYIY3Pyo/GWYDhcPzwOUNDFZYH1l3UJ4edG3A298?=
 =?us-ascii?Q?G0h7vAFE341SXwFOnXe/1+cs+1AXAK1l56XOnyXvgWqMq7UOLWf/uQt9m8vX?=
 =?us-ascii?Q?fSEaivboXA8hHK6MpnsqlaD4gVHJFYi77DhCX2N61rPxEOurCVIaN1lg+Hm9?=
 =?us-ascii?Q?8rJe0wgiyrwpjmwV1jIwQUcXZANNiQ2FmwwjUu/spcCQLXczwfhsMcdzQ0gu?=
 =?us-ascii?Q?+p4YcCsfJMvaJ6jC4UrC+WE6D9bSZ/yUv7UGbOL94lbGinkYIUkroHJDONjC?=
 =?us-ascii?Q?Zyd2WmYb9JPL4gWpTp9Gzr/W4CuSUJU50FIsfhXsQ1tO3EWMuPNfMVsAVsC2?=
 =?us-ascii?Q?XN6TLvXh792i/xkk46KHspX1l6afIySepY7q83VZZgfiZ3whMI8EcWjjkHZu?=
 =?us-ascii?Q?Crz10UpTnm7/cPY5ddq9+FgzYJdvjoFx9QmOYhmX/uqOW7Ut4eNjF1CZcVK6?=
 =?us-ascii?Q?wG9Xgig3E58lDkSP2HMTI2foI4IBWmpTc3sxc6CjXu7OT+ea3ZaoC8RW4YPH?=
 =?us-ascii?Q?t8AV0LE+uQF03zQd8g5cSwjupHezab1MpXxdJDmndFWsoSGI9OBdl60KPK6q?=
 =?us-ascii?Q?zUldQvKJvvoPtXPt2w+ZsfXpP28wr6RedAc+7AC6TQukde4ICN7jVep44gXn?=
 =?us-ascii?Q?3fsHfIa0lcXvTV9pCMH/a0EtgvYykS0ynNIeHI18JBy80ZlPs9hBMaS4AWib?=
 =?us-ascii?Q?uB/BpjTT10iDSUofisyAMK59vVmKhHu2Ac+WNVxW2EjbLiB6+bqpg1H3lxAP?=
 =?us-ascii?Q?9djLvwn8MLpMjv/iK8H4d8JmOc0PI+FoKXijBAgPhwzA1SD1LrE0ZG1nTySb?=
 =?us-ascii?Q?eAVgxsGurHcFq41t6q/1m8h0aCYT5be0BiXaKY/08ki9++ocX6QGEclk0ujZ?=
 =?us-ascii?Q?X1MM4NDJFdo1XJ9aiEIc0DG/mApcdNfGXbSiGHeQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70ee2fb7-20ad-4727-cef5-08de296a1b13
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 01:54:43.0670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IwuEcXC69RlQ3e+i4xq1upoEQmev0lzglH5MAzqyrDMWNiYJnFCNt/fnanMVunHUBenYUqwxr9qSh5Y2inHiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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


On Friday, November 21, 2025 10:03 AM Lin, Shuicheng wrote:
> On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > Allow for tlb_invalidation to configure when driver wants to flush the
> > Private Physical Cache (PPC) as a process of the tlb invalidation proce=
ss.
>=20
> How about "Allow tlb_invalidation to control whether the driver flushes t=
he
> Private Physical Cache (PPC) as part of the TLB invalidation process."
>
=20
Sure, will change in next patchset.

> >
> > Default behavior is still to always flush the PPC but driver now has
> > the option to disable it.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c   | 11 +++++++----
> >  drivers/gpu/drm/xe/xe_tlb_inval.c       | 21 ++++++++++++++++++---
> >  drivers/gpu/drm/xe/xe_tlb_inval.h       |  5 +++--
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c   |  2 +-
> >  drivers/gpu/drm/xe/xe_tlb_inval_types.h |  5 ++++-
> >  drivers/gpu/drm/xe/xe_vm.c              |  4 ++--
> >  6 files changed, 35 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index cd126c53faab..c05709a5bc98 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -34,9 +34,12 @@ static int send_tlb_inval(struct xe_guc *guc, const
> > u32 *action, int len)
> >  			      G2H_LEN_DW_TLB_INVALIDATE, 1);  }
> >
> > -#define MAKE_INVAL_OP(type)	((type <<
> > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> > +#define MAKE_INVAL_OP_FLUSH(type, flush_cache)	((type <<
> > XE_GUC_TLB_INVAL_TYPE_SHIFT) | \
> >  		XE_GUC_TLB_INVAL_MODE_HEAVY <<
> > XE_GUC_TLB_INVAL_MODE_SHIFT | \
> > -		XE_GUC_TLB_INVAL_FLUSH_CACHE)
> > +		(flush_cache ? \
> > +		XE_GUC_TLB_INVAL_FLUSH_CACHE : 0))
> > +
> > +#define MAKE_INVAL_OP(type)	MAKE_INVAL_OP_FLUSH(type, true)
> >
> >  static int send_tlb_inval_all(struct xe_tlb_inval *tlb_inval, u32
> > seqno)  { @@ -
> > 100,7 +103,7 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval,
> > u32 seqno)  #define MAX_RANGE_TLB_INVALIDATION_LENGTH
> > (rounddown_pow_of_two(ULONG_MAX))
> >
> >  static int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 se=
qno,
> > -				u64 start, u64 end, u32 asid)
> > +				u64 start, u64 end, u32 asid, bool
> > flush_cache)
> >  {
> >  #define MAX_TLB_INVALIDATION_LEN	7
> >  	struct xe_guc *guc =3D tlb_inval->private; @@ -154,7 +157,7 @@ static
> > int send_tlb_inval_ppgtt(struct xe_tlb_inval *tlb_inval, u32 seqno,
> >  						    ilog2(SZ_2M) + 1)));
> >  		xe_gt_assert(gt, IS_ALIGNED(start, length));
> >
> > -		action[len++] =3D
> > MAKE_INVAL_OP(XE_GUC_TLB_INVAL_PAGE_SELECTIVE);
> > +		action[len++] =3D
> > MAKE_INVAL_OP_FLUSH(XE_GUC_TLB_INVAL_PAGE_SELECTIVE,
> > +flush_cache);
> >  		action[len++] =3D asid;
> >  		action[len++] =3D lower_32_bits(start);
> >  		action[len++] =3D upper_32_bits(start); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > index 50f05d6b5672..de275759743c 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.c
> > @@ -324,10 +324,10 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval
> *tlb_inval)
> >   */
> >  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inval,
> >  		       struct xe_tlb_inval_fence *fence, u64 start, u64 end,
> > -		       u32 asid)
> > +		       u32 asid, bool flush_cache)
> >  {
> >  	return xe_tlb_inval_issue(tlb_inval, fence, tlb_inval->ops->ppgtt,
> > -				  start, end, asid);
> > +				  start, end, asid, flush_cache);
> >  }
> >
> >  /**
> > @@ -343,7 +343,7 @@ void xe_tlb_inval_vm(struct xe_tlb_inval
> > *tlb_inval, struct xe_vm *vm)
> >  	u64 range =3D 1ull << vm->xe->info.va_bits;
> >
> >  	xe_tlb_inval_fence_init(tlb_inval, &fence, true);
> > -	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid);
> > +	xe_tlb_inval_range(tlb_inval, &fence, 0, range, vm->usm.asid, true);
> >  	xe_tlb_inval_fence_wait(&fence);
> >  }
> >
> > @@ -420,6 +420,20 @@ static const struct dma_fence_ops inval_fence_ops
> > =3D {
> >  	.get_timeline_name =3D xe_inval_fence_get_timeline_name,  };
> >
> > +/**
> > + * xe_tlb_inval_fence_flush_cache - Control PPC flush at invalidation
> > + * @fence: TLB inval fence
> > + * @flush_cache: whether to perform PPC cache flush
> > + *
> > + * Helper function to modify the tlb_inval fence to control the PPC fl=
ush.
> > + * Other components shouldn't modify fence directly.
> > + */
> > +void xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> > +				    bool flush_cache)
> > +{
> > +	fence->flush_cache =3D flush_cache;
> > +}
>=20
> I don't see this function is used in the series patches. Could you please
> double confirm that?
> Also, it would be better to add inline and just put the code in the heade=
r file.
> BTW, how about rename it to xe_tlb_inval_fence_set_flush_cache?
>=20
> Shuicheng
>=20

I'll remove it in the next patchset as well, it is no longer needed since
we are integrating page reclaim into the tlb invalidation fence itself. Tha=
nks.

Brian

> > +
> >  /**
> >   * xe_tlb_inval_fence_init() - Initialize TLB invalidation fence
> >   * @tlb_inval: TLB invalidation client @@ -446,4 +460,5 @@ void
> > xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> >  	else
> >  		dma_fence_get(&fence->base);
> >  	fence->tlb_inval =3D tlb_inval;
> > +	fence->flush_cache =3D true;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > index 9dbddc310eb9..b84ce3e6f294 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval.h
> > @@ -24,8 +24,9 @@ int xe_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval);  void xe_tlb_inval_vm(struct xe_tlb_inval *tlb_inval,
> > struct xe_vm *vm);  int xe_tlb_inval_range(struct xe_tlb_inval *tlb_inv=
al,
> >  		       struct xe_tlb_inval_fence *fence,
> > -		       u64 start, u64 end, u32 asid);
> > -
> > +		       u64 start, u64 end, u32 asid, bool flush_cache); void
> > +xe_tlb_inval_fence_flush_cache(struct xe_tlb_inval_fence *fence,
> > +				    bool flush_cache);
> >  void xe_tlb_inval_fence_init(struct xe_tlb_inval *tlb_inval,
> >  			     struct xe_tlb_inval_fence *fence,
> >  			     bool stack);
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index 1ae0dec2cf31..6248f90323a9 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -49,7 +49,7 @@ static struct dma_fence *xe_tlb_inval_job_run(struct
> > xe_dep_job *dep_job)
> >  		container_of(job->fence, typeof(*ifence), base);
> >
> >  	xe_tlb_inval_range(job->tlb_inval, ifence, job->start,
> > -			   job->end, job->vm->usm.asid);
> > +			   job->end, job->vm->usm.asid, ifence->flush_cache);
> >
> >  	return job->fence;
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > index 7a6967ce3b76..c3c3943fb07e 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_types.h
> > @@ -40,12 +40,13 @@ struct xe_tlb_inval_ops {
> >  	 * @start: Start address
> >  	 * @end: End address
> >  	 * @asid: Address space ID
> > +	 * @flush_cache: PPC flush control
> >  	 *
> >  	 * Return 0 on success, -ECANCELED if backend is mid-reset, error on
> >  	 * failure
> >  	 */
> >  	int (*ppgtt)(struct xe_tlb_inval *tlb_inval, u32 seqno, u64 start,
> > -		     u64 end, u32 asid);
> > +		     u64 end, u32 asid, bool flush_cache);
> >
> >  	/**
> >  	 * @initialized: Backend is initialized @@ -126,6 +127,8 @@ struct
> > xe_tlb_inval_fence {
> >  	int seqno;
> >  	/** @inval_time: time of TLB invalidation */
> >  	ktime_t inval_time;
> > +	/** @flush_cache: bool for PPC flush, default is true */
> > +	bool flush_cache;
> >  };
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index
> > 7cac646bdf1c..5fb5226574c5 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -3907,7 +3907,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> > *vm, u64 start,
> >
> >  		err =3D xe_tlb_inval_range(&tile->primary_gt->tlb_inval,
> >  					 &fence[fence_id], start, end,
> > -					 vm->usm.asid);
> > +					 vm->usm.asid, true);
> >  		if (err)
> >  			goto wait;
> >  		++fence_id;
> > @@ -3920,7 +3920,7 @@ int xe_vm_range_tilemask_tlb_inval(struct xe_vm
> > *vm, u64 start,
> >
> >  		err =3D xe_tlb_inval_range(&tile->media_gt->tlb_inval,
> >  					 &fence[fence_id], start, end,
> > -					 vm->usm.asid);
> > +					 vm->usm.asid, true);
> >  		if (err)
> >  			goto wait;
> >  		++fence_id;
> > --
> > 2.51.2

