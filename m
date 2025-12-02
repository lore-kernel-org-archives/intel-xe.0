Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A793D12688
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 22:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191F310E68F;
	Tue,  2 Dec 2025 22:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOqC6cfw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05C8C10E68F
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 22:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764715917; x=1796251917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EeircqJShOY6EG4kMhxCxa7ZRPFUADV1FbsFFnXb6+A=;
 b=fOqC6cfwxB3MayPtvRVLnVi3EilnHZwJgNF3YJv0evnt40upiL2Jh0NT
 g615lxbSiawZ77Y3vJKQsEKfZOITERzXwkV7uxCjr/Xj449x3aKlx2QdZ
 1T3NQhLliiLePq9vLTr5Qyn5RNbpZy9z4a7siIy8VmfZ0ljXIWYO29pD7
 cx5gF/aCl3P6u+00GHR6YAck8LIiV1ex37PMcrx75WPNYA2jeZkTQyEyM
 Tfh3/5qAECquCdy94A4LuOLd0aE1G3bIZMguV5w0lR6fqdvEIN9lIrl/U
 4kF/j74CPEKoQfMDgv+icFC2dQyu01BQhtfohXwc2v8hZJm5yRZOjzwAx w==;
X-CSE-ConnectionGUID: DvJ8oFCfRhC257+ZABHeqg==
X-CSE-MsgGUID: 7v6EWte0QhqDIBYbkmVG5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66421178"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66421178"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:51:57 -0800
X-CSE-ConnectionGUID: 3KEc1Ec3QL2Df7UqL4KyJQ==
X-CSE-MsgGUID: h4DcyrC1S/a0TdLwJXAhMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="198918208"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:51:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:51:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 14:51:56 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.61)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 14:51:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eueKBM1cIM2E/lMQeFVF+cfyPiO6E+TOIurt2WIzWZ2/0zlx2XCwxrkSZg0c42yZO0dOTC43tqUBRtp53xTNvkMw+Z2jxwDIhttgDdwBj5qQuF3N1HnJ7cuOcYVytItyxO4aPzL1rXQr+6DUE5BZ89oy5UzKfLePgpwUW1Ys4GwvryEb105C1MFh71buopWVc0KyKwNRvLVn/gngSzXBtjKk/coV58MmI/vwMp8ysDPeMV3tvnVOuG76zFl3hb6ExuO1zdk4n3q3pZyn4QPhKQshEKWVJnkxSVZdfK3r/qK3M3FoddqOtU6jNcbEYMQI7OgURi8FTpqAtkS2CfYexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R7ksoJx5wc8T+aVVJxDBYsA9jJF55VpExyc72gHX7yI=;
 b=Y9BWBxxqo69XyqGGDEqFQhiSBCJu03NwP3AnLcji+ojL3cX3FyGVt9eWwoCY0iZUdiVfarG7bnsW5sB664Ldljgf8kVSwDjN4s2S/OGfgXDFhbmYEl6xfWNm1Np1nFCPOURPyRz4DTLbb9j5oamd1JagmXeEXhh4WwcpyOE/ZihXaRurAYbvUY4z/vGajcm0jjiSHuZTrh1sSNKyxj+E7PnfCeERNW5KirVdpYJwZ9OhhUlaC1dg+Ted9R+LALdYSirS2PRPK2KE7P/o6ZZwVZIQPXWki0+6wTywZ95KwwqY9qTLBQ65IUXykrCJQpIKvl3X93uW5QOnxT0dmFYUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SN7PR11MB6702.namprd11.prod.outlook.com (2603:10b6:806:269::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 22:51:54 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 22:51:54 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Topic: [PATCH v2 11/11] drm/xe: Add debugfs support for page reclamation
Thread-Index: AQHcXyjMdpLZL6cdxUWEE4cMYIhuBbUO98mAgAADErA=
Date: Tue, 2 Dec 2025 22:51:53 +0000
Message-ID: <SA1PR11MB88390FA6405D467DFEF90266AAD8A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-24-brian3.nguyen@intel.com>
 <aS9oK/4y0NQM1w/l@lstrano-desk.jf.intel.com>
In-Reply-To: <aS9oK/4y0NQM1w/l@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SN7PR11MB6702:EE_
x-ms-office365-filtering-correlation-id: 647bb2ad-0106-43a7-929a-08de31f5639f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?gNE6Xq/QRovhZo5Yk8IK3jjgxyYu27ygxFzBv5MkmoGAPiGWedDMu+EiUy27?=
 =?us-ascii?Q?ebwe4f3gEkZsXhZ+AqeRjGGqgxkR3oiJ4+veLJi4klUvuScVVm15hL5DXfyH?=
 =?us-ascii?Q?3gjUdxndjKHd2ijXnH5QPsIV7YOrfjzSKTD196zjKKUFBVUiT4SIM3MeWV/Y?=
 =?us-ascii?Q?U8HqeU+6L4hCJauCRiGksgQZiL64YHLJxMLF9KaPUl2IyxB7zJHUn1S9hHL9?=
 =?us-ascii?Q?daN27Egpx3HXscRpA1rV6x236jsLJUtFvS9NnfKix1Cy8vdcoiCLnESv+Pgd?=
 =?us-ascii?Q?R84dhHng+4oEvbx72e985I73aoEZ+cHFsZ/Zt78XWPQZwMfAWzKNEJB6wQpZ?=
 =?us-ascii?Q?UJfPsP9QmsM9OKC6JXQ0LLVZ9wgXTI2LXYC/vYzJIsYxnHcrPcQm3pLbpIQY?=
 =?us-ascii?Q?sbcJ4Ne8DZDtUWEsIt8UnshWLigtzMTd+FjgHLTPdDKGRe+QdBNJjWV9pSQf?=
 =?us-ascii?Q?vwtBX+uuAFsMGYFux3Pjon04nKD5QskRR2+t9KKvePwo/t4RxTfYoZ62c6Ng?=
 =?us-ascii?Q?U+BtFw9uz7oJvArvzTvs/12mr8yLTYig5CG2d7isEr/iLwFwr5JPCGfPrum0?=
 =?us-ascii?Q?PA2wkWvJoGFa+DKnodEm/JqH8dXOXKTMjkcoiF25GBt35ZzBRGeoAMAhjnht?=
 =?us-ascii?Q?KAKw5qPl8YgA65TdmkAZbBko4+1X608S5P699ETWhENNRxUevlTS7UkARIFz?=
 =?us-ascii?Q?hXTPTNp+q+oY5C0Sl9VwLgjR4UVxmZAY46/I9jLXWwBtQGUMLXUd8JMXxSjr?=
 =?us-ascii?Q?nWqbGzWMwsJ0/cNpZHaIeSoHrU9nqu8x5HPC3eXzrO0axXGxLiwmk3X+I0Ax?=
 =?us-ascii?Q?WpfBvhpO/G+wAhQVUxNo4XPa1aRzsRIpZFBOD8Ydd6kBQzGa6J6w+1ZuBNrV?=
 =?us-ascii?Q?TPkiI8Che4zSxCLL/+2xVVV/PlgJHaqvyO5xowZudL5KTpsLLY5j4nF1dAg6?=
 =?us-ascii?Q?eH67bL/t445kC3TGKnqKwmoKDv0Eui8+TKKsAg/HG8vQCIs0WeCGGodK7Y5o?=
 =?us-ascii?Q?pjlMDtP6MDz2dCUGlBB+IDaPn5c7jRInJ6r8kOCYlYhfxY5dKrvahysx0PVy?=
 =?us-ascii?Q?vEzsbn2gZLNk2b18YobV+P3+qxWhw9s4ggLGx0EPlq9S09Ikws/+2zR9qIvk?=
 =?us-ascii?Q?ilqY7etGOIB0uo+KbSbzlNjyfmH6IYsYxwFSGWU0y/NcqOgUov7+psuBfZ5p?=
 =?us-ascii?Q?+qeBprN26YBo7etWyfePsDfxRPQjJPHM50RrQvIw6xtcC4plKA3rxiUZX3Er?=
 =?us-ascii?Q?42Ooi8uh5DUNkqj18xgVHJ7YMFm1fmruJ00taGwr3OyvhciapwRpbVUYsLaa?=
 =?us-ascii?Q?1rJIay95UotAkvRvznYlVMbJgNc8PO+3x2sz85X4yK6zL/JIdUmEWekKQYPb?=
 =?us-ascii?Q?03R1b/qOlKXT0JMLqdUdOD+Si0m3I1cMCuE4h3cKlIBnF8rpQATXLP2KmWSR?=
 =?us-ascii?Q?kMrbQg4LpyMto2ttM/zhdy5gJ78Z5vj6I9tquHudJ1qnfgqPxnLR7SswDXXD?=
 =?us-ascii?Q?aitgc9tIk0XtiHi/YR9lRMK8+x7WjgRRYQGD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1aruehA9QV+WVaBBWmmJ/OIeIh/KWYZ4gQRIGDdVLtbMXD0Xa+8HmhyQG0xM?=
 =?us-ascii?Q?MMpSAmkQg8qN+Al9T3uK6g+0ujmLNu9uPr4b3y9ZM0PKyHZzkCbpUja9iTVM?=
 =?us-ascii?Q?O7J19/0UDpL//dDl+xBwYulrkz1B1fkTdc74X6PBw9udZfIvf5CJLLTt3kmx?=
 =?us-ascii?Q?Y0lSq3TuC+bBNJVpirnsiURtHe0nGDKZsW7dkk18xhYfZLH5yBZz1V/rhTwK?=
 =?us-ascii?Q?lxGSTynguGStd/1jB3X33O6yfCbOfBRqYYezC0ksPL3gmqlXETHAjIcaARsO?=
 =?us-ascii?Q?OfsGgxBJmUcNTZF9cY3nHb/uj2OqfwSAQXzUDQ8KutiPPsoy46vsPMI8Hqfv?=
 =?us-ascii?Q?gQcSCzJjLwFBt6kuH+fMVcBSjAlRNFAxWqY9PcTn73MP2AddhBxO3dlP02yc?=
 =?us-ascii?Q?nPfj1saSU7TKSE11s4YraG2Lpxvls1qt3vK3PqFqRiJYo0Zi14Da+maJ+J/L?=
 =?us-ascii?Q?q10h4hSKOp7+rsE9mstNv30PA2g4QZ2t7rGiWYDF+4r80nLgM0WmKsGwrQGM?=
 =?us-ascii?Q?FnBiD8rd94sq65hTcagcVwrWodeGKiNygvKsq/y7RhIxHXmfkOO/ZQIv7iWH?=
 =?us-ascii?Q?FGCrY3Kts6lJoEl7TSqMMUYHCquUr+/HoabfbEr9NkJFz8FM5uh45MCV8ssP?=
 =?us-ascii?Q?bh3Mv8CaW87WPchTC6QNFcq0GWxh0lxN2Bs6Xuc5l/3WNDlgzBiA0HI1ZvcM?=
 =?us-ascii?Q?4dSSfGeofIidtPKxMUnh/OjQLRB0tK8TQ4RiG96OUHWoH4I6qN2bPbFrcdBM?=
 =?us-ascii?Q?LkrohqQ/+DeOnoRm569oe3Ry5bSD9Q+ScxfU313jQNbvUKZ55Ft8yMQCkRAg?=
 =?us-ascii?Q?Ja7qreqipXA2mKjpZt7kJFBSezz0uOTSYI0cGdmYYQt4ZiZvd7Ckd1smGdLM?=
 =?us-ascii?Q?35E0pNUP6T9O/I2UzzmlqdDX1Q0cyu4r6srtHiKmg2qLKHe46lpddwcYYg2P?=
 =?us-ascii?Q?Uj12890h5r+iF7QbJX2qjypAJJFXwqSu+ri0+UhsO8KG9NJdatUmnaHYPkPk?=
 =?us-ascii?Q?xA4cFejCkkbxs12lGaoL8sHMnYRg0f4z0j8KQHOAB3esVok8u6TzQxVZjsnh?=
 =?us-ascii?Q?eJcPaFeMwKaLX/zDbZVkCVsXBEzVTchXzNs7Pwj46LO6kZ0W/lqRmFKI3g56?=
 =?us-ascii?Q?omb/34naotws/hcC6N2giTC+TpEz7YtOHNhh6Jz9PKFd/6GIvURegun7Oxec?=
 =?us-ascii?Q?tanGCG5Kae+gILQ6lvZh9q29Iw8JnX52+hcCcMwtM3RkMXbnwE5nvTH4qD8M?=
 =?us-ascii?Q?1903ummyY4BFhbyrx6mjCPAcyKxkIDOiRMLn6qo4mupob2LItimlwq+WtDUN?=
 =?us-ascii?Q?pmcMBmc/46azrBoEpHje+HtzBxyl+XSK8LGHPp6D36oZAy/e5U29qXuvlb0q?=
 =?us-ascii?Q?SYQ7owdxzy9/za09N33DQUR2eMoidwPlYShSaxfMo3c6xUOH1VJ/kl0k6X2X?=
 =?us-ascii?Q?xHyZL/ERNf56MIm3V9VXWbu8wXr80mxfd+Meqo7vsHhalQqmtOx0bpy4GbtW?=
 =?us-ascii?Q?2YgYe9g3xGvErknH/+KS0ECkxW3ic3Kq2O9nKiN+g/pJx2/FyCCyagajzHQZ?=
 =?us-ascii?Q?2+b+NpWX3hmw19x+qI7uoBdy+TqAAzp4T7i5s0Xr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 647bb2ad-0106-43a7-929a-08de31f5639f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 22:51:54.0764 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCR9Vxu5AQerqyjehp7+4/fXhC6nG4dB3AMHfkioHblCk5PKBFUtLoQiOG+BrctghmZe/n9HzAL322ycFa6iEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6702
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

On Tuesday, December 2, 2025 2:29 PM, Matthew Brost wrote:
> On Thu, Nov 27, 2025 at 07:02:12AM +0800, Brian Nguyen wrote:
> > Allow for runtime modification to page reclamation feature through
> > debugfs configuration. This parameter will only take effect if the
> > platform supports the page reclamation feature by default.
> >
> > v2:
> >  - Minor comment tweaks. (Shuicheng)
> >  - Convert to kstrtobool_from_user. (Michal)
> >  - Only expose page reclaim file if page reclaim flag
> >    initially supported and with that, remove
> >    xe_match_desc usage. (Michal)
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c | 41
> > +++++++++++++++++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c index 1d5a2a43a9d7..296b8136511b
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > @@ -291,6 +291,39 @@ static const struct file_operations wedged_mode_fo=
ps =3D {
> >  	.write =3D wedged_mode_set,
> >  };
> >
> > +static ssize_t page_reclaim_hw_assist_show(struct file *f, char __user=
 *ubuf,
> > +					   size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe =3D file_inode(f)->i_private;
> > +	char buf[8];
> > +	int len;
> > +
> > +	len =3D scnprintf(buf, sizeof(buf), "%d\n", xe->info.has_page_reclaim=
_hw_assist);
> > +	return simple_read_from_buffer(ubuf, size, pos, buf, len); }
> > +
> > +static ssize_t page_reclaim_hw_assist_set(struct file *f, const char _=
_user *ubuf,
> > +					  size_t size, loff_t *pos)
> > +{
> > +	struct xe_device *xe =3D file_inode(f)->i_private;
> > +	bool val;
> > +	ssize_t ret;
> > +
> > +	ret =3D kstrtobool_from_user(ubuf, size, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	xe->info.has_page_reclaim_hw_assist =3D val;
>=20
> This does seem a little dangerous as someone could set this on unsupporte=
d platform or GuC firmware. Should we maybe store
> page_reclaim_hw_assist_supported + page_reclaim_hw_assist_enabled in the =
Xe device and only let page_reclaim_hw_assist_enabled
> move to 1 if page_reclaim_hw_assist_supported is set?
>=20
> Matt
>=20

I had a similar check in my first patch, but I believe this is prevented no=
w by not exposing the file on initial xe_debugfs_register.
This should handle both the unsupported platform who is always false and Gu=
C FW version check, which is done currently at
xe_guc_init, earlier in initialization than xe_debugfs_register. Is there a=
 missing edge case here?

Brian

> > +
> > +	return size;
> > +}
> > +
> > +static const struct file_operations page_reclaim_hw_assist_fops =3D {
> > +	.owner =3D THIS_MODULE,
> > +	.read =3D page_reclaim_hw_assist_show,
> > +	.write =3D page_reclaim_hw_assist_set, };
> > +
> >  static ssize_t atomic_svm_timeslice_ms_show(struct file *f, char __use=
r *ubuf,
> >  					    size_t size, loff_t *pos)
> >  {
> > @@ -397,6 +430,14 @@ void xe_debugfs_register(struct xe_device *xe)
> >  	debugfs_create_file("disable_late_binding", 0600, root, xe,
> >  			    &disable_late_binding_fops);
> >
> > +	/*
> > +	 * Don't expose page reclaim configuration file if not supported by t=
he
> > +	 * hardware initially.
> > +	 */
> > +	if (xe->info.has_page_reclaim_hw_assist)
> > +		debugfs_create_file("page_reclaim_hw_assist", 0600, root, xe,
> > +				    &page_reclaim_hw_assist_fops);
> > +
> >  	for (mem_type =3D XE_PL_VRAM0; mem_type <=3D XE_PL_VRAM1; ++mem_type)=
 {
> >  		man =3D ttm_manager_type(bdev, mem_type);
> >
> > --
> > 2.52.0
> >
