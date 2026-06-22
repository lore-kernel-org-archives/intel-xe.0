Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E1CCDB471
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jun 2026 15:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F0410E750;
	Mon, 22 Jun 2026 15:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IxW956a3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4542E10E750
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Jun 2026 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782140758; x=1813676758;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E1KY+jjhV768Z562x+ZAiEpBHMwKH1rg7VdVUGJ3AQs=;
 b=IxW956a398MqUS1DI8oh9jqnzBfZrUihBMO/zz1TWCi46MFhDP60mp06
 UtwU2x6EhxNF2FjHkw5HItpxIyuRg7QIY00hA5MQuMDHI9wjXqkwSV1s4
 +2Xf6+QG6vXdwF20KxxmkcpK0qP868eGilg53G7az74Qjlpx8L17uf+Ak
 YG7XpGFwrvdFkKCocfcNjg5cPzrSufneJH/emydVcnQkEB0vmgQ8HRKmx
 gaGFEDq5oNUFVNq+rmIMl8KljWb0IPx/40qjguSzKxOJ3NX24ulpqJgSp
 T5y+Gfk9YmNJcz357wjSpTlB8DsE7AnzoKFcJLOWIyC9sbDhHU2fobzw+ g==;
X-CSE-ConnectionGUID: hhGxbl8aRcWfy25TzTNLyg==
X-CSE-MsgGUID: swkXHoNfTeq0AjXiYiglrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81976843"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="81976843"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:05:58 -0700
X-CSE-ConnectionGUID: gMYllJpbRZytt6YjSa6p0A==
X-CSE-MsgGUID: V9S9GxuPQSiWk3fupBnI/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="253145616"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 08:05:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 08:05:50 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 08:05:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 08:05:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LgExNr+cZLXGpaS6lwk/KByxW5FnQvw8sRlIakAARkF9vOj6NiwQg1hElXSNzb2rkSOuFeDISiWuE9bljdF7BbUYnl+Zy6dpyVMP9HWDBsQa0+/O004/BEHWs4KU1eoJ4D0sp3mU+c9i55Y2p3xdtFArS07kOH2H8iv+IGMABDd1hgbPpMJShSY/q6gqEJriVwkFNlDh0rDut6sNAfLHbhyLZAldgDH1wC+poHWvFltjSzrz90DNfkAqEzW7WJrdH1t6OZU4BlJFzPrUVBo8YAZORTGLF/WrAcgXOlRfjEwv3il6jbKehz5a62ZUyNnMQPzBmwBfigNEAlAXrpB0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZFWvpNgm6A5lzD/NkmE/ek4bF8JQvR+l6AVTTXW4UM=;
 b=hcJDX2GWIouTrGsZVRMNLqnUHmcnD5+FUnH2PJWlOCpqR85IcKbLC7/8VfeJ/YoG0y09nyZ752CuCr/owN6yF9bjzLzKoTrBinyyqbu5Au7cnF8AATZu+PBgmnn7bxZmLJi0DQfOtVH+jqqJevL0sqRN1vBhjnA7KDzgVet6WIqGE0nuSVWgLRGP9eKaXp/i4GTxnUrwboCdXCplPaZ+IPu7o8u+UtDYQlrNElAdh/459nWy7MieoY/ItUkhh0ibo0a+xtRywo9recemD3Uj21tP0/u9gtreiWzFwbsSNmHcuR9rTlFhdiB0/MMLcJv4sof8AWfvjhgPDw69J2PMxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by MW4PR11MB7103.namprd11.prod.outlook.com (2603:10b6:303:225::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Mon, 22 Jun
 2026 15:05:46 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::b831:13bc:a1c9:2628%6]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 15:05:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>
Subject: RE: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
Thread-Topic: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
Thread-Index: AQHc/98pp4Eg1BpJB0ec8UAQrniMYLZKsLKw
Date: Mon, 22 Jun 2026 15:05:45 +0000
Message-ID: <IA1PR11MB64184D94FBA0BEDC0D4BB166C1EF2@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-3-karthik.poosa@intel.com>
In-Reply-To: <20260619114018.667995-3-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|MW4PR11MB7103:EE_
x-ms-office365-filtering-correlation-id: ed1852f0-043c-404d-d6fa-08ded06fbc9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|38070700021|18002099003|22082099003|4143699003|5023799004|11063799006|6133799003|56012099006;
x-microsoft-antispam-message-info: XztbT6kybC+XH2wtihVRcjyOI6dwiIyNgjwrrJaKCM+uv+yZKCGx29AzoPqqAoRMznK6nOUL0FHjRC+pk9GoyItXlV/o5qcrWgW0+LM7qGSscVkVc8/LtU+zE7CjOdVpbiCaKQ/LAOlkklpIsDRvlZbOPq/25z9zNx3rzv84+0iy3LwQVLh0q1EA2OvtG0zPFQiCBjIBppYUhbnseZjMDTgKKz6FB8UTTjQyloQCoQ4zgYGYdUyzzvQbqx+X2CxjNJnbXs5ivJpEdToORvJLX3Fj8R5ja65ON6D6kyb0nKEZjYJ6LUUfJBKJbb8xtkbCBiWRTZ/6y27jn6hGULZVUhKKV5OmjtxjsUUoHk05UpmrzigytpGDyES9RyiAuPj1PPiALUUXnvpI880tRnurPm2xrkEStOVxdDmIKieLCH//v5r9AAlvVYpQgVjdXHOa6x5q/pX70ObM1SKf2ERklytl5y0Wx7NknECMpl1KUtwHbZ3RBQv4L6PmaRqrI6iTuSGU/AZ/jOiub8Pl+SuqF/jEgmxQGzMxNbdqsK1cUyP9VgzIRnNZzLyOUAkqDhv/eATlUjC/meL+Kz1TBEW4p7MwhB4zotrtI/ORd6d66uBrlpkOILPtt9HRiDPzE1v88Yf8SZmAhyqELiDjCPfKloAsdMn5XxNcfPhukgVUpd+674RzQy3fDAPqR2/SwBfqWfz3aD4qUXCVgIe0au2YUuAJbph/tHq1f/FakDHschg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DPv8kvNB33ziEzriRaJRZbi4mu421V4HGXyqJYDwB3CESWzg3Wij0k1DR+Bd?=
 =?us-ascii?Q?Fx8JFpLjKYHpf57t76s6BCV3vt0CXr90BRgB26blrCmbdGWae+ezwRsXmW/D?=
 =?us-ascii?Q?vpH82bASWKT7s8kaSeuihMR05ZyhwRDe0yo2J1CYQ318tAMXcJASUVdlXTlj?=
 =?us-ascii?Q?MCQATaZbz49DLoie4bL9nJS2SNm1rRZhwisKaQyukAdkWD+1iycVH+vExRYm?=
 =?us-ascii?Q?Wn1gDgltuflTwncgRF3uqmf8XDp9CHRDOKLzRgF7CLUOL/bL/QFUTj0l9ReQ?=
 =?us-ascii?Q?/F/fmQNYu2zBtK0qSgonVtTJ5MRqye5n7E7N6ZJ29I6HKrmU7P7eynNb5SPa?=
 =?us-ascii?Q?DfeYlH/7U9oTHcz6GBj4XwvCwI7jT15qGQ9ErnIyS+arAH8+j5iFtCUGfa0O?=
 =?us-ascii?Q?rQYKNuVuapNQIu5vuuvH0YiufJyVJOV1QYyC/igCBpZcqXk3k4eikX83Kks0?=
 =?us-ascii?Q?sytrHUU3u17gMyxOBtZNLXWBD9eXOGW5Xi5RXLLfSfVYDINMLNMB2hboo9Vb?=
 =?us-ascii?Q?URHZ3hVM5PvklstnbKnNgV9D4F3fGdh0f0UzWo3FHsfR63Ner6Gm34cJP1N4?=
 =?us-ascii?Q?nt9m1NJEtN4eLeRsrjDZo+26LrnXK2HDWRfNL4lQG1xj7wNsvjJyikF30tex?=
 =?us-ascii?Q?pX2IBwJ1wK++Q0Qn+XuDYPU3DUCB7K5aSf+0wtGMzIt7NNMGHwtkDV14C3Mh?=
 =?us-ascii?Q?mQO29mhOdvNoGBVGRzjKLNlordseDmVrE3Kr9aTstohS8u5QL/bT9dZPqwU1?=
 =?us-ascii?Q?oM3LFFQud4ItmCY9ru8M8mh+A21+fjyzIAW+zOb2UPJPzfR41Gc7VK/X+nsW?=
 =?us-ascii?Q?3ppkuj+wWgrF3da4gi23r+Hxso3B8toeiu3x2m5STj+w/91zOkhWR1GOqWgQ?=
 =?us-ascii?Q?FALF9yPR0kW/E0ZgQBVRCkO9N4rCL2/wOhaSSzAkXWrvHavCQtZazwimwUj9?=
 =?us-ascii?Q?zsUxsTcF7Di2lwIUEfMg8fjYihU9nGNQ3j8jLVUnA/OsNWrUY8VhsA6KqaEi?=
 =?us-ascii?Q?7zwqel6IPnj5vrMsw0HozTekVAM9CeeCh4qgmrmAs3QrnCEQQ140Y0mD1LX4?=
 =?us-ascii?Q?v+1Xsd8M7X5gH7n7UKH2SzR0cENwPvJhCpGzhuxVFSPz7Y9QSMjfTdRp7jyA?=
 =?us-ascii?Q?Q88D+aoWSYD6pHbNUlJjHlnj1TQGapwpBRsOMMIRdZ7NkL39GKj4iI0InTzh?=
 =?us-ascii?Q?d/E4sfyfWSj3Wh1I+CI7/yd+z1bfgSvEnDrw4078+LBWp3+byMCZ6BQrfOhW?=
 =?us-ascii?Q?cS8z4J2pJYUJmHh2DIcyI9/rZ8cp0ixzAcm/30qSldyw9TPYeS6u0T6mSTVl?=
 =?us-ascii?Q?1UhxqYkeQ5ma14pf5ydxrizuhn0I+ChD5AstKUrnzWNvgBYZwOrWtwAz7DCt?=
 =?us-ascii?Q?rtfc6L1YtlI+2gnfdsSKFnEthloMiERtC6lg4Zj/m4i0/9lWCgxKX5YErD7J?=
 =?us-ascii?Q?zc8qHXK+UfNdxFUETCt4oG8mGni8x26vPgBBrHNbYQjbHkz8s1Zd5fLfYBqj?=
 =?us-ascii?Q?uLf+Eew4PJCnnXagiYTT0DOx3MUOarT26Jj+CchK3Ya9b5X3+Ou//HomLYkT?=
 =?us-ascii?Q?c8Aj07DSP5HlttbqK95LNwOZYpnSu20ybzIDmn5IKBoaHz7BQKO6kcG2IuE8?=
 =?us-ascii?Q?QPkMtNG7wISUjxR7r8+ZZG+TVbnoCVJ03+DfHV7ShdOojM6L8uALvOncEXVZ?=
 =?us-ascii?Q?0dPj+Eqp5+fTdXRpLLJV0ktq2q6qsTueYyHgnTi4VHnww0J3zmn3KrFZVuOa?=
 =?us-ascii?Q?JW3hX6Xc5Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: fSH26S20dmQXs174KOSNouGl/PeSgsThiwnIG4kjSjJM6gRdwjXXrg1dok0NH8mFZmrYgiBs67YoRraEA1wOGYWupx37oAwBJUpIHF1pZDjaZGhNcr5nHKDay/MmRHZ9bl03+IIcBQ0GZ9srGxXf43eiBb7z6IGOua2tKioJ7L6wLmKp/+AXXQFjZ030klHMorymLnPl9DBNzA/LtaqYZpqxZghppkNUoennTFGleLA7f48YyKq8rv3RYmS9Ot7eYNvVpmGck38Zi661p+aHum4ZIivRPYOipl4eLlouNJ2TsJ3HM92h865ilok5JIr9JHVZsgxjuIdy/7h4wCLaog==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1852f0-043c-404d-d6fa-08ded06fbc9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2026 15:05:45.6701 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rv9rCscogFbZTaP8eWzzg5Hfu6Aa1qjhfSJDAKtIGNQb3ULcrTPNI6HdTwcnDKEUO2efnGFOTa4B+l0OAKa+UeZ6ECjucG2OKoBfs9IkSkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
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



>-----Original Message-----
>From: Poosa, Karthik <karthik.poosa@intel.com>
>Sent: Friday, June 19, 2026 7:40 AM
>To: intel-xe@lists.freedesktop.org
>Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Gupta, Anshuman
><anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
>Ruhl, Michael J <michael.j.ruhl@intel.com>; Roper, Matthew D
><matthew.d.roper@intel.com>; Purkait, Soham <soham.purkait@intel.com>;
>Poosa, Karthik <karthik.poosa@intel.com>
>Subject: [PATCH v4 2/2] drm/xe/debugfs: Add debugfs for pcode information
>
>Introduce a pcode_info debugfs entry to report pcode details.
>This initial implementation exposes the pcode version.
>This can aid debugging when the pcode version is needed.
>
>v2:
> - Enable the debugfs only for supported platforms. (Micheal Ruhl)
>
>v3:
> - Move the platform check out of this patch, as it is not relevant here.
>   This patch solely enables debugfs; debugfs creation will be determined
>   based on the return value of get_pcode_version. (Karthik)
>
>v4:
> - Skip creating debugfs entries for SR-IOV VFs, as this is not
>   supported. (Matt)
> - Reintroduce the platform check during debugfs creation to prevent
>   creating debugfs on unsupported platforms.
>
>Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>---
> drivers/gpu/drm/xe/xe_debugfs.c | 34
>+++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>b/drivers/gpu/drm/xe/xe_debugfs.c
>index 22b471303984..cafe3deb04d5 100644
>--- a/drivers/gpu/drm/xe/xe_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_debugfs.c
>@@ -31,6 +31,7 @@
> #include "xe_tile_debugfs.h"
> #include "xe_vsec.h"
> #include "xe_wa.h"
>+#include "xe_pcode.h"
>
> #ifdef CONFIG_DRM_XE_DEBUG
> #include "xe_bo_evict.h"
>@@ -161,6 +162,23 @@ static int workaround_info(struct seq_file *m, void
>*data)
> 	return 0;
> }
>
>+static int pcode_info(struct seq_file *m, void *data)
>+{
>+	struct xe_device *xe =3D node_to_xe(m->private);
>+	struct drm_printer p =3D drm_seq_file_printer(m);
>+	struct pcode_version version;
>+	int ret =3D 0;
>+
>+	ret =3D get_pcode_version(xe, &version);
>+	if (ret) {
>+		drm_warn(&xe->drm, "couldn't read pcode version ret %d\n",
>ret);
>+		return ret;
>+	}
>+	drm_printf(&p, "pcode version: %d.%d.%d\n", version.major,
>+		   version.minor, version.engg);
>+	return 0;
>+}
>+
> static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> {
> 	struct xe_device *xe;
>@@ -221,6 +239,10 @@ static const struct drm_info_list debugfs_list[] =3D =
{
> 	{ .name =3D "workarounds", .show =3D workaround_info, },
> };
>
>+static const struct drm_info_list pcode_info_debugfs[] =3D {
>+	{ .name =3D "pcode_info", .show =3D pcode_info, },
>+};
>+
> static const struct drm_info_list debugfs_residencies[] =3D {
> 	{ .name =3D "dgfx_pkg_residencies", .show =3D dgfx_pkg_residencies_show,
>},
> 	{ .name =3D "dgfx_pcie_link_residencies", .show =3D
>dgfx_pcie_link_residencies_show, },
>@@ -567,6 +589,18 @@ void xe_debugfs_register(struct xe_device *xe)
> 					  &inject_csc_hw_error);
> 	}
>
>+	/*
>+	 * Pcode version read from PMT is currently only supported on CRI and
>BMG platforms in PF
>+	 * mode, as both platforms support the necessary telemetry read
>mechanism and have a fixed
>+	 * PUNIT_VERSION_OFFSET.
>+	 * Attempting this access on other platforms must be verified before
>enabling support.
>+	 */
>+	if (!IS_SRIOV_VF(xe) &&

There is an IS_SRIOV_PF() macro, is there a reason for not using that?

>+	    (xe->info.platform =3D=3D XE_CRESCENTISLAND || xe->info.platform =3D=
=3D
>XE_BATTLEMAGE))
>+		drm_debugfs_create_files(pcode_info_debugfs,
>+					 ARRAY_SIZE(pcode_info_debugfs),
>+					 root, minor);
>+

Other than that, this looks reasonable to me.

For the patch set:

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

> 	debugfs_create_file("forcewake_all", 0400, root, xe,
> 			    &forcewake_all_fops);
>
>--
>2.25.1

